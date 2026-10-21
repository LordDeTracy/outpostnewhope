#include "sim/ship_config.hpp"

#include "data/dialog_template.hpp"
#include "data/ne_image.hpp"
#include "sim/simulation.hpp"

#include <cstdlib>
#include <vector>

namespace outpost::sim {

namespace {
constexpr uint16_t kDialogId = 4010;
constexpr size_t kTable = 0x5A70;             // DGROUP
constexpr size_t kRowBytes = 14;
} // namespace

bool ShipConfig::load(const data::NeImage& exe, std::string* error) {
    auto fail = [&](const std::string& e) { if (error) *error = e; return false; };
    const auto d = exe.dgroup();
    if (kTable + kRows * kRowBytes > d.size()) return fail("ship table not found");
    const auto dlg = data::DialogTemplate::load(exe, kDialogId);
    if (!dlg) return fail("dialog 4010 not found");
    for (size_t i = 0; i < kRows; ++i) {
        const size_t o = kTable + i * kRowBytes;
        auto w = [&](size_t k) { return static_cast<uint16_t>(d[o + k] | (d[o + k + 1] << 8)); };
        Row& r = m_rows[i];
        r.spinId = w(0);
        r.countId = w(2);
        r.weightId = w(4);
        r.costId = w(6);
        r.min = static_cast<int16_t>(w(8));
        r.max = static_cast<int16_t>(w(10));
        r.kind = w(12);
        r.weight = static_cast<int16_t>(dlg->intOf(r.weightId).value_or(0));
        r.cost = static_cast<int16_t>(dlg->intOf(r.costId).value_or(0));
        // The label: the unnumbered static at the left on the count's line.
        const auto* count = dlg->control(r.countId);
        if (!count) return fail("ship row control missing");
        int best = 1 << 30;
        for (const auto& k : dlg->controls) {
            if (k.id != 0xFFFF || k.className != "STATIC" || k.x > count->x / 2) continue;
            const int dy = std::abs(k.y - count->y);
            if (dy < best) {
                best = dy;
                r.name = k.text;
            }
        }
    }
    return true;
}

bool ShipConfig::charge(size_t row, int16_t value, int16_t dir) {
    const Row& r = m_rows[row];
    const auto dw = static_cast<int16_t>(r.weight * value * dir);
    const auto dc = static_cast<int16_t>(r.cost * value * dir);
    if (static_cast<int16_t>(remainingWeight - dw) < 0) return false;
    if (static_cast<int16_t>(remainingFunds - dc) < 0) return false;
    remainingWeight = static_cast<int16_t>(remainingWeight - dw);
    remainingFunds = static_cast<int16_t>(remainingFunds - dc);
    return true;
}

void ShipConfig::open(int16_t weight, int16_t funds) {
    remainingWeight = weight;
    remainingFunds = funds;
    for (size_t i = 0; i < kRows; ++i) charge(i, counts[i], 1);
}

void ShipConfig::openImproved() {
    // I24: the minimums; IMPROVED (I102): nothing more is loaded for the
    // player (I91's extras are gone), the budget is tight enough that the
    // extras are a choice.
    for (size_t i = 0; i < kRows; ++i) counts[i] = m_rows[i].min;
    open(kImprovisedWeight, kImprovisedFunds);
}

bool ShipConfig::stepLinked(size_t row, bool up) {
    // IMPROVED (I102): a Colonist Lander carries one pod of 50 colonists
    // (kind 0x80): the two rows move together.
    if (row >= kRows) return false;
    const uint16_t kind = m_rows[row].kind;
    const uint16_t partnerKind = kind == 0x80 ? 62 : kind == 62 ? 0x80 : 0;
    if (!partnerKind) return step(row, up);
    size_t partner = kRows;
    for (size_t i = 0; i < kRows; ++i)
        if (m_rows[i].kind == partnerKind) partner = i;
    if (partner == kRows) return step(row, up);
    if (!step(row, up)) return false;
    if (!step(partner, up)) {
        step(row, !up);                                    // undo: both or neither
        return false;
    }
    return true;
}

bool ShipConfig::step(size_t row, bool up) {
    if (row >= kRows) return false;
    const Row& r = m_rows[row];
    const int16_t dir = up ? 1 : -1;
    const auto next = static_cast<int16_t>(counts[row] + dir);
    if (r.max < next || r.min > next) return false;
    if (!charge(row, 1, dir)) return false;
    counts[row] = next;
    return true;
}

void ShipConfig::launch(Simulation& sim) const {
    std::vector<ShipItem> hold;
    for (size_t i = 0; i < kRows; ++i) {
        const Row& r = m_rows[i];
        const int16_t n = counts[i];
        if (n == 0) continue;
        if (r.kind < Orbitals::kFirstKind) {
            hold.push_back({r.kind, n});
        } else if (r.kind != 0x89) {
            sim.orbitals().set(r.kind, n, 0);                // s3:6566(0, n, kind)
        } else {
            sim.orbitals().set(r.kind, n, n);                // ULBI: launched at once
        }
    }
    sim.mothership().hold = std::move(hold);                  // +0x0A, a new list
}

} // namespace outpost::sim
