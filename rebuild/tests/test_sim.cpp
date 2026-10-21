// Simulation-core tests. Every expectation is a behaviour read from
// OUTPOST.EXE (findings/00-ground-truth.md §3, findings/08-simulation.md).

#include <catch2/catch_test_macros.hpp>

#include "data/game_files.hpp"
#include "sim/building.hpp"
#include "sim/events.hpp"
#include "sim/disasters_improved.hpp"
#include "sim/msvc_qsort.hpp"
#include "sim/ops_loader.hpp"
#include "data/ops_save.hpp"
#include "sim/ops_extensions.hpp"
#include "sim/research.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdlib>
#include <fstream>
#include <iterator>
#include <array>
#include <memory>
#include <string>
#include <string_view>
#include <vector>

using namespace outpost;
using namespace outpost::sim;
namespace res = outpost::data::res;

namespace {

const GameData& gameData() {
    static GameData d;
    static bool ok = [] {
        data::GameFiles files;
        std::string err;
        bool loaded = files.open(OUTPOST_TEST_DATA_DIR) && d.load(files, &err);
        if (!loaded) FAIL("cannot load game data: " << err);
        return loaded;
    }();
    REQUIRE(ok);
    return d;
}

struct World {
    Simulation sim{gameData()};
    Player& player = sim.createPlayer();
    Colony& colony = sim.createColony(player.self);

    int16_t nextX{0};
    int16_t nextDepot{0};

    // Buildings go in a row of adjacent tiles (x = 0, 1, 2, ... on y = 0),
    // so they conduct power and air to each other (SCProdSched).
    Building& place(uint16_t type, uint16_t state = Building::kOperational) {
        Tile& t = sim.createTile(colony, nextX++, 0, 0);
        Building& b = sim.createBuilding(t, type);
        b.setState(sim, state);
        longLivedSeed(b);
        return b;
    }
    // A SeedCommand spends one life a turn and then turns into a lifeless
    // Command (s7:C10E); its life is set on landing (s7:C1B2). Seeds placed
    // by the tests get plenty.
    static void longLivedSeed(Building& b) {
        if (b.type == 11) static_cast<CommandCenterBuilding&>(b).life = 30000;
    }
    // SeedPower and SeedCommand at the head of the row: everything placed
    // after them is on the power and air networks.
    void utilities() {
        place(13);
        place(11);
    }
    // A tile without a building, away from the row, to hold stock.
    Tile& depot() { return sim.createTile(colony, nextDepot++, 40, 0); }
    Tile& tileOf(const Building& b) { return *b.tile(sim); }
};

class NamedStep : public Step {
public:
    NamedStep(std::string_view n, int p, std::vector<std::string_view>* log)
        : m_name(n), m_priority(static_cast<uint16_t>(p)), m_log(log) {}
    std::string_view name() const override { return m_name; }
    uint16_t priority() const override { return m_priority; }
    void calcMe(Simulation&) override { m_log->push_back(m_name); }

private:
    std::string_view m_name;
    uint16_t m_priority;
    std::vector<std::string_view>* m_log;
};

} // namespace

TEST_CASE("Turn runs the original steps in priority order", "[sim][turn]") {
    World w;
    w.sim.runTurns(1);
    const std::vector<std::string_view> expected = {
        "SCSetup", "SCRoboMove", "SCProdSched", "SCConstruct", "SCRchSched",
        "SCAiInput", "SCMove", "SCPop", "SCMines", "SCFactory", "SCPower",
        "SCEvent", "SCMorale", "SCPrelimAlloc", "SCEndSim"};
    REQUIRE(w.sim.lastTurnSteps() == expected);
    REQUIRE(w.sim.turn() == 1);
}

TEST_CASE("Step queue: highest first, new step ahead of equal priority", "[sim][queue]") {
    World w;
    std::vector<std::string_view> log;
    StepQueue q;
    q.enqueue(w.sim, std::make_unique<NamedStep>("low", 999, &log));
    q.enqueue(w.sim, std::make_unique<NamedStep>("firstAt5000", 5000, &log));
    q.enqueue(w.sim, std::make_unique<NamedStep>("high", 16000, &log));
    q.enqueue(w.sim, std::make_unique<NamedStep>("secondAt5000", 5000, &log));
    q.runAll(w.sim);
    REQUIRE(log == std::vector<std::string_view>{"high", "secondAt5000", "firstAt5000", "low"});
}

TEST_CASE("Power plants (SCPower over group 12)", "[sim][power]") {
    World w;
    w.colony.freeResources = true;       // running costs are not under test
    auto& tokamak = w.place(20);
    auto& seedPower = w.place(13);
    auto& offline = w.place(21, Building::kConstructing);
    auto& ugTokamak = w.place(98);       // not in group 12
    auto& geo = w.place(110);            // empty power() in the EXE
    auto& seedCmd = w.place(11);         // not in group 12
    auto& solar = w.place(18);
    w.sim.runTurns(1);

    REQUIRE(w.tileOf(tokamak).bas.get(res::Power) == 1000);
    REQUIRE(w.tileOf(seedPower).bas.get(res::Power) == 50);
    REQUIRE(w.tileOf(offline).bas.entries().count(res::Power) == 1);
    REQUIRE(w.tileOf(offline).bas.get(res::Power) == 0);
    REQUIRE(w.tileOf(ugTokamak).bas.entries().count(res::Power) == 0);
    REQUIRE(w.tileOf(geo).bas.entries().count(res::Power) == 0);
    REQUIRE(w.tileOf(seedCmd).bas.entries().count(res::Power) == 0);
    REQUIRE(w.tileOf(solar).bas.entries().count(res::Power) == 0);   // no satellite

    w.sim.setOrbitalCount(131, 1);
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(solar).bas.get(res::Power) == 1000);
}

TEST_CASE("Command Center power runs on a lifetime counter", "[sim][power]") {
    World w;
    w.colony.freeResources = true;
    auto& cmd = static_cast<CommandCenterBuilding&>(w.place(55));
    cmd.life = 30;
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(cmd).bas.get(res::Power) == 50);
    REQUIRE(cmd.life == 29);
    REQUIRE_FALSE(w.colony.populated);

    cmd.life = 20;
    w.sim.runTurns(1);
    REQUIRE(w.colony.populated);

    cmd.life = 0;
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(cmd).bas.get(res::Power) == 0);
}

TEST_CASE("Agri dome rate and storage", "[sim][food]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& dome = w.place(27);
    REQUIRE(dome.opsAmount == 10);
    REQUIRE(dome.opsResource == res::Food);
    REQUIRE(w.place(29).opsAmount == 12);

    w.sim.runTurns(1);
    REQUIRE(w.tileOf(dome).bas.get(res::Food) == 10);

    w.tileOf(dome).bas.set(res::Food, 995);
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(dome).bas.get(res::Food) == 1000);
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(dome).bas.get(res::Food) == 1000);

    // Quirk: above 1000 the 16-bit "room" wraps and the full rate is added.
    w.tileOf(dome).bas.set(res::Food, 1200);
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(dome).bas.get(res::Food) == 1210);

    // Research bonuses apply when the dome becomes operational.
    w.player.remaining[12] = 0;    // Exobiology
    w.player.remaining[14] = 0;    // Agriculture 1
    w.player.remaining[118] = 0;   // Agriculture 2
    auto& dome3 = w.place(27);
    REQUIRE(dome3.opsAmount == 13);
}

TEST_CASE("Building state machine and needs records", "[sim][state]") {
    World w;
    auto& b = w.place(27, Building::kConstructing);
    REQUIRE(b.needs() != nullptr);
    REQUIRE((*b.needs())[res::Power] == 3);      // BLDGBLD: build needs
    b.setState(w.sim, Building::kOperational);
    REQUIRE((*b.needs())[res::Power] == 2);      // BLDGOPS: running needs

    b.setState(w.sim, Building::kSuspended);
    REQUIRE(b.state == Building::kSuspended);
    REQUIRE(b.savedState == Building::kOperational);
    b.setState(w.sim, Building::kConstructing);  // ignored while suspended
    REQUIRE(b.state == Building::kSuspended);
    b.setState(w.sim, Building::kOperational);   // resumes
    REQUIRE(b.state == Building::kOperational);

    b.setState(w.sim, 0);
    REQUIRE(b.needs() == nullptr);
}

TEST_CASE("Colony totals and allocation", "[sim][economy]") {
    World w;
    w.utilities();                                // SeedPower: 50 power, no running needs
    auto& dome = w.place(27);                     // runs on 2 power, 1 worker, MinA-C 1 each
    Tile& stock = w.depot();
    for (int r : {res::MinA, res::MinB, res::MinC}) stock.bas.set(r, 5);
    w.colony.population.cohort[20] = 10;          // ten working-age colonists

    // Turn 1: the plant has not produced yet, so the dome cannot pay its
    // 2 power and stays suspended; the shortfall is noted on its tile.
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kSuspended);
    REQUIRE(w.tileOf(dome).alloc.get(res::Power) == 2);
    REQUIRE(w.colony.total[res::Power] == 50);
    REQUIRE(w.colony.alloc[res::Power] == 0);     // suspended buildings get nothing

    // Turn 2: it pays (SCProdSched), runs, and PrelimAlloc grants its needs
    // for next turn, all-or-nothing per resource.
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kOperational);
    REQUIRE(stock.bas.get(res::MinA) == 4);       // paid from the stock tile
    REQUIRE(w.colony.total[res::Power] == 50);
    REQUIRE(w.colony.total[res::Food] == 10);
    REQUIRE(w.colony.total[res::People] == 10);
    REQUIRE((*dome.needs())[res::Power] == 2);
    REQUIRE(w.colony.alloc[res::Power] == 2);
    REQUIRE(w.colony.alloc[res::People] == 1);
    REQUIRE(w.colony.alloc[res::MinA] == 1);
    REQUIRE(w.colony.alloc[res::FusionA] == 0);
    REQUIRE(w.colony.available(res::Power) == 48);
    REQUIRE(w.colony.available(res::People) == 9);

    // All-or-nothing: with no MinB left the dome is granted none of it.
    stock.bas.set(res::MinB, 0);
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kSuspended);  // cannot pay MinB (no MPG either)
}

TEST_CASE("Population age groups", "[sim][population]") {
    Population pop;
    pop.schoolLeavingAge = 17;
    for (auto& c : pop.cohort) c = 1;
    REQUIRE(pop.group(1) == 4);       // 0-3
    REQUIRE(pop.group(2) == 14);      // 4-17
    REQUIRE(pop.group(3) == 22);      // 18-39
    REQUIRE(pop.group(4) == 36);      // 40-75
    REQUIRE(pop.group(5) == 15);      // 76-90
    REQUIRE(pop.group(0) == 91);
}

TEST_CASE("SCSetup skips the rebel player's colonies", "[sim][setup]") {
    World w;
    Player& rebels = w.sim.createPlayer();
    REQUIRE(rebels.self == kRebelPlayer);
    Colony& rebelColony = w.sim.createColony(rebels.self);
    Tile& t = w.sim.createTile(rebelColony);
    w.sim.createBuilding(t, 20).setState(w.sim, Building::kOperational);
    w.sim.runTurns(1);
    // SCPrelimAlloc (unlike SCSetup) still sums it.
    REQUIRE(rebelColony.total[res::Power] == 1000);
}

// ── Mines, smelters, SPEW, factories (findings/08-simulation.md §2.5) ─────

namespace {

Building& placeAt(World& w, uint16_t type, int16_t x, int16_t y, int16_t level,
                  uint16_t state = Building::kOperational) {
    Tile& t = w.sim.createTile(w.colony, x, y, level);
    Building& b = w.sim.createBuilding(t, type);
    b.setState(w.sim, state);
    World::longLivedSeed(b);
    return b;
}

int32_t oreOn(const Tile& t) {
    int32_t sum = 0;
    for (int r = res::OreA; r <= res::OreMinC; ++r) sum += t.bas.get(r);
    return sum;
}

} // namespace

TEST_CASE("Underground mine feeds the surface building above it", "[sim][mine]") {
    REQUIRE(gameData().mineOreMix == std::array<int16_t, 10>{2, 1, 1, 1, 1, 1, 1, 3, 2, 2});

    World w;
    w.colony.freeResources = true;                 // running costs are not under test here
    auto& head = placeAt(w, 51, 3, 4, 0);          // ActiveMine on the surface
    auto& shaft = static_cast<MineBuilding&>(placeAt(w, 96, 3, 4, 1));   // UGMine below
    shaft.life = 100;                              // as set when construction ends
    placeAt(w, 51, 9, 9, 0);                       // unrelated surface mine: does nothing

    w.sim.runTurns(1);
    const Tile& top = w.tileOf(head);
    REQUIRE(oreOn(top) == 15);
    REQUIRE(top.bas.get(res::OreA) == 2);
    REQUIRE(top.bas.get(res::OreMinA) == 3);
    REQUIRE(oreOn(w.tileOf(shaft)) == 0);

    // Only the room below 500 is filled; a turn spent full costs no life.
    w.tileOf(head).bas.clear();
    w.tileOf(head).bas.set(res::OreD, 495);
    w.sim.runTurns(1);
    REQUIRE(oreOn(w.tileOf(head)) == 500);
    w.tileOf(head).bas.set(res::OreD, 501);
    w.sim.runTurns(1);
    REQUIRE(shaft.life == 98);                     // 3 operating turns, 1 given back
}

