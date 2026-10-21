# Outpost: New Hope 2.0

**An unofficial modern rebuild of Sierra's 1994 space-colony game *Outpost*, by LordDeTracy.**

You lead the last of humanity to a new star system after an asteroid ends life on Earth. Choose a star, pack the ship, pick a planet and landing site, put down the Seed, and grow a colony that can survive: power, life support, food, mines, factories, research, morale, and rebels who have plans of their own.

*Outpost: New Hope* plays like the original Outpost 1.51. Its game rules come from the decompiled version of the original game, not from guesses. Where the original game was left unfinished, the rebuild finishes it, and every such change is documented.

---

## Contents

- [What's new](#whats-new)
- [Getting started](#getting-started)
- [Controls](#controls)
- [How faithful is it?](#how-faithful-is-it)
- [Repository layout](#repository-layout)
- [The decompilation](#the-decompilation)
- [Credits](#credits)
- [Licence and disclaimer](#licence-and-disclaimer)

---

## What's new

**The original, as it was meant to be**
- The full start of a new game: the A.I.'s greeting and questions, difficulty, probes, ship configuration, the Interstellar Launch System checklist, the voyage, and the planet and landing site.
- The original's voice lines where the game had them but never played them. Examples: each star's narration, "The people love you / hate you, Commander", and the newspaper editor's interview.
- The Editor Interview: when morale falls, you can answer the press, and your answer moves morale.
- Rebels that land their own Seed, build, grow and trade with you.
- Ship Configuration works. As shipped, v1.51's ship screen could not load any cargo.

**Modern comforts**
- Full screen at your desktop resolution (F11 or Alt+Enter for a window).
- HD building, robot and terrain art from OutpostHD, plus terrain packs that change by planet and site, with hostile ground marked.
- A list-style build panel, an expanded map view and an interface click sound.
- A research window with the topics laid out as a tree, with descriptions, what each topic unlocks, and locked topics.
- Reports for population, colony totals, discoveries, the message log, and what is moving morale.
- Building windows that tell you why a building is waiting: not connected, no Air Shaft on its level, or short of a resource.
- Preferences and your Commander and A.I. names are remembered between sessions.

**Gameplay the original planned but never finished**
- **Second bases:** the planet window shows the other landing sites, and a Command Center can found a new colony on another site.
- **Nurseries:** with Embryology researched, residences raise children.
- **Breakdowns:** buildings break down from turn 20 and Repair Robots fix them.
- **Planet-specific disasters**, following the manual's table for each kind of world.
- **Underground exploration:** levels are hidden until a RoboDigger digs an Air Shaft down to them.
- Seed buildings, the Command Center and Air Shafts conduct like tubes.

Every change is listed, with the reason and the original code it replaces, in [`specs/003-original-rebuild/improvised.md`](specs/003-original-rebuild/improvised.md).

---

## Getting started

### Requirements

- Windows 10 or 11
- Visual Studio 2022 (C++ desktop workload) and CMake 3.20 or newer
- SDL2, SDL2_ttf, SDL2_image and SDL2_mixer. With [vcpkg](https://vcpkg.io) installed at `C:\tools\vcpkg`, the build finds them on its own:

```bash
vcpkg install sdl2 sdl2-ttf sdl2-image sdl2-mixer --triplet x64-windows
```

### Build

```bash
cmake -S rebuild -B rebuild/build-release
```

```bash
cmake --build rebuild/build-release --config Release
```

This builds the game (`outpost-rebuild.exe`), the test suite (`rebuild-tests.exe`) and a play-testing bot (`outpost-autoplay.exe`).

### Play

Double-click **`rebuild/Play Outpost.bat`**. It starts the game with the original files in `Outpost/` and keeps your saved games in `rebuild/saves/`.

You can also start it by hand:

```bash
rebuild/build-release/Release/outpost-rebuild.exe Outpost [save.OPS]
```

### Test

```bash
rebuild/build-release/Release/rebuild-tests.exe
```

---

## Controls

| Key or mouse | Action |
|---|---|
| Enter or Ctrl+T | Run a turn |
| F5 | Run several turns |
| Click a structure, then the map | Build |
| Click a building | Open its window |
| Right-click a building | Its menu: description, truck routes, trucks |
| Alt+0 to 4, PageUp/PageDown | Change level (surface and underground) |
| G | Planet and landing sites |
| Tab | Switch to another site |
| Arrow keys or middle-drag | Scroll the map |
| Mouse wheel | Zoom |
| Ctrl+S | Save |
| F1 | Help |
| F11 or Alt+Enter | Full screen or window |
| Esc | Skip a movie or close a window |
| Alt+X | Exit |

---

## How faithful is it?

The rebuild reimplements the original's turn engine step by step, with the same 15 simulation steps in the same priority order: setup, robots, production schedule, construction, research, AI managers, movement, population, mines, factories, power, events, morale, allocation and end of turn. It uses the original's random-number generator, its tables, and its building, research and star data, read from your copy of the game when it runs.

Where the original has a bug that shaped how it played, the rebuild keeps it. Those quirks are listed in [`specs/003-original-rebuild/quirks.md`](specs/003-original-rebuild/quirks.md).

Changes are tagged in the code and in [`improvised.md`](specs/003-original-rebuild/improvised.md):
- **IMPROVISED:** the original is unfinished or that part is not decoded yet, so the rebuild fills the gap.
- **IMPROVED:** a change asked for by players.

---

## Repository layout

| Folder | What it holds |
|---|---|
| [`rebuild/`](rebuild) | The game. `src/data` reads the original files, `src/sim` is the simulation, `src/app` is the screens, sound and movies. Also tests, the autoplay bot and assets (fonts, UI art, OutpostHD art, terrain packs, music). |
| [`Outpost/`](Outpost) | The original Outpost 1.51 CD files (`RESOURCE.000`, bitmaps, videos, music, manual), which the rebuild reads when it runs. |
| [`specs/`](specs) | The reverse-engineering findings, the rebuild plan, the quirks and the list of improvements. |
| [`reference/`](reference) | Data decoded from OUTPOST.EXE: annotated disassembly of all 9 code segments, resources, vtables, building classes and research tables, plus outside sources. |
| [`tools/`](tools) | The reverse-engineering tools: NE executable analyzer and disassembler, RESOURCE.000 (PKWARE DCL) extractor, map viewer and save-game readers. |
| `sync.ps1` | Refreshes this folder from the development folders. |

---

## The decompilation

OUTPOST.EXE v1.51 is a 16-bit Windows 3.1 program written in C++ with Microsoft Visual C++ 1.5. The project decoded about 3,400 of its functions, roughly 90% of its code. Some of the findings:

- The simulation is a priority queue of C++ "step" objects. Turns run only when the player asks.
- `.OPS` files are saved games, chunked as `SC001` plus `dcbSC##`. The tutorial is a saved game, not a script.
- 21 destination stars, 10 planet templates, 131 research topics in two trees, and 61 dialog windows.
- Several features were built into the program but never connected: the newspaper interview, the launch checklist, voice lines and rebel answer tables.

Start with [`specs/001-outpost-reverse-engineering/findings/00-ground-truth.md`](specs/001-outpost-reverse-engineering/findings/00-ground-truth.md). [`ERRATA.md`](specs/001-outpost-reverse-engineering/findings/ERRATA.md) lists what the early documents got wrong.

---

## Credits

- ***Outpost*** © 1994–95 Sierra On-Line, Inc. Version 1.51.
- **[OutpostHD](https://github.com/OutpostUniverse/OPHD)**: building, robot and terrain art and the interface click. © 2015–2020 Leeor Dicker and contributors, graphics by **White Claw**, BSD 3-Clause License ([`rebuild/assets/ophd/LICENSE-OutpostHD.md`](rebuild/assets/ophd/LICENSE-OutpostHD.md)).
- **[Kenney](https://kenney.nl)**: UI Pack Sci-Fi (CC0), recoloured.
- **Fonts**: [Orbitron](https://github.com/theleagueof/orbitron) and [Exo 2](https://github.com/googlefonts/Exo-2.0) (SIL Open Font License 1.1), and DejaVu Sans.
- **Terrain packs**: CC0 tile art; sources in [`rebuild/third_party/terrain-packs`](rebuild/third_party/terrain-packs).
- The **[Outpost Universe](https://forum.outpost2.net)** community, whose forum and wiki kept the game's knowledge alive.

---

## Licence and disclaimer

The rebuild's own source code, tools and documentation are released under the **GNU General Public License v3.0**; see [`LICENSE`](LICENSE).

The GPL does **not** cover:
- the original *Outpost* game files in `Outpost/`, which remain the property of their copyright holder;
- the third-party art, fonts and assets listed under Credits, which keep their own licences.

*Outpost: New Hope* is a fan project. It is not affiliated with, endorsed by, or connected to Sierra On-Line, Activision, or any current owner of the Outpost rights.
