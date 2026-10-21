"""Build the rebuild's terrain packs from the raw CC0 downloads.

Reads ../third_party/terrain-packs (see each folder's SOURCE.txt) and writes
../assets/terrain-packs/<pack>/{atlas.png, pack.txt, SOURCE.txt}. Every tile
is cut to a 128x64 diamond (transparent outside it), so the game draws all
packs the same way. Needs Pillow.

pack.txt:
    name <text>
    templates <planet template ids, 1..10: Mercury Venus Moon Mars Jupiter
               Saturn Neptune Pluto Ceres Phobos>
    kind <terrain kind 1..5> <atlas cell> ...
Kinds: 1 clear, 2 rough, 3 hostile, 4 impassable, 5 bulldozed (the surface
types of a site map; findings/12-graphics.md). The atlas has 8 cells of
128x64 per row.
"""
import os
import shutil
import sys

from PIL import Image

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, 'third_party', 'terrain-packs')
OUT = os.path.join(ROOT, 'assets', 'terrain-packs')
CW, CH, COLS = 128, 64, 8
MAGENTA = (255, 0, 255)


def diamond(im):
    """im scaled to 128x64, transparent outside the diamond."""
    im = im.convert('RGBA').resize((CW, CH), Image.LANCZOS if im.width >= CW else Image.NEAREST)
    px = im.load()
    for y in range(CH):
        for x in range(CW):
            r, g, b, a = px[x, y]
            inside = abs(x + 0.5 - CW / 2) / (CW / 2) + abs(y + 0.5 - CH / 2) / (CH / 2) <= 1.0
            magenta = r > 200 and g < 60 and b > 200
            if not inside or magenta or a < 128:
                px[x, y] = (0, 0, 0, 0)
    return im


def inner(im, k=0.1):
    """The middle of a tile, so its shaded rim is left out: the diamond
    drawn from it lies within 80% of the source's."""
    w, h = im.size
    return im.crop((int(w * k), int(h * k), int(w * (1 - k)), int(h * (1 - k))))


