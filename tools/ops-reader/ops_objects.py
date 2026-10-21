"""Simulation-object parsers for .OPS saves (chunks 0x0A, 0x0C-0x13).

Each function follows one load method of OUTPOST.EXE (named in its
docstring); `version` is 1 for "SC001" files (TUTOR.OPS) and 4 for "SC004"
(saves made by v1.51).
"""
from ops_parse import h, v1_product, v1_type


def dbobj(r):
    """s7:1730 / s7:16D6: own handle, owner handle."""
    return {'handle': h(r.u32()), 'owner': h(r.u32())}


def named(r):
    """s7:19B4 / s7:1978: DbObj, then the child handle list (+0x0C)."""
    o = dbobj(r)
    o['children'] = [h(x) for x in r.handles()]
    return o


def galaxy(r):
    """The star map, object [0x5166] (type 0xFF)."""
    o = named(r)
    n = r.u16()
    o['ids'] = [r.u16() for _ in range(n)]
    return o


def star(r):
    """s7:5E70 / s7:5DBE."""
    o = named(r)
    o['name'] = r.cstr()
    o['pos'] = r.pos()                    # +0x04 (star map)
    n = r.u16()                           # +0x0A
    o['planets'] = [r.u16() for _ in range(n)]
    return o


def planet(r):
    """s7:2C8A / s7:2ACA: record at +0x10, then +0x14..+0x1A."""
    o = named(r)
    o['nameId'] = r.u16()                 # rec+0x00 (string id, s3:82F8)
    o['name'] = r.cstr()                  # rec+0x02
    o['pos'] = r.pos()                    # rec+0x06
    o['hostility'] = r.i16()              # rec+0x0C
    o['rec0E'] = r.i32()                  # rec+0x0E
    o['traits'] = [r.i16() for _ in range(8)]   # rec+0x12, 16 bytes
    n = r.u16()                           # rec+0x22
    o['sites'] = [r.u16() for _ in range(n)]    # rec+0x24
    o['f14'] = r.i16()
    o['atmosphere'] = r.i16()             # +0x16
    o['terraformTurns'] = r.i16()         # +0x18
    o['f1A'] = r.i16()
    return o


def site(r):
    """s7:581E / s7:56F6: record at +0x10, then +0x14 (position), +0x1C."""
    o = named(r)
    o['rec00'] = r.u16()
    o['rec02'] = r.u16()
    o['name'] = r.cstr()                  # rec+0x04
    n = r.u16()                           # rec+0x1A
    o['mineSites'] = [r.pos() for _ in range(n)]   # rec+0x16
    o['pos'] = r.pos()                    # +0x14
    o['f1C'] = r.u16()                    # +0x1C
    return o


def population(r, version):
    """s7:33F0 / s7:32E4."""
    p = {'cohorts': [r.i32() for _ in range(91)],
         'deathRate': [r.i16() for _ in range(6)],
         'deathChance': [r.i16() for _ in range(6)],
         'deathCarry': [r.i32() for _ in range(6)],
         'birthDivisor': r.i16(),
         'lifeSupportDeaths': r.i32()}
    if version >= 2:
        p['extra170'] = r.i32()
        p['schoolLeavingAge'] = r.u16()
    return p


def colony(r, version):
    """s8:6118 / s8:5E16."""
    o = dbobj(r)
    n = r.u32()                           # +0x0C keyed tile list (s2:7548)
    o['tiles'] = [(h(r.u32()), r.u16()) for _ in range(n)]
    o['hub'] = h(r.u32())                 # +0x10
    o['morale'] = r.i16()
    o['prevMorale'] = r.i16()
    o['defectionTier'] = r.u16()
    o['defectionAmount'] = r.i32()
    o['crime'] = r.i16()
    o['education'] = r.i16()
    o['total'] = [r.i32() for _ in range(37)]
    units = [r.i32() for _ in range(21)]
    busy = [r.i32() for _ in range(21)]
    if version < 2:                       # v1 kinds -> v4 (s2:72BC)
        u2, b2 = [0] * 21, [0] * 21
        for k in range(21):
            t = v1_product(k)
            u2[t] = units[k]
            b2[t] = busy[k]
        units, busy = u2, b2
    o['units'] = units
    o['busy'] = busy
    o['population'] = population(r, version)
    o['name'] = r.cstr()                  # +0x1FA
    o['populated'] = r.u16()
    o['player'] = h(r.u32())
    o['nanotech'] = r.u16()
    o['freeResources'] = r.u16()
    o['f208'] = r.u16()
    o['crowdingMorale'] = r.i16()
    o['crowdingFlag'] = r.i16()
    o['explorers'] = r.i16()
    if version >= 2:
        o['plagueTurns'] = r.i16()
        o['plagueTreated'] = r.i32()
    return o


