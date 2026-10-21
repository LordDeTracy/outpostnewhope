# Research: Outpost Remastered — Phase 0 Asset Inventory & Pipeline Design

**Phase**: Phase 0 — Foundation & Asset Pipeline
**Date**: 2026-06-12
**Status**: Complete
**Derived from**: Physical inventory of `D:\Project Outpost\Outpost\` directory; Phase 001 reverse-engineering findings; verified via PowerShell file system audit

---

## 1. Asset Inventory

### 1.1 Bitmaps (339 files, ~40 MB)

All bitmaps use standard 8-bit Windows DIB format (BITMAPFILEHEADER + BITMAPINFOHEADER) with 256-color embedded palette at offset 54, pixel data at offset 1078. BI_RGB (no compression). Source path: `Outpost/BITMAPS/`.

| Category | Count | Resolution | Files |
|----------|-------|-----------|-------|
| Planet/frontier views | ~80 | 640×480 | 480.BMP, 1020.BMP, AIMULT.BMP, TRADE.BMP, 260–497 range (e.g. 260, 264, 266, 268, 272, 274, 276, 450–497) |
| Animation backdrop pairs (A/B) | 10 pairs (20 files) | 640×480 | 204A/B, 206A/B, 208A/B, 210A/B, 211A/B, 212A/B, 218A/B, 220A/B, 221A/B, 222A/B |
| Tile surfaces | 10 | 640×480 | TILE1, TILE2, TILE3, TILE4, TILE4A, TILE4B, TILE5, TILE5A, TILE5B, TILE6 |
| Site views | 2 | 400×300 | 229.BMP, 1090A.BMP |
| Building sprites (base) | 70 | ~300×150 | 500–579 range (gaps at 529–530, 533–540) |
| Building sprites (A-variant) | 70 | ~300×150 | 500A–579A, same gap pattern |
| Robot/vehicle sprites | ~68 | ~145×120 | 580–649 (64 files, gaps at 598–601, 641), 845, 846, 848, NI.BMP |
| Tile icon | 1 | 132×125 | 1TILE.BMP |
| Banner images | 2 | 640×178, 640×300 | 230.BMP, 1119.BMP |
| UI elements | ~26 | Variable | Buttons, level strips, icons, thumb controls, TILEICON.BMP |
| Named graphics | 3 | 300×85, 330×440, 372×311 | LOGO.BMP, 650.BMP, 651NEW.BMP |
| Misc scenes | ~10 | Variable | 1030–1270 range (1030, 1032A, 1033A, 1034A, 1036A, 1037A, 1038A, 1070A, 1082A, 1100, 1110, 1248, 1260A, 1270A) |

**Palette**: First 208 of 256 entries shared between terrain and buildings; 224 shared between buildings and robots. The unified palette enables direct compositing without per-frame color remapping.

**Animation system**: A/B frame cycling via filename suffix. Base file (500.BMP) = frame A, A-suffix variant (500A.BMP) = frame B. Toggle at ~100ms interval for 5 FPS animation. Not all buildings animate — only those with A-variant files present.

### 1.2 Videos (92 FLC files, 145.9 MB)

All files are standard Autodesk Animator Pro format (magic 0xAF12), 8-bit depth, variable resolution (typically 320×200). Source path: `Outpost/VIDEOS/`. Total: 152,988,820 bytes.

| Event Group | Range | Count | Notes |
|-------------|-------|-------|-------|
| Intro | 10–52 | 14 | Title sequence, briefing, launch preparation |
| Early colony | 62–90 | 7 | Landing, initial construction |
| Construction | 100–118 | 8 | Facility construction animations |
| Mid-game | 130–199 | 14 | Colony operations, vehicle deployments |
| Disasters | 200–260 | 12 | Fire, earthquake, meteor, plague, explosions. 211.FLC (6.3 MB), 286.FLC (6.7 MB) are the largest |
| End-game | 270–294 | 6 | Victory sequences, mass driver firing. Includes 270.FLC and 270NEW.FLC variant |
| Colony lifecycle | 300–400 | 12 | Colony growth, research milestones. 398.FLC (6.2 MB), 400.FLC (5.6 MB) |
| Epilogue | 410–453 | 5 | Final cutscenes, credits |
| Variants | — | 2 | 150B.FLC (alternate mid-game), 270NEW.FLC (alternate end-game) |

Total confirmed on disk: **92 files**. FLC files have no embedded audio — cutscenes are silent per original design.

### 1.3 Music & Audio (309 files, ~84.5 MB)

Source path: `Outpost/MUSIC/`. Three tiers of audio.

**Speech — FEM*.WAV (141 files, ~49.3 MB)**
- Range: FEM1.WAV through FEM140.WAV plus FEM125B.WAV, FEM133B.WAV
- Female computer voice narration, mainly tied to tutorial steps
- Per-file range: 35 KB – 2.4 MB (1.6 – 108 seconds)
- Format: 22050 Hz, 8-bit, mono PCM

**Ambient/Dynamic — ADD*.WAV (75 files, ~5 MB)**
- Range: ADD1.WAV through ADD31.WAV (with gaps; numbered sequence covers all 75)
- Short ambient audio beds: machinery, wind, alarms, environment
- Format: 22050 Hz, 8-bit, mono PCM

**Music — M59*.WAV (8 files, ~4 MB)**
- Tracks: M59_03, M59_04, M59_05, M59_07, M59_08, M59_12, M59_14 + M59POL.WAV
- Polished music mixes; played during specific game phases
- Format: 22050 Hz, 8-bit, mono PCM

**Sound Effects — named WAVs (53 files, ~26 MB)**
- Includes: A11BUZ, A12LND, A12PRB, A13PROB, ALARM-D, FIREBALL, FR7_1–3, FR7LAU, GOES, GOES_I, LAUNCH, MACHWHIR, NEW, NOPROB, PLNTXPLD, REENT1–2, ROBOCOP, ROBODIE, ROBOSCRM, ROBOSHOK, ROLLOFF, SCREAM'N, SERVO, SMLSTP, SOLRWIND, STEAM1–3, TEST2, THUNDER1–3, TURBINE, and others

**MIDI Music (32 files, 495 KB)**
- **Mars themes (4 variants)**: MARS.MID (133 KB, General MIDI), MARSMT1.MID (115 KB, MT-32), MARSMT32.MID (111 KB, MT-32 v2), MARSCMRL.MID (25 KB, CM-32L)
- **Event themes**: THUNDER.MID, RUMBLE.MID, INTRSTEL.MID, EARTHQAK.MID, ERTHQUAK.MID, LAUNCH.MID, ALARM.MID, ALARM2.MID, BLSTFURN.MID, EXPLODE.MID, LABXPLOD.MID, PLNTXPLD.MID, SOLRWIND.MID, DEDASTRO.MID, DIGGRDIS.MID, EXPLDSTR.MID, MASSDRVR.MID, METRDFNS.MID, SOLARSAT.MID, TRRAFRMG.MID, WTHRSAT.MID, COMMSAT.MID, LOGOCPLS.MID, ROBOSCRM.MID, ROBOSHOK.MID, AVALANCH.MID
- **Short cues**: 0WSCINIT.MID (557 bytes), MOTOR.MID (248 bytes)
- Format: SMF Type 1, 192 ticks/quarter (0WSCINIT = 96 TQ)

### 1.4 Root Files

| File | Size | Description |
|------|------|-------------|
| `VERSION` | 20 bytes | `OUTPOST 1.51\n07.21.95` |
| `RESOURCE.000` | 1,130,608 bytes | PKWare DCL Implosion archive containing 15 files: BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS, OUTPOST.INI, and other game data |
| `OUTPOST2/OP2_2X.AVI` | 20.1 MB | Sierra promotional teaser video (for unreleased Outpost 2) |
| `MANUAL/OUTP_GB.PDF` | 9.9 MB | Original game manual (German/English bilingual PDF) |

### 1.5 RESOURCE.000 Contents

The archive contains 15 files compressed via PKWare DCL Implosion:

| # | Filename | Compressed Size | Description |
|---|----------|----------------|-------------|
| 1 | BLDGBLD.DAT | ~varies | 138 building definitions, 40 fields each, XOR-0x80 CSV |
| 2 | BLDGOPS.DAT | ~varies | 138 building operational params, 46 fields each, XOR-0x80 CSV |
| 3 | TUTOR.OPS | ~varies | 19 dcbSC sections, 133 tutorial steps, 6 opcodes |
| 4–14 | Other data | ~varies | Supporting game data files |
| 15 | OUTPOST.INI | 21 bytes | `[general]\r\nopimage=\r\n` |

---

## 2. Asset Pipeline Specifications

### 2.1 Pipeline Table

| Asset | Source Format | Target Format | Conversion Tool | HD Resolution Target | Fallback Strategy | File Naming Convention |
|-------|--------------|---------------|-----------------|---------------------|-------------------|----------------------|
| Terrain | 8-bit BMP 640×480 | PNG 2560×1920 | ESRGAN + manual cleanup (Python Pillow) | 4× nearest-neighbor via ESRGAN | Original BMP nearest-neighbor scaled to viewport | `{name}.bmp` → `hd/{name}.png` |
| Building sprites | 8-bit BMP 300×150 | PNG 1200×600 | ESRGAN + manual cleanup (Python Pillow) | 4× | Original BMP scaled to grid cell | `{id}.bmp` / `{id}A.bmp` → `hd/buildings/{id}.png` / `hd/buildings/{id}A.png` |
| Animation backdrops | 8-bit BMP 640×480 | PNG 2560×1920 | ESRGAN + manual cleanup | 4× | Original BMP scaled | `{id}{A,B}.bmp` → `hd/{id}{A,B}.png` |
| UI elements | 8-bit BMP variable | SVG vector | Manual recreation in vector editor | Resolution-independent | Original BMP scaled | `{name}.bmp` → `ui/{name}.svg` |
| Building sprite atlas | Multiple BMPs | PNG sprite atlas | Python Pillow atlas packer | 4× per sprite | Individual BMP loading | `atlas/buildings.png` + `atlas/buildings.json` |
| Cutscenes | FLC (320×200) | H.264 MP4 640×400 | FFmpeg with palettegen+paletteuse | 2× via FFmpeg scale | Original FLC via integrated decoder | `{id}.flc` → `video/{id}.mp4` |
| Speech (FEM) | 22 kHz 8-bit mono WAV | 44.1 kHz 16-bit OGG | SoX + noise reduction | N/A | Original WAV played directly | `FEM{id}.wav` → `audio/speech/FEM{id}.ogg` |
| Ambient (ADD) | 22 kHz 8-bit mono WAV | 44.1 kHz 16-bit OGG | SoX | N/A | Original WAV played directly | `ADD{id}.wav` → `audio/ambient/ADD{id}.ogg` |
| Music (M59) | 22 kHz 8-bit mono WAV | 44.1 kHz 16-bit OGG | SoX | N/A | Original WAV played directly | `M59_{id}.wav` → `audio/music/M59_{id}.ogg` |
| SFX (named) | 22 kHz 8-bit mono WAV | 44.1 kHz 16-bit OGG | SoX | N/A | Original WAV played directly | `{name}.wav` → `audio/sfx/{name}.ogg` |
| MIDI music | MIDI Type 1 | 44.1 kHz 16-bit OGG | FluidSynth + high-quality SF2 | N/A | FluidSynth runtime rendering with configurable SoundFont | `{name}.mid` → `audio/music/{name}.ogg` |
| Building definitions | BLDGBLD.DAT / BLDGOPS.DAT (XOR-0x80) | JSON (merged) | Python data-compiler | N/A | Original binary loaded by parser | `data/buildings.json` |
| Tutorial scripts | TUTOR.OPS (binary) | JSON | Python data-compiler | N/A | Original binary loaded by parser | `data/tutorial.json` |
| Star systems | Hardcoded in EXE | YAML | Manual compilation from RE findings | N/A | N/A (hand-authored) | `data/star-systems.yaml` |

### 2.2 Conversion Parameters

**BMP → PNG upscale (bmp-upscaler)**:
- Input: 8-bit indexed BMP with embedded palette
- Step 1: Extract 256-color palette, convert to RGBA
- Step 2: Nearest-neighbor upscale 4× using Pillow `Image.NEAREST`
- Step 3: ESRGAN inference for detail enhancement (optional, configurable model)
- Step 4: Manual cleanup pass for UI elements (optional)
- Step 5: Output as PNG-32 with sRGB chunk
- Palette preservation: mandatory for terrain/tiles (exact colors); optional for upscaled HD (new colors OK)

**FLC → MP4 (flc-converter)**:
- Input: Autodesk Animator Pro FLC (0xAF12)
- Step 1: Extract all frames using FFmpeg `flc` decoder
- Step 2: Generate optimized palette with `palettegen` filter
- Step 3: Render to H.264 MP4 with `paletteuse` dithering
- Codec: libx264, CRF 18, preset slow
- Resolution: 640×400 (2× original 320×200)
- Framerate: original FLC frame delay (jiffies @ 70 Hz)
- Audio: none (cutscenes are silent)

**WAV → OGG (wav-processor)**:
- Input: 22050 Hz, 8-bit, mono PCM WAV
- Step 1: Apply high-pass filter at 40 Hz (remove DC offset)
- Step 2: Apply light noise reduction (SoX `noisered`)
- Step 3: Resample to 44100 Hz, 16-bit (SoX `rate -v 44100`)
- Step 4: Normalize peak to -1 dB (SoX `norm -1`)
- Step 5: Encode as OGG Vorbis, quality level 5 (`-q 5`)

**MIDI → OGG (midi-renderer)**:
- Input: SMF Type 1 MIDI file
- Step 1: Load MIDI via FluidSynth
- Step 2: Apply high-quality SoundFont (default: FluidR3_GM.sf2; configurable)
- Step 3: Render at 44100 Hz, 16-bit stereo
- Step 4: Encode as OGG Vorbis, quality level 5
- Note: Mars theme has 4 hardware variants (GM, MT-32, MT-32 v2, CM-32L) — use General MIDI variant (MARS.MID) for default render; MT-32 variants preserved for SoundFonts that support them

**Data compilation (data-compiler)**:
- BLDGBLD.DAT: XOR-0x80 decode → split CSV → extract 40 fields per record → build JSON array
- BLDGOPS.DAT: XOR-0x80 decode → split CSV → extract 46 fields per record → merge with BLDGBLD by index
- TUTOR.OPS: Parse dcbSC sections → extract 19 sections → decode 00-prefix opcodes → build step tree
- Output: `buildings.json`, `tutorial.json`, `star-systems.yaml`

---

## 3. Pipeline Architecture

### 3.1 Build-Time Pipeline

The build pipeline runs once per project setup, converting original CD assets into runtime-ready files. Pipeline tools are Python 3.11 scripts in `tools/`; end users receive pre-converted assets.

```
Outpost CD/
│
├── RESOURCE.000
│   └── [resource-extractor: dotnet-cli]
│       Decodes PKWare DCL IMPODE, extracts 15 files
│       ├── BLDGBLD.DAT
│       ├── BLDGOPS.DAT
│       ├── TUTOR.OPS
│       └── (11 other game data files)
│
├── BITMAPS/
│   ├── *.BMP  (339 files)
│   │   ├── [bmp-upscaler: Python Pillow + ESRGAN]
│   │   │   Upscales 8-bit DIB → 4× HD PNG with palette-preserving pipeline
│   │   │   └── assets/textures/hd/*.png  (optional, user-generated)
│   │   │
│   │   └── [bmp-processor: Python Pillow]
│   │       Converts original 8-bit BMP → PNG (lossless, RGBA)
│   │       └── assets/textures/orig/*.png  (fallback)
│   │
│   └── [atlas-packer: Python Pillow + rectpack]
│       Packs building sprites into texture atlas
│       └── assets/atlas/buildings.png + atlas/buildings.json
│
├── VIDEOS/
│   └── *.FLC  (92 files)
│       └── [flc-converter: Python + FFmpeg]
│           Converts to H.264 MP4 at 2× resolution
│           └── assets/video/*.mp4
│
├── MUSIC/
│   ├── FEM*.WAV  (141 files)
│   │   └── [wav-processor: Python + SoX]
│   │       └── assets/audio/speech/*.ogg
│   │
│   ├── ADD*.WAV  (75 files)
│   │   └── [wav-processor: Python + SoX]
│   │       └── assets/audio/ambient/*.ogg
│   │
│   ├── M59*.WAV  (8 files)
│   │   └── [wav-processor: Python + SoX]
│   │       └── assets/audio/music/*.ogg
│   │
│   ├── *.WAV  (53 SFX files)
│   │   └── [wav-processor: Python + SoX]
│   │       └── assets/audio/sfx/*.ogg
│   │
│   └── *.MID  (32 files)
│       └── [midi-renderer: Python + FluidSynth]
│           Renders with selectable SoundFont → OGG Vorbis
│           └── assets/audio/music/*.ogg
│
└── VERSION
    └── [version-check: bash/Python]
        Verifies minimum version (≥1.51); emits build config flag
```

### 3.2 Runtime Asset Loading

At game startup, `AssetManager` resolves assets in priority order:

```
AssetManager::resolve(name, type)
  │
  ├── Check assets/hd/ → if exists, load HD variant
  ├── Else check assets/orig/ → load original resolution variant
  └── Else display error: "Missing asset: {name}"
```

Priority order by asset type:

| Asset Type | Primary (HD) | Fallback 1 | Fallback 2 |
|-----------|-------------|-----------|-----------|
| Terrain textures | `assets/textures/hd/*.png` | `assets/textures/orig/*.png` | `Outpost/BITMAPS/*.BMP` (source) |
| Building sprites | `assets/atlas/buildings.png` | `assets/textures/hd/buildings/*.png` | `assets/textures/orig/*.png` |
| Cutscenes | `assets/video/*.mp4` | `Outpost/VIDEOS/*.FLC` (native decoder) | — |
| Audio | `assets/audio/**/*.ogg` | `Outpost/MUSIC/*.WAV` (direct) | — |
| Game data | `assets/data/*.json/yaml` | `Outpost/RESOURCE.000` (runtime extract) | — |

### 3.3 Data Compilation Pipeline Detail

```
BLDGBLD.DAT (12,403 bytes)
│  138 records × 40 fields
│  XOR-0x80 encoded CSV
│
├── Step 1: Read raw bytes, XOR each byte with 0x80
├── Step 2: Split on 0x0D 0x0A (CRLF, not XOR-encoded)
├── Step 3: Parse 138 lines, comma-delimited
├── Step 4: Map fields 0–39 to named properties
│    ├── Field  0: building name (string)
│    ├── Fields 18–29: 12-bit prerequisite mask (cumulative tech checkpoint)
│    ├── Field 36: cost tier (0–7, maps to actual costs via lookup)
│    ├── Field 37: build time tier (0–6, maps to turns via lookup)
│    ├── Field 38: resource category (0–12)
│    └── Field 39: building category (0–10, upgrade chain ID)
│
└── Output: bldgbld.json
     ├── buildings[138].name
     ├── buildings[138].prereqMask
     ├── buildings[138].costTier
     ├── buildings[138].buildTimeTier
     ├── buildings[138].resourceCategory
     └── buildings[138].buildingCategory

BLDGOPS.DAT (14,049 bytes)
│  138 records × 46 fields
│  XOR-0x80 encoded CSV
│
├── Steps 1–3: Same as BLDGBLD pipeline
├── Step 4: Map fields 0–45 to named properties
│    ├── Fields 22–35: 14-bit operational prerequisite mask
│    ├── Field 36: power cost tier (0–5; 0 = producer)
│    ├── Field 37: staffing tier (0–4)
│    └── Field 38: special flag (-1 = HotLab, 0 = normal, 1 = colonist-needed, 2 = restricted)
│
└── Output: bldgops.json
     └── buildings[138].opsPrereqMask, .powerCostTier, .staffingTier, .specialFlag

Merge Step:
├── Join bldgbld.json + bldgops.json by index (0–137)
├── Add derived fields: upgradeChainId, upgradeLevel, isBuildable, hasAnimation
└── Output: assets/data/buildings.json
```

### 3.4 Development vs. Runtime Dependencies

| Phase | Tool | Dependency | Scope |
|-------|------|-----------|-------|
| Asset conversion | Python 3.11 + Pillow | Dev only | BMP processing, atlas packing |
| Asset conversion | Python + SoX | Dev only | WAV resampling/denoising |
| Asset conversion | Python + FluidSynth | Dev only | MIDI → OGG rendering |
| Asset conversion | Python + FFmpeg | Dev only | FLC → MP4 conversion |
| Asset conversion | dotnet SDK | Dev only | RESOURCE.000 extraction (existing tool) |
| HD upscale | Python + ESRGAN | Dev only | Optional AI upscale |
| Runtime | SDL2 + SDL2-Image | Runtime | Texture loading (PNG, BMP) |
| Runtime | SDL2-Mixer | Runtime | Audio playback (OGG, WAV) |
| Runtime | GLEW | Runtime | OpenGL 3.3+ extension loading |
| Runtime | FFmpeg (optional) | Runtime | Native MP4 playback (alternative to SDL2 video) |

---

## 4. Research Gaps & Unknowns

### 4.1a Resolved Findings (Static Analysis Complete)

Static binary analysis of BLDGBLD.DAT (40 fields, 138 records) and BLDGOPS.DAT (46 fields, 138 records) has confirmed the exact field layouts. Full details in `reference/gap-analysis-resolved.md`.

**BLDGBLD.DAT Field Layout (CONFIRMED):**
| Field | Meaning | Range | Verified |
|-------|---------|-------|----------|
| 0 | Building name | string | ✓ All 138 names read |
| 1–16 | Reserved (always 0) | 0 | ✓ Padding |
| 17–32 | Prereq mask (16 bits, 12 used) | 0/1 | ✓ Tech level prereq bits |
| 33–35 | Reserved (always 0) | 0 | ✓ Unused |
| 36 | **costTier** | 0–7 | ✓ 7 tiers, 72 buildable buildings |
| 37 | **buildTime** | 0–6 | ✓ Actual turns, not tiered |
| 38 | **resCategory** | 1–10 | ✓ Resource cost class |
| 39 | **bldgCategory** | 0–10 | ✓ Functional group (transport=1, hab=2, services=3, power=7, industry=8, terraform=9, seed=10) |

**BLDGOPS.DAT Field Layout (CONFIRMED):**
| Field | Meaning | Range | Verified |
|-------|---------|-------|----------|
| 0 | Building name | string | ✓ All 138 names read |
| 1–16 | Reserved (always 0) | 0 | ✓ Padding |
| 17–26 | Function flags (10 bits) | 0/1 | ✓ Production/behavior class mask |
| 27–35 | Reserved (mostly 0) | 0 | ✓ Tokamak uses f27-29 |
| 36 | **powerTier** | 0–5 | ✓ 0=producer/neutral, 1–5=consumer |
| 37 | **maintenance** | 0–4 | ✓ 0–4 factor |
| 38 | **specialFlag** | 0,1,2,5 | ✓ Special behavior indicator |
| 39–45 | Reserved (always 0) | 0 | ✓ Padding |

**EXE String Analysis (CONFIRMED):**
- All 20 SCI pipeline function names exported
- 8 disaster types: meteoroid, solar flare, earthquake, volcano, wind storm, dust storm, electrical storm, plague/virus
- 5 difficulty levels (Beginner, Easy, Medium, Hard via UGEasy–UGImposs entries)
- Tokamak/Solar energy computed (not table-driven): `"Tokamak Level Advance"`, `"Solar Energy received *"`
- AI functions: SCAiInput, SCSelect, SCForceMorale, SCForceCrimeLevel, SCForceEducationalLevel
- Resource quality tiers: LifeA/B/C, MetalA/B/C/D, PrecA/B, MinA/B/C — 5-tier quality system

**Power Producers (7 total, CONFIRMED):**
SolrPwrRecvr, MShipTokamak, Tokamak, Tokamak2, UGTokamak, UGTokamak2, UGGeoTherm

All have powerTier=0 and produce power. Power OUTPUT values are NOT in DAT files — computed by SCPower function in EXE overlay based on building type, upgrade level, and game state (solar intensity).

**TUTOR.OPS Format (CONFIRMED):** Binary sectioned with `dcbSC**` markers. Sections: SC001 (step definitions), SC002 (sequence), SC03 (event trigger matrix), SC04 (text strings), SC05–SC06 (more data).

### 4.1 Critical (Needs Dynamic Analysis — Configurable Defaults Available)

The following formulas reside in the EXE overlay code (segments 2/4/6 — discardable 16-bit segments loaded on demand, not in static data). These require DOSBox debugger tracing to extract exact values, but **configurable defaults** are provided for implementation — the data-driven architecture (JSON/YAML building definitions) makes later formula corrections trivial.

| # | Gap | Location | Default Formula (Configurable) | Blocking? |
|---|-----|----------|-------------------------------|-----------|
| 1 | **Cost tier → resource cost mapping** | EXE overlay, initialized data | `costTable[tier] = { {cm:0,rm:0}, {cm:25,rm:10}, {cm:60,rm:20}, {cm:120,rm:40}, {cm:200,rm:80}, {cm:300,rm:150}, {cm:450,rm:200}, {cm:800,rm:400} }` — Energy = cm×0.1 | **Not blocking** — tuneable in JSON |
| 2 | **Power output formula** | SCPower overlay | Tokamak: 50/100/150/200 by level, Solar: 10+sun×2, Geo: 30f Consumer draw: `[0,5,10,20,35,50]` by tier | **Not blocking** — tuneable in JSON |
| 3 | **Mine depletion algorithm** | SCMines overlay | 2% per turn (DisMine), 5% per turn (ActiveMine), deplete in chunks | **Not blocking** — plausible default |
| 4 | **Exact SCMorale weights** | SCMorale overlay | Base 50 + food(10) + rec(10) + park(5) + cops(5) + univ(5) + chap(5) − deficit(15) − disaster(20) − overcrowd(10) | **Not blocking** — plausible default |
| 5 | **SCAiInput decision weights** | SCAiInput overlay | Aggressive(30/35/15/20), Balanced(30/20/25/25), Defensive(20/35/30/15) | **Blocking for Phase 4 AI** |
| 6 | **SCEvent probability table** | SCEvent overlay | Plague(30%), Meteor(25%), Earthquake(20%), Fire(15%), Meltdown(10%) — from community reference | **Blocking for Phase 4 disasters** |
| 7 | **Worker assignment ratio** | SCPop overlay | 60% workers, 20% scientists, 20% children | **Blocking for Phase 3 balance** |
| 8 | **Building-to-sprite mapping** | EXE data | Screenshot brute-force tool needed | **Blocking for Phase 2** rendering |
| 9 | **Grid placement rules** | Placement code | Coordinate testing in original EXE | **Blocking for Phase 2** placement UI |
| 10 | **Queue depth limits** | Queue code | Default 10 items, adjustable | Low priority |

### 4.2 Medium (Needs Investigation During Implementation)

### 4.2 Medium (Needs Investigation During Implementation)

| # | Gap | Affected System | Notes |
|---|-----|----------------|-------|
| 11 | **Colony object field layout** — The exact C++ struct layout of the colony object (passed as 32-bit pointer `%08lX` in format strings) would validate our `ColonyState` design | All simulation | Nice-to-have: would confirm field ordering. Not blocking — functional spec is sufficient. |
| 12 | **Overlay segment code (Segments 2/4/6)** — These discardable overlay segments (980KB virtual each, only 16 bytes on disk) contain simulation code we cannot read statically | Steps 1–20 | Requires dynamic analysis: run EXE in DOSBox debugger, capture overlay load events, dump segments after loading. |
| 13 | **FLC-to-event mapping** — Which numeric FLC ID corresponds to which game event (landing, disaster type, victory, etc.) | `CutsceneManager` | Find string cross-reference or event→FLC table in EXE overlay. Currently inferred from numeric ranges only. |
| 14 | **dcbSC opcode semantics** — The exact meaning of opcodes `00 08` (condition) and complex step records with condition types 7 and 8 in TUTOR.OPS | Tutorial system | Execute TUTOR.OPS in DOSBox debugger; trace opcode dispatch to understand all 19 opcode types. |
| 15 | **UGRed "restricted access" behavior** — Special flag = 2 appears only on UGRed. What does this gate? Possibly AI-only construction, event-triggered, or scenario-specific. | Building operations, AI | Find the flag=2 handler in the binary; check if it blocks player construction or enables AI-only behavior. |
| 16 | **Road/pipe network mechanics** — Roads (field indices 36–41) and pipes have orientation variants (L/R/X) but no transport simulation is visible in our extracted data. Do they affect movement speed or resource flow? | Building placement, transport | Search for road/pipe handler functions in binary. Check if orientation affects any simulation variable. |
| 17 | **Nano and Dirt production formulas** — These advanced buildings (resource category 5) reference production chains but our extracted data does not specify their output formulas. | `SCFactory`, production | Cross-reference Nano/Dirt building indices (105? 106?) in BLDGOPS output fields. Check if output is hardcoded or table-driven. |
| 18 | **SpacePort resource reception** — SpacePort appears to receive periodic resource shipments from Earth. Rate, duration, and contents of these shipments are unknown. | `SCFillResources`, Earth supply | Search for Earth supply ship schedule in binary. Check for timer/resource arrays tied to SpacePort. |
| 19 | **"Pop:Leaving" emigration threshold** — What morale level triggers colonists to leave? How many leave per turn? Does it compound? | `SCPop`, `SCMorale` | Run colony with zero morale buildings; track population decline rate per turn. |
| 20 | **HotLab meltdown probability** — Special flag = -1 on HotLab/HotLab2 triggers nuclear accident risk. Base probability per turn, scaling with upgrades, and damage radius unknown. | `SCEvent`, disasters | Binary search for HotLab meltdown handler. Cross-reference with `SCEvent` probability table. |

### 4.3 Recommended Investigation Priority

```
Priority 1 (Blocking — needs resolution before Phase 2):
  ├── Cost tables (Gaps 1–2): Cost and power lookup tables in initialized data
  ├── Mine depletion (Gap 3): DOSBox debugger simulation
  └── Morale formula (Gap 4): Dynamic analysis with memory watchpoints

Priority 2 (Blocking — needs resolution before Phase 3):
  ├── Worker assignment (Gap 7): SCPop tracing
  ├── Building-to-sprite mapping (Gap 8): Brute-force screenshot tool
  └── Grid placement rules (Gap 9): Coordinate testing in original EXE

Priority 3 (Blocking — needs resolution before Phase 4):
  ├── AI weights (Gap 5): SCAiInput tracing
  ├── Event probabilities (Gap 6): SCEvent logging
  ├── Production/research queues (Gap 10): Queue size testing
  └── FLC-to-event mapping (Gap 13): String cross-reference

Priority 4 (Non-blocking, during implementation):
  ├── Overlay code analysis (Gap 12): DOSBox dynamic dump
  ├── Opcode semantics (Gap 14): TUTOR.OPS tracing
  ├── UGRed behavior (Gap 15): Binary flag handler search
  ├── Road/pipe mechanics (Gap 16): Function search
  └── All other gaps
```

### 4.4 Risk of Proceeding Without Resolution

If any **critical** gap (Priority 1–2) remains unresolved when implementation reaches the affected system, the system must be implemented with a **best-effort formula** and flagged for revision after dynamic analysis. The data-driven architecture (YAML/JSON definitions) makes formula updates trivial — no recompile needed for value changes, only structural formula changes require C++ changes.

---

## 5. Technology Decisions

### 5.1 Decision Log

| # | Decision | Choice | Rejected Alternatives | Rationale |
|---|----------|--------|----------------------|-----------|
| 1 | Language standard | **C++20** | C++17, C++23 | C++20 provides constexpr containers (`std::array`, `std::string`), `std::span` for safe array views, concepts for type-safe simulation units, and `std::format` for string formatting. C++17 lacks these. C++23 is too new for consistent compiler support across MSVC/GCC/Clang. |
| 2 | Graphics API | **OpenGL 3.3 core** | Vulkan, Direct3D 12, OpenGL 4.6 | OpenGL 3.3 is sufficient for 2D sprite rendering; supported on all target platforms without additional drivers (Windows: native, Linux: Mesa, macOS: 3.3 core via MGL). Vulkan is over-engineered for a 2D turn-based game. D3D12 locks out Linux/macOS. |
| 3 | Windowing/input/audio | **SDL2** | GLFW + custom audio, SFML | SDL2 is the mature cross-platform standard: window creation, input (keyboard/mouse/joystick), audio output, and threading. SDL2-Image, SDL2-Ttf, and SDL2-Mixer add texture loading, font rendering, and audio codecs on the same dependency. |
| 4 | Build system | **CMake 3.20+** | Make, Meson, Bazel | CMake is the cross-platform standard for C++ projects. IDE integration (Visual Studio, CLion, VS Code). Package manager support (vcpkg, Conan). Meson is cleaner but less widely supported. Make is platform-specific. |
| 5 | Configuration format | **YAML for data, JSON for interchange** | JSON-only, TOML, XML | YAML supports comments (critical for documenting building fields during development). JSON is the interchange format between Python pipeline tools and C++ loaders. TOML is too limited for nested building definitions. XML is too verbose. |
| 6 | Simulation threading | **Single-threaded** | Multi-threaded simulation | Outpost is turn-based — each turn takes <1ms of CPU time. Multi-threaded simulation would add synchronization complexity with zero benefit. Separate threads for audio and video playback only. |
| 7 | Building behavior model | **Entity-Component pattern** | OOP inheritance | 138 building types share behavior in overlapping combinations (PowerConsumer, ResourceProducer, Housing, MoraleBonus, etc.). OOP inheritance would produce deep, rigid hierarchies. Entity-Component allows buildings to compose behaviors from a shared component pool. |
| 8 | Rendering approach | **Shader-based sprite renderer** | Immediate mode (glBegin/glEnd), NAS2D | GL 3.3 core profile requires shaders. Custom shader-based renderer gives full control over the multi-view zoom system without inheriting design constraints from OutpostHD's NAS2D renderer. Batch rendering for performance. |
| 9 | Runtime FLC playback | **Pre-converted MP4 + optional native decoder** | FFmpeg runtime linkage only | Pre-converted MP4 files are the primary playback path (simpler, hardware-accelerated decode). Maintaining an optional native FLC decoder (AAPLAY-like) provides a fallback without external dependencies. |
| 10 | HD asset storage | **Optional separate pack, not bundled** | Bundled with default install | HD assets are large (4× PNGs) and quality depends on the upscale model used. Keeping them optional allows community contribution without bloating the base distribution. |

### 5.2 Dependency Summary

| Dependency | Version | Purpose | Linking | Platform |
|-----------|---------|---------|---------|----------|
| SDL2 | ≥2.26 | Window, input, threading | Dynamic | All |
| SDL2-Image | ≥2.6 | PNG/BMP texture loading | Dynamic | All |
| SDL2-Ttf | ≥2.20 | Font rendering | Dynamic | All |
| SDL2-Mixer | ≥2.6 | OGG/WAV audio playback | Dynamic | All |
| GLEW | ≥2.2 | OpenGL 3.3+ extension loading | Static preferred | All |
| CMake | ≥3.20 | Build system | Build-time | All |
| Python | ≥3.11 | Asset pipeline scripts | Dev only | All |
| Pillow | ≥10.0 | BMP/PNG processing in pipeline | Dev only | All |
| FFmpeg | ≥5.0 | FLC → MP4 conversion (dev); optional native MP4 playback (runtime) | Dev only; optional runtime | All |
| SoX | ≥14.4 | WAV resampling/noise reduction | Dev only | All |
| FluidSynth | ≥2.3 | MIDI → OGG rendering | Dev only | All |
| ESRGAN | optional | AI upscale for HD assets | Dev only (optional) | All |

---

## 6. Risk Assessment

### 6.1 Risk Matrix

| # | Risk | Likelihood | Impact | RPN | Mitigation |
|---|------|-----------|--------|-----|-----------|
| 1 | **Missing formula details block simulation accuracy** — Cost, power, mine, and morale formulas not recoverable from static binary analysis. | Medium | High | 9 | Best-effort formulas from documented game behavior; community playtesting to tune; dynamic analysis (DOSBox debugger) as fallback. Data-driven architecture means formula corrections are config changes, not code changes. |
| 2 | **HD upscale quality insufficient** — ESRGAN upscale of 8-bit 640×480 source produces artifacts or unnatural detail at 4×. | Medium | Medium | 6 | Manual cleanup pass on key textures (planet views, tile surfaces); nearest-neighbor scaling acceptable as performance fallback; community HD asset contributions can replace AI-upscaled defaults. |
| 3 | **FLC conversion loses quality or color accuracy** — Palette-based FLC to H.264 conversion introduces banding or color shifts. | Low | Medium | 3 | FFmpeg with high-bitrate preset (CRF 18) and palettegen/paletteuse filter chain; maintain native FLC decoder as pixel-exact fallback. |
| 4 | **C++20 compiler support gaps across platforms** — MSVC, GCC, Clang have uneven C++20 support (modules, coroutines, contract checking). | Low | Medium | 3 | Limit to widely-supported C++20 features (concepts, constexpr containers, std::span, std::format). No modules (use traditional headers). No coroutines. CI matrix tests all 3 compilers. |
| 5 | **Save format incompatible with original .OPS** — Binary save format mismatch prevents loading original save files. | Medium | Low | 3 | Original .OPS loading is a "nice-to-have" enhancement, not a success criterion. Our own save format with full state serialization is the primary path. Document original format for future compatibility if demand arises. |
| 6 | **SDL2-Mixer does not support all sound types on all platforms** — OGG playback may require additional codec DLLs on Windows. | Low | Medium | 3 | Statically link libvorbis; provide clear dependency documentation; test on all target platforms during Phase 5. |
| 7 | **Performance regression at high zoom levels with HD textures** — 4× 2560×1920 textures at tile zoom with 60+ building sprites may stress older GPUs. | Low | Medium | 3 | Mipmap generation; dynamic resolution scaling; original-resolution fallback for low-end hardware. |
| 8 | **Community expectations diverge from accuracy goals** — Players may prefer gameplay balance fixes over faithful recreation. | Medium | Low | 2 | Clear project scope: "faithful remake." Balance mods can be separate optional patches or config settings. |
| 9 | **Original assets copyright ambiguity** — While Outpost is widely considered abandoned, legal status is unresolved. | Low | High | 3 | Distribution model: users provide their own original CD assets. Project distributes only code and converted files derived from user-provided originals. Clear documentation of asset provenance. |

### 6.2 Contingency Budget

| Area | Contingency | Trigger |
|------|------------|---------|
| Formula investigation | +2 weeks per critical gap | If dynamic analysis does not yield formulas within 1 week of effort |
| HD upscale quality | Accept nearest-neighbor fallback | If ESRGAN results are deemed unsatisfactory by lead developer |
| C++20 compatibility | Drop to C++17 with limited features | If any target platform compiler lacks required C++20 support |
| FLC quality | Ship with native decoder only, skip MP4 | If FFmpeg conversion produces unacceptable artifacts |

### 6.3 Verification Strategy

Each critical gap identified in Section 4 corresponds to a specific verification test in Phase 5:

| Gap | Verification Test | Criteria |
|-----|------------------|----------|
| 1–2 (cost/power tables) | Place every building, verify resource deduction matches original | Exact byte-for-byte resource match for first 20 placements |
| 3 (mine depletion) | Run 100-turn simulation with DisMine-only colony | Ore depletion curve matches original under same conditions |
| 4 (morale formula) | Run colony with known inputs, verify morale output | ±5 points of original morale value at every measured turn |
| 5 (AI weights) | Run 4 rebel colonies at Easy difficulty, compare building choices | ≥80% building selection correlation with original AI |
| 6 (event probabilities) | Run 1000-turn simulation, count disaster occurrences | Disaster frequency within statistical tolerance of original (χ² test) |
| 7 (worker assignment) | Vary population, verify worker/scientist/child ratios | ±2% of original assignment ratios |
| 8 (sprite mapping) | Visual comparison: every placed building displays correct sprite | No visible sprite mismatch across all 138 building types |

---

## 7. File Inventory — Complete Catalog

### 7.1 Directory Structure

```
D:\Project Outpost\Outpost\
├── BITMAPS\          339 BMP files  (~40 MB)
├── VIDEOS\            92 FLC files  (145.9 MB)
├── MUSIC\            277 WAV files  (84.0 MB)
│                     + 32 MID files  (495 KB)
├── MUSIC\MIDI\       (alt. MIDI path, if present)
├── RESOURCE.000       1,130,608 B   (archive, 15 files)
├── VERSION            20 B          (version string)
├── OUTPOST2\         OP2_2X.AVI     (20.1 MB teaser)
├── MANUAL\           OUTP_GB.PDF    (9.9 MB manual)
├── INN\              (standalone Sierra ImagiNation Network client, ~56 files, ~8.5 MB)
├── OUTPOST.EXE        (original 16-bit Windows binary, ~1.62 MB — NOT part of remastered build)
└── ...               (other CD data)
```

### 7.2 Asset Size Summary

| Category | Count | Total Size | Per-File Avg |
|----------|-------|-----------|--------------|
| Terrain/site BMPs | ~80 | ~24 MB | ~300 KB |
| Building sprites | 140 (70 base + 70 A) | ~6.4 MB | ~46 KB |
| Robot/vehicle sprites | ~68 | ~1.3 MB | ~19 KB |
| UI/misc BMPs | ~50 | ~8 MB | ~160 KB |
| FLC cutscenes | 92 | 145.9 MB | 1.6 MB |
| FEM speech WAVs | 141 | 49.3 MB | 350 KB |
| ADD ambient WAVs | 75 | ~5 MB | ~68 KB |
| M59 music WAVs | 8 | ~4 MB | ~500 KB |
| SFX named WAVs | 53 | ~26 MB | ~490 KB |
| MIDI files | 32 | 495 KB | 15 KB |
| RESOURCE.000 | 1 | 1.1 MB | — |

### 7.3 Hot Path Assets (Loaded Every Game Session)

These assets are loaded at startup or during normal gameplay, never on-demand:

- **Terrain tiles**: TILE1–6.BMP (or HD variants) — at least 1 loaded per game session based on star system
- **Planet view**: 480.BMP (or HD variant) — loaded for zoom level 0
- **Building sprites**: 500–579 range + 500A–579A — loaded into sprite atlas at startup
- **UI elements**: All UI BMPs — loaded at startup for chrome rendering
- **HUD fonts**: SDL2-Ttf rendered — loaded at startup
- **Building definitions**: `buildings.json` — loaded and parsed at startup
- **Star system data**: `star-systems.yaml` — loaded at startup
- **Ambient audio**: ADD*.ogg — cached for event-triggered playback
- **SFX**: Named OGG files — cached at startup

---

## 8. Pipeline Tool Specifications

### 8.1 bmp-upscaler (Python + Pillow)

```python
# Pseudocode interface
class BmpUpscaler:
    def __init__(self, model_path: str = "esrgan_model.pth"):
        self.model = load_esrgan(model_path)

    def process_file(self, input_bmp: Path, output_png: Path, scale: int = 4):
        # Step 1: Read 8-bit BMP with palette
        img = Image.open(input_bmp)  # "P" mode, 256-color palette
        palette = img.getpalette()

        # Step 2: Convert to RGBA for upscaling
        rgba = img.convert("RGBA")

        # Step 3: Nearest-neighbor pre-scale (preserves hard edges)
        nn_scaled = rgba.resize(
            (rgba.width * scale, rgba.height * scale),
            Image.NEAREST
        )

        # Step 4: ESRGAN refinement (optional, model required)
        if self.model:
            hd = self.model.enhance(nn_scaled)
        else:
            hd = nn_scaled

        # Step 5: Save as PNG
        hd.save(output_png, "PNG")

    def process_batch(self, input_dir: Path, output_dir: Path,
                      pattern: str = "*.BMP", scale: int = 4):
        for bmp in input_dir.glob(pattern):
            out = output_dir / bmp.with_suffix(".png").name
            self.process_file(bmp, out, scale)
```

**Configuration**: JSON config file for ESRGAN model path, scale factor, per-file override rules (e.g., UI elements skip ESRGAN).

### 8.2 flc-converter (Python + FFmpeg)

```python
class FlcConverter:
    def convert(self, input_flc: Path, output_mp4: Path,
                scale: int = 2, crf: int = 18):
        subprocess.run([
            "ffmpeg", "-i", str(input_flc),
            "-filter_complex",
            f"[0:v] palettegen=max_colors=256:stats_mode=diff [pal];"
            f"[0:v][pal] paletteuse=dither=bayer:bayer_scale=5, "
            f"scale=iw*{scale}:ih*{scale}:flags=neighbor",
            "-codec:v", "libx264",
            "-preset", "slow",
            "-crf", str(crf),
            "-y", str(output_mp4)
        ], check=True)

    def process_batch(self, input_dir: Path, output_dir: Path):
        for flc in sorted(input_dir.glob("*.FLC")):
            mp4 = output_dir / flc.with_suffix(".mp4").name
            self.convert(flc, mp4)
```

### 8.3 wav-processor (Python + SoX)

```python
class WavProcessor:
    def convert(self, input_wav: Path, output_ogg: Path):
        subprocess.run([
            "sox", str(input_wav),
            str(output_ogg),
            "highpass", "40",           # Remove DC offset
            "noisered", "noise.prof",   # Noise reduction profile
            "rate", "-v", "44100",      # Resample to 44.1kHz
            "norm", "-1",               # Peak normalize to -1dB
            "compand", "0.3,1", "6:-70,-60,-20 -5 -4 -0",  # Light compression
            "contrast", "50",           # Slight contrast enhancement
        ], check=True)

    def process_batch(self, input_dir: Path, output_dir: Path,
                      pattern: str = "*.WAV", subdir: str = "sfx"):
        out = output_dir / subdir
        out.mkdir(parents=True, exist_ok=True)
        for wav in input_dir.glob(pattern):
            ogg = out / wav.with_suffix(".ogg").name
            self.convert(wav, ogg)
```

### 8.4 midi-renderer (Python + FluidSynth)

```python
class MidiRenderer:
    def __init__(self, soundfont: str = "FluidR3_GM.sf2"):
        self.soundfont = soundfont
        self.samplerate = 44100

    def render(self, input_mid: Path, output_ogg: Path):
        fs = fluidsynth.Synth()
        fs.start(self.soundfont)
        fs.midi_load(input_mid)
        fs.midi_render(output_ogg)  # Renders to OGG at 44.1kHz/16bit
        fs.delete()

    def process_batch(self, input_dir: Path, output_dir: Path):
        out = output_dir / "music"
        out.mkdir(parents=True, exist_ok=True)
        for mid in input_dir.glob("*.MID"):
            ogg = out / mid.with_suffix(".ogg").name
            self.render(mid, ogg)
```

### 8.5 data-compiler (Python)

```python
class DataCompiler:
    def decode_xor80(self, data: bytes) -> str:
        """XOR-0x80 decode, preserving CRLF terminators."""
        result = []
        i = 0
        while i < len(data):
            if data[i] == 0x0D and i + 1 < len(data) and data[i + 1] == 0x0A:
                result.append('\n')
                i += 2
            else:
                result.append(chr(data[i] ^ 0x80))
                i += 1
        return ''.join(result)

    def parse_bldgbld(self, path: Path) -> list[dict]:
        text = self.decode_xor80(path.read_bytes())
        records = []
        for line in text.strip().split('\n'):
            fields = line.split(',')
            records.append({
                "name": fields[0],
                "prereqMask": self.parse_prereq_mask(fields[17:33]),  // BLDGBLD[17..32] = 16-bit mask
                "costTier": int(fields[36]),
                "buildTimeTier": int(fields[37]),
                "resourceCategory": int(fields[38]),
                "buildingCategory": int(fields[39]),
            })
        return records

    def compile(self, bldgbld_path: Path, bldgops_path: Path,
                tutor_path: Path, output_dir: Path):
        # Compile all data to JSON/YAML
        buildings = self.merge_definitions(
            self.parse_bldgbld(bldgbld_path),
            self.parse_bldgops(bldgops_path)
        )
        self.write_json(output_dir / "buildings.json", buildings)
        self.write_json(output_dir / "tutorial.json",
                        self.parse_tutor(tutor_path))
        self.write_yaml(output_dir / "star-systems.yaml",
                        self.get_star_systems())
```

---

## Appendix A: Verbatim Asset Paths

```
D:\Project Outpost\Outpost\
├── BITMAPS\     ← All 339 BMP files
├── VIDEOS\      ← All 92 FLC files
├── MUSIC\       ← All 277 WAV + 32 MID files
├── RESOURCE.000 ← Compressed archive (15 files, 1.1 MB)
├── VERSION      ← "OUTPOST 1.51\n07.21.95"
├── OUTPOST2\OP2_2X.AVI  ← Sierra teaser (20.1 MB, not used)
└── MANUAL\OUTP_GB.PDF   ← Game manual (9.9 MB, not used)
```

## Appendix B: Key File Counts Confirmed by File System Audit

| Asset Type | Count | Verified |
|-----------|-------|----------|
| BMP files | 339 | `Get-ChildItem -Filter "*.BMP" \| Measure-Object` |
| FLC files | 92 | `Get-ChildItem -Filter "*.FLC" \| Measure-Object` |
| WAV files | 277 | `Get-ChildItem -Filter "*.WAV" \| Measure-Object` |
| MID files | 32 | `Get-ChildItem -Filter "*.MID" \| Measure-Object` |
| Total audio+music files | 309 | 277 + 32 = 309 |
| FEM*.WAV (speech) | 141 | `Group-Object: Name=FEM, Count=141` |
| ADD*.WAV (ambient) | 75 | `Group-Object: Name=ADD, Count=75` |
| M59*.WAV (music) | 8 | `Group-Object: Name=M59, Count=8` |
| Named SFX WAVs | 53 | `Group-Object: Name=SFX, Count=53` |
| RESOURCE.000 | 1 | 1,130,608 bytes |
| A/B animation pairs (640×480) | 10 pairs | Files: 204A/B–222A/B |
| Tile surfaces (640×480) | 10 | TILE1–6 + TILE4A/B + TILE5A/B |
| Building sprites (300×150) | 70 base + 70 A | Range: 500–579 + 500A–579A |
| Robot/vehicle sprites (145×120) | ~68 | Range: 580–649 + 845,846,848 + NI.BMP |
| FLC variant files | 2 | 150B.FLC, 270NEW.FLC |
| Mars MIDI variants | 4 | MARS.MID, MARSMT1.MID, MARSMT32.MID, MARSCMRL.MID |
