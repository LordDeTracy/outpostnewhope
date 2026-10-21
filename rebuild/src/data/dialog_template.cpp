#include "data/dialog_template.hpp"

#include "data/ne_image.hpp"

#include <cstdlib>

namespace outpost::data {

namespace {

class Cursor {
public:
    explicit Cursor(std::span<const uint8_t> b) : m_b(b) {}
    bool ok() const { return m_ok; }
    uint8_t u8() {
        if (m_p + 1 > m_b.size()) { m_ok = false; return 0; }
        return m_b[m_p++];
    }
    uint16_t u16() { const uint16_t lo = u8(); return static_cast<uint16_t>(lo | (u8() << 8)); }
    uint32_t u32() { const uint32_t lo = u16(); return lo | (static_cast<uint32_t>(u16()) << 16); }
    std::string str() {
        std::string s;
        for (;;) {
            const uint8_t c = u8();
            if (!m_ok || c == 0) return s;
            s.push_back(static_cast<char>(c));
        }
    }
    // A string, or 0xFF + an ordinal (written as "#n").
    std::string strOrOrdinal() {
        if (m_p < m_b.size() && m_b[m_p] == 0xFF) {
            ++m_p;
            return "#" + std::to_string(u16());
        }
        return str();
    }
    void skip(size_t n) { if (m_p + n > m_b.size()) m_ok = false; else m_p += n; }

private:
    std::span<const uint8_t> m_b;
    size_t m_p{0};
    bool m_ok{true};
};

std::string predefinedClass(uint8_t c) {
    switch (c) {
        case 0x80: return "BUTTON";
        case 0x81: return "EDIT";
        case 0x82: return "STATIC";
        case 0x83: return "LISTBOX";
        case 0x84: return "SCROLLBAR";
        case 0x85: return "COMBOBOX";
        default: return "#" + std::to_string(c);
    }
}

} // namespace

std::optional<DialogTemplate> DialogTemplate::parse(std::span<const uint8_t> bytes) {
    Cursor c(bytes);
    DialogTemplate d;
    d.style = c.u32();
    const uint8_t count = c.u8();
    d.x = static_cast<int16_t>(c.u16());
    d.y = static_cast<int16_t>(c.u16());
    d.cx = static_cast<int16_t>(c.u16());
    d.cy = static_cast<int16_t>(c.u16());
    d.menu = c.strOrOrdinal();
    d.className = c.str();
    d.caption = c.str();
    if (d.style & 0x40) {                                  // DS_SETFONT
        d.fontSize = c.u16();
        d.font = c.str();
    }
    for (uint8_t i = 0; i < count && c.ok(); ++i) {
        Control k;
        k.x = static_cast<int16_t>(c.u16());
        k.y = static_cast<int16_t>(c.u16());
        k.cx = static_cast<int16_t>(c.u16());
        k.cy = static_cast<int16_t>(c.u16());
        k.id = c.u16();
        k.style = c.u32();
        const uint8_t first = c.u8();
        if (first & 0x80) {
            k.className = predefinedClass(first);
        } else if (first != 0) {
            k.className.push_back(static_cast<char>(first));
            k.className += c.str();
        }
        k.text = c.strOrOrdinal();
        c.skip(c.u8());                                    // creation data
        d.controls.push_back(std::move(k));
    }
    if (!c.ok()) return std::nullopt;
    return d;
}

std::optional<DialogTemplate> DialogTemplate::load(const NeImage& exe, uint16_t id) {
    for (const auto& r : exe.resources()) {
        if (r.typeId != NeImage::RT_DIALOG || r.id != (0x8000 | id)) continue;
        return parse(exe.resourceData(r));
    }
    return std::nullopt;
}

const DialogTemplate::Control* DialogTemplate::control(uint16_t id) const {
    for (const auto& k : controls)
        if (k.id == id) return &k;
    return nullptr;
}

std::optional<int> DialogTemplate::intOf(uint16_t id) const {
    const Control* k = control(id);
    if (!k || k->text.empty()) return std::nullopt;
    char* end = nullptr;
    const long v = std::strtol(k->text.c_str(), &end, 10);
    if (end == k->text.c_str() || *end != '\0') return std::nullopt;
    return static_cast<int>(v);
}

} // namespace outpost::data
