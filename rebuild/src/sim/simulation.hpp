#pragma once

#include "data/building_data.hpp"
#include "data/building_groups.hpp"
#include "sim/rebels.hpp"
#include "data/ne_image.hpp"
#include "data/research_tree.hpp"
#include "data/site_maps.hpp"
#include "data/terrain_gen.hpp"
#include "data/star_table.hpp"
#include "data/string_table.hpp"
#include "sim/map.hpp"
#include "sim/object_db.hpp"
#include "sim/breakdowns_improved.hpp"
#include "sim/rebel_ai_improved.hpp"
#include "sim/step_queue.hpp"
#include "sim/vehicles.hpp"

#include <array>
#include <optional>
#include <cstdint>
#include <initializer_list>
#include <map>
#include <tuple>
#include <utility>
#include <memory>
#include <set>
#include <string>
#include <string_view>
#include <vector>

namespace outpost::data { class GameFiles; }

namespace outpost::sim {

class Building;
class Colony;
class Player;
class Planet;
class Site;
class Tile;

// Everything the simulation reads from the original files.
struct GameData {
    data::NeImage exe;
    data::StringTable strings;
    std::vector<data::BldgBldRecord> bldgBld;
    std::vector<data::BldgOpsRecord> bldgOps;
    data::ResearchTree research;
    data::StarTable stars;
    data::BuildingGroups groups;
    std::array<int16_t, 10> mineOreMix{};   // DGROUP 0x4FBE, ores 4..13
    // A new Command center's starting resources per resource id 17..36
    // (s7:C3F6: the table behind the far pointer at DGROUP 0x580E).
    std::array<int16_t, 37> commandKit{};
    // DGROUP 0x4EA4: each building type's place in the colony's tile order
    // (Nano 1, power plants 2, ... terrain, mines and robots 35).
    std::array<uint16_t, 138> tilePriority{};
    uint16_t priorityOf(uint16_t type) const {
        return type < tilePriority.size() ? tilePriority[type] : uint16_t{0};
    }
    // AI manager building emphases (DGROUP 0x58BE, 12-byte rows; names:
    // strings 1752 + row, "Agricultural Center" .. "Shopping Mall"). Each
    // row points at two word sequences of building groups: A (used with
    // discovery 31 "No AI Problems") and B. Only the DGROUP offsets are
    // kept: the EXE reads past a sequence's end when the step index is
    // beyond it, so the words are read from DGROUP itself (dgroupWord).
    struct AiEmphasis { uint16_t offsetA{0}, lengthA{0}, offsetB{0}, lengthB{0}; };
    std::array<AiEmphasis, 15> aiEmphasis{};
    // The rebels' answers per building type (s5:B0AA), one table per
    // difficulty: DGROUP 0x44B4 (Beginner, Easy), 0x47F0 (Medium), 0x4B2C
    // (Hard); 6-byte rows {far ptr to a word list, count}. Count 0: no
    // answer; -1: the same type. Only the list's offset is kept.
    struct RebelRow { int16_t count{0}; uint16_t list{0}; };
    std::array<std::array<RebelRow, 138>, 3> rebelResponses{};
    // The alert switches 1..10 (DGROUP 0xE28, the first word of each 8-byte
    // row; the save stores exactly these ten, s3:0BF5). Their starting
    // values as in the EXE; code run for a new game may change them (not
    // traced).
    std::array<uint16_t, 10> alertFlags{};
    // The bitmap catalog (segment 10), the 70 sites (s7:3B28) and each
    // site's terrain map (the catalog file of its terrainId, "500a.bmp" ...,
    // read from the CD's BITMAPS folder; empty when it is not there).
    data::BitmapCatalog bitmaps;
    std::vector<data::SiteRow> sites;
    std::vector<data::IndexedBitmap> siteTerrain;
    const data::IndexedBitmap* terrainOfSite(uint16_t index) const {
        if (data::isGeneratedSite(index)) {                    // IMPROVED (I92): a random site
            auto it = generatedTerrain.find(index);
            if (it == generatedTerrain.end()) it = generatedTerrain.emplace(index, data::generateSiteTerrain(index)).first;
            return &it->second;
        }
        return index < siteTerrain.size() && siteTerrain[index].width > 0 ? &siteTerrain[index] : nullptr;
    }
    mutable std::map<uint16_t, data::IndexedBitmap> generatedTerrain;   // made once, by index
    uint16_t dgroupWord(size_t offset) const;

