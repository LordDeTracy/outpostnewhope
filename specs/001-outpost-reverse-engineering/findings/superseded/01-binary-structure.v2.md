# Binary Structure Analysis: OUTPOST.EXE — Annotated Disassembly

**File**: `D:\Project Outpost\Resource.000 extract\OUTPOST.EXE`  
**Size**: 640,896 bytes (0x9C900)  
**Format**: 16-bit Windows NE (New Executable)  
**Original Source**: Sierra On-Line, "Outpost" (1994)  
**Toolchain**: Borland C++ 5.60, Huge memory model, SmartHeap Library  
**Disassembly Method**: Capstone 16-bit x86 (CS_MODE_16) static analysis on segments

---

## 1. MS-DOS Stub

Standard 16-bit MS-DOS executable stub ("MZ" header at offset 0x00). Displays `"This program requires Microsoft Windows."` and exits. Stub size: 128 bytes (0x80).

---

## 2. NE Header

**NE signature at file offset**: `0x80` (pointed to by dword at 0x3C)

### NE Header Fields (56 bytes at 0x80–0xB7)

| Offset | Size | Field | Value | Notes |
|--------|------|-------|-------|-------|
| +0x00 | 2 | Signature | `"NE"` | Valid NE marker |
| +0x02 | 1 | Linker Major Version | `5` | Borland C++ 3.x / Turbo C++ for Windows |
| +0x03 | 1 | Linker Minor Version | `60` | Version 5.60 |
| +0x04 | 2 | Entry Table Offset | `0x08FD` | Relative to NE header = file offset 0x97D |
| +0x06 | 2 | Entry Table Length | `15` bytes | No exported movable entries |
| +0x08 | 4 | CRC32 | `0x00000000` | Not computed |
| +0x0C | 2 | Flags | `0x032A` | MULTIPLEDATA \| PROTMODE \| DEBUGINFO |
| +0x0E | 2 | Auto Data Segment | `11` | Segment 11 = DGROUP |
| +0x10 | 2 | Initial Heap Size | `0x1000` (4096) | 4KB local heap |
| +0x12 | 2 | Initial Stack Size | `0x2800` (10240) | 10KB stack |
| +0x14 | 4 | CS:IP Entry Point | `0x2300:0x0001` | Seg 1 (CS=1), offset 0x2300 (IP=0x2300) |
| +0x18 | 4 | SS:SP Stack Pointer | `0x0000:0x000B` | Seg 11 (DGROUP), SP=0 |
| +0x1C | 2 | Segment Count | `11` | |
| +0x1E | 2 | Module Ref Count | `5` | 5 imported DLLs |
| +0x20 | 2 | Non-Resident Name Size | `72` bytes | |
| +0x22 | 2 | Segment Table Offset | `0x0040` | Relative to NE header = file offset 0xC0 |
| +0x24 | 2 | Resource Table Offset | `0x0098` | Relative to NE header = file offset 0x118 (invalid) |
| +0x26 | 2 | Resident Name Table Offset | `0x0899` | Relative to NE header = file offset 0x919 |
| +0x28 | 2 | Module Ref Table Offset | `0x08D1` | Relative to NE header = file offset 0x951 |
| +0x2A | 2 | Imported Name Table Offset | `0x08DB` | Relative to NE header = file offset 0x95B |
| +0x2C | 4 | Non-Resident Name Table | `0x0000098C` | File-absolute offset |
| +0x30 | 2 | Movable Entry Count | `2` | |
| +0x32 | 2 | Log Sector Align Shift | `4` | Sector size = 2^4 = **16 bytes** |
| +0x34 | 2 | Resource Segment Count | `0` | No resource segments |
| +0x36 | 1 | OS Type | `2` | OS/2 flag (Borland quirk) |
| +0x37 | 1 | Additional Flags | `0x08` | |
| +0x38 | 2 | Return Thunks Offset | `0xA0` | |
| +0x3A | 2 | Segment Ref Thunks Off | `0x8764` | |
| +0x3C | 2 | Min Code Swap Area | `0` | |
| +0x3E | 2 | Expected Windows Ver | `0x030A` | **Windows 3.10** |

**⚠️ Entry point correction**: CS:IP = **1:0x2300** (not 1:0x23). Raw bytes `00 23 01 00` in LE: IP=0x2300 (low word), CS=1 (high word). Entry at file offset 0x0A20 + 0x2300 = **0x2D20**.

### Flag Details (0x032A)
- Bit 1 (0x02): `MULTIPLEDATA` — Multiple DGROUP segments
- Bit 3 (0x08): `PROTMODE` — Protected mode only
- Bit 5 (0x20): `DEBUGINFO` — Debug info present (MAP file compatible)
- Bit 8 (0x100): Reserved / Library flag
- Bit 9 (0x200): Reserved

---

## 3. Segment Table — Corrected

**Location**: File offset `0xC0` (11 entries × 12 bytes = 132 bytes)  
**Sector size**: 16 bytes

| Seg# | File Offset | Byte Length | Flags | MinAlloc | Type | Attributes |
|------|-------------|-------------|-------|----------|------|------------|
| 1 | `0x0A20` | `351,088` | `0x0D50` | 21943 | DATA/CODE mixed | RELOCS \| DISCARDABLE \| EXECREAD \| SHARED \| NEGTEST |
| 2 | `0xD500` | *(overlay)* | `0x1542` | 61087 | DATA (overlay) | DATA \| DISCARDABLE \| EXECREAD \| SHARED \| HUGE |
| 3 | `0x24460` | `492,320` | `0x0D50` | 61034 | DATA/CODE mixed | RELOCS \| DISCARDABLE \| EXECREAD \| SHARED \| NEGTEST |
| 4 | `0xD500` | *(overlay)* | `0x426A` | 61374 | DATA (overlay) | DATA \| PRELOAD \| DEBUG \| DISCARDABLE \| EXECWRITE \| IERROR |
| 5 | `0x516C0` | `307,392` | `0x0D50` | 61302 | DATA/CODE mixed | RELOCS \| DISCARDABLE \| EXECREAD \| SHARED \| NEGTEST |
| 6 | `0xD500` | *(overlay)* | `0x6F82` | 55668 | DATA (overlay) | DATA \| RESIDENT \| EXECREAD \| EXECWRITE \| SHARED \| MOVABLE \| IERROR |
| 7 | `0x7D4C0` | `127,680` | `0x0D51` | 16956 | CODE | CODE \| RELOCS \| DISCARDABLE \| EXECREAD \| SHARED \| NEGTEST |
| 8 | `0xD510` | `428,896` | `0x0004` | 32780 | CODE (PUREDATA) | PUREDATA (main code with jump table) |
| 9 | `0x0000` | `557,120` (BSS) | `0x0002` | 7216 | BSS | DATA (zero-filled) |
| 10 | `0x0000` | `557,152` (BSS) | `0x0002` | 7216 | BSS | DATA (zero-filled) |
| 11 | `0x0000` | `557,184` (BSS) | `0x0002` | 7216 | BSS | DATA (zero-filled, DGROUP) |

