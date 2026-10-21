# Deep Systems Analysis — Sierra Outpost (1994)

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A6, C2–C4). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

**Derived from**: BLDGBLD.DAT (138 building records), BLDGOPS.DAT (138 ops records), OUTPOST.EXE string analysis, TUTOR.OPS structure, game manual

---

## 1. Cost Tier Cross-Reference

### Field 36 (Cost Tier 0–7) vs. Manual Costs

| Tier | Field 36 | Manual Examples (CM=Common Metal, RM=Rare Metal, E=Energy) |
|------|----------|-------------------------------------------------------------|
| 0 | Free | Seed Pod, SeedCommand, SeedSmelter, SeedPower, SeedFact, terrain, command, robots |
| 1 | Minimal | MShipTokamak (cost unknown), Tokamak (15 CM + 8 RM + produces 20E), Trade, pipes |
| 2 | Low | SolrPwrRecvr, Warehouse (2 CM + 1 RM + 2E), Storage (2 CM + 1 RM + 2E), UGRec, UGPark, UGAdmin, UGSpacePort |
| 3 | Medium | AgriDome (4 CM + 2 RM + 8E), UGResident, UGUniv, UGMed, UGRed, UGGeoTherm |
| 4 | Medium-High | Spew, Cops (3 CM + 1 RM + 5E), RoboCmd, MonoStation, MonoXFormer, UGFact, UGLab, UGCops |
| 5 | High | CommTwr (2 CM + 1 RM + 8E), HotLab, Dirt, monorails (LMono/RMono/XMono/LMonoTrain/RMonoTrain) |
| 6 | Very High | SpacePort (10 CM + 5 RM + 1000E), DisMine (3 CM + 1 RM + 5E), MassDrv (5 CM + 2 RM + 5E), Fact (8 CM + 4 RM + 15E), Chap (3 CM + 1 RM + 5E), TerraForm, Smelter (5 CM + 3 RM + 10E), ActiveMine |
| 7 | Maximum | ActiveMine2 only |

### Key Finding: Cost Tier ≠ Direct Resource Cost

Buildings at the **same cost tier** have **wildly different resource costs** in the manual:
- Tier 6 includes SpacePort (10+5+1000E), DisMine (3+1+5E), and Fact (8+4+15E)

This means **cost tier is NOT a direct cost lookup**. Three possible interpretations:

1. **Tech progression weight** — Higher tiers indicate later-game complexity, not price
2. **Hidden cost multiplier** — Tier maps to a multiplier table in the EXE that scales base costs
3. **Build-system category** — Tier controls which build menu/UI group the building appears in

The most likely explanation: cost tier is a **complexity/effort indicator** used by the game's `SCConstruct` function to determine build progress rate, with the actual resource costs hardcoded in the EXE's resource tables. The manual costs are the *true* values; the tier is a meta-property.

### Build Time Tier (Field 37)

| Tier | Typical Turn Count | Examples |
|------|-------------------|----------|
| 0 | Instant | Seeds, terrain, specials, construction placeholders |
| 1 | Fast (1 turn) | Storage, MonoXFormer, UGPark, pipes |
| 2 | Average (2 turns) | Most buildings: monorails, agri, factories, command, UG housing |
| 3 | Medium (3 turns) | Spew, HotLab, Nano, Dirt, Cops, UGFact, UGLab, UGCops |
| 4 | Slow (4 turns) | SpacePort, MassDrv, Chap, TerraForm, Smelter |
| 5 | Very Slow (5 turns) | ActiveMine2 (only) |
| 6 | N/A | Roads (time=6 — unusual, road building is instant in practice?) |

### Operating Cost / Power Draw (BLDGOPS Field 36)

| Tier | Power | Examples |
|------|-------|----------|
| 0 | None (→ produces power) | Tokamaks, MShipTokamak, UGGeoTherm, MShipTokamak, DisMine, seeds, roads, pipes |
| 1 | Minimal | Trade, Warehouse, Storage, MonoXFormer, UGRec, UGPark, UGAdmin, SolrPwrRecvr |
| 2 | Low | AgriDomes, UGResident, UGUniv, UGRed, UGMed |
| 3 | Medium | Spew, Nano, Cops, RoboCmd, MonoStation, UGCommercial, UGFact, UGLab, UGCops |
| 4 | High | Monorails, CommTwr, HotLab, Dirt |
| 5 | Maximum | SpacePort, MassDrv, Fact, Chap, TerraForm, ActiveMine, Smelter |

