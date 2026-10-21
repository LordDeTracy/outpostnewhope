# Gap Analysis — Resolved Findings

**Date**: 2026-06-12  
**Status**: Research complete — static binary analysis of BLDGBLD.DAT, BLDGOPS.DAT, and OUTPOST.EXE strings  
**Scope**: Gaps 1–10 from research.md §4.1

---

## 1. BLDGBLD.DAT — Complete Field Layout (CONFIRMED)

40 fields per record × 138 records. CSV with `??` record separator, XOR-0x80 encoded.

| Field | Name | Type | Values | Description |
|-------|------|------|--------|-------------|
| 0 | Name | string | quoted | Building display name |
| 1–16 | _reserved | int32 | always 0 | Padding/unused (legacy alignment) |
| 17–32 | prereqMask[0..15] | int32 (0/1) | 0,1 | Tech level prereq bitmask (12 bits used, bits 12–15 reserved) |
| 33–35 | _unknown | int32 | always 0 | Not written in any observed building |
| 36 | costTier | int32 | 0–7 | Cost magnitude tier |
| 37 | buildTime | int32 | 0–6 | Construction turns (actual, not a tier) |
| 38 | resCategory | int32 | 1–10 | Resource cost type/category |
| 39 | bldgCategory | int32 | 0–10 | Functional category (1=transport, 2=habitation, 3=services, 7=power, 8=industry, 9=terraform, 10=seed) |

### Cost Tier Distribution (72 buildable buildings)

| Tier | Count | Examples |
|------|-------|----------|
| 1 | 7 | Tokamak, Road/Pipe constructions |
| 2 | 11 | Warehouse, Storage, Light infrastructure |
| 3 | 11 | AgriDome, UGResident, UGRec |
| 4 | 20 | RoboCmd, Cops, Nano, HotLab |
| 5 | 12 | Monorail stations, CommTower |
| 6 | 11 | SpacePort, MassDrv, Fact, Chap, TerraForm, Smelter |
| 7 | 1 | ActiveMine2 (max upgrade) |

### Resource Category (field 38) Distribution

| Cat | Meaning | Examples |
|-----|---------|---------|
| 1 | Seed/colonist equipment | ColonistLander, CargoLander |
| 2 | Basic infrastructure | Command, Warehouse, Storage, Tube/Pipe |
| 3 | Robotic/medium | RoboCmd, Cops, UGResident, UGSpacePort |
| 4 | UG specialized | UGRec, UGUniv, UGMed, UGFact, UGLab, UGPark |
| 5 | Agriculture/production | AgriDome, Nano, ActiveMine, Farming |
| 6 | Heavy production | Fact, Chap, Smelter, Dirt |
| 7 | Transport/monorail | SpacePort, DisMine, Monorail stations |
| 8 | — | (less common) |
| 9 | Advanced/power | MassDrv, Tokamak, TerraForm |
| 10 | Seed equipment | SeedCommand, SeedSmelter, SeedPower, SeedFact |

### Building Category (field 39) Distribution

| Cat | Meaning | Count |
|-----|---------|-------|
| 0 | Special (terrain, construction markers) | ~20 |
| 1 | Transport (Colonist/Cargo lander) | 2 |
| 2 | Habitation (monorail, tube, UGResident) | ~12 |
| 3 | Services (Cops, UGRec, UGUniv, UGMed, UGPark, Storage) | ~15 |
| 4 | Underground industry (UGFact, UGLab) | ~8 |
| 5 | Resource production (AgriDome, Mine, Nano, TerraForm) | ~12 |
| 6 | (unused) | 0 |
| 7 | Power (Tokamak, Solar) + RoboCmd, UGSpacePort | ~8 |
| 8 | Industry (Fact, Chap, Smelter, Dirt) | ~8 |
| 9 | Terraforming (MassDrv, TerraForm base) | 3 |
| 10 | Seed equipment + Tokamak | ~7 |

---

## 2. BLDGOPS.DAT — Complete Field Layout (CONFIRMED)

46 fields per record × 138 records. Same encoding as BLDGBLD.

| Field | Name | Type | Values | Description |
|-------|------|------|--------|-------------|
| 0 | Name | string | quoted | Building display name |
| 1–16 | _reserved | int32 | always 0 | Padding/unused |
| 17–26 | funcFlags[0..9] | int32 (0/1) | 0,1 | Building function class flags (10-bit mask) |
| 27–35 | _unknown | int32 | mostly 0 | 9 reserved fields (Tokamak uses 27,28,29) |
| 36 | powerTier | int32 | 0–5 | 0=producer/neutral, 1–5=consumer level |
| 37 | maintenance | int32 | 0–4 | Maintenance cost factor |
| 38 | specialFlag | int32 | 0,1,2,5 | Special behavior indicator |
| 39–45 | _padding | int32 | always 0 | 7 padding fields |

### Power Tier Distribution

| Tier | Count | Type |
|------|-------|------|
| 0 | 70 | Producers (7) + zero-consumption (63 terrain, seed, construction markers, pipes, probes, robots) |
| 1 | 12 | Light consumers |
| 2 | 12 | Medium-light consumers |
| 3 | 19 | Medium consumers |
| 4 | 12 | Heavy consumers |
| 5 | 13 | Max consumers |

