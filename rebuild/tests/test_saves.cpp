// Save-game loading: TUTOR.OPS (a version-1 save) read into the simulation.
// Layouts: specs/001-outpost-reverse-engineering/contracts/ops-save-format.md.

#include <catch2/catch_test_macros.hpp>

#include "data/game_files.hpp"
#include "data/ops_save.hpp"
#include "sim/building.hpp"
#include "sim/ops_loader.hpp"
#include "sim/ops_writer.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/vehicles.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cctype>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iterator>
#include <map>
#include <memory>

using namespace outpost;
using namespace outpost::sim;
namespace res = outpost::data::res;

namespace {

struct Tutor {
    data::GameFiles files;
    GameData data;
    data::OpsSave save;
    std::unique_ptr<Simulation> sim;
    OpsLoadInfo info;

    Tutor() {
        std::string err;
        REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
        REQUIRE(data.load(files, &err));
        const auto bytes = files.read("TUTOR.OPS");
        REQUIRE(bytes);
        REQUIRE(save.parse(*bytes));
        sim = std::make_unique<Simulation>(data);
        const bool ok = loadOps(*sim, save, &info, &err);
        INFO(err);
        REQUIRE(ok);
    }
    ObjectDb& db() { return sim->db(); }
};

Tutor& tutor() {
    static Tutor t;
    return t;
}

} // namespace

TEST_CASE("Save versions translate building types and products", "[saves]") {
    REQUIRE(translateType(1, 23) == 23);
    REQUIRE(translateType(1, 24) == 27);
    REQUIRE(translateType(1, 61) == 65);
    REQUIRE(translateType(1, 63) == 71);
    REQUIRE(translateType(1, 103) == 112);
    REQUIRE(translateType(1, 129) == 0);
    REQUIRE(translateType(4, 129) == 129);
    REQUIRE(translateProduct(1, 4) == 5);
    REQUIRE(translateProduct(1, 5) == 4);
    REQUIRE(translateProduct(1, 20) == 0);
    REQUIRE(translateProduct(4, 4) == 4);
}

TEST_CASE("TUTOR.OPS loads: objects, turn, handle counters", "[saves]") {
    Tutor& t = tutor();
    REQUIRE(t.info.version == 1);
    REQUIRE(t.info.turn == 80);
    REQUIRE(t.sim->turn() == 80);
    REQUIRE(t.info.objects == 1 + 1 + 1 + 2 + 194 + 26 + 194 + 2);
    REQUIRE(t.db().all(ObjType::Tile).size() == 194);
    REQUIRE(t.db().all(ObjType::Building).size() == 194);
    REQUIRE(t.db().lastIndex(ObjType::Tile) == 372);
    REQUIRE(t.db().lastIndex(ObjType::Building) == 373);

    const Star* star = t.db().get<Star>(Handle::make(ObjType::Star, 7));
    REQUIRE(star);
    REQUIRE(star->name == "Sigma Draconis");
    const Planet* planet = t.db().get<Planet>(Handle::make(ObjType::Planet, 4));
    REQUIRE(planet->name == "Sigma Draconis 4");
    REQUIRE(planet->hostility == 1);
    REQUIRE(planet->terraformTurns == 10000);
    REQUIRE(t.sim->planetHostility() == 1);
    const Site* site = t.db().get<Site>(Handle::make(ObjType::Site, 3));
    REQUIRE(site->name == "Vulcan's Forge");
    REQUIRE(site->depth == 4);
    REQUIRE(site->mineSites.size() == 28);
    REQUIRE(site->mapSize == Pos3{300, 150, 1});
}

