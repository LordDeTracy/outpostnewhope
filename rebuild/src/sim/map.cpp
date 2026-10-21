#include "sim/map.hpp"

namespace outpost::sim {

Grid::Grid(Handle site, uint16_t siteIndex, const data::IndexedBitmap* terrain)
    : m_site(site), m_siteIndex(siteIndex), m_terrain(terrain) {}

bool Grid::inside(const MapCell& c) const {
    return c.level >= 0 && c.level < kLevels && m_terrain && m_terrain->contains(c.x, c.y);
}

uint16_t Grid::terrainType(uint8_t pixel, int16_t level) {
    if (level <= 0) return static_cast<uint16_t>(pixel + 1);
    if (pixel == 0) return 7;
    if (pixel <= 2) return 8;
    return 9;
}

uint16_t Grid::terrain(const MapCell& c) const {
    // IMPROVISED (guard): the original reads the DIB at any position, also
    // outside it (s2:4544 has no bounds check); outside, the rebuild says 0.
    if (!m_terrain || !m_terrain->contains(c.x, c.y)) return 0;
    return terrainType(m_terrain->at(c.x, c.y), c.level);
}

uint32_t Grid::value(const MapCell& c) const {
    const Handle t = tileAt(c);
    return t ? t.value : terrain(c);
}

Handle Grid::tileAt(const MapCell& c) const {
    // s7:8CD2 only knows levels 0..5 and level 5 reads past the table; the
    // index y * width + x (s7:8D9E) is unchecked. Both are guarded here.
    if (!inside(c)) return Handle{};
    const auto& level = m_cells[static_cast<size_t>(c.level)];
    auto it = level.find(c.y * width() + c.x);
    return it == level.end() ? Handle{} : it->second;
}

void Grid::setTile(const MapCell& c, Handle tile) {
    if (!inside(c)) return;
    m_cells[static_cast<size_t>(c.level)][c.y * width() + c.x] = tile;
}

Grid& Map::addGrid(Handle site, uint16_t siteIndex, const data::IndexedBitmap* terrain) {
    m_grids.push_back(std::make_unique<Grid>(site, siteIndex, terrain));
    return *m_grids.back();
}

Grid* Map::grid(Handle site) {
    for (auto& g : m_grids)
        if (g->site() == site) return g.get();
    return nullptr;
}

const Grid* Map::grid(Handle site) const {
    for (const auto& g : m_grids)
        if (g->site() == site) return g.get();
    return nullptr;
}

} // namespace outpost::sim
