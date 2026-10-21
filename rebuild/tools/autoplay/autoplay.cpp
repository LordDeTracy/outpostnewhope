// A play-test bot for the rebuild: starts a new game through the same
// calls the start screens make, lands, and runs a colony for N turns with
// the player's placement rules (sim::Simulation::playerPutBuilding), while
// checking the state each turn. It reports what it built, what it could
// not, and anything that looks wrong. Not part of the game.
//
//   outpost-autoplay <game folder> [--turns N] [--seed S] [--star N] [--verbose]
#include "data/game_files.hpp"
#include "data/ops_save.hpp"
#include "sim/building.hpp"
#include "sim/new_game.hpp"
#include "sim/ops_loader.hpp"
#include "sim/ops_writer.hpp"
#include "sim/rebel_ai_improved.hpp"
#include "sim/research.hpp"
#include "sim/ship_config.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iterator>
#include <map>
#include <set>
#include <string>
#include <vector>

using namespace outpost;
using namespace outpost::sim;

namespace {

const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);

struct Bot {
    const GameData& data;
    Simulation& sim;
    NewGame& game;
    Handle site;
    bool verbose{false};
    std::map<std::string, int> problems;          // a problem's text -> times seen
    std::map<uint16_t, int> built, refused;       // type -> count
    std::map<uint16_t, std::map<uint16_t, int>> refusedWhy;   // type -> message id -> count
    std::set<uint16_t> everOperational;
    std::map<uint16_t, int> logCodes;             // log message code -> times
    std::map<uint32_t, int> robotSince;           // robot building -> turn it was put down
    int dugLevels{0};

    void problem(const std::string& s) {
        if (problems[s]++ == 0) std::printf("  ! turn %u: %s\n", unsigned(sim.turn()), s.c_str());
    }

    Colony* colony() { return sim.db().get<Colony>(kColony1); }
    Tile* hub() {
        Colony* c = colony();
        return c ? sim.db().get<Tile>(c->hub) : nullptr;
    }
    Grid* grid() { return sim.gridOfSite(site); }
    uint16_t kind(MapCell c) { return sim.cellKind(site, c); }
    const Building* buildingAt(MapCell c) {
        Grid* g = grid();
        const Tile* t = g ? sim.db().get<Tile>(g->tileAt(c)) : nullptr;
        return t ? sim.db().get<Building>(t->building) : nullptr;
    }
    int count(uint16_t type) {
        int n = 0;
        for (const Building* b : sim.db().allOf<Building>(ObjType::Building))
            if (b->type == type && b->tile(sim) && b->tile(sim)->colony == kColony1) ++n;
        return n;
    }
    int freeRobots(uint16_t k) {                  // product::Dozer.. (linkedCount - linkedBusy)
        const Colony* c = colony();
        return c ? int(c->linkedCount[k] - c->linkedBusy[k]) : 0;
    }

    Building* put(uint16_t type, MapCell c, uint16_t dir = 0) {
        Building* b = sim.playerPutBuilding(site, c, type, kColony1, dir);
        if (b) {
            ++built[type];
            if (type >= 115 && type <= 121) robotSince[b->self.value] = int(sim.turn());
            if (verbose) std::printf("  turn %u: put %u at %d,%d,%d\n", unsigned(sim.turn()), type, c.x, c.y, c.level);
        } else {
            ++refused[type];
            ++refusedWhy[type][sim.placeMessage().id];
        }
        return b;
    }

    // ── The layout: tube spines from the hub, buildings beside them ──────
    // Each spine cell is a tube intersection; the cells either side are
    // building slots. Every cell must be bulldozed first.
    std::vector<MapCell> spine(int level) {
        std::vector<MapCell> v;
        const Tile* h = hub();
        if (!h) return v;
        const int cx = level == 0 ? centreX : shaftX, cy = level == 0 ? centreY : shaftY;
        for (int d = level == 0 ? 2 : 1; d <= 14; ++d)
            for (auto [dx, dy] : {std::pair{1, 0}, {-1, 0}, {0, 1}, {0, -1}})
                v.push_back({int16_t(cx + dx * d), int16_t(cy + dy * d), int16_t(level)});
        return v;
    }
    std::vector<MapCell> slots(int level) {
        std::vector<MapCell> v;
        for (const MapCell& s : spine(level)) {
            const int cx = level == 0 ? centreX : shaftX;
            const bool horizontal = s.x != cx;
            for (int side : {-1, 1})
                v.push_back(horizontal ? MapCell{s.x, int16_t(s.y + side), s.level}
                                       : MapCell{int16_t(s.x + side), s.y, s.level});
        }
        return v;
    }
    bool ready(MapCell c) {                       // dozed (surface) or dug (underground), empty
        const uint16_t k = kind(c);
        const Building* b = buildingAt(c);
        return (k == 5 || k == 6) && (!b || b->type <= 9);
    }
    // Ground nothing can be built on (a cell with a building on it reports
    // kind 0: that is not it).
    bool impassable(MapCell c) {
        if (const Building* b = buildingAt(c); b && b->type > 9) return false;
        const uint16_t k = kind(c);
        return c.level == 0 ? (k == 4 || k == 0) : (k == 9 || k == 0);
    }
    bool isTube(MapCell c) {
        const Building* b = buildingAt(c);
        return b && b->type >= 122 && b->type <= 127;
    }

