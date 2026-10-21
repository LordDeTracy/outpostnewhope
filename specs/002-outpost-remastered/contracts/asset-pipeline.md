# Contract: Asset Pipeline

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items C1, D2 (see section E)). See [ERRATA.md](../../001-outpost-reverse-engineering/findings/ERRATA.md) and the verified [00-ground-truth.md](../../001-outpost-reverse-engineering/findings/00-ground-truth.md) before relying on it.

**Status**: Draft — Phase 0 deliverable

**Applies to**: Conversion of all original Sierra On-Line *Outpost* (1994) assets into modern formats for the Outpost Remastered game.

**Pipeline type**: Build-time / distribution-prep — end users receive pre-converted assets. No runtime extraction from the original CD is required.

---

## 1. Overview

The asset pipeline runs as a batch preprocessing step during project build or distribution packaging. It ingests the original game's file tree (from the Outpost CD or an extracted copy) and produces a clean `assets/` directory containing only modern-format files ready for runtime loading by the C++20/SDL2 game engine.

### 1.1 Design Principles

| Principle | Rationale |
|-----------|-----------|
| **Lossless preservation** | Original data is the source of truth — pipelines should prefer reversible transforms where possible. |
| **Idempotent output** | Running the pipeline twice on the same input must produce byte-identical output. |
| **Graceful degradation** | If HD upscaling fails or a model is missing, fall back to basic format conversion. |
| **No runtime penalty** | All expensive work (upscaling, re-encoding, resampling) happens at build time. |
| **Standalone per-module** | Each pipeline tool is independently runnable, has no cross-dependency, and can be invoked from CI or by hand. |

### 1.2 Input Sources

| Source | Description | File Count | Total Size (approx.) |
|--------|-------------|------------|----------------------|
| `BITMAPS/` | 8-bit Windows BMP files | 339 | ~36 MB |
| `FLICS/` | Autodesk Animator FLC files | 92 | ~120 MB |
| `SOUND/` | WAV (speech/ambient/SFX) + MIDI (music) | 277 WAV + 32 MIDI | ~65 MB |
| `RESOURCE.000` | PKWare-IMPODE archive containing 14 game data files | 1 archive | ~1.1 MB |

### 1.3 Output Summary

| Category | Output Format | File Count | Notes |
|----------|--------------|------------|-------|
| Textures (orig) | PNG (24-bit sRGB) | 339 | 1:1 lossless conversion |
| Textures (HD) | PNG (24-bit sRGB) | ≤339 | 4× upscaled, optional |
| UI (vector) | SVG | ~10 | Manual conversion for key elements |
| Cutscenes | H.264 MP4 | 92 | 2× upscale, silent |
| Speech | OGG Vorbis q5 | 141 | 44.1 kHz 16-bit |
| Ambient | OGG Vorbis q5 | 75 | 44.1 kHz 16-bit, denoised |
| SFX | OGG Vorbis q5 | 53 | Named, 44.1 kHz 16-bit |
| Music | OGG Vorbis q5 | 32 | FluidSynth-rendered from MIDI |
| Game data | JSON | 5+ | buildings, tech-tree, star-systems, tutorial, events |

---

## 2. Image Pipeline

### 2.1 Input Specification

All 339 BMPs conform to the format described in `contracts/bitmap-format.md` (Phase 001):

- **Format**: 8-bit Windows DIB (`BITMAPFILEHEADER` + `BITMAPINFOHEADER` + 256-color `RGBQUAD` palette + `BI_RGB` pixel data)
- **Palette**: Per-file 256-entry palette, ~80% shared across files within the same size category
- **Transparency**: Palette index 0 (black, `rgb={0,0,0}`) serves as the transparent key during compositing
- **Orientation**: Bottom-up rows (first row in file = bottom of image)

### 2.2 Size Categories

| Category | Dimensions | Count | Pipeline |
|----------|------------|-------|----------|
| Terrain / planet views | 640 × 480 | 80 | Upscale 4× → HD terrain |
| Building sprites | 300 × 150 | 141 | Build sprite atlas or individual HD |
| Robot / vehicle sprites | 145 × 120 | 70 | Individual HD or atlas |
| UI elements | various (19×19 to 300×85) | 26 | PNG + optional SVG |
| Special (logo, intros) | various (295×290, 554×92, etc.) | 22 | Convert to PNG |

### 2.3 Processing Steps (per file)

```
Input: *.BMP (8-bit indexed DIB)
  │
  ├─ Step 1: Validate header structure (see §2.7)
  │
  ├─ Step 2: Read palette. Convert RGBQUAD BGR→RGB.
  │          No gamma correction applied at this stage.
  │
  ├─ Step 3: De-index pixel data.
  │          Map each 8-bit index through the palette to produce (R, G, B) triplets.
  │          Undo bottom-up row order (flip vertically in memory).
  │
  ├─ Step 4: sRGB conversion.
  │          The original palette is device-dependent (CRT-era, likely γ ≈ 2.2).
  │          Assume implicit gamma and apply linear-to-sRGB transfer function:
  │            C_srgb = (C_8bit / 255.0)^(1.0/2.2) × 255   [approx]
  │          Only applied when --hd flag is set (original non-HD path preserves
  │          raw palette values for faithful rendering).
  │
  ├─ Step 5 (HD only): 4× upscale via ESRGAN or nearest-neighbor.
  │          See §2.4 for details.
  │
  └─ Step 6: Encode as PNG (24-bit RGB, no alpha) with sRGB chunk.
             Save as `<BASENAME>[_HD].png`.
```

### 2.4 HD Upscaling

#### 2.4.1 ESRGAN Mode (default HD)

```
Upscale factor: 4×
Model: Real-ESRGAN general photo model (realesr-general-x4v3)
        or a custom Outpost-trained model (future)
Tool:  realesrgan-ncnn-vulkan or Python realesrgan package
Input dimensions → Output dimensions:
  640×480   → 2560×1920  (terrain)
  300×150   → 1200×600   (buildings)
  145×120   → 580×480    (robots)
  Other      → 4× each dimension
```

The ESRGAN pass runs as a pre-process before PNG encoding. The pipeline:

1. De-indexed 24-bit RGB image is written as a temporary PNG
2. `realesrgan-ncnn-vulkan -i temp.png -o upscaled.png -s 4 -m models/realesr-general-x4v3`
3. Upscaled PNG is read back and saved to the HD output directory

#### 2.4.2 Nearest-Neighbor Mode (fallback)

When ESRGAN is unavailable (no GPU, missing model), use nearest-neighbor scaling:

```python
from PIL import Image
img = Image.open(temp_png)
img_hd = img.resize((img.width * 4, img.height * 4), Image.NEAREST)
img_hd.save(output_path)
```

This preserves hard pixel edges and is faithful to the original 320×200-to-640×480 doubling the original game used.

