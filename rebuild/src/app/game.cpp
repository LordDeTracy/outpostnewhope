#include "app/game.hpp"
#include "app/hd_sprites.hpp"

#include "sim/rebel_ai_improved.hpp"

#include "data/building_names.hpp"
#include "data/dialog_template.hpp"
#include "sim/building.hpp"
#include "sim/ops_writer.hpp"
#include "sim/units.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <fstream>

namespace outpost::app {

namespace {

const sim::Handle kColony1 = sim::Handle::make(sim::ObjType::Colony, 1);

// OPPOPMENU command ids (resources.txt "MENUS").
enum Command : int {
    kSave = 101, kSaveAs = 102, kExit = 103, kRunTurn = 104, kSurface = 105, kLevel4 = 109,
    kPreferences = 110, kHelp = 111, kAbout = 112, kDocument = 113, kArrange = 120, kRunTurns = 305,
    kClose = 302, kMinimize = 300,
};
// The rebuild's Reports menu (IMPROVISED, I39: the original opens its
// reports from the icon bar's windows, which are not decoded).
enum Report : int {
    kRepExecutive = 9001, kRepPopulation, kRepTotals, kRepDiscoveries, kRepShip, kRepLog, kRepMainMenu,
    kRepPlanet,                                   // IMPROVED (I110): the planet window
    kRepMorale,                                   // IMPROVED (I116): what moves morale
};

// Dialog template ids.
constexpr uint16_t kDlgAbout = 4026, kDlgTurns = 4023, kDlgPreferences = 4027, kDlgPopulation = 4037,
                   kDlgExecutive = 4002, kDlgTransit = 6213, kDlgTrucks = 6220, kDlgTotals = 4020,
                   kDlgDiscoveries = 4038, kDlgName = 4025, kDlgFactory = 4001, kDlgLab = 4003, kDlgMine = 4004,
                   kDlgWarehouse = 4036, kDlgTank = 4033, kDlgConstruction = 4056, kDlgStructure = 4022,
                   kDlgRobotCmd = 497, kDlgPolice = 448, kDlgTerraform = 343;
// TILEMENU command ids.
enum TileCommand : int { kDescribe = 118, kTileHelp = 119, kTransfer = 512, kRouting = 513, kAssignTrucks = 514 };
// Transit Information / Assign Trucks control ids.
constexpr uint16_t kTitle = 6214, kRouteList = 6215, kDeleteRoute = 6216, kDeleteLeg = 6217, kAddLeg = 6218,
                   kTrucksButton = 6219, kAssigned = 6221, kSpin = 6222, kAvailable = 6223, kDlgHelp = 6209;
// Select Dig Direction (4024, proc s8:C89C/s8:C95E): radios Down..West give
// +0x24 1..5, Self-Destruct (4046) is 6, "fill in".
constexpr uint16_t kDlgDig = 4024, kDigDown = 4012, kDigWest = 4016, kDigFill = 4046;
constexpr uint16_t kProductBRow = 0x8000;      // I96: a factory list row of the second (product B) list
constexpr uint16_t kResources = 6104, kMore = 6105, kTopicButton = 6032, kBenevolent = 449, kHostile = 450;
// IMPROVED (I99): the trade window (the rebuild's own).
constexpr uint16_t kDlgInterview = 459, kFirstAnswer = 461;   // Editor Interview (s8:CB5C)
constexpr uint16_t kDlgTrade = 9500, kTradeStatus = 9501, kTradeOffer = 9502, kTradeInfo = 9503,
                   kTradeAccept = 9510, kTradeDecline = 9511, kTradePropose = 9512, kGiveRes = 9520,
                   kGiveAmount = 9521, kGetRes = 9522, kGetAmount = 9523;
constexpr int32_t kTradeAmounts[] = {10, 20, 50, 100, 200};

std::string fmt(long v) { return std::to_string(v); }

// The resource table of the building windows: names 6040..6049 and
// 6050..6056, 6080..6082; values 6083..6102 (ids 17..36, 20 rows).
constexpr uint16_t kResName[20] = {6040, 6041, 6042, 6043, 6044, 6045, 6046, 6047, 6048, 6049,
                                   6050, 6051, 6052, 6053, 6054, 6055, 6056, 6080, 6081, 6082};
constexpr uint16_t kResValue[20] = {6083, 6084, 6085, 6086, 6087, 6088, 6089, 6090, 6091, 6092,
                                    6093, 6094, 6095, 6096, 6097, 6098, 6099, 6100, 6101, 6102};
// Colony Totals: two columns of 20 {name, value}.
constexpr uint16_t kTotName[40] = {6040, 6041, 6042, 6043, 6044, 6045, 6046, 6047, 6048, 6049, 6050, 6051, 6052, 6053,
                                   6054, 6055, 6056, 6080, 6081, 6082, 6106, 6108, 6110, 6112, 6113, 6114, 6115, 6116,
                                   6117, 6118, 6119, 6120, 6121, 6122, 6123, 6124, 6125, 6143, 6145, 6147};
constexpr uint16_t kTotValue[40] = {6057, 6058, 6059, 6060, 6061, 6062, 6063, 6064, 6065, 6066, 6067, 6068, 6069, 6070,
                                    6071, 6072, 6073, 6107, 6109, 6111, 6126, 6127, 6128, 6129, 6130, 6131, 6132, 6133,
                                    6134, 6135, 6136, 6137, 6138, 6139, 6140, 6141, 6142, 6144, 6146, 6148};

// The font sits next to the executable.
const char* stateText(uint16_t state) {
    static const char* kState[] = {"Idle", "Robot at work", "Robot at work", "Robot at work", "Under construction",
                                   "Operational", "Suspended", "Wrecked", "-", "Exhausted"};
    return state < 10 ? kState[state] : "-";
}

} // namespace

Game::Game(SDL_Window* win, SDL_Renderer* ren, sim::GameData& data, StartResult start, const data::BuildingPictures& pics,
           Gfx& gfx, std::filesystem::path saveDir, Preferences& prefs, Media& media)
    : m_win(win), m_ren(ren), m_data(data), m_sim(std::move(start.sim)), m_newGame(std::move(start.newGame)),
      m_landingSite(start.site), m_pics(pics), m_gfx(gfx), m_prefs(prefs), m_media(media), m_map(*m_sim, pics),
      m_menu(data::MenuResource::load(data.exe, "OPPOPMENU").value_or(data::MenuResource{})),
      m_tileMenu(data::MenuResource::load(data.exe, "TILEMENU").value_or(data::MenuResource{})),
      m_saveDir(std::move(saveDir)) {
    if (!start.loadedFrom.empty() && std::filesystem::path(start.loadedFrom).filename() != "TUTOR.OPS")
        m_saveFile = start.loadedFrom;
    m_terrainPacks.load(m_gfx.assets() / "terrain-packs");
    SDL_GetRendererOutputSize(m_ren, &m_laidOut.w, &m_laidOut.h);
    data::MenuItem reports;
    reports.text = "Reports";
    for (auto [id, text] : std::initializer_list<std::pair<int, const char*>>{
             {kRepExecutive, "Executive Summary  E"}, {kRepPopulation, "Population Details  P"},
             {kRepTotals, "Colony Totals  T"}, {kRepDiscoveries, "Research Discoveries  R"},
             {kRepShip, "Starship Status"}, {kRepLog, "Message Log  L"}, {kRepPlanet, "Planet and Sites  G"}, {kRepMorale, "Morale Factors"},
             {kRepMainMenu, "Main Menu"}}) {
        data::MenuItem it;
        it.id = uint16_t(id);
        it.text = text;
        reports.children.push_back(it);
    }
    m_menu.addPopup(reports);

    for (sim::Site* s : m_sim->db().allOf<sim::Site>(sim::ObjType::Site))
        if (m_sim->gridOfSite(s->self)) m_sites.push_back(s->self);
    const sim::Colony* c = m_sim->db().get<sim::Colony>(kColony1);
    sim::Handle site = c ? c->owner : m_landingSite;
    if (!m_sim->gridOfSite(site) && !m_sites.empty()) site = m_sites.front();
    m_map.setSite(site);
    const sim::Tile* hub = c ? m_sim->db().get<sim::Tile>(c->hub) : nullptr;
    if (hub && hub->owner == site) {
        m_map.centreOn(hub->x, hub->y, mapArea());
    } else if (const sim::Grid* g = m_sim->gridOfSite(site)) {
        m_map.centreOn(g->width() / 2.0f, g->height() / 2.0f, mapArea());
    }
    if (landing()) {
        m_status = "Choose where the Seed Lander comes down.";
        m_log.push_back("The starship is in orbit. Choose a landing point for the Seed Lander.");
    }
    collectNotices();
    refreshBuildPanel();
    updateTitle();
}

bool Game::hasSite() const { return m_sim->gridOfSite(m_map.site()) != nullptr; }

// IMPROVED (I100): the player's colonies (player 1), in handle order: the
// first, and any the player gets (the rebels' colony when all of them have
// joined, s8:349E).
std::vector<sim::Handle> Game::playerColonies() const {
    std::vector<sim::Handle> v;
    for (const sim::Colony* c : m_sim->db().allOf<sim::Colony>(sim::ObjType::Colony))
        if (c->player == sim::Handle::make(sim::ObjType::Player, 1)) v.push_back(c->self);
    return v;
}

// The next colony comes into view: its site, the surface, its hub in the
// middle; building and the reports work for it.
void Game::nextColony() {
    const auto all = playerColonies();
    if (all.size() < 2) {
        m_status = "You have one colony.";
        return;
    }
    auto it = std::find(all.begin(), all.end(), m_colony);
    m_colony = it == all.end() ? all.front() : all[(size_t(it - all.begin()) + 1) % all.size()];
    const sim::Colony* c = m_sim->db().get<sim::Colony>(m_colony);
    if (!c) return;
    if (c->owner) m_map.setSite(c->owner);
    setLevel(0);
    if (const sim::Tile* hub = m_sim->db().get<sim::Tile>(c->hub)) m_map.centreOn(hub->x, hub->y, mapArea());
    m_panel.clearSelection();
    refreshBuildPanel();
    m_status = "Now running " + (c->name.empty() ? std::string("the colony") : c->name) + ".";
}

// IMPROVED (I99): trading with the rebels: their standing offer (accept or
// decline), and a deal of the player's own (what to give, what to get).
void Game::openTrade() {
    if (!sim::rebelColonyOf(*m_sim)) {
        m_status = "There is no rebel colony to trade with.";
        return;
    }
    data::DialogTemplate t;
    t.caption = "Trade with the Rebels";
    t.cx = 260;
    t.cy = 150;
    auto add = [&](uint16_t id, const char* cls, std::string text, int16_t x, int16_t y, int16_t cx, int16_t cy,
                   uint32_t style = 0) {
        data::DialogTemplate::Control c;
        c.id = id;
        c.className = cls;
        c.text = std::move(text);
        c.x = x;
        c.y = y;
        c.cx = cx;
        c.cy = cy;
        c.style = style;
        t.controls.push_back(c);
    };
    add(kTradeStatus, "STATIC", "", 8, 6, 244, 8);
    add(0xFFFF, "STATIC", "Their offer:", 8, 22, 60, 8);
    add(kTradeOffer, "STATIC", "", 8, 34, 244, 8);
    add(kTradeAccept, "OPButton", "Accept", 8, 48, 50, 14);
    add(kTradeDecline, "OPButton", "Decline", 64, 48, 50, 14);
    add(0xFFFF, "STATIC", "Your offer: you give", 8, 72, 90, 8);
    add(kGiveAmount, "COMBOBOX", "", 100, 70, 40, 12, 3);
    add(kGiveRes, "COMBOBOX", "", 144, 70, 80, 12, 3);
    add(0xFFFF, "STATIC", "for", 8, 88, 90, 8);
    add(kGetAmount, "COMBOBOX", "", 100, 86, 40, 12, 3);
    add(kGetRes, "COMBOBOX", "", 144, 86, 80, 12, 3);
    add(kTradeInfo, "STATIC", "", 8, 104, 244, 8);
    add(kTradePropose, "OPButton", "Offer", 8, 128, 50, 14);
    add(2, "OPButton", "Close", 200, 128, 50, 14);
    m_dialog = std::make_unique<Dialog>(std::move(t));
    m_dialogId = kDlgTrade;
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    m_dialog->centreIn({0, 0, w, h});
    std::vector<std::string> res, amounts;
    for (uint16_t r : sim::tradeableResources()) res.push_back(resourceName(r));
    for (int32_t a : kTradeAmounts) amounts.push_back(fmt(long(a)));
    m_dialog->lists[kGiveRes] = res;
    m_dialog->lists[kGetRes] = res;
    m_dialog->lists[kGiveAmount] = amounts;
    m_dialog->lists[kGetAmount] = amounts;
    m_dialog->selected[kGiveRes] = 0;
    m_dialog->selected[kGetRes] = int(res.size()) - 1;   // Food
    m_dialog->selected[kGiveAmount] = 1;
    m_dialog->selected[kGetAmount] = 1;
    refreshTrade();
}

sim::TradeOffer Game::tradeDraft() const {
    auto sel = [&](uint16_t id) { return m_dialog && m_dialog->selected.count(id) ? m_dialog->selected.at(id) : 0; };
    const auto& res = sim::tradeableResources();
    const auto pick = [&](int i) { return res[size_t(std::clamp(i, 0, int(res.size()) - 1))]; };
    const auto amount = [&](int i) { return kTradeAmounts[std::clamp(i, 0, int(std::size(kTradeAmounts)) - 1)]; };
    return sim::TradeOffer{{pick(sel(kGiveRes)), amount(sel(kGiveAmount))}, {pick(sel(kGetRes)), amount(sel(kGetAmount))}, 0};
}

void Game::refreshTrade() {
    if (!m_dialog || m_dialogId != kDlgTrade) return;
    const sim::Colony* them = sim::rebelColonyOf(*m_sim);
    const sim::Colony* me = sim::playerColonyOf(*m_sim);           // the colony that trades
    const sim::RebelRelations& rel = m_sim->rebelRelations();
    auto& v = m_dialog->values;
    int buildings = 0;
    if (them)
        for (sim::Handle th : them->tiles.order())
            if (const sim::Tile* t = m_sim->db().get<sim::Tile>(th))
                if (const sim::Building* b = m_sim->db().get<sim::Building>(t->building); b && b->type > 9) ++buildings;
    v[kTradeStatus] = them ? (them->name.empty() ? std::string("Rebels") : them->name) + ": " +
                                 fmt(long(them->population.total())) + " people, " + fmt(long(buildings)) +
                                 " buildings. They are " + sim::attitudeWord(rel.attitude) + "."
                           : "The rebels are gone.";
    if (rel.offer) {
        v[kTradeOffer] = fmt(long(rel.offer->get.amount)) + " " + resourceName(rel.offer->get.res) + " for your " +
                         fmt(long(rel.offer->give.amount)) + " " + resourceName(rel.offer->give.res) + " (until turn " +
                         fmt(long(rel.offer->expires)) + ")";
        m_dialog->disabled.erase(kTradeAccept);
        m_dialog->disabled.erase(kTradeDecline);
    } else {
        v[kTradeOffer] = "None at the moment.";
        m_dialog->disabled.insert(kTradeAccept);
        m_dialog->disabled.insert(kTradeDecline);
    }
    const sim::TradeOffer d = tradeDraft();
    if (me && them)
        v[kTradeInfo] = "You have " + fmt(long(sim::colonyStock(*m_sim, *me, d.give.res))) + " " +
                        resourceName(d.give.res) + "; they hold " +
                        fmt(long(sim::colonyStock(*m_sim, *them, d.get.res))) + " " + resourceName(d.get.res) + ".";
}

void Game::tradeCommand(int id) {
    auto answer = [&](sim::TradeAnswer a) {
        switch (a) {
            case sim::TradeAnswer::Accepted: return std::string("Done: the goods have changed hands.");
            case sim::TradeAnswer::YouLack: return std::string("You do not have that much to give.");
            case sim::TradeAnswer::TheyLack: return std::string("The rebels cannot spare that much.");
            case sim::TradeAnswer::TooLittle: return std::string("The rebels say no: offer them more.");
            default: return std::string("There is no one to trade with.");
        }
    };
    if (id == kTradeAccept) {
        const sim::TradeAnswer a = sim::acceptRebelOffer(*m_sim);
        m_status = answer(a);
        if (a != sim::TradeAnswer::Accepted) m_pending.push_back(Message{"Trade", m_status});   // say why, plainly
    }
    else if (id == kTradeDecline) {
        sim::declineRebelOffer(*m_sim);
        m_status = "You turned the rebels' offer down.";
    } else if (id == kTradePropose) {
        const sim::TradeOffer d = tradeDraft();
        m_status = d.give.res == d.get.res ? std::string("Choose two different goods.") : answer(sim::proposeTrade(*m_sim, d));
    } else if (id == 2 || id == 1) {
        closeDialog(2);
        return;
    }
    if (id == kTradeAccept || id == kTradePropose) {
        collectNotices();
        refreshBuildPanel();
    }
    refreshTrade();
}

bool Game::landing() const { return m_newGame && !m_sim->db().get<sim::Colony>(kColony1); }

// ── Scripted actions ──────────────────────────────────────────────────────

// IMPROVISED (I90): buildings whose use the rebuild does not have yet: the
// TerraForm facility (45, 46: nothing can switch it on) and a second
// Command (55: there is no switching between colonies). The build list
// shows them greyed.
// IMPROVED (I90): not offered yet: the Terraforming Facility. (The Command
// Center was here too until I110 made new colonies possible.)
bool Game::notYetPlayable(uint16_t type) { return type == 45 || type == 46; }

void Game::placeAt(uint16_t type, int16_t x, int16_t y, uint16_t digDirection, bool dozeConfirmed) {
    if (!m_sim->gridOfSite(m_map.site())) return;
    // The ship's landers and Tokamak kit (s7:951A's list +0x0E) and the
    // robots can only be put down while one is left: the count drops when
    // one is placed, but the panel's choice stays, so check it here.
    auto left = [&]() -> int {
        if (type == 62 || type == 65 || type == 19 || type == 18) return m_sim->mothership().deployableCount(type);
        if ((type >= 115 && type <= 117) || (type >= 119 && type <= 121)) {
            const sim::Colony* c = m_sim->db().get<sim::Colony>(m_colony);
            const uint16_t k = type <= 117 ? uint16_t(type - 114) : uint16_t(type - 118);
            return c ? int(c->linkedCount[k] - c->linkedBusy[k]) : 0;
        }
        return 1;
    };
    if (notYetPlayable(type)) {
        m_status = nameOf(type) + " is not available yet in the rebuild.";
        return;
    }
    if (left() <= 0) {
        m_status = "No " + nameOf(type) + " is left to put down.";
        m_panel.clearSelection();
        m_map.setGhost(0, false);
        refreshBuildPanel();
        return;
    }
    const bool seed = type == 10 && landing();
    sim::Building* b = m_sim->playerPutBuilding(m_map.site(), {x, y, m_map.level()}, type, landing() ? kColony1 : m_colony,
                                                digDirection,
                                                dozeConfirmed);
    if (b) {
        ++m_overviewVersion;
        m_status = nameOf(type) + " placed.";
        // s3:ED22: the view turns to a colony a Command Center founded.
        const sim::Colony* parent = m_sim->db().get<sim::Colony>(m_colony);
        if (type == 55 && parent)
            if (const sim::Colony* fresh = b->colony(*m_sim);
                fresh && fresh->self != m_colony && fresh->player == parent->player) {
                m_colony = fresh->self;
                m_status = "A new colony is founded. Two colonists, a robot kit of each kind and supplies came from " +
                           (parent && !parent->name.empty() ? parent->name : std::string("your colony")) +
                           "; press C to switch between your colonies.";
                m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": " + m_status);
                refreshBuildPanel();
            }
        if (seed && m_newGame) {
            m_sim->enqueue(m_newGame->makeSelectStep(m_map.site()));   // s3:EC84
            m_log.push_back("The Seed Lander is down. Run turns while it sets up the colony; the landers "
                            "follow once the Seed Command is running.");
            // IMPROVISED (I41): the colony is named here (dialog 4025
            // "Name"); where the original asks is not decoded. TUTOR.OPS's
            // colony and site share the name.
            openDialog(kDlgName);
            if (m_dialog) {
                m_naming = true;
                m_dialog->setCaption("Name your colony");
                m_dialog->edit = "New Hope";
            }
        }
        collectNotices();
        if (left() <= 0 && m_panel.selected() == type) {      // that was the last one
            m_panel.clearSelection();
            m_map.setGhost(0, false);
        }
        refreshBuildPanel();
    } else {
        const auto msg = m_sim->placeMessage();
        if (msg.id == 1714 && digDirection == 0) {
            // s5:DE32: the digger needs a direction: dialog 4024, Down
            // checked; by the cell's kind (s8:C92A) rubble and dug fill
            // (4, 9) allow only Self-Destruct, dug ground (6..8) both, else
            // only the radios.
            const uint16_t kind = m_sim->cellKind(m_map.site(), {x, y, m_map.level()});
            openDialog(kDlgDig);
            if (!m_dialog) return;
            m_dig = {type, x, y};
            m_dialog->checked = {kDigDown};
            if (kind == 4 || kind == 9) m_dialog->disabled.insert(1);
            else if (kind < 6 || kind > 8) m_dialog->disabled.insert(kDigFill);
            return;
        }
        if (msg.id == 1714) return;                     // Cancel: no message (1714 is a marker)
        if (msg.id == 1512 && !dozeConfirmed) {
            // s9:8520: MB_YESNO | MB_ICONQUESTION, "Outpost" (1403), "Do you
            // want to doze this building?" (1512); No refuses (message 1).
            m_question = Question{Message{m_data.strings.get(1403), m_data.strings.get(1512)},
                                  [this, type, x, y, digDirection] { placeAt(type, x, y, digDirection, true); }};
            return;
        }
        std::string text = m_data.strings.get(msg.id);
        if (auto p = text.find("%d"); p != std::string::npos) text.replace(p, 2, fmt(msg.arg));
        m_message = Message{"Outpost", text.empty() ? "You may not place a tile at this location." : text};
    }
}