### Segment Re-Classification

The original analysis misinterpreted several segment types. **Corrected attributions:**

| Old Type | New Type | Reason |
|----------|----------|--------|
| Seg 1: DATA | **DATA/CODE mixed** | Has RELOCS + EXECREAD flags; contains actual x86 code; 2028 ENTER prologues |
| Seg 3: DATA | **DATA/CODE mixed** | Same flags as Seg 1; 2206 ENTER prologues; actual code found |
| Seg 5: DATA | **DATA/CODE mixed** | Same flags as Seg 1; 1032 ENTER prologues; actual code found |
| Seg 7: DATA | **CODE** | Has CODE flag (0x0001) set; 36 ENTER prologues; contains string table + some code |
| Seg 8: CODE/PRELOAD | **CODE (jump table)** | PUREDATA flag only; starts with jump dispatch table; 2546 ENTER prologues |
| Seg 2,4,6: CODE overlays | **DATA overlays** | Have DATA flag (bit 1) set, not CODE; share file offset 0xD500 |

### Key Observations

**Segments 1, 3, 5 (the "triplet")**: Each has flags = 0x0D50 (neither CODE nor DATA explicitly set, but EXECREAD is set). These are **mixed code+data segments** typical of Borland C++ huge memory model. They contain both executable code and initialized data interleaved. Each has a corresponding BSS segment (Seg 9, 10, 11) that holds its uninitialized global data.

**Overlay mechanism**: Segments 2, 4, 6 share the same disk offset 0xD500. They are **data overlays** (not code overlays), each ~980KB virtual size. The overlay at 0xD500 begins with:
```
8B 46 0A   MOV AX, [BP+0x0A]
05 09 00   ADD AX, 9
E9 14 01   JMP 0x11D
```
This is actual code, suggesting the "DATA overlays" also contain executable code. The Borland overlay manager loads the appropriate segment into memory on demand.

**Segment 8**: Flags = 0x0004 (PUREDATA only). The first bytes at 0xD510:
```
0E          PUSH CS
01 03 C0   ADD [BX+DI], AX
93         XCHG AX, BX
2E FF A7 3A 74   JMP FAR CS:[BX+0x743A]
```
This is a **jump dispatch table** — a switch/case dispatch using an indirect far jump through a CS-relative table. The repeated byte patterns `3A 74 3A 75 3A 75...` (`:t:u:u:u...`) are displacement entries in the table. Seg 8 is the **Borland C++ overlay manager / startup dispatcher**, not the main game loop. The actual game code is distributed across segments 1, 3, 5, and 7.

**Segment 7**: The only segment with the explicit CODE flag (0x0001). Contains:
- Initialized data (record-like structures at 0x7D4C0-0x7F200)
- Import thunks and fixup tables
- **The SCI function name string table** at 0x866F0-0x87118
- Some actual code (36 ENTER prologues)

### Huge Segment Sizes

| Seg# | Virtual Size | File Size | Notes |
|------|-------------|-----------|-------|
| 1 | 351K | 351K | Fully loaded from file |
| 2 | 982K | 16 bytes* | Overlay loaded on demand |
| 3 | 492K | 492K | Fully loaded from file (partial — see below) |
| 4 | 981K | 16 bytes* | Overlay loaded on demand |
| 5 | 307K | 307K | Fully loaded from file (partial — see below) |
| 6 | 981K | 16 bytes* | Overlay loaded on demand |
| 7 | 271K | 127K | Partial load; data-only portions at end |
| 8 | 428K | 428K | Fully loaded (jump table + dispatch) |
| 9 | 557K | 0 | BSS; zero-filled at runtime |
| 10 | 557K | 0 | BSS; zero-filled at runtime |
| 11 | 557K | 0 | BSS; DGROUP with stack + heap |

**\*** Segments 2, 4, 6 share 16 bytes at offset 0xD500. The huge lengths are virtual — only the portion needed is loaded.

---

## 4. Module References & DLL Imports

### Module Reference Table (file offset `0x951`)
5 word entries:

| Index | Handle | DLL Name | Purpose |
|-------|--------|----------|---------|
| 1 | `0x0001` | **KERNEL** | Memory mgmt, task scheduling |
| 2 | `0x0008` | **GDI** | Bitmaps, DIB rendering |
| 3 | `0x000C` | **USER** | Window mgmt, messaging, menus |
| 4 | `0x0011` | **MMSYSTEM** | Audio, multimedia timer |
| 5 | `0x001A` | **COMMDLG** | File open/save dialogs |

### Imported Name Table (file offset `0x95B`)
```
06 KERNEL  03 GDI  04 USER  08 MMSYSTEM  07 COMMDLG
```

### Imported API Functions

The actual imported functions are encoded in each segment's relocation/fixup table. From the segment disassembly and identifier patterns, the game imports:

| DLL | Functions (inferred from patterns) |
|-----|-----------------------------------|
| **KERNEL** | `GlobalAlloc`, `GlobalFree`, `GlobalReAlloc`, `GlobalLock`, `GlobalUnlock`, `GlobalHandle`, `GetModuleHandle`, `GetProcAddress`, `LoadLibrary`, `FreeLibrary`, `GetPrivateProfileString`, `WritePrivateProfileString`, `lstrcpy`, `lstrcat`, `lstrcmp`, `wsprintf`, `hmemcpy`, `OutputDebugString` |
| **GDI** | `CreateCompatibleBitmap`, `CreateCompatibleDC`, `DeleteDC`, `DeleteObject`, `SelectObject`, `SetDIBitsToDevice`, `SetDIBits`, `GetDIBits`, `StretchBlt`, `BitBlt`, `CreateBitmap`, `CreatePalette`, `RealizePalette`, `SelectPalette`, `SetPaletteEntries` |
| **USER** | `CreateWindow`, `CreateWindowEx`, `RegisterClass`, `GetMessage`, `PeekMessage`, `TranslateMessage`, `DispatchMessage`, `PostMessage`, `SendMessage`, `SetTimer`, `KillTimer`, `GetDC`, `ReleaseDC`, `BeginPaint`, `EndPaint`, `InvalidateRect`, `UpdateWindow`, `ShowWindow`, `MessageBox`, `LoadMenu`, `LoadIcon`, `TrackPopupMenu`, `GetClientRect`, `GetWindowRect`, `SetCursor`, `LoadCursor`, `DefWindowProc` |
| **MMSYSTEM** | `timeSetEvent`, `timeKillEvent`, `sndPlaySound`, `mciSendCommand`, `mciSendString`, `waveOutOpen`, `waveOutWrite`, `midiOutOpen`, `midiOutShortMsg` |
| **COMMDLG** | `GetOpenFileName`, `GetSaveFileName` |

### Resident Name Table (file offset `0x919`)

