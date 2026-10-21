#include "sim/modern_galaxy.hpp"

#include <algorithm>
#include <cmath>
#include <cstdio>
#include <map>
#include <vector>

namespace outpost::sim {

namespace {

// Each system as known today: its data window's texts (class, mass in
// suns, distance in light years, the chance of a habitable planet, stored
// as the original's are), its planets inner to outer as templates, and for
// an added star its place on the chart (the star table's x 0..335, y about
// 40 + 3.3 per light year, z -80..90).
struct System {
    data::StarRecord record;
    std::vector<uint16_t> planets;
    bool isAdded{false};
    Pos3 pos;
};

std::string fixed(double v, int places) {
    char b[32];
    std::snprintf(b, sizeof b, "%.*f", places, v);
    return b;
}

System sys(const char* name, const char* cls, const char* mass, double ly, const char* chance,
           std::vector<uint16_t> planets, bool isAdded = false, Pos3 pos = {}) {
    System a;
    a.record.name = name;
    a.record.spectralClass = cls;
    a.record.mass = mass;
    a.record.distanceLy = fixed(ly, 1);
    a.record.voyageYears = fixed(ly * 4.9 + 3.6, 2);       // the original's travel times follow this
    a.record.factor = chance;
    a.record.planetCount = uint16_t(planets.size());
    a.planets = std::move(planets);
    a.isAdded = isAdded;
    a.pos = pos;
    return a;
}

const std::vector<System>& systems() {
    static const std::vector<System> k = {
        // The 21 of v1.51. A system with no planet known keeps one world it
        // can be landed on (or, with none, its original list).
        sys("Tau Ceti", "G8", "0.78", 11.9, "0.045", {1, 1, 2, 4}),           // g, h hot; e, f at the zone's edges
        sys("Alpha Centauri B", "K1", "0.91", 4.4, "0.020", {4}),           // none confirmed
        sys("Alpha Centauri A", "G2", "1.08", 4.4, "0.030", {4, 5}),        // JWST giant candidate (2025)
        sys("Epsilon Eridani", "K2", "0.82", 10.5, "0.010", {9, 5}),        // one giant among dust belts
        sys("70 Ophiuchi A", "K0", "0.89", 16.6, "0.015", {4}),
        sys("Eta Cassiopeiae A", "G0", "0.97", 19.4, "0.020", {4}),
        sys("Sigma Draconis", "G9", "0.85", 18.8, "0.030", {4}),
        sys("36 Ophiuchi A", "K2", "0.85", 19.5, "0.010", {8}),
        sys("36 Ophiuchi B", "K1", "0.85", 19.5, "0.010", {10}),
        sys("HR 7703 A", "K2", "0.74", 19.7, "0.010", {7}),
        sys("82 Eridani", "G8", "0.85", 19.7, "0.030", {1, 1, 2}),          // b, c hot; d at the inner edge
        sys("Beta Hydri", "G2", "1.08", 24.3, "0.010", {4}),                // an ageing subgiant
        sys("HR 8832", "K3", "0.81", 21.3, "0.015", {1, 1, 1, 1, 7, 5}),    // HD 219134 b c f d; g; h
        sys("Barnard's Star", "M4", "0.16", 6.0, "0.005", {1, 1, 1, 1}),   // b, c, d, e (2024-2025), all hot
        sys("Wolf 359", "M6", "0.11", 7.9, "0.005", {1, 7}),               // a flare star; c, b candidates
        sys("Sirius", "A1", "2.06", 8.6, "0.000", {5}),
        sys("Ross 248", "M6", "0.14", 10.3, "0.005", {5}),
        sys("Procyon", "F5", "1.50", 11.5, "0.000", {5}),
        sys("Kruger 60", "M3", "0.27", 13.1, "0.005", {5}),
        sys("Alpha Aquilae", "A7", "1.86", 16.7, "0.000", {5}),
        sys("Delta Pavonis", "G8", "0.99", 19.9, "0.040", {4}),
        // Added: nearby systems with planets known today.
        sys("Proxima Centauri", "M5", "0.12", 4.2, "0.040", {3, 1}, true, {296, 50, 48}),
        sys("Ross 128", "M4", "0.17", 11.0, "0.045", {4}, true, {160, 78, 60}),
        sys("Luyten's Star", "M3", "0.26", 12.4, "0.045", {3, 1}, true, {112, 82, -58}),
        sys("Teegarden's Star", "M7", "0.09", 12.5, "0.050", {3, 4, 8}, true, {40, 82, 75}),
        sys("Gliese 1061", "M5", "0.12", 12.0, "0.045", {1, 3, 4}, true, {64, 80, -42}),
        sys("YZ Ceti", "M4", "0.13", 12.1, "0.005", {1, 1, 1}, true, {22, 80, -28}),
        sys("Wolf 1061", "M3", "0.29", 14.0, "0.030", {1, 2, 8}, true, {246, 86, -18}),
        sys("Gliese 667 C", "M1", "0.33", 23.6, "0.045", {1, 4}, true, {262, 118, 8}),
        sys("TRAPPIST-1", "M8", "0.09", 40.7, "0.055", {1, 1, 2, 4, 3, 8, 8}, true, {175, 126, 75}),
    };
    return k;
}

// The planets known today, in the order of each system's list: name,
// mass and (when it transits) radius in Earths, orbit in AU, year in
// days; nullptr for a world the original list keeps (its facts stay the
// template's Sol body). With the star's luminosity (suns).
struct KnownPlanet {
    const char* name;
    double mass{0}, radius{0}, au{0}, days{0};
};
struct KnownSystem {
    const char* star;
    double luminosity;
    std::vector<KnownPlanet> planets;
};

const std::vector<KnownSystem>& knownPlanets() {
    static const std::vector<KnownSystem> k = {
        {"Tau Ceti", 0.52, {{"Tau Ceti g", 1.75, 0, 0.133, 20.0}, {"Tau Ceti h", 1.83, 0, 0.243, 49.4},
                            {"Tau Ceti e", 3.93, 0, 0.538, 162.9}, {"Tau Ceti f", 3.93, 0, 1.334, 636}}},
        {"Alpha Centauri A", 1.52, {{nullptr}, {"Alpha Centauri Ab", 100, 0, 2.0, 1100}}},
        {"Epsilon Eridani", 0.34, {{nullptr}, {"Epsilon Eridani b", 210, 0, 3.5, 2690}}},
        {"82 Eridani", 0.69, {{"82 Eridani b", 2.7, 0, 0.121, 18.3}, {"82 Eridani c", 2.4, 0, 0.217, 40.1},
                              {"82 Eridani d", 4.8, 0, 0.349, 90.3}}},
        {"HR 8832", 0.27, {{"HD 219134 b", 4.74, 1.60, 0.0385, 3.09}, {"HD 219134 c", 4.36, 1.51, 0.065, 6.76},
                           {"HD 219134 f", 7.3, 0, 0.146, 22.7}, {"HD 219134 d", 16.2, 0, 0.237, 46.9},
                           {"HD 219134 g", 11.0, 0, 0.375, 94.2}, {"HD 219134 h", 108, 0, 3.11, 2100}}},
        {"Barnard's Star", 0.0035, {{"Barnard's Star d", 0.26, 0, 0.0188, 2.34}, {"Barnard's Star b", 0.30, 0, 0.0229, 3.15},
                                    {"Barnard's Star c", 0.34, 0, 0.0274, 4.12}, {"Barnard's Star e", 0.19, 0, 0.0381, 6.74}}},
        {"Wolf 359", 0.0011, {{"Wolf 359 c", 3.8, 0, 0.018, 2.69}, {"Wolf 359 b", 44, 0, 1.85, 2938}}},
        {"Proxima Centauri", 0.0016, {{"Proxima Centauri b", 1.07, 0, 0.0485, 11.19},
                                      {"Proxima Centauri d", 0.26, 0, 0.0289, 5.12}}},
        {"Ross 128", 0.0036, {{"Ross 128 b", 1.40, 0, 0.0496, 9.87}}},
        {"Luyten's Star", 0.0088, {{"Luyten b", 2.89, 0, 0.091, 18.65}, {"Luyten c", 1.18, 0, 0.036, 4.72}}},
        {"Teegarden's Star", 0.00073, {{"Teegarden's Star b", 1.05, 0, 0.0259, 4.91},
                                       {"Teegarden's Star c", 1.11, 0, 0.0455, 11.4},
                                       {"Teegarden's Star d", 0.82, 0, 0.0791, 26.1}}},
        {"Gliese 1061", 0.0016, {{"Gliese 1061 b", 1.37, 0, 0.021, 3.20}, {"Gliese 1061 c", 1.74, 0, 0.035, 6.69},
                                 {"Gliese 1061 d", 1.64, 0, 0.054, 13.0}}},
        {"YZ Ceti", 0.0022, {{"YZ Ceti b", 0.70, 0, 0.0163, 2.02}, {"YZ Ceti c", 1.14, 0, 0.0216, 3.06},
                             {"YZ Ceti d", 1.09, 0, 0.0285, 4.66}}},
        {"Wolf 1061", 0.010, {{"Wolf 1061 b", 1.91, 0, 0.0375, 4.89}, {"Wolf 1061 c", 3.41, 0, 0.089, 17.87},
                              {"Wolf 1061 d", 7.7, 0, 0.47, 217}}},
        {"Gliese 667 C", 0.0137, {{"Gliese 667 Cb", 5.6, 0, 0.050, 7.2}, {"Gliese 667 Cc", 3.8, 0, 0.125, 28.1}}},
        {"TRAPPIST-1", 0.00055, {{"TRAPPIST-1 b", 1.374, 1.116, 0.01154, 1.51}, {"TRAPPIST-1 c", 1.308, 1.097, 0.0158, 2.42},
                                 {"TRAPPIST-1 d", 0.388, 0.788, 0.0223, 4.05}, {"TRAPPIST-1 e", 0.692, 0.920, 0.0293, 6.10},
                                 {"TRAPPIST-1 f", 1.039, 1.045, 0.0385, 9.21}, {"TRAPPIST-1 g", 1.321, 1.129, 0.0469, 12.35},
                                 {"TRAPPIST-1 h", 0.326, 0.755, 0.0619, 18.77}}},
    };
    return k;
}

const KnownPlanet* knownPlanet(const std::string& star, size_t index, double* luminosity = nullptr) {
    for (const KnownSystem& k : knownPlanets())
        if (star == k.star && index < k.planets.size() && k.planets[index].name) {
            if (luminosity) *luminosity = k.luminosity;
            return &k.planets[index];
        }
    return nullptr;
}

std::string withCommas(long v) {
    std::string s = std::to_string(v);
    for (int i = int(s.size()) - 3; i > 0; i -= 3) s.insert(size_t(i), ",");
    return s;
}

// Which planets of `now` the original list `was` has: per template, as many
// as it held; the rest are made up.
std::vector<bool> madeUp(const std::vector<uint16_t>& was, const std::vector<uint16_t>& now) {
    std::map<uint16_t, int> left;
    for (uint16_t t : was) ++left[t];
    std::vector<bool> out;
    for (uint16_t t : now) out.push_back(left[t]-- <= 0);
    return out;
}

} // namespace

void modernizeGalaxy(UniverseTables& tables) {
    for (const System& k : systems()) {
        auto it = std::find_if(tables.stars.begin(), tables.stars.end(),
                               [&](const auto& r) { return r.name == k.record.name; });
        if (it != tables.stars.end()) {
            it->madeUp = madeUp(it->planetIds, k.planets);
            it->planetIds = k.planets;
        } else if (k.isAdded) {
            UniverseTables::StarRow row;
            row.name = k.record.name;
            row.pos = k.pos;
            row.planetIds = k.planets;
            row.madeUp.assign(k.planets.size(), true);
            tables.stars.push_back(std::move(row));
            tables.starIds.push_back(uint16_t(tables.stars.size()));
        }
    }
}

const data::StarRecord* modernStarRecord(const std::string& name) {
    for (const System& k : systems())
        if (k.record.name == name) return &k.record;
    return nullptr;
}

bool hasLandableWorld(const UniverseTables& tables, const UniverseTables::StarRow& row) {
    for (uint16_t t : row.planetIds)
        if (t >= 1 && t <= tables.planets.size() && tables.planets[t - 1u].maxSites > 0) return true;
    return false;
}

std::string knownPlanetName(const std::string& star, size_t index) {
    const KnownPlanet* k = knownPlanet(star, index);
    return k ? k->name : std::string();
}

std::vector<std::string> knownPlanetFacts(const std::string& star, size_t index) {
    double lum = 0;
    const KnownPlanet* k = knownPlanet(star, index, &lum);
    if (!k) return {};
    const bool giant = k->mass >= 40;
    // Radii not measured: rocky worlds by mass^0.28, larger ones as
    // mini-Neptunes, giants about Saturn to Jupiter size.
    double r = k->radius;
    if (r <= 0) r = giant ? (k->mass < 150 ? 9.0 : 11.0) : k->mass <= 4 ? std::pow(k->mass, 0.28) : 1.47 * std::pow(k->mass / 4, 0.59);
    const double gravity = k->mass / (r * r);
    const double escape = 11.19 * std::sqrt(k->mass / r);
    const double light = lum / (k->au * k->au);                       // Earth = 1
    const double kelvin = 255.0 * std::pow(light, 0.25);              // equilibrium, Earth-like albedo
    const bool locked = k->days < 60 && lum < 0.6;
    std::vector<std::string> f;
    f.push_back(fixed(r, 2) + " (" + withCommas(long(std::lround(r * 12742 / 10.0) * 10)) + "km)");
    f.push_back(fixed(k->mass, 2) + (k->radius > 0 ? "" : " (min)"));
    f.push_back(locked ? fixed(k->days, 1) + "d (locked)" : "Unknown");
    f.push_back(fixed(gravity, 2));
    f.push_back(k->au < 0.1 ? fixed(k->au, 4) : fixed(k->au, 3));
    f.push_back(light < 0.01 ? fixed(light, 4) : light < 10 ? fixed(light, 2) : fixed(light, 0));
    f.push_back("about " + std::to_string(long(std::lround(kelvin - 273.15))));
    f.push_back(fixed(escape, 1));
    f.push_back(giant ? "Hydrogen, helium" : "Unknown");
    return f;
}

} // namespace outpost::sim