TEST_CASE("TUTOR.OPS colonies, tiles and buildings", "[saves]") {
    Tutor& t = tutor();
    Colony* c1 = t.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    Colony* c2 = t.db().get<Colony>(Handle::make(ObjType::Colony, 2));
    REQUIRE(c1);
    REQUIRE(c2);
    REQUIRE(c1->name == "Vulcan's Forge");
    REQUIRE(c2->name == "Rebel");
    REQUIRE(c1->player == Handle::make(ObjType::Player, 1));
    REQUIRE(c2->player == kRebelPlayer);
    REQUIRE(c1->morale == 434);
    REQUIRE(c1->population.total() == 135);
    REQUIRE(c1->populated);
    REQUIRE(t.sim->siteOf(*c1) == t.db().get<Site>(Handle::make(ObjType::Site, 3)));
    REQUIRE(c1->tiles.entries().size() == 200);
    REQUIRE(c1->tiles.order().size() == 139);                 // 133 tiles, 6 of them twice

    // Tile 1: (22, 69) on the surface, a Chap on it, 139 food stored.
    const Tile* tile1 = t.db().get<Tile>(Handle::make(ObjType::Tile, 1));
    REQUIRE(tile1->x == 22);
    REQUIRE(tile1->y == 69);
    REQUIRE(tile1->level == 0);
    REQUIRE(tile1->bas.get(res::Food) == 139);
    REQUIRE(tile1->colony == c1->self);
    REQUIRE(t.sim->tileAt(Simulation::gridOf(*c1), 22, 69, 0) == tile1);
    const Building* b = t.db().get<Building>(tile1->building);
    REQUIRE(b->tile(*t.sim) == tile1);

    // Version-1 numbers were translated: the first building is a Chap (v1
    // type 39), under construction placeholder 66 (v1 62).
    const Building* first = t.db().get<Building>(Handle::make(ObjType::Building, 3));
    REQUIRE(first->type == 42);
    REQUIRE(first->placeholderType == 66);
    REQUIRE(first->state == Building::kOperational);
    REQUIRE(first->infoKind == Building::InfoKind::Operation);

    std::map<uint16_t, int> types;
    for (Building* x : t.db().allOf<Building>(ObjType::Building)) ++types[x->type];
    REQUIRE(types[16] == 25);                                 // DisMines
    REQUIRE(types[51] == 3);                                  // ActiveMines
    REQUIRE(types[55] == 2);                                  // Command centers
    REQUIRE(types[79] == 5);                                  // UG residences

    // Unit kinds were translated as products; the colonies' counts agree.
    std::map<uint16_t, int> kinds;
    for (Unit* u : t.db().allOf<Unit>(ObjType::Unit)) ++kinds[u->kind];
    REQUIRE(kinds[product::Truck] == 9);
    REQUIRE(kinds[product::Explorer] == 2);
    REQUIRE(c1->linkedCount[product::Truck] + c2->linkedCount[product::Truck] == 9);

    // The build menu, translated, is the one a new game starts with.
    BuildMenu fresh;
    REQUIRE(t.sim->buildMenu().offered == fresh.offered);
    REQUIRE(t.sim->buildMenu().field148 == 51);
}

TEST_CASE("TUTOR.OPS runs", "[saves]") {
    Tutor fresh;                                              // its own copy: turns change it
    Simulation& sim = *fresh.sim;
    const int32_t before = fresh.db().get<Colony>(Handle::make(ObjType::Colony, 1))->population.total();
    sim.runTurns(20);
    REQUIRE(sim.turn() == 100);
    const Colony* c1 = fresh.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    REQUIRE(c1->population.total() > 0);
    REQUIRE(c1->population.total() >= before / 2);
}

TEST_CASE("TUTOR.OPS: the colony network holds on the first turn", "[saves]") {
    Tutor fresh;
    auto operational = [&] {
        int n = 0;
        for (Building* b : fresh.db().allOf<Building>(ObjType::Building))
            if (b->state == Building::kOperational) ++n;
        return n;
    };
    REQUIRE(operational() == 76);
    fresh.sim->runTurns(1);
    // SCProdSched suspends everything and resumes what the power and air
    // networks reach: with the saved layout all 76 come back.
    REQUIRE(operational() == 76);
    const Colony* c1 = fresh.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    REQUIRE(c1->total[res::Power] == 1050);
}

