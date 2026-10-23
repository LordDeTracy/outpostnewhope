// The screens before a colony exists (findings/11-new-game.md §6): the
// Program Control menu, loading a game, and a new game's way from Earth to
// a landing site: difficulty, star selection (the first probes), the ship's
// configuration, the destination, the planet in orbit and its sites.
#pragma once

#include "app/gfx.hpp"
#include "app/prefs.hpp"
#include "app/sequence.hpp"
#include "app/site_map.hpp"
#include "app/ui.hpp"
#include "data/game_files.hpp"
#include "data/pictures.hpp"
#include "sim/new_game.hpp"
#include "sim/object_db.hpp"
#include "sim/ship_config.hpp"
#include "sim/simulation.hpp"

#include <filesystem>
#include <functional>
#include <map>
#include <memory>
#include <optional>
#include <set>
#include <string>
#include <vector>

namespace outpost::app {

// What the start screens hand to the colony screen.
struct StartResult {
    std::unique_ptr<sim::Simulation> sim;
    std::unique_ptr<sim::NewGame> newGame;   // a new game, still to land
    sim::Handle site;                        // the site chosen for the landing
    std::string loadedFrom;                  // a loaded game's file
    bool quit{false};
};

class StartFlow {
public:
    StartFlow(SDL_Renderer* ren, Gfx& gfx, sim::GameData& data, const data::BuildingPictures& pics,
              const data::GameFiles& files, std::filesystem::path saveDir, Preferences& prefs, Media& media);

    void draw();
    void event(const SDL_Event& e);
    void tick(uint32_t nowMs);
    bool done() const { return m_done; }
    StartResult take() { return std::move(m_result); }

    // Scripted runs (--start): press a control of the current screen.
    void press(int id);
    std::string stageName() const;

private:
    enum class Stage { Menu, Intro, Load, Prefs, Difficulty, Stars, Ship, Destination, Planets, Sites, Greeting, Name, AiName, Launch };

    SDL_Rect screen() const;
    // Moves the windows after the screen changed size (I120).
    void reflow();
    void placeMenu();
    void backdrop(const std::string& file);
    void openDialog(uint16_t id);
    void toGreeting(int step);
    void starVoice(uint16_t star);   // I122
    // I124: the Interstellar Launch System (dialog 318, s8:D242).
    void toInterstellar(bool fresh);
    void interstellarCommand(int id);
    int probesAboard() const;
    void useProbe();   // I121: A.I. Says 4039..4041 (modes 10..12)
    void showMessage(std::string title, std::string text, std::function<void()> after = {});
    void ask(std::string title, std::string text, std::function<void()> yes);

    void toMenu();
    void toLoad();
    void toPrefs();
    void toDifficulty();
    void toStars();
    void toShip();
    void toDestination();
    void toPlanets();
    void toSites();
    // The Introduction (Program Control 116, s9:07DC): command 122's chain.
    void toIntro();
    // A sequence ended: after the landing story the colony, else the menu.
    void sequenceEnded();
    // IMPROVED (I55): movies between the New Game screens, then `then`.
    void playThen(std::vector<int> modes, std::function<void()> then);
    std::function<void()> m_afterMovies;

    // The Orbital Launch System (dialog 358; s9:0000, s9:0170, s9:0558): the
    // satellites and the geological penetrator carried are launched from
    // orbit, then the Seed Factory, which chooses the planet.
    struct LaunchRow {
        int16_t x{0}, y{0};
        uint16_t id{0}, kind{0}, status{0}, ready{0}, movie{0};
    };
    std::vector<LaunchRow> m_launchRows;       // DGROUP 0x5C60: 8 rows of 7 words
    std::unique_ptr<Dialog> m_launch;
    int m_satellite{-1};                       // +0x92: the satellite chosen (row 0..3)
    bool m_penetrator{false};                  // the probe chosen
    std::vector<sim::Handle> m_probedPlanets;  // s4:6086: planets a penetrator went to
    void openLaunch();
    void refreshLaunchRow(size_t row);         // s9:0558
    void launchCommand(int id);                // s9:0170
    void playMovieHere(uint16_t command);      // an overlay, then back to this screen
    void launchSeed();

