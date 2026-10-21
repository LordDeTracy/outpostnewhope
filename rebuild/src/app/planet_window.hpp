// IMPROVED (I110): the planet window. The original's colony screen has a
// planet window (registry 0x2D, top left) with the turning globe of the
// planet landed on and its sites as dots; the player remembered clicking
// other sites there. The rebuild's: the globe (catalog 261..276 from the
// planet's sheets, as in orbit) with every site of the planet at its place
// from the site table (longitude, latitude; DGROUP 0x65E6), a list of the
// sites with what stands on each, the selected site's picture and layout,
// and "View Site", which turns the colony screen to that site. Other sites
// than those with a colony of the player show only once an Orbital Observer
// is in orbit (or a factory-made one is in a warehouse): the "visual
// satellite" the player wondered about. On a site with no colony a Command
// Center founds one (sim CommandCenterBuilding::canPlace, I110).
#pragma once

#include "app/gfx.hpp"
#include "app/site_map.hpp"
#include "sim/object_db.hpp"

#include <SDL.h>

#include <string>
#include <vector>

namespace outpost::data {
class BuildingPictures;
}

namespace outpost::sim {
class Simulation;
}

namespace outpost::app {

// The sites the player can see and go to: those with a colony of the
// player's, the landing site, and all of them with an Orbital Observer.
bool sitesSurveyed(const sim::Simulation& sim);
bool siteVisible(const sim::Simulation& sim, sim::Handle site, sim::Handle landingSite);

class PlanetWindow {
public:
    PlanetWindow(sim::Simulation& sim, const data::BuildingPictures& pics, sim::Handle currentSite,
                 sim::Handle landingSite);
    void draw(Gfx& g, const SDL_Rect& screen, uint32_t nowMs);
    enum class Result { None, Close, Go };
    Result handle(const SDL_Event& e);
    sim::Handle chosenSite() const { return m_selected; }
    // Scripted runs (--dpress): 1 View Site, 2 Close, 3 turn left, 4 turn
    // right; selectRow picks a row of the site list.
    Result press(int id);
    void selectRow(int row);

private:
    struct Row {
        sim::Handle site;
        std::string name, status;
        bool visible{false}, mine{false}, rebels{false};
        float lon{0}, lat{0};
    };
    sim::Simulation& m_sim;
    const data::BuildingPictures& m_pics;
    sim::Handle m_current, m_landing, m_selected;
    std::vector<Row> m_rows;
    int m_frame{0};
    uint32_t m_lastSpin{0};
    bool m_spin{true};
    int m_scroll{0};
    uint32_t m_lastClick{0};
    int m_lastRow{-1};
    SDL_Rect m_rect{}, m_globe{}, m_list{}, m_info{};
    std::vector<std::pair<SDL_Rect, int>> m_buttons;
    std::vector<std::pair<SDL_FPoint, sim::Handle>> m_dots;   // where each visible site was drawn
    int m_hot{-1};
    SiteMap m_siteMap;

    void refresh();
    const Row* selectedRow() const;
};

} // namespace outpost::app
