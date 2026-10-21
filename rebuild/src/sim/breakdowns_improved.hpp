// IMPROVED (I108): building breakdowns. The manual and its building tables
// give each structure a "Chance of Breakdown" (Agri Dome 20, Command Center
// 50, SPEW 40, Tokamak 5 brought / 30 built, ...) and say the Command
// Center's engineering team repairs broken structures, but v1.51 never
// breaks anything ("Breakdown Status:" is only a label; findings/14 §2).
//
// The rebuild's rules: each turn an operational building of a player colony
// breaks with chance (manual value x difficulty factor) / 5000 (Beginner
// none, Easy x0.5, Medium x1, Hard x1.5; not before turn 20), drawn from a
// generator of its own so v1.51's random sequence is untouched. A broken
// building is not resumed by SCProdSched, so it stands suspended and does
// nothing. The colony's engineers (an operational Command Center; a broken
// one repairs itself) repair it in 8 turns, twice as fast with Repair
// Robots in a warehouse and an operational Robot Command; without a Command
// Center the repair waits. Life support (Command Center, CHAP) is repaired
// by the next turn. The state is saved in the extension chunk
// ("breakdowns").
#pragma once

#include "sim/object_db.hpp"

#include <cstdint>
#include <map>
#include <memory>

namespace outpost::sim {

class Building;
class Simulation;
class Step;

struct BreakdownState {
    std::map<uint32_t, int16_t> broken;   // building handle -> repair work left
};

// The manual's chance for a building type (0 = never breaks).
int16_t breakdownChance(uint16_t type);
// True while the building is broken (SCProdSched leaves it suspended).
bool breakdownBlocks(const Simulation& sim, const Building& b);
// Repair work left (turns at the normal rate), or -1 when not broken.
int16_t repairLeft(const Simulation& sim, const Building& b);

constexpr int16_t kRepairWork = 8;

// IMPROVED (I109): a disaster damages a building: it is broken as by a
// breakdown, with `work` turns of repair (life support: 1). Nothing if it
// is broken already. Posts notice code 4.
void damageBuilding(Simulation& sim, Building& b, int16_t work);

// Notices (channel kBreakdownNotice; value: the building type): code 1 broke
// down, 2 repaired, 3 a life-support building broke down (an emergency: it
// is repaired by the next turn, so the colony is short of air for a turn),
// 4 damaged by a disaster (I109).
constexpr uint16_t kBreakdownNotice = 0x7D;

// The turn step, just before SCProdSched; queued only from Easy up.
std::unique_ptr<Step> makeBreakdownStep();

} // namespace outpost::sim
