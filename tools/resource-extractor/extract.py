#!/usr/bin/env python3
"""RESOURCE.000 extractor for Sierra Outpost (1994) — PKWare DCL Implosion."""
import struct, sys, os, io

# Static Huffman/Shannon-Fano tables (PKImplode standard)
LITERAL_CODE_LENGTHS = bytes([
    0x0B, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x08, 0x07, 0x0C, 0x0C, 0x07, 0x0C, 0x0C,
    0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0D, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
    0x04, 0x0A, 0x08, 0x0C, 0x0A, 0x0C, 0x0A, 0x08, 0x07, 0x07, 0x08, 0x09, 0x07, 0x06, 0x07, 0x08,
    0x07, 0x06, 0x07, 0x07, 0x07, 0x07, 0x08, 0x07, 0x07, 0x08, 0x08, 0x0C, 0x0B, 0x07, 0x09, 0x0B,
    0x0C, 0x06, 0x07, 0x06, 0x06, 0x05, 0x07, 0x08, 0x08, 0x06, 0x0B, 0x09, 0x06, 0x07, 0x06, 0x06,
    0x07, 0x0B, 0x06, 0x06, 0x06, 0x07, 0x09, 0x08, 0x09, 0x09, 0x0B, 0x08, 0x0B, 0x09, 0x0C, 0x08,
    0x0C, 0x05, 0x06, 0x06, 0x06, 0x05, 0x06, 0x06, 0x06, 0x05, 0x0B, 0x07, 0x05, 0x06, 0x05, 0x05,
    0x06, 0x0A, 0x05, 0x05, 0x05, 0x05, 0x08, 0x07, 0x08, 0x08, 0x0A, 0x0B, 0x0B, 0x0C, 0x0C, 0x0C,
    0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D,
    0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D,
    0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
    0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
    0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C, 0x0C,
    0x0D, 0x0C, 0x0D, 0x0D, 0x0D, 0x0C, 0x0D, 0x0D, 0x0D, 0x0C, 0x0D, 0x0D, 0x0D, 0x0D, 0x0C, 0x0D,
    0x0D, 0x0D, 0x0C, 0x0C, 0x0C, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D, 0x0D,
])

DISTANCE_CODE_LENGTHS = bytes([
    2, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6,
    6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
    7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
])

LENGTH_CODE_LENGTHS = bytes([3, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 7, 7])
DISTANCE_BASE = [0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 14, 22, 38, 70, 134, 262]
EXTRA_DIST_BITS = [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8]

# Distance decoding tables for binary mode
DIST_TABLE0 = bytes([5, 3, 1, 6, 0x0A, 2, 0x0C, 0x14, 4, 0x18, 8, 0x30, 0x10, 0x20, 0x40, 0])

CODE_LENGTH_TABLE = bytes([3, 0x0D, 5, 0x19, 9, 0x11, 1, 0x3E, 0x1E, 0x2E, 0x0E, 0x36, 0x16, 0x26, 6, 0x3A,
                           0x1A, 0x2A, 0x0A, 0x32, 0x12, 0x22, 0x42, 2, 0x7C, 0x3C, 0x5C, 0x1C, 0x6C, 0x2C, 0x4C, 0x0C,
                           0x74, 0x34, 0x54, 0x14, 0x64, 0x24, 0x44, 4, 0x78, 0x38, 0x58, 0x18, 0x68, 0x28, 0x48, 8,
                           0x0F0, 0x70, 0x0B0, 0x30, 0x0D0, 0x50, 0x90, 0x10, 0x0E0, 0x60, 0x0A0, 0x20, 0x0C0, 0x40, 0x80, 0])