def items(r, version):
    """Item lists (factory output, warehouse stock, tile lists): word count,
    then {+4, product A, product B, quantity, units}."""
    n = r.u16()
    out = []
    for _ in range(n):
        f4, a, b, q, u = r.u16(), r.u16(), r.u16(), r.u16(), r.u16()
        if version < 2:
            a = v1_product(a)
        out.append({'f4': f4, 'A': a, 'B': b, 'qty': q, 'units': u})
    return out


def tile(r, version):
    """s7:778C / s7:7418."""
    o = dbobj(r)
    o['pos'] = r.pos()                    # +0x0C
    o['f12'] = r.u16()
    o['f14'] = r.u16()
    o['building'] = h(r.u32())            # +0x16
    o['units'] = [h(x) for x in r.handles()]   # +0x1E
    o['bas'] = r.ledger()                 # +0x22
    o['alloc'] = r.ledger()               # +0x26
    o['colony'] = h(r.u32())              # +0x2A
    if version >= 2:
        o['f32'] = r.u16()
        o['trucks'] = r.u16()             # +0x34
        o['route'] = [h(x) for x in r.handles()]   # +0x36
        o['list3A'] = items(r, version)
        o['list3E'] = items(r, version)
    return o


def unit(r, version):
    """s6:B2C8 / s6:B282 (the kind is a product: v1 translated)."""
    o = dbobj(r)
    k = r.u16()
    o['kind'] = v1_product(k) if version < 2 else k
    return o


def building(r, version):
    """s6:B81A / s6:B5EC and the subclass extensions."""
    raw_type = r.u16()                    # read by the table reader for the factory
    tr = v1_type if version < 2 else (lambda t: t)
    o = dbobj(r)
    o['type'] = tr(r.u16())
    o['placeholder'] = tr(r.u16())        # +0x0E
    o['sprite'] = tr(r.u16())             # +0x10
    o['state'] = r.u16()                  # +0x12
    o['savedState'] = r.u16()             # +0x18
    o['flags'] = r.u16()                  # +0x1A
    eff = o['savedState'] if o['state'] == 6 else o['state']
    if eff in (1, 2, 3):
        o['robotWord'] = r.u16()          # +0x14 (robot states)
    elif eff == 4:
        o['buildTurnsLeft'] = r.u16()     # needs+0x94
    elif eff == 5:
        o['opsResource'] = r.u16()        # needs+0xA4
        a = r.u16()                       # needs+0xA6, product A
        o['opsProductA'] = v1_product(a) if version < 2 else a
        o['opsProductB'] = r.u16()        # +0xA8
        o['opsAmount'] = r.u16()          # +0xAA
        o['opsCycleTurns'] = r.u16()      # +0xAC
    t = o['type']
    if t in (11, 55):                     # CommandCenter s7:C29C
        o['f20'] = r.u32()
        o['life'] = r.i16()
    elif t in (12, 53, 54):               # smelters s6:3D92
        o['minBCarry'] = r.i32()
        o['minCCarry'] = r.i32()
        o['output'] = r.ledger()
    elif t in (14, 30, 31, 32, 91, 92):   # factories s6:0374
        o['progress'] = r.i16()
        o['output'] = items(r, version)
    elif t in (16, 51, 52, 96, 97):       # mines s6:14D8
        o['life'] = r.i16()
        o['oreCursor'] = r.u16()
        if version >= 2:
            o['global4FBC'] = r.u16()
    elif t in (40, 41, 93, 94, 95):       # labs s7:C894
        o['topic'] = r.u16()
    elif t in (45, 46):                   # TerraForm s6:4A5A
        o['systems'] = [r.u16() for _ in range(5)]
    elif t in (49, 50, 108, 109):         # police s5:D41A
        o['mode'] = r.u16()
    elif t in (56, 57):                   # RoboCmd s7:D72E
        slots = []
        for _ in range(10):
            s = {'expires': r.u32(), 'item': r.u16()}
            if version < 2:
                s['item'] = v1_product(s['item'])
                s['flag'], s['f8'] = 3, 0
            else:
                s['flag'], s['f8'] = r.u16(), r.u32()
            slots.append(s)
        o['slots'] = slots
        if version >= 4:
            o['firstRoboCmd'] = r.u16()   # DGROUP 0x5812
    elif t in (58, 59):                   # warehouses s6:65E2
        o['items'] = items(r, version)
    elif t == 63:                         # MonoStation s6:24A2 (v2+ only)
        if version >= 2:
            raise NotImplementedError('MonoStation v2 list')
    elif t in (84, 85, 86):               # UGUniv s6:5FC8
        o['f20'] = r.u16()
    elif t in (115, 116, 117, 119, 120, 121):   # robots s7:DEC4
        if version >= 2:
            o['f20'] = r.u32()
        if t in (115, 119):               # RoboDoze s5:E994
            o['f24'] = r.u16()
        elif t in (116, 120, 121):        # RoboDig s5:E70E
            o['f24'] = r.u16()
            o['f26'] = r.u16()
    o['rawType'] = raw_type
    return o