    bool load(const data::GameFiles& files, std::string* error = nullptr);
};

// The C runtime rand() of OUTPOST.EXE (MSVC, s1:4D24; srand s1:4D0C). The
// seed lives at DGROUP 0x61E8 (initially 1); the game seeds it once with
// time(NULL) at startup (s2:54CA).
class MsvcRand {
public:
    void srand(uint16_t seed) { m_seed = seed; }
    int16_t rand() {
        m_seed = m_seed * 0x343FDu + 0x269EC3u;
        return static_cast<int16_t>((m_seed >> 16) & 0x7FFF);
    }
    uint32_t state() const { return m_seed; }

private:
    uint32_t m_seed{1};
};

// An entry of the mothership's item lists: {+4 kind, +6 count}. Kinds below
// 138 are building types (62 ColonistLander, 18 SolrPwrRecvr, 19
// MShipTokamak, 129 Food, ...).
struct ShipItem {
    uint16_t kind{0};
    int16_t count{0};
};

// The mothership in orbit (registry object 8; ctor s3:95AA). Only what the
// simulation reads so far.
struct Mothership {
    // +0x0A: what the ship carries (modules and supplies). s3:9F8C counts a
    // kind: a SeedCommand gets 3 life per kind 0x82 (s7:C1F7), arrival makes
    // 50 cryo colonists per kind 0x80 (s3:9766). CargoLanders bring kinds
    // 18, 19 and 129 down (s5:CAC2).
    std::vector<ShipItem> hold;
    // +0x0E: landers and kits ready to be put down. s3:9F72 counts a kind
    // (SCPop runs the cryo countdown only while a ColonistLander, kind 62,
    // is left); s3:988C takes one off when it is placed.
    std::vector<ShipItem> deployable;
    // +0x12: cargo damaged on arrival, {kind, number lost} (s3:9FEE; cleared
    // by s3:9674 once the report has been shown).
    std::vector<ShipItem> damaged;
    bool deployableEmptied{false};   // +0x16, set by s3:988C on the last one
    bool landersMoved{false};     // +0x18, set by s3:9794 (not saved)
    bool arrived{false};          // +0x1A, set on arrival (s3:9766)
    int16_t countdown{10};        // +0x1C turns before cryo colonists die
    // +0x1E: colonists still in cryo; 50 per item 0x80 in list +0x0A on
    // arrival (s3:9766); landers take up to 50 at a time (s5:CEFC).
    int16_t cryoColonists{0};

    // s3:9FA6: the count of the first entry of `kind` (0 if none).
    static int16_t countOf(const std::vector<ShipItem>& list, uint16_t kind);
    int16_t holdCount(uint16_t kind) const { return countOf(hold, kind); }             // s3:9F8C
    int16_t deployableCount(uint16_t kind) const { return countOf(deployable, kind); } // s3:9F72
    // s3:988C: one less of the first entry of `kind`; an entry at 0 is
    // dropped, and +0x16 is set when the list runs empty.
    void removeDeployable(uint16_t kind);
    // s3:9794 (a SeedCommand is finished, s7:C652): the first time only, the
    // deployable list is replaced by a new one and the hold's
    // ColonistLanders (62) and CargoLanders (65) move into it.
    void moveLanders();
    // s3:9766 (the Seed lands): arrived, cargo damage (s3:A0A0), then 50
    // colonists in cryo per item 0x80 left in the hold.
    void arrive(int difficulty);
    // s3:A0A0: every hold entry loses count / 4 (Beginner, Easy) or count / 2
    // (Medium, Hard); kind 18 only above 2, kind 131 only above 1. Kinds 62,
    // 65 and 0x80 lose half instead and are reported in `damaged`, with 1
    // when nothing was lost (quirk Q52).
    void damageCargo(int difficulty);