WORD_3337 = [0x490, 0x0FE0, 0x7E0, 0x0BE0, 0x3E0, 0x0DE0, 0x5E0, 0x9E0, 0x1E0, 0x0B8, 0x62, 0x0EE0, 0x6E0, 0x22, 0x0AE0, 0x2E0,
             0x0CE0, 0x4E0, 0x8E0, 0x0E0, 0x0F60, 0x760, 0x0B60, 0x360, 0x0D60, 0x560, 0x1240, 0x960, 0x160, 0x0E60, 0x660, 0x0A60,
             0x0F, 0x250, 0x38, 0x260, 0x50, 0x0C60, 0x390, 0x0D8, 0x42, 0x2, 0x58, 0x1B0, 0x7C, 0x29, 0x3C, 0x98,
             0x5C, 0x9, 0x1C, 0x6C, 0x2C, 0x4C, 0x18, 0x0C, 0x74, 0x0E8, 0x68, 0x460, 0x90, 0x34, 0x0B0, 0x710,
             0x860, 0x31, 0x54, 0x11, 0x21, 0x17, 0x14, 0x0A8, 0x28, 0x1, 0x310, 0x130, 0x3E, 0x64, 0x1E, 0x2E,
             0x24, 0x510, 0x0E, 0x36, 0x16, 0x44, 0x30, 0x0C8, 0x1D0, 0x0D0, 0x110, 0x48, 0x610, 0x150, 0x60, 0x88,
             0x0FA0, 0x7, 26, 0x6, 0x3A, 0x1B, 0x1A, 0x2A, 0x0A, 0x0B, 0x210, 0x4, 0x13, 0x32, 0x3, 0x1D,
             0x12, 0x190, 0x0D, 0x15, 0x5, 0x19, 0x8, 0x78, 0x0F0, 0x70, 0x290, 0x410, 0x10, 0x7A0, 0x0BA0, 0x3A0,
             0x240, 0x1C40, 0x0C40, 0x1440, 0x440, 0x1840, 0x840, 0x1040, 0x40, 0x1F80, 0x0F80, 0x1780, 0x780, 0x1B80, 0x0B80, 0x1380,
             0x380, 0x1D80, 0x0D80, 0x1580, 0x580, 0x1980, 0x980, 0x1180, 0x180, 0x1E80, 0x0E80, 0x1680, 0x680, 0x1A80, 0x0A80, 0x1280,
             0x280, 0x1C80, 0x0C80, 0x1480, 0x480, 0x1880, 0x880, 0x1080, 0x80, 0x1F00, 0x0F00, 0x1700, 0x700, 0x1B00, 0x0B00, 0x1300,
             0x0DA0, 0x5A0, 0x9A0, 0x1A0, 0x0EA0, 0x6A0, 0x0AA0, 0x2A0, 0x0CA0, 0x4A0, 0x8A0, 0x0A0, 0x0F20, 0x720, 0x0B20, 0x320,
             0x0D20, 0x520, 0x920, 0x120, 0x0E20, 0x620, 0x0A20, 0x220, 0x0C20, 0x420, 0x820, 0x20, 0x0FC0, 0x7C0, 0x0BC0, 0x3C0,
             0x0DC0, 0x5C0, 0x9C0, 0x1C0, 0x0EC0, 0x6C0, 0x0AC0, 0x2C0, 0x0CC0, 0x4C0, 0x8C0, 0x0C0, 0x0F40, 0x740, 0x0B40, 0x340,
             0x300, 0x0D40, 0x1D00, 0x0D00, 0x1500, 0x540, 0x500, 0x1900, 0x900, 0x940, 0x1100, 0x100, 0x1E00, 0x0E00, 0x140, 0x1600,
             0x600, 0x1A00, 0x0E40, 0x640, 0x0A40, 0x0A00, 0x1200, 0x200, 0x1C00, 0x0C00, 0x1400, 0x400, 0x1800, 0x800, 0x1000]


class BitStream:
    def __init__(self, data):
        self.data = data
        self.pos = 0
        self.bits = 0
        self.count = 0

    def read_bit(self):
        if self.count == 0:
            if self.pos >= len(self.data):
                return -1
            self.bits = self.data[self.pos]
            self.pos += 1
            self.count = 8
        bit = (self.bits >> (self.count - 1)) & 1
        self.count -= 1
        return bit

    def read_bits(self, n):
        val = 0
        for _ in range(n):
            bit = self.read_bit()
            if bit < 0:
                return -1
            val = (val << 1) | bit
        return val

    def peak_bits(self, n):
        saved_bits = self.bits
        saved_count = self.count
        saved_pos = self.pos
        val = self.read_bits(n)
        self.bits = saved_bits
        self.count = saved_count
        self.pos = saved_pos
        return val


