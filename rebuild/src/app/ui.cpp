#include "app/ui.hpp"
#include "app/hd_sprites.hpp"

#include <algorithm>

namespace outpost::app {

namespace {

bool inside(const SDL_Rect& r, int x, int y) { return x >= r.x && y >= r.y && x < r.x + r.w && y < r.y + r.h; }

std::function<void()>& clickSound() {
    static std::function<void()> f;
    return f;
}

} // namespace

void setUiClick(std::function<void()> play) { clickSound() = std::move(play); }
void uiClick() {
    if (clickSound()) clickSound()();
}

namespace {

// "&Transit" -> "Transit"; "Run a Turn     ^T" -> {"Run a Turn", "^T"}.
std::pair<std::string, std::string> splitLabel(const std::string& s) {
    std::string label;
    for (char c : s)
        if (c != '&') label.push_back(c);
    std::string key;
    if (auto tab = label.find('\t'); tab != std::string::npos) {
        key = label.substr(tab + 1);
        label = label.substr(0, tab);
    } else if (auto gap = label.find("  "); gap != std::string::npos) {
        key = label.substr(label.find_first_not_of(' ', gap));
        label = label.substr(0, gap);
    }
    return {label, key};
}

} // namespace

// ── Menu bar ──────────────────────────────────────────────────────────────

MenuBar::MenuBar(data::MenuResource menu) {
    if (!menu.items.empty() && menu.items[0].popup() && menu.items[0].text.empty())
        m_popups = menu.items[0].children;      // OPPOPMENU: one unnamed pop-up holds the bar
    else
        m_popups = menu.items;
}

SDL_Rect MenuBar::dropRect(Gfx& g, int i) const {
    int w = 120;
    for (const auto& it : m_popups[i].children) {
        auto [label, key] = splitLabel(it.text);
        w = std::max(w, g.textWidth(label) + g.textWidth(key) + 48);
    }
    int h = 4;
    for (const auto& it : m_popups[i].children) h += it.separator ? 8 : g.lineHeight() + 4;
    return {m_titles[i].x, kHeight, w, h};
}

void MenuBar::draw(Gfx& g, int width) {
    g.fill({0, 0, width, kHeight}, ui::kWindow);
    g.fill({0, kHeight - 2, width, 1}, ui::kRed);
    g.fill({0, kHeight - 1, width, 1}, ui::kOrange);
    m_titles.clear();
    int x = 6;
    for (size_t i = 0; i < m_popups.size(); ++i) {
        auto [label, key] = splitLabel(m_popups[i].text);
        const int w = g.textWidth(label) + 16;
        m_titles.push_back({x, 0, w, kHeight});
        const bool open = int(i) == m_open;
        if (open) g.fill({x, 0, w, kHeight - 2}, ui::kHighlight);
        g.text(label, x + 8, 1, open ? ui::kHighlightText : ui::kGold);
        x += w;
    }
    if (m_open < 0) return;
    const SDL_Rect r = dropRect(g, m_open);
    g.panel(r);
    int y = r.y + 2;
    int i = 0;
    for (const auto& it : m_popups[m_open].children) {
        if (it.separator) {
            g.fill({r.x + 4, y + 3, r.w - 8, 1}, ui::kShadow);
            y += 8;
        } else {
            const SDL_Rect row{r.x + 2, y, r.w - 4, g.lineHeight() + 4};
            const bool hot = i == m_hot;
            if (hot) g.fill(row, ui::kHighlight);
            auto [label, key] = splitLabel(it.text);
            const Colour c = hot ? ui::kHighlightText : ui::kText;
            g.text(label, row.x + 18, y + 2, c);
            if (!key.empty()) g.text(key, row.x + row.w - g.textWidth(key) - 8, y + 2, c);
            y += row.h;
        }
        ++i;
    }
}

int MenuBar::handle(const SDL_Event& e, Gfx& g) {
    if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT) {
        const int x = e.button.x, y = e.button.y;
        for (size_t i = 0; i < m_titles.size(); ++i)
            if (inside(m_titles[i], x, y)) {
                m_open = m_open == int(i) ? -1 : int(i);
                m_hot = -1;
                return -1;
            }
        if (m_open >= 0) {
            const SDL_Rect r = dropRect(g, m_open);
            int cmd = 0;
            if (inside(r, x, y)) {
                int yy = r.y + 2;
                for (const auto& it : m_popups[m_open].children) {
                    const int h = it.separator ? 8 : g.lineHeight() + 4;
                    if (y >= yy && y < yy + h && !it.separator && !it.popup()) cmd = it.id;
                    yy += h;
                }
            }
            m_open = -1;
            if (cmd) uiClick();
            return cmd ? cmd : -1;
        }
    }
    if (e.type == SDL_MOUSEMOTION && m_open >= 0) {
        const SDL_Rect r = dropRect(g, m_open);
        m_hot = -1;
        if (inside(r, e.motion.x, e.motion.y)) {
            int yy = r.y + 2, i = 0;
            for (const auto& it : m_popups[m_open].children) {
                const int h = it.separator ? 8 : g.lineHeight() + 4;
                if (e.motion.y >= yy && e.motion.y < yy + h && !it.separator) m_hot = i;
                yy += h;
                ++i;
            }
        }
        for (size_t i = 0; i < m_titles.size(); ++i)
            if (inside(m_titles[i], e.motion.x, e.motion.y)) m_open = int(i);
        return -1;
    }
    if (e.type == SDL_KEYDOWN && m_open >= 0 && e.key.keysym.sym == SDLK_ESCAPE) {
        m_open = -1;
        return -1;
    }
    return 0;
}

