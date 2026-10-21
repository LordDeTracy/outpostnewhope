# Findings: RESOURCE.000 Archive Format

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items B1–B5). See [ERRATA.md](ERRATA.md) and the verified [00-ground-truth.md](00-ground-truth.md) before relying on it.

**Status**: Analysis in Progress — discovered structure and patterns

## File Header (Offset 0x00, 6 bytes)

| Offset | Value | Meaning |
|--------|-------|---------|
| 0x00-0x05 | `44 49 53 4B 30 31` = "DISK01" | Archive signature/magic bytes |

## Directory Format (Starts at Offset 0x06)

The directory contains fixed-size entries of **26 bytes each**, terminated by a `DH91THE_END` marker.

### Directory Entry Structure (26 bytes)

| Offset | Size | Field | Description |
|--------|------|-------|-------------|
| 0x00 | 16 bytes | Filename | Null-padded ASCII string, prefixed with "DH91" (game code) |
| 0x10 | 2 bytes | Field1 | Unknown — values observed: 0x13D7, 0x13FA, 0x1300 |
| 0x12 | 4 bytes | Field2 | Unknown — may be file offset or size-related |
| 0x16 | 4 bytes | Field3 | Unknown — same value `CE 1E 40 0E` for multiple files; may be batch/install group ID |

### Observed Directory Entries

```
  1. DH91BLDGBLD.DAT      | D7 13 66 05 00 00 CE 1E 40 0E
  2. DH91BLDGOPS.DAT      | FA 13 DB 04 00 00 CE 1E 40 0E
  3. DH91AAPLAY.DLL       | FA 13 44 69 01 00 BB 1A 42 88
  4. DH91AAVGA.DLL        | FA 13 7E 15 00 00 89 19 A2 8B
  5. DH91OUTHELP.DLL      | FA 13 50 10 00 00 9B 1C 0F 51
  6. DH91DIB.DRV          | FA 13 BA 4E 00 00 5C 19 00 00
  7. DH91MCIAAP.DRV       | FA 13 DA 1B 00 00 DD 18 F1 75
  8. DH91OUTPOST.EXE      | FA 13 4F 06 05 00 F3 1E F4 75
  9. DH91OUTHLP.HLP       | FA 13 1A B6 08 00 CE 1E 40 0E
 10. DH91OUTPOST.INI      | FA 13 1A 00 00 00 AC 1E 51 6A
 11. DH91READ.ME          | FA 13 FA 26 00 00 CE 1E 40 0E
 12. DH910WSCINIT.MID     | 00 13 77 00 00 00 8E 1C F6 49
 13. DH91MARS.MID         | FA 13 5E 42 01 00 C6 1C D9 4D
 14. DH91TUTOR.OPS        | FA 13 AB 14 00 00 EF 1C 95 4E
 15. DH91THE_END          | (end marker, zeros)
```

### Directory Size

Directory: 6 (header) + 15 * 26 (entries) = **396 bytes** (0x18C)
Data section starts at offset **396** (0x18C).

## Data Section (Starts at Offset 0x18C)

The data section contains the actual file contents. Data appears obfuscated/compressed — no obvious file signatures in the first several hundred bytes. Initial analysis suggests either:
- **LZW/LZSS compression** (common in Sierra installers of the era)
- **XOR or simple stream cipher** applied to compressed data
- **Custom Sierra compression** (the game used the Sierra Creative Interpreter series)

### File Size Reference (from SIERRA.INF)

Total uncompressed: ~1,656,468 bytes
Archive size: 1,130,608 bytes (68% compression ratio)

| File | Uncompressed Size |
|------|------------------:|
| BLDGBLD.DAT | 12,403 |
| BLDGOPS.DAT | 14,049 |
| AAPLAY.DLL | 182,773 |
| AAVGA.DLL | 13,840 |
| OUTHELP.DLL | 7,200 |
| DIB.DRV | 30,544 |
| MCIAAP.DRV | 16,912 |
| OUTPOST.EXE | 640,640 |
| OUTHLE.HLP | 561,150 |
| OUTPOST.INI | 21 |
| READ.ME | 22,679 |
| 0WSCINIT.MID | 557 |
| MARS.MID | 133,424 |
| TUTOR.OPS | 20,276 |

## Next Analysis Steps

1. Determine format of the 10-byte per-entry metadata (Field1/Field2/Field3)
2. Identify the compression/decompression algorithm
3. Look for markers in the directory that indicate per-file XOR keys
4. Compare with known Sierra archive formats (e.g., SCI resource files, Sierra Installer formats)
5. Attempt extraction using Sierra resource tools (if compatible)