void Game::autoLand() {
    if (!landing()) return;
    const sim::Grid* g = m_sim->gridOfSite(m_map.site());
    if (!g) return;
    for (int16_t y = int16_t(g->height() / 2); y < g->height() - 5; y += 2)
        for (int16_t x = int16_t(g->width() / 2); x < g->width() - 5; x += 2) {
            placeAt(10, x, y);
            if (!landing()) {
                m_message.reset();
                if (m_dialog && m_naming) dialogCommand(1);      // the default name
                m_map.centreOn(x, y, mapArea());
                return;
            }
        }
    m_message.reset();
}

void Game::placeNear(uint16_t type, int16_t dx, int16_t dy) {
    const sim::Colony* c = m_sim->db().get<sim::Colony>(kColony1);
    const sim::Tile* hub = c ? m_sim->db().get<sim::Tile>(c->hub) : nullptr;
    if (hub) placeAt(type, int16_t(hub->x + dx), int16_t(hub->y + dy));
    if (m_trace) {
        std::printf("place %u at %+d,%+d: %s\n", unsigned(type), dx, dy,
                    m_message ? m_message->text.c_str() : m_status.c_str());
        m_message.reset();
    }
}

void Game::setLevel(int16_t l) {
    m_map.setLevel(l);
    if (l > m_map.level() && l <= 4)                     // I117: no shaft reaches it yet
        m_status = (m_map.level() == 0 ? std::string("Underground") : "Level " + fmt(long(m_map.level() + 1))) +
                   " is not reached yet: a RoboDigger set to Dig Down " +
                   (m_map.level() == 0 ? std::string("next to a surface tube") : "on level " + fmt(long(m_map.level()))) +
                   " digs the Air Shaft that opens it.";
    refreshBuildPanel();
}

void Game::tileAt(int16_t x, int16_t y, int cmd) {
    sim::Grid* g = m_sim->gridOfSite(m_map.site());
    if (!g) return;
    if (const sim::Tile* t = m_sim->db().get<sim::Tile>(g->tileAt({x, y, m_map.level()}))) {
        m_routeTile = t->self;
        tileCommand(cmd);
    }
}

void Game::openBuilding(int16_t x, int16_t y) {
    sim::Grid* g = m_sim->gridOfSite(m_map.site());
    if (!g) return;
    if (const sim::Tile* t = m_sim->db().get<sim::Tile>(g->tileAt({x, y, m_map.level()}))) openBuildingWindow(*t);
}

void Game::runTurns(int n) {
    for (int i = 0; i < n; ++i) {
        m_sim->runTurns(1);
        if (m_trace) {
            std::string codes;
            for (const sim::Notice& no : m_sim->notices())
                codes += " " + fmt(no.channel) + ":" + fmt(no.code) + (no.value ? "=" + fmt(no.value) : "");
            if (const sim::Colony* c = m_sim->db().get<sim::Colony>(kColony1))
                std::printf("turn %u people %d food %d power %d morale %d%s\n", unsigned(m_sim->turn()),
                            int(c->population.total()), int(c->total[data::res::Food]),
                            int(c->total[data::res::Power]), int(c->morale), codes.c_str());
        }
        collectNotices(true);
        if (m_sim->gameLost()) break;
    }
    if (m_trace) {
        std::string hold = "  ship hold:", dep = " deployable:";
        for (const auto& i : m_sim->mothership().hold) hold += " " + fmt(i.kind) + "x" + fmt(i.count);
        for (const auto& i : m_sim->mothership().deployable) dep += " " + fmt(i.kind) + "x" + fmt(i.count);
        std::string orb = " orbitals (carried/launched):";
        for (size_t i = 0; i < sim::Orbitals::kSlots; ++i)
            orb += " " + fmt(long(sim::Orbitals::kFirstKind + i)) + "=" + fmt(m_sim->orbitals().carried[i]) + "/" +
                   fmt(m_sim->orbitals().launched[i]);
        std::printf("%s%s\n%s\n", hold.c_str(), dep.c_str(), orb.c_str());
    }
    if (m_trace)                                         // the buildings after the turns
        for (const sim::Building* b : m_sim->db().allOf<sim::Building>(sim::ObjType::Building)) {
            const sim::Tile* t = const_cast<sim::Building*>(b)->tile(*m_sim);
            std::string bas;
            if (t)
                for (int r = 0; r < 32; ++r)
                    if (t->bas.get(r)) bas += " " + fmt(r) + "=" + fmt(t->bas.get(r));
            std::printf("  bldg %3u %-18s state %u flags %u at %d,%d,%d ops %u/%u/%u%s\n", unsigned(b->type),
                        nameOf(b->type).c_str(), unsigned(b->state), unsigned(b->flags), t ? t->x : -1,
                        t ? t->y : -1, t ? t->level : -1, unsigned(b->opsResource), unsigned(b->opsAmount),
                        unsigned(b->opsProductA), bas.c_str());
        }
    refreshBuildPanel();
    updateTitle();
    m_status = "Turn " + fmt(long(m_sim->turn())) + " complete.";
}

// ── Frame ─────────────────────────────────────────────────────────────────

void Game::reflow() {
    SDL_Rect s{0, 0, 0, 0};
    SDL_GetRendererOutputSize(m_ren, &s.w, &s.h);
    if (s.w == m_laidOut.w && s.h == m_laidOut.h) return;
    if (m_dialog) m_dialog->refit(m_laidOut, s);
    m_laidOut = s;
}

