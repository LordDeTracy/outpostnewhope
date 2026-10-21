#pragma once

#include "data/building_data.hpp"
#include "sim/ledger.hpp"
#include "sim/map.hpp"
#include "sim/vehicles.hpp"
#include "sim/object_db.hpp"

#include <array>
#include <cstdint>
#include <memory>
#include <vector>

namespace outpost::sim {

class Simulation;
class Tile;
class Colony;

// The original C++ class each building type is constructed as
// (Building::create, s7:07AC). Comments give the constructor address.
enum class BuildingClass : uint8_t {
    Generic,         // s6:B39E  base class: LMonoTrain, RMonoTrain, *Const, UGTrade
    Terrain,         // s6:48C0  types 1-9
    Seed,            // s6:2BFE
    CommandCenter,   // s7:C09C  SeedCommand, Command
    SeedSmelter,     // s6:3692
    SeedPower,       // s6:3580
    SeedFact,        // s6:34A6
    SpacePort,       // s6:408E
    Mine,            // s6:0C50  DisMine, ActiveMine(2), UGMine(2)
    MassDrv,         // s6:0B64
    SolrPwrRecvr,    // s6:4376
    Tokamak,         // s6:4BA6  MShipTokamak, Tokamak(2), UGTokamak(2)
    Monorail,        // s6:1BE8
    AgriDome,        // s7:BE56
    Factory,         // s6:00CC
    Trade,           // s6:50FA
    Spew,            // s6:3EC8
    CommTwr,         // s5:D08E
    Lab,             // s7:C71E  HotLab(2), UGLab(1-3)
    Chap,            // s5:CD06
    Nano,            // s6:26D6
    TerraForm,       // s6:49DE
    Dirt,            // s5:E81C
    Police,          // s5:D3A4  Cops(2), UGCops(2)
    Smelter,         // s6:3816
    RoboCmd,         // s7:C9E4
    Warehouse,       // s6:611E
    Storage,         // s6:44FE
    ColonistLander,  // s5:CE08
    MonoStation,     // s6:1FC8
    MonoXFormer,     // s6:25FC
    CargoLander,     // s5:CA0C
    Core,            // s5:D5C8  Core, UGCore
    Destroyed,       // s5:D888
    Road,            // s7:D942
    UGResident,      // s6:5C76
    UGRec,           // s6:5988
    UGUniv,          // s6:5F00
    UGCommercial,    // s6:53E8
    UGPark,          // s6:58A6
    UGFact,          // s6:5546
    UGSpacePort,     // s6:5E18
    UGRed,           // s6:5A6A
    UGAdmin,         // s6:530A
    UGMed,           // s6:57C8
    UGGeoTherm,      // s6:5652
    RoboDozer,       // s5:E91E
    RoboDigger,      // s5:D99E
    RoboMine,        // s6:17AE
    RoboExplr,       // s6:2B1C
    Pipe,            // s6:2812
};

BuildingClass buildingClassOf(uint16_t type);

// Building (DB type 7), base vtable s6:CF6A (26 slots). Only the slots the
// simulation calls so far are modelled; every override listed here is
// decoded in findings/08-simulation.md.
class Building : public DbObject {
public:
    // States (+0x12). 1..3 are robot activity states (s5:EA0E, s5:DA3C);
    // 4 and 5 carry a needs record (see info below); 6 is a suspended state
    // that remembers the previous one; 9 is an exhausted mine (s6:0EA6).
    static constexpr uint16_t kConstructing = 4;
    static constexpr uint16_t kOperational = 5;   // tested by every SC step
    static constexpr uint16_t kSuspended = 6;
    static constexpr uint16_t kExhausted = 9;
    // Network flags (+0x1A), rebuilt by SCProdSched every turn.
    static constexpr uint16_t kReachedByLife = 1, kReachedByPower = 2;

    Building(uint16_t type, BuildingClass cls);

    uint16_t type{0};             // +0x0C
    uint16_t placeholderType{0};  // +0x0E: 66 (Const), or 107 (UGConst) for types 79..111
    uint16_t spriteVariant{0};    // +0x10 (set by s6:BF76)
    uint16_t state{0};            // +0x12
    uint16_t savedState{0};       // +0x18, state to restore when leaving kSuspended
    uint16_t flags{0};            // +0x1A kReachedByLife | kReachedByPower
    // +0x14 in robot states 1..3 (saved): the turns of work left
    // (dozers s5:ECB0, diggers s5:E558, RoboMine s6:1B1E).
    int16_t turnsLeft{0};
    uint32_t tag1C{0};            // +0x1C; resume refuses while it is the rebel
                                  // handle 0x08000002 (writers TBD)
    BuildingClass cls{BuildingClass::Generic};

