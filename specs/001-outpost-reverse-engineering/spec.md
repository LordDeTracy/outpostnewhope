# Feature Specification: Outpost Reverse Engineering

**Feature Branch**: `001-outpost-reverse-engineering`

**Created**: 2026-06-09

**Status**: Draft

**Input**: User description: "Reverse engineer and completely take apart Outpost (1994) CD-ROM version in the Outpost folder"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Game Binary Analysis (Priority: P1)

As a reverse engineer, I want to fully disassemble and understand OUTPOST.EXE so that I can document its entry points, function calls, and overall program flow.

**Why this priority**: The game binary is the core of the entire project. Understanding its structure unlocks everything else.

**Independent Test**: A documented call graph and function map can be produced from static analysis of the 16-bit Windows 3.1 executable.

**Acceptance Scenarios**:
1. **Given** the OUTPOST.EXE binary (extracted from RESOURCE.000), **When** disassembled with a 16-bit Windows disassembler, **Then** a complete function map is produced with identified entry points for WinMain, window proc, and game loop.
2. **Given** the disassembly, **When** analyzed for import table, **Then** all Windows API calls and third-party DLL imports are cataloged.
3. **Given** the segmented memory model, **When** code and data segments are separated, **Then** each segment's purpose is documented.

---

### User Story 2 - Resource Archive Format (Priority: P1)

As a reverse engineer, I want to fully reverse the RESOURCE.000 archive format so that all embedded game assets can be extracted, inspected, and potentially modified.

**Why this priority**: The archive contains the game executable, data files, and configuration that all other analyses depend on.

**Independent Test**: A tool can be written to list, extract, and re-pack the RESOURCE.000 archive with documented format specifications.

**Acceptance Scenarios**:
1. **Given** the RESOURCE.000 file, **When** its header is parsed, **Then** the directory structure (file count, offsets, sizes, compression flags) is fully understood and documented.
2. **Given** the archive index, **When** each embedded file is extracted, **Then** its raw bytes match the expected file type signatures.
3. **Given** the full format specification, **When** a tool is written to repack the archive, **Then** the game runs correctly with the repacked archive.

---

### User Story 3 - Data File Format Reversal (Priority: P2)

As a reverse engineer, I want to reverse all game data file formats (BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS, OUTPOST.INI) so that every game parameter and script is fully understood.

**Why this priority**: These files control all game mechanics — building stats, game logic scripts, and tutorial flow.

**Independent Test**: A documented specification exists for each format, validated by parsing tools that can dump human-readable content.

**Acceptance Scenarios**:
1. **Given** BLDGBLD.DAT, **When** parsed, **Then** all building definitions (cost, prerequisites, production, maintenance) are documented.
2. **Given** BLDGOPS.DAT, **When** parsed, **Then** all building operational parameters are documented.
3. **Given** TUTOR.OPS, **When** parsed, **Then** the tutorial script format and all tutorial steps are documented.

---

### User Story 4 - Game Engine Architecture (Priority: P2)

As a reverse engineer, I want to document the game engine architecture including the tile engine, simulation loop, AI subsystem, and event system so that the complete runtime behavior is understood.

**Why this priority**: This is the bridge between understanding individual files and understanding how the game works as a whole.

**Independent Test**: Engine component descriptions can be validated by tracing execution paths in the disassembly.

**Acceptance Scenarios**:
1. **Given** the disassembled game binary, **When** the main loop is identified, **Then** the update cycle (input, simulation, render) timing and structure is documented.
2. **Given** the tile rendering code, **When** analyzed, **Then** the tile map data structure, coordinate system, and rendering pipeline are documented.
3. **Given** the colony simulation logic, **When** traced, **Then** resource flows, population modeling, morale calculations, and disaster events are documented.

---

### User Story 5 - Bitmap & Video Format Reversal (Priority: P3)

As a reverse engineer, I want to reverse the proprietary bitmap formats in the BITMAPS directory and the FLC video system so that all visual assets can be viewed, converted, and documented.

**Why this priority**: Understanding the graphics pipeline enables visual modifications and asset extraction for reference.

**Independent Test**: Converters can be written that transform the proprietary formats into standard PNG/MP4.

**Acceptance Scenarios**:
1. **Given** any .BMP file from the BITMAPS folder, **When** its header is analyzed, **Then** the image dimensions, color palette, pixel data encoding, and any compression scheme are documented.
2. **Given** any .FLC file from the VIDEOS folder, **When** analyzed, **Then** the frame structure, palette animation, and encoding format are documented.
3. **Given** the graphics pipeline code in the disassembly, **When** the bitmap loading and rendering functions are identified, **Then** the coordinate system and blitting operations are documented.

