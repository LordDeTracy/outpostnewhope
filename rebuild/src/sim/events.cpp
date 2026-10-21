#include "sim/events.hpp"
#include "sim/disasters_improved.hpp"

#include "sim/building.hpp"
#include "sim/rebels.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <string>

namespace outpost::sim {

namespace {

constexpr uint16_t kLog = 0x37, kAlert = 0x2B;
const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kColony2 = Handle::make(ObjType::Colony, 2);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);

std::vector<Colony*> playerColonies(Simulation& sim) {
    std::vector<Colony*> out;
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony))
        if (c->player != kRebelPlayer) out.push_back(c);
    return out;
}

// s8:4F54: does the colony have a building (any state) of `group`?
bool hasBuildingIn(Simulation& sim, const Colony& c, int group) {
    return !sim.colonyTilesInGroup(c, group, false).empty();
}

// s6:7FB6: from turn 12, every 50 turns, each researching hot lab has a 5%
// chance of an accident (20% on Medium/Hard) unless DIRT is near.
void hotLabAccidents(Simulation& sim) {
    const uint32_t turn = sim.turn();
    if (turn <= 11 || turn % 50 != 0) return;
    const int threshold = sim.difficulty() <= 2 ? 5 : 20;
    for (Colony* c : playerColonies(sim)) {
        for (Tile* t : sim.colonyTilesInGroup(*c, 17)) {
            const auto* lab = sim.db().get<LabBuilding>(t->building);
            if (!lab || lab->topic == 0 || lab->topic == 112 || lab->topic == 113) continue;
            if (sim.random(1, 100) > threshold) continue;
            if (dirtProtects(sim, *lab, 4)) continue;
            sim.enqueue(makeIncidentStep(c->self, lab->self, true));
        }
    }
}

// s6:7C4E: Medium/Hard, every 20 turns from turn 22: each operational Nano
// facility, 25% (6% on Medium / 12% on Hard with DIRT within 4).
void nanoIncidents(Simulation& sim) {
    const int d = sim.difficulty();
    const uint32_t turn = sim.turn();
    if (d <= 2 || turn <= 2 || (turn - 2) % 20 != 0) return;
    const int guarded = d == 3 ? 6 : 12;
    for (Colony* c : playerColonies(sim)) {
        for (Tile* t : sim.colonyTilesInGroup(*c, 42)) {
            const Building* b = sim.db().get<Building>(t->building);
            if (!b) continue;
            const int chance = dirtProtects(sim, *b, 4) ? guarded : 25;
            if (sim.random(1, 100) <= chance)
                sim.enqueue(makeIncidentStep(c->self, b->self, false));
        }
    }
}

// s6:7DFC: Medium/Hard, every 20 turns: each operational Tokamak melts
// down with 5% (30% on Hard) unless DIRT is within 4.
void tokamakMeltdowns(Simulation& sim) {
    const int d = sim.difficulty();
    const uint32_t turn = sim.turn();
    if (d <= 2 || turn <= 3 || turn % 20 != 0) return;
    const int chance = d == 3 ? 5 : 30;
    for (Colony* c : playerColonies(sim)) {
        for (Tile* t : sim.colonyTilesInGroup(*c, 41)) {
            const Building* b = sim.db().get<Building>(t->building);
            if (!b) continue;
            if (sim.random(1, 100) > chance) continue;
            if (dirtProtects(sim, *b, 4)) continue;
            sim.enqueue(makeIncidentStep(c->self, b->self, false));
        }
    }
}

// s6:76DA: the scheduled morale crisis opens its dialog.
void moraleCrisisDue(Simulation& sim) {
    MoraleCrisis& mc = sim.moraleCrisis();
    if (mc.scheduledTurn != 0 && mc.scheduledTurn == sim.turn()) {
        sim.post({0x111, 0x106, kColony1, 0});       // PostMessage(WM_COMMAND 0x106): the crisis dialog
        mc.scheduledTurn = 0;
    }
}

// s6:767E: with Multiple AI, every 100 turns the AI advisor speaks
// (registry 0x40, s2:B78A; UI).
void aiAdvisor(Simulation& sim) {
    const Player* p1 = sim.db().get<Player>(kPlayer1);
    if (p1 && p1->discoveries[30] != 0 && sim.turn() % 100 == 0)
        sim.post({0x40, 0, Handle{}, 0});
}

// s6:75BC: every 123 turns from turn 150 each colony catches the plague
// with 5%; the plague then ticks — only on these turns (quirk).
void plague(Simulation& sim) {
    const uint32_t turn = sim.turn();
    if (turn % 123 != 0 || turn < 150) return;
    const auto colonies = sim.db().allOf<Colony>(ObjType::Colony);
    for (Colony* c : colonies)
        if (sim.random(1, 100) <= 5) startPlague(sim, *c);
    for (Colony* c : colonies) plagueTick(sim, *c);
}

