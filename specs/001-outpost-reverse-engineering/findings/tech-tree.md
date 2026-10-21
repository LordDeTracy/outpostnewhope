# Outpost (1994) Building Tech Tree

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items C2–C4). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

> Reconstructed from `BLDGBLD.DAT` (12,403 bytes) and `BLDGOPS.DAT` (14,049 bytes)
> Both files are XOR 0x80 encoded CSVs with 138 records (indices 0–137)

---

## 1. Data Source & Encoding

- **BLDGBLD.DAT**: 40 fields per record (indices 0–39)
- **BLDGOPS.DAT**: 46 fields per record (indices 0–45)
- **Encoding**: Raw bytes XOR'd with `0x80`, CR+LF (`0x0D 0x0A`) record terminators, comma-separated fields, quoted strings
- **Decoded files**: `tools/bldgbld-decoded.csv`, `tools/bldgops-decoded.csv`
- **Master data**: `tools/decoded-building-data.csv`

### Field Map — BLDGBLD.DAT

| Field(s) | Meaning |
|----------|---------|
| 0 | Building name (string) |
| 1–17 | Padding/reserved (always 0) |
| 18–29 | **Prerequisite flags** (12 bits) — see §2 |
| 30–35 | Reserved (always 0) |
| 36 | **Cost tier** (0–7) |
| 37 | **Build time / worker tier** (0–5) |
| 38 | **Resource category** (0–12) |
| 39 | **Building category / upgrade level** (0–10) |

### Field Map — BLDGOPS.DAT

| Field(s) | Meaning |
|----------|---------|
| 0 | Building name (matches BLDGBLD) |
| 1–21 | Padding/reserved (always 0) |
| 22–35 | **Operational prerequisite flags** (14 bits) — see §3 |
| 36 | **Operating cost / power tier** (0–5) |
| 37 | **Maintenance / staffing tier** (0–4) |
| 38 | **Special flag** (−1, 0, 1, 2, 5) |
| 39–45 | Reserved (always 0) |

---

## 2. Prerequisite Bitmask (BLDGBLD Fields 18–29)

The 12 bits in fields 18–29 represent a **tech-level checkpoint system**. Each bit corresponds to a specific building whose construction unlocks that tech level. A building's bitmask specifies which tech levels must be reached before it can be constructed.

### Mapping: Field N → Building Index (N − 3)

| Bit | Field | Building Index | Building Name |
|-----|-------|---------------|---------------|
| 0 (LSB) | 18 | 15 | SpacePort |
| 1 | 19 | 16 | DisMine |
| 2 | 20 | 17 | MassDrv |
| 3 | 21 | 18 | SolrPwrRecvr |
| 4 | 22 | 19 | MShipTokamak |
| 5 | 23 | 20 | Tokamak |
| 6 | 24 | 21 | Tokamak2 |
| 7 | 25 | 22 | LMono |
| 8 | 26 | 23 | RMono |
| 9 | 27 | 24 | XMono |
| 10 | 28 | 25 | LMonoTrain |
| 11 (MSB) | 29 | 26 | RMonoTrain |

### Progression Tree

The 12 tech nodes form a linear progression where each node unlocks after the previous:

```
SpacePort(15) → DisMine(16) → MassDrv(17) → SolrPwrRecvr(18) →
MShipTokamak(19) → Tokamak(20) → Tokamak2(21) → LMono(22) →
RMono(23) → XMono(24) → LMonoTrain(25) → RMonoTrain(26)
```

### Bitmask Values by Building

Mask bits are shown left-to-right: bit0 (field18) to bit11 (field29).

