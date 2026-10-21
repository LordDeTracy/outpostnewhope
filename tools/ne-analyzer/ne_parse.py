"""Correct NE (16-bit Windows New Executable) parser for OUTPOST.EXE.

Parses every NE table per the Microsoft NE spec and emits JSON:
header, segment table (8-byte entries), resource table, resident and
non-resident names, module references, entry table and per-segment
relocation records. Import ordinals are resolved to names using the
Wine .spec files in ./ordinals/ when present.

Usage: python ne_parse.py OUTPOST.EXE [out.json]
"""
import json
import os
import struct
import sys

HERE = os.path.dirname(os.path.abspath(__file__))

RT_NAMES = {
    0x8001: "RT_CURSOR", 0x8002: "RT_BITMAP", 0x8003: "RT_ICON",
    0x8004: "RT_MENU", 0x8005: "RT_DIALOG", 0x8006: "RT_STRING",
    0x8007: "RT_FONTDIR", 0x8008: "RT_FONT", 0x8009: "RT_ACCELERATOR",
    0x800A: "RT_RCDATA", 0x800C: "RT_GROUP_CURSOR", 0x800E: "RT_GROUP_ICON",
    0x8010: "RT_VERSION",
}

SEG_FLAGS = [
    (0x0001, "DATA"), (0x0010, "MOVEABLE"), (0x0020, "SHAREABLE"),
    (0x0040, "PRELOAD"), (0x0080, "RO/EO"), (0x0100, "RELOCINFO"),
    (0x1000, "DISCARDABLE"),
]

REL_ADDR = {0: "LOBYTE", 2: "SEGMENT", 3: "FAR_ADDR", 5: "OFFSET",
            11: "PTR48", 13: "OFFSET32"}
REL_TYPE = {0: "INTERNALREF", 1: "IMPORTORDINAL", 2: "IMPORTNAME",
            3: "OSFIXUP"}


def load_ordinals():
    """Read Wine-style .spec files: '<ord> <conv> <name>(...)'."""
    table = {}
    d = os.path.join(HERE, "ordinals")
    if not os.path.isdir(d):
        return table
    for fn in os.listdir(d):
        mod = fn.split(".")[0].upper()
        names = {}
        with open(os.path.join(d, fn), encoding="utf-8", errors="replace") as f:
            for line in f:
                parts = line.split()
                if len(parts) < 3 or not parts[0].isdigit():
                    continue
                name = parts[2].split("(")[0]
                names[int(parts[0])] = name
        table[mod] = names
    return table


def pstr(buf, off):
    n = buf[off]
    return buf[off + 1:off + 1 + n].decode("latin-1"), off + 1 + n


