#pragma once

#include <cstddef>
#include <utility>
#include <vector>

namespace outpost::sim {

// The C runtime's qsort in OUTPOST.EXE (s1:4AEA, Microsoft C, huge-pointer
// version), reproduced step for step because it is not stable: the order
// it leaves equal keys in is part of the game's behaviour (the colony's
// tile order). `cmp(a, b)` returns <0, 0, >0 like the original comparator.
//
//  1. If every element compares >= its predecessor, nothing moves.
//  2. Otherwise an explicit stack of (lo, hi) ranges, starting with the
//     whole array. For a range, the pivot is element lo. A forward scan
//     from lo+1 stops at the first element above the pivot (or at hi,
//     without comparing it) and remembers the last element below it (I); a
//     backward scan from hi stops at the first element below the pivot (or
//     at lo when equal) and remembers the last element above it (J). While
//     the scans have not crossed, the two stop elements are swapped and the
//     scans resume. Then the pivot is swapped with the backward stop, the
//     range becomes (J, hi) or (lo, I), and the other part, the smaller one,
//     is pushed and sorted first.
template <class T, class Cmp>
void msvcQsort(T* a, size_t n, Cmp cmp) {
    if (n <= 1) return;
    bool sorted = true;
    for (size_t i = 0; i + 1 < n; ++i)
        if (cmp(a[i + 1], a[i]) < 0) { sorted = false; break; }
    if (sorted) return;

    struct Range { ptrdiff_t lo, hi; };
    std::vector<Range> stack{{0, static_cast<ptrdiff_t>(n) - 1}};
    while (!stack.empty()) {
        const ptrdiff_t lo = stack.back().lo, hi = stack.back().hi;
        if (lo >= hi) {
            stack.pop_back();
            continue;
        }
        ptrdiff_t lastBelow = lo, lastAbove = hi;     // I, J
        ptrdiff_t i = lo, j = hi + 1;
        for (;;) {
            for (;;) {                                // forward scan
                ++i;
                if (i == hi) break;
                const int r = cmp(a[i], a[lo]);
                if (r > 0) break;
                if (r < 0) lastBelow = i;
            }
            for (;;) {                                // backward scan
                --j;
                const int r = cmp(a[lo], a[j]);
                if (r > 0) break;
                if (r == 0) {
                    if (j == lo) break;
                    continue;
                }
                lastAbove = j;
            }
            if (j > i) {
                std::swap(a[i], a[j]);
                lastAbove = j;
                lastBelow = i;
                continue;
            }
            break;
        }
        std::swap(a[lo], a[j]);
        if ((hi - lastAbove) >= (lastBelow - lo)) {
            stack.back() = {lastAbove, hi};
            stack.push_back({lo, lastBelow});
        } else {
            stack.back() = {lo, lastBelow};
            stack.push_back({lastAbove, hi});
        }
    }
}

} // namespace outpost::sim
