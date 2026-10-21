"""Relocation-aware recursive-descent disassembler for 16-bit NE executables.

Follows NE relocation chains so every far call resolves to either an
imported API (KERNEL.GlobalAlloc ...) or an internal seg:offset; discovers
functions from the entry table, far-call targets, near-call targets and
ENTER prologues; decodes MSVC `jmp cs:[bx+table]` switch tables; and
annotates immediates that point at DGROUP strings.

Outputs (in out_dir):
  segNN.asm         annotated listing per code segment
  functions.csv     one row per discovered function
  functions.json    same, with callers/callees, APIs and strings
  api_usage.txt     every imported API -> calling functions

Usage: python ne_disasm.py OUTPOST.EXE out_dir
"""
import csv
import json
import os
import re
import struct
import sys
from collections import defaultdict

import capstone
from capstone import x86

from ne_parse import parse

TERMINATORS = {"ret", "retf", "iret"}
ENTER_RE = re.compile(b"\xc8..\x00", re.S)


def build_fixups(b, info):
    """Walk relocation chains -> {seg: {offset: (addrtype, target-str)}}."""
    fix = defaultdict(dict)
    for s in info["segments"]:
        base = s["file_offset"]
        data = b[base:base + s["length"]]
        for r in s["relocs"]:
            if r["type"] == "IMPORTORDINAL" or r["type"] == "IMPORTNAME":
                tgt = f"{r['module']}.{r['name']}"
            elif r["type"] == "INTERNALREF":
                tgt = (f"s{r['seg']}:{r['target']:04X}" if "seg" in r
                       else f"entry#{r['movable_entry']}")
            else:
                tgt = f"OSFIXUP{r.get('fixup')}"
            pos = r["offset"]
            seen = set()
            while True:
                fix[s["index"]][pos] = (r["addr"], tgt)
                if r["additive"] or pos in seen or pos + 2 > len(data):
                    break
                seen.add(pos)
                nxt = struct.unpack_from("<H", data, pos)[0]
                if nxt == 0xFFFF:
                    break
                pos = nxt
    return fix


def string_table(b, info):
    seg = info["segments"][info["header"]["autodata_seg"] - 1]
    d = b[seg["file_offset"]:seg["file_offset"] + seg["length"]]
    strs = {}
    for m in re.finditer(rb"[\x20-\x7e\t\r\n]{3,}\x00", d):
        strs[m.start()] = m.group()[:-1].decode()
    return strs