    // +0x14: the building's needs record, owned per building:
    //   kConstructing -> copy of the type's BLDGBLD record (s6:E0BC)
    //   kOperational  -> copy of the type's BLDGOPS record (s6:E100) plus the
    //                    runtime fields +0xA4 (produced resource), +0xAA
    //                    (rate) and +0xAC (flag)
    enum class InfoKind : uint8_t { None, Construction, Operation };
    InfoKind infoKind{InfoKind::None};
    data::BldgBldRecord buildInfo;
    data::BldgOpsRecord opsInfo;
    // Runtime job fields of the operating record:
    uint16_t opsResource{0};      // +0xA4 resource produced (AgriDome: Food)
    uint16_t opsProductA{0};      // +0xA6 factory product A
    uint16_t opsProductB{0};      // +0xA8 factory product B
    uint16_t opsAmount{0};        // +0xAA amount per cycle (AgriDome: rate)
    uint16_t opsCycleTurns{0};    // +0xAC turns per cycle (AgriDome: 1)

    // Per-resource needs of the current record, or nullptr (Colony_allocate).
    const std::array<int32_t, data::res::Count>* needs() const;

    // Building::setState (s6:BDAC).
    void setState(Simulation& sim, uint16_t newState);

    virtual void mine(Simulation&) {}                        // slot 11 (+0x2C), SCMines
    virtual void produce(Simulation&) {}                     // slot 12 (+0x30), SCFactory
    virtual void power(Simulation&, bool /*operational*/) {} // slot 13 (+0x34), SCPower
    virtual void onStateEntered(Simulation& sim);            // slot 15 (+0x3C), base s6:BF22
    // slot 16 (+0x40): is the building's storage full? Also reports the
    // stored amount. Base s6:BBF0: never full, 0 stored.
    virtual bool isFull(Simulation&, int32_t& stored) { stored = 0; return false; }
    // slot 20 (+0x50): does this building keep the colony alive? Asked of
    // the operational group-45 buildings (Command, SeedCommand, Chap, Chap2)
    // by s8:42CC. Base s6:B4E6: no.
    virtual bool providesLifeSupport() const { return false; }
    // slot 18 (+0x48): this building's morale effect, summed by SCMorale
    // over the colony's operational buildings. Base s6:B5A8: the BLDGOPS
    // word at record +0x94 while operational (AgriDome/SPEW/Nano/DIRT/
    // Rec/Univ/Commercial/Park +1, TerraForm +5, UGRed +2, HotLab -1).
    // slot 9 (+0x24), base s6:B514: the building is wrecked (state 7): its
    // needs record is freed and its tile's Bas and Alloc ledgers and linked
    // objects are cleared. Overrides for Tokamak (s6:4CD6), SpacePort
    // (s6:41EA), Core/UGCore (s5:D6E6) and mines (s6:0D9C) also reach the
    // structure's part on the level below (map, not decoded yet).
    virtual void wreck(Simulation& sim);
    static constexpr uint16_t kWrecked = 7;
    // slot 0 (destructor) side effects, run by SCKillBldg before the object
    // goes. Base: none.
    virtual void onDestroy(Simulation&) {}

    // ── The player's placement rules (findings/10-map.md §3d) ────────────
    // slot 7 (+0x1C): may this building go on `pos` of `site` for `colony`?
    // On refusal the message (string id) and its argument are left in
    // Simulation::placeMessage() (DGROUP 0x50CA / 0x50CC). Base s6:BC90:
    // the cell must be prepared ground (kind 5 or 6, s6:C7B6, else 1704),
    // then slot 24, slot 23, the owner rule (s6:C23E) and the map margin
    // (s6:C314, 1720). Overrides of slots 7, 23, 24 (robots, landers, the
    // Seed, Command centers, comm towers, police, smelters, roads, tubes,
    // monorails) are not modelled yet.
    virtual bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site);
    // slot 24 (+0x60). Base s6:C522: within 30 of the colony's hub (s7:BCDE),
    // else 1711 (other site) or 1718 with the spaces too far.
    virtual bool inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site);
    // slot 23 (+0x5C). Base s6:C64A: next to a tube that conducts towards it
    // (s6:C5A6): an L tube above or below, an R tube left or right, or an X
    // tube; nothing is reported when not.
    virtual bool connectsToPlace(Simulation& sim, const MapCell& pos, Handle site);

    virtual int16_t moraleEffect(const Simulation&) const {
        return state == kOperational && infoKind == InfoKind::Operation
                   ? static_cast<int16_t>(opsInfo.words[0]) : int16_t{0};
    }

    // ── Construction and the colony network (findings §2.8, §2.9) ─────
    // slot 14 (+0x38), called by SCConstruct for states 1..4. Base s6:BE9E:
    // a constructing building pays its BLDGBLD needs and counts down.
    virtual void constructTick(Simulation& sim);
    // slot 10 (+0x28), called by SCProdSched. Base s6:BE2A: a suspended
    // building resumes if connected and its running needs are paid.
    virtual void resume(Simulation& sim);
    // slot 25 (+0x64). Base s6:CED2: suspends the building unless both
    // network flags are set (recording a 1-unit Power/LifeA shortfall).
    virtual bool checkConnected(Simulation& sim);
    // slot 21 (+0x54): seeds the power network (group 44). Base s6:B4EC: no.
    virtual bool isPowerSource() const { return false; }
    // slot 8 (+0x20), called by SCInternalPutBldg on the new building. Base
    // s6:BC7E: setState(4).
    virtual void beginConstruction(Simulation& sim) { setState(sim, kConstructing); }
    // slot 6 (+0x18), called by SCInternalPutBldg right after slot 8 with
    // arg 1 (s6:8BF9); 0 is the player's own placement (SCPutBldg, not
    // modelled), which some overrides treat as taking the building off the
    // mothership. Base s6:BD38: reserve the type's BLDGBLD needs (resources
    // 17..36, read from the table, not the building's copy, s7:4BBE) in the
    // colony's allocation.
    virtual void reserveNeeds(Simulation& sim, uint16_t arg);
    // s6:CB04: can the colony pay the current needs record this turn?
    // Shortfalls are recorded in the tile's Alloc ledger.
    bool canAffordNeeds(Simulation& sim);
    // s6:C952: pay the current needs record.
    void payNeeds(Simulation& sim);
    // The countdown word +0x94 of the BLDGBLD copy (turns left to build).
    int16_t buildTurnsLeft() const { return static_cast<int16_t>(buildInfo.word94); }

    Tile* tile(const Simulation& sim) const;               // DbObj::getOwner, s6:B58E
    Colony* colony(const Simulation& sim) const;
};