    // Make a cell ready: doze it (surface) or dig it from a dug neighbour
    // (underground). Returns whether a robot went (or it is ready).
    bool prepare(MapCell c) {
        if (ready(c)) return true;
        if (const Building* b = buildingAt(c); b && b->type > 9) return false;   // a robot is at it, or built
        if (c.level == 0) {
            if (impassable(c)) return false;
            return freeRobots(product::Dozer) > 0 && put(115, c);
        }
        // Underground the RoboDozer (119) clears rough ground the same way.
        if (impassable(c)) return false;
        return freeRobots(product::Dozer) > 0 && put(119, c);
    }

    // The spine cells from the centre out to (and with) `s`, on its arm.
    std::vector<MapCell> pathTo(const MapCell& s, int level) {
        const int cx = level == 0 ? centreX : shaftX, cy = level == 0 ? centreY : shaftY;
        std::vector<MapCell> v;
        const int dx = s.x > cx ? 1 : s.x < cx ? -1 : 0, dy = s.y > cy ? 1 : s.y < cy ? -1 : 0;
        for (int d = level == 0 ? 2 : 1; ; ++d) {
            const MapCell c{int16_t(cx + dx * d), int16_t(cy + dy * d), int16_t(level)};
            v.push_back(c);
            if (c.x == s.x && c.y == s.y) break;
            if (d > 20) break;
        }
        return v;
    }

    // Work towards a building of `type`: the first free slot whose spine
    // can be reached; tubes along the spine, then the slot, each made
    // ready first. Returns whether the building went down.
    std::set<uint64_t> deadCells;
    static uint64_t key(const MapCell& c) { return (uint64_t(uint16_t(c.x)) << 32) | (uint64_t(uint16_t(c.y)) << 16) | uint16_t(c.level); }
    bool place(uint16_t type, int level, int minD = 0) {
        const uint16_t tube = level == 0 ? 122 : 127;
        const auto sp = spine(level);
        const auto sl = slots(level);
        for (size_t i = 0; i < sl.size(); ++i) {
            const MapCell slot = sl[i], s = sp[i / 2];
            if (int(i / 8) + (level == 0 ? 2 : 1) < minD) continue;   // spine cells go out 4 per step
            if (deadCells.count(key(slot)) || isTube(slot)) continue;
            if (verbose && sim.turn() >= 4 && sim.turn() <= 7)
                std::printf("    try %u slot %d,%d spine %d,%d ready %d kind %u\n", type, slot.x, slot.y, s.x, s.y,
                            int(ready(s)), unsigned(kind(s)));
            if (const Building* b = buildingAt(slot); b && b->type > 9) continue;   // taken
            bool blocked = false, waiting = false;
            for (const MapCell& c : pathTo(s, level)) {
                if (isTube(c)) continue;
                if (deadCells.count(key(c))) { blocked = true; break; }
                if (!ready(c)) {
                    if (!prepare(c) && impassable(c)) { deadCells.insert(key(c)); blocked = true; break; }
                    waiting = true;
                    break;
                }
                if (!put(tube, c)) {
                    if (verbose) std::printf("    tube refused at %d,%d: %u\n", c.x, c.y, unsigned(sim.placeMessage().id));
                    deadCells.insert(key(c));
                    blocked = true;
                    break;
                }
            }
            if (blocked) continue;
            if (waiting) return false;
            if (!ready(slot)) {
                if (!prepare(slot) && impassable(slot)) {
                    deadCells.insert(key(slot));
                    continue;
                }
                return false;
            }
            if (put(type, slot)) return true;
            deadCells.insert(key(slot));                 // refused here: try the next
        }
        return false;
    }

    // ── Each turn ────────────────────────────────────────────────────────
    int16_t shaftX{0}, shaftY{0};
    int16_t centreX{0}, centreY{0};               // the Seed Lander: its tubes ring it
    bool shaftDug{false};

    // Each idle lab (or one on Basic Research, which repeats: s7:25D8)
    // takes the cheapest open topic of its tree no other lab has; Basic
    // Research (it takes 5 off every other topic) only when none is left.
    std::map<uint16_t, int> topicsDone;           // topic -> turn finished
    void manageLabs() {
        Player* p = sim.db().get<Player>(kPlayer1);
        if (!p) return;
        for (const auto& t : data.research.topics())
            if (t.cost && t.id < p->remaining.size() && p->remaining[t.id] == 0 && !topicsDone.count(t.id))
                topicsDone[t.id] = int(sim.turn());
        std::set<uint16_t> taken;
        for (Building* o : sim.db().allOf<Building>(ObjType::Building))
            if (auto* l = dynamic_cast<LabBuilding*>(o); l && l->topic && l->topic != 112 && l->topic != 1) taken.insert(l->topic);
        for (Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            auto* lab = dynamic_cast<LabBuilding*>(b);
            if (!lab || lab->state != Building::kOperational) continue;
            if (const Tile* lt = b->tile(sim); !lt || lt->colony != kColony1) continue;
            if (lab->topic != 0 && lab->topic != 112 && lab->topic != 1) continue;
            const bool hot = data.groups.contains(17, b->type);
            const data::ResearchTopic* best = nullptr;
            for (const auto& t : data.research.topics()) {
                if (t.id >= p->remaining.size() || t.id <= 1 || t.id == 112 || t.id == 113 || t.advanced != hot) continue;
                if (t.cost == 0 || p->remaining[t.id] == 0 || taken.count(t.id)) continue;
                // What the research tree window offers (s3:9488, s2:EEAC).
                if (t.parent >= 0 && !topicOpens(*p, uint16_t(t.parent))) continue;
                if (!best || t.cost < best->cost) best = &t;
            }
            const uint16_t topic = best ? best->id : (hot ? 0 : 1);
            if (topic == lab->topic) continue;
            setLabTopic(sim, *lab, topic);                // s3:A5EC, as the lab window
            if (topic) taken.insert(topic);
            if (verbose && best) std::printf("  turn %u: lab %u researches %s\n", unsigned(sim.turn()), b->type, best->name.c_str());
        }
    }

