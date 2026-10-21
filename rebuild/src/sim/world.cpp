#include "sim/world.hpp"

#include "sim/msvc_qsort.hpp"

#include <algorithm>
#include <initializer_list>

namespace outpost::sim {

void Population::reset(int difficulty) {
    *this = Population{};
    if (difficulty >= 2) {
        deathRate = {0, 1, 2, 2, 1, 6};
        deathChance = {0, 100, 100, 100, 100, 100};
    } else {
        setGentleDeathTables();
    }
}

void Population::setGentleDeathTables() {
    deathRate = {0, 1, 1, 1, 1, 4};
    deathChance = {0, 50, 10, 10, 10, 75};
    deathCarry.fill(0);
}

int32_t Population::total() const {
    int32_t sum = 0;
    for (int32_t c : cohort) sum += c;
    return sum;
}

void Population::groupRange(int g, int sla, int& lo, int& hi) {
    switch (g) {
        case 1: lo = 0; hi = 3; break;
        case 2: lo = 4; hi = sla; break;
        case 3: lo = sla + 1; hi = 39; break;
        case 4: lo = 40; hi = 75; break;
        case 5: lo = 76; hi = 90; break;
        default: lo = 0; hi = 90; break;
    }
}

int32_t Population::group(int g) const {
    int lo = 0, hi = 0;
    groupRange(g, schoolLeavingAge, lo, hi);
    int32_t sum = 0;
    for (int age = lo; age <= hi; ++age)
        if (age >= 0 && age < static_cast<int>(cohort.size())) sum += cohort[static_cast<size_t>(age)];
    return sum;
}

void Population::ageOneYear() {
    for (size_t age = cohort.size() - 1; age > 0; --age) cohort[age] = cohort[age - 1];
    cohort[0] = 0;
}

void Population::kill(int g, int32_t amount) {
    if (g == 0) {
        // Per age, from 90 down, until the amount is used up.
        for (int age = 90; age >= 0 && amount != 0; --age) takeFromAge(age, amount);
    } else {
        int lo = 0, hi = 0;
        groupRange(g, schoolLeavingAge, lo, hi);
        const int32_t n = hi - lo + 1;
        const int32_t each = n != 0 ? amount / n : 0;
        int32_t rest = amount - each * n;
        for (int age = lo; age <= hi; ++age) {
            if (age < 0 || age >= static_cast<int>(cohort.size())) continue;
            int32_t& c = cohort[static_cast<size_t>(age)];
            c -= each;
            if (rest != 0) { c -= 1; --rest; }
            if (c < 0) c = 0;
        }
    }
    deathCarry.fill(0);
}

std::array<int32_t, 91> Population::leaveFromGroup(int g, int32_t amount) {
    std::array<int32_t, 91> out{};
    int lo = 0, hi = 0;
    groupRange(g, schoolLeavingAge, lo, hi);
    for (int age = hi; age >= lo && amount != 0; --age) out[static_cast<size_t>(age)] = takeFromAge(age, amount);
    deathCarry.fill(0);                                   // s7:3737
    return out;
}

int32_t Population::takeFromAge(int age, int32_t& amount) {
    const int32_t before = amount;
    int32_t& c = cohort[static_cast<size_t>(age)];
    if (c >= amount) { c -= amount; amount = 0; }
    else             { amount -= c; c = 0; }
    return before - amount;
}

void Population::addCohorts(const std::array<int32_t, 91>& people) {
    for (size_t age = 0; age < cohort.size(); ++age) cohort[age] += people[age];
}

int32_t Population::lifeSupportFailure() {
    lifeSupportDeaths = lifeSupportDeaths == 0 ? 1 : lifeSupportDeaths * 2;
    const int32_t all = total();
    if (lifeSupportDeaths > all) lifeSupportDeaths = all;
    kill(0, lifeSupportDeaths);
    return lifeSupportDeaths;
}

void Population::addColonists(int16_t n) {
    const int16_t q = static_cast<int16_t>(n / 5);
    const int16_t r = static_cast<int16_t>(n - q * 5);
    cohort[19] += q + r;
    cohort[29] += q;
    cohort[39] += q;
    cohort[49] += q;
    cohort[59] += q;
}

Player::Player() {
    remaining.fill(-1);
    minTurns.fill(25);
    // The topics every player starts with (the tree roots).
    for (int t : {0, 2, 3, 8, 26, 32, 45, 58, 92, 106, 112, 114, 115, 119, 121}) {
        remaining[static_cast<size_t>(t)] = 0;
        minTurns[static_cast<size_t>(t)] = 0;
    }
}

int16_t Player::progress(int id) const {
    if (id < 0 || id >= static_cast<int>(remaining.size())) return -1;
    const int16_t r = remaining[static_cast<size_t>(id)];
    if (r < 0) return r;
    return std::max(r, minTurns[static_cast<size_t>(id)]);
}

int Player::priorityIndex(uint16_t topic) const {
    for (size_t i = 0; i < priority.size(); ++i)
        if (priority[i] == topic) return static_cast<int>(i);
    return -1;
}

bool Player::addPriority(uint16_t topic) {
    if (topic == 112 || topic == 1) return false;
    const int free = priorityIndex(0);
    if (free < 0) return false;
    priority[static_cast<size_t>(free)] = topic;
    return true;
}

int32_t Colony::available(int res) const {
    const auto t = static_cast<uint32_t>(total[static_cast<size_t>(res)]);
    const auto a = static_cast<uint32_t>(alloc[static_cast<size_t>(res)]);
    return a >= t ? 0 : static_cast<int32_t>(t - a);
}

// ── TileList ──────────────────────────────────────────────────────────────

void TileList::grow() {
    const size_t size = m_entries.empty() ? m_initial : m_entries.size() + m_growth;
    m_entries.resize(size);
    m_marked = true;
}

void TileList::sortIfMarked(bool force) const {
    if (!m_marked && !force) return;
    msvcQsort(m_entries.data(), m_entries.size(), [](const Entry& a, const Entry& b) {
        return static_cast<int16_t>(a.key - b.key);              // s5:C7FA
    });
    m_marked = false;
}

void TileList::add(Handle tile, uint16_t key) {
    if (m_entries.empty()) grow();
    for (int attempt = 0; attempt < 2; ++attempt) {
        sortIfMarked(false);
        for (Entry& e : m_entries) {
            if (e.tile) continue;
            m_marked = true;
            ++m_used;
            e.tile = tile;
            e.key = key;
            return;
        }
        grow();
    }
}

void TileList::append(Handle tile, uint16_t key) {
    if (m_entries.empty()) grow();
    if (m_used >= m_entries.size()) m_entries.resize(m_used + 1);
    m_entries[m_used++] = Entry{tile, key};
}

void TileList::setKey(Handle tile, uint16_t key) {
    sortIfMarked(false);
    for (Entry& e : m_entries)
        if (e.tile == tile) {
            e.key = key;
            return;
        }
}

void TileList::blank(Handle tile) {
    for (Entry& e : m_entries)
        if (e.tile == tile) e.tile = Handle{};
}

bool TileList::contains(Handle tile) const {
    for (const Entry& e : entries())
        if (e.tile == tile) return true;
    return false;
}

std::vector<Handle> TileList::order() const {
    sortIfMarked(false);
    std::vector<Handle> out;
    for (const Entry& e : m_entries)
        if (e.tile) out.push_back(e.tile);
    return out;
}

bool TileList::empty() const {
    for (const Entry& e : m_entries)
        if (e.tile) return false;
    return true;
}

} // namespace outpost::sim