class SegDisasm:
    def __init__(self, idx, data, fixups, md):
        self.idx, self.data, self.fix, self.md = idx, data, fixups, md
        self.insns = {}          # offset -> capstone insn
        self.funcs = set()
        self.far_funcs = set()
        self.labels = set()
        self.tables = {}         # table offset -> list of targets
        self.cov = bytearray(len(data) + 1)

    def far_target(self, insn):
        """Resolve an lcall/ljmp: ('api', name) or ('int', (seg, off))."""
        o, fx = self.fixup_at(insn)
        if not fx:
            return None
        kind, tgt = fx
        m = re.match(r"s(\d+):([0-9A-F]{4})$", tgt)
        if m and kind == "SEGMENT":
            return "int", (int(m.group(1)),
                           struct.unpack_from("<H", self.data, insn.address + 1)[0])
        if m:
            return "int", (int(m.group(1)), int(m.group(2), 16))
        if tgt.startswith("entry#"):
            return "entry", int(tgt[6:])
        return "api", tgt

    def fixup_at(self, insn):
        for o in range(insn.address, insn.address + insn.size):
            if o in self.fix:
                return o, self.fix[o]
        return None, None

    def decode_from(self, start, queue):
        pc = start
        prev = []
        while 0 <= pc < len(self.data) and pc not in self.insns:
            try:
                insn = next(self.md.disasm(self.data[pc:pc + 16], pc), None)
            except capstone.CsError:
                insn = None
            if insn is None:
                return
            self.insns[pc] = insn
            self.cov[pc:pc + insn.size] = bytes([1]) * insn.size
            m = insn.mnemonic
            nxt = pc + insn.size
            ops = insn.operands
            if m == "call" and ops and ops[0].type == x86.X86_OP_IMM:
                t = ops[0].imm & 0xFFFF
                self.funcs.add(t)
                if prev and prev[-1].mnemonic == "push" and prev[-1].op_str == "cs":
                    self.far_funcs.add(t)
                queue.append(t)
            elif m == "jmp" or m.startswith("j") or m.startswith("loop") or m == "jcxz":
                if ops and ops[0].type == x86.X86_OP_IMM:
                    t = ops[0].imm & 0xFFFF
                    self.labels.add(t)
                    queue.append(t)
                elif m == "jmp" and ops and ops[0].type == x86.X86_OP_MEM \
                        and ops[0].mem.segment == x86.X86_REG_CS:
                    self.switch_table(ops[0].mem.disp & 0xFFFF, prev, queue)
                if m == "jmp" or m == "ljmp":
                    return
            elif m in TERMINATORS or m == "ljmp" or (m == "int" and insn.op_str == "0x20"):
                return
            elif m == "lcall":
                off, fx = self.fixup_at(insn)
                if fx and fx[1].endswith(("FatalExit", "FatalAppExit")):
                    return
            prev = (prev + [insn])[-6:]
            pc = nxt

    def switch_table(self, tbl, prev, queue):
        count = None
        for p in reversed(prev):
            if p.mnemonic == "cmp" and len(p.operands) == 2 and \
                    p.operands[1].type == x86.X86_OP_IMM:
                count = (p.operands[1].imm & 0xFFFF) + 1
                break
        targets = []
        n = count if count and count <= 512 else 256
        for i in range(n):
            p = tbl + 2 * i
            if p + 2 > len(self.data) or p in self.insns:
                break
            t = struct.unpack_from("<H", self.data, p)[0]
            if t >= len(self.data):
                break
            targets.append(t)
        self.tables[tbl] = targets
        self.cov[tbl:tbl + 2 * len(targets)] = bytes([1]) * (2 * len(targets))
        for t in targets:
            self.labels.add(t)
            queue.append(t)

    def run(self, seeds):
        queue = list(seeds)
        tried = set()

        def drain(q):
            while q:
                self.decode_from(q.pop(), q)
        drain(queue)
        # second chance: ENTER prologues in undecoded gaps that sit right
        # after decoded code or a ret/retf/retf n; repeat until stable
        d = self.data
        while True:
            progressed = False
            for m in ENTER_RE.finditer(d):
                o = m.start()
                if o in tried or self.cov[o]:
                    continue
                after_code = o == 0 or self.cov[o - 1] or d[o - 1] in (0xC3, 0xCB, 0x90)
                if after_code or (o >= 3 and d[o - 3] in (0xCA, 0xC2)):
                    tried.add(o)
                    self.funcs.add(o)
                    drain([o])
                    progressed = True
            if not progressed:
                break
        # drop "functions" whose first instruction never decoded
        self.funcs = {f for f in self.funcs if f in self.insns}

    def coverage(self):
        return self.cov