TEST_CASE("Smelter refines ore", "[sim][smelter]") {
    World w;
    auto& sm = static_cast<SmelterBuilding&>(w.place(53));
    Tile& t = w.tileOf(sm);
    t.bas.set(res::OreA, 5);
    t.bas.set(res::OreFusionB, 4);
    t.bas.set(res::OreMinB, 3);
    t.bas.set(res::OreMinC, 7);
    sm.produce(w.sim);                             // turn 0 (even)
    REQUIRE(sm.output.get(res::MetalA) == 2);      // half, rounded down
    REQUIRE(sm.output.get(res::FusionB) == 4);
    REQUIRE(sm.output.get(res::MinB) == 3);
    REQUIRE(sm.output.get(res::PrecA) == 1);       // 2 OreMinB -> 1 PrecA
    REQUIRE(sm.minBCarry == 1);
    REQUIRE(sm.output.get(res::MinC) == 7);
    REQUIRE(sm.output.get(res::PrecB) == 2);       // 3 OreMinC -> 1 PrecB
    REQUIRE(sm.minCCarry == 1);
    REQUIRE(t.bas.get(res::OreA) == 0);
    REQUIRE(w.colony.total[res::OreA] == -5);      // removed from the colony totals

    // On odd turns a single ore still yields one metal.
    w.sim.runTurns(1);
    t.bas.set(res::OreB, 1);
    sm.produce(w.sim);
    REQUIRE(sm.output.get(res::MetalB) == 1);

    // isFull counts the output twice: 500 real units already read as full.
    SmelterBuilding& sm2 = static_cast<SmelterBuilding&>(w.place(54));
    sm2.output.set(res::MetalA, 500);
    int32_t stored = 0;
    REQUIRE(sm2.isFull(w.sim, stored));
    REQUIRE(stored == 1000);
}

TEST_CASE("SPEW turns sewage into MPG", "[sim][spew]") {
    World w;
    auto& s1 = static_cast<SpewBuilding&>(w.place(34));
    w.tileOf(s1).bas.set(res::Sewage, 37);
    s1.produce(w.sim);
    REQUIRE(w.tileOf(s1).bas.get(res::MPG) == 37);
    REQUIRE(w.tileOf(s1).bas.get(res::Sewage) == 0);

    auto& s2 = static_cast<SpewBuilding&>(w.place(35));
    w.tileOf(s2).bas.set(res::Sewage, 37);
    s2.produce(w.sim);
    REQUIRE(w.tileOf(s2).bas.get(res::MPG) == 40);   // +10%, remainder 7 kept
    REQUIRE(s2.carry == 7);
    s2.produce(w.sim);                               // the remainder counts again
    REQUIRE(w.tileOf(s2).bas.get(res::MPG) == 47);

    auto& s3 = static_cast<SpewBuilding&>(w.place(36));
    w.tileOf(s3).bas.set(res::Sewage, 10);
    s3.produce(w.sim);
    REQUIRE(w.tileOf(s3).bas.get(res::MPG) == 12);   // +20%
}

TEST_CASE("Residences make sewage that reaches the first SPEW", "[sim][spew]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& spew = w.place(34);
    w.place(34);                                     // second SPEW gets nothing
    w.place(79);                                     // UGResident
    w.place(80);
    w.sim.runTurns(1);
    const auto& steps = w.sim.lastTurnSteps();
    REQUIRE(std::count(steps.begin(), steps.end(), "SCAddSpew") == 2);
    REQUIRE(steps.back() == "SCEndSim");
    REQUIRE(w.tileOf(spew).bas.get(res::Sewage) == 2);
    w.sim.runTurns(1);                               // SPEW converts last turn's sewage
    REQUIRE(w.tileOf(spew).bas.get(res::MPG) == 2);
}

TEST_CASE("Factory production", "[sim][factory]") {
    World w;
    w.colony.morale = 500;                           // normal speed
    auto& f = static_cast<FactoryBuilding&>(w.place(30));
    f.opsProductA = 1;
    f.opsAmount = 2;
    f.opsCycleTurns = 1;
    for (int i = 0; i < 5; ++i) f.produce(w.sim);
    REQUIRE(f.output.size() == 5);
    REQUIRE(f.output[0].units == 6);                 // value 3 x quantity 2
    int32_t stored = 0;
    REQUIRE(f.isFull(w.sim, stored));
    f.produce(w.sim);                                // full: the batch is lost
    REQUIRE(f.output.size() == 5);
    REQUIRE(f.progress == 0);

    // Low morale halves the speed: no progress on even turns.
    w.colony.morale = 100;
    auto& slow = static_cast<FactoryBuilding&>(w.place(30));
    slow.opsProductA = 1;
    slow.opsAmount = 1;
    slow.opsCycleTurns = 5;
    slow.advance(w.sim);                             // turn 0 is even
    REQUIRE(slow.progress == 0);

    // Product 12 adds to the population instead of the output.
    w.colony.morale = 500;
    auto& p12 = static_cast<FactoryBuilding&>(w.place(30));
    p12.opsProductA = 12;
    p12.opsAmount = 1;
    p12.opsCycleTurns = 1;
    p12.produce(w.sim);
    REQUIRE(w.colony.population.extra170 == 1);
    REQUIRE(p12.output.empty());
}

// ── Population (SCPop s6:9EFC, findings/08-simulation.md §2.6) ───────────

TEST_CASE("Original rand() and random(lo, hi)", "[sim][rng]") {
    MsvcRand r;                                       // MSVC default seed 1
    const int16_t expected[] = {41, 18467, 6334, 26500, 19169};
    for (int16_t e : expected) REQUIRE(r.rand() == e);

    // s2:612E maps rand() onto lo..hi in steps of 0x7FFF / n.
    World w;                                          // seed 0 keeps the default seed 1
    REQUIRE(w.sim.random(1, 3) == 1);                 // rand() = 41
    REQUIRE(w.sim.random(1, 100) == 57);              // rand() = 18467, step 327
    REQUIRE(w.sim.random(5, 5) == 5);                 // still draws
    REQUIRE(w.sim.rand().rand() == 26500);          // the 4th draw
}

TEST_CASE("Population tables and cohort operations", "[sim][pop]") {
    Population p;
    p.reset(0);                                       // unset/Beginner: s7:34DA tables
    REQUIRE(p.deathRate == std::array<int16_t, 6>{0, 1, 1, 1, 1, 4});
    REQUIRE(p.deathChance == std::array<int16_t, 6>{0, 50, 10, 10, 10, 75});
    REQUIRE(p.birthDivisor == 5);
    REQUIRE(p.schoolLeavingAge == 16);
    p.reset(3);                                       // Easy and up
    REQUIRE(p.deathRate == std::array<int16_t, 6>{0, 1, 2, 2, 1, 6});
    REQUIRE(p.deathChance == std::array<int16_t, 6>{0, 100, 100, 100, 100, 100});

    p.addColonists(52);                               // 10 each, +2 to age 19
    REQUIRE(p.cohort[19] == 12);
    REQUIRE(p.cohort[29] == 10);
    REQUIRE(p.cohort[59] == 10);
    REQUIRE(p.total() == 52);

    p.ageOneYear();
    REQUIRE(p.cohort[20] == 12);
    REQUIRE(p.cohort[19] == 0);
    REQUIRE(p.cohort[0] == 0);

    // Group kill: spread evenly, the remainder one each from the youngest.
    Population q;
    q.reset(0);
    for (int age = 40; age <= 75; ++age) q.cohort[static_cast<size_t>(age)] = 10;   // 36 ages
    q.deathCarry[2] = 7;
    q.kill(4, 40);
    REQUIRE(q.cohort[40] == 8);
    REQUIRE(q.cohort[43] == 8);
    REQUIRE(q.cohort[44] == 9);
    REQUIRE(q.group(4) == 320);
    REQUIRE(q.deathCarry[2] == 0);                    // every carry is cleared

    // Cohorts are clamped at 0; the excess is simply not taken.
    q.cohort[1] = 1;
    q.kill(1, 8);
    REQUIRE(q.group(1) == 0);

    // Group 0: oldest first.
    q.kill(0, 15);
    REQUIRE(q.cohort[75] == 0);
    REQUIRE(q.cohort[74] == 3);

    // No life support: 1, 2, 4, ... capped at the population.
    Population l;
    l.cohort[30] = 5;
    REQUIRE(l.lifeSupportFailure() == 1);
    REQUIRE(l.lifeSupportFailure() == 2);
    REQUIRE(l.lifeSupportFailure() == 2);             // 4 capped at the 2 left
    REQUIRE(l.total() == 0);
}

TEST_CASE("SCPop feeds the colony and queues SCStarve", "[sim][pop]") {
    World w;
    w.colony.populated = true;
    auto& cmd = w.place(11);                          // SeedCommand: life support
    w.colony.population.cohort[30] = 25;
    w.tileOf(cmd).bas.set(res::Food, 100);
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(cmd).bas.get(res::Food) == 97);  // ceil(25 / 10)
    REQUIRE(w.colony.population.total() == 25);
    REQUIRE(w.colony.crowdingMorale == -20);          // no residence: ratio 100
    REQUIRE(w.colony.crowdingFlag == 1);

    // Two Food feed 20 of 25: SCStarve is queued; on Beginner/Easy it kills 1.
    w.sim.setDifficulty(1);
    w.tileOf(cmd).bas.set(res::Food, 2);
    w.sim.runTurns(1);
    REQUIRE(w.tileOf(cmd).bas.get(res::Food) == 0);
    REQUIRE(w.colony.population.total() == 24);
    const auto& steps = w.sim.lastTurnSteps();
    auto at = [&](std::string_view n) { return std::find(steps.begin(), steps.end(), n) - steps.begin(); };
    REQUIRE(at("SCStarve") < static_cast<long long>(steps.size()));
    REQUIRE(at("SCStarve") < at("SCEvent"));          // same priority, queued in front
    REQUIRE(at("SCPower") < at("SCStarve"));

    // An unpopulated colony is left alone.
    World idle;
    idle.colony.population.cohort[30] = 25;
    idle.sim.runTurns(1);
    REQUIRE(idle.colony.population.total() == 25);
    REQUIRE(idle.colony.crowdingMorale == 0);
}

TEST_CASE("SCPop life support", "[sim][pop]") {
    World w;
    w.colony.populated = true;
    w.depot().bas.set(res::Food, 1000);
    w.colony.population.cohort[30] = 100;
    w.sim.runTurns(3);                                // 1 + 2 + 4 die
    REQUIRE(w.colony.population.total() == 93);
    REQUIRE(w.colony.population.lifeSupportDeaths == 4);

    auto& cmd = static_cast<CommandCenterBuilding&>(w.place(55));
    cmd.life = 0;                                     // a spent Command center gives none
    w.sim.runTurns(1);
    REQUIRE(w.colony.population.total() == 85);

    cmd.life = 40;
    w.sim.runTurns(1);
    REQUIRE(w.colony.population.total() == 85);
    REQUIRE(w.colony.population.lifeSupportDeaths == 0);

    // A Chap gives air only while it has power.
    World c;
    c.colony.populated = true;
    c.colony.freeResources = true;
    c.depot().bas.set(res::Food, 1000);
    c.colony.population.cohort[30] = 100;
    auto& chap = c.place(42);
    c.sim.runTurns(1);
    REQUIRE(chap.state == Building::kSuspended);
    REQUIRE(c.colony.population.total() == 99);
    c.place(13);                                      // SeedPower next to it
    c.sim.runTurns(1);
    REQUIRE(chap.state == Building::kOperational);
    REQUIRE((chap.flags & Building::kReachedByPower) != 0);
    REQUIRE(c.colony.population.total() == 99);
}

TEST_CASE("SCPop crowding, births and the rebels' missing births", "[sim][pop]") {
    auto setup = [](World& w, Colony& c, int residences, int32_t adults) {
        c.populated = true;
        c.freeResources = true;
        w.sim.createTile(c, 0, 40, 0).bas.set(res::Food, 1000);
        int16_t x = 0;
        for (uint16_t type : {uint16_t{13}, uint16_t{11}}) {      // SeedPower, SeedCommand
            Tile& t = w.sim.createTile(c, x++, 0, 0);
            w.sim.createBuilding(t, type).setState(w.sim, Building::kOperational);
        }
        for (int i = 0; i < residences; ++i) {
            Tile& t = w.sim.createTile(c, x++, 0, 0);
            w.sim.createBuilding(t, 79).setState(w.sim, Building::kOperational);
        }
        c.population.cohort[30] = adults;
    };

    World w;
    setup(w, w.colony, 2, 100);                       // 50 per residence
    w.sim.runTurns(1);                                // turn 0: a year passes
    REQUIRE(w.colony.crowdingMorale == -5);
    REQUIRE(w.colony.crowdingFlag == 1);
    REQUIRE(w.colony.population.cohort[0] == 20);     // (100 adults) / 5
    REQUIRE(w.colony.population.cohort[30] == 0);
    REQUIRE(w.colony.population.cohort[31] >= 99);    // a 10% death roll may take 1

    World r;
    Colony& rebels = r.sim.createColony(kRebelPlayer);
    setup(r, rebels, 2, 100);
    r.sim.runTurns(1);
    REQUIRE(rebels.population.cohort[31] >= 99);      // they age ...
    REQUIRE(rebels.population.cohort[0] == 0);        // ... but have no children

    World roomy;
    setup(roomy, roomy.colony, 5, 100);               // 20 per residence
    roomy.sim.runTurns(1);
    REQUIRE(roomy.colony.crowdingMorale == 1);
    REQUIRE(roomy.colony.crowdingFlag == -1);
}

