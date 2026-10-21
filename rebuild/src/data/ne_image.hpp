#pragma once

#include <cstdint>
#include <optional>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

// Reader for a 16-bit Windows NE executable (OUTPOST.EXE).
// Segment table entries are 8 bytes; offsets are in (1 << alignShift) units.
class NeImage {
public:
    struct Segment {
        uint32_t fileOffset{0};
        uint32_t length{0};        // 0 in the table means 64 KB
        uint16_t flags{0};
        bool isData() const { return flags & 1; }
    };

    struct Resource {
        uint16_t typeId{0};        // 0x8000 | id for predefined types (RT_STRING = 0x8006)
        std::string typeName;      // set when the type is named
        uint16_t id{0};            // 0x8000 | id for numbered resources
        std::string name;          // set when the resource is named
        uint32_t offset{0};
        uint32_t length{0};
    };

    static constexpr uint16_t RT_STRING = 0x8006;
    static constexpr uint16_t RT_DIALOG = 0x8005;
    static constexpr uint16_t RT_MENU = 0x8004;
    static constexpr uint16_t RT_RCDATA = 0x800A;

    bool parse(std::vector<uint8_t> bytes);

    const std::vector<Segment>& segments() const { return m_segments; }
    // 1-based, as in the NE format.
    std::span<const uint8_t> segmentData(int index) const;
    // The automatic data segment (DGROUP), i.e. the program's near data.
    std::span<const uint8_t> dgroup() const { return segmentData(m_autoData); }
    int autoDataSegment() const { return m_autoData; }

    const std::vector<Resource>& resources() const { return m_resources; }
    std::span<const uint8_t> resourceData(const Resource& r) const;

    // NUL-terminated string at an offset inside DGROUP.
    std::optional<std::string> dgroupString(uint16_t offset) const;

    const std::vector<uint8_t>& bytes() const { return m_bytes; }
    const std::string& error() const { return m_error; }

private:
    std::vector<uint8_t> m_bytes;
    std::vector<Segment> m_segments;
    std::vector<Resource> m_resources;
    int m_autoData{0};
    std::string m_error;
};

} // namespace outpost::data
