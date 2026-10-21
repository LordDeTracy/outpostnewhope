# Findings: Game Data Files (BLDGBLD.DAT, BLDGOPS.DAT, TUTOR.OPS, OUTPOST.INI)

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items C1–C6). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

**Status**: BLDGBLD.DAT and BLDGOPS.DAT fully decoded; TUTOR.OPS partial structural analysis; OUTPOST.INI complete

## 1. OUTPOST.INI (21 bytes)

**Complete** — Simple INI file.

### Header

Offset 0x00: `5B 67 65 6E 65 72 61 6C 5D 0D 0A 6F 70 69 6D 61 67 65 3D 0D 0A`
= `[general]\r\nopimage=\r\n`

| Field | Value | Description |
|-------|-------|-------------|
| Section | `[general]` | INI section |
| Key | `opimage=` | Empty value — path to optional image overlay? |
| Structure | Standard Windows INI | CR+LF line endings, no trailing null |

### Summary

Straightforward ASCII INI. The `opimage=` key likely references a bitmap to overlay on the main screen (e.g., a title/logo image), with the empty value defaulting to no overlay.

---

## 2. BLDGBLD.DAT (12,403 bytes) — Building Definitions

**Complete** — encoding cracked, all records decoded.

### Encoding: XOR 0x80

Every byte has bit 7 set. To decode: `decoded_byte = raw_byte XOR 0x80`.

**Exception**: `0D 0A` (CR+LF) record terminators are NOT XOR-encoded — they appear as-is in the raw file.

### Character Mappings (after XOR 0x80)

| Raw Byte | Decoded | Meaning |
|----------|---------|---------|
| 0xA2 | `"` | Quote (field delimiter for strings) |
| 0xAC | `,` | Comma (field separator) |
| 0xB0–0xB9 | `0`–`9` | Digits |
| 0x0D 0x0A | CR+LF | Record terminator (not XORed) |

### Record Structure

- **138 records** total
- Separated by literal `0D 0A` (CR+LF) in the raw file
- Each record: **40 comma-separated fields** (indices 0–39)
- String fields: enclosed in double quotes (`"..."`)
- Numeric fields: plain decimal integers (may be negative, e.g., `-1`)
- Records split on raw `0D 0A` BEFORE XOR decoding to avoid corrupting line-terminator detection

### Record Map

| Index | Name | Category |
|-------|------|----------|
| 0–5 | Unknown, Clear, Rough, Hostile, Hopeless, Dozed | Terrain types (surface) |
| 6–9 | UGEasy, UGDiff, UGImposs, UGDozed | Terrain types (underground) |
| 10 | Seed | Seed pod (crash-landed colony pod) |
| 11–14 | SeedCommand, SeedSmelter, SeedPower, SeedFact | Seed building variants |
| 15 | SpacePort | First constructed building |
| 16–26 | DisMine .. RMonoTrain | Early colony buildings |
| 27–29 | AgriDome[1-3] | Agriculture domes (3 levels) |
| 30–32 | Fact[1-3] | Factories (3 levels) |
| 33 | Trade | Trading post |
| 34–36 | Spew[1-3] | Ore processors (3 levels) |
| 37–39 | CommTwr[1-3] | Communication towers (3 levels) |
| 40–41 | HotLab[1-2] | Hot labs (nuclear research) |
| 42–43 | Chap[1-2] | Chapel (morale building) |
| 44 | Nano | Nanite lab |
| 45–46 | TerraForm[1-2] | Terraforming structures |
| 47–48 | Dirt[1-2] | Earth moving / terrain modification |
| 49–50 | Cops[1-2] | Police stations |
| 51–52 | ActiveMine[1-2] | Active mines |
| 53–54 | Smelter[1-2] | Smelters |
| 55 | Command | Command center |
| 56–57 | RoboCmd[1-2] | Robotic command centers |
| 58–59 | Warehouse[1-2] | Warehouses |
| 60–61 | Storage[1-2] | Storage facilities |
| 62 | ColonistLander | Colonist landing pod |
| 63 | MonoStation | Monorail station |
| 64 | MonoXFormer | Monorail transformer |
| 65 | CargoLander | Cargo landing pod |
| 66–75 | Const .. LanderConst | Construction placeholders |
| 76–78 | LRoad, RRoad, XRoad | Road types |
| 79–81 | UGResident[1-3] | Underground residences |
| 82–83 | UGRec[1-2] | Underground recreation |
| 84–86 | UGUniv[1-3] | Underground university |
| 87–89 | UGCommercial[1-3] | Underground commercial |
| 90 | UGPark | Underground park |
| 91–92 | UGFact[1-2] | Underground factory |
| 93–95 | UGLab[1-3] | Underground lab |
| 96–97 | UGMine[1-2] | Underground mine |
| 98–99 | UGTokamak[1-2] | Underground tokamak |
| 100 | UGSpacePort | Underground spaceport |
| 101 | UGRed | Underground residential/education |
| 102–103 | UGAdmin[1-2] | Underground administration |
| 104–105 | UGMed[1-2] | Underground medical |
| 106 | UGCore | Underground core |
| 107 | UGConst | Underground construction |
| 108–109 | UGCops[1-2] | Underground police |
| 110 | UGGeoTherm | Underground geothermal |
| 111 | UGTrade | Underground trade |
| 112–114 | UGDestroyed[1-3] | Underground destroyed states |
| 115–118 | RoboDoze .. RoboExplr | Robot units (dozer, digger, miner, explorer) |
| 119–121 | UGRoboDoze, UGRoboDig, UGTargetDig | Underground robots |
| 122–127 | XPipe, LPipe, RPipe, UGRPipe, UGLPipe, UGXPipe | Pipe types |
| 128–137 | Colonists .. ULBIProbe | Orbital/special entities |

