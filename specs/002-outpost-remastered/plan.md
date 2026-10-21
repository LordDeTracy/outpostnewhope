# Implementation Plan: Outpost Remastered

**Branch**: `002-outpost-remastered` | **Date**: 2026-06-12 | **Spec**: `specs/002-outpost-remastered/spec.md`

**Input**: Feature specification from `specs/002-outpost-remastered/spec.md`

---

## Summary

Ground-up remake of Sierra Outpost (1994) using C++20/SDL2 with a custom rendering engine. Every system, value, and behavior derives from the reversed original game data. The game runs natively on Windows, Linux, and macOS at HD resolutions. OutpostHD serves as reference only — all architecture is independently designed.

---

## Technical Context

**Language/Version**: C++20, Python 3.11 (asset pipeline only)

**Primary Dependencies**: SDL2, SDL2-Image, SDL2-Ttf, SDL2-Mixer, GLEW (OpenGL 3.3+)

**Build System**: CMake 3.20+ with platform-specific dependency detection

**Storage**: YAML/JSON definition files (compiled from original binary parsers); binary save format matching original .OPS structure

**Testing**: Catch2 or doctest for unit tests; manual play-through for acceptance

**Target Platform**: Windows (x64), Linux (x64), macOS (ARM + x64)

**Project Type**: Desktop game — native executable

**Performance Goals**: 60 FPS minimum at 1920×1080 on modern hardware; 30 FPS minimum at 1280×720 on 10-year-old hardware

**Constraints**: Must not depend on OutpostHD code; all original assets loaded dynamically from user-specified path; no DRM or online requirements

**Scale/Scope**: ~30,000-50,000 lines of C++20 across engine + game logic; 339 source BMPs, 92 FLCs, 277 WAVs, 35 MIDIs; 138 building definitions, 133 tutorial steps

---

## Constitution Check

*GATE: Must pass before Phase 0. Re-check after Phase 2.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Game Preservation & Accuracy | ✅ | Remake is the ultimate preservation — every system faithful to original |
| II. C++ & SDL2 Native Stack | ✅ | C++20 + SDL2 + OpenGL 3.3, as specified |
| III. Community-Driven | ✅ | OutpostUniverse community target audience |
| IV. Cross-Platform | ✅ | CMake + SDL2 ensures all 3 platforms |
| V. Evidence-Based Docs | ✅ | All data from Phase 001 RE findings |
| VI. Vendor-Neutral Tooling | ✅ | SDL2/GLEW open stack |
| VII. Faithful Recreation | ✅ | Core principle of this phase |
| VIII. Original Data as Source of Truth | ✅ | Data-driven architecture from reversed formats |
| IX. OutpostHD as Reference | ✅ | Reference only, no code copying |

**Gates passed**: No violations.

---

## Project Structure

### Documentation (this feature)

```text
specs/002-outpost-remastered/
├── spec.md                # Feature specification (this file)
├── plan.md                # Implementation plan (this file)
├── research.md            # Phase 0 output: asset inventory and pipeline design
├── data-model.md           # Phase 1 output: in-memory entity relationships
├── quickstart.md           # Phase 1 output: build and run guide
├── contracts/              # Phase 1 output: system interfaces
│   ├── asset-pipeline.md   # Asset conversion format contracts
│   ├── simulation-api.md   # SCI pipeline function signatures
│   ├── render-api.md       # Multi-view rendering interface
│   └── save-format.md      # Save file binary format
└── tasks.md                # Phase 2 output: implementation tasks
```

### Source Code

