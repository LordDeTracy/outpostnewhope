# Data Model: Outpost Reverse Engineering

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A1–A3, B1–B3, C1–C4). See [ERRATA.md](findings/ERRATA.md) and the verified [00-ground-truth.md](findings/00-ground-truth.md) before relying on it.

**Phase**: Phase 1 — Design Artifacts
**Date**: 2026-06-10
**Status**: Complete — all data structures documented from Phase 0 findings

---

## RESOURCE.000 Archive

### File Header (6 bytes at offset 0x00)

| Offset | Size | Field | Value | Description |
|--------|------|-------|-------|-------------|
| 0x00 | 6 | Signature | `44 49 53 4B 30 31` = "DISK01" | Archive magic bytes |

Directory begins immediately at offset 0x06.

### Directory Entry (26 bytes each)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 16 | Filename | Null-padded ASCII, prefixed with "DH91" (game code identifier) |
| 0x10 | 2 | Field1 | Unknown — values: 0x13D7, 0x13FA, 0x1300 (install type or flags) |
| 0x12 | 4 | CompressedSize | Size of compressed file data in archive (LE uint32) |
| 0x16 | 4 | BatchID | Install group ID — `CE 1E 40 0E` shared across multiple files (LE uint32) |

Directory entries are terminated by sentinel entry `DH91THE_END` at the end.

### Compression

| Field | Value |
|-------|-------|
| Algorithm | PKWare DCL Implosion (IMPODE) |
| Field2 = mode | Compression mode indicator |
| Field6 = dict size | Dictionary size encoded in bits 4-5 of byte at entry+0x15? |
| Total compressed | 1,130,608 bytes |
| Total uncompressed | ~1,656,468 bytes (68% ratio) |

### Catalog (15 files in order)

| # | Filename | Compressed Size | Field1 |
|---|----------|----------------|--------|
| 1 | BLDGBLD.DAT | 0x0566 | 0x13D7 |
| 2 | BLDGOPS.DAT | 0x04DB | 0x13FA |
| 3 | AAPLAY.DLL | 0x016944 | 0x13FA |
| 4 | AAVGA.DLL | 0x00157E | 0x13FA |
| 5 | OUTHELP.DLL | 0x001050 | 0x13FA |
| 6 | DIB.DRV | 0x004EBA | 0x13FA |
| 7 | MCIAAP.DRV | 0x001BDA | 0x13FA |
| 8 | OUTPOST.EXE | 0x05064F | 0x13FA |
| 9 | OUTHLE.HLP | 0x08B61A | 0x13FA |
| 10 | OUTPOST.INI | 0x00001A | 0x13FA |
| 11 | READ.ME | 0x0026FA | 0x13FA |
| 12 | 0WSCINIT.MID | 0x000077 | 0x1300 |
| 13 | MARS.MID | 0x01425E | 0x13FA |
| 14 | TUTOR.OPS | 0x0014AB | 0x13FA |
| 15 | THE_END | — | End marker (zeros) |

### Extractor Tool
- Location: `tools/resource-extractor/dotnet-cli/`
- Usage: `dotnet run --project tools\resource-extractor\dotnet-cli\ResourceExtractor.csproj -c Release -- "Outpost\RESOURCE.000" "Resource.000 extract"`

---

## OUTPOST.EXE

### Format
- 16-bit Windows NE (New Executable), Borland C++ 5.60
- Target: Windows 3.10
- File size: 640,896 bytes (0x9C900)
- Sector alignment: 2^4 = 16 bytes

### NE Header (56 bytes at file offset 0x80)

