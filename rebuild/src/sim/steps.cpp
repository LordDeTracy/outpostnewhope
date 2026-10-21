#include "sim/steps.hpp"
#include "sim/rebel_ai_improved.hpp"

#include "data/building_groups.hpp"
#include "sim/building.hpp"
#include "sim/events.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>

namespace outpost::sim {

using namespace data::res;

// ── Colony economy ────────────────────────────────────────────────────────

// Colony_sumTileLedgers (s8:5464): rebuild the colony totals from its tiles.
void colonySumTileLedgers(Simulation& sim, Colony& c) {
    c.total.fill(0);                      // s8:56BA
    c.linkedCount.fill(0);                // s8:57C0
    for (Handle th : c.tiles.order()) {
        Tile* t = sim.db().get<Tile>(th);
        if (!t) continue;
        for (const auto& [res, value] : t->bas.entries())
            if (value != 0) c.addTotal(value, res);
        for (Handle h : t->linked)                  // units per kind (all kinds < 21)
            if (const Unit* u = sim.db().get<Unit>(h); u && u->kind < c.linkedCount.size())
                ++c.linkedCount[u->kind];
    }
    const Population& pop = c.population;
    int32_t people = pop.group(3) + pop.group(4);
    if (people == 0) people = pop.group(2);
    people += pop.extra170;
    c.addTotal(people, People);
}

// Colony_step2 (s8:56D6): clear allocations; with tilesToo, also drop every
// tile's Alloc ledger (s7:72D0).
void colonyClearAlloc(Simulation& sim, Colony& c, bool tilesToo) {
    c.alloc.fill(0);
    if (!tilesToo) return;
    for (Handle th : c.tiles.order())
        if (Tile* t = sim.db().get<Tile>(th)) t->alloc.clear();
}

// Colony_allocate (s8:518C): grant each constructing/operating building its
// per-resource needs, all-or-nothing per resource, in tile order.
void colonyAllocate(Simulation& sim, Colony& c) {
    if (c.freeResources) return;                                   // +0x206
    for (Handle th : c.tiles.order()) {
        Tile* t = sim.db().get<Tile>(th);
        if (!t) continue;
        Building* b = sim.db().get<Building>(t->building);
        if (!b) continue;
        if (b->state != Building::kConstructing && b->state != Building::kOperational) continue;
        const auto* need = b->needs();
        if (!need) continue;
        for (int res = MetalA; res <= People; ++res) {             // 0x11..0x24
            if (c.nanotech && res != Power && res != People) continue;
            const auto want = static_cast<uint32_t>((*need)[static_cast<size_t>(res)]);
            if (want <= static_cast<uint32_t>(c.available(res)))
                c.allocate(static_cast<int32_t>(want), res);
        }
    }
}

// Colony_consume (s8:52B8).
void colonyConsume(Simulation& sim, Colony& c, int res, uint32_t amount) {
    c.addTotal(-static_cast<int32_t>(amount), res);               // s8:5694
    if (res == People) return;
    for (Handle th : c.tiles.order()) {
        Tile* t = sim.db().get<Tile>(th);
        if (!t) continue;
        auto v = static_cast<uint32_t>(t->bas.get(res));          // s7:7C28
        if (v == 0) continue;
        if (v < amount) { amount -= v; v = 0; }
        else            { v -= amount; amount = 0; }
        t->bas.set(res, static_cast<int32_t>(v));                 // s7:7D1C
        if (amount == 0) return;
    }
}

// ── Steps ─────────────────────────────────────────────────────────────────

namespace {

template <uint16_t Code>
class TurnStep : public Step {
public:
    uint16_t priority() const override { return Code - 1; }
};

// SCSetup::calcMe (s6:ACEC)
class SetupStep final : public TurnStep<stepcode::Setup> {
public:
    std::string_view name() const override { return "SCSetup"; }
    void calcMe(Simulation& sim) override {
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
            if (c->player == kRebelPlayer) continue;
            colonySumTileLedgers(sim, *c);
            colonyClearAlloc(sim, *c, true);
        }
        for (Player* p : sim.db().allOf<Player>(ObjType::Player)) p->newTurn();   // s7:2690
    }
};

// SCMines::calcMe (s7:EB86)
class MinesStep final : public TurnStep<stepcode::Mines> {
public:
    std::string_view name() const override { return "SCMines"; }
    void calcMe(Simulation& sim) override {
        for (Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            if (b->state != Building::kOperational) continue;
            const uint16_t t = b->type;
            if (t == 51 || t == 52 || t == 96 || t == 97) b->mine(sim);
        }
    }
};

// SCFactory::calcMe (s6:81E0): every operational building except these runs
// produce().
bool factorySkips(uint16_t t) {
    switch (t) {
        case 0: case 5: case 9: case 16: case 18: case 19: case 20: case 21:
        case 51: case 52: case 55: case 71: case 106:
        case 115: case 116: case 117: case 119: case 120: case 121:
            return true;
        default:
            return t >= 93 && t <= 97;
    }
}

class FactoryStep final : public TurnStep<stepcode::Factory> {
public:
    std::string_view name() const override { return "SCFactory"; }
    void calcMe(Simulation& sim) override {
        for (Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            if (factorySkips(b->type)) continue;
            if (b->state == Building::kOperational) b->produce(sim);
        }
    }
};

// SCPower::calcMe (s6:A9F4)
class PowerStep final : public TurnStep<stepcode::Power> {
public:
    std::string_view name() const override { return "SCPower"; }
    void calcMe(Simulation& sim) override {
        for (Building* b : sim.db().allOf<Building>(ObjType::Building))
            if (sim.data().groups.contains(data::BuildingGroups::kPowerProducers, b->type))
                b->power(sim, b->state == Building::kOperational);
    }
};

// SCPrelimAlloc::calcMe (s6:A73C)
class PrelimAllocStep final : public TurnStep<stepcode::PrelimAlloc> {
public:
    std::string_view name() const override { return "SCPrelimAlloc"; }
    void calcMe(Simulation& sim) override {
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
            colonySumTileLedgers(sim, *c);
            colonyClearAlloc(sim, *c, false);
            colonyAllocate(sim, *c);
        }
    }
};