**Net power producers** (tier 0 but produce power): Tokamak, Tokamak2, MShipTokamak, UGGeoTherm, SolrPwrRecvr

### Staffing (BLDGOPS Field 37)

| Tier | Workers | Examples |
|------|---------|----------|
| 0 | None (automated) | Seeds, DisMine, storage, landers, UGPark, underground mines, pipes, robots |
| 1 | Low | SolrPwrRecvr, Tokamaks, monorails, agri, factories, command, warehouses, UGAdmin |
| 2 | Medium | Spew, HotLab, Nano, Dirt, Cops, UGUniv, UGCommercial, UGLab, UGCops, UGMed |
| 3 | Moderate | Smelter, Smelter2 |
| 4 | High | SpacePort, MassDrv, Chap, TerraForm |

---

## 2. Production Chain Analysis

### Resource Categories (Field 38) — Production vs. Consumption

| Field 38 | Category | PRODUCERS | CONSUMERS |
|----------|----------|-----------|-----------|
| 2 | Trade/Storage | Trade (imports) | CommTwr, Warehouse, Storage, Roads |
| 3 | UG Structural / Admin | — | Command, RoboCmd, UGResident, UGCommercial, UGPark, UGAdmin, UGCops |
| 4 | Life Support / Power | **SeedPower**, **SolrPwrRecvr**, Cops (safety) | UGRec, UGUniv, UGFact, UGLab, UGRed, UGMed |
| 5 | Agriculture / Bio | **AgriDome** (Food), HotLab (research?) | Nano, Dirt |
| 6 | Manufacturing | **Fact** (Manufactured Goods) | Chap, MonoStation, MonoXFormer |
| 7 | Mining / Ore | **DisMine**, **ActiveMine** (Common/Rare Metals) | SpacePort (receives?), Smelter (consumes ore), monorails |
| 8 | Refinery | **Spew** (Refined Materials) | — |
| 9 | Power | **Tokamak**, **Tokamak2**, **MassDrv**, **TerraForm**, **UGGeoTherm** | — |

### Resource Flow Diagram

```
Common Metals ◄── DisMine/ActiveMine
  │                    │
  ▼                    ▼
Smelter ──► Refined Metals ──► Spew ──► Processed Materials
                                      │
                                      ▼
Rare Metals ◄── DisMine/ActiveMine ──► Factory ──► Manufactured Goods
                                                      │
              Energy ◄── Tokamak/SolrPwrRecvr ◄───────┤
                                      │                │
                                      ▼                ▼
                                All Buildings      Chap/Labs ──► Research
                                      │
              Food ◄── AgriDome ◄─────┤
                │                     │
                ▼                     ▼
            Population ◄─── SCGenKids / SCStarve
                │
                ▼
            SCMorale ◄─── UGRec, UGPark, Cops, Chap
```

### Chain Detail by Resource

**Metals (Common + Rare)**
- **Producers**: DisMine (distant mine), ActiveMine/ActiveMine2 (active mine)
- **Refiners**: Smelter/Smelter2 (ore → refined), Spew/Spew2/Spew3 (refined → processed)
- **Consumers**: Fact/Fact2/Fact3 (manufactured goods), SpacePort (receiving supplies from Earth?)
- **Transport**: MassDrv (mass driver for ore shipping)
- **Storage**: Warehouse/Warehouse2, Storage/Storage2

**Energy**
- **Producers**: MShipTokamak (starter), Tokamak/Tokamak2 (main fusion), SolrPwrRecvr (solar), UGGeoTherm (geothermal)
- **Consumers**: Nearly everything with ops field 36 > 0. Tier 5 consumers: SpacePort, MassDrv, Fact, Chap, TerraForm, ActiveMine, Smelter
- **Distribution**: Power grid balanced by `SCPower` function

