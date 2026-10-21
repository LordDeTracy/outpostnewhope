#include "sim/research.hpp"

#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <initializer_list>

namespace outpost::sim {

namespace {

const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);

bool allDone(const Player& p, std::initializer_list<int> topics) {   // s3:6CA2
    for (int t : topics)
        if (p.progress(t) != 0) return false;
    return true;
}

} // namespace

int16_t researchPoints(Simulation& sim) {
    const Colony* c = sim.db().get<Colony>(kColony1);
    if (!c) return 0;                     // IMPROVISED (guard): the original reads NULL
    const int m = c->morale;
    const uint32_t turn = sim.turn();
    if (m < 250) return (turn & 1) ? 1 : 0;
    if (m < 450) return turn % 3 != 0 ? 1 : 0;
    if (m < 550) return 1;
    if (m < 750) return turn % 3 == 0 ? 2 : 1;
    return 2;
}

bool researchStep(Simulation& sim, Player& p, bool hotLab, uint16_t topic, int16_t bonus) {
    if (topic >= p.remaining.size()) return false;
    int16_t& left = p.remaining[topic];
    if (left < 0) {
        // The lab's own tree (registry 0x41 / 0x31). IMPROVISED (guard): the
        // original would crash on a topic outside the lab's tree; here the
        // other tree is used.
        const auto* t = sim.data().research.find(topic);
        for (const auto& c : sim.data().research.topics())
            if (c.id == topic && c.advanced == hotLab) t = &c;
        left = t ? static_cast<int16_t>(t->cost) : 0;
    }
    if (left == 0) return true;

    int16_t pts = static_cast<int16_t>(researchPoints(sim) + bonus);
    bool priorityBonus = false;
    if (p.discoveries[30] != 0 && p.priorityIndex(topic) >= 0) {   // Multiple AI(5)
        ++pts;
        priorityBonus = true;
    }
    left = static_cast<int16_t>(std::max(0, left - pts));
    if (!p.workedThisTurn[topic]) {
        p.workedThisTurn[topic] = 1;
        p.minTurns[topic] = static_cast<int16_t>(std::max(0, p.minTurns[topic] - 1));
    }
    if (left == 0 && p.minTurns[topic] == 0) {
        sim.post({0x32, topic, Handle{}, 0});       // registry 0x32: research results
        grantDiscoveries(sim, topic);
        applyResearch(sim, p, topic);
        if (priorityBonus) p.priority[static_cast<size_t>(p.priorityIndex(topic))] = 0;
        return true;
    }
    if (left == 0) left = 1;                        // wait for the minimum turns
    return false;
}

void applyResearch(Simulation& sim, Player& p, uint16_t topic) {
    for (Colony* c : sim.db().allOf<Colony>(ObjType::Colony)) {
        if (c->player != p.self) continue;
        auto& chance = c->population.deathChance;
        switch (topic) {
            case 10: case 16: case 17: case 19:     // Pharmacology, Anatomy, Comp. Physiology, Immunology
                for (int g = 1; g < 6; ++g)
                    chance[static_cast<size_t>(g)] = static_cast<int16_t>(std::max(1, chance[static_cast<size_t>(g)] - 1));
                break;
            case 18:                                 // Embryology
                chance[1] = static_cast<int16_t>(std::max(1, chance[1] - 25));
                break;
            case 95: case 101: case 102:             // Psychology, Social Stratification, Cultural Change
            case 107: case 108: case 109: case 110: case 111:   // the humanities
                c->setMorale(static_cast<int16_t>(std::min(1000, c->morale + 25)));
                break;
            default:
                break;
        }
    }
}

