#pragma once

// Units: robots and trucks (DB type 6), linked to a tile's container +0x1E.
// findings/08-simulation.md §1.7.

#include "sim/object_db.hpp"

#include <cstdint>

namespace outpost::sim {

class Colony;
class Simulation;
class Tile;

// Product A ids, which are also unit kinds (names: s5:C222).
namespace product {
constexpr uint16_t Dozer = 1, Digger = 2, Miner = 3, Truck = 4, Explorer = 5,
                   PowerSat = 6, FuelCells = 7, RepairRobots = 8, AirRobots = 9,
                   MicroRobots = 10, LawRobots = 11, HumanoidWorkers = 12,
                   RoadMaterials = 13, RobotSpareParts = 14, NavSat = 16,
                   SolarPowerSat = 17, OrbitalObserver = 18, WeatherSat = 19;
}

// A unit (DB type 6). Its kind (+0x0C) is a product A id.
class Unit : public DbObject {
public:
    uint16_t kind{0};
};

// s7:7C50: create `n` units of `kind` on the tile (reusing empty slots of
// its container first, s7:1E96). Trucks also count in tile +0x34.
void addUnits(Simulation& sim, Tile& tile, int32_t n, uint16_t kind);
// s7:6E9C: destroy up to `n` units of `kind`, in container order; their
// slots become empty. Tile +0x34 is not lowered (quirk Q37).
void removeUnits(Simulation& sim, Tile& tile, int32_t n, uint16_t kind);
// s7:730A: destroy every unit on the tile.
void clearUnits(Simulation& sim, Tile& tile);
// s8:1A30 (for trucks): the units of `kind` on the tile.
int32_t countUnits(const Simulation& sim, const Tile& tile, uint16_t kind);

// Explorers are not units: the colony counts them (+0x20E). s8:48E0 adds,
// at most 10 in all; s8:4900 takes one away (never below 0).
void addExplorers(Colony& c, int16_t n);
void loseExplorer(Colony& c);

// s8:53BA: the colony's units of `kind` (counted by SCSetup / SCPrelimAlloc,
// +0x14E) minus those busy (+0x1A2), or 0.
int32_t availableUnits(const Colony& c, uint16_t kind);
// s8:43CC: the colony loses `n` robots of `kind`. Explorers: one, whatever
// `n`. Otherwise, if any is available, the count drops by `n` and each RoboCmd
// (any state, tile order) gives up its robots of that kind until `n` are gone.
void loseRobots(Simulation& sim, Colony& c, int16_t n, uint16_t kind);
// s8:387E: a tile's trucks go from `before` to `now`. Spare trucks go back
// to the colony's RoboCmds (s7:CC44) or, with none, onto its SeedCommand's
// tile (s7:7C50); more are taken from the RoboCmds (s7:CE72) or the
// SeedCommand's tile (s7:6E9C).
void retaskTrucks(Simulation& sim, Colony& c, int16_t now, int16_t before, Tile& tile);
// s8:44D8: as loseRobots, but only idle robots leave their RoboCmds
// (s7:D00C); a new Command center's parent gives its robots this way.
void removeRobots(Simulation& sim, Colony& c, int16_t n, uint16_t kind);

} // namespace outpost::sim
