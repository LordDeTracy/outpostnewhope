# Audio Subsystem — Sierra Outpost (1994)

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items A4, D4–D5). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

## 1. WAV Files (277 files)

### 1.1 Format Specification

All WAV files use a uniform format:

| Field | Value |
|---|---|
| RIFF magic | `RIFF` |
| WAVE magic | `WAVE` |
| fmt chunk | `fmt ` (with space) |
| Audio format | 1 (PCM) |
| Channels | 1 (mono) |
| Sample rate | **22050 Hz** |
| Byte rate | 22050 |
| Block align | 1 |
| Bits per sample | **8** (unsigned) |

**Uniform across all examined files**: mono, 22050 Hz, 8-bit PCM.  
This is a low-fidelity format suitable for era-constrained storage (~22 KB/second).

### 1.2 Categories by Filename Pattern

#### FEM*.WAV (141 files) — Female Computer Voice

**Range**: FEM1.WAV through FEM140.WAV (with gaps, plus FEM125B.WAV and FEM133B.WAV)

**Size distribution**:
- Min: FEM8.WAV = 35,324 bytes (~1.6 sec)
- Max: FEM119.WAV = 2,393,570 bytes (~108 sec)
- Mean: ~366,288 bytes (~16.6 sec)

**Typical sizes by FEM ID range:**
| Range | Typical Size | Duration | Content |
|---|---|---|---|
| FEM1-19.WAV | 35-200 KB | 1.6-9 sec | Short prompts, confirmations |
| FEM20-49.WAV | 100-500 KB | 4.5-23 sec | Mid-length messages |
| FEM50-99.WAV | 200-700 KB | 9-32 sec | Detailed status/instructions |
| FEM100-140.WAV | 300-2400 KB | 14-108 sec | Long narrations, tutorials |

The `.B` variants (FEM125B, FEM133B) suggest alternate takes or re-recorded lines.

#### ADD*.WAV (75 files) — Additional Sound Effects/Messages

**Range**: ADD1.WAV through ADD75.WAV

**Size distribution**: 34,000-676,644 bytes (1.5-31 sec)  
These are additional voice lines or event sounds that don't fit the FEM numbering.

#### Environmental/Event Sounds (39 files)

| Pattern | Count | Examples | Typical Content |
|---|---|---|---|
| FR7_*.WAV | 4 | FR7_1, FR7_2, FR7_3, FR7LAU | Launch sounds (FR7 = "Firing Room 7"?) |
| M59_*.WAV | 8 | M59_03..M59_14, M59POL | Vehicle/mechanical (M59 = "Mars 2059"?) |
| ALARM*.WAV | 3 | ALARM-D, ALARM-M, ALARM2 | Alert sounds (ALARM-D = danger, ALARM-M = minor) |
| DEMO*.WAV | 2 | DEMO, DEMO1 | Demo mode narration |
| ASZ*.WAV | 2 | ASZLEO, ASZTOM | Character voice ("Asz..."?) |
| THUNDER*.WAV | 4 | THUNDER, THUNDER1-3 | Storm/weather sounds |
| STEAM*.WAV | 3 | STEAM, STEAM2, STEAM3 | Industrial ambient |

#### Standalone Sound Effects (28 files)

| File | Size | Likely Content |
|---|---|---|
| A11BUZ.WAV | — | Alarm/buzzer |
| A12LND.WAV | — | Landing sound |
| A12PRB.WAV | — | Probe sound |
| A13PROB.WAV | — | Another probe |
| ANGRYMOB.WAV | — | Crowd/riot |
| AVALANCH.WAV | — | Avalanche |
| BLSTFURN.WAV | — | Blast furnace |
| BLSTRGUN.WAV | — | Blaster gun |
| BOOP.WAV | 7,112 | UI beep |
| CHEERS.WAV | — | Crowd cheering |
| EARTHQAK.WAV | — | Earthquake |
| EXPLODE.WAV | 66,624 | Explosion |
| FIRBAL.WAV | — | Fireball |
| FIREBALL.WAV | — | Fireball (longer) |
| GOES.WAV / GOES_I.WAV | — | "Goes" sound effect |
| LAUNCH.WAV | 65,664 | Rocket launch |
| MACHWHIR.WAV | — | Machinery whir |
| NEW.WAV | — | New item/notification |
| NI.WAV | — | "Not implemented" |
| NOPROB.WAV | — | "No problem" |
| PLNTXPLD.WAV | — | Planet explosion |
| REENT1.WAV / REENT2.WAV | — | Re-entry sounds |
| ROBOCOP.WAV | — | Robot walking |
| ROBODIE.WAV | — | Robot destroyed |
| ROBOSCRM.WAV | — | Robot scream |
| ROBOSHOK.WAV | — | Robot shock |
| ROLLOFF.WAV | — | Rolling off |
| SCREAM'N.WAV | — | Screaming |
| SERVO.WAV | — | Servo motor |
| SMLSTP.WAV | — | Small step |
| SOLRWIND.WAV | — | Solar wind |
| TEST2.WAV | — | Test sound |
| TURBINE.WAV | — | Turbine engine |