TEST_CASE("Cryo colonists aboard the mothership", "[sim][pop]") {
    Mothership s;
    s.arrived = true;
    s.countdown = 0;
    s.cryoColonists = 7;
    REQUIRE(s.loseCryoColonists(50) == 1);
    REQUIRE(s.loseCryoColonists(51) == 5);
    REQUIRE(s.loseCryoColonists(61) == -1);           // the last one dies
    REQUIRE(s.cryoColonists == 0);
    REQUIRE(s.loseCryoColonists(62) == 0);

    World w;
    Mothership& ship = w.sim.mothership();
    ship.deployable = {{62, 1}};                      // a ColonistLander aboard
    ship.arrived = true;
    ship.cryoColonists = 20;
    w.sim.runTurns(9);
    REQUIRE(ship.cryoColonists == 20);                // the 10-turn countdown
    w.sim.runTurns(1);
    REQUIRE(ship.cryoColonists == 19);
    const auto& n = w.sim.notices();
    REQUIRE(std::any_of(n.begin(), n.end(), [](const Notice& x) { return x.channel == 0x2B && x.code == 0x14; }));
}

// ── Morale (SCMorale s7:ECF8, findings/08-simulation.md §2.7) ────────────

namespace {

// A populated colony 1 running for free: SeedPower and SeedCommand, two
// residences next to them (x = 0..3 on y = 0), a food store, 100 adults.
// After one turn SCPop has made it 120 people (20 newborns) with crowding
// -5/+1.
void moraleColony(World& w) {
    w.colony.populated = true;
    w.colony.freeResources = true;
    placeAt(w, 13, 0, 0, 0);
    placeAt(w, 11, 1, 0, 0);
    placeAt(w, 79, 2, 0, 0);
    placeAt(w, 79, 3, 0, 0);
    w.sim.createTile(w.colony, 0, 40, 0).bas.set(res::Food, 1000);
    w.colony.population.cohort[30] = 100;
}

} // namespace

TEST_CASE("Building morale effects (slot 18)", "[sim][morale]") {
    World w;
    REQUIRE(w.place(27).moraleEffect(w.sim) == 1);                       // AgriDome
    REQUIRE(w.place(27, Building::kConstructing).moraleEffect(w.sim) == 0);
    REQUIRE(w.place(40).moraleEffect(w.sim) == -1);                      // HotLab
    REQUIRE(w.place(45).moraleEffect(w.sim) == 5);                       // TerraForm
    REQUIRE(w.place(101).moraleEffect(w.sim) == 2);                      // UG Red Light District
    REQUIRE(w.place(20).moraleEffect(w.sim) == 0);                       // Tokamak: by proximity instead

    auto& cop = static_cast<PoliceBuilding&>(w.place(49));
    REQUIRE(cop.moraleEffect(w.sim) == -1);
    cop.mode = 2;
    REQUIRE(cop.moraleEffect(w.sim) == 1);
    cop.mode = 1;
    w.player.remaining[99] = 0;                                          // Crowd Psychology
    REQUIRE(cop.moraleEffect(w.sim) == 0);
}

TEST_CASE("SCMorale: crime, education and the morale sum", "[sim][morale]") {
    World w;
    moraleColony(w);
    w.sim.runTurns(1);
    // crime: +1 crowded, +1 education below 50, -1 morale in 550..749.
    REQUIRE(w.colony.crime == 1);
    // education: 50 + (g4 - g3) + (g2 - g1) = 50 - 100 - 20 < 0, so -1.
    REQUIRE(w.colony.education == 49);
    REQUIRE(w.colony.population.schoolLeavingAge == 20);                 // always (quirk)
    // morale: 600 + 0 gains; losses: crime/10 = 0, education -1, crowding -5.
    REQUIRE(w.colony.prevMorale == 600);
    REQUIRE(w.colony.morale == 594);

    // Buildings: +1 per operational agri dome; -1 per building within 5 of
    // a Tokamak (here the two domes and the residence at x = 3).
    World b;
    moraleColony(b);
    placeAt(b, 27, 4, 0, 0);                                             // domes on the network
    placeAt(b, 27, 5, 0, 0);
    placeAt(b, 20, 4, 4, 0);                                             // Tokamak
    placeAt(b, 27, 30, 30, 0);                                           // unconnected: suspended
    b.sim.runTurns(1);
    REQUIRE(b.colony.morale == 594 + 2 - 3);

    // Planet hostility, softened by difficulty.
    auto withHostility = [](int16_t h, int difficulty) {
        World h1;
        h1.sim.setDifficulty(difficulty);
        moraleColony(h1);
        h1.sim.setPlanetHostility(h);
        h1.sim.runTurns(1);
        return h1.colony.morale;
    };
    REQUIRE(withHostility(1, 0) == 594);                                 // 1 counts as 0
    REQUIRE(withHostility(5, 0) == 589);
    REQUIRE(withHostility(5, 2) == 590);                                 // Easy: 4..6 -> -1
    REQUIRE(withHostility(5, 3) == 589);                                 // Medium: only 7+
    REQUIRE(withHostility(8, 3) == 587);
    REQUIRE(withHostility(8, 1) == 588);                                 // Beginner: 7+ -> -2

    // Crime adds to morale instead of subtracting (quirk).
    World c;
    moraleColony(c);
    c.colony.crime = 60;
    c.sim.runTurns(1);
    REQUIRE(c.colony.crime == 61);
    REQUIRE(c.colony.morale == 594 + 6);
}

TEST_CASE("SCMorale: red-light districts and police", "[sim][morale]") {
    World w;
    moraleColony(w);
    placeAt(w, 101, 4, 0, 0);                                            // no police: +1 crime
    w.sim.runTurns(1);
    REQUIRE(w.colony.crime == 2);

    World hostile;
    moraleColony(hostile);
    placeAt(hostile, 101, 4, 0, 0);
    static_cast<PoliceBuilding&>(placeAt(hostile, 108, 5, 0, 0)).mode = 1;
    hostile.sim.runTurns(1);
    REQUIRE(hostile.colony.crime == 1);                                  // district suppressed

    World friendly;
    moraleColony(friendly);
    placeAt(friendly, 101, 4, 0, 0);
    static_cast<PoliceBuilding&>(placeAt(friendly, 108, 5, 0, 0)).mode = 2;
    friendly.sim.runTurns(1);                                            // turn 0: even, counts
    REQUIRE(friendly.colony.crime == 2);

    // Crime incident: at 75+ every 5 turns the first unpoliced residence
    // (in the colony's tile order) becomes a red-light district.
    World riot;
    moraleColony(riot);
    std::vector<const Tile*> homes;
    for (Handle h : riot.colony.tiles.order()) {
        const Tile* t = riot.sim.db().get<Tile>(h);
        const Building* b = riot.sim.db().get<Building>(t->building);
        if (b && b->type == 79) homes.push_back(t);
    }
    REQUIRE(homes.size() == 2);
    riot.colony.crime = 90;
    riot.sim.runTurns(1);
    REQUIRE(riot.sim.db().get<Building>(homes[0]->building)->type == 101);
    REQUIRE(riot.sim.db().get<Building>(homes[1]->building)->type == 79);

    World policed;
    moraleColony(policed);
    placeAt(policed, 108, 2, 1, 0);                                      // on the network, near both homes
    policed.colony.crime = 90;
    policed.sim.runTurns(1);
    REQUIRE(policed.sim.db().get<Building>(policed.sim.tileAt(policed.colony.self, 2, 0, 0)->building)->type == 79);
}

TEST_CASE("SCMorale: defections and the morale crisis", "[sim][morale]") {
    // Morale 0: a quarter of colony 1 leaves for the rebels.
    World w;
    moraleColony(w);
    Colony& rebels = w.sim.createColony(kRebelPlayer);
    w.colony.morale = 0;
    w.sim.runTurns(1);
    REQUIRE(w.colony.morale == 0);
    REQUIRE(w.colony.defectionTier == 8);
    REQUIRE(w.colony.defectionAmount == 30);                             // 120 / 4
    REQUIRE(w.colony.population.total() == 90);
    REQUIRE(rebels.population.total() == 30);
    auto& steps = w.sim.lastTurnSteps();
    REQUIRE(std::find(steps.begin(), steps.end(), "SCMigrate") != steps.end());

    // Morale 990+: a tenth of the rebels join.
    World j;
    moraleColony(j);
    Colony& r2 = j.sim.createColony(kRebelPlayer);
    r2.population.cohort[30] = 50;
    j.colony.morale = 1000;
    j.sim.runTurns(1);
    REQUIRE(j.colony.morale == 994);
    REQUIRE(j.colony.defectionTier == 15);
    REQUIRE(r2.population.total() == 45);
    REQUIRE(j.colony.population.total() == 125);

    // The last colonist leaving hands the colony to the rebels.
    World e;
    e.colony.populated = true;
    placeAt(e, 11, 0, 0, 0);
    e.sim.createTile(e.colony, 1, 0, 0).bas.set(res::Food, 1000);
    e.colony.population.cohort[30] = 1;
    e.sim.createColony(kRebelPlayer);
    e.colony.morale = 0;
    e.sim.runTurns(1);
    REQUIRE(e.colony.population.total() == 0);
    REQUIRE(e.colony.player == kRebelPlayer);
    REQUIRE(e.colony.morale == 600);
    REQUIRE(e.colony.prevMorale == 600);
    const auto& n = e.sim.notices();
    REQUIRE(std::any_of(n.begin(), n.end(), [](const Notice& x) { return x.channel == 0x37 && x.code == 0x3C; }));

    // Crisis: answer 3 gives +1; low morale schedules the next one 30..38 turns on.
    World k;
    moraleColony(k);
    k.sim.moraleCrisis().response = 3;
    k.sim.runTurns(1);
    REQUIRE(k.colony.morale == 595);
    REQUIRE(k.sim.moraleCrisis().response == 0);
    REQUIRE(k.sim.moraleCrisis().scheduledTurn == 0);

    World low;
    moraleColony(low);
    low.colony.morale = 150;
    low.sim.runTurns(1);
    REQUIRE(low.sim.moraleCrisis().scheduledTurn >= 30);
    REQUIRE(low.sim.moraleCrisis().scheduledTurn <= 38);
}

// ── Construction and the colony network (SCConstruct, SCProdSched) ───────

TEST_CASE("SCConstruct pays the build needs every turn and counts down", "[sim][construct]") {
    World w;
    w.utilities();
    auto& dome = w.place(27, Building::kConstructing);   // AgriDome: 5 turns
    REQUIRE(dome.buildTurnsLeft() == 5);
    Tile& stock = w.depot();
    for (int r : {res::MetalA, res::MinA, res::MinB, res::MinC}) stock.bas.set(r, 10);
    w.colony.population.cohort[20] = 10;

    w.sim.runTurns(1);                                    // no power yet: no progress
    REQUIRE(dome.buildTurnsLeft() == 5);
    REQUIRE(w.tileOf(dome).alloc.get(res::Power) == 3);   // shortfall noted
    w.sim.runTurns(4);
    REQUIRE(dome.state == Building::kConstructing);
    REQUIRE(dome.buildTurnsLeft() == 1);
    REQUIRE(stock.bas.get(res::MetalA) == 6);             // 1 per building turn
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kOperational);
    REQUIRE(stock.bas.get(res::MetalA) == 5);
    REQUIRE(w.tileOf(dome).bas.get(res::Food) == 10);     // runs in the turn it completes

    // The rebels build for nothing.
    World r;
    Colony& rebels = r.sim.createColony(kRebelPlayer);
    Tile& t = r.sim.createTile(rebels, 0, 0, 0);
    Building& b = r.sim.createBuilding(t, 27);
    b.setState(r.sim, Building::kConstructing);
    r.sim.runTurns(5);
    REQUIRE(b.state == Building::kOperational);
}

TEST_CASE("Completion hooks: Command center life, mines, colonist landers", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    auto& cmd = static_cast<CommandCenterBuilding&>(w.place(55, Building::kConstructing));
    w.sim.runTurns(3);
    REQUIRE(cmd.state == Building::kOperational);
    REQUIRE(cmd.life == 99);                               // 100, then SCPower the same turn

    World s;
    s.colony.freeResources = true;
    s.sim.setDifficulty(3);
    s.sim.mothership().hold = {{0x82, 20}};
    auto& seed = static_cast<CommandCenterBuilding&>(s.place(11, Building::kConstructing));
    for (int i = 0; i < 20 && seed.state != Building::kOperational; ++i) s.sim.runTurns(1);
    REQUIRE(seed.state == Building::kOperational);
    REQUIRE(seed.life == 59);                              // 3 per item 0x82, less this turn's

    World e;
    e.colony.freeResources = true;
    e.sim.setDifficulty(2);
    auto& seedEasy = static_cast<CommandCenterBuilding&>(e.place(11, Building::kConstructing));
    for (int i = 0; i < 20 && seedEasy.state != Building::kOperational; ++i) e.sim.runTurns(1);
    REQUIRE(seedEasy.life == 49);                          // at least 50 on Beginner/Easy

    World m;
    m.colony.freeResources = true;
    auto& mine = static_cast<MineBuilding&>(placeAt(m, 96, 0, 0, 1, Building::kConstructing));
    REQUIRE(mine.buildTurnsLeft() == 0);
    m.sim.runTurns(1);
    REQUIRE(mine.state == Building::kOperational);
    REQUIRE(mine.life == 100);
    mine.life = 1;
    m.sim.runTurns(1);                                     // its last operating turn
    REQUIRE(mine.life == 0);
    m.sim.runTurns(1);
    REQUIRE(mine.state == Building::kExhausted);

    World l;
    l.colony.freeResources = true;
    l.utilities();                                         // air, so nobody dies on landing
    l.depot().bas.set(res::Food, 1000);
    l.sim.mothership().cryoColonists = 70;
    auto& lander = l.place(62, Building::kConstructing);
    for (int i = 0; i < 20 && lander.state != Building::kOperational; ++i) l.sim.runTurns(1);
    REQUIRE(lander.state == Building::kOperational);
    REQUIRE(l.sim.mothership().cryoColonists == 20);
    REQUIRE(l.colony.populated);
    REQUIRE(l.colony.population.cohort[19] == 10);
    REQUIRE(l.colony.population.cohort[59] == 10);
}

