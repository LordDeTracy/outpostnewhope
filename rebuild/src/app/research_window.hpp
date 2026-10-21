// The research tree window, opened by a lab window's "Research Topic:"
// button (dialog 4003, control 6032).
//
// After the original as its manual describes it (OUTP_GB.PDF, "Operating
// your labs" and "Research Topics"): the tree is shown one level at a time
// from the top; a category opens to show the level beneath it; colours tell
// a topic's state (the Color Legend, dialog 4051: Not Researched, Research
// Completed, Current Research, Hot Lab research available); Study sets the
// lab's topic; the hot-lab topics hang under Medicine, Artificial
// Intelligence and Quantum Mechanics and show once a Hot Lab is built.
// IMPROVED (I103): the original window's code (treebutn.bmp, the empty
// templates 4011/4035/4047/4057/4058) is not decoded, so the layout, the
// details panel, the locked rows and the discoveries list are the
// rebuild's; the topics, costs, prerequisites and discoveries are the EXE's.
#pragma once

#include "app/gfx.hpp"
#include "sim/object_db.hpp"

#include <SDL.h>

#include <string>
#include <vector>

namespace outpost::data {
struct ResearchTopic;
}

namespace outpost::sim {
class Simulation;
class Player;
class LabBuilding;
}

namespace outpost::app {

class ResearchWindow {
public:
    // The legend's four labels (dialog 4051's statics 4052..4055).
    struct Legend {
        std::string notResearched{"Not Researched"}, completed{"Research Completed"},
            current{"Current Research"}, hotLab{"Hot Lab research available"};
    };
    ResearchWindow(sim::Simulation& sim, sim::Handle labTile, std::string title, Legend legend);

    void draw(Gfx& g, const SDL_Rect& screen);
    enum class Result { None, Close, Studied };
    Result handle(const SDL_Event& e);
    // Scripted runs (--dpress): the buttons are 1 Study, 2 Open, 3 Up a
    // Level, 4 Top, 5 Discoveries, 6 Close; selectRow picks a row of the list.
    Result press(int id);
    void selectRow(int row);

private:
    enum class State { Done, Current, Hot, Open, Locked };
    struct Row {
        uint16_t topic;
        State state;
        bool children;
    };

    sim::Simulation& m_sim;
    sim::Handle m_labTile;
    std::string m_title;
    Legend m_legend;
    int m_level{0};             // the topic whose children are shown
    int m_selected{-1};         // a topic, or -1
    int m_scroll{0};
    bool m_discoveries{false};  // the right side lists the discoveries made
    std::vector<Row> m_rows;
    bool m_hotLabBuilt{false};                       // cached by refresh()
    std::vector<std::vector<uint16_t>> m_children;   // shown children by topic id
    SDL_Rect m_rect{}, m_list{}, m_info{};
    std::vector<std::pair<SDL_Rect, int>> m_buttons;   // button rectangles and their ids
    int m_hotButton{-1};
    uint32_t m_lastClick{0};
    int m_lastRow{-1};

    sim::LabBuilding* lab() const;
    const sim::Player* player() const;
    bool hotLab() const;
    bool hasHotLab() const;
    int displayParent(const data::ResearchTopic& t) const;
    bool shown(const data::ResearchTopic& t) const;
    bool done(int topic) const;
    bool unlocked(const data::ResearchTopic& t) const;
    bool studiedElsewhere(uint16_t topic) const;
    State stateOf(const data::ResearchTopic& t) const;
    bool canStudy(uint16_t topic) const;
    std::string whyNot(uint16_t topic) const;
    const std::vector<uint16_t>& childrenOf(int level) const;
    bool hotBelow(int topic) const;     // a hot-lab topic ready to study under it
    double pointsPerTurn() const;
    void refresh();                 // the tree as shown now, and the rows
    void open(int level);
    void study();
    void drawInfo(Gfx& g);
    void drawDiscoveries(Gfx& g);
    std::string name(int topic) const;
};

} // namespace outpost::app
