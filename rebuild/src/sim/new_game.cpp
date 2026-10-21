#include "sim/new_game.hpp"

#include "sim/building.hpp"
#include "sim/modern_galaxy.hpp"
#include "sim/simulation.hpp"
#include "sim/step_queue.hpp"

#include <algorithm>

namespace outpost::sim {

namespace {

constexpr size_t kGalaxy = 0x518C;
constexpr size_t kStars = 0x51B8;
constexpr size_t kStarRow = 18;
constexpr size_t kPlanets = 0x5332;
constexpr size_t kPlanetRow = 0x5E;
constexpr size_t kPlanetTemplates = 10;          // the highest id the star rows use

class SelectStep : public Step {
public:
    SelectStep(NewGame& game, Handle target) : m_game(game), m_target(target) {}
    std::string_view name() const override { return "SCSelect"; }
    uint16_t priority() const override { return NewGame::kStepPriority; }
    // s7:538A, when queued: a star becomes the view's star (+0x1A, s4:04CA),
    // a planet the view's planet (+0x16, s4:04A4), whose record gives
    // SCMorale its hostility and whose fields the terraforming.
    bool shouldRun(Simulation& sim) override {
        if (m_target.type() == ObjType::Planet)
            if (const Planet* p = sim.db().get<Planet>(m_target)) {
                sim.setPlanetHostility(p->hostility);
                sim.terraforming().turnsLeft = p->terraformTurns;
                sim.terraforming().atmosphere = p->atmosphere;
                sim.terraforming().field1A = p->field1A;
            }
        return true;
    }
    // s7:53F4
    void calcMe(Simulation& sim) override {
        const auto type = static_cast<uint8_t>(m_target.value >> 24);
        if (type == 0xFF) {
            m_game.createGalaxy(sim);                         // s6:E2E0 -> s6:EBEE
        } else if (type == static_cast<uint8_t>(ObjType::Site)) {
            m_game.selectSite(sim, m_target);                 // s6:E44A
        } else {
            m_game.selectObject(sim, m_target);               // s6:E372
        }
        if (type == static_cast<uint8_t>(ObjType::Site)) return;
        sim.enqueue(m_game.makeGenKidsStep(m_target));
        // A planet also plays its sound (s3:82F8, record +0; UI).
    }

private:
    NewGame& m_game;
    Handle m_target;
};

class GenKidsStep : public Step {
public:
    GenKidsStep(NewGame& game, Handle target) : m_game(game), m_target(target) {}
    std::string_view name() const override { return "SCGenKids"; }
    uint16_t priority() const override { return NewGame::kStepPriority; }
    // s7:5260: slot 5 of the target.
    void calcMe(Simulation& sim) override { m_game.generateKids(sim, m_target); }

private:
    NewGame& m_game;
    Handle m_target;
};

// Puts a child into slot `i` of a children list (the named object's list,
// s7:1CD8, insert at a position).
void setChild(std::vector<Handle>& children, size_t i, Handle h) {
    if (children.size() <= i) children.resize(i + 1);
    children[i] = h;
}

// Named object, remove child (slot +0x18): its slot becomes 0.
void clearChild(std::vector<Handle>& children, Handle h) {
    for (Handle& c : children)
        if (c == h) {
            c = Handle{};
            return;
        }
}

} // namespace

void fillDisasterCalendar(Simulation& sim) {                  // s3:E9E4
    static constexpr int32_t kBase[9] = {0, 250, 350, 450, 450, 550, 650, 115, 150};
    auto& cal = sim.disasterSchedule();
    cal[0] = 0;
    for (size_t i = 1; i < cal.size(); ++i) {
        int32_t d = sim.random(0, 29);
        if (sim.random(1, 2) & 1) d = -d;
        cal[i] = static_cast<uint32_t>(kBase[i] + d);
    }
}

bool UniverseTables::load(const GameData& data, std::string* error) {
    auto fail = [&](const std::string& e) { if (error) *error = e; return false; };
    const auto d = data.exe.dgroup();
    if (kPlanets + kPlanetTemplates * kPlanetRow > d.size()) return fail("universe tables not found");
    auto w = [&](size_t o) { return static_cast<int16_t>(d[o] | (d[o + 1] << 8)); };

    starIds.clear();
    const auto n = static_cast<uint16_t>(w(kGalaxy));
    for (uint16_t i = 0; i < n; ++i) starIds.push_back(static_cast<uint16_t>(w(kGalaxy + 2 + 2 * i)));

    stars.clear();
    for (size_t i = 0; i < n; ++i) {
        const size_t o = kStars + i * kStarRow;
        StarRow s;
        s.nameId = static_cast<uint16_t>(w(o));
        s.name = data.strings.get(s.nameId);
        const auto count = static_cast<uint16_t>(w(o + 2));
        s.pos = {w(o + 4), w(o + 6), w(o + 8)};
        for (uint16_t k = 0; k < count && k < 4; ++k) s.planetIds.push_back(static_cast<uint16_t>(w(o + 10 + 2 * k)));
        stars.push_back(std::move(s));
    }

    planets.clear();
    for (size_t i = 0; i < kPlanetTemplates; ++i) {
        const size_t o = kPlanets + i * kPlanetRow;
        PlanetRow p;
        p.pos = {w(o), w(o + 2), w(o + 4)};
        for (size_t k = 0; k < p.traits.size(); ++k) p.traits[k] = w(o + 6 + 2 * k);
        p.hostility = w(o + 0x16);
        p.rec0E = static_cast<int32_t>(static_cast<uint16_t>(w(o + 0x18)) |
                                       (static_cast<uint32_t>(static_cast<uint16_t>(w(o + 0x1A))) << 16));
        p.poolSize = w(o + 0x1C);
        p.minSites = w(o + 0x1E);
        p.maxSites = w(o + 0x20);
        for (size_t k = 0; k < p.sites.size(); ++k) p.sites[k] = w(o + 0x22 + 2 * k);
        planets.push_back(p);
    }
    return true;
}

bool NewGame::load(const GameData& data, std::string* error) { return m_tables.load(data, error); }

void NewGame::modernize() { modernizeGalaxy(m_tables); }

std::unique_ptr<Step> NewGame::makeSelectStep(Handle target) {
    return std::make_unique<SelectStep>(*this, target);
}

std::unique_ptr<Step> NewGame::makeGenKidsStep(Handle target) {
    return std::make_unique<GenKidsStep>(*this, target);
}

void NewGame::runOneTurnFromZero(Simulation& sim) {
    sim.runTurns(1);                                          // s7:838E
    sim.setTurn(0);                                           // s7:8334
}

void NewGame::start(Simulation& sim) {
    sim.createPlayer();                                       // s6:E2E0(type 8) -> s7:1120
    sim.createPlayer();
    fillDisasterCalendar(sim);                                // the view's first use (I36)
    sim.enqueue(makeSelectStep(Handle{0xFF000000u}));
    runOneTurnFromZero(sim);
}

void NewGame::selectStar(Simulation& sim, uint16_t star) {
    sim.enqueue(makeSelectStep(Handle::make(ObjType::Star, star)));
    runOneTurnFromZero(sim);
}

void NewGame::selectPlanet(Simulation& sim, Handle planet) {
    sim.enqueue(makeSelectStep(planet));
    runOneTurnFromZero(sim);
}

void NewGame::createGalaxy(Simulation& sim) {
    Galaxy g;                                                 // s7:1A32: a new one
    g.starIds = m_tables.starIds;                             // s7:4574
    sim.galaxy() = std::move(g);
}

Star& NewGame::createStar(Simulation& sim, uint16_t id, Handle owner) {
    Star& s = sim.db().create<Star>(ObjType::Star, owner);    // s7:5D3C
    if (id >= 1 && id <= m_tables.stars.size()) {            // s7:4594
        const auto& row = m_tables.stars[id - 1u];
        s.name = row.name;
        s.pos = row.pos;
        s.planetIds = row.planetIds;
    }
    return s;
}

Planet& NewGame::createPlanet(Simulation& sim, uint16_t id, Handle owner) {
    Planet& p = sim.db().create<Planet>(ObjType::Planet, owner);   // s7:299A
    p.nameId = id;                                            // s6:ECAC: record +0
    if (id < 1 || id > m_tables.planets.size()) return p;
    auto& row = m_tables.planets[id - 1u];                    // s7:4628
    p.pos = row.pos;
    p.hostility = row.hostility;
    p.rec0E = row.rec0E;
    p.traits = row.traits;
    const int16_t n = sim.random(row.minSites, row.maxSites);
    const int16_t base = row.sites[0];
    row.sites.fill(0);                                        // the template itself (Q53)
    for (int16_t i = 0; i < n && i < static_cast<int16_t>(row.sites.size()); ++i) {
        for (;;) {
            const int16_t r = sim.random(base, static_cast<int16_t>(base + row.poolSize - 1));
            // Compared with the slots 0..i, the last still 0: so 0 is never
            // drawn (planet 4's pool starts at 0).
            bool taken = false;
            for (int16_t j = 0; j <= i; ++j)
                if (row.sites[static_cast<size_t>(j)] == r) taken = true;
            if (taken) continue;
            row.sites[static_cast<size_t>(i)] = r;
            break;
        }
    }
    for (int16_t i = 0; i < n && i < static_cast<int16_t>(row.sites.size()); ++i)
        p.siteIds.push_back(static_cast<uint16_t>(row.sites[static_cast<size_t>(i)]));
    return p;
}

void NewGame::selectObject(Simulation& sim, Handle target) {
    if ((target.value >> 24) == 0xFF) return;
    const DbObject* selected = sim.db().resolve(target);
    if (!selected) return;
    const Handle owner = selected->owner;
    std::vector<Handle> others;
    for (DbObject* o : sim.db().all(target.type()))
        if (o->self.index() != target.index()) others.push_back(o->self);
    for (Handle h : others) {
        sim.db().destroy(h);                                  // s7:13F6
        // The owner's slot 0x18: clear the child.
        if ((owner.value >> 24) == 0xFF) {
            clearChild(sim.galaxy().children, h);
        } else if (auto* star = sim.db().get<Star>(owner)) {
            clearChild(star->children, h);
        } else if (auto* planet = sim.db().get<Planet>(owner)) {
            clearChild(planet->children, h);
        } else if (auto* site = sim.db().get<Site>(owner)) {
            clearChild(site->children, h);
        }
    }
}

void NewGame::selectSite(Simulation&, Handle) {
    // IMPROVED (I110): v1.51 destroys every other site of the planet and
    // their tiles here (selectObject, then the tiles off the chosen site), so
    // no second colony could be founded elsewhere. The rebuild keeps them:
    // the planet window shows them and a Command Center can found a colony
    // on one.
}

void NewGame::generateKids(Simulation& sim, Handle target) {
    if ((target.value >> 24) == 0xFF) {                       // s7:1BE2
        Galaxy& g = sim.galaxy();
        const std::vector<uint16_t> ids = g.starIds;
        for (size_t i = 0; i < ids.size(); ++i) {
            Star& s = createStar(sim, ids[i], g.self);
            setChild(sim.galaxy().children, i, s.self);
        }
        return;
    }
    switch (target.type()) {
        case ObjType::Star: {                                 // s7:5FF6
            Star* star = sim.db().get<Star>(target);
            if (!star) return;
            const std::vector<uint16_t> ids = star->planetIds;
            const std::string starName = star->name;
            const Handle self = star->self;
            // IMPROVED (I92): the planets the original row does not have.
            std::vector<bool> madeUp;
            for (const auto& row : m_tables.stars)
                if (row.name == starName) madeUp = row.madeUp;
            for (size_t i = 0; i < ids.size(); ++i) {
                Planet& p = createPlanet(sim, ids[i], self);
                if (Star* s = sim.db().get<Star>(self)) setChild(s->children, i, p.self);
                if (p.name.empty()) p.name = starName + " " + std::to_string(i + 1);   // "%s %d"
                if (!madeUp.empty())                                    // a modernized galaxy (I92)
                    if (std::string known = knownPlanetName(starName, i); !known.empty()) p.name = known;
                if (i < madeUp.size() && madeUp[i] && !p.siteIds.empty()) {
                    // As many sites as the template draws, each with a map
                    // made from its seed (data/terrain_gen.hpp).
                    for (uint16_t& site : p.siteIds)
                        site = uint16_t(data::kGeneratedSite | uint16_t(sim.random(1, 0x7FFF)));
                }
            }
            return;
        }
        case ObjType::Planet:                                 // s7:3058
            if (Planet* p = sim.db().get<Planet>(target)) sim.generateSites(*p);
            return;
        default:
            return;                                           // s7:1972: nothing
    }
}

} // namespace outpost::sim