TEST_CASE("SCProdSched: power and air travel through buildings and tubes", "[sim][network]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();                                         // (0,0) SeedPower, (1,0) SeedCommand
    auto& near = w.place(27);                              // (2,0): adjacent
    auto& far = placeAt(w, 27, 2, 5, 0);                   // not connected
    w.sim.runTurns(1);
    REQUIRE(near.state == Building::kOperational);
    REQUIRE(near.flags == (Building::kReachedByLife | Building::kReachedByPower));
    REQUIRE(far.state == Building::kSuspended);
    REQUIRE(w.tileOf(far).alloc.get(res::Power) == 1);     // "needs power"
    REQUIRE(w.tileOf(far).alloc.get(res::LifeA) == 1);     // "needs air"

    // A tube line along y (LPipe) from (2,0) down to the far dome connects it.
    for (int16_t y = 1; y <= 4; ++y) placeAt(w, 123, 2, y, 0);
    w.sim.runTurns(1);
    REQUIRE(far.state == Building::kOperational);

    // RPipe runs along x only: it does not carry along y.
    World r;
    r.colony.freeResources = true;
    r.utilities();
    placeAt(r, 124, 1, 1, 0);                              // RPipe below the SeedCommand
    auto& cut = placeAt(r, 27, 1, 2, 0);
    r.sim.runTurns(1);
    REQUIRE(cut.state == Building::kSuspended);

    // Underground: a UGCore under a connected surface building carries the
    // network down one level.
    World u;
    u.colony.freeResources = true;
    u.utilities();
    auto& core = u.place(71);                              // Core at (2,0)
    placeAt(u, 106, 2, 0, 1);                              // UGCore below it
    auto& home = placeAt(u, 79, 3, 0, 1);                  // UGResident next to the UGCore
    u.sim.runTurns(1);
    REQUIRE(core.state == Building::kOperational);
    REQUIRE(home.state == Building::kOperational);
}

TEST_CASE("SCProdSched: running costs, Beginner, upgrade discounts, luxury", "[sim][network]") {
    // Running costs are paid every turn from the colony's stock.
    World w;
    w.utilities();
    auto& dome = w.place(27);
    Tile& stock = w.depot();
    for (int r : {res::MinA, res::MinB, res::MinC}) stock.bas.set(r, 3);
    w.colony.population.cohort[20] = 10;
    w.sim.runTurns(4);                                     // turn 1 has no power yet
    REQUIRE(stock.bas.get(res::MinA) == 0);
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kSuspended);

    // MPG covers a missing material.
    stock.bas.set(res::MPG, 10);
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kOperational);
    REQUIRE(stock.bas.get(res::MPG) == 7);                 // MinA, MinB, MinC

    // On Beginner only Power and People are needed.
    World b;
    b.sim.setDifficulty(1);
    b.utilities();
    auto& easy = b.place(27);
    b.colony.population.cohort[20] = 10;
    b.sim.runTurns(2);
    REQUIRE(easy.state == Building::kOperational);
    REQUIRE(b.colony.nanotech);

    // Level-2 buildings pay nothing every 10th turn.
    World d;
    d.utilities();
    auto& dome2 = d.place(28);                             // AgriDome2 (group 50)
    Tile& s2 = d.depot();
    for (int r : {res::MinA, res::MinB, res::MinC}) s2.bas.set(r, 5);
    dome2.payNeeds(d.sim);                                 // turn 0
    REQUIRE(s2.bas.get(res::MinA) == 5);
    d.sim.runTurns(1);
    const int32_t before = s2.bas.get(res::MinA);
    dome2.payNeeds(d.sim);                                 // turn 1
    REQUIRE(s2.bas.get(res::MinA) == before - 1);

    // Commercial buildings need Luxury from a warehouse (product B items).
    // The warehouse must come first in tile order: buildings resume in that
    // order, and a suspended warehouse's stock does not count (quirk). By
    // priority it does (warehouse 9, commercial 24), once the list has been
    // re-sorted: the depot tile added last does that.
    World c;
    c.utilities();
    auto& wh = static_cast<WarehouseBuilding&>(c.place(58));
    auto& shop = c.place(87);                              // UGCommercial
    c.depot();
    c.colony.population.cohort[20] = 20;
    c.sim.runTurns(2);
    REQUIRE(shop.state == Building::kSuspended);
    REQUIRE(c.tileOf(shop).alloc.get(res::Luxury) == 1);
    wh.items.push_back({0, 3, 2, 6});                      // two units of product B 3
    c.sim.runTurns(1);
    REQUIRE(shop.state == Building::kOperational);
    REQUIRE(wh.luxury() == 1);
    REQUIRE(wh.items.front().units == 3);

    // The tile added last got its key after the last sort, so it keeps the
    // empty slot it took at the front of the list: this shop resumes before
    // the warehouse and never sees the stock.
    World late;
    late.utilities();
    auto& lateWh = static_cast<WarehouseBuilding&>(late.place(58));
    auto& lateShop = late.place(87);
    REQUIRE(late.colony.tiles.order().front() == late.tileOf(lateShop).self);
    late.colony.population.cohort[20] = 20;
    lateWh.items.push_back({0, 3, 9, 27});
    late.sim.runTurns(3);
    REQUIRE(lateWh.state == Building::kOperational);
    REQUIRE(lateShop.state == Building::kSuspended);

    // Kind 15 counts as luxury but is never handed out (quirk).
    wh.items = {{0, 15, 5, 5}};
    REQUIRE(wh.luxury() == 5);
    wh.take(0, 2);
    REQUIRE(wh.luxury() == 5);
}

// ── Research (SCRchSched s6:AB68, labs s7:C7B0, player s7:23E2) ──────────

TEST_CASE("Player research state starts like the original", "[sim][research]") {
    Player p;
    REQUIRE(p.remaining[10] == -1);                       // not started
    REQUIRE(p.minTurns[10] == 25);
    REQUIRE(p.progress(10) == -1);
    for (int t : {0, 2, 3, 8, 26, 32, 45, 58, 92, 106, 112, 114, 115, 119, 121}) {
        REQUIRE(p.researchDone(t));
        REQUIRE(p.minTurns[static_cast<size_t>(t)] == 0);
    }
    REQUIRE_FALSE(p.addPriority(1));                      // Basic Research cannot be a priority
    REQUIRE(p.addPriority(10));
    REQUIRE(p.priorityIndex(10) == 0);
}

TEST_CASE("Research points follow colony 1's morale", "[sim][research]") {
    World w;                                              // turn 0
    auto pts = [&](int16_t m) { w.colony.morale = m; return researchPoints(w.sim); };
    REQUIRE(pts(100) == 0);                               // <250: odd turns only
    REQUIRE(pts(300) == 0);                               // <450: not on every third turn
    REQUIRE(pts(500) == 1);
    REQUIRE(pts(600) == 2);                               // <750: 2 every third turn
    REQUIRE(pts(800) == 2);
    w.sim.runTurns(1);                                    // turn 1
    REQUIRE(pts(100) == 1);
    REQUIRE(pts(300) == 1);
    REQUIRE(pts(600) == 1);
}

TEST_CASE("A lab researches a topic: points, minimum turns, completion", "[sim][research]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& lab = static_cast<LabBuilding&>(w.place(93));  // UGLab: main tree
    lab.topic = 10;                                       // Pharmacology, 25 points
    REQUIRE(gameData().research.find(10)->cost == 25);

    // 1 point a turn, 2 on every third: 25 points after 19 turns, but the
    // topic waits at 1 point until it has had 25 turns of work.
    w.sim.runTurns(19);
    REQUIRE(w.player.remaining[10] == 1);
    REQUIRE(w.player.minTurns[10] == 6);
    w.sim.runTurns(5);
    REQUIRE_FALSE(w.player.researchDone(10));
    REQUIRE(w.player.minTurns[10] == 1);
    w.sim.runTurns(1);
    REQUIRE(w.player.researchDone(10));
    REQUIRE(lab.topic == 112);                            // the lab goes idle
    REQUIRE(w.player.discoveries[45] == 1);               // Pharmacology's discovery
    // Medical research: every death chance -1.
    REQUIRE(w.colony.population.deathChance == std::array<int16_t, 6>{0, 49, 9, 9, 9, 74});
    w.sim.runTurns(1);
    REQUIRE(lab.state == Building::kSuspended);           // idle labs are suspended

    // Hot labs research the advanced tree, and twice per turn: SCFactory
    // runs them as well as SCRchSched (quirk).
    World h;
    h.colony.freeResources = true;
    h.utilities();
    auto& hot = static_cast<LabBuilding&>(h.place(40));
    hot.topic = 116;                                      // Genetics
    const auto cost = static_cast<int16_t>(gameData().research.find(116)->cost);
    REQUIRE(gameData().research.find(116)->advanced);
    h.sim.runTurns(1);                                    // turn 0: 2 points, twice
    REQUIRE(h.player.remaining[116] == cost - 4);
    REQUIRE(h.player.minTurns[116] == 24);                // counted once per turn
}

TEST_CASE("Basic Research repeats and cuts the other topics", "[sim][research]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& lab = static_cast<LabBuilding&>(w.place(93));
    lab.topic = 1;
    w.player.remaining[1] = 1;
    w.player.minTurns[1] = 0;
    w.player.remaining[12] = 200;                         // a started topic
    w.player.minTurns[12] = 25;
    w.player.remaining[5] = 20;                           // 25 turns still to go: shown as 25
    w.sim.runTurns(1);
    REQUIRE(lab.topic == 1);                              // still on Basic Research
    REQUIRE(w.player.remaining[1] == 100);                // restarted
    REQUIRE(w.player.remaining[12] == 195);               // -5
    REQUIRE(w.player.remaining[5] == 20);                 // at 25 or below: untouched
    REQUIRE(w.player.discoveries[1] == 0);                // discovery 1 is not counted
}

TEST_CASE("Research effects and discoveries", "[sim][research]") {
    World w;
    applyResearch(w.sim, w.player, 18);                   // Embryology
    REQUIRE(w.colony.population.deathChance[1] == 25);
    applyResearch(w.sim, w.player, 18);
    REQUIRE(w.colony.population.deathChance[1] == 1);     // not below 1
    applyResearch(w.sim, w.player, 107);                  // Drama
    REQUIRE(w.colony.morale == 625);
    REQUIRE(w.colony.prevMorale == 600);

    // Some discoveries need a whole group of topics.
    grantDiscoveries(w.sim, 25);
    REQUIRE(w.player.discoveries[17] == 0);
    for (int t : {23, 24, 25}) { w.player.remaining[static_cast<size_t>(t)] = 0; w.player.minTurns[static_cast<size_t>(t)] = 0; }
    grantDiscoveries(w.sim, 25);
    REQUIRE(w.player.discoveries[17] == 1);
    REQUIRE(w.player.discoveries[16] == 0);               // also needs 129, 33, 12 and 117
    grantDiscoveries(w.sim, 62);
    REQUIRE(w.player.discoveries[38] == 1);
    REQUIRE(w.player.discoveries[39] == 1);
    REQUIRE(w.player.discoveries[40] == 1);

    // With Multiple AI (discovery 30) priority topics get a point more.
    World a;
    a.colony.freeResources = true;
    a.utilities();
    auto& lab = static_cast<LabBuilding&>(a.place(93));
    lab.topic = 5;
    a.player.discoveries[30] = 1;
    REQUIRE(a.player.addPriority(5));
    a.sim.runTurns(1);                                    // turn 0: 2 + 1
    REQUIRE(a.player.remaining[5] == 25 - 3);
}

TEST_CASE("topicGrants lists the switch's discoveries", "[sim][research]") {
    auto has = [](const std::vector<TopicGrant>& g, uint16_t d) {
        return std::any_of(g.begin(), g.end(), [d](const TopicGrant& x) { return x.discovery == d; });
    };
    const auto medicine = topicGrants(9);
    REQUIRE(medicine.size() == 2);
    REQUIRE((medicine[0].discovery == 6 && medicine[0].needs.empty()));
    REQUIRE((medicine[1].discovery == 56 && medicine[1].needs.empty()));
    const auto marine = topicGrants(25);
    REQUIRE(has(marine, 16));
    REQUIRE(has(marine, 17));
    for (const auto& g : marine)
        if (g.discovery == 17) REQUIRE(g.needs == std::vector<uint16_t>{23, 24, 25});
    const auto managers = topicGrants(47);
    REQUIRE(managers.size() == 1);
    REQUIRE(managers[0].needs == std::vector<uint16_t>{47, 54});
    REQUIRE(topicGrants(20).empty());                     // Entomology: nothing
}

