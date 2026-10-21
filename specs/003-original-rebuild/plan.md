# Plan: Modern Rebuild of Outpost (1994/95, v1.51)

**Goal:** a modern, behaviour-faithful rebuild of the original game. Game
logic is reimplemented from the decompiled OUTPOST.EXE; the Phase 002
"remaster" (`src/`) contributes **only visual elements** (renderer, HD
textures/art, UI widgets, fonts). Its simulation and data code are not used.

## Principles

1. **Original files are the data source.** The rebuild reads the player's
   own Outpost files at runtime: `OUTPOST.EXE` (string table, dialogs,
   research tree, star table, other DGROUP tables), `BLDGBLD.DAT`,
   `BLDGOPS.DAT`, `TUTOR.OPS`, and the CD's `BITMAPS/ VIDEOS/ MUSIC/`. No
   original data is copied into the source tree.
2. **No invented rules.** Every formula is traced to a function in
   `reference/outpost-exe/disasm` and documented in
   `specs/001-outpost-reverse-engineering/findings/08-simulation.md`.
   Undecoded behaviour is an explicit, empty TODO with the original address,
   never a guess.
3. **Faithful, quirks included.** Original quirks (e.g. UGGeoTherm produces
   no power) are reproduced and listed in `quirks.md`, so optional fixes can
   be offered later behind a setting.
4. **Same architecture as the original where it matters for behaviour:**
   handle-based object database, colony/tile/building objects with per-tile
   ledgers, building class per type, priority-queue turn steps.

## Layout (`rebuild/`)

| Module | Contents | Source of truth |
|--------|----------|-----------------|
| `data/` | `NeImage` (MZ/NE reader), `StringTable`, `BuildingData` (exact BLDGBLD/BLDGOPS records), `ResearchTree`, `StarTable`, `OpsSave`, `DclArchive` | contracts/, 00-ground-truth.md |
| `sim/` | `ObjectDb` + handles, `Colony`, `Tile` (Bas/Alloc ledgers), `Building` + class table, `StepQueue`, SC steps | 08-simulation.md |
| `game/` | turn driver (Run Turn / Run N Turns), save/load (.OPS, once decoded) | 00-ground-truth.md §3 |
| `ui/`, `render/`, `audio/` | ported from the remaster's visual layer, rewired to the rebuild's model | remaster `src/render`, `src/ui` |
| `tests/` | Catch2; data tests run against the real files (skipped if absent) | |

## Milestones

1. **Data layer** (all formats already verified): read every table the
   simulation needs straight from the original files. ✅ done
2. **Simulation core skeleton:** object DB, colony/tile/building model, step
   queue with original priorities, colony ledger summation, verified
   building methods (power plants, agri domes). Undecoded steps are empty.
   ✅ done (`rebuild/src/sim`, 17 test cases)
3. **Decompile and implement step by step** (order of gameplay impact):
   allocation (s8:540A/5770), mines, smelters/factories, population
   (births/deaths/starvation), morale, construction, research, events,
   AI, movement, end-of-turn. Each lands with a test.
   ✅ done (2026-10-11): all 15 per-turn steps, with SCStarve, SCMoveBas,
   the incident/disaster/defection sub-steps, robots and trucks, the build
   menu and the AI managers (62 test cases). What needs the map waits for
   milestone 4: the AI's placement search, the vehicle manager, the
   player's truck routes, new tiles from SCInternalPutBldg. Where the
   original is unfinished or undecoded the rebuild improvises, and lists it
   in [`improvised.md`](improvised.md).
4. **Map/site model** (surface + 4 underground levels, tiles, placement
   rules from strings 1703–1720). ✅ Done (2026-10-12,
   [findings/10-map.md](../001-outpost-reverse-engineering/findings/10-map.md)):
   done: the map and per-site grids over the terrain maps 5xxA.BMP, the 70
   sites and the bitmap catalog read from the EXE, SCInternalPutBldg's
   new-tile and new-colony path (`Simulation::putBuildingAt`), incidents
   clamped to the map, explorers' DisMines on the map, the AI managers'
   placement search, the RoboDozer, a planet's sites with their mine sites
   and DisMines (`Simulation::generateSites`), the base placement rules
   (slot 7) and the class rules, SCPutBldg, the RoboDigger, RoboMine and
   RoboExplr, the AI's underground link (`s7:A044`), the player's truck
   routes and the vehicle manager's trips (`sim/vehicles`). The
   monorail trains are modelled and completed where the original is
   unfinished (Q62, I26–I28). Trips are saved in chunk 0x17.
