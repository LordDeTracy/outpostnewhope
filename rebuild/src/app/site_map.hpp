// IMPROVED (I53): an overview of a site's map, one pixel per cell: the
// terrain by kind, the colony's buildings, and the mining beacons
// (DisMine, type 16) in gold. Used before landing (the site chooser) and as
// the colony screen's overview (key M), where a click moves the view.
#pragma once

#include "sim/simulation.hpp"

#include <SDL.h>

#include <cstdint>

namespace outpost::app {

class SiteMap {
public:
    ~SiteMap();
    // Draws `site` at `level` into `area` (keeping the map's proportions)
    // and returns the rectangle used. The picture is remade when the site,
    // the level or `version` changes (e.g. the turn).
    SDL_Rect draw(SDL_Renderer* ren, sim::Simulation& sim, sim::Handle site, int16_t level, const SDL_Rect& area,
                  uint32_t version);
    // The cell under a point of the last drawn rectangle, if any.
    bool cellAt(int x, int y, int16_t& cx, int16_t& cy) const;
    int beacons() const { return m_beacons; }

private:
    SDL_Texture* m_tex{nullptr};
    sim::Handle m_site;
    int16_t m_level{-1};
    uint32_t m_version{0};
    int m_w{0}, m_h{0}, m_beacons{0};
    SDL_Rect m_drawn{0, 0, 0, 0};
};

} // namespace outpost::app
