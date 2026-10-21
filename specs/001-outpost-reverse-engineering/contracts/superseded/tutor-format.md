# TUTOR.OPS — Sierra Outpost Tutorial Script Format

**File:** `TUTOR.OPS` (20,276 bytes)  
**Game:** Outpost (1994, Sierra On-Line)  
**Format:** Binary script with ASCII markers, little-endian 16-bit/32-bit values  
**Encoding:** No XOR obfuscation; plain binary with interleaved ASCII strings

---

## 1. File Header

```
Offset 0x00: 53 43 30 30 31       "SC001" (file signature, 5 bytes)
Offset 0x05: first section marker
```

The 5-byte file-level header is `SC001`. Immediately following is the first section marker.

---

## 2. Section Structure

The file is divided into **19 sections**, each identified by an ASCII marker of the form:

```
dcbSC<hhex>
```

Where `<hhex>` is a 2-character hex section ID (e.g., `01`, `02`, `0a`, `0f`, `10`, `13`).

Each section marker is exactly **7 bytes** (`dcbSC` + 2 hex chars). The section body begins at offset `marker_offset + 7`.

Sections appear mostly in ascending hex order (`01`–`13`) but `dcbSC0b` is repositioned to the end of the file (offset 20261).

### Section Inventory

| Section | Offset | Total Size | Body Size | Description |
|---------|--------|-----------|-----------|-------------|
| dcbSC01 | 0x0005 | 35 | 28 | Master reference table (14 × 16-bit values) |
| dcbSC02 | 0x0028 | 39 | 32 | Section header/descriptor |
| dcbSC03 | 0x004F | 309 | 302 | Flag bitfield (151 × 16-bit 0/1 flags) |
| dcbSC04 | 0x0184 | 35 | 28 | String table: "Aphrodite", "Anonymous Bosch" |
| dcbSC05 | 0x01A7 | 13 | 6 | 3 × 16-bit value (0, 3, 0) |
| dcbSC06 | 0x01B4 | 75 | 68 | Tutorial step sequence IDs |
| dcbSC07 | 0x01FF | 35 | 28 | 14 × 16-bit values (mostly 0x0001) |
| dcbSC08 | 0x0222 | 7 | 0 | Empty section (marker only) |
| dcbSC09 | 0x0229 | 43 | 36 | 9 × 32-bit data values |
| dcbSC0a | 0x0254 | 153 | 146 | Data block + index array (0–0x15) |
| dcbSC0c | 0x02ED | 70 | 63 | "Sigma Draconis" + mapping data |
| dcbSC0d | 0x0333 | 152 | 145 | "Sigma Draconis 4" + step reference data |
| dcbSC0e | 0x03CB | 220 | 213 | "Vulcan's Forge" + paired reference data |
| dcbSC0f | 0x04A7 | 3996 | 3989 | Script/data section (dialog text references) |
| dcbSC10 | 0x1443 | 7491 | 7484 | Main step definition table (133+ steps) |
| dcbSC11 | 0x3186 | 271 | 264 | Step-to-reference mapping table (26 entries) |
| dcbSC12 | 0x3295 | 5417 | 5410 | Event/condition mapping table |
| dcbSC13 | 0x47BE | 1895 | 1888 | 0x0000/0xFFFF flag matrix |
| dcbSC0b | 0x4F25 | 15 | 8 | Footer: two 32-bit values (both 2) |

---

## 3. Section-Level opcode system (instruction bytecode)

The script sections (`dcbSC0f`, `dcbSC10`, `dcbSC12`, `dcbSC13`) and many data sections use a common **instruction format** based on 2-byte opcode markers:

### 3.1 Instruction Encoding

```
Format: [<operands...>] 00 <op>
```

Each instruction is a **2-byte opcode** prefixed by `0x00`:
- Byte 1: `0x00` (opcode prefix)
- Byte 2: opcode type (1–255)

Operands precede the opcode (variable number of bytes, determined by opcode type).

### 3.2 Identified Opcodes

