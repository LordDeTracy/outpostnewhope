"""Recover OUTPOST.EXE's building-type -> C++ class map.

Reads the factory `s7:07AC` (switch on building type -> operator new(size) +
constructor call) from the disassembler listing, finds the vtable each
constructor installs, and joins with the BLDGBLD.DAT record names.

Usage: python building_classes.py DISASM_DIR BLDGBLD.DAT [out.json]
"""
import csv
import io
import json
import re
import sys

from show_func import find


def bldg_names(path):
    names = []
    for line in open(path, "rb").read().split(b"\r\n"):
        if line:
            row = next(csv.reader(io.StringIO(bytes(c ^ 0x80 for c in line).decode("latin-1"))))
            names.append(row[0])
    return names


def main(disasm, bldgbld, out=None):
    names = bldg_names(bldgbld)
    lines = find(disasm, "s7:07AC")
    # switch table: entries follow "switch_table_0FA8:" as "dw loc_XXXX"
    i = next(k for k, l in enumerate(lines) if l.startswith("switch_table_0FA8"))
    targets = []
    for l in lines[i + 1:]:
        m = re.match(r"\s+dw loc_([0-9A-F]{4})", l)
        if not m:
            break
        targets.append(m.group(1))
    # each case block: push <size> ; lcall operator new ; ... ; lcall <ctor>
    pos = {re.match(r"7:([0-9A-F]{4})", l).group(1): k
           for k, l in enumerate(lines) if re.match(r"7:[0-9A-F]{4}", l)}
    labels = {re.match(r"loc_([0-9A-F]{4})", l).group(1): k
              for k, l in enumerate(lines) if l.startswith("loc_")}

    def case_info(lab, size=None, depth=0):
        k = labels.get(lab, pos.get(lab))
        for l in lines[k:k + 25]:
            m = re.search(r"push 0x([0-9a-f]+)", l)
            if m and size is None and "sub_s1:179C" not in l:
                size = int(m.group(1), 16)
            m = re.search(r"; (?:\S+@)?(?:sub_)?(s\d+:[0-9A-F]{4})\s*$", l)
            if re.search(r"\b(l?call)\b", l) and m and m.group(1) != "s1:179C":
                return size, m.group(1)
            # allocation succeeded -> shared constructor tail elsewhere
            m = re.search(r"\bjne 0x([0-9a-f]+)", l)
            if m and depth < 2 and size is not None:
                return case_info(f"{int(m.group(1), 16):04X}", size, depth + 1)
        return size, None

    rows = []
    for idx, lab in enumerate(targets[:127]):
        t = idx + 1
        size, ctor = case_info(lab)
        rows.append(dict(type=t, name=names[t] if t < len(names) else "?",
                         case=lab, size=size, ctor=ctor))
    by_ctor = {}
    for r in rows:
        by_ctor.setdefault(r["ctor"], []).append(r)
    for c, rs in sorted(by_ctor.items(), key=lambda x: str(x[0])):
        print(f"{str(c):<9} size={str(rs[0]['size']):>4}  " +
              ", ".join(f"{r['type']}:{r['name']}" for r in rs))
    if out:
        json.dump(rows, open(out, "w"), indent=1)


if __name__ == "__main__":
    main(*sys.argv[1:])
