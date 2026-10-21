// SCMove (s8:0C00, priority 9999) and SCMoveBas (s7:E8A0, priority 10000):
// robot kits and trucking. findings/08-simulation.md §2.14.

#include "sim/building.hpp"
#include "sim/ledger.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/units.hpp"
#include "sim/vehicles.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <memory>
#include <vector>

namespace outpost::sim {

namespace {

using data::BuildingGroups;

constexpr int kSmelters = 1, kMines = 2, kStorage = 3, kWarehouses = 4,
              kFactories = 5, kUGFactories = 6, kRoboCmds = 30;

// s8:1A30 for trucks: trucks carry 50 units each per turn (trucks x 100 / 2).
uint32_t truckCapacity(const Simulation& sim, const Tile& t) {
    return static_cast<uint32_t>(countUnits(sim, t, product::Truck)) * 100u / 2u;
}

// s6:45E2 / s6:478A: a storage tank holds 1000 units of anything on its
// tile (every Bas entry counts). Negative room wraps, as in the EXE.
uint32_t storageRoom(const Simulation& sim, const Building& b) {
    const Tile* t = b.tile(sim);
    int32_t stored = 0;
    if (t)
        for (const auto& [res, value] : t->bas.entries())
            if (res > 0) stored += value;
    return static_cast<uint32_t>(1000 - stored);
}

// ── Robot kits (s8:0E78) ──────────────────────────────────────────────────

// s8:0D8E: the RoboCmd asks the warehouse for kits, one of each kind it
// wants, going once round its cycle, while it has free slots.
void claimKits(Simulation& sim, WarehouseBuilding& wh, RoboCmdBuilding& cmd) {
    uint16_t item = cmd.nextWanted();
    const uint16_t first = item;
    int free = cmd.freeSlots();
    if (free == 0) return;
    for (;;) {
        if (wh.quantityOfA(item) != 0) {
            wh.takeA(item, 1);
            --free;
            cmd.receive(sim, item);
        }
        if (free == 0) return;
        item = cmd.nextWanted();
        if (item == first) return;
    }
}

// s8:0E78 / s8:0E00: every operational RoboCmd visits every operational
// warehouse.
void robotKits(Simulation& sim, Colony& c) {
    const auto warehouses = sim.colonyTilesInGroup(c, kWarehouses);
    if (warehouses.empty()) return;
    for (Tile* t : sim.colonyTilesInGroup(c, kRoboCmds)) {
        auto* cmd = sim.db().get<RoboCmdBuilding>(t->building);
        if (!cmd) continue;
        for (Tile* w : warehouses)
            if (auto* wh = sim.db().get<WarehouseBuilding>(w->building)) claimKits(sim, *wh, *cmd);
    }
}

// ── Factories to warehouses (s8:1220) ─────────────────────────────────────

// s8:0F8C: move one factory's output into the warehouses. A full warehouse
// is dropped from the list for the rest of this colony's turn. The room of
// a warehouse is read once, and each item may use all of it (quirk Q38); a
// partly moved item loses that room from its units, not what was moved
// (Q39). Returns whether a warehouse with room was found.
bool unloadFactory(Simulation& sim, std::vector<Tile*>& warehouses, FactoryBuilding& f) {
    bool found = false;
    for (Tile*& w : warehouses) {
        if (!w) continue;
        auto* wh = sim.db().get<WarehouseBuilding>(w->building);
        if (!wh) continue;
        int32_t stored = 0;
        if (wh->isFull(sim, stored)) {
            w = nullptr;                                   // list slot set to 0 (s7:1DFC)
            continue;
        }
        const uint32_t take = std::min<uint32_t>(wh->room(), 100);   // s6:62C8
        found = true;
        for (auto it = f.output.begin(); it != f.output.end();) {
            const ProductItem p = *it;
            // IMPROVISED (guard): the EXE divides by the quantity and then by
            // the unit value without checking either for 0.
            if (p.quantity == 0 || p.units / p.quantity == 0) {
                ++it;
                continue;
            }
            const uint16_t per = static_cast<uint16_t>(p.units / p.quantity);
            if (take == 0) break;
            const uint32_t n = take / per;
            if (n == 0) break;
            uint16_t moved = 0;
            if (n >= p.quantity) {
                moved = p.quantity;
                it = f.output.erase(it);
            } else {
                moved = static_cast<uint16_t>(n);
                it->units = static_cast<uint16_t>(it->units - take);
                it->quantity = static_cast<uint16_t>(it->quantity - n);
                ++it;
            }
            ProductItem out{p.productA, p.productB, moved, static_cast<uint16_t>(moved * per), p.field04};
            wh->add(out);                                   // s6:6408
        }
    }
    return found;
}

// s8:11B0: stops at the first factory that finds no warehouse with room.
bool unloadFactories(Simulation& sim, std::vector<Tile*>& warehouses,
                     const std::vector<Tile*>& factories) {
    for (Tile* t : factories) {
        auto* f = sim.db().get<FactoryBuilding>(t->building);
        if (f && !unloadFactory(sim, warehouses, *f)) return false;
    }
    return true;
}

// s8:1220: factories (group 5), then underground factories (group 6) unless
// the first ones ran out of room.
void factoriesToWarehouses(Simulation& sim, Colony& c) {
    auto warehouses = sim.colonyTilesInGroup(c, kWarehouses);
    if (warehouses.empty()) return;
    const auto f5 = sim.colonyTilesInGroup(c, kFactories);
    if (!f5.empty() && !unloadFactories(sim, warehouses, f5)) return;
    const auto f6 = sim.colonyTilesInGroup(c, kUGFactories);
    if (!f6.empty()) unloadFactories(sim, warehouses, f6);
}

// ── Mines to smelters (s8:19A0, automatic trucking only) ──────────────────

// s8:13DA: the next smelter with room (s6:3C32: none when full, otherwise
// 1000 minus what it holds). Stops at a tile without a building.
Building* nextSmelter(Simulation& sim, const std::vector<Tile*>& smelters, size_t& idx,
                      uint32_t& room) {
    room = 0;
    while (idx < smelters.size()) {
        Building* b = sim.db().get<Building>(smelters[idx++]->building);
        if (!b) return nullptr;
        int32_t stored = 0;
        room = b->isFull(sim, stored) ? 0 : static_cast<uint32_t>(1000 - stored);
        if (room != 0) return b;
    }
    return nullptr;
}

// s8:1AC6: the load reaches the smelter next turn (SCMoveBas).
void sendNextTurn(Simulation& sim, const Building& to, std::unique_ptr<Ledger> load) {
    const Tile* t = to.tile(sim);
    if (!t) return;
    sim.schedule(sim.turn() + 1, makeMoveBasStep(std::move(load), to.type, t->self));
}

// s8:16F2: each mine with trucks on its tile sends ore, one kind after the
// other from its ore cursor, up to 50 per truck, into the smelters in turn.
void minesToSmelters(Simulation& sim, const std::vector<Tile*>& smelters, Colony& c) {
    const auto mines = sim.colonyTilesInGroup(c, kMines);
    if (mines.empty()) return;                             // "mineToSmelter->no mines"
    size_t idx = 0;
    uint32_t room = 0;
    Building* smelter = nextSmelter(sim, smelters, idx, room);
    if (!smelter) return;
    for (Tile* mt : mines) {
        auto* mine = sim.db().get<MineBuilding>(mt->building);
        if (!mine) continue;
        uint32_t cap = truckCapacity(sim, *mt);
        if (cap == 0) continue;
        if (mt->bas.empty()) continue;                     // no Bas table on the tile yet
        std::unique_ptr<Ledger> load;
        uint16_t ore = mine->nextOre();
        const uint16_t first = ore;
        uint16_t last = 0;
        int spins = 0;
        for (;;) {
            const int32_t value = mt->bas.get(ore);
            if (value != 0) {
                const uint32_t amt = std::min({static_cast<uint32_t>(value), cap, room});
                cap -= amt;
                room -= amt;
                if (!load) load = std::make_unique<Ledger>();
                load->set(ore, static_cast<int32_t>(amt));
                mt->bas.set(ore, static_cast<int32_t>(static_cast<uint32_t>(value) - amt));
                last = ore;
                if (room == 0) {
                    sendNextTurn(sim, *smelter, std::move(load));
                    load.reset();
                    smelter = nextSmelter(sim, smelters, idx, room);
                    if (!smelter) return;
                }
            }
            if (cap == 0 || room == 0) break;
            ore = mine->nextOre();
            ++spins;
            if (ore == last) break;
            // IMPROVISED (guard): with nothing moved yet the EXE stops only
            // when the cursor comes back to where it started; a new mine's
            // cursor (0) never does, so an empty tile loops forever. Stop
            // after one round of the ten ores instead.
            if (last == 0 && (ore == first || spins > 10)) break;
        }
        if (load) sendNextTurn(sim, *smelter, std::move(load));
    }
}

// ── Smelters to storage (s8:1940) ─────────────────────────────────────────

// s8:134A: the next storage tank with room.
Building* nextStorage(Simulation& sim, const std::vector<Tile*>& tanks, size_t& idx,
                      uint32_t& room) {
    room = 0;
    while (idx < tanks.size()) {
        Building* b = sim.db().get<Building>(tanks[idx++]->building);
        if (!b) continue;
        room = storageRoom(sim, *b);
        if (room != 0) return b;
    }
    return nullptr;
}

// s8:1B3A: unload into the tank's tile at once; what does not fit is lost.
void unloadNow(Simulation& sim, const Building& tank, const Ledger& load) {
    Tile* t = tank.tile(sim);
    if (!t) return;
    uint32_t room = storageRoom(sim, tank);
    for (const auto& [res, value] : load.entries()) {
        const auto v = static_cast<uint32_t>(value);
        if (v > room) {
            t->bas.add(res, static_cast<int32_t>(room));
            room = 0;
        } else {
            room -= v;
            t->bas.add(res, value);
        }
        if (room == 0) break;
    }
}

// s8:1482: the trucks on the storage tank's tile fetch resources 14..28
// from each smelter's output, up to 50 per truck from each smelter.
void smeltersToStorage(Simulation& sim, const std::vector<Tile*>& smelters, Colony& c) {
    const auto tanks = sim.colonyTilesInGroup(c, kStorage);
    if (tanks.empty()) return;
    size_t idx = 0;
    uint32_t room = 0;
    Building* tank = nextStorage(sim, tanks, idx, room);
    for (size_t i = 0; i < smelters.size() && tank; ++i) {
        const Tile* tt = tank->tile(sim);
        uint32_t cap = tt ? truckCapacity(sim, *tt) : 0;
        if (cap == 0) continue;
        auto* smelter = sim.db().get<SmelterBuilding>(smelters[i]->building);
        if (!smelter) continue;
        std::unique_ptr<Ledger> load;
        std::vector<int> keys;
        for (const auto& [res, value] : smelter->output.entries()) keys.push_back(res);
        for (int res : keys) {
            const int32_t value = smelter->output.get(res);
            if (value == 0 || res <= 13 || res > 28) continue;
            const uint32_t amt = std::min({static_cast<uint32_t>(value), cap, room});
            cap -= amt;
            room -= amt;
            if (!load) load = std::make_unique<Ledger>();
            load->set(res, static_cast<int32_t>(amt));
            smelter->output.set(res, static_cast<int32_t>(static_cast<uint32_t>(value) - amt));
            if (room == 0) {
                unloadNow(sim, *tank, *load);
                load.reset();
                tank = nextStorage(sim, tanks, idx, room);
                if (tank) {
                    const Tile* nt = tank->tile(sim);
                    cap = nt ? truckCapacity(sim, *nt) : 0;
                }
            }
            if (cap == 0 || room == 0) break;
        }
        if (load && tank) unloadNow(sim, *tank, *load);
    }
}

class MoveStep final : public Step {
public:
    std::string_view name() const override { return "SCMove"; }
    uint16_t priority() const override { return stepcode::Move - 1; }
    void calcMe(Simulation& sim) override {
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
            robotKits(sim, *c);
            factoriesToWarehouses(sim, *c);
            const auto smelters = sim.colonyTilesInGroup(*c, kSmelters);
            if (!smelters.empty()) {
                if (sim.autoTrucking()) minesToSmelters(sim, smelters, *c);
                smeltersToStorage(sim, smelters, *c);
            }
            dispatchRoutes(sim, *c);                          // s8:1C3E (vehicles.cpp)
        }
    }
};

class MoveBasStep final : public Step {
public:
    MoveBasStep(std::unique_ptr<Ledger> load, uint16_t type, Handle tile)
        : m_load(std::move(load)), m_type(type), m_tile(tile) {}
    std::string_view name() const override { return "SCMoveBas"; }
    uint16_t priority() const override { return 10000; }
    // s7:E8F8: the load goes to the tile if the same kind of building is
    // still there (s7:EA50); either way it is used up.
    void calcMe(Simulation& sim) override {
        if (!m_load) return;
        Tile* t = sim.db().get<Tile>(m_tile);
        const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
        if (b && b->type == m_type) deliver(sim, *t, *b);
        m_load.reset();
    }

private:
    // s7:EA50: no limit, except storage tanks (group 3), which take their
    // room.
    void deliver(Simulation& sim, Tile& t, const Building& b) {
        uint32_t limit = 99999;
        if (sim.data().groups.contains(kStorage, m_type)) limit = storageRoom(sim, b);
        for (const auto& [res, value] : m_load->entries()) {
            const auto v = static_cast<uint32_t>(value);
            if (v > limit) {
                t.bas.add(res, static_cast<int32_t>(limit));
                limit = 0;
            } else {
                limit -= v;
                t.bas.add(res, value);
            }
            if (limit == 0) break;
        }
    }

    std::unique_ptr<Ledger> m_load;   // +0x108
    uint16_t m_type;                  // +0x110 the building type it was sent to
    Handle m_tile;                    // +0x10C
};

} // namespace

std::unique_ptr<Step> makeMoveStep() { return std::make_unique<MoveStep>(); }

std::unique_ptr<Step> makeMoveBasStep(std::unique_ptr<Ledger> load, uint16_t type, Handle tile) {
    return std::make_unique<MoveBasStep>(std::move(load), type, tile);
}

} // namespace outpost::sim
