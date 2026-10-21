#include "sim/building.hpp"
#include "sim/rebels.hpp"

#include "sim/research.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdlib>
#include <array>

namespace outpost::sim {

namespace {

using C = BuildingClass;

// Type -> class, from the factory switch in Building::create (s7:07AC).
// Types 0 and 128..137 are not built by the factory.
constexpr std::array<C, 128> kClassOf = {
    C::Generic, C::Terrain, C::Terrain, C::Terrain, C::Terrain, C::Terrain, C::Terrain,
    C::Terrain, C::Terrain, C::Terrain, C::Seed, C::CommandCenter, C::SeedSmelter,
    C::SeedPower, C::SeedFact, C::SpacePort, C::Mine, C::MassDrv, C::SolrPwrRecvr,
    C::Tokamak, C::Tokamak, C::Tokamak, C::Monorail, C::Monorail, C::Monorail,
    C::Generic, C::Generic, C::AgriDome, C::AgriDome, C::AgriDome, C::Factory,
    C::Factory, C::Factory, C::Trade, C::Spew, C::Spew, C::Spew, C::CommTwr,
    C::CommTwr, C::CommTwr, C::Lab, C::Lab, C::Chap, C::Chap, C::Nano, C::TerraForm,
    C::TerraForm, C::Dirt, C::Dirt, C::Police, C::Police, C::Mine, C::Mine,
    C::Smelter, C::Smelter, C::CommandCenter, C::RoboCmd, C::RoboCmd, C::Warehouse,
    C::Warehouse, C::Storage, C::Storage, C::ColonistLander, C::MonoStation,
    C::MonoXFormer, C::CargoLander, C::Generic, C::Generic, C::Generic, C::Generic,
    C::Generic, C::Core, C::Destroyed, C::Destroyed, C::Destroyed, C::Generic,
    C::Road, C::Road, C::Road, C::UGResident, C::UGResident, C::UGResident, C::UGRec,
    C::UGRec, C::UGUniv, C::UGUniv, C::UGUniv, C::UGCommercial, C::UGCommercial,
    C::UGCommercial, C::UGPark, C::UGFact, C::UGFact, C::Lab, C::Lab, C::Lab, C::Mine,
    C::Mine, C::Tokamak, C::Tokamak, C::UGSpacePort, C::UGRed, C::UGAdmin, C::UGAdmin,
    C::UGMed, C::UGMed, C::Core, C::Generic, C::Police, C::Police, C::UGGeoTherm,
    C::Generic, C::Destroyed, C::Destroyed, C::Destroyed, C::RoboDozer, C::RoboDigger,
    C::RoboMine, C::RoboExplr, C::RoboDozer, C::RoboDigger, C::RoboDigger, C::Pipe,
    C::Pipe, C::Pipe, C::Pipe, C::Pipe, C::Pipe,
};

} // namespace

BuildingClass buildingClassOf(uint16_t type) {
    return type < kClassOf.size() ? kClassOf[type] : BuildingClass::Generic;
}

Building::Building(uint16_t t, BuildingClass c) : type(t), cls(c) {
    placeholderType = (t >= 79 && t <= 111) ? 107 : 66;
}

Tile* Building::tile(const Simulation& sim) const {
    return sim.db().get<Tile>(owner);
}

Colony* Building::colony(const Simulation& sim) const {
    const Tile* t = tile(sim);
    return t ? sim.db().get<Colony>(t->colony) : nullptr;
}

using namespace data::res;

void SeedPowerBuilding::power(Simulation& sim, bool on) {
    if (Tile* t = tile(sim)) t->bas.set(Power, on ? 50 : 0);
}

// Shared by MShipTokamak, Tokamak(2), UGTokamak(2). The underground tokamaks
// are not in group 12, so SCPower never calls this for them.
void TokamakBuilding::power(Simulation& sim, bool on) {
    if (Tile* t = tile(sim)) t->bas.set(Power, on ? 1000 : 0);
}

// Only with a Solar Power Satellite in orbit (registry lookup of object kind
// 0x83 = 131, s3:20BA + s3:65D0); otherwise the ledger is left unchanged.
void SolarReceiverBuilding::power(Simulation& sim, bool on) {
    if (sim.orbitalCount(131) <= 0) return;
    if (Tile* t = tile(sim)) t->bas.set(Power, on ? 1000 : 0);
}

// Only Command (type 55) is in group 12, so SeedCommand never produces power.
void CommandCenterBuilding::power(Simulation& sim, bool on) {
    Tile* t = tile(sim);
    if (!t) return;
    if (life > 0) {
        t->bas.set(Power, on ? 50 : 0);
        --life;
    } else {
        t->bas.set(Power, 0);
    }
    if (life > 0 && life < 25)
        if (Colony* c = colony(sim)) c->populated = true;
}

int16_t PoliceBuilding::moraleEffect(const Simulation& sim) const {
    if (mode == 2) return 1;
    const Player* p = sim.playerOf(colony(sim));
    return p && p->researchDone(99) ? int16_t{0} : int16_t{-1};
}

const std::array<int32_t, data::res::Count>* Building::needs() const {
    switch (infoKind) {
        case InfoKind::Construction: return &buildInfo.need;
        case InfoKind::Operation:    return &opsInfo.need;
        default:                     return nullptr;
    }
}

// Building::setState (s6:BDAC).
void Building::setState(Simulation& sim, uint16_t newState) {
    if (state == newState) return;
    if (state == kSuspended) {
        // Only resuming to the remembered state leaves suspension.
        if (savedState == newState) {
            state = savedState;
            savedState = 0;
        }
        return;
    }
    if (newState == kSuspended) {
        savedState = state;
        state = kSuspended;
        return;
    }
    if (state == kConstructing || state == kOperational) infoKind = InfoKind::None;  // frees +0x14
    state = newState;
    onStateEntered(sim);
}

// Base slot 15 (s6:BF22): pick the needs record for the new state.
void Building::onStateEntered(Simulation& sim) {
    switch (state) {
        case kConstructing:
            if (type < sim.data().bldgBld.size()) buildInfo = sim.data().bldgBld[type];
            infoKind = InfoKind::Construction;
            break;
        case kOperational:
            if (type < sim.data().bldgOps.size()) opsInfo = sim.data().bldgOps[type];
            opsResource = 0;
            opsProductA = 0;
            opsProductB = 0;
            opsAmount = 0;
            opsCycleTurns = 0;
            infoKind = InfoKind::Operation;
            break;
        case kSuspended:
            break;
        default:
            infoKind = InfoKind::None;
            break;
    }
}

void AgriDomeBuilding::onStateEntered(Simulation& sim) {
    Building::onStateEntered(sim);
    if (state != kOperational) return;
    opsResource = Food;
    opsCycleTurns = 1;
    switch (type) {
        case 27: opsAmount = 10; break;
        case 28: opsAmount = 11; break;
        case 29: opsAmount = 12; break;
        default: break;
    }
    if (const Player* p = sim.playerOf(colony(sim))) {
        if (p->researchDone(12)) ++opsAmount;    // Exobiology
        if (p->researchDone(14)) ++opsAmount;    // Agriculture 1
        if (p->researchDone(118)) ++opsAmount;   // Agriculture 2
    }
}

void AgriDomeBuilding::produce(Simulation& sim) {
    Tile* t = tile(sim);
    if (!t) return;
    // 16-bit arithmetic as in the original: room = 1000 - stored, then an
    // unsigned min with the rate. With more than 1000 stored, "room" wraps
    // to a large value and the full rate is still added (quirk).
    const auto stored = static_cast<uint16_t>(t->bas.get(Food));
    const auto room = static_cast<uint16_t>(1000 - stored);
    const uint16_t add = std::min(room, opsAmount);
    t->bas.add(Food, add);
}

// ── Mine ──────────────────────────────────────────────────────────────────

// s6:121E: a surface mine keeps its own ore; an underground one sends it to
// the building directly above it (same x/y, level 0, same grid).
Building* MineBuilding::oreTarget(Simulation& sim) {
    Tile* t = tile(sim);
    if (!t) return nullptr;
    if (t->level == 0) return this;
    Tile* above = sim.tileAt(t->owner, t->x, t->y, 0);
    return above ? sim.db().get<Building>(above->building) : nullptr;
}

// s6:0D80 / s6:1646
uint16_t MineBuilding::nextOre() {
    const uint16_t r = oreCursor;
    oreCursor = (oreCursor >= OreA && oreCursor < OreMinC) ? static_cast<uint16_t>(oreCursor + 1)
                                                           : static_cast<uint16_t>(OreA);
    return r;
}

// s6:12BE: a surface mine is full above 500 units of ore (resources 4..13)
// on its tile; an underground mine asks its target.
bool MineBuilding::isFull(Simulation& sim, int32_t& stored) {
    Tile* t = tile(sim);
    if (t && t->level == 0) {
        stored = 0;
        for (int ore = OreA; ore <= OreMinC; ++ore) stored += t->bas.get(ore);
        return static_cast<uint32_t>(stored) > 500;
    }
    Building* target = oreTarget(sim);
    if (!target) {             // IMPROVISED (guard): the original has no check here
        stored = 0;
        return false;
    }
    return target->isFull(sim, stored);
}

// s6:134A: only group 19 (UGMine, UGMine2) mines. One pass over the ore mix
// (DGROUP 0x4FBE), capped by the room left below 500: at most 15 ore a turn.
void MineBuilding::mine(Simulation& sim) {
    if (!sim.data().groups.contains(19, type)) return;
    int32_t stored = 0;
    if (isFull(sim, stored)) {
        ++life;                    // a full turn costs no life
        return;
    }
    int32_t remaining = 500 - stored;
    Building* target = oreTarget(sim);
    Tile* dest = target ? target->tile(sim) : nullptr;
    if (!dest) return;
    const auto& mix = sim.data().mineOreMix;
    for (size_t i = 0; i < mix.size(); ++i) {
        const int32_t chunk = std::min<int32_t>(mix[i], remaining);
        dest->bas.add(OreA + static_cast<int>(i), chunk);
        remaining -= chunk;
        if (remaining <= 0) break;
    }
}

// ── Smelter ───────────────────────────────────────────────────────────────

// s6:3958: refine every ore on the tile into the smelter's output ledger.
void SmelterBuilding::produce(Simulation& sim) {
    Tile* t = tile(sim);
    if (!t) return;
    Colony* c = colony(sim);
    const bool oddTurn = sim.turn() & 1;     // low bit of the turn counter (g_objectDb+0)
    for (int ore = OreA; ore <= OreMinC; ++ore) {
        const int32_t amount = t->bas.get(ore);
        if (amount == 0) continue;
        t->bas.set(ore, 0);
        if (c) c->addTotal(-amount, ore);

        int32_t out = 0;
        int res = 0;
        switch (ore) {
            case OreA: case OreB: case OreC: case OreD:
                out = static_cast<int32_t>(static_cast<uint32_t>(amount) >> 1);
                if (out == 0 && oddTurn) out = 1;
                res = MetalA + (ore - OreA);
                break;
            case OreFusionA: case OreFusionB: case OreFusionC:
                out = amount;
                res = FusionA + (ore - OreFusionA);
                break;
            case OreMinA:
                out = amount;
                res = MinA;
                break;
            case OreMinB: {
                out = amount;
                res = MinB;
                minBCarry += amount;
                const auto q = static_cast<int32_t>(static_cast<uint32_t>(minBCarry) >> 1);
                minBCarry -= 2 * q;
                if (q) output.set(PrecA, q);    // set, not add (quirk)
                break;
            }
            case OreMinC: {
                out = amount;
                res = MinC;
                minCCarry += amount;
                const auto q = static_cast<int32_t>(static_cast<uint32_t>(minCCarry) / 3);
                minCCarry -= 3 * q;
                if (q) output.set(PrecB, q);    // set, not add (quirk)
                break;
            }
            default:
                break;
        }
        if (out && res) output.add(res, out);
    }
}

// s6:3C60: sums the output ledger twice (by resource 4..28, then by entry)
// before comparing with 1000, so it reports full at about 500 (quirk).
bool SmelterBuilding::isFull(Simulation&, int32_t& stored) {
    stored = 0;
    for (int r = OreA; r <= FusionC; ++r) {
        stored += output.get(r);
        if (static_cast<uint32_t>(stored) >= 1000) return true;
    }
    for (const auto& [key, value] : output.entries()) {
        stored += value;
        if (static_cast<uint32_t>(stored) >= 1000) return true;
    }
    return false;
}

// ── SPEW ──────────────────────────────────────────────────────────────────

// s6:3F04: SPEW 1 converts sewage to MPG 1:1; SPEW 2/3 add 10%/20%. The
// remainder kept for next turn is also counted in this turn's output (quirk).
void SpewBuilding::produce(Simulation& sim) {
    Tile* t = tile(sim);
    if (!t) return;
    const int32_t sewage = t->bas.get(Sewage);
    t->bas.set(Sewage, 0);
    if (type == 34) {
        t->bas.add(MPG, sewage);
        return;
    }
    const uint32_t divisor = type == 35 ? 10 : 5;
    uint32_t v = static_cast<uint32_t>(sewage) + static_cast<uint32_t>(carry);
    carry = static_cast<int32_t>(v % divisor);
    v += v / divisor;
    t->bas.add(MPG, static_cast<int32_t>(v));
}

// ── UG residence ──────────────────────────────────────────────────────────

void UGResidentBuilding::produce(Simulation& sim) {
    if (Colony* c = colony(sim)) sim.enqueue(makeAddSpewStep(c->self, 1));
}

// ── Factory ───────────────────────────────────────────────────────────────

uint16_t productUnitValueA(uint16_t product) {
    static constexpr uint16_t kValues[19] = {3, 3, 3, 6, 3, 10, 2, 3, 3, 3,
                                             3, 3, 1, 1, 10, 10, 10, 10, 10};
    return (product >= 1 && product <= 19) ? kValues[product - 1] : 1;
}

uint16_t productUnitValueB(uint16_t product) {
    return product == 15 ? 1 : 3;
}

bool besideAdministration(Simulation& sim, const Building& b) {
    const Tile* t = b.tile(sim);
    if (!t) return false;
    for (int dy = -1; dy <= 1; ++dy)
        for (int dx = -1; dx <= 1; ++dx) {
            if (!dx && !dy) continue;
            const Tile* n = sim.tileAt(t->owner, int16_t(t->x + dx), int16_t(t->y + dy), t->level);
            const Building* a = n ? sim.db().get<Building>(n->building) : nullptr;
            if (a && (a->type == 102 || a->type == 103) && a->state == Building::kOperational &&
                n->colony == t->colony)
                return true;
        }
    return false;
}

// s6:081E: one step of progress, scaled by the colony value at +0x18
// (morale, inferred): <250 half speed, <450 two thirds, <550 normal,
// <750 four thirds, otherwise double. Driven by the turn counter.
void FactoryBuilding::advance(Simulation& sim) {
    const Colony* c = colony(sim);
    const int16_t m = c ? c->morale : 0;
    const uint32_t turn = sim.turn();
    ++progress;
    // IMPROVED (I106): Light Industry beside an Administration building.
    if (cls == BuildingClass::UGFact && besideAdministration(sim, *this)) ++progress;
    if (m < 250) {
        if (!(turn & 1)) --progress;
    } else if (m < 450) {
        if (turn % 3 == 0) --progress;
    } else if (m < 550) {
    } else if (m < 750) {
        if (turn % 3 == 0) ++progress;
    } else {
        ++progress;
    }
}

// s6:04EE: output holds 30 units.
bool FactoryBuilding::isFull(Simulation&, int32_t& stored) {
    stored = 0;
    for (const auto& item : output) {
        stored += item.units;
        if (static_cast<uint32_t>(stored) >= 30) return true;
    }
    return false;
}

// s6:0582
void FactoryBuilding::produce(Simulation& sim) {
    int32_t stored = 0;
    if (opsProductA != 0 && opsCycleTurns != 0) {
        advance(sim);
        if (static_cast<uint16_t>(progress) >= opsCycleTurns) {
            if (!isFull(sim, stored)) {
                if (opsProductA == 12) {
                    if (Colony* c = colony(sim)) ++c->population.extra170;
                } else {
                    output.push_back({opsProductA, 0, opsAmount,
                                      static_cast<uint16_t>(productUnitValueA(opsProductA) * opsAmount)});
                }
            }
            progress = 0;      // a batch finished while full is lost (quirk)
        }
    }
    if (opsProductB != 0 && opsCycleTurns != 0) {
        advance(sim);          // a second advance in the same turn (quirk)
        if (static_cast<uint16_t>(progress) >= opsCycleTurns) {
            if (!isFull(sim, stored)) {
                output.push_back({0, opsProductB, opsAmount,
                                  static_cast<uint16_t>(productUnitValueB(opsProductB) * opsAmount)});
            }
            progress = 0;
        }
    }
    if (type != 14)            // every factory but SeedFact makes sewage
        if (Colony* c = colony(sim)) sim.enqueue(makeAddSpewStep(c->self, 1));
}

// ── Construction and the colony network ───────────────────────────────────

namespace {
const Handle kRebels = Handle::make(ObjType::Player, 2);
bool isRebelColony(const Colony* c) { return c && c->player == kRebels; }
}

// s6:B514
void Building::wreck(Simulation& sim) {
    const bool hasRecord = state == kConstructing || state == kOperational ||
                           (state == kSuspended && (savedState == kConstructing || savedState == kOperational));
    if (hasRecord) infoKind = InfoKind::None;
    state = kWrecked;
    if (Tile* t = tile(sim)) {
        t->bas.clear();                              // s7:7296
        t->alloc.clear();                            // s7:72D0
        clearUnits(sim, *t);                         // s7:730A
    }
}

// s6:BD38: the type's BLDGBLD record (s7:4BBE copies it from the table).
void Building::reserveNeeds(Simulation& sim, uint16_t) {
    Colony* c = colony(sim);
    const auto& table = sim.data().bldgBld;
    if (!c || type >= table.size()) return;
    const auto& need = table[type].need;
    for (int r = MetalA; r <= People; ++r)
        if (int32_t v = need[static_cast<size_t>(r)]) c->allocate(v, r);   // s8:5770
}

namespace {
// s6:09B8: the landers' and the Seed's reserve only mark their tile.
void markLanded(Simulation& sim, const Building& b) {
    if (Tile* t = b.tile(sim)) t->mark14 = 1;
}
} // namespace

// s6:43C2
void SolarReceiverBuilding::reserveNeeds(Simulation& sim, uint16_t arg) {
    Building::reserveNeeds(sim, arg);
    if (arg == 0) sim.mothership().removeDeployable(type);
}

// s6:4DB2
void TokamakBuilding::reserveNeeds(Simulation& sim, uint16_t arg) {
    if (!sim.data().groups.contains(41, type)) return;     // UGTokamaks: nothing
    Building::reserveNeeds(sim, arg);
    if (arg == 0 && type == 19) sim.mothership().removeDeployable(type);
    // s6:4E0F: the reactor's underground part, a UG Tokamak (98), goes on
    // the cell below (s6:C8EE direction 1) through SCInternalPutBldg; the
    // site is deepened to reach it (s7:5B3E) and the ground around softens
    // (s6:CCD0). The original uses the site in view (registry 0x2F +0x20);
    // that is the Tokamak's own site.
    Tile* t = tile(sim);
    if (!t) return;
    const Handle site = t->owner, colonyHandle = t->colony;
    const MapCell below{t->x, t->y, int16_t(t->level + 1)};
    if (Site* s = sim.db().get<Site>(site))
        if (below.level > static_cast<int16_t>(s->depth)) s->depth = static_cast<uint16_t>(below.level);
    sim.putBuildingAt(site, below, 98, colonyHandle);
    soften(sim, site, colonyHandle, below);
}

// s7:C2FA
void CommandCenterBuilding::reserveNeeds(Simulation& sim, uint16_t arg) {
    if (type == 11) return;                                // SeedCommand
    Building::reserveNeeds(sim, arg);
    // s7:C315..C528: the parent colony (+0x20) founds the new one.
    // IMPROVISED (I43, guard): SCInternalPutBldg sets +0x20 only after the
    // reserve (s6:8C2A), so a Command put down that way (by the AI) reads
    // a NULL parent; here it founds nothing. The player's SCPutBldg sets
    // it first (s6:9762).
    Colony* parent = sim.db().get<Colony>(Handle{static_cast<uint32_t>(field20)});
    Tile* t = tile(sim);
    Colony* fresh = colony(sim);
    if (!parent || !t || !fresh) return;
    // s3:ED22: the view turns to the new colony (front end).
    // Two working-age colonists move over (s7:3694 group 3, s7:355C), and
    // the new colony takes the parent's death tables.
    fresh->population.addCohorts(parent->population.leaveFromGroup(3, 2));
    fresh->population.deathRate = parent->population.deathRate;
    fresh->population.deathChance = parent->population.deathChance;
    // s7:C3EF: the starting stock of resources 17..36. The parent pays in
    // kind when it has enough, otherwise the same amount of resource 33
    // (s8:52B8); the stock goes to the new tile and the new colony's total.
    for (int r = 17; r < 37; ++r) {
        const int16_t amount = sim.data().commandKit[static_cast<size_t>(r)];
        if (amount <= 0) continue;
        const bool enough = amount <= parent->available(r);            // s8:540A
        colonyConsume(sim, *parent, enough ? r : 33, static_cast<uint32_t>(amount));
        t->bas.add(r, amount);                                          // s7:7DDC
        fresh->addTotal(amount, r);                                     // s8:5694
    }
    // Two of each working robot kit: Dozer, Digger, Miner, Truck appear on
    // the new tile (s7:7C50) and leave the parent's RoboCmds (s8:44D8).
    for (uint16_t kind = product::Dozer; kind <= product::Truck; ++kind) addUnits(sim, *t, 2, kind);
    for (uint16_t kind = product::Dozer; kind <= product::Truck; ++kind) removeRobots(sim, *parent, 2, kind);
    sim.post({0x2B, 7, parent->self, 0});                              // s3:043A: alert 7
}

// s5:CE32
void ColonistLanderBuilding::reserveNeeds(Simulation& sim, uint16_t) {
    markLanded(sim, *this);
    Colony* c = colony(sim);
    if (!c || c->player == kRebelPlayer) return;
    sim.mothership().removeDeployable(type);
    sim.post({0x37, 9, Handle{}, 0});
}

// s5:CA36
void CargoLanderBuilding::reserveNeeds(Simulation& sim, uint16_t) {
    markLanded(sim, *this);
    Colony* c = colony(sim);
    if (c && c->player != kRebelPlayer) sim.mothership().removeDeployable(type);
}

// s5:CA82
void CargoLanderBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    const Colony* c = colony(sim);
    if (c && c->player != kRebelPlayer && state == kOperational) unload(sim);
}

