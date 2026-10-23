# 15 — Function map of OUTPOST.EXE (all functions, 2026-10-22)

Every function in the nine code segments now has a name and a one-line
purpose. Read this before opening a listing: it says which segment and class
hold what, and how to look a function up.

| Where | What |
|---|---|
| `reference/outpost-exe/function-catalog.csv` | One row per function: `addr,name,size,status,purpose,cited` (`cited` = the rebuild or the findings cite it) |
| `reference/outpost-exe/disasm/segNN.asm` | The listings; each function header now carries its purpose line |
| `tools/ne-analyzer/names/segNN.tsv` | Hand decodes: `addr<TAB>name<TAB>purpose`, with notes per segment at the top |
| `tools/ne-analyzer/names/seg00_auto.tsv` | 520 names made by `name_patterns.py`: virtual methods named from their vtable slot (building, step, view classes) |

Name precedence: hand files (`seg01..09.tsv`) > `seg00_auto.tsv` >
`symbols.json` > the disassembler's own names (`SC*` from name strings, API
fingerprints). A trailing `?` means the routine was identified by behaviour
(mostly C-runtime routines whose exact library name is uncertain).

## 1. Coverage

| | |
|---|---|
| Functions | **3,435**, all named (1,018 cited in the rebuild or the findings) |
| Code bytes | 506,515 in segments 1–9; **462,129 (91.2 %) decode as instructions** |
| The rest | 40,434 bytes of data in code segments (C++ vtables, switch tables, a few runtime strings) and 3,956 bytes of padding. No undecoded code remains: `undecoded.py` classifies every gap |
| New on 2026-10-22 | 57 functions reached only through far pointers stored in code (vtables, callbacks) or that start after padding. Each `names/segNN.tsv` lists them under "Found by the improved disassembler" |

The largest data blocks in code: `s4:9396` (12,325 bytes, the vtables of the
78 movie views, 39 slots each), `s5:96A2` (3,447 bytes, window and layer
vtables), `s4:D3AC` (2,340 bytes, the story pages' vtables), `s1:1B9A` (446
bytes, runtime error strings such as "Out of memory").

| Seg | Functions | Bytes | Cited | Holds |
|---|---:|---:|---:|---|
| 1 | 174 | 21,921 | 5 | Microsoft C 8 runtime (startup, stdio, qsort/bsearch, rand, time) and MicroQuill SmartHeap |
| 2 | 443 | 61,408 | 96 | App framework: `Op` app (vtable 051E), `OpWnd` main window (389E), SOL window classes (`SOLWndProc` s2:5632), DIBs and palettes, lists, timers, save-file chunk I/O, `SoundMgr` (5FC8), message log, AI managers, trade agreements, `MicroSpinControl` |
| 3 | 385 | 61,087 | 83 | Registry objects (`RegObj` s3:1D48, `Registry_get` s3:20BA), INI options, alerts, research trees, orbitals, mothership, build menu, picture/sound catalogue, building-window texts, planet window, current view, reports |
| 4 | 478 | 61,034 | 45 | View models (`MapViewModel` s4:0570 and the other registry models), the 78 movie views (`MovieView` s4:6A0E), story pages (`StoryPage` s4:C402), the trade market, the new-game screens (modes 3–9) |
| 5 | 393 | 61,370 | 107 | The game's windows (planet, site, star map, tile list, colony view with icon bar and panels), timed views, the Star System dialog, the rebels' AI, `SparseTable`, landers, robots and several building classes |
| 6 | 481 | 61,270 | 280 | Simulation core: SC steps (`SCBase` s6:D1DC, vtable 6AD2) and the step queue, events and incidents, placement steps, the `Building` base (vtable CF6A), units, the object database (create/select/destroy, `ObjectDb::save/load` s6:DCE2/DEF2), creators (`createStar/Planet/Colony` s6:EC36/ECAC/EDC4) |
| 7 | 418 | 61,302 | 228 | Object DB tables, galaxy/star/planet/site, players and research, population cohorts, the BLDGBLD/BLDGOPS loaders, tiles and site grids, the structure icon bar model, the AI builder, monorail trains, RoboCmd, robots, `Sim::runTurns` s7:83BA |
| 8 | 342 | 61,329 | 128 | Morale helpers, `SCMove` (trucking) and `SCRoboMove`, the `Colony` class (s8:30AA, vtable 6504), truck trips and the vehicle manager, the dialog container (`DialogCtr::open` s8:AF40) and many in-game dialogs |
| 9 | 321 | 55,668 | 16 | Dialog base `OPDialog` (s9:7728, vtable 840C), message box, building/report window bases (s9:B040/B082/B0BC), custom controls (`OPCtrl` 9800, `OPButton` A230), research tree views, every concrete dialog |