def main(exe, outdir):
    os.makedirs(outdir, exist_ok=True)
    b = open(exe, "rb").read()
    info = parse(exe)
    fix = build_fixups(b, info)
    strs = string_table(b, info)
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_16)
    md.detail = True

    code_segs = [s for s in info["segments"] if s["kind"] == "CODE"]
    seeds = defaultdict(set)
    for e in info["entries"]:
        seeds[e["seg"]].add(e["offset"])
    entry_ord = {e["ordinal"]: (e["seg"], e["offset"]) for e in info["entries"]}
    cs, ip = info["header"]["cs_ip"].split(":")
    seeds[int(cs)].add(int(ip, 16))
    far_targets = defaultdict(set)
    for s in info["segments"]:
        data = b[s["file_offset"]:s["file_offset"] + s["length"]]
        for pos, (kind, tgt) in fix.get(s["index"], {}).items():
            m = re.match(r"s(\d+):([0-9A-F]{4})$", tgt)
            if not m:
                continue
            if kind == "FAR_ADDR":
                far_targets[int(m.group(1))].add(int(m.group(2), 16))
            elif kind == "SEGMENT" and pos >= 3 and data[pos - 3] == 0x9A:
                # call far imm: only the selector is fixed up, offset is inline
                far_targets[int(m.group(1))].add(
                    struct.unpack_from("<H", data, pos - 2)[0])
    for s, offs in far_targets.items():
        seeds[s] |= offs

    dis = {}
    for s in code_segs:
        i = s["index"]
        data = b[s["file_offset"]:s["file_offset"] + s["length"]]
        d = SegDisasm(i, data, fix.get(i, {}), md)
        d.funcs |= seeds[i]
        d.far_funcs |= far_targets[i]
        d.run(seeds[i])
        dis[i] = d

    # Far pointers stored as data inside code segments (MSVC far vtables,
    # callback tables): offset word followed by a selector word carrying an
    # internal SEGMENT fixup. Harvest those not covered by code as new seeds,
    # and repeat until no new code is found.
    def data_farptrs(i):
        d = dis[i]
        out = []
        for pos, (kind, tgt) in d.fix.items():
            m = re.match(r"s(\d+):0000$", tgt)
            if kind != "SEGMENT" or not m or pos < 2:
                continue
            if d.cov[pos - 2] or d.cov[pos] or d.data[pos - 3:pos - 2] == b"\x9a":
                continue
            out.append((pos - 2, int(m.group(1)),
                        struct.unpack_from("<H", d.data, pos - 2)[0]))
        return sorted(out)

    def plausible(t, off):
        if t not in dis or off >= len(dis[t].data):
            return False
        head = dis[t].data[off:off + 4]
        return (head[:1] == b"\xc8" and head[3:4] == b"\x00") or \
            head[:3] == b"\x55\x8b\xec" or head[:4] == b"\x45\x55\x8b\xec" or \
            head[:2] in (b"\x8c\xd8", b"\x1e\x58")

    for _ in range(20):
        new = defaultdict(set)
        for i in dis:
            ptrs = data_farptrs(i)
            pos_set = {p for p, _, _ in ptrs}
            for p, t, off in ptrs:
                in_run = (p - 4) in pos_set or (p + 4) in pos_set
                if t in dis and (in_run or plausible(t, off)) and off not in dis[t].insns:
                    new[t].add(off)
        if not new:
            break
        for t, offs in new.items():
            dis[t].funcs |= offs
            dis[t].far_funcs |= offs
            dis[t].run(offs)

    # vtables: constructor stores `mov es:[bx+d], imm` then
    # `mov es:[bx+d+2], SEG` (SEGMENT fixup) -> vtable at seg:imm
    vtables = defaultdict(set)   # (seg, off) -> {constructor funcs}
    for i, d in dis.items():
        ordered = sorted(d.insns)
        for a, b2 in zip(ordered, ordered[1:]):
            i1, i2 = d.insns[a], d.insns[b2]
            if i1.mnemonic != "mov" or i2.mnemonic != "mov":
                continue
            if len(i1.operands) != 2 or len(i2.operands) != 2:
                continue
            o1, v1 = i1.operands
            o2, v2 = i2.operands
            if not (o1.type == o2.type == x86.X86_OP_MEM and
                    v1.type == v2.type == x86.X86_OP_IMM):
                continue
            if o2.mem.disp != o1.mem.disp + 2 or o1.mem.base != o2.mem.base:
                continue
            _, fx = d.fixup_at(i2)
            m = re.match(r"s(\d+):0000$", fx[1]) if fx and fx[0] == "SEGMENT" else None
            if m:
                vtables[(int(m.group(1)), v1.imm & 0xFFFF)].add((i, a))

    # function records
    funcs = {}
    for i, d in dis.items():
        starts = sorted(d.funcs)
        for k, f in enumerate(starts):
            end = starts[k + 1] if k + 1 < len(starts) else len(d.data)
            funcs[(i, f)] = dict(addr=f"s{i}:{f:04X}", seg=i, off=f,
                                 size=end - f, far=f in d.far_funcs,
                                 apis=set(), strings=[], strong=[], callees=set(),
                                 callers=set(), name="")

    # owner lookup via sorted starts
    import bisect
    starts_by_seg = {i: sorted(d.funcs) for i, d in dis.items()}

    def func_of(i, o):
        st = starts_by_seg[i]
        k = bisect.bisect_right(st, o) - 1
        return (i, st[k]) if k >= 0 else None

    for i, d in dis.items():
        ordered = sorted(d.insns)
        prev_of = dict(zip(ordered[1:], ordered))
        for o, insn in d.insns.items():
            fo = func_of(i, o)
            if fo is None:
                continue
            fr = funcs[fo]
            if insn.mnemonic in ("lcall", "ljmp"):
                ft = d.far_target(insn)
                if ft and ft[0] == "int":
                    fr["callees"].add(ft[1])
                elif ft and ft[0] == "entry" and ft[1] in entry_ord:
                    fr["callees"].add(entry_ord[ft[1]])
                elif ft:
                    fr["apis"].add(ft[1])
            elif insn.mnemonic == "call" and insn.operands and \
                    insn.operands[0].type == x86.X86_OP_IMM:
                fr["callees"].add((i, insn.operands[0].imm & 0xFFFF))
            for op in insn.operands:
                if op.type == x86.X86_OP_IMM and insn.mnemonic in ("push", "mov"):
                    v = op.imm & 0xFFFF
                    if v in strs and v >= 0x10:
                        fr["strings"].append(strs[v])
                        # `push ds; push offset` is a genuine far string ptr
                        p = d.insns.get(prev_of.get(o))
                        if insn.mnemonic == "push" and p is not None and \
                                p.mnemonic == "push" and p.op_str == "ds":
                            fr["strong"].append(strs[v])
    for k, fr in funcs.items():
        for c in fr["callees"]:
            if c in funcs:
                funcs[c]["callers"].add(k)

    # naming: SC* debug labels, then well-known API fingerprints
    for k, fr in funcs.items():
        sc = sorted({re.match(r"(SC[A-Za-z0-9:]+)", s).group(1)
                     for s in fr["strong"] if re.match(r"SC[A-Z][a-z]", s)})
        if len(sc) == 1:
            fr["name"] = sc[0].replace("::", "_")
        elif sc:
            fr["name"] = "multi_" + "_".join(sc)
    for k, fr in funcs.items():
        a = fr["apis"]
        if fr["name"]:
            continue
        if {"USER.GetMessage", "USER.DispatchMessage"} <= a:
            fr["name"] = "MessageLoop"
        elif "KERNEL.InitTask" in a:
            fr["name"] = "_astart_InitTask"
        elif "USER.RegisterClass" in a:
            fr["name"] = "RegisterWindowClass"
        elif "MMSYSTEM.mciSendCommand" in a:
            fr["name"] = "Mci_" + fr["addr"].replace(":", "_")
        elif {"COMMDLG.GetOpenFileName"} & a or {"COMMDLG.GetSaveFileName"} & a:
            fr["name"] = "FileDialog_" + fr["addr"].replace(":", "_")
        elif "GDI.CreatePalette" in a:
            fr["name"] = "CreateGamePalette_" + fr["addr"].replace(":", "_")
        elif "KERNEL.GetPrivateProfileString" in a or "KERNEL.WritePrivateProfileString" in a:
            fr["name"] = "IniAccess_" + fr["addr"].replace(":", "_")
        elif {"GDI.StretchDIBits", "GDI.SetDIBitsToDevice"} & a:
            fr["name"] = "BlitDib_" + fr["addr"].replace(":", "_")
    ent_names = {(e["seg"], e["offset"]): n["name"] for e in info["entries"]
                 for n in info["resident_names"] if n["ordinal"] == e["ordinal"]}
    for k, n in ent_names.items():
        if k in funcs:
            funcs[k]["name"] = n
    if (int(cs), int(ip, 16)) in funcs:
        funcs[(int(cs), int(ip, 16))]["name"] = "__astart"

    # SC step classes: name the virtual methods of each vtable an SC
    # constructor installs. Slot layout (base vtable s6:6AD2): 0 scalar
    # deleting dtor, 1 calcMe (step body), 2 shouldRun, 3 clone.
    slot_names = ["dtor", "calcMe", "shouldRun", "clone"]
    for (vs, voff), ctors in vtables.items():
        owners = {funcs[func_of(ci, ca)]["name"] for ci, ca in ctors
                  if func_of(ci, ca) and re.fullmatch(r"SC[A-Z][a-z][A-Za-z0-9]*",
                                                      funcs[func_of(ci, ca)]["name"])}
        if len(owners) != 1 or vs not in dis:
            continue
        cls = owners.pop()
        d = dis[vs]
        for n in range(len(slot_names)):
            p = voff + 4 * n
            fx = d.fix.get(p + 2)
            if not fx or fx[0] != "SEGMENT":
                break
            m = re.match(r"s(\d+):0000$", fx[1])
            tk = (int(m.group(1)), struct.unpack_from("<H", d.data, p)[0]) if m else None
            if tk in funcs and not funcs[tk]["name"]:
                funcs[tk]["name"] = f"{cls}::{slot_names[n]}"

    # hand-made symbols (symbols.json next to this script) override auto names
    sym_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "symbols.json")
    syms = json.load(open(sym_path)) if os.path.exists(sym_path) else {}
    for a, n in syms.get("functions", {}).items():
        m = re.match(r"s(\d+):([0-9A-Fa-f]{4})$", a)
        k = (int(m.group(1)), int(m.group(2), 16)) if m else None
        if k in funcs:
            funcs[k]["name"] = n
        else:
            print(f"warn: symbols.json function {a} ({n}) is not a discovered function")
    gsyms = {int(a, 16): n for a, n in syms.get("globals", {}).items()}

    def global_note(insn):
        """Name DS-relative absolute memory operands, e.g. [0x65e2] -> g_objectDb."""
        for op in insn.operands:
            if op.type == x86.X86_OP_MEM and op.mem.base == 0 and op.mem.index == 0 \
                    and op.mem.segment in (0, x86.X86_REG_DS):
                d = op.mem.disp & 0xFFFF
                for delta in (0, 2):  # also match the high word of a dword global
                    if d - delta in gsyms:
                        return gsyms[d - delta] + (f"+{delta}" if delta else "")
        return None

    def label(k):
        fr = funcs.get(k)
        base = f"s{k[0]}:{k[1]:04X}"
        return f"{fr['name']}@{base}" if fr and fr["name"] else f"sub_{base}"

    # listings
    for i, d in dis.items():
        cov = d.coverage()
        with open(os.path.join(outdir, f"seg{i:02d}.asm"), "w") as f:
            f.write(f"; OUTPOST.EXE segment {i} (CODE), {len(d.data)} bytes\n")
            o = 0
            while o < len(d.data):
                if o in d.funcs:
                    fr = funcs[(i, o)]
                    f.write(f"\n; ---------------- {label((i, o))}"
                            f"{' FAR' if fr['far'] else ''} size={fr['size']}"
                            f" callers={len(fr['callers'])}\n")
                    if fr["apis"]:
                        f.write(f";   apis: {', '.join(sorted(fr['apis']))}\n")
                if o in d.tables:
                    f.write(f"switch_table_{o:04X}:\n")
                    for t in d.tables[o]:
                        f.write(f"    dw loc_{t:04X}\n")
                    o += 2 * len(d.tables[o]) or 2
                    continue
                insn = d.insns.get(o)
                if insn is None:
                    e = o
                    while e < len(d.data) and not cov[e] and e not in d.funcs:
                        e += 1
                    if e == o:  # inside an overlapping decode: emit one byte
                        e = o + 1
                    chunk = d.data[o:e]
                    for c in range(0, len(chunk), 16):
                        f.write(f"{i}:{o + c:04X}  db {chunk[c:c + 16].hex(' ')}\n")
                    o = e
                    continue
                if o in d.labels and o not in d.funcs:
                    f.write(f"loc_{o:04X}:\n")
                txt = f"{insn.mnemonic} {insn.op_str}".strip()
                notes = []
                if insn.mnemonic in ("lcall", "ljmp"):
                    ft = d.far_target(insn)
                    if ft:
                        notes.append(label(ft[1]) if ft[0] == "int" else str(ft[1]))
                else:
                    _, fx = d.fixup_at(insn)
                    if fx:
                        notes.append(f"{fx[0]} {fx[1]}")
                if insn.mnemonic == "call" and insn.operands and \
                        insn.operands[0].type == x86.X86_OP_IMM:
                    notes.append(label((i, insn.operands[0].imm & 0xFFFF)))
                for op in insn.operands:
                    if op.type == x86.X86_OP_IMM and insn.mnemonic in ("push", "mov"):
                        v = op.imm & 0xFFFF
                        if v in strs and v >= 0x10:
                            notes.append(repr(strs[v][:60]))
                g = global_note(insn)
                if g:
                    notes.append(g)
                cm = f"  ; {' | '.join(notes)}" if notes else ""
                f.write(f"{i}:{o:04X}  {insn.bytes.hex():<20} {txt}{cm}\n")
                o += insn.size

    # vtable report
    vt_rows = []
    with open(os.path.join(outdir, "vtables.txt"), "w") as f:
        for (s, off) in sorted(vtables):
            d = dis.get(s)
            if d is None:
                continue
            slots, p = [], off
            while p + 4 <= len(d.data):
                fx = d.fix.get(p + 2)
                m = re.match(r"s(\d+):0000$", fx[1]) if fx and fx[0] == "SEGMENT" else None
                if not m:
                    break
                slots.append((int(m.group(1)), struct.unpack_from("<H", d.data, p)[0]))
                p += 4
            ctors = sorted({label(func_of(ci, ca)) for ci, ca in vtables[(s, off)]
                            if func_of(ci, ca)})
            f.write(f"vtable s{s}:{off:04X}  slots={len(slots)}\n")
            for c in ctors:
                f.write(f"    installed by {c}\n")
            for n, t in enumerate(slots):
                f.write(f"    [{n:2d}] +{4 * n:02X} {label(t)}\n")
            vt_rows.append(dict(vtable=f"s{s}:{off:04X}", slots=len(slots),
                                ctors=ctors, entries=[label(t) for t in slots]))
    with open(os.path.join(outdir, "vtables.json"), "w") as f:
        json.dump(vt_rows, f, indent=1)

    # indices
    rows = []
    for k in sorted(funcs):
        fr = funcs[k]
        rows.append(dict(addr=fr["addr"], name=fr["name"], size=fr["size"],
                         far=fr["far"], callers=len(fr["callers"]),
                         callees=len(fr["callees"]),
                         apis=" ".join(sorted(a.split(".")[1] for a in fr["apis"])),
                         strings=" | ".join(dict.fromkeys(s[:40] for s in fr["strings"]))))
    with open(os.path.join(outdir, "functions.csv"), "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0]))
        w.writeheader()
        w.writerows(rows)
    with open(os.path.join(outdir, "functions.json"), "w") as f:
        json.dump([dict(addr=funcs[k]["addr"], name=funcs[k]["name"],
                        size=funcs[k]["size"], far=funcs[k]["far"],
                        apis=sorted(funcs[k]["apis"]),
                        strings=list(dict.fromkeys(funcs[k]["strings"])),
                        callees=sorted(label(c) for c in funcs[k]["callees"]),
                        callers=sorted(label(c) for c in funcs[k]["callers"]))
                   for k in sorted(funcs)], f, indent=1)
    usage = defaultdict(set)
    for k, fr in funcs.items():
        for a in fr["apis"]:
            usage[a].add(label(k))
    with open(os.path.join(outdir, "api_usage.txt"), "w") as f:
        for a in sorted(usage):
            f.write(f"{a}  ({len(usage[a])} functions)\n")
            for l in sorted(usage[a]):
                f.write(f"    {l}\n")
    total = sum(len(d.data) for d in dis.values())
    cov = sum(sum(d.coverage()) for d in dis.values())
    print(f"functions={len(funcs)} named={sum(1 for f in funcs.values() if f['name'])} "
          f"code coverage={cov}/{total} ({100 * cov / total:.1f}%) "
          f"switch tables={sum(len(d.tables) for d in dis.values())}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
