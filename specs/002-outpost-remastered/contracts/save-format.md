# Outpost Remastered — Save Game Format Contract

**File:** `SaveManager.cpp` / `save-format.hpp`  
**Game:** Outpost Remastered  
**Format Spec Version:** 1.0  
**FR Reference:** FR-010 (Save/Load)

---

## 1. Format Overview

Two formats are supported:

| Format | Extension | Purpose | Size |
|--------|-----------|---------|------|
| Binary | `.ops` | Primary — compact, fast I/O, matches original .OPS structure pattern | ~4–32 KB |
| JSON | `.ops.json` | Debug/dev — human-readable, editable for testing, convertible | ~8–64 KB |

The binary format uses the same `dcb` section-marker pattern as TUTOR.OPS but with OPSM file-level headers. The JSON format is a 1:1 structural equivalent.

---

## 2. Binary Format Specification

### 2.1 File Layout (Top-Level)

```
┌─────────────────────────────────────────────┐
│ File Header (8 bytes)                       │
├─────────────────────────────────────────────┤
│ Section 0x01: COLONY_HEADER    (variable)   │
├─────────────────────────────────────────────┤
│ Section 0x02: COLONY_RESOURCES (variable)   │
├─────────────────────────────────────────────┤
│ Section 0x03: COLONY_POPULATION (variable)  │
├─────────────────────────────────────────────┤
│ Section 0x04: COLONY_TECH      (variable)   │
├─────────────────────────────────────────────┤
│ Section 0x05: COLONY_BUILDINGS (variable)   │
├─────────────────────────────────────────────┤
│ Section 0x06: COLONY_DISASTERS (variable)   │
├─────────────────────────────────────────────┤
│ Section 0x07: COLONY_EVENTS    (variable)   │
├─────────────────────────────────────────────┤
│ Section 0x08: COLONY_MAP       (variable)   │
├─────────────────────────────────────────────┤
│ Section 0xF0..0xFF: EXTENSIONS  (variable)  │
├─────────────────────────────────────────────┤
│ File Footer (4 bytes)                       │
└─────────────────────────────────────────────┘
```

Sections may appear in any order. Unknown section IDs are skipped (forward compatibility). Section 0x01 must exist; all others are optional with defaults.

### 2.2 File Header (8 bytes)

```
Offset  Size  Type    Field           Description
------  ----  ------  --------------  -----------------------------------
 0      4     char[4] magic           "OPSM" (0x4F 0x50 0x53 0x4D)
 4      2     uint16  version         Format version (currently 1)
 6      2     uint16  checksum        CRC-16/CCITT of entire file after header
```

`magic` — OutPost Save Magic. Identifies this as a Remastered save (not original).  
`version` — Binary format version. Allows forward compatibility.  
`checksum` — CRC-16/CCITT (poly 0x1021, init 0xFFFF, no final XOR) over all bytes from offset 8 to EOF-4 (i.e., entire payload including all sections, up to but not including the ENDM footer). A zero checksum disables validation.

### 2.3 Section Header (7 bytes per section)

```
Offset  Size  Type    Field           Description
------  ----  ------  --------------  -----------------------------------
 0      3     char[3] marker          "dcb" (0x64 0x63 0x62)
 3      1     uint8   sectionId       Section identifier (0x01–0xFF)
 4      4     uint32  sectionLength   Size of section body in bytes (little-endian)
```

Each section begins with a 7-byte header. `sectionLength` counts bytes following this header (i.e., the body only). Minimum valid body length is 0. Maximum is 65,535 (uint16 range, stored in uint32 for future-proofing).

Section IDs:

| ID   | Name              | Required | Description |
|------|-------------------|----------|-------------|
| 0x01 | COLONY_HEADER     | Yes      | Version, turn, timestamp, player, star system |
| 0x02 | COLONY_RESOURCES  | No       | 6 resource pools |
| 0x03 | COLONY_POPULATION | No       | Population breakdown, morale, growth rate |
| 0x04 | COLONY_TECH       | No       | Tech mask, current tech level, researched buildings |
| 0x05 | COLONY_BUILDINGS  | No       | Array of building instances |
| 0x06 | COLONY_DISASTERS  | No       | Active disaster timers |
| 0x07 | COLONY_EVENTS     | No       | Event queue / log |
| 0x08 | COLONY_MAP        | No       | Exploration map state (fog of war, visited tiles) |
| 0xF0 | EXT_META          | No       | Extended metadata (playtime, screenshot thumbnail) |
| 0xF1..0xFF | Reserved   | No       | Future extension slots |

### 2.4 Section 0x01 — COLONY_HEADER

```
Offset  Size  Type    Field             Description
------  ----  ------  ----------------  -----------------------------------
 0      4     uint32  saveVersion       Save game version (increments independently)
 4      4     uint32  turnCount         Current turn number (0 = start)
 8      4     uint32  timestamp          Unix timestamp (seconds since 1970-01-01)
12      1     uint8   playerNameLen     Length of player name string (0–32)
13      var   char[]  playerName        UTF-8 player name (no null terminator in body)
       1     uint8   systemId           Star system ID (0–14, matches StarSystem index)
       1     uint8   difficulty         Difficulty: 0=Easy, 1=Normal, 2=Hard
       1     uint8   terrainType        Terrain type (1–6, TILE1-6.BMP)
       4     uint32  seedLanderId       Index of active SEED Lander (−1 = none, stored as 0xFFFFFFFF)
       4     uint32  gameFlags          Bitmask of game state flags (see below)
       1     uint8   scenarioId         Tutorial scenario ID (0xFF = free play)
       4     uint32  playTimeMs         Accumulated play time in milliseconds
```