def parse(path):
    b = open(path, "rb").read()
    assert b[:2] == b"MZ"
    ne = struct.unpack_from("<I", b, 0x3C)[0]
    assert b[ne:ne + 2] == b"NE"
    h = struct.unpack_from("<2sBBHHI" + "H" * 16 + "IHHHBBHHHH", b, ne)
    (sig, lver, lrev, ent_off, ent_len, crc, flags, autodata, heap, stack,
     ip, cs, sp, ss, nseg, nmod, nrn_len, seg_off, res_off, rn_off, mod_off,
     imp_off, nrn_abs, nmov, align, nres, os_, oflags, gangl_off, gangl_len,
     swap, winver) = h
    hdr = dict(linker=f"{lver}.{lrev}", entry_table=ne + ent_off,
               entry_len=ent_len, flags=hex(flags), autodata_seg=autodata,
               heap=heap, stack=stack, cs_ip=f"{cs}:{ip:04X}",
               ss_sp=f"{ss}:{sp:04X}", segments=nseg, modules=nmod,
               seg_table=ne + seg_off, res_table=ne + res_off,
               resident_names=ne + rn_off, modref_table=ne + mod_off,
               import_names=ne + imp_off, nonresident_names=nrn_abs,
               nonresident_len=nrn_len, movable_entries=nmov,
               align_shift=align, os=os_, other_flags=hex(oflags),
               expected_win=f"{winver >> 8}.{winver & 0xFF:02d}")
    shift = 1 << align

    # module reference table -> names in imported-names table
    imp_base = ne + imp_off
    modules = []
    for i in range(nmod):
        o = struct.unpack_from("<H", b, ne + mod_off + 2 * i)[0]
        modules.append(pstr(b, imp_base + o)[0])

    # segment table: 8 bytes each
    segs = []
    for i in range(nseg):
        sec, ln, fl, mn = struct.unpack_from("<HHHH", b, ne + seg_off + 8 * i)
        segs.append(dict(
            index=i + 1, file_offset=sec * shift,
            length=ln or 0x10000, min_alloc=mn or 0x10000, flags=hex(fl),
            kind="DATA" if fl & 1 else "CODE",
            attrs=[n for m, n in SEG_FLAGS if fl & m]))

    # relocations
    ords = load_ordinals()
    for s in segs:
        s["relocs"] = []
        if not s["file_offset"] or "RELOCINFO" not in s["attrs"]:
            continue
        # relocation records follow the segment's raw data on disk
        p = s["file_offset"] + s["length"]
        cnt = struct.unpack_from("<H", b, p)[0]
        p += 2
        for _ in range(cnt):
            at, rt, off, a1, a2 = struct.unpack_from("<BBHHH", b, p)
            p += 8
            additive = bool(rt & 4)
            r = dict(addr=REL_ADDR.get(at, at), type=REL_TYPE.get(rt & 3),
                     offset=off, additive=additive)
            if rt & 3 == 0:
                r.update(seg=a1 & 0xFF, target=a2) if (a1 & 0xFF) != 0xFF \
                    else r.update(movable_entry=a2)
            elif rt & 3 == 1:
                m = modules[a1 - 1]
                r.update(module=m, ordinal=a2,
                         name=ords.get(m, {}).get(a2, f"@{a2}"))
            elif rt & 3 == 2:
                r.update(module=modules[a1 - 1], name=pstr(b, imp_base + a2)[0])
            else:
                r.update(fixup=a1)
            s["relocs"].append(r)

    # resource table
    resources = []
    rt0 = ne + res_off
    if res_off != rn_off:
        rshift = 1 << struct.unpack_from("<H", b, rt0)[0]
        p = rt0 + 2

        def rname(v):
            return v & 0x7FFF if v & 0x8000 else pstr(b, rt0 + v)[0]
        while True:
            tid = struct.unpack_from("<H", b, p)[0]
            if tid == 0:
                break
            n = struct.unpack_from("<H", b, p + 2)[0]
            p += 8
            tname = RT_NAMES.get(tid, rname(tid) if not tid & 0x8000 else tid & 0x7FFF)
            for _ in range(n):
                o, ln, fl, rid, _, _ = struct.unpack_from("<HHHHHH", b, p)
                p += 12
                resources.append(dict(type=tname, id=rname(rid),
                                      offset=o * rshift, length=ln * rshift,
                                      flags=hex(fl)))

    def names(start, end=None):
        out, p = [], start
        while b[p] and (end is None or p < end):
            s, p = pstr(b, p)
            out.append(dict(name=s, ordinal=struct.unpack_from("<H", b, p)[0]))
            p += 2
        return out

    resident = names(ne + rn_off)
    nonres = names(nrn_abs)

    # entry table
    entries, p, ordn = [], ne + ent_off, 1
    end = p + ent_len
    while p < end:
        cnt, ind = b[p], b[p + 1]
        p += 2
        if cnt == 0:
            break
        for _ in range(cnt):
            if ind == 0:
                ordn += 1
                continue
            if ind == 0xFF:
                fl, _, seg, off = struct.unpack_from("<BHBH", b, p)
                p += 6
            else:
                fl, off = struct.unpack_from("<BH", b, p)
                seg = ind
                p += 3
            entries.append(dict(ordinal=ordn, seg=seg, offset=off,
                                exported=bool(fl & 1)))
            ordn += 1

    return dict(header=hdr, modules=modules, segments=segs,
                resources=resources, resident_names=resident,
                nonresident_names=nonres, entries=entries)


if __name__ == "__main__":
    info = parse(sys.argv[1])
    js = json.dumps(info, indent=1)
    if len(sys.argv) > 2:
        open(sys.argv[2], "w").write(js)
    h = info["header"]
    print(json.dumps(h, indent=1))
    print("modules:", info["modules"])
    for s in info["segments"]:
        print(f"seg{s['index']:>2} {s['kind']} off=0x{s['file_offset']:06X} "
              f"len=0x{s['length']:05X} min=0x{s['min_alloc']:05X} "
              f"{s['flags']} {'|'.join(s['attrs'])} relocs={len(s['relocs'])}")
    print("resources:", len(info["resources"]))
    for r in info["resources"]:
        print("  ", r)
    print("resident:", info["resident_names"])
    print("nonresident:", info["nonresident_names"])
    print("entries:", info["entries"])
