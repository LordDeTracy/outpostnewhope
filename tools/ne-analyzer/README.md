# ne-analyzer — Win16 NE analysis tools for OUTPOST.EXE

Python 3.10+. `ne_disasm.py` needs Capstone (`pip install capstone`).

| Script | What it does |
|--------|--------------|
| `ne_parse.py EXE [out.json]` | Parses every NE table: header, 8-byte segment table, per-segment relocations (import ordinals resolved through `ordinals/*.spec`), resource table, resident/non-resident names, entry table |
| `ne_resources.py EXE OUT_DIR` | Decodes RT_STRING, RT_MENU, RT_DIALOG, RT_ACCELERATOR and RT_RCDATA into `resources.json` and a readable `resources.txt`; other types go to `raw/` |
| `ne_disasm.py EXE OUT_DIR` | Relocation-aware recursive-descent disassembler. Outputs `segNN.asm`, `functions.csv/json`, `vtables.txt/json`, `api_usage.txt` |
| `show_func.py DISASM_DIR sN:XXXX` | Prints one function from the listing |
| `research_switch.py DISASM_DIR [out.json]` | Walks the topic → discovery switch (`s3:6CF8`) symbolically, including the "all these topics done" conditions → `reference/outpost-exe/research-discoveries.json` |
| `save_layout.py DISASM_DIR ADDR...` | Lists the fields a save/load method writes or reads, in order (`File_write`/`File_read` of `this+OFF`, helper writers, branches) |
| `switch_map.py DISASM_DIR ADDR` | Resolves a value-mapping switch into an `in -> out` table (the save-version translators `s2:73EA`, `s2:72BC`) |

```bash
python ne_parse.py     "../../Resource.000 extract/OUTPOST.EXE" ../../reference/outpost-exe/ne.json
python ne_resources.py "../../Resource.000 extract/OUTPOST.EXE" ../../reference/outpost-exe
python ne_disasm.py    "../../Resource.000 extract/OUTPOST.EXE" ../../reference/outpost-exe/disasm
```

## How the disassembler works

1. **Relocation chains.** NE relocation records point at the head of a chain;
   for non-additive fixups each patched word holds the offset of the next
   site (0xFFFF ends). Walking them yields every import call and every
   inter-segment reference.
2. **Far calls.** Imports are `FAR_ADDR` fixups. Internal far calls are
   `9A off sel` with a `SEGMENT` fixup on the selector only; the offset is
   read from the instruction. Same-segment far calls are `push cs; call near`.
3. **Function discovery.** Seeds come from the entry table, `CS:IP`, all far
   call targets, near call targets, and `ENTER` prologues that directly follow
   decoded code or a `ret/retf`. Decoding is recursive descent.
4. **Switch tables.** `jmp cs:[bx+disp]` tables are read using the bound from
   the preceding `cmp`.
5. **Far vtables.** MSVC places C++ vtables (arrays of far pointers) in code
   segments. Uncovered `offset + SEGMENT-fixup` pairs that form runs, or point
   at a prologue, become new seeds. Constructors that store
   `es:[bx]=off, es:[bx+2]=SEG` mark vtables, reported in `vtables.txt`.
   (This also catches other far-pointer stores, so not every "vtable" is a
   class.)
6. **Naming.** `SC*` simulation classes are named from `push ds; push offset`
   references to their own name string; their vtable slots become
   `SCxxx::dtor/calcMe/shouldRun/clone`. Other names come from API
   fingerprints (MessageLoop, BlitDib_*, Mci_*, IniAccess_*, FileDialog_*).

Annotations in the listings: imported APIs (`USER.MessageBox`), internal
targets (`SCMorale@s7:ECC2`, `sub_s6:D1DC`), DGROUP string literals for
`push`/`mov` immediates, and `SEGMENT`/`OFFSET` fixups. String annotations
on immediates are hints: a number can coincide with a string offset.

## Address convention

`sN:XXXX` = segment N (1–11 as in the NE segment table), offset XXXX. File
offset = segment file offset (see `ne_parse.py` output) + XXXX.

## Ordinal tables

`ordinals/*.spec` holds only the ordinals OUTPOST.EXE imports, taken from
Wine's `dlls/{krnl386.exe16,user.exe16,gdi.exe16,mmsystem.dll16,commdlg.dll16}`
spec files. To analyze another Win16 binary, add the missing ordinals there.
