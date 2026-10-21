#pragma once

#include "sim/object_db.hpp"
#include "sim/world.hpp"

#include <array>
#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace outpost::sim {

struct GameData;
class Simulation;
class Step;

// The universe tables of OUTPOST.EXE (DGROUP), read at runtime:
//   galaxy  0x518C  word n, n star ids (21: 1..21)            (s7:4574)
//   stars   0x51B8  21 rows of 18 bytes: name string id, planet count,
//                   position (x, y, z), 4 planet ids           (s7:4594)
//   planets 0x5332  10 templates of 94 bytes: position, 8 traits,
//                   hostility, a dword, the site pool: its size, the
//                   minimum and maximum number of sites, 15 site ids of
//                   which the first is the pool's base         (s7:4628)
// The planet templates are written to while a planet is made (its site
// list is drawn into the template itself), so they are kept here, per
// running game program, as in the original (quirk Q53).
struct UniverseTables {
    struct StarRow {
        uint16_t nameId{0};
        std::string name;
        Pos3 pos;
        std::vector<uint16_t> planetIds;
        // IMPROVED (I92): planets the original row does not have; their
        // sites are made for the game (sim/modern_galaxy.hpp).
        std::vector<bool> madeUp;
    };
    struct PlanetRow {
        Pos3 pos;
        std::array<int16_t, 8> traits{};
        int16_t hostility{0};
        int32_t rec0E{0};
        int16_t poolSize{0};                     // +0x1C
        int16_t minSites{0}, maxSites{0};        // +0x1E, +0x20
        std::array<int16_t, 15> sites{};         // +0x22; sites[0] is the pool base
    };
    std::vector<uint16_t> starIds;
    std::vector<StarRow> stars;                  // star id - 1
    std::vector<PlanetRow> planets;              // planet id - 1

    bool load(const GameData& data, std::string* error = nullptr);
};

// The view (registry 0x2F, ctor s3:E9E4) draws the disaster calendar when it
// is made (+0x34[1..8], read by SCEvent on Medium and Hard): entry i is base
// i (250, 350, 450, 450, 550, 650, 115, 150) plus or minus random(0, 29),
// minus when the next random(1, 2) is 1. The view is not saved and is made
// on its first use; IMPROVISED (I36): the rebuild makes it when a new game
// queues SCSelect(galaxy) (whose shouldRun is a use) and when a save's view
// chunk is read.
void fillDisasterCalendar(Simulation& sim);

// Making the galaxy, the destination star and the planet: the command
// steps SCSelect (s7:532E, calcMe s7:53F4) and SCGenKids (s7:521C, calcMe
// s7:5260), both priority 12999, and the object creators they use.
class NewGame {
public:
    static constexpr uint16_t kStepPriority = 12999;

    bool load(const GameData& data, std::string* error = nullptr);
    UniverseTables& tables() { return m_tables; }

    // s2:087E, "New Game": two players (1, and 2 the rebels), then
    // SCSelect(galaxy) and one turn (s7:838E), and the turn counter back to
    // 0 (s7:8334).
    void start(Simulation& sim);
    // IMPROVED (I92): the star selection brought up to date (modern planet
    // lists, added stars; sim/modern_galaxy.hpp). Call after load().
    void modernize();
    // The Destination Selection's Launch (s8:BC30): SCSelect(star), a turn,
    // turn 0. `star` is 1..21 (registry 0x36 +0x0E, s2:D818).
    void selectStar(Simulation& sim, uint16_t star);
    // The planet chosen in orbit (s9:0170): SCSelect(planet), a turn, turn 0.
    void selectPlanet(Simulation& sim, Handle planet);

    std::unique_ptr<Step> makeSelectStep(Handle target);
    std::unique_ptr<Step> makeGenKidsStep(Handle target);

    // The object creators (g_objectDb +0x2E table): the galaxy (s6:EBEE),
    // a star (s6:EC36) and a planet (s6:ECAC) from their records. A star or
    // planet gets the next free handle; `id` only picks the record.
    void createGalaxy(Simulation& sim);
    Star& createStar(Simulation& sim, uint16_t id, Handle owner);
    Planet& createPlanet(Simulation& sim, uint16_t id, Handle owner);

    // s6:E372: every other object of the target's type is deleted and
    // cleared from the target's owner's children (the slot stays, at 0).
    void selectObject(Simulation& sim, Handle target);
    // s6:E44A: a site; as s6:E372, then every tile not owned by the site
    // is deleted with its building.
    void selectSite(Simulation& sim, Handle site);
    // Slot 5, "generate kids": the galaxy makes its stars (s7:1BE2), a star
    // its planets (s7:5FF6), a planet its sites (s7:3058,
    // Simulation::generateSites), a site nothing (s7:1972).
    void generateKids(Simulation& sim, Handle target);

private:
    void runOneTurnFromZero(Simulation& sim);

    UniverseTables m_tables;
};

} // namespace outpost::sim
