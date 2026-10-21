#pragma once

#include "sim/ledger.hpp"
#include "sim/object_db.hpp"
#include "sim/step_queue.hpp"

#include <cstdint>
#include <memory>
#include <string_view>

namespace outpost::sim {

class Colony;

// Per-turn step type codes (Sim::enqueueTurnSteps s6:D2B0; the step's
// priority is code - 1). 2000 is unused.
namespace stepcode {
constexpr uint16_t EndSim = 1000, PrelimAlloc = 3000, Morale = 4000, Event = 5000,
                   Power = 6000, Factory = 7000, Mines = 8000, Pop = 9000,
                   Move = 10000, AiInput = 11000, RchSched = 12000, Construct = 13000,
                   ProdSched = 14000, RoboMove = 15000, Setup = 16000;
// IMPROVED (I99): the rebuild's rebel manager (sim/rebel_ai_improved), after
// the AI managers and before SCMove.
constexpr uint16_t RebelManager = 10500;
// IMPROVED (I108): breakdowns (sim/breakdowns_improved), just before
// SCProdSched; its priority is the code itself (14000 > 13999).
constexpr uint16_t Breakdowns = 14001;
}

// SCAddSpew(colony, amount), priority 1000 (ctor s6:68DE, calcMe s6:6926):
// adds `amount` Sewage to the tile of the colony's first SPEW (group 10);
// lost if the colony has none.
std::unique_ptr<Step> makeAddSpewStep(Handle colony, int16_t amount);

// SCStarve(colony, fed, population), priority 4999 (ctor s6:AE66): queued by
// SCPop when the colony's food feeds fewer than its population. On queueing
// (shouldRun s6:AF08) it draws how many die: random 1..3, but always 1 on
// Beginner/Easy and 2..3 on Hard; calcMe (s6:AEC0) kills them, oldest first.
// The fed/population arguments are stored but unused.
std::unique_ptr<Step> makeStarveStep(Handle colony, uint32_t fed, uint32_t population);

// The unnamed step at s6:9944 (priority 4999) that moves `amount` people
// from one colony to another (defections, s8:0340 / s8:05D8). When queued
// (shouldRun s6:9A02) it takes them from the source at random ages
// (s7:3694: random(0, 90) per pick); calcMe (s6:99C4) adds them to the
// destination. A source left empty is handed to the other player (s8:349E).
std::unique_ptr<Step> makeMigrateStep(Handle from, Handle to, int32_t amount);

// SCEndSim (s6:6FF6, priority 999; endsim.cpp): the all-dead message, the
// lost game, victory, trade upkeep and the RoboCmd tables.
std::unique_ptr<Step> makeEndSimStep();

// SCMove (s8:0C00, priority 9999; trucking.cpp): RoboCmds claim robot kits
// from warehouses, factories unload into warehouses, trucks carry ore from
// mines to smelters (automatic trucking) and metals from smelters to
// storage tanks.
std::unique_ptr<Step> makeMoveStep();

// SCMoveBas (ctor s7:E8A0, priority 10000): a truck load scheduled by SCMove
// for the next turn; it is added to the tile's Bas if a building of `type`
// is still there (s7:EA50), otherwise lost.
std::unique_ptr<Step> makeMoveBasStep(std::unique_ptr<Ledger> load, uint16_t type, Handle tile);

// SCAiInput (s7:E0D4, priority 10999; ai.cpp): the AI managers build in
// their colonies along their emphasis' sequence of building groups.
std::unique_ptr<Step> makeAiInputStep();

// SCRoboMove (s8:290E, priority 14999; ai.cpp): explorers reveal colony 1's
// hidden mine sites; the vehicle manager is not modelled.
std::unique_ptr<Step> makeRoboMoveStep();

// SCKillBldg(building) (ctor s7:E4FA, priority 16000, so it runs right after
// the step that queued it): destroys the building object (s6:E332).
std::unique_ptr<Step> makeKillBuildingStep(Handle building);

// SCStep::makeByType (s6:9C90). Returns nullptr for unknown codes.
std::unique_ptr<Step> makeTurnStep(uint16_t code);

// Sim::enqueueTurnSteps (s6:D2B0): queues codes 16000, 15000, ..., 3000, 1000,
// then releases the scheduled steps that are due (s6:D6B2).
void enqueueTurnSteps(Simulation& sim);

// ── Colony economy (findings/08-simulation.md §3) ─────────────────────────
void colonySumTileLedgers(Simulation& sim, Colony& c);           // s8:5464
void colonyClearAlloc(Simulation& sim, Colony& c, bool tilesToo); // s8:56D6
void colonyAllocate(Simulation& sim, Colony& c);                 // s8:518C
// s8:52B8: take `amount` of `res` out of the colony total and, except for
// People, out of the tiles' Bas ledgers in tile order.
void colonyConsume(Simulation& sim, Colony& c, int res, uint32_t amount);

} // namespace outpost::sim
