# Contract: BLDGOPS.DAT Format

> **⚠ Audit 2026-10-10:** parts of this document were found to be wrong (errata items C2–C5). See [ERRATA.md](../findings/ERRATA.md) and the verified [00-ground-truth.md](../findings/00-ground-truth.md) before relying on it.

**Status**: Format Decoded — See findings/03-data-files.md for full analysis

## Format Summary

XOR 0x80 encoded CSV with CR+LF record separators. 138 records × 46 fields.

## Dumper Tool Interface

```
dat-dumper bldgops <file> [--json] [--csv]
```

**Expected behavior**:
- Dump each operations record with all fields in human-readable format
- Decode XOR 0x80 on all bytes except 0D 0A terminators
- --json: output as JSON array of records
- --csv: output as CSV (headers: field indices 0-45)

## Record Layout

| Field | Type | Description |
|-------|------|-------------|
| 0 | string | Building name (matches BLDGBLD.DAT field 0) |
| 1-21 | int | Reserved (always 0) |
| 22-29 | int (0/1) | Operational prerequisite flags |
| 30-35 | int | Reserved (always 0) |
| 36 | int (0-5) | Operating cost / power consumption tier |
| 37 | int (1-4) | Maintenance / staffing tier |
| 38 | int | Special flag (e.g., -1 for HotLab nuclear accident risk) |
| 39-45 | int | Reserved (always 0) |

## Record Count

138 records total — same index order as BLDGBLD.DAT.
