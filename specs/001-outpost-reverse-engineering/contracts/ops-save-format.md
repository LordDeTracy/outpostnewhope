# Contract: `.OPS` Save-Game Format (incl. TUTOR.OPS)

**Status:** Container format verified from code and data (2026-10-10).
Simulation chunks (0x03, 0x08–0x13) decoded and checked against TUTOR.OPS
(2026-10-12); the window/INI chunks are not decoded yet.

> This replaces the earlier `tutor-format.md`, which described TUTOR.OPS as a
> "tutorial script with 19 opcodes". It is not a script. `.ops` is Outpost's
> save-game extension (string 1868: `Outpost Files(*.OPS)|*.ops|`), and
> TUTOR.OPS is a saved game the tutorial starts from. The old document is
> kept in `contracts/superseded/` for reference only.

## Evidence

| Evidence | Location |
|----------|----------|
| Save dialog filter `Outpost Files(*.OPS)` / titles "Outpost Load Game", "Outpost Save Game" | strings 1868–1870 |
| Default pattern `*.ops`, INI key `savePath` | string 1401, DGROUP `11:147C` |
| Header format `SC%03d` → `SC001` | DGROUP `11:0314` |
| Chunk tag prefix `dcbSC` + format `%s%02x` | DGROUP `11:0336`, `11:0340`, `11:0347` |
| `WriteChunkTag(file, n)` = `sprintf(buf, "%s%02x", "dcbSC", n)` + write | `s2:7CAC` (15 callers) |
| Chunk-tag reader/checker (second `%s%02x` user) | around `s2:7E57` |
| Version mismatch message "Different file version encountered." | string 1748 |
| Save/IO errors "Unable to open selected file", "Error writing file", … | strings 1743–1747 |

## Layout

```
"SC001"                         5 bytes, ASCII, no terminator (format SC%03d, version 1)
repeat:
    "dcbSC" + 2 lowercase hex   7 bytes, chunk tag (no terminator)
    body                        variable; length is implied by the reader,
                                there is no size field
```

Chunks are written in the order the serializers are called, which is not
numeric order (`dcbSC0b` is last in TUTOR.OPS). There is no length prefix,
so a reader must understand each chunk, or scan for the next `dcbSC` tag
(safe in practice for TUTOR.OPS, but bodies could contain the bytes by chance).

## Chunk writers (from code)

| Tag | Writer | Segment role | Notes |
|-----|--------|--------------|-------|
| 0x01 | `s3:9900` | windows/INI | 28 B in TUTOR.OPS |
| 0x02 | `s3:ED58` | windows/INI | 32 B |
| 0x03 | `s3:6846` | build menu (registry 0x35) | 302 B: v1 129 + 21 words + mine type |
| 0x04 | `s3:5DC6` | player/prefs object (also owns the INI keys `aiName`, `playerName`) | `"Aphrodite\0Anonymous Bosch\0"` (AI name and player name, inferred) |
| 0x05 | `s3:3FC2` | windows/INI | 6 B |
| 0x06 | `s3:0AD2` | windows/INI | 68 B |
| 0x07 | `s3:6372` | windows/INI | 28 B |
| 0x08 | `s6:D7A0` | simulation | empty in TUTOR.OPS |
| 0x09 | `s7:5C1A` | handle allocator | 36 B: last index per object type |
| 0x0A | `s6:DCE2` | simulator | 146 B |
| 0x0B | `s5:A644` | view windows | 8 B, written last |
| 0x0C | `s6:DCE2` | simulator | count=1, star: "Sigma Draconis" |
| 0x0D | `s6:DCE2` | simulator | count=1, planet: "Sigma Draconis 4" |
| 0x0E | `s6:DCE2` | simulator | count=1, site: "Vulcan's Forge" |
| 0x0F | `s6:DCE2` | simulator | count=2, colonies: "Vulcan's Forge", "Rebel" |
| 0x10 | `s6:DCE2` | simulator | count=194 tiles |
| 0x11 | `s6:DCE2` | simulator | count=26 units (robots, trucks) |
| 0x12 | `s6:DCE2` | simulator | count=194 buildings |
| 0x13 | `s6:DCE2` | simulator | count=2 players |
| 0x14 | `s2:E5DA` | framework | not in TUTOR.OPS |
| 0x15 | `s2:C98E` | framework | not in TUTOR.OPS |
| 0x16 | `s2:BA38` | framework | not in TUTOR.OPS |
| 0x17 | `s8:7B20` | robots/reports | not in TUTOR.OPS |

Chunks 0x0C–0x13 start with a little-endian **dword object count**
(observed: 1, 1, 1, 2, 194, 26, 194, 2): one table per object type 1..8
(stars, planets, sites, colonies, tiles, units, buildings, players). Tiles
and buildings come in equal numbers because every building has its tile.