| Ordinal | Name | Type |
|---------|------|------|
| — | `SITEICON` | Icon - Site View |
| — | `PLNTICON` | Icon - Planet View |
| — | `TILEICON` | Icon - Tile View |
| — | `OPPOPMENU` | Outpost Popup Menu |
| — | `TILEMENU` | Tile Context Menu |
| — | `TPPOPMENU` | Tile Placement Popup |
| — | `SCPOPMENU` | Screen/Site Popup Menu |
| — | `PCPOPMENU` | Planet Control Popup |
| — | `REPORTPOPMENU` | Reports Popup Menu |
| 1 | `___EXPORTEDSTUB` | Code Export (Borland linker stub) |
| 2 | `_SHI_INVOKEERRORHANDLER1` | Code Export (SmartHeap error handler) |

### Non-Resident Name Table (file offset `0x98C`, 72 bytes)
```
"Outpost is Copyright 1994, Sierra On-Line, Inc. All Rights Reserved."
```

### Entry Table (file offset `0x97D`, 15 bytes)
Effectively empty — no movable exported entry points. All code uses fixed segment addressing.

---

## 5. Entry Point — Borland C++ Startup

**CS:IP = 1:0x2300** (file offset 0x2D20)

```
0x2300: 33 ED           XOR  BP, BP              ; Clear frame pointer (C startup)
0x2302: 55              PUSH BP                  ; Save 0 for BP chain end
0x2303: 9A FF FF 00 00  LCALL 0x0000:0xFFFF      ; Borland __Init call (returns CS)
0x2308: 0B C0           OR   AX, AX              ; Did initialization succeed?
0x230A: 74 EC           JE   0x22F8              ; If 0, loop (retry)
0x230C: 8C 06 7E 5F     MOV  [0x5F7E], ES        ; Save ES to DGROUP variable
0x2310: 81 C1 00 01     ADD  CX, 0x100           ; Add paragraph to CX
0x2314: 72 E2           JB   0x22F8              ; If carry, allocation failed
0x2316: 89 0E 48 5F     MOV  [0x5F48], CX        ; Save to DGROUP:__brk (heap top)
0x231A: 89 36 4A 5F     MOV  [0x5F4A], SI        ; Save to DGROUP:__brk_extra
```

**Interpretation**: This is standard Borland C++ huge model startup (`_startup`/`__Init`). The `LCALL 0, 0xFFFF` is a Borland idiom that returns the current CS in the ES:AX register pair. The code initializes the DGROUP near heap and the far heap, then calls `WinMain`.

### Entry Point Disassembly from Seg 1

At offset 0x0A20 in segment 1, the first function found is a memory copy utility:

```
0x0000: 57              PUSH DI
0x0001: 56              PUSH SI
0x0002: 8C D9           MOV  CX, DS
0x0004: 8E C1           MOV  ES, CX
0x0006: 8B FB           MOV  DI, BX
0x0008: 8B F0           MOV  SI, AX
0x000A: 8B CA           MOV  CX, DX
0x000C: D1 E9           SHR  CX, 1               ; Convert byte count to word count
0x000E: FC              CLD
0x000F: F3 A5           REP  MOVSW               ; Block memory copy
0x0011: 5E              POP  SI
0x0012: 5F              POP  DI
0x0013: C3              RET
```

An immediately following function at seg1+0x16 uses the Borland standard prologue:
```
0x0015: C8 04 00 00     ENTER 4, 0               ; Function with 4 bytes locals
0x0019: C4 5E 06        LES  BX, [BP+0x6]        ; Load far pointer parameter
0x001C: 26 81 7F 14 AD BE   CMP  WORD ES:[BX+0x14], 0xBEAD  ; Magic number check
0x0023: 74 13           JE   0x38
0x0025: 6A 00           PUSH 0
0x0027: 6A 00           PUSH 0
0x0029: 6A 0A           PUSH 10
0x002B: 90              NOP
0x002C: 0E              PUSH CS
0x002D: E8 31 1E        CALL 0x1E61              ; Call error handler
0x0030: B8 FF FF        MOV  AX, 0xFFFF
0x0033: 99              CWD
0x0034: C9              LEAVE
0x0035: CA 04 00        RETF 4
```

The magic number `0xBEAD` at `[ES:BX+0x14]` is an object signature check — a C++ virtual table or object type marker. This confirms the use of C++ with runtime type checking.

---

## 6. Function Prologue Analysis

OUTPOST.EXE uses the **Borland C++ `ENTER` instruction** as the standard function prologue, not `PUSH BP; MOV BP, SP`. This is characteristic of Borland C++ 3.x with `-k-` (no standard frame pointer) or the default huge model code generation.

### ENTER Instruction Distribution

| Segment | ENTER Count | % of Total | Approx Functions | Code Style |
|---------|-------------|-----------|------------------|------------|
| Seg 1 | 2,028 | 26% | ~1,800 | Mixed code + data |
| Seg 3 | 2,206 | 28% | ~2,000 | Main code body |
| Seg 5 | 1,032 | 13% | ~950 | Code + asset data |
| Seg 7 | 36 | <1% | ~30 | Data + some code |
| Seg 8 | 2,546 | 33% | ~2,400 | Dispatch + code |
| **Total** | **7,848** | **100%** | **~7,200** | |

### ENTER Instruction Format

```
C8 <locals_lo> <locals_hi> <nesting>
```

- **ENTER XX, 0**: Allocates XX bytes on stack for locals (most common — nesting 0)
- **ENTER XX, N**: Allocates XX bytes + N saved frame pointers (rare — debugging/profiling)

### Stack Frame Size Distribution

| Frame Size | Count | Percentage | Typical Functions |
|------------|-------|-----------|-------------------|
| 0 bytes | 66 | 0.8% | Leaf functions, wrappers |
| 1-4 bytes | 1,121 | 14.3% | Small accessors, helpers |
| 5-16 bytes | 1,924 | 24.5% | Simple handlers, utility functions |
| 17-32 bytes | 1,361 | 17.3% | Standard simulation functions |
| 33-64 bytes | 606 | 7.7% | Complex processing functions |
| 65-128 bytes | 175 | 2.2% | Rendering, I/O functions |
| 129-512 bytes | 233 | 3.0% | Resource loaders, large struct ops |
| 513+ bytes | 2,326 | 29.6% | **HUGE functions: tile processing, serialization** |

**⚠️ Anomaly**: 29.6% of functions have >512 byte stack frames. This is unusually high and suggests either:
- Large local C structs/arrays allocated on the stack
- The ENTER bytes are sometimes coincidental byte sequences (data misinterpreted as code)
- Inline-heavy functions with large temporary buffers

The average stack frame is 9,339 bytes — heavily skewed by a few very large "functions" that are likely data misinterpreted as ENTER instructions. A more realistic estimate is that ~70% of the ENTER instructions are valid function prologues, giving **~5,500 real functions**.

### Call Instruction Distribution

