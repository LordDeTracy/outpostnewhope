# Tasks: Outpost Remastered Implementation

**Branch**: `002-outpost-remastered` | **Date**: 2026-06-12 | **Total Tasks**: 46

---

## Dependency Flow

```
Phase 0 (Foundation)
  └── Phase 1 (Rendering) ──→ Phase 3.8 (Audio) ──→ Phase 4.10 (Music Player)
       └── Phase 2 (Simulation) ──→ Phase 3 (Game Systems) ──→ Phase 4 (UI) ──→ Phase 5 (Release)
```

---

# Phase 0: Foundation & Asset Pipeline

---

## Task 0.1: CMake Project Scaffolding

**Phase**: Foundation & Asset Pipeline
**Priority**: P1
**Depends On**: None
**Estimated Effort**: 3 days
**Files**: `CMakeLists.txt`, `cmake/FindSDL2.cmake`, `cmake/FindGLEW.cmake`, `cmake/FindSDL2_Image.cmake`, `cmake/FindSDL2_ttf.cmake`, `cmake/FindSDL2_mixer.cmake`, `src/main.cpp`, `.clang-format`, `.clang-tidy`

### Description
Create the CMake build system targeting C++20 with SDL2, OpenGL 3.3+, and all SDL2 satellite libraries. Must support Windows (MSVC), Linux (GCC/Clang), and macOS (Clang). Include vcpkg manifest for Windows and pkg-config fallback for Linux/macOS.

### Acceptance Criteria
- [ ] `cmake -B build -S .` succeeds on all 3 platforms
- [ ] `cmake --build build` produces a valid executable
- [ ] Executable runs and shows an SDL2 window at 1280x720
- [ ] OpenGL 3.3 core context is created and verified
- [ ] `-std=c++20` flag is set for all C++ sources
- [ ] `.clang-format` with Google-style formatting is present

### Technical Notes
- Use `target_compile_features` with `cxx_std_20` rather than setting CMAKE_CXX_STANDARD directly
- Use `FetchContent` for `nlohmann/json` (header-only)
- GLEW must be linked statically to avoid runtime DLL issues on Windows
- Include SDL2_ttf and SDL2_mixer even though unused until later phases
- Add `-Wall -Wextra -Wpedantic` for GCC/Clang, `/W4` for MSVC
- Verify OpenGL version: `glGetString(GL_VERSION)` must report >= 3.3

---

## Task 0.2: Window Creation + Input Handling + Frame Loop

**Phase**: Foundation & Asset Pipeline
**Priority**: P1
**Depends On**: 0.1
**Estimated Effort**: 2 days
**Files**: `src/core/engine.hpp`, `src/core/engine.cpp`, `src/ui/window.hpp`, `src/ui/window.cpp`, `src/main.cpp`

### Description
Implement the SDL2 window manager, event loop, and frame timing. Must handle keyboard (key down/up with repeat), mouse (move, click, wheel), window resize, and quit events. The frame loop must target 60 FPS with delta-time independence.

### Acceptance Criteria
- [ ] Window opens at 1280x720 with title "Outpost Remastered"
- [ ] Frame loop runs at 60 FPS (verified with SDL_GetTicks)
- [ ] ESC key triggers SDL_QUIT event
- [ ] Mouse motion, button clicks, wheel events are logged to console
- [ ] Window can be resized; viewport adjusts dynamically
- [ ] Fullscreen toggle via Alt+Enter
- [ ] Frame timing uses fixed timestep (16.67ms) with accumulator pattern

### Technical Notes
- Use `SDL_GL_SetAttribute` with `SDL_GL_CONTEXT_PROFILE_CORE` and version 3.3
- Frame accumulator pattern: cap at 5 frames to avoid spiral of death
- Decouple update rate from render rate
- Store key repeat state in `std::unordered_map<SDL_Keycode, bool>`
- `SDL_WINDOW_ALLOW_HIGHDPI` on macOS for Retina displays

---

## Task 0.3: Config System

**Phase**: Foundation & Asset Pipeline
**Priority**: P1
**Depends On**: 0.2
**Estimated Effort**: 1 day
**Files**: `src/core/config.hpp`, `src/core/config.cpp`, `assets/config-defaults.yaml`

### Description
Implement a config loader that reads config.yaml from the application directory or user data path. Stores: asset directory path, window resolution, fullscreen flag, audio volume, keybindings, and last-used save slot. On first launch, create a default config file.

### Acceptance Criteria
- [ ] Config file loads at startup; missing file creates defaults
- [ ] All settings have sensible default values
- [ ] Asset directory path is configurable and validated at startup
- [ ] Resolution setting affects window creation
- [ ] Config changes during runtime persist on save
- [ ] `Config::get<T>(key, default)` template works for int, float, bool, string

### Technical Notes
- Use `yaml-cpp` for parsing
- Store in platform-appropriate location: %APPDATA% (Windows), ~/.config/ (Linux), ~/Library/ (macOS)
- `std::filesystem::path` for all path handling
- First-launch: if config missing, prompt user for Outpost CD directory

---

## Task 0.4: AssetManager - RESOURCE.000 Loading + File Caching

**Phase**: Foundation & Asset Pipeline
**Priority**: P1
**Depends On**: 0.3
**Estimated Effort**: 3 days
**Files**: `src/core/asset-manager.hpp`, `src/core/asset-manager.cpp`, `src/core/resource-archive.hpp`, `src/core/resource-archive.cpp`, `src/core/types.hpp`

### Description
Build the runtime asset loading system. Must parse RESOURCE.000 (PKWare DCL IMPODE) to extract BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS, and OUTPOST.INI at startup. AssetManager provides a unified `get<T>(name)` API for textures, audio, data files, and videos with LRU caching and HD fallback priority.

### Acceptance Criteria
- [ ] RESOURCE.000 parsed successfully; all 15 files extracted in-memory
- [ ] AssetManager loads textures from original BMPs with PNG fallback
- [ ] HD textures in `assets/textures/hd/` take priority over originals
- [ ] Data files (JSON/YAML) loaded from `assets/data/`
- [ ] Missing asset falls back gracefully with a warning log
- [ ] Asset paths resolved without hardcoded strings
- [ ] LRU cache evicts least-recently-used textures (max 256 MB default)

### Technical Notes
- IMPODE algorithm in `contracts/archive-format.md`: 4KB sliding window, Huffman code tree
- Texture cache: wrap SDL_Texture* in shared_ptr with SDL_DestroyTexture custom deleter
- Type-erased cache via `std::unordered_map<std::string, std::any>`
- Resolution priority: hd/{name}.png > orig/{name}.png > source BMP

---

## Task 0.5: Data Compiler Python Tool

**Phase**: Foundation & Asset Pipeline
**Priority**: P1
**Depends On**: None (can run independently)
**Estimated Effort**: 3 days
**Files**: `tools/data-compiler/data-compiler.py`, `tools/data-compiler/requirements.txt`

### Description
Create the Python data compiler that decodes BLDGBLD.DAT and BLDGOPS.DAT through XOR-0x80 decoding, comma-delimited field splitting, and structured JSON output. Must parse all 138 building records (40 + 46 fields each) and merge them by index. Also decode TUTOR.OPS (19 dcbSC sections, 133 steps).

### Acceptance Criteria
- [ ] BLDGBLD.DAT parses to buildings.json with all 138 records, 40 fields each
- [ ] BLDGOPS.DAT parses to building-ops.json with all 138 records, 46 fields each
- [ ] TUTOR.OPS parses to tutorial.json with correct step ordering and opcode extraction
- [ ] XOR-0x80 decoding verified against Phase 001 RE reference
- [ ] JSON output matches reference hand-parsed records for first 5 buildings
- [ ] `--verify` flag cross-checks output against known field values
- [ ] Merge step produces single buildings.json combining both DAT sources

### Technical Notes
- XOR-0x80: iterate bytes, skip CRLF (0x0D 0x0A), XOR each non-CRLF byte with 0x80
- BLDGBLD[17..32] = 16-bit prereq mask (12 bits used), each 0/1 field = bit N; combine into uint16_t
- TUTOR.OPS: dcbSC marker (5 bytes), LE length (2 bytes), LE section type (2 bytes), body
- Use `argparse` for CLI, `json` module for output, `pathlib` for paths

---

## Task 0.6: BMP Processor Python Tool

**Phase**: Foundation & Asset Pipeline
**Priority**: P1
**Depends On**: None (can run independently)
**Estimated Effort**: 2 days
**Files**: `tools/bmp-upscaler/bmp-processor.py`, `tools/bmp-upscaler/requirements.txt`

### Description
Create the Python tool that converts all 339 original 8-bit DIB BMPs to PNG format. Must handle palette extraction (256-color), bottom-up row flipping, sRGB gamma conversion (HD path), and 4x nearest-neighbor or ESRGAN upscaling (optional). Non-HD output must be pixel-identical to original.