`saveVersion` — Version of the save data layout. For format spec v1.0 this is 1. Incremented when structural changes warrant it (not for minor balance patches).

`gameFlags` bit definitions:

| Bit   | Flag Name         | Description |
|-------|-------------------|-------------|
| 0     | COLONY_INITIALIZED | Colony has been initialized |
| 1     | GAME_OVER          | Game has ended (win or loss) |
| 2     | VICTORY            | Victory condition achieved |
| 3     | TUTORIAL_ACTIVE    | Tutorial is running |
| 4     | AUTO_SAVE          | This save is an auto-save |
| 5     | DISASTER_ACTIVE    | At least one disaster is in progress |
| 6–23  | (reserved)         | Must be 0 |
| 24–31 | (application)      | Reserved for game-specific use |

**Total body minimum size**: 25 bytes (with empty player name).  
**Total body maximum size**: 57 bytes (32-byte player name).

### 2.5 Section 0x02 — COLONY_RESOURCES

Stores all 6 resource pools. Each resource is identified by type byte for forward compatibility (new resource types can be appended).

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      4     uint32  resourceCount         Number of resource entries (currently 6)
 
 Then for each resource:
       1     uint8   resourceType          ResourceType enum (0–5)
       4     uint32  current               Current amount
       4     uint32  capacity              Storage capacity
       4     uint32  producedThisTurn      Produced this turn (display only)
       4     uint32  consumedThisTurn      Consumed this turn (display only)
       4     int32   reserve               Strategic reserve / stored energy
```

`resourceType` values:

| Value | Name           | C++ Enum |
|-------|----------------|----------|
| 0     | CommonMetals   | ResourceType::CommonMetals |
| 1     | RareMetals     | ResourceType::RareMetals |
| 2     | Food           | ResourceType::Food |
| 3     | Energy         | ResourceType::Energy |
| 4     | Population     | ResourceType::Population |
| 5     | Research       | ResourceType::Research |

`reserve` — For Energy, this stores battery bank stored joules. For Food, stores preserved surplus. For others, 0. Allows restoration after power-down events.

**Body size**: 4 + (6 × 21) = 130 bytes (fixed for 6 resources).

### 2.6 Section 0x03 — COLONY_POPULATION

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      2     uint16  totalPop              Total colonists
 2      2     uint16  workers               Assigned to production buildings
 4      2     uint16  scientists            Assigned to research buildings
 6      2     uint16  children              Non-working population
 8      2     uint16  soldiers              Assigned to defensive/military buildings
10      2     int16   morale                Current morale (−100 to +100, stored as int16)
12      2     uint16  growthRateBps         Growth rate in basis points (0–10000, i.e. 0.00%–100.00%)
14      2     uint16  moraleFactors         Bitmask of morale factor states
16      2     uint16  housingCapacity       Total housing capacity from UGResidents
18      2     uint16  housingOccupied       Currently occupied housing slots
20      2     uint16  emigrationThreshold   Morale level that triggers emigration
22      2     uint16  immigrationBonus      Immigration bonus from SpacePort / events
```

`moraleFactors` bitmask:

| Bit  | Factor          | Effect |
|------|-----------------|--------|
| 0    | MF_FOOD_SURPLUS | +10 if food produced > consumed |
| 1    | MF_POWER_OK     | +0 if power balanced, −15 if deficit |
| 2    | MF_HAS_REC      | +10 if UGRec operational |
| 3    | MF_HAS_PARK     | +5 if UGPark operational |
| 4    | MF_HAS_COPS     | +5 if Cops operational |
| 5    | MF_HAS_UNIV     | +5 if UGUniv operational |
| 6    | MF_HAS_CHAP     | +5 if Chap operational |
| 7    | MF_DISASTER     | −20 if recent disaster |
| 8    | MF_OVERWINTER   | −5 if in winter cycle |
| 9–15 | (reserved)      | Must be 0 |

**Body size**: 24 bytes (fixed).

### 2.7 Section 0x04 — COLONY_TECH

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      2     uint16  techMask              12-bit prereq mask (bits 0–11 active)
 2      2     uint16  techLevel             Current tech level (0–12)
 4      2     uint16  researchPoints         Accumulated research points
 6      2     uint16  researchPerTurn        Research points per turn (display)
 8      2     uint16  currentProjectId      Active research project ID (0xFFFF = none)
10      1     uint8   techNameLen           Length of tech level name
11      var   char[]  techName              UTF-8 tech level name (e.g., "Industrialization")
       2     uint16  unlockedBuildingCount  Number of entries in unlocked building list
       var   struct  unlockedBuildings[]    Array of unlocked building IDs
```

Each entry in `unlockedBuildings[]`:

```
 0      2     uint16  buildingId            Building index (0–137)