// ── Pop-up menu ───────────────────────────────────────────────────────────

PopupMenu::PopupMenu(const data::MenuResource& menu, int x, int y) : m_x(x), m_y(y) {
    std::function<void(const std::vector<data::MenuItem>&, int)> add = [&](const std::vector<data::MenuItem>& items,
                                                                          int indent) {
        for (const auto& it : items) {
            if (it.popup() && it.text.empty()) {
                add(it.children, indent);
                continue;
            }
            m_rows.push_back({it.id, splitLabel(it.text).first, it.separator, it.popup(), indent});
            if (it.popup()) add(it.children, indent + 1);
        }
    };
    add(menu.items, 0);
}

SDL_Rect PopupMenu::rect(Gfx& g) const {
    int w = 140, h = 4;
    for (const auto& r : m_rows) {
        w = std::max(w, g.textWidth(r.text) + 30 + 14 * r.indent);
        h += r.separator ? 8 : g.lineHeight() + 4;
    }
    return {m_x, m_y, w, h};
}

void PopupMenu::draw(Gfx& g) {
    const SDL_Rect r = rect(g);
    g.panel(r);
    int y = r.y + 2, i = 0;
    for (const auto& row : m_rows) {
        if (row.separator) {
            g.fill({r.x + 4, y + 3, r.w - 8, 1}, ui::kShadow);
            y += 8;
        } else {
            const SDL_Rect line{r.x + 2, y, r.w - 4, g.lineHeight() + 4};
            const bool hot = i == m_hot && !row.title;
            if (hot) g.fill(line, ui::kHighlight);
            g.text(row.text, line.x + 12 + 14 * row.indent, y + 2,
                   hot ? ui::kHighlightText : row.title ? ui::kShadow : ui::kText, row.title);
            y += line.h;
        }
        ++i;
    }
}

int PopupMenu::handle(const SDL_Event& e, Gfx& g) {
    const SDL_Rect r = rect(g);
    auto rowAt = [&](int my) {
        int y = r.y + 2;
        for (size_t i = 0; i < m_rows.size(); ++i) {
            const int h = m_rows[i].separator ? 8 : g.lineHeight() + 4;
            if (my >= y && my < y + h) return int(i);
            y += h;
        }
        return -1;
    };
    if (e.type == SDL_MOUSEMOTION) m_hot = inside(r, e.motion.x, e.motion.y) ? rowAt(e.motion.y) : -1;
    if (e.type == SDL_KEYDOWN && e.key.keysym.sym == SDLK_ESCAPE) return -1;
    if (e.type == SDL_MOUSEBUTTONDOWN) {
        if (!inside(r, e.button.x, e.button.y)) return -1;
        const int i = rowAt(e.button.y);
        if (i >= 0 && !m_rows[i].separator && !m_rows[i].title && m_rows[i].id) {
            uiClick();
            return m_rows[i].id;
        }
    }
    return 0;
}