namespace {

// The first offset where two saves differ (-1: the same bytes), with the
// chunk it falls in, so a failure names the place.
std::string firstDiff(const std::vector<uint8_t>& a, const std::vector<uint8_t>& b) {
    const size_t n = std::min(a.size(), b.size());
    size_t i = 0;
    while (i < n && a[i] == b[i]) ++i;
    if (i == n && a.size() == b.size()) return "same";
    std::string chunk = "header";
    size_t start = 0;
    for (size_t k = 0; k + 7 <= i && k + 7 <= a.size(); ++k)
        if (std::equal(a.begin() + k, a.begin() + k + 5, "dcbSC")) {
            chunk = std::string(a.begin() + k + 5, a.begin() + k + 7);
            start = k + 7;
        }
    return "offset " + std::to_string(i - start) + " in chunk " + chunk + " (sizes " + std::to_string(a.size()) +
           ", " + std::to_string(b.size()) + ")";
}

// Loads a written save into a fresh simulation.
struct Reloaded {
    data::OpsSave save;
    std::unique_ptr<Simulation> sim;
    OpsLoadInfo info;

    Reloaded(const GameData& data, const std::vector<uint8_t>& bytes) {
        REQUIRE(save.parse(bytes));
        sim = std::make_unique<Simulation>(data);
        std::string err;
        const bool ok = loadOps(*sim, save, &info, &err);
        INFO(err);
        REQUIRE(ok);
    }
};

} // namespace

TEST_CASE("TUTOR.OPS other chunks: mothership, options, alerts, galaxy", "[saves]") {
    Tutor& t = tutor();
    const Mothership& m = t.sim->mothership();
    REQUIRE(m.hold.size() == 3);
    REQUIRE(m.hold[1].kind == 130);                           // v1 121, translated
    REQUIRE(m.hold[1].count == 9);
    REQUIRE(m.deployable.size() == 1);
    REQUIRE(m.deployable[0].kind == 19);
    REQUIRE(m.damaged.empty());
    REQUIRE(m.arrived);
    REQUIRE(m.countdown == 3);
    REQUIRE(m.cryoColonists == 0);
    REQUIRE(t.info.extras.aiName == "Aphrodite");
    REQUIRE(t.info.extras.playerName == "Anonymous Bosch");
    REQUIRE(t.sim->difficulty() == 2);
    REQUIRE(t.info.extras.alerts.size() == 8);
    // Seven alert words in TUTOR.OPS; the loader takes three more from the
    // next tag's text "dcbSC07" (quirk Q50).
    REQUIRE(t.info.extras.alertRows[10] == 0x6364);           // "dc", v1 word 7 -> row 10
    REQUIRE(t.sim->alertOn(1));                               // row 0: "C0" (0x3043)
    REQUIRE(t.sim->alertOn(4));                               // row 3: word 1
    REQUIRE_FALSE(t.sim->alertOn(10));                        // row 9: word 6 = 0
    REQUIRE(t.sim->galaxy().starIds.size() == 21);
    REQUIRE(t.sim->galaxy().self == Handle{0xFF000001u});
    REQUIRE(t.sim->galaxy().children.size() == 21);
    REQUIRE(t.sim->galaxy().children[6] == Handle::make(ObjType::Star, 7));   // the others: 0
    REQUIRE(translateAlertRow(1) == 3);
    REQUIRE(translateAlertRow(7) == 10);
    REQUIRE(translateAlertRow(8) == 0);
}

