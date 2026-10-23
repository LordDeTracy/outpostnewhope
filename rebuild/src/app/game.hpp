// The colony screen: the site map, the structure panel, the menus, the
// building windows and reports, the message log. A loaded game starts here;
// a new game starts here with its Seed still to land.
#pragma once

#include "sim/rebel_ai_improved.hpp"

#include "app/gfx.hpp"
#include "app/map_view.hpp"
#include "app/planet_window.hpp"
#include "app/research_window.hpp"
#include "app/site_map.hpp"
#include "app/start.hpp"
#include "app/ui.hpp"
#include "data/menu_resource.hpp"
#include "data/pictures.hpp"
#include "sim/new_game.hpp"
#include "sim/simulation.hpp"

#include <SDL.h>

#include <deque>
#include <filesystem>
#include <memory>
#include <functional>
#include <optional>
#include <set>
#include <string>
#include <vector>

namespace outpost::app {

class Game {
public:
    // What the main loop should do after an event.
    enum class Next { Stay, Quit, Menu };

    Game(SDL_Window* win, SDL_Renderer* ren, sim::GameData& data, StartResult start, const data::BuildingPictures& pics,
         Gfx& gfx, std::filesystem::path saveDir, Preferences& prefs, Media& media);

    bool hasSite() const;
    void frame(bool present = true);
    Next event(const SDL_Event& e);
    void scrollKeys();
    // An ending movie has closed the game (command 238): back to the menu.
    bool over() const { return m_over; }

    // Scripted actions (--shot).
    // `digDirection`: a digger's direction from dialog 4024 (0: not asked).
    // `dozeConfirmed`: the player said yes to "Do you want to doze this
    // building?" (s9:8520).
    void placeAt(uint16_t type, int16_t x, int16_t y, uint16_t digDirection = 0, bool dozeConfirmed = false);
    void setLevel(int16_t l);
    void tileAt(int16_t x, int16_t y, int cmd);
    void openBuilding(int16_t x, int16_t y);
    void runTurns(int n);
    // Scripted: print each turn's colony figures and log codes (--trace).
    void setTrace(bool on) { m_trace = on; }
    void openDialog(uint16_t id);
    void openReport(int cmd);
    // Scripted: a button of the open dialog.
    void pressDialog(int id);
    // Save the game (File > Save, Save As, and --save).
    void save(const std::filesystem::path& file);
    // Scripted: the Seed on the first cell of the site that takes it.
    void autoLand();
    // Scripted: put a building at an offset from colony 1's hub.
    void placeNear(uint16_t type, int16_t dx, int16_t dy);
    sim::Simulation& sim() { return *m_sim; }

private:
    SDL_Rect mapArea() const;
    SDL_Rect panelArea() const;
    bool insideMap(int x, int y) const;
    std::string nameOf(uint16_t type) const;
    std::string resourceName(int id) const;
    std::string productName(uint16_t p) const;
    std::string productBName(uint16_t p) const;
    bool landing() const;
    // IMPROVED (I100): the colony in view, which building and the reports
    // use; C switches to the player's next colony.
    sim::Handle m_colony{sim::Handle::make(sim::ObjType::Colony, 1)};
    std::vector<sim::Handle> playerColonies() const;
    void nextColony();
    // IMPROVED (I99): the trade window (key D).
    void openTrade();
    void openInterview();
    Message buildingButtonText(int id);   // I126          // I123: the morale crisis' Editor Interview (459)
    void refreshTrade();
    void tradeCommand(int id);
    sim::TradeOffer tradeDraft() const;

