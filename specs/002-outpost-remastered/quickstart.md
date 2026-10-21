# Quickstart: Validation Guide — Outpost Remastered

**Created**: 2026-06-12 | **Phase**: Phase 1 — Design Artifacts

---

## 1. Prerequisites

- **C++20 compiler**: MSVC 2022 17.0+, GCC 13+, or Clang 16+
- **CMake** 3.20+
- **SDL2** dev libs: SDL2, SDL2-Image, SDL2-Ttf, SDL2-Mixer (2.26+)
- **GLEW** 2.2+ (OpenGL 3.3)
- **Python** 3.11+ (asset pipeline only)
- **FFmpeg** 5.0+, **SoX** 14.4+, **FluidSynth** 2.3+ (pipeline)
- **Git**

**Quick installs:**

| Platform | Command |
|----------|---------|
| Debian/Ubuntu | `sudo apt install build-essential cmake libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-mixer-dev libglew-dev ffmpeg sox fluidsynth` |
| macOS | `brew install cmake sdl2 sdl2_image sdl2_ttf sdl2_mixer glew ffmpeg sox fluidsynth` |
| Windows | `vcpkg install sdl2 sdl2-image[core] sdl2-ttf sdl2-mixer glew` |

---

## 2. Build Instructions

```bash
git clone <repo-url>
cd ophd-remastered
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel
./build/OutpostRemastered
```

Windows with vcpkg: add `-DCMAKE_TOOLCHAIN_FILE="path\to\vcpkg\scripts\buildsystems\vcpkg.cmake"`.

**Build targets:** `OutpostRemastered` (game), `test-simulation`, `test-renderer`, `test-integration`.

---

## 3. Asset Preparation

Requires original Outpost CD files (RESOURCE.000, BITMAPS/, VIDEOS/, MUSIC/, SOUNDS/).

```bash
python tools/data-compiler.py  "path/to/Outpost" "assets/data"       # JSON definitions
python tools/data-compiler.py  --convert-bitmaps "path/to/Outpost" "assets/textures"
python tools/flc-converter.py  "path/to/Outpost/VIDEOS" "assets/video"
python tools/wav-processor.py  "path/to/Outpost/SOUNDS" "assets/audio"
python tools/midi-renderer.py  "path/to/Outpost/MUSIC" "assets/audio"
python tools/bmp-upscaler.py   "path/to/Outpost/BITMAPS" "assets/hd"  # optional
```

**Result:**
```
assets/
├── data/        buildings.json, systems.json, tutorial.json, tech-tree.json, disasters.json
├── textures/    339+ PNG (converted BMPs)
├── hd/          (optional) upscaled equivalents
├── audio/       277 SFX + 32 music = 309 OGG
└── video/       92 MP4 (converted FLCs)
```

---

## 4. First-Run Validation (Smoke Tests)

**Foundation (Phase 0):**
- [ ] Game window opens at 1280×720
- [ ] `config.xml` created in user data dir on first launch
- [ ] Missing asset dir triggers file-picker (not crash)
- [ ] Alt+F4 / Cmd+Q exits cleanly

**Rendering (Phase 1):**
- [ ] Main menu: New Game, Load Game, Tutorial, Options, Credits, Quit
- [ ] New Game shows 15 star systems with names
- [ ] Selecting a system renders planet view (480.BMP)
- [ ] Zoom in → site view (TILE*.BMP), zoom further → tile view with grid
- [ ] Pan works (WASD / arrows / click-drag), smooth transitions
- [ ] 60 FPS at 1920×1080

**Simulation (Phase 2):**
- [ ] SEED Lander placeable on valid terrain
- [ ] ENTER advances turn, resources update
- [ ] Building construction counts down, completed building appears
- [ ] Population counter updates, tech level advances

**Game Systems (Phase 3):**
- [ ] All 6 building categories functional
- [ ] Prerequisites gate correctly (tech level requirements)
- [ ] Disaster triggers (~30+ turns)
- [ ] Save (Ctrl+S) / Load (Ctrl+L) works
- [ ] Tutorial shows 4 scenarios
- [ ] Audio plays (SFX + music)

**UI & Polish (Phase 4):**
- [ ] HUD shows resources, turn counter, alerts
- [ ] Build panel scrollable with category tabs, tooltips
- [ ] Report screens: Population, Production, Logistics
- [ ] Options screen (resolution, volume, keybindings)
- [ ] Cutscenes play at correct trigger points
- [ ] No crashes in 2-hour session

---

## 5. Simulation Validation

**Procedure:**
1. Start new game on **Aphrodite** (standard conditions)
2. Place SEED Lander at grid coordinate **(24, 24)**
3. Advance exactly **10 turns**
4. Record resource levels, compare against reference
5. If any value differs >5%, check: SCI pipeline step order, building definitions, tech mask resolution, resource formulas, population formulas, power-down priority

**Reference values (fill in during Phase 2 — extracted from original game testing):**

