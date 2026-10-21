#pragma once

#include "sim/object_db.hpp"
#include "sim/simulation.hpp"

#include <array>
#include <cstdint>
#include <string>
#include <utility>
#include <vector>

namespace outpost::data { class OpsSave; }

namespace outpost::sim {

// What a save holds that the simulation does not model, kept so that a
// loaded game is written back unchanged (ops_writer). A new game starts
// from the defaults.
struct OpsExtras {
    // Chunk 0x0A: db +8 (the galaxy that follows is Simulation::galaxy()).
    uint16_t dbWord8{0};
    // Chunk 0x04 (s3:5E56): the AI name and the player name (inferred).
    std::string aiName{"Aphrodite"};          // IMPROVISED default (TUTOR.OPS's)
    std::string playerName{"Anonymous Bosch"};// IMPROVISED default (TUTOR.OPS's)
    // Chunk 0x02, the view (registry 0x2F, s4:0000: current planet +0x16,
    // star +0x1A, site +0x20, colony +0x24, and a list of positions), kept
    // as bytes. Empty: written as zeros of its shortest layout (IMPROVISED,
    // I22).
    std::vector<uint8_t> view02;
    // Chunk 0x05, the planet window (registry 0x2D, ctor s3:3E3C, icon
    // PLNTICON; s3:3FC2 / s3:404A): the globe's rotation frame (+0x24,
    // 0..15), its mode (+0x6A: 1 forward, 3 back, 2 and 4 stopped; 4 to
    // start with, s3:4674) and whether its 500 ms timer runs (+0x7E).
    struct PlanetWindow {
        uint16_t frame{0};
        uint16_t mode{4};
        uint16_t spinning{0};
    } planetWindow;
    // Chunk 0x06 alerts (s3:0C7C): the posted alerts {+4, +6}, words +0x0E
    // and +0x10, and the rows of the alert table (DGROUP 0xE28, 8 bytes a
    // row) other than the ten switches the simulation keeps; -1 = the
    // EXE's starting value.
    std::vector<std::pair<uint16_t, uint32_t>> alerts;
    uint16_t alertsWordE{0}, alertsWord10{0};
    std::array<int32_t, 19> alertRows{-1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
                                      -1, -1, -1, -1, -1, -1, -1, -1, -1};
    // Chunk 0x14: the agreements' dwords +4 and +8 (parallel to
    // Simulation::tradeAgreements()).
    std::vector<std::pair<uint32_t, uint32_t>> tradeDwords;
    // Chunk 0x15, "Build in Rebel Colony" (dialog 6234, registry 0x3F, ctor
    // s2:C72A): the turn until which the rebels are busy with the player's
    // last order (+0x0E = turn + the building's build time, s2:C79A; no new
    // order before it has passed, s2:C83A).
    uint32_t rebelBusyUntil{0};
    // Chunk 0x16: word +0x22 and the managers' names (parallel to
    // Simulation::aiManagers()).
    uint16_t aiWord22{0};
    std::vector<std::string> aiNames;
};

// What a loaded save contained besides the objects themselves.
struct OpsLoadInfo {
    int version{0};                       // 1 ("SC001", TUTOR.OPS) or 4 ("SC004", v1.51)
    uint32_t turn{0};
    std::array<uint32_t, 9> lastHandle{}; // chunk 0x09, per object type
    size_t objects{0};
    OpsExtras extras;
};

// Loads a .OPS save
// (specs/001-outpost-reverse-engineering/contracts/ops-save-format.md) into
// an empty Simulation: stars, planets, sites, colonies, tiles, units,
// buildings and players under their saved handles, the turn, the handle
// counters, the build menu, the mothership, difficulty and options, alert
// switches, trade agreements and AI managers. Version-1 saves are
// translated the way the EXE does (s2:73EA building types, s2:72BC
// products, s2:738C alert rows).
bool loadOps(Simulation& sim, const data::OpsSave& save, OpsLoadInfo* info = nullptr,
             std::string* error = nullptr);

// The save-version translations (s2:73EA, s2:72BC); identity from version 2.
uint16_t translateType(int version, uint16_t type);
uint16_t translateProduct(int version, uint16_t product);
// s2:738C: a version-1 alert word's row in the alert table.
uint16_t translateAlertRow(uint16_t index);

} // namespace outpost::sim