| Mask (binary) | Base-10 | Buildings using this mask | Tech level |
|---|---|---|---|
| `000000000000` | 0 | Seeds, terrain, special types — no prereqs | Entry |
| `100000000000` | 2048 | Roads, Pipes | After SpacePort |
| `100000100000` | 2080 | DisMine, ActiveMine | +Tokamak2 |
| `100000111000` | 2088 | AgriDome 1/2/3, UGPark | +LMono,RMono |
| `100011111000` | 2296 | UGFact, UGFact2 | Higher tier |
| `100100100000` | 2336 | Warehouse 1/2, UGSpacePort | +SolrPwrRecvr |
| `100100111000` | 2360 | SpacePort (self) | Baseline node |
| `100110000000` | 2432 | UGRed | +DisMine,SolrPwrRecvr |
| `101001100000` | 2656 | CommTwr 1/2/3 | +MassDrv,Tokamak |
| `101010110000` | 2736 | Trade, Command, RoboCmd 1/2, UGAdmin | +MShipTokamak |
| `101100111000` | 2872 | Spew 1/2/3 | +SolrPwrRecvr,LMono,RMono |
| `101110101000` | 2984 | Chap 1/2 | +DisMine,MShipTokamak,RMono |
| `101110111000` | 3000 | UGRec 1/2 | +LMono,RMono |
| `110000000000` | 3072 | Storage 1/2 | After DisMine |
| `110000101000` | 3112 | UGResident 1/2/3 | +LMono,RMono |
| `110100100000` | 3360 | Cops 1/2, UGCommercial 1/2/3, UGCops 1/2 | +SolrPwrRecvr |
| `110111100000` | 3552 | SolrPwrRecvr | +MShipTokamak,Tokamak |
| `110111111000` | 3576 | Nano | +LMono,RMono |
| `111001111000` | 3704 | UGUniv 1/2/3, UGMed 1/2 | +LMono,RMono |
| `111100111000` | 3896 | Mono rails, Smelter 1/2, MonoStation, MonoXFormer, UGGeoTherm | +MassDrv,SolrPwrRecvr |
| `111110110000` | 4016 | Dirt 1/2 | +DisMine,MassDrv,SolrPwrRecvr,MShipTokamak,Tokamak |
| `111111111000` | 4088 | TerraForm 1/2, UGLab 1/2/3 | All except mono trains |
| `111111111010` | 4090 | MassDrv | All except mono trains |
| `111111111100` | 4092 | Fact 1/2/3 | All except mono trains |
| `111111111110` | 4094 | HotLab 1/2 | All except RMonoTrain |
| `111111111111` | 4095 | Tokamak, Tokamak2 | ALL 12 nodes |

### Key Observations

- The bitmask is **inclusive/cumulative**: setting higher bits implies all lower bits are also set (with rare exceptions like `111111111010` for MassDrv which omits XMono)
- Tokamak (`111111111111`) requires ALL 12 tech nodes — it is the most advanced structure in this progression
- Seeds and MShipTokamak have mask `000000000000` — no prerequisites (starting structures)
- The mask pattern shows the **intended game progression**: basic infrastructure → power → transport → advanced facilities

---

## 3. Operational Prerequisite Bitmask (BLDGOPS Fields 22–35)

The 14 bits in fields 22–35 control which buildings must be operational (staffed and running) for this building to function.

### Mapping: Field N → Building Index (N − 3)

| Bit | Field | Building Index | Building Name |
|-----|-------|---------------|---------------|
| 0 | 22 | 19 | MShipTokamak |
| 1 | 23 | 20 | Tokamak |
| 2 | 24 | 21 | Tokamak2 |
| 3 | 25 | 22 | LMono |
| 4 | 26 | 23 | RMono |
| 5 | 27 | 24 | XMono |
| 6 | 28 | 25 | LMonoTrain |
| 7 | 29 | 26 | RMonoTrain |
| 8 | 30 | 27 | AgriDome |
| 9 | 31 | 28 | AgriDome2 |
| 10 | 32 | 29 | AgriDome3 |
| 11 | 33 | 30 | Fact |
| 12 | 34 | 31 | Fact2 |
| 13 | 35 | 32 | Fact3 |

### Operational Prereq Masks (only buildings with non-zero masks shown)

| Mask | Buildings | Meaning |
|------|-----------|---------|
| `00000100000000` | Cops 1/2, UGCops 1/2 | Needs Tokamak2 operational |
| `00000111000000` | MShipTokamak, Tokamak, Tokamak2 | Needs Tokamak2, LMono, RMono |
| `00111000000000` | AgriDome 1/2/3, Spew 1/2/3, TerraForm 1/2, Smelter 1/2, UGFact 1/2 | Needs LMono, RMono, XMono |
| `01000000000000` | UGUniv 1/2/3, UGMed 1/2 | Needs RMonoTrain |
| `10000000000000` | MassDrv | Needs LMonoTrain |
| `10100100000000` | SpacePort | Needs LMonoTrain, RMonoTrain, XMono |
| `10101000000000` | Chap 1/2 | Needs LMonoTrain, RMonoTrain, AgriDome |
| `10110000000000` | Dirt 1/2 | Needs LMonoTrain, RMonoTrain, AgriDome2 |
| `11111000000000` | HotLab 1/2, UGLab 1/2/3 | Needs AgriDome through Fact |
| `11111100000000` | Fact 1/2/3 | Needs AgriDome through Fact3 |

