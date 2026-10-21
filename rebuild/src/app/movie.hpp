// An FLC movie on the screen, as the original's movie view plays it through
// MCI (s2:53AE: mciaap.drv, MCI_PLAY with MCI_WAIT): once, at the file's
// speed, centred (s4:6ADC). The rebuild scales the 640x480 screen the
// original assumed (s4:6A0E) to the window.
#pragma once

#include "data/flc.hpp"

#include <SDL.h>

#include <cstdint>
#include <filesystem>
#include <vector>

namespace outpost::app {

class Movie {
public:
    ~Movie();
    bool open(SDL_Renderer* ren, const std::filesystem::path& file);
    // Starts the clock; the first frame shows at once.
    void start(uint32_t nowMs);
    // Advances to the frame due at `nowMs`; false once the last frame has had its time.
    bool update(uint32_t nowMs);
    void draw(const SDL_Rect& screen);
    bool done() const { return m_done; }

private:
    bool upload();

    SDL_Renderer* m_ren{nullptr};
    SDL_Texture* m_tex{nullptr};
    std::vector<uint8_t> m_bytes;
    data::Flc m_flc;
    uint32_t m_start{0};
    int m_shown{-1};
    bool m_done{false};
};

} // namespace outpost::app