| Opcode | Bytes | Operands | Description |
|--------|-------|----------|-------------|
| `00 03` | 2+6 | 3 × 16-bit LE values | Text/string definition: `[length] [char_code] [padding]` |
| `00 04` | 2+4 | 2 × 16-bit LE values | Step header or reference link |
| `00 05` | 2+var | 1–3 × 16-bit LE values | General-purpose data/parameter instruction |
| `00 06` | 2+2 | 1 × 16-bit LE value | Mapping/condition opcode |
| `00 07` | 2+var | 0–4 × 16-bit LE values | End-of-record / separator; often followed by padding zeros |
| `00 08` | 2+? | variable | Condition sub-type (used in complex steps) |

### 3.3 Opcode Usage Patterns

**`00 03` — Text/String Definition**  
Followed by 3 LE 16-bit values: `[text_length] [character_code] [padding(typically 0x0000)]`. The character code is an ASCII code for speaker ID (e.g., `0x45='E'`, `0x43='C'`).

**`00 04` — Step/Section Header**  
Typically preceded by `01 00`, forming the `01 00 00 04` step header marker. The operand (16-bit LE) gives the step ID.

**`00 05` — Data Parameter**  
Preceded by 1–3 LE 16-bit operand values. Widely used — serves as a general-purpose data carrier. The operand count varies by context.

**`00 06` — Condition/Mapping Value**  
Preceded by a single LE 16-bit value. Used in dcbSC11 step-to-reference mapping records.

**`00 07` — End/Separator**  
Marks the end of a step record or data block. Often followed by 8 zero bytes (32-bit × 2 padding). In `dcbSC12` condition records, `00 07` takes additional operands (e.g., `06 00 00 05` pattern).

---

## 4. dcbSC10 — Step Definition Table (7484 bytes)

This is the largest section, containing the primary tutorial step definitions.

### 4.1 Section Header

```
C2 00 00 00       32-bit LE: section count/type = 194
```

### 4.2 Step Record Format

Each step record is **34 bytes** (some have additional data appended between records):

```
Offset  Size  Description
------  ----  -----------
 0       4    01 00 00 04        Step header marker
 4       2    XX 00              Step ID (LE 16-bit)
 6       2    00 05              Opcode: parameter
 8       2    03 00              Value 3
10       2    00 03              Opcode: text definition
12       2    YY 00              Text length (LE 16-bit, typical: 17–27)
14       2    ZZ 00              Character/speaker code (LE 16-bit ASCII)
16       8    [see 4.3]          Parameter block (4 × 16-bit values)
24       2    00 07              End marker opcode
26       8    00 ... 00          Zero padding (4 × 16-bit = 8 bytes)
```

### 4.3 Parameter Block (bytes 16–23)

**Simple steps** (most common):
```
00 00  01 00  05 00  XX 00
```
- `00 00`: flag (0)
- `01 00`: flag (1)
- `05 00`: type (5 = display timer)
- `XX 00`: timer/display duration value

**Complex steps** (condition-based):
```
01 00  07 00  06 00  15 00
```
- `01 00`: flag (also seen: `02 00`, `03 00`, `04 00`)
- `07 00`: condition type (7 = character interaction condition)
- `06 00`: parameter (constant 6)
- `15 00`: parameter (typically 0x15 = 21 or varies)

**Complex steps (type 8):**
```
01 00  08 00  06 00  XX 00
```
- `01 00`: flag
- `08 00`: condition type (8 = different condition)
- `06 00`: parameter (6)
- `XX 00`: parameter (varies, e.g., `63 00` = 99)

### 4.4 Character/Speaker Codes

Codes used across all step records:

| Code | Count | Meaning |
|------|-------|---------|
| `0x40` '@' | 11 | Special/system |
| `0x41` 'A' | 10 | Character A |
| `0x42` 'B' | 12 | Character B |
| `0x43` 'C' | 18 | **Commander?** (most frequent) |
| `0x44` 'D' | 16 | **Doctor?** |
| `0x45` 'E' | 13 | **Engineer?** |
| `0x46` 'F' | 10 | Character F |
| `0x47` 'G' | 9 | Character G |
| `0x48` 'H' | 2 | Character H |
| `0x3E` '>' | 8 | Special marker |
| `0x3F` '?' | 8 | Special marker |
| `0x3D` '=' | 4 | Special marker |
| `0x79` 'y' | 1 | Rare |

