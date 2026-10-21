#include "sim/ops_writer.hpp"
#include "sim/ops_extensions.hpp"

#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/vehicles.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdio>
#include <stdexcept>
#include <string>

namespace outpost::sim {

namespace {

constexpr int kVersion = 4;

// The mirror of the loader's Reader (s2:7E1C File_write and the value
// writers s2:79F0, s2:7A22, s2:7B4C, s2:7C2A).
class Writer {
public:
    void u16(uint16_t v) { m_d.push_back(static_cast<uint8_t>(v)); m_d.push_back(static_cast<uint8_t>(v >> 8)); }
    void i16(int16_t v) { u16(static_cast<uint16_t>(v)); }
    void u32(uint32_t v) { u16(static_cast<uint16_t>(v)); u16(static_cast<uint16_t>(v >> 16)); }
    void i32(int32_t v) { u32(static_cast<uint32_t>(v)); }
    void handle(Handle h) { u32(h.value); }
    void cstr(const std::string& s) { m_d.insert(m_d.end(), s.begin(), s.end()); m_d.push_back(0); }
    void bytes(const std::vector<uint8_t>& b) { m_d.insert(m_d.end(), b.begin(), b.end()); }
    void zeros(size_t n) { m_d.insert(m_d.end(), n, 0); }
    void pos(const Pos3& p) { i16(p.x); i16(p.y); i16(p.z); }
    void handles(const std::vector<Handle>& v) {
        u32(static_cast<uint32_t>(v.size()));
        for (Handle h : v) handle(h);
    }
    // s2:7A22: word slots, (word key, dword value) each.
    void ledger(const Ledger& l) {
        u16(static_cast<uint16_t>(l.entries().size()));
        for (const auto& [key, value] : l.entries()) {
            u16(static_cast<uint16_t>(key));
            i32(value);
        }
    }
    // s2:7A22 for a table pointer: 0 entries when there is none.
    void table(const Ledger* l) {
        if (l) ledger(*l);
        else u16(0);
    }
    // s8:75CA
    void trip(const Trip& t) {
        handles(t.route);
        handle(t.home);
        table(t.cargo.get());
        u16(t.bas);
        u16(t.productA);
        u16(t.productB);
        u32(t.quantity);
        pos(Pos3{t.pos.x, t.pos.y, t.pos.level});
        handle(t.next);
        i16(t.points);
        i16(t.trucks);
        u16(t.waiting);
    }
    void items(const std::vector<ProductItem>& v) {
        u16(static_cast<uint16_t>(v.size()));
        for (const ProductItem& it : v) {
            u16(it.field04);
            u16(it.productA);
            u16(it.productB);
            u16(it.quantity);
            u16(it.units);
        }
    }
    // Save_writeChunkTag (s2:7CAC).
    void tag(uint8_t id) {
        char buf[16];
        std::snprintf(buf, sizeof buf, "dcbSC%02x", id);
        m_d.insert(m_d.end(), buf, buf + 7);
    }
    std::vector<uint8_t>& data() { return m_d; }

private:
    std::vector<uint8_t> m_d;
};

void dbObj(Writer& w, const DbObject& o) {      // s7:16D6
    w.handle(o.self);
    w.handle(o.owner);
}

void writeMothership(Writer& w, Simulation& sim) {                       // s3:9900
    w.tag(0x01);
    const Mothership& m = sim.mothership();
    for (const auto* list : {&m.hold, &m.deployable, &m.damaged}) {
        w.u16(static_cast<uint16_t>(list->size()));
        for (const ShipItem& it : *list) {
            w.u16(it.kind);
            w.i16(it.count);
        }
    }
    w.u16(m.arrived ? 1 : 0);
    w.i16(m.countdown);
    w.i16(m.cryoColonists);
}

void writeRaw(Writer& w, uint8_t id, const std::vector<uint8_t>& body, size_t defaultSize) {
    w.tag(id);
    if (body.empty()) w.zeros(defaultSize);   // IMPROVISED: zeros for a new game
    else w.bytes(body);
}

void writeBuildMenu(Writer& w, Simulation& sim) {                         // s3:6846
    w.tag(0x03);
    const BuildMenu& m = sim.buildMenu();
    for (uint16_t v : m.offered) w.u16(v);
    for (uint16_t v : m.products) w.u16(v);
    w.u16(m.field148);
}

void writeOptions(Writer& w, Simulation& sim, const OpsExtras& x) {       // s3:5DC6
    w.tag(0x04);
    w.cstr(x.aiName);
    w.cstr(x.playerName);
    w.u16(static_cast<uint16_t>(sim.difficulty()));
    w.u16(sim.autoTrucking() ? 1 : 0);
}

void writeAlerts(Writer& w, Simulation& sim, const OpsExtras& x) {        // s3:0AD2
    w.tag(0x06);
    w.u16(static_cast<uint16_t>(x.alerts.size()));
    for (const auto& [a, b] : x.alerts) {
        w.u16(a);
        w.u32(b);
    }
    w.u16(x.alertsWordE);
    w.u16(x.alertsWord10);
    for (uint16_t row = 0; row < 10; ++row) w.u16(sim.alertOn(static_cast<uint16_t>(row + 1)) ? 1 : 0);
    for (uint16_t row = 16; row < 19; ++row) {
        const int32_t v = x.alertRows[row];
        w.u16(v >= 0 ? static_cast<uint16_t>(v) : sim.data().dgroupWord(0xE28 + 8u * row));
    }
}

void writeLater(Writer& w, Simulation& sim, const OpsExtras& x) {
    w.tag(0x14);                                                          // s2:E5DA
    const auto& trade = sim.tradeAgreements();
    w.u16(static_cast<uint16_t>(trade.size()));
    for (size_t i = 0; i < trade.size(); ++i) {
        const auto d = i < x.tradeDwords.size() ? x.tradeDwords[i] : std::pair<uint32_t, uint32_t>{};
        w.u32(d.first);
        w.u32(d.second);
        w.u16(trade[i].state);
        w.u32(trade[i].sinceTurn);
        w.u16(trade[i].flag12);
    }
    w.tag(0x15);                                                          // s2:C98E
    w.u32(x.rebelBusyUntil);
    w.tag(0x16);                                                          // s2:BA38
    w.u16(x.aiWord22);
    const auto& ai = sim.aiManagers();
    w.u16(static_cast<uint16_t>(ai.size()));
    for (size_t i = 0; i < ai.size(); ++i) {
        // IMPROVISED: a manager without a saved name gets an empty one.
        w.cstr(i < x.aiNames.size() ? x.aiNames[i] : std::string{});
        w.u16(ai[i].active ? 1 : 0);
        w.handle(ai[i].colony);
        w.u16(ai[i].emphasis);
    }
}

void writePopulation(Writer& w, const Population& p) {                    // s7:32E4
    for (int32_t v : p.cohort) w.i32(v);
    for (int16_t v : p.deathRate) w.i16(v);
    for (int16_t v : p.deathChance) w.i16(v);
    for (int32_t v : p.deathCarry) w.i32(v);
    w.i16(p.birthDivisor);
    w.i32(p.lifeSupportDeaths);
    w.i32(p.extra170);
    w.u16(p.schoolLeavingAge);
}

void writeColony(Writer& w, const Colony& c) {                            // s8:5E16
    dbObj(w, c);
    const auto& entries = c.tiles.entries();
    w.u32(static_cast<uint32_t>(entries.size()));
    for (const auto& e : entries) {
        w.handle(e.tile);
        w.u16(e.key);
    }
    w.handle(c.hub);
    w.i16(c.morale);
    w.i16(c.prevMorale);
    w.u16(c.defectionTier);
    w.i32(c.defectionAmount);
    w.i16(c.crime);
    w.i16(c.education);
    for (int32_t v : c.total) w.i32(v);
    for (int32_t v : c.linkedCount) w.i32(v);
    for (int32_t v : c.linkedBusy) w.i32(v);
    writePopulation(w, c.population);
    w.cstr(c.name);
    w.u16(c.populated ? 1 : 0);
    w.handle(c.player);
    w.u16(c.nanotech ? 1 : 0);
    w.u16(c.freeResources ? 1 : 0);
    w.i16(c.messageArg208);
    w.i16(c.crowdingMorale);
    w.i16(c.crowdingFlag);
    w.i16(c.explorers);
    w.i16(c.plagueTurns);
    w.i32(c.plagueTreated);
}

void writeTile(Writer& w, const Tile& t) {                                // s7:7418
    dbObj(w, t);
    w.pos(Pos3{t.x, t.y, t.level});
    w.i16(t.mark12);
    w.i16(t.mark14);
    w.handle(t.building);
    w.handles(t.linked);
    w.ledger(t.bas);
    w.ledger(t.alloc);
    w.handle(t.colony);
    w.i16(t.field32);
    w.i16(t.trucks);
    w.handles(t.route);
    w.items(t.list3A);
    w.items(t.list3E);
}

void writeBuilding(Writer& w, Simulation& sim, const Building& b) {      // s6:B5EC
    w.u16(b.type);                                    // read first by the table reader
    dbObj(w, b);
    w.u16(b.type);
    w.u16(b.placeholderType);
    w.u16(b.spriteVariant);
    w.u16(b.state);
    w.u16(b.savedState);
    w.u16(b.flags);
    const uint16_t eff = b.state == Building::kSuspended ? b.savedState : b.state;
    switch (eff) {
        case 1: case 2: case 3:
            w.i16(b.turnsLeft);
            break;
        case Building::kConstructing:
            w.u16(b.buildInfo.word94);
            break;
        case Building::kOperational:
            w.u16(b.opsResource);
            w.u16(b.opsProductA);
            w.u16(b.opsProductB);
            w.u16(b.opsAmount);
            w.u16(b.opsCycleTurns);
            break;
        default:
            break;
    }

    if (auto* cmd = dynamic_cast<const CommandCenterBuilding*>(&b)) {        // s7:C21C
        w.i32(cmd->field20);
        w.i16(cmd->life);
    } else if (auto* sm = dynamic_cast<const SmelterBuilding*>(&b)) {
        w.i32(sm->minBCarry);
        w.i32(sm->minCCarry);
        w.ledger(sm->output);
    } else if (auto* f = dynamic_cast<const FactoryBuilding*>(&b)) {
        w.i16(f->progress);
        w.items(f->output);
    } else if (auto* m = dynamic_cast<const MineBuilding*>(&b)) {            // s6:1452
        w.i16(m->life);
        w.u16(m->oreCursor);
        w.u16(sim.firstMineDone() ? 1 : 0);
    } else if (auto* lab = dynamic_cast<const LabBuilding*>(&b)) {
        w.u16(lab->topic);
    } else if (auto* tf = dynamic_cast<const TerraFormBuilding*>(&b)) {
        for (uint16_t v : tf->systems) w.u16(v);
    } else if (auto* cop = dynamic_cast<const PoliceBuilding*>(&b)) {
        w.u16(cop->mode);
    } else if (auto* rc = dynamic_cast<const RoboCmdBuilding*>(&b)) {
        for (const auto& s : rc->slots) {
            w.u32(s.expires);
            w.u16(s.item);
            w.u16(s.flag);
            w.u32(s.field8);
        }
        w.u16(sim.firstRoboCmdDone() ? 1 : 0);
    } else if (auto* wh = dynamic_cast<const WarehouseBuilding*>(&b)) {
        w.items(wh->items);
    } else if (auto* uni = dynamic_cast<const UGUnivBuilding*>(&b)) {
        w.i16(uni->counter20);
    } else if (b.type == 63) {                                               // MonoStation
        // s6:2418: the waiting list (+0x20)
        const auto* st = dynamic_cast<const MonoStationBuilding*>(&b);
        w.u16(st ? static_cast<uint16_t>(st->waiting.size()) : uint16_t{0});
        if (st)
            for (const Trip* t : st->waiting) w.trip(*t);
    } else if (auto* robot = dynamic_cast<const RobotBuilding*>(&b)) {
        w.u32(robot->long20);
        if (b.type == 115 || b.type == 119) {
            w.u16(robot->word24);
        } else if (b.type == 116 || b.type == 120 || b.type == 121) {
            w.u16(robot->word24);
            w.u16(robot->word26);
        }
    }
}

void writePlayer(Writer& w, const Player& p) {                           // s7:227A
    dbObj(w, p);
    w.handles(p.children);
    for (int16_t v : p.remaining) w.i16(v);
    for (int16_t v : p.discoveries) w.i16(v);
    for (uint16_t v : p.priority) w.u16(v);
    for (int16_t v : p.minTurns) w.i16(v);
    for (uint16_t v : p.workedThisTurn) w.u16(v);
}

void writeStar(Writer& w, const Star& s) {
    dbObj(w, s);
    w.handles(s.children);
    w.cstr(s.name);
    w.pos(s.pos);
    w.u16(static_cast<uint16_t>(s.planetIds.size()));
    for (uint16_t v : s.planetIds) w.u16(v);
}

void writePlanet(Writer& w, const Planet& p, Simulation& sim) {
    dbObj(w, p);
    w.handles(p.children);
    w.u16(p.nameId);
    w.cstr(p.name);
    w.pos(p.pos);
    w.i16(p.hostility);
    w.i32(p.rec0E);
    for (int16_t v : p.traits) w.i16(v);
    w.u16(static_cast<uint16_t>(p.siteIds.size()));
    for (uint16_t v : p.siteIds) w.u16(v);
    w.i16(p.field14);
    // The current planet's terraforming lives in the simulation.
    const bool current = !sim.db().allOf<Planet>(ObjType::Planet).empty() &&
                         sim.db().allOf<Planet>(ObjType::Planet).front() == &p;
    w.u16(current ? sim.terraforming().atmosphere : p.atmosphere);
    w.i16(current ? static_cast<int16_t>(sim.terraforming().turnsLeft) : p.terraformTurns);
    w.u16(current ? sim.terraforming().field1A : p.field1A);
}

void writeSite(Writer& w, const Site& s) {
    dbObj(w, s);
    w.handles(s.children);
    w.u16(s.rec00);
    w.u16(s.rec02);
    w.cstr(s.name);
    // rec+0x1A: the revealed mine sites only; the hidden ones are lost.
    const size_t n = std::min<size_t>(s.visibleMines, s.mineSites.size());
    w.u16(static_cast<uint16_t>(n));
    for (size_t i = 0; i < n; ++i) w.pos(s.mineSites[i]);
    w.pos(s.mapSize);
    w.u16(s.depth);
}

template <class T, class Fn>
void writeTable(Writer& w, Simulation& sim, uint8_t id, ObjType type, Fn fn) {
    w.tag(id);
    const auto objs = sim.db().allOf<T>(type);
    w.u32(static_cast<uint32_t>(objs.size()));
    for (T* o : objs) fn(*o);
}

} // namespace

std::vector<uint8_t> writeOps(Simulation& sim, const OpsExtras& x) {
    Writer w;
    const char header[] = "SC004";
    w.data().insert(w.data().end(), header, header + 5);

    // The registry objects (DGROUP 0x320).
    writeMothership(w, sim);
    writeRaw(w, 0x02, x.view02, 4 * 4 + 2 * 2);
    writeBuildMenu(w, sim);
    writeOptions(w, sim, x);
    w.tag(0x05);                                        // s3:3FC2
    w.u16(x.planetWindow.frame);
    w.u16(x.planetWindow.mode);
    w.u16(x.planetWindow.spinning);
    writeAlerts(w, sim, x);
    w.tag(0x07);                                        // s3:6372
    for (size_t i = 0; i < Orbitals::kSlots; ++i) {
        w.i16(sim.orbitals().carried[i]);
        w.i16(sim.orbitals().launched[i]);
    }
    writeLater(w, sim, x);

    // s2:6EEE
    w.tag(0x08);
    w.tag(0x09);
    for (size_t t = 0; t < 9; ++t) w.u32(sim.db().lastIndex(static_cast<ObjType>(t)));
    w.tag(0x0A);
    w.u32(sim.turn());
    w.u16(x.dbWord8);
    const Galaxy& g = sim.galaxy();
    w.handle(g.self);
    w.handle(g.owner);
    w.handles(g.children);
    w.u16(static_cast<uint16_t>(g.starIds.size()));
    for (uint16_t v : g.starIds) w.u16(v);
    writeTable<Star>(w, sim, 0x0C, ObjType::Star, [&](Star& s) { writeStar(w, s); });
    writeTable<Planet>(w, sim, 0x0D, ObjType::Planet, [&](Planet& p) { writePlanet(w, p, sim); });
    writeTable<Site>(w, sim, 0x0E, ObjType::Site, [&](Site& s) { writeSite(w, s); });
    writeTable<Colony>(w, sim, 0x0F, ObjType::Colony, [&](Colony& c) { writeColony(w, c); });
    writeTable<Tile>(w, sim, 0x10, ObjType::Tile, [&](Tile& t) { writeTile(w, t); });
    writeTable<Unit>(w, sim, 0x11, ObjType::Unit, [&](Unit& u) { dbObj(w, u); w.u16(u.kind); });
    writeTable<Building>(w, sim, 0x12, ObjType::Building, [&](Building& b) { writeBuilding(w, sim, b); });
    writeTable<Player>(w, sim, 0x13, ObjType::Player, [&](Player& p) { writePlayer(w, p); });
    w.tag(0x17);
    w.u16(static_cast<uint16_t>(sim.trips().size()));   // s8:7B20
    for (const auto& t : sim.trips()) w.trip(*t);
    w.u16(static_cast<uint16_t>(sim.trains().size()));   // the trains (s7:B768)
    for (const auto& t : sim.trains()) {
        w.handle(t->station);
        w.pos(Pos3{t->pos.x, t->pos.y, t->pos.level});
        w.u16(t->direction);
        w.u16(static_cast<uint16_t>(t->riders.size()));
        for (const Trip* r : t->riders) w.trip(*r);
    }
    w.tag(0x0B);                                        // s5:A644: the tag only
    // The rebuild's own features (ops_extensions.hpp), after the original's
    // chunks; written only when a module has state to keep.
    if (auto ext = saveExtensions(sim); !ext.empty()) {
        w.tag(kExtensionChunk);
        w.bytes(ext);
    }
    return std::move(w.data());
}

} // namespace outpost::sim