void Game::frame(bool present) {
    reflow();
    m_map.setTerrainPacks(m_prefs.terrainPacks ? &m_terrainPacks : nullptr);
    // I95: the landing's music until the Seed is down, then the surface's
    // or the underground's by the level in view.
    m_media.audio.setMood(landing() ? Mood::Landing : m_map.level() > 0 ? Mood::Underground : Mood::Surface);
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    if (m_media.sequence.active()) {
        // The colony view is hidden while the movie plays (s2:2C4E).
        m_media.sequence.tick(SDL_GetTicks());
        if (m_media.sequence.active()) {
            m_media.sequence.draw({0, 0, w, h});
            if (present) SDL_RenderPresent(m_ren);
            return;
        }
        // IMPROVISED (I45): after its ending movies (440.flc, 294.flc,
        // 400.flc) the original closes itself (command 238, WM_CLOSE); the
        // rebuild goes back to the main menu.
        const uint16_t end = m_media.sequence.endCommand();
        if (end == data::media::kExitGame || end == data::media::kMainMenu) m_over = true;
    }
    if (m_prefs.tileAnimations) m_map.tick(SDL_GetTicks());
    SDL_SetRenderDrawColor(m_ren, 0, 0, 0, 255);
    SDL_RenderClear(m_ren);
    m_map.draw(m_gfx, mapArea());
    drawLog(w, h);
    drawOverview();
    m_panel.draw(m_gfx, panelArea(), m_pics);
    drawStatus(w, h);
    m_menu.draw(m_gfx, w);
    if (m_popup) m_popup->draw(m_gfx);
    if (m_dialog) {
        m_dialog->draw(m_gfx);
        drawDialogExtras();
    }
    if (m_research) m_research->draw(m_gfx, {0, 0, w, h});
    if (m_planet) m_planet->draw(m_gfx, {0, 0, w, h}, SDL_GetTicks());
    if (!m_message && !m_pending.empty()) {
        m_message = m_pending.front();
        m_pending.pop_front();
    }
    if (m_interviewDue && !m_message && !m_question && !m_dialog && !m_research && !m_planet) openInterview();
    if (m_message) drawMessage(m_gfx, *m_message, {0, 0, w, h});
    else if (m_question) drawQuestion(m_gfx, m_question->message, {0, 0, w, h});
    if (present) SDL_RenderPresent(m_ren);
}

// IMPROVISED (I42): the Laboratory window (4003) leaves its left part and
// the row after "Progress Meter:" empty for the window's own drawing, which
// is not decoded. The rebuild shows the building's picture there and the
// topic's progress, (cost - remaining) / cost.
void Game::drawDialogExtras() {
    // IMPROVISED (I46): the About box (4026) leaves its top 70 dialog units
    // to its own paint code, which is not decoded; the rebuild shows the
    // catalog's logo.bmp (id 3) there.
    if (m_dialog && m_dialogId == kDlgAbout) {
        if (SDL_Texture* logo = m_gfx.bitmap("logo.bmp", false)) {
            const SDL_Rect area = m_dialog->dluRect(4, 2, 177, 66);
            int w, h;
            SDL_QueryTexture(logo, nullptr, nullptr, &w, &h);
            const float k = std::min(float(area.w) / w, float(area.h) / h);
            const SDL_Rect dst{area.x + int(area.w - w * k) / 2, area.y + int(area.h - h * k) / 2, int(w * k),
                               int(h * k)};
            SDL_RenderCopy(m_ren, logo, nullptr, &dst);
        }
        return;
    }
    if (!m_dialog || m_dialogId != kDlgLab) return;
    const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    const auto* lab = t ? dynamic_cast<const sim::LabBuilding*>(m_sim->db().get<sim::Building>(t->building)) : nullptr;
    if (!lab) return;
    const SDL_Rect area = m_dialog->dluRect(6, 7, 98, 78);
    m_gfx.fill(area, ui::kWindow);
    m_gfx.frame(area, ui::kShadow);
    // IMPROVED (I65): OutpostHD's picture; the original's without it.
    if (auto hp = hdSprites(m_gfx).building(lab->type)) {
        hdSprites(m_gfx).drawFitted(m_gfx, *hp, SDL_FRect{area.x + 4.0f, area.y + 4.0f, area.w - 8.0f, area.h - 8.0f});
    } else if (auto p = m_pics.picture(lab->type)) {
        const float s = std::min({2.0f, (area.w - 8.0f) / p->w, (area.h - 8.0f) / p->h});
        m_gfx.blit(m_pics.sheetName(p->sheet), SDL_Rect{p->x, p->y, p->w, p->h}, area.x + (area.w - p->w * s) / 2,
                   area.y + (area.h - p->h * s) / 2, s);
    }
    const SDL_Rect bar = m_dialog->dluRect(68, 112, 199, 10);
    m_gfx.fill(bar, ui::kWindow);
    m_gfx.frame(bar, ui::kShadow);
    const data::ResearchTopic* topic = m_data.research.find(lab->topic);
    const sim::Colony* c = m_sim->db().get<sim::Colony>(kColony1);
    const sim::Player* pl = c ? m_sim->playerOf(c) : nullptr;
    if (topic && topic->cost && pl && lab->topic < pl->remaining.size()) {
        const int left = std::clamp<int>(pl->remaining[lab->topic], 0, topic->cost);
        const int done = (bar.w - 4) * (topic->cost - left) / topic->cost;
        m_gfx.fill({bar.x + 2, bar.y + 2, done, bar.h - 4}, ui::kHighlight);
    }
}

SDL_Rect Game::overviewArea() const {
    const SDL_Rect a = mapArea();
    const sim::Grid* g = m_sim->gridOfSite(m_map.site());
    const int w = std::min(320, a.w / 3);
    const int h = g && g->width() > 0 ? w * g->height() / g->width() : w / 2;
    return {a.x + a.w - w - 10, a.y + 32, w, h};
}

void Game::drawOverview() {
    if (!(m_showOverview || landing())) return;
    const SDL_Rect r = overviewArea();
    m_gfx.fill({r.x - 4, r.y - 22, r.w + 8, r.h + 26}, Colour{4, 3, 8, 220});
    m_gfx.frame({r.x - 4, r.y - 22, r.w + 8, r.h + 26}, ui::kShadow);
    const SDL_Rect drawn = m_overview.draw(m_ren, *m_sim, m_map.site(), m_map.level(), r,
                                           m_overviewVersion + uint32_t(m_sim->turn()) * 1000u);
    m_gfx.text("Overview (M)  gold: mining beacons (" + fmt(m_overview.beacons()) + ")", r.x, r.y - 20, ui::kText);
    // The view's centre.
    const SDL_Rect a = mapArea();
    if (auto c = m_map.cellAt(a.x + a.w / 2, a.y + a.h / 2); c && drawn.w > 0) {
        const sim::Grid* g = m_sim->gridOfSite(m_map.site());
        const int px = drawn.x + c->x * drawn.w / std::max<int>(1, g->width());
        const int py = drawn.y + c->y * drawn.h / std::max<int>(1, g->height());
        m_gfx.frame({px - 12, py - 7, 24, 14}, ui::kOrange);
    }
}

SDL_Rect Game::mapArea() const {
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    return {0, MenuBar::kHeight, w - BuildPanel::kWidth, h - MenuBar::kHeight - 24};
}

SDL_Rect Game::panelArea() const {
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    return {w - BuildPanel::kWidth, MenuBar::kHeight, BuildPanel::kWidth, h - MenuBar::kHeight - 24};
}

bool Game::insideMap(int x, int y) const {
    const SDL_Rect r = mapArea();
    return x >= r.x && y >= r.y && x < r.x + r.w && y < r.y + r.h;
}

std::string Game::nameOf(uint16_t type) const {
    std::string n = data::buildingName(m_data.exe, m_data.strings, type);   // s5:BD80
    return n.empty() ? "Type " + fmt(type) : n;
}

// Strings 1463.. (OreLifeA ..): ids 1..31 in order, then MPG, Power, Pop.
std::string Game::resourceName(int id) const {
    if (id >= 1 && id <= 31) return m_data.strings.get(uint16_t(1462 + id));
    if (id == 33) return m_data.strings.get(1494);
    if (id == 35) return m_data.strings.get(1495);
    if (id == 36) return m_data.strings.get(1496);
    return {};
}

// Product names: the kits are named after their robots; trucks 1511,
// explorers 1406; the rest strings 1000.. (Fuel Cells = product 7).
// s5:C2F8: product B 1..13 are strings 0x583..0x58F, 14 0x3F8, 15 0x3F9,
// 16 0x532 (the stop row).
std::string Game::productBName(uint16_t p) const {
    uint16_t id = 0;
    if (p >= 1 && p <= 13) id = uint16_t(0x583 + p - 1);
    else if (p == 14) id = 0x3F8;
    else if (p == 15) id = 0x3F9;
    else if (p == 16) id = 0x532;
    const std::string& s = id ? m_data.strings.get(id) : std::string();
    return s.empty() ? "Goods " + fmt(p) : s;
}

std::string Game::productName(uint16_t p) const {
    if (p >= 1 && p <= 3) return nameOf(uint16_t(114 + p));
    if (p == sim::product::Truck) return m_data.strings.get(1511);
    if (p == sim::product::Explorer) return m_data.strings.get(1406);
    if (p >= 7 && p <= 24) {
        const std::string& s = m_data.strings.get(uint16_t(993 + p));
        if (!s.empty()) return s;
    }
    return p ? "Product " + fmt(p) : "None";
}

void Game::refreshBuildPanel() {
    std::vector<BuildPanel::Entry> e;
    if (landing()) {
        // IMPROVISED (I37): how the original puts the Seed down is not
        // decoded (the Seed is not on the icon bar, s7:951A); before the
        // landing the panel offers the Seed Lander alone.
        e.push_back({10, nameOf(10)});
        m_panel.setEntries(std::move(e));
    if (!m_panel.selected()) m_map.setGhost(0, false);
        return;
    }
    const bool ug = m_map.level() > 0;
    // s7:9296: the colony's free robots first (products 1..3, s8:53BA):
    // on the surface the RoboDozer, RoboDigger and RoboMiner (115..117);
    // underground the UG dozer and digger (119, 120). IMPROVISED (I35): the
    // underground choice of types is not decoded.
    if (const sim::Colony* c = m_sim->db().get<sim::Colony>(m_colony))
        for (uint16_t k = 1; k <= 3; ++k) {
            const int32_t free = c->linkedCount[k] - c->linkedBusy[k];
            if (free <= 0 || (ug && k == 3)) continue;
            const uint16_t type = ug ? uint16_t(118 + k) : uint16_t(114 + k);
            e.push_back({type, nameOf(type) + " (" + fmt(free) + ")"});
        }
    // s7:951A: the ship's landers and Tokamak still aboard (list +0x0E).
    if (!ug)
        for (const sim::ShipItem& it : m_sim->mothership().deployable)
            if ((it.kind == 62 || it.kind == 65 || it.kind == 19 || it.kind == 18) && it.count > 0)
                e.push_back({it.kind, nameOf(it.kind) + " (" + fmt(it.count) + ")"});
    const auto& menu = m_sim->buildMenu();
    // IMPROVISED (I35): the panel offers the structures of the level in
    // view (underground types 79..114, 119..121, 125..127); the
    // original's filter is not decoded.
    auto underground = [](uint16_t t) {
        return (t >= 79 && t <= 114) || (t >= 119 && t <= 121) || (t >= 125 && t <= 127);
    };
    // The ship's cargo (the Seed parts 10..14, the MShip Tokamak 19, the
    // landers 62 and 65) and the robots (115..121) come only from the
    // entries above, with their counts; the build menu does not offer them
    // again.
    auto fromAbove = [](uint16_t t) {
        return (t >= 10 && t <= 14) || t == 18 || t == 19 || t == 62 || t == 65 || (t >= 115 && t <= 121);
    };
    for (uint16_t t = 10; t < 128; ++t)
        if (menu.isOffered(t) && !fromAbove(t) && m_pics.picture(t) && underground(t) == ug)
            e.push_back({t, nameOf(t), notYetPlayable(t)});
    m_panel.setEntries(std::move(e));
    if (!m_panel.selected()) m_map.setGhost(0, false);
}

void Game::updateTitle() {
    const std::string& base = m_data.strings.get(1500);               // "Outpost - Turn #"
    std::string t = (base.empty() ? std::string("Outpost - Turn #") : base) + fmt(long(m_sim->turn()));
    SDL_SetWindowTitle(m_win, t.c_str());
}

void Game::drawStatus(int w, int h) {
    const SDL_Rect r{0, h - 24, w, 24};
    m_gfx.bevel(r);
    const sim::Colony* c = m_sim->db().get<sim::Colony>(m_colony);
    std::string s = m_data.strings.get(1500) + fmt(long(m_sim->turn()));
    if (c && playerColonies().size() > 1) s += "    " + (c->name.empty() ? std::string("Colony") : c->name) + " (C: next colony)";
    if (c) {
        s += "    " + m_data.strings.get(1509) + ": " + fmt(c->population.total());   // "People"
        s += "    Morale: " + fmt(c->morale);
    }
    const auto& ship = m_sim->mothership();
    if (ship.arrived && ship.cryoColonists > 0) s += "    In cryo: " + fmt(ship.cryoColonists);
    static const char* kLevels[] = {"Surface", "Underground 1", "Underground 2", "Underground 3", "Underground 4"};
    s += "    " + std::string(kLevels[std::clamp<int>(m_map.level(), 0, 4)]);
    m_gfx.text(s, 8, r.y + 4);
    if (!m_status.empty()) m_gfx.text(m_status, w - m_gfx.textWidth(m_status) - 10, r.y + 4, ui::kGold);
}

