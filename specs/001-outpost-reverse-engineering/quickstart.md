# Quickstart: Validation Guide — Outpost Reverse Engineering

**Created**: 2026-06-10
**Phase**: Phase 1 — Design Artifacts

---

## Prerequisites

| Tool | Minimum Version | Purpose |
|------|----------------|---------|
| .NET 8 SDK | 8.0.x | C# RESOURCE.000 extractor |
| PowerShell 7+ | 7.0 | XOR decoding, hex analysis, string search |
| Hex editor | Any (010, ImHex, Hiew) | Binary structure verification |
| (Optional) Ghidra/IDA | Latest | Full disassembly (Phase 1+) |

---

## 1. RESOURCE.000 Extraction

### Extract All Files

```powershell
dotnet run --project tools\resource-extractor\dotnet-cli\ResourceExtractor.csproj -c Release -- "Outpost\RESOURCE.000" "Resource.000 extract"
```

**Expected results:**
- 14 files extracted (15 entries, but "THE_END" is a sentinel)
- Total: ~1.6 MB uncompressed
- OUTPOST.EXE = 640,896 bytes
- BLDGBLD.DAT = 12,403 bytes
- BLDGOPS.DAT = 14,049 bytes
- TUTOR.OPS = 20,276 bytes

### Verify Archive Header Manually

```powershell
# Read 6-byte signature
$bytes = [System.IO.File]::ReadAllBytes("Outpost\RESOURCE.000")
$sig = [System.Text.Encoding]::ASCII.GetString($bytes[0..5])
Write-Output "Signature: $sig"   # Expected: "DISK01"
```

### Verify Directory Entries

```powershell
for ($i = 6; $i -lt 396; $i += 26) {
    $name = [System.Text.Encoding]::ASCII.GetString($bytes[$i..($i+15)]) -replace '\0.*$', ''
    $field1 = [System.BitConverter]::ToUInt16($bytes, $i + 0x10)
    $compsize = [System.BitConverter]::ToUInt32($bytes, $i + 0x12)
    $batchid = [System.BitConverter]::ToUInt32($bytes, $i + 0x16)
    Write-Output ("{0,-30} Field1=0x{1:X4} Compressed={2,8} BatchID=0x{3:X8}" -f $name, $field1, $compsize, $batchid)
}
```

---

## 2. Verify OUTPOST.EXE Binary Analysis

### Check NE Header at Offset 0x80

```powershell
format-hex -Path "Resource.000 extract\OUTPOST.EXE" -Offset 0x80 -Count 56
```

**Expected values:**
- 0x80: `4E 45` — "NE" signature
- 0x82: `05 3C` — Linker version 5.60
- 0x8C: `2A 03` — Flags 0x032A
- 0x96: `0B 00` — 11 segments
- 0x98: `05 00` — 5 module references
- 0xB6: `0A 03` — Expected Windows 3.10 (0x030A)

### Check Imported Name Table at Offset 0x95B

```powershell
$bytes = [System.IO.File]::ReadAllBytes("Resource.000 extract\OUTPOST.EXE")
# File offset 0x95B = byte position 0x95B
$pos = 0x95B
while ($bytes[$pos] -ne 0) {
    $len = $bytes[$pos]
    $name = [System.Text.Encoding]::ASCII.GetString($bytes[($pos+1)..($pos+$len)])
    Write-Output "DLL: $name"
    $pos += $len + 1
}
```

**Expected:** KERNEL, GDI, USER, MMSYSTEM, COMMDLG

### Check Resident Name Table at Offset 0x919

```powershell
format-hex -Path "Resource.000 extract\OUTPOST.EXE" -Offset 0x919 -Count 60
```

**Expected strings:** SITEICON, PLNTICON, TILEICON, ___EXPORTEDSTUB, _SHI_INVOKEERRORHANDLER1

### Check Non-Resident Name Table at Offset 0x98C

```powershell
$text = [System.Text.Encoding]::ASCII.GetString([System.IO.File]::ReadAllBytes("Resource.000 extract\OUTPOST.EXE"))
$idx = $text.IndexOf("Copyright")
Write-Output $text.Substring($idx, 72)
```

**Expected:** `"Outpost is Copyright 1994, Sierra On-Line, Inc. All Rights Reserved."`

---

## 3. Decode BLDGBLD.DAT

### XOR 0x80 Decode to CSV

```powershell
$raw = [System.IO.File]::ReadAllBytes("Resource.000 extract\BLDGBLD.DAT")
$out = @()
$start = 0
for($i=0; $i -lt $raw.Length-1; $i++) {
    if($raw[$i] -eq 0x0D -and $raw[$i+1] -eq 0x0A) {
        $decoded = $raw[$start..($i-1)] | ForEach-Object { $_ -bxor 0x80 }
        $out += [System.Text.Encoding]::ASCII.GetString($decoded)
        $start = $i+2; $i++
    }
}
$out -join "`r`n" | Out-File -Encoding ascii "bldgbld-decoded.csv"
```