    // s3:96D0: after the countdown, 1 cryo colonist dies per turn (5 after
    // turn 50, 10 after turn 60). Returns the number lost, -1 when the last
    // ones die, 0 when nothing happens.
    int16_t loseCryoColonists(uint32_t turn);
};

// The orbital objects (registry object 9, ctor s3:6326; save chunk 0x07):
// a slot {+0 carried, +2 launched} at +0x0A for each of the kinds 0x83..0x89
// (Solar Satellite, Geological Probe, Weather Satellite, Interstellar Probe,
// Communications Satellite, Orbital Observer, ULBI Probe; s3:6646). Other
// kinds have no slot: reads give 0 and writes are dropped.
struct Orbitals {
    static constexpr uint16_t kFirstKind = 0x83;
    static constexpr size_t kSlots = 7;
    std::array<int16_t, kSlots> carried{};
    std::array<int16_t, kSlots> launched{};

    static int slot(uint16_t kind) {                                  // s3:6646
        return kind >= kFirstKind && kind < kFirstKind + kSlots ? kind - kFirstKind : -1;
    }
    int16_t launchedCount(uint16_t kind) const {                       // s3:65D0
        const int s = slot(kind);
        return s < 0 ? 0 : launched[static_cast<size_t>(s)];
    }
    int16_t aboard(uint16_t kind) const {                              // s3:659A
        const int s = slot(kind);
        return s < 0 ? 0 : static_cast<int16_t>(carried[static_cast<size_t>(s)] - launched[static_cast<size_t>(s)]);
    }
    // s3:6566(this, launched, carried, kind)
    void set(uint16_t kind, int16_t carriedCount, int16_t launchedCount) {
        const int s = slot(kind);
        if (s < 0) return;
        carried[static_cast<size_t>(s)] = carriedCount;
        launched[static_cast<size_t>(s)] = launchedCount;
    }
};

// The galaxy (DGROUP 0x5166, type 0xFF; ctor s7:1A32, made by s6:EBEE): not
// in the object tables. Handle 0xFF000001 in TUTOR.OPS. Its record (+0x10,
// s7:4574) is the star list at DGROUP 0x518C; its children are the stars,
// one slot per star (a selected star leaves the others' slots at 0).
struct Galaxy {
    Handle self{0xFF000001u};
    Handle owner;
    std::vector<Handle> children;                    // +0x0C
    std::vector<uint16_t> starIds;                   // record: word n, n ids
};

// The morale crisis (registry object 0x2C, ctor s2:EB2A). SCMorale schedules
// it when colony 1's morale is at most 200; on that turn the event code
// (s6:76DA) opens a dialog, and the player's answer (1..5, s8:CC2E) is read
// back by the next SCMorale.
struct MoraleCrisis {
    uint16_t response{0};        // +0x0A
    uint32_t scheduledTurn{0};   // +0x0C, 0 = none
};

// Trade (dialogs 384 "Trade", 389 "Trade Session", 402 "Trade Counter
// Offer"). An agreement in the list of registry object 0x3B (ctor s2:DD4E,
// list at +0x0A; created by s2:E164). Trading is not modelled yet; SCEndSim
// only ages the agreements.
struct TradeAgreement {
    uint16_t state{0};       // +0x0C: 2 and 3 can lapse (s2:E9A4)
    uint32_t sinceTurn{0};   // +0x0E
    uint16_t flag12{0};      // +0x12: shortens the time before it can lapse
};

// The trade market (registry object 0x3C, ctor s4:331C). Prices are
// `base + base * swing / 100` (s4:427C); SCEndSim moves the swing along a
// cycle 0 -> +-10 -> +-20 -> +-30 -> 0 (s4:3D6C).
struct TradeMarket {
    int16_t value13C{0};     // +0x13C, random(8, 12) at creation (use TBD)
    int32_t swing{0};        // +0x142, percent
};

// The build menu (registry object 0x35, ctor s3:6700): which building
// types (+0x0A, 138 words) and factory products (+0x11E, 21 words) the
// player is offered. Research discoveries change it (s3:A69C).
struct BuildMenu {
    std::array<uint16_t, 138> offered{};
    std::array<uint16_t, 21> products{};
    uint16_t field148{0x33};   // +0x148, 0x34 after discovery 25 or 37 (use TBD)

