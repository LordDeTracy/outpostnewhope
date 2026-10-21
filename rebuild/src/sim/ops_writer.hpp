#pragma once

#include "sim/ops_loader.hpp"

#include <cstdint>
#include <vector>

namespace outpost::sim {

class Simulation;

// Writes the simulation as a version-4 save ("SC004", what v1.51 writes,
// s2:6D8A): the registry chunks in the order of DGROUP 0x320 (0x01
// mothership, 0x02 view, 0x03 build menu, 0x04 options, 0x05, 0x06 alerts,
// 0x07, 0x14 trade, 0x15, 0x16 AI managers), then s2:6EEE's group (0x08,
// 0x09 handle counters, 0x0A turn and galaxy, 0x0C-0x13 object tables,
// 0x17 vehicles, 0x0B). The layouts are the loaders' (ops_loader.cpp);
// `extras` holds what the simulation does not model (from loadOps, or the
// defaults for a new game).
std::vector<uint8_t> writeOps(Simulation& sim, const OpsExtras& extras = {});

} // namespace outpost::sim
