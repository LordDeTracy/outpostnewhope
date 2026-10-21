"""Print the serialization sequence of an OUTPOST.EXE save/load method.

Reads a function from the annotated disassembly and lists, in code order,
the fields it writes or reads:

    field  +OFF  SIZE          File_write/File_read of a copy of this+OFF
    call   HELPER(+OFF)        helper given the field's value (container, ledger)
    call   HELPER(&+OFF)       helper given the field's address (position)
    call   HELPER              any other call (base-class save, ...)
    branch ...                 conditional jumps, so optional parts stand out

Usage: save_layout.py <disasm dir> <seg:addr> [...]

The patterns are those MSVC emitted for these methods (copy the field to a
stack temporary, push size/&temp/file, call s2:7E1C or s2:7DEE). Anything
else is shown as a raw call; read the listing for those.
"""
import re
import sys

from show_func import find as find_function  # same directory

FILE_IO = ('File_write', 'File_read')


def layout(lines):
    out = []
    pending = {}        # stack temp offset -> (field offset, size)
    last_field = None   # (offset, size) loaded from es:[bx + off] most recently
    addr_of = None      # field offset whose address was formed (add ax, OFF)
    size = None
    pushed = []         # recent pushes of es:[bx + off]
    for ln in lines:
        if ln.startswith(';'):
            continue
        m = re.search(r'mov (e?ax|cx|dx), (word|dword) ptr es:\[bx \+ (0x[0-9a-f]+|\d+)\]', ln)
        if m:
            last_field = (int(m.group(3), 0), 4 if m.group(2) == 'dword' else 2)
            continue
        m = re.search(r'mov (word|dword) ptr \[bp - (0x[0-9a-f]+|\d+)\], (e?ax|cx|dx)', ln)
        if m and last_field:
            pending[int(m.group(2), 0)] = last_field
            continue
        m = re.search(r'add ax, (0x[0-9a-f]+|\d+)$', ln)
        if m:
            addr_of = int(m.group(1), 0)
            continue
        m = re.search(r'push dword ptr es:\[bx \+ (0x[0-9a-f]+|\d+)\]', ln)
        if m:
            pushed.append(int(m.group(1), 0))
            continue
        m = re.search(r'push (?:word ptr )?(0x[0-9a-f]+|\d+)$', ln.split(';')[0].strip())
        if m:
            size = int(m.group(1), 0)
            continue
        m = re.search(r'lea ax, \[bp - (0x[0-9a-f]+|\d+)\]', ln)
        if m:
            addr_of = None
            tmp = int(m.group(1), 0)
            if tmp in pending:
                last_tmp = tmp
            else:
                last_tmp = None
            out_tmp = tmp
            pending.setdefault('_lea', None)
            pending['_lea'] = tmp
            continue
        m = re.search(r'\bj(e|ne|z|nz|l|le|g|ge|b|be|a|ae)\b\s+(0x[0-9a-f]+)', ln)
        if m and 'or ax, ax' not in ln:
            out.append(f'  branch {m.group(1)} -> {m.group(2)}')
            continue
        if 'call' in ln:
            name = ln.split(';')[-1].strip() if ';' in ln else ln.split()[-1]
            if any(f in name for f in FILE_IO):
                tmp = pending.get('_lea')
                fld = pending.get(tmp)
                kind = 'write' if 'write' in name else 'read'
                if addr_of is not None and not tmp:
                    out.append(f'  field  &+0x{addr_of:X}  {size}   ({kind} into this or a record)')
                    addr_of = None
                    pushed = []
                    continue
                if fld:
                    out.append(f'  field  +0x{fld[0]:X}  {size}   ({kind})')
                else:
                    out.append(f'  field  [bp-0x{tmp:X}]  {size}   ({kind}, local)' if tmp else f'  field  ?  {size} ({kind})')
                pending['_lea'] = None
            elif pushed:
                out.append(f'  call   {name}(+0x{pushed[-1]:X})')
            elif addr_of is not None:
                out.append(f'  call   {name}(&+0x{addr_of:X})')
            else:
                out.append(f'  call   {name}')
            pushed = []
            addr_of = None
            continue
    return out


def main():
    d = sys.argv[1]
    for addr in sys.argv[2:]:
        lines = find_function(d, addr)
        print(lines[0] if lines else f'; {addr} not found')
        for row in layout(lines):
            print(row)


if __name__ == '__main__':
    main()