TEST_CASE("Saves round-trip: TUTOR.OPS written as version 4 loads the same", "[saves]") {
    Tutor fresh;
    const std::vector<uint8_t> v4 = writeOps(*fresh.sim, fresh.info.extras);
    REQUIRE(std::string(v4.begin(), v4.begin() + 5) == "SC004");
    Reloaded r(fresh.data, v4);
    REQUIRE(r.info.version == 4);
    REQUIRE(r.info.turn == 80);
    REQUIRE(r.info.objects == fresh.info.objects);
    REQUIRE(r.info.lastHandle == fresh.info.lastHandle);
    REQUIRE(r.save.chunks().size() == 23);                    // 0x01-0x17
    // Written again, the version-4 file is the same bytes.
    REQUIRE(firstDiff(writeOps(*r.sim, r.info.extras), v4) == "same");

    const Colony* a = fresh.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    const Colony* b = r.sim->db().get<Colony>(Handle::make(ObjType::Colony, 1));
    REQUIRE(b->name == a->name);
    REQUIRE(b->morale == a->morale);
    REQUIRE(b->population.total() == a->population.total());
    REQUIRE(b->tiles.order() == a->tiles.order());
    REQUIRE(r.sim->mothership().hold.size() == 3);
    REQUIRE(r.sim->difficulty() == 2);
    for (uint16_t id = 1; id <= 10; ++id) REQUIRE(r.sim->alertOn(id) == fresh.sim->alertOn(id));

    // Both run the same: after 10 turns they still write the same save.
    fresh.sim->runTurns(10);
    r.sim->runTurns(10);
    REQUIRE(firstDiff(writeOps(*r.sim, r.info.extras), writeOps(*fresh.sim, fresh.info.extras)) == "same");
}

TEST_CASE("Saves: a game in progress is saved and continued", "[saves]") {
    Tutor fresh;
    fresh.sim->runTurns(5);
    const std::vector<uint8_t> saved = writeOps(*fresh.sim, fresh.info.extras);
    Reloaded r(fresh.data, saved);
    REQUIRE(r.sim->turn() == 85);
    // The loader sorts each colony's tile list (s5:C694) while the running
    // game leaves it unsorted after a tile's slot is blanked or re-keyed
    // (robots finishing their work), so the first re-save may order it
    // differently; from then on the file is stable.
    const std::vector<uint8_t> again = writeOps(*r.sim, r.info.extras);
    REQUIRE(again.size() == saved.size());
    Reloaded r2(fresh.data, again);
    REQUIRE(firstDiff(writeOps(*r2.sim, r2.info.extras), again) == "same");
    // The random number seed is not saved (the game seeds it from the clock
    // at startup), so the continued game draws differently; it runs on.
    r.sim->runTurns(5);
    REQUIRE(r.sim->turn() == 90);
    REQUIRE(r.sim->db().get<Colony>(Handle::make(ObjType::Colony, 1))->population.total() > 0);
}

TEST_CASE("Mothership: landers move to the deployable list once (s3:9794)", "[saves][mothership]") {
    Mothership m;
    m.hold = {{10, 2}, {62, 3}, {130, 9}, {65, 2}};
    m.deployable = {{19, 1}};
    m.moveLanders();
    REQUIRE(m.landersMoved);
    REQUIRE(m.deployable.size() == 2);                        // the old list is replaced
    REQUIRE(m.deployableCount(62) == 3);
    REQUIRE(m.deployableCount(65) == 2);
    REQUIRE(m.hold.size() == 2);
    REQUIRE(m.holdCount(62) == 0);
    m.hold.push_back({62, 1});
    m.moveLanders();                                          // only the first time
    REQUIRE(m.holdCount(62) == 1);
    REQUIRE(m.deployable.size() == 2);
}