TEST_CASE("The research tree opens a topic once it is done, with s3:9488's and s2:EEAC's extras",
          "[sim][research]") {
    World w;
    Player& p = w.player;
    auto finish = [&p](int t) {
        p.remaining[static_cast<size_t>(t)] = 0;
        p.minTurns[static_cast<size_t>(t)] = 0;
    };
    REQUIRE(topicOpens(p, 2));                            // Applied Research: a root
    REQUIRE_FALSE(topicOpens(p, 9));                      // Medicine not done
    finish(9);
    REQUIRE(topicOpens(p, 9));
    REQUIRE(topicOpens(p, 115));                          // the hot Biology waits for Medicine
    REQUIRE_FALSE(topicOpens(p, 119));                    // the hot Computer Science for AI
    finish(46);
    REQUIRE(topicOpens(p, 119));
    finish(50);
    REQUIRE_FALSE(topicOpens(p, 50));                     // Robotics 1 also needs Robotics 2
    finish(77);
    REQUIRE(topicOpens(p, 50));
    finish(63);
    REQUIRE_FALSE(topicOpens(p, 63));                     // Satellites and Probes: Optics too
    finish(78);
    REQUIRE(topicOpens(p, 63));
    finish(124);
    finish(125);
    REQUIRE_FALSE(topicOpens(p, 125));                    // Replicator: Nanotechnology 1 too
    finish(120);
    REQUIRE(topicOpens(p, 125));
    REQUIRE(topicOpensNeeds(121) == std::vector<uint16_t>{91});
}

TEST_CASE("topicGrants dump", "[.dump]") {
    for (uint16_t t = 0; t <= 130; ++t) {
        std::printf("%u:", unsigned(t));
        for (const auto& g : topicGrants(t)) std::printf(" %u", unsigned(g.discovery));
        std::printf("\n");
    }
}

// ── Events (SCEvent s6:74E4) ─────────────────────────────────────────────

TEST_CASE("Incidents wreck the building and its neighbours", "[sim][event]") {
    World w;
    w.colony.freeResources = true;
    auto& lab = placeAt(w, 40, 5, 5, 0);                  // HotLab
    auto& next = placeAt(w, 27, 6, 5, 0);                 // AgriDome beside it
    auto& diag = placeAt(w, 27, 4, 4, 0);                 // and diagonally
    auto& rock = placeAt(w, 2, 5, 6, 0);                  // terrain: spared
    auto& robot = placeAt(w, 115, 5, 4, 0);               // RoboDoze: spared
    auto& far = placeAt(w, 27, 8, 5, 0);                  // two tiles away
    w.tileOf(lab).bas.set(res::Power, 7);
    w.sim.enqueue(makeIncidentStep(w.colony.self, lab.self, true));
    w.sim.runTurns(1);
    REQUIRE(lab.state == Building::kWrecked);
    REQUIRE(lab.needs() == nullptr);
    REQUIRE(w.tileOf(lab).bas.empty());
    REQUIRE(next.state == Building::kWrecked);
    REQUIRE(diag.state == Building::kWrecked);
    REQUIRE(rock.state != Building::kWrecked);
    REQUIRE(robot.state != Building::kWrecked);
    REQUIRE(far.state != Building::kWrecked);
    const auto& n = w.sim.notices();
    REQUIRE(std::any_of(n.begin(), n.end(), [](const Notice& x) { return x.channel == 0x37 && x.code == 0x1D; }));

    // A DIRT facility protects buildings within the given distance.
    World d;
    d.colony.freeResources = true;
    d.utilities();
    auto& dirt = d.place(47);                             // (2,0)
    auto& nano = placeAt(d, 44, 6, 0, 0);
    d.sim.runTurns(1);
    REQUIRE(dirt.state == Building::kOperational);
    REQUIRE(dirtProtects(d.sim, nano, 4));
    REQUIRE_FALSE(dirtProtects(d.sim, nano, 3));
}

TEST_CASE("The plague", "[sim][event]") {
    World w;
    w.colony.population.cohort[30] = 100;
    startPlague(w.sim, w.colony);
    REQUIRE(w.colony.plagueTurns == 20);
    startPlague(w.sim, w.colony);                         // already infected: nothing new
    REQUIRE(w.colony.plagueTurns == 20);

    plagueTick(w.sim, w.colony);                          // no medicine: 100 / 20 die
    REQUIRE(w.colony.population.total() == 95);
    REQUIRE(w.colony.plagueTurns == 19);

    // Medicine (warehouse items of kind 15) treats 5 people a unit.
    auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
    wh.items = {{0, 15, 30, 30}};
    plagueTick(w.sim, w.colony);                          // 95 sick: 19 units cure them all
    REQUIRE(w.colony.plagueTreated == 95);
    REQUIRE(wh.items.front().quantity == 11);
    REQUIRE(w.colony.population.total() == 95);
    plagueTick(w.sim, w.colony);                          // nobody untreated: only the count drops
    REQUIRE(w.colony.plagueTurns == 17);

    // Treating more people than there are still kills one (quirk).
    World q;
    q.colony.population.cohort[30] = 7;
    startPlague(q.sim, q.colony);
    auto& qw = static_cast<WarehouseBuilding&>(q.place(58));
    qw.items = {{0, 15, 5, 5}};
    plagueTick(q.sim, q.colony);                          // need (7+3)/5 = 2 units -> 10 treated
    REQUIRE(q.colony.plagueTreated == 10);
    REQUIRE(q.colony.population.total() == 6);

    // A UG Medical Center makes it last 40 turns (fewer deaths per tick).
    World m;
    m.place(104, Building::kConstructing);                // any state counts
    startPlague(m.sim, m.colony);
    REQUIRE(m.colony.plagueTurns == 40);
}

TEST_CASE("The calendar: turn 5, 61 and 150", "[sim][event]") {
    World w;
    w.sim.setDifficulty(3);
    Colony& rebels = w.sim.createColony(kRebelPlayer);
    Colony& mine = w.colony;
    mine.population.reset(3);                             // harsh tables from the start
    auto& seed = w.place(10);                             // Seed (group 37)
    auto& lander = w.place(62);                           // ColonistLander
    w.sim.runTurns(6);
    REQUIRE(rebels.name == "Rebel");
    REQUIRE(mine.population.deathChance[1] == 100);
    w.sim.runTurns(56);                                   // through turn 61
    REQUIRE(mine.population.deathChance == std::array<int16_t, 6>{0, 50, 10, 10, 10, 75});
    REQUIRE(seed.state != Building::kWrecked);
    w.sim.runTurns(89);                                   // through turn 150
    REQUIRE(seed.state == Building::kWrecked);
    REQUIRE(lander.state == Building::kWrecked);
}

TEST_CASE("Scheduled disasters and the morale crisis trigger", "[sim][event]") {
    World w;
    w.sim.setDifficulty(3);
    auto& sched = w.sim.disasterSchedule();
    sched[1] = 2;                                         // earthquake-type message at turn 2
    sched[7] = 4;
    w.sim.moraleCrisis().scheduledTurn = 3;
    w.sim.runTurns(5);
    const auto& n = w.sim.notices();
    REQUIRE(std::any_of(n.begin(), n.end(), [](const Notice& x) { return x.channel == 0x37 && x.code == 0x16; }));
    REQUIRE(std::any_of(n.begin(), n.end(), [](const Notice& x) { return x.channel == 0x111 && x.code == 0x106; }));
    REQUIRE(w.sim.moraleCrisis().scheduledTurn == 0);
    REQUIRE(sched[7] >= 114);                             // rescheduled 110..130 turns on
    REQUIRE(sched[7] <= 134);
    REQUIRE(sched[1] == 2);                               // one-off

    // Below Medium the schedule is ignored.
    World e;
    e.sim.setDifficulty(2);
    e.sim.disasterSchedule()[1] = 1;
    e.sim.runTurns(2);
    const auto& en = e.sim.notices();
    REQUIRE_FALSE(std::any_of(en.begin(), en.end(), [](const Notice& x) { return x.channel == 0x37 && x.code == 0x16; }));
}

namespace {

// Runs one step on its own (outside a turn).
void runAlone(Simulation& sim, std::unique_ptr<Step> step) {
    StepQueue q;
    q.enqueue(sim, std::move(step));
    q.runAll(sim);
}

bool posted(const Simulation& sim, uint16_t channel, uint16_t code) {
    for (const Notice& n : sim.notices())
        if (n.channel == channel && n.code == code) return true;
    return false;
}

size_t countPosted(const Simulation& sim, uint16_t channel, uint16_t code) {
    size_t n = 0;
    for (const Notice& x : sim.notices())
        if (x.channel == channel && x.code == code) ++n;
    return n;
}

} // namespace

TEST_CASE("SCEndSim: everyone dead, the game lost", "[sim][endsim]") {
    World w;
    w.colony.populated = true;                 // populated but nobody left
    runAlone(w.sim, makeEndSimStep());
    REQUIRE(posted(w.sim, 0x37, 6));
    REQUIRE_FALSE(w.sim.gameLost());

    w.colony.population.cohort[30] = 1;        // someone alive: no message
    w.sim.clearNotices();
    runAlone(w.sim, makeEndSimStep());
    REQUIRE_FALSE(posted(w.sim, 0x37, 6));

    // Colony 1 handed to the rebels: player 1 has no colony left.
    w.colony.player = kRebelPlayer;
    w.colony.population.cohort[30] = 0;
    runAlone(w.sim, makeEndSimStep());
    REQUIRE(w.sim.gameLost());
    for (int id : {1, 2, 3, 4, 5, 7, 8, 10}) REQUIRE(w.sim.alertDisabled(static_cast<uint16_t>(id)));
    REQUIRE(w.sim.alertOn(9));                         // untouched, on from the start (DGROUP 0xE28)
    REQUIRE_FALSE(posted(w.sim, 0x37, 6));     // rebel colonies do not count
}

TEST_CASE("SCEndSim: victory needs seven topics, a Mass Driver and a SpacePort", "[sim][endsim]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    w.place(17);                                         // Mass Driver in colony 1
    Colony& second = w.sim.createColony(w.player.self);
    Building& port = w.sim.createBuilding(w.sim.createTile(second, 0, 0, 0), 15);   // SpacePort
    port.setState(w.sim, Building::kOperational);
    w.sim.createColony(w.player.self);                   // a third, empty colony

    for (int topic : {4, 42, 75, 84, 44, 60, 61}) {
        w.player.remaining[static_cast<size_t>(topic)] = 0;
        w.player.minTurns[static_cast<size_t>(topic)] = 0;
    }
    runAlone(w.sim, makeEndSimStep());
    // Both found in colony 2; the loop goes on and posts again for colony 3.
    REQUIRE(countPosted(w.sim, 0x37, 0x14) == 2);

    w.sim.clearNotices();
    w.player.minTurns[61] = 1;                           // turns still needed
    runAlone(w.sim, makeEndSimStep());
    REQUIRE_FALSE(posted(w.sim, 0x37, 0x14));
}

TEST_CASE("SCEndSim: the trade market swing", "[sim][endsim][trade]") {
    SECTION("Easy: up, then back to 0 on a turn divisible by 5") {
        World w;
        w.sim.setDifficulty(2);
        std::vector<int32_t> swing;
        for (int i = 0; i < 7; ++i) {
            w.sim.runTurns(1);
            swing.push_back(w.sim.tradeMarket().swing);
        }
        REQUIRE(swing == std::vector<int32_t>{10, 20, 30, 30, 30, 0, 10});
        REQUIRE(w.sim.tradeMarket().value13C >= 8);
        REQUIRE(w.sim.tradeMarket().value13C <= 12);
    }
    SECTION("Hard: down") {
        World w;
        w.sim.setDifficulty(4);
        w.sim.runTurns(3);
        REQUIRE(w.sim.tradeMarket().swing == -30);
    }
    SECTION("Created on first use, drawing random(8, 12)") {
        World w;
        REQUIRE_FALSE(w.sim.tradeMarketCreated());
        MsvcRand expect = w.sim.rand();
        runAlone(w.sim, makeEndSimStep());           // difficulty 0: no swing draw
        REQUIRE(w.sim.tradeMarketCreated());
        expect.rand();
        REQUIRE(w.sim.rand().state() == expect.state());
    }
}

TEST_CASE("SCEndSim: trade agreements are aged, the answer is dropped", "[sim][endsim][trade]") {
    World w;
    w.sim.runTurns(1);                               // turn 1, market created
    auto& deals = w.sim.tradeAgreements();
    deals.push_back({2, 0, 0});
    deals.push_back({3, 0, 0});
    deals.push_back({1, 0, 0});                      // not tested
    MsvcRand expect = w.sim.rand();
    runAlone(w.sim, makeEndSimStep());               // difficulty 0: limit 0, age 1
    expect.rand();
    expect.rand();
    REQUIRE(w.sim.rand().state() == expect.state());
    REQUIRE(deals.size() == 3);
    REQUIRE(deals[0].state == 2);

    // Beginner: the limit is 30 turns, so nothing is drawn (and the swing
    // goes up from 0 without a draw).
    w.sim.setDifficulty(1);
    const MsvcRand none = w.sim.rand();
    runAlone(w.sim, makeEndSimStep());
    REQUIRE(w.sim.rand().state() == none.state());
    REQUIRE(w.sim.tradeMarket().swing == 10);
}

TEST_CASE("SCEndSim: the RoboCmd table", "[sim][endsim]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    Building& cmd = w.place(56);
    w.place(57, Building::kConstructing);
    runAlone(w.sim, makeEndSimStep());
    REQUIRE(w.colony.roboCommands == std::vector<Handle>{cmd.tile(w.sim)->self});
}

