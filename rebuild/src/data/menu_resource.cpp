#include "data/menu_resource.hpp"

#include "data/ne_image.hpp"

#include <cctype>

namespace outpost::data {

namespace {

constexpr uint16_t kPopup = 0x10, kEnd = 0x80;

bool parseItems(std::span<const uint8_t> b, size_t& p, std::vector<MenuItem>& out) {
    for (;;) {
        if (p + 2 > b.size()) return false;
        const uint16_t flags = static_cast<uint16_t>(b[p] | (b[p + 1] << 8));
        p += 2;
        MenuItem item;
        if (!(flags & kPopup)) {
            if (p + 2 > b.size()) return false;
            item.id = static_cast<uint16_t>(b[p] | (b[p + 1] << 8));
            p += 2;
        }
        while (p < b.size() && b[p]) item.text.push_back(static_cast<char>(b[p++]));
        if (p >= b.size()) return false;
        ++p;
        if (flags & kPopup) {
            if (!parseItems(b, p, item.children)) return false;
        } else if (item.id == 0 && item.text.empty()) {
            item.separator = true;
        }
        out.push_back(std::move(item));
        if (flags & kEnd) return true;
    }
}

} // namespace

std::optional<MenuResource> MenuResource::parse(std::span<const uint8_t> b) {
    if (b.size() < 4) return std::nullopt;
    size_t p = 4 + static_cast<size_t>(b[2] | (b[3] << 8));
    MenuResource m;
    if (!parseItems(b, p, m.items)) return std::nullopt;
    return m;
}

std::optional<MenuResource> MenuResource::load(const NeImage& exe, const std::string& name) {
    auto upper = [](std::string s) {
        for (auto& c : s) c = static_cast<char>(std::toupper(static_cast<unsigned char>(c)));
        return s;
    };
    for (const auto& r : exe.resources())
        if (r.typeId == NeImage::RT_MENU && upper(r.name) == upper(name)) return parse(exe.resourceData(r));
    return std::nullopt;
}

} // namespace outpost::data
