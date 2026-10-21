#pragma once

#include <cstdint>
#include <optional>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

// Original save-game container (*.OPS; TUTOR.OPS is one):
//   "SC%03d" header, then chunks tagged "dcbSC%02x" written by each object's
//   serializer (writer: Save_writeChunkTag s2:7CAC). Bodies have no length
//   field; until their layouts are decoded, a body runs to the next tag.
// Spec: specs/001-outpost-reverse-engineering/contracts/ops-save-format.md
class OpsSave {
public:
    struct Chunk {
        uint8_t id{0};
        size_t offset{0};
        std::vector<uint8_t> body;
    };

    bool parse(std::span<const uint8_t> bytes);

    int version() const { return m_version; }
    const std::vector<Chunk>& chunks() const { return m_chunks; }
    const Chunk* chunk(uint8_t id) const;

    // Printable NUL-terminated strings (>= 3 chars) in a chunk body.
    std::vector<std::string> strings(uint8_t id) const;

    const std::string& error() const { return m_error; }

private:
    int m_version{0};
    std::vector<Chunk> m_chunks;
    std::string m_error;
};

} // namespace outpost::data
