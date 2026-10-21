#include "sim/ops_loader.hpp"
#include "sim/ops_extensions.hpp"

#include "data/ops_save.hpp"
#include "sim/building.hpp"
#include "sim/new_game.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/vehicles.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <set>
#include <cstdio>
#include <stdexcept>

namespace outpost::sim {

uint16_t translateType(int version, uint16_t t) {
    if (version >= 2) return t;
    if (t >= 1 && t <= 23) return t;
    if (t >= 24 && t <= 60) return static_cast<uint16_t>(t + 3);
    if (t >= 61 && t <= 62) return static_cast<uint16_t>(t + 4);
    if (t >= 63 && t <= 102) return static_cast<uint16_t>(t + 8);
    if (t >= 103 && t <= 128) return static_cast<uint16_t>(t + 9);
    return 0;
}

uint16_t translateProduct(int version, uint16_t p) {
    if (version >= 2) return p;
    if (p == 4) return 5;
    if (p == 5) return 4;
    return p >= 1 && p <= 19 ? p : uint16_t{0};
}

uint16_t translateAlertRow(uint16_t i) {
    static constexpr uint16_t kRows[] = {3, 4, 5, 6, 8, 9, 10};   // s2:73D6
    return i >= 1 && i <= 7 ? kRows[i - 1] : uint16_t{0};
}

namespace {

// Reads one chunk body; running past its end throws.
class Reader {
public:
    Reader(const std::vector<uint8_t>& body, uint8_t chunk) : m_d(body), m_chunk(chunk) {}

    uint16_t u16() { need(2); const uint16_t v = static_cast<uint16_t>(m_d[m_p] | (m_d[m_p + 1] << 8)); m_p += 2; return v; }
    int16_t i16() { return static_cast<int16_t>(u16()); }
    uint32_t u32() { const uint32_t lo = u16(); return lo | (static_cast<uint32_t>(u16()) << 16); }
    int32_t i32() { return static_cast<int32_t>(u32()); }
    Handle handle() { return Handle{u32()}; }

    // s2:7C6E: bytes up to the NUL.
    std::string cstr() {
        std::string s;
        for (;;) {
            need(1);
            const char c = static_cast<char>(m_d[m_p++]);
            if (c == '\0') return s;
            s.push_back(c);
        }
    }
    // s2:7BC8
    Pos3 pos() { Pos3 p; p.x = i16(); p.y = i16(); p.z = i16(); return p; }
    // s2:76E4
    std::vector<Handle> handles() {
        const uint32_t n = u32();
        std::vector<Handle> out;
        out.reserve(n);
        for (uint32_t i = 0; i < n; ++i) out.push_back(handle());
        return out;
    }
    // s2:77CC: word slots, (word key, dword value) each; key 0 is a free slot.
    void ledger(Ledger& l) {
        const uint16_t n = u16();
        for (uint16_t i = 0; i < n; ++i) {
            const uint16_t key = u16();
            const int32_t value = i32();
            if (key != 0) l.set(key, value);
        }
    }
    // Item lists: word n, n x {+4, product A, product B, quantity, units}.
    std::vector<ProductItem> items(int version) {
        const uint16_t n = u16();
        std::vector<ProductItem> out;
        for (uint16_t i = 0; i < n; ++i) {
            ProductItem it;
            it.field04 = u16();
            it.productA = translateProduct(version, u16());
            it.productB = u16();
            it.quantity = u16();
            it.units = u16();
            out.push_back(it);
        }
        return out;
    }

