# 11 — New game: ship, orbit, landing (decoded 2026-10-12)

How OUTPOST.EXE v1.51 loads the colony ship and brings it down. Rebuild:
`rebuild/src/sim/ship_config.*` (dialog model), `Mothership` and `Orbitals`
in `rebuild/src/sim/simulation.*`, tests `rebuild/tests/test_ship.cpp` and
`test_saves.cpp`.

There is no tutorial logic in the EXE (no tutorial strings or code): the
tutorial is TUTOR.OPS, a saved game the player loads (`*.ops`, strings 1401
and 1868; loader `rebuild/src/sim/ops_loader`).

## 1. Ship Configuration Setup (dialog 4010)

Shown once by the voyage screen: a game view built by the view factory
`s2:15D4` (ctor `s4:E91E`, vtable `s4:EBD0`); its slot 13 `s4:EA66`, guarded
by `+0xEA`, plays resource 0x95 and opens window id 8 through the window
factory `s3:7300` (switch `s3:76BE`), whose case 8 builds the dialog class
(ctor `s8:9144`, vtable `s8:99A2`).

**Rows** (DGROUP `0x5A70`, 15 × 14 bytes; the count 15 is a constant in
`s8:993A`, `s8:98B4`, `s8:95FC`): `+0` spin control id, `+2` count control,
`+4` weight control, `+6` cost control, `+8` minimum, `+10` maximum, `+12`
kind. The weights and costs are the texts of the template's static controls
(read with GetDlgItemInt), not numbers in the code:

| Row | Label | Kind | Min–max | Weight | Cost |
|---|---|---|---|---|---|
| 0 | Colonists x 50 | 0x80 | 2–4 | 1 | 1 |
| 1 | Food | 0x81 | 1–20 | 1 | 1 |
| 2 | Life Support | 0x82 | 1–20 | 1 | 3 |
| 3 | Colonist Lander | 62 | 2–4 | 9 | 16 |
| 4 | Cargo Lander | 65 | 2–4 | 10 | 17 |
| 5 | Seed Factory | 10 | 2–2 | 10 | 18 |
| 6 | Tokamak Reactor | 19 (MShipTokamak) | 1–2 | 10 | 20 |
| 7 | Solar Satellite | 0x83 | 0–10 | 8 | 15 |
| 8 | Solar Receiver Array | 18 (SolrPwrRecvr) | 0–20 | 5 | 10 |
| 9 | Geological Probe | 0x84 | 0–4 | 4 | 14 |
| 10 | Weather Satellite | 0x85 | 0–4 | 4 | 12 |
| 11 | Interstellar Probe | 0x86 | 0–2 | 0 | 15 |
| 12 | Communications Satellite | 0x87 | 0–10 | 4 | 11 |
| 13 | Orbital Observer | 0x88 | 0–4 | 6 | 13 |
| 14 | ULBI Probe | 0x89 | 0–4 | 0 | 14 |

**Methods.**
* Init (`s8:9294`): the remaining weight (`+0x94`) and funds (`+0x96`) are
  read from the edits 4009 and 4008; then `s8:98B4` charges every row's
  count (`s8:9820(row, count, +1)`, skipped silently when it does not fit)
  and shows the two fields.
* Spin (`s8:94DA`): the row is found by spin id (`s8:993A`); the new count
  (±1) must lie in [min, max]; focus goes to the count; then
  `s8:9820(row, 1, ±1)`: weight × value × dir and cost × value × dir are
  taken off unless either field would go below 0 (16-bit signed).
* Launch button (`s8:977A`): with funds left, a message box asks (strings
  1498/1499, "You have funds remaining. Do you wish to continue without
  using them?"); then the dialog ends and `s8:95FC` runs.
* `s8:95FC`: a new list becomes the mothership's hold (`+0x0A`; the old one
  is not freed): for each row in order with a count n ≠ 0, kinds below
  0x83 are appended as `{kind, n}`; kinds 0x83 and up go to registry 9 with
  `s3:6566(0, n, kind)` (carried n, launched 0), the ULBI probe (0x89) with
  `s3:6566(n, n, kind)`. Then `PostMessage(main, WM_COMMAND, 237, 0)`.

