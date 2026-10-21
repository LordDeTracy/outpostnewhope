# Tasks: Outpost Reverse Engineering

**Input**: Design documents from `specs/001-outpost-reverse-engineering/`

**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, contracts/

**Tests**: Not applicable — this is a research/analysis project; validation is done through hex verification and format documentation

**Organization**: Tasks are grouped by user story to enable independent analysis and documentation of each area.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Path Conventions

- **Spec directory**: `specs/001-outpost-reverse-engineering/`
- **Findings**: `specs/001-outpost-reverse-engineering/findings/`
- **Contracts**: `specs/001-outpost-reverse-engineering/contracts/`
- **Original assets**: `Outpost/` (binary), `Outpost/RESOURCE.000` (archive), `Outpost/BITMAPS/` (graphics), `Outpost/VIDEOS/` (video), `Outpost/MUSIC/` (audio), `Outpost/INN/` (networking)

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and tooling setup

- [X] T001 Create findings directory structure at `specs/001-outpost-reverse-engineering/findings/` with subdirectories for each research area
- [ ] T002 [P] Install and configure RE tools: Ghidra with NE loader extension (for 16-bit Windows 3.1 NE binary analysis) — guide written at `tools/SETUP-RE-ENV.md`
- [ ] T003 [P] Install and configure hex editor (010 Editor or ImHex) with binary template scripting — guide written at `tools/SETUP-RE-ENV.md`
- [ ] T004 [P] Set up Windows 3.1 VM in VirtualBox or DOSBox for dynamic/runtime analysis of the game — guide written at `tools/SETUP-RE-ENV.md`
- [ ] T005 [P] Set up Git LFS (if needed) for binary asset versioning in findings directory
- [X] T006 [P] Verify RESOURCE.000 file integrity and document its size, modification date, and hex signature at `Outpost/RESOURCE.000`

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Archive extraction and initial hex reconnaissance — MUST be complete before most user stories can begin

**⚠️ CRITICAL**: No user story work can begin until the archive is extracted and the file layout is understood

- [X] T007 Perform initial hex dump analysis of `Outpost/RESOURCE.000` — document first 512 bytes (signature, file count, directory offset)
- [ ] T008 Manually extract OUTPOST.EXE from `Outpost/RESOURCE.000` by locating its offset and size from the archive directory
- [ ] T009 [P] Manually extract BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS, OUTPOST.INI from `Outpost/RESOURCE.000`
- [X] T010 [P] Create byte-level map of the RESOURCE.000 directory/index structure and document at `specs/001-outpost-reverse-engineering/findings/02-archive-format.md`
- [ ] T011 Verify OUTPOST.EXE is valid 16-bit Windows 3.1 NE format (check `NE` signature, header fields) and document at `specs/001-outpost-reverse-engineering/findings/01-binary-structure.md`
- [ ] T012 Verify all extracted files against known file type signatures (EXE, DAT, INI, MID) and log any mismatches

**Checkpoint**: RESOURCE.000 format understood, all embedded files extracted and verified

---

## Phase 3: User Story 2 (Priority: P1) — Resource Archive Format 🎯 MVP

**Goal**: Fully reverse the RESOURCE.000 archive format and document it with a working extractor tool

**Independent Test**: A tool can list, extract, and repack RESOURCE.000 with verified round-trip fidelity

### Analysis for User Story 2

- [ ] T013 [P] [US2] Analyze RESOURCE.000 directory structure: determine entry size, field layout, and name encoding at `Outpost/RESOURCE.000`
- [ ] T014 [P] [US2] Identify any compression or encoding algorithm used on embedded files within `Outpost/RESOURCE.000`
- [ ] T015 [US2] Write complete byte-level format specification for RESOURCE.000 at `specs/001-outpost-reverse-engineering/contracts/archive-format.md`
- [ ] T016 [US2] Build resource-extractor tool at `tools/resource-extractor/` implementing list, extract, and repack commands
- [ ] T017 [US2] Verify round-trip: extract all files from `Outpost/RESOURCE.000`, repack, and confirm the repacked archive has identical directory structure to original

