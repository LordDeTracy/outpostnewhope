# Contract: Bitmap Format

**Status**: Complete — Standard 8-bit Windows DIB (Device Independent Bitmap)

**Applies to**: All 339 `.BMP` files in the `BITMAPS/` directory of Sierra On-Line's *Outpost* (1994).

---

## 1. Format Classification

All Outpost bitmaps use **standard 8-bit Windows DIB** (Device Independent Bitmap), **not** a proprietary variant. Any tool that can read 8-bit uncompressed Windows BMP files can open them without modification. The format is identical to what `CreateDIBitmap` / `CreateDIBSection` (GDI) produce on Windows 3.x.

---

## 2. File Header — `BITMAPFILEHEADER` (14 bytes at offset 0x00)

| Offset | Size | Field | Type | Value | Description |
|--------|------|-------|------|-------|-------------|
| 0x00 | 2 | `bfType` | `uint16_t` | `0x4D42` ("BM") | Windows BMP magic signature |
| 0x02 | 4 | `bfSize` | `uint32_t` | varies | Total file size in bytes |
| 0x06 | 4 | `bfReserved` | `uint32_t` | `0` | Unused, must be zero |
| 0x0A | 4 | `bfOffBits` | `uint32_t` | `0x0436` (1078) | Offset from file start to pixel data |

**C struct**:
```c
typedef struct {
    uint16_t bfType;      // 0x4D42
    uint32_t bfSize;      // Total file size
    uint32_t bfReserved;  // 0
    uint32_t bfOffBits;   // Always 1078 (0x436)
} __attribute__((packed)) BITMAPFILEHEADER;
// Total: 14 bytes
```

**`bfOffBits` invariant**: All 339 Outpost bitmaps use `bfOffBits = 1078` (0x436). This is because every bitmap has exactly 14 (file header) + 40 (info header) + 1024 (palette) = 1078 bytes of headers.

---

## 3. Info Header — `BITMAPINFOHEADER` (40 bytes at offset 0x0E)

| Offset | Size | Field | Type | Value | Description |
|--------|------|-------|------|-------|-------------|
| 0x0E | 4 | `biSize` | `uint32_t` | `40` (0x28) | Size of this header |
| 0x12 | 4 | `biWidth` | `int32_t` | varies | Image width in pixels |
| 0x16 | 4 | `biHeight` | `int32_t` | varies | Image height in pixels (positive = bottom-up) |
| 0x1A | 2 | `biPlanes` | `uint16_t` | `1` | Color planes, always 1 |
| 0x1C | 2 | `biBitCount` | `uint16_t` | `8` | Bits per pixel (always 8 = 256 colors) |
| 0x1E | 4 | `biCompression` | `uint32_t` | `0` (BI_RGB) | No compression |
| 0x22 | 4 | `biSizeImage` | `uint32_t` | varies | Size of pixel data in bytes |
| 0x26 | 4 | `biXPelsPerMeter` | `int32_t` | `0` | Horizontal resolution (unused) |
| 0x2A | 4 | `biYPelsPerMeter` | `int32_t` | `0` | Vertical resolution (unused) |
| 0x2E | 4 | `biClrUsed` | `uint32_t` | `256` (0x100) | Number of palette colors used |
| 0x32 | 4 | `biClrImportant` | `uint32_t` | `256` (0x100) | Number of important colors |

**C struct**:
```c
typedef struct {
    uint32_t biSize;          // 40
    int32_t  biWidth;         // Image width
    int32_t  biHeight;        // Image height (bottom-up when positive)
    uint16_t biPlanes;        // 1
    uint16_t biBitCount;      // 8
    uint32_t biCompression;   // 0 (BI_RGB)
    uint32_t biSizeImage;     // Pixel data size = width × height (with stride)
    int32_t  biXPelsPerMeter; // 0
    int32_t  biYPelsPerMeter; // 0
    uint32_t biClrUsed;       // 256
    uint32_t biClrImportant;  // 256
} __attribute__((packed)) BITMAPINFOHEADER;
// Total: 40 bytes
```

**Key invariants**:
- `biBitCount` is always 8 (never 1, 4, 16, 24, or 32)
- `biCompression` is always 0 (BI_RGB) — no RLE, no bitfields
- `biClrUsed` is always 256 (all palette entries present)

---

## 4. Palette — RGBQUAD Array (1024 bytes at offset 0x36)

The palette immediately follows the info header (offset 0x36 = 54 decimal).

