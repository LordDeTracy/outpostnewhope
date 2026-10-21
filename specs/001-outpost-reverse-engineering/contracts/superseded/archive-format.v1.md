# Contract: RESOURCE.000 Archive Format

**Status**: Complete — Verified against extractor implementation

**Games**: Outpost (1994, Sierra On-Line)
**Format**: Single-file archive containing 14 compressed game files
**Algorithm**: PKWare DCL Implosion (IMPODE)

---

## 1. Archive Layout (Logical)

```
┌──────────────────────────────────────────────────────┐
│  0x00  Header ("DISK01", 6 bytes)                    │
├──────────────────────────────────────────────────────┤
│  0x06  Directory (15 × 26 = 390 bytes)               │
│        Entry 0: "DH91BLDGBLD.DAT" ...                │
│        Entry 1: "DH91BLDGOPS.DAT" ...                │
│        ...                                           │
│        Entry 13: "DH91TUTOR.OPS" ...                 │
│        Entry 14: "DH91THE_END" (sentinel)            │
├──────────────────────────────────────────────────────┤
│  0x18C Data Section (14 concatenated compressed      │
│         blobs, in directory order)                    │
│        [blob header 3 bytes][IMPODE stream]           │
│        [blob header 3 bytes][IMPODE stream]           │
│        ...                                           │
└──────────────────────────────────────────────────────┘
```

### Size Summary

| Section | Offset | Size |
|---------|--------|------|
| Header | 0x000 | 6 |
| Directory | 0x006 | 390 (15 × 26) |
| Data | 0x18C (396) | remaining bytes |
| **Total** | | **1,130,608** |

---

## 2. Header (offset 0x00, 6 bytes)

| Offset | Size | Field | Value | Description |
|--------|------|-------|-------|-------------|
| 0x00 | 6 | Signature | `44 49 53 4B 30 31` = `"DISK01"` | Archive volume label / magic bytes |

The header is a literal ASCII string `"DISK01"`. No other fields, no checksum. Directory begins immediately at byte 6.

---

## 3. Directory (starts at offset 0x06)

Directory consists of **15 fixed-size entries of 26 bytes (0x1A) each**, for a total of 390 bytes.

### 3.1 Entry Structure (26 bytes)

| Offset | Size | Field | Type | Description |
|--------|------|-------|------|-------------|
| 0x00 | 4 | Marker | char[4] | `"DH91"` — game code prefix, validated by extractor (byte 3 must be `'1'`) |
| 0x04 | var | Filename | null-terminated ASCII | File name (max 14 bytes + null, padded with zeros to offset 0x12) |
| 0x10 | 2 | Field1 | uint16 LE | Unknown. Observed values: 0x13D7, 0x13FA, 0x1300. Not used by extractor. |
| 0x12 | 4 | CompressedSize | uint32 LE | Size of compressed data blob (including 3-byte compression header) |
| 0x16 | 2 | Unk1 | uint16 LE | Unknown field 1. Exposed by extractor listing. |
| 0x18 | 2 | Unk2 | uint16 LE | Unknown field 2. Exposed by extractor listing. |

**Total entry size: 0x1A = 26 bytes**

### 3.2 Field Layout Detail

```
0x00  0x01  0x02  0x03  0x04  0x05  0x06  0x07
44    48    39    31     xx    xx    xx    xx     "DH91" + filename start
 0x08  0x09  0x0A  0x0B  0x0C  0x0D  0x0E  0x0F
 xx    xx    xx    xx    xx    xx    xx    00     filename contd + null terminator
 0x10  0x11  0x12  0x13  0x14  0x15  0x16  0x17
 f1L   f1H   s0    s1    s2    s3    u1L   u1H    Field1 + CompressedSize + Unk1
 0x18  0x19
 u2L   u2H                                           Unk2
```

### 3.3 Sentinel Entry

The 15th entry (index 14) is the sentinel marker:

```
DH91THE_END\0...
```

When the extractor encounters a filename equal to `"THE_END"`, it stops reading directory entries and begins the data section. No compressed data follows the sentinel.

### 3.4 Field1 Notes

Field1 at offset 0x10 (2 bytes) varies between entries:
- **0x13FA**: Used by 11 of 14 files (standard game data)
- **0x13D7**: Used by `BLDGBLD.DAT` only
- **0x1300**: Used by `0WSCINIT.MID` only

Hypothesis: May encode install type, file priority, or compression flags. Not required for extraction.

---

