// SCAiInput (s7:E0D4, priority 10999): the AI managers build in their
// colonies. SCRoboMove (s8:290E, priority 14999): explorers reveal mine
// sites. findings/08-simulation.md §2.15, §2.16.

#include "sim/building.hpp"
#include "sim/map.hpp"
#include "sim/units.hpp"
#include "sim/vehicles.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/world.hpp"

#include <array>
#include <optional>

namespace outpost::sim {

namespace {

const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);
constexpr int kMultipleAi = 30, kNoAiProblems = 31;   // discoveries (strings 1666, 1667)
constexpr uint16_t kDisMine = 16;

// s7:9EF2: the builder is idle when it has no building, or its building is
// type 5 or 9, or past construction (state > 4); it then forgets it
// (s7:9F64).
bool builderIdle(Simulation& sim, Colony& c) {
    Colony::AiBuilder& b = c.aiBuilder;
    if (!b.tile) return true;
    const Tile* t = sim.db().get<Tile>(b.tile);
    const Building* bl = t ? sim.db().get<Building>(t->building) : nullptr;
    // IMPROVISED (guard): the EXE reads the building without checking that
    // it is still there.
    if (!bl || bl->type == 5 || bl->type == 9 || bl->state > Building::kConstructing) {
        b = Colony::AiBuilder{};
        return true;
    }
    return false;
}

// s2:C646: the first type of the group that the build menu offers
// (registry 0x35, +0x0A word per type); 0 if none.
uint16_t firstOffered(const Simulation& sim, int group) {
    for (uint16_t t : sim.data().groups.members(group))
        if (sim.buildMenu().isOffered(t)) return t;
    return 0;
}

// IMPROVISED (guard): a colony without a site has no map, so the search
// below cannot run; the rebuild then takes the first free position next to
// one of the colony's tiles (surface, or level 1 for underground types).
std::optional<MapPos> findPlaceWithoutMap(const Simulation& sim, const Colony& c, uint16_t type) {
    const int16_t level =
        sim.data().groups.contains(data::BuildingGroups::kUnderground, type) ? int16_t{1} : int16_t{0};
    static constexpr int kStep[4][2] = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}};
    for (Handle th : c.tiles.order()) {
        const Tile* t = sim.db().get<Tile>(th);
        if (!t || t->level != level) continue;
        for (const auto& d : kStep) {
            const auto x = static_cast<int16_t>(t->x + d[0]);
            const auto y = static_cast<int16_t>(t->y + d[1]);
            if (!sim.tileAt(Simulation::gridOf(c), x, y, level)) return MapPos{x, y, level};
        }
    }
    return std::nullopt;
}

// s7:A278's search on the colony's site (findings/10-map.md §3b): where to
// put the building, or which piece of preparation to put first (a tube or
// a RoboDozer).
struct AiPlace {
    MapCell pos;
    uint16_t piece{0};      // 0: the building itself goes here
};

class SiteSearch {
public:
    SiteSearch(Simulation& sim, Colony& c, const Site& site, Grid& grid)
        : m_sim(sim), m_colony(c), m_site(site), m_grid(grid) {}

    std::optional<AiPlace> run(int16_t level) const {
        const bool ug = level > 0;
        if (auto p = tubeEnds(level, &SiteSearch::ground)) return AiPlace{*p, 0};      // s7:AA18
        if (auto p = tubeSpot(level)) return AiPlace{*p, uint16_t(ug ? 127 : 122)};     // s7:A3AE
        if (availableUnits(m_colony, product::Dozer) == 0) return std::nullopt;
        const uint16_t dozer = ug ? 119 : 115;
        if (auto p = tubeEnds(level, &SiteSearch::emptyBuildable)) return AiPlace{*p, dozer};   // s7:A57E
        if (auto p = besideNetwork(level)) return AiPlace{*p, dozer};                  // s7:A844
        return std::nullopt;
    }

private:
    using Test = bool (SiteSearch::*)(const MapCell&) const;