// s6:780C: wreck the seed modules and landers (group 37) of a colony.
bool wreckSeed(Simulation& sim, Colony* c) {
    if (!c) return false;                           // IMPROVISED (guard)
    const auto tiles = sim.colonyTilesInGroup(*c, 37, false);
    for (Tile* t : tiles)
        if (Building* b = sim.db().get<Building>(t->building)) b->wreck(sim);
    return !tiles.empty();
}

// s6:78B8: the scripted calendar and the Medium/Hard disaster schedule.
void calendar(Simulation& sim) {
    const uint32_t turn = sim.turn();
    Colony* c2 = sim.db().get<Colony>(kColony2);
    rebelCalendar(sim);                             // turns 15..21 and 152 (s5:A54C, s5:A49A)
    if (turn % 125 == 0 && sim.random(1, 100) <= 25) {
        // s8:43CC: the first player colony loses a truck.
        for (Colony* c : playerColonies(sim)) {
            loseRobots(sim, *c, 1, product::Truck);
            break;
        }
    }
    if (turn == 5 && c2) {
        // DGROUP 0x4FFC "Rebel" (s8:4D3C).
        const auto d = sim.data().exe.dgroup();
        std::string name;
        for (size_t i = 0x4FFC; i < d.size() && d[i]; ++i) name.push_back(static_cast<char>(d[i]));
        c2->name = name;
    }
    if (turn == 300) sim.post({kAlert, 0x0F, Handle{}, 0});
    if (turn == 61 && sim.difficulty() != 1) {      // the hard first 60 turns end
        for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) c->population.setGentleDeathTables();
        sim.post({kAlert, 0x10, Handle{}, 0});
    }
    if (turn == 150) {
        if (wreckSeed(sim, sim.db().get<Colony>(kColony1))) sim.post({kAlert, 0x1D, kColony1, 0});
        wreckSeed(sim, c2);
    }
    // IMPROVED (I109): the manual's disasters by planet class
    // (sim/disasters_improved) replace kinds 1..6 on the player's planet.
    planetDisasters(sim);
    const bool byPlanet = planetDisastersApply(sim);
    if (sim.difficulty() <= 2) return;
    auto& sched = sim.disasterSchedule();
    for (uint16_t i = 1; i < 9; ++i) {
        if (sched[i] != turn) continue;
        if (byPlanet && i <= 6) continue;
        const int16_t r = sim.random(1, 100);
        bool strike = true;
        if (i == 7 && r > 50) strike = false;
        if (i == 8 && r > 25) strike = false;
        if (strike) sim.enqueue(makeDisasterStep(i));
        const int16_t later = sim.random(0, 10);
        if (i == 7) sched[7] = turn + 110 + static_cast<uint32_t>(later);
        if (i == 8) sched[8] = turn + 100 + static_cast<uint32_t>(later);
    }
}

class EventStep final : public Step {
public:
    std::string_view name() const override { return "SCEvent"; }
    uint16_t priority() const override { return 4999; }
    void calcMe(Simulation& sim) override {
        hotLabAccidents(sim);
        nanoIncidents(sim);
        tokamakMeltdowns(sim);
        moraleCrisisDue(sim);
        aiAdvisor(sim);
        plague(sim);
        calendar(sim);
    }
};

class IncidentStep final : public Step {
public:
    IncidentStep(Handle colony, Handle target, bool hotLab)
        : m_colony(colony), m_target(target), m_hotLab(hotLab) {}
    std::string_view name() const override { return m_hotLab ? "SCHotLabAccident" : "SCIncident"; }
    uint16_t priority() const override { return 4999; }
    void calcMe(Simulation& sim) override {
        if (m_hotLab) sim.post({kLog, 0x1D, m_colony, 0});
        Building* b = sim.db().get<Building>(m_target);
        Tile* t = b ? b->tile(sim) : nullptr;
        if (!b || !t) return;
        b->wreck(sim);
        // s6:6B40: the 8 neighbours, clamped to the site's map (s6:6DAA:
        // the site's +0x14 size). Both axes are clamped with the width (quirk
        // Q51), and at an edge the clamped cells repeat a neighbour or the
        // building itself, which is then wrecked again (s6:6D24).
        int16_t width = 0x7FFF;
        if (const Colony* c = sim.db().get<Colony>(t->colony))
            if (const Site* s = sim.siteOf(*c)) width = s->mapSize.x;
        // IMPROVISED (guard): a colony without a site has no map size; the
        // original reads it from a NULL site. Then there is no upper bound.
        const auto lo = [](int v) { return static_cast<int16_t>(v - 1 < 0 ? 0 : v - 1); };
        const auto hi = [width](int v) { return static_cast<int16_t>(v + 1 > width - 1 ? width - 1 : v + 1); };
        const int16_t x = t->x, y = t->y;
        const int16_t xs[8] = {lo(x), x, hi(x), lo(x), hi(x), lo(x), x, hi(x)};
        const int16_t ys[8] = {lo(y), lo(y), lo(y), y, y, hi(y), hi(y), hi(y)};
        for (int i = 0; i < 8; ++i) {
            Tile* n = sim.tileAt(t->owner, xs[i], ys[i], t->level);
            Building* nb = n ? sim.db().get<Building>(n->building) : nullptr;
            if (!nb) continue;
            const uint16_t type = nb->type;
            if ((type >= 1 && type <= 9) || (type >= 115 && type <= 121)) continue;   // terrain, robots
            nb->wreck(sim);
        }
    }

private:
    Handle m_colony, m_target;
    bool m_hotLab;
};