## 4. Data Section (starts at offset 0x18C = 396)

The data section contains 14 compressed file blobs concatenated in directory entry order (same order as entries 0–13). The sentinel entry (`THE_END`) has no data.

Each blob consists of a **3-byte compression header** followed by the **IMPODE-compressed stream**:

### 4.1 Compression Header (3 bytes per blob)

| Offset | Field | Type | Description |
|--------|-------|------|-------------|
| +0 | field2 | uint8 | Compression mode: `0` = ASCII literals, `1` = binary Huffman |
| +1 | field6 | uint8 | Dictionary size: `4` = 4KB, `5` = 8KB, `6` = 16KB |
| +2 | fieldA | uint8 | Initial bit buffer value (seed for the bitstream reader) |

The compressed stream (IMPODE data) begins at byte +3.

### 4.2 Compression Algorithm: PKWare DCL Implosion (IMPODE)

The algorithm is a **LZSS variant** with:
- **Literal/offset-length coding** — single bytes or back-references to a sliding dictionary window
- **Huffman or flat coding** for literals (controlled by field2)
- **Dictionary sizes**: 4KB (field6=4), 8KB (field6=5), or 16KB (field6=6)

**Decompression states:**
```
Sub3FA6() → decode next symbol:
  if bit==1: read Huffman-coded offset from tree → back-reference
  if bit==0 & field2==0: read 8 raw bits → literal byte
  if bit==0 & field2==1: read Huffman-coded literal from binary tree

Sub40E4() → decode match length from distance code
Sub3EDB() → main loop: write literal or copy back-reference to output buffer
```