Chunks 0x14–0x17 are absent from the 1994-07 TUTOR.OPS but are written by
the 1.51 EXE. Their loaders return at once for a save older than version 2
(`[0x312] >= 2` checks), so a version-1 save loads without them.

## TUTOR.OPS chunk table

| Tag | Offset | Body bytes |
|-----|-------:|-----------:|
| dcbSC01 | 0x0005 | 28 |
| dcbSC02 | 0x0028 | 32 |
| dcbSC03 | 0x004F | 302 |
| dcbSC04 | 0x0184 | 28 |
| dcbSC05 | 0x01A7 | 6 |
| dcbSC06 | 0x01B4 | 68 |
| dcbSC07 | 0x01FF | 28 |
| dcbSC08 | 0x0222 | 0 |
| dcbSC09 | 0x0229 | 36 |
| dcbSC0a | 0x0254 | 146 |
| dcbSC0c | 0x02ED | 63 |
| dcbSC0d | 0x0333 | 145 |
| dcbSC0e | 0x03CB | 213 |
| dcbSC0f | 0x04A7 | 3,989 |
| dcbSC10 | 0x1443 | 7,484 |
| dcbSC11 | 0x3186 | 264 |
| dcbSC12 | 0x3295 | 5,410 |
| dcbSC13 | 0x47BE | 1,888 |
| dcbSC0b | 0x4F25 | 8 |

## Versions (decoded 2026-10-12)

The header digits are the save version (`s2:71xx`: "SC001" → 1, "SC004" →
4, anything else → 1, kept at DGROUP `0x312`). v1.51 writes version 4
(`s2:6D8A`). TUTOR.OPS is version 1, an older format: the loaders read it
through `version >= 2` branches (fields added later are absent) and
translate its numbering:

* building types (`s2:73EA`, also the placeholder and sprite words and
  the build menu): 1–23 same, 24–60 +3, 61–62 +4, 63–102 +8, 103–128 +9,
  anything else 0;
* products / unit kinds (`s2:72BC`): 4 and 5 swap, 1–19 otherwise the
  same, anything else 0.

TUTOR.OPS checks this: its build menu, translated, is exactly the menu
v1.51's constructor starts with.

## Value formats

| Name | Bytes | Writer / reader |
|---|---|---|
| word, dword | 2, 4 LE | `File_write` `s2:7E1C` / `File_read` `s2:7DEE` |
| string | bytes up to and including the NUL (a null string is one NUL) | `s2:7C2A` / `s2:7C6E` |
| position | 3 words: x, y, level (map) or star-map x, y, z | `s2:7B4C` / `s2:7BC8` |
| handle list | dword n, n dword handles (0 = empty slot) | `s2:7954` / `s2:76E4` |
| ledger | word n slots, then n × (word key, dword value); key 0 = free slot | `s2:7A22` / `s2:77CC` |
| item list | word n, n × 5 words {+4, product A, product B, quantity, units} | inline |

## Simulation chunks (decoded 2026-10-12)

`s6:DCE2` writes, `s6:DEF2` reads. A table chunk (0x0C–0x13) is a dword
count, then each object's slot-3 save (slot-4 load); the reader
(`s6:E628`) constructs the class first (buildings: it reads the type word
and builds that class, `s7:07AC`), then registers the object.

| Chunk | Content |
|---|---|
| 0x03 | build menu (registry 0x35, `s3:6846` / `s3:68C6`): v1: 129 words of v1 types + 21 words of v1 products, translated; v4: 138 + 21 words. Then a word: the mine type offered (+0x148, 51 ActiveMine, 52 after discovery 25 or 37), type-translated |
| 0x08 | (`s6:D7A0`) only the tag |
| 0x09 | handle allocator (`s7:5C1A`): 9 dwords, the last index used per object type 0..8 (TUTOR.OPS: 0, 21, 4, 12, 2, 372, 26, 373, 2), so new objects continue from them |
| 0x0A | dword turn (80 in TUTOR.OPS), word (db+8), then the galaxy object (DGROUP `0x5166`, type 0xFF): named object + word n + n words (star ids 1..21) |
| 0x0C | stars: named object, string name, position (star map), word n, n words |
| 0x0D | planets: named object; record (+0x10): word string id, string name, position, word hostility (+0x0C), dword (+0x0E), 8 words (+0x12), word n (+0x22), n words (+0x24); then words +0x14, +0x16 (atmosphere: 1 terraforming, 2 done), +0x18 (terraforming turns left, 10000), +0x1A |
| 0x0E | sites: named object; record (+0x10): word site id, word, string name, word n (record +0x1A, the revealed mine sites), n positions (record +0x16); then the object's map size (+0x14) and depth (+0x1C). The record's +0x1C (mine sites still hidden, after the n revealed ones in the list) is not saved, so a saved game loses them (findings/10-map.md) |
| 0x0F | colonies (`s8:5E16` / `s8:6118`): see below |
| 0x10 | tiles (`s7:7418` / `s7:778C`): see below |
| 0x11 | units (`s6:B282` / `s6:B2C8`): DbObj + word kind (a product id: v1 translated) |
| 0x12 | buildings (`s6:B5EC` / `s6:B81A` + class methods): see below |
| 0x13 | players (`s7:227A` / `s7:232E`): named object, then remaining[131], discoveries[67], priority[5], minTurns[131], workedThisTurn[131] (words) |

