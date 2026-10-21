# Implementation Plan: Outpost Reverse Engineering

**Branch**: `001-outpost-reverse-engineering` | **Date**: 2026-06-09 | **Spec**: `specs/001-outpost-reverse-engineering/spec.md`

**Input**: Feature specification from `specs/001-outpost-reverse-engineering/spec.md`

## Summary

Fully reverse engineer the Sierra Outpost (1994) CD-ROM game: disassemble the 16-bit Windows 3.1 binary, reverse the RESOURCE.000 archive format, decode all proprietary data files and assets, and produce comprehensive documentation of the game engine architecture, tile system, colony simulation, graphics pipeline, audio subsystem, and all data formats. Deep research and analysis of all code and assets is the primary focus and must be completed before any implementation work begins.

## Technical Context

**Language/Versions**: 16-bit x86 assembly (target binary); C++ for analysis tooling

**Primary RE Tools**: Ghidra (with NE/16-bit support), IDA Pro, Hiew, hex editor (010 Editor or ImHex), Resource Hacker

**RE Environment**: DOSBox + Windows 3.1 VM for runtime dynamic analysis; modern Windows for static analysis

**Storage**: Binary analysis artifacts, annotated disassembly, extracted assets, format documentation in markdown

**Testing**: Validation tools that parse extracted formats and verify against known game behavior; hex diff comparisons

**Target Platform**: Outpost 1.5 for Windows 3.1 (16-bit, 640x480 256-color VGA)

**Performance Goals**: N/A — this is a research/analysis project, not a performance-sensitive implementation

**Constraints**: OUTPOST.EXE is 16-bit NE format — requires specialized tooling not all RE frameworks support well; no debugging symbols available; Sierra-era proprietary formats may use undocumented compression

**Scale/Scope**: ~640KB EXE binary, ~1.1MB RESOURCE.000 archive, ~800+ bitmap files, ~200+ WAV files, ~30+ FLC animations, multiple undocumented proprietary formats

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- ✅ **I. Game Preservation & Accuracy** — This reverse engineering effort directly serves preservation by documenting the original game in complete detail before any modifications
- ✅ **II. C++ & SDL2 Native Stack** — Analysis tooling will be written in C++ where applicable; the eventual reimplementation target aligns with this principle
- ⚠️ **III. Community-Driven Development** — All findings and documentation will be shared with the OutpostUniverse community. Findings document will be posted for community review.
- ✅ **IV. Cross-Platform Support** — Analysis is platform-independent; documentation and tools will be cross-platform compatible
- ✅ **V. Modularity & Performance** — The reverse engineering deliverables (documentation per subsystem) are inherently modular

**Gates passed**: No violations — all principles are compatible with or directly served by this RE effort.

## Project Structure

### Documentation (this feature)

```text
specs/001-outpost-reverse-engineering/
├── spec.md                    # Feature specification
├── plan.md                    # This file
├── research.md                # Phase 0 output: consolidated research findings
├── data-model.md              # Phase 1 output: entity relationships and data structures
├── contracts/                 # Phase 1 output: interface contracts
│   ├── archive-format.md      # RESOURCE.000 format specification
│   ├── bldgbld-format.md      # BLDGBLD.DAT format specification
│   ├── bldgops-format.md      # BLDGOPS.DAT format specification
│   ├── tutor-format.md        # TUTOR.OPS format specification
│   ├── bitmap-format.md       # BITMAPS proprietary BMP format specification
│   ├── tilemap-format.md      # Tile map data structure specification
│   └── savegame-format.md     # Save game format (if discovered)
├── quickstart.md              # Phase 1 output: validation guide
├── checklists/
│   └── requirements.md        # Specification quality checklist
└── findings/                  # Research findings (cross-referenced)
    ├── 01-binary-structure.md
    ├── 02-archive-format.md
    ├── 03-data-files.md
    ├── 04-engine-architecture.md
    ├── 05-graphics-pipeline.md
    ├── 06-audio-subsystem.md
    └── 07-colony-simulation.md
```

