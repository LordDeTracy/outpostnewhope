#pragma once

#include <cstdint>
#include <optional>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

class NeImage;

// A Windows 3.x dialog template (RT_DIALOG): the 61 dialogs of OUTPOST.EXE.
// Some carry game data in their controls' texts, e.g. the Ship
// Configuration's weights and costs (dialog 4010).
struct DialogTemplate {
    struct Control {
        uint16_t id{0};
        uint32_t style{0};
        int16_t x{0}, y{0}, cx{0}, cy{0};
        std::string className;      // "BUTTON", "EDIT", "STATIC", ... or a registered class
        std::string text;
    };
    uint32_t style{0};
    int16_t x{0}, y{0}, cx{0}, cy{0};
    std::string menu, className, caption, font;
    uint16_t fontSize{0};
    std::vector<Control> controls;

    // Win16 layout: style, count, rect, menu, class, caption, [font]; then
    // each control: rect, id, style, class (byte 0x80.. or string), text,
    // extra-data length + data.
    static std::optional<DialogTemplate> parse(std::span<const uint8_t> bytes);
    // Dialog `id` of the executable.
    static std::optional<DialogTemplate> load(const NeImage& exe, uint16_t id);

    const Control* control(uint16_t id) const;
    Control* control(uint16_t id) {
        return const_cast<Control*>(static_cast<const DialogTemplate*>(this)->control(id));
    }
    // The control's text as a number (GetDlgItemInt, signed): nullopt when
    // the control is missing or its text is not a number.
    std::optional<int> intOf(uint16_t id) const;
};

} // namespace outpost::data
