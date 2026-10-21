# 12 — Graphics: bitmap catalog, building pictures, animation (decoded 2026-10-12)

Verified against OUTPOST.EXE v1.51 by rendering the tables from the
player's `BITMAPS/` files.

## 1. Bitmap catalog (far data segment 10, DGROUP `[0x63F0]`)

Row for id *n* at `(n + 1) * 16` (accessor `s3:830A`), 504 ids:

| `+0` kind | meaning |
|-----------|---------|
| 1 | a whole file: `+2` DGROUP offset of its name |
| 2 | a cut-out: `+6` sheet id (§2), `+8` x, `+0x0A` y, `+0x0C` w, `+0x0E` h (`s3:8170`) |
| 3, 4 | palette / text DIB (`vrpal.bmp`, `dibtext.bmp`) |

Known ranges: 13–76 research pictures (`580–649.bmp`, 145×120); 261–272…
planet-rotation frames (cut from sheet 1 `plntrot1.bmp`, 147×148); 277–346
site pictures `5xx.bmp`; 347–416 site terrain maps `5xxA.bmp`
(findings/10-map.md); 462–466 level strips (`surface`, `level`–`level4`).

## 2. Sheets (DGROUP `0x172A`, far pointers to names; loader `s3:878C`)

1 `plntrot1`, 2 `plntrot2`, 3 `830`, 4 `832`, 5–8 buttons, **9–14
`tile1`–`tile6`** (640×480 building sprite sheets), 15 `260`, 16 `276`,
17–20 `790`–`793`, 21 `651new`, 22–27 buttons/`trade`, 28– animation sheets
`456`, `461`, `465`, … (`4xx.bmp`).

## 3. Building pictures (`s3:81F6` → `s3:887A`)

`s3:81F6(type, kind)` caches one picture per building type (DGROUP arrays
`+4`, `+0x22C`, `+0x454` by kind). Types 1–9 (terrain) are built by
`s3:89F0`; types 10–127 by `s3:887A`:

* Static picture table at catalog segment `+0x3382`, row `type − 10`,
  10 bytes `{sheet, x, y, w, h}` — all from sheets 9–14.
* The picture is composed on a canvas the size of the larger of the
  building cut-out and the ground picture (`+0x14` of the cache): the
  ground is drawn centred at the bottom, then the building.
* `s3:866C` hands animated types (11, 15, 35?, 37–39, 51–52, 55, 73,
  115–120) a copy (`s2:676E`) so overlays can be drawn on it.

## 4. Animation overlays (`s2:87CC`, cache registry 0x2E)

Per-type frame ranges at DGROUP `0x3A4`, rows of 6 bytes `{first, last,
mode}` indexed by building type (types 11, 16, 30, 33, 35, 37–40, 42–43,
45–57, 66–69, 73, 83, 96–97, 101, 106–107, 109–110, 115–120). Frames are
sprites of the table at catalog `+0x1FA0` (10-byte rows `{sheet, x, y, w,
h}`, `s3:8018`), cached in the registry 0x2E object (0x806 bytes: 509
frame slots at `+0x12`). Modes (`s2:AE26`): 1 loop first..last; 2
ping-pong; 3, 4 hold. Per-frame offsets at DGROUP `0x3E8E` (`s4:214E`).
Sprites 509–626 of the `+0x1FA0` table cut the same building pictures but
lie beyond the cache; no code reaches them.

## 5. Map projection (`s2:87CC`)

The site view is isometric. With the view object (registry 0x2E) fields
`+0x0A` x origin, `+0x0C` y origin, `+0x0E` half width, `+0x10` half
height, a cell (x, y) is drawn at
`sx = (x − y) · halfW + originX`, `sy = (x + y) · halfH + originY`
(the overlay adds its frame offset; `+0x14 = sx + 0x20`,
`+0x16 = sy + offset − 0x25`).

## 6. Terrain pictures (`s3:89F0`)

The planet record's word `+0` (its id; `s7:2F0C`, `s7:54E0` → `s3:82F8`)
selects a terrain sheet at DGROUP `0x24BE` (far pointers; 1 `272.bmp`, 2
`268`, 3 `276`, 4 `260`, 8 `274`, 9 `266`, 10 `264`; 5–7 empty). Terrain
types 1–9 cut 107×46 pictures at DGROUP `0x2554` (rows of 10 bytes,
`{x, y, w, h}`). Underground the view (`s4:DD7C`, decoded 2026-10-20) draws an empty cell of terrain 7, 8, 9 (soft to solid rock) with pictures 6, 7, 8; picture 9, the smooth floor, belongs to dug ground (a tile of terrain type 9, kind 6), so undug rock looks dark and the diggers' work shows. (The rebuild drew kind k with picture k until then, which made the whole level look dug.) Palette
index 255 (white) is transparent on all sheets.

## 7. View constants (`s4:1FF4`)

