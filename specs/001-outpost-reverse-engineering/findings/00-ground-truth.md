# Outpost (Sierra, 1994/95) — Verified Ground Truth

**Status:** Verified against the raw bytes on 2026-10-10. Every claim in this
document was re-derived from `Outpost/RESOURCE.000`, the extracted
`OUTPOST.EXE`, and the CD assets with the tools in `tools/ne-analyzer/` and
`tools/resource-extractor/dcl_explode.py`. Where something is an inference
rather than a direct read of the code or data, it is marked **(inferred)**.

This is the entry point for the reverse-engineering knowledge base. Earlier
documents in `findings/` and `contracts/` contain a number of errors; see
[ERRATA.md](ERRATA.md) for the full list and which of them the Phase 002
remaster code inherited.

---

## 1. What is on the CD

| Item | What it is |
|------|-----------|
| `RESOURCE.000` (1,130,608 B) | Installer archive (`DISK01`), 14 PKWARE-DCL-imploded files. Read by `SETUP.EXE` at install time. **The game never opens it at runtime.** |
| `SETUP.EXE`, `SETUP.SOL` | Sierra installer and its script |
| `BITMAPS/` (339 files) | Standard Windows 3.x 8-bpp DIBs, loaded from the CD by name |
| `VIDEOS/` (92 files) | Standard Autodesk FLC animations, played via MCI (`mciaap.drv`) |
| `MUSIC/` (309 files) | 277 WAV (PCM, mono, mostly 22 kHz/8-bit) + 32 MIDI |
| `INN/` | ImagiNation Network client bundle. Not referenced by `OUTPOST.EXE` |
| `MANUAL/OUTP_GB.PDF` | Game manual |
| `OUTPOST2/OP2_2X.AVI` | Outpost 2 trailer |
| `VERSION` | `OUTPOST 1.51 07.21.95` |

Game version: **1.51** (About box, dialog 4026). EXE build timestamp in the
archive directory: **1995-07-19 14:47:40**.

### Archive contents (all verified byte-exact with an independent decoder)

| File | Packed | Unpacked | DOS timestamp | Role |
|------|-------:|---------:|---------------|------|
| BLDGBLD.DAT | 1,382 | 12,403 | 1995-06-14 01:50 | Building construction table |
| BLDGOPS.DAT | 1,243 | 14,049 | 1995-06-14 01:50 | Building operations table |
| AAPLAY.DLL | 92,484 | 182,773 | 1993-05-27 | Autodesk Animation Player runtime |
| AAVGA.DLL | 5,502 | 13,840 | 1992-12-09 | AAPLAY VGA driver |
| OUTHELP.DLL | 4,176 | 7,200 | 1994-04-27 | Help helper DLL |
| DIB.DRV | 20,154 | 30,544 | 1992-10-28 | Microsoft DIB display driver (memory DCs on DIBs) |
| MCIAAP.DRV | 7,130 | 16,912 | 1992-06-29 | MCI driver for Autodesk animations |
| OUTPOST.EXE | 329,295 | 640,896 | 1995-07-19 14:47 | The game |
| OUTHLP.HLP | 570,906 | 561,150 | 1995-06-14 01:50 | WinHelp file |
| OUTPOST.INI | 26 | 21 | 1995-05-12 | `[general]\r\nopimage=\r\n` |
| READ.ME | 9,978 | 22,679 | 1995-06-14 01:50 | Release notes |
| 0WSCINIT.MID | 119 | 557 | 1994-04-14 | MIDI init sequence |
| MARS.MID | 82,526 | 133,424 | 1994-06-06 | Title music |
| TUTOR.OPS | 5,291 | 20,276 | 1994-07-15 | **A saved game** used to start the tutorial |

The `01:50:00` timestamps are Sierra's version-in-timestamp convention (1:50 →
v1.50). Full format: [../contracts/archive-format.md](../contracts/archive-format.md).

---

## 2. OUTPOST.EXE at a glance