### Acceptance Criteria
- [ ] All 339 BMPs convert to valid PNGs with identical pixel content (non-HD path)
- [ ] Palette index 0 (black) preserved for runtime transparency keying
- [ ] Bottom-up rows correctly flipped to top-down
- [ ] HD path produces 4x resolution PNGs (nearest-neighbor; ESRGAN optional)
- [ ] Category-specific processing with `--category` flag
- [ ] Validation confirms file count and checksums
- [ ] Batch completes in under 2 minutes

### Technical Notes
- Validate BMP header: signature 0x4D42, bit depth 8, compression 0 (BI_RGB)
- PIL "P" mode reads palette; convert to "RGBA" for processing
- Non-HD path: skip gamma correction, preserve raw palette values
- HD path: apply sRGB transfer function and 4x nearest-neighbor
- Building sprites (500-579) have A/B variant pairs - keep separate files

---

## Task 0.7: FLC Converter Python Tool

**Phase**: Foundation & Asset Pipeline
**Priority**: P2
**Depends On**: None (can run independently)
**Estimated Effort**: 2 days
**Files**: `tools/flc-converter/flc-converter.py`, `tools/flc-converter/requirements.txt`

### Description
Create the Python tool that batch-converts all 92 Autodesk Animator FLC files to H.264 MP4 at 2x resolution using FFmpeg. Must handle the palettegen+paletteuse filter chain for accurate color reproduction.

### Acceptance Criteria
- [ ] All 92 FLC files convert to valid MP4 files with H.264 video
- [ ] Output resolution is 2x original (640x400 from 320x200)
- [ ] Palette-based dithering (bayer) for accurate color reproduction
- [ ] Frame rate matches source FLC frame timing
- [ ] `--crf`, `--preset`, `--scale` flags are configurable
- [ ] Clear error message if FFmpeg not found
- [ ] Output file count matches input file count

### Technical Notes
- FLC magic: 0xAF11, 0xAF12, or 0xAF44 at offset 0
- FFmpeg: palettegen+paletteuse filter chain with bayer dithering
- Use `--skip-existing` for incremental runs
- Generate events.json mapping FLC IDs to trigger events

---

## Task 0.8: WAV Processor Python Tool

**Phase**: Foundation & Asset Pipeline
**Priority**: P2
**Depends On**: None (can run independently)
**Estimated Effort**: 2 days
**Files**: `tools/wav-processor/wav-processor.py`, `tools/wav-processor/requirements.txt`

### Description
Create the Python tool that batch-converts all 277 WAV files from 22050 Hz 8-bit mono to 44100 Hz 16-bit OGG Vorbis using SoX. Must apply noise reduction for ambient files, high-pass filtering, and peak normalization.

### Acceptance Criteria
- [ ] All 141 FEM WAVs convert to OGG with correct duration (+-100ms)
- [ ] All 75 ADD WAVs convert with noise reduction applied
- [ ] All 53 SFX WAVs convert without noise reduction
- [ ] Sample rate is 44100 Hz, bit depth is 16-bit
- [ ] `--category` flag routes correct processing profile
- [ ] Output filenames preserve input naming (lowercased)
- [ ] Batch completes in under 5 minutes

### Technical Notes
- SoX pipeline: highpass 40 -> rate -v 44100 -> norm -1 -> compand
- ADD ambient: add noisered noise.prof 0.21 before resampling
- SFX: preserve original descriptive names like ALARM.WAV -> alarm.ogg
- OGG quality level 5 (~132 kbps VBR): `-C 5`

---

## Task 0.9: MIDI Renderer Python Tool

**Phase**: Foundation & Asset Pipeline
**Priority**: P2
**Depends On**: None (can run independently)
**Estimated Effort**: 2 days
**Files**: `tools/midi-renderer/midi-renderer.py`, `tools/midi-renderer/requirements.txt`

### Description
Create the Python tool that renders all 35 MIDI files to OGG Vorbis via FluidSynth with selectable SoundFont. Must support MT-32 emulation for MARS.MID (uses MT-32 sysex). Handles all 4 MARS.MID variants.

### Acceptance Criteria
- [ ] All MIDI files render to OGG Vorbis at 44100 Hz 16-bit stereo
- [ ] FluidSynth with FluidR3_GM.sf2 produces audible, correct output
- [ ] MT-32 emulation for MARS.MID with correct instrument mapping
- [ ] Fallback to GM SoundFont if MT-32 ROM unavailable
- [ ] Gain configurable via `--gain` flag
- [ ] Output filenames use `_music` suffix
- [ ] Batch completes in under 10 minutes

### Technical Notes
- FluidSynth offline: `fluidsynth -ni soundfont.sf2 input.mid -F output_temp.wav` then SoX encode
- MT-32: `fluidsynth -ni mt32rom.sf2 MARS.MID -F output.wav`
- SoundFont: FluidR3_GM.sf2 v2 (~140 MB) recommended
- Polyphony: `-o synth.polyphony=64`

---

## Task 0.10: Asset Verification Python Tool

**Phase**: Foundation & Asset Pipeline
**Priority**: P2
**Depends On**: 0.5, 0.6, 0.7, 0.8, 0.9
**Estimated Effort**: 2 days
**Files**: `tools/verify-assets/verify.py`, `tools/verify-assets/requirements.txt`

### Description
Create the Python verification tool that audits the entire asset pipeline output. Checks file counts, JSON schemas, checksums, audio durations, and cross-references.

### Acceptance Criteria
- [ ] Reports file count for all categories (339 textures, 92 videos, 301 audio, 5+ data files)
- [ ] JSON schema validation for all data files
- [ ] Texture checksum: output PNG matches source BMP (non-HD path)
- [ ] Audio duration: OGG matches source WAV within 100ms
- [ ] Building reference: all IDs in tech-tree exist in buildings.json
- [ ] Star system: all 15 present with unique terrain types
- [ ] Exit code 0 on success, 1 on failure with detailed report

### Technical Notes
- PIL.Image.verify() for PNG validity; numpy for checksum comparison
- Audio: `sox --i -D` for duration
- Produce assets/manifest.json with per-file SHA-256

---
# Phase 1: Rendering Engine & Multi-View System

---

## Task 1.1: OpenGL 3.3 Render Core

**Phase**: Rendering Engine & Multi-View System
**Priority**: P1
**Depends On**: 0.2
**Estimated Effort**: 4 days
**Files**: `src/render/renderer.hpp`, `src/render/renderer.cpp`, `src/render/shaders/quad.vert`, `src/render/shaders/quad.frag`

### Description
Implement the OpenGL 3.3 core rendering engine. Must set up a core profile context, compile shaders (vertex + fragment for 2D sprite rendering), create VAO/VBO/EBO for a fullscreen quad, and provide a batched sprite rendering API.

### Acceptance Criteria
- [ ] OpenGL 3.3 core context created successfully
- [ ] Quad vertex + fragment shader compile and link without errors
- [ ] Fullscreen colored quad renders as test
- [ ] `Renderer::drawSprite(texture, x, y, w, h)` works
- [ ] Sprite batching: 100+ sprites in a single draw call
- [ ] Clear color configurable; default black
- [ ] Blend mode supports alpha transparency

### Technical Notes
- Core profile: no glBegin/glEnd -- everything is VAO + VBO + shaders
- Use GLEW for extension loading; call glewInit() after SDL_GL_MakeCurrent
- Vertex shader: vec2 position, vec2 texcoord attributes
- Fragment shader: sample sampler2D, multiply by vec4 color uniform
- Sprite batch: pack vertices into single VBO, draw instanced
- Store shader source as const char* in .cpp files (embedded)

---

## Task 1.2: Texture Loading and Sprite Rendering

**Phase**: Rendering Engine & Multi-View System
**Priority**: P1
**Depends On**: 1.1, 0.4
**Estimated Effort**: 2 days
**Files**: `src/render/texture.hpp`, `src/render/texture.cpp`, `src/render/sprite.hpp`, `src/render/sprite.cpp`

### Description
Build the texture loading system on top of SDL2-Image and the sprite rendering layer. Textures load from PNG/BMP via IMG_LoadTexture and are cached. Sprites are textured quads with position, scale, rotation, and color modulation.

### Acceptance Criteria
- [ ] Texture loads from PNG (RGBA) and displays correctly
- [ ] Texture loads from BMP (RGB) with transparency key (pure black = transparent)
- [ ] Sprite can be positioned, scaled, and rotated
- [ ] Sprite color modulation (tinting) works
- [ ] Texture cache returns existing texture for repeated loads
- [ ] TextureManager::load(path) resolves via AssetManager priority chain
- [ ] Sprite atlasing: sub-rect regions render correctly

