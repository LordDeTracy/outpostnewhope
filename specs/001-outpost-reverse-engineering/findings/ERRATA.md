# Errata — Corrections to the Phase 001 Reverse-Engineering Documents

**Date:** 2026-10-10. Each item was checked against the raw binary or data
with the tools listed in [00-ground-truth.md §7](00-ground-truth.md#7-reproducing-everything).
"Remaster impact" names Phase 002 code or data that was built on the wrong
claim. **Nothing in `src/` has been changed yet**; this list is the to-do for
the recompilation phase.

Severity: **H** = structurally wrong / invented; **M** = wrong detail that
changes behaviour; **L** = cosmetic or naming.

## A. OUTPOST.EXE

| # | Sev | Old claim (where) | Correction | Evidence |
|---|-----|-------------------|------------|----------|
| A1 | H | Segment table has 12-byte entries; segments of 351 KB, 492 KB, 980 KB "overlays" sharing offset 0xD500; BSS segments 9–11 (01-binary-structure, data-model) | NE segment entries are **8 bytes**; Win16 segments are ≤ 64 KB. Real layout: 9 CODE segments + 2 DATA (seg 11 = DGROUP). No overlays, no BSS segments | `ne_parse.py`; 01-binary-structure.md §2 |
| A2 | H | Built with **Borland C++ 5.60**, Borland overlay manager, `LCALL 0:FFFF` Borland idiom | **Microsoft C/C++ (VC++ 1.5x), LINK 5.60**, `/G3`. `9A FFFF 0000` is just an unresolved import call before fixup | MS runtime errors `R6000–R6025` incl. `R6020 QuickWin`, `_C_FILE_INFO=` |
| A3 | H | Resource table "invalid"; `SITEICON`, `OPPOPMENU`… are resident-name exports | Resource table at 0x118 is valid: 156 resources (882 strings, 61 dialogs, 6 menus, …). Those names are resource names | `ne_resources.py` |
| A4 | H | Imports "inferred from patterns": BitBlt, CreateCompatibleDC, StretchBlt, timeSetEvent, sndPlaySound, waveOut*, midiOut*, LoadLibrary… | Real import list (172) resolved from relocations. None of those are imported. Rendering = `CreateDC("dib")` + `SetDIBitsToDevice`/`StretchDIBits`; timing = `SetTimer`; audio/video = `mciSendCommand` only | 01-binary-structure.md §4 |
| A5 | H | `SC*` names are "SCI (Sierra Creative Interpreter) functions" dispatched through a far-pointer string table | `SC*` are **C++ step classes**. The ctor copies its own name into the object for tracing. No string dispatch, and SCI is unrelated (Outpost is not an SCI game) | ctors e.g. `s7:ECC2`, base ctor `s6:D1DC` |
| A6 | H | 20-step simulation order: PrelimAlloc → Pop → GenKids → Starve → FillResources → Mines → … → EndSim (01-binary-structure §9, analysis-deep §4, 04-engine) | Verified 15-step priority-queue order: **Setup → RoboMove → ProdSched → Construct → RchSched → AiInput → Move → Pop → Mines → Factory → Power → Event → Morale → PrelimAlloc → EndSim**. GenKids, Starve, FillResources, PutBldg, KillBldg, Select, AddSpew, MoveBas, Kill(Rebel)Colony, ForceMorale are queued *on demand* at their own priorities | `s6:D2B0`, `s6:D01A`, `s5:C872` |
| A7 | M | 7,848 ENTER prologues → ~5,500 functions; 29.6 % have >512-byte frames | 3,378 functions recovered (89.5 % code coverage). The ENTER counts included data bytes | `ne_disasm.py` |
| A8 | M | Entry point is a Borland `__Init` loop | Standard MSVC `__astart` (InitTask → WaitEvent → InitApp) | `s1:2300` |
| A9 | M | Main loop is timer-driven (`WM_TIMER`/`timeSetEvent` triggers each turn) | Turns are **user-driven**: "Run a Turn ^T" / "Run Multiple Turns F5" post `WM_USER` (0x400) to the main window (`s2:06C0`) → `RunTurn(sim, n)` `s7:83BA` | menu OPPOPMENU, `s2:06C0` |
| A10 | M | "Segment 8 is the jump dispatch table / overlay manager" | Seg 8 is ordinary code (movement, robots, report dialogs) | per-segment profile |
| A11 | L | `0x866F0` "SCI function name table in segment 7" | That offset is in DGROUP (seg 11 + 0x4FD0). They are ordinary string literals | `dgroup-strings.txt` |

## B. RESOURCE.000

| # | Sev | Old claim | Correction |
|---|-----|-----------|------------|
| B1 | M | Field1 at +0x10 is a meaningful word (0x13D7 / 0x13FA / 0x1300) | Uninitialized bytes after the NUL inside a 14-byte name buffer |
| B2 | M | Unk1/Unk2 at +0x16/+0x18 unknown "batch IDs" | **DOS date and time** of the original file (e.g. 1995-06-14 01:50:00 = Sierra v1.50 stamp) |
| B3 | M | 3-byte blob header: mode (0 = ASCII, 1 = binary), dict 4/5/6 = **4/8/16 KB**, "fieldA initial bit buffer"; most files use 8 KB | Standard PKWARE DCL 2-byte header: mode **0 = binary**, 1 = ASCII; dict 4/5/6 = **1/2/4 KB**. All 14 Outpost files are `00 06` (binary, 4 KB). The third byte is simply the start of the bitstream |
| B4 | M | Decoder tables "extracted from OUTPOST.EXE" | The game never touches RESOURCE.000; the installer does. The tables are the standard PKWARE ones |
| B5 | L | Entry 8 named `OUTHLE.HLP` | `OUTHLP.HLP` |
| B6 | M | "No repack support" (contract) vs "verified round-trip" (AGENTS.md) | A repacker exists. Round-trip of unchanged files is trivially identical because it reuses the original bytes. Changed files use a literal-only encoder, now verified to decode correctly but ~12 % larger |
| B7 | M | — | `Resource.000 extract/OUTPOST.INI` had been overwritten by a repack test ("Modified OUTPOST.INI content"). **Restored** to the archive content `[general]\r\nopimage=\r\n` |

## C. Data files

| # | Sev | Old claim | Correction |
|---|-----|-----------|------------|
| C1 | H | **TUTOR.OPS is a tutorial script**: 19 sections, opcodes, "133 tutorial steps", "4 scenarios" (tutor-format.md, data-model, 002 asset-pipeline) | `.OPS` is the **save-game format** (`SC001` header + `dcbSC%02x` chunks written by object serializers). TUTOR.OPS is a saved game the tutorial loads. There are no opcodes. See [../contracts/ops-save-format.md](../contracts/ops-save-format.md) |
| C2 | H | BLDGBLD fields 18–29 = prerequisite buildings (field N → building N−3); "circular dependency" needs resolving (tech-tree.md, analysis-deep) | Strong evidence that they are **material-type flags** for the 12 refined resources (MetalA…FusionC), indexed from the game's own resource-name list. Under the old reading the Tokamak requires itself. Research gating lives elsewhere (research tree strings 1200–1330, results 1637–1702) |
| C3 | M | Fields 1–17 "always 0, reserved/padding" | They are resource columns (raw ores, life, …) that happen to be zero for construction |
| C4 | M | All fields are generic numbers | Exact binary layout: BLDGBLD → `long[37]` + 2 words (struct 0x98); BLDGOPS → `long[37]` + 8 words (struct 0xAE). The quoted name is skipped by the parser; record index is the building id |
| C5 | L | "XOR 0x80 except CRLF" | Precisely: +0x80 on every byte the MS C ctype table does not flag `_CONTROL` |
| C6 | M | OUTPOST.INI `opimage=` "probably a title overlay" | INI schema recovered: sections `general`/`windows`, keys `rez, anims, music, sound, movies, falseMap, opimage, savePath, aiName, playerName, turns, turnsDlgStatus, turnsdlg, tilepickr, sitectrl1–4, plntctrl` |

## D. Assets and game content

| # | Sev | Old claim | Correction |
|---|-----|-----------|------------|
| D1 | M | FR-012 "proprietary BMP variant" (spec) | All 339 are standard Windows DIBs (BITMAPINFOHEADER, 8 bpp, BI_RGB). bitmap-format.md already concluded this; the spec premise was wrong |
| D2 | H | **15 star systems** (002 data, `src/data/star-systems.cpp`) | **21** destinations in the string table and the DGROUP star data table (7 of them have no terrestrial planet → game over). The remaster's other names (Aphrodite, Anonymous Bosch, Vulcan's Forge, Nova, Eden…) were invented or lifted from TUTOR.OPS, where "Aphrodite"/"Anonymous Bosch" are the AI and player names and "Vulcan's Forge" is the site |
| D3 | M | Disaster set incl. fire and tornado (remaster) | Original disasters (alert strings 1810–1829): meteor, solar flare, earthquake, volcano, wind storm, dust storm, electrical storm, plague. Plus scripted events: hot lab explosion, mass driver misfire, starship crash, seed factory exhaustion |
| D4 | L | MIDI count 35 (06-audio) | 32 MIDI files in `MUSIC/` (incl. `MARS.MID`, `0WSCINIT.MID`, which are also in the archive) |
| D5 | L | — | Voice tables: `fem1–140.wav` (ship AI), `add1–75.wav`. SFX are named **without extension** in the table at DGROUP `11:2377`, and many exist as both `.WAV` and `.MID` (e.g. EXPLODE, THUNDER, LAUNCH). With `.wav`/`.mid` stored next to each other at `11:14BA`, the game very likely appends one at runtime depending on settings (inferred) |