| Property | Value |
|----------|-------|
| Format | Win16 NE, expected Windows 3.10, protected mode, `MULTIPLEDATA` |
| Toolchain | **Microsoft C/C++ 7/8 (Visual C++ 1.5x), LINK 5.60**, compiled for 386 (`/G3`: `ENTER` prologues, `66h` operand-size prefixes). Evidence: linker 5.60, MS runtime errors `R6000…R6025` incl. `R6020 unexpected QuickWin error`, `_C_FILE_INFO=` |
| Allocator | MicroQuill **SmartHeap** (`_SHI_INVOKEERRORHANDLER1` export) |
| Language | C++ with far vtables placed in the code segments |
| Segments | 9 CODE (all < 64 KB, moveable, preload) + 2 DATA; seg 11 is DGROUP |
| Entry | `CS:IP = 1:2300` → MSVC `__astart` (InitTask/WaitEvent/InitApp) |
| Exports | `___EXPORTEDSTUB` (1:29EC), `_SHI_INVOKEERRORHANDLER1` (1:1E70) |
| Imports | 172 distinct functions from KERNEL (42), USER (101), GDI (25), MMSYSTEM (2), COMMDLG (2) |
| Resources | 156: 882 strings, 61 dialogs, 6 menus, 1 accelerator table, 10 RCDATA, icons, cursors |
| Code recovered | 3,378 functions, 89.5 % of code bytes decoded, 77 switch tables |

### Segment map

| Seg | File off | Size | Role (from APIs + strings) |
|-----|---------:|-----:|----------------------------|
| 1 | 0x000A20 | 0x55B7 | C runtime, SmartHeap, startup, DOS/Global memory |
| 2 | 0x0060E0 | 0xEFE0 | App framework: `Op`/`OpWnd` classes, window classes, message loop, main window proc (Run Turn), file I/O, save-file chunk I/O, DIB blitting, palette, MCI sound/movie, file dialogs |
| 3 | 0x015420 | 0xEE9F | Window placement and INI persistence, string resources, preferences |
| 4 | 0x024460 | 0xEE6A | View painting (GDI), building-class constructors (vtable family at s2:380A) |
| 5 | 0x033420 | 0xEFBA | View windows (planet/site/tile), popup menus, `VrMode` view modes, tile picker, save chunks 0x0B |
| 6 | 0x0426A0 | 0xEFBE | **Simulation core**: SC step classes, step queue, building placement, sim save chunks |
| 7 | 0x0516C0 | 0xEF76 | Simulation (population, mines, AI, kill/move), BLDGBLD/BLDGOPS loader, trucking |
| 8 | 0x0606C0 | 0xEF91 | Movement / robots, report dialogs |
| 9 | 0x06F820 | 0xD974 | Dialogs and custom controls (`OPButton`, `MicroSpinControl`) |
| 10 | 0x07D4C0 | 0x423C | DATA (far data) |
| 11 | 0x081720 | 0x68B6 | DGROUP: strings, file-name tables, INI keys, sim tables |

### What the imports tell us

* **Rendering:** no `BitBlt`, no `CreateCompatibleDC`. The game creates a DIB
  device context through `CreateDC("dib", …)` (string `"dib"` in DGROUP;
  `DIB.DRV` ships in the archive), draws into it, and presents with
  `SetDIBitsToDevice` / `StretchDIBits` (`s2:45D6`, `s2:465A`). Palette:
  `CreatePalette`, `SelectPalette`, `RealizePalette`, `GetSystemPaletteEntries`.
* **Timing:** `SetTimer`/`KillTimer` only. There is no multimedia timer. Turns
  are user-driven (menu "Run a Turn ^T", "Run Multiple Turns… F5").
* **Audio and video:** all through **MCI** (`mciSendCommand`,
  `mciGetErrorString`) on device types `waveaudio`, `sequencer` (`.mid`), and
  the Autodesk driver `mciaap.drv` for FLC. A hidden `MciSoundWindow` receives
  notifications. No `sndPlaySound`, `waveOut*`, or `midiOut*`.
