// A new game: the galaxy, the destination star and its planets (SCSelect,
// SCGenKids and the universe tables of OUTPOST.EXE).

#include <catch2/catch_test_macros.hpp>

#include "data/game_files.hpp"
#include "data/ops_save.hpp"
#include "sim/building.hpp"
#include "sim/new_game.hpp"
#include "sim/ops_loader.hpp"
#include "sim/ops_writer.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <set>

using namespace outpost;
using namespace outpost::sim;

namespace {

struct Data {
    data::GameFiles files;
    GameData data;
    Data() {
        std::string err;
        REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
        REQUIRE(data.load(files, &err));
    }
};

const GameData& gameData() {
    static Data d;
    return d.data;
}

struct Fresh {
    NewGame game;
    Simulation sim{gameData()};
    Fresh() {
        std::string err;
        const bool ok = game.load(gameData(), &err);
        INFO(err);
        REQUIRE(ok);
    }
};

Handle star(uint32_t i) { return Handle::make(ObjType::Star, i); }
Handle planet(uint32_t i) { return Handle::make(ObjType::Planet, i); }

} // namespace

TEST_CASE("Universe tables: 21 stars, 10 planet templates (DGROUP)", "[newgame]") {
    Fresh f;
    const auto& t = f.game.tables();
    REQUIRE(t.starIds.size() == 21);
    REQUIRE(t.stars.size() == 21);
    REQUIRE(t.stars[0].name == "Tau Ceti");
    REQUIRE(t.stars[0].planetIds == std::vector<uint16_t>{1, 2, 4});
    const auto& sigma = t.stars[6];
    REQUIRE(sigma.name == "Sigma Draconis");
    REQUIRE(sigma.pos == Pos3{30, 80, -75});
    REQUIRE(sigma.planetIds == std::vector<uint16_t>{1, 2, 3, 4});
    for (size_t i = 13; i < 20; ++i) REQUIRE(t.stars[i].planetIds == std::vector<uint16_t>{5});
    REQUIRE(t.stars[20].name == "Delta Pavonis");

    REQUIRE(t.planets.size() == 10);
    const auto& p4 = t.planets[3];
    REQUIRE(p4.hostility == 1);
    REQUIRE(p4.rec0E == 4400);
    REQUIRE(p4.traits == std::array<int16_t, 8>{0, 2, 4, 5, 0, 5, 4, 0});
    REQUIRE(p4.poolSize == 25);
    REQUIRE(p4.minSites == 10);
    REQUIRE(p4.maxSites == 14);
    REQUIRE(p4.sites[0] == 0);
    REQUIRE(t.planets[4].hostility == 10);                    // the planetless stars' "planet"
    REQUIRE(t.planets[4].maxSites == 0);
}

TEST_CASE("New game: two players and the galaxy's 21 stars (s2:087E)", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    REQUIRE(f.sim.turn() == 0);                               // one turn run, then reset
    REQUIRE(f.sim.db().all(ObjType::Player).size() == 2);
    const Galaxy& g = f.sim.galaxy();
    REQUIRE(g.self == Handle{0xFF000001u});
    REQUIRE(g.starIds.size() == 21);
    REQUIRE(g.children.size() == 21);
    for (uint32_t i = 0; i < 21; ++i) {
        REQUIRE(g.children[i] == star(i + 1));
        const Star* s = f.sim.db().get<Star>(star(i + 1));
        REQUIRE(s);
        REQUIRE(s->owner == g.self);
    }
    REQUIRE(f.sim.db().all(ObjType::Planet).empty());
}