    // s2:77CC into a table pointer: none is made for 0 entries.
    std::unique_ptr<Ledger> table() {
        const uint16_t n = u16();
        if (n == 0) return nullptr;
        auto l = std::make_unique<Ledger>();
        for (uint16_t i = 0; i < n; ++i) {
            const uint16_t key = u16();
            const int32_t value = i32();
            if (key != 0) l->set(key, value);
        }
        return l;
    }
    // A trip (s8:774E, version 2 and later).
    Trip trip(int version) {
        Trip t;
        t.route = handles();                                   // +0x04 (s2:766E)
        t.home = handle();                                     // +0x08
        t.cargo = table();                                     // +0x0E
        t.bas = u16();                                         // +0x0C
        t.productA = translateProduct(version, u16());         // +0x12
        t.productB = u16();                                    // +0x14
        t.quantity = u32();                                    // +0x16
        const Pos3 p = pos();                                  // +0x1A
        t.pos = {p.x, p.y, p.z};
        t.next = handle();                                     // +0x20
        t.points = i16();                                      // +0x24
        t.trucks = i16();                                      // +0x26
        t.waiting = u16();                                     // +0x28
        return t;
    }
    bool atEnd() const { return m_p == m_d.size(); }
    size_t position() const { return m_p; }

private:
    void need(size_t n) const {
        if (m_p + n > m_d.size())
            throw std::runtime_error("chunk " + std::to_string(m_chunk) + " ends early");
    }
    const std::vector<uint8_t>& m_d;
    uint8_t m_chunk;
    size_t m_p{0};
};

const std::vector<uint8_t>& body(const data::OpsSave& save, uint8_t id) {
    const auto* c = save.chunk(id);
    if (!c) throw std::runtime_error("chunk " + std::to_string(id) + " missing");
    return c->body;
}

// A chunk's body followed by the rest of the file (the next tags and
// bodies): a loader that reads past its chunk gets these bytes, since the
// tag reader (s2:7CFE) searches from the start of the file and only leaves
// the file positioned after the tag.
std::vector<uint8_t> bodyAndTail(const data::OpsSave& save, uint8_t id) {
    std::vector<uint8_t> out = body(save, id);
    bool after = false;
    for (const auto& c : save.chunks()) {
        if (after) {
            char tag[16];
            std::snprintf(tag, sizeof tag, "dcbSC%02x", c.id);
            out.insert(out.end(), tag, tag + 7);
            out.insert(out.end(), c.body.begin(), c.body.end());
        }
        if (c.id == id) after = true;
    }
    return out;
}

// A trip saved in a train's riders or a station's waiting list is the same
// object the vehicle manager's list (+0) also holds, written a second time.
// IMPROVISED (I30): it is linked to an identical trip of that list not linked
// yet (the original reads it as a separate object, which then rides or waits
// while its twin waits in the list forever); with none, it joins the list.
bool sameTrip(const Trip& a, const Trip& b) {
    const bool cargoSame = (!a.cargo && !b.cargo) ||
                           (a.cargo && b.cargo && a.cargo->entries() == b.cargo->entries());
    return cargoSame && a.route == b.route && a.home == b.home && a.bas == b.bas &&
           a.productA == b.productA && a.productB == b.productB && a.quantity == b.quantity &&
           a.pos.x == b.pos.x && a.pos.y == b.pos.y && a.pos.level == b.pos.level &&
           a.next == b.next && a.points == b.points && a.trucks == b.trucks && a.waiting == b.waiting;
}

Trip* adoptTrip(Simulation& sim, Trip saved, std::set<const Trip*>& linked) {
    for (const auto& t : sim.trips())
        if (!linked.count(t.get()) && sameTrip(*t, saved)) {
            linked.insert(t.get());
            return t.get();
        }
    sim.trips().push_back(std::make_unique<Trip>(std::move(saved)));
    linked.insert(sim.trips().back().get());
    return sim.trips().back().get();
}

void finish(const Reader& r, uint8_t id) {
    if (!r.atEnd())
        throw std::runtime_error("chunk " + std::to_string(id) + " has " + "unread bytes");
}

// DbObj (s7:1730) and the named-object list (s7:19B4).
template <class T>
T& insertObject(Simulation& sim, Reader& r) {
    const Handle self = r.handle();
    const Handle owner = r.handle();
    return sim.db().insertAt(self, owner, std::make_unique<T>());
}

void loadBuildMenu(Simulation& sim, const data::OpsSave& save, int version) {
    Reader r(body(save, 0x03), 0x03);
    BuildMenu& m = sim.buildMenu();
    m.offered.fill(0);
    m.products.fill(0);
    if (version <= 1) {                                        // s3:68C6
        std::array<uint16_t, 129> old{};
        for (auto& w : old) w = r.u16();
        for (uint16_t t = 1; t < old.size(); ++t) m.offer(translateType(version, t), old[t]);
        std::array<uint16_t, 21> oldp{};
        for (auto& w : oldp) w = r.u16();
        for (uint16_t k = 0; k < oldp.size(); ++k) m.offerProduct(translateProduct(version, k), oldp[k]);
    } else {
        for (auto& w : m.offered) w = r.u16();
        for (auto& w : m.products) w = r.u16();
    }
    m.field148 = translateType(version, r.u16());              // the mine type offered
    finish(r, 0x03);
}

void loadPopulation(Reader& r, Population& p, int version) {   // s7:33F0
    for (auto& c : p.cohort) c = r.i32();
    for (auto& v : p.deathRate) v = r.i16();
    for (auto& v : p.deathChance) v = r.i16();
    for (auto& v : p.deathCarry) v = r.i32();
    p.birthDivisor = r.i16();
    p.lifeSupportDeaths = r.i32();
    if (version >= 2) {
        p.extra170 = r.i32();
        p.schoolLeavingAge = r.u16();
    }
}

void loadColony(Simulation& sim, Reader& r, int version) {     // s8:6118
    Colony& c = insertObject<Colony>(sim, r);
    const uint32_t n = r.u32();                                // s2:7548
    c.tiles = TileList(std::max<uint32_t>(n, 200), 100);
    for (uint32_t i = 0; i < n; ++i) {
        const Handle t = r.handle();
        const uint16_t key = r.u16();
        c.tiles.append(t, key);                                // s5:C644
    }
    c.tiles.sortNow();                                         // s5:C694
    c.hub = r.handle();
    c.morale = r.i16();
    c.prevMorale = r.i16();
    c.defectionTier = r.u16();
    c.defectionAmount = r.i32();
    c.crime = r.i16();
    c.education = r.i16();
    for (auto& v : c.total) v = r.i32();
    std::array<int32_t, 21> units{}, busy{};
    for (auto& v : units) v = r.i32();
    for (auto& v : busy) v = r.i32();
    c.linkedCount.fill(0);
    c.linkedBusy.fill(0);
    for (uint16_t k = 0; k < units.size(); ++k) {              // v1: kinds translated
        const uint16_t to = translateProduct(version, k);
        if (version < 2) {
            c.linkedCount[to] = units[k];
            c.linkedBusy[to] = busy[k];
        } else {
            c.linkedCount[k] = units[k];
            c.linkedBusy[k] = busy[k];
        }
    }
    loadPopulation(r, c.population, version);
    c.name = r.cstr();
    c.populated = r.u16() != 0;
    c.player = r.handle();
    c.nanotech = r.u16() != 0;
    c.freeResources = r.u16() != 0;
    c.messageArg208 = r.i16();
    c.crowdingMorale = r.i16();
    c.crowdingFlag = r.i16();
    c.explorers = r.i16();
    if (version >= 2) {
        c.plagueTurns = r.i16();
        c.plagueTreated = r.i32();
    }
}

void loadTile(Simulation& sim, Reader& r, int version) {       // s7:778C
    Tile& t = insertObject<Tile>(sim, r);
    const Pos3 p = r.pos();
    t.x = p.x;
    t.y = p.y;
    t.level = p.z;
    t.mark12 = r.i16();
    t.mark14 = r.i16();
    t.building = r.handle();
    t.linked = r.handles();
    r.ledger(t.bas);
    r.ledger(t.alloc);
    t.colony = r.handle();
    if (version >= 2) {
        t.field32 = r.i16();
        t.trucks = r.i16();
        t.route = r.handles();
        t.list3A = r.items(version);
        t.list3E = r.items(version);
    }
}

void loadBuilding(Simulation& sim, Reader& r, int version, std::set<const Trip*>& linked) {   // s6:E628 type 7, s6:B81A
    const uint16_t type = translateType(version, r.u16());     // for the class factory
    const Handle self = r.handle();
    const Handle owner = r.handle();
    Building& b = sim.db().insertAt(self, owner, makeBuilding(type));
    b.type = translateType(version, r.u16());
    b.placeholderType = translateType(version, r.u16());
    b.spriteVariant = translateType(version, r.u16());
    b.state = r.u16();
    b.savedState = r.u16();
    b.flags = r.u16();
    const auto& data = sim.data();
    const uint16_t eff = b.state == Building::kSuspended ? b.savedState : b.state;
    switch (eff) {
        case 1: case 2: case 3:
            b.turnsLeft = r.i16();                             // +0x14
            // IMPROVISED (I64, repair): rebuild saves written before the
            // +0x14 fix (2026-10-19) hold 0 or less for a robot at work,
            // which would never finish; it gets one more turn.
            if (b.turnsLeft <= 0) b.turnsLeft = 1;
            break;
        case Building::kConstructing:                          // s6:E0BC: a fresh copy
            if (b.type < data.bldgBld.size()) b.buildInfo = data.bldgBld[b.type];
            b.buildInfo.word94 = r.u16();
            b.infoKind = Building::InfoKind::Construction;
            break;
        case Building::kOperational:                           // s6:E100
            if (b.type < data.bldgOps.size()) b.opsInfo = data.bldgOps[b.type];
            b.opsResource = r.u16();
            b.opsProductA = translateProduct(version, r.u16());
            b.opsProductB = r.u16();
            b.opsAmount = r.u16();
            b.opsCycleTurns = r.u16();
            b.infoKind = Building::InfoKind::Operation;
            break;
        case Building::kExhausted:
            if (b.type < data.bldgOps.size()) b.opsInfo = data.bldgOps[b.type];
            b.infoKind = Building::InfoKind::Operation;
            break;
        default:
            break;
    }

    // The class's own part.
    if (auto* cmd = dynamic_cast<CommandCenterBuilding*>(&b)) {        // s7:C29C
        cmd->field20 = r.i32();
        cmd->life = r.i16();
    } else if (auto* sm = dynamic_cast<SmelterBuilding*>(&b)) {        // s6:3D92
        sm->minBCarry = r.i32();
        sm->minCCarry = r.i32();
        r.ledger(sm->output);
    } else if (auto* f = dynamic_cast<FactoryBuilding*>(&b)) {         // s6:0374
        f->progress = r.i16();
        f->output = r.items(version);
    } else if (auto* m = dynamic_cast<MineBuilding*>(&b)) {            // s6:14D8
        m->life = r.i16();
        m->oreCursor = r.u16();
        if (version >= 2) sim.setFirstMineDone(r.u16() != 0);          // DGROUP 0x4FBC
    } else if (auto* lab = dynamic_cast<LabBuilding*>(&b)) {           // s7:C894
        lab->topic = r.u16();
    } else if (auto* tf = dynamic_cast<TerraFormBuilding*>(&b)) {      // s6:4A5A
        for (auto& w : tf->systems) w = r.u16();
    } else if (auto* cop = dynamic_cast<PoliceBuilding*>(&b)) {        // s5:D41A
        cop->mode = r.u16();
    } else if (auto* rc = dynamic_cast<RoboCmdBuilding*>(&b)) {        // s7:D72E
        for (auto& s : rc->slots) {
            s.expires = r.u32();
            s.item = translateProduct(version, r.u16());
            if (version >= 2) {
                s.flag = r.u16();
                s.field8 = r.u32();
            } else {
                s.flag = 3;
                s.field8 = 0;
            }
        }
        if (version >= 4) {
            if (r.u16() != 0) sim.setFirstRoboCmdDone();               // DGROUP 0x5812
        }
    } else if (auto* wh = dynamic_cast<WarehouseBuilding*>(&b)) {      // s6:65E2
        wh->items = r.items(version);
    } else if (auto* uni = dynamic_cast<UGUnivBuilding*>(&b)) {        // s6:5FC8
        uni->counter20 = r.i16();
    } else if (b.type == 63) {                                         // MonoStation s6:24A2
        // v >= 2: the waiting list (+0x20): word n, n trips (s8:774E).
        if (version >= 2) {
            auto* st = dynamic_cast<MonoStationBuilding*>(&b);
            const uint16_t n = r.u16();
            for (uint16_t i = 0; i < n; ++i) {
                Trip* t = adoptTrip(sim, r.trip(version), linked);
                if (st) st->waiting.push_back(t);
            }
        }
    } else if (auto* robot = dynamic_cast<RobotBuilding*>(&b)) {       // s7:DEC4
        if (version >= 2) robot->long20 = r.u32();
        if (b.type == 115 || b.type == 119) {                          // RoboDoze s5:E994
            robot->word24 = r.u16();
        } else if (b.type == 116 || b.type == 120 || b.type == 121) {  // RoboDig s5:E70E
            robot->word24 = r.u16();
            robot->word26 = r.u16();
        }
    }
}

void loadPlayer(Simulation& sim, Reader& r) {                  // s7:232E
    Player& p = insertObject<Player>(sim, r);
    p.children = r.handles();
    for (auto& v : p.remaining) v = r.i16();
    for (auto& v : p.discoveries) v = r.i16();
    for (auto& v : p.priority) v = r.u16();
    for (auto& v : p.minTurns) v = r.i16();
    for (auto& v : p.workedThisTurn) v = r.u16();
}

void loadStar(Simulation& sim, Reader& r) {                    // s7:5E70
    Star& s = insertObject<Star>(sim, r);
    s.children = r.handles();
    s.name = r.cstr();
    s.pos = r.pos();
    const uint16_t n = r.u16();
    for (uint16_t i = 0; i < n; ++i) s.planetIds.push_back(r.u16());
}

void loadPlanet(Simulation& sim, Reader& r) {                  // s7:2C8A
    Planet& p = insertObject<Planet>(sim, r);
    p.children = r.handles();
    p.nameId = r.u16();
    p.name = r.cstr();
    p.pos = r.pos();
    p.hostility = r.i16();
    p.rec0E = r.i32();
    for (auto& v : p.traits) v = r.i16();
    const uint16_t n = r.u16();
    for (uint16_t i = 0; i < n; ++i) p.siteIds.push_back(r.u16());
    p.field14 = r.i16();
    p.atmosphere = r.u16();
    p.terraformTurns = r.i16();
    p.field1A = r.u16();
}

void loadSite(Simulation& sim, Reader& r) {                    // s7:581E
    Site& s = insertObject<Site>(sim, r);
    s.children = r.handles();
    s.rec00 = r.u16();
    s.rec02 = r.u16();
    s.name = r.cstr();
    const uint16_t n = r.u16();                                // rec+0x1A
    for (uint16_t i = 0; i < n; ++i) s.mineSites.push_back(r.pos());
    s.visibleMines = n;                                        // rec+0x1C (hidden) is not saved
    s.mapSize = r.pos();
    s.depth = r.u16();
}

void loadUnit(Simulation& sim, Reader& r, int version) {       // s6:B2C8
    Unit& u = insertObject<Unit>(sim, r);
    u.kind = translateProduct(version, r.u16());
}

// Chunk 0x01, the mothership (s3:9B72): three lists of {kind
// (type-translated), count}: +0x0A hold, +0x0E deployable, +0x12 cargo
// damaged on arrival; then words +0x1A arrived, +0x1C countdown, +0x1E
// cryo colonists. +0x16 and +0x18 are not saved.
void loadMothership(Simulation& sim, const data::OpsSave& save, int version) {
    Reader r(body(save, 0x01), 0x01);
    auto list = [&] {
        std::vector<ShipItem> out;
        const uint16_t n = r.u16();
        for (uint16_t i = 0; i < n; ++i) {
            ShipItem it;
            it.kind = translateType(version, r.u16());
            it.count = r.i16();
            out.push_back(it);
        }
        return out;
    };
    Mothership& m = sim.mothership();
    m.hold = list();
    m.deployable = list();
    m.damaged = list();
    m.arrived = r.u16() != 0;
    m.countdown = r.i16();
    m.cryoColonists = r.i16();
    finish(r, 0x01);
}

// Chunk 0x04 (s3:5E56): AI name, player name, difficulty (DGROUP 0x13AE);
// v >= 2: automatic trucking (+0x82).
void loadOptions(Simulation& sim, const data::OpsSave& save, int version, OpsExtras& x) {
    Reader r(body(save, 0x04), 0x04);
    x.aiName = r.cstr();
    x.playerName = r.cstr();
    sim.setDifficulty(r.u16());
    if (version >= 2) sim.setAutoTrucking(r.u16() != 0);
    finish(r, 0x04);
}

// Chunk 0x06, alerts (s3:0C7C): word n, n x {word +4, dword +6}; words
// +0x0E, +0x10; ten words of the alert table (v1: rows through s2:738C,
// so row 0 ends up with the last); v > 2: three more, rows 16..18.
// TUTOR.OPS's chunk has only seven of the ten words: the loader reads the
// last three from the next tag's text ("dcbSC07" -> 0x6364, 0x5362,
// 0x3043), the last landing in row 0 (alert 1) (quirk Q50).
void loadAlerts(Simulation& sim, const data::OpsSave& save, int version, OpsExtras& x) {
    const std::vector<uint8_t> bytes = bodyAndTail(save, 0x06);
    Reader r(bytes, 0x06);
    const uint16_t n = r.u16();
    for (uint16_t i = 0; i < n; ++i) {
        const uint16_t a = r.u16();
        x.alerts.emplace_back(a, r.u32());
    }
    x.alertsWordE = r.u16();
    x.alertsWord10 = r.u16();
    auto setRow = [&](uint16_t row, uint16_t v) {
        if (row < 10) sim.setAlert(static_cast<uint16_t>(row + 1), v != 0);
        else x.alertRows[row] = v;
    };
    for (uint16_t i = 0; i < 10; ++i) {
        const uint16_t v = r.u16();
        setRow(version < 2 ? translateAlertRow(i) : i, v);
    }
    if (version > 2)
        for (uint16_t i = 0; i < 3; ++i) x.alertRows[16 + i] = r.u16();
    if (version >= 2 && r.position() != body(save, 0x06).size())
        throw std::runtime_error("chunk 6 has unread bytes");
}

// Chunk 0x07, the orbital objects (registry 9, s3:648A): 7 slots for kinds
// 0x83..0x89, each word carried (+0) and word launched (+2).
void loadOrbitals(Simulation& sim, const data::OpsSave& save) {
    Reader r(body(save, 0x07), 0x07);
    Orbitals& o = sim.orbitals();
    for (size_t i = 0; i < Orbitals::kSlots; ++i) {
        o.carried[i] = r.i16();
        o.launched[i] = r.i16();
    }
    finish(r, 0x07);
}

// Chunks 0x14-0x17 (version >= 2 only).
void loadLater(Simulation& sim, const data::OpsSave& save, OpsExtras& x, std::set<const Trip*>& linked) {
    {   // 0x14 trade agreements (s2:E70E)
        Reader r(body(save, 0x14), 0x14);
        auto& list = sim.tradeAgreements();
        list.clear();
        const uint16_t n = r.u16();
        for (uint16_t i = 0; i < n; ++i) {
            const uint32_t a = r.u32();
            const uint32_t b = r.u32();
            x.tradeDwords.emplace_back(a, b);
            TradeAgreement t;
            t.state = r.u16();
            t.sinceTurn = r.u32();
            t.flag12 = r.u16();
            list.push_back(t);
        }
        finish(r, 0x14);
    }
    {   // 0x15 (s2:C9D4)
        Reader r(body(save, 0x15), 0x15);
        x.rebelBusyUntil = r.u32();
        finish(r, 0x15);
    }
    {   // 0x16 AI managers (s2:BB5E): the step (+0x10) is not saved
        Reader r(body(save, 0x16), 0x16);
        x.aiWord22 = r.u16();
        auto& list = sim.aiManagers();
        list.clear();
        const uint16_t n = r.u16();
        for (uint16_t i = 0; i < n; ++i) {
            x.aiNames.push_back(r.cstr());
            AiManager m;
            m.active = r.u16() != 0;
            m.colony = r.handle();
            m.emphasis = r.u16();
            list.push_back(m);
        }
        finish(r, 0x16);
    }
    {   // 0x17 vehicle manager (s8:7C02): the trucks' trips, then the trains
        Reader r(body(save, 0x17), 0x17);
        auto& trips = sim.trips();
        trips.clear();
        const uint16_t n = r.u16();
        for (uint16_t i = 0; i < n; ++i) trips.push_back(std::make_unique<Trip>(r.trip(4)));
        auto& trains = sim.trains();
        trains.clear();
        const uint16_t m = r.u16();
        for (uint16_t i = 0; i < m; ++i) {                     // s7:B836
            auto t = std::make_unique<Train>();
            t->station = r.handle();                           // +0x04
            const Pos3 p = r.pos();                            // +0x08
            t->pos = {p.x, p.y, p.z};
            t->direction = r.u16();                            // +0x0E
            const uint16_t k = r.u16();                        // riders, list +0x10
            for (uint16_t j = 0; j < k; ++j) t->riders.push_back(adoptTrip(sim, r.trip(4), linked));
            trains.push_back(std::move(t));
        }
        finish(r, 0x17);
    }
}

template <class Fn>
size_t loadTable(const data::OpsSave& save, uint8_t id, Fn fn) {
    Reader r(body(save, id), id);
    const uint32_t n = r.u32();
    for (uint32_t i = 0; i < n; ++i) fn(r);
    finish(r, id);
    return n;
}

} // namespace

bool loadOps(Simulation& sim, const data::OpsSave& save, OpsLoadInfo* info, std::string* error) {
    try {
        const int version = save.version() == 4 ? 4 : 1;      // s2:71xx: other numbers read as 1
        OpsLoadInfo out;
        out.version = version;

        OpsExtras& x = out.extras;
        loadMothership(sim, save, version);
        x.view02 = body(save, 0x02);
        fillDisasterCalendar(sim);                             // the view is made (I36)
        loadBuildMenu(sim, save, version);
        loadOptions(sim, save, version, x);
        {
            Reader r(body(save, 0x05), 0x05);                  // s3:404A
            x.planetWindow.frame = r.u16();
            x.planetWindow.mode = r.u16();
            x.planetWindow.spinning = r.u16();
            finish(r, 0x05);
        }
        loadAlerts(sim, save, version, x);
        loadOrbitals(sim, save);
        std::set<const Trip*> linked;
        if (version >= 2) loadLater(sim, save, x, linked);
        body(save, 0x08);                                      // s6:D7BA: the tag only
        body(save, 0x0B);                                      // s5:A65E: v1 four words (TBD)

        Reader counters(body(save, 0x09), 0x09);               // s7:5C52
        for (auto& v : out.lastHandle) v = counters.u32();
        finish(counters, 0x09);

        Reader head(body(save, 0x0A), 0x0A);                   // s6:DEF2
        out.turn = head.u32();
        x.dbWord8 = head.u16();                                // db+8 (TBD)
        // The galaxy (DGROUP 0x5166): its handle, owner, star slots and ids.
        Galaxy& g = sim.galaxy();
        g.self = head.handle();
        g.owner = head.handle();
        g.children = head.handles();
        g.starIds.clear();
        const uint16_t stars = head.u16();
        for (uint16_t i = 0; i < stars; ++i) g.starIds.push_back(head.u16());
        finish(head, 0x0A);

        size_t objects = 0;
        objects += loadTable(save, 0x0C, [&](Reader& r) { loadStar(sim, r); });
        objects += loadTable(save, 0x0D, [&](Reader& r) { loadPlanet(sim, r); });
        objects += loadTable(save, 0x0E, [&](Reader& r) { loadSite(sim, r); });
        objects += loadTable(save, 0x0F, [&](Reader& r) { loadColony(sim, r, version); });
        objects += loadTable(save, 0x10, [&](Reader& r) { loadTile(sim, r, version); });
        objects += loadTable(save, 0x11, [&](Reader& r) { loadUnit(sim, r, version); });
        objects += loadTable(save, 0x12, [&](Reader& r) { loadBuilding(sim, r, version, linked); });
        objects += loadTable(save, 0x13, [&](Reader& r) { loadPlayer(sim, r); });
        out.objects = objects;

        // After loading: handle counters, tile positions, the turn.
        for (size_t t = 0; t < out.lastHandle.size(); ++t)
            sim.db().setLastIndex(static_cast<ObjType>(t), out.lastHandle[t]);
        for (Tile* t : sim.db().allOf<Tile>(ObjType::Tile)) sim.indexTile(*t);
        sim.setTurn(out.turn);

        // What the simulation still keeps outside the objects: the current
        // planet's hostility and terraforming, colony 1's mine sites.
        if (const Planet* p = sim.db().allOf<Planet>(ObjType::Planet).empty()
                                  ? nullptr : sim.db().allOf<Planet>(ObjType::Planet).front()) {
            sim.setPlanetHostility(p->hostility);
            sim.terraforming().turnsLeft = p->terraformTurns;
            sim.terraforming().atmosphere = p->atmosphere;
            sim.terraforming().field1A = p->field1A;
        }
        if (const Colony* c1 = sim.db().get<Colony>(Handle::make(ObjType::Colony, 1))) {
            if (const Site* s = sim.siteOf(*c1)) {
                sim.hiddenDeposits().clear();
                for (const Pos3& p : s->mineSites) sim.hiddenDeposits().push_back({p.x, p.y, p.z});
                sim.nextHiddenDeposit() = sim.hiddenDeposits().size();   // all revealed
            }
        }
        if (const auto* ext = save.chunk(kExtensionChunk)) loadExtensions(sim, ext->body);
        if (info) *info = std::move(out);
        return true;
    } catch (const std::exception& e) {
        if (error) *error = e.what();
        return false;
    }
}

} // namespace outpost::sim