TEST_CASE("Mothership: cargo damage on arrival (s3:A0A0, s3:9766)", "[saves][mothership]") {
    auto hold = [] {
        return std::vector<ShipItem>{{18, 2}, {18, 7}, {131, 1}, {131, 5}, {0x80, 3},
                                     {0x80, 1}, {62, 4}, {130, 9}};
    };
    SECTION("Medium: count / 2") {
        Mothership m;
        m.hold = hold();
        m.damageCargo(3);
        REQUIRE(m.hold[0].count == 2);                        // kind 18 up to 2: kept
        REQUIRE(m.hold[1].count == 4);                        // 7 - 7 / 2
        REQUIRE(m.hold[2].count == 1);                        // kind 131 up to 1: kept
        REQUIRE(m.hold[3].count == 3);                        // 5 - 5 / 2
        REQUIRE(m.hold[4].count == 2);                        // colonists: half lost
        REQUIRE(m.hold[5].count == 1);                        // 1 / 2 = 0 lost ...
        REQUIRE(m.hold[6].count == 2);
        REQUIRE(m.hold[7].count == 5);
        REQUIRE(m.damaged.size() == 3);
        REQUIRE(m.damaged[0].kind == 0x80);
        REQUIRE(m.damaged[0].count == 1);
        REQUIRE(m.damaged[1].count == 1);                     // ... but reported as 1 (Q52)
        REQUIRE(m.damaged[2].kind == 62);
        REQUIRE(m.damaged[2].count == 2);
    }
    SECTION("Easy: count / 4; halves stay halves") {
        Mothership m;
        m.hold = hold();
        m.damageCargo(2);
        REQUIRE(m.hold[1].count == 6);                        // 7 - 7 / 4
        REQUIRE(m.hold[4].count == 2);
        REQUIRE(m.hold[7].count == 7);                        // 9 - 9 / 4
    }
    SECTION("Arrival: 50 cryo colonists per colonist module left") {
        Mothership m;
        m.hold = {{0x80, 4}, {130, 9}};
        m.arrive(4);
        REQUIRE(m.arrived);
        REQUIRE(m.hold[0].count == 2);
        REQUIRE(m.cryoColonists == 100);
        REQUIRE(m.damaged.size() == 1);
    }
}

TEST_CASE("Saves: the trucks' trips (chunk 0x17, s8:75CA / s8:774E)", "[saves]") {
    Tutor fresh;
    auto& trips = fresh.sim->trips();
    REQUIRE(trips.empty());                                   // version 1 has no chunk 0x17
    {
        auto t = std::make_unique<Trip>();
        t->route = {Handle::make(ObjType::Tile, 5), Handle::make(ObjType::Tile, 9)};
        t->home = Handle::make(ObjType::Tile, 1);
        t->cargo = std::make_unique<Ledger>();
        t->cargo->set(res::Food, 12);
        t->cargo->set(res::Power, 3);
        t->quantity = 15;
        t->pos = {22, 70, 0};
        t->next = Handle::make(ObjType::Tile, 5);
        t->points = 40;
        t->trucks = 2;
        trips.push_back(std::move(t));
        auto u = std::make_unique<Trip>();
        u->home = Handle::make(ObjType::Tile, 3);
        u->productA = product::Truck;
        u->quantity = 1;
        u->waiting = 1;
        trips.push_back(std::move(u));
    }
    // A train carrying the waiting trip, and a MonoStation where a third one
    // waits: both lists hold trips of the manager's list (I30).
    auto u2 = std::make_unique<Trip>();
    u2->home = Handle::make(ObjType::Tile, 4);
    u2->bas = res::Food;
    u2->quantity = 7;
    u2->waiting = 1;
    Trip* waitingTrip = u2.get();
    trips.push_back(std::move(u2));
    auto train = std::make_unique<Train>();
    train->station = Handle::make(ObjType::Tile, 2);
    train->pos = {30, 40, 0};
    train->direction = 3;
    train->riders.push_back(trips[1].get());
    fresh.sim->trains().push_back(std::move(train));
    Colony* c1 = fresh.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    Tile& tile = fresh.sim->createTile(*c1, 5, 5, 0);
    auto* station = dynamic_cast<MonoStationBuilding*>(&fresh.sim->createBuilding(tile, 63));
    REQUIRE(station);
    station->waiting.push_back(waitingTrip);

    const std::vector<uint8_t> bytes = writeOps(*fresh.sim, fresh.info.extras);
    Reloaded r(fresh.data, bytes);
    const auto& back = r.sim->trips();
    REQUIRE(back.size() == 3);                                // no twins made
    REQUIRE(back[0]->route == trips[0]->route);
    REQUIRE(back[0]->home == Handle::make(ObjType::Tile, 1));
    REQUIRE(back[0]->cargo);
    REQUIRE(back[0]->cargo->get(res::Food) == 12);
    REQUIRE(back[0]->quantity == 15);
    REQUIRE(back[0]->pos.y == 70);
    REQUIRE(back[0]->trucks == 2);
    REQUIRE_FALSE(back[1]->cargo);                            // no table: 0 entries, none made
    REQUIRE(back[1]->productA == product::Truck);
    REQUIRE(back[1]->waiting == 1);
    REQUIRE(r.sim->trains().size() == 1);
    const Train& t = *r.sim->trains()[0];
    REQUIRE(t.station == Handle::make(ObjType::Tile, 2));
    REQUIRE(t.pos.y == 40);
    REQUIRE(t.direction == 3);
    REQUIRE(t.riders == std::vector<Trip*>{back[1].get()});   // the same object
    const auto* st = dynamic_cast<const MonoStationBuilding*>(r.sim->db().get<Building>(station->self));
    REQUIRE(st);
    REQUIRE(st->waiting == std::vector<Trip*>{back[2].get()});
    // Loading sorts the colony's tile list (s5:C694), which the station's
    // tile left unsorted (Q48); from then on a save reads back unchanged.
    const std::vector<uint8_t> again = writeOps(*r.sim, r.info.extras);
    Reloaded r2(fresh.data, again);
    REQUIRE(r2.sim->trips().size() == 3);
    REQUIRE(firstDiff(writeOps(*r2.sim, r2.info.extras), again) == "same");
}

