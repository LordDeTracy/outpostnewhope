#include "app/sequence.hpp"

#include <algorithm>
#include <string>
#include <vector>

namespace outpost::app {

namespace {

constexpr int kScreenW = 640, kScreenH = 480;
constexpr Colour kPageBack{11, 7, 16};       // s5:065E: CreateSolidBrush(PALETTERGB(0x0B, 0x07, 0x10))
constexpr int kTextWidth = 400;              // s4:C402: the text box +0x10E, 400 x 30

std::vector<std::string> wrap(Gfx& g, const std::string& text, int width) {
    std::vector<std::string> lines;
    std::string line, word;
    auto flush = [&] {
        if (word.empty()) return;
        const std::string t = line.empty() ? word : line + " " + word;
        if (g.textWidth(t) > width && !line.empty()) {
            lines.push_back(line);
            line = word;
        } else {
            line = t;
        }
        word.clear();
    };
    for (char c : text) {
        if (c == ' ' || c == '\n') flush();
        else word.push_back(c);
    }
    flush();
    if (!line.empty()) lines.push_back(line);
    return lines;
}

} // namespace

Media::Media(SDL_Renderer* ren, Gfx& gfx, const data::NeImage& exe, const data::BuildingPictures& pics,
             const data::StringTable& strings, const std::filesystem::path& cdRoot, Preferences& prefs)
    : audio(cdRoot, names, prefs), sequence(ren, gfx, names, strings, audio, cdRoot, prefs) {
    names.load(exe, pics);
}

Sequence::Sequence(SDL_Renderer* ren, Gfx& gfx, const data::MediaNames& names, const data::StringTable& strings,
                   Audio& audio, std::filesystem::path cdRoot, Preferences& prefs)
    : m_ren(ren), m_gfx(gfx), m_names(names), m_strings(strings), m_audio(audio), m_cd(std::move(cdRoot)),
      m_prefs(prefs) {}

bool Sequence::start(uint16_t command, uint32_t nowMs) {
    const data::CommandScreen s = data::commandScreen(command);
    if (s.kind == data::ScreenKind::None || (!data::movieView(s.mode) && !data::storyPage(s.mode))) return false;
    m_active = true;
    m_end = 0;
    go(command, nowMs);
    return true;
}

void Sequence::go(uint16_t command, uint32_t nowMs) {
    // A loop rather than recursion: with Animated Sequences off every screen
    // posts its next command at once (s4:6AA0, s4:C590), and the chain runs
    // straight to its end.
    for (int guard = 0; guard < 200; ++guard) {
        m_movie.reset();
        m_view = nullptr;
        m_page = nullptr;
        m_mode = 0;
        const data::CommandScreen s = data::commandScreen(command);
        const data::MovieView* view = s.kind != data::ScreenKind::None ? data::movieView(s.mode) : nullptr;
        const data::StoryPage* page = s.kind != data::ScreenKind::None ? data::storyPage(s.mode) : nullptr;
        if (!view && !page) {
            finish(command);
            return;
        }
        if (view) {
            if (s.mode == 11) m_audio.playSound(data::media::kTitleMusic);   // s2:15D4 case 11
            if (m_prefs.animatedSequences) {
                auto movie = std::make_unique<Movie>();
                const auto file = data::findMedia(m_cd, "VIDEOS", m_names.movie(view->movie));
                if (file && movie->open(m_ren, *file)) {
                    playViewSounds(*view, s.mode);
                    m_movie = std::move(movie);
                    m_movie->start(nowMs);
                    m_view = view;
                    m_mode = s.mode;
                    return;
                }
            }
            command = view->next;
        } else {
            if (m_prefs.animatedSequences) {
                // s5:07AA: the voice on the first paint; s4:C578: mars.mid
                // again (dropped while it still plays).
                if (page->voice) m_audio.playVoice(page->voice);
                m_audio.playSound(data::media::kTitleMusic);
                m_page = page;
                m_pageStart = nowMs;
                m_mode = s.mode;
                return;
            }
            command = page->next;
        }
    }
    finish(0);
}

bool Sequence::playModes(std::vector<int> modes, uint32_t nowMs) {
    if (!m_prefs.animatedSequences) return false;
    m_queue.assign(modes.begin(), modes.end());
    m_queued = true;
    m_active = true;
    m_end = 0;
    return playNextQueued(nowMs);
}

void Sequence::playViewSounds(const data::MovieView& view, int mode) {
    if (view.sound) m_audio.playSound(view.sound);                          // s4:6B68
    if (mode == data::media::kSmlstpMode && !m_smlstpPlayed)                  // s4:742E
        m_smlstpPlayed = m_audio.playSound(data::media::kSmlstp);
}

bool Sequence::playNextQueued(uint32_t nowMs) {
    m_movie.reset();
    m_view = nullptr;
    m_page = nullptr;
    while (!m_queue.empty()) {
        const int mode = m_queue.front();
        m_queue.pop_front();
        const data::MovieView* view = data::movieView(mode);
        if (!view) continue;
        auto movie = std::make_unique<Movie>();
        const auto file = data::findMedia(m_cd, "VIDEOS", m_names.movie(view->movie));
        if (!file || !movie->open(m_ren, *file)) continue;
        playViewSounds(*view, mode);
        m_movie = std::move(movie);
        m_movie->start(nowMs);
        m_view = view;
        m_mode = mode;
        return true;
    }
    m_queued = false;
    finish(0);
    return false;
}

void Sequence::next(uint32_t nowMs) {
    if (m_queued) {
        playNextQueued(nowMs);
        return;
    }
    const uint16_t cmd = m_view ? m_view->next : m_page ? m_page->next : 0;
    go(cmd, nowMs);
}

void Sequence::skipChain() {
    // The screens still to come are followed without being shown, to the
    // command that ends the chain (as with Animated Sequences off).
    uint16_t command = m_view ? m_view->next : m_page ? m_page->next : 0;
    for (int guard = 0; guard < 200; ++guard) {
        const data::CommandScreen s = data::commandScreen(command);
        const data::MovieView* view = s.kind != data::ScreenKind::None ? data::movieView(s.mode) : nullptr;
        const data::StoryPage* page = s.kind != data::ScreenKind::None ? data::storyPage(s.mode) : nullptr;
        if (!view && !page) break;
        command = view ? view->next : page->next;
    }
    finish(command);
}

void Sequence::finish(uint16_t command) {
    m_queue.clear();
    m_queued = false;
    m_active = false;
    m_end = command;
    m_movie.reset();
    m_view = nullptr;
    m_page = nullptr;
    m_mode = 0;
}

void Sequence::tick(uint32_t nowMs) {
    if (!m_active) return;
    if (m_movie) {
        if (!m_movie->update(nowMs)) next(nowMs);
    } else if (m_page) {
        if (nowMs - m_pageStart >= m_page->ms) next(nowMs);
    }
}

void Sequence::event(const SDL_Event& e, uint32_t nowMs) {
    if (!m_active) return;
    // IMPROVISED (I44): the original skips a movie with CTRL-BREAK (it plays
    // with MCI_WAIT) and leaves the Introduction with ALT-F4 on a still
    // (string 1879). Here Ctrl+Break, Space, Enter or a click end the movie
    // or story page and go on to the next screen; Esc skips the rest of the
    // chain (on a story page it leaves the Introduction for the main menu).
    // A skipped screen's voice stops, so the next one can speak.
    bool skip = false, leave = false;
    if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT) skip = true;
    if (e.type == SDL_KEYDOWN) {
        const auto k = e.key.keysym.sym;
        if (k == SDLK_SPACE || k == SDLK_RETURN || k == SDLK_KP_ENTER || k == SDLK_PAUSE) skip = true;
        if (k == SDLK_ESCAPE) leave = true;
    }
    if (leave) {
        m_audio.stopWave();
        if (m_queued) finish(0);
        else if (m_page) finish(data::media::kMainMenu);
        else skipChain();
    } else if (skip) {
        m_audio.stopWave();
        next(nowMs);
    }
}

