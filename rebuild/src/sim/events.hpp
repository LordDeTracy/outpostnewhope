#pragma once

#include "sim/object_db.hpp"
#include "sim/step_queue.hpp"

#include <cstdint>
#include <memory>

namespace outpost::sim {

class Building;
class Colony;
class Simulation;

// SCEvent (s6:74E4, priority 4999; findings/08-simulation.md §2.11): hot
// lab accidents, nano and Tokamak incidents, the morale crisis, the AI
// advisor, the plague and the scripted calendar, in that order.
std::unique_ptr<Step> makeEventStep();

// The incident step (base s6:6AF2, priority 4999): wrecks `target` and the
// buildings on the 8 tiles around it (s6:6B40), sparing terrain and robots.
// Hot lab accidents (s6:8698) also log message 0x1D.
std::unique_ptr<Step> makeIncidentStep(Handle colony, Handle target, bool hotLab);

// The scheduled disaster step (s6:90E6, priority 4999), kinds 1..8.
std::unique_ptr<Step> makeDisasterStep(uint16_t kind);

// s6:7742: an operational DIRT facility (group 24) within `radius` of `b`.
bool dirtProtects(Simulation& sim, const Building& b, int radius);

// s8:362E / s8:3698: start the plague in a colony / one plague tick.
void startPlague(Simulation& sim, Colony& c);
void plagueTick(Simulation& sim, Colony& c);

} // namespace outpost::sim
