// The rebels' AI (helper object s5:A43E; code s5:A80E .. s5:BA28): when the
// player lands, the rebels land their own Seed elsewhere on the site and
// set up around it; afterwards they answer the player's buildings from a
// per-difficulty table (empty in v1.51, quirk Q71).
// findings/08-simulation.md §2.17.
#pragma once

#include "sim/map.hpp"
#include "sim/object_db.hpp"

#include <array>
#include <cstdint>

namespace outpost::sim {

class Simulation;
class Tile;

// The AI's statics (DGROUP 0x4E68..0x4E78 and the two cursors in the far
// data segment at 0x4230 / 0x4236). Index 0 is the surface, 1 underground.
struct RebelAi {
    std::array<MapCell, 2> cursor{};       // s10:4230 / s10:4236
    std::array<int16_t, 2> step{};         // 0x4E68 / 0x4E6C
    std::array<int16_t, 2> direction{};    // 0x4E6A / 0x4E6E
    bool chapGiven{false};                 // 0x4E78
    Handle colony;                         // 0x4E70: colony 2
};

// s6:9600 -> s5:A80E: the player put `type` down on `site` (SCPutBldg).
void rebelsHear(Simulation& sim, uint16_t type, Handle site);

// s6:33ED -> s5:A89E: a rebel Seed's colony is set up around its hub.
void rebelSetup(Simulation& sim, const Tile& hub);

// s6:78B8's scripted rebel builds: turns 15..20 an L pipe at the surface
// cursor's x - 3 - (turn - 15), turn 21 a Tokamak at x - 9 (s5:A54C);
// turn 152, with colony 2 the rebels', an X pipe at the cursor and, with no
// smelter (group 1, s8:4F54), a Smelter on the spiral (s5:A49A).
void rebelCalendar(Simulation& sim);

} // namespace outpost::sim
