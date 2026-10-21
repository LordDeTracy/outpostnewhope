// Text for the research window. IMPROVED (I103): neither OUTPOST.EXE nor
// OUTHLP.HLP holds a description of a research topic (the EXE has only the
// names, strings 1200..1330, and the discoveries', 1636 + id); the
// descriptions here are the rebuild's own. The effect lines say what the
// rebuild's simulation does with a topic or discovery (findings/08 §2.10).
#pragma once

#include <cstdint>

namespace outpost::app {

// A sentence or two about the topic; nullptr for the tree's roots.
const char* topicBlurb(uint16_t topic);
// What completing the topic itself does (s7:26AC and the sim's readers of
// remaining[]); nullptr if nothing.
const char* topicEffect(uint16_t topic);
// What a discovery does (s3:A69C, the build menu s3:ABD2, the sim's
// readers of discoveries[]); nullptr if it is only counted.
const char* discoveryEffect(uint16_t discovery);
// One of the seven topics the starship needs (SCEndSim, victory).
bool victoryTopic(uint16_t topic);

} // namespace outpost::app