// ── Classes with decoded methods ──────────────────────────────────────────

class SeedPowerBuilding : public Building {         // power: s6:35B0
public:
    using Building::Building;
    void power(Simulation& sim, bool on) override;
    bool isPowerSource() const override { return true; }                  // s6:35AA
};

class TokamakBuilding : public Building {           // power: s6:4F30
public:
    using Building::Building;
    void power(Simulation& sim, bool on) override;
    bool isPowerSource() const override {                                 // s6:4BD0
        return state == kOperational || state == kSuspended;
    }
    // s6:4DB2: only the surface Tokamaks (group 41) reserve anything: the
    // base reserve, an MShipTokamak placed by the player (arg 0) leaves the
    // mothership, and the reactor's underground part is put on the level
    // below (map, not modelled yet).
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
};

class SolarReceiverBuilding : public Building {     // power: s6:43F6
public:
    using Building::Building;
    void power(Simulation& sim, bool on) override;
    bool isPowerSource() const override {                                 // s6:43A0
        return state == kOperational || state == kSuspended;
    }
    // s6:43C2: the base reserve; placed by the player (arg 0), the receiver
    // is taken off the mothership (s3:988C).
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
};

class CommandCenterBuilding : public Building {     // power: s7:C12E
public:
    using Building::Building;
    // s7:C52E: an empty cell (no tile, terrain not 4), at least 31 from
    // every colony's hub; a colony on another site refuses with 1711.
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    // +0x20: for a Command, the colony it was placed for (its parent):
    // SCInternalPutBldg sets it (s6:8C2A) and the reserve founds the new
    // colony out of it (s7:C2FA).
    int32_t field20{0};
    int16_t life{0};   // +0x24; set when construction ends (s7:C1B2)
    void power(Simulation& sim, bool on) override;
    // s7:C0EC: SeedCommand always; Command while its life lasts.
    bool providesLifeSupport() const override { return type == 11 || life > 0; }
    bool isPowerSource() const override { return life > 0; }             // s7:C0D2
    // s7:C1B2: on completion, Command gets life 100; SeedCommand moves the
    // mothership's landers to its deployable list (s3:9794) and gets 3 per
    // mothership item 0x82, at least 50 on Beginner/Easy.
    void constructTick(Simulation& sim) override;
    // s7:C10E (SCFactory; it skips type 55, so only the SeedCommand gets
    // here): one life a turn; when none is left the SeedCommand turns into
    // a Command (type 55) with no life (quirk Q43).
    void produce(Simulation& sim) override;
    // s7:C2FA: a SeedCommand reserves nothing. A Command reserves its
    // needs, then founds its colony out of the parent colony (+0x20):
    // people, resources and robots (s7:C363..C528, needs the new-colony
    // path of SCInternalPutBldg, not modelled yet).
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
};

// Seed (ctor s6:2BFE): the lander everything starts from.
class SeedBuilding : public Building {
public:
    using Building::Building;
    // s6:2C28: the lander rule (s6:09D4), then all 8 neighbours must not
    // hold an ordinary building (cell kind 0).
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    // s6:2E84: marks the tile (+0x14 = 1, s6:09B8) and reserves nothing.
    // Placed by the player (arg 0) it announces the landing and the
    // mothership arrives (s3:9766, with cargo damage s3:A0A0).
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
    // s6:2E40: when it lands, the Seed puts down its buildings around it
    // (s6:2F18), gives the colony its starting stock (s6:3246) and switches
    // alert 5 on.
    void constructTick(Simulation& sim) override;
    // s6:2F18: the SeedPower, SeedSmelter, SeedFactory and SeedCommand on
    // the diagonals, XPipes on the sides; the hub becomes the SeedCommand.
    void deploy(Simulation& sim);
    // s6:3246: on the colony hub (colony +0x10): a Dozer, a Digger, a
    // Miner and an Explorer, 4 Trucks unless automatic trucking is on, and
    // 200 each of MetalA-D and MinA-C, 20 each of PrecA-B and FusionA-C.
    void giveStartingStock(Simulation& sim);
};