    BuildMenu();
    void offer(uint16_t type, uint16_t on = 1);          // s3:682E
    void offerProduct(uint16_t product, uint16_t on = 1); // s3:6814
    bool isOffered(uint16_t type) const { return type < offered.size() && offered[type] != 0; }
    // s3:ABD2: in a chain of versions (e.g. AgriDome 27, 28, 29), the first
    // offered one is replaced by the next; nothing when none is offered or
    // the last is.
    void upgrade(std::initializer_list<uint16_t> chain);
};

// An AI manager (registry object 0x40, ctor s2:AF94; entries s2:B0BC in
// the list at +0x0A). The player assigns one to a colony with a building
// emphasis in the "Assign AI Managers" dialog (s8:806A, not modelled), once
// discovery 30 "Multiple AI(5)" is made.
struct AiManager {
    bool active{false};      // +0x08
    Handle colony;           // +0x0A
    uint16_t emphasis{0};    // +0x0E, row of GameData::aiEmphasis (1..14)
    uint16_t step{0};        // +0x10, position in the row's sequence
};

// A position on the site's map (6 bytes, unpacked by s2:3EB4; layout
// assumed). Sites and maps are not modelled; tiles carry the position.
struct MapPos {
    int16_t x{0}, y{0}, level{0};
};

// A message the original posts to its UI (registry objects 0x37: message
// log via s2:A0E4; 0x2B: alerts via s3:043A). Kept for the front end.
struct Notice {
    uint16_t channel{0};   // 0x37 or 0x2B
    uint16_t code{0};
    Handle colony;
    int32_t value{0};
};

class Simulation {
public:
    explicit Simulation(const GameData& data, uint32_t seed = 0);

    ObjectDb& db() { return m_db; }
    const ObjectDb& db() const { return m_db; }
    const GameData& data() const { return m_data; }

