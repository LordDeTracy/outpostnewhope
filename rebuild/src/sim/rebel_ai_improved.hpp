// IMPROVED (I99): rebels that play, and trade with the player. In v1.51 the
// rebels' answer tables are empty (Q71): after their Seed and set-up they
// build nothing. Here a manager runs their colony each turn (step code
// RebelManager, between SCAiInput and SCMove): it builds what the colony
// needs in order (life support, food, homes, storage, a smelter, mines on
// free beacons, labs, schools, shops), paying the construction from the
// rebels' own stock (their buildings still cost nothing to put down and
// run as in v1.51, rebels.cpp untouched), and their colony grows while its
// homes have room. They trade: every so often they offer their surplus for
// what they lack, and the player can offer them a deal (the market's unit
// prices, s4:456A, with its swing). A first trade makes the trade agreement
// of the original (registry 0x3B, state 1) and, as there (s7:E410), the
// rebels put up a Trade center with its two tubes.
//
// Not saved (the save format has no room): after a load the attitude starts
// at 50 again and there is no standing offer.
#pragma once

#include "sim/object_db.hpp"
#include "sim/step_queue.hpp"

#include <cstdint>
#include <memory>
#include <optional>
#include <string>
#include <vector>

namespace outpost::sim {

class Simulation;
class Colony;

struct TradeGoods {
    uint16_t res{0};          // a resource id (17..28 refined, 30 Food)
    int32_t amount{0};
};

// A deal from the player's side: the player gives `give` and gets `get`.
struct TradeOffer {
    TradeGoods give, get;
    uint32_t expires{0};      // the last turn it stands
};

struct RebelRelations {
    int attitude{50};                 // 0 hostile .. 100 friendly
    std::optional<TradeOffer> offer;  // the rebels' standing offer
    uint32_t nextOfferTurn{25};
    uint32_t nextBuildTurn{6};
    int trades{0};                    // deals done
    int admired{0};                   // turns in a row the player's morale was 850+
};

// Notices the manager posts (channel kRebelNotice; the colony screen words
// them): code 1 a new offer, 2 a deal done, 3 an offer lapsed, 4 the rebels
// put up a building (value: its type), 5 the rebels joined the player (their
// colony is the player's now).
constexpr uint16_t kRebelNotice = 0x7E;

std::unique_ptr<Step> makeRebelManagerStep();

// The rebel colony (player 2) and the player's first colony, or none.
Colony* rebelColonyOf(Simulation& sim);
Colony* playerColonyOf(Simulation& sim);

// What a colony holds of a resource (its tiles' stock).
int32_t colonyStock(const Simulation& sim, const Colony& c, uint16_t res);

// The market's price of `amount` units (s4:427C: unit price, page 392, plus
// the swing).
int32_t tradeValue(const Simulation& sim, uint16_t res, int32_t amount);
const std::vector<uint16_t>& tradeableResources();

enum class TradeAnswer { Accepted, NoRebels, YouLack, TheyLack, TooLittle };
// The player offers a deal; the rebels answer by its value and their mood.
TradeAnswer proposeTrade(Simulation& sim, const TradeOffer& deal);
// The rebels' standing offer: taken (if the player has the goods) or turned down.
TradeAnswer acceptRebelOffer(Simulation& sim);
void declineRebelOffer(Simulation& sim);
std::string attitudeWord(int attitude);

} // namespace outpost::sim
