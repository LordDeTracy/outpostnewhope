# 13 — Media: sounds, voices, movies and their sequences (decoded 2026-10-18)

Verified against OUTPOST.EXE v1.51 and the CD's `MUSIC/` and `VIDEOS/`
folders by `rebuild/tests/test_media.cpp`. The rebuild's player is
`rebuild/src/data/flc.*`, `data/media.*`, `app/audio.*`, `app/movie.*` and
`app/sequence.*`.

## 1. Files

* `VIDEOS/` — 92 Autodesk Animator Pro FLC files (type `0xAF12`, 8 bits,
  100×124 to 640×480, 16–299 frames, 10,108 in all), each with a ring frame
  that turns the last frame back into the first. Speeds 42–142 ms a frame
  (71 ms in 81 files). They use only the chunks COLOR_256 (4), DELTA_FLC (7),
  BYTE_RUN (15), FLI_COPY (16) and PSTAMP (18). In `211.FLC` the FLI_COPY
  chunks declare 46,204 bytes for 220×210 = 46,200 pixels plus their 6-byte
  header, 2 short: the pixels run into the frame's padding.
* `MUSIC/` — 277 WAV (8-bit mono 22,050 Hz) and 32 MIDI files: the voice
  lines, the sound effects (many as both `.WAV` and `.MID`) and the music.
  `fem101.wav` is named by the EXE but missing (quirk Q64).

## 2. Names (catalog and voice table)

The bitmap catalog (findings/12-graphics.md §1) also names the sounds and
movies: kind 3 rows (467–503) are sounds, kind 4 rows (156–240) movies,
both with the name at `+2`.

| Ids | Kind | Names |
|---|---|---|
| 156–240 | 4 | `10.flc` … `453.flc` (85 movies) |
| 467, 468 | 3 | `mars.mid` (the title music), `0wscinit.mid` (a MIDI reset) |
| 469–503 | 3 | `alarm-m`, `alarm-d`, `alarm2`, `explode`, `earthqak`, `solrwind`, `scream'n`, `cheers`, `angrymob`, `launch`, `fr7lau`, `ni`, `boop`, `blstfurn`, `machwhir`, `avalanch`, `robodie`, `plntxpld`, `firbal`, `reent1`, `smlstp`, `m59_03`, `m59_04`, `m59_05`, `m59_07`, `m59_08`, `thunder`, `robocop`, `steam`, `turbine`, `m59_12`, `goes`, `fr7_1`, `fr7_2`, `fr7_3` |

`s3:84F8(id)` takes a kind 3 row; a name without an extension gets `.wav`,
or `.mid` when the options object (`+0x70`) asks for MIDI effects. The
file is looked up in the CD's `MUSIC` folder (`s3:8B14`).

The voice table at DGROUP `0x2E34` holds 216 far pointers: 0 an empty
string, 1–140 `fem1.wav`…`fem140.wav`, 141–215 `add1.wav`…`add75.wav`.
`s3:85BE(type, index)` takes entry `index`; type 2 makes `"male"` + the
name from its fourth character (`male1.wav` …), which the CD does not have.

## 3. The sound manager (`[0x2A0]`, `s2:5C34`)

A hidden `MciSoundWindow` receives the MCI notifications.

* `s2:5C5C(id)` plays catalog sound `id`; `s2:5C7C(type, index)` plays a
  voice line; `s2:5C9E(pair*)` takes the pair from memory.
* `s2:5CFE(file)` opens `waveaudio`, or `sequencer` for a `.mid` file,
  with MCI_OPEN_ELEMENT | MCI_OPEN_TYPE and plays it with MCI_NOTIFY. Waves
  need the options' `+0x72` (sound effects), MIDI files `+0x74` (music).
  **One wave and one MIDI file at a time:** a request while one of its kind
  plays (`+0x10`, `+0x12`) is dropped, not queued.
