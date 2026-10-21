#pragma once

#include "data/building_data.hpp"
#include "sim/ledger.hpp"
#include "sim/object_db.hpp"

#include <array>
#include <cstdint>
#include <string>
#include <vector>

namespace outpost::sim {

// Colony population (class at s7:314C, vtable s7:3AF2) as age cohorts:
// long cohort[91] (ages 0..90) at pop+4. Age groups (s7:3948):
// 1: 0-3, 2: 4..schoolLeavingAge, 3: schoolLeavingAge+1..39, 4: 40-75,
// 5: 76-90, anything else: 0-90.
struct Population {
    std::array<int32_t, 91> cohort{};   // +0x004
    int32_t extra170{0};                // +0x170, added to the People total (meaning TBD)
    // Per age group 1..5 (index 0 unused). A death roll for group g happens
    // with deathChance[g] percent per turn and kills deathRate[g] percent of
    // the group, with the division remainder carried in deathCarry[g].
    std::array<int16_t, 6> deathRate{};   // +0x174
    std::array<int16_t, 6> deathChance{}; // +0x180
    std::array<int32_t, 6> deathCarry{};  // +0x18C
    uint32_t owner{0};                    // +0x1A4 (ctor argument; meaning TBD)
    int16_t birthDivisor{5};              // +0x1A8: yearly births = (group 3 + group 4) / this
    int32_t lifeSupportDeaths{0};         // +0x1AA: doubles every turn without life support
    uint16_t schoolLeavingAge{16};        // +0x1AE, upper age of group 2

    // Population::Population (s7:314C): everything zero except the fields
    // above; then the death tables for the difficulty (DGROUP 0x13AE,
    // 1 Beginner .. 4 Hard): Easy and up get rates {1,2,2,1,6}% at 100%
    // chance, Beginner (and an unset 0) gets the s7:34DA tables.
    void reset(int difficulty);
    // s7:34DA: rates {1,1,1,1,4}%, chances {50,10,10,10,75}%; clears the carries.
    void setGentleDeathTables();