**Decoding tables** (embedded in the extractor, sourced from OUTPOST.EXE's binary data):
- `Byte31A7` / `Byte3167` — Huffman tree for distance codes (40 entries)
- `Byte3227` / `Byte3217` / `Byte31E7` / `Byte31F7` — Huffman tree for literal codes (16 entries)
- `Byte3237` / `Word3337` — Binary-mode Huffman tree (256 entries)

**Output buffer**: Circular ring buffer of 0x2000 bytes (8KB), flushed to output in 0x1000-byte (4KB) pages.

---

## 5. File Catalog

| # | Filename | Compressed Size (bytes) | Uncompressed Size (bytes) | field2 | field6 | Field1 | Unk1 | Unk2 |
|---|----------|------------------------:|--------------------------:|--------|--------|--------|------|------|
| 0 | BLDGBLD.DAT | 1,382 | 12,403 | 0 | 5 | 0x13D7 | 0x1ECE | 0x0E40 |
| 1 | BLDGOPS.DAT | 1,243 | 14,049 | 0 | 5 | 0x13FA | 0x1EDB | 0x0E40 |
| 2 | AAPLAY.DLL | 92,484 | 182,773 | 0 | 5 | 0x13FA | 0x1A44 | 0x8869 |
| 3 | AAVGA.DLL | 5,502 | 13,840 | 0 | 5 | 0x13FA | 0x157E | 0x8BA2 |
| 4 | OUTHELP.DLL | 4,176 | 7,200 | 0 | 5 | 0x13FA | 0x1050 | 0x510F |
| 5 | DIB.DRV | 20,154 | 30,544 | 0 | 5 | 0x13FA | 0x4EBA | 0x0019 |
| 6 | MCIAAP.DRV | 7,130 | 16,912 | 0 | 5 | 0x13FA | 0x1BDA | 0x75F1 |
| 7 | OUTPOST.EXE | 329,295 | 640,896 | 0 | 5 | 0x13FA | 0x064F | 0x75F4 |
| 8 | OUTHLE.HLP | 570,906 | 561,150 | 0 | 5 | 0x13FA | 0xB61A | 0x0E40 |
| 9 | OUTPOST.INI | 26 | 21 | 0 | 4 | 0x13FA | 0x001A | 0x6A51 |
| 10 | READ.ME | 9,978 | 22,679 | 0 | 5 | 0x13FA | 0x26FA | 0x0E40 |
| 11 | 0WSCINIT.MID | 119 | 557 | 0 | 4 | 0x1300 | 0x0077 | 0x49F6 |
| 12 | MARS.MID | 82,526 | 133,424 | 0 | 5 | 0x13FA | 0x425E | 0x4DD9 |
| 13 | TUTOR.OPS | 5,291 | 20,276 | 0 | 5 | 0x13FA | 0x14AB | 0x4E95 |

### Notes

- **OUTPOST.INI** (21 bytes uncompressed, 26 bytes compressed): Compression adds overhead for very small files.
- **OUTHLE.HLP** (561,150 uncompressed): Slightly larger compressed than uncompressed (570,906) — the IMPODE dictionary can be suboptimal for pre-compressed (HLP) data.
- All files use **field2=0** (ASCII literal mode, 8-bit flat literals).
- Most files use **field6=5** (8KB dictionary). Only `OUTPOST.INI` and `0WSCINIT.MID` use **field6=4** (4KB dictionary).

---

## 6. Data Flow Diagram

```
RESOURCE.000
│
├─ [0x00] Read 6-byte signature "DISK01" → validate
│
├─ [0x06] Read directory (15 × 26 bytes)
│  │
│  │  for each entry:
│  │    validate header[3] == '1'  (DH91 check)
│  │    read null-terminated filename from offset 0x04
│  │    read CompressedSize from offset 0x12
│  │    if filename == "THE_END": stop reading entries
│  │
│  └─→ Collect [HeaderInfo] list (14 entries)
│
├─ [0x18C] Read data blobs sequentially
│  │
│  │  for each HeaderInfo in order:
│  │    allocate CompressedSize bytes
│  │    read blob from current stream position
│  │    advance stream position by CompressedSize
│  │
│  └─→ Each blob has compressed data with HeaderInfo
│
└─ Decompress each blob:
     │
     ├─ Parse 3-byte compression header:
     │   byte[0] = field2  (mode)
     │   byte[1] = field6  (dict size)
     │   byte[2] = fieldA  (initial bit buffer)
     │
     ├─ Validate field6 ∈ {4, 5, 6}
     │
     ├─ Initialize IMPODE state:
     │   if field2 == 1: build binary Huffman decode tables
     │   build distance-code Huffman tables (always)
     │   build literal-code Huffman tables (if field2 == 0)
     │   initialize 4KB ring buffer (field1a) + 4KB overflow (field101a)
     │
     ├─ Main loop (Sub3EDB):
     │   │
     │   ├─ Decode symbol (Sub3FA6):
     │   │   ├─ Bit=1 → back-reference:
     │   │   │     read distance code from Huffman tree
     │   │   │     decode match length from distance + dict size
     │   │   │     copy [length] bytes from [output_pos - distance]
     │   │   │
     │   │   └─ Bit=0 → literal:
     │   │         if field2==0: read 8 raw bits
     │   │         if field2==1: read from binary Huffman tree
     │   │
     │   └─ Write byte to ring buffer
     │      flush to output every 4KB
     │
     └─→ Output: uncompressed byte array
```

---

## 7. Extraction Algorithm (Pseudocode)

```
function ExtractArchive(path):
    stream = File.OpenRead(path)
    
    // Validate header
    sig = stream.ReadBytes(6)
    assert sig == "DISK01"
    
    // Read directory
    entries = []
    while True:
        entry = stream.ReadBytes(26)
        assert entry[3] == '1'  // "DH91" check
        
        filename = ReadNullTerminated(entry, offset=4)
        if filename == "THE_END":
            break
        
        compressedSize = ReadUInt32LE(entry, 0x12)
        unk1 = ReadUInt16LE(entry, 0x16)
        unk2 = ReadUInt16LE(entry, 0x18)
        
        entries.append({filename, compressedSize, unk1, unk2})
    
    // Read compressed data blobs
    for each entry in entries:
        entry.compressedData = stream.ReadBytes(entry.compressedSize)
    
    // Decompress each blob
    for each entry in entries:
        entry.decompressedData = IMPODE_Decompress(entry.compressedData)
        WriteFile(entry.filename, entry.decompressedData)
```

### IMPODE Decompression

```
function IMPODE_Decompress(blob):
    if blob.length <= 4: return null
    
    field2 = blob[0]       // Compression mode
    field6 = blob[1]       // Dictionary size code
    fieldA = blob[2]       // Initial bit buffer
    
    if field6 < 4 or field6 > 6: return null
    if field2 != 0 and field2 != 1: return null
    
    dictSize = 0xFFFF >> (16 - field6)  // e.g., field6=5 → 0x1FFF
    readPos = 3
    
    // Initialize Huffman tables
    if field2 == 1:
        BuildBinaryLiteralTables()
    BuildDistanceTables()
    BuildLiteralTables()
    
    output = []
    ringBuf = bytearray[0x2000]
    ringPos = 0x1000
    
    while True:
        symbol = DecodeSymbol(field2, fieldA, &readPos)
        if symbol >= 0x305: break  // End of stream
        
        if symbol < 0x100:
            // Literal byte
            WriteByte(ringBuf, ringPos, symbol)
            output.append(symbol)
            ringPos++
        else:
            // Back-reference copy
            length = symbol - 0xFE
            distance = DecodeDistance(length, field6, dictSize, fieldA, &readPos)
            if distance == 0: break
            
            for i = 0..length-1:
                byte = ringBuf[ringPos - distance + i]
                WriteByte(ringBuf, ringPos + i, byte)
                output.append(byte)
            
            ringPos += length
        
        // Flush ring buffer to output every 4KB
        if ringPos >= 0x2000:
            FlushRingBuffer()
    
    return output
```

---

## 8. Extractor Tool

**Location**: `tools/resource-extractor/dotnet-cli/`

**Commands**:
```powershell
# List archive contents
dotnet run --project tools\resource-extractor\dotnet-cli\ResourceExtractor.csproj -c Release -- --list "Outpost\RESOURCE.000"

# Extract all files
dotnet run --project tools\resource-extractor\dotnet-cli\ResourceExtractor.csproj -c Release -- --extract "Outpost\RESOURCE.000" "output_dir"

# Extract specific files
dotnet run --project tools\resource-extractor\dotnet-cli\ResourceExtractor.csproj -c Release -- --extract "Outpost\RESOURCE.000" "output_dir" --files "OUTPOST.EXE,BLDGBLD.DAT"
```

### Implementation Notes

- The IMPODE decompression tables (`Byte31A7`, `Byte3167`, `Byte31F7`, etc.) were extracted directly from the `OUTPOST.EXE` binary's data segments
- The algorithm matches PKWare DCL Implosion (IMPODE) as documented in PKWare's technical reference
- The compressor was NOT reverse-engineered — the contract only specifies the decompression direction

---

## 9. Verification

### 9.1 Archive Integrity Checks

```powershell
$bytes = [System.IO.File]::ReadAllBytes("Outpost\RESOURCE.000")

# Check signature
$sig = [System.Text.Encoding]::ASCII.GetString($bytes[0..5])
# Expected: "DISK01"

# Verify directory count
$entryCount = 0
for ($i = 6; $i -lt 396; $i += 26) {
    $name = [System.Text.Encoding]::ASCII.GetString($bytes[$i..($i+15)]) -replace '\0.*$', ''
    $entryCount++
}
# Expected: 15 entries (14 files + THE_END)

# Verify entry sizes sum to data section
$totalCompressed = 0
for ($i = 6; $i -lt 396; $i += 26) {
    $name = [System.Text.Encoding]::ASCII.GetString($bytes[$i..($i+15)]) -replace '\0.*$', ''
    if ($name -eq "DH91THE_END") { break }
    $size = [System.BitConverter]::ToUInt32($bytes, $i + 0x12)
    $totalCompressed += $size
}
# Expected: $totalCompressed = 1,130,212 (archive minus 396 byte header)

# Verify data section start
$dataStart = 6 + (15 * 26)
# Expected: 396 (0x18C)
```

### 9.2 Extraction Results

| Check | Expected |
|-------|----------|
| Files extracted | 14 |
| Total uncompressed size | ~1,656,724 bytes |
| OUTPOST.EXE size | 640,896 bytes |
| BLDGBLD.DAT size | 12,403 bytes |
| BLDGOPS.DAT size | 14,049 bytes |
| TUTOR.OPS size | 20,276 bytes |

---

## 10. Known Limitations & Open Questions

1. **No repack support**: The current tool can only extract. The IMPODE compressor was not recovered — only the decompression direction was reverse-engineered from `OUTPOST.EXE`.
2. **Field1 purpose**: The 2-byte Field1 at offset 0x10 (values 0x13D7, 0x13FA, 0x1300) is not understood. It may relate to file priority, installation batch grouping, or compression parameter hints.
3. **Unk1/Unk2 purpose**: The 2-byte Unk1 and Unk2 fields at offsets 0x16 and 0x18 (sometimes forming a shared 4-byte "BatchID" value) are not understood. `0x0E40CE1E` repeats across multiple files. May be an install group identifier or timestamp.
4. **No checksum**: There is no per-file or archive-level integrity check.
5. **The "DISK01" signature**: Suggests this archive format may have been designed as a multi-volume disk format (DISK01, DISK02...), though only DISK01 exists for Outpost.