```text
src/
├── main.cpp                  # Entry point, SDL2 init, main loop
├── core/                     # Foundation layer
│   ├── engine.hpp/cpp        # Game engine core (init, run, shutdown)
│   ├── config.hpp/cpp        # Configuration loader (config.xml)
│   ├── asset-manager.hpp/cpp # Asset loading and caching
│   ├── resource-archive.hpp/cpp  # RESOURCE.000 parser (from RE tools)
│   └── types.hpp             # Shared type definitions
│
├── render/                   # Rendering engine
│   ├── renderer.hpp/cpp      # OpenGL 3.3+ renderer
│   ├── texture.hpp/cpp       # Texture loading and management
│   ├── sprite.hpp/cpp        # Sprite rendering (buildings, UI)
│   ├── terrain-view.hpp/cpp  # Multi-view terrain (planet/site/tile)
│   ├── camera.hpp/cpp        # Pan/zoom camera controls
│   └── animation.hpp/cpp     # A/B frame animation controller
│
├── simulation/               # Colony simulation (SCI pipeline)
│   ├── colony.hpp/cpp        # Colony state container
│   ├── pipeline.hpp/cpp      # 20-step SCI pipeline executor
│   ├── resources.hpp/cpp     # Resource tracking (6 resource types)
│   ├── population.hpp/cpp    # Population/morale system
│   ├── building.hpp/cpp      # Building state and operations
│   ├── tech-tree.hpp/cpp     # Prerequisite resolution from 12-bit mask
│   ├── disaster.hpp/cpp      # Disaster system (6 types)
│   ├── ai-controller.hpp/cpp # Rebel colony AI
│   └── game-loop.hpp/cpp     # Turn-based loop with optional real-time
│
├── data/                     # Data loaders (from RE findings)
│   ├── bldgbld.hpp/cpp       # BLDGBLD.DAT parser
│   ├── bldgops.hpp/cpp       # BLDGOPS.DAT parser
│   ├── tutor-ops.hpp/cpp     # TUTOR.OPS parser (19 opcodes)
│   ├── star-systems.hpp/cpp  # 15 star system definitions
│   └── definitions.hpp/cpp   # YAML/JSON definition loader
│
├── ui/                       # User interface
│   ├── window.hpp/cpp        # Window manager, event loop
│   ├── main-menu.hpp/cpp     # Main menu, options, credits
│   ├── hud.hpp/cpp           # In-game HUD (resources, time, alerts)
│   ├── build-panel.hpp/cpp   # Building selection panel
│   ├── placement.hpp/cpp     # Building placement with grid snapping
│   ├── reports.hpp/cpp       # Report screens (production, population, logistics)
│   ├── tutorial.hpp/cpp      # Tutorial overlay and step controller
│   └── dialogs.hpp/cpp       # Modal dialogs, confirmations, tooltips
│
├── audio/                    # Audio system
│   ├── audio-manager.hpp/cpp # SDL2-Mixer wrapper
│   ├── soundbank.hpp/cpp     # Sound effect catalog (277 WAVs)
│   ├── music-player.hpp/cpp  # Music playback (35 MIDIs)
│   └── voice.hpp/cpp         # Voice narration (FEM*.WAV)
│
└── video/                    # Cutscene system
    ├── video-player.hpp/cpp  # FLC/MP4 playback
    └── cutscene-manager.hpp/cpp # Trigger conditions and sequencing

assets/                       # Pipeline output (not in repo, user-generated)
├── hd/                       # HD upscaled textures (optional)
├── audio/                    # Converted OGG files
├── video/                    # Converted MP4 files
└── data/                     # YAML/JSON definitions from parsers

tools/                        # Asset pipeline tools
├── bmp-upscaler/             # Python: BMP → HD PNG via ESRGAN
├── flc-converter/            # Python + FFmpeg: FLC → MP4
├── wav-processor/            # Python + SoX: WAV → OGG
├── midi-renderer/            # Python + FluidSynth: MIDI → OGG
└── data-compiler/            # Python: Original binary → YAML/JSON

tests/
├── unit/                     # Unit tests per module
├── integration/              # Integration tests (simulation, rendering)
└── data/                     # Test data fixtures
```

---

## Phases & Execution Order

### Phase 0: Foundation & Asset Pipeline (Estimated: 3-4 weeks)

**Prerequisites**: None (this is the starting phase)

