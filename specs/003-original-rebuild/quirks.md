# Original Quirks Reproduced by the Rebuild

Behaviours of OUTPOST.EXE v1.51 that look like bugs or oddities. The rebuild
reproduces each one exactly, so the game plays like the original; a later
"fixes" option can switch them off individually. Each entry names the
original code and the rebuild test that pins it.

| # | Quirk | Original | Rebuild test |
|---|-------|----------|--------------|
| Q1 | The underground geothermal plant (UGGeoTherm) never produces power: its `power()` is an empty stub, although SCPower polls it | `s6:5682`, group 12 | "Power plants (SCPower over group 12)" |
| Q2 | Underground Tokamaks (UGTokamak, UGTokamak2) never produce power: they share the Tokamak class but are missing from group 12, the list SCPower polls | `s6:A9F4`, group 12 | same |
| Q3 | The Seed's command module (SeedCommand) never produces power; only the Command center (type 55) runs the shared 50-power, limited-life method | `s7:C12E`, group 12 | same; "Command Center power runs on a lifetime counter" |
| Q4 | An agri dome holding more than 1000 food keeps adding its full rate: the 16-bit `1000 - stored` wraps around | `s7:BF6E` | "Agri dome rate and storage" |
| Q5 | Colony allocation is all-or-nothing per resource and favours earlier tiles: a building gets its whole need of a resource or none of it | `s8:518C` | "Colony totals and allocation" |
| Q6 | SCSetup skips colonies of player 2 (the rebels, inferred), but SCPrelimAlloc processes them | `s6:ACEC`, `s6:A73C` | "SCSetup skips the rebel player's colonies" |
| Q7 | A suspended building (state 6) ignores every state change except a return to the state it was suspended from | `s6:BDAC` | "Building state machine and needs records" |
| Q8 | Smelter byproducts (PrecA/PrecB) are *set* in its output ledger, not added, so an earlier byproduct still waiting there is overwritten | `s6:3958` | "Smelter refines ore" |
| Q9 | A smelter reports itself full at ~500 units: its full check sums the output twice | `s6:3C60` | same |
| Q10 | SPEW 2/3 keep a division remainder for the next turn but also include it in this turn's output | `s6:3F04` | "SPEW turns sewage into MPG" |
| Q11 | A factory batch that completes while the factory's output is full is discarded | `s6:0582` | "Factory production" |
| Q12 | A factory with both product A and B set advances its progress twice per turn | `s6:0582` | (documented) |
| Q13 | Surface ActiveMines are skipped by the mine step (only UG mines extract; surface ore comes from robominers, presumably) | `s6:134A` | "Underground mine feeds the surface building above it" |
| Q14 | Rebel colonies never have children: SCPop computes their yearly births and then skips storing them (the rebel check jumps past `setNewborns`) | `s6:A61E` | "SCPop crowding, births and the rebels' missing births" |
| Q15 | Any population kill clears the death-roll remainders of *all* age groups, so a group's fractional deaths only accumulate while nobody dies anywhere | `s7:375A` | "Population tables and cohort operations" |
| Q16 | Group deaths are spread over every age of the group and clamped at 0 per age; deaths assigned to empty ages are simply not taken (e.g. a single group-3 death lands on age 17 and is lost if nobody is 17) | `s7:375A` | same |
| Q17 | Starvation kills a fixed 1–3 people per turn (1 on Beginner/Easy, 2–3 on Hard), however large the food shortfall; the shortfall is stored in SCStarve and never read | `s6:AF08`, `s6:AEC0` | "SCPop feeds the colony and queues SCStarve" |
| Q18 | Births, ageing and death rolls all stop while the residences are full (100+ people per residence, or no residence at all) | `s6:9EFC` | "SCPop feeds the colony and queues SCStarve" |
| Q19 | The school-leaving age is always 20: its update divides the education value by 10 and then compares it with thresholds 10..90 meant for the undivided value | `s8:45E4` | "SCMorale: crime, education and the morale sum" |
| Q20 | Crime *raises* morale: SCMorale adds crime/10 to its loss term with a plus sign, although the manual says crime hurts morale | `s7:EE1C` | "SCMorale: crime, education and the morale sum" |
| Q21 | The cheat dialog's "Force Educational Level" and "Force Crime Level" do nothing: SCForceMorale stores them but applies only morale | `s6:853E` | (documented; cheats not in the rebuild yet) |
| Q22 | Rebel colonies' morale, crime and education never change: SCMorale skips colonies of player 2 | `s7:ED9D` | (documented) |
| Q23 | Colonists who defect always go to colony 2, whichever colony the rebels actually own | `s8:0582` | "SCMorale: defections and the morale crisis" |
| Q24 | MPG covers a missing material inconsistently: the affordability check takes the whole need out of the MPG pool, the payment only the gap | `s6:CB04`, `s6:C952` | "SCProdSched: running costs, Beginner, upgrade discounts, luxury" |
| Q25 | Warehouse items of kind 15 count as Luxury but are never handed out to commercial buildings | `s6:6302`, `s6:6356` | same |
| Q26 | Suspended buildings resume in tile order, and a suspended warehouse's stock does not count, so a commercial building listed before its warehouse never runs | `s8:3FCA`, `s6:C0F0` | same |
| Q27 | Construction pays the full BLDGBLD needs every turn of building, not once | `s6:BE9E` | "SCConstruct pays the build needs every turn and counts down" |
| Q28 | Hot labs research twice per turn: SCFactory's skip list leaves them out, so they run in SCFactory as well as SCRchSched (the minimum-turns counter still drops once) | `s6:81E0`, `s6:AB68` | "A lab researches a topic: points, minimum turns, completion" |
| Q29 | Every player's research speed follows colony 1's morale, the rebels' included | `s7:2852` | "Research points follow colony 1's morale" |
| Q30 | Discoveries always go to player 1, even when the rebels complete the topic | `s3:A69C` | (documented) |
| Q31 | The plague only advances on the turns it can break out (every 123 turns from 150): its tick sits inside that check, so a 20-turn plague takes 20 × 123 turns | `s6:75BC` | "The plague" |
| Q32 | Treating more plague victims than there are people still kills one: the negative remainder is divided, found ≤ 0 and raised to 1 | `s8:3698` | same |
| Q33 | Disaster 8's 25% chance compares the 0..20 rescheduling number, so it always strikes | `s6:9114` | (documented) |
| Q34 | Disaster 7 is rolled twice (50% when scheduled, 50% again in the step) and rescheduled twice | `s6:78B8`, `s6:9114` | "Scheduled disasters and the morale crisis trigger" |
| Q35 | SCEndSim asks every trade agreement in state 2 or 3 whether it lapses and throws the answer away: only the random draws remain | `s6:6FF6`, `s2:DF4A` | "SCEndSim: trade agreements are aged, the answer is dropped" |
| Q36 | The victory message repeats for every player colony after the one where both a Mass Driver and a SpacePort have been seen (the loop does not stop) | `s6:6FF6` | "SCEndSim: victory needs seven topics, a Mass Driver and a SpacePort" |
| Q37 | Removing trucks from a tile does not lower its truck count (`+0x34`), which only ever grows | `s7:7C50`, `s7:6E9C` | "Units on tiles: robots, trucks, explorers" |
| Q38 | A warehouse's room is read once per factory, and every output item may fill all of it, so warehouses end up over their 100 units | `s8:0F8C` | "SCMove: factories unload into warehouses" |
| Q39 | A factory item that only partly fits loses the warehouse's whole room from its units, not the value of the kits moved | `s8:0F8C` | same |
| Q40 | An AI manager's step is shared by its two sequences; after "No AI Problems" switches to the shorter one, it reads past its end into the next table words once | `s7:E0D4` | "SCAiInput: AI managers build along their emphasis" |
| Q41 | The future-step list is released from its latest turn, so an earlier step would wait for a later one; every caller schedules for the next turn, so this never shows | `s6:D6B2` | (documented) |
| Q42 | SCMove also trucks, unloads factories and hands out robot kits in the rebels' colonies (it has no rebel test) | `s8:0C00` | (documented) |
| Q43 | A SeedCommand whose life runs out turns itself into a Command (type 55) with no life, which neither keeps the colony alive nor makes power | `s7:C10E` | "The SeedCommand runs out and becomes a lifeless Command" |
| Q44 | Once terraforming is done, every facility still switched on posts the "done" message again every turn | `s7:2A2C` | "TerraForm facilities bring the planet's atmosphere closer" |
| Q45 | A cargo lander's food supplies lose a quarter on Beginner as well: the unload treats Beginner as Easy | `s5:CAC2` | "A cargo lander unloads the mothership's hold" |
| Q46 | Underground Tokamaks reserve nothing when placed: their reserve only acts for the surface Tokamaks (group 41) | `s6:4DB2` | "Placement: slot 8 and slot 6 per class" |
| Q47 | The colony's tile list is re-sorted with the C runtime's qsort, which is not stable: tiles with equal keys are visited in an order that depends on the sort's history | `s1:4AEA`, `s5:C7FA` | "The runtime's qsort, port of s1:4AEA" |
| Q48 | The tile added last keeps its key-0 place at the front until the next add (setBuilding sets the real key without re-marking the list), so a building placed last can run first, e.g. a shop ahead of its warehouse never gets luxury | `s8:4B20`, `s5:C4F4` | "SCProdSched: running costs, Beginner, upgrade discounts, luxury" ('late') |
| Q49 | Tiles are never removed from the colony list and saved games can hold duplicates (6 in TUTOR.OPS colony 1); every colony loop processes a duplicate twice | `s8:5860`, `s5:C5B4` | (documented) |
| Q50 | Loading TUTOR.OPS, the alerts loader reads ten table words but the chunk holds seven; the last three come from the next tag's text ("dcbSC07": 0x6364, 0x5362, 0x3043), and the last lands in row 0, switching alert 1 on | `s3:0C7C`, `s2:7CFE` | "TUTOR.OPS other chunks: mothership, options, alerts, galaxy" |
| Q51 | Incidents clamp a building's neighbours to the map with its width on both axes (y is clamped to 299, not 149), and at an edge the clamped cells repeat, so the burning building and an edge neighbour are wrecked twice | `s6:6B40`, `s6:6DAA` | "Incidents near the map edge" |
| Q52 | Cargo damage on arrival reports a lost colonist module or lander even when none was lost: a count of 1 loses 1 / 2 = 0, but the report entry gets 1 | `s3:A0A0` | "Mothership: cargo damage on arrival (s3:A0A0, s3:9766)" |
| Q53 | A planet's sites are drawn into the static planet template itself: the template's site list is cleared and refilled, so the next game started in the same program draws that planet's sites from a pool that begins at the first site drawn last time | `s7:4628` | "Planet templates keep the drawn sites (Q53)" |
| Q54 | Saving a game drops a site's mine sites that explorers have not revealed yet: the save writes the revealed count (record +0x1A) and its positions, not the hidden count (+0x1C), so after loading the explorers find nothing more | `s7:56F6`, `s7:581E` | "A new game round-trips through a save" |
| Q55 | The UGGeoTherm can never be placed: its placement rule always refuses | `s6:567C` | "Placement: class rules" |
| Q56 | A Command center is refused (1711) when any colony's hub stands on another site, not only the player's. **Replaced by I110** (improvised.md): the rebuild skips colonies on other sites, so a Command Center can found a colony on a second site; the faithful refusal survives only as the comment in `CommandCenterBuilding::canPlace` | `s7:C52E` | "Placement: class rules" |
| Q57 | A RoboDigger can never dig down from dug ground underground: that direction is always refused (1708 only at the maximum depth, otherwise silently); only an air core (UGCore) can be dug down | `s5:DF10` | (documented) |
| Q58 | A MonoStation joins the straight monorail pieces and a MonoXFormer but not the crossing piece (24), which joins everything else | `s6:2290` | "Monorail pieces join by axis" |
| Q59 | A trip that starts its turn at a stop (e.g. a route whose first stop is the trip's own tile) jumps to cell (0,0,0): the step's new position starts zeroed and is taken over after the 1-point stop. The rebuild fixes this (I29) | `s8:6A0E` | (documented) |
| Q60 | A step onto a cell of an unknown kind costs -1, which always fits and gives a point back | `s8:6E1A` | (documented) |
| Q61 | A truck route visits each entry of a smelter's output once a turn: what one truck cannot take of an entry waits for the next turn even with trucks to spare; the last part-load's truck is not counted off the tile, so trucks come back one more than left | `s8:24E8`, `s8:26EE` | "Truck route carries smelter output to a tank" |
| Q62 | Monorail trains are unfinished: the rail group (0x42) leaves out the MonoStation, so a train never reaches a station; the junction masks and the train's load are empty stubs (every crossing turns a train back, its load is always 0); and nothing but loading a save puts trips on a station's waiting list. The rebuild completes them (I26–I28) | `s7:AFFC`, `s7:B142`, `s7:B13C`, `s6:1C1C`, `s6:20B0` | "A monorail train carries a waiting trip between stations" |
| Q63 | The road construction pieces (types 67..69) are named with internal identifiers: the name function returns the DGROUP strings "bidLRoadConst", "bidRRoadConst", "bidXRoadConst" instead of a string-table name | `s5:BD80` | "Building pictures, names and menus from OUTPOST.EXE" |
| Q64 | The voice table (DGROUP 0x2E34) names fem101.wav, which the CD does not have; a request for it plays nothing | `s3:85BE` | "Every movie view, story page and voice has its file on the CD" |
| Q70 | A robot sent back as a kit (RoboCmd slot flag 4) goes to the first warehouse of colony 1 with room, whatever colony the robot worked for; with none, the kit is lost | `s7:CD2D` | "A robot marked for return comes back as a kit" |
| Q71 | The rebels never build: every row of their per-difficulty answer tables is empty (count 0), except the -1 rows ("build the same") for SpacePort and Mass Driver on Hard. After their Seed and set-up they starve (better rebels: milestone 8) | `s5:B0AA` | "The rebels land their own Seed when the player lands" |
| Q72 | A RoboDozer always works 1 turn: its time comes from the tile's mark (`s5:ECB0`: 2,7 -> 2; 3,8 -> 3; 5,6 -> 1), but SCInternalPutBldg has already marked the tile 5 (6 underground) before the dozer reads it (`s6:8B3D`), so rough or hostile ground takes no longer | `s5:ECB0`, `s6:8B3D` | "The player's RoboDozer goes down on rough ground" (the rebuild times it by the ground instead: I59) |
| Q73 | A University stops teaching after 100 turns (200 with Advanced Teaching Methods) in the manual, but its counter (+0x20, `s6:5F30`/`s6:6008`) is never read: education adds 2 per operational UGUniv for ever (`s8:45E4`, `s8:4D6E`) | `s8:45E4` | — (findings/14 §4a) |
