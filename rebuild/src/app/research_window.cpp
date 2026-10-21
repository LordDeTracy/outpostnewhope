#include "app/research_window.hpp"

#include "app/research_text.hpp"
#include "data/research_tree.hpp"
#include "sim/building.hpp"
#include "sim/research.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <tuple>

namespace outpost::app {

namespace {

constexpr Colour kDoneInk{120, 214, 96}, kCurrentInk{252, 226, 72}, kHotInk{244, 84, 60};
constexpr int kRowH = 22, kButtonH = 26;
constexpr uint32_t kDoubleClickMs = 400;
enum Button { kStudy = 1, kOpen, kUp, kTop, kDiscoveries, kClose };
constexpr int kHotLabGroup = 17;
const sim::Handle kPlayer1 = sim::Handle::make(sim::ObjType::Player, 1);
const sim::Handle kColony1 = sim::Handle::make(sim::ObjType::Colony, 1);

// Text wrapped to a width; '\n' starts a new line.
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
        if (c == ' ') {
            flush();
        } else if (c == '\n') {
            flush();
            lines.push_back(line);
            line.clear();
        } else {
            word += c;
        }
    }
    flush();
    if (!line.empty()) lines.push_back(line);
    return lines;
}

std::string joinNames(const std::vector<std::string>& names) {
    std::string s;
    for (size_t i = 0; i < names.size(); ++i) {
        if (i) s += i + 1 == names.size() ? " and " : ", ";
        s += names[i];
    }
    return s;
}

const char* buttonLabel(int id) {
    switch (id) {
        case kStudy: return "Study";
        case kOpen: return "Open";
        case kUp: return "Up a Level";
        case kTop: return "Top";
        case kDiscoveries: return "Discoveries";
        default: return "Close";
    }
}

} // namespace

ResearchWindow::ResearchWindow(sim::Simulation& sim, sim::Handle labTile, std::string title, Legend legend)
    : m_sim(sim), m_labTile(labTile), m_title(std::move(title)), m_legend(std::move(legend)) {
    refresh();
    // Open at the level of the lab's topic, with it selected.
    if (const sim::LabBuilding* l = lab())
        if (const auto* t = m_sim.data().research.find(l->topic); t && shown(*t) && t->cost) {
            m_level = std::max(0, displayParent(*t));
            m_selected = t->id;
        }
    refresh();
}

sim::LabBuilding* ResearchWindow::lab() const {
    const sim::Tile* t = m_sim.db().get<sim::Tile>(m_labTile);
    return t ? dynamic_cast<sim::LabBuilding*>(m_sim.db().get<sim::Building>(t->building)) : nullptr;
}

const sim::Player* ResearchWindow::player() const {
    const sim::Tile* t = m_sim.db().get<sim::Tile>(m_labTile);
    return t ? m_sim.playerOf(m_sim.db().get<sim::Colony>(t->colony)) : nullptr;
}

bool ResearchWindow::hotLab() const {
    const sim::LabBuilding* l = lab();
    return l && m_sim.data().groups.contains(kHotLabGroup, l->type);
}

bool ResearchWindow::hasHotLab() const {
    if (hotLab()) return true;
    const sim::Player* me = player();
    for (const sim::Building* b : m_sim.db().allOf<sim::Building>(sim::ObjType::Building))
        if (m_sim.data().groups.contains(kHotLabGroup, b->type) &&
            (b->state == sim::Building::kOperational || b->state == sim::Building::kSuspended) &&
            m_sim.playerOf(b->colony(m_sim)) == me)
            return true;
    return false;
}

// The tree as the manual draws it (OUTP_GB.PDF p. 103-105): the hot-lab
// tree's Genetics, Nanotechnology 1 and Nanotechnology 2 under Medicine,
// Artificial Intelligence and Quantum Mechanics, the topics their hot-lab
// roots wait for (s2:EEAC).
int ResearchWindow::displayParent(const data::ResearchTopic& t) const {
    switch (t.id) {
        case 116: return 9;
        case 120: return 46;
        case 122: return 91;
        default: return t.parent;
    }
}

bool ResearchWindow::shown(const data::ResearchTopic& t) const {
    switch (t.id) {
        case 0: case 112: case 113: case 114: case 115: case 119: case 121: return false;   // roots, None, Pause
        default: break;
    }
    return !t.advanced || m_hotLabBuilt;
}