* `s2:5CB6` closes a device when its notification arrives.
* A sound queue (`+0x410`; `s2:A930` adds, `s2:A9EC`/`s2:AA28` play the
  next) is fed only by the debug dialog "Test of Sound Queue" (`s9:1DC3`…).

## 4. Movies

`s2:53AE(file, hwnd)` opens `mciaap.drv` with the file as element and the
window as parent (style `0x4000`), plays it with **MCI_WAIT** (the game
waits; CTRL-BREAK interrupts) and closes it.

A movie view (`s4:6A0E`, 78 subclasses `s4:6D02`…`s4:7D70`) keeps
`+0xEA` the next command, `+0xEC` the movie (catalog), `+0xEE` the sound
(catalog, 0 none) and `+0xE6/+0xE8` = 639×479, the screen it centres on
(`s4:6ADC` takes the screen size from registry 0x48). Its paint
(`s4:6A7A`) checks the options' `+0x20` (animated sequences): off, it is
done at once. Otherwise it hides the cursor, starts the sound (`s4:6B68`),
plays the movie and is done. Done (`s4:6BB6`) posts the next command, if
any, then command 121.

| Mode | Movie | Next | Sound | Mode | Movie | Next | Sound |
|---|---|---|---|---|---|---|---|
| 11 | 10 | 139 | (mars.mid) | 61 | 193 | 136 | |
| 12 | 20 | 208 | | 62 | 194 | 0 | |
| 13 | 30 | 209 | | 63 | 198 | 0 | |
| 14 | 32 | 210 | | 64 | 199 | 0 | |
| 15 | 33 | 212 | | 65 | 200 | 141 | |
| 16 | 34 | 218 | | 66 | 202 | 0 | |
| 17 | 35 | 220 | | 67 | 208 | 0 | |
| 18 | 36 | 211 | | 68 | 220 | 0 | |
| 19 | 37 | 219 | | 69 | 230 | 0 | |
| 20 | 38 | 165 | | 70 | 250 | 146 | |
| 21 | 40 | 178 | | 71 | 251 | 0 | |
| 22 | 42 | 0 | | 72 | 286 | 0 | |
| 23 | 70 | 192 | | 73 | 288 | 0 | |
| 24 | 72 | 193 | | 74 | 290 | 152 | goes |
| 25 | 80 | 128 | | 75 | 292 | 153 | |
| 26 | 82 | 195 | m59_05 | 76 | 294 | 238 | |
| 27 | 84 | 196 | | 77 | 300 | 156 | |
| 28 | 86 | 216 | | 78 | 302 | 157 | |
| 29 | 90 | 123 | | 79 | 304 | 158 | |
| 30 | 100 | 217 | | 80 | 306 | 0 | |
| 31 | 115 | 125 | | 81 | 310 | 0 | earthqak |
| 33 | 118 | 221 | | 82 | 330 | 0 | |
| 34 | 150 | 213 | | 83 | 340 | 0 | |
| 35 | 260 | 214 | | 85 | 350 | 0 | avalanch |
| 36 | 270 | 215 | m59_07 | 86 | 352 | 0 | avalanch |
| 37 | 400 | 238 | | 87 | 360 | 0 | solrwind |
| 53 | 130 | 129 | | 88 | 380 | 0 | explode |
| 54 | 160 | 205 | | 89 | 390 | 0 | |
| 55 | 170 | 131 | | 90 | 392 | 0 | thunder |
| 56 | 180 | 0 | | 91 | 398 | 0 | |
| 57 | 140 | 0 | smlstp, once a run (`s4:742E`) | 92 | 410 | 0 | |
| 58 | 190 | 133 | | 93 | 420 | 0 | |
| 59 | 191 | 134 | blstfurn | 94 | 440 | 238 | plntxpld |
| 60 | 192 | 135 | | 95 | 450 | 0 | solrwind |
| 96 | 451 | 0 | | 101 | 48 | 187 | |
| 97 | 452 | 0 | robocop | 102 | 49 | 0 | |
| 98 | 453 | 204 | fr7_3 | 103 | 50 | 189 | |
| 99 | 39 | 0 | | 104 | 52 | 0 | |
| 100 | 46 | 0 | | 105 | 62 | 0 | |

