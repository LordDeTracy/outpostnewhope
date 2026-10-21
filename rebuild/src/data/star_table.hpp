#pragma once

#include <array>
#include <cstdint>
#include <string>
#include <vector>

namespace outpost::data {

class NeImage;
class StringTable;

// The 21 destination stars, read from two parallel DGROUP tables in
// OUTPOST.EXE (row order is the game's own):
//   0x3C18, 30-byte rows: {word nameId, far char* text[6], word a, word b}
//          text = spectral class, apparent magnitude, mass (solar),
//                 distance (ly), voyage time (years), planet factor
//   0x51B8, 18-byte rows: {word nameId, word planetCount, short w[3],
//                          word planetType[4]}
struct StarRecord {
    uint16_t nameId{0};
    std::string name;
    std::string spectralClass;
    std::string magnitude, mass, distanceLy, voyageYears, factor;   // as stored
    uint16_t tailA{0}, tailB{0};          // the star's button id (416..436) and voice line (s8:B922)
    uint16_t planetCount{0};
    std::array<int16_t, 3> coords{};      // probably star-map x/y/z (inferred)
    std::array<uint16_t, 4> planetTypes{};

    double distance() const;
    double voyage() const;
    // Stars with a zero factor have only a gas giant (type 5): the game ends
    // with string 1839 "No Terrestrial planets detected...".
    bool hasTerrestrialPlanet() const;
};

class StarTable {
public:
    bool load(const NeImage& exe, const StringTable& strings);
    const std::vector<StarRecord>& stars() const { return m_stars; }
    const StarRecord* byName(const std::string& name) const;
    const std::string& error() const { return m_error; }

private:
    std::vector<StarRecord> m_stars;
    std::string m_error;
};

} // namespace outpost::data