// SpacePort (ctor s6:408E): s6:4194 tells the player when it is finished.
class SpacePortBuilding : public Building {
public:
    using Building::Building;
    void constructTick(Simulation& sim) override;
};

// Storage tanks (Storage, Storage2; ctor s6:44FE): s6:45B0 puts two trucks
// on the tank's tile when it is finished.
class StorageBuilding : public Building {
public:
    using Building::Building;
    void constructTick(Simulation& sim) override;
};

// The Destroyed buildings (ctor s5:D888): mine, produce, power, the
// construction tick and onStateEntered are empty (s5:D8B2..D8C2).
class DestroyedBuilding : public Building {
public:
    using Building::Building;
    void mine(Simulation&) override {}
    void produce(Simulation&) override {}
    void power(Simulation&, bool) override {}
    void constructTick(Simulation&) override {}
    void onStateEntered(Simulation&) override {}
};

// Slot 22 (+0x58, base s6:B46E): the building's colony changed side
// (s8:349E). The tile's route and Bas ledger are cleared, its trucks go
// back to the colony (s8:387E) and the building takes the colony's player
// (+0x1C). Class extras: RoboCmds send their working robots home as kits
// (s7:CA26); a SpacePort hands over the UG SpacePort below and is wrecked
// (s6:40B8); Tokamaks, mines and cores hand over what is below (s6:4BF2,
// s6:0C84, s5:D5F2); labs drop their topic (s7:C74E); warehouses and
// factories lose their stock (s6:61C4, s6:0176).
void handOver(Simulation& sim, Building& b, const Colony& to);

// s6:CCD0 / s7:A044: the empty underground terrain on the 3x3 cells around
// `at` (clamped to the map) softens: 7 -> 6, 8 -> 7, 9 -> 8.
void soften(Simulation& sim, Handle site, Handle colony, const MapCell& at);

// The Factory window's product list (dialog 4001, combobox 6000; s9:48A0 ->
// s3:DEBE kind 6): only for a building operational, suspended or in state
// 8; the build menu's offered products (+0x11E) in the building's range
// (SeedFactory 14: 1..4, SpacePort 15: 15..19, else 1..14), then 20 (stop).
std::vector<uint16_t> factoryProducts(const Simulation& sim, const Building& b);
// The window's OK (s9:4CF4 -> s3:AE92 kind 6 -> s7:7F1A -> s6:BB96): while
// operational or suspended the job becomes {resource 0, product A, B 0,
// amount 1}, with turns per cycle by s6:C724 (7: 10, 13: 1, 0: none, else
// 5). A SeedFactory given product 1..4 after turn 50 posts log 11.
// Returns false (nothing changed) in any other state.
bool setFactoryProduct(Simulation& sim, Building& b, uint16_t product);

// The second product list (s3:DEBE kind 7, names s5:C2F8: strings
// 0x583.. ): product B 1..14, 1..15 once player 1 has made discovery 7
// (s3:AC62, +0x116[7]), then 16; only operational, suspended or state 8.
std::vector<uint16_t> factoryProductsB(const Simulation& sim, const Building& b);
// Its OK (s3:AE92 kind 7 -> s7:7EDA -> s6:BB96): while operational or
// suspended the job becomes {resource 0, product A 0, product B, amount 1},
// 1 turn per cycle (s6:C724: no product A, a product B). False otherwise.
bool setFactoryProductB(Simulation& sim, Building& b, uint16_t product);

// IMPROVISED (I96): which windows offer the product-B list is not traced
// (the window opener s3:7344's switch); the UG factories (91, 92) do, so
// UGCommercial and UGRed (Luxury from product-B items, s6:6302) can run.
// setFactoryConsumerGoods sets product B kConsumerGoods via the decoded
// setter.
constexpr uint16_t kConsumerGoods = 1;
bool makesConsumerGoods(const Building& b);
bool setFactoryConsumerGoods(Simulation& sim, Building& b);

// s7:2FAC: a planet's maximum digging depth by its hostility (record
// +0x0C): 0..1 -> 4, 2..4 -> 3, 5..7 -> 2, more -> 1.
int16_t maxDigDepth(int16_t hostility);

// Robot buildings (RoboDozer, RoboDigger, RoboMiner, RoboExplorer; types
// 115-121). Their activity is map work, not modelled; a save keeps these.
// Robots at work on a cell: RoboDozer (115, 119), RoboDigger (116, 120,
// 121), RoboMine (117), RoboExplr (118; its reserve s6:2B46 is empty, the
// rest is the base class). findings/10-map.md §3b.
class RobotBuilding : public Building {
public:
    using Building::Building;
    // +0x20: the RoboCmd building whose robot does the work (s7:DF0C).
    uint32_t long20{0};
    // IMPROVED (I59): the ground's mark before SCInternalPutBldg marked the
    // tile (-1: none), so a dozer's time follows the terrain (Q72).
    int16_t groundMark{-1};
    uint16_t word24{0};            // +0x24 dozers and diggers: sewage when done (s5:EDF1)
    uint16_t word26{0};            // +0x26 diggers
    // While in state 1..3, +0x14 (Building::turnsLeft) holds the turns of
    // work left instead of a needs record (s5:ECB0).