**As shipped it cannot work.** The template's counts are the statics "0",
the edits 4009/4008 are empty, and no code anywhere writes 4009 or 4008
(searched as `push 0x0FA9`/`0x0FA8` over the raw code segments, including
the parts the disassembler left as data). The MicroSpinControl class
(registered `s2:818C`, window procedure `s2:84F2`) only records its buddy
and id on WM_CREATE (`s2:8214`); its text "min,max" is not used to set the
count. So the budget is 0, every first step up is refused, and Launch
leaves an empty hold. The rebuild reproduces this (`ShipConfig::open`) and
improvises a way in (`openImproved`, improvised.md I24). TUTOR.OPS (a
version-1 save) holds 9 life support, so earlier builds did have a budget.

## 2. Orbital objects (registry 9, ctor `s3:6326`, save chunk 0x07)

Seven slots at `+0x0A` for kinds 0x83..0x89 (`s3:6646`; other kinds have
none), each `{+0 carried, +2 launched}`:

| Function | Meaning |
|---|---|
| `s3:6566(this, launched, carried, kind)` | set both (ship launch) |
| `s3:65D0(kind)` | launched; what the simulation reads (solar receivers 131, `s7:4782` site generation, communications 0x87) |
| `s3:659A(kind)` | carried − launched: still aboard (UI, `s8:D384`, `s8:D53D`, `s9:058C`) |
| `s3:6604(kind)` | launches one (no check against carried), then `s3:1F62(0x15)` tells the views (UI, `s8:D4DF`, `s9:02C0`, `s9:0367`) |

The save (`s3:6372` / `s3:648A`) writes the 7 slots as they are. TUTOR.OPS:
1 carried and 1 launched of each kind 0x83..0x88, none of 0x89.

## 3. Landing and arrival (registry 8)

See 08-simulation.md "Mothership lists": `s3:9794` moves the landers to the
deployable list when the SeedCommand is finished, `s3:9766` (arrival, when
the Seed lands) applies the cargo damage `s3:A0A0` (quirk Q52) and wakes
50 colonists per colonist module left.

## 4. Galaxy, destination, planet (rebuild `src/sim/new_game.*`)

**The steps.** SCSelect (ctor `s7:532E`, calcMe `s7:53F4`) and SCGenKids
(`s7:521C`, calcMe `s7:5260`), both priority 12999, are queued by the UI and
followed by one turn (`s7:838E`: the turn steps, the queue drained, the turn
counter advanced) and the turn counter set back to 0 (`s7:8334`):

| Caller | Target |
|---|---|
| New Game, `s2:087E` | after the simulator (`s7:8128`) and two players (`s6:E2E0` type 8, i.e. `s7:1120`): the galaxy `0xFF000000` |
| Destination Launch, `s8:BC30` | star `0x01000000 + index`, the index of the checked button 416..436 (`s2:D818`, registry 0x36 `+0x0E`; same order as the star table) |
| Planet in orbit, `s9:0170` | planet `0x02000000 + index` |
| Seed landing, `s3:EC84` | the view's site (registry 0x2F `+0x20`); queued only, no extra turn |

SCSelect: the galaxy is made (`s6:E2E0` → `s6:EBEE`); a site is selected
with `s6:E44A`, anything else with `s6:E372`; for any target but a site
SCGenKids follows, which calls the target's slot 5. A planet also plays a
sound (`s3:82F8`).