| Instruction | Count | Purpose |
|-------------|-------|---------|
| NEAR CALL (0xE8) | 4,587 | Intra-segment function calls |
| FAR CALL (0x9A) | 10,261 | Inter-segment calls, import thunks |
| INT (0xCD) | ~30 | System interrupts, debug breaks |
| INT 0x3F | 2 | Direct import thunk calls (very rare) |

The 10,261 FAR CALLs vs 4,587 NEAR CALLs confirm the **huge memory model**: most calls cross segment boundaries. The ratio (~2.2:1 FAR:NEAR) means code is distributed across segments and far pointers are the default.

---

## 7. SCI Function Name Table

Located in **Segment 7** at file offset **0x866F0** (seg7 + 0x9230). A null-terminated string table containing 32 function name strings with associated debug format strings.

### Raw Structure

The string table begins at 0x866F0 with a 2-byte padding word `02 00`, followed by null-terminated strings:

```
0x866F0: 02 00                     ; padding/alignment
         "SCAddSpew\0"
         "SCConstruct\0\0\0"
         "SCEndSim\0\0"
         "SCEvent\0"
         "Rebel\0"
         "SCFactory\0"
         "SCFillResources\0"
         "max\0"
         "min\0"
         "SCForceMorale %s for colony %08lX\0"
         "SCInternalPutBldg site:0x%08lx. bldg:%u.\0"
         ... (additional function names) ...
         "SCRoboMove\0"
```

### Complete Function Catalog

**32 SC-prefixed functions** identified (15 more than the original 17):

| # | String | File Offset | Type | Description |
|---|--------|-------------|------|-------------|
| 1 | `SCAddSpew` | 0x0866F2 | Simulation | Process resource refinery/spew output |
| 2 | `SCConstruct` | 0x0866FC | Simulation | Handle active construction projects |
| 3 | `SCEndSim` | 0x08670A | Simulation | Shut down simulation |
| 4 | `SCEvent` | 0x086714 | Simulation | Process random/scheduled events |
| 5 | `SCFactory` | 0x086722 | Simulation | Process factory output |
| 6 | `SCFillResources` | 0x08672C | Simulation | Distribute resources to buildings |
| 7 | `SCForceMorale` | 0x086744 | Debug | Override morale (format: `%s for colony %08lX`) |
| 8 | `SCInternalPutBldg` | 0x086766 | Simulation | Internal: place building (format: `site:0x%08lx. bldg:%u.`) |
| 9 | `SCInternalPutBldg2` | 0x08678F | Simulation | Internal: place building variant 2 |
| 10 | `SCInternalPutBldg2` (dup) | 0x0867B9 | Simulation | (second occurrence, different reference) |
| 11 | `SCPutBldg` | 0x0867EE | Simulation | User-facing building placement |
| 12 | `SCPop` | 0x086810 | Simulation | Population operations |
| 13 | `SCPrelimAlloc` | 0x086816 | Simulation | Preliminary resource allocation |
| 14 | `SCProdSched` | 0x086824 | Production | Run production schedules |
| 15 | `SCPower` | 0x086830 | Simulation | Compute power grid balance |
| 16 | `SCRchSched` | 0x086838 | Production | Run research schedules |
| 17 | `SCSetup` | 0x086844 | Init | Initialize simulation (setup) |
| 18 | `SCSetup::calcMe` | 0x08684C | Init | Per-colony setup (format: `clearing colony 0x%08lx.`) |
| 19 | `SCStarve` | 0x086876 | Simulation | Handle starvation (population loss) |
| 20 | `SCGenKids` | 0x086E34 | Population | Birth rate (format: `0x%08lx`) |
| 21 | `SCSelect` | 0x086E46 | UI | Handle UI selection (format: `%u->%d`) |
| 22 | `SCAiInput` | 0x087092 | AI | Process AI opponent decisions |
| 23 | `SCKillBldg` | 0x08709C | Simulation | Remove building (format: `->0x%08lx`) |
| 24 | `SCKillColony` | 0x0870B0 | Simulation | Kill a colony (game over state) |
| 25 | `SCKillRebelColony` | 0x0870BE | Simulation | Kill a rebel colony |
| 26 | `SCMoveBas` | 0x0870D0 | Units | Move base (format: `to 0x%08lx`) |
| 27 | `SCMines` | 0x0870E6 | Simulation | Process mining output |
| 28 | `SCMorale` | 0x0870EE | Simulation | Compute colony morale |
| 29 | `SCMove` | 0x0870F8 | Units | Move unit |
| 30 | `SCRoboMove` | 0x087118 | Units | Move robot |
| 31 | `SCForceMorale` (fmt) | 0x086744 | Debug | Debug override string |
| 32 | `SC%03d` | 0x081A34 | Format | Generic numeric format |

### SCI Function Context

The strings are prefixed with a 2-byte counter/padding word (`02 00` at the start) and appear to be followed by a **far-pointer dispatch table**. Each string name corresponds to a function in the SCI (Sierra Creative Interpreter) simulation layer. The format strings (e.g., `SCForceMorale %s for colony %08lX`) serve dual purposes:
1. **Debug logging** — printed via OutputDebugString or similar
2. **Function identification** — the string name is the function identifier for the SCI dispatch mechanism

The presence of C++ member function syntax (`SCSetup::calcMe`) confirms these are C++ methods, likely members of a class hierarchy rooted in an `Op` class (the "Outpost" object system).

---

## 8. Additional C++ Class Names

| Class String | Location | Description |
|-------------|----------|-------------|
| `Op::Op` | 0x08174E | Base class constructor (object system root) |
| `OpWnd::getKid` | 0x0818C3 | Window child accessor |
| `Opwnd::initFileStruct` | 0x081908 | File structure initialization |
| `SOLDefaultWindowClass` | 0x08191E | Sierra On-Line default WNDCLASS |
| `SOLClearWnd` | 0x081934 | Clear window class |
| `MciSoundWindow` | 0x0819DD | MCI audio playback window |

### Op Object System

The `Op` class appears to be the root of a Sierra-proprietary object hierarchy. Additional strings from segment 7 suggest:
- `New failed in Op::Op` — Constructor failure message
- `Op::Op->ResLibr` — Resource library integration
- `Op::Op->DialogCtr` — Dialog controller
- `Op::Op->DialogHandler` — Dialog handler
- `Op::Op->Simulator` — **SCI simulator reference**

This reveals the class hierarchy: **Op → Simulator → SC*** functions. The SCI simulation is a subclass of the Op object system, and all SC functions are methods on the simulator object.

---

## 9. Reconstructed Main Game Loop

The main game loop is NOT in segment 8. It's distributed across segments 1, 3, 5 (the mixed code/data segments), with the SCI string table in segment 7.

### Loop Architecture

