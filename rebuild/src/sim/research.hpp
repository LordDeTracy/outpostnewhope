#pragma once

#include <cstdint>
#include <vector>

namespace outpost::sim {

class Player;
class Simulation;

// Research (findings/08-simulation.md §2.10). Labs work on one topic each;
// SCRchSched (and, for hot labs, SCFactory as well) calls Lab::produce,
// which calls researchStep.

// s7:2852: research points per lab turn, from colony 1's morale (the same
// speed bands as factories): <250 1 on odd turns, <450 1 on two turns in
// three, <550 1, <750 1 (2 every third turn), else 2.
int16_t researchPoints(Simulation& sim);

// s7:23E2: one turn of lab work on `topic`. A topic not started yet gets its
// cost from the lab's tree (hot labs: the advanced tree, UG labs: the main
// tree). Returns true when the topic is (or becomes) complete. A topic
// completes only when both its points and its minimum turns (25, counted
// once per turn) are used up.
// `bonus` (IMPROVED, I106) is added to the lab turn's points.
bool researchStep(Simulation& sim, Player& player, bool hotLab, uint16_t topic, int16_t bonus = 0);

// s7:26AC: what a completed topic does to the player's colonies.
void applyResearch(Simulation& sim, Player& player, uint16_t topic);

// s3:6CF8: the discoveries a completed topic grants (some only once a whole
// group of topics is complete). Discoveries always go to player 1.
void grantDiscoveries(Simulation& sim, uint16_t topic);

// s3:9488 (main tree) and s2:EEAC (hot-lab tree): whether the research
// tree window opens a topic to list its subtopics (s3:32F4 lists nothing
// otherwise), i.e. whether those can be chosen. A topic opens once it is
// complete, except: Robotics 1 (50) also needs Robotics 2 (77); Satellites
// and Probes (63) Optics (78); the hot-lab tree's Biology (115) needs
// Medicine (9), its Computer Science (119) Artificial Intelligence (46),
// its Physics (121) Quantum Mechanics (91); Replicator (125) needs Assembler
// (124) and Nanotechnology 1 (120) as well. `needs` gets the topics each
// rule asks for.
bool topicOpens(const Player& player, uint16_t topic);
std::vector<uint16_t> topicOpensNeeds(uint16_t topic);

// The same switch as a list, for the research window: each discovery the
// topic can grant, with the topics that must all be complete for it
// (empty: always; it may name the topic itself).
struct TopicGrant {
    uint16_t discovery{0};
    std::vector<uint16_t> needs;
};
std::vector<TopicGrant> topicGrants(uint16_t topic);

// s3:A69C: one discovery for player 1. 1 (Basic Research) cuts every
// started topic by 5 points (not below 25); every discovery is counted.
// The build-menu upgrades of discoveries 10..65 (s3:ABD2) are UI state and
// not modelled yet.
void grantDiscovery(Simulation& sim, uint16_t discovery);

} // namespace outpost::sim