---

## 2. MIDI Files (35 files)

### 2.1 Format Specification

All MIDI files use the **Standard MIDI File (SMF) Type 1** format.

| Field | Value |
|---|---|
| Header | `MThd` |
| Chunk length | 6 |
| Format | 1 (multi-track, synchronous) |
| Division | **192** ticks/quarter-note (standard) |
| Tracks | 3-14 (varies by complexity) |

### 2.2 Complete MIDI Catalog

#### Mars Theme (4 variants)

| File | Size | Tracks | Description |
|---|---|---|---|
| **MARS.MID** | 133,424 | 14 | Base theme — full General MIDI |
| **MARSCMRL.MID** | 25,079 | 14 | Roland CM-32L variant (compressed/reduced) |
| **MARSMT1.MID** | 117,509 | 14 | Roland MT-32 variant |
| **MARSMT32.MID** | 114,010 | 14 | Roland MT-32 variant (alternate mapping) |

The theme has 4 hardware variants: GM base, CM-32L (low-end), MT-32 (high-end).  
MARS.MID is largest at 133KB — suggests it has the most instrumentation data.  
MARSCMRL.MID is only 25KB — stripped-down for CM-32L's limited sound set.

#### Satellite Themes (3 files)

| File | Size | Tracks | Description |
|---|---|---|---|
| COMMSAT.MID | 4,112 | 14 | Communications satellite theme |
| SOLARSAT.MID | 8,184 | 12 | Solar satellite theme |
| WTHRSAT.MID | 5,435 | 12 | Weather satellite theme |

#### Disaster/Event Music (9 files)

| File | Size | Tracks | Description |
|---|---|---|---|
| AVALANCH.MID | 5,508 | 5 | Avalanche |
| EARTHQAK.MID | 6,572 | 5 | Earthquake |
| ERTHQUAK.MID | 6,572 | 5 | Earthquake (duplicate of above with 8-char name) |
| THUNDER.MID | 13,000 | 6 | Thunder storm |
| RUMBLE.MID | 13,000 | 6 | Rumbling (same size as THUNDER — paired) |
| EXPLODE.MID | 285 | 4 | Brief explosion sting |
| PLNTXPLD.MID | 311 | 4 | Planet explosion sting |
| LABXPLOD.MID | 285 | 4 | Lab explosion sting (same as EXPLODE) |
| EXPLDSTR.MID | 6,802 | 14 | Extended explosion/disaster |

#### Industrial/Vehicle Music (5 files)

| File | Size | Tracks | Description |
|---|---|---|---|
| BLSTFURN.MID | 1,139 | 5 | Blast furnace |
| MASSDRVR.MID | 5,618 | 14 | Mass driver |
| DIGGRDIS.MID | 1,723 | 9 | Digger/drill |
| ROBOSCRM.MID | 1,817 | 7 | Robot scream |
| ROBOSHOK.MID | 5,494 | 4 | Robot shock |
| MOTOR.MID | 248 | 4 | Motor hum (tiny — just a loop) |

#### UI/Ambient Music (5 files)

| File | Size | Tracks | Description |
|---|---|---|---|
| INTRSTEL.MID | 11,032 | 12 | Interstellar travel theme |
| LOGOCPLS.MID | 2,810 | 12 | Logo complete (title screen) |
| DEDASTRO.MID | 2,798 | 12 | Dead astronaut (memorial/dirge) |
| SOLRWIND.MID | 398 | 4 | Solar wind ambient (short loop) |
| METRDFNS.MID | 3,320 | 12 | Meteor defense |
| TRRAFRMG.MID | 3,393 | 11 | Terrain forming |

#### Alert/Alarm Music (2 files)

| File | Size | Tracks | Description |
|---|---|---|---|
| ALARM.MID | 1,335 | 3 | Primary alarm |
| ALARM2.MID | 1,703 | 5 | Secondary alarm |

#### Launch Music (1 file)

