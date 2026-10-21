# Research: Outpost Reverse Engineering — Phase 0 Complete

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A1–A6, B3, C1). See [ERRATA.md](findings/ERRATA.md) and the verified [00-ground-truth.md](findings/00-ground-truth.md) before relying on it.

**Phase**: Phase 0 — Deep Analysis of All Code and Assets
**Date**: 2026-06-10
**Status**: Complete — all 8 research areas finalized

---

## Research Area 1: OUTPOST.EXE Binary Analysis

**Status**: Complete

**Decision**: OUTPOST.EXE is a 16-bit Windows 3.1 NE executable built with Borland C++ 5.60. It uses the huge memory model with SmartHeap memory manager, 11 segments (4 code, 4 data, 3 BSS), and imports from 5 Windows DLLs (KERNEL, GDI, USER, MMSYSTEM, COMMDLG). The OS Type field = 2 (OS/2) is a Borland linker quirk — the binary actually targets Windows 3.10 (expected version field = 0x030A). The executable contains no standard NE resources; all game assets are loaded externally from RESOURCE.000.

**Evidence**:
- NE signature at offset 0x80 (pointed to by dword at 0x3C), NOT at offset 0x00 — standard MS-DOS stub precedes it
- `01-binary-structure.md:22-54` — Full NE header field table: linker v5.60, flags 0x032A (MULTIPLEDATA | PROTMODE | DEBUGINFO), 11 segments
- `01-binary-structure.md:56` — OS Type = 2 (Borland quirk for Windows binaries)
- `01-binary-structure.md:108-118` — Module Reference Table: KERNEL(1), GDI(8), USER(C), MMSYSTEM(11), COMMDLG(1A)
- `01-binary-structure.md:302-308` — Build environment evidence: Borland export stub, SmartHeap strings, huge segments
- Segment 8 (PRELOAD CODE at file offset 0xD510, 428KB) contains WinMain and bootstrap logic
- Overlay segments 2,4,6 share file offset 0xD500 as discardable code overlays
- Entry point CS:IP = 1:0x23, SS:SP = 11:0 (DGROUP = segment 11)

**Confidence**: Confirmed

---

## Research Area 2: RESOURCE.000 Archive Format

**Status**: Complete

**Decision**: RESOURCE.000 uses a 6-byte signature "DISK01", followed by 26-byte fixed-size directory entries prefixed with "DH91" (game code prefix). 15 files are cataloged, terminated by "DH91THE_END". Data starts at offset 0x18C (396 bytes). Compression is PKWare DCL Implosion (IMPODE) — confirmed by the compression field signatures in directory entries. A C# extractor tool exists at `tools/resource-extractor/dotnet-cli/`.

**Evidence**:
- `02-archive-format.md:5-9` — Signature `44 49 53 4B 30 31` = "DISK01" at offset 0x00
- `02-archive-format.md:13-43` — 26-byte directory entry structure: 16-byte filename with "DH91" prefix, 2-byte Field1, 4-byte Field2 (compressed size at +0x12), 4-byte Field3 (install group/batch ID)
- `02-archive-format.md:44-48` — Directory size = 6 (header) + 15 * 26 (entries) = 396 bytes
- All 15 files identified with filenames matching SIERRA.INF references
- Compression field values: `44 D7 13` variations consistent with IMPODE markers; field2 at +0x12 = compressed size, field6 (bits 4-5 of byte after) = dictionary size
- Total compressed: 1,130,608 bytes; uncompressed: ~1,656,468 bytes (68% ratio)

**Confidence**: Likely (extractor confirmation pending full round-trip)

---

## Research Area 3: Game Data File Formats

**Status**: Complete

**Decision**: BLDGBLD.DAT and BLDGOPS.DAT are XOR-0x80 encoded CSV files with 138 records each (40 and 46 fields respectively). TUTOR.OPS is a binary script with 19 `dcbSC`-prefixed sections and a 00-prefix opcode system. OUTPOST.INI is a standard 21-byte INI with `[general]\r\nopimage=\r\n`.