    void command(int id);
    void starChosen(int buttonId);
    // The star data window (4032) for a star; mass and probability stay
    // "Unknown" (the template's text) until a probe has been there.
    void showStar(uint16_t star, bool probed);
    // IMPROVED (I52): a chart of the 21 stars from the star table's
    // positions (DGROUP 0x51B8), drawn over the selection screens; a click
    // on a star works as its check box.
    SDL_Rect starMapArea() const;
    SDL_FPoint starMapPoint(uint16_t star, const SDL_Rect& r, float* baseY = nullptr) const;
    void drawStarMap();
    // IMPROVED (I56): beside Ship Configuration, the cargo chosen so far.
    void drawCargo();
    bool starMapClick(int x, int y);
    int m_hoverStar{0};
    std::vector<SDL_Rect> m_planetIcons;   // the Star Systems window's row of worlds (I112)
    float m_starYaw{0};                 // the Star Display's turn, degrees
    SDL_Rect m_starArrows[2]{};         // its turn-left and turn-right arrows
    SiteMap m_siteMap;                         // the Sites screen's layout (I53)
    // IMPROVED (I48): the title music on the start screens.
    void music();
    void showShip();
    void showPlanet();
    void showSite();
    void loadSave(const std::filesystem::path& file, const std::string& name);
    void finishNewGame();

    // The destination's star index (1..21) of a star button (416..436,
    // s2:D818), and back.
    static uint16_t starOfButton(int id);
    static int buttonOfStar(uint16_t star);
    std::vector<int> starButtons() const;      // every star's id, the added ones too
    static bool isStarButton(int id);

    SDL_Renderer* m_ren;
    Gfx& m_gfx;
    sim::GameData& m_data;
    const data::BuildingPictures& m_pics;
    const data::GameFiles& m_files;
    std::filesystem::path m_saveDir;
    Preferences& m_prefs;
    Media& m_media;

    Stage m_stage{Stage::Menu};
    std::string m_backdrop;
    std::unique_ptr<Dialog> m_dialog;
    std::unique_ptr<Dialog> m_side;            // a second window (star data, planet data)
    SDL_Rect m_laidOut{};                      // the screen the windows were placed on
    uint16_t m_dialogId{0};
    std::optional<Message> m_message;
    std::function<void()> m_afterMessage;
    struct Question {
        std::string title, text;
        std::function<void()> yes;
    };
    std::optional<Question> m_question;

    bool m_landingStory{false};
    int m_prefsVolumeBefore{80};               // Preferences' Cancel restores it                // mode 52 plays before the colony screen
    // Load list.
    std::vector<std::pair<std::string, std::filesystem::path>> m_saves;

    // A new game in the making.
    std::unique_ptr<sim::Simulation> m_sim;
    std::unique_ptr<sim::NewGame> m_newGame;
    sim::ShipConfig m_ship;
    int m_difficulty{2};
    bool m_autoTrucking{true};
    uint16_t m_star{0};                        // the star chosen (1..21)
    int m_probes{4};                           // s9:2512 +0x92: probes left (negative: too many checked)
    static constexpr int kProbesAtStart = 4;   // the list's +0x28
    std::vector<uint16_t> m_probed;            // stars a probe was sent to
    struct LaunchPanel {                       // I124: the launch window's state
        std::set<uint16_t> enabled;
        std::map<uint16_t, std::string> status;
    } m_interstellar;
    std::vector<sim::Handle> m_planets, m_sites;
    int m_planetFrame{0};
    uint32_t m_lastFrame{0};

    bool m_done{false};
    StartResult m_result;
};

} // namespace outpost::app
