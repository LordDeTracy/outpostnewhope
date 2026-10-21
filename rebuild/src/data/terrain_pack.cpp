#include "data/terrain_pack.hpp"

#include <algorithm>
#include <fstream>
#include <sstream>

namespace outpost::data {

bool TerrainPack::load(const std::filesystem::path& dir, std::string* error) {
    std::ifstream f(dir / "pack.txt");
    if (!f) {
        if (error) *error = "no pack.txt";
        return false;
    }
    id = dir.filename().string();
    atlas = dir / "atlas.png";
    std::string line;
    while (std::getline(f, line)) {
        std::istringstream in(line);
        std::string key;
        if (!(in >> key)) continue;
        if (key == "name") {
            std::getline(in >> std::ws, name);
        } else if (key == "templates") {
            for (int t; in >> t;) templates.push_back(uint16_t(t));
        } else if (key == "kind") {
            int kind = 0;
            in >> kind;
            if (kind < 1 || kind >= int(cells.size())) continue;
            for (int c; in >> c;) cells[size_t(kind)].push_back(uint16_t(c));
        }
    }
    if (name.empty()) name = id;
    if (!std::filesystem::exists(atlas)) {
        if (error) *error = "no atlas.png";
        return false;
    }
    return true;
}

uint16_t TerrainPack::cellFor(uint16_t kind, uint32_t siteSeed) const {
    const auto& v = cells[kind];
    uint32_t h = siteSeed * 73856093u ^ uint32_t(kind) * 19349663u;
    h ^= h >> 13;
    h *= 0x5bd1e995u;
    h ^= h >> 15;
    return v[h % v.size()];
}

void TerrainPacks::load(const std::filesystem::path& root) {
    m_packs.clear();
    std::error_code ec;
    for (const auto& e : std::filesystem::directory_iterator(root, ec)) {
        if (!e.is_directory()) continue;
        TerrainPack p;
        if (p.load(e.path())) m_packs.push_back(std::move(p));
    }
    std::sort(m_packs.begin(), m_packs.end(), [](const auto& a, const auto& b) { return a.id < b.id; });
}

const TerrainPack* TerrainPacks::forSite(uint16_t planetTemplate, uint16_t siteIndex) const {
    // The packs that suit each template (by folder name), its own first.
    static const std::vector<std::vector<std::string>> kSuits = {
        {},                                       // 0
        {"rocky", "lunar", "volcanic"},           // 1 Mercury
        {"volcanic", "desert", "rocky"},          // 2 Venus
        {"lunar", "rocky"},                       // 3 the Moon
        {"desert", "rocky", "volcanic"},          // 4 Mars
        {"ice"}, {"ice"}, {"ice"},                // 5..7 the gas giants' moons
        {"ice", "lunar"},                         // 8 Pluto
        {"rocky", "lunar", "ice"},                // 9 Ceres
        {"lunar", "rocky"},                       // 10 Phobos
    };
    std::vector<const TerrainPack*> fit;
    if (planetTemplate < kSuits.size())
        for (const std::string& id : kSuits[planetTemplate])
            for (const auto& p : m_packs)
                if (p.id == id) fit.push_back(&p);
    if (fit.empty()) return forTemplate(planetTemplate);
    // A small hash of the site number (the generated sites' numbers are big).
    uint32_t h = siteIndex * 2654435761u;
    h ^= h >> 15;
    return fit[h % fit.size()];
}

const TerrainPack* TerrainPacks::forTemplate(uint16_t planetTemplate) const {
    for (const auto& p : m_packs)
        if (std::find(p.templates.begin(), p.templates.end(), planetTemplate) != p.templates.end()) return &p;
    return nullptr;
}

} // namespace outpost::data
