#include "app/site_map.hpp"

#include "sim/building.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <vector>

namespace outpost::app {

namespace {

// Colours by cell kind (sim::Simulation::cellKind): 1 clear, 2 rough, 3
// hostile, 4 rubble, 5 dozed, 6..9 underground ground, 0 a building.
uint32_t kindColour(uint16_t kind) {
    switch (kind) {
        case 1: return 0xFFB48C64;
        case 2: return 0xFF8C6A4B;
        case 3: return 0xFF64463A;
        case 4: return 0xFF3A2C28;
        case 5: return 0xFFC8AA82;
        case 6: return 0xFF6E5A4A;
        case 7: return 0xFF4E3E34;
        case 8: return 0xFF3A2E28;
        case 9: return 0xFF8A7460;
        default: return 0xFF201814;
    }
}

} // namespace

SiteMap::~SiteMap() {
    if (m_tex) SDL_DestroyTexture(m_tex);
}

SDL_Rect SiteMap::draw(SDL_Renderer* ren, sim::Simulation& sim, sim::Handle site, int16_t level, const SDL_Rect& area,
                       uint32_t version) {
    sim::Grid* g = sim.gridOfSite(site);
    if (!g || g->width() <= 0 || g->height() <= 0) return {0, 0, 0, 0};
    if (!m_tex || site != m_site || level != m_level || version != m_version || m_w != g->width() ||
        m_h != g->height()) {
        m_site = site;
        m_level = level;
        m_version = version;
        m_w = g->width();
        m_h = g->height();
        std::vector<uint32_t> px(size_t(m_w) * size_t(m_h));
        for (int y = 0; y < m_h; ++y)
            for (int x = 0; x < m_w; ++x)
                px[size_t(y) * size_t(m_w) + size_t(x)] =
                    kindColour(sim.cellKind(site, {int16_t(x), int16_t(y), level}));
        // Buildings: blue-grey; mining beacons gold, drawn larger (3x3).
        m_beacons = 0;
        std::vector<std::pair<int, int>> beacons;
        for (const sim::Tile* t : sim.db().allOf<sim::Tile>(sim::ObjType::Tile)) {
            if (t->owner != site || t->level != level || t->x < 0 || t->y < 0 || t->x >= m_w || t->y >= m_h) continue;
            const sim::Building* b = sim.db().get<sim::Building>(t->building);
            if (!b || b->type <= 9) continue;
            if (b->type == 16) beacons.emplace_back(t->x, t->y);
            else px[size_t(t->y) * size_t(m_w) + size_t(t->x)] = 0xFF8CA0C8;
        }
        for (const auto& [bx, by] : beacons) {
            ++m_beacons;
            for (int dy = -1; dy <= 1; ++dy)
                for (int dx = -1; dx <= 1; ++dx) {
                    const int x = bx + dx, y = by + dy;
                    if (x >= 0 && y >= 0 && x < m_w && y < m_h) px[size_t(y) * size_t(m_w) + size_t(x)] = 0xFFECBA40;
                }
        }
        if (m_tex) SDL_DestroyTexture(m_tex);
        m_tex = SDL_CreateTexture(ren, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC, m_w, m_h);
        if (m_tex) SDL_UpdateTexture(m_tex, nullptr, px.data(), m_w * 4);
    }
    if (!m_tex) return {0, 0, 0, 0};
    const float k = std::min(float(area.w) / m_w, float(area.h) / m_h);
    m_drawn = {area.x + int(area.w - m_w * k) / 2, area.y + int(area.h - m_h * k) / 2, int(m_w * k), int(m_h * k)};
    SDL_RenderCopy(ren, m_tex, nullptr, &m_drawn);
    return m_drawn;
}

bool SiteMap::cellAt(int x, int y, int16_t& cx, int16_t& cy) const {
    if (m_drawn.w <= 0 || x < m_drawn.x || y < m_drawn.y || x >= m_drawn.x + m_drawn.w || y >= m_drawn.y + m_drawn.h)
        return false;
    cx = int16_t((x - m_drawn.x) * m_w / m_drawn.w);
    cy = int16_t((y - m_drawn.y) * m_h / m_drawn.h);
    return true;
}

} // namespace outpost::app