    int32_t total() const;                       // s7:38B8, sum of all cohorts
    int32_t group(int g) const;                  // s7:38F2
    static void groupRange(int g, int sla, int& lo, int& hi);  // s7:3948
    void ageOneYear();                           // s7:387C: shift up, age 90 is lost
    void setNewborns(int32_t n) { cohort[0] = n; }   // s7:3534
    void addNewborns(int32_t n) { cohort[0] += n; }  // s7:3548
    // s7:375A: remove `amount` people. Group 0 takes them oldest first;
    // groups 1..5 spread them evenly over the group's ages, the remainder
    // one each from the youngest, clamping each cohort at 0 (the excess is
    // not taken elsewhere). Always clears every deathCarry.
    void kill(int g, int32_t amount);
    // s7:3A3A: take up to `amount` people of one age; lowers `amount` and
    // returns how many were taken.
    int32_t takeFromAge(int age, int32_t& amount);
    // s7:3694 for groups 1..5 (s7:39DC): up to `amount` people leave the
    // group, oldest age first; returns them as a cohort array. The death
    // carries are cleared.
    std::array<int32_t, 91> leaveFromGroup(int g, int32_t amount);
    // s7:355C: add a cohort array (people arriving from another colony).
    void addCohorts(const std::array<int32_t, 91>& people);
    // s7:326A: no life support this turn. lifeSupportDeaths becomes 1, then
    // doubles each turn (capped at the population); that many die, oldest
    // first. Returns the number.
    int32_t lifeSupportFailure();
    // s5:CF6C: colonists arriving from a lander, split over ages
    // 19/29/39/49/59 (the remainder of n/5 goes to age 19).
    void addColonists(int16_t n);
};

// Building owner object (DB type 5, inferred). Holds the per-building
// resource ledgers that the colony totals are summed from.
class Tile : public DbObject {
public:
    // Position (+0x0C..+0x10): level 0 is the surface, 1..4 underground.
    int16_t x{0}, y{0}, level{0};
    // +0x12: set with +0x14 by the tile ctor (s7:684C); 1 on the surface and
    // 7 underground in TUTOR.OPS (meaning TBD).
    int16_t mark12{0};
    // +0x14 (meaning TBD): SCInternalPutBldg sets 5, or 6 underground
    // (s6:8B37); landers and the Seed set 1 when reserving (s6:09B8).
    int16_t mark14{0};
    Handle building;                    // +0x16 (resolved lazily at +0x1A, s7:73A8)
    // +0x1E: the units on this tile (robots, trucks; DB type 6, units.hpp).
    // Removed units leave an empty slot (s7:6E9C).
    std::vector<Handle> linked;
    Ledger bas;                         // +0x22 quantities produced/stored here
    Ledger alloc;                       // +0x26 allocations/demands
    Handle colony;                      // +0x2E (a colony pointer in the EXE)
    int16_t field32{0};                 // +0x32 (saves from version 2; TBD)
    // +0x34: trucks put here (s7:7C50 adds kind-4 units to it, s7:6E9C does
    // not take them off). Manual truck routes (s8:1C3E) read it.
    int16_t trucks{0};
    std::vector<Handle> route;          // +0x36 the truck route's tiles (s8:1C3E)
    std::vector<ProductItem> list3A;    // +0x3A, +0x3E item lists (TBD)
    std::vector<ProductItem> list3E;
};

// Per-player research state (DB type 8, ctor s7:2112).
class Player : public DbObject {
public:
    Player();
    std::vector<Handle> children;                    // +0x0C (named object, s7:1978)
    // +0x010: points left per topic: -1 not started (the lab fills in the
    // cost), 0 complete (s7:25B2).
    std::array<int16_t, 131> remaining{};
    // +0x116: how often each discovery (1..66) was made (s7:25F0).
    std::array<int16_t, 67> discoveries{};
    // +0x19C: up to 5 priority topics; with discovery 30 (Multiple AI) they
    // get +1 point per lab turn.
    std::array<uint16_t, 5> priority{};
    // +0x1A6: lab turns a topic still needs at least (25 to start with).
    std::array<int16_t, 131> minTurns{};
    // +0x2AC: topic worked on this turn (cleared by SCSetup, s7:2690).
    std::array<uint16_t, 131> workedThisTurn{};

    bool researchDone(int id) const {
        return id >= 0 && id < static_cast<int>(remaining.size()) && remaining[static_cast<size_t>(id)] == 0;
    }
    // s7:2242: points or turns left, whichever is more; -1 if not started.
    int16_t progress(int id) const;
    int priorityIndex(uint16_t topic) const;        // s7:28DC, -1 if absent
    bool addPriority(uint16_t topic);                // s7:2622
    void newTurn() { workedThisTurn.fill(0); }       // s7:2690
};

// The colony's tile list (+0x0C; class s5:C444 over the pointer array
// s7:1CD8). Entries are (tile, key), the key being the tile's building
// priority (GameData::tilePriority). Colony loops visit the tiles in key
// order: the list is re-sorted with the runtime's qsort (s1:4AEA, not
// stable) whenever it was changed by add. Slots start empty (key 0) and
// the list grows by 100; tiles are never taken out.
class TileList {
public:
    struct Entry {
        Handle tile;
        uint16_t key{0};
    };
    explicit TileList(uint32_t initial = 200, uint32_t growth = 100)
        : m_initial(initial), m_growth(growth) {}

    // s5:C5B4: the first empty slot (after sorting) takes the tile, and the
    // list is marked for sorting. No duplicate check here (the colony's
    // own add, s8:5860, checks first).
    void add(Handle tile, uint16_t key);
    // s5:C644 (loading a save): append at the fill position, as saved.
    void append(Handle tile, uint16_t key);
    // s5:C4F4 (Tile::setBuilding): the tile's first entry takes a new key;
    // the list is not marked, so it stays where it is until the next add.
    void setKey(Handle tile, uint16_t key);
    // s5:C6A4 (end of loading): sort now.
    void sortNow() const { sortIfMarked(true); }
    bool contains(Handle tile) const;
    // s7:18F0 (the colony's slot 6): every entry holding the tile is set to
    // no tile (slot 2 of the list with 0); the slots stay. (How the list's
    // own slot 2 treats the key and the fill count is not decoded; both
    // are left.)
    void blank(Handle tile);