bool ResearchWindow::done(int topic) const {
    const sim::Player* p = player();
    return p && p->researchDone(topic);
}

// s3:32F4 lists a topic's subtopics only once it opens (s3:9488, s2:EEAC).
bool ResearchWindow::unlocked(const data::ResearchTopic& t) const {
    const sim::Player* p = player();
    return t.parent < 0 || (p && sim::topicOpens(*p, uint16_t(t.parent)));
}

bool ResearchWindow::studiedElsewhere(uint16_t topic) const {
    const sim::Player* me = player();
    const sim::LabBuilding* mine = lab();
    for (sim::Building* b : m_sim.db().allOf<sim::Building>(sim::ObjType::Building)) {
        const auto* l = dynamic_cast<const sim::LabBuilding*>(b);
        if (!l || l == mine || l->topic != topic) continue;
        if (l->state != sim::Building::kOperational && l->state != sim::Building::kSuspended) continue;
        if (m_sim.playerOf(l->colony(m_sim)) == me) return true;
    }
    return false;
}

ResearchWindow::State ResearchWindow::stateOf(const data::ResearchTopic& t) const {
    if (done(t.id)) return State::Done;
    const sim::LabBuilding* l = lab();
    if ((l && l->topic == t.id) || studiedElsewhere(t.id)) return State::Current;
    if (!unlocked(t)) return State::Locked;
    return t.advanced ? State::Hot : State::Open;
}

bool ResearchWindow::canStudy(uint16_t topic) const {
    const auto* t = m_sim.data().research.find(topic);
    return t && lab() && t->cost && shown(*t) && unlocked(*t) && !done(topic) && t->advanced == hotLab();
}

std::string ResearchWindow::whyNot(uint16_t topic) const {
    const auto* t = m_sim.data().research.find(topic);
    if (!t) return {};
    if (t->cost == 0) return "A field of study: open it to see its topics.";
    if (done(topic)) return "Already researched.";
    if (!unlocked(*t)) {
        std::vector<std::string> missing;
        for (uint16_t n : sim::topicOpensNeeds(uint16_t(t->parent)))
            if (!done(n)) missing.push_back(name(n));
        return "Locked: research " + joinNames(missing) + " first.";
    }
    if (t->advanced && !hotLab()) return "Dangerous research: only a Hot Laboratory can study it.";
    if (!t->advanced && hotLab()) return "A Hot Laboratory studies only the dangerous topics.";
    return {};
}

const std::vector<uint16_t>& ResearchWindow::childrenOf(int level) const {
    static const std::vector<uint16_t> kNone;
    return level >= 0 && size_t(level) < m_children.size() ? m_children[size_t(level)] : kNone;
}

bool ResearchWindow::hotBelow(int topic) const {
    for (uint16_t c : childrenOf(topic)) {
        const auto* t = m_sim.data().research.find(c);
        if (t && t->advanced && unlocked(*t) && !done(c)) return true;
        if (hotBelow(c)) return true;
    }
    return false;
}

// s7:2852's bands, as an average over three turns (colony 1's morale for
// every player, quirk Q29).
double ResearchWindow::pointsPerTurn() const {
    const sim::Colony* c = m_sim.db().get<sim::Colony>(kColony1);
    const int m = c ? c->morale : 600;
    if (m < 250) return 0.5;
    if (m < 450) return 2.0 / 3.0;
    if (m < 550) return 1.0;
    if (m < 750) return 4.0 / 3.0;
    return 2.0;
}

std::string ResearchWindow::name(int topic) const {
    const auto* t = topic >= 0 ? m_sim.data().research.find(uint16_t(topic)) : nullptr;
    return t ? t->name : std::string{};
}

void ResearchWindow::refresh() {
    m_hotLabBuilt = hasHotLab();
    m_children.assign(std::tuple_size_v<decltype(sim::Player::remaining)>, {});
    for (const auto& t : m_sim.data().research.topics())
        if (const int dp = displayParent(t); dp >= 0 && size_t(dp) < m_children.size() && shown(t))
            m_children[size_t(dp)].push_back(t.id);
    m_rows.clear();
    for (uint16_t id : childrenOf(m_level))
        if (const auto* t = m_sim.data().research.find(id))
            m_rows.push_back({id, stateOf(*t), !childrenOf(id).empty()});
}

