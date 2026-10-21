#include "app/map_view.hpp"

#include "app/hd_sprites.hpp"

#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cmath>

namespace outpost::app {

namespace {
// The building and ground pictures share a canvas (s3:887A): the ground
// (107 x 46) centred at the bottom, the building 7 px in from the left.
constexpr float kGroundW = 107.0f, kGroundH = 46.0f, kBuildingX = 7.0f;
// IMPROVISED (I32): the original's animation timer is not decoded; frames
// advance 8 times a second.
constexpr uint32_t kFrameMs = 125;

// s6:BC1C (building slot 5): the type the map shows. While a building goes
// up (state 4) it is its construction site's (+0x0E: 66 Const, 107 UGConst,
// both animated); once wrecked (state 7) the rubble s6:BF76 picked (+0x10:
// 72..74, 112..114 below ground); else its own.
uint16_t shownType(const sim::Building& b) {
    if (b.state == sim::Building::kConstructing && b.placeholderType) return b.placeholderType;
    if (b.state == 7 && b.spriteVariant) return b.spriteVariant;
    return b.type;
}
} // namespace

void MapView::setSite(sim::Handle site) {
    m_site = site;
    m_anim.clear();
}

void MapView::setLevel(int16_t level) {
    const auto* s = m_sim.db().get<sim::Site>(m_site);
    int16_t deepest = s ? static_cast<int16_t>(s->depth) : 0;
    // IMPROVED (I117): a level opens only once an Air Shaft reaches it (a
    // RoboDigger dug down: a UG core, 106, on it), each level in turn; a
    // mine going deeper (which deepens the site) does not open one.
    int16_t shafts = 0;
    for (int16_t l = 1; l <= std::min<int16_t>(4, deepest); ++l) {
        bool shaft = false;
        for (const sim::Tile* t : m_sim.db().allOf<sim::Tile>(sim::ObjType::Tile))
            if (t->owner == m_site && t->level == l)
                if (const sim::Building* b = m_sim.db().get<sim::Building>(t->building); b && b->type == 106) {
                    shaft = true;
                    break;
                }
        if (!shaft) break;
        shafts = l;
    }
    deepest = shafts;
    m_level = std::clamp<int16_t>(level, 0, std::min<int16_t>(4, deepest));
}

SDL_FPoint MapView::cellCentre(float x, float y) const {
    return {(x - y) * kHalfW * m_zoom + m_camX, (x + y) * kHalfH * m_zoom + m_camY};
}

void MapView::centreOn(float x, float y, const SDL_Rect& area) {
    m_camX = area.x + area.w / 2.0f - (x - y) * kHalfW * m_zoom;
    m_camY = area.y + area.h / 2.0f - (x + y) * kHalfH * m_zoom;
}

void MapView::zoomAt(float factor, int sx, int sy) {
    const float old = m_zoom;
    m_zoom = std::clamp(m_zoom * factor, 0.15f, 2.0f);
    m_camX = sx - (sx - m_camX) * m_zoom / old;
    m_camY = sy - (sy - m_camY) * m_zoom / old;
}

std::optional<sim::MapCell> MapView::cellAt(int sx, int sy) const {
    const float u = (sx - m_camX) / (kHalfW * m_zoom), v = (sy - m_camY) / (kHalfH * m_zoom);
    const int x = static_cast<int>(std::floor((u + v) / 2.0f + 0.5f));
    const int y = static_cast<int>(std::floor((v - u) / 2.0f + 0.5f));
    auto* self = const_cast<MapView*>(this);
    const sim::Grid* g = self->m_sim.gridOfSite(m_site);
    if (!g || x < 0 || y < 0 || x >= g->width() || y >= g->height()) return std::nullopt;
    return sim::MapCell{int16_t(x), int16_t(y), m_level};
}

uint16_t MapView::terrainSet() const {
    // The planet record's word +0 (its id) picks the terrain sheet
    // (s7:2F0C -> s3:82F8 -> s3:89F0).
    const auto* s = m_sim.db().get<sim::Site>(m_site);
    const auto* p = s ? m_sim.db().get<sim::Planet>(s->owner) : nullptr;
    const uint16_t set = p ? p->nameId : 0;
    return m_pics.terrainSheet(set).empty() ? uint16_t{1} : set;
}

void MapView::tick(uint32_t nowMs) {
    if (nowMs - m_lastTick < kFrameMs) return;
    m_lastTick = nowMs;
    for (auto& [h, st] : m_anim) {
        const sim::Building* b = m_sim.db().get<sim::Building>(sim::Handle{h});
        const auto anim = b ? m_pics.animation(shownType(*b)) : std::nullopt;
        if (!anim) continue;
        switch (anim->mode) {                          // s2:AE26
            case 2:                                    // ping-pong
                if (st.back) {
                    if (--st.frame <= anim->first) st.frame = uint16_t(anim->first + 1), st.back = false;
                } else if (++st.frame >= anim->last) {
                    st.frame = uint16_t(anim->last - 1), st.back = true;
                }
                break;
            case 3:
            case 4:
                break;                                 // held
            default:                                   // loop
                if (++st.frame > anim->last) st.frame = anim->first;
                break;
        }
    }
}

void MapView::drawPicture(Gfx& g, const data::SpriteRect& r, float left, float bottom, Uint8 alpha) {
    const std::string& file = m_pics.sheetName(r.sheet);
    g.blit(file, SDL_Rect{r.x, r.y, r.w, r.h}, left, bottom - r.h * m_zoom, m_zoom, alpha);
}

void MapView::draw(Gfx& g, const SDL_Rect& area) {
    sim::Grid* grid = m_sim.gridOfSite(m_site);
    if (!grid) return;
    SDL_RenderSetClipRect(g.renderer(), &area);
    const std::string& terrainFile = m_pics.terrainSheet(terrainSet());
    const int w = grid->width(), h = grid->height();
    const float hw = kHalfW * m_zoom, hh = kHalfH * m_zoom;
    // IMPROVED (I93): the planet template's terrain pack, on the surface.
    const data::TerrainPack* pack = nullptr;
    if (m_packs && m_level == 0)
        if (const auto* s = m_sim.db().get<sim::Site>(m_site))
            if (const auto* p = m_sim.db().get<sim::Planet>(s->owner)) pack = m_packs->forSite(p->nameId, s->rec00);
    const HdSprites& hd = hdSprites(g);
    uint16_t planetId = 0;
    if (const auto* s = m_sim.db().get<sim::Site>(m_site))
        if (const auto* p = m_sim.db().get<sim::Planet>(s->owner)) planetId = p->nameId;
        int cellX = 0, cellY = 0;                        // the cell being drawn
    uint32_t siteSeed = 0;                           // the pack's variants follow the site
    if (const auto* s = m_sim.db().get<sim::Site>(m_site)) siteSeed = s->rec00;
    auto terrainAt = [&](float left, float top, uint16_t kind, Uint8 alpha = 255) {
        if (pack && pack->covers(kind)) {
            const uint16_t c = pack->cellFor(kind, siteSeed);
            using P = data::TerrainPack;
            const SDL_Rect src{(c % P::kColumns) * P::kCellW, (c / P::kColumns) * P::kCellH, P::kCellW, P::kCellH};
            // A little larger than the cell, so neighbours overlap and no
            // seam shows between the diamonds.
            const float pad = 1.5f * m_zoom;
            g.image(pack->atlas, src,
                    SDL_FRect{left - pad, top - pad * 0.5f, (2 * kHalfW + 1) * m_zoom + 2 * pad, 2 * kHalfH * m_zoom + pad},
                    alpha);
            // Hostile (3) and hopeless (4) ground is marked so it reads at a
            // glance: a faint red wash, a dark one.
            if (kind == 3 || kind == 4) {
                const SDL_Color tint = kind == 3 ? SDL_Color{200, 40, 20, 55} : SDL_Color{0, 0, 0, 110};
                const float cx = left + kHalfW * m_zoom, cy = top + kHalfH * m_zoom;
                const SDL_Vertex v[4] = {{{cx, top}, tint, {0, 0}},
                                         {{left + 2 * kHalfW * m_zoom, cy}, tint, {0, 0}},
                                         {{cx, top + 2 * kHalfH * m_zoom}, tint, {0, 0}},
                                         {{left, cy}, tint, {0, 0}}};
                const int idx[6] = {0, 1, 2, 0, 2, 3};
                SDL_SetRenderDrawBlendMode(g.renderer(), SDL_BLENDMODE_BLEND);
                SDL_RenderGeometry(g.renderer(), nullptr, v, 4, idx, 6);
            }
            return;
        }
        // IMPROVED (I65): OutpostHD's terrain; the original's only without it.
        Uint8 shade = 255;
        if (auto hp = hd.terrain(kind, planetId, &shade)) {
            hd.drawTerrain(g, *hp, SDL_FRect{left, top, 2 * kHalfW * m_zoom, 2 * kHalfH * m_zoom}, shade, alpha);
            return;
        }
        if (auto r = m_pics.terrain(kind))
            g.blit(terrainFile, SDL_Rect{r->x, r->y, r->w, r->h}, left, top, m_zoom, alpha);
    };
    for (int s = 0; s < w + h - 1; ++s)            // back to front
        for (int x = std::max(0, s - h + 1); x <= std::min(s, w - 1); ++x) {
            const int y = s - x;
            cellX = x;
            cellY = y;
            const SDL_FPoint c = cellCentre(float(x), float(y));
            if (c.x < area.x - 2 * hw || c.x > area.x + area.w + 2 * hw || c.y < area.y - 2 * hh ||
                c.y > area.y + area.h + 8 * hh)
                continue;
            const sim::MapCell cell{int16_t(x), int16_t(y), m_level};
            const uint32_t value = grid->value(cell);
            const float left = c.x - hw, top = c.y - hh, bottom = c.y + hh;
            const sim::Building* b = nullptr;
            if ((value >> 24) == 0) {
                // s4:DD7C: below the surface an empty cell's ground (7, 8, 9:
                // soft to solid rock) is drawn with pictures 6, 7 and 8; the
                // smooth floor (9) shows only where a digger has been (a
                // tile of terrain 9). Undug rock stays dark.
                uint16_t kind = static_cast<uint16_t>(value & 0xFFFF);
                if (m_level > 0) kind = kind == 7 ? 6 : kind == 8 ? 7 : 8;
                terrainAt(left, top, kind);
            } else if (const auto* t = m_sim.db().get<sim::Tile>(sim::Handle{value})) {
                b = m_sim.db().get<sim::Building>(t->building);
                if (b && b->type <= 9) {
                    terrainAt(left, top, b->type);
                    b = nullptr;
                } else {
                    // IMPROVISED (I32): the ground under a building (the
                    // picture cache's +0x14) is taken as dozed ground: 5 on
                    // the surface, below it dug ground (kind 6, which is
                    // terrain type 9's picture, the smooth floor).
                    terrainAt(left, top, m_level > 0 ? 9 : 5);
                }
            }
            if (b) {
                const uint16_t shown = shownType(*b);
                // IMPROVED (I65): OutpostHD's picture, without the original's
                // animation overlays.
                auto hp = hd.building(shown);
                if (!hp) hp = hd.building(b->type);
                if (hp) {
                    hd.drawOnCell(g, *hp, left, bottom, 2 * kHalfW * m_zoom);
                    continue;
                }
                auto pic = m_pics.picture(shown);
                if (!pic) pic = m_pics.picture(b->type);
                if (pic) {
                    drawPicture(g, *pic, left + kBuildingX * m_zoom, bottom, 255);
                    if (auto anim = m_pics.animation(shown)) {
                        auto& st = m_anim[b->self.value];
                        if (st.frame < anim->first || st.frame > anim->last) st.frame = anim->first;
                        if (auto fr = m_pics.frame(st.frame)) {
                            // s4:214E: the frame sits at the type's offset on
                            // the picture's canvas.
                            const auto [ox, oy] = m_pics.overlayOffset(shown);
                            const float canvasH = std::max(kGroundH, float(pic->h));
                            const float cx = left + ox * m_zoom, cy = bottom - canvasH * m_zoom + oy * m_zoom;
                            g.blit(m_pics.sheetName(fr->sheet), SDL_Rect{fr->x, fr->y, fr->w, fr->h}, cx, cy, m_zoom);
                        }
                    }
                }
            }
        }
    // IMPROVED (I51): the mining beacons (DisMine, type 16) are hard to see on
    // the terrain; their cells get a pulsing gold outline.
    {
        const float pulse = 0.5f + 0.5f * std::sin(float(SDL_GetTicks()) / 300.0f);
        const Uint8 a = Uint8(120 + 135 * pulse);
        for (const sim::Tile* t : m_sim.db().allOf<sim::Tile>(sim::ObjType::Tile)) {
            if (t->owner != m_site || t->level != m_level) continue;
            const sim::Building* mb = m_sim.db().get<sim::Building>(t->building);
            if (!mb || mb->type != 16) continue;
            const SDL_FPoint c = cellCentre(float(t->x), float(t->y));
            if (c.x < area.x - 2 * hw || c.x > area.x + area.w + 2 * hw || c.y < area.y - 2 * hh ||
                c.y > area.y + area.h + 2 * hh)
                continue;
            SDL_SetRenderDrawBlendMode(g.renderer(), SDL_BLENDMODE_BLEND);
            SDL_SetRenderDrawColor(g.renderer(), 236, 186, 64, a);
            for (float k : {1.0f, 0.92f, 0.84f}) {
                const SDL_FPoint p[5] = {{c.x, c.y - hh * k}, {c.x + hw * k, c.y}, {c.x, c.y + hh * k},
                                         {c.x - hw * k, c.y}, {c.x, c.y - hh * k}};
                SDL_RenderDrawLinesF(g.renderer(), p, 5);
            }
        }
    }
    // The cell under the mouse and the building about to be placed, over
    // everything else.
    if (m_hover && m_hover->x < w && m_hover->y < h) {
        const SDL_FPoint c = cellCentre(float(m_hover->x), float(m_hover->y));
        const float left = c.x - hw, top = c.y - hh, bottom = c.y + hh;
        if (m_ghostType)
            if (auto hp = hd.building(m_ghostType)) {
                hd.drawOnCell(g, *hp, left, bottom, 2 * kHalfW * m_zoom, 170);
                if (!m_ghostOk) {                              // refused: a red wash
                    const SDL_Color tint{220, 40, 30, 90};
                    const SDL_Vertex v[4] = {{{c.x, top}, tint, {0, 0}}, {{c.x + hw, c.y}, tint, {0, 0}},
                                             {{c.x, bottom}, tint, {0, 0}}, {{c.x - hw, c.y}, tint, {0, 0}}};
                    const int idx[6] = {0, 1, 2, 0, 2, 3};
                    SDL_SetRenderDrawBlendMode(g.renderer(), SDL_BLENDMODE_BLEND);
                    SDL_RenderGeometry(g.renderer(), nullptr, v, 4, idx, 6);
                }
            } else if (auto pic = m_pics.picture(m_ghostType)) {
                SDL_Texture* t = g.bitmap(m_pics.sheetName(pic->sheet));
                if (t) SDL_SetTextureColorMod(t, m_ghostOk ? 160 : 255, m_ghostOk ? 255 : 120, m_ghostOk ? 160 : 120);
                drawPicture(g, *pic, left + kBuildingX * m_zoom, bottom, 170);
                if (t) SDL_SetTextureColorMod(t, 255, 255, 255);
            }
        const SDL_FPoint p[5] = {{c.x, top}, {c.x + hw, c.y}, {c.x, bottom}, {c.x - hw, c.y}, {c.x, top}};
        SDL_SetRenderDrawColor(g.renderer(), 255, 255, 0, 255);
        SDL_RenderDrawLinesF(g.renderer(), p, 5);
    }
    (void)kGroundW;
    SDL_RenderSetClipRect(g.renderer(), nullptr);
}

} // namespace outpost::app