**Expected:** 138 records, 40 fields each. First record: `"Unknown",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0`

### Spot-check key records:

```powershell
$csv = Get-Content "bldgbld-decoded.csv"
# SpacePort (record 15)
$csv[15]   # Expected: "SpacePort",0,...,0,6,4,7,10
# AgriDome (record 27)
$csv[27]   # Expected: "AgriDome",0,...,0,3,2,5,5
# Tokamak (record 20)
$csv[20]   # Expected: "Tokamak",0,...,0,1,2,9,10
```

### Verify Tech Tree Prerequisites

```powershell
$csv = Get-Content "bldgbld-decoded.csv"
# Parse record 16 (DisMine) — check tech tree masking
$fields = $csv[16] -split ','
# Fields 18-29 = prerequisite bitmask
$mask = ($fields[18..29] -join '')
Write-Output "DisMine mask: $mask"  # Expected: 100000100000
```

---

## 4. Decode BLDGOPS.DAT

Same algorithm as BLDGBLD.DAT:

```powershell
$raw = [System.IO.File]::ReadAllBytes("Resource.000 extract\BLDGOPS.DAT")
$out = @()
$start = 0
for($i=0; $i -lt $raw.Length-1; $i++) {
    if($raw[$i] -eq 0x0D -and $raw[$i+1] -eq 0x0A) {
        $decoded = $raw[$start..($i-1)] | ForEach-Object { $_ -bxor 0x80 }
        $out += [System.Text.Encoding]::ASCII.GetString($decoded)
        $start = $i+2; $i++
    }
}
$out -join "`r`n" | Out-File -Encoding ascii "bldgops-decoded.csv"
```

**Expected:** 138 records, 46 fields each. Field 0 matches BLDGBLD.DAT field 0.

### Verify HotLab special flag:

```powershell
$csv = Get-Content "bldgops-decoded.csv"
# HotLab (record 40), field 38 should be -1
$fields = $csv[40] -split ','
Write-Output "HotLab special flag: $($fields[38])"  # Expected: -1

# SpacePort (record 15), field 38 should be 0
$fields = $csv[15] -split ','
Write-Output "SpacePort special flag: $($fields[38])"  # Expected: 0
```

---

## 5. Verify TUTOR.OPS Structure

### Find all dcbSC section markers

```powershell
$bytes = [System.IO.File]::ReadAllBytes("Resource.000 extract\TUTOR.OPS")
$text = [System.Text.Encoding]::ASCII.GetString($bytes)
$matches = [regex]::Matches($text, "dcbSC[0-9a-f]+")
$matches.Value
```

**Expected (19 markers):**
```
dcbSC01
dcbSC02
dcbSC03
dcbSC04
dcbSC05
dcbSC06
dcbSC07
dcbSC08
dcbSC09
dcbSC0a
dcbSC0c
dcbSC0d
dcbSC0e
dcbSC0f
dcbSC10
dcbSC11
dcbSC12
dcbSC13
dcbSC0b
```

### Verify SC001 file header

```powershell
$header = [System.Text.Encoding]::ASCII.GetString($bytes[0..4])
Write-Output "Header: $header"  # Expected: "SC001"
```

### Extract embedded strings

```powershell
$strings = @()
$pos = 0
while ($true) {
    $nullchar = [array]::IndexOf($bytes, 0, $pos)
    if ($nullchar -lt 0 -or $nullchar -ge $bytes.Length - 1) { break }
    $len = $nullchar - $pos
    if ($len -gt 3 -and $len -lt 100) {
        $s = [System.Text.Encoding]::ASCII.GetString($bytes[$pos..($nullchar-1)])
        if ($s -cmatch '^[A-Z][a-z]+[\s\'',A-Za-z0-9]*$') { $strings += $s }
    }
    $pos = $nullchar + 1
}
$strings | Sort-Object -Unique
```

**Expected to find:** Aphrodite, Anonymous Bosch, Sigma Draconis, Vulcan's Forge, Rebel

---

## 6. Verify Bitmap Structure

```powershell
$bytes = [System.IO.File]::ReadAllBytes("Outpost\BITMAPS\TILE1.BMP")
# Check "BM" magic
Write-Output "Magic: '{0}'" -f [System.Text.Encoding]::ASCII.GetString($bytes[0..1])
# Read dimensions
$width = [System.BitConverter]::ToInt32($bytes, 18)
$height = [System.BitConverter]::ToInt32($bytes, 22)
$bpp = [System.BitConverter]::ToUInt16($bytes, 28)
$compression = [System.BitConverter]::ToInt32($bytes, 30)
Write-Output "Dimensions: ${width}x${height}, ${bpp}bpp, Compression=$compression"
```