### Technical Notes
- IMG_LoadTexture returns SDL_Texture*; wrap in RAII with SDL_DestroyTexture
- Use SDL_SetTextureBlendMode for alpha support
- Transparency: palette index 0 = RGB(0,0,0); use SDL_SetColorKey
- HD textures: scale sprite coordinates by 0.25 for 4x resolution

---

## Task 1.3: TerrainView - Planet View

**Phase**: Rendering Engine & Multi-View System
**Priority**: P1
**Depends On**: 1.2
**Estimated Effort**: 2 days
**Files**: `src/render/terrain-view.hpp`, `src/render/terrain-view.cpp`

### Description
Implement the planet view (zoom level 0) -- renders 480.BMP (or HD variant) as the planet surface. The viewport shows the full 640x480 image scaled to fit. Site selection markers at 15 landing zone positions. Clicking a site dot selects it and transitions to site view.

### Acceptance Criteria
- [ ] 480.BMP renders full-screen at planet zoom level
- [ ] 15 site selection dots render at correct positions
- [ ] Site dots highlight on mouse hover
- [ ] Clicking site dot triggers selection callback
- [ ] HD variant renders at full resolution if present
- [ ] Fallback to original BMP if HD unavailable
- [ ] 60 FPS with no visible tearing

### Technical Notes
- 480.BMP is 640x480; scale to viewport height, center horizontally
- Site dot positions from RE data: `sitePositions[15]`
- Use ViewState enum: Planet, Site, Tile
- Selection: store target site ID, smooth lerp zoom over 500ms

---

## Task 1.4: TerrainView - Site View

**Phase**: Rendering Engine & Multi-View System
**Priority**: P1
**Depends On**: 1.2
**Estimated Effort**: 2 days
**Files**: `src/render/terrain-view.hpp`, `src/render/terrain-view.cpp`

### Description
Implement the site view (zoom level 1) -- renders the correct TILE{1-6}.BMP based on star system terrain type. The terrain bitmap (640x480) fills the viewport. Primary colony management view. Building sprites overlaid on terrain.

### Acceptance Criteria
- [ ] Correct TILE*.BMP renders for each terrain type (1-6)
- [ ] Terrain renders at 1:1 pixel scale in viewport
- [ ] TILE4 variants (TILE4, TILE4A, TILE4B) -- base loads by default
- [ ] TILE5 variants (TILE5, TILE5A, TILE5B) -- base loads by default
- [ ] Grid overlay (2x3) renders when toggled for placement mode
- [ ] Transition from planet view animates smoothly (~500ms)
- [ ] All 10 tile surface files in asset catalog

### Technical Notes
- Terrain type maps to star system: 15 systems, each has terrainType (1-6)
- Grid: 2 columns x 3 rows, each cell ~300x150 pixels
- Grid overlay: white lines at 30% alpha

---

## Task 1.5: TerrainView - Tile View

**Phase**: Rendering Engine & Multi-View System
**Priority**: P1
**Depends On**: 1.2, 1.4
**Estimated Effort**: 3 days
**Files**: `src/render/terrain-view.hpp`, `src/render/terrain-view.cpp`

### Description
Implement the tile view (zoom level 2) -- 2x zoomed terrain with building sprite overlays. Camera centers on selected grid cell. Building sprites (500-579) render at grid positions with A/B animation. Health bars, status indicators, and building names in overlay.

### Acceptance Criteria
- [ ] View zooms to 2x around selected grid cell
- [ ] Building sprite at correct grid position
- [ ] A/B animation cycles at 100ms for animated buildings
- [ ] Health bar (green->yellow->red) above damaged buildings
- [ ] Building name label below sprite
- [ ] Status icon for powered-down, under-construction, destroyed
- [ ] Non-animated buildings render single frame statically

### Technical Notes
- Camera center: worldPos = { gridCol * 300 + 150, gridRow * 150 + 75 }
- A/B animation: only buildings with A-variant sprite file animate
- Frame interval: 100ms, toggle between frame A (base) and B (A-suffixed)
- Sprite mapping: use spriteBaseId from definition; fallback 500 + buildingIndex

---

## Task 1.6: Smooth Zoom Transitions

**Phase**: Rendering Engine & Multi-View System
**Priority**: P2
**Depends On**: 1.3, 1.4, 1.5
**Estimated Effort**: 2 days
**Files**: `src/render/terrain-view.hpp`, `src/render/terrain-view.cpp`, `src/render/camera.hpp`, `src/render/camera.cpp`

### Description
Implement smooth zoom interpolation between the 3 view levels. Zoom is a continuous float from 0.25 (planet) to 2.0 (tile) with easing. Mouse wheel, keyboard shortcuts, and UI buttons trigger transitions. Correct bitmaps cross-fade at thresholds.

### Acceptance Criteria
- [ ] Zoom transitions smoothly over ~500ms between levels
- [ ] Mouse wheel zooms proportionally to current level
- [ ] At planet/site threshold (~0.35x), 480.BMP fades out as TILE*.BMP fades in
- [ ] At site/tile threshold (~1.5x), TILE reaches full scale, sprites appear
- [ ] No visual pop during transitions
- [ ] Zoom target follows cursor (zoom toward mouse pointer)
- [ ] Z = zoom in, X = zoom out

### Technical Notes
- Use std::chrono::steady_clock for timing
- Easing: easeInOutQuad
- Cross-fade alpha: smoothstep(threshold - 0.05, threshold + 0.05, zoom)
- Zoom toward mouse: compute world-space cursor, adjust camera offset
- Clamp zoom to [0.25, 2.0]

---

## Task 1.7: Camera System

**Phase**: Rendering Engine & Multi-View System
**Priority**: P2
**Depends On**: 1.6
**Estimated Effort**: 2 days
**Files**: `src/render/camera.hpp`, `src/render/camera.cpp`

### Description
Implement the camera system with pan and zoom controls. WASD keys pan at speed proportional to zoom. Middle-mouse drag pans. Camera has world-space coordinates and viewport transform. Pan bounds clamp to terrain extents.

### Acceptance Criteria
- [ ] WASD keys pan at speed proportional to zoom level
- [ ] Middle-mouse drag pans smoothly
- [ ] Arrow keys also pan (same as WASD)
- [ ] Pan clamped to terrain bounds at site/tile views
- [ ] Planet view disables panning
- [ ] Camera state integrates with terrain-view pipeline
- [ ] Viewport to world coordinate conversion functions work

### Technical Notes
- Camera struct: { float worldX, worldY; float zoom; int viewportW, viewportH; }
- Pan speed: 300.0f / zoom * deltaTime
- World-to-screen: screenX = (worldX - camera.worldX) * zoom + viewportW/2
- Screen-to-world: worldX = (screenX - viewportW/2) / zoom + camera.worldX
- Camera::lookAt(worldX, worldY) for programmatic movement

---

## Task 1.8: Building Sprite Atlas + A/B Animation

**Phase**: Rendering Engine & Multi-View System
**Priority**: P2
**Depends On**: 1.2
**Estimated Effort**: 3 days
**Files**: `src/render/animation.hpp`, `src/render/animation.cpp`, `src/render/sprite.hpp`, `src/render/sprite.cpp`

### Description
Build the sprite atlas system packing all building sprites (500-579 + 500A-579A) into a single texture. Implement A/B animation controller cycling at 100ms. Handle: looping (A/B toggle), single-frame (static), and per-building timing config.

### Acceptance Criteria
- [ ] Building sprites packed into single atlas texture (<=4096x4096)
- [ ] Atlas metadata JSON loaded at startup defining sub-rect regions
- [ ] A/B animation cycles at 100ms for animated buildings
- [ ] Non-animated buildings render their single frame
- [ ] Animation timing overridable per-building from definition data
- [ ] Atlas packing handles 300x150 and smaller sprites
- [ ] Atlas rendering matches individual texture quality

### Technical Notes
- Atlas generated at build time by BMP processor (--atlas flag)
- Atlas metadata: { "atlasFile": "buildings.png", "frames": [{ "id": "500a", ... }] }
- Animation controller: 100ms timer via SDL_AddTimer or SDL_GetTicks
- A/B detection: hasAnimation field or both {id}.png and {id}A.png exist
- Fallback: individual sprites if atlas missing

---
# Phase 2: Simulation Core

---

## Task 2.1: ColonyState Container

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 0.5, 1.2
**Estimated Effort**: 3 days
**Files**: `src/simulation/colony.hpp`, `src/simulation/colony.cpp`

### Description
Implement the ColonyState container -- the single mutable snapshot of a colony. Holds: 6 resource pools, building instances, population breakdown, morale, tech state, construction/production/research queues, event log, and game flags. Helper methods for building queries and serialization.

