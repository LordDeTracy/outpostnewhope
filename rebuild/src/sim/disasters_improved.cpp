#include "sim/disasters_improved.hpp"

#include "sim/breakdowns_improved.hpp"
#include "sim/building.hpp"
#include "sim/events.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <vector>

namespace outpost::sim {

namespace {

const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);
const Handle kRebelPlayer = Handle::make(ObjType::Player, 2);
constexpr uint16_t kLog = 0x37;
constexpr uint32_t kFirstTurn = 40;
constexpr int16_t kDamageRepair = 6;
constexpr int kDirtRadius = 5;

// The rebuild's own draws (splitmix64), so v1.51's sequence is untouched.
uint64_t mix(uint64_t z) {
    z += 0x9E3779B97F4A7C15ull;
    z = (z ^ (z >> 30)) * 0xBF58476D1CE4E5B9ull;
    z = (z ^ (z >> 27)) * 0x94D049BB133111EBull;
    return z ^ (z >> 31);
}

const Planet* playerPlanet(const Simulation& sim) {
    const Colony* c = sim.db().get<Colony>(kColony1);
    const Site* s = c ? sim.siteOf(*c) : nullptr;
    return s ? sim.db().get<Planet>(s->owner) : nullptr;
}

bool discovered(const Simulation& sim, int d) {
    const Player* p = sim.db().get<Player>(kPlayer1);
    return p && d >= 0 && size_t(d) < p->discoveries.size() && p->discoveries[size_t(d)] > 0;
}

// The player's buildings that a disaster can hit (not terrain, robots or
// tubes), filtered.
template <class F>
std::vector<Building*> targets(Simulation& sim, F keep) {
    std::vector<Building*> out;
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
        if (c->player == kRebelPlayer) continue;
        for (Handle th : c->tiles.order()) {
            const Tile* t = sim.db().get<Tile>(th);
            Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
            if (!b || b->type <= 9 || (b->type >= 115 && b->type <= 127)) continue;
            if (b->state != Building::kOperational && b->state != Building::kSuspended) continue;
            if (keep(*b, *t)) out.push_back(b);
        }
    }
    return out;
}

bool hasMeteorDefense(Simulation& sim) {
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
        if (c->player == kRebelPlayer) continue;
        for (Tile* t : sim.colonyTilesInGroup(*c, 4, false))
            if (const auto* w = sim.db().get<WarehouseBuilding>(t->building); w && w->quantityOfA(15) > 0)
                return true;
    }
    return false;
}

// Damage up to n of the candidates, picked by the draw `seed`; a DIRT within
// 5 saves a building.
void hit(Simulation& sim, std::vector<Building*> cands, int n, uint64_t seed) {
    for (int k = 0; k < n && !cands.empty(); ++k) {
        seed = mix(seed);
        const size_t i = size_t(seed % cands.size());
        Building* b = cands[i];
        cands.erase(cands.begin() + std::ptrdiff_t(i));
        if (dirtProtects(sim, *b, kDirtRadius)) continue;
        damageBuilding(sim, *b, kDamageRepair);
    }
}

