// Win16 menu resources (RT_MENU) of OUTPOST.EXE: OPPOPMENU (the main
// window), TILEMENU (a building's pop-up), ... (resources.txt "MENUS").
#pragma once

#include <cstdint>
#include <optional>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

class NeImage;

struct MenuItem {
    uint16_t id{0};                 // command id (0 for pop-ups and separators)
    std::string text;               // "&" marks the access key; "\t" or spaces precede the key name
    bool separator{false};
    std::vector<MenuItem> children; // set for a pop-up
    bool popup() const { return !children.empty(); }
};

struct MenuResource {
    std::vector<MenuItem> items;

    // Header (version, offset), then items: word flags (MF_POPUP 0x10,
    // MF_END 0x80), [word id unless popup], zero-terminated text.
    static std::optional<MenuResource> parse(std::span<const uint8_t> bytes);
    static std::optional<MenuResource> load(const NeImage& exe, const std::string& name);
};

} // namespace outpost::data
