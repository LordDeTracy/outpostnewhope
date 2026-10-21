#include "app/planet_window.hpp"

#include "data/pictures.hpp"
#include "data/terrain_gen.hpp"
#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cmath>

namespace outpost::app {

namespace {

const sim::Handle kPlayer1 = sim::Handle::make(sim::ObjType::Player, 1);
const sim::Handle kRebels = sim::Handle::make(sim::ObjType::Player, 2);
constexpr uint16_t kObserver = 0x88;          // orbital kind: Orbital Observer
constexpr int kFrames = 16;                   // the globe's frames, catalog 261..276
constexpr uint32_t kSpinMs = 700;
constexpr int kRowH = 22, kButtonH = 26;
enum Button { kGo = 1, kClose, kLeft, kRight };
constexpr Colour kMineInk{120, 214, 96}, kRebelInk{244, 84, 60}, kFreeInk{252, 226, 72};
constexpr float kPi = 3.14159265f;

std::string label(int id) {
    switch (id) {
        case kGo: return "View Site";
        case kClose: return "Close";
        case kLeft: return "<";
        default: return ">";
    }
}

} // namespace

bool sitesSurveyed(const sim::Simulation& sim) {
    if (sim.orbitalCount(kObserver) > 0) return true;
    for (const sim::Colony* c : sim.db().allOf<sim::Colony>(sim::ObjType::Colony)) {
        if (c->player != kPlayer1) continue;
        for (sim::Tile* t : sim.colonyTilesInGroup(*c, 4, false))
            if (const auto* w = sim.db().get<sim::WarehouseBuilding>(t->building);
                w && w->quantityOfA(sim::product::OrbitalObserver) > 0)
                return true;
    }
    return false;
}

bool siteVisible(const sim::Simulation& sim, sim::Handle site, sim::Handle landingSite) {
    if (site == landingSite) return true;
    for (const sim::Colony* c : sim.db().allOf<sim::Colony>(sim::ObjType::Colony))
        if (c->owner == site && c->player == kPlayer1) return true;
    return sitesSurveyed(sim);
}

PlanetWindow::PlanetWindow(sim::Simulation& sim, const data::BuildingPictures& pics, sim::Handle currentSite,
                           sim::Handle landingSite)
    : m_sim(sim), m_pics(pics), m_current(currentSite), m_landing(landingSite), m_selected(currentSite) {
    refresh();
    // Turn the globe so the current site faces the viewer.
    for (const Row& r : m_rows)
        if (r.site == m_current) m_frame = int(std::lround(r.lon / (360.0f / kFrames))) % kFrames;
}

void PlanetWindow::refresh() {
    m_rows.clear();
    const sim::Site* here = m_sim.db().get<sim::Site>(m_current);
    const sim::Planet* p = here ? m_sim.db().get<sim::Planet>(here->owner) : nullptr;
    if (!p) return;
    const auto& table = m_sim.data().sites;
    for (sim::Handle sh : p->children) {
        const sim::Site* s = m_sim.db().get<sim::Site>(sh);
        if (!s) continue;
        Row r;
        r.site = sh;
        r.name = s->name;
        r.visible = siteVisible(m_sim, sh, m_landing);
        std::vector<std::string> mine;
        for (const sim::Colony* c : m_sim.db().allOf<sim::Colony>(sim::ObjType::Colony)) {
            if (c->owner != sh) continue;
            if (c->player == kPlayer1) {
                r.mine = true;
                mine.push_back(c->name.empty() ? std::string("your colony") : c->name);
            } else if (c->player == kRebels) {
                r.rebels = true;
            }
        }
        if (!r.visible) r.status = "not surveyed";
        else if (r.mine) {
            r.status = mine.front();
            for (size_t i = 1; i < mine.size(); ++i) r.status += ", " + mine[i];
        } else if (r.rebels) r.status = "the rebels";
        else r.status = "unclaimed";
        const uint16_t idx = data::isGeneratedSite(s->rec00) ? uint16_t((s->rec00 & 0x7FFF) % 70) : s->rec00;
        if (idx < table.size()) {
            r.lon = float(table[idx].x);
            r.lat = float(table[idx].y);
        }
        m_rows.push_back(std::move(r));
    }
}

const PlanetWindow::Row* PlanetWindow::selectedRow() const {
    for (const Row& r : m_rows)
        if (r.site == m_selected) return &r;
    return nullptr;
}

void PlanetWindow::selectRow(int row) {
    if (row >= 0 && row < int(m_rows.size())) m_selected = m_rows[size_t(row)].site;
}

PlanetWindow::Result PlanetWindow::press(int id) {
    switch (id) {
        case kGo: {
            const Row* r = selectedRow();
            return r && r->visible && r->site != m_current ? Result::Go : Result::None;
        }
        case kClose: return Result::Close;
        case kLeft:
            m_spin = false;
            m_frame = (m_frame + kFrames - 1) % kFrames;
            return Result::None;
        case kRight:
            m_spin = false;
            m_frame = (m_frame + 1) % kFrames;
            return Result::None;
        default: return Result::None;
    }
}

void PlanetWindow::draw(Gfx& g, const SDL_Rect& screen, uint32_t nowMs) {
    if (m_spin && nowMs - m_lastSpin >= kSpinMs) {
        m_lastSpin = nowMs;
        m_frame = (m_frame + 1) % kFrames;
    }
    refresh();
    const sim::Site* here = m_sim.db().get<sim::Site>(m_current);
    const sim::Planet* p = here ? m_sim.db().get<sim::Planet>(here->owner) : nullptr;
    const int w = std::min(900, screen.w - 24), h = std::min(540, screen.h - 24);
    m_rect = {screen.x + (screen.w - w) / 2, screen.y + (screen.h - h) / 2, w, h};
    const SDL_Rect& r = m_rect;
    const std::string title = p ? "Planet: " + p->name : "Planet";
    g.fill({r.x + 5, r.y + 5, r.w, r.h}, Colour{0, 0, 0, 120});
    g.panel(r, true);
    g.titleBar({r.x + 3, r.y + 3, r.w - 6, 19}, g.headingWidth(title));
    g.heading(title, r.x + 10, r.y + 5, ui::kWindow);

    // Left: the globe with its sites.
    const int top = r.y + 32;
    m_globe = {r.x + 12, top, 320, 320};
    g.fill(m_globe, Colour{0, 0, 0});
    g.frame(m_globe, ui::kShadow);
    m_dots.clear();
    if (p) {
        if (auto c = m_pics.catalog(uint16_t(261 + m_frame)); c && c->kind == 2) {
            const std::string file = m_pics.planetSheet(p->nameId, c->rect.sheet);
            const float k = std::min((m_globe.w - 16.0f) / c->rect.w, (m_globe.h - 16.0f) / c->rect.h);
            const float gw = c->rect.w * k, gh = c->rect.h * k;
            const float gx = m_globe.x + (m_globe.w - gw) / 2, gy = m_globe.y + (m_globe.h - gh) / 2;
            if (!file.empty()) g.blit(file, SDL_Rect{c->rect.x, c->rect.y, c->rect.w, c->rect.h}, gx, gy, k);
            const float cx = gx + gw / 2, cy = gy + gh / 2, rad = std::min(gw, gh) / 2 * 0.94f;
            const float centre = m_frame * (360.0f / kFrames);
            for (const Row& row : m_rows) {
                if (!row.visible) continue;
                float lam = row.lon - centre;
                while (lam > 180) lam -= 360;
                while (lam <= -180) lam += 360;
                const float lr = lam * kPi / 180, pr = row.lat * kPi / 180;
                if (std::cos(lr) * std::cos(pr) < 0.08f) continue;            // on the far side
                const SDL_FPoint at{cx + rad * std::cos(pr) * std::sin(lr), cy - rad * std::sin(pr)};
                m_dots.push_back({at, row.site});
                const Colour ink = row.mine ? kMineInk : row.rebels ? kRebelInk : kFreeInk;
                const int s = row.site == m_selected ? 4 : 3;
                if (row.site == m_selected)
                    g.frame({int(at.x) - s - 3, int(at.y) - s - 3, 2 * s + 7, 2 * s + 7}, ui::kText);
                g.fill({int(at.x) - s, int(at.y) - s, 2 * s + 1, 2 * s + 1}, ink);
            }
        }
    }
    // Under the globe: turn it, and the legend.
    m_buttons.clear();
    int by = m_globe.y + m_globe.h + 8;
    for (int id : {kLeft, kRight}) {
        const SDL_Rect b{id == kLeft ? m_globe.x : m_globe.x + m_globe.w - 40, by, 40, kButtonH};
        g.button(b, m_hot == id ? Gfx::ButtonState::Hot : Gfx::ButtonState::Normal);
        const std::string t = label(id);
        g.text(t, b.x + (b.w - g.textWidth(t)) / 2, b.y + (b.h - g.lineHeight()) / 2);
        m_buttons.push_back({b, id});
    }
    int ly = by + 2;
    for (auto [ink, text] : {std::pair{kMineInk, "your colony"}, std::pair{kRebelInk, "the rebels"},
                             std::pair{kFreeInk, "unclaimed site"}}) {
        g.fill({m_globe.x + 56, ly + 4, 9, 9}, ink);
        g.text(text, m_globe.x + 70, ly, ui::kText);
        ly += g.lineHeight();
    }
    if (!sitesSurveyed(m_sim))
        for (const std::string& line : {std::string("Only your own sites are known."),
                                        std::string("An Orbital Observer in orbit would"),
                                        std::string("survey the planet's other sites.")}) {
            g.text(line, m_globe.x, ly + 4, ui::kShadow);
            ly += g.lineHeight();
        }

    // Middle: the sites.
    m_list = {m_globe.x + m_globe.w + 12, top, 230, r.y + r.h - 14 - top};
    g.fill(m_list, ui::kWindow);
    g.frame(m_list, ui::kShadow);
    const int visibleRows = (m_list.h - 8) / kRowH;
    m_scroll = std::clamp(m_scroll, 0, std::max(0, int(m_rows.size()) - visibleRows));
    SDL_RenderSetClipRect(g.renderer(), &m_list);
    int y = m_list.y + 4;
    for (size_t i = size_t(m_scroll); i < m_rows.size() && y + kRowH <= m_list.y + m_list.h; ++i, y += kRowH) {
        const Row& row = m_rows[i];
        const bool sel = row.site == m_selected;
        if (sel) g.fill({m_list.x + 2, y, m_list.w - 4, kRowH}, ui::kHighlight);
        const Colour ink = !row.visible ? ui::kShadow : row.mine ? kMineInk : row.rebels ? kRebelInk : ui::kText;
        g.text(row.name + (row.site == m_current ? " (shown)" : ""), m_list.x + 8, y + 3,
               sel ? ui::kHighlightText : ink);
    }
    SDL_RenderSetClipRect(g.renderer(), nullptr);

    // Right: the selected site.
    m_info = {m_list.x + m_list.w + 12, top, r.x + r.w - 12 - (m_list.x + m_list.w + 12), r.y + r.h - 14 - top};
    g.fill(m_info, ui::kWindow);
    g.frame(m_info, ui::kShadow);
    const Row* row = selectedRow();
    const sim::Site* s = row ? m_sim.db().get<sim::Site>(row->site) : nullptr;
    int iy = m_info.y + 8;
    const int ix = m_info.x + 10;
    if (row && s) {
        g.heading(row->name, ix, iy, ui::kTitleText);
        iy += g.lineHeight() + 8;
        g.text(row->visible ? "Holds: " + row->status : "Not surveyed yet.", ix, iy, ui::kText);
        iy += g.lineHeight() + 4;
        if (row->visible) {
            const int beacons = std::min<int>(s->visibleMines, int(s->mineSites.size()));
            g.text("Mining beacons: " + std::to_string(beacons) + "   Map: " + std::to_string(s->mapSize.x) + " x " +
                       std::to_string(s->mapSize.y),
                   ix, iy, ui::kText);
            iy += g.lineHeight() + 6;
            const uint16_t idx = data::isGeneratedSite(s->rec00) ? uint16_t((s->rec00 & 0x7FFF) % 70) : s->rec00;
            if (auto c = m_pics.catalog(uint16_t(277 + idx)); c && c->kind == 1)
                if (SDL_Texture* tex = g.bitmap(c->file, false)) {
                    int tw = 0, th = 0;
                    SDL_QueryTexture(tex, nullptr, nullptr, &tw, &th);
                    const float k = std::min((m_info.w - 20.0f) / std::max(1, tw), 150.0f / std::max(1, th));
                    const SDL_Rect dst{ix, iy, int(tw * k), int(th * k)};
                    SDL_RenderCopy(g.renderer(), tex, nullptr, &dst);
                    iy += dst.h + 8;
                }
            const SDL_Rect area{ix, iy, m_info.w - 20, std::max(60, m_info.y + m_info.h - 50 - iy)};
            m_siteMap.draw(g.renderer(), m_sim, row->site, 0, area, 0);
            iy = area.y + area.h + 6;
            if (!row->mine && !row->rebels)
                g.text("Put a Command Center down here to found a colony.", ix, iy, kFreeInk);
        } else {
            for (const std::string& line : {std::string("An Orbital Observer in orbit would"),
                                            std::string("show what lies here.")}) {
                g.text(line, ix, iy, ui::kShadow);
                iy += g.lineHeight();
            }
        }
    }
    // The buttons, bottom right.
    int bx = m_info.x + m_info.w - 10;
    for (int id : {kClose, kGo}) {
        const std::string t = label(id);
        const int bw = g.textWidth(t) + 30;
        bx -= bw;
        const SDL_Rect b{bx, m_info.y + m_info.h - kButtonH - 8, bw, kButtonH};
        bx -= 8;
        const bool off = id == kGo && (!row || !row->visible || row->site == m_current);
        g.button(b, !off && m_hot == id ? Gfx::ButtonState::Hot : Gfx::ButtonState::Normal);
        g.text(t, b.x + (b.w - g.textWidth(t)) / 2, b.y + (b.h - g.lineHeight()) / 2, off ? ui::kShadow : ui::kText);
        m_buttons.push_back({b, off ? -id : id});
    }
}

PlanetWindow::Result PlanetWindow::handle(const SDL_Event& e) {
    switch (e.type) {
        case SDL_MOUSEMOTION: {
            const SDL_Point pt{e.motion.x, e.motion.y};
            m_hot = -1;
            for (const auto& [b, id] : m_buttons)
                if (id > 0 && SDL_PointInRect(&pt, &b)) m_hot = id;
            return Result::None;
        }
        case SDL_MOUSEWHEEL:
            m_scroll -= e.wheel.y;
            return Result::None;
        case SDL_MOUSEBUTTONDOWN: {
            if (e.button.button != SDL_BUTTON_LEFT) return Result::None;
            const SDL_Point pt{e.button.x, e.button.y};
            for (const auto& [b, id] : m_buttons)
                if (SDL_PointInRect(&pt, &b)) return id > 0 ? press(id) : Result::None;
            const uint32_t now = SDL_GetTicks();
            int row = -1;
            if (SDL_PointInRect(&pt, &m_list)) {
                const int i = (pt.y - m_list.y - 4) / kRowH + m_scroll;
                if (i >= 0 && i < int(m_rows.size())) row = i;
            } else if (SDL_PointInRect(&pt, &m_globe)) {
                float best = 12 * 12;
                for (const auto& [at, site] : m_dots) {
                    const float dx = at.x - pt.x, dy = at.y - pt.y;
                    if (dx * dx + dy * dy < best) {
                        best = dx * dx + dy * dy;
                        for (size_t k = 0; k < m_rows.size(); ++k)
                            if (m_rows[k].site == site) row = int(k);
                    }
                }
            }
            if (row < 0) return Result::None;
            const bool twice = row == m_lastRow && now - m_lastClick < 400;
            m_lastRow = row;
            m_lastClick = now;
            m_selected = m_rows[size_t(row)].site;
            return twice ? press(kGo) : Result::None;
        }
        case SDL_KEYDOWN:
            switch (e.key.keysym.sym) {
                case SDLK_ESCAPE: case SDLK_g: return Result::Close;
                case SDLK_RETURN: case SDLK_KP_ENTER: return press(kGo);
                case SDLK_LEFT: return press(kLeft);
                case SDLK_RIGHT: return press(kRight);
                case SDLK_UP: case SDLK_DOWN: {
                    int i = 0;
                    for (size_t k = 0; k < m_rows.size(); ++k)
                        if (m_rows[k].site == m_selected) i = int(k);
                    i = std::clamp(i + (e.key.keysym.sym == SDLK_UP ? -1 : 1), 0, std::max(0, int(m_rows.size()) - 1));
                    selectRow(i);
                    return Result::None;
                }
                default: return Result::None;
            }
        default:
            return Result::None;
    }
}

} // namespace outpost::app
