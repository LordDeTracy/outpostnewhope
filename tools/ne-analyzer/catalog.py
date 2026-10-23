"""Function catalogue for OUTPOST.EXE: every function with its name, purpose and evidence.

Usage:
  python catalog.py build           -> reference/outpost-exe/function-catalog.csv + coverage stats
  python catalog.py digest SEG [all] -> compact per-function digest of segment SEG (default: unknown ones only)
  python catalog.py stats

Sources merged, strongest first:
  names/segNN.tsv     hand decodes: addr<TAB>name<TAB>purpose  (this folder)
  symbols.json        older hand names
  functions.json      names the disassembler gave (API fingerprints, SC slots)
  citations           every "sN:XXXX" in rebuild/src, rebuild/tests and specs/ (file:line + text)
"""
import csv
import glob
import json
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, "..", ".."))
DIS = os.path.join(ROOT, "reference", "outpost-exe", "disasm")
ADDR = re.compile(r"\bs([1-9]):([0-9A-Fa-f]{4})\b")


def key(a):
    s, o = a.split(":")
    return int(s[1:]), int(o, 16)


def load_functions():
    fs = json.load(open(os.path.join(DIS, "functions.json")))
    return {f["addr"]: f for f in fs}


def load_names():
    """Hand decodes: names/segNN.tsv rows addr, name, purpose."""
    out = {}
    for fn in sorted(glob.glob(os.path.join(HERE, "names", "seg*.tsv"))):
        for n, line in enumerate(open(fn, encoding="utf-8"), 1):
            line = line.rstrip("\n")
            if not line or line.startswith("#"):
                continue
            parts = line.split("\t")
            a = parts[0].strip()
            if not ADDR.fullmatch(a):
                print(f"warn: {os.path.basename(fn)}:{n}: bad address {a!r}")
                continue
            a = f"s{a[1]}:{a[3:].upper()}"
            out[a] = (parts[1].strip() if len(parts) > 1 else "",
                      parts[2].strip() if len(parts) > 2 else "")
    return out


def harvest_citations(funcs):
    """addr -> [(where, text)] for every function a repo file cites (inside it counts)."""
    starts = {}
    for a, f in funcs.items():
        s, o = key(a)
        starts.setdefault(s, []).append((o, f["size"], a))
    for s in starts:
        starts[s].sort()

    def owner(s, o):
        for st, sz, a in starts.get(s, []):
            if st <= o < st + max(sz, 1):
                return a
        return None

    files = []
    for pat in ("rebuild/src/**/*.cpp", "rebuild/src/**/*.hpp", "rebuild/tests/**/*.cpp",
                "rebuild/tools/**/*.cpp", "specs/**/*.md"):
        files += glob.glob(os.path.join(ROOT, pat), recursive=True)
    cites = {}
    for fn in files:
        if "superseded" in fn:
            continue
        rel = os.path.relpath(fn, ROOT).replace("\\", "/")
        try:
            lines = open(fn, encoding="utf-8", errors="replace").read().splitlines()
        except OSError:
            continue
        for n, line in enumerate(lines, 1):
            for m in ADDR.finditer(line):
                s, o = int(m.group(1)), int(m.group(2), 16)
                a = owner(s, o)
                if not a:
                    continue
                text = re.sub(r"\s+", " ", line.strip().lstrip("/*#-|> ").strip())
                cites.setdefault(a, []).append((f"{rel}:{n}", text[:160]))
    return cites


def vtable_slots():
    vt = json.load(open(os.path.join(DIS, "vtables.json")))
    slots = {}
    for v in vt:
        for i, e in enumerate(v["entries"]):
            a = e.split("_", 1)[1] if e.startswith("sub_") else e.split("@")[-1]
            slots.setdefault(a, []).append(f"{v['vtable']}#{i}")
    ctors = {}
    for v in vt:
        for c in v["ctors"]:
            a = c.split("_", 1)[1] if c.startswith("sub_") else c.split("@")[-1]
            ctors.setdefault(a, []).append(v["vtable"])
    return slots, ctors


def build(write=True):
    funcs = load_functions()
    names = load_names()
    syms = json.load(open(os.path.join(HERE, "symbols.json"))).get("functions", {})
    cites = harvest_citations(funcs)
    rows = []
    for a in sorted(funcs, key=key):
        f = funcs[a]
        name, purpose, source = "", "", ""
        if a in names:
            name, purpose = names[a]
            source = "decoded"
        elif a in syms:
            name, source = syms[a], "symbols"
        elif f["name"]:
            name, source = f["name"], "auto"
        if not source and a in cites:
            source = "cited"
        rows.append({"addr": a, "name": name, "size": f["size"], "status": source or "unknown",
                     "purpose": purpose,
                     "cited": "; ".join(w for w, _ in cites.get(a, [])[:4])})
    if write:
        out = os.path.join(ROOT, "reference", "outpost-exe", "function-catalog.csv")
        with open(out, "w", newline="", encoding="utf-8") as fh:
            w = csv.DictWriter(fh, fieldnames=list(rows[0]))
            w.writeheader()
            w.writerows(rows)
    return rows, funcs, cites


