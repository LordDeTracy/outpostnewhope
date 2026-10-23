"""Classifies the bytes the disassembler left as `db` (inside or between functions).

Usage: python undecoded.py EXE [out.txt]

A run of `db` bytes is:
  vtable    mostly far pointers (offset word + SEGMENT fixup)
  padding   0x00 / 0x90 filler
  code      decodes as instructions up to a RET/RETF/JMP without invalid opcodes,
            and starts with a prologue (ENTER, push bp / mov bp, sp, mov ax, ds / nop / inc bp)
  data      anything else (tables, strings in the code segment)
Code runs are what the recursive disassembler never reached (window procedures,
callbacks reached only through far pointers in data).
"""
import json
import os
import re
import sys

from capstone import CS_ARCH_X86, CS_MODE_16, Cs

HERE = os.path.dirname(os.path.abspath(__file__))
REF = os.path.join(HERE, "..", "..", "reference", "outpost-exe")


def runs(seg):
    """(start, bytes, owner) of each contiguous db run in a listing."""
    out, cur, owner = [], None, None
    for line in open(os.path.join(REF, "disasm", f"seg{seg:02d}.asm")):
        if line.startswith("; ----------------"):
            lab = line.split()[2]
            owner = lab.split("@")[-1] if "@" in lab else lab[4:]
            cur = None
            continue
        m = re.match(r"\d+:([0-9A-F]{4})  db ((?:[0-9a-f]{2} ?)+)", line)
        if m:
            o = int(m.group(1), 16)
            b = bytes.fromhex(m.group(2).replace(" ", ""))
            if cur and cur[0] + len(cur[1]) == o:
                cur[1] += b
            else:
                cur = [o, bytearray(b), owner]
                out.append(cur)
        else:
            cur = None
    return out


def looks_like_code(md, b, base):
    if not (b[:1] == b"\xc8" or b[:3] == b"\x55\x8b\xec" or b[:4] == b"\x8c\xd8\x90\x45"):
        return False, 0
    n = 0
    for insn in md.disasm(bytes(b), base):
        n = insn.address - base + insn.size
        if insn.mnemonic in ("ret", "retf", "iret"):
            return True, n
    return False, n


def main(exe, out=None):
    ne = json.load(open(os.path.join(REF, "ne.json")))
    md = Cs(CS_ARCH_X86, CS_MODE_16)
    totals, rows = {}, []
    for seg in ne["segments"]:
        if seg["kind"] != "CODE":
            continue
        i = seg["index"]
        segfix = {r["offset"] for r in seg["relocs"] if r["addr"] == "SEGMENT"}
        for o, b, owner in runs(i):
            n = len(b)
            fixes = sum(1 for k in range(o, o + n) if k in segfix)
            if fixes and fixes * 4 >= n * 0.5:
                kind = "vtable"
            elif all(x in (0, 0x90) for x in b):
                kind = "padding"
            else:
                ok, length = looks_like_code(md, b, o)
                kind = "code" if ok else "data"
            totals[kind] = totals.get(kind, 0) + n
            if n >= 6:
                rows.append(f"s{i}:{o:04X} {n:6} {kind:7} in {owner}  {bytes(b[:12]).hex(' ')}")
    report = [f"{k}: {v} bytes" for k, v in sorted(totals.items())]
    if out:
        open(out, "w").write("\n".join(report + [""] + rows) + "\n")
    print("\n".join(report))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None)
