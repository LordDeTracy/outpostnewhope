// Milestone 7: the original's sounds, voices, movies and their sequences.

#include <catch2/catch_test_macros.hpp>

#include "data/building_names.hpp"
#include "data/flc.hpp"
#include "data/game_files.hpp"
#include "data/media.hpp"
#include "data/ne_image.hpp"
#include "data/pictures.hpp"
#include "data/planet_facts.hpp"
#include "data/string_table.hpp"

#include <filesystem>
#include <fstream>
#include <iterator>
#include <set>

using namespace outpost::data;

namespace {

struct Media {
    GameFiles files;
    NeImage exe;
    BuildingPictures pics;
    MediaNames names;
    StringTable strings;
    std::filesystem::path cd;
};

const Media& assets() {
    static Media m;
    static bool ok = [] {
        if (!m.files.open(OUTPOST_TEST_DATA_DIR)) return false;
        auto bytes = m.files.read("OUTPOST.EXE");
        if (!bytes || !m.exe.parse(std::move(*bytes))) return false;
        if (!m.pics.load(m.exe) || !m.names.load(m.exe, m.pics) || !m.strings.load(m.exe)) return false;
        auto cd = m.files.cdAssets();
        if (!cd) return false;
        m.cd = *cd;
        return true;
    }();
    REQUIRE(ok);
    return m;
}

std::vector<uint8_t> readFile(const std::filesystem::path& p) {
    std::ifstream f(p, std::ios::binary);
    return {std::istreambuf_iterator<char>(f), {}};
}

} // namespace

TEST_CASE("Sound, voice and movie names from OUTPOST.EXE", "[media]") {
    const auto& m = assets();
    REQUIRE(m.names.voice(0).empty());
    REQUIRE(m.names.voice(1) == "fem1.wav");                   // DGROUP 0x2E34
    REQUIRE(m.names.voice(140) == "fem140.wav");
    REQUIRE(m.names.voice(141) == "add1.wav");
    REQUIRE(m.names.voice(215) == "add75.wav");
    REQUIRE(m.names.sound(467) == "mars.mid");                 // catalog kind 3
    REQUIRE(m.names.sound(468) == "0wscinit.mid");
    REQUIRE(m.names.sound(472) == "explode");
    REQUIRE(m.names.sound(503) == "fr7_3");
    REQUIRE(m.names.movie(156) == "10.flc");                   // catalog kind 4
    REQUIRE(m.names.movie(240) == "453.flc");
    REQUIRE(m.names.picture(241) == "1030.bmp");
    REQUIRE(m.names.sound(156).empty());                       // a movie is not a sound
    // s5:BD80 cases 128..137: the starship's cargo (Starship Status).
    REQUIRE(buildingName(m.exe, m.strings, 128) == "Colonists");
    REQUIRE(buildingName(m.exe, m.strings, 130) == "Life Support");
    REQUIRE(buildingName(m.exe, m.strings, 137) == "ULBI Probe");
    REQUIRE(buildingName(m.exe, m.strings, 138).empty());
}

TEST_CASE("Every movie view, story page and voice has its file on the CD", "[media]") {
    const auto& m = assets();
    for (const auto& v : movieViews()) {
        INFO("mode " << int(v.mode));
        REQUIRE(findMedia(m.cd, "VIDEOS", m.names.movie(v.movie)).has_value());
        if (v.sound) REQUIRE(findMedia(m.cd, "MUSIC", m.names.sound(v.sound) + ".wav").has_value());
    }
    for (const auto& p : storyPages()) {
        INFO("mode " << int(p.mode));
        REQUIRE(findMedia(m.cd, "BITMAPS", m.names.picture(p.picture)).has_value());
        if (p.voice) REQUIRE(findMedia(m.cd, "MUSIC", m.names.voice(p.voice)).has_value());
        if (p.text1) REQUIRE_FALSE(m.strings.get(p.text1).empty());
    }
    for (uint16_t v = 1; v <= 215; ++v) {
        INFO("voice " << v);
        // Quirk Q64: the voice table names fem101.wav, which the CD lacks.
        REQUIRE(findMedia(m.cd, "MUSIC", m.names.voice(v)).has_value() == (v != 101));
    }
    REQUIRE(findMedia(m.cd, "MUSIC", m.names.sound(media::kTitleMusic)).has_value());
}

