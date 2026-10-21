// IMPROVED (I109): disasters by planet class. The manual's table gives each
// planet class a frequency (0..10) for six events; v1.51 instead strikes
// each of its six message-only kinds once, at fixed turns, on Medium and
// Hard, whatever the planet (findings/14 §3). The rebuild replaces those six
// with the manual's events on the planet the player landed on:
//
//   event (v1.51 kind, log)     Mercury Venus Mars Moon Phobos Ceres Pluto
//   meteorite strike  (1, 22)      7      1     4    7     7      7     5
//   earthquake        (2, 23)      7      6     5    3     3      2     3
//   volcanic eruption (3, 24)      2      7     0    0     2      0     0
//   sand storm        (4, 28)      0      0     4    0     0      0     0
//   electrical storm  (5, 31)      0      3     3    0     0      0     0
//   solar flare       (6, 36)     10      6     2    4     3      5     0
//
// (Planet templates: 1 Mercury, 2 Venus, 3 Moon, 4 Mars, 8 Pluto, 9 Ceres,
// 10 Phobos; 5..7 are gas giants. The sand storm uses the original's
// unused dust storm message, 28.) An event of frequency f strikes once in
// every window of 1000 / f turns (from turn 40; twice as long on Easy, three
// quarters on Hard, none on Beginner), at a place in the window drawn from
// the planet and the window, so no state is saved and v1.51's random
// sequence is untouched. Damage goes through the breakdown repairs (I108),
// and a DIRT within 5 protects a building:
//   meteorites   1-3 surface buildings; none with a Meteor Defense System
//                in a warehouse, one with Meteor Alert (discovery 3)
//   earthquake   1-3 underground buildings; halved with Earthquake
//                Prediction (22)
//   volcano      2-4 buildings anywhere; halved with Volcanic Prediction (24)
//   sand storm   each surface solar receiver, agri dome and comm tower,
//                one in two (one in four with Weather Prediction, 20)
//   electrical   1-2 power plants or comm towers (halved with Weather
//                Prediction)
//   solar flare  one surface building, and 1 in 100 colonists die unless
//                Solar Flare Alert (5) gave warning to take cover
#pragma once

#include <cstdint>

namespace outpost::sim {

class Simulation;

// The manual's frequency of event `kind` (1..6, as above) on a planet
// template; 0 when it never strikes there.
int disasterFrequency(uint16_t planetTemplate, int kind);
// True when the player's planet is one of the manual's classes: then the
// v1.51 schedule of kinds 1..6 is not used.
bool planetDisastersApply(const Simulation& sim);
// Called by SCEvent's calendar every turn.
void planetDisasters(Simulation& sim);

} // namespace outpost::sim