    // ── World construction ─────────────────────────────────────────────
    Player& createPlayer();
    Colony& createColony(Handle player);
    // A tile at a map position. Tiles of one grid share an owner handle
    // (the original's grid object; the colony here until maps are decoded).
    Tile& createTile(Colony& colony, int16_t x = 0, int16_t y = 0, int16_t level = 0);
    Tile* tileAt(Handle grid, int16_t x, int16_t y, int16_t level) const;
    // The grid a colony's tiles belong to: its site (the colony's owner) when
    // it has one, else the colony itself (colonies made without a site).
    static Handle gridOf(const Colony& colony);
    // Register a tile that was loaded from a save under its position.
    void indexTile(const Tile& tile);
    // The map (DGROUP [0x5740]). A site's grid is made when the first tile
    // owned by the site is indexed (the original makes it with the site,
    // s6:ED2C, or after loading it, s6:E7F3), from the site's record +0x00
    // (its row in the site table).
    Map& map() { return m_map; }
    const Map& map() const { return m_map; }
    Grid* gridOfSite(Handle site);
    // The last refusal of a placement rule (DGROUP 0x50CA: string id,
    // 0x50CC: its argument, e.g. 1718 "Out of communications range by %d
    // spaces.").
    struct PlaceMessage { uint16_t id{0}; int16_t arg{0}; };
    PlaceMessage& placeMessage() { return m_placeMessage; }
    // s6:C7B6: what a cell offers for building: its terrain number when
    // empty; for a tile with terrain on it the terrain type (1..5 as is,
    // 6 -> 7, 7 -> 8, 8 -> 9, 9 -> 6), 0 for any other building, and the
    // tile's mark (+0x14) when it has no building.
    uint16_t cellKind(Handle site, const MapCell& pos);
    // Planet::genKids (s7:3058): one site per entry of the planet's site
    // list, each made by the site creator (s6:ED2C): a record from the site
    // table (s7:4782: name "Site n" with n = ++planet +0x14, mine sites
    // drawn by the planet's hostility, the orbitals of kind 0x84 and the
    // difficulty), its grid, and DisMines on the visible mine sites
    // (s7:8D08).
    void generateSites(Planet& planet);
    // One site of the list (the body of generateSites' loop), named "Site
    // `number`" (the planet's +0x14 counter is not touched).
    Site& generateSite(Planet& planet, uint16_t index, uint16_t number);
    // IMPROVED (I110): v1.51's landing keeps only the chosen site (SCSelect,
    // s7:13F6), so a save holds one. This remakes every site of the planet's
    // list that is gone (a null or stale child), as generateSites would;
    // returns how many it made.
    int restoreSites(Planet& planet);
    // The colony's site, if it has one.
    const Site* siteOf(const Colony& colony) const;
    // s8:4D6E: the colony's tiles whose building is in `group` and
    // operational (state 5), in tile order. s8:4E78 is the same without the
    // state test (operationalOnly = false).
    std::vector<Tile*> colonyTilesInGroup(const Colony& colony, int group,
                                          bool operationalOnly = true) const;
    // s7:BD74: |dx| + |dy| between two tiles of one grid, -1 across grids.
    static int tileDistance(const Tile& a, const Tile& b);
    // SCInternalPutBldg (s6:87F0/s6:8920), the part that applies to an
    // existing tile: the tile is marked (+0x14 = 5, or 6 underground; not
    // for terrain, group 49), the old building is handed to SCKillBldg, a
    // new one of `type` starts construction (slot 8) and reserves (slot 6,
    // arg 1). The map-side work (new tiles, colonies for seeds and Command
    // centers) is not modelled.
    // keepMark: the step's +0x11C flag (robots finishing their work).
    Building& putBuilding(Tile& tile, uint16_t type, bool keepMark = false, uint16_t reserveArg = 1);
    // SCInternalPutBldg (s6:8920) on a site's map: the tile on the cell, or
    // a new one (s6:EE54: owned by the site, +0x12 and +0x14 = the cell's
    // terrain) put on the grid. A Seed (10) or Command (55) on a new tile
    // also makes a new colony owned by the site (s6:EDC4 -> s8:3222) whose
    // hub is the cell (the new tile), for `player` if given; a Command keeps
    // the colony it was placed for as its parent (building +0x20). The tile
    // joins the colony (s8:5860), is linked to it (s7:73EE), and the rest is
    // putBuilding's. Returns nullptr when the site has no grid.
    Building* putBuildingAt(Handle site, MapCell pos, uint16_t type, Handle colony,
                            Handle player = Handle{}, uint16_t reserveArg = 1);
    // SCPutBldg (ctor s6:933C, work in shouldRun s6:93D4): the player puts a
    // building down. The message is cleared, the new building is asked
    // (slot 7, Building::canPlace); refused, it is dropped and 1709 is
    // reported unless a rule left its own message (placeMessage()). Allowed,
    // it goes down as in SCInternalPutBldg (s6:9624) with the reserve's arg
    // 0 (the player's own placement), and a RoboMine joins the colony also
    // on an existing tile. Returns the building or nullptr.
    // `digDirection` stands for the RoboDigger's Select Dig Direction dialog
    // (4024, s5:DE32 / s8:C95E): 4012..4016 give 1..5 (down, y-1, y+1,
    // x+1, x-1), 4046 gives 6 (fill in; the robot is lost), Cancel 0
    // (refused with 1714). It is set on the candidate before slot 7.
    // `dozeConfirmed` is the answer to the RoboDozer's question (s9:8520,
    // 1403/1512): false refuses a doze of a building with message 1512.
    Building* playerPutBuilding(Handle site, MapCell pos, uint16_t type, Handle colony,
                                uint16_t digDirection = 0, bool dozeConfirmed = true);
    bool dozeConfirmed() const { return m_dozeConfirmed; }
    // Db::createBuilding (s7:10B0): factory + link into the tile.
    Building& createBuilding(Tile& tile, uint16_t type);

