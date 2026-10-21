#include "data/terrain_gen.hpp"

#include <algorithm>
#include <array>
#include <cmath>
#include <vector>

namespace outpost::data {

namespace {

constexpr int kW = 300, kH = 150;

// A small, fixed generator (not the game's rand()), so the map depends on
// the seed alone.
struct Rng {
    uint32_t s;
    explicit Rng(uint32_t seed) : s(seed * 2654435761u + 0x9E3779B9u) { next(); }
    uint32_t next() {
        s ^= s << 13;
        s ^= s >> 17;
        s ^= s << 5;
        return s;
    }
    float unit() { return float(next() & 0xFFFFFF) / float(0x1000000); }
};

// Value noise on a lattice of `cell` pixels, smoothly interpolated.
std::vector<float> layer(Rng& rng, int cell) {
    const int gw = kW / cell + 2, gh = kH / cell + 2;
    std::vector<float> lattice(size_t(gw * gh));
    for (float& v : lattice) v = rng.unit();
    std::vector<float> out(size_t(kW * kH));
    for (int y = 0; y < kH; ++y)
        for (int x = 0; x < kW; ++x) {
            const float fx = float(x) / cell, fy = float(y) / cell;
            const int ix = int(fx), iy = int(fy);
            float tx = fx - ix, ty = fy - iy;
            tx = tx * tx * (3 - 2 * tx);
            ty = ty * ty * (3 - 2 * ty);
            auto at = [&](int i, int j) { return lattice[size_t(j * gw + i)]; };
            const float a = at(ix, iy) + (at(ix + 1, iy) - at(ix, iy)) * tx;
            const float b = at(ix, iy + 1) + (at(ix + 1, iy + 1) - at(ix, iy + 1)) * tx;
            out[size_t(y * kW + x)] = a + (b - a) * ty;
        }
    return out;
}

} // namespace

IndexedBitmap generateSiteTerrain(uint16_t index) {
    Rng rng(index & 0x7FFFu);
    // Octaves: broad regions, then patches; the originals keep a cell's
    // neighbour the same about 73% of the time.
    const auto a = layer(rng, 40), b = layer(rng, 16), c = layer(rng, 6);
    std::vector<float> h(size_t(kW * kH));
    for (size_t i = 0; i < h.size(); ++i) h[i] = 0.55f * a[i] + 0.30f * b[i] + 0.15f * c[i];

    // The shares of clear, rough, hostile and impassable ground, each
    // varied by up to half, then cut at those quantiles of the noise.
    std::array<float, 4> share{11.4f, 43.4f, 27.3f, 18.0f};
    for (float& s : share) s *= 0.5f + rng.unit();
    float total = 0;
    for (float s : share) total += s;
    std::vector<float> sorted = h;
    std::sort(sorted.begin(), sorted.end());
    std::array<float, 3> cut{};
    float acc = 0;
    for (int k = 0; k < 3; ++k) {
        acc += share[size_t(k)] / total;
        cut[size_t(k)] = sorted[std::min(sorted.size() - 1, size_t(acc * float(sorted.size())))];
    }

    IndexedBitmap bmp;
    bmp.width = kW;
    bmp.height = kH;
    bmp.pixels.resize(size_t(kW * kH));
    for (size_t i = 0; i < h.size(); ++i) {
        uint8_t v = 3;
        for (uint8_t k = 0; k < 3; ++k)
            if (h[i] <= cut[k]) {
                v = k;
                break;
            }
        bmp.pixels[i] = v;
    }
    // Greys for the four kinds (the originals' colour table is not read).
    static constexpr uint32_t kGrey[4] = {0xB8B0A0, 0x8C8478, 0x605850, 0x302C28};
    for (size_t i = 0; i < 4; ++i) bmp.palette[i] = kGrey[i];
    return bmp;
}

} // namespace outpost::data