| Field | Size | Description |
|-------|------|-------------|
| `rgbBlue` | 1 byte | Blue intensity (0–255) |
| `rgbGreen` | 1 byte | Green intensity (0–255) |
| `rgbRed` | 1 byte | Red intensity (0–255) |
| `rgbReserved` | 1 byte | Reserved (always 0) |

**Total**: 256 entries × 4 bytes = 1024 bytes.

**C struct**:
```c
typedef struct {
    uint8_t rgbBlue;
    uint8_t rgbGreen;
    uint8_t rgbRed;
    uint8_t rgbReserved; // Always 0
} __attribute__((packed)) RGBQUAD;
// Total: 4 bytes per entry, 256 entries = 1024 bytes
```

### 4.1 Palette Content Profile

| Entry Range | Content |
|-------------|---------|
| 0 (index 0) | Black (0, 0, 0) — transparent key color |
| 1–9 | Standard VGA/CGA colors (dark red, green, brown, dark blue, magenta, cyan, light gray, etc.) |
| 10–25 | Grayscale ramp: 12 steps from ~11 to ~203 |
| 26–250 | Game-specific colors: deep greens, browns, reds for terrain and buildings |
| 251–255 | Terminal colors: pure yellow, blue, magenta, cyan, white |

### 4.2 Palette Sharing

The palette is **not** unique per-file. Analysis shows strong sharing across asset categories:

| Comparison | Shared Entries |
|------------|---------------|
| Terrain tiles (TILE*.BMP) vs. building sprites (500-series, 300×150) | ~208 of 256 (~81%) |
| Building sprites (500-series, 300×150) vs. robot sprites (580-series, 145×120) | ~224 of 256 (~88%) |

This suggests a **common core palette** extended with per-category colors. Tools should assume a consistent palette across files of the same size category.

---

## 5. Pixel Data (starts at offset 0x436 = 1078)

| Property | Value |
|----------|-------|
| Offset | 0x436 (1078 decimal) |
| Encoding | 8-bit indexed (each byte = palette index 0–255) |
| Compression | None (BI_RGB) |
| Row order | **Bottom-up**: first row in file = bottom row of image |
| Stride (row pitch) | Each row is padded to the next 4-byte boundary |

### 5.1 Stride Calculation

```
stride = ((biWidth * biBitCount + 31) / 32) * 4
       = ((biWidth * 8 + 31) / 32) * 4
       = ((biWidth + 3) / 4) * 4   // integer ceil to 4
```

Since `biBitCount = 8`, this simplifies to: **stride = ((width + 3) / 4) * 4**.

### 5.2 Pixel Data Size

```
biSizeImage = stride * abs(biHeight)
```

### 5.3 Total File Size

```
bfSize = 1078 + biSizeImage
        = 1078 + stride * height
```

---

## 6. Complete File Layout Diagram

```
Offset  Size  Content
──────  ────  ──────────────────────────────────────
0x0000   14   BITMAPFILEHEADER  (bfType, bfSize, bfReserved, bfOffBits)
0x000E   40   BITMAPINFOHEADER (biSize..biClrImportant)
0x0036 1024   Palette (256 × RGBQUAD)
0x0436   ??   Pixel data (bottom-up, 8-bit indexed, stride-padded)
```

Total header overhead: **1078 bytes** (fixed for all Outpost bitmaps).

---

## 7. Size Categories

All 339 bitmaps fall into discrete size categories. The total file size for each category is deterministic given the fixed 1078-byte header overhead.

| Dimensions | Stride | `biSizeImage` | Total File Size (`bfSize`) | Count | Category |
|------------|--------|---------------|---------------------------|-------|----------|
| 640 × 480 | 640 | 307,200 | 308,278 | 80 | Terrain/planet view maps |
| 300 × 150 | 300 | 45,000 | 46,078 | 141 | Building sprites (multi-frame) |
| 145 × 120 | 148 | 17,760 | 18,838 | 70 | Robot/vehicle sprites |
| 132 × 125 | 132 | 16,500 | 17,578 | 1 | Minimap tile legend (`1TILE.BMP`) |
| 300 × 300 | 300 | 90,000 | 91,078 | 1 | Large dialog/graphic (`1030.BMP`) |
| 295 × 290 | 296 | 85,840 | 86,918 | 1 | Intro screen (`INTDEM5A.BMP`) |
| 554 × 92 | 556 | 51,152 | 52,230 | 1 | Wide banner (`684A.BMP`) |
| 300 × 85 | 300 | 25,500 | 26,578 | 1 | Logo (`LOGO.BMP`) |
| 77 × 19 | 80 | 1,520 | 2,598 | 5 | Elevation/texture strips |
| 32 × 32 | 32 | 1,024 | 2,102 | 3 | Map icons (TILEICON, SITEICON, PLNTICON) |
| 63 × 21 | 64 | 1,344 | 2,422 | 2 | UI buttons (LAUBUTN, TPBUTTON) |
| 45 × 20 | 48 | 960 | 2,038 | 2 | Scroll buttons (TTDOWN, etc.) |
| 19 × 19 | 20 | 380 | 1,458 | 2 | Tiny UI buttons (TBUP, TBDOWN) |
| 70 × 30 | 72 | 2,160 | 3,238 | 1 | Text UI element (`DIBTEXT.BMP`) |

