// Map and site model (Milestone 4): findings/10-map.md.

#include <catch2/catch_test_macros.hpp>

#include "data/game_files.hpp"
#include "data/ops_save.hpp"
#include "sim/building.hpp"
#include "sim/events.hpp"
#include "sim/map.hpp"
#include "sim/vehicles.hpp"
#include "sim/ops_loader.hpp"
#include "sim/ops_writer.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <memory>
#include <set>

using namespace outpost;
using namespace outpost::sim;

namespace {

struct Loaded {
    data::GameFiles files;
    GameData data;
    data::OpsSave save;
    std::unique_ptr<Simulation> sim;

    Loaded() {
        std::string err;
        REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
        REQUIRE(data.load(files, &err));
        const auto bytes = files.read("TUTOR.OPS");
        REQUIRE(bytes);
        REQUIRE(save.parse(*bytes));
        sim = std::make_unique<Simulation>(data);
        OpsLoadInfo info;
        const bool ok = loadOps(*sim, save, &info, &err);
        INFO(err);
        REQUIRE(ok);
    }
};

Loaded& tutor() {
    static Loaded t;
    return t;
}

} // namespace

TEST_CASE("Bitmap catalog and the 70 sites from OUTPOST.EXE", "[map]") {
    const GameData& d = tutor().data;
    REQUIRE(d.bitmaps.name(347) == "500a.bmp");         // s3:830A: entry (id + 1) * 16
    REQUIRE(d.bitmaps.name(277) == "500.bmp");
    REQUIRE(d.bitmaps.kind(347) == 1);
    REQUIRE(d.sites.size() == 70);
    REQUIRE(d.sites[0].x == 0);
    REQUIRE(d.sites[0].y == -60);
    REQUIRE(d.sites[0].terrainId == 347);
    REQUIRE(d.sites[0].pictureId == 277);
    REQUIRE(d.sites[17].x == 0);                         // pushed as a short immediate
    REQUIRE(d.sites[17].terrainId == 364);
    REQUIRE(d.sites[69].terrainId == 416);
    // The sites use the 300x150 maps 500..579 without 529, 530, 533..540:
    // the ten "buildings without a sprite" of the remaster were never
    // building sprites.
    std::set<std::string> names;
    for (const auto& s : d.sites) names.insert(d.bitmaps.name(s.terrainId));
    REQUIRE(names.size() == 70);
    for (const char* n : {"529a.bmp", "530a.bmp", "533a.bmp", "540a.bmp"}) REQUIRE(names.count(n) == 0);
    REQUIRE(names.count("579a.bmp") == 1);
    for (size_t i = 0; i < d.sites.size(); ++i) {
        const auto* t = d.terrainOfSite(static_cast<uint16_t>(i));
        REQUIRE(t);
        REQUIRE(t->width == 300);
        REQUIRE(t->height == 150);
    }
}

TEST_CASE("Grid terrain: surface pixel + 1, underground 7/8/9", "[map]") {
    REQUIRE(Grid::terrainType(0, 0) == 1);
    REQUIRE(Grid::terrainType(3, 0) == 4);
    REQUIRE(Grid::terrainType(0, 1) == 7);               // s7:8C66
    REQUIRE(Grid::terrainType(1, 2) == 8);
    REQUIRE(Grid::terrainType(2, 3) == 8);
    REQUIRE(Grid::terrainType(3, 4) == 9);

    const data::IndexedBitmap* t = tutor().data.terrainOfSite(0);
    REQUIRE(t);
    Grid g(Handle::make(ObjType::Site, 1), 0, t);
    const MapCell c{10, 20, 0};
    REQUIRE(g.value(c) == Grid::terrainType(t->at(10, 20), 0));
    REQUIRE_FALSE(g.tileAt(c));
    const Handle tile = Handle::make(ObjType::Tile, 7);
    g.setTile(c, tile);
    REQUIRE(g.tileAt(c) == tile);
    REQUIRE(g.value(c) == tile.value);
    REQUIRE_FALSE(g.tileAt({10, 20, 1}));                // levels are separate
    REQUIRE(g.value({10, 20, 1}) >= 7);
    REQUIRE_FALSE(g.inside({300, 0, 0}));
    REQUIRE_FALSE(g.inside({0, 0, 5}));
}

TEST_CASE("TUTOR.OPS: every tile is on its site's grid", "[map][saves]") {
    Simulation& sim = *tutor().sim;
    size_t tiles = 0;
    for (Tile* t : sim.db().allOf<Tile>(ObjType::Tile)) {
        const Site* site = sim.db().get<Site>(t->owner);
        REQUIRE(site);
        Grid* g = sim.gridOfSite(t->owner);
        REQUIRE(g);
        REQUIRE(g->width() == 300);
        REQUIRE(g->height() == 150);
        INFO("tile at " << t->x << "," << t->y << "," << t->level);
        REQUIRE(g->tileAt({t->x, t->y, t->level}) == t->self);
        ++tiles;
    }
    REQUIRE(tiles == 194);
    REQUIRE(sim.map().grids().size() == 1);
}

