"""Independent PKWARE DCL "explode" decoder + RESOURCE.000 reader.

Clean-room port of the algorithm in Mark Adler's blast.c, used to verify
the existing extractor and the repacker's compressor. Outpost's archive
uses only binary (uncoded-literal) mode, so the coded-literal table is not
needed; the decoder raises if it meets a coded-literal stream.

Usage:
  python dcl_explode.py list   RESOURCE.000
  python dcl_explode.py verify RESOURCE.000 extracted_dir
  python dcl_explode.py extract RESOURCE.000 out_dir
"""
import os
import struct
import sys

MAXBITS = 13
# compact code-length tables from blast.c: low nibble = length,
# high nibble + 1 = repeat count
LENLEN = [2, 35, 36, 53, 38, 23]
DISTLEN = [2, 20, 53, 230, 247, 151, 248]
BASE = [3, 2, 4, 5, 6, 7, 8, 9, 10, 12, 16, 24, 40, 72, 136, 264]
EXTRA = [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8]


def construct(rep):
    lengths = []
    for r in rep:
        lengths += [r & 15] * ((r >> 4) + 1)
    count = [0] * (MAXBITS + 1)
    for ln in lengths:
        count[ln] += 1
    offs = [0] * (MAXBITS + 1)
    for ln in range(1, MAXBITS):
        offs[ln + 1] = offs[ln] + count[ln]
    symbol = [0] * len(lengths)
    for s, ln in enumerate(lengths):
        if ln:
            symbol[offs[ln]] = s
            offs[ln] += 1
    return count, symbol


LENCODE = construct(LENLEN)
DISTCODE = construct(DISTLEN)


class Bits:
    def __init__(self, data, pos):
        self.d, self.p, self.buf, self.cnt = data, pos, 0, 0

    def need(self, n):
        while self.cnt < n:
            if self.p >= len(self.d):
                raise EOFError("compressed stream ended early")
            self.buf |= self.d[self.p] << self.cnt
            self.p += 1
            self.cnt += 8

    def bits(self, n):
        self.need(n)
        v = self.buf & ((1 << n) - 1)
        self.buf >>= n
        self.cnt -= n
        return v

    def decode(self, h):
        count, symbol = h
        code = first = index = 0
        for ln in range(1, MAXBITS + 1):
            code |= self.bits(1) ^ 1  # codes are stored inverted
            c = count[ln]
            if code - c < first:
                return symbol[index + (code - first)]
            index += c
            first += c
            first <<= 1
            code <<= 1
        raise ValueError("invalid Huffman code")


def explode(data):
    lit, dictbits = data[0], data[1]
    if lit != 0:
        raise NotImplementedError("coded-literal DCL streams are not used by Outpost")
    if dictbits not in (4, 5, 6):
        raise ValueError(f"bad dictionary size {dictbits}")
    s = Bits(data, 2)
    out = bytearray()
    while True:
        if s.bits(1):
            sym = s.decode(LENCODE)
            ln = BASE[sym] + s.bits(EXTRA[sym])
            if ln == 519:  # end-of-stream code
                return bytes(out)
            shift = 2 if ln == 2 else dictbits
            dist = (s.decode(DISTCODE) << shift) + s.bits(shift) + 1
            if dist > len(out):
                raise ValueError("distance too far back")
            for _ in range(ln):
                out.append(out[-dist])
        else:
            out.append(s.bits(8))


def read_archive(path):
    b = open(path, "rb").read()
    if b[:6] != b"DISK01":
        raise ValueError("not a DISK01 archive")
    entries, p = [], 6
    while True:
        e = b[p:p + 26]
        name = e[4:18].split(b"\0")[0].decode("ascii")
        size, date, time = struct.unpack_from("<IHH", e, 18)
        p += 26
        if name == "THE_END":
            break
        entries.append(dict(tag=e[:4].decode(), name=name, csize=size,
                            date=date, time=time))
    for e in entries:
        e["data"] = b[p:p + e["csize"]]
        p += e["csize"]
    return entries


def dos_stamp(date, time):
    return (f"{(date >> 9) + 1980}-{(date >> 5) & 15:02}-{date & 31:02} "
            f"{time >> 11:02}:{(time >> 5) & 63:02}:{(time & 31) * 2:02}")


def main(argv):
    cmd, arc = argv[1], argv[2]
    entries = read_archive(arc)
    if cmd == "list":
        for e in entries:
            out = explode(e["data"])
            print(f"{e['name']:<13} {e['csize']:>8} -> {len(out):>8}  "
                  f"mode={e['data'][0]} dict={1 << (e['data'][1] + 6)}B  "
                  f"{dos_stamp(e['date'], e['time'])}")
    elif cmd == "verify":
        bad = 0
        for e in entries:
            out = explode(e["data"])
            ref = open(os.path.join(argv[3], e["name"]), "rb").read()
            ok = out == ref
            bad += not ok
            print(f"{'OK ' if ok else 'BAD'} {e['name']}")
        sys.exit(1 if bad else 0)
    elif cmd == "extract":
        os.makedirs(argv[3], exist_ok=True)
        for e in entries:
            with open(os.path.join(argv[3], e["name"]), "wb") as f:
                f.write(explode(e["data"]))


if __name__ == "__main__":
    main(sys.argv)