void ResearchWindow::open(int level) {
    m_level = level;
    m_scroll = 0;
    m_discoveries = false;
    refresh();
    m_selected = m_rows.empty() ? -1 : m_rows.front().topic;
}

void ResearchWindow::study() {
    if (m_selected < 0 || !canStudy(uint16_t(m_selected))) return;
    sim::setLabTopic(m_sim, *lab(), uint16_t(m_selected));     // s3:A5EC
}

void ResearchWindow::draw(Gfx& g, const SDL_Rect& screen) {
    refresh();
    const int w = std::min(940, screen.w - 24), h = std::min(580, screen.h - 24);
    m_rect = {screen.x + (screen.w - w) / 2, screen.y + (screen.h - h) / 2, w, h};
    const SDL_Rect& r = m_rect;
    g.fill({r.x + 5, r.y + 5, r.w, r.h}, Colour{0, 0, 0, 120});
    g.panel(r, true);
    g.titleBar({r.x + 3, r.y + 3, r.w - 6, 19}, g.headingWidth(m_title));
    g.heading(m_title, r.x + 10, r.y + 5, ui::kWindow);

    // Left: the buttons, the legend and the lab's state.
    const int left = 190, top = r.y + 32;
    m_buttons.clear();
    int by = top;
    for (int id : {kStudy, kOpen, kUp, kTop, kDiscoveries, kClose}) {
        const SDL_Rect b{r.x + 12, by, left - 24, kButtonH};
        bool off = false;
        if (id == kStudy) off = m_selected < 0 || !canStudy(uint16_t(m_selected));
        if (id == kOpen) off = m_selected < 0 || childrenOf(m_selected).empty();
        if (id == kUp || id == kTop) off = m_level == 0;
        g.button(b, off ? Gfx::ButtonState::Normal
                        : (m_hotButton == id ? Gfx::ButtonState::Hot : Gfx::ButtonState::Normal));
        const std::string label = id == kDiscoveries && m_discoveries ? "Topics" : buttonLabel(id);
        g.text(label, b.x + (b.w - g.textWidth(label)) / 2, b.y + (b.h - g.lineHeight()) / 2,
               off ? ui::kShadow : ui::kText);
        m_buttons.push_back({b, off ? -id : id});
        by += kButtonH + 6;
    }
    by += 8;
    g.text("Color Legend", r.x + 12, by, ui::kGold);
    by += g.lineHeight() + 2;
    const std::pair<Colour, std::string> legend[] = {
        {ui::kText, m_legend.notResearched}, {kDoneInk, m_legend.completed}, {kCurrentInk, m_legend.current},
        {kHotInk, m_legend.hotLab}, {ui::kShadow, "Locked (research its parent first)"}};
    for (const auto& [ink, text] : legend) {
        g.fill({r.x + 14, by + 4, 10, 10}, ink);
        for (const auto& line : wrap(g, text, left - 50)) {
            g.text(line, r.x + 30, by, ink);
            by += g.lineHeight();
        }
        by += 2;
    }
    by += 8;
    if (const sim::LabBuilding* l = lab()) {
        const auto* t = m_sim.data().research.find(l->topic);
        std::string current = t && t->cost ? t->name : "None";
        if (l->state != sim::Building::kOperational) current += " (idle)";
        for (const auto& line : wrap(g, "This lab: " + current, left - 24)) {
            g.text(line, r.x + 12, by, ui::kText);
            by += g.lineHeight();
        }
        char buf[64];
        std::snprintf(buf, sizeof buf, "About %.1f points per lab turn at this morale.", pointsPerTurn());
        for (const auto& line : wrap(g, buf, left - 24)) {
            g.text(line, r.x + 12, by, ui::kShadow);
            by += g.lineHeight();
        }
    }

    // Middle: where in the tree, and the level's topics.
    const int mid = (r.w - left - 30) * 9 / 20;
    std::vector<std::string> path;
    for (int t = m_level; t > 0;) {
        path.insert(path.begin(), name(t));
        const auto* x = m_sim.data().research.find(uint16_t(t));
        t = x ? displayParent(*x) : -1;
    }
    std::string crumb = "Top";
    for (const auto& p : path) crumb += " > " + p;
    while (g.textWidth(crumb) > mid && crumb.size() > 4) crumb = "..." + crumb.substr(4);
    g.text(crumb, r.x + left, top, ui::kGold);
    m_list = {r.x + left, top + g.lineHeight() + 6, mid, r.y + r.h - 14 - (top + g.lineHeight() + 6)};
    g.fill(m_list, ui::kWindow);
    g.frame(m_list, ui::kShadow);
    const int visible = (m_list.h - 8) / kRowH;
    m_scroll = std::clamp(m_scroll, 0, std::max(0, int(m_rows.size()) - visible));
    SDL_RenderSetClipRect(g.renderer(), &m_list);
    int y = m_list.y + 4;
    for (size_t i = size_t(m_scroll); i < m_rows.size() && y + kRowH <= m_list.y + m_list.h; ++i, y += kRowH) {
        const Row& row = m_rows[i];
        const auto* t = m_sim.data().research.find(row.topic);
        if (!t) continue;
        Colour ink = ui::kText;
        switch (row.state) {
            case State::Done: ink = kDoneInk; break;
            case State::Current: ink = kCurrentInk; break;
            case State::Hot: ink = kHotInk; break;
            case State::Locked: ink = ui::kShadow; break;
            case State::Open: break;
        }
        const bool sel = int(row.topic) == m_selected;
        if (sel) g.fill({m_list.x + 2, y, m_list.w - 4, kRowH}, ui::kHighlight);
        g.fill({m_list.x + 8, y + 6, 10, 10}, ink);
        g.frame({m_list.x + 8, y + 6, 10, 10}, ui::kDark);
        const Colour text = sel ? ui::kHighlightText : ink;
        g.text(t->name, m_list.x + 24, y + (kRowH - g.lineHeight()) / 2, text);
        std::string tag;
        if (row.state == State::Done) tag = "done";
        else if (row.state == State::Locked) tag = "locked";
        else if (t->cost) tag = std::to_string(t->cost) + " pts";
        if (row.children) tag += row.children && hotBelow(row.topic) ? "  *>" : "  >";
        g.text(tag, m_list.x + m_list.w - 10 - g.textWidth(tag), y + (kRowH - g.lineHeight()) / 2,
               sel ? ui::kHighlightText : ui::kShadow);
    }
    if (m_rows.empty()) g.text("(nothing here)", m_list.x + 10, m_list.y + 6, ui::kShadow);
    SDL_RenderSetClipRect(g.renderer(), nullptr);

    // Right: the selected topic, or the discoveries made.
    m_info = {m_list.x + m_list.w + 12, top, r.x + r.w - 12 - (m_list.x + m_list.w + 12), r.y + r.h - 14 - top};
    g.fill(m_info, ui::kWindow);
    g.frame(m_info, ui::kShadow);
    SDL_RenderSetClipRect(g.renderer(), &m_info);
    if (m_discoveries) drawDiscoveries(g);
    else drawInfo(g);
    SDL_RenderSetClipRect(g.renderer(), nullptr);
}