    void manageFactories() {
        // Robots first (2 dozers, 2 diggers, 3 trucks, 2 miners), then the
        // first product offered.
        const Colony* c = colony();
        if (!c) return;
        for (Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            if (!dynamic_cast<FactoryBuilding*>(b) || b->state != Building::kOperational) continue;
            if (makesConsumerGoods(*b)) {                // UG factories: consumer goods (I96)
                if (b->opsProductB != kConsumerGoods) setFactoryConsumerGoods(sim, *b);
                continue;
            }
            const auto offered = factoryProducts(sim, *b);
            if (offered.empty()) continue;
            uint16_t want = 0;
            if (c->explorers < 3 && c->linkedCount[product::Miner] >= 2 &&
                std::find(offered.begin(), offered.end(), product::Explorer) != offered.end() && b->type != 14)
                want = product::Explorer;
            if (!want)
            for (auto [k, target] : {std::pair{product::Miner, 3}, {product::Dozer, 4}, {product::Truck, 6},
                                     {product::Digger, 2}, {product::Miner, 6}})
                if (int(c->linkedCount[k]) < target && std::find(offered.begin(), offered.end(), k) != offered.end()) {
                    want = k;
                    break;
                }
            if (!want) want = offered.front() == 20 && offered.size() > 1 ? offered[1] : offered.front();
            if (b->opsProductA != want) setFactoryProduct(sim, *b, want);
        }
    }

    void sendMiners() {
        if (freeRobots(product::Miner) <= 0) return;
        const Tile* h = hub();
        if (!h) return;
        const int depth = maxDigDepth(sim.planetHostility());
        // The lowest UG mine under each surface mine; the most worked-out
        // first.
        struct Shaft { MapCell at; int life; };
        std::vector<Shaft> shafts;
        for (const Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            if (b->type != 51 && b->type != 52) continue;
            const Tile* t = b->tile(sim);
            if (!t || t->colony != kColony1 || t->level != 0) continue;
            for (int l = 1; l < depth; ++l) {
                const Building* u = buildingAt({t->x, t->y, int16_t(l)});
                if (!u || (u->type != 96 && u->type != 97)) break;
                const Building* below = buildingAt({t->x, t->y, int16_t(l + 1)});
                if (below && (below->type == 96 || below->type == 97)) continue;
                const auto* m = dynamic_cast<const MineBuilding*>(u);
                shafts.push_back({{t->x, t->y, int16_t(l)}, u->state == 9 ? -1 : m ? m->life : 0});
                break;
            }
        }
        std::sort(shafts.begin(), shafts.end(), [](const Shaft& a, const Shaft& b) { return a.life < b.life; });
        for (const Shaft& sh : shafts) {
            if (sh.life > 30) break;                       // not needed yet
            if (deadCells.count(key(sh.at))) continue;
            if (put(117, sh.at)) return;
            deadCells.insert(key(sh.at));
        }
        // The nearest mine beacon in range.
        const Building* best = nullptr;
        int bestD = 1 << 30;
        for (const Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            if (b->type != 16) continue;
            const Tile* t = b->tile(sim);
            if (!t || t->owner != site || t->level != 0) continue;
            const int d = std::abs(t->x - h->x) + std::abs(t->y - h->y);
            if (d < bestD && d <= 60 && !deadCells.count(key({t->x, t->y, 0}))) {
                bestD = d;
                best = b;
            }
        }
        if (best) {
            const MapCell c{best->tile(sim)->x, best->tile(sim)->y, 0};
            if (!put(117, c)) deadCells.insert(key(c));   // out of range or refused: the next one
        }
    }

    // The Seed's four tubes meet at the Seed Lander's cell; when the Seed is
    // wrecked (turn 150) the arms only join again through a tube there.
    void reconnectCentre() {
        const MapCell c{centreX, centreY, 0};
        const Building* b = buildingAt(c);
        if (b && b->type == 10 && b->state != 7) return;    // the Seed Lander still stands
        if (isTube(c)) return;
        if (ready(c)) {
            if (put(122, c) && verbose) std::printf("  turn %u: centre tube laid\n", unsigned(sim.turn()));
            return;
        }
        if (freeRobots(product::Dozer) > 0) put(115, c);
    }

    void digShaft() {
        if (shaftDug || freeRobots(product::Digger) <= 0) return;
        // A dozed slot near the hub, dug down (direction 1).
        for (const MapCell& c : slots(0))
            if (ready(c) && !isTube(c) && put(116, c, 1)) {
                shaftX = c.x;
                shaftY = c.y;
                shaftDug = true;
                return;
            }
    }

    void landers() {
        Mothership& m = sim.mothership();
        const Tile* h = hub();
        if (!h) return;
        for (uint16_t type : {uint16_t(62), uint16_t(65)}) {
            if (m.deployableCount(type) <= 0) continue;
            for (int r = 2; r <= 5; ++r)
                for (int dx = -r; dx <= r; ++dx)
                    for (int dy = -r; dy <= r; ++dy) {
                        if (std::max(std::abs(dx), std::abs(dy)) != r) continue;
                        if (m.deployableCount(type) <= 0) goto next;
                        const MapCell c{int16_t(h->x + dx), int16_t(h->y + dy), 0};
                        if (type == 19 || type == 18) {
                            if (!ready(c)) continue;
                        }
                        put(type, c);
                    }
        next:;
        }
    }