#### 2.4.3 Per-Category HD Resolution Table

| Category | Original | 4× HD | Fallback NN HD | Notes |
|----------|----------|-------|----------------|-------|
| Planet views (`480.BMP`) | 640×480 | 2560×1920 | Same | Single-file planet surface |
| Terrain tiles (`TILE{1-6}.BMP`) | 640×480 | 2560×1920 | Same | Each terrain type rendered at 4× |
| Building sprites (500-series) | 300×150 | 1200×600 | Same | A/B frame pairs |
| Robot sprites (580-series) | 145×120 | 580×480 | Same | Single frames + A/B variants |
| UI icons (32×32) | 32×32 | 128×128 | Same | Small elements; SVG preferred |
| UI buttons (63×21) | 63×21 | 252×84 | Same | SVG preferred |

### 2.5 Sprite Atlas Generation

#### 2.5.1 Building Atlas

Buildings (300×150) are output as either individual PNGs (simpler, default) or a single sprite atlas (compact, --atlas flag).

**Atlas layout**:
- Grid cell size: 300 × 150 pixels
- Columns: 16 (arbitrary, chosen for square-ish aspect)
- Rows: ceil(N / 16), where N = number of building files
- Empty cells (unused building IDs) are filled with fully transparent pixels

**Metadata JSON** (`assets/data/building-atlas.json`):
```json
{
  "atlasFile": "assets/textures/hd/buildings/atlas.png",
  "cellWidth": 300,
  "cellHeight": 150,
  "columns": 16,
  "frames": [
    {
      "id": "500A",
      "buildingId": 500,
      "frame": "A",
      "row": 0,
      "col": 0,
      "x": 0,
      "y": 0,
      "w": 300,
      "h": 150
    },
    {
      "id": "500B",
      "buildingId": 500,
      "frame": "B",
      "row": 0,
      "col": 1,
      "x": 300,
      "y": 0,
      "w": 300,
      "h": 150
    }
  ]
}
```

#### 2.5.2 Individual PNG Mode (default)

Each BMP is converted to a standalone PNG with the original filename (lowercase, `.png` extension):

```
500A.BMP → 500a.png
500B.BMP → 500b.png
580.BMP  → 580.png
```

The game engine reads individual files by building ID and appends `a`/`b` for animation frames.

### 2.6 UI Element Pipeline

UI elements receive special handling because many are small and benefit from resolution-independent rendering.

**Processing priority**:
1. **SVG export (preferred)**: For buttons, icons, and small UI elements (19×19 to 63×21), manually trace the bitmap into SVG paths. The SVG is resolution-independent and scales perfectly to any display.
2. **HD PNG (fallback)**: If SVG is unavailable, produce a 4× nearest-neighbor PNG.
3. **Original PNG (baseline)**: Simple BMP→PNG conversion as in the main pipeline.

**UI catalog requiring SVG treatment**:

| File | Size | Purpose | SVG priority |
|------|------|---------|-------------|
| `LAUBUTN.BMP` | 63×21 | Launch button | High |
| `LISTBUTN.BMP` | 63×21 | List view button | High |
| `STTGBUTN.BMP` | 63×21 | State toggle button | High |
| `TPBUTTON.BMP` | 63×21 | Terrain palette button | High |
| `TREEBUTN.BMP` | 63×21 | Tree view button | High |
| `PRBUTTON.BMP` | 63×21 | Popup/right-click button | High |
| `RTBUTTON.BMP` | 63×21 | Right-click action | High |
| `TBUP.BMP` | 19×19 | Thumbtack up | Medium |
| `TBDOWN.BMP` | 19×19 | Thumbtack down | Medium |
| `TTDOWN.BMP` | 45×20 | Tree/tab dropdown | Medium |
| `TILEICON.BMP` | 32×32 | Map tile legend icon | Low |
| `SITEICON.BMP` | 32×32 | Building site icon | Low |
| `PLNTICON.BMP` | 32×32 | Planet/colony icon | Low |
| `SURFACE.BMP` | 77×19 | Elevation strip | Low |
| `LEVEL{1-4}.BMP` | 77×19 | Texture level strips | Low |
| `DIBTEXT.BMP` | 70×30 | Text panel background | Low |

SVG files are stored under `assets/textures/hd/ui/` alongside HD PNGs.

### 2.7 Validation

Each input BMP is validated before processing:

| Check | Description | Failure Action |
|-------|-------------|---------------|
| Signature | First 2 bytes must be `0x4D42` ("BM") | Skip file, log warning |
| Bit depth | Byte at offset 0x1C must be `0x08` | Skip file, log error |
| Compression | DWORD at offset 0x1E must be `0x00000000` (BI_RGB) | Skip file, log error |
| `bfOffBits` | DWORD at offset 0x0A must equal `1078` | Recompute offset, warn |
| `biClrUsed` | DWORD at offset 0x2E must equal `256` | Warn if different |
| Stride | `biSizeImage == ((width + 3) / 4) * 4 * height` | Skip file, log error |
| File size | `bfSize == 1078 + biSizeImage` | Skip file, log error |

### 2.8 Color Profile

| Property | Value |
|----------|-------|
| Output color space | sRGB (IEC 61966-2-1) |
| PNG sRGB chunk | `rendering intent = 0` (Perceptual) |
| Bit depth | 24-bit (8 per channel) |
| Alpha channel | Not written — palette index 0 is left as black. The game engine treats pure black (0,0,0) as transparency key. |
| Palette (non-HD path) | BMP palette values copied verbatim (BGR→RGB reorder only). No gamma correction applied. |

---

## 3. Video Pipeline

### 3.1 Input Specification

| Property | Value |
|----------|-------|
| Format | Autodesk Animator FLC (`.FLC`, `.FLC`) |
| Resolution | 320 × 200 (all 92 files) |
| Frame rate | Varies per file (typically 10–15 fps) |
| Audio | None — all FLCs are silent |
| Palette | 8-bit per-frame palette (FLC format includes per-frame palette deltas) |
| Origin | Original game's `FLICS/` directory, numbered `1.FLC` through `92.FLC` |

### 3.2 Processing Steps

```
Input: *.FLC
  │
  ├─ Step 1: Validate FLC header
  │          Read first 4 bytes as uint32 = magic number.
  │          Expect value matching FLC signature (0xAF11, 0xAF12, or 0xAF44).
  │
  ├─ Step 2: Probe with FFmpeg
  │          ffprobe -v error -show_entries stream=width,height,r_frame_rate,nb_frames input.flc
  │
  ├─ Step 3: Convert via FFmpeg
  │
  └─ Step 4: Verify output
```

### 3.3 FFmpeg Command

**Primary command** (high quality, slow preset):

```bash
ffmpeg -i input.flc \
  -c:v libx264 \
  -preset slow \
  -crf 18 \
  -pix_fmt yuv420p \
  -vf "scale=iw*2:ih*2:flags=lanczos" \
  output.mp4
```