### Field Analysis

| Field | Values | Meaning |
|-------|--------|---------|
| 0 | String | Building name (unique identifier) |
| 1–17 | Always 0 | Reserved/padding |
| 18–29 | 0 or 1 | **Prerequisite flags** — building must exist to construct this. Field index maps to building index + 3 (e.g., field 18 = building 15 = SpacePort). Fields 30-35 are always 0. |
| 36 | 0–7 | **Construction cost / resource tier** (higher = more expensive). 0 = free (command, core, construction placeholders) |
| 37 | 0–6 | **Build time / worker requirement** (higher = longer) |
| 38 | 0–12 | **Resource category** — production or consumption type. Values: 1=Agri, 2=Storage/Trade, 3=Admin, 4=Power/Comm, 5=AgriDome/Nano/Dirt, 6=Fact/Lab, 7=Mine/Smelter/SpacePort, 8=Spew/Factory, 9=MassDrv/Tokamak/TerraForm, 10=SeedCmd, 12=XMono |
| 39 | 0–10 | **Building category / upgrade level**. 0=terrain/mining/basic, 1=Trade/Seed/Park, 2=Mono/Roads/Residences, 3=Comm/Storage/Warehouse/Cops, 4=UG buildings, 5=AgriDome/HotLab/Nano/Dirt, 7=Spew/RoboCmd, 8=Smelter/Chap/Fact/Dirt, 9=TerraForm, 10=Tokamak/SpacePort/Seed variants |

---

## 3. BLDGOPS.DAT (14,049 bytes) — Building Operational Parameters

**Complete** — encoding cracked, all records decoded.

### Encoding

Identical to BLDGBLD.DAT: XOR 0x80 on all bytes except `0D 0A` terminators.

### Record Structure

- **138 records** (same ordering as BLDGBLD.DAT)
- **46 comma-separated fields per record** (indices 0–45)
- Record 0 name matches BLDGBLD.DAT record 0 name — the two files are cross-referenced by index

### Field Analysis

| Field | Values | Meaning |
|-------|--------|---------|
| 0 | String | Building name (matches BLDGBLD.DAT) |
| 1–21 | Always 0 | Reserved/padding |
| 22–35 | 0 or 1 | **Operational prerequisite flags** — different set from BLDGBLD.DAT. Flag layout tracks which other buildings must be operational. Fields 30-35 always 0. |
| 36 | 0–5 | **Operating cost / power consumption** tier. 0=free, 1=Trade/MShip, 2=Agri, 3=Spew/Cops/Nano, 4=Comm/Mono/Dirt, 5=MassDrv/SpacePort/Fact/Chap/TerraForm |
| 37 | 1–4 | **Maintenance / staffing** tier. 1=low (Mono, Comm, Agri, Fact), 2=medium (Spew, Nano, Dirt, Cops, HotLab), 4=high (SpacePort, MassDrv, Chap, TerraForm) |
| 38 | Int | **Special flag / destruction consequence**. -1 = HotLab (nuclear accident risk), 1 = AgriDome/Spew/Nano/Dirt, 5 = TerraForm |
| 39–45 | Always 0 | Unused/reserved |

### Cross-Referencing BLDGBLD.DAT ↔ BLDGOPS.DAT

Both files share the same 138-record index. Record N in BLDGBLD.DAT matches record N in BLDGOPS.DAT. The building name (field 0) confirms the match.

- **BLDGBLD.DAT**: Construction-time properties (prerequisites, cost, build time, resource type)
- **BLDGOPS.DAT**: Runtime properties (operating cost, maintenance, special behavior flags)

---

## 4. TUTOR.OPS (20,276 bytes) — Tutorial Script

**Status**: Partial structure — encoding and section markers identified; opcode semantics TBD.