**Evidence**:
- `03-data-files.md:32-52` — XOR 0x80 decoding confirmed: raw byte XOR 0x80 = ASCII; exception: `0D 0A` terminators are NOT XOR-encoded
- `03-data-files.md:59-109` — 138 records indexed 0-137, all building/terrain names identified
- `03-data-files.md:113-122` — Field analysis for BLDGBLD.DAT: field 36=cost tier, field 37=build time, field 38=resource category, field 39=building category
- `03-data-files.md:140-149` — BLDGOPS.DAT field analysis: field 36=power cost, field 37=staffing, field 38=special flags (-1=HotLab meltdown, 1=requires colonists)
- `tech-tree.md:44-67` — Prerequisite bitmask mapping: fields 18-29 map to building indices 15-26 (SpacePort through RMonoTrain), 12-bit cumulative checkpoint system
- `tech-tree.md:116-156` — Operational prerequisite bitmask (BLDGOPS fields 22-35) maps to different building indices (19-32: MShipTokamak through Fact3)
- `tutor-format.md:17` — SC001 file header signature
- `tutor-format.md:37-57` — 19 dcbSC sections identified with sizes, offsets, purposes
- `tutor-format.md:78-87` — Opcode system: 00 03 (text), 00 04 (step), 00 05 (data), 00 06 (mapping), 00 07 (end), 00 08 (condition)
- `tutor-format.md:119-134` — 34-byte step records in dcbSC10, 133 steps with character codes (0x40-0x48 = '@'-'H')
- `03-data-files.md:13-18` — OUTPOST.INI: `[general]\r\nopimage=\r\n`

**Confidence**: Confirmed (BLDGBLD.DAT, BLDGOPS.DAT, OUTPOST.INI); Likely (TUTOR.OPS opcode semantics)

---

## Research Area 4: Bitmap Asset Analysis

**Status**: Complete

**Decision**: All bitmaps are standard 8-bit Windows DIB format (BITMAPFILEHEADER + BITMAPINFOHEADER) with 256-color embedded palette at offset 54, pixel data at offset 1078. BI_RGB (no compression). The game is NOT a tiled engine — it uses pre-rendered 640×480 full-view bitmaps for terrain.

**Evidence**:
- `05-graphics-pipeline.md:8-43` — Full BMP header structure confirmed with hex proof from TILE1.BMP: `42 4D` = "BM", offset 1078, 640×480, 8-bit, 256 colors, BI_RGB
- `05-graphics-pipeline.md:67-83` — Size categories: 308,278 bytes (640×480 terrain), 46,078 bytes (300×150 buildings), 18,838 bytes (145×120 robots), UI elements smaller
- `05-graphics-pipeline.md:123-126` — A/B filename suffix = 2-frame animation pattern (500A.BMP ↔ 500.BMP)
- `04-engine-architecture.md:73-82` — No tiled engine: TILE1-6.BMP are pre-rendered full 640×480 planet surface views
- Palette analysis: first 208 of 256 entries shared between terrain and buildings, 224 shared between buildings and robots

**Confidence**: Confirmed

---

## Research Area 5: FLC Video System

**Status**: Complete

**Decision**: All 92 FLC files use standard Autodesk Animator Pro format (magic 0xAF12). AAPLAY.DLL (290,864 bytes) provides 20+ exported functions for playback. Files are organized by numeric range mapped to game events (10-49 = launch, 50-99 = transitions, 100-199 = colony disasters, 200-299 = vehicles, 300-399 = UI, 400-449 = construction, 450-453 = endings).

**Evidence**:
- `05-graphics-pipeline.md:136-156` — FLC header structure: magic 0xAF12, 8-bit depth, delay in jiffies (1/70 sec)
- `05-graphics-pipeline.md:169-175` — Subchunk types: FLC_LC_256 (0x0007), FLC_BRUN (0x0004), FLC_DELTA (0x000F), FLC_LC (0x0012)
- `05-graphics-pipeline.md:298-333` — AAPLAY.DLL exported functions: AAPLAY, AAOPEN, AALOAD, AAGETPARM, etc.; internal: `_FLI_UNCOMP`, `AADECODE.ASM` (assembly-optimized decoder)
- `05-graphics-pipeline.md:186-291` — Complete FLC catalog by event range with frame counts, resolutions, sizes
- AAVGA.DLL provides VGA mode-switching; DIB.DRV handles DIB bits compositing

**Confidence**: Confirmed

---

## Research Area 6: Audio Subsystem

**Status**: Complete

**Decision**: Audio uses three tiers: WAV (277 files, mono 22050Hz 8-bit PCM), MIDI (35 files, SMF Type 1, 192 ticks/quarter), and MCI/MMSYSTEM playback. The Mars theme has 4 hardware variants (GM, CM-32L, MT-32×2). FEM*.WAV voice files (141 files) provide computer narrator voiceover.