// ── Dialogs ───────────────────────────────────────────────────────────────

Dialog::Dialog(data::DialogTemplate t, std::string caption) : m_t(std::move(t)), m_caption(std::move(caption)) {
    if (m_caption.empty()) m_caption = m_t.caption;
    m_rect = {0, 0, px(m_t.cx) + 8, py(m_t.cy) + 28};
    for (const auto& c : m_t.controls)
        if (c.className == "EDIT") {
            edit = c.text;
            break;
        }
}

void Dialog::centreIn(const SDL_Rect& area) {
    const int w = px(m_t.cx) + 8, h = py(m_t.cy) + 28;
    m_rect = {area.x + (area.w - w) / 2, area.y + (area.h - h) / 2, w, h};
}

SDL_Rect Dialog::controlRect(const data::DialogTemplate::Control& c) const {
    return {m_rect.x + 4 + px(c.x), m_rect.y + 24 + py(c.y), px(c.cx), py(c.cy)};
}

std::optional<SDL_Rect> Dialog::rectOf(uint16_t id) const {
    for (const auto& c : m_t.controls)
        if (c.id == id) return controlRect(c);
    return std::nullopt;
}

// BS_CHECKBOX 2, BS_AUTOCHECKBOX 3, BS_3STATE 5, BS_AUTO3STATE 6; BS_RADIOBUTTON
// 4, BS_AUTORADIOBUTTON 9.
bool Dialog::isCheck(const data::DialogTemplate::Control& c) {
    const uint32_t k = c.style & 0xF;
    return c.className == "BUTTON" && (k == 2 || k == 3 || k == 5 || k == 6);
}
bool Dialog::isRadio(const data::DialogTemplate::Control& c) {
    const uint32_t k = c.style & 0xF;
    return c.className == "BUTTON" && (k == 4 || k == 9);
}