## 2. Class roots

| Vtable | Class | Notes |
|---|---|---|
| `s2:389A` | `Object` | Base of almost everything |
| `s2:051E` / `052A` | `Op` / `AppBase` | The application |
| `s2:389E` | `OpWnd` | The main window; WM_USER runs the turn |
| `s2:380A`, `9D2E`, `6378`, `6BFC` | SOL window family | `SOLWnd`, `SOLWndBase`, `DanWnd` (the "DanBrotherton" child window class), `SOLChildWnd`. **Not** buildings (see ERRATA §H) |
| `s3:2014` | `RegObj` | Registry object: +4 listener list, +8 id |
| `s6:6AD2` | `SCBase` | Step classes: slot 0 dtor, 1 `calcMe`, 2 `shouldRun`, 3 `clone` |
| `s6:CF6A` | `Building` | 26 slots, below |
| `s9:840C` | `OPDialog` | Modeless dialog base |
| `s9:B772` | building/report window base | |
| `s9:9800` / `A230` | `OPCtrl` / `OPButton` | Custom controls |

### Building vtable (`s6:CF6A`)

| Slot | Method | Slot | Method |
|---:|---|---:|---|
| 0 | scalar_dtor | 13 | power |
| 1 | setOwner | 14 | constructTick |
| 2 | (returns 0) | 15 | onStateEntered |
| 3 | save | 16 | isFull |
| 4 | load | 17 | isFullFlag |
| 5 | displayType | 18 | moraleEffect |
| 6 | reserveNeeds | 19 | opsWord9C |
| 7 | canPlace | 20 | providesLifeSupport |
| 8 | beginConstruction | 21 | isPowerSource |
| 9 | onWrecked | 22 | ownerChanged |
| 10 | resume | 23 | tubeRule |
| 11 | mine | 24 | rangeRule |
| 12 | produce | 25 | checkConnected |

142 classes override these (each has a `::scalar_dtor`). `seg00_auto.tsv`
names the overrides per class, e.g. `Tokamak::power`, `Mine::mine`,
`SeedFactoryFamily::produce`, `UGPark::mine`.

## 3. Registry ids (`Registry_get` s3:20BA, switch s3:276A)

One singleton per id, made on first use.

| Id | Object | Id | Object |
|---|---|---|---|
| 0x01 | Blinker | 0x2D | PlanetWindow (s3:3E3C) |
| 0x02 | Options (s3:5404) | 0x2E | ViewConstants (s4:1FF4) |
| 0x03 | Reports (s3:A1D8) | 0x2F | View (s3:E9E4) |
| 0x04 | ListModel04 (s4:2B10) | 0x30 | name text (s3:3702) |
| 0x05 | RegObj05 | 0x31 | UG research tree (s3:9298) |
| 0x06 | StarMapModel (s4:18B8) | 0x32 | ResearchResults (s3:6ABC) |
| 0x08 | Mothership | 0x33 | BuildingTree (s3:195E) |
| 0x09 | Orbitals | 0x34 | VehicleTree (s3:1B6E) |
| 0x0C–0x24 | MapViewModel, one per colony map window (s4:0570) | 0x35 | BuildMenu (s3:6700) |
| 0x27 | AnimTicker | 0x36 | StarChoice |
| 0x28 | PictureCache (s3:28E6) | 0x37 | MessageLog |
| 0x29 | PlanetArea (s4:229C) | 0x39 | PlanetPicker (s3:4A8A): the star's planets in a row |
| 0x2B | Alerts (s3:02E0) | 0x3A | AiAttitude |
| 0x2C | MoraleCrisis | 0x3B | TradeAgreements |
| 0x3C | TradeMarket (s4:331C) | 0x3F | RebelBuildOrder |
| 0x40 | AiManagers | 0x41 | research tree |
| 0x45 | WindowPlaces (s3:0000) | 0x46 | ColonyPair (s3:50B2) |
| 0x47 | RouteEdit (s4:56E6) | 0x48 | SysPalette |