TEST_CASE("Units on tiles: robots, trucks, explorers", "[sim][units]") {
    World w;
    Tile& t = w.depot();
    addUnits(w.sim, t, 3, product::Truck);
    REQUIRE(t.trucks == 3);
    REQUIRE(countUnits(w.sim, t, product::Truck) == 3);
    addUnits(w.sim, t, 1, product::Dozer);
    removeUnits(w.sim, t, 2, product::Truck);
    REQUIRE(countUnits(w.sim, t, product::Truck) == 1);
    REQUIRE(t.trucks == 3);                       // not lowered (quirk)
    REQUIRE(t.linked.size() == 4);                // two empty slots
    addUnits(w.sim, t, 1, product::Miner);        // reuses the first empty slot
    REQUIRE(t.linked.size() == 4);

    colonySumTileLedgers(w.sim, w.colony);
    REQUIRE(w.colony.linkedCount[product::Truck] == 1);
    REQUIRE(w.colony.linkedCount[product::Dozer] == 1);
    REQUIRE(w.colony.linkedCount[product::Miner] == 1);
    REQUIRE(availableUnits(w.colony, product::Miner) == 1);
    w.colony.linkedBusy[product::Miner] = 1;
    REQUIRE(availableUnits(w.colony, product::Miner) == 0);

    clearUnits(w.sim, t);
    REQUIRE(t.linked.empty());
    REQUIRE(w.sim.db().all(ObjType::Unit).empty());

    addExplorers(w.colony, 12);
    REQUIRE(w.colony.explorers == 10);            // at most 10
    loseExplorer(w.colony);
    REQUIRE(w.colony.explorers == 9);
    w.colony.explorers = 0;
    loseExplorer(w.colony);
    REQUIRE(w.colony.explorers == 0);
}

TEST_CASE("RoboCmd: kits from warehouses, robots for 200 turns", "[sim][robots]") {
    World w;
    w.sim.runTurns(1);                            // turn 1 (an expiry of 0 means a free slot)
    w.colony.freeResources = true;
    w.utilities();
    auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
    auto& cmd = static_cast<RoboCmdBuilding&>(w.place(56));
    Tile& here = w.tileOf(cmd);
    wh.items.push_back({product::Truck, 0, 2, 12});
    wh.items.push_back({product::Digger, 0, 1, 3});
    wh.items.push_back({product::Explorer, 0, 1, 3});

    // One round of the cycle 1, 2, 3, 4, 12, 8, 9, 11, 5: one kit of each.
    runAlone(w.sim, makeMoveStep());
    REQUIRE(cmd.freeSlots() == 7);
    REQUIRE(cmd.wanted == 2);
    REQUIRE(countUnits(w.sim, here, product::Digger) == 1);
    REQUIRE(countUnits(w.sim, here, product::Truck) == 1);
    REQUIRE(w.colony.explorers == 1);
    REQUIRE(wh.quantityOfA(product::Truck) == 1);
    REQUIRE(wh.storedUnits() == 6);
    REQUIRE(cmd.slots[0].item == product::Digger);
    REQUIRE(cmd.slots[0].expires == 201);
    REQUIRE(cmd.slots[0].flag == 0);
    REQUIRE(cmd.slots[2].item == product::Explorer);
    REQUIRE(cmd.slots[2].flag == 1);

    // Run out: a Repair Robot in another slot and a Fuel Cell renew the
    // first robot; the rest are lost (the repair robot too: no other one).
    cmd.receive(w.sim, product::RepairRobots);
    wh.items.push_back({product::FuelCells, 0, 1, 2});
    for (auto& s : cmd.slots)
        if (s.expires) s.expires = w.sim.turn();
    cmd.produce(w.sim);
    REQUIRE(cmd.freeSlots() == 9);
    REQUIRE(cmd.slots[0].item == product::Digger);
    REQUIRE(cmd.slots[0].expires == 201);
    REQUIRE(wh.quantityOfA(product::FuelCells) == 0);
    REQUIRE(countUnits(w.sim, here, product::Digger) == 1);
    REQUIRE(countUnits(w.sim, here, product::Truck) == 0);
    REQUIRE(countUnits(w.sim, here, product::RepairRobots) == 0);
    REQUIRE(w.colony.explorers == 0);

    // Disasters take robots back from the RoboCmds (s8:43CC).
    colonySumTileLedgers(w.sim, w.colony);
    loseRobots(w.sim, w.colony, 1, product::Digger);
    REQUIRE(cmd.freeSlots() == 10);
    REQUIRE(countUnits(w.sim, here, product::Digger) == 0);
    REQUIRE(w.colony.linkedCount[product::Digger] == 0);
}

TEST_CASE("The first RoboCmd takes the robots on the hub", "[sim][robots]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    Tile& hub = w.depot();
    w.colony.hub = hub.self;
    addUnits(w.sim, hub, 1, product::Dozer);
    addUnits(w.sim, hub, 1, product::Truck);
    addUnits(w.sim, hub, 2, product::Miner);
    addUnits(w.sim, hub, 1, product::Explorer);  // not taken
    auto& cmd = static_cast<RoboCmdBuilding&>(w.place(56));
    cmd.constructTick(w.sim);                     // operational: s7:CAC2 acts once
    Tile& here = w.tileOf(cmd);
    REQUIRE(w.sim.firstRoboCmdDone());
    REQUIRE(countUnits(w.sim, here, product::Dozer) == 1);
    REQUIRE(countUnits(w.sim, here, product::Miner) == 2);
    REQUIRE(countUnits(w.sim, here, product::Truck) == 4);   // topped up to 4
    REQUIRE(countUnits(w.sim, hub, product::Miner) == 0);
    REQUIRE(countUnits(w.sim, hub, product::Explorer) == 1);
    REQUIRE(cmd.freeSlots() == 3);

    auto& second = static_cast<RoboCmdBuilding&>(w.place(57));
    second.constructTick(w.sim);
    REQUIRE(second.freeSlots() == 10);
}

TEST_CASE("SCMove: factories unload into warehouses", "[sim][move]") {
    SECTION("whole items") {
        World w;
        w.colony.freeResources = true;
        w.utilities();
        auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
        auto& f = static_cast<FactoryBuilding&>(w.place(30));
        f.output.push_back({product::Truck, 0, 5, 30});
        f.output.push_back({0, 3, 10, 30});
        runAlone(w.sim, makeMoveStep());
        REQUIRE(f.output.empty());
        REQUIRE(wh.items.size() == 2);
        REQUIRE(wh.storedUnits() == 60);
        // Same products merge.
        f.output.push_back({product::Truck, 0, 1, 6});
        runAlone(w.sim, makeMoveStep());
        REQUIRE(wh.items.size() == 2);
        REQUIRE(wh.quantityOfA(product::Truck) == 6);
    }
    SECTION("the room is read once per warehouse (overfill)") {
        World w;
        w.colony.freeResources = true;
        w.utilities();
        auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
        auto& f = static_cast<FactoryBuilding&>(w.place(30));
        wh.items.push_back({0, 5, 30, 90});       // room 10
        f.output.push_back({product::Truck, 0, 1, 6});
        f.output.push_back({0, 3, 3, 9});
        runAlone(w.sim, makeMoveStep());
        REQUIRE(f.output.empty());
        REQUIRE(wh.storedUnits() == 105);
    }
    SECTION("a partly moved item loses the room from its units") {
        World w;
        w.colony.freeResources = true;
        w.utilities();
        auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
        auto& f = static_cast<FactoryBuilding&>(w.place(30));
        wh.items.push_back({0, 5, 30, 90});       // room 10
        f.output.push_back({product::Truck, 0, 5, 30});
        runAlone(w.sim, makeMoveStep());
        REQUIRE(wh.quantityOfA(product::Truck) == 1);   // 10 / 6 = 1 kit moved
        REQUIRE(f.output.size() == 1);
        REQUIRE(f.output[0].quantity == 4);
        REQUIRE(f.output[0].units == 20);               // 30 - 10, not 30 - 6
    }
    SECTION("a full warehouse takes nothing") {
        World w;
        w.colony.freeResources = true;
        w.utilities();
        auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
        auto& ug = static_cast<FactoryBuilding&>(w.place(91));
        wh.items.push_back({0, 5, 34, 102});
        ug.output.push_back({product::Truck, 0, 1, 6});
        runAlone(w.sim, makeMoveStep());
        REQUIRE(ug.output.size() == 1);
        REQUIRE(wh.storedUnits() == 102);
    }
}

TEST_CASE("SCMove: trucks take ore from mines to smelters", "[sim][move]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& smelter = w.place(53);
    auto& mine = static_cast<MineBuilding&>(w.place(51));
    Tile& mt = w.tileOf(mine);
    mt.bas.set(res::OreA, 30);
    mt.bas.set(res::OreC, 40);

    runAlone(w.sim, makeMoveStep());              // no trucks: nothing
    REQUIRE(w.sim.scheduledCount() == 0);

    addUnits(w.sim, mt, 1, product::Truck);       // 50 a turn
    w.sim.setAutoTrucking(false);
    runAlone(w.sim, makeMoveStep());
    REQUIRE(w.sim.scheduledCount() == 0);

    w.sim.setAutoTrucking(true);
    runAlone(w.sim, makeMoveStep());
    // From the cursor (0 in a new mine): ore 4 (30), then ore 6 (20 of 40).
    REQUIRE(mt.bas.get(res::OreA) == 0);
    REQUIRE(mt.bas.get(res::OreC) == 20);
    REQUIRE(mine.oreCursor == res::OreD);
    REQUIRE(w.sim.scheduledCount() == 1);
    REQUIRE(w.tileOf(smelter).bas.get(res::OreA) == 0);   // not there yet

    // An empty mine with a new cursor does not loop forever.
    auto& empty = static_cast<MineBuilding&>(w.place(52));
    Tile& et = w.tileOf(empty);
    et.bas.set(res::Food, 0);
    addUnits(w.sim, et, 1, product::Truck);
    mt.bas.clear();
    runAlone(w.sim, makeMoveStep());
    REQUIRE(w.sim.scheduledCount() == 1);
}

TEST_CASE("SCMoveBas delivers next turn, if the building is still there", "[sim][move]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& smelter = w.place(53);
    Tile& st = w.tileOf(smelter);
    auto load = std::make_unique<Ledger>();
    load->set(res::OreA, 30);
    load->set(res::OreC, 20);
    runAlone(w.sim, makeMoveBasStep(std::move(load), 53, st.self));
    REQUIRE(st.bas.get(res::OreA) == 30);
    REQUIRE(st.bas.get(res::OreC) == 20);

    auto other = std::make_unique<Ledger>();
    other->set(res::OreA, 5);
    runAlone(w.sim, makeMoveBasStep(std::move(other), 54, st.self));   // a Smelter2 was expected
    REQUIRE(st.bas.get(res::OreA) == 30);
}

TEST_CASE("SCMove: trucks take metals from smelters to storage", "[sim][move]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& smelter = static_cast<SmelterBuilding&>(w.place(53));
    auto& tank = w.place(60);
    Tile& tt = w.tileOf(tank);
    smelter.output.set(res::MetalA, 70);
    smelter.output.set(res::MetalB, 60);
    smelter.output.set(res::OreMinC, 50);        // not 14..28: stays
    runAlone(w.sim, makeMoveStep());             // no trucks at the tank
    REQUIRE(tt.bas.get(res::MetalA) == 0);

    addUnits(w.sim, tt, 2, product::Truck);      // 100 from each smelter
    runAlone(w.sim, makeMoveStep());
    REQUIRE(tt.bas.get(res::MetalA) == 70);
    REQUIRE(tt.bas.get(res::MetalB) == 30);
    REQUIRE(smelter.output.get(res::MetalA) == 0);
    REQUIRE(smelter.output.get(res::MetalB) == 30);
    REQUIRE(smelter.output.get(res::OreMinC) == 50);

    // The tank holds 1000 units of anything on its tile.
    tt.bas.set(res::Food, 890);                  // 100 + 890 stored: room 10
    runAlone(w.sim, makeMoveStep());
    REQUIRE(tt.bas.get(res::MetalB) == 40);
    REQUIRE(smelter.output.get(res::MetalB) == 20);
}

namespace {

class ProbeStep : public Step {
public:
    ProbeStep(std::string_view n, bool run) : m_name(n), m_run(run) {}
    std::string_view name() const override { return m_name; }
    uint16_t priority() const override { return 10000; }
    bool shouldRun(Simulation&) override { return m_run; }
    void calcMe(Simulation&) override {}

private:
    std::string_view m_name;
    bool m_run;
};

} // namespace

TEST_CASE("Scheduled steps run on their turn, in the order scheduled", "[sim][queue]") {
    World w;
    w.sim.schedule(1, std::make_unique<ProbeStep>("first", true));
    w.sim.schedule(1, std::make_unique<ProbeStep>("second", true));
    w.sim.schedule(1, std::make_unique<ProbeStep>("never", false));   // shouldRun asked now
    REQUIRE(w.sim.scheduledCount() == 2);
    w.sim.runTurns(1);                           // turn 0: not yet
    REQUIRE(std::find(w.sim.lastTurnSteps().begin(), w.sim.lastTurnSteps().end(), "first") ==
            w.sim.lastTurnSteps().end());
    w.sim.runTurns(1);                           // turn 1
    const auto& steps = w.sim.lastTurnSteps();
    auto ai = std::find(steps.begin(), steps.end(), "SCAiInput");
    REQUIRE(ai != steps.end());
    REQUIRE(*(ai + 1) == "first");
    REQUIRE(*(ai + 2) == "second");
    REQUIRE(*(ai + 3) == "SCMove");
    REQUIRE(w.sim.scheduledCount() == 0);
}

TEST_CASE("Disaster 8 takes a digger from colony 1's RoboCmd", "[sim][event][robots]") {
    World w;
    w.sim.runTurns(1);
    w.colony.freeResources = true;
    w.utilities();
    auto& cmd = static_cast<RoboCmdBuilding&>(w.place(56));
    cmd.receive(w.sim, product::Digger);
    cmd.receive(w.sim, product::Digger);
    colonySumTileLedgers(w.sim, w.colony);
    runAlone(w.sim, makeDisasterStep(8));
    REQUIRE(posted(w.sim, 0x37, 0x2D));
    REQUIRE(countUnits(w.sim, w.tileOf(cmd), product::Digger) == 1);
    REQUIRE(cmd.freeSlots() == 9);
}