### 4.5 Text Length Distribution

Typical dialog line lengths: 17–27 bytes (range includes potential formatting characters).  
Outlier lengths: 93, 141, 147, 220, 221, 283 bytes — these may include embedded formatting or multi-line text.

### 4.6 Step ID Distribution

133 step definitions found with IDs ranging from 2 to 348 (sparse — not all IDs are used). Steps are not stored in sequential order; some IDs reference shared dialog blocks.

---

## 5. dcbSC0f — Script Text/Dialog Reference Section (3989 bytes)

### 5.1 Overall Structure

```
02 00 00 00        32-bit header (type = 2)
01 00              16-bit value (1)
00 04              Opcode: reference
03 00              16-bit value (3)
00 03              Opcode: text def
C8 00 00 00        32-bit: 200 (zero-block count)
[200 zero bytes]   Padding/flags (200 × 0x00)
[script records]   Records referencing text and IDs
```

### 5.2 Script Record Format

After the initial header and 200 zero bytes, the section contains a sequence of `00 05`-delimited records:

```
XX 00 YY 00 00 05
```

Where:
- `XX 00`: index/opcode (e.g., 0x02, 0x03, 0x05, 0x06, 0x07, etc.)
- `YY 00`: value or ASCII character code
- `00 05`: record terminator

Special reference values (prefixed with `0x01` in high byte):
- `54 01` (0x0154 = 340)
- `55 01` (0x0155 = 341)
- `56 01` (0x0156 = 342)
- `57 01` (0x0157 = 343)
- `52 01` (0x0152 = 338)
- etc.

These high-byte-prefixed values (`01xx`) serve as **cross-references** to dialog blocks or script entry points, also referenced by the dcbSC11 mapping table.

### 5.3 Embedded String Records

The section contains embedded string data with a record format around strings:

```
[4 bytes: 01 00 01 00 01 00 01 00]   flags
04 00 00 00                            record type (4 = text)
32 00                                  value (50)
0A 00 0A 00 0A 00                      values (10, 10, 10)
4B 00                                  value (75 = 'K')
[zero padding]
05 00 00 00                            record type (5 = string)
[zero padding]
<string> 00                            null-terminated ASCII string
[more data]
```

Strings found: `"Vulcan's Forge"`, `"Rebel"`

---

## 6. dcbSC11 — Step-to-Reference Mapping (264 bytes)

### 6.1 Header

```
1A 00 00 00        32-bit LE: record count = 26
```

### 6.2 Record Format (10 bytes each)

```
Offset  Size  Field
------  ----  -----
 0      2     Sequence index (1–26, LE 16-bit)
 2      2     00 06    Opcode 06 (mapping type)
 4      2     XX YY    Reference value (LE 16-bit, e.g., 0x0157, 0x015F)
 6      2     00 05    Opcode 05 (target type)
 8      2     ZZ 00    Target index (1–5, LE 16-bit)
```

### 6.3 Mapping Table (all 26 entries)

| Seq | Ref | Target | Notes |
|-----|------|--------|-------|
| 1 | 0x0157 | 1 | Dialog set 0x157, speaker 1 |
| 2 | 0x0157 | 2 | Speaker 2 |
| 3 | 0x0157 | 3 | Speaker 3 |
| 4 | 0x0157 | 4 | Speaker 4 |
| 5 | 0x015F | 1 | Dialog set 0x15F |
| 6 | 0x015F | 2 | |
| 7 | 0x015F | 3 | |
| 8 | 0x015F | 4 | |
| 9 | 0x0156 | 5 | |
| 10 | 0x015E | 5 | |
| 11 | 0x0056 | 5 | |
| 12 | 0x0007 | 5 | |
| 13 | 0x0007 | 5 | |
| 14 | 0x0036 | 1 | |
| 15 | 0x0036 | 1 | |
| 16 | 0x0036 | 1 | |
| 17 | 0x0036 | 1 | |
| 18 | 0x0036 | 1 | |
| 19 | 0x0036 | 3 | |
| 20 | 0x0051 | 5 | |
| 21 | 0x0038 | 5 | |
| 22 | 0x0038 | 5 | |
| 23 | 0x0036 | 3 | |
| 24 | 0x0036 | 3 | |
| 25 | 0x0049 | 5 | |
| 26 | 0x0036 | 3 | |

