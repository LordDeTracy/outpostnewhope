#pragma once

#include <cstdint>
#include <filesystem>
#include <optional>
#include <string>
#include <vector>

namespace outpost::data {

// Locates the player's original Outpost files. Accepts either an installed
// game folder (OUTPOST.EXE, BLDGBLD.DAT, ... next to each other) or the CD
// folder, in which case the files are read out of RESOURCE.000. The CD-only
// folders (BITMAPS, VIDEOS, MUSIC) are looked up next to RESOURCE.000 too.
class GameFiles {
public:
    bool open(const std::filesystem::path& dir);

    // Contents of an archived/installed file (e.g. "OUTPOST.EXE").
    std::optional<std::vector<uint8_t>> read(const std::string& name) const;
    // Folder holding BITMAPS/VIDEOS/MUSIC, if present.
    std::optional<std::filesystem::path> cdAssets() const;

    bool fromArchive() const { return m_fromArchive; }
    const std::string& error() const { return m_error; }

private:
    std::filesystem::path m_dir;
    bool m_fromArchive{false};
    std::string m_error;
};

} // namespace outpost::data
