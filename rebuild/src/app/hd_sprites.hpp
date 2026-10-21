// IMPROVED (I65): the map's building, robot and terrain
// pictures come from OutpostHD's art (BSD 3-Clause, rebuild/assets/ophd)
// instead of the original game's bitmaps. Each original building type is
// mapped to the nearest OutpostHD picture; the original's pictures stay
// only as a fallback when the folder is missing.
#pragma once

#include <SDL.h>

#include <cstdint>
#include <filesystem>
#include <optional>
#include <string>

namespace outpost::app {

class Gfx;

// A cut from one of the OutpostHD sheets. Every picture stands on its
// cell's diamond: its bottom edge is the diamond's bottom corner, and it is
// centred on the diamond (OutpostHD: 128 px wide cells, anchor at the
// cell's top-left, buildings 128x128 with anchor y 64, flat pieces 128x64).
struct HdPicture {
    std::string file;      // relative to the ophd folder
    SDL_Rect src{0, 0, 0, 0};
};

class HdSprites {
public:
    // `root` is the folder holding structures/, robots/, tsets/.
    explicit HdSprites(std::filesystem::path root);
    bool available() const { return m_ok; }

    // The picture of building type 10..127 (the type the map shows: a
    // construction site, rubble, or the building itself).
    std::optional<HdPicture> building(uint16_t type) const;
    // The picture of terrain kind 1..9 (1-4 clear..hopeless, 5 dozed; 6-8
    // underground rock, soft to solid; 9 dug floor) for a planet. Rock is
    // drawn darker (`shade` < 255).
    std::optional<HdPicture> terrain(uint16_t kind, uint16_t planetId, Uint8* shade) const;

    // Draws a building picture on the cell whose diamond spans `left` ..
    // `left + cellW` with its bottom corner at `bottom`.
    void drawOnCell(Gfx& g, const HdPicture& p, float left, float bottom, float cellW, Uint8 alpha = 255) const;
    // Draws a terrain diamond into the cell's box.
    void drawTerrain(Gfx& g, const HdPicture& p, const SDL_FRect& cell, Uint8 shade, Uint8 alpha = 255) const;
    // Draws a building picture scaled to fit `box` (panel thumbnails, icons).
    void drawFitted(Gfx& g, const HdPicture& p, const SDL_FRect& box, Uint8 alpha = 255) const;

    std::filesystem::path path(const HdPicture& p) const { return m_root / p.file; }

private:
    std::filesystem::path m_root;
    bool m_ok{false};
};

// The shared set, read from the "ophd" folder next to the game's other
// assets (Gfx::assets()).
const HdSprites& hdSprites(const Gfx& g);

} // namespace outpost::app