// s5:CAC2. Losses are 16-bit signed divisions, rounded toward zero.
void CargoLanderBuilding::unload(Simulation& sim) {
    int d = sim.difficulty();
    if (d == 1) d = 2;
    Mothership& ship = sim.mothership();
    Tile* t = tile(sim);
    for (auto it = ship.hold.begin(); it != ship.hold.end();) {
        ShipItem& item = *it;
        const int16_t n = item.count;
        if (item.kind == 18 || item.kind == 19) {
            int16_t lost = 0;
            if (d == 3) lost = static_cast<int16_t>(n / 2);
            else if (d == 4) lost = static_cast<int16_t>(static_cast<int16_t>(n * 3) / 4);
            item.count = static_cast<int16_t>(item.count - lost);
            ship.deployable.push_back(item);                // moved, not copied
            it = ship.hold.erase(it);
        } else if (item.kind == 129) {
            int16_t lost = 0;
            if (d == 2) lost = static_cast<int16_t>(n / 4);
            else if (d == 3) lost = static_cast<int16_t>(n / 2);
            else if (d == 4) lost = static_cast<int16_t>(static_cast<int16_t>(n * 3) / 4);
            if (t) t->bas.add(Food, static_cast<int16_t>(n - lost));
            it = ship.hold.erase(it);
        } else {
            ++it;
        }
    }
}