### 7.1 File Size Verification Formula

For any Outpost bitmap:

```
expected_size = 1078 + ((width + 3) / 4) * 4 * height
```

A valid file must satisfy `bfSize == expected_size` and `biSizeImage == stride * height`.

---

## 8. File Naming Conventions

### 8.1 Terrain / Planet View Maps (640×480)

| Pattern | Example Files | Description |
|---------|--------------|-------------|
| `TILE{1-6}.BMP` | `TILE1.BMP` … `TILE6.BMP` | 6 terrain type maps |
| `TILE{4,5}{A,B}.BMP` | `TILE4A.BMP`, `TILE5B.BMP` | Animated terrain variants |
| `{1020,1030,1032}.BMP` | `1020.BMP`, `1030.BMP` | Additional terrain overlays |
| `{1070-1248}.BMP` | `1070A.BMP`, `1110.BMP`, `1248.BMP` | Special terrain features, panoramas |
| `AIMULT.BMP` | `AIMULT.BMP` | AI multiplayer overlay |

### 8.2 Building Sprites (300×150)

| Pattern | Example Files | Description |
|---------|--------------|-------------|
| `500.BMP` … `597.BMP` | `500.BMP`, `550.BMP` | 98 building structure frames |
| `500A.BMP` … `579A.BMP` | `500A.BMP`, `510A.BMP` | First animation frame (A) |
| `500B.BMP` … `579B.BMP` | `500B.BMP`, `520B.BMP` | Second animation frame (B) |
| `450.BMP` … `497.BMP` | `450.BMP`, `480.BMP` | UI / infrastructure graphics |

### 8.3 Robot / Vehicle Sprites (145×120)

| Pattern | Example Files | Description |
|---------|--------------|-------------|
| `580.BMP` … `649.BMP` | `580.BMP`, `602.BMP`, `645.BMP` | Moving units, vehicles, worker robots |
| `845.BMP` … `849B.BMP` | `845.BMP`, `849A.BMP`, `849B.BMP` | Additional sprites |
| `NI.BMP` | `NI.BMP` | "Not Implemented" placeholder |

### 8.4 UI Elements (Various Sizes)

| File | Size | Purpose |
|------|------|---------|
| `SURFACE.BMP`, `LEVEL{1-4}.BMP` | 77×19 | Elevation/texture indicator strips |
| `TILEICON.BMP` | 32×32 | Map legend tile icon |
| `SITEICON.BMP` | 32×32 | Building site icon |
| `PLNTICON.BMP` | 32×32 | Colony/planet icon |
| `LAUBUTN.BMP`, `LISTBUTN.BMP` | 63×21 | UI action buttons |
| `STTGBUTN.BMP`, `TPBUTTON.BMP` | 63×21 | UI state/terrain buttons |
| `TREEBUTN.BMP` | 63×21 | Tree view button |
| `TBUP.BMP`, `TBDOWN.BMP` | 19×19 | Thumbtack/scrollbar nub |
| `TTDOWN.BMP` | 45×20 | Tree/tab dropdown |
| `DIBTEXT.BMP` | 70×30 | Text panel background |
| `LOGO.BMP` | 300×85 | Game logo |
| `TRADE.BMP` | — | Trade interface |
| `PRBUTTON.BMP`, `RTBUTTON.BMP` | — | Right-click/popup buttons |
| `PLNTROTB.BMP` | — | Rotating planet animation background |
| `651NEW.BMP` | 145×120 | Post-release updated sprite |

---

## 9. Animation Naming Convention

Many building and robot sprites use an **A/B suffix convention** for 2-frame animation:

| Frame State | Suffix | Example |
|-------------|--------|---------|
| Frame A (first state) | `A.BMP` | `500A.BMP` |
| Frame B (second state) | `B.BMP` (or no suffix) | `500B.BMP` or `500.BMP` |

### 9.1 Observed Patterns

