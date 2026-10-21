"""Walk the topic -> discovery switch of OUTPOST.EXE (s3:6CF8) symbolically.

For every research topic it follows the code path and records the
discoveries granted (s3:715C) and, for grants guarded by s3:6CA2, the set of
topics that must all be complete. The result is written as JSON so the
rebuild's tables can be checked against the original code.

Usage: python research_switch.py <disasm-dir> [out.json]
"""
import json
import re
import sys

FUNC_START = 0x6CF8
FUNC_END = 0x715C
GRANT = 0x715C       # ResearchResults::grant(discovery)
ALL_DONE = 0x6CA2    # all of the listed topics complete?
UI_REFRESH = 0x7C9E  # refreshes the windows of a building group (SendMessage)
END_LABELS = {0x7154, 0x703E}
TABLE_LABEL = 'switch_table_7052'
TABLE_BIAS = 1       # the switch is on (topic - 1)

def load(disasm_dir):
    lines = open(f'{disasm_dir}/seg03.asm', encoding='utf-8').read().splitlines()
    insns = {}
    raw = {}
    order = []
    table = []
    in_table = False
    for ln in lines:
        if ln.startswith(TABLE_LABEL):
            in_table = True
            continue
        if in_table:
            m = re.match(r'\s+dw loc_([0-9A-F]+)', ln)
            if m:
                table.append(int(m.group(1), 16))
                continue
            in_table = False
        m = re.match(r'3:([0-9A-F]{4})\s+([0-9a-f]+)\s+(.*)$', ln)
        if not m:
            continue
        addr = int(m.group(1), 16)
        if FUNC_START <= addr < FUNC_END:
            insns[addr] = m.group(3).split(';')[0].strip()
            raw[addr] = m.group(2)
            order.append(addr)
    order.sort()
    nxt = {a: order[i + 1] for i, a in enumerate(order[:-1])}
    return insns, raw, nxt, table

def imm(s):
    return int(s, 16) if s.startswith('0x') else int(s)

def walk(insns, raw, nxt, start, topic):
    """Return a list of (conditions, discovery) for one topic."""
    results = []
    # Each path: (addr, stack of words, list of condition topic-sets)
    paths = [(start, [], [])]
    steps = 0
    while paths:
        addr, stack, conds = paths.pop()
        while True:
            steps += 1
            if steps > 20000:
                raise RuntimeError('runaway walk')
            if addr in END_LABELS or addr not in insns:
                break
            ins = insns[addr]
            op = ins.split()[0]
            if ins.startswith('push dword ptr [bp + 6]'):
                stack += ['this_lo', 'this_hi']
            elif op == 'push' and 'ptr' not in ins and ins != 'push cs':
                val = imm(ins.split()[-1])
                if raw[addr].startswith('66'):          # 32-bit push: high word first
                    stack += [(val >> 16) & 0xFFFF, val & 0xFFFF]
                else:
                    stack.append(val & 0xFFFF)
            elif ins == 'push cs':
                pass
            elif op == 'call':
                target = imm(ins.split()[-1])
                if target == GRANT:
                    stack.pop(); stack.pop()          # this
                    disc = stack.pop()
                    results.append((list(conds), disc))
                elif target == ALL_DONE:
                    args = stack[:]
                    # stack top: this(2 words), n, topics...
                    n = args[-3]
                    topics = [args[-4 - i] for i in range(n)]
                    ins2 = insns[nxt[addr]]         # add sp, N
                    m = re.match(r'add sp, (0x[0-9a-f]+|\d+)', ins2)
                    pop = imm(m.group(1)) // 2
                    del stack[-pop:]
                    a2 = nxt[nxt[addr]]             # or ax, ax
                    jmp = insns[nxt[a2]]            # je/jne target
                    target2 = imm(jmp.split()[-1])
                    after = nxt[nxt[a2]]
                    if jmp.startswith('je'):
                        # fall through when all done, jump otherwise
                        paths.append((target2, stack[:], conds + [('not', topics)]))
                        addr, conds = after, conds + [('all', topics)]
                        continue
                    if jmp.startswith('jne'):
                        # jump when all done, fall through otherwise
                        paths.append((after, stack[:], conds + [('not', topics)]))
                        addr, conds = target2, conds + [('all', topics)]
                        continue
                    raise RuntimeError(f'unexpected branch {jmp} at {addr:04X}')
                elif target == UI_REFRESH:
                    stack.pop(); stack.pop(); stack.pop()   # this, group: UI only
                else:
                    raise RuntimeError(f'unknown call {target:04X} at {addr:04X}')
            elif op == 'jmp':
                addr = imm(ins.split()[-1])
                continue
            elif op == 'cmp' and '[bp + 0xa]' in ins:
                cmpval = imm(ins.split()[-1])
                jmp = insns[nxt[addr]]
                target2 = imm(jmp.split()[-1])
                taken = (topic != cmpval) if jmp.startswith('jne') else (topic == cmpval)
                addr = target2 if taken else nxt[nxt[addr]]
                continue
            elif op in ('add', 'or', 'mov', 'leave', 'retf', 'dec', 'xchg', 'nop'):
                if op == 'retf':
                    break
            else:
                raise RuntimeError(f'unhandled {ins} at {addr:04X}')
            addr = nxt[addr]
    return results

def main():
    insns, raw, nxt, table = load(sys.argv[1])
    out = {}
    for i, label in enumerate(table):
        topic = i + TABLE_BIAS
        res = walk(insns, raw, nxt, label, topic)
        if res:
            out[topic] = [{'discovery': d, 'when': [
                {'all_done' if k == 'all' else 'not_all_done': t} for k, t in c]} for c, d in res]
    text = json.dumps(out, indent=1)
    if len(sys.argv) > 2:
        open(sys.argv[2], 'w', encoding='utf-8').write(text)
    for t, grants in out.items():
        simple = [g['discovery'] for g in grants if not g['when']]
        cond = [(g['discovery'], g['when']) for g in grants if g['when']]
        print(t, simple, cond if cond else '')

if __name__ == '__main__':
    main()