    // The colony's wish list, in order: what it builds when it can.
    void build() {
        const BuildMenu& menu = sim.buildMenu();
        struct Want { uint16_t type; int count; int level; };
        static const Want kWants[] = {
            // Food, homes, then life support before the Seed's runs out
            // (50 turns on Easy: SeedCommand life, quirk Q43).
            // Storage tanks early: smelted metal leaves a smelter only for
            // them (s8:1940), and a full smelter stops.
            {27, 1, 0},  {60, 1, 0},  {79, 2, 1},  {42, 1, 0},  {19, 2, 0},  {58, 1, 0},  {27, 2, 0},  {93, 1, 1},
            {60, 2, 0},  {18, 2, 0},
            {84, 1, 1},  {82, 1, 1},  {91, 1, 1},  {87, 1, 1},  {101, 1, 1}, {79, 4, 1},  {53, 1, 0},
            {56, 1, 0},  {60, 1, 0},  {30, 1, 0},  {104, 1, 1}, {102, 1, 1}, {93, 2, 1},  {34, 1, 0},
            {47, 1, 0},  {49, 1, 0},  {37, 1, 0},  {42, 1, 0},  {40, 1, 0},  {15, 1, 0},  {90, 1, 1},
            {98, 1, 1},  {108, 1, 1}, {110, 1, 1}, {63, 1, 0},  {44, 1, 0},  {33, 1, 0},  {17, 1, 0},
            {27, 4, 0},  {79, 8, 1},  {82, 2, 1},  {87, 2, 1},  {93, 3, 1},
        };
        int tries = 0;
        for (const Want& w : kWants) {
            if (w.level > 0 && !shaftReady()) continue;
            uint16_t type = w.type;
            if (type == 19 && sim.mothership().deployableCount(19) <= 0) type = 20;   // the kit, then built ones
            if (type == 18 && sim.mothership().deployableCount(18) <= 0) continue;
            if (type != 19 && type != 18 && !menu.isOffered(type)) continue;
            int want = w.count;
            if (type == 79 && colony()) want = std::max(want, std::min(16, int(colony()->population.total()) / 30 + 2));
            if (count(type) >= want) continue;
            // Each Tokamak burns a FusionA, B and C a turn: two are plenty
            // (1000 power each), and more starve the fuel the mines give.
            if ((type == 19 || type == 20 || type == 98) && count(19) + count(20) + count(98) >= 2) continue;
            // Tokamaks away from the colony: each tile within 5 of one
            // costs a point of morale a turn (s8:... tokamakCrowding).
            const bool tokamak = type == 19 || type == 20 || type == 98;
            // Far out, unless the colony still runs on the Seed's 50 power
            // at turn 90 (the map's ground keeps the spines short): then
            // power is worth some morale.
            const bool starved = colony() && colony()->total[data::res::Power] <= 50 && sim.turn() >= 90;
            place(type, w.level, tokamak ? (starved ? 5 : 9) : 0);
            if (++tries >= 6) return;
        }
    }
    bool shaftReady() {
        if (!shaftDug) return false;
        const Building* b = buildingAt({shaftX, shaftY, 1});
        return b && b->type == 106 && b->state == Building::kOperational;
    }

    // The terms of SCMorale (steps.cpp MoraleStep), for the log.
    void moraleTerms() {
        Colony* c = colony();
        if (!c) return;
        int tok = 0;
        for (Tile* t1 : sim.colonyTilesInGroup(*c, 41, false))
            for (Handle th : c->tiles.order()) {
                Tile* t = sim.db().get<Tile>(th);
                if (!t || t->level != t1->level) continue;
                const Building* b = sim.db().get<Building>(t->building);
                if (!b || data.groups.contains(48, b->type)) continue;
                if (Simulation::tileDistance(*t1, *t) <= 5) ++tok;
            }
        int plus = 0, minus = 0;
        std::map<int, int> byType;
        for (Handle th : c->tiles.order()) {
            const Tile* t = sim.db().get<Tile>(th);
            const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
            if (!b || b->state != Building::kOperational) continue;
            const int v = b->moraleEffect(sim);
            (v < 0 ? minus : plus) += v;
            if (v) byType[b->type] += v;
        }
        std::printf("  morale %d: crime %d (adds %d) education %d buildings +%d %d tokamak crowding -%d crowding +%d hostility %d\n",
                    c->morale, c->crime, c->crime / 10, c->education, plus, minus, tok, c->crowdingMorale,
                    sim.planetHostility());
        std::printf("    by type:");
        for (auto [t, v] : byType) std::printf(" %d:%+d", t, v);
        std::printf("\n");
    }