| Offset | Size | Field | Value | Notes |
|--------|------|-------|-------|-------|
| +0x00 | 2 | Signature | `4E 45` = "NE" | Valid NE marker |
| +0x02 | 1 | Linker Major | 5 | Borland C++ 3.x / Turbo C++ for Windows |
| +0x03 | 1 | Linker Minor | 60 | Version 5.60 |
| +0x04 | 2 | Entry Table Offset | 0x08FD | Relative to NE header = file offset 0x97D |
| +0x06 | 2 | Entry Table Length | 15 bytes | No exported movable entries |
| +0x08 | 4 | CRC32 | 0x00000000 | Not computed |
| +0x0C | 2 | Flags | 0x032A | MULTIPLEDATA \| PROTMODE \| DEBUGINFO |
| +0x0E | 2 | Auto Data Segment | 11 | Segment 11 = DGROUP |
| +0x10 | 2 | Initial Heap Size | 0x1000 (4096) | 4KB local heap |
| +0x12 | 2 | Initial Stack Size | 0x2800 (10240) | 10KB stack |
| +0x14 | 4 | CS:IP Entry Point | 1:0x23 | Segment 1, offset 0x23 |
| +0x18 | 4 | SS:SP Stack Pointer | 11:0 | Stack in DGROUP |
| +0x1C | 2 | Segment Count | 11 | 4 code, 4 data, 3 BSS |
| +0x1E | 2 | Module Ref Count | 5 | 5 imported DLLs |
| +0x20 | 2 | Non-Resident Name Size | 72 bytes | |
| +0x22 | 2 | Segment Table Offset | 0x0040 | Relative to NE header = file offset 0xC0 |
| +0x24 | 2 | Resource Table Offset | 0x0098 | Relative = file offset 0x118 (invalid/corrupt) |
| +0x26 | 2 | Resident Name Table Off. | 0x0899 | Relative = file offset 0x919 |
| +0x28 | 2 | Module Ref Table Offset | 0x08D1 | Relative = file offset 0x951 |
| +0x2A | 2 | Imported Name Table Off. | 0x08DB | Relative = file offset 0x95B |
| +0x2C | 4 | Non-Resident Name Table | 0x0000098C | File-absolute offset |
| +0x30 | 2 | Movable Entry Count | 2 | |
| +0x32 | 2 | Log Sector Align Shift | 4 | Sector = 2^4 = 16 bytes |
| +0x34 | 2 | Resource Segment Count | 0 | No resource segments |
| +0x36 | 1 | OS Type | 2 | OS/2 flag (Borland quirk — actually Windows) |
| +0x37 | 1 | Additional Flags | 0x08 | |
| +0x38 | 2 | Return Thunks Offset | 0xA0 | |
| +0x3A | 2 | Segment Ref Thunks Off | 0x8764 | |
| +0x3C | 2 | Min Code Swap Area | 0 | |
| +0x3E | 2 | Expected Windows Ver | 0x030A | Windows 3.10 |

### Module References (Imported DLLs)

| Index | Handle | Name | Purpose |
|-------|--------|------|---------|
| 1 | 0x0001 | KERNEL | Core OS services (memory, tasks) |
| 2 | 0x0008 | GDI | Graphics Device Interface (bitmaps, DIB) |
| 3 | 0x000C | USER | Window management, messaging, menus |
| 4 | 0x0011 | MMSYSTEM | Multimedia (audio, timer) |
| 5 | 0x001A | COMMDLG | Common dialogs (file open/save) |

### Imported Name Table Location
- File offset 0x95B
- Format: length-prefixed names: `06 KERNEL`, `03 GDI`, `04 USER`, `08 MMSYSTEM`, `07 COMMDLG`

### Segment Table (11 entries × 12 bytes = 132 bytes at offset 0xC0)

| Seg# | File Offset | Byte Length | Type | Attributes |
|------|-------------|-------------|------|-----------|
| 1 | 0x0A20 | 351,088 | DATA | DISCARDABLE \| HUGE \| SHARED |
| 2 | 0xD500 | — | CODE (overlay) | PUREDATA \| DISCARDABLE \| HUGE \| RESIDENT |
| 3 | 0x24460 | 977,056 | DATA | DISCARDABLE \| HUGE \| SHARED |
| 4 | 0xD500 | — | CODE (overlay) | PUREDATA \| RELOCS \| DEBUG \| DISCARDABLE |
| 5 | 0x516C0 | 981,344 | DATA | DISCARDABLE \| HUGE \| SHARED |
| 6 | 0xD500 | — | CODE (overlay) | PUREDATA \| RELOCS \| DEBUG \| HUGE \| SHARED |
| 7 | 0x7D4C0 | 271,296 | DATA | MOVABLE \| DISCARDABLE \| HUGE \| SHARED |
| 8 | 0xD510 | 428,896 | CODE | PRELOAD (WinMain + bootstrap) |
| 9 | 0x0000 | BSS | CODE | PUREDATA (zero-filled) |
| 10 | 0x0000 | BSS | CODE | PUREDATA (zero-filled) |
| 11 | 0x0000 | BSS | CODE | PUREDATA (zero-filled, DGROUP) |

### Resident Name Table (offset 0x919)

