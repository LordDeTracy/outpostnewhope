#pragma once

#include <cstdint>
#include <map>

namespace outpost::sim {

// Keyed resource ledger (SparseTable, s5:BA3E). Keys are resource ids, values
// 32-bit. write(mode 0) sets, write(mode != 0) adds (s5:BBA4).
class Ledger {
public:
    int32_t get(int res) const {                   // SparseTable::get, s5:BAE6
        auto it = m_values.find(res);
        return it == m_values.end() ? 0 : it->second;
    }
    void set(int res, int32_t v) { m_values[res] = v; }     // SparseTable::set, s5:BB8A
    void add(int res, int32_t v) {                           // mode 1
        m_values[res] = static_cast<int32_t>(static_cast<uint32_t>(get(res)) + static_cast<uint32_t>(v));
    }
    void clear() { m_values.clear(); }
    bool empty() const { return m_values.empty(); }
    const std::map<int, int32_t>& entries() const { return m_values; }

private:
    std::map<int, int32_t> m_values;
};

// An item of a stock list (factory output, warehouse stock, tile lists):
// a batch of a product (list items created in Factory::produce).
struct ProductItem {
    uint16_t productA{0};          // +0x06
    uint16_t productB{0};          // +0x08
    uint16_t quantity{0};          // +0x0A
    uint16_t units{0};             // +0x0C quantity x unit value
    uint16_t field04{0};           // +0x04: 0 in factory output; copied by SCMove
};

} // namespace outpost::sim