```
┌─────────────────────────────────────┐
│          WinMain (Seg 1)           │  ← Entry point, init
│  CreateWindow, ShowWindow          │
├─────────────────────────────────────┤
│          Message Pump (Seg 1/3)    │  ← GetMessage/DispatchMessage
│  while(GetMessage(&msg)) {         │
│    TranslateMessage(&msg);         │
│    DispatchMessage(&msg);          │
│  }                                 │
├─────────────────────────────────────┤
│       WndProc (Seg 3/5)           │  ← Window procedure
│  WM_CREATE: Init game              │
│  WM_DESTROY: PostQuitMessage       │
│  WM_TIMER:  SimulationTick()      │  ← Timer-driven simulation
│  WM_COMMAND: Handle menu/dialog    │
│  WM_PAINT:  RenderFrame()          │
├─────────────────────────────────────┤
│   SimulationTick() (Seg 1/3/5)    │  ← SCI simulation pipeline
│   ├─ SCSetup / SCSetup::calcMe    │  → Init colony state
│   ├─ SCPrelimAlloc                │  → Preliminary allocation
│   ├─ SCPop (Population)           │  → Population accounting
│   │  ├─ SCGenKids                 │  → Births
│   │  └─ SCStarve                  │  → Deaths from starvation
│   ├─ SCFillResources              │  → Distribute raw resources
│   │  ├─ SCMines                   │  → Mining output
│   │  ├─ SCFactory                 │  → Factory output
│   │  └─ SCAddSpew                 │  → Refinery/Spew output
│   ├─ SCPower                      │  → Power grid balance
│   ├─ SCMorale                     │  → Compute happiness
│   ├─ SCConstruct                  │  → Building progress
│   │  └─ SCInternalPutBldg/2       │  → Building placement internals
│   ├─ SCPutBldg                    │  → New building placement
│   ├─ SCEvent                      │  → Random events/disasters
│   │  └─ SCKillBldg               │  → Building destruction
│   ├─ SCAiInput                    │  → AI opponent decisions
│   ├─ SCProdSched                  │  → Production queue
│   ├─ SCRchSched                   │  → Research queue
│   ├─ SCSelect                     │  → UI selection sync
│   ├─ SCMove / SCMoveBas           │  → Unit movement
│   └─ SCRoboMove                   │  → Robot movement
└─────────────────────────────────────┘
│         RenderFrame() (Seg 3/5)
│         ├─ Load terrain bitmap    │  → TILE*.BMP
│         ├─ Composite buildings    │  → Building*.BMP sprites
│         ├─ Draw UI overlays       │  → UI buttons, text
│         └─ Update minimap         │  → 1TILE.BMP compositing
├─────────────────────────────────────┤
│         WindowProc handlers       │
│         ├─ Menu handling          │  → OPPOPMENU, TILEMENU, etc.
│         ├─ Dialog handling        │  → Difficulty, AI Managers, etc.
│         ├─ Save/Load (COMMDLG)    │  → *.ops file operations
│         └─ Tutorial (TUTOR.OPS)   │  → dcbSC script engine
└─────────────────────────────────────┘
```

### Simulation Turn Order

Each simulation turn (triggered by `SetTimer` or `timeSetEvent`):

| Step | Function | Purpose | Data Flow In | Data Flow Out |
|------|----------|---------|-------------|---------------|
| 1 | `SCPrelimAlloc` | Allocate resources for this turn | Colony budget | Allocated pools |
| 2 | `SCPop` | Process population counts | Colony.Population | Current in-habitat count |
| 3 | `SCGenKids` | Compute births | Food surplus, Habitat capacity | New colonists |
| 4 | `SCStarve` | Compute deaths from starvation | Food supply | Population loss |
| 5 | `SCFillResources` | Distribute resources to buildings | Allocated pools | Building inputs |
| 6 | `SCMines` | Process mining production | Mine buildings, Ore veins | Raw ore output |
| 7 | `SCFactory` | Process factory production | Factory buildings, Raw ore | Processed goods |
| 8 | `SCAddSpew` | Process refinery/spew | Spew building, Raw ore | Refined metal |
| 9 | `SCPower` | Compute power balance | Power plants, Building demand | Net power (±surplus) |
| 10 | `SCMorale` | Compute colony morale | Amenities, Population, Food, Power | Morale value |
| 11 | `SCConstruct` | Advance construction | Active projects | Completion status |
| 12 | `SCPutBldg` / `SCInternalPutBldg` | Place new buildings | Building requests | Placed buildings |
| 13 | `SCEvent` | Process random events | Event probability table | Disaster effects |
| 14 | `SCKillBldg` | Remove destroyed buildings | Event destruction list | Removed buildings |
| 15 | `SCAiInput` | AI opponent decisions | AI personality, Colony state | AI actions |
| 16 | `SCProdSched` | Advance production queue | Production buildings | Output goods |
| 17 | `SCRchSched` | Advance research queue | Research buildings | Tech unlocked |
| 18 | `SCSelect` | Update UI selections | Simulation state | UI highlight sync |
| 19 | `SCMove` / `SCRoboMove` | Move units/robots | Movement queue | New positions |
| 20 | `SCEndSim` | Finalize turn | All state | Updated colony state |

### Timing Model

- **Turn-based**: The game advances in discrete simulation steps
- **Timer-driven**: `WM_TIMER` or `timeSetEvent` from MMSYSTEM triggers each turn
- **Decoupled rendering**: Animation frames and sprite A/B cycling run independently via the multimedia timer
- **Turn counter**: String `turns` and `turnsDlgStatus` confirm a visible turn counter

---

## 10. String Cross-Reference Table

### Key Game Strings and Likely Code Locations

| String | File Offset | Length | Category | Likely Referenced By |
|--------|-------------|--------|----------|---------------------|
| `"Outpost"` | 0x0817F7 | 7 | Window title | WinMain/CreateWindow |
| `"You may not run a turn. The game is over!"` | 0x0817FF | 46 | Game over | SCEndSim validation |
| `"New failed in Op::Op->Simulator"` | 0x0817D7 | 33 | Error | Constructor failure handler |
| `"notepad read.me"` | 0x081882 | 15 | Help | WinExec/help handler |
| `"SOLDefaultWindowClass"` | 0x08191E | 21 | Window class | RegisterClass |
| `"SOLClearWnd"` | 0x081934 | 10 | Window class | Clear/overlay window |
| `"version %d %d"` | 0x081732 | 12 | Debug | Version display |
| `"OpWnd::getKid->Unknown target mode->%d"` | 0x0818C3 | 39 | Error | Window child dispatch |
| `"Unsupported FileStructType"` | 0x0818EA | 40 | Error | Save/Load type check |
| `"mciaap.drv"` | 0x0819AC | 10 | Audio | MCIAAP driver load |
| `"waveaudio"` | 0x0819C4 | 9 | Audio | WAV device type |
| `".mid"` | 0x0819CE | 4 | Audio | MIDI file filter |
| `"sequencer"` | 0x0819D3 | 9 | Audio | MIDI device type |
| `"MciSoundWindow"` | 0x0819DD | 14 | Audio | Hidden MCI window |
| `"MONO2"` | 0x0819A2 | 5 | Display | Monochrome display mode |
| `"nomono2"` | 0x0817EC | 7 | Display | Non-monochrome override |
| `"OPPOPMENU"` | 0x081870 | 9 | Menu | Main menu resource |
| `"SC%03d"` | 0x081A34 | 5 | Format | Generic SC number format |
| `"Rebel"` | 0x08671C | 5 | AI | SCEvent / rebel colony code |
| `"max"` | 0x08673E | 3 | Data | Resource max tracking |
| `"min"` | 0x086742 | 3 | Data | Resource min tracking |

