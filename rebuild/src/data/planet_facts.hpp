// A planet's fact sheet in the Star System window (dialog 4048, controls
// 437..445, DGROUP 0x139A): the RCDATA record of a Sol body that the
// planet's template copies (findings/11-new-game.md §6a).
#pragma once

#include "data/ne_image.hpp"

#include <cstdint>
#include <string>
#include <vector>

namespace outpost::data {

// s3:4E9E: RCDATA DGROUP 0x1384[template] (1 Mercury 333, 2 Venus 334,
// 3 Moon 338, 4 Mars 335, 5 Jupiter 336, 6 Saturn 337, 7 Neptune 339,
// 8 Pluto 340, 9 Ceres 341, 10 Phobos 342): nine strings, equatorial
// diameter, mass, rotation, surface gravity, distance (AU), solar energy,
// temperature, escape velocity, atmosphere. Empty if there is none.
std::vector<std::string> planetFacts(const NeImage& exe, uint16_t planetTemplate);

} // namespace outpost::data
