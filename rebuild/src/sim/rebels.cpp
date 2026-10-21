// The rebels' AI (s5:A43E .. s5:BA28). findings/08-simulation.md §2.17.

#include "sim/rebels.hpp"

#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <cstdlib>
#include <optional>

namespace outpost::sim {

namespace {

const Handle kRebelColony = Handle::make(ObjType::Colony, 2);     // 0x04000002
constexpr int kMargin = 11;                                         // s5:B1AE
// IMPROVISED (I60, guard): the searches below loop until they succeed; on
// a map with no room they never end. They give up after this many tries.
constexpr int kMaxTries = 20000;

Grid* gridOf(Simulation& sim, Handle site) { return sim.gridOfSite(site); }

// s5:B1AE: more than 11 cells from every edge of the site.
bool insideMargin(Simulation& sim, const MapCell& p, Handle site) {
    const Site* s = sim.db().get<Site>(site);
    if (!s) return false;
    return p.x > kMargin && p.y > kMargin && p.x < s->mapSize.x - kMargin && p.y < s->mapSize.y - kMargin;
}

// s5:B240: no building but terrain (types 1..9) on the cell, inside the margin.
bool freeCell(Simulation& sim, const MapCell& p, Handle site) {
    Grid* g = gridOf(sim, site);
    if (!g) return false;
    if (const Tile* t = sim.db().get<Tile>(g->tileAt(p)))
        if (const Building* b = sim.db().get<Building>(t->building); b && b->type > 9) return false;
    return insideMargin(sim, p, site);
}

// s5:AFC4: the cell's terrain kind, 0 under a building.
int cellKind(Simulation& sim, const MapCell& p, Handle site) {
    Grid* g = gridOf(sim, site);
    if (!g) return 0;
    const Tile* t = sim.db().get<Tile>(g->tileAt(p));
    if (!t) return static_cast<int>(g->value(p) & 0xFFFF);
    const Building* b = sim.db().get<Building>(t->building);
    if (!b) return t->mark14;
    static constexpr int kKind[10] = {0, 1, 2, 3, 4, 5, 7, 8, 9, 6};
    return b->type <= 9 ? kKind[b->type] : 0;
}

Handle rebelColony(Simulation& sim) {
    RebelAi& ai = sim.rebelAi();
    return ai.colony ? ai.colony : kRebelColony;
}

// s5:AC6E: a tube (X tube 122, or 127 underground) at the cursor moved
// `steps` along `dir` (0: y + steps, 1: x + steps, 2: y - steps).
void layTube(Simulation& sim, Handle site, int ug, int16_t steps, int16_t dir) {
    MapCell c = sim.rebelAi().cursor[static_cast<size_t>(ug)];
    switch (dir) {
        case 0: c.y = static_cast<int16_t>(c.y + steps); break;
        case 1: c.x = static_cast<int16_t>(c.x + steps); break;
        case 2: c.y = static_cast<int16_t>(c.y - steps); break;
        default: break;
    }
    if (!insideMargin(sim, c, site) || !freeCell(sim, c, site)) return;
    sim.putBuildingAt(site, c, ug ? 127 : 122, rebelColony(sim));
}

// s5:B2DA: the next free cell of a spiral round the cursor (which never
// moves). Candidates: cursor + (-1, step), (step, -1), (-1, -step) by the
// direction, then the same shifted by 2; on failure the direction turns
// (growing the step after a full round) and a tube is laid (s5:AC6E).
std::optional<MapCell> spiral(Simulation& sim, Handle site, int ug) {
    RebelAi& ai = sim.rebelAi();
    int16_t& dir = ai.direction[static_cast<size_t>(ug)];
    int16_t& step = ai.step[static_cast<size_t>(ug)];
    for (int tries = 0; tries < kMaxTries; ++tries) {
        MapCell a = ai.cursor[static_cast<size_t>(ug)];
        switch (dir) {
            case 0: a.y = static_cast<int16_t>(a.y + step); a.x = static_cast<int16_t>(a.x - 1); break;
            case 1: a.y = static_cast<int16_t>(a.y - 1); a.x = static_cast<int16_t>(a.x + step); break;
            case 2: a.x = static_cast<int16_t>(a.x - 1); a.y = static_cast<int16_t>(a.y - step); break;
            default: break;
        }
        if (insideMargin(sim, a, site) && freeCell(sim, a, site)) return a;
        if (dir == 1) a.y = static_cast<int16_t>(a.y + 2);
        else a.x = static_cast<int16_t>(a.x + 2);
        if (insideMargin(sim, a, site) && freeCell(sim, a, site)) return a;
        dir = static_cast<int16_t>(dir + 1);
        if (dir > 2) {
            dir = 0;
            ++step;
        }
        layTube(sim, site, ug, step, dir);
    }
    return std::nullopt;
}

// s5:B97E: colony 2 is the rebels'; the surface cursor starts at its hub
// (moved to (x + 1, y - 1) when `atHub` is 0), the underground one at
// (x - 2, y) one level down.
void initCursors(Simulation& sim, bool atHub) {
    RebelAi& ai = sim.rebelAi();
    ai.colony = kRebelColony;
    const Colony* c = sim.db().get<Colony>(kRebelColony);
    const Tile* hub = c ? sim.db().get<Tile>(c->hub) : nullptr;
    if (!hub) return;
    MapCell p{hub->x, hub->y, hub->level};
    if (!atHub) p = {int16_t(p.x + 1), int16_t(p.y - 1), 0};
    ai.cursor[0] = p;
    ai.cursor[1] = {int16_t(p.x - 2), p.y, 1};
}

// s5:B482: a spot for the rebels' Seed: more than 100 from every colony's
// hub on the site, free, and no building on the cells round it.
bool seedSpotOk(Simulation& sim, const MapCell& p, Handle site) {
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
        const Tile* hub = sim.db().get<Tile>(c->hub);
        const Site* s = sim.siteOf(*c);
        if (!hub || !s || s->self != site) continue;                  // s7:BCBC: -1 elsewhere
        const int d = std::abs(hub->x - p.x) + std::abs(hub->y - p.y);
        if (d <= 100) return false;
    }
    if (!freeCell(sim, p, site)) return false;
    static constexpr int8_t kAround[][2] = {{-1, -1}, {0, -1}, {1, -1}, {-1, 0}, {1, 0}, {1, 1}, {0, 1},
                                            {-1, 1}, {-2, -2}, {2, -2}, {-2, 2}, {2, 2}, {-1, 2}, {-1, 3}};
    for (const auto& o : kAround)
        if (cellKind(sim, {int16_t(p.x + o[0]), int16_t(p.y + o[1]), p.level}, site) == 0) return false;
    for (int k = 3; k < 10; ++k)
        if (cellKind(sim, {int16_t(p.x - k), p.y, 0}, site) == 0) return false;
    return true;
}

// s5:B872: the rebels' Seed lands at a random spot (10 from the edges)
// that s5:B482 accepts, as a new colony of the rebel player.
void rebelSeed(Simulation& sim, Handle site) {
    const Site* s = sim.db().get<Site>(site);
    if (!s || !gridOf(sim, site)) return;
    for (int tries = 0; tries < kMaxTries; ++tries) {
        const int16_t y = sim.random(10, int16_t(s->mapSize.y - 10));
        const int16_t x = sim.random(10, int16_t(s->mapSize.x - 10));
        const MapCell p{x, y, 0};
        if (!seedSpotOk(sim, p, site)) continue;
        sim.putBuildingAt(site, p, 10, Handle{}, kRebelPlayer);        // SCInternalPutBldg2
        initCursors(sim, true);
        return;
    }
}

// s5:B0AA: the rebels' answer to a building type, from the difficulty's
// table (DGROUP 0x44B4 Beginner/Easy, 0x47F0 Medium, 0x4B2C Hard). The
// first answer is a CHAP (42) unless they own one.
int pickResponse(Simulation& sim, uint16_t type) {
    const int d = sim.difficulty();
    const auto& table = sim.data().rebelResponses[d == 1 || d == 2 ? 0 : d == 4 ? 2 : 1];
    if (type >= table.size()) return 0;
    const auto& row = table[type];
    if (row.count == 0) return 0;
    if (row.count == -1) return type;                                // the same building
    RebelAi& ai = sim.rebelAi();
    if (!ai.chapGiven) {
        if (const Colony* c = sim.db().get<Colony>(kRebelColony))
            for (Handle h : c->tiles.order())
                if (const Tile* t = sim.db().get<Tile>(h))
                    if (const Building* b = sim.db().get<Building>(t->building); b && (b->type == 42 || b->type == 43))
                        ai.chapGiven = true;
        if (!ai.chapGiven) {
            ai.chapGiven = true;
            return 42;
        }
    }
    const int16_t i = sim.random(0, int16_t(row.count - 1));
    return sim.data().dgroupWord(row.list + 2u * static_cast<uint16_t>(i));
}

// s5:ABC0: the answer goes down at the spiral's next cell (underground for
// group 0x28), and the ground round an underground one softens (s5:AD90).
void putRebel(Simulation& sim, uint16_t type, Handle site) {
    const bool ug = sim.data().groups.contains(0x28, type);
    const auto p = spiral(sim, site, ug ? 1 : 0);
    if (!p) return;
    sim.putBuildingAt(site, *p, type, rebelColony(sim));
    if (ug) soften(sim, site, rebelColony(sim), *p);
}

} // namespace