    // s7:DFCC: the unit kind the robot uses: 115, 119 -> Dozer (1), 116,
    // 120 -> Digger (2), 117 -> Miner (3), otherwise 0.
    uint16_t unitKind() const;
    bool isDozer() const { return cls == BuildingClass::RoboDozer; }
    // RoboDigger (116, 120, 121; s5:D99E family): +0x24 is the direction
    // (1 down, 2 y-1, 3 y+1, 4 x+1, 5 x-1, 6 fill in), +0x26 set once a
    // side tunnel was started (s5:E294).
    bool isDigger() const;
    void digOnStateEntered(Simulation& sim);   // s5:E558
    void digTick(Simulation& sim);             // s5:E44C
    void digFinish(Simulation& sim);           // s5:E08E
    void mineTick(Simulation& sim);            // s6:199A (RoboMine)
    void finishAs(Simulation& sim, uint16_t result);   // s5:E39C
    // s5:EA20 (dozers; other robots the base or their own class): the long
    // range (s6:C3AA), the owner rule and the margin; then by cell kind
    // (s6:C7B6): 4, 5, 6, 9 refuse (1704), other terrain is fine, and a
    // building is dozed unless it is another colony's (1719), a lander still
    // landing (1713), a Command (1716), structural (1713), a DisMine or 110
    // (no message) or a robot (1712). A dozed building is wrecked and goes;
    // the dozer keeps its BLDGBLD +0x96 (the sewage when done).
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    // s5:EA0E: a dozer starts in state 1.
    void beginConstruction(Simulation& sim) override;
    // s5:E9D4: claims a robot of its kind in one of the colony's RoboCmds
    // (s7:DF0C) and marks a Dozer busy (s8:57DC).
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
    // s5:ECB0: in state 1 the work takes 1..3 turns by the tile's mark.
    void onStateEntered(Simulation& sim) override;
    // s5:ED3C: counts down; when done the cell becomes bulldozed ground
    // (type 5, or 9 underground, s5:EE3A), the Dozer is free again and
    // +0x24 sewage is queued.
    void constructTick(Simulation& sim) override;
    // s7:DCF4 (destructor): the RoboCmd slot is given back (s7:CC44).
    void onDestroy(Simulation& sim) override;
};

// Monorail pieces (22 vertical, 23 horizontal, 24 crossing; ctor s6:1BE8)
// and the MonoStation (63, ctor s6:1FC8): their own tube rule (slot 23)
// and the site-only range (slot 24).
class MonorailBuilding : public Building {
public:
    using Building::Building;
    uint16_t trainHere{0};         // +0x20 on 22, 23 (and the train pieces 25, 26): a train is on it (s7:AFFC)
    bool connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) override;
    bool inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
};

class MonoStationBuilding : public Building {
public:
    using Building::Building;
    bool connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) override;
    bool inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    // s6:20B6: once built, a MonoXFormer (64) next to it gives the line a
    // train (s8:79B2).
    void constructTick(Simulation& sim) override;
    // s6:2042: its train goes with it (s8:79F2).
    void onDestroy(Simulation& sim) override;
    // +0x20: the trips waiting here for a train (saved, s6:24A2).
    std::vector<Trip*> waiting;
};

// RoboDigger (116, 120, 121; ctor s5:D99E): placement s5:DA4E, slot 24
// s5:DB86.
class RoboDiggerBuilding : public RobotBuilding {
public:
    using RobotBuilding::RobotBuilding;
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    bool inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
};

// RoboMine (117, ctor s6:17AE): a Miner deepens a mine shaft by one level.
class RoboMineBuilding : public RobotBuilding {
public:
    using RobotBuilding::RobotBuilding;
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;   // s6:1824
};

// TerraForm 1-2 (ctor s6:49DE): five systems switched in the "Terraforming
// Control" dialog (343): atmospheric generation, CFC, oxygen, nitrogen,
// carbon dioxide. Only the first does anything: each operational facility
// with it on brings the planet's terraforming a turn closer (s6:4ACA).
class TerraFormBuilding : public Building {
public:
    using Building::Building;
    std::array<uint16_t, 5> systems{};     // +0x20 (s6:4A9A / s6:4AB2)
    void produce(Simulation& sim) override;
};

// Nano (ctor s6:26D6): while operational the colony needs only Power and
// People (slots 10/14, s6:2700 / s6:272E).
class NanoBuilding : public Building {
public:
    using Building::Building;
    void resume(Simulation& sim) override;
    void constructTick(Simulation& sim) override;
};

