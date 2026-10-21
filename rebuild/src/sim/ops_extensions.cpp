#include "sim/ops_extensions.hpp"

#include <map>
#include <stdexcept>

namespace outpost::sim {

namespace {
struct Entry {
    ExtensionSaver save;
    ExtensionLoader load;
};
std::map<std::string, Entry>& registry() {
    static std::map<std::string, Entry> r;
    return r;
}
} // namespace

void registerExtension(const std::string& name, ExtensionSaver save, ExtensionLoader load) {
    if (name.empty() || name.size() > 255) throw std::invalid_argument("bad extension name");
    registry()[name] = Entry{std::move(save), std::move(load)};
}

std::vector<uint8_t> saveExtensions(const Simulation& sim) {
    std::vector<std::pair<const std::string*, std::vector<uint8_t>>> parts;
    for (const auto& [name, e] : registry())
        if (e.save)
            if (auto bytes = e.save(sim); !bytes.empty()) parts.emplace_back(&name, std::move(bytes));
    std::vector<uint8_t> out;
    if (parts.empty()) return out;
    auto u16 = [&](uint32_t v) { out.push_back(uint8_t(v)); out.push_back(uint8_t(v >> 8)); };
    u16(static_cast<uint32_t>(parts.size()));
    for (const auto& [name, bytes] : parts) {
        out.push_back(static_cast<uint8_t>(name->size()));
        out.insert(out.end(), name->begin(), name->end());
        u16(static_cast<uint32_t>(bytes.size()));
        u16(static_cast<uint32_t>(bytes.size() >> 16));
        out.insert(out.end(), bytes.begin(), bytes.end());
    }
    return out;
}

void loadExtensions(Simulation& sim, std::span<const uint8_t> b) {
    size_t p = 0;
    auto need = [&](size_t n) {
        if (p + n > b.size()) throw std::runtime_error("extension chunk 7e: truncated");
    };
    need(2);
    const uint32_t count = b[0] | (b[1] << 8);
    p = 2;
    for (uint32_t i = 0; i < count; ++i) {
        need(1);
        const size_t len = b[p++];
        need(len);
        const std::string name(reinterpret_cast<const char*>(b.data() + p), len);
        p += len;
        need(4);
        const size_t size = b[p] | (b[p + 1] << 8) | (size_t(b[p + 2]) << 16) | (size_t(b[p + 3]) << 24);
        p += 4;
        need(size);
        if (auto it = registry().find(name); it != registry().end() && it->second.load)
            it->second.load(sim, b.subspan(p, size));
        p += size;
    }
}

} // namespace outpost::sim