| Ordinal | Name | Type |
|---------|------|------|
| — | SITEICON | Icon resource |
| — | PLNTICON | Icon resource |
| — | TILEICON | Icon resource |
| — | OPPOPMENU | Popup menu |
| — | TILEMENU | Tile menu |
| — | TPPOPMENU | Tile placement popup |
| — | SCPOPMENU | Screen popup menu |
| — | PCPOPMENU | Planet control popup |
| — | REPORTPOPMENU | Report popup menu |
| 1 | ___EXPORTEDSTUB | Code export (Borland linker stub) |
| 2 | _SHI_INVOKEERRORHANDLER1 | Code export (SmartHeap error handler) |

### Non-Resident Name Table (offset 0x98C)

Copyright string only (72 bytes):
`"Outpost is Copyright 1994, Sierra On-Line, Inc. All Rights Reserved."`

### Entry Table (offset 0x97D, 15 bytes)

Effectively empty — no movable exported entry points. The game uses fixed segment addressing.

---

## BLDGBLD.DAT (12,403 bytes) — Building Definitions

### Encoding
- XOR 0x80 on all bytes except `0D 0A` (CR+LF) record terminators
- Comma-separated fields, quoted strings
- 138 records × 40 fields each

### Record Layout (40 fields, indices 0-39)

| Field | Type | Values | Meaning |
|-------|------|--------|---------|
| 0 | string | — | Building name (unique identifier) |
| 1–17 | int | 0 | Reserved / padding |
| 18 | bit | 0/1 | Prereq: SpacePort (index 15) exists |
| 19 | bit | 0/1 | Prereq: DisMine (index 16) exists |
| 20 | bit | 0/1 | Prereq: MassDrv (index 17) exists |
| 21 | bit | 0/1 | Prereq: SolrPwrRecvr (index 18) exists |
| 22 | bit | 0/1 | Prereq: MShipTokamak (index 19) exists |
| 23 | bit | 0/1 | Prereq: Tokamak (index 20) exists |
| 24 | bit | 0/1 | Prereq: Tokamak2 (index 21) exists |
| 25 | bit | 0/1 | Prereq: LMono (index 22) exists |
| 26 | bit | 0/1 | Prereq: RMono (index 23) exists |
| 27 | bit | 0/1 | Prereq: XMono (index 24) exists |
| 28 | bit | 0/1 | Prereq: LMonoTrain (index 25) exists |
| 29 | bit | 0/1 | Prereq: RMonoTrain (index 26) exists |
| 30–35 | int | 0 | Reserved / padding |
| 36 | int | 0–7 | Cost tier: 0=free, 1=minimal(Tokamak), 2=low(Warehouse), 3=medium(AgriDome), 4=medium-high(Spew), 5=high(Monorail), 6=very high(Fact/Chap), 7=maximum(ActiveMine2) |
| 37 | int | 0–5 | Build time tier: 0=instant(Seed), 1=very fast(Storage), 2=fast(most), 3=medium(Spew), 4=slow(SpacePort), 5=very slow(ActiveMine2) |
| 38 | int | 0–12 | Resource category: 1=Pipe, 2=Storage/Trade, 3=UG Structural, 4=Life Support/Power, 5=Agriculture, 6=Manufacturing, 7=Mining/Ore, 8=Refinery, 9=Power/Tokamak, 10=Seed, 12=Monorail |
| 39 | int | 0–10 | Building category: 0=Terrain/Special, 1=Trade/Transport, 2=UG Structures, 3=Surface Utility, 4=UG Factory/Med, 5=Agriculture/Advanced, 7=Ore/Refinery, 8=Factory/Smelter, 9=TerraForm, 10=Seed/Power |

### Record Index Map (138 records)

| Range | Count | Category |
|-------|-------|----------|
| 0–5 | 6 | Surface terrain types (Unknown, Clear, Rough, Hostile, Hopeless, Dozed) |
| 6–9 | 4 | Underground terrain (UGEasy, UGDiff, UGImposs, UGDozed) |
| 10 | 1 | Seed pod |
| 11–14 | 4 | Seed building variants (SeedCommand, SeedSmelter, SeedPower, SeedFact) |
| 15–137 | 123 | Buildings, infrastructure, robots, orbital entities |

---

## BLDGOPS.DAT (14,049 bytes) — Building Operational Parameters

### Encoding
- XOR 0x80 (identical to BLDGBLD.DAT)
- 138 records × 46 fields each
- Cross-referenced with BLDGBLD.DAT by index (same ordering)

