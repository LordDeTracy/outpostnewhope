#include "data/star_table.hpp"

#include "data/ne_image.hpp"
#include "data/string_table.hpp"

#include <cstdlib>

namespace outpost::data {

namespace {
constexpr uint16_t kStarText = 0x3C18;
constexpr uint16_t kStarSystems = 0x51B8;
constexpr int kStarCount = 21;

bool isStarName(uint16_t id) {
    return (id >= 1444 && id <= 1462) || id == 1576 || id == 1577;
}
} // namespace

double StarRecord::distance() const { return std::atof(distanceLy.c_str()); }
double StarRecord::voyage() const { return std::atof(voyageYears.c_str()); }
bool StarRecord::hasTerrestrialPlanet() const { return std::atof(factor.c_str()) > 0.0; }

bool StarTable::load(const NeImage& exe, const StringTable& strings) {
    m_stars.clear();
    auto d = exe.dgroup();
    auto word = [&d](size_t p) { return static_cast<uint16_t>(d[p] | (d[p + 1] << 8)); };

    if (kStarSystems + 18u * kStarCount > d.size() || kStarText + 30u * kStarCount > d.size()) {
        m_error = "star tables out of range";
        return false;
    }
    for (int i = 0; i < kStarCount; ++i) {
        const size_t t = kStarText + 30u * static_cast<size_t>(i);
        const size_t s = kStarSystems + 18u * static_cast<size_t>(i);
        StarRecord r;
        r.nameId = word(t);
        if (!isStarName(r.nameId) || word(s) != r.nameId) {
            m_error = "star table not found (unsupported OUTPOST.EXE version?)";
            return false;
        }
        r.name = strings.get(r.nameId);

        std::string* fields[6] = {&r.spectralClass, &r.magnitude, &r.mass,
                                  &r.distanceLy, &r.voyageYears, &r.factor};
        for (int f = 0; f < 6; ++f) {
            // far pointer: offset word, then the (relocated) selector word
            auto str = exe.dgroupString(word(t + 2 + 4u * static_cast<size_t>(f)));
            if (!str) {
                m_error = "bad star text pointer";
                return false;
            }
            *fields[f] = *str;
        }
        r.tailA = word(t + 26);
        r.tailB = word(t + 28);

        r.planetCount = word(s + 2);
        for (int k = 0; k < 3; ++k) r.coords[static_cast<size_t>(k)] = static_cast<int16_t>(word(s + 4 + 2u * static_cast<size_t>(k)));
        for (int k = 0; k < 4; ++k) r.planetTypes[static_cast<size_t>(k)] = word(s + 10 + 2u * static_cast<size_t>(k));
        m_stars.push_back(std::move(r));
    }
    return true;
}

const StarRecord* StarTable::byName(const std::string& name) const {
    for (const auto& s : m_stars)
        if (s.name == name) return &s;
    return nullptr;
}

} // namespace outpost::data
