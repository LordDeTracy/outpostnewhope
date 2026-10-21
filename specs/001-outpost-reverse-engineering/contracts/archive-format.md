# Contract: RESOURCE.000 Archive Format

**Status:** Verified 2026-10-10. All 14 entries decode byte-exact with an
independent decoder (`tools/resource-extractor/dcl_explode.py`), and the
repacker's output for modified files decodes correctly.
Previous version (with errors): `superseded/archive-format.v1.md`.

**Consumer:** the Sierra installer (`SETUP.EXE` + `SETUP.SOL`). `OUTPOST.EXE`
contains no reference to `RESOURCE.000` and never reads it.

## 1. Layout

```
0x000  "DISK01"                         6 bytes, volume tag
0x006  directory, 26-byte entries, terminated by the entry named "THE_END"
       (14 files + terminator = 15 entries = 390 bytes in Outpost)
0x18C  data: one PKWARE DCL stream per file, concatenated in directory order
```

## 2. Directory entry (26 bytes)

| Off | Size | Field | Notes |
|----:|-----:|-------|-------|
| 0x00 | 4 | tag | `"DH91"` in every entry |
| 0x04 | 14 | name | 8.3 name, NUL-terminated; bytes after the NUL are **uninitialized buffer garbage** (often `fa 13`) and carry no meaning |
| 0x12 | 4 | packed size | uint32 LE, bytes of the DCL stream |
| 0x16 | 2 | date | DOS date (`((y-1980)<<9) | (m<<5) | d`) |
| 0x18 | 2 | time | DOS time (`(h<<11) | (min<<5) | (s/2)`) |

There is no uncompressed size in the directory; the DCL stream ends with its
own end-of-stream code. There is no checksum.

The date/time are the original file timestamps. Sierra's own files use
`01:50:00` (v1.50 version-stamp convention); third-party files keep their
real dates (AAPLAY.DLL 1993-05-27 17:02:04, DIB.DRV 1992-10-28). The EXE is
stamped 1995-07-19 14:47:40, the same date as `RESOURCE.000` on the CD.

## 3. Data stream: PKWARE Data Compression Library "implode"

Each blob is a standard PKWARE DCL stream (the format decoded by zlib's
`contrib/blast`):

| Byte | Meaning | Outpost |
|-----:|---------|---------|
| 0 | literal mode: 0 = **binary** (literals stored as raw 8 bits), 1 = ASCII (literals Huffman-coded) | always 0 |
| 1 | dictionary size: 4 = 1 KB, 5 = 2 KB, 6 = 4 KB | always 6 (4 KB) |
| 2… | LSB-first bitstream | |

Bitstream: flag bit 0 → literal; flag bit 1 → match: Huffman-coded length
(16 symbols, base/extra tables), length 519 = end of stream; Huffman-coded
distance high bits (64 symbols) + 2 (if length = 2) or `dict` low bits;
distance + 1. Huffman codes are stored bit-inverted. The reference
implementation is ~150 lines in `dcl_explode.py`.

## 4. Catalog

| # | Name | Packed | Unpacked | Timestamp |
|--:|------|-------:|---------:|-----------|
| 0 | BLDGBLD.DAT | 1,382 | 12,403 | 1995-06-14 01:50:00 |
| 1 | BLDGOPS.DAT | 1,243 | 14,049 | 1995-06-14 01:50:00 |
| 2 | AAPLAY.DLL | 92,484 | 182,773 | 1993-05-27 17:02:04 |
| 3 | AAVGA.DLL | 5,502 | 13,840 | 1992-12-09 17:29:04 |
| 4 | OUTHELP.DLL | 4,176 | 7,200 | 1994-04-27 10:08:30 |
| 5 | DIB.DRV | 20,154 | 30,544 | 1992-10-28 00:00:00 |
| 6 | MCIAAP.DRV | 7,130 | 16,912 | 1992-06-29 14:47:34 |
| 7 | OUTPOST.EXE | 329,295 | 640,896 | 1995-07-19 14:47:40 |
| 8 | OUTHLP.HLP | 570,906 | 561,150 | 1995-06-14 01:50:00 |
| 9 | OUTPOST.INI | 26 | 21 | 1995-05-12 13:18:34 |
| 10 | READ.ME | 9,978 | 22,679 | 1995-06-14 01:50:00 |
| 11 | 0WSCINIT.MID | 119 | 557 | 1994-04-14 09:15:44 |
| 12 | MARS.MID | 82,526 | 133,424 | 1994-06-06 09:46:50 |
| 13 | TUTOR.OPS | 5,291 | 20,276 | 1994-07-15 09:52:42 |

Sum of packed sizes: 1,130,212 = file size − 396. OUTHLP.HLP grows slightly
when "compressed" because WinHelp files are already compressed.

## 5. Tools

| Tool | Status |
|------|--------|
| `tools/resource-extractor/dcl_explode.py list/verify/extract` | Independent decoder. `verify` byte-compares every entry against a directory |
| `tools/resource-extractor/dotnet-cli` `--list/--extract/--repack` | Original C# tool. `--repack` keeps the original compressed bytes (stored base64 in `manifest.json`) for unchanged files and re-encodes changed files with a **literal-only** encoder: valid DCL, decodes correctly, but about 12 % larger than the input (no matching). The prebuilt `bin/Debug` binary predates `--repack`; rebuild with `dotnet build -c Release` |

Not yet verified: whether `SETUP.EXE` installs a repacked archive correctly.
It should, since the streams are standard, but nobody has run it in DOSBox-X.