void Dialog::draw(Gfx& g) {
    g.fill({m_rect.x + 5, m_rect.y + 5, m_rect.w, m_rect.h}, Colour{0, 0, 0, 120});   // shadow
    g.panel(m_rect, true);
    g.titleBar({m_rect.x + 3, m_rect.y + 3, m_rect.w - 6, 19}, g.headingWidth(m_caption));
    g.heading(m_caption, m_rect.x + 10, m_rect.y + 5, ui::kWindow);
    // Controls beyond the window's width are cut off, as in a Win16 window
    // narrower than its template ("Resources>>", "More>>").
    const SDL_Rect client = clientRect();
    SDL_RenderSetClipRect(g.renderer(), &client);
    for (const auto& c : m_t.controls) {
        if (hidden.count(c.id) && c.id != 0xFFFF) continue;
        if (!shown(c)) continue;
        SDL_Rect r = controlRect(c);
        const std::string& cls = c.className;
        const auto v = values.find(c.id);
        const std::string& text = v != values.end() && c.id != 0xFFFF ? v->second : c.text;
        const uint32_t kind = c.style & 0xF;
        const bool off = disabled.count(c.id) != 0;
        const Colour ink = off ? ui::kShadow : ui::kText;
        if (cls == "BUTTON" && kind == 7) {                         // group box
            g.frame({r.x, r.y + 6, r.w, r.h - 6}, ui::kShadow);
            const int tw = g.textWidth(text);
            if (tw) {
                g.fill({r.x + 6, r.y, tw + 6, g.lineHeight()}, ui::kFace);
                g.text(text, r.x + 9, r.y - 2);
            }
        } else if (isCheck(c) || isRadio(c)) {
            const int box = 12, by = r.y + (r.h - box) / 2;
            const SDL_Rect b{r.x, by, box, box};
            g.fill(b, ui::kWindow);
            g.frame(b, ui::kShadow);
            if (checked.count(c.id)) {
                if (isRadio(c)) {
                    g.fill({b.x + 3, b.y + 3, box - 6, box - 6}, ui::kGold);
                } else {
                    SDL_SetRenderDrawColor(g.renderer(), ui::kGold.r, ui::kGold.g, ui::kGold.b, 255);
                    SDL_RenderDrawLine(g.renderer(), b.x + 2, b.y + 6, b.x + 5, b.y + 9);
                    SDL_RenderDrawLine(g.renderer(), b.x + 5, b.y + 9, b.x + 10, b.y + 2);
                    SDL_RenderDrawLine(g.renderer(), b.x + 2, b.y + 5, b.x + 5, b.y + 8);
                    SDL_RenderDrawLine(g.renderer(), b.x + 5, b.y + 8, b.x + 10, b.y + 1);
                }
            }
            g.text(text, r.x + box + 5, r.y + (r.h - g.lineHeight()) / 2, ink);
        } else if (cls == "BUTTON" || cls == "OPButton") {
            const bool down = m_pressed == c.id;
            // A label wider than its button (the rebuild's font is wider than
            // MS Sans Serif) widens the button around it, so the corner art
            // does not cover its first and last letters.
            if (const int need = g.textWidth(text, (c.style & 1) != 0) + 18; need > r.w) {
                r.x -= (need - r.w) / 2;
                r.w = need;
            }
            const bool def = (c.style & 1) != 0;                          // BS_DEFPUSHBUTTON
            g.button(r, down ? Gfx::ButtonState::Down : def ? Gfx::ButtonState::Hot : Gfx::ButtonState::Normal);
            const int tw = g.textWidth(text, def);
            g.text(text, r.x + (r.w - tw) / 2, r.y + (r.h - g.lineHeight()) / 2,
                   off ? ui::kShadow : def ? ui::kGold : ui::kText, def);
        } else if (cls == "EDIT") {
            const bool readOnly = (c.style & 0x800) != 0;                // ES_READONLY
            g.fill(r, readOnly ? ui::kFace : ui::kWindow);
            g.frame(r, ui::kShadow);
            const std::string shown = v != values.end() ? v->second : edit + (readOnly ? "" : "_");
            g.text(shown, r.x + 3, r.y + (r.h - g.lineHeight()) / 2);
        } else if (cls == "MicroSpinControl") {
            const SDL_Rect up{r.x, r.y, std::max(r.w, 12), r.h / 2};
            const SDL_Rect dn{r.x, r.y + r.h / 2, std::max(r.w, 12), r.h - r.h / 2};
            g.bevel(up);
            g.bevel(dn);
            g.text("+", up.x + 2, up.y - 4, ink);
            g.text("-", dn.x + 3, dn.y - 4, ink);
        } else if (cls == "SLIDER") {                               // the rebuild's: a track and a handle
            const int level = sliders.count(c.id) ? std::clamp(sliders.at(c.id), 0, 100) : 0;
            const int tw = r.w - 40, ty = r.y + r.h / 2;
            g.fill({r.x, ty - 2, tw, 4}, ui::kWindow);
            g.fill({r.x, ty - 2, tw * level / 100, 4}, ui::kOrange);
            g.frame({r.x, ty - 2, tw, 4}, ui::kShadow);
            const SDL_Rect knob{r.x + tw * level / 100 - 5, r.y, 10, r.h};
            g.bevel(knob);
            g.text(std::to_string(level) + "%", r.x + tw + 8, r.y + (r.h - g.lineHeight()) / 2, ink);
        } else if (cls == "COMBOBOX" && (c.style & 3) >= 2) {       // CBS_DROPDOWN(LIST): a box and a button
            g.fill(r, ui::kWindow);
            g.frame(r, ui::kShadow);
            const int sel = selected.count(c.id) ? selected.at(c.id) : -1;
            const auto l = lists.find(c.id);
            if (l != lists.end() && sel >= 0 && size_t(sel) < l->second.size())
                g.text(l->second[size_t(sel)], r.x + 3, r.y + (r.h - g.lineHeight()) / 2, ink);
            const SDL_Rect arrow{r.x + r.w - r.h, r.y, r.h, r.h};
            g.bevel(arrow);
            SDL_SetRenderDrawColor(g.renderer(), ui::kText.r, ui::kText.g, ui::kText.b, 255);
            for (int i = 0; i < 4; ++i)
                SDL_RenderDrawLine(g.renderer(), arrow.x + arrow.w / 2 - 4 + i, arrow.y + arrow.h / 2 - 2 + i,
                                   arrow.x + arrow.w / 2 + 4 - i, arrow.y + arrow.h / 2 - 2 + i);
        } else if (cls == "LISTBOX" || cls == "COMBOBOX") {
            g.fill(r, ui::kWindow);
            g.frame(r, ui::kShadow);
            if (auto l = lists.find(c.id); l != lists.end()) {
                SDL_Rect lr;
                if (!SDL_IntersectRect(&r, &client, &lr)) lr = r;
                SDL_RenderSetClipRect(g.renderer(), &lr);
                const int sel = selected.count(c.id) ? selected.at(c.id) : -1;
                const int first = m_listScroll.count(c.id) ? m_listScroll.at(c.id) : 0;
                int y = r.y + 2;
                for (size_t i = size_t(std::max(0, first)); i < l->second.size(); ++i) {
                    if (y > r.y + r.h) break;
                    if (int(i) == sel) g.fill({r.x + 1, y, r.w - 2, kListRow}, ui::kHighlight);
                    g.text(l->second[i], r.x + 3, y, int(i) == sel ? ui::kHighlightText : ui::kText);
                    y += kListRow;
                }
                SDL_RenderSetClipRect(g.renderer(), &client);
            }
        } else {                                                    // STATIC and others
            const int align = c.style & 3;                         // SS_LEFT, SS_CENTER, SS_RIGHT
            const int tw = g.textWidth(text);
            // Text wider than its control (the rebuild's font is wider than
            // MS Sans Serif) runs on to the right rather than over a label.
            const int x = std::max(r.x, align == 2 ? r.x + r.w - tw : align == 1 ? r.x + (r.w - tw) / 2 : r.x);
            g.text(text, x, r.y - 2, greyLabels.count(text) ? ui::kShadow : ink);
        }
    }
    SDL_RenderSetClipRect(g.renderer(), nullptr);
    // An open drop-down list, over the rest of the window.
    for (const auto& c : m_t.controls) {
        if (c.id != m_openCombo || c.className != "COMBOBOX") continue;
        const SDL_Rect d = comboDrop(c);
        g.fill(d, ui::kWindow);
        g.frame(d, ui::kGold);
        const int sel = selected.count(c.id) ? selected.at(c.id) : -1;
        int y = d.y + 2;
        if (auto l = lists.find(c.id); l != lists.end())
            for (size_t i = 0; i < l->second.size(); ++i, y += kListRow) {
                if (int(i) == sel) g.fill({d.x + 1, y, d.w - 2, kListRow}, ui::kHighlight);
                g.text(l->second[i], d.x + 3, y, int(i) == sel ? ui::kHighlightText : ui::kText);
            }
        break;
    }
}