// s6:2E84
void SeedBuilding::reserveNeeds(Simulation& sim, uint16_t arg) {
    markLanded(sim, *this);
    if (arg != 0) return;
    const Handle colony1 = Handle::make(ObjType::Colony, 1);
    sim.post({0x37, 8, Handle{}, 0});
    sim.post({0x2B, 3, colony1, 0});
    sim.post({0x2B, 4, colony1, 0});
    // TODO(s3:EC84): the current view follows the landing.
    sim.mothership().arrive(sim.difficulty());                 // s3:9766
}

// s6:2E40
void SeedBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational) return;
    deploy(sim);
    giveStartingStock(sim);
    sim.setAlert(5, true);
}

// s6:2F18: the Seed puts its parts down around it, each through
// SCInternalPutBldg (whose work is its shouldRun, s6:8920, so each goes down
// as it is queued): SeedPower (13) at (x-1, y-1), SeedSmelter (12) at
// (x+1, y+1), SeedFactory (14) at (x-1, y+1), SeedCommand (11) at
// (x+1, y-1), and an XPipe (122) on each side: (x, y-1), (x+1, y), (x, y+1),
// (x-1, y). The colony's hub then becomes the cell at (x+1, y-1) (s7:627E:
// its tile, or none), the SeedCommand.
void SeedBuilding::deploy(Simulation& sim) {
    Tile* t = tile(sim);
    if (!t) return;
    const Handle site = t->owner, colonyHandle = t->colony;
    // IMPROVISED (guard): without a map (a simulation set up by hand)
    // there is nothing to put down, and the hub stays.
    if (!sim.gridOfSite(site)) return;
    const int16_t x = t->x, y = t->y, z = t->level;
    struct Part {
        int16_t dx, dy;
        uint16_t type;
    };
    static constexpr Part kParts[] = {{-1, -1, 13}, {1, 1, 12}, {-1, 1, 14}, {1, -1, 11},
                                      {0, -1, 122}, {1, 0, 122}, {0, 1, 122}, {-1, 0, 122}};
    for (const Part& p : kParts) {
        Building* b = sim.putBuildingAt(site, {int16_t(x + p.dx), int16_t(y + p.dy), z}, p.type, colonyHandle);
        // IMPROVED (I104): the Seed's tubes come down ready, as the original's
        // turn-1 screenshots show (findings/14 §4). In v1.51 they wait for
        // their one worker, i.e. for the Colonist Landers (about turn 10).
        if (b && p.type == 122 && b->state == kConstructing) {
            b->buildInfo.word94 = 0;
            b->setState(sim, kOperational);
        }
    }
    if (Colony* c = sim.db().get<Colony>(colonyHandle)) {
        const Grid* g = sim.gridOfSite(site);
        c->hub = g ? g->tileAt({int16_t(x + 1), int16_t(y - 1), z}) : Handle{};
    }
}

// s6:3246
void SeedBuilding::giveStartingStock(Simulation& sim) {
    Colony* c = colony(sim);
    Tile* hub = c ? sim.db().get<Tile>(c->hub) : nullptr;
    if (!hub) return;           // IMPROVISED (guard): the original uses a NULL hub
    for (uint16_t kind : {product::Dozer, product::Digger, product::Miner, product::Explorer})
        addUnits(sim, *hub, 1, kind);
    if (!sim.autoTrucking()) addUnits(sim, *hub, 4, product::Truck);
    for (int r : {MetalA, MetalB, MetalC, MetalD, MinA, MinB, MinC}) hub->bas.add(r, 200);
    for (int r : {PrecA, PrecB, FusionA, FusionB, FusionC}) hub->bas.add(r, 20);
    if (c->player == kRebelPlayer) rebelSetup(sim, *hub);         // s5:A89E
}

// s6:4194
void SpacePortBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    const Colony* c = colony(sim);
    if (c && c->player != kRebelPlayer && state == kOperational) sim.post({0x2B, 0x0E, c->self, 0});
}

// s6:45B0
void StorageBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state == kOperational)
        if (Tile* t = tile(sim)) addUnits(sim, *t, 2, product::Truck);
}

// s6:0550, s6:5570
void FactoryBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    Tile* t = tile(sim);
    if (state != kOperational || !t) return;
    addUnits(sim, *t, 1, product::Truck);
    if (cls == BuildingClass::UGFact) addUnits(sim, *t, 1, product::Truck);
}

// s6:5F30
void UGUnivBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational) return;
    counter20 = 100;
    const Player* p = sim.playerOf(colony(sim));
    if (p && p->researchDone(97)) counter20 = static_cast<int16_t>(counter20 + 100);
}

namespace {
// s7:DACE / s7:DA22: the first warehouse (group 4, any state) of the colony
// with Road Materials.
WarehouseBuilding* roadMaterials(Simulation& sim, const Colony& c) {
    for (Tile* t : sim.colonyTilesInGroup(c, 4, false)) {
        auto* w = sim.db().get<WarehouseBuilding>(t->building);
        if (w && w->quantityOfA(product::RoadMaterials) != 0) return w;
    }
    return nullptr;
}
} // namespace

// s7:D994
void RoadBuilding::constructTick(Simulation& sim) {
    if (state != kConstructing) return;
    Colony* c = colony(sim);
    if (c && c->player == kRebelPlayer) {
        --buildInfo.word94;
    } else {
        if (!canAffordNeeds(sim)) return;
        if (!c || !roadMaterials(sim, *c)) return;
        --buildInfo.word94;
        payNeeds(sim);
        if (WarehouseBuilding* w = roadMaterials(sim, *c)) w->takeA(product::RoadMaterials, 1);
    }
    if (buildTurnsLeft() <= 0) setState(sim, kOperational);
}

// s6:36BC
bool SeedSmelterBuilding::isFull(Simulation&, int32_t& stored) {
    stored = 0;
    for (int r = OreA; r <= FusionC; ++r) {
        stored += output.get(r);
        if (static_cast<uint32_t>(stored) >= 250) return true;
    }
    return false;
}

// s6:CB04
bool Building::canAffordNeeds(Simulation& sim) {
    const auto* need = needs();
    Tile* t = tile(sim);
    Colony* c = colony(sim);
    if (!need || !t || !c) return false;
    if (c->freeResources) return true;
    auto shortfall = [&](int r) { return static_cast<uint32_t>((*need)[static_cast<size_t>(r)]); };
    bool ok = true;
    if (c->nanotech) {
        for (int r : {Power, People}) {
            const uint32_t want = shortfall(r);
            const auto have = static_cast<uint32_t>(c->available(r));
            if (have < want) {
                t->alloc.set(r, static_cast<int32_t>(want - have));          // Tile::setAlloc s7:7D7C
                ok = false;
                if (r == Power) sim.post({0x2B, 0x12, c->self, 0});
            }
        }
        return ok;
    }
    // Materials short of stock may be covered by MPG; the check takes the
    // whole need out of the MPG pool, not just the gap (quirk).
    auto mpg = static_cast<uint32_t>(c->available(MPG));
    for (int r = MetalA; r <= People; ++r) {
        const uint32_t want = shortfall(r);
        const auto have = static_cast<uint32_t>(c->available(r));
        if (have >= want) continue;
        if (r != Power && r != People && want <= mpg) {
            mpg -= want;
            continue;
        }
        t->alloc.set(r, static_cast<int32_t>(want - have));
        ok = false;
        if (r == Power) sim.post({0x2B, 0x12, c->self, 0});
    }
    return ok;
}

// s6:C952
void Building::payNeeds(Simulation& sim) {
    const auto* need = needs();
    Colony* c = colony(sim);
    if (!need || !c || c->freeResources) return;
    const uint32_t turn = sim.turn();
    // Level-2 buildings pay nothing every 10th turn, level-3 every 5th.
    if (sim.data().groups.contains(50, type)) {
        if (turn % 10 == 0) return;
    } else if (sim.data().groups.contains(51, type)) {
        if (turn % 5 == 0) return;
    }
    if (c->nanotech) {
        for (int r : {Power, People})
            if (int32_t v = (*need)[static_cast<size_t>(r)]) colonyConsume(sim, *c, r, static_cast<uint32_t>(v));
        return;
    }
    for (int r = 0; r < data::res::Count; ++r) {
        auto want = static_cast<uint32_t>((*need)[static_cast<size_t>(r)]);
        if (want == 0) continue;
        const auto have = static_cast<uint32_t>(c->available(r));
        if (have < want) {                          // MPG covers exactly the gap
            const uint32_t gap = want - have;
            colonyConsume(sim, *c, MPG, gap);
            want -= gap;
        }
        if (want) colonyConsume(sim, *c, r, want);
    }
}

// s6:BE9E
void Building::constructTick(Simulation& sim) {
    if (state != kConstructing) return;
    Colony* c = colony(sim);
    if (isRebelColony(c)) {
        --buildInfo.word94;                          // the rebels build for free
    } else {
        if (!canAffordNeeds(sim)) return;
        --buildInfo.word94;
        payNeeds(sim);
    }
    if (buildTurnsLeft() <= 0) setState(sim, kOperational);
}

// s6:CED2
bool Building::checkConnected(Simulation& sim) {
    bool ok = true;
    Tile* t = tile(sim);
    if (!(flags & kReachedByPower)) {
        if (t) t->alloc.set(Power, 1);
        ok = false;
    }
    if (!(flags & kReachedByLife)) {
        if (t) t->alloc.set(LifeA, 1);
        ok = false;
    }
    if (!ok) setState(sim, kSuspended);
    return ok;
}

// s6:BE2A
void Building::resume(Simulation& sim) {
    if (state != kSuspended) return;
    Colony* c = colony(sim);
    if (isRebelColony(c)) {
        setState(sim, kOperational);
        return;
    }
    if (tag1C == kRebels.value) return;              // setState(6): stays suspended
    if (!checkConnected(sim)) return;
    if (!canAffordNeeds(sim)) return;                // setState(6)
    payNeeds(sim);
    setState(sim, kOperational);
}

// s7:C1B2
void CommandCenterBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational) return;
    if (type != 11) {
        life = 100;
        return;
    }
    sim.mothership().moveLanders();                  // s7:C652 -> s3:9794
    life =static_cast<int16_t>(3 * sim.mothership().holdCount(0x82));
    if (sim.difficulty() <= 2 && life < 50) life = 50;
}

void CommandCenterBuilding::produce(Simulation&) {
    if (life > 0) {
        --life;
        return;
    }
    type = 55;
}

void TerraFormBuilding::produce(Simulation& sim) {
    if (systems[0] != 0) sim.terraformTick();
}

// s6:2700
void NanoBuilding::resume(Simulation& sim) {
    Building::resume(sim);
    if (state == kOperational)
        if (Colony* c = colony(sim)) c->nanotech = true;
}

// s6:272E
void NanoBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state == kOperational)
        if (Colony* c = colony(sim)) c->nanotech = true;
}

// s5:CE9E + s5:CEFC
void ColonistLanderBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational) return;
    Colony* c = colony(sim);
    if (!c) return;
    int16_t n = 50;
    if (!isRebelColony(c)) {
        Mothership& ship = sim.mothership();
        n = std::min<int16_t>(ship.cryoColonists, 50);
        ship.cryoColonists = static_cast<int16_t>(std::max(0, ship.cryoColonists - n));
    }
    c->population.addColonists(n);
    c->populated = true;
    if (!isRebelColony(c)) sim.post({0x2B, 5, c->self, n});
}

// s7:DB78
void RoadBuilding::resume(Simulation& sim) {
    if (state == kSuspended) setState(sim, kOperational);
}

// s7:C76C
void LabBuilding::resume(Simulation& sim) {
    if (state == kSuspended || state == kOperational) {
        if (topic == 0 || topic == 112 || topic == 113) {
            setState(sim, kSuspended);
            return;
        }
    }
    Building::resume(sim);
}