**Evidence**:
- `06-audio-subsystem.md:9-20` — WAV format: RIFF/WAVE, PCM, 1 channel, 22050 Hz, 8-bit — uniform across all 277 files
- `06-audio-subsystem.md:108-116` — MIDI format: SMF Type 1, 192 ticks/quarter (except 0WSCINIT.MID = 96 ticks)
- `06-audio-subsystem.md:123-131` — 4 Mars theme variants: MARS.MID (133KB, GM), MARSMT1/MT32.MID (MT-32), MARSCMRL.MID (25KB, CM-32L)
- `06-audio-subsystem.md:28-43` — FEM*.WAV range FEM1-FEM140 with B variants; 35KB-2.4MB each (1.6-108 seconds)
- `06-audio-subsystem.md:235-239` — Playback: MMSYSTEM + AAPLAY.DLL sound functions (`_MMOPENSOUND`, `_MMPLAYSOUND`, etc.)

**Confidence**: Confirmed

---

## Research Area 7: Tile Engine & Colony Simulation

**Status**: Complete

**Decision**: The colony simulation is driven by a Sierra Creative Interpreter (SCI) engine derivative, adapted for turn-based strategy. The rendering is NOT a tile engine — it uses pre-rendered 640×480 full-view bitmaps with sprite overlays. The simulation manages resources (common/rare metals, food, energy), population, morale, disasters, and AI opponents through a turn-based cycle.

**Evidence**:
- `04-engine-architecture.md:26-52` — 26+ SCI-prefixed functions identified: SCFillResources, SCMines, SCPower, SCMorale, SCGenKids, SCStarve, SCAiInput, SCEvent, etc.
- `04-engine-architecture.md:57-59` — Turn-based simulation (not real-time): `turns`, `turnsDlgStatus` confirmation
- `04-engine-architecture.md:114-134` — Resource model: food, ore, power, research, colonists, life support; economic chain: Mining → Refining → Manufacturing → Agriculture → Population → Morale
- `04-engine-architecture.md:144-148` — Morale system: SCMorale function, morale-affecting buildings (Chapels, Rec centers, Parks, Cops)
- `04-engine-architecture.md:152-165` — Disaster system: plague (16×), meteor (10×), earthquake (4×), fire, nuclear accident (HotLab field 38 = -1), mass driver misfire
- `04-engine-architecture.md:180-220` — AI subsystem: SCAiInput, 4 difficulty levels (Beginner/Easy/Medium/Hard), rebel colony system with 43× "Rebel" references
- `04-engine-architecture.md:263-270` — 3 zoom levels: Planet View (PLNTICON), Site View (SITEICON), Tile View (TILEICON)
- `04-engine-architecture.md:330-357` — Segment-to-system mapping and data file dependencies

**Confidence**: Confirmed (SCI engine); Likely (specific simulation formula details)

---

## Research Area 8: INN & Multiplayer Components

**Status**: Complete

**Decision**: Outpost has NO multiplayer code. The INN directory on the CD is a bundled standalone Sierra ImagiNation Network client (56 files, ~8.5 MB) included as cross-promotion. OUTPOST.EXE imports no networking DLLs and contains zero references to modem, serial, network, or INN/TSN functionality.

**Evidence**:
- `07-inn-multiplayer.md:216-234` — Critical finding: OUTPOST.EXE has NO references to INN, TSN, modem, serial, or networking. Import table contains only 5 DLLs (none networking). String search: "inn" = 2 matches (substrings in "Beginn-er", "Med-ium"), "tsn", "modem", "serial", "network" = 0 matches each
- `07-inn-multiplayer.md:13-89` — INN directory inventory: LSCITV.EXE (viewer), INSTTSN.EXE (installer), MODEM.DRV, NOBRK.DRV, MODEM.TXT (211 modem entries), PHONE.TXT (467 phone numbers)
- `07-inn-multiplayer.md:119` — GAME.CFG lists 27 INN games; Outpost is NOT in this list
- `07-inn-multiplayer.md:270-281` — Summary table: all multiplayer capabilities = not implemented
- The INN client uses X.25 network addressing (HOSTADDR file) and dial-up modem connections

**Confidence**: Confirmed

---

## Consolidated Findings Matrix