* **Files:** `_lopen/_hread/_hwrite/_llseek/_lclose`; `GetOpenFileName` /
  `GetSaveFileName` for `*.ops` saves; `Get/WritePrivateProfileString` for
  `outpost.ini`; `WinHelp` for `outhlp.hlp`; `WinExec("notepad read.me")`.

The full API → caller map is in `reference/outpost-exe/disasm/api_usage.txt`.

---

## 3. Simulation architecture (verified from code)

The simulation is a **priority queue of command objects**. Every simulation
action, including player actions, is an instance of an `SC*` C++ class. These
are not "SCI" (Sierra Creative Interpreter) functions; the names are class
names that the constructor copies into the object for debug tracing.

### SC step object layout

```
+0x00  far ptr  vtable
+0x04  dword    priority (step type - 1, e.g. SCMorale = 3999)
+0x08  char[]   class name ("SCMorale"), copied by the ctor for tracing
...    class-specific data
```

Base constructor `s6:D1DC(this, priority)`; base vtable `s6:6AD2`. Each SC
vtable has 4 slots:

| Slot | Offset | Meaning |
|------|--------|---------|
| 0 | +0x00 | scalar deleting destructor |
| 1 | +0x04 | **`calcMe`**: the step body (`SCSetup`'s slot 1 is literally named `SCSetup::calcMe` in its trace string) |
| 2 | +0x08 | `shouldRun`: checked before enqueueing (`s6:D566`); base `s6:D228` |
| 3 | +0x0C | `clone`: the queue stores a heap copy |

### The turn

`WM_USER (0x400)` on the main window (`s2:06C0`) → `RunTurn` `s7:83BA(sim, n)`
runs `n` turns. Each turn:

1. `s6:D2B0` builds one step per type and enqueues it (`s6:D566` → `shouldRun`
   → `clone` → keyed insert `s5:C872`).
2. `s6:D01A` drains the queue: pop head (`s6:D728`), call slot 1 (`calcMe`),
   call slot 0 (delete).

The queue is a **descending** keyed list (insert at head when
key ≥ head key), so **higher priority runs first**. A step may enqueue more
steps while it runs; they slot in by priority.

### Verified per-turn pipeline

| Order | Type code | Priority | Class | ctor | `calcMe` |
|------:|----------:|---------:|-------|------|----------|
| 1 | 16000 | 15999 | SCSetup | s6:ACB6 | s6:ACEC |
| 2 | 15000 | 14999 | SCRoboMove | s8:28D8 | s8:290E |
| 3 | 14000 | 13999 | SCProdSched | s6:A866 | s6:A89C |
| 4 | 13000 | 12999 | SCConstruct | s6:6E60 | s6:6E96 |
| 5 | 12000 | 11999 | SCRchSched | s6:AB32 | s6:AB68 |
| 6 | 11000 | 10999 | SCAiInput | s7:E09E | s7:E0D4 |
| 7 | 10000 | 9999 | SCMove | s8:0BA6 | s8:0C00 |
| 8 | 9000 | 8999 | SCPop | s6:9EC6 | s6:9EFC |
| 9 | 8000 | 7999 | SCMines | s7:EB50 | s7:EB86 |
| 10 | 7000 | 6999 | SCFactory | s6:81AA | s6:81E0 |
| 11 | 6000 | 5999 | SCPower | s6:A9BE | s6:A9F4 |
| 12 | 5000 | 4999 | SCEvent | s6:74AE | s6:74E4 |
| 13 | 4000 | 3999 | SCMorale | s7:ECC2 | s7:ECF8 |
| 14 | 3000 | 2999 | SCPrelimAlloc | s6:A706 | s6:A73C |
| 15 | 1000 | 999 | SCEndSim | s6:6FC0 | s6:6FF6 |

Type 2000 is unused. The type→class factory is the switch at `s6:9C90`
(`(type-1000)/1000` indexes table `s6:9DC6`).

### Dynamically queued steps (commands)

| Class | Priority | ctor | Created by |
|-------|---------:|------|-----------|
| SCKillBldg | 16000 | s7:E4FA | event/placement code; runs **immediately** (above everything) |
| SCGenKids | 12999 | s7:521C | population code |
| SCSelect | 12999 | s7:532E | UI (4 callers) |
| SCMoveBas | 10000 | s7:E8A0 | `s8:1AC6` |
| SCStarve | 4999 | s6:AE66 | SCPop (`s6:A3AE`) |
| SCFillResources | 3999 | s6:837E | `s5:493C` |
| SCKillColony | 3999 | s7:E63E | `s5:493C` |
| SCKillRebelColony | 3999 | s7:E79A | `s5:493C` |
| SCPutBldg | 1000 | s6:933C | tile placement UI (`s4:0412`) |
| SCInternalPutBldg / 2 | 1000 | s6:87F0 / s6:8888 | 20+ callers (AI, landers, seed) |
| SCAddSpew | 1000 | s6:68DE | 3 callers |
| SCForceMorale | 999 | s6:84CA | `s5:493C` (debug/cheat path) |

So **player construction orders are queued commands that execute at the end
of the turn**, just before `SCEndSim`.

Debug output: `simres.out` (`s7:842A`) and `wvsprintf` traces such as
`truck 0x%08lx loaded %ld of %s from 0x%08lx`, `clny 0x%08lx. dump Bas follows`.

### Not yet traced

The bodies of each `calcMe` (the actual formulas) have been located but not
yet decompiled. That is the next RE step before recompiling. Start at the
`calcMe` addresses above in `reference/outpost-exe/disasm/seg06–08.asm`.

---

## 4. Data files

### BLDGBLD.DAT / BLDGOPS.DAT

* **Encoding** (loader `s7:4E70`): for every byte, if the MS C ctype table
  does not mark it `_CONTROL`, add 0x80. Equivalently: XOR 0x80 on every byte
  except control characters (CR, LF, TAB…).
* **Records:** CRLF-separated CSV, 138 records each, same order and names in
  both files. The parser (`strtok` + `atol`) **skips the quoted name** and
  stores only the numbers; record index = building id.
* **BLDGBLD record** (`s7:4D3A`, struct 0x98 = 152 B, array at `sim+0x12`):
  numeric fields 0–36 → `long[37]` at +0x00; field 37 → `word` +0x94;
  field 38 → `word` +0x96.
* **BLDGOPS record** (`s7:4C52`, struct 0xAE = 174 B, array at `sim+0x15C`):
  fields 0–36 → `long[37]`; fields 37–44 → `word` +0x94…+0xA2;
  +0xA4…+0xAD is not loaded from the file (runtime state).

**Column semantics (inferred, high confidence).** The string table holds a
contiguous 35-entry resource name list (ids 1463–1497: `OreLifeA…C, OreA…D,
OreFusionA…C, OreMinA…C, LifeA…C, MetalA…D, PrecA…B, MinA…C, FusionA…C,
Luxury, Food, Sewage, MPG, Power, Pop, Unknown`). Taking long[n] (n ≥ 1) as
resource `n-1`, the only non-zero flag columns in both files are exactly the
**12 refined materials** (`MetalA…FusionC`), and they make physical sense:
Tokamak operation uses `FusionA/B/C`, Mass Driver uses `MetalA…D, PrecA`,
Agri Dome uses `MinA/B/C`, and Tokamak construction needs all 12. The
previous reading ("prerequisite building = field − 3") forces buildings to
require themselves; see ERRATA. Exact semantics of the trailing values
(long[35], long[36], and the words) still need tracing from their consumers.

### OUTPOST.INI schema (keys found in DGROUP)

Sections `general`, `windows`. Keys: `rez`, `anims`, `music`, `sound`,
`movies`, `falseMap`, `opimage`, `savePath`, `aiName`, `playerName`, `turns`,
`turnsDlgStatus`, `turnsdlg`, `tilepickr`, `sitectrl1…4`, `plntctrl`. Value
formats `%d,%d`, `%d,%d,%d,%d` (window placement), `%lu`; `off` is a literal
value. String 1582: "Outpost.ini is required, and was not found."

### Save games (`*.OPS`) — including TUTOR.OPS

Header `SC001` (format `SC%03d`, version 1), then chunks tagged `dcbSC%02x`
written by each object's serializer. String 1748: "Different file version
encountered." Full layout: [../contracts/ops-save-format.md](../contracts/ops-save-format.md).

---

## 5. Assets

### Bitmaps (339) — standard DIBs

All 339 are `BITMAPFILEHEADER` + `BITMAPINFOHEADER` (40 B), 8 bpp, `BI_RGB`
(uncompressed), 256-entry palette. Common sizes: 300×150 (140 files,
building tiles), 640×480 (80), 145×120 (70). The EXE names every bitmap it
loads in DGROUP tables at `11:14D0…2520`. For example `500.bmp…579.bmp` +
`500a…579a.bmp` (A/B animation frame pairs), `tile1…6.bmp`, `1tile.bmp`,
`surface.bmp`, `level.bmp…level4.bmp`, `plntrot1/2.bmp`, `vrpal.bmp` (palette),
`dibtext.bmp`, `logo.bmp`.

### Video (92 FLC)

Autodesk FLC (magic `0xAF12`), 8-bit, sizes 100×124 to 640×480, 16–299
frames each, 10,108 frames total. The EXE's table `11:1B00…1D86` lists 85
`NN.flc` names, all present on the CD. The 7 CD files not in that table
(`110–114.FLC`, `150B.FLC`, `270NEW.FLC`) are either built at runtime (e.g.
via `%s%02x`/`%03ld`-style formats) or unused leftovers; not yet determined. Playback is via MCI with `mciaap.drv` (+ AAPLAY.DLL/AAVGA.DLL).

### Audio

* `fem1…fem140.wav`: the ship AI's voice lines (table at `11:25B7`).
* `add1…add75.wav`: additional voice lines (table at `11:2B4F`).
* Named SFX (table `11:2377`): `alarm-m, alarm-d, alarm2, explode, earthqak,
  solrwind, scream'n, cheers, angrymob, launch, fr7lau, boop, blstfurn,
  machwhir, avalanch, robodie, plntxpld, firbal, reent1, smlstp, m59_03…08,
  thunder, robocop, steam, turbine, m59_12, goes, fr7_1…3`.
* The SFX names have no extension, and many exist in `MUSIC/` as both `.WAV`
  and `.MID` (EXPLODE, THUNDER, LAUNCH, …). With `.wav`/`.mid` stored side by
  side at `11:14BA`, the game very likely picks the extension at runtime by
  sound setting (inferred).
* Music: `mars.mid`, `0wscinit.mid` (also in the archive) among the 32 MIDIs in `MUSIC/`.

---

## 6. Game content recovered from the EXE resources

Decoded with `tools/ne-analyzer/ne_resources.py` into
`reference/outpost-exe/resources.{txt,json}`.

* **882 strings**, including:
  * Items/products 1000–1017; building and terrain names 1026–1069, 1526–1555
  * The **research tree** 1200–1330 (Basic/Applied Research → Astronomy,
    Biology, Chemistry, Planetary Sciences, Mathematics, Physics, Social
    Sciences, Humanities…) and research results 1637–1702
  * **21 star systems** 1444–1462, 1576–1577: Tau Ceti, Alpha Centauri A/B,
    Epsilon Eridani, Eta Cassiopeiae A, Sigma Draconis, 36 Ophiuchi A/B,
    HR 7703 A, 82 Eridani, Beta Hydri, HR 8832, Barnard's Star, Wolf 359,
    Sirius, Ross 248, Procyon, Kruger 60, Alpha Aquilae, 70 Ophiuchi A,
    Delta Pavonis
  * The 35 resource ids 1463–1497 (see §4)
  * Placement-rule errors 1703–1720 (e.g. "Landers must land within 5 tiles
    of Seed", "This is too close to an existing Command Center")
  * All disaster alerts 1810–1829, newspaper headlines 1880–1910 and articles
    1911–1996, AI-assistant dialogue 1767–1809, intro story 1842–1857,
    trucking/monorail/AI-manager help text 2010–2066
* **Star data table** (DGROUP `11:39AE`, 21 rows × 6 text values, reached
  through a pointer table at `11:3C1A`): spectral class, apparent magnitude,
  mass (solar), distance (ly), voyage time (≈ 5.2 × distance), and a factor
  that is `0.000` for 7 stars (Barnard's Star, Wolf 359, Sirius, Ross 248,
  Procyon, Kruger 60, Alpha Aquilae; these match the "No Terrestrial planets
  detected… This game is over" ending, inferred). Rows are not in string-table
  order; they were matched to names by spectral class, magnitude and distance
  (row order: Tau Ceti, α Cen B, α Cen A, ε Eri, 70 Oph A, η Cas A, σ Dra,
  36 Oph A, 36 Oph B, HR 7703 A, 82 Eri, β Hyi, HR 8832, the 7 planetless
  stars, δ Pav). The full table is in `src/data/star-systems.cpp`.
* **Sol planet fact sheets:** RCDATA 333–342 (Mercury, Venus, Mars, Jupiter,
  Saturn, Moon, Neptune, Pluto, Ceres, Phobos): diameter, mass, day, gravity,
  orbit AU, …, temperature, escape velocity, atmosphere.
* **61 dialogs**, including the About box with full credits, Program Control
  (main menu), Preferences, Difficulty Level, Star/Destination Selection,
  Ship Configuration Setup, the report dialogs, Diplomacy/Trade, AI Managers,
  Robot Command, Truck routing, and a leftover debug dialog "Test of Sound Queue".
* **6 menus** (OPPOPMENU main menu: Save/Save As/Exit, Run a Turn ^T, Run
  Multiple Turns F5, Preferences, Surface/Underground 1–4 Alt-0…4, Help) and
  the accelerator table OPACCEL.
* Difficulty levels (1568–1571): Beginner, Easy, Medium, Difficult.

---

## 7. Reproducing everything

```bash
PY=python   # needs capstone (pip install capstone)
python tools/resource-extractor/dcl_explode.py verify Outpost/RESOURCE.000 "Resource.000 extract"
python tools/ne-analyzer/ne_parse.py "Resource.000 extract/OUTPOST.EXE" reference/outpost-exe/ne.json
python tools/ne-analyzer/ne_resources.py "Resource.000 extract/OUTPOST.EXE" reference/outpost-exe
python tools/ne-analyzer/ne_disasm.py "Resource.000 extract/OUTPOST.EXE" reference/outpost-exe/disasm
```

Outputs in `reference/outpost-exe/`:

| File | Content |
|------|---------|
| `resources.txt/json` | All strings, menus, dialogs, accelerators, RCDATA |
| `dgroup-strings.txt` | Every string in the data segments with `seg:offset` |
| `disasm/segNN.asm` | Annotated listing per code segment (APIs, internal call names, string refs, switch tables) |
| `disasm/functions.csv/json` | 3,378 functions: address, name, size, APIs, strings, callers/callees |
| `disasm/vtables.txt/json` | Far-pointer install sites / vtables and their slots |
| `disasm/api_usage.txt` | Every imported API → the functions that call it |

---

## 8. Open questions (ranked by value for recompiling)

1. Decompile each SC `calcMe` (addresses in §3) to recover the real formulas
   for population, morale, power, mining, factories, events.
2. Trace consumers of the BLDGBLD/BLDGOPS arrays (`sim+0x12`, `sim+0x15C`) to
   confirm column semantics and the meaning of the trailing values.
3. Map each save chunk 0x01–0x17 to its owning class and field layout.
4. Recover the class hierarchy: the 73-slot vtable `s2:380A` with 72
   constructors spaced 0x48 apart in seg 4 is very likely the building class
   family (one subclass per building type).
5. Identify the map/tile data structures (site grid, levels 0–4) from the
   view code in segs 4–5.
6. Identify the star data columns and the fifth "habitability" value.
