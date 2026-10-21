#include "sim/breakdowns_improved.hpp"

#include "sim/building.hpp"
#include "sim/ops_extensions.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <vector>

namespace outpost::sim {

namespace {

const Handle kRebelPlayer = Handle::make(ObjType::Player, 2);
constexpr uint32_t kOdds = 5000;        // chance c breaks with c / kOdds a turn
constexpr uint32_t kFirstTurn = 20;     // not while the Seed sets up

// A draw of the rebuild's own (splitmix64 of turn and building), 1..kOdds,
// so v1.51's random sequence is not disturbed.
uint32_t draw(uint32_t turn, uint32_t building) {
    uint64_t z = (uint64_t(turn) << 32 | building) + 0x9E3779B97F4A7C15ull;
    z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9ull;
    z = (z ^ (z >> 27)) * 0x94D049BB133111EBull;
    z ^= z >> 31;
    return uint32_t(z % kOdds) + 1;
}

// Easy x0.5, Medium x1, Hard x1.5 (in halves); Beginner none.
int halves(int difficulty) {
    switch (difficulty) {
        case 2: return 1;
        case 3: return 2;
        case 4: return 3;
        default: return 0;
    }
}

bool hasOperational(Simulation& sim, const Colony& c, BuildingClass cls) {
    for (Handle th : c.tiles.order())
        if (const Tile* t = sim.db().get<Tile>(th))
            if (const Building* b = sim.db().get<Building>(t->building);
                b && b->cls == cls && b->state == Building::kOperational)
                return true;
    return false;
}

bool hasRepairRobots(Simulation& sim, const Colony& c) {
    for (Tile* t : sim.colonyTilesInGroup(c, 4, false))
        if (const auto* w = sim.db().get<WarehouseBuilding>(t->building); w && w->quantityOfA(product::RepairRobots) > 0)
            return true;
    return false;
}

class BreakdownStep final : public Step {
public:
    std::string_view name() const override { return "SCBreakdowns"; }   // the rebuild's own
    uint16_t priority() const override { return stepcode::ProdSched; }    // just before SCProdSched
    bool shouldRun(Simulation& sim) override { return halves(sim.difficulty()) > 0 || !sim.breakdowns().broken.empty(); }
    // (Repairs run whenever something is broken, also on Beginner: a
    // disaster, I109, can damage buildings there too.)
    void calcMe(Simulation& sim) override {
        auto& broken = sim.breakdowns().broken;
        // Repairs first.
        for (auto it = broken.begin(); it != broken.end();) {
            Building* b = sim.db().get<Building>(Handle{it->first});
            Colony* c = b ? b->colony(sim) : nullptr;
            if (!b || !c || b->state == 7) {
                it = broken.erase(it);
                continue;
            }
            // The engineers live in the Command Center; one that broke
            // itself is repaired from inside.
            if (b->cls == BuildingClass::CommandCenter || hasOperational(sim, *c, BuildingClass::CommandCenter)) {
                const bool robots = hasRepairRobots(sim, *c) && hasOperational(sim, *c, BuildingClass::RoboCmd);
                it->second = static_cast<int16_t>(it->second - (robots ? 2 : 1));
            }
            if (it->second <= 0) {
                sim.post({kBreakdownNotice, 2, c->self, b->type});
                it = broken.erase(it);
                continue;
            }
            ++it;
        }
        // Then new breakdowns.
        const int k = halves(sim.difficulty());
        const uint32_t turn = sim.turn();
        if (k == 0 || turn < kFirstTurn) return;
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
            if (c->player == kRebelPlayer) continue;
            for (Handle th : c->tiles.order()) {
                const Tile* t = sim.db().get<Tile>(th);
                Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
                if (!b || b->state != Building::kOperational || broken.count(b->self.value)) continue;
                const int chance = breakdownChance(b->type) * k / 2;
                if (chance <= 0 || draw(turn, b->self.value) > uint32_t(chance)) continue;
                // Life support (group 45: Command, SeedCommand, CHAP) is an
                // emergency: without air people die, twice as many each turn
                // (s8:42CC), so it is fixed by the next turn.
                const bool air = sim.data().groups.contains(45, b->type);
                broken[b->self.value] = air ? int16_t(1) : kRepairWork;
                sim.post({kBreakdownNotice, uint16_t(air ? 3 : 1), c->self, b->type});
            }
        }
    }
};

// The extension chunk: u16 count, then {u32 building, i16 work left}.
const bool kRegistered = [] {
    registerExtension(
        "breakdowns",
        [](const Simulation& sim) {
            std::vector<uint8_t> out;
            const auto& broken = sim.breakdowns().broken;
            if (broken.empty()) return out;
            auto put = [&out](uint32_t v, int n) {
                for (int i = 0; i < n; ++i) out.push_back(uint8_t(v >> (8 * i)));
            };
            put(uint32_t(broken.size()), 2);
            for (const auto& [h, w] : broken) {
                put(h, 4);
                put(uint16_t(w), 2);
            }
            return out;
        },
        [](Simulation& sim, std::span<const uint8_t> b) {
            auto& broken = sim.breakdowns().broken;
            broken.clear();
            if (b.size() < 2) return;
            const size_t n = size_t(b[0] | (b[1] << 8));
            for (size_t i = 0; i < n && 2 + 6 * i + 6 <= b.size(); ++i) {
                const size_t p = 2 + 6 * i;
                const uint32_t h = uint32_t(b[p]) | uint32_t(b[p + 1]) << 8 | uint32_t(b[p + 2]) << 16 |
                                   uint32_t(b[p + 3]) << 24;
                broken[h] = static_cast<int16_t>(b[p + 4] | (b[p + 5] << 8));
            }
        });
    return true;
}();

} // namespace