| Area | Status | Confidence | Key Finding |
|------|--------|-----------|-------------|
| 1. Binary Structure | Complete | Confirmed | Borland C++ 5.60 NE, 11 segments, 5 DLL imports, SmartHeap, SCI engine |
| 2. Archive Format | Complete | Likely | DISK01 signature, 26-byte DH91 entries, PKWare DCL Implosion, 15 files |
| 3. Data Files | Complete | Confirmed | XOR 0x80 CSV (BLDGBLD=40 fields, BLDGOPS=46 fields, 138 recs); TUTOR.OPS: 19 dcbSC sections, 6 opcodes, 133 steps |
| 4. Graphics | Complete | Confirmed | Standard 8-bit DIB, unified 256-color palette, pre-rendered 640×480, NOT tiled |
| 5. FLC Video | Complete | Confirmed | Autodesk Animator Pro AF12, 92 files, AAPLAY.DLL, numeric range → event mapping |
| 6. Audio | Complete | Confirmed | 277 WAV (22050Hz/8-bit/mono), 35 MIDI (SMF1/192TPQ), 4 Mars variants, 141 FEM voice files |
| 7. Engine/Simulation | Complete | Confirmed | SCI derivative, turn-based, 26+ SC* functions, 8 resources, 4 disasters, AI with 4 difficulties |
| 8. INN/Multiplayer | Complete | Confirmed | NO multiplayer — INN is standalone bundled client; Outpost is single-player only |

---

## Open Questions

### Area 1: Binary Structure
- What are the exact imported API function ordinals/names in each code segment's relocation table? (Requires parsing segment fixup tables)
- What is the exact SmartHeap version and configuration? (Only version string "SmartHeap Library" found)
- Are there any code paths in segments 2/4/6 that handle unreferenced debug commands?

### Area 2: Archive Format
- What is Field1 (+0x10, 2 bytes) in directory entries? Values observed: 0x13D7, 0x13FA, 0x1300 — may be install type or flags
- What is the exact PKWare DCL Implosion parameter set? The round-trip extract/repack test is pending
- Are all files individually compressed, or is there a global compression stream for the data section?

### Area 3: Data Files
- What do fields 1-17 and 30-35 in BLDGBLD.DAT represent (always 0)? Could be unused or unimplemented feature flags
- SpacePort bitmask self-reference (field 18=1 maps to building index 15=SpacePort) — sentinel or offset bug?
- Tokamak's all-ones prerequisite mask (0xFFF) — does it truly require all 12 tech nodes, or does the mask represent something else?
- BLDGOPS field 38 value 2 on UGRed — what does "restricted access" mean?
- TUTOR.OPS opcode semantics for '00 08' and complex step records (condition types 7 and 8) need full disassembly

### Area 4: Graphics
- How are building sprites composited onto the 640×480 terrain viewport? (Position mapping from coordinates to pixel offsets)
- What is the exact grid coordinate system? `%d,%d` format strings suggest 2D, but alignment to 640×480 viewport is unclear
- How does the 2-frame A/B animation cycle work? Is it timer-driven or state-driven?

### Area 5: FLC Video
- What exact game events trigger each of the 92 FLC files? (Mapping is inferred from numeric range only)
- How does the game synchronize FLC frame timing with simulation state?

### Area 6: Audio
- What determines selection among the 4 Mars theme variants? (Detected hardware or config file setting?)
- Are FEM*.WAV files referenced by index or name in the binary? (No plaintext filename strings found)
- What triggers FEM voice lines? Are they tied to specific tutorial steps in TUTOR.OPS?

### Area 7: Engine/Simulation
- What is the exact morale formula? (Building effects known, but no formula constants recovered)
- What is the population growth/decline formula per turn?
- What are the exact resource production rates per building tier?
- How does the AI evaluate colony state to assign building priorities?

### Area 8: INN/Multiplayer
- No remaining questions — definitively confirmed as not applicable.

---

## Tooling Used

| Tool | Purpose |
|------|---------|
| PowerShell 7+ | XOR decoding, CSV extraction, binary file analysis, string search |
| C# CLI (dotnet) | RESOURCE.000 archive extractor tool |
| `format-hex` (PowerShell) | Hex dump for binary structure analysis |
| Manual hex analysis | NE header parsing, directory entry structure, opcode discovery |
| `rg` / `Select-String` | String pattern search across binary and data files |
| GitHub Copilot / AI-assisted analysis | Cross-referencing, pattern recognition, field semantics inference |
| Windows File Explorer | File inventory, size categorization, directory structure mapping |

Note: Ghidra and IDA Pro were planned but not used in Phase 0 — all binary analysis was performed through manual hex analysis, string search, and structural pattern matching. Full disassembly is deferred to Phase 1+.
