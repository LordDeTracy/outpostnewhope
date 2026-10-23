// The original's chains of movie views and story pages (findings/13-media.md
// §3): each screen posts its next command when it is done (s4:6BB6,
// s5:03B2), and the main window shows that command's screen (s2:0C60),
// until a command that is neither a movie nor a story page: the main menu
// (201) ends the Introduction, 0 lets the game go on (s2:2D22, command 121),
// 238 closes the game.
#pragma once

#include "app/audio.hpp"
#include "app/gfx.hpp"
#include "app/movie.hpp"
#include "app/prefs.hpp"
#include "data/media.hpp"
#include "data/ne_image.hpp"
#include "data/pictures.hpp"
#include "data/string_table.hpp"

#include <SDL.h>

#include <filesystem>
#include <deque>
#include <memory>
#include <vector>

namespace outpost::app {

class Sequence {
public:
    Sequence(SDL_Renderer* ren, Gfx& gfx, const data::MediaNames& names, const data::StringTable& strings,
             Audio& audio, std::filesystem::path cdRoot, Preferences& prefs);

    // Runs the chain that starts at `command`. False (and nothing shown) if
    // the command is not a movie view or a story page.
    bool start(uint16_t command, uint32_t nowMs);
    // IMPROVED (I55): plays these movie views one after the other (their
    // own next commands are not followed); Esc skips them all. False if
    // nothing plays (Animated Sequences off, no files).
    bool playModes(std::vector<int> modes, uint32_t nowMs);
    bool active() const { return m_active; }
    // The command that ended the chain (0: none).
    uint16_t endCommand() const { return m_end; }

    void tick(uint32_t nowMs);
    void draw(const SDL_Rect& screen);
    void event(const SDL_Event& e, uint32_t nowMs);
    // Scripted runs: the mode on the screen (0: none).
    int mode() const { return m_mode; }

private:
    void go(uint16_t command, uint32_t nowMs);
    void next(uint32_t nowMs);
    void finish(uint16_t command);
    void skipChain();                 // Esc on a movie: to the chain's end command

    SDL_Renderer* m_ren;
    Gfx& m_gfx;
    const data::MediaNames& m_names;
    const data::StringTable& m_strings;
    Audio& m_audio;
    std::filesystem::path m_cd;
    Preferences& m_prefs;

    bool m_active{false};
    uint16_t m_end{0};
    int m_mode{0};
    std::unique_ptr<Movie> m_movie;
    const data::MovieView* m_view{nullptr};
    const data::StoryPage* m_page{nullptr};
    uint32_t m_pageStart{0};
    std::deque<int> m_queue;          // playModes: the movies still to come
    bool m_queued{false};
    bool playNextQueued(uint32_t nowMs);
    void playViewSounds(const data::MovieView& view, int mode);
    bool m_smlstpPlayed{false};       // DGROUP 0x4254, never cleared
};

// The media names, the sound manager and the sequence player the screens
// share (made once by main).
struct Media {
    Media(SDL_Renderer* ren, Gfx& gfx, const data::NeImage& exe, const data::BuildingPictures& pics,
          const data::StringTable& strings, const std::filesystem::path& cdRoot, Preferences& prefs);
    data::MediaNames names;
    Audio audio;
    Sequence sequence;
};

} // namespace outpost::app