**Selecting** (`s6:E372`): every other object in the target's table
(indices 1 up to the table's `+0x0A`, the highest index used + 1) is deleted
(`s7:13F6`) and cleared from the target's owner's children (slot `+0x18`;
the slot stays, at 0: TUTOR.OPS keeps 21 galaxy slots with only Sigma
Draconis, and 4 star slots with only planet 4). `s6:E44A` (a site) also
deletes every tile not owned by the site, with its building.

**Making** (the creators at `g_objectDb+0x2E`, set by the DB ctor `s6:D81C`:
type 1 `s6:EC36`, 2 `s6:ECAC`, 3 `s6:ED2C`, 4 `s6:EDC4`, 5 `s6:EE54`, 6
`s6:EF00`, 7 `s7:10B0`, 8 `s7:1120`). A star or planet takes the next free
handle; its id only picks the record (Tau Ceti's templates 1, 2, 4 become
planets 1, 2, 3).

| Slot 5 | Does |
|---|---|
| Galaxy `s7:1BE2` | a star for each id of its record (`s7:4574`: DGROUP `0x518C`, 21 ids), child slot i |
| Star `s7:5FF6` | a planet for each id of its record, child slot i, named "`%s %d`" (star name, i + 1) |
| Planet `s7:3058` | its sites (map work: `s6:ED2C`, `s7:4782`) |
| Site `s7:1972` | nothing |

**Records** (DGROUP, made fresh for each object by the data object at
`g_objectDb+0x52`, ctor `s7:44BE`):
* Star (`s7:4594`), table `0x51B8`, 21 rows of 18 bytes: name string id
  (1444..), planet count, position x, y, z (`s2:3E76`), 4 planet ids.
* Planet (`s7:4628`), table `0x5332`, 10 templates of 94 bytes: position,
  8 traits (`+0x06`, record `+0x12`), hostility (`+0x16` → `+0x0C`), dword
  (`+0x18` → `+0x0E`), pool size `+0x1C`, minimum and maximum sites `+0x1E`,
  `+0x20`, 15 site ids `+0x22` (the first is the pool's base). Record `+0` =
  the template id, `+2` (name) = 0. The number of sites is `random(min,
  max)`; the template's 15 slots are cleared (`memset` 30 bytes) and slot i
  gets `random(base, base + size - 1)`, redrawn while it equals one of the
  slots 0..i (slot i still 0, so 0 is never drawn); the record points at the
  template's list (quirk Q53).

| Template | Hostility | Dword | Sites (pool) | Used by |
|---|---|---|---|---|
| 1 | 9 | 66000 | 1 (29–30) | Tau Ceti, α Cen A, η Cas A, Sigma Draconis, HR 8832, δ Pav |
| 2 | 7 | 22000 | 2–3 (26–28) | Tau Ceti, ε Eri, Sigma Draconis |
| 3 | 2 | 30 | 8–13 (31–50) | Sigma Draconis, β Hyi, δ Pav |
| 4 | 1 | 4400 | 10–14 (1–24) | Tau Ceti, α Cen B, α Cen A, 70 Oph A, η Cas A, Sigma Draconis, 82 Eri, β Hyi, δ Pav |
| 5 | 10 | 370 | none | HR 8832 and, as their only planet, Barnard's Star, Wolf 359, Sirius, Ross 248, Procyon, Kruger 60, Alpha Aquilae |
| 6 | 10 | 110 | none | δ Pav |
| 7 | 10 | 10 | none | 70 Oph A, HR 7703 A |
| 8 | 8 | 6 | 5–8 (56–65) | 36 Oph A, 82 Eri |
| 9 | 4 | 4300 | 2–3 (66–69) | ε Eri |
| 10 | 3 | 4300 | 3–5 (51–55) | α Cen B, 36 Oph B |

Star rows (index: planet templates): 1 Tau Ceti 1 2 4 · 2 α Cen B 4 10 ·
3 α Cen A 1 4 · 4 ε Eri 2 9 · 5 70 Oph A 4 7 · 6 η Cas A 1 4 · 7 Sigma
Draconis 1 2 3 4 · 8 36 Oph A 8 · 9 36 Oph B 10 · 10 HR 7703 A 7 · 11 82 Eri
4 8 · 12 β Hyi 3 4 · 13 HR 8832 1 5 · 14–20 (Barnard's Star … Alpha
Aquilae) 5 · 21 δ Pav 1 3 4 6. Templates 5–7 have hostility 10 and no
sites. The 70 site ids are the site table the map
code reads (`s7:3B28`, findings/10-map.md).

## 5. The view (registry 0x2F, ctor `s3:E9E4`, save chunk 0x02)

Fields: `+0x16` current planet (setter `s4:04A4`, getter `s4:04B8`, object
`s3:ED3E`), `+0x1A` current star (`s4:04CA`), `+0x20` current site (SCSelect'd
when the Seed lands, `s3:EC84`), `+0x24` current colony (`s3:ED22`, notice
0x12), `+0x28` (`s3:EC68`, notice 0x13), `+0x34[0..8]` the disaster calendar.
The current planet is set by `SCSelect::shouldRun` (`s7:538A`, when the step
is queued: a star → `+0x1A`, a planet → `+0x16`) and by loading a planet
(`s7:2C8A`). SCMorale's hostility is that planet's record `+0x0C`.

**Disaster calendar** (the ctor): `+0x34` zeroed (9 dwords), base turns
`[1..8]` = 250, 350, 450, 450, 550, 650, 115, 150; then for i = 1..8:
`d = random(0, 29)`, and if `random(1, 2)` is odd `d = -d`; entry i = base i +
d. Chunk 0x02 does not save it, so every load draws a new one.

## 6. The screens from New Game to the planet (decoded 2026-10-13)

The main window (`s2:0C60`) turns commands 100..302 into actions (case =
command − 100); a screen command makes the main window's child view for a
mode (`s2:2DCC` → `OpWnd::getKid` `s2:15D4`, 105 modes, "Unknown target
mode" otherwise). Commands → modes: 198→4, 200→3, 201→1, 202→5, 204→7,
205→8, 206→9, 207→10, 208..221→38..51, 122→11, 123→30, 124→31, 125→33,
126→53, 128→34, 139→12, 147→35, 148→36, 154→13, 160→14, 161→15, 163→16,
165→17, 166→18, 168→19, 169→20, 176→37, 180→94, 191..197→23..29; 203 is
New Game (`s2:087E`, then mode 6); unlisted commands go to the current
view (its slot 0x40).

| Who | Posts | So |
|---|---|---|
| main menu `s9:07DC` | 203 | New Game: simulator, players, galaxy (§4); mode 6 (`s4:5840`) |
| mode 6 view `s4:58E2` | 202 | mode 5 (`s5:7554`) |
| star window `s9:2512` (star buttons, Launch 4017) | 200 | mode 3 (`s4:E91E`, the ship screen, §1) |
| Ship Configuration Launch `s8:95FC` | 237 | handled by mode 3 itself (`s4:EA0A`): posts 198 → mode 4 (`s4:E230`) |
| Destination Selection Launch `s8:B922` | 206 | SCSelect(star) and a turn (§4); mode 9 (`s4:E5DC`) |
| planet chosen in orbit `s9:0170` | — | SCSelect(planet) and a turn (§4) |

**The voyage is presentation only.** None of the views of modes 3, 4, 5, 6
and 9 call the simulation (no step is queued and no turn is run there);
the only simulation work between New Game and the landing is the three
SCSelects with their single turns, after each of which the turn counter is
0 again. The star table's voyage time is shown, not simulated. Arrival is
the Seed's landing (`s3:9766`, §3).

## 6a. Probes and the landing (decoded 2026-10-18)

Star Selection (4029, `s9:2512`): the 21 star buttons are auto check boxes
with no limit. Checking one takes a probe (`+0x92`, from the list's
`+0x28` = 4), enables Launch and plays the star's voice line (the list
entry's `+0x1C`); unchecking gives it back, and Launch is disabled again
when all are unchecked. "Probes Available" (4018) shows `+0x92` while it is
0..4. Launch: with probes below 0, string 1404 "Too many probe targets
selected!"; with probes left, 1405 asks first (voice add54); then the
checked stars go into registry 6 `+0x4E` (count `+0x56`), the probes left
into the list's `+0x28`, and command 200 shows the ship. The star data
window (4032) starts with mass and probability "Unknown" (the template's
text) and shows them for probed stars. Destination Selection (4031) uses
three-state buttons (style 5) kept to one by its code (`s8:B922`).

The Star System window's facts (4048, 437..445 by DGROUP `0x139A`) come
from the RCDATA sheet of the Sol body the planet's template copies
(`s3:4E9E`, id DGROUP `0x1384[template]`): 1 Mercury 333, 2 Venus 334,
3 Moon 338, 4 Mars 335, 5 Jupiter 336, 6 Saturn 337, 7 Neptune 339, 8 Pluto
340, 9 Ceres 341, 10 Phobos 342. The planet picker in orbit (registry
0x0B, `s3:4C3E`, `s3:4D5C`, `s3:4E08`) lists the star's planets as
pictures (catalog 437..446 by template, `s3:BFFA`) in a row and picks one
by its rectangle (PtInRect). The maximum digging depth is `s7:2FAC` by
hostility (0..1: 4 levels, 2..4: 3, 5..7: 2, else 1).

The landing site's window (`s5:1CA4`): a site the check `s3:4DF0` refuses
gets string 1578 "You don't want to land there!"; a good one posts 222:
mode 52 (`s4:CF74`, a story page: 1119.bmp, fem128, mars.mid, 10 s), then
207, mode 10, the colony.

## 7. The other registry chunks

* 0x05: the planet window (registry 0x2D, icon PLNTICON): the globe's
  rotation frame (0..15), mode and spin timer — UI state only.
* 0x15: "Build in Rebel Colony" (dialog 6234, registry 0x3F): the turn until
  which the rebels are busy with the player's last order.

## Open

* The views of modes 4, 5, 6 and 9 play video sequences (milestone 7);
  the rebuild's start screens show the story strings with pictures in their
  place (I38, `rebuild/src/app/start.cpp`).
* A save made by the original v1.51 to check version 4 against (see the
  save contract, next steps).

## 6b. The Orbital Launch System (dialog 358)

In orbit, beside the planet list and the planet window, `s9:0000` opens
dialog 358 and makes eight controls from DGROUP 0x5C60 (rows of 7 words
{x, y, id, kind, status control, ready string, movie command}): Solar
Satellite 359 (131, movie 186), Weather 360 (133, 171), ComSat 361 (135,
185), Orbital Observer 362 (136, 182), Deploy 363, Geological Penetrator
364 (132, 188), Launch Probe 365, Seed Factory 366 (kind 10, command 126).
It plays voice add18. `s9:0558` enables an item while `aboard(kind) > 0`
(status 1609 "Standby", else 1329 "None"); the Seed Factory is always ready.
`s9:0170`: choosing a satellite disables the other three and enables Deploy
(status 1606); Deploy plays sound 478 (not for the Observer), launches one
(`s3:6604`) and posts the movie command (only with Animated Sequences).
Launch Probe does the same for the penetrator and fills the selected
planet's 446 (the middle of `s7:2F1A`'s range) and 447 (`s7:2FAC`).
The Seed Factory runs SCSelect on the selected planet (which generates the
sites, so penetrators launched before it reveal more mines) and posts 126
(130.flc, then 160.flc), then the sites. Rebuild: `StartFlow::openLaunch`,
`launchCommand`, `launchSeed` (app/start.cpp; I57 for the control class).