```

`techName` — Human-readable name for current tech level. When length is 0, use default name derived from `techLevel` index.

**Tech level names** (canonical, for reference):

| Level | Name |
|-------|------|
| 0     | Pre-Colony |
| 1     | Basic Survival |
| 2     | Early Expansion |
| 3     | Industrialization |
| 4     | Advanced Industry |
| 5    | Scientific Era |
| 6     | High Technology |
| 7     | Cybernetics |
| 8     | Genetic Engineering |
| 9     | Nanotechnology |
| 10    | Space Elevator |
| 11    | Orbital Infrastructure |
| 12    | Interstellar |

**Body size**: 11 + techNameLen + 2 + (unlockedBuildingCount × 2). Typical: ~35–70 bytes.

### 2.8 Section 0x05 — COLONY_BUILDINGS

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      2     uint16  buildingCount         Number of building instances

 Then for each building (20 bytes each):
       2     uint16  definitionId          BuildingDefinition index (0–137)
       1     int8    gridX                 Grid column (−1 = unplaced/SEED)
       1     int8    gridY                 Grid row (−1 = unplaced/SEED)
       2     int16   siteX                 Sub-pixel X offset (−32768 = not placed)
       2     int16   siteY                 Sub-pixel Y offset
       1     uint8   state                 Building state enum
       1     uint8   health                Health 0–100 (0 = destroyed)
       2     uint16  turnsSinceBuilt       Turns since construction started
       2     uint16  buildProgress         Construction progress (0 = not started)
       2     uint16  workersAssigned       Currently assigned workers
       2     uint16  inputStock            Current input buffer
       2     uint16  outputStock           Current output buffer
```

`state` enum:

| Value | Name               | Description |
|-------|--------------------|-------------|
| 0     | BLDG_PLANNED       | Queued but not started |
| 1     | BLDG_UNDER_CONSTRUCTION | Currently building |
| 2     | BLDG_OPERATIONAL   | Staffed, powered, running |
| 3     | BLDG_POWERED_DOWN  | Intentionally deactivated |
| 4     | BLDG_DAMAGED       | Damaged but repairable |
| 5     | BLDG_DESTROYED     | Ruined, needs rebuild |
| 6     | BLDG_UPGRADING     | Currently being upgraded |
| 7     | BLDG_MAINTENANCE   | Under repair |

**Body size**: 2 + (buildingCount × 20). Typical: 2 + (50 × 20) = 1002 bytes.

### 2.9 Section 0x06 — COLONY_DISASTERS

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      1     uint8   disasterCount          Number of active disasters (0–20)

 Then for each disaster (4 bytes each):
       1     uint8   disasterType           Disaster type enum
       2     uint16  turnsRemaining         Turns until disaster resolves/ends
       1     uint8   severity               Severity 0–100
```

`disasterType` enum:

| Value | Name            | Description |
|-------|-----------------|-------------|
| 0     | DIS_FIRE        | Structural fire |
| 1     | DIS_EARTHQUAKE  | Seismic event |
| 2     | DIS_PLAGUE      | Epidemic |
| 3     | DIS_METEOR      | Meteor strike |
| 4     | DIS_MELTDOWN    | HotLab meltdown |
| 5     | DIS_RIOT        | Civil unrest |
| 6     | DIS_TOXIC_SPILL | Chemical leak |
| 7     | DIS_SOLAR_FLARE | EMP / solar event |

**Body size**: 1 + (disasterCount × 4). Typical: 1–41 bytes.

### 2.10 Section 0x07 — COLONY_EVENTS

Stores the event queue / log — last N events for display and history.

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      2     uint16  eventCount            Number of events in log (0–65535)

 Then for each event (10 bytes each):
       1     uint8   eventType             Event type enum
       4     uint32  turn                  Turn when event occurred
       4     uint32  eventData             Payload (depends on eventType)
       1     uint8   severity              Display severity (0=info, 1=warning, 2=critical)
```

`eventType` enum:

| Value | Event             | eventData meaning |
|-------|-------------------|-------------------|
| 0     | EV_GENERIC        | Unspecified (data = 0) |
| 1     | EV_BUILT          | Building definition ID |
| 2     | EV_DESTROYED      | Building definition ID |
| 3     | EV_STARVATION     | Number of colonists lost |
| 4     | EV_BIRTH          | Number of newborns |
| 5     | EV_EMIGRATION     | Number of emigrants |
| 6     | EV_DISASTER       | Disaster type in low byte |
| 7     | EV_DISASTER_ENDED | Disaster type in low byte |
| 8     | EV_TECH_UNLOCK    | Tech level achieved |
| 9     | EV_RESEARCH_COMPLETE | Research project ID |
| 10    | EV_SUPPLY_DROP    | Quantity of supplies received |
| 11    | EV_AI_ACTION      | AI action code |
| 12    | EV_MILESTONE      | Milestone ID |
| 13    | EV_CUTSCENE       | FLC file ID to play |

**Body size**: 2 + (eventCount × 10). Log is typically capped at 200 events → 2002 bytes max.

### 2.11 Section 0x08 — COLONY_MAP

Exploration/fog-of-war state for the planet surface.

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      2     uint16  mapWidth              Map width in tiles
 2      2     uint16  mapHeight             Map height in tiles
 4      4     uint32  exploredBitsSize      Size of explored bitmap in bytes
 8      var   uint8[] exploredBitmap        Run-length encoded explored/fog bitmap
       2     uint16  visibleBuildingCount   Number of visible building entries
       var   struct  visibleBuildings[]     Array of visible building coords
```

`exploredBitmap` — RLE-encoded bitmap: each byte pair is `[count-1] [value]` where count is 1–256 and value is 0 (unexplored) or 1 (explored). Decodes to `mapWidth × mapHeight` bits.

Each `visibleBuildings[]` entry:

```
 0      1     int8    gridX 
 1      1     int8    gridY
 2      2     uint16  definitionId
```

**Body size**: 8 + exploredBitsSize + 2 + (visibleBuildingCount × 4). Typical: ~200–2000 bytes.

### 2.12 Section 0xF0 — EXT_META (Extended Metadata)

Optional metadata section. Contents are informational and not required for simulation integrity.

```
Offset  Size  Type    Field                 Description
------  ----  ------  --------------------  -----------------------------------
 0      4     uint32  playTimeMs            Total play time (duplicate from header, here for section-level access)
 4      4     uint32  saveCount             Number of times this save was saved
 8      4     uint32  versionCreated        Build version that created this save
