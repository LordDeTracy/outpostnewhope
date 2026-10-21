// The original's sound manager (the MciSoundWindow at DGROUP 0x2A0,
// s2:5C34..s2:5E7E; findings/13-media.md): one wave ("waveaudio": sound
// effects and voice lines) and one MIDI file ("sequencer": music) at a time.
// A request while one of its kind is still playing is dropped (s2:5CFE).
// Waves need the Sound Effects preference, MIDI files the Music one.
//
// Waves play through SDL2_mixer; MIDI files through MCI on Windows, as the
// original does, and through SDL2_mixer elsewhere (when it was built with
// MIDI support).
#pragma once

#include "app/prefs.hpp"
#include "data/media.hpp"

#include <filesystem>
#include <map>
#include <string>
#include <vector>

namespace outpost::app {

// IMPROVED (I95): the player's soundtrack (assets/music, OGG files)
// replaces the original's music: each screen asks for a mood, and the files
// named for it play in turn, fading in and out.
enum class Mood { None, Menu, Voyage, Landing, Surface, Underground };

class Audio {
public:
    Audio(std::filesystem::path cdRoot, const data::MediaNames& names, Preferences& prefs);
    ~Audio();
    Audio(const Audio&) = delete;
    Audio& operator=(const Audio&) = delete;

    // s2:5C5C: a catalog sound (kind 3, 467..503). A name without an
    // extension is a wave (s3:84F8). Returns whether it started.
    bool playSound(uint16_t catalogId);
    // s2:5C7C with type 1: voice line 1..215 of the voice table.
    bool playVoice(uint16_t index);
    // A file of the CD's MUSIC folder, "x.wav" or "x.mid".
    bool playFile(const std::string& name);
    // IMPROVED (I119): the interface click (OutpostHD's click.ogg), on its
    // own channel so it never cuts or blocks a voice line.
    void loadClick(const std::filesystem::path& file);
    void playClick();

    bool wavePlaying() const;
    bool midiPlaying() const;
    void stopWave();
    void stopMidi();
    // Called each frame: frees what has finished, stops what a preference
    // switched off, and runs the soundtrack's fades.
    void update();

    // I95: the soundtrack's folder; a file's mood is in its name (mainmenu,
    // shipconfigplanet, landing, ambient..., underground...). With any
    // there, MIDI requests are dropped.
    void loadSoundtrack(const std::filesystem::path& dir);
    bool hasSoundtrack() const { return !m_tracks.empty(); }
    void setMood(Mood mood) { m_mood = mood; }
    // The soundtrack file playing (scripted runs report it), or "".
    const std::string& nowPlaying() const { return m_nowPlaying; }

private:
    void soundtrackTick();
    std::map<Mood, std::vector<std::filesystem::path>> m_tracks;
    std::map<Mood, size_t> m_nextTrack;
    Mood m_mood{Mood::None}, m_playing{Mood::None};
    bool m_fadingOut{false};
    void* m_track{nullptr};      // Mix_Music of the soundtrack
    std::string m_nowPlaying;
    bool playWave(const std::filesystem::path& file);
    bool playMidi(const std::filesystem::path& file);

    std::filesystem::path m_cd;
    const data::MediaNames& m_names;
    Preferences& m_prefs;
    bool m_open{false};
    void* m_chunk{nullptr};      // Mix_Chunk of the wave playing
    void* m_click{nullptr};      // Mix_Chunk of the click (I119)
    void* m_music{nullptr};      // Mix_Music (not on Windows)
    bool m_mci{false};           // an MCI sequencer is open (Windows)
};

} // namespace outpost::app
