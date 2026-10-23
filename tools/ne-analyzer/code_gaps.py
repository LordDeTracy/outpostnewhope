"""Classifies the code-segment bytes that no discovered function covers.

Usage: python code_gaps.py EXE [out.txt]

Each gap between functions is classed as:
  vtable    runs of far pointers (offset word + SEGMENT fixup) into code
  switch    a jump table (listed by the disassembler)
  padding   0x00 / 0x90 / 0xCC filler
  data      anything else that decodes badly as code (tables in the code segment)
  code?     bytes that start like a function prologue (ENTER, push bp / mov bp, sp)
"""
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DIS = os.path.join(HERE, "..", "..", "reference", "outpost-exe", "disasm")


def main(exe, out=None):
    ne = json.load(open(os.path.join(HERE, "..", "..", "reference", "outpost-exe", "ne.json")))
    data = open(exe, "rb").read()
    shift = ne["header"].get("align_shift", ne["header"].get("alignment_shift", 9))
    funcs = json.load(open(os.path.join(DIS, "functions.json")))
    by = {}
    for f in funcs:
        s, o = f["addr"].split(":")
        by.setdefault(int(s[1:]), []).append((int(o, 16), f["size"]))
    tables = {}
    for i in range(1, 10):
        fn = os.path.join(DIS, f"seg{i:02d}.asm")
        cur = None
        for line in open(fn):
            m = re.match(r"switch_table_([0-9A-F]{4}):", line)
            if m:
                cur = int(m.group(1), 16)
                tables[(i, cur)] = 0
            elif cur is not None and line.startswith("    dw "):
                tables[(i, cur)] += 2
            else:
                cur = None
    lines, totals = [], {}
    for seg in ne["segments"]:
        if seg["kind"] != "CODE":
            continue
        i = seg["index"]
        raw = data[seg["file_offset"]:seg["file_offset"] + seg["length"]]
        segfix = {r["offset"] for r in seg["relocs"] if r["addr"] == "SEGMENT"}
        cov = bytearray(len(raw))
        for o, sz in by.get(i, []):
            for k in range(o, min(o + sz, len(raw))):
                cov[k] = 1
        for (s, o), n in tables.items():
            if s == i:
                for k in range(o, min(o + n, len(raw))):
                    cov[k] = 2
        o = 0
        while o < len(raw):
            if cov[o]:
                o += 1
                continue
            e = o
            while e < len(raw) and not cov[e]:
                e += 1
            chunk = raw[o:e]
            n = len(chunk)
            fix = sum(1 for k in range(o, e) if k in segfix)
            if fix and fix * 4 >= n * 0.6:
                kind = "vtable"
            elif all(b in (0, 0x90, 0xCC) for b in chunk):
                kind = "padding"
            elif chunk[:1] == b"\xc8" or chunk[:3] == b"\x55\x8b\xec":
                kind = "code?"
            else:
                kind = "data"
            totals[kind] = totals.get(kind, 0) + n
            if n >= 8 or kind == "code?":
                lines.append(f"s{i}:{o:04X}  {n:5}  {kind:8} {chunk[:16].hex(' ')}")
            o = e
    report = [f"{k}: {v} bytes" for k, v in sorted(totals.items())]
    text = "\n".join(report + [""] + lines)
    if out:
        open(out, "w").write(text + "\n")
    print("\n".join(report))


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None)
