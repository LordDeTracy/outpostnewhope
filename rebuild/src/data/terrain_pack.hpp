// IMPROVED (I93): terrain packs: other ground art for the surface, by the
// planet's template. A pack is a folder with atlas.png (128 x 64 diamond
// cells, 8 to a row) and pack.txt (built by tools/make_terrain_packs.py):
//     name <text>
//     templates <planet template ids 1..10>
//     kind <surface kind 1..5> <cell> ...
// Kinds a pack leaves out, and every underground kind, keep the original
// art. Not original data: the packs are CC0 art (each folder's SOURCE.txt).
#pragma once

#include <array>
#include <cstdint>
#include <filesystem>
#include <string>
#include <vector>

namespace outpost::data {

struct TerrainPack {
    static constexpr int kCellW = 128, kCellH = 64, kColumns = 8;
    std::string id;                                  // the folder's name
    std::string name;
    std::filesystem::path atlas;
    std::vector<uint16_t> templates;
    std::array<std::vector<uint16_t>, 6> cells;     // by kind 1..5 ([0] unused)

    bool load(const std::filesystem::path& dir, std::string* error = nullptr);
    bool covers(uint16_t kind) const { return kind < cells.size() && !cells[kind].empty(); }
    // The cell for a kind on a site: one variant per kind and site, so ground
    // of one kind reads as one surface (a variant per cell made a
    // patchwork).
    uint16_t cellFor(uint16_t kind, uint32_t siteSeed) const;
};

class TerrainPacks {
public:
    // Every folder with a pack.txt under `root`, by folder name.
    void load(const std::filesystem::path& root);
    const std::vector<TerrainPack>& packs() const { return m_packs; }
    // The pack a planet template (1..10) uses, or none.
    const TerrainPack* forTemplate(uint16_t planetTemplate) const;
    // The pack of one site: the sites of a planet differ. A planet template
    // has the packs that suit it (its own, then others: Mars desert, rocky,
    // volcanic; the Moon lunar, rocky; ...); a site takes one of them by its
    // site number, so it always looks the same, on the original planets and
    // the added ones alike.
    const TerrainPack* forSite(uint16_t planetTemplate, uint16_t siteIndex) const;

private:
    std::vector<TerrainPack> m_packs;
};

} // namespace outpost::data