// s7:C7B0
void LabBuilding::produce(Simulation& sim) {
    if (topic == 0 || topic == 112 || topic == 113) return;
    Colony* c = colony(sim);
    Player* p = c ? sim.db().get<Player>(c->player) : nullptr;
    if (!p) return;
    const bool hot = sim.data().groups.contains(17, type);
    // IMPROVED (I106): a lab beside an Administration building gets a point
    // more each lab turn.
    if (!researchStep(sim, *p, hot, topic, besideAdministration(sim, *this) ? 1 : 0)) return;
    if (topic == 1) p->remaining[1] = 100;          // s7:25D8: Basic Research repeats
    else topic = 112;
}

// s6:6008
void UGUnivBuilding::resume(Simulation& sim) {
    Building::resume(sim);
    if (state == kOperational && counter20 > 0) --counter20;
}

namespace {
// s6:C0F0: running needs plus Luxury from the warehouses (group 4).
bool canAffordWithLuxury(Simulation& sim, Building& b, int32_t luxury) {
    const bool ok = b.canAffordNeeds(sim);
    Colony* c = b.colony(sim);
    if (!c || c->nanotech || c->freeResources) return ok;
    for (Tile* t : sim.colonyTilesInGroup(*c, 4)) {
        const auto* w = sim.db().get<WarehouseBuilding>(t->building);
        const int32_t has = w ? w->luxury() : 0;
        if (static_cast<uint32_t>(has) >= static_cast<uint32_t>(luxury)) { luxury = 0; break; }
        luxury -= has;
    }
    if (luxury == 0) return ok;
    if (Tile* own = b.tile(sim)) own->alloc.set(Luxury, luxury);
    return false;
}

// s6:C00A
void takeLuxury(Simulation& sim, Building& b, int32_t luxury) {
    Colony* c = b.colony(sim);
    if (!c) return;
    for (Tile* t : sim.colonyTilesInGroup(*c, 4)) {
        auto* w = sim.db().get<WarehouseBuilding>(t->building);
        if (!w) continue;
        const int32_t has = w->luxury();
        if (static_cast<uint32_t>(has) >= static_cast<uint32_t>(luxury)) {
            w->take(0, luxury);
            return;
        }
        w->take(0, has);
        luxury -= has;
    }
}
} // namespace

// s6:5412 / s6:5B42
void LuxuryUserBuilding::resume(Simulation& sim) {
    if (state != kSuspended) return;
    Colony* c = colony(sim);
    if (isRebelColony(c)) {
        setState(sim, kOperational);
        return;
    }
    if (tag1C == kRebels.value) return;
    if (!checkConnected(sim)) return;
    if (!canAffordWithLuxury(sim, *this, luxuryPerTurn())) return;
    payNeeds(sim);
    takeLuxury(sim, *this, luxuryPerTurn());
    setState(sim, kOperational);
}

// s5:D194: within 30 of the colony's hub, or anywhere with a ComSat (orbital
// item 0x87) up, or within 30 of another comm tower.
bool CommTowerBuilding::inRange(Simulation& sim) const {
    const Tile* own = tile(sim);
    Colony* c = colony(sim);
    if (!own || !c) return false;
    const Tile* hub = sim.db().get<Tile>(c->hub);
    if (!hub) return false;                          // IMPROVISED (guard): the original reads NULL
    const int d = Simulation::tileDistance(*hub, *own);
    if (d < 0) return false;
    if (d <= 30) return true;
    if (sim.orbitalCount(0x87) > 0) return true;
    for (Tile* t : sim.colonyTilesInGroup(*c, 21, false)) {
        const int d2 = Simulation::tileDistance(*t, *own);
        if (d2 > 0 && d2 <= 30) return true;
    }
    return false;
}

// s5:D0B8
void CommTowerBuilding::resume(Simulation& sim) {
    if (state != kSuspended) return;
    Colony* c = colony(sim);
    if (isRebelColony(c)) {
        setState(sim, kOperational);
        return;
    }
    if (!canAffordNeeds(sim) || !inRange(sim)) {
        setState(sim, kSuspended);
        return;
    }
    payNeeds(sim);
    setState(sim, kOperational);
}

// s6:01EC
void FactoryBuilding::resume(Simulation& sim) {
    if (state != kSuspended && state != kOperational) return;
    if (opsProductA == 20 || opsProductB == 16) {
        setState(sim, kSuspended);
        return;
    }
    Building::resume(sim);
}

// s6:0FA4
// s6:0FA4: a finished surface mine (group 2) gets a truck on its tile if it
// is the first one ever (DGROUP 0x4FBC) or automatic trucking is on.
void MineBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational) return;
    if (sim.data().groups.contains(2, type) && (!sim.firstMineDone() || sim.autoTrucking())) {
        sim.setFirstMineDone(true);
        if (Tile* t = tile(sim)) addUnits(sim, *t, 1, product::Truck);
    }
    life = 100;
}

// s6:0EA6
void MineBuilding::resume(Simulation& sim) {
    if (type == 16) return;                          // DisMine never resumes
    if (sim.data().groups.contains(19, type)) {      // UG mines
        if (life <= 0) {
            if (state == kOperational || state == kSuspended) {
                infoKind = InfoKind::None;           // the needs record is freed
                state = kExhausted;
            }
            return;
        }
    } else if (sim.data().groups.contains(2, type)) {   // surface ActiveMines
        if (state != 7 && state != kConstructing) {
            // s6:1556: ore is left while, going down from level 1 to the
            // planet's maximum digging depth (s7:2FAC), the cells under the
            // mine hold UG mines (group 19) or a RoboMine at work (117); the
            // first one not exhausted (state 9) says yes. Anything else on
            // the way (no tile, another building) says no.
            bool oreLeft = false;
            const Tile* mt = tile(sim);
            // IMPROVISED (I2, guard): a colony without a map (worlds the
            // rebuild makes without a site) has nothing to look at; ore is
            // left.
            if (mt && !sim.gridOfSite(mt->owner)) oreLeft = true;
            else if (const Tile* t = mt) {
                const uint16_t h = static_cast<uint16_t>(sim.planetHostility());
                const int16_t maxDepth = h <= 1 ? 4 : h <= 4 ? 3 : h <= 7 ? 2 : 1;
                const Grid* g = sim.gridOfSite(t->owner);
                for (int16_t level = 1; g && level <= maxDepth; ++level) {
                    const Tile* below = sim.db().get<Tile>(g->tileAt({t->x, t->y, level}));
                    const Building* b = below ? sim.db().get<Building>(below->building) : nullptr;
                    if (!b || !(sim.data().groups.contains(19, b->type) || b->type == 117)) break;
                    if (b->state != kExhausted) {
                        oreLeft = true;
                        break;
                    }
                }
            }
            if (!oreLeft) { state = kExhausted; return; }
            if (state == kExhausted) state = kOperational;
        }
    }
    Building::resume(sim);
    if (state == kOperational) --life;
}

int32_t WarehouseBuilding::luxury() const {
    int32_t n = 0;
    for (const ProductItem& i : items)
        if (i.productB != 0) n += i.quantity;        // kind 15 included here ...
    return n;
}

void WarehouseBuilding::take(uint16_t kind, int32_t amount) {
    for (auto it = items.begin(); it != items.end();) {
        if (it->productB == 0 || (kind != 0 && it->productB != kind) ||
            (it->productB == 15 && kind != 15)) {    // ... but not taken here (quirk)
            ++it;
            continue;
        }
        if (it->quantity > static_cast<uint32_t>(amount)) {
            const uint16_t per = static_cast<uint16_t>(it->units / it->quantity);
            it->quantity = static_cast<uint16_t>(it->quantity - amount);
            it->units = static_cast<uint16_t>(it->units - per * amount);
            return;
        }
        amount -= it->quantity;
        it = items.erase(it);
    }
}

uint32_t WarehouseBuilding::storedUnits() const {
    uint32_t n = 0;
    for (const ProductItem& i : items) n += i.units;
    return n;
}

bool WarehouseBuilding::isFull(Simulation&, int32_t& stored) {
    stored = static_cast<int32_t>(storedUnits());
    return storedUnits() >= 100;
}

uint32_t WarehouseBuilding::room() const {
    if (state != kOperational) return 0;
    const uint32_t stored = storedUnits();
    return stored < 100 ? 100 - stored : 0;
}

void WarehouseBuilding::add(const ProductItem& item) {
    bool merged = false;
    for (ProductItem& i : items) {
        if (i.field04 != item.field04 || i.productA != item.productA || i.productB != item.productB)
            continue;
        merged = true;                               // every match gets it (s6:6408)
        i.quantity = static_cast<uint16_t>(i.quantity + item.quantity);
        i.units = static_cast<uint16_t>(i.units + item.units);
    }
    if (!merged) items.push_back(item);
}

uint16_t WarehouseBuilding::quantityOfA(uint16_t product) const {
    for (const ProductItem& i : items)
        if (i.productA == product) return i.quantity;
    return 0;
}

void WarehouseBuilding::takeA(uint16_t product, uint32_t amount) {
    for (auto it = items.begin(); it != items.end();) {
        if (it->productA != product) {
            ++it;
            continue;
        }
        if (it->quantity > amount) {
            const uint16_t per = static_cast<uint16_t>(it->units / it->quantity);
            it->quantity = static_cast<uint16_t>(it->quantity - amount);
            it->units = static_cast<uint16_t>(it->units - amount * per);
            return;
        }
        amount -= it->quantity;
        it = items.erase(it);
    }
}

// ── RoboCmd ───────────────────────────────────────────────────────────────

uint16_t RoboCmdBuilding::nextWanted() {
    const uint16_t r = wanted;
    switch (wanted) {
        case 1:  wanted = 2; break;
        case 2:  wanted = 3; break;
        case 3:  wanted = 4; break;
        case 4:  wanted = 12; break;
        case 12: wanted = 8; break;
        case 8:  wanted = 9; break;
        case 9:  wanted = 11; break;
        case 11: wanted = 5; break;
        default: wanted = 1; break;
    }
    return r;
}

int RoboCmdBuilding::freeSlots() const {
    int n = 0;
    for (const Slot& s : slots)
        if (s.expires == 0) ++n;
    return n;
}

bool RoboCmdBuilding::hasRobot(uint16_t item) const {
    for (const Slot& s : slots)
        if (s.item == item) return true;
    return false;
}

void RoboCmdBuilding::receive(Simulation& sim, uint16_t item) {
    for (Slot& s : slots) {
        if (s.expires != 0) continue;
        s.expires = sim.turn() + 200;
        s.item = item;
        s.flag = (item >= 1 && item <= 4) || item == product::HumanoidWorkers ? 0 : 1;
        if (item == product::Explorer) {
            if (Colony* c = colony(sim)) addExplorers(*c, 1);
        } else if (Tile* t = tile(sim)) {
            addUnits(sim, *t, 1, item);
        }
        return;
    }
}

bool RoboCmdBuilding::release(Simulation& sim, uint16_t item) {
    for (Slot& s : slots) {
        if (s.item != item) continue;
        if (item == product::Explorer) {
            if (Colony* c = colony(sim)) loseExplorer(*c);
        } else if (Tile* t = tile(sim)) {
            removeUnits(sim, *t, 1, item);
        }
        s = Slot{};
        return true;
    }
    return false;
}

bool RoboCmdBuilding::releaseIdle(Simulation& sim, uint16_t item) {
    for (Slot& s : slots) {
        if (s.flag != 0 || s.item != item) continue;
        if (item == product::Explorer) {
            if (Colony* c = colony(sim)) loseExplorer(*c);      // s8:4900
        } else if (Tile* t = tile(sim)) {
            removeUnits(sim, *t, 1, item);                       // s7:6E9C
        }
        s = Slot{};
        return true;
    }
    return false;
}

int RoboCmdBuilding::assignRobots(int n, Handle tileHandle, uint16_t kind) {
    int count = 0;
    for (Slot& s : slots) {
        if (s.item != kind || s.field8 != 0) continue;
        s.field8 = tileHandle.value;
        s.flag = kind == product::Truck ? 2 : 1;
        ++count;
        if (--n == 0) break;
    }
    return count;
}