    const Building* buildingAt(const MapCell& c) const {
        const Tile* t = m_sim.db().get<Tile>(m_grid.tileAt(c));
        return t ? m_sim.db().get<Building>(t->building) : nullptr;
    }
    // s7:ADDC: inside the map with a margin of 2.
    bool inMargin(const MapCell& c) const {
        return c.x > 1 && c.y > 1 && c.x < m_site.mapSize.x - 1 && c.y < m_site.mapSize.y - 1;
    }
    // s7:ACBE: bulldozed or dug ground (types 5, 9).
    bool ground(const MapCell& c) const {
        const Building* b = buildingAt(c);
        return b && (b->type == 5 || b->type == 9);
    }
    // s7:AD22: a building that conducts (group 70).
    bool conducting(const MapCell& c) const {
        const Building* b = buildingAt(c);
        return b && m_sim.data().groups.contains(70, b->type);
    }
    // s7:AD86: no tile, and terrain 1..3 or 7..8.
    bool emptyBuildable(const MapCell& c) const {
        if (m_grid.tileAt(c)) return false;
        const uint16_t t = m_grid.terrain(c);
        return (t >= 1 && t <= 3) || t == 7 || t == 8;
    }
    static std::array<MapCell, 4> around(const MapCell& p) {      // (x,y-1), (x,y+1), (x-1,y), (x+1,y)
        return {MapCell{p.x, int16_t(p.y - 1), p.level}, MapCell{p.x, int16_t(p.y + 1), p.level},
                MapCell{int16_t(p.x - 1), p.y, p.level}, MapCell{int16_t(p.x + 1), p.y, p.level}};
    }

    // The colony's tubes (group 7 on the surface, 8 below; any state; tile
    // order) inside the margin, tested at their open ends: X tubes all four
    // sides, L tubes along y, R tubes along x.
    std::optional<MapCell> tubeEnds(int16_t level, Test test) const {
        for (Tile* t : m_sim.colonyTilesInGroup(m_colony, level >= 1 ? 8 : 7, false)) {
            const MapCell p{t->x, t->y, t->level};
            const Building* b = m_sim.db().get<Building>(t->building);
            if (!b || !inMargin(p)) continue;
            const auto n = around(p);
            size_t from = 0, to = 4;
            if (b->type == 123 || b->type == 126) to = 2;                 // L tubes
            else if (b->type == 124 || b->type == 125) from = 2;          // R tubes
            for (size_t i = from; i < to; ++i)
                if ((this->*test)(n[i])) return n[i];
        }
        return std::nullopt;
    }
    // s7:A3AE: bulldozed ground (group 69) at the level, inside the margin,
    // touching a conducting building.
    std::optional<MapCell> tubeSpot(int16_t level) const {
        for (Tile* t : m_sim.colonyTilesInGroup(m_colony, 69, false)) {
            const MapCell p{t->x, t->y, t->level};
            if (p.level != level || !inMargin(p)) continue;
            for (const MapCell& n : around(p))
                if (conducting(n)) return p;
        }
        return std::nullopt;
    }
    // s7:A844: any conducting building of the colony at the level, inside
    // the margin, with an empty buildable neighbour.
    std::optional<MapCell> besideNetwork(int16_t level) const {
        for (Handle th : m_colony.tiles.order()) {
            const Tile* t = m_sim.db().get<Tile>(th);
            const Building* b = t ? m_sim.db().get<Building>(t->building) : nullptr;
            if (!b || !m_sim.data().groups.contains(70, b->type)) continue;
            const MapCell p{t->x, t->y, t->level};
            if (p.level != level || !inMargin(p)) continue;
            for (const MapCell& n : around(p))
                if (emptyBuildable(n)) return n;
        }
        return std::nullopt;
    }

    Simulation& m_sim;
    Colony& m_colony;
    const Site& m_site;
    Grid& m_grid;
};

// s8:35A8 -> s7:9F40 / s7:9F7A: build the group's offered type, then wait for it.
bool aiBuild(Simulation& sim, Colony& c, int group) {
    Colony::AiBuilder& b = c.aiBuilder;
    const uint16_t type = firstOffered(sim, group);
    b.type = type;
    if (type == 0) return false;          // IMPROVISED (guard): nothing to put
    const Site* site = sim.db().get<Site>(c.owner);
    Grid* grid = site ? sim.gridOfSite(c.owner) : nullptr;
    if (!site || !grid) {
        const auto place = findPlaceWithoutMap(sim, c, type);
        if (!place) return false;
        Tile& t = sim.createTile(c, place->x, place->y, place->level);
        sim.putBuilding(t, type);
        b.tile = t.self;
        return true;
    }
    // s7:9F7A: the search always starts on the surface (s7:A278).
    const auto place = SiteSearch(sim, c, *site, *grid).run(0);
    if (!place) return false;
    Building* put = sim.putBuildingAt(c.owner, place->pos, place->piece ? place->piece : type, c.self);
    if (!put) return false;
    b.tile = put->owner;                  // the builder waits for this piece
    // s7:A044 (s7:A012, s7:A369): below the surface the ground around
    // the new piece softens, as after digging.
    if (place->pos.level > 0) soften(sim, c.owner, c.self, place->pos);
    return place->piece == 0;             // a piece of preparation: try again later
}

