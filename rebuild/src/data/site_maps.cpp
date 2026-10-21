#include "data/site_maps.hpp"

#include "data/ne_image.hpp"

#include <algorithm>
#include <cctype>
#include <cstring>
#include <fstream>
#include <iterator>

namespace outpost::data {

namespace {

uint16_t u16(std::span<const uint8_t> d, size_t p) {
    return static_cast<uint16_t>(d[p] | (d[p + 1] << 8));
}

uint32_t u32(const std::vector<uint8_t>& d, size_t p) {
    return d[p] | (d[p + 1] << 8) | (d[p + 2] << 16) | (static_cast<uint32_t>(d[p + 3]) << 24);
}

constexpr int kCatalogSegment = 10;     // far data segment (DGROUP [0x63F0])
constexpr int kCodeSegment = 7;
constexpr size_t kSiteInit = 0x3B28;    // s7:3B28
constexpr size_t kSiteInitSize = 2454;
constexpr uint16_t kSiteTable = 0x65E6; // DGROUP, 10-byte rows
constexpr size_t kSiteCount = 70;

} // namespace

bool BitmapCatalog::load(const NeImage& exe) {
    m_entries.clear();
    const auto seg = exe.segmentData(kCatalogSegment);
    for (size_t off = 16; off + 16 <= seg.size(); off += 16) {
        const uint16_t kind = u16(seg, off);
        if (kind == 0) continue;
        auto name = exe.dgroupString(u16(seg, off + 2));
        if (!name) continue;
        m_entries[static_cast<uint16_t>(off / 16 - 1)] = {kind, *name};
    }
    return !m_entries.empty();
}

const std::string& BitmapCatalog::name(uint16_t id) const {
    static const std::string empty;
    auto it = m_entries.find(id);
    return it == m_entries.end() ? empty : it->second.name;
}

uint16_t BitmapCatalog::kind(uint16_t id) const {
    auto it = m_entries.find(id);
    return it == m_entries.end() ? uint16_t{0} : it->second.kind;
}

// Each row of s7:3B28 is set up by the same code:
//   push dword pos (66 68 imm32, or 66 6A imm8)   ; y low word, x high word
//   push 0 ; lea ax,[bp-6] ; push ss ; push ax
//   lcall s2:3E54                                  ; pos = (x, y, 0)
//   push dx ; push ax
//   push dword ids (66 68 imm32)                   ; picture low, terrain high
//   push ds ; push row (68 imm16) ; ... call s7:3AF6
std::vector<SiteRow> readSiteTable(const NeImage& exe) {
    std::vector<SiteRow> rows(kSiteCount);
    std::vector<bool> seen(kSiteCount, false);
    const auto seg = exe.segmentData(kCodeSegment);
    if (seg.size() < kSiteInit + kSiteInitSize) return {};
    const std::vector<uint8_t> c(seg.begin() + kSiteInit, seg.begin() + kSiteInit + kSiteInitSize);
    for (size_t p = 0; p + 32 < c.size(); ++p) {
        uint32_t pos = 0;
        size_t q = p;
        if (c[q] == 0x66 && c[q + 1] == 0x68) {
            pos = u32(c, q + 2);
            q += 6;
        } else if (c[q] == 0x66 && c[q + 1] == 0x6A) {
            pos = static_cast<uint32_t>(static_cast<int32_t>(static_cast<int8_t>(c[q + 2])));
            q += 3;
        } else {
            continue;
        }
        static constexpr uint8_t kMid[] = {0x6A, 0x00, 0x8D, 0x46};
        if (q + 22 > c.size() || std::memcmp(&c[q], kMid, sizeof kMid) != 0) continue;
        q += 5;                                            // ... 8D 46 disp8
        if (c[q] != 0x16 || c[q + 1] != 0x50 || c[q + 2] != 0x9A) continue;
        q += 7;                                            // lcall seg:off
        if (c[q] != 0x52 || c[q + 1] != 0x50 || c[q + 2] != 0x66 || c[q + 3] != 0x68) continue;
        const uint32_t ids = u32(c, q + 4);
        q += 8;
        if (c[q] != 0x1E || c[q + 1] != 0x68) continue;
        const uint16_t addr = static_cast<uint16_t>(c[q + 2] | (c[q + 3] << 8));
        if (addr < kSiteTable || (addr - kSiteTable) % 10 != 0) continue;
        const size_t i = (addr - kSiteTable) / 10u;
        if (i >= kSiteCount) continue;
        SiteRow& r = rows[i];
        r.x = static_cast<int16_t>(pos >> 16);
        r.y = static_cast<int16_t>(pos & 0xFFFF);
        r.z = 0;
        r.terrainId = static_cast<uint16_t>(ids >> 16);
        r.pictureId = static_cast<uint16_t>(ids & 0xFFFF);
        seen[i] = true;
        p = q + 3;
    }
    if (std::count(seen.begin(), seen.end(), true) != static_cast<long>(kSiteCount)) return {};
    return rows;
}

bool IndexedBitmap::load(const std::vector<uint8_t>& b) {
    if (b.size() < 54 || b[0] != 'B' || b[1] != 'M') return false;
    const uint32_t off = u32(b, 10);
    const auto w = static_cast<int32_t>(u32(b, 18));
    const auto h = static_cast<int32_t>(u32(b, 22));
    const uint16_t bpp = static_cast<uint16_t>(b[28] | (b[29] << 8));
    if (bpp != 8 || w <= 0 || h == 0) return false;
    const int32_t rows = h < 0 ? -h : h;
    const size_t stride = (static_cast<size_t>(w) + 3) & ~size_t{3};
    if (off + stride * static_cast<size_t>(rows) > b.size()) return false;
    width = w;
    height = rows;
    const uint32_t infoSize = u32(b, 14);
    uint32_t colours = u32(b, 46);
    if (colours == 0 || colours > 256) colours = 256;
    palette.fill(0);
    for (uint32_t i = 0; i < colours && 14 + infoSize + 4 * i + 3 <= b.size(); ++i) {
        const size_t q = 14 + infoSize + 4 * i;                // BGRx
        palette[i] = (uint32_t{b[q + 2]} << 16) | (uint32_t{b[q + 1]} << 8) | b[q];
    }
    pixels.assign(static_cast<size_t>(w) * static_cast<size_t>(rows), 0);
    for (int32_t y = 0; y < rows; ++y) {
        const int32_t src = h > 0 ? rows - 1 - y : y;      // bottom-up unless h < 0
        std::memcpy(&pixels[static_cast<size_t>(y) * static_cast<size_t>(w)],
                    &b[off + static_cast<size_t>(src) * stride], static_cast<size_t>(w));
    }
    return true;
}

std::optional<std::vector<uint8_t>> readBitmapFile(const std::filesystem::path& cdDir,
                                                   const std::string& name) {
    auto lower = [](std::string s) {
        for (auto& ch : s) ch = static_cast<char>(std::tolower(static_cast<unsigned char>(ch)));
        return s;
    };
    std::error_code ec;
    std::filesystem::path dir;
    for (const auto& e : std::filesystem::directory_iterator(cdDir, ec))
        if (lower(e.path().filename().string()) == "bitmaps") dir = e.path();
    if (dir.empty()) return std::nullopt;
    const std::string want = lower(name);
    for (const auto& e : std::filesystem::directory_iterator(dir, ec)) {
        if (lower(e.path().filename().string()) != want) continue;
        std::ifstream f(e.path(), std::ios::binary);
        return std::vector<uint8_t>(std::istreambuf_iterator<char>(f), std::istreambuf_iterator<char>());
    }
    return std::nullopt;
}

} // namespace outpost::data
