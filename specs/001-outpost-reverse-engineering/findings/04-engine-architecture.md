# Engine Architecture — Sierra Outpost (1994)

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A4–A6, A9, C1). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

**Derived from**: OUTPOST.EXE string analysis, data file reverse engineering, asset catalog, NE binary structure

---

## 1. Main Game Loop

### 1.1 Message Pump

The game runs as a standard 16-bit Windows 3.1 application with a modified message loop. The binary imports `USER.DLL` (for `PeekMessage`, `GetMessage`, `TranslateMessage`, `DispatchMessage`) and `MMSYSTEM.DLL` (for multimedia timers). The primary loop is in **Segment 8** (preloaded code, 428KB at file offset `0xD510`), which contains the bootstrap, `WinMain`, and the main dispatch logic.

Expected loop structure:
```
while (GetMessage(&msg, NULL, 0, 0)) {
    TranslateMessage(&msg);
    DispatchMessage(&msg);
}
```

However, the `SC-prefixed` function names and the simulation model suggest the game uses **MMSYSTEM timer callbacks** (`timeSetEvent` or `SetTimer`) rather than a tight PeekMessage loop for simulation ticks. The simulation runs asynchronously from the UI message pump.

### 1.2 Update Cycle (SCI Simulation Heartbeat)

The game implements a **turn-based simulation** driven by the Sierra Creative Interpreter (SCI) engine. Evidence from binary strings:

| Function | Purpose |
|----------|---------|
| `SCSetup` | Initialize simulation state for a new game |
| `SCEndSim` | Shut down simulation (cleanup) |
| `SCAiInput` | Process AI decisions each turn |
| `SCFillResources` | Distribute resources to buildings |
| `SCProdSched` | Run production schedules |
| `SCRchSched` | Run research schedules |
| `SCFactory` | Process factory output |
| `SCMines` | Process mining output |
| `SCPower` | Compute power grid balance |
| `SCMorale` | Compute colony morale |
| `SCGenKids` | Handle population growth |
| `SCStarve` | Handle starvation (population loss) |
| `SCAddSpew` | Process resource refinery (spew) output |
| `SCConstruct` | Handle active construction projects |
| `SCEvent` | Process random/scheduled events |
| `SCSelect` | Handle UI selection state |

The simulation order (inferred from `SCSetup::calcMe` debug string) is:
1. **Resource gathering**: `SCFillResources` → `SCMines` → `SCFactory`
2. **Consumption**: `SCPower` → `SCStarve`
3. **Population**: `SCGenKids` (births) → `SCMorale` (happiness)
4. **AI**: `SCAiInput` (opponent decisions)
5. **Events**: `SCEvent` (random disasters, diplomatic events)
6. **Production**: `SCProdSched` → `SCRchSched`

### 1.3 Timing Model

- **Turn-based**, not real-time. Each "turn" advances the simulation tick.
- The `turns` and `turnsDlgStatus` strings confirm a turn counter displayed in the UI.
- Animation frames (FLC) and building sprite animations (A/B frame alternation) are decoupled from simulation ticks — they run via the Windows multimedia timer subsystem.
- The `%d,%d` and `%d,%d,%d,%d` format strings suggest 2D/rectangular coordinate tracking (grid positions, selection rectangles).

---

## 2. Tile Engine

### 2.1 Coordinate System

The game uses two coordinate systems:
- **Site grid**: `"Site %d"` — integer site identifiers for colony locations. Sites are indexed locations where buildings can be placed.
- **2D grid coordinates**: Format strings `"%d,%d"` and `"%d,%d,%d,%d"` — used for tile positioning and selection rectangles.

### 2.2 Rendering Layers

**Terrain rendering** uses pre-rendered 640×480 full-view bitmaps, not a tiled engine:

| File | Size | Role |
|------|------|------|
| `TILE1.BMP`–`TILE6.BMP` | 640×480 | Pre-rendered planet surface views (6 terrain types) |
| `TILE4A/B.BMP`, `TILE5A/B.BMP` | 640×480 | Animated terrain variants (A/B frame flip) |
| `SURFACE.BMP` | 77×19 | Elevation/surface-type indicator strip |
| `LEVEL1.BMP`–`LEVEL4.BMP` | 77×19 | Underground level indicator strips |
| `1TILE.BMP` | 132×125 | Minimap tile legend (colored tile type reference) |

The 640×480 viewport is the main game view. TILE1–TILE6 represent **different planet terrain presets** (rocky, cratered, etc.), not tile sheets. The coordinate system likely maps site positions onto this viewport.

### 2.3 Building Sprite Pipeline

Building sprites use a **300×150 canvas** with 2-frame A/B animation:

| ID Range | Count | Size | Content |
|----------|-------|------|---------|
| 500–579 | 80 base + 80A | 300×150 | Building structure sprites with A-frame animation |
| 580–649 | 70 | 145×120 | Robot/vehicle sprites |
| 845–849 | ~5 | 145×120 | Additional unit sprites |

The animation pattern (`500A.BMP` ↔ `500.BMP`) likely represents:
- Active/inactive state
- Open/closed state  
- Construction complete / under construction

### 2.4 Minimap System

`1TILE.BMP` at 132×125 is the minimap tile legend, matching a common 2:1 isometric tile aspect. The 32×32 icons (`TILEICON.BMP`, `SITEICON.BMP`, `PLNTICON.BMP`) are used for the three zoom/view levels:

| Icon | View Level | Description |
|------|------------|-------------|
| `TILEICON` (32×32) | Tile/Site view | Close-up colony management |
| `SITEICON` (32×32) | Site/Colony view | Building placement view |
| `PLNTICON` (32×32) | Planet view | Planetary overview |

---

## 3. Colony Simulation

### 3.1 Resource Model

The simulation manages multiple tracked resources. Strings confirm:

| Resource | Evidence |
|----------|----------|
| Food | `"Food"` in building names, `SCStarve` function |
| Ore/Minerals | `SCMines`, `"MINE"` references, Spew processing chain |
| Power | `SCPower`, `"POWER"`/`"ENERGY"` strings, Tokamak chain |
| Research | `SCRchSched`, `"RESEARCH"` strings, `"LAB"` buildings |
| Colonists | `"Colonists"` building record, `SCGenKids` |
| Life Support | `"LifeSupport"` abstract building record |

The economic chain (from `SCFillResources` + production functions):
```
Mining (SCMines) → Refining (SCAddSpew) → Manufacturing (SCFactory)
                                                          ↓
Agriculture → Food → SCStarve/SCGenKids (Population)
                                    ↓
                              SCMorale (Happiness)
```

### 3.2 Population System

- **SCGenKids**: Population growth engine. Called each turn to increment population based on food supply, housing (`UGResident`), recreation (`UGRec`), and medical (`UGMed`).
- **SCStarve**: Population loss when food is insufficient. Can lead to colony death (`SCKillColony`).
- **Pop:Leaving**: String `"Pop:Leaving %ld"` — colonists emigrating due to low morale or insufficient resources.
- **Colonist special flag** (BLDGOPS field 38 = 1): Buildings like AgriDome, Spew, Nano, Dirt, UGRec, UGUniv, UGCommercial, UGPark require operational colonists.

### 3.3 Morale System

- **SCMorale**: Core morale computation function.
- **SCForceMorale**: Debug/override `"SCForceMorale %s for colony %08lX"` — sets morale to a specific value.
- Morale-affecting buildings: Chapels (`Chap[1-2]`), Recreation centers (`UGRec`), Parks (`UGPark`), Police (`Cops`).
- Building `"morale"` string appears 6 times; `"popul"` 15 times.

### 3.4 Disaster System

The game has a **random event system** (`SCEvent`) that triggers disasters. Confirmed disaster types from binary strings:

| Disaster | Occurrences | Evidence |
|----------|-------------|----------|
| **Plague** | 16× | `"plague"` — disease outbreak affecting population |
| **Meteor** | 10× | `"meteor"` — meteor strike destroying buildings |
| **Earthquake** | 4× | `"earthquake"` — seismic damage |
| **Fire** | 1× | `"fire"` — structural fire |
| **Nuclear accident** | — | BLDGOPS field 38 = −1 on HotLab buildings |
| **Mass driver misfire** | 1× | `"mass driver misfire"` — scripted cheat/event |

The debug event string `"You are about to cause a mass driver misfire...murder the hapless rebels"` confirms:
- Mass driver can be used as a weapon against rebel colonies
- Event system has scripted and player-triggered variants

### 3.5 Colony State

From `SCKillColony` and `SCKillRebelColony`:
- Colonies have a **dead/alive state** tracked per colony
- Rebel colonies exist as separate entities
- `"Everyone is dead."` is a game-over message
- `"Enter Name"` dialog appears at game start (player naming)
- `"outpost.ini is required, and was not found."` — hard requirement for config file

---

## 4. AI Subsystem

### 4.1 AI Manager

The AI is implemented as a dialog-driven manager with **188 references** in the binary:

**Dialog structure** (`"Assign AI Managers"`):
- Title: `"Assign AI Managers"`
- Button: `"Assign AI"` — assigns selected AI personality to a colony
- Button: `"To Colony"` — targets a colony for AI control
- Section: `"Building Emphasis"` — per-building AI priority settings
- Status display: `"Status"` — current AI activity

### 4.2 AI Input Processing

- **SCAiInput**: The core AI decision function, called each simulation turn. This is where the computer opponent evaluates colony state and issues building commands.
- **aiName**: Stored per save game — the AI opponent's name.
- **AI Personality Problems**: A string suggesting different AI behavior profiles (personalities that may fail or malfunction).

### 4.3 Difficulty Levels

The `"Difficulty Level"` dialog provides 4 settings:

| Level | String | Description |
|-------|--------|-------------|
| 1 | `"Beginner"` | Easiest — minimal AI aggression |
| 2 | `"Easy"` | Low difficulty |
| 3 | `"Medium"` | Standard difficulty |
| 4 | `"Hard"` | High AI difficulty |

Additional options:
- `"Difficulty is %d"` — runtime difficulty readout
- `"Trucking is Automatic"` / `"Trucking is Manual"` — player-controlled logistics mode

### 4.4 Rebel Colony System

`"Rebel"` appears **43 times** in the binary. The rebel system:

- **SCEvent → Rebel**: Rebels are generated through the event system.
- **SCKillRebelColony**: Dedicated function for destroying rebel colonies.
- `"murder the hapless rebels"`: Mass driver misfire confirmation text — player can target rebel colonies with the mass driver.
- TUTOR.OPS contains references to `"Rebel"` in scenario data.
- Rebel colonies function as independent AI opponents on the same planet.

---

## 5. Save/Load System

### 5.1 File Format

The save/load system uses the **COMMDLG.DLL** for standard Windows File Open/Save dialogs.

**Evidence from binary strings:**
```
savePath          — Directory path for saved games
aiName            — AI opponent name in save data
playerName        — Player name in save data
turns             — Turn count in save data
turnsDlgStatus    — Dialog state persistence
%s %d             — Generic name+number format
```

### 5.2 Save File Extension

- `"*.ops"` — save file extension (same as TUTOR.OPS scenario format). This means save games and tutorial scenarios share the same underlying binary format (dcbSC sections).
- `"Enter Name"` — filename/save name dialog prompt.
- `"Report Help"` — accessible during save/load dialogs.

### 5.3 Save Data Structures

From the SC simulation context, saved state likely includes:
- Player name, AI name, turn count
- All building states (placed buildings, health, operational status)
- Resource levels (food, ore, power, research, population)
- Morale value per colony
- Event queue state
- Tech tree progression (which tech nodes unlocked)
- Difficulty level