### Record Layout (46 fields, indices 0-45)

| Field | Type | Values | Meaning |
|-------|------|--------|---------|
| 0 | string | — | Building name (matches BLDGBLD.DAT record 0) |
| 1–21 | int | 0 | Reserved / padding |
| 22 | bit | 0/1 | Ops prereq: MShipTokamak (index 19) running |
| 23 | bit | 0/1 | Ops prereq: Tokamak (index 20) running |
| 24 | bit | 0/1 | Ops prereq: Tokamak2 (index 21) running |
| 25 | bit | 0/1 | Ops prereq: LMono (index 22) running |
| 26 | bit | 0/1 | Ops prereq: RMono (index 23) running |
| 27 | bit | 0/1 | Ops prereq: XMono (index 24) running |
| 28 | bit | 0/1 | Ops prereq: LMonoTrain (index 25) running |
| 29 | bit | 0/1 | Ops prereq: RMonoTrain (index 26) running |
| 30 | bit | 0/1 | Ops prereq: AgriDome (index 27) running |
| 31 | bit | 0/1 | Ops prereq: AgriDome2 (index 28) running |
| 32 | bit | 0/1 | Ops prereq: AgriDome3 (index 29) running |
| 33 | bit | 0/1 | Ops prereq: Fact (index 30) running |
| 34 | bit | 0/1 | Ops prereq: Fact2 (index 31) running |
| 35 | bit | 0/1 | Ops prereq: Fact3 (index 32) running |
| 36 | int | 0–5 | Power cost tier: 0=none, 1=minimal, 2=low, 3=medium, 4=high, 5=maximum |
| 37 | int | 0–4 | Staffing tier: 0=none, 1=low, 2=medium, 3=moderate, 4=high |
| 38 | int | -1/0/1/2/5 | Special flag: -1=HotLab meltdown risk, 0=normal, 1=requires colonists, 2=restricted access(UGRed), 5=TerraForm module |
| 39–45 | int | 0 | Reserved |

---

## TUTOR.OPS (20,276 bytes) — Tutorial Script

### File-Level Header
- 5 bytes: `53 43 30 30 31` = "SC001"

### Section System
- 19 sections identified by `dcbSC` + 2 hex digits marker
- Total markers: dcbSC01 through dcbSC13 (dcbSC0b appears at end of file out of order)

### Section Catalog

| Section | Offset | Body Size | Content |
|---------|--------|-----------|---------|
| dcbSC01 | 0x0005 | 28 | Master reference table (14 × uint16) |
| dcbSC02 | 0x0028 | 32 | Section descriptor |
| dcbSC03 | 0x004F | 302 | Flag bitfield (151 × uint16 0/1) |
| dcbSC04 | 0x0184 | 28 | String table: "Aphrodite", "Anonymous Bosch" |
| dcbSC05 | 0x01A7 | 6 | 3 × uint16 (0, 3, 0) |
| dcbSC06 | 0x01B4 | 68 | Tutorial step sequence IDs |
| dcbSC07 | 0x01FF | 28 | 14 × uint16 (mostly 1) |
| dcbSC08 | 0x0222 | 0 | Empty (marker only) |
| dcbSC09 | 0x0229 | 36 | 9 × uint32 data values |
| dcbSC0a | 0x0254 | 146 | Index array + "Aphrodite"/"Anonymous Bosch" data |
| dcbSC0c | 0x02ED | 63 | "Sigma Draconis" + mapping data |
| dcbSC0d | 0x0333 | 145 | "Sigma Draconis 4" + step references |
| dcbSC0e | 0x03CB | 213 | "Vulcan's Forge" + paired references |
| dcbSC0f | 0x04A7 | 3989 | Dialog text references / script entry points |
| dcbSC10 | 0x1443 | 7484 | **Main step definition table (133 steps)** |
| dcbSC11 | 0x3186 | 264 | Step-to-reference mapping (26 entries × 10 bytes) |
| dcbSC12 | 0x3295 | 5410 | Event/condition mapping |
| dcbSC13 | 0x47BE | 1888 | 0x0000/0xFFFF flag matrix |
| dcbSC0b | 0x4F25 | 8 | Footer: two uint32 both = 2 |

### Opcode System