    void refreshBuildPanel();
    void updateTitle();
    void drawStatus(int w, int h);
    void drawLog(int w, int h);
    // IMPROVED (I53): the site overview (key M; always shown before the
    // landing): the whole map with the mining beacons and the view's centre.
    SDL_Rect overviewArea() const;
    void drawOverview();
    // `afterTurn`: the notices of a turn just run (repeated messages pop
    // up only on the first turn of a run of turns that post them).
    void warnAhead();                          // I97: the Seed's timed events
    void collectNotices(bool afterTurn = false);
    // s2:2C4E: a movie chain over the colony view (a message log entry's
    // movie, s2:AB80).
    void startMovie(uint16_t command);
    Next key(const SDL_KeyboardEvent& k);
    Next command(int cmd);
    void click(int x, int y);
    const sim::Tile* buildingTileAt(int x, int y);
    std::string tileLabel(const sim::Tile& t);
    void tileCommand(int cmd);
    void reopenTransit();
    static bool notYetPlayable(uint16_t type);
    int16_t freeTrucks(const sim::Tile& self);
    void openTrucks();
    void showTrucks();
    void addLeg(int x, int y);
    void describeTile(const sim::Tile& t);
    void dialogCommand(int id);
    void fillDialog();
    // Moves the window after the screen changed size (I120).
    void reflow();
    void closeDialog(int id);

    // Building windows (a click on a building).
    void openBuildingWindow(const sim::Tile& t);
    void fillBuilding();
    void fillResourceTable(const sim::Building& b);
    void openTopics();
    void closeTopics();
    void drawDialogExtras();

    SDL_Window* m_win;
    SDL_Renderer* m_ren;
    sim::GameData& m_data;
    std::unique_ptr<sim::Simulation> m_sim;
    std::unique_ptr<sim::NewGame> m_newGame;
    sim::Handle m_landingSite;
    const data::BuildingPictures& m_pics;
    Gfx& m_gfx;
    Preferences& m_prefs;
    Media& m_media;
    bool m_over{false};
    bool m_trace{false};
    SiteMap m_overview;
    bool m_showOverview{false};
    uint32_t m_overviewVersion{0};            // bumped when the map changes
    MapView m_map;
    data::TerrainPacks m_terrainPacks;         // I93, from assets/terrain-packs
    int m_prefsVolumeBefore{80};               // Preferences' Cancel restores it
    MenuBar m_menu;
    BuildPanel m_panel;
    std::unique_ptr<Dialog> m_dialog;
    SDL_Rect m_laidOut{};            // the screen m_dialog was placed on
    uint16_t m_dialogId{0};
    bool m_wide{false};                      // "Resources>>" pressed
    std::unique_ptr<PopupMenu> m_popup;
    data::MenuResource m_tileMenu;
    sim::Handle m_routeTile;                 // the tile whose window, route or trucks are open
    std::vector<sim::Handle> m_routeBackup;  // restored on Cancel
    bool m_addLeg{false};                    // the next map click adds a stop
    int16_t m_trucksDraft{0};
    std::unique_ptr<ResearchWindow> m_research;   // the research tree (I103), over the lab window
    std::unique_ptr<PlanetWindow> m_planet;       // the planet and its sites (I110)
    void openPlanet();
    void goToSite(sim::Handle site);
    std::vector<uint16_t> m_factoryList;     // the Factory window's products, by row
    std::optional<Message> m_message;
    struct Question {
        Message message;
        std::function<void()> yes;
    };
    std::optional<Question> m_question;      // a Yes/No box (MB_YESNO)
    std::deque<Message> m_pending;           // messages waiting to be shown
    std::string m_status;
    std::deque<std::string> m_log;           // the message log, newest last
    std::vector<sim::Handle> m_sites;
    std::filesystem::path m_saveDir, m_saveFile;
    bool m_lostShown{false};
    bool m_interviewDue{false};    // I123: SCEvent asked for the interview (WM_COMMAND 0x106)
    std::set<std::string> m_repeating;       // messages that popped up last turn
    bool m_naming{false};                    // the Name dialog names the new colony
    struct PendingDig {
        uint16_t type{0};
        int16_t x{0}, y{0};
    } m_dig;                                 // the digger waiting for dialog 4024
};

} // namespace outpost::app
