# Outpost: New Hope 2.0

by **LordDeTracy**

A modern rebuild of Sierra's *Outpost* (1994, version 1.51) for Windows,
written in C++20 with SDL2. The game logic follows the original program,
decoded from OUTPOST.EXE; where the original was unfinished, the rebuild
fills the gap and says so in
[`specs/003-original-rebuild/improvised.md`](specs/003-original-rebuild/improvised.md).

## What is here

| Folder | Contents |
|---|---|
| `rebuild/` | The game: source, tests, the autoplay test bot, fonts, UI art, music and terrain packs |
| `Outpost/` | The original Outpost 1.51 game files, which the rebuild reads when it runs |
| `specs/` | The decompilation findings, the rebuild plan and the list of improvements |
| `reference/` | Data decoded from OUTPOST.EXE (disassembly, resources, tables) and outside sources |
| `tools/` | The reverse-engineering tools (NE analyzer, resource extractor, map viewer, save readers) |

## Building

Needs CMake 3.20+, a C++20 compiler (Visual Studio 2022) and SDL2, SDL2_ttf,
SDL2_image and SDL2_mixer (for example through vcpkg at
`C:\tools\vcpkg`).

```bash
cmake -S rebuild -B rebuild/build-release
cmake --build rebuild/build-release --config Release
```

Then run `rebuild/Play Outpost.bat`. Saved games go in `rebuild/saves`.

## Credits

- *Outpost* © 1994-95 Sierra On-Line, Inc. (version 1.51).
- Building, robot and terrain art and the interface click from
  [OutpostHD](https://github.com/OutpostUniverse/OPHD), © 2015-2020 Leeor
  Dicker and contributors, graphics by White Claw, BSD 3-Clause License
  (`rebuild/assets/ophd/LICENSE-OutpostHD.md`).
- Fonts: DejaVu Sans, Exo 2 and Orbitron (free licences); UI pieces from
  Kenney's sci-fi UI pack (CC0); terrain packs from CC0 art.