**Fast preset** (for CI or bulk processing where speed matters):

```bash
ffmpeg -i input.flc \
  -c:v libx264 \
  -preset medium \
  -crf 22 \
  -pix_fmt yuv420p \
  -vf "scale=iw*2:ih*2:flags=bilinear" \
  output.mp4
```

### 3.4 Scaling Configuration

| Parameter | Default | Range | Notes |
|-----------|---------|-------|-------|
| Scale factor | 2× | 1× – 4× | `--scale` CLI parameter |
| Lanczos kernel | `lanczos` | `bilinear`, `bicubic`, `lanczos`, `neighbor` | `--scale-algo` CLI parameter |
| Output size | 640×400 | varies | 320×200 × 2 = 640×400 |

### 3.5 Encoder Settings (libx264)

| Parameter | Value | Rationale |
|-----------|-------|-----------|
| `-c:v` | `libx264` | Industry-standard H.264 encoder |
| `-preset` | `slow` | Better compression efficiency (smaller files at same quality) |
| `-crf` | `18` | Visually lossless (range 0–51, lower = better). 18 is the公认 "transparent" quality threshold. |
| `-pix_fmt` | `yuv420p` | Maximum compatibility across all platforms and renderers |
| `-vf scale` | `flags=lanczos` | Lanczos-3 kernel for sharp upscaling |
| `-an` | (implied) | No audio stream |
| `-movflags` | `+faststart` | (optional) Enable streaming-friendly moov atom at file head |

### 3.6 Output Naming

```
Input:  N.FLC  (where N = 1..92)
Output: N.mp4  (same numeric prefix, lowercase .mp4)
```

### 3.7 Special Cases

| Case | Handling |
|------|----------|
| **FLC with 0 frames** | Skip file, log warning. These are palette-only FLCs or corrupted files. |
| **FLC with unusual frame rate** | FFmpeg preserves the source frame rate. No frame blending or interpolation is applied. |
| **Palette animation** | FLC format supports per-frame palette updates. FFmpeg handles these natively. |
| **Files 1.FLC–92.FLC with gaps** | The original set has gaps (not all numbers 1–92 are present). The pipeline processes only files that exist. |

### 3.8 Events Metadata

The pipeline also produces `assets/data/events.json` mapping FLC numbers to their in-game trigger events. This is derived from the reverse-engineering findings in Phase 001:

```json
{
  "events": [
    { "flcNumber": 1,  "trigger": "colony_ship_launch", "description": "Colony ship launches from Earth" },
    { "flcNumber": 2,  "trigger": "hyperdrive_activation", "description": "Hyperdrive engages" },
    { "flcNumber": 5,  "trigger": "landing_sequence", "description": "SEED Lander approaches planet" },
    { "flcNumber": 8,  "trigger": "colony_established", "description": "First colony established" },
    { "flcNumber": 12, "trigger": "disaster_fire", "description": "Fire disaster animation" },
    { "flcNumber": 15, "trigger": "disaster_earthquake", "description": "Earthquake disaster animation" },
    { "flcNumber": 19, "trigger": "disaster_plague", "description": "Plague disaster animation" },
    { "flcNumber": 22, "trigger": "disaster_meteor", "description": "Meteor strike disaster animation" },
    { "flcNumber": 35, "trigger": "disaster_tornado", "description": "Tornado disaster animation" },
    { "flcNumber": 45, "trigger": "rebel_colony", "description": "Rebel colony established" },
    { "flcNumber": 67, "trigger": "victory", "description": "Colony victory cutscene" },
    { "flcNumber": 92, "trigger": "game_over", "description": "Game over / colony lost" }
  ]
}
```

---

## 4. Audio Pipeline

### 4.1 Speech (FEM*.WAV)

#### 4.1.1 Input Specification

| Property | Value |
|----------|-------|
| Format | PCM WAV |
| Sample rate | 22,050 Hz |
| Bit depth | 8-bit unsigned |
| Channels | 1 (mono) |
| File count | 141 |
| Naming pattern | `FEM*.WAV` (e.g., `FEM0001.WAV` … `FEM0141.WAV`) |
| Content | Voice narration for tutorial steps and event dialog |

#### 4.1.2 Processing Steps

```
Input: FEM*.WAV (22 kHz 8-bit mono PCM)
  │
  ├─ Step 1: Validate WAV header
  │          Check RIFF signature, format tag = 1 (PCM), channels = 1.
  │
  ├─ Step 2: Optional noise reduction
  │          If --denoise is set, generate a noise profile from the first
  │          200ms of silent audio (if present) and apply spectral gating.
  │          Tool: sox noise profile + sox noise reduction.
  │
  ├─ Step 3: Resample and convert
  │          sox input.wav -r 44100 -b 16 output.ogg
  │
  └─ Step 4: Verify output
             Check OGG validity, sample rate, duration.
```

#### 4.1.3 SoX Command

```bash
sox input.wav \
  -r 44100 \
  -b 16 \
  -C 5 \
  output.ogg \
  dither \
  rate -v -L 44100
```

| Flag | Purpose |
|------|---------|
| `-r 44100` | Target sample rate (CD quality) |
| `-b 16` | Target bit depth |
| `-C 5` | OGG Vorbis quality level (0–10, 5 ≈ 132 kbps average VBR) |
| `dither` | Apply triangular dither when reducing from 8-bit to higher bit depth |
| `rate -v -L 44100` | Very-high-quality resampling with linear phase filter |

### 4.2 Ambient (ADD*.WAV)

#### 4.2.1 Input Specification

| Property | Value |
|----------|-------|
| Format | PCM WAV |
| Sample rate | 22,050 Hz |
| Bit depth | 8-bit unsigned |
| Channels | 1 (mono) |
| File count | 75 |
| Naming pattern | `ADD*.WAV` (e.g., `ADD0001.WAV` … `ADD0075.WAV`) |
| Content | Ambient background sounds (wind, machinery, colony hum) |

#### 4.2.2 Processing

Same pipeline as speech (§4.1) with the following differences:

1. **Noise reduction is applied by default** (`--denoise`). Ambient recordings have more background hiss from being recorded at lower levels.
2. Noise profile is generated from the quietest 500ms segment of each file (auto-detected via RMS power analysis).
3. Spectral gating threshold: -50 dB (more aggressive than speech at -40 dB).

**Noise reduction sox pipeline**:

```bash
# Generate noise profile
sox input.wav -n trim 0 0.5 noiseprof noise.prof

# Apply noise reduction
sox input.wav output_temp.wav noisered noise.prof 0.21

# Resample to target
sox output_temp.wav -r 44100 -b 16 -C 5 output.ogg dither rate -v -L 44100
```

### 4.3 SFX (Named WAV Files)