// ── SCPop (s6:9EFC) ───────────────────────────────────────────────────────

namespace pop {

constexpr uint16_t kLog = 0x37, kAlert = 0x2B;   // registry ids of the UI sinks

// s6:A3AE: the colony eats. One Food feeds 10 people; a shortfall queues
// SCStarve. Skipped with Nanotech and research 130 (Food Production).
void feed(Simulation& sim, Colony& c) {
    const Player* player = sim.playerOf(&c);
    if (c.nanotech && player && player->researchDone(130)) return;
    const auto people = static_cast<uint32_t>(c.population.total());
    const auto food = static_cast<uint32_t>(c.available(Food));
    if (food == 0 && c.player != kRebelPlayer && static_cast<int32_t>(people) > 0)
        sim.post({kAlert, 0x11, c.self, 0});
    uint32_t eaters = people;
    const uint32_t fed = food * 10u;
    if (fed < people) {
        sim.enqueue(makeStarveStep(c.self, fed, people));
        eaters = fed;
    }
    colonyConsume(sim, c, Food, (eaters + 9u) / 10u);
}

// s6:A28A: people per operational residence (group 14) -> crowding effect
// for SCMorale. 100 when there is no residence.
int32_t crowding(Simulation& sim, Colony& c) {
    const auto homes = static_cast<int32_t>(sim.colonyTilesInGroup(c, 14).size());
    const int32_t ratio = homes != 0 ? c.population.total() / homes : 100;
    int16_t morale = 0, flag = 1;
    if (ratio >= 100)     morale = -20;
    else if (ratio >= 85) morale = -15;
    else if (ratio >= 75) morale = -10;
    else if (ratio >= 50) morale = -5;
    else if (ratio < 25)  { morale = 1; flag = -1; }
    else                  flag = 0;
    c.crowdingMorale = morale;
    c.crowdingFlag = flag;
    return ratio;
}

// s6:A61E: yearly births = (group 3 + group 4) / birthDivisor (5 if 0).
void births(Simulation& sim, Colony& c) {
    Population& p = c.population;
    if (p.total() >= 0x3FFFFFFF) return;
    const int32_t divisor = p.birthDivisor != 0 ? p.birthDivisor : 5;
    const int32_t born = (p.group(3) + p.group(4)) / divisor;
    if (born == 0) return;
    if (c.player == kRebelPlayer) return;   // the rebels' babies are never stored (quirk)
    sim.post({kAlert, 0x0C, c.self, born});
    p.setNewborns(born);
}

// s6:A188: a death roll for age group g kills deathRate[g] percent of it.
void deaths(Simulation& sim, Colony& c, int g) {
    Population& p = c.population;
    const int16_t rate = p.deathRate[static_cast<size_t>(g)];
    if (rate == 0) return;            // IMPROVISED (guard): the original divides by zero
    const int32_t per = 100 / rate;
    const int32_t v = p.group(g) + p.deathCarry[static_cast<size_t>(g)];
    const int32_t dead = v / per;
    p.deathCarry[static_cast<size_t>(g)] = v - dead * per;
    if (dead == 0) return;
    p.kill(g, dead);                  // also clears every carry (quirk)
    if (c.player != kRebelPlayer) {
        sim.post({kLog, 2, c.self, dead});
        sim.post({kAlert, 0x0D, c.self, dead});
    }
}

// s6:A4EE: red-light babies, ageing, births and death rolls. Runs only when the
// residences are not full (crowding < 100).
void grow(Simulation& sim, Colony& c) {
    Population& p = c.population;
    // One baby a turn per operational UG Red Light District (group 38).
    const auto districts = static_cast<int32_t>(sim.colonyTilesInGroup(c, 38).size());
    if (districts != 0) p.addNewborns(districts);
    // IMPROVED (I107): nurseries. Once the player has Embryology (topic 18),
    // every operational UG Residence (group 14) also raises a child every 6
    // turns, one per couple at most (the player remembered a research
    // starting nurseries; v1.51 has none, findings/14 §4a). Before the
    // year's ageing, like the red-light babies.
    if (sim.turn() % 6 == 0 && c.player != kRebelPlayer)
        if (const Player* pl = sim.playerOf(&c); pl && pl->researchDone(18)) {
            const auto homes = static_cast<int32_t>(sim.colonyTilesInGroup(c, 14).size());
            const int32_t couples = (p.group(3) + p.group(4)) / 2;
            if (const int32_t born = std::min(homes, couples); born > 0) p.addNewborns(born);
        }
    if (sim.turn() % 12 == 0) {
        p.ageOneYear();
        births(sim, c);
    }
    const Player* player = sim.playerOf(&c);
    if (c.nanotech && player && player->researchDone(128)) return;   // Medical
    for (int g = 1; g < 6; ++g) {
        const int16_t chance = p.deathChance[static_cast<size_t>(g)];
        if (chance != 0 && chance >= sim.random(1, 100)) deaths(sim, c, g);
    }
}

// s8:42CC: without an operational life-support building (group 45:
// Command, SeedCommand, Chap, Chap2) people die, doubling each turn.
int32_t lifeSupport(Simulation& sim, Colony& c) {
    bool supported = false;
    for (Tile* t : sim.colonyTilesInGroup(c, 45))
        if (const Building* b = sim.db().get<Building>(t->building))
            if (b->providesLifeSupport()) supported = true;
    if (supported) {
        c.population.lifeSupportDeaths = 0;
        return 0;
    }
    return c.population.total() != 0 ? c.population.lifeSupportFailure() : 0;
}

} // namespace pop