int RoboCmdBuilding::returnRobot(Simulation& sim, int n, Handle tileHandle, uint16_t kind) {
    int count = 0;
    for (Slot& s : slots) {
        if (s.field8 != tileHandle.value || s.item != kind) continue;
        if (s.flag != 4) {
            s.flag = 0;                                            // free for work again
            s.field8 = 0;
        } else {
            // s7:CD2D: back to a warehouse as a kit. The unit leaves this
            // RoboCmd's tile (s7:6E9C); the kit goes to the first operational
            // warehouse of colony 1 that is not full (s8:4D6E with handle
            // 0x04000001, s6:6408), whatever colony the robot was in.
            if (Tile* t = tile(sim)) removeUnits(sim, *t, 1, kind);
            s = Slot{};
            const ProductItem kit{kind, 0, 1, productUnitValueA(kind), 0};
            if (const Colony* c1 = sim.db().get<Colony>(Handle::make(ObjType::Colony, 1)))
                for (Tile* wt : sim.colonyTilesInGroup(*c1, 4)) {
                    auto* wh = sim.db().get<WarehouseBuilding>(wt->building);
                    int32_t stored = 0;
                    if (!wh || wh->isFull(sim, stored)) continue;    // slot 16
                    wh->add(kit);
                    break;
                }
        }
        ++count;
        if (--n == 0) break;
    }
    return count;
}

// s7:D3B2: a Repair Robot (in another slot here, or in another operational
// RoboCmd of the colony) and a Fuel Cell from an operational warehouse keep
// the robot for another 200 turns.
bool RoboCmdBuilding::renew(Simulation& sim, size_t k) {
    Colony* c = colony(sim);
    if (!c) return false;
    bool repair = false;
    for (size_t j = 0; j < slots.size(); ++j)                         // s7:D36E
        if (j != k && slots[j].item == product::RepairRobots) repair = true;
    if (!repair) {
        for (Tile* t : sim.colonyTilesInGroup(*c, 30)) {
            const auto* other = sim.db().get<RoboCmdBuilding>(t->building);
            if (other && other->self != self && other->hasRobot(product::RepairRobots)) {
                repair = true;
                break;
            }
        }
        if (!repair) return false;
    }
    bool fuelled = false;
    for (Tile* t : sim.colonyTilesInGroup(*c, 4)) {
        auto* wh = sim.db().get<WarehouseBuilding>(t->building);
        if (wh && wh->quantityOfA(product::FuelCells) != 0) {
            wh->takeA(product::FuelCells, 1);
            fuelled = true;
            break;
        }
    }
    if (!fuelled) return false;
    slots[k].expires = sim.turn() + 200;
    return true;
}

void RoboCmdBuilding::produce(Simulation& sim) {
    const uint32_t turn = sim.turn();
    for (size_t k = 0; k < slots.size(); ++k) {
        Slot& s = slots[k];
        if (s.expires == 0 || s.expires > turn) continue;
        if (renew(sim, k)) continue;
        if (s.item == product::Explorer) {
            if (Colony* c = colony(sim)) loseExplorer(*c);
        } else if (Tile* t = tile(sim)) {
            removeUnits(sim, *t, 1, s.item);
        }
        s = Slot{};
    }
}

void RoboCmdBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational || sim.firstRoboCmdDone()) return;
    sim.setFirstRoboCmdDone();
    int trucks = 0;
    int free = freeSlots();
    const Colony* c = colony(sim);
    // IMPROVISED (guard): the original reads the hub tile's units without
    // checking that there is a hub, or any units on it.
    if (Tile* hub = c ? sim.db().get<Tile>(c->hub) : nullptr) {
        const size_t n = hub->linked.size();
        for (size_t i = 0; i < n && free != 0; ++i) {
            const Unit* u = sim.db().get<Unit>(hub->linked[i]);
            if (!u || u->kind < product::Dozer || u->kind > product::Truck) continue;
            const uint16_t kind = u->kind;
            if (kind == product::Truck) ++trucks;
            removeUnits(sim, *hub, 1, kind);
            receive(sim, kind);
            --free;
        }
    }
    while (trucks++ < 4) receive(sim, product::Truck);
}

// ── The player's placement rules ──────────────────────────────────────────

namespace {
// s6:C23E: a tile of another colony of the same player changes colony (the
// old one drops it, slot 6; the new one adds it, slot 2); a tile of another
// player's colony refuses (no message).
bool takeOverTile(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    Grid* g = sim.gridOfSite(site);
    Tile* t = g ? sim.db().get<Tile>(g->tileAt(pos)) : nullptr;
    if (!t || t->colony == colony) return true;
    Colony* from = sim.db().get<Colony>(t->colony);
    Colony* to = sim.db().get<Colony>(colony);
    if (!from || !to || from->player != to->player) return false;
    from->tiles.blank(t->self);                                    // s7:18F0
    if (!to->tiles.contains(t->self)) to->tiles.add(t->self, sim.data().priorityOf(0));
    t->colony = colony;                                            // s7:73EE
    return true;
}

// s6:C314: inside the map with a margin of 2.
bool insideMargin(Simulation& sim, const MapCell& pos, Handle site) {
    const Site* s = sim.db().get<Site>(site);
    const int16_t w = s ? s->mapSize.x : 0, h = s ? s->mapSize.y : 0;
    if (pos.x > 1 && pos.y > 1 && pos.x < w - 1 && pos.y < h - 1) return true;
    sim.placeMessage().id = 1720;                                   // "Dangerous Terrain"
    return false;
}
} // namespace

bool Building::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    const uint16_t kind = sim.cellKind(site, pos);
    if (kind != 5 && kind != 6) {
        sim.placeMessage().id = 1704;                               // "not possible on this terrain"
        return false;
    }
    return inRangeToPlace(sim, pos, colony, site) && connectsToPlace(sim, pos, site) &&
           takeOverTile(sim, pos, colony, site) && insideMargin(sim, pos, site);
}

bool Building::inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    const Colony* c = sim.db().get<Colony>(colony);
    const Tile* hub = c ? sim.db().get<Tile>(c->hub) : nullptr;
    // IMPROVISED (guard): the original resolves the hub without a check.
    int d = -1;
    if (hub && hub->owner == site) d = std::abs(hub->x - pos.x) + std::abs(hub->y - pos.y);   // s7:BCDE
    if (d < 0) {
        sim.placeMessage().id = 1711;
        return false;
    }
    if (d > 30) {
        sim.placeMessage() = {1718, static_cast<int16_t>(d - 30)};
        return false;
    }
    return true;
}

bool Building::connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) {
    Grid* g = sim.gridOfSite(site);
    if (!g) return false;
    auto tubeAt = [&](int16_t x, int16_t y, uint16_t tube) {      // s6:C5A6
        const Tile* t = sim.db().get<Tile>(g->tileAt({x, y, pos.level}));
        const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
        if (!b) return false;
        // IMPROVED (I113): the colony's core buildings join like a tube: the
        // Seed's parts and Command Centers (11..14, 55), and an Air Shaft's
        // top and bottom (71, 106), unless wrecked. v1.51 asks for a tube.
        switch (b->type) {
            case 11: case 12: case 13: case 14: case 55: case 71: case 106:
                if (b->state != 7) return true;
                break;
            default:
                break;
        }
        uint16_t cross = 122;
        if (pos.level > 0) {
            tube = tube == 123 ? uint16_t{126} : uint16_t{125};
            cross = 127;
        }
        return b->type == cross || b->type == tube;
    };
    return tubeAt(pos.x, int16_t(pos.y - 1), 123) || tubeAt(pos.x, int16_t(pos.y + 1), 123) ||
           tubeAt(int16_t(pos.x - 1), pos.y, 124) || tubeAt(int16_t(pos.x + 1), pos.y, 124);
}

namespace {
// s7:BCDE from the colony's hub; -1 on another site or without a hub.
int hubDistance(Simulation& sim, Handle colony, Handle site, const MapCell& pos) {
    const Colony* c = sim.db().get<Colony>(colony);
    const Tile* hub = c ? sim.db().get<Tile>(c->hub) : nullptr;
    if (!hub || hub->owner != site) return -1;
    return std::abs(hub->x - pos.x) + std::abs(hub->y - pos.y);
}

// s6:C3AA: within 30 of the hub; else a ComSat (0x87) up; else within 30 of
// one of the colony's operational comm towers (group 21); else 1718 with
// the shortest distance less 30.
bool inLongRange(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    const int d = hubDistance(sim, colony, site, pos);
    if (d < 0) {
        sim.placeMessage().id = 1711;
        return false;
    }
    if (d <= 30 || sim.orbitalCount(0x87) != 0) return true;
    int best = d;
    if (const Colony* c = sim.db().get<Colony>(colony))
        for (Tile* t : sim.colonyTilesInGroup(*c, 21)) {
            if (t->owner != site) continue;
            const int dt = std::abs(t->x - pos.x) + std::abs(t->y - pos.y);
            if (dt > 0 && dt <= 30) return true;
            if (dt > 0 && dt < best) best = dt;
        }
    sim.placeMessage() = {1718, static_cast<int16_t>(best - 30)};
    return false;
}

// s6:09D4
bool landerRule(Simulation& sim, const Building& b, const MapCell& pos, Handle colony, Handle site) {
    if (!insideMargin(sim, pos, site)) return false;
    const uint16_t kind = sim.cellKind(site, pos);
    if (kind == 0 || kind == 4 || (kind >= 6 && kind <= 9)) {
        sim.placeMessage().id = 1704;
        return false;
    }
    if (b.type != 62 && b.type != 65) return true;
    const int d = hubDistance(sim, colony, site, pos);
    if (d < 0) {
        sim.placeMessage().id = 1711;
        return false;
    }
    if (d > 5) {
        sim.placeMessage().id = 1717;                           // "Landers must land within 5 tiles of Seed."
        return false;
    }
    return true;
}

// s6:297C: an ordinary building on the cell (kind 0, and not a DisMine,
// mine, lander, Destroyed, road, UG mine, UG Tokamak, type 110 or robot).
bool ordinaryBuildingAt(Simulation& sim, const MapCell& pos, Handle site) {
    if (sim.cellKind(site, pos) != 0) return false;
    Grid* g = sim.gridOfSite(site);
    const Tile* t = g ? sim.db().get<Tile>(g->tileAt(pos)) : nullptr;
    const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
    if (!b) return false;
    const uint16_t ty = b->type;
    if (ty == 16 || ty == 51 || ty == 52 || ty == 62 || ty == 65 || ty == 110) return false;
    if ((ty >= 72 && ty <= 74) || (ty >= 76 && ty <= 78) || (ty >= 96 && ty <= 99) || (ty >= 115 && ty <= 121))
        return false;
    return true;
}
} // namespace

bool SmelterBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    const uint16_t kind = sim.cellKind(site, pos);
    if (kind != 5 && kind != 6) {
        sim.placeMessage().id = 1704;
        return false;
    }
    return inRangeToPlace(sim, pos, colony, site) && takeOverTile(sim, pos, colony, site) &&
           insideMargin(sim, pos, site);
}

bool CommTowerBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (sim.cellKind(site, pos) != 5) {
        sim.placeMessage().id = 1704;
        return false;
    }
    return takeOverTile(sim, pos, colony, site) && inLongRange(sim, pos, colony, site) &&
           insideMargin(sim, pos, site);
}

bool RoadBuilding::inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (hubDistance(sim, colony, site, pos) >= 0) return true;
    sim.placeMessage().id = 1711;
    return false;
}

bool ColonistLanderBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    return landerRule(sim, *this, pos, colony, site);
}

bool CargoLanderBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    return landerRule(sim, *this, pos, colony, site);
}

bool SeedBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (!landerRule(sim, *this, pos, colony, site)) return false;
    for (int dy = -1; dy <= 1; ++dy)
        for (int dx = -1; dx <= 1; ++dx) {
            if (dx == 0 && dy == 0) continue;
            if (sim.cellKind(site, {int16_t(pos.x + dx), int16_t(pos.y + dy), pos.level}) == 0) {
                sim.placeMessage().id = 1704;
                return false;
            }
        }
    return true;
}