| Opcode | Operands | Description |
|--------|----------|-------------|
| `00 03` | 3 × uint16 LE | Text/string: [text_length] [char_code] [padding] |
| `00 04` | 1 × uint16 LE | Step header or reference link |
| `00 05` | 1–3 × uint16 LE | General-purpose data parameter |
| `00 06` | 1 × uint16 LE | Mapping/condition value |
| `00 07` | 0–4 × uint16 LE | End-of-record / separator |
| `00 08` | variable | Condition sub-type |

### Step Record Format (dcbSC10, 34 bytes each)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 4 | Step header | `01 00 00 04` (marker + opcode) |
| 4 | 2 | Step ID | LE uint16 step identifier |
| 6 | 2 | Opcode 05 | `00 05` parameter opcode prefix |
| 8 | 2 | Value | Always `03 00` |
| 10 | 2 | Opcode 03 | `00 03` text opcode prefix |
| 12 | 2 | Text length | LE uint16 (17-27 typical, up to 283 outliers) |
| 14 | 2 | Speaker code | ASCII character as uint16 LE (0x40='@', 0x41='A'...0x48='H') |
| 16 | 8 | Parameter block | 4 × uint16: [flag] [condition_type] [param1] [param2/value] |
| 24 | 2 | Opcode 07 | `00 07` end marker |
| 26 | 8 | Padding | Zero bytes |

### Speaker Character Codes

| Code | Count | Meaning |
|------|-------|---------|
| 0x40 '@' | 11 | System/Special |
| 0x41 'A' | 10 | Character A |
| 0x42 'B' | 12 | Character B |
| 0x43 'C' | 18 | Commander? |
| 0x44 'D' | 16 | Doctor? |
| 0x45 'E' | 13 | Engineer? |
| 0x46 'F' | 10 | Character F |
| 0x47 'G' | 9 | Character G |
| 0x48 'H' | 2 | Character H |

### Step-to-Reference Mapping (dcbSC11, 26 entries × 10 bytes)

| Offset | Size | Field |
|--------|------|-------|
| 0 | 2 | Sequence index (1-26, LE) |
| 2 | 2 | `00 06` (mapping opcode) |
| 4 | 2 | Reference value (LE, e.g., 0x0157 for dialog set) |
| 6 | 2 | `00 05` (target opcode) |
| 8 | 2 | Target speaker index (1-5, LE) |

---

## Tile Map — Coordinate System

### Not a Tiled Engine
The game uses pre-rendered full-view 640×480 bitmaps, NOT a tile-sheet-based renderer.

### Terrain Types (6 variants)
- TILE1.BMP through TILE6.BMP — 640×480 pre-rendered planet surface views
- Animation variants: TILE4A/B.BMP, TILE5A/B.BMP (A/B frame flip)
- Additional terrain overlays: 1020.BMP, 1030.BMP through 1090A.BMP, 1100.BMP-1248.BMP

### Zoom Levels

| View | Icon | Description |
|------|------|-------------|
| Planet View | PLNTICON (32×32) | Planetary overview with site selection |
| Site View | SITEICON (32×32) | Colony zoom-in for building placement |
| Tile View | TILEICON (32×32) | Individual tile inspection |

### Coordinate System
- Grid positioning via `"%d,%d"` format strings
- Selection rectangles via `"%d,%d,%d,%d"` format strings
- Site identifiers via `"Site %d"` — indexed colony locations

### Minimap
- 1TILE.BMP at 132×125 — minimap tile legend
- SURFACE.BMP + LEVEL1-4.BMP at 77×19 — elevation/terrain indicator strips

---

## Bitmap Format

### File Layout (Standard Windows DIB)

| Offset | Size | Field | Value | Description |
|--------|------|-------|-------|-------------|
| 0 | 2 | bfType | `42 4D` = "BM" | Signature |
| 2 | 4 | bfSize | varies | Total file size |
| 6 | 4 | bfReserved | 0 | Unused |
| 10 | 4 | bfOffBits | 0x0436 (1078) | Pixel data offset |
| 14 | 4 | biSize | 40 | BITMAPINFOHEADER size |
| 18 | 4 | biWidth | varies | Width in pixels |
| 22 | 4 | biHeight | varies | Height in pixels (positive = bottom-up) |
| 26 | 2 | biPlanes | 1 | Color planes |
| 28 | 2 | biBitCount | 8 | 8 bits per pixel |
| 30 | 4 | biCompression | 0 | BI_RGB (no compression) |
| 34 | 4 | biSizeImage | varies | Raw pixel data size |
| 38 | 4 | biXPelsPerMeter | 0 | Unused |
| 42 | 4 | biYPelsPerMeter | 0 | Unused |
| 46 | 4 | biClrUsed | 256 | Full palette |
| 50 | 4 | biClrImportant | 256 | All colors important |
| 54 | 1024 | Palette | 256×RGBQUAD | VGA palette (B,G,R,reserved) |
| 1078 | varies | Pixel data | 8-bit indexed | Bottom-up, row-stride 4-byte aligned |

