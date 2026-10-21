#pragma once

#include <array>
#include <cstdint>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

// Resource ids used throughout the original (ResourceName, s5:C0D8).
// Names: string table id 1462 + id for 1..31, 33 -> 1494 (MPG),
// 35 -> 1495 (Power), 36 -> 1509 (People); 32 and 34 are unnamed.
namespace res {
constexpr int OreLifeA = 1, OreLifeB = 2, OreLifeC = 3;
constexpr int OreA = 4, OreB = 5, OreC = 6, OreD = 7;
constexpr int OreFusionA = 8, OreFusionB = 9, OreFusionC = 10;
constexpr int OreMinA = 11, OreMinB = 12, OreMinC = 13;
constexpr int LifeA = 14, LifeB = 15, LifeC = 16;
constexpr int MetalA = 17, MetalB = 18, MetalC = 19, MetalD = 20;
constexpr int PrecA = 21, PrecB = 22;
constexpr int MinA = 23, MinB = 24, MinC = 25;
constexpr int FusionA = 26, FusionB = 27, FusionC = 28;
constexpr int Luxury = 29, Food = 30, Sewage = 31, MPG = 33;
constexpr int Power = 35, People = 36;
constexpr int Count = 37;   // long[37] arrays are indexed by id; [0] is unused
} // namespace res

// One BLDGBLD.DAT record (construction), struct size 0x98 in the original
// (BldgBld::parseRecord, s7:4D3A).
struct BldgBldRecord {
    std::string name;                         // the game skips it; kept for tooling
    std::array<int32_t, res::Count> need{};   // per resource id
    uint16_t word94{0};                       // numeric field 37 (+0x94)
    uint16_t word96{0};                       // numeric field 38 (+0x96)
};

// One BLDGOPS.DAT record (operation), struct size 0xAE
// (BldgOps::parseRecord, s7:4C52). Bytes +0xA4..+0xAD are runtime state.
struct BldgOpsRecord {
    std::string name;
    std::array<int32_t, res::Count> need{};
    std::array<uint16_t, 8> words{};          // numeric fields 37..44 (+0x94..+0xA2)
};

// Decode the obfuscation used by both files (LoadEncodedDataFile, s7:4E70):
// every byte the MS C ctype table does not flag as _CONTROL gets +0x80.
std::vector<uint8_t> decodeBldgFile(std::span<const uint8_t> raw);

std::vector<BldgBldRecord> parseBldgBld(std::span<const uint8_t> raw);
std::vector<BldgOpsRecord> parseBldgOps(std::span<const uint8_t> raw);

} // namespace outpost::data