12      4     uint32  versionLoaded         Build version that last loaded this save
16      2     uint16  thumbnailWidth        Thumbnail image width (0 = no thumbnail)
18      2     uint16  thumbnailHeight       Thumbnail image height
20      var   uint8[] thumbnailData         Raw 24-bit BGR pixel data (thumbnailWidth × thumbnailHeight × 3)
```

`versionCreated` / `versionLoaded` — Semantic version encoded as `(major << 22) | (minor << 12) | (patch)`. E.g., v1.0.0 = 0x00400000.

**Body size**: 20 + (thumbnailWidth × thumbnailHeight × 3). Optional, may be omitted.

### 2.13 File Footer (4 bytes)

```
Offset  Size  Type    Field     Description
------  ----  ------  --------  -----------------------------------
 0      4     char[4] magic     "ENDM" (0x45 0x4E 0x44 0x4D)
```

### 2.14 Complete Binary Example

```
Offset  Bytes                           Field
------  ------------------------------  -----------------------------------------
0x0000  4F 50 53 4D                     magic "OPSM"
0x0004  01 00                           version = 1
0x0006  XX XX                           checksum (calculated post-write)

0x0008  64 63 62 01                     "dcb" + section 0x01
0x000C  19 00 00 00                     section length = 25
0x0010  01 00 00 00                     saveVersion = 1
0x0014  2A 00 00 00                     turnCount = 42
0x0018  84 5F 63 66                     timestamp = 1718217604
0x001C  09                               playerNameLen = 9
0x001D  43 6F 6D 6D 61 6E 64 65 72     "Commander"
0x0026  00                               systemId = 0 (Aphrodite)
0x0027  01                               difficulty = 1 (Normal)
0x0028  01                               terrainType = 1
0x0029  FF FF FF FF                      seedLanderId = none
0x002D  01 00 00 00                      gameFlags = COLONY_INITIALIZED
0x0031  FF                               scenarioId = free play
0x0032  00 00 00 00                      playTimeMs = 0

0x0036  64 63 62 02                     "dcb" + section 0x02
0x003A  82 00 00 00                     section length = 130
...                                      [resources data]

...

0xXXXX  45 4E 44 4D                     magic "ENDM"
```

---

## 3. JSON Format

### 3.1 Schema

The JSON format mirrors the binary section structure as a flat object with named fields. All numeric values are JSON numbers. Binary blobs are base64-encoded strings.

```json
{
  "format": "Outpost Remastered Save",
  "formatVersion": 1,

  "header": {
    "saveVersion": 1,
    "turnCount": 42,
    "timestamp": "2026-06-12T12:00:00Z",
    "playerName": "Commander",
    "systemId": 0,
    "difficulty": "normal",
    "terrainType": 1,
    "seedLanderId": 0,
    "gameFlags": ["COLONY_INITIALIZED"],
    "scenarioId": null,
    "playTimeMs": 3600000
  },

  "resources": [
    { "type": "commonMetals", "current": 1250, "capacity": 5000, "producedThisTurn": 45, "consumedThisTurn": 10, "reserve": 0 },
    { "type": "rareMetals",   "current": 340,  "capacity": 2000, "producedThisTurn": 12, "consumedThisTurn": 8,  "reserve": 0 },
    { "type": "food",         "current": 780,  "capacity": 3000, "producedThisTurn": 30, "consumedThisTurn": 25, "reserve": 0 },
    { "type": "energy",       "current": 500,  "capacity": 5000, "producedThisTurn": 55, "consumedThisTurn": 42, "reserve": 200 },
    { "type": "population",   "current": 135,  "capacity": 0,    "producedThisTurn": 3,  "consumedThisTurn": 0,  "reserve": 0 },
    { "type": "research",     "current": 240,  "capacity": 0,    "producedThisTurn": 15, "consumedThisTurn": 0,  "reserve": 0 }
  ],

  "population": {
    "total": 135,
    "workers": 85,
    "scientists": 15,
    "children": 32,
    "soldiers": 3,
    "morale": 72,
    "growthRate": 0.03,
    "moraleFactors": ["MF_FOOD_SURPLUS", "MF_HAS_REC", "MF_HAS_CHAP"],
    "housingCapacity": 200,
    "housingOccupied": 135,
    "emigrationThreshold": 20,
    "immigrationBonus": 0
  },

  "tech": {
    "techMask": 3855,
    "techLevel": 7,
    "researchPoints": 1200,
    "researchPerTurn": 15,
    "currentProjectId": "advMaterials",
    "techName": "High Technology",
    "unlockedBuildings": [0, 1, 2, 3, 5, 7, 10, 15, 22, 30]
  },

  "buildings": [
    {
      "definitionId": 0,
      "gridX": 0,
      "gridY": 0,
      "siteX": 0,
      "siteY": 0,
      "state": "operational",
      "health": 100,
      "turnsSinceBuilt": 42,
      "buildProgress": 100,
      "workersAssigned": 5,
      "inputStock": 0,
      "outputStock": 0
    }
  ],

  "disasters": [],

  "events": [
    { "eventType": "built", "turn": 1, "data": 0, "severity": "info" }
  ],

  "map": {
    "width": 64,
    "height": 48,
    "exploredBitmap": "base64...",
    "visibleBuildings": [
      { "gridX": 0, "gridY": 0, "definitionId": 0 }
    ]
  },

  "metadata": {
    "playTimeMs": 3600000,
    "saveCount": 5,
    "versionCreated": "1.0.0",
    "versionLoaded": "1.0.0",
    "thumbnail": "base64..."
  }
}
```

### 3.2 String Enum Values

Where binary format uses numeric enums, JSON uses string equivalents:

| Field | Binary | JSON Values |
|-------|--------|-------------|
| `difficulty` | 0–2 | `"easy"`, `"normal"`, `"hard"` |
| `state` | 0–7 | `"planned"`, `"underConstruction"`, `"operational"`, `"poweredDown"`, `"damaged"`, `"destroyed"`, `"upgrading"`, `"maintenance"` |
| `disasterType` | 0–7 | `"fire"`, `"earthquake"`, `"plague"`, `"meteor"`, `"meltdown"`, `"riot"`, `"toxicSpill"`, `"solarFlare"` |
| `eventType` | 0–13 | `"generic"`, `"built"`, `"destroyed"`, `"starvation"`, `"birth"`, `"emigration"`, `"disaster"`, `"disasterEnded"`, `"techUnlock"`, `"researchComplete"`, `"supplyDrop"`, `"aiAction"`, `"milestone"`, `"cutscene"` |
| `resourceType` | 0–5 | `"commonMetals"`, `"rareMetals"`, `"food"`, `"energy"`, `"population"`, `"research"` |
| `severity` | 0–2 | `"info"`, `"warning"`, `"critical"` |

### 3.3 JSON ↔ Binary Conversion Rules

| Aspect | Rule |
|--------|------|
| **Strings** | Convert to/from length-prefixed UTF-8. Max 255 bytes. |
| **Enums** | Map bidirectional via lookup table. Unknown enum values → `"unknown_<N>"` string in JSON, preserve as raw uint8/uint16 in binary. |
| **Arrays** | Section body with count prefix ↔ JSON array. |
| **Timestamps** | JSON uses ISO 8601 UTC. Internal storage is Unix uint32. |
| **Base64** | Binary blobs (explored bitmap, thumbnail) are base64-encoded in JSON without line breaks. |
| **NaN/Infinity** | Not valid. Must clamp to valid ranges before serialization. |
| **Optional fields** | Missing JSON fields default to 0/null. Unknown JSON keys are preserved when round-tripping. |
| **Float precision** | growthRate is stored as uint16 basis points (0–10000 = 0.00%–100.00%). JSON may use float; convert with `round(value * 10000)`. |

---

## 4. SaveManager API

### 4.1 Header (`save-format.hpp`)

```cpp
#pragma once
#include <filesystem>
#include <vector>
#include <cstdint>
#include <string>