TEST_CASE("Destination: Sigma Draconis and its planets, as in TUTOR.OPS", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 7);
    REQUIRE(f.sim.turn() == 0);
    // The other stars are gone; their galaxy slots stay, at 0.
    REQUIRE(f.sim.db().all(ObjType::Star).size() == 1);
    const Galaxy& g = f.sim.galaxy();
    REQUIRE(g.children.size() == 21);
    for (uint32_t i = 0; i < 21; ++i) REQUIRE(g.children[i] == (i == 6 ? star(7) : Handle{}));

    const Star* s = f.sim.db().get<Star>(star(7));
    REQUIRE(s->children == std::vector<Handle>{planet(1), planet(2), planet(3), planet(4)});
    const Planet* p = f.sim.db().get<Planet>(planet(4));
    REQUIRE(p->name == "Sigma Draconis 4");
    REQUIRE(p->nameId == 4);
    REQUIRE(p->owner == star(7));
    REQUIRE(p->hostility == 1);
    REQUIRE(p->rec0E == 4400);
    REQUIRE(p->terraformTurns == 10000);
    REQUIRE(p->siteIds.size() >= 10);
    REQUIRE(p->siteIds.size() <= 14);
    std::set<uint16_t> ids(p->siteIds.begin(), p->siteIds.end());
    REQUIRE(ids.size() == p->siteIds.size());                 // all different
    REQUIRE(*ids.begin() >= 1);                               // 0 is never drawn
    REQUIRE(*ids.rbegin() <= 24);

    // Choosing planet 4 in orbit leaves the star's other slots at 0.
    f.game.selectPlanet(f.sim, planet(4));
    REQUIRE(f.sim.db().all(ObjType::Planet).size() == 1);
    REQUIRE(f.sim.db().get<Star>(star(7))->children ==
            std::vector<Handle>{Handle{}, Handle{}, Handle{}, planet(4)});
}

TEST_CASE("Destination: a planet's handle is the next free one, not its template", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 1);                              // Tau Ceti: templates 1, 2, 4
    const Planet* third = f.sim.db().get<Planet>(planet(3));
    REQUIRE(third);
    REQUIRE(third->nameId == 4);
    REQUIRE(third->name == "Tau Ceti 3");
    REQUIRE(f.sim.db().get<Planet>(planet(4)) == nullptr);
}

TEST_CASE("Destination without a terrestrial planet", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 16);                             // Sirius
    const Planet* p = f.sim.db().get<Planet>(planet(1));
    REQUIRE(p->name == "Sirius 1");
    REQUIRE(p->nameId == 5);
    REQUIRE(p->hostility == 10);
    REQUIRE(p->siteIds.empty());
}

TEST_CASE("Planet templates keep the drawn sites (Q53)", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 7);
    const auto& row = f.game.tables().planets[3];
    const Planet* p = f.sim.db().get<Planet>(planet(4));
    REQUIRE(row.sites[0] == static_cast<int16_t>(p->siteIds[0]));
    // A second game in the same program draws planet 4's sites from a pool
    // starting at the first site drawn last time.
    const int16_t base = row.sites[0];
    Simulation again(gameData());
    f.game.start(again);
    f.game.selectStar(again, 7);
    for (uint16_t id : again.db().get<Planet>(planet(4))->siteIds) {
        REQUIRE(id >= base);
        REQUIRE(id <= base + 24);
    }
}

TEST_CASE("The chosen planet makes its sites (s7:3058)", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 7);
    f.game.selectPlanet(f.sim, planet(4));
    Planet* p = f.sim.db().get<Planet>(planet(4));
    const auto sites = f.sim.db().allOf<Site>(ObjType::Site);
    REQUIRE(sites.size() == p->siteIds.size());
    REQUIRE(p->field14 == static_cast<int16_t>(sites.size()));
    for (size_t i = 0; i < sites.size(); ++i) {
        REQUIRE(sites[i]->owner == p->self);
        REQUIRE(sites[i]->name == "Site " + std::to_string(i + 1));
        REQUIRE(sites[i]->mineSites.size() == size_t{sites[i]->visibleMines} + sites[i]->hiddenMines);
    }
}

TEST_CASE("A new game round-trips through a save", "[newgame][saves]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 7);
    f.game.selectPlanet(f.sim, planet(4));
    const std::vector<uint8_t> bytes = writeOps(f.sim);
    data::OpsSave save;
    REQUIRE(save.parse(bytes));
    Simulation back(gameData());
    OpsLoadInfo info;
    std::string err;
    const bool ok = loadOps(back, save, &info, &err);
    INFO(err);
    REQUIRE(ok);
    REQUIRE(back.galaxy().children == f.sim.galaxy().children);
    REQUIRE(back.db().get<Planet>(planet(4))->name == "Sigma Draconis 4");
    // Hidden mine sites are not saved (rec+0x1C): only the revealed remain.
    for (Site* s : back.db().allOf<Site>(ObjType::Site)) {
        const Site* orig = f.sim.db().get<Site>(s->self);
        REQUIRE(s->mineSites.size() == orig->visibleMines);
        REQUIRE(s->hiddenMines == 0);
    }
    REQUIRE(writeOps(back, info.extras) == bytes);
}