**Deliverables**:
1. CMake project scaffolding with C++20 and SDL2+OpenGL
2. Cross-platform build working on Windows, Linux, macOS
3. Window creation, input handling, frame loop at 60 FPS
4. Asset pipeline tools:
   - `bmp-upscaler`: Reads original 8-bit BMP, outputs 4x HD PNG with palette-preserving upscale
   - `flc-converter`: Batch converts 92 FLCs to H.264 MP4
   - `wav-processor`: Batch resamples 277 WAVs to 44.1kHz 16-bit OGG
   - `midi-renderer`: Renders 35 MIDIs to OGG via FluidSynth with selectable SoundFont
   - `data-compiler`: Parses BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS into JSON/YAML
5. `resource-archive.hpp/cpp` — loads RESOURCE.000 and extracts files at runtime
6. `config.hpp/cpp` — loads config.xml, detects asset directory
7. Basic `asset-manager.hpp/cpp` — loads textures, sounds, data files from disk

**Verification**: Game window opens at 1280×720, displays a test texture, responds to keyboard/mouse. All 14 files parsed from RESOURCE.000 on startup. Data compiler produces valid JSON for all 138 buildings.

---

### Phase 1: Rendering Engine & Multi-View System (Estimated: 4-5 weeks)

**Prerequisites**: Phase 0 complete

**Deliverables**:
1. OpenGL 3.3+ render core with shader-based sprite renderer
2. Texture loading from PNG (original BMPs converted at build time)
3. `terrain-view.hpp/cpp` — 3-view system:
   - Planet view: 480.BMP or HD equivalent, full-screen render
   - Site view: TILE1-6.BMP render based on star system terrain type
   - Tile view: Terrain + building sprites overlaid at grid positions
4. Smooth zoom transitions between views (interpolated, not discrete)
5. Building sprite atlas from original A/B BMPs with animation timing
6. `camera.hpp/cpp` — keyboard/mouse pan, zoom controls
7. Grid overlay rendering for building placement

**Verification**: Player can load a star system, see the planet view, zoom in to terrain detail, zoom further to tile view, pan the camera, see building sprites. 60 FPS at 1920×1080.

---

### Phase 2: Simulation Core (Estimated: 5-6 weeks)

**Prerequisites**: Phase 1 complete

**Deliverables**:
1. `colony.hpp/cpp` — complete colony state container with serialization
2. `pipeline.hpp/cpp` — 20-step SCI pipeline executor:
   - SCSysMsg, SCFillResources, SCPower, SCStarve, SCGenKids, SCMorale
   - SCMines, SCFactory, SCPop, SCTechLevel, SCPrereq, SCBldgOps
   - SCDisaster, SCAiInput, SCSave, SCLoad, SCDraw, SCSound, SCMenu, SCEndTurn
3. `building.hpp/cpp` — all 138 building types with state tracking
4. `resources.hpp/cpp` — 6 resource types (common metals, rare metals, food, energy, workers, scientists)
5. `population.hpp/cpp` — population growth/decline from original formula
6. `tech-tree.hpp/cpp` — 12-bit prereq mask resolution, 22 upgrade chains
7. `game-loop.hpp/cpp` — turn-based loop (ENTER key = advance turn) with optional real-time toggle
8. Data-driven building behavior from compiled BLDGBLD/BLDGOPS JSON

**Verification**: Start a new game, place SEED Lander, advance 10 turns. Resources produce/consume at correct rates. Building prerequisites gate correctly. Population grows. Save state to JSON and verify colony values match original expectations from the RE research (`analysis-deep.md`).

---

### Phase 3: Game Systems (Estimated: 6-8 weeks)

**Prerequisites**: Phase 2 complete

**Deliverables**:
1. Building placement UI with grid snapping, valid-placement highlighting, collision detection
2. Structure panel with category filtering and tech-level gating
3. `disaster.hpp/cpp` — all 6 disaster types with trigger conditions and colony effects
4. `ai-controller.hpp/cpp` — rebel colony AI from SCAiInput analysis
5. `tutor-ops.hpp/cpp` — TUTOR.OPS parser and executor (19 opcodes, 133 steps, 4 scenarios)
6. Tutorial overlay UI — step text, target highlighting, condition monitoring
7. All 15 star systems with terrain assignment, ore distribution, difficulty settings
8. Save/load system — binary format matching original .OPS structure, JSON for debugging
9. `audio-manager.hpp/cpp` — SDL2-Mixer wrapper, sound bank loading from OGG