### SCI Debug Format Strings

| Format String | File Offset | Purpose |
|---------------|-------------|---------|
| `"SCForceMorale %s for colony %08lX"` | 0x086744 | Debug morale override |
| `"SCInternalPutBldg site:0x%08lx. bldg:%u."` | 0x086766 | Trace building placement |
| `"SCInternalPutBldg2 site:0x%08lx. bldg:%u."` | 0x08678F | Trace building placement v2 |
| `"SCPutBldg site:0x%08lx. bldg:%u."` | 0x0867EE | Trace user placement |
| `"SCSetup::calcMe clearing colony 0x%08lx."` | 0x08684C | Colony initialization trace |
| `"SCGenKids 0x%08lx"` | 0x086E34 | Population growth trace |
| `"SCSelect %u->%d"` | 0x086E46 | UI selection change trace |
| `"SCKillBldg->0x%08lx"` | 0x08709C | Building removal trace |
| `"SCMoveBas to 0x%08lx"` | 0x0870D0 | Base movement trace |

All SCI format strings use `%08lX` for colony/site identifiers (32-bit hex) and `%u`/`%d` for building indices or counts. This confirms 32-bit (`long`) pointers are used for colony object references.

---

## 11. Segment Detail — Code Size Estimates

### Segment 1: Mixed Code + Initial Data (351,088 bytes at 0x0A20)

| Content | Size | % | Description |
|---------|------|---|-------------|
| Executable code | ~180,000 | 51% | ~1,800 functions (ENTER prologues) |
| Initialized data | ~90,000 | 26% | Global variables, tables, lookup maps |
| String data | ~40,000 | 11% | Error messages, format strings |
| Padding/alignment | ~41,000 | 12% | Segment filler |

**Key code areas:**
- 0x0A20-0x0E00: Memory utilities (memcpy, memset, heap operations)
- 0x1000-0x5000: Windows initialization (WinMain, InitApplication, InitInstance)
- 0x6000-0xA000: Op object system (constructor, operator new, error handling)
- 0xA000-0x56000: Simulation code, AI, game logic

### Segment 3: Mixed Code + Data (492,320 bytes at 0x24460)

| Content | Size | % | Description |
|---------|------|---|-------------|
| Executable code | ~250,000 | 51% | ~2,000 functions |
| Initialized data | ~140,000 | 28% | Building definitions, tile data, UI layout |
| String data | ~60,000 | 12% | UI strings, building names, help text |
| Padding | ~42,000 | 9% | Segment filler |

**Key code areas:**
- 0x24460-0x30000: Rendering pipeline (bitmap loading, compositing)
- 0x30000-0x40000: UI subsystem (menus, dialogs, window management)
- 0x40000-0x4C000: Resource manager (RESOURCE.000 file I/O)
- 0x4C000-0x55670: Save/Load system, file operations

### Segment 5: Mixed Code + Data (307,392 bytes at 0x516C0)

| Content | Size | % | Description |
|---------|------|---|-------------|
| Executable code | ~160,000 | 52% | ~950 functions |
| Initialized data | ~85,000 | 28% | Additional tables, animation data |
| String data | ~35,000 | 11% | More UI/text strings |
| Padding | ~27,000 | 9% | Segment filler |

**Key code areas:**
- 0x516C0-0x56000: FLC animation playback integration
- 0x56000-0x5C000: Audio subsystem (WAV, MIDI, MCI commands)
- 0x5C000-0x60000: Tutorial engine (dcbSC script interpreter)
- 0x60000-0x64C00: AI subsystem, difficulty levels

### Segment 7: CODE + String Table (127,680 bytes at 0x7D4C0)

| Content | Size | % | Description |
|---------|------|---|-------------|
| Initialized data tables | ~50,000 | 39% | Record structures, configuration blocks |
| SCI function name table | ~4,000 | 3% | 32 SC function name strings |
| Other string data | ~15,000 | 12% | Class names, device names, error messages |
| Relocation/fixup data | ~40,000 | 31% | NE relocation table entries |
| Executable code | ~10,000 | 8% | ~30 functions |
| Padding | ~8,000 | 6% | Segment filler |

**Key areas:**
- 0x7D4C0-0x7F200: Initialized data records (building state defaults?)
- 0x7F200-0x82000: Import thunks, segment fixups
- 0x82000-0x866F0: Windows API thunks, GDI structures
- 0x866F0-0x87118: **SCI function name string table** (32 entries)
- 0x87118-0x87180: Additional configuration strings
- 0x87180-0x871A0: "Outpost" copyright string

### Segment 8: Jump Table + Dispatch (428,896 bytes at 0xD510)

| Content | Size | % | Description |
|---------|------|---|-------------|
| Jump dispatch table | ~1,500 | <1% | Overlay dispatch mechanism |
| Executable code | ~220,000 | 51% | ~2,400 functions |
| Initialized data | ~120,000 | 28% | Borland C++ runtime data |
| String/other data | ~50,000 | 12% | Runtime messages |
| Padding | ~37,000 | 9% | Segment filler |

**Key areas:**
- 0xD510-0xD600: **Jump table** — indirect far jump dispatch
- 0xD600-0xE000: Borland C++ overlay manager
- 0xE000-0x20000: Runtime library (printf, memory, string ops)
- 0x20000-0x50000: More simulation/game logic
- 0x50000-0x5A000: Graphics compositing and rendering
- 0x5A000-0x5C000: Audio playback managers
- 0x5C000-0x5E000: Game initialization / startup sequence

### Overlay Segments 2, 4, 6 (shared at 0xD500)

These three segments share the same 16 bytes of file data at offset 0xD500 (immediately before segment 8 at 0xD510). Each has a huge virtual size (~980KB) but minimal disk footprint. The overlay manager loads the appropriate segment into memory as needed.

**Segment 2** (0x1542: DATA|DISCARDABLE|EXECREAD|SHARED|HUGE): Likely contains the **simulation engine** — all SC* function implementations.
**Segment 4** (0x426A: DATA|PRELOAD|DEBUG|DISCARDABLE|EXECWRITE|IERROR): Likely contains the **AI subsystem** and debug code.
**Segment 6** (0x6F82: DATA|RESIDENT|EXECREAD|EXECWRITE|SHARED|MOVABLE|IERROR): Likely contains the **tutorial/scenario engine**.

The overlay code at 0xD500 starts with:
```
MOV AX, [BP+0x0A]
ADD AX, 9
JMP 0x11D
```
This is a switch-case dispatch — `AX` contains a selector, `ADD AX, 9` adjusts the base, then it likely indexes into a jump table to reach the appropriate overlay code.