class PopStep final : public TurnStep<stepcode::Pop> {
public:
    std::string_view name() const override { return "SCPop"; }
    void calcMe(Simulation& sim) override {
        if (!sim.db().get<Colony>(Handle::make(ObjType::Colony, 1))) return;
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
            if (!c->populated) continue;
            if (c->player != kRebelPlayer) pop::feed(sim, *c);
            if (pop::crowding(sim, *c) < 100) pop::grow(sim, *c);
            if (c->player == kRebelPlayer) continue;
            if (const int32_t dead = pop::lifeSupport(sim, *c))
                sim.post({pop::kLog, 2, c->self, dead});
        }
        // The colonists still frozen aboard the mothership.
        Mothership& ship = sim.mothership();
        if (ship.deployableCount(62) == 0) return;          // ColonistLanders left
        const int16_t lost = ship.loseCryoColonists(sim.turn());
        Colony* first = sim.db().get<Colony>(Handle::make(ObjType::Colony, 1));
        const Handle where = first ? first->self : Handle{};
        if (lost > 0) {
            sim.post({pop::kLog, 2, where, lost});
            sim.post({pop::kAlert, 0x14, where, lost});
        } else if (lost < 0 && first && first->population.total() <= 0) {
            sim.post({pop::kLog, 6, where, 0});          // everyone is dead
        }
    }
};

class StarveStep final : public Step {
public:
    StarveStep(Handle colony, uint32_t fed, uint32_t people)
        : m_colony(colony), m_fed(fed), m_people(people) {}
    std::string_view name() const override { return "SCStarve"; }
    uint16_t priority() const override { return 4999; }
    bool shouldRun(Simulation& sim) override {
        int16_t lo = 1, hi = 3;
        const int d = sim.difficulty();
        if (d == 1 || d == 2) hi = 1;
        else if (d == 4) lo = 2;
        m_dead = sim.random(lo, hi);
        sim.post({pop::kLog, 2, m_colony, m_dead});
        sim.post({pop::kAlert, 0x0D, m_colony, m_dead});
        return true;
    }
    void calcMe(Simulation& sim) override {
        if (Colony* c = sim.db().get<Colony>(m_colony)) c->population.kill(0, m_dead);
    }

private:
    Handle m_colony;
    uint32_t m_fed;      // +0x10C (unused by the original)
    uint32_t m_people;   // +0x110 (unused by the original)
    int16_t m_dead{0};   // +0x114
};

// ── SCMorale (s7:ECF8) ────────────────────────────────────────────────────

namespace morale {

constexpr uint16_t kLog = 0x37, kAlert = 0x2B;
const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kColony2 = Handle::make(ObjType::Colony, 2);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);

int16_t clamp(int v, int lo, int hi) { return static_cast<int16_t>(v < lo ? lo : v > hi ? hi : v); }