0x07, 0x0A, 0x0B, 0x25, 0x26, 0x2A, 0x3D, 0x3E, 0x42 and 0x43 exist with
unremarkable models (listed in `names/seg03.tsv`/`seg04.tsv`). 0x38 and
0x44 have no constructor.

## 4. Dialogs by resource id

The dialog container (`DGROUP 0x5B7C`, factory `s8:AF40`) maps window modes
to dialog classes. Titles are the resource captions.

| Id | Dialog | Seg | Id | Dialog | Seg |
|---|---|---|---|---|---|
| 232 | Test of Sound Queue | 9 | 4010 | Ship Configuration Setup | 8 |
| 283 | AI Interface | 8 | 4011 | Laboratory | 9 |
| 318 | Interstellar Launch System | 8 | 4023 | Turns | 9 |
| 343 | Terraforming Control | 9 | 4024 | Select Dig Direction | 8 |
| 358 | Orbital Launch System | 8, 9 | 4025 | Name | 8 |
| 374 | Diplomacy | 8 | 4026 | Outpost (About) | 8 |
| 380 | Initiate Diplomatic Contact | 8 | 4027 | Preferences | 9 |
| 384 | Trade | 9 | 4028 | Program Control (main menu) | 9 |
| 389 | Trade Session | 9 | 4029 | Star Selection | 9 |
| 402 | Trade Counter Offer | 9 | 4031 | Destination Selection | 8 |
| 448 | Police | 9 | 4034 | Change Level | 8 |
| 451 | Master Reports | 8 | 4035 | message box | 9 |
| 455 | Feature Naming | 8 | 4039–4041 | A.I. Says | 8 |
| 459 | Editor Interview | 8 | 4042 | Difficulty Level | 8 |
| 497 | Robot Command | 9 | 4043, 4044 | Outpost (greeting/naming) | 8 |
| 499 | Robot Command Details | 9 | 4045 | Star System | 9 |
| 4001 | Factory Summary | 9 | 4047 | alert | 9 |
| 4002 | Executive Summary | 9 | 4049 | Move Colonists | 9 |
| 4003 | Laboratory Summary | 9 | 4051 | Color Legend | 8 |
| 6208 | Transfer Assets | 9 | 4057, 4058 | research trees (UG, surface) | 9 |
| 6213 | Transit Information | 9 | 6220 | Assign Trucks | 8 |
| 6224 | Macromanagement Functions | 9 | 6227 | Assign AI Managers | 8 |
| | | | 6234 | Build in Rebel Colony | 8 |

## 5. Where to start for common questions

| Question | Start at |
|---|---|
| What happens in a turn | `Sim::runTurns` s7:83BA, the step list in [00-ground-truth §3](00-ground-truth.md), formulas in [08-simulation.md](08-simulation.md) |
| A building's behaviour | Its class in `seg00_auto.tsv` (slots 11–13 mine/produce/power), the base rules s6 (`Building::*`) |
| A window or dialog | §4 above, then `DialogCtr::open` s8:AF40's switch |
| A movie or story screen | `MovieView::MovieView` s4:6A0E, `StoryPage::StoryPage` s4:C402, [13-media.md](13-media.md) |
| What a save holds | `ObjectDb::save` s6:DCE2 and each class's slot 3; `tools/ne-analyzer/save_layout.py` |
| Who calls an API | `disasm/api_usage.txt` |

## 6. Tools

| Script | Use |
|---|---|
| `catalog.py build` | Writes `function-catalog.csv` from the listings, the name files and the citations in `rebuild/` and `specs/` |
| `catalog.py digest SEG [all]` | Prints each (undecoded, or with `all` every) function of a segment compactly: calls, APIs, strings, vtable slots. Used to decode in bulk |
| `catalog.py stats` | Coverage per segment |
| `name_patterns.py` | Regenerates `names/seg00_auto.tsv` from the vtables |
| `undecoded.py EXE OUT` | Classifies every byte not decoded as code (data, padding, code) |
| `code_gaps.py` | Lists the gaps between functions |

Run them with a Python that has Capstone. Regenerate the listings after
editing the name files: `ne_disasm.py` reads `names/*.tsv`.