bool CommandCenterBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle, Handle site) {
    if (!insideMargin(sim, pos, site)) return false;
    Grid* g = sim.gridOfSite(site);
    if (!g || g->tileAt(pos)) return false;                         // no message
    const uint16_t kind = sim.cellKind(site, pos);
    if (kind == 4 || kind == 0) {
        sim.placeMessage().id = 1704;
        return false;
    }
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {    // every colony (DbIter, type 4)
        // IMPROVISED (guard): a colony without a hub is skipped; the
        // original reads it through a NULL tile.
        if (!sim.db().get<Tile>(c->hub)) continue;
        const int d = hubDistance(sim, c->self, site, pos);
        // IMPROVED (I110): a colony on another site does not stand in the
        // way; v1.51 refuses with 1711 (quirk Q56), so no colony could ever
        // be founded on a second site. Here a Command Center on a site with
        // no hub founds one (its reserve moves 2 colonists, the starting
        // stock and robot kits over from the parent, s7:C2FA).
        if (d < 0) continue;
        if (d <= 30) {
            sim.placeMessage().id = 1710;                           // "too close to an existing Command Center"
            return false;
        }
    }
    return true;
}

bool PipeBuilding::connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) {
    const MapCell n[4] = {{pos.x, int16_t(pos.y - 1), pos.level}, {pos.x, int16_t(pos.y + 1), pos.level},
                          {int16_t(pos.x - 1), pos.y, pos.level}, {int16_t(pos.x + 1), pos.y, pos.level}};
    Grid* g = sim.gridOfSite(site);
    const bool ug = pos.level > 0;
    for (int i = 0; i < 4; ++i) {
        const Tile* t = g ? sim.db().get<Tile>(g->tileAt(n[i])) : nullptr;
        const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
        const uint16_t axis = i < 2 ? (ug ? 126 : 123) : (ug ? 125 : 124);
        if (b && (b->type == axis || b->type == (ug ? 127 : 122))) return true;   // s6:C5A6
        if (ordinaryBuildingAt(sim, n[i], site)) return true;                    // s6:297C
    }
    return false;
}

// ── Robots at work (RoboDozer) ────────────────────────────────────────────

uint16_t RobotBuilding::unitKind() const {
    switch (type) {
        case 115: case 119: return product::Dozer;
        case 116: case 120: return product::Digger;
        case 117:           return product::Miner;
        default:            return 0;
    }
}

void RobotBuilding::beginConstruction(Simulation& sim) {
    if (isDigger()) return setState(sim, 2);                  // s5:DA3C
    if (cls == BuildingClass::RoboMine) return setState(sim, 2);   // s6:1812
    if (!isDozer()) return Building::beginConstruction(sim);
    setState(sim, 1);
}

// s7:DF0C: the first RoboCmd of the colony's table with a free robot of the
// kind (s7:CDE8: item == kind, flag 0) lends it: flag 1, +8 = this tile
// (s7:CEF8); the robot remembers the RoboCmd.
void RobotBuilding::reserveNeeds(Simulation& sim, uint16_t arg) {
    if (isDigger() && type == 121) return;                     // s5:D9FA: a tunnel piece claims nothing
    if (cls == BuildingClass::RoboExplr) return;                // s6:2B46: claims nothing
    // s6:17D8: the RoboMine claims its Miner the same way.
    if (!isDozer() && !isDigger() && cls != BuildingClass::RoboMine) return Building::reserveNeeds(sim, arg);
    Tile* t = tile(sim);
    Colony* c = colony(sim);
    if (!t || !c) return;
    const uint16_t kind = unitKind();
    for (Handle rh : c->roboCommands) {
        const Tile* rt = sim.db().get<Tile>(rh);
        auto* rc = rt ? sim.db().get<RoboCmdBuilding>(rt->building) : nullptr;
        if (!rc) continue;
        auto slot = std::find_if(rc->slots.begin(), rc->slots.end(),
                                 [kind](const RoboCmdBuilding::Slot& s) { return s.item == kind && s.flag == 0; });
        if (slot == rc->slots.end()) continue;
        slot->flag = 1;
        slot->field8 = t->self.value;
        long20 = rc->self.value;
        break;
    }
    c->linkedBusy[kind] += 1;                               // s8:57DC(colony, 1, kind)
}

void RobotBuilding::onStateEntered(Simulation& sim) {
    if (isDigger()) return digOnStateEntered(sim);
    if (cls == BuildingClass::RoboMine) {                       // s6:1B1E
        turnsLeft = 7;
        return;
    }
    if (!isDozer() || state != 1) return Building::onStateEntered(sim);
    const Tile* t = tile(sim);
    const int16_t mark = groundMark >= 0 ? groundMark : t ? t->mark14 : 0;
    switch (mark) {
        case 2: case 7: turnsLeft = 2; break;
        case 3: case 8: turnsLeft = 3; break;
        case 5: case 6: turnsLeft = 1; break;
        default:        turnsLeft = mark; break;                   // 4 and anything else
    }
    if (groundMark >= 0 && turnsLeft < 1) turnsLeft = 1;           // I59: never no time at all
}

void RobotBuilding::constructTick(Simulation& sim) {
    if (isDigger()) return digTick(sim);
    if (cls == BuildingClass::RoboMine) return mineTick(sim);
    if (!isDozer()) return Building::constructTick(sim);
    if (--turnsLeft != 0) return;
    state = 0;
    Tile* t = tile(sim);
    Colony* c = colony(sim);
    if (!t) return;
    t->mark14 = t->level > 0 ? 6 : 5;
    const Handle colonyHandle = t->colony;
    // s5:EE3A: SCInternalPutBldg with the +0x11C flag (the mark stays).
    sim.putBuilding(*t, t->level >= 1 ? 9 : 5, true);
    if (c) {
        c->linkedBusy[product::Dozer] -= 1;                 // s8:5804
        if (word24 > 0) sim.enqueue(makeAddSpewStep(colonyHandle, static_cast<int16_t>(word24)));
    }
}

// s7:DCF4 (the robot's destructor): its robot goes back to its RoboCmd.
// Kinds by type: 115, 119 Dozer; 116, 120 Digger; 117 Miner; 118 Explorer;
// a tunnel piece (121) has none.
void RobotBuilding::onDestroy(Simulation& sim) {
    uint16_t kind = 0;
    switch (type) {
        case 115: case 119: kind = product::Dozer; break;
        case 116: case 120: kind = product::Digger; break;
        case 117: kind = product::Miner; break;
        case 118: kind = product::Explorer; break;
        default: return;
    }
    const Tile* t = tile(sim);
    if (long20 != 0) {
        auto* rc = sim.db().get<RoboCmdBuilding>(Handle{long20});
        if (rc && t) rc->returnRobot(sim, 1, t->self, kind);      // s7:CC44
        return;
    }
    // s7:DDB0: without a RoboCmd, the first operational RoboCmd of the
    // colony (colony 1 when the robot has no tile) with a robot of the
    // kind that is working without one (slot flag 3) frees it (s7:CBF0).
    const Colony* c = t ? sim.db().get<Colony>(t->colony) : sim.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    if (!c) return;
    for (Tile* rt : sim.colonyTilesInGroup(*c, 30)) {               // s8:4D6E
        auto* rc = sim.db().get<RoboCmdBuilding>(rt->building);
        if (!rc) continue;
        for (RoboCmdBuilding::Slot& s : rc->slots)
            if (s.item == kind && s.flag == 3) {
                s.flag = 0;
                s.field8 = 0;
                return;
            }
    }
}

// ── RoboMine (117) ────────────────────────────────────────────────────────

int16_t maxDigDepth(int16_t hostility) {
    const uint16_t h = static_cast<uint16_t>(hostility);
    return h <= 1 ? 4 : h <= 4 ? 3 : h <= 7 ? 2 : 1;
}

// IMPROVISED (I63, guard): the original's panel offers the surface robots
// (115, 116) on the surface and the UG ones (119, 120) below, so their
// placement rules never check the level; a type put on the other kind of
// level (digFinish knows no such case) would work forever. Refused here.
static bool robotOnWrongLevel(uint16_t type, int16_t level) {
    if (type == 115 || type == 116) return level != 0;
    if (type == 119 || type == 120) return level == 0;
    return false;
}

bool RobotBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (robotOnWrongLevel(type, pos.level)) return false;
    if (!isDozer()) return Building::canPlace(sim, pos, colony, site);
    if (!inLongRange(sim, pos, colony, site) || !takeOverTile(sim, pos, colony, site) ||
        !insideMargin(sim, pos, site))
        return false;
    const uint16_t kind = sim.cellKind(site, pos);
    if (kind == 4 || kind == 5 || kind == 6 || kind == 9) {
        sim.placeMessage().id = 1704;                   // "not possible on this terrain"
        return false;
    }
    if (kind != 0) return true;
    Grid* g = sim.gridOfSite(site);
    Tile* t = g ? sim.db().get<Tile>(g->tileAt(pos)) : nullptr;
    Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
    if (t && t->colony != colony) {
        sim.placeMessage().id = 1719;
        return false;
    }
    if (b) {
        const uint16_t ty = b->type;
        if ((ty == 62 || ty == 65) && b->state == kConstructing) {
            sim.placeMessage().id = 1713;
            return false;
        }
        if (ty == 11 || ty == 55) {
            sim.placeMessage().id = 1716;
            return false;
        }
        if (ty == 66 || ty == 75 || ty == 107) {
            sim.placeMessage().id = 1713;
            return false;
        }
        if (ty == 16 || ty == 110) return false;
        if (ty >= 115 && ty <= 121) {
            sim.placeMessage().id = 1712;
            return false;
        }
    }
    // s9:8520: "Do you want to doze this building?" (1512, caption 1403).
    // The caller answers through playerPutBuilding; "No" leaves message 1
    // in the original, 1512 here so the UI knows to ask (I61).
    if (!sim.dozeConfirmed()) {
        sim.placeMessage().id = 1512;
        return false;
    }
    if (!t) return true;
    t->bas.clear();                                     // s7:7296
    clearUnits(sim, *t);                                // s7:730A
    if (b) {
        b->wreck(sim);                                  // slot 9
        if (b->type < sim.data().bldgBld.size()) word24 = sim.data().bldgBld[b->type].word96;   // s6:BC4A
        // SCKillBldg (s5:EC88): putBuilding enqueues it for the building
        // the dozer replaces.
    }
    return true;
}

// s6:1824: the long range and the margin; then the cell must hold a DisMine
// (16) on the surface (1707 below it), or a UG mine (96, 97) above the
// planet's maximum depth (1708) with diggable ground below (cell kind not
// 0 or 6); anything else is 1706.
bool RoboMineBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (!inLongRange(sim, pos, colony, site) || !insideMargin(sim, pos, site)) return false;
    Grid* g = sim.gridOfSite(site);
    const Tile* t = g ? sim.db().get<Tile>(g->tileAt(pos)) : nullptr;
    const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
    const uint16_t ty = b ? b->type : 0;
    if (ty == 16) {
        if (pos.level == 0) return true;
        sim.placeMessage().id = 1707;                   // "Mine shafts must be started on the surface."
        return false;
    }
    if (ty != 96 && ty != 97) {
        sim.placeMessage().id = 1706;                   // "The robominer may only be placed on a mine."
        return false;
    }
    // The original compares with registry 0x2F +0x1E, the level in view;
    // the robot is placed on that level, so pos.level stands for it.
    if (maxDigDepth(sim.planetHostility()) <= pos.level) {
        sim.placeMessage().id = 1708;                   // "This is the maximum digging depth for this planet."
        return false;
    }
    const uint16_t below = sim.cellKind(site, {pos.x, pos.y, int16_t(pos.level + 1)});
    return below != 0 && below != 6;
}