**Checkpoint**: RESOURCE.000 format fully documented with working extractor/repacker tool

---

## Phase 4: User Story 1 (Priority: P1) — Game Binary Analysis

**Goal**: Fully disassemble OUTPOST.EXE and document all entry points, code segments, and function call flow

**Independent Test**: A complete annotated function map with identified WinMain, window proc, main loop, and all major subsystems

### Analysis for User Story 1

- [ ] T018 [P] [US1] Load `Outpost/OUTPOST.EXE` into Ghidra/IDA Pro and document the NE header (segments, entry table, module references)
- [ ] T019 [P] [US1] Catalog the complete Windows API import table from `Outpost/OUTPOST.EXE` — document every USER32, GDI32, KERNEL32, multimedia, and DIB call
- [ ] T020 [P] [US1] Identify and label WinMain, window procedure, and main message pump loop entry points in the disassembly
- [ ] T021 [P] [US1] Extract and catalog all string references from `Outpost/OUTPOST.EXE` (UI labels, debug strings, game messages, error messages)
- [ ] T022 [US1] Map and document all code segments by purpose (init, simulation, rendering, UI, audio, AI) at `specs/001-outpost-reverse-engineering/findings/01-binary-structure.md`
- [ ] T023 [US1] Identify and label the tile engine rendering functions in the disassembly
- [ ] T024 [US1] Identify and label the colony simulation update functions (resource ticks, population, morale) in the disassembly
- [ ] T025 [US1] Identify and label the AI manager personality system functions in the disassembly
- [ ] T026 [US1] Locate and label mouse input handling, keyboard input, and UI interaction code in the disassembly
- [ ] T027 [US1] Identify the FLC video playback trigger code (AAPLAY.DLL integration) in the disassembly
- [ ] T028 [US1] Identify audio subsystem code: WAV playback, MIDI sequencing, and sound effect triggers in the disassembly
- [ ] T029 [US1] Document complete calling hierarchy and data flow diagrams at `specs/001-outpost-reverse-engineering/findings/01-binary-structure.md`

**Checkpoint**: OUTPOST.EXE fully disassembled with annotated functions, segment map, and documented call graph

---

## Phase 5: User Story 3 (Priority: P2) — Data File Format Reversal

**Goal**: Reverse all game data file formats and produce complete specifications with parsing tools

**Independent Test**: Parsing tools can dump human-readable content from each format, cross-verified against known game behavior from the manual

### Analysis for User Story 3

- [ ] T030 [P] [US3] Perform hex analysis of `BLDGBLD.DAT` extracted from RESOURCE.000 — identify record boundaries, field types, and data patterns
- [ ] T031 [US3] Map each BLDGBLD.DAT field to known building properties (cost, prerequisites, power, workers, production rates, build time) cross-referenced with the game manual
- [ ] T032 [P] [US3] Perform hex analysis of `BLDGOPS.DAT` — identify record fields for operational parameters (maintenance, staffing, failure rates, upgrades)
- [ ] T033 [US3] Map each BLDGOPS.DAT field to known operational behavior cross-referenced with the game manual
- [ ] T034 [P] [US3] Reverse the TUTOR.OPS scripting language — identify opcodes, operands, control flow structures, conditional branching, dialog triggers
- [ ] T035 [US3] Document TUTOR.OPS bytecode format with full opcode map at `specs/001-outpost-reverse-engineering/contracts/tutor-format.md`
- [ ] T036 [US3] Write format specifications for BLDGBLD.DAT and BLDGOPS.DAT at `specs/001-outpost-reverse-engineering/contracts/bldgbld-format.md` and `specs/001-outpost-reverse-engineering/contracts/bldgops-format.md`
- [ ] T037 [US3] Document OUTPOST.INI all configuration keys, valid values, and their in-game effects
- [ ] T038 [US3] Build dat-dumper tool at `tools/dat-dumper/` supporting all three formats (bldgbld, bldgops, tutor) with JSON/CSV output

**Checkpoint**: All data file formats fully documented with working parsing tools

---

## Phase 6: User Story 4 (Priority: P2) — Game Engine Architecture