struct ColonyState;  // Forward declaration from simulation/colony.hpp

enum class SaveFormat {
    Binary,
    Json,
    AutoDetect
};

struct SaveValidationResult {
    enum class Status {
        Valid,
        Corrupted,
        InvalidMagic,
        WrongVersion,
        ChecksumMismatch,
        MissingHeader,
        Truncated,
        UnknownSection,
        InternalError
    };

    Status status{Status::Valid};
    uint32_t version{0};
    uint32_t turnCount{0};
    std::string errorMessage;
    std::vector<uint8_t> badSectionIds;  // Section IDs that failed validation

    bool isValid() const { return status == Status::Valid; }
    explicit operator bool() const { return isValid(); }
};

class SaveManager {
public:
    SaveManager();

    // --- Primary save/load ---
    bool save(const ColonyState& state, const std::filesystem::path& path,
              SaveFormat fmt = SaveFormat::Binary);
    bool load(ColonyState& state, const std::filesystem::path& path,
              SaveFormat fmt = SaveFormat::AutoDetect);

    // --- Original .OPS import (future enhancement) ---
    bool loadOriginalOps(ColonyState& state,
                         const std::filesystem::path& originalOpsPath);

    // --- Validation ---
    SaveValidationResult validate(const std::filesystem::path& path);

    // --- Conversion ---
    bool convertToJson(const std::filesystem::path& binaryPath,
                       const std::filesystem::path& jsonPath);
    bool convertFromJson(const std::filesystem::path& jsonPath,
                         const std::filesystem::path& binaryPath);

    // --- Batch ---
    bool saveAutoBackup(const ColonyState& state);
    bool loadLatest(std::vector<ColonyState>& states);  // Quicksave → slot 01 → …

    // --- Query ---
    static std::string suggestFilename(const ColonyState& state);
    static bool isOpsFile(const std::filesystem::path& path);

private:
    // Binary serialization
    CRC16 calculateChecksum(const std::vector<uint8_t>& data);
    std::vector<uint8_t> serialize(const ColonyState& state);
    bool deserialize(ColonyState& state, const std::vector<uint8_t>& data);

    // JSON serialization
    std::string toJson(const ColonyState& state);
    bool fromJson(ColonyState& state, const std::string& json);

    // Section I/O
    bool writeSection(std::vector<uint8_t>& buffer, uint8_t sectionId,
                      const std::vector<uint8_t>& body);
    bool readSection(const std::vector<uint8_t>& data, size_t& offset,
                     uint8_t& sectionId, std::vector<uint8_t>& body);

    // CRC-16/CCITT implementation
    static uint16_t crc16(const uint8_t* data, size_t len);
    static uint16_t crc16(const std::vector<uint8_t>& data);