// ColonistLander (ctor s5:CE08): on landing (completion, s5:CE9E) up to 50
// colonists come down from the mothership (s5:CEFC).
class ColonistLanderBuilding : public Building {
public:
    using Building::Building;
    // s6:09D4: inside the margin, cell kind 1..3, 5 or 10+, within 5 of
    // the hub (1717).
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    void constructTick(Simulation& sim) override;
    // s5:CE32: marks the tile (s6:09B8) instead of reserving needs; for
    // the player, the lander leaves the mothership and log 9 is posted.
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
};

// CargoLander (ctor s5:CA0C).
class CargoLanderBuilding : public Building {
public:
    using Building::Building;
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;   // s6:09D4
    // s5:CA36: like the ColonistLander's, without the log message.
    void reserveNeeds(Simulation& sim, uint16_t arg) override;
    // s5:CA82: a player's lander unloads when it lands (s5:CAC2).
    void constructTick(Simulation& sim) override;
    // s5:CAC2: the mothership's hold (+0x0A) comes down. Solar receiver and
    // MShipTokamak kits (kinds 18, 19) become ready to land (+0x0E), half
    // lost on Medium, three quarters on Hard; food supplies (kind 129) go
    // to the lander's tile as Food, a quarter lost on Beginner and Easy,
    // half on Medium, three quarters on Hard.
    void unload(Simulation& sim);
};

// Terrain (types 1..9, ctor s6:48C0): resume, mine, produce and
// onStateEntered are empty (s6:490C..4918), and a terrain cell put down by
// SCInternalPutBldg goes to state 0, not 4 (s6:48FA).
class TerrainBuilding : public Building {
public:
    using Building::Building;
    void resume(Simulation&) override {}
    void onStateEntered(Simulation&) override {}
    void beginConstruction(Simulation& sim) override { setState(sim, 0); }
};

// Roads (LRoad, RRoad, XRoad; ctor s7:D942): always connected (s7:DC02) and
// always resume (s7:DB78).
class RoadBuilding : public Building {
public:
    using Building::Building;
    // s7:DB72: needs no tube; s7:DB92: only the hub's site counts (1711).
    bool connectsToPlace(Simulation&, const MapCell&, Handle) override { return true; }
    bool inRangeToPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    void resume(Simulation& sim) override;
    bool checkConnected(Simulation&) override { return true; }
    // s7:D994: the base construction tick, but every turn of building also
    // needs a Road Materials kit from one of the colony's warehouses (any
    // state, s7:DACE) and takes it after paying (s7:DA22).
    void constructTick(Simulation& sim) override;
};

// Labs (HotLab 1-2, UGLab 1-3; ctor s7:C71E): suspended while no research
// topic is set, or the topic is 112 "None" / 113 "Pause" (s7:C76C).
class LabBuilding : public Building {
public:
    using Building::Building;
    uint16_t topic{0};             // +0x20
    void resume(Simulation& sim) override;
    // s7:C7B0: one turn of research. When the topic completes the lab goes
    // idle (topic 112), except Basic Research (1), which restarts at 100.
    void produce(Simulation& sim) override;
};

// s3:A5EC: the player gives a lab a topic. A topic not started (points
// left < 0) counts its labs: the old topic's value goes up by one and the
// new one's down by one (not for 112, idle), so an unstarted topic studied
// by n labs holds -1-n until its first lab turn sets the cost.
void setLabTopic(Simulation& sim, LabBuilding& lab, uint16_t topic);

// IMPROVED (I106): the manual's research and industrial parks. A lab or a
// Light Industry tile with an operational Administration building
// (UGAdmin 102/103, same colony) among its eight neighbours on its level
// works one point faster each turn (labs: +1 research point; Light
// Industry: +1 progress per step). v1.51 has no such rule (findings/14 §4a).
bool besideAdministration(Simulation& sim, const Building& b);

// UGUniv 1-3 (ctor s6:5F00): resume s6:6008 also counts +0x20 down.
class UGUnivBuilding : public Building {
public:
    using Building::Building;
    // +0x20: teaching turns: 100 when finished, 200 with topic 97 Advanced
    // Teaching Methods (s6:5F30), counted down while operational (s6:6008).
    // Nothing reads it in v1.51: education (s8:45E4) counts operational
    // UGUnivs (quirk Q73). IMPROVED (I105): the rebuild's education counts
    // only those with turns left (steps.cpp updateEducation).
    int16_t counter20{0};
    void resume(Simulation& sim) override;
    // s6:5F30: finished, the counter starts at 100, or 200 with research
    // 97.
    void constructTick(Simulation& sim) override;
};

// UGCommercial 1-3 (s6:5412) and UGRed (s6:5B42) need Luxury from the
// colony's warehouses (1 and 2 per turn) besides their running needs.
class LuxuryUserBuilding : public Building {
public:
    using Building::Building;
    void resume(Simulation& sim) override;
    int32_t luxuryPerTurn() const { return type == 101 ? 2 : 1; }
};

