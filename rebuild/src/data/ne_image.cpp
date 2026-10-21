#include "data/ne_image.hpp"

#include <cstring>

namespace outpost::data {

namespace {

uint16_t u16(const std::vector<uint8_t>& b, size_t p) {
    return static_cast<uint16_t>(b[p] | (b[p + 1] << 8));
}

uint32_t u32(const std::vector<uint8_t>& b, size_t p) {
    return u16(b, p) | (static_cast<uint32_t>(u16(b, p + 2)) << 16);
}

std::string pascalString(const std::vector<uint8_t>& b, size_t p) {
    if (p >= b.size()) return {};
    size_t n = b[p];
    if (p + 1 + n > b.size()) return {};
    return std::string(reinterpret_cast<const char*>(b.data() + p + 1), n);
}

} // namespace

bool NeImage::parse(std::vector<uint8_t> bytes) {
    m_bytes = std::move(bytes);
    m_segments.clear();
    m_resources.clear();
    const auto& b = m_bytes;

    if (b.size() < 0x40 || b[0] != 'M' || b[1] != 'Z') {
        m_error = "not an MZ executable";
        return false;
    }
    const size_t ne = u32(b, 0x3C);
    if (ne + 0x40 > b.size() || b[ne] != 'N' || b[ne + 1] != 'E') {
        m_error = "not an NE executable";
        return false;
    }

    m_autoData = u16(b, ne + 0x0E);
    const uint16_t segCount = u16(b, ne + 0x1C);
    const size_t segTable = ne + u16(b, ne + 0x22);
    const size_t resTable = ne + u16(b, ne + 0x24);
    const size_t residentNames = ne + u16(b, ne + 0x26);
    const uint16_t align = u16(b, ne + 0x32);

    for (uint16_t i = 0; i < segCount; ++i) {
        const size_t e = segTable + 8u * i;
        if (e + 8 > b.size()) {
            m_error = "segment table truncated";
            return false;
        }
        Segment s;
        s.fileOffset = static_cast<uint32_t>(u16(b, e)) << align;
        const uint16_t len = u16(b, e + 2);
        s.length = (len == 0 && s.fileOffset != 0) ? 0x10000u : len;
        s.flags = u16(b, e + 4);
        m_segments.push_back(s);
    }

    // Resource table: shift, then {typeId, count, reserved[4], entries[count]}...
    if (resTable != residentNames) {
        const uint16_t shift = u16(b, resTable);
        size_t p = resTable + 2;
        for (;;) {
            if (p + 2 > b.size()) break;
            const uint16_t typeId = u16(b, p);
            if (typeId == 0) break;
            const uint16_t count = u16(b, p + 2);
            p += 8;
            for (uint16_t i = 0; i < count; ++i, p += 12) {
                if (p + 12 > b.size()) {
                    m_error = "resource table truncated";
                    return false;
                }
                Resource r;
                r.typeId = typeId;
                if (!(typeId & 0x8000)) r.typeName = pascalString(b, resTable + typeId);
                r.offset = static_cast<uint32_t>(u16(b, p)) << shift;
                r.length = static_cast<uint32_t>(u16(b, p + 2)) << shift;
                r.id = u16(b, p + 6);
                if (!(r.id & 0x8000)) r.name = pascalString(b, resTable + r.id);
                m_resources.push_back(std::move(r));
            }
        }
    }

    if (m_autoData < 1 || m_autoData > static_cast<int>(m_segments.size())) {
        m_error = "invalid automatic data segment";
        return false;
    }
    return true;
}

std::span<const uint8_t> NeImage::segmentData(int index) const {
    if (index < 1 || index > static_cast<int>(m_segments.size())) return {};
    const Segment& s = m_segments[static_cast<size_t>(index - 1)];
    if (s.fileOffset == 0 || s.fileOffset + s.length > m_bytes.size()) return {};
    return {m_bytes.data() + s.fileOffset, s.length};
}

std::span<const uint8_t> NeImage::resourceData(const Resource& r) const {
    if (r.offset + r.length > m_bytes.size()) return {};
    return {m_bytes.data() + r.offset, r.length};
}

std::optional<std::string> NeImage::dgroupString(uint16_t offset) const {
    auto d = dgroup();
    if (offset >= d.size()) return std::nullopt;
    const auto* start = d.data() + offset;
    const void* nul = std::memchr(start, 0, d.size() - offset);
    if (!nul) return std::nullopt;
    return std::string(reinterpret_cast<const char*>(start),
                       static_cast<const uint8_t*>(nul) - start);
}

} // namespace outpost::data
