// Saved state of the rebuild's own (IMPROVED) features. The original's
// chunks end with the tag 0x0B; after it a rebuild save may carry one more
// chunk, "dcbSC7e": u16 count, then per entry u8 name length, the name,
// u32 byte count and the bytes. A module registers a name with a saver and
// a loader; a save without the chunk (the original's, older rebuild saves)
// calls no loader, so each module must start from its defaults.
#pragma once

#include <cstdint>
#include <functional>
#include <span>
#include <string>
#include <vector>

namespace outpost::sim {

class Simulation;

constexpr uint8_t kExtensionChunk = 0x7E;

using ExtensionSaver = std::function<std::vector<uint8_t>(const Simulation&)>;
using ExtensionLoader = std::function<void(Simulation&, std::span<const uint8_t>)>;

// Registers (or replaces) a named entry. Call once at startup, e.g. from a
// static initialiser in the module's .cpp. An empty vector from the saver
// leaves the entry out.
void registerExtension(const std::string& name, ExtensionSaver save, ExtensionLoader load);

// The chunk body for the registered entries (empty when none has data).
std::vector<uint8_t> saveExtensions(const Simulation& sim);
// Hands each known entry of a chunk body to its loader; unknown names are
// skipped. Throws std::runtime_error on a malformed body.
void loadExtensions(Simulation& sim, std::span<const uint8_t> body);

} // namespace outpost::sim