def player(r):
    """s7:232E / s7:227A."""
    o = named(r)
    o['remaining'] = [r.i16() for _ in range(131)]
    o['discoveries'] = [r.i16() for _ in range(67)]
    o['priority'] = [r.u16() for _ in range(5)]
    o['minTurns'] = [r.i16() for _ in range(131)]
    o['worked'] = [r.u16() for _ in range(131)]
    return o


def table(ops, tag, fn):
    r, end = ops.reader(tag)
    n = r.u32()
    out = []
    for _ in range(n):
        start = r.p
        try:
            out.append(fn(r))
        except Exception as e:  # report where a layout went wrong
            raise RuntimeError(f'chunk {tag:02X} object {len(out)} at {start}: {e}')
    return out, r.p, end


def build_menu(ops):
    """Chunk 0x03, registry 0x35 (s3:68C6 / s3:6846)."""
    v = ops.version
    r, end = ops.reader(0x03)
    offered = [0] * 138
    products = [0] * 21
    if v <= 1:                           # 129 v1 type words, 21 v1 products
        old = [r.u16() for _ in range(129)]
        for t in range(1, 129):
            offered[v1_type(t)] = old[t]
        oldp = [r.u16() for _ in range(21)]
        for k in range(21):
            products[v1_product(k)] = oldp[k]
    else:
        offered = [r.u16() for _ in range(138)]
        products = [r.u16() for _ in range(21)]
    raw = r.u16()
    mine = v1_type(raw) if v <= 1 else raw   # +0x148: the mine type offered
    return {'offered': [t for t, f in enumerate(offered) if f], 'products':
            [k for k, f in enumerate(products) if f], 'mineType': mine,
            'chk': (r.p, end)}


def handle_counters(ops):
    """Chunk 0x09: the handle allocator (s7:5C1A), last index per type 0..8."""
    r, end = ops.reader(0x09)
    return [r.u32() for _ in range(9)], (r.p, end)


def parse(ops):
    v = ops.version
    res = {'version': v}
    res['menu'] = build_menu(ops)
    res['counters'], res['chk09'] = handle_counters(ops)
    r, end = ops.reader(0x0A)
    res['turn'] = r.u32()
    res['db8'] = r.u16()
    res['galaxy'] = galaxy(r)
    res['chk0A'] = (r.p, end)
    for tag, name, fn in [(0x0C, 'stars', star), (0x0D, 'planets', planet),
                          (0x0E, 'sites', site),
                          (0x0F, 'colonies', lambda r: colony(r, v)),
                          (0x10, 'tiles', lambda r: tile(r, v)),
                          (0x11, 'units', lambda r: unit(r, v)),
                          (0x12, 'buildings', lambda r: building(r, v)),
                          (0x13, 'players', player)]:
        objs, p, e = table(ops, tag, fn)
        res[name] = objs
        res['chk%02X' % tag] = (p, e)
    return res


if __name__ == '__main__':
    import json
    import sys
    from ops_parse import Ops
    data = open(sys.argv[1], 'rb').read()
    ops = Ops(data)
    res = parse(ops)
    res['chk03'] = res['menu']['chk']
    for k, val in res.items():
        if k.startswith('chk'):
            print(k, 'end ok' if val[0] == val[1] else f'MISMATCH: stopped at {val[0]}, chunk ends {val[1]}')
    print('version', res['version'], 'turn', res['turn'], 'handle counters', res['counters'])
    print('menu offers', res['menu']['offered'], 'products', res['menu']['products'], 'mine', res['menu']['mineType'])
    for k in ('stars', 'planets', 'sites', 'colonies', 'tiles', 'units', 'buildings', 'players'):
        print(k, len(res[k]))
    if '--dump' in sys.argv:
        print(json.dumps(res, indent=1, default=str))