(Movies by file name; mode 11 starts mars.mid in `s2:15D4`'s case.)
`116.flc` (catalog 184) has no view; 110–114, 150B and 270NEW are not in the
catalog at all.

## 5. Story pages (modes 38–52)

`s4:C402` on `s5:0762` (a timed picture view): one or two strings (joined
by `s2:5FD8`), a picture (catalog kind 1), a voice line (type 1), a time in
ms and the next command. The background is `PALETTERGB(0x0B, 0x07, 0x10)`
(`s5:065E`); the text box is 400×30 (`+0x10E`). The voice plays on the
first paint (`s5:07AA`), followed by a request for mars.mid (`s4:C578`;
dropped while it plays, so the music runs on). With animated sequences off
the page posts its next command at once.

| Mode | Strings | Picture | Voice | ms | Next |
|---|---|---|---|---|---|
| 38 | 1842 | 1030.bmp | add1 | 8000 | 154 |
| 39 | 1843 | 1032a.bmp | add2 | 7000 | 160 |
| 40 | 1844 | 1036a.bmp | add3 | 13000 | 166 |
| 41 | 1845 | 1033a.bmp | add4 | 14000 | 161 |
| 42 | 1846 + 1847 | 1070a.bmp | add6 | 26000 | 191 |
| 43 | 1848 | 1260a.bmp | add7 | 9000 | 147 |
| 44 | 1849 | 1270a.bmp | add8 | 13000 | 148 |
| 45 | 1850 | 1082a.bmp | add10 | 9000 | 194 |
| 46 | 1851 | 1090a.bmp | add11 | 11000 | 197 |
| 47 | 1852 | 1034a.bmp | add12 | 10000 | 163 |
| 48 | 1853 + 1854 | 1037a.bmp | add13 | 25000 | 168 |
| 49 | 1855 + 1856 | 1038a.bmp | add15 | 23000 | 169 |
| 50 | 1857 | 1110.bmp | add16 | 10000 | 124 |
| 51 | — | 1119.bmp | — | 10000 | 201 |
| 52 | — | 1119.bmp | fem128 | 10000 | 207 (after the landing site, `s5:1CA4`) |

## 6. Commands and screens (`s2:0C60`)

The main window's command switch (case = command − 100) shows a screen in
one of two ways:

* **Replace** (`s2:2DCC`, `OpWnd::getKid` `s2:15D4`): the main view becomes
  the mode's view. 122→11, 123→30, 124→31, 125→33, 126→53, 128→34, 139→12,
  147→35, 148→36, 154→13, 160→14, 161→15, 163→16, 165→17, 166→18, 168→19,
  169→20, 176→37, 180→94, 191…197→23…29, 198→4, 200→3, 201→1, 202→5, 204→7,
  205→8, 206→9, 207→10, 208…221→38…51, 222→52.
* **Overlay** (`s2:2C4E`): a busy cursor, the colony view hidden, the simulation
  paused (`s8:B634`), the mode's view on top; an overlay already showing is
  replaced. Command 121 (`s2:2D22`) ends it (`s8:B68A`, then command 252).
  127→57, 129→54, 130→55, 131→56, 132…138→58…64, 140…146→65…71,
  149…153→72…76, 155…159→77…81, 162→82, 164→83, 167→87, 170→88, 171→99,
  172…174→89…91, 175→21, 177→92, 178→22, 179→93, 181…184→95…98,
  185…190→100…105, 223→85, 224→86.

Other commands: 203 New Game, 238 closes the main window (`WM_CLOSE`),
256 plays "cheers".

## 7. The Introduction

Program Control's Introduction (116, `s9:07DC`) asks first ("Intro Alert",
1878/1879: about 10 minutes; CTRL-BREAK skips a scene, ALT-F4 on a still
leaves) and posts 122. New Game (115) asks too ("MISSION BRIEF", 1999 with
2000 + 2001) before posting 203. Command 122 runs a chain of 37 screens,
23 movies and the 14 story pages, back to the main menu (201):