TEST_CASE("Incidents near the map edge", "[map][event]") {
    // A colony on a 300x150 site: neighbours are clamped to x 0..299 and, by
    // mistake, y 0..299 too (Q51).
    auto run = [](bool withSite, int16_t x, int16_t y, int16_t nx, int16_t ny) {
        Simulation sim(tutor().data);
        Player& p = sim.createPlayer();
        Colony& c = sim.createColony(p.self);
        c.freeResources = true;
        if (withSite) {
            Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
            site.mapSize = {300, 150, 1};
            c.owner = site.self;
        }
        Tile& t = sim.createTile(c, x, y, 0);
        Building& lab = sim.createBuilding(t, 40);
        lab.setState(sim, Building::kOperational);
        Tile& n = sim.createTile(c, nx, ny, 0);
        Building& dome = sim.createBuilding(n, 27);
        dome.setState(sim, Building::kOperational);
        sim.enqueue(makeIncidentStep(c.self, lab.self, true));
        sim.runTurns(1);
        REQUIRE(lab.state == Building::kWrecked);
        return dome.state == Building::kWrecked;
    };
    REQUIRE_FALSE(run(true, 0, 5, -1, 5));       // x is clamped at 0 (s6:6B40)
    REQUIRE(run(false, 299, 5, 300, 5));         // no site: no upper bound (I9)
    REQUIRE_FALSE(run(true, 299, 5, 300, 5));    // ... and at width - 1
    REQUIRE(run(true, 5, 149, 5, 150));          // y is clamped with the width (Q51)
    REQUIRE(run(true, 0, 5, 1, 5));              // ordinary neighbour
}

TEST_CASE("SCInternalPutBldg on the map: new tiles and new colonies", "[map][construct]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;                                           // terrain 500a.bmp
    site.mapSize = {300, 150, 1};
    const data::IndexedBitmap* t = tutor().data.terrainOfSite(0);
    REQUIRE(t);

    // A Seed on an empty cell: a new tile, and a new colony around it.
    Building* seed = sim.putBuildingAt(site.self, {120, 60, 0}, 10, Handle{}, p.self);
    REQUIRE(seed);
    Tile* tile = seed->tile(sim);
    REQUIRE(tile);
    REQUIRE(tile->owner == site.self);
    REQUIRE(tile->mark12 == Grid::terrainType(t->at(120, 60), 0));   // s7:684C
    REQUIRE(tile->mark14 == 1);                  // 5 (s6:8B37), then the Seed marks it (s6:09B8)
    Colony* colony = sim.db().get<Colony>(tile->colony);
    REQUIRE(colony);
    REQUIRE(colony->owner == site.self);
    REQUIRE(colony->hub == tile->self);                              // s6:EDC4
    REQUIRE(colony->player == p.self);
    REQUIRE(colony->tiles.contains(tile->self));
    REQUIRE(sim.gridOfSite(site.self)->tileAt({120, 60, 0}) == tile->self);
    REQUIRE(seed->state == Building::kConstructing);

    // Another building on the same cell reuses the tile.
    const Handle oldSeed = seed->self;
    Building* dome = sim.putBuildingAt(site.self, {120, 60, 0}, 27, colony->self);
    REQUIRE(dome->tile(sim) == tile);
    sim.runTurns(1);
    REQUIRE_FALSE(sim.db().get<Building>(oldSeed));                  // SCKillBldg

    // An ordinary building on a new cell joins the colony.
    Building* lab = sim.putBuildingAt(site.self, {121, 60, 0}, 40, colony->self);
    REQUIRE(lab->tile(sim)->colony == colony->self);
    REQUIRE(colony->tiles.contains(lab->tile(sim)->self));

    // A Command founds a new colony and remembers its parent.
    auto* cmd = static_cast<CommandCenterBuilding*>(sim.putBuildingAt(site.self, {200, 30, 0}, 55, colony->self));
    REQUIRE(cmd);
    const Colony* fresh = sim.db().get<Colony>(cmd->tile(sim)->colony);
    REQUIRE(fresh);
    REQUIRE(fresh != colony);
    REQUIRE(cmd->field20 == static_cast<int32_t>(colony->self.value));

    // Underground: terrain 7..9 and the mark 6.
    Building* ug = sim.putBuildingAt(site.self, {120, 60, 2}, 79, colony->self);
    REQUIRE(ug->tile(sim)->mark14 == 6);
    REQUIRE(ug->tile(sim)->mark12 >= 7);
    REQUIRE(ug->tile(sim)->mark12 <= 9);
}

TEST_CASE("RoboDozer: borrows a Dozer, bulldozes the cell, gives it back", "[map][robots]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    c.freeResources = true;
    auto* rc = static_cast<RoboCmdBuilding*>(sim.putBuildingAt(site.self, {103, 50, 0}, 56, c.self));   // outside the Seed's parts (s6:2F18)
    rc->setState(sim, Building::kOperational);
    rc->slots[0] = {100000, product::Dozer, 0, 0};
    c.roboCommands = {rc->tile(sim)->self};

    auto* dozer = static_cast<RobotBuilding*>(sim.putBuildingAt(site.self, {104, 50, 0}, 115, c.self));
    REQUIRE(dozer->state == 1);                                // s5:EA0E
    REQUIRE(dozer->turnsLeft == 2);                            // rough ground (mark 2): 2 turns (I59)
    REQUIRE(rc->slots[0].flag == 1);                           // s7:DF0C
    REQUIRE(rc->slots[0].field8 == dozer->tile(sim)->self.value);
    REQUIRE(c.linkedBusy[product::Dozer] == 1);
    const Handle cell = dozer->tile(sim)->self;

    dozer->constructTick(sim);                                 // s5:ED3C
    REQUIRE(sim.db().get<Building>(sim.db().get<Tile>(cell)->building)->type == 115);   // still at work
    dozer->constructTick(sim);
    const Tile* t = sim.db().get<Tile>(cell);
    REQUIRE(sim.db().get<Building>(t->building)->type == 5);   // bulldozed ground
    REQUIRE(t->mark14 == 5);
    REQUIRE(c.linkedBusy[product::Dozer] == 0);
    const Handle rcHandle = rc->self;
    sim.runTurns(1);                                           // SCKillBldg -> s7:CC44
    REQUIRE(sim.db().get<RoboCmdBuilding>(rcHandle) == rc);    // still standing
    REQUIRE(rc->slots[0].flag == 0);
    REQUIRE(rc->slots[0].field8 == 0);
}