5. **Visual layer:** ✅ done (2026-10-13,
   [findings/12-graphics.md](../001-outpost-reverse-engineering/findings/12-graphics.md)).
   `outpost-rebuild` (`rebuild/src/app`, SDL2 + SDL2_ttf) draws the site
   as the original's isometric map from the player's files: terrain
   pictures by planet, building pictures and animated overlays, all levels;
   the main menu bar (OPPOPMENU) and its accelerators; the building panel
   with the original names; placement through SCPutBldg with the original
   refusal messages; the building pop-up (TILEMENU) with Building
   Description, truck Routing (Transit Information) and Assign Trucks;
   dialogs drawn from the EXE's templates (About, Run Multiple Turns,
   Preferences, Executive Summary, Population Details); saving.
   Finished 2026-10-13 (`app/start.cpp`, `app/game.cpp`): the Program
   Control menu (New Game, Introduction, Load, Preferences, Exit) and a new
   game's way to the planet: difficulty and automatic trucking, star
   selection with the star's data and the probes, Ship Configuration (the
   improved loader, I24) with the funds question, the destination with AI
   Select, the planet in orbit with its turning globe and facts, the sites
   with their pictures. Landing: the Seed
   Lander is put down from the panel (I37), named (I41) and deploys its
   parts (`s6:2F18`); the landers and Tokamak aboard and the free robot kits
   are on the panel (`s7:9296`, `s7:951A`). The building windows by class
   (structure, construction, factory, lab with its topic list and progress,
   mine, warehouse, storage tank with its contents, robot command, police,
   terraform) with
   their resource tables ("Resources>>"); a Reports menu (I39) with
   Executive Summary, Population, Colony Totals ("More>>"), Research
   Discoveries, the Message Log (the original's log codes and strings) and
   Main Menu; the lost-game message; Load (TUTOR.OPS and saves), Save and
   Save As (dialog 4025). Scripted screenshots (`--shot` with `--press`,
   `--land`, `--near`, `--building`, `--report`, `--dpress`, `--save`)
   check every screen.
   Decision: the remaster's renderer is not ported. Its "HD" textures are
   the original bitmaps converted to PNG at the same size, its map is a
   top-down grid built on misread bitmaps, and shipping its assets would
   embed original data; the rebuild's SDL renderer (hardware accelerated,
   smooth zoom) reads the original files directly. The window art is
   free: Kenney's UI Pack Sci-Fi (CC0, recoloured black/red/orange/gold)
   with the Orbitron and Exo 2 fonts (OFL 1.1) and DejaVu Sans as the
   fallback (`rebuild/assets`, credits in the README). Open (improvised meanwhile, I31–I42): the report and
   building windows' own code, the animation timer, Transfer Assets, the
   research tree window, the windows' detail buttons (Needs, Master,
   Details). The video sequences came with milestone 7.
   Reviewed 2026-10-18: a clean build from scratch, all tests, and a
   47-screen scripted pass over every screen; fixed the starship cargo
   names (s5:BD80 types 128..137), the storage tank window (4033), the
   research roots in Research Discoveries and the About box's logo (I46).
6. **Saves:** decode the `.OPS` chunk layouts; load TUTOR.OPS as the tutorial.
   ✅ all chunks decoded (2026-10-13): `sim/ops_loader` reads versions 1
   and 4, `sim/ops_writer` writes version 4, with trips, trains and the
   new-game objects; TUTOR.OPS loads, runs, and round-trips through
   version 4. The new-game flow (ship, destination, galaxy, planet, sites)
   is `sim/new_game` and `sim/ship_config` (findings/11-new-game.md). Open:
   a save made by the original v1.51, to check with the `[original]` test
   (`OUTPOST_EXTRA_SAVES`).
7. **Audio/video:** MCI-equivalent playback of the original WAV/MIDI/FLC
   (or the remaster's converted assets).
   ✅ done (2026-10-18,
   [findings/13-media.md](../001-outpost-reverse-engineering/findings/13-media.md)).
   The rebuild plays the CD's own files: an FLC decoder (`data/flc`, all
   92 files and their ring frames checked), waves through SDL2_mixer and
   MIDI through MCI (`app/audio`, one of each at a time as in the
   original), and the sequence player (`app/sequence`) driven by the EXE's
   own tables (`data/media`): 78 movie views, the 14 story pages, the
   command → screen switch and the message log's movie switch. Program
   Control's Introduction runs the original's 37-screen chain (23 movies,
   14 narrated story pages, mars.mid); New Game asks the mission brief and
   no longer shows improvised story pages; the voyage screens speak their
   voice lines; message log entries play their event movies over the
   colony (the Seed landing, colonists landing, the new starship,
   meteorites, earthquake, volcano, storms, the hot lab explosion, solar
   flares, avalanches). Improvised: the skip keys and page layout (I44),
   the endings return to the menu (I45). Open: the star buttons' and the
   alert windows' voices, the speaking dialogs (13-media.md §9).
8. **Game improvements** (only after milestones 1–7 give a fully working,
   faithful game). The original v1.51 is unfinished; this milestone goes
   beyond it, behind an option so the faithful behaviour stays available.
   Every change is tagged IMPROVED in the code and listed in `improvised.md`.
   - **Better rebel AI** (pulled forward 2026-10-20 at the user's request
     and made the default; built by the UI session in
     `sim/rebel_ai_improved.*` and `sim/trade_improved.*`, with
     `sim/rebels.cpp` kept faithful). In v1.51 the rebels always die: their response
     tables are empty (Q71), so after landing their Seed and initial set-up
     (s5:A80E/A89E) they build nothing and starve. Write a real rebel
     colony manager: build food, power, housing and mines to survive,
     expand, research, and react to the player (trade, sabotage, defence)
     by difficulty.
   - TUTOR.OPS left alone starves around turn 380 (2 Agri Domes, food 20
     from turn 230, SCStarve kills 64 then 128): faithful, but a candidate
     for better guidance or balance.
   - RoboDozer work time by terrain (Q72): v1.51 always takes 1 turn;
     done early at the player's request (I59, `RobotBuilding::groundMark`);
     use the cell's terrain before it is marked (clear 1, rough 2,
     hostile 3) as the table in `s5:ECB0` intends.
   - Other gaps found while finishing milestones 1–7 that the original
     leaves broken (collected here rather than fixed in the faithful path).