### Acceptance Criteria
- [ ] 6 ResourcePool entries with current/capacity/produced/consumed tracking
- [ ] BuildingInstance stores all fields from data model
- [ ] `buildingsOfType(buildingCategory)` returns matching instances
- [ ] `hasOperationalBuilding(index)` and `countOperational(index)` work
- [ ] Construction, production, research queues are functional
- [ ] EventType enum includes all 16 event types
- [ ] GameEvent log supports max 100 entries (FIFO)
- [ ] ColonyState initializes from star system definition

### Technical Notes
- ColonyState is a plain struct, value semantics, movable
- BuildingDefinition references are pointers to static BuildingCatalog singleton
- ResourcePool formulas from data-model.md
- Use std::array<ResourcePool, 6> for fixed-size pools
- Tech state: uint16_t techMask with 12 active bits

---

## Task 2.2: SimulationPipeline Orchestrator

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 2.1
**Estimated Effort**: 2 days
**Files**: `src/simulation/pipeline.hpp`, `src/simulation/pipeline.cpp`

### Description
Implement the SimulationPipeline orchestrator managing the 20-step SCI simulation. Supports step registration, ordered execution, pre/post validation, RNG management, and turn result reporting.

### Acceptance Criteria
- [ ] 20 steps execute in correct order (1->20) every turn
- [ ] Steps registerable with arbitrary priority for testing
- [ ] Pre-execution validation checks colony state invariants
- [ ] Post-execution confirms no corrupted state
- [ ] TurnResult aggregates resource deltas, events, and messages
- [ ] RNG seeded deterministically from turn-specific seed
- [ ] Same input produces identical output (deterministic)

### Technical Notes
- ISimulationStep interface: { name(), priority(), execute(ColonyState&, const SimulationContext&) -> ExecutionResult }
- Steps stored in vector<unique_ptr<ISimulationStep>>, sorted by priority
- RNG: mt19937 seeded with ctx.randomSeed ^ (ctx.turnNumber * 0x9E3779B97F4A7C15)
- TurnResult captures before/after resource snapshots

---

## Task 2.3: Steps 01-05 - PrelimAlloc, SysMsg, FillResources, Power, Starve

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 2.2
**Estimated Effort**: 4 days
**Files**: `src/simulation/pipeline.cpp`

### Description
Implement first 5 simulation steps. SCPrelimAlloc pre-allocates worker slots. SCPop splits population into worker/scientist/child categories. SCFillResources distributes colony resources to building input buffers. SCPower computes power grid balance. SCStarve computes food deficit deaths.

### Acceptance Criteria
- [ ] PrelimAlloc: workers reserved for construction queue based on staffingTier
- [ ] Pop: population splits 60% workers / 20% scientists / 20% children
- [ ] Pop: emigration at morale < 15 with 5% loss per turn
- [ ] FillResources: distribution in priority order (food > manufacturing > research)
- [ ] Power: total vs consumption computed; deficit triggers priority power-down
- [ ] Starve: food < pop reduces population by deficit; generates event
- [ ] Starve: population reaches 0 marks colony dead

### Technical Notes
- Staffing tier: 0=0, 1=5, 2=10, 3=20, 4=40 workers
- Power-down priority: UGRec > UGCommercial > Lab > Fact > UGResident (never)
- Tokamak output: 50 base, Tokamak2: 100 base, Solar: 10 base
- Starvation: children die first, then workers, then scientists

---

## Task 2.4: Steps 06-10 - GenKids, Morale, Mines, Factory, TechLevel

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 2.2
**Estimated Effort**: 4 days
**Files**: `src/simulation/pipeline.cpp`

### Description
Implement steps 06-10. SCGenKids computes births. SCMorale computes happiness (0-100). SCMines processes mine output with depletion. SCFactory handles conversion production. SCAddSpew processes refinery ore conversion.

### Acceptance Criteria
- [ ] GenKids: birth rate = 2% base + 3% food surplus + 2% UGResident + 1% UGMed + 1% UGRec
- [ ] GenKids: minimum 1 birth per turn
- [ ] Morale: base 50 with all modifiers from data model
- [ ] Mines: DisMine 4 base, ActiveMine 8 base; staff multiplier; power multiplier
- [ ] Mines: 2% DisMine / 5% ActiveMine depletion probability
- [ ] Factory: consumes Common+Rare metals, produces goods
- [ ] AddSpew: consumes 3 Common + 1 Rare, produces 2 processed materials

### Technical Notes
- Mine output: base * (1 + workers/10) * (isPowered ? 2 : 1), split 75/25 common/rare
- Factory recipes: Fact* (1 Common + 1 Rare) -> 2 Goods; Nano (3 Rare) -> 1 Nanite
- AddSpew efficiency: Spew2 -25% input, Spew3 -50% (needs validation)

---

## Task 2.5: Steps 11-15 - Prereq, BldgOps, Disaster, AiInput, EndSim

**Phase**: Simulation Core
**Priority**: P2
**Depends On**: 2.2
**Estimated Effort**: 4 days
**Files**: `src/simulation/pipeline.cpp`, `src/simulation/disaster.hpp`, `src/simulation/disaster.cpp`

### Description
Implement steps 11-15. SCConstruct advances construction. SCPutBldg processes placement queue. SCEvent rolls random disasters. SCKillBldg removes destroyed buildings. SCAiInput evaluates AI colony. SCEndSim finalizes turn.

### Acceptance Criteria
- [ ] Construct: first turn deducts cost; subsequent turns increment progress
- [ ] Construct: insufficient resources stall without penalty
- [ ] PutBldg: validates prereq mask, grid occupancy, creates instance
- [ ] Event: 5% base disaster probability; 5-15 turn cooldown
- [ ] Event: plague, meteor, earthquake, fire, meltdown with weighted probabilities
- [ ] KillBldg: sets destroyed state, generates event
- [ ] AiInput: skips player colonies; evaluates AI needs
- [ ] EndSim: increments turn, applies storage limits, checks game-over

### Technical Notes
- Cost lookup table (tier -> actual costs) needs validation from original EXE
- Disaster probability: 5 + (turnCount/50) + (population/100) scaled by difficulty
- Event weights: Plague:30, Meteor:25, Earthquake:20, Fire:15, Meltdown:10
- Meltdown requires HotLab (index 126) operational

---

## Task 2.6: Steps 16-20 - Save, Load, Draw, Sound, Menu

**Phase**: Simulation Core
**Priority**: P3
**Depends On**: 2.2
**Estimated Effort**: 2 days
**Files**: `src/simulation/pipeline.cpp`

### Description
Implement steps 16-20. SCProdSched advances production queue. SCRchSched advances research queue and unlocks tech bits. SCSelect syncs UI selection. SCMove processes unit movement. Final turn finalization.

### Acceptance Criteria
- [ ] ProdSched: consumes inputStock, produces outputStock; completed orders removed
- [ ] RchSched: Lab = 5/turn, HotLab = 10, UGUniv = 3; progress accumulates
- [ ] RchSched: progress >= cost unlocks tech bit, dequeues order
- [ ] Select: destroyed buildings removed; completed refreshed; new added
- [ ] Move: units move 1 cell per turn toward target
- [ ] EndSim: victory/defeat conditions checked

### Technical Notes
- Research cost placeholder: 100 + (techBit * 50) -- needs validation
- Move pathfinding: greedy Manhattan-distance toward target
- Victory: all 12 tech bits OR population >= 1000 with full amenities
- Defeat: population = 0 OR SpacePort destroyed + no active construction

---

## Task 2.7: Resource Tracking (6 Types)

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 2.1
**Estimated Effort**: 2 days
**Files**: `src/simulation/resources.hpp`, `src/simulation/resources.cpp`

### Description
Implement resource tracking for all 6 types: CommonMetals, RareMetals, Food, Energy, Population, Research. Each has current/capacity/produced/consumed. Storage limits from Warehouse/Storage buildings. Overflow discarded at end of turn.

### Acceptance Criteria
- [ ] All 6 resources track current, capacity, produced, consumed per turn
- [ ] Storage building = +200 capacity to all pools
- [ ] Warehouse = +100 to Common/Rare Metals
- [ ] Overflow capped: current = min(current, capacity) at endSim
- [ ] Resource deltas reported in TurnResult
- [ ] Negative resources clamped to 0
- [ ] Population has unlimited capacity

### Technical Notes
- Base capacities: Common 100, Rare 50, Food 200, Energy 500, Pop unlimited, Research 0
- Research resets after each unlock (non-cumulative)
- Energy has reserve field for battery bank storage
- Produced/consumed reset each turn in PrelimAlloc

---

## Task 2.8: Population + Morale System

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 2.1
**Estimated Effort**: 2 days
**Files**: `src/simulation/population.hpp`, `src/simulation/population.cpp`

