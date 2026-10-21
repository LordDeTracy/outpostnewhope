# 14 — External sources checked against v1.51 (2026-10-20)

The player supplied scans of the printed manual, screenshots of the original
game and a community tech tree; the copies are in `reference/external/`
(not original game data; for reference only, never loaded by the rebuild).
Each source is checked against the bytes of OUTPOST.EXE v1.51 and the
player's data files. Where they agree, the source confirms a decode; where
they differ, v1.51 wins for the rebuild and the difference is noted.

| File | What |
|---|---|
| `manual-p12-13-cargo.jpg` | manual pp. 12–13: the ship's cargo table |
| `manual-p24-25-…`, `-p26-27-…`, `-p28-29-…` | manual pp. 24–29: building tables (surface, underground) |
| `manual-planet-class-events.jpg` | manual: disaster frequencies by planet class |
| `original-main-screen-*.jpg` | the original's colony screen (Alpha Centauri B 1, turn 160; Delta Pavonis 3, turn 1) |
| `original-star-display-selection.jpg` | Star Display + Star Selection (probe launch) |
| `original-orbital-launch-star-systems.jpg` | Orbital Launch System + Star Systems window, on arrival |
| `OutpostTechTree_DRAFT-v1.1.pdf` | MichelGuenette's v1.1 tech tree draft (forum.outpost2.net topic 6287, 2019) |
| `wiki-outpost_1-structures.pdf`, `wiki-outpost_1-structuresdetails.pdf` | Outpost Universe Wiki prints (CC BY-NC-SA 4.0), §4a |

The manual itself (`Outpost/MANUAL/OUTP_GB.PDF`, the player's copy) was
read too: "Operating your labs" (pp. 80–81) and "Research Topics"
(pp. 103–105).

## 1. Ship cargo (manual pp. 12–13) — confirms dialog 4010; gives I24's budget

Weights and costs in the manual equal the texts of dialog 4010's controls
5000..5057 row for row (Colonists 1/1, Food 1/1, Life Support 1/3, Colonist
Lander 9/16, Cargo Lander 10/17, Seed Factory 10/18, Tokamak 10/20, Solar
Power Satellite 8/15, Solar Receiver Array 5/10, Geological Probe 4/14,
Weather Satellite 4/12, Interstellar Probe 0/15, Communications Satellite
4/11, Orbital Observer 6/13, ULBI Probe 0/14).

"You must, for example, take 100 colonists. At the point when you begin
packing … you will have 172 remaining funds, and a remaining weight maximum
of 78 units." The rows' minimums (2, 1, 1, 2, 2, 2, 1, rest 0) weigh 72 and
cost 128, so the intended budget is **150 weight, 300 funds**. v1.51 never
sets it (I24); the rebuild now uses the manual's numbers
(`ShipConfig::kImprovisedWeight/Funds`; I102 had 270 funds).

Also stated: one Colonist Lander carries 50 colonists (I102 pairs them), one
Cargo Lander carries cargo-weight 20 (not checked against the code yet).

## 2. Building tables (manual pp. 24–29) — confirms the DAT columns

Against the player's BLDGBLD.DAT / BLDGOPS.DAT:

* "# Turns to Build" = BLDGBLD field 37 (`word94`, the countdown of
  `s6:B8A4`): all rows match, including the Tokamak's "2 if brought, 9 if
  built" (MShipTokamak 19: 2, Tokamak 20: 9). One difference: UG
  Administration is 3 in the data, 2 in the manual.
* "# Ppl to Operate" = BLDGOPS People (`long[36]`): all rows match.
* "Morale Effect" = BLDGOPS word `+0x94` (field 37, `moraleEffect`): all
  match (Agri/SPEW/Nano/DIRT/UG Rec/Univ/Commercial/Park +1, Terraforming
  +5, UG Red Light +2, Hot Lab −1; Police "+1 or −1" is the police mode,
  Residential "+1 or −1" crowding).
* "Chance of Breakdown" (Agri 20, Command 50, Mine 30, SPEW 40, …) is in
  neither file (BLDGBLD field 38 is something else) and no code in v1.51
  breaks buildings down: the windows' "Breakdown Status:" is a label only.
  Not implemented in v1.51.

## 3. Disasters by planet class (manual) — not in v1.51

The manual's table (Solar Flare, Meteorite Strike, Earthquake, Volcanic
Eruption, Sand Storm, Electrical Storm for Mercury, Venus, Mars, Earth's
Moon, Phobos, Ceres, Pluto) has no counterpart in v1.51: the disaster
calendar is fixed (base turns 250, 350, 450, 450, 550, 650, 115, 150 ±29,
Hard only; findings/11 §5) and the planet RCDATA (333..342) holds only the
nine facts. Not implemented in v1.51.