void rebelsHear(Simulation& sim, uint16_t type, Handle site) {
    const Colony* c2 = sim.db().get<Colony>(kRebelColony);
    if (c2 && c2->player != kRebelPlayer) return;                     // colony 2 is the player's
    if (type == 10) {
        rebelSeed(sim, site);
        return;
    }
    const int r = pickResponse(sim, type);
    // v1.51's tables have no answers (count 0) but for a few -1 rows (Hard:
    // SpacePort 15, Mass Driver 17), so the rebels copy only those (Q71).
    if (r <= 0) return;
    putRebel(sim, static_cast<uint16_t>(r), site);
}

void rebelCalendar(Simulation& sim) {
    const uint32_t turn = sim.turn();
    if ((turn < 15 || turn > 21) && turn != 152) return;
    const Colony* rc = sim.db().get<Colony>(kRebelColony);
    // IMPROVISED (guard): s5:A54C does not check that colony 2 is the
    // rebels' (its put fails without a rebel colony); the rebuild asks.
    if (!rc || rc->player != kRebelPlayer || !rc->hub) return;
    const Site* st = sim.siteOf(*rc);
    if (!st || !gridOf(sim, st->self)) return;
    const Handle site = st->self;
    const MapCell cur = sim.rebelAi().cursor[0];
    if (turn == 152) {
        if (freeCell(sim, cur, site)) sim.putBuildingAt(site, cur, 122, rebelColony(sim));   // XPipe
        if (sim.colonyTilesInGroup(*rc, 1, false).empty()) putRebel(sim, 53, site);         // Smelter
        return;
    }
    const int16_t i = static_cast<int16_t>(turn - 15);
    const MapCell p = i <= 5 ? MapCell{int16_t(cur.x - i - 3), cur.y, 0} : MapCell{int16_t(cur.x - 9), cur.y, 0};
    if (freeCell(sim, p, site)) sim.putBuildingAt(site, p, i <= 5 ? 123 : 20, rebelColony(sim));   // LPipe / Tokamak
}