---

## 7. dcbSC12 — Event/Condition Mapping (5410 bytes)

### 7.1 Section Header

```
C2 00 00 00        32-bit LE: section count/type = 194
```

### 7.2 Record Format

This section contains condition/event definitions with short string codes.

```
XX 00               ID / trigger code
03 00               value 3
00 07               Opcode 07 (condition header)
YY 00               condition parameter
00 05               Opcode 05 (data marker)
ZZ 00  AA 00  BB 00  short string code (2–4 characters, 16-bit LE per char)
05 00               value 5
00 00               padding
03 00               value 3
00 00 00 00 00 00 00 00 00 00 00  11 zero bytes
```

### 7.3 Short String Codes

Character codes stored as 16-bit LE values forming trigger IDs:
- `3E 00 40 00` = `>@`
- `3E 00 42 00` = `>B`
- `63 00 68 00` = `ch`
- `63 00 69 00` = `ci`
- `76 00 76 00 67 00` = `vvg`
- `30 00 3E 00 41 00` = `0>A`
- `58 00 63 00 69 00` = `Xci`
- `47 00 63 00 68 00` = `Gch`
- `47 00 63 00 69 00` = `Gci`

---

## 8. Data Sections

### 8.1 dcbSC01 — Master Reference Table (28 bytes, 14 × 16-bit)

```
Values: 3, 10, 2, 121, 9, 119, 2, 1, 19, 1, 0, 1, 3, 0
```

Likely cross-references to section IDs, step counts, or offsets.

### 8.2 dcbSC03 — Flag Bitfield (302 bytes, 151 × 16-bit)

An array of 151 LE 16-bit values, each either `0x0000` or `0x0001`. Terminated by `0x0030` (48). Represents a tutorial step completeness matrix or binary state array.

### 8.3 dcbSC04 — String Table

```
"Aphrodite\0Anonymous Bosch\0<02 00>"
```

Two null-terminated star system names, followed by LE 16-bit value 2.

### 8.4 dcbSC06 — Tutorial Step Sequence

Section defining step order with `00 04` opcode linking IDs:

```
08 00 03 00  01 00 00 04  04 00 01 00  00 04  12 00  01 00
00 04  05 00  01 00  00 04  11 00  01 00  00 04  0D 00  01 00
00 04  0C 00  01 00  00 04  10 00  01 00  00 04  01 00  ...
```

IDs used: 08, 04, 12, 05, 11, 0D, 0C, 10, 01 (tutorial step sequence?).

### 8.5 dcbSC0c / dcbSC0d / dcbSC0e — Named Data Records

Each contains a null-terminated ASCII string (star system or colony name) followed by structured data:

**dcbSC0c:** `"Sigma Draconis"` + mapping data  
**dcbSC0d:** `"Sigma Draconis 4"` + step reference data (IDs: 0x11, 0x0A, 0x0E, 0x15, etc.)  
**dcbSC0e:** `"Vulcan's Forge"` + paired reference values (0x1C, 0x8D, etc.)

### 8.6 dcbSC13 — 0x0000/0xFFFF Flag Matrix

A pattern of interleaved `0x0000` (active) and `0xFFFF` (inactive/complete) 16-bit flags. Likely a section completion matrix parallel to dcbSC03.

### 8.7 dcbSC0b — Footer

```
02 00 00 00  02 00 00 00    (two 32-bit values, both = 2)
```

---

## 9. Section Linking Mechanism

### 9.1 How Sections Reference Each Other

