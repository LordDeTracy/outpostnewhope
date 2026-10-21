// Autodesk Animator Pro FLC animations (the CD's VIDEOS/*.FLC, played by
// the original through MCI and mciaap.drv; findings/13-media.md).
//
// All 92 files are type 0xAF12, 8 bits deep, with a ring frame after the
// last one; they use the chunks COLOR_256 (4), DELTA_FLC (7), BYTE_RUN (15),
// FLI_COPY (16) and PSTAMP (18). The decoder also takes COLOR_64 (11),
// DELTA_FLI (12) and BLACK (13).
#pragma once

#include <array>
#include <cstdint>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

class Flc {
public:
    // Parses the header and finds the frames. The bytes must outlive the Flc.
    bool open(std::span<const uint8_t> bytes);
    const std::string& error() const { return m_error; }

    int width() const { return m_w; }
    int height() const { return m_h; }
    int frames() const { return m_frames; }        // without the ring frame
    uint32_t msPerFrame() const { return m_speed; }

    // Decodes the next frame into pixels() and palette(); after the last
    // frame it starts again at frame 0. Returns false on a broken frame.
    bool next();
    int current() const { return m_current; }      // the frame in pixels(), -1 before the first
    const std::vector<uint8_t>& pixels() const { return m_pixels; }        // width * height indices
    const std::array<uint8_t, 768>& palette() const { return m_palette; }  // RGB 0..255

private:
    bool decodeFrame(size_t at, size_t size);
    bool colour(std::span<const uint8_t> c, bool sixBit);
    bool deltaFlc(std::span<const uint8_t> c);
    bool deltaFli(std::span<const uint8_t> c);
    bool byteRun(std::span<const uint8_t> c);

    std::span<const uint8_t> m_bytes;
    std::string m_error;
    int m_w{0}, m_h{0}, m_frames{0};
    uint32_t m_speed{0};
    std::vector<size_t> m_offsets;                 // frame chunks, ring frame included
    int m_current{-1};
    std::vector<uint8_t> m_pixels;
    std::array<uint8_t, 768> m_palette{};
};

} // namespace outpost::data