### Source Code (analysis tools)

```text
tools/
├── resource-extractor/        # RESOURCE.000 extraction/repacking tool
├── bmp-converter/             # Proprietary BMP to PNG converter
├── dat-dumper/                # BLDGBLD/BLDGOPS/TUTOR data dumper
└── map-viewer/                # Tile map renderer from bitmap data
```

## Complexity Tracking

No Constitution Check violations — complexity is inherent to reverse engineering unknown 1994 proprietary formats. All complexity is justified by the research nature of this feature.

## Phase 0: Research — Deep Analysis of All Code and Assets

This phase is the primary focus. Every file and subsystem will be analyzed in depth before any downstream work.

### Research Area 1: OUTPOST.EXE Binary Analysis

- Disassemble the 16-bit NE executable using Ghidra with NE loader or IDA Pro
- Identify and document: WinMain, window procedure, main game loop, message pump
- Catalog all Windows API imports (USER32, GDI32, KERNEL32, multimedia, DIB)
- Map code segments and their purposes (init, simulation, rendering, UI, audio, AI)
- Identify all string references for game messages, UI labels, debug strings
- Locate and label the tile engine rendering functions
- Locate and label the colony simulation update functions
- Locate and label the resource management functions
- Locate and label the AI manager personality system
- Identify mouse input handling and UI interaction code
- Document the NE header, resource table, import table, and segment layout

### Research Area 2: RESOURCE.000 Archive Format

- Hex dump and analyze the file header (signature, version, directory offset)
- Identify the directory/index structure (file count, entry size, name storage)
- Document per-file metadata: offset, compressed size, uncompressed size, compression flag, filename
- Identify any compression or encoding scheme used on embedded files
- Write a specification document with byte-level field descriptions
- Extract ALL embedded files and verify against known formats

### Research Area 3: Game Data File Formats

- BLDGBLD.DAT: Map each byte field to building properties (cost, prerequisites, power consumption, production rates, worker requirements, build time)
- BLDGOPS.DAT: Map each byte field to operational parameters (maintenance cost, staffing needs, failure rates, upgrade paths)
- TUTOR.OPS: Reverse the scripting language (opcodes, conditionals, branching, dialog triggers)
- OUTPOST.INI: Document all configuration keys and valid values
- Cross-reference data values with known in-game behavior from the manual and gameplay

### Research Area 4: Bitmap Asset Analysis

- Analyze the structure of .BMP files in BITMAPS/ — most are exactly 308,278 bytes or 46,078 bytes (256-color palettized)
- Document: palette format (likely 256-entry VGA palette), pixel data encoding, any RLE or custom compression
- Identify tile coordinate mapping — how tile IDs map to bitmap filenames
- Document the UI element bitmaps (buttons, panels, cursor)
- Categorize all bitmaps: terrain tiles, building sprites, UI elements, disaster effects, orbital/space backgrounds

### Research Area 5: FLC Video System

- Document all FLC files in VIDEOS/ (30+ files, various sizes)
- Analyze the AAPLAY.DLL and AAVGA.DLL integration — how the game triggers video playback
- Identify trigger conditions for each video (launch sequences, colony events, disasters, ending sequences)
- Document the FLC-to-game integration (palette management, frame timing, audio sync)

### Research Area 6: Audio Subsystem

- Categorize all WAV files in MUSIC/: ambient sounds, UI beeps, alerts, voice (FEM*.WAV), music loops, event sounds
- Identify all MIDI files and their role (background music tracks)
- Cross-reference audio filenames with string references in the EXE
- Document the MIDI/WAV selection based on hardware configuration (base vs extended MIDI)
- Identify the Sierra audio driver system (SNDBLAST.DRV, ADL.DRV, MT32.DRV)