```
dcbSC01 (master table)
   |
   +--> dcbSC02 (section descriptor)
   |       |
   |       +--> dcbSC03 (flag matrix)
   |       
   +--> dcbSC04 (string table: system names)
   |       |
   |       +--> dcbSC0c/dcbSC0d/dcbSC0e (named data records)
   |       
   +--> dcbSC06 (step sequence)
   |
   +--> dcbSC11 (step-to-reference mapping)
              |
              +--> dcbSC0f (script references/entry points)
              |       |
              |       +--> references into dcbSC10 step table
              |       
              +--> dcbSC12 (event/condition mapping)
              
dcbSC10 (step definition table) <--- primary tutorial script
   |
   +--> references dcbSC0f/SC11/SC12 for dialog and conditions
```

### 9.2 Reference Value System

High-byte-prefixed values (`0x01xx`) serve as the primary linking mechanism:

- **0x0154, 0x0155, 0x0156, 0x0157, 0x015E, 0x015F** — script entry point references in dcbSC0f
- **0x0152, 0x0154, 0x0156, 0x0157, 0x015B, 0x015C** — dialog block IDs
- **0x0007, 0x0036, 0x0038, 0x0049, 0x0051, 0x0056** — condition IDs

These values appear in both dcbSC0f (as script record operands) and dcbSC11 (as mapping table references), establishing the link between tutorial step sequences and dialog/event data.

---

## 10. Data Type Summary

| Type | Size | Encoding | Description |
|------|------|----------|-------------|
| u8 | 1 byte | native | Single byte (rare, mostly in opcodes) |
| u16 | 2 bytes | LE | Primary data type |
| u32 | 4 bytes | LE | Headers, counts, some values |
| string | variable | null-terminated ASCII | Section markers, system names |
| wchar | 2 bytes | LE | Extended character storage (e.g., speaker IDs) |
| opcode | 2 bytes | `00 XX` | Instruction prefix with type byte |
| flags | 2 bytes | LE 0x0000/0x0001 or 0xFFFF | Boolean/flag arrays |

---

## 11. Notes for Disassembler Implementation

1. **Parse order:** Scan for `dcbSC` markers → extract section bodies → parse data sections first → then script sections.

2. **Section linking:** The dcbSC11 mapping table is the key linking structure — it maps tutorial step sequence numbers (1–26) to dialog script references and speaker targets.

3. **Opcode dispatch:** Implement a state machine that reads `00` as an opcode prefix, then dispatches based on the following byte. Each opcode consumes a fixed or context-dependent number of operand bytes.

4. **Step parsing:** In dcbSC10, step records are 34 bytes aligned. However, extra script data may be interleaved between steps. The step header `01 00 00 04` is the reliable boundary marker.

5. **String extraction:** ASCII strings are null-terminated. "Wide" characters (speaker codes) are 16-bit LE values that happen to match ASCII codes for printable characters (0x41–0x5A, 0x30–0x39, etc.).

6. **Endianness:** All multi-byte values are little-endian, consistent with the x86 platform.

7. **Character codes (bytes 14–15 in step records):** These are LE 16-bit ASCII codes for speaker identity ('A'–'H', '@', '>', '?', '='). In an emulator/decompiler, map to character names or dialog box headers.

8. **Text length (bytes 12–13 in step records):** This length includes the character code byte and padding. Actual dialog text must be fetched from game resource files (likely `TUTOR.MSG`, `DIALOG.MSG`, or similar).

9. **Condition type (bytes 16–23 in step records):** When byte 17 is `0x07` or `0x08`, the step has conditional prerequisites. The interpretation of the remaining parameter bytes depends on the condition type:
   - Type 7: `[01/02/03] 00 07 00 06 00 [value] 00` — character/action condition
   - Type 8: `01 00 08 00 06 00 [value] 00` — different condition type
   - Type 5: `00 00 01 00 05 00 [timer] 00` — timing/duration condition

10. **The `00 05` opcode** is the most versatile — its operand count varies from 1 to 3 × 16-bit values depending on context. A disassembler should track virtual "address" within each section, noting the operand count for each `00 05` occurrence based on the data between it and the next opcode.

---

*Documented by reverse engineering TUTOR.OPS — Outpost (1994, Sierra On-Line)*