**Goal**: Document the complete game engine architecture including tile engine, simulation loop, AI subsystem, and event system

**Independent Test**: Engine architecture descriptions validated by tracing execution paths in the annotated disassembly

### Analysis for User Story 4

- [ ] T039 [US4] Document the tile map data structure from disassembly: grid dimensions, tile ID storage format, layer system, coordinate transforms at `specs/001-outpost-reverse-engineering/findings/04-engine-architecture.md`
- [ ] T040 [US4] Identify coordinate system (isometric vs top-down), tile dimensions, and screen-to-map coordinate transforms
- [ ] T041 [US4] Determine all terrain types and their properties (passability, resource yield, buildability) and document with the tile structure
- [ ] T042 [US4] Document the colony simulation update cycle: resource consumption and production per tick, population growth/decline formulas, morale calculation mechanics
- [ ] T043 [US4] Identify all disaster types and their trigger conditions (fires, earthquakes, plague, meteor strikes, etc.)
- [ ] T044 [US4] Document the AI subsystem: AI manager personalities, colony management heuristics, rebel colony interaction logic
- [ ] T045 [US4] Map the full building tech tree from BLDGBLD.DAT and BLDGOPS.DAT — prerequisites, research requirements, upgrade paths
- [ ] T046 [US4] Document the complete main game loop structure and timing (input → simulation → render cycle) at `specs/001-outpost-reverse-engineering/findings/04-engine-architecture.md`
- [ ] T047 [US4] Document in-memory colony state structure: all tracked resources, infrastructure, population, disaster timers, and relationship data

**Checkpoint**: Game engine architecture fully documented with data flow diagrams, formulas, and state machine descriptions

---

## Phase 7: User Story 5 (Priority: P3) — Bitmap & Video Format Reversal

**Goal**: Reverse the proprietary bitmap and FLC video formats with working converters

**Independent Test**: Converters can transform proprietary BMP variants to standard PNG and document FLC triggering conditions

### Analysis for User Story 5

- [X] T048 [P] [US5] Analyze the header structure of `Outpost/BITMAPS/TILE1.BMP` — identified as standard Windows 8-bit BMP (640×480, 256 colors, BI_RGB)
- [X] T049 [US5] Document the BMP format — confirmed standard Windows BMP, no proprietary format needed at `specs/001-outpost-reverse-engineering/findings/05-graphics-pipeline.md`
- [X] T050 [P] [US5] Categorize all bitmaps in `Outpost/BITMAPS/` by usage: 80 full-screen (640×480), 140 tile sheets (300×150), 70 building icons (145×120), ~50+ UI elements
- [ ] T051 [US5] Identify tile coordinate mapping — how tile IDs (numeric filenames) map to map data references
- [ ] T052 [US5] Build bmp-converter tool at `tools/bmp-converter/` with batch conversion support (note: BMPs are already standard format, converter not strictly needed)
- [X] T053 [P] [US5] Analyze FLC file headers in `Outpost/VIDEOS/` — verified Autodesk FLIC format, played via AAPLAY.DLL
- [X] T054 [US5] Document all FLC files and AAPLAY.DLL integration at `specs/001-outpost-reverse-engineering/findings/05-graphics-pipeline.md`

**Checkpoint**: All bitmap and video formats documented with working converters

---

## Phase 8: User Story 6 (Priority: P3) — Sound & Music System

**Goal**: Document the complete audio system: WAV effects, MIDI music, driver selection, and triggering

**Independent Test**: Audio triggering conditions verified against disassembly references and game behavior

### Analysis for User Story 6

- [ ] T055 [P] [US6] Categorize all WAV files in `Outpost/MUSIC/` by naming convention: ambient sounds, UI beeps, alerts, voice (FEM*.WAV), music loops, event sounds
- [ ] T056 [P] [US6] Document all MIDI files in `Outpost/MUSIC/` and their role (background music tracks, intro sequences)
- [ ] T057 [US6] Cross-reference audio filenames with string references in the OUTPOST.EXE disassembly to determine exact triggering conditions
- [ ] T058 [US6] Document the MIDI/WAV selection logic based on hardware configuration (base vs extended MIDI) at `specs/001-outpost-reverse-engineering/findings/06-audio-subsystem.md`
- [ ] T059 [US6] Document the Sierra audio driver system: SNDBLAST.DRV, ADL.DRV, MT32.DRV — which drivers are used for which hardware
- [ ] T060 [US6] Document how the game handles audio file not found / fallback scenarios

