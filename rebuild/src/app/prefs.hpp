// The player's preferences (dialog 4027).
#pragma once

#include <cstdint>
#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <string>

namespace outpost::app {

struct Preferences {
    bool tileAnimations{true}, music{true}, soundEffects{true}, animatedSequences{true};
    // IMPROVED (I93): the surface is drawn with the terrain packs
    // (assets/terrain-packs) by planet.
    bool terrainPacks{false};
    int musicVolume{80};       // IMPROVED (I95): the soundtrack's volume, 0..100
    uint32_t seed{0};          // scripted runs: rand()'s seed (0: the clock, as the game does)
    bool scripted{false};      // a scripted screenshot run: nothing is written to REBUILD.INI
    // IMPROVED (I121): the names typed in the A.I. Says windows (4040,
    // 4041), offered again next time.
    std::string commanderName, aiName;

    // IMPROVED (I94): v1.51 keeps its preferences only while it runs (the
    // registry object, no file); the rebuild keeps them in REBUILD.INI
    // beside the saved games, "key=0/1" lines.
    static std::filesystem::path file(const std::filesystem::path& saveDir) { return saveDir / "REBUILD.INI"; }
    void load(const std::filesystem::path& saveDir) {
        std::ifstream f(file(saveDir));
        std::string line;
        while (std::getline(f, line)) {
            const auto eq = line.find('=');
            if (eq == std::string::npos) continue;
            const std::string k = line.substr(0, eq), v = line.substr(eq + 1);
            if (bool* p = field(k)) *p = v == "1";
            if (k == "musicVolume") musicVolume = std::atoi(v.c_str());
            if (k == "commanderName") commanderName = v;
            if (k == "aiName") aiName = v;
        }
    }
    void save(const std::filesystem::path& saveDir) {
        std::ofstream f(file(saveDir));
        for (const char* k : kKeys) f << k << '=' << (*field(k) ? 1 : 0) << '\n';
        f << "musicVolume=" << musicVolume << '\n';
        f << "commanderName=" << commanderName << '\n';
        f << "aiName=" << aiName << '\n';
    }

private:
    static constexpr const char* kKeys[] = {"tileAnimations", "music", "soundEffects", "animatedSequences",
                                            "terrainPacks"};
    bool* field(const std::string& k) {
        if (k == "tileAnimations") return &tileAnimations;
        if (k == "music") return &music;
        if (k == "soundEffects") return &soundEffects;
        if (k == "animatedSequences") return &animatedSequences;
        if (k == "terrainPacks") return &terrainPacks;
        return nullptr;
    }
};

} // namespace outpost::app
