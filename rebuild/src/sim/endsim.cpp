// SCEndSim (s6:6FF6, priority 999): the last step of every turn.
// findings/08-simulation.md §2.13.

#include "sim/building.hpp"
#include "sim/simulation.hpp"
#include "sim/steps.hpp"
#include "sim/world.hpp"

namespace outpost::sim {

namespace {

constexpr uint16_t kLog = 0x37;
const Handle kColony1 = Handle::make(ObjType::Colony, 1);
const Handle kPlayer1 = Handle::make(ObjType::Player, 1);

// The topics SCEndSim asks about before it declares victory, in its order:
// Astrophysics, Extraterrestrial Mining, Orbital Mechanics, Heavy Lifter,
// Mathematics, Wind Tunnels, Spacecraft Testing and Analysis.
constexpr int kVictoryTopics[] = {4, 42, 75, 84, 44, 60, 61};
constexpr int kMassDriverGroup = 34, kSpacePortGroup = 36, kRoboCmdGroup = 30;

// s2:E9A4: has a trade agreement in state 2 or 3 run out? Past a time that
// depends on the difficulty (shorter with +0x12 set), it lapses with odds of
// 50% (state 2) or 25% (state 3).
bool agreementLapses(Simulation& sim, const TradeAgreement& a) {
    const uint32_t age = sim.turn() - a.sinceTurn;
    uint32_t limit = 0;
    switch (sim.difficulty()) {
        case 1: case 2: limit = a.flag12 ? 10 : 30; break;
        case 3:         limit = a.flag12 ? 20 : 40; break;
        case 4:         limit = a.flag12 ? 30 : 50; break;
        default:        break;
    }
    if (age <= limit) return false;
    const int r = sim.random(1, 100);
    const int odds = a.state == 2 ? 50 : a.state == 3 ? 25 : 0;
    return odds > r;
}

// s2:DF4A (registry 0x3B): every agreement in state 2 or 3 is tested, and
// the answer is thrown away (quirk Q35): only the random draws remain.
void ageTradeAgreements(Simulation& sim) {
    for (const TradeAgreement& a : sim.tradeAgreements())
        if (a.state == 2 || a.state == 3) (void)agreementLapses(sim, a);
}

// s4:3D6C (registry 0x3C, via s4:34A6): the price swing walks
// 0 -> 10 -> 20 -> 30 or 0 -> -10 -> -20 -> -30, one step a turn, and
// returns to 0 from +-30 on a turn divisible by 5. Which way it goes from 0:
// up on Beginner/Easy, down on Hard, a coin toss (random 1..100 >= 50 goes
// down) on Medium.
void tickMarket(Simulation& sim) {
    TradeMarket& m = sim.tradeMarket();
    switch (m.swing) {
        case 0:
            switch (sim.difficulty()) {
                case 1: case 2: m.swing = 10; break;
                case 3:         m.swing = sim.random(1, 100) >= 50 ? -10 : 10; break;
                case 4:         m.swing = -10; break;
                default:        break;
            }
            break;
        case 10:  m.swing = 20; break;
        case 20:  m.swing = 30; break;
        case -10: m.swing = -20; break;
        case -20: m.swing = -30; break;
        case 30: case -30:
            if (sim.turn() % 5 == 0) m.swing = 0;
            break;
        default: break;
    }
}

// s8:3BA0: the colony's table of operational RoboCmd tiles.
void rebuildRoboCommands(Simulation& sim, Colony& c) {
    c.roboCommands.clear();
    for (Tile* t : sim.colonyTilesInGroup(c, kRoboCmdGroup)) c.roboCommands.push_back(t->self);
}

class EndSimStep final : public Step {
public:
    std::string_view name() const override { return "SCEndSim"; }
    uint16_t priority() const override { return stepcode::EndSim - 1; }
    void calcMe(Simulation& sim) override {
        auto& db = sim.db();
        const auto colonies = db.allOf<Colony>(ObjType::Colony);

        // 1. Every populated player colony is empty: log 6 (all dead).
        bool anyPopulated = false, allDead = true;
        for (Colony* c : colonies) {
            if (!c->populated || c->player == kRebelPlayer) continue;
            anyPopulated = true;
            if (c->population.total() > 0) { allDead = false; break; }
        }

        // 2. Player 1 owns no colony (while colony 1 exists): the game is
        // lost; alerts 1-5, 7, 8 and 10 are switched off.
        bool player1HasColony = false;
        for (Colony* c : colonies)
            if (c->player == kPlayer1) player1HasColony = true;
        if (!player1HasColony && db.get<Colony>(kColony1)) {
            sim.setGameLost();
            for (const uint16_t id : {uint16_t{1}, uint16_t{2}, uint16_t{3}, uint16_t{4}, uint16_t{5},
                                      uint16_t{7}, uint16_t{8}, uint16_t{10}})
                sim.disableAlert(id);
        }
        if (anyPopulated && allDead) sim.post({kLog, 6, Handle{}, 0});

        // 3. Victory: player 1 has the seven topics, and the player's
        // colonies have an operational Mass Driver and SpacePort (not
        // necessarily in the same colony). The loop does not stop there, so
        // log 0x14 is posted again for each later player colony (Q36).
        if (const Player* p = db.get<Player>(kPlayer1)) {
            bool ready = true;
            for (int topic : kVictoryTopics)
                if (p->progress(topic) != 0) { ready = false; break; }
            if (ready) {
                bool massDriver = false, spacePort = false;
                for (Colony* c : colonies) {
                    if (c->player == kRebelPlayer) continue;
                    if (!massDriver && !sim.colonyTilesInGroup(*c, kMassDriverGroup).empty())
                        massDriver = true;
                    if (!spacePort && !sim.colonyTilesInGroup(*c, kSpacePortGroup).empty())
                        spacePort = true;
                    if (massDriver && spacePort) sim.post({kLog, 0x14, Handle{}, 0});
                }
            }
        }

        // 4. With colony 1: trade, then the RoboCmd tables.
        if (!db.get<Colony>(kColony1)) return;
        ageTradeAgreements(sim);
        tickMarket(sim);
        for (Colony* c : colonies)
            if (c->player != kRebelPlayer) rebuildRoboCommands(sim, *c);
    }
};

} // namespace

std::unique_ptr<Step> makeEndSimStep() { return std::make_unique<EndSimStep>(); }

} // namespace outpost::sim