| File | Size | Tracks | Description |
|---|---|---|---|
| LAUNCH.MID | 3,139 | 9 | Launch sequence theme |

#### Configuration/Init (1 file)

| File | Size | Tracks | Description |
|---|---|---|---|
| 0WSCINIT.MID | 557 | 11 | "WSC Init" — startup/configuration screen (96 ticks/qq) |

Note: `0WSCINIT.MID` uses **96 ticks/quarter-note** instead of 192 (unique exception among all MIDIs).

### 2.3 File Name Cross-Reference with EXE

The OUTPOST.EXE binary does **not** contain hardcoded MIDI/WAV filenames as plaintext strings. Asset filenames are likely loaded from the **RESOURCE.000** archive header or constructed programmatically at runtime. The RESOURCE.000 header uses a format with `DH91`-prefixed filenames (e.g., `DH91AAPLAY.DLL`, `DH91AAVGA.DLL`).

### 2.4 Track Count Analysis

| Tracks | Files | Complexity Level |
|---|---|---|
| 3 | ALARM.MID | Minimal — simple alarm loop |
| 4 | EXPLODE.MID, PLNTXPLD.MID, LABXPLOD.MID, MOTOR.MID, ROBOSHOK.MID, SOLRWIND.MID | Short stings/loops |
| 5 | AVALANCH.MID, EARTHQAK.MID, ERTHQUAK.MID, BLSTFURN.MID, ALARM2.MID | Simple pieces |
| 6 | THUNDER.MID, RUMBLE.MID | Medium ambients |
| 7 | ROBOSCRM.MID | — |
| 9 | LAUNCH.MID, DIGGRDIS.MID | Full pieces |
| 11 | 0WSCINIT.MID, TRRAFRMG.MID | Near-orchestral |
| 12 | SOLARSAT.MID, WTHRSAT.MID, INTRSTEL.MID, LOGOCPLS.MID, DEDASTRO.MID, METRDFNS.MID | Full orchestral |
| 14 | MARS*.MID, COMMSAT.MID, EXPLDSTR.MID, MASSDRVR.MID | Max complexity |

### 2.5 Hardware Variants

The Mars theme exists in 4 variants supporting 3 sound hardware tiers:

| File | Target Hardware | Size | Characteristics |
|---|---|---|---|
| MARS.MID | General MIDI | 133 KB | Full instrument set, GS/XG compatible |
| MARSMT1.MID | Roland MT-32 (rev 1) | 118 KB | Custom SysEx for MT-32 tones |
| MARSMT32.MID | Roland MT-32 (rev 2) | 114 KB | Updated SysEx mapping |
| MARSCMRL.MID | Roland CM-32L | 25 KB | Stripped — CM-32L has fewer simultaneous voices |

The MT-32 variants and CM-32L variant use **Roland-specific SysEx** messages to load custom patches (typical for Sierra's MIDI sequencing of the era, using CAKEWALK or similar).

---

## 3. Audio Subsystem Architecture

### 3.1 Playback Components

The audio subsystem relies on:
- **Windows MCI (Media Control Interface)** — referenced in AAPLAY.DLL (`mciSendCommand`, `mciSendString`, `mmioOpen`, `mmioRead`, `mmioSeek`, `mmioClose`)
- **MMSYSTEM** — Windows multimedia extensions (`timeGetDevCaps`, `timeSetEvent`, `timeKillEvent`)
- **AAPLAY.DLL** — Provides `AASOUND`, `_MMOPENSOUND`, `_MMPLAYSOUND`, `_MMSTOPSOUND`, `_MMPAUSESOUND` functions for sound playback management
- Supported audio formats: `.wav`, `.mid`, `.rmi`

### 3.2 Sound Driver Detection (from AAPLAY.DLL)

```
_MMGETDEVICETYPE -> _FINDMCIDRIVERS
```

The DLL probes available MCI drivers to determine what audio hardware is present.

### 3.3 File Size Summary

| Category | Count | Total Size (approx) |
|---|---|---|
| WAV files (voice) | 141 | ~50 MB |
| WAV files (effects) | 136 | ~30 MB |
| MID files (Mars theme) | 4 | ~390 KB |
| MID files (other) | 31 | ~180 KB |
| **Total audio** | **312** | **~80 MB** |

### 3.4 Unified Sample Rate

All 277 WAV files share identical format (22050 Hz, mono, 8-bit PCM), indicating a single hardware target: standard Sound Blaster / Windows Sound System at the era's common speech playback quality. No 16-bit or stereo variants exist.
