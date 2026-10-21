# Outpost Rebuild

A modern, behaviour-faithful rebuild of Sierra's **Outpost** (v1.51). Game
logic is reimplemented from the decompiled OUTPOST.EXE; the earlier remaster
in `../src` is used only as a source of visual elements.

Plan and principles: [`../specs/003-original-rebuild/plan.md`](../specs/003-original-rebuild/plan.md).

## You need the original game

The rebuild contains no original data. Point it at either:

* an installed Outpost folder (`OUTPOST.EXE`, `BLDGBLD.DAT`, ... side by side), or
* the CD folder (`RESOURCE.000`, `BITMAPS/`, `VIDEOS/`, `MUSIC/`); files are
  decompressed from `RESOURCE.000` on the fly.

## Build and test

```bash
cmake -S rebuild -B rebuild/build
cmake --build rebuild/build --config Release
rebuild/build/Release/rebuild-tests.exe
```

Tests read the CD folder `../Outpost` (set in `CMakeLists.txt`). To check
saves made by the original game, put them in a folder and run
`OUTPOST_EXTRA_SAVES=<folder> rebuild/build/Release/rebuild-tests.exe "[original]"`.

## Play (early)

With SDL2 installed (found through vcpkg at `C:/tools/vcpkg` on Windows, or
`-DCMAKE_PREFIX_PATH=...`), the build also makes the game:

```bash
rebuild/build-release/Release/outpost-rebuild.exe [game folder] [save.OPS]
```

On Windows, `rebuild/Play Outpost.bat` starts it with the game folder
`../Outpost` and keeps saved games in `rebuild/saves`.

Without a save it starts at the original's Program Control menu: New Game
(difficulty, star selection, ship configuration, destination, planet and
landing site, then put the Seed Lander down from the panel), Introduction
(the original's animated introduction, about ten minutes: a click or Space
skips a scene, Esc on a still picture goes back to the menu), Load
(`TUTOR.OPS` and the `.OPS` files in the current folder), Preferences,
Exit. With a save it shows the colony's site as the original's isometric
map. Menus and keys follow the original: Ctrl+T or Enter runs a turn, F5
several, Alt+0..4 or PageUp/PageDown change level, F1 help, Alt+X exits.
Pick a structure in the panel and click the map to build; click a building
for its window, right-click for its menu (description, truck routing,
trucks). The Reports menu has the Executive Summary (E), Population (P),
Colony Totals (T), Research Discoveries (R), Starship Status and the
Message Log (L); File > Save (Ctrl+S) writes the current file or
`REBUILD.OPS`, Save As names one. Arrows or middle drag scroll, the wheel
zooms, Tab switches site.

`--shot file.bmp [turns]` saves one frame and quits. Scripted views:
`--seed n`, `--press id` (start screens), `--land`, `--turns n`, `--near
type dx dy`, `--turns2 n`, `--place type x y`, `--save file.OPS`, `--level
n`, `--dialog id`, `--report cmd`, `--tile x y command`, `--building x y`,
`--dpress id`, `--movies`, `--wait ms` (see `src/app/main.cpp`). Sound
needs SDL2_mixer (vcpkg `sdl2-mixer`); MIDI music plays through Windows
MCI, as in the original. Preferences switch off music, sound effects and
voices, and the movies (Animated Sequences).

### Credits for the interface art

The map's building, robot and terrain pictures are OutpostHD's
(https://github.com/OutpostUniverse/OPHD; graphics by White Claw, BSD
3-Clause, `assets/ophd`), drawn in place of the original game's bitmaps.

The game's own pictures come from the player's files. The windows, buttons
and fonts around them are free assets shipped in `assets/`:

* [UI Pack: Sci-Fi](https://kenney.nl) by Kenney (CC0), recoloured
  black/red/orange/gold (`assets/ui`, `LICENSE-kenney.txt`);
* the fonts [Orbitron](https://github.com/theleagueof/orbitron) (headings)
  and [Exo 2](https://github.com/googlefonts/Exo-2.0) (text), SIL Open Font
  License 1.1 (`assets/fonts/OFL-*.txt`), with DejaVu Sans as the fallback
  (Bitstream Vera licence).

## Status

| Milestone | State |
|-----------|-------|
| 1. Data layer: RESOURCE.000, NE executable, string table, BLDGBLD/BLDGOPS, building groups, research trees, star table, .OPS container | done, tested against the real files |
| 2. Simulation core: object DB + handles, colony/tile/building/player/population model, building classes and state machine, step queue with original priorities, turn driver | done |
| 3. Decompile the per-turn steps and building methods | done: all 15 per-turn steps — SCSetup, SCRoboMove (explorers reveal mine sites), SCProdSched (power/air network, running costs, suspension), SCConstruct, SCRchSched (labs, research points, discoveries, build-menu unlocks), SCAiInput (AI managers), SCMove (robot kits, factories → warehouses, ore and metal trucking, + SCMoveBas next turn), SCPop (+ SCStarve), SCMines, SCFactory, SCPower, SCEvent (incidents, plague, calendar, disasters), SCMorale (crime, education, defections), SCPrelimAlloc, SCEndSim (all dead, lost game, victory, trade upkeep); production chain; robots and trucks; the build menu; original `rand()`. Map-bound parts (placement search, vehicle manager, truck routes) wait for milestone 4 |
| 6. Saves | TUTOR.OPS loads and runs (`sim/ops_loader`); version-4 saves written and round-tripped (`sim/ops_writer`) |
| 4. Map/site model: sites, grids, placement rules, robots, truck routes, trips and monorail trains | done |
| 5. Visuals | done: the original's map, pictures, animations, menus, dialogs and building placement in `outpost-rebuild`; the start screens and a new game from Earth to the landing, building windows, reports, message log, load and save |
| 7. Audio/video | done: the CD's FLC movies, WAV sounds and voices, MIDI music; the Introduction, the voyage voices and the event movies from the EXE's own tables |

Reproduced original quirks: [`../specs/003-original-rebuild/quirks.md`](../specs/003-original-rebuild/quirks.md).
Improvised behaviour (where the original is unfinished or not decoded yet),
each tagged `IMPROVISED` in the code: [`../specs/003-original-rebuild/improvised.md`](../specs/003-original-rebuild/improvised.md).

## Simulation core (`src/sim`)

| File | Original |
|------|----------|
| `object_db` | handle DB `g_objectDb`: `(type << 24) \| index`, types 1–8 (star … player) |
| `ops_loader` | loads a save's simulation chunks (`s6:DEF2` and the classes' load methods): stars, planets, sites, colonies, tiles, units, buildings, players, the build menu, handle counters, mothership, options, alerts, trade agreements and AI managers; version-1 numbering translated |
| `ops_writer` | writes a version-4 save ("SC004") in the original chunk order; what the simulation does not model is carried in `OpsExtras` from the loaded save |
| `new_game` | a new game (`s2:087E`), the destination star (`s8:BC30`) and the planet chosen in orbit (`s9:0170`): SCSelect (`s7:53F4`), SCGenKids (`s7:5260`), the DB creators and selects (`s6:EBEE`, `s6:EC36`, `s6:ECAC`, `s6:E372`, `s6:E44A`), the galaxy, star and planet tables of DGROUP (`0x518C`, `0x51B8`, `0x5332`) |
| `ship_config` | the Ship Configuration dialog (4010; `s8:9144`): rows from DGROUP `0x5A70`, weights and costs from the template, limits and budget (`s8:94DA`, `s8:9820`), launch into the hold and the orbital objects (`s8:95FC`); as shipped it cannot load anything, `openImproved` is improvisation I24 |
| `msvc_qsort` | the runtime's unstable `qsort` (`s1:4AEA`), which orders the colony's tiles |
| `units` | robots and trucks on tiles (DB type 6, kind = product A id), explorers, robot losses (`s7:7C50`, `s7:6E9C`, `s8:43CC`) |
| `world` | `Colony` (totals/alloc/flags, ctor values `s8:30AA`), `Tile` (Bas/Alloc ledgers), `Player` (research), `Population` (91 age cohorts, death tables by difficulty, `s7:314C`) |
| `building` | `Building` base (vtable `s6:CF6A`), `setState` state machine, per-state needs record, type → original class table, decoded subclasses (power plants, command center, agri dome, mines, smelters, SPEW, factories, warehouses, RoboCmd, labs, UG residence, Chap life support, police), slot-18 morale effect |
| `step_queue` | descending-priority step queue (`s5:C872`, `s6:D01A`) |
| `steps` | per-turn steps by type code (`s6:9C90`, `s6:D2B0`), SCPop/SCStarve, SCMorale and the colony-to-colony mover, SCAddSpew, colony ledger summation, allocation and consumption |
| `trucking` | SCMove (`s8:0C00`): RoboCmd kits, factories → warehouses, mines → smelters (SCMoveBas, next turn), smelters → storage |
| `ai` | SCAiInput (`s7:E0D4`): AI managers and their building emphases; SCRoboMove (`s8:290E`): explorers reveal mine sites |
| `endsim` | SCEndSim (`s6:6FF6`): all dead, lost game, victory, trade agreements and market, RoboCmd tables |
| `events` | SCEvent (`s6:74E4`): incidents and wrecking, DIRT protection, plague, the turn calendar, scheduled disasters |
| `research` | lab research (`s7:23E2`), research points (`s7:2852`), effects (`s7:26AC`), topic → discovery table (`s3:6CF8`), discoveries (`s3:A69C`) |
| `simulation` | `GameData` loader, `Simulation::runTurns` (`s7:83BA`), future-step list (`s6:D52C`/`s6:D6B2`), build menu (registry 0x35), MSVC `rand()` (`s1:4D24`) and `random(lo, hi)` (`s2:612E`), difficulty, options, mothership cryo state, trade, AI managers, UI notices |

## Data layer (`src/data`)

| Class | Reads | Notes |
|-------|-------|-------|
| `DclArchive`, `dclExplode` | RESOURCE.000 | PKWARE DCL implode, binary mode |
| `GameFiles` | install dir or CD dir | case-insensitive lookup |
| `NeImage` | OUTPOST.EXE | segments, DGROUP, resources |
| `StringTable` | OUTPOST.EXE RT_STRING | 882 strings |
| `parseBldgBld` / `parseBldgOps` | BLDGBLD.DAT / BLDGOPS.DAT | exact original record layout; `need[]` indexed by resource id |
| `ResearchTree` | OUTPOST.EXE DGROUP 0x3198, 0x0D5E | 131 topics with cost and parent |
| `StarTable` | OUTPOST.EXE DGROUP 0x3C18, 0x51B8 | 21 stars, the game's own row order |
| `DialogTemplate` | RT_DIALOG templates (Win16 layout): controls, classes, texts |
| `OpsSave` | *.OPS / TUTOR.OPS | chunk container (bodies: `sim/ops_loader`) |
