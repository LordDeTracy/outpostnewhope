# Graphics Pipeline — Sierra Outpost (1994)

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A4). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

## 1. Bitmap Format (339 BMPs)

### 1.1 Header Structure

All BMPs use standard Windows BITMAPFILEHEADER + BITMAPINFOHEADER format.  
Magic bytes: `42 4D` ("BM").

| Field | Offset | Size | Value (typical) | Description |
|---|---|---|---|---|
| bfType | 0 | WORD | 0x4D42 | "BM" magic |
| bfSize | 2 | DWORD | varies | Total file size |
| bfReserved | 6 | DWORD | 0 | Unused |
| bfOffBits | 10 | DWORD | 0x0436 (1078) | Pixel data offset (always 1078 for all BMPs) |
| biSize | 14 | DWORD | 40 | BITMAPINFOHEADER size |
| biWidth | 18 | LONG | varies | Width in pixels |
| biHeight | 22 | LONG | varies | Height in pixels |
| biPlanes | 26 | WORD | 1 | Always 1 |
| biBitCount | 28 | WORD | 8 | Always 8 bits per pixel |
| biCompression | 30 | DWORD | 0 | BI_RGB (none) |
| biSizeImage | 34 | DWORD | varies | Raw pixel data size |
| biXPelsPerMeter | 38 | LONG | 0 | Unused |
| biYPelsPerMeter | 42 | LONG | 0 | Unused |
| biClrUsed | 46 | DWORD | 256 | Full 256-color palette |
| biClrImportant | 50 | DWORD | 256 | All colors important |
| Palette | 54 | 256×4 = 1024 bytes | — | VGA-style palette (B,G,R,reserved) |
| Pixel data | 1078 | varies | — | 8-bit indexed pixels (bottom-up) |

**Hex proof (TILE1.BMP, 640×480):**
```
42 4D 36 B4 04 00 00 00 00 00 36 04 00 00 28 00 00 00
80 02 00 00 E0 01 00 00 01 00 08 00 00 00 00 00
00 B0 04 00 00 00 00 00 00 00 00 00 00 01 00 00 00
01 00 00 00 ...
```
- `36 B4 04 00` = 0x0004B436 = 308,278 bytes (file size)
- `36 04 00 00` = 0x0436 = 1078 (pixel offset)
- `80 02 00 00` = 0x0280 = 640 width
- `E0 01 00 00` = 0x01E0 = 480 height
- `08 00` = 8 bit depth
- `00 01 00 00` = 256 colors used (little-endian)

### 1.2 Palette Format

Each palette entry is 4 bytes: **Blue, Green, Red, Reserved** (RGBQUAD).  
All 256 entries are present (1024 bytes). The palette is stored at file offset 54.

**Palette characteristics:**
- Entry 0: black (R=0, G=0, B=0)
- Entries 1-9: Standard VGA/CGA colors (dark red, green, brown, dark blue, magenta, cyan, light gray, etc.)
- Entries 10-25: Grayscale ramp (11..203 in 12-step increments)
- Entries 26+: Game-specific terrain/building colors (deep greens, browns, reds)
- Entry 251-255: After last game color, pure yellow, blue, magenta, cyan, white

The first 208 of 256 palette entries are shared between terrain tiles (TILE*.BMP) and building sprites (500-series BMPs); 224 of 256 are shared between the 500-series (300×150 building sprites) and 580-series (145×120 building/robot sprites). This suggests a **common core palette** extended with per-category colors.

### 1.3 Pixel Data Encoding

- **Compression**: BI_RGB (raw, uncompressed)
- **Bit depth**: 8-bit indexed (palettized)
- **Orientation**: Bottom-up (typical BMP)
- **Stride**: Each row is padded to 4-byte boundary

### 1.4 Size Categories and Their Meanings