// The message log's last lines over the bottom of the map.
void Game::drawLog(int, int) {
    if (m_log.empty()) return;
    const SDL_Rect area = mapArea();
    const int width = std::min(area.w - 12, 900), lh = m_gfx.lineHeight();
    // The last messages, wrapped to the panel; the newest four lines show.
    std::vector<std::string> wrapped;
    for (size_t i = m_log.size() > 4 ? m_log.size() - 4 : 0; i < m_log.size(); ++i) {
        std::string line, word;
        const std::string& msg = m_log[i];
        auto flush = [&] {
            const std::string t = line.empty() ? word : line + " " + word;
            if (m_gfx.textWidth(t) > width - 12 && !line.empty()) {
                wrapped.push_back(line);
                line = "    " + word;
            } else {
                line = t;
            }
            word.clear();
        };
        for (char ch : msg) {
            if (ch == ' ') flush();
            else word.push_back(ch);
        }
        flush();
        if (!line.empty()) wrapped.push_back(line);
    }
    const int lines = std::min<int>(4, int(wrapped.size()));
    const SDL_Rect r{area.x + 6, area.y + area.h - lines * lh - 12, width, lines * lh + 8};
    m_gfx.fill(r, Colour{0, 0, 0, 150});
    int y = r.y + 4;
    for (size_t i = wrapped.size() - size_t(lines); i < wrapped.size(); ++i) {
        m_gfx.text(wrapped[i], r.x + 6, y, Colour{230, 230, 160});
        y += lh;
    }
}

// IMPROVED (I97): warnings the original never gives, before two of its
// timed events: the Seed Command's life support running out (its life,
// s7:C10E, then it is a plain Command, quirk Q43) with no CHAP running, and
// the Seed's equipment wearing out at turn 150 (s6:780C).
void Game::warnAhead() {
    const sim::Colony* c = m_sim->db().get<sim::Colony>(kColony1);
    if (!c) return;
    auto warn = [&](const std::string& title, const std::string& text) {
        m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": " + text);
        m_pending.push_back(Message{title, text});
    };
    if (m_sim->turn() == 140)
        for (const sim::Tile* t : m_sim->colonyTilesInGroup(*c, 37, false))
            if (const auto* b = m_sim->db().get<sim::Building>(t->building); b && b->type == 10) {
                warn("Seed equipment",
                     "In 10 turns the Seed's equipment (Seed Lander, Smelter, Factory, Power and the landers) wears out "
                     "and is wrecked. Have your own Smelter, Factory and power ready, and tubes that reach the Command "
                     "Center without passing through the Seed Lander.");
                break;
            }
    bool chap = false;
    int life = -1;
    for (const sim::Tile* t : m_sim->colonyTilesInGroup(*c, 45, false))
        if (const auto* b = m_sim->db().get<sim::Building>(t->building)) {
            if ((b->type == 42 || b->type == 43) && b->state == sim::Building::kOperational) chap = true;
            if (const auto* cc = dynamic_cast<const sim::CommandCenterBuilding*>(b); cc && b->type == 11) life = cc->life;
        }
    if (!chap && (life == 10 || life == 3))
        warn("Life support",
             "The Seed Command's life support runs out in " + fmt(long(life)) +
                 " turns. Without a working CHAP the colonists will start to die.");
}

// The simulation's messages (registry 0x37, the message log): the text of a
// code is the log window's (s2:A1F0, the switch at 2:A82A; findings
// /12-graphics.md §10). Alerts (registry 0x2B) light the icon bar and are
// not shown.
void Game::collectNotices(bool afterTurn) {
    std::set<std::string> popped;
    for (const sim::Notice& n : m_sim->notices()) {
        if (n.channel == 0x111 && n.code == 0x106) {         // s6:76DA: the morale crisis' interview
            m_interviewDue = true;
            continue;
        }
        if (n.channel == 0x32 && n.code < 0x100) {
            // Registry 0x32, research results: a lab finished its topic and
            // stands idle until it is given another.
            // IMPROVISED (I40): the results window is not decoded; the log
            // says which topic is done.
            const auto* topic = m_data.research.find(n.code);
            m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": Research complete: " +
                            (topic ? topic->name : "a topic") + ". The lab is idle until it gets a new topic.");
            continue;
        }
        if (n.channel == sim::kRebelNotice) {
            // IMPROVED (I99): the rebels' news.
            const sim::RebelRelations& rel = m_sim->rebelRelations();
            std::string text;
            bool box = false;
            switch (n.code) {
                case 1:
                    if (rel.offer) {
                        text = "The rebels offer you " + fmt(long(rel.offer->get.amount)) + " " +
                               resourceName(rel.offer->get.res) + " for " + fmt(long(rel.offer->give.amount)) + " " +
                               resourceName(rel.offer->give.res) + ". Press D to trade.";
                        box = true;
                    }
                    break;
                case 2: text = "A trade with the rebels is done."; break;
                case 3: text = "The rebels' trade offer has lapsed."; break;
                case 4: break;                       // what they build is not reported (the player's wish)
                case 5:
                    text = "The rebels have joined you! Their colony is yours now: press C to switch to it.";
                    box = true;
                    break;
                default: break;
            }
            if (!text.empty()) {
                m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": " + text);
                if (box) m_pending.push_back(Message{"The rebels", text});
            }
            continue;
        }
        if (n.channel == sim::kBreakdownNotice) {
            // IMPROVED (I108): breakdowns and repairs.
            const std::string what = nameOf(uint16_t(n.value));
            std::string text;
            if (n.code == 1)
                text = what + " has broken down. The engineers in the Command Center will need about " +
                       fmt(long(sim::kRepairWork)) + " turns (half with Repair Robots and a Robot Command).";
            else if (n.code == 2)
                text = what + " is repaired and working again.";
            else if (n.code == 3)
                text = what + " has broken down! Life support is failing; the engineers will have it running again "
                              "next turn.";
            else if (n.code == 4)
                text = what + " was damaged and is out of action until the engineers repair it.";
            if (!text.empty()) m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": " + text);
            continue;
        }
        if (n.channel == 0x2B && n.code == 0x1D && n.colony == kColony1) {
            // IMPROVED (I97): alert 0x1D (s6:780C, turn 150: the Seed's
            // modules and landers are wrecked) only lights the icon bar in
            // the original; the rebuild says what happened and what to do.
            const std::string text =
                "The Seed's equipment has worn out: the Seed Lander, Seed Smelter, Seed Factory, Seed Power and the "
                "landers are wrecked. Tubes do not pass through wreckage, so anything that reached the Command Center "
                "only through the Seed Lander is cut off: bulldoze the wreck and lay a tube there to join the "
                "colony again.";
            m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": " + text);
            m_pending.push_back(Message{"Seed equipment wrecked", text});
            continue;
        }
        if (n.channel != 0x37) continue;
        std::vector<uint16_t> ids;
        bool important = false;
        switch (n.code) {
            case 1: ids = {1434}; break;
            case 5: ids = {1435}; break;
            case 6: ids = {1585}; important = true; break;
            case 7: ids = {1024}; important = true; break;
            case 20: ids = {1834, 1835}; important = true; break;
            case 22: ids = {1811}; important = true; break;
            case 23: ids = {1815}; important = true; break;
            case 24: ids = {1817}; important = true; break;
            case 27: ids = {1819}; important = true; break;
            case 28: ids = {1821}; important = true; break;
            case 31: ids = {1824}; important = true; break;
            case 33: case 36: ids = {1813}; important = true; break;
            case 49: ids = {1810}; important = true; break;
            case 50: ids = {1812}; important = true; break;
            case 51: ids = {1814}; important = true; break;
            case 52: ids = {1816}; important = true; break;
            case 53: ids = {1818}; important = true; break;
            case 54: ids = {1820}; important = true; break;
            case 55: ids = {1822, 1823}; important = true; break;
            default:
                if (n.code >= 56 && n.code <= 60) {
                    ids = {uint16_t(1825 + n.code - 56)};
                    important = true;
                } else if (n.code >= 61 && n.code <= 69) {
                    ids = {uint16_t(1858 + n.code - 61)};
                }
                break;
        }
        if (const uint16_t movie = data::logMovieCommand(n.code)) startMovie(movie);   // s2:A260
        // IMPROVED (I119): s2:A70A/A72E pair "The people love/hate you,
        // Commander." (codes 62/63, every 10 turns) with voice lines 207/208
        // (add67/add68); the rebuild speaks them as the line is shown.
        if (n.code == 62) m_media.audio.playVoice(207);
        else if (n.code == 63) m_media.audio.playVoice(208);
        std::string text;
        for (uint16_t id : ids) text += m_data.strings.get(id);
        if (n.code == 2) {
            // IMPROVISED (I39): the string the EXE formats here (256) is
            // not in its string table; the rebuild words it itself.
            const sim::Colony* c = m_sim->db().get<sim::Colony>(n.colony);
            text = fmt(n.value) + (n.value == 1 ? " colonist has died" : " colonists have died") +
                   (c && !c->name.empty() ? " at " + c->name : std::string()) + ".";
        }
        if (text.empty()) continue;
        m_log.push_back("Turn " + fmt(long(m_sim->turn())) + ": " + text);
        if (m_log.size() > 200) m_log.pop_front();
        // IMPROVISED (I39): the original lists these in its message log;
        // the rebuild also shows the important ones in a message box, but a
        // message the last turn showed too ("Colonists on board the starship
        // are dying", "Everyone is dead.") is only logged.
        if (important && !m_repeating.count(text) && popped.insert(text).second)
            m_pending.push_back(Message{"Outpost", text});
        else if (important)
            popped.insert(text);
    }
    if (afterTurn) m_repeating = std::move(popped);
    if (afterTurn) warnAhead();
    else m_repeating.insert(popped.begin(), popped.end());
    m_sim->clearNotices();
    if (m_sim->gameLost() && !m_lostShown) {
        m_lostShown = true;
        m_pending.push_back(Message{"Outpost", "Your colony is lost. The game is over."});
    }
}

void Game::startMovie(uint16_t command) {
    // A new overlay replaces the one playing (s2:2C4E destroys the old view).
    m_media.sequence.start(command, SDL_GetTicks());
}

// ── Events ────────────────────────────────────────────────────────────────

Game::Next Game::event(const SDL_Event& e) {
    reflow();
    if (e.type == SDL_QUIT) return Next::Quit;
    if (m_over) return Next::Menu;
    if (m_media.sequence.active()) {
        m_media.sequence.event(e, SDL_GetTicks());
        return Next::Stay;
    }
    if (m_question && !m_message) {
        int w, h;
        SDL_GetRendererOutputSize(m_ren, &w, &h);
        const QuestionLayout q = questionLayout(m_gfx, m_question->message, {0, 0, w, h});
        bool yes = false, no = false;
        if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT) {
            const SDL_Point at{e.button.x, e.button.y};
            yes = SDL_PointInRect(&at, &q.yes);
            no = SDL_PointInRect(&at, &q.no);
        } else if (e.type == SDL_KEYDOWN) {
            const auto k = e.key.keysym.sym;
            yes = k == SDLK_y || k == SDLK_RETURN || k == SDLK_KP_ENTER;
            no = k == SDLK_n || k == SDLK_ESCAPE;
        }
        if (yes || no) {
            auto f = std::move(m_question->yes);
            m_question.reset();
            if (yes && f) f();
        }
        return Next::Stay;
    }
    if (m_message) {
        if (e.type == SDL_KEYDOWN || e.type == SDL_MOUSEBUTTONDOWN) {
            m_message.reset();
            if (m_pending.empty() && m_sim->gameLost() && m_lostShown) return Next::Menu;
        }
        return Next::Stay;
    }
    if (m_research) {
        if (m_research->handle(e) != ResearchWindow::Result::None) closeTopics();
        return Next::Stay;
    }
    if (m_planet) {
        const auto r = m_planet->handle(e);
        if (r == PlanetWindow::Result::Go) goToSite(m_planet->chosenSite());
        if (r != PlanetWindow::Result::None) m_planet.reset();
        return Next::Stay;
    }
    if (m_popup) {
        const int cmd = m_popup->handle(e, m_gfx);
        if (cmd) {
            m_popup.reset();
            if (cmd > 0) tileCommand(cmd);
        }
        return Next::Stay;
    }
    if (m_dialog) {
        if (const int id = m_dialog->handle(e)) dialogCommand(id);
        return Next::Stay;
    }
    if (const int cmd = m_menu.handle(e, m_gfx)) {
        if (cmd > 0) return command(cmd);
        return Next::Stay;
    }
    if (m_panel.handle(e, panelArea())) {
        m_map.clearGhost();
        if (m_panel.selected()) {
            m_map.setGhost(m_panel.selected(), true);
            m_status = "Place: " + nameOf(m_panel.selected()) + "  (right click to cancel)";
        }
        return Next::Stay;
    }
    switch (e.type) {
        case SDL_KEYDOWN: return key(e.key);
        case SDL_MOUSEWHEEL: {
            int mx, my;
            SDL_GetMouseState(&mx, &my);
            m_map.zoomAt(e.wheel.y > 0 ? 1.25f : 0.8f, mx, my);
            break;
        }
        case SDL_MOUSEMOTION:
            if (e.motion.state & SDL_BUTTON_MMASK) m_map.scroll(float(e.motion.xrel), float(e.motion.yrel));
            m_map.setHover(insideMap(e.motion.x, e.motion.y) ? m_map.cellAt(e.motion.x, e.motion.y) : std::nullopt);
            break;
        case SDL_MOUSEBUTTONDOWN:
            if (!insideMap(e.button.x, e.button.y)) break;
            if (e.button.button == SDL_BUTTON_LEFT && (m_showOverview || landing())) {
                int16_t cx, cy;
                if (m_overview.cellAt(e.button.x, e.button.y, cx, cy)) {
                    m_map.centreOn(cx, cy, mapArea());
                    break;
                }
            }
            if (e.button.button == SDL_BUTTON_LEFT) {
                if (m_addLeg) addLeg(e.button.x, e.button.y);
                else click(e.button.x, e.button.y);
            }
            if (e.button.button == SDL_BUTTON_RIGHT) {
                if (m_addLeg) {
                    m_addLeg = false;
                    m_status.clear();
                    reopenTransit();
                } else if (m_panel.selected()) {
                    m_panel.clearSelection();
                    m_map.clearGhost();
                    m_status.clear();
                } else if (const sim::Tile* t = buildingTileAt(e.button.x, e.button.y)) {
                    // TILEMENU, the building's pop-up.
                    m_routeTile = t->self;
                    m_popup = std::make_unique<PopupMenu>(m_tileMenu, e.button.x, e.button.y);
                }
            }
            break;
        default: break;
    }
    return Next::Stay;
}

