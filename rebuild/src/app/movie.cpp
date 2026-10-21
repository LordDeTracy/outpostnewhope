#include "app/movie.hpp"

#include <algorithm>
#include <fstream>
#include <iterator>

namespace outpost::app {

namespace {
constexpr int kScreenW = 640, kScreenH = 480;      // the original's screen (s4:6A0E: 0x27F, 0x1DF)
}

Movie::~Movie() {
    if (m_tex) SDL_DestroyTexture(m_tex);
}

bool Movie::open(SDL_Renderer* ren, const std::filesystem::path& file) {
    m_ren = ren;
    std::ifstream f(file, std::ios::binary);
    if (!f) return false;
    m_bytes.assign(std::istreambuf_iterator<char>(f), {});
    if (!m_flc.open(m_bytes)) return false;
    m_tex = SDL_CreateTexture(ren, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STREAMING, m_flc.width(),
                              m_flc.height());
    return m_tex != nullptr;
}

void Movie::start(uint32_t nowMs) {
    m_start = nowMs;
    m_shown = -1;
    m_done = false;
    update(nowMs);
}

bool Movie::update(uint32_t nowMs) {
    if (m_done || !m_tex) return false;
    const uint32_t speed = std::max<uint32_t>(m_flc.msPerFrame(), 1);
    const int due = int((nowMs - m_start) / speed);
    if (due >= m_flc.frames()) {
        m_done = true;
        return false;
    }
    bool changed = false;
    while (m_shown < due) {
        if (!m_flc.next()) {
            m_done = true;
            return false;
        }
        ++m_shown;
        changed = true;
    }
    if (changed) upload();
    return true;
}

bool Movie::upload() {
    void* pixels = nullptr;
    int pitch = 0;
    if (SDL_LockTexture(m_tex, nullptr, &pixels, &pitch) != 0) return false;
    const auto& pal = m_flc.palette();
    const auto& src = m_flc.pixels();
    for (int y = 0; y < m_flc.height(); ++y) {
        auto* row = reinterpret_cast<uint32_t*>(static_cast<uint8_t*>(pixels) + size_t(y) * size_t(pitch));
        const uint8_t* s = src.data() + size_t(y) * size_t(m_flc.width());
        for (int x = 0; x < m_flc.width(); ++x) {
            const size_t i = size_t(s[x]) * 3;
            row[x] = 0xFF000000u | uint32_t(pal[i]) << 16 | uint32_t(pal[i + 1]) << 8 | pal[i + 2];
        }
    }
    SDL_UnlockTexture(m_tex);
    return true;
}

void Movie::draw(const SDL_Rect& screen) {
    if (!m_tex) return;
    const float k = std::min(float(screen.w) / kScreenW, float(screen.h) / kScreenH);
    const int w = int(m_flc.width() * k), h = int(m_flc.height() * k);
    const SDL_Rect dst{screen.x + (screen.w - w) / 2, screen.y + (screen.h - h) / 2, w, h};
    SDL_RenderCopy(m_ren, m_tex, nullptr, &dst);
}

} // namespace outpost::app
