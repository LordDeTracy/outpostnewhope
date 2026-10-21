#include "data/pictures.hpp"

namespace outpost::data {

namespace {

constexpr int kCatalogSegment = 10;          // far data segment (DGROUP [0x63F0])
constexpr size_t kSheetList = 0x172A;        // DGROUP: far pointers to sheet names
constexpr size_t kSheetCount = 80;
constexpr size_t kAnimations = 0x3A4;        // DGROUP: {first, last, mode} per type
constexpr size_t kFrames = 0x1FA0;           // catalog: {sheet, x, y, w, h}
constexpr size_t kFrameCount = 627;
constexpr size_t kPictures = 0x3382;         // catalog: {sheet, x, y, w, h} per type - 10
constexpr size_t kOffsets = 0x3E8E;          // DGROUP: {x, y} per type
constexpr size_t kTerrainSheets = 0x24BE;    // DGROUP: far pointers, terrain set 1..10
constexpr size_t kTerrainRects = 0x2554;     // DGROUP: {x, y, w, h} per terrain type, 10 bytes
constexpr size_t kCatalogRows = 504;         // catalog: 16-byte rows from (id + 1) * 16
constexpr size_t kPlanetFiles = 0x2526;      // DGROUP: far pointers to "204.bmp" ... per planet

uint16_t u16(std::span<const uint8_t> b, size_t o) {
    return static_cast<uint16_t>(b[o] | (b[o + 1] << 8));
}

SpriteRect rectAt(std::span<const uint8_t> b, size_t o) {
    return {u16(b, o), u16(b, o + 2), u16(b, o + 4), u16(b, o + 6), u16(b, o + 8)};
}

} // namespace

bool BuildingPictures::load(const NeImage& exe) {
    const auto dg = exe.dgroup();
    const auto cat = exe.segmentData(kCatalogSegment);
    if (dg.size() < kAnimations + 6 * 128 || dg.size() < kSheetList + 4 * kSheetCount) return false;
    if (cat.size() < kPictures + 10 * 118 || cat.size() < kFrames + 10 * kFrameCount) return false;
    m_sheets.assign(kSheetCount, {});
    for (size_t i = 1; i < kSheetCount; ++i) {
        const uint16_t off = u16(dg, kSheetList + 4 * i);
        if (off == 0) continue;
        if (auto s = exe.dgroupString(off)) m_sheets[i] = *s;
    }
    for (uint16_t t = 10; t < 128; ++t) m_pictures[t] = rectAt(cat, kPictures + 10 * (t - 10));
    for (uint16_t t = 0; t < 128; ++t)
        m_animations[t] = {u16(dg, kAnimations + 6 * t), u16(dg, kAnimations + 6 * t + 2),
                           u16(dg, kAnimations + 6 * t + 4)};
    m_frames.resize(kFrameCount);
    for (size_t i = 0; i < kFrameCount; ++i) m_frames[i] = rectAt(cat, kFrames + 10 * i);
    for (size_t t = 0; t < 128 && kOffsets + 4 * t + 4 <= dg.size(); ++t)
        m_offsets[t] = {static_cast<int16_t>(u16(dg, kOffsets + 4 * t)),
                        static_cast<int16_t>(u16(dg, kOffsets + 4 * t + 2))};
    m_terrainSheets.assign(11, {});
    for (size_t i = 1; i <= 10; ++i) {
        const uint16_t off = u16(dg, kTerrainSheets + 4 * i);
        if (auto s = exe.dgroupString(off); s && s->find(".bmp") != std::string::npos) m_terrainSheets[i] = *s;
    }
    for (size_t t = 1; t <= 9; ++t) {
        const size_t o = kTerrainRects + 10 * t;
        m_terrain[t] = {0, u16(dg, o), u16(dg, o + 2), u16(dg, o + 4), u16(dg, o + 6)};
    }
    m_catalog.assign(kCatalogRows, {});
    for (size_t n = 0; n < kCatalogRows && (n + 2) * 16 <= cat.size(); ++n) {
        const size_t o = (n + 1) * 16;
        CatalogEntry e;
        e.kind = u16(cat, o);
        if (e.kind == 1 || e.kind == 3 || e.kind == 4) {
            if (auto s = exe.dgroupString(u16(cat, o + 2))) e.file = *s;
        } else if (e.kind == 2) {
            e.rect = rectAt(cat, o + 6);
        }
        m_catalog[n] = e;
    }
    for (size_t i = 1; i <= 10 && kPlanetFiles + 4 * i + 2 <= dg.size(); ++i)
        if (auto s = exe.dgroupString(u16(dg, kPlanetFiles + 4 * i)); s && s->find(".bmp") != std::string::npos)
            m_planetFiles[i] = s->substr(0, s->find('.'));
    return !m_sheets[9].empty();
}

std::optional<CatalogEntry> BuildingPictures::catalog(uint16_t id) const {
    if (id >= m_catalog.size() || m_catalog[id].kind == 0) return std::nullopt;
    return m_catalog[id];
}

std::string BuildingPictures::planetSheet(uint16_t planetTemplate, int sheet) const {
    if (planetTemplate >= m_planetFiles.size() || m_planetFiles[planetTemplate].empty()) return {};
    return m_planetFiles[planetTemplate] + (sheet == 2 ? "b.bmp" : "a.bmp");      // DGROUP 0x3194 / 0x3196
}

const std::string& BuildingPictures::sheetName(uint16_t sheet) const {
    static const std::string empty;
    return sheet < m_sheets.size() ? m_sheets[sheet] : empty;
}

std::optional<SpriteRect> BuildingPictures::picture(uint16_t type) const {
    if (type < 10 || type >= 128 || m_pictures[type].w == 0) return std::nullopt;
    return m_pictures[type];
}

std::optional<Animation> BuildingPictures::animation(uint16_t type) const {
    if (type >= 128 || m_animations[type].first == 0) return std::nullopt;   // s2:AED8
    return m_animations[type];
}

std::optional<SpriteRect> BuildingPictures::frame(uint16_t id) const {
    if (id >= m_frames.size() || m_frames[id].w == 0) return std::nullopt;
    return m_frames[id];
}

std::pair<int16_t, int16_t> BuildingPictures::overlayOffset(uint16_t type) const {
    return type < m_offsets.size() ? m_offsets[type] : std::pair<int16_t, int16_t>{int16_t{0}, int16_t{0}};
}

const std::string& BuildingPictures::terrainSheet(uint16_t set) const {
    static const std::string empty;
    return set < m_terrainSheets.size() ? m_terrainSheets[set] : empty;
}

std::optional<SpriteRect> BuildingPictures::terrain(uint16_t kind) const {
    if (kind < 1 || kind > 9 || m_terrain[kind].w == 0) return std::nullopt;
    return m_terrain[kind];
}

} // namespace outpost::data