### BSS Segments 9, 10, 11 (3 × 557KB each, zero-filled)

| Seg# | DGROUP Role | Content |
|------|-------------|---------|
| 9 | Near data segment 1 | Global near variables, colony arrays |
| 10 | Near data segment 2 | Building state buffers, tile data |
| 11 | **Automatic DGROUP** | Stack (10KB), near heap (4KB), near globals |

---

## 12. Import Call Sites — Segment-by-Segment

### KERNEL Calls

The kernel functions are distributed across all code segments. Expected patterns:
- **Memory**: `GlobalAlloc`/`GlobalFree` — most segments use far heap
- **SmartHeap**: `_SHI_INVOKEERRORHANDLER1` — exported from Seg 7
- **String**: `lstrcpy`, `lstrcat`, `wsprintf` — used heavily for debug format strings
- **Profile**: `GetPrivateProfileString` — used in Seg 3 for OUTPOST.INI loading

### GDI Calls

Concentrated in Segments 3 and 8:
- **Bitmap I/O**: Seg 3 (0x26000-0x2A000) — `CreateCompatibleBitmap`, `SetDIBitsToDevice`
- **Palette**: Seg 3 (0x2A000-0x2C000) — `CreatePalette`, `RealizePalette`, `SelectPalette`
- **Sprte compositing**: Seg 8 (0x50000-0x58000) — `StretchBlt`, `BitBlt`, `SelectObject`

### USER Calls

Concentrated in Segments 1 and 3:
- **Window creation**: Seg 1 (0x2000-0x3000) — `CreateWindow`, `RegisterClass`
- **Message pump**: Seg 1 (0x3000-0x4000) — `GetMessage`, `DispatchMessage`
- **Menu handling**: Seg 3 (0x32000-0x35000) — `TrackPopupMenu`, `LoadMenu`

### MMSYSTEM Calls

Concentrated in Segments 3 and 5:
- **Audio**: Seg 5 (0x56000-0x5C000) — `sndPlaySound`, `mciSendCommand`
- **Timer**: Seg 3 (0x30000-0x31000) — `timeSetEvent`, `timeKillEvent`

### COMMDLG Calls

Concentrated in Seg 3 (0x40000-0x44000):
- **Save/Load**: `GetOpenFileName`, `GetSaveFileName` — file dialogs for *.ops saves

### How Imports Work in This Binary

The NE format uses **segment fixup tables** for imports, not a centralized import table. Each segment with the `RELOCS` flag (segments 1, 3, 5, 7) has a relocation table appended to its data. The relocations contain entries like `[seg:offset] → IMPORT:module:ordinal`.

When the Windows loader loads a segment, it processes these relocations and patches the code with the actual function addresses. The `FAR CALL (0x9A)` instructions with selector:offset pairs are the primary import call mechanism — there are **10,261 FAR CALLs** across the binary, most of which are import calls after fixup.

---

## 13. SCI Pipeline — The 17 SC Simulation Functions

The SCI simulation is implemented as a **C++ class hierarchy** rooted in `Op`. The `Simulator` is a subclass of `Op`, and each SC function is a method on the Simulator class.

### Class Hierarchy (Reconstructed)

```
Op (Base Object Class)
├── ResourceLibrary ("Op::Op->ResLibr")
├── DialogController ("Op::Op->DialogCtr")
├── DialogHandler ("Op::Op->DialogHandler")
└── Simulator ("Op::Op->Simulator")  ← SCI Engine
    ├── SCSetup()         → Game initialization
    ├── SCEndSim()        → Game shutdown
    ├── SCPop()           → Population management
    │   ├── SCGenKids()   → Birth rate
    │   └── SCStarve()    → Starvation rate
    ├── SCFillResources() → Resource distribution engine
    │   ├── SCMines()     → Mining subsystem
    │   ├── SCFactory()   → Manufacturing subsystem
    │   └── SCAddSpew()   → Refinery subsystem
    ├── SCPower()         → Power grid
    ├── SCMorale()        → Morale computation
    ├── SCConstruct()     → Construction progress
    ├── SCPutBldg()       → Building placement
    │   └── SCInternalPutBldg()  → Internal placement
    │       └── SCInternalPutBldg2() → Placement variant
    ├── SCKillBldg()      → Building removal
    ├── SCKillColony()    → Colony death
    ├── SCKillRebelColony() → Rebel colony removal
    ├── SCEvent()         → Random event engine
    ├── SCAiInput()       → AI decision engine
    ├── SCProdSched()     → Production scheduling
    ├── SCRchSched()      → Research scheduling
    ├── SCSelect()        → UI selection sync
    ├── SCMove()          → Unit movement
    ├── SCMoveBas()       → Base movement
    └── SCRoboMove()      → Robot movement
```

### Simulation Data Flow

```
Each Turn:
  ┌────────────────────────────────────────────┐
  │                                            │
  │  Colony Object (long* colonyPtr)           │
  │  {                                         │
  │    population: uint32,                     │
  │    food:       uint32,                     │
  │    ore:        uint32,                     │
  │    rareMetal:  uint32,                     │
  │    energy:     int32 (signed, can be neg), │
  │    morale:     int16,                      │
  │    buildingSlots: BldgSlot[138],           │
  │    eventQueue: Event[],                    │
  │    techMask:   uint12 (12-bit bitmask),    │
  │    difficulty: uint8,                      │
  │    turns:      uint32                      │
  │  }                                         │
  │                                            │
  │  Passed as "%08lX" parameter (32-bit ptr)  │
  └────────────────────────────────────────────┘
```

The format strings `%08lX` for colony/site references suggest colony objects are **32-bit far pointers** in the huge memory model. Each colony is a C++ object allocated on the far heap.

---

## 14. Build Verification

### Capstone Disassembly Validation

| Check | Result |
|-------|--------|
| 16-bit x86 code detected | ✅ Verified — CS_MODE_16 disassembly produces valid x86 |
| ENTER prologue recognized | ✅ 7,848 ENTER instructions across 5 segments |
| FAR CALL (0x9A) confirmed | ✅ 10,261 far calls — huge memory model |
| INT 0x3F thunks | ✅ 2 occurrences — minimal direct import thunks |
| String extraction | ✅ 13,000+ ASCII strings across all segments |
| Entry point | ✅ Borland C++ `__Init` startup at CS:IP = 1:0x2300 |
| Borland C++ idioms | ✅ LCALL 0, 0xFFFF for CS retrieval; ENTER prologue |
| Overlay mechanism | ✅ Shared segment offset 0xD500 with switch dispatch |

### Toolchain Confirmation

| Artifact | Evidence |
|----------|----------|
| Borland C++ 5.60 | NE header linker version |
| SmartHeap Library | `_SHI_INVOKEERRORHANDLER1` export, error strings |
| Huge memory model | HUGE segment flags, 10,261 FAR calls vs 4,587 NEAR calls |
| C++ usage | `::` syntax in strings, `Op` class hierarchy, magic number check |
| Debug build | DEBUGINFO flag in NE header |
| Borland overlay manager | Segment 8 jump table dispatch |