## E. Remaster (Phase 002) impact summary

Status as of 2026-10-10 (pre-fix copy of `src/`, `tests/`, `assets/data`
is in `.backup/pre-errata-fixes-2026-10-10/`). Tests: test-balance 951
assertions / 15 cases, test-tutorial 495 / 8, all passing.

| Area | File(s) | Status |
|------|---------|--------|
| Turn pipeline | `src/sim/simulation-pipeline.*`, `src/sim/steps/*` | **Fixed.** Descending priority queue with the original priorities; the 15 per-turn steps run in the verified order (new SCSetup, SCRoboMove). SCGenKids/SCStarve are queued by SCPop, SCKillBldg by SCEvent, SCAddSpew by factory output. SCFillResources is the "unlimited resources" cheat (string 1579), never queued by the simulation; SCSelect is UI-only. Player placements (SCPutBldg) run at priority 1000, just before SCEndSim. Test: "Turn order matches OUTPOST.EXE" |
| Power | `src/sim/steps/steps_01_10.cpp` | **Fixed.** Outputs from the original: SeedPower 50, Tokamaks 1000, Solar receiver 1000 only with a Solar Power Satellite, UGGeoTherm 0. Demand = BLDGOPS Power column (raw). Energy is a per-turn flow, not a stockpile. **Later correction (2026-10-11):** SCPower only polls group 12, so SeedCommand and the underground Tokamaks produce nothing in the original, and the 50-power lifetime method belongs to the Command center; the remaster still has the earlier numbers (it is no longer being developed, see the rebuild) |
| Agri domes | same | **Fixed.** 10/11/12 food per turn, at most 1000 stored per dome. The three research bonuses (+1 each) are not applied because the remaster has no research-topic state |
| Mines | same | **Partly fixed.** Only ActiveMine1/2 and UGMine1/2 produce (abandoned DisMine no longer does). Yield and depletion are still remaster placeholders |
| Other step formulas | `src/sim/steps/*` | **Open.** Still remaster placeholders, now commented as such (factory/smelter recipes, morale, births, starvation, construction costs, spaceport income) until the `calcMe` bodies are decompiled |
| Disasters | `src/core/types.hpp`, steps, HUD, cutscenes | **Fixed (types).** EventType now has the original set (meteor, solar flare, earthquake, volcano, wind/dust/electrical storm, plague, hot lab explosion). Fire, tornado and the "meltdown at building 126" are gone. The unused `src/sim/disaster.*` was removed. Frequencies and effects are still placeholders |
| Star systems | `src/data/star-systems.*`, star selection UI, `main.cpp` | **Fixed.** 21 real stars with spectral class, magnitude, mass, distance, voyage time and planet factor from the EXE. Sigma Draconis is the only tutorial star. Choosing one of the 7 stars without a terrestrial planet ends the game, as in the original (string 1839). Terrain tileset and start stock remain remaster defaults |
| Tutorial | `src/data/ops-save.*` (new), `src/data/tutor-ops.hpp`, `main.cpp` | **Fixed.** New `OpsSaveFile` reads the real `.OPS` container; the tutorial takes its site name from TUTOR.OPS. The scripted-tutorial engine is now labelled as remaster-authored |
| Data compiler | `tools/data-compiler/data-compiler.py`, `assets/data/buildings.json` | **Fixed.** Emits `buildNeeds`/`opsNeeds` per resource name and documents the real meaning of the legacy keys; TUTOR.OPS is listed as save chunks. Legacy fields unchanged for all 138 records |
| Tech tree | `src/sim/tech-tree.*` | **Open.** Still gates buildings with the 12-bit "prereqMask", which is really a construction-material flag set. Needs the real gating (research topics/discoveries) decoded first |
| Archive loading | `src/core/resource-archive.*` | **Fixed (naming).** Entry fields renamed to dosDate/dosTime/namePadding/literalMode/dictBits; decoding was already correct |