SDL_Rect Dialog::comboDrop(const data::DialogTemplate::Control& c) const {
    const SDL_Rect r = controlRect(c);
    const int n = lists.count(c.id) ? int(lists.at(c.id).size()) : 0;
    return {r.x, r.y + r.h, r.w, std::max(1, n) * kListRow + 4};
}

void addTerrainPackOption(data::DialogTemplate& t) {
    constexpr int16_t kRow = 34;
    for (auto& c : t.controls)
        if (c.y >= 100) c.y = int16_t(c.y + kRow);
    t.cy = int16_t(t.cy + kRow);
    data::DialogTemplate::Control box;
    box.id = kTerrainPacksBox;
    box.className = "BUTTON";
    box.style = 0x50010003;                         // an auto check box
    box.text = "Terrain Packs (new ground art)";
    box.x = 16;
    box.y = 104;
    box.cx = 160;
    box.cy = 10;
    t.controls.push_back(box);
    data::DialogTemplate::Control label;
    label.id = 0xFFFF;
    label.className = "STATIC";
    label.text = "Music Volume:";
    label.x = 16;
    label.y = 121;
    label.cx = 52;
    label.cy = 8;
    t.controls.push_back(label);
    data::DialogTemplate::Control slider;
    slider.id = kMusicVolume;
    slider.className = "SLIDER";
    slider.x = 68;
    slider.y = 119;
    slider.cx = 110;
    slider.cy = 12;
    t.controls.push_back(slider);
}

