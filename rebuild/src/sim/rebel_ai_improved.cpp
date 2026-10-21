#include "sim/rebel_ai_improved.hpp"

#include "sim/building.hpp"
#include "sim/ops_extensions.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cmath>
#include <cstdlib>

namespace outpost::sim {

namespace {

using namespace data::res;

const Handle kColony1 = Handle::make(ObjType::Colony, 1);
constexpr int kMargin = 11;                     // the rebels keep off the map's edges (s5:B1AE)

// What the rebels want standing, in order. A count of 0 scales with the
// colony: one home (79) or dome (27) for every 25 people.
struct Want {
    uint16_t type;
    int count;
    bool underground;
};
constexpr Want kWants[] = {
    {42, 1, false},  {27, 2, false}, {20, 1, false}, {79, 2, true},  {60, 1, false}, {53, 1, false}, {16, 2, false},
    {58, 1, false},  {93, 1, true},  {84, 1, true},  {82, 1, true},  {27, 0, false}, {79, 0, true},
    {87, 1, true},   {104, 1, true}, {30, 1, false}, {16, 4, false}, {102, 1, true}, {90, 1, true},
    {60, 2, false},  {93, 2, true},  {82, 2, true},  {87, 2, true},  {108, 1, true}, {16, 6, false},
};

int countOf(Simulation& sim, const Colony& c, uint16_t type) {
    int n = 0;
    for (Handle th : c.tiles.order())
        if (const Tile* t = sim.db().get<Tile>(th))
            if (const Building* b = sim.db().get<Building>(t->building))
                if (b->type == type || (type == 16 && (b->type == 51 || b->type == 52)) ||
                    (type == 20 && (b->type == 19 || b->type == 21)))
                    ++n;   // 16: mines, 20: any Tokamak
    return n;
}

int target(const Colony& c, const Want& w) {
    if (w.count > 0) return w.count;
    return std::max(2, int(c.population.total()) / 25 + 1);
}

const Tile* hubOf(Simulation& sim, const Colony& c) { return sim.db().get<Tile>(c.hub); }

bool insideMargin(const Simulation& sim, const Site& s, const MapCell& p) {
    (void)sim;
    return p.x > kMargin && p.y > kMargin && p.x < s.mapSize.x - kMargin && p.y < s.mapSize.y - kMargin;
}

// A free cell on `level` round `around`, nearest first: no building but
// terrain, and ground that can be built on (not impassable).
std::optional<MapCell> freeCellNear(Simulation& sim, const Site& site, MapCell around) {
    Grid* g = sim.gridOfSite(site.self);
    if (!g) return std::nullopt;
    for (int r = 1; r <= 18; ++r)
        for (int dy = -r; dy <= r; ++dy)
            for (int dx = -r; dx <= r; ++dx) {
                if (std::max(std::abs(dx), std::abs(dy)) != r) continue;
                const MapCell c{int16_t(around.x + dx), int16_t(around.y + dy), around.level};
                if (!insideMargin(sim, site, c)) continue;
                if (const Tile* t = sim.db().get<Tile>(g->tileAt(c)))
                    if (const Building* b = sim.db().get<Building>(t->building); b && (b->type < 1 || b->type > 9))
                        continue;
                const uint16_t k = sim.cellKind(site.self, c);
                if (k == 0 || k == 4 || k == 9) continue;
                return c;
            }
    return std::nullopt;
}

// The BLDGBLD needs of a type (17..28): the price the rebels pay.
const std::array<int32_t, Count>* costOf(const Simulation& sim, uint16_t type) {
    const auto& bb = sim.data().bldgBld;
    return type < bb.size() ? &bb[type].need : nullptr;
}

bool canPay(const Simulation& sim, const Colony& c, uint16_t type, uint16_t* lacking = nullptr) {
    const auto* need = costOf(sim, type);
    if (!need) return true;
    for (int r = MetalA; r <= FusionC; ++r)
        if ((*need)[size_t(r)] > colonyStock(sim, c, uint16_t(r))) {
            if (lacking) *lacking = uint16_t(r);
            return false;
        }
    return true;
}

void take(Simulation& sim, Colony& c, uint16_t res, int32_t amount) {
    for (Handle th : c.tiles.order()) {
        if (amount <= 0) return;
        Tile* t = sim.db().get<Tile>(th);
        if (!t) continue;
        const int32_t v = t->bas.get(res);
        if (v <= 0) continue;
        const int32_t n = std::min(v, amount);
        t->bas.set(res, v - n);
        c.addTotal(-n, res);                 // the totals the screens show move at once
        amount -= n;
    }
}

// Goods go to the colony's storage (tanks, group 3), else its hub.
void put(Simulation& sim, Colony& c, uint16_t res, int32_t amount) {
    Tile* best = nullptr;
    for (Tile* t : sim.colonyTilesInGroup(c, 3, false)) {
        int32_t stored = 0;
        for (const auto& [r, v] : t->bas.entries()) if (r > 0) stored += v;
        if (stored + amount <= 1000) { best = t; break; }
    }
    if (!best) best = sim.db().get<Tile>(c.hub);
    if (best) {
        best->bas.add(res, amount);
        c.addTotal(amount, res);
    }
}

void payFor(Simulation& sim, Colony& c, uint16_t type) {
    if (const auto* need = costOf(sim, type))
        for (int r = MetalA; r <= FusionC; ++r)
            if ((*need)[size_t(r)] > 0) take(sim, c, uint16_t(r), (*need)[size_t(r)]);
}

bool addTile(Simulation& sim, Colony& c, Tile& t) {
    t.colony = c.self;
    if (!c.tiles.contains(t.self)) c.tiles.add(t.self, sim.data().priorityOf(0));
    return true;
}

// A mine on the free beacon nearest the rebels' hub (and a UG mine below,
// as a RoboMiner's work leaves it, s6:199A).
bool buildMine(Simulation& sim, Colony& c, const Site& site) {
    const Tile* hub = hubOf(sim, c);
    if (!hub) return false;
    Tile* best = nullptr;
    int bestD = 1 << 30;
    for (Tile* t : sim.db().allOf<Tile>(ObjType::Tile)) {
        if (t->owner != site.self || t->level != 0 || (t->colony && t->colony != c.self)) continue;
        const Building* b = sim.db().get<Building>(t->building);
        if (!b || b->type != 16) continue;
        const int d = std::abs(t->x - hub->x) + std::abs(t->y - hub->y);
        if (d < bestD && d <= 90) {
            bestD = d;
            best = t;
        }
    }
    if (!best) return false;
    addTile(sim, c, *best);
    sim.putBuildingAt(site.self, {best->x, best->y, 0}, 51, c.self);
    sim.putBuildingAt(site.self, {best->x, best->y, 1}, 96, c.self);
    return true;
}

// A Tokamak eight cells out from the hub, joined by a line of X tubes (the
// rebels' buildings run without power in v1.51, but a colony that joins the
// player needs it, and SCMorale counts every cell within 5 of a Tokamak).
bool buildPowerLine(Simulation& sim, Colony& c, const Site& site) {
    Grid* g = sim.gridOfSite(site.self);
    const Tile* first = hubOf(sim, c);
    if (!first || !g) return false;
    std::vector<const Tile*> starts{first};
    for (Handle th : c.tiles.order())
        if (const Tile* t = sim.db().get<Tile>(th); t && t != first && t->level == 0)
            if (const Building* b = sim.db().get<Building>(t->building); b && b->type > 9) starts.push_back(t);
    static constexpr int kDir[4][2] = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
    for (const Tile* hub : starts)
    for (const auto& d : kDir) {
        std::vector<MapCell> line;
        bool ok = true;
        for (int i = 1; i <= 8 && ok; ++i) {
            const MapCell cell{int16_t(hub->x + d[0] * i), int16_t(hub->y + d[1] * i), 0};
            if (!insideMargin(sim, site, cell)) { ok = false; break; }
            const Tile* t = sim.db().get<Tile>(g->tileAt(cell));
            const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
            const bool own = b && t->colony == c.self && b->type > 9;
            if (own && i < 8) continue;                       // their own buildings conduct
            if (b && b->type > 9) { ok = false; break; }      // someone else's, or the end is taken
            const uint16_t k = sim.cellKind(site.self, cell);
            if (k == 0 || k == 4 || k == 9) { ok = false; break; }
            line.push_back(cell);
        }
        if (!ok || line.empty()) continue;
        for (size_t i = 0; i + 1 < line.size(); ++i) sim.putBuildingAt(site.self, line[i], 122, c.self);
        sim.putBuildingAt(site.self, line.back(), 20, c.self);
        return true;
    }
    return false;
}

bool build(Simulation& sim, Colony& c, const Site& site, uint16_t type, bool underground) {
    if (type == 16) return buildMine(sim, c, site);
    if (type == 20) return buildPowerLine(sim, c, site);
    const Tile* hub = hubOf(sim, c);
    if (!hub) return false;
    MapCell around{hub->x, hub->y, 0};
    if (underground) {
        // Round the rebels' UG core (set up by rebelSetup, s5:A89E).
        bool found = false;
        for (Handle th : c.tiles.order())
            if (const Tile* t = sim.db().get<Tile>(th))
                if (const Building* b = sim.db().get<Building>(t->building); b && b->type == 106) {
                    around = {t->x, t->y, t->level};
                    found = true;
                    break;
                }
        if (!found) return false;
    }
    const auto at = freeCellNear(sim, site, around);
    if (!at) return false;
    if (!sim.putBuildingAt(site.self, *at, type, c.self)) return false;
    if (underground) soften(sim, site.self, c.self, *at);
    return true;
}

// The resource the rebels lack most for what they want next, and the one
// they hold most of (by value) beyond a reserve.
uint16_t mostWanted(Simulation& sim, const Colony& c) {
    for (const Want& w : kWants) {
        if (countOf(sim, c, w.type) >= target(c, w)) continue;
        uint16_t lacking = 0;
        if (!canPay(sim, c, w.type, &lacking)) return lacking;
        return 0;
    }
    return 0;
}

uint16_t biggestSurplus(Simulation& sim, const Colony& c, uint16_t notThis) {
    uint16_t best = 0;
    int32_t bestValue = 0;
    for (uint16_t r : tradeableResources()) {
        if (r == notThis) continue;
        const int32_t spare = colonyStock(sim, c, r) - (r == Food ? 200 : 60);
        if (spare <= 0) continue;
        const int32_t v = tradeValue(sim, r, spare);
        if (v > bestValue) {
            bestValue = v;
            best = r;
        }
    }
    return best;
}

double fairness(const Simulation& sim, int attitude) {
    double f = 0.8 + attitude / 250.0;                       // 0.8 .. 1.2
    const int d = sim.difficulty();
    if (d <= 2) f += 0.1;
    else if (d == 4) f -= 0.1;
    return f;
}

void ensureAgreement(Simulation& sim, Colony& rebels, const Site& site) {
    auto& list = sim.tradeAgreements();
    if (list.empty()) list.push_back(TradeAgreement{1, sim.turn(), 0});
    else if (list.front().state != 1) list.front() = TradeAgreement{1, sim.turn(), 1};
    // s7:E410: the partner without a Trade center (33) puts one up at its
    // hub + (3, -3), with X tubes at + (2, -3) and + (3, -2).
    if (countOf(sim, rebels, 33) > 0) return;
    const Tile* hub = hubOf(sim, rebels);
    if (!hub) return;
    const int16_t x = hub->x, y = hub->y;
    auto freeAt = [&](int16_t dx, int16_t dy) {
        const MapCell c{int16_t(x + dx), int16_t(y + dy), 0};
        Grid* g = sim.gridOfSite(site.self);
        const Tile* t = g ? sim.db().get<Tile>(g->tileAt(c)) : nullptr;
        const Building* b = t ? sim.db().get<Building>(t->building) : nullptr;
        return !b || (b->type >= 1 && b->type <= 9);
    };
    if (freeAt(2, -3)) sim.putBuildingAt(site.self, {int16_t(x + 2), int16_t(y - 3), 0}, 122, rebels.self);
    if (freeAt(3, -2)) sim.putBuildingAt(site.self, {int16_t(x + 3), int16_t(y - 2), 0}, 122, rebels.self);
    if (freeAt(3, -3)) sim.putBuildingAt(site.self, {int16_t(x + 3), int16_t(y - 3), 0}, 33, rebels.self);
}

bool doTrade(Simulation& sim, const TradeOffer& deal) {
    Colony* me = playerColonyOf(sim);
    Colony* them = rebelColonyOf(sim);
    if (!me || !them) return false;
    take(sim, *me, deal.give.res, deal.give.amount);
    put(sim, *them, deal.give.res, deal.give.amount);
    take(sim, *them, deal.get.res, deal.get.amount);
    put(sim, *me, deal.get.res, deal.get.amount);
    RebelRelations& rel = sim.rebelRelations();
    rel.attitude = std::min(100, rel.attitude + 5);
    ++rel.trades;
    if (const Site* s = sim.siteOf(*them)) ensureAgreement(sim, *them, *s);
    sim.post({kRebelNotice, 2, them->self, 0});
    return true;
}

// The whole rebel colony joins the player, its people, buildings and stores
// with it. (v1.51 hands a colony over only once the last rebel has left one
// by one, s8:349E, and its hand-over, slot 22, empties every store: right
// for an empty colony, not for one that comes whole, so it is not used.)
void joinPlayer(Simulation& sim, Colony& rebels) {
    rebels.player = Handle::make(ObjType::Player, 1);
    rebels.setMorale(600);
    rebels.nanotech = false;
    rebels.freeResources = false;
    for (Handle h : rebels.tiles.order()) {
        Tile* t = sim.db().get<Tile>(h);
        if (Building* b = t ? sim.db().get<Building>(t->building) : nullptr) b->tag1C = 0;
    }
    // The rebels built without robots; a colony the player runs needs them
    // (mines go deeper only with a RoboMiner, s6:1824): they bring a set.
    if (Tile* hub = sim.db().get<Tile>(rebels.hub)) {
        addUnits(sim, *hub, 1, product::Dozer);
        addUnits(sim, *hub, 1, product::Digger);
        addUnits(sim, *hub, 1, product::Miner);
        addUnits(sim, *hub, 2, product::Truck);
    }
    sim.rebelRelations().offer.reset();
    sim.post({kRebelNotice, 5, rebels.self, 0});
}

class RebelManagerStep final : public Step {
public:
    std::string_view name() const override { return "SCRebels"; }   // the rebuild's own
    uint16_t priority() const override { return stepcode::RebelManager - 1; }
    // Queued only while there is a rebel colony (so a world without one
    // keeps v1.51's turn exactly).
    bool shouldRun(Simulation& sim) override { return rebelColonyOf(sim) != nullptr; }
    void calcMe(Simulation& sim) override {
        Colony* c = rebelColonyOf(sim);
        if (!c || c->population.total() <= 0) return;
        const Site* site = sim.siteOf(*c);
        if (!site || !sim.gridOfSite(site->self)) return;
        RebelRelations& rel = sim.rebelRelations();
        const uint32_t turn = sim.turn();
        // A colony the rebels admire, and good friends: they join it whole
        // (otherwise v1.51's defections take them one by one, s8:05D8).
        if (const Colony* me = playerColonyOf(sim)) {
            rel.admired = me->morale >= 800 ? rel.admired + 1 : 0;
            bool powered = false;
            for (Handle th : c->tiles.order())
                if (const Tile* t = sim.db().get<Tile>(th))
                    if (const Building* b = sim.db().get<Building>(t->building);
                        b && b->type >= 19 && b->type <= 21 && b->state == Building::kOperational)
                        powered = true;
            if (rel.admired >= 3 && rel.attitude >= 70 && powered) {
                joinPlayer(sim, *c);
                return;
            }
        }
        // Attitude drifts back towards 50.
        if (turn % 10 == 0) rel.attitude += rel.attitude < 50 ? 1 : rel.attitude > 50 ? -1 : 0;

        // Building, at the difficulty's pace.
        if (turn >= rel.nextBuildTurn) {
            const int d = sim.difficulty();
            rel.nextBuildTurn = turn + uint32_t(d <= 2 ? 6 : d == 3 ? 4 : 3);
            for (const Want& w : kWants) {
                if (countOf(sim, *c, w.type) >= target(*c, w)) continue;
                if (!canPay(sim, *c, w.type)) break;            // save up (and look to trade)
                if (build(sim, *c, *site, w.type, w.underground)) {
                    payFor(sim, *c, w.type);
                    sim.post({kRebelNotice, 4, c->self, int32_t(w.type)});
                    break;
                }
            }
        }
        // Growth while the homes have room (their own babies are not
        // stored in v1.51, a quirk; here a cohort joins every 12 turns).
        if (turn % 12 == 0) {
            const int homes = countOf(sim, *c, 79) + countOf(sim, *c, 80) + countOf(sim, *c, 81);
            const int32_t people = c->population.total();
            if (people < homes * 25) c->population.addNewborns(std::max<int32_t>(1, people / 12));
        }
        // An offer lapses, or a new one is made.
        if (rel.offer && turn > rel.offer->expires) {
            rel.offer.reset();
            sim.post({kRebelNotice, 3, c->self, 0});
        }
        if (!rel.offer && turn >= rel.nextOfferTurn && rel.attitude >= 20) {
            rel.nextOfferTurn = turn + uint32_t(sim.random(12, 20));
            Colony* me = playerColonyOf(sim);
            uint16_t want = mostWanted(sim, *c);
            if (!want && me) {
                // Nothing lacking: they would still take what the player
                // holds plenty of.
                const uint16_t s = biggestSurplus(sim, *me, 0);
                want = s;
            }
            const uint16_t give = biggestSurplus(sim, *c, want);
            if (want && give && me) {
                const int32_t wantAmount = std::clamp<int32_t>(colonyStock(sim, *me, want) / 4, 10, 80);
                const double worth = tradeValue(sim, want, wantAmount) * fairness(sim, rel.attitude);
                int32_t giveAmount = 0;
                while (tradeValue(sim, give, giveAmount + 1) <= worth) ++giveAmount;
                giveAmount = std::min(giveAmount, colonyStock(sim, *c, give) - (give == Food ? 200 : 60));
                if (giveAmount > 0 && colonyStock(sim, *me, want) >= wantAmount) {
                    rel.offer = TradeOffer{{want, wantAmount}, {give, giveAmount}, turn + 8};
                    sim.post({kRebelNotice, 1, c->self, 0});
                }
            }
        }
    }
};

} // namespace

std::unique_ptr<Step> makeRebelManagerStep() { return std::make_unique<RebelManagerStep>(); }

Colony* rebelColonyOf(Simulation& sim) {
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony))
        if (c->player == kRebelPlayer) return c;
    return nullptr;
}