The registry 0x2E view object starts with origin (267, 185) plus the
registry 0x48 offsets, and half a cell 53 × 23: cells are 106 × 46
diamonds. Overlay offsets (DGROUP `0x3E8E`, `{x, y}`) are per building
type (`s4:214E`, index = the animation object's `+0x2E`, its type).

## 8. Names (`s5:BD80`)

A switch over building type (and 128–137 for orbital items) loads string
1061.. (terrain), 1026 Seed Lander, 1048 Command, 1032 Agri. Dome, …;
types 67–69 return the DGROUP identifiers `bidLRoadConst`,
`bidRRoadConst`, `bidXRoadConst` (quirk Q63). The table is in
`rebuild/src/data/building_names.hpp`.

## 9. Menus and dialogs

Menus OPPOPMENU (main window: System, File, Control, Level, Help),
TILEMENU (a building: Building Description, Transit → Transfer assets,
Assign Trucks, Routing; Help), TPPOPMENU, SCPOPMENU, PCPOPMENU,
REPORTPOPMENU; accelerators OPACCEL (^T run a turn, F5 several, Alt-0..4
levels, Alt-X exit, F1 help). The rebuild reads them with
`data::MenuResource` and draws the dialog templates directly. Their
controls keep the templates' places; only the frames, buttons and fonts
are the rebuild's own: Kenney's UI Pack Sci-Fi (CC0, recoloured), Orbitron
and Exo 2 (SIL OFL 1.1), DejaVu Sans as the fallback (`rebuild/assets`).

## 10. Planet pictures (decoded 2026-10-13)

The globe in orbit turns through catalog ids 261..276 (16 frames, kind 2
cut-outs of sheet 1 or 2, 147×148). For a planet the sheet's file is not
`plntrot1`/`plntrot2` but the planet template's own pair: DGROUP `0x2526`
holds 4-byte entries per template (name offset at `+4·t`), 1 `204`, 2
`208`, 3 `220`, 4 `211`, 8 `222`, 9 `218`, 10 `212`, followed by `a.bmp`
(sheet 1, DGROUP `0x3194`) or `b.bmp` (sheet 2, `0x3196`). Templates 5..7
have no pictures. A site's picture is catalog 277 + site id
(`500.bmp`..`579.bmp`, kind 1). The Star System window (4048) leaves its top
78 dialog units empty for the globe.

The story pictures are listed in DGROUP `0x1D97`: `1032a`, `1036a`,
`1033a`, `1070a`, `1260a`, `1270a`, `1082a`, `1090a`, `1034a`, `1037a`,
`1038a`; the story text is strings 1842..1857. `1020.bmp` is the title
screen, `229.bmp` the star field, `1100.bmp` the ship and `1119.bmp` the
ship in orbit.

## 11. The structure icon bar (`s7:9296`, `s7:951A`)

`s7:9296` lists the free robot kits of the colony: kinds 1..3 (types
115..117, RoboDozer, RoboDigger, RoboMiner), counted by `s8:53BA` as
linked count − linked busy. `s7:951A` then lists the mothership's deployable
entries (list `+0x0E`) of kinds 62 (ColonistLander), 65 (CargoLander) and 19
(MShipTokamak), followed by the fixed entries and the build menu. The Seed
Lander is not on the bar (how the player puts it down is not decoded; the
rebuild's stand-in is I37).

## 12. Message log (registry 0x37, formatter `s2:A1F0`)

A log entry is `{code, value, colony}`; the formatter picks the strings by
code and formats the value and the colony's name into them:

| Code | Strings | Code | Strings |
|---|---|---|---|
| 1 | 1434 | 33, 36 | 1813 |
| 2 | 256 (not in the string table; I39) | 49 | 1810 |
| 5 | 1435 | 50 | 1812 |
| 6 | 1585 | 51 | 1814 |
| 7 | 1024 | 52 | 1816 |
| 20 | 1834 + 1835 | 53 | 1818 |
| 22 | 1811 | 54 | 1820 |
| 23 | 1815 | 55 | 1822 + 1823 |
| 24 | 1817 | 56..60 | 1825..1829 |
| 27 | 1819 | 61..69 | 1858..1866 |
| 28 | 1821 | 8, 9, 11, 14 | no text (not shown) |
| 31 | 1824 | | |

## 13. Names in windows

Resource names are strings 1462 + id for ids 1..31, MPG (33) 1494, Power
(35) 1495, People (36) 1496; 32 and 34 have none. Product names: 1..3 are
the robot kits' building names (types 115..117), the Truck 1511, the
Explorer 1406, product *p* ≥ 7 string 993 + *p*. A building window's
resource table (names 6040..6049, 6050..6056, 6080..6082; values
6083..6102, for resources 17..36) lies beyond the template's width and is
shown by "Resources>>" (6104); Colony Totals (4020) has a second column
(names 6106.., values 6126..) beyond its width for "More>>" (6105).

## 14. Preferences (dialog 4027, `s9:18A2`)

With a game running (difficulty, DGROUP `0x13AE`, not 0) the "Difficulty
Level" box shows two lines: 4064 = "Difficulty is " (1572) + Beginner,
Easy, Medium or Difficult (1568..1571, for 1..4), and 4063 = "Trucking is "
(1573) + "Automatic" (1574) or "Manual" (1575) by the automatic-trucking
flag. Without a game they stay empty.

## Not decoded yet

The map window's paint loop itself, the animation timer, the dialog
procedures that fill reports and building windows (I33), the structure icon
bar's level filter (I35), the Laboratory window's own drawing (I42), the
research tree window (I40).