def unoutline(im):
    """The pixel-art packs outline each tile in near black, which tiles into
    a grid: those pixels take the tile's average colour."""
    px = im.load()
    keep = [px[x, y] for y in range(im.height) for x in range(im.width)
            if px[x, y][3] and sum(px[x, y][:3]) >= 90]
    if not keep:
        return im
    avg = tuple(sum(c[i] for c in keep) // len(keep) for i in range(3)) + (255,)
    for y in range(im.height):
        for x in range(im.width):
            if px[x, y][3] and sum(px[x, y][:3]) < 90:
                px[x, y] = avg
    return im


def tint(im, k):
    if not k:
        return im
    px = im.load()
    for y in range(im.height):
        for x in range(im.width):
            r, g, b, a = px[x, y]
            px[x, y] = (min(255, int(r * k[0])), min(255, int(g * k[1])), min(255, int(b * k[2])), a)
    return im


def sbs(sheet, i):
    """Cell i (row-major, 3 x 6) of a Screaming Brain 384x384 sheet."""
    im = Image.open(os.path.join(SRC, 'sbs-floor', 'files', 'Small 128x64', 'Exterior', sheet))
    return im.crop(((i % 3) * CW, (i // 3) * CH, (i % 3) * CW + CW, (i // 3) * CH + CH))


def moon(n):
    """The top face of Kipperfalcon's 32x32 tile 'Slice n'."""
    d = os.path.join(SRC, 'moon-kipperfalcon', 'files', '[FREE] Space Isometric Pixel art 32x32', 'Tiles')
    im = Image.open(os.path.join(d, 'Slice %d.png' % n)).convert('RGBA')
    x0, y0, x1, _ = im.getbbox()
    return inner(unoutline(im.crop((x0, y0, x1, y0 + (x1 - x0) // 2))))


def newc(col, row):
    """The top face of Newc42's 48x48 block at (col, row)."""
    im = Image.open(os.path.join(SRC, 'newc42-map', 'files', 'Isometric Terrain Tiles', 'Spritesheet.png'))
    cell = im.convert('RGBA').crop((col * 48, row * 48, col * 48 + 48, row * 48 + 48))
    px = cell.load()
    # The top face's middle is the first row the block fills edge to edge.
    mid = next(y for y in range(48) if px[0, y][3] > 128 and px[47, y][3] > 128)
    return inner(unoutline(cell.crop((0, mid - 12, 48, mid + 12))))


DRY, ROCKY, ICE = 'Dry/Floor_Dry_01-128x64.png', 'Rocky/Floor_Rocky_01-128x64.png', 'Ice/Floor_Ice_01-128x64.png'
DUSK = (0.55, 0.45, 0.42)        # desert tops darkened to volcanic ash
ASH = (0.40, 0.33, 0.32)

PACKS = {
    'desert': ('Desert', 'sbs-floor', [4], {
        1: [sbs(DRY, i) for i in (2, 6)],
        2: [sbs(DRY, i) for i in (0, 1, 4, 7)],
        3: [sbs(DRY, i) for i in (12, 15, 17)],
        4: [sbs(DRY, i) for i in (8, 10, 16)],
        5: [sbs(DRY, 3)],
    }),
    'rocky': ('Rocky Barren', 'sbs-floor', [1, 9], {
        1: [sbs(ROCKY, i) for i in (16, 5, 7)],
        2: [sbs(ROCKY, i) for i in (1, 2, 10)],
        3: [sbs(ROCKY, i) for i in (8, 13, 9)],
        4: [sbs(ROCKY, i) for i in (11, 14, 3)],
        5: [sbs(ROCKY, 6)],
    }),
    'ice': ('Ice World', 'sbs-floor', [5, 6, 7, 8], {
        1: [sbs(ICE, i) for i in (2, 5, 8)],
        2: [sbs(ICE, i) for i in (0, 1, 6)],
        3: [sbs(ICE, i) for i in (9, 10, 14)],
        4: [sbs(ICE, i) for i in (4, 13, 15)],
        5: [sbs(ICE, 17)],
    }),
    'lunar': ('Lunar', 'moon-kipperfalcon', [3, 10], {
        1: [moon(n) for n in (5, 6)],
        2: [moon(n) for n in (8, 10, 26)],
        3: [moon(n) for n in (1, 2, 3, 4)],
        4: [tint(moon(n), (0.6, 0.6, 0.65)) for n in (7, 9)],
        5: [moon(14)],
    }),
    'volcanic': ('Volcanic', 'newc42-map', [2], {
        1: [tint(newc(c, 4), DUSK) for c in (3, 4, 5)],
        2: [tint(newc(c, 5), ASH) for c in (3, 4, 5)],
        3: [newc(6, 5), newc(7, 5)],
        4: [newc(8, 5), newc(6, 6)],
        5: [tint(newc(3, 7), DUSK)],
    }),
}


def main():
    os.makedirs(OUT, exist_ok=True)
    for key, (name, source, templates, kinds) in PACKS.items():
        tiles, lines = [], ['name ' + name, 'templates ' + ' '.join(map(str, templates))]
        for kind in sorted(kinds):
            cells = []
            for im in kinds[kind]:
                cells.append(len(tiles))
                tiles.append(diamond(im))
            lines.append('kind %d %s' % (kind, ' '.join(map(str, cells))))
        rows = (len(tiles) + COLS - 1) // COLS
        atlas = Image.new('RGBA', (COLS * CW, rows * CH), (0, 0, 0, 0))
        for i, t in enumerate(tiles):
            atlas.paste(t, ((i % COLS) * CW, (i // COLS) * CH), t)
        d = os.path.join(OUT, key)
        os.makedirs(d, exist_ok=True)
        atlas.save(os.path.join(d, 'atlas.png'))
        with open(os.path.join(d, 'pack.txt'), 'w', newline='\n') as f:
            f.write('\n'.join(lines) + '\n')
        shutil.copyfile(os.path.join(SRC, source, 'SOURCE.txt'), os.path.join(d, 'SOURCE.txt'))
        print(key, len(tiles), 'tiles')


if __name__ == '__main__':
    sys.exit(main())