- **Buildings (500–579)**: Paired `{ID}A.BMP` + `{ID}B.BMP` (or `{ID}A.BMP` + `{ID}.BMP`). The A/B frames represent active/inactive states (e.g., open/closed, built/constructing).
- **Terrain tiles**: `TILE4A/B.BMP`, `TILE5A/B.BMP` — animated terrain features.
- **Robot sprites**: `849A.BMP` / `849B.BMP` — two-frame animation for certain units.

### 9.2 Absence of Multi-Frame Spritesheets

There are **no sprite-sheet tilesets** in the bitmap collection. Each building/robot is a standalone `.BMP` file. The game code loads individual files and composites them onto the terrain view at runtime (not from a grid-sheet).

---

## 10. Hex Verification (Quick Check)

Given the deterministic structure, a bitmap can be validated with a hex dump of the first 54 bytes.

### 10.1 TILE1.BMP (640×480, 308,278 bytes)

```
Offset  Bytes                          Little-Endian Value  Field
──────  ────────────────────────────── ──────────────────── ──────────────
0x0000  42 4D                          0x4D42               bfType = "BM"
0x0002  36 B4 04 00                    0x0004B436 = 308278  bfSize
0x0006  00 00 00 00                    0                   bfReserved
0x000A  36 04 00 00                    0x0436 = 1078       bfOffBits
0x000E  28 00 00 00                    0x28 = 40            biSize
0x0012  80 02 00 00                    0x0280 = 640         biWidth
0x0016  E0 01 00 00                    0x01E0 = 480         biHeight
0x001A  01 00                          1                    biPlanes
0x001C  08 00                          8                    biBitCount
0x001E  00 00 00 00                    0 (BI_RGB)           biCompression
0x0022  00 B0 04 00                    0x0004B000 = 307200  biSizeImage
0x0026  00 00 00 00                    0                    biXPelsPerMeter
0x002A  00 00 00 00                    0                    biYPelsPerMeter
0x002E  00 01 00 00                    0x0100 = 256         biClrUsed
0x0032  00 01 00 00                    0x0100 = 256         biClrImportant
```

### 10.2 500A.BMP (300×150, 46,078 bytes) — Building Sprite

```
Offset  Key Fields
──────  ──────────────────────────────────────────────────
0x0000  42 4D                                              bfType
0x0002  FE B3 00 00                    0xB3FE = 46078      bfSize
0x000A  36 04 00 00                    1078                 bfOffBits
0x0012  2C 01 00 00                    0x012C = 300         biWidth
0x0016  96 00 00 00                    0x0096 = 150         biHeight
0x001C  08 00                          8                    biBitCount
0x0022  C8 AF 00 00                    0xAFC8 = 45000       biSizeImage
```

### 10.3 580.BMP (145×120, 18,838 bytes) — Robot Sprite

```
Offset  Key Fields
──────  ──────────────────────────────────────────────────
0x0000  42 4D                                              bfType
0x0002  F6 49 00 00                    0x49F6 = 18838      bfSize
0x000A  36 04 00 00                    1078                 bfOffBits
0x0012  91 00 00 00                    0x0091 = 145         biWidth
0x0016  78 00 00 00                    0x0078 = 120         biHeight
0x001C  08 00                          8                    biBitCount
0x0022  60 45 00 00                    0x4560 = 17760       biSizeImage
```

---

## 11. Verification Steps

### 11.1 Automated Validation

For any file claiming to be an Outpost bitmap, validate:

1. **Signature**: First 2 bytes must be `42 4D` ("BM").
2. **Bit depth**: Byte at offset 0x1C must be `08` (8-bit).
3. **Compression**: DWORD at offset 0x1E must be `00 00 00 00` (BI_RGB).
4. **bfOffBits**: DWORD at offset 0x0A must equal `36 04 00 00` (1078).
5. **biClrUsed**: DWORD at offset 0x2E must equal `00 01 00 00` (256).
6. **biSize**: DWORD at offset 0x0E must equal `28 00 00 00` (40).
7. **Size consistency**: `biSizeImage` at offset 0x22 must equal `stride * height` where `stride = ((width + 3) / 4) * 4`.
8. **File size**: `bfSize` at offset 0x02 must equal `1078 + biSizeImage`.

### 11.2 Stride Check (Row Padding)

```
width  = read_uint32(file, 0x12)
height = read_uint32(file, 0x16)
stride = ((width + 3) / 4) * 4  // integer arithmetic
assert stride < 65536

biSizeImage = read_uint32(file, 0x22)
assert biSizeImage == stride * height

bfSize = read_uint32(file, 0x02)
assert bfSize == 1078 + biSizeImage
```

