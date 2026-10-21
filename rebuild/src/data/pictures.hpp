// Building pictures and animation frames read from OUTPOST.EXE
// (findings/12-graphics.md).
#pragma once

#include "data/ne_image.hpp"

#include <array>
#include <cstdint>
#include <optional>
#include <string>
#include <utility>
#include <vector>

namespace outpost::data {

// A rectangle cut from a sprite sheet (sheet id of the DGROUP 0x172A list).
struct SpriteRect {
    uint16_t sheet{0};
    uint16_t x{0}, y{0}, w{0}, h{0};
};

// A building type's animation (DGROUP 0x3A4 rows): frames first..last of
// the frame table; mode 1 loops, 2 ping-pongs, 3 and 4 hold (s2:AE26).
struct Animation {
    uint16_t first{0}, last{0}, mode{0};
};

// A bitmap catalog entry (s3:830A, catalog row (id + 1) * 16): kind 1 a
// whole file, kind 2 a cut-out of a sheet, kind 3 a sound (467..503, s3:84F8),
// kind 4 a movie (156..240, the FLC files).
struct CatalogEntry {
    uint16_t kind{0};
    std::string file;      // kinds 1, 3, 4
    SpriteRect rect;       // kind 2
};

class BuildingPictures {
public:
    bool load(const NeImage& exe);

    // s3:878C: the sheet's file name ("tile1.bmp" ...); empty if none.
    const std::string& sheetName(uint16_t sheet) const;
    // s3:887A: the static picture of a building type 10..127 (catalog
    // segment +0x3382, row type - 10).
    std::optional<SpriteRect> picture(uint16_t type) const;
    // s2:ADA2: the type's animation, if it has one.
    std::optional<Animation> animation(uint16_t type) const;
    // s3:8018: a frame of the frame table (catalog segment +0x1FA0).
    std::optional<SpriteRect> frame(uint16_t id) const;
    // s4:214E: where a type's animation frames sit on its picture (DGROUP
    // 0x3E8E, {x, y} per type).
    std::pair<int16_t, int16_t> overlayOffset(uint16_t type) const;
    // s3:89F0: the terrain sheet of a planet's terrain set (planet record
    // +0x00; DGROUP 0x24BE) and the 107x46 picture of terrain type 1..9
    // on it (DGROUP 0x2554, {x, y, w, h}).
    const std::string& terrainSheet(uint16_t set) const;
    std::optional<SpriteRect> terrain(uint16_t kind) const;
    // s3:830A: catalog entry `id` (0..503). Known ranges: 13-76 research
    // pictures, 261-276 the planet's 16 rotation frames (sheets 1, 2),
    // 277-346 the site pictures 500..579.bmp.
    std::optional<CatalogEntry> catalog(uint16_t id) const;
    // s3:8096: the files behind sheets 1 and 2 for a planet template (DGROUP
    // 0x2526: 1 "204", 2 "208", 3 "220", 4 "211", 8 "222", 9 "218", 10
    // "212"; then "a" for sheet 1, "b" for sheet 2). Empty for templates
    // without a picture (5..7).
    std::string planetSheet(uint16_t planetTemplate, int sheet) const;

private:
    std::vector<std::string> m_sheets;
    std::array<SpriteRect, 128> m_pictures{};
    std::array<Animation, 128> m_animations{};
    std::vector<SpriteRect> m_frames;
    std::array<std::pair<int16_t, int16_t>, 128> m_offsets{};
    std::vector<std::string> m_terrainSheets;
    std::array<SpriteRect, 10> m_terrain{};
    std::vector<CatalogEntry> m_catalog;
    std::array<std::string, 11> m_planetFiles{};
};

} // namespace outpost::data