    const Player* playerOf(const Colony* colony) const;   // colony+0x200

    // The orbital objects (registry 9). orbitalCount is the number launched
    // (s3:65D0; e.g. 131 = Solar Satellite); setOrbitalCount sets it.
    Orbitals& orbitals() { return m_orbitals; }
    const Orbitals& orbitals() const { return m_orbitals; }
    int orbitalCount(uint16_t kind) const { return m_orbitals.launchedCount(kind); }
    void setOrbitalCount(uint16_t kind, int count) {
        const int s = Orbitals::slot(kind);
        if (s >= 0) m_orbitals.launched[static_cast<size_t>(s)] = static_cast<int16_t>(count);
    }
    // s3:6604: one more of `kind` launched (no check against the number
    // carried); the views are told (s3:1F62, UI).
    void launchOrbital(uint16_t kind);

    // ── Turns ──────────────────────────────────────────────────────────
    // Sim::runTurns (s7:83BA): for each turn, queue the per-turn steps
    // (s6:D2B0) and drain the queue (s6:D01A).
    void runTurns(uint32_t count);
    uint32_t turn() const { return m_turn; }
    void setTurn(uint32_t turn) { m_turn = turn; }     // loading a save (chunk 0x0A)

    // Sim::enqueue (s7:835A): queue a step (player commands, sub-steps).
    void enqueue(std::unique_ptr<Step> step);
    // Sim::schedule (s7:8372 -> s6:D52C): run a step on a later turn. Its
    // shouldRun is asked now; it then waits in a list kept in descending
    // turn order (KeyedList::insertDescending, new entries in front of equal
    // turns). Every caller in the EXE schedules for the next turn.
    void schedule(uint32_t turn, std::unique_ptr<Step> step);
    // s6:D6B2, at the end of Sim::enqueueTurnSteps: while the list's head
    // (its latest turn) is due, move it into the step queue without asking
    // shouldRun again (StepQueue::insertClone s6:D742).
    void releaseScheduled();
    size_t scheduledCount() const { return m_scheduled.size(); }

    // Names of the steps run in the last turn, in order.
    const std::vector<std::string_view>& lastTurnSteps() const { return m_lastSteps; }
    void noteStepRun(std::string_view name) { m_lastSteps.push_back(name); }

    // Original random numbers: rand() (s1:4D24) and random(lo, hi)
    // (s2:612E), which maps rand() onto lo..hi in equal steps of
    // 0x7FFF / (hi - lo + 1), giving hi for the top remainder.
    MsvcRand& rand() { return m_rand; }
    int16_t random(int16_t lo, int16_t hi);

    // Game options (registry object 2, IniAccess s3:5404). +0x82: automatic
    // trucking (on by default) lets SCMove truck ore from mines to
    // smelters.
    bool autoTrucking() const { return m_autoTrucking; }
    void setAutoTrucking(bool on) { m_autoTrucking = on; }