namespace {

// The switch of s3:6CF8 over a sink: `s.done({...})` asks whether all the
// topics are complete, `s.grant(d)` grants a discovery. grantDiscoveries
// runs it on the player; topicGrants records what it would grant.
template <class Sink>
void walkGrants(uint16_t topic, Sink& s) {
    auto grant = [&](uint16_t d) { s.grant(d); };
    auto done = [&](std::initializer_list<int> topics) { return s.done(topics); };

    // Shared tails of the switch (s3:6D66, s3:6DFA, s3:6F9E).
    auto lifeSciences = [&] {
        if (topic == 117) { grant(8); grant(9); }
        if (done({129, 23, 24, 25, 33, 12, 117})) grant(16);
        if (done({23, 24, 25})) grant(17);
        if (topic == 33) grant(20);
        if (topic == 12) { grant(9); grant(11); }
    };
    auto engineering = [&] {
        if (done({29, 90})) grant(18);
        if (done({42, 44, 60, 61, 75, 83, 84, 85})) grant(26);
        if (topic == 44) grant(29);
        if (done({90, 44})) grant(28);
    };
    auto computing = [&] {
        if (topic == 126) grant(44);
        if (topic == 91) grant(56);
        if (topic == 31) grant(63);
        if (topic == 127) grant(66);
        if (done({27, 31, 91, 120, 126}) || done({27, 31, 91, 120, 127})) grant(55);
    };

    switch (topic) {
        case 1: grant(1); break;                    // also refreshes the lab windows
        case 4: grant(2); break;
        case 5: grant(3); break;
        case 6: grant(4); break;
        case 7: grant(5); break;
        case 9: grant(6); grant(56); break;
        case 10: case 128: grant(45); break;
        case 11: grant(7); break;
        case 12: case 23: case 24: case 25: case 33: case 117: case 129: lifeSciences(); break;
        case 14: grant(12); grant(11); break;
        case 16: case 17: case 19: grant(13); break;
        case 18: grant(14); break;
        case 27: case 31: case 91: case 120: case 126: case 127: computing(); break;
        case 29: case 42: case 44: case 60: case 61: case 75: case 83: case 84: case 85: case 90:
            engineering(); break;
        case 30: grant(19); break;
        case 34: grant(21); break;
        case 37: grant(22); break;
        case 38: grant(23); grant(19); break;
        case 39: grant(24); break;
        case 41: grant(25); break;
        case 43: grant(27); break;
        case 46: grant(56); break;
        case 47: case 54: if (done({47, 54})) grant(30); break;
        case 48: grant(31); break;
        case 49: grant(53); break;
        case 51: grant(33); break;
        case 52: grant(34); break;
        case 53: grant(35); grant(52); break;
        case 56: grant(36); grant(61); break;
        case 57: grant(37); break;
        case 62: grant(38); grant(40); grant(39); break;
        case 64: grant(42); break;
        case 65: grant(57); break;
        case 66: grant(58); break;
        case 68: grant(54); break;
        case 69: grant(59); break;
        case 73: grant(41); break;
        case 80: grant(43); break;
        case 86: grant(60); grant(62); break;
        case 93: grant(47); grant(64); break;
        case 94: case 96: grant(47); break;
        case 95: grant(52); grant(65); break;
        case 97: grant(48); break;
        case 99: grant(49); break;
        case 100: grant(36); break;
        case 101: case 102: case 107: case 108: case 109: case 110: case 111: grant(52); break;
        case 104: grant(50); break;
        case 105: grant(51); break;
        case 118: grant(10); grant(11); break;
        default: break;
    }
}

} // namespace

void grantDiscoveries(Simulation& sim, uint16_t topic) {
    Player* p1 = sim.db().get<Player>(kPlayer1);
    if (!p1) return;
    struct Live {
        Simulation& sim;
        const Player& p;
        bool done(std::initializer_list<int> topics) const { return allDone(p, topics); }
        void grant(uint16_t d) { grantDiscovery(sim, d); }
    } live{sim, *p1};
    walkGrants(topic, live);
}

std::vector<uint16_t> topicOpensNeeds(uint16_t topic) {
    switch (topic) {
        case 50: return {50, 77};             // s3:94BC
        case 63: return {63, 78};             // s3:94D0
        case 115: return {9};                 // s2:EEEA
        case 119: return {46};                // s2:EEF2
        case 121: return {91};                // s2:EEEE
        case 125: return {124, 125, 120};     // s2:EEF6
        default: return {topic};
    }
}

bool topicOpens(const Player& player, uint16_t topic) {
    for (uint16_t t : topicOpensNeeds(topic))
        if (player.progress(t) != 0) return false;   // s3:A5CA
    return true;
}

std::vector<TopicGrant> topicGrants(uint16_t topic) {
    // Every condition is taken as met and recorded with the grant it guards
    // (of "A or B", only A).
    struct Record {
        std::vector<TopicGrant> out;
        std::vector<uint16_t> pending;
        bool done(std::initializer_list<int> topics) {
            pending.clear();
            for (int t : topics) pending.push_back(static_cast<uint16_t>(t));
            return true;
        }
        void grant(uint16_t d) {
            out.push_back({d, std::move(pending)});
            pending.clear();
        }
    } rec;
    walkGrants(topic, rec);
    return rec.out;
}