void ResearchWindow::drawInfo(Gfx& g) {
    const int x = m_info.x + 10, width = m_info.w - 20;
    int y = m_info.y + 8;
    auto para = [&](const std::string& text, Colour ink) {
        for (const auto& line : wrap(g, text, width)) {
            g.text(line, x, y, ink);
            y += g.lineHeight();
        }
        y += 6;
    };
    const int id = m_selected >= 0 ? m_selected : m_level;
    const auto* t = id > 0 ? m_sim.data().research.find(uint16_t(id)) : nullptr;
    if (!t) {
        para("The research tree.", ui::kGold);
        para("Choose a field to see the topics in it. A topic can be studied once the topic above it is "
             "researched; dangerous topics need a Hot Laboratory and show only once one is built.",
             ui::kText);
        return;
    }
    g.heading(t->name, x, y, ui::kTitleText);
    y += g.lineHeight() + 10;

    const sim::Player* p = player();
    const State s = stateOf(*t);
    std::string status;
    Colour ink = ui::kText;
    if (t->cost == 0) {
        status = "A field of study: open it to see its topics.";
        ink = kDoneInk;
    } else {
        switch (s) {
            case State::Done: status = "Researched."; ink = kDoneInk; break;
            case State::Current:
                if (lab() && lab()->topic == t->id)
                    status = lab()->state == sim::Building::kOperational
                                 ? "Being studied in this lab."
                                 : "Chosen for this lab, but the lab is idle (see its window): no progress.";
                else
                    status = "Being studied in another lab.";
                ink = kCurrentInk;
                break;
            case State::Locked: status = whyNot(t->id); ink = ui::kShadow; break;
            case State::Hot:
                status = hotLab() ? "Dangerous research, ready to study here." : whyNot(t->id);
                ink = kHotInk;
                break;
            case State::Open: status = hotLab() ? whyNot(t->id) : "Ready to study."; break;
        }
        if (t->id == 1) status += " It can be studied again and again.";
    }
    para(status, ink);

    if (t->cost && p && t->id < p->remaining.size() && s != State::Done) {
        const int left = p->remaining[t->id] < 0 ? t->cost : p->remaining[t->id];
        const int turns = p->minTurns[t->id];
        const int estimate = std::max(turns, int(std::ceil(left / pointsPerTurn())));
        char buf[160];
        if (p->remaining[t->id] < 0)
            std::snprintf(buf, sizeof buf, "Cost: %d points, and at least %d lab turns. About %d turns at this morale.",
                          int(t->cost), turns, estimate);
        else
            std::snprintf(buf, sizeof buf, "Left: %d of %d points, and at least %d more lab turns. About %d turns at this morale.",
                          left, int(t->cost), turns, estimate);
        para(buf, ui::kText);
    }
    if (t->parent >= 0) {
        std::vector<std::string> needs;
        for (uint16_t n : sim::topicOpensNeeds(uint16_t(t->parent)))
            if (const auto* need = m_sim.data().research.find(n); need && need->cost)
                needs.push_back(need->name + (done(n) ? " (done)" : ""));
        if (!needs.empty()) para("Requires: " + joinNames(needs), ui::kText);
    }
    if (const auto kids = childrenOf(t->id); !kids.empty()) {
        std::vector<std::string> names;
        for (uint16_t k : kids) names.push_back(name(k));
        para("Leads to: " + joinNames(names), ui::kText);
    }
    if (const char* blurb = topicBlurb(t->id)) para(blurb, ui::kText);
    if (const char* effect = topicEffect(t->id)) para(std::string("Effect: ") + effect, kDoneInk);

    // The discoveries it grants (s3:6CF8), some only with other topics.
    const sim::Player* p1 = m_sim.db().get<sim::Player>(kPlayer1);
    std::vector<uint16_t> listed;
    bool header = false;
    for (const auto& gr : sim::topicGrants(t->id)) {
        if (gr.discovery == 1) continue;                 // Basic Research: the effect above
        if (std::find(listed.begin(), listed.end(), gr.discovery) != listed.end()) continue;
        listed.push_back(gr.discovery);
        if (!header) {
            para("Discoveries:", ui::kGold);
            y -= 6;
            header = true;
        }
        std::string line = "- " + m_sim.data().strings.get(uint16_t(1636 + gr.discovery));
        if (const char* e = discoveryEffect(gr.discovery)) line += std::string(": ") + e;
        std::vector<std::string> also;
        for (uint16_t n : gr.needs)
            if (n != t->id && !done(n)) also.push_back(name(n));
        if (!also.empty()) line += " (once " + joinNames(also) + (also.size() > 1 ? " are" : " is") + " done too)";
        if (p1 && gr.discovery < p1->discoveries.size() && p1->discoveries[gr.discovery] > 0) line += " - made";
        para(line, ui::kText);
        y -= 4;
    }
    if (victoryTopic(t->id)) {
        y += 6;
        para("Needed for the starship: with all seven such topics, a Mass Driver and a SpacePort, the colony "
             "can leave.", ui::kGold);
    }
}