int16_t breakdownChance(uint16_t type) {
    switch (type) {                                    // the manual, pp. 24-29
        case 27: case 28: case 29: return 20;          // Agricultural Dome
        case 42: case 43: return 10;                   // CHAP Facility
        case 55: return 50;                            // Command Center
        case 37: case 38: case 39: return 5;           // Communications Tower
        case 30: case 31: case 32: return 10;          // Factory
        case 40: case 41: return 20;                   // Hot Laboratory
        case 17: return 20;                            // Mass Driver
        case 51: case 52: return 30;                   // Mine
        case 22: case 23: case 24: case 63: case 64: return 30;   // Monorail, station, power
        case 44: return 20;                            // Nanotechnology Facility
        case 49: case 50: case 108: case 109: return 20;   // Police
        case 56: case 57: return 30;                   // Robot Command
        case 53: case 54: return 10;                   // Smelter
        case 18: return 20;                            // Solar Powersat Receiver
        case 15: return 30;                            // Spaceport
        case 34: case 35: case 36: return 40;          // SPEW
        case 45: case 46: return 20;                   // Terraforming
        case 19: return 5;                             // Tokamak brought from the ship
        case 20: case 21: return 30;                   // Tokamak built
        case 58: case 59: return 5;                    // Warehouse
        case 102: case 103: return 10;                 // Administration
        case 87: case 88: case 89: return 10;          // Commercial
        case 110: return 20;                           // Geothermal Power Plant
        case 93: case 94: case 95: return 20;          // Laboratory
        case 91: case 92: return 20;                   // Light Industry
        case 104: case 105: return 20;                 // Medical Facility
        case 90: return 10;                            // Park / Reservoir
        case 82: case 83: return 20;                   // Recreational Facility
        case 79: case 80: case 81: return 10;          // Residential
        case 100: return 5;                            // Spaceport Warehouse
        case 84: case 85: case 86: return 20;          // University
        default: return 0;                             // DIRT, Red Light, roads, tubes, storage, the Seed...
    }
}

void damageBuilding(Simulation& sim, Building& b, int16_t work) {
    auto& broken = sim.breakdowns().broken;
    if (broken.count(b.self.value)) return;
    const Colony* c = b.colony(sim);
    if (!c) return;
    const bool air = sim.data().groups.contains(45, b.type);
    broken[b.self.value] = air ? int16_t(1) : work;
    sim.post({kBreakdownNotice, 4, c->self, b.type});
}

bool breakdownBlocks(const Simulation& sim, const Building& b) {
    return sim.breakdowns().broken.count(b.self.value) != 0;
}

int16_t repairLeft(const Simulation& sim, const Building& b) {
    const auto& broken = sim.breakdowns().broken;
    const auto it = broken.find(b.self.value);
    return it == broken.end() ? int16_t(-1) : it->second;
}

std::unique_ptr<Step> makeBreakdownStep() { return std::make_unique<BreakdownStep>(); }

} // namespace outpost::sim
