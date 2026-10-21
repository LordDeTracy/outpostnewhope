#include "app/hd_sprites.hpp"

#include "app/gfx.hpp"

#include <algorithm>

namespace outpost::app {

namespace {

constexpr int kCell = 128;                 // OutpostHD cell width
constexpr int kTileH = 64;                 // OutpostHD diamond height

HdPicture whole(const char* file) { return {file, {0, 0, kCell, kCell}}; }
HdPicture flat(const char* file, int col, int row = 0) {
    return {file, {col * kCell, row * kTileH, kCell, kTileH}};
}
HdPicture rubble(int frame) { return {"structures/destroyed.png", {frame * kCell, 0, kCell, kCell}}; }

// Original building type -> OutpostHD picture. Where OutpostHD has no
// picture of its own for a type, the nearest in purpose stands in.
std::optional<HdPicture> lookup(uint16_t type) {
    switch (type) {
        case 10:  return whole("structures/seed_0.png");                 // Seed lander
        case 11:  return whole("structures/seed_1.png");                 // SeedCommand
        case 12:  return whole("structures/smelter.png");                // SeedSmelter
        case 13:  return whole("structures/fusion_reactor.png");         // SeedPower
        case 14:  return whole("structures/factory_surface.png");        // SeedFact
        case 15:  return whole("structures/maintenance.png");            // SpacePort
        case 16:  return whole("structures/mine_beacon.png");            // DisMine
        case 17:  return whole("structures/mine_shaft.png");             // Mass Driver
        case 18:  return whole("structures/solar_array1.png");           // Solar Power Receiver
        case 19: case 20: case 21:
                  return whole("structures/fusion_reactor.png");         // Tokamaks
        case 22: case 25:
                  return flat("structures/roads.png", 2);                // monorail along y
        case 23: case 26:
                  return flat("structures/roads.png", 1);                // monorail along x
        case 24:  return flat("structures/roads.png", 0);                // monorail crossing
        case 27: case 28: case 29:
                  return whole("structures/agridome_0.png");
        case 30: case 31: case 32:
                  return whole("structures/factory_surface.png");
        case 33:  return whole("structures/commercial.png");             // Trade
        case 34: case 35: case 36:
                  return whole("structures/recycling.png");              // SPEW
        case 37: case 38: case 39:
                  return whole("structures/communications_tower.png");
        case 40: case 41:
                  return whole("structures/labo_surface.png");           // Hot Lab
        case 42: case 43:
                  return whole("structures/chap.png");
        case 44:  return whole("structures/maintenance.png");            // Nanotech
        case 45: case 46:
                  return whole("structures/solar_plant.png");            // TerraForm
        case 47: case 48:
                  return whole("structures/recycling.png");              // DIRT
        case 49: case 50:
                  return whole("structures/police_surface.png");
        case 51: case 52:
                  return whole("structures/mine_facility.png");
        case 53: case 54:
                  return whole("structures/smelter.png");
        case 55:  return whole("structures/command_center.png");
        case 56: case 57:
                  return whole("structures/robot_control.png");
        case 58: case 59:
                  return whole("structures/warehouse.png");
        case 60: case 61:
                  return whole("structures/storage_tanks.png");
        case 62:  return whole("structures/lander_1.png");               // Colonist Lander
        case 63:  return whole("structures/maintenance.png");            // MonoStation
        case 64:  return whole("structures/solar_plant.png");            // MonoXFormer
        case 65:  return whole("structures/lander_0.png");               // Cargo Lander
        case 66: case 70:
                  return whole("structures/construction_01.png");        // construction site
        case 67:  return flat("structures/roads.png", 2, 1);             // road being built
        case 68:  return flat("structures/roads.png", 1, 1);
        case 69:  return flat("structures/roads.png", 0, 1);
        case 71:  return whole("structures/air_shaft.png");              // Core
        case 72: case 112: return rubble(0);
        case 73: case 113: return rubble(1);
        case 74: case 114: return rubble(2);
        case 75:  return whole("structures/landing_site.png");           // lander site
        case 76:  return flat("structures/roads.png", 2);                // road along y
        case 77:  return flat("structures/roads.png", 1);                // road along x
        case 78:  return flat("structures/roads.png", 0);                // crossing
        case 79: case 80:
                  return whole("structures/residential_1.png");
        case 81:  return whole("structures/nursery_01.png");             // UGResident3
        case 82: case 83:
                  return whole("structures/recreation_center.png");
        case 84: case 85: case 86:
                  return whole("structures/university.png");
        case 87: case 88: case 89:
                  return whole("structures/commercial.png");
        case 90:  return whole("structures/park.png");
        case 91: case 92:
                  return whole("structures/factory_underground.png");
        case 93: case 94: case 95:
                  return whole("structures/laboratory_underground.png");
        case 96: case 97:
                  return whole("structures/mine_shaft.png");
        case 98: case 99:
                  return whole("structures/fusion_reactor.png");         // UG Tokamak
        case 100: return whole("structures/maintenance.png");            // UG SpacePort
        case 101: return whole("structures/red_light_district.png");
        case 102: case 103:
                  return whole("structures/command_center.png");         // Administration
        case 104: case 105:
                  return whole("structures/medical.png");
        case 106: return whole("structures/air_shaft_ug.png");           // UG Core
        case 107: return whole("structures/construction_02.png");        // UG construction
        case 108: case 109:
                  return whole("structures/police_underground.png");
        case 110: return whole("structures/fusion_reactor.png");         // UG GeoTherm
        case 111: return whole("structures/commercial.png");             // UG Trade
        case 115: case 118: case 119:
                  return whole("robots/robodozer.png");                  // dozers, explorer
        case 116: case 120: case 121:
                  return whole("robots/robodigger.png");
        case 117: return whole("robots/robominer.png");
        case 122: return flat("structures/tubes.png", 0);                // XPipe
        case 123: return flat("structures/tubes.png", 2);                // LPipe, along y
        case 124: return flat("structures/tubes.png", 1);                // RPipe, along x
        case 125: return flat("structures/tubes.png", 1, 1);             // UG RPipe
        case 126: return flat("structures/tubes.png", 2, 1);             // UG LPipe
        case 127: return flat("structures/tubes.png", 0, 1);             // UG XPipe
        default:  return std::nullopt;
    }
}

} // namespace

HdSprites::HdSprites(std::filesystem::path root) : m_root(std::move(root)) {
    std::error_code ec;
    m_ok = std::filesystem::exists(m_root / "structures" / "command_center.png", ec) &&
           std::filesystem::exists(m_root / "tsets" / "mars.png", ec);
}

std::optional<HdPicture> HdSprites::building(uint16_t type) const {
    if (!m_ok) return std::nullopt;
    return lookup(type);
}

std::optional<HdPicture> HdSprites::terrain(uint16_t kind, uint16_t planetId, Uint8* shade) const {
    if (!m_ok || kind < 1 || kind > 9) return std::nullopt;
    // OutpostHD has three tilesets; each planet keeps one (by its id).
    static const char* kSets[3] = {"tsets/mars.png", "tsets/mercury.png", "tsets/ganymede.png"};
    const char* set = kSets[planetId % 3];
    if (shade) *shade = 255;
    // Row 0: clear .. impassable (5 tiles); row 1: worked ground.
    switch (kind) {
        case 1: return flat(set, 0);
        case 2: return flat(set, 1);
        case 3: return flat(set, 3);
        case 4: return flat(set, 4);
        case 5: return flat(set, 0, 1);                                // dozed
        case 9: return flat(set, 1, 1);                                // dug floor
        default:                                                        // rock 6..8
            if (shade) *shade = kind == 6 ? 150 : kind == 7 ? 115 : 80;
            return flat(set, kind - 4, 1);
    }
}

const HdSprites& hdSprites(const Gfx& g) {
    static const HdSprites set(g.assets() / "ophd");
    return set;
}

void HdSprites::drawOnCell(Gfx& g, const HdPicture& p, float left, float bottom, float cellW, Uint8 alpha) const {
    const float s = cellW / kCell;
    const SDL_FRect dst{left, bottom - p.src.h * s, p.src.w * s, p.src.h * s};
    g.image(path(p), p.src, dst, alpha);
}

void HdSprites::drawTerrain(Gfx& g, const HdPicture& p, const SDL_FRect& cell, Uint8 shade, Uint8 alpha) const {
    // A little larger than the cell, so neighbours overlap and no seam
    // shows between the diamonds.
    const float pad = cell.w / 70.0f;
    g.image(path(p), p.src, SDL_FRect{cell.x - pad, cell.y - pad * 0.5f, cell.w + 2 * pad, cell.h + pad}, alpha);
    if (shade == 255) return;
    const SDL_Color c{0, 0, 0, Uint8(255 - shade)};
    const float cx = cell.x + cell.w / 2, cy = cell.y + cell.h / 2;
    const SDL_Vertex v[4] = {{{cx, cell.y}, c, {0, 0}},
                             {{cell.x + cell.w, cy}, c, {0, 0}},
                             {{cx, cell.y + cell.h}, c, {0, 0}},
                             {{cell.x, cy}, c, {0, 0}}};
    const int idx[6] = {0, 1, 2, 0, 2, 3};
    SDL_SetRenderDrawBlendMode(g.renderer(), SDL_BLENDMODE_BLEND);
    SDL_RenderGeometry(g.renderer(), nullptr, v, 4, idx, 6);
}

void HdSprites::drawFitted(Gfx& g, const HdPicture& p, const SDL_FRect& box, Uint8 alpha) const {
    const float s = std::min(box.w / p.src.w, box.h / p.src.h);
    const float w = p.src.w * s, h = p.src.h * s;
    g.image(path(p), p.src, SDL_FRect{box.x + (box.w - w) / 2, box.y + (box.h - h) / 2, w, h}, alpha);
}

} // namespace outpost::app