// s6:199A: after 7 turns the Miner is free again, the cell becomes a mine
// (51 on the surface, 96 below) and a UG mine (96) goes in below, deepening
// the site (s7:5B3E). The original uses the site in view (registry 0x2F
// +0x20); that is the robot's own site.
void RobotBuilding::mineTick(Simulation& sim) {
    if (--turnsLeft != 0) return;
    Tile* t = tile(sim);
    Colony* c = colony(sim);
    if (c) c->linkedBusy[product::Miner] -= 1;              // s8:5804
    if (!t) return;
    const Handle site = t->owner, colonyHandle = t->colony;
    const MapCell at{t->x, t->y, t->level};
    if (Site* s = sim.db().get<Site>(site))
        if (at.level + 1 > static_cast<int16_t>(s->depth)) s->depth = static_cast<uint16_t>(at.level + 1);
    sim.putBuildingAt(site, at, at.level < 1 ? 51 : 96, colonyHandle);
    sim.putBuildingAt(site, {at.x, at.y, int16_t(at.level + 1)}, 96, colonyHandle);
}

// ── Changing sides (slot 22) ──────────────────────────────────────────────

namespace {
// s6:B46E
void handOverBase(Simulation& sim, Building& b, const Colony& to) {
    Tile* t = b.tile(sim);
    if (!t) return;
    t->route.clear();                                          // s7:6D80
    const int16_t n = t->field32;
    if (n != 0) {
        t->trucks = std::min<int16_t>(t->field32, 0);          // s7:6C4C
        if (Colony* c = sim.db().get<Colony>(t->colony)) retaskTrucks(sim, *c, 0, n, *t);   // s8:387E
    }
    t->bas.clear();                                            // s7:7296
    b.tag1C = to.player.value;
}

// The building on the cell one level below `b`, if any.
Building* buildingBelow(Simulation& sim, const Building& b) {
    const Tile* t = b.tile(sim);
    Grid* g = t ? sim.gridOfSite(t->owner) : nullptr;
    const Tile* u = g ? sim.db().get<Tile>(g->tileAt({t->x, t->y, int16_t(t->level + 1)})) : nullptr;
    return u ? sim.db().get<Building>(u->building) : nullptr;
}

int16_t planetDigDepth(const Simulation& sim) { return maxDigDepth(sim.planetHostility()); }
} // namespace

void handOver(Simulation& sim, Building& b, const Colony& to) {
    using C = BuildingClass;
    switch (b.cls) {
        case C::RoboCmd: {                                     // s7:CA26
            auto& rc = static_cast<RoboCmdBuilding&>(b);
            Tile* t = rc.tile(sim);
            for (RoboCmdBuilding::Slot& s : rc.slots) {
                if (s.flag == 2 || s.flag == 1) {
                    s.flag = 4;                                // home as a kit when done
                } else {
                    if (t && s.item) removeUnits(sim, *t, 1, s.item);   // s7:6E9C
                    s = RoboCmdBuilding::Slot{};
                }
            }
            handOverBase(sim, b, to);
            return;
        }
        case C::SpacePort:                                     // s6:40B8
            if (Building* u = buildingBelow(sim, b); u && u->type == 100) handOver(sim, *u, to);
            b.wreck(sim);                                      // s6:B514, instead of the base
            return;
        case C::Tokamak:                                       // s6:4BF2
            if (Building* u = buildingBelow(sim, b); u && (u->type == 98 || u->type == 99)) handOver(sim, *u, to);
            handOverBase(sim, b, to);
            return;
        case C::Mine: {                                        // s6:0C84
            const Tile* t = b.tile(sim);
            if (t && t->level + 1 <= planetDigDepth(sim))
                if (Building* u = buildingBelow(sim, b)) handOver(sim, *u, to);
            handOverBase(sim, b, to);
            if (Tile* tt = b.tile(sim)) tt->bas.clear();       // s7:7296 again
            return;
        }
        case C::Core: {                                        // s5:D5F2
            const Tile* t = b.tile(sim);
            if (t && t->level + 1 < planetDigDepth(sim))
                if (Building* u = buildingBelow(sim, b)) handOver(sim, *u, to);
            handOverBase(sim, b, to);
            return;
        }
        case C::Lab:                                           // s7:C74E
            handOverBase(sim, b, to);
            static_cast<LabBuilding&>(b).topic = 112;          // "None"
            return;
        case C::Warehouse:                                     // s6:61C4
            handOverBase(sim, b, to);
            static_cast<WarehouseBuilding&>(b).items.clear();
            return;
        case C::Factory:
        case C::SeedFact:
        case C::UGFact:                                        // s6:0176
            handOverBase(sim, b, to);
            static_cast<FactoryBuilding&>(b).output.clear();
            // s7:7F1A(tile, 20) tells the building's window (front end).
            return;
        default:
            // s6:B46E. Storage tanks (s6:456E) also free an object at +0x20
            // that the rebuild does not keep.
            handOverBase(sim, b, to);
            return;
    }
}

// ── RoboDigger (116, 120, 121) ────────────────────────────────────────────

namespace {
// s6:C8EE: a position moved one step in a digger's direction: 1 down a
// level, 2 y-1, 3 y+1, 4 x+1, 5 x-1; anything else stays.
MapCell stepInDirection(MapCell p, uint16_t dir) {
    switch (dir) {
        case 1: ++p.level; break;
        case 2: --p.y; break;
        case 3: ++p.y; break;
        case 4: ++p.x; break;
        case 5: --p.x; break;
        default: break;
    }
    return p;
}

// s5:E4FA: turns of digging by a cell's mark (or terrain number).
int16_t digTurns(int16_t mark, int16_t ownMark) {
    switch (mark) {
        case 2: case 5: case 6: case 7: return 4;
        case 3: case 8:                 return 5;
        default:                        return static_cast<int16_t>(ownMark + 2);
    }
}

// s6:C89C: a cell's raw value as a number: a tile's mark (+0x14) when the
// cell holds a tile, else its terrain.
int16_t cellMark(Simulation& sim, Handle site, const MapCell& c) {
    Grid* g = sim.gridOfSite(site);
    if (!g) return 0;
    if (const Tile* t = sim.db().get<Tile>(g->tileAt(c))) return t->mark14;
    return static_cast<int16_t>(g->terrain(c));
}

} // namespace

// s6:CCD0 (also the AI's s7:A044): around a dug cell (same level, clamped to the map) the empty
// underground terrain softens: 7 -> terrain 6, 8 -> 7, 9 -> 8.
void soften(Simulation& sim, Handle site, Handle colony, const MapCell& at) {
    Grid* g = sim.gridOfSite(site);
    if (!g) return;
    const int16_t x0 = std::max<int16_t>(0, int16_t(at.x - 1)), x1 = std::min<int16_t>(int16_t(g->width() - 1), int16_t(at.x + 1));
    const int16_t y0 = std::max<int16_t>(0, int16_t(at.y - 1)), y1 = std::min<int16_t>(int16_t(g->height() - 1), int16_t(at.y + 1));
    for (int16_t y = y0; y <= y1; ++y)
        for (int16_t x = x0; x <= x1; ++x) {
            const MapCell c{x, y, at.level};
            if (g->tileAt(c)) continue;
            const uint16_t t = g->terrain(c);
            if (t >= 7 && t <= 9) sim.putBuildingAt(site, c, static_cast<uint16_t>(t - 1), colony);
        }
}
bool RobotBuilding::isDigger() const { return cls == BuildingClass::RoboDigger; }

// s5:E39C: the robot's cell becomes `result` (mark 5, or 6 below ground;
// SCInternalPutBldg with the mark flag set).
void RobotBuilding::finishAs(Simulation& sim, uint16_t result) {
    Tile* t = tile(sim);
    if (!t) return;
    t->mark14 = t->level > 0 ? 6 : 5;
    sim.putBuilding(*t, result, true);
}

void RobotBuilding::digOnStateEntered(Simulation& sim) {
    if (type == 121) {
        turnsLeft = static_cast<int16_t>(word24);
        word24 = 0;
    }
    if (word24 == 6) {
        turnsLeft = 1;
        return;
    }
    const Tile* t = tile(sim);
    if (!t) return;
    const int16_t own = t->mark14;
    const MapCell to = stepInDirection({t->x, t->y, t->level}, word24);
    turnsLeft = static_cast<int16_t>(digTurns(own, own) + digTurns(cellMark(sim, t->owner, to), own));
}

void RobotBuilding::digTick(Simulation& sim) {
    if (state != 2) return;
    --turnsLeft;
    Tile* t = tile(sim);
    if (!t) return;
    if (word26 == 0 && type == 120) {                     // s5:E294: a side tunnel goes on
        if (word24 >= 2 && word24 <= 5) {
            const MapCell to = stepInDirection({t->x, t->y, t->level}, word24);
            Grid* g = sim.gridOfSite(t->owner);
            if (g && !g->tileAt(to) && g->terrain(to) == 9) turnsLeft = 1;
            sim.putBuildingAt(t->owner, to, 121, t->colony);
        }
        word26 = 1;
    }
    if (turnsLeft == 0) {
        digFinish(sim);
        return;
    }
    if (word24 == 6) placeholderType = 73;
}

// s5:E08E
void RobotBuilding::digFinish(Simulation& sim) {
    Tile* t = tile(sim);
    if (!t) return;
    const Handle site = t->owner, colonyHandle = t->colony;
    const MapCell at{t->x, t->y, t->level};
    const uint16_t dir = word24;
    // s5:E49A: by the tile's mark: 6 -> dug ground 9, 7 -> 6, 8 -> 7, 9 -> 8.
    auto byMark = [&]() -> uint16_t {
        switch (t->mark14) {
            case 6: return 9;
            case 7: return 6;
            case 8: return 7;
            case 9: return 8;
            default: return 0;
        }
    };
    switch (type) {
        case 116:
            if (dir == 1) finishAs(sim, 71);              // Core
            else if (dir == 6) finishAs(sim, 1);
            // IMPROVISED (I63): a surface digger below ground (saves made
            // before the level guard) digs sideways as a UG one would.
            else if (dir >= 2 && dir <= 5 && at.level > 0) finishAs(sim, byMark());
            break;
        case 120:
            if (dir == 1) finishAs(sim, 106);             // UGCore
            else if (dir >= 2 && dir <= 5) finishAs(sim, byMark());
            else if (dir == 6) {
                finishAs(sim, 6);
                // s5:DCA8: a cave-in wrecks the buildings on the 8 cells
                // around (clamped to the map; terrain and robots spared,
                // s5:DC1C).
                if (Grid* g = sim.gridOfSite(site)) {
                    for (int dy = -1; dy <= 1; ++dy)
                        for (int dx = -1; dx <= 1; ++dx) {
                            if (!dx && !dy) continue;
                            const MapCell c{int16_t(std::clamp(at.x + dx, 0, g->width() - 1)),
                                            int16_t(std::clamp(at.y + dy, 0, g->width() - 1)), at.level};
                            const Tile* nt = sim.db().get<Tile>(g->tileAt(c));
                            Building* nb = nt ? sim.db().get<Building>(nt->building) : nullptr;
                            if (!nb || (nb->type >= 1 && nb->type <= 9) || (nb->type >= 115 && nb->type <= 121)) continue;
                            nb->wreck(sim);
                        }
                }
            }
            break;
        case 121:
            finishAs(sim, byMark());
            return;
        default:
            finishAs(sim, 71);
            break;
    }
    Colony* c = sim.db().get<Colony>(colonyHandle);
    if (c) {
        c->linkedBusy[product::Digger] -= 1;                 // s8:5804
        if (dir == 6) loseRobots(sim, *c, 1, product::Digger);   // s8:43CC
    }
    if (dir == 6 && at.level == 0) return;
    const MapCell to = stepInDirection(at, dir);
    if (dir == 1) {
        if (Site* s = sim.db().get<Site>(site))
            if (to.level > static_cast<int16_t>(s->depth)) s->depth = static_cast<uint16_t>(to.level);   // s7:5B3E
        sim.putBuildingAt(site, to, 106, colonyHandle);    // the shaft goes on below
    }
    soften(sim, site, colonyHandle, to);                  // s6:CCD0
}