## 4. Screenshots of the original

* **Star Display / Star Selection**: 21 stars with check boxes, "Probes
  Available: 4", Launch; the star panel shows Spectral Class, Distance,
  Mass, Travel Time and "'Habitable' planet probability: Unknown". Travel
  Time 81.98 for distance 16.0 is the star table's value (the rebuild's
  added stars follow `ly · 4.9 + 3.6`, `sim/modern_galaxy.cpp`).
* **Orbital Launch System + Star Systems** (on arrival): satellites with
  Standby/None, Deploy Satellite, Geological Penetrator, Launch Probe,
  Launch Seed Factory "Ready for Launch", "WARNING: Seed Factory MUST be
  Launched Last". The planet facts equal RCDATA 335 (Mars class: 0.53
  (6,794km), 0.11, 24.62h, 0.38, 1.52, 0.44, −23 (average), 5.02, Carbon
  Dioxide, Nitrogen); mining sites and digging depth read "Unknown".
* **Colony screen**: the planet window (top left: the globe of the planet
  landed on, its sites as yellow dots, arrows and a counter), the robot
  window (top middle: the selected robot type and a counter), the site map
  (top right: "Site 11", beacons red, the colony green), the isometric view
  with "SURFACE", the "NORTH" arrow and rotate/scroll triangles, and the
  turn number under the planet icon bottom right (001, 160).
* **Construction** (Delta Pavonis 3, turn 1): buildings going up show the
  construction site's picture, not their own. Decoded: building slot 5
  `s6:BC1C` returns `+0x0E` (66 Const / 107 UGConst, animated) in state 4
  and `+0x10` (the rubble `s6:BF76` drew: 72..74, 112..114 underground) in
  state 7. The rebuild's map now shows these (replacing I98's guess).
  In the same screenshot the Seed's four tubes are already finished on
  turn 1. In v1.51 they cannot be: the Seed puts its parts and tubes down
  alike (`s6:2F18` → SCInternalPutBldg, no flag), a tube needs 1 person to
  build (BLDGBLD People), the construction check covers resources 17..36
  People included (`s6:CB04`), and the colonists are in cryo until the
  Colonist Landers come down, so the tubes finish with the Seed Command
  (about turn 10). The screenshot is probably of v1.1 (CD) or earlier.

The planet window's sites suggest the intended play on several sites; the
code agrees that colonies on other sites were planned: placement measures
from the colony's hub on its own site (`s7:BCDE`, findings/10 §3d), a
Command Center is refused while a hub stands on another site (Q56), and
the help file's topics include Macromanagement, Transfers and Abandoned
Colony. How v1.51 switches the view to another site is not decoded.

## 4a. Outpost Universe Wiki: "Structures" and "Structure Details"

The player's PDF prints of `wiki.outpost2.net/outpost_1:structures` and
`…:structuresdetails` (2017/2025) reproduce the manual's tables and the help
file's building texts. Checked against v1.51:

* Agree with the decode: Tokamak 1000 power (`s6:4F30`); a Solar Receiver
  1000 with a Solar Power Satellite, two per satellite ("up to 2000");
  Robot Command operates ten robots (ten 12-byte slots, `s7:C9E4`); Storage
  Tanks hold 1000; Commercial draws 1 Luxury and the Red Light District 2
  (`s6:5412`, `s6:5B42`); a Command Center within 30 of another hub is
  refused; communications reach 30 tiles (1718); 25 people per residence
  (crowding `s6:A28A`); UG Administration takes 3 turns (the wiki's details
  page; its table and the manual say 2).
