// IMPROVED (I92): random sites. v1.51 has 70 site maps (5xxA.BMP, all
// 300 x 150, pixel 0..3 = clear, rough, hostile, impassable ground; Grid::
// terrainType); a random planet's sites get a map made here instead. The
// site's index (record +0x00) carries the map's seed: kGeneratedSite set,
// 15 bits of seed, so a saved game makes the same map again.
#pragma once

#include "data/site_maps.hpp"

#include <cstdint>

namespace outpost::data {

constexpr uint16_t kGeneratedSite = 0x8000;
inline bool isGeneratedSite(uint16_t index) { return (index & kGeneratedSite) != 0; }

// A 300 x 150 map of pixels 0..3 from the seed in `index`, with the
// shares of the original maps (about 11% clear, 43% rough, 27% hostile,
// 18% impassable, varied by the seed) in patches as large as theirs.
IndexedBitmap generateSiteTerrain(uint16_t index);

} // namespace outpost::data