void rebelSetup(Simulation& sim, const Tile& hub) {
    const Colony* rc = sim.db().get<Colony>(kRebelColony);
    const Site* st = rc ? sim.siteOf(*rc) : nullptr;
    if (!st) return;
    const Handle site = st->self;
    if (!gridOf(sim, site)) return;
    const int16_t x = hub.x, y = hub.y;
    sim.putBuildingAt(site, {x, int16_t(y + 2), 0}, 122, kRebelColony);           // X tube
    sim.putBuildingAt(site, {int16_t(x - 2), y, 0}, 71, kRebelColony);            // Core
    sim.putBuildingAt(site, {int16_t(x - 2), y, 1}, 106, kRebelColony);           // UG Core
    soften(sim, site, kRebelColony, {int16_t(x - 2), y, 1});
    sim.putBuildingAt(site, {int16_t(x - 2), int16_t(y + 1), 1}, 127, kRebelColony);   // UG X tube
    soften(sim, site, kRebelColony, {int16_t(x - 2), int16_t(y + 1), 1});
    // The landers lost on the mothership's arrival (list +0x12) are the
    // rebels': the first four go to the corners two cells away, the rest
    // to the spiral.
    static constexpr int8_t kCorner[4][2] = {{-2, -2}, {-2, 2}, {2, 2}, {2, -2}};
    int n = 0;
    for (ShipItem& e : sim.mothership().damaged) {
        if (e.kind != 62 && e.kind != 65) continue;
        while (e.count > 0) {
            std::optional<MapCell> p;
            if (n < 4) p = MapCell{int16_t(x + kCorner[n][0]), int16_t(y + kCorner[n][1]), 0};
            else p = spiral(sim, site, 0);
            ++n;
            if (p) sim.putBuildingAt(site, *p, e.kind, kRebelColony);
            --e.count;
        }
    }
    sim.mothership().damaged.clear();                                            // s3:9674
}

} // namespace outpost::sim