    // DGROUP 0x5812: set when the first RoboCmd is completed; that one takes
    // over the robots on the colony hub (s7:CAC2).
    bool firstRoboCmdDone() const { return m_firstRoboCmd; }
    void setFirstRoboCmdDone() { m_firstRoboCmd = true; }
    // DGROUP 0x4FBC: set when the first surface mine is finished; that one
    // gets a truck even without automatic trucking (s6:0FA4). Saved by every
    // mine (s6:1452).
    bool firstMineDone() const { return m_firstMine; }
    void setFirstMineDone(bool on) { m_firstMine = on; }

    // Difficulty (DGROUP 0x13AE): 1 Beginner, 2 Easy, 3 Medium, 4 Hard
    // (dialog s8:AA33..AA9F); 0 until chosen. New colonies use it.
    int difficulty() const { return m_difficulty; }
    void setDifficulty(int d) { m_difficulty = d; }

    Mothership& mothership() { return m_ship; }
    RebelAi& rebelAi() { return m_rebelAi; }
    // The vehicle manager's trips (DGROUP 0x5A64 list +0; vehicles.hpp).
    std::vector<std::unique_ptr<Trip>>& trips() { return m_trips; }
    std::vector<std::unique_ptr<Train>>& trains() { return m_trains; }   // list +4
    Galaxy& galaxy() { return m_galaxy; }                     // DGROUP 0x5166
    MoraleCrisis& moraleCrisis() { return m_crisis; }

    // The disaster calendar (registry 0x2F, +0x34[1..8]): the turn each of
    // the 8 scheduled disasters strikes on Medium/Hard (SCEvent s6:78B8).
    // Drawn by the view's ctor (s3:E9E4; fillDisasterCalendar in
    // new_game.hpp, called by a new game and by loading). IMPROVISED (I8):
    // "never" until then.
    std::array<uint32_t, 9>& disasterSchedule() { return m_disasterSchedule; }
    static constexpr uint32_t kNever = 0xFFFFFFFFu;

    // Word +0x0C of the current planet's record (registry 0x2F -> planet ->
    // +0x10 -> +0x0C; 1 for Sigma Draconis 4 in TUTOR.OPS). SCMorale treats
    // it as a morale penalty (the manual's "hostility level", inferred).
    // Planets are not modelled yet; set by tests.
    int16_t planetHostility() const { return m_planetHostility; }
    void setPlanetHostility(int16_t v) { m_planetHostility = v; }

    // The current planet's terraforming (planet object +0x16..+0x1A).
    // Planets are not modelled yet; this is the current planet's part.
    struct Terraforming {
        int16_t turnsLeft{10000};   // +0x18 "Turns Required to Terraform"
        uint16_t atmosphere{0};     // +0x16: 1 while terraforming, 2 when done
                                    // ("Atmosphere Status", dialog 343)
        uint16_t field1A{0};        // +0x1A: 2 while terraforming, 1 when done
    };
    Terraforming& terraforming() { return m_terraforming; }
    // s7:2A2C: one turn of terraforming (an operational TerraForm facility
    // with its atmospheric generation system on). At 0 the atmosphere is
    // done and log 0x21 is posted, again on every later call (quirk Q44).
    void terraformTick();

    // Trade (registry 0x3B / 0x3C). Both are created on first use, as the
    // original's registry does (s3:20BA); creating the market draws
    // random(8, 12) (s4:331C).
    std::vector<TradeAgreement>& tradeAgreements() { return m_tradeAgreements; }
    // IMPROVED (I99): the rebels' mood and standing offer (not saved).
    // IMPROVED (I108): broken buildings (sim/breakdowns_improved).
    BreakdownState& breakdowns() { return m_breakdowns; }
    const BreakdownState& breakdowns() const { return m_breakdowns; }
    RebelRelations& rebelRelations() { return m_rebelRelations; }
    const RebelRelations& rebelRelations() const { return m_rebelRelations; }
    TradeMarket& tradeMarket();
    bool tradeMarketCreated() const { return m_marketCreated; }