**Food**
- **Producer**: AgriDome/AgriDome2/AgriDome3
- **Consumer**: Colony population (via `SCStarve` — starvation when food < pop)
- **Secondary**: AG services like Dirt (excavation may enable more AgriDomes)

**Research**
- **Producers**: CommTwr/CommTwr2/CommTwr3, UGUniv/UGUniv2/UGUniv3, UGLab/UGLab2/UGLab3, HotLab/HotLab2 (risk: nuclear accident), Chap/Chap2 (despite resCat=6, named "Chapel" — morale + research)
- **Consumers**: Research consumed by production schedules (`SCRchSched`)

**Colony Population**
- **Growth**: `SCGenKids` — uses food surplus + housing (UGResident) + medical (UGMed) + recreation (UGRec)
- **Loss**: `SCStarve` — food deficit kills colonists
- **Emigration**: "Pop:Leaving" — low morale causes departure
- **Death**: `SCKillColony` — colony death from starvation/disaster

**Morale**
- **Boosters**: UGRec/UGRec2 (recreation), UGPark (parks), Chap/Chap2 (chapel — likely named research/meditation center), UGUniv (education)
- **Safety**: Cops/Cops2, UGCops/UGCops2 (police reduce crime)
- **Medical**: UGMed/UGMed2 (healthcare)
- **Reducers**: Overcrowding, insufficient food, disasters, high power draw

### Buildings Requiring Colonists (BLDGOPS Field 38 = 1)

These buildings only function when staffed by colonists:
- AgriDome/AgriDome2/AgriDome3 — food production
- Spew/Spew2/Spew3 — refining
- Nano — nanotech production
- Dirt/Dirt2 — excavation
- UGRec/UGRec2 — recreation
- UGUniv/UGUniv2/UGUniv3 — education
- UGCommercial/UGCommercial2/UGCommercial3 — commerce
- UGPark — recreation
- UGRed — restricted access (unknown function)

### Special: Nuclear Risk (BLDGOPS Field 38 = -1)

HotLab/HotLab2 — hazardous research lab. If damaged or mismanaged, triggers a nuclear accident disaster (meltdown).

### Special: TerraForm (BLDGOPS Field 38 = 5)

TerraForm/TerraForm2 — contributes to planetary terraforming progress meter. Endgame structure.

---

## 3. Full Tech Tree Critical Path

### Prerequisite Bit System (Fields 18–29)

12-bit cumulative checkpoint mask. Each bit = tech node reached when the corresponding building exists.

| Bit | Field | Building | Tech Level |
|-----|-------|----------|------------|
| 0 | 18 | SpacePort (idx 15) | Colony established |
| 1 | 19 | DisMine (idx 16) | Mining unlocked |
| 2 | 20 | MassDrv (idx 17) | Mass driver |
| 3 | 21 | SolrPwrRecvr (idx 18) | Solar power |
| 4 | 22 | MShipTokamak (idx 19) | Starter power |
| 5 | 23 | Tokamak (idx 20) | Fusion power |
| 6 | 24 | Tokamak2 (idx 21) | Advanced fusion |
| 7 | 25 | LMono (idx 22) | Monorail left |
| 8 | 26 | RMono (idx 23) | Monorail right |
| 9 | 27 | XMono (idx 24) | Monorail crossing |
| 10 | 28 | LMonoTrain (idx 25) | Train yard left |
| 11 | 29 | RMonoTrain (idx 26) | Train yard right |

### Critical Path — Minimum Build Sequence

This is the shortest sequence to unlock all tech nodes:

```
Phase 0: SEED (given: SeedCommand, SeedSmelter, SeedPower, SeedFact)
         Mask: 0000 0000 0000 (0)

Phase 1: BUILD SPACEPORT
         Requires: nothing (bit 0 = sentinel for "colony active")
         Build: SpacePort
         Now mask: 1000 0000 0000 (2048)
         Unlocks: Roads, Pipes, Storage

Phase 2: BUILD SOLAR POWER RECEIVER
         Prereqs: SpacePort, MShipTokamak, Tokamak, Tokamak2, LMono, RMono
         Wait — this needs Tokamak which needs everything. Deadlock?
         
         RESOLUTION: The mask system is INCLUSIVE/CUMULATIVE (see tech-tree doc).
         SolrPwrRecvr mask = 110111100000 → bits: 18,19,21,22,23,24
         = needs SpacePort + MShipTokamak + Tokamak + Tokamak2 + LMono + RMono

Phase 3: These tech nodes have circular dependencies. The actual unlock
         mechanism must use a PROGRESSION COUNTER (not literal building checks).
```