**Verification**: Full game loop — pick any of 15 systems, place buildings through full tech tree, survive disasters, manage rebel colonies, save and reload. All 4 tutorial scenarios playable from start to end.

---

### Phase 4: UI & Polish (Estimated: 6-8 weeks)

**Prerequisites**: Phase 3 complete

**Deliverables**:
1. `main-menu.hpp/cpp` — New Game, Load Game, Tutorial, Options, Credits, Quit
2. `hud.hpp/cpp` — Resource bars, turn counter, alert feed, minimap
3. Building status tooltips with stats from original data
4. `reports.hpp/cpp` — Report screens:
   - Population report (workers, scientists, children, morale)
   - Production report (per-building input/output)
   - Logistics report (resource flows, storage, deficits)
   - Tech tree visualization
5. `build-panel.hpp/cpp` — scrollable building grid with category tabs, search
6. Keyboard shortcuts (WASD pan, ENTER turn, ESC cancel, number keys for levels)
7. `video-player.hpp/cpp` — FLC/MP4 playback at correct trigger points
8. `music-player.hpp/cpp` — ambient music per game phase
9. `voice.hpp/cpp` — tutorial narration (FEM*.WAV)
10. Options screen — resolution, audio volume, keybindings, difficulty

**Verification**: Complete playthrough from any star system to end-game tech level (LMonoTrain/RMonoTrain). All UI screens functional. Cutscenes trigger at correct events. Audio plays correctly. No crashes in 2-hour play session.

---

### Phase 5: Content Verification & Release (Estimated: 4-6 weeks)

**Prerequisites**: Phase 4 complete

**Deliverables**:
1. Balance pass — verify all building costs, production, prerequisites match original exactly
2. Full tutorial walkthrough — verify all 133 steps across 4 scenarios
3. Cross-platform testing — Windows (x64), Linux (x64), macOS (ARM + x64)
4. Performance optimization — ensure 60 FPS minimum
5. HD asset packaging guide — instructions for generating optional HD texture packs
6. Documentation:
   - `README.md` — build instructions, dependencies
   - `PlayerGuide.md` — how to play
   - Asset attribution (which files are from original CD, which are new)
7. GitHub release with CI pipeline

**Verification**: All 7 success criteria from spec.md pass. Game runs on all 3 platforms. Colonial simulation verified against original for first 50 turns.

---

## Dependencies & Execution Order

### Phase Dependencies

```
Phase 0: Foundation
    ↓
Phase 1: Rendering Engine
    ↓
Phase 2: Simulation Core
    ↓
Phase 3: Game Systems
    ↓
Phase 4: UI & Polish
    ↓
Phase 5: Content Verification & Release
```

### Parallel Opportunities

- Asset pipeline (Phase 0.3) can run independently as soon as the original CD is available — does not need the game project to exist
- Data compilation (Phase 0.4) is independent — JSON definitions can be authored and validated before the game engine is built
- Audio system (Phase 3 deliverable) can be developed in parallel with UI (Phase 4) once audio pipeline completes
- FLC conversion and cutscene triggering can be developed as a standalone module once Phase 1 rendering is proven

---

## Complexity Tracking

No Constitution Check violations. Complexity is inherent to building a game engine + content recreation from scratch and is justified by the goal of a faithful, modern, platform-independent remake.

| Complexity | Justification |
|------------|---------------|
| Custom rendering engine (not NAS2D) | Full control over multi-view zoom system; avoids inheriting OutpostHD's design constraints |
| 20-step SCI pipeline | Faithful simulation requires exact original execution order — no off-the-shelf system provides this |
| Custom binary format parsers | Original data formats are proprietary — our own RE work is the only specification |
| Separate asset pipeline tools | Decouples game development from asset processing; community members can contribute HD assets independently |
