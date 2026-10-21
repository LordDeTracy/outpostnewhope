# Contract: BLDGBLD.DAT Format

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items C2–C5). See [ERRATA.md](../findings/ERRATA.md) and the verified [00-ground-truth.md](../findings/00-ground-truth.md) before relying on it.

**Status**: Format Decoded — See findings/03-data-files.md for full analysis

## Format Summary

XOR 0x80 encoded CSV with CR+LF record separators. 138 records × 40 fields.

## Dumper Tool Interface

```
dat-dumper bldgbld <file> [--json] [--csv]
```

**Expected behavior**:
- Dump each building record with all fields in human-readable format
- Decode XOR 0x80 on all bytes except 0D 0A terminators
- --json: output as JSON array of records
- --csv: output as CSV (headers: field indices 0-39)

## Record Layout

| Field | Type | Description |
|-------|------|-------------|
| 0 | string | Building name (unique identifier across both DAT files) |
| 1-17 | int | Reserved (always 0) |
| 18-29 | int (0/1) | Prerequisite flags — building index + 3 must exist |
| 30-35 | int | Reserved (always 0) |
| 36 | int (0-7) | Construction resource cost tier |
| 37 | int (0-6) | Build time / worker requirement tier |
| 38 | int (0-12) | Resource production/consumption category |
| 39 | int (0-10) | Building category / upgrade level |

## Record Count

138 records total:
- 0-9: Terrain types
- 10-14: Seed pod variants
- 15-137: Buildings (surface + underground + robots + orbital)

Cross-referenced with BLDGOPS.DAT by record index (same order).
