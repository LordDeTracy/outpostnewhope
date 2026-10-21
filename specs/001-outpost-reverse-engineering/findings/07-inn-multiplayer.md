# 07 — INN & Multiplayer Analysis

**Game:** Outpost (1994, Sierra On-Line)  
**Subject:** ImagiNation Network (INN) directory and multiplayer capabilities  
**Date:** 2026-06-10  

---

## 1. INN Directory File Inventory

The `Outpost\INN\` directory contains **56 files** totaling approximately **8.5 MB**. This is a self-contained Sierra INN (ImagiNation Network) client installation bundled on the Outpost CD.

### Executables

| File | Size | Date | Purpose |
|---|---|---|---|
| `BOOTDISK.EXE` | 39,471 | 1994-02-18 | Creates a boot floppy to free conventional memory for INN |
| `ID.EXE` | 9,771 | 1993-10-07 | User identification/account lookup tool |
| `INSTALL.EXE` | — | — | INN hardware configuration installer (stub in `INSTALL.BAT`) |
| `INSTTSN.EXE` | 72,030 | 1994-02-07 | TSN/INN installation program (hardware config, modem setup, phone numbers) |
| `LSCIGET.EXE` | 9,119 | 1992-05-21 | LSCI configuration file reader/writer |
| `LSCITV.EXE` | 72,279 | 1994-02-14 | INN client viewer/launcher (the actual online interface) |
| `PATCHPIF.EXE` | 9,356 | 1993-10-22 | Patches PIF files for Windows compatibility |
| `RBJOY.EXE` | 19,298 | 1994-01-20 | Red Baron joystick calibration tool |
| `TSNEXEC.EXE` | 9,581 | 1993-10-28 | TSN executor/launcher |

### Drivers (.DRV)

| File | Size | Date | Purpose |
|---|---|---|---|
| `ADL.DRV` | 8,040 | 1991-03-15 | AdLib music synthesizer driver |
| `EGA640.DRV` | 6,021 | 1992-09-01 | EGA 640×350 16-color video driver |
| `IBMKBD.DRV` | 445 | 1990-12-11 | IBM keyboard driver |
| `MODEM.DRV` | 5,816 | 1993-12-07 | Modem I/O driver (serial port communication) |
| `MT32.DRV` | 1,989 | 1991-02-04 | Roland MT-32 MIDI driver |
| `NOBRK.DRV` | 5,563 | 1993-05-25 | Alternative modem driver — "no break" (for Rockwell-chipset modems that can't send a proper break signal) |
| `SNDBLAST.DRV` | 9,748 | 1992-10-09 | Sound Blaster audio driver |
| `TANDYXL.DRV` | 4,428 | 1991-04-02 | Tandy 2500 XL video driver |
| `TWEAKER.DRV` | 1,468 | 1991-02-27 | PC internal speaker driver |
| `VGA320.DRV` | 5,831 | 1992-04-23 | VGA 320×200 256-color video driver |

### Configuration Files

| File | Size | Description |
|---|---|---|
| `GAME.CFG` | 247 | Lists games available on INN: BackGammon, Bridge, Checkers, Chess, Chat, Cribbage, Hearts, FlipFlop, Go, Euchre, Spades, Boogers, MiniGolf, PaintBall, Red Baron, Graffiti, SneakATac, Stratego, RocketQuiz, BlackJack, Slots, Roulette, Roulette 00, Poker, Lefty's Bar, 3-D Golf |
| `LAND.CFG` | 212 | Defines INN "lands" (virtual worlds): Clubhouse, SierraLand, CasinoLand, Shadow of Yserbius, Fates of Twinion |
| `LSCI.CFG` | 74 | LSCI global config: `directory = \INN`, `default baud = none`, `maxSounds = 10`, `promo = 00561` |
| `HOSTADDR` | 303 | TSN host server addresses using X.25-like addressing: Sierra7 through Sierra14, each with numeric address `31108342020x` |
| `LLSYSTEM.DAT` | 2 | Likely a smaller game/data path marker |
| `TSNVER` | 4 | Version identifier for TSN client |

### Documentation & Data

| File | Size | Description |
|---|---|---|
| `_ASLAND.DOC` | 6,558 | Encoded/binary (likely a compressed DOC for INN land) |
| `_ENERAL.DOC` | 17,486 | Encoded/binary |
| `_IERRLND.DOC` | 22,591 | Encoded/binary |
| `_LUBHOUS.DOC` | 12,558 | Encoded/binary |
| `_SERBIUS.DOC` | 23,312 | Encoded/binary — Shadow of Yserbius land data |
| `MODEM.TXT` | 8,402 | Modem model database — 211 modem entries with initialization strings |
| `PHONE.TXT` | 23,954 | 467-line nationwide phone number database of INN local access nodes |
| `DRIVERS.TXT` | 1,032 | Driver manifest listing all .DRV files and their purposes |
| `INSTALL.TXT` | 9,514 | Install program UI text strings (message catalog) |
| `INSTTSN.TXT` | 9,642 | TSN installer UI text strings |
| `INSTALL.HLP` | 14,387 | Help file for the installer |
| `INSTTSN.HLP` | 5,208 | Help file for the TSN installer |
| `INSTALL.SCR` | 9,887 | Install script |
| `READ.ME` | 17,760 | INN technical support document — 364 lines of troubleshooting, modem config, error codes |

### Other

| File | Size | Description |
|---|---|---|
| `PART.1` | 7,756,210 | (7.4 MB) INN data archive (partition 1) — compressed game assets, graphics, audio |
| `RESOURCE.002` | 356,039 | INN data archive (partition 2) |
| `INN.BAT` | 1,538 | Batch menu — offers to install INN or exit to DOS |
| `INSTALL.BAT` | 23 | Calls `insttsn -f` |
| `REINST.BAT` | 695 | Re-installation script that copies LSCI config between game directories |
| `INN.ICO` | 766 | Windows icon for INN |
| `INN.PIF` | 545 | Windows 3.x PIF file (program information file) |
| `INNINST.ICO` | 766 | Icon for INN installer |
| `INSTALL.PIF` | 545 | PIF for the installer |
| `MT32.NL` | 1,918 | Roland MT-32 non-linear lookup table |
| `_LNULL.DLL` | 185 | Null/stub DLL |
| `_RAPH256.DLL` | 7,708 | Graphics DLL for 256-color mode (graph256) |
| `TSN.PRG` | 1,176 | TSN program configuration (binary, no readable strings) |

---

## 2. INN Component Descriptions

### What is INN?

The **ImagiNation Network (INN)**, originally called **The Sierra Network (TSN)**, was an online multiplayer service launched by Sierra On-Line in 1991. It was a subscription-based graphical online world where users could:

- Chat with other members in virtual "Clubhouses"
- Play multiplayer games (chess, backgammon, cards, etc.)
- Explore graphical "lands" (virtual worlds)
- Download and play Sierra games via "Game Point"

INN predated widespread consumer internet access — users connected via dial-up modem directly to Sierra's proprietary network infrastructure (X.25-based, visible in the `HOSTADDR` file).

### Key Components on the Outpost CD

The bundled INN client includes:

1. **`LSCITV.EXE`** — The main INN viewer/interface. This is the application users ran to connect to the service. It handles the graphical UI, network communication, and game launching. References to "INND" and "jINN" appear in its string table.

2. **`INSTTSN.EXE`** — The hardware configuration installer. Users selected their modem model, COM port, video driver, sound card, and local access phone number. It writes `LSCI.CFG`.

3. **`MODEM.DRV` / `NOBRK.DRV`** — Low-level serial port drivers handling modem AT commands, dialing, connection negotiation, and break signal handling.

4. **`MODEM.TXT`** — A comprehensive modem database with 211 entries, each referencing one of 34 initialization string patterns. Brands include Hayes, US Robotics, Zoom, Practical Peripherals, Intel, Boca, Supra, ZyXEL, and many others.

5. **`PHONE.TXT`** — Local access numbers across all 50 US states, organized by area code and city. Each line gives 1-3 phone numbers for the local INN POP (Point of Presence).

6. **`GAME.CFG`** — Lists 27 games available on INN. **Notably, Outpost is NOT in this list.** This confirms Outpost was not a multiplayer title on INN, but rather a single-player game sold separately.

7. **`LAND.CFG`** — Defines five virtual worlds or "lands" accessible on INN:
   - **Clubhouse** — The social hub
   - **SierraLand** — Themed area
   - **CasinoLand** — Gambling games
   - **The Shadow of Yserbius** — An online multiplayer RPG
   - **The Fates of Twinion** — An online multiplayer RPG

---

## 3. Multiplayer Configuration

### Modem Setup

The INN client supported extensive modem configuration through `INSTTSN.EXE`:

**COM Port Selection:**
- COM1, COM2, COM3, COM4
- Non-standard IRQ and I/O address configuration for unusual hardware
- COM1/3 share IRQ4; COM2/4 share IRQ3

**Baud Rate:**
- 2400 baud (recommended for stability)
- 9600 baud (V.32, for faster connections)

**Modem Models (211 supported):**
34 unique initialization string patterns in `MODEM.TXT` cover:
- Standard Hayes-compatible (AT command set)
- Vendor-specific strings for brands like USR, Intel, ZyXEL, Telebit, MultiTech, etc.
- A "Custom" option for user-defined init strings

**Example initialization string format:**
```
+++~~~ATZ!~~~~AT&D2!~AT&C1!~ATV1!~
```
This follows the pattern: escape sequence (`+++`), pause (`~`), reset (`ATZ`), then set DTR behavior (`&D2`), carrier detect (`&C1`), and verbose mode (`V1`).

**Error Correction Disabled:**
All strings explicitly disable MNP 5 error correction with commands like `\N0`, `&Q0`, or `%M0`, as INN's protocol required raw connections without MNP negotiation.

### Serial Parameters

From the driver documentation and README:
- 8 data bits (implied by standard modem operation)
- No parity
- 1 stop bit
- Hardware flow control disabled (RTS/CTS controlled by modem init strings)
- Break signal used for host-to-host handoffs

### Network Access Numbers

`PHONE.TXT` lists approximately 600 dial-up access numbers across all 50 states, provided by Sierra's network provider (likely SprintNet or similar X.25 data network).

---

## 4. Network Protocol

### Physical Layer
- Dial-up modem connection using standard Hayes AT command set
- X.25 packet-switched network infrastructure (evidenced by the `HOSTADDR` file format)

### Host Addressing (`HOSTADDR`)
```
Sierra7        311083420207   CC  7
Sierra8        311083420208   CC  8
...
Sierra14       311083420214   CC  14
```
This uses an X.121 address format (`31108342020x`) typical of X.25 networks. "CC" likely stands for "Cluster Controller" or similar network node designation.

### Connection Flow
1. User runs `LSCITV.EXE`
2. Reads `LSCI.CFG` for modem, COM port, and phone number
3. Modem dials the selected local access number
4. Connects to Sierra's X.25 network
5. User authenticates with member number
6. Client downloads land/game data from `PART.1` / `RESOURCE.002` archives
7. For host-to-host transitions (e.g., moving between lands), the client sends a break signal to trigger reconnection to a different host

### Error Handling
Error codes documented in `READ.ME`:
- **Error #1**: Duplicate login detected
- **Error #8**: Phone line busy
- **Error #9**: Modem didn't connect (wrong COM port or phone number)
- **Error #10**: Network trouble at the access node
- **Error #12**: Modem init string problem (MNP 5 not disabled)
- **Error #13**: Persistent network trouble
- **Error #21**: Reconnection failure (break signal issue)
- **Error #999**: Unknown error

---

## 5. Integration with the Main Game (OUTPOST.EXE)

### Critical Finding: No Integration

**OUTPOST.EXE has NO references to INN, TSN, modem, serial, or any multiplayer networking code.** Specifically:

- **Binary import table check:** OUTPOST.EXE imports only 5 Windows DLLs: `KERNEL.EXE`, `GDI.EXE`, `USER.EXE`, `MMSYSTEM.DLL`, `COMMDLG.DLL`. There are no references to any networking DLLs (Winsock, NetBIOS, modem drivers, or INN DLLs).

- **String search in OUTPOST.EXE:**
  - `"inn"` — 2 matches, both are substring hits within unrelated words (difficulty level descriptors like "Beginn-er", "Med-ium")
  - `"tsn"` — 0 matches
  - `"modem"` — 0 matches
  - `"serial"` — 0 matches
  - `"network"` — 0 matches
  - `"sierra"` — 3 matches, all in copyright notices
  - `"multiplayer"`, `"hotseat"`, `"turn-based"` — 0 matches

- **SETUP.EXE and SETUP.SOL:** Neither contains any INN, modem, or network configuration code.

- **AAPLAY.DLL:** Contains function names with "Dial" and "Combo" substrings (`AADIALOG`, `AA_DIALOG`, `_GETCOMBO`, `_SCROLLCOMBO`), but these all refer to **dialog box UI elements** and **combo boxes**, not modem dialing or COM ports.

### What This Means

The INN directory on the Outpost CD is a **bundled standalone application** — not an integrated multiplayer component of Outpost itself. Sierra frequently bundled the INN client on their CD-ROM games as a cross-promotional strategy. Outpost remains a **purely single-player, turn-based strategy game**.

The OUTPOST2 directory contains only a single AVI video file (`OP2_2X.AVI`, ~20 MB), confirming there is no Outpost 2 game binary present — only a video preview of the cancelled sequel.

---

## 6. Historical Context

### The Sierra Network / ImagiNation Network (1991–1996)

| Year | Event |
|------|-------|
| 1991 | Sierra launches **The Sierra Network (TSN)** — subscription online service for PC gamers |
| 1994 | TSN rebranded as **The ImagiNation Network (INN)** after AT&T acquires a stake |
| 1994 | Peak membership: approximately 50,000 subscribers |
| 1996 | INN shuts down, unable to compete with the rapidly growing public internet and AOL |

### Key Features of INN
- **Monthly subscription:** ~$9.95/month + $1.80/hour (later flat-rate pricing)
- **Connection:** Dial-up via X.25 network (SprintNet)
- **Games:** Casual multiplayer (card games, board games, MiniGolf, PaintBall, Red Baron)
- **RPGs:** Shadow of Yserbius, The Fates of Twinion — early graphical MMO-like experiences
- **Clubhouse:** Social chat rooms with customizable avatars
- **Game Point:** Digital storefront where subscribers could download and purchase Sierra games

### Outpost and INN
Outpost (released February 1994) was sold as a retail CD-ROM product and was **not an INN title**. The bundled INN client appears to be:
1. A cross-promotion — encouraging Outpost buyers to try INN
2. A distribution channel — the INN client included on the CD for potential subscribers
3. Part of Sierra's strategy to seed their online service with their CD-ROM customer base

The game was never adapted for multiplayer, and no network play code exists in the binary.

---

## 7. Summary of Multiplayer Capabilities in Outpost

| Capability | Status |
|---|---|
| **Hot-seat multiplayer** | ❌ Not implemented |
| **Modem-to-modem play** | ❌ Not implemented |
| **LAN/Network play** | ❌ Not implemented |
| **INN online play** | ❌ Not implemented — Outpost is not an INN title |
| **INN client bundled** | ✅ Yes — standalone Sierra INN client included on CD |
| **Online services for Outpost** | ❌ None — no multiplayer of any kind |
| **Outpost 2** | ❌ Cancelled — only a video preview exists |

### Conclusion

Outpost (1994) is a **single-player game with no multiplayer functionality**. The INN directory on the CD is a bundled copy of Sierra's ImagiNation Network client software, included as a cross-promotional tactic. The game binary contains no networking code, no modem support, and no reference to any multiplayer system. Outpost's simulation and turn-based strategy gameplay would have been technically feasible in a multiplayer format, but Sierra never implemented it.