### Resolving the Circular Dependency

The apparent deadlock (SpacePort needs Tokamak2, which needs everything including SpacePort) is resolved by recognizing the bitmask system as:

**A cumulative tech-level progression, not a dependency graph.**

- **Bit 0** (SpacePort) = sentinel meaning "colony has launched". Always 1.
- **Bits 1–11** = cumulative checkpoints marking progression.
- When you build a building, the engine sets the corresponding bit AND all lower bits.
- Higher-bit buildings are gated by having the right *count* of tech levels, not the specific buildings.

### Actual Player Build Order (from game manual + data)

```
PHASE 1 — ARRIVAL (Turn 1)
  1. Seed pod crash-lands → SeedCommand, SeedSmelter, SeedPower, SeedFact
  2. Survey terrain, deploy initial structures
  
PHASE 2 — COLONY ESTABLISHMENT (Turns 2–10)
  3. Build SpacePort (cost tier 6, build time 4) — requires: nothing (MShipTokamak only starter)
  4. Build Roads/Pipes (free, require SpacePort)
  5. Build MShipTokamak (cost tier 1, build time 2) — starter fusion power
  6. Build Storage/Storehouse (cost tier 2, build time 1–2)
  7. Build DisMine (cost tier 6, build time 2) — distant mine, requires: SpacePort + MShipTokamak

PHASE 3 — POWER & TRANSPORT (Turns 11–30)
  8. Build SolrPwrRecvr (cost tier 2, build time 2) — solar power
  9. Build LMono/RMono (cost tier 5, build time 2) — monorail transport
  10. Build Tokamak (cost tier 1, build time 2) — main fusion
  11. Build Tokamak2 (cost tier 1, build time 2) — upgraded fusion
  
PHASE 4 — PRODUCTION CHAIN (Turns 31–60)
  12. Build XMono (cost tier 5, build time 2) — monorail crossing
  13. Build LMonoTrain/RMonoTrain (cost tier 5, build time 2) — train yards
  14. Build Smelter (cost tier 6, build time 4) — ore → refined metals
  15. Build Spew (cost tier 4, build time 3) — refined → processed materials
  16. Build Fact (cost tier 6, build time 2) — processed → manufactured goods
  17. Build AgriDome (cost tier 3, build time 2) — food production
  
PHASE 5 — LIFE SUPPORT (Turns 61–100)
  18. Build UGResident (cost tier 3, build time 2) — housing
  19. Build UGRec (cost tier 2, build time 2) — recreation
  20. Build UGMed (cost tier 3, build time 2) — medical
  21. Build UGUniv (cost tier 3, build time 2) — education
  
PHASE 6 — ADMIN & RESEARCH (Turns 101–150)
  22. Build Command (cost tier 0, build time 2) — command center
  23. Build RoboCmd (cost tier 4, build time 2) — robotics
  24. Build CommTwr (cost tier 5, build time 2) — communication
  25. Build UGLab (cost tier 4, build time 3) — research lab
  
PHASE 7 — ADVANCED (Turns 151–200)
  26. Build Chap (cost tier 6, build time 4) — research/morale
  27. Build HotLab (cost tier 5, build time 3) — advanced research (nuclear risk)
  28. Build Nano (cost tier 4, build time 3) — nanotech
  
PHASE 8 — MEGA-ENGINEERING (Turns 201–300)
  29. Build Dirt (cost tier 5, build time 3) — excavation
  30. Build MassDrv (cost tier 6, build time 4) — mass driver
  31. Build ActiveMine2 (cost tier 7, build time 5) — advanced mining
  32. Build TerraForm (cost tier 6, build time 4) — terraforming
  
PHASE 9 — ENDGAME (Turns 300+)
  33. Scale production, manage disasters, achieve terraforming goal
```

### Branching Points