TEST_CASE("Planet::genKids makes its sites with mine sites and DisMines", "[map][newgame]") {
    auto make = [](uint32_t seed, int difficulty) {
        auto sim = std::make_unique<Simulation>(tutor().data, seed);
        sim->setDifficulty(difficulty);
        Planet& planet = sim->db().create<Planet>(ObjType::Planet, Handle{});
        planet.hostility = 3;                       // 10..15 mine sites (s7:2F1A)
        planet.siteIds = {0, 5};
        sim->generateSites(planet);
        return sim;
    };
    auto sim = make(7, 3);
    const auto sites = sim->db().allOf<Site>(ObjType::Site);
    REQUIRE(sites.size() == 2);
    const Planet* planet = sim->db().allOf<Planet>(ObjType::Planet).front();
    REQUIRE(planet->field14 == 2);                                   // s7:2A98
    REQUIRE(planet->children.size() == 2);
    REQUIRE(sites[0]->name == "Site 1");
    REQUIRE(sites[1]->name == "Site 2");
    REQUIRE(sites[1]->rec00 == 5);
    for (const Site* s : sites) {
        REQUIRE(s->mapSize.x == 300);
        REQUIRE(s->mapSize.y == 150);
        const int n = s->visibleMines + s->hiddenMines;
        REQUIRE(s->mineSites.size() == static_cast<size_t>(n));
        // visible = 60% of n, hidden = 10% of n, with n in 10..15
        REQUIRE(s->hiddenMines == 1);
        REQUIRE(s->visibleMines >= 6);
        REQUIRE(s->visibleMines <= 9);
        const Grid* g = sim->map().grid(s->self);
        REQUIRE(g);
        for (int i = 0; i < s->visibleMines; ++i) {
            const Pos3& p = s->mineSites[static_cast<size_t>(i)];
            const Tile* t = sim->db().get<Tile>(g->tileAt({p.x, p.y, 0}));
            REQUIRE(t);
            REQUIRE(sim->db().get<Building>(t->building)->type == 16);   // DisMine (s7:8D08)
        }
        const Pos3& hidden = s->mineSites.back();
        REQUIRE_FALSE(g->tileAt({hidden.x, hidden.y, 0}));
    }
    // The same seed draws the same sites.
    auto again = make(7, 3);
    REQUIRE(again->db().allOf<Site>(ObjType::Site)[1]->mineSites.front() == sites[1]->mineSites.front());
}

TEST_CASE("The player's placement rules (slot 7, base)", "[map][place]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    const Handle colony = seed->tile(sim)->colony;
    auto ground = [&](int16_t x, int16_t y) { sim.putBuildingAt(site.self, {x, y, 0}, 5, colony); };
    sim.putBuildingAt(site.self, {110, 50, 0}, 123, colony);       // LPipe
    ground(110, 51);
    auto dome = makeBuilding(27);
    auto check = [&](int16_t x, int16_t y) {
        sim.placeMessage() = {};
        return dome->canPlace(sim, {x, y, 0}, colony, site.self);
    };
    REQUIRE(check(110, 51));                                         // ground, hub 11 away, tube above
    REQUIRE_FALSE(check(120, 60));                                   // raw terrain (s6:C7B6)
    REQUIRE(sim.placeMessage().id == 1704);
    sim.putBuildingAt(site.self, {140, 50, 0}, 123, colony);
    ground(140, 51);
    REQUIRE_FALSE(check(140, 51));                                   // 41 from the hub (s6:C522)
    REQUIRE(sim.placeMessage().id == 1718);
    REQUIRE(sim.placeMessage().arg == 11);
    ground(105, 55);
    REQUIRE_FALSE(check(105, 55));                                   // no tube beside it (s6:C64A)
    REQUIRE(sim.placeMessage().id == 0);
}

TEST_CASE("SCPutBldg and the class-specific placement rules", "[map][place]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    const Handle colony = seed->tile(sim)->colony;
    // Find an empty surface cell of terrain 1..3 near a given spot.
    auto open = [&](int16_t x, int16_t y) {
        for (int16_t dx = 0; dx < 40; ++dx) {
            const MapCell c{int16_t(x + dx), y, 0};
            const uint16_t k = sim.cellKind(site.self, c);
            if (k >= 1 && k <= 3) return c;
        }
        FAIL("no open cell");
        return MapCell{};
    };

    // A lander must come down within 5 of the hub (s6:09D4).
    REQUIRE_FALSE(sim.playerPutBuilding(site.self, open(110, 50), 62, colony));
    REQUIRE(sim.placeMessage().id == 1717);
    const MapCell near = open(102, 52);
    if (std::abs(near.x - 100) + 2 <= 5) {
        REQUIRE(sim.playerPutBuilding(site.self, near, 62, colony));
        REQUIRE(sim.placeMessage().id == 0);
    }
    // A Command center too close to an existing hub (s7:C52E).
    REQUIRE_FALSE(sim.playerPutBuilding(site.self, open(110, 60), 55, colony));
    REQUIRE(sim.placeMessage().id == 1710);
    REQUIRE(sim.playerPutBuilding(site.self, open(160, 60), 55, colony));
    // The UG geothermal plant can never be put down (s6:567C, Q55); no rule
    // leaves a message, so SCPutBldg reports 1709.
    sim.putBuildingAt(site.self, {100, 52, 1}, 9, colony);
    REQUIRE_FALSE(sim.playerPutBuilding(site.self, {100, 52, 1}, 110, colony));
    REQUIRE(sim.placeMessage().id == 1709);
    // A road needs no tube (s7:DB72) and only the hub's site (s7:DB92).
    sim.putBuildingAt(site.self, {130, 70, 0}, 5, colony);
    REQUIRE(makeBuilding(76)->canPlace(sim, {130, 70, 0}, colony, site.self));
    REQUIRE_FALSE(makeBuilding(27)->canPlace(sim, {130, 70, 0}, colony, site.self));   // 41 away
}

