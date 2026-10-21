#include "data/flc.hpp"

#include <algorithm>
#include <cstring>

namespace outpost::data {

namespace {

constexpr uint16_t kFlc = 0xAF12, kFli = 0xAF11, kFrame = 0xF1FA, kPrefix = 0xF100;
constexpr uint16_t kColour256 = 4, kDeltaFlc = 7, kColour64 = 11, kDeltaFli = 12, kBlack = 13, kByteRun = 15,
                   kCopy = 16, kStamp = 18;

uint16_t u16(std::span<const uint8_t> b, size_t o) { return uint16_t(b[o] | b[o + 1] << 8); }
uint32_t u32(std::span<const uint8_t> b, size_t o) { return u16(b, o) | uint32_t(u16(b, o + 2)) << 16; }

// A bounds-checked reader over one chunk.
struct Reader {
    std::span<const uint8_t> b;
    size_t p{0};
    bool ok{true};
    uint8_t byte() {
        if (p + 1 > b.size()) { ok = false; return 0; }
        return b[p++];
    }
    uint16_t word() {
        if (p + 2 > b.size()) { ok = false; return 0; }
        const uint16_t v = u16(b, p);
        p += 2;
        return v;
    }
};

} // namespace

bool Flc::open(std::span<const uint8_t> bytes) {
    m_bytes = bytes;
    m_offsets.clear();
    m_current = -1;
    if (bytes.size() < 128) return m_error = "too short", false;
    const uint16_t type = u16(bytes, 4);
    if (type != kFlc && type != kFli) return m_error = "not an FLC or FLI", false;
    m_frames = u16(bytes, 6);
    m_w = u16(bytes, 8);
    m_h = u16(bytes, 10);
    if (u16(bytes, 12) != 8 && u16(bytes, 12) != 0) return m_error = "not 8 bits deep", false;
    // FLC: milliseconds per frame; FLI: 1/70 s per frame (16 bits).
    m_speed = type == kFlc ? u32(bytes, 16) : uint32_t(u16(bytes, 16)) * 1000 / 70;
    if (m_w <= 0 || m_h <= 0 || m_frames <= 0) return m_error = "empty animation", false;
    size_t p = type == kFlc && u32(bytes, 80) ? u32(bytes, 80) : 128;
    while (p + 6 <= bytes.size() && m_offsets.size() < size_t(m_frames) + 1) {
        const uint32_t size = u32(bytes, p);
        const uint16_t t = u16(bytes, p + 4);
        if (size < 6 || p + size > bytes.size()) break;
        if (t == kFrame) m_offsets.push_back(p);
        else if (t != kPrefix) break;
        p += size;
    }
    if (m_offsets.size() < size_t(m_frames)) return m_error = "frames missing", false;
    m_pixels.assign(size_t(m_w) * size_t(m_h), 0);
    m_palette.fill(0);
    return true;
}

bool Flc::next() {
    if (m_offsets.empty()) return false;
    int frame = m_current + 1;
    if (frame >= m_frames) {
        // The ring frame turns the last frame back into the first.
        if (m_offsets.size() > size_t(m_frames)) {
            const size_t at = m_offsets[size_t(m_frames)];
            if (!decodeFrame(at, u32(m_bytes, at))) return false;
            m_current = 0;
            return true;
        }
        std::fill(m_pixels.begin(), m_pixels.end(), uint8_t{0});
        frame = 0;
    }
    const size_t at = m_offsets[size_t(frame)];
    if (!decodeFrame(at, u32(m_bytes, at))) return false;
    m_current = frame;
    return true;
}

bool Flc::decodeFrame(size_t at, size_t size) {
    if (size < 16 || at + size > m_bytes.size()) return m_error = "broken frame", false;
    const uint16_t chunks = u16(m_bytes, at + 6);
    size_t p = at + 16;
    for (uint16_t i = 0; i < chunks; ++i) {
        if (p + 6 > at + size) return m_error = "broken chunk", false;
        const uint32_t csize = u32(m_bytes, p);
        const uint16_t type = u16(m_bytes, p + 4);
        if (csize < 6 || p + csize > at + size) return m_error = "broken chunk", false;
        const std::span<const uint8_t> data = m_bytes.subspan(p + 6, csize - 6);
        bool ok = true;
        switch (type) {
            case kColour256: ok = colour(data, false); break;
            case kColour64: ok = colour(data, true); break;
            case kDeltaFlc: ok = deltaFlc(data); break;
            case kDeltaFli: ok = deltaFli(data); break;
            case kBlack: std::fill(m_pixels.begin(), m_pixels.end(), uint8_t{0}); break;
            case kByteRun: ok = byteRun(data); break;
            case kCopy:
                // The raw frame is width * height bytes; some files (211.FLC)
                // declare the chunk 2 bytes short and run into the frame's
                // padding, so the bytes are read up to the frame's end.
                if (p + 6 + m_pixels.size() > at + size) return m_error = "short copy chunk", false;
                std::memcpy(m_pixels.data(), m_bytes.data() + p + 6, m_pixels.size());
                break;
            case kStamp: break;                    // the postage stamp: not shown
            default: break;                        // unknown chunks are skipped
        }
        if (!ok) return m_error = "broken chunk data", false;
        p += csize;
    }
    return true;
}

bool Flc::colour(std::span<const uint8_t> c, bool sixBit) {
    Reader r{c};
    const uint16_t packets = r.word();
    size_t index = 0;
    for (uint16_t i = 0; i < packets && r.ok; ++i) {
        index += r.byte();
        int count = r.byte();
        if (count == 0) count = 256;
        for (int k = 0; k < count && r.ok; ++k, ++index) {
            for (int ch = 0; ch < 3; ++ch) {
                uint8_t v = r.byte();
                if (sixBit) v = uint8_t(v << 2 | v >> 4);
                if (index < 256) m_palette[index * 3 + size_t(ch)] = v;
            }
        }
    }
    return r.ok;
}

bool Flc::deltaFlc(std::span<const uint8_t> c) {
    Reader r{c};
    int lines = r.word();
    int y = 0;
    while (lines > 0 && r.ok && y < m_h) {
        const uint16_t w = r.word();
        if ((w & 0xC000) == 0xC000) {              // skip lines
            y += -int16_t(w);
            continue;
        }
        uint8_t* row = m_pixels.data() + size_t(y) * size_t(m_w);
        if ((w & 0xC000) == 0x8000) {              // the line's last pixel; the packet count follows
            row[m_w - 1] = uint8_t(w & 0xFF);
            continue;
        }
        int x = 0;
        for (uint16_t k = 0; k < w && r.ok; ++k) {
            x += r.byte();
            const int count = int8_t(r.byte());
            if (count > 0) {
                for (int i = 0; i < 2 * count && r.ok; ++i, ++x) {
                    const uint8_t v = r.byte();
                    if (x < m_w) row[x] = v;
                }
            } else if (count < 0) {
                const uint8_t a = r.byte(), b = r.byte();
                for (int i = 0; i < -count; ++i, x += 2) {
                    if (x < m_w) row[x] = a;
                    if (x + 1 < m_w) row[x + 1] = b;
                }
            }
        }
        ++y;
        --lines;
    }
    return r.ok;
}

bool Flc::deltaFli(std::span<const uint8_t> c) {
    Reader r{c};
    int y = r.word();
    const int lines = r.word();
    for (int l = 0; l < lines && r.ok && y < m_h; ++l, ++y) {
        uint8_t* row = m_pixels.data() + size_t(y) * size_t(m_w);
        const int packets = r.byte();
        int x = 0;
        for (int k = 0; k < packets && r.ok; ++k) {
            x += r.byte();
            const int count = int8_t(r.byte());
            if (count > 0) {
                for (int i = 0; i < count && r.ok; ++i, ++x) {
                    const uint8_t v = r.byte();
                    if (x < m_w) row[x] = v;
                }
            } else if (count < 0) {
                const uint8_t v = r.byte();
                for (int i = 0; i < -count; ++i, ++x)
                    if (x < m_w) row[x] = v;
            }
        }
    }
    return r.ok;
}

bool Flc::byteRun(std::span<const uint8_t> c) {
    Reader r{c};
    for (int y = 0; y < m_h && r.ok; ++y) {
        uint8_t* row = m_pixels.data() + size_t(y) * size_t(m_w);
        r.byte();                                  // the old packet count, not used
        int x = 0;
        while (x < m_w && r.ok) {
            const int count = int8_t(r.byte());
            if (count > 0) {
                const uint8_t v = r.byte();
                for (int i = 0; i < count && x < m_w; ++i) row[x++] = v;
            } else if (count < 0) {
                for (int i = 0; i < -count && r.ok; ++i) {
                    const uint8_t v = r.byte();
                    if (x < m_w) row[x] = v;
                    ++x;
                }
            } else {
                break;
            }
        }
    }
    return r.ok;
}

} // namespace outpost::data
