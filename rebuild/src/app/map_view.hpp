// The site view (findings/12-graphics.md §3-5): the original's isometric
// map of one site and level, with terrain pictures, building pictures and
// their animation overlays.
#pragma once

#include "data/terrain_pack.hpp"

#include "app/gfx.hpp"
#include "data/pictures.hpp"
#include "sim/map.hpp"
#include "sim/object_db.hpp"

#include <map>
#include <optional>

namespace outpost::sim {
class Simulation;
}

namespace outpost::app {

class MapView {
public:
    // The view object (registry 0x2E, ctor s4:1FF4): half a cell is 53 x 23
    // pixels, so cells are 106 x 46 diamonds under 107 x 46 pictures.
    static constexpr float kHalfW = 53.0f, kHalfH = 23.0f;

    MapView(sim::Simulation& sim, const data::BuildingPictures& pics) : m_sim(sim), m_pics(pics) {}

    void setSite(sim::Handle site);
    sim::Handle site() const { return m_site; }
    int16_t level() const { return m_level; }
    void setLevel(int16_t level);
    void centreOn(float x, float y, const SDL_Rect& area);
    void scroll(float dx, float dy) { m_camX += dx; m_camY += dy; }
    void zoomAt(float factor, int sx, int sy);
    float zoom() const { return m_zoom; }

    // Animation frames advance with the clock (ms).
    void tick(uint32_t nowMs);
    void draw(Gfx& g, const SDL_Rect& area);

    std::optional<sim::MapCell> cellAt(int sx, int sy) const;
    void setHover(std::optional<sim::MapCell> c) { m_hover = c; }
    // A building about to be placed: drawn translucent at the hover cell,
    // tinted by whether the rules allow it there.
    void setGhost(uint16_t type, bool allowed) { m_ghostType = type; m_ghostOk = allowed; }
    // IMPROVED (I93): the surface drawn with these packs (none: the
    // original art).
    void setTerrainPacks(const data::TerrainPacks* packs) { m_packs = packs; }
    void clearGhost() { m_ghostType = 0; }

private:
    const data::TerrainPacks* m_packs{nullptr};
    SDL_FPoint cellCentre(float x, float y) const;
    uint16_t terrainSet() const;
    void drawPicture(Gfx& g, const data::SpriteRect& r, float left, float bottom, Uint8 alpha = 255);

    sim::Simulation& m_sim;
    const data::BuildingPictures& m_pics;
    sim::Handle m_site;
    int16_t m_level{0};
    float m_camX{0}, m_camY{0}, m_zoom{1.0f};
    std::optional<sim::MapCell> m_hover;
    uint16_t m_ghostType{0};
    bool m_ghostOk{false};
    // Per building: the frame shown and the ping-pong direction (s2:AE26).
    struct AnimState {
        uint16_t frame{0};
        bool back{false};
    };
    std::map<uint32_t, AnimState> m_anim;
    uint32_t m_lastTick{0};
};

} // namespace outpost::app