TEST_CASE("The view's disaster calendar (s3:E9E4)", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    static constexpr int32_t kBase[9] = {0, 250, 350, 450, 450, 550, 650, 115, 150};
    const auto& cal = f.sim.disasterSchedule();
    for (size_t i = 1; i < 9; ++i) {
        const auto v = static_cast<int32_t>(cal[i]);
        REQUIRE(v >= kBase[i] - 29);
        REQUIRE(v <= kBase[i] + 29);
    }
    // A loaded game makes its view too: TUTOR.OPS gets a calendar.
    data::GameFiles files;
    REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
    data::OpsSave save;
    REQUIRE(save.parse(*files.read("TUTOR.OPS")));
    Simulation loaded(gameData());
    REQUIRE(loadOps(loaded, save));
    for (size_t i = 1; i < 9; ++i) REQUIRE(loaded.disasterSchedule()[i] != Simulation::kNever);
}

TEST_CASE("The planet chosen becomes the view's planet (s7:538A)", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 4);                              // Epsilon Eridani: templates 2, 9
    f.game.selectPlanet(f.sim, planet(2));                    // template 9, hostility 4
    REQUIRE(f.sim.planetHostility() == 4);
    REQUIRE(f.sim.terraforming().turnsLeft == 10000);
}

TEST_CASE("The Seed lands and deploys its parts (s6:2F18)", "[newgame]") {
    Fresh f;
    f.game.start(f.sim);
    f.game.selectStar(f.sim, 7);
    f.game.selectPlanet(f.sim, planet(4));
    const sim::Site* site = f.sim.db().allOf<Site>(ObjType::Site).front();
    const Handle siteH = site->self;
    // A cell whose 3 x 3 block takes the Seed.
    sim::Building* seed = nullptr;
    for (int16_t y = 10; y < 140 && !seed; y += 3)
        for (int16_t x = 10; x < 290 && !seed; x += 3)
            seed = f.sim.playerPutBuilding(siteH, {x, y, 0}, 10, Handle::make(ObjType::Colony, 1));
    REQUIRE(seed);
    const Tile* st = seed->tile(f.sim);
    const int16_t x = st->x, y = st->y;
    Colony* c = f.sim.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    REQUIRE(c);
    REQUIRE(c->player == Handle::make(ObjType::Player, 1));          // the colony ctor's default
    f.game.selectSite(f.sim, siteH);
    for (int i = 0; i < 40 && seed->state != sim::Building::kOperational; ++i) f.sim.runTurns(1);
    REQUIRE(seed->state == sim::Building::kOperational);
    const sim::Grid* g = f.sim.gridOfSite(siteH);
    auto typeAt = [&](int dx, int dy) {
        const Tile* t = f.sim.db().get<Tile>(g->tileAt({int16_t(x + dx), int16_t(y + dy), 0}));
        const sim::Building* b = t ? f.sim.db().get<sim::Building>(t->building) : nullptr;
        return b ? b->type : uint16_t{0};
    };
    REQUIRE(typeAt(-1, -1) == 13);
    REQUIRE(typeAt(1, 1) == 12);
    REQUIRE(typeAt(-1, 1) == 14);
    REQUIRE(typeAt(1, -1) == 11);
    REQUIRE(typeAt(0, -1) == 122);
    REQUIRE(typeAt(1, 0) == 122);
    REQUIRE(typeAt(0, 1) == 122);
    REQUIRE(typeAt(-1, 0) == 122);
    REQUIRE(c->hub == g->tileAt({int16_t(x + 1), int16_t(y - 1), 0}));   // the SeedCommand
}