void strike(Simulation& sim, int kind, uint64_t seed) {
    static constexpr uint16_t kLogCode[7] = {0, 22, 23, 24, 28, 31, 36};
    sim.post({kLog, kLogCode[kind], Handle{}, 0});
    const auto surface = [](const Building&, const Tile& t) { return t.level == 0; };
    const int roll = int(mix(seed ^ 0xD15A) % 3);    // 0..2
    switch (kind) {
        case 1:                                           // meteorites
            if (hasMeteorDefense(sim)) return;
            hit(sim, targets(sim, surface), discovered(sim, 3) ? 1 : 1 + roll, seed);
            break;
        case 2: {                                         // earthquake
            int n = 1 + roll;
            if (discovered(sim, 22)) n = std::max(1, n / 2);
            hit(sim, targets(sim, [](const Building&, const Tile& t) { return t.level > 0; }), n, seed);
            break;
        }
        case 3: {                                         // volcano
            int n = 2 + roll;
            if (discovered(sim, 24)) n /= 2;
            hit(sim, targets(sim, [](const Building&, const Tile&) { return true; }), n, seed);
            break;
        }
        case 4: {                                         // sand storm
            const uint64_t odds = discovered(sim, 20) ? 4 : 2;
            auto exposed = targets(sim, [](const Building& b, const Tile& t) {
                return t.level == 0 && (b.type == 18 || (b.type >= 27 && b.type <= 29) || (b.type >= 37 && b.type <= 39));
            });
            for (Building* b : exposed) {
                seed = mix(seed);
                if (seed % odds == 0 && !dirtProtects(sim, *b, kDirtRadius)) damageBuilding(sim, *b, 2);
            }
            break;
        }
        case 5: {                                         // electrical storm
            int n = 1 + roll % 2;
            if (discovered(sim, 20)) n = std::max(1, n / 2);
            hit(sim, targets(sim, [](const Building& b, const Tile&) {
                    return (b.type >= 18 && b.type <= 21) || b.type == 110 || (b.type >= 37 && b.type <= 39);
                }), n, seed);
            break;
        }
        case 6: {                                         // solar flare
            hit(sim, targets(sim, surface), 1, seed);
            if (discovered(sim, 5)) break;                // warned: everyone takes cover
            for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
                if (c->player == kRebelPlayer) continue;
                const int32_t people = c->population.total();
                if (people <= 0) continue;
                const int32_t dead = std::max<int32_t>(1, people / 100);
                c->population.kill(0, dead);
                sim.post({kLog, 2, c->self, dead});
            }
            break;
        }
        default:
            break;
    }
}

} // namespace

int disasterFrequency(uint16_t planetTemplate, int kind) {
    // Columns: the manual's Mercury, Venus, Mars, Earth's Moon, Phobos, Ceres
    // Asteroid, Pluto; rows: solar flare, meteorite, earthquake, volcano,
    // sand storm, electrical storm.
    static constexpr int kTable[7][6] = {
        {10, 7, 7, 2, 0, 0}, {6, 1, 6, 7, 0, 3}, {2, 4, 5, 0, 4, 3}, {4, 7, 3, 0, 0, 0},
        {3, 7, 3, 2, 0, 0},  {5, 7, 2, 0, 0, 0}, {0, 5, 3, 0, 0, 0}};
    int col = -1;
    switch (planetTemplate) {
        case 1: col = 0; break;     // Mercury
        case 2: col = 1; break;     // Venus
        case 4: col = 2; break;     // Mars
        case 3: col = 3; break;     // the Moon
        case 10: col = 4; break;    // Phobos
        case 9: col = 5; break;     // Ceres
        case 8: col = 6; break;     // Pluto
        default: return 0;
    }
    // Kinds (v1.51's order): 1 meteorite, 2 earthquake, 3 volcano, 4 sand
    // storm, 5 electrical storm, 6 solar flare.
    static constexpr int kRow[7] = {-1, 1, 2, 3, 4, 5, 0};
    if (kind < 1 || kind > 6) return 0;
    return kTable[col][kRow[kind]];
}

bool planetDisastersApply(const Simulation& sim) {
    const Planet* p = playerPlanet(sim);
    if (!p) return false;
    for (int k = 1; k <= 6; ++k)
        if (disasterFrequency(p->nameId, k) > 0) return true;
    return false;
}

void planetDisasters(Simulation& sim) {
    const Planet* p = playerPlanet(sim);
    const uint32_t turn = sim.turn();
    if (!p || turn < kFirstTurn) return;
    int scale4 = 0;                                       // window length in quarters
    switch (sim.difficulty()) {
        case 2: scale4 = 8; break;                        // Easy: twice as long
        case 3: scale4 = 4; break;
        case 4: scale4 = 3; break;                        // Hard: three quarters
        default: return;                                  // Beginner: none
    }
    for (int kind = 1; kind <= 6; ++kind) {
        const int f = disasterFrequency(p->nameId, kind);
        if (f <= 0) continue;
        const uint32_t window = uint32_t(1000 / f) * uint32_t(scale4) / 4;
        const uint32_t w = (turn - kFirstTurn) / window;
        const uint64_t seed = mix((uint64_t(p->self.value) << 20) ^ (uint64_t(kind) << 16) ^ w);
        const uint32_t at = kFirstTurn + w * window + uint32_t(seed % window);
        if (turn == at) strike(sim, kind, seed);
    }
}

} // namespace outpost::sim