class AiInputStep final : public Step {
public:
    std::string_view name() const override { return "SCAiInput"; }
    uint16_t priority() const override { return stepcode::AiInput - 1; }
    void calcMe(Simulation& sim) override {
        // s2:B820: the managers only work once player 1 has "Multiple AI(5)".
        // IMPROVISED (guard): the EXE reads player 1 without checking it.
        const Player* p1 = sim.db().get<Player>(kPlayer1);
        if (!p1 || p1->discoveries[kMultipleAi] == 0) return;
        const bool noProblems = p1->discoveries[kNoAiProblems] != 0;
        const auto& table = sim.data().aiEmphasis;
        for (AiManager& m : sim.aiManagers()) {
            if (!m.active) continue;
            Colony* c = sim.db().get<Colony>(m.colony);
            if (!c || m.emphasis >= table.size()) continue;   // IMPROVISED (guard)
            if (!builderIdle(sim, *c)) continue;             // s8:354A
            const auto& row = table[m.emphasis];
            const uint16_t offset = noProblems ? row.offsetA : row.offsetB;
            const int length = noProblems ? row.lengthA : row.lengthB;
            // Read straight from DGROUP: a step past this sequence's end
            // (after "No AI Problems" switches to the shorter A list) reads
            // the next words, as the EXE does (quirk Q40).
            const uint16_t group = sim.data().dgroupWord(offset + 2u * m.step);
            if (!aiBuild(sim, *c, group)) continue;
            if (static_cast<int16_t>(++m.step) >= length) m.step = 0;
        }
    }
};

// s8:4918: in colony 1, explorers reveal the site's next hidden mine site
// every 30 turns with one explorer, 2 turns sooner per extra explorer (12
// with 10). A DisMine is put there unless a building other than terrain
// (types 1..9) stands on it.
void revealMineSite(Simulation& sim, Colony& c) {
    auto& sites = sim.hiddenDeposits();
    size_t& next = sim.nextHiddenDeposit();
    Site* site = sim.db().get<Site>(c.owner);
    const bool fromSite = site && site->hiddenMines != 0;   // a generated site's record
    if (!fromSite && next >= sites.size()) return;
    const int interval = c.explorers >= 1 && c.explorers <= 10 ? 32 - 2 * c.explorers : 0;
    if (interval == 0 || sim.turn() % static_cast<uint32_t>(interval) != 0) return;
    MapPos p;
    if (fromSite) {
        // s8:4A21: one hidden mine site becomes visible: rec+0x16[visible - 1].
        --site->hiddenMines;
        ++site->visibleMines;
        const Pos3& q = site->mineSites[site->visibleMines - 1u];
        p = {q.x, q.y, q.z};
    } else {
        p = sites[next++];
    }
    Tile* t = sim.tileAt(Simulation::gridOf(c), p.x, p.y, p.level);
    if (t) {
        const Building* b = sim.db().get<Building>(t->building);
        if (b && (b->type < 1 || b->type > 9)) return;
    }
    // SCInternalPutBldg on the colony's site (colony +0x08): a new tile when
    // the cell has none (s6:8920; its work is done when it is queued).
    if (c.owner && sim.putBuildingAt(c.owner, {p.x, p.y, p.level}, kDisMine, c.self)) return;
    // IMPROVISED (guard): a colony without a site has no map; the tile is
    // made directly.
    if (!t) t = &sim.createTile(c, p.x, p.y, p.level);
    sim.putBuilding(*t, kDisMine);
}

class RoboMoveStep final : public Step {
public:
    std::string_view name() const override { return "SCRoboMove"; }
    uint16_t priority() const override { return stepcode::RoboMove - 1; }
    void calcMe(Simulation& sim) override {
        if (Colony* c1 = sim.db().get<Colony>(kColony1)) revealMineSite(sim, *c1);
        moveTrips(sim);                                       // s8:7A76
    }
};

} // namespace

std::unique_ptr<Step> makeAiInputStep() { return std::make_unique<AiInputStep>(); }
std::unique_ptr<Step> makeRoboMoveStep() { return std::make_unique<RoboMoveStep>(); }

} // namespace outpost::sim