TEST_CASE("RoboDigger digs a shaft down", "[map][robots]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    auto* rc = static_cast<RoboCmdBuilding*>(sim.putBuildingAt(site.self, {103, 50, 0}, 56, c.self));   // outside the Seed's parts (s6:2F18)
    rc->setState(sim, Building::kOperational);
    rc->slots[0] = {100000, product::Digger, 0, 0};
    c.roboCommands = {rc->tile(sim)->self};

    auto* digger = static_cast<RobotBuilding*>(sim.putBuildingAt(site.self, {103, 52, 0}, 116, c.self));
    REQUIRE(digger->state == 2);                                  // s5:DA3C
    REQUIRE(c.linkedBusy[product::Digger] == 1);
    REQUIRE(rc->slots[0].flag == 1);
    digger->word24 = 1;                                           // down (the player's choice, slot 7)
    digger->digOnStateEntered(sim);
    REQUIRE(digger->turnsLeft > 0);
    const Handle cell = digger->tile(sim)->self;
    for (int i = 0; i < 20 && sim.db().get<Building>(sim.db().get<Tile>(cell)->building)->type == 116; ++i)
        static_cast<RobotBuilding*>(sim.db().get<Building>(sim.db().get<Tile>(cell)->building))->constructTick(sim);
    REQUIRE(sim.db().get<Building>(sim.db().get<Tile>(cell)->building)->type == 71);   // Core (s5:E39C)
    REQUIRE(site.depth == 1);                                                          // s7:5B3E
    const Tile* below = sim.db().get<Tile>(sim.gridOfSite(site.self)->tileAt({103, 52, 1}));
    REQUIRE(below);
    REQUIRE(sim.db().get<Building>(below->building)->type == 106);                     // UGCore
    REQUIRE(c.linkedBusy[product::Digger] == 0);
}

TEST_CASE("RoboMine sinks a shaft under a DisMine", "[map][robots]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    sim.putBuildingAt(site.self, {104, 50, 0}, 16, c.self);                  // DisMine

    std::unique_ptr<Building> probe = makeBuilding(117);
    REQUIRE(probe->canPlace(sim, {104, 50, 0}, c.self, site.self));
    REQUIRE_FALSE(probe->canPlace(sim, {106, 50, 0}, c.self, site.self));
    REQUIRE(sim.placeMessage().id == 1706);

    auto* miner = static_cast<RobotBuilding*>(sim.putBuildingAt(site.self, {104, 50, 0}, 117, c.self));
    REQUIRE(miner->state == 2);
    REQUIRE(c.linkedBusy[product::Miner] == 1);
    miner->onStateEntered(sim);
    REQUIRE(miner->turnsLeft == 7);                                          // s6:1B1E
    const Handle cell = miner->tile(sim)->self;
    for (int i = 0; i < 7; ++i) miner->constructTick(sim);
    REQUIRE(sim.db().get<Building>(sim.db().get<Tile>(cell)->building)->type == 51);
    const Tile* below = sim.db().get<Tile>(sim.gridOfSite(site.self)->tileAt({104, 50, 1}));
    REQUIRE(below);
    REQUIRE(sim.db().get<Building>(below->building)->type == 96);
    REQUIRE(site.depth == 1);
    REQUIRE(c.linkedBusy[product::Miner] == 0);
}

TEST_CASE("RoboDigger placement rules", "[map][robots]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    sim.putBuildingAt(site.self, {104, 50, 0}, 16, c.self);

    std::unique_ptr<Building> digger = makeBuilding(116);
    REQUIRE_FALSE(digger->canPlace(sim, {104, 50, 0}, c.self, site.self));
    REQUIRE(sim.placeMessage().id == 1705);
    // Underground the range is 30 from the hub (s5:DB86).
    REQUIRE_FALSE(digger->inRangeToPlace(sim, {140, 50, 1}, c.self, site.self));
    REQUIRE(sim.placeMessage().id == 1718);
    REQUIRE(sim.placeMessage().arg == 10);
    REQUIRE(digger->inRangeToPlace(sim, {140, 50, 0}, c.self, site.self));
}

TEST_CASE("Monorail pieces join by axis", "[map][placement]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    sim.putBuildingAt(site.self, {110, 50, 0}, 22, c.self);                 // vertical piece
    std::unique_ptr<Building> rail = makeBuilding(23);
    REQUIRE(rail->connectsToPlace(sim, {110, 51, 0}, site.self));          // below a 22
    REQUIRE_FALSE(rail->connectsToPlace(sim, {111, 50, 0}, site.self));    // beside a 22
    sim.putBuildingAt(site.self, {120, 50, 0}, 24, c.self);                 // crossing
    REQUIRE(rail->connectsToPlace(sim, {121, 50, 0}, site.self));
    std::unique_ptr<Building> station = makeBuilding(63);
    REQUIRE_FALSE(station->connectsToPlace(sim, {121, 50, 0}, site.self)); // Q58: not by the crossing
    REQUIRE(station->inRangeToPlace(sim, {200, 50, 0}, c.self, site.self));
}

