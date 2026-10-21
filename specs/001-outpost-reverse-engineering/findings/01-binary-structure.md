# OUTPOST.EXE — Binary Structure (verified)

**Status:** Rewritten 2026-10-10 from a correct NE parse
(`tools/ne-analyzer/ne_parse.py`). The previous version
(`superseded/01-binary-structure.v2.md`) parsed the segment table with the
wrong entry size and drew most of its conclusions from that; see
[ERRATA.md](ERRATA.md). The summary is in [00-ground-truth.md](00-ground-truth.md).

## 1. Headers

* MZ stub ("This program requires Microsoft Windows."), `e_lfanew = 0x80`.
* NE header at 0x80:

| Field | Value |
|-------|-------|
| Linker version | 5.60 (Microsoft LINK 5.60, Visual C++ 1.5x) |
| Flags | 0x032A: MULTIPLEDATA, protected-mode only, etc. |
| Auto data segment | 11 |
| Initial heap / stack | 0x1000 / 0x2800 |
| CS:IP | 1:2300 (`__astart`, file 0x2D20) |
| SS:SP | 11:0000 (stack at top of DGROUP) |
| Segments / modules | 11 / 5 |
| Alignment shift | 4 (16-byte sectors) |
| Expected Windows | 3.10 |
| Table offsets (file) | segment 0xC0, resource 0x118, resident names 0x919, module refs 0x951, imported names 0x95B, entry 0x97D, non-resident names 0x98C |

## 2. Segment table (8-byte entries)

| Seg | Type | File offset | Length | Flags | Relocation records | Fixup sites |
|-----|------|------------:|-------:|-------|-------------------:|------------:|
| 1 | CODE | 0x000A20 | 0x55B7 | 0x0D50 MOVEABLE PRELOAD RELOCINFO | 29 | 110 |
| 2 | CODE | 0x0060E0 | 0xEFE0 | 0x0D50 | 102 | 1694 |
| 3 | CODE | 0x015420 | 0xEE9F | 0x0D50 | 46 | 1401 |
| 4 | CODE | 0x024460 | 0xEE6A | 0x0D50 | 39 | 5426 |
| 5 | CODE | 0x033420 | 0xEFBA | 0x0D50 | 86 | 2348 |
| 6 | CODE | 0x0426A0 | 0xEFBE | 0x0D50 | 10 | 2343 |
| 7 | CODE | 0x0516C0 | 0xEF76 | 0x0D50 | 12 | 1591 |
| 8 | CODE | 0x0606C0 | 0xEF91 | 0x0D50 | 53 | 2307 |
| 9 | CODE | 0x06F820 | 0xD974 | 0x0D50 | 96 | 2403 |
| 10 | DATA | 0x07D4C0 | 0x423C | 0x0D51 | 1 | 376 |
| 11 | DATA (DGROUP) | 0x081720 | 0x68B6 | 0x0D51 | 7 | 497 |

Resources follow at 0x88040–0x9C900. Every segment is moveable and
preloaded; there are no overlays and no huge segments. "Fixup sites" counts
every patched location after walking the NE relocation chains.

How inter-segment calls are encoded: `9A off16 sel16` with an
INTERNALREF **SEGMENT** fixup on the selector word only (chained through
that word). The offset is literal in the instruction. Same-segment far calls
use `90 0E E8 rel16` (`nop; push cs; call near`). Imports use FAR_ADDR
fixups on the full 4 bytes.

## 3. Names, entries, modules

* Resident names: `OUTPOST` (module), `___EXPORTEDSTUB` @1, `_SHI_INVOKEERRORHANDLER1` @2.
* Non-resident: "Outpost is Copyright 1994, Sierra On-Line, Inc. All Rights Reserved."
* Entry table: ordinal 1 → 1:29EC, ordinal 2 → 1:1E70 (both exported).
* Modules: KERNEL, GDI, USER, MMSYSTEM, COMMDLG.