**DbObj** = dword own handle, dword owner handle (`s7:16D6`); a **named
object** adds its child handle list (+0x0C, `s7:1978`).

**Colony:** DbObj; the tile list (+0x0C): dword n, n × (dword tile
handle, word key), empty slots included (the colony's sorted tile order,
findings/08-simulation.md); dword hub (+0x10); words morale, previous
morale, defection tier; dword defection amount; words crime, education;
37 dwords of totals (+0x26); 21 dwords units and 21 dwords busy (+0x14E,
+0x1A2; v1 indices translated as products); population (`s7:32E4`: 91
dwords of ages, 6 words death rate, 6 words death chance, 6 dwords
carries, word birth divisor, dword life-support deaths; v ≥ 2: dword
+0x170, word school-leaving age); string name; word populated; dword
player; words nanotech, free resources, +0x208, crowding morale, crowding
flag, explorers; v ≥ 2: word plague turns, dword plague treated.

**Tile:** DbObj; position (+0x0C); words +0x12, +0x14 (set together by
the constructor); dword building (+0x16); handle list units (+0x1E);
ledgers Bas (+0x22) and Alloc (+0x26); dword colony (+0x2A); v ≥ 2: word
+0x32, word trucks (+0x34), handle list route (+0x36), item lists +0x3A
and +0x3E.

**Building:** word type (read by the table reader); DbObj; words type,
placeholder (+0x0E), sprite (+0x10) (all type-translated), state (+0x12),
saved state (+0x18), network flags (+0x1A). Then, by state (the saved
state when suspended): 1–3 a word (+0x14, robots); 4 the build countdown
(BLDGBLD copy +0x94, the copy being remade from the table); 5 the BLDGOPS
copy's +0xA4, +0xA6 (product A, translated), +0xA8, +0xAA, +0xAC; 9 the
copy is remade, nothing read. Then the class's own fields:

| Class (types) | Fields |
|---|---|
| CommandCenter (11, 55) | dword +0x20, word life (+0x24) |
| Smelter (12, 53, 54) | dwords minB/minC carries (+0x20, +0x24), ledger output (+0x28) |
| Factory (14, 30–32, 91, 92) | word progress (+0x20), item list output (+0x22) |
| Mine (16, 51, 52, 96, 97) | word life (+0x22), word ore cursor (+0x20); v ≥ 2: word DGROUP 0x4FBC |
| Lab (40, 41, 93–95) | word topic (+0x20) |
| TerraForm (45, 46) | 5 words of systems (+0x20) |
| Police (49, 50, 108, 109) | word mode (+0x20) |
| RoboCmd (56, 57) | 10 slots: dword expiry, word product (translated); v ≥ 2: word flag, dword (v1: flag 3, 0); v ≥ 4: word DGROUP 0x5812 (first RoboCmd) |
| Warehouse (58, 59) | item list (+0x20) |
| MonoStation (63) | v ≥ 2: a list (`s8:774E`, not decoded) |
| UGUniv (84–86) | word +0x20 |
| robots (115–117, 119–121) | v ≥ 2: dword +0x20; RoboDoze: word +0x24; RoboDig: words +0x24, +0x26 |

All other classes save only the base part. Every simulation chunk of
TUTOR.OPS parses to its exact end with these layouts
(`tools/ops-reader/ops_objects.py`).

## Registry chunks (decoded 2026-10-12)

The save order is the registry list at DGROUP `0x320` (ids 8, 0x2F, 0x35,
2, 0x2D, 0x2B, 9, 0x3B, 0x3F, 0x40 → chunks 0x01–0x07, 0x14–0x16), then
`s2:6EEE`'s group: 0x08, 0x09, 0x0A, 0x0C–0x13, 0x17, 0x0B. The tag reader
`s2:7CFE` searches for each tag **from the start of the file** and leaves
the file just after it, so chunk order does not matter on load, and a
loader that reads past its chunk's end silently takes the next tag's bytes.