SDL_Rect Dialog::clientRect() const { return {m_rect.x + 2, m_rect.y + 22, m_rect.w - 4, m_rect.h - 24}; }

bool Dialog::shown(const data::DialogTemplate::Control& c) const {
    const SDL_Rect client = clientRect();
    return controlRect(c).x < client.x + client.w;
}

int Dialog::fullWidthDlu() const {
    int w = m_t.cx;
    for (const auto& c : m_t.controls) w = std::max(w, c.x + c.cx + 4);
    return w;
}

int Dialog::handle(const SDL_Event& e) {
    if (e.type == SDL_KEYDOWN) {
        if (e.key.keysym.sym == SDLK_ESCAPE) return 2;
        if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_KP_ENTER) return 1;
        if (e.key.keysym.sym == SDLK_BACKSPACE && !edit.empty()) edit.pop_back();
    }
    if (e.type == SDL_TEXTINPUT && edit.size() < 32) edit += e.text.text;
    if (e.type == SDL_MOUSEWHEEL) {
        int mx, my;
        SDL_GetMouseState(&mx, &my);
        for (const auto& c : m_t.controls)
            if ((c.className == "LISTBOX" || c.className == "COMBOBOX") && shown(c) && inside(controlRect(c), mx, my)) {
                const int n = lists.count(c.id) ? int(lists.at(c.id).size()) : 0;
                int& first = m_listScroll[c.id];
                first = std::clamp(first - e.wheel.y * 3, 0, std::max(0, n - 1));
            }
        return 0;
    }
    // A slider: a press on it sets it, a drag moves it, a release ends.
    auto sliderAt = [&](const data::DialogTemplate::Control& c, int x) {
        const SDL_Rect r = controlRect(c);
        sliders[c.id] = std::clamp((x - r.x) * 100 / std::max(1, r.w - 40), 0, 100);
        return int(c.id);
    };
    if (e.type == SDL_MOUSEMOTION && m_dragSlider >= 0)
        for (const auto& c : m_t.controls)
            if (c.id == m_dragSlider && c.className == "SLIDER") return sliderAt(c, e.motion.x);
    if (e.type == SDL_MOUSEBUTTONUP && m_dragSlider >= 0) {
        m_dragSlider = -1;
        return 0;
    }
    if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT && m_openCombo < 0)
        for (const auto& c : m_t.controls)
            if (c.className == "SLIDER" && !disabled.count(c.id) && shown(c)) {
                SDL_Rect r = controlRect(c);
                r.w -= 34;
                r.x -= 6;
                r.w += 12;
                if (inside(r, e.button.x, e.button.y)) {
                    m_dragSlider = c.id;
                    return sliderAt(c, e.button.x);
                }
            }
    if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT && m_openCombo >= 0) {
        // An open drop-down takes the click: a row is chosen, else it closes.
        const int open = m_openCombo;
        m_openCombo = -1;
        for (const auto& c : m_t.controls) {
            if (c.id != open || c.className != "COMBOBOX") continue;
            const SDL_Rect d = comboDrop(c);
            const int n = lists.count(c.id) ? int(lists.at(c.id).size()) : 0;
            const int row = (e.button.y - d.y - 2) / kListRow;
            if (inside(d, e.button.x, e.button.y) && row >= 0 && row < n) {
                selected[c.id] = row;
                doubleClick = false;
                return c.id;
            }
        }
        return 0;
    }
    if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT) {
        for (const auto& c : m_t.controls) {
            if (disabled.count(c.id) || hidden.count(c.id) || !shown(c)) continue;
            const SDL_Rect r = controlRect(c);
            if (c.className == "COMBOBOX" && (c.style & 3) >= 2) {
                if (inside(r, e.button.x, e.button.y)) {
                    m_openCombo = c.id;
                    return 0;
                }
            } else if (c.className == "MicroSpinControl") {
                SDL_Rect s = r;
                s.w = std::max(s.w, 12);
                if (inside(s, e.button.x, e.button.y)) {
                    spin = e.button.y < s.y + s.h / 2 ? +1 : -1;
                    return c.id;
                }
            } else if ((c.className == "LISTBOX" || c.className == "COMBOBOX") && inside(r, e.button.x, e.button.y)) {
                const int n = lists.count(c.id) ? int(lists.at(c.id).size()) : 0;
                const int first = m_listScroll.count(c.id) ? m_listScroll.at(c.id) : 0;
                const int row = first + (e.button.y - r.y - 2) / kListRow;
                if (row >= 0 && row < n) {
                    const uint32_t now = SDL_GetTicks();
                    doubleClick = row == m_lastListRow && now - m_lastListClick < 400;
                    m_lastListClick = now;
                    m_lastListRow = row;
                    selected[c.id] = row;
                    return c.id;
                }
            } else if ((isCheck(c) || isRadio(c)) && inside(r, e.button.x, e.button.y)) {
                if (isRadio(c)) {
                    for (const auto& o : m_t.controls)
                        if (isRadio(o)) checked.erase(o.id);
                    checked.insert(c.id);
                } else if (!checked.erase(c.id)) {
                    checked.insert(c.id);
                }
                uiClick();
                return c.id;
            } else if ((c.className == "OPButton" || (c.className == "BUTTON" && (c.style & 0xF) != 7)) &&
                       inside(r, e.button.x, e.button.y)) {
                m_pressed = c.id;
                uiClick();
            }
        }
    }
    if (e.type == SDL_MOUSEBUTTONUP && e.button.button == SDL_BUTTON_LEFT && m_pressed >= 0) {
        const int id = m_pressed;
        m_pressed = -1;
        for (const auto& c : m_t.controls)
            if (c.id == id && inside(controlRect(c), e.button.x, e.button.y)) return id;
    }
    return 0;
}