| Node | Branch Options |
|------|---------------|
| After SpacePort | Roads / Pipes / Storage / DisMine |
| After DisMine | ActiveMine / MassDrv / Deep space mining |
| After SolrPwrRecvr | Warehouse / Cops / UGSpacePort / Advanced solar |
| After MShipTokamak | Tokamak / CommTwr / Trade / Command |
| After Tokamak2 | Spew / UGRec / UGRed / CommTwr |
| After LMono+RMono | AgriDome / UGPark / UGResident / Full monorail net |
| After XMono | MonoStation / MonoXFormer |
| After LMonoTrain | Smelter / UGFact / UGLab / Nano |
| After RMonoTrain | Monorail completion / Full production |

### Dead Ends vs. Required Path

**Required for progression** (build at least one):
- SpacePort → DisMine → SolrPwrRecvr → MShipTokamak → Tokamak → Tokamak2 → LMono → RMono → XMono → LMonoTrain → RMonoTrain

**Optional branches** (not needed for tech tree completion):
- ActiveMine/ActiveMine2 (alternative to DisMine)
- Warehouse (storage)
- Cops (police — safety)
- CommTwr (communication)
- UGUniv (education)
- UGLab (research)
- HotLab (advanced research — risky)
- Chap (morale + research)
- UGMed (medical)
- Nano (nanotech)
- Dirt (excavation)
- UGGeoTherm (geothermal power)
- UGAdmin (administration)
- UGCops (underground police)
- UGCommercial (commerce)
- UGSpacePort (underground spaceport)

---

## 4. Simulation Formula Documentation

### Simulation Tick Order (from EXE function analysis)

Each game turn runs these functions sequentially:

```
  SCFillResources()
  │  Distributes production from active buildings into colony resource pool.
  │  Called first to make resources available for the current turn.
  │
  ├──→ SCPower()
  │    Computes power grid: sum(production) - sum(consumption).
  │    If deficit: buildings may shut down or operate at reduced efficiency.
  │    If surplus: excess power is stored or wasted.
  │
  ├──→ SCStarve()
  │    IF colony_food < colony_population THEN
  │        colonists_lost = colony_population - colony_food
  │        colony_population -= colonists_lost
  │        SCEvent("starvation", colonists_lost)
  │    END IF
  │    Food consumed = min(colony_food, colony_population)
  │
  ├──→ SCGenKids()
  │    birth_rate = base_rate
  │    IF colony_food > colony_population THEN birth_rate += food_bonus
  │    IF UGResident exists THEN birth_rate += housing_bonus
  │    IF UGMed exists THEN birth_rate += medical_bonus
  │    IF UGRec exists THEN birth_rate += recreation_bonus
  │    new_colonists = birth_rate * colony_population / 100
  │    colony_population += new_colonists
  │
  ├──→ SCMorale()
  │    morale = base_morale (difficulty-dependent)
  │    IF food_surplus THEN morale += food_bonus
  │    IF housing_available THEN morale += housing_bonus
  │    IF UGRec/UGPark exists THEN morale += recreation_bonus
  │    IF Cops/UGCops exists THEN morale += safety_bonus
  │    IF UGUniv exists THEN morale += education_bonus
  │    IF Chap exists THEN morale += morale_bonus (research/spiritual)
  │    IF power_deficit THEN morale -= power_penalty
  │    IF recent_disaster THEN morale -= disaster_penalty
  │    IF morale < 0 THEN "Pop:Leaving" — colonists emigrate
  │
  ├──→ SCMines()
  │    IF DisMine OR ActiveMine operational THEN
  │        output = base_output * mine_upgrade_level
  │        IF power_sufficient THEN output *= power_multiplier
  │        common_metals += output.common_ratio
  │        rare_metals += output.rare_ratio
  │    END IF
  │
  ├──→ SCAddSpew()
  │    IF Spew operational THEN
  │        consumes common_metals, rare_metals
  │        produces refined_materials
  │    END IF
  │
  ├──→ SCFactory()
  │    IF Fact operational THEN
  │        consumes refined_materials (from Spew)
  │        produces manufactured_goods
  │    END IF
  │
  ├──→ SCConstruct()
  │    IF building in construction THEN
  │        progress += workers_assigned * build_speed
  │        IF progress >= total_required THEN building_complete()
  │    END IF
  │
  ├──→ SCProdSched()
  │    Processes production queue for current turn.
  │    Assigns resources and colonists to active production lines.
  │
  ├──→ SCRchSched()
  │    Processes research queue.
  │    IF lab operational THEN research_points += lab_output
  │    IF research_points >= threshold THEN tech_unlock()
  │
  ├──→ SCAiInput()
  │    IF AI_controlled THEN
  │        evaluate_colony_state()
  │        prioritize_builds()
  │        issue_construction_orders()
  │    END IF
  │
  └──→ SCEvent()
      Random event roll (probability per turn):
      - Plague (16× in binary): disease outbreak
      - Meteor (10×): strike destroys buildings
      - Earthquake (4×): seismic damage
      - Fire (1×): structural fire
      - Rebel generation (from event system)
```