### Observation

Operational prerequisites reference **different building indices** than build prerequisites. They use building indices 19–32 (MShipTokamak through Fact3) rather than 15–26 (SpacePort through RMonoTrain). This means the ops system checks whether power infrastructure and production chains are running.

---

## 4. Upgrade Chains

Buildings with numbered suffixes (e.g., Fact → Fact2 → Fact3) form upgrade paths. Each tier has identical cost/build/ops parameters but yields increased output.

| Chain | Variants | Cost Tier | Build Tier | Ops Cost | Maint | Category |
|-------|----------|-----------|------------|----------|-------|----------|
| **Factory** | Fact, Fact2, Fact3 | 6 | 2 | 5 | 1 | 8 |
| **Agriculture** | AgriDome, AgriDome2, AgriDome3 | 3 | 2 | 2 | 1 | 5 |
| **Spew (Refinery)** | Spew, Spew2, Spew3 | 4 | 3 | 3 | 2 | 7 |
| **Comm Tower** | CommTwr, CommTwr2, CommTwr3 | 5 | 2 | 4 | 1 | 3 |
| **HotLab** | HotLab, HotLab2 | 5 | 3 | 4 | 2 | 5 |
| **Chap (Research)** | Chap, Chap2 | 6 | 4 | 5 | 4 | 8 |
| **TerraForm** | TerraForm, TerraForm2 | 6 | 4 | 5 | 4 | 9 |
| **Dirt (Excavation)** | Dirt, Dirt2 | 5 | 3 | 4 | 2 | 8 |
| **Cops (Police)** | Cops, Cops2 | 4 | 3 | 3 | 2 | 3 |
| **RoboCmd** | RoboCmd, RoboCmd2 | 4 | 2 | 3 | 1 | 7 |
| **Warehouse** | Warehouse, Warehouse2 | 2 | 2 | 1 | 1 | 3 |
| **Storage** | Storage, Storage2 | 2 | 1 | 1 | 0 | 2 |
| **ActiveMine** | ActiveMine, ActiveMine2 | 6,7 | 2,5 | 5 | 1 | 5 |
| **Smelter** | Smelter, Smelter2 | 6 | 4 | 5 | 3 | 8 |
| **Tokamak (Power)** | Tokamak, Tokamak2 | 1 | 2 | 0 | 1 | 10 |
| **UG Resident** | UGResident, UGResident2, UGResident3 | 3 | 2 | 2 | 1 | 2 |
| **UG Rec** | UGRec, UGRec2 | 2 | 2 | 1 | 1 | 2 |
| **UG Univ** | UGUniv, UGUniv2, UGUniv3 | 3 | 2 | 2 | 2 | 2 |
| **UG Commercial** | UGCommercial, UGCommercial2, UGCommercial3 | 4 | 2 | 3 | 2 | 2 |
| **UG Lab** | UGLab, UGLab2, UGLab3 | 4 | 3 | 3 | 2 | 2 |
| **UG Admin** | UGAdmin, UGAdmin2 | 2 | 2 | 1 | 1 | 2 |
| **UG Med** | UGMed, UGMed2 | 3 | 2 | 2 | 2 | 4 |
| **UG Cops** | UGCops, UGCops2 | 4 | 3 | 3 | 2 | 3 |

Orientation variants (same stats, different tile layout):
- LMono / RMono — left/right monorail
- LMonoTrain / RMonoTrain — left/right monorail station
- LRoad / RRoad / XRoad — road orientations
- XPipe / LPipe / RPipe — pipe orientations

---

## 5. Cost & Build Time Tier Analysis

### Cost Tiers (field 36)

| Tier | Common Value | Typical Buildings |
|------|-------------|-------------------|
| 0 | Free | Seeds, landers, command center, roads, terrain |
| 1 | Minimal | Tokamaks, pipes, trade center |
| 2 | Low | Solar receiver, warehouses, storage, UGRec, UGPark |
| 3 | Medium | AgriDomes, UGResident, UGUniv, UGMed, UGRed |
| 4 | Medium-High | Spews, Nano, Cops, RoboCmd, MonoStation, UG Commercial/Fact/Lab |
| 5 | High | Monorails, CommTwr, HotLab, Dirt |
| 6 | Very High | SpacePort, DisMine, MassDrv, Fact, Chap, TerraForm, ActiveMine, Smelter |
| 7 | Maximum | ActiveMine2 (only) |