// ── Build panel ───────────────────────────────────────────────────────────

void BuildPanel::draw(Gfx& g, const SDL_Rect& r, const data::BuildingPictures& pics) {
    g.panel(r);
    g.heading("STRUCTURES", r.x + 10, r.y + 5);
    const SDL_Rect list{r.x + 4, r.y + 24, r.w - 8, r.h - 28};
    g.fill(list, ui::kWindow);
    g.frame(list, ui::kShadow);
    SDL_RenderSetClipRect(g.renderer(), &list);
    int y = list.y + 2 - m_scroll;
    for (const auto& e : m_entries) {
        const SDL_Rect row{list.x + 1, y, list.w - 2, kRow};
        if (y + kRow >= list.y && y < list.y + list.h) {
            const bool sel = e.type == m_selected;
            if (sel) g.fill(row, ui::kHighlight);
            // IMPROVED (I65): OutpostHD's picture; the original's without it.
            if (auto hp = hdSprites(g).building(e.type)) {
                hdSprites(g).drawFitted(g, *hp, SDL_FRect{float(row.x + 2), float(row.y + 2), 56.0f, kRow - 4.0f});
            } else if (auto p = pics.picture(e.type)) {
                const float s = std::min(56.0f / p->w, (kRow - 4.0f) / p->h);
                g.blit(pics.sheetName(p->sheet), SDL_Rect{p->x, p->y, p->w, p->h},
                       row.x + 2 + (56 - p->w * s) / 2, row.y + 2 + (kRow - 4 - p->h * s) / 2, s);
            }
            g.text(e.name, row.x + 62, row.y + (kRow - g.lineHeight()) / 2,
                   e.unavailable ? ui::kShadow : sel ? ui::kHighlightText : ui::kText);
        }
        y += kRow;
    }
    SDL_RenderSetClipRect(g.renderer(), nullptr);
}

