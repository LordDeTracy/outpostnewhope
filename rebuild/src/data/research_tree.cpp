#include "data/research_tree.hpp"

#include "data/ne_image.hpp"
#include "data/string_table.hpp"

namespace outpost::data {

namespace {
constexpr uint16_t kMainTree = 0x3198;
constexpr uint16_t kAdvancedTree = 0x0D5E;
constexpr uint16_t kMainFirstString = 1200;      // "Top"
constexpr uint16_t kAdvancedFirstString = 1312;  // "Top"
} // namespace

bool ResearchTree::readTree(const NeImage& exe, const StringTable& strings,
                            uint16_t offset, bool advanced) {
    auto d = exe.dgroup();
    auto word = [&d](size_t p) { return static_cast<uint16_t>(d[p] | (d[p + 1] << 8)); };

    const uint16_t expectFirst = advanced ? kAdvancedFirstString : kMainFirstString;
    if (offset + 8u > d.size() || word(offset) != expectFirst) {
        m_error = "research table not found (unsupported OUTPOST.EXE version?)";
        return false;
    }

    // Parent links from the pre-order childCount: a stack of (id, children left).
    std::vector<std::pair<uint16_t, int>> stack;
    for (uint16_t i = 0;; ++i) {
        const size_t p = offset + 8u * i;
        if (p + 8 > d.size()) break;
        ResearchTopic t;
        t.stringId = word(p);
        if (t.stringId == 0) break;
        t.childCount = word(p + 2);
        t.cost = word(p + 4);
        t.id = advanced ? word(p + 6) : i;
        t.name = strings.get(t.stringId);
        t.advanced = advanced;
        if (advanced && find(t.id)) continue;   // "None"/"Pause" repeat ids 112/113

        while (!stack.empty() && stack.back().second == 0) stack.pop_back();
        if (!stack.empty()) {
            t.parent = stack.back().first;
            stack.back().second--;
        }
        if (t.childCount) stack.emplace_back(t.id, t.childCount);
        m_topics.push_back(std::move(t));
    }
    return true;
}

bool ResearchTree::load(const NeImage& exe, const StringTable& strings) {
    m_topics.clear();
    return readTree(exe, strings, kMainTree, false) &&
           readTree(exe, strings, kAdvancedTree, true);
}

const ResearchTopic* ResearchTree::find(uint16_t id) const {
    for (const auto& t : m_topics)
        if (t.id == id) return &t;
    return nullptr;
}

} // namespace outpost::data
