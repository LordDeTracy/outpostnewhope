#include "sim/units.hpp"

#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>

namespace outpost::sim {

void addUnits(Simulation& sim, Tile& tile, int32_t n, uint16_t kind) {
    if (kind == product::Truck) tile.trucks = static_cast<int16_t>(tile.trucks + n);
    while (n-- > 0) {
        Unit& u = sim.db().create<Unit>(ObjType::Unit, tile.self);   // s6:E2E0
        u.kind = kind;
        auto empty = std::find(tile.linked.begin(), tile.linked.end(), Handle{});
        if (empty != tile.linked.end()) *empty = u.self;
        else tile.linked.push_back(u.self);
    }
}

void removeUnits(Simulation& sim, Tile& tile, int32_t n, uint16_t kind) {
    for (Handle& h : tile.linked) {
        if (n == 0) return;
        const Unit* u = sim.db().get<Unit>(h);
        if (!u || u->kind != kind) continue;
        --n;
        sim.db().destroy(h);                                         // s6:E332
        h = Handle{};
    }
}

void clearUnits(Simulation& sim, Tile& tile) {
    for (Handle h : tile.linked)
        if (h) sim.db().destroy(h);
    tile.linked.clear();
}

int32_t countUnits(const Simulation& sim, const Tile& tile, uint16_t kind) {
    int32_t n = 0;
    for (Handle h : tile.linked)
        if (const Unit* u = sim.db().get<Unit>(h); u && u->kind == kind) ++n;
    return n;
}

void addExplorers(Colony& c, int16_t n) {
    c.explorers = static_cast<int16_t>(std::min<int>(c.explorers + n, 10));
}

void loseExplorer(Colony& c) {
    if (--c.explorers < 0) c.explorers = 0;
}

int32_t availableUnits(const Colony& c, uint16_t kind) {
    if (kind >= c.linkedCount.size()) return 0;
    const auto have = static_cast<uint32_t>(c.linkedCount[kind]);
    const auto busy = static_cast<uint32_t>(c.linkedBusy[kind]);
    return busy < have ? static_cast<int32_t>(have - busy) : 0;
}

void loseRobots(Simulation& sim, Colony& c, int16_t n, uint16_t kind) {
    if (kind == product::Explorer) {
        loseExplorer(c);
        return;
    }
    if (availableUnits(c, kind) < 1) return;
    int32_t& count = c.linkedCount[kind];
    count -= n;
    if (count < 0) count = 0;
    for (Tile* t : sim.colonyTilesInGroup(c, 30, false)) {          // s8:4E78, RoboCmds
        auto* cmd = sim.db().get<RoboCmdBuilding>(t->building);
        if (!cmd) continue;
        while (n != 0 && cmd->release(sim, kind)) --n;               // s7:CF78
        if (n == 0) return;
    }
}

void removeRobots(Simulation& sim, Colony& c, int16_t n, uint16_t kind) {
    if (kind == product::Explorer) {
        loseExplorer(c);
        return;
    }
    if (availableUnits(c, kind) < 1) return;
    int32_t& count = c.linkedCount[kind];
    count -= n;
    if (count < 0) count = 0;
    for (Tile* t : sim.colonyTilesInGroup(c, 30, false)) {          // s8:4E78, RoboCmds
        auto* cmd = sim.db().get<RoboCmdBuilding>(t->building);
        if (!cmd) continue;
        while (n != 0 && cmd->releaseIdle(sim, kind)) --n;           // s7:D00C
        if (n == 0) return;
    }
}

void retaskTrucks(Simulation& sim, Colony& c, int16_t now, int16_t before, Tile& tile) {
    if (now == before) return;
    const bool giveBack = now < before;
    int diff = giveBack ? before - now : now - before;
    if (!c.roboCommands.empty()) {                                   // colony +0x210
        for (Handle h : c.roboCommands) {
            const Tile* rt = sim.db().get<Tile>(h);
            auto* rc = rt ? sim.db().get<RoboCmdBuilding>(rt->building) : nullptr;
            if (!rc) continue;
            const int k = giveBack ? rc->returnRobot(sim, diff, tile.self, product::Truck)   // s7:CC44
                                   : rc->assignRobots(diff, tile.self, product::Truck);     // s7:CE72
            diff -= k;
            if (diff == 0) return;
        }
        return;
    }
    // No RoboCmd: the SeedCommand's tile (type 11) holds the colony's trucks.
    for (Handle h : c.tiles.order()) {
        Tile* t = sim.db().get<Tile>(h);
        const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
        if (!b || b->type != 11) continue;
        if (giveBack) addUnits(sim, *t, diff, product::Truck);
        else removeUnits(sim, *t, diff, product::Truck);
        return;
    }
}

} // namespace outpost::sim
