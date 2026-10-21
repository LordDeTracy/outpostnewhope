// The Ship Configuration dialog (4010) and the orbital objects (registry 9).

#include <catch2/catch_test_macros.hpp>

#include "data/dialog_template.hpp"
#include "data/game_files.hpp"
#include "data/ops_save.hpp"
#include "sim/ops_loader.hpp"
#include "sim/ship_config.hpp"
#include "sim/simulation.hpp"

#include <memory>

using namespace outpost;
using namespace outpost::sim;

namespace {

struct Game {
    data::GameFiles files;
    GameData data;
    ShipConfig ship;

    Game() {
        std::string err;
        REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
        REQUIRE(data.load(files, &err));
        const bool ok = ship.load(data.exe, &err);
        INFO(err);
        REQUIRE(ok);
    }
};

Game& game() {
    static Game g;
    return g;
}

} // namespace

TEST_CASE("Dialog templates: Ship Configuration Setup", "[ship]") {
    const auto d = data::DialogTemplate::load(game().data.exe, 4010);
    REQUIRE(d);
    REQUIRE(d->caption == "Ship Configuration Setup");
    REQUIRE(d->control(4009)->className == "EDIT");
    REQUIRE(d->control(4009)->text.empty());                  // remaining weight: empty
    REQUIRE(d->control(5003)->className == "MicroSpinControl");
    REQUIRE(d->control(5003)->text == "2,4");
    REQUIRE(d->intOf(5012) == 9);
    REQUIRE(d->intOf(5025) == 20);
    REQUIRE(d->control(1)->text == "Launch");
}

TEST_CASE("Ship rows: the table at DGROUP 0x5A70 and the template's texts", "[ship]") {
    const auto& rows = game().ship.rows();
    REQUIRE(rows[0].kind == 0x80);
    REQUIRE(rows[0].name == "Colonists x 50");
    REQUIRE(rows[0].countId == 5002);
    REQUIRE(rows[0].min == 2);
    REQUIRE(rows[0].max == 4);
    REQUIRE(rows[0].weight == 1);
    REQUIRE(rows[0].cost == 1);
    REQUIRE(rows[3].kind == 62);
    REQUIRE(rows[3].name == "Colonist Lander");
    REQUIRE(rows[3].weight == 9);
    REQUIRE(rows[3].cost == 16);
    REQUIRE(rows[5].kind == 10);
    REQUIRE(rows[5].name == "Seed Factory");
    REQUIRE(rows[5].min == 2);
    REQUIRE(rows[5].max == 2);
    REQUIRE(rows[8].kind == 18);
    REQUIRE(rows[8].name == "Solar Receiver Array");
    REQUIRE(rows[14].kind == 0x89);
    REQUIRE(rows[14].name == "ULBI Probe");
    REQUIRE(rows[14].weight == 0);
    REQUIRE(rows[14].cost == 14);
}

TEST_CASE("Ship dialog as shipped: nothing can be loaded", "[ship]") {
    ShipConfig s = game().ship;
    s.open();                                                 // the template's empty fields
    REQUIRE(s.remainingWeight == 0);
    REQUIRE(s.remainingFunds == 0);
    for (size_t i = 0; i < ShipConfig::kRows; ++i) REQUIRE_FALSE(s.step(i, true));
    REQUIRE_FALSE(s.asksBeforeLaunch());
    Simulation sim(game().data);
    sim.mothership().hold = {{10, 1}};
    s.launch(sim);
    REQUIRE(sim.mothership().hold.empty());                   // a new, empty hold
}

TEST_CASE("Ship dialog, improvised start: the minimums, pods with landers (I102)", "[ship]") {
    ShipConfig s = game().ship;
    s.openImproved();
    const auto rowOf = [&](uint16_t kind) {
        for (size_t i = 0; i < ShipConfig::kRows; ++i)
            if (s.rows()[i].kind == kind) return i;
        return ShipConfig::kRows;
    };
    for (size_t i = 0; i < ShipConfig::kRows; ++i) REQUIRE(s.counts[i] == s.rows()[i].min);
    REQUIRE(s.remainingWeight == ShipConfig::kImprovisedWeight - 72);
    REQUIRE(s.remainingFunds == ShipConfig::kImprovisedFunds - 128);
    const size_t pods = rowOf(0x80), landers = rowOf(62);
    REQUIRE(s.stepLinked(landers, true));                     // a lander brings its pod
    REQUIRE(s.counts[landers] == 3);
    REQUIRE(s.counts[pods] == 3);
    REQUIRE(s.stepLinked(pods, false));                       // and back, both
    REQUIRE(s.counts[landers] == 2);
    REQUIRE(s.counts[pods] == 2);
    REQUIRE_FALSE(s.stepLinked(pods, false));                 // not below the minimums
    REQUIRE(s.remainingWeight == ShipConfig::kImprovisedWeight - 72);
}