#### 4.3.1 Input Specification

| Property | Value |
|----------|-------|
| Format | PCM WAV |
| Sample rate | 22,050 Hz (most files) |
| Bit depth | 8-bit unsigned (most files) |
| Channels | 1 (mono) |
| File count | 53 |
| Naming | Descriptive names (e.g., `ABORT.WAV`, `ALARM.WAV`, `CLICK.WAV`) |
| Content | UI sounds, alerts, feedback beeps |

#### 4.3.2 Processing

Same as speech pipeline (§4.1), but:

1. Noise reduction is optional (default: off). SFX files are typically clean.
2. Original filenames are preserved (lowercased, `.ogg` extension):
   ```
   ABORT.WAV → abort.ogg
   CLICK.WAV → click.ogg
   ```

### 4.4 Music (MIDI → OGG)

#### 4.4.1 Input Specification

| Property | Value |
|----------|-------|
| Format | Standard MIDI File (SMF) Type 1 |
| Tick rate | 192 ticks per quarter note |
| Track count | Varies (multi-track Type 1) |
| File count | 32 |
| Naming | Named files (e.g., `MARS.MID`, `COLONY1.MID`, `LOSE1.MID`) |
| Sound source | General MIDI (GM) compliant; MT-32 extensions present in `MARS.MID` |

#### 4.4.2 Processing Steps

```
Input: *.MID (Standard MIDI File)
  │
  ├─ Step 1: Validate MIDI header
  │          Check "MThd" magic, format type, track count.
  │
  ├─ Step 2: Select SoundFont
  │          Default: FluidR3_GM.sf2 (v2, 140 MB, high quality)
  │          Alternative: TimGM6mb.sf2 (6 MB, lightweight)
  │
  ├─ Step 3: Render to PCM via FluidSynth
  │          fluidsynth -ni soundfont.sf2 input.mid -F output.wav
  │
  ├─ Step 4: Encode as OGG Vorbis q5
  │          sox output.wav -C 5 output.ogg
  │
  └─ Step 5: Cleanup temporary WAV
```

#### 4.4.3 FluidSynth Command

```bash
fluidsynth -ni \
  -a alsa \
  -g 1.0 \
  -R 44100 \
  -r 512 \
  -c 2 \
  -o synth.polyphony=64 \
  -o synth.reverb.active=1 \
  -o synth.chorus.active=1 \
  soundfont.sf2 \
  input.mid \
  -F output_temp.wav
```

| Flag | Purpose |
|------|---------|
| `-ni` | Non-interactive mode (no MIDI input device) |
| `-g 1.0` | Gain factor (1.0 = no change; use `--gain` CLI to adjust in dB) |
| `-R 44100` | Sample rate |
| `-r 512` | Audio buffer size (lower = less latency, N/A for offline) |
| `-c 2` | Stereo output |
| `-o synth.polyphony=64` | Maximum simultaneous voices |
| `-o synth.reverb.active=1` | Enable FluidSynth's built-in reverb |
| `-o synth.chorus.active=1` | Enable FluidSynth's built-in chorus |

#### 4.4.4 MT-32 Handling (MARS.MID)

`MARS.MID` was originally authored with Roland MT-32-specific sysex messages that exploit the MT-32's custom waveform set. On General MIDI SoundFonts, it sounds noticeably different (the iconic bass line uses a non-GM tone).

**MT-32 emulation pipeline**:

```bash
# Using Munt (MT-32 emulator) as a FluidSynth SoundFont
fluidsynth -ni \
  -g 1.0 \
  -R 44100 \
  mt32rom.sf2 \
  MARS.MID \
  -F mars_music_temp.wav

# Fallback: Standard GM SoundFont with custom gain boost
fluidsynth -ni \
  -g 1.5 \
  -R 44100 \
  FluidR3_GM.sf2 \
  MARS.MID \
  -F mars_music_temp.wav
```

