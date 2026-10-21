#include "data/string_table.hpp"

#include "data/ne_image.hpp"

namespace outpost::data {

bool StringTable::load(const NeImage& exe) {
    m_strings.clear();
    for (const auto& r : exe.resources()) {
        if (r.typeId != NeImage::RT_STRING || !(r.id & 0x8000)) continue;
        const uint16_t block = r.id & 0x7FFF;
        auto data = exe.resourceData(r);
        size_t p = 0;
        for (uint16_t i = 0; i < 16 && p < data.size(); ++i) {
            const size_t n = data[p];
            if (p + 1 + n > data.size()) return false;
            if (n) {
                m_strings[static_cast<uint16_t>((block - 1) * 16 + i)] =
                    std::string(reinterpret_cast<const char*>(data.data() + p + 1), n);
            }
            p += 1 + n;
        }
    }
    return !m_strings.empty();
}

const std::string& StringTable::get(uint16_t id) const {
    static const std::string empty;
    auto it = m_strings.find(id);
    return it == m_strings.end() ? empty : it->second;
}

} // namespace outpost::data