### Description
Implement population system: total pop splits into workers/scientists/children based on facilities. Morale (0-100) drives growth, emigration, productivity. Housing capacity caps growth.

### Acceptance Criteria
- [ ] Population split: 60% workers, 20% scientists, 20% children (base)
- [ ] Housing capacity from UGResident caps growth
- [ ] UGResident capacity: tier 1 = 50, tier 2 = 75, tier 3 = 100
- [ ] UGMed +1 birth rate; UGRec +1 birth rate
- [ ] Morale 0-100 with modifiers from food, power, amenities, disasters
- [ ] Emigration at morale < 15: 5% of population leaves per turn
- [ ] Growth from births minus deaths minus emigration

### Technical Notes
- Housing: basePerResident = 50 * (upgradeLevel + 1)
- Population breakdown computed fresh each turn by SCPop
- 12 morale factors in the morale mask (see save-format.md Section 0x03)

---

## Task 2.9: Tech Tree with 12-Bit Prereq Mask

**Phase**: Simulation Core
**Priority**: P2
**Depends On**: 2.1, 0.5
**Estimated Effort**: 2 days
**Files**: `src/simulation/tech-tree.hpp`, `src/simulation/tech-tree.cpp`

### Description
Implement the tech tree system. The 12-bit prereq mask is a cumulative checkpoint -- when a building EXISTS, its tech bit is set. A building is buildable if all required bits are set in techMask. Includes 22 upgrade chains.

### Acceptance Criteria
- [ ] Mask resolution: (techMask & prereqMask) == prereqMask
- [ ] TechMask updates when building completes construction
- [ ] 12-bit mask covers building indices 15-26 (bit N = index N+15)
- [ ] 22 upgrade chains loaded from building definitions JSON
- [ ] Tech level name changes as bits unlock
- [ ] Queryable: what's buildable, what's next, what's required
- [ ] Operational prereq mask (14-bit) gates building operation

### Technical Notes
- SpacePort (index 0) always buildable (sentinel)
- Some buildings intentionally omit bits (MassDrv mask 111111111010)
- Operational prereq: requires buildings OPERATIONAL (staffed+powered)
- Upgrade chains grouped by buildingCategory, sorted by tier

---

## Task 2.10: Turn-Based Game Loop

**Phase**: Simulation Core
**Priority**: P1
**Depends On**: 2.2
**Estimated Effort**: 2 days
**Files**: `src/simulation/game-loop.hpp`, `src/simulation/game-loop.cpp`

### Description
Implement the game loop orchestrator. Turn-based: ENTER advances one turn through the pipeline. Real-time toggle: turns auto-advance at configurable interval. Integrates with frame update cycle, emits state-change signals for UI.

### Acceptance Criteria
- [ ] ENTER key triggers one complete turn (all 20 steps)
- [ ] Real-time toggle (F5) switches between modes
- [ ] Real-time interval configurable (default 5000ms, range 1000-30000ms)
- [ ] Turn transition shows indicator
- [ ] State-change signals for UI consumption
- [ ] Game loop independent of frame rate
- [ ] Pauses when menus/dialogs open

### Technical Notes
- Game loop states: Menu, Playing, Paused, Tutorial, Cutscene
- State machine in GameLoop::update(deltaTime)
- Signals: std::function callback list or event bus
- Real-time: accumulate deltaTime; trigger turn when exceeding interval
- Auto-save: every 5th turn in real-time mode

---
# Phase 3: Game Systems

---

## Task 3.1: Building Placement UI

**Phase**: Game Systems
**Priority**: P1
**Depends On**: 1.5, 2.5
**Estimated Effort**: 3 days
**Files**: `src/ui/placement.hpp`, `src/ui/placement.cpp`, `src/ui/build-panel.hpp`, `src/ui/build-panel.cpp`

### Description
Implement the building placement system. Player selects building from panel, clicks terrain to place. Grid snapping aligns ghost to cells. Validity check: green (valid) or red (invalid). Right-click or ESC cancels.

### Acceptance Criteria
- [ ] Building ghost follows cursor, snapped to nearest grid cell
- [ ] Valid: green highlight; invalid: red with reason tooltip
- [ ] Occupied cells marked invalid
- [ ] Prereq mask checked before placement
- [ ] Right-click/ESC cancels placement mode
- [ ] Placed building added to placement queue
- [ ] Grid visible during placement mode (2x3)

### Technical Notes
- Grid: 2 columns x 3 rows, cell ~300x150 world units
- screenToGrid() and gridToScreen() from Camera system
- Ghost: 50% alpha at cursor grid position
- Multi-tile: building def has width/height; check all cells

---

## Task 3.2: Structure Panel

**Phase**: Game Systems
**Priority**: P2
**Depends On**: 3.1
**Estimated Effort**: 3 days
**Files**: `src/ui/build-panel.hpp`, `src/ui/build-panel.cpp`

### Description
Implement the structure panel -- scrollable building grid with category tabs. Tech-gated buildings greyed out. Tooltip on hover shows name, cost, prerequisites, production, maintenance.

### Acceptance Criteria
- [ ] Category tabs (7 categories) filter the list
- [ ] All 138 building types in correct categories
- [ ] Tech-gated buildings greyed with prerequisite text
- [ ] Tooltip: name, cost, build time, production, maintenance, prereqs
- [ ] Search text box filters by name substring
- [ ] Tab has count badge for available buildings
- [ ] Panel scrolls with mouse wheel + scrollbar

### Technical Notes
- Categories from BLDGBLD field 39 (0-10)
- Tooltip: SDL2-Ttf on semi-transparent background near cursor
- Greyed: 30% alpha, show "Requires: [prereqs]"
- Tech gate: techTree.canBuild(colony.techMask, buildingDef.prereqMask)

---

## Task 3.3: Disaster System

**Phase**: Game Systems
**Priority**: P2
**Depends On**: 2.5
**Estimated Effort**: 3 days
**Files**: `src/simulation/disaster.hpp`, `src/simulation/disaster.cpp`

### Description
Implement the 6 disaster types: Fire, Earthquake, Plague, Meteor, Meltdown (HotLab), Tornado. Each has unique trigger conditions, probability scaling, effects, and visual indicators.

### Acceptance Criteria
- [ ] Fire: destroys 1 building, 25% spread to adjacent
- [ ] Earthquake: destroys 1-3 random buildings
- [ ] Plague: reduces population by 10%
- [ ] Meteor: destroys 1 building, leaves rubble
- [ ] Meltdown: destroys HotLab, damages nearby buildings
- [ ] Tornado: destroys buildings in a line path
- [ ] Each generates event log entry and UI alert
- [ ] Cooldown prevents consecutive disasters

### Technical Notes
- Disaster probability scales with turn count and colony size
- Effects applied during SCEvent (step 13)
- Rubble state: grid cell blocked until cleared
- Meltdown requires HotLab (index 126) operational
- Visual: screen shake, flash effect

---

## Task 3.4: Rebel Colony AI

**Phase**: Game Systems
**Priority**: P2
**Depends On**: 2.5
**Estimated Effort**: 4 days
**Files**: `src/simulation/ai-controller.hpp`, `src/simulation/ai-controller.cpp`

### Description
Implement the rebel colony AI from SCAiInput analysis. AI evaluates resource needs, defense, population, and research priorities based on personality weights. Issues building placement and move orders. Difficulty scaling modifies thresholds.

### Acceptance Criteria
- [ ] AI evaluates 4 need categories: resource, defense, housing, research
- [ ] Personality weights differ per type (Aggressive, Balanced, Defensive)
- [ ] Difficulty modifies AI resource bonuses and decision speed
- [ ] AI issues PendingBuilding entries to placement queue
- [ ] AI maintains its own ColonyState
- [ ] AI building choices use same prereq validation as player
- [ ] AI responds to disasters with repair priorities

### Technical Notes
- AI colony is a separate ColonyState managed by the pipeline
- AI runs during SCAiInput (step 15)
- Personality: Aggressive (defense 35%), Balanced (production 30%), Defensive (population 35%)
- Difficulty: Easy=no bonus, Medium=+20% resources, Hard=+50% + faster construction

---

## Task 3.5: Tutorial Engine

**Phase**: Game Systems
**Priority**: P3
**Depends On**: 2.1, 0.5
**Estimated Effort**: 4 days
**Files**: `src/data/tutor-ops.hpp`, `src/data/tutor-ops.cpp`, `src/ui/tutorial.hpp`, `src/ui/tutorial.cpp`

### Description
Implement the tutorial engine that parses and executes TUTOR.OPS bytecode (19 opcodes, 133 steps, 4 scenarios). Must interpret all opcodes and maintain step state. Tutorial overlay UI shows step text with target highlighting.