    int tradesTaken{0}, tradesOffered{0}, tradesAccepted{0};
    void trade() {
        RebelRelations& rel = sim.rebelRelations();
        if (rel.offer) {
            if (acceptRebelOffer(sim) == TradeAnswer::Accepted) {
                ++tradesTaken;
                if (verbose) std::printf("  turn %u: took the rebels' offer\n", unsigned(sim.turn()));
            } else {
                declineRebelOffer(sim);
            }
        }
        if (sim.turn() % 30 != 15) return;
        Colony* me = colony();
        Colony* them = rebelColonyOf(sim);
        if (!me || !them) return;
        uint16_t surplus = 0, shortest = 0;
        int32_t most = 0, least = 1 << 30;
        for (uint16_t r : tradeableResources()) {
            const int32_t have = colonyStock(sim, *me, r);
            if (have > most) { most = have; surplus = r; }
            if (have < least) { least = have; shortest = r; }
        }
        if (!surplus || !shortest || surplus == shortest || most < 100) return;
        TradeOffer deal{{surplus, most / 5}, {shortest, 20}, 0};
        ++tradesOffered;
        const TradeAnswer a = proposeTrade(sim, deal);
        if (a == TradeAnswer::Accepted) ++tradesAccepted;
        if (verbose) std::printf("  turn %u: offered %d of r%u for 20 of r%u: answer %d\n", unsigned(sim.turn()),
                                 deal.give.amount, surplus, shortest, int(a));
    }

    // The rebel colony (colony 2, the AI): people, morale, buildings by type.
    void reportRebels() {
        const Colony* r = sim.db().get<Colony>(Handle::make(ObjType::Colony, 2));
        if (!r) {
            std::printf("           AI colony: none\n");
            return;
        }
        std::map<uint16_t, int> types;
        int total = 0, operational = 0;
        for (const Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            const Tile* t = b->tile(sim);
            if (!t || t->colony != r->self || b->type <= 9 || b->type >= 122) continue;
            ++types[b->type];
            ++total;
            if (b->state == Building::kOperational) ++operational;
        }
        std::printf("           AI colony \"%s\": people %d morale %d buildings %d (%d running):", r->name.c_str(),
                    int(r->population.total()), int(r->morale), total, operational);
        for (auto [ty, n] : types) std::printf(" %u%s", ty, n > 1 ? ("x" + std::to_string(n)).c_str() : "");
        std::printf("\n");
    }

    // Everything about the colony after a turn (--dump).
    void dump(Handle which = Handle::make(ObjType::Colony, 1)) {
        Colony* c = sim.db().get<Colony>(which);
        if (!c) return;
        std::printf("== dump after turn %u: people %d morale %d\n", unsigned(sim.turn()), int(c->population.total()),
                    int(c->morale));
        std::printf("  totals:");
        for (int r = 1; r < data::res::Count; ++r)
            if (c->total[size_t(r)]) std::printf(" r%d=%d", r, int(c->total[size_t(r)]));
        std::printf("\n  robots: dozer %d/%d digger %d/%d miner %d/%d truck %d/%d (busy/all)\n",
                    int(c->linkedBusy[product::Dozer]), int(c->linkedCount[product::Dozer]),
                    int(c->linkedBusy[product::Digger]), int(c->linkedCount[product::Digger]),
                    int(c->linkedBusy[product::Miner]), int(c->linkedCount[product::Miner]),
                    int(c->linkedBusy[product::Truck]), int(c->linkedCount[product::Truck]));
        moraleTerms();
        std::map<std::string, int> lines;
        for (const Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            const Tile* tt = b->tile(sim);
            if (!tt || tt->colony != which || b->type <= 9 || (b->type >= 122)) continue;
            std::string lack;
            if (b->state == Building::kConstructing || b->state == Building::kSuspended) {
                const auto* need = b->state == Building::kConstructing ? &b->buildInfo.need : &b->opsInfo.need;
                for (int r = data::res::MetalA; r <= data::res::People; ++r)
                    if ((*need)[size_t(r)] > 0 && (*need)[size_t(r)] > c->available(r))
                        lack += " r" + std::to_string(r) + ":" + std::to_string((*need)[size_t(r)]) + ">" +
                                std::to_string(c->available(r));
            }
            std::string extra;
            if (auto* lab = dynamic_cast<const LabBuilding*>(b)) extra = " topic " + std::to_string(lab->topic);
            if (b->type == 51 || b->type == 52 || b->type == 96 || b->type == 97) {
                if (auto* m = dynamic_cast<const MineBuilding*>(b)) extra = " life " + std::to_string(m->life);
            }
            if (b->opsProductA || b->opsProductB)
                extra += " makes A" + std::to_string(b->opsProductA) + " B" + std::to_string(b->opsProductB);
            if (b->type == 11 || b->type == 55)
                if (auto* cc = dynamic_cast<const CommandCenterBuilding*>(b)) extra += " life " + std::to_string(cc->life);
            char line[400];
            std::snprintf(line, sizeof line, "  b%u L%d state %u%s%s%s", b->type, tt->level, b->state, extra.c_str(),
                          lack.empty() ? "" : " lacks", lack.c_str());
            ++lines[line];
        }
        for (auto& [l, n] : lines) std::printf("%s%s\n", l.c_str(), n > 1 ? (" x" + std::to_string(n)).c_str() : "");
        if (const Player* p = sim.db().get<Player>(kPlayer1)) {
            std::printf("  research done:");
            for (const auto& t : data.research.topics())
                if (t.id < p->remaining.size() && p->remaining[t.id] == 0) std::printf(" %u", t.id);
            std::printf("\n");
        }
    }

