// Drawing helpers for the rebuild's screens: the original's bitmap sheets
// as textures, text, and simple boxes. SDL2 renderer + SDL2_ttf.
#pragma once

#include "data/pictures.hpp"

#include <SDL.h>
#include <SDL_ttf.h>

#include <filesystem>
#include <cstdint>
#include <map>
#include <tuple>
#include <string>

namespace outpost::app {

struct Colour {
    Uint8 r, g, b, a{255};
};

// The rebuild's UI theme: black, red, orange and gold (the user's choice;
// the original draws Windows 3.1 grey controls). Panel and button art is
// Kenney's "UI Pack: Sci-fi" (CC0), recoloured; fonts are Exo 2 and
// Orbitron (SIL OFL). All in rebuild/assets, none of it original data.
namespace ui {
constexpr Colour kFace{26, 13, 11},          // panel faces
    kShadow{150, 62, 30},                    // dim orange: frames, separators, disabled text
    kLight{236, 186, 64},                    // gold: bevel highlight
    kDark{0, 0, 0},
    kText{238, 214, 178},                    // warm off-white
    kTitle{178, 24, 20},                     // red title bars
    kTitleText{255, 222, 140},               // gold title text
    kHighlight{232, 110, 22},                // orange selection
    kHighlightText{16, 9, 8},                // black on orange
    kWindow{10, 5, 5},                       // list and edit wells
    kRed{178, 24, 20}, kOrange{232, 110, 22}, kGold{236, 186, 64};
}

class Gfx {
public:
    Gfx(SDL_Renderer* r, std::filesystem::path cdDir, std::filesystem::path fontFile);
    ~Gfx();
    Gfx(const Gfx&) = delete;
    Gfx& operator=(const Gfx&) = delete;

    SDL_Renderer* renderer() const { return m_r; }
    bool hasFont() const { return m_font != nullptr; }

    // A BITMAPS file as a texture (case-insensitive); palette index 255
    // (white) is clear when `keyed`. Cached; nullptr if absent.
    SDL_Texture* bitmap(const std::string& file, bool keyed = true);

    // Draw part of a bitmap file at (x, y) scaled by `scale`.
    void blit(const std::string& file, const SDL_Rect& src, float x, float y, float scale = 1.0f,
              Uint8 alpha = 255);

    // Text (single line). Returns its width.
    int text(const std::string& s, int x, int y, Colour c = ui::kText, bool bold = false);
    int textWidth(const std::string& s, bool bold = false);
    int lineHeight() const { return m_lineH; }

    void fill(const SDL_Rect& r, Colour c);
    void frame(const SDL_Rect& r, Colour c);
    // A raised (or sunken) box in the theme: dark face, gold / red edges.
    void bevel(const SDL_Rect& r, bool sunken = false);

    // Theme art (assets/ui next to the executable), drawn as nine-slices so
    // corners keep their shape. Each falls back to plain boxes if missing.
    void panel(const SDL_Rect& r, bool screws = false);
    // A title bar; the blade grows to fit a heading `textWidth` wide.
    void titleBar(const SDL_Rect& r, int textWidth = 0);
    enum class ButtonState { Normal, Hot, Down };
    void button(const SDL_Rect& r, ButtonState s);
    // Heading text (Orbitron). Returns its width.
    int heading(const std::string& s, int x, int y, Colour c = ui::kTitleText);
    int headingWidth(const std::string& s);
    // Large title text (Orbitron), for the main menu. Returns its width.
    int title(const std::string& s, int x, int y, Colour c = ui::kGold);
    int titleWidth(const std::string& s);
    // Title text embossed (dark drop, light rim) with a face fading from
    // `top` to `bottom`. Returns its width.
    int titleEmbossed(const std::string& s, int x, int y, Colour top, Colour bottom);

    // The folder the fonts and UI art came from (beside the executable).
    const std::filesystem::path& assets() const { return m_assets; }
    // A PNG file drawn scaled into `dst` (cached by path; IMG_Load).
    void image(const std::filesystem::path& file, const SDL_Rect& src, const SDL_FRect& dst, Uint8 alpha = 255);

private:
    SDL_Texture* render(const std::string& s, Colour c, bool bold, TTF_Font* font = nullptr);
    SDL_Texture* art(const std::string& name);
    void nine(SDL_Texture* t, const SDL_Rect& r, int corner);

    SDL_Renderer* m_r;
    std::filesystem::path m_cd;
    TTF_Font* m_font{nullptr};
    TTF_Font* m_bold{nullptr};
    TTF_Font* m_head{nullptr};
    TTF_Font* m_title{nullptr};
    std::filesystem::path m_assets;
    std::map<std::string, SDL_Texture*> m_art;
    int m_lineH{14};
    std::map<std::string, SDL_Texture*> m_bitmaps;
    struct TextKey {
        std::string s;
        uint32_t rgba;
        bool bold;
        const void* font;
        bool operator<(const TextKey& o) const {
            return std::tie(s, rgba, bold, font) < std::tie(o.s, o.rgba, o.bold, o.font);
        }
    };
    std::map<TextKey, std::pair<SDL_Texture*, SDL_Point>> m_text;
};

} // namespace outpost::app