### Acceptance Criteria
- [ ] All 19 TUTOR.OPS opcodes recognized and handled
- [ ] All 4 scenarios load from parsed tutorial.json
- [ ] Tutorial dialog text displays in overlay with original styling
- [ ] Target building/UI element highlights when required
- [ ] Step advances when player completes required action
- [ ] Timeout advances step automatically if configured
- [ ] Tutorial can be skipped/restarted at any time

### Technical Notes
- TUTOR.OPS has dcbSC section structure with opcode-based steps
- Opcodes 00 03-00 08 are the main instruction types (from RE)
- Step conditions: building placed, turn threshold, resource level, operational
- Dialog: overlay with semi-transparent background, centered text
- Target highlight: colored border pulse animation

---

## Task 3.6: 15 Star Systems

**Phase**: Game Systems
**Priority**: P2
**Depends On**: 2.1
**Estimated Effort**: 2 days
**Files**: `src/data/star-systems.hpp`, `src/data/star-systems.cpp`, `assets/data/star-systems.yaml`

### Description
Implement all 15 star systems with unique terrain assignments, ore distribution, difficulty settings, and starting conditions. Each is a config entity loaded from star-systems.yaml.

### Acceptance Criteria
- [ ] All 15 systems defined with names matching original
- [ ] Each has unique terrain type (1-6) and difficulty (1-5)
- [ ] Ore distribution: common/rare metal surface vs underground ratios
- [ ] Starting resources per system match original values
- [ ] Star system selectable from New Game screen
- [ ] Tutorial flag marks tutorial-capable systems
- [ ] System descriptions loaded from data file

### Technical Notes
- Hand-authored from Phase 001 RE findings (hardcoded in original EXE)
- Starting conditions: resources, buildings already placed, turn number
- Difficulty affects starting resources and disaster frequency
- 4 tutorial systems: Aphrodite, Anonymous Bosch, Sigma Draconis, Vulcan's Forge

---

## Task 3.7: Binary Save/Load

**Phase**: Game Systems
**Priority**: P3
**Depends On**: 2.1
**Estimated Effort**: 4 days
**Files**: `src/simulation/save-manager.hpp`, `src/simulation/save-manager.cpp`

### Description
Implement save/load system per save-format.md contract. Binary format (.ops) with OPSM header, dcb section markers, CRC-16 checksum. JSON format (.ops.json) for debugging. Full round-trip fidelity.

### Acceptance Criteria
- [ ] Binary save file with correct OPSM magic and 8 sections
- [ ] CRC-16 checksum calculated and verified on load
- [ ] All sections (0x01-0x08) serialize/deserialize correctly
- [ ] JSON save format matches binary content
- [ ] Round-trip: save then load produces identical colony state
- [ ] Missing/corrupted sections handled with defaults
- [ ] Save naming: Outpost_System_TurnNNNN_timestamp.ops
- [ ] Quick-save, auto-backup, and 9 manual slots functional

### Technical Notes
- Binary format per save-format.md: OPSM header, sections 0x01-0x08, CRC-16/CCITT
- Manual byte packing (no memcpy of structs -- ABI concerns)
- JSON: nlohmann/json for parsing
- Forward compatibility: unknown sections preserved on round-trip
- Save dirs: Quicksave.ops + SaveSlot01-09 + manual/ + autobackup/ + debug/

---

## Task 3.8: Audio Manager

**Phase**: Game Systems
**Priority**: P2
**Depends On**: 0.2
**Estimated Effort**: 3 days
**Files**: `src/audio/audio-manager.hpp`, `src/audio/audio-manager.cpp`, `src/audio/soundbank.hpp`, `src/audio/soundbank.cpp`

### Description
Implement SDL2-Mixer-based audio manager. Loads all OGG sound banks at startup. Provides playSound(id), playMusic(name), setVolume(type, level) API. Manages channel allocation, overlapping sounds, and volume fading.

### Acceptance Criteria
- [ ] SDL2-Mixer initialized with 44100 Hz, 512-sample buffer
- [ ] All 141 speech OGGs loaded into sound bank
- [ ] All 53 SFX OGGs loaded into sound bank
- [ ] All 75 ambient OGGs loaded into sound bank
- [ ] All 32 music OGGs loaded into music bank
- [ ] playSound(id) returns immediately (non-blocking)
- [ ] Volume control per category (master, SFX, speech, music, ambient)
- [ ] Graceful degradation if audio device unavailable

### Technical Notes
- Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 512)
- Chunk caching: Mix_LoadWAV_RW for OGG; store in unordered_map<string, Mix_Chunk*>
- Music: Mix_Music* for long-form; Mix_PlayMusic with fade-in
- Channel allocation: channel 0 for music, channels 1-15 for SFX/speech
- Volume: Mix_Volume(channel, volume) range 0-128
- No-audio path: flag m_audioAvailable = false if Mix_OpenAudio fails

---

## Task 3.9: Star System Selection Screen

**Phase**: Game Systems
**Priority**: P2
**Depends On**: 3.6
**Estimated Effort**: 2 days
**Files**: `src/ui/main-menu.hpp`, `src/ui/main-menu.cpp`

### Description
Implement the star system selection screen shown after clicking New Game. Displays all 15 systems in a scrollable list with name, description, difficulty indicator, and terrain preview thumbnail.

### Acceptance Criteria
- [ ] All 15 systems displayed with names and descriptions
- [ ] Difficulty shown via visual indicator (1-5 stars or color)
- [ ] Terrain preview thumbnail or terrain type label
- [ ] Tutorial-flagged systems have a badge
- [ ] Click selects system and proceeds to game setup
- [ ] Back button returns to main menu
- [ ] Selection screen styled consistently with game UI

### Technical Notes
- Layout: scrollable list with system cards
- Difficulty: Beginner (1-2), Medium (3), Hard (4-5) -- color-coded
- Terrain preview: 132x125 thumbnail (1TILE.BMP or scaled TILE*)
- Landing zone: show planet view with site markers; player clicks
- MVP: auto-assign landing zone, skip zone picker for Phase 4 polish

---
# Phase 4: UI & Polish

---

## Task 4.1: Main Menu

**Phase**: UI & Polish
**Priority**: P1
**Depends On**: 1.2, 3.9
**Estimated Effort**: 3 days
**Files**: `src/ui/main-menu.hpp`, `src/ui/main-menu.cpp`

### Description
Implement the main menu with animated background. Menu items: New Game, Load Game, Tutorial, Options, Credits, Quit. Keyboard (up/down + Enter) and mouse navigation.

### Acceptance Criteria
- [ ] All 6 menu items display and are functional
- [ ] Background animation plays (looping MP4 or static 480.BMP)
- [ ] Keyboard navigation: up/down arrows + Enter
- [ ] Mouse hover highlights menu item
- [ ] "New Game" transitions to star system selection
- [ ] "Credits" shows scrolling text overlay
- [ ] "Quit" exits the application

### Technical Notes
- Background: loop intro FLC (converted MP4) or 480.BMP with subtle pan
- Menu overlay: semi-transparent dark panel centered
- Font: SDL2-Ttf with sci-fi style font
- Menu state part of GameLoop state machine

---

## Task 4.2: HUD

**Phase**: UI & Polish
**Priority**: P1
**Depends On**: 2.1, 1.5
**Estimated Effort**: 4 days
**Files**: `src/ui/hud.hpp`, `src/ui/hud.cpp`

### Description
Implement in-game HUD: resource bars (Common/Rare Metals, Food, Energy) with current/max and per-turn delta, population with breakdown, turn counter, morale indicator, alert feed, minimap.

### Acceptance Criteria
- [ ] 6 resource bars with icon, value, capacity, +/- delta
- [ ] Population: total + worker/scientist/child breakdown
- [ ] Turn counter with current tech level name
- [ ] Morale: 0-100 with color coding (red<30, yellow<60, green>=60)
- [ ] Alert feed: last 5 events as scrolling text
- [ ] Minimap: colony site overview with building dots
- [ ] HUD opacity configurable in options
- [ ] HUD adapts to viewport size

### Technical Notes
- Layout: top bar (resources + turn), left sidebar (population + morale), bottom bar (alerts), corner minimap
- Resource bar: colored rectangle with label, value, green/red delta
- Minimap: terrain at ~25% scale with colored building dots
- Alert feed: GameEvent entries from ColonyState.eventLog

---

## Task 4.3: Building Tooltips

**Phase**: UI & Polish
**Priority**: P2
**Depends On**: 3.2
**Estimated Effort**: 2 days
**Files**: `src/ui/dialogs.hpp`, `src/ui/dialogs.cpp`

### Description
Implement building tooltips on hover in placement panel and terrain view. Show: name, category, cost, build time, prerequisites, production, maintenance, operational status.