### Size Categories

| Dimensions | Size (bytes) | Count | Category |
|------------|-------------|-------|----------|
| 640×480 | 308,278 | 80 | Terrain / planet maps |
| 300×150 | 46,078 | 141 | Building sprites |
| 145×120 | 18,838 | 70 | Robot / vehicle sprites |
| 132×125 | 17,578 | 1 | Minimap tile legend |
| 77×19 | 2,598 | 5 | Elevation strips |
| 32×32 | 2,102 | 3 | View icons |
| 63×21 | 2,422 | 2 | UI buttons |
| 19×19 | 1,458 | 2 | Tiny UI controls |

### Animation Convention
- A/B filename suffix = 2-frame animation (e.g., `500A.BMP` ↔ `500.BMP`)
- Applies to building IDs 500-579, some terrain tiles, and some robot sprites

### Palette
- 256-color VGA palette at offset 54 (1024 bytes: 256 × RGBQUAD)
- Entry format: B, G, R, reserved (1 byte each)
- Entry 0: black
- Entries 1-9: Standard VGA/CGA colors
- Entries 10-25: Grayscale ramp (12-step)
- Entries 26+: Game-specific terrain/building colors
- First 208 entries shared between terrain and building sprites
- 224 of 256 shared between buildings and robots

---

## Colony State — Runtime Data Model

### Resources

| Resource | Data Type | Description |
|----------|-----------|-------------|
| Common Metals | uint32 | Ore/minerals from mines |
| Rare Metals | uint32 | Rare/special materials |
| Food | uint32 | Food from AgriDomes |
| Energy | uint32 | Power from Tokamaks/Solar |
| Population | uint32 | Colonist count |
| Morale | uint16 | Colony happiness (0-100?) |

### Simulation Engine Functions (SCI)

| Function | Role |
|----------|------|
| SCSetup | Initialize simulation state |
| SCEndSim | Shut down simulation |
| SCFillResources | Distribute resources to buildings |
| SCMines | Process mining output |
| SCFactory | Process factory output |
| SCPower | Compute power grid balance |
| SCMorale | Compute colony morale |
| SCGenKids | Handle population growth |
| SCStarve | Handle starvation (population loss) |
| SCAddSpew | Process refinery output |
| SCConstruct | Handle construction projects |
| SCEvent | Process random/scheduled events |
| SCAiInput | Process AI decisions |
| SCProdSched | Run production schedules |
| SCRchSched | Run research schedules |
| SCSelect | Handle UI selection |

### Simulation Order (each turn)
1. Resource gathering: SCFillResources → SCMines → SCFactory
2. Consumption: SCPower → SCStarve
3. Population: SCGenKids → SCMorale
4. AI: SCAiInput
5. Events: SCEvent
6. Production: SCProdSched → SCRchSched

### Disaster System

| Type | Trigger | Effect |
|------|---------|--------|
| Plague | Random event | Population loss |
| Meteor | Random event | Building destruction |
| Earthquake | Random event | Structural damage |
| Fire | Random event | Building fire |
| Nuclear accident | BLDGOPS field 38 = -1 (HotLab) | Meltdown |
| Mass driver misfire | Player-triggered | Weapon against rebels |

### Save Game
- Format: `*.ops` (same binary format as TUTOR.OPS)
- Uses COMMDLG.DLL for File Save/Open dialogs
- Saved state includes: playerName, aiName, turns, all building states, resource levels, morale, event queue, tech progression, difficulty

---

## FLC Video Format

### File Header (128 bytes, Autodesk Animator Pro)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0 | 4 | size | Total file size |
| 4 | 2 | magic | 0xAF12 (FLC format) |
| 6 | 2 | frames | Number of frames |
| 8 | 2 | width | Width in pixels |
| 10 | 2 | height | Height in pixels |
| 12 | 2 | depth | 8 (256 colors) |
| 14 | 2 | flags | 0x0003 typical |
| 16 | 4 | speed | Delay in jiffies (1/70 sec) |