TEST_CASE("Ship dialog, improvised start: minimums and a budget (I24)", "[ship]") {
    ShipConfig s = game().ship;
    for (size_t i = 0; i < ShipConfig::kRows; ++i) s.counts[i] = s.rows()[i].min;
    s.open(ShipConfig::kImprovisedWeight, ShipConfig::kImprovisedFunds);
    REQUIRE(s.counts[0] == 2);
    REQUIRE(s.counts[7] == 0);
    REQUIRE(s.remainingWeight == ShipConfig::kImprovisedWeight - 72);
    REQUIRE(s.remainingFunds == ShipConfig::kImprovisedFunds - 128);

    REQUIRE(s.step(0, true));                                 // colonists 3
    REQUIRE(s.counts[0] == 3);
    REQUIRE(s.remainingWeight == ShipConfig::kImprovisedWeight - 73);
    REQUIRE(s.step(0, false));
    REQUIRE_FALSE(s.step(0, false));                          // not below the minimum
    REQUIRE_FALSE(s.step(5, true));                           // Seed: exactly 2

    // The budget (the manual: 78 weight and 172 funds left once the minimums
    // are packed): the weight runs out before the Solar Receivers' maximum
    // of 20.
    REQUIRE(s.remainingWeight == 78);
    REQUIRE(s.remainingFunds == 172);
    int added = 0;
    while (s.step(8, true)) ++added;                          // weight 5, cost 10
    REQUIRE(added == 15);                                     // 78 weight: 15 of them
    REQUIRE(s.remainingWeight == 3);
    REQUIRE(s.remainingFunds == 172 - 150);
    REQUIRE_FALSE(s.step(9, true));                           // a probe weighs 4
    REQUIRE_FALSE(s.step(12, true));                          // so does a Comm satellite
    REQUIRE(s.counts[12] == 0);
    REQUIRE(s.step(11, true));                                // an Interstellar Probe weighs 0, costs 15
    REQUIRE(s.remainingFunds == 7);
    REQUIRE_FALSE(s.step(14, true));                          // a ULBI Probe at 14: no
    REQUIRE(s.asksBeforeLaunch());
}

TEST_CASE("Ship launch fills the hold and the orbital objects (s8:95FC)", "[ship]") {
    ShipConfig s = game().ship;
    s.openImproved();
    REQUIRE(s.step(7, true));                                 // a Solar Satellite
    REQUIRE(s.step(14, true));                                // a ULBI probe
    Simulation sim(game().data);
    s.launch(sim);
    const auto& hold = sim.mothership().hold;
    REQUIRE(hold.size() == 7);
    REQUIRE(hold[0].kind == 0x80);
    REQUIRE(hold[0].count == 2);
    REQUIRE(hold[5].kind == 10);
    REQUIRE(hold[6].kind == 19);
    REQUIRE(sim.mothership().holdCount(18) == 0);             // count 0: not listed
    REQUIRE(sim.orbitals().aboard(131) == 1);
    REQUIRE(sim.orbitalCount(131) == 0);                      // carried, not launched
    REQUIRE(sim.orbitalCount(0x89) == 1);                     // the ULBI probe goes at once
    REQUIRE(sim.orbitals().aboard(0x89) == 0);
    sim.launchOrbital(131);                                   // s3:6604
    REQUIRE(sim.orbitalCount(131) == 1);
    REQUIRE(sim.orbitals().aboard(131) == 0);
    sim.setOrbitalCount(18, 3);                               // no slot: dropped
    REQUIRE(sim.orbitalCount(18) == 0);
}

TEST_CASE("TUTOR.OPS orbital objects (chunk 0x07)", "[ship][saves]") {
    data::OpsSave save;
    const auto bytes = game().files.read("TUTOR.OPS");
    REQUIRE(bytes);
    REQUIRE(save.parse(*bytes));
    Simulation sim(game().data);
    REQUIRE(loadOps(sim, save));
    for (uint16_t kind = 0x83; kind <= 0x88; ++kind) {
        REQUIRE(sim.orbitalCount(kind) == 1);
        REQUIRE(sim.orbitals().aboard(kind) == 0);
    }
    REQUIRE(sim.orbitalCount(0x89) == 0);
}
