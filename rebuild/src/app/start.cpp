#include "app/start.hpp"
#include "app/hd_sprites.hpp"

#include "sim/modern_galaxy.hpp"
#include "data/planet_facts.hpp"
#include "sim/building.hpp"

#include "data/ops_save.hpp"
#include "data/star_table.hpp"
#include "sim/ops_loader.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <fstream>
#include <iterator>

namespace outpost::app {

namespace {

// IMPROVED (I58): Weather Satellite (0x85), Interstellar Probe (0x86),
// Orbital Observer (0x88) and ULBI Probe (0x89) have no consumer in v1.51.
// (The Orbital Observer, 0x88, was here until I110 gave it a use: it
// surveys the planet's other sites for the planet window.)
// (The Interstellar Probe, 0x86, has its use in the Launch System, I124.)
bool isUnusedOrbital(uint16_t kind) { return kind == 0x85 || kind == 0x89; }

// Dialog ids and their controls (resources.txt).
constexpr uint16_t kDlgProgram = 4028, kDlgDifficulty = 4042, kDlgStars = 4029, kDlgStar = 4032,
                   kDlgShip = 4010, kDlgDestination = 4031, kDlgPlanet = 4048, kDlgPrefs = 4027,
                   kDlgLaunch = 358;
constexpr int kNewGame = 115, kIntroduction = 116, kLoadGame = 100, kPrefsButton = 110, kExitButton = 238;
constexpr int kBeginner = 278, kAutoTrucking = 282;
constexpr int kAddedStar = 900;     // IMPROVED (I92): the added stars' ids on the chart
constexpr int kFirstStar = 416, kLastStar = 436, kLaunch = 4017, kAiSelect = 4030, kProbes = 4018;
constexpr int kRemainingWeight = 4009, kRemainingFunds = 4008;
constexpr int kTileAnimations = 4059, kMusic = 4061, kSoundEffects = 4062, kAnimatedSequences = 4060;
// Controls of the rebuild's own windows (the original's are not decoded).
constexpr int kList = 1000;

bool inside(const SDL_Rect& r, int x, int y) { return x >= r.x && y >= r.y && x < r.x + r.w && y < r.y + r.h; }

// A window the rebuild draws with the dialog code: a list and buttons.
data::DialogTemplate listTemplate(const std::string& caption, const std::vector<std::pair<uint16_t, std::string>>& buttons,
                                  int16_t listHeight = 120) {
    data::DialogTemplate t;
    t.caption = caption;
    t.cx = 150;
    t.cy = static_cast<int16_t>(listHeight + 26);
    data::DialogTemplate::Control list;
    list.id = kList;
    list.className = "LISTBOX";
    list.x = 6;
    list.y = 4;
    list.cx = 138;
    list.cy = listHeight;
    t.controls.push_back(list);
    int16_t x = 6;
    for (const auto& [id, text] : buttons) {
        data::DialogTemplate::Control b;
        b.id = id;
        b.className = "OPButton";
        b.text = text;
        b.x = x;
        b.y = static_cast<int16_t>(listHeight + 8);
        b.cx = 44;
        b.cy = 14;
        t.controls.push_back(b);
        x = static_cast<int16_t>(x + 47);
    }
    return t;
}

std::string fmt(long v) { return std::to_string(v); }

// IMPROVED (I92): the star data as known today (sim/modern_galaxy.hpp).
const data::StarRecord* starRecord(const sim::GameData& data, const std::string& name) {
    if (const data::StarRecord* r = sim::modernStarRecord(name)) return r;
    return data.stars.byName(name);
}



} // namespace

StartFlow::StartFlow(SDL_Renderer* ren, Gfx& gfx, sim::GameData& data, const data::BuildingPictures& pics,
                     const data::GameFiles& files, std::filesystem::path saveDir, Preferences& prefs, Media& media)
    : m_ren(ren), m_gfx(gfx), m_data(data), m_pics(pics), m_files(files), m_saveDir(std::move(saveDir)),
      m_prefs(prefs), m_media(media) {
    m_ship.load(m_data.exe);
    toMenu();
}

SDL_Rect StartFlow::screen() const {
    int w, h;
    SDL_GetRendererOutputSize(m_ren, &w, &h);
    return {0, 0, w, h};
}

void StartFlow::backdrop(const std::string& file) { m_backdrop = file; }

void StartFlow::openDialog(uint16_t id) {
    m_side.reset();
    auto t = data::DialogTemplate::load(m_data.exe, id);
    if (!t) {
        m_dialog.reset();
        return;
    }
    if (id == kDlgPrefs) addTerrainPackOption(*t);
    m_dialog = std::make_unique<Dialog>(std::move(*t));
    m_dialogId = id;
    m_dialog->centreIn(screen());
}

void StartFlow::showMessage(std::string title, std::string text, std::function<void()> after) {
    m_message = Message{std::move(title), std::move(text)};
    m_afterMessage = std::move(after);
}

void StartFlow::ask(std::string title, std::string text, std::function<void()> yes) {
    m_question = Question{std::move(title), std::move(text), std::move(yes)};
}

std::string StartFlow::stageName() const {
    static const char* kNames[] = {"menu", "intro", "load", "prefs", "difficulty", "stars", "ship", "destination",
                                   "planets", "sites", "greeting", "name", "ainame", "launch"};
    return kNames[static_cast<int>(m_stage)];
}

// ── Screens ───────────────────────────────────────────────────────────────

void StartFlow::toMenu() {
    m_stage = Stage::Menu;
    m_sim.reset();
    m_newGame.reset();
    backdrop("1020.bmp");                          // the title picture
    music();
    m_media.audio.playSound(data::media::kMidiReset);   // s5:08B6: mode 1 plays 0wscinit.mid (dropped while music plays)
    openDialog(kDlgProgram);
    if (m_dialog) {
        const SDL_Rect s = screen();
        m_dialog->moveTo((s.w - m_dialog->rect().w) / 2, s.h - m_dialog->rect().h - 52 - m_gfx.lineHeight());
    }
}

void StartFlow::toLoad() {
    m_stage = Stage::Load;
    m_saves.clear();
    m_saves.push_back({"Tutorial (TUTOR.OPS)", "TUTOR.OPS"});
    std::error_code ec;
    for (const auto& e : std::filesystem::directory_iterator(m_saveDir, ec)) {
        std::string ext = e.path().extension().string();
        std::transform(ext.begin(), ext.end(), ext.begin(), [](unsigned char c) { return char(std::tolower(c)); });
        if (ext == ".ops") m_saves.push_back({e.path().filename().string(), e.path()});
    }
    m_side.reset();
    m_dialog = std::make_unique<Dialog>(listTemplate("Load Game", {{1, "Load"}, {2, "Cancel"}}));
    m_dialogId = 0;
    m_dialog->centreIn(screen());
    for (const auto& s : m_saves) m_dialog->lists[kList].push_back(s.first);
    m_dialog->selected[kList] = 0;
}

void StartFlow::toPrefs() {
    m_stage = Stage::Prefs;
    openDialog(kDlgPrefs);
    if (!m_dialog) return;
    if (m_prefs.tileAnimations) m_dialog->checked.insert(kTileAnimations);
    if (m_prefs.music) m_dialog->checked.insert(kMusic);
    if (m_prefs.soundEffects) m_dialog->checked.insert(kSoundEffects);
    if (m_prefs.animatedSequences) m_dialog->checked.insert(kAnimatedSequences);
    if (m_prefs.terrainPacks) m_dialog->checked.insert(kTerrainPacksBox);
    m_dialog->sliders[kMusicVolume] = m_prefs.musicVolume;
    m_prefsVolumeBefore = m_prefs.musicVolume;
    // IMPROVED (I49): Esc skips a scene in the rebuild; and before a game
    // the "Difficulty Level" box (empty in v1.51, s9:18A2) shows what the
    // next new game starts with, in the same strings.
    m_dialog->replaceText("Press CTRL-BREAK to exit animated scenes.", "Press ESC to skip animated scenes.");
    m_dialog->values[4064] = m_data.strings.get(1572) + m_data.strings.get(uint16_t(1567 + m_difficulty));
    m_dialog->values[4063] = m_data.strings.get(1573) + m_data.strings.get(m_autoTrucking ? 1574 : 1575);
}

void StartFlow::music() {
    // IMPROVED (I48): v1.51 plays music only in the Introduction and before
    // the landing (mars.mid); the rebuild keeps it going on the start
    // screens. A request while it plays is dropped, so it restarts when done.
    m_media.audio.playSound(data::media::kTitleMusic);
}

// IMPROVED (I121): New Game runs the original's mode list (DGROUP 0x4238:
// 10, 11, 12, 13, 4, s4:5958): A.I. Says "Greetings, Commander" (4039,
// fem1, s8:A396), "What name do you use?" (4040, fem2), "What name would
// you like to give me?" (4041, fem3), then the difficulty (4042, fem4,
// s8:A972). The names are kept in REBUILD.INI.
void StartFlow::toGreeting(int step) {
    static constexpr Stage kStage[3] = {Stage::Greeting, Stage::Name, Stage::AiName};
    m_stage = kStage[step];
    music();
    openDialog(uint16_t(4039 + step));
    if (!m_dialog) {
        if (step < 2) toGreeting(step + 1);
        else toDifficulty();
        return;
    }
    if (step == 1) m_dialog->edit = m_prefs.commanderName;
    if (step == 2) m_dialog->edit = m_prefs.aiName;
    m_media.audio.stopWave();                      // the last line gives way
    m_media.audio.playVoice(uint16_t(1 + step));
}

void StartFlow::toDifficulty() {
    m_stage = Stage::Difficulty;
    music();
    openDialog(kDlgDifficulty);
    if (!m_dialog) return;
    m_media.audio.stopWave();
    m_media.audio.playVoice(4);                    // s8:A972: fem4
    m_dialog->checked.insert(uint16_t(kBeginner + (m_difficulty - 1)));
    if (m_autoTrucking) m_dialog->checked.insert(kAutoTrucking);
}

void StartFlow::toStars() {
    m_stage = Stage::Stars;
    music();
    backdrop("229.bmp");                           // the star field
    openDialog(kDlgStars);
    if (!m_dialog) return;
    const SDL_Rect s = screen();
    m_dialog->moveTo(starMapArea().x + starMapArea().w + 24, starMapArea().y);
    m_dialog->values[kProbes] = fmt(m_probes);
    m_dialog->disabled.insert(kLaunch);
    m_media.audio.playVoice(145);                  // s5:75F0: mode 5 says add5
}

void StartFlow::toShip() {
    m_stage = Stage::Ship;
    music();
    backdrop("1100.bmp");                          // the ship in Earth orbit
    openDialog(kDlgShip);
    m_ship.openImproved();                         // IMPROVISED (I24)
    // IMPROVED (I58): the satellites and probes nothing in v1.51 uses once
    // launched are greyed and cannot be loaded.
    for (const auto& r : m_ship.rows())
        if (isUnusedOrbital(r.kind)) {
            for (uint16_t id : {r.spinId, r.countId, r.weightId, r.costId}) m_dialog->disabled.insert(id);
            m_dialog->greyLabels.insert(r.name);
        }
    m_media.audio.playVoice(149);                  // s4:EA66, s8:9294: add9
    showShip();
}

// IMPROVED (I124): the Interstellar Launch System, which v1.51 shows after
// Destination Selection's Launch (mode 9's view opens window mode 21,
// s4:E678; dialog 318, s8:D242). Its seven switches come from DGROUP 0x5C0C
// (rows {x, y, id, enabled, status control, string}); s8:D2A2 says add14 and
// greys the probe switch with no Interstellar Probes aboard ("None");
// s8:D400: 330 arms the probe (Standby), 325 pressurizes (Go, steam),
// 326 launches one (Launch, add56, movies 40 and 42 by command 175), 331
// arms the starship, 327 pressurizes (Go), 328 brings the reactor up
// (Go), 329 launches it (command 184: movie 453 with fr7_3); the rebuild
// then plays the voyage (I55: 115, 118.flc) and goes on to the planets.
// Probe launches have no other effect in v1.51.
namespace {
constexpr uint16_t kDlgInterstellar = 318;
constexpr uint16_t kArmProbe = 330, kArmShip = 331, kProbePressure = 325, kLaunchProbe = 326, kShipPressure = 327,
                   kReactor = 328, kLaunchShip = 329;
constexpr uint16_t kProbeStatus = 324, kGo = 1607, kLaunchText = 1608, kStandby = 1609, kNone = 1329;
} // namespace

int StartFlow::probesAboard() const {
    for (size_t r = 0; r < m_ship.rows().size(); ++r)
        if (m_ship.rows()[r].kind == 0x86) return m_ship.counts[r];
    return 0;
}

void StartFlow::useProbe() {
    for (size_t r = 0; r < m_ship.rows().size(); ++r)
        if (m_ship.rows()[r].kind == 0x86 && m_ship.counts[r] > 0) --m_ship.counts[r];
}

void StartFlow::toInterstellar(bool fresh) {
    m_stage = Stage::Launch;
    music();
    backdrop("1119.bmp");                          // the ship in orbit
    auto t = data::DialogTemplate::load(m_data.exe, kDlgInterstellar);
    if (!t) {
        playThen({31, 33}, [this] { toPlanets(); });
        return;
    }
    if (fresh) m_interstellar = {};
    // The switches (s8:D2A2 makes them at the rows' places, 12 x 10 here).
    for (int i = 0; i < 7; ++i) {
        const size_t row = 0x5C0C + 12u * size_t(i);
        data::DialogTemplate::Control c;
        c.className = "OPButton";
        c.x = int16_t(m_data.dgroupWord(row));
        c.y = int16_t(m_data.dgroupWord(row + 2));
        c.id = uint16_t(m_data.dgroupWord(row + 4));
        c.cx = 12;
        c.cy = 10;
        c.text = "";
        if (fresh && m_data.dgroupWord(row + 6)) m_interstellar.enabled.insert(c.id);
        t->controls.push_back(c);
    }
    m_side.reset();
    m_dialog = std::make_unique<Dialog>(std::move(*t));
    m_dialogId = kDlgInterstellar;
    m_dialog->centreIn(screen());
    if (fresh) {
        if (probesAboard() <= 0) {
            m_interstellar.enabled.erase(kArmProbe);
            m_interstellar.status[kProbeStatus] = m_data.strings.get(kNone);
        }
        m_media.audio.stopWave();
        m_media.audio.playVoice(154);              // add14
    }
    for (int i = 0; i < 7; ++i) {
        const uint16_t id = uint16_t(m_data.dgroupWord(0x5C0C + 12u * size_t(i) + 4));
        if (!m_interstellar.enabled.count(id)) m_dialog->disabled.insert(id);
    }
    for (const auto& [id, text] : m_interstellar.status) m_dialog->values[id] = text;
}

void StartFlow::interstellarCommand(int id) {
    auto& L = m_interstellar;
    if (id != 2 && !L.enabled.count(uint16_t(id))) return;   // a switch not yet lit
    auto status = [&](uint16_t ctl, uint16_t str) { L.status[ctl] = m_data.strings.get(str); };
    switch (id) {
        case kArmProbe: L.enabled.insert(kProbePressure); status(320, kStandby); break;
        case kArmShip: L.enabled.insert(kShipPressure); break;
        case kProbePressure:
            L.enabled.insert(kLaunchProbe);
            status(319, kGo);
            m_media.audio.playSound(497);           // steam
            break;
        case kLaunchProbe: {
            status(320, kLaunchText);
            useProbe();
            L.enabled.erase(kProbePressure);
            L.enabled.erase(kLaunchProbe);
            status(319, kStandby);
            if (probesAboard() <= 0) {
                L.enabled.erase(kArmProbe);
                status(kProbeStatus, kNone);
            }
            m_media.audio.stopWave();
            m_media.audio.playVoice(196);           // add56
            playThen({21, 22}, [this] { toInterstellar(false); });   // command 175: 40, 42.flc
            return;
        }
        case kShipPressure:
            L.enabled.insert(kReactor);
            status(321, kGo);
            m_media.audio.playSound(501);
            break;
        case kReactor:
            L.enabled.insert(kLaunchShip);
            status(322, kGo);
            m_media.audio.playSound(498);
            break;
        case kLaunchShip:
            status(323, kLaunchText);
            playThen({98, 31, 33}, [this] { toPlanets(); });   // command 184, then the voyage (I55)
            return;
        case 2:
            toMenu();
            return;
        default: return;
    }
    toInterstellar(false);
}

void StartFlow::toDestination() {
    m_stage = Stage::Destination;
    music();
    backdrop("229.bmp");
    openDialog(kDlgDestination);
    m_media.audio.playVoice(122);                  // s4:E2CC: mode 4 says fem122
    if (!m_dialog) return;
    const SDL_Rect s = screen();
    m_dialog->moveTo(starMapArea().x + starMapArea().w + 24, starMapArea().y);
    if (m_star) {
        m_dialog->checked.insert(uint16_t(buttonOfStar(m_star)));
        starChosen(buttonOfStar(m_star));
    }
}

void StartFlow::toPlanets() {
    m_stage = Stage::Planets;
    music();
    backdrop("229.bmp");
    m_planets.clear();
    const sim::Star* star = m_sim->db().get<sim::Star>(sim::Handle::make(sim::ObjType::Star, m_star));
    // The planet is chosen by launching the Seed Factory (s9:0170), so the
    // list has no button of its own.
    m_dialog = std::make_unique<Dialog>(listTemplate(star ? star->name : "Planets", {}, 70));
    m_dialogId = 0;
    if (star)
        for (sim::Handle h : star->children)
            if (const sim::Planet* p = m_sim->db().get<sim::Planet>(h)) {
                m_planets.push_back(h);
                m_dialog->lists[kList].push_back(p->name);
            }
    // IMPROVED (I112): as in the original's screenshots, the Orbital
    // Launch System on the left and the Star Systems window beside it, whose
    // row of worlds picks the planet; the list stays, off screen, for the
    // keys and scripted runs.
    m_dialog->moveTo(-4000, -4000);
    m_dialog->selected[kList] = 0;
    m_probedPlanets.clear();
    openLaunch();
    showPlanet();
}

void StartFlow::openLaunch() {
    auto t = data::DialogTemplate::load(m_data.exe, kDlgLaunch);
    if (!t) return;
    // s9:0000: eight controls made at run time from DGROUP 0x5C60 {x, y, id,
    // kind, status control, "ready" string, movie command}: the four
    // satellites (359..362), Deploy (363), the penetrator (364), Launch
    // Probe (365) and the Seed Factory (366).
    // IMPROVISED (I57): their class (made by s2:3BD6) is not decoded; here
    // the items are check boxes and Deploy, Launch Probe and the Seed
    // Factory buttons saying "Go" (string 1607).
    m_launchRows.clear();
    for (size_t i = 0; i < 8; ++i) {
        const size_t o = 0x5C60 + 14 * i;
        LaunchRow r;
        r.x = int16_t(m_data.dgroupWord(o));
        r.y = int16_t(m_data.dgroupWord(o + 2));
        r.id = m_data.dgroupWord(o + 4);
        r.kind = m_data.dgroupWord(o + 6);
        r.status = m_data.dgroupWord(o + 8);
        r.ready = m_data.dgroupWord(o + 10);
        r.movie = m_data.dgroupWord(o + 12);
        m_launchRows.push_back(r);
        data::DialogTemplate::Control c;
        c.id = r.id;
        c.x = r.x;
        c.y = r.y;
        if (r.kind == 0 || r.kind == 10) {
            // Left of their place, so the wider text clears the label.
            c.className = "OPButton";
            c.text = m_data.strings.get(1607);
            c.x = int16_t(r.x - 4);
            c.cx = 16;
            c.cy = 12;
        } else {
            c.className = "BUTTON";
            c.style = 2;                                         // BS_CHECKBOX
            c.cx = 12;
            c.cy = 14;
        }
        t->controls.push_back(c);
    }
    m_launch = std::make_unique<Dialog>(std::move(*t));
    // IMPROVED (I58): the satellites v1.51 never uses are shown greyed.
    m_launch->greyLabels = {"Weather Satellite"};       // (the Orbital Observer has a use since I110)
    for (const auto& r : m_launchRows)
        if (isUnusedOrbital(r.kind)) m_launch->disabled.insert(r.status);
    const SDL_Rect s = screen();
    m_launch->moveTo(40, std::max(40, (s.h - 420) / 2));                 // I112: on the left
    m_satellite = -1;
    m_penetrator = false;
    for (size_t i = 0; i < m_launchRows.size(); ++i) refreshLaunchRow(i);
    m_launch->disabled.insert(363);                              // Deploy and Launch Probe wait
    m_launch->disabled.insert(365);
    m_media.audio.playVoice(158);                                // s9:0152: add18
}

void StartFlow::refreshLaunchRow(size_t row) {
    // s9:0558: an item still aboard (or the Seed Factory) can be chosen and
    // stands by (1609); otherwise it is greyed and says "None" (1329).
    if (!m_launch || row >= m_launchRows.size()) return;
    const LaunchRow& r = m_launchRows[row];
    if (r.kind == 0) return;
    const bool on = (m_sim->orbitals().aboard(r.kind) > 0 || r.kind == 10) && !isUnusedOrbital(r.kind);
    if (on) m_launch->disabled.erase(r.id);
    else m_launch->disabled.insert(r.id);
    m_launch->checked.erase(r.id);
    // IMPROVISED (I57): "Standby" also says how many are still aboard.
    const int left = m_sim->orbitals().aboard(r.kind);
    std::string text = m_data.strings.get(on ? 1609 : 1329);
    if (on && r.kind != 10) text += " (" + fmt(left) + " left)";
    if (r.status) m_launch->values[r.status] = text;
}

void StartFlow::playMovieHere(uint16_t command) {
    // The item's movie (only with Animated Sequences, registry 2 +0x20),
    // then back to the launch screen as it was.
    if (!command || !m_media.sequence.start(command, SDL_GetTicks()) || !m_media.sequence.active()) return;
    m_afterMovies = [this] { m_stage = Stage::Planets; };
    m_stage = Stage::Intro;
}

void StartFlow::launchCommand(int id) {
    if (!m_launch || m_launchRows.size() < 8) return;
    int row = -1;
    for (size_t i = 0; i < m_launchRows.size(); ++i)
        if (m_launchRows[i].id == id) row = int(i);
    if (row >= 0 && row <= 3) {
        // A satellite: the other three wait, Deploy is ready.
        for (size_t i = 0; i <= 3; ++i)
            if (int(i) != row) m_launch->disabled.insert(m_launchRows[i].id);
        m_launch->checked.insert(uint16_t(id));
        m_launch->disabled.erase(m_launchRows[4].id);
        m_satellite = row;
        const LaunchRow& r = m_launchRows[size_t(row)];
        m_launch->values[r.status] = m_data.strings.get(r.ready);
    } else if (row == 4) {
        // Deploy: the launch sound (not for the Orbital Observer), one more
        // in orbit (s3:6604) and the satellite's movie.
        m_launch->disabled.insert(uint16_t(id));
        if (m_satellite < 0) return;
        if (m_satellite != 3) m_media.audio.playSound(data::media::kLaunchSound);
        const LaunchRow r = m_launchRows[size_t(m_satellite)];
        m_sim->launchOrbital(r.kind);
        m_satellite = -1;
        for (size_t i = 0; i <= 3; ++i) refreshLaunchRow(i);
        playMovieHere(r.movie);
    } else if (row == 5) {
        m_launch->checked.insert(uint16_t(id));
        m_launch->disabled.erase(m_launchRows[6].id);
        m_penetrator = true;
        m_launch->values[m_launchRows[5].status] = m_data.strings.get(m_launchRows[5].ready);
    } else if (row == 6) {
        // Launch Probe: the penetrator goes to the planet chosen in the
        // list, whose window then shows its estimated mining sites and its
        // depth (s4:6086).
        m_launch->disabled.insert(uint16_t(id));
        if (!m_penetrator) return;
        m_media.audio.playSound(data::media::kLaunchSound);
        const LaunchRow r = m_launchRows[5];
        m_sim->launchOrbital(r.kind);
        m_penetrator = false;
        refreshLaunchRow(5);
        const int sel = m_dialog && m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : 0;
        if (sel >= 0 && size_t(sel) < m_planets.size()) m_probedPlanets.push_back(m_planets[size_t(sel)]);
        showPlanet();
        playMovieHere(r.movie);
    } else if (row == 7) {
        launchSeed();
    }
}

void StartFlow::launchSeed() {
    const int sel = m_dialog && m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : -1;
    if (sel < 0 || size_t(sel) >= m_planets.size()) return;
    const sim::Planet* p = m_sim->db().get<sim::Planet>(m_planets[size_t(sel)]);
    if (!p || p->siteIds.empty()) {
        showMessage(p ? p->name : "Outpost", "No landing sites were found on this world. Choose another planet.");
        bool any = false;
        for (sim::Handle h : m_planets)
            if (const sim::Planet* q = m_sim->db().get<sim::Planet>(h); q && !q->siteIds.empty()) any = true;
        if (!any) showMessage(p ? p->name : "Outpost", m_data.strings.get(1839), [this] { toMenu(); });
        return;
    }
    // s9:0170 case 366: SCSelect(planet) and a turn, then command 126 (the
    // Seed Factory's descent, 130.flc and 160.flc), then the sites.
    m_newGame->selectPlanet(*m_sim, m_planets[size_t(sel)]);
    m_launch.reset();
    m_dialog.reset();
    m_side.reset();
    if (m_media.sequence.start(126, SDL_GetTicks()) && m_media.sequence.active()) {
        m_afterMovies = [this] { toSites(); };
        m_stage = Stage::Intro;
    } else {
        toSites();
    }
}

void StartFlow::toSites() {
    m_stage = Stage::Sites;
    backdrop("1119.bmp");                          // the ship in orbit
    m_sites.clear();
    const sim::Planet* p = m_planets.empty() ? nullptr : m_sim->db().get<sim::Planet>(m_planets.front());
    for (sim::Planet* pl : m_sim->db().allOf<sim::Planet>(sim::ObjType::Planet)) p = pl;
    m_side.reset();
    m_dialog = std::make_unique<Dialog>(listTemplate(p ? p->name + " - Sites" : "Sites", {{1, "Land"}, {2, "Back"}}, 110));
    m_dialogId = 0;
    if (p)
        for (sim::Handle h : p->children)
            if (const sim::Site* site = m_sim->db().get<sim::Site>(h)) {
                m_sites.push_back(h);
                m_dialog->lists[kList].push_back(site->name);
            }
    m_dialog->moveTo(40, 60);
    m_dialog->selected[kList] = 0;
    showSite();
}

void StartFlow::toIntro() {
    m_dialog.reset();
    m_side.reset();
    if (m_media.sequence.start(data::media::kIntroduction, SDL_GetTicks()) && m_media.sequence.active())
        m_stage = Stage::Intro;
    else
        toMenu();                                  // Animated Sequences off: straight back (s4:6AA0)
}

// ── Drawing ───────────────────────────────────────────────────────────────

void StartFlow::draw() {
    const SDL_Rect s = screen();
    m_gfx.fill(s, Colour{0, 0, 0});
    auto picture = [&](const std::string& file, const SDL_Rect& area, bool fill) {
        SDL_Texture* t = m_gfx.bitmap(file, false);
        if (!t) return SDL_Rect{0, 0, 0, 0};
        int w, h;
        SDL_QueryTexture(t, nullptr, nullptr, &w, &h);
        const float k = fill ? std::max(float(area.w) / w, float(area.h) / h)
                             : std::min(float(area.w) / w, float(area.h) / h);
        const SDL_Rect dst{area.x + int(area.w - w * k) / 2, area.y + int(area.h - h * k) / 2, int(w * k), int(h * k)};
        SDL_RenderCopy(m_ren, t, nullptr, &dst);
        return dst;
    };
    if (m_stage == Stage::Intro) {
        m_media.sequence.draw(s);
        return;
    }
    SDL_Rect back{0, 0, 0, 0};
    if (!m_backdrop.empty()) back = picture(m_backdrop, s, true);
    if (m_stage == Stage::Menu) {
        // IMPROVED (I118): the rebuild's name under the title picture's
        // OUTPOST logo; the credits under Program Control (which keeps the
        // original's version 1.51 and copyright lines).
        // Right-aligned under the logo's right end (85.5% across the picture).
        const std::string name = "NEW HOPE 2.0";
        const int ty = back.h > 0 ? back.y + int(back.h * 0.275f) : 200;
        const int right = back.w > 0 ? back.x + int(back.w * 0.855f) : s.w - 40;
        m_gfx.titleEmbossed(name, right - m_gfx.titleWidth(name), ty, Colour{255, 214, 70}, Colour{200, 30, 20});
        int y = m_dialog ? m_dialog->rect().y + m_dialog->rect().h + 6 : s.h - 44;
        const std::string hd = "HD art: OutpostHD by White Claw (BSD 3-Clause licence)";
        m_gfx.text(hd, (s.w - m_gfx.textWidth(hd)) / 2 + 1, y + 1, Colour{0, 0, 0});
        m_gfx.text(hd, (s.w - m_gfx.textWidth(hd)) / 2, y, ui::kText);
        const std::string ab = "Original Outpost belongs to Sierra On-Line and is considered abandonware. Fan project, not affiliated with Sierra.";
        y += m_gfx.lineHeight();
        m_gfx.text(ab, (s.w - m_gfx.textWidth(ab)) / 2 + 1, y + 1, Colour{0, 0, 0});
        m_gfx.text(ab, (s.w - m_gfx.textWidth(ab)) / 2, y, ui::kText);
        const std::string v = "Outpost: New Hope 2.0 by LordDeTracy";
        y = s.h - m_gfx.lineHeight() - 6;
        m_gfx.text(v, (s.w - m_gfx.textWidth(v, true)) / 2 + 1, y + 1, Colour{0, 0, 0}, true);
        m_gfx.text(v, (s.w - m_gfx.textWidth(v, true)) / 2, y, ui::kGold, true);
    }
    if (m_stage == Stage::Planets && !m_planets.empty()) {
        // The planet turning (catalog 261..276 from the planet's sheets 1
        // and 2, s3:8096), as in the planet window (registry 0x2D).
        const sim::Planet* p = nullptr;
        const int sel = m_dialog && m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : 0;
        if (sel >= 0 && size_t(sel) < m_planets.size()) p = m_sim->db().get<sim::Planet>(m_planets[size_t(sel)]);
        if (p && m_side) {
            // Drawn in the Star System window's empty top (78 dialog
            // units), where the original draws it.
            m_side->draw(m_gfx);
            const SDL_Rect wr = m_side->rect();
            const SDL_Rect top{wr.x + 4, wr.y + 24, wr.w - 8, 146};
            m_gfx.fill(top, Colour{0, 0, 0});
            // IMPROVED (I112): the system as the original shows it: the
            // star on the left, its worlds in a row (each its own globe),
            // a green line under them and a green mark under the chosen one.
            SDL_Renderer* ren = m_ren;
            const float rowY = top.y + 62.0f;
            Colour sun{255, 140, 40};
            if (m_newGame && m_star >= 1 && m_star <= m_newGame->tables().stars.size())
                if (const data::StarRecord* rec = starRecord(m_data, m_newGame->tables().stars[m_star - 1u].name);
                    rec && !rec->spectralClass.empty())
                    switch (rec->spectralClass[0]) {
                        case 'O': case 'B': sun = {170, 190, 255}; break;
                        case 'A': sun = {235, 240, 255}; break;
                        case 'F': sun = {255, 245, 200}; break;
                        case 'G': sun = {255, 220, 90}; break;
                        case 'K': sun = {255, 150, 50}; break;
                        case 'M': sun = {230, 80, 50}; break;
                        default: break;
                    }
            const float sunR = 34, sunX = top.x + 14 + sunR;
            for (int dy = -int(sunR); dy <= int(sunR); ++dy) {
                const float half = std::sqrt(std::max(0.0f, sunR * sunR - float(dy * dy)));
                const float shade = 1.0f - 0.35f * std::fabs(float(dy)) / sunR;
                SDL_SetRenderDrawColor(ren, Uint8(sun.r * shade), Uint8(sun.g * shade), Uint8(sun.b * shade), 255);
                SDL_RenderDrawLineF(ren, sunX - half, rowY + dy, sunX + half, rowY + dy);
            }
            m_planetIcons.clear();
            const size_t n = m_planets.size();
            const float span = float(top.x + top.w - 10) - (sunX + sunR + 10);
            const float size0 = std::clamp(span / float(std::max<size_t>(n, 1)) * 0.8f, 16.0f, 36.0f);
            const float x0 = sunX + sunR + 10 + size0 / 2, x1 = float(top.x + top.w - 10) - size0 / 2;
            const float step = n > 1 ? (x1 - x0) / float(n - 1) : 0;
            SDL_SetRenderDrawColor(ren, 40, 200, 60, 255);
            SDL_RenderDrawLineF(ren, x0 - 12, rowY + 40, x1 + 12, rowY + 40);
            for (size_t i = 0; i < n; ++i) {
                const sim::Planet* w = m_sim->db().get<sim::Planet>(m_planets[i]);
                const float px = n > 1 ? x0 + step * float(i) : (x0 + x1) / 2;
                const float size = size0;
                const SDL_Rect icon{int(px - size / 2), int(rowY - size / 2), int(size), int(size)};
                m_planetIcons.push_back(icon);
                bool drawn = false;
                if (auto c = m_pics.catalog(uint16_t(261 + m_planetFrame)); w && c && c->kind == 2) {
                    const std::string file = m_pics.planetSheet(w->nameId, c->rect.sheet);
                    if (!file.empty()) {
                        const float k = size / float(std::max(c->rect.w, c->rect.h));
                        m_gfx.blit(file, SDL_Rect{c->rect.x, c->rect.y, c->rect.w, c->rect.h}, float(icon.x),
                                   float(icon.y), k);
                        drawn = true;
                    }
                }
                if (!drawn) {                                   // a gas giant: no picture in the game
                    const float pr = size / 2;
                    for (int dy = -int(pr); dy <= int(pr); ++dy) {
                        const float half = std::sqrt(std::max(0.0f, pr * pr - float(dy * dy)));
                        const Uint8 band = Uint8((dy / 3) % 2 ? 150 : 190);
                        SDL_SetRenderDrawColor(ren, band, Uint8(band * 0.8f), Uint8(band * 0.55f), 255);
                        SDL_RenderDrawLineF(ren, px - half, rowY + dy, px + half, rowY + dy);
                    }
                }
                SDL_SetRenderDrawColor(ren, 40, 200, 60, 255);
                SDL_RenderDrawLineF(ren, px, rowY + 36, px, rowY + 44);
                if (int(i) == sel)
                    for (int k = 0; k < 7; ++k)
                        SDL_RenderDrawLineF(ren, px - k, rowY + 54 - k, px + k, rowY + 54 - k);
            }
            // The chosen world's name under the line.
            const std::string nm = p->name;
            m_gfx.text(nm, top.x + (top.w - m_gfx.textWidth(nm)) / 2, int(rowY + 58), Colour{120, 220, 120});
        }
    }
    if (m_stage == Stage::Sites && !m_sites.empty() && m_dialog) {
        const int sel = m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : 0;
        if (sel >= 0 && size_t(sel) < m_sites.size())
            if (const sim::Site* site = m_sim->db().get<sim::Site>(m_sites[size_t(sel)])) {
                // The site's picture: catalog 277 + site id = 500..579.bmp.
                const SDL_Rect r{m_dialog->rect().x + m_dialog->rect().w + 30, 60, 300, 300};
                m_gfx.bevel({r.x - 6, r.y - 6, r.w + 12, r.h + 110});
                std::string file;
                if (auto c = m_pics.catalog(uint16_t(277 + (data::isGeneratedSite(site->rec00) ? (site->rec00 & 0x7FFF) % 70 : site->rec00))); c && c->kind == 1) file = c->file;
                const SDL_Rect shown = file.empty() ? SDL_Rect{0, 0, 0, 0} : picture(file, r, false);
                if (shown.w == 0) m_gfx.text("(no picture)", r.x + 100, r.y + 140, ui::kShadow);
                int y = r.y + r.h + 10;
                const int visible = std::min<int>(site->visibleMines, int(site->mineSites.size()));
                m_gfx.text(site->name, r.x, y, ui::kText, true);
                y += m_gfx.lineHeight() + 4;
                m_gfx.text("Map: " + fmt(site->mapSize.x) + " x " + fmt(site->mapSize.y), r.x, y);
                y += m_gfx.lineHeight() + 2;
                m_gfx.text("Mining sites found: " + fmt(visible), r.x, y);
                y += m_gfx.lineHeight() + 2;
                const int maxDepth = sim::maxDigDepth(m_sim->planetHostility());
                m_gfx.text("Maximum digging depth: " + std::to_string(maxDepth) + (maxDepth == 1 ? " level" : " levels"),
                           r.x, y);
                // IMPROVED (I53): the site's layout with its mining beacons,
                // so the landing is not chosen blind.
                const SDL_Rect area{40, r.y + r.h + 120, s.w - 80, std::max(120, s.h - (r.y + r.h + 140))};
                m_gfx.fill(area, Colour{4, 3, 8, 230});
                m_gfx.frame(area, ui::kShadow);
                const SDL_Rect mapArea{area.x + 8, area.y + 28, area.w - 16, area.h - 36};
                m_siteMap.draw(m_ren, *m_sim, m_sites[size_t(sel)], 0, mapArea, 0);
                m_gfx.heading("Site layout", area.x + 10, area.y + 6);
                const std::string legend = "Gold: mining beacons (" + std::to_string(m_siteMap.beacons()) +
                                           ")   Light: clear ground   Dark: rough and hostile terrain";
                m_gfx.text(legend, area.x + 140, area.y + 6, ui::kText);
            }
    }
    if (m_side && m_stage != Stage::Planets) m_side->draw(m_gfx);
    if (m_launch && m_stage == Stage::Planets) m_launch->draw(m_gfx);
    if (m_stage == Stage::Ship) drawCargo();
    if (m_stage == Stage::Stars || m_stage == Stage::Destination) drawStarMap();
    if (m_dialog) m_dialog->draw(m_gfx);
    if (m_message) drawMessage(m_gfx, *m_message, s);
    if (m_question) {
        drawQuestion(m_gfx, Message{m_question->title, m_question->text}, s);
    }
}

void StartFlow::tick(uint32_t nowMs) {
    // I95: the menu's music on the menus and in the Introduction, the
    // voyage's from star selection to the sites (and in the movies
    // between them), the landing's for the landing story.
    Mood mood = Mood::Voyage;
    switch (m_stage) {
        case Stage::Menu: case Stage::Load: case Stage::Prefs: case Stage::Difficulty: mood = Mood::Menu; break;
        case Stage::Intro: mood = m_landingStory ? Mood::Landing : m_afterMovies ? Mood::Voyage : Mood::Menu; break;
        default: break;
    }
    m_media.audio.setMood(mood);
    if (m_stage == Stage::Intro) {
        m_media.sequence.tick(nowMs);
        if (!m_media.sequence.active()) sequenceEnded();
        return;
    }
    if (m_stage == Stage::Planets && nowMs - m_lastFrame > 150) {
        m_lastFrame = nowMs;
        m_planetFrame = (m_planetFrame + 1) % 16;
    }
}

// ── Events ────────────────────────────────────────────────────────────────

void StartFlow::event(const SDL_Event& e) {
    if (e.type == SDL_QUIT) {
        m_result.quit = true;
        m_done = true;
        return;
    }
    if (m_question) {
        if (e.type == SDL_MOUSEBUTTONDOWN) {
            const QuestionLayout q = questionLayout(m_gfx, Message{m_question->title, m_question->text}, screen());
            const SDL_Rect yes = q.yes, no = q.no;
            if (inside(yes, e.button.x, e.button.y)) {
                auto f = std::move(m_question->yes);
                m_question.reset();
                if (f) f();
            } else if (inside(no, e.button.x, e.button.y)) {
                m_question.reset();
            }
        } else if (e.type == SDL_KEYDOWN) {
            if (e.key.keysym.sym == SDLK_ESCAPE || e.key.keysym.sym == SDLK_n) m_question.reset();
            if (e.key.keysym.sym == SDLK_RETURN || e.key.keysym.sym == SDLK_y) {
                auto f = std::move(m_question->yes);
                m_question.reset();
                if (f) f();
            }
        }
        return;
    }
    if (m_message) {
        if (e.type == SDL_KEYDOWN || e.type == SDL_MOUSEBUTTONDOWN) {
            m_message.reset();
            if (auto f = std::move(m_afterMessage)) {
                m_afterMessage = {};
                f();
            }
        }
        return;
    }
    if (m_stage == Stage::Intro) {
        m_media.sequence.event(e, SDL_GetTicks());
        if (!m_media.sequence.active()) sequenceEnded();
        return;
    }
    if (!m_dialog) return;
    if ((m_stage == Stage::Stars || m_stage == Stage::Destination) && !m_message && !m_question) {
        if (e.type == SDL_MOUSEMOTION) {
            m_hoverStar = 0;
            starMapClick(-e.motion.x - 1, e.motion.y);     // hover only
        }
        if (e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT &&
            starMapClick(e.button.x, e.button.y))
            return;
    }
    if (m_stage == Stage::Planets && e.type == SDL_MOUSEBUTTONDOWN && e.button.button == SDL_BUTTON_LEFT) {
        const SDL_Point pt{e.button.x, e.button.y};
        for (size_t i = 0; i < m_planetIcons.size(); ++i)
            if (SDL_PointInRect(&pt, &m_planetIcons[i])) {             // I112: the row of worlds
                m_dialog->selected[kList] = int(i);
                showPlanet();
                return;
            }
    }
    if (m_stage == Stage::Planets && m_launch)
        if (const int id = m_launch->handle(e); id >= 359 && id <= 366) {
            launchCommand(id);
            return;
        }
    if (const int id = m_dialog->handle(e)) command(id);
}

void StartFlow::press(int id) {
    if (m_message) {
        m_message.reset();
        if (auto f = std::move(m_afterMessage)) {
            m_afterMessage = {};
            f();
        }
        return;
    }
    if (m_question) {
        auto f = std::move(m_question->yes);
        m_question.reset();
        if (id == 1 && f) f();
        return;
    }
    if (m_stage == Stage::Intro) {
        // Scripted: Esc (0) leaves the Introduction, anything else skips a screen.
        SDL_Event e{};
        e.type = SDL_KEYDOWN;
        e.key.keysym.sym = id == 0 ? SDLK_ESCAPE : SDLK_RETURN;
        m_media.sequence.event(e, SDL_GetTicks());
        if (!m_media.sequence.active()) sequenceEnded();
        return;
    }
    if (m_stage == Stage::Ship && m_dialog) {
        // A spin control goes up; its negative id goes down.
        m_dialog->spin = id < 0 ? -1 : 1;
        id = std::abs(id);
    }
    if (m_dialog && id >= kAddedStar && isStarButton(id)) {
        // An added star (no check box): as a click on the chart.
        if (m_stage == Stage::Stars && m_dialog->checked.count(uint16_t(id))) m_dialog->checked.erase(uint16_t(id));
        else m_dialog->checked.insert(uint16_t(id));
    }
    if (m_dialog) {
        // Check boxes and radio buttons are pressed by checking them.
        for (const auto& c : m_dialog->templ().controls) {
            const uint32_t k = c.style & 0xF;
            if (c.id != id || c.className != "BUTTON") continue;
            if (k == 4 || k == 9)
                for (const auto& o : m_dialog->templ().controls)
                    if (o.className == "BUTTON" && ((o.style & 0xF) == 4 || (o.style & 0xF) == 9)) m_dialog->checked.erase(o.id);
            if (k == 2 || k == 3 || k == 4 || k == 5 || k == 6 || k == 9) m_dialog->checked.insert(uint16_t(id));
        }
    }
    command(id);
}

void StartFlow::command(int id) {
    switch (m_stage) {
        case Stage::Menu:
            // s9:07DC: both ask first, New Game with the mission brief
            // (strings 1999, 2000 + 2001), the Introduction with its running
            // time (1878, 1879).
            // IMPROVED (I47): the mission brief only warned about 8 MB
            // machines; New Game goes straight on.
            if (id == kNewGame) {
                toGreeting(0);
            } else if (id == kIntroduction) {
                ask(m_data.strings.get(1878), m_data.strings.get(1879), [this] { toIntro(); });
            } else if (id == kLoadGame) toLoad();
            else if (id == kPrefsButton) toPrefs();
            else if (id == kExitButton || id == 2) {
                m_result.quit = true;
                m_done = true;
            }
            break;
        case Stage::Load:
            if (id == 2) toMenu();
            if (id == 1 || (id == kList && m_dialog->doubleClick)) {
                const int i = m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : -1;
                if (i >= 0 && size_t(i) < m_saves.size()) loadSave(m_saves[size_t(i)].second, m_saves[size_t(i)].first);
            }
            break;
        case Stage::Prefs:
            if (id == kMusicVolume) {                        // I95: heard at once
                m_prefs.musicVolume = m_dialog->sliders[kMusicVolume];
            } else if (id == 6193) {                         // Defaults
                m_dialog->checked = {kTileAnimations, kMusic, kSoundEffects, kAnimatedSequences};
                m_dialog->sliders[kMusicVolume] = m_prefs.musicVolume = 80;
            } else if (id == 1) {
                m_prefs.tileAnimations = m_dialog->checked.count(kTileAnimations) != 0;
                m_prefs.music = m_dialog->checked.count(kMusic) != 0;
                m_prefs.soundEffects = m_dialog->checked.count(kSoundEffects) != 0;
                m_prefs.animatedSequences = m_dialog->checked.count(kAnimatedSequences) != 0;
                m_prefs.terrainPacks = m_dialog->checked.count(kTerrainPacksBox) != 0;
                m_prefs.save(m_saveDir);
                toMenu();
            } else if (id == 2) {
                m_prefs.musicVolume = m_prefsVolumeBefore;   // Cancel: the volume it had
                toMenu();
            }
            break;
        case Stage::Greeting:
            if (id == 1) toGreeting(1);
            else if (id == 2) toMenu();
            break;
        case Stage::Name:
        case Stage::AiName:
            if (id == 1) {
                const bool name = m_stage == Stage::Name;
                (name ? m_prefs.commanderName : m_prefs.aiName) = m_dialog->edit;
                if (!m_prefs.scripted) m_prefs.save(m_saveDir);
                if (name) toGreeting(2);
                else toDifficulty();
            } else if (id == 2) {
                toMenu();
            }
            break;
        case Stage::Difficulty:
            if (id == 1) {
                for (int d = 1; d <= 4; ++d)
                    if (m_dialog->checked.count(uint16_t(kBeginner + d - 1))) m_difficulty = d;
                m_autoTrucking = m_dialog->checked.count(kAutoTrucking) != 0;
                // s2:087E: a new simulator, the players and the galaxy. The
                // game seeds rand() from the clock at start-up (s2:54CA).
                m_sim = std::make_unique<sim::Simulation>(
                    m_data, m_prefs.seed ? m_prefs.seed : static_cast<uint32_t>(std::time(nullptr)));
                m_sim->setDifficulty(m_difficulty);
                m_sim->setAutoTrucking(m_autoTrucking);
                m_newGame = std::make_unique<sim::NewGame>();
                m_newGame->load(m_data);
                m_newGame->modernize();                          // IMPROVED (I92)
                m_newGame->start(*m_sim);
                m_star = 0;
                m_probes = 4;
                m_probed.clear();
                toStars();
            } else if (id == 2) {
                toMenu();
            }
            break;
        case Stage::Stars:
            if (isStarButton(id)) {
                starChosen(id);
            } else if (id == kLaunch) {
                // s9:2512 Launch: too many targets refuse (1404); unused
                // probes ask first (1405, add54); then the checked stars are
                // the probed ones (registry 6 +0x4E) and the ship screen
                // follows (command 200).
                if (m_probes < 0) {
                    showMessage(m_data.strings.get(1403), m_data.strings.get(1404));
                    break;
                }
                auto go = [this] {
                    m_probed.clear();
                    for (int b : starButtons())
                        if (m_dialog && m_dialog->checked.count(uint16_t(b))) m_probed.push_back(starOfButton(b));
                    // IMPROVED (I55): the Introduction's probe launch (34.flc).
                    playThen({16}, [this] { toShip(); });
                };
                if (m_probes > 0) {
                    m_media.audio.playVoice(194);
                    ask(m_data.strings.get(1403), m_data.strings.get(1405), go);
                } else {
                    go();
                }
            } else if (id == 2) {
                toMenu();
            }
            break;
        case Stage::Ship:
            if (id == 2) {
                toMenu();
                break;
            }
            if (id == 1) {
                auto launch = [this] {
                    m_ship.launch(*m_sim);                       // s8:95FC
                    // IMPROVED (I55): the starship leaves Earth (82, 84,
                    // 86.flc) and fuels at Jupiter (90, 100.flc).
                    playThen({26, 27, 28, 29, 30}, [this] { toDestination(); });
                };
                if (m_ship.asksBeforeLaunch()) ask(m_data.strings.get(1499), m_data.strings.get(1498), launch);
                else launch();
                break;
            }
            for (size_t i = 0; i < sim::ShipConfig::kRows; ++i)
                if (m_ship.rows()[i].spinId == id) {
                    m_ship.stepLinked(i, m_dialog->spin > 0);    // s8:94DA (I102: pods with landers)
                    showShip();
                }
            break;
        case Stage::Destination:
            if (isStarButton(id)) {
                starChosen(id);
            } else if (id == kAiSelect) {
                // The AI picks one of the stars of the difficulty's row
                // (DGROUP 0x5B84, 12-byte rows {count, ids...}; Beginner
                // counts as Easy) and says so (strings 1521, "%s %s!").
                const int d = m_difficulty == 1 ? 2 : m_difficulty;
                const int n = m_data.dgroupWord(size_t(0x5B84 + d * 12));
                if (n > 0) {
                    const int r = m_sim->random(0, int16_t(n - 1));
                    const int button = m_data.dgroupWord(size_t(0x5B86 + (d * 6 + r) * 2));
                    if (button >= kFirstStar && button <= kLastStar) {
                        m_dialog->checked.clear();
                        m_dialog->checked.insert(uint16_t(button));
                        starChosen(button);
                        std::string says = m_data.strings.get(1521);
                        showMessage("AI Says", says + (m_dialog->templ().control(uint16_t(button))
                                                          ? m_dialog->templ().control(uint16_t(button))->text
                                                          : std::string()) + "!");
                    }
                }
            } else if (id == kLaunch && m_star) {
                const sim::Star* star = nullptr;
                const auto& tables = m_newGame->tables();
                const std::string name = m_star <= tables.stars.size() ? tables.stars[m_star - 1u].name : "";
                // IMPROVED (I92): by the star's planets, not the 1994 factor.
                if (m_star <= tables.stars.size() && !sim::hasLandableWorld(tables, tables.stars[m_star - 1u])) {
                    // String 1839: the game is over.
                    showMessage(name, m_data.strings.get(1839), [this] { toMenu(); });
                    break;
                }
                m_newGame->selectStar(*m_sim, m_star);           // s8:BC30
                (void)star;
                toInterstellar(true);                            // mode 9 -> window mode 21 (s4:E678)
            }
            break;
        case Stage::Launch:
            interstellarCommand(id);
            break;
        case Stage::Planets:
            if (id == kList) {
                showPlanet();
                if (!m_dialog->doubleClick) break;
            }
            if (id >= 359 && id <= 366 && m_launch && !m_launch->disabled.count(uint16_t(id)))
                launchCommand(id);                                  // scripted presses
            break;
        case Stage::Sites:
            if (id == 2) break;                                  // the planet is chosen: no way back
            if (id == 1 || (id == kList && m_dialog->doubleClick)) {
                const int sel = m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : -1;
                if (sel >= 0 && size_t(sel) < m_sites.size()) {
                    m_result.site = m_sites[size_t(sel)];
                    // s5:1CA4: a good site posts 222, mode 52 (the ship in
                    // orbit, fem128, mars.mid), which leads to the colony.
                    if (m_media.sequence.start(222, SDL_GetTicks()) && m_media.sequence.active()) {
                        m_landingStory = true;
                        m_stage = Stage::Intro;
                        m_dialog.reset();
                        m_side.reset();
                    } else {
                        finishNewGame();
                    }
                }
            }
            break;
        default:
            break;
    }
}

// ── Details ───────────────────────────────────────────────────────────────

uint16_t StartFlow::starOfButton(int id) {
    // s2:D818 (registry 0x36 +0x0E): button 416..436 -> star 1..21.
    static constexpr uint16_t kStar[21] = {20, 3, 2, 14, 12, 4, 11, 6, 10, 13, 19, 5, 9, 8, 18, 17, 7, 16, 1, 15, 21};
    if (id >= kAddedStar && id < kAddedStar + 100) return uint16_t(22 + id - kAddedStar);
    return id >= kFirstStar && id <= kLastStar ? kStar[id - kFirstStar] : 0;
}

int StartFlow::buttonOfStar(uint16_t star) {
    if (star > 21) return kAddedStar + star - 22;
    for (int id = kFirstStar; id <= kLastStar; ++id)
        if (starOfButton(id) == star) return id;
    return 0;
}

std::vector<int> StartFlow::starButtons() const {
    // IMPROVED (I92): the added stars have no check box in the dialogs; on
    // the chart they answer to ids from kAddedStar.
    std::vector<int> v;
    for (int id = kFirstStar; id <= kLastStar; ++id) v.push_back(id);
    const size_t n = m_newGame ? m_newGame->tables().stars.size() : 21;
    for (size_t star = 22; star <= n; ++star) v.push_back(kAddedStar + int(star) - 22);
    return v;
}

bool StartFlow::isStarButton(int id) { return (id >= kFirstStar && id <= kLastStar) || (id >= kAddedStar && id < kAddedStar + 100); }

void StartFlow::starChosen(int buttonId) {
    if (!m_dialog) return;
    const bool on = m_dialog->checked.count(uint16_t(buttonId)) != 0;
    if (m_stage == Stage::Stars) {
        // s9:2512: the star buttons are check boxes, as many as the player
        // likes. Each one checked takes a probe and enables Launch; one
        // unchecked gives it back, and with none checked Launch is off.
        // "Probes Available" shows what is left while it is 0..4.
        m_probes += on ? -1 : 1;
        if (on) m_dialog->disabled.erase(kLaunch);
        else if (m_probes == kProbesAtStart) m_dialog->disabled.insert(kLaunch);
        if (m_probes >= 0 && m_probes <= kProbesAtStart) m_dialog->values[kProbes] = fmt(m_probes);
        if (on) {
            m_star = starOfButton(buttonId);
            showStar(m_star, false);
            starVoice(m_star);
        }
        return;
    }
    // s8:B922 (Destination): kept to one; checking one unchecks the last
    // (+0x98) and enables Launch, unchecking disables it.
    if (!on) {
        m_star = 0;
        m_dialog->disabled.insert(kLaunch);
        m_side.reset();
        return;
    }
    for (int id : starButtons())
        if (id != buttonId) m_dialog->checked.erase(uint16_t(id));
    m_dialog->disabled.erase(kLaunch);
    m_star = starOfButton(buttonId);
    showStar(m_star, std::find(m_probed.begin(), m_probed.end(), m_star) != m_probed.end());
    starVoice(m_star);
}

// IMPROVED (I122): s9:2512 and s8:B922 speak a star when it is checked: the
// voice in its row of the star text table (DGROUP 0x3C18 +0x1C, add33..add53;
// the row's +0x1A is its button). Added stars (I92) have none.
void StartFlow::starVoice(uint16_t star) {
    if (!m_newGame || star < 1 || star > m_newGame->tables().stars.size()) return;
    if (const data::StarRecord* rec = starRecord(m_data, m_newGame->tables().stars[star - 1u].name); rec && rec->tailB)
        m_media.audio.playVoice(rec->tailB);
}

void StartFlow::showStar(uint16_t star, bool probed) {
    // The star's data window (dialog 4032 "Star: "), from the star table.
    auto t = data::DialogTemplate::load(m_data.exe, kDlgStar);
    if (!t || !m_newGame || !m_dialog) return;
    const auto& tables = m_newGame->tables();
    const std::string name = star >= 1 && star <= tables.stars.size() ? tables.stars[star - 1u].name : "";
    // "Unknown" is wider than the template's values: the right-hand column
    // moves over.
    for (auto& c : t->controls)
        if (c.x >= 80) c.x = int16_t(c.x + 20);
    t->cx = int16_t(t->cx + 20);
    m_side = std::make_unique<Dialog>(std::move(*t), "Star: " + name);
    m_side->moveTo(starMapArea().x, starMapArea().y + starMapArea().h + 22);   // under the Star Display
    if (const data::StarRecord* r = starRecord(m_data, name)) {
        // IMPROVED (I92): the chance of a habitable planet is known from
        // Earth; the rest (271 class, 272 mass, 274 travel time, 275
        // distance) stays "Unknown" until a probe has been there.
        // IMPROVISED (I38): the probability shows the table's planet factor.
        m_side->values[273] = r->factor;
        const std::string unknown = "Unknown";
        m_side->values[271] = probed ? r->spectralClass : unknown;
        m_side->values[272] = probed ? r->mass : unknown;
        m_side->values[274] = probed ? r->voyageYears + " yrs" : unknown;
        m_side->values[275] = probed ? r->distanceLy + " ly" : unknown;
    }
}

// The Star Display (as in the original's screenshots): a sphere on a blue
// ground, the stars inside it seen from Sol, an equator ring and two arrows
// that turn it. IMPROVED (I111): the original window's drawing is not
// decoded; this follows its look in the player's screenshots.
SDL_Rect StartFlow::starMapArea() const {
    const SDL_Rect s = screen();
    const int size = std::clamp(s.h - 300, 260, 400);
    return {30, 30, size, size + 26};
}

// The star table's x (5..320), y (55..115) and z (-80..90) around their
// middle (Sol), turned by the display's yaw and tipped a little towards the
// viewer, then drawn inside the sphere.
SDL_FPoint StartFlow::starMapPoint(uint16_t star, const SDL_Rect& r, float* baseY) const {
    const auto& tables = m_newGame->tables();
    const sim::Pos3 p = tables.stars[star - 1u].pos;
    // (heights are stretched x3: the table's span only 60 against 315 across)
    const float x = (p.x - 162.5f) / 175.0f, y = (p.y - 85.0f) * 3.0f / 175.0f, z = (p.z - 5.0f) / 175.0f;
    const float a = m_starYaw * 3.14159265f / 180.0f, tilt = 0.18f;
    const float rx = x * std::cos(a) - z * std::sin(a), rz = x * std::sin(a) + z * std::cos(a);
    const float sy = y * std::cos(tilt) - rz * std::sin(tilt);
    const float cx = r.x + r.w / 2.0f, cy = r.y + 26 + (r.h - 26) / 2.0f, rad = (r.w / 2.0f) * 0.82f;
    if (baseY) *baseY = cy;
    return {cx + rx * rad, cy - sy * rad};
}

void StartFlow::drawStarMap() {
    if (!m_newGame || m_newGame->tables().stars.size() < 21) return;
    const SDL_Rect r = starMapArea();
    SDL_Renderer* ren = m_ren;
    SDL_SetRenderDrawBlendMode(ren, SDL_BLENDMODE_BLEND);
    m_gfx.panel(r, true);
    m_gfx.titleBar({r.x + 3, r.y + 3, r.w - 6, 19}, m_gfx.headingWidth("Star Display"));
    m_gfx.heading("Star Display", r.x + 10, r.y + 5, ui::kWindow);
    // The blue ground, lighter towards the bottom.
    const SDL_Rect in{r.x + 6, r.y + 26, r.w - 12, r.h - 32};
    for (int yy = 0; yy < in.h; ++yy) {
        const float t = float(yy) / in.h;
        SDL_SetRenderDrawColor(ren, Uint8(40 + 120 * t), Uint8(70 + 120 * t), Uint8(120 + 110 * t), 255);
        SDL_RenderDrawLine(ren, in.x, in.y + yy, in.x + in.w - 1, in.y + yy);
    }
    // The sphere: black, a green rim, red marks at the poles.
    const float cx = r.x + r.w / 2.0f, cy = r.y + 26 + (r.h - 26) / 2.0f, rad = (r.w / 2.0f) * 0.86f;
    SDL_SetRenderDrawColor(ren, 0, 0, 0, 255);
    for (int dy = -int(rad); dy <= int(rad); ++dy) {
        const float half = std::sqrt(std::max(0.0f, rad * rad - float(dy * dy)));
        SDL_RenderDrawLineF(ren, cx - half, cy + dy, cx + half, cy + dy);
    }
    SDL_SetRenderDrawColor(ren, 40, 200, 60, 255);
    for (int i = 0; i < 360; ++i) {
        const float a0 = i * 3.14159265f / 180, a1 = (i + 1) * 3.14159265f / 180;
        SDL_RenderDrawLineF(ren, cx + rad * std::cos(a0), cy + rad * std::sin(a0), cx + rad * std::cos(a1),
                            cy + rad * std::sin(a1));
    }
    SDL_SetRenderDrawColor(ren, 220, 40, 30, 255);
    SDL_RenderDrawLineF(ren, cx, cy - rad - 6, cx, cy - rad + 6);
    SDL_RenderDrawLineF(ren, cx, cy + rad - 6, cx, cy + rad + 6);
    // The equator ring, tipped as the stars are.
    for (int i = 0; i < 360; ++i) {
        const float a0 = i * 3.14159265f / 180, a1 = (i + 1) * 3.14159265f / 180;
        const float e = 0.18f;
        SDL_RenderDrawLineF(ren, cx + rad * 1.04f * std::cos(a0), cy + rad * 1.04f * std::sin(e) * std::sin(a0),
                            cx + rad * 1.04f * std::cos(a1), cy + rad * 1.04f * std::sin(e) * std::sin(a1));
    }
    // Sol in the middle.
    SDL_SetRenderDrawColor(ren, 120, 170, 255, 255);
    SDL_RenderDrawLineF(ren, cx - 3, cy, cx + 3, cy);
    SDL_RenderDrawLineF(ren, cx, cy - 3, cx, cy + 3);
    // The stars: small white points; a chosen one (or the one under the
    // mouse) in a red square, with its name.
    for (uint16_t star = 1; star <= m_newGame->tables().stars.size(); ++star) {
        const SDL_FPoint p = starMapPoint(star, r);
        const int button = buttonOfStar(star);
        const bool checked = m_dialog && m_dialog->checked.count(uint16_t(button));
        const bool probed = std::find(m_probed.begin(), m_probed.end(), star) != m_probed.end();
        m_gfx.fill({int(p.x) - 1, int(p.y) - 1, 3, 3}, Colour{255, 255, 255});
        if (checked || star == m_hoverStar) {
            m_gfx.frame({int(p.x) - 5, int(p.y) - 5, 11, 11}, checked ? Colour{230, 40, 30} : ui::kOrange);
            const std::string& name = m_newGame->tables().stars[star - 1u].name;
            const std::string label = name + (m_stage == Stage::Destination && probed ? " (probed)" : "");
            const int tw = m_gfx.textWidth(label);
            const int lx = int(p.x) + 9 + tw > r.x + r.w - 8 ? int(p.x) - 9 - tw : int(p.x) + 9;
            m_gfx.text(label, lx, int(p.y) - 8, checked ? Colour{255, 120, 100} : ui::kText);
        }
    }
    // The arrows that turn it.
    const int ay = r.y + r.h - 40;
    m_starArrows[0] = {r.x + 12, ay, 28, 28};
    m_starArrows[1] = {r.x + r.w - 40, ay, 28, 28};
    for (int k = 0; k < 2; ++k) {
        const SDL_Rect& b = m_starArrows[k];
        SDL_SetRenderDrawColor(ren, 200, 30, 30, 255);
        for (int i = 0; i < b.w / 2; ++i) {
            const int x = k == 0 ? b.x + b.w / 2 - i : b.x + b.w / 2 + i;
            SDL_RenderDrawLine(ren, x, b.y + i, x, b.y + b.h - i);
        }
        SDL_SetRenderDrawColor(ren, 60, 90, 220, 255);
        SDL_RenderDrawLine(ren, k == 0 ? b.x + b.w / 2 - b.w / 2 + 1 : b.x + b.w - 1, b.y + b.h / 2,
                           b.x + b.w / 2, k == 0 ? b.y : b.y);
    }
    if (m_newGame->tables().stars.size() > 21)
        m_gfx.text("Stars not in the list can be chosen on the sphere.", r.x + 10, r.y + r.h + 4, ui::kShadow);
}

bool StartFlow::starMapClick(int x, int y) {
    if (!m_newGame || m_newGame->tables().stars.size() < 21 || !m_dialog) return false;
    const bool hoverOnly = x < 0;
    if (hoverOnly) x = -x - 1;
    const SDL_Rect r = starMapArea();
    const SDL_Point pt{x, y};
    for (int k = 0; k < 2; ++k)
        if (SDL_PointInRect(&pt, &m_starArrows[k])) {
            if (!hoverOnly) m_starYaw += k == 0 ? -15.0f : 15.0f;
            return true;
        }
    int best = 0;
    float bestD = 14 * 14;
    for (uint16_t star = 1; star <= m_newGame->tables().stars.size(); ++star) {
        const SDL_FPoint p = starMapPoint(star, r);
        const float dx = p.x - x, dy = p.y - y, d = dx * dx + dy * dy;
        if (d < bestD) {
            bestD = d;
            best = star;
        }
    }
    if (hoverOnly) {
        m_hoverStar = best;
        return best != 0;
    }
    if (!best) return false;
    const uint16_t button = uint16_t(buttonOfStar(uint16_t(best)));
    // As a click on the check box: Star Selection toggles it, Destination
    // checks it (its code keeps one).
    if (m_stage == Stage::Stars && m_dialog->checked.count(button)) m_dialog->checked.erase(button);
    else m_dialog->checked.insert(button);
    command(button);
    return true;
}

void StartFlow::playThen(std::vector<int> modes, std::function<void()> then) {
    m_dialog.reset();
    m_side.reset();
    if (m_media.sequence.playModes(std::move(modes), SDL_GetTicks()) && m_media.sequence.active()) {
        m_afterMovies = std::move(then);
        m_stage = Stage::Intro;
    } else {
        then();
    }
}

void StartFlow::drawCargo() {
    if (!m_dialog) return;
    const SDL_Rect d = m_dialog->rect();
    const SDL_Rect s = screen();
    const SDL_Rect box{d.x + d.w + 20, d.y, std::min(380, s.w - (d.x + d.w + 40)), d.h};
    if (box.w < 200) return;
    m_gfx.panel(box, true);
    m_gfx.titleBar({box.x + 3, box.y + 3, box.w - 6, 19}, m_gfx.headingWidth("Cargo aboard"));
    m_gfx.heading("Cargo aboard", box.x + 10, box.y + 5, ui::kWindow);
    const auto& rows = m_ship.rows();
    const int cellW = (box.w - 24) / 2, cellH = 62;
    int i = 0;
    for (size_t r = 0; r < rows.size(); ++r) {
        if (m_ship.counts[r] <= 0) continue;
        const SDL_Rect cell{box.x + 10 + (i % 2) * (cellW + 4), box.y + 30 + (i / 2) * (cellH + 4), cellW, cellH};
        if (cell.y + cell.h > box.y + box.h - 6) break;
        m_gfx.fill(cell, Colour{12, 8, 8, 220});
        m_gfx.frame(cell, ui::kShadow);
        // The item's picture: a building's own, or for the cargo types
        // 128..137 the orbit icons of sheet 3 (catalog 143..152, I56).
        const uint16_t kind = rows[r].kind;
        const SDL_Rect pic{cell.x + 3, cell.y + 3, 64, cellH - 6};
        // IMPROVED (I65): OutpostHD's picture; the original's without it (the
        // satellites and probes have none in OutpostHD and show no icon).
        if (auto hp = hdSprites(m_gfx).building(kind)) {
            hdSprites(m_gfx).drawFitted(m_gfx, *hp, SDL_FRect{float(pic.x), float(pic.y), float(pic.w), float(pic.h)});
        } else if (hdSprites(m_gfx).available()) {
        } else if (auto p = m_pics.picture(kind)) {
            const float k = std::min(float(pic.w) / p->w, float(pic.h) / p->h);
            m_gfx.blit(m_pics.sheetName(p->sheet), SDL_Rect{p->x, p->y, p->w, p->h}, pic.x + (pic.w - p->w * k) / 2,
                       pic.y + (pic.h - p->h * k) / 2, k);
        } else if (kind >= 131 && kind <= 137) {             // satellites and probes
            if (auto c = m_pics.catalog(uint16_t(143 + kind - 128)); c && c->kind == 2) {
                const float k = std::min(float(pic.w) / c->rect.w, float(pic.h) / c->rect.h);
                m_gfx.blit(m_pics.sheetName(c->rect.sheet), SDL_Rect{c->rect.x, c->rect.y, c->rect.w, c->rect.h},
                           pic.x + (pic.w - c->rect.w * k) / 2, pic.y + (pic.h - c->rect.h * k) / 2, k);
            }
        }
        std::string name = rows[r].name;
        if (m_gfx.textWidth(name) > cell.w - 76) name = name.substr(0, 14) + ".";
        m_gfx.text(name, cell.x + 72, cell.y + 10);
        m_gfx.text("x " + fmt(m_ship.counts[r]), cell.x + 72, cell.y + 32, ui::kGold);
        ++i;
    }
    if (i == 0) m_gfx.text("(nothing yet)", box.x + 12, box.y + 34, ui::kShadow);
}

void StartFlow::sequenceEnded() {
    if (auto then = std::move(m_afterMovies)) {
        m_afterMovies = {};
        then();
        return;
    }
    if (m_landingStory) {
        m_landingStory = false;
        finishNewGame();
    } else {
        toMenu();
    }
}

void StartFlow::showShip() {
    if (!m_dialog) return;
    const auto& rows = m_ship.rows();
    for (size_t i = 0; i < rows.size(); ++i) m_dialog->values[rows[i].countId] = fmt(m_ship.counts[i]);
    m_dialog->values[kRemainingWeight] = fmt(m_ship.remainingWeight);
    m_dialog->values[kRemainingFunds] = fmt(m_ship.remainingFunds);
}

void StartFlow::showPlanet() {
    const int sel = m_dialog && m_dialog->selected.count(kList) ? m_dialog->selected.at(kList) : 0;
    if (sel < 0 || size_t(sel) >= m_planets.size()) return;
    const sim::Planet* p = m_sim->db().get<sim::Planet>(m_planets[size_t(sel)]);
    auto t = data::DialogTemplate::load(m_data.exe, kDlgPlanet);
    if (!p || !t) return;
    m_side = std::make_unique<Dialog>(std::move(*t), "Star System: " + p->name);
    const SDL_Rect s = screen();
    if (m_launch) m_side->moveTo(m_launch->rect().x + m_launch->rect().w + 20, m_launch->rect().y);   // I112
    else m_side->moveTo(s.w / 2 - 40, std::max(40, (s.h - m_side->rect().h) / 2));
    // s3:4E9E: the facts are the RCDATA sheet of the Sol body the planet's
    // template copies (DGROUP 0x1384), into 437..445 (DGROUP 0x139A).
    auto facts = data::planetFacts(m_data.exe, p->nameId);
    // IMPROVED (I92): a planet known today shows what is known of it.
    if (const sim::Star* star = m_sim->db().get<sim::Star>(p->owner))
        if (auto known = sim::knownPlanetFacts(star->name, size_t(sel)); !known.empty()) facts = std::move(known);
    for (uint16_t id = 437; id <= 445; ++id)
        m_side->values[id] = size_t(id - 437) < facts.size() ? facts[size_t(id - 437)] : "-";
    // s9:0170 case 365 (s4:6086): once a geological penetrator has been to
    // the planet, its estimated mining sites are the middle of the range a
    // site draws from (s7:2F1A, by hostility) and its depth s7:2FAC's;
    // before that they keep the template's text.
    const bool probed = std::find(m_probedPlanets.begin(), m_probedPlanets.end(), m_planets[size_t(sel)]) !=
                        m_probedPlanets.end();
    int lo = 0, hi = 0;
    switch (p->hostility) {
        case 1: case 2: case 8: case 9: lo = 25; hi = 45; break;
        case 3: case 4: case 5: lo = 10; hi = 15; break;
        case 6: lo = 10; hi = 25; break;
        case 7: lo = 25; hi = 55; break;
        default: break;
    }
    const int depth = sim::maxDigDepth(p->hostility);
    if (probed) {
        m_side->values[446] = p->siteIds.empty() ? "None" : fmt(lo + (hi - lo) / 2);
        m_side->values[447] = fmt(depth) + (depth == 1 ? " level" : " levels");
    }
}

void StartFlow::showSite() {}

void StartFlow::loadSave(const std::filesystem::path& file, const std::string& name) {
    std::optional<std::vector<uint8_t>> bytes = m_files.read(file.string());
    if (!bytes) {
        std::ifstream f(file, std::ios::binary);
        if (f) bytes = std::vector<uint8_t>(std::istreambuf_iterator<char>(f), {});
    }
    data::OpsSave save;
    std::string err;
    if (!bytes || !save.parse(*bytes)) {
        showMessage("Load Game", "Cannot read " + name + ".");
        return;
    }
    auto sim = std::make_unique<sim::Simulation>(m_data, static_cast<uint32_t>(std::time(nullptr)));
    if (!sim::loadOps(*sim, save, nullptr, &err)) {
        showMessage("Load Game", "Cannot load " + name + ": " + err);
        return;
    }
    m_result.sim = std::move(sim);
    m_result.loadedFrom = file.string();
    m_done = true;
}

void StartFlow::finishNewGame() {
    m_result.sim = std::move(m_sim);
    m_result.newGame = std::move(m_newGame);
    m_done = true;
}

} // namespace outpost::app