### Frame Chunk Structure

```c
typedef struct {
    DWORD size;       // chunk size including header
    WORD  type;       // 0xF1F0 = frame, 0xF1FA = prefix
    WORD  subchunks;  // number of subchunks
    DWORD reserved;
    LONG  delay;      // delay in jiffies
} FLIC_FRAME;
```

### Subchunk Types

| Type | Name | Description |
|------|------|-------------|
| 0x0004 | FLC_BRUN | Byte-run compressed full frame |
| 0x0007 | FLC_LC_256 | Line-compressed 256-color |
| 0x000F | FLC_DELTA | Delta compressed full frame |
| 0x0012 | FLC_LC | 64-color line compressed (palette) |

### Playback Frame Types
- **Ring frame** (type 0xF1F0): full image + initial palette
- **Prefix frame** (type 0xF1FA): palette updates + LC_256 deltas
- **Delta frames**: inter-frame compression (FLC_DELTA or FLC_LC_256)

### Event-to-FLC Mapping (by numeric range)

| Range | Count | Event Type |
|-------|-------|------------|
| 10-49 | 16 | Launch sequences |
| 50-99 | 11 | Transitions / in-flight |
| 100-199 | 19 | Colony events / disasters |
| 200-299 | 17 | Vehicle / unit animations |
| 300-399 | 16 | UI transitions |
| 400-449 | 5 | Building construction |
| 450-453 | 4 | Endings |

### Playback DLLs
- **AAPLAY.DLL** (290,864 bytes): 20+ exported functions (AAPLAY, AAOPEN, AALOAD, AAGETPARM, etc.), assembly-optimized decoder in `AADECODE.ASM`
- **AAVGA.DLL** (13,840 bytes): VGA mode switching for fullscreen
- **DIB.DRV**: DIB rendering to screen (STRETCHDIBITS, DIBTODEVICE, BITBLT)

---

## Audio Data

### WAV Format (277 files)

| Field | Value |
|-------|-------|
| Format | RIFF/WAVE PCM |
| Channels | 1 (mono) |
| Sample rate | 22050 Hz |
| Bits per sample | 8 (unsigned) |
| Block align | 1 |
| Byte rate | 22050 |

### WAV Categories

| Pattern | Count | Content |
|---------|-------|---------|
| FEM*.WAV | 141 | Female computer voice (FEM1-FEM140, 35KB-2.4MB) |
| ADD*.WAV | 75 | Additional sound effects (ADD1-ADD75) |
| FR7_*.WAV | 4 | Launch sounds |
| M59_*.WAV | 8 | Vehicle/mechanical |
| ALARM*.WAV | 3 | Alert sounds |
| DEMO*.WAV | 2 | Demo narration |
| Standalone SFX | 28 | BOOP, EXPLODE, LAUNCH, ROBODIE, etc. |

### MIDI Format (35 files)

| Field | Value |
|-------|-------|
| Format | SMF Type 1 |
| Division | 192 ticks/quarter-note |
| Tracks | 3-14 (varies) |
| *Exception* | 0WSCINIT.MID uses 96 ticks/quarter-note |

### Mars Theme Hardware Variants

| File | Size | Tracks | Target |
|------|------|--------|--------|
| MARS.MID | 133,424 | 14 | General MIDI |
| MARSMT1.MID | 117,509 | 14 | Roland MT-32 rev 1 |
| MARSMT32.MID | 114,010 | 14 | Roland MT-32 rev 2 |
| MARSCMRL.MID | 25,079 | 14 | Roland CM-32L (stripped) |

### MIDI Categories

| Category | Count | Complexity |
|----------|-------|-----------|
| Mars theme variants | 4 | 14 tracks |
| Satellite themes | 3 | 12-14 tracks |
| Disaster/event | 9 | 4-14 tracks |
| Industrial/vehicle | 6 | 4-14 tracks |
| UI/ambient | 6 | 4-12 tracks |
| Alert/alarm | 2 | 3-5 tracks |
| Launch | 1 | 9 tracks |
| Config/init | 1 | 11 tracks |

### Playback Architecture
- **MMSYSTEM**: `timeSetEvent` for simulation timer, `sndPlaySound` for WAV
- **AAPLAY.DLL**: `_MMOPENSOUND`, `_MMPLAYSOUND`, `_MMSTOPSOUND`, `_MMPAUSESOUND`
- **MCI**: `mciSendCommand`, `mciSendString` for MIDI playback
- **Hardware detection**: `_MMGETDEVICETYPE → _FINDMCIDRIVERS`