### Acceptance Criteria
- [ ] Hover in placement panel shows tooltip with full stats
- [ ] Hover on placed building shows operational status
- [ ] Tooltip positioned near cursor, clamped to screen bounds
- [ ] Prerequisites shown with satisfied/unsatisfied checkmarks
- [ ] Production: input/output arrows with quantities
- [ ] Tooltip auto-sizes to content
- [ ] Disappears on mouse leave with 200ms delay

### Technical Notes
- Rendering: SDL2-Ttf on dark semi-transparent background with 1px border
- Layout: name (bold), divider, stats table, divider, status
- Prerequisites: green checkmark if satisfied, red X if not
- Singleton tooltip manager for show/hide/position/render

---

## Task 4.4: Population Report Screen

**Phase**: UI & Polish
**Priority**: P2
**Depends On**: 2.8, 4.2
**Estimated Effort**: 2 days
**Files**: `src/ui/reports.hpp`, `src/ui/reports.cpp`

### Description
Implement population report showing detailed demographics: total, worker/scientist/child breakdown, housing capacity/occupancy, morale factor breakdown, birth/death/emigration rates, population history chart (50 turns).

### Acceptance Criteria
- [ ] Population breakdown with counts and percentages
- [ ] Housing: capacity vs occupied with occupancy bar
- [ ] Morale: current value and per-factor breakdown
- [ ] Birth/death/emigration rates per turn
- [ ] Population history chart (line graph, 50 turns)
- [ ] Tab/keyboard navigation between sections
- [ ] ESC or close button returns to game

### Technical Notes
- Layout: scrollable panel with sections (Summary, Housing, Morale, Demographics, History)
- Morale factors: each factor with current contribution value
- History: polyline from per-turn snapshots in ColonyState ring buffer

---

## Task 4.5: Production Report Screen

**Phase**: UI & Polish
**Priority**: P2
**Depends On**: 2.7, 4.2
**Estimated Effort**: 2 days
**Files**: `src/ui/reports.hpp`, `src/ui/reports.cpp`

### Description
Implement production report showing per-building production/consumption. List of operational buildings with input/output, net resource flows, efficiency indicators, production queue.

### Acceptance Criteria
- [ ] Per-building: name, input, output, status
- [ ] Net resource flow: 6 resources with gross production/consumption
- [ ] Building efficiency: (actual / max) percentage
- [ ] Production queue: items with progress bars
- [ ] Grouped by production category
- [ ] Sortable by name, output, or efficiency
- [ ] Real-time updates when simulation advances

### Technical Notes
- Data from BuildingInstance: inputStock, outputStock, workersAssigned, isOperational
- Efficiency: (currentOutput / theoreticalMax) * 100
- Grouping: buildingCategory field from definition

---

## Task 4.6: Logistics Report Screen

**Phase**: UI & Polish
**Priority**: P2
**Depends On**: 2.7, 4.2
**Estimated Effort**: 2 days
**Files**: `src/ui/reports.hpp`, `src/ui/reports.cpp`

### Description
Implement logistics report showing resource flow visualization. Storage capacity/usage, flow diagram (sources to consumers), surplus/deficit, SpacePort supply schedule, power network.

### Acceptance Criteria
- [ ] Storage: each resource with capacity bar
- [ ] Resource flow: arrow diagram producers -> storage -> consumers
- [ ] Surplus/deficit per resource with color indicator
- [ ] SpacePort supply ship: next arrival, contents
- [ ] Power network: total produced vs consumed, per-building breakdown
- [ ] Export/import summary
- [ ] Real-time updates

### Technical Notes
- Flow diagram: nodes (buildings) connected by directed edges
- Supply ship: timer based on SpacePort operational turns (every ~10 turns)
- Power network: power plants, consumers, priority shutdown order

---

## Task 4.7: Tech Tree Visualization

**Phase**: UI & Polish
**Priority**: P2
**Depends On**: 2.9, 4.2
**Estimated Effort**: 3 days
**Files**: `src/ui/reports.hpp`, `src/ui/reports.cpp`

### Description
Implement tech tree visualization screen. 12 backbone levels as tree with 22 upgrade chains branching off. Each node shows icon, name, unlock status. Click for details. Zoom and pan.

### Acceptance Criteria
- [ ] 12 backbone levels as vertical progression with branching
- [ ] 22 upgrade chains as horizontal branches
- [ ] Node state: locked (grey), available (yellow), researched (green)
- [ ] Node tooltip on click: stats and prerequisite chain
- [ ] Zoom in/out and pan within tree view
- [ ] Researched nodes show completion turn
- [ ] Current research target highlighted (pulsing border)

### Technical Notes
- Layout from prereq mask: backbone levels = cumulative tech thresholds
- Upgrade chains: groups of related buildings (Fact -> Fact2 -> Fact3)
- Node: building sprite at 48x48, name text below
- Graph layout: top-down with backbone as central spine

---

## Task 4.8: Options Screen

**Phase**: UI & Polish
**Priority**: P3
**Depends On**: 0.3, 4.1
**Estimated Effort**: 2 days
**Files**: `src/ui/main-menu.hpp`, `src/ui/main-menu.cpp`

### Description
Implement options screen from main menu and in-game pause. Resolution dropdown, fullscreen toggle, audio sliders, keybinding remapping, difficulty.

### Acceptance Criteria
- [ ] Resolution dropdown lists available modes (from SDL2)
- [ ] Fullscreen toggle (windowed / fullscreen / borderless)
- [ ] Volume sliders: master, SFX, music, speech, ambient (0-100%)
- [ ] Keybinding remapping: click binding, press new key
- [ ] Difficulty: Easy/Normal/Hard radio buttons
- [ ] Apply saves to config; Cancel reverts
- [ ] Settings persist between sessions

### Technical Notes
- Resolution list: SDL_GetDisplayMode() for available modes
- Volume: Mix_Volume(-1, vol) for SFX, Mix_VolumeMusic(vol) for music
- Keybinding: Config as <action>: <scancode> pairs

---

## Task 4.9: Video Player

**Phase**: UI & Polish
**Priority**: P3
**Depends On**: 0.7, 4.1
**Estimated Effort**: 3 days
**Files**: `src/video/video-player.hpp`, `src/video/video-player.cpp`, `src/video/cutscene-manager.hpp`, `src/video/cutscene-manager.cpp`

### Description
Implement video playback for FLC-converted MP4 cutscenes. SDL2-based playback with fade transitions. CutsceneManager maps game events to FLC IDs.

### Acceptance Criteria
- [ ] MP4 plays in dedicated video surface within game window
- [ ] Maintains aspect ratio with letterboxing
- [ ] Fade-in (500ms) and fade-out (500ms)
- [ ] CutsceneManager loads events.json mapping events to FLC IDs
- [ ] Events trigger correct cutscene (launch, disaster, victory)
- [ ] ESC skips video
- [ ] Music volume ducks to 20% during playback
- [ ] No main loop frame drop below 30 FPS during video

### Technical Notes
- Options: FFmpeg runtime linking, SMPEG2, or pre-rendered frame sequences
- Trigger mapping from events.json
- Video state machine: Idle -> Loading -> Playing -> FadingOut -> Done
- Audio ducking: Mix_PauseMusic() / Mix_ResumeMusic()

---

## Task 4.10: Music Player + Ambient Audio

**Phase**: UI & Polish
**Priority**: P3
**Depends On**: 3.8
**Estimated Effort**: 2 days
**Files**: `src/audio/music-player.hpp`, `src/audio/music-player.cpp`

### Description
Implement music player that selects background music based on game phase. Ambient audio (ADD*.WAV) layered with music.

### Acceptance Criteria
- [ ] Music changes based on game phase
- [ ] Cross-fade between tracks (2-second overlap)
- [ ] Ambient audio plays at configurable volume
- [ ] Multiple ambient sounds can layer simultaneously
- [ ] Playlist queue with shuffle option
- [ ] No-music state is valid (no crash)
- [ ] Music restarts after video cutscene

### Technical Notes
- Music bank: Mix_Music* per track loaded at startup
- Phase mapping: menu = MARS.OGG, early colony = COLONY1.OGG, etc.
- Cross-fade: Mix_FadeInMusic + Mix_FadeOutMusic at 2000ms
- Ambient: Mix_PlayChannel with -1 for free channel, loop indefinitely
- Ambient selection: terrain-type based

---

## Task 4.11: Voice Narration (FEM*.WAV)

**Phase**: UI & Polish
**Priority**: P3
**Depends On**: 3.8, 3.5
**Estimated Effort**: 2 days
**Files**: `src/audio/voice.hpp`, `src/audio/voice.cpp`

### Description
Implement voice narration for tutorial scenarios. FEM*.WAV files (141 files) play at correct tutorial steps.

### Acceptance Criteria
- [ ] FEM*.WAV files loaded into speech sound bank
- [ ] Tutorial step triggers correct FEM audio file
- [ ] Voice does not block tutorial step execution
- [ ] Voice volume controlled by speech slider
- [ ] Voice narration can be toggled on/off
- [ ] No-audio: tutorial continues silently
- [ ] Voice queue: chained FEM files play without gap

