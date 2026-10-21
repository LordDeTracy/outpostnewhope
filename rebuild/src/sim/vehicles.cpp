// Truck trips and the vehicle manager: the player's routes (s8:1C3E) and
// the trips' movement and delivery (s8:6A0E, s8:7356). findings/10-map.md §3e.

#include "sim/vehicles.hpp"

#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>

namespace outpost::sim {

namespace {

constexpr int kSmelters = 1, kMines = 2, kStorage = 3, kWarehouses = 4, kFactories = 5,
              kUGFactories = 6, kMonorailStops = 0x40, kGroup41 = 0x41, kGroup42 = 0x42;
constexpr uint32_t kLoad = 100;     // units per truck

bool inGroup(const Simulation& sim, int group, uint16_t type) {
    return sim.data().groups.contains(group, type);
}

const Building* buildingOn(Simulation& sim, Handle tile) {
    const Tile* t = sim.db().get<Tile>(tile);
    return t ? sim.db().get<Building>(t->building) : nullptr;
}

// s7:6C4C: the tile's trucks, at most its +0x32.
void setTrucks(Tile& t, int16_t n) { t.trucks = std::min<int16_t>(t.field32, n); }

// s6:45E2: a storage tank holds 1000 units of anything on its tile.
uint32_t storageRoom(const Tile& t) {
    int32_t stored = 0;
    for (const auto& [res, value] : t.bas.entries())
        if (res > 0) stored += value;
    return static_cast<uint32_t>(1000 - stored);
}

// s7:6A2C: onto the tile's +0x3E list, merged into an item of the same
// products (+0x04, +0x06, +0x08).
void holdItem(Tile& t, const ProductItem& item) {
    for (ProductItem& p : t.list3E)
        if (p.productA == item.productA && p.field04 == item.field04 && p.productB == item.productB) {
            p.quantity = static_cast<uint16_t>(p.quantity + item.quantity);
            p.units = static_cast<uint16_t>(p.units + item.units);
            return;
        }
    t.list3E.push_back(item);
}

Trip blankTrip(Handle home, int16_t trucks) {
    Trip trip;
    trip.home = home;
    trip.trucks = trucks;
    return trip;
}

// ── Routes (s8:1C3E) ──────────────────────────────────────────────────────

// s8:201A: a load waiting on the tile (+0x3A, set aside by the player) goes
// first, on as many trucks as it needs. Returns whether a trip left.
bool sendWaitingLoad(Simulation& sim, Tile& t) {
    if (t.list3A.empty()) return false;
    ProductItem item = t.list3A.front();          // s7:6B16: taken off the list
    t.list3A.erase(t.list3A.begin());
    const int32_t cap = int32_t(kLoad) * t.trucks;
    bool sent = false;
    auto trucksFor = [](int32_t amount) { return int16_t(amount / 100 + (amount % 100 ? 1 : 0)); };
    Trip trip = blankTrip(t.self, 0);
    if (item.field04 != 0) {
        const int32_t take = std::min<int32_t>(item.quantity, cap);
        item.quantity = static_cast<uint16_t>(item.quantity - take);
        trip.bas = item.field04;
        trip.quantity = static_cast<uint32_t>(take);
        trip.trucks = trucksFor(take);
        sent = true;
    } else if (item.productA != 0 || item.productB != 0) {
        const bool a = item.productA != 0;
        const uint16_t per = a ? productUnitValueA(item.productA) : productUnitValueB(item.productB);
        // IMPROVISED (guard): the EXE divides by the unit value unchecked.
        if (per != 0) {
            const int32_t take = std::min<int32_t>(int32_t(item.quantity) * per, cap);
            const int32_t n = take / per;
            item.quantity = static_cast<uint16_t>(item.quantity - n);
            (a ? trip.productA : trip.productB) = a ? item.productA : item.productB;
            trip.quantity = static_cast<uint32_t>(n);
            trip.trucks = trucksFor(take);
            sent = true;
        }
    }
    if (sent) {
        const int16_t used = trip.trucks;
        startTrip(sim, std::move(trip));
        setTrucks(t, static_cast<int16_t>(t.trucks - used));
    }
    if (item.quantity != 0) t.list3A.push_back(item);   // s7:6C66 with 0: back on the list
    return sent;
}

// s8:24E8: a smelter's output ledger, 100 units a truck.
void routeFromSmelter(Simulation& sim, Tile& t, SmelterBuilding& s) {
    int16_t trucks = t.trucks;
    uint32_t cap = kLoad;
    auto cargo = std::make_unique<Ledger>();
    // The table's entries are visited by index over the count read once.
    std::vector<std::pair<int, int32_t>> entries(s.output.entries().begin(), s.output.entries().end());
    for (auto [res, value] : entries) {
        if (value == 0) continue;
        const uint32_t take = std::min<uint32_t>(static_cast<uint32_t>(value), cap);
        s.output.set(res, static_cast<int32_t>(static_cast<uint32_t>(value) - take));
        cargo->add(res, static_cast<int32_t>(take));
        cap -= take;
        if (cap != 0) continue;
        Trip trip = blankTrip(t.self, 1);
        trip.cargo = std::move(cargo);
        startTrip(sim, std::move(trip));
        cargo = std::make_unique<Ledger>();
        if (--trucks == 0) break;
        cap = kLoad;
    }
    uint32_t left = 0;
    for (const auto& [res, v] : cargo->entries()) left += static_cast<uint32_t>(v);
    if (left != 0) {
        Trip trip = blankTrip(t.self, 1);
        trip.cargo = std::move(cargo);
        startTrip(sim, std::move(trip));
    }
    // The last load's truck is not counted off (s8:2658).
    setTrucks(t, trucks);
}

// s8:26EE: the ore on a mine's tile, ores in the mine's cycle (s6:0D80)
// once round. A new mine's cursor (0) ends the round at once.
void routeFromMine(Simulation& sim, Tile& t, MineBuilding& m) {
    int16_t trucks = t.trucks;
    uint32_t cap = kLoad;
    uint16_t ore = m.nextOre();
    uint16_t first = ore;
    auto cargo = std::make_unique<Ledger>();
    bool out = false;
    do {
        const auto qty = static_cast<uint32_t>(t.bas.get(ore));       // s7:7C28
        if (qty != 0) {
            const uint32_t take = std::min(qty, cap);
            t.bas.set(ore, static_cast<int32_t>(qty - take));          // s7:7D1C
            cargo->add(ore, static_cast<int32_t>(take));
            cap -= take;
            if (cap == 0) {
                Trip trip = blankTrip(t.self, 1);
                trip.cargo = std::move(cargo);
                startTrip(sim, std::move(trip));
                cargo = std::make_unique<Ledger>();
                if (--trucks == 0) {
                    out = true;
                    break;
                }
                cap = kLoad;
            }
        }
        ore = m.nextOre();
        if (first == 0) first = ore;
    } while (ore != first);
    (void)out;
    uint32_t left = 0;
    for (const auto& [res, v] : cargo->entries()) left += static_cast<uint32_t>(v);
    if (left != 0) {
        Trip trip = blankTrip(t.self, 1);
        trip.cargo = std::move(cargo);
        startTrip(sim, std::move(trip));
    }
    setTrucks(t, trucks);
}

// s8:2306: a factory's output list, an item at a time, up to 100 units a
// truck; what is left of an item goes to the back of the list.
void routeFromFactory(Simulation& sim, Tile& t, FactoryBuilding& f) {
    int16_t trucks = t.trucks;
    while (!f.output.empty()) {
        ProductItem item = f.output.front();
        f.output.erase(f.output.begin());
        if (item.quantity == 0) continue;                 // deleted
        const bool a = item.productA != 0;
        if (!a && item.productB == 0) continue;           // IMPROVISED (guard): EXE divides by 0
        const uint16_t per = a ? productUnitValueA(item.productA) : productUnitValueB(item.productB);
        if (per == 0) continue;                           // IMPROVISED (guard)
        const uint32_t take = std::min<uint32_t>(uint32_t(item.quantity) * per, kLoad);
        const uint32_t n = take / per;
        item.quantity = static_cast<uint16_t>(item.quantity - n);
        if (item.quantity != 0) f.output.push_back(item);
        Trip trip = blankTrip(t.self, 1);
        (a ? trip.productA : trip.productB) = a ? item.productA : item.productB;
        trip.quantity = n;
        startTrip(sim, std::move(trip));
        if (--trucks == 0) break;
    }
    setTrucks(t, trucks);
}

// ── Movement (s8:6A0E) ────────────────────────────────────────────────────

// s8:6B88: a cell's raw value. The original reads the site in view
// (registry 0x2F +0x20) whatever the trip's site; the rebuild reads the
// home tile's site (it has no view yet).
uint32_t cellValue(Simulation& sim, const Trip& trip, const MapCell& c) {
    const Tile* home = sim.db().get<Tile>(trip.home);
    Grid* g = home ? sim.gridOfSite(home->owner) : nullptr;
    return g ? g->value(c) : 0;
}

// s8:6E1A: the points a step onto a cell costs.
int16_t stepCost(Simulation& sim, uint32_t value) {
    if (value == 0) return 1;
    int kind = 0;
    if ((value >> 24) == 0) {
        kind = static_cast<int>(value & 0xFFFF);
    } else {
        const Building* b = buildingOn(sim, Handle{value});
        const uint16_t ty = b ? b->type : 0;
        if (ty <= 9) {
            static constexpr int k[10] = {0, 1, 2, 3, 4, 5, 2, 3, 4, 5};
            kind = k[ty];
        } else if (inGroup(sim, kGroup41, ty)) {
            kind = 10;
        } else if (inGroup(sim, kGroup42, ty) || ty == 63) {
            kind = 11;
        } else {
            kind = 5;
        }
    }
    static constexpr int16_t cost[12] = {-1, 20, 60, 120, 240, 15, 15, 60, 120, 240, 12, 10};
    return kind >= 1 && kind <= 11 ? cost[kind] : -1;   // -1 always fits (quirk Q60)
}

// s8:6D24: one step towards the stop: along x first, then y, then a level
// (only from a Core, 71, or UGCore, 106, at the trip's cell). Returns
// false when at the stop, or when the level cannot be changed.
bool stepToward(Simulation& sim, const Trip& trip, const MapCell& to, MapCell& out, uint32_t& value) {
    value = 0;
    const int dx = to.x - trip.pos.x, dy = to.y - trip.pos.y, dl = to.level - trip.pos.level;
    if (dx == 0 && dy == 0 && dl == 0) return false;
    MapCell p = trip.pos;
    if (dx != 0) {
        p.x = static_cast<int16_t>(p.x + (dx < 0 ? -1 : 1));
    } else if (dy != 0) {
        p.y = static_cast<int16_t>(p.y + (dy < 0 ? -1 : 1));
    } else {
        const Building* here = buildingOn(sim, Handle{cellValue(sim, trip, trip.pos)});
        if (!here || (here->type != 71 && here->type != 106)) return false;
        p.level = static_cast<int16_t>(p.level + (dl < 0 ? -1 : 1));
    }
    out = p;
    value = cellValue(sim, trip, p);
    return true;
}

void arrive(Simulation& sim, Trip& trip, Tile& at);

void advance(Simulation& sim, Trip& trip) {
    if (trip.waiting) return;
    trip.points = static_cast<int16_t>(trip.points + 60);
    // IMPROVISED (I29): the original starts this at (0,0,0), so a trip that
    // begins its turn at a stop jumped to the map corner (quirk Q59).
    MapCell next = trip.pos;
    for (;;) {
        Tile* stop = sim.db().get<Tile>(trip.next);
        uint32_t value = 0;
        const MapCell to = stop ? MapCell{stop->x, stop->y, stop->level} : trip.pos;
        if (!stop || !stepToward(sim, trip, to, next, value)) {
            if (trip.route.empty()) {                       // s3:8FBA: none left
                if (stop) arrive(sim, trip, *stop);
                return;
            }
            trip.next = trip.route.front();
            trip.route.erase(trip.route.begin());
            const Building* b = buildingOn(sim, trip.next);
            if (b && inGroup(sim, kMonorailStops, b->type)) {
                // A monorail stop: the trucks wait for a train.
                trip.waiting = 1;
                // IMPROVISED (I26): the trip joins the station's waiting
                // list; the original fills it only when loading a save,
                // so its trains would never carry anything.
                if (const Tile* t = sim.db().get<Tile>(trip.next))
                    if (auto* st = dynamic_cast<MonoStationBuilding*>(sim.db().get<Building>(t->building)))
                        st->waiting.push_back(&trip);
                return;
            }
            value = 0;                                      // the cell out of s8:6D24
        }
        const int16_t cost = stepCost(sim, value);
        if (trip.points < cost) return;
        trip.points = static_cast<int16_t>(trip.points - cost);
        trip.pos = next;
    }
}

// s8:709C: what cannot be delivered stays on the tile: Bas as items on its
// +0x3E list, products A as units and an item, products B as an item.
void dump(Simulation& sim, Trip& trip, Tile& at) {
    if (trip.cargo) {
        for (const auto& [res, v] : trip.cargo->entries())
            if (v != 0)
                holdItem(at, {0, 0, static_cast<uint16_t>(v), static_cast<uint16_t>(v), static_cast<uint16_t>(res)});
    } else if (trip.bas != 0) {
        const auto q = static_cast<uint16_t>(trip.quantity);
        holdItem(at, {0, 0, q, q, trip.bas});
    } else if (trip.productA != 0) {
        addUnits(sim, at, static_cast<int32_t>(trip.quantity), trip.productA);   // s7:7C50
        const auto q = static_cast<uint16_t>(trip.quantity);
        holdItem(at, {trip.productA, 0, q, static_cast<uint16_t>(q * productUnitValueA(trip.productA)), 0});
    } else if (trip.productB != 0) {
        const auto q = static_cast<uint16_t>(trip.quantity);
        holdItem(at, {0, trip.productB, q, static_cast<uint16_t>(q * productUnitValueB(trip.productB)), 0});
    }
}

// s8:6F5A: delivered into the tile.
void deliver(Simulation& sim, Trip& trip, Tile& at) {
    if (trip.cargo) {
        for (const auto& [res, v] : trip.cargo->entries())
            if (v != 0) at.bas.add(res, v);                 // s7:7DDC
    } else if (trip.bas != 0) {
        at.bas.add(trip.bas, static_cast<int32_t>(trip.quantity));
    } else if (trip.productA != 0) {
        addUnits(sim, at, static_cast<int32_t>(trip.quantity), trip.productA);
    } else {
        const auto q = static_cast<uint16_t>(trip.quantity);
        holdItem(at, {0, trip.productB, q, static_cast<uint16_t>(q * productUnitValueB(trip.productB)), 0});
    }
}

// s8:7356: at the last stop. Warehouses (group 4) take products that fit;
// storage tanks (group 3) Bas that fits; other buildings take anything.
// Then the trucks go home at once and the trip is finished.
void arrive(Simulation& sim, Trip& trip, Tile& at) {
    Building* b = sim.db().get<Building>(at.building);
    const uint16_t ty = b ? b->type : 0;
    if (b && inGroup(sim, kWarehouses, ty)) {
        auto* wh = sim.db().get<WarehouseBuilding>(at.building);
        const uint32_t room = wh ? wh->room() : 0;
        if (!wh || trip.quantity > room || (trip.productA == 0 && trip.productB == 0)) {
            dump(sim, trip, at);
        } else {
            const auto q = static_cast<uint16_t>(trip.quantity);
            if (trip.productA != 0)
                wh->add({trip.productA, 0, q, static_cast<uint16_t>(q * productUnitValueA(trip.productA)), 0});
            else
                wh->add({0, trip.productB, q, static_cast<uint16_t>(q * productUnitValueB(trip.productB)), 0});
        }
    } else if (b && inGroup(sim, kStorage, ty)) {
        if ((trip.bas == 0 && !trip.cargo) || trip.quantity > storageRoom(at)) dump(sim, trip, at);
        else deliver(sim, trip, at);
    } else {
        deliver(sim, trip, at);
    }
    if (Tile* home = sim.db().get<Tile>(trip.home)) setTrucks(*home, static_cast<int16_t>(home->trucks + trip.trucks));
    trip.bas = trip.productA = trip.productB = 0;
    trip.quantity = 0;
    trip.cargo.reset();
}

// s8:6B3C
bool finished(Trip& trip) {
    if (trip.bas == 0 && trip.productA == 0 && trip.productB == 0 && !trip.cargo && trip.quantity != 0)
        trip.quantity = 0;
    return trip.quantity == 0;
}

// ── Monorail trains (s7:AFFC) ─────────────────────────────────────────────

// The building on a cell of the train's site (the original reads the site
// in view, I25).
Building* trainCellBuilding(Simulation& sim, const Train& tr, const MapCell& c) {
    const Tile* st = sim.db().get<Tile>(tr.station);
    Grid* g = st ? sim.gridOfSite(st->owner) : nullptr;
    if (!g) return nullptr;
    const Tile* t = sim.db().get<Tile>(g->tileAt(c));
    return t ? sim.db().get<Building>(t->building) : nullptr;
}

// +0x20 of the rail piece under the train (22, 23, 25, 26): drawn with it.
void markTrain(Simulation& sim, const Train& tr, uint16_t on) {
    Building* b = trainCellBuilding(sim, tr, tr.pos);
    if (!b) return;
    if (b->type == 22 || b->type == 23 || b->type == 25 || b->type == 26)
        if (auto* m = dynamic_cast<MonorailBuilding*>(b)) m->trainHere = on;
}

MapCell ahead(const MapCell& p, uint16_t dir) {
    MapCell c = p;
    switch (dir) {
        case 1: --c.y; break;
        case 2: ++c.x; break;
        case 3: ++c.y; break;
        case 4: --c.x; break;
        default: break;
    }
    return c;
}

// s7:B2AA: a rail cell (group 0x42: 22, 23, 24) there takes the train.
// IMPROVISED (I28): a MonoStation (63) counts as rail; the original's group
// leaves it out, so its trains could never reach a station.
bool isRail(const Simulation& sim, const Building* b) {
    return b && (inGroup(sim, kGroup42, b->type) || b->type == 63);
}

Building* railAt(Simulation& sim, Train& tr, const MapCell& c) {
    Building* b = trainCellBuilding(sim, tr, c);
    if (!isRail(sim, b)) return nullptr;
    tr.pos = c;
    return b;
}

// s7:B578: one cell on. Without a direction (s7:B344) the first rail cell
// round it (y-1, y+1, x-1, x+1) sets one. A piece of the wrong axis stops
// the train after it has moved onto it.
Building* trainStep(Simulation& sim, Train& tr) {
    if (!trainCellBuilding(sim, tr, tr.pos)) return nullptr;
    if (tr.direction == 0) {
        for (uint16_t d : {uint16_t(1), uint16_t(3), uint16_t(4), uint16_t(2)})
            if (Building* b = railAt(sim, tr, ahead(tr.pos, d))) {
                tr.direction = d;
                return b;
            }
        return nullptr;
    }
    Building* b = railAt(sim, tr, ahead(tr.pos, tr.direction));
    if (!b) return nullptr;
    const bool vertical = tr.direction == 1 || tr.direction == 3;
    const bool fits = b->type == 63 || b->type == 24 || b->type == (vertical ? 22 : 23);
    return fits ? b : nullptr;
}

// s7:B142: at a crossing or a station. The original's connection masks
// (s6:1C1C, s6:20B0) are empty stubs, so every train turns back there.
// IMPROVISED (I28): a train goes straight over a crossing, and through a
// station when the rail goes on; otherwise it turns back.
void trainTurn(Simulation& sim, Train& tr, const Building& at) {
    if (at.type == 24) return;
    const Building* next = trainCellBuilding(sim, tr, ahead(tr.pos, tr.direction));
    if (isRail(sim, next)) return;
    const uint16_t d = tr.direction;
    tr.direction = d == 1 ? 3 : d == 3 ? 1 : d == 2 ? 4 : 2;
}

// s8:6984: what a trip weighs on a train (a Bas load counts 1 whatever its
// quantity).
uint32_t tripWeight(const Trip& t) {
    if (t.bas != 0) return 1;
    if (t.cargo) return t.quantity;
    if (t.productA != 0) return t.quantity * productUnitValueA(t.productA);
    if (t.productB != 0) return t.quantity * productUnitValueB(t.productB);
    return 0;
}

// s7:B454: at a station, riders for it get off (s8:69FE), then waiting
// trips get on while the train has room (500).
void trainStop(Simulation& sim, Train& tr, Handle stationTile, MonoStationBuilding& st) {
    const Tile* stTile = sim.db().get<Tile>(stationTile);
    for (auto it = tr.riders.begin(); it != tr.riders.end();) {
        Trip* r = *it;
        // IMPROVISED (I27): a rider whose next stop is not a station gets
        // off at the first other station.
        const Building* nb = buildingOn(sim, r->next);
        const bool forHere = r->next == stationTile ||
                             ((!nb || !inGroup(sim, kMonorailStops, nb->type)) && r->boardedAt != stationTile);
        if (!forHere) {
            ++it;
            continue;
        }
        it = tr.riders.erase(it);
        r->waiting = 0;
        // IMPROVISED (I27): the trucks get off here; the original leaves
        // their position where they got on.
        if (stTile) r->pos = {stTile->x, stTile->y, stTile->level};
    }
    // IMPROVISED (I27): the load is the riders' weight; s7:B13C returns 0.
    int32_t room = 500;
    for (const Trip* r : tr.riders) room -= static_cast<int32_t>(tripWeight(*r));
    for (auto it = st.waiting.begin(); it != st.waiting.end() && room > 0;) {
        Trip* w = *it;
        const auto weight = static_cast<int32_t>(tripWeight(*w));
        if (weight > room) {
            ++it;
            continue;
        }
        it = st.waiting.erase(it);
        room -= weight;
        tr.riders.push_back(w);
        w->boardedAt = stationTile;
        // IMPROVISED (I27): its next stop becomes the one after the station.
        if (!w->route.empty()) {
            w->next = w->route.front();
            w->route.erase(w->route.begin());
        }
    }
}

// s7:AFFC: up to 6 cells a turn; a stop ends the turn.
void moveTrain(Simulation& sim, Train& tr) {
    markTrain(sim, tr, 0);
    for (int k = 6; k > 0; --k) {
        Building* b = trainStep(sim, tr);
        if (!b) break;
        if (b->type == 24 || b->type == 63) trainTurn(sim, tr, *b);
        if (inGroup(sim, kMonorailStops, b->type)) {
            auto* st = dynamic_cast<MonoStationBuilding*>(b);
            const Tile* t = b->tile(sim);
            if (st && t) trainStop(sim, tr, t->self, *st);
            break;
        }
    }
    markTrain(sim, tr, 1);
}

} // namespace

Trip& startTrip(Simulation& sim, Trip trip) {
    if (trip.cargo) {
        trip.quantity = 0;                                  // s5:BA94: the table's total
        for (const auto& [res, v] : trip.cargo->entries()) trip.quantity += static_cast<uint32_t>(v);
    }
    if (const Tile* home = sim.db().get<Tile>(trip.home)) {
        trip.route = home->route;                           // s7:6D4E
        trip.pos = {home->x, home->y, home->level};
    }
    if (!trip.route.empty()) {                              // s3:8FBA
        trip.next = trip.route.front();
        trip.route.erase(trip.route.begin());
    }
    auto& trips = sim.trips();
    trips.push_back(std::make_unique<Trip>(std::move(trip)));
    return *trips.back();
}

void dispatchRoutes(Simulation& sim, Colony& colony) {
    for (Handle h : colony.tiles.order()) {
        Tile* t = sim.db().get<Tile>(h);
        if (!t || t->trucks == 0 || t->route.empty()) continue;
        if (sendWaitingLoad(sim, *t)) continue;
        Building* b = sim.db().get<Building>(t->building);
        if (!b) continue;
        if (inGroup(sim, kSmelters, b->type)) {
            if (auto* s = dynamic_cast<SmelterBuilding*>(b)) routeFromSmelter(sim, *t, *s);
        } else if (inGroup(sim, kMines, b->type)) {
            if (auto* m = dynamic_cast<MineBuilding*>(b)) routeFromMine(sim, *t, *m);
        } else if (inGroup(sim, kFactories, b->type) || inGroup(sim, kUGFactories, b->type)) {
            if (auto* f = dynamic_cast<FactoryBuilding*>(b)) routeFromFactory(sim, *t, *f);
        }
    }
}

void moveTrips(Simulation& sim) {
    auto& trips = sim.trips();
    for (size_t i = 0; i < trips.size(); ++i) advance(sim, *trips[i]);
    trips.erase(std::remove_if(trips.begin(), trips.end(), [](const auto& t) { return finished(*t); }),
                trips.end());
    for (auto& tr : sim.trains()) moveTrain(sim, *tr);
}

void addTrain(Simulation& sim, Handle stationTile) {
    auto tr = std::make_unique<Train>();
    tr->station = stationTile;
    if (const Tile* t = sim.db().get<Tile>(stationTile)) tr->pos = {t->x, t->y, t->level};
    sim.trains().push_back(std::move(tr));
}

void removeTrain(Simulation& sim, Handle stationTile) {
    auto& trains = sim.trains();
    auto it = std::find_if(trains.begin(), trains.end(), [&](const auto& t) { return t->station == stationTile; });
    if (it != trains.end()) trains.erase(it);   // only the first (s8:79F2)
}

} // namespace outpost::sim
