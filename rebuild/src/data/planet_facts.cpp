#include "data/planet_facts.hpp"

namespace outpost::data {

namespace {
constexpr size_t kFactSheets = 0x1384;           // DGROUP: word per template 0..10
}

std::vector<std::string> planetFacts(const NeImage& exe, uint16_t planetTemplate) {
    const auto dg = exe.dgroup();
    const size_t o = kFactSheets + 2 * size_t(planetTemplate);
    if (planetTemplate < 1 || planetTemplate > 10 || o + 2 > dg.size()) return {};
    const uint16_t id = uint16_t(dg[o] | dg[o + 1] << 8);
    for (const auto& r : exe.resources()) {
        if (r.typeId != NeImage::RT_RCDATA || r.id != (0x8000 | id)) continue;
        std::vector<std::string> out;
        std::string s;
        for (uint8_t c : exe.resourceData(r)) {
            if (c == 0) {
                out.push_back(s);
                s.clear();
                if (out.size() == 9) break;
            } else {
                s.push_back(char(c));
            }
        }
        if (!s.empty() && out.size() < 9) out.push_back(s);
        return out;
    }
    return {};
}

} // namespace outpost::data
