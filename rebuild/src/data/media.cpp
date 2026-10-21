#include "data/media.hpp"

#include <algorithm>
#include <array>
#include <cctype>

namespace outpost::data {

namespace {

// s4:6D02..s4:7D70: {mode, movie, next command, sound}, as each view's
// constructor passes them to s4:6A0E. Mode 11 also starts mars.mid (s2:15D4
// case 11); mode 34's class plays "smlstp" (489) from its own method
// (s4:742E), which is not decoded.
constexpr MovieView kMovies[] = {
    {11, 156, 139, 0},   {12, 157, 208, 0},   {13, 158, 209, 0},   {14, 159, 210, 0},   {15, 160, 212, 0},
    {16, 161, 218, 0},   {17, 162, 220, 0},   {18, 163, 211, 0},   {19, 164, 219, 0},   {20, 165, 165, 0},
    {21, 167, 178, 0},   {22, 168, 0, 0},     {23, 175, 192, 0},   {24, 176, 193, 0},   {25, 177, 128, 0},
    {26, 178, 195, 492}, {27, 179, 196, 0},   {28, 180, 216, 0},   {29, 181, 123, 0},   {30, 182, 217, 0},
    {31, 183, 125, 0},   {33, 185, 221, 0},   {34, 188, 213, 0},   {35, 211, 214, 0},   {36, 212, 215, 493},
    {37, 233, 238, 0},   {53, 186, 129, 0},   {54, 189, 205, 0},   {55, 190, 131, 0},   {56, 191, 0, 0},
    {57, 187, 0, 0},     {58, 192, 133, 0},   {59, 193, 134, 482}, {60, 194, 135, 0},   {61, 195, 136, 0},
    {62, 196, 0, 0},     {63, 197, 0, 0},     {64, 198, 0, 0},     {65, 199, 141, 0},   {66, 200, 0, 0},
    {67, 201, 0, 0},     {68, 204, 0, 0},     {69, 205, 0, 0},     {70, 209, 146, 0},   {71, 210, 0, 0},
    {72, 213, 0, 0},     {73, 214, 0, 0},     {74, 215, 152, 500}, {75, 216, 153, 0},   {76, 217, 238, 0},
    {77, 218, 156, 0},   {78, 219, 157, 0},   {79, 220, 158, 0},   {80, 221, 0, 0},     {81, 222, 0, 473},
    {82, 223, 0, 0},     {83, 224, 0, 0},     {85, 226, 0, 484},   {86, 227, 0, 484},   {87, 228, 0, 474},
    {88, 229, 0, 472},   {89, 230, 0, 0},     {90, 231, 0, 495},   {91, 232, 0, 0},     {92, 234, 0, 0},
    {93, 235, 0, 0},     {94, 236, 238, 486}, {95, 237, 0, 474},   {96, 238, 0, 0},     {97, 239, 0, 496},
    {98, 240, 204, 503}, {99, 166, 0, 0},     {100, 169, 0, 0},    {101, 170, 187, 0},  {102, 171, 0, 0},
    {103, 172, 189, 0},  {104, 173, 0, 0},    {105, 174, 0, 0},
};

// s4:C958..s4:CD60: the introduction's story pages.
constexpr StoryPage kPages[] = {
    {38, 1842, 0, 241, 141, 8000, 154},     {39, 1843, 0, 242, 142, 7000, 160},
    {40, 1844, 0, 243, 143, 13000, 166},    {41, 1845, 0, 244, 144, 14000, 161},
    {42, 1846, 1847, 245, 146, 26000, 191}, {43, 1848, 0, 246, 147, 9000, 147},
    {44, 1849, 0, 247, 148, 13000, 148},    {45, 1850, 0, 248, 150, 9000, 194},
    {46, 1851, 0, 249, 151, 11000, 197},    {47, 1852, 0, 250, 152, 10000, 163},
    {48, 1853, 1854, 251, 153, 25000, 168}, {49, 1855, 1856, 252, 155, 23000, 169},
    {50, 1857, 0, 253, 156, 10000, 124},    {51, 0, 0, 254, 0, 10000, 201},
    // s4:CF74: after a landing site is chosen (s5:1CA4 posts 222): the ship
    // in orbit, fem128, then the colony (207, mode 10).
    {52, 0, 0, 254, 128, 10000, 207},
};

// s2:0C60: commands 100..302 (case = command - 100) that show a screen.
struct CommandEntry {
    uint16_t command;
    ScreenKind kind;
    uint8_t mode;
};
constexpr ScreenKind R = ScreenKind::Replace, O = ScreenKind::Overlay;
constexpr CommandEntry kCommands[] = {
    {122, R, 11}, {123, R, 30}, {124, R, 31}, {125, R, 33}, {126, R, 53}, {127, O, 57}, {128, R, 34},
    {129, O, 54}, {130, O, 55}, {131, O, 56}, {132, O, 58}, {133, O, 59}, {134, O, 60}, {135, O, 61},
    {136, O, 62}, {137, O, 63}, {138, O, 64}, {139, R, 12}, {140, O, 65}, {141, O, 66}, {142, O, 67},
    {143, O, 68}, {144, O, 69}, {145, O, 70}, {146, O, 71}, {147, R, 35}, {148, R, 36}, {149, O, 72},
    {150, O, 73}, {151, O, 74}, {152, O, 75}, {153, O, 76}, {154, R, 13}, {155, O, 77}, {156, O, 78},
    {157, O, 79}, {158, O, 80}, {159, O, 81}, {160, R, 14}, {161, R, 15}, {162, O, 82}, {163, R, 16},
    {164, O, 83}, {165, R, 17}, {166, R, 18}, {167, O, 87}, {168, R, 19}, {169, R, 20}, {170, O, 88},
    {171, O, 99}, {172, O, 89}, {173, O, 90}, {174, O, 91}, {175, O, 21}, {176, R, 37}, {177, O, 92},
    {178, O, 22}, {179, O, 93}, {180, R, 94}, {181, O, 95}, {182, O, 96}, {183, O, 97}, {184, O, 98},
    {185, O, 100}, {186, O, 101}, {187, O, 102}, {188, O, 103}, {189, O, 104}, {190, O, 105},
    {191, R, 23}, {192, R, 24}, {193, R, 25}, {194, R, 26}, {195, R, 27}, {196, R, 28}, {197, R, 29},
    {198, R, 4}, {200, R, 3}, {201, R, 1}, {202, R, 5}, {204, R, 7}, {205, R, 8}, {206, R, 9},
    {207, R, 10}, {208, R, 38}, {209, R, 39}, {210, R, 40}, {211, R, 41}, {212, R, 42}, {213, R, 43},
    {214, R, 44}, {215, R, 45}, {216, R, 46}, {217, R, 47}, {218, R, 48}, {219, R, 49}, {220, R, 50},
    {221, R, 51}, {222, R, 52}, {223, O, 85}, {224, O, 86},
};

// s2:AB80: log codes 8..45 -> movie command.
constexpr uint16_t kLogMovies[] = {
    130, 127, 128, 132, 137, 138, 140, 142, 143, 144, 145, 149, 150, 0,   155, 159, 162, 164, 0,
    167, 167, 170, 172, 173, 174, 177, 179, 180, 181, 182, 183, 171, 185, 186, 188, 190, 223, 224,
};

constexpr size_t kVoiceTable = 0x2E34, kVoices = 216;

uint16_t u16(std::span<const uint8_t> b, size_t o) { return uint16_t(b[o] | b[o + 1] << 8); }

} // namespace

std::span<const MovieView> movieViews() { return kMovies; }

const MovieView* movieView(int mode) {
    for (const auto& m : kMovies)
        if (m.mode == mode) return &m;
    return nullptr;
}

std::span<const StoryPage> storyPages() { return kPages; }

const StoryPage* storyPage(int mode) {
    for (const auto& p : kPages)
        if (p.mode == mode) return &p;
    return nullptr;
}

CommandScreen commandScreen(int command) {
    for (const auto& c : kCommands)
        if (c.command == command) return {c.kind, c.mode};
    return {};
}

uint16_t logMovieCommand(int code) {
    if (code < 8 || code >= 8 + int(std::size(kLogMovies))) return 0;
    return kLogMovies[size_t(code - 8)];
}

bool MediaNames::load(const NeImage& exe, const BuildingPictures& pics) {
    m_pics = &pics;
    m_voices.assign(kVoices, {});
    const auto dg = exe.dgroup();
    for (size_t i = 0; i < kVoices && kVoiceTable + 4 * i + 2 <= dg.size(); ++i)
        if (auto s = exe.dgroupString(u16(dg, kVoiceTable + 4 * i)); s && s->find(".wav") != std::string::npos)
            m_voices[i] = *s;
    return !m_voices[1].empty();
}

std::string MediaNames::voice(uint16_t index) const { return index < m_voices.size() ? m_voices[index] : std::string(); }

std::string MediaNames::sound(uint16_t id) const {
    if (!m_pics) return {};
    auto e = m_pics->catalog(id);
    return e && e->kind == 3 ? e->file : std::string();
}

std::string MediaNames::movie(uint16_t id) const {
    if (!m_pics) return {};
    auto e = m_pics->catalog(id);
    return e && e->kind == 4 ? e->file : std::string();
}

std::string MediaNames::picture(uint16_t id) const {
    if (!m_pics) return {};
    auto e = m_pics->catalog(id);
    return e && e->kind == 1 ? e->file : std::string();
}

std::optional<std::filesystem::path> findMedia(const std::filesystem::path& cdRoot, const std::string& folder,
                                               const std::string& name) {
    auto same = [](const std::string& a, const std::string& b) {
        return a.size() == b.size() && std::equal(a.begin(), a.end(), b.begin(), [](char x, char y) {
                   return std::toupper(static_cast<unsigned char>(x)) == std::toupper(static_cast<unsigned char>(y));
               });
    };
    std::error_code ec;
    for (const auto& d : std::filesystem::directory_iterator(cdRoot, ec)) {
        if (!d.is_directory(ec) || !same(d.path().filename().string(), folder)) continue;
        for (const auto& f : std::filesystem::directory_iterator(d.path(), ec))
            if (same(f.path().filename().string(), name)) return f.path();
    }
    return std::nullopt;
}

} // namespace outpost::data