    // The tiles in visiting order (s5:C54A at(i) over the whole array),
    // empty slots left out, duplicates kept.
    std::vector<Handle> order() const;
    const std::vector<Entry>& entries() const { sortIfMarked(false); return m_entries; }
    bool empty() const;
    uint32_t used() const { return m_used; }

private:
    void grow();                                      // s5:C73A
    void sortIfMarked(bool force) const;
    mutable std::vector<Entry> m_entries;             // +0x18 (size +0x10)
    uint32_t m_used{0};                               // +0x08
    mutable bool m_marked{false};                     // +0x1C
    uint32_t m_initial, m_growth;                     // +0x0C, +0x14
};

// Colony (DB type 4).
class Colony : public DbObject {
public:
    TileList tiles;                                  // +0x0C
    // Initial values from the colony ctor (s8:30AA).
    int16_t morale{600};                             // +0x18, 0..1000 (SCForceMorale sets it)
    int16_t prevMorale{600};                         // +0x1A, last turn's morale (s8:4D0E)
    uint16_t defectionTier{0};                       // +0x1C, 1..8 leaving, 9..16 joining (s8:0340/05D8)
    int32_t defectionAmount{0};                      // +0x1E, people per defection in that tier
    int16_t crime{0};                                // +0x22, 0..100 (s8:4760; inferred: crime)
    int16_t education{50};                           // +0x24, 0..100 (s8:45E4; inferred: education)

    // s8:4D0E
    void setMorale(int16_t m) { prevMorale = morale; morale = m; }
    std::array<int32_t, data::res::Count> total{};   // +0x26 sum of tile ledgers
    std::array<int32_t, data::res::Count> alloc{};   // +0xBA allocated this turn
    // +0x14E: the colony's units per kind (product A id), counted from the
    // tiles by Colony_sumTileLedgers; +0x1A2: units busy (s8:53BA; writers
    // TBD).
    std::array<int32_t, 21> linkedCount{};
    std::array<int32_t, 21> linkedBusy{};
    // +0x1FE: SCPop and SCMorale skip the colony until this is set. Set
    // when colonists land (s5:CF6C) and by CommandCenter::power when
    // 0 < life < 25 (s7:C1A7).
    bool populated{false};
    Population population;                           // object at +0x1F6
    Handle player{0x08000001u};                      // +0x200, player 1 by default (ctor s8:3288)
    // +0x204: set when a Nano building is (or becomes) operational (slots
    // 10/14, s6:2700/s6:272E). Allocation then grants only Power and
    // People; with research 130 (Food Production) the colony eats nothing,
    // with 128 (Medical) the death rolls stop.
    bool nanotech{false};
    // +0x206: set by the Fill Resources cheat (SCFillResources s6:83E1):
    // no allocation, and construction and operation cost nothing.
    bool freeResources{false};
    Handle hub;                                      // +0x10, comm-tower range origin (TBD)
    // +0x20A/+0x20C: set from residence crowding by SCPop (s6:A28A) and
    // read by SCMorale (s7:EEBB) and s8:6068 (TBD).
    int16_t crowdingMorale{0};
    int16_t crowdingFlag{0};
    int16_t messageArg208{1};                        // +0x208, passed with every log message (TBD)
    // +0x20E: explorers (product 5) from RoboCmd kits, at most 10 (s8:48E0);
    // disaster 7 loses one (s8:4900).
    int16_t explorers{0};
    // +0x210: the tiles of the colony's operational RoboCmds (group 30),
    // rebuilt by SCEndSim every turn (s8:3BA0; the original keeps a 1-based
    // array of max(n, 5) + 1 slots).
    std::vector<Handle> roboCommands;
    // +0x21A: the AI manager's builder for this colony (s7:9ECC, created on
    // first use): the tile of the building it is putting up (+0) and its
    // type (+8).
    struct AiBuilder {
        Handle tile;
        uint16_t type{0};
    };
    AiBuilder aiBuilder;
    // Plague (s8:362E / s8:3698): turns left and people treated so far.
    int16_t plagueTurns{0};                          // +0x214
    int32_t plagueTreated{0};                        // +0x216
    std::string name;                                // the colony's name (save chunk 0x0F)

