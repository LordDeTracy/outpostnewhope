# Feature Specification: Outpost Remastered

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A6, C1, C2, D2, D3 (see section E)). See [ERRATA.md](../001-outpost-reverse-engineering/findings/ERRATA.md) and the verified [00-ground-truth.md](../001-outpost-reverse-engineering/findings/00-ground-truth.md) before relying on it.

**Feature Branch**: `002-outpost-remastered`

**Created**: 2026-06-12

**Status**: Draft

**Input**: User description: "Remake Outpost (1994) for 2026 — full HD, native executable, modern UI, faithful to the original."

---

## User Scenarios & Testing

### User Story 1 - New Game & Star System Selection (Priority: P1)

As a player, I want to start a new game by selecting a star system and landing zone so that I can begin colonizing a planet.

**Why this priority**: This is the entry point — no game can be played without it.

**Independent Test**: Player can launch the game, see the main menu, click "New Game", see 15 star systems with descriptions, select one, choose a landing zone, and see the terrain rendered.

**Acceptance Scenarios**:
1. **Given** the game is launched, **When** the player clicks "New Game", **Then** a list of 15 star systems is displayed with names matching the original game (Aphrodite, Anonymous Bosch, Sigma Draconis, Vulcan's Forge, etc.)
2. **Given** a star system is selected, **When** the player picks a landing zone, **Then** the terrain renders using the correct TILE*.BMP for that system's terrain type
3. **Given** the terrain is loaded, **When** the SEED Lander is placed, **Then** the turn timer enables and the colony view system works

---

### User Story 2 - Colony Simulation & Building (Priority: P1)

As a player, I want to place buildings on the terrain and advance turns so that my colony grows and produces resources exactly as the original game did.

**Why this priority**: The core gameplay loop — building and simulating — is the entire game.

**Independent Test**: Player can place a SEED Lander, advance turns, see it construct, place additional buildings from all 138 types, and observe resource production/consumption matching original values.

**Acceptance Scenarios**:
1. **Given** the colony view is active, **When** the player selects a building from the structure panel, **Then** it can be placed on valid terrain at grid coordinates matching original placement rules
2. **Given** a building is placed, **When** turns advance, **Then** it constructs in the correct number of turns and begins producing/consuming resources at original rates
3. **Given** the building is operational, **When** resources are consumed or produced, **Then** the resource display updates exactly per original formulas

---

### User Story 3 - Faithful Simulation Pipeline (Priority: P1)

As a player, I want the colony simulation to produce the same outcomes as the original game so that strategies from 1994 still work.

**Why this priority**: If the simulation is wrong, it's not Outpost.

**Independent Test**: Given identical starting conditions, the simulation produces identical resource levels after N turns as the original game.

**Acceptance Scenarios**:
1. **Given** the 20-step SCI pipeline is implemented, **When** SCFillResources runs, **Then** all resource flows are calculated in original order
2. **Given** SCPower has executed, **When** energy surplus/deficit is computed, **Then** buildings power-down in original priority order
3. **Given** SCMorale has run, **When** morale factors are evaluated, **Then** population growth/decline matches original formulas
4. **Given** SCAiInput processes, **When** rebel colonies exist, **Then** their actions match original AI behavior

---

### User Story 4 - Visual Fidelity & Views (Priority: P2)

As a player, I want to see the planet from 3 zoom levels — orbit, site, and tile — with smooth transitions and HD upscaled graphics.

**Why this priority**: The multi-view system is a defining visual feature of the original.

**Independent Test**: Player can zoom from planet view (480.BMP) to site view (TILE*.BMP) to tile view (building sprites over terrain) with smooth animation.

**Acceptance Scenarios**:
1. **Given** the game is running, **When** the player zooms in, **Then** the view transitions smoothly from 640×480 planet surface to terrain detail
2. **Given** buildings are placed, **When** viewed at tile zoom, **Then** building sprites render with A/B frame animation at original timing
3. **Given** HD assets are available, **When** rendered, **Then** they display at upscaled resolution; when not available, original BMPs render directly

---

### User Story 5 - Tech Tree & All 138 Buildings (Priority: P2)

As a player, I want to research and build every structure from the original game so that the full tech tree is available.

**Why this priority**: 138 buildings with 22 upgrade chains define the game's strategic depth.

**Independent Test**: All 138 building definitions loaded from original data render in the build menu with correct prerequisites, costs, and production values.

**Acceptance Scenarios**:
1. **Given** the colony exists, **When** the player opens the build menu, **Then** all available buildings appear with prerequisites highlighted per the 12-bit prereq mask
2. **Given** a prerequisite is unmet, **When** the player tries to build, **Then** the requirement is displayed in original format
3. **Given** a building is upgraded, **When** it reaches the next tier, **Then** stats update exactly per BLDGOPS.DAT operational parameters

---

### User Story 6 - Tutorial System (Priority: P3)

As a new player, I want to play through the original 4 tutorial scenarios so that I learn the game as intended.

**Why this priority**: Tutorial drives new player retention.

**Independent Test**: All 4 scenarios (Aphrodite, Anonymous Bosch, Sigma Draconis, Vulcan's Forge) run with correct tutorial steps parsed from TUTOR.OPS.

**Acceptance Scenarios**:
1. **Given** the player selects "Tutorial", **When** a scenario loads, **Then** tutorial steps execute in original order with correct dialogs
2. **Given** tutorial step N, **When** the player completes the required action, **Then** the next step activates
3. **Given** all 133 steps across 4 scenarios, **When** played through, **Then** the flow matches original TUTOR.OPS bytecode

---

### User Story 7 - FLC Cutscenes (Priority: P3)

As a player, I want to watch the original 92 FLC animations at appropriate game events so that the narrative experience is preserved.

**Why this priority**: Cutscenes define the game's story moments.

**Independent Test**: FLC files converted to MP4 play at correct trigger points (launch, landing, disaster, victory).

**Acceptance Scenarios**:
1. **Given** the player launches a colony ship, **When** the launch sequence triggers, **Then** the correct FLC plays
2. **Given** a disaster occurs, **When** the event fires, **Then** the disaster animation plays
3. **Given** the game ends, **When** victory/defeat is determined, **Then** the ending cutscene plays

---

### User Story 8 - Save & Load (Priority: P3)

As a player, I want to save my game and continue later so that I can play in sessions.

**Why this priority**: Persistence is a basic game requirement.

**Independent Test**: Player saves mid-game, exits, relaunches, loads save, and the colony state is identical.

**Acceptance Scenarios**:
1. **Given** a game is in progress, **When** the player saves, **Then** a save file is written with complete colony state
2. **Given** a save file exists, **When** the player loads it, **Then** all colony state (resources, buildings, turns, events) is restored exactly
3. **Given** an original OUTPOST.EXE .OPS save file, **When** loaded, **Then** the simulation state matches (future enhancement)

---

### Edge Cases

- What happens when RESOURCE.000 or individual asset files are missing? Graceful fallback to original BMPs (no HD), or display error with file name.
- How does the game handle screen resolutions below 1280×720? Minimum supported resolution with scrollable/zoomable viewport.
- What happens when no sound device is available? Game runs silently without crash.
- How does the game handle non-English keyboard layouts? All keybindings are configurable via config file.
- What happens when the original asset directory doesn't exist? Game prompts for asset path on first launch, stores it in config.
- What happens with the INN (Sierra Internet) directory? Ignored — not relevant to remake.

---

## Requirements

### Functional Requirements

- **FR-001**: System MUST load all building definitions from original BLDGBLD.DAT and BLDGOPS.DAT via parsed YAML/JSON intermediates
- **FR-002**: System MUST render terrain using original TILE1-6.BMP or HD upscaled derivatives
- **FR-003**: System MUST implement the 20-step SCI simulation pipeline in original execution order
- **FR-004**: System MUST support 3 zoom levels (planet → site → tile) with smooth transitions
- **FR-005**: System MUST display all 138 building types with A/B animation frames
- **FR-006**: System MUST provide the full tech tree with 12-bit prereq mask resolution
- **FR-007**: System MUST load and execute tutorial scripts from TUTOR.OPS data
- **FR-008**: System MUST play FLC cutscenes at original trigger points (via MP4 conversion)
- **FR-009**: System MUST play all 277 WAV and 35 MIDI audio files at correct game events
- **FR-010**: System MUST support save/load of complete colony state
- **FR-011**: System MUST implement all 6 disaster types from the original game
- **FR-012**: System MUST provide 15 selectable star systems with unique terrain and difficulty
- **FR-013**: System MUST include a modern UI with keyboard shortcut support
- **FR-014**: System MUST run natively on Windows, Linux, and macOS without DOSBox
- **FR-015**: System MUST load assets from a user-specified data directory (no hardcoded paths)
- **FR-016**: System MUST run at 60 FPS on modern hardware at 1920×1080 minimum

### Key Entities

- **ColonyState**: Complete simulation snapshot — resources, buildings, population, morale, turn count, disaster timers, tech level
- **Building**: Definition from BLDGBLD.DAT — 40+ fields covering cost, prerequisites, production, maintenance, power, workers, category, tier, animation
- **BuildingOperation**: Operational parameters from BLDGOPS.DAT — 46 fields covering staffing, failure rates, upgrade paths, special behaviors
- **StarSystem**: One of 15 starting scenarios — terrain type, ore distribution, difficulty, starting conditions
- **TechNode**: One of 12 backbone tech levels plus 22 upgrade chains — resolved from 12-bit prereq mask
- **TerrainView**: Renderable view state — planet (480.BMP), site (TILE*.BMP), or tile (building overlay)
- **TutorialStep**: One of 133 steps parsed from TUTOR.OPS — opcode, condition, action, dialog text
- **Disaster**: Event type with trigger conditions and effects — fire, earthquake, plague, meteor, etc.
- **Cutscene**: FLC-derived MP4 with trigger conditions and timing

---

## Success Criteria

### Measurable Outcomes

- **SC-001**: Game launches natively on all 3 platforms without DOSBox
- **SC-002**: All 138 buildings available with correct prerequisites, costs, and production from original data
- **SC-003**: Simulation produces identical resource outcomes to original game for first 50 turns of any scenario
- **SC-004**: All 4 tutorial scenarios play through completely with correct step flow
- **SC-005**: All 15 star systems selectable with correct terrain and starting conditions
- **SC-006**: All 92 FLC cutscenes play at correct trigger points
- **SC-007**: All 277 WAV and 35 MIDI audio files play at correct game events
- **SC-008**: 3 zoom levels with smooth transitions, minimum 60 FPS at 1920×1080
- **SC-009**: Save/load round-trip produces identical colony state
- **SC-010**: Full original tech tree navigable from SpacePort through LMonoTrain/RMonoTrain

---

## Assumptions

- Original game assets are bundled with the project distribution (Outpost is widely recognized as abandonedware; Sierra On-Line no longer exists as an entity and the game has no commercial rights holder pursuing distribution). Users downloading the game receive a complete package including original assets, converted HD textures, and the executable.
- Asset pipeline tools (Python Pillow, FFmpeg, SoX, FluidSynth) are development-only dependencies — end users receive pre-converted assets.
- HD upscaled assets are optional — original BMPs render natively with nearest-neighbor scaling.
- Target resolution starts at 1280×720; 1920×1080 recommended.
- All original FLC files have no embedded audio — cutscenes are silent per original design.
- Community-created HD assets can be contributed as optional packs to replace the AI-upscaled defaults.
- OutpostHD's codebase is referenced for design patterns only — no code is copied.