**Expected:**
- Magic: `BM`
- Width: 640
- Height: 480
- BPP: 8
- Compression: 0 (BI_RGB)

All 339 bitmaps follow the same format. Typical sizes:
- 640×480 terrain: 308,278 bytes
- 300×150 buildings: 46,078 bytes
- 145×120 robots: 18,838 bytes

---

## 7. Verify FLC Video Structure

```powershell
$bytes = [System.IO.File]::ReadAllBytes("Outpost\VIDEOS\10.FLC")
$magic = [System.BitConverter]::ToUInt16($bytes, 4)
$frames = [System.BitConverter]::ToUInt16($bytes, 6)
$width = [System.BitConverter]::ToUInt16($bytes, 8)
$height = [System.BitConverter]::ToUInt16($bytes, 10)
$depth = [System.BitConverter]::ToUInt16($bytes, 12)
Write-Output "Magic: 0x{0:X4}, Frames: {1}, Resolution: {2}x{3}, Depth: {4}" -f $magic, $frames, $width, $height, $depth
```

**Expected:**
- Magic: 0xAF12 (Autodesk Animator Pro)
- Depth: 8 (256 colors)

---

## 8. Windows 3.1 VM Testing

For dynamic analysis and format validation:

### Setup
1. Install Windows 3.1 (or Windows for Workgroups 3.11) in VirtualBox or DOSBox
2. Enable 256-color VGA video driver
3. Install Sound Blaster or PC speaker audio driver

### Run Outpost
1. Launch SETUP.EXE from the Outpost CD
2. Complete hardware configuration (video, audio, input)
3. Run OUTPOST.EXE to verify game runs
4. Test all three zoom levels (Planet/Site/Tile)

### Validation Checklist
- [ ] Game boots to title screen without errors
- [ ] Tutorial plays through at least first 5 steps
- [ ] Buildings can be placed on clear terrain
- [ ] Simulation turns advance correctly
- [ ] FLC animations play during events (launch sequence, disaster)
- [ ] Audio plays (WAV effects, MIDI background music)
- [ ] Save/Load game functions work
- [ ] All 3 view levels render correctly

### Format Verification via VM
- Extract files from RESOURCE.000
- Test round-trip: extract → modify → repack → game still loads
- Verify modified BLDGBLD.DAT changes reflected in-game (e.g., cost changes)
- Verify modified BITMAPS load correctly

---

## 9. Quick Reference: Key File Offsets

### OUTPOST.EXE

| Offset | Content | Size |
|--------|---------|------|
| 0x00 | MS-DOS stub ("MZ") | 128 bytes |
| 0x80 | NE header ("NE") | 56 bytes |
| 0xC0 | Segment table | 132 bytes |
| 0x919 | Resident name table | variable |
| 0x951 | Module reference table | 10 bytes |
| 0x95B | Imported name table | variable |
| 0x97D | Entry table | 15 bytes |
| 0x98C | Copyright string | 72 bytes |
| 0xA20 | Segment 1 (DATA, 352K) | 0x55B70 |
| 0xD500 | Code overlays (Seg 2/4/6) | shared |
| 0xD510 | Segment 8 (CODE, PRELOAD, 428K) | 0x68B60 |

### RESOURCE.000

| Offset | Content |
|--------|---------|
| 0x00 | Signature "DISK01" (6 bytes) |
| 0x06 | Directory entries (26 bytes each) |
| 0x18C | Compressed data section start |

### BLDGBLD.DAT / BLDGOPS.DAT

| Property | BLDGBLD | BLDGOPS |
|----------|---------|---------|
| Records | 138 | 138 |
| Fields/record | 40 | 46 |
| Encoding | XOR 0x80 | XOR 0x80 |
| Terminator | CR+LF (not XORed) | CR+LF (not XORed) |
| Field separator | Comma | Comma |

---

## 10. Troubleshooting

| Symptom | Likely Cause | Solution |
|---------|-------------|----------|
| "DISK01" not found at RESOURCE.000+0 | Wrong file or corrupt archive | Verify file is 1,130,608 bytes |
| XOR decode produces garbage | CR+LF included in XOR range | Split on 0D 0A before XOR |
| NE header not at 0x80 | OUTPOST.EXE is not the game binary | Check RESOURCE.000 extraction produced correct file |
| dcbSC markers not found in TUTOR.OPS | Wrong file or file not extracted | Verify TUTOR.OPS = 20,276 bytes |
| Bitmaps won't load as standard BMP | Wrong pixel data offset | Verify 0x0436 (1078) = offset to pixels |
| FLC magic is 0xAF11 not 0xAF12 | File is FLI format (older) | Both are valid; FLI = 320×200 max |