TEST_CASE("Truck route carries smelter output to a tank", "[map][vehicles]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    auto firstOf = [&](int group) {
        for (uint16_t t = 1; t < 128; ++t)
            if (sim.data().groups.contains(group, t) && makeBuilding(t)) return t;
        return uint16_t(0);
    };
    auto* smelter = dynamic_cast<SmelterBuilding*>(sim.putBuildingAt(site.self, {104, 50, 0}, firstOf(1), c.self));
    REQUIRE(smelter);
    Building* tank = sim.putBuildingAt(site.self, {110, 52, 0}, firstOf(3), c.self);
    REQUIRE(tank);
    Tile& home = *smelter->tile(sim);
    home.field32 = 10;
    home.trucks = 2;
    home.route = {tank->tile(sim)->self};
    smelter->output.set(14, 150);

    dispatchRoutes(sim, c);
    REQUIRE(sim.trips().size() == 1);                 // each entry is visited once a turn
    REQUIRE(home.trucks == 1);
    REQUIRE(smelter->output.get(14) == 50);
    for (int i = 0; i < 200 && !sim.trips().empty(); ++i) moveTrips(sim);
    REQUIRE(sim.trips().empty());
    REQUIRE(tank->tile(sim)->bas.get(14) == 100);
    REQUIRE(home.trucks == 2);
}

TEST_CASE("A monorail train carries a waiting trip between stations", "[map][vehicles]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    REQUIRE(sim.data().groups.contains(0x42, 23));
    REQUIRE(sim.data().groups.contains(0x40, 63));
    Building* a = sim.putBuildingAt(site.self, {120, 60, 0}, 63, c.self);
    for (int16_t x = 121; x <= 124; ++x) sim.putBuildingAt(site.self, {x, 60, 0}, 23, c.self);
    Building* b = sim.putBuildingAt(site.self, {125, 60, 0}, 63, c.self);
    const Handle aTile = a->tile(sim)->self, bTile = b->tile(sim)->self;
    addTrain(sim, aTile);

    Trip trip;
    trip.home = seed->tile(sim)->self;
    trip.bas = 14;
    trip.quantity = 50;
    trip.trucks = 1;
    Trip& t = startTrip(sim, std::move(trip));
    t.pos = {120, 60, 0};
    t.next = aTile;
    t.route = {bTile};
    t.waiting = 1;
    static_cast<MonoStationBuilding*>(a)->waiting.push_back(&t);

    for (int i = 0; i < 10 && !sim.trips().empty(); ++i) moveTrips(sim);
    REQUIRE(sim.trips().empty());                                   // delivered
    REQUIRE(b->tile(sim)->bas.get(14) == 50);
}

TEST_CASE("A Tokamak puts its underground part below", "[map][placement]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    REQUIRE(sim.data().groups.contains(41, 20));
    sim.putBuildingAt(site.self, {106, 52, 0}, 20, c.self);                   // Tokamak (s6:4DB2)
    const Tile* below = sim.db().get<Tile>(sim.gridOfSite(site.self)->tileAt({106, 52, 1}));
    REQUIRE(below);
    REQUIRE(sim.db().get<Building>(below->building)->type == 98);             // UG Tokamak
    REQUIRE(site.depth >= 1);
}

TEST_CASE("A new Command center is founded by its parent colony", "[map][placement]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {60, 50, 0}, 10, Handle{}, p.self);
    Colony& parent = *sim.db().get<Colony>(seed->tile(sim)->colony);
    parent.population.addColonists(50);
    parent.addTotal(1000, 17);
    const int32_t peopleBefore = parent.population.total();
    REQUIRE(sim.data().commandKit[17] == 100);                               // DGROUP 0x580E table
    Building* cc = sim.playerPutBuilding(site.self, {120, 50, 0}, 55, parent.self);
    REQUIRE(cc);
    Colony& fresh = *sim.db().get<Colony>(cc->tile(sim)->colony);
    REQUIRE(fresh.self != parent.self);
    REQUIRE(fresh.population.total() == 2);                                  // s7:3694 group 3, 2 people
    REQUIRE(parent.population.total() == peopleBefore - 2);
    REQUIRE(cc->tile(sim)->bas.get(17) == 100);                              // the kit on the new tile
    REQUIRE(countUnits(sim, *cc->tile(sim), product::Truck) == 2);           // s7:7C50
}

TEST_CASE("A robot marked for return comes back as a kit", "[map][robots]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    REQUIRE(c.self == Handle::make(ObjType::Colony, 1));
    auto* rc = static_cast<RoboCmdBuilding*>(sim.putBuildingAt(site.self, {103, 50, 0}, 56, c.self));   // outside the Seed's parts (s6:2F18)
    rc->setState(sim, Building::kOperational);
    auto* wh = static_cast<WarehouseBuilding*>(sim.putBuildingAt(site.self, {102, 50, 0}, 58, c.self));
    wh->setState(sim, Building::kOperational);
    const Handle work = sim.putBuildingAt(site.self, {104, 52, 0}, 5, c.self)->tile(sim)->self;
    rc->slots[0] = {100000, product::Dozer, 4, work.value};                 // flag 4: return as a kit
    REQUIRE(rc->returnRobot(sim, 1, work, product::Dozer) == 1);           // s7:CC44
    REQUIRE(rc->slots[0].item == 0);
    REQUIRE(wh->quantityOfA(product::Dozer) == 1);                          // s7:CD2D
}