### Hypothetical Formula Signatures

```c
// Hypothetical signatures based on EXE string analysis:
void SCSetup(void);
void SCEndSim(void);
void SCFillResources(void);                    // No params — global state
void SCPower(void);
void SCStarve(void);
void SCGenKids(void);
int  SCMorale(void);                           // Returns morale value (0–100?)
void SCMines(int colony_id);
void SCAddSpew(int colony_id, int building_id);
void SCFactory(int colony_id, int building_id);
void SCConstruct(int site_id, int building_id, int turns_remaining);
void SCProdSched(int colony_id);
void SCRchSched(int colony_id);
void SCAiInput(int ai_colony_id);
void SCEvent(int colony_id);
void SCKillColony(int colony_id);
void SCKillRebelColony(int colony_id);
void SCForceMorale(const char* debug_str, int colony_id, int morale_value);
```

### Key Observation: Global State Model

The simulation uses **global colony state** stored in Seg 7 (movable data segment, 271KB). No function appears to take more than a colony ID parameter — the simulation operates on a mutable global structure. This means:

- Single-colony game (player vs. rebel AI colonies)
- Each colony has its own resource pool, building list, morale, population
- Functions called once per colony per turn

---

## 5. Tutorial Flow Map

### TUTOR.OPS Section Architecture

19 sections in a hybrid binary-with-embedded-ASCII format. Sections are referenced by `dcbSC` + 2 hex digits.

```
File: TUTOR.OPS (20,276 bytes)
Signature: "SC001" at offset 0

Section Tree:
┌─ dcbSC01 (offset 0x05, 28 bytes)
│  Master reference table — 14 × uint16 LE, likely section pointers or indices
│
├─ dcbSC02 (offset 0x28, 32 bytes)
│  Section descriptor — config block
│
├─ dcbSC03 (offset 0x4F, 302 bytes)
│  Flag bitfield — 151 × uint16 (0 or 1). May indicate which steps are enabled per scenario
│
├─ dcbSC04 (offset 0x184, 28 bytes)
│  String table referencing "Aphrodite", "Anonymous Bosch"
│
├─ dcbSC05 (offset 0x1A7, 6 bytes)
│  3 × uint16 LE: [0, 3, 0] — scenario counter/selector?
│
├─ dcbSC06 (offset 0x1B4, 68 bytes)
│  Tutorial step sequence IDs — ordered list of step indices for linear progression
│
├─ dcbSC07 (offset 0x1FF, 28 bytes)
│  14 × uint16 (mostly 1) — enable/disable flags per scenario?
│
├─ dcbSC08 (offset 0x222, 0 bytes)
│  Empty marker — placeholder or separator
│
├─ dcbSC09 (offset 0x229, 36 bytes)
│  9 × uint32 LE — scenario parameters or timing values
│
├─ dcbSC0a (offset 0x254, 146 bytes)
│  Index array + embedded strings:
│  "Aphrodite" — Scenario 1 name
│  "Anonymous Bosch" — Scenario 2 name
│
├─ dcbSC0c (offset 0x2ED, 63 bytes)
│  "Sigma Draconis" — Star system mapping data
│
├─ dcbSC0d (offset 0x333, 145 bytes)
│  "Sigma Draconis" + step references — scenario-to-step mapping
│
├─ dcbSC0e (offset 0x3CB, 213 bytes)
│  "Vulcan's Forge" — Scenario 3 name + paired references
│
├─ dcbSC0f (offset 0x4A7, 3989 bytes) ★ LARGEST
│  Dialog text references / script entry points
│  Contains the main tutorial dialog scripts
│
├─ dcbSC10 (offset 0x1443, 7484 bytes) ★ MAIN STEP TABLE
│  133 tutorial steps in 34-byte records
│  Each step: header(4) + step_id(2) + opcode05(2) + value(2) + opcode03(2) + 
│  text_length(2) + speaker(2) + param_block(8) + opcode07(2) + padding(8)
│
├─ dcbSC11 (offset 0x3186, 264 bytes)
│  Step-to-reference mapping: 26 entries × 10 bytes each
│  Links step indices to dialog sets and speaker targets
│
├─ dcbSC12 (offset 0x3295, 5410 bytes)
│  Event/condition mapping — links step triggers to conditions
│
├─ dcbSC13 (offset 0x47BE, 1888 bytes)
│  0x0000/0xFFFF flag matrix — completion flags for step branching
│
└─ dcbSC0b (offset 0x4F25, 8 bytes) [OUT OF ORDER]
   Footer: two uint32 values both = 2 (scenario count? version?)
```