void Game::scrollKeys() {
    if (m_dialog || m_message) return;
    const Uint8* k = SDL_GetKeyboardState(nullptr);
    const float step = 14.0f;
    if (k[SDL_SCANCODE_LEFT]) m_map.scroll(step, 0);
    if (k[SDL_SCANCODE_RIGHT]) m_map.scroll(-step, 0);
    if (k[SDL_SCANCODE_UP]) m_map.scroll(0, step);
    if (k[SDL_SCANCODE_DOWN]) m_map.scroll(0, -step);
}

Game::Next Game::key(const SDL_KeyboardEvent& k) {
    const bool ctrl = (k.keysym.mod & KMOD_CTRL) != 0, alt = (k.keysym.mod & KMOD_ALT) != 0;
    // OPACCEL: ^T run a turn, F5 several, Alt-0..4 levels, Alt-X exit, F1 help.
    if (ctrl && k.keysym.sym == SDLK_t) return command(kRunTurn);
    if (ctrl && k.keysym.sym == SDLK_s) return command(kSave);
    if (alt && k.keysym.sym == SDLK_x) return command(kExit);
    if (alt && k.keysym.sym >= SDLK_0 && k.keysym.sym <= SDLK_4) return command(kSurface + (k.keysym.sym - SDLK_0));
    switch (k.keysym.sym) {
        case SDLK_F5: return command(kRunTurns);
        case SDLK_F1: return command(kHelp);
        case SDLK_RETURN: case SDLK_KP_ENTER: return command(kRunTurn);
        case SDLK_SPACE: return command(kRunTurn);           // IMPROVED (I47): the player's request
        case SDLK_PAGEUP: setLevel(int16_t(m_map.level() - 1)); break;
        case SDLK_m: m_showOverview = !m_showOverview; break;          // I53
        case SDLK_c: nextColony(); break;                                // I100
        case SDLK_d: openTrade(); break;                                 // I99
        case SDLK_PAGEDOWN: setLevel(int16_t(m_map.level() + 1)); break;
        case SDLK_g: openPlanet(); break;                                // I110
        case SDLK_TAB: {
            // The next site the player can see (I110: all of them with an
            // Orbital Observer in orbit).
            std::vector<sim::Handle> seen;
            for (sim::Handle s : m_sites)
                if (siteVisible(*m_sim, s, m_landingSite)) seen.push_back(s);
            if (!seen.empty()) {
                auto it = std::find(seen.begin(), seen.end(), m_map.site());
                goToSite(seen[it == seen.end() ? 0 : (size_t(it - seen.begin()) + 1) % seen.size()]);
            }
            break;
        }
        case SDLK_e: return command(kRepExecutive);
        case SDLK_p: return command(kRepPopulation);
        case SDLK_t: return command(kRepTotals);
        case SDLK_r: return command(kRepDiscoveries);
        case SDLK_l: return command(kRepLog);
        case SDLK_ESCAPE:
            m_panel.clearSelection();
            m_map.clearGhost();
            m_status.clear();
            break;
        case SDLK_EQUALS: case SDLK_KP_PLUS: m_map.zoomAt(1.25f, mapArea().w / 2, mapArea().h / 2); break;
        case SDLK_MINUS: case SDLK_KP_MINUS: m_map.zoomAt(0.8f, mapArea().w / 2, mapArea().h / 2); break;
        default: break;
    }
    return Next::Stay;
}

Game::Next Game::command(int cmd) {
    switch (cmd) {
        case kExit: case kClose: return Next::Quit;
        case kRunTurn:
            if (landing()) {
                m_message = Message{"Outpost", "Land the Seed first: pick the Seed Lander and click the map."};
                break;
            }
            runTurns(1);
            break;
        case kRunTurns: openDialog(kDlgTurns); break;
        case kSave:
            // A save before the Seed is down cannot be played (the landing
            // is not part of the save): refuse it.
            if (landing()) {
                m_status = "Land the Seed Lander before saving.";
                break;
            }
            save(m_saveFile.empty() ? m_saveDir / "REBUILD.OPS" : m_saveFile); break;
        case kSaveAs:
            if (landing()) {
                m_status = "Land the Seed Lander before saving.";
                break;
            }
            openDialog(kDlgName);
            break;
        case kAbout: openDialog(kDlgAbout); break;
        case kPreferences: openDialog(kDlgPreferences); break;
        case kHelp: case kDocument:
            m_message = Message{"Help",
                                "Enter or Ctrl+T: run a turn.  F5: run several turns.  Ctrl+S: save.\n"
                                "Pick a structure on the right, then click the map to build it; right click "
                                "cancels. Click a building for its window; right click it for its menu.\n"
                                "Page Up/Down or Alt+0..4: change level.  Tab: next site.\n"
                                "Arrows or middle drag: scroll.  Wheel or +/-: zoom.\n"
                                "E, P, T, R, L: Executive Summary, Population, Colony Totals, Discoveries, "
                                "Message Log."};
            break;
        case kRepExecutive: openDialog(kDlgExecutive); break;
        case kRepPopulation: openDialog(kDlgPopulation); break;
        case kRepTotals: openDialog(kDlgTotals); break;
        case kRepDiscoveries: openDialog(kDlgDiscoveries); break;
        case kRepShip: {
            const auto& ship = m_sim->mothership();
            std::string s = "Hold:";
            for (const auto& it : ship.hold) s += "\n  " + nameOf(it.kind) + ": " + fmt(it.count);
            s += "\nReady to land:";
            for (const auto& it : ship.deployable) s += "\n  " + nameOf(it.kind) + ": " + fmt(it.count);
            if (ship.arrived) s += "\nColonists in cryo: " + fmt(ship.cryoColonists);
            m_message = Message{"Starship Status", s};
            break;
        }
        case kRepLog: {
            std::string s;
            const size_t from = m_log.size() > 14 ? m_log.size() - 14 : 0;
            for (size_t i = from; i < m_log.size(); ++i) s += m_log[i] + "\n";
            m_message = Message{"Message Log", s.empty() ? "No messages." : s};
            break;
        }
        case kRepMainMenu: return Next::Menu;
        case kRepPlanet: openPlanet(); break;
        case kRepMorale: {
            // IMPROVED (I116): SCMorale's terms (s7:ECF8, findings/08 §2.7)
            // for the colony shown, worked out as the step does them.
            const sim::Colony* c = m_sim->db().get<sim::Colony>(m_colony);
            if (!c) break;
            int plus = 0, minus = 0, tok = 0;
            for (sim::Handle th : c->tiles.order()) {
                const sim::Tile* t = m_sim->db().get<sim::Tile>(th);
                const sim::Building* b = t ? m_sim->db().get<sim::Building>(t->building) : nullptr;
                if (!b || b->state != sim::Building::kOperational) continue;
                const int v = b->moraleEffect(*m_sim);
                (v < 0 ? minus : plus) += v;
            }
            for (const sim::Tile* t1 : m_sim->colonyTilesInGroup(*c, 41, false))
                for (sim::Handle th : c->tiles.order()) {
                    const sim::Tile* t = m_sim->db().get<sim::Tile>(th);
                    const sim::Building* b = t ? m_sim->db().get<sim::Building>(t->building) : nullptr;
                    if (!t || !b || t->level != t1->level || m_data.groups.contains(48, b->type)) continue;
                    if (sim::Simulation::tileDistance(*t1, *t) <= 5) ++tok;
                }
            int hostility = m_sim->planetHostility();
            if (hostility <= 1) hostility = 0;
            const int d = m_sim->difficulty();
            if (d <= 2) hostility -= hostility >= 7 ? 2 : hostility >= 4 ? 1 : 0;
            else if (d == 3 && hostility >= 7) --hostility;
            const int edu = c->education > 50 ? 1 : c->education < 50 ? -1 : 0;
            const int net = plus + minus + edu + c->crime / 10 - hostility - tok + c->crowdingMorale;
            auto sgn = [](int v) { return (v > 0 ? "+" : "") + std::to_string(v); };
            std::string txt = "Morale " + fmt(long(c->morale)) + " of 1000, about " + sgn(net) + " a turn:\n";
            txt += "  Crowding (people per UG Residence): " + sgn(c->crowdingMorale) +
                   (c->crowdingMorale <= -10 ? "   <- build UG Residences: below 25 people each gives +1" : "") + "\n";
            txt += "  Buildings (parks, rec, domes...): +" + std::to_string(plus) + "  " + std::to_string(minus) + "\n";
            txt += "  Near a Tokamak (within 5): " + sgn(-tok) + "\n";
            txt += "  Education " + fmt(long(c->education)) + ": " + sgn(edu) + "\n";
            txt += "  Planet hostility: " + sgn(-hostility) + "\n";
            txt += "  Crime " + fmt(long(c->crime)) + ": " + sgn(c->crime / 10) + "\n";
            txt += "Deaths, starving and events come on top.";
            m_message = Message{"Morale Factors", txt};
            break;
        }
        default:
            if (cmd >= kSurface && cmd <= kLevel4) setLevel(int16_t(cmd - kSurface));
            break;
    }
    return Next::Stay;
}

void Game::save(const std::filesystem::path& file) {
    const auto bytes = sim::writeOps(*m_sim);
    std::ofstream f(file, std::ios::binary);
    f.write(reinterpret_cast<const char*>(bytes.data()), std::streamsize(bytes.size()));
    m_status = f ? "Saved to " + file.filename().string() : "Could not save to " + file.string();
    if (f) m_saveFile = file;
}

void Game::click(int x, int y) {
    const auto cell = m_map.cellAt(x, y);
    const uint16_t type = m_panel.selected();
    if (!cell) return;
    if (!type) {
        // A click on a building opens its window.
        if (const sim::Tile* t = buildingTileAt(x, y)) openBuildingWindow(*t);
        return;
    }
    placeAt(type, cell->x, cell->y);
    if (type == 10) {
        m_panel.clearSelection();
        m_map.clearGhost();
    }
}

const sim::Tile* Game::buildingTileAt(int x, int y) {
    const auto cell = m_map.cellAt(x, y);
    sim::Grid* g = m_sim->gridOfSite(m_map.site());
    if (!cell || !g) return nullptr;
    const sim::Tile* t = m_sim->db().get<sim::Tile>(g->tileAt(*cell));
    const sim::Building* b = t ? m_sim->db().get<sim::Building>(t->building) : nullptr;
    return b && b->type > 9 ? t : nullptr;
}

std::string Game::tileLabel(const sim::Tile& t) {
    const sim::Building* b = m_sim->db().get<sim::Building>(t.building);
    return (b ? nameOf(b->type) : std::string("?")) + " (" + fmt(t.x) + ", " + fmt(t.y) + ")";
}

void Game::tileCommand(int cmd) {
    sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    if (!t) return;
    switch (cmd) {
        case kDescribe: openBuildingWindow(*t); break;
        case kRouting:
            m_routeBackup = t->route;
            reopenTransit();
            break;
        case kAssignTrucks: openTrucks(); break;
        case kTransfer:
            // IMPROVISED (I34): Transfer Assets (dialog 6208) is not
            // decoded yet.
            m_message = Message{"Transfer Assets", "Not available yet in the rebuild."};
            break;
        case kTileHelp: command(kHelp); break;
        default: break;
    }
}

// Transit Information (dialog 6213): the tile's truck route.
void Game::reopenTransit() {
    sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    if (!t) return;
    openDialog(kDlgTransit);
    if (!m_dialog) return;
    m_dialog->values[kTitle] = tileLabel(*t);
    auto& list = m_dialog->lists[kRouteList];
    for (sim::Handle h : t->route)
        if (const sim::Tile* stop = m_sim->db().get<sim::Tile>(h)) list.push_back(tileLabel(*stop));
    if (list.empty()) list.push_back("(no route)");
}

// IMPROVISED (I34): the Assign Trucks dialog's own code (6220) is not
// decoded. A tile gets trucks from the colony's free trucks: the truck
// units on its tiles less the trucks already assigned to other tiles.
int16_t Game::freeTrucks(const sim::Tile& self) {
    const sim::Colony* c = m_sim->db().get<sim::Colony>(self.colony);
    if (!c) return 0;
    int32_t units = 0, assigned = 0;
    for (sim::Handle h : c->tiles.order())
        if (const sim::Tile* t = m_sim->db().get<sim::Tile>(h)) {
            units += sim::countUnits(*m_sim, *t, sim::product::Truck);
            if (t->self != self.self) assigned += t->trucks;
        }
    // Trucks out on a trip are off their home tile's count (s8:1C3E) and
    // come back to it when the trip ends (vehicles.cpp), so they are still
    // assigned: without this they could be handed out a second time.
    for (const auto& trip : m_sim->trips())
        if (const sim::Tile* home = trip ? m_sim->db().get<sim::Tile>(trip->home) : nullptr;
            home && home->colony == self.colony)
            assigned += trip->trucks;
    return static_cast<int16_t>(std::max<int32_t>(0, units - assigned));
}

void Game::openTrucks() {
    sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    if (!t) return;
    m_trucksDraft = t->trucks;
    openDialog(kDlgTrucks);
    if (!m_dialog) return;
    m_dialog->values[kTitle] = tileLabel(*t);
    showTrucks();
}