void ResearchWindow::drawDiscoveries(Gfx& g) {
    const int x = m_info.x + 10, width = m_info.w - 20;
    int y = m_info.y + 8;
    g.heading("Research Discoveries", x, y, ui::kTitleText);     // dialog 4038's caption
    y += g.lineHeight() + 10;
    const sim::Player* p1 = m_sim.db().get<sim::Player>(kPlayer1);
    bool any = false;
    for (uint16_t d = 2; p1 && d < p1->discoveries.size(); ++d) {
        if (p1->discoveries[d] <= 0) continue;
        any = true;
        std::string line = m_sim.data().strings.get(uint16_t(1636 + d));
        if (p1->discoveries[d] > 1) line += " (x" + std::to_string(p1->discoveries[d]) + ")";
        if (const char* e = discoveryEffect(d)) line += std::string(": ") + e;
        for (const auto& l : wrap(g, line, width)) {
            g.text(l, x, y, ui::kText);
            y += g.lineHeight();
        }
        y += 3;
    }
    if (!any) g.text("No discoveries yet.", x, y, ui::kShadow);
}

void ResearchWindow::selectRow(int row) {
    refresh();
    if (row >= 0 && row < int(m_rows.size())) {
        m_selected = m_rows[size_t(row)].topic;
        m_discoveries = false;
    }
}

