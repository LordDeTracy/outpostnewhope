#pragma once

#include <array>
#include <cstdint>
#include <filesystem>
#include <map>
#include <optional>
#include <string>
#include <vector>

namespace outpost::data {

class NeImage;

// The bitmap/animation catalog of OUTPOST.EXE (far data segment 10, read
// through the segment at DGROUP [0x63F0]): 16-byte entries, the one for id
// `n` at (n + 1) * 16 (s3:830A, s3:8018): +0 word kind (1 = a bitmap file),
// +2 word DGROUP offset of the file name.
class BitmapCatalog {
public:
    bool load(const NeImage& exe);
    // The file name of catalog id `id` ("500a.bmp"), empty if none.
    const std::string& name(uint16_t id) const;
    uint16_t kind(uint16_t id) const;
    size_t size() const { return m_entries.size(); }

private:
    struct Entry { uint16_t kind{0}; std::string name; };
    std::map<uint16_t, Entry> m_entries;
};

// The game's 70 sites (DGROUP 0x65E6, 10-byte rows), filled at startup by
// the static initialiser s7:3B28, whose code holds the values as
// immediates; they are read from the player's EXE by matching that code.
// Row: {position on the planet view (3 words), terrain bitmap id, picture
// bitmap id}. A site record copies the row (s7:4782): rec+0x08 position,
// rec+0x0E the terrain DIB (from `terrainId`), rec+0x12 the picture.
struct SiteRow {
    int16_t x{0}, y{0}, z{0};
    uint16_t terrainId{0};      // row +6 -> rec+0x0E ("500a.bmp" for site 0)
    uint16_t pictureId{0};      // row +8 -> rec+0x12 ("500.bmp")
};

std::vector<SiteRow> readSiteTable(const NeImage& exe);

// An 8-bit DIB read for its pixels (the terrain maps 5xxA.BMP). Pixel (x, y)
// counts y from the top, as s2:4544 does on the bottom-up DIB.
struct IndexedBitmap {
    int32_t width{0}, height{0};
    std::vector<uint8_t> pixels;     // top row first
    std::array<uint32_t, 256> palette{};   // 0xRRGGBB per index (the file's colour table)

    bool load(const std::vector<uint8_t>& bmp);
    uint8_t at(int32_t x, int32_t y) const {
        return pixels[static_cast<size_t>(y) * static_cast<size_t>(width) + static_cast<size_t>(x)];
    }
    bool contains(int32_t x, int32_t y) const { return x >= 0 && y >= 0 && x < width && y < height; }
};

// Case-insensitive file lookup in the CD's BITMAPS folder.
std::optional<std::vector<uint8_t>> readBitmapFile(const std::filesystem::path& cdDir,
                                                   const std::string& name);

} // namespace outpost::data
