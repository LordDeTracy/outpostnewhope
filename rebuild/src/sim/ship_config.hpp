#pragma once

#include <array>
#include <cstdint>
#include <string>

namespace outpost::data { class NeImage; }

namespace outpost::sim {

class Simulation;

// The Ship Configuration Setup dialog (dialog 4010, class ctor s8:9144),
// shown once by the voyage screen (s4:EA66, window id 8 of s3:7300). It
// loads the mothership: 15 rows (DGROUP 0x5A70, 14 bytes each: spin
// control, count, weight and cost controls, minimum, maximum, kind); the
// weights and costs are the texts of the template's controls, read back
// with GetDlgItemInt. Launch (s8:95FC) fills the hold and the orbital
// objects.
//
// In v1.51 the dialog cannot be used as shipped: the counts start at "0",
// the two "remaining" fields start empty (0) and nothing ever sets them, so
// no count can move (minimums of 1 and 2 block the first step up, the
// empty budget every other) and Launch would leave the hold empty.
// `openImproved` is the IMPROVISED way in (improvised.md I24).
class ShipConfig {
public:
    static constexpr size_t kRows = 15;                // s8:993A, s8:98B4: 0xF
    static constexpr uint16_t kRemainingWeightId = 4009;
    static constexpr uint16_t kRemainingFundsId = 4008;

    struct Row {
        uint16_t spinId{0};      // +0  MicroSpinControl (its text: "min,max")
        uint16_t countId{0};     // +2  STATIC "0"
        uint16_t weightId{0};    // +4
        uint16_t costId{0};      // +6
        int16_t min{0};          // +8
        int16_t max{0};          // +10
        uint16_t kind{0};        // +12 building type, or 0x80.. ship items
        int16_t weight{0};       // the template's text of weightId
        int16_t cost{0};         // the template's text of costId
        std::string name;        // the row's label in the template
    };

    // Reads the row table from DGROUP and the template's texts.
    bool load(const data::NeImage& exe, std::string* error = nullptr);
    const std::array<Row, kRows>& rows() const { return m_rows; }

    // The dialog's state: the count controls and the two remaining fields.
    std::array<int16_t, kRows> counts{};
    int16_t remainingWeight{0};
    int16_t remainingFunds{0};

    // s8:9294 + s8:98B4: the remaining fields are read (the template's
    // texts, i.e. 0), then every row's count is charged against them; a
    // row that does not fit is skipped and keeps its count.
    void open(int16_t weight = 0, int16_t funds = 0);
    // IMPROVISED (I24): counts start at the rows' minimums and the budget
    // is kImprovisedWeight / kImprovisedFunds before they are charged
    // (nothing in v1.51 sets it). 150 and 300 are the manual's: "you will
    // have 172 remaining funds, and a remaining weight maximum of 78 units"
    // once the minimums (72 weight, 128 funds) are packed (OUTP_GB.PDF
    // p. 12; I102 had guessed 270).
    static constexpr int16_t kImprovisedWeight = 150;
    static constexpr int16_t kImprovisedFunds = 300;
    void openImproved();
    // IMPROVED (I102): step(), but the colonist pods (kind 0x80) and the
    // Colonist Landers (62) move together; false (nothing changed) if
    // either cannot.
    bool stepLinked(size_t row, bool up);

    // s8:94DA: a spin click, one up or down within [min, max] and the
    // budget (s8:9820). Returns whether the count changed.
    bool step(size_t row, bool up);
    // s8:977A: Launch asks first (string 1498, "You have funds remaining.
    // Do you wish to continue without using them?") when funds are left.
    bool asksBeforeLaunch() const { return remainingFunds != 0; }
    // s8:95FC: a new hold with each row of kind < 0x83 and a count; kinds
    // 0x83.. go to the orbital objects as carried (the ULBI probe, 0x89,
    // also as launched). Rows with count 0 change nothing. The main window
    // then gets command 237 (the next screen, not modelled).
    void launch(Simulation& sim) const;

private:
    // s8:9820(row, value, dir): weight * value * dir and cost * value * dir
    // come off the remaining fields if neither goes below 0.
    bool charge(size_t row, int16_t value, int16_t dir);

    std::array<Row, kRows> m_rows{};
};

} // namespace outpost::sim