TEST_CASE("Build menu: the start, and what discoveries unlock", "[sim][menu]") {
    World w;
    BuildMenu& m = w.sim.buildMenu();
    REQUIRE(m.isOffered(27));                    // AgriDome
    REQUIRE_FALSE(m.isOffered(28));
    REQUIRE_FALSE(m.isOffered(15));              // SpacePort
    REQUIRE_FALSE(m.isOffered(19));              // MShipTokamak is never offered
    REQUIRE(m.products[product::Truck] == 1);
    REQUIRE(m.products[product::RepairRobots] == 0);

    grantDiscovery(w.sim, 10);                   // AgriDome 1 -> 2
    REQUIRE_FALSE(m.isOffered(27));
    REQUIRE(m.isOffered(28));
    grantDiscovery(w.sim, 12);                   // -> 3
    REQUIRE(m.isOffered(29));
    grantDiscovery(w.sim, 12);                   // the last stays
    REQUIRE(m.isOffered(29));

    grantDiscovery(w.sim, 26);                   // Space Program
    REQUIRE(m.isOffered(15));
    grantDiscovery(w.sim, 34);                   // Repair Robots
    REQUIRE(m.products[product::RepairRobots] == 1);

    // Hot Lab Facility offers the hot lab; with Tech Level Advance it goes
    // straight to the second one.
    grantDiscovery(w.sim, 56);
    REQUIRE(m.isOffered(40));
    REQUIRE(m.field148 == 0x33);
    grantDiscovery(w.sim, 37);                   // Tech Level Advance: everything up one
    REQUIRE(m.isOffered(41));
    REQUIRE(m.isOffered(21));                    // Tokamak 2
    REQUIRE(m.isOffered(31));                    // Factory 2
    REQUIRE(m.field148 == 0x34);

    REQUIRE(w.sim.aiManagers().empty());
    grantDiscovery(w.sim, 30);                   // Multiple AI(5)
    REQUIRE(w.sim.aiManagers().size() == 5);
}

TEST_CASE("SCAiInput: AI managers build along their emphasis", "[sim][ai]") {
    World w;
    const auto& table = w.sim.data().aiEmphasis;
    REQUIRE(table[1].lengthA == 1);              // Agricultural Center
    REQUIRE(table[1].lengthB == 3);
    REQUIRE(w.sim.data().dgroupWord(table[1].offsetA) == 39);
    REQUIRE(w.sim.data().dgroupWord(table[1].offsetB + 2) == 21);
    REQUIRE(table[13].lengthB == 4);             // Bedroom Community
    REQUIRE(w.sim.data().dgroupWord(table[13].offsetB) == 14);

    w.colony.freeResources = true;
    w.utilities();                               // SeedPower (0,0), SeedCommand (1,0)
    w.sim.aiManagers().push_back({true, w.colony.self, 1, 0});
    runAlone(w.sim, makeAiInputStep());          // no "Multiple AI(5)" yet
    REQUIRE_FALSE(w.colony.aiBuilder.tile);

    // The place is north of the first tile in the colony's tile order when
    // free (findPlace). The SeedCommand, added last, is first.
    auto firstTile = [&] { return w.sim.db().get<Tile>(w.colony.tiles.order().front()); };
    w.player.discoveries[30] = 1;
    const Tile* head = firstTile();
    REQUIRE(w.sim.db().get<Building>(head->building)->type == 11);
    const int16_t hx = head->x, hy = head->y;
    runAlone(w.sim, makeAiInputStep());          // sequence B: 39, 21, 10
    const Tile* first = w.sim.db().get<Tile>(w.colony.aiBuilder.tile);
    REQUIRE(first);
    REQUIRE(first->x == hx);
    REQUIRE(first->y == hy - 1);
    const Building* dome = w.sim.db().get<Building>(first->building);
    REQUIRE(dome->type == 27);                   // the offered AgriDome
    REQUIRE(dome->state == Building::kConstructing);
    REQUIRE(w.sim.aiManagers()[0].step == 1);

    runAlone(w.sim, makeAiInputStep());          // still building: waits
    REQUIRE(w.sim.aiManagers()[0].step == 1);

    w.sim.db().get<Building>(first->building)->setState(w.sim, Building::kOperational);
    head = firstTile();                          // now the dome's tile, added last
    REQUIRE(head == first);
    runAlone(w.sim, makeAiInputStep());          // group 21: comm tower
    const Tile* second = w.sim.db().get<Tile>(w.colony.aiBuilder.tile);
    REQUIRE(w.sim.db().get<Building>(second->building)->type == 37);
    REQUIRE(second->x == first->x);
    REQUIRE(second->y == first->y - 1);
    REQUIRE(w.sim.aiManagers()[0].step == 2);

    // "No AI Problems" switches to sequence A (one entry); step 2 reads past
    // it, into B's words, then wraps.
    w.player.discoveries[31] = 1;
    w.sim.db().get<Building>(second->building)->setState(w.sim, Building::kOperational);
    const uint16_t past = w.sim.data().dgroupWord(table[1].offsetA + 4);
    runAlone(w.sim, makeAiInputStep());
    const Tile* third = w.sim.db().get<Tile>(w.colony.aiBuilder.tile);
    REQUIRE(third != second);
    REQUIRE(w.sim.data().groups.contains(past, w.sim.db().get<Building>(third->building)->type));
    REQUIRE(w.sim.aiManagers()[0].step == 0);
}

TEST_CASE("SCRoboMove: explorers reveal mine sites", "[sim][robots]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    w.sim.hiddenDeposits() = {{5, 5, 0}, {0, 0, 0}, {7, 7, 0}};
    runAlone(w.sim, makeRoboMoveStep());         // no explorers
    REQUIRE(w.sim.nextHiddenDeposit() == 0);

    w.colony.explorers = 1;                      // every 30 turns
    w.sim.runTurns(1);                           // turn 0: 0 % 30 == 0
    REQUIRE(w.sim.nextHiddenDeposit() == 1);
    Tile* site = w.sim.tileAt(w.colony.self, 5, 5, 0);
    REQUIRE(site);
    REQUIRE(w.sim.db().get<Building>(site->building)->type == 16);   // DisMine

    w.colony.explorers = 10;                     // every 12 turns
    w.sim.runTurns(11);                          // turns 1..11: none
    REQUIRE(w.sim.nextHiddenDeposit() == 1);
    w.sim.runTurns(1);                           // turn 12: (0,0) holds SeedPower
    REQUIRE(w.sim.nextHiddenDeposit() == 2);
    REQUIRE(w.sim.db().get<Building>(w.sim.tileAt(w.colony.self, 0, 0, 0)->building)->type == 13);
}

TEST_CASE("Smoke: 300 turns of a working colony", "[sim][smoke]") {
    World w;
    w.sim.setDifficulty(3);
    w.colony.freeResources = true;
    w.colony.populated = true;
    w.colony.population.addColonists(50);
    w.utilities();                                          // SeedPower, SeedCommand
    w.place(27);                                            // AgriDome
    w.place(79);                                            // UGResident (surface row, fine here)
    auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
    auto& cmd = static_cast<RoboCmdBuilding&>(w.place(56));
    auto& smelterB = static_cast<SmelterBuilding&>(w.place(53));   // Smelter
    auto& tank = w.place(60);
    w.place(30);                                            // Factory
    auto& mine = w.place(51);                               // last: mines do not conduct
    addUnits(w.sim, w.tileOf(mine), 2, product::Truck);
    addUnits(w.sim, w.tileOf(tank), 2, product::Truck);
    w.tileOf(mine).bas.set(res::OreA, 400);
    wh.items.push_back({product::Truck, 0, 3, 18});
    wh.items.push_back({product::FuelCells, 0, 5, 10});
    w.sim.hiddenDeposits() = {{20, 20, 0}, {21, 20, 0}};
    w.colony.explorers = 2;
    w.player.discoveries[30] = 1;
    grantDiscovery(w.sim, 30);
    w.sim.aiManagers()[0] = {true, w.colony.self, 13, 0};   // Bedroom Community
    w.sim.disasterSchedule()[7] = 40;
    w.sim.disasterSchedule()[8] = 60;
    w.sim.runTurns(300);
    REQUIRE(w.sim.turn() == 300);
    REQUIRE(w.sim.nextHiddenDeposit() == 2);
    // Ore went by truck to the smelter (next turn), was refined (OreA -> MetalA
    // at 2:1) and went by truck to the storage tank.
    REQUIRE(w.tileOf(mine).bas.get(res::OreA) == 0);
    REQUIRE(smelterB.output.get(res::MetalA) == 0);
    REQUIRE(w.tileOf(tank).bas.get(res::MetalA) == 200);
    // The truck kits became robots at turn 0 and ran out at turn 200 (no
    // Repair Robot), leaving the Fuel Cells unused.
    REQUIRE(cmd.freeSlots() == 10);
    REQUIRE(wh.quantityOfA(product::FuelCells) == 5);
}

TEST_CASE("The SeedCommand runs out and becomes a lifeless Command", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    w.colony.populated = true;
    w.place(13);
    auto& seed = static_cast<CommandCenterBuilding&>(w.place(11));
    seed.life = 2;
    w.sim.runTurns(2);
    REQUIRE(seed.type == 11);
    REQUIRE(seed.life == 0);
    REQUIRE(seed.providesLifeSupport());
    w.sim.runTurns(1);                                     // no life left: type 55
    REQUIRE(seed.type == 55);
    REQUIRE_FALSE(seed.providesLifeSupport());
}

TEST_CASE("TerraForm facilities bring the planet's atmosphere closer", "[sim][event]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();
    auto& tf = static_cast<TerraFormBuilding&>(w.place(45));
    auto& tf2 = static_cast<TerraFormBuilding&>(w.place(45));
    auto& t = w.sim.terraforming();
    REQUIRE(t.turnsLeft == 10000);
    w.sim.runTurns(1);                                     // systems off: nothing
    REQUIRE(t.turnsLeft == 10000);
    REQUIRE(t.atmosphere == 0);
    tf.systems[1] = 1;                                     // CFC alone does nothing
    w.sim.runTurns(1);
    REQUIRE(t.turnsLeft == 10000);
    tf.systems[0] = 1;                                     // atmospheric generation
    tf2.systems[0] = 1;
    w.sim.runTurns(1);
    REQUIRE(t.turnsLeft == 9998);                          // one per facility
    REQUIRE(t.atmosphere == 1);
    REQUIRE(t.field1A == 2);
    t.turnsLeft = 1;
    w.sim.clearNotices();
    w.sim.runTurns(1);
    REQUIRE(t.turnsLeft == 0);
    REQUIRE(t.atmosphere == 2);
    REQUIRE(t.field1A == 1);
    REQUIRE(countPosted(w.sim, 0x37, 0x21) == 2);          // both facilities report it
}

TEST_CASE("SCKillBldg removes a replaced building after the running step", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    Tile& t = w.depot();
    Building& old = w.sim.createBuilding(t, 27);
    const Handle oldHandle = old.self;
    Building& fresh = w.sim.putBuilding(t, 30);
    REQUIRE(t.building == fresh.self);
    REQUIRE(w.sim.db().get<Building>(oldHandle));          // still there until SCKillBldg runs
    w.sim.runTurns(1);
    REQUIRE_FALSE(w.sim.db().get<Building>(oldHandle));
    REQUIRE(w.sim.lastTurnSteps().front() == "SCKillBldg");   // priority 16000: before SCSetup
}

// ── Building overrides decoded in the 2026-10-12 review ──────────────────

namespace {
// Runs turns until the building is finished (or 60 turns have passed).
void finish(World& w, const Building& b) {
    for (int i = 0; i < 60 && b.state != Building::kOperational; ++i) w.sim.runTurns(1);
    REQUIRE(b.state == Building::kOperational);
}
} // namespace

TEST_CASE("Finished factories and storage tanks come with trucks", "[sim][construct]") {
    for (auto [type, trucks] : {std::pair{30, 1}, std::pair{14, 1}, std::pair{91, 2}, std::pair{60, 2}}) {
        World w;
        w.colony.freeResources = true;
        Building& b = w.place(static_cast<uint16_t>(type), Building::kConstructing);
        finish(w, b);
        REQUIRE(countUnits(w.sim, w.tileOf(b), product::Truck) == trucks);   // s6:0550 / s6:5570 / s6:45B0
    }
}

TEST_CASE("SeedSmelter is full at 250, the Smelter later", "[sim][smelter]") {
    World w;
    auto& seed = static_cast<SmelterBuilding&>(w.place(12));
    auto& smelter = static_cast<SmelterBuilding&>(w.place(53));
    int32_t stored = 0;
    seed.output.set(res::MetalA, 249);
    REQUIRE_FALSE(seed.isFull(w.sim, stored));
    seed.output.set(res::MetalB, 1);
    REQUIRE(seed.isFull(w.sim, stored));                   // s6:36BC
    smelter.output.set(res::MetalA, 250);
    REQUIRE_FALSE(smelter.isFull(w.sim, stored));          // s6:3C60: ~500
}

TEST_CASE("Roads need Road Materials from a warehouse to build", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    auto& wh = static_cast<WarehouseBuilding&>(w.place(58));
    Building& road = w.place(76, Building::kConstructing);
    const int16_t left = road.buildTurnsLeft();
    w.sim.runTurns(2);
    REQUIRE(road.state == Building::kConstructing);
    REQUIRE(road.buildTurnsLeft() == left);                // no materials, no progress (s7:DACE)
    wh.items.push_back({product::RoadMaterials, 0, 50, 50});
    finish(w, road);
    REQUIRE(wh.quantityOfA(product::RoadMaterials) == 50 - left);   // one per turn built (s7:DA22)
}

