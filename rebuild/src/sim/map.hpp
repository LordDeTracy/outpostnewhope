#pragma once

#include "data/site_maps.hpp"
#include "sim/object_db.hpp"

#include <array>
#include <cstdint>
#include <memory>
#include <unordered_map>
#include <vector>

namespace outpost::sim {

// A position on a site: x = word 0, y = word 1 (rows from the top), level =
// word 2 (0 surface, 1..4 underground). Unpacked by s2:3EB4 in that order.
struct MapCell {
    int16_t x{0}, y{0}, level{0};
};

// One site's grid (class at s7:88CE, 0x4C bytes): the site's terrain DIB
// (+0x12, site record +0x0E), its size (+0x28 rect, +0x34 cell count) and
// one sparse table of tile handles per level (+0x38, levels 0..4;
// s7:85BE(25, 100)). A cell holds a tile handle, or nothing, in which case
// its value is the terrain read from the DIB (s7:8C66).
class Grid {
public:
    static constexpr int kLevels = 5;

    Grid(Handle site, uint16_t siteIndex, const data::IndexedBitmap* terrain);

    Handle site() const { return m_site; }
    uint16_t siteIndex() const { return m_siteIndex; }
    int32_t width() const { return m_terrain ? m_terrain->width : 0; }
    int32_t height() const { return m_terrain ? m_terrain->height : 0; }
    bool inside(const MapCell& c) const;

    // s7:8B00: the cell's value: a tile handle (type byte set), or the
    // terrain type as a bare number (type byte 0).
    uint32_t value(const MapCell& c) const;
    // s7:627E: the tile on the cell, or none.
    Handle tileAt(const MapCell& c) const;
    // s7:8AA0 / s7:61FE: put a tile handle on the cell.
    void setTile(const MapCell& c, Handle tile);
    // s7:8C66: the terrain of an empty cell. The DIB pixel p gives p + 1
    // (building types 1..4) on the surface; underground 0 -> 7, 1..2 -> 8,
    // anything else -> 9.
    uint16_t terrain(const MapCell& c) const;
    static uint16_t terrainType(uint8_t pixel, int16_t level);

private:
    Handle m_site;
    uint16_t m_siteIndex{0};
    const data::IndexedBitmap* m_terrain{nullptr};
    std::array<std::unordered_map<int32_t, Handle>, kLevels> m_cells;
};

// The map (DGROUP [0x5740]): the list of grids, one per site (+0x04), found
// by site handle (s7:677A, the grid's +0x24).
class Map {
public:
    // s7:6222 without its DisMine part (s7:8D08, new sites only).
    Grid& addGrid(Handle site, uint16_t siteIndex, const data::IndexedBitmap* terrain);
    Grid* grid(Handle site);
    const Grid* grid(Handle site) const;
    const std::vector<std::unique_ptr<Grid>>& grids() const { return m_grids; }

private:
    std::vector<std::unique_ptr<Grid>> m_grids;
};

} // namespace outpost::sim