    // ── Checks ───────────────────────────────────────────────────────────
    void check() {
        Colony* c = colony();
        if (!c) return;
        if (c->population.total() < 0) problem("negative population");
        if (c->morale < 0 || c->morale > 1000) problem("morale out of 0..1000: " + std::to_string(c->morale));
        for (int r = 1; r < data::res::Count; ++r)
            if (c->total[size_t(r)] < 0) problem("negative colony total of resource " + std::to_string(r));
        Grid* g = grid();
        for (const Building* b : sim.db().allOf<Building>(ObjType::Building)) {
            const Tile* t = b->tile(sim);
            if (!t) {
                if (b->type > 9) problem("building type " + std::to_string(b->type) + " without a tile");
                continue;
            }
            if (g && t->owner == site && g->tileAt({t->x, t->y, t->level}) != t->self)
                problem("tile index does not point back at a building's tile (type " + std::to_string(b->type) + ")");
            if (t->building != b->self) problem("tile's building is not the building (type " + std::to_string(b->type) + ")");
            if (b->state == Building::kOperational) everOperational.insert(b->type);
            for (const auto& [res, v] : t->bas.entries())
                if (v < 0) problem("negative stock " + std::to_string(res) + " on type " + std::to_string(b->type));
            if (b->type >= 115 && b->type <= 121) {
                auto it = robotSince.find(b->self.value);
                if (it != robotSince.end() && int(sim.turn()) - it->second > 40)
                    problem("robot type " + std::to_string(b->type) + " still working after 40 turns");
            }
            if (b->state == Building::kConstructing && b->buildInfo.word94 > 0 && b->type > 9) {
                // fine: still building
            }
        }
        const Colony* cc = c;
        for (size_t k = 1; k < cc->linkedBusy.size(); ++k)
            if (cc->linkedBusy[k] > cc->linkedCount[k] && k <= 5)
                problem("more robots of kind " + std::to_string(k) + " busy than exist");
    }

    // A save and a load of it into a new simulator: the totals must agree.
    void roundTrip() {
        const auto bytes = writeOps(sim);
        data::OpsSave save;
        if (!save.parse(bytes)) {
            problem("own save does not parse");
            return;
        }
        Simulation copy(data, 1);
        std::string err;
        if (!loadOps(copy, save, nullptr, &err)) {
            problem("own save does not load: " + err);
            return;
        }
        const Colony* a = colony();
        const Colony* b = copy.db().get<Colony>(kColony1);
        if (!a || !b) {
            problem("colony missing after save/load");
            return;
        }
        if (a->population.total() != b->population.total()) problem("save/load changes the population");
        if (a->morale != b->morale) problem("save/load changes morale");
        if (sim.db().all(ObjType::Building).size() != copy.db().all(ObjType::Building).size())
            problem("save/load changes the number of buildings");
        // One turn on both: they should stay alike (the rand state is saved).
        Simulation* both[2] = {&sim, &copy};
        (void)both;
    }
};

} // namespace