---

## OUTPOST.INI (21 bytes)

```ini
[general]
opimage=
```

A single section `[general]` with one key `opimage` (empty value — optional bitmap overlay path).

---

## Tech Tree — Prerequisite Matrix

### Build Prerequisites (BLDGBLD.DAT fields 18-29)
12-bit cumulative checkpoint system mapping to building indices 15-26:

| Bit | Field | Building Index | Building |
|-----|-------|---------------|----------|
| 0 | 18 | 15 | SpacePort |
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
| 11 | 29 | 26 | RMonoTrain |

### Operational Prerequisites (BLDGOPS.DAT fields 22-35)
14-bit mask mapping to building indices 19-32:

| Bit | Field | Building Index | Building |
|-----|-------|---------------|----------|
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

### Build Order / Phase Progression

```
Phase 1: Colonization  → Seed → SpacePort → Roads/Pipes
Phase 2: Extraction    → DisMine → ActiveMine → MassDrv
Phase 3: Power         → SolrPwrRecvr → Tokamak → Tokamak2
Phase 4: Transport     → LMono/RMono → XMono → MonoStation/Train
Phase 5: Production    → Smelter → Spew → Fact
Phase 6: Agriculture   → AgriDome → AgriDome2/3
Phase 7: Admin         → Command → RoboCmd → Cops
Phase 8: R&D           → CommTwr → UGUniv → UGLab → HotLab → Chap
Phase 9: Underground   → UGResident → UGCommercial → UGFact
Phase 10: Mega-Eng     → Dirt → Nano → TerraForm
Phase 11: Endgame      → ActiveMine2
```

---

## Engine Architecture Overview

```
┌──────────────────────────────────────────┐
│         Windows Message Pump             │ ← USER.DLL
│         (WinMain in Seg 8)               │
├──────────────────────────────────────────┤
│       SCI Simulation Layer               │ ← Core engine (SC* functions)
│  (SCSetup, SCEvent, SCMorale, ...)       │   in code segments 2/4/6
├──────────────────────────────────────────┤
│    Subsystem Managers                    │
│  AI (SCAiInput)  │  Render (GDI)        │
│  Audio (MMSYSTEM)│  Save/Load (COMMDLG) │
│  Anim (AAPLAY)   │  Input (USER)        │
├──────────────────────────────────────────┤
│         Data Layer                       │
│  bldgbld.dat  │  bldgops.dat            │
│  BITMAPS/*    │  *.FLC  │  MUSIC/*      │
│  *.ops (save) │  outpost.ini            │
└──────────────────────────────────────────┘
```

### Segment-to-System Mapping

| Segment | Type | Size | Role |
|---------|------|------|------|
| Seg 1 | DATA | 352K | Game data: tile maps, building defs, UI layout |
| Seg 2,4,6 | CODE (overlays) | Shared | Simulation, AI, rendering code (loaded on-demand) |
| Seg 3 | DATA | 977K | Building sprites, terrain data |
| Seg 5 | DATA | 981K | Additional assets |
| Seg 7 | DATA (movable) | 271K | Dynamic game state (runtime) |
| Seg 8 | CODE (preload) | 428K | WinMain, bootstrap, game loop, timers |
| Seg 9-11 | BSS | 3×72KB | Zero-initialized globals, arrays, buffers |

### Data File Dependencies

| File | Loaded By | Content |
|------|-----------|---------|
| outpost.ini | Engine init (Seg 8) | Config (optional image path) |
| bldgbld.dat | SCSetup (Seg 2/6) | 138 building definitions, XOR-0x80 CSV |
| bldgops.dat | SCSetup (Seg 2/6) | 138 operational params, XOR-0x80 CSV |
| tutor.ops | Tutorial (Seg 2/6) | 19-section binary script |
| *.ops | Save/Load (COMMDLG) | Game saves (same binary format) |
| BITMAPS/*.BMP | Graphics (GDI) | 339 standard 8-bit DIB bitmaps |
| *.FLC | AAPLAY.DLL | 92 Autodesk Animator animations |
| MUSIC/*.WAV | MMSYSTEM | 277 WAV (22050Hz/8-bit/mono) |
| MUSIC/*.MID | MMSYSTEM | 35 MIDI (SMF Type 1) |
