#include "app/gfx.hpp"

#include "data/site_maps.hpp"

#include <SDL_image.h>

#include <algorithm>
#include <tuple>
#include <vector>

namespace outpost::app {

Gfx::Gfx(SDL_Renderer* r, std::filesystem::path cdDir, std::filesystem::path fontFile)
    : m_r(r), m_cd(std::move(cdDir)), m_assets(fontFile.parent_path()) {
    if (TTF_WasInit() || TTF_Init() == 0) {
        // Exo 2 for text, Orbitron for headings; DejaVu (fontFile) if absent.
        auto open = [&](const char* name, int size) -> TTF_Font* {
            const auto p = m_assets / name;
            return std::filesystem::exists(p) ? TTF_OpenFont(p.string().c_str(), size) : nullptr;
        };
        m_font = open("Exo2.ttf", 14);
        m_bold = open("Exo2.ttf", 14);
        if (!m_font) m_font = TTF_OpenFont(fontFile.string().c_str(), 13);
        if (!m_bold) m_bold = TTF_OpenFont(fontFile.string().c_str(), 13);
        if (m_bold) TTF_SetFontStyle(m_bold, TTF_STYLE_BOLD);
        m_head = open("Orbitron.ttf", 13);
        if (m_head) TTF_SetFontStyle(m_head, TTF_STYLE_BOLD);
        m_title = open("Orbitron.ttf", 40);
        if (!m_title) m_title = TTF_OpenFont(fontFile.string().c_str(), 36);
        if (m_title) TTF_SetFontStyle(m_title, TTF_STYLE_BOLD);
        if (m_font) m_lineH = TTF_FontLineSkip(m_font);
    }
    IMG_Init(IMG_INIT_PNG);
}

Gfx::~Gfx() {
    for (auto& [k, t] : m_bitmaps)
        if (t) SDL_DestroyTexture(t);
    for (auto& [k, t] : m_text)
        if (t.first) SDL_DestroyTexture(t.first);
    for (auto& [k, t] : m_art)
        if (t) SDL_DestroyTexture(t);
    if (m_font) TTF_CloseFont(m_font);
    if (m_bold) TTF_CloseFont(m_bold);
    if (m_head) TTF_CloseFont(m_head);
    if (m_title) TTF_CloseFont(m_title);
}

SDL_Texture* Gfx::bitmap(const std::string& file, bool keyed) {
    const std::string key = file + (keyed ? "|k" : "|o");
    if (auto it = m_bitmaps.find(key); it != m_bitmaps.end()) return it->second;
    SDL_Texture* tex = nullptr;
    data::IndexedBitmap bmp;
    if (auto bytes = data::readBitmapFile(m_cd, file); bytes && bmp.load(*bytes)) {
        // Palette index 255 (white) is the sheets' transparent colour.
        const uint8_t clear = 255;
        std::vector<uint32_t> argb(bmp.pixels.size());
        for (size_t i = 0; i < argb.size(); ++i) {
            const uint8_t idx = bmp.pixels[i];
            argb[i] = keyed && idx == clear ? 0u : (0xFF000000u | bmp.palette[idx]);
        }
        if (keyed) {
            // The sprite sheets frame each picture in a labelled box (index
            // 171); some cut-outs reach into it. Long straight runs of that
            // colour are box lines, not art: clear them.
            const int W = bmp.width, H = bmp.height;
            auto box = [&](int x, int y) { return bmp.pixels[size_t(y) * W + x] == 171; };
            for (int y = 0; y < H; ++y)
                for (int x = 0; x < W; ++x) {
                    if (!box(x, y)) continue;
                    int run = 1, col = 1;
                    for (int k = x + 1; k < W && box(k, y) && run < 16; ++k) ++run;
                    for (int k = x - 1; k >= 0 && box(k, y) && run < 16; --k) ++run;
                    for (int k = y + 1; k < H && box(x, k) && col < 16; ++k) ++col;
                    for (int k = y - 1; k >= 0 && box(x, k) && col < 16; --k) ++col;
                    if (run >= 16 || col >= 16) argb[size_t(y) * W + x] = 0u;
                }
        }
        if (SDL_Surface* s = SDL_CreateRGBSurfaceWithFormatFrom(argb.data(), bmp.width, bmp.height, 32,
                                                                bmp.width * 4, SDL_PIXELFORMAT_ARGB8888)) {
            tex = SDL_CreateTextureFromSurface(m_r, s);
            SDL_FreeSurface(s);
            if (tex) SDL_SetTextureBlendMode(tex, SDL_BLENDMODE_BLEND);
        }
    }
    m_bitmaps[key] = tex;
    return tex;
}

void Gfx::blit(const std::string& file, const SDL_Rect& src, float x, float y, float scale, Uint8 alpha) {
    SDL_Texture* t = bitmap(file);
    if (!t) return;
    SDL_SetTextureAlphaMod(t, alpha);
    const SDL_FRect dst{x, y, src.w * scale, src.h * scale};
    SDL_RenderCopyF(m_r, t, &src, &dst);
    SDL_SetTextureAlphaMod(t, 255);
}

SDL_Texture* Gfx::render(const std::string& s, Colour c, bool bold, TTF_Font* font) {
    TTF_Font* f = font ? font : bold && m_bold ? m_bold : m_font;
    if (!f || s.empty()) return nullptr;
    const TextKey key{s, (uint32_t(c.r) << 24) | (uint32_t(c.g) << 16) | (uint32_t(c.b) << 8) | c.a, bold, f};
    if (auto it = m_text.find(key); it != m_text.end()) return it->second.first;
    if (m_text.size() > 4000) {                     // a simple bound on the cache
        for (auto& [k, t] : m_text)
            if (t.first) SDL_DestroyTexture(t.first);
        m_text.clear();
    }
    SDL_Texture* tex = nullptr;
    SDL_Point size{0, 0};
    if (SDL_Surface* surf = TTF_RenderUTF8_Blended(f, s.c_str(), SDL_Color{c.r, c.g, c.b, c.a})) {
        tex = SDL_CreateTextureFromSurface(m_r, surf);
        size = {surf->w, surf->h};
        SDL_FreeSurface(surf);
    }
    m_text[key] = {tex, size};
    return tex;
}

int Gfx::text(const std::string& s, int x, int y, Colour c, bool bold) {
    SDL_Texture* t = render(s, c, bold);
    if (!t) return 0;
    int w, h;
    SDL_QueryTexture(t, nullptr, nullptr, &w, &h);
    const SDL_Rect dst{x, y, w, h};
    SDL_RenderCopy(m_r, t, nullptr, &dst);
    return w;
}

int Gfx::textWidth(const std::string& s, bool bold) {
    TTF_Font* f = bold && m_bold ? m_bold : m_font;
    int w = 0, h = 0;
    if (f && !s.empty()) TTF_SizeUTF8(f, s.c_str(), &w, &h);
    return w;
}

void Gfx::fill(const SDL_Rect& r, Colour c) {
    SDL_SetRenderDrawBlendMode(m_r, c.a == 255 ? SDL_BLENDMODE_NONE : SDL_BLENDMODE_BLEND);
    SDL_SetRenderDrawColor(m_r, c.r, c.g, c.b, c.a);
    SDL_RenderFillRect(m_r, &r);
}

void Gfx::frame(const SDL_Rect& r, Colour c) {
    SDL_SetRenderDrawBlendMode(m_r, SDL_BLENDMODE_NONE);
    SDL_SetRenderDrawColor(m_r, c.r, c.g, c.b, c.a);
    SDL_RenderDrawRect(m_r, &r);
}

void Gfx::bevel(const SDL_Rect& r, bool sunken) {
    fill(r, sunken ? ui::kWindow : ui::kFace);
    const Colour tl = sunken ? ui::kRed : ui::kLight, br = sunken ? ui::kLight : ui::kRed;
    SDL_SetRenderDrawBlendMode(m_r, SDL_BLENDMODE_NONE);
    SDL_SetRenderDrawColor(m_r, tl.r, tl.g, tl.b, 255);
    SDL_RenderDrawLine(m_r, r.x, r.y, r.x + r.w - 1, r.y);
    SDL_RenderDrawLine(m_r, r.x, r.y, r.x, r.y + r.h - 1);
    SDL_SetRenderDrawColor(m_r, br.r, br.g, br.b, 255);
    SDL_RenderDrawLine(m_r, r.x, r.y + r.h - 1, r.x + r.w - 1, r.y + r.h - 1);
    SDL_RenderDrawLine(m_r, r.x + r.w - 1, r.y, r.x + r.w - 1, r.y + r.h - 1);
}

// ── Theme art ─────────────────────────────────────────────────────────────

SDL_Texture* Gfx::art(const std::string& name) {
    if (auto it = m_art.find(name); it != m_art.end()) return it->second;
    SDL_Texture* t = IMG_LoadTexture(m_r, (m_assets / "ui" / name).string().c_str());
    if (t) SDL_SetTextureBlendMode(t, SDL_BLENDMODE_BLEND);
    m_art[name] = t;
    return t;
}

void Gfx::image(const std::filesystem::path& file, const SDL_Rect& src, const SDL_FRect& dst, Uint8 alpha) {
    const std::string key = "png|" + file.string();
    auto it = m_art.find(key);
    if (it == m_art.end()) {
        SDL_Texture* t = IMG_LoadTexture(m_r, file.string().c_str());
        if (t) SDL_SetTextureBlendMode(t, SDL_BLENDMODE_BLEND);
        it = m_art.emplace(key, t).first;
    }
    if (!it->second) return;
    SDL_SetTextureAlphaMod(it->second, alpha);
    SDL_RenderCopyF(m_r, it->second, &src, &dst);
    SDL_SetTextureAlphaMod(it->second, 255);
}

// Corners stay their size, edges stretch along one axis, the middle both.
void Gfx::nine(SDL_Texture* t, const SDL_Rect& r, int c) {
    int tw, th;
    SDL_QueryTexture(t, nullptr, nullptr, &tw, &th);
    const int dc = std::min({c, r.w / 2, r.h / 2});
    const int sx[4] = {0, c, tw - c, tw}, sy[4] = {0, c, th - c, th};
    const int dx[4] = {r.x, r.x + dc, r.x + r.w - dc, r.x + r.w}, dy[4] = {r.y, r.y + dc, r.y + r.h - dc, r.y + r.h};
    for (int j = 0; j < 3; ++j)
        for (int i = 0; i < 3; ++i) {
            const SDL_Rect src{sx[i], sy[j], sx[i + 1] - sx[i], sy[j + 1] - sy[j]};
            const SDL_Rect dst{dx[i], dy[j], dx[i + 1] - dx[i], dy[j + 1] - dy[j]};
            if (dst.w > 0 && dst.h > 0) SDL_RenderCopy(m_r, t, &src, &dst);
        }
}

void Gfx::panel(const SDL_Rect& r, bool screws) {
    if (SDL_Texture* t = art(screws ? "panel_screws.png" : "panel.png")) {
        nine(t, r, 16);
        return;
    }
    bevel(r);
    frame(r, ui::kDark);
}

// A slanted blade (red to orange) over a dark bar with a gold rule, after
// the pack's "header blade" shape.
void Gfx::titleBar(const SDL_Rect& r, int textWidth) {
    fill(r, ui::kWindow);
    const float x = float(r.x), y = float(r.y), h = float(r.h);
    float blade = std::min(float(r.w) * 0.55f, std::max(180.0f, float(r.w) * 0.4f));
    blade = std::min(std::max(blade, float(textWidth) + 14.0f + h), float(r.w) - 12.0f);
    auto col = [](Colour c, Uint8 a = 255) { return SDL_Color{c.r, c.g, c.b, a}; };
    const SDL_Vertex v[4] = {
        {{x, y}, col(ui::kRed), {0, 0}},
        {{x + blade, y}, col(ui::kOrange), {0, 0}},
        {{x + blade - h, y + h}, col(ui::kOrange), {0, 0}},
        {{x, y + h}, col(ui::kRed), {0, 0}},
    };
    const int idx[6] = {0, 1, 2, 0, 2, 3};
    SDL_SetRenderDrawBlendMode(m_r, SDL_BLENDMODE_BLEND);
    SDL_RenderGeometry(m_r, nullptr, v, 4, idx, 6);
    // A thin trailing stripe, then the gold rule.
    const SDL_Vertex s2[4] = {
        {{x + blade + 4, y}, col(ui::kOrange, 160), {0, 0}},
        {{x + blade + 10, y}, col(ui::kGold, 160), {0, 0}},
        {{x + blade + 10 - h, y + h}, col(ui::kGold, 160), {0, 0}},
        {{x + blade + 4 - h, y + h}, col(ui::kOrange, 160), {0, 0}},
    };
    SDL_RenderGeometry(m_r, nullptr, s2, 4, idx, 6);
    fill({r.x, r.y + r.h - 1, r.w, 1}, ui::kGold);
}

void Gfx::button(const SDL_Rect& r, ButtonState s) {
    const char* name = s == ButtonState::Down ? "button_down.png" : s == ButtonState::Hot ? "button_hot.png" : "button.png";
    if (SDL_Texture* t = art(name)) {
        nine(t, r, 10);
        return;
    }
    bevel(r, s == ButtonState::Down);
    frame(r, ui::kDark);
}

int Gfx::heading(const std::string& s, int x, int y, Colour c) {
    SDL_Texture* t = render(s, c, true, m_head);
    if (!t) return 0;
    int w, h;
    SDL_QueryTexture(t, nullptr, nullptr, &w, &h);
    const SDL_Rect dst{x, y, w, h};
    SDL_RenderCopy(m_r, t, nullptr, &dst);
    return w;
}

int Gfx::headingWidth(const std::string& s) {
    TTF_Font* f = m_head ? m_head : m_bold;
    int w = 0, h = 0;
    if (f && !s.empty()) TTF_SizeUTF8(f, s.c_str(), &w, &h);
    return w;
}

int Gfx::title(const std::string& s, int x, int y, Colour c) {
    if (!m_title) return heading(s, x, y, c);
    SDL_Texture* t = render(s, c, true, m_title);
    if (!t) return 0;
    int w, h;
    SDL_QueryTexture(t, nullptr, nullptr, &w, &h);
    const SDL_Rect dst{x, y, w, h};
    SDL_RenderCopy(m_r, t, nullptr, &dst);
    return w;
}

int Gfx::titleEmbossed(const std::string& s, int x, int y, Colour top, Colour bottom) {
    // One white rendering, tinted per row: the face fades top to bottom.
    SDL_Texture* t = render(s, Colour{255, 255, 255}, true, m_title ? m_title : m_head);
    if (!t) return 0;
    int w, h;
    SDL_QueryTexture(t, nullptr, nullptr, &w, &h);
    auto draw = [&](int dx, int dy, Colour c, Uint8 a) {
        SDL_SetTextureColorMod(t, c.r, c.g, c.b);
        SDL_SetTextureAlphaMod(t, a);
        const SDL_Rect dst{x + dx, y + dy, w, h};
        SDL_RenderCopy(m_r, t, nullptr, &dst);
    };
    draw(3, 3, Colour{0, 0, 0}, 200);          // drop shadow
    draw(1, 1, Colour{70, 10, 5}, 255);        // lower bevel
    draw(-1, -1, Colour{255, 245, 200}, 230);  // upper rim
    SDL_SetTextureAlphaMod(t, 255);
    for (int row = 0; row < h; row += 2) {
        const float k = float(row) / float(std::max(1, h - 1));
        const Colour c{Uint8(top.r + (bottom.r - top.r) * k), Uint8(top.g + (bottom.g - top.g) * k),
                       Uint8(top.b + (bottom.b - top.b) * k)};
        SDL_SetTextureColorMod(t, c.r, c.g, c.b);
        const SDL_Rect src{0, row, w, std::min(2, h - row)};
        const SDL_Rect dst{x, y + row, w, src.h};
        SDL_RenderCopy(m_r, t, &src, &dst);
    }
    SDL_SetTextureColorMod(t, 255, 255, 255);
    return w;
}

int Gfx::titleWidth(const std::string& s) {
    if (!m_title) return headingWidth(s);
    int w = 0, h = 0;
    if (!s.empty()) TTF_SizeUTF8(m_title, s.c_str(), &w, &h);
    return w;
}

} // namespace outpost::app