ResearchWindow::Result ResearchWindow::press(int id) {
    switch (id) {
        case kStudy:
            if (m_selected >= 0 && canStudy(uint16_t(m_selected))) {
                study();
                return Result::Studied;
            }
            return Result::None;
        case kOpen:
            if (m_selected >= 0 && !childrenOf(m_selected).empty()) open(m_selected);
            return Result::None;
        case kUp:
            if (m_level > 0) {
                const int from = m_level;
                const auto* t = m_sim.data().research.find(uint16_t(m_level));
                open(t ? std::max(0, displayParent(*t)) : 0);
                m_selected = from;
            }
            return Result::None;
        case kTop:
            open(0);
            return Result::None;
        case kDiscoveries:
            m_discoveries = !m_discoveries;
            return Result::None;
        case kClose:
            return Result::Close;
        default:
            return Result::None;
    }
}

ResearchWindow::Result ResearchWindow::handle(const SDL_Event& e) {
    auto rowIndex = [&](int i) {
        for (size_t k = 0; k < m_rows.size(); ++k)
            if (int(m_rows[k].topic) == m_selected) return int(k) + i;
        return 0;
    };
    switch (e.type) {
        case SDL_MOUSEMOTION: {
            const SDL_Point pt{e.motion.x, e.motion.y};
            m_hotButton = -1;
            for (const auto& [r, id] : m_buttons)
                if (id > 0 && SDL_PointInRect(&pt, &r)) m_hotButton = id;
            return Result::None;
        }
        case SDL_MOUSEWHEEL:
            m_scroll -= e.wheel.y;
            return Result::None;
        case SDL_MOUSEBUTTONDOWN: {
            if (e.button.button != SDL_BUTTON_LEFT) return Result::None;
            const SDL_Point pt{e.button.x, e.button.y};
            for (const auto& [r, id] : m_buttons)
                if (SDL_PointInRect(&pt, &r)) return id > 0 ? press(id) : Result::None;
            if (SDL_PointInRect(&pt, &m_list)) {
                const int i = (pt.y - m_list.y - 4) / kRowH + m_scroll;
                if (i < 0 || i >= int(m_rows.size())) return Result::None;
                const Row row = m_rows[size_t(i)];
                const uint32_t now = SDL_GetTicks();
                const bool twice = i == m_lastRow && now - m_lastClick < kDoubleClickMs;
                m_lastRow = i;
                m_lastClick = now;
                m_selected = row.topic;
                m_discoveries = false;
                // A double click (or a click on the arrow) opens a field; a
                // double click on a topic studies it.
                if (row.children && (twice || pt.x > m_list.x + m_list.w - 40)) open(row.topic);
                else if (twice && canStudy(row.topic)) return press(kStudy);
            }
            return Result::None;
        }
        case SDL_KEYDOWN:
            switch (e.key.keysym.sym) {
                case SDLK_ESCAPE: return Result::Close;
                case SDLK_BACKSPACE: case SDLK_LEFT: return press(kUp);
                case SDLK_RIGHT: return press(kOpen);
                case SDLK_RETURN: case SDLK_KP_ENTER:
                    if (m_selected >= 0 && canStudy(uint16_t(m_selected))) return press(kStudy);
                    return press(kOpen);
                case SDLK_UP: case SDLK_DOWN: {
                    if (m_rows.empty()) return Result::None;
                    const int i = std::clamp(rowIndex(e.key.keysym.sym == SDLK_UP ? -1 : 1), 0, int(m_rows.size()) - 1);
                    m_selected = m_rows[size_t(i)].topic;
                    const int visible = (m_list.h - 8) / kRowH;
                    if (i < m_scroll) m_scroll = i;
                    if (visible > 0 && i >= m_scroll + visible) m_scroll = i - visible + 1;
                    return Result::None;
                }
                default: return Result::None;
            }
        default:
            return Result::None;
    }
}

} // namespace outpost::app