---

### User Story 6 - Sound & Music System (Priority: P3)

As a reverse engineer, I want to document how the game handles audio — WAV samples and MIDI music — so the sound system is fully understood.

**Why this priority**: Audio is integral to the game experience but lower priority than core engine and data.

**Independent Test**: Sound system documentation can be validated by tracing API calls in the disassembly.

**Acceptance Scenarios**:
1. **Given** the sound-related code in OUTPOST.EXE, **When** traced, **Then** the WAV playback, MIDI sequencing, and sound effect triggering mechanisms are documented.
2. **Given** the MUSIC directory files, **When** cross-referenced with the binary, **Then** the naming convention and triggering conditions for each sound file are documented.

### Edge Cases

- What happens when RESOURCE.000 uses compression methods that are not standard for the era?
- How does the game handle missing asset files gracefully (or not)?
- What happens with the INN (Sierra Internet Network) components when no modem is present?
- How does the 16-bit Windows memory model constrain the reverse engineering approach?

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST extract OUTPOST.EXE and all embedded files from RESOURCE.000
- **FR-002**: System MUST fully disassemble OUTPOST.EXE as a 16-bit Windows 3.1 NE (New Executable) format
- **FR-003**: System MUST catalog all Windows API calls from the import table
- **FR-004**: System MUST identify all code segments and their entry points
- **FR-005**: System MUST parse and document the RESOURCE.000 archive format header and directory structure
- **FR-006**: System MUST extract and document BLDGBLD.DAT building definitions
- **FR-007**: System MUST extract and document BLDGOPS.DAT operational parameters
- **FR-008**: System MUST parse and document the TUTOR.OPS script format
- **FR-009**: System MUST identify and document the main game loop structure
- **FR-010**: System MUST document the tile map data structures and rendering pipeline
- **FR-011**: System MUST document the colony simulation model (resources, morale, population)
- **FR-012**: System MUST reverse engineer the proprietary BMP variant format used in BITMAPS/
- **FR-013**: System MUST document the FLC video playback integration via AAPLAY.DLL
- **FR-014**: System MUST catalog all WAV/MIDI sound triggers and playback code

### Key Entities

- **RESOURCE.000 Archive**: Main game data archive containing the EXE and all data files; has a directory structure with file offsets, sizes, and possible compression flags
- **OUTPOST.EXE**: 16-bit Windows 3.1 NE format executable; the main game binary (~640KB)
- **BLDGBLD.DAT / BLDGOPS.DAT**: Building definition files; describe buildings, costs, prerequisites, production chains, and operational parameters
- **TUTOR.OPS**: Tutorial script file; controls the in-game tutorial flow
- **Tile Map**: The game world grid (likely 640x480 isometric or top-down); each tile is represented by a numeric ID referencing BITMAPS/*.BMP
- **Colony State**: The complete simulation state including resources (common metals, rare metals, food, energy), population, morale, infrastructure, and disaster timers

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: RESOURCE.000 format fully documented with a working extractor/repacker tool
- **SC-002**: Complete annotated disassembly of OUTPOST.EXE with all major functions identified and named
- **SC-003**: All data files (BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS) have documented format specs and parsing tools
- **SC-004**: The tile engine coordinate system, rendering pipeline, and map format are fully documented with diagrams
- **SC-005**: The colony simulation model (all resource flows, population/morale formulas, disaster events) is documented with equations and flowcharts
- **SC-006**: All proprietary BMP variants in BITMAPS can be converted to standard PNG format
- **SC-007**: FLC video system integration (AAPLAY.DLL) is documented with triggering conditions

## Assumptions

- RE tools available: IDA Pro or Ghidra with 16-bit x86 support for NE format analysis
- OUTPOST.EXE is a 16-bit Windows 3.1 NE executable compiled with Microsoft C/C++ 7.0 or Borland C++ (common for Sierra games of this era)
- RESOURCE.000 uses a Sierra-proprietary archive format (similar to other Sierra games of the period)
- BITMAPS use a modified BMP variant with 256-color VGA palette, possibly with RLE compression
- FLC files use Autodesk Animator FLIC format (standard for the era, played via AAPLAY.DLL)
- The tile engine is likely isometric given the original Outpost's visual style
- The game's resource model was documented in the original manual, providing expected behavior references during reverse engineering