    // DGROUP 0x4FE8: set by SCEndSim when player 1 has no colony left (the
    // UI reads it, s2:06E3 / s2:0D5A / s3:08ED).
    bool gameLost() const { return m_gameLost; }
    void setGameLost() { m_gameLost = true; }
    // s3:089E(alerts, on, id): switches alert 1..10 on or off (table DGROUP
    // 0xE28, 8 bytes per alert; every caller passes an id of 1..10).
    void setAlert(uint16_t id, bool on) {
        if (id >= 1 && id <= m_alerts.size()) m_alerts[id - 1u] = on ? 1 : 0;
    }
    void disableAlert(uint16_t id) { setAlert(id, false); }
    bool alertOn(uint16_t id) const { return id >= 1 && id <= m_alerts.size() && m_alerts[id - 1u] != 0; }
    bool alertDisabled(uint16_t id) const { return !alertOn(id); }

    BuildMenu& buildMenu() { return m_buildMenu; }
    const BuildMenu& buildMenu() const { return m_buildMenu; }

    // AI managers (registry 0x40): five, "AI Name #1" .. "#5", made by
    // discovery 30 (s2:B69C). Assigned by the player (UI not modelled).
    std::vector<AiManager>& aiManagers() { return m_aiManagers; }

    // The site's hidden mine sites (site object +0x10: positions at +0x16,
    // next index +0x1A, count left +0x1C). Explorers reveal them one at a
    // time (SCRoboMove, s8:4918). Filled when the site is set up (not
    // decoded); set by tests.
    std::vector<MapPos>& hiddenDeposits() { return m_hiddenDeposits; }
    size_t& nextHiddenDeposit() { return m_nextHiddenDeposit; }

    void post(Notice n) { m_notices.push_back(n); }
    const std::vector<Notice>& notices() const { return m_notices; }
    void clearNotices() { m_notices.clear(); }

private:
    const GameData& m_data;
    ObjectDb m_db;
    StepQueue m_queue;
    std::vector<std::pair<uint32_t, std::unique_ptr<Step>>> m_scheduled;
    bool m_autoTrucking{true};
    bool m_firstRoboCmd{false};
    bool m_firstMine{false};
    Orbitals m_orbitals;
    std::map<std::tuple<uint32_t, int16_t, int16_t, int16_t>, Handle> m_tileIndex;
    Map m_map;
    PlaceMessage m_placeMessage;
    Handle m_pendingParent;
    // A robot's direction (+0x24) chosen on SCPutBldg's candidate (slot 7),
    // which is the object the original puts down.
    std::optional<uint16_t> m_pendingDirection;
    bool m_dozeConfirmed{true};       // playerPutBuilding's answer for s9:8520      // a Command's parent for the next putBuilding (SCPutBldg)
    std::vector<std::string_view> m_lastSteps;
    uint32_t m_turn{0};
    MsvcRand m_rand;
    int m_difficulty{0};
    Mothership m_ship;
    RebelAi m_rebelAi;
    std::vector<std::unique_ptr<Trip>> m_trips;
    std::vector<std::unique_ptr<Train>> m_trains;
    Galaxy m_galaxy;
    MoraleCrisis m_crisis;
    std::array<uint32_t, 9> m_disasterSchedule{kNever, kNever, kNever, kNever, kNever,
                                               kNever, kNever, kNever, kNever};
    int16_t m_planetHostility{0};
    Terraforming m_terraforming;
    std::vector<TradeAgreement> m_tradeAgreements;
    RebelRelations m_rebelRelations;
    BreakdownState m_breakdowns;
    TradeMarket m_market;
    bool m_marketCreated{false};
    bool m_gameLost{false};
    std::array<uint16_t, 10> m_alerts{};
    BuildMenu m_buildMenu;
    std::vector<AiManager> m_aiManagers;
    std::vector<MapPos> m_hiddenDeposits;
    size_t m_nextHiddenDeposit{0};
    std::vector<Notice> m_notices;
};

} // namespace outpost::sim