    // Default paths
    std::filesystem::path m_saveDirectory;
};
```

### 4.2 CRC-16/CCITT Reference Implementation

```cpp
uint16_t SaveManager::crc16(const uint8_t* data, size_t len) {
    uint16_t crc = 0xFFFF;
    for (size_t i = 0; i < len; ++i) {
        crc ^= static_cast<uint16_t>(data[i]) << 8;
        for (int j = 0; j < 8; ++j) {
            if (crc & 0x8000)
                crc = (crc << 1) ^ 0x1021;
            else
                crc <<= 1;
        }
    }
    return crc;  // No final XOR (0x0000)
}
```

### 4.3 Serialization Pseudocode

```
function serialize(ColonyState state):
    buffer = [8 bytes header placeholder]

    // Section 0x01: COLONY_HEADER
    body = pack_le_u32(state.saveVersion)
         + pack_le_u32(state.turnCount)
         + pack_le_u32(unix_timestamp_now())
         + pack_u8(len(state.playerName))
         + state.playerName.utf8_bytes()
         + pack_u8(state.systemId)
         + pack_u8(state.difficulty)
         + pack_u8(state.terrainType)
         + pack_le_u32(state.seedLanderId)
         + pack_le_u32(state.gameFlags)
         + pack_u8(state.scenarioId)
         + pack_le_u32(state.playTimeMs)
    writeSection(buffer, 0x01, body)

    // Section 0x02: COLONY_RESOURCES
    body = pack_le_u32(6)  // resourceCount
    for each res in state.resources:
        body += pack_u8(res.type)
              + pack_le_u32(res.current)
              + pack_le_u32(res.capacity)
              + pack_le_u32(res.producedThisTurn)
              + pack_le_u32(res.consumedThisTurn)
              + pack_le_s32(res.reserve)
    writeSection(buffer, 0x02, body)

    // Section 0x03: COLONY_POPULATION
    body = pack_le_u16(state.population.total)
         + pack_le_u16(state.population.workers)
         + pack_le_u16(state.population.scientists)
         + pack_le_u16(state.population.children)
         + pack_le_u16(state.population.soldiers)
         + pack_le_s16(state.population.morale)
         + pack_le_u16(state.population.growthRateBps)
         + pack_le_u16(state.population.moraleFactors)
         + pack_le_u16(state.population.housingCapacity)
         + pack_le_u16(state.population.housingOccupied)
         + pack_le_u16(state.population.emigrationThreshold)
         + pack_le_u16(state.population.immigrationBonus)
    writeSection(buffer, 0x03, body)

    // Section 0x04: COLONY_TECH
    body = pack_le_u16(state.tech.techMask)
         + pack_le_u16(state.tech.techLevel)
         + pack_le_u16(state.tech.researchPoints)
         + pack_le_u16(state.tech.researchPerTurn)
         + pack_le_u16(state.tech.currentProjectId)
         + pack_u8(len(state.tech.techName))
         + state.tech.techName.utf8_bytes()
         + pack_le_u16(state.tech.unlockedBuildings.size())
    for each id in state.tech.unlockedBuildings:
        body += pack_le_u16(id)
    writeSection(buffer, 0x04, body)

    // Section 0x05: COLONY_BUILDINGS
    body = pack_le_u16(state.buildings.size())
    for each bldg in state.buildings:
        body += pack_le_u16(bldg.definitionId)
             + pack_s8(bldg.gridX)
             + pack_s8(bldg.gridY)
             + pack_le_s16(bldg.siteX)
             + pack_le_s16(bldg.siteY)
             + pack_u8(bldg.state)
             + pack_u8(bldg.health)
             + pack_le_u16(bldg.turnsSinceBuilt)
             + pack_le_u16(bldg.buildProgress)
             + pack_le_u16(bldg.workersAssigned)
             + pack_le_u16(bldg.inputStock)
             + pack_le_u16(bldg.outputStock)
    writeSection(buffer, 0x05, body)

    // Section 0x06: COLONY_DISASTERS
    body = pack_u8(state.disasters.size())
    for each disaster in state.disasters:
        body += pack_u8(disaster.type)
             + pack_le_u16(disaster.turnsRemaining)
             + pack_u8(disaster.severity)
    writeSection(buffer, 0x06, body)

    // Section 0x07: COLONY_EVENTS
    body = pack_le_u16(state.events.size())
    for each event in state.events:
        body += pack_u8(event.type)
             + pack_le_u32(event.turn)
             + pack_le_u32(event.data)
             + pack_u8(event.severity)
    writeSection(buffer, 0x07, body)

    // Section 0x08: COLONY_MAP
    body = pack_le_u16(state.map.width)
         + pack_le_u16(state.map.height)
         + rle_encode(state.map.exploredBitmap)
         + pack_le_u16(state.map.visibleBuildings.size())
    for each vb in state.map.visibleBuildings:
        body += pack_s8(vb.gridX)
             + pack_s8(vb.gridY)
             + pack_le_u16(vb.definitionId)
    writeSection(buffer, 0x08, body)

    // Write file header
    checksum = crc16(buffer.data() + 8, buffer.size() - 8 - 4)  // Skip header, include footer placeholder
    buffer[4] = pack_le_u16(1)     // version
    buffer[6] = pack_le_u16(checksum)

    // Append ENDM footer
    buffer += "ENDM"

    return buffer
```

---

## 5. Key Design Decisions

### 5.1 Why Not Serialize In-Memory Structs Directly

The binary format is NOT a `memcpy` of C++ structs. Reasons:

| Concern | Solution |
|---------|----------|
| **ABI differences** | Compiler padding, vtable pointers, member reordering differ across compilers/architectures |
| **Pointer fields** | `BuildingDefinition* def` in `BuildingInstance` is transient — serialize `definitionId` (uint16 index) instead |
| **Vector layout** | `std::vector` internal structure (pointer, size, capacity) is implementation-specific. Serialize count + elements explicitly |
| **Bitfield layout** | Bitfield ordering is compiler-defined. Use explicit `uint16_t` with bitwise ops |
| **Alignment** | All fields are packed byte-by-byte; no implicit padding. Use `#pragma pack(push, 1)` or manual byte packing |
| **Endianness** | All multi-byte integers are little-endian. Portable across big-endian hosts via byte swaps on read/write |