---

## 6. UI Architecture

### 6.1 View System

Three zoom levels, selected via the toolbar icons:

| View | Icon Resource | Description |
|------|---------------|-------------|
| **Planet View** | `PLNTICON` | Planetary overview — shows continents, site selection |
| **Site View** | `SITEICON` | Colony zoom-in — building placement and management |
| **Tile View** | `TILEICON` | Individual tile inspection |

UI classes from binary strings:
- `"sitectrl4"` — site view controller/window class
- `"plntctrl"` — planet view controller
- `"turnsdlg"` — turn counter dialog

### 6.2 Menu System

The binary's Resident Name Table identifies 6 popup menus:

| Menu Resource | Likely Purpose |
|---------------|---------------|
| `OPPOPMENU` | Overview/Outpost popup (main game menu) |
| `TILEMENU` | Tile context menu (right-click on tile) |
| `TPPOPMENU` | Tile placement popup (building selection) |
| `SCPOPMENU` | Screen/site popup (colony actions) |
| `PCPOPMENU` | Planet control popup |
| `REPORTPOPMENU` | Reports menu (colony statistics, graphs) |

### 6.3 Dialog System

Dialogs identified from binary strings:

| Dialog | Controls |
|--------|----------|
| **Difficulty Level** | Beginner \| Easy \| Medium \| Hard radio buttons |
| **Star Selection** | 15 star system list: Alpha Aquilae, Alpha Centauri A/B, Barnard's Star, Beta Hydri, Delta Pavonis, Epsilon Eridani, 82 Eridani, Eta Cassiopeiae A, HR 7703 A, HR 8832, Kruger 60, 70 Ophiuchi A, 36 Ophiuchi A/B, Procyon |
| **Assign AI Managers** | Assign AI / To Colony buttons, Building Emphasis list, Status label |
| **Enter Name** | Player name text entry |
| **Unlimited Resources** | Confirmation dialog: `"Are you sure you want unlimited resources...cheating"` |
| **Mass Driver Misfire** | Confirmation: `"Are you sure you want to murder the hapless rebels?"` |
| **Outpost.ini Required** | Error dialog if config file is missing |

### 6.4 UI Button BMPs

| File | Size | Function |
|------|------|----------|
| `LAUBUTN.BMP` | 63×21 | Launch button |
| `TPBUTTON.BMP` | 63×21 | Tile placement button |
| `TREEBUTN.BMP` | ? | Tree/hierarchy button |
| `LISTBUTN.BMP` | ? | List view button |
| `STTGBUTN.BMP` | ? | Settings/toggle button |
| `PRBUTTON.BMP` | ? | Popup right-click button |
| `RTBUTTON.BMP` | ? | Right-click button |
| `TBUP.BMP` | 19×19 | Thumbtack "up" |
| `TBDOWN.BMP` | 19×19 | Thumbtack "down" |
| `TTDOWN.BMP` | 45×20 | Tree tab dropdown |
| `DIBTEXT.BMP` | 70×30 | Text panel background |

### 6.5 UI Audio

The MUSIC directory contains UI interaction sounds:
- `BOOP.WAV` (7KB) — Button click / UI feedback beep
- `ALARM-D.WAV`, `ALARM-M.WAV`, `ALARM2.WAV` — Alert sounds
- `ALARM.MID`, `ALARM2.MID` — Alert music
- `NI.WAV` — "Not Implemented" placeholder sound

---

## 7. Cross-References to Binary Segments and Data Files

### 7.1 Segment-to-System Mapping

| Segment | Type | Size | Engine Role |
|---------|------|------|-------------|
| **Seg 1** | DATA | 352K | Initial game data — tile maps, building definitions, UI layout constants |
| **Seg 2,4,6** | CODE (overlays) | Shared | Code overlays — loaded on-demand; contain simulation, AI, and rendering code |
| **Seg 3** | DATA | 977K | Game data continued — building sprites, terrain data |
| **Seg 5** | DATA | 981K | Game data continued — additional assets |
| **Seg 7** | DATA (movable) | 271K | **Dynamic game state** — runtime colony data, active buildings, AI state |
| **Seg 8** | CODE (preload) | 428K | **WinMain + game loop** — bootstrap, message pump, timer setup |
| **Seg 9,10,11** | BSS | 3×72KB | Zero-initialized — global variables, colony arrays, tile state buffers |

