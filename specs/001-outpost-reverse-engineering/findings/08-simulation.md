# Simulation Internals — Decompiled (work in progress)

**Status:** being decompiled from `reference/outpost-exe/disasm` (2026-10-10).
Every statement cites the function it was read from. Pseudo-C uses the
recovered names in `tools/ne-analyzer/symbols.json`. Items marked
**(inferred)** are not yet read directly from code.

Prerequisite reading: [00-ground-truth.md §3](00-ground-truth.md#3-simulation-architecture-verified-from-code)
(step queue, turn order).

---

## 1. Object model

### 1.1 Object database and handles

All simulation objects live in a handle-based database (global `g_objectDb`
at DGROUP `0x65E2`). A handle is a 32-bit value:

```
handle = (type << 24) | index      // type = table number, index = 24-bit slot
```

`Db::resolveHandle(db, h)` (`s6:E1EC`): `type == 0` → NULL; `type == 0xFF` →
special object at `[0x5166]`; else `db->tables[type]` (far ptr array at
`db+0x0A`) → `s7:1312(table, index)`. This is why every trace string prints
objects as `0x%08lx`.

Iteration: `DbIter::DbIter(&it, mode, typeMask)` (`s6:DC52`) +
`DbIter::next(&it)` (`s6:E4EC`). `typeMask` is a handle with only the type
byte set.

| Type | Objects | Evidence |
|-----:|---------|----------|
| 0x01 | Star | the simulator saves tables 1..8 as chunks 0x0C..0x13 (`s6:DCE2` → `s6:E56C`); in TUTOR.OPS chunk 0x0C holds "Sigma Draconis" |
| 0x02 | Planet | chunk 0x0D: "Sigma Draconis 4" |
| 0x03 | Site | chunk 0x0E: "Vulcan's Forge" |
| 0x04 | **Colonies** | SCSetup / SCPrelimAlloc iterate them; chunk 0x0F holds 2 ("Vulcan's Forge", "Rebel") |
| 0x05 | Tiles (building owners), inferred | chunk 0x10 holds 194, the same count as buildings |
| 0x06 | Units: robots and trucks on a tile, kind `+0x0C` = product A id (§2.12) | chunk 0x11 (26 in TUTOR.OPS); created by `s7:7C50` |
| 0x07 | **Buildings** | `Building::Building` registers type `0x07000000`; terrain cells are buildings of types 1–9 |
| 0x08 | Players (research state) | `colony+0x200` holds a type-8 handle; SCSetup runs `s7:2690` on each; 2 in TUTOR.OPS. SCSetup skips colonies whose player is `0x08000002` (inferred: the rebels) |

Every DB object derives from `DbObj` (`DbObj::DbObj(type, owner)`, `s7:165E`):

```
+0x00 vtable
+0x04 own handle      (Db::allocHandle(g_handleAllocator=[0x5736], type))
+0x08 owner handle    (DbObj::getOwner() = resolve(+0x08), s6:B58E)
```

### 1.2 Building (type 0x07)

`Building::Building(type, owner)` (`s6:B39E`), base vtable `s6:CF6A` (26 slots):

```
+0x08 owner handle -> the building's Tile
+0x0C word  building type (= BLDGBLD/BLDGOPS record index)
+0x0E word  placeholder type shown while under construction:
            66 (Const), or 107 (UGConst) for types 79..111
+0x10 word  sprite/animation variant (s6:BF76: random 1..3 -> 0x48..0x4A,
            or 0x70..0x72 for buildings in group 0x28)
+0x12 word  state: 4 = constructing, 5 = operational (tested by every SC
            step), 6 = suspended (names inferred)
+0x14 far*  needs record, owned by the building (see below)
+0x18 word  state to restore when leaving state 6
+0x1A..+0x1F runtime fields
```

**State machine** `Building::setState(new)` (`s6:BDAC`):

```c
if (state == new) return;
if (state == 6) { if (saved == new) { state = saved; saved = 0; } return; }
if (new == 6)   { saved = state; state = 6; return; }
if (state == 4 || state == 5) delete info;       // +0x14
state = new;
this->onStateEntered();                          // vslot 15
```

Base `onStateEntered` (`s6:BF22`) picks the needs record for the new state:
state 4 → `info = copy of BLDGBLD[type]` (`s6:E0BC`, 0x98 bytes: build needs);
state 5 → `info = copy of BLDGOPS[type]` with the runtime fields
+0xA4 (produced resource), +0xA8, +0xAA (rate), +0xAC (flag) zeroed
(`s6:E100`, 0xAE bytes: running needs); state 6 → unchanged; else NULL.
Subclasses override slot 15 and call the base first (AgriDome `s7:BE80`).

`Building::create(type)` (`s7:07AC`) is the factory: `operator new(size)` +
the class constructor. `Db::createBuilding` (`s7:10B0`) calls it and links the
new building into its tile (`Tile::setBuilding`, `s7:7E5A`). The full
type → class → size → vtable map is in
`reference/outpost-exe/building-classes.json`
(`tools/ne-analyzer/building_classes.py`).

#### Building vtable slots (26)

| Slot | Off | Base impl | Called by | Meaning |
|-----:|----:|-----------|-----------|---------|
| 0 | +00 | s6:CF44 | delete | scalar deleting dtor |
| 11 | +2C | s6:BF16 (empty) | **SCMines** (types 51, 52, 96, 97) | `mine()` |
| 12 | +30 | s6:BF1A (empty) | **SCFactory** (all operational, minus terrain/mines/command/robots) | `produce()` |
| 13 | +34 | s6:BF1E (empty) | **SCPower** (group 0x0C members) | `power(bool operational)` |
| 10 | +28 | s6:BE2A | | Nano (`s6:2700`) sets colony `nanotech` when operational |
| 6 | +18 | s6:BD38 | SCInternalPutBldg | `reserveNeeds()`: Colony_alloc of the needs record, resources 17..36 |
| 8 | +20 | s6:BC7E | SCInternalPutBldg | `beginConstruction()`: setState(4) |
| 10 | +28 | s6:BE2A | SCProdSched (§2.9) | `resume()` — overrides listed in §2.9 |
| 14 | +38 | s6:BE9E | SCConstruct (§2.8) | `constructTick()`, every turn for states 1..4. Overrides run the base, then act on completion: Nano (`s6:272E`) sets `nanotech`; ColonistLander lands colonists (`s5:CE9E`); CommandCenter (`s7:C1B2`) sets its life (Command 100; SeedCommand `3 × ship item 0x82`, at least 50 on Beginner/Easy); Mine (`s6:0FA4`) life 100, and a surface mine (group 2) gets a truck on its tile if it is the first ever (DGROUP 0x4FBC) or automatic trucking is on |
| 21 | +54 | s6:B4EC (0) | SCProdSched | `isPowerSource()`: SeedPower always; SolrPwrRecvr, Tokamaks in state 5/6; Command/SeedCommand while life > 0 |
| 15 | +3C | s6:BF22 | `Building::setState` only | `onStateEntered()`: allocates the needs record for the new state; subclasses then set rates (AgriDome: `s7:BE80`) |
| 18 | +48 | s6:B5A8 | SCMorale (operational buildings) | `moraleEffect()`: the BLDGOPS word at record `+0x94` (AgriDome/SPEW/Nano/DIRT/UGRec/UGUniv/UGCommercial/UGPark +1, TerraForm +5, UGRed +2, HotLab −1 — exactly the manual's list); police `s5:D4CA`: mode 2 → +1, else −1 until research 99 (Crowd Psychology) → 0 |
| 20 | +50 | s6:B4E6 (0) | SCPop via `s8:42CC` (group 45) | `providesLifeSupport()`: CommandCenter `s7:C0EC` = SeedCommand, or Command while life > 0; Chap `s5:CD30` = state 5/6 and flag `+0x1A & 2` |
| 25 | +64 | s6:CED2 | `resume()` | `checkConnected()`: unless both network flags are set, note a 1-unit Power and/or LifeA shortfall on the tile and suspend. Roads (`s7:DC02`) always connected; monorails `s6:1E8A`, MonoStation `s6:236A` (not decoded) |

Overrides per class (which slots each building class replaces) were
computed from the vtables. Only these classes override slot 13 (power):
CommandCenter (SeedCommand + Command), SeedPower, SolrPwrRecvr, Tokamak
(MShipTokamak/Tokamak/Tokamak2/UGTokamak/UGTokamak2), UGGeoTherm (empty stub!),
Destroyed (empty). But SCPower only calls the members of **group 12**:
Command, SeedPower, SolrPwrRecvr, MShipTokamak, Tokamak, Tokamak2, UGGeoTherm.
So SeedCommand and both underground tokamaks never produce power.

### 1.2a Building groups

70 groups of building types (`g_bldgGroups`, built by `s2:BDE0`; test
`BldgGroups::contains` `s2:C6AE`). Each entry is `{far ptr to uint16 type
list in DGROUP, word count}`; groups 53 and 59 are never set (empty). The
full membership list is in `reference/outpost-exe/building-groups.json`.
Notable: 12 = power producers polled by SCPower, 13 = the same without
Command, 32 = SeedCommand + Command, 40 = all underground types (also picks
the underground sprite variants), 50/51 = level-2/level-3 upgrades.

### 1.3 Tile (building owner)

A building's owner object, created/linked in `Db::createBuilding`:

```
+0x16 building handle   (+0x1A cached pointer, DbObj::resolveLink16 s7:73A8)
+0x1E container of unit handles (robots, trucks; §2.12); empty slots stay
+0x34 word trucks         kind-4 units added here (s7:7C50; never lowered)
+0x22 SparseTable* Bas    — per-tile resource quantities (stock/output)
+0x26 SparseTable* Alloc  — per-tile allocations/demands
+0x2E Colony*
```

Ledger API (`SparseTable` = sorted (key, long value) list, `s5:BA3E`):

| Function | Effect |
|----------|--------|
| `Tile::getBas(tile, res)` `s7:7C28` | `Bas[res]` (0 if no table) |
| `Tile::setBas(tile, v, res)` `s7:7D1C` | `Bas[res] = v` |
| `Tile::addBas(tile, v, res)` `s7:7DDC` | `Bas[res] += v` |
| `Tile::setAlloc(tile, v, res)` `s7:7D7C` | `Alloc[res] = v` |
| `SparseTable::write(t, mode, v, key)` `s5:BBA4` | mode 0 = set, else add |

### 1.4 Colony (type 0x04)

```
+0x0C   container of tile handles
+0x14E  long units[kind]       (rebuilt every turn)
+0x1F6  far* population object
+0x200  handle of the player/research object (type 8)
```

Colony totals are rebuilt from tiles each turn (see §3.1).

Full layout so far:

```
+0x010  handle hub            comm-tower range origin (s5:D194; writer TBD)
+0x018  word morale           0..1000 (SCMorale; SCForceMorale sets 0/1000)
+0x01A  word previous morale  last turn's value (Colony_setMorale s8:4D0E)
+0x01C  word defection tier   1..8 colonists leaving, 9..16 rebels joining
+0x01E  long defection amount people per defection in that tier
+0x022  word crime            0..100 (s8:4760; inferred from police/red-light rules)
+0x024  word education        0..100 (s8:45E4; UGUniv raises it)
+0x026  long total[37]        sum of tile Bas ledgers (s8:5464)
+0x0BA  long alloc[37]        granted this turn (s8:518C)
+0x14E  long units[21]        units per kind on the colony's tiles (s8:5464)
+0x1A2  long busy[21]         units busy (s8:53BA; writers TBD)
+0x1F6  far* population
+0x1FE  word populated        SCPop/SCMorale skip the colony until set; set when
                              colonists land (s5:CF6C) and by CommandCenter::power
                              when 0 < life < 25 (s7:C1A7)
+0x200  handle player
+0x204  word nanotech         cleared by SCProdSched every turn, set again on
                              Beginner and by an operational Nano (s6:2700/s6:272E):
                              only Power and People are needed (allocation, build
                              and running costs); with research 130 nobody eats,
                              with 128 the death rolls stop
+0x206  word free resources   set by the Fill Resources cheat (s6:83E1): no
                              allocation, building and running cost nothing
+0x208  word                  passed with every log message (TBD); ctor 1
+0x20A  word crowding morale  from SCPop (s6:A28A); read by SCMorale (s7:EEBB)
+0x20C  word crowding flag    1 crowded, 0, -1 roomy
+0x20E  word explorers        0..10 (s8:48E0 / s8:4900)
+0x210  far* RoboCmd table    operational RoboCmd tiles (SCEndSim, s8:3BA0)
+0x214  word plague turns, +0x216 long plague treated (s8:362E)
+0x21A  far* AI builder       {+0 tile, +4 colony, +8 type} (s7:9ECC)
```

Colony ctor (`s8:30AA`): morale and previous morale 600 (so factories start
at the 550–749 speed band, §2.4), education 50, `+0x200 = 0x08000001`,
`+0x208 = 1`, rest 0.

### 1.4a Population (age cohorts)

Class ctor `s7:314C` (vtable `s7:3AF2`), one per colony (`colony+0x1F6`):

```
+0x004  long cohort[91]     people of age 0..90
+0x170  long                added to the People total (meaning TBD); factory product 12 adds 1
+0x174  word deathRate[6]   percent of age group g killed by a death roll (index 1..5)
+0x180  word deathChance[6] percent chance per turn of a death roll for group g
+0x18C  long deathCarry[6]  remainder carried between death rolls
+0x1A4  long                ctor argument (TBD)
+0x1A8  word birthDivisor   5; yearly births = (group 3 + group 4) / this
+0x1AA  long lifeSupportDeaths  doubles every turn without life support
+0x1AE  word schoolLeavingAge   16; upper age of group 2
```

Age groups (`s7:3948`): 1 = 0–3, 2 = 4..school-leaving age, 3 = school-leaving
age+1..39, 4 = 40–75, 5 = 76–90, other = 0–90. `Pop_total` `s7:38B8`,
`Pop_group` `s7:38F2`.

Death tables are set by the ctor from the difficulty (`DGROUP 0x13AE`,
1 Beginner, 2 Easy, 3 Medium, 4 Hard, set by the dialog at `s8:AA33`;
0 before one is chosen):

| Difficulty | rate[1..5] (%) | chance[1..5] (%) |
|------------|----------------|------------------|
| 0, 1 (`s7:34DA`) | 1, 1, 1, 1, 4 | 50, 10, 10, 10, 75 |
| 2–4 | 1, 2, 2, 1, 6 | 100 for all |

`s7:34DA` is also applied to every colony by an event at `s6:7A90` (TBD).

Cohort operations: `s7:387C` ages everyone a year (age 90 is lost, age 0 = 0);
`s7:3534` sets age 0; `s7:3548` adds to age 0; `s5:CF6C` lands `n`
colonists split over ages 19/29/39/49/59 (`n % 5` extra at 19).
`Pop_kill(g, n)` (`s7:375A`): group 0 takes people oldest first
(`s7:3A3A` per age); groups 1–5 take `n / ages` from every age of the group
and the remainder one each from the youngest, clamping each cohort at 0
(whatever is clamped is not taken elsewhere). It always ends by clearing all
six `deathCarry` values.

### 1.4c Registry, planet

`Registry_get(id)` (`s3:20BA`, 320 callers) returns a lazily created
singleton per id (switch at `s3:276A`, ids 1–0x48). Ids met so far:
2 game options (difficulty at `DGROUP 0x13AE`), 8 mothership (`s3:95AA`),
0x2B alerts sink (`s3:043A`), 0x2C morale crisis (`s2:EB2A`), 0x2F current
view (`s3:E9E4`; `+0x16` current planet, `+0x24` current colony),
0x35 build menu (`s3:6700`, §2.12), 0x37 message log (`s2:A0E4`), 0x3B
trade agreements (`s2:DD4E`) and 0x3C trade market (`s4:331C`, §2.13),
0x40 AI managers (`s2:AF94`, §2.15). Full id → ctor list:
`tools/ne-analyzer` + the switch table (to be added to the reference dump).

**Planet** (DB type 2, ctors `s7:2958`/`s7:299A`, vtable `s7:3130`):
`+0x10` far ptr to a 0x28-byte record (`+0x02` name, `+0x06` 3 words,
`+0x0C` word — SCMorale's hostility penalty, 1 for Sigma Draconis 4 in
TUTOR.OPS; `+0x0E` long; `+0x12` 16 bytes; …), `+0x14` counter, `+0x16`
state 1/2, `+0x18` countdown from 10000 (`s7:2A2C` per turn), `+0x1A`.

### 1.4b Random numbers

`rand()` is the MSVC C runtime's (`s1:4D24`): `seed = seed * 0x343FD +
0x269EC3; return (seed >> 16) & 0x7FFF`, seed at `DGROUP 0x61E8` (initially 1),
seeded once at startup with `srand(time(NULL))` (`s2:54CA`). `random(lo, hi)`
(`s2:612E`) draws one `rand()` value `r` and returns the first `v = lo + k - 1`
with `k * (0x7FFF / (hi - lo + 1)) >= r`, or `hi`.

### 1.5 Resource ids (authoritative: `ResourceName`, `s5:C0D8`)

| Id | Name | Id | Name | Id | Name |
|---:|------|---:|------|---:|------|
| 1–3 | OreLifeA–C | 17–20 | MetalA–D | 29 | Luxury |
| 4–7 | OreA–D | 21–22 | PrecA–B | 30 | Food |
| 8–10 | OreFusionA–C | 23–25 | MinA–C | 31 | Sewage |
| 11–13 | OreMinA–C | 26–28 | FusionA–C | 32 | (Unknown) |
| 14–16 | LifeA–C | | | 33 | MPG |
| | | | | 34 | (Unknown) |
| | | | | 35 | **Power** |
| | | | | 36 | **People** |

This also fixes the BLDGBLD/BLDGOPS column semantics: the `long[37]` array
in each record is **indexed by resource id** (`long[0]` unused). In
BLDGBLD, field 36 = `long[35]` = Power and field 37 = `long[36]` = People;
these are not "cost tier / build time" as earlier docs said.

### 1.6 Research tree

Two pre-order tables of `{word stringId, word childCount, word cost, word id}`:

* Main tree at DGROUP `11:3198`: ids 0–111 (string 1200 + id), plus 112 "None",
  113 "Pause". The 4th word is 0; the id is the table index. Costs 25/50/75/100/200.
* Advanced tree at DGROUP `11:0D5E`: ids 114–130 (strings 1312–1328) with
  explicit ids: 114 Top, 115 Biology, 116 Genetics, 117 Genetic Engineering,
  118 Agriculture 2, 119 Computer Science, 120 Nanotechnology 1, 121 Physics,
  122 Nanotechnology 2, 123 Nanomachines, 124 Assembler, 125 Replicator,
  126 Construction, 127 Mining, 128 Medical, 129 Terraforming, 130 Food Production.

Research state: the player object (colony `+0x200`, `s8:3FB0`), see §2.10.
Topic `id` is complete when `remaining[id] == 0` (`s7:25B2`). Research
*discoveries* (results) are a separate list: name = string `1636 + id`,
id 1–66 (`s3:AC92`). Hot labs research the advanced tree (registry 0x41,
`s2:ED6F` reads `0x0D5E`), UG labs the main tree (registry 0x31, `s3:9359`
reads `0x3198`).

---

## 2. Step bodies

### 2.1 SCSetup::calcMe (`s6:ACEC`) — priority 15999 (first)

```c
for colony in db.iter(type 4):
    trace("SCSetup::calcMe clearing colony 0x%08lx.", colony->handle)
    if (colony->researchHandle != 0x08000002) {   // skip one special colony
        Colony_sumTileLedgers(colony)              // s8:5464, §3.1
        Colony_step2(colony, 1)                    // s8:56D6 (TODO)
    }
for p in db.iter(type 8):
    s7_2690(p)                                     // per-player reset (TODO)
```

### 2.2 SCPower::calcMe (`s6:A9F4`)

```c
for b in db.iter(type 7):
    if (BldgGroups_contains(g_bldgGroups, 0x0C, b->type))
        b->power(b->state == 5)                    // vslot 13
```

Power plant implementations:

| Class | Function | Output (Bas[Power] of its tile) |
|-------|----------|-------------------------------|
| SeedPower | `s6:35B0` | 50 if operational, else 0 |
| Command (class shared with SeedCommand, which is not polled) | `s7:C12E` | 50 while `this+0x24` (remaining life, 0 after the ctor `s7:C09C`) > 0, decremented each turn; 0 after. When 1 ≤ life < 25 sets `colony+0x1FE = 1` |
| Tokamak / Tokamak2 / MShipTokamak | `s6:4F30` | 1000 if operational, else 0. UGTokamak/UGTokamak2 share the class but are not polled |
| Solar Power Receiver | `s6:43F6` | 1000 if operational **and** a Solar Power Satellite exists (`s3:65D0(registry 0x830009) > 0`); otherwise unchanged |
| UGGeoTherm | `s6:5682` | **empty stub, produces nothing** |

All use `Tile::setBas(tile, value, Power)`, i.e. each plant sets its own
tile's output; colony totals are summed later (§3.1).

### 2.3 SCMines::calcMe (`s7:EB86`)

```c
for b in db.iter(type 7):
    if (b->state == 5 && b->type in {51, 52, 96, 97})   // ActiveMine1/2, UGMine1/2
        b->mine()                                      // vslot 11 -> Mine::mine s6:134A (TODO)
```

### 2.4 SCFactory::calcMe (`s6:81E0`)

```c
for b in db.iter(type 7):
    t = b->type
    skip if t in {0, 5, 9, 16, 18..21, 51, 52, 55, 71, 93..97, 106, 115..117, 119..121}
    if (b->state == 5) b->produce()                    // vslot 12
```

(Excluded: terrain, DisMine, power plants, mines, Command, Core, labs/UG
mines, UGCore, most robots.)

`produce()` implementations:

| Class | Function | Notes |
|-------|----------|-------|
| AgriDome 1/2/3 | `s7:BF6E` | see below |
| Smelter, SeedSmelter | `s6:3958` | TODO (730 B) |
| Factory, SeedFact, UGFact | `s6:0582` | TODO (668 B) |
| Spew | `s6:3F04` | TODO: uses Sewage (31) and MPG (33) |
| HotLab / UGLab | `s7:C7B0` | TODO |
| TerraForm | `s6:4ACA` | TODO |
| RoboCmd | `s7:D26C` | TODO |
| UGResident | `s6:5D0E` | TODO |
| SeedCommand | `s7:C10E` | TODO |

**AgriDome** (`s7:BE80` onStateEntered + `s7:BF6E` produce):

```c
// slot 15: after the base handler, when the dome becomes operational
info->producedRes = Food;                 // +0xA4 = 30
info->flag        = 1;                    // +0xAC
info->rate        = {27:10, 28:11, 29:12}[type];   // AgriDome 1/2/3
R = research(colony)
if (R.done(12))  info->rate++;            // Exobiology
if (R.done(14))  info->rate++;            // Agriculture 1
if (R.done(118)) info->rate++;            // Agriculture 2

// slot 12 produce()
stored = Tile_getBas(tile, Food);
Tile_addBas(tile, min16(1000 - stored, info->rate), Food); // 16-bit unsigned min:
// stores up to 1000; above 1000 the subtraction wraps and the full rate is added
```

### 2.5 Production chain (decoded 2026-10-11)

Turn counter: `g_objectDb+0`, read by `Sim::getTurnNumber` (`s7:8326`),
reset by `s7:8334`, incremented after every turn by `s6:E242` (which also
pings a window every 100 turns). Several formulas use its parity.

**Building slot 16** (+0x40) = `isFull(&stored)`; base `s6:BBF0` returns
false with 0 stored. Base slot 6 (`s6:BD38`) charges the type's whole
BLDGBLD needs (resources 17..36) to `colony.alloc[]` without checking
availability (caller not traced yet).

**Mine** (class `s6:0C50`; DisMine, ActiveMine 1/2, UGMine 1/2)

```c
Building* oreTarget():                       // s6:121E
    if (tile.level == 0) return this;          // tile pos at +0x0C: x, y, level
    return building at (tile.x, tile.y, level 0) in the same grid   // s7:627E
bool isFull(&stored):                        // slot 16, s6:12BE
    if (surface) { stored = sum(tile.Bas[4..13]); return stored > 500; }
    return oreTarget()->isFull(&stored);
void mine():                                 // slot 11, s6:134A
    if (!group19.contains(type)) return;       // UGMine/UGMine2 only
    if (isFull(&stored)) { this+0x22++; return; }
    left = 500 - stored;
    for i in 0..9:                             // one pass, ore mix at DGROUP 0x4FBE
        n = min(mix[i], left)                  // mix = {2,1,1,1,1,1,1,3,2,2}
        oreTarget()->tile.Bas[4 + i] += n; left -= n; if (left <= 0) break;
```

So an underground mine delivers at most 15 ore per turn to the building
above it; surface ActiveMines do nothing in SCMines.

**Smelter** (Smelter 1/2, SeedSmelter; `s6:3958`)

For each ore 4..13 on its tile: zero it, subtract it from `colony.total`,
and add to the smelter's own output ledger (+0x28):
OreA–D → MetalA–D at half (rounded down; 0 becomes 1 on odd turns);
OreFusionA–C → FusionA–C 1:1; OreMinA–C → MinA–C 1:1. Byproducts:
every 2 OreMinB → 1 PrecA, every 3 OreMinC → 1 PrecB (remainders in
+0x20/+0x24), written with *set*, not add. `isFull` (`s6:3C60`) sums the
output by resource 4..28 and then again by entry before comparing with 1000,
so ~500 real units read as full. Output leaves the smelter by truck
(SCMove/transport, not decoded yet).

**SPEW** (`s6:3F04`): `s = tile.Sewage; tile.Sewage = 0;` SPEW 1 adds `s`
MPG. SPEW 2/3: `v = s + carry; carry = v % d; v += v / d;` with `d` = 10 / 5,
then adds `v` MPG (10% / 20% bonus; the remainder is counted again).

**SCAddSpew(colony, n)** (priority 1000, `s6:68DE` / `s6:6926`): adds `n`
Sewage to the tile of the colony's first group-10 building (SPEW 1–3, via
`s8:4D6E`); lost if none. Queued with n = 1 by every operational UG
residence (`s6:5D0E`) and every factory except SeedFact.

**Factory** (Fact 1–3, SeedFact, UGFact; `s6:0582`). Job fields in the
operating record: +0xA6 product A, +0xA8 product B, +0xAA quantity,
+0xAC turns per batch. Progress counter +0x20, output list +0x22.

```c
advance():                                    // s6:081E, m = colony+0x18 (morale?)
    progress++;
    if (m < 250) { if (turn even) progress--; }      // 1/2 speed
    else if (m < 450) { if (turn % 3 == 0) progress--; }  // 2/3
    else if (m < 550) {}                             // normal
    else if (m < 750) { if (turn % 3 == 0) progress++; }  // 4/3
    else progress++;                                 // double
produce():
    for product in (A, B) if product && turns:
        advance();                              // twice per turn when both are set
        if (progress >= turns) {
            if (!isFull())                      // output units >= 30 (s6:04EE)
                A == 12 ? population+0x170++    // adds a person
                        : output += {product, qty, qty * unitValue(product)};
            progress = 0;                       // batch lost if full
        }
    if (type != SeedFact) queue SCAddSpew(colony, 1);
```

Unit values: product A `s5:C3B4` = {1:3, 2:3, 3:3, 4:6, 5:3, 6:10, 7:2,
8–12:3, 13:1, 14:1, 15–19:10, other 1}; product B `s5:C42E` = 1 for 15,
else 3. Which product names the ids map to is not traced yet.

### 2.6 SCPop::calcMe (`s6:9EFC`) — priority 8999 (decoded 2026-10-11)

```c
if (!resolve(colony 1)) return;
for (each colony c) {
    if (!c->populated) continue;                       // +0x1FE
    if (c->player != REBELS) feed(c);                  // s6:A3AE
    if (crowding(c) < 100) grow(c);                    // s6:A28A, s6:A4EE
    if (c->player == REBELS) continue;
    if (n = lifeSupport(c)) log(2, n);                 // s8:42CC
}
if (ship.count(item 0x3E) == 0) return;                // registry 8, s3:9F72
n = ship.loseCryoColonists();                          // s3:96D0
if (n > 0) log(2, n), alert(0x14);
else if (n < 0 && colony1.total == 0) log(6);          // everyone is dead
```

* **feed** (`s6:A3AE`): skipped with nanotech + research 130. `food =
  available(Food)`; `fed = food * 10`. If `fed < people` (unsigned) queue
  **SCStarve** and only `fed` people eat. Consumes `ceil(eaters / 10)` Food
  through `Colony_consume` (`s8:52B8`: colony total, then tile Bas ledgers in
  tile order). Alert 0x11 when there is no food at all.
* **SCStarve** (ctor `s6:AE66`, priority 4999, so it runs just before
  SCEvent): its `shouldRun` (`s6:AF08`, called when queued) draws the death
  count: `random(1,3)`, but `random(1,1)` on Beginner/Easy and `random(2,3)`
  on Hard. `calcMe` (`s6:AEC0`) kills that many, oldest first. The size of
  the shortfall is stored but never used.
* **crowding** (`s6:A28A`): `ratio = people / operational residences`
  (group 14, UGResident 1–3), 100 with none. Sets colony `+0x20A/+0x20C`:
  ≥100 → −20/1, ≥85 → −15/1, ≥75 → −10/1, ≥50 → −5/1, <25 → +1/−1, else 0/0.
* **grow** (`s6:A4EE`), only when the ratio is below 100:
  1. age 0 += number of operational UG Red Light Districts (UGRed, string
     1058; group 38) — one baby each per turn;
  2. when `turn % 12 == 0`: age everyone a year, then births (`s6:A61E`):
     `(group 3 + group 4) / birthDivisor` set as age 0 — **not for the
     rebels**, whose births are computed and dropped;
  3. unless nanotech + research 128: for g = 1..5, if `deathChance[g] != 0`
     and `deathChance[g] >= random(1,100)`, a death roll (`s6:A188`):
     `v = group(g) + carry[g]; dead = v / (100 / rate[g]); carry[g] = v % …;`
     then `Pop_kill(g, dead)` (which clears every carry).
* **lifeSupport** (`s8:42CC`): if no operational group-45 building (Command,
  SeedCommand, Chap, Chap2) answers slot 20, `lifeSupportDeaths` becomes 1,
  then doubles each turn (capped at the population) and that many die, oldest
  first; otherwise it resets to 0.
* **Mothership cryo** (registry object 8, ctor `s3:95AA`): on arrival
  (`s3:9766`) `+0x1A = 1` and `+0x1E = 50 × count(item 0x80)` colonists in
  cryo; `+0x1C` counts down from 10 each SCPop turn, then 1 colonist dies per
  turn (5 after turn 50, 10 after turn 60). Landers take up to 50 (`s5:CEFC`).

### 2.7 SCMorale::calcMe (`s7:ECF8`) — priority 3999 (decoded 2026-10-11)

```c
h = currentPlanet ? planet.record[+0x0C] : 0;  if (h <= 1) h = 0;
if (difficulty in 1..2) h -= (h >= 7) ? 2 : (h >= 4) ? 1 : 0;
else if (difficulty == 3 && h >= 7) h -= 1;
for (each colony c) {
    if (!c->populated || c->player == REBELS || total(c) == 0) continue;
    m = c->morale; loss = 0;
    updateCrime(c);                                   // s8:4760 (+ s8:45E4)
    loss += c->crime / 10;                            // added (quirk)
    if (c->education > 50) m++;  if (c->education < 50) loss--;
    for (each operational building b) { v = b->moraleEffect(); v < 0 ? loss += v : m += v; }
    loss -= h;
    loss -= tokamakCrowding(c) - c->crowdingMorale;   // s8:01C0; crowding from SCPop
    r = crisisAnswer(c);  r >= 0 ? m += r : loss += r; // s8:008E, colony 1 only
    m = clamp(m, 0, 1000); m = clamp(m + loss, 0, 1000);
    setMorale(c, m);                                  // s8:4D0E keeps the old value
    if (c is colony 1) defections(c, m);              // s8:08D4
    reportsAndIncidents(c, m);                        // s8:095E
}
```

* **Crime** (`s8:4760`): `crime += crowdingFlag`; with no operational UG
  police (group 26) `crime += #UGRed`; otherwise per red-light district the
  first police station within distance 4 decides (`s6:5A94`): mode 1 stops
  it, mode 2 lets it count on even turns only, none/other → +1. Then the
  education update (below), then −1 if education > 50, +1 if < 50, and by
  morale: <250 +2, <450 +1, <550 0, <750 −1, else −2. Clamp 0..100.
* **Education** (`s8:45E4`): ±1 by the sign of `education + (g4 − g3) +
  (g2 − g1)` (>0 → +1), +2 per operational UGUniv, clamp 0..100; then the
  school-leaving age from `education / 10` against 10, 20, … 90 (20 … 12) —
  always 20 (quirk Q19).
* **Distance** (`s7:BD74`): `|dx| + |dy|` of the tile positions; −1 when
  the tiles belong to different grids (so "within n" is then true).
* **Tokamak crowding** (`s8:01C0`): for each Tokamak (group 41, any state),
  every building on the same level within distance 5 that is not in group
  48 (terrain, roads, pipes, mines, reactors, robots, rubble) counts once.
* **Morale crisis** (registry 0x2C: `+0x0A` answer, `+0x0C` scheduled
  turn): `s8:008E` draws `random(1,100)` for colony 1 every turn, applies the
  answer (1: −1 + alert 0x15; 2: −1; 3: +1 + alert 0x16; 4: ±2 by the draw,
  alerts 0x17/0x18; 5: ±2, alert 0x19), clears it, and when no crisis is
  scheduled and morale ≤ 200 schedules one at `turn + random(0,8) + 30`.
  SCEvent's `s6:76DA` opens the dialog on that turn (`s8:CB5C`).
* **Defections** (`s8:08D4`, only while a rebel colony exists), tier and
  amount kept in colony `+0x1C/+0x1E`; staying in a tier repeats the amount
  (capped at the population), entering one takes `people / divisor` (at
  least 1):

  | Colonists leave (`s8:0340`) | tier | share | every | Rebels join (`s8:05D8`) | tier |
  |---|---|---|---|---|---|
  | morale 0 | 8 | 1/4 | turn | 1000 | 16 |
  | ≤ 10 | 7 | 1/10 | turn | ≥ 990 | 15 |
  | ≤ 25 | 6 | 1/20 | turn | ≥ 975 | 14 |
  | ≤ 50 | 5 | 1/100 | turn | ≥ 950 | 13 |
  | ≤ 75 | 4 | 1/100 | 3 turns | ≥ 925 | 12 |
  | ≤ 100 | 3 | 1/100 | 5 turns | ≥ 900 | 11 |
  | ≤ 150 | 2 | 1/100 | 10 turns | ≥ 850 | 10 |
  | ≤ 200 | 1 | 1/100 | 20 turns | ≥ 800 | 9 |

  Leavers go to colony 2 (hard-coded); joiners come from the first rebel
  colony with people. The move is the unnamed step `s6:9944` (priority
  4999): on queueing it takes the people at random ages (`s7:3694`:
  `random(0,90)` per pick), and its calcMe adds them to the destination. An
  emptied source colony is handed to the other player (`s8:349E`: morale
  600/600, flags cleared, per-tile slot 22 call), with alert 0x0B (0x1F for
  a rebel colony), and log 0x3C when the player has no colony left.
* **Reports and incidents** (`s8:095E`): every 10 turns log 0x3F (morale ≤
  200) or 0x3E (≥ 800). Crime ≥ 50/60/75 → every 30/15/5 turns the first
  UG residence (group 15, any state) with no operational UG police within
  distance 5 is replaced by a UG Red Light District (`s6:5CA0` queues
  `SCInternalPutBldg(type 101)`).
* **SCForceMorale** (cheat dialog 4043, `s6:84CA`, priority 999) stores
  forced morale/education/crime but its calcMe (`s6:853E`) applies only
  morale (1000 or 0).

**SCGenKids** (ctor `s7:521C`, priority 12999) is not part of the turn: it is
queued by the command step SCSelect (`s7:53F4`) and calls slot 5 of its target.

---

### 2.8 SCConstruct::calcMe (`s6:6E96`) — priority 12999 (decoded 2026-10-11)

Every building in state 1..4 gets slot 14 (`constructTick`). The base
(`s6:BE9E`) only acts on state 4: rebels count down for free; anyone else,
if `canAfford` (below), counts down the word `+0x94` of the BLDGBLD copy
(the build time in turns, e.g. AgriDome 5, Tokamak 9, Command 3) and pays
the BLDGBLD needs again (`payNeeds`) — **the build needs are a per-turn
cost**. At 0 the building becomes operational (setState 5, BLDGOPS record).
States 1..3 are robot states with their own overrides (not decoded).

`canAfford` (`s6:CB04`): free-resources colony → yes. Nanotech → only Power
and People are checked. Otherwise every resource 17..36: a shortfall of a
material can be covered by the colony's MPG, but the check takes the whole
need out of its local MPG pool (quirk Q24); Power and People cannot be
substituted. Each shortfall is written to the tile's Alloc ledger (the "Need:"
display), and a power shortfall raises alert 0x12.

`payNeeds` (`s6:C952`): free → nothing. Level-2 buildings (group 50) pay
nothing on every 10th turn, level-3 (group 51) on every 5th. Nanotech →
Power and People only. Otherwise for every resource 0..36: MPG pays exactly
the gap between need and stock, then the rest is consumed
(`Colony_consume` `s8:52B8`, which for People only lowers the total).

New buildings (`SCInternalPutBldg`, `s6:87F0`, work in its shouldRun
`s6:8920`) get slot 8 (setState 4) and slot 6 (reserve the needs) at once.

### 2.9 SCProdSched::calcMe (`s6:A89C`) — priority 13999: the colony network

For every non-rebel colony, `s8:3FCA` decides what runs this turn; this is
also where **running costs are paid**:

1. every building's network flags (`+0x1A`) are cleared and every
   operational building is suspended (state 6);
2. `nanotech` is cleared, then set on Beginner;
3. power plants (group 44) whose slot 21 says so get flags 3, resume
   (paying first), then keep only the power flag (`s8:5A96`);
4. power spreads over the surface (`s8:5CC6`, flood fill to a fixpoint);
5. life-support buildings (group 45, slot 20) get the air flag and resume;
6. air spreads over the surface;
7. per underground level L = 1..depth (`site+0x1C`): a UGCore with a fully
   connected building right above it is connected (`s8:58E6`), then both
   flags spread on that level;
8. group 47 (terrain, seed modules, mines, power plants, landers, roads,
   robots, …) get both flags and resume — they need no connection;
9. every other building not operational tries to resume, **in tile order**.

Spreading (`s8:5BE8`): from a flagged tile to each of its 4 neighbours on the
same level. The neighbour conducts if it is a group-43 building, a cross
tube, or a straight tube along that axis: LPipe (123) along y, RPipe (124)
along x, XPipe (122) both; below ground UGLPipe (126), UGRPipe (125), UGXPipe
(127). State-7 buildings never conduct. Tile lookup is by map position.

`resume` (slot 10, base `s6:BE2A`): only for state 6. Rebels → operational.
`+0x1C` equal to the rebel handle → stays suspended. Otherwise
`checkConnected` (slot 25) and `canAfford` + `payNeeds` with the BLDGOPS
needs → operational. Overrides:

| Class | Slot 10 | Rule |
|-------|---------|------|
| Factory | `s6:01EC` | stays suspended while making product A 20 or product B 16 |
| Mine | `s6:0EA6` | DisMine never; UG mines exhausted (state 9) when life `+0x22` reaches 0, else one life per operating turn; surface mines ask the map for ore (`s6:1556`) |
| Nano | `s6:2700` | sets `nanotech` when operational |
| Lab | `s7:C76C` | suspended with no topic or topic 112/113 |
| UGUniv | `s6:6008` | counts `+0x20` down while operational |
| UGCommercial / UGRed | `s6:5412` / `s6:5B42` | also need 1 / 2 Luxury from operational warehouses (`s6:C0F0` check, `s6:C00A` take) |
| CommTwr | `s5:D0B8` | no connection check; in range of the colony hub (30), or with a ComSat (orbital 0x87), or near another tower (`s5:D194`) |
| Roads | `s7:DB78` | always resume |
| Terrain | `s6:490C` | empty |
| Monorails | `s6:1C66` | not decoded |

**Warehouses** (group 4, `+0x20` item list): luxury = quantity of items with
a product B (`s6:6302`); taking (`s6:6356`) skips kind 15 unless asked for it
by name (quirk Q25).

### 2.10 SCRchSched::calcMe (`s6:AB68`) — priority 11999: research (decoded 2026-10-11)

Every operational lab (group 17 HotLab 1–2, group 18 UGLab 1–3) runs
`Lab::produce` (`s7:C7B0`). Hot labs are not on SCFactory's skip list, so
SCFactory runs them a second time each turn (quirk Q28).

**Player** (DB type 8, ctor `s7:2112`):

```
+0x010 word remaining[131]   points left; -1 not started; 0 complete
+0x116 word discoveries[67]  count per discovery id (s7:25F0)
+0x19C word priority[5]      priority topics (s7:2622 add; s7:28DC find)
+0x1A6 word minTurns[131]    lab turns still needed, 25 at start
+0x2AC word worked[131]      worked on this turn; cleared by SCSetup (s7:2690)
```

The ctor sets every topic to -1 / 25 turns, except the roots, complete from
the start: 0 Top, 2 Applied Research, 3 Astronomy, 8 Biology, 26 Chemistry,
32 Planetary Sciences, 45 Computer Science, 58 Physics, 92 Social Sciences,
106 Humanities, 112 None, 114, 115, 119, 121 (advanced roots).

**Lab::produce**: topic `+0x20`; nothing for 0 / 112 None / 113 Pause. On
completion the lab goes to 112 — except 1 Basic Research, which restarts at
100 points (`s7:25D8`). Labs without a topic stay suspended (§2.9).

**researchStep** (`s7:23E2`): a topic at -1 takes its cost from the lab's
tree. Points per lab turn (`s7:2852`) follow **colony 1's** morale for every
player (quirk Q29): <250 1 on odd turns; <450 1 except every third turn;
<550 1; <750 1, 2 every third turn; else 2. +1 with discovery 30 "Multiple
AI(5)" for a priority topic. Points left never go below 0; the topic's
minimum-turns counter drops once per turn. Complete only when both are 0;
until then the points are held at 1. On completion: the discoveries
(`s3:6CF8`), the effects (`s7:26AC`), and the priority slot is freed.

**Effects** (`s7:26AC`, on all of that player's colonies): 10 Pharmacology,
16 Anatomy, 17 Comparative Physiology, 19 Immunology: every death chance −1
(min 1); 18 Embryology: infant death chance −25 (min 1); 95 Psychology,
101 Social Stratification, 102 Cultural Change, 107–111 the humanities:
morale +25 (max 1000).

**Discoveries** (`s3:6CF8`, translated in `rebuild/src/sim/research.cpp`;
`tools/ne-analyzer/research_switch.py` walks the switch and writes
`reference/outpost-exe/research-discoveries.json` for checking): most topics
grant fixed discoveries; four shared blocks grant more once whole topic
groups are done (e.g. discovery 17 when 23, 24 and 25 are complete).
Discoveries always go to **player 1** (`s3:A69C` looks up 0x08000001),
whoever did the research (quirk Q30). Discovery 1 Basic Research lowers every
started topic shown above 25 by 5 (not below 25); every other discovery is
counted and, for 10..65, upgrades the build menu (`s3:ABD2` replaces the
offered type of a chain with the next one, e.g. Tokamak → Tokamak2; some
enable types directly via `s3:682E`, some need discovery 37 too). The build
menu (registry 0x35) is UI state, not decoded further yet.

### 2.11 SCEvent::calcMe (`s6:74E4`) — priority 4999: events (decoded 2026-10-11)

Seven handlers, in order:

1. **Hot lab accidents** (`s6:7FB6`): turn > 11 and turn % 50 == 0. Each
   operational hot lab with a topic: `random(1,100)` ≤ 5 (≤ 20 on
   Medium/Hard) and no DIRT within 4 → incident.
2. **Nano incidents** (`s6:7C4E`): Medium/Hard, turn > 2 and
   (turn − 2) % 20 == 0. Each operational Nano: chance 25, or 6 (Medium) /
   12 (Hard) with DIRT within 4 (checked before the draw).
3. **Tokamak meltdowns** (`s6:7DFC`): Medium/Hard, turn > 3 and turn % 20 ==
   0. Each operational Tokamak: ≤ 5 (Medium) / 30 (Hard), then no DIRT
   within 4 → incident.
4. **Morale crisis** (`s6:76DA`): on the scheduled turn, `PostMessage(
   WM_COMMAND 0x106)` opens the crisis dialog; the schedule is cleared (§2.7).
5. **AI advisor** (`s6:767E`): with Multiple AI, every 100 turns (registry
   0x40, `s2:B78A`; UI).
6. **Plague** (`s6:75BC`): only when turn % 123 == 0 and turn ≥ 150: every
   colony (rebels too) catches it with 5% (`s8:362E`: 20 turns, 40 with a
   UG Medical Center (group 31, any state); log 0x38), then every colony
   ticks (`s8:3698`): untreated = people − treated; medicine is warehouse
   item kind 15, `(untreated + 3) / 5` units wanted, 5 people per unit;
   then `(people − treated) / turns left` die (at least 1), oldest first.
   Because the tick sits inside the 123-turn check, a plague advances once
   every 123 turns (quirk Q31); over-treatment still kills one (Q32).
7. **Calendar** (`s6:78B8`): turn 5 colony 2 is named "Rebel" (DGROUP
   0x4FFC); turns 15–21 and 152 drive the interface (`s5:A54C`, `s5:A49A`);
   every 125 turns a 25% roll removes a kind-4 robot from colony 1
   (`s8:43CC`); turn 61 (not on Beginner) every colony returns to the gentle
   death tables (`s7:34DA`) — the manual's "first 60 turns" — alert 0x10;
   turn 150 the seed modules and landers (group 37) of colonies 1 and 2 are
   wrecked (`s6:780C`), alert 0x1D; turn 300 alert 0x0F. On Medium/Hard the
   8 scheduled disasters (registry 0x2F `+0x34[1..8]`) strike on their
   turn: kinds 1–6 always, 7 with 50%, 8 with 25%; 7 and 8 reschedule
   (+110..120 / +100..110).

**Incidents** (base `s6:6AF2`, priority 4999; hot lab `s6:8698` logs 0x1D):
the target is wrecked (slot 9), then every building on the 8 tiles around
it, except terrain (1–9) and robots (115–121) (`s6:6B40`, `s6:6D24`).
**Wreck** (slot 9, `s6:B514`): needs record freed, state 7, the tile's Bas
and Alloc ledgers and linked objects cleared; Tokamak, SpacePort, Core and
mine overrides also reach the structure's lower level (not decoded).

**Scheduled disasters** (`s6:90E6`, calcMe `s6:9114`): kinds 1–6 only post
a log message (0x16, 0x17, 0x18, 0x1B, 0x1F, 0x24) — no damage code exists
for them; kind 7 reschedules itself (+110..130) and with 50% removes a
kind-5 robot (`s8:4900`) and logs 0x2C; kind 8 reschedules (+100..120) and
its 25% check reuses that 0..20 number, so it always removes a kind-2 robot
(`s8:43CC`) and logs 0x2D (quirk Q33). Kind 7 is thus gated twice (50% in the
calendar, 50% in the step).

### 2.12 Units, the future-step list and the build menu (decoded 2026-10-11)

**Units** (DB type 6, created by `Db::create` `s6:E2E0` from `s7:7C50`):
robots and trucks, linked to a tile's container `+0x1E`; `+0x0C` is the
unit's kind, a **product A id**. Product A names (`s5:C222`): 1 Dozer,
2 Digger, 3 Miner, 4 Truck, 5 Explorer, 6 PowerSat, 7 Fuel Cells,
8 Repair Robots, 9 Air Robots, 10 Micro Robots, 11 Law Robots, 12 Humanoid
Workers, 13 Road Materials, 14 Robot Spare parts, 15 (string 1008, missing;
"Meteor Defense System" unlocks it), 16 NavSat, 17 Solar Power Sat,
18 Orbital Observer, 19 Weather Sat. The factory special case (product A 12
adds a person) and the research names below confirm the mapping.

* `s7:7C50(tile, n, kind)`: n units, reusing empty container slots first
  (`s7:1E96`); kind 4 also adds n to tile `+0x34` (trucks for the manual
  routes). `s7:6E9C(tile, n, kind)` destroys n of them and empties their
  slots, but never lowers `+0x34` (quirk Q37). `s7:730A` destroys them all
  (wreck).
* Colony `+0x14E[21]` counts the colony's units per kind (in
  `Colony_sumTileLedgers`), `+0x1A2[21]` those busy (writers not found);
  `s8:53BA` = count − busy.
* Explorers are not units: colony `+0x20E` counts them, at most 10
  (`s8:48E0`), −1 by `s8:4900`.
* `s8:43CC(colony, n, kind)`: explorers lose one (whatever n); otherwise, if
  any is available, the count drops by n and each RoboCmd (group 30, any
  state) gives up robots of that kind (`s7:CF78`) until n are gone. The
  calendar (every 125 turns, 25%) takes a Truck from the first player
  colony; disaster 7 an Explorer, disaster 8 a Digger from colony 1.

**RoboCmd** (types 56/57, ctor `s7:C9E4`): ten 12-byte robot slots at
`+0x20` (`+0` expiry turn, 0 = free; `+4` product; `+6` flag: 0 for
Dozer/Digger/Miner/Truck/Humanoid Workers, else 1, `s7:D340`), and `+0x98`
the next kit wanted (starts at 1; `s7:D56A` cycle 1, 2, 3, 4, 12, 8, 9, 11, 5).
* `receive(kit)` (`s7:D180`): first free slot, expiry = turn + 200; an
  Explorer goes to the colony count, anything else becomes a unit on the
  RoboCmd's tile.
* `produce` (slot 12, `s7:D26C`, run by SCFactory): a robot past its expiry
  is renewed for 200 turns (`s7:D3B2`) if a Repair Robot is in another slot
  here or in another operational RoboCmd of the colony, **and** an
  operational warehouse gives up one Fuel Cell (product 7); otherwise it is
  lost (unit destroyed / explorer count −1).
* `constructTick` (slot 14, `s7:CAC2`): the first RoboCmd ever completed
  (DGROUP `0x5812`) takes the Dozers, Diggers, Miners and Trucks on the
  colony hub (colony `+0x10`), then receives Trucks until it has 4.
* Slot 22 (`s7:CA26`, kill path) and slot 17 (`s7:D230`, all slots used)
  are noted, not modelled.

**Warehouses** (types 58/59): items `{+4, product A +6, product B +8,
quantity +0xA, units +0xC}`; hold 100 units: full at ≥ 100 (`s6:6822`), room
`100 − stored` while operational (`s6:62C8`); `add` (`s6:6408`) merges into
every item with the same `+4/+6/+8`, else appends; `takeA` (`s6:6228`) and
`quantityOfA` (`s6:6744`, first item only) work on product A.

**Future steps.** `Sim::schedule(turn, step)` (`s7:8372` → `s6:D52C`) asks the
step's `shouldRun` and keeps a clone in a list in descending turn order
(`KeyedList::insertDescending`). At the end of `Sim::enqueueTurnSteps`,
`s6:D6B2` moves the list's *head* (its latest turn) into the queue while it
is due, without `shouldRun` (`s6:D742`). The two callers (SCMove's ore
trucks, a trade step `s2:E164`) both schedule for the next turn.

**Build menu** (registry 0x35, ctor `s3:6700`): offered building types
(`+0x0A`, 138 words) and factory products (`+0x11E`, 21 words), and a word
`+0x148` (0x33). At the start: types 20, 27, 30, 34, 37, 42, 47, 49, 53,
55, 56, 58, 60, 76–79, 82, 84, 87, 90, 91, 93, 101, 104, 108, 122–127;
products 1–5, 7, 13. `s3:ABD2(chain…)` upgrades a chain of versions: the
first offered one is withdrawn and the next offered. Discoveries
(`s3:A69C`, after recording them) change it:

| Discovery | Change |
|---|---|
| 10, 12 | AgriDome 27 → 28 → 29 |
| 16 Terraforming | offer TerraForm 45; with 37 also → 46 |
| 18 | monorail 22, 23, 24, MonoXFormer 64, MonoStation 63 |
| 19 | Smelter 53 → 54 |
| 25 | `+0x148` = 0x34 |
| 26 Space Program | SpacePort 15 |
| 28 Mass Driver | Mass Driver 17 |
| 29, 36 factory increases | Fact 30 → 31 → 32, UGFact 91 → 92 |
| 30 Multiple AI(5) | five AI managers (`s2:B69C`, "AI Name #%d") |
| 34 / 35 | products Repair Robots 8 / Humanoid Workers 12 |
| 37 Tech Level Advance | every chain up one, `+0x148` = 0x34 |
| 41 | comm towers 37 → 38 → 39 |
| 42 / 54 / 57 / 58 / 59 | products 15 / 19 / 16 / 17 / 18 |
| 43 Geothermal Power | UGGeoTherm 110 |
| 48 | UG university 84 → 85 → 86 |
| 51 Improved Police | police 49 → 50, UG police 108 → 109 |
| 55 Nanotechnology | Nano 44 |
| 56 Hot Lab Facility | hot lab 40; with 37 also → 41 |
| 60 Tokamak Level Advance | Tokamak 20 → 21, UGTokamak 98 → 99 |
| 61 Administration Facility | UGAdmin 102; with 37 also → 103 |
| 62 / 63 / 64 / 65 | UG labs 93→95, SPEW 34→36, UG commercial 87→89, UG residences 79→81 |

**More `produce` overrides** (SCFactory): **SeedCommand** (`s7:C10E`; type
55 is on SCFactory's skip list, so only the SeedCommand gets here) spends
one life (`+0x24`) a turn; with none left it sets its own type to 55, a
Command with no life, which neither keeps the colony alive nor makes power
(Q43). **TerraForm** (`s6:4ACA`; five words `+0x20` set in the
"Terraforming Control" dialog 343: atmospheric generation, CFC, oxygen,
nitrogen, carbon dioxide): with the first one on, `s7:2A2C` runs on the
current planet: `+0x18` ("Turns Required to Terraform", 10000) −1, `+0x16`
0 → 1, `+0x1A` 0 → 2; at 0 `+0x16` = 2, `+0x1A` = 1 and log 0x21 — on every
call from then on (Q44). Each facility counts, so n facilities are n
turns a turn.

**SCKillBldg** (ctor `s7:E4FA`, priority 16000, `shouldRun` 1): `calcMe`
destroys the object (`s6:E332`). SCInternalPutBldg (`s6:8920`) queues it
for the building it replaces, so the old one disappears as soon as the
running step ends.

### 2.13 SCEndSim::calcMe (`s6:6FF6`) — priority 999 (decoded 2026-10-11)

1. Some populated player colony exists and none has anyone left → log 6.
2. No colony belongs to player 1 while colony 1 exists → DGROUP `0x4FE8` =
   1 (game lost; read by the UI) and alerts 1–5, 7, 8 and 10 are switched
   off (`s3:089E` clears their word in the table at DGROUP `0xE28`).
3. Victory: player 1 has topics 4 Astrophysics, 42 Extraterrestrial
   Mining, 75 Orbital Mechanics, 84 Heavy Lifter, 44 Mathematics, 60 Wind
   Tunnels and 61 Spacecraft Testing and Analysis (`s7:2242` = 0), and the
   player colonies have an operational Mass Driver (group 34) and SpacePort
   (group 36), not necessarily in one colony (`s6:740C`) → log 0x14. The
   loop goes on, so the message repeats for every later player colony (Q36).
4. With colony 1:
   * **Trade agreements** (registry 0x3B, list `+0x0A`, agreements made by
     `s2:E164`): each in state 2 or 3 is asked whether it lapses
     (`s2:E9A4`: older than 10/30 turns on Beginner/Easy, 20/40 Medium,
     30/50 Hard — the shorter with `+0x12` set — then 50% for state 2, 25%
     for state 3), and the answer is dropped (Q35).
   * **Trade market** (registry 0x3C, ctor `s4:331C`, which draws
     `random(8, 12)` into `+0x13C`; dialogs 384 "Trade", 389 "Trade
     Session", 402 "Trade Counter Offer"): prices are `base + base × swing /
     100` (`s4:427C`); the swing `+0x142` (`s4:3D6C`) goes 0 → ±10 → ±20 →
     ±30, one step a turn, and back to 0 from ±30 on a turn divisible by 5.
     From 0 it goes up on Beginner/Easy, down on Hard, and on Medium down
     when `random(1, 100) >= 50`.
   * **Trade, decoded 2026-10-20** (for the improved rebels, I-block of
     the UI session). An agreement (class at `s2:DC90`, 0x14 bytes) joins
     two colonies: `+4`, `+8` colony handles (found by name, `s8:4D28`;
     `s2:E852` name → colony, `s2:E8CC` the agreement of two names in
     either order), `+0x0C` state, `+0x0E` turn, `+0x12` flag. States
     (`s2:E320`, strings 1091–1094): 0 and 2 "No diplomatic contact", 1
     "Trade agreement", 3 "Hostile"; a pair of the same name or "None"
     (string 0x531) gives 1091. Proposing (`s2:E164`, from dialog proc
     `s8:C672`): no agreement → a new one in state 1 at this turn; state 1
     → nothing; 2 or 3 → state 1 with `+0x12` = 1. Either way a step
     (ctor `s7:E2BE`, calcMe `s7:E410`) runs next turn: the second colony,
     unless it has a Trade center (type 33, `s8:4FD8`), puts one down by
     the rebels' AI (`s5:A43E`/`s5:A49A`) with X tubes 122 at its hub
     (+2, −3) and (+3, −2) and the Trade center at (+3, −3). The dialog's
     lists (`s2:E3EC`): the first lists every colony not of player 2, the
     second every colony. Only states 2 and 3 can lapse (above); nothing
     in v1.51 sets 2 or 3 on an agreement (the `+0x0C` = 2/3 writes in
     `s4:47C8`/`s4:4808` are market list entries, another class).
     Market prices (`s4:427C`): `unit × quantity (+0x132)`, then
     `+ that × swing / 100`. The unit by the market page (`+0x12E`) and the
     item (entry `+0x0E`): page 392 resources (`s4:456A`): 17–21 → 2, 22
     → 3, 23–28 → 1, 29 → 4, 30 → 3, 31–32 → 1, 33 → 4, else 1; page 395
     (`s4:45D4`): 3 → 22, 4 → 23, else 20; page 396 products (`s4:451E`):
     7 → 9, 8 → 10, 12 → 25, 13 → 3, else 8. The exchange itself (counter
     offers, dialog 402; `s4:3710`, `s4:3EE6`, `s4:435E` which picks from
     the DGROUP table 0x411C at random) is not decoded.
   * Each player colony's table of operational RoboCmd tiles (`+0x210`,
     `s8:3BA0`) is rebuilt.

### 2.14 SCMove::calcMe (`s8:0C00`) — priority 9999 (decoded 2026-10-11)

For every colony (rebels included), in this order:

1. **Robot kits** (`s8:0E78`): every operational RoboCmd visits every
   operational warehouse (`s8:0E00`) and asks for kits (`s8:0D8E`): once
   round its cycle from `+0x98`, taking one kit of each wanted product the
   warehouse has, while it has free slots; each becomes a robot
   (`receive`).
2. **Factories → warehouses** (`s8:1220`): factories (group 5), then UG
   factories (group 6) unless the first ones found no warehouse with room
   (`s8:11B0`). For each factory (`s8:0F8C`), each operational warehouse in
   turn: a full one is dropped from the list; otherwise its room `take` is
   read once and every output item may move `n = take / unitValue` units
   (whole item if `n ≥ quantity`), so a warehouse can end up over 100
   (Q38); a partly moved item loses `take` from its units, not `n ×
   unitValue` (Q39). Items are merged into the warehouse (`s6:6408`).
3. If the colony has smelters (group 1):
   * **Mines → smelters**, only with automatic trucking (game option `+0x82`,
     on by default; `s8:19A0`/`s8:16F2`): each operational surface mine
     (group 2) with trucks on its tile (kind-4 units, `s8:1A30`) moves up to
     50 per truck of the ore on its tile, ore by ore from its cursor (mine
     `+0x20`, `s6:0D80`: returns it and moves it on, 4 → … → 13 → 4, anything
     else → 4), into the smelters in turn (room = 1000 − stored unless full,
     `s6:3C32`). The loads arrive next turn: **SCMoveBas** (ctor `s7:E8A0`,
     priority 10000, scheduled for turn + 1 by `s8:1AC6`) adds the load to
     the tile's Bas if a building of the same type is still there
     (`s7:EA50`; storage tanks would take only their room), and deletes it.
     A new mine's cursor is 0, which the loop's stop test never meets: with
     trucks but no ore on the tile it never ends (improvised guard I15).
   * **Smelters → storage** (`s8:1940`/`s8:1482`): the trucks on the current
     storage tank's tile (group 3) take up to 50 each from each smelter's
     output ledger (resources 14..28: life, metals, rare, fusion), into tanks
     holding 1000 units of anything on their tile (`s6:45E2`); unloaded at
     once (`s8:1B3A`).
4. **Manual truck routes** (`s8:1C3E`): tiles with trucks (`+0x34`) and a
   route (`+0x36`) send trips from smelters (`s8:24E8`), mines (`s8:26EE`)
   and factories (`s8:2306`) to the vehicle manager — map; not modelled.

### 2.15 SCAiInput::calcMe (`s7:E0D4`) — priority 10999 (decoded 2026-10-11)

The **AI managers** (registry 0x40, ctor `s2:AF94`; list `+0x0A` of five
entries `{+8 active, +0xA colony, +0xE emphasis, +0x10 step}`, made by
discovery 30) are assigned in the "Assign AI Managers" dialog (6227: AI,
colony, building emphasis; `s8:806A`). Nothing happens until player 1 has
discovery 30 "Multiple AI(5)" (`s2:B820`). Each active manager whose
colony's builder is idle (colony `+0x21A`, `s7:9ECC`; idle = no building,
or it is type 5/9 or past construction, `s7:9EF2`) builds the next group of
its emphasis and, on success, moves on (wrapping). The emphases (DGROUP
`0x58BE`, rows `{far ptr A, len, far ptr B, len}`; names strings 1753–1766)
use sequence A once player 1 has discovery 31 "No AI Problems", else B:

| # | Emphasis | A | B |
|---|---|---|---|
| 1 | Agricultural Center | 39 | 39, 21, 10 |
| 2 | Communications Complex | 21 | 21, 10, 39, 58 |
| 3 | Power Center | 41 | 41, 21, 10, 39 |
| 4 | Surface Industrial Park | 5 | 5, 11, 21, 10 |
| 5 | Underground Industrial Park | 6, 6, 28, 23 | 6, 11, 21, 10 |
| 6 | Surface Research Park | 17 | 17, 21, 21, 39 |
| 7 | Underground Research Park | 18, 28, 18, 18 | 18, 38, 38, 54 |
| 8 | Recycling Center | 10 | 10, 21, 24, 21 |
| 9 | Smelting Complex | 1 | 1, 21, 39, 24 |
| 10 | Storage Complex | 3, 4, 3, 3 | 3, 21, 24, 11 |
| 11 | Terraforming Complex (offered with discovery 16) | 29 | 29, 21, 39, 24 |
| 12 | Resort Area | 55, 54, 38, 23 | 55, 26, 18, 26 |
| 13 | Bedroom Community | 14, 14, 14, 55 | 14, 26, 26, 26 |
| 14 | Shopping Mall | 23, 6 | 23, 26, 14, 18 |

The values are building groups; "AI problems" are the extra comm towers,
SPEWs and police of the B lists. The step index is shared by both lists,
so after the switch to a shorter A list it reads past its end into the
following words of DGROUP once before wrapping (Q40). Building
(`s8:35A8` → `s7:9F40`): the group's first type the build menu offers
(`s2:C646`), placed by a map search (`s7:A278`, which may also lay a
connection; underground types continue in `s7:A044`) through
SCInternalPutBldg — map, improvised (I18).

### 2.16 SCRoboMove::calcMe (`s8:290E`) — priority 14999 (decoded 2026-10-11)

1. `s8:4918(colony 1)`: **explorers reveal mine sites**. The site (colony
   `+0x08`) keeps a list of hidden mine positions (`+0x10`: 6-byte entries at
   `+0x16`, next index `+0x1A`, count left `+0x1C`). With 1–10 explorers,
   every `32 − 2 × explorers` turns (30 … 12) the next position is taken;
   unless a building other than terrain (types 1–9) stands there, a DisMine
   (type 16) is put on it (SCInternalPutBldg, immediately).
2. `s8:7A76`: the vehicle manager (DGROUP `0x5A64`) advances truck trips
   (list `+0`: `s8:6A0E`, finished ones removed `s8:6B3C`) and robots (list
   `+4`: `s7:AFFC`) over the map. Trips come from manual routes and robots
   from the player's orders; not modelled.

## 3. Colony economy

### 3.1 Colony_sumTileLedgers (`s8:5464`)

Called by SCSetup and SCPrelimAlloc for every colony.

```c
Colony_resetTotals(c);                    // s8:56BA
Colony_resetX(c);                         // s8:57C0 (TODO)
for tileHandle in c->tiles:               // container at +0x0C
    tile = resolve(tileHandle)
    for (res, v) in tile->Bas:
        if (v) Colony_addTotal(c, v, res) // s8:5694
    for bh in tile->buildings:            // container at tile+0x1E
        c->bldgCount[resolve(bh)->type]++ // +0x14E
pop = c->population                       // +0x1F6
people = Pop_group(pop, 3) + Pop_group(pop, 4)        // s7:38F2
if (people == 0) people = Pop_group(pop, 2)
people += pop->field_170
Colony_addTotal(c, people, People)
```

(Population group meanings are TODO; strings 1072–1074 are Students,
Workers, Scientists.)

### 3.2 SCPrelimAlloc::calcMe (`s6:A73C`) — priority 2999

```c
for c in db.iter(type 4):
    Colony_sumTileLedgers(c)              // s8:5464
    Colony_step2(c, 0)                    // s8:56D6 (TODO)
    Colony_step3(c)                       // s8:518C (TODO)
```

### 3.2a Colony_step2 (`s8:56D6`) and resets

```c
memset(c->alloc, 0, 0x94);          // long alloc[37] at colony+0xBA  (s1:4906 = _fmemset)
if (flag)                           // 1 from SCSetup, 0 from SCPrelimAlloc
    for tile in c->tiles: Tile_freeAlloc(tile)   // s7:72D0: delete tile->Alloc table
```
`s8:56BA` clears `long total[37]` at colony+0x26; `s8:57C0` clears the
building counts at +0x14E (0x54 bytes). `Colony_addTotal` (`s8:5694`):
`c->total[res] += v`.

`Colony_available(c, r)` (`s8:540A`) = `total[r] - alloc[r]`, or 0 when
`alloc[r] >= total[r]` (unsigned). `Colony_alloc(c, v, r)` (`s8:5770`):
`alloc[r] += v`.

### 3.2b Colony_allocate (`s8:518C`) — called by SCPrelimAlloc

```c
if (c->field_206) return;                     // allocation disabled flag
for tile in c->tiles:
    b = tile->building                        // s7:73A8
    if (b->state != 5 && b->state != 4) continue;   // operational, or state 4
    req = b->info                             // far ptr at building+0x14
    if (!req) continue;
    for (res = 17; res <= 36; res++) {        // refined materials .. Power, People
        if (c->field_204 && res != Power && res != People) continue;
        if (req->need[res] <= Colony_available(c, res))   // s8:540A
            Colony_alloc(c, req->need[res], res);         // s8:5770
    }
```
So each building's per-resource need (build needs while constructing,
running needs while operational) is granted only if the colony has enough
left; there is no partial allocation, and earlier tiles win. When
`colony+0x204` is set, only power and workers are allocated. Which
buildings actually run is decided earlier in the turn by SCProdSched
(§2.9), from `available = total − alloc` after SCSetup has cleared `alloc`;
the grants made here are read after it (SCEndSim and the reports, TBD).

### 3.2c SCFillResources is a cheat

`s5:493C` (a window command handler) shows a confirmation with strings
1579 ("Are you sure you want unlimited resources for this game? This is
cheating in its most pure and unadulterated form...") and 1403 ("Outpost")
and only then creates `SCFillResources`. It is the unlimited-resources cheat,
not a simulation step. The same handler creates SCForceMorale, SCKillColony
and SCKillRebelColony, which look like debug/cheat commands too (inferred).

### 3.3 Seed starting stock (`s6:3246`)

Called by the Seed's construction tick when it lands (`s6:2E40`). Everything
goes to the colony **hub** tile (`colony+0x10`), not the Seed's own tile:
units 1 Dozer, 1 Digger, 1 Miner, 1 Explorer (as a unit), plus 4 Trucks when
automatic trucking (option `+0x82`) is **off**; then `Tile::addBas` 200 each
of MetalA–D (17–20) and MinA–C (23–25), 20 each of PrecA–B (21–22) and
FusionA–C (26–28). A rebel Seed also sets up the rebel AI (`s5:A43E`,
`s5:A89E`, not decoded). (Corrected 2026-10-12: earlier text said "on the
seed" and left out the units.)

### 3.3a Tile order (the colony's tile list)

The colony's tile list (`+0x0C`, class `s5:C444`) holds (tile, key) entries,
the key being DGROUP `0x4EA4[building type]`: Nano 1, power plants 2, solar
receiver 3, UGGeoTherm 4, Chap 5, SPEW 6, smelters 7, storage 8, warehouses 9,
surface mines 10, agri domes 11, UG residences 12, Command/SeedCommand 13,
RoboCmd 14, …, terrain/UG mines/robots 35. It starts with 200 empty slots and
grows by 100. `add` (`s5:C5B4`) fills the first empty slot and marks the
list; every access (`s5:C54A`, find `s5:C6DE`) first re-sorts a marked list
with the C runtime's qsort (`s1:4AEA`, port in `rebuild/src/sim/msvc_qsort.hpp`,
comparator `s5:C7FA` = a.key − b.key; not stable, Q47). Tiles are never
removed; the colony's own add (`s8:5860`) skips tiles already listed, but
TUTOR.OPS holds duplicates (6 in colony 1, Q49). SCInternalPutBldg adds a new
tile before its building exists (key 0, `s8:5860` via slot 2);
`Tile::setBuilding` then sets the real key in place (`s8:4B20` → `s5:C4F4`)
without marking the list (Q48).

### 3.4 Building overrides found in the 2026-10-12 review

A diff of every building vtable against the base (`s6:CF6A`) found
overrides the earlier passes had not covered. Size-4 methods are empty
stubs (`retf`), which behave like the base for `mine`/`produce`/`power`
but not for `onStateEntered` or the construction tick.

Placement (SCInternalPutBldg `s6:8920`): tile `+0x14` = 5, or 6 underground,
unless the type is terrain (group 49) or step `+0x11C` is set; old building
to SCKillBldg; create; slot 8; **slot 6 with arg 1** (`s6:8BF9`). Arg 0 is
the player's own placement (SCPutBldg). Base slot 6 (`s6:BD38`) reserves
from the **BLDGBLD table** (`s7:4BBE`), not the building's copy.

| Class | Override | Behaviour |
|-------|----------|-----------|
| Terrain | slot 8 `s6:48FA` | `setState(0)`; onStateEntered/mine/produce empty |
| Destroyed | `s5:D8B2..D8C2` | mine, produce, power, construction tick, onStateEntered all empty |
| Fact 1-3, SeedFact | cTick `s6:0550` | finished: 1 Truck on its tile (`s7:7C50(tile, 1, 4)`) |
| UGFact 1-2 | cTick `s6:5570` | Factory's, plus a second Truck |
| Storage 1-2 | cTick `s6:45B0` | finished: 2 Trucks |
| UGUniv 1-3 | cTick `s6:5F30` | finished: `+0x20` = 100, +100 with research 97 |
| SpacePort | cTick `s6:4194` | finished (not rebels): alert 0x0E |
| Roads | cTick `s7:D994` | base tick that also needs a Road Materials kit (product 13) from any colony warehouse (`s7:DACE`), taken after paying (`s7:DA22`) |
| SeedSmelter | isFull `s6:36BC` | one sum over resources 4..28, full at 250 |
| SolrPwrRecvr | slot 6 `s6:43C2` | base; arg 0: off the mothership (`s3:988C`) |
| Tokamak | slot 6 `s6:4DB2` | only group 41 (19–21): base; arg 0 and type 19: off the ship; then puts the UG part (type 98) below (map) |
| CommandCenter | slot 6 `s7:C2FA` | SeedCommand: nothing. Command: base, then founds its colony from the parent colony (`+0x20`): people, resources, robots (needs the new-colony path) |
| ColonistLander | slot 6 `s5:CE32` | tile `+0x14` = 1 (`s6:09B8`), no needs; not rebels: off the ship, log 9 |
| CargoLander | slot 6 `s5:CA36`, cTick `s5:CA82` | as the colonist lander without the log; finished (not rebels): unload `s5:CAC2` |
| Seed | slot 6 `s6:2E84`, cTick `s6:2E40` | tile `+0x14` = 1; arg 0: log 8, alerts 3 and 4, view (`s3:EC84`), ship arrival (`s3:9766`). Finished: deploy (`s6:2F18`: SeedPower 13 at (−1,−1), SeedSmelter 12 at (+1,+1), SeedFactory 14 at (−1,+1), SeedCommand 11 at (+1,−1), XPipe 122 at (0,−1), (+1,0), (0,+1), (−1,0), each through SCInternalPutBldg, whose work is its shouldRun `s6:8920` (priority 1000), so they stand at once; then the colony's hub is the tile at (+1,−1)), starting stock (§3.3), alert 5 on |
| Trade | slot 6 `s6:5128` | base, then puts UGTrade (111) below (map) |
| MonoStation | cTick `s6:20B6` | base; finished: if a neighbour qualifies (`s6:21BA`), the monorail manager `s8:79B2` (map) |

**Mothership lists** (registry 8): `+0x0A` hold and `+0x0E` deployable, entries
`{+4 kind, +6 count}`. `s3:9FA6` returns the count of the *first* entry of a
kind; `s3:9F8C` reads `+0x0A`, `s3:9F72` reads `+0x0E`. `s3:988C` decrements
the first `+0x0E` entry, drops it at 0 and sets `+0x16` when the list empties.
So SCPop's "item 0x3E" is the ColonistLanders still aboard. `+0x12` lists the
cargo damaged on arrival (`s3:9FEE` appends `{kind, lost}`; `s3:9674` clears
it once shown).

* **Landers** (`s3:9794`, from a finished SeedCommand via `s7:C652`): only
  while `+0x18` is 0 (then set; not saved): the `+0x0E` list is deleted and
  made anew, and every hold entry of kind 62 (ColonistLander) or 65
  (CargoLander) moves from `+0x0A` to it (unlinked while the iteration goes
  on; the freed node's `next` is still read, inferred harmless).
* **Arrival** (`s3:9766`, when the player's Seed lands, `s6:2E84`):
  `+0x1A` = 1, cargo damage, then cryo `+0x1E` = 50 × count(`+0x0A`, 0x80).
* **Cargo damage** (`s3:A0A0`): divisor 4 if difficulty (DGROUP `0x13AE`)
  is 1 or 2, else 2. For each hold entry: kinds 62, 65 and 0x80 lose
  `count / 2` and are reported in `+0x12` with that number, or 1 when it is
  0 (quirk Q52); kind 18 loses `count / div` only above 2, kind 131 only
  above 1; every other kind loses `count / div`. 16-bit signed divisions.

**Cargo unload** (`s5:CAC2`, difficulty 1 treated as 2): hold kinds 18/19
move to `+0x0E` less ½ (Medium) or ¾ (Hard); kind 129 (Food) goes onto the
lander's tile less ¼ (Easy/Beginner), ½, ¾ and leaves the hold. 16-bit
signed divisions.

**Alerts** (`s3:089E(alerts, on, id)`): flags for ids 1..10 at DGROUP
`0xE28` (8-byte rows); EXE start values 1,0,0,0,0,0,1,1,1,0. The save stores
exactly these ten (`s3:0BF5` / `s3:0DB6`).

---

## 4. TODO (in order)

1. ~~What decides which buildings run~~ (SCProdSched, §2.9); readers of
   the PrelimAlloc grants
2. ~~`Mine::mine` `s6:134A`, Smelter/Factory/Spew/Lab produce~~; TerraForm
   and Command `produce` overrides
3. ~~Every per-turn step~~ (§2.1–§2.16, 2026-10-11). Left: the map (sites,
   grids, SCInternalPutBldg's new-tile path `s6:8920`, the AI's placement
   `s7:A278`, the vehicle manager `s8:7A76`, manual truck routes `s8:1C3E`),
   planet/site setup (disaster calendar, hidden mine sites), building slot
   22, the colony unit "busy" counts (`+0x1A2`)
4. Save chunk layouts (`.OPS`), to load TUTOR.OPS into the model
5. Group table `g_bldgGroups` (`[0x6E0]`) contents (group 0x0C = power, 0x28 = underground)