// Comm towers (CommTwr 1-3, ctor s5:D08E): resume s5:D0B8 also needs the
// tower in range (s5:D194).
class CommTowerBuilding : public Building {
public:
    using Building::Building;
    // s5:D118: surface ground only (kind 5), the owner rule, the long
    // range (s6:C3AA) and the margin; no tube needed.
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    void resume(Simulation& sim) override;
    bool inRange(Simulation& sim) const;   // s5:D194
};

// Cops, Cops2, UGCops, UGCops2 (ctor s5:D3A4 takes the mode). Mode is a
// placement argument: 2 = friendly, 1 = hostile (as read by s5:D4CA and
// s6:5A94), 0 =
// as placed by SCInternalPutBldg. A police station within distance 4 of a
// red-light district stops its crime (mode 1) or halves it (mode 2, s6:5A94).
class PoliceBuilding : public Building {
public:
    using Building::Building;
    // s5:D460: the base rules, then the mode dialog (s8:AF40, dialog 0x11;
    // its answer, registry 0x3A +0x0A, becomes +0x20). The dialog is UI:
    // the rebuild keeps the mode the caller set.
    uint16_t mode{0};    // +0x20
    // s5:D4CA: friendly +1; otherwise -1 until research 99 (Crowd Psychology).
    int16_t moraleEffect(const Simulation& sim) const override;
};

// Chap, Chap2 (ctor s5:CD06). Life support (s5:CD30) while operational or
// suspended with flag bit 2 set.
class ChapBuilding : public Building {
public:
    using Building::Building;
    bool providesLifeSupport() const override {
        return (state == kSuspended || state == kOperational) && (flags & 2) != 0;
    }
};

class AgriDomeBuilding : public Building {          // onStateEntered: s7:BE80, produce: s7:BF6E
public:
    using Building::Building;
    void onStateEntered(Simulation& sim) override;
    void produce(Simulation& sim) override;
};

// Mine class (DisMine, ActiveMine(2), UGMine(2)). mine(): s6:134A,
// isFull: s6:12BE. Only the underground mines (group 19) produce; their ore
// goes to the building directly above on the surface (s6:121E).
class MineBuilding : public Building {
public:
    using Building::Building;
    // +0x20: the ore SCMove's trucks look at next (s6:0D80 returns it and
    // moves it on: 4 -> 5 -> ... -> 13 -> 4, anything else -> 4, s6:1646).
    // 0 in a new mine.
    uint16_t oreCursor{0};
    uint16_t nextOre();
    // +0x22: operating turns left. 100 when construction ends (s6:0FA4);
    // SCProdSched spends one per operating turn and exhausts the mine at 0
    // (s6:0EA6); a turn spent full gives it back (s6:134A).
    int16_t life{0};
    void mine(Simulation& sim) override;
    bool isFull(Simulation& sim, int32_t& stored) override;
    void constructTick(Simulation& sim) override;
    void resume(Simulation& sim) override;
    Building* oreTarget(Simulation& sim);   // s6:121E
};

// Smelter class (Smelter, Smelter2) and SeedSmelter: produce s6:3958,
// isFull s6:3C60. Refines the ore on its tile into its own output ledger.
class SmelterBuilding : public Building {
public:
    using Building::Building;
    // s6:38D4 (both smelter classes): the base rules without the tube.
    bool canPlace(Simulation& sim, const MapCell& pos, Handle colony, Handle site) override;
    int32_t minBCarry{0};          // +0x20 OreMinB toward PrecA (2:1)
    int32_t minCCarry{0};          // +0x24 OreMinC toward PrecB (3:1)
    Ledger output;                 // +0x28
    void produce(Simulation& sim) override;
    bool isFull(Simulation& sim, int32_t& stored) override;
};

// SeedSmelter: Smelter's produce, but its own full check (s6:36BC): one
// sum over resources 4..28, full at 250.
// Tubes (122..127, ctor s6:2812). s6:2844: a tube connects next to a tube
// of the right axis or an ordinary building (s6:297C).
class PipeBuilding : public Building {
public:
    using Building::Building;
    bool connectsToPlace(Simulation& sim, const MapCell& pos, Handle site) override;
};

// UGGeoTherm (ctor s6:5652): its placement rule (s6:567C) always refuses,
// so the player can never put one down (quirk Q55); power() is an empty
// stub (Q1).
class UGGeoThermBuilding : public Building {
public:
    using Building::Building;
    bool canPlace(Simulation&, const MapCell&, Handle, Handle) override { return false; }
};

class SeedSmelterBuilding : public SmelterBuilding {
public:
    using SmelterBuilding::SmelterBuilding;
    bool isFull(Simulation& sim, int32_t& stored) override;
};

// SPEW (Spew, Spew2, Spew3): produce s6:3F04. Sewage -> MPG.
class SpewBuilding : public Building {
public:
    using Building::Building;
    int32_t carry{0};              // +0x20 division remainder
    void produce(Simulation& sim) override;
};

// UGResident: produce s6:5D0E queues one unit of sewage.
class UGResidentBuilding : public Building {
public:
    using Building::Building;
    void produce(Simulation& sim) override;
};