def build_sf_table(code_lengths, max_symbols):
    """Build Shannon-Fano decode table from code lengths."""
    max_len = max(code_lengths)
    count = [0] * (max_len + 1)
    for c in code_lengths:
        if c > 0: count[c] += 1

    next_code = [0] * (max_len + 1)
    code = 0
    for bits in range(1, max_len + 1):
        code = (code + count[bits - 1]) << 1
        next_code[bits] = code

    table = {}
    for i in range(max_symbols):
        length = code_lengths[i]
        if length > 0:
            table[(next_code[length], length)] = i
            next_code[length] += 1
    return table, max_len


def decode_sf(bs, table, max_len):
    """Decode a Shannon-Fano symbol."""
    code = 0
    for i in range(max_len):
        bit = bs.read_bit()
        if bit < 0:
            return -1
        code = (code << 1) | bit
        key = (code, i + 1)
        if key in table:
            return table[key]
    return -1


class PKImplodeDecoder:
    def __init__(self, literal_mode, dict_size_bits):
        self.literal_mode = literal_mode  # field2: 0=ASCII, 1=binary with Huffman
        self.dict_size = 1 << dict_size_bits  # 16, 32, or 64 (actually 4KB/8KB/16KB window)
        self.dict_size_bits = dict_size_bits  # 4, 5, or 6
        self.dict_mask = (1 << dict_size_bits) - 1

        # Build literal decode table
        if literal_mode == 1:
            self.lit_table, self.lit_max = build_sf_table(LITERAL_CODE_LENGTHS, 256)
        else:
            self.lit_table, self.lit_max = None, None

        # Build distance decode tables
        self.dist_table, self.dist_max = build_sf_table(DISTANCE_CODE_LENGTHS, 64)

        # Build length decode table
        self.len_table, self.len_max = build_sf_table(LENGTH_CODE_LENGTHS, 16)

        # Build length-to-actual-length mapping
        self.length_base = [0] * 16
        len_bits = [0] * 16
        for i in range(16):
            if i < 2:
                len_bits[i] = 0 if i == 0 else 1
            elif i < 4:
                len_bits[i] = 2
            elif i < 8:
                len_bits[i] = 3
            elif i < 16:
                len_bits[i] = 4
        # Actually for PKImplode: lengths 2-3 = 0 extra bits, 4-5=1, 6-9=2, 10-17=3, 18-33=4, 34-65=5, 66-129=6, 130-257=7
        extra = [0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6]
        base = [2, 3, 4, 5, 6, 8, 10, 14, 18, 26, 34, 50, 66, 98, 130, 194]
        self.length_extra = extra
        self.length_base = base

        # Build distance table
        extra_dist = [0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8]
        base_dist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 15, 23, 39, 71, 135, 263]
        self.dist_extra = extra_dist
        self.dist_base = base_dist

        # Binary mode literal decode tables
        if literal_mode == 1:
            self._init_binary_tables()

    def _init_binary_tables(self):
        # Build the literal decode tree for binary mode
        self.lit_code_lengths = list(LITERAL_CODE_LENGTHS)
        self.lit_decode_table = {}
        lengths = self.lit_code_lengths
        max_len = max(lengths)
        count = [0] * (max_len + 1)
        for c in lengths:
            if c > 0: count[c] += 1
        next_code = [0] * (max_len + 1)
        code = 0
        for bits in range(1, max_len + 1):
            code = (code + count[bits - 1]) << 1
            next_code[bits] = code
        for i in range(256):
            length = lengths[i]
            if length > 0:
                self.lit_decode_table[(next_code[length], length)] = i
                next_code[length] += 1
        self.lit_max_len = max_len

        # Build binary distance mode tables (sub_4205 equivalent)
        self.bin_dist_tables = self._build_binary_distance_tables()

    def _build_binary_distance_tables(self):
        return None  # Simplified decoding

    def decompress(self, data):
        bs = BitStream(data)
        out = bytearray()
        window = bytearray(0x2000)  # 8KB sliding window (worst case)
        win_pos = 0

        while True:
            # Read literal/backref flag
            flag = bs.read_bit()
            if flag < 0:
                break

            if flag == 1:
                # Literal byte
                if self.literal_mode == 1:
                    # Binary mode: decode Huffman literal
                    lit = decode_sf(bs, self.lit_decode_table, self.lit_max_len)
                    if lit < 0 or lit > 255:
                        break
                else:
                    # ASCII mode: read 8 bits
                    lit = bs.read_bits(8)
                    if lit < 0:
                        break
                out.append(lit)
                window[win_pos] = lit
                win_pos = (win_pos + 1) & 0x1FFF
            else:
                # Back-reference
                # Read length symbol
                len_sym = decode_sf(bs, self.len_table, self.len_max)
                if len_sym < 0 or len_sym > 15:
                    break

                if len_sym < 2:
                    extra_len_bits = 0 if len_sym == 0 else 1
                elif len_sym < 4:
                    extra_len_bits = 2
                elif len_sym < 8:
                    extra_len_bits = 3
                else:
                    extra_len_bits = 4

                length = self.length_base[len_sym]
                if self.length_extra[len_sym] > 0:
                    extra = bs.read_bits(self.length_extra[len_sym])
                    if extra < 0:
                        break
                    length += extra

                # Read distance
                if self.literal_mode == 0:
                    # ASCII mode: read distance symbol via SF
                    dist_sym = decode_sf(bs, self.dist_table, self.dist_max)
                    if dist_sym < 0:
                        break
                else:
                    # Binary mode: read distance symbol
                    dist_sym = decode_sf(bs, self.dist_table, self.dist_max)
                    if dist_sym < 0:
                        break

                distance = self.dist_base[dist_sym]
                if self.dist_extra[dist_sym] > 0:
                    extra = bs.read_bits(self.dist_extra[dist_sym])
                    if extra < 0:
                        break
                    distance += extra

                # Copy from window
                src = (win_pos - distance) & 0x1FFF
                for i in range(length):
                    b = window[src]
                    out.append(b)
                    window[win_pos] = b
                    src = (src + 1) & 0x1FFF
                    win_pos = (win_pos + 1) & 0x1FFF

        return bytes(out)