TEST_CASE("A surface mine runs dry without a shaft below", "[map][mines]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    Building* lone = sim.putBuildingAt(site.self, {104, 50, 0}, 51, c.self);
    Building* shafted = sim.putBuildingAt(site.self, {108, 50, 0}, 51, c.self);
    Building* ug = sim.putBuildingAt(site.self, {108, 50, 1}, 96, c.self);
    for (Building* b : {lone, shafted, ug}) b->setState(sim, Building::kOperational);
    lone->resume(sim);                                                      // s6:1556: nothing below
    shafted->resume(sim);                                                   // a working UG mine below
    REQUIRE(lone->state == Building::kExhausted);
    REQUIRE(shafted->state != Building::kExhausted);
}

TEST_CASE("Buildings change sides with their colony", "[map][population]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    auto* wh = static_cast<WarehouseBuilding*>(sim.putBuildingAt(site.self, {102, 50, 0}, 58, c.self));
    wh->items.push_back({product::Truck, 0, 3, 18});
    auto* lab = static_cast<LabBuilding*>(sim.putBuildingAt(site.self, {104, 50, 0}, 40, c.self));
    lab->topic = 5;
    Tile& wt = *wh->tile(sim);
    wt.bas.set(14, 99);
    wt.route = {lab->tile(sim)->self};
    handOver(sim, *wh, c);                                                   // s6:61C4
    handOver(sim, *lab, c);                                                  // s7:C74E
    REQUIRE(wh->items.empty());
    REQUIRE(wt.bas.get(14) == 0);                                            // s7:7296
    REQUIRE(wt.route.empty());                                               // s7:6D80
    REQUIRE(lab->topic == 112);
    REQUIRE(wh->tag1C == c.player.value);
}

TEST_CASE("The rebels land their own Seed when the player lands", "[map][rebels]") {
    Simulation sim(tutor().data);
    sim.createPlayer();
    sim.createPlayer();                                                      // the rebels, player 2
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.playerPutBuilding(site.self, {60, 50, 0}, 10, Handle{});
    REQUIRE(seed);
    const Colony* rebels = sim.db().get<Colony>(Handle::make(ObjType::Colony, 2));   // s5:B872
    REQUIRE(rebels);
    REQUIRE(rebels->player == kRebelPlayer);
    const Tile* hub = sim.db().get<Tile>(rebels->hub);
    REQUIRE(hub);
    REQUIRE(std::abs(hub->x - 60) + std::abs(hub->y - 50) > 100);           // s5:B482
    REQUIRE(sim.data().rebelResponses[2][15].count == -1);                  // Hard copies a SpacePort
    REQUIRE(sim.data().rebelResponses[1][20].count == 0);
}

namespace {
// A colony with an operational RoboCmd lending one robot of `kind`.
Colony& colonyWithRobot(Simulation& sim, Site& site, uint16_t kind) {
    Player& p = sim.createPlayer();
    site.rec00 = 0;
    site.mapSize = {300, 150, 1};
    Building* seed = sim.putBuildingAt(site.self, {100, 50, 0}, 10, Handle{}, p.self);
    Colony& c = *sim.db().get<Colony>(seed->tile(sim)->colony);
    auto* rc = static_cast<RoboCmdBuilding*>(sim.putBuildingAt(site.self, {103, 50, 0}, 56, c.self));   // outside the Seed's parts (s6:2F18)
    rc->setState(sim, Building::kOperational);
    rc->slots[0] = {100000, kind, 0, 0};
    c.roboCommands = {rc->tile(sim)->self};
    return c;
}

MapCell findCell(Simulation& sim, Handle site, std::initializer_list<uint16_t> kinds) {
    for (int16_t y = 40; y < 70; ++y)
        for (int16_t x = 90; x < 125; ++x)
            for (uint16_t k : kinds) {
                // Not on the Seed's parts (99..101, 49..51) or the RoboCmd (103, 50).
                if ((x >= 98 && x <= 104 && y >= 48 && y <= 52)) continue;
                if (sim.cellKind(site, {x, y, 0}) == k) return {x, y, 0};
            }
    return {-1, -1, 0};
}
} // namespace

TEST_CASE("The player's RoboDozer goes down on rough ground", "[map][robots]") {
    Simulation sim(tutor().data);
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    Colony& c = colonyWithRobot(sim, site, product::Dozer);
    const MapCell cell = findCell(sim, site.self, {1, 2, 3});
    REQUIRE(cell.x >= 0);
    Building* dozer = sim.playerPutBuilding(site.self, cell, 115, c.self);   // s5:EA20
    REQUIRE(dozer);
    REQUIRE_FALSE(sim.playerPutBuilding(site.self, cell, 115, c.self));     // a robot is there
    REQUIRE(sim.placeMessage().id == 1712);
    // A building: the question (s9:8520) answered No refuses, Yes dozes.
    const Handle rcTile = c.roboCommands[0];
    const MapCell rcCell{sim.db().get<Tile>(rcTile)->x, sim.db().get<Tile>(rcTile)->y, 0};
    REQUIRE_FALSE(sim.playerPutBuilding(site.self, rcCell, 115, c.self, 0, false));
    REQUIRE(sim.placeMessage().id == 1512);
    REQUIRE(sim.db().get<Building>(sim.db().get<Tile>(rcTile)->building)->type == 56);
}