def stats(rows):
    tot = sum(r["size"] for r in rows)
    by = {}
    for r in rows:
        s = r["addr"].split(":")[0]
        d = by.setdefault(s, {"n": 0, "known": 0, "bytes": 0, "kbytes": 0})
        d["n"] += 1
        d["bytes"] += r["size"]
        if r["status"] != "unknown":
            d["known"] += 1
            d["kbytes"] += r["size"]
    k = sum(d["known"] for d in by.values())
    kb = sum(d["kbytes"] for d in by.values())
    print(f"{k}/{len(rows)} functions known, {kb}/{tot} bytes ({100 * kb / tot:.1f}%)")
    for s, d in sorted(by.items(), key=lambda x: int(x[0][1:])):
        print(f"  {s}: {d['known']:4}/{d['n']:4} functions, {100 * d['kbytes'] / d['bytes']:5.1f}% of bytes")
    st = {}
    for r in rows:
        st[r["status"]] = st.get(r["status"], 0) + 1
    print("  by status:", st)


def short(asm_lines, limit=14):
    """Compact one-line body for small functions."""
    out = []
    for l in asm_lines[1:]:
        if l.startswith(";") or " db " in l or not l.strip():
            continue
        if l.startswith("loc_"):
            out.append(l.strip())
            continue
        parts = l.split(None, 2)
        if len(parts) < 3:
            continue
        txt = parts[2]
        txt = re.sub(r"\s{2,}", " ", txt)
        out.append(txt)
    if len(out) > limit:
        out = out[:limit] + [f"... +{len(out) - limit}"]
    return " / ".join(out)


def listing(seg):
    fn = os.path.join(DIS, f"seg{seg:02d}.asm")
    funcs, cur = {}, None
    for line in open(fn):
        if line.startswith("; ----------------"):
            lab = line.split()[2]
            a = lab.split("@")[-1] if "@" in lab else lab[4:]
            cur = funcs.setdefault(a, [])
        if cur is not None:
            cur.append(line.rstrip("\n"))
    return funcs


def digest(seg, everything=False, body_max=96):
    rows, funcs, cites = build(write=False)
    names = {r["addr"]: r["name"] for r in rows if r["name"]}
    slots, ctors = vtable_slots()
    lst = listing(seg)
    st = {r["addr"]: r["status"] for r in rows}

    def nm(x):
        a = x.split("@")[-1] if "@" in x else x[4:] if x.startswith("sub_") else x
        return f"{names[a]}@{a}" if a in names else a

    for r in rows:
        a = r["addr"]
        if key(a)[0] != seg or (not everything and st[a] != "unknown"):
            continue
        f = funcs[a]
        hdr = f"{a} {'F' if f['far'] else 'N'} {f['size']}B"
        if r["name"]:
            hdr += f" [{r['name']}]"
        if a in slots:
            hdr += " vt:" + ",".join(slots[a][:4]) + ("..." if len(slots[a]) > 4 else "")
        if a in ctors:
            hdr += " CTOR->" + ",".join(ctors[a][:3])
        print(hdr)
        cl = [nm(c) for c in f["callers"]]
        if cl:
            print("  <-", ", ".join(cl[:6]) + (f" (+{len(cl) - 6})" if len(cl) > 6 else ""))
        ce = [nm(c) for c in f["callees"]]
        if ce:
            print("  ->", ", ".join(ce[:10]) + (f" (+{len(ce) - 10})" if len(ce) > 10 else ""))
        if f["apis"]:
            print("  api:", ", ".join(sorted(f["apis"])))
        if f["strings"]:
            print("  str:", " | ".join(s[:50] for s in f["strings"][:6]))
        for w, t in cites.get(a, [])[:2]:
            print(f"  cite {w}: {t[:110]}")
        if f["size"] <= body_max and a in lst:
            print("  ::", short(lst[a]))


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    cmd = sys.argv[1] if len(sys.argv) > 1 else "build"
    if cmd == "build":
        rows, _, _ = build()
        stats(rows)
    elif cmd == "stats":
        stats(build(write=False)[0])
    elif cmd == "digest":
        digest(int(sys.argv[2]), len(sys.argv) > 3 and sys.argv[3] == "all")