* University: "After 100 turns … stops increasing the Educational Level".
  This is the UGUniv field `+0x20`: 100 when finished, 200 with Advanced
  Teaching Methods (`s6:5F30`), counted down while operational
  (`s6:6008`). But education (`s8:45E4`) adds 2 per operational UGUniv
  (`s8:4D6E` filters on state 5 only) and never reads the counter: in v1.51
  a University never stops.
* Administration: "Light Industry … and Laboratories immediately adjacent
  to an Administration building" get +1 point per turn. Nothing in v1.51's
  lab (`s7:23E2`, `s7:2852`) or factory code looks at neighbours; the forum
  (topic 6287) measured no effect in v1.1 either.
* Births: the player remembered a research unlocking "nurseries". Neither
  OUTPOST.EXE (strings, dialogs) nor OUTHLP.HLP nor the manual has one.
  v1.51's births (`s6:A4EE`): one baby per operational UG Red Light
  District per turn, and every 12 turns (adults 17–75) / 5
  (`birthDivisor`, set only by the ctor `s7:3176`), both only while the
  residences are below 100 people each; research changes infant deaths
  (Embryology, "Infant Survival Improvement", −25) but not births. The
  manual's "six children per couple for 60 turns, then four" is not
  modelled either (turn 61 changes only the death tables). Outpost 2 has a
  Nursery building; the memory may be from there.
* Energy classes 0..5 per structure ("during construction … one level"
  more): not checked against BLDGBLD/BLDGOPS Power yet.

## 5. The research tree (forum + draft + manual) — decoded

The draft's numbers are **turns** measured in v1.1 at morale 999, not
costs: v1.51's costs give them exactly with 2 points per lab turn at morale
≥ 750 (`s7:2852`) and hot labs worked twice a turn (Q28), with the 25-turn
minimum: Medicine 50 → 25, Mathematics 100 → 50, Exobiology 200 → 100,
Alien Pharmacology and Robotics 1 75 → 38 (the poster measured 38),
Humanoid Workers 200 → 100, Nanomachines 200 → 50 (hot), Genetic
Engineering 100 → 25 (hot). The draft's discoveries per topic match
`s3:6CF8` (all 131 topics are checked against
`reference/outpost-exe/research-discoveries.json` by the rebuild's tests).

The forum's hidden-topic findings are decoded (2026-10-20). The tree window
(`s3:32F4`) lists a node's children only when the tree's slot 9 says the
node opens: main tree `s3:9488`, hot-lab tree `s2:EEAC`, both on player 1's
progress (`s3:A5CA`):

| Node | Opens when complete are |
|---|---|
| 50 Robotics 1 | 50 and 77 Robotics 2 |
| 63 Satellites and Probes | 63 and 78 Optics |
| 115 Biology (hot) | 9 Medicine |
| 119 Computer Science (hot) | 46 Artificial Intelligence |
| 121 Physics (hot) | 91 Quantum Mechanics |
| 125 Replicator | 124 Assembler, 125, 120 Nanotechnology 1 |
| any other | itself |

(The forum's v1.1 "Robotics 2 first hides them" may be a v1.1 difference;
v1.51 needs both.) The window lists 10 children a page. Rebuild:
`sim::topicOpens` (research.cpp), used by the research window (I103) and
the autoplay bot.

Other research details found on the way:

* `s3:A5EC` (a lab's topic changes): the old topic's `remaining`, if still
  negative, gets +1 and the new one's −1, so a not-started topic counts its
  labs as −1 − n. `researchStep` takes the cost for any negative value
  (`s7:23E2`). The rebuild sets the topic without this count (no effect on
  play; it shows in saves).
* The lab window's AI priority button (string 1596) is enabled only with
  discovery 30 "Multiple AI(5)" (`s3:AC62`), a topic in progress
  (`progress > 0`) that is not already a priority (`s3:A58A`) — `s9:51A6`.
* Forum (leeor_net, citing the Official Strategy Guide): Basic Research
  "reduces research times by a maximum of two turns"; v1.51's discovery 1
  takes 5 points off every started topic above 25 (`s3:A69C`).
* The draft and the manual list the hot-lab topics under Medicine,
  Artificial Intelligence and Quantum Mechanics, as `s2:EEAC` requires.