Colony* playerColonyOf(Simulation& sim) { return sim.db().get<Colony>(kColony1); }

int32_t colonyStock(const Simulation& sim, const Colony& c, uint16_t res) {
    int32_t n = 0;
    for (Handle th : c.tiles.order())
        if (const Tile* t = sim.db().get<Tile>(th)) n += t->bas.get(res);
    return n;
}

// s4:456A, the resources page (392).
int32_t tradeValue(const Simulation& sim, uint16_t res, int32_t amount) {
    int32_t unit = 1;
    if (res >= 17 && res <= 21) unit = 2;
    else if (res == 22) unit = 3;
    else if (res == 29 || res == 33) unit = 4;
    else if (res == 30) unit = 3;
    const int32_t base = unit * amount;
    const int32_t swing = sim.tradeMarketCreated() ? const_cast<Simulation&>(sim).tradeMarket().swing : 0;
    return base + base * swing / 100;
}

const std::vector<uint16_t>& tradeableResources() {
    static const std::vector<uint16_t> v = {17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 30};
    return v;
}

TradeAnswer proposeTrade(Simulation& sim, const TradeOffer& deal) {
    Colony* me = playerColonyOf(sim);
    Colony* them = rebelColonyOf(sim);
    if (!me || !them || them->population.total() <= 0) return TradeAnswer::NoRebels;
    if (deal.give.amount <= 0 || deal.get.amount <= 0) return TradeAnswer::TooLittle;
    if (colonyStock(sim, *me, deal.give.res) < deal.give.amount) return TradeAnswer::YouLack;
    const int32_t reserve = deal.get.res == Food ? 200 : 60;
    if (colonyStock(sim, *them, deal.get.res) - reserve < deal.get.amount) return TradeAnswer::TheyLack;
    RebelRelations& rel = sim.rebelRelations();
    // They value what they lack more.
    double worth = tradeValue(sim, deal.give.res, deal.give.amount) * fairness(sim, rel.attitude);
    if (deal.give.res == mostWanted(sim, *them)) worth *= 1.25;
    if (worth < tradeValue(sim, deal.get.res, deal.get.amount)) {
        rel.attitude = std::max(0, rel.attitude - 1);
        return TradeAnswer::TooLittle;
    }
    doTrade(sim, deal);
    return TradeAnswer::Accepted;
}

