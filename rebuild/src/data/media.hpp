// The original's sounds, voices, movies and the sequences built from them
// (findings/13-media.md). Names come from OUTPOST.EXE; the files from the
// CD's MUSIC and VIDEOS folders.
//
// The tables below are decoded code constants of OUTPOST.EXE (the view
// constructors, the main window's command switch and the message log's
// movie switch), not game data.
#pragma once

#include "data/ne_image.hpp"
#include "data/pictures.hpp"

#include <cstdint>
#include <filesystem>
#include <optional>
#include <span>
#include <string>
#include <vector>

namespace outpost::data {

// A movie view (s4:6A0E): the screen mode it is, the movie (catalog kind 4),
// the command it posts when the movie ends (0: none, the game goes on) and
// the sound (catalog kind 3) it starts with the movie (0: none).
struct MovieView {
    uint8_t mode;
    uint16_t movie, next, sound;
};

// A story page of the introduction (s4:C402 on s5:0762): one or two strings
// shown under a picture (catalog kind 1) while a voice line plays (index of
// the voice table, 0: none), for `ms`, then `next` is posted.
struct StoryPage {
    uint8_t mode;
    uint16_t text1, text2, picture, voice, ms, next;
};

// How a main-window command shows its screen (s2:0C60).
enum class ScreenKind : uint8_t {
    None,       // the command is not a screen
    Replace,    // s2:2DCC: the main view is replaced (introduction, voyage)
    Overlay,    // s2:2C4E: over the colony view, which comes back on command 121
};
struct CommandScreen {
    ScreenKind kind{ScreenKind::None};
    uint8_t mode{0};
};

// The 78 movie views, by mode.
std::span<const MovieView> movieViews();
const MovieView* movieView(int mode);
// The 14 story pages of the Introduction (modes 38..51) and mode 52, shown
// after the landing site is chosen.
std::span<const StoryPage> storyPages();
const StoryPage* storyPage(int mode);
// s2:0C60: the screen a command shows.
CommandScreen commandScreen(int command);
// s2:AB80: the movie command of a message log entry (codes 8..45), 0 if none.
uint16_t logMovieCommand(int code);

// Special commands and sounds.
namespace media {
constexpr uint16_t kIntroduction = 122;     // the Introduction's first movie (Program Control 116)
constexpr uint16_t kMainMenu = 201;         // mode 1: the Program Control screen
constexpr uint16_t kMovieDone = 121;        // s2:2D22: the overlay ends, the colony view returns
constexpr uint16_t kExitGame = 238;         // the main window closes (WM_CLOSE)
constexpr uint16_t kCheers = 256;           // plays "cheers"
constexpr uint16_t kTitleMusic = 467;       // mars.mid
constexpr uint16_t kMidiReset = 468;        // 0wscinit.mid, played by mode 1 (s5:08B6)
constexpr uint16_t kCheersSound = 476;
constexpr uint16_t kLaunchSound = 478;
constexpr int kSmlstpMode = 57;             // s4:742E: this movie view also plays
constexpr uint16_t kSmlstp = 489;           // "smlstp", once a run (DGROUP 0x4254)
}

// The names the EXE gives its sounds and voices.
class MediaNames {
public:
    bool load(const NeImage& exe, const BuildingPictures& pics);

    // DGROUP 0x2E34: voice line 1..215 ("fem1.wav".."fem140.wav",
    // "add1.wav".."add75.wav"); empty for 0 or out of range.
    std::string voice(uint16_t index) const;
    // Catalog kind 3 (467..503): "mars.mid", "explode", ... A name without
    // an extension is a sound effect: s3:84F8 adds ".wav" (or ".mid" when the
    // options say MIDI effects).
    std::string sound(uint16_t catalogId) const;
    // Catalog kind 4 (156..240): "10.flc" ...
    std::string movie(uint16_t catalogId) const;
    // Catalog kind 1: a picture file.
    std::string picture(uint16_t catalogId) const;

private:
    std::vector<std::string> m_voices;
    const BuildingPictures* m_pics{nullptr};
};

// A file of the CD's MUSIC or VIDEOS folder, found without regard to case.
std::optional<std::filesystem::path> findMedia(const std::filesystem::path& cdRoot, const std::string& folder,
                                               const std::string& name);

} // namespace outpost::data