| Size (bytes) | Count | Dimensions | Category | Examples |
|---|---|---|---|---|
| 308,278 | 80 | 640×480 | Terrain/planet maps | TILE1-6.BMP, 1020.BMP, 1032A.BMP, 1090A.BMP, AIMULT.BMP |
| 46,078 | 141 | 300×150 | Building sprites (multi-frame) | 500-579.BMP (with A variants) |
| 18,838 | 70 | 145×120 | Robot/vehicle sprites | 580-649.BMP, 845-849B.BMP, NI.BMP |
| 17,578 | 1 | 132×125 | Special tile | 1TILE.BMP (minimap tile legend) |
| 9,1078 | 1 | 300×300 | Large dialog/graphic | 1030.BMP |
| 8,6918 | 1 | 295×290 | Intro screen | INTDEM5A.BMP |
| 5,2230 | 1 | 554×92 | Wide banner | 684A.BMP |
| 26,578 | 1 | 300×85 | Logo | LOGO.BMP |
| 2,598 | 5 | 77×19 | Elevation/texture strips | SURFACE.BMP, LEVEL1-4.BMP |
| 2,102 | 3 | 32×32 | Map icons | TILEICON.BMP, SITEICON.BMP, PLNTICON.BMP |
| 2,422 | 2 | 63×21 | UI buttons | LAUBUTN.BMP, TPBUTTON.BMP |
| 2,038 | 2 | 45×20 | Scroll buttons | TTDOWN.BMP, TTUP? |
| 1,458 | 2 | 19×19 | Tiny UI buttons | TBUP.BMP, TBDOWN.BMP |
| 3,238 | 1 | 70×30 | Text UI element | DIBTEXT.BMP |
| 5,862 | 1 | ? | Info panel | NOTH.BMP ("nothing" placeholder?) |

### 1.5 Filename Conventions and Tile ID System

**Terrain tiles (640×480, 308KB):**
- `TILE1.BMP` through `TILE6.BMP` — 6 main terrain types (with A/B animation variants for some)
- `1020.BMP`, `1030.BMP`, `1032A.BMP` through `1090A.BMP` — Additional terrain/overlay tiles
- `1070A.BMP` (520×230) — Panoramic strip
- `1100.BMP`, `1110.BMP`, `1119.BMP`, `1248.BMP` — Special terrain features

**Building sprites (300×150, 46KB):**
- `500.BMP` through `597.BMP` — Building structure frames
- Many have `500A.BMP`, `500B.BMP` suffix → animation frames (A/B = two-frame animation)
- `450.BMP`–`497.BMP` — UI elements/infrastructure graphics

**Robot/vehicle sprites (145×120, 18KB):**
- `580.BMP` through `649.BMP` — Moving units, vehicles, worker robots
- `602.BMP` (special size, 18KB) — Possibly a unique robot frame
- `845.BMP`, `846.BMP`, `848.BMP`, `849A/B.BMP` — Additional sprites
- `NI.BMP` — "Not Implemented" placeholder

**UI and overlay elements:**
- `SURFACE.BMP` + `LEVEL*.BMP` — Terrain elevation indicator strip
- `TILEICON.BMP` — Map legend tile icon
- `SITEICON.BMP` — Building site icon
- `PLNTICON.BMP` — Colony/planet icon
- `LAUBUTN.BMP`, `LISTBUTN.BMP`, `STTGBUTN.BMP`, `TPBUTTON.BMP`, `TREEBUTN.BMP` — UI buttons
- `TBUP.BMP`, `TBDOWN.BMP` — Thumbtack/scrollbar buttons
- `TTDOWN.BMP` — Maybe tree/tab dropdown
- `DIBTEXT.BMP` — Text panel background
- `AIMULT.BMP` — AI multiplayer overlay (640×480)
- `LOGO.BMP` — Game logo
- `TRADE.BMP` — Trade interface
- `PRBUTTON.BMP`, `RTBUTTON.BMP` — Right-click/popup buttons
- `PLNTROTB.BMP` — Rotating planet animation background
- `651NEW.BMP` — Updated/replacement sprite (post-release?)

### 1.6 Animation Frame Pattern

Many building/robot sprites use an **A/B suffix convention**:
- `500A.BMP` + `500.BMP` (or `500B.BMP`) = two-frame animation
- Examples spanning IDs 500-579: `500A/500`, `501A/501`, ..., `579A/579`
- The A/B frames likely represent active/inactive or open/closed states

---

## 2. FLC Video Analysis (92 FLCs)

### 2.1 Format Confirmation

All 92 FLC files use the **Autodesk Animator Pro FLC format** (magic `0xAF12`).