namespace {

std::string envValue(const char* name) {
#ifdef _MSC_VER
    char* v = nullptr;
    size_t n = 0;
    if (_dupenv_s(&v, &n, name) != 0 || !v) return {};
    std::string s(v);
    free(v);
    return s;
#else
    const char* v = std::getenv(name);
    return v ? v : "";
#endif
}

} // namespace

// Saves made by the original game (DOSBox-X + Windows 3.1): put them in a
// folder and set OUTPOST_EXTRA_SAVES to it. Each must load, run, and save
// back so that a reload reads the same; where the rebuild's first write
// differs from the original file is reported (tile lists and ledgers may be
// ordered differently, see Q48).
TEST_CASE("Saves made by the original game (OUTPOST_EXTRA_SAVES)", "[saves][original]") {
    const std::string dir = envValue("OUTPOST_EXTRA_SAVES");
    if (dir.empty()) {
        SUCCEED("OUTPOST_EXTRA_SAVES not set: no original saves to check");
        return;
    }
    Tutor& t = tutor();                                       // for GameData
    size_t checked = 0;
    for (const auto& entry : std::filesystem::directory_iterator(dir)) {
        std::string ext = entry.path().extension().string();
        std::transform(ext.begin(), ext.end(), ext.begin(), [](unsigned char c) { return static_cast<char>(std::tolower(c)); });
        if (ext != ".ops") continue;
        INFO(entry.path().string());
        std::ifstream in(entry.path(), std::ios::binary);
        const std::vector<uint8_t> original((std::istreambuf_iterator<char>(in)), std::istreambuf_iterator<char>());
        data::OpsSave save;
        REQUIRE(save.parse(original));
        Simulation sim(t.data);
        OpsLoadInfo info;
        std::string err;
        const bool ok = loadOps(sim, save, &info, &err);
        INFO(err);
        REQUIRE(ok);
        const std::vector<uint8_t> first = writeOps(sim, info.extras);
        if (info.version == 4) WARN("first difference from the original: " << firstDiff(first, original));
        Reloaded once(t.data, first);
        const std::vector<uint8_t> second = writeOps(*once.sim, once.info.extras);
        Reloaded twice(t.data, second);
        REQUIRE(firstDiff(writeOps(*twice.sim, twice.info.extras), second) == "same");
        sim.runTurns(5);
        ++checked;
    }
    WARN(checked << " original save(s) checked");
}