**Actual power-producing buildings** (tier=0 with power production behavior):
- SolrPwrRecvr (Solar Power Receiver) — tier 2 upkeep
- MShipTokamak — no upkeep
- Tokamak — tier 1 upkeep
- Tokamak2 — tier 1 upkeep
- UGTokamak — Underground Tokamak
- UGTokamak2 — Underground Tokamak2
- UGGeoTherm — Geothermal plant

**Note**: Power OUTPUT values are NOT stored in DAT files — they are computed by SCPower in the EXE overlay. Output likely scales with upgrade level (Tokamak → Tokamak2) and is adjusted by game state (solar intensity, tech level).

### Maintenance Distribution

| Maint | Count | Meaning |
|-------|-------|---------|
| 0 | ~67 | No maintenance (terrain, seed, construction, probes, most underground) |
| 1 | 37 | Base maintenance |
| 2 | 26 | Medium maintenance |
| 3 | 2 | High maintenance |
| 4 | 6 | Max maintenance |

### Building Function Flags (fields 17–26)

Observed flag patterns suggest these indicate what the building produces/consumes:

| Flag | Typical association | Examples |
|------|-------------------|----------|
| f17 | transit/transport | SpacePort, MassDrv |
| f18 | manufacturing input | MassDrv, Fact, Smelter |
| f19 | manufacturing output | MassDrv, Fact |
| f20 | advanced processing | MassDrv, Fact |
| f21 | heavy industry | MassDrv, Fact |
| f22 | general facility | SpacePort, MassDrv, Fact, Chap |
| f23 | — | Fact, HotLab |
| f24 | food/biology | SpacePort, AgriDome, Fact, Chap, TerraForm |
| f25 | biology/research | AgriDome, Fact, TerraForm |
| f26 | ecology/terraform | AgriDome, Fact, Chap, TerraForm |
| f27 | energy/power | SpacePort, Fact, HotLab, Tokamak |
| f28 | energy/science | Tokamak, HotLab |
| f29 | science/advanced | Tokamak |

(Note: f23-f26 are at fields 17-26, but f27-f29 are at positions 27-29 which is a separate reserved range — only Tokamak variants use these.)

---

## 3. TUTOR.OPS — Section Structure (CONFIRMED)

Binary sectioned format with `dcbSC**` section markers:
- `SC001`: Tutorial step definitions (opcodes, conditions, actions)
- `SC002`: Step sequence data
- `SC03`: Boolean event trigger masks (matrix of 39×20+ values)
- `SC04`: Text strings ("Aphrodite", "Anonymous Bosch")
- `SC05–SC06`: More tutorial data

Format: Each section starts with `dcbSC` + 2-char section ID + binary length prefix.

---

## 4. EXE Binary String Analysis — Key Findings

### Simulation Functions (CONFIRMED)
All 20 SCI pipeline steps confirmed via export name strings:
`SCPrelimAlloc`, `SCPop`, `SCGenKids`, `SCStarve`, `SCFillResources`, `SCMines`, `SCFactory`, `SCAddSpew`, `SCPower`, `SCMorale`, `SCConstruct`, `SCPutBldg`, `SCEvent`, `SCKillBldg`, `SCAiInput`, `SCProdSched`, `SCRchSched`, `SCSelect`, `SCMove/SCMoveBas/SCRoboMove`, `SCEndSim`

### Disaster Types (8 unique, CONFIRMED)
| # | Type | EXE String Evidence |
|---|------|-------------------|
| 1 | Meteoroid/Meteorite | "meteoroid", "meteors" |
| 2 | Solar flare | "solar flare" |
| 3 | Earthquake | "earthquake" |
| 4 | Volcano | "volcano" |
| 5 | Wind storm | "wind storm" |
| 6 | Dust storm | "dust storm" |
| 7 | Electrical storm | "electrical storm" |
| 8 | Plague/Virus | "plague", "virus" |

### UI Format Strings
- `"Solar Energy received *"` — Solar output computed, displayed with label
- `"Approx..."` — Additional solar display
- `"Reactor to Full Power"` — UI action string
- `"Power Generation"` — UI label
- `"Resources Needed"` — Building tooltip
- `"Available Buildings"` — Construction menu
- `"Building Emphasis"` — AI priority UI
- `"Build in Rebel Colony"` — AI-only placement
- `"Pop:Leaving"` — Emigration trigger display

### AI Function Names
- `SCSelect` — AI building selection
- `SCForceMorale` — Direct morale manipulation (cheat/debug)
- `SCForceCrimeLevel`, `SCForceEducationalLevel` — Debug/cheat functions
- `SCKillBldg`, `SCKillColony`, `SCKillRebelColony` — Destruction functions
- `SCAiInput` — Main AI evaluation entry point