| Resource | Turn 0 | Turn 10 |
|----------|--------|---------|
| CommonMetals | 400 | ? |
| RareMetals | 100 | ? |
| Food | 200 | ? |
| Energy | 100 | ? |
| Population | 50 | ? |
| Workers | 30 | ? |
| Scientists | 10 | ? |
| TechLevel | 1 | ? |

**Extended (Phase 5):** Repeat for all 15 systems at turns 10, 25, 50.

---

## 6. Tutorial Validation

- [ ] Tutorial mode shows 4 scenarios: Aphrodite, Anonymous Bosch, Sigma Draconis, Vulcan's Forge
- [ ] Each scenario loads correct starting terrain and conditions
- [ ] Step-by-step instructions match original TUTOR.OPS text
- [ ] Conditions trigger correct step advancement
- [ ] All dialogs display correct text and formatting
- [ ] All 4 scenarios play through completely (133 steps)
- [ ] Tutorial can be exited mid-way without crash
- [ ] Narrative voice-over (FEM*.WAV) plays at correct steps (if available)

---

## 7. Asset Pipeline Validation

```bash
python tools/verify-assets.py "assets/"
```

**Expected counts:**

| Type | Count | Format |
|------|-------|--------|
| Textures | 339+ (PNG) | TILE1-6, 480.BMP per system, 138×2 A/B building sprites, robots, UI |
| Cutscenes | 92 | MP4 (H.264) |
| SFX | 277 | OGG 44.1kHz 16-bit |
| Music | 32 | OGG (MIDI rendered) |
| Data | 5-7 | JSON |

**Checks:** All PNGs open without error, all MP4s probe clean, all OGGs decode, JSON files validate against schema, 138 building records, 15 systems, 133 tutorial steps.

---

## 8. Performance Targets

| Resolution | Target | Minimum | Hardware |
|------------|--------|---------|----------|
| 1280×720 | 60 FPS | 30 FPS | 10-yr-old integrated GPU |
| 1920×1080 | 60 FPS | 45 FPS | Modern integrated GPU |
| 2560×1440 | 60 FPS | 30 FPS | GTX 1060+ |
| 3840×2160 | 30 FPS | — | RTX 2060+ (disable HD textures) |

Toggle FPS counter with F12. Low FPS: reduce resolution or set `hd_enabled=false` in config.xml.

---

## 9. Configuration

**Location:** `%APPDATA%\OutpostRemastered\config.xml` (Win), `~/.config/` (Linux), `~/Library/Application Support/` (macOS)

```xml
<config>
  <asset_path>./assets</asset_path>
  <hd_path>./assets/hd</hd_path>
  <resolution width="1920" height="1080" fullscreen="false" />
  <vsync>true</vsync>
  <music_volume>0.7</music_volume>
  <sfx_volume>0.8</sfx_volume>
  <audio_buffer>2048</audio_buffer>
  <skip_splash>false</skip_splash>
  <hd_enabled>true</hd_enabled>
  <autosave_interval>5</autosave_interval>
</config>
```

**Key bindings (to be finalized Phase 4):** `W/A/S/D` pan, `Q/E` zoom, `Return` end turn, `Ctrl+S` save, `Ctrl+L` load, `Escape` cancel, `F12` FPS, `G` grid, `F1` HUD, `B` build panel, `F5` quick save, `F8` quick load.

---

## 10. Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| SDL2 not found | Missing dev packages | Install per platform table above |
| C++20 errors | Compiler too old | MSVC 2022 17.0+, GCC 13+, Clang 16+ |
| Black screen | GPU lacks OpenGL 3.3 | Update drivers |
| Missing textures (pink) | Pipeline incomplete | Re-run `data-compiler --convert-bitmaps` |
| No audio | Missing OGGs or Mixer init | Run `wav-processor` + `midi-renderer` |
| Choppy audio | Buffer too small | Set `audio_buffer=4096` in config.xml |
| Low FPS | HD textures on weak GPU | `hd_enabled=false` or lower resolution |
| Cutscenes missing | FLC conversion | Run `flc-converter` |
| Tutorial stuck | TUTOR.OPS not compiled | Re-run `data-compiler`, check `tutorial.json` |
| Wrong resources | Bad building data | Verify JSON definitions, SCI step order |
| macOS won't launch | Not signed/notarized | `xattr -dr com.apple.quarantine OutpostRemastered.app` |

**Debug keys:** `F12` FPS, `` ` `` console, `Ctrl+Shift+D` dump colony state, `Ctrl+Shift+R` reload textures, `Ctrl+Shift+T` cycle render mode.

---

## Appendix: Phase Gating

```
Phase 0 (Build + Assets) → smoke → Phase 1 (Rendering) → smoke + FPS
→ Phase 2 (Simulation) → sim validation → Phase 3 (Game Systems)
→ tutorial + save/load → Phase 4 (UI + Polish) → playthrough
→ Phase 5 (Cross-platform + Release) → all SC pass
```

Run current phase smoke tests before starting next phase.