int main(int argc, char** argv) {
    if (argc < 2) {
        std::fprintf(stderr, "usage: outpost-autoplay <game folder> [--turns N] [--seed S] [--star N] [--verbose]\n");
        return 2;
    }
    int turns = 200, star = 7, difficulty = 2;   // --difficulty 1..4
    uint32_t seed = 12345;
    bool verbose = false, listTopics = false, surface = false, report = false;   // --report: --inspect's colony report   // --surface: --inspect lists level 0 too
    std::string inspect;                          // --inspect save.OPS
    std::string saveTo;                           // --save file.OPS: the game at the end
    std::set<int> dumpTurns;                      // --dump N: the colony's state after turn N
    std::set<int> dump2Turns;                     // --dump2 N: colony 2's (the rebels')
    for (int i = 2; i < argc; ++i) {
        if (!std::strcmp(argv[i], "--turns") && i + 1 < argc) turns = std::atoi(argv[++i]);
        else if (!std::strcmp(argv[i], "--seed") && i + 1 < argc) seed = uint32_t(std::atoi(argv[++i]));
        else if (!std::strcmp(argv[i], "--star") && i + 1 < argc) star = std::atoi(argv[++i]);
        else if (!std::strcmp(argv[i], "--verbose")) verbose = true;
        else if (!std::strcmp(argv[i], "--topics")) listTopics = true;
        else if (!std::strcmp(argv[i], "--surface")) surface = true;
        else if (!std::strcmp(argv[i], "--report")) report = true;
        else if (!std::strcmp(argv[i], "--difficulty") && i + 1 < argc) difficulty = std::atoi(argv[++i]);
        else if (!std::strcmp(argv[i], "--inspect") && i + 1 < argc) inspect = argv[++i];
        else if (!std::strcmp(argv[i], "--save") && i + 1 < argc) saveTo = argv[++i];
        else if (!std::strcmp(argv[i], "--dump") && i + 1 < argc) dumpTurns.insert(std::atoi(argv[++i]));
        else if (!std::strcmp(argv[i], "--dump2") && i + 1 < argc) dump2Turns.insert(std::atoi(argv[++i]));
    }
    data::GameFiles files;
    if (!files.open(argv[1])) {
        std::fprintf(stderr, "cannot open %s\n", argv[1]);
        return 1;
    }
    GameData data;
    std::string err;
    if (!data.load(files, &err)) {
        std::fprintf(stderr, "%s\n", err.c_str());
        return 1;
    }

    if (!inspect.empty()) {
        // Load a save and show its colonies below ground: each building's
        // type, place, state and network flags (1 air, 2 power), and a map
        // of level 1 round the colony's UG cores.
        std::ifstream f(inspect, std::ios::binary);
        std::vector<uint8_t> bytes((std::istreambuf_iterator<char>(f)), {});
        data::OpsSave save;
        Simulation sim(data, 1);
        std::string e;
        if (!save.parse(bytes) || !loadOps(sim, save, nullptr, &e)) {
            std::fprintf(stderr, "cannot load %s: %s\n", inspect.c_str(), e.c_str());
            return 1;
        }
        std::printf("turn %u\n", unsigned(sim.turn()));
        if (report) {
            // The colony report the bot prints with --dump, for a save.
            NewGame game;
            for (const Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
                if (c->player.index() != 1) continue;
                Bot b{data, sim, game, c->owner};
                b.dump(c->self);
            }
            return 0;
        }
        for (int pass = 0; pass < 2; ++pass) {
            if (pass == 1) {
                sim.runTurns(1);
                std::printf("-- after one more turn (%u)\n", unsigned(sim.turn()));
            }
            for (const Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
                const Site* st = sim.siteOf(*c);
                const Tile* hubTile = sim.db().get<Tile>(c->hub);
                std::printf("colony %u \"%s\" player %u people %d site depth %d hub %d,%d\n", c->self.index(),
                            c->name.c_str(), c->player.index(), int(c->population.total()), st ? int(st->depth) : -1,
                            hubTile ? int(hubTile->x) : -1, hubTile ? int(hubTile->y) : -1);
                for (Handle th : c->tiles.order()) {
                    const Tile* t = sim.db().get<Tile>(th);
                    const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
                    if (!b || (t->level == 0 && !surface) || b->type <= 9) continue;
                    std::printf("  L%d %3d,%3d type %3u state %u flags %u\n", t->level, t->x, t->y, b->type, b->state, b->flags);
                }
                // Level 1 round each UG core.
                Grid* g = st ? sim.gridOfSite(st->self) : nullptr;
                if (!g || pass == 1) continue;
                for (Handle th : c->tiles.order()) {
                    const Tile* t = sim.db().get<Tile>(th);
                    const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
                    if (!b || b->type != 106) continue;
                    std::printf("  map of level 1 round the UG core at %d,%d (type of each cell, . terrain):\n", t->x, t->y);
                    for (int dy = -6; dy <= 6; ++dy) {
                        std::printf("   ");
                        for (int dx = -8; dx <= 8; ++dx) {
                            const Tile* u = sim.db().get<Tile>(g->tileAt({int16_t(t->x + dx), int16_t(t->y + dy), 1}));
                            const Building* ub = u ? sim.db().get<Building>(u->building) : nullptr;
                            if (!ub || ub->type <= 9) std::printf("   .");
                            else std::printf(" %3u", ub->type);
                        }
                        std::printf("\n");
                    }
                    const Tile* up = sim.tileAt(t->owner, t->x, t->y, 0);
                    const Building* ab = up ? sim.db().get<Building>(up->building) : nullptr;
                    std::printf("  above it: type %d flags %d\n", ab ? ab->type : -1, ab ? ab->flags : -1);
                }
            }
        }
        return 0;
    }

    if (listTopics) {
        Simulation probe(data, 1);
        NewGame g;
        g.load(data);
        g.start(probe);
        const Player* p = probe.db().get<Player>(kPlayer1);
        for (const auto& t : data.research.topics())
            std::printf("%3u %-40s parent %4d cost %3u %s remaining %d\n", t.id, t.name.c_str(), t.parent, t.cost,
                        t.advanced ? "adv" : "   ", p && t.id < p->remaining.size() ? int(p->remaining[t.id]) : -99);
        return 0;
    }

    // The new game, as the start screens make it.
    Simulation sim(data, seed);
    sim.setDifficulty(difficulty);
    sim.setAutoTrucking(true);
    NewGame game;
    game.load(data);
    game.modernize();
    game.start(sim);
    ShipConfig ship;
    ship.load(data.exe);
    ship.openImproved();
    // The bot's own choice of cargo within the budget (I102: the default is
    // only the minimums): food, life support, a second Tokamak, solar power,
    // a probe and a ComSat.
    struct Cargo {
        uint16_t kind;
        int n;
    };
    for (const Cargo& c : {Cargo{129, 19}, Cargo{130, 5}, Cargo{19, 1}, Cargo{0x83, 1}, Cargo{18, 2}, Cargo{0x84, 1},
                           Cargo{0x87, 1}})
        for (size_t r = 0; r < ShipConfig::kRows; ++r)
            if (ship.rows()[r].kind == c.kind)
                for (int k = 0; k < c.n; ++k) ship.stepLinked(r, true);
    std::printf("cargo: %d weight and %d funds left\n", int(ship.remainingWeight), int(ship.remainingFunds));
    ship.launch(sim);
    game.selectStar(sim, uint16_t(star));
    for (uint16_t k : {uint16_t(0x83), uint16_t(0x84), uint16_t(0x87)})                           // the satellites and probe carried
        while (sim.orbitals().aboard(k) > 0) sim.launchOrbital(k);
    Planet* planet = nullptr;
    for (Planet* p : sim.db().allOf<Planet>(ObjType::Planet))
        if (!p->siteIds.empty() && (!planet || p->hostility < planet->hostility)) planet = p;
    if (!planet) {
        std::fprintf(stderr, "no planet with sites\n");
        return 1;
    }
    std::printf("star %d, planet %s (template %u, hostility %d)\n", star, planet->name.c_str(), planet->nameId,
                planet->hostility);
    game.selectPlanet(sim, planet->self);
    Handle site;
    for (Site* s : sim.db().allOf<Site>(ObjType::Site)) if (!site) site = s->self;
    if (!site) {
        std::fprintf(stderr, "no site\n");
        return 1;
    }

    Bot bot{data, sim, game, site};
    bot.verbose = verbose;
    // The Seed Lander, from the middle outwards (as the colony screen's
    // scripted landing does).
    Grid* g = sim.gridOfSite(site);
    bool landed = false;
    for (int r = 0; r < 60 && !landed; ++r)
        for (int dx = -r; dx <= r && !landed; ++dx)
            for (int dy = -r; dy <= r && !landed; ++dy) {
                if (std::max(std::abs(dx), std::abs(dy)) != r) continue;
                const MapCell c{int16_t(g->width() / 2 + dx), int16_t(g->height() / 2 + dy), 0};
                if (sim.playerPutBuilding(site, c, 10, kColony1)) {
                    sim.enqueue(game.makeSelectStep(site));
                    landed = true;
                    bot.centreX = c.x;
                    bot.centreY = c.y;
                    std::printf("landed at %d,%d\n", c.x, c.y);
                }
            }
    if (!landed) {
        std::fprintf(stderr, "could not land\n");
        return 1;
    }

    int breakdowns = 0, repairs = 0;
    for (int t = 0; t < turns; ++t) {
        try {
            if (bot.colony()) {
                bot.landers();
                bot.manageFactories();
                bot.manageLabs();
                bot.digShaft();
                bot.reconnectCentre();
                bot.trade();
                bot.sendMiners();
                bot.build();
            }
            sim.runTurns(1);
            if (dumpTurns.count(int(sim.turn()))) bot.dump();
            if (dump2Turns.count(int(sim.turn()))) bot.dump(Handle::make(ObjType::Colony, 2));
            // The game's log messages (channel 0x37) and alerts (0x2B), as
            // the colony screen collects and clears them.
            for (const Notice& n : sim.notices()) {
                if (n.channel == 0x37) ++bot.logCodes[n.code];
                if (n.channel == kBreakdownNotice) {                  // I108
                    ++(n.code == 2 ? repairs : breakdowns);
                    if (verbose || n.code != 2)
                        std::printf("  turn %u: type %d %s\n", unsigned(sim.turn()), int(n.value),
                                    n.code != 2 ? "broke down" : "repaired");
                }
            }
            sim.clearNotices();
            bot.check();
            if ((t + 1) % 25 == 0 && bot.colony()) bot.roundTrip();
        } catch (const std::exception& e) {
            bot.problem(std::string("exception: ") + e.what());
            break;
        }
        if (sim.gameLost()) {
            std::printf("game lost at turn %u\n", unsigned(sim.turn()));
            break;
        }
        if ((t + 1) % 20 == 0) bot.reportRebels();
        if ((t + 1) % 20 == 0)
            if (const Colony* c = bot.colony()) {
                std::printf("turn %3u: people %5d food %6d power %5d morale %4d buildings %zu robots d%d g%d m%d t%d\n",
                            unsigned(sim.turn()), int(c->population.total()), int(c->total[data::res::Food]),
                            int(c->total[data::res::Power]), int(c->morale), sim.db().all(ObjType::Building).size(),
                            int(c->linkedCount[product::Dozer]), int(c->linkedCount[product::Digger]),
                            int(c->linkedCount[product::Miner]), int(c->linkedCount[product::Truck]));
            }
    }

    std::printf("\nbuilt (type x count):");
    for (auto [t, n] : bot.built) std::printf(" %u x%d", t, n);
    std::printf("\nnever operational of those built:");
    for (auto [t, n] : bot.built)
        if (!bot.everOperational.count(t) && !(t >= 115 && t <= 122) && t != 127) std::printf(" %u", t);
    std::printf("\nrefused (type: message id x count):\n");
    for (auto& [t, m] : bot.refusedWhy) {
        std::printf("  %u:", t);
        for (auto [id, n] : m) std::printf(" %u x%d", id, n);
        std::printf("\n");
    }
    if (const Player* p = sim.db().get<Player>(kPlayer1)) {
        int done = 0;
        for (const auto& t : data.research.topics())
            if (t.id < p->remaining.size() && p->remaining[t.id] == 0) ++done;
        std::printf("research topics done: %d (", done);
    for (auto [t, turn] : bot.topicsDone) std::printf(" %u@%d", t, turn);
    std::printf(" )\n");
    }
    std::printf("trades: took %d rebel offers, offered %d, %d accepted; rebels' attitude %d, %d deals\n",
                bot.tradesTaken, bot.tradesOffered, bot.tradesAccepted, sim.rebelRelations().attitude,
                sim.rebelRelations().trades);
    std::printf("breakdowns: %d, repaired %d, broken now %zu\n", breakdowns, repairs, sim.breakdowns().broken.size());
    std::printf("log messages (code x times):");
    for (auto [code, n] : bot.logCodes) std::printf(" %u x%d", code, n);
    std::printf("\n");
    std::printf("problems: %zu kinds\n", bot.problems.size());
    for (auto& [s, n] : bot.problems) std::printf("  %s (x%d)\n", s.c_str(), n);
    if (!saveTo.empty()) {
        const auto bytes = writeOps(sim);
        std::ofstream f(saveTo, std::ios::binary);
        f.write(reinterpret_cast<const char*>(bytes.data()), std::streamsize(bytes.size()));
        std::printf("saved to %s\n", saveTo.c_str());
    }
    return 0;
}
