// Building type names (s5:BD80): the string id per building type. Types
// 67..69 (road construction) return DGROUP names instead (quirk Q63).
#pragma once

#include "data/ne_image.hpp"
#include "data/string_table.hpp"

#include <array>
#include <cstdint>
#include <string>

namespace outpost::data {

inline constexpr std::array<uint16_t, 128> kBuildingNameIds = {
    0, 1063, 1064, 1065, 1061, 1062, 1063, 1065, 1061, 1062,
    1026, 1048, 1066, 1527, 1526, 1027, 1528, 1028, 1029, 1030,
    1030, 1030, 1529, 1530, 1531, 1529, 1530, 1032, 1032, 1032,
    1033, 1033, 1033, 1068, 1034, 1034, 1034, 1035, 1035, 1035,
    1036, 1036, 1037, 1037, 1038, 1039, 1039, 1040, 1040, 1041,
    1041, 1046, 1046, 1066, 1066, 1048, 1532, 1532, 1049, 1049,
    1533, 1533, 1534, 1535, 1536, 1537, 1538, 0, 0, 0,
    1538, 1067, 1539, 1539, 1539, 1069, 1540, 1541, 1542, 1050,
    1050, 1050, 1051, 1051, 1053, 1053, 1053, 1054, 1054, 1054,
    1055, 1057, 1057, 1056, 1056, 1056, 1543, 1543, 1544, 1544,
    1545, 1058, 1059, 1059, 1546, 1546, 1547, 1538, 1052, 1052,
    1548, 1549, 1539, 1539, 1539, 1045, 1042, 1043, 1044, 1045,
    1042, 1042, 1550, 1551, 1552, 1553, 1554, 1555,
};

// s5:BD80: the type's name as the game shows it. Types 128..137 are the
// starship's cargo (switch cases 128..137: strings 1556..1565, Colonists,
// Food, Life Support, Solar Power Sat, Geo Probe, WeatherSat, Interstellar
// Probe, ComSat, SpySat, ULBI Probe).
inline std::string buildingName(const NeImage& exe, const StringTable& strings, uint16_t type) {
    if (type >= 67 && type <= 69) {                       // DGROUP 0x4E7A, 0x4E88, 0x4E96
        static constexpr uint16_t kRoadConst[3] = {0x4E7A, 0x4E88, 0x4E96};
        if (auto s = exe.dgroupString(kRoadConst[type - 67])) return *s;
        return {};
    }
    if (type >= 128 && type <= 137) return strings.get(uint16_t(1556 + type - 128));
    if (type >= kBuildingNameIds.size() || kBuildingNameIds[type] == 0) return {};
    return strings.get(kBuildingNameIds[type]);
}

} // namespace outpost::data