// s8:45E4: education drifts by 1 a turn (+2 per operational UGUniv) and
// sets the school-leaving age.
void updateEducation(Simulation& sim, Colony& c) {
    Population& p = c.population;
    const int32_t v = c.education + (p.group(4) - p.group(3)) + (p.group(2) - p.group(1));
    c.education = static_cast<int16_t>(c.education + (v > 0 ? 1 : -1));
    // IMPROVED (I105): only a University with teaching turns left (+0x20,
    // 100, or 200 with Advanced Teaching Methods; Q73) raises education, as
    // the manual says ("After 100 turns … stops increasing the Educational
    // Level"); v1.51 counts the turns but adds 2 for every operational one.
    int teaching = 0;
    for (Tile* t : sim.colonyTilesInGroup(c, 22))
        if (const auto* u = sim.db().get<UGUnivBuilding>(t->building); !u || u->counter20 > 0) ++teaching;
    c.education = static_cast<int16_t>(c.education + 2 * teaching);
    c.education = clamp(c.education, 0, 100);
    // The thresholds were meant for the undivided value: e10 is at most 10,
    // so the age is always 20 (quirk).
    const int e10 = c.education / 10;
    uint16_t sla = 16;
    if (e10 <= 10) sla = 20;
    else if (e10 <= 20) sla = 19;
    else if (e10 <= 30) sla = 18;
    else if (e10 <= 40) sla = 17;
    else if (e10 <= 50) sla = 16;
    else if (e10 <= 60) sla = 15;
    else if (e10 <= 70) sla = 14;
    else if (e10 <= 80) sla = 13;
    else if (e10 <= 90) sla = 12;
    p.schoolLeavingAge = sla;                                  // s7:3258
}

// s6:5A94: the first police station within distance 4 of a red-light
// district decides: hostile (1) stops its crime, friendly (2) halves it.
int policeCover(Simulation& sim, const Tile& district, const std::vector<Tile*>& police) {
    for (Tile* t : police) {
        if (Simulation::tileDistance(district, *t) > 4) continue;
        const auto* cop = sim.db().get<PoliceBuilding>(t->building);
        const uint16_t mode = cop ? cop->mode : 0;
        if (mode == 2) return 2;
        if (mode == 1) return 3;
        return 1;
    }
    return 1;
}

// s8:4760: crime drifts with crowding, red-light districts, education and
// morale.
void updateCrime(Simulation& sim, Colony& c) {
    c.crime = static_cast<int16_t>(c.crime + c.crowdingFlag);
    const auto districts = sim.colonyTilesInGroup(c, 38);      // UGRed
    const auto police = sim.colonyTilesInGroup(c, 26);         // UGCops, UGCops2
    if (police.empty()) {
        c.crime = static_cast<int16_t>(c.crime + static_cast<int>(districts.size()));
    } else {
        for (Tile* d : districts) {
            const int cover = policeCover(sim, *d, police);
            if (cover == 3) continue;
            if (cover == 2 && (sim.turn() & 1)) continue;
            ++c.crime;
        }
    }
    updateEducation(sim, c);
    if (c.education > 50) --c.crime;
    if (c.education < 50) ++c.crime;
    if (c.morale < 250)      c.crime = static_cast<int16_t>(c.crime + 2);
    else if (c.morale < 450) ++c.crime;
    else if (c.morale < 550) {}
    else if (c.morale < 750) --c.crime;
    else                     c.crime = static_cast<int16_t>(c.crime - 2);
    c.crime = clamp(c.crime, 0, 100);
}

// s8:01C0: buildings near a Tokamak. For every Tokamak (group 41, any
// state), each building on the same level within distance 5 that is not
// terrain, road, pipe, mine, robot or reactor (group 48) counts once.
int tokamakCrowding(Simulation& sim, Colony& c) {
    int n = 0;
    for (Tile* tok : sim.colonyTilesInGroup(c, 41, false)) {
        for (Handle th : c.tiles.order()) {
            Tile* t = sim.db().get<Tile>(th);
            if (!t || t->level != tok->level) continue;
            const Building* b = sim.db().get<Building>(t->building);
            if (!b || sim.data().groups.contains(48, b->type)) continue;
            if (Simulation::tileDistance(*tok, *t) <= 5) ++n;      // -1 (other grid) counts
        }
    }
    return n;
}

// s8:008E: the answer to the morale crisis dialog, colony 1 only. Also
// schedules the next crisis 30..38 turns ahead when morale is at most 200.
int16_t crisis(Simulation& sim, Colony& c) {
    if (c.self != kColony1) return 0;
    MoraleCrisis& mc = sim.moraleCrisis();
    const int16_t r = sim.random(1, 100);
    int16_t effect = 0;
    uint16_t alert = 0;
    switch (mc.response) {
        case 1: alert = 0x15; effect = -1; break;
        case 2: effect = -1; break;
        case 3: alert = 0x16; effect = 1; break;
        case 4: if (r < 50) { effect = 2; alert = 0x17; } else { effect = -2; alert = 0x18; } break;
        case 5: effect = r < 50 ? 2 : -2; alert = 0x19; break;
        default: break;
    }
    if (alert) sim.post({kAlert, alert, c.self, effect});
    mc.response = 0;                                           // s2:EB74(reg, 0)
    if (mc.scheduledTurn == 0 && c.morale <= 200)
        mc.scheduledTurn = sim.turn() + static_cast<uint32_t>(sim.random(0, 8)) + 30;
    return effect;
}