TEST_CASE("The player's RoboDigger digs down and deepens the site", "[map][robots]") {
    Simulation sim(tutor().data);
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    Colony& c = colonyWithRobot(sim, site, product::Digger);
    const MapCell cell = findCell(sim, site.self, {1, 2, 3, 5});
    REQUIRE(cell.x >= 0);
    sim.putBuildingAt(site.self, {int16_t(cell.x + 1), cell.y, 0}, 122, c.self);   // a tube beside it
    auto* digger = static_cast<RobotBuilding*>(sim.playerPutBuilding(site.self, cell, 116, c.self));
    INFO("message " << sim.placeMessage().id << " at " << cell.x << "," << cell.y);
    REQUIRE(digger);
    REQUIRE(digger->word24 == 1);                                  // the candidate's direction
    REQUIRE(digger->turnsLeft > 0);
    const Handle t = digger->tile(sim)->self;
    for (int i = 0; i < 20 && sim.db().get<Building>(sim.db().get<Tile>(t)->building)->type == 116; ++i)
        static_cast<RobotBuilding*>(sim.db().get<Building>(sim.db().get<Tile>(t)->building))->constructTick(sim);
    REQUIRE(sim.db().get<Building>(sim.db().get<Tile>(t)->building)->type == 71);
    REQUIRE(site.depth == 1);
}

TEST_CASE("The player's UG RoboDigger digs sideways and stops", "[map][robots]") {
    Simulation sim(tutor().data);
    Site& site = sim.db().create<Site>(ObjType::Site, Handle{});
    Colony& c = colonyWithRobot(sim, site, product::Digger);
    auto* rc = sim.db().get<RoboCmdBuilding>(sim.db().get<Tile>(c.roboCommands[0])->building);
    rc->slots[1] = {100001, product::Digger, 0, 0};
    const MapCell cell = findCell(sim, site.self, {1, 2, 3, 5});
    sim.putBuildingAt(site.self, {int16_t(cell.x + 1), cell.y, 0}, 122, c.self);
    auto* digger = static_cast<RobotBuilding*>(sim.playerPutBuilding(site.self, cell, 116, c.self));
    REQUIRE(digger);
    for (int i = 0; i < 20 && site.depth == 0; ++i) sim.runTurns(1);
    REQUIRE(site.depth == 1);
    const MapCell side{int16_t(cell.x + 1), cell.y, 1};
    INFO("kind " << sim.cellKind(site.self, side));
    auto* ug = static_cast<RobotBuilding*>(sim.playerPutBuilding(site.self, side, 120, c.self, 4));
    INFO("message " << sim.placeMessage().id);
    REQUIRE(ug);
    INFO("turns " << ug->turnsLeft << " state " << ug->state);
    const Handle t = ug->tile(sim)->self;
    int turns = 0;
    for (; turns < 30 && sim.db().get<Building>(sim.db().get<Tile>(t)->building)->type == 120; ++turns) sim.runTurns(1);
    REQUIRE(turns < 30);
    // The tunnel piece (121) put one cell on (s5:E294) finishes too.
    const Tile* next = sim.db().get<Tile>(sim.gridOfSite(site.self)->tileAt({int16_t(side.x + 1), side.y, 1}));
    REQUIRE(next);
    for (int i = 0; i < 30 && sim.db().get<Building>(next->building)->type == 121; ++i) sim.runTurns(1);
    INFO("next type " << sim.db().get<Building>(next->building)->type);
    REQUIRE(sim.db().get<Building>(next->building)->type != 121);
    // Down again from the UG Core (an air core, kind 0).
    REQUIRE(sim.db().get<RoboCmdBuilding>(rc->self) == rc);        // still standing
    rc->slots[2] = {100002, product::Digger, 0, 0};
    const MapCell core{cell.x, cell.y, 1};
    auto* down = static_cast<RobotBuilding*>(sim.playerPutBuilding(site.self, core, 120, c.self));
    INFO("down message " << sim.placeMessage().id << " max " << maxDigDepth(sim.planetHostility()));
    REQUIRE(down);
    REQUIRE(down->word24 == 1);
    const Handle dt = down->tile(sim)->self;
    int n = 0;
    for (; n < 30 && sim.db().get<Building>(sim.db().get<Tile>(dt)->building)->type == 120; ++n) sim.runTurns(1);
    // `down` is freed once it finishes (SCKillBldg): not touched after the loop.
    REQUIRE(n < 30);
    REQUIRE(site.depth == 2);
}

TEST_CASE("A robot's turns of work survive a save", "[map][robots][saves]") {
    Simulation sim(tutor().data);
    OpsLoadInfo info;
    std::string err;
    REQUIRE(loadOps(sim, tutor().save, &info, &err));
    const Colony& c = *sim.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    const Tile& hub = *sim.db().get<Tile>(c.hub);
    Building* dozer = nullptr;
    for (int16_t dx = 2; dx < 40 && !dozer; ++dx) {
        const MapCell p{int16_t(hub.x + dx), hub.y, 0};
        const uint16_t k = sim.cellKind(hub.owner, p);
        if (k >= 1 && k <= 3) dozer = sim.putBuildingAt(hub.owner, p, 115, c.self);
    }
    REQUIRE(dozer);
    dozer->turnsLeft = 3;                                    // +0x14 in state 1
    const MapCell at{dozer->tile(sim)->x, dozer->tile(sim)->y, 0};
    data::OpsSave save;
    REQUIRE(save.parse(writeOps(sim, info.extras)));
    Simulation back(tutor().data);
    OpsLoadInfo info2;
    REQUIRE(loadOps(back, save, &info2, &err));
    const Tile* t = back.db().get<Tile>(back.gridOfSite(hub.owner)->tileAt(at));
    REQUIRE(t);
    const Building* b = back.db().get<Building>(t->building);
    REQUIRE(b->type == 115);
    REQUIRE(b->turnsLeft == 3);
}

