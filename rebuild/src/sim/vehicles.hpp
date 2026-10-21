// Truck trips and the vehicle manager (DGROUP 0x5A64, s8:7A76): the player's
// truck routes (s8:1C3E) send loads over the map. findings/10-map.md §3e.
#pragma once

#include "sim/ledger.hpp"
#include "sim/map.hpp"
#include "sim/object_db.hpp"

#include <cstdint>
#include <memory>
#include <vector>

namespace outpost::sim {

class Simulation;
class Colony;

// A trip (0x2A bytes, vtable s8:78DE; ctors s8:6590 Bas, s8:666E cargo
// table, s8:675C product A, s8:6838 product B). One kind of load is set.
struct Trip {
    std::vector<Handle> route;      // +0x04 the stops still ahead (copy of the tile's +0x36)
    Handle home;                    // +0x08 the tile the trucks came from
    uint16_t bas{0};                // +0x0C a Bas resource
    std::unique_ptr<Ledger> cargo;  // +0x0E a table of Bas resources (5x5 SparseTable)
    uint16_t productA{0};           // +0x12
    uint16_t productB{0};           // +0x14
    uint32_t quantity{0};           // +0x16 (the cargo's total for a table)
    MapCell pos;                    // +0x1A
    Handle next;                    // +0x20 the stop driven to
    int16_t points{0};              // +0x24 movement points (+60 a turn)
    int16_t trucks{0};              // +0x26 trucks on this trip
    uint16_t waiting{0};            // +0x28 waiting for a monorail train
    Handle boardedAt;               // rebuild only (I27): the station it got on at
};

// A monorail train (0x14 bytes, ctor s7:AEFA; vehicle manager list +4).
struct Train {
    Handle station;                 // +0x04 the MonoStation tile it belongs to
    MapCell pos;                    // +0x08
    uint16_t direction{0};          // +0x0E 1 y-1, 2 x+1, 3 y+1, 4 x-1; 0 not yet chosen
    std::vector<Trip*> riders;      // +0x10
};

// s8:79B2 / s8:79F2: a station's train is made and dropped.
void addTrain(Simulation& sim, Handle stationTile);
void removeTrain(Simulation& sim, Handle stationTile);

// s8:1C3E: every tile of the colony with trucks and a route sends trips.
void dispatchRoutes(Simulation& sim, Colony& colony);
// s8:7A76: move every trip, then drop the finished ones.
void moveTrips(Simulation& sim);
// s8:666E etc.: a trip starting at its home tile (pos and first stop set).
Trip& startTrip(Simulation& sim, Trip trip);

} // namespace outpost::sim