## F. Housekeeping found during the audit

* **Done:** deleted 14 files named `Resource.000 extract<NAME>` in the project
  root (verified byte-identical duplicates of `Resource.000 extract/<NAME>`,
  from a path-join bug) and `-T`, an 80 MB WAV produced by a mis-parsed
  command.
* Open: `tools/resource-extractor/dotnet-cli/bin/Debug` is stale (no `--repack`);
  rebuild with `dotnet build -c Release`.

## G. Found 2026-10-12 (map decoding, [10-map.md](10-map.md))

* **500–579 are site maps, not building sprites.** `00-ground-truth.md §5`
  calls `500.bmp…579.bmp` and `500a…579a.bmp` "A/B animation frame pairs";
  they are the 70 sites' pictures (`5xx.bmp`) and terrain-code maps
  (`5xxa.bmp`, pixels 0..3), chosen through the bitmap catalog (`s3:830A`)
  from the site table (`s7:3B28`). The remaster draws them as building
  sprites, and its "missing sprite" list (529, 530, 533–540) is just the
  numbers no site uses. Remaster impact: `SpriteAtlas`, `BuildPanel`,
  `TerrainView::renderBuildings` (visual layer; to be redone in Milestone 5).
* `contracts/tilemap-format.md` ("no tile array") is superseded by 10-map.md:
  a sparse grid of tile handles per site and level over a terrain bitmap.