## 4. Imports (all 172, with fixup-site counts)

Ordinals were resolved with Wine's `dlls/*16/*.spec` tables (subset stored
in `tools/ne-analyzer/ordinals/`).

**KERNEL** (42): __AHINCR (16), __AHSHIFT (14), __WINFLAGS (2), _hread (7), _hwrite (2), _lclose (10), _lcreat (1), _llseek (3), _lopen (3), DOS3Call (45), FatalAppExit (2), FatalExit (1), FindResource (1), FreeProcInstance (6), FreeResource (2), GetDOSEnvironment (1), GetModuleFileName (1), GetPrivateProfileString (13), GetVersion (2), GlobalAlloc (2), GlobalDOSAlloc (1), GlobalDOSFree (1), GlobalFree (3), GlobalHandle (3), GlobalLock (3), GlobalPageLock (2), GlobalPageUnlock (1), GlobalReAlloc (2), GlobalSize (2), GlobalUnlock (4), hmemcpy (2), InitTask (1), LoadResource (1), LockResource (1), LockSegment (1), lstrlen (2), MakeProcInstance (7), OutputDebugString (5), SetErrorMode (3), WaitEvent (1), WinExec (1), WritePrivateProfileString (12)

**USER** (101): _wsprintf (28), BeginPaint (29), BringWindowToTop (5), CallWindowProc (3), CheckDlgButton (12), CheckMenuItem (2), CheckRadioButton (4), ClientToScreen (4), CreateDialog (1), CreateWindow (11), CreateWindowEx (1), DefWindowProc (5), DeleteMenu (1), DestroyCursor (2), DestroyIcon (4), DestroyMenu (4), DestroyWindow (47), DispatchMessage (2), DrawIcon (4), DrawText (10), EnableMenuItem (17), EnableWindow (87), EndPaint (29), EnumChildWindows (2), FillRect (16), FrameRect (3), GetClassInfo (4), GetClientRect (28), GetCursorPos (1), GetDC (16), GetDlgCtrlID (6), GetDlgItem (144), GetDlgItemInt (15), GetMenuState (1), GetMessage (3), GetNextDlgTabItem (1), GetProp (19), GetSubMenu (5), GetSysColor (2), GetSystemMetrics (45), GetWindowDC (2), GetWindowLong (9), GetWindowPlacement (2), GetWindowRect (27), GetWindowText (9), GetWindowWord (8), GrayString (1), InitApp (1), InsertMenu (1), InvalidateRect (29), IsDialogMessage (3), IsDlgButtonChecked (33), IsIconic (11), IsWindow (21), IsWindowEnabled (2), KillTimer (6), LoadAccelerators (1), LoadCursor (20), LoadIcon (5), LoadMenu (4), LoadString (6), MapDialogRect (7), MessageBeep (4), MessageBox (31), ModifyMenu (1), MoveWindow (8), PostMessage (73), PostQuitMessage (1), PtInRect (15), RealizePalette (9), RegisterClass (4), ReleaseCapture (9), ReleaseDC (11), RemoveProp (10), ScreenToClient (1), SelectPalette (33), SendDlgItemMessage (87), SendMessage (99), SetCapture (4), SetCursor (30), SetDlgItemInt (20), SetDlgItemText (25), SetFocus (19), SetProp (10), SetSysColors (1), SetSysModalWindow (1), SetTimer (3), SetWindowLong (8), SetWindowPlacement (2), SetWindowPos (24), SetWindowText (27), SetWindowWord (1), ShowCursor (2), ShowWindow (40), TrackPopupMenu (4), TranslateAccelerator (2), TranslateMessage (2), UpdateWindow (13), ValidateRect (2), WinHelp (7), wvsprintf (2)

