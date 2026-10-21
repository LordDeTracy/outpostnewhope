"""Print one function's listing from the disassembler output.

Usage: python show_func.py DISASM_DIR ADDR_OR_NAME [max_lines]
  ADDR_OR_NAME: "s6:A9F4", or any substring of the function label
  (e.g. "SCPower::calcMe"). Data (`db`) lines are omitted.
"""
import glob
import os
import re
import sys


def find(disasm_dir, key):
    m = re.match(r"s(\d+):([0-9A-Fa-f]{4})$", key)
    files = ([os.path.join(disasm_dir, f"seg{int(m.group(1)):02d}.asm")] if m
             else sorted(glob.glob(os.path.join(disasm_dir, "seg*.asm"))))
    needle = f"s{int(m.group(1))}:{m.group(2).upper()}" if m else key
    for fn in files:
        out, on = [], False
        for line in open(fn):
            if line.startswith("; ----------------"):
                if on:
                    return out
                lab = line.split()[2]
                on = (lab.endswith("@" + needle) or lab == "sub_" + needle) if m \
                    else needle in lab
                if on:
                    out.append(line.rstrip())
            elif on and " db " not in line:
                out.append(line.rstrip())
        if on:
            return out
    return []


if __name__ == "__main__":
    lines = find(sys.argv[1], sys.argv[2])
    if not lines:
        sys.exit(f"not found: {sys.argv[2]}")
    n = int(sys.argv[3]) if len(sys.argv) > 3 else 10 ** 9
    print("\n".join(l[:130] for l in lines[:n]))