### 5.2 Integer Encoding

| C++ Type | Binary Size | Encoding |
|----------|-------------|----------|
| `uint8_t` / `int8_t` | 1 byte | Native |
| `uint16_t` / `int16_t` | 2 bytes | Little-endian |
| `uint32_t` / `int32_t` | 4 bytes | Little-endian |
| `uint64_t` / `int64_t` | 8 bytes | Little-endian (future use) |

### 5.3 String Encoding

- All strings are UTF-8.
- Prefixed by 1-byte length (0–255). No null terminator in the body.
- Length byte counts bytes, not characters (for multi-byte UTF-8 sequences).
- Empty string: length byte = 0x00, zero body bytes.
- Max length: 255 bytes. Longer strings must be truncated on save.

### 5.4 Forward Compatibility Rules

| Rule | Description |
|------|-------------|
| **New sections** | Any section ID not in the known list is skipped (but preserved on round-trip save). |
| **Extension IDs** | IDs 0xF0–0xFF are reserved for non-critical metadata. A V1 loader may skip them. |
| **Enlarged fields** | If `sectionLength` exceeds expected body size, remaining bytes are ignored. |
| **Truncated fields** | If `sectionLength` is less than expected body size, missing trailing fields default to 0. |
| **Unknown enum values** | Preserved as raw integers in binary; in JSON, serialized as `"unknown_<N>"`. |
| **Version check** | `version > 1` triggers a warning but load proceeds. `version == 0` or `version > 255` is rejected. |
| **Missing sections** | Sections 0x02–0x07 have sensible defaults (empty buildings, zero resources, etc). |

### 5.5 Error Handling

| Scenario | Behavior |
|----------|----------|
| File not found | Return false, error message set |
| Invalid magic | Return false, `SaveValidationResult::InvalidMagic` |
| Checksum mismatch | Return false, `SaveValidationResult::ChecksumMismatch` (still attempt partial deserialize if `load` called directly) |
| Truncated file | Deserialize as much as possible; missing sections default. |
| Corrupted section body | Skip section, log warning, continue. |
| Unrecognized section ID | Skip (with log), preserve bytes for round-trip. |
| Version > max supported | Load with warning; unsupported sections are skipped. |
| Out-of-range enum values | Clamp to valid range, log warning. |
| Negative resource values | Clamp to 0. |

---

## 6. Save File Naming

### 6.1 Pattern

```
[Prefix]_[SystemName]_Turn[NNNN]_[Timestamp].[ext]
```

### 6.2 Components

| Component | Format | Example |
|-----------|--------|---------|
| Prefix | `Outpost` | `Outpost` |
| SystemName | PascalCase system name | `Aphrodite`, `AnonymousBosch`, `SigmaDraconis` |
| TurnNumber | Zero-padded to 4 digits | `Turn0042` |
| Timestamp | `YYYYMMDDTHHmmss` | `20260612T120000` |
| Extension | `.ops` or `.ops.json` | `.ops` |

### 6.3 Examples

| Type | Filename |
|------|----------|
| Manual save | `Outpost_Aphrodite_Turn0042_20260612T120000.ops` |
| Quick-save | `Quicksave.ops` |
| Slot 1 | `SaveSlot01.ops` |
| Slot 2 | `SaveSlot02.ops` |
| Slot 3 | `SaveSlot03.ops` |
| Slot 4 | `SaveSlot04.ops` |
| Slot 5 | `SaveSlot05.ops` |
| Slot 6 | `SaveSlot06.ops` |
| Slot 7 | `SaveSlot07.ops` |
| Slot 8 | `SaveSlot08.ops` |
| Slot 9 | `SaveSlot09.ops` |
| JSON debug | `Outpost_Aphrodite_Turn0042_20260612T120000.ops.json` |
| Auto-backup | `Backup_20260612_120000.ops` |

### 6.4 Directory Layout

```
[SaveDirectory]/
├── Quicksave.ops
├── SaveSlot01.ops
├── SaveSlot02.ops
├── ...
├── SaveSlot09.ops
├── manual/
│   └── Outpost_Aphrodite_Turn0042_20260612T120000.ops
├── autobackup/
│   ├── Backup_20260612_120000.ops
│   └── ...
└── debug/
    ├── Outpost_Aphrodite_Turn0042_20260612T120000.ops.json
    └── ...
```

### 6.5 `suggestFilename()` Implementation

```cpp
std::string SaveManager::suggestFilename(const ColonyState& state) {
    static const std::array<const char*, 15> systemNames = {
        "Aphrodite", "AnonymousBosch", "SigmaDraconis", "VulcansForge",
        "AlphaCentauri", "BarnardsStar", "Lalande", "Luyten",
        "Ross", "Sirius", "TauCeti", "Wolf",
        "EpsilonEridani", "DeltaPavonis", "Groombridge"
    };

    std::string name = "Outpost_";
    if (state.systemId < 15)
        name += systemNames[state.systemId];
    else
        name += "Unknown";

    name += "_Turn" + formatZeroPadded(state.turnCount, 4);

    auto now = std::time(nullptr);
    auto tm = std::gmtime(&now);
    char ts[32];
    std::strftime(ts, sizeof(ts), "_%Y%m%dT%H%M%S", tm);
    name += ts;
    name += ".ops";

    return name;
}
```

