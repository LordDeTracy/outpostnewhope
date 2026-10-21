#include "data/game_files.hpp"

#include "data/dcl_archive.hpp"

#include <algorithm>
#include <cctype>
#include <fstream>
#include <iterator>

namespace outpost::data {

namespace {

// Case-insensitive lookup of a file in a directory.
std::optional<std::filesystem::path> findFile(const std::filesystem::path& dir,
                                              const std::string& name) {
    std::error_code ec;
    for (const auto& e : std::filesystem::directory_iterator(dir, ec)) {
        std::string n = e.path().filename().string();
        if (n.size() == name.size() &&
            std::equal(n.begin(), n.end(), name.begin(), [](char a, char b) {
                return std::toupper(static_cast<unsigned char>(a)) ==
                       std::toupper(static_cast<unsigned char>(b));
            }))
            return e.path();
    }
    return std::nullopt;
}

std::optional<std::vector<uint8_t>> readAll(const std::filesystem::path& p) {
    std::ifstream f(p, std::ios::binary);
    if (!f) return std::nullopt;
    return std::vector<uint8_t>(std::istreambuf_iterator<char>(f), std::istreambuf_iterator<char>());
}

} // namespace

bool GameFiles::open(const std::filesystem::path& dir) {
    m_dir = dir;
    if (findFile(dir, "OUTPOST.EXE")) {
        m_fromArchive = false;
        return true;
    }
    if (findFile(dir, "RESOURCE.000")) {
        m_fromArchive = true;
        return true;
    }
    m_error = "neither OUTPOST.EXE nor RESOURCE.000 found in " + dir.string();
    return false;
}

std::optional<std::vector<uint8_t>> GameFiles::read(const std::string& name) const {
    if (!m_fromArchive) {
        auto p = findFile(m_dir, name);
        return p ? readAll(*p) : std::nullopt;
    }
    auto arcPath = findFile(m_dir, "RESOURCE.000");
    if (!arcPath) return std::nullopt;
    DclArchive arc;
    if (!arc.open(*arcPath)) return std::nullopt;
    return arc.extract(name);
}

std::optional<std::filesystem::path> GameFiles::cdAssets() const {
    if (findFile(m_dir, "BITMAPS")) return m_dir;
    return std::nullopt;
}

} // namespace outpost::data