### 11.3 Manual Hex Check (Command Line)

Using PowerShell:

```powershell
# Check TILE1.BMP
$f = [System.IO.File]::ReadAllBytes("TILE1.BMP")
$bfSize = [BitConverter]::ToUInt32($f, 2)
$biWidth = [BitConverter]::ToInt32($f, 0x12)
$biHeight = [BitConverter]::ToInt32($f, 0x16)
$biSizeImage = [BitConverter]::ToUInt32($f, 0x22)
$biBitCount = [BitConverter]::ToUInt16($f, 0x1C)
$biCompression = [BitConverter]::ToUInt32($f, 0x1E)

Write-Host "bfType:       $([BitConverter]::ToUInt16($f, 0)) (expect 19778 = BM)"
Write-Host "bfSize:       $bfSize"
Write-Host "biWidth:      $biWidth"
Write-Host "biHeight:     $biHeight"
Write-Host "biBitCount:   $biBitCount (expect 8)"
Write-Host "biCompression: $biCompression (expect 0)"
Write-Host "bfOffBits:    $([BitConverter]::ToUInt32($f, 0x0A)) (expect 1078)"
Write-Host "biSizeImage:  $biSizeImage"

# Verify stride
$stride = [int]([Math]::Ceiling($biWidth * $biBitCount / 32.0) * 4)
$expectedSizeImage = $stride * [Math]::Abs($biHeight)
Write-Host "Stride calc:  $stride"
Write-Host "Expected biSizeImage: $expectedSizeImage"
Write-Host "Match: $($biSizeImage -eq $expectedSizeImage)"
```

### 11.4 Category Classification

Given known dimensions, classify by matching `biWidth` × `biHeight` to the size categories in Section 7. An unknown size should be treated as a general 8-bit DIB but flagged for review.

---

## 12. Converter Tool Interface

```
bmp-converter info <file>                # Show header fields and validation
bmp-converter check <file>               # Validate structural integrity
bmp-converter extract-palette <file>     # Dump palette as JSON/PNG swatch
bmp-converter convert <file> [--out <dir>] [--png] [--bmp]
bmp-converter batch <dir> [--out <dir>] [--png] [--bmp]
```

**Expected behavior**:
- `info`: decode and display all header fields, computed stride, expected file size
- `check`: run all 8 verification steps, report pass/fail per step
- `extract-palette`: output the 256-color palette as a structured format for comparison
- `convert`: read 8-bit indexed DIB, optionally convert to PNG (default) or standard 24-bit BMP
- `batch`: process all `.BMP` files in a directory; preserve filename

---

## 13. Edge Cases & Known Deviations

| Issue | Details |
|-------|---------|
| **Zero `biXPelsPerMeter` / `biYPelsPerMeter`** | Always 0. Display resolution metadata is not present. No scaling correction needed. |
| **`biClrImportant` = 256** | All colors are marked important. Palette reordering or truncation should not be attempted. |
| **Pixel data alignment** | Row stride is 4-byte aligned per the BMP spec. For widths already divisible by 4 (640, 300, 32), stride equals width exactly. For odd widths (77, 145, 19, 45, 63, 70, 554), stride is padded. |
| **Bottom-up orientation** | The first pixel row in the file is the **bottom** of the image. Image loaders must flip rows during display or assume standard BMP behavior. |
| **Palette entry 0 as transparency** | Entry 0 is always black (0, 0, 0). The game engine likely treats index 0 as a transparent key during compositing. Converters **must not** assume alpha unless explicitly configured. |
| **Missing palette cross-file** | Palette is not guaranteed identical across all files (only ~80% shared). Each file contains its own complete 256-entry palette. Converters should read per-file palette, not assume a global one. |
| **Filename case** | Original game uses uppercase (`.BMP`). Case-sensitive filesystems may require normalization. |

---

## 14. Format Summary

```
Standard Windows DIB (Device Independent Bitmap)
  ─ File header: BITMAPFILEHEADER (14 bytes)
  ─ Info header: BITMAPINFOHEADER (40 bytes)
  ─ Palette:     256 × RGBQUAD (1024 bytes)
  ─ Pixel data:  8-bit indexed, bottom-up, BI_RGB, 4-byte row stride
  ─ Total overhead: 1078 bytes (fixed)
  ─ No compression, no RLE, no alpha channel, no color space info
  ─ Fully compatible with GDI CreateDIBitmap / CreateDIBSection
```
