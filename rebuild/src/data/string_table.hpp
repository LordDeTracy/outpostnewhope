#pragma once

#include <cstdint>
#include <map>
#include <string>

namespace outpost::data {

class NeImage;

// The game's STRINGTABLE (882 strings, ids 1000-2066 in v1.51): UI text,
// building/resource/research names, alerts, news, AI dialogue.
// Win16 RT_STRING block N holds ids (N-1)*16 .. (N-1)*16+15 as Pascal strings.
class StringTable {
public:
    bool load(const NeImage& exe);

    const std::string& get(uint16_t id) const;   // empty if absent
    bool has(uint16_t id) const { return m_strings.count(id) != 0; }
    size_t size() const { return m_strings.size(); }
    const std::map<uint16_t, std::string>& all() const { return m_strings; }

private:
    std::map<uint16_t, std::string> m_strings;
};

} // namespace outpost::data
