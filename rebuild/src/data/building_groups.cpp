#include "data/building_groups.hpp"

#include "data/ne_image.hpp"

namespace outpost::data {

namespace {

struct GroupDir {
    int group;
    uint16_t offset;   // DGROUP offset of the uint16 type list
    uint16_t count;
};

// Immediates from the group builder s2:BDE0 (OUTPOST.EXE v1.51).
constexpr GroupDir kGroups[] = {
    {1, 0x06E4, 3}, {2, 0x06EA, 2}, {3, 0x06EE, 2}, {4, 0x06F2, 2}, {5, 0x06F6, 4},
    {6, 0x06FE, 2}, {7, 0x0702, 3}, {8, 0x0708, 3}, {9, 0x070E, 3}, {10, 0x0714, 3},
    {11, 0x071A, 2}, {12, 0x071E, 7}, {13, 0x072C, 6}, {14, 0x0738, 3}, {15, 0x073E, 3},
    {16, 0x0744, 4}, {17, 0x074C, 2}, {18, 0x0750, 3}, {19, 0x0756, 2}, {20, 0x075A, 2},
    {21, 0x075E, 3}, {22, 0x0764, 3}, {23, 0x076A, 3}, {24, 0x0770, 2}, {25, 0x0774, 4},
    {26, 0x077C, 2}, {27, 0x0780, 1}, {28, 0x0782, 2}, {29, 0x0786, 2}, {30, 0x078A, 2},
    {31, 0x078E, 2}, {32, 0x0792, 2}, {33, 0x0796, 4}, {34, 0x079E, 1}, {35, 0x07A0, 2},
    {36, 0x07A4, 1}, {37, 0x07A6, 6}, {38, 0x07B2, 1}, {39, 0x07B4, 3}, {40, 0x07BA, 45},
    {41, 0x0814, 3}, {42, 0x081A, 1}, {43, 0x081C, 75}, {44, 0x08B2, 6}, {45, 0x08BE, 4},
    {46, 0x098C, 1}, {47, 0x08C6, 53}, {48, 0x0930, 46}, {49, 0x098E, 9}, {50, 0x09A0, 26},
    {51, 0x09D4, 8}, {52, 0x09E4, 74}, {54, 0x0A78, 2}, {55, 0x0A7C, 1}, {56, 0x0A7E, 1},
    {57, 0x0A80, 3}, {58, 0x0A86, 2}, {60, 0x0A8A, 27}, {61, 0x0AC0, 22}, {62, 0x0AEC, 62},
    {63, 0x0B68, 70}, {64, 0x0BF4, 1}, {65, 0x0BF6, 3}, {66, 0x0BFC, 3}, {67, 0x0C02, 10},
    {68, 0x0C16, 36}, {69, 0x0C5E, 2}, {70, 0x0C62, 68},
};

} // namespace

bool BuildingGroups::load(const NeImage& exe) {
    m_groups.clear();
    auto d = exe.dgroup();
    for (const auto& g : kGroups) {
        if (g.offset + 2u * g.count > d.size()) return false;
        auto& list = m_groups[g.group];
        for (uint16_t i = 0; i < g.count; ++i) {
            const size_t p = g.offset + 2u * i;
            list.push_back(static_cast<uint16_t>(d[p] | (d[p + 1] << 8)));
        }
    }
    // Sanity check against v1.51: group 12 starts with Command (55).
    return !m_groups[12].empty() && m_groups[12][0] == 55;
}

bool BuildingGroups::contains(int group, uint16_t type) const {
    auto it = m_groups.find(group);
    if (it == m_groups.end()) return false;
    for (uint16_t t : it->second)
        if (t == type) return true;
    return false;
}

const std::vector<uint16_t>& BuildingGroups::members(int group) const {
    static const std::vector<uint16_t> empty;
    auto it = m_groups.find(group);
    return it == m_groups.end() ? empty : it->second;
}

} // namespace outpost::data