### Research Area 7: Tile Engine & Colony Simulation

- From the disassembly, document the tile map data structure (dimensions, tile ID storage, layer system)
- Identify coordinate system: isometric or top-down, tile size, screen-to-map coordinate transforms
- Determine the terrain types and their properties (passability, resource yield, buildability)
- Document the colony simulation update cycle: resource consumption/production, population growth/decline, morale calculation, disaster checks
- Identify all disaster types and their triggers (fires, earthquakes, plague, meteor strikes)
- Document the AI subsystem: AI manager personalities, colony management heuristics, rebel colony interactions
- Map the building tech tree from BLDGBLD.DAT and BLDGOPS.DAT — prerequisites, research requirements

### Research Area 8: INN & Multiplayer Components

- Analyze the Sierra INN components in the INN/ directory
- Document modem/serial communication setup
- Identify any LAN/modem multiplayer code in the main binary

### Research Deliverables

All findings consolidated into `research.md` with:
- Decision: what was determined
- Evidence: hex data, disassembly excerpts, cross-references
- Confidence level: confirmed / likely / speculative

## Phase 1: Design Artifacts

**Prerequisites:** Phase 0 research complete

### Data Model (`data-model.md`)
- Formal entity definitions for all discovered data structures
- Field-level format specifications
- State machine diagrams for simulation systems
- Relationship diagrams between entities (buildings → resources → colony state)

### Interface Contracts (`contracts/`)
- **archive-format.md**: Complete RESOURCE.000 binary format specification with extractor tool design
- **bldgbld-format.md**: BLDGBLD.DAT record structure and field meanings
- **bldgops-format.md**: BLDGOPS.DAT record structure and field meanings
- **tutor-format.md**: TUTOR.OPS bytecode/script specification
- **bitmap-format.md**: Proprietary BMP variant specification
- **tilemap-format.md**: In-memory tile map data structure
- **savegame-format.md**: Save game format if a save file structure is identified

### Validation Guide (`quickstart.md`)
- How to verify each reversed format using the analysis tools
- How to run the game in a Windows 3.1 VM to validate findings
- Hex comparison procedures for format validation
- Expected outputs from each analysis tool

### Agent Context Update
- Update AGENTS.md SPECKIT markers to reference this plan file


## Phase 2: Analysis Tooling Implementation

**Prerequisites:** Phase 1 design complete

### Tool 1: resource-extractor
- Command-line tool to list, extract, and repack RESOURCE.000 archives
- Verify round-trip (extract → repack → game still runs)

### Tool 2: bmp-converter
- Convert proprietary BMP variants to standard PNG
- Document palette parsing algorithm

### Tool 3: dat-dumper
- Dump BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS to human-readable format
- Verify field interpretations against disassembly analysis

### Tool 4: map-viewer (optional)
- Render raw tile map data using extracted bitmaps
- Verify tile coordinate system understanding

## Dependencies & Execution Order

### Phase Dependencies
- **Phase 0 (Research)**: No dependencies — can start immediately. **This is the primary deliverable and must be completed before any Phase 1 work.**
- **Phase 1 (Design)**: Depends entirely on Phase 0 completion — all design artifacts derive from research findings
- **Phase 2 (Tools)**: Depends on Phase 1 completion — tools implement the documented formats

### Execution Order
1. Phase 0: Deep research (all 8 research areas, analyzed in parallel where possible)
2. Phase 1: Design artifacts and contracts
3. Phase 2: Analysis tooling

### Parallel Opportunities
- Research Areas 1 (binary) can proceed in parallel with 2 (archive) and 4 (bitmaps)
- Research Areas 3 (data files), 5 (video), and 6 (audio) can proceed independently once the archive is extracted
- Research Areas 7 (engine) and 8 (INN) depend on binary analysis making progress first
- Phase 1 contracts are independent per format and can be authored in parallel
- Phase 2 tools are independent per format and can be implemented in parallel
