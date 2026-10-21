"""Resolve a value-mapping switch into a table: input value -> result.

Handles the shape MSVC emitted for the save-version translators
(s2:73EA building types, s2:72BC products): `mov ax, [bp+0xa]` then
`dec ax / sub ax, k`, `cmp ax, n`, `ja default`, `jmp cs:[bx + table]`, with
case bodies that either load a constant (`mov ax, N`) or add to the input
(`mov ax, [bp+0xa]; add ax, N`), or fall through to a shared exit.

Usage: switch_map.py <disasm dir> <seg:addr>
Prints `in -> out` lines (`id` for unchanged) as JSON-friendly pairs.
"""
import json
import re
import sys

from show_func import find

lines = find(sys.argv[1], sys.argv[2])
labels = {}
for i, ln in enumerate(lines):
    m = re.match(r'(loc_[0-9A-F]+):', ln)
    if m:
        labels[m.group(1)] = i

# The dispatch: find "dec ax"/"sub ax, k" before "cmp ax, n" before the table.
bias = 0
table_name = None
for i, ln in enumerate(lines):
    if re.search(r'jmp word ptr cs:\[bx', ln):
        for back in range(i - 1, max(0, i - 8), -1):
            m = re.search(r'sub ax, (0x[0-9a-f]+|\d+)$', lines[back].split(';')[0].rstrip())
            if m:
                bias += int(m.group(1), 0)
            if re.search(r'\bdec ax$', lines[back]):
                bias += 1
        for fwd in range(i + 1, i + 3):
            m = re.match(r'(switch_table_[0-9A-F]+):', lines[fwd])
            if m:
                table_name = m.group(1)
                start = fwd + 1
        break
entries = []
for ln in lines[start:]:
    m = re.match(r'\s+dw (loc_[0-9A-F]+)', ln)
    if not m:
        break
    entries.append(m.group(1))


def evaluate(label, value):
    """Follow a case body to the value it produces."""
    i = labels[label] + 1
    result = None
    for _ in range(12):
        ln = lines[i].split(';')[0].rstrip()
        m = re.search(r'mov ax, (0x[0-9a-f]+|\d+)$', ln)
        if m:
            result = int(m.group(1), 0)
        if re.search(r'mov ax, word ptr \[bp \+ 0xa\]', ln):
            result = value
        m = re.search(r'add ax, (0x[0-9a-f]+|\d+)$', ln)
        if m and result is not None:
            result += int(m.group(1), 0)
        m = re.search(r'sub ax, (0x[0-9a-f]+|\d+)$', ln)
        if m and result is not None:
            result -= int(m.group(1), 0)
        if re.search(r'\b(jmp|retf|leave)\b', ln) and result is not None:
            return result
        m = re.match(r'(loc_[0-9A-F]+):', ln)
        i += 1
    return result


out = {}
for k, lab in enumerate(entries):
    v = k + bias
    r = evaluate(lab, v)
    out[v] = r
print(json.dumps(out))
