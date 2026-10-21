#pragma once

#include <cstdint>
#include <filesystem>
#include <optional>
#include <string>
#include <vector>

namespace outpost::data {

// Decoder for PKWARE Data Compression Library "implode" streams.
// Outpost only uses binary-literal mode; coded-literal streams are rejected.
// Returns std::nullopt on a malformed stream.
std::optional<std::vector<uint8_t>> dclExplode(const std::vector<uint8_t>& stream);

// RESOURCE.000 on the Outpost CD: "DISK01", 26-byte entries ("DH91", 14-byte
// name, packed size, DOS date, DOS time) up to "THE_END", then the DCL
// streams in directory order. Format: contracts/archive-format.md.
class DclArchive {
public:
    struct Entry {
        std::string name;
        uint32_t packedSize{0};
        uint16_t dosDate{0};
        uint16_t dosTime{0};
        size_t dataOffset{0};
    };

    bool open(const std::filesystem::path& path);
    const std::vector<Entry>& entries() const { return m_entries; }
    const Entry* find(const std::string& name) const;   // case-insensitive
    std::optional<std::vector<uint8_t>> extract(const std::string& name) const;
    const std::string& error() const { return m_error; }

private:
    std::vector<uint8_t> m_bytes;
    std::vector<Entry> m_entries;
    std::string m_error;
};

} // namespace outpost::data
