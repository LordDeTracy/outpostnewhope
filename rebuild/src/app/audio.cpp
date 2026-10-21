#include "app/audio.hpp"

#include <SDL.h>
#ifdef OUTPOST_HAVE_MIXER
#include <SDL_mixer.h>
#endif
#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <mmsystem.h>
#endif

#include <algorithm>
#include <cctype>

namespace outpost::app {

namespace {

constexpr int kWaveChannel = 0, kClickChannel = 1;
#ifdef _WIN32
constexpr const char* kAlias = "outpost_midi";
#endif

bool endsWith(const std::string& s, const char* ext) {
    const size_t n = std::char_traits<char>::length(ext);
    if (s.size() < n) return false;
    return std::equal(s.end() - long(n), s.end(), ext, [](char a, char b) {
        return std::tolower(static_cast<unsigned char>(a)) == b;
    });
}

} // namespace

Audio::Audio(std::filesystem::path cdRoot, const data::MediaNames& names, Preferences& prefs)
    : m_cd(std::move(cdRoot)), m_names(names), m_prefs(prefs) {
#ifdef OUTPOST_HAVE_MIXER
    if (SDL_InitSubSystem(SDL_INIT_AUDIO) == 0 && Mix_OpenAudio(48000, AUDIO_S16SYS, 2, 2048) == 0) {
        Mix_AllocateChannels(2);
        m_open = true;
    }
#endif
}

Audio::~Audio() {
    stopWave();
    stopMidi();
#ifdef OUTPOST_HAVE_MIXER
    if (m_track) {
        Mix_HaltMusic();
        Mix_FreeMusic(static_cast<Mix_Music*>(m_track));
    }
#endif
#ifdef OUTPOST_HAVE_MIXER
    if (m_click) {
        if (m_open) Mix_HaltChannel(kClickChannel);
        Mix_FreeChunk(static_cast<Mix_Chunk*>(m_click));
    }
    if (m_open) Mix_CloseAudio();
#endif
}

void Audio::loadClick(const std::filesystem::path& file) {
#ifdef OUTPOST_HAVE_MIXER
    if (m_open && !m_click && std::filesystem::exists(file)) m_click = Mix_LoadWAV(file.string().c_str());
#else
    (void)file;
#endif
}

void Audio::playClick() {
#ifdef OUTPOST_HAVE_MIXER
    if (m_open && m_click && m_prefs.soundEffects)
        Mix_PlayChannel(kClickChannel, static_cast<Mix_Chunk*>(m_click), 0);
#endif
}

bool Audio::playSound(uint16_t catalogId) {
    std::string name = m_names.sound(catalogId);
    if (name.empty()) return false;
    // s3:84F8: a name without an extension gets ".wav" (".mid" when the
    // options ask for MIDI effects, which the rebuild does not offer).
    if (name.find('.') == std::string::npos) name += ".wav";
    return playFile(name);
}

bool Audio::playVoice(uint16_t index) {
    const std::string name = m_names.voice(index);
    return !name.empty() && playFile(name);
}

bool Audio::playFile(const std::string& name) {
    const auto file = data::findMedia(m_cd, "MUSIC", name);
    if (!file) return false;                                   // e.g. fem101.wav (quirk Q64)
    return endsWith(name, ".mid") ? playMidi(*file) : playWave(*file);
}

bool Audio::playWave(const std::filesystem::path& file) {
#ifdef OUTPOST_HAVE_MIXER
    if (!m_open || !m_prefs.soundEffects || wavePlaying()) return false;
    stopWave();
    Mix_Chunk* c = Mix_LoadWAV(file.string().c_str());
    if (!c) return false;
    if (Mix_PlayChannel(kWaveChannel, c, 0) < 0) {
        Mix_FreeChunk(c);
        return false;
    }
    m_chunk = c;
    return true;
#else
    (void)file;
    return false;
#endif
}

bool Audio::playMidi(const std::filesystem::path& file) {
    if (hasSoundtrack()) return false;                         // I95: the soundtrack plays instead
    if (!m_prefs.music || midiPlaying()) return false;
    stopMidi();
#ifdef _WIN32
    const std::string open = "open \"" + file.string() + "\" type sequencer alias " + kAlias;
    if (mciSendStringA(open.c_str(), nullptr, 0, nullptr) != 0) return false;
    m_mci = true;
    if (mciSendStringA((std::string("play ") + kAlias).c_str(), nullptr, 0, nullptr) != 0) {
        stopMidi();
        return false;
    }
    return true;
#elif defined(OUTPOST_HAVE_MIXER)
    if (!m_open) return false;
    Mix_Music* m = Mix_LoadMUS(file.string().c_str());
    if (!m) return false;
    if (Mix_PlayMusic(m, 1) < 0) {
        Mix_FreeMusic(m);
        return false;
    }
    m_music = m;
    return true;
#else
    (void)file;
    return false;
#endif
}

bool Audio::wavePlaying() const {
#ifdef OUTPOST_HAVE_MIXER
    return m_open && Mix_Playing(kWaveChannel) != 0;
#else
    return false;
#endif
}

bool Audio::midiPlaying() const {
#ifdef _WIN32
    if (!m_mci) return false;
    char mode[32] = {};
    if (mciSendStringA((std::string("status ") + kAlias + " mode").c_str(), mode, sizeof mode, nullptr) != 0)
        return false;
    return std::string(mode) == "playing";
#elif defined(OUTPOST_HAVE_MIXER)
    return m_music && Mix_PlayingMusic() != 0;
#else
    return false;
#endif
}

void Audio::stopWave() {
#ifdef OUTPOST_HAVE_MIXER
    if (m_open) Mix_HaltChannel(kWaveChannel);
    if (m_chunk) Mix_FreeChunk(static_cast<Mix_Chunk*>(m_chunk));
#endif
    m_chunk = nullptr;
}

void Audio::stopMidi() {
#ifdef _WIN32
    if (m_mci) mciSendStringA((std::string("close ") + kAlias).c_str(), nullptr, 0, nullptr);
    m_mci = false;
#elif defined(OUTPOST_HAVE_MIXER)
    if (m_music) {
        Mix_HaltMusic();
        Mix_FreeMusic(static_cast<Mix_Music*>(m_music));
    }
#endif
    m_music = nullptr;
}

void Audio::update() {
    if (m_chunk && (!wavePlaying() || !m_prefs.soundEffects)) stopWave();
    if ((m_mci || m_music) && (!midiPlaying() || !m_prefs.music)) stopMidi();
    soundtrackTick();
}

void Audio::loadSoundtrack(const std::filesystem::path& dir) {
    m_tracks.clear();
    std::error_code ec;
    std::vector<std::filesystem::path> files;
    for (const auto& e : std::filesystem::directory_iterator(dir, ec))
        if (e.is_regular_file() && endsWith(e.path().string(), ".ogg")) files.push_back(e.path());
    std::sort(files.begin(), files.end());
    for (const auto& f : files) {
        std::string n = f.stem().string();
        std::transform(n.begin(), n.end(), n.begin(), [](unsigned char c) { return char(std::tolower(c)); });
        Mood m = Mood::None;
        if (n.find("underground") != std::string::npos) m = Mood::Underground;
        else if (n.find("landing") != std::string::npos) m = Mood::Landing;
        else if (n.find("ambient") != std::string::npos || n.find("surface") != std::string::npos) m = Mood::Surface;
        else if (n.find("ship") != std::string::npos || n.find("planet") != std::string::npos ||
                 n.find("voyage") != std::string::npos || n.find("star") != std::string::npos) m = Mood::Voyage;
        else if (n.find("menu") != std::string::npos || n.find("title") != std::string::npos) m = Mood::Menu;
        if (m != Mood::None) m_tracks[m].push_back(f);
    }
}

void Audio::soundtrackTick() {
#ifdef OUTPOST_HAVE_MIXER
    if (!m_open || m_tracks.empty()) return;
    constexpr int kFadeInMs = 2500, kFadeOutMs = 2500;
    Mix_VolumeMusic(std::clamp(m_prefs.musicVolume, 0, 100) * MIX_MAX_VOLUME / 100);
    auto* track = static_cast<Mix_Music*>(m_track);
    const bool playing = track && Mix_PlayingMusic();
    const Mood want = m_prefs.music ? m_mood : Mood::None;
    if (playing) {
        // A new mood, or the end coming: fade out (once).
        const double len = Mix_MusicDuration(track), at = Mix_GetMusicPosition(track);
        const bool ending = len > 0 && at >= 0 && at > len - kFadeOutMs / 1000.0;
        if (!m_fadingOut && (want != m_playing || ending) && Mix_FadingMusic() != MIX_FADING_OUT) {
            Mix_FadeOutMusic(kFadeOutMs);
            m_fadingOut = true;
        }
        return;
    }
    if (track) {
        Mix_FreeMusic(track);
        m_track = nullptr;
        m_nowPlaying.clear();
    }
    m_fadingOut = false;
    m_playing = Mood::None;
    auto it = m_tracks.find(want);
    if (want == Mood::None || it == m_tracks.end() || it->second.empty()) return;
    // The mood's next file, in turn.
    size_t& next = m_nextTrack[want];
    const auto& file = it->second[next++ % it->second.size()];
    Mix_Music* m = Mix_LoadMUS(file.string().c_str());
    if (!m) return;
    if (Mix_FadeInMusic(m, 1, kFadeInMs) < 0) {
        Mix_FreeMusic(m);
        return;
    }
    m_track = m;
    m_playing = want;
    m_nowPlaying = file.filename().string();
#endif
}

} // namespace outpost::app