### Technical Notes
- FEM mapping: tutorial step number to FEM file index
- Playback: Mix_PlayChannel(-1, femChunk, 0) for one-shot
- Queue: SDL2-Mixer channel callback for chaining
- Toggle: Config flag; skip Mix_PlayChannel if disabled

---

# Phase 5: Content Verification & Release

---

## Task 5.1: Balance Verification Pass

**Phase**: Content Verification & Release
**Priority**: P2
**Depends On**: 2.3, 2.4, 2.5, 2.7, 2.9
**Estimated Effort**: 2 weeks
**Files**: `tests/integration/balance_test.cpp`, `tests/data/reference_turns.json`

### Description
Verify all building costs, production values, prerequisites, and simulation formulas match original. Run automated comparison: place every building, verify deductions; 50-turn simulation from each system compared to RE reference data.

### Acceptance Criteria
- [ ] All 138 building definitions match original BLDGBLD/BLDGOPS data
- [ ] Cost tier to actual resource values verified against original EXE
- [ ] Power output/consumption values match original
- [ ] 50-turn simulation produces identical resource levels to original
- [ ] Mine depletion curves match original over 100+ turns
- [ ] Morale formula within +/-5 of original at every measured turn
- [ ] AI building selection >=80% correlated with original AI

### Technical Notes
- Reference data from Phase 001 findings and dynamic analysis
- Data-driven: formula corrections are JSON config changes
- Flag unverified gaps as "best-effort" with documented variance

---

## Task 5.2: Tutorial Walkthrough Verification

**Phase**: Content Verification & Release
**Priority**: P3
**Depends On**: 3.5, 4.11
**Estimated Effort**: 1 week
**Files**: `tests/integration/tutorial_test.cpp`

### Description
Play through all 4 tutorial scenarios end-to-end. Verify all 133 steps execute in order, conditions trigger correctly, dialog matches original, voice narration plays.

### Acceptance Criteria
- [ ] All 4 scenarios playable (Aphrodite, Anonymous Bosch, Sigma Draconis, Vulcan's Forge)
- [ ] All 133 steps execute in original order
- [ ] Dialog matches original TUTOR.OPS content
- [ ] Voice narration plays at correct steps
- [ ] Step advances correctly on condition triggers
- [ ] Timeout advances work as configured
- [ ] Tutorial restart works from any step

### Technical Notes
- Automated: script simulating player actions matching tutorial conditions
- Manual: side-by-side with original game
- Log all step transitions for post-hoc analysis

---

## Task 5.3: Cross-Platform CI

**Phase**: Content Verification & Release
**Priority**: P1
**Depends On**: 0.1, 0.4
**Estimated Effort**: 1 week
**Files**: `.github/workflows/build.yml`, `.github/workflows/test.yml`

### Description
Set up GitHub Actions CI building and testing on Windows (MSVC), Linux (GCC, Clang), macOS (Clang, ARM + x64).

### Acceptance Criteria
- [ ] Windows build succeeds (MSVC 2022, x64)
- [ ] Linux build succeeds (GCC 13, Clang 16, x64)
- [ ] macOS build succeeds (Clang, x64 + ARM)
- [ ] Unit tests pass on all platforms
- [ ] Integration tests pass on at least one platform
- [ ] Build time under 10 minutes per platform
- [ ] Artifacts: executable zipped and uploaded

### Technical Notes
- actions/checkout@v4 and jwlawson/actions-setup-cmake@v2
- Windows: vcpkg for SDL2 dependencies
- Linux: apt-get install libsdl2-dev etc.
- macOS: brew install sdl2 etc.
- Testing: ctest dispatched test targets

---

## Task 5.4: Performance Optimization

**Phase**: Content Verification & Release
**Priority**: P2
**Depends On**: 1.1, 1.6, 2.2
**Estimated Effort**: 1 week
**Files**: Optimizations across render, simulation, asset systems

### Description
Profile and optimize to meet performance targets: 60 FPS at 1920x1080 on modern hardware, 30 FPS at 1280x720 on 10-year-old hardware.

### Acceptance Criteria
- [ ] 60 FPS sustained at 1920x1080 with full colony (50+ buildings)
- [ ] 30 FPS sustained at 1280x720 on low-end hardware
- [ ] Frame budget: rendering < 12ms, simulation < 1ms, UI < 3ms
- [ ] No frame drops during turn transitions
- [ ] Memory usage < 512 MB peak
- [ ] Texture memory < 256 MB
- [ ] Asset loading < 3 seconds on SSD

### Technical Notes
- Profiling: Tracy profiler or SDL_GetPerformanceCounter
- Sprite batching: minimize draw calls
- Culling: frustum cull off-screen sprites
- Texture atlas: reduce GL texture binds
- Fixed timestep accumulator pattern

---

## Task 5.5: README + Build Instructions

**Phase**: Content Verification & Release
**Priority**: P1
**Depends On**: 0.1
**Estimated Effort**: 1 day
**Files**: `README.md`, `BUILDING.md`

### Description
Write comprehensive build and project documentation. README: overview, obtaining assets, dependencies, build instructions for 3 platforms, running, contributing. BUILDING.md: detailed developer build steps.

### Acceptance Criteria
- [ ] README.md with project overview and badges
- [ ] Build instructions for Windows (MSVC + vcpkg)
- [ ] Build instructions for Linux (apt + CMake)
- [ ] Build instructions for macOS (brew + CMake)
- [ ] Asset pipeline setup instructions
- [ ] Dependencies list with minimum versions
- [ ] Quick start section
- [ ] License file included

### Technical Notes
- Badges: CI status, platform support, license
- Build commands: cmake -B build && cmake --build build
- Troubleshooting: common issues per platform

---

## Task 5.6: Player Guide

**Phase**: Content Verification & Release
**Priority**: P3
**Depends On**: 4.2, 4.4, 4.5, 4.6, 4.7
**Estimated Effort**: 3 days
**Files**: `PLAYER_GUIDE.md`

### Description
Write player guide explaining how to play. Covers: starting, building placement, resource management, tech tree, disaster response, keyboard shortcuts, tips.

### Acceptance Criteria
- [ ] New game walkthrough: select system -> place SpacePort -> first buildings
- [ ] Resource management explained
- [ ] Tech tree progression overview
- [ ] Building categories and upgrade chains
- [ ] Disaster types and mitigation
- [ ] Keyboard shortcuts reference
- [ ] Known differences from original Outpost
- [ ] Tips section

### Technical Notes
- Markdown format for GitHub and in-game rendering
- Screenshots from actual game
- FAQ section

---

## Task 5.7: GitHub Release Pipeline

**Phase**: Content Verification & Release
**Priority**: P1
**Depends On**: 5.3, 5.5
**Estimated Effort**: 2 days
**Files**: `.github/workflows/release.yml`

### Description
Set up GitHub release pipeline: build all platforms, package executables with DLLs/SOs, attach assets, create Release with notes.

### Acceptance Criteria
- [ ] CI build succeeds for all 3 platforms with release config
- [ ] Windows: .exe + SDL2 DLLs + assets in .zip
- [ ] Linux: executable + .tar.gz with runtime deps
- [ ] macOS: .app bundle in .dmg
- [ ] Release notes from commit history
- [ ] Assets attached
- [ ] Version number from git tags (semver)

### Technical Notes
- actions/create-release or softprops/action-gh-release
- Windows: copy SDL2 DLLs from vcpkg install dir
- macOS: create-dmg or hdiutil
- Linux: AppImage or static binary
- Release tagging: v1.0.0 triggers workflow

---

## Task 5.8: HD Asset Packaging Guide

**Phase**: Content Verification & Release
**Priority**: P3
**Depends On**: 0.6, 0.7
**Estimated Effort**: 1 day
**Files**: `HD_ASSET_GUIDE.md`, `tools/bmp-upscaler/README.md`

### Description
Write HD asset packaging guide for community contributors. Explains ESRGAN upscaling, manual cleanup, per-category settings, and contribution workflow.

### Acceptance Criteria
- [ ] ESRGAN upscale pipeline documented with examples
- [ ] Per-category HD settings explained
- [ ] Nearest-neighbor fallback documented
- [ ] Manual cleanup workflow (Photoshop/GIMP)
- [ ] HD asset directory structure
- [ ] How to test HD assets in-game
- [ ] Contribution guidelines
- [ ] Expected output dimensions table

### Technical Notes
- ESRGAN model: realesr-general-x4v3 recommended
- Terrain benefits most from upscale; UI from SVG vector
- Contribution: optional community packs, not bundled
- File naming: {name}_HD.png for automatic resolution