**FLC header (128 bytes fixed):**
```
Offset  Size  Field         Description
0       DWORD  size          Total file size
4       WORD   magic         0xAF12 (FLC format)
6       WORD   frames        Number of frames
8       WORD   width         Width in pixels
10      WORD   height        Height in pixels
12      WORD   depth         Color depth (always 8)
14      WORD   flags         Flags (0x0003 for most)
16      LONG   speed         Delay in jiffies (1/70 sec)
20      WORD   reserved      0
22      WORD   created       FLC: 0xFFFF
24      LONG   creator       Timestamp
28      LONG   updated       Timestamp
32      WORD   aspect_dx     Aspect ratio X
34      WORD   aspect_dy     Aspect ratio Y
36      BYTE   reserved1[38] Zero-padding
74      WORD   oframe1       Offset to frame 1 (usually 128)
76      WORD   oframe2       Offset to frame 2
78-127  BYTE   reserved2[50] Zero-padding
```

**Frame chunk structure:**
```c
typedef struct {
    DWORD size;       // Chunk size including header
    WORD  type;       // 0xF1F0 = frame, 0xF1FA = prefix
    WORD  subchunks;  // Number of subchunks
    DWORD reserved;   
    LONG  delay;      // Delay in jiffies (1/70 sec)
} FLIC_FRAME;
```

**Subchunk types identified:**
| Type | Name | Description |
|---|---|---|
| 0x0007 | FLC_LC_256 | Line-compressed (256-color) — most common frame type |
| 0x0004 | FLC_BRUN | Byte-run compressed full frame |
| 0x000F | FLC_DELTA | Delta-compressed full frame |
| 0x0012 | FLC_LC | 64-color line compressed (palette data) |

### 2.2 Frame Type Patterns

- **First frame**: Ring frame (type 0xF1F0 with initial COLOR_256 + BRUN subchunks) — contains full image and palette
- **Prefix frames** (type 0xF1FA): Contain palette updates (COLOR_256) and LC_256 deltas
- **Subsequent frames**: FLC_DELTA or FLC_LC_256 subchunks for inter-frame compression
- **Speed**: Most use delay=3 jiffies (~23 fps); some use delay=2 (~35 fps), others delay=4 (~17.5 fps)

### 2.3 FLC File Catalog by Likely Game Event

#### Launch Sequences (10-49)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 10.FLC | 99 | 400×200 | 1.2 MB | Main launch sequence |
| 20.FLC | 157 | 640×480 | 1.6 MB | Colony establishing |
| 30.FLC | 85 | 300×300 | 1.9 MB | Launch/arrival |
| 32.FLC | 151 | 220×320 | 269 KB | Small animation |
| 33.FLC | 120 | 190×140 | 583 KB | Sequence |
| 34.FLC | 86 | 190×215 | 321 KB | Sequence |
| 35.FLC | 229 | 240×240 | 2.5 MB | Long animation |
| 36.FLC | 131 | 340×220 | 220 KB | Small animation |
| 37.FLC | 151 | 340×220 | 238 KB | Sequence (slow 114 jiffies) |
| 38.FLC | 150 | 340×220 | 234 KB | Sequence (slow 114 jiffies) |
| 39.FLC | 216 | 160×120 | 736 KB | Long small animation |
| 40.FLC | 139 | 190×250 | 1.0 MB | Launch sequence |
| 42.FLC | 148 | 290×290 | 1.2 MB | Sequence |
| 46.FLC | 151 | 390×190 | 956 KB | Landing |
| 48.FLC | 140 | 320×125 | 2.1 MB | Wide panorama |
| 49.FLC | 179 | 290×215 | 2.2 MB | Complex sequence |

#### In-Flight/Transition (50-99)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 50.FLC | 99 | 300×180 | 321 KB | Transit animation |
| 52.FLC | 150 | 320×240 | 760 KB | ORBIT? |
| 62.FLC | 93 | 320×200 | 594 KB | In-flight event |
| 70.FLC | 152 | 520×230 | 6.3 MB | Large wide animation |
| 72.FLC | 30 | 200×200 | 147 KB | Short animation |
| 80.FLC | 236 | 600×300 | 1.6 MB | Very wide panorama |
| 82.FLC | 100 | 515×175 | 2.0 MB | Wide strip |
| 84.FLC | 160 | 400×240 | 2.1 MB | Sequence |
| 86.FLC | 168 | 240×240 | 2.2 MB | Square animation |
| 90.FLC | 118 | 400×300 | 997 KB | Scene |

