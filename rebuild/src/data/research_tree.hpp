#pragma once

#include <cstdint>
#include <string>
#include <vector>

namespace outpost::data {

class NeImage;
class StringTable;

// The two research trees stored in OUTPOST.EXE's DGROUP as pre-order arrays
// of {word stringId, word childCount, word cost, word id}:
//   main tree     at DGROUP 0x3198: topics 0..111 (+112 "None", 113 "Pause"),
//                 id field is 0 and the array index is the id;
//   advanced tree at DGROUP 0x0D5E: topics 114..130 with explicit ids.
// A topic is complete when the player's remaining[id] reaches 0 (s7:25B2).
struct ResearchTopic {
    uint16_t id{0};
    uint16_t stringId{0};
    std::string name;
    uint16_t childCount{0};
    uint16_t cost{0};          // research points (25/50/75/100/200)
    int parent{-1};            // topic id of the parent, -1 for a root
    bool advanced{false};      // from the second tree
};

class ResearchTree {
public:
    bool load(const NeImage& exe, const StringTable& strings);

    const std::vector<ResearchTopic>& topics() const { return m_topics; }
    const ResearchTopic* find(uint16_t id) const;
    const std::string& error() const { return m_error; }

private:
    bool readTree(const NeImage& exe, const StringTable& strings, uint16_t offset,
                  bool advanced);

    std::vector<ResearchTopic> m_topics;
    std::string m_error;
};

} // namespace outpost::data