void Game::showTrucks() {
    sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    if (!t || !m_dialog) return;
    m_dialog->values[kAssigned] = fmt(m_trucksDraft);
    m_dialog->values[kAvailable] = fmt(freeTrucks(*t) - m_trucksDraft);
}

void Game::addLeg(int x, int y) {
    sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    const sim::Tile* stop = buildingTileAt(x, y);
    if (t && stop) t->route.push_back(stop->self);
    m_addLeg = false;
    m_status.clear();
    reopenTransit();
}

void Game::describeTile(const sim::Tile& t) { openBuildingWindow(t); }

void Game::openDialog(uint16_t id) {
    if (id == kDlgTrade) return openTrade();                       // scripted runs: --dialog 9500
    if (id == kDlgInterview) return openInterview();
    auto t = data::DialogTemplate::load(m_data.exe, id);
    if (!t) return;
    if (id == 4027) addTerrainPackOption(*t);
    if (id == kDlgDig) {
        // IMPROVED (I114): the four ways as they lie on the screen (the map
        // is turned: north, y - 1, is up and to the right), each saying so;
        // the window widens to fit.
        auto* n = t->control(4013), *so = t->control(4014), *e = t->control(4015), *w = t->control(4016);
        if (n && so && e && w) {
            const int16_t left = std::min({n->x, so->x, e->x, w->x}), right = std::max({n->x, so->x, e->x, w->x});
            const int16_t top = std::min({n->y, so->y, e->y, w->y}), bottom = std::max({n->y, so->y, e->y, w->y});
            const int16_t grow = 34;
            for (auto& c : t->controls) {
                if (c.x > left + 4 && c.id != 1 && c.id != 2 && c.id != kDigFill) c.x = int16_t(c.x + grow);
                if (c.className == "BUTTON" && (c.style & 0xF) == 7) c.cx = int16_t(c.cx + 2 * grow);   // the group boxes
            }
            const int16_t r2 = int16_t(right + grow);
            w->x = left;  w->y = top;    w->text = "West (up-left)";
            n->x = r2;    n->y = top;    n->text = "North (up-right)";
            so->x = left; so->y = bottom; so->text = "South (down-left)";
            e->x = r2;    e->y = bottom; e->text = "East (down-right)";
            for (auto* c : {n, so, e, w}) c->cx = int16_t(c->cx + grow);
            t->cx = int16_t(t->cx + 2 * grow);
        }
    }
    m_dialog = std::make_unique<Dialog>(std::move(*t));
    m_dialogId = id;
    m_wide = false;
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    m_dialog->centreIn({0, 0, w, h});
    fillDialog();
    SDL_StartTextInput();
}

void Game::openReport(int cmd) { command(cmd); }

void Game::pressDialog(int id) {
    if (m_question) {                                   // scripted: 1 Yes, anything else No
        auto q = std::move(*m_question);
        m_question.reset();
        if (id == 1 && q.yes) q.yes();
        return;
    }
    if (m_planet) {                                     // scripted: the planet window's buttons and rows
        if (id < 0) {
            m_planet->selectRow(-id - 1);
            return;
        }
        const auto r = m_planet->press(id);
        if (r == PlanetWindow::Result::Go) goToSite(m_planet->chosenSite());
        if (r != PlanetWindow::Result::None) m_planet.reset();
        return;
    }
    if (m_research) {                                   // scripted: the research tree's buttons and rows
        if (id < 0) m_research->selectRow(-id - 1);
        else if (m_research->press(id) != ResearchWindow::Result::None) closeTopics();
        return;
    }
    if (!m_dialog) return;
    if (id < 0) {                                       // scripted: row -id - 1 of the first list
        if (!m_dialog->lists.empty()) m_dialog->selected[m_dialog->lists.begin()->first] = -id - 1;
        return;
    }
    if (m_dialog->rectOf(uint16_t(id))) dialogCommand(id);
}

// IMPROVED (I123): the morale crisis (registry 0x2C, s8:008E) asks the
// Commander for an interview; v1.51 shows dialog 459 (s8:CB5C, fem9) with
// five answers (buttons 461..465 from DGROUP 0xD0E), and an answer is kept
// as the crisis' response (s2:EB74) and spoken: one of the answer's voice
// lines (DGROUP 0xD04 + 16n: a dword count, then the lines), picked by the
// draw of s3:C312 (rand here). The rebuild had no such window: the answer
// labels become the buttons.
void Game::openInterview() {
    m_interviewDue = false;
    auto t = data::DialogTemplate::load(m_data.exe, kDlgInterview);
    if (!t) return;
    static const char* kAnswers[5] = {"No Comment", "Make an Appointment", "Consent to Interview",
                                      "Interview Immediately", "Generic Press Release"};
    for (auto& c : t->controls)
        for (int i = 0; i < 5; ++i)
            if (c.className == "STATIC" && c.text == kAnswers[i]) {
                c.className = "OPButton";
                c.id = uint16_t(kFirstAnswer + i);
                c.style = 0;
            }
    // The question is wider than the template in the rebuild's font.
    constexpr int16_t kGrow = 70;
    for (auto& c : t->controls) {
        if (c.id == 460) c.cx = int16_t(c.cx + kGrow);
        else c.x = int16_t(c.x + kGrow / 2);
    }
    t->cx = int16_t(t->cx + kGrow);
    m_dialog = std::make_unique<Dialog>(std::move(*t));
    m_dialogId = kDlgInterview;
    m_wide = false;
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    m_dialog->centreIn({0, 0, w, h});
    m_media.audio.stopWave();
    m_media.audio.playVoice(9);                                    // fem9
}

void Game::dialogCommand(int id) {
    if (m_dialogId == kDlgTrade) return tradeCommand(id);
    if (m_dialogId == kDlgInterview) {
        if (id < kFirstAnswer || id > kFirstAnswer + 4) return;   // it has to be answered
        const uint16_t n = uint16_t(id - kFirstAnswer + 1);
        m_sim->moraleCrisis().response = n;
        const auto d = m_data.exe.dgroup();
        const size_t row = 0xD04 + 16u * n;
        if (row + 16 <= d.size()) {
            const uint32_t count = uint32_t(d[row] | d[row + 1] << 8 | d[row + 2] << 16 | uint32_t(d[row + 3]) << 24);
            if (count > 0 && count <= 6) {
                const size_t at = row + 4 + 2 * size_t(std::rand() % int(count));
                m_media.audio.stopWave();
                m_media.audio.playVoice(uint16_t(d[at] | d[at + 1] << 8));
            }
        }
        m_dialog.reset();
        SDL_StopTextInput();
        return;
    }
    if (m_dialogId == kDlgTransit) {
        sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
        switch (id) {
            case kDeleteRoute:
                if (t) t->route.clear();
                reopenTransit();
                return;
            case kDeleteLeg:
                if (t && !t->route.empty()) t->route.pop_back();
                reopenTransit();
                return;
            case kAddLeg:
                m_dialog.reset();
                m_addLeg = true;
                m_status = "Click the next stop of the route (right click to stop).";
                return;
            case kTrucksButton: openTrucks(); return;
            case 2:
                if (t) t->route = m_routeBackup;
                break;
            default: break;
        }
    }
    if (m_dialogId == kDlgTrucks) {
        sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
        if (id == kSpin && t) {
            m_trucksDraft = std::clamp<int16_t>(int16_t(m_trucksDraft + m_dialog->spin), 0, freeTrucks(*t));
            showTrucks();
            return;
        }
        if (id == 1 && t) {
            // A tile holds at most +0x32 trucks (s7:6C4C).
            t->field32 = std::max(t->field32, m_trucksDraft);
            t->trucks = m_trucksDraft;
        }
    }
    if ((id == kResources || id == kMore) && m_dialog) {
        // "Resources>>" (a building's resource table) and "More>>" (Colony
        // Totals' second column): the window widens to show the controls
        // that lie beyond its template width. IMPROVISED (I42): the
        // buttons' code is not decoded; a second press narrows the window
        // again, and the labels "<<Resources" and "<<Less" are the rebuild's.
        m_wide = !m_wide;
        m_dialog->setWidthDlu(m_wide ? m_dialog->fullWidthDlu() : m_dialog->widthDlu());
        int w, h;
        SDL_GetRendererOutputSize(m_ren, &w, &h);
        const SDL_Rect r = m_dialog->rect();
        if (r.x + r.w > w) m_dialog->moveTo(std::max(0, w - r.w), r.y);
        if (id == kResources) m_dialog->values[kResources] = m_wide ? "<<Resources" : "Resources>>";
        else m_dialog->values[kMore] = m_wide ? "<<Less" : "More>>";
        return;
    }
    if (id == kTopicButton) {
        openTopics();
        return;
    }
    if (m_dialogId == kDlgFactory && id == 6000) return;              // a row of the product list
    if (m_dialogId == kDlgFactory && id == 1) {
        // s9:4CF4: OK sets the chosen product (s3:AE92).
        const int row = m_dialog->selected.count(6000) ? m_dialog->selected.at(6000) : -1;
        if (const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile))
            if (sim::Building* b = m_sim->db().get<sim::Building>(t->building))
                if (row >= 0 && size_t(row) < m_factoryList.size() && (m_factoryList[size_t(row)] & kProductBRow)) {
                    const uint16_t pb = uint16_t(m_factoryList[size_t(row)] & ~kProductBRow);
                    if (b->opsProductB != pb && sim::setFactoryProductB(*m_sim, *b, pb))
                        m_status = nameOf(b->type) + " now makes " + productBName(pb) + ".";
                } else if (row >= 0 && size_t(row) < m_factoryList.size() && m_factoryList[size_t(row)] != b->opsProductA &&
                    m_factoryList[size_t(row)] != 0) {
                    if (sim::setFactoryProduct(*m_sim, *b, m_factoryList[size_t(row)]))
                        m_status = nameOf(b->type) + " now makes " + productName(m_factoryList[size_t(row)]) + ".";
                    collectNotices();
                }
        closeDialog(id);
        return;
    }
    if (m_dialogId == kDlgPolice && (id == kBenevolent || id == kHostile)) {
        // The police mode (registry 0x3A +0x0A, s8:AF40): 2 benevolent,
        // 1 hostile, as the sim reads it (s5:D4CA morale, s6:5A94 crime).
        if (const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile))
            if (auto* cop = dynamic_cast<sim::PoliceBuilding*>(m_sim->db().get<sim::Building>(t->building)))
                cop->mode = id == kHostile ? 1 : 2;
        return;
    }
    if (m_dialogId == kDlgName && m_naming) {
        m_naming = false;
        if (id == 1 && !m_dialog->edit.empty()) {
            if (sim::Colony* c = m_sim->db().get<sim::Colony>(landing() ? kColony1 : m_colony)) c->name = m_dialog->edit;
            if (sim::Site* s = m_sim->db().get<sim::Site>(m_map.site())) s->name = m_dialog->edit;
        }
        closeDialog(id);
        return;
    }
    if (m_dialogId == kDlgName && id == 1) {
        std::string name = m_dialog->edit;
        name.erase(std::remove_if(name.begin(), name.end(),
                                  [](char c) { return c == '/' || c == '\\' || c == ':' || c == '.'; }),
                   name.end());
        if (!name.empty()) save(m_saveDir / (name + ".OPS"));
    }
    if (m_dialogId == kDlgPreferences && id == 1) {
        m_prefs.tileAnimations = m_dialog->checked.count(4059) != 0;
        m_prefs.music = m_dialog->checked.count(4061) != 0;
        m_prefs.soundEffects = m_dialog->checked.count(4062) != 0;
        m_prefs.animatedSequences = m_dialog->checked.count(4060) != 0;
        m_prefs.terrainPacks = m_dialog->checked.count(kTerrainPacksBox) != 0;
        m_prefs.save(m_saveDir);
    }
    if (m_dialogId == kDlgPreferences && ((id >= 4059 && id <= 4062) || id == kTerrainPacksBox)) return;
    if (m_dialogId == kDlgPreferences && id == kMusicVolume) {        // I95: heard at once
        m_prefs.musicVolume = m_dialog->sliders[kMusicVolume];
        return;
    }
    if (m_dialogId == kDlgPreferences && id == 2) m_prefs.musicVolume = m_prefsVolumeBefore;   // Cancel
    if (m_dialogId == kDlgDig) {
        if (id >= kDigDown && id <= kDigWest) return;          // a radio
        const PendingDig d = m_dig;
        uint16_t dir = 0;
        if (id == 1)
            for (uint16_t r = kDigDown; r <= kDigWest; ++r)
                if (m_dialog->checked.count(r)) dir = uint16_t(1 + r - kDigDown);
        if (id == kDigFill) {
            dir = 6;
            m_media.audio.playVoice(172);                       // s8:C836: add32
        }
        closeDialog(id);
        if (dir) placeAt(d.type, d.x, d.y, dir);
        return;
    }
    if (m_dialogId == kDlgPreferences && id == 6193) {
        m_dialog->checked = {4059, 4060, 4061, 4062};
        m_dialog->sliders[kMusicVolume] = m_prefs.musicVolume = 80;
        return;
    }
    if (id == kDlgHelp) {
        command(kHelp);
        return;
    }
    // IMPROVISED (I126): v1.51 has no code behind Needs (6192), Details...
    // (6180), Master (234) and Robot Command's Details (503) and Help (500);
    // the rebuild gives them a use.
    if (id == 6192 || id == 234 || id == 503 || id == 500) {
        m_message = buildingButtonText(id);
        return;
    }
    if (id == 6180) {                                   // Executive Summary: the colony's totals
        command(kRepTotals);
        return;
    }
    closeDialog(id);
}