**GDI** (25): CreateDC (5), CreatePalette (1), CreatePen (19), CreateSolidBrush (20), DeleteDC (5), DeleteObject (67), Ellipse (1), GetCurrentPosition (2), GetDeviceCaps (6), GetStockObject (31), GetSystemPaletteEntries (2), GetTextExtent (6), LineTo (46), MoveTo (25), MoveToEx (4), Polygon (5), Rectangle (5), SelectObject (73), SetBkColor (22), SetDIBitsToDevice (1), SetMapMode (4), SetTextColor (23), StretchDIBits (1), TextOut (3), UnrealizeObject (4)

**MMSYSTEM** (2): mciGetErrorString (3), mciSendCommand (6)

**COMMDLG** (2): GetOpenFileName (1), GetSaveFileName (1)

Notably absent: `BitBlt`, `CreateCompatibleDC/Bitmap`, `StretchBlt`,
`timeSetEvent`, `sndPlaySound`, `waveOut*`, `midiOut*`, `GetDIBits`,
`SetPaletteEntries`, `LoadLibrary`, `GetProcAddress`.

## 5. Resources (156 entries)

| Type | Count | Ids / names |
|------|------:|-------------|
| RT_GROUP_CURSOR / RT_CURSOR | 5 / 5 | 411–415 / 2–6 |
| RT_GROUP_ICON / RT_ICON | 4 / 4 | OP, SITEICON, PLNTICON, TILEICON / 1, 7, 8, 9 |
| RT_MENU | 6 | OPPOPMENU, TILEMENU, TPPOPMENU, SCPOPMENU, PCPOPMENU, REPORTPOPMENU |
| RT_DIALOG | 61 | see `reference/outpost-exe/resources.txt` |
| RT_STRING | 60 blocks | 882 strings, ids 1000–2066 |
| RT_ACCELERATOR | 1 | OPACCEL |
| RT_RCDATA | 10 | 333–342 (Sol body fact sheets) |

`SITEICON` etc. are resource names, not exports. The old doc mistook them for
resident names because it never parsed the resource table.

## 6. Code

`tools/ne-analyzer/ne_disasm.py` (Capstone, relocation-aware recursive
descent, switch-table decoding, far-vtable harvesting):

* 3,378 functions, 89.5 % of code bytes decoded, 77 jump tables.
* Compiler: MSVC 16-bit with `/G3`. Typical prologue `C8 nn nn 00`
  (`enter`), far `retf n` (Pascal convention), DS == SS (no DS reload in
  prologues), 32-bit arithmetic through `66h` prefixes.
* C++ objects carry a far vtable pointer at +0; vtables are arrays of far
  pointers stored in code segments (detectable as runs of SEGMENT fixups).
  Constructors install them with `mov es:[bx],off / mov es:[bx+2],SEG`.
* Classes visible through strings: `Op` (app root; `New failed in
  Op::Op->ResLibr / DialogCtr / DialogHandler / Simulator`), `OpWnd`
  (`getKid`, `initFileStruct`), window classes `SOLDefaultWindowClass`,
  `SOLClearWnd`, `SOLChild`, `SOLChildPar`, `MciSoundWindow`, controls
  `OPButton`, `MicroSpinControl`, and the 28 `SC*` simulation step classes.
  Developer tag: string `DanBrotherton` (lead programmer, credited "Code Master").

The simulation step classes and the turn pipeline are documented in
[00-ground-truth.md §3](00-ground-truth.md#3-simulation-architecture-verified-from-code).

## 7. Startup

`__astart` (1:2300) is the stock MSVC Windows startup: `InitTask`,
`WaitEvent`, `InitApp`, runtime init (DOS3Call, environment), then WinMain.
The application root object `Op` creates the resource library, dialog
controller, dialog handler and the **Simulator** (inferred from the
`New failed in Op::Op->…` messages). The Simulator is reached through the
global far pointer at DGROUP `0x5748`, which `RunTurn` uses. The message loops
are `s2:9498` / `s2:9510` (`GetMessage`, `IsDialogMessage`,
`TranslateAccelerator`, `TranslateMessage`, `DispatchMessage`).