### Encoding

**Not XOR-encoded.** Pure binary with embedded ASCII strings.

### Section Markers

The file is organized into 19 sections identified by ASCII markers of the form `dcbSC` followed by 1-2 hex digits (e.g., `dcbSC01`, `dcbSC0a`, `dcbSC10`, `dcbSC13`).

Sections found (in file order):

| Marker | Offset | Section Size* | Contents |
|--------|--------|---------------|----------|
| dcbSC01 | 5 | 28 | Header / root script? |
| dcbSC02 | 40 | 32 | Small config block |
| dcbSC03 | 79 | 302 | Section data |
| dcbSC04 | 388 | 28 | Small block |
| dcbSC05 | 423 | 6 | Small block |
| dcbSC06 | 436 | 68 | Contains descriptive string at offset 511-545 |
| dcbSC07 | 511 | 28 | Small block |
| dcbSC08 | 546 | 0 | Empty (immediately followed by dcbSC09) |
| dcbSC09 | 553 | 36 | Section data |
| dcbSC0a | 596 | 146 | Section containing "Aphrodite", "Anonymous Bosch" |
| dcbSC0c | 749 | 63 | Section containing "Sigma Draconis" |
| dcbSC0d | 819 | 145 | Section containing "Sigma Draconis" |
| dcbSC0e | 971 | 213 | Section containing "Vulcan's Forge" |
| dcbSC0f | 1191 | 3989 | **Large section** — main tutorial scenario data |
| dcbSC10 | 5187 | 7484 | **Largest section** — scenario scripts |
| dcbSC11 | 12678 | 264 | Section data |
| dcbSC12 | 12949 | 5410 | Section data |
| dcbSC13 | 18366 | 1888 | Section data |
| dcbSC0b | 20261 | 8 | **Out of order** — at very end of file, contains trailer data |

*Section size = gap to next marker (or end of file for last).

### Embedded String References

ASCII strings found within section data:
- `"Aphrodite"` — mission/scenario name
- `"Anonymous Bosch"` — mission/scenario name (also a Sierra design reference)
- `"Sigma Draconis"` — star system name
- `"Vulcan's Forge"` — mission/scenario name
- `"Rebel"` — faction reference

### Structural Notes

- Section `dcbSC0b` appears out of order at offset 20261 — may indicate sections are indexed/linked rather than sequentially read
- Sections `dcbSC08` and `dcbSC09` are adjacent (offset 546 and 553) with no gap, suggesting compact storage of related data
- Section sizes vary dramatically: from 0 bytes (dcbSC08) to 7484 bytes (dcbSC11)
- The file ends with 8 bytes after the last marker (dcbSC0b at offset 20261, file ends at 20276)

---

## Extraction Commands (PowerShell)

### Decode BLDGBLD.DAT

```powershell
$raw = [System.IO.File]::ReadAllBytes("input\BLDGBLD.DAT")
$out = @()
$start = 0
for($i=0; $i -lt $raw.Length-1; $i++) {
  if($raw[$i] -eq 0x0D -and $raw[$i+1] -eq 0x0A) {
    $decoded = $raw[$start..($i-1)] | ForEach-Object { $_ -bxor 0x80 }
    $out += [System.Text.Encoding]::ASCII.GetString($decoded)
    $start = $i+2; $i++
  }
}
$out -join "`r`n" | Out-File -Encoding ascii "output.csv"
```

### Decode BLDGOPS.DAT

Same algorithm as BLDGBLD.DAT — identical encoding scheme.

### Analyze TUTOR.OPS sections

```powershell
$bytes = [System.IO.File]::ReadAllBytes("input\TUTOR.OPS")
$text = [System.Text.Encoding]::ASCII.GetString($bytes)
$pos = 0
while($true) {
  $idx = $text.IndexOf("dcbSC", $pos)
  if($idx -lt 0) { break }
  $end = $idx+5
  while($end -lt $text.Length -and
        ($text[$end] -ge '0' -and $text[$end] -le '9' -or
         $text[$end] -ge 'a' -and $text[$end] -le 'f')) { $end++ }
  Write-Output ("dcbSC{0} at offset {1}" -f $text.Substring($idx+5, $end-$idx-5), $idx)
  $pos = $idx+1
}
```

## Next Analysis Steps

1. **BLDGBLD.DAT & BLDGOPS.DAT**: Cross-reference field 36-39 values with known game costs/times from the Outpost manual to determine exact units
2. **TUTOR.OPS**: Reverse the binary opcode format within each section to build a disassembler
3. **Prerequisite matrix**: Map BLDGBLD.DAT fields 18-29 to building indices to reconstruct the full tech tree
4. **Operational prerequisites**: Similarly map BLDGOPS.DAT fields 22-29