void Sequence::draw(const SDL_Rect& screen) {
    if (!m_active) return;
    const float k = std::min(float(screen.w) / kScreenW, float(screen.h) / kScreenH);
    if (m_movie) {
        m_gfx.fill(screen, Colour{0, 0, 0});
        m_movie->draw(screen);
        return;
    }
    if (!m_page) return;
    m_gfx.fill(screen, kPageBack);
    // IMPROVISED (I44): the page's paint code (s5:065E, s2:3E94) is not
    // decoded beyond its background and text box; the picture is centred
    // above the text, both scaled like the movies.
    int textTop = screen.y + screen.h / 2;
    if (SDL_Texture* t = m_gfx.bitmap(m_names.picture(m_page->picture), false)) {
        int w, h;
        SDL_QueryTexture(t, nullptr, nullptr, &w, &h);
        const int dw = int(w * k), dh = int(h * k);
        const int total = dh + int(70 * k);
        const SDL_Rect dst{screen.x + (screen.w - dw) / 2, screen.y + std::max(0, (screen.h - total) / 2), dw, dh};
        SDL_RenderCopy(m_ren, t, nullptr, &dst);
        textTop = dst.y + dh + int(16 * k);
    }
    std::string text;
    for (uint16_t id : {m_page->text1, m_page->text2}) {
        if (!id) continue;
        const std::string& part = m_strings.get(id);
        if (!text.empty() && !part.empty() && part.front() != ' ') text += ' ';
        text += part;
    }
    int y = textTop;
    for (const auto& l : wrap(m_gfx, text, int(kTextWidth * k))) {
        m_gfx.text(l, screen.x + (screen.w - m_gfx.textWidth(l)) / 2, y, ui::kText);
        y += m_gfx.lineHeight() + 2;
    }
}

} // namespace outpost::app