### Build Time / Worker Tiers (field 37)

| Tier | Interpretation | Typical Buildings |
|------|----------------|-------------------|
| 0 | Instant | Seeds, landers, terrain, specials |
| 1 | Very Fast | Storage, MonoXFormer, UGPark, pipes |
| 2 | Fast | Most buildings (monorails, agri, factories, command, UG structs) |
| 3 | Medium | Spews, HotLab, Nano, Dirt, Cops, UG Fact/Lab/Cops |
| 4 | Slow | SpacePort, MassDrv, Chap, TerraForm, Smelter |
| 5 | Very Slow | ActiveMine2 (only) |

---

## 6. Building Categories (Field 39)

| Value | Designation | Buildings |
|-------|-------------|-----------|
| 0 | Terrain / Special | DisMine, Command, all construction entities, destroyed states, roads, robots, colony resources |
| 1 | Trade / Transport Core | Trade, lander types, Core, UGPark, underground mines/tokamaks, pipes |
| 2 | Underground Structures | Mono rails, Storage, MonoStation/XFormer, UGResident/Rec/Univ/Commercial/Lab/Admin |
| 3 | Surface Utility | XMono, CommTwr 1/2/3, Cops 1/2, Warehouse 1/2, UGSpacePort, UGCops |
| 4 | Underground Factory/Med | UGFact 1/2, UGMed 1/2 |
| 5 | Agriculture / Advanced | MassDrv, AgriDome 1/2/3, HotLab 1/2, Nano, ActiveMine 1/2 |
| 6 | (unused in buildable set) | — |
| 7 | Ore / Refinery | SolrPwrRecvr, Spew 1/2/3, RoboCmd 1/2 |
| 8 | Factory / Smelter | Fact 1/2/3, Chap 1/2, Dirt 1/2, Smelter 1/2 |
| 9 | TerraForm | TerraForm, TerraForm2 |
| 10 | Seed / Power | SeedCommand, SeedSmelter, SeedPower, SeedFact, SpacePort, MShipTokamak, Tokamak 1/2, UGGeoTherm |

---

## 7. Resource Categories (Field 38)

| Value | Meaning | Examples |
|-------|---------|---------|
| 0 | None / Abstract | Terrain, landers, cores, destroyed, robots, space items |
| 1 | Pipe | Pipe network variants |
| 2 | Storage | Trade, CommTwrs, warehouses, storage, roads |
| 3 | UG Structural | Command, RoboCmd, UGResident, UGCommercial, UGPark, UGAdmin, UGCops |
| 4 | Life Support | SeedPower, SolrPwrRecvr, Cops, UGRec, UGUniv, UGFact, UGLab, UGRed, UGMed |
| 5 | Agriculture | AgriDomes, HotLab, Nano, Dirt |
| 6 | Manufacturing | SeedSmelter, Fact, Chap, MonoStation, MonoXFormer |
| 7 | Mining / Ore | SpacePort, DisMine, monorails, ActiveMine, Smelter |
| 8 | Refinery | SeedFact, Spew variants |
| 9 | Power | MassDrv, Tokamaks, TerraForm, UGGeoTherm |
| 10 | Advanced | SeedCommand |
| 12 | Monorail | XMono |

---

## 8. Special Flags (BLDGOPS Field 38)

| Flag | Meaning | Affected Buildings |
|------|---------|-------------------|
| `−1` | **Nuclear accident risk** — HotLab building can melt down | HotLab, HotLab2 |
| `0` | Normal — no special behavior | Most buildings |
| `1` | **Requires colonists** — building needs population to operate | AgriDome, Spew, Nano, Dirt, UGRec, UGUniv, UGCommercial, UGPark, UGRed |
| `2` | **Restricted access** (found only on UGRed) | UGRed |
| `5` | **TerraForm module** — contributes to terraforming progress | TerraForm, TerraForm2 |

### Operational Buildings (Flag = 1)

Buildings with special flag 1 require colonists to function. These are mostly:
- Food production: AgriDome 1/2/3
- Refining: Spew 1/2/3
- Advanced: Nano
- Excavation: Dirt 1/2
- UG services: UGRec, UGUniv, UGCommercial, UGPark, UGRed

---

## 9. Operating Cost & Maintenance Tiers

### Operating Cost / Power (BLDGOPS Field 36)