def read_archive_index(path):
    """Read the RESOURCE.000 directory."""
    files = []
    with open(path, 'rb') as f:
        sig = f.read(6)
        if sig != b'DISK01':
            raise ValueError(f"Not a DISK01 archive (sig: {sig})")
        while True:
            header = f.read(0x1A)
            if len(header) < 0x1A:
                break
            if header[3] != ord('1'):
                raise ValueError("Invalid entry marker")
            name_end = header.find(b'\x00', 4)
            name = header[4:name_end].decode('ascii', errors='replace')
            if name == 'THE_END':
                break
            size = struct.unpack_from('<I', header, 0x12)[0]
            unk1 = struct.unpack_from('<H', header, 0x16)[0]
            unk2 = struct.unpack_from('<H', header, 0x18)[0]
            files.append({'name': name, 'size': size, 'unk1': unk1, 'unk2': unk2, 'offset': f.tell()})
            f.seek(size, 1)
    return files


def extract_file(path, file_info, output_dir):
    """Extract a single file from the archive."""
    with open(path, 'rb') as f:
        f.seek(file_info['offset'])
        cmp_data = f.read(file_info['size'])

    if file_info['size'] <= 4:
        output = cmp_data
    else:
        field2 = cmp_data[0]   # literal mode
        field6 = cmp_data[1]   # dict size bits
        fielda = cmp_data[2]   # start bits

        if field6 < 4 or field6 > 6:
            print(f"  SKIP {file_info['name']}: unknown dict size {field6}")
            return

        decoder = PKImplodeDecoder(field2, field6)
        output = decoder.decompress(cmp_data[3:])

    out_path = os.path.join(output_dir, file_info['name'])
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, 'wb') as f:
        f.write(output)
    print(f"  OK  {file_info['name']} ({len(output)} bytes)")


def main():
    if len(sys.argv) < 2:
        print("Usage: extract.py <RESOURCE.000> [output_dir]")
        sys.exit(1)

    arc_path = sys.argv[1]
    out_dir = sys.argv[2] if len(sys.argv) > 2 else os.path.join(os.path.dirname(arc_path), "extracted")

    print(f"Reading {arc_path}...")
    files = read_archive_index(arc_path)
    print(f"Found {len(files)} files:")
    for f in files:
        print(f"  {f['name']} (compressed: {f['size']}b)")
    print(f"\nExtracting to {out_dir}...")
    os.makedirs(out_dir, exist_ok=True)
    for f in files:
        try:
            extract_file(arc_path, f, out_dir)
        except Exception as e:
            print(f"  FAIL {f['name']}: {e}")
    print("Done.")


if __name__ == '__main__':
    main()