// The same-tier rule of s8:0340 / s8:05D8: repeat the remembered amount,
// capped at the population.
int32_t repeatAmount(int32_t people, int32_t remembered) { return people > remembered ? remembered : people; }

// s8:0340: colonists leave colony 1 for the rebels while morale <= 200.
void colonistsLeave(Simulation& sim, Colony& c, int16_t m) {
    const int32_t people = c.population.total();
    const uint32_t turn = sim.turn();
    struct Band { int16_t maxMorale; uint16_t tier; int32_t divisor; uint32_t period; };
    static constexpr Band kBands[] = {
        {0, 8, 4, 1}, {10, 7, 10, 1}, {25, 6, 20, 1}, {50, 5, 100, 1},
        {75, 4, 100, 3}, {100, 3, 100, 5}, {150, 2, 100, 10}, {200, 1, 100, 20},
    };
    uint16_t newTier = 0;
    int32_t amount = 0;
    for (const Band& b : kBands) {
        if (m > b.maxMorale) continue;
        if (turn % b.period != 0) break;
        if (c.defectionTier == b.tier) {
            amount = repeatAmount(people, c.defectionAmount);
        } else {
            amount = people / b.divisor;
            newTier = b.tier;
        }
        break;
    }
    if (newTier) {
        if (people != 0 && amount == 0) amount = 1;
        c.defectionTier = newTier;
        c.defectionAmount = amount;
    }
    if (amount)
        sim.enqueue(makeMigrateStep(c.self, c.player == kPlayer1 ? kColony2 : kColony1, amount));
}

// s8:05D8: rebels join colony 1 while morale >= 800.
void rebelsJoin(Simulation& sim, Colony& c, int16_t m) {
    Colony* rebels = nullptr;
    int32_t people = 0;
    for (Colony* r : sim.db().allOf<Colony>(ObjType::Colony)) {
        if (r->player != kRebelPlayer) continue;
        rebels = r;
        people = r->population.total();
        if (people != 0) break;
    }
    if (!rebels) return;
    const uint32_t turn = sim.turn();
    struct Band { int16_t minMorale; uint16_t tier; int32_t divisor; uint32_t period; };
    static constexpr Band kBands[] = {
        {1000, 16, 4, 1}, {990, 15, 10, 1}, {975, 14, 20, 1}, {950, 13, 100, 1},
        {925, 12, 100, 3}, {900, 11, 100, 5}, {850, 10, 100, 10}, {800, 9, 100, 20},
    };
    uint16_t newTier = 0;
    int32_t amount = 0;
    for (const Band& b : kBands) {
        if (b.minMorale == 1000 ? m != 1000 : m < b.minMorale) continue;
        if (turn % b.period != 0) break;
        if (c.defectionTier == b.tier) {
            amount = repeatAmount(people, c.defectionAmount);
        } else {
            amount = people / b.divisor;
            newTier = b.tier;
        }
        break;
    }
    if (newTier) {
        if (people != 0 && amount == 0) amount = 1;
        c.defectionTier = newTier;
        c.defectionAmount = amount;
    }
    if (amount)
        sim.enqueue(makeMigrateStep(c.player == kPlayer1 ? rebels->self : kColony1, c.self, amount));
}

// s8:08D4: defections, only while a rebel colony exists.
void defections(Simulation& sim, Colony& c, int16_t m) {
    bool rebelsExist = false;
    for (Colony* r : sim.db().allOf<Colony>(ObjType::Colony))
        if (r->player == kRebelPlayer) { rebelsExist = true; break; }
    if (!rebelsExist) return;
    if (m <= 200) colonistsLeave(sim, c, m);
    else if (m >= 800) rebelsJoin(sim, c, m);
}

// s8:095E: morale reports every 10 turns, and crime incidents: at crime
// 50/60/75+ every 30/15/5 turns the first residence (any state) with no
// operational UG police within distance 5 becomes a red-light district
// (s6:5CA0 queues SCInternalPutBldg with type 101).
void reportsAndIncidents(Simulation& sim, Colony& c, int16_t m) {
    const uint32_t turn = sim.turn();
    if (turn % 10 == 0) {
        if (m <= 200) sim.post({kLog, 0x3F, c.self, m});
        else if (m >= 800) sim.post({kLog, 0x3E, c.self, m});
    }
    uint32_t period = 0;
    if (c.crime >= 75) period = 5;
    else if (c.crime >= 60) period = 15;
    else if (c.crime >= 50) period = 30;
    if (period == 0 || turn % period != 0) return;
    const auto police = sim.colonyTilesInGroup(c, 26);
    for (Tile* home : sim.colonyTilesInGroup(c, 15, false)) {
        bool covered = false;
        for (Tile* cop : police)
            if (Simulation::tileDistance(*home, *cop) <= 5) { covered = true; break; }
        if (covered) continue;
        sim.putBuilding(*home, 101);
        return;
    }
}

} // namespace morale