| Tier | Power Draw | Buildings |
|------|------------|-----------|
| 0 | None | Seeds, DisMine, Tokamaks, Command, landers, roads, underground mines, pipes |
| 1 | Minimal | Trade, Warehouses, Storage, MonoXFormer, UGRec, UGPark, UGAdmin |
| 2 | Low | AgriDomes, UGResident, UGUniv, UGRed, UGMed |
| 3 | Medium | Spew, Nano, Cops, RoboCmd, MonoStation, UGCommercial, UGFact, UGLab, UGCops |
| 4 | High | Monorails, CommTwr, HotLab, Dirt |
| 5 | Maximum | SpacePort, MassDrv, Fact, Chap, TerraForm, ActiveMine, Smelter |

### Maintenance / Staffing (BLDGOPS Field 37)

| Tier | Staff Needed | Buildings |
|------|-------------|-----------|
| 0 | None | Seeds, DisMine, storage, landers, UGPark, underground mines, pipes |
| 1 | Low | Most standard buildings (solar, tokamaks, monorails, agri, factories, command, warehouses) |
| 2 | Medium | Spew, HotLab, Nano, Dirt, Cops, UGUniv, UGCommercial, UGLab, UGRed, UGMed, UGCops |
| 3 | Moderate | Smelter, Smelter2 |
| 4 | High | SpacePort, MassDrv, Chap, TerraForm |

---

## 10. Build Order / Tech Tree Flow