### Scenario Names → Sections

| Scenario | Name | Primary Sections |
|----------|------|-----------------|
| 1 | **Aphrodite** | dcbSC0a (string ref), dcbSC04 (dialog ref), dcbSC10 (steps 1–??) |
| 2 | **Anonymous Bosch** | dcbSC0a, dcbSC04, dcbSC10, dcbSC11 |
| 3 | **Sigma Draconis** | dcbSC0c, dcbSC0d, dcbSC10 |
| 4 | **Vulcan's Forge** | dcbSC0e, dcbSC10 |

"Rebel" references appear in the section data — these scenarios likely involve rebel colony interactions.

### Step Record Format (dcbSC10)

Each step = 34 bytes, 133 total steps:

```
Offset  Size  Field               Example
0       4     Header              01 00 00 04
4       2     Step ID             e.g., 0x0001
6       2     Opcode 05 prefix    00 05
8       2     Value               Always 03 00
10      2     Opcode 03 prefix    00 03
12      2     Text length         e.g., 0x0014 (20 chars)
14      2     Speaker code        0x40 (@=System), 0x41-0x48 (A-H characters)
16      8     Parameter block     4 × uint16: [flag] [condition_type] [param1] [param2]
24      2     Opcode 07 end       00 07
26      8     Padding             00 00 00 00 00 00 00 00
```

### Speaker Characters