class MoraleStep final : public TurnStep<stepcode::Morale> {
public:
    std::string_view name() const override { return "SCMorale"; }
    void calcMe(Simulation& sim) override {
        // The planet's hostility, softened on the easier levels.
        int16_t hostility = sim.planetHostility();
        if (hostility <= 1) hostility = 0;
        const int d = sim.difficulty();
        if (d == 1 || d == 2) {
            if (hostility >= 7) hostility = static_cast<int16_t>(hostility - 2);
            else if (hostility >= 4) --hostility;
        } else if (d == 3) {
            if (hostility >= 7) --hostility;
        }

        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
            if (!c->populated || c->player == kRebelPlayer) continue;
            if (c->population.total() == 0) continue;
            int m = c->morale;          // gains, clamped before the losses
            int loss = 0;               // losses (and, by mistake, crime)
            morale::updateCrime(sim, *c);
            loss += c->crime / 10;      // added, not subtracted (quirk)
            if (c->education > 50) ++m;
            if (c->education < 50) --loss;
            for (Handle th : c->tiles.order()) {
                const Tile* t = sim.db().get<Tile>(th);
                const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
                if (!b || b->state != Building::kOperational) continue;
                const int16_t v = b->moraleEffect(sim);
                if (v < 0) loss += v;
                else m += v;
            }
            loss -= hostility;
            loss -= morale::tokamakCrowding(sim, *c) - c->crowdingMorale;
            const int16_t answer = morale::crisis(sim, *c);
            if (answer >= 0) m += answer;
            else loss += answer;
            m = morale::clamp(m, 0, 1000);
            m = morale::clamp(m + loss, 0, 1000);
            const auto mm = static_cast<int16_t>(m);
            c->setMorale(mm);
            if (c->self == morale::kColony1) morale::defections(sim, *c, mm);
            morale::reportsAndIncidents(sim, *c, mm);
        }
    }
};

class MigrateStep final : public Step {
public:
    MigrateStep(Handle from, Handle to, int32_t amount) : m_from(from), m_to(to), m_amount(amount) {}
    std::string_view name() const override { return "SCMigrate"; }   // unnamed in the original
    uint16_t priority() const override { return 4999; }
    bool shouldRun(Simulation& sim) override {
        Colony* src = sim.db().get<Colony>(m_from);
        if (!src) return true;
        // s7:3694 with group 0: random ages until enough people are found.
        // IMPROVISED (guard): the original loops forever if the colony has
        // fewer people than asked for.
        Population& p = src->population;
        int32_t left = m_amount;
        while (left > 0 && p.total() > 0) {
            const int16_t age = sim.random(0, 90);
            m_people[static_cast<size_t>(age)] += p.takeFromAge(age, left);
        }
        p.deathCarry.fill(0);
        if (p.total() != 0) return true;
        // The source is empty: hand it to the other side (s8:349E).
        const Handle wasPlayer = src->player;
        sim.post({morale::kAlert, static_cast<uint16_t>(wasPlayer != kRebelPlayer ? 0x0B : 0x1F), src->self, 0});
        src->player = wasPlayer == morale::kPlayer1 ? kRebelPlayer : morale::kPlayer1;
        src->setMorale(600);
        src->setMorale(600);
        src->nanotech = false;
        src->freeResources = false;
        // s8:349E: every entry of the colony's tile list hands its building
        // over (slot 22, `handOver`), then its +0x1C is cleared again.
        for (Handle h : src->tiles.order()) {
            Tile* t = sim.db().get<Tile>(h);
            Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
            if (!b) continue;
            handOver(sim, *b, *src);
            b->tag1C = 0;
        }
        bool playerLeft = false;
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony))
            if (c->player != kRebelPlayer) playerLeft = true;
        if (!playerLeft) sim.post({morale::kLog, 0x3C, src->self, 0});   // all colonies lost
        return true;
    }
    void calcMe(Simulation& sim) override {
        if (Colony* dst = sim.db().get<Colony>(m_to)) dst->population.addCohorts(m_people);
    }

private:
    Handle m_from, m_to;
    int32_t m_amount;
    std::array<int32_t, 91> m_people{};   // +0x114
};

// SCRchSched (s6:AB68): every operational lab (groups 17 and 18) does one
// turn of research. Hot labs (group 17) are not on SCFactory's skip list, so
// they research a second time there (quirk).
class RchSchedStep final : public TurnStep<stepcode::RchSched> {
public:
    std::string_view name() const override { return "SCRchSched"; }
    void calcMe(Simulation& sim) override {
        const auto& groups = sim.data().groups;
        for (Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            if (!groups.contains(17, b->type) && !groups.contains(18, b->type)) continue;
            if (b->state == Building::kOperational) b->produce(sim);
        }
    }
};