### Phase 1: Colonization (Seed → Basic Infrastructure)
1. **Seed** lander arrives — provides initial SeedCommand, SeedSmelter, SeedPower, SeedFact
2. **SpacePort (#15)** — built to receive supplies from Earth
3. **Roads** (LRoad/RRoad/XRoad) — require only SpacePort
4. **Pipes** (LPipe/RPipe/XPipe) — require only SpacePort
5. **Storage (#60, #61)** — require SpacePort + DisMine

### Phase 2: Resource Extraction
6. **DisMine (#16)** — distant mine for ore; requires SpacePort + Tokamak2 online
7. **ActiveMine (#51)** — active mine; same prereqs
8. **MassDrv (#17)** — mass driver to ship ore; requires most tech up to RMono

### Phase 3: Power
9. **SolrPwrRecvr (#18)** — solar power receiver
10. **Tokamak (#20)** — main fusion power (requires all 12 tech nodes!)
11. **Tokamak2 (#21)** — upgraded fusion power

### Phase 4: Transport
12. **LMono/RMono (#22, #23)** — monorail network
13. **XMono (#24)** — crossing monorail
14. **MonoStation (#63)** — monorail station
15. **MonoXFormer (#64)** — monorail transformer
16. **LMonoTrain/RMonoTrain (#25, #26)** — monorail train yards

### Phase 5: Production
17. **Smelter (#54)** — ore smelter; Smelter2 upgrade
18. **Spew (#35)** — refinery; Spew2/Spew3 upgrades
19. **Fact (#31)** — factory; Fact2/Fact3 upgrades

### Phase 6: Agriculture & Life Support
20. **AgriDome (#28)** — food production; AgriDome2/AgriDome3 upgrades
21. **UGPark (#91)** — recreational parks
22. **Warehouse (#59)** — storage; Warehouse2 upgrade

### Phase 7: Administration & Services
23. **Command (#56)** — command center
24. **RoboCmd (#57)** — robotics command; RoboCmd2 upgrade
25. **UGAdmin (#103)** — underground admin; UGAdmin2 upgrade
26. **Cops (#50)** — police station; Cops2 upgrade
27. **UGCops (#109)** — underground police; UGCops2 upgrade

### Phase 8: Research & Development
28. **CommTwr (#38)** — communication tower; CommTwr2/CommTwr3 upgrades
29. **UGUniv (#85)** — underground university; UGUniv2/UGUniv3 upgrades
30. **UGLab (#94)** — underground lab; UGLab2/UGLab3 upgrades
31. **HotLab (#41)** — hazardous research lab (nuclear accident risk); HotLab2 upgrade
32. **UGMed (#105)** — medical facility; UGMed2 upgrade
33. **UGRec (#83)** — recreation center; UGRec2 upgrade

### Phase 9: Underground Expansion
34. **UGResident (#80)** — underground housing; UGResident2/UGResident3 upgrades
35. **UGCommercial (#88)** — underground commercial; UGCommercial2/UGCommercial3 upgrades
36. **UGFact (#92)** — underground factory; UGFact2 upgrade
37. **UGRed (#102)** — underground? (restricted access)
38. **UGSpacePort (#101)** — underground spaceport
39. **UGGeoTherm (#111)** — geothermal power
40. **Chap (#43)** — research center; Chap2 upgrade

### Phase 10: Mega-Engineering
41. **Dirt (#48)** — excavation; Dirt2 upgrade
42. **Nano (#45)** — nanotech facility
43. **TerraForm (#46)** — terraforming engine; TerraForm2 upgrade

### Phase 11: Endgame
44. **ActiveMine2 (#53)** — enhanced active mining (cost tier 7, highest in game)

---

## 11. Special Structures (Non-Buildable)

These records exist in the game data but are not player-buildable:

| Indices | Type | Description |
|---------|------|-------------|
| 0–5 | Surface Terrain | Unknown, Clear, Rough, Hostile, Hopeless, Dozed |
| 6–9 | Underground Terrain | UGEasy, UGDiff, UGImposs, UGDozed |
| 10–14 | Seed Structures | Seed, SeedCommand, SeedSmelter, SeedPower, SeedFact |
| 63,66 | Landers | ColonistLander, CargoLander |
| 67–71 | Construction | Const, LRoadConst, RRoadConst, XRoadConst, ExpDigConst |
| 72 | Core | Core (colony core) |
| 73–76 | Destroyed | Destroyed, Destroyed2, Destroyed3, LanderConst |
| 97–100 | UG Resources | UGMine, UGMine2, UGTokamak, UGTokamak2 |
| 107 | UGCore | Underground core |
| 108 | UGConst | Underground construction |
| 113–115 | UG Destroyed | UGDestroyed, UGDestroyed2, UGDestroyed3 |
| 116–122 | Robots | RoboDoze, RoboDig, RoboMine, RoboExplr, UGRoboDoze, UGRoboDig, UGTargetDig |
| 129–138 | Colony/Space | Colonists, Food, LifeSupport, SolarSat, GeoProbe, WeatherSat, InterStellarProbe, CommSat, OrbitObserve, ULBIProbe |

---

## 12. Data Anomalies & Notes

1. **Self-reference in SpacePort bitmask**: SpacePort (#15) has bit 0 set (field 18 = 1), which maps to itself. This may be a sentinel/"always available" flag rather than a true prerequisite.

2. **Tokamak requires everything**: With mask `111111111111`, the Tokamak requires all 12 tech nodes to be built before it can be constructed — yet it is in the "Seed/Power" category. This may indicate the mask represents operational dependencies rather than pure build prerequisites.

3. **ActiveMine2 is unique**: It has cost tier 7 (highest), build tier 5 (highest), but zero prereq flags (all bits 0). It appears to be a late-game special upgrade.

4. **Operations flags reference different nodes**: BLDGOPS fields 22–35 reference building indices 19–32 instead of 15–26, creating a separate operational dependency tree focused on power production and manufacturing chains.

5. **MShipTokamak and Seeds share the zero mask**: All have mask `000000000000` — they are the starting buildings that unlock everything else.

---

## 13. Raw Building List (Buildable, Filtered)

Indices 11–128, excluding terrain, destroyed states, and abstract types:

| # | Name | Cost | Build | BldgCat | ResCat | Mask | Special |
|---|------|------|-------|---------|--------|------|---------|
| 15 | SpacePort | 6 | 4 | 10 | 7 | `100100111000` | 0 |
| 16 | DisMine | 6 | 2 | 0 | 7 | `100000100000` | 0 |
| 17 | MassDrv | 6 | 4 | 5 | 9 | `111111111010` | 0 |
| 18 | SolrPwrRecvr | 2 | 2 | 7 | 4 | `110111100000` | 0 |
| 19 | MShipTokamak | 1 | 2 | 10 | 2 | `000000000000` | 0 |
| 20 | Tokamak | 1 | 2 | 10 | 9 | `111111111111` | 0 |
| 21 | Tokamak2 | 1 | 2 | 10 | 9 | `111111111111` | 0 |
| 22 | LMono | 5 | 2 | 2 | 7 | `111100111000` | 0 |
| 23 | RMono | 5 | 2 | 2 | 7 | `111100111000` | 0 |
| 24 | XMono | 5 | 2 | 3 | 12 | `111100111000` | 0 |
| 25 | LMonoTrain | 5 | 2 | 2 | 7 | `111100111000` | 0 |
| 26 | RMonoTrain | 5 | 2 | 2 | 7 | `111100111000` | 0 |
| 27 | AgriDome | 3 | 2 | 5 | 5 | `100000111000` | 1 |
| 28 | AgriDome2 | 3 | 2 | 5 | 5 | `100000111000` | 1 |
| 29 | AgriDome3 | 3 | 2 | 5 | 5 | `100000111000` | 1 |
| 30 | Fact | 6 | 2 | 8 | 6 | `111111111100` | 0 |
| 31 | Fact2 | 6 | 2 | 8 | 6 | `111111111100` | 0 |
| 32 | Fact3 | 6 | 2 | 8 | 6 | `111111111100` | 0 |
| 33 | Trade | 1 | 2 | 1 | 2 | `101010110000` | 0 |
| 34 | Spew | 4 | 3 | 7 | 8 | `101100111000` | 1 |
| 35 | Spew2 | 4 | 3 | 7 | 8 | `101100111000` | 1 |
| 36 | Spew3 | 4 | 3 | 7 | 8 | `101100111000` | 1 |
| 37 | CommTwr | 5 | 2 | 3 | 2 | `101001100000` | 0 |
| 38 | CommTwr2 | 5 | 2 | 3 | 2 | `101001100000` | 0 |
| 39 | CommTwr3 | 5 | 2 | 3 | 2 | `101001100000` | 0 |
| 40 | HotLab | 5 | 3 | 5 | 5 | `111111111110` | −1 |
| 41 | HotLab2 | 5 | 3 | 5 | 5 | `111111111110` | −1 |
| 42 | Chap | 6 | 4 | 8 | 6 | `101110101000` | 0 |
| 43 | Chap2 | 6 | 4 | 8 | 6 | `101110101000` | 0 |
| 44 | Nano | 4 | 3 | 5 | 5 | `110111111000` | 1 |
| 45 | TerraForm | 6 | 4 | 9 | 9 | `111111111000` | 5 |
| 46 | TerraForm2 | 6 | 4 | 9 | 9 | `111111111000` | 5 |
| 47 | Dirt | 5 | 3 | 8 | 5 | `111110110000` | 1 |
| 48 | Dirt2 | 5 | 3 | 8 | 5 | `111110110000` | 1 |
| 49 | Cops | 4 | 3 | 3 | 4 | `110100100000` | 0 |
| 50 | Cops2 | 4 | 3 | 3 | 4 | `110100100000` | 0 |
| 51 | ActiveMine | 6 | 2 | 5 | 7 | `100000100000` | 0 |
| 52 | ActiveMine2 | 7 | 5 | 5 | 0 | `000000000000` | 0 |
| 53 | Smelter | 6 | 4 | 8 | 7 | `111100111000` | 0 |
| 54 | Smelter2 | 6 | 4 | 8 | 7 | `111100111000` | 0 |
| 55 | Command | 0 | 2 | 0 | 3 | `101010110000` | 0 |
| 56 | RoboCmd | 4 | 2 | 7 | 3 | `101010110000` | 0 |
| 57 | RoboCmd2 | 4 | 2 | 7 | 3 | `101010110000` | 0 |
| 58 | Warehouse | 2 | 2 | 3 | 2 | `100100100000` | 0 |
| 59 | Warehouse2 | 2 | 2 | 3 | 2 | `100100100000` | 0 |
| 60 | Storage | 2 | 1 | 2 | 2 | `110000000000` | 0 |
| 61 | Storage2 | 2 | 1 | 2 | 2 | `110000000000` | 0 |
| 63 | MonoStation | 4 | 2 | 2 | 6 | `111100111000` | 0 |
| 64 | MonoXFormer | 4 | 1 | 2 | 6 | `111100111000` | 0 |
| 76 | LRoad | 0 | 0 | 0 | 2 | `100000000000` | 0 |
| 77 | RRoad | 0 | 0 | 0 | 2 | `100000000000` | 0 |
| 78 | XRoad | 0 | 0 | 0 | 2 | `100000000000` | 0 |
| 79 | UGResident | 3 | 2 | 2 | 3 | `110000101000` | 0 |
| 80 | UGResident2 | 3 | 2 | 2 | 3 | `110000101000` | 0 |
| 81 | UGResident3 | 3 | 2 | 2 | 3 | `110000101000` | 0 |
| 82 | UGRec | 2 | 2 | 2 | 4 | `101110111000` | 1 |
| 83 | UGRec2 | 2 | 2 | 2 | 4 | `101110111000` | 1 |
| 84 | UGUniv | 3 | 2 | 2 | 4 | `111001111000` | 1 |
| 85 | UGUniv2 | 3 | 2 | 2 | 4 | `111001111000` | 1 |
| 86 | UGUniv3 | 3 | 2 | 2 | 4 | `111001111000` | 1 |
| 87 | UGCommercial | 4 | 2 | 2 | 3 | `110100100000` | 1 |
| 88 | UGCommercial2 | 4 | 2 | 2 | 3 | `110100100000` | 1 |
| 89 | UGCommercial3 | 4 | 2 | 2 | 3 | `110100100000` | 1 |
| 90 | UGPark | 2 | 1 | 1 | 3 | `100000111000` | 1 |
| 91 | UGFact | 4 | 3 | 4 | 4 | `100011111000` | 0 |
| 92 | UGFact2 | 4 | 3 | 4 | 4 | `100011111000` | 0 |
| 93 | UGLab | 4 | 3 | 2 | 4 | `111111111000` | 0 |
| 94 | UGLab2 | 4 | 3 | 2 | 4 | `111111111000` | 0 |
| 95 | UGLab3 | 4 | 3 | 2 | 4 | `111111111000` | 0 |
| 100 | UGSpacePort | 2 | 2 | 3 | 2 | `100100100000` | 0 |
| 101 | UGRed | 3 | 2 | 0 | 4 | `100110000000` | 2 |
| 102 | UGAdmin | 2 | 2 | 2 | 3 | `101010110000` | 0 |
| 103 | UGAdmin2 | 2 | 2 | 2 | 3 | `000000110000` | 0 |
| 104 | UGMed | 3 | 2 | 4 | 4 | `111001111000` | 0 |
| 105 | UGMed2 | 3 | 2 | 4 | 4 | `111001111000` | 0 |
| 108 | UGCops | 4 | 3 | 3 | 3 | `110100100000` | 0 |
| 109 | UGCops2 | 4 | 3 | 3 | 3 | `110100100000` | 0 |
| 110 | UGGeoTherm | 3 | 2 | 10 | 9 | `111100111000` | 0 |
| 111 | UGTrade | 0 | 0 | 1 | 2 | `000000000000` | 0 |
| 122 | XPipe | 1 | 1 | 1 | 1 | `100000000000` | 0 |
| 123 | LPipe | 1 | 1 | 1 | 1 | `100000000000` | 0 |
| 124 | RPipe | 1 | 1 | 1 | 1 | `100000000000` | 0 |
| 125 | UGRPipe | 1 | 1 | 1 | 1 | `100000000000` | 0 |
| 126 | UGLPipe | 1 | 1 | 1 | 1 | `100000000000` | 0 |
| 127 | UGXPipe | 1 | 1 | 1 | 1 | `100000000000` | 0 |

---

## 14. Decoding Script

```powershell
$raw = [System.IO.File]::ReadAllBytes("path\to\BLDGBLD.DAT")
$out = @()
$start = 0
for($i=0; $i -lt $raw.Length-1; $i++) {
  if($raw[$i] -eq 0x0D -and $raw[$i+1] -eq 0x0A) {
    $decoded = $raw[$start..($i-1)] | ForEach-Object { $_ -bxor 0x80 }
    $out += [System.Text.Encoding]::ASCII.GetString($decoded)
    $start = $i+2; $i++
  }
}
if($start -lt $raw.Length) {
    $decoded = $raw[$start..($raw.Length-1)] | ForEach-Object { $_ -bxor 0x80 }
    $out += [System.Text.Encoding]::ASCII.GetString($decoded)
}
$out -join "`r`n" | Out-File -Encoding ascii "decoded.csv"
```

---

## 15. Open Questions

1. **Self-reference in SpacePort mask**: SpacePort's bit 0 (field 18) = 1 references itself. Is this a sentinel, or does the game code offset the mapping differently?

2. **Tokamak's all-ones mask**: If the Tokamak truly requires all 12 tech nodes including monorails and agridomes, it would be one of the last buildings unlocked — yet it is a basic power plant. The mask may represent operational dependencies or some other mechanic.

3. **BLDGOPS field 38 value 2**: Found only on UGRed — what does "restricted access" mean in game terms?

4. **Fields 1–17 and 30–35 in BLDGBLD**: Always zero in all records. Possibly unused padding from an earlier data structure, or flags for unimplemented features.

5. **ActiveMine2 anomaly**: Highest cost and build time tiers but zero prereq mask — possibly a hard-coded special building not tied to the tech tree.