bool BuildPanel::handle(const SDL_Event& e, const SDL_Rect& r) {
    const SDL_Rect list{r.x + 4, r.y + 24, r.w - 8, r.h - 28};
    if (e.type == SDL_MOUSEWHEEL) {
        int mx, my;
        SDL_GetMouseState(&mx, &my);
        if (!inside(r, mx, my)) return false;
        const int maxScroll = std::max(0, int(m_entries.size()) * kRow - list.h + 4);
        m_scroll = std::clamp(m_scroll - e.wheel.y * kRow, 0, maxScroll);
        return true;
    }
    if (e.type == SDL_MOUSEBUTTONDOWN && inside(r, e.button.x, e.button.y)) {
        if (inside(list, e.button.x, e.button.y)) {
            const int i = (e.button.y - list.y - 2 + m_scroll) / kRow;
            if (i >= 0 && i < int(m_entries.size()))
                if (!m_entries[i].unavailable) m_selected = m_selected == m_entries[i].type ? 0 : m_entries[i].type;
        }
        return true;
    }
    return false;
}

// ── Messages ──────────────────────────────────────────────────────────────

namespace {

std::vector<std::string> messageLines(Gfx& g, const std::string& text) {
    // Wrap the text at ~360 px.
    std::vector<std::string> lines;
    std::string line, word;
    auto flush = [&]() {
        if (!word.empty()) {
            const std::string t = line.empty() ? word : line + " " + word;
            if (g.textWidth(t) > 360 && !line.empty()) {
                lines.push_back(line);
                line = word;
            } else {
                line = t;
            }
            word.clear();
        }
    };
    for (char c : text) {
        if (c == ' ') flush();
        else if (c == '\n') { flush(); lines.push_back(line); line.clear(); }
        else word.push_back(c);
    }
    flush();
    if (!line.empty()) lines.push_back(line);
    return lines;
}

SDL_Rect drawBox(Gfx& g, const Message& m, const SDL_Rect& r, const std::vector<std::string>& lines) {
    g.fill({r.x + 5, r.y + 5, r.w, r.h}, Colour{0, 0, 0, 120});
    g.panel(r, true);
    g.titleBar({r.x + 3, r.y + 3, r.w - 6, 19}, g.headingWidth(m.title));
    g.heading(m.title, r.x + 10, r.y + 5, ui::kWindow);
    int y = r.y + 28;
    for (const auto& l : lines) {
        g.text(l, r.x + 12, y);
        y += g.lineHeight();
    }
    return r;
}

} // namespace

void drawMessage(Gfx& g, const Message& m, const SDL_Rect& area) {
    const auto lines = messageLines(g, m.text);
    const int w = 384, h = 60 + int(lines.size()) * g.lineHeight();
    const SDL_Rect r{area.x + (area.w - w) / 2, area.y + (area.h - h) / 2, w, h};
    drawBox(g, m, r, lines);
    g.text("(click or press a key)", r.x + 12, r.y + r.h - g.lineHeight() - 6, ui::kShadow);
}

QuestionLayout questionLayout(Gfx& g, const Message& m, const SDL_Rect& area) {
    const auto lines = messageLines(g, m.text);
    const int w = 384, h = 76 + int(lines.size()) * g.lineHeight();
    const SDL_Rect r{area.x + (area.w - w) / 2, area.y + (area.h - h) / 2, w, h};
    const int by = r.y + r.h - 34;
    return {r, {r.x + w / 2 - 110, by, 100, 24}, {r.x + w / 2 + 10, by, 100, 24}};
}

void drawQuestion(Gfx& g, const Message& m, const SDL_Rect& area) {
    const QuestionLayout q = questionLayout(g, m, area);
    drawBox(g, m, q.box, messageLines(g, m.text));
    for (const auto& [r, label] : {std::pair{q.yes, "Yes"}, std::pair{q.no, "No"}}) {
        g.button(r, Gfx::ButtonState::Normal);
        g.text(label, r.x + (r.w - g.textWidth(label)) / 2, r.y + (r.h - g.lineHeight()) / 2);
    }
}

} // namespace outpost::app