TEST_CASE("Placement: slot 8 and slot 6 per class", "[sim][construct]") {
    World w;
    Tile& t = w.depot();
    w.sim.putBuilding(t, 20);                              // Tokamak: group 41, the base reserve
    REQUIRE(t.mark14 == 5);
    REQUIRE(w.colony.alloc[res::MetalA] == w.sim.data().bldgBld[20].need[res::MetalA]);
    REQUIRE(w.colony.alloc[res::MetalA] > 0);

    World u;
    Tile& ug = u.sim.createTile(u.colony, 0, 0, 1);
    u.sim.putBuilding(ug, 98);                             // UGTokamak reserves nothing (s6:4DB2)
    REQUIRE(ug.mark14 == 6);
    REQUIRE(u.colony.alloc[res::MetalA] == 0);

    World g;
    Tile& rough = g.depot();
    Building& terrain = g.sim.putBuilding(rough, 1);       // terrain goes to state 0 (s6:48FA)
    REQUIRE(terrain.state == 0);
    REQUIRE(terrain.needs() == nullptr);
    REQUIRE(rough.mark14 == 0);

    World l;
    l.sim.mothership().deployable = {{62, 2}, {65, 1}};
    Tile& pad = l.depot();
    l.sim.putBuilding(pad, 62);                            // s5:CE32
    REQUIRE(pad.mark14 == 1);
    REQUIRE(l.sim.mothership().deployableCount(62) == 1);
    REQUIRE(countPosted(l.sim, 0x37, 9) == 1);
    l.sim.putBuilding(l.depot(), 62);
    l.sim.putBuilding(l.depot(), 65);                      // s5:CA36
    REQUIRE(l.sim.mothership().deployable.empty());
    REQUIRE(l.sim.mothership().deployableEmptied);         // s3:988C
}

TEST_CASE("A cargo lander unloads the mothership's hold", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    w.sim.setDifficulty(4);
    w.sim.mothership().hold = {{18, 4}, {129, 100}, {0x80, 2}};
    Building& lander = w.place(65, Building::kConstructing);
    finish(w, lander);
    const Mothership& ship = w.sim.mothership();
    REQUIRE(ship.deployableCount(18) == 1);                // 3/4 lost on Hard
    REQUIRE(ship.holdCount(18) == 0);
    REQUIRE(ship.holdCount(0x80) == 2);                    // not cargo for a lander
    REQUIRE(w.tileOf(lander).bas.get(res::Food) == 25);

    World e;
    e.colony.freeResources = true;
    e.sim.setDifficulty(1);                                // Beginner counts as Easy
    e.sim.mothership().hold = {{19, 4}, {129, 100}};
    Building& l2 = e.place(65, Building::kConstructing);
    finish(e, l2);
    REQUIRE(e.sim.mothership().deployableCount(19) == 4);
    REQUIRE(e.tileOf(l2).bas.get(res::Food) == 75);
}

TEST_CASE("The Seed lands: starting stock on the hub, alert 5 on", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    Tile& hub = w.depot();
    w.colony.hub = hub.self;
    REQUIRE_FALSE(w.sim.alertOn(5));                       // off in DGROUP 0xE28
    Building& seed = w.place(10, Building::kConstructing);
    finish(w, seed);
    for (uint16_t k : {product::Dozer, product::Digger, product::Miner, product::Explorer})
        REQUIRE(countUnits(w.sim, hub, k) == 1);
    REQUIRE(countUnits(w.sim, hub, product::Truck) == 0);  // automatic trucking is on
    REQUIRE(hub.bas.get(res::MetalD) == 200);
    REQUIRE(hub.bas.get(res::FusionC) == 20);
    REQUIRE(w.sim.alertOn(5));

    World m;
    m.colony.freeResources = true;
    m.sim.setAutoTrucking(false);
    Tile& h2 = m.depot();
    m.colony.hub = h2.self;
    finish(m, m.place(10, Building::kConstructing));
    REQUIRE(countUnits(m.sim, h2, product::Truck) == 4);
}

TEST_CASE("UGUniv, SpacePort and Destroyed completion hooks", "[sim][construct]") {
    World w;
    w.colony.freeResources = true;
    auto& univ = static_cast<UGUnivBuilding&>(w.place(84, Building::kConstructing));
    finish(w, univ);
    REQUIRE(univ.counter20 == 100);                        // s6:5F30

    World s;
    s.colony.freeResources = true;
    finish(s, s.place(15, Building::kConstructing));
    REQUIRE(countPosted(s.sim, 0x2B, 0x0E) == 1);          // s6:4194

    World d;
    d.colony.freeResources = true;
    Building& ruin = d.place(72, Building::kConstructing);
    REQUIRE(ruin.needs() == nullptr);                      // empty onStateEntered (s5:D8C2)
    d.sim.runTurns(5);
    REQUIRE(ruin.state == Building::kConstructing);        // empty construction tick (s5:D8BE)
}

TEST_CASE("The runtime's qsort, port of s1:4AEA", "[sim][order]") {
    struct E { int key; char tag; };
    auto cmp = [](const E& a, const E& b) { return a.key - b.key; };
    // Traced by hand through the listing: equal keys can swap.
    std::vector<E> v{{2, 'a'}, {2, 'b'}, {1, 'c'}};
    msvcQsort(v.data(), v.size(), cmp);
    REQUIRE(v[0].tag == 'c');
    REQUIRE(v[1].tag == 'b');
    REQUIRE(v[2].tag == 'a');
    // An already sorted array is left exactly as it is.
    std::vector<E> s{{1, 'x'}, {1, 'y'}, {2, 'z'}};
    msvcQsort(s.data(), s.size(), cmp);
    REQUIRE(std::string{s[0].tag, s[1].tag, s[2].tag} == "xyz");
    // It sorts.
    MsvcRand r;
    for (size_t n : {2u, 5u, 17u, 200u, 301u}) {
        std::vector<E> a(n);
        for (auto& e : a) e = {r.rand() % 7, 0};
        msvcQsort(a.data(), a.size(), cmp);
        REQUIRE(std::is_sorted(a.begin(), a.end(), [](const E& x, const E& y) { return x.key < y.key; }));
    }
}

TEST_CASE("The colony's tile list: keys, stale keys, growth", "[sim][order]") {
    TileList list;
    const Handle a = Handle::make(ObjType::Tile, 1), b = Handle::make(ObjType::Tile, 2),
                 c = Handle::make(ObjType::Tile, 3);
    list.add(a, 9);
    list.add(b, 2);
    REQUIRE(list.entries().size() == 200);         // initial capacity, empty slots sort first
    REQUIRE(list.order() == std::vector<Handle>{b, a});
    // A new tile goes in with key 0 and gets its building's key afterwards:
    // that does not re-sort, so it stays ahead until the next add.
    list.add(c, 0);
    list.setKey(c, 30);
    REQUIRE(list.order().front() == c);
    list.add(Handle::make(ObjType::Tile, 4), 1);
    const auto order = list.order();
    REQUIRE(order.back() == c);
    // No duplicate check in the list itself.
    list.add(a, 9);
    const auto withDup = list.order();
    REQUIRE(std::count(withDup.begin(), withDup.end(), a) == 2);
    // It grows by 100 when full.
    for (uint32_t i = 10; i < 210; ++i) list.add(Handle::make(ObjType::Tile, i), 5);
    REQUIRE(list.entries().size() == 300);

    // The colony adds a tile only once (s8:5860).
    World w;
    Tile& t = w.depot();
    REQUIRE(w.colony.tiles.contains(t.self));
    w.sim.createBuilding(t, 13);
    const auto& e = w.colony.tiles.entries();
    const auto it = std::find_if(e.begin(), e.end(), [&](const TileList::Entry& x) { return x.tile == t.self; });
    REQUIRE(it->key == w.sim.data().priorityOf(13));
    REQUIRE(w.sim.data().priorityOf(13) == 2);     // power plants early
    REQUIRE(w.sim.data().priorityOf(44) == 1);     // Nano first
    REQUIRE(w.sim.data().priorityOf(5) == 35);     // terrain last
}

// ── The rebuild's own features (improvised.md I105–I108) ──────────────────

TEST_CASE("I106: a lab beside an Administration building researches faster", "[sim][improved]") {
    for (bool admin : {false, true}) {
        World w;
        w.colony.freeResources = true;
        w.utilities();
        auto& lab = static_cast<LabBuilding&>(w.place(93));
        if (admin) w.place(102);                              // UGAdmin, the lab's neighbour
        lab.topic = 5;
        w.sim.runTurns(1);                                    // turn 0 at morale 600: 2 points
        REQUIRE(w.player.remaining[5] == 25 - (admin ? 3 : 2));
    }
}

TEST_CASE("I105: a University raises education only while it has teaching turns", "[sim][improved]") {
    int16_t edu[2]{};
    for (int k = 0; k < 2; ++k) {
        World w;
        moraleColony(w);
        auto& u = static_cast<UGUnivBuilding&>(placeAt(w, 84, 4, 0, 0));
        u.counter20 = k == 0 ? 0 : 50;                        // spent, or turns left
        w.sim.runTurns(1);
        edu[k] = w.colony.education;
    }
    REQUIRE(edu[1] == edu[0] + 2);
}

TEST_CASE("I107: with Embryology the residences raise children", "[sim][improved]") {
    int32_t people[2]{};
    for (int k = 0; k < 2; ++k) {
        World w;
        moraleColony(w);                                      // 100 adults, two residences
        if (k == 1) {
            w.player.remaining[18] = 0;                       // Embryology
            w.player.minTurns[18] = 0;
        }
        w.sim.runTurns(1);                                    // turn 0: 6 divides it
        people[k] = w.colony.population.total();
    }
    REQUIRE(people[1] > people[0]);
}

TEST_CASE("I108: a broken building stays suspended until the engineers repair it", "[sim][improved]") {
    World w;
    w.colony.freeResources = true;
    w.utilities();                                            // the SeedCommand houses the engineers
    Building& dome = w.place(27);
    w.sim.breakdowns().broken[dome.self.value] = 2;
    w.sim.runTurns(1);
    REQUIRE(dome.state == Building::kSuspended);              // SCProdSched did not resume it
    REQUIRE(repairLeft(w.sim, dome) == 1);
    w.sim.runTurns(1);                                        // repaired, then resumed
    REQUIRE(repairLeft(w.sim, dome) == -1);
    REQUIRE(dome.state == Building::kOperational);
    REQUIRE(breakdownChance(55) == 50);                       // the manual's Command Center
    REQUIRE(breakdownChance(47) == 0);                        // DIRT never breaks

    // Kept in the save's extension chunk.
    w.sim.breakdowns().broken[dome.self.value] = 5;
    const auto body = saveExtensions(w.sim);
    REQUIRE_FALSE(body.empty());
    World other;
    loadExtensions(other.sim, body);
    REQUIRE(other.sim.breakdowns().broken.at(dome.self.value) == 5);
}

TEST_CASE("I109: the manual's disasters by planet class", "[sim][improved]") {
    REQUIRE(disasterFrequency(1, 6) == 10);                   // Mercury: solar flares
    REQUIRE(disasterFrequency(2, 3) == 7);                    // Venus: volcanoes
    REQUIRE(disasterFrequency(4, 4) == 4);                    // Mars: sand storms
    REQUIRE(disasterFrequency(8, 6) == 0);                    // Pluto: no flares
    REQUIRE(disasterFrequency(5, 1) == 0);                    // a gas giant: none
    World w;
    w.colony.freeResources = true;
    w.utilities();
    Building& dome = w.place(27);
    damageBuilding(w.sim, dome, 3);
    REQUIRE(repairLeft(w.sim, dome) == 3);
    damageBuilding(w.sim, dome, 9);                           // already broken: unchanged
    REQUIRE(repairLeft(w.sim, dome) == 3);
}

TEST_CASE("site table dump", "[.sites]") {
    const auto& sites = gameData().sites;
    for (size_t i = 0; i < sites.size(); ++i)
        std::printf("%zu: %d %d %d\n", i, sites[i].x, sites[i].y, sites[i].z);
}

TEST_CASE("planet sites dump", "[.planetsites]") {
#pragma warning(suppress : 4996)
    const char* file = std::getenv("OPS_FILE");
    if (!file) return;
    std::ifstream f(file, std::ios::binary);
    std::vector<uint8_t> bytes((std::istreambuf_iterator<char>(f)), {});
    data::OpsSave save;
    REQUIRE(save.parse(bytes));
    Simulation sim(gameData());
    std::string err;
    REQUIRE(loadOps(sim, save, nullptr, &err));
    for (const Planet* p : sim.db().allOf<Planet>(ObjType::Planet))
        std::printf("planet %s template %u siteIds %zu children %zu field14 %d\n", p->name.c_str(), p->nameId,
                    p->siteIds.size(), p->children.size(), p->field14);
    for (const Site* s : sim.db().allOf<Site>(ObjType::Site))
        std::printf("site %s rec00 %u owner %08x grid %d\n", s->name.c_str(), s->rec00, s->owner.value,
                    sim.gridOfSite(s->self) ? 1 : 0);
}

TEST_CASE("groups dump", "[.groups]") {
    for (int g : {43, 45, 46, 47, 44})
        for (uint16_t t = 1; t < 138; ++t)
            if (gameData().groups.contains(g, t)) std::printf("group %d: %u\n", g, unsigned(t));
}