TEST_CASE("A planet's fact sheet is its template's Sol body (s3:4E9E)", "[media]") {
    const auto& m = assets();
    const auto mars = planetFacts(m.exe, 4);                   // template 4 -> RCDATA 335
    REQUIRE(mars.size() == 9);
    REQUIRE(mars[0] == "0.53 (6,794km)");
    REQUIRE(mars[2] == "24.62h");
    const auto jupiter = planetFacts(m.exe, 5);                // a gas giant: no sites
    REQUIRE(jupiter.size() == 9);
    REQUIRE(jupiter[1] == "318.0");
    REQUIRE(planetFacts(m.exe, 0).empty());
    REQUIRE(planetFacts(m.exe, 11).empty());
}

TEST_CASE("The Introduction runs from command 122 back to the main menu", "[media]") {
    // s2:0C60 command -> mode, each view posting its next command when done.
    std::vector<int> modes;
    uint16_t cmd = media::kIntroduction;
    std::set<uint16_t> seen;
    while (cmd != media::kMainMenu) {
        REQUIRE(seen.insert(cmd).second);                      // no loops
        const CommandScreen s = commandScreen(cmd);
        REQUIRE(s.kind == ScreenKind::Replace);
        modes.push_back(s.mode);
        if (const MovieView* v = movieView(s.mode)) cmd = v->next;
        else if (const StoryPage* p = storyPage(s.mode)) cmd = p->next;
        else FAIL("mode " << int(s.mode) << " is neither a movie nor a story page");
    }
    REQUIRE(modes.front() == 11);                              // 10.flc with mars.mid
    REQUIRE(modes.size() == 37);                        // 23 movies and 14 story pages
    int pages = 0;
    for (int mode : modes) pages += storyPage(mode) != nullptr;
    REQUIRE(pages == 14);                                      // every story page once
}

TEST_CASE("Message log entries start their event movies (s2:AB80)", "[media]") {
    const auto& m = assets();
    // The earthquake (log 23, string 1815): 310.flc with "earthqak".
    const CommandScreen quake = commandScreen(logMovieCommand(23));
    REQUIRE(quake.kind == ScreenKind::Overlay);
    const MovieView* v = movieView(quake.mode);
    REQUIRE(v);
    REQUIRE(m.names.movie(v->movie) == "310.flc");
    REQUIRE(m.names.sound(v->sound) == "earthqak");
    REQUIRE(v->next == 0);
    // Meteorites (log 22): four movies in a row.
    std::vector<std::string> chain;
    for (uint16_t cmd = logMovieCommand(22); cmd;) {
        const MovieView* mv = movieView(commandScreen(cmd).mode);
        REQUIRE(mv);
        chain.push_back(m.names.movie(mv->movie));
        cmd = mv->next;
    }
    REQUIRE(chain == std::vector<std::string>{"300.flc", "302.flc", "304.flc", "306.flc"});
    // The Seed lands (log 8): 170.flc then 180.flc.
    const MovieView* seed = movieView(commandScreen(logMovieCommand(8)).mode);
    REQUIRE(m.names.movie(seed->movie) == "170.flc");
    REQUIRE(m.names.movie(movieView(commandScreen(seed->next).mode)->movie) == "180.flc");
    REQUIRE(logMovieCommand(21) == 0);
    REQUIRE(logMovieCommand(7) == 0);
    REQUIRE(logMovieCommand(46) == 0);
}

TEST_CASE("Every FLC decodes, and its ring frame brings back the first frame", "[media][flc]") {
    const auto& m = assets();
    int files = 0;
    long frames = 0;
    std::error_code ec;
    for (const auto& e : std::filesystem::directory_iterator(m.cd / "VIDEOS", ec)) {
        const auto bytes = readFile(e.path());
        Flc flc;
        INFO(e.path().filename().string());
        REQUIRE(flc.open(bytes));
        REQUIRE(flc.width() > 0);
        REQUIRE(flc.msPerFrame() > 0);
        REQUIRE(flc.next());
        const std::vector<uint8_t> first = flc.pixels();
        for (int i = 1; i < flc.frames(); ++i) REQUIRE(flc.next());
        REQUIRE(flc.current() == flc.frames() - 1);
        REQUIRE(flc.next());                                   // the ring frame
        REQUIRE(flc.current() == 0);
        REQUIRE(flc.pixels() == first);
        ++files;
        frames += flc.frames();
    }
    REQUIRE(files == 92);
    REQUIRE(frames == 10108);                                  // 00-ground-truth §5
}
