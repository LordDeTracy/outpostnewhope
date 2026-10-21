"""Prototype parser for Outpost .OPS saves (simulation chunks 0x0A-0x13).

Layouts come from the save/load methods in OUTPOST.EXE (findings/09-saves.md).
Used to check the layouts against TUTOR.OPS before the C++ loader.

Usage: python ops_parse.py <file.ops> [--dump]
"""
import struct
import sys


class Reader:
    def __init__(self, data, pos=0):
        self.d = data
        self.p = pos

    def u8(self):
        v = self.d[self.p]
        self.p += 1
        return v

    def u16(self):
        v = struct.unpack_from('<H', self.d, self.p)[0]
        self.p += 2
        return v

    def i16(self):
        v = struct.unpack_from('<h', self.d, self.p)[0]
        self.p += 2
        return v

    def u32(self):
        v = struct.unpack_from('<I', self.d, self.p)[0]
        self.p += 4
        return v

    def i32(self):
        v = struct.unpack_from('<i', self.d, self.p)[0]
        self.p += 4
        return v

    def raw(self, n):
        v = self.d[self.p:self.p + n]
        self.p += n
        return v

    def cstr(self):
        e = self.d.index(b'\0', self.p)
        v = self.d[self.p:e].decode('latin-1')
        self.p = e + 1
        return v

    # s2:7B4C / s2:7BC8: a map position, three words.
    def pos(self):
        return (self.i16(), self.i16(), self.i16())

    # s2:7954 / s2:76E4: dword count, then that many dword handles.
    def handles(self):
        n = self.u32()
        return [self.u32() for _ in range(n)]

    # s2:7A22 / s2:77CC: word slots, then (word key, dword value) each.
    def ledger(self):
        n = self.u16()
        out = {}
        for _ in range(n):
            k = self.u16()
            v = self.i32()
            if k:
                out[k] = v
        return out


def h(v):
    return f'{v:08X}'


# ── v1 -> v4 translation (s2:73EA building types, s2:72BC products) ───────
def v1_type(t):
    if 1 <= t <= 23:
        return t
    if 24 <= t <= 60:
        return t + 3
    if 61 <= t <= 62:
        return t + 4
    if 63 <= t <= 102:
        return t + 8
    if 103 <= t <= 128:
        return t + 9
    return 0


def v1_product(p):
    if p == 4:
        return 5
    if p == 5:
        return 4
    return p if 1 <= p <= 19 else 0


class Ops:
    def __init__(self, data):
        self.d = data
        if data[:2] != b'SC':
            raise ValueError('not an OPS file')
        n = int(data[2:5])
        self.version = 1 if n == 1 else 4 if n == 4 else 1
        self.chunks = {}
        p = 5
        while True:
            i = data.find(b'dcbSC', p)
            if i < 0:
                break
            tag = int(data[i + 5:i + 7], 16)
            j = data.find(b'dcbSC', i + 7)
            self.chunks[tag] = (i + 7, j if j >= 0 else len(data))
            p = i + 7

    def reader(self, tag):
        s, e = self.chunks[tag]
        return Reader(self.d, s), e
