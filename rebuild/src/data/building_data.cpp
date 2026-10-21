#include "data/building_data.hpp"

#include <cstdlib>
#include <cstring>
#include <string_view>

namespace outpost::data {

namespace {

bool isControl(uint8_t c) { return c < 0x20 || c == 0x7F; }

// The records, walked as the loader does: s7:4E34 counts the CR bytes (one
// record each) and turns CR and LF into NULs; s7:4DBC then steps from one
// record to the next by strlen + 2. A blank line is an all-zero record and
// still takes up a building id; a last line without CR is not read.
std::vector<std::string_view> lines(std::vector<uint8_t>& text) {
    size_t records = 0;
    for (auto& c : text) {
        if (c == '\r') ++records;
        if (c == '\r' || c == '\n') c = 0;
    }
    text.push_back(0);                       // the walk may step past the end
    text.push_back(0);
    std::vector<std::string_view> out;
    const char* base = reinterpret_cast<const char*>(text.data());
    size_t p = 0;
    for (size_t i = 0; i < records && p < text.size(); ++i) {
        const size_t len = std::strlen(base + p);
        out.emplace_back(base + p, len);
        p += len + 2;
    }
    return out;
}

// strtok(line, ",") + atol, skipping tokens that start with '"' (the name),
// exactly as the original record parsers do. Calls onNumber(index, value).
template <class F>
std::string tokenize(std::string_view line, F onNumber) {
    std::string name;
    int index = 0;
    size_t p = 0;
    while (p <= line.size()) {
        size_t e = line.find(',', p);
        if (e == std::string_view::npos) e = line.size();
        std::string tok(line.substr(p, e - p));
        p = e + 1;
        if (tok.empty()) continue;                 // strtok skips empty tokens
        if (tok[0] == '"') {
            if (name.empty()) name = tok.substr(1, tok.find('"', 1) - 1);
            continue;
        }
        onNumber(index++, std::atol(tok.c_str()));
    }
    return name;
}

} // namespace

std::vector<uint8_t> decodeBldgFile(std::span<const uint8_t> raw) {
    std::vector<uint8_t> out(raw.begin(), raw.end());
    for (auto& c : out)
        if (!isControl(c)) c = static_cast<uint8_t>(c + 0x80);
    return out;
}

std::vector<BldgBldRecord> parseBldgBld(std::span<const uint8_t> raw) {
    std::vector<BldgBldRecord> out;
    std::vector<uint8_t> text = decodeBldgFile(raw);   // must outlive the views
    for (auto line : lines(text)) {
        BldgBldRecord r;
        r.name = tokenize(line, [&r](int n, long v) {
            if (n < res::Count) r.need[static_cast<size_t>(n)] = static_cast<int32_t>(v);
            else if (n == 37) r.word94 = static_cast<uint16_t>(v);
            else if (n == 38) r.word96 = static_cast<uint16_t>(v);
        });
        out.push_back(std::move(r));
    }
    return out;
}

std::vector<BldgOpsRecord> parseBldgOps(std::span<const uint8_t> raw) {
    std::vector<BldgOpsRecord> out;
    std::vector<uint8_t> text = decodeBldgFile(raw);   // must outlive the views
    for (auto line : lines(text)) {
        BldgOpsRecord r;
        r.name = tokenize(line, [&r](int n, long v) {
            if (n < res::Count) r.need[static_cast<size_t>(n)] = static_cast<int32_t>(v);
            else if (n < res::Count + 8) r.words[static_cast<size_t>(n - res::Count)] = static_cast<uint16_t>(v);
        });
        out.push_back(std::move(r));
    }
    return out;
}

} // namespace outpost::data
