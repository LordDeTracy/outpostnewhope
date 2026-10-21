#include "sim/simulation.hpp"

#include "data/game_files.hpp"
#include "sim/building.hpp"
#include "sim/steps.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdlib>

namespace outpost::sim {

bool GameData::load(const data::GameFiles& files, std::string* error) {
    auto fail = [error](const std::string& msg) {
        if (error) *error = msg;
        return false;
    };
    auto exeBytes = files.read("OUTPOST.EXE");
    if (!exeBytes) return fail("OUTPOST.EXE not found");
    if (!exe.parse(std::move(*exeBytes))) return fail(exe.error());
    if (!strings.load(exe)) return fail("string table not found");

    auto bld = files.read("BLDGBLD.DAT");
    auto ops = files.read("BLDGOPS.DAT");
    if (!bld || !ops) return fail("BLDGBLD.DAT/BLDGOPS.DAT not found");
    bldgBld = data::parseBldgBld(*bld);
    bldgOps = data::parseBldgOps(*ops);

    if (!research.load(exe, strings)) return fail(research.error());
    if (!stars.load(exe, strings)) return fail(stars.error());
    if (!groups.load(exe)) return fail("building groups not found");
    auto d = exe.dgroup();
    if (0x4FBE + 2 * mineOreMix.size() > d.size()) return fail("ore mix table not found");
    for (size_t i = 0; i < mineOreMix.size(); ++i)
        mineOreMix[i] = static_cast<int16_t>(d[0x4FBE + 2 * i] | (d[0x4FBF + 2 * i] << 8));
    {
        // The far pointer's offset part; the table is in DGROUP.
        const size_t kit = static_cast<size_t>(d[0x580E] | (d[0x580F] << 8));
        if (kit + 2 * commandKit.size() > d.size()) return fail("command kit table not found");
        for (size_t i = 0; i < commandKit.size(); ++i)
            commandKit[i] = static_cast<int16_t>(d[kit + 2 * i] | (d[kit + 2 * i + 1] << 8));
    }
    if (0x4EA4 + 2 * tilePriority.size() > d.size()) return fail("tile priority table not found");
    for (size_t i = 0; i < tilePriority.size(); ++i)
        tilePriority[i] = static_cast<uint16_t>(d[0x4EA4 + 2 * i] | (d[0x4EA5 + 2 * i] << 8));
    // Rows of {far ptr A, word length A, far ptr B, word length B}; the
    // segment words hold the relocation chain, only the offsets are used.
    if (!bitmaps.load(exe)) return fail("bitmap catalog not found");
    sites = data::readSiteTable(exe);
    if (sites.empty()) return fail("site table not found (unsupported OUTPOST.EXE version?)");
    siteTerrain.assign(sites.size(), {});
    if (auto cd = files.cdAssets())
        for (size_t i = 0; i < sites.size(); ++i)
            if (auto bmp = data::readBitmapFile(*cd, bitmaps.name(sites[i].terrainId)))
                siteTerrain[i].load(*bmp);
    if (0xE28 + 8 * alertFlags.size() > d.size()) return fail("alert table not found");
    for (size_t i = 0; i < alertFlags.size(); ++i)
        alertFlags[i] = static_cast<uint16_t>(d[0xE28 + 8 * i] | (d[0xE29 + 8 * i] << 8));
    if (0x58BE + 12 * aiEmphasis.size() > d.size()) return fail("AI emphasis table not found");
    for (size_t i = 0; i < aiEmphasis.size(); ++i) {
        const size_t o = 0x58BE + 12 * i;
        auto w = [&](size_t k) { return static_cast<uint16_t>(d[o + k] | (d[o + k + 1] << 8)); };
        aiEmphasis[i] = {w(0), w(4), w(6), w(10)};
    }
    {
        static constexpr size_t kTables[3] = {0x44B4, 0x47F0, 0x4B2C};
        for (size_t t = 0; t < 3; ++t) {
            if (kTables[t] + 6 * rebelResponses[t].size() > d.size()) return fail("rebel table not found");
            for (size_t i = 0; i < rebelResponses[t].size(); ++i) {
                const size_t o = kTables[t] + 6 * i;
                rebelResponses[t][i] = {static_cast<int16_t>(d[o + 4] | (d[o + 5] << 8)),
                                        static_cast<uint16_t>(d[o] | (d[o + 1] << 8))};
            }
        }
    }
    return true;
}

uint16_t GameData::dgroupWord(size_t offset) const {
    const auto d = exe.dgroup();
    if (offset + 1 >= d.size()) return 0;
    return static_cast<uint16_t>(d[offset] | (d[offset + 1] << 8));
}

BuildMenu::BuildMenu() {
    static constexpr uint16_t kTypes[] = {20, 27, 30, 34, 37, 42, 47, 49, 53, 55, 56,
                                          58, 60, 76, 77, 78, 79, 82, 84, 87, 90, 91,
                                          93, 101, 104, 108, 122, 123, 124, 125, 126, 127};
    static constexpr uint16_t kProducts[] = {1, 2, 3, 4, 5, 7, 13};
    for (uint16_t t : kTypes) offered[t] = 1;
    for (uint16_t k : kProducts) products[k] = 1;
}

void BuildMenu::offer(uint16_t type, uint16_t on) {
    if (type < offered.size()) offered[type] = on;
}

void BuildMenu::offerProduct(uint16_t product, uint16_t on) {
    if (product < products.size()) products[product] = on;
}

void BuildMenu::upgrade(std::initializer_list<uint16_t> chain) {
    bool found = false;
    uint16_t current = 0;
    for (uint16_t t : chain) {
        if (found) {
            offer(current, 0);
            offer(t, 1);
            return;
        }
        if (isOffered(t)) {
            found = true;
            current = t;
        }
    }
}

Simulation::Simulation(const GameData& data, uint32_t seed) : m_data(data) {
    m_rand.srand(static_cast<uint16_t>(seed == 0 ? 1 : seed));
    m_alerts = data.alertFlags;
}

int16_t Simulation::random(int16_t lo, int16_t hi) {
    const int16_t r = m_rand.rand();          // drawn first, as in s2:612E
    const int32_t n = static_cast<int16_t>(hi - lo + 1);
    if (n == 0) return lo;
    const int32_t step = 0x7FFF / n;
    int32_t k = 1;
    for (int32_t v = lo; v <= hi; ++v, ++k)
        if (k * step >= r) return static_cast<int16_t>(v);
    return hi;
}

int16_t Mothership::countOf(const std::vector<ShipItem>& list, uint16_t kind) {
    for (const ShipItem& i : list)
        if (i.kind == kind) return i.count;
    return 0;
}

void Mothership::removeDeployable(uint16_t kind) {
    for (auto it = deployable.begin(); it != deployable.end(); ++it) {
        if (it->kind != kind) continue;
        if (--it->count <= 0) {
            deployable.erase(it);
            if (deployable.empty()) deployableEmptied = true;
        }
        return;
    }
}

void Mothership::moveLanders() {
    if (landersMoved) return;
    landersMoved = true;
    deployable.clear();
    for (auto it = hold.begin(); it != hold.end();) {
        if (it->kind == 62 || it->kind == 65) {
            deployable.push_back(*it);
            it = hold.erase(it);
        } else {
            ++it;
        }
    }
}

void Mothership::arrive(int difficulty) {
    arrived = true;
    damageCargo(difficulty);
    cryoColonists = static_cast<int16_t>(holdCount(0x80) * 50);
}

void Mothership::damageCargo(int difficulty) {
    const int16_t div = difficulty == 1 || difficulty == 2 ? 4 : 2;
    for (ShipItem& it : hold) {
        switch (it.kind) {
            case 62: case 65: case 0x80: {
                const int16_t lost = static_cast<int16_t>(it.count / 2);
                it.count = static_cast<int16_t>(it.count - lost);
                damaged.push_back({it.kind, lost != 0 ? lost : int16_t{1}});
                continue;
            }
            case 18:
                if (it.count <= 2) continue;
                break;
            case 131:
                if (it.count <= 1) continue;
                break;
            default:
                break;
        }
        it.count = static_cast<int16_t>(it.count - it.count / div);
    }
}

int16_t Mothership::loseCryoColonists(uint32_t turn) {
    if (!arrived) return 0;
    if (countdown > 0) --countdown;
    if (countdown != 0 || cryoColonists == 0) return 0;
    int16_t n = 1;
    if (turn > 50) n = 5;
    if (turn > 60) n = 10;
    if (cryoColonists < n) n = cryoColonists;
    cryoColonists = static_cast<int16_t>(cryoColonists - n);
    if (cryoColonists < 0) cryoColonists = 0;
    return cryoColonists > 0 ? n : -1;
}

Player& Simulation::createPlayer() {
    return m_db.create<Player>(ObjType::Player, Handle{});
}

Colony& Simulation::createColony(Handle player) {
    Colony& c = m_db.create<Colony>(ObjType::Colony, Handle{});
    c.player = player;
    c.population.reset(m_difficulty);
    return c;
}

Handle Simulation::gridOf(const Colony& colony) {
    return colony.owner ? colony.owner : colony.self;
}

void Simulation::indexTile(const Tile& tile) {
    m_tileIndex[{tile.owner.value, tile.x, tile.y, tile.level}] = tile.self;
    if (Grid* g = gridOfSite(tile.owner)) g->setTile({tile.x, tile.y, tile.level}, tile.self);
}

Grid* Simulation::gridOfSite(Handle site) {
    if (Grid* g = m_map.grid(site)) return g;
    const Site* s = m_db.get<Site>(site);
    if (!s) return nullptr;
    return &m_map.addGrid(site, s->rec00, m_data.terrainOfSite(s->rec00));
}

const Site* Simulation::siteOf(const Colony& colony) const {
    return m_db.get<Site>(colony.owner);
}

Tile& Simulation::createTile(Colony& colony, int16_t x, int16_t y, int16_t level) {
    Tile& t = m_db.create<Tile>(ObjType::Tile, gridOf(colony));
    t.colony = colony.self;
    t.x = x;
    t.y = y;
    t.level = level;
    // s7:684C: a tile starts with the cell's terrain in +0x12 and +0x14.
    if (Grid* g = gridOfSite(t.owner)) t.mark12 = t.mark14 = static_cast<int16_t>(g->terrain({x, y, level}));
    // The colony's add (s8:5860, nothing if already listed; s5:C5B4) uses
    // the key of the building on the tile: none yet. Tile::setBuilding then
    // corrects the key in place (createBuilding).
    if (!colony.tiles.contains(t.self)) colony.tiles.add(t.self, m_data.priorityOf(0));
    indexTile(t);
    return t;
}

Tile* Simulation::tileAt(Handle grid, int16_t x, int16_t y, int16_t level) const {
    auto it = m_tileIndex.find({grid.value, x, y, level});
    return it == m_tileIndex.end() ? nullptr : m_db.get<Tile>(it->second);
}

std::vector<Tile*> Simulation::colonyTilesInGroup(const Colony& colony, int group,
                                                  bool operationalOnly) const {
    std::vector<Tile*> out;
    for (Handle th : colony.tiles.order()) {
        Tile* t = m_db.get<Tile>(th);
        if (!t) continue;
        const Building* b = m_db.get<Building>(t->building);
        if (b && m_data.groups.contains(group, b->type) &&
            (!operationalOnly || b->state == Building::kOperational))
            out.push_back(t);
    }
    return out;
}

int Simulation::tileDistance(const Tile& a, const Tile& b) {
    if (a.owner != b.owner) return -1;
    return std::abs(a.x - b.x) + std::abs(a.y - b.y);
}

Building& Simulation::putBuilding(Tile& tile, uint16_t type, bool keepMark, uint16_t reserveArg) {
    // s6:8B01: the tile is marked unless the new building is terrain
    // (group 49) or the step's +0x11C flag is set (never, here).
    const int16_t groundMark = tile.mark14;
    if (!keepMark && !m_data.groups.contains(49, type)) tile.mark14 = tile.level > 0 ? 6 : 5;
    // SCKillBldg (priority 16000) destroys the old building as soon as the
    // running step ends; until then it is no longer on the tile.
    if (tile.building) enqueue(makeKillBuildingStep(tile.building));
    tile.building = Handle{};
    Building& b = createBuilding(tile, type);
    // SCPutBldg sets a Command's parent (+0x20) on its candidate before the
    // building goes down (s6:9762), so its reserve founds the new colony;
    // SCInternalPutBldg sets it only afterwards (s6:8C2A).
    if (m_pendingParent)
        if (auto* cmd = dynamic_cast<CommandCenterBuilding*>(&b)) cmd->field20 = static_cast<int32_t>(m_pendingParent.value);
    m_pendingParent = Handle{};
    if (m_pendingDirection)
        if (auto* robot = dynamic_cast<RobotBuilding*>(&b)) robot->word24 = *m_pendingDirection;
    m_pendingDirection.reset();
    if (auto* robot = dynamic_cast<RobotBuilding*>(&b); robot && robot->isDozer()) robot->groundMark = groundMark;
    b.beginConstruction(*this);                        // slot 8
    b.reserveNeeds(*this, reserveArg);                 // slot 6 (s6:8BF9: 1; SCPutBldg: 0)
    return b;
}

void Simulation::generateSites(Planet& planet) {
    for (uint16_t index : planet.siteIds) {
        // s7:4782 with "named": the planet's next site number.
        const auto number = static_cast<uint16_t>(++planet.field14);    // s7:2A98
        Site& site = generateSite(planet, index, number);
        planet.children.push_back(site.self);
    }
}

int Simulation::restoreSites(Planet& planet) {
    int made = 0;
    for (size_t i = 0; i < planet.siteIds.size(); ++i) {
        // A child is kept only if it is still this site of the list: a stale
        // handle (the site was destroyed) may have been reused since.
        if (i < planet.children.size())
            if (const Site* s = m_db.get<Site>(planet.children[i]); s && s->owner == planet.self && s->rec00 == planet.siteIds[i])
                continue;
        Site& site = generateSite(planet, planet.siteIds[i], static_cast<uint16_t>(i + 1));
        if (i < planet.children.size()) planet.children[i] = site.self;
        else planet.children.push_back(site.self);
        ++made;
    }
    return made;
}

Site& Simulation::generateSite(Planet& planet, uint16_t index, uint16_t number) {
    {
        Site& site = m_db.create<Site>(ObjType::Site, planet.self);       // s6:ED2C -> ctor s7:565A
        site.rec00 = index;
        const data::IndexedBitmap* terrain = m_data.terrainOfSite(index);
        site.rec02 = number;
        site.name = m_data.strings.get(1581);                            // "Site %d"
        if (auto at = site.name.find("%d"); at != std::string::npos)
            site.name.replace(at, 2, std::to_string(site.rec02));
        const int16_t w = terrain ? static_cast<int16_t>(terrain->width) : 0;
        const int16_t h = terrain ? static_cast<int16_t>(terrain->height) : 0;
        site.mapSize = {w, h, 1};                                        // s7:5A80
        // Mine sites: n by the planet's hostility (s7:2F1A).
        int16_t lo = 0, hi = 0;
        switch (planet.hostility) {
            case 1: case 2: case 8: case 9: lo = 25; hi = 45; break;
            case 3: case 4: case 5:         lo = 10; hi = 15; break;
            case 6:                         lo = 10; hi = 25; break;
            case 7:                         lo = 25; hi = 55; break;
            default: break;
        }
        const auto n = random(lo, hi);
        site.hiddenMines = static_cast<uint16_t>(static_cast<int16_t>(n * 10) / 100);
        int16_t factor = 60;
        const int probes = orbitalCount(0x84);
        if (m_difficulty <= 2) {
            if (probes > 0) factor = 90;
        } else {
            static constexpr int16_t kMore[5] = {0, 8, 15, 23, 30};
            if (probes >= 1 && probes <= 4) factor = static_cast<int16_t>(factor + kMore[probes]);
        }
        site.visibleMines = static_cast<uint16_t>(static_cast<int16_t>(factor * n) / 100);
        const int total = site.visibleMines + site.hiddenMines;
        for (int i = 0; i < total; ++i) {
            for (;;) {
                const int16_t x = random(0, static_cast<int16_t>(w - 1));
                const int16_t y = random(0, static_cast<int16_t>(h - 1));
                bool taken = false;
                for (const Pos3& p : site.mineSites) taken = taken || (p.x == x && p.y == y);
                if (taken) continue;
                site.mineSites.push_back({x, y, 0});
                break;
            }
        }
        // s6:ED2C -> s7:6222(map, 1, ...): the grid, then s7:8D08: a tile
        // and a DisMine (no colony) on every visible mine site.
        Grid& g = m_map.grid(site.self) ? *m_map.grid(site.self) : m_map.addGrid(site.self, index, terrain);
        for (int i = 0; i < site.visibleMines; ++i) {
            const Pos3& p = site.mineSites[static_cast<size_t>(i)];
            Tile& t = m_db.create<Tile>(ObjType::Tile, site.self);         // s6:EE54
            t.x = p.x;
            t.y = p.y;
            t.level = 0;
            t.mark12 = t.mark14 = static_cast<int16_t>(g.terrain({p.x, p.y, 0}));
            indexTile(t);
            createBuilding(t, 16);
        }
        return site;
    }
}

uint16_t Simulation::cellKind(Handle site, const MapCell& pos) {
    Grid* g = gridOfSite(site);
    if (!g) return 0;
    const Tile* t = m_db.get<Tile>(g->tileAt(pos));
    if (!t) return g->terrain(pos);
    const Building* b = m_db.get<Building>(t->building);
    if (!b) return static_cast<uint16_t>(t->mark14);
    static constexpr uint16_t kKind[10] = {0, 1, 2, 3, 4, 5, 7, 8, 9, 6};
    return b->type >= 1 && b->type <= 9 ? kKind[b->type] : uint16_t{0};
}

Building* Simulation::playerPutBuilding(Handle site, MapCell pos, uint16_t type, Handle colony,
                                        uint16_t digDirection, bool dozeConfirmed) {
    m_placeMessage = {};
    // The candidate is made first and asked; it never enters the game when
    // it is refused (SCKillBldg at once, s6:94A7).
    const auto candidate = makeBuilding(type);
    if (auto* robot = dynamic_cast<RobotBuilding*>(candidate.get()); robot && robot->isDigger())
        robot->word24 = digDirection;
    m_dozeConfirmed = dozeConfirmed;
    const bool allowed = candidate->canPlace(*this, pos, colony, site);
    m_dozeConfirmed = true;
    if (!allowed) {
        if (m_placeMessage.id == 0) m_placeMessage.id = 1709;
        return nullptr;
    }
    Grid* g = gridOfSite(site);
    if (type == 117 && g)                                 // s6:96CD: a RoboMine on a tile
        if (Tile* t = m_db.get<Tile>(g->tileAt(pos)))
            if (Colony* c = m_db.get<Colony>(colony))
                if (!c->tiles.contains(t->self)) c->tiles.add(t->self, m_data.priorityOf(0));
    if (auto* robot = dynamic_cast<RobotBuilding*>(candidate.get())) m_pendingDirection = robot->word24;
    Building* b = putBuildingAt(site, pos, type, colony, Handle{}, 0);
    m_pendingDirection.reset();
    if (b) rebelsHear(*this, type, site);                 // s6:9600 -> s5:A80E
    return b;
}

Building* Simulation::putBuildingAt(Handle site, MapCell pos, uint16_t type, Handle colony,
                                     Handle player, uint16_t reserveArg) {
    Grid* g = gridOfSite(site);
    if (!g) return nullptr;
    Tile* tile = m_db.get<Tile>(g->tileAt(pos));
    Handle parent;
    if (!tile) {
        // s6:EE54: a new tile on the cell, remembering its terrain.
        const auto terrain = static_cast<int16_t>(g->terrain(pos));
        Tile& t = m_db.create<Tile>(ObjType::Tile, site);
        t.x = pos.x;
        t.y = pos.y;
        t.level = pos.level;
        t.mark12 = t.mark14 = terrain;
        indexTile(t);
        tile = &t;
        if (type == 10 || type == 55) {
            if (type == 55) parent = colony;
            // s6:EDC4: the colony's hub is the cell's value: the new tile.
            Colony& c = m_db.create<Colony>(ObjType::Colony, site);
            c.hub = t.self;
            c.population.reset(m_difficulty);
            if (player) c.player = player;           // step +0x110
            colony = c.self;
        }
        if (Colony* c = m_db.get<Colony>(colony))    // s8:5860
            if (!c->tiles.contains(t.self)) c->tiles.add(t.self, m_data.priorityOf(0));
    }
    tile->colony = colony;                            // s7:73EE
    if (type == 55 && reserveArg == 0) m_pendingParent = parent;   // the player's SCPutBldg
    Building& b = putBuilding(*tile, type, false, reserveArg);
    if (type == 55)
        if (auto* cmd = dynamic_cast<CommandCenterBuilding*>(&b)) cmd->field20 = static_cast<int32_t>(parent.value);
    return &b;
}

Building& Simulation::createBuilding(Tile& tile, uint16_t type) {
    Building& b = m_db.insert(ObjType::Building, tile.self, makeBuilding(type));
    // Sprite variant (s6:BF76): random 1..3 picks 0x48..0x4A, or 0x70..0x72
    // for group 0x28 (underground).
    const int r = random(1, 3);
    const bool ug = m_data.groups.contains(data::BuildingGroups::kUnderground, type);
    b.spriteVariant = static_cast<uint16_t>((ug ? 0x70 : 0x48) + (r - 1));
    tile.building = b.self;          // Tile::setBuilding (s7:7E5A); map hookup TODO
    if (Colony* c = m_db.get<Colony>(tile.colony))                 // s8:4B20 -> s5:C4F4
        c->tiles.setKey(tile.self, m_data.priorityOf(type));
    return b;
}

const Player* Simulation::playerOf(const Colony* colony) const {
    return colony ? m_db.get<Player>(colony->player) : nullptr;
}

TradeMarket& Simulation::tradeMarket() {
    if (!m_marketCreated) {
        // s4:331C: the market fetches registry 0x3B (nothing to draw), then
        // sets +0x13C = random(8, 12).
        m_marketCreated = true;
        m_market = TradeMarket{};
        m_market.value13C = random(8, 12);
    }
    return m_market;
}

void Simulation::terraformTick() {
    Terraforming& t = m_terraforming;
    if (t.turnsLeft > 0) --t.turnsLeft;
    if (t.atmosphere == 0) t.atmosphere = 1;
    if (t.field1A == 0) t.field1A = 2;
    if (t.turnsLeft > 0) return;
    t.atmosphere = 2;
    t.field1A = 1;
    post({0x37, 0x21, Handle{}, 0});
}

void Simulation::launchOrbital(uint16_t kind) {
    const int s = Orbitals::slot(kind);
    if (s < 0) return;
    ++m_orbitals.launched[static_cast<size_t>(s)];
    // s3:1F62(this, 0x15) then tells the views (UI, not modelled).
}

void Simulation::enqueue(std::unique_ptr<Step> step) {
    m_queue.enqueue(*this, std::move(step));
}

void Simulation::schedule(uint32_t turn, std::unique_ptr<Step> step) {
    if (!step || !step->shouldRun(*this)) return;
    auto pos = std::find_if(m_scheduled.begin(), m_scheduled.end(),
                            [turn](const auto& e) { return e.first <= turn; });
    m_scheduled.insert(pos, {turn, std::move(step)});
}

void Simulation::releaseScheduled() {
    while (!m_scheduled.empty() && m_scheduled.front().first <= m_turn) {
        std::unique_ptr<Step> step = std::move(m_scheduled.front().second);
        m_scheduled.erase(m_scheduled.begin());
        m_queue.insert(std::move(step));
    }
}

void Simulation::runTurns(uint32_t count) {
    while (count--) {
        m_lastSteps.clear();
        enqueueTurnSteps(*this);
        m_queue.runAll(*this);
        // s6:E242: the turn counter (g_objectDb+0) is advanced after each
        // turn; the original also pings a window every 100 turns.
        ++m_turn;
    }
}

} // namespace outpost::sim
