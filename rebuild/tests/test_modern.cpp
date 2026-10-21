// The rebuild's additions to the star selection (improvised.md I92): the
// modern galaxy and the sites made for new planets.
#include <catch2/catch_test_macros.hpp>

#include "data/game_files.hpp"
#include "data/terrain_gen.hpp"
#include "sim/modern_galaxy.hpp"
#include "sim/new_game.hpp"
#include "sim/simulation.hpp"
#include "sim/world.hpp"

#include <algorithm>
#include <array>

using namespace outpost;
using namespace outpost::sim;

namespace {

const GameData& gameData() {
    static struct D {
        data::GameFiles files;
        GameData data;
        D() {
            REQUIRE(files.open(OUTPOST_TEST_DATA_DIR));
            REQUIRE(data.load(files));
        }
    } d;
    return d.data;
}

} // namespace

TEST_CASE("Modern galaxy: 30 stars, today's planet lists", "[modern]") {
    NewGame game;
    REQUIRE(game.load(gameData()));
    game.modernize();
    const auto& t = game.tables();
    REQUIRE(t.stars.size() == 30);
    REQUIRE(t.starIds.size() == 30);
    auto row = [&](const std::string& name) {
        auto it = std::find_if(t.stars.begin(), t.stars.end(), [&](const auto& r) { return r.name == name; });
        REQUIRE(it != t.stars.end());
        return *it;
    };
    // Barnard's Star: v1.51's lone gas giant becomes four rocky worlds.
    REQUIRE(row("Barnard's Star").planetIds == std::vector<uint16_t>{1, 1, 1, 1});
    REQUIRE(hasLandableWorld(t, row("Barnard's Star")));
    REQUIRE_FALSE(hasLandableWorld(t, row("Sirius")));
    // Tau Ceti keeps its 1, 2, 4 and gains a second hot world.
    REQUIRE(row("Tau Ceti").madeUp == std::vector<bool>{false, true, false, false});
    REQUIRE(row("TRAPPIST-1").planetIds.size() == 7);
    REQUIRE(modernStarRecord("Proxima Centauri"));
    REQUIRE(modernStarRecord("Proxima Centauri")->distanceLy == "4.2");
}

TEST_CASE("Modern galaxy: a known planet's name and facts", "[modern]") {
    Simulation sim{gameData(), 7};
    NewGame game;
    REQUIRE(game.load(gameData()));
    game.modernize();
    game.start(sim);
    game.selectStar(sim, 22);                                // Proxima Centauri (the first added)
    std::vector<const Planet*> planets;
    for (const Planet* p : sim.db().allOf<Planet>(ObjType::Planet)) planets.push_back(p);
    REQUIRE(planets.size() == 2);
    REQUIRE(planets[0]->name == "Proxima Centauri b");
    REQUIRE_FALSE(planets[0]->siteIds.empty());
    for (uint16_t s : planets[0]->siteIds) REQUIRE(data::isGeneratedSite(s));
    const auto facts = knownPlanetFacts("Proxima Centauri", 0);
    REQUIRE(facts.size() == 9);
    REQUIRE(facts[4] == "0.0485");                           // mean distance, AU
}

TEST_CASE("Made sites: the same map from the same seed, shares like the originals", "[modern]") {
    const uint16_t index = data::kGeneratedSite | 1234;
    const auto a = data::generateSiteTerrain(index), b = data::generateSiteTerrain(index);
    REQUIRE(a.width == 300);
    REQUIRE(a.height == 150);
    REQUIRE(a.pixels == b.pixels);
    std::array<int, 4> n{};
    for (uint8_t v : a.pixels) {
        REQUIRE(v <= 3);
        ++n[v];
    }
    for (int k : n) REQUIRE(k > 0);
    // Neighbours agree about as often as on the 70 originals (73%).
    int same = 0, pairs = 0;
    for (int y = 0; y < a.height; ++y)
        for (int x = 1; x < a.width; ++x, ++pairs) same += a.at(x, y) == a.at(x - 1, y);
    REQUIRE(same * 100 / pairs >= 60);
    REQUIRE(gameData().terrainOfSite(index) != nullptr);
}