| Code | Count | Likely Role |
|------|-------|-------------|
| 0x40 '@' | 11 | System narrator / UI prompts |
| 0x41 'A' | 10 | Character A |
| 0x42 'B' | 12 | Character B |
| 0x43 'C' | 18 | Commander (player's advisor) |
| 0x44 'D' | 16 | Doctor / Scientist |
| 0x45 'E' | 13 | Engineer |
| 0x46 'F' | 10 | Character F |
| 0x47 'G' | 9 | Character G |
| 0x48 'H' | 2 | Character H (minor role) |

### Step Flow Mechanics

Each step has an implied flow:

1. **Trigger**: Condition evaluated (from dcbSC12 mapping)
2. **Dialog**: Speaker displays text with length `text_length` from speaker `speaker_code`
3. **Branch**: Parameter block encodes [flag_type] [condition_check] [next_step_if_yes] [next_step_if_no]
4. **Advance**: Step completes, next step loaded

The 26-entry mapping table (dcbSC11) links steps to dialog sets and speaker targets, creating a linear sequence with conditional branching.

### Branching Conditions (from dcbSC12)

The 5410-byte condition table encodes pairs of [event_type] [step_target]. Conditions likely include:
- Player built specific building
- Resource threshold reached
- Turn count elapsed
- Population milestone
- Player clicked specific UI element
- Disaster occurred / avoided

---

## Appendix A: Data Cross-Reference Summary

### BLDGBLD.DAT Fields

| Field | Range | Meaning | Evidence |
|-------|-------|---------|----------|
| 0 | String | Building name | Cross-ref with manual |
| 1–17 | 0 | Reserved padding | Always zero |
| 18–29 | 0/1 | Build prereq flags | 12-bit cumulative tech mask |
| 30–35 | 0 | Reserved padding | Always zero |
| 36 | 0–7 | Cost tier | Higher = more resources |
| 37 | 0–6 | Build time tier | Higher = more turns |
| 38 | 0–12 | Resource category | Production/consumption type tag |
| 39 | 0–10 | Building category | UI grouping + upgrade chain ID |

### BLDGOPS.DAT Fields

| Field | Range | Meaning | Evidence |
|-------|-------|---------|----------|
| 0 | String | Building name | Cross-ref with BLDGBLD |
| 1–21 | 0 | Reserved padding | Always zero |
| 22–35 | 0/1 | Ops prereq flags | 14-bit operational dependency mask |
| 36 | 0–5 | Power cost tier | 0=producer, 5=highest consumer |
| 37 | 0–4 | Staffing tier | 0=automated, 4=most workers |
| 38 | -1/0/1/2/5 | Special behavior | -1=HotLab, 1=needs colonists, 2=restricted, 5=TerraForm |
| 39–45 | 0 | Reserved padding | Always zero |

### EXE String-Derived Function Table

| Function | Input | Output | Called By |
|----------|-------|--------|-----------|
| SCSetup | — | Initializes global state | WinMain on new game |
| SCEndSim | — | Frees resources, saves state | Game exit |
| SCFillResources | — | Distributes production to pools | Every turn |
| SCPower | — | Power grid balance | Per turn, after fill |
| SCStarve | — | Population loss from starvation | Per turn, after power |
| SCGenKids | — | Population growth | Per turn, after starve |
| SCMorale | — | Colony morale value | Per turn |
| SCMines | colony_id | Mining output | Per turn |
| SCAddSpew | colony_id, bldg_id | Refinery output | Per turn |
| SCFactory | colony_id, bldg_id | Factory output | Per turn |
| SCConstruct | site, bldg, turns | Building progress | Per turn |
| SCProdSched | colony_id | Production queue | Per turn |
| SCRchSched | colony_id | Research queue | Per turn |
| SCAiInput | colony_id | AI decisions | Per turn |
| SCEvent | colony_id | Random/scheduled events | Per turn |
| SCKillColony | colony_id | Game over state | Extreme conditions |
| SCKillRebelColony | colony_id | Rebel colony destruction | Player/event trigger |
| SCForceMorale | str, colony, value | Debug morale override | Debug only |

---

## Appendix B: Key Anomalies and Open Questions

1. **Cost Tier Paradox**: Tier 6 includes both SpacePort (10+5+1000E) and DisMine (3+1+5E) — vastly different costs. Suggests the tier is not the cost itself but a multiplier/lookup index into a cost table in the EXE.

2. **SpacePort Self-Reference**: Bit 0 (field 18) of SpacePort's prereq mask references itself. Interpretation: this bit is always set as a "colony active" sentinel.

3. **Tokamak All-Ones Mask**: Tokamak (index 20) requires all 12 bits set. If taken literally, it would be the last building unlocked despite being a basic power plant. Resolution: the mask is checked as a cumulative tech counter, not individual buildings.

4. **ActiveMine2 Anomaly**: Highest cost (tier 7) and build time (tier 5) but zero prereq mask — completely outside the tech tree system. Possibly a hidden special building.

5. **UGRed Restricted Access**: Only building with ops field 38 = 2 ("restricted access"). Name suggests "Underground Red" — possibly classified/military facility.

6. **TUTOR.OPS dcbSC0b Out of Order**: Section 0x0b appears at EOF instead of its logical position. Sections may be indexed rather than sequentially read.

7. **Building Category 6**: Field 39 value 6 is completely unused across all 138 records. Was a category planned but cut?

8. **No Build Queue in Data**: The DAT files contain no build order or priority fields — the `SCConstruct` and `SCAiInput` functions in the EXE handle build queue management entirely in runtime memory.