TEST_CASE("The player picks a factory's product", "[factory]") {
    Simulation sim(tutor().data);
    std::unique_ptr<Building> seedFact = makeBuilding(14);
    REQUIRE(factoryProducts(sim, *seedFact).empty());              // not operational
    seedFact->state = Building::kOperational;
    const auto list = factoryProducts(sim, *seedFact);              // s3:DEBE
    REQUIRE_FALSE(list.empty());
    REQUIRE(list.back() == 20);
    for (size_t i = 0; i + 1 < list.size(); ++i) REQUIRE((list[i] >= 1 && list[i] <= 4));
    REQUIRE(setFactoryProduct(sim, *seedFact, list.front()));       // s6:BB96
    REQUIRE(seedFact->opsProductA == list.front());
    REQUIRE(seedFact->opsAmount == 1);
    REQUIRE(seedFact->opsCycleTurns == 5);                           // s6:C724
    REQUIRE(setFactoryProduct(sim, *seedFact, 7));
    REQUIRE(seedFact->opsCycleTurns == 10);
}

TEST_CASE("A lab's topic counts its labs while unstarted", "[research]") {
    Simulation sim(tutor().data);
    Player& p = sim.createPlayer();
    uint16_t labType = 0;
    for (uint16_t t = 1; t < 138 && !labType; ++t)
        if (dynamic_cast<LabBuilding*>(makeBuilding(t).get())) labType = t;
    REQUIRE(labType != 0);
    auto a = makeBuilding(labType), b = makeBuilding(labType);
    auto* la = static_cast<LabBuilding*>(a.get());
    auto* lb = static_cast<LabBuilding*>(b.get());
    la->topic = lb->topic = 112;
    REQUIRE(p.remaining[50] == -1);
    setLabTopic(sim, *la, 50);                                   // s3:A5EC
    setLabTopic(sim, *lb, 50);
    REQUIRE(p.remaining[50] == -3);
    setLabTopic(sim, *lb, 112);
    REQUIRE(p.remaining[50] == -2);
}

#include "sim/ops_extensions.hpp"

TEST_CASE("Improved features keep their state in the extension chunk", "[saves]") {
    static uint32_t value = 0;
    registerExtension("test.value",
        [](const Simulation&) {
            if (value == 0) return std::vector<uint8_t>{};
            return std::vector<uint8_t>{uint8_t(value), uint8_t(value >> 8), uint8_t(value >> 16), uint8_t(value >> 24)};
        },
        [](Simulation&, std::span<const uint8_t> b) {
            value = b[0] | (b[1] << 8) | (uint32_t(b[2]) << 16) | (uint32_t(b[3]) << 24);
        });
    Simulation sim(tutor().data);
    OpsLoadInfo info;
    std::string err;
    REQUIRE(loadOps(sim, tutor().save, &info, &err));
    value = 0;                                                     // nothing to keep: no chunk
    data::OpsSave plain;
    REQUIRE(plain.parse(writeOps(sim, info.extras)));
    REQUIRE(plain.chunk(kExtensionChunk) == nullptr);
    value = 0x12345678;
    data::OpsSave save;
    REQUIRE(save.parse(writeOps(sim, info.extras)));
    REQUIRE(save.chunk(kExtensionChunk) != nullptr);
    value = 0;
    Simulation back(tutor().data);
    OpsLoadInfo info2;
    REQUIRE(loadOps(back, save, &info2, &err));
    REQUIRE(value == 0x12345678);
    value = 0;                                                     // leave no state for other tests
}

TEST_CASE("I110: lost sites come back and a Command Center founds a colony on one", "[map][improved]") {
    Simulation sim(tutor().data);
    OpsLoadInfo info;
    std::string err;
    REQUIRE(loadOps(sim, tutor().save, &info, &err));
    const Colony* c1 = sim.db().get<Colony>(Handle::make(ObjType::Colony, 1));
    REQUIRE(c1);
    const Site* home = sim.siteOf(*c1);
    REQUIRE(home);
    Planet* planet = sim.db().get<Planet>(home->owner);
    REQUIRE(planet);
    const size_t before = sim.db().allOf<Site>(ObjType::Site).size();
    const int made = sim.restoreSites(*planet);
    REQUIRE(made > 0);
    REQUIRE(sim.db().allOf<Site>(ObjType::Site).size() == before + size_t(made));
    REQUIRE(sim.restoreSites(*planet) == 0);                 // nothing more to make
    // Another site, its middle: a Command Center founds a colony there.
    const Site* other = nullptr;
    for (Handle h : planet->children)
        if (const Site* s = sim.db().get<Site>(h); s && s != home && sim.gridOfSite(s->self)) other = s;
    REQUIRE(other);
    const size_t colonies = sim.db().allOf<Colony>(ObjType::Colony).size();
    Building* cc = nullptr;
    for (int16_t dx = 0; dx < 40 && !cc; ++dx)
        cc = sim.playerPutBuilding(other->self, {int16_t(other->mapSize.x / 2 + dx), int16_t(other->mapSize.y / 2), 0},
                                   55, c1->self);
    REQUIRE(cc);
    REQUIRE(sim.db().allOf<Colony>(ObjType::Colony).size() == colonies + 1);
    const Colony* fresh = cc->colony(sim);
    REQUIRE(fresh);
    REQUIRE(fresh->owner == other->self);
    REQUIRE(fresh->population.total() == 2);                 // two colonists came over
}