10, 20, page 38, 30, page 39, 32, page 40, 36, page 41, 33, page 42, 70,
72, 80, 150, page 43, 260, page 44, 270, page 45, 82, 84, 86, page 46, 90,
100, page 47, 34, page 48, 37, page 49, 38, 35, page 50, 115, 118, page 51.

Mode 1 (Program Control, `s5:08B6`) plays `0wscinit.mid` when it is made.
New Game's own screens (modes 6, 5, 3, 4, 9: the dialogs of registry 0x27,
0x25, 0x28, 0x26, 0x0A) tell no story; mode 5 says add5 (`s5:75F0`), mode
3 and the ship dialog add9 (`s4:EA66`, `s8:9294`), mode 4 fem122
(`s4:E2CC`), and choosing the planet plays "launch" (`s9:0170`).

## 8. Event movies (`s2:AB80`)

The message log's formatter (`s2:A1F0`) gives each entry a movie command,
`s2:AB80(code)` for codes 8..45. The entry's movie then plays as an overlay:

| Code | Command | Movies | Code | Command | Movies |
|---|---|---|---|---|---|
| 8 | 130 | 170, 180 (the Seed lands) | 27, 28 | 167 | 360 (wind, dust storm) |
| 9 | 127 | 140 (colonists land) | 29 | 170 | 380 (hot lab explosion) |
| 10 | 128 | 150, then the Introduction's page 43… | 30 | 172 | 390 |
| 11 | 132 | 190, 191, 192, 193, 194 | 31 | 173 | 392 (electrical storm) |
| 12 | 137 | 198 | 32 | 174 | 398 |
| 13 | 138 | 199 | 33 | 177 | 410 (solar flare) |
| 14 | 140 | 200, 202 | 34 | 179 | 420 |
| 15 | 142 | 208 | 35 | 180 | 440, then the game closes |
| 16 | 143 | 220 | 36 | 181 | 450 (solar flare) |
| 17 | 144 | 230 | 37 | 182 | 451 |
| 18 | 145 | 250, 251 | 38 | 183 | 452 |
| 19 | 149 | 286 | 39 | 171 | 39 |
| 20 | 150 | 288 (the new starship) | 40 | 185 | 46 |
| 22 | 155 | 300, 302, 304, 306 (meteorites) | 41 | 186 | 48, 49 |
| 23 | 159 | 310 (earthquake) | 42 | 188 | 50, 52 |
| 24 | 162 | 330 (volcano) | 43 | 190 | 62 |
| 25 | 164 | 340 | 44, 45 | 223, 224 | 350, 352 (avalanche) |

Codes 21 and 26 have none. The simulation posts 8, 9, 20, 22–24, 27, 29,
31, 33, 36, 44 and 45 (findings/08-simulation.md); the other codes have no
poster found in the EXE.

## 9. Other sounds and voices

Decoded but not wired yet: the star buttons' narration (`s9:2512`,
`s8:B922`: a per-star list entry's `+0x1C` voice); the alert windows
(`s9:8978` sound, `s9:89A4` voice, vtable methods); and dialogs that speak:
`s8:A396`/`A4EE`/`A6F4`/`A972` fem1–4, `s8:CB5C` fem9, `s8:C836` add32,
`s8:D2A2` add14, `s8:D400` steam + add56, `s8:DA68` scream'n + add63,
`s5:179C` add17, `s9:0000` add18, `s5:58CE` fem134, `s5:5BF2`
add60/add61, `s5:493C` plntxpld, `s8:CC00`.

## Open

The dialogs behind §9's voices; modes 7, 8 and 52 (dialog hosts and a
voiced view, `s4:CF74`); mode 34's own sound method; the MIDI-effects
option `+0x70`.
