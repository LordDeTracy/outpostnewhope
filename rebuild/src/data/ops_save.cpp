#include "data/ops_save.hpp"

#include <cctype>
#include <cstring>

namespace outpost::data {

namespace {

bool isHexLower(uint8_t c) { return (c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'); }
int hexVal(uint8_t c) { return c <= '9' ? c - '0' : c - 'a' + 10; }

bool tagAt(std::span<const uint8_t> b, size_t p) {
    return p + 7 <= b.size() && std::memcmp(b.data() + p, "dcbSC", 5) == 0 &&
           isHexLower(b[p + 5]) && isHexLower(b[p + 6]);
}

} // namespace

bool OpsSave::parse(std::span<const uint8_t> b) {
    m_chunks.clear();
    m_error.clear();
    if (b.size() < 5 || b[0] != 'S' || b[1] != 'C' || !std::isdigit(b[2]) ||
        !std::isdigit(b[3]) || !std::isdigit(b[4])) {
        m_error = "missing SC### header";
        return false;
    }
    m_version = (b[2] - '0') * 100 + (b[3] - '0') * 10 + (b[4] - '0');

    std::vector<size_t> tags;
    for (size_t p = 5; p + 7 <= b.size(); ++p) {
        if (tagAt(b, p)) {
            tags.push_back(p);
            p += 6;
        }
    }
    if (tags.empty() || tags.front() != 5) {
        m_error = "no chunk tag after header";
        return false;
    }
    for (size_t i = 0; i < tags.size(); ++i) {
        Chunk c;
        c.offset = tags[i];
        c.id = static_cast<uint8_t>(hexVal(b[tags[i] + 5]) * 16 + hexVal(b[tags[i] + 6]));
        const size_t end = i + 1 < tags.size() ? tags[i + 1] : b.size();
        c.body.assign(b.begin() + static_cast<std::ptrdiff_t>(tags[i] + 7),
                      b.begin() + static_cast<std::ptrdiff_t>(end));
        m_chunks.push_back(std::move(c));
    }
    return true;
}

const OpsSave::Chunk* OpsSave::chunk(uint8_t id) const {
    for (const auto& c : m_chunks)
        if (c.id == id) return &c;
    return nullptr;
}

std::vector<std::string> OpsSave::strings(uint8_t id) const {
    std::vector<std::string> out;
    const Chunk* c = chunk(id);
    if (!c) return out;
    std::string cur;
    for (uint8_t ch : c->body) {
        if (ch >= 0x20 && ch < 0x7F) {
            cur.push_back(static_cast<char>(ch));
        } else {
            if (ch == 0 && cur.size() >= 3) out.push_back(cur);
            cur.clear();
        }
    }
    return out;
}

} // namespace outpost::data
