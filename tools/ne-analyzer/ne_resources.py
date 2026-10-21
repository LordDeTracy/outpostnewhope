"""Decode the Win16 resources embedded in an NE executable.

Decodes RT_STRING, RT_MENU, RT_DIALOG, RT_ACCELERATOR and RT_RCDATA into
JSON plus a readable text report, and writes icons/cursors as raw blobs.

Usage: python ne_resources.py OUTPOST.EXE out_dir
"""
import json
import os
import struct
import sys

from ne_parse import parse

CTRL_CLASS = {0x80: "BUTTON", 0x81: "EDIT", 0x82: "STATIC", 0x83: "LISTBOX",
              0x84: "SCROLLBAR", 0x85: "COMBOBOX"}


def cstr(b, p):
    e = b.index(b"\0", p)
    return b[p:e].decode("latin-1"), e + 1


def name_or_ord(b, p):
    if b[p] == 0xFF:
        return struct.unpack_from("<H", b, p + 1)[0], p + 3
    return cstr(b, p)


def dec_strings(blk, data):
    out, p = {}, 0
    for i in range(16):
        n = data[p]
        s = data[p + 1:p + 1 + n].decode("latin-1")
        p += 1 + n
        if n:
            out[(blk - 1) * 16 + i] = s
    return out


def dec_menu(data):
    p = 4  # versionNumber, offset

    def items(p):
        res = []
        while True:
            fl = struct.unpack_from("<H", data, p)[0]
            p += 2
            if fl & 0x10:  # MF_POPUP
                text, p = cstr(data, p)
                sub, p = items(p)
                res.append(dict(popup=text, items=sub))
            else:
                mid = struct.unpack_from("<H", data, p)[0]
                text, p = cstr(data, p + 2)
                res.append(dict(id=mid, text=text) if text or mid else
                           dict(separator=True))
            if fl & 0x80:  # MF_END
                return res, p
    return items(p)[0]


def dec_dialog(data):
    style, n, x, y, cx, cy = struct.unpack_from("<IBHHHH", data, 0)
    p = 13
    menu, p = name_or_ord(data, p)
    cls, p = name_or_ord(data, p)
    cap, p = cstr(data, p)
    d = dict(style=hex(style), rect=[x, y, cx, cy], menu=menu, cls=cls,
             caption=cap, controls=[])
    if style & 0x40:  # DS_SETFONT
        d["font_pt"] = struct.unpack_from("<H", data, p)[0]
        d["font"], p = cstr(data, p + 2)
    for _ in range(n):
        x, y, cx, cy, cid, st = struct.unpack_from("<HHHHHI", data, p)
        p += 14
        if data[p] & 0x80:
            ccls = CTRL_CLASS.get(data[p], hex(data[p]))
            p += 1
        else:
            ccls, p = cstr(data, p)
        text, p = name_or_ord(data, p)
        extra = data[p]
        p += 1 + extra
        d["controls"].append(dict(id=cid, cls=ccls, text=text,
                                  rect=[x, y, cx, cy], style=hex(st)))
    return d


def dec_accel(data):
    out = []
    for p in range(0, len(data) - 4, 5):
        fl, ev, cid = struct.unpack_from("<BHH", data, p)
        out.append(dict(flags=hex(fl), key=ev, id=cid))
        if fl & 0x80:
            break
    return out


def main(exe, outdir):
    os.makedirs(outdir, exist_ok=True)
    b = open(exe, "rb").read()
    info = parse(exe)
    strings, menus, dialogs, accels, rcdata = {}, {}, {}, {}, {}
    rawdir = os.path.join(outdir, "raw")
    os.makedirs(rawdir, exist_ok=True)
    for r in info["resources"]:
        data = b[r["offset"]:r["offset"] + r["length"]]
        t, rid = r["type"], r["id"]
        try:
            if t == "RT_STRING":
                strings.update(dec_strings(rid, data))
            elif t == "RT_MENU":
                menus[str(rid)] = dec_menu(data)
            elif t == "RT_DIALOG":
                dialogs[str(rid)] = dec_dialog(data)
            elif t == "RT_ACCELERATOR":
                accels[str(rid)] = dec_accel(data)
            elif t == "RT_RCDATA":
                body = data.rstrip(b"\0")
                if all(32 <= c < 127 or c == 0 for c in body):
                    rcdata[str(rid)] = body.decode("latin-1").split("\0")
                else:
                    rcdata[str(rid)] = body.hex(" ")
            else:
                with open(os.path.join(rawdir, f"{t}_{rid}.bin"), "wb") as f:
                    f.write(data)
        except Exception as e:  # keep going; report what failed
            print(f"warn: {t} {rid}: {e}")
    res = dict(strings={str(k): v for k, v in sorted(strings.items())},
               menus=menus, dialogs=dialogs, accelerators=accels,
               rcdata=rcdata)
    with open(os.path.join(outdir, "resources.json"), "w") as f:
        json.dump(res, f, indent=1)

    with open(os.path.join(outdir, "resources.txt"), "w") as f:
        f.write(f"# Resources of {os.path.basename(exe)}\n\n## STRINGTABLE "
                f"({len(strings)} strings)\n")
        for k, v in sorted(strings.items()):
            f.write(f"{k:5d}  {v!r}\n")

        def wmenu(items, ind):
            for it in items:
                if "popup" in it:
                    f.write(f"{ind}POPUP {it['popup']!r}\n")
                    wmenu(it["items"], ind + "  ")
                elif it.get("separator"):
                    f.write(f"{ind}----\n")
                else:
                    f.write(f"{ind}{it['id']:5d} {it['text']!r}\n")
        f.write(f"\n## MENUS ({len(menus)})\n")
        for k, v in menus.items():
            f.write(f"\n[{k}]\n")
            wmenu(v, "  ")
        f.write(f"\n## DIALOGS ({len(dialogs)})\n")
        for k, d in dialogs.items():
            f.write(f"\n[{k}] {d['caption']!r} rect={d['rect']} "
                    f"class={d['cls']!r} font={d.get('font')}\n")
            for c in d["controls"]:
                f.write(f"    {c['id']:5d} {c['cls']:<10} {c['text']!r}\n")
        f.write(f"\n## ACCELERATORS\n")
        for k, v in accels.items():
            f.write(f"[{k}]\n")
            for a in v:
                f.write(f"    key={a['key']:#06x} flags={a['flags']} -> {a['id']}\n")
        f.write(f"\n## RCDATA ({len(rcdata)})\n")
        for k, v in rcdata.items():
            f.write(f"[{k}] {v}\n")
    print(f"strings={len(strings)} menus={len(menus)} dialogs={len(dialogs)} "
          f"accels={len(accels)} rcdata={len(rcdata)}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