// ── SCConstruct (s6:6E96) and SCProdSched (s6:A89C) ───────────────────────

// SCConstruct: every building in states 1..4 gets its construction tick.
class ConstructStep final : public TurnStep<stepcode::Construct> {
public:
    std::string_view name() const override { return "SCConstruct"; }
    void calcMe(Simulation& sim) override {
        for (Building* b : sim.db().allOf<Building>(ObjType::Building))
            if (b->state >= 1 && b->state <= 4) b->constructTick(sim);
    }
};

namespace network {

// s8:5BE8: can `mask` spread onto the tile at (x, y, level)? Tubes conduct
// along their own axis (LPipe along y, RPipe along x, XPipe both; UG pipes
// below ground); every group-43 building conducts.
bool spread(Simulation& sim, const Colony& c, uint16_t mask, uint16_t pipe,
            int16_t x, int16_t y, int16_t level) {
    Tile* t = sim.tileAt(Simulation::gridOf(c), x, y, level);   // s7:627E
    Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
    if (!b) return false;
    uint16_t cross = 122;                                        // XPipe
    if (level > 0) {
        if (pipe == 123) pipe = 126;                             // UGLPipe
        else if (pipe == 124) pipe = 125;                        // UGRPipe
        cross = 127;                                             // UGXPipe
    }
    if (b->flags & mask) return false;
    if (b->type != cross && b->type != pipe && !sim.data().groups.contains(43, b->type)) return false;
    if (b->state == 7) return false;
    b->flags = static_cast<uint16_t>(b->flags | mask);
    return true;
}

// s8:5CC6: flood `mask` over one level until nothing changes.
void propagate(Simulation& sim, const Colony& c, int16_t level, uint16_t mask) {
    bool changed = true;
    while (changed) {
        changed = false;
        for (Handle th : c.tiles.order()) {
            const Tile* t = sim.db().get<Tile>(th);
            if (!t || t->level != level) continue;
            const Building* b = sim.db().get<Building>(t->building);
            if (!b || !(b->flags & mask)) continue;
            if (spread(sim, c, mask, 123, t->x, static_cast<int16_t>(t->y - 1), level)) changed = true;
            if (spread(sim, c, mask, 123, t->x, static_cast<int16_t>(t->y + 1), level)) changed = true;
            if (spread(sim, c, mask, 124, static_cast<int16_t>(t->x - 1), t->y, level)) changed = true;
            if (spread(sim, c, mask, 124, static_cast<int16_t>(t->x + 1), t->y, level)) changed = true;
        }
    }
}

// IMPROVED (I108): a broken building is not resumed, so it stays suspended
// for the turn (sim/breakdowns_improved).
void resumeUnlessBroken(Simulation& sim, Building& b) {
    if (!breakdownBlocks(sim, b)) b.resume(sim);
}

// s8:58E6: a UGCore (group 46) on `level` is connected when the building
// right above it is.
void linkLevel(Simulation& sim, const Colony& c, int16_t level) {
    for (Handle th : c.tiles.order()) {
        const Tile* t = sim.db().get<Tile>(th);
        Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
        if (!b || !sim.data().groups.contains(46, b->type) || t->level != level) continue;
        const Tile* up = sim.tileAt(t->owner, t->x, t->y, static_cast<int16_t>(level - 1));
        const Building* above = up ? sim.db().get<Building>(up->building) : nullptr;
        if (!above || !(above->flags & Building::kReachedByPower) || !(above->flags & Building::kReachedByLife)) continue;
        b->flags = Building::kReachedByLife | Building::kReachedByPower;
        resumeUnlessBroken(sim, *b);
    }
}

// s8:3FCA: rebuild the colony's network and decide what runs this turn.
void schedule(Simulation& sim, Colony& c) {
    std::vector<Building*> bldgs;
    for (Handle th : c.tiles.order())
        if (const Tile* t = sim.db().get<Tile>(th))
            if (Building* b = sim.db().get<Building>(t->building)) bldgs.push_back(b);
    if (c.tiles.empty()) return;
    for (Building* b : bldgs) {
        b->flags = 0;
        if (b->state == Building::kOperational) b->setState(sim, Building::kSuspended);
    }
    c.nanotech = sim.difficulty() == 1;              // Beginner: no materials needed
    const auto& groups = sim.data().groups;
    constexpr uint16_t kBoth = Building::kReachedByLife | Building::kReachedByPower;
    // Power plants seed the power network and pay first (s8:5A96).
    for (Building* b : bldgs) {
        if (!groups.contains(44, b->type) || !b->isPowerSource()) continue;
        b->flags = kBoth;
        resumeUnlessBroken(sim, *b);
        b->flags = Building::kReachedByPower;
    }
    propagate(sim, c, 0, Building::kReachedByPower);
    // Life support seeds the air network (s8:5B3C).
    for (Building* b : bldgs) {
        if (!groups.contains(45, b->type) || !b->providesLifeSupport()) continue;
        b->flags = static_cast<uint16_t>(b->flags | Building::kReachedByLife);
        resumeUnlessBroken(sim, *b);
    }
    propagate(sim, c, 0, Building::kReachedByLife);
    // The site's number of underground levels (site +0x1C, s7:5B1C).
    // IMPROVISED: a colony made without a site uses the deepest level it has.
    int16_t depth = 0;
    if (const Site* site = sim.siteOf(c)) {
        depth = static_cast<int16_t>(site->depth);
    } else {
        for (Handle th : c.tiles.order())
            if (const Tile* t = sim.db().get<Tile>(th)) depth = std::max(depth, t->level);
    }
    for (int16_t level = 1; level <= depth; ++level) {
        linkLevel(sim, c, level);
        propagate(sim, c, level, kBoth);
    }
    // Buildings that need no connection (s8:5A16).
    for (Building* b : bldgs) {
        if (!groups.contains(47, b->type)) continue;
        b->flags = kBoth;
        resumeUnlessBroken(sim, *b);
    }
    // Everyone else, in tile order.
    for (Building* b : bldgs)
        if (b->state != Building::kOperational) resumeUnlessBroken(sim, *b);
}

} // namespace network