// IMPROVISED (I33): the report dialogs' own code (which fills their
// controls) is not decoded; the values come from the rebuild's model.
void Game::fillDialog() {
    if (!m_dialog) return;
    auto& v = m_dialog->values;
    if (m_dialogId == kDlgTurns) {
        m_dialog->edit = "5";
        return;
    }
    if (m_dialogId == kDlgPreferences) {
        if (m_prefs.tileAnimations) m_dialog->checked.insert(4059);
        if (m_prefs.animatedSequences) m_dialog->checked.insert(4060);
        if (m_prefs.terrainPacks) m_dialog->checked.insert(kTerrainPacksBox);
        m_dialog->sliders[kMusicVolume] = m_prefsVolumeBefore = m_prefs.musicVolume;
        if (m_prefs.music) m_dialog->checked.insert(4061);
        if (m_prefs.soundEffects) m_dialog->checked.insert(4062);
        m_dialog->replaceText("Press CTRL-BREAK to exit animated scenes.", "Press ESC to skip animated scenes.");   // I49
        // s9:18A2: with a game running the "Difficulty Level" box reads
        // "Difficulty is " (1572) + Beginner..Difficult (1568..1571) and
        // "Trucking is " (1573) + Automatic (1574) or Manual (1575).
        if (const int d = m_sim->difficulty(); d != 0) {
            m_dialog->values[4064] = m_data.strings.get(1572) + m_data.strings.get(uint16_t(d >= 1 && d <= 4 ? 1567 + d : 1568));
            m_dialog->values[4063] = m_data.strings.get(1573) + m_data.strings.get(m_sim->autoTrucking() ? 1574 : 1575);
        }
        return;
    }
    if (m_dialogId == kDlgName) {
        m_dialog->edit = m_saveFile.empty() ? "COLONY" : m_saveFile.stem().string();
        return;
    }
    const sim::Colony* c = m_sim->db().get<sim::Colony>(m_colony);
    if (!c) return;
    const auto& p = c->population;
    if (m_dialogId == kDlgPopulation) {
        v[6020] = fmt(p.group(3) + p.group(4));          // workforce
        v[6021] = "-";
        v[6195] = fmt(p.group(1));                        // infants
        v[6194] = fmt(p.group(2));                        // students
        v[6196] = fmt(p.group(3) + p.group(4));           // workers
        v[6197] = "-";
        v[6198] = fmt(p.group(5));                        // retired
        v[6199] = fmt(sim::countUnits(*m_sim, *m_sim->db().get<sim::Tile>(c->hub), sim::product::HumanoidWorkers));
    } else if (m_dialogId == kDlgExecutive) {
        int domes = 0, mines = 0, factories = 0, all = 0, power = 0, powerUsed = 0, residences = 0;
        for (sim::Building* b : m_sim->db().allOf<sim::Building>(sim::ObjType::Building)) {
            const sim::Tile* t = b->tile(*m_sim);
            if (!t || t->colony != m_colony || b->type <= 9) continue;
            ++all;
            if (b->cls == sim::BuildingClass::AgriDome) ++domes;
            if (b->cls == sim::BuildingClass::Mine) ++mines;
            if (b->cls == sim::BuildingClass::Factory) ++factories;
            if (b->isPowerSource()) ++power;
            if (b->isPowerSource() && b->state == sim::Building::kOperational) ++powerUsed;
            if (b->type == 79 || b->type == 80 || b->type == 81) ++residences;
        }
        v[6011] = fmt(power);                              // power facilities
        v[6074] = fmt(powerUsed);                          // ... of them running
        v[6001] = fmt(c->total[data::res::Power]);         // power made
        v[6075] = fmt(c->available(data::res::Power));     // not yet allocated
        v[6181] = fmt(p.total());
        v[6022] = fmt(residences);
        v[6023] = "-";
        v[6006] = m_sim->terraforming().atmosphere == 2 ? "Breathable" : "Unbreatheable";
        v[6007] = "-";
        v[6005] = m_sim->terraforming().atmosphere == 1 ? "In progress" : m_sim->terraforming().atmosphere == 2 ? "Done" : "None";
        v[6012] = fmt(domes);
        v[6013] = "-";
        v[6014] = fmt(c->total[data::res::Food]);
        v[6038] = fmt(mines);
        int32_t smelted = 0, raw = 0;
        for (int r = data::res::OreA; r <= data::res::OreMinC; ++r) raw += c->total[size_t(r)];
        for (int r = data::res::MetalA; r <= data::res::FusionC; ++r) smelted += c->total[size_t(r)];
        v[6015] = fmt(smelted);
        v[6076] = fmt(raw);
        v[6018] = fmt(factories);
        v[6016] = fmt(c->total[data::res::Luxury]);
        v[6017] = fmt(c->morale);
        v[6019] = fmt(c->prevMorale);
    } else if (m_dialogId == kDlgTotals) {
        int row = 0;
        for (int id = 1; id <= 36 && row < 40; ++id) {
            const std::string n = resourceName(id);
            if (n.empty()) continue;
            v[kTotName[row]] = n;
            v[kTotValue[row]] = fmt(c->total[size_t(id)]);
            ++row;
        }
    } else if (m_dialogId == kDlgDiscoveries) {
        const sim::Player* pl = m_sim->playerOf(c);
        auto& list = m_dialog->lists[6182];
        if (pl)
            for (const auto& topic : m_data.research.topics())
                if (topic.id < pl->remaining.size() && pl->remaining[topic.id] == 0 && topic.id != 112 &&
                    topic.id != 113 && topic.parent != -1)                 // not the trees' roots ("Top")
                    list.push_back(topic.name);
        if (list.empty()) list.push_back("(none yet)");
    }
}

void Game::closeDialog(int id) {
    const uint16_t which = m_dialogId;
    const std::string edit = m_dialog ? m_dialog->edit : std::string();
    m_dialog.reset();
    SDL_StopTextInput();
    if (which == kDlgTurns && id == 1) {
        const int n = std::atoi(edit.c_str());
        if (n > 0 && !landing()) runTurns(std::min(n, 500));
    }
}

// ── Building windows ──────────────────────────────────────────────────────

// IMPROVISED (I33): which window a building opens follows its class; the
// original's choice (the building's slot for its window) is not decoded.
void Game::openBuildingWindow(const sim::Tile& t) {
    const sim::Building* b = m_sim->db().get<sim::Building>(t.building);
    if (!b) return;
    m_routeTile = t.self;
    uint16_t id = kDlgStructure;
    using C = sim::BuildingClass;
    if (b->state == sim::Building::kConstructing) id = kDlgConstruction;
    else if (b->cls == C::Factory || dynamic_cast<const sim::FactoryBuilding*>(b)) id = kDlgFactory;
    else if (dynamic_cast<const sim::LabBuilding*>(b)) id = kDlgLab;
    else if (b->cls == C::Mine) id = kDlgMine;
    else if (dynamic_cast<const sim::WarehouseBuilding*>(b)) id = kDlgWarehouse;
    else if (dynamic_cast<const sim::StorageBuilding*>(b)) id = kDlgTank;
    else if (dynamic_cast<const sim::RoboCmdBuilding*>(b)) id = kDlgRobotCmd;
    else if (dynamic_cast<const sim::PoliceBuilding*>(b)) id = kDlgPolice;
    else if (dynamic_cast<const sim::TerraFormBuilding*>(b)) id = kDlgTerraform;
    openDialog(id);
    if (!m_dialog) return;
    fillBuilding();
}

void Game::fillResourceTable(const sim::Building& b) {
    // The type's needs: the BLDGBLD record while it is built, else BLDGOPS.
    const bool building = b.state == sim::Building::kConstructing;
    const auto& need = building ? b.buildInfo.need : b.opsInfo.need;
    // IMPROVED (I62): beside each need, what the building's tile holds
    // ("need / held"), so stock, food and power can be seen.
    const sim::Tile* t = b.tile(*m_sim);
    m_dialog->replaceText("Resources Needed", "Needed / Held");
    for (int i = 0; i < 20; ++i) {
        const int id = 17 + i;
        const std::string n = resourceName(id);
        m_dialog->values[kResName[i]] = n;
        const long held = t ? long(t->bas.get(id)) : 0;
        m_dialog->values[kResValue[i]] = n.empty() ? std::string() : fmt(need[size_t(id)]) + " / " + fmt(held);
    }
}

