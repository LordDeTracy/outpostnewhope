// The rebuild's screens, after the original's resources: the main menu
// bar (OPPOPMENU), dialogs from the EXE's 61 templates, the building panel
// and the status line.
#pragma once

#include "app/gfx.hpp"
#include "data/dialog_template.hpp"
#include "data/menu_resource.hpp"

#include <functional>
#include <map>
#include <optional>
#include <set>
#include <string>
#include <vector>

namespace outpost::app {

// IMPROVED (I119): a click sound when a button, box or menu command is
// chosen (OutpostHD's click.ogg); the game sets what it plays.
void setUiClick(std::function<void()> play);
void uiClick();

// The menu bar: the top-level pop-ups of a menu resource.
class MenuBar {
public:
    static constexpr int kHeight = 20;
    explicit MenuBar(data::MenuResource menu);
    void draw(Gfx& g, int width);
    // Returns a command id when one is chosen, -1 when the event was used,
    // 0 otherwise.
    int handle(const SDL_Event& e, Gfx& g);
    bool isOpen() const { return m_open >= 0; }
    // A pop-up of the rebuild's own (the Reports menu).
    void addPopup(data::MenuItem item) { m_popups.push_back(std::move(item)); }

private:
    std::vector<data::MenuItem> m_popups;
    std::vector<SDL_Rect> m_titles;
    int m_open{-1}, m_hot{-1};
    SDL_Rect dropRect(Gfx& g, int i) const;
};

// A pop-up menu at a point (TILEMENU): sub-menus are shown inline,
// indented under their title.
class PopupMenu {
public:
    PopupMenu(const data::MenuResource& menu, int x, int y);
    void draw(Gfx& g);
    // Returns a command id when one is chosen, -1 when closed, 0 otherwise.
    int handle(const SDL_Event& e, Gfx& g);

private:
    struct Row {
        uint16_t id;
        std::string text;
        bool separator, title;
        int indent;
    };
    std::vector<Row> m_rows;
    int m_x, m_y, m_hot{-1};
    SDL_Rect rect(Gfx& g) const;
};

// A dialog drawn from an EXE template. Static controls show their template
// text unless `values` gives one; push buttons (BUTTON, OPButton) report
// their id; check boxes and radio buttons toggle `checked` (radio buttons
// are exclusive within the dialog) and report their id; one EDIT takes
// typed text; list boxes show `lists`, a click selects a row (`selected`)
// and reports the list's id. `disabled` controls are grey and inert,
// `hidden` ones are not drawn; controls beyond the window's current width
// are cut off.
class Dialog {
public:
    Dialog(data::DialogTemplate t, std::string caption = {});
    std::map<uint16_t, std::string> values;
    std::map<uint16_t, std::vector<std::string>> lists;
    std::map<uint16_t, int> selected;    // list box -> selected row (-1 none)
    std::set<uint16_t> checked, disabled, hidden;
    std::set<std::string> greyLabels;    // labels without an id drawn greyed
    std::map<uint16_t, int> sliders;     // "SLIDER" controls (the rebuild's): 0..100
    std::string edit;                // the first EDIT control's text
    int spin{0};                     // +1 / -1 after a MicroSpinControl click (handle returns its id)
    bool doubleClick{false};         // the last list click was a double click

    void centreIn(const SDL_Rect& area);
    void moveTo(int x, int y) { m_rect.x = x; m_rect.y = y; }
    // The width in dialog units (a window that widens, "Resources>>").
    void setWidthDlu(int cx) { m_rect.w = px(cx) + 8; }
    int widthDlu() const { return m_t.cx; }
    // The width that shows every control of the template.
    int fullWidthDlu() const;
    const SDL_Rect& rect() const { return m_rect; }
    const data::DialogTemplate& templ() const { return m_t; }
    void setCaption(std::string c) { m_caption = std::move(c); }
    // Changes the template text of the controls that show `from` (for
    // controls without an id of their own).
    void replaceText(const std::string& from, const std::string& to) {
        for (auto& c : m_t.controls)
            if (c.text == from) c.text = to;
    }
    void draw(Gfx& g);
    // Returns the id of the control used (Esc = 2, Enter = 1), or 0.
    int handle(const SDL_Event& e);
    // The screen rectangle of the (first) control with this id.
    std::optional<SDL_Rect> rectOf(uint16_t id) const;
    // The screen rectangle of an area given in dialog units.
    SDL_Rect dluRect(int x, int y, int cx, int cy) const {
        return {m_rect.x + 4 + px(x), m_rect.y + 24 + py(y), px(cx), py(cy)};
    }

private:
    SDL_Rect controlRect(const data::DialogTemplate::Control& c) const;
    SDL_Rect clientRect() const;
    bool shown(const data::DialogTemplate::Control& c) const;
    static bool isCheck(const data::DialogTemplate::Control& c);
    static bool isRadio(const data::DialogTemplate::Control& c);
    std::map<uint16_t, int> m_listScroll;
    int m_openCombo{-1};                 // a drop-down combo box's open list (its id)
    int m_dragSlider{-1};                // the slider being dragged
    SDL_Rect comboDrop(const data::DialogTemplate::Control& c) const;
    uint32_t m_lastListClick{0};
    int m_lastListRow{-1};
    data::DialogTemplate m_t;
    std::string m_caption;
    SDL_Rect m_rect{};
    int m_pressed{-1};
    // Dialog units: MS Sans Serif 8 has 6 x 13 base units (1.5 x 1.625 px
    // per unit); the rebuild's font is wider, so the layout is scaled up.
    static int px(int dluX) { return dluX * 2; }
    static int py(int dluY) { return dluY * 15 / 8; }
    static constexpr int kListRow = 15;   // list rows: the font's line height
};

// A simple message box (the original uses MessageBox and the A.I. Says
// dialogs 4039-4041).
struct Message {
    std::string title, text;
};

// The building panel: the types the build menu offers, with pictures.
class BuildPanel {
public:
    static constexpr int kWidth = 210, kRow = 44;
    struct Entry {
        uint16_t type;
        std::string name;
        bool unavailable{false};   // shown greyed; cannot be chosen
    };
    // A choice the new list no longer offers (another level's robots, a
    // lander that is gone) is dropped.
    void setEntries(std::vector<Entry> e) {
        m_entries = std::move(e);
        bool kept = false;
        for (const auto& x : m_entries) kept = kept || (x.type == m_selected && !x.unavailable);
        if (!kept) m_selected = 0;
    }
    void draw(Gfx& g, const SDL_Rect& r, const data::BuildingPictures& pics);
    // Returns true when the event was inside the panel.
    bool handle(const SDL_Event& e, const SDL_Rect& r);
    uint16_t selected() const { return m_selected; }
    void clearSelection() { m_selected = 0; }

private:
    std::vector<Entry> m_entries;
    uint16_t m_selected{0};
    int m_scroll{0};
};

void drawMessage(Gfx& g, const Message& m, const SDL_Rect& area);
// A Yes/No question: the box and its two buttons, below the text.
// IMPROVED (I93, I95): Preferences (dialog 4027) gains a "Terrain Packs"
// check box (kTerrainPacksBox) and a Music Volume slider (kMusicVolume)
// above its note and buttons, which move down.
constexpr uint16_t kTerrainPacksBox = 4090, kMusicVolume = 4091;
void addTerrainPackOption(data::DialogTemplate& t);

struct QuestionLayout {
    SDL_Rect box, yes, no;
};
QuestionLayout questionLayout(Gfx& g, const Message& m, const SDL_Rect& area);
void drawQuestion(Gfx& g, const Message& m, const SDL_Rect& area);

} // namespace outpost::app