namespace {

// s3:A69C, after the discovery is recorded: what the build menu (registry
// 0x35) offers changes. Upgrades replace the offered version of a building
// by the next (s3:ABD2).
void changeBuildMenu(Simulation& sim, const Player& p, uint16_t d) {
    BuildMenu& m = sim.buildMenu();
    const bool techAdvance = p.discoveries[37] != 0;      // "Tech Level Advance" (+0x160)
    switch (d) {
        case 10: case 12: m.upgrade({27, 28, 29}); break;                 // agri domes
        case 16:                                                          // Terraforming
            m.offer(45);
            if (techAdvance) m.upgrade({45, 46});
            break;
        case 18:                                                          // monorail
            m.offer(22); m.offer(23); m.offer(24); m.offer(64); m.offer(63);
            break;
        case 19: m.upgrade({53, 54}); break;                              // smelter
        case 25: m.field148 = 0x34; break;
        case 26: m.offer(15); break;                                      // Space Program: SpacePort
        case 28: m.offer(17); break;                                      // Mass Driver
        case 29: case 36: m.upgrade({30, 31, 32}); m.upgrade({91, 92}); break;   // factories
        case 30:                                                          // Multiple AI(5)
            // s3:08C0 also switches on an entry of the second alert table
            // (DGROUP 0xEA8; UI). s2:B69C makes the five AI managers.
            if (sim.aiManagers().empty()) sim.aiManagers().resize(5);
            break;
        case 34: m.offerProduct(8); break;                                // Repair Robots
        case 35: m.offerProduct(12); break;                               // Humanoid Workers
        case 37:                                                          // Tech Level Advance
            m.upgrade({20, 21}); m.upgrade({27, 28, 29}); m.upgrade({30, 31, 32});
            m.upgrade({34, 35, 36}); m.upgrade({37, 38, 39}); m.upgrade({40, 41});
            m.upgrade({42, 43}); m.upgrade({45, 46}); m.upgrade({47, 48}); m.upgrade({49, 50});
            m.upgrade({53, 54}); m.upgrade({56, 57}); m.upgrade({58, 59}); m.upgrade({60, 61});
            m.upgrade({72, 73, 74}); m.upgrade({79, 80, 81}); m.upgrade({82, 83});
            m.upgrade({84, 85, 86}); m.upgrade({87, 88, 89}); m.upgrade({91, 92});
            m.upgrade({93, 94, 95}); m.upgrade({98, 99}); m.upgrade({102, 103});
            m.upgrade({104, 105}); m.upgrade({108, 109});
            m.field148 = 0x34;
            break;
        case 41: m.upgrade({37, 38, 39}); break;                          // comm towers
        case 42: m.offerProduct(15); break;                               // Meteor Defense System
        case 43: m.offer(110); break;                                     // Geothermal Power
        case 48: m.upgrade({84, 85, 86}); break;                          // UG university
        case 51: m.upgrade({49, 50}); m.upgrade({108, 109}); break;       // police
        case 54: m.offerProduct(19); break;                               // Weather Satellites
        case 55: m.offer(44); break;                                      // Nanotechnology
        case 56:                                                          // Hot Lab Facility
            m.offer(40);
            if (techAdvance) m.upgrade({40, 41});
            break;
        case 57: m.offerProduct(16); break;                               // Comm./Nav. Sat.
        case 58: m.offerProduct(17); break;                               // Solar Power Sat.
        case 59: m.offerProduct(18); break;                               // Orbital Observer
        case 60: m.upgrade({20, 21}); m.upgrade({98, 99}); break;         // tokamaks
        case 61:                                                          // Administration Facility
            m.offer(102);
            if (techAdvance) m.upgrade({102, 103});
            break;
        case 62: m.upgrade({93, 94, 95}); break;                          // UG labs
        case 63: m.upgrade({34, 35, 36}); break;                          // SPEW
        case 64: m.upgrade({87, 88, 89}); break;                          // UG commercial
        case 65: m.upgrade({79, 80, 81}); break;                          // UG residences
        default: break;
    }
}

} // namespace

void grantDiscovery(Simulation& sim, uint16_t discovery) {
    Player* p = sim.db().get<Player>(kPlayer1);
    if (!p) return;
    sim.post({0x32, 0x100, Handle{}, discovery});
    if (discovery == 1) {                           // Basic Research
        for (size_t t = 0; t < p->remaining.size(); ++t) {
            int16_t v = p->progress(static_cast<int>(t));
            if (v <= 25) continue;
            v = static_cast<int16_t>(std::max(25, v - 5));
            p->remaining[t] = v;
        }
        return;
    }
    if (discovery < p->discoveries.size()) ++p->discoveries[discovery];   // s7:25F0
    changeBuildMenu(sim, *p, discovery);
}

} // namespace outpost::sim