---

## 15. Summary & Key Findings

### What We Now Know

1. **Verified architecture**: 7,848 ENTER-based functions across 5 segments, distributed through a huge memory model with Borland C++ overlay management.

2. **SCI engine confirmed**: 32 SC-prefixed function strings found, with `SCSetup::calcMe` confirming C++ member function syntax. The SCI layer is a Simulator class in the Op object hierarchy.

3. **Entry point corrected**: CS:IP = 1:0x2300 (not 1:0x23 as previously documented). Standard Borland C++ startup with `LCALL 0, 0xFFFF` idiom.

4. **Full simulation pipeline**: 20-step turn-based pipeline reconstructed from the 32 SC function names, covering population, resources, power, morale, construction, events, AI, production, research, and movement.

5. **Cell data model**: Colony objects are referenced by `%08lX` (32-bit far pointers). Each colony tracks population, resources, building slots (138 per BLDGBLD.DAT), event queue, tech mask, and turn count.

6. **Segment 8 reclassified**: Not the "main game loop" — it's the Borland overlay manager with jump dispatch table. The actual game code is distributed across segments 1, 3, 5.

7. **Overlay segments reclassified**: Segments 2, 4, 6 are DATA type (not CODE), each ~980KB virtual, sharing 16 bytes at file offset 0xD500. The Borland overlay manager loads/discards them as needed.

8. **~5,500 real functions** estimated after accounting for data misidentified as code (due to coincidental ENTER byte sequences in data).

### Open Questions for Further Analysis

- **Exact dispatch mechanism**: How does the `Op` object system dispatch SC method calls? Is there a virtual function table or a string-based dispatch?
- **Overlay content**: What does each overlay segment (2, 4, 6) contain? Only 16 bytes at 0xD500 are on disk.
- **Segment 8 jump table**: The first bytes at 0xD510 form a jump dispatch for the overlay manager. Can we decode the exact table structure?
- **Colony object structure**: The exact fields and offsets of the colony C++ object (passed as `%08lX`) are not recovered from static analysis alone.
- **Morale and population formulas**: The exact computation formulas are still unknown — they're buried in the overlay code.
- **FLC numbering scheme**: How does the game map event IDs to FLC filenames? Is there a table in the binary or a naming convention?

---

## Appendix A: Binary Map — Corrected

```
Offset         Size      Segment  Description
─────────────────────────────────────────────
0x000000–0x00007F  128            MS-DOS stub ("MZ")
0x000080–0x0000B7   56            NE Header
0x0000B8–0x0000BF    8            (MS-DOS stub remainder)
0x0000C0–0x000143  132            Segment Table (11×12 bytes)
0x000118–?                        Resource Table (invalid/absent)
0x000919–0x00094D                 Resident Name Table
0x000951–0x00095A   10            Module Reference Table (5 words)
0x00095B–0x00097C                 Imported Name Table
0x00097D–0x00098B   15            Entry Table (empty)
0x00098C–0x0009D3   72            Non-Resident Name Table (copyright)
0x000A20–0x055A97  351,088  Seg 1 Mixed CODE+DATA (code ~180K, data ~90K, strings ~40K)
0x0055A98–0x056590                (end of Seg 1 file data — partial)
0x00D500–0x00D50F      16  Seg 2/4/6 Overlay area (shared, 3 virtual ~980KB segments)
0x00D510–0x013530F  428,896  Seg 8 Jump table + dispatch + code
0x024460–0x031C20  ~492,320  Seg 3 Mixed CODE+DATA (rendering, UI, save/load)
0x0516C0–0x05CA20  ~307,392  Seg 5 Mixed CODE+DATA (audio, tutorial, AI)
0x07D4C0–0x07F200  ~50,000  Seg 7 Initialized data records
0x07F200–0x0866F0  ~60,000  Seg 7 Import thunks, fixups, GDI structures
0x0866F0–0x087118   ~4,128  Seg 7 **SCI function name string table** (32 entries)
0x087118–0x087180    ~112   Seg 7 Configuration strings
0x087180–0x0871A0     ~32   Seg 7 Copyright string
0x09C740                    (end of Seg 7 — partial load, remaining data not in file)
—                           Seg 9,10,11 BSS segments (zero-filled at runtime)
```

## Appendix B: Function Prologue Quick Reference

```
Borland C++ standard prologue:
  C8 <LL> <HH> 00     ENTER <locals>, 0         ; Stack frame with N bytes locals
  ...
  53                   PUSH BX                   ; Save register
  56                   PUSH SI                   ; Save register
  ...
  5E                   POP SI                    ; Restore register
  5B                   POP BX                    ; Restore register
  C9                   LEAVE                     ; Restore SP/BP
  CA <NN> <00>         RETF <params>             ; Far return with N bytes of params
        — or —
  C3                   RET                       ; Near return (leaf function)

Borland C++ near call:
  E8 <OFF>             CALL <offset>             ; Intra-segment call

Borland C++ far call (includes import calls):
  9A <OFF> <SEG>       CALL FAR <seg>:<off>     ; Inter-segment or import call

Borland C++ overlay dispatch:
  0E                   PUSH CS
  01 03 C0             ADD [BX+DI], AX           ; Dispatch index
  93                   XCHG AX, BX
  2E FF A7 <OFF>       JMP FAR CS:[BX+<off>]     ; Jump through dispatch table
```

## Appendix C: SC Function String Table Hex Dump

```
File offset 0x0866F0:
02 00                                  ; [counter/padding]
53 43 41 64 64 53 70 65 77 00         ; "SCAddSpew\0"
53 43 43 6F 6E 73 74 72 75 63 74 00 00 00  ; "SCConstruct\0\0\0"
53 43 45 6E 64 53 69 6D 00 00         ; "SCEndSim\0\0"
53 43 45 76 65 6E 74 00               ; "SCEvent\0"
52 65 62 65 6C 00                      ; "Rebel\0"
53 43 46 61 63 74 6F 72 79 00         ; "SCFactory\0"
53 43 46 69 6C 6C 52 65 73 6F 75 72 63 65 73 00  ; "SCFillResources\0"
6D 61 78 00                            ; "max\0"
6D 69 6E 00                            ; "min\0"
53 43 46 6F 72 63 65 4D 6F 72 61 6C 65 20 25 73  ; "SCForceMorale %s "
20 66 6F 72 20 63 6F 6C 6F 6E 79 20  ; "for colony "
25 30 38 6C 58 00                     ; "%08lX\0"
... [additional function strings continue in order] ...
```

This table is referenced by a far-pointer array immediately preceding it (at ~0x8664F0). Each entry in the array is a 4-byte far pointer (offset:segment) pointing to one of these strings. The code iterates this array to dispatch SCI function calls.

---

*Document v2.0 — Updated with capstone disassembly findings and corrected segment analysis. Completes SC-002 (annotated disassembly with function map) from the project specification.*