The pipeline checks for a `mt32rom.sf2` SoundFont (derived from Munt's MT-32 ROM dumps). If present, it uses MT-32 emulation for `MARS.MID` only. Otherwise, it falls back to standard GM with a 1.5× gain boost to compensate for the typically lower MIDI velocity values.

#### 4.4.5 Music Output Naming

```
MARS.MID   → mars_music.ogg
COLONY1.MID → colony1_music.ogg
LOSE1.MID  → lose1_music.ogg
...
```

All music files carry the `_music.ogg` suffix for clear distinction from speech and SFX.

### 4.5 Output Codec Specification

| Property | OGG Vorbis | Notes |
|----------|------------|-------|
| Container | OGG | `.ogg` extension |
| Codec | Vorbis I | libvorbis (sox or oggenc) |
| Quality | `-C 5` (sox) / `-q 5` (oggenc) | ~132 kbps average VBR |
| Sample rate | 44100 Hz | Resampled from original 22050 Hz |
| Channels | 1 (mono) for speech, ambient, SFX / 2 (stereo) for music | Original WAVs are mono; MIDI renders in stereo |
| Bit depth | 16-bit (intermediate PCM) | OGG is lossy; no bit depth field in Vorbis |

### 4.6 Audio File Inventory

| Category | Input | Expected Output | Count |
|----------|-------|----------------|-------|
| Speech | `FEM*.WAV` | `fem*.ogg` | 141 |
| Ambient | `ADD*.WAV` | `add*.ogg` | 75 |
| SFX | Named `*.WAV` | `*.ogg` (lowercase) | 53 |
| Music | `*.MID` | `*_music.ogg` | 32 |
| **Total audio** | **309 input files** | **301 output files** | |

Note: 8 MIDI files render as stereo OGG via FluidSynth, increasing total output file count by 0 (same file count, some switch from mono to stereo).

---

## 5. Data Pipeline

### 5.1 Input Source

All game data files are extracted from `RESOURCE.000` using the `resource-extractor` tool built in Phase 001 (`tools/resource-extractor/extract.py`). The archive contains 14 entries:

| # | Filename | Compressed Size | Uncompressed Size | Contents |
|---|----------|----------------|-------------------|----------|
| 0 | `DH91BLDGBLD.DAT` | ~4,800 | 12,403 | Building structure definitions |
| 1 | `DH91BLDGOPS.DAT` | ~5,200 | 14,049 | Building operational parameters |
| 2 | `DH91TUTOR.OPS` | ~8,100 | 20,276 | Tutorial script bytecode |
| 3 | `DH91OUTPOST.INI` | ~200 | 21 | Game configuration |
| 4–13 | `DH91*.OPS` | varies | varies | Save game / scenario files (10 total) |

### 5.2 Data Compilation Tool

The `data-compiler` Python tool parses each extracted binary file and produces structured JSON output. The parsing logic derives from the Phase 001 reverse-engineering findings (see `findings/01-binary-structure.md`).

### 5.3 Buildings JSON Schema (`buildings.json`)

```json
{
  "$schema": "OutpostRemastered/Data/Buildings",
  "version": "1.0.0",
  "generated": "2026-06-12T00:00:00Z",
  "sourceFile": "BLDGBLD.DAT",
  "buildings": [
    {
      "id": 1,
      "name": "SpacePort",
      "displayName": "Space Port",
      "category": "infrastructure",
      "tier": 0,
      "techLevel": 1,
      "prereqMask": 1,
      "prereqBuildingId": null,
      "cost": {
        "commonMetals": 10,
        "rareMetals": 5,
        "energy": 0
      },
      "production": {
        "energy": 0,
        "food": 0,
        "commonMetals": 0,
        "rareMetals": 0
      },
      "maintenance": {
        "energy": 2,
        "food": 0,
        "commonMetals": 0,
        "rareMetals": 0,
        "workers": 0,
        "scientists": 0
      },
      "hitPoints": 100,
      "powerState": "requires_power",
      "animation": {
        "frames": 2,
        "intervalMs": 500,
        "mode": "alternating"
      },
      "dimensions": {
        "width": 2,
        "height": 2
      },
      "sprite": {
        "baseId": 500,
        "frameA": "500A.BMP",
        "frameB": "500B.BMP"
      }
    }
  ]
}
```

### 5.4 Building Operations JSON Schema (`building-ops.json`)

```json
{
  "$schema": "OutpostRemastered/Data/BuildingOperations",
  "version": "1.0.0",
  "operations": [
    {
      "buildingId": 1,
      "operationalTurns": 5,
      "staffRequired": 4,
      "failureRate": 0.02,
      "autoRepair": true,
      "outputModifiers": {
        "energy": 0.0,
        "food": 0.0,
        "commonMetals": 0.0,
        "rareMetals": 0.0
      },
      "upgradesTo": null,
      "upgradeRequires": null,
      "special": {
        "providesLifeSupport": false,
        "providesShelter": 50,
        "isMedical": false,
        "isResearch": false,
        "isMilitary": false
      }
    }
  ]
}
```

### 5.5 Tech Tree JSON Schema (`tech-tree.json`)

```json
{
  "$schema": "OutpostRemastered/Data/TechTree",
  "version": "1.0.0",
  "backboneLevels": [
    {
      "level": 1,
      "name": "Initial Colonization",
      "description": "Basic survival infrastructure",
      "prereqBuildingId": 1,
      "unlocksBuildingIds": [2, 3, 4, 5]
    }
  ],
  "upgradeChains": [
    {
      "chainId": 1,
      "name": "LMonoTrain / RMonoTrain",
      "buildings": [110, 111, 112, 113, 114],
      "terminalBuildingId": 114
    }
  ]
}
```

### 5.6 Star Systems JSON Schema (`star-systems.json`)

Each of the 15 star systems has the following structure:

```json
{
  "$schema": "OutpostRemastered/Data/StarSystems",
  "version": "1.0.0",
  "starSystems": [
    {
      "id": 1,
      "name": "Aphrodite",
      "description": "A temperate world with abundant resources.",
      "terrainType": 1,
      "difficulty": 1,
      "startingResources": {
        "commonMetals": 1000,
        "rareMetals": 200,
        "food": 500,
        "energy": 100
      },
      "oreDistribution": {
        "commonMetals": { "surface": 60, "underground": 40 },
        "rareMetals": { "surface": 30, "underground": 70 }
      },
      "tutorialSystem": true
    }
  ]
}
```

### 5.7 Tutorial JSON Schema (`tutorial.json`)

Parsed from `TUTOR.OPS` (19 opcodes, 133 steps, 4 scenarios):

```json
{
  "$schema": "OutpostRemastered/Data/Tutorial",
  "version": "1.0.0",
  "sourceFile": "TUTOR.OPS",
  "scenarios": [
    {
      "id": 1,
      "name": "Aphrodite",
      "starSystemId": 1,
      "steps": [
        {
          "stepNumber": 1,
          "opcode": "SHOW_MESSAGE",
          "condition": null,
          "action": null,
          "dialogText": "Outpost: The game of space colony management.",
          "targetBuildingId": null,
          "timeout": 0
        },
        {
          "stepNumber": 2,
          "opcode": "WAIT_FOR_BUILDING",
          "condition": {
            "type": "building_placed",
            "buildingId": 1
          },
          "action": null,
          "dialogText": "Place the SpacePort to establish your colony.",
          "targetBuildingId": 1,
          "timeout": 0
        }
      ]
    }
  ]
}
```

### 5.8 Events JSON Schema (`events.json`)

See §3.8 for the events.json schema.

### 5.9 Output Data File Inventory

| File | Source | Size (approx.) | Contents |
|------|--------|----------------|----------|
| `buildings.json` | `BLDGBLD.DAT` | ~50 KB | 138 building definitions |
| `building-ops.json` | `BLDGOPS.DAT` | ~60 KB | 138 building operational parameters |
| `tech-tree.json` | Derived from BLDGBLD + BLDGOPS | ~10 KB | 12 backbone levels + 22 upgrade chains |
| `star-systems.json` | Manual + RE findings | ~8 KB | 15 star systems |
| `tutorial.json` | `TUTOR.OPS` | ~30 KB | 133 steps across 4 scenarios |
| `events.json` | Manual + RE findings | ~4 KB | 92 FLC-to-trigger mappings |

---

## 6. Directory Structure (Post-Pipeline)

```
assets/
├── textures/
│   ├── hd/                        # HD upscaled textures (optional pack)
│   │   ├── terrain/
│   │   │   ├── TILE1_HD.png       # 2560×1920
│   │   │   ├── TILE2_HD.png
│   │   │   ├── TILE3_HD.png
│   │   │   ├── TILE4_HD.png
│   │   │   ├── TILE5_HD.png
│   │   │   ├── TILE6_HD.png
│   │   │   ├── 480_HD.png         # Planet view, 2560×1920
│   │   │   └── 1030_HD.png        # 1200×1200
│   │   ├── buildings/
│   │   │   ├── 500a.png           # 1200×600
│   │   │   ├── 500b.png
│   │   │   ├── 501a.png
│   │   │   ├── 501b.png
│   │   │   └── ...                # Up to ~280 files (141 × 2 frames)
│   │   ├── robots/
│   │   │   ├── 580.png            # 580×480
│   │   │   ├── 581.png
│   │   │   └── ...                # ~70 files
│   │   └── ui/
│   │       ├── launch.svg         # SVG buttons preferred
│   │       ├── list.svg
│   │       ├── state_toggle.svg
│   │       ├── terrain_palette.svg
│   │       └── tbup.svg           # Thumbtack
│   └── orig/                      # Fallback: original-size BMP→PNG
│       ├── terrain/               # 640×480
│       │   ├── TILE1.png
│       │   ├── TILE2.png
│       │   ├── ...
│       │   └── 1248.png
│       ├── buildings/             # 300×150
│       │   ├── 500a.png
│       │   ├── 500b.png
│       │   └── ...
│       ├── robots/                # 145×120
│       │   ├── 580.png
│       │   └── ...
│       └── ui/                    # Various sizes
│           ├── LAUBUTN.png
│           └── ...
├── video/                         # H.264 MP4 cutscenes
│   ├── 1.mp4                      # Colony ship launch
│   ├── 2.mp4
│   ├── ...
│   └── 92.mp4
├── audio/
│   ├── speech/
│   │   ├── fem0001.ogg
│   │   ├── fem0002.ogg
│   │   └── ...                    # 141 files
│   ├── sfx/
│   │   ├── abort.ogg
│   │   ├── alarm.ogg
│   │   └── ...                    # 53 files
│   ├── ambient/
│   │   ├── add0001.ogg
│   │   ├── add0002.ogg
│   │   └── ...                    # 75 files
│   └── music/
│       ├── mars_music.ogg
│       ├── colony1_music.ogg
│       └── ...                    # 32 files
└── data/                          # JSON game definitions
    ├── buildings.json
    ├── building-ops.json
    ├── tech-tree.json
    ├── star-systems.json
    ├── tutorial.json
    └── events.json
```

---

## 7. Pipeline Tools

### 7.1 bmp-processor.py

```
Outpost Remastered BMP Processor
Reads 8-bit Windows DIB BMPs, validates them, and outputs PNG textures.

Usage: bmp-processor.py <input_dir> <output_dir> [options]

Arguments:
  input_dir   Directory containing .BMP files (e.g., BITMAPS/)
  output_dir  Output directory for processed textures

Options:
  --hd                        Enable 4× upscaling (HD output).
                              Requires GPU + realsr-ncnn-vulkan.
                              Falls back to nearest-neighbor if unavailable.
  --model PATH                Path to ESRGAN model file (default: realesr-general-x4v3)
  --atlas                     Generate sprite atlases instead of individual files.
                              Produces atlas.png + atlas.json per category.
  --atlas-columns N           Columns in sprite atlas grid (default: 16)
  --format {png,webp}         Output image format (default: png)
  --category {terrain,buildings,robots,ui,all}
                              Process only one category (default: all)
  --svg-dir PATH              Directory containing pre-made SVGs for UI elements
  --skip-validation           Skip header validation (not recommended)
  --no-srgb                   Skip sRGB conversion (preserve raw palette)
  --verbose                   Print detailed per-file progress
  --dry-run                   Scan input files and print summary only

Exit Codes:
  0   Success
  1   Input directory not found
  2   No valid BMP files found
  3   Processing error (check log)

Examples:
  bmp-processor.py CD/BITMAPS/ assets/textures/orig/ --category terrain
  bmp-processor.py CD/BITMAPS/ assets/textures/hd/ --hd --category buildings
  bmp-processor.py CD/BITMAPS/ assets/textures/hd/ --hd --atlas --category all
```

### 7.2 flc-converter.py

```
Outpost Remastered FLC Converter
Batch converts Autodesk Animator FLC files to H.264 MP4.

Usage: flc-converter.py <input_dir> <output_dir> [options]

Arguments:
  input_dir   Directory containing .FLC files (e.g., FLICS/)
  output_dir  Output directory for MP4 files

Options:
  --scale N        Output scale factor (default: 2)
  --scale-algo {lanczos,bilinear,bicubic,neighbor}
                   Upscaling algorithm (default: lanczos)
  --crf N          FFmpeg CRF value 0-51 (default: 18)
  --preset {ultrafast,superfast,veryfast,faster,fast,medium,slow,slower,veryslow}
                   FFmpeg x264 preset (default: slow)
  --ffmpeg PATH    Path to ffmpeg executable (default: ffmpeg on PATH)
  --ffprobe PATH   Path to ffprobe executable (default: ffprobe on PATH)
  --events PATH    Path for events.json output (optional)
  --skip-existing  Skip files that already have corresponding output
  --verbose        Print per-file FFmpeg commands and output
  --dry-run        List files to convert without processing

Exit Codes:
  0   Success
  1   Input directory not found
  2   ffmpeg/ffprobe not found
  3   All conversions failed

Examples:
  flc-converter.py CD/FLICS/ assets/video/
  flc-converter.py CD/FLICS/ assets/video/ --scale 3 --crf 16 --preset veryslow
```

### 7.3 wav-processor.py

```
Outpost Remastered WAV Processor
Resamples, denoises, and encodes WAV files to OGG Vorbis or FLAC.

Usage: wav-processor.py <input_dir> <output_dir> [options]

Arguments:
  input_dir   Directory containing .WAV files
  output_dir  Output directory for encoded files

Options:
  --rate N        Target sample rate in Hz (default: 44100)
  --bits N        Target bit depth (default: 16)
  --format {ogg,flac}
                  Output audio format (default: ogg)
  --quality N     OGG quality 0-10 (default: 5, ~132 kbps)
                  For FLAC: compression level 0-8
  --denoise       Apply spectral noise reduction
  --denoise-threshold DB
                  Noise reduction threshold in dB (default: -40 speech, -50 ambient)
  --sox PATH      Path to sox executable (default: sox on PATH)
  --pattern PAT   Glob pattern for input files (default: *.WAV)
  --category {speech,ambient,sfx}
                  Preset processing profile (sets --denoise, --threshold, --pattern)
  --lowercase     Lowercase output filenames (default: on)
  --strip-prefix PREFIX
                  Strip prefix from filenames (e.g., FEM, ADD)
  --suffix SUFFIX Append suffix to output filenames (e.g., _music)
  --skip-existing Skip already-processed files
  --verbose       Print detailed per-file progress
  --dry-run       Scan and print summary

Examples:
  wav-processor.py CD/SOUND/ assets/audio/ --category speech
  wav-processor.py CD/SOUND/ assets/audio/ --category ambient --denoise
  wav-processor.py CD/SOUND/ assets/audio/ --category sfx
```

### 7.4 midi-renderer.py

```
Outpost Remastered MIDI Renderer
Renders Standard MIDI Files to OGG Vorbis via FluidSynth.

Usage: midi-renderer.py <input_dir> <output_dir> <soundfont.sf2> [options]

Arguments:
  input_dir      Directory containing .MID files
  output_dir     Output directory for rendered audio
  soundfont.sf2  Path to SoundFont file (.sf2 or .sf3)

Options:
  --gain DB           Volume gain in dB (default: 0.0)
  --rate N            Sample rate in Hz (default: 44100)
  --polyphony N       Maximum polyphony voices (default: 64)
  --format {ogg,flac,wav}
                      Output format (default: ogg)
  --quality N         OGG quality 0-10 (default: 5)
  --suffix SUFFIX     Suffix for output filenames (default: _music)
  --mt32              Enable MT-32 emulation for compatible tracks.
                      Requires mt32rom.sf2 in same directory as main SoundFont.
  --mt32-sf PATH      Path to MT-32 SoundFont (default: auto-detect)
  --mt32-only-files FILES
                      Comma-separated list of filenames to render with MT-32
                      (default: MARS.MID)
  --fluidsynth PATH   Path to fluidsynth executable (default: fluidsynth on PATH)
  --sox PATH          Path to sox executable (default: sox on PATH)
  --skip-existing     Skip files that already have corresponding output
  --verbose           Print detailed per-file progress
  --dry-run           List files to render without processing

Exit Codes:
  0   Success
  1   Input directory not found
  2   SoundFont not found
  3   fluidsynth or sox not found

Examples:
  midi-renderer.py CD/SOUND/ assets/audio/music/ FluidR3_GM.sf2
  midi-renderer.py CD/SOUND/ assets/audio/music/ FluidR3_GM.sf2 --mt32 --gain 1.5
```

### 7.5 data-compiler.py

```
Outpost Remastered Data Compiler
Parses binary game data files from RESOURCE.000 into structured JSON/YAML.

Usage: data-compiler.py <extracted_dir> <output_dir> [options]

Arguments:
  extracted_dir  Directory containing files extracted from RESOURCE.000
  output_dir     Output directory for JSON/YAML definitions

Options:
  --format {json,yaml}
                  Output format (default: json)
  --pretty        Pretty-print output with indentation
  --indent N      Indentation spaces (default: 2)
  --source FILE   Only compile a specific file (e.g., BLDGBLD.DAT)
                  Can be specified multiple times.
  --verify        Run verification checks after compilation
                  (cross-check against known reference values)
  --verbose       Print parsed field values during processing
  --dry-run       Print summary of what would be compiled

Output files:
  BLDGBLD.DAT   → buildings.json
  BLDGOPS.DAT   → building-ops.json
  TUTOR.OPS     → tutorial.json
  OUTPOST.INI   → config-defaults.json
  *.OPS         → scenario-{name}.json

Examples:
  data-compiler.py extracted/ assets/data/
  data-compiler.py extracted/ assets/data/ --format yaml --pretty --verify
  data-compiler.py extracted/ assets/data/ --source BLDGBLD.DAT --source BLDGOPS.DAT
```

### 7.6 Resource Extractor (Phase 001, unchanged)

The `resource-extractor` tool built in Phase 001 is a prerequisite for the data pipeline. It is not re-implemented as part of this phase. Its interface:

```
Usage: extract.py <archive_path> [output_dir]

Extracts all files from RESOURCE.000 archive.
Output filenames are stripped of the "DH91" prefix.
```

---

## 8. Verification

### 8.1 Per-Output Verification

| Asset type | Verification check | Command / method |
|-----------|-------------------|------------------|
| **Textures (orig)** | File count = 339, each valid PNG | `python -c "from PIL import Image; Image.open('path').verify()"` |
| **Textures (HD)** | Dimensions match 4× original; valid PNG | Check `im.size == (w*4, h*4)` |
| **Video** | File count = 92, each valid MP4 | `ffprobe -v error input.mp4` |
| **Audio** | File count = 301, each valid OGG | `sox --i input.ogg` |
| **Data** | Valid JSON, schema-conformant | `python -c "import json; json.load(open('path'))"` |

### 8.2 Count Verification Table

| Category | Input Files | Pipeline | Expected Output Files | Check |
|----------|-------------|----------|----------------------|-------|
| Terrain BMPs | 80 | → PNG | 80 (orig) + 6 terrain + 1 planet = 87 HD | `ls assets/textures/orig/terrain/*.png | wc -l` |
| Building BMPs | 141 | → PNG/atlas | 141 (orig) + up to 282 HD individual | `ls assets/textures/orig/buildings/*.png | wc -l` |
| Robot BMPs | 70 | → PNG | 70 (orig) + 70 HD | `ls assets/textures/orig/robots/*.png | wc -l` |
| UI BMPs | 26 | → PNG/SVG | 26 + optional SVGs | `ls assets/textures/orig/ui/*.png | wc -l` |
| FLCs | 92 | → MP4 | 92 | `ls assets/video/*.mp4 | wc -l` |
| Speech WAVs | 141 | → OGG | 141 | `ls assets/audio/speech/*.ogg | wc -l` |
| Ambient WAVs | 75 | → OGG | 75 | `ls assets/audio/ambient/*.ogg | wc -l` |
| SFX WAVs | 53 | → OGG | 53 | `ls assets/audio/sfx/*.ogg | wc -l` |
| MIDI files | 32 | → OGG | 32 | `ls assets/audio/music/*.ogg | wc -l` |
| Data files | 14 extracted | → JSON | 5+ data files | `ls assets/data/*.json | wc -l` |

### 8.3 Content Verification

#### 8.3.1 Building Data Round-Trip

After compiling `buildings.json` and `building-ops.json`, run the `dat-dumper` tool (Phase 001) against the original binary files to extract a reference. Then compare:

```bash
# Dump original binary data
dat-dumper dump BLDGBLD.DAT > reference_bldgbld.csv

# Compile via data-compiler
data-compiler.py extracted/ assets/data/ --format json --pretty

# Extract from JSON for comparison
python tools/verify_buildings.py assets/data/buildings.json --reference reference_bldgbld.csv
```

The verification script must confirm:
- All 138 buildings present in JSON match the 138 entries in the binary dump
- Fields `id`, `cost`, `prereqMask`, `production`, `maintenance`, `hitPoints` match exactly
- Building names match the decoded names from Phase 001

#### 8.3.2 Texture Checksum Verification

For the non-HD (orig) path, each output PNG must decode to the same pixel data as the original BMP (after palette de-indexing). SHA-256 checksums are computed and stored in a manifest:

```bash
# Generate manifest for original BMPs
sha256sum CD/BITMAPS/*.BMP > manifest_orig.sha256

# Generate manifest for output PNGs (non-HD only)
python tools/verify_texture_checksums.py \
  --input-manifest manifest_orig.sha256 \
  --input-dir CD/BITMAPS/ \
  --output-dir assets/textures/orig/
```

The verification tool:
1. Reads each output PNG
2. De-indexes the corresponding input BMP
3. Compares pixel arrays row by row
4. Reports any mismatches (allowable tolerance: 0 — must be bit-identical)

#### 8.3.3 Audio Duration Verification

All processed audio files must have the same duration (±100ms) as the source:

```bash
python tools/verify_audio_duration.py \
  --input-dir CD/SOUND/ \
  --output-dir assets/audio/ \
  --tolerance 0.1
```

### 8.4 Manifest File

The pipeline generates an `assets/manifest.json` at the root of the output directory:

```json
{
  "pipeline": "Outpost Remastered Asset Pipeline",
  "version": "1.0.0",
  "generated": "2026-06-12T00:00:00Z",
  "inputHash": "sha256:<hash_of_input_directory_tree>",
  "files": [
    {
      "path": "textures/orig/terrain/TILE1.png",
      "source": "BITMAPS/TILE1.BMP",
      "sourceSize": 308278,
      "outputSize": 921654,
      "sha256": "abcdef...",
      "category": "terrain",
      "hd": false
    },
    {
      "path": "textures/hd/terrain/TILE1_HD.png",
      "source": "BITMAPS/TILE1.BMP",
      "sourceSize": 308278,
      "outputSize": 3670020,
      "sha256": "123456...",
      "category": "terrain",
      "hd": true,
      "hdMethod": "realesr-general-x4v3"
    }
  ],
  "summary": {
    "totalInputFiles": 663,
    "totalOutputFiles": 663,
    "texturesOrig": 339,
    "texturesHd": 339,
    "video": 92,
    "audio": 277,
    "music": 32,
    "dataFiles": 5,
    "errors": 0,
    "warnings": 0
  }
}
```

---

## 9. Error Handling & Edge Cases

| Scenario | Behavior |
|----------|----------|
| **Input file missing** | Log warning, skip, continue with remaining files |
| **Corrupted BMP** | Fail validation step; skip file; write error to log |
| **FLC with zero frames** | Skip; log warning (palette-only FLC) |
| **WAV with unexpected format** | Attempt to read via sox with auto-detection; if unsupported, skip |
| **MIDI with sysex that FluidSynth can't handle** | Render with sysex filtered; log warning |
| **ESRGAN model missing** | Fall back to nearest-neighbor 4×; log warning |
| **SoundFont missing** | Abort midi-renderer with exit code 2 |
| **Output directory already contains files** | Overwrite by default; `--skip-existing` to preserve |
| **Disk full during processing** | Catch `IOError`, log, abort pipeline |
| **Unicode filenames** | All game assets are ASCII; pipeline asserts ASCII-only paths |
| **Case collisions on case-insensitive filesystem** | Input BMPs have unique case-insensitive filenames (verified); output uses lowercase extension |

---

## 10. Pipeline Execution

### 10.1 Full Pipeline Run

```bash
# Step 1: Extract game data from RESOURCE.000
python tools/resource-extractor/extract.py CD/RESOURCE.000 extracted/

# Step 2: Process images (original + HD)
python tools/bmp-upscaler/bmp-processor.py CD/BITMAPS/ assets/textures/orig/
python tools/bmp-upscaler/bmp-processor.py CD/BITMAPS/ assets/textures/hd/ --hd

# Step 3: Convert cutscenes
python tools/flc-converter/flc-converter.py CD/FLICS/ assets/video/ --events assets/data/events.json

# Step 4: Process audio (in parallel)
python tools/wav-processor/wav-processor.py CD/SOUND/ assets/audio/ --category speech
python tools/wav-processor/wav-processor.py CD/SOUND/ assets/audio/ --category ambient --denoise
python tools/wav-processor/wav-processor.py CD/SOUND/assets/audio/ --category sfx

# Step 5: Render music
python tools/midi-renderer/midi-renderer.py CD/SOUND/ assets/audio/music/ FluidR3_GM.sf2 --mt32

# Step 6: Compile game data
python tools/data-compiler/data-compiler.py extracted/ assets/data/ --pretty --verify

# Step 7: Generate manifest
python tools/generate-manifest.py assets/
```

### 10.2 CI Integration

The pipeline is designed to run in CI. A `Makefile` or `CMake` target wraps the full pipeline:

```makefile
.PHONY: assets
assets:
	python tools/resource-extractor/extract.py $(INPUT_DIR)/RESOURCE.000 extracted/
	python tools/bmp-upscaler/bmp-processor.py $(INPUT_DIR)/BITMAPS/ assets/textures/orig/
	python tools/flc-converter/flc-converter.py $(INPUT_DIR)/FLICS/ assets/video/ --events assets/data/events.json
	python tools/wav-processor/wav-processor.py $(INPUT_DIR)/SOUND/ assets/audio/ --category speech
	python tools/wav-processor/wav-processor.py $(INPUT_DIR)/SOUND/ assets/audio/ --category ambient --denoise
	python tools/wav-processor/wav-processor.py $(INPUT_DIR)/SOUND/ assets/audio/ --category sfx
	python tools/midi-renderer/midi-renderer.py $(INPUT_DIR)/SOUND/ assets/audio/music/ FluidR3_GM.sf2 --mt32
	python tools/data-compiler/data-compiler.py extracted/ assets/data/ --pretty --verify
	python tools/generate-manifest.py assets/
```

### 10.3 Parallelism

Pipeline steps 2–6 are independent and can run in parallel. Recommended execution:

```
Phase A (sequential):
  1. Extract → extracted/

Phase B (parallel, all independent):
  2a. bmp-processor (orig)
  2b. bmp-processor (HD)
  3.  flc-converter
  4a. wav-processor (speech)
  4b. wav-processor (ambient)
  4c. wav-processor (sfx)
  5.  midi-renderer
  6.  data-compiler

Phase C (sequential, depends on B):
  7. generate-manifest
```

---

## 11. Dependencies

### 11.1 Runtime Dependencies (End User)

None — all assets are pre-converted. The game reads PNG, MP4, OGG, and JSON natively through SDL2/SDL2-Mixer.

### 11.2 Build-Time Dependencies (Pipeline Developers)

| Tool | Version | Purpose |
|------|---------|---------|
| Python | 3.11+ | All pipeline tool scripts |
| Pillow | 10.x | BMP→PNG conversion, image processing |
| FFmpeg | 6.x+ | FLC→MP4 conversion |
| SoX | 14.4.2+ | WAV→OGG resampling and noise reduction |
| FluidSynth | 2.3+ | MIDI→WAV rendering |
| realesrgan-ncnn-vulkan | 0.2+ | ESRGAN-based HD upscaling (optional) |
| PyYAML | 6.x+ | YAML output for data-compiler (optional) |

### 11.3 Optional Runtime Components (HD Pack)

| Component | Purpose |
|-----------|---------|
| Real-ESRGAN model file | `realesr-general-x4v3` (~6 MB) for AI upscaling |
| MT-32 ROM SoundFont | `mt32rom.sf2` for authentic MARS.MID playback |
| FluidR3_GM.sf2 | Primary SoundFont (~140 MB, can be omitted if assets are pre-rendered) |

---

## 12. Revision History

| Revision | Date | Author | Changes |
|----------|------|--------|---------|
| 1.0 | 2026-06-12 | Pipeline Contract | Initial draft — complete pipeline specification |