#### Colony Events / Disasters (100-199)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 100.FLC | 299 | 600×300 | 1.7 MB | Long scene (300 frames!) |
| 110.FLC | 21 | 160×89 | 61 KB | Very short intro |
| 111-114.FLC | 36-57 | 100-159×120-124 | 47-184 KB | Small animations |
| 115.FLC | 169 | 640×480 | 710 KB | Full screen event |
| 116.FLC | 100 | 300×150 | 485 KB | Scene |
| 118.FLC | 99 | 300×150 | 628 KB | Scene (slow 100 jiffies) |
| 130.FLC | 200 | 500×200 | 1.6 MB | Long scene |
| 140.FLC | 240 | 500×150 | 704 KB | Wide scene |
| 150.FLC | 150 | 335×175 | 3.0 MB | Large animation |
| 150B.FLC | 151 | 200×100 | 1.2 MB | Variant B |
| 160.FLC | 149 | 420×120 | 601 KB | Wide strip |
| 170.FLC | 131 | 260×420 | 2.4 MB | Tall portrait |
| 180.FLC | 77 | 250×150 | 1.9 MB | Sequence |
| 190-194.FLC | 40-56 | 150-280×200-220 | 256-636 KB | Disaster sequences |
| 198.FLC | 90 | 390×210 | 2.6 MB | Large animation |
| 199.FLC | 79 | 220×180 | 312 KB | Sequence |

#### Vehicle/Unit Animations (200-299)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 200.FLC | 129 | 400×200 | 1.9 MB | Main vehicle anim |
| 202.FLC | 119 | 300×280 | 1.5 MB | Vehicle |
| 208.FLC | 16 | 145×145 | 69 KB | Very short, small (icon preview?) |
| 210.FLC | 149 | 400×180 | 309 KB | Vehicle movement |
| 211.FLC | 150 | 220×210 | 6.6 MB | Very large, detailed |
| 220.FLC | 90 | 350×240 | 2.3 MB | Vehicle action |
| 230.FLC | 74 | 254×343 | 1.5 MB | Tall format |
| 242-248.FLC | 16-101 | 125×125 | 57-402 KB | Small vehicle thumbnails |
| 250.FLC | 119 | 300×140 | 3.6 MB | Wide vehicle |
| 251.FLC | 87 | 290×110 | 2.0 MB | Wide vehicle |
| 260.FLC | 40 | 380×260 | 843 KB | Vehicle |
| 270.FLC | 59 | 500×350 | 2.8 MB | Large vehicle |
| 270NEW.FLC | 30 | 500×350 | 1.6 MB | Updated/alternate |
| 286-294.FLC | 149-240 | 270-420×180-400 | 2.3-7.1 MB | Major action sequences |

#### UI Transitions (300-399)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 300.FLC | 150 | 380×220 | 1.3 MB | Main UI transition |
| 302.FLC | 149 | 400×200 | 448 KB | UI panel |
| 304.FLC | 60 | 200×200 | 2.2 MB | UI animation |
| 306.FLC | 46 | 380×260 | 793 KB | UI panel |
| 310.FLC | 39 | 300×250 | 2.0 MB | UI with text |
| 330.FLC | 57 | 300×250 | 589 KB | UI panel |
| 340.FLC | 96 | 300×200 | 4.8 MB | Complex UI |
| 342.FLC | 71 | 300×200 | 747 KB | UI (slow 42 jiffies) |
| 350.FLC | 125 | 350×200 | 3.1 MB | Wide UI |
| 352.FLC | 50 | 200×200 | 1.2 MB | UI element |
| 360.FLC | 30 | 200×200 | 642 KB | Short UI |
| 380.FLC | 28 | 199×199 | 201 KB | Short UI |
| 390.FLC | 88 | 460×380 | 4.0 MB | Large UI trailer |
| 392.FLC | 70 | 300×250 | 564 KB | UI (slow 100 jiffies) |
| 398.FLC | 121 | 300×200 | 6.5 MB | Complex UI |

#### Colony Building Construction (400-449)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 400.FLC | 150 | 260×170 | 5.9 MB | Main construction |
| 410.FLC | 120 | 500×260 | 763 KB | Wide construction |
| 420.FLC | 149 | 380×220 | 6.1 MB | Complex construction |
| 440.FLC | 93 | 260×260 | 968 KB | Construction |

