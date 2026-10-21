#include "data/dcl_archive.hpp"

#include <algorithm>
#include <array>
#include <cctype>
#include <cstring>
#include <fstream>
#include <iterator>

namespace outpost::data {

namespace {

constexpr int kMaxBits = 13;

// Code-length tables in the compact form used by zlib's blast.c: low nibble
// is the length, high nibble + 1 the repeat count.
constexpr uint8_t kLenLen[] = {2, 35, 36, 53, 38, 23};
constexpr uint8_t kDistLen[] = {2, 20, 53, 230, 247, 151, 248};
constexpr uint16_t kBase[16] = {3, 2, 4, 5, 6, 7, 8, 9, 10, 12, 16, 24, 40, 72, 136, 264};
constexpr uint8_t kExtra[16] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8};

struct Huffman {
    std::array<int, kMaxBits + 1> count{};
    std::vector<int> symbol;
};

template <size_t N>
Huffman construct(const uint8_t (&rep)[N]) {
    std::vector<int> lengths;
    for (uint8_t r : rep)
        lengths.insert(lengths.end(), (r >> 4) + 1, r & 15);
    Huffman h;
    for (int len : lengths) h.count[len]++;
    std::array<int, kMaxBits + 1> offs{};
    for (int len = 1; len < kMaxBits; ++len) offs[len + 1] = offs[len] + h.count[len];
    h.symbol.assign(lengths.size(), 0);
    for (size_t s = 0; s < lengths.size(); ++s)
        if (lengths[s]) h.symbol[offs[lengths[s]]++] = static_cast<int>(s);
    return h;
}

class BitReader {
public:
    BitReader(const std::vector<uint8_t>& d, size_t pos) : m_d(d), m_pos(pos) {}

    bool bits(int n, int& out) {
        while (m_cnt < n) {
            if (m_pos >= m_d.size()) return false;
            m_buf |= static_cast<uint32_t>(m_d[m_pos++]) << m_cnt;
            m_cnt += 8;
        }
        out = static_cast<int>(m_buf & ((1u << n) - 1));
        m_buf >>= n;
        m_cnt -= n;
        return true;
    }

    bool decode(const Huffman& h, int& out) {
        int code = 0, first = 0, index = 0;
        for (int len = 1; len <= kMaxBits; ++len) {
            int bit;
            if (!bits(1, bit)) return false;
            code |= bit ^ 1;                       // codes are stored inverted
            int c = h.count[len];
            if (code - c < first) {
                out = h.symbol[index + (code - first)];
                return true;
            }
            index += c;
            first = (first + c) << 1;
            code <<= 1;
        }
        return false;
    }

private:
    const std::vector<uint8_t>& m_d;
    size_t m_pos;
    uint32_t m_buf{0};
    int m_cnt{0};
};

} // namespace

std::optional<std::vector<uint8_t>> dclExplode(const std::vector<uint8_t>& s) {
    static const Huffman lenCode = construct(kLenLen);
    static const Huffman distCode = construct(kDistLen);

    if (s.size() < 2 || s[0] != 0 || s[1] < 4 || s[1] > 6) return std::nullopt;
    const int dictBits = s[1];
    BitReader in(s, 2);
    std::vector<uint8_t> out;
    for (;;) {
        int flag;
        if (!in.bits(1, flag)) return std::nullopt;
        if (!flag) {
            int lit;
            if (!in.bits(8, lit)) return std::nullopt;
            out.push_back(static_cast<uint8_t>(lit));
            continue;
        }
        int sym, extra;
        if (!in.decode(lenCode, sym) || !in.bits(kExtra[sym], extra)) return std::nullopt;
        const int len = kBase[sym] + extra;
        if (len == 519) return out;                // end of stream
        const int shift = len == 2 ? 2 : dictBits;
        int hi, lo;
        if (!in.decode(distCode, hi) || !in.bits(shift, lo)) return std::nullopt;
        const size_t dist = static_cast<size_t>((hi << shift) + lo + 1);
        if (dist > out.size()) return std::nullopt;
        for (int i = 0; i < len; ++i) out.push_back(out[out.size() - dist]);
    }
}

bool DclArchive::open(const std::filesystem::path& path) {
    m_entries.clear();
    std::ifstream f(path, std::ios::binary);
    if (!f) {
        m_error = "cannot open " + path.string();
        return false;
    }
    m_bytes.assign(std::istreambuf_iterator<char>(f), std::istreambuf_iterator<char>());
    if (m_bytes.size() < 6 || std::memcmp(m_bytes.data(), "DISK01", 6) != 0) {
        m_error = "not a DISK01 archive";
        return false;
    }
    size_t p = 6;
    for (;;) {
        if (p + 26 > m_bytes.size()) {
            m_error = "directory runs past end of file";
            return false;
        }
        const uint8_t* e = m_bytes.data() + p;
        Entry entry;
        const char* name = reinterpret_cast<const char*>(e + 4);
        entry.name.assign(name, strnlen(name, 14));
        entry.packedSize = e[18] | (e[19] << 8) | (e[20] << 16) | (static_cast<uint32_t>(e[21]) << 24);
        entry.dosDate = static_cast<uint16_t>(e[22] | (e[23] << 8));
        entry.dosTime = static_cast<uint16_t>(e[24] | (e[25] << 8));
        p += 26;
        if (entry.name == "THE_END") break;
        m_entries.push_back(entry);
    }
    for (auto& entry : m_entries) {
        entry.dataOffset = p;
        p += entry.packedSize;
    }
    if (p > m_bytes.size()) {
        m_error = "data section truncated";
        return false;
    }
    return true;
}

const DclArchive::Entry* DclArchive::find(const std::string& name) const {
    auto eq = [](const std::string& a, const std::string& b) {
        return a.size() == b.size() &&
               std::equal(a.begin(), a.end(), b.begin(), [](char x, char y) {
                   return std::toupper(static_cast<unsigned char>(x)) ==
                          std::toupper(static_cast<unsigned char>(y));
               });
    };
    for (const auto& e : m_entries)
        if (eq(e.name, name)) return &e;
    return nullptr;
}

std::optional<std::vector<uint8_t>> DclArchive::extract(const std::string& name) const {
    const Entry* e = find(name);
    if (!e) return std::nullopt;
    std::vector<uint8_t> packed(m_bytes.begin() + static_cast<std::ptrdiff_t>(e->dataOffset),
                                m_bytes.begin() + static_cast<std::ptrdiff_t>(e->dataOffset + e->packedSize));
    return dclExplode(packed);
}

} // namespace outpost::data