// SCProdSched: the network pass for every non-rebel colony.
class ProdSchedStep final : public TurnStep<stepcode::ProdSched> {
public:
    std::string_view name() const override { return "SCProdSched"; }
    void calcMe(Simulation& sim) override {
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony))
            if (c->player != kRebelPlayer) network::schedule(sim, *c);
    }
};

class KillBuildingStep final : public Step {
public:
    explicit KillBuildingStep(Handle building) : m_building(building) {}
    std::string_view name() const override { return "SCKillBldg"; }
    uint16_t priority() const override { return 16000; }
    void calcMe(Simulation& sim) override {
        if (Building* b = sim.db().get<Building>(m_building)) b->onDestroy(sim);   // its destructor
        sim.db().destroy(m_building);
    }

private:
    Handle m_building;   // +0x108
};

class AddSpewStep final : public Step {
public:
    AddSpewStep(Handle colony, int16_t amount) : m_colony(colony), m_amount(amount) {}
    std::string_view name() const override { return "SCAddSpew"; }
    uint16_t priority() const override { return 1000; }
    void calcMe(Simulation& sim) override {
        Colony* c = sim.db().get<Colony>(m_colony);
        if (!c) return;
        auto spews = sim.colonyTilesInGroup(*c, 10);
        if (!spews.empty()) spews.front()->bas.add(Sewage, m_amount);
    }

private:
    Handle m_colony;
    int16_t m_amount;
};

} // namespace

std::unique_ptr<Step> makeAddSpewStep(Handle colony, int16_t amount) {
    return std::make_unique<AddSpewStep>(colony, amount);
}

std::unique_ptr<Step> makeStarveStep(Handle colony, uint32_t fed, uint32_t population) {
    return std::make_unique<StarveStep>(colony, fed, population);
}

std::unique_ptr<Step> makeMigrateStep(Handle from, Handle to, int32_t amount) {
    return std::make_unique<MigrateStep>(from, to, amount);
}

std::unique_ptr<Step> makeKillBuildingStep(Handle building) {
    return std::make_unique<KillBuildingStep>(building);
}

std::unique_ptr<Step> makeTurnStep(uint16_t code) {
    using namespace stepcode;
    switch (code) {
        case Setup:       return std::make_unique<SetupStep>();
        case RoboMove:    return makeRoboMoveStep();
        case ProdSched:   return std::make_unique<ProdSchedStep>();
        case Construct:   return std::make_unique<ConstructStep>();
        case RchSched:    return std::make_unique<RchSchedStep>();
        case AiInput:     return makeAiInputStep();
        case RebelManager: return makeRebelManagerStep();
        case Breakdowns:  return makeBreakdownStep();
        case Move:        return makeMoveStep();
        case Pop:         return std::make_unique<PopStep>();
        case Mines:       return std::make_unique<MinesStep>();
        case Factory:     return std::make_unique<FactoryStep>();
        case Power:       return std::make_unique<PowerStep>();
        case Event:       return makeEventStep();
        case Morale:      return std::make_unique<MoraleStep>();
        case PrelimAlloc: return std::make_unique<PrelimAllocStep>();
        case EndSim:      return makeEndSimStep();
        default:          return nullptr;
    }
}

void enqueueTurnSteps(Simulation& sim) {
    using namespace stepcode;
    for (uint16_t code : {Setup, RoboMove, Breakdowns, ProdSched, Construct, RchSched, AiInput, RebelManager, Move,
                          Pop, Mines, Factory, Power, Event, Morale, PrelimAlloc, EndSim})
        sim.enqueue(makeTurnStep(code));
    sim.releaseScheduled();                    // s6:D6B2: steps due this turn
}

} // namespace outpost::sim