TradeAnswer acceptRebelOffer(Simulation& sim) {
    RebelRelations& rel = sim.rebelRelations();
    if (!rel.offer) return TradeAnswer::NoRebels;
    Colony* me = playerColonyOf(sim);
    Colony* them = rebelColonyOf(sim);
    if (!me || !them) return TradeAnswer::NoRebels;
    if (colonyStock(sim, *me, rel.offer->give.res) < rel.offer->give.amount) return TradeAnswer::YouLack;
    if (colonyStock(sim, *them, rel.offer->get.res) < rel.offer->get.amount) return TradeAnswer::TheyLack;
    const TradeOffer deal = *rel.offer;
    rel.offer.reset();
    doTrade(sim, deal);
    return TradeAnswer::Accepted;
}

void declineRebelOffer(Simulation& sim) {
    RebelRelations& rel = sim.rebelRelations();
    if (!rel.offer) return;
    rel.offer.reset();
    rel.attitude = std::max(0, rel.attitude - 2);
}

std::string attitudeWord(int a) {
    if (a >= 80) return "very friendly";
    if (a >= 60) return "friendly";
    if (a >= 40) return "neutral";
    if (a >= 20) return "wary";
    return "hostile";
}

namespace {

// The extension chunk entry "rebels.relations" (sim/ops_extensions): a
// version byte, then the fields in order, little-endian. Left out while the
// relations are at their defaults, so such a save keeps the original format.
const bool kRelationsRegistered = [] {
    registerExtension(
        "rebels.relations",
        [](const Simulation& sim) {
            std::vector<uint8_t> out;
            const RebelRelations& r = sim.rebelRelations();
            const RebelRelations d;
            if (r.attitude == d.attitude && !r.offer && r.nextOfferTurn == d.nextOfferTurn &&
                r.nextBuildTurn == d.nextBuildTurn && r.trades == d.trades && r.admired == d.admired)
                return out;
            auto put = [&out](uint32_t v, int n) {
                for (int i = 0; i < n; ++i) out.push_back(uint8_t(v >> (8 * i)));
            };
            put(1, 1);
            put(uint32_t(r.attitude), 4);
            put(r.offer ? 1 : 0, 1);
            const TradeOffer o = r.offer.value_or(TradeOffer{});
            put(o.give.res, 2);
            put(uint32_t(o.give.amount), 4);
            put(o.get.res, 2);
            put(uint32_t(o.get.amount), 4);
            put(o.expires, 4);
            put(r.nextOfferTurn, 4);
            put(r.nextBuildTurn, 4);
            put(uint32_t(r.trades), 4);
            put(uint32_t(r.admired), 4);
            return out;
        },
        [](Simulation& sim, std::span<const uint8_t> b) {
            RebelRelations r;
            size_t p = 0;
            auto get = [&](int n) {
                uint32_t v = 0;
                for (int i = 0; i < n && p < b.size(); ++i, ++p) v |= uint32_t(b[p]) << (8 * i);
                return v;
            };
            if (b.size() < 38 || get(1) != 1) {   // 38 bytes: version 1
                sim.rebelRelations() = r;
                return;
            }
            r.attitude = int(int32_t(get(4)));
            const bool hasOffer = get(1) != 0;
            TradeOffer o;
            o.give.res = uint16_t(get(2));
            o.give.amount = int32_t(get(4));
            o.get.res = uint16_t(get(2));
            o.get.amount = int32_t(get(4));
            o.expires = get(4);
            if (hasOffer) r.offer = o;
            r.nextOfferTurn = get(4);
            r.nextBuildTurn = get(4);
            r.trades = int(int32_t(get(4)));
            r.admired = int(int32_t(get(4)));
            sim.rebelRelations() = r;
        });
    return true;
}();

} // namespace

} // namespace outpost::sim