    // Colony_available (s8:540A): total - alloc, or 0 when fully allocated
    // (the original compares unsigned).
    int32_t available(int res) const;
    // Colony_alloc (s8:5770).
    void allocate(int32_t value, int res) { alloc[static_cast<size_t>(res)] += value; }
    // Colony_addTotal (s8:5694).
    void addTotal(int32_t value, int res) { total[static_cast<size_t>(res)] += value; }
};

// A map or star-map position (3 words; s2:7B4C / s2:7BC8).
struct Pos3 {
    int16_t x{0}, y{0}, z{0};
    bool operator==(const Pos3&) const = default;
};

// Star, planet and site (DB types 1-3): named objects (s7:1978) with a
// list of children at +0x0C. Only what a save holds is kept; the star map
// and planet/site generation are not decoded yet.
class Star : public DbObject {
public:
    std::vector<Handle> children;                    // +0x0C planets (slots, 0 = empty)
    std::string name;
    Pos3 pos;                                        // +0x04, star-map position
    std::vector<uint16_t> planetIds;                 // +0x0A count, then the ids
};

class Planet : public DbObject {
public:
    std::vector<Handle> children;                    // +0x0C sites
    // The record at +0x10 (0x28 bytes).
    uint16_t nameId{0};                              // rec+0x00, the planet template (1..10, s6:ECAC); also the terrain set (s3:82F8)
    std::string name;                                // rec+0x02
    Pos3 pos;                                        // rec+0x06
    int16_t hostility{0};                            // rec+0x0C (SCMorale's penalty)
    int32_t rec0E{0};                                // rec+0x0E (TBD; 4400 in TUTOR.OPS)
    std::array<int16_t, 8> traits{};                 // rec+0x12 (TBD)
    std::vector<uint16_t> siteIds;                   // rec+0x22 count, rec+0x24
    int16_t field14{0};                              // +0x14 (12 in TUTOR.OPS: its site count)
    uint16_t atmosphere{0};                          // +0x16 (s7:2A2C)
    int16_t terraformTurns{10000};                   // +0x18
    uint16_t field1A{0};                             // +0x1A
};

class Site : public DbObject {
public:
    std::vector<Handle> children;
    // The record at +0x10 (0x20 bytes).
    uint16_t rec00{0}, rec02{0};
    std::string name;                                // rec+0x04
    // rec+0x16: the mine sites, rec+0x1A of them revealed (s8:4918), rec+0x1C
    // still hidden. A save keeps only the revealed ones.
    std::vector<Pos3> mineSites;
    // rec+0x1A / rec+0x1C as generated (s7:4782): the first `visibleMines`
    // positions are DisMines from the start (s7:8D08), the next
    // `hiddenMines` are revealed by explorers (s8:4918). Both 0 for a site
    // read from a save, whose list holds only the revealed ones.
    uint16_t visibleMines{0}, hiddenMines{0};
    Pos3 mapSize;                                    // +0x14 (300, 150, 1 in TUTOR.OPS)
    uint16_t depth{0};                               // +0x1C underground levels (s7:5B1C)
};

// The rebel colony's player handle; SCSetup skips colonies owned by it.
inline constexpr Handle kRebelPlayer = Handle::make(ObjType::Player, 2);

} // namespace outpost::sim