#### Endings (450-453)
| File | Frames | Resolution | Size | Probable Content |
|---|---|---|---|---|
| 450.FLC | 57 | 195×175 | 249 KB | Ending animation A |
| 451.FLC | 89 | 250×200 | 606 KB | Ending animation B |
| 452.FLC | 91 | 200×300 | 2.3 MB | Ending animation C (tall) |
| 453.FLC | 79 | 350×450 | 2.1 MB | Ending animation D (large) |

### 2.4 AAPLAY.DLL — FLIC Playback API

**Version**: Autodesk Animation Player 1.10 (DLL exports mention v1.02)  
**File**: 290,864 bytes

**Exported functions:**
| Function | Description |
|---|---|
| AAPLAY | Main playback entry point |
| AAOPEN | Open animation file |
| AACLOSE | Close animation |
| AALOAD | Load animation into memory |
| AAUNLOAD | Unload animation |
| AAPROMPT | Show open dialog |
| AAPLAY | Play animation |
| AASTOP | Stop playback |
| AAPAUSE | Pause/resume |
| AAGETPARM | Get animation parameters |
| AAGETPARMINDIRECT | Get parameters by index |
| AASETPARM | Set animation parameters |
| AASETPARMINDIRECT | Set parameters by index |
| AASHOW | Show/hide animation window |
| AANOTIFY | Set notification callback |
| AACANCEL | Cancel operation |
| AASOUND | Control sound |
| AARELOAD | Reload animation |
| AAGETFILE | File open dialog |
| AASAVE | Save animation |
| AAGETCAPS | Get player capabilities |

**Supported file formats**: `.flc`, `.fli`, `.rle`, `.dib`, `.bmp`, `.mid`, `.wav`, `.rmi`, `.aas`

**Key internal functions (from debug symbols):**
- `_AAFLIINIT`, `_LOADFLIS`, `_FREEFLIS` — FLI/FLC loading
- `_REALIZEFLIFRAME`, `_TRANSLATEFLI` — Frame decoding
- `_DECODECOLOR` — Color decoding
- `_DIBINIT`, `_LOADDIBS`, `_REALIZEDIBFRAME` — DIB handling
- `UNCOMPFL.C` — FLIC decompression code
- `_FLI_UNCOMP` — Main uncompression function
- `AADECODE.ASM` — Assembly-optimized FLIC decoder
- Compression algorithms: `UNBRUN` (byte-run), `UNLCCOMP` (line-compress), `UNSS2` (SS2 decode), `ZEROWORD`/`COPYWORD` (word operations)

### 2.5 AAVGA.DLL — VGA Display Driver

**File**: 13,840 bytes (small, just a thin shim)

**Exported functions:**
| Function | Description |
|---|---|
| GETFLIPROC | Get FLIC rendering function pointer |
| GETDIBPROC | Get DIB rendering function pointer |
| SETMODE | Set display mode (fullscreen/windowed) |
| GETDUALSCREEN | Check dual-screen capability |

**Key strings:**
- `FLI_UNCOMP` / `DIB_UNCOMP` — Uncompress functions
- `dispdib.dll` / `DisplayDib` — References to external display DIB DLL
- `FullScreen`, `DualScreen`, `HardwareDirect`, `Int2fSwitch` — Mode settings
- `system.ini` settings: `[AAPLAY] Animation=FullScreen|DualScreen`

**DIB.DRV**: Windows 3.11 display driver for DIB rendering — provides `STRETCHDIBITS`, `DIBTODEVICE`, `BITBLT` for compositing the 8-bit indexed frames to screen.

### 2.6 Color Depth

All FLCs use **8-bit (256-color) palettized** color. This matches the BMP palette format, confirming the game uses a unified VGA 256-color palette throughout all visual subsystems.

---

## 3. Summary

The graphics pipeline uses a **unified 8-bit palettized architecture**:
- All bitmaps (BMP) are standard 8-bit Windows DIB with embedded 256-color palettes
- All videos (FLC) are Autodesk Animator Pro 8-bit FLC with embedded palettes
- Nearly identical palette cores across asset types (~80%+ shared)
- AAPLAY.DLL handles FLIC playback via windowed/fullscreen modes
- AAVGA.DLL provides VGA mode-switching for fullscreen playback
- No compression beyond standard BI_RGB (BMP) and FLIC delta/byte-run (FLC)