void Game::fillBuilding() {
    const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    const sim::Building* b = t ? m_sim->db().get<sim::Building>(t->building) : nullptr;
    if (!m_dialog || !b) return;
    auto& v = m_dialog->values;
    const std::string name = nameOf(b->type);
    // IMPROVED (I108): a broken building says so ("Breakdown Status:").
    const int16_t repair = sim::repairLeft(*m_sim, *b);
    const std::string state = repair >= 0 ? "Broken down" : stateText(b->state);
    const std::string breakdown = repair >= 0 ? "Broken: " + fmt(long(repair)) + " repair turns left" : "Normal";
    const bool reached = (b->flags & sim::Building::kReachedByLife) != 0;
    std::string staff = b->state == sim::Building::kOperational ? "Fully staffed" : reached ? "Waiting" : "Not connected";
    // IMPROVED (I101): below ground the network reaches a level only
    // through an Air Shaft's lower end (a UG core, group 46, s8:58E6) whose
    // top is connected; say which part is missing.
    std::string hint;
    if (!reached && b->state != sim::Building::kOperational && t->level > 0 && b->type > 9) {
        const sim::Colony* c = m_sim->db().get<sim::Colony>(t->colony);
        bool shaft = false, shaftLive = false;
        if (c)
            for (sim::Handle th : c->tiles.order())
                if (const sim::Tile* u = m_sim->db().get<sim::Tile>(th); u && u->level == t->level)
                    if (const sim::Building* ub = m_sim->db().get<sim::Building>(u->building); ub && ub->type == 106) {
                        shaft = true;
                        if (ub->flags & sim::Building::kReachedByLife) shaftLive = true;
                    }
        if (!shaft) {
            staff = "No Air Shaft";
            hint = "Nothing reaches this level: dig an Air Shaft (a RoboDigger set to Dig Down on the surface, "
                       "next to a tube) and join its lower end to these buildings with UG tubes.";
        } else if (!shaftLive) {
            staff = "Shaft cut off";
            hint = "This level's Air Shaft is not connected on the surface: join its top to the colony with tubes.";
        } else {
            staff = "Not tubed to shaft";
            hint = "Join this building to the Air Shaft with UG tubes (an L or R tube conducts only along its line).";
        }
    }
    // IMPROVED (I101): what a Red Light District (101) needs to raise
    // children: running (2 Luxury a turn from a warehouse, s6:5B42), and
    // residences with room (s6:A4EE grows nobody at 100 people each, or with
    // none).
    if (hint.empty() && b->type == 101)
        if (const sim::Colony* c = m_sim->db().get<sim::Colony>(t->colony)) {
            int homes = 0;
            for (const sim::Tile* r : m_sim->colonyTilesInGroup(*c, 14)) homes += r ? 1 : 0;
            if (b->state != sim::Building::kOperational)
                hint = "A Red Light District runs on 2 Luxury a turn from a warehouse (Light Industry makes it); "
                       "without it no children come.";
            else if (homes == 0 || c->population.total() / std::max(1, homes) >= 100)
                hint = "Children come only while the residences have room: build more UG Residences.";
        }
    if (!hint.empty() && (m_log.empty() || m_log.back() != hint)) m_log.push_back(hint);
    m_dialog->setCaption(name);
    fillResourceTable(*b);
    switch (m_dialogId) {
        case kDlgStructure:
            v[6008] = name;
            v[6079] = name;
            v[6004] = state;
            v[6003] = staff;
            v[6078] = b->opsProductA ? productName(b->opsProductA) : "None";
            v[6077] = b->state == sim::Building::kOperational ? "Normal" : "-";
            break;
        case kDlgConstruction:
            v[6008] = name;
            v[6079] = name;
            v[6004] = state;
            v[6201] = fmt(b->buildInfo.word94);
            // IMPROVED (I115): a turn counts only when the colony can pay that
            // turn's needs (s6:BE9E); say what holds it up.
            if (const sim::Colony* c = m_sim->db().get<sim::Colony>(t->colony);
                c && b->state == sim::Building::kConstructing && !c->freeResources && !c->nanotech) {
                std::string lack;
                for (int r = data::res::MetalA; r <= data::res::People; ++r) {
                    const int32_t want = b->buildInfo.need[size_t(r)];
                    if (want > 0 && c->available(r) < want)
                        lack += (lack.empty() ? "" : ", ") + resourceName(uint16_t(r)) + " (" +
                                fmt(long(c->available(r))) + " of " + fmt(long(want)) + ")";
                }
                if (!lack.empty()) {
                    v[6004] = "Waiting";
                    const std::string why = name + " is waiting for: " + lack + ". Its turns count only while the colony can pay them.";
                    if (m_log.empty() || m_log.back() != why) m_log.push_back(why);
                }
            }
            break;
        case kDlgFactory: {
            const auto* f = dynamic_cast<const sim::FactoryBuilding*>(b);
            v[6008] = name;
            // s9:4A0A: the products this factory can make (s3:DEBE), the
            // current one selected (s9:4CB2); with none, a "None" row first.
            auto& list = m_dialog->lists[6000];
            m_factoryList = sim::factoryProducts(*m_sim, *b);
            // IMPROVISED (I96): a UG factory also offers the second list
            // (consumer goods, s3:DEBE kind 7), first.
            if (sim::makesConsumerGoods(*b)) {
                const auto bs = sim::factoryProductsB(*m_sim, *b);
                std::vector<uint16_t> rows;
                for (uint16_t pb : bs) rows.push_back(uint16_t(kProductBRow | pb));
                m_factoryList.insert(m_factoryList.begin(), rows.begin(), rows.end());
            }
            const uint16_t current = b->opsProductB ? uint16_t(kProductBRow | b->opsProductB) : b->opsProductA;
            const auto at = std::find(m_factoryList.begin(), m_factoryList.end(), current);
            if (at == m_factoryList.end()) m_factoryList.insert(m_factoryList.begin(), current);
            for (uint16_t p : m_factoryList)
                list.push_back((p & kProductBRow) ? productBName(uint16_t(p & ~kProductBRow))
                               : p ? productName(p) : m_data.strings.get(1329));
            m_dialog->selected[6000] =
                int(std::find(m_factoryList.begin(), m_factoryList.end(), current) - m_factoryList.begin());
            v[6002] = f ? fmt(f->progress) + " %" : "-";
            v[6003] = staff;
            v[6004] = state;
            v[6009] = breakdown;
            v[6010] = b->state == sim::Building::kSuspended ? "Shortage" : "Adequate";
            break;
        }
        case kDlgLab: {
            const auto* lab = dynamic_cast<const sim::LabBuilding*>(b);
            v[6025] = name;
            const auto* topic = lab ? m_data.research.find(lab->topic) : nullptr;
            v[6026] = topic ? topic->name : "None";
            v[6003] = staff;
            v[6004] = state;
            v[6009] = breakdown;
            v[6010] = b->state == sim::Building::kSuspended ? "Shortage" : "Adequate";
            break;
        }
        case kDlgMine: {
            v[6035] = name;
            const auto* m = dynamic_cast<const sim::MineBuilding*>(b);
            v[6036] = m ? "Yes" : "-";
            int32_t ore = 0;
            for (int r = data::res::OreLifeA; r <= data::res::OreMinC; ++r) ore += t->bas.get(r);
            v[6037] = fmt(ore);
            v[6004] = state;
            v[6009] = breakdown;
            v[6152] = fmt(m_sim->db().get<sim::Site>(t->owner) ? m_sim->db().get<sim::Site>(t->owner)->depth : 0);
            v[6153] = m ? fmt(m->life) : "-";
            int mines = 0;
            for (sim::Building* x : m_sim->db().allOf<sim::Building>(sim::ObjType::Building))
                if (x->cls == sim::BuildingClass::Mine) ++mines;
            v[6038] = fmt(mines);
            break;
        }
        case kDlgTank: {
            // The tank's contents: its tile's Bas ledger (s7:7C28).
            v[6149] = name;
            static constexpr uint16_t kAmount[18] = {6154, 6155, 6156, 6157, 6158, 6159, 6160, 6161, 6162,
                                                     6163, 6164, 6165, 6166, 6167, 6168, 6169, 6170, 6171};
            static constexpr uint16_t kAsset[18] = {6040, 6041, 6042, 6043, 6044, 6045, 6046, 6047, 6048,
                                                    6049, 6050, 6051, 6052, 6053, 6054, 6055, 6056, 6080};
            static constexpr uint16_t kMu[18] = {6057, 6058, 6059, 6060, 6061, 6062, 6063, 6064, 6065,
                                                 6066, 6067, 6068, 6069, 6070, 6071, 6072, 6073, 6107};
            for (int i = 0; i < 18; ++i) v[kAmount[i]] = v[kAsset[i]] = v[kMu[i]] = "";
            long total = 0;
            int row = 0;
            for (int id = 1; id <= 31 && row < 18; ++id) {          // materials, not MPG/Power/People
                const int32_t q = t->bas.get(id);
                const std::string n = resourceName(id);
                if (q == 0 || n.empty()) continue;
                v[kAmount[row]] = fmt(q);
                v[kAsset[row]] = n;
                v[kMu[row]] = fmt(q);
                total += q;
                ++row;
            }
            v[6178] = fmt(total);
            v[6179] = "-";
            break;
        }
        case kDlgWarehouse: {
            v[6149] = name;
            const auto* w = dynamic_cast<const sim::WarehouseBuilding*>(b);
            static constexpr uint16_t kAmount[20] = {6154, 6155, 6156, 6157, 6158, 6159, 6160, 6161, 6162, 6163,
                                                     6164, 6165, 6166, 6167, 6168, 6169, 6170, 6171, 6172, 0};
            static constexpr uint16_t kAsset[20] = {6040, 6041, 6042, 6043, 6044, 6045, 6046, 6047, 6048, 6049,
                                                    6050, 6051, 6052, 6053, 6054, 6055, 6056, 6080, 6081, 0};
            static constexpr uint16_t kMu[20] = {6057, 6058, 6059, 6060, 6061, 6062, 6063, 6064, 6065, 6066,
                                                 6067, 6068, 6069, 6070, 6071, 6072, 6073, 6107, 6109, 0};
            for (int i = 0; i < 19; ++i) {
                v[kAmount[i]] = "";
                v[kAsset[i]] = "";
                v[kMu[i]] = "";
            }
            int total = 0;
            if (w)
                for (size_t i = 0; i < w->items.size() && i < 19; ++i) {
                    v[kAmount[i]] = fmt(w->items[i].quantity);
                    v[kAsset[i]] = productName(w->items[i].productA ? w->items[i].productA : w->items[i].productB);
                    v[kMu[i]] = fmt(w->items[i].units);
                    total += w->items[i].units;
                }
            v[6178] = fmt(total);
            v[6179] = fmt(std::max(0, 100 - total));
            break;
        }
        case kDlgRobotCmd: {
            v[498] = name;
            v[6004] = state;
            v[6003] = staff;
            int used = 0;
            if (const auto* rc = dynamic_cast<const sim::RoboCmdBuilding*>(b))
                for (const auto& s : rc->slots)
                    if (s.expires) ++used;
            v[501] = "10";
            v[502] = fmt(used);
            break;
        }
        case kDlgPolice:
            if (const auto* cop = dynamic_cast<const sim::PoliceBuilding*>(b))
                m_dialog->checked.insert(cop->mode == 1 ? kHostile : kBenevolent);
            break;
        case kDlgTerraform: {
            const auto* tf = dynamic_cast<const sim::TerraFormBuilding*>(b);
            for (int i = 0; i < 5; ++i) v[uint16_t(349 + i)] = tf && tf->systems[size_t(i)] ? "ON" : "OFF";
            int active = 0, inactive = 0;
            for (sim::Building* x : m_sim->db().allOf<sim::Building>(sim::ObjType::Building))
                if (dynamic_cast<sim::TerraFormBuilding*>(x)) (x->state == sim::Building::kOperational ? active : inactive)++;
            v[355] = fmt(active);
            v[356] = fmt(inactive);
            v[357] = fmt(m_sim->terraforming().turnsLeft);
            v[6005] = m_sim->terraforming().atmosphere == 2 ? "Breathable" : "Unbreathable";
            break;
        }
        default:
            break;
    }
}

Message Game::buildingButtonText(int id) {
    const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    const sim::Building* b = t ? m_sim->db().get<sim::Building>(t->building) : nullptr;
    const sim::Colony* c = t ? m_sim->db().get<sim::Colony>(t->colony) : nullptr;
    if (!b || !c) return Message{"Outpost", "There is nothing to show."};
    const std::string name = nameOf(b->type);
    std::string text;
    if (id == 6192) {
        // Needs: each turn's needs (BLDGOPS, or BLDGBLD while it is built)
        // against what the colony can give.
        const bool building = b->state == sim::Building::kConstructing;
        const auto& need = building ? b->buildInfo.need : b->opsInfo.need;
        text = building ? "To finish building, each turn:" : "To run, each turn:";
        bool any = false, shortOf = false;
        for (int r = 0; r < int(need.size()); ++r) {
            if (need[size_t(r)] <= 0) continue;
            const std::string n = resourceName(uint16_t(r));
            if (n.empty()) continue;
            const long have = long(c->available(r));
            const bool lacks = have < need[size_t(r)];
            shortOf = shortOf || lacks;
            text += "\n  " + n + ": " + fmt(long(need[size_t(r)])) + " (colony has " + fmt(have) + ")" + (lacks ? "  SHORT" : "");
            any = true;
        }
        if (!any) text += "\n  nothing";
        if (b->type > 9 && !(b->flags & sim::Building::kReachedByLife))
            text += "\n\nIt is not connected to the Command Center by tubes, so it cannot run.";
        else if (shortOf)
            text += "\n\nWhile anything is short it waits.";
        return Message{name + " - Needs", text};
    }
    if (id == 234) {
        // Master: every building of this kind in the colony.
        const bool labs = m_dialogId == kDlgLab;
        int n = 0;
        for (sim::Handle th : c->tiles.order()) {
            const sim::Tile* u = m_sim->db().get<sim::Tile>(th);
            const sim::Building* x = u ? m_sim->db().get<sim::Building>(u->building) : nullptr;
            if (!x) continue;
            std::string job;
            if (labs) {
                const auto* lab = dynamic_cast<const sim::LabBuilding*>(x);
                if (!lab) continue;
                const auto* topic = m_data.research.find(lab->topic);
                job = topic && lab->topic ? topic->name : "no topic";
            } else {
                const auto* f = dynamic_cast<const sim::FactoryBuilding*>(x);
                if (!f) continue;
                job = x->opsProductB ? productBName(x->opsProductB) : x->opsProductA ? productName(x->opsProductA) : "idle";
                job += ", " + fmt(f->progress) + " %";
            }
            text += (n ? "\n" : "") + nameOf(x->type) + " (" + fmt(long(u->x)) + "," + fmt(long(u->y)) + "): " + job + " - " +
                    stateText(x->state);
            ++n;
        }
        if (!n) text = "None.";
        return Message{labs ? "All Laboratories" : "All Factories", text};
    }
    if (id == 503) {
        // Robot Command details: its ten slots.
        const auto* rc = dynamic_cast<const sim::RoboCmdBuilding*>(b);
        int n = 0;
        if (rc)
            for (const auto& s : rc->slots) {
                if (!s.expires) continue;
                const long left = long(s.expires) - long(m_sim->turn());
                text += (n ? "\n" : "") + productName(s.item) + ": " + (s.flag == 4 ? "returning as a kit" : s.flag == 0 ? "free" : "working") +
                        ", " + fmt(std::max(0L, left)) + " turns left";
                ++n;
            }
        if (!n) text = "No robots are controlled from here.";
        return Message{name + " - Robots", text + "\n\n" + fmt(long(10 - n)) + " of 10 control slots are free."};
    }
    // 500, Robot Command help.
    return Message{name + " - Help",
                   "A Robot Command controls up to 10 robots (dozers, diggers, miners, trucks and workers). Robot kits "
                   "in a warehouse become robots here, each for 200 turns. Without a working Robot Command no robot "
                   "can be built, and robots wear out."};
}

// IMPROVED (I110): the planet window (app/planet_window.hpp).
void Game::openPlanet() {
    if (landing()) {
        m_status = "Land the Seed first.";
        return;
    }
    // A game saved by v1.51 (or an older rebuild) kept only the landing
    // site: remake the planet's others first (I110).
    if (const sim::Site* s = m_sim->db().get<sim::Site>(m_map.site()))
        if (sim::Planet* p = m_sim->db().get<sim::Planet>(s->owner); p && m_sim->restoreSites(*p) > 0) {
            m_sites.clear();
            for (sim::Site* x : m_sim->db().allOf<sim::Site>(sim::ObjType::Site))
                if (m_sim->gridOfSite(x->self)) m_sites.push_back(x->self);
        }
    m_planet = std::make_unique<PlanetWindow>(*m_sim, m_pics, m_map.site(), m_landingSite);
}

// The colony screen turns to a site: to the player's colony there, if any
// (the build panel and robots follow it), else the site's middle, where a
// Command Center can found a colony for the colony run so far.
void Game::goToSite(sim::Handle site) {
    if (!m_sim->gridOfSite(site)) return;
    m_map.setSite(site);
    setLevel(0);
    const sim::Colony* here = nullptr;
    for (sim::Handle h : playerColonies())
        if (const sim::Colony* c = m_sim->db().get<sim::Colony>(h); c && c->owner == site) here = c;
    if (here) {
        m_colony = here->self;
        if (const sim::Tile* hub = m_sim->db().get<sim::Tile>(here->hub)) m_map.centreOn(hub->x, hub->y, mapArea());
        m_status = "Now running " + (here->name.empty() ? std::string("the colony") : here->name) + ".";
    } else {
        if (const sim::Grid* g = m_sim->gridOfSite(site)) m_map.centreOn(g->width() / 2.0f, g->height() / 2.0f, mapArea());
        const sim::Site* s = m_sim->db().get<sim::Site>(site);
        m_status = (s ? s->name : std::string("This site")) +
                   ": no colony of yours. A Command Center put down here founds one.";
    }
    m_panel.clearSelection();
    refreshBuildPanel();
}

// "Research Topic:" (control 6032 of the lab window): the research tree
// window (app/research_window.hpp; IMPROVED, I103, replacing I40's list).
// Its legend is dialog 4051's ("Color Legend") labels.
void Game::openTopics() {
    const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile);
    const sim::Building* b = t ? m_sim->db().get<sim::Building>(t->building) : nullptr;
    if (!b || !dynamic_cast<const sim::LabBuilding*>(b)) return;
    ResearchWindow::Legend legend;
    if (auto tmpl = data::DialogTemplate::load(m_data.exe, 4051))
        for (const auto& c : tmpl->controls) {
            if (c.text.empty()) continue;
            if (c.id == 4052) legend.notResearched = c.text;
            if (c.id == 4053) legend.completed = c.text;
            if (c.id == 4054) legend.current = c.text;
            if (c.id == 4055) legend.hotLab = c.text;
        }
    m_research = std::make_unique<ResearchWindow>(*m_sim, m_routeTile, "Research Tree: " + nameOf(b->type),
                                                  std::move(legend));
}

// Back to the lab window, showing the topic chosen.
void Game::closeTopics() {
    m_research.reset();
    if (const sim::Tile* t = m_sim->db().get<sim::Tile>(m_routeTile)) openBuildingWindow(*t);
}

} // namespace outpost::app