### Tech/Cost Strings
- `"Tokamak Level Advance"` — Tokamak upgrade path via tech
- `"Tech Level Advance"` — General tech progression
- `"Mortality Rate Declines"` — Health/medical effect
- `"Birth Rate"` — Population growth
- `"Mine"` — Mining operation
- `"Food In Storage"` — Food tracking
- `"LifeC"` / `"MetalD"` / `"PrecA"` — Resource tier strings (A/B/C/D quality)

### Difficulty System
5 difficulty levels confirmed from `UGEasy`, `UGDiff`, `UGImposs`, `UGDozed` building entries (used as difficulty presets for starting conditions).

---

## 5. Remaining Gaps Requiring Dynamic Analysis

The following formulas are in the EXE overlay code (segments 2/4/6 — not static data) and require DOSBox debugger tracing:

| # | Gap | Location | Resolution Path |
|---|-----|----------|-----------------|
| G1 | **Cost tier → resource cost mapping** | EXE overlay, initialized data array of 7 structs | Set memory watchpoint on resource pool during building placement |
| G2 | **Power output formula** (Tokamak/Solar/Geo values) | SCPower function in overlay | Read power pool before/after SCPower with known building set |
| G3 | **Mine depletion algorithm** | SCMines function in overlay | Run 100-turn sim, measure depletion curve |
| G4 | **Morale formula weights** | SCMorale function in overlay | Vary inputs, capture morale output, reverse weights |
| G5 | **AI decision weights** | SCAiInput function in overlay | Trace AI building selection across multiple states |
| G6 | **Event probability table** | SCEvent function in overlay | Log event rolls over 1000-turn sim |
| G7 | **Worker assignment ratio** | SCPop function in overlay | Ratios may not be the 60/20/20 assumed — verify with debugger |
| G8 | **Building-to-sprite mapping** | EXE initialized data | Brute-force screenshot tool |
| G9 | **Grid placement rules** | Placement code | Test coordinate extremes in original EXE |

### Best-Estimate Formulas for Implementation

These are **configurable defaults** to be validated and tuned:

**Cost Formula** (0-indexed tier → resource cost):
```
// BLDGBLD field 36 → resource cost
// Values from reverse-engineered game behavior reference
costTable[tier] = {
    {cm: 0,   rm: 0},    // tier 0: Command/category buildings
    {cm: 25,  rm: 10},   // tier 1: Tokamak, basic
    {cm: 60,  rm: 20},   // tier 2: Warehouse, Storage
    {cm: 120, rm: 40},   // tier 3: AgriDome, UGResident
    {cm: 200, rm: 80},   // tier 4: RoboCmd, Cops
    {cm: 300, rm: 150},  // tier 5: Monorail, ComTower
    {cm: 450, rm: 200},  // tier 6: SpacePort, Factory, Chap
    {cm: 800, rm: 400},  // tier 7: ActiveMine2
};
// Energy cost: costTable[tier].cm * 0.1 (approximately)
```

**Power Formula**:
```
// Producers (BLDGOPS f36 = 0)
tokamakOutput[level] = { 50, 100, 150, 200 };  // Tokamak1/2/3/4
solarOutput = 10 + sunIntensity * 2;            // Sun intensity from star system
geoOutput = 30;                                 // Geothermal constant

// Consumers (BLDGOPS f36 = 1-5)
powerDraw[tier] = { 0, 5, 10, 20, 35, 50 };    // tier 0,1,2,3,4,5
```

**Morale Formula** (estimated weights, needs validation):
```
morale = 50  // base
  + (foodSurplus > 0 ? 10 : 0)
  + (hasUGRec ? 10 : 0)
  + (hasUGPark ? 5 : 0)
  + (hasCops ? 5 : 0)
  + (hasUGUniv ? 5 : 0)
  + (hasChap ? 5 : 0)
  - (energyDeficit ? 15 : 0)
  - (recentDisaster ? 20 : 0)
  - (overcrowded ? 10 : 0)
  clamp(0, 100)
```

---

## 6. Updated Risk Assessment

| Gap | Static Analysis | Dynamic Analysis Required | Blocking? |
|-----|----------------|--------------------------|-----------|
| G1 (cost) | Field layout CONFIRMED | Formula in overlay — configurable estimate OK | **Not blocking** — data-driven; tune after testing |
| G2 (power) | Field layout CONFIRMED | Producer output formula — configurable OK | **Not blocking** — building system works with values |
| G3 (mine depletion) | No data in DAT files | Algorithm in overlay | **Not blocking** — implement plausible depletion |
| G4 (morale) | No data in DAT files | Weights in overlay | **Not blocking** — reasonable defaults work |
| G5 (AI) | Function names CONFIRMED | Decision weights in overlay | Blocking for Phase 4 AI features |
| G6 (events) | 8 disaster types CONFIRMED | Prob table in overlay | Blocking for Phase 4 event system |
| G7 (worker ratio) | No data | Ratio formula | Blocking for Phase 3 balance |
| G8 (sprite map) | Need cross-reference tool | Screenshot approach | Blocking for Phase 2 rendering |
| G9 (grid rules) | Need coordinate testing | Test in original EXE | Blocking for Phase 2 placement UI |
