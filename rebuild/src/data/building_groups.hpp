#pragma once

#include <cstdint>
#include <map>
#include <vector>

namespace outpost::data {

class NeImage;

// The original's 70 building-type groups (g_bldgGroups, built by s2:BDE0;
// membership test BldgGroups::contains, s2:C6AE). The group directory
// (DGROUP offset + count per group) is code knowledge; the type lists are
// read from the player's OUTPOST.EXE. Groups 53 and 59 are never set (empty).
//
// Groups used by the simulation so far:
//   12  power producers polled by SCPower: Command, SeedPower, SolrPwrRecvr,
//       MShipTokamak, Tokamak, Tokamak2, UGGeoTherm
//   40  underground types (also selects the underground sprite variants)
class BuildingGroups {
public:
    static constexpr int kPowerProducers = 12;
    static constexpr int kUnderground = 40;

    bool load(const NeImage& exe);
    bool contains(int group, uint16_t type) const;
    const std::vector<uint16_t>& members(int group) const;

private:
    std::map<int, std::vector<uint16_t>> m_groups;
};

} // namespace outpost::data
