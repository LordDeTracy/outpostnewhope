// IMPROVED (I92): the star selection brought up to date (2025). The 21
// systems of v1.51 get as many planets as are known today (confirmed and
// candidate; a system with none known keeps one world of its original list
// that can be landed on, or its original list when it has none), and nine
// nearby systems with known planets are added. Planets come from the
// original templates 1..10 (looks, facts, hostility): 1 hot rocky (9), 2
// warm (7), 3 temperate (2), 4 the most benign (1), 5..7 gas giants (no
// sites), 8 cold (8), 9 small rocky (4), 10 rocky (3). A planet the
// original tables do not have (one more than the original list holds of
// its template) gets its sites made for the game (data/terrain_gen.hpp).
#pragma once

#include "data/star_table.hpp"
#include "sim/new_game.hpp"

#include <string>
#include <vector>

namespace outpost::sim {

// Rewrites the tables' star rows and appends the new stars (ids 22..).
void modernizeGalaxy(UniverseTables& tables);

// A star's data window as known today (class, mass, distance, travel time,
// the chance of a habitable planet), for the 21 and the added stars.
const data::StarRecord* modernStarRecord(const std::string& name);

// A known planet's name ("Proxima Centauri b") and its Star System window
// facts (the nine of controls 437..445, as the Sol bodies' are written), by
// its star and place in the star's list; empty for a world the original
// list keeps.
std::string knownPlanetName(const std::string& star, size_t index);
std::vector<std::string> knownPlanetFacts(const std::string& star, size_t index);

// Whether a star row has a world with sites (templates 5..7 have none).
bool hasLandableWorld(const UniverseTables& tables, const UniverseTables::StarRow& row);

} // namespace outpost::sim