---

## 7. Backward Compatibility with Original .OPS

### 7.1 Original .OPS Format Differences

Original Outpost save files use a different structure. `loadOriginalOps()` must handle:

| Difference | Original | Remastered |
|-----------|----------|------------|
| File magic | None (starts with section data) | `OPSM` (4 bytes) |
| Header | No file-level header | 8-byte header with version + checksum |
| Sections | Uses embedded struct sizes | Explicit `sectionLength` field |
| Encoding | Platform-endian (= LE on x86) | Explicit little-endian |
| Building data | Raw C++ struct (compiler-dependent) | Serialized with type prefixes |
| String encoding | Null-terminated ASCII | Length-prefixed UTF-8 |
| Unknown fields | Present in struct padding | Explicit field layout |

### 7.2 Import Strategy

```cpp
bool SaveManager::loadOriginalOps(ColonyState& state,
                                   const std::filesystem::path& path) {
    // 1. Read raw bytes
    // 2. Scan for dcbSC markers (original uses dcbSC<hhex>, no file header)
    // 3. Map original section IDs to Remastered equivalents:
    //    - Map 7-char dcbSC markers to our section IDs
    //    - Handle struct layout differences
    // 4. Provide best-effort deserialization
    // 5. Mark all buildings as "underConstruction" or "operational" heuristically
    // 6. Return true with warnings, or false on total failure
    //
    // Note: This is a FUTURE ENHANCEMENT. V1.0 does not require it.
    return false;
}
```

---

## 8. Testing Requirements

### 8.1 Round-Trip Tests

| Test | Description |
|------|-------------|
| `save_load_roundtrip` | Save a ColonyState, load it back, verify all fields match. |
| `binary_json_roundtrip` | Save as binary, convert to JSON, convert back, verify match. |
| `json_binary_roundtrip` | Save as JSON, convert to binary, convert back, verify match. |
| `corrupted_checksum` | Load file with wrong checksum → error + partial load. |
| `truncated_file` | Load truncated file → graceful handling with defaults. |
| `missing_sections` | File missing section 0x03 → default population values. |
| `version_mismatch` | File with version 99 → load with warning. |
| `extended_section` | File with section 0xF0 → metadata loaded. |
| `unknown_section` | File with section 0x80 (unknown) → skipped, round-tripped. |
| `max_buildings` | Colony with 138 buildings → save/load correctly. |
| `empty_colony` | Brand-new colony (turn 0, no buildings) → save/load correctly. |
| `unicode_player_name` | Player name with UTF-8 characters → save/load correctly. |
| `filename_formatting` | `suggestFilename()` produces valid filesystem name. |

### 8.2 Validation Tests

| Test | Description |
|------|-------------|
| `validate_correct` | Valid file → `Status::Valid`. |
| `validate_wrong_magic` | File with `XXXX` magic → `Status::InvalidMagic`. |
| `validate_checksum` | Corrupted byte → `Status::ChecksumMismatch`. |
| `validate_truncated` | File cut at section boundary → `Status::Truncated`. |
| `validate_original_ops` | Original Outpost save → `Status::InvalidMagic` (expected). |

### 8.3 Edge Cases

- Resource values at INT32_MAX / INT32_MIN bounds.
- Population = 0 (extinct colony).
- Morale at −100 and +100 extremes.
- Building grid coordinates at grid boundaries (−1, 0, 127).
- Tech mask = 0 (no tech) and 0xFFF (all tech).
- Disaster count = 20 (maximum active).
- Event log with 65,535 entries (theoretical max).
- Player name of exactly 255 bytes (max length).
- Empty event log, empty building list, empty disaster list.

---

## 9. Performance Budget

| Operation | Target | Notes |
|-----------|--------|-------|
| Binary save (50 buildings) | < 5 ms | Direct byte packing |
| Binary load (50 buildings) | < 5 ms | Direct array reads |
| JSON save (50 buildings) | < 50 ms | nlohmann/json or simdjson serialization |
| JSON load (50 buildings) | < 50 ms | DOM parse |
| Binary → JSON conversion | < 100 ms | Combined parse + serialize |
| JSON → Binary conversion | < 100 ms | Combined parse + serialize |
| CRC-16 validation | < 1 ms | Over ~32 KB max file |
| `validate()` call | < 2 ms | Lightweight scan, no deserialize |

All targets measured on a reference system (x86-64, 3.0 GHz, SSD).

---

## 10. Dependencies

| Component | Library | Why |
|-----------|---------|-----|
| JSON parsing | `nlohmann/json` (header-only) or `simdjson` | Well-tested, widely available |
| File I/O | `<filesystem>` (C++17) | Standard, cross-platform |
| String encoding | UTF-8 throughout (C++20 `char8_t` compatible) | No external dependency needed |
| CRC-16 | Self-contained (~10 LOC) | No dependency |
| Base64 (thumbnail) | `cpp-base64` or self-contained (~30 LOC) | Minimal |

---

## 11. Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-06-12 | Initial format. 8 sections (0x01–0x08) + 1 extension (0xF0). |

### Future Version Guidelines

- **V2.0+**: Append-only section additions. Never modify existing section layouts.
- **New sections**: Allocate next available ID (0x09, 0x0A, ...).
- **Deprecation**: To deprecate a section, write length=0 for that section ID. Readers skip zero-length sections.
- **Breaking changes**: Only permissible with `version` field increment. Old saves still loadable.

---

*Document prepared for Outpost Remastered implementation. All binary offsets are relative to the start of each section body, not the file.*