| Chunk | Content |
|---|---|
| 0x01 | mothership (registry 8, `s3:9900` / `s3:9B72`): three lists (+0x0A hold, +0x0E deployable, +0x12 cargo damaged on arrival), each word n + n × {word kind (type-translated), word count}; then words +0x1A arrived, +0x1C cryo countdown, +0x1E cryo colonists |
| 0x02 | view (registry 0x2F, `s4:0000`): dwords +0x16, +0x1A, +0x20, +0x24; word n (+0x30), word +0x32; n positions (+0x2C). No version branch |
| 0x04 | options (registry 2, `s3:5E56`): string AI name, string player name, word difficulty (DGROUP `0x13AE`); v ≥ 2: word automatic trucking (+0x82) |
| 0x05 | the planet window (registry 0x2D, ctor `s3:3E3C`, icon PLNTICON; `s3:3FC2` / `s3:404A`): words rotation frame +0x24 (0..15), mode +0x6A (1 forward, 3 back, 2 and 4 stopped; 4 to start), timer running +0x7E. TUTOR.OPS: 0, 3, 0 |
| 0x06 | alerts (registry 0x2B, `s3:0C7C`): word n, n × {word +4, dword +6 (a colony handle in TUTOR.OPS)}; words +0x0E, +0x10; 10 words of the alert table (DGROUP `0xE28`, 8-byte rows: v ≥ 2 word i → row i; v1 word i → row `s2:738C`(i): 1→3, 2→4, 3→5, 4→6, 5→8, 6→9, 7→10, others → 0); v > 2: 3 words, rows 16–18. TUTOR.OPS holds only 7 of the 10 words: the last three are read from the text "dcbSC07" (rebuild quirk Q50) |
| 0x07 | orbital objects (registry 9, `s3:6372` / `s3:648A`): 7 slots for kinds 0x83..0x89 (+0x0A…+0x22), each word carried + word launched (findings/11-new-game.md §2). No version branch |
| 0x0B | `s5:A644` writes only the tag; `s5:A65E` reads 4 words from a version-1 save, nothing from v ≥ 2 |
| 0x14 | trade agreements (registry 0x3B, `s2:E5DA` / `s2:E70E`), v ≥ 2: word n, n × {dword +4, dword +8, word state +0x0C, dword since-turn +0x0E, word +0x12} |
| 0x15 | "Build in Rebel Colony" (dialog 6234, registry 0x3F, `s2:C98E` / `s2:C9D4`), v ≥ 2: dword +0x0E, the turn until which the rebels are busy with the player's last order (turn + build time, `s2:C79A`; checked by `s2:C83A`) |
| 0x16 | AI managers (registry 0x40, `s2:BA38` / `s2:BB5E`), v ≥ 2: word +0x22, word n, n × {string name, word active, dword colony, word emphasis}; the step (+0x10) is not saved |
| 0x17 | vehicle manager (`s8:7B20` / `s8:7C02`), v ≥ 2: word n, n trips (the trucks' list +0); word m, m monorail trains (list +4, class `s7:AE6C`, `s7:B768` / `s7:B836`): dword station tile +4, position +8, word direction +0x0E, word k, k riders (list +0x10). A rider, like a station's waiting trip, is also in list +0, so it is written twice (rebuild: improvised.md I30) |

**Trip** (0x2A bytes, `s8:75CA` / `s8:774E`, v ≥ 2): handle list route
(+0x04), dword home tile (+0x08), cargo table (+0x0E, `s2:7A22`: word n, n ×
{word key, dword value}; n = 0 for none, and the reader makes no table
then), word Bas resource (+0x0C), word product A (+0x12, product-translated),
word product B (+0x14), dword quantity (+0x16), position (+0x1A), dword next
stop (+0x20), words movement points (+0x24), trucks (+0x26), waiting for a
train (+0x28). MonoStations (type 63) save their own trips the same way from
version 2: word n, n trips.

## Writing saves

`rebuild/src/sim/ops_writer` writes version 4 ("SC004") in the order
above with the loaders' layouts; what the simulation does not model
(galaxy, names, view and UI chunks, vehicle trips) is carried from the
loaded save (`OpsExtras`). TUTOR.OPS written as version 4 loads back to
the same state and writes the same bytes again; both copies then run
identically (`rebuild/tests/test_saves.cpp`). The random-number seed is
not part of a save (the game seeds it from the clock at startup).

## Next steps

1. ~~Load these chunks into the rebuild~~: `rebuild/src/sim/ops_loader`
   loads TUTOR.OPS (tests `rebuild/tests/test_saves.cpp`); after a turn its
   76 operational buildings are all still running.
2. ~~Decode the window/INI chunks and write saves~~: done above.
3. Save a game in the original (DOSBox-X + Windows 3.1) to check version 4:
   no such save exists in the repository (only TUTOR.OPS, version 1). Put
   saves made by the original in a folder and run
   `OUTPOST_EXTRA_SAVES=<folder> rebuild-tests "[original]"`: each must load,
   run 5 turns and save back stably, and the first difference between the
   rebuild's write and the original file is reported.