class DisasterStep final : public Step {
public:
    explicit DisasterStep(uint16_t kind) : m_kind(kind) {}
    std::string_view name() const override { return "SCDisaster"; }
    uint16_t priority() const override { return 4999; }
    void calcMe(Simulation& sim) override {
        static constexpr uint16_t kMessages[7] = {0, 0x16, 0x17, 0x18, 0x1B, 0x1F, 0x24};
        auto& sched = sim.disasterSchedule();
        const uint32_t turn = sim.turn();
        if (m_kind >= 1 && m_kind <= 6) {
            // Only the message: no damage code was found for these (s6:9114).
            sim.post({kLog, kMessages[m_kind], Handle{}, 0});
        } else if (m_kind == 7) {
            sched[7] = turn + 110 + static_cast<uint32_t>(sim.random(0, 20));
            if (sim.random(1, 100) <= 50) {
                // s8:4900: colony 1 loses an explorer. IMPROVISED (guard): the
                // EXE does not check that colony 1 exists.
                if (Colony* c1 = sim.db().get<Colony>(kColony1)) loseExplorer(*c1);
                sim.post({kLog, 0x2C, Handle{}, 0});
            }
        } else if (m_kind == 8) {
            const int16_t r = sim.random(0, 20);
            sched[8] = turn + 100 + static_cast<uint32_t>(r);
            // The 25% check reuses this 0..20 number, so it always passes
            // (quirk).
            if (r <= 25) {
                // s8:43CC: colony 1 loses a digger. IMPROVISED (guard): the EXE
                // does not check that colony 1 exists.
                if (Colony* c1 = sim.db().get<Colony>(kColony1))
                    loseRobots(sim, *c1, 1, product::Digger);
                sim.post({kLog, 0x2D, Handle{}, 0});
            }
        }
    }

private:
    uint16_t m_kind;
};

} // namespace

bool dirtProtects(Simulation& sim, const Building& b, int radius) {
    const Colony* c = b.colony(sim);
    const Tile* own = b.tile(sim);
    if (!c || !own) return false;
    for (Tile* t : sim.colonyTilesInGroup(*c, 24))
        if (Simulation::tileDistance(*t, *own) <= radius) return true;
    return false;
}

void startPlague(Simulation& sim, Colony& c) {
    if (c.plagueTurns != 0) return;
    c.plagueTurns = static_cast<int16_t>(hasBuildingIn(sim, c, 31) ? 40 : 20);   // a UG Medical Center slows it
    sim.post({kLog, 0x38, c.self, 0});
    c.plagueTreated = 0;
}

void plagueTick(Simulation& sim, Colony& c) {
    if (c.plagueTurns == 0) return;
    Population& p = c.population;
    const int32_t untreated = p.total() - c.plagueTreated;
    if (untreated <= 0) {
        --c.plagueTurns;
        return;
    }
    // Medicine is warehouse item kind 15; one unit treats 5 people.
    int32_t need = (untreated + 3) / 5;
    for (Handle th : c.tiles.order()) {
        if (need == 0) break;
        const Tile* t = sim.db().get<Tile>(th);
        auto* wh = t ? sim.db().get<WarehouseBuilding>(t->building) : nullptr;
        if (!wh || !sim.data().groups.contains(4, wh->type)) continue;
        int32_t stock = 0;                                    // s6:678C: the first kind-15 item
        for (const ProductItem& i : wh->items)
            if (i.productB == 15) { stock = i.quantity; break; }
        if (stock == 0) continue;
        if (stock > need) {
            wh->take(15, need);
            c.plagueTreated += 5 * need;
            need = 0;
        } else {
            wh->take(15, stock);
            c.plagueTreated += 5 * stock;
            need -= stock;
        }
    }
    const int32_t sick = p.total() - c.plagueTreated;
    if (sick != 0) {
        // When more were treated than there are people, the negative count
        // still kills one (quirk).
        int32_t dead = sick / c.plagueTurns;
        if (dead <= 0) dead = 1;
        p.kill(0, dead);
    }
    --c.plagueTurns;
}

std::unique_ptr<Step> makeEventStep() { return std::make_unique<EventStep>(); }

std::unique_ptr<Step> makeIncidentStep(Handle colony, Handle target, bool hotLab) {
    return std::make_unique<IncidentStep>(colony, target, hotLab);
}

std::unique_ptr<Step> makeDisasterStep(uint16_t kind) { return std::make_unique<DisasterStep>(kind); }

} // namespace outpost::sim