// s5:DA4E: not on a DisMine (1705); the slot-24 range, the owner rule and
// the margin; on the surface (unless cell kind 4) a tube. Then by level:
// s5:DEAC on the surface, s5:DF10 below. Where the original asks for the
// direction (s5:DE32, dialog 4; no answer -> 1714) the rebuild takes the
// direction the caller set in +0x24, as with the police mode.
bool RoboDiggerBuilding::canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (robotOnWrongLevel(type, pos.level)) return false;
    Grid* g = sim.gridOfSite(site);
    const Tile* t = g ? sim.db().get<Tile>(g->tileAt(pos)) : nullptr;
    const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
    if (b && b->type == 16) {
        sim.placeMessage().id = 1705;
        return false;
    }
    const uint16_t kind = sim.cellKind(site, pos);
    if (!inRangeToPlace(sim, pos, colony, site) || !takeOverTile(sim, pos, colony, site) ||
        !insideMargin(sim, pos, site))
        return false;
    if (pos.level == 0 && kind != 4 && !connectsToPlace(sim, pos, site)) return false;
    auto askDirection = [&]() {
        if (word24 == 0) sim.placeMessage().id = 1714;
    };
    // s5:E044: the level in view (registry 0x2F +0x1E; pos.level here) is
    // at the planet's maximum depth.
    const bool atMaxDepth = pos.level >= maxDigDepth(sim.planetHostility());
    if (pos.level == 0) {                                          // s5:DEAC
        if ((kind >= 1 && kind <= 3) || kind == 5) {
            word24 = 1;
            return true;
        }
        if (kind != 4) return false;
        askDirection();
        return word24 == 6;
    }
    if (kind == 0) {                                               // s5:DF10: only down an air core
        if (!b || b->type != 106) return false;
        if (atMaxDepth) {
            sim.placeMessage().id = 1708;
            return false;
        }
        word24 = 1;
        return true;
    }
    if (kind < 6 || kind > 9) return false;
    askDirection();
    switch (word24) {
        case 1:
            // quirk Q57: digging down from dug ground is always refused
            // (1708 only at the maximum depth, else no message).
            if (atMaxDepth) sim.placeMessage().id = 1708;
            return false;
        case 2: case 3: case 4: case 5:                            // s5:E652
            return sim.cellKind(site, stepInDirection(pos, word24)) != 0;
        case 6:
            return true;
        default:
            return false;
    }
}

// s5:DB86: on another site 1711; below the surface within 30 of the hub
// (1718 with the spaces too far); the surface has no limit.
bool RoboDiggerBuilding::inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    const int d = hubDistance(sim, colony, site, pos);
    if (d < 0) {
        sim.placeMessage().id = 1711;
        return false;
    }
    if (d > 30 && pos.level > 0) {
        sim.placeMessage() = {1718, static_cast<int16_t>(d - 30)};
        return false;
    }
    return true;
}

// ── Monorails ─────────────────────────────────────────────────────────────

namespace {
// s6:1E14 / s6:2220: the building type on a cell (0 when none).
uint16_t typeAt(Simulation& sim, Handle site, const MapCell& c) {
    Grid* g = sim.gridOfSite(site);
    const Tile* t = g ? sim.db().get<Tile>(g->tileAt(c)) : nullptr;
    const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
    return b ? b->type : 0;
}

// s6:1CCA, s6:2290: a monorail piece above or below holding `vertical` (or
// one of the `either` types), or one left or right holding `horizontal`
// (or `either`).
bool monorailNext(Simulation& sim, const MapCell& pos, Handle site, std::initializer_list<uint16_t> either) {
    auto is = [&](const MapCell& c, uint16_t own) {
        const uint16_t ty = typeAt(sim, site, c);
        if (!ty) return false;
        if (ty == own) return true;
        return std::find(either.begin(), either.end(), ty) != either.end();
    };
    return is({pos.x, int16_t(pos.y - 1), pos.level}, 22) || is({pos.x, int16_t(pos.y + 1), pos.level}, 22) ||
           is({int16_t(pos.x - 1), pos.y, pos.level}, 23) || is({int16_t(pos.x + 1), pos.y, pos.level}, 23);
}
} // namespace

// s6:1CCA: the X piece (24) and stations (63) join either way.
bool MonorailBuilding::connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) {
    return monorailNext(sim, pos, site, {24, 63});
}

// s6:2290: a station joins the straight pieces or a MonoXFormer (64), not
// the X piece (quirk Q58).
bool MonoStationBuilding::connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) {
    return monorailNext(sim, pos, site, {64});
}

// s6:1DA4, s6:23A8: like roads, only the hub's site counts (1711).
bool MonorailBuilding::inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (hubDistance(sim, colony, site, pos) >= 0) return true;
    sim.placeMessage().id = 1711;
    return false;
}

void MonoStationBuilding::constructTick(Simulation& sim) {
    Building::constructTick(sim);
    if (state != kOperational) return;
    const Tile* t = tile(sim);
    if (!t) return;
    const MapCell n[4] = {{t->x, int16_t(t->y - 1), t->level}, {t->x, int16_t(t->y + 1), t->level},
                          {int16_t(t->x - 1), t->y, t->level}, {int16_t(t->x + 1), t->y, t->level}};
    for (const MapCell& c : n)
        if (typeAt(sim, t->owner, c) == 64) {                       // s6:21BA: a MonoXFormer
            addTrain(sim, t->self);
            return;
        }
}

void MonoStationBuilding::onDestroy(Simulation& sim) {
    if (const Tile* t = tile(sim)) removeTrain(sim, t->self);
    waiting.clear();
}

bool MonoStationBuilding::inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) {
    if (hubDistance(sim, colony, site, pos) >= 0) return true;
    sim.placeMessage().id = 1711;
    return false;
}

std::unique_ptr<Building> makeBuilding(uint16_t type) {
    const BuildingClass cls = buildingClassOf(type);
    switch (cls) {
        case C::SeedPower:     return std::make_unique<SeedPowerBuilding>(type, cls);
        case C::Tokamak:       return std::make_unique<TokamakBuilding>(type, cls);
        case C::SolrPwrRecvr:  return std::make_unique<SolarReceiverBuilding>(type, cls);
        case C::CommandCenter: return std::make_unique<CommandCenterBuilding>(type, cls);
        case C::AgriDome:      return std::make_unique<AgriDomeBuilding>(type, cls);
        case C::Chap:          return std::make_unique<ChapBuilding>(type, cls);
        case C::Police:        return std::make_unique<PoliceBuilding>(type, cls);
        case C::Nano:          return std::make_unique<NanoBuilding>(type, cls);
        case C::ColonistLander: return std::make_unique<ColonistLanderBuilding>(type, cls);
        case C::CargoLander:   return std::make_unique<CargoLanderBuilding>(type, cls);
        case C::Seed:          return std::make_unique<SeedBuilding>(type, cls);
        case C::SpacePort:     return std::make_unique<SpacePortBuilding>(type, cls);
        case C::Storage:       return std::make_unique<StorageBuilding>(type, cls);
        case C::Destroyed:     return std::make_unique<DestroyedBuilding>(type, cls);
        case C::Terrain:       return std::make_unique<TerrainBuilding>(type, cls);
        case C::Road:          return std::make_unique<RoadBuilding>(type, cls);
        case C::Lab:           return std::make_unique<LabBuilding>(type, cls);
        case C::UGUniv:        return std::make_unique<UGUnivBuilding>(type, cls);
        case C::UGCommercial:
        case C::UGRed:         return std::make_unique<LuxuryUserBuilding>(type, cls);
        case C::CommTwr:       return std::make_unique<CommTowerBuilding>(type, cls);
        case C::Warehouse:     return std::make_unique<WarehouseBuilding>(type, cls);
        case C::RoboCmd:       return std::make_unique<RoboCmdBuilding>(type, cls);
        case C::TerraForm:     return std::make_unique<TerraFormBuilding>(type, cls);
        case C::RoboDigger:    return std::make_unique<RoboDiggerBuilding>(type, cls);
        case C::Monorail:      return std::make_unique<MonorailBuilding>(type, cls);
        case C::MonoStation:   return std::make_unique<MonoStationBuilding>(type, cls);
        case C::RoboDozer:
        case C::RoboExplr:     return std::make_unique<RobotBuilding>(type, cls);
        case C::RoboMine:      return std::make_unique<RoboMineBuilding>(type, cls);
        case C::Mine:          return std::make_unique<MineBuilding>(type, cls);
        case C::Smelter:       return std::make_unique<SmelterBuilding>(type, cls);
        case C::SeedSmelter:   return std::make_unique<SeedSmelterBuilding>(type, cls);
        case C::Spew:          return std::make_unique<SpewBuilding>(type, cls);
        case C::UGResident:    return std::make_unique<UGResidentBuilding>(type, cls);
        case C::Factory:
        case C::SeedFact:
        case C::UGFact:        return std::make_unique<FactoryBuilding>(type, cls);
        case C::UGGeoTherm:    return std::make_unique<UGGeoThermBuilding>(type, cls);
        case C::Pipe:          return std::make_unique<PipeBuilding>(type, cls);
        default:               return std::make_unique<Building>(type, cls);
    }
}

} // namespace outpost::sim

namespace outpost::sim {

std::vector<uint16_t> factoryProducts(const Simulation& sim, const Building& b) {
    std::vector<uint16_t> out;
    if (b.state != Building::kOperational && b.state != Building::kSuspended && b.state != 8) return out;
    const uint16_t lo = b.type == 15 ? 15 : 1;
    const uint16_t hi = b.type == 15 ? 19 : b.type == 14 ? 4 : 14;
    const auto& offered = sim.buildMenu().products;
    for (uint16_t p = lo; p <= hi && p < offered.size(); ++p)
        if (offered[p] != 0) out.push_back(p);
    out.push_back(20);
    return out;
}

bool makesConsumerGoods(const Building& b) { return b.type == 91 || b.type == 92; }

bool setFactoryConsumerGoods(Simulation& sim, Building& b) {
    return makesConsumerGoods(b) && setFactoryProductB(sim, b, kConsumerGoods);
}

std::vector<uint16_t> factoryProductsB(const Simulation& sim, const Building& b) {
    std::vector<uint16_t> out;
    if (b.state != Building::kOperational && b.state != Building::kSuspended && b.state != 8) return out;
    const Player* p = sim.db().get<Player>(Handle::make(ObjType::Player, 1));
    const uint16_t n = p && p->discoveries[7] != 0 ? 15 : 14;
    for (uint16_t i = 1; i <= n; ++i) out.push_back(i);
    out.push_back(16);
    return out;
}

bool setFactoryProductB(Simulation&, Building& b, uint16_t product) {
    if (b.state != Building::kOperational && b.state != Building::kSuspended) return false;
    b.opsResource = 0;                                         // s7:7EDA -> s6:BB96
    b.opsProductA = 0;
    b.opsProductB = product;
    b.opsAmount = 1;                                           // 0 -> 1
    b.opsCycleTurns = product != 0 ? 1 : 0;                    // s6:C724
    return true;
}

bool setFactoryProduct(Simulation& sim, Building& b, uint16_t product) {
    if (b.state != Building::kOperational && b.state != Building::kSuspended) return false;
    b.opsResource = 0;                                         // s6:BB96: 10 bytes at +0xA4
    b.opsProductA = product;
    b.opsProductB = 0;
    b.opsAmount = 1;                                           // 0 -> 1
    switch (product) {                                         // s6:C724 (+0xAC was 0)
        case 0:  b.opsCycleTurns = 0; break;
        case 7:  b.opsCycleTurns = 10; break;
        case 13: b.opsCycleTurns = 1; break;
        default: b.opsCycleTurns = 5; break;
    }
    if (b.type == 14 && sim.turn() > 50 && product >= 1 && product <= 4)   // s3:AEC9
        sim.post({0x37, 11, Handle{}, 0});
    return true;
}

} // namespace outpost::sim

namespace outpost::sim {

void setLabTopic(Simulation& sim, LabBuilding& lab, uint16_t topic) {
    if (lab.topic == topic) return;
    Player* p = sim.db().get<Player>(Handle::make(ObjType::Player, 1));
    auto adjust = [&](uint16_t t, int16_t by) {                // s3:A5CA / s7:25D8
        if (!p || t == 112 || t >= p->remaining.size() || p->remaining[t] >= 0) return;
        p->remaining[t] = static_cast<int16_t>(p->remaining[t] + by);
    };
    adjust(lab.topic, +1);
    lab.topic = topic;
    adjust(topic, -1);
}

} // namespace outpost::sim