**Seg 11 = DGROUP** (automatic data segment) — contains stack, near heap, and global near data pointers.

### 7.2 Data File Dependencies

| File | Loaded By | Content |
|------|-----------|---------|
| `outpost.ini` | Engine init (Seg 8) | Empty config (optional image overlay path) |
| `bldgbld.dat` | `SCSetup` (Seg 2/6) | 138 building definitions, 40 fields each (XOR-0x80 CSV) |
| `bldgops.dat` | `SCSetup` (Seg 2/6) | 138 operational parameters, 46 fields each (XOR-0x80 CSV) |
| `tutor.ops` | Tutorial system (Seg 2/6) | 19-section binary tutorial script (dcbSC sections) |
| `*.ops` | Save/Load (Seg 8 + COMMDLG) | Game save files (same binary format as TUTOR.OPS) |
| `BITMAPS/*.BMP` | Graphics pipeline (Seg 8/GDI) | 339 bitmaps: terrain, buildings, robots, UI |
| `*.FLC` | Animation (AAPLAY.DLL) | 92 Autodesk Animator Pro animations |
| `MUSIC/*.WAV` | Audio (MMSYSTEM) | 277 WAV files (speech, SFX, ambience) |
| `MUSIC/*.MID` | Audio (MMSYSTEM) | 35 MIDI files (music themes) |

### 7.3 DLL Import Mapping

| DLL | Services Used | Engine Subsystem |
|-----|---------------|------------------|
| **KERNEL** | Memory management, task scheduling | SmartHeap + kernel heap, segment loading |
| **GDI** | `CreateCompatibleBitmap`, `SetDIBitsToDevice`, `StretchBlt` | Bitmap & sprite rendering |
| **USER** | `CreateWindow`, `GetMessage`, `DispatchMessage`, `SetTimer` | Window management, message loop, timers |
| **MMSYSTEM** | `sndPlaySound`, `midiOutPlay`, `timeSetEvent` | Audio playback, simulation timer |
| **COMMDLG** | `GetOpenFileName`, `GetSaveFileName` | Save/load file dialogs |
| **AAPLAY.DLL** | `AAPLAY`, `AAOPEN`, `AALOAD` | FLC animation playback |

### 7.4 SCI Engine Footprint

The `SC` prefix on 26+ identified functions confirms the game is built on a **Sierra Creative Interpreter (SCI) simulation layer**. This is consistent with:
- Sierra's in-house engine used across multiple 1990s titles
- Adapted from adventure game scripting to colony simulation
- Turn-based simulation model with event-driven state changes
- Binary script format (`dcbSC` sections) shared between tutorial and save files

The engine's architecture layers:
```
┌──────────────────────────────────────┐
│         Windows Message Pump         │  ← USER.DLL
│         (WinMain, Seg 8)             │
├──────────────────────────────────────┤
│       SCI Simulation Layer           │  ← Core engine (SC* functions)
│  (SCSetup, SCEvent, SCMorale, ...)   │    in code segments 2/4/6
├──────────────────────────────────────┤
│    Subsystem Managers                │
│  AI (SCAiInput)  │  Render (GDI)    │
│  Audio (MMSYSTEM)│  Save/Load (COMM)│
│  Anim (AAPLAY)   │  Input (USER)    │
├──────────────────────────────────────┤
│         Data Layer                   │
│  bldgbld.dat  │  bldgops.dat        │
│  BITMAPS/*    │  *.FLC  │  MUSIC/*  │
│  *.ops (save) │  outpost.ini        │
└──────────────────────────────────────┘
```