**Checkpoint**: Audio subsystem fully documented with trigger matrix and driver mapping

---

## Phase 9: Polish & Cross-Cutting Concerns

**Purpose**: Consolidate all findings, cross-reference between documents, produce summary report

- [ ] T061 [P] Cross-reference all findings documents for consistency — ensure binary function labels match data format fields
- [ ] T062 [P] Create consolidated colony simulation reference document at `specs/001-outpost-reverse-engineering/findings/07-colony-simulation.md` with equations for all resource/population/morale calculations
- [ ] T063 [P] Document the INN & multiplayer components at `specs/001-outpost-reverse-engineering/findings/08-inn-multiplayer.md` — analyze INN/ directory files and any MP code in the binary
- [ ] T064 Update `research.md` at `specs/001-outpost-reverse-engineering/research.md` with all completed research findings per area
- [ ] T065 Update `data-model.md` at `specs/001-outpost-reverse-engineering/data-model.md` with confirmed entity definitions from all analyses
- [ ] T066 Final review: verify every field in every contract is backed by disassembly evidence or hex analysis
- [ ] T067 Create summary README at `specs/001-outpost-reverse-engineering/README.md` with overview of all findings, file formats, and architectural diagrams

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion — BLOCKS US1, US2, US3, US4
- **US2 — Archive Format (Phase 3)**: Depends on Foundational — can proceed in parallel with US1
- **US1 — Binary Analysis (Phase 4)**: Depends on Foundational — can proceed in parallel with US2
- **US3 — Data Files (Phase 5)**: Depends on Foundational (extraction) + may reference US1 (function labels) and US2 (archive structure)
- **US4 — Engine Architecture (Phase 6)**: Depends on US1 (disassembly analysis is prerequisite)
- **US5 — Bitmap/Video (Phase 7)**: Bitmap analysis is independent (Phase 1). FLC analysis depends on US1 (AAPLAY trigger code refs). Can start in parallel with US3.
- **US6 — Audio (Phase 8)**: Depends on US1 (audio trigger code refs). Can start after US1 makes progress.
- **Polish (Phase 9)**: Depends on all user story phases

### User Story Dependencies

- **User Story 2 (P1) — Archive**: Can start after Foundational (Phase 2) — No dependencies on other stories
- **User Story 1 (P1) — Binary**: Can start after Foundational (Phase 2) — No dependencies on other stories
- **User Story 3 (P2) — Data Files**: Can start after Foundational — may benefit from US1/US2 cross-references
- **User Story 4 (P2) — Engine**: Depends on US1 (binary analysis) — requires disassembly progress
- **User Story 5 (P3) — Bitmap/Video**: Bitmap portion independent; video portion references US1 findings
- **User Story 6 (P3) — Audio**: References US1 findings for trigger code — can start after US1

### Parallel Opportunities

- US1 (Binary) and US2 (Archive) can run in FULL PARALLEL — they analyze different files
- US5 Bitmap analysis can start immediately — files are on disk, no extraction needed
- US3 (Data Files) can run alongside US1 and US2 once extraction is done
- All Phase 1 setup tasks marked [P] can run in parallel
- All Phase 2 foundational tasks marked [P] can run in parallel
- Within each user story, all [P] analysis tasks can run in parallel

## Implementation Strategy

### Research-First Approach

1. Complete Phase 1: Setup — tools and environment ready
2. Complete Phase 2: Foundational — archive extracted and verified
3. Execute US1 and US2 in parallel (P1 — highest priority)
4. Execute US3 and US5 in parallel (P2/P3 — data files + bitmaps are largely independent)
5. Execute US4 and US6 (depend on US1 binary analysis completion)
6. Complete Phase 9: Polish — consolidate and cross-reference all findings