// Factory class (Fact 1-3) and SeedFact: produce s6:0582, progress s6:081E,
// isFull s6:04EE (output holds 30 units).
class FactoryBuilding : public Building {
public:
    using Building::Building;
    int16_t progress{0};           // +0x20
    std::vector<ProductItem> output;   // +0x22 list
    void produce(Simulation& sim) override;
    bool isFull(Simulation& sim, int32_t& stored) override;
    void advance(Simulation& sim);     // s6:081E
    // s6:01EC: stays suspended while making product A 20 or product B 16.
    void resume(Simulation& sim) override;
    // s6:0550 (Fact 1-3, SeedFact): a truck on the factory's tile when it
    // is finished; UGFact (s6:5570) adds a second one.
    void constructTick(Simulation& sim) override;
};

// Warehouse 1-2 (group 4, ctor s6:611E): a list of stored items (+0x20),
// holding 100 units.
// Luxury = the quantity of items with a product B (s6:6302).
class WarehouseBuilding : public Building {
public:
    using Building::Building;
    std::vector<ProductItem> items;
    int32_t luxury() const;                          // s6:6302
    // s6:6356: take `amount` of items of product B `kind` (0 = any, but
    // kind 15 only when asked for by name).
    void take(uint16_t kind, int32_t amount);
    uint32_t storedUnits() const;                    // s6:67D4
    // s6:6822: full at 100 units.
    bool isFull(Simulation& sim, int32_t& stored) override;
    // s6:62C8: units it can still take; 0 unless operational.
    uint32_t room() const;
    // s6:6408: merge into every item of the same products (and +0x04), or
    // append.
    void add(const ProductItem& item);
    // s6:6744: the quantity of the first item of product A `product`, or 0.
    uint16_t quantityOfA(uint16_t product) const;
    // s6:6228: take `amount` of product A `product`, item by item.
    void takeA(uint16_t product, uint32_t amount);
};

// RoboCmd, RoboCmd2 (group 30, ctor s7:C9E4). Ten robot slots (+0x20, 12
// bytes each): a robot made from a kit lasts 200 turns, and a Repair Robot
// plus a Fuel Cell renew it (findings/08-simulation.md §2.14).
class RoboCmdBuilding : public Building {
public:
    using Building::Building;
    struct Slot {
        uint32_t expires{0};   // +0: the turn the robot runs out; 0 = free slot
        uint16_t item{0};      // +4: product A id
        uint16_t flag{0};      // +6: 0 = free for work (Dozer/Digger/Miner/
                               // Truck/Humanoid Workers on arrival, s7:D340),
                               // 1 = busy or not a working robot; 4 = to be
                               // returned as a kit (s7:CC44)
        uint32_t field8{0};    // +8: the tile it works on (s7:CEF8)
    };
    std::array<Slot, 10> slots{};
    uint16_t wanted{1};        // +0x98: the next kit it asks a warehouse for

    // s7:D0A8: the kit to ask for; moves +0x98 along the cycle 1, 2, 3, 4,
    // 12, 8, 9, 11, 5, 1 ... (s7:D56A; anything else -> 1).
    uint16_t nextWanted();
    int freeSlots() const;                          // s7:D144
    bool allSlotsUsed() const { return freeSlots() == 0; }   // slot 17, s7:D230
    bool hasRobot(uint16_t item) const;             // s7:CF3A
    // s7:D180: a kit becomes a robot in the first free slot, for 200 turns.
    // Explorers are counted by the colony (s8:48E0); anything else becomes
    // a unit on this tile (s7:7C50).
    void receive(Simulation& sim, uint16_t item);
    // s7:CF78: give up the first robot of `item` (unit or explorer).
    bool release(Simulation& sim, uint16_t item);
    // s7:D00C: the same for the first idle robot (slot flag 0) only.
    bool releaseIdle(Simulation& sim, uint16_t item);
    // s7:CC44: up to `n` robots of `kind` working on `tile` come back: free
    // again, or (slot flag 4) returned as a kit to the first warehouse of
    // colony 1 with room (quirk Q70). Returns how many.
    int returnRobot(Simulation& sim, int n, Handle tile, uint16_t kind);
    // s7:CE72: up to `n` free robots of `kind` (no tile) go to work on
    // `tile` (slot flag 2 for trucks, 1 otherwise). Returns how many.
    int assignRobots(int n, Handle tile, uint16_t kind);
    // s7:D26C: robots past their turn are renewed (s7:D3B2) or lost.
    void produce(Simulation& sim) override;
    // s7:CAC2: the first RoboCmd ever completed takes the Dozers, Diggers,
    // Miners and Trucks on the colony hub, then gets trucks up to 4.
    void constructTick(Simulation& sim) override;

private:
    bool renew(Simulation& sim, size_t k);
};

// Unit values per product (s5:C3B4 for product A, s5:C42E for product B).
uint16_t productUnitValueA(uint16_t product);
uint16_t productUnitValueB(uint16_t product);

// Building::create (s7:07AC) for the decoded classes; others are Building.
std::unique_ptr<Building> makeBuilding(uint16_t type);

} // namespace outpost::sim
