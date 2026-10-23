; OUTPOST.EXE segment 9 (CODE), 55668 bytes

; ---------------- OrbitalLaunchDlg::init@s9:0000 size=368 callers=0
;   apis: USER.GetWindowRect, USER.MapDialogRect, USER.SetWindowPos
;   (vslot 2) dialog 358: eight controls made from DGROUP 0x5C60, says add18
9:0000  c8380000             enter 0x38, 0
9:0004  57                   push di
9:0005  56                   push si
9:0006  66ff7606             push dword ptr [bp + 6]
9:000A  90                   nop
9:000B  0e                   push cs
9:000C  e8d378               call 0x78e2  ; OPDialog::create@s9:78E2
9:000F  c746fe0800           mov word ptr [bp - 2], 8
9:0014  c746f80000           mov word ptr [bp - 8], 0
9:0019  eb19                 jmp 0x34
9:001B  db 90
loc_001C:
9:001C  33c0                 xor ax, ax
9:001E  99                   cdq
loc_001F:
9:001F  8946fa               mov word ptr [bp - 6], ax
9:0022  8956fc               mov word ptr [bp - 4], dx
9:0025  ff76f8               push word ptr [bp - 8]
9:0028  66ff7606             push dword ptr [bp + 6]
9:002C  90                   nop
9:002D  0e                   push cs
9:002E  e82705               call 0x558  ; OrbitalLaunchDlg::refresh@s9:0558
9:0031  ff46f8               inc word ptr [bp - 8]
loc_0034:
9:0034  8b46fe               mov ax, word ptr [bp - 2]
9:0037  3946f8               cmp word ptr [bp - 8], ax
9:003A  7d7a                 jge 0xb6
9:003C  8b5ef8               mov bx, word ptr [bp - 8]
9:003F  8bc3                 mov ax, bx
9:0041  03db                 add bx, bx
9:0043  03d8                 add bx, ax
9:0045  03db                 add bx, bx
9:0047  03d8                 add bx, ax
9:0049  03db                 add bx, bx
9:004B  8b87605c             mov ax, word ptr [bx + 0x5c60]
9:004F  8946de               mov word ptr [bp - 0x22], ax
9:0052  8b87625c             mov ax, word ptr [bx + 0x5c62]
9:0056  8946e0               mov word ptr [bp - 0x20], ax
9:0059  b80100               mov ax, 1
9:005C  8946e2               mov word ptr [bp - 0x1e], ax
9:005F  8946e4               mov word ptr [bp - 0x1c], ax
9:0062  c47606               les si, ptr [bp + 6]
9:0065  26ff7406             push word ptr es:[si + 6]
9:0069  8d46de               lea ax, [bp - 0x22]
9:006C  16                   push ss
9:006D  50                   push ax
9:006E  8bfb                 mov di, bx
9:0070  9affff0000           lcall 0, 0xffff  ; USER.MapDialogRect
9:0075  6a42                 push 0x42
9:0077  9a9c17ffff           lcall 0xffff, 0x179c  ; operator_new@s1:179C
9:007C  83c402               add sp, 2
9:007F  8946da               mov word ptr [bp - 0x26], ax
9:0082  8956dc               mov word ptr [bp - 0x24], dx
9:0085  897ed8               mov word ptr [bp - 0x28], di
9:0088  0bd0                 or dx, ax
9:008A  7490                 je 0x1c
9:008C  c45e06               les bx, ptr [bp + 6]
9:008F  26ff7706             push word ptr es:[bx + 6]
9:0093  8bdf                 mov bx, di
9:0095  ffb7645c             push word ptr [bx + 0x5c64]
9:0099  666803010201         push 0x1020103
9:009F  680401               push 0x104
9:00A2  ff76de               push word ptr [bp - 0x22]
9:00A5  ff76e0               push word ptr [bp - 0x20]
9:00A8  6a01                 push 1
9:00AA  ff76dc               push word ptr [bp - 0x24]
9:00AD  50                   push ax
9:00AE  9ad63b6001           lcall 0x160, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:00B3  e969ff               jmp 0x1f
loc_00B6:
9:00B6  666aff               push -1
9:00B9  66ff7606             push dword ptr [bp + 6]
9:00BD  90                   nop
9:00BE  0e                   push cs
9:00BF  e8aa81               call 0xffff826c  ; OPDialog::position@s9:826C
9:00C2  6a48                 push 0x48
9:00C4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:00C9  9aba20ffff           lcall 0xffff, 0x20ba  ; Registry_get@s3:20BA
9:00CE  8ec2                 mov es, dx
9:00D0  8bd8                 mov bx, ax
9:00D2  8946f0               mov word ptr [bp - 0x10], ax
9:00D5  8c46f2               mov word ptr [bp - 0xe], es
9:00D8  268b470a             mov ax, word ptr es:[bx + 0xa]
9:00DC  8946f6               mov word ptr [bp - 0xa], ax
9:00DF  268b470c             mov ax, word ptr es:[bx + 0xc]
9:00E3  8946f4               mov word ptr [bp - 0xc], ax
9:00E6  c45e06               les bx, ptr [bp + 6]
9:00E9  26ff7706             push word ptr es:[bx + 6]
9:00ED  8d46e8               lea ax, [bp - 0x18]
9:00F0  16                   push ss
9:00F1  50                   push ax
9:00F2  9affff0000           lcall 0, 0xffff  ; USER.GetWindowRect
9:00F7  8b46f6               mov ax, word ptr [bp - 0xa]
9:00FA  99                   cdq
9:00FB  2bc2                 sub ax, dx
9:00FD  d1f8                 sar ax, 1
9:00FF  8b4eec               mov cx, word ptr [bp - 0x14]
9:0102  2b4ee8               sub cx, word ptr [bp - 0x18]
9:0105  894ee6               mov word ptr [bp - 0x1a], cx
9:0108  2bc1                 sub ax, cx
9:010A  2d0300               sub ax, 3
9:010D  8946e8               mov word ptr [bp - 0x18], ax
9:0110  0bc0                 or ax, ax
9:0112  7d05                 jge 0x119
9:0114  c746e80000           mov word ptr [bp - 0x18], 0
loc_0119:
9:0119  c45e06               les bx, ptr [bp + 6]
9:011C  26ff7706             push word ptr es:[bx + 6]
9:0120  6a00                 push 0
9:0122  ff76e8               push word ptr [bp - 0x18]
9:0125  ff76ea               push word ptr [bp - 0x16]
9:0128  666a00               push 0
9:012B  6a41                 push 0x41
9:012D  9affff0000           lcall 0, 0xffff  ; USER.SetWindowPos
9:0132  6a17                 push 0x17
9:0134  c45e06               les bx, ptr [bp + 6]
9:0137  26ff7706             push word ptr es:[bx + 6]
9:013B  66ff367c5b           push dword ptr [0x5b7c]
9:0140  9a40afffff           lcall 0xffff, 0xaf40  ; DialogCtr::open@s8:AF40
9:0145  c45e06               les bx, ptr [bp + 6]
9:0148  2689879600           mov word ptr es:[bx + 0x96], ax
9:014D  2689979800           mov word ptr es:[bx + 0x98], dx
9:0152  666801009e00         push 0x9e0001
9:0158  66ff36a002           push dword ptr [0x2a0]
9:015D  9a7c5cffff           lcall 0xffff, 0x5c7c  ; SoundMgr::playVoice@s2:5C7C
9:0162  c45e06               les bx, ptr [bp + 6]
9:0165  2689878c00           mov word ptr es:[bx + 0x8c], ax
9:016A  5e                   pop si
9:016B  5f                   pop di
9:016C  c9                   leave
9:016D  ca0400               retf 4

; ---------------- OrbitalLaunchDlg::onCommand@s9:0170 size=1000 callers=0
;   apis: USER.DestroyWindow, USER.EnableWindow, USER.GetDlgItem, USER.LoadCursor, USER.PostMessage, USER.SendDlgItemMessage, USER.SetCursor
;   (vslot 4) launches an item (SCSelect a planet with the Seed Factory), probes, satellites
9:0170  c8280100             enter 0x128, 0
9:0174  56                   push si
9:0175  c746fe0800           mov word ptr [bp - 2], 8
9:017A  c746fc0000           mov word ptr [bp - 4], 0
9:017F  8b460e               mov ax, word ptr [bp + 0xe]
9:0182  e93503               jmp 0x4ba
9:0185  db 90
loc_0186:
9:0186  666869016a01         push 0x16a0169
9:018C  666803006801         push 0x1680003
9:0192  66ff7606             push dword ptr [bp + 6]
9:0196  90                   nop
9:0197  0e                   push cs
9:0198  e87304               call 0x60e  ; enableDlgItems@s9:060E
9:019B  83c40c               add sp, 0xc
9:019E  c45e06               les bx, ptr [bp + 6]
9:01A1  26ff7706             push word ptr es:[bx + 6]
9:01A5  686b01               push 0x16b
9:01A8  9ae9010000           lcall 0, 0x1e9  ; USER.GetDlgItem
9:01AD  50                   push ax
9:01AE  6a01                 push 1
9:01B0  9af1010000           lcall 0, 0x1f1  ; USER.EnableWindow
9:01B5  33c0                 xor ax, ax
loc_01B7:
9:01B7  c45e06               les bx, ptr [bp + 6]
9:01BA  2689879200           mov word ptr es:[bx + 0x92], ax
loc_01BF:
9:01BF  8946fe               mov word ptr [bp - 2], ax
9:01C2  e91503               jmp 0x4da
9:01C5  db 90
loc_01C6:
9:01C6  666869016a01         push 0x16a0169
9:01CC  666803006701         push 0x1670003
9:01D2  66ff7606             push dword ptr [bp + 6]
9:01D6  90                   nop
9:01D7  0e                   push cs
9:01D8  e83304               call 0x60e  ; enableDlgItems@s9:060E
9:01DB  83c40c               add sp, 0xc
9:01DE  c45e06               les bx, ptr [bp + 6]
9:01E1  26ff7706             push word ptr es:[bx + 6]
9:01E5  686b01               push 0x16b
9:01E8  9a1d020000           lcall 0, 0x21d  ; USER.GetDlgItem
9:01ED  50                   push ax
9:01EE  6a01                 push 1
9:01F0  9a25020000           lcall 0, 0x225  ; USER.EnableWindow
9:01F5  b80100               mov ax, 1
9:01F8  ebbd                 jmp 0x1b7
loc_01FA:
9:01FA  666868016a01         push 0x16a0168
9:0200  666803006701         push 0x1670003
9:0206  66ff7606             push dword ptr [bp + 6]
9:020A  90                   nop
9:020B  0e                   push cs
9:020C  e8ff03               call 0x60e  ; enableDlgItems@s9:060E
9:020F  83c40c               add sp, 0xc
9:0212  c45e06               les bx, ptr [bp + 6]
9:0215  26ff7706             push word ptr es:[bx + 6]
9:0219  686b01               push 0x16b
9:021C  9a51020000           lcall 0, 0x251  ; USER.GetDlgItem
9:0221  50                   push ax
9:0222  6a01                 push 1
9:0224  9a59020000           lcall 0, 0x259  ; USER.EnableWindow
9:0229  b80200               mov ax, 2
9:022C  eb89                 jmp 0x1b7
loc_022E:
9:022E  666868016901         push 0x1690168
9:0234  666803006701         push 0x1670003
9:023A  66ff7606             push dword ptr [bp + 6]
9:023E  90                   nop
9:023F  0e                   push cs
9:0240  e8cb03               call 0x60e  ; enableDlgItems@s9:060E
9:0243  83c40c               add sp, 0xc
9:0246  c45e06               les bx, ptr [bp + 6]
9:0249  26ff7706             push word ptr es:[bx + 6]
9:024D  686b01               push 0x16b
9:0250  9a6f020000           lcall 0, 0x26f  ; USER.GetDlgItem
9:0255  50                   push ax
9:0256  6a01                 push 1
9:0258  9a77020000           lcall 0, 0x277  ; USER.EnableWindow
9:025D  b80300               mov ax, 3
9:0260  e954ff               jmp 0x1b7
9:0263  db 90
loc_0264:
9:0264  c45e06               les bx, ptr [bp + 6]
9:0267  26ff7706             push word ptr es:[bx + 6]
9:026B  686b01               push 0x16b
9:026E  9afb020000           lcall 0, 0x2fb  ; USER.GetDlgItem
9:0273  50                   push ax
9:0274  6a00                 push 0
9:0276  9a03030000           lcall 0, 0x303  ; USER.EnableWindow
9:027B  c45e06               les bx, ptr [bp + 6]
9:027E  2683bf920003         cmp word ptr es:[bx + 0x92], 3
9:0284  740d                 je 0x293
9:0286  68de01               push 0x1de
9:0289  66ff36a002           push dword ptr [0x2a0]
9:028E  9a5c5c3803           lcall 0x338, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
loc_0293:
9:0293  c45e06               les bx, ptr [bp + 6]
9:0296  2683bf920008         cmp word ptr es:[bx + 0x92], 8
9:029C  7431                 je 0x2cf
9:029E  268bb79200           mov si, word ptr es:[bx + 0x92]
9:02A3  8bc6                 mov ax, si
9:02A5  03f6                 add si, si
9:02A7  03f0                 add si, ax
9:02A9  03f6                 add si, si
9:02AB  03f0                 add si, ax
9:02AD  03f6                 add si, si
9:02AF  8b846c5c             mov ax, word ptr [si + 0x5c6c]
9:02B3  8946fc               mov word ptr [bp - 4], ax
9:02B6  ffb4665c             push word ptr [si + 0x5c66]
9:02BA  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:02C0  9a04666a03           lcall 0x36a, 0x6604  ; Orbitals::launchOne@s3:6604
9:02C5  c45e06               les bx, ptr [bp + 6]
9:02C8  26c78792000800       mov word ptr es:[bx + 0x92], 8
loc_02CF:
9:02CF  c746fa0000           mov word ptr [bp - 6], 0
9:02D4  eb03                 jmp 0x2d9
loc_02D6:
9:02D6  ff46fa               inc word ptr [bp - 6]
loc_02D9:
9:02D9  837efa04             cmp word ptr [bp - 6], 4
9:02DD  0f8df901             jge 0x4da
9:02E1  ff76fa               push word ptr [bp - 6]
9:02E4  66ff7606             push dword ptr [bp + 6]
9:02E8  90                   nop
9:02E9  0e                   push cs
9:02EA  e86b02               call 0x558  ; OrbitalLaunchDlg::refresh@s9:0558
9:02ED  ebe7                 jmp 0x2d6
9:02EF  db 90
loc_02F0:
9:02F0  c45e06               les bx, ptr [bp + 6]
9:02F3  26ff7706             push word ptr es:[bx + 6]
9:02F7  686d01               push 0x16d
9:02FA  9a21030000           lcall 0, 0x321  ; USER.GetDlgItem
9:02FF  50                   push ax
9:0300  6a01                 push 1
9:0302  9a29030000           lcall 0, 0x329  ; USER.EnableWindow
9:0307  b80500               mov ax, 5
9:030A  c45e06               les bx, ptr [bp + 6]
9:030D  2689879400           mov word ptr es:[bx + 0x94], ax
9:0312  e9aafe               jmp 0x1bf
9:0315  db 90
loc_0316:
9:0316  c45e06               les bx, ptr [bp + 6]
9:0319  26ff7706             push word ptr es:[bx + 6]
9:031D  686d01               push 0x16d
9:0320  9affff0000           lcall 0, 0xffff  ; USER.GetDlgItem
9:0325  50                   push ax
9:0326  6a00                 push 0
9:0328  9affff0000           lcall 0, 0xffff  ; USER.EnableWindow
9:032D  68de01               push 0x1de
9:0330  66ff36a002           push dword ptr [0x2a0]
9:0335  9a5c5c9f04           lcall 0x49f, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
9:033A  c45e06               les bx, ptr [bp + 6]
9:033D  2683bf940008         cmp word ptr es:[bx + 0x94], 8
9:0343  7431                 je 0x376
9:0345  268bb79400           mov si, word ptr es:[bx + 0x94]
9:034A  8bc6                 mov ax, si
9:034C  03f6                 add si, si
9:034E  03f0                 add si, ax
9:0350  03f6                 add si, si
9:0352  03f0                 add si, ax
9:0354  03f6                 add si, si
9:0356  8b846c5c             mov ax, word ptr [si + 0x5c6c]
9:035A  8946fc               mov word ptr [bp - 4], ax
9:035D  ffb4665c             push word ptr [si + 0x5c66]
9:0361  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:0367  9a04668b03           lcall 0x38b, 0x6604  ; Orbitals::launchOne@s3:6604
9:036C  c45e06               les bx, ptr [bp + 6]
9:036F  26c78794000800       mov word ptr es:[bx + 0x94], 8
loc_0376:
9:0376  6a05                 push 5
9:0378  66ff7606             push dword ptr [bp + 6]
9:037C  90                   nop
9:037D  0e                   push cs
9:037E  e8d701               call 0x558  ; OrbitalLaunchDlg::refresh@s9:0558
9:0381  6a39                 push 0x39
9:0383  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:0388  9aba200a04           lcall 0x40a, 0x20ba  ; Registry_get@s3:20BA
9:038D  8946f6               mov word ptr [bp - 0xa], ax
9:0390  8956f8               mov word ptr [bp - 8], dx
9:0393  c45ef6               les bx, ptr [bp - 0xa]
9:0396  268b4720             mov ax, word ptr es:[bx + 0x20]
9:039A  8946fa               mov word ptr [bp - 6], ax
9:039D  8d46ec               lea ax, [bp - 0x14]
9:03A0  16                   push ss
9:03A1  50                   push ax
9:03A2  8d4eea               lea cx, [bp - 0x16]
9:03A5  16                   push ss
9:03A6  51                   push cx
9:03A7  8b46fa               mov ax, word ptr [bp - 6]
9:03AA  99                   cdq
9:03AB  050000               add ax, 0
9:03AE  81d20002             adc dx, 0x200
9:03B2  8946f2               mov word ptr [bp - 0xe], ax
9:03B5  8956f4               mov word ptr [bp - 0xc], dx
9:03B8  52                   push dx
9:03B9  50                   push ax
9:03BA  66ff364857           push dword ptr [0x5748]  ; g_sim
9:03BF  9a4483cf03           lcall 0x3cf, 0x8344  ; Sim::resolve@s7:8344
9:03C4  8946ee               mov word ptr [bp - 0x12], ax
9:03C7  8956f0               mov word ptr [bp - 0x10], dx
9:03CA  52                   push dx
9:03CB  50                   push ax
9:03CC  9a1a2fe603           lcall 0x3e6, 0x2f1a  ; Planet::mineSiteCount@s7:2F1A
9:03D1  8b46ea               mov ax, word ptr [bp - 0x16]
9:03D4  2b46ec               sub ax, word ptr [bp - 0x14]
9:03D7  99                   cdq
9:03D8  2bc2                 sub ax, dx
9:03DA  d1f8                 sar ax, 1
9:03DC  0146ec               add word ptr [bp - 0x14], ax
9:03DF  66ff76ee             push dword ptr [bp - 0x12]
9:03E3  9aac2f4904           lcall 0x449, 0x2fac  ; Planet::maxDepth@s7:2FAC
9:03E8  8946e8               mov word ptr [bp - 0x18], ax
9:03EB  ff76ec               push word ptr [bp - 0x14]
9:03EE  50                   push ax
9:03EF  c45e06               les bx, ptr [bp + 6]
9:03F2  6626ffb79600         push dword ptr es:[bx + 0x96]
9:03F8  9a8660ffff           lcall 0xffff, 0x6086  ; showProbeDepth@s4:6086
9:03FD  e9da00               jmp 0x4da
loc_0400:
9:0400  6a39                 push 0x39
9:0402  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:0407  9aba200c05           lcall 0x50c, 0x20ba  ; Registry_get@s3:20BA
9:040C  8946e4               mov word ptr [bp - 0x1c], ax
9:040F  8956e6               mov word ptr [bp - 0x1a], dx
9:0412  c45ee4               les bx, ptr [bp - 0x1c]
9:0415  268b4720             mov ax, word ptr es:[bx + 0x20]
9:0419  8946e8               mov word ptr [bp - 0x18], ax
9:041C  666a00               push 0
9:041F  68027f               push 0x7f02
9:0422  9affff0000           lcall 0, 0xffff  ; USER.LoadCursor
9:0427  8946ea               mov word ptr [bp - 0x16], ax
9:042A  50                   push ax
9:042B  9a73040000           lcall 0, 0x473  ; USER.SetCursor
9:0430  8946ec               mov word ptr [bp - 0x14], ax
9:0433  660fbf46e8           movsx eax, word ptr [bp - 0x18]
9:0438  660500000002         add eax, 0x2000000
9:043E  6650                 push eax
9:0440  8d86d8fe             lea ax, [bp - 0x128]
9:0444  16                   push ss
9:0445  50                   push ax
9:0446  9a2e535904           lcall 0x459, 0x532e  ; SCSelect@s7:532E
9:044B  8d86d8fe             lea ax, [bp - 0x128]
9:044F  16                   push ss
9:0450  50                   push ax
9:0451  66ff364857           push dword ptr [0x5748]  ; g_sim
9:0456  9a5a836304           lcall 0x463, 0x835a  ; Sim::enqueue@s7:835A
9:045B  66ff364857           push dword ptr [0x5748]  ; g_sim
9:0460  9a8e836d04           lcall 0x46d, 0x838e  ; Sim::runOneTurn@s7:838E
9:0465  66ff364857           push dword ptr [0x5748]  ; g_sim
9:046A  9a3483ffff           lcall 0xffff, 0x8334  ; Sim::setTurn0@s7:8334
9:046F  ff76ec               push word ptr [bp - 0x14]
9:0472  9affff0000           lcall 0, 0xffff  ; USER.SetCursor
9:0477  ff369603             push word ptr [0x396]
9:047B  66687e001101         push 0x111007e
9:0481  666a00               push 0
9:0484  9affff0000           lcall 0, 0xffff  ; USER.PostMessage
9:0489  c45e06               les bx, ptr [bp + 6]
9:048C  26ff7706             push word ptr es:[bx + 6]
9:0490  9affff0000           lcall 0, 0xffff  ; USER.DestroyWindow
9:0495  c786d8fe9a38         mov word ptr [bp - 0x128], 0x389a
9:049B  c786dafeb100         mov word ptr [bp - 0x126], 0xb1  ; SEGMENT s2:0000
9:04A1  eb37                 jmp 0x4da
9:04A3  db 90
loc_04A4:
9:04A4  66ff760c             push dword ptr [bp + 0xc]
9:04A8  66ff7608             push dword ptr [bp + 8]
9:04AC  ff7606               push word ptr [bp + 6]
9:04AF  90                   nop
9:04B0  0e                   push cs
9:04B1  e88876               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:04B4  5e                   pop si
9:04B5  c9                   leave
9:04B6  ca0a00               retf 0xa
9:04B9  db 90
loc_04BA:
9:04BA  2d6701               sub ax, 0x167
9:04BD  3d0700               cmp ax, 7
9:04C0  77e2                 ja 0x4a4
9:04C2  03c0                 add ax, ax
9:04C4  93                   xchg bx, ax
9:04C5  2effa7ca04           jmp word ptr cs:[bx + 0x4ca]
switch_table_04CA:
    dw loc_0186
    dw loc_01C6
    dw loc_01FA
    dw loc_022E
    dw loc_0264
    dw loc_02F0
    dw loc_0316
    dw loc_0400
loc_04DA:
9:04DA  837efe08             cmp word ptr [bp - 2], 8
9:04DE  7435                 je 0x515
9:04E0  c45e06               les bx, ptr [bp + 6]
9:04E3  26ff7706             push word ptr es:[bx + 6]
9:04E7  8b5efe               mov bx, word ptr [bp - 2]
9:04EA  8bc3                 mov ax, bx
9:04EC  03db                 add bx, bx
9:04EE  03d8                 add bx, ax
9:04F0  03db                 add bx, bx
9:04F2  03d8                 add bx, ax
9:04F4  03db                 add bx, bx
9:04F6  ffb7685c             push word ptr [bx + 0x5c68]
9:04FA  666800000c00         push 0xc0000
9:0500  ffb76a5c             push word ptr [bx + 0x5c6a]
9:0504  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:0509  9a7e84cc00           lcall 0xcc, 0x847e  ; LoadStringRes@s3:847E
9:050E  52                   push dx
9:050F  50                   push ax
9:0510  9affff0000           lcall 0, 0xffff  ; USER.SendDlgItemMessage
loc_0515:
9:0515  837efc00             cmp word ptr [bp - 4], 0
9:0519  7435                 je 0x550
9:051B  6a02                 push 2
9:051D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:0522  9aba20c302           lcall 0x2c3, 0x20ba  ; Registry_get@s3:20BA
9:0527  8986d8fe             mov word ptr [bp - 0x128], ax
9:052B  8996dafe             mov word ptr [bp - 0x126], dx
9:052F  c49ed8fe             les bx, ptr [bp - 0x128]
9:0533  268b4720             mov ax, word ptr es:[bx + 0x20]
9:0537  8946e4               mov word ptr [bp - 0x1c], ax
9:053A  0bc0                 or ax, ax
9:053C  7412                 je 0x550
9:053E  ff369603             push word ptr [0x396]
9:0542  681101               push 0x111
9:0545  ff76fc               push word ptr [bp - 4]
9:0548  666a00               push 0
9:054B  9a85040000           lcall 0, 0x485  ; USER.PostMessage
loc_0550:
9:0550  33c0                 xor ax, ax
9:0552  99                   cdq
9:0553  5e                   pop si
9:0554  c9                   leave
9:0555  ca0a00               retf 0xa

; ---------------- OrbitalLaunchDlg::refresh@s9:0558 FAR size=182 callers=2
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SendDlgItemMessage
;   an item still aboard (or the Seed Factory) can be chosen
9:0558  c8040000             enter 4, 0
9:055C  56                   push si
9:055D  c45e06               les bx, ptr [bp + 6]
9:0560  26ff7706             push word ptr es:[bx + 6]
9:0564  8b760a               mov si, word ptr [bp + 0xa]
9:0567  8bc6                 mov ax, si
9:0569  03f6                 add si, si
9:056B  03f0                 add si, ax
9:056D  03f6                 add si, si
9:056F  03f0                 add si, ax
9:0571  03f6                 add si, si
9:0573  ffb4645c             push word ptr [si + 0x5c64]
9:0577  9aa9010000           lcall 0, 0x1a9  ; USER.GetDlgItem
9:057C  8946fe               mov word ptr [bp - 2], ax
9:057F  ffb4665c             push word ptr [si + 0x5c66]
9:0583  c45e06               les bx, ptr [bp + 6]
9:0586  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:058C  9a9a650006           lcall 0x600, 0x659a  ; Orbitals::aboard@s3:659A
9:0591  0bc0                 or ax, ax
9:0593  7507                 jne 0x59c
9:0595  83bc665c0a           cmp word ptr [si + 0x5c66], 0xa
9:059A  7530                 jne 0x5cc
loc_059C:
9:059C  ff76fe               push word ptr [bp - 2]
9:059F  6a01                 push 1
9:05A1  9ad1050000           lcall 0, 0x5d1  ; USER.EnableWindow
9:05A6  c45e06               les bx, ptr [bp + 6]
9:05A9  26ff7706             push word ptr es:[bx + 6]
9:05AD  8b5e0a               mov bx, word ptr [bp + 0xa]
9:05B0  8bc3                 mov ax, bx
9:05B2  03db                 add bx, bx
9:05B4  03d8                 add bx, ax
9:05B6  03db                 add bx, bx
9:05B8  03d8                 add bx, ax
9:05BA  03db                 add bx, bx
9:05BC  ffb7685c             push word ptr [bx + 0x5c68]
9:05C0  666800000c00         push 0xc0000
9:05C6  684906               push 0x649
9:05C9  eb2d                 jmp 0x5f8
9:05CB  db 90
loc_05CC:
9:05CC  ff76fe               push word ptr [bp - 2]
9:05CF  50                   push ax
9:05D0  9ab1010000           lcall 0, 0x1b1  ; USER.EnableWindow
9:05D5  c45e06               les bx, ptr [bp + 6]
9:05D8  26ff7706             push word ptr es:[bx + 6]
9:05DC  8b5e0a               mov bx, word ptr [bp + 0xa]
9:05DF  8bc3                 mov ax, bx
9:05E1  03db                 add bx, bx
9:05E3  03d8                 add bx, ax
9:05E5  03db                 add bx, bx
9:05E7  03d8                 add bx, ax
9:05E9  03db                 add bx, bx
9:05EB  ffb7685c             push word ptr [bx + 0x5c68]
9:05EF  666800000c00         push 0xc0000
9:05F5  683105               push 0x531
loc_05F8:
9:05F8  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:05FD  9a7e842505           lcall 0x525, 0x847e  ; LoadStringRes@s3:847E
9:0602  52                   push dx
9:0603  50                   push ax
9:0604  9a11050000           lcall 0, 0x511  ; USER.SendDlgItemMessage
9:0609  5e                   pop si
9:060A  c9                   leave
9:060B  ca0600               retf 6

; ---------------- enableDlgItems@s9:060E FAR size=72 callers=1
;   apis: USER.EnableWindow, USER.GetDlgItem
;   EnableWindow on a list of control ids
9:060E  c80c0000             enter 0xc, 0
9:0612  8d460c               lea ax, [bp + 0xc]
9:0615  8946fa               mov word ptr [bp - 6], ax
9:0618  8c56fc               mov word ptr [bp - 4], ss
9:061B  8b460a               mov ax, word ptr [bp + 0xa]
9:061E  8946f8               mov word ptr [bp - 8], ax
9:0621  eb20                 jmp 0x643
9:0623  db 90
loc_0624:
9:0624  c45efa               les bx, ptr [bp - 6]
9:0627  8346fa02             add word ptr [bp - 6], 2
9:062B  268b07               mov ax, word ptr es:[bx]
9:062E  c45e06               les bx, ptr [bp + 6]
9:0631  26ff7706             push word ptr es:[bx + 6]
9:0635  50                   push ax
9:0636  9a78050000           lcall 0, 0x578  ; USER.GetDlgItem
9:063B  50                   push ax
9:063C  6a00                 push 0
9:063E  9aa2050000           lcall 0, 0x5a2  ; USER.EnableWindow
loc_0643:
9:0643  8b46f8               mov ax, word ptr [bp - 8]
9:0646  ff4ef8               dec word ptr [bp - 8]
9:0649  0bc0                 or ax, ax
9:064B  75d7                 jne 0x624
9:064D  8946fc               mov word ptr [bp - 4], ax
9:0650  8946fa               mov word ptr [bp - 6], ax
9:0653  c9                   leave
9:0654  cb                   retf
9:0655  db 00

; ---------------- OrbitalLaunchDlg::scalar_dtor@s9:0656 FAR size=146 callers=0
;   deleting destructor
9:0656  55                   push bp
9:0657  8bec                 mov bp, sp
9:0659  66ff7606             push dword ptr [bp + 6]
9:065D  9a3aef4301           lcall 0x143, 0xef3a  ; OrbitalLaunchDlg::~OrbitalLaunchDlg@s8:EF3A
9:0662  f6460a01             test byte ptr [bp + 0xa], 1
9:0666  7409                 je 0x671
9:0668  66ff7606             push dword ptr [bp + 6]
9:066C  9ace177a00           lcall 0x7a, 0x17ce  ; operator_delete@s1:17CE
loc_0671:
9:0671  8b4606               mov ax, word ptr [bp + 6]
9:0674  8b5608               mov dx, word ptr [bp + 8]
9:0677  c9                   leave
9:0678  ca0600               retf 6
9:067B  db 90 56 06 86 06 10 3a 91 02 00 00 8a 06 c0 79 8e
9:068B  db 06 70 01 92 06 98 7b 96 06 56 7f 9a 06 b2 7b 9e
9:069B  db 06 1c 7f a2 06 12 82 a6 06 86 7f aa 06 0c 80 ae
9:06AB  db 06 54 80 b2 06 5e 7e b6 06 58 81 ba 06 b6 81 be
9:06BB  db 06 fe 81 c6 06 ea 60 d2 06 4a 82 ca 06 66 82 ce
9:06CB  db 06 de 78 e6 06 ee 60 d6 06 f4 60 da 06 fa 60 e2
9:06DB  db 06 a4 a2 60 06 fe 60 fb 03 7e 80 ff ff

; ---------------- MainMenuDlg::MainMenuDlg@s9:06E8 FAR size=82 callers=1
;   dialog 4028 "Program Control" (vtable 0B90)
9:06E8  55                   push bp
9:06E9  8bec                 mov bp, sp
9:06EB  ff7612               push word ptr [bp + 0x12]
9:06EE  68bc0f               push 0xfbc
9:06F1  66ff760a             push dword ptr [bp + 0xa]
9:06F5  6a01                 push 1
9:06F7  66ff7606             push dword ptr [bp + 6]
9:06FB  90                   nop
9:06FC  0e                   push cs
9:06FD  e82870               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:0700  c45e06               les bx, ptr [bp + 6]
9:0703  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
9:070D  26c707900b           mov word ptr es:[bx], 0xb90
9:0712  26c747027e06         mov word ptr es:[bx + 2], 0x67e  ; SEGMENT s9:0000
9:0718  6a07                 push 7
9:071A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:071F  9aba208f05           lcall 0x58f, 0x20ba  ; Registry_get@s3:20BA
9:0724  c45e06               les bx, ptr [bp + 6]
9:0727  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:072C  2689979000           mov word ptr es:[bx + 0x90], dx
9:0731  8bc3                 mov ax, bx
9:0733  8cc2                 mov dx, es
9:0735  c9                   leave
9:0736  ca0e00               retf 0xe
9:0739  db 00

; ---------------- MainMenuDlg::~MainMenuDlg@s9:073A FAR size=44 callers=1
;   dtor
9:073A  55                   push bp
9:073B  8bec                 mov bp, sp
9:073D  c45e06               les bx, ptr [bp + 6]
9:0740  26c707900b           mov word ptr es:[bx], 0xb90
9:0745  26c747021607         mov word ptr es:[bx + 2], 0x716  ; SEGMENT s9:0000
9:074B  26ff7706             push word ptr es:[bx + 6]
9:074F  66ff367c5b           push dword ptr [0x5b7c]
9:0754  9ae0b6de06           lcall 0x6de, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:0759  66ff7606             push dword ptr [bp + 6]
9:075D  90                   nop
9:075E  0e                   push cs
9:075F  e8ca70               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:0762  c9                   leave
9:0763  ca0400               retf 4

; ---------------- MainMenuDlg::init@s9:0766 size=118 callers=0
;   apis: USER.ShowWindow
;   (vslot 2) shows it, movies back on
9:0766  c8200000             enter 0x20, 0
9:076A  66ff7606             push dword ptr [bp + 6]
9:076E  90                   nop
9:076F  0e                   push cs
9:0770  e86f71               call 0x78e2  ; OPDialog::create@s9:78E2
9:0773  6a02                 push 2
9:0775  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:077A  9aba208a07           lcall 0x78a, 0x20ba  ; Registry_get@s3:20BA
9:077F  8946fc               mov word ptr [bp - 4], ax
9:0782  8956fe               mov word ptr [bp - 2], dx
9:0785  52                   push dx
9:0786  50                   push ax
9:0787  9a1861a007           lcall 0x7a0, 0x6118  ; Options::resumeMovies@s3:6118
9:078C  8d46fa               lea ax, [bp - 6]
9:078F  16                   push ss
9:0790  50                   push ax
9:0791  8d46f8               lea ax, [bp - 8]
9:0794  16                   push ss
9:0795  50                   push ax
9:0796  6a48                 push 0x48
9:0798  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:079D  9aba202207           lcall 0x722, 0x20ba  ; Registry_get@s3:20BA
9:07A2  8946f4               mov word ptr [bp - 0xc], ax
9:07A5  8956f6               mov word ptr [bp - 0xa], dx
9:07A8  050e00               add ax, 0xe
9:07AB  52                   push dx
9:07AC  50                   push ax
9:07AD  9a943e8206           lcall 0x682, 0x3e94  ; Pos3::getXY@s2:3E94
9:07B2  8b46fa               mov ax, word ptr [bp - 6]
9:07B5  05b900               add ax, 0xb9
9:07B8  50                   push ax
9:07B9  8b46f8               mov ax, word ptr [bp - 8]
9:07BC  058c00               add ax, 0x8c
9:07BF  50                   push ax
9:07C0  66ff7606             push dword ptr [bp + 6]
9:07C4  90                   nop
9:07C5  0e                   push cs
9:07C6  e8a37a               call 0x826c  ; OPDialog::position@s9:826C
9:07C9  c45e06               les bx, ptr [bp + 6]
9:07CC  26ff7706             push word ptr es:[bx + 6]
9:07D0  6a05                 push 5
9:07D2  9affff0000           lcall 0, 0xffff  ; USER.ShowWindow
9:07D7  c9                   leave
9:07D8  ca0400               retf 4
9:07DB  db 00

; ---------------- MainMenuDlg::onCommand@s9:07DC FAR size=574 callers=0
;   apis: USER.MessageBox, USER.PostMessage, USER.SetFocus
;   (vslot 4) New Game (mission brief), Introduction, Load, Preferences, Exit
9:07DC  c80e0800             enter 0x80e, 0
9:07E0  66c746fc00000000     mov dword ptr [bp - 4], 0
9:07E8  8b460e               mov ax, word ptr [bp + 0xe]
9:07EB  3d7300               cmp ax, 0x73
9:07EE  0f84da00             je 0x8cc
9:07F2  0f87f201             ja 0x9e8
9:07F6  3d6e00               cmp ax, 0x6e
9:07F9  0f846d01             je 0x96a
9:07FD  0f87f801             ja 0x9f9
9:0801  2c02                 sub al, 2
9:0803  0f84ad01             je 0x9b4
9:0807  2c62                 sub al, 0x62
9:0809  0f85ec01             jne 0x9f9
9:080D  ff369603             push word ptr [0x396]
9:0811  666864001101         push 0x1110064
9:0817  666a00               push 0
9:081A  9a93080000           lcall 0, 0x893  ; USER.PostMessage
9:081F  6a00                 push 0
loc_0821:
9:0821  66ff7606             push dword ptr [bp + 6]
9:0825  90                   nop
9:0826  0e                   push cs
9:0827  e8a202               call 0xacc  ; MainMenuDlg::enableButtons@s9:0ACC
9:082A  e9e201               jmp 0xa0f
9:082D  db 90
loc_082E:
9:082E  6a00                 push 0
9:0830  66ff7606             push dword ptr [bp + 6]
9:0834  90                   nop
9:0835  0e                   push cs
9:0836  e89302               call 0xacc  ; MainMenuDlg::enableButtons@s9:0ACC
9:0839  685607               push 0x756
9:083C  8d86fcfb             lea ax, [bp - 0x404]
9:0840  16                   push ss
9:0841  50                   push ax
9:0842  68ff03               push 0x3ff
9:0845  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:084A  9ae0846308           lcall 0x863, 0x84e0  ; LoadStringTo@s3:84E0
9:084F  685707               push 0x757
9:0852  8d86fcf7             lea ax, [bp - 0x804]
9:0856  16                   push ss
9:0857  50                   push ax
9:0858  68ff03               push 0x3ff
9:085B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:0860  9ae084b608           lcall 0x8b6, 0x84e0  ; LoadStringTo@s3:84E0
9:0865  ff369603             push word ptr [0x396]
9:0869  8d86fcf7             lea ax, [bp - 0x804]
9:086D  16                   push ss
9:086E  50                   push ax
9:086F  8d86fcfb             lea ax, [bp - 0x404]
9:0873  16                   push ss
9:0874  50                   push ax
9:0875  6a34                 push 0x34
9:0877  9a18090000           lcall 0, 0x918  ; USER.MessageBox
9:087C  8986faf7             mov word ptr [bp - 0x806], ax
9:0880  3d0600               cmp ax, 6
9:0883  7542                 jne 0x8c7
9:0885  ff369603             push word ptr [0x396]
9:0889  66687a001101         push 0x111007a
9:088F  666a00               push 0
9:0892  9a4e090000           lcall 0, 0x94e  ; USER.PostMessage
9:0897  6a01                 push 1
9:0899  66ff760a             push dword ptr [bp + 0xa]
9:089D  66ff7606             push dword ptr [bp + 6]
9:08A1  90                   nop
9:08A2  0e                   push cs
9:08A3  e89672               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:08A6  8946fc               mov word ptr [bp - 4], ax
9:08A9  8956fe               mov word ptr [bp - 2], dx
9:08AC  6a02                 push 2
9:08AE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:08B3  9aba20c508           lcall 0x8c5, 0x20ba  ; Registry_get@s3:20BA
9:08B8  8986f6f7             mov word ptr [bp - 0x80a], ax
9:08BC  8996f8f7             mov word ptr [bp - 0x808], dx
9:08C0  52                   push dx
9:08C1  50                   push ax
9:08C2  9afa600409           lcall 0x904, 0x60fa  ; Options::suspendMovies@s3:60FA
loc_08C7:
9:08C7  6a01                 push 1
9:08C9  e955ff               jmp 0x821
loc_08CC:
9:08CC  6a00                 push 0
9:08CE  66ff7606             push dword ptr [bp + 6]
9:08D2  90                   nop
9:08D3  0e                   push cs
9:08D4  e8f501               call 0xacc  ; MainMenuDlg::enableButtons@s9:0ACC
9:08D7  6668d1070000         push 0x7d1
9:08DD  68d007               push 0x7d0
9:08E0  9ad85fb007           lcall 0x7b0, 0x5fd8  ; joinResourceStrings@s2:5FD8
9:08E5  83c406               add sp, 6
9:08E8  8986f6f7             mov word ptr [bp - 0x80a], ax
9:08EC  8996f8f7             mov word ptr [bp - 0x808], dx
9:08F0  68cf07               push 0x7cf
9:08F3  8d86fcf7             lea ax, [bp - 0x804]
9:08F7  16                   push ss
9:08F8  50                   push ax
9:08F9  68ff03               push 0x3ff
9:08FC  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:0901  9ae0847d07           lcall 0x77d, 0x84e0  ; LoadStringTo@s3:84E0
9:0906  ff369603             push word ptr [0x396]
9:090A  66ffb6f6f7           push dword ptr [bp - 0x80a]
9:090F  8d86fcf7             lea ax, [bp - 0x804]
9:0913  16                   push ss
9:0914  50                   push ax
9:0915  6a34                 push 0x34
9:0917  9affff0000           lcall 0, 0xffff  ; USER.MessageBox
9:091C  8986faf7             mov word ptr [bp - 0x806], ax
9:0920  668b86f6f7           mov eax, dword ptr [bp - 0x80a]
9:0925  668986f2f7           mov dword ptr [bp - 0x80e], eax
9:092A  668986fcfb           mov dword ptr [bp - 0x404], eax
9:092F  6650                 push eax
9:0931  9ace176f06           lcall 0x66f, 0x17ce  ; operator_delete@s1:17CE
9:0936  83c404               add sp, 4
9:0939  83befaf706           cmp word ptr [bp - 0x806], 6
9:093E  7587                 jne 0x8c7
9:0940  ff369603             push word ptr [0x396]
9:0944  6668cb001101         push 0x11100cb
9:094A  666a00               push 0
9:094D  9ad3090000           lcall 0, 0x9d3  ; USER.PostMessage
9:0952  6a01                 push 1
9:0954  66ff760a             push dword ptr [bp + 0xa]
9:0958  66ff7606             push dword ptr [bp + 6]
9:095C  90                   nop
9:095D  0e                   push cs
9:095E  e8db71               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:0961  8946fc               mov word ptr [bp - 4], ax
9:0964  8956fe               mov word ptr [bp - 2], dx
9:0967  e95dff               jmp 0x8c7
loc_096A:
9:096A  c41e7c5b             les bx, ptr [0x5b7c]
9:096E  26c787ae009900       mov word ptr es:[bx + 0xae], 0x99
9:0975  6a02                 push 2
9:0977  c45e06               les bx, ptr [bp + 6]
9:097A  26ff7706             push word ptr es:[bx + 6]
9:097E  66ff367c5b           push dword ptr [0x5b7c]
9:0983  9a40af5707           lcall 0x757, 0xaf40  ; DialogCtr::open@s8:AF40
9:0988  8986f6f7             mov word ptr [bp - 0x80a], ax
9:098C  8996f8f7             mov word ptr [bp - 0x808], dx
9:0990  52                   push dx
9:0991  c49ef6f7             les bx, ptr [bp - 0x80a]
9:0995  50                   push ax
9:0996  26c41f               les bx, ptr es:[bx]
9:0999  26ff5f3c             lcall es:[bx + 0x3c]
9:099D  c45e06               les bx, ptr [bp + 6]
9:09A0  26ff7706             push word ptr es:[bx + 6]
9:09A4  9affff0000           lcall 0, 0xffff  ; USER.SetFocus
loc_09A9:
9:09A9  66c746fc01000000     mov dword ptr [bp - 4], 1
9:09B1  eb5c                 jmp 0xa0f
9:09B3  db 90
loc_09B4:
9:09B4  666800000200         push 0x20000
9:09BA  6a00                 push 0
9:09BC  66ff7606             push dword ptr [bp + 6]
9:09C0  90                   nop
9:09C1  0e                   push cs
9:09C2  e87771               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:09C5  ff369603             push word ptr [0x396]
9:09C9  6668ee001101         push 0x11100ee
9:09CF  666a00               push 0
9:09D2  9a4c050000           lcall 0, 0x54c  ; USER.PostMessage
9:09D7  ebd0                 jmp 0x9a9
9:09D9  db 90
loc_09DA:
9:09DA  6a01                 push 1
9:09DC  66ff7606             push dword ptr [bp + 6]
9:09E0  90                   nop
9:09E1  0e                   push cs
9:09E2  e8e700               call 0xacc  ; MainMenuDlg::enableButtons@s9:0ACC
9:09E5  ebc2                 jmp 0x9a9
9:09E7  db 90
loc_09E8:
9:09E8  2d7400               sub ax, 0x74
9:09EB  0f843ffe             je 0x82e
9:09EF  2d7a00               sub ax, 0x7a
9:09F2  74c0                 je 0x9b4
9:09F4  2d4f00               sub ax, 0x4f
9:09F7  74e1                 je 0x9da
loc_09F9:
9:09F9  66ff760c             push dword ptr [bp + 0xc]
9:09FD  66ff7608             push dword ptr [bp + 8]
9:0A01  ff7606               push word ptr [bp + 6]
9:0A04  90                   nop
9:0A05  0e                   push cs
9:0A06  e83371               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:0A09  8946fc               mov word ptr [bp - 4], ax
9:0A0C  8956fe               mov word ptr [bp - 2], dx
loc_0A0F:
9:0A0F  8b46fc               mov ax, word ptr [bp - 4]
9:0A12  8b56fe               mov dx, word ptr [bp - 2]
9:0A15  c9                   leave
9:0A16  ca0a00               retf 0xa
9:0A19  db 00

; ---------------- MainMenuDlg::loadBackground@s9:0A1A FAR size=178 callers=0
;   (vslot 26) the dialog picture
9:0A1A  c8180000             enter 0x18, 0
9:0A1E  56                   push si
9:0A1F  c45e06               les bx, ptr [bp + 6]
9:0A22  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:0A27  66268b470a           mov eax, dword ptr es:[bx + 0xa]
9:0A2C  268b570c             mov dx, word ptr es:[bx + 0xc]
9:0A30  668946fc             mov dword ptr [bp - 4], eax
9:0A34  8bc2                 mov ax, dx
9:0A36  0b46fc               or ax, word ptr [bp - 4]
9:0A39  7509                 jne 0xa44
9:0A3B  33c0                 xor ax, ax
9:0A3D  99                   cdq
9:0A3E  5e                   pop si
9:0A3F  c9                   leave
9:0A40  ca0600               retf 6
9:0A43  db 90
loc_0A44:
9:0A44  52                   push dx
9:0A45  c45efc               les bx, ptr [bp - 4]
9:0A48  53                   push bx
9:0A49  26c41f               les bx, ptr es:[bx]
9:0A4C  26ff5f14             lcall es:[bx + 0x14]
9:0A50  8946f8               mov word ptr [bp - 8], ax
9:0A53  8956fa               mov word ptr [bp - 6], dx
9:0A56  c45e06               les bx, ptr [bp + 6]
9:0A59  6626837f7000         cmp dword ptr es:[bx + 0x70], 0
9:0A5F  741f                 je 0xa80
9:0A61  268b4770             mov ax, word ptr es:[bx + 0x70]
9:0A65  268b5772             mov dx, word ptr es:[bx + 0x72]
9:0A69  8956ea               mov word ptr [bp - 0x16], dx
9:0A6C  8bda                 mov bx, dx
9:0A6E  0bd0                 or dx, ax
9:0A70  740e                 je 0xa80
9:0A72  6a01                 push 1
9:0A74  53                   push bx
9:0A75  50                   push ax
9:0A76  8ec3                 mov es, bx
9:0A78  8bf0                 mov si, ax
9:0A7A  26c41c               les bx, ptr es:[si]
9:0A7D  26ff1f               lcall es:[bx]
loc_0A80:
9:0A80  6a14                 push 0x14
9:0A82  9a9c173409           lcall 0x934, 0x179c  ; operator_new@s1:179C
9:0A87  83c402               add sp, 2
9:0A8A  8956ea               mov word ptr [bp - 0x16], dx
9:0A8D  0bd0                 or dx, ax
9:0A8F  740b                 je 0xa9c
9:0A91  ff76ea               push word ptr [bp - 0x16]
9:0A94  50                   push ax
9:0A95  9a584cb90a           lcall 0xab9, 0x4c58  ; MemBlock::MemBlock@s2:4C58
9:0A9A  eb03                 jmp 0xa9f
loc_0A9C:
9:0A9C  33c0                 xor ax, ax
9:0A9E  99                   cdq
loc_0A9F:
9:0A9F  c45e06               les bx, ptr [bp + 6]
9:0AA2  26894770             mov word ptr es:[bx + 0x70], ax
9:0AA6  26895772             mov word ptr es:[bx + 0x72], dx
9:0AAA  66ff76f8             push dword ptr [bp - 8]
9:0AAE  c45e06               les bx, ptr [bp + 6]
9:0AB1  6626ff7770           push dword ptr es:[bx + 0x70]
9:0AB6  9a844de308           lcall 0x8e3, 0x4d84  ; MemBlock::copyFrom@s2:4D84
9:0ABB  c45e06               les bx, ptr [bp + 6]
9:0ABE  268b4770             mov ax, word ptr es:[bx + 0x70]
9:0AC2  268b5772             mov dx, word ptr es:[bx + 0x72]
9:0AC6  5e                   pop si
9:0AC7  c9                   leave
9:0AC8  ca0600               retf 6
9:0ACB  db 00

; ---------------- MainMenuDlg::enableButtons@s9:0ACC FAR size=158 callers=1
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.IsWindow
;   buttons by state
9:0ACC  c8020000             enter 2, 0
9:0AD0  c45e06               les bx, ptr [bp + 6]
9:0AD3  26ff7706             push word ptr es:[bx + 6]
9:0AD7  9af50a0000           lcall 0, 0xaf5  ; USER.IsWindow
9:0ADC  0bc0                 or ax, ax
9:0ADE  0f848300             je 0xb65
9:0AE2  c45e06               les bx, ptr [bp + 6]
9:0AE5  26ff7706             push word ptr es:[bx + 6]
9:0AE9  6a64                 push 0x64
9:0AEB  9a120b0000           lcall 0, 0xb12  ; USER.GetDlgItem
9:0AF0  8946fe               mov word ptr [bp - 2], ax
9:0AF3  50                   push ax
9:0AF4  9affff0000           lcall 0, 0xffff  ; USER.IsWindow
9:0AF9  0bc0                 or ax, ax
9:0AFB  7468                 je 0xb65
9:0AFD  ff76fe               push word ptr [bp - 2]
9:0B00  ff760a               push word ptr [bp + 0xa]
9:0B03  9a1b0b0000           lcall 0, 0xb1b  ; USER.EnableWindow
9:0B08  c45e06               les bx, ptr [bp + 6]
9:0B0B  26ff7706             push word ptr es:[bx + 6]
9:0B0F  6a74                 push 0x74
9:0B11  9a290b0000           lcall 0, 0xb29  ; USER.GetDlgItem
9:0B16  50                   push ax
9:0B17  ff760a               push word ptr [bp + 0xa]
9:0B1A  9a320b0000           lcall 0, 0xb32  ; USER.EnableWindow
9:0B1F  c45e06               les bx, ptr [bp + 6]
9:0B22  26ff7706             push word ptr es:[bx + 6]
9:0B26  6a73                 push 0x73  ; 'New failed in Op::Op->DialogHandler'
9:0B28  9a400b0000           lcall 0, 0xb40  ; USER.GetDlgItem
9:0B2D  50                   push ax
9:0B2E  ff760a               push word ptr [bp + 0xa]
9:0B31  9a490b0000           lcall 0, 0xb49  ; USER.EnableWindow
9:0B36  c45e06               les bx, ptr [bp + 6]
9:0B39  26ff7706             push word ptr es:[bx + 6]
9:0B3D  6a6e                 push 0x6e
9:0B3F  9a580b0000           lcall 0, 0xb58  ; USER.GetDlgItem
9:0B44  50                   push ax
9:0B45  ff760a               push word ptr [bp + 0xa]
9:0B48  9a610b0000           lcall 0, 0xb61  ; USER.EnableWindow
9:0B4D  c45e06               les bx, ptr [bp + 6]
9:0B50  26ff7706             push word ptr es:[bx + 6]
9:0B54  68ee00               push 0xee
9:0B57  9a37060000           lcall 0, 0x637  ; USER.GetDlgItem
9:0B5C  50                   push ax
9:0B5D  ff760a               push word ptr [bp + 0xa]
9:0B60  9a3f060000           lcall 0, 0x63f  ; USER.EnableWindow
loc_0B65:
9:0B65  c9                   leave
9:0B66  ca0600               retf 6
9:0B69  db 00

; ---------------- MainMenuDlg::scalar_dtor@s9:0B6A FAR size=146 callers=0
;   deleting destructor
9:0B6A  55                   push bp
9:0B6B  8bec                 mov bp, sp
9:0B6D  66ff7606             push dword ptr [bp + 6]
9:0B71  90                   nop
9:0B72  0e                   push cs
9:0B73  e8c4fb               call 0x73a  ; MainMenuDlg::~MainMenuDlg@s9:073A
9:0B76  f6460a01             test byte ptr [bp + 0xa], 1
9:0B7A  7409                 je 0xb85
9:0B7C  66ff7606             push dword ptr [bp + 6]
9:0B80  9ace17850a           lcall 0xa85, 0x17ce  ; operator_delete@s1:17CE
loc_0B85:
9:0B85  8b4606               mov ax, word ptr [bp + 6]
9:0B88  8b5608               mov dx, word ptr [bp + 8]
9:0B8B  c9                   leave
9:0B8C  ca0600               retf 6
9:0B8F  db 90 6a 0b 9a 0b 10 3a 98 0a 66 07 9e 0b c0 79 a2
9:0B9F  db 0b dc 07 a6 0b 98 7b aa 0b 56 7f ae 0b b2 7b b2
9:0BAF  db 0b 1c 7f b6 0b 12 82 ba 0b 86 7f be 0b 0c 80 c2
9:0BBF  db 0b 54 80 c6 0b 5e 7e ca 0b 58 81 ce 0b b6 81 d2
9:0BCF  db 0b fe 81 da 0b ea 60 e6 0b 4a 82 de 0b 66 82 e2
9:0BDF  db 0b de 78 fa 0b ee 60 ea 0b f4 60 ee 0b fa 60 f6
9:0BEF  db 0b a4 a2 86 09 fe 60 c2 06 1a 0a 49 07

; ---------------- PlanetPickDlg::PlanetPickDlg@s9:0BFC FAR size=88 callers=1
;   dialog 4045 "Star System:" opened as a window (vtable 0DB0)
9:0BFC  55                   push bp
9:0BFD  8bec                 mov bp, sp
9:0BFF  ff7612               push word ptr [bp + 0x12]
9:0C02  68cd0f               push 0xfcd
9:0C05  66ff760a             push dword ptr [bp + 0xa]
9:0C09  6a01                 push 1
9:0C0B  66ff7606             push dword ptr [bp + 6]
9:0C0F  90                   nop
9:0C10  0e                   push cs
9:0C11  e8146b               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:0C14  c45e06               les bx, ptr [bp + 6]
9:0C17  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
9:0C21  26c707b00d           mov word ptr es:[bx], 0xdb0
9:0C26  26c74702920b         mov word ptr es:[bx + 2], 0xb92  ; SEGMENT s9:0000
9:0C2C  6a39                 push 0x39
9:0C2E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:0C33  9aba204d08           lcall 0x84d, 0x20ba  ; Registry_get@s3:20BA
9:0C38  c45e06               les bx, ptr [bp + 6]
9:0C3B  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:0C40  2689979000           mov word ptr es:[bx + 0x90], dx
9:0C45  26c747740100         mov word ptr es:[bx + 0x74], 1
9:0C4B  8bc3                 mov ax, bx
9:0C4D  8cc2                 mov dx, es
9:0C4F  c9                   leave
9:0C50  ca0e00               retf 0xe
9:0C53  db 00

; ---------------- PlanetPickDlg::~PlanetPickDlg@s9:0C54 FAR size=40 callers=1
;   dtor
9:0C54  55                   push bp
9:0C55  8bec                 mov bp, sp
9:0C57  c45e06               les bx, ptr [bp + 6]
9:0C5A  26c707b00d           mov word ptr es:[bx], 0xdb0
9:0C5F  26c747022a0c         mov word ptr es:[bx + 2], 0xc2a  ; SEGMENT s9:0000
9:0C65  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
9:0C6F  66ff7606             push dword ptr [bp + 6]
9:0C73  90                   nop
9:0C74  0e                   push cs
9:0C75  e8b46b               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:0C78  c9                   leave
9:0C79  ca0400               retf 4

; ---------------- PlanetPickDlg::init@s9:0C7C size=68 callers=0
;   apis: USER.ShowWindow
;   (vslot 2) sized to the planet grid
9:0C7C  c8040000             enter 4, 0
9:0C80  66ff7606             push dword ptr [bp + 6]
9:0C84  90                   nop
9:0C85  0e                   push cs
9:0C86  e8596c               call 0x78e2  ; OPDialog::create@s9:78E2
9:0C89  8d46fe               lea ax, [bp - 2]
9:0C8C  16                   push ss
9:0C8D  50                   push ax
9:0C8E  8d4efc               lea cx, [bp - 4]
9:0C91  16                   push ss
9:0C92  51                   push cx
9:0C93  c45e06               les bx, ptr [bp + 6]
9:0C96  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:0C9C  9a304f360c           lcall 0xc36, 0x4f30  ; PlanetPicker::gridSize@s3:4F30
9:0CA1  66ff76fc             push dword ptr [bp - 4]
9:0CA5  66ff7606             push dword ptr [bp + 6]
9:0CA9  90                   nop
9:0CAA  0e                   push cs
9:0CAB  e8be75               call 0x826c  ; OPDialog::position@s9:826C
9:0CAE  c45e06               les bx, ptr [bp + 6]
9:0CB1  26ff7706             push word ptr es:[bx + 6]
9:0CB5  6a05                 push 5
9:0CB7  9ad3070000           lcall 0, 0x7d3  ; USER.ShowWindow
9:0CBC  c9                   leave
9:0CBD  ca0400               retf 4

; ---------------- PlanetPickDlg::onCtlColor@s9:0CC0 size=158 callers=0
;   apis: GDI.GetStockObject, GDI.SetBkColor, GDI.SetTextColor
;   (vslot 13)
9:0CC0  c80a0000             enter 0xa, 0
9:0CC4  6a04                 push 4
9:0CC6  9a330d0000           lcall 0, 0xd33  ; GDI.GetStockObject
9:0CCB  8946fe               mov word ptr [bp - 2], ax
9:0CCE  66833ed05c00         cmp dword ptr [0x5cd0], 0
9:0CD4  753e                 jne 0xd14
9:0CD6  c45e06               les bx, ptr [bp + 6]
9:0CD9  26ff776e             push word ptr es:[bx + 0x6e]
9:0CDD  06                   push es
9:0CDE  53                   push bx
9:0CDF  26c41f               les bx, ptr es:[bx]
9:0CE2  26ff5f68             lcall es:[bx + 0x68]
9:0CE6  52                   push dx
9:0CE7  50                   push ax
9:0CE8  9a724d960b           lcall 0xb96, 0x4d72  ; MemBlock::data@s2:4D72
9:0CED  8946f6               mov word ptr [bp - 0xa], ax
9:0CF0  8956f8               mov word ptr [bp - 8], dx
9:0CF3  c45ef6               les bx, ptr [bp - 0xa]
9:0CF6  2ac0                 sub al, al
9:0CF8  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:0CFD  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:0D02  2aed                 sub ch, ch
9:0D04  0bc1                 or ax, cx
9:0D06  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:0D0B  b502                 mov ch, 2
9:0D0D  a3d05c               mov word ptr [0x5cd0], ax
9:0D10  890ed25c             mov word ptr [0x5cd2], cx
loc_0D14:
9:0D14  8b460c               mov ax, word ptr [bp + 0xc]
9:0D17  2d0300               sub ax, 3
9:0D1A  761e                 jbe 0xd3a
9:0D1C  48                   dec ax
9:0D1D  7411                 je 0xd30
9:0D1F  2d0100               sub ax, 1
9:0D22  7205                 jb 0xd29
9:0D24  2d0100               sub ax, 1
9:0D27  7611                 jbe 0xd3a
loc_0D29:
9:0D29  33c0                 xor ax, ax
9:0D2B  99                   cdq
9:0D2C  c9                   leave
9:0D2D  ca0a00               retf 0xa
loc_0D30:
9:0D30  6a05                 push 5
9:0D32  9affff0000           lcall 0, 0xffff  ; GDI.GetStockObject
9:0D37  8946fe               mov word ptr [bp - 2], ax
loc_0D3A:
9:0D3A  ff760e               push word ptr [bp + 0xe]
9:0D3D  66ff36d05c           push dword ptr [0x5cd0]
9:0D42  9affff0000           lcall 0, 0xffff  ; GDI.SetTextColor
9:0D47  ff760e               push word ptr [bp + 0xe]
9:0D4A  666800000001         push 0x1000000
9:0D50  9affff0000           lcall 0, 0xffff  ; GDI.SetBkColor
9:0D55  8b46fe               mov ax, word ptr [bp - 2]
9:0D58  8cda                 mov dx, ds
9:0D5A  c9                   leave
9:0D5B  ca0a00               retf 0xa

; ---------------- PlanetPickDlg::close@s9:0D5E FAR size=34 callers=0
;   apis: USER.PostMessage
;   (vslot 5) posts command 1
9:0D5E  55                   push bp
9:0D5F  8bec                 mov bp, sp
9:0D61  837e0a00             cmp word ptr [bp + 0xa], 0
9:0D65  7415                 je 0xd7c
9:0D67  c45e06               les bx, ptr [bp + 6]
9:0D6A  26ff7708             push word ptr es:[bx + 8]
9:0D6E  666801001101         push 0x1110001
9:0D74  666a00               push 0
9:0D77  9a1b080000           lcall 0, 0x81b  ; USER.PostMessage
loc_0D7C:
9:0D7C  c9                   leave
9:0D7D  ca0600               retf 6

; ---------------- PlanetPickDlg::returnTrue@s9:0D80 FAR size=6 callers=0
;   virtual returning 1
9:0D80  b80100               mov ax, 1
9:0D83  ca0600               retf 6

; ---------------- PlanetPickDlg::nop@s9:0D86 FAR size=4 callers=0
;   empty virtual
9:0D86  ca0400               retf 4
9:0D89  db 00

; ---------------- PlanetPickDlg::scalar_dtor@s9:0D8A FAR size=146 callers=0
;   deleting destructor
9:0D8A  55                   push bp
9:0D8B  8bec                 mov bp, sp
9:0D8D  66ff7606             push dword ptr [bp + 6]
9:0D91  90                   nop
9:0D92  0e                   push cs
9:0D93  e8befe               call 0xc54  ; PlanetPickDlg::~PlanetPickDlg@s9:0C54
9:0D96  f6460a01             test byte ptr [bp + 0xa], 1
9:0D9A  7409                 je 0xda5
9:0D9C  66ff7606             push dword ptr [bp + 6]
9:0DA0  9ace17830b           lcall 0xb83, 0x17ce  ; operator_delete@s1:17CE
loc_0DA5:
9:0DA5  8b4606               mov ax, word ptr [bp + 6]
9:0DA8  8b5608               mov dx, word ptr [bp + 8]
9:0DAB  c9                   leave
9:0DAC  ca0600               retf 6
9:0DAF  db 90 8a 0d ba 0d 10 3a eb 0c 7c 0c be 0d c0 79 c2
9:0DBF  db 0d 3c 7b c6 0d 5e 0d ca 0d 56 7f ce 0d 86 0d d2
9:0DCF  db 0d 80 0d d6 0d 12 82 da 0d 86 7f de 0d 0c 80 e2
9:0DDF  db 0d 54 80 e6 0d c0 0c ea 0d 58 81 ee 0d b6 81 f2
9:0DEF  db 0d fe 81 fa 0d ea 60 06 0e 4a 82 fe 0d 66 82 02
9:0DFF  db 0e de 78 1a 0e ee 60 0a 0e f4 60 0e 0e fa 60 16
9:0E0F  db 0e a4 a2 f2 0b fe 60 d6 0b 7e 80 63 0c

; ---------------- PoliceDlg::PoliceDlg@s9:0E1C FAR size=106 callers=2
;   dialog 448 "Police" (vtable 11D2)
9:0E1C  55                   push bp
9:0E1D  8bec                 mov bp, sp
9:0E1F  ff7610               push word ptr [bp + 0x10]
9:0E22  66680000c001         push 0x1c00000
9:0E28  666a01               push 1
9:0E2B  66ff7606             push dword ptr [bp + 6]
9:0E2F  90                   nop
9:0E30  0e                   push cs
9:0E31  e8f468               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:0E34  c45e06               les bx, ptr [bp + 6]
9:0E37  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
9:0E41  668b460c             mov eax, dword ptr [bp + 0xc]
9:0E45  662689879200         mov dword ptr es:[bx + 0x92], eax
9:0E4B  26c78796000000       mov word ptr es:[bx + 0x96], 0
9:0E52  8b460a               mov ax, word ptr [bp + 0xa]
9:0E55  2689879800           mov word ptr es:[bx + 0x98], ax
9:0E5A  26c707d211           mov word ptr es:[bx], 0x11d2
9:0E5F  26c74702b20d         mov word ptr es:[bx + 2], 0xdb2  ; SEGMENT s9:0000
9:0E65  6a3a                 push 0x3a
9:0E67  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:0E6C  9aba209f0c           lcall 0xc9f, 0x20ba  ; Registry_get@s3:20BA
9:0E71  c45e06               les bx, ptr [bp + 6]
9:0E74  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:0E79  2689979000           mov word ptr es:[bx + 0x90], dx
9:0E7E  8bc3                 mov ax, bx
9:0E80  8cc2                 mov dx, es
9:0E82  c9                   leave
9:0E83  ca0c00               retf 0xc

; ---------------- PoliceDlg::~PoliceDlg@s9:0E86 FAR size=134 callers=1
;   dtor
9:0E86  c8100000             enter 0x10, 0
9:0E8A  c45e06               les bx, ptr [bp + 6]
9:0E8D  26c707d211           mov word ptr es:[bx], 0x11d2
9:0E92  26c74702630e         mov word ptr es:[bx + 2], 0xe63  ; SEGMENT s9:0000
9:0E98  66268b879200         mov eax, dword ptr es:[bx + 0x92]
9:0E9E  268b979400           mov dx, word ptr es:[bx + 0x94]
9:0EA3  668946fc             mov dword ptr [bp - 4], eax
9:0EA7  8bda                 mov bx, dx
9:0EA9  0bd0                 or dx, ax
9:0EAB  7413                 je 0xec0
9:0EAD  53                   push bx
9:0EAE  50                   push ax
9:0EAF  90                   nop
9:0EB0  0e                   push cs
9:0EB1  e81c97               call 0xffffa5d0  ; ReportRow::free@s9:A5D0
9:0EB4  66ff76fc             push dword ptr [bp - 4]
9:0EB8  9ace17a30d           lcall 0xda3, 0x17ce  ; operator_delete@s1:17CE
9:0EBD  83c404               add sp, 4
loc_0EC0:
9:0EC0  c45e06               les bx, ptr [bp + 6]
9:0EC3  268b879600           mov ax, word ptr es:[bx + 0x96]
9:0EC8  a3825b               mov word ptr [0x5b82], ax
9:0ECB  662683bf920000       cmp dword ptr es:[bx + 0x92], 0
9:0ED2  7510                 jne 0xee4
9:0ED4  26ff7706             push word ptr es:[bx + 6]
9:0ED8  66ff367c5b           push dword ptr [0x5b7c]
9:0EDD  9ae0b6120e           lcall 0xe12, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:0EE2  eb1a                 jmp 0xefe
loc_0EE4:
9:0EE4  6a32                 push 0x32
9:0EE6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:0EEB  9aba20fc0e           lcall 0xefc, 0x20ba  ; Registry_get@s3:20BA
9:0EF0  c45e06               les bx, ptr [bp + 6]
9:0EF3  26ff7706             push word ptr es:[bx + 6]
9:0EF7  52                   push dx
9:0EF8  50                   push ax
9:0EF9  9a8c7b6f0e           lcall 0xe6f, 0x7b8c  ; BuildingWindows::closeFor@s3:7B8C
loc_0EFE:
9:0EFE  66ff7606             push dword ptr [bp + 6]
9:0F02  90                   nop
9:0F03  0e                   push cs
9:0F04  e82569               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:0F07  c9                   leave
9:0F08  ca0400               retf 4
9:0F0B  db 00

; ---------------- PoliceDlg::init@s9:0F0C FAR size=400 callers=0
;   apis: USER.CheckDlgButton, USER.EnableWindow, USER.GetCursorPos, USER.GetDlgItem, USER.GetWindowRect, USER.SetWindowPos
;   (vslot 2) the mode buttons; hides Needs when there is no building
9:0F0C  c83c0000             enter 0x3c, 0
9:0F10  66ff7606             push dword ptr [bp + 6]
9:0F14  90                   nop
9:0F15  0e                   push cs
9:0F16  e8c969               call 0x78e2  ; OPDialog::create@s9:78E2
9:0F19  c45e06               les bx, ptr [bp + 6]
9:0F1C  2683bf980000         cmp word ptr es:[bx + 0x98], 0
9:0F22  0f858a00             jne 0xfb0
9:0F26  26ff7706             push word ptr es:[bx + 6]
9:0F2A  8d46dc               lea ax, [bp - 0x24]
9:0F2D  16                   push ss
9:0F2E  50                   push ax
9:0F2F  9a4a0f0000           lcall 0, 0xf4a  ; USER.GetWindowRect
9:0F34  c45e06               les bx, ptr [bp + 6]
9:0F37  26ff7706             push word ptr es:[bx + 6]
9:0F3B  683018               push 0x1830
9:0F3E  9aa20f0000           lcall 0, 0xfa2  ; USER.GetDlgItem
9:0F43  50                   push ax
9:0F44  8d46d4               lea ax, [bp - 0x2c]
9:0F47  16                   push ss
9:0F48  50                   push ax
9:0F49  9a04100000           lcall 0, 0x1004  ; USER.GetWindowRect
9:0F4E  8b46dc               mov ax, word ptr [bp - 0x24]
9:0F51  2946e0               sub word ptr [bp - 0x20], ax
9:0F54  8b46d6               mov ax, word ptr [bp - 0x2a]
9:0F57  2b46de               sub ax, word ptr [bp - 0x22]
9:0F5A  2d0200               sub ax, 2
9:0F5D  8946e2               mov word ptr [bp - 0x1e], ax
9:0F60  c45e06               les bx, ptr [bp + 6]
9:0F63  26ff7706             push word ptr es:[bx + 6]
9:0F67  666a00               push 0
9:0F6A  6a00                 push 0
9:0F6C  ff76e0               push word ptr [bp - 0x20]
9:0F6F  50                   push ax
9:0F70  6a06                 push 6
9:0F72  9a93100000           lcall 0, 0x1093  ; USER.SetWindowPos
9:0F77  c45e06               les bx, ptr [bp + 6]
9:0F7A  26ff7706             push word ptr es:[bx + 6]
9:0F7E  66680100c101         push 0x1c10001
9:0F84  9ae90f0000           lcall 0, 0xfe9  ; USER.CheckDlgButton
9:0F89  c45e06               les bx, ptr [bp + 6]
9:0F8C  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:0F91  26c7470a0200         mov word ptr es:[bx + 0xa], 2
9:0F97  c45e06               les bx, ptr [bp + 6]
9:0F9A  26ff7706             push word ptr es:[bx + 6]
9:0F9E  683018               push 0x1830
9:0FA1  9aec0a0000           lcall 0, 0xaec  ; USER.GetDlgItem
9:0FA6  50                   push ax
9:0FA7  6a00                 push 0
9:0FA9  9a040b0000           lcall 0, 0xb04  ; USER.EnableWindow
9:0FAE  eb3d                 jmp 0xfed
loc_0FB0:
9:0FB0  26c49f9200           les bx, ptr es:[bx + 0x92]
9:0FB5  6626ff7706           push dword ptr es:[bx + 6]
9:0FBA  9aa873c203           lcall 0x3c2, 0x73a8  ; DbObj::resolveLink16@s7:73A8
9:0FBF  8946ce               mov word ptr [bp - 0x32], ax
9:0FC2  8956d0               mov word ptr [bp - 0x30], dx
9:0FC5  c45ece               les bx, ptr [bp - 0x32]
9:0FC8  268b4720             mov ax, word ptr es:[bx + 0x20]
9:0FCC  48                   dec ax
9:0FCD  48                   dec ax
9:0FCE  740c                 je 0xfdc
9:0FD0  c45e06               les bx, ptr [bp + 6]
9:0FD3  26ff7706             push word ptr es:[bx + 6]
9:0FD7  68c201               push 0x1c2
9:0FDA  eb0a                 jmp 0xfe6
loc_0FDC:
9:0FDC  c45e06               les bx, ptr [bp + 6]
9:0FDF  26ff7706             push word ptr es:[bx + 6]
9:0FE3  68c101               push 0x1c1
loc_0FE6:
9:0FE6  6a01                 push 1
9:0FE8  9affff0000           lcall 0, 0xffff  ; USER.CheckDlgButton
loc_0FED:
9:0FED  8d46fc               lea ax, [bp - 4]
9:0FF0  16                   push ss
9:0FF1  50                   push ax
9:0FF2  9affff0000           lcall 0, 0xffff  ; USER.GetCursorPos
9:0FF7  c45e06               les bx, ptr [bp + 6]
9:0FFA  26ff7706             push word ptr es:[bx + 6]
9:0FFE  8d46f4               lea ax, [bp - 0xc]
9:1001  16                   push ss
9:1002  50                   push ax
9:1003  9af3000000           lcall 0, 0xf3  ; USER.GetWindowRect
9:1008  8b46f8               mov ax, word ptr [bp - 8]
9:100B  2b46f4               sub ax, word ptr [bp - 0xc]
9:100E  8946ee               mov word ptr [bp - 0x12], ax
9:1011  99                   cdq
9:1012  2bc2                 sub ax, dx
9:1014  d1f8                 sar ax, 1
9:1016  2b46fc               sub ax, word ptr [bp - 4]
9:1019  f7d8                 neg ax
9:101B  8946f2               mov word ptr [bp - 0xe], ax
9:101E  8b46fa               mov ax, word ptr [bp - 6]
9:1021  2b46f6               sub ax, word ptr [bp - 0xa]
9:1024  8946ec               mov word ptr [bp - 0x14], ax
9:1027  99                   cdq
9:1028  2bc2                 sub ax, dx
9:102A  d1f8                 sar ax, 1
9:102C  2b46fe               sub ax, word ptr [bp - 2]
9:102F  f7d8                 neg ax
9:1031  8946f0               mov word ptr [bp - 0x10], ax
9:1034  6a48                 push 0x48
9:1036  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:103B  9aba20ee0e           lcall 0xeee, 0x20ba  ; Registry_get@s3:20BA
9:1040  8ec2                 mov es, dx
9:1042  8bd8                 mov bx, ax
9:1044  8946e4               mov word ptr [bp - 0x1c], ax
9:1047  8c46e6               mov word ptr [bp - 0x1a], es
9:104A  268b470a             mov ax, word ptr es:[bx + 0xa]
9:104E  8946ea               mov word ptr [bp - 0x16], ax
9:1051  268b470c             mov ax, word ptr es:[bx + 0xc]
9:1055  8946e8               mov word ptr [bp - 0x18], ax
9:1058  8b46ee               mov ax, word ptr [bp - 0x12]
9:105B  0346f2               add ax, word ptr [bp - 0xe]
9:105E  3b46ea               cmp ax, word ptr [bp - 0x16]
9:1061  7e09                 jle 0x106c
9:1063  8b46ea               mov ax, word ptr [bp - 0x16]
9:1066  2b46ee               sub ax, word ptr [bp - 0x12]
9:1069  8946f2               mov word ptr [bp - 0xe], ax
loc_106C:
9:106C  8b46ec               mov ax, word ptr [bp - 0x14]
9:106F  0346f0               add ax, word ptr [bp - 0x10]
9:1072  3b46e8               cmp ax, word ptr [bp - 0x18]
9:1075  7e09                 jle 0x1080
9:1077  8b46e8               mov ax, word ptr [bp - 0x18]
9:107A  2b46ec               sub ax, word ptr [bp - 0x14]
9:107D  8946f0               mov word ptr [bp - 0x10], ax
loc_1080:
9:1080  c45e06               les bx, ptr [bp + 6]
9:1083  26ff7706             push word ptr es:[bx + 6]
9:1087  6a00                 push 0
9:1089  66ff76f0             push dword ptr [bp - 0x10]
9:108D  666a00               push 0
9:1090  6a45                 push 0x45
9:1092  9a2e010000           lcall 0, 0x12e  ; USER.SetWindowPos
9:1097  c9                   leave
9:1098  ca0400               retf 4
9:109B  db 00

; ---------------- PoliceDlg::onCommand@s9:109C FAR size=182 callers=0
;   (vslot 4)
9:109C  c80c0000             enter 0xc, 0
9:10A0  c746fe0000           mov word ptr [bp - 2], 0
9:10A5  8b460e               mov ax, word ptr [bp + 0xe]
9:10A8  2dc101               sub ax, 0x1c1
9:10AB  741d                 je 0x10ca
9:10AD  48                   dec ax
9:10AE  742c                 je 0x10dc
9:10B0  2d6e16               sub ax, 0x166e
9:10B3  7437                 je 0x10ec
9:10B5  66ff760c             push dword ptr [bp + 0xc]
9:10B9  66ff7608             push dword ptr [bp + 8]
9:10BD  ff7606               push word ptr [bp + 6]
9:10C0  90                   nop
9:10C1  0e                   push cs
9:10C2  e8776a               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:10C5  c9                   leave
9:10C6  ca0a00               retf 0xa
9:10C9  db 90
loc_10CA:
9:10CA  c45e06               les bx, ptr [bp + 6]
9:10CD  26c78796000200       mov word ptr es:[bx + 0x96], 2
9:10D4  c746fe0100           mov word ptr [bp - 2], 1
9:10D9  eb58                 jmp 0x1133
9:10DB  db 90
loc_10DC:
9:10DC  b80100               mov ax, 1
9:10DF  c45e06               les bx, ptr [bp + 6]
9:10E2  2689879600           mov word ptr es:[bx + 0x96], ax
9:10E7  8946fe               mov word ptr [bp - 2], ax
9:10EA  eb47                 jmp 0x1133
loc_10EC:
9:10EC  6a32                 push 0x32
9:10EE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:10F3  9aba201311           lcall 0x1113, 0x20ba  ; Registry_get@s3:20BA
9:10F8  8946fa               mov word ptr [bp - 6], ax
9:10FB  8956fc               mov word ptr [bp - 4], dx
9:10FE  c45e06               les bx, ptr [bp + 6]
9:1101  26c49f9200           les bx, ptr es:[bx + 0x92]
9:1106  6626ff7706           push dword ptr es:[bx + 6]
9:110B  68b60f               push 0xfb6
9:110E  52                   push dx
9:110F  50                   push ax
9:1110  9aaa793111           lcall 0x1131, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:1115  0bc0                 or ax, ax
9:1117  751a                 jne 0x1133
9:1119  c45e06               les bx, ptr [bp + 6]
9:111C  26c49f9200           les bx, ptr es:[bx + 0x92]
9:1121  6626ff7706           push dword ptr es:[bx + 6]
9:1126  6a0c                 push 0xc
9:1128  50                   push ax
9:1129  50                   push ax
9:112A  66ff76fa             push dword ptr [bp - 6]
9:112E  9a00733e10           lcall 0x103e, 0x7300  ; BuildingWindows::open@s3:7300
loc_1133:
9:1133  837efe00             cmp word ptr [bp - 2], 0
9:1137  7411                 je 0x114a
9:1139  c45e06               les bx, ptr [bp + 6]
9:113C  268b879600           mov ax, word ptr es:[bx + 0x96]
9:1141  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1146  2689470a             mov word ptr es:[bx + 0xa], ax
loc_114A:
9:114A  33c0                 xor ax, ax
9:114C  99                   cdq
9:114D  c9                   leave
9:114E  ca0a00               retf 0xa
9:1151  db 00

; ---------------- PoliceDlg::close@s9:1152 FAR size=90 callers=0
;   (vslot 5) applies the chosen mode
9:1152  c80a0000             enter 0xa, 0
9:1156  c45e06               les bx, ptr [bp + 6]
9:1159  662683bf920000       cmp dword ptr es:[bx + 0x92], 0
9:1160  7433                 je 0x1195
9:1162  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1167  268b470a             mov ax, word ptr es:[bx + 0xa]
9:116B  8946fe               mov word ptr [bp - 2], ax
9:116E  6a03                 push 3
9:1170  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:1175  9aba209311           lcall 0x1193, 0x20ba  ; Registry_get@s3:20BA
9:117A  c45e06               les bx, ptr [bp + 6]
9:117D  26c49f9200           les bx, ptr es:[bx + 0x92]
9:1182  6626ff7706           push dword ptr es:[bx + 6]
9:1187  26ff770a             push word ptr es:[bx + 0xa]
9:118B  ff76fe               push word ptr [bp - 2]
9:118E  52                   push dx
9:118F  50                   push ax
9:1190  9a92aef610           lcall 0x10f6, 0xae92  ; setFactoryProduct@s3:AE92
loc_1195:
9:1195  66ff7608             push dword ptr [bp + 8]
9:1199  ff7606               push word ptr [bp + 6]
9:119C  90                   nop
9:119D  0e                   push cs
9:119E  e8f769               call 0x7b98  ; OPDialog::close@s9:7B98
9:11A1  c706805b0000         mov word ptr [0x5b80], 0
9:11A7  c9                   leave
9:11A8  ca0600               retf 6
9:11AB  db 00

; ---------------- PoliceDlg::scalar_dtor@s9:11AC FAR size=146 callers=0
;   deleting destructor
9:11AC  55                   push bp
9:11AD  8bec                 mov bp, sp
9:11AF  66ff7606             push dword ptr [bp + 6]
9:11B3  90                   nop
9:11B4  0e                   push cs
9:11B5  e8cefc               call 0xe86  ; PoliceDlg::~PoliceDlg@s9:0E86
9:11B8  f6460a01             test byte ptr [bp + 0xa], 1
9:11BC  7409                 je 0x11c7
9:11BE  66ff7606             push dword ptr [bp + 6]
9:11C2  9ace17bb0e           lcall 0xebb, 0x17ce  ; operator_delete@s1:17CE
loc_11C7:
9:11C7  8b4606               mov ax, word ptr [bp + 6]
9:11CA  8b5608               mov dx, word ptr [bp + 8]
9:11CD  c9                   leave
9:11CE  ca0600               retf 6
9:11D1  db 90 ac 11 dc 11 10 3a b6 0d 0c 0f e0 11 c0 79 e4
9:11E1  db 11 9c 10 e8 11 52 11 ec 11 56 7f f0 11 b2 7b f4
9:11F1  db 11 1c 7f f8 11 12 82 fc 11 86 7f 00 12 0c 80 04
9:1201  db 12 54 80 08 12 5e 7e 0c 12 58 81 10 12 b6 81 14
9:1211  db 12 fe 81 1c 12 ea 60 28 12 4a 82 20 12 66 82 24
9:1221  db 12 de 78 3c 12 ee 60 2c 12 f4 60 30 12 fa 60 38
9:1231  db 12 a4 a2 e0 0e fe 60 f6 0d 7e 80 96 0e

; ---------------- MoveColonistsDlg::MoveColonistsDlg@s9:123E FAR size=82 callers=1
;   dialog 4049 "Move Colonists" (vtable 17B0)
9:123E  55                   push bp
9:123F  8bec                 mov bp, sp
9:1241  ff7612               push word ptr [bp + 0x12]
9:1244  68d10f               push 0xfd1
9:1247  66ff760a             push dword ptr [bp + 0xa]
9:124B  6a01                 push 1
9:124D  66ff7606             push dword ptr [bp + 6]
9:1251  90                   nop
9:1252  0e                   push cs
9:1253  e8d264               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:1256  c45e06               les bx, ptr [bp + 6]
9:1259  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
9:1263  26c707b017           mov word ptr es:[bx], 0x17b0
9:1268  26c74702d411         mov word ptr es:[bx + 2], 0x11d4  ; SEGMENT s9:0000
9:126E  6a46                 push 0x46
9:1270  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:1275  9aba207811           lcall 0x1178, 0x20ba  ; Registry_get@s3:20BA
9:127A  c45e06               les bx, ptr [bp + 6]
9:127D  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:1282  2689979000           mov word ptr es:[bx + 0x90], dx
9:1287  8bc3                 mov ax, bx
9:1289  8cc2                 mov dx, es
9:128B  c9                   leave
9:128C  ca0e00               retf 0xe
9:128F  db 00

; ---------------- MoveColonistsDlg::~MoveColonistsDlg@s9:1290 FAR size=44 callers=1
;   dtor
9:1290  55                   push bp
9:1291  8bec                 mov bp, sp
9:1293  c45e06               les bx, ptr [bp + 6]
9:1296  26c707b017           mov word ptr es:[bx], 0x17b0
9:129B  26c747026c12         mov word ptr es:[bx + 2], 0x126c  ; SEGMENT s9:0000
9:12A1  26ff7706             push word ptr es:[bx + 6]
9:12A5  66ff367c5b           push dword ptr [0x5b7c]
9:12AA  9ae0b63412           lcall 0x1234, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:12AF  66ff7606             push dword ptr [bp + 6]
9:12B3  90                   nop
9:12B4  0e                   push cs
9:12B5  e87465               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:12B8  c9                   leave
9:12B9  ca0400               retf 4

; ---------------- MoveColonistsDlg::init@s9:12BC size=246 callers=0
;   apis: USER.GetDlgItem, USER.SendMessage, USER.SetFocus, USER.ShowWindow
;   (vslot 2)
9:12BC  c8600000             enter 0x60, 0
9:12C0  66ff7606             push dword ptr [bp + 6]
9:12C4  90                   nop
9:12C5  0e                   push cs
9:12C6  e81966               call 0x78e2  ; OPDialog::create@s9:78E2
9:12C9  c45e06               les bx, ptr [bp + 6]
9:12CC  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:12D1  26ff770a             push word ptr es:[bx + 0xa]
9:12D5  1e                   push ds
9:12D6  68d45c               push 0x5cd4
9:12D9  8d46ae               lea ax, [bp - 0x52]
9:12DC  16                   push ss
9:12DD  50                   push ax
9:12DE  9a9c3fc511           lcall 0x11c5, 0x3f9c  ; _fsprintf@s1:3F9C
9:12E3  83c40a               add sp, 0xa
9:12E6  c45e06               les bx, ptr [bp + 6]
9:12E9  26ff7706             push word ptr es:[bx + 6]
9:12ED  68d20f               push 0xfd2
9:12F0  9a4f130000           lcall 0, 0x134f  ; USER.GetDlgItem
9:12F5  8946ac               mov word ptr [bp - 0x54], ax
9:12F8  50                   push ax
9:12F9  666800000c00         push 0xc0000
9:12FF  8d4eae               lea cx, [bp - 0x52]
9:1302  16                   push ss
9:1303  51                   push cx
9:1304  9a21130000           lcall 0, 0x1321  ; USER.SendMessage
9:1309  ff76ac               push word ptr [bp - 0x54]
9:130C  9aa5090000           lcall 0, 0x9a5  ; USER.SetFocus
9:1311  ff76ac               push word ptr [bp - 0x54]
9:1314  666800000104         push 0x4010000
9:131A  66680000ffff         push 0xffff0000
9:1320  9a6e130000           lcall 0, 0x136e  ; USER.SendMessage
9:1325  666aff               push -1
9:1328  66ff7606             push dword ptr [bp + 6]
9:132C  90                   nop
9:132D  0e                   push cs
9:132E  e83b6f               call 0x826c  ; OPDialog::position@s9:826C
9:1331  683105               push 0x531
9:1334  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:1339  9a7e847812           lcall 0x1278, 0x847e  ; LoadStringRes@s3:847E
9:133E  8946a8               mov word ptr [bp - 0x58], ax
9:1341  8956aa               mov word ptr [bp - 0x56], dx
9:1344  c45e06               les bx, ptr [bp + 6]
9:1347  26ff7706             push word ptr es:[bx + 6]
9:134B  683f18               push 0x183f
9:134E  9a7d130000           lcall 0, 0x137d  ; USER.GetDlgItem
9:1353  8946a6               mov word ptr [bp - 0x5a], ax
9:1356  50                   push ax
9:1357  66ff7606             push dword ptr [bp + 6]
9:135B  90                   nop
9:135C  0e                   push cs
9:135D  e83603               call 0x1696  ; MoveColonistsDlg::fillColonies@s9:1696
9:1360  ff76a6               push word ptr [bp - 0x5a]
9:1363  6668ffff0d04         push 0x40dffff
9:1369  66ff76a8             push dword ptr [bp - 0x58]
9:136D  9a9c130000           lcall 0, 0x139c  ; USER.SendMessage
9:1372  c45e06               les bx, ptr [bp + 6]
9:1375  26ff7706             push word ptr es:[bx + 6]
9:1379  683e18               push 0x183e
9:137C  9a3f0f0000           lcall 0, 0xf3f  ; USER.GetDlgItem
9:1381  8946a6               mov word ptr [bp - 0x5a], ax
9:1384  50                   push ax
9:1385  66ff7606             push dword ptr [bp + 6]
9:1389  90                   nop
9:138A  0e                   push cs
9:138B  e80803               call 0x1696  ; MoveColonistsDlg::fillColonies@s9:1696
9:138E  ff76a6               push word ptr [bp - 0x5a]
9:1391  6668ffff0d04         push 0x40dffff
9:1397  66ff76a8             push dword ptr [bp - 0x58]
9:139B  9affff0000           lcall 0, 0xffff  ; USER.SendMessage
9:13A0  c45e06               les bx, ptr [bp + 6]
9:13A3  26ff7706             push word ptr es:[bx + 6]
9:13A7  6a05                 push 5
9:13A9  9ab80c0000           lcall 0, 0xcb8  ; USER.ShowWindow
9:13AE  c9                   leave
9:13AF  ca0400               retf 4

; ---------------- MoveColonistsDlg::onOK@s9:13B2 size=632 callers=0
;   apis: USER.DestroyWindow, USER.GetDlgItem, USER.SendMessage
;   (vslot 5) moves the colonists between the two colonies
9:13B2  c8300200             enter 0x230, 0
9:13B6  837e0a00             cmp word ptr [bp + 0xa], 0
9:13BA  0f845b02             je 0x1619
9:13BE  c45e06               les bx, ptr [bp + 6]
9:13C1  26ff7706             push word ptr es:[bx + 6]
9:13C5  68d20f               push 0xfd2
9:13C8  9afc130000           lcall 0, 0x13fc  ; USER.GetDlgItem
9:13CD  8946ac               mov word ptr [bp - 0x54], ax
9:13D0  50                   push ax
9:13D1  666851000d00         push 0xd0051
9:13D7  8d46ae               lea ax, [bp - 0x52]
9:13DA  16                   push ss
9:13DB  50                   push ax
9:13DC  9a0f140000           lcall 0, 0x140f  ; USER.SendMessage
9:13E1  8d46ae               lea ax, [bp - 0x52]
9:13E4  16                   push ss
9:13E5  50                   push ax
9:13E6  9a283e9114           lcall 0x1491, 0x3e28  ; _fatol@s1:3E28
9:13EB  83c404               add sp, 4
9:13EE  8946aa               mov word ptr [bp - 0x56], ax
9:13F1  c45e06               les bx, ptr [bp + 6]
9:13F4  26ff7706             push word ptr es:[bx + 6]
9:13F8  683e18               push 0x183e
9:13FB  9a3a140000           lcall 0, 0x143a  ; USER.GetDlgItem
9:1400  898656ff             mov word ptr [bp - 0xaa], ax
9:1404  50                   push ax
9:1405  666800000704         push 0x4070000
9:140B  666a00               push 0
9:140E  9a2b140000           lcall 0, 0x142b  ; USER.SendMessage
9:1413  898654ff             mov word ptr [bp - 0xac], ax
9:1417  3dffff               cmp ax, 0xffff
9:141A  7413                 je 0x142f
9:141C  ffb656ff             push word ptr [bp - 0xaa]
9:1420  680804               push 0x408
9:1423  50                   push ax
9:1424  8d8658ff             lea ax, [bp - 0xa8]
9:1428  16                   push ss
9:1429  50                   push ax
9:142A  9a4d140000           lcall 0, 0x144d  ; USER.SendMessage
loc_142F:
9:142F  c45e06               les bx, ptr [bp + 6]
9:1432  26ff7706             push word ptr es:[bx + 6]
9:1436  683f18               push 0x183f
9:1439  9af1120000           lcall 0, 0x12f1  ; USER.GetDlgItem
9:143E  898656ff             mov word ptr [bp - 0xaa], ax
9:1442  50                   push ax
9:1443  666800000704         push 0x4070000
9:1449  666a00               push 0
9:144C  9a69140000           lcall 0, 0x1469  ; USER.SendMessage
9:1451  898654ff             mov word ptr [bp - 0xac], ax
9:1455  3dffff               cmp ax, 0xffff
9:1458  7413                 je 0x146d
9:145A  ffb656ff             push word ptr [bp - 0xaa]
9:145E  680804               push 0x408
9:1461  50                   push ax
9:1462  8d8602ff             lea ax, [bp - 0xfe]
9:1466  16                   push ss
9:1467  50                   push ax
9:1468  9a05130000           lcall 0, 0x1305  ; USER.SendMessage
loc_146D:
9:146D  683105               push 0x531
9:1470  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:1475  9a7e842c15           lcall 0x152c, 0x847e  ; LoadStringRes@s3:847E
9:147A  8986fefe             mov word ptr [bp - 0x102], ax
9:147E  899600ff             mov word ptr [bp - 0x100], dx
9:1482  8d8e02ff             lea cx, [bp - 0xfe]
9:1486  16                   push ss
9:1487  51                   push cx
9:1488  8d9658ff             lea dx, [bp - 0xa8]
9:148C  16                   push ss
9:148D  52                   push dx
9:148E  9a7a3da814           lcall 0x14a8, 0x3d7a  ; _fstrcmp@s1:3D7A
9:1493  83c408               add sp, 8
9:1496  0bc0                 or ax, ax
9:1498  742e                 je 0x14c8
9:149A  66ffb6fefe           push dword ptr [bp - 0x102]
9:149F  8d8658ff             lea ax, [bp - 0xa8]
9:14A3  16                   push ss
9:14A4  50                   push ax
9:14A5  9a7a3dbf14           lcall 0x14bf, 0x3d7a  ; _fstrcmp@s1:3D7A
9:14AA  83c408               add sp, 8
9:14AD  0bc0                 or ax, ax
9:14AF  7417                 je 0x14c8
9:14B1  66ffb6fefe           push dword ptr [bp - 0x102]
9:14B6  8d8602ff             lea ax, [bp - 0xfe]
9:14BA  16                   push ss
9:14BB  50                   push ax
9:14BC  9a7a3dce14           lcall 0x14ce, 0x3d7a  ; _fstrcmp@s1:3D7A
9:14C1  83c408               add sp, 8
9:14C4  0bc0                 or ax, ax
9:14C6  7552                 jne 0x151a
loc_14C8:
9:14C8  68b400               push 0xb4
9:14CB  9a9c176115           lcall 0x1561, 0x179c  ; operator_new@s1:179C
9:14D0  83c402               add sp, 2
9:14D3  8986f4fe             mov word ptr [bp - 0x10c], ax
9:14D7  8996f6fe             mov word ptr [bp - 0x10a], dx
9:14DB  0bd0                 or dx, ax
9:14DD  741f                 je 0x14fe
9:14DF  66687b055507         push 0x755057b
9:14E5  666830000200         push 0x20030
9:14EB  ff369603             push word ptr [0x396]
9:14EF  ffb6f6fe             push word ptr [bp - 0x10a]
9:14F3  50                   push ax
9:14F4  90                   nop
9:14F5  0e                   push cs
9:14F6  e82770               call 0x8520  ; OPMessageBox::OPMessageBox(ids)@s9:8520
9:14F9  83c40e               add sp, 0xe
9:14FC  eb03                 jmp 0x1501
loc_14FE:
9:14FE  33c0                 xor ax, ax
9:1500  99                   cdq
loc_1501:
9:1501  8986f8fe             mov word ptr [bp - 0x108], ax
9:1505  8996fafe             mov word ptr [bp - 0x106], dx
9:1509  52                   push dx
9:150A  c49ef8fe             les bx, ptr [bp - 0x108]
9:150E  50                   push ax
9:150F  26c41f               les bx, ptr es:[bx]
9:1512  26ff5f74             lcall es:[bx + 0x74]
9:1516  e90001               jmp 0x1619
9:1519  db 90
loc_151A:
9:151A  8d8658ff             lea ax, [bp - 0xa8]
9:151E  16                   push ss
9:151F  50                   push ax
9:1520  c45e06               les bx, ptr [bp + 6]
9:1523  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1529  9a1c534015           lcall 0x1540, 0x531c  ; ColonyPair::setTo@s3:531C
9:152E  8d8602ff             lea ax, [bp - 0xfe]
9:1532  16                   push ss
9:1533  50                   push ax
9:1534  c45e06               les bx, ptr [bp + 6]
9:1537  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:153D  9afc525115           lcall 0x1551, 0x52fc  ; ColonyPair::setFrom@s3:52FC
9:1542  ff76aa               push word ptr [bp - 0x56]
9:1545  c45e06               les bx, ptr [bp + 6]
9:1548  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:154E  9a20513c13           lcall 0x133c, 0x5120  ; ColonyPair::population@s3:5120
9:1553  8986f8fe             mov word ptr [bp - 0x108], ax
9:1557  0bc0                 or ax, ax
9:1559  7553                 jne 0x15ae
9:155B  68b400               push 0xb4
9:155E  9a9c17e112           lcall 0x12e1, 0x179c  ; operator_new@s1:179C
9:1563  83c402               add sp, 2
9:1566  8986f4fe             mov word ptr [bp - 0x10c], ax
9:156A  8996f6fe             mov word ptr [bp - 0x10a], dx
9:156E  0bd0                 or dx, ax
9:1570  7420                 je 0x1592
9:1572  66687b05d207         push 0x7d2057b
9:1578  666830000200         push 0x20030
9:157E  ff369603             push word ptr [0x396]
9:1582  ffb6f6fe             push word ptr [bp - 0x10a]
9:1586  50                   push ax
9:1587  90                   nop
9:1588  0e                   push cs
9:1589  e8946f               call 0x8520  ; OPMessageBox::OPMessageBox(ids)@s9:8520
9:158C  83c40e               add sp, 0xe
9:158F  eb04                 jmp 0x1595
9:1591  db 90
loc_1592:
9:1592  33c0                 xor ax, ax
9:1594  99                   cdq
loc_1595:
9:1595  8986d0fd             mov word ptr [bp - 0x230], ax
9:1599  8996d2fd             mov word ptr [bp - 0x22e], dx
9:159D  52                   push dx
9:159E  c49ed0fd             les bx, ptr [bp - 0x230]
9:15A2  50                   push ax
9:15A3  26c41f               les bx, ptr es:[bx]
9:15A6  26ff5f74             lcall es:[bx + 0x74]
9:15AA  c9                   leave
9:15AB  ca0600               retf 6
loc_15AE:
9:15AE  c45e06               les bx, ptr [bp + 6]
9:15B1  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:15B6  66268b4712           mov eax, dword ptr es:[bx + 0x12]
9:15BB  668986f0fe           mov dword ptr [bp - 0x110], eax
9:15C0  c45e06               les bx, ptr [bp + 6]
9:15C3  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:15C8  66268b4716           mov eax, dword ptr es:[bx + 0x16]
9:15CD  268b5718             mov dx, word ptr es:[bx + 0x18]
9:15D1  668986ecfe           mov dword ptr [bp - 0x114], eax
9:15D6  c45e06               les bx, ptr [bp + 6]
9:15D9  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:15DE  268b470a             mov ax, word ptr es:[bx + 0xa]
9:15E2  8986fcfe             mov word ptr [bp - 0x104], ax
9:15E6  52                   push dx
9:15E7  ffb6ecfe             push word ptr [bp - 0x114]
9:15EB  66ffb6f0fe           push dword ptr [bp - 0x110]
9:15F0  6a00                 push 0
9:15F2  50                   push ax
9:15F3  8d86d4fd             lea ax, [bp - 0x22c]
9:15F7  16                   push ss
9:15F8  50                   push ax
9:15F9  9a9e8d1716           lcall 0x1617, 0x8d9e  ; SCMoveColonists::SCMoveColonists@s6:8D9E
9:15FE  8d86d4fd             lea ax, [bp - 0x22c]
9:1602  16                   push ss
9:1603  50                   push ax
9:1604  66ff364857           push dword ptr [0x5748]  ; g_sim
9:1609  9a5a83bd0f           lcall 0xfbd, 0x835a  ; Sim::enqueue@s7:835A
9:160E  8d86d4fd             lea ax, [bp - 0x22c]
9:1612  16                   push ss
9:1613  50                   push ax
9:1614  9aec8dffff           lcall 0xffff, 0x8dec  ; SCMoveColonists::~SCMoveColonists@s6:8DEC
loc_1619:
9:1619  c45e06               les bx, ptr [bp + 6]
9:161C  26ff7706             push word ptr es:[bx + 6]
9:1620  9a91040000           lcall 0, 0x491  ; USER.DestroyWindow
9:1625  c9                   leave
9:1626  ca0600               retf 6
9:1629  db 00

; ---------------- MoveColonistsDlg::onCommand@s9:162A FAR size=108 callers=0
;   apis: USER.GetWindowRect, USER.SetWindowPos
;   (vslot 4)
9:162A  c8080000             enter 8, 0
9:162E  817e0e3f18           cmp word ptr [bp + 0xe], 0x183f
9:1633  7407                 je 0x163c
9:1635  817e0e3e18           cmp word ptr [bp + 0xe], 0x183e
9:163A  7546                 jne 0x1682
loc_163C:
9:163C  8b460c               mov ax, word ptr [bp + 0xc]
9:163F  2d0700               sub ax, 7
9:1642  7410                 je 0x1654
9:1644  48                   dec ax
9:1645  48                   dec ax
9:1646  7435                 je 0x167d
9:1648  48                   dec ax
9:1649  7432                 je 0x167d
9:164B  33c0                 xor ax, ax
loc_164D:
9:164D  33d2                 xor dx, dx
9:164F  c9                   leave
9:1650  ca0a00               retf 0xa
9:1653  db 90
loc_1654:
9:1654  ff760a               push word ptr [bp + 0xa]
9:1657  8d46f8               lea ax, [bp - 8]
9:165A  16                   push ss
9:165B  50                   push ax
9:165C  9a300f0000           lcall 0, 0xf30  ; USER.GetWindowRect
9:1661  ff760a               push word ptr [bp + 0xa]
9:1664  666a00               push 0
9:1667  6a00                 push 0
9:1669  8b46f8               mov ax, word ptr [bp - 8]
9:166C  2946fc               sub word ptr [bp - 4], ax
9:166F  ff76fc               push word ptr [bp - 4]
9:1672  666802005000         push 0x500002
9:1678  9a730f0000           lcall 0, 0xf73  ; USER.SetWindowPos
loc_167D:
9:167D  b80100               mov ax, 1
9:1680  ebcb                 jmp 0x164d
loc_1682:
9:1682  66ff760c             push dword ptr [bp + 0xc]
9:1686  66ff7608             push dword ptr [bp + 8]
9:168A  ff7606               push word ptr [bp + 6]
9:168D  90                   nop
9:168E  0e                   push cs
9:168F  e8aa64               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:1692  c9                   leave
9:1693  ca0a00               retf 0xa

; ---------------- MoveColonistsDlg::fillColonies@s9:1696 FAR size=240 callers=1
;   apis: USER.SendMessage
;   the colony lists
9:1696  c8200000             enter 0x20, 0
9:169A  56                   push si
9:169B  ff760a               push word ptr [bp + 0xa]
9:169E  666800000b04         push 0x40b0000
9:16A4  666a00               push 0
9:16A7  9ab9160000           lcall 0, 0x16b9  ; USER.SendMessage
9:16AC  ff760a               push word ptr [bp + 0xa]
9:16AF  666800000b00         push 0xb0000
9:16B5  666a00               push 0
9:16B8  9a1f170000           lcall 0, 0x171f  ; USER.SendMessage
9:16BD  c746fe0000           mov word ptr [bp - 2], 0
9:16C2  8d46fe               lea ax, [bp - 2]
9:16C5  16                   push ss
9:16C6  50                   push ax
9:16C7  c45e06               les bx, ptr [bp + 6]
9:16CA  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:16D0  9a9a511417           lcall 0x1714, 0x519a  ; ColonyPair::listColonies@s3:519A
9:16D5  8946fa               mov word ptr [bp - 6], ax
9:16D8  8956fc               mov word ptr [bp - 4], dx
9:16DB  662bc0               sub eax, eax
9:16DE  668946f6             mov dword ptr [bp - 0xa], eax
9:16E2  668946f2             mov dword ptr [bp - 0xe], eax
9:16E6  8946f0               mov word ptr [bp - 0x10], ax
9:16E9  eb57                 jmp 0x1742
9:16EB  db 90
loc_16EC:
9:16EC  8b5ef0               mov bx, word ptr [bp - 0x10]
9:16EF  c1e302               shl bx, 2
9:16F2  c476fa               les si, ptr [bp - 6]
9:16F5  66268b00             mov eax, dword ptr es:[bx + si]
9:16F9  668946f6             mov dword ptr [bp - 0xa], eax
9:16FD  ff760a               push word ptr [bp + 0xa]
9:1700  666800000304         push 0x4030000
9:1706  6650                 push eax
9:1708  c45e06               les bx, ptr [bp + 6]
9:170B  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1711  9a86525e17           lcall 0x175e, 0x5286  ; ColonyPair::colonyName@s3:5286
9:1716  8946f2               mov word ptr [bp - 0xe], ax
9:1719  8956f4               mov word ptr [bp - 0xc], dx
9:171C  52                   push dx
9:171D  50                   push ax
9:171E  9a69170000           lcall 0, 0x1769  ; USER.SendMessage
9:1723  8946e8               mov word ptr [bp - 0x18], ax
9:1726  8956ea               mov word ptr [bp - 0x16], dx
9:1729  668b46f2             mov eax, dword ptr [bp - 0xe]
9:172D  668946e4             mov dword ptr [bp - 0x1c], eax
9:1731  668946e0             mov dword ptr [bp - 0x20], eax
9:1735  6650                 push eax
9:1737  9ace17e913           lcall 0x13e9, 0x17ce  ; operator_delete@s1:17CE
9:173C  83c404               add sp, 4
9:173F  ff46f0               inc word ptr [bp - 0x10]
loc_1742:
9:1742  8b46fe               mov ax, word ptr [bp - 2]
9:1745  3946f0               cmp word ptr [bp - 0x10], ax
9:1748  72a2                 jb 0x16ec
9:174A  ff760a               push word ptr [bp + 0xa]
9:174D  666800000a04         push 0x40a0000
9:1753  683105               push 0x531
9:1756  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:175B  9a7e847814           lcall 0x1478, 0x847e  ; LoadStringRes@s3:847E
9:1760  8946ec               mov word ptr [bp - 0x14], ax
9:1763  8956ee               mov word ptr [bp - 0x12], dx
9:1766  52                   push dx
9:1767  50                   push ax
9:1768  9a7a170000           lcall 0, 0x177a  ; USER.SendMessage
9:176D  ff760a               push word ptr [bp + 0xa]
9:1770  666801000b00         push 0xb0001
9:1776  666a00               push 0
9:1779  9add130000           lcall 0, 0x13dd  ; USER.SendMessage
9:177E  b80100               mov ax, 1
9:1781  5e                   pop si
9:1782  c9                   leave
9:1783  ca0600               retf 6

; ---------------- MoveColonistsDlg::nop@s9:1786 FAR size=4 callers=0
;   empty virtual
9:1786  ca0400               retf 4
9:1789  db 00

; ---------------- MoveColonistsDlg::scalar_dtor@s9:178A FAR size=146 callers=0
;   deleting destructor
9:178A  55                   push bp
9:178B  8bec                 mov bp, sp
9:178D  66ff7606             push dword ptr [bp + 6]
9:1791  90                   nop
9:1792  0e                   push cs
9:1793  e8fafa               call 0x1290  ; MoveColonistsDlg::~MoveColonistsDlg@s9:1290
9:1796  f6460a01             test byte ptr [bp + 0xa], 1
9:179A  7409                 je 0x17a5
9:179C  66ff7606             push dword ptr [bp + 6]
9:17A0  9ace173a17           lcall 0x173a, 0x17ce  ; operator_delete@s1:17CE
loc_17A5:
9:17A5  8b4606               mov ax, word ptr [bp + 6]
9:17A8  8b5608               mov dx, word ptr [bp + 8]
9:17AB  c9                   leave
9:17AC  ca0600               retf 6
9:17AF  db 90 8a 17 ba 17 10 3a d8 11 bc 12 be 17 c0 79 c2
9:17BF  db 17 2a 16 c6 17 b2 13 ca 17 56 7f ce 17 b2 7b d2
9:17CF  db 17 1c 7f d6 17 86 17 da 17 86 7f de 17 0c 80 e2
9:17DF  db 17 54 80 e6 17 5e 7e ea 17 58 81 ee 17 b6 81 f2
9:17EF  db 17 fe 81 fa 17 ea 60 06 18 4a 82 fe 17 66 82 02
9:17FF  db 18 de 78 1a 18 ee 60 0a 18 f4 60 0e 18 fa 60 16
9:180F  db 18 a4 a2 ad 12 fe 60 18 12 7e 80 9f 12

; ---------------- PreferencesDlg::PreferencesDlg@s9:181C FAR size=90 callers=1
;   dialog 4027 "Preferences" (vtable 1C48)
9:181C  55                   push bp
9:181D  8bec                 mov bp, sp
9:181F  ff7612               push word ptr [bp + 0x12]
9:1822  68bb0f               push 0xfbb
9:1825  66ff760a             push dword ptr [bp + 0xa]
9:1829  6a01                 push 1
9:182B  66ff7606             push dword ptr [bp + 6]
9:182F  90                   nop
9:1830  0e                   push cs
9:1831  e8f45e               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:1834  c45e06               les bx, ptr [bp + 6]
9:1837  662bc0               sub eax, eax
9:183A  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:1840  2689879200           mov word ptr es:[bx + 0x92], ax
9:1845  2689879400           mov word ptr es:[bx + 0x94], ax
9:184A  26c707481c           mov word ptr es:[bx], 0x1c48
9:184F  26c74702b217         mov word ptr es:[bx + 2], 0x17b2  ; SEGMENT s9:0000
9:1855  6a02                 push 2
9:1857  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:185C  9aba20d316           lcall 0x16d3, 0x20ba  ; Registry_get@s3:20BA
9:1861  c45e06               les bx, ptr [bp + 6]
9:1864  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:1869  2689979000           mov word ptr es:[bx + 0x90], dx
9:186E  8bc3                 mov ax, bx
9:1870  8cc2                 mov dx, es
9:1872  c9                   leave
9:1873  ca0e00               retf 0xe

; ---------------- PreferencesDlg::~PreferencesDlg@s9:1876 FAR size=44 callers=1
;   dtor
9:1876  55                   push bp
9:1877  8bec                 mov bp, sp
9:1879  c45e06               les bx, ptr [bp + 6]
9:187C  26c707481c           mov word ptr es:[bx], 0x1c48
9:1881  26c747025318         mov word ptr es:[bx + 2], 0x1853  ; SEGMENT s9:0000
9:1887  26ff7706             push word ptr es:[bx + 6]
9:188B  66ff367c5b           push dword ptr [0x5b7c]
9:1890  9ae0b61218           lcall 0x1812, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:1895  66ff7606             push dword ptr [bp + 6]
9:1899  90                   nop
9:189A  0e                   push cs
9:189B  e88e5f               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:189E  c9                   leave
9:189F  ca0400               retf 4

; ---------------- PreferencesDlg::init@s9:18A2 size=328 callers=0
;   apis: USER.SetDlgItemText, USER.ShowWindow, USER._wsprintf
;   (vslot 2) the options and the Difficulty Level box
9:18A2  c80c0300             enter 0x30c, 0
9:18A6  66ff7606             push dword ptr [bp + 6]
9:18AA  90                   nop
9:18AB  0e                   push cs
9:18AC  e83360               call 0x78e2  ; OPDialog::create@s9:78E2
9:18AF  66ff7606             push dword ptr [bp + 6]
9:18B3  90                   nop
9:18B4  0e                   push cs
9:18B5  e84602               call 0x1afe  ; PreferencesDlg::checkButtons@s9:1AFE
9:18B8  833eae1300           cmp word ptr [0x13ae], 0
9:18BD  0f840b01             je 0x19cc
9:18C1  a1ae13               mov ax, word ptr [0x13ae]
9:18C4  48                   dec ax
9:18C5  48                   dec ax
9:18C6  0f848600             je 0x1950
9:18CA  48                   dec ax
9:18CB  0f848900             je 0x1958
9:18CF  48                   dec ax
9:18D0  0f848c00             je 0x1960
9:18D4  c746fe2006           mov word ptr [bp - 2], 0x620
loc_18D9:
9:18D9  ff76fe               push word ptr [bp - 2]
9:18DC  8d86fefe             lea ax, [bp - 0x102]
9:18E0  16                   push ss
9:18E1  50                   push ax
9:18E2  68ff03               push 0x3ff
9:18E5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:18EA  9ae0840319           lcall 0x1903, 0x84e0  ; LoadStringTo@s3:84E0
9:18EF  682406               push 0x624
9:18F2  8d86fefd             lea ax, [bp - 0x202]
9:18F6  16                   push ss
9:18F7  50                   push ax
9:18F8  68ff03               push 0x3ff
9:18FB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:1900  9ae0848119           lcall 0x1981, 0x84e0  ; LoadStringTo@s3:84E0
9:1905  8d86fefe             lea ax, [bp - 0x102]
9:1909  16                   push ss
9:190A  50                   push ax
9:190B  8d86fefd             lea ax, [bp - 0x202]
9:190F  16                   push ss
9:1910  50                   push ax
9:1911  1e                   push ds
9:1912  68da5c               push 0x5cda  ; '%s%s'
9:1915  8d86fefc             lea ax, [bp - 0x302]
9:1919  16                   push ss
9:191A  50                   push ax
9:191B  9ab0190000           lcall 0, 0x19b0  ; USER._wsprintf
9:1920  83c410               add sp, 0x10
9:1923  c45e06               les bx, ptr [bp + 6]
9:1926  26ff7706             push word ptr es:[bx + 6]
9:192A  68e00f               push 0xfe0
9:192D  8d86fefc             lea ax, [bp - 0x302]
9:1931  16                   push ss
9:1932  50                   push ax
9:1933  9ac8190000           lcall 0, 0x19c8  ; USER.SetDlgItemText
9:1938  c45e06               les bx, ptr [bp + 6]
9:193B  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1940  2683bf820000         cmp word ptr es:[bx + 0x82], 0
9:1946  7420                 je 0x1968
9:1948  c746fe2606           mov word ptr [bp - 2], 0x626
9:194D  eb1e                 jmp 0x196d
9:194F  db 90
loc_1950:
9:1950  c746fe2106           mov word ptr [bp - 2], 0x621
9:1955  eb82                 jmp 0x18d9
9:1957  db 90
loc_1958:
9:1958  c746fe2206           mov word ptr [bp - 2], 0x622
9:195D  e979ff               jmp 0x18d9
loc_1960:
9:1960  c746fe2306           mov word ptr [bp - 2], 0x623
9:1965  e971ff               jmp 0x18d9
loc_1968:
9:1968  c746fe2706           mov word ptr [bp - 2], 0x627
loc_196D:
9:196D  ff76fe               push word ptr [bp - 2]
9:1970  8d86fefe             lea ax, [bp - 0x102]
9:1974  16                   push ss
9:1975  50                   push ax
9:1976  68ff03               push 0x3ff
9:1979  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:197E  9ae0849719           lcall 0x1997, 0x84e0  ; LoadStringTo@s3:84E0
9:1983  682506               push 0x625
9:1986  8d86fefd             lea ax, [bp - 0x202]
9:198A  16                   push ss
9:198B  50                   push ax
9:198C  68ff03               push 0x3ff
9:198F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:1994  9ae0845f18           lcall 0x185f, 0x84e0  ; LoadStringTo@s3:84E0
9:1999  8d86fefe             lea ax, [bp - 0x102]
9:199D  16                   push ss
9:199E  50                   push ax
9:199F  8d86fefd             lea ax, [bp - 0x202]
9:19A3  16                   push ss
9:19A4  50                   push ax
9:19A5  1e                   push ds
9:19A6  68df5c               push 0x5cdf  ; '%s%s'
9:19A9  8d86fefc             lea ax, [bp - 0x302]
9:19AD  16                   push ss
9:19AE  50                   push ax
9:19AF  9affff0000           lcall 0, 0xffff  ; USER._wsprintf
9:19B4  83c410               add sp, 0x10
9:19B7  c45e06               les bx, ptr [bp + 6]
9:19BA  26ff7706             push word ptr es:[bx + 6]
9:19BE  68df0f               push 0xfdf
9:19C1  8d86fefc             lea ax, [bp - 0x302]
9:19C5  16                   push ss
9:19C6  50                   push ax
9:19C7  9affff0000           lcall 0, 0xffff  ; USER.SetDlgItemText
loc_19CC:
9:19CC  666aff               push -1
9:19CF  66ff7606             push dword ptr [bp + 6]
9:19D3  90                   nop
9:19D4  0e                   push cs
9:19D5  e89468               call 0x826c  ; OPDialog::position@s9:826C
9:19D8  c45e06               les bx, ptr [bp + 6]
9:19DB  26ff7706             push word ptr es:[bx + 6]
9:19DF  6a05                 push 5
9:19E1  9aaa130000           lcall 0, 0x13aa  ; USER.ShowWindow
9:19E6  c9                   leave
9:19E7  ca0400               retf 4

; ---------------- PreferencesDlg::onOK@s9:19EA size=198 callers=0
;   apis: USER.DestroyWindow, USER.IsDlgButtonChecked
;   (vslot 5) stores animations, turns, sound, music
9:19EA  c8100000             enter 0x10, 0
9:19EE  837e0a00             cmp word ptr [bp + 0xa], 0
9:19F2  0f84a900             je 0x1a9f
9:19F6  c45e06               les bx, ptr [bp + 6]
9:19F9  26ff7706             push word ptr es:[bx + 6]
9:19FD  68db0f               push 0xfdb
9:1A00  9a1f1a0000           lcall 0, 0x1a1f  ; USER.IsDlgButtonChecked
9:1A05  50                   push ax
9:1A06  c45e06               les bx, ptr [bp + 6]
9:1A09  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1A0F  9a9c5d9d1a           lcall 0x1a9d, 0x5d9c  ; Options::setAnims@s3:5D9C
9:1A14  c45e06               les bx, ptr [bp + 6]
9:1A17  26ff7706             push word ptr es:[bx + 6]
9:1A1B  68dc0f               push 0xfdc
9:1A1E  9a3a1a0000           lcall 0, 0x1a3a  ; USER.IsDlgButtonChecked
9:1A23  c45e06               les bx, ptr [bp + 6]
9:1A26  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1A2B  26894720             mov word ptr es:[bx + 0x20], ax
9:1A2F  c45e06               les bx, ptr [bp + 6]
9:1A32  26ff7706             push word ptr es:[bx + 6]
9:1A36  68dd0f               push 0xfdd
9:1A39  9a551a0000           lcall 0, 0x1a55  ; USER.IsDlgButtonChecked
9:1A3E  c45e06               les bx, ptr [bp + 6]
9:1A41  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1A46  26894774             mov word ptr es:[bx + 0x74], ax
9:1A4A  c45e06               les bx, ptr [bp + 6]
9:1A4D  26ff7706             push word ptr es:[bx + 6]
9:1A51  68de0f               push 0xfde
9:1A54  9affff0000           lcall 0, 0xffff  ; USER.IsDlgButtonChecked
9:1A59  c45e06               les bx, ptr [bp + 6]
9:1A5C  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1A61  26894772             mov word ptr es:[bx + 0x72], ax
9:1A65  c45e06               les bx, ptr [bp + 6]
9:1A68  2683bf920000         cmp word ptr es:[bx + 0x92], 0
9:1A6E  7419                 je 0x1a89
9:1A70  666800004000         push 0x400000
9:1A76  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
9:1A7C  052200               add ax, 0x22
9:1A7F  6650                 push eax
9:1A81  9a0649a317           lcall 0x17a3, 0x4906  ; _fmemset@s1:4906
9:1A86  83c408               add sp, 8
loc_1A89:
9:1A89  c45e06               les bx, ptr [bp + 6]
9:1A8C  2683bf940000         cmp word ptr es:[bx + 0x94], 0
9:1A92  740b                 je 0x1a9f
9:1A94  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1A9A  9aa060ed18           lcall 0x18ed, 0x60a0  ; Options::defaultTurns@s3:60A0
loc_1A9F:
9:1A9F  c45e06               les bx, ptr [bp + 6]
9:1AA2  26ff7706             push word ptr es:[bx + 6]
9:1AA6  9a21160000           lcall 0, 0x1621  ; USER.DestroyWindow
9:1AAB  c9                   leave
9:1AAC  ca0600               retf 6
9:1AAF  db 00

; ---------------- PreferencesDlg::onCommand@s9:1AB0 FAR size=78 callers=0
;   (vslot 4) Defaults
9:1AB0  c8040000             enter 4, 0
9:1AB4  66c746fc00000000     mov dword ptr [bp - 4], 0
9:1ABC  8b460e               mov ax, word ptr [bp + 0xe]
9:1ABF  2d3118               sub ax, 0x1831
9:1AC2  751a                 jne 0x1ade
9:1AC4  b80100               mov ax, 1
9:1AC7  c45e06               les bx, ptr [bp + 6]
9:1ACA  2689879200           mov word ptr es:[bx + 0x92], ax
9:1ACF  2689879400           mov word ptr es:[bx + 0x94], ax
9:1AD4  06                   push es
9:1AD5  53                   push bx
9:1AD6  90                   nop
9:1AD7  0e                   push cs
9:1AD8  e8af00               call 0x1b8a  ; PreferencesDlg::defaults@s9:1B8A
9:1ADB  eb17                 jmp 0x1af4
9:1ADD  db 90
loc_1ADE:
9:1ADE  66ff760c             push dword ptr [bp + 0xc]
9:1AE2  66ff7608             push dword ptr [bp + 8]
9:1AE6  ff7606               push word ptr [bp + 6]
9:1AE9  90                   nop
9:1AEA  0e                   push cs
9:1AEB  e84e60               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:1AEE  8946fc               mov word ptr [bp - 4], ax
9:1AF1  8956fe               mov word ptr [bp - 2], dx
loc_1AF4:
9:1AF4  8b46fc               mov ax, word ptr [bp - 4]
9:1AF7  8b56fe               mov dx, word ptr [bp - 2]
9:1AFA  c9                   leave
9:1AFB  ca0a00               retf 0xa

; ---------------- PreferencesDlg::checkButtons@s9:1AFE FAR size=140 callers=1
;   apis: USER.CheckDlgButton
;   CheckDlgButton for each option
9:1AFE  c80c0000             enter 0xc, 0
9:1B02  c45e06               les bx, ptr [bp + 6]
9:1B05  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1B0A  268b471e             mov ax, word ptr es:[bx + 0x1e]
9:1B0E  8946fe               mov word ptr [bp - 2], ax
9:1B11  c45e06               les bx, ptr [bp + 6]
9:1B14  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1B19  268b4720             mov ax, word ptr es:[bx + 0x20]
9:1B1D  8946fc               mov word ptr [bp - 4], ax
9:1B20  c45e06               les bx, ptr [bp + 6]
9:1B23  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1B28  268b4774             mov ax, word ptr es:[bx + 0x74]
9:1B2C  8946fa               mov word ptr [bp - 6], ax
9:1B2F  c45e06               les bx, ptr [bp + 6]
9:1B32  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1B37  268b4772             mov ax, word ptr es:[bx + 0x72]
9:1B3B  8946f8               mov word ptr [bp - 8], ax
9:1B3E  c45e06               les bx, ptr [bp + 6]
9:1B41  26ff7706             push word ptr es:[bx + 6]
9:1B45  68db0f               push 0xfdb
9:1B48  ff76fe               push word ptr [bp - 2]
9:1B4B  9a5e1b0000           lcall 0, 0x1b5e  ; USER.CheckDlgButton
9:1B50  c45e06               les bx, ptr [bp + 6]
9:1B53  26ff7706             push word ptr es:[bx + 6]
9:1B57  68dd0f               push 0xfdd
9:1B5A  ff76fa               push word ptr [bp - 6]
9:1B5D  9a701b0000           lcall 0, 0x1b70  ; USER.CheckDlgButton
9:1B62  c45e06               les bx, ptr [bp + 6]
9:1B65  26ff7706             push word ptr es:[bx + 6]
9:1B69  68de0f               push 0xfde
9:1B6C  ff76f8               push word ptr [bp - 8]
9:1B6F  9a821b0000           lcall 0, 0x1b82  ; USER.CheckDlgButton
9:1B74  c45e06               les bx, ptr [bp + 6]
9:1B77  26ff7706             push word ptr es:[bx + 6]
9:1B7B  68dc0f               push 0xfdc
9:1B7E  ff76fc               push word ptr [bp - 4]
9:1B81  9a850f0000           lcall 0, 0xf85  ; USER.CheckDlgButton
9:1B86  c9                   leave
9:1B87  ca0400               retf 4

; ---------------- PreferencesDlg::defaults@s9:1B8A FAR size=148 callers=1
;   apis: USER.CheckDlgButton
;   the default options
9:1B8A  c8080000             enter 8, 0
9:1B8E  c45e06               les bx, ptr [bp + 6]
9:1B91  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1B97  9ab460ab1b           lcall 0x1bab, 0x60b4  ; Options::canChange1@s3:60B4
9:1B9C  8946fe               mov word ptr [bp - 2], ax
9:1B9F  c45e06               les bx, ptr [bp + 6]
9:1BA2  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1BA8  9ac660bc1b           lcall 0x1bbc, 0x60c6  ; Options::canChange4@s3:60C6
9:1BAD  8946fc               mov word ptr [bp - 4], ax
9:1BB0  c45e06               les bx, ptr [bp + 6]
9:1BB3  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1BB9  9ac060cd1b           lcall 0x1bcd, 0x60c0  ; Options::canChange3@s3:60C0
9:1BBE  8946fa               mov word ptr [bp - 6], ax
9:1BC1  c45e06               les bx, ptr [bp + 6]
9:1BC4  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:1BCA  9aba60121a           lcall 0x1a12, 0x60ba  ; Options::canChange2@s3:60BA
9:1BCF  8946f8               mov word ptr [bp - 8], ax
9:1BD2  c45e06               les bx, ptr [bp + 6]
9:1BD5  26ff7706             push word ptr es:[bx + 6]
9:1BD9  68db0f               push 0xfdb
9:1BDC  ff76fe               push word ptr [bp - 2]
9:1BDF  9af21b0000           lcall 0, 0x1bf2  ; USER.CheckDlgButton
9:1BE4  c45e06               les bx, ptr [bp + 6]
9:1BE7  26ff7706             push word ptr es:[bx + 6]
9:1BEB  68dd0f               push 0xfdd
9:1BEE  ff76fa               push word ptr [bp - 6]
9:1BF1  9a041c0000           lcall 0, 0x1c04  ; USER.CheckDlgButton
9:1BF6  c45e06               les bx, ptr [bp + 6]
9:1BF9  26ff7706             push word ptr es:[bx + 6]
9:1BFD  68de0f               push 0xfde
9:1C00  ff76f8               push word ptr [bp - 8]
9:1C03  9a161c0000           lcall 0, 0x1c16  ; USER.CheckDlgButton
9:1C08  c45e06               les bx, ptr [bp + 6]
9:1C0B  26ff7706             push word ptr es:[bx + 6]
9:1C0F  68dc0f               push 0xfdc
9:1C12  ff76fc               push word ptr [bp - 4]
9:1C15  9a4c1b0000           lcall 0, 0x1b4c  ; USER.CheckDlgButton
9:1C1A  c9                   leave
9:1C1B  ca0400               retf 4

; ---------------- PreferencesDlg::nop@s9:1C1E FAR size=4 callers=0
;   empty virtual
9:1C1E  ca0400               retf 4
9:1C21  db 00

; ---------------- PreferencesDlg::scalar_dtor@s9:1C22 FAR size=146 callers=0
;   deleting destructor
9:1C22  55                   push bp
9:1C23  8bec                 mov bp, sp
9:1C25  66ff7606             push dword ptr [bp + 6]
9:1C29  90                   nop
9:1C2A  0e                   push cs
9:1C2B  e848fc               call 0x1876  ; PreferencesDlg::~PreferencesDlg@s9:1876
9:1C2E  f6460a01             test byte ptr [bp + 0xa], 1
9:1C32  7409                 je 0x1c3d
9:1C34  66ff7606             push dword ptr [bp + 6]
9:1C38  9ace17841a           lcall 0x1a84, 0x17ce  ; operator_delete@s1:17CE
loc_1C3D:
9:1C3D  8b4606               mov ax, word ptr [bp + 6]
9:1C40  8b5608               mov dx, word ptr [bp + 8]
9:1C43  c9                   leave
9:1C44  ca0600               retf 6
9:1C47  db 90 22 1c 52 1c 10 3a b6 17 a2 18 56 1c c0 79 5a
9:1C57  db 1c b0 1a 5e 1c ea 19 62 1c 56 7f 66 1c b2 7b 6a
9:1C67  db 1c 1c 7f 6e 1c 1e 1c 72 1c 86 7f 76 1c 0c 80 7a
9:1C77  db 1c 54 80 7e 1c 5e 7e 82 1c 58 81 86 1c b6 81 8a
9:1C87  db 1c fe 81 92 1c ea 60 9e 1c 4a 82 96 1c 66 82 9a
9:1C97  db 1c de 78 b2 1c ee 60 a2 1c f4 60 a6 1c fa 60 ae
9:1CA7  db 1c a4 a2 93 18 fe 60 f6 17 7e 80 85 18

; ---------------- SoundQueueTestDlg::SoundQueueTestDlg@s9:1CB4 FAR size=112 callers=1
;   dialog 232 "Test of Sound Queue" (debug; vtable 1EEE)
9:1CB4  55                   push bp
9:1CB5  8bec                 mov bp, sp
9:1CB7  ff7612               push word ptr [bp + 0x12]
9:1CBA  68e800               push 0xe8
9:1CBD  66ff760a             push dword ptr [bp + 0xa]
9:1CC1  6a01                 push 1
9:1CC3  66ff7606             push dword ptr [bp + 6]
9:1CC7  90                   nop
9:1CC8  0e                   push cs
9:1CC9  e85c5a               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:1CCC  c45e06               les bx, ptr [bp + 6]
9:1CCF  662bc0               sub eax, eax
9:1CD2  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:1CD8  662689879200         mov dword ptr es:[bx + 0x92], eax
9:1CDE  26c707ee1e           mov word ptr es:[bx], 0x1eee
9:1CE3  26c747024a1c         mov word ptr es:[bx + 2], 0x1c4a  ; SEGMENT s9:0000
9:1CE9  6a02                 push 2
9:1CEB  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:1CF0  9aba200c1d           lcall 0x1d0c, 0x20ba  ; Registry_get@s3:20BA
9:1CF5  c45e06               les bx, ptr [bp + 6]
9:1CF8  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:1CFD  2689979000           mov word ptr es:[bx + 0x90], dx
9:1D02  6a37                 push 0x37
9:1D04  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:1D09  9aba209a1b           lcall 0x1b9a, 0x20ba  ; Registry_get@s3:20BA
9:1D0E  c45e06               les bx, ptr [bp + 6]
9:1D11  2689879200           mov word ptr es:[bx + 0x92], ax
9:1D16  2689979400           mov word ptr es:[bx + 0x94], dx
9:1D1B  8bc3                 mov ax, bx
9:1D1D  8cc2                 mov dx, es
9:1D1F  c9                   leave
9:1D20  ca0e00               retf 0xe
9:1D23  db 00

; ---------------- SoundQueueTestDlg::~SoundQueueTestDlg@s9:1D24 FAR size=44 callers=1
;   dtor
9:1D24  55                   push bp
9:1D25  8bec                 mov bp, sp
9:1D27  c45e06               les bx, ptr [bp + 6]
9:1D2A  26c707ee1e           mov word ptr es:[bx], 0x1eee
9:1D2F  26c74702e71c         mov word ptr es:[bx + 2], 0x1ce7  ; SEGMENT s9:0000
9:1D35  26ff7706             push word ptr es:[bx + 6]
9:1D39  66ff367c5b           push dword ptr [0x5b7c]
9:1D3E  9ae0b6aa1c           lcall 0x1caa, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:1D43  66ff7606             push dword ptr [bp + 6]
9:1D47  90                   nop
9:1D48  0e                   push cs
9:1D49  e8e05a               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:1D4C  c9                   leave
9:1D4D  ca0400               retf 4

; ---------------- SoundQueueTestDlg::init@s9:1D50 FAR size=42 callers=0
;   apis: USER.ShowWindow
;   (vslot 2)
9:1D50  55                   push bp
9:1D51  8bec                 mov bp, sp
9:1D53  66ff7606             push dword ptr [bp + 6]
9:1D57  90                   nop
9:1D58  0e                   push cs
9:1D59  e8865b               call 0x78e2  ; OPDialog::create@s9:78E2
9:1D5C  666aff               push -1
9:1D5F  66ff7606             push dword ptr [bp + 6]
9:1D63  90                   nop
9:1D64  0e                   push cs
9:1D65  e80465               call 0x826c  ; OPDialog::position@s9:826C
9:1D68  c45e06               les bx, ptr [bp + 6]
9:1D6B  26ff7706             push word ptr es:[bx + 6]
9:1D6F  6a05                 push 5
9:1D71  9ae2190000           lcall 0, 0x19e2  ; USER.ShowWindow
9:1D76  c9                   leave
9:1D77  ca0400               retf 4

; ---------------- SoundQueueTestDlg::onOK@s9:1D7A size=262 callers=0
;   apis: USER.DestroyWindow, USER.IsDlgButtonChecked
;   (vslot 5) queues the checked sounds
9:1D7A  c8060000             enter 6, 0
9:1D7E  837e0a00             cmp word ptr [bp + 0xa], 0
9:1D82  740f                 je 0x1d93
9:1D84  c45e06               les bx, ptr [bp + 6]
9:1D87  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:1D8C  26837f7200           cmp word ptr es:[bx + 0x72], 0
9:1D91  7511                 jne 0x1da4
loc_1D93:
9:1D93  c45e06               les bx, ptr [bp + 6]
9:1D96  26ff7706             push word ptr es:[bx + 6]
9:1D9A  9aa71a0000           lcall 0, 0x1aa7  ; USER.DestroyWindow
9:1D9F  c9                   leave
9:1DA0  ca0600               retf 6
9:1DA3  db 90
loc_1DA4:
9:1DA4  c45e06               les bx, ptr [bp + 6]
9:1DA7  26ff7706             push word ptr es:[bx + 6]
9:1DAB  68e100               push 0xe1
9:1DAE  9ad31d0000           lcall 0, 0x1dd3  ; USER.IsDlgButtonChecked
9:1DB3  0bc0                 or ax, ax
9:1DB5  7411                 je 0x1dc8
9:1DB7  68d501               push 0x1d5
9:1DBA  c45e06               les bx, ptr [bp + 6]
9:1DBD  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1DC3  9a30a9ea1d           lcall 0x1dea, 0xa930  ; SoundQueue::add@s2:A930
loc_1DC8:
9:1DC8  c45e06               les bx, ptr [bp + 6]
9:1DCB  26ff7706             push word ptr es:[bx + 6]
9:1DCF  68e200               push 0xe2
9:1DD2  9af71d0000           lcall 0, 0x1df7  ; USER.IsDlgButtonChecked
9:1DD7  0bc0                 or ax, ax
9:1DD9  7411                 je 0x1dec
9:1DDB  68d601               push 0x1d6
9:1DDE  c45e06               les bx, ptr [bp + 6]
9:1DE1  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1DE7  9a30a90e1e           lcall 0x1e0e, 0xa930  ; SoundQueue::add@s2:A930
loc_1DEC:
9:1DEC  c45e06               les bx, ptr [bp + 6]
9:1DEF  26ff7706             push word ptr es:[bx + 6]
9:1DF3  68e300               push 0xe3
9:1DF6  9a1b1e0000           lcall 0, 0x1e1b  ; USER.IsDlgButtonChecked
9:1DFB  0bc0                 or ax, ax
9:1DFD  7411                 je 0x1e10
9:1DFF  68d701               push 0x1d7
9:1E02  c45e06               les bx, ptr [bp + 6]
9:1E05  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1E0B  9a30a9321e           lcall 0x1e32, 0xa930  ; SoundQueue::add@s2:A930
loc_1E10:
9:1E10  c45e06               les bx, ptr [bp + 6]
9:1E13  26ff7706             push word ptr es:[bx + 6]
9:1E17  68e500               push 0xe5
9:1E1A  9a3f1e0000           lcall 0, 0x1e3f  ; USER.IsDlgButtonChecked
9:1E1F  0bc0                 or ax, ax
9:1E21  7411                 je 0x1e34
9:1E23  68d801               push 0x1d8
9:1E26  c45e06               les bx, ptr [bp + 6]
9:1E29  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1E2F  9a30a9561e           lcall 0x1e56, 0xa930  ; SoundQueue::add@s2:A930
loc_1E34:
9:1E34  c45e06               les bx, ptr [bp + 6]
9:1E37  26ff7706             push word ptr es:[bx + 6]
9:1E3B  68e600               push 0xe6
9:1E3E  9a631e0000           lcall 0, 0x1e63  ; USER.IsDlgButtonChecked
9:1E43  0bc0                 or ax, ax
9:1E45  7411                 je 0x1e58
9:1E47  68e201               push 0x1e2
9:1E4A  c45e06               les bx, ptr [bp + 6]
9:1E4D  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1E53  9a30a97a1e           lcall 0x1e7a, 0xa930  ; SoundQueue::add@s2:A930
loc_1E58:
9:1E58  c45e06               les bx, ptr [bp + 6]
9:1E5B  26ff7706             push word ptr es:[bx + 6]
9:1E5F  68e700               push 0xe7
9:1E62  9a011a0000           lcall 0, 0x1a01  ; USER.IsDlgButtonChecked
9:1E67  0bc0                 or ax, ax
9:1E69  7411                 je 0x1e7c
9:1E6B  68dc01               push 0x1dc
9:1E6E  c45e06               les bx, ptr [bp + 6]
9:1E71  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1E77  9a30a94e1c           lcall 0x1c4e, 0xa930  ; SoundQueue::add@s2:A930
loc_1E7C:
9:1E7C  c9                   leave
9:1E7D  ca0600               retf 6

; ---------------- SoundQueueTestDlg::onCommand@s9:1E80 size=68 callers=0
;   (vslot 4) plays the queue
9:1E80  c8040000             enter 4, 0
9:1E84  66c746fc00000000     mov dword ptr [bp - 4], 0
9:1E8C  8b460e               mov ax, word ptr [bp + 0xe]
9:1E8F  2de400               sub ax, 0xe4
9:1E92  7510                 jne 0x1ea4
9:1E94  c45e06               les bx, ptr [bp + 6]
9:1E97  6626ffb79200         push dword ptr es:[bx + 0x92]
9:1E9D  9aeca9c61d           lcall 0x1dc6, 0xa9ec  ; SoundQueue::playNext@s2:A9EC
9:1EA2  eb16                 jmp 0x1eba
loc_1EA4:
9:1EA4  66ff760c             push dword ptr [bp + 0xc]
9:1EA8  66ff7608             push dword ptr [bp + 8]
9:1EAC  ff7606               push word ptr [bp + 6]
9:1EAF  90                   nop
9:1EB0  0e                   push cs
9:1EB1  e8885c               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:1EB4  8946fc               mov word ptr [bp - 4], ax
9:1EB7  8956fe               mov word ptr [bp - 2], dx
loc_1EBA:
9:1EBA  8b46fc               mov ax, word ptr [bp - 4]
9:1EBD  8b56fe               mov dx, word ptr [bp - 2]
9:1EC0  c9                   leave
9:1EC1  ca0a00               retf 0xa

; ---------------- SoundQueueTestDlg::nop@s9:1EC4 FAR size=4 callers=0
;   empty virtual
9:1EC4  ca0400               retf 4
9:1EC7  db 00

; ---------------- SoundQueueTestDlg::scalar_dtor@s9:1EC8 FAR size=146 callers=0
;   deleting destructor
9:1EC8  55                   push bp
9:1EC9  8bec                 mov bp, sp
9:1ECB  66ff7606             push dword ptr [bp + 6]
9:1ECF  90                   nop
9:1ED0  0e                   push cs
9:1ED1  e850fe               call 0x1d24  ; SoundQueueTestDlg::~SoundQueueTestDlg@s9:1D24
9:1ED4  f6460a01             test byte ptr [bp + 0xa], 1
9:1ED8  7409                 je 0x1ee3
9:1EDA  66ff7606             push dword ptr [bp + 6]
9:1EDE  9ace173b1c           lcall 0x1c3b, 0x17ce  ; operator_delete@s1:17CE
loc_1EE3:
9:1EE3  8b4606               mov ax, word ptr [bp + 6]
9:1EE6  8b5608               mov dx, word ptr [bp + 8]
9:1EE9  c9                   leave
9:1EEA  ca0600               retf 6
9:1EED  db 90 c8 1e f8 1e 10 3a a0 1e 50 1d fc 1e c0 79 00
9:1EFD  db 1f 80 1e 04 1f 7a 1d 08 1f 56 7f 0c 1f b2 7b 10
9:1F0D  db 1f 1c 7f 14 1f c4 1e 18 1f 86 7f 1c 1f 0c 80 20
9:1F1D  db 1f 54 80 24 1f 5e 7e 28 1f 58 81 2c 1f b6 81 30
9:1F2D  db 1f fe 81 38 1f ea 60 44 1f 4a 82 3c 1f 66 82 40
9:1F3D  db 1f de 78 58 1f ee 60 48 1f f4 60 4c 1f fa 60 54
9:1F4D  db 1f a4 a2 41 1d fe 60 8e 1c 7e 80 33 1d

; ---------------- AlertDlg::AlertDlg@s9:1F5A FAR size=260 callers=1
;   dialog 4047: an alert's text and picture (vtable 237E)
9:1F5A  c82c0000             enter 0x2c, 0
9:1F5E  57                   push di
9:1F5F  56                   push si
9:1F60  ff760a               push word ptr [bp + 0xa]
9:1F63  66680000cf0f         push 0xfcf0000
9:1F69  666a01               push 1
9:1F6C  66ff7606             push dword ptr [bp + 6]
9:1F70  90                   nop
9:1F71  0e                   push cs
9:1F72  e8b357               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:1F75  c45e06               les bx, ptr [bp + 6]
9:1F78  662bc0               sub eax, eax
9:1F7B  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:1F81  66268987a200         mov dword ptr es:[bx + 0xa2], eax
9:1F87  66268987a600         mov dword ptr es:[bx + 0xa6], eax
9:1F8D  26c7077e23           mov word ptr es:[bx], 0x237e
9:1F92  26c74702f01e         mov word ptr es:[bx + 2], 0x1ef0  ; SEGMENT s9:0000
9:1F98  68cc01               push 0x1cc
9:1F9B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:1FA0  9a0a83cd1f           lcall 0x1fcd, 0x830a  ; ResLibr::picture@s3:830A
9:1FA5  c45e06               les bx, ptr [bp + 6]
9:1FA8  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:1FAD  2689979000           mov word ptr es:[bx + 0x90], dx
9:1FB2  52                   push dx
9:1FB3  26ffb78e00           push word ptr es:[bx + 0x8e]
9:1FB8  9a7247f41e           lcall 0x1ef4, 0x4772  ; DIB::rect@s2:4772
9:1FBD  8946fc               mov word ptr [bp - 4], ax
9:1FC0  8956fe               mov word ptr [bp - 2], dx
9:1FC3  6a48                 push 0x48
9:1FC5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:1FCA  9aba204320           lcall 0x2043, 0x20ba  ; Registry_get@s3:20BA
9:1FCF  8ec2                 mov es, dx
9:1FD1  8bd8                 mov bx, ax
9:1FD3  8946f8               mov word ptr [bp - 8], ax
9:1FD6  8c46fa               mov word ptr [bp - 6], es
9:1FD9  268b470a             mov ax, word ptr es:[bx + 0xa]
9:1FDD  8946f6               mov word ptr [bp - 0xa], ax
9:1FE0  268b470c             mov ax, word ptr es:[bx + 0xc]
9:1FE4  8946f4               mov word ptr [bp - 0xc], ax
9:1FE7  c746ec0a00           mov word ptr [bp - 0x14], 0xa
9:1FEC  c45efc               les bx, ptr [bp - 4]
9:1FEF  268b4708             mov ax, word ptr es:[bx + 8]
9:1FF3  050a00               add ax, 0xa
9:1FF6  8946ee               mov word ptr [bp - 0x12], ax
9:1FF9  268b4704             mov ax, word ptr es:[bx + 4]
9:1FFD  2d0a00               sub ax, 0xa
9:2000  8946f0               mov word ptr [bp - 0x10], ax
9:2003  c746f2d601           mov word ptr [bp - 0xe], 0x1d6
9:2008  c45e06               les bx, ptr [bp + 6]
9:200B  8dbf9200             lea di, [bx + 0x92]
9:200F  8d76ec               lea si, [bp - 0x14]
9:2012  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:2014  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:2016  8b5e06               mov bx, word ptr [bp + 6]
9:2019  8dbf9a00             lea di, [bx + 0x9a]
9:201D  8d76ec               lea si, [bp - 0x14]
9:2020  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:2022  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:2024  8b5e06               mov bx, word ptr [bp + 6]
9:2027  2683879c0014         add word ptr es:[bx + 0x9c], 0x14
9:202D  8d87a200             lea ax, [bx + 0xa2]
9:2031  06                   push es
9:2032  50                   push ax
9:2033  8d87a600             lea ax, [bx + 0xa6]
9:2037  06                   push es
9:2038  50                   push ax
9:2039  6a2b                 push 0x2b
9:203B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:2040  9aba205020           lcall 0x2050, 0x20ba  ; Registry_get@s3:20BA
9:2045  8946e8               mov word ptr [bp - 0x18], ax
9:2048  8956ea               mov word ptr [bp - 0x16], dx
9:204B  52                   push dx
9:204C  50                   push ax
9:204D  9a3805f31c           lcall 0x1cf3, 0x538  ; Alerts::describe@s3:0538
9:2052  8b4606               mov ax, word ptr [bp + 6]
9:2055  8b5608               mov dx, word ptr [bp + 8]
9:2058  5e                   pop si
9:2059  5f                   pop di
9:205A  c9                   leave
9:205B  ca0600               retf 6

; ---------------- AlertDlg::~AlertDlg@s9:205E FAR size=118 callers=1
;   dtor
9:205E  c8100000             enter 0x10, 0
9:2062  56                   push si
9:2063  c45e06               les bx, ptr [bp + 6]
9:2066  26c7077e23           mov word ptr es:[bx], 0x237e
9:206B  26c74702961f         mov word ptr es:[bx + 2], 0x1f96  ; SEGMENT s9:0000
9:2071  268b878e00           mov ax, word ptr es:[bx + 0x8e]
9:2076  268b979000           mov dx, word ptr es:[bx + 0x90]
9:207B  8bda                 mov bx, dx
9:207D  0bd0                 or dx, ax
9:207F  740e                 je 0x208f
9:2081  6a01                 push 1
9:2083  53                   push bx
9:2084  50                   push ax
9:2085  8ec3                 mov es, bx
9:2087  8bf0                 mov si, ax
9:2089  26c41c               les bx, ptr es:[si]
9:208C  26ff1f               lcall es:[bx]
loc_208F:
9:208F  c45e06               les bx, ptr [bp + 6]
9:2092  66268b87a200         mov eax, dword ptr es:[bx + 0xa2]
9:2098  6650                 push eax
9:209A  9ace17b020           lcall 0x20b0, 0x17ce  ; operator_delete@s1:17CE
9:209F  83c404               add sp, 4
9:20A2  c45e06               les bx, ptr [bp + 6]
9:20A5  66268b87a600         mov eax, dword ptr es:[bx + 0xa6]
9:20AB  6650                 push eax
9:20AD  9ace17e11e           lcall 0x1ee1, 0x17ce  ; operator_delete@s1:17CE
9:20B2  83c404               add sp, 4
9:20B5  c45e06               les bx, ptr [bp + 6]
9:20B8  26ff7706             push word ptr es:[bx + 6]
9:20BC  66ff367c5b           push dword ptr [0x5b7c]
9:20C1  9ae0b6501f           lcall 0x1f50, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:20C6  66ff7606             push dword ptr [bp + 6]
9:20CA  90                   nop
9:20CB  0e                   push cs
9:20CC  e85d57               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:20CF  5e                   pop si
9:20D0  c9                   leave
9:20D1  ca0400               retf 4

; ---------------- AlertDlg::init@s9:20D4 size=258 callers=0
;   apis: USER.CreateWindow, USER.GetClientRect, USER.SetWindowPos
;   (vslot 2) sizes to the picture, an OPButton
9:20D4  c8340000             enter 0x34, 0
9:20D8  66ff7606             push dword ptr [bp + 6]
9:20DC  90                   nop
9:20DD  0e                   push cs
9:20DE  e80158               call 0x78e2  ; OPDialog::create@s9:78E2
9:20E1  6a48                 push 0x48
9:20E3  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:20E8  9aba206621           lcall 0x2166, 0x20ba  ; Registry_get@s3:20BA
9:20ED  8ec2                 mov es, dx
9:20EF  8bd8                 mov bx, ax
9:20F1  8946f4               mov word ptr [bp - 0xc], ax
9:20F4  8c46f6               mov word ptr [bp - 0xa], es
9:20F7  268b470a             mov ax, word ptr es:[bx + 0xa]
9:20FB  8946fa               mov word ptr [bp - 6], ax
9:20FE  268b470c             mov ax, word ptr es:[bx + 0xc]
9:2102  8946f8               mov word ptr [bp - 8], ax
9:2105  c45e06               les bx, ptr [bp + 6]
9:2108  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:210E  9a7247bb1f           lcall 0x1fbb, 0x4772  ; DIB::rect@s2:4772
9:2113  8946f0               mov word ptr [bp - 0x10], ax
9:2116  8956f2               mov word ptr [bp - 0xe], dx
9:2119  8b46fa               mov ax, word ptr [bp - 6]
9:211C  c45ef0               les bx, ptr [bp - 0x10]
9:211F  268b4f04             mov cx, word ptr es:[bx + 4]
9:2123  2bc1                 sub ax, cx
9:2125  99                   cdq
9:2126  2bc2                 sub ax, dx
9:2128  d1f8                 sar ax, 1
9:212A  8946fe               mov word ptr [bp - 2], ax
9:212D  c45e06               les bx, ptr [bp + 6]
9:2130  26ff7706             push word ptr es:[bx + 6]
9:2134  6a00                 push 0
9:2136  50                   push ax
9:2137  b80500               mov ax, 5
9:213A  8946fc               mov word ptr [bp - 4], ax
9:213D  50                   push ax
9:213E  51                   push cx
9:213F  66680600d601         push 0x1d60006
9:2145  9acd210000           lcall 0, 0x21cd  ; USER.SetWindowPos
9:214A  c45e06               les bx, ptr [bp + 6]
9:214D  26ff7706             push word ptr es:[bx + 6]
9:2151  8d46e4               lea ax, [bp - 0x1c]
9:2154  16                   push ss
9:2155  50                   push ax
9:2156  9affff0000           lcall 0, 0xffff  ; USER.GetClientRect
9:215B  689205               push 0x592
9:215E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:2163  9a7e84a31f           lcall 0x1fa3, 0x847e  ; LoadStringRes@s3:847E
9:2168  8946e0               mov word ptr [bp - 0x20], ax
9:216B  8956e2               mov word ptr [bp - 0x1e], dx
9:216E  1e                   push ds
9:216F  68e45c               push 0x5ce4  ; 'OPButton'
9:2172  52                   push dx
9:2173  50                   push ax
9:2174  66b801000150         mov eax, 0x50010001
9:217A  668946ec             mov dword ptr [bp - 0x14], eax
9:217E  6650                 push eax
9:2180  8b46e8               mov ax, word ptr [bp - 0x18]
9:2183  2d5800               sub ax, 0x58
9:2186  99                   cdq
9:2187  2bc2                 sub ax, dx
9:2189  d1f8                 sar ax, 1
9:218B  50                   push ax
9:218C  8b46ea               mov ax, word ptr [bp - 0x16]
9:218F  2d2800               sub ax, 0x28
9:2192  50                   push ax
9:2193  666819005800         push 0x580019
9:2199  c45e06               les bx, ptr [bp + 6]
9:219C  26ff7706             push word ptr es:[bx + 6]
9:21A0  6a01                 push 1
9:21A2  ff368c03             push word ptr [0x38c]
9:21A6  666a00               push 0
9:21A9  9affff0000           lcall 0, 0xffff  ; USER.CreateWindow
9:21AE  c45e06               les bx, ptr [bp + 6]
9:21B1  26ff7706             push word ptr es:[bx + 6]
9:21B5  6a00                 push 0
9:21B7  ff76fe               push word ptr [bp - 2]
9:21BA  6a05                 push 5
9:21BC  c45ef0               les bx, ptr [bp - 0x10]
9:21BF  26ff7704             push word ptr es:[bx + 4]
9:21C3  8b46f8               mov ax, word ptr [bp - 8]
9:21C6  2d0a00               sub ax, 0xa
9:21C9  50                   push ax
9:21CA  6a45                 push 0x45
9:21CC  9a79160000           lcall 0, 0x1679  ; USER.SetWindowPos
9:21D1  c9                   leave
9:21D2  ca0400               retf 4
9:21D5  db 00

; ---------------- AlertDlg::paint@s9:21D6 FAR size=386 callers=0
;   apis: GDI.DeleteObject, GDI.SelectObject, GDI.SetBkColor, GDI.SetTextColor, USER.BeginPaint, USER.DrawText, USER.EndPaint, USER.GetProp, USER.SelectPalette
;   (vslot 24) the text
9:21D6  c8440000             enter 0x44, 0
9:21DA  c45e06               les bx, ptr [bp + 6]
9:21DD  26ff7706             push word ptr es:[bx + 6]
9:21E1  8d46e0               lea ax, [bp - 0x20]
9:21E4  16                   push ss
9:21E5  50                   push ax
9:21E6  9affff0000           lcall 0, 0xffff  ; USER.BeginPaint
9:21EB  8946de               mov word ptr [bp - 0x22], ax
9:21EE  c41e3042             les bx, ptr [0x4230]
9:21F2  66268b470e           mov eax, dword ptr es:[bx + 0xe]
9:21F7  668946da             mov dword ptr [bp - 0x26], eax
9:21FB  8d46de               lea ax, [bp - 0x22]
9:21FE  16                   push ss
9:21FF  50                   push ax
9:2200  66ff76da             push dword ptr [bp - 0x26]
9:2204  9a084e3022           lcall 0x2230, 0x4e08  ; Palette::selectAndRealize@s2:4E08
9:2209  8946d8               mov word ptr [bp - 0x28], ax
9:220C  8d46de               lea ax, [bp - 0x22]
9:220F  16                   push ss
9:2210  50                   push ax
9:2211  666aff               push -1
9:2214  c45e06               les bx, ptr [bp + 6]
9:2217  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:221D  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:2222  26c41f               les bx, ptr es:[bx]
9:2225  26ff5f04             lcall es:[bx + 4]
9:2229  66ff76da             push dword ptr [bp - 0x26]
9:222D  9a724d1121           lcall 0x2111, 0x4d72  ; MemBlock::data@s2:4D72
9:2232  8946d4               mov word ptr [bp - 0x2c], ax
9:2235  8956d6               mov word ptr [bp - 0x2a], dx
9:2238  c45ed4               les bx, ptr [bp - 0x2c]
9:223B  2ac0                 sub al, al
9:223D  268aa7e503           mov ah, byte ptr es:[bx + 0x3e5]
9:2242  268a8fe603           mov cl, byte ptr es:[bx + 0x3e6]
9:2247  2aed                 sub ch, ch
9:2249  0bc1                 or ax, cx
9:224B  268a8fe403           mov cl, byte ptr es:[bx + 0x3e4]
9:2250  b502                 mov ch, 2
9:2252  8946d0               mov word ptr [bp - 0x30], ax
9:2255  894ed2               mov word ptr [bp - 0x2e], cx
9:2258  ff76de               push word ptr [bp - 0x22]
9:225B  666a00               push 0
9:225E  9a1c230000           lcall 0, 0x231c  ; GDI.SetBkColor
9:2263  8946cc               mov word ptr [bp - 0x34], ax
9:2266  8956ce               mov word ptr [bp - 0x32], dx
9:2269  ff76de               push word ptr [bp - 0x22]
9:226C  66ff76d0             push dword ptr [bp - 0x30]
9:2270  9ae4220000           lcall 0, 0x22e4  ; GDI.SetTextColor
9:2275  8946c8               mov word ptr [bp - 0x38], ax
9:2278  8956ca               mov word ptr [bp - 0x36], dx
9:227B  c746c40000           mov word ptr [bp - 0x3c], 0
9:2280  c45e06               les bx, ptr [bp + 6]
9:2283  26ff7706             push word ptr es:[bx + 6]
9:2287  1e                   push ds
9:2288  68ed5c               push 0x5ced  ; 'hfont'
9:228B  9affff0000           lcall 0, 0xffff  ; USER.GetProp
9:2290  8946c6               mov word ptr [bp - 0x3a], ax
9:2293  0bc0                 or ax, ax
9:2295  740c                 je 0x22a3
9:2297  ff76de               push word ptr [bp - 0x22]
9:229A  50                   push ax
9:229B  9a10230000           lcall 0, 0x2310  ; GDI.SelectObject
9:22A0  8946c4               mov word ptr [bp - 0x3c], ax
loc_22A3:
9:22A3  ff76de               push word ptr [bp - 0x22]
9:22A6  c45e06               les bx, ptr [bp + 6]
9:22A9  6626ffb7a200         push dword ptr es:[bx + 0xa2]
9:22AF  6aff                 push -1
9:22B1  8d879200             lea ax, [bx + 0x92]
9:22B5  06                   push es
9:22B6  50                   push ax
9:22B7  6a10                 push 0x10
9:22B9  9aff220000           lcall 0, 0x22ff  ; USER.DrawText
9:22BE  c45ed4               les bx, ptr [bp - 0x2c]
9:22C1  2ac0                 sub al, al
9:22C3  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:22C8  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:22CD  2aed                 sub ch, ch
9:22CF  0bc1                 or ax, cx
9:22D1  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:22D6  b502                 mov ch, 2
9:22D8  8946d0               mov word ptr [bp - 0x30], ax
9:22DB  894ed2               mov word ptr [bp - 0x2e], cx
9:22DE  ff76de               push word ptr [bp - 0x22]
9:22E1  51                   push cx
9:22E2  50                   push ax
9:22E3  9a28230000           lcall 0, 0x2328  ; GDI.SetTextColor
9:22E8  ff76de               push word ptr [bp - 0x22]
9:22EB  c45e06               les bx, ptr [bp + 6]
9:22EE  6626ffb7a600         push dword ptr es:[bx + 0xa6]
9:22F4  6aff                 push -1
9:22F6  8d879a00             lea ax, [bx + 0x9a]
9:22FA  06                   push es
9:22FB  50                   push ax
9:22FC  6a10                 push 0x10
9:22FE  9affff0000           lcall 0, 0xffff  ; USER.DrawText
9:2303  837ec600             cmp word ptr [bp - 0x3a], 0
9:2307  740b                 je 0x2314
9:2309  ff76de               push word ptr [bp - 0x22]
9:230C  ff76c4               push word ptr [bp - 0x3c]
9:230F  9affff0000           lcall 0, 0xffff  ; GDI.SelectObject
loc_2314:
9:2314  ff76de               push word ptr [bp - 0x22]
9:2317  66ff76cc             push dword ptr [bp - 0x34]
9:231B  9a510d0000           lcall 0, 0xd51  ; GDI.SetBkColor
9:2320  ff76de               push word ptr [bp - 0x22]
9:2323  66ff76c8             push dword ptr [bp - 0x38]
9:2327  9a430d0000           lcall 0, 0xd43  ; GDI.SetTextColor
9:232C  ff76de               push word ptr [bp - 0x22]
9:232F  ff76d8               push word ptr [bp - 0x28]
9:2332  6a00                 push 0
9:2334  9affff0000           lcall 0, 0xffff  ; USER.SelectPalette
9:2339  50                   push ax
9:233A  9affff0000           lcall 0, 0xffff  ; GDI.DeleteObject
9:233F  c45e06               les bx, ptr [bp + 6]
9:2342  26ff7706             push word ptr es:[bx + 6]
9:2346  8d46e0               lea ax, [bp - 0x20]
9:2349  16                   push ss
9:234A  50                   push ax
9:234B  9affff0000           lcall 0, 0xffff  ; USER.EndPaint
9:2350  b80100               mov ax, 1
9:2353  c9                   leave
9:2354  ca0400               retf 4
9:2357  db 00

; ---------------- AlertDlg::scalar_dtor@s9:2358 FAR size=146 callers=0
;   deleting destructor
9:2358  55                   push bp
9:2359  8bec                 mov bp, sp
9:235B  66ff7606             push dword ptr [bp + 6]
9:235F  90                   nop
9:2360  0e                   push cs
9:2361  e8fafc               call 0x205e  ; AlertDlg::~AlertDlg@s9:205E
9:2364  f6460a01             test byte ptr [bp + 0xa], 1
9:2368  7409                 je 0x2373
9:236A  66ff7606             push dword ptr [bp + 6]
9:236E  9ace179d20           lcall 0x209d, 0x17ce  ; operator_delete@s1:17CE
loc_2373:
9:2373  8b4606               mov ax, word ptr [bp + 6]
9:2376  8b5608               mov dx, word ptr [bp + 8]
9:2379  c9                   leave
9:237A  ca0600               retf 6
9:237D  db 90 58 23 88 23 10 3a 07 22 d4 20 8c 23 c0 79 90
9:238D  db 23 3c 7b 94 23 98 7b 98 23 56 7f 9c 23 b2 7b a0
9:239D  db 23 1c 7f a4 23 12 82 a8 23 86 7f ac 23 0c 80 b0
9:23AD  db 23 54 80 b4 23 5e 7e b8 23 58 81 bc 23 b6 81 c0
9:23BD  db 23 fe 81 c8 23 ea 60 d4 23 4a 82 cc 23 66 82 d0
9:23CD  db 23 de 78 e0 23 ee 60 d8 23 f4 60 dc 23 fa 60 e4
9:23DD  db 23 d6 21 e8 23 fe 60 34 1f 7e 80 6f 20

; ---------------- StarSelectionDlg::StarSelectionDlg@s9:23EA FAR size=122 callers=1
;   dialog 4029 "Star Selection" (vtable 2956)
9:23EA  c8040000             enter 4, 0
9:23EE  ff7612               push word ptr [bp + 0x12]
9:23F1  68bd0f               push 0xfbd
9:23F4  66ff760a             push dword ptr [bp + 0xa]
9:23F8  689a00               push 0x9a
9:23FB  66ff7606             push dword ptr [bp + 6]
9:23FF  90                   nop
9:2400  0e                   push cs
9:2401  e82453               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:2404  c45e06               les bx, ptr [bp + 6]
9:2407  662bc0               sub eax, eax
9:240A  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:2410  2689879200           mov word ptr es:[bx + 0x92], ax
9:2415  2689879400           mov word ptr es:[bx + 0x94], ax
9:241A  26c7075629           mov word ptr es:[bx], 0x2956
9:241F  26c747028023         mov word ptr es:[bx + 2], 0x2380  ; SEGMENT s9:0000
9:2425  26c7878a002600       mov word ptr es:[bx + 0x8a], 0x26
9:242C  6a06                 push 6
9:242E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:2433  9aba20eb20           lcall 0x20eb, 0x20ba  ; Registry_get@s3:20BA
9:2438  c45e06               les bx, ptr [bp + 6]
9:243B  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:2440  2689979000           mov word ptr es:[bx + 0x90], dx
9:2445  c45e06               les bx, ptr [bp + 6]
9:2448  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:244D  268b4728             mov ax, word ptr es:[bx + 0x28]
9:2451  c45e06               les bx, ptr [bp + 6]
9:2454  2689879200           mov word ptr es:[bx + 0x92], ax
9:2459  8b4606               mov ax, word ptr [bp + 6]
9:245C  8b5608               mov dx, word ptr [bp + 8]
9:245F  c9                   leave
9:2460  ca0e00               retf 0xe
9:2463  db 00

; ---------------- StarSelectionDlg::~StarSelectionDlg@s9:2464 FAR size=44 callers=1
;   dtor
9:2464  55                   push bp
9:2465  8bec                 mov bp, sp
9:2467  c45e06               les bx, ptr [bp + 6]
9:246A  26c7075629           mov word ptr es:[bx], 0x2956
9:246F  26c747022324         mov word ptr es:[bx + 2], 0x2423  ; SEGMENT s9:0000
9:2475  26ff7706             push word ptr es:[bx + 6]
9:2479  66ff367c5b           push dword ptr [0x5b7c]
9:247E  9ae0b6c420           lcall 0x20c4, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:2483  66ff7606             push dword ptr [bp + 6]
9:2487  90                   nop
9:2488  0e                   push cs
9:2489  e8a053               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:248C  c9                   leave
9:248D  ca0400               retf 4

; ---------------- StarSelectionDlg::init@s9:2490 size=130 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.ShowWindow
;   (vslot 2) the star buttons
9:2490  c8040000             enter 4, 0
9:2494  66ff7606             push dword ptr [bp + 6]
9:2498  90                   nop
9:2499  0e                   push cs
9:249A  e84554               call 0x78e2  ; OPDialog::create@s9:78E2
9:249D  c45e06               les bx, ptr [bp + 6]
9:24A0  26ff7706             push word ptr es:[bx + 6]
9:24A4  68b10f               push 0xfb1
9:24A7  9ac9130000           lcall 0, 0x13c9  ; USER.GetDlgItem
9:24AC  50                   push ax
9:24AD  6a00                 push 0
9:24AF  9aaa0f0000           lcall 0, 0xfaa  ; USER.EnableWindow
9:24B4  c45e06               les bx, ptr [bp + 6]
9:24B7  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:24BD  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:24C2  26c41f               les bx, ptr es:[bx]
9:24C5  26ff5f10             lcall es:[bx + 0x10]
9:24C9  8946fc               mov word ptr [bp - 4], ax
9:24CC  8956fe               mov word ptr [bp - 2], dx
9:24CF  c45efc               les bx, ptr [bp - 4]
9:24D2  268b4704             mov ax, word ptr es:[bx + 4]
9:24D6  260307               add ax, word ptr es:[bx]
9:24D9  050300               add ax, 3
9:24DC  50                   push ax
9:24DD  268b4702             mov ax, word ptr es:[bx + 2]
9:24E1  2d0200               sub ax, 2
9:24E4  50                   push ax
9:24E5  66ff7606             push dword ptr [bp + 6]
9:24E9  90                   nop
9:24EA  0e                   push cs
9:24EB  e87e5d               call 0x826c  ; OPDialog::position@s9:826C
9:24EE  c45e06               les bx, ptr [bp + 6]
9:24F1  26ff7706             push word ptr es:[bx + 6]
9:24F5  6a05                 push 5
9:24F7  9a721d0000           lcall 0, 0x1d72  ; USER.ShowWindow
9:24FC  68a001               push 0x1a0
9:24FF  c45e06               les bx, ptr [bp + 6]
9:2502  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:2508  9a9a1cc423           lcall 0x23c4, 0x1c9a  ; StarMapModel::selectButton@s4:1C9A
9:250D  c9                   leave
9:250E  ca0400               retf 4
9:2511  db 00

; ---------------- StarSelectionDlg::onCommand@s9:2512 FAR size=698 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.IsDlgButtonChecked, USER.IsWindowEnabled, USER.PostMessage, USER.SetDlgItemText
;   (vslot 4) star check boxes, Launch (too many targets: 1404), star voices
9:2512  c81e0000             enter 0x1e, 0
9:2516  56                   push si
9:2517  66c746fc00000000     mov dword ptr [bp - 4], 0
9:251F  8b460e               mov ax, word ptr [bp + 0xe]
9:2522  48                   dec ax
9:2523  48                   dec ax
9:2524  0f844501             je 0x266d
9:2528  2d9e01               sub ax, 0x19e
9:252B  720c                 jb 0x2539
9:252D  2d1400               sub ax, 0x14
9:2530  760e                 jbe 0x2540
9:2532  2dfd0d               sub ax, 0xdfd
9:2535  0f843f01             je 0x2678
loc_2539:
9:2539  ff760e               push word ptr [bp + 0xe]
9:253C  e96e02               jmp 0x27ad
9:253F  db 90
loc_2540:
9:2540  c45e06               les bx, ptr [bp + 6]
9:2543  26ff7706             push word ptr es:[bx + 6]
9:2547  ff760e               push word ptr [bp + 0xe]
9:254A  9a60270000           lcall 0, 0x2760  ; USER.IsDlgButtonChecked
9:254F  0bc0                 or ax, ax
9:2551  0f848f00             je 0x25e4
9:2555  c45e06               les bx, ptr [bp + 6]
9:2558  26ff8f9200           dec word ptr es:[bx + 0x92]
9:255D  26ff7706             push word ptr es:[bx + 6]
9:2561  68b10f               push 0xfb1
9:2564  9a7e250000           lcall 0, 0x257e  ; USER.GetDlgItem
9:2569  50                   push ax
9:256A  9affff0000           lcall 0, 0xffff  ; USER.IsWindowEnabled
9:256F  0bc0                 or ax, ax
9:2571  7517                 jne 0x258a
9:2573  c45e06               les bx, ptr [bp + 6]
9:2576  26ff7706             push word ptr es:[bx + 6]
9:257A  68b10f               push 0xfb1
9:257D  9a19260000           lcall 0, 0x2619  ; USER.GetDlgItem
9:2582  50                   push ax
9:2583  6a01                 push 1
9:2585  9a21260000           lcall 0, 0x2621  ; USER.EnableWindow
loc_258A:
9:258A  c45e06               les bx, ptr [bp + 6]
9:258D  2683bf920000         cmp word ptr es:[bx + 0x92], 0
9:2593  7f07                 jg 0x259c
9:2595  26c78794000100       mov word ptr es:[bx + 0x94], 1
loc_259C:
9:259C  ff760e               push word ptr [bp + 0xe]
9:259F  c45e06               les bx, ptr [bp + 6]
9:25A2  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:25A8  9a9a1cbb25           lcall 0x25bb, 0x1c9a  ; StarMapModel::selectButton@s4:1C9A
9:25AD  6aff                 push -1
9:25AF  c45e06               les bx, ptr [bp + 6]
9:25B2  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:25B8  9a781e0b25           lcall 0x250b, 0x1e78  ; starText@s4:1E78
9:25BD  8946f8               mov word ptr [bp - 8], ax
9:25C0  8956fa               mov word ptr [bp - 6], dx
9:25C3  0bd0                 or dx, ax
9:25C5  7409                 je 0x25d0
9:25C7  c45ef8               les bx, ptr [bp - 8]
9:25CA  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:25CE  eb02                 jmp 0x25d2
loc_25D0:
9:25D0  33c0                 xor ax, ax
loc_25D2:
9:25D2  8946f6               mov word ptr [bp - 0xa], ax
9:25D5  50                   push ax
9:25D6  6a01                 push 1
9:25D8  66ff36a002           push dword ptr [0x2a0]
9:25DD  9a7c5c2127           lcall 0x2721, 0x5c7c  ; SoundMgr::playVoice@s2:5C7C
9:25E2  eb41                 jmp 0x2625
loc_25E4:
9:25E4  c45e06               les bx, ptr [bp + 6]
9:25E7  26ff879200           inc word ptr es:[bx + 0x92]
9:25EC  2683bf920000         cmp word ptr es:[bx + 0x92], 0
9:25F2  7e07                 jle 0x25fb
9:25F4  26c78794000000       mov word ptr es:[bx + 0x94], 0
loc_25FB:
9:25FB  c45e06               les bx, ptr [bp + 6]
9:25FE  268b879200           mov ax, word ptr es:[bx + 0x92]
9:2603  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:2608  26394728             cmp word ptr es:[bx + 0x28], ax
9:260C  7517                 jne 0x2625
9:260E  c45e06               les bx, ptr [bp + 6]
9:2611  26ff7706             push word ptr es:[bx + 6]
9:2615  68b10f               push 0xfb1
9:2618  9aa8240000           lcall 0, 0x24a8  ; USER.GetDlgItem
9:261D  50                   push ax
9:261E  6a00                 push 0
9:2620  9ab0240000           lcall 0, 0x24b0  ; USER.EnableWindow
loc_2625:
9:2625  c45e06               les bx, ptr [bp + 6]
9:2628  2683bf920000         cmp word ptr es:[bx + 0x92], 0
9:262E  7c3d                 jl 0x266d
9:2630  268b879200           mov ax, word ptr es:[bx + 0x92]
9:2635  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:263A  26394728             cmp word ptr es:[bx + 0x28], ax
9:263E  7c2d                 jl 0x266d
9:2640  c45e06               les bx, ptr [bp + 6]
9:2643  26ffb79200           push word ptr es:[bx + 0x92]
9:2648  1e                   push ds
9:2649  68f45c               push 0x5cf4
9:264C  8d46ec               lea ax, [bp - 0x14]
9:264F  16                   push ss
9:2650  50                   push ax
9:2651  9a9c3f8926           lcall 0x2689, 0x3f9c  ; _fsprintf@s1:3F9C
9:2656  83c40a               add sp, 0xa
9:2659  c45e06               les bx, ptr [bp + 6]
9:265C  26ff7706             push word ptr es:[bx + 6]
9:2660  68b20f               push 0xfb2
9:2663  8d46ec               lea ax, [bp - 0x14]
9:2666  16                   push ss
9:2667  50                   push ax
9:2668  9a34190000           lcall 0, 0x1934  ; USER.SetDlgItemText
loc_266D:
9:266D  66c746fc01000000     mov dword ptr [bp - 4], 1
9:2675  e94801               jmp 0x27c0
loc_2678:
9:2678  c45e06               les bx, ptr [bp + 6]
9:267B  2683bf920000         cmp word ptr es:[bx + 0x92], 0
9:2681  7d4b                 jge 0x26ce
9:2683  68b400               push 0xb4
9:2686  9a9c17dc26           lcall 0x26dc, 0x179c  ; operator_new@s1:179C
9:268B  83c402               add sp, 2
9:268E  8946e8               mov word ptr [bp - 0x18], ax
9:2691  8956ea               mov word ptr [bp - 0x16], dx
9:2694  0bd0                 or dx, ax
9:2696  741e                 je 0x26b6
9:2698  66687b057c05         push 0x57c057b
9:269E  666830000200         push 0x20030
9:26A4  ff369603             push word ptr [0x396]
9:26A8  ff76ea               push word ptr [bp - 0x16]
9:26AB  50                   push ax
9:26AC  90                   nop
9:26AD  0e                   push cs
9:26AE  e86f5e               call 0x8520  ; OPMessageBox::OPMessageBox(ids)@s9:8520
9:26B1  83c40e               add sp, 0xe
9:26B4  eb03                 jmp 0x26b9
loc_26B6:
9:26B6  33c0                 xor ax, ax
9:26B8  99                   cdq
loc_26B9:
9:26B9  8946f8               mov word ptr [bp - 8], ax
9:26BC  8956fa               mov word ptr [bp - 6], dx
9:26BF  52                   push dx
9:26C0  c45ef8               les bx, ptr [bp - 8]
9:26C3  50                   push ax
9:26C4  26c41f               les bx, ptr es:[bx]
9:26C7  26ff5f74             lcall es:[bx + 0x74]
9:26CB  e9f200               jmp 0x27c0
loc_26CE:
9:26CE  2683bf920000         cmp word ptr es:[bx + 0x92], 0
9:26D4  7e68                 jle 0x273e
9:26D6  68b400               push 0xb4
9:26D9  9a9c177123           lcall 0x2371, 0x179c  ; operator_new@s1:179C
9:26DE  83c402               add sp, 2
9:26E1  8946e8               mov word ptr [bp - 0x18], ax
9:26E4  8956ea               mov word ptr [bp - 0x16], dx
9:26E7  0bd0                 or dx, ax
9:26E9  741f                 je 0x270a
9:26EB  66687b057d05         push 0x57d057b
9:26F1  666821000200         push 0x20021
9:26F7  ff369603             push word ptr [0x396]
9:26FB  ff76ea               push word ptr [bp - 0x16]
9:26FE  50                   push ax
9:26FF  90                   nop
9:2700  0e                   push cs
9:2701  e81c5e               call 0x8520  ; OPMessageBox::OPMessageBox(ids)@s9:8520
9:2704  83c40e               add sp, 0xe
9:2707  eb04                 jmp 0x270d
9:2709  db 90
loc_270A:
9:270A  33c0                 xor ax, ax
9:270C  99                   cdq
loc_270D:
9:270D  8946f8               mov word ptr [bp - 8], ax
9:2710  8956fa               mov word ptr [bp - 6], dx
9:2713  66680100c200         push 0xc20001
9:2719  8d46e4               lea ax, [bp - 0x1c]
9:271C  16                   push ss
9:271D  50                   push ax
9:271E  9a1a948423           lcall 0x2384, 0x941a  ; Pair::Pair(a,b)@s2:941A
9:2723  8d46e4               lea ax, [bp - 0x1c]
9:2726  16                   push ss
9:2727  50                   push ax
9:2728  c45ef8               les bx, ptr [bp - 8]
9:272B  06                   push es
9:272C  53                   push bx
9:272D  26c41f               les bx, ptr es:[bx]
9:2730  26ff5f6c             lcall es:[bx + 0x6c]
9:2734  8946e2               mov word ptr [bp - 0x1e], ax
9:2737  3d0200               cmp ax, 2
9:273A  0f848200             je 0x27c0
loc_273E:
9:273E  6a06                 push 6
9:2740  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:2745  9aba203624           lcall 0x2436, 0x20ba  ; Registry_get@s3:20BA
9:274A  8946ec               mov word ptr [bp - 0x14], ax
9:274D  8956ee               mov word ptr [bp - 0x12], dx
9:2750  c746f6a001           mov word ptr [bp - 0xa], 0x1a0
loc_2755:
9:2755  c45e06               les bx, ptr [bp + 6]
9:2758  26ff7706             push word ptr es:[bx + 6]
9:275C  ff76f6               push word ptr [bp - 0xa]
9:275F  9aaf1d0000           lcall 0, 0x1daf  ; USER.IsDlgButtonChecked
9:2764  48                   dec ax
9:2765  7514                 jne 0x277b
9:2767  8b46f6               mov ax, word ptr [bp - 0xa]
9:276A  c45eec               les bx, ptr [bp - 0x14]
9:276D  268b7756             mov si, word ptr es:[bx + 0x56]
9:2771  03f6                 add si, si
9:2773  2689404e             mov word ptr es:[bx + si + 0x4e], ax
9:2777  26ff4756             inc word ptr es:[bx + 0x56]
loc_277B:
9:277B  ff46f6               inc word ptr [bp - 0xa]
9:277E  817ef6b401           cmp word ptr [bp - 0xa], 0x1b4
9:2783  7ed0                 jle 0x2755
9:2785  c45e06               les bx, ptr [bp + 6]
9:2788  268b879200           mov ax, word ptr es:[bx + 0x92]
9:278D  8946f8               mov word ptr [bp - 8], ax
9:2790  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:2795  26894728             mov word ptr es:[bx + 0x28], ax
9:2799  ff369603             push word ptr [0x396]
9:279D  6668c8001101         push 0x11100c8
9:27A3  666a00               push 0
9:27A6  9a780d0000           lcall 0, 0xd78  ; USER.PostMessage
9:27AB  6a01                 push 1
loc_27AD:
9:27AD  66ff760a             push dword ptr [bp + 0xa]
9:27B1  66ff7606             push dword ptr [bp + 6]
9:27B5  90                   nop
9:27B6  0e                   push cs
9:27B7  e88253               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:27BA  8946fc               mov word ptr [bp - 4], ax
9:27BD  8956fe               mov word ptr [bp - 2], dx
loc_27C0:
9:27C0  8b46fc               mov ax, word ptr [bp - 4]
9:27C3  8b56fe               mov dx, word ptr [bp - 2]
9:27C6  5e                   pop si
9:27C7  c9                   leave
9:27C8  ca0a00               retf 0xa
9:27CB  db 00

; ---------------- StarSelectionDlg::onCtlColor@s9:27CC FAR size=194 callers=0
;   apis: GDI.CreateSolidBrush, GDI.SetBkColor, GDI.SetTextColor, USER.GetDlgCtrlID
;   (vslot 13)
9:27CC  c8080000             enter 8, 0
9:27D0  c45e06               les bx, ptr [bp + 6]
9:27D3  26837f0400           cmp word ptr es:[bx + 4], 0
9:27D8  750f                 jne 0x27e9
9:27DA  666a00               push 0
9:27DD  9affff0000           lcall 0, 0xffff  ; GDI.CreateSolidBrush
9:27E2  c45e06               les bx, ptr [bp + 6]
9:27E5  26894704             mov word ptr es:[bx + 4], ax
loc_27E9:
9:27E9  66833ef85c00         cmp dword ptr [0x5cf8], 0
9:27EF  753e                 jne 0x282f
9:27F1  c45e06               les bx, ptr [bp + 6]
9:27F4  26ff776e             push word ptr es:[bx + 0x6e]
9:27F8  06                   push es
9:27F9  53                   push bx
9:27FA  26c41f               les bx, ptr es:[bx]
9:27FD  26ff5f68             lcall es:[bx + 0x68]
9:2801  52                   push dx
9:2802  50                   push ax
9:2803  9a724de025           lcall 0x25e0, 0x4d72  ; MemBlock::data@s2:4D72
9:2808  8946f8               mov word ptr [bp - 8], ax
9:280B  8956fa               mov word ptr [bp - 6], dx
9:280E  c45ef8               les bx, ptr [bp - 8]
9:2811  2ac0                 sub al, al
9:2813  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:2818  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:281D  2aed                 sub ch, ch
9:281F  0bc1                 or ax, cx
9:2821  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:2826  b502                 mov ch, 2
9:2828  a3f85c               mov word ptr [0x5cf8], ax
9:282B  890efa5c             mov word ptr [0x5cfa], cx
loc_282F:
9:282F  8b460c               mov ax, word ptr [bp + 0xc]
9:2832  2d0500               sub ax, 5
9:2835  762f                 jbe 0x2866
9:2837  48                   dec ax
9:2838  7408                 je 0x2842
9:283A  33c0                 xor ax, ax
9:283C  99                   cdq
9:283D  c9                   leave
9:283E  ca0a00               retf 0xa
9:2841  db 90
loc_2842:
9:2842  ff760a               push word ptr [bp + 0xa]
9:2845  9affff0000           lcall 0, 0xffff  ; USER.GetDlgCtrlID
9:284A  c45e06               les bx, ptr [bp + 6]
9:284D  2683bf940000         cmp word ptr es:[bx + 0x94], 0
9:2853  7411                 je 0x2866
9:2855  3db20f               cmp ax, 0xfb2
9:2858  750c                 jne 0x2866
9:285A  ff760e               push word ptr [bp + 0xe]
9:285D  6668ff000000         push 0xff
9:2863  eb09                 jmp 0x286e
9:2865  db 90
loc_2866:
9:2866  ff760e               push word ptr [bp + 0xe]
9:2869  66ff36f85c           push dword ptr [0x5cf8]
loc_286E:
9:286E  9a71220000           lcall 0, 0x2271  ; GDI.SetTextColor
9:2873  ff760e               push word ptr [bp + 0xe]
9:2876  666800000001         push 0x1000000
9:287C  9a5f220000           lcall 0, 0x225f  ; GDI.SetBkColor
9:2881  c45e06               les bx, ptr [bp + 6]
9:2884  8cda                 mov dx, ds
9:2886  268b4704             mov ax, word ptr es:[bx + 4]
9:288A  c9                   leave
9:288B  ca0a00               retf 0xa

; ---------------- StarSelectionDlg::loadBackground@s9:288E size=162 callers=0
;   (vslot 26)
9:288E  c8180000             enter 0x18, 0
9:2892  56                   push si
9:2893  c45e06               les bx, ptr [bp + 6]
9:2896  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:289B  66268b4724           mov eax, dword ptr es:[bx + 0x24]
9:28A0  268b5726             mov dx, word ptr es:[bx + 0x26]
9:28A4  668946fc             mov dword ptr [bp - 4], eax
9:28A8  52                   push dx
9:28A9  c45efc               les bx, ptr [bp - 4]
9:28AC  50                   push ax
9:28AD  26c41f               les bx, ptr es:[bx]
9:28B0  26ff5f14             lcall es:[bx + 0x14]
9:28B4  8946f8               mov word ptr [bp - 8], ax
9:28B7  8956fa               mov word ptr [bp - 6], dx
9:28BA  c45e06               les bx, ptr [bp + 6]
9:28BD  6626837f7000         cmp dword ptr es:[bx + 0x70], 0
9:28C3  741f                 je 0x28e4
9:28C5  268b4770             mov ax, word ptr es:[bx + 0x70]
9:28C9  268b5772             mov dx, word ptr es:[bx + 0x72]
9:28CD  8956ea               mov word ptr [bp - 0x16], dx
9:28D0  8bda                 mov bx, dx
9:28D2  0bd0                 or dx, ax
9:28D4  740e                 je 0x28e4
9:28D6  6a01                 push 1
9:28D8  53                   push bx
9:28D9  50                   push ax
9:28DA  8ec3                 mov es, bx
9:28DC  8bf0                 mov si, ax
9:28DE  26c41c               les bx, ptr es:[si]
9:28E1  26ff1f               lcall es:[bx]
loc_28E4:
9:28E4  6a14                 push 0x14
9:28E6  9a9c175426           lcall 0x2654, 0x179c  ; operator_new@s1:179C
9:28EB  83c402               add sp, 2
9:28EE  8956ea               mov word ptr [bp - 0x16], dx
9:28F1  0bd0                 or dx, ax
9:28F3  740b                 je 0x2900
9:28F5  ff76ea               push word ptr [bp - 0x16]
9:28F8  50                   push ax
9:28F9  9a584c1d29           lcall 0x291d, 0x4c58  ; MemBlock::MemBlock@s2:4C58
9:28FE  eb03                 jmp 0x2903
loc_2900:
9:2900  33c0                 xor ax, ax
9:2902  99                   cdq
loc_2903:
9:2903  c45e06               les bx, ptr [bp + 6]
9:2906  26894770             mov word ptr es:[bx + 0x70], ax
9:290A  26895772             mov word ptr es:[bx + 0x72], dx
9:290E  66ff76f8             push dword ptr [bp - 8]
9:2912  c45e06               les bx, ptr [bp + 6]
9:2915  6626ff7770           push dword ptr es:[bx + 0x70]
9:291A  9a844d0628           lcall 0x2806, 0x4d84  ; MemBlock::copyFrom@s2:4D84
9:291F  c45e06               les bx, ptr [bp + 6]
9:2922  268b4770             mov ax, word ptr es:[bx + 0x70]
9:2926  268b5772             mov dx, word ptr es:[bx + 0x72]
9:292A  5e                   pop si
9:292B  c9                   leave
9:292C  ca0600               retf 6
9:292F  db 00

; ---------------- StarSelectionDlg::scalar_dtor@s9:2930 FAR size=146 callers=0
;   deleting destructor
9:2930  55                   push bp
9:2931  8bec                 mov bp, sp
9:2933  66ff7606             push dword ptr [bp + 6]
9:2937  90                   nop
9:2938  0e                   push cs
9:2939  e828fb               call 0x2464  ; StarSelectionDlg::~StarSelectionDlg@s9:2464
9:293C  f6460a01             test byte ptr [bp + 0xa], 1
9:2940  7409                 je 0x294b
9:2942  66ff7606             push dword ptr [bp + 6]
9:2946  9ace17e928           lcall 0x28e9, 0x17ce  ; operator_delete@s1:17CE
loc_294B:
9:294B  8b4606               mov ax, word ptr [bp + 6]
9:294E  8b5608               mov dx, word ptr [bp + 8]
9:2951  c9                   leave
9:2952  ca0600               retf 6
9:2955  db 90 30 29 60 29 10 3a fc 28 90 24 64 29 c0 79 68
9:2965  db 29 12 25 6c 29 98 7b 70 29 56 7f 74 29 b2 7b 78
9:2975  db 29 1c 7f 7c 29 12 82 80 29 86 7f 84 29 0c 80 88
9:2985  db 29 54 80 8c 29 cc 27 90 29 58 81 94 29 b6 81 98
9:2995  db 29 fe 81 a0 29 ea 60 ac 29 4a 82 a4 29 66 82 a8
9:29A5  db 29 de 78 c0 29 ee 60 b0 29 f4 60 b4 29 fa 60 bc
9:29B5  db 29 a4 a2 81 24 fe 60 ab 25 8e 28 73 24

; ---------------- TerraformDlg::TerraformDlg@s9:29C2 FAR size=96 callers=1
;   dialog 343 "Terraforming Control" (vtable 2E26)
9:29C2  55                   push bp
9:29C3  8bec                 mov bp, sp
9:29C5  ff760e               push word ptr [bp + 0xe]
9:29C8  685701               push 0x157
9:29CB  66ff760a             push dword ptr [bp + 0xa]
9:29CF  66ff7606             push dword ptr [bp + 6]
9:29D3  90                   nop
9:29D4  0e                   push cs
9:29D5  e8e486               call 0xffffb0bc  ; ObjectDlgBase::ObjectDlgBase@s9:B0BC
9:29D8  c45e06               les bx, ptr [bp + 6]
9:29DB  26c707262e           mov word ptr es:[bx], 0x2e26
9:29E0  26c747025829         mov word ptr es:[bx + 2], 0x2958  ; SEGMENT s9:0000
9:29E6  684b06               push 0x64b
9:29E9  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:29EE  9aac840b2a           lcall 0x2a0b, 0x84ac  ; LoadStringDup@s3:84AC
9:29F3  c45e06               les bx, ptr [bp + 6]
9:29F6  2689879400           mov word ptr es:[bx + 0x94], ax
9:29FB  2689979600           mov word ptr es:[bx + 0x96], dx
9:2A00  684a06               push 0x64a
9:2A03  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:2A08  9aac844827           lcall 0x2748, 0x84ac  ; LoadStringDup@s3:84AC
9:2A0D  c45e06               les bx, ptr [bp + 6]
9:2A10  2689879800           mov word ptr es:[bx + 0x98], ax
9:2A15  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:2A1A  8bc3                 mov ax, bx
9:2A1C  8cc2                 mov dx, es
9:2A1E  c9                   leave
9:2A1F  ca0a00               retf 0xa

; ---------------- TerraformDlg::~TerraformDlg@s9:2A22 FAR size=66 callers=1
;   dtor
9:2A22  c80c0000             enter 0xc, 0
9:2A26  c45e06               les bx, ptr [bp + 6]
9:2A29  26c707262e           mov word ptr es:[bx], 0x2e26
9:2A2E  26c74702e429         mov word ptr es:[bx + 2], 0x29e4  ; SEGMENT s9:0000 | 'fem108.wav'
9:2A34  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:2A3A  6650                 push eax
9:2A3C  9ace17522a           lcall 0x2a52, 0x17ce  ; operator_delete@s1:17CE
9:2A41  83c404               add sp, 4
9:2A44  c45e06               les bx, ptr [bp + 6]
9:2A47  66268b879800         mov eax, dword ptr es:[bx + 0x98]
9:2A4D  6650                 push eax
9:2A4F  9ace174929           lcall 0x2949, 0x17ce  ; operator_delete@s1:17CE
9:2A54  83c404               add sp, 4
9:2A57  66ff7606             push dword ptr [bp + 6]
9:2A5B  90                   nop
9:2A5C  0e                   push cs
9:2A5D  e89886               call 0xffffb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:2A60  c9                   leave
9:2A61  ca0400               retf 4

; ---------------- TerraformDlg::init@s9:2A64 size=334 callers=0
;   apis: USER.EnableWindow, USER.MapDialogRect, USER.SetDlgItemText
;   (vslot 2)
9:2A64  c81e0000             enter 0x1e, 0
9:2A68  57                   push di
9:2A69  56                   push si
9:2A6A  66ff7606             push dword ptr [bp + 6]
9:2A6E  90                   nop
9:2A6F  0e                   push cs
9:2A70  e8bd87               call 0xffffb230  ; BuildingDlgBase::position@s9:B230
9:2A73  c746fe0500           mov word ptr [bp - 2], 5
9:2A78  6a00                 push 0
9:2A7A  c45e06               les bx, ptr [bp + 6]
9:2A7D  26c49f9000           les bx, ptr es:[bx + 0x90]
9:2A82  6626ff7706           push dword ptr es:[bx + 6]
9:2A87  9aa8730c16           lcall 0x160c, 0x73a8  ; DbObj::resolveLink16@s7:73A8
9:2A8C  8946f6               mov word ptr [bp - 0xa], ax
9:2A8F  8956f8               mov word ptr [bp - 8], dx
9:2A92  52                   push dx
9:2A93  50                   push ax
9:2A94  9a9a4acd2a           lcall 0x2acd, 0x4a9a  ; TerraForm::system@s6:4A9A
9:2A99  a3045d               mov word ptr [0x5d04], ax
9:2A9C  c746f40000           mov word ptr [bp - 0xc], 0
9:2AA1  eb6d                 jmp 0x2b10
9:2AA3  db 90
loc_2AA4:
9:2AA4  33c0                 xor ax, ax
9:2AA6  99                   cdq
loc_2AA7:
9:2AA7  8946fa               mov word ptr [bp - 6], ax
9:2AAA  8956fc               mov word ptr [bp - 4], dx
9:2AAD  833e045d00           cmp word ptr [0x5d04], 0
9:2AB2  743e                 je 0x2af2
9:2AB4  8b5ef4               mov bx, word ptr [bp - 0xc]
9:2AB7  8bc3                 mov ax, bx
9:2AB9  03db                 add bx, bx
9:2ABB  03d8                 add bx, ax
9:2ABD  c1e302               shl bx, 2
9:2AC0  ffb7025d             push word ptr [bx + 0x5d02]
9:2AC4  66ff76f6             push dword ptr [bp - 0xa]
9:2AC8  8bf3                 mov si, bx
9:2ACA  9a9a4afc15           lcall 0x15fc, 0x4a9a  ; TerraForm::system@s6:4A9A
9:2ACF  0bc0                 or ax, ax
9:2AD1  743a                 je 0x2b0d
9:2AD3  c784045d0100         mov word ptr [si + 0x5d04], 1
9:2AD9  c45e06               les bx, ptr [bp + 6]
9:2ADC  26ff7706             push word ptr es:[bx + 6]
9:2AE0  ffb4065d             push word ptr [si + 0x5d06]
9:2AE4  6626ffb79800         push dword ptr es:[bx + 0x98]
9:2AEA  9a69260000           lcall 0, 0x2669  ; USER.SetDlgItemText
9:2AEF  eb1c                 jmp 0x2b0d
9:2AF1  db 90
loc_2AF2:
9:2AF2  837ef400             cmp word ptr [bp - 0xc], 0
9:2AF6  7415                 je 0x2b0d
9:2AF8  8bc2                 mov ax, dx
9:2AFA  0b46fa               or ax, word ptr [bp - 6]
9:2AFD  740e                 je 0x2b0d
9:2AFF  c45efa               les bx, ptr [bp - 6]
9:2B02  26ff7718             push word ptr es:[bx + 0x18]
9:2B06  6a00                 push 0
9:2B08  9a86250000           lcall 0, 0x2586  ; USER.EnableWindow
loc_2B0D:
9:2B0D  ff46f4               inc word ptr [bp - 0xc]
loc_2B10:
9:2B10  8b46fe               mov ax, word ptr [bp - 2]
9:2B13  3946f4               cmp word ptr [bp - 0xc], ax
9:2B16  0f8d9200             jge 0x2bac
9:2B1A  837ef400             cmp word ptr [bp - 0xc], 0
9:2B1E  7412                 je 0x2b32
9:2B20  8b5ef4               mov bx, word ptr [bp - 0xc]
9:2B23  8bc3                 mov ax, bx
9:2B25  03db                 add bx, bx
9:2B27  03d8                 add bx, ax
9:2B29  c1e302               shl bx, 2
9:2B2C  c787045d0000         mov word ptr [bx + 0x5d04], 0
loc_2B32:
9:2B32  8b5ef4               mov bx, word ptr [bp - 0xc]
9:2B35  8bc3                 mov ax, bx
9:2B37  03db                 add bx, bx
9:2B39  03d8                 add bx, ax
9:2B3B  c1e302               shl bx, 2
9:2B3E  8b87fc5c             mov ax, word ptr [bx + 0x5cfc]
9:2B42  8946ec               mov word ptr [bp - 0x14], ax
9:2B45  8b87fe5c             mov ax, word ptr [bx + 0x5cfe]
9:2B49  8946ee               mov word ptr [bp - 0x12], ax
9:2B4C  b80100               mov ax, 1
9:2B4F  8946f0               mov word ptr [bp - 0x10], ax
9:2B52  8946f2               mov word ptr [bp - 0xe], ax
9:2B55  c47606               les si, ptr [bp + 6]
9:2B58  26ff7406             push word ptr es:[si + 6]
9:2B5C  8d4eec               lea cx, [bp - 0x14]
9:2B5F  16                   push ss
9:2B60  51                   push cx
9:2B61  8bfb                 mov di, bx
9:2B63  9a71000000           lcall 0, 0x71  ; USER.MapDialogRect
9:2B68  6a42                 push 0x42
9:2B6A  9a9c173f2a           lcall 0x2a3f, 0x179c  ; operator_new@s1:179C
9:2B6F  83c402               add sp, 2
9:2B72  8946e8               mov word ptr [bp - 0x18], ax
9:2B75  8956ea               mov word ptr [bp - 0x16], dx
9:2B78  897ee6               mov word ptr [bp - 0x1a], di
9:2B7B  0bd0                 or dx, ax
9:2B7D  0f8423ff             je 0x2aa4
9:2B81  c45e06               les bx, ptr [bp + 6]
9:2B84  26ff7706             push word ptr es:[bx + 6]
9:2B88  8bdf                 mov bx, di
9:2B8A  ffb7005d             push word ptr [bx + 0x5d00]
9:2B8E  66680001ff00         push 0xff0100
9:2B94  680101               push 0x101
9:2B97  ff76ec               push word ptr [bp - 0x14]
9:2B9A  ff76ee               push word ptr [bp - 0x12]
9:2B9D  6a01                 push 1
9:2B9F  ff76ea               push word ptr [bp - 0x16]
9:2BA2  50                   push ax
9:2BA3  9ad63b5c29           lcall 0x295c, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:2BA8  e9fcfe               jmp 0x2aa7
9:2BAB  db 90
loc_2BAC:
9:2BAC  5e                   pop si
9:2BAD  5f                   pop di
9:2BAE  c9                   leave
9:2BAF  ca0400               retf 4

; ---------------- TerraformDlg::onCommand@s9:2BB2 size=406 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SetDlgItemText
;   (vslot 4)
9:2BB2  c8060000             enter 6, 0
9:2BB6  56                   push si
9:2BB7  c746fe0000           mov word ptr [bp - 2], 0
9:2BBC  8b460e               mov ax, word ptr [bp + 0xe]
9:2BBF  2d5801               sub ax, 0x158
9:2BC2  742a                 je 0x2bee
9:2BC4  48                   dec ax
9:2BC5  0f841101             je 0x2cda
9:2BC9  48                   dec ax
9:2BCA  0f844801             je 0x2d16
9:2BCE  48                   dec ax
9:2BCF  0f844b01             je 0x2d1e
9:2BD3  48                   dec ax
9:2BD4  0f844e01             je 0x2d26
9:2BD8  66ff760c             push dword ptr [bp + 0xc]
9:2BDC  66ff7608             push dword ptr [bp + 8]
9:2BE0  ff7606               push word ptr [bp + 6]
9:2BE3  90                   nop
9:2BE4  0e                   push cs
9:2BE5  e86289               call 0xffffb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:2BE8  5e                   pop si
9:2BE9  c9                   leave
9:2BEA  ca0a00               retf 0xa
9:2BED  db 90
loc_2BEE:
9:2BEE  c746fc0500           mov word ptr [bp - 4], 5
9:2BF3  833e045d01           cmp word ptr [0x5d04], 1
9:2BF8  1bc0                 sbb ax, ax
9:2BFA  f7d8                 neg ax
9:2BFC  a3045d               mov word ptr [0x5d04], ax
9:2BFF  0bc0                 or ax, ax
9:2C01  7565                 jne 0x2c68
9:2C03  c746fa0100           mov word ptr [bp - 6], 1
9:2C08  eb43                 jmp 0x2c4d
loc_2C0A:
9:2C0A  c45e06               les bx, ptr [bp + 6]
9:2C0D  26ff7706             push word ptr es:[bx + 6]
9:2C11  8b76fa               mov si, word ptr [bp - 6]
9:2C14  8bc6                 mov ax, si
9:2C16  03f6                 add si, si
9:2C18  03f0                 add si, ax
9:2C1A  c1e602               shl si, 2
9:2C1D  ffb4005d             push word ptr [si + 0x5d00]
9:2C21  9a882c0000           lcall 0, 0x2c88  ; USER.GetDlgItem
9:2C26  50                   push ax
9:2C27  6a00                 push 0
9:2C29  9a902c0000           lcall 0, 0x2c90  ; USER.EnableWindow
9:2C2E  c784045d0000         mov word ptr [si + 0x5d04], 0
9:2C34  c45e06               les bx, ptr [bp + 6]
9:2C37  26ff7706             push word ptr es:[bx + 6]
9:2C3B  ffb4065d             push word ptr [si + 0x5d06]
9:2C3F  6626ffb79400         push dword ptr es:[bx + 0x94]
9:2C45  9aac2c0000           lcall 0, 0x2cac  ; USER.SetDlgItemText
9:2C4A  ff46fa               inc word ptr [bp - 6]
loc_2C4D:
9:2C4D  8b46fc               mov ax, word ptr [bp - 4]
9:2C50  3946fa               cmp word ptr [bp - 6], ax
9:2C53  7cb5                 jl 0x2c0a
9:2C55  c45e06               les bx, ptr [bp + 6]
9:2C58  26ff7706             push word ptr es:[bx + 6]
9:2C5C  ff36065d             push word ptr [0x5d06]
9:2C60  6626ffb79400         push dword ptr es:[bx + 0x94]
9:2C66  eb64                 jmp 0x2ccc
loc_2C68:
9:2C68  c746fa0100           mov word ptr [bp - 6], 1
9:2C6D  eb44                 jmp 0x2cb3
9:2C6F  db 90
loc_2C70:
9:2C70  c45e06               les bx, ptr [bp + 6]
9:2C73  26ff7706             push word ptr es:[bx + 6]
9:2C77  8b76fa               mov si, word ptr [bp - 6]
9:2C7A  8bc6                 mov ax, si
9:2C7C  03f6                 add si, si
9:2C7E  03f0                 add si, ax
9:2C80  c1e602               shl si, 2
9:2C83  ffb4005d             push word ptr [si + 0x5d00]
9:2C87  9a65250000           lcall 0, 0x2565  ; USER.GetDlgItem
9:2C8C  50                   push ax
9:2C8D  6a01                 push 1
9:2C8F  9a092b0000           lcall 0, 0x2b09  ; USER.EnableWindow
9:2C94  c784045d0000         mov word ptr [si + 0x5d04], 0
9:2C9A  c45e06               les bx, ptr [bp + 6]
9:2C9D  26ff7706             push word ptr es:[bx + 6]
9:2CA1  ffb4065d             push word ptr [si + 0x5d06]
9:2CA5  6626ffb79400         push dword ptr es:[bx + 0x94]
9:2CAB  9acd2c0000           lcall 0, 0x2ccd  ; USER.SetDlgItemText
9:2CB0  ff46fa               inc word ptr [bp - 6]
loc_2CB3:
9:2CB3  8b46fc               mov ax, word ptr [bp - 4]
9:2CB6  3946fa               cmp word ptr [bp - 6], ax
9:2CB9  7cb5                 jl 0x2c70
9:2CBB  c45e06               les bx, ptr [bp + 6]
9:2CBE  26ff7706             push word ptr es:[bx + 6]
9:2CC2  ff36065d             push word ptr [0x5d06]
loc_2CC6:
9:2CC6  6626ffb79800         push dword ptr es:[bx + 0x98]
loc_2CCC:
9:2CCC  9aeb2a0000           lcall 0, 0x2aeb  ; USER.SetDlgItemText
loc_2CD1:
9:2CD1  b80100               mov ax, 1
9:2CD4  99                   cdq
9:2CD5  5e                   pop si
9:2CD6  c9                   leave
9:2CD7  ca0a00               retf 0xa
loc_2CDA:
9:2CDA  c746fe0100           mov word ptr [bp - 2], 1
loc_2CDF:
9:2CDF  837efe00             cmp word ptr [bp - 2], 0
9:2CE3  74ec                 je 0x2cd1
9:2CE5  8b5efe               mov bx, word ptr [bp - 2]
9:2CE8  8bc3                 mov ax, bx
9:2CEA  03db                 add bx, bx
9:2CEC  03d8                 add bx, ax
9:2CEE  c1e302               shl bx, 2
9:2CF1  83bf045d01           cmp word ptr [bx + 0x5d04], 1
9:2CF6  1bc0                 sbb ax, ax
9:2CF8  f7d8                 neg ax
9:2CFA  8987045d             mov word ptr [bx + 0x5d04], ax
9:2CFE  0bc0                 or ax, ax
9:2D00  752c                 jne 0x2d2e
9:2D02  c47606               les si, ptr [bp + 6]
9:2D05  26ff7406             push word ptr es:[si + 6]
9:2D09  ffb7065d             push word ptr [bx + 0x5d06]
9:2D0D  6626ffb49400         push dword ptr es:[si + 0x94]
9:2D13  ebb7                 jmp 0x2ccc
9:2D15  db 90
loc_2D16:
9:2D16  c746fe0200           mov word ptr [bp - 2], 2
9:2D1B  ebc2                 jmp 0x2cdf
9:2D1D  db 90
loc_2D1E:
9:2D1E  c746fe0300           mov word ptr [bp - 2], 3
9:2D23  ebba                 jmp 0x2cdf
9:2D25  db 90
loc_2D26:
9:2D26  c746fe0400           mov word ptr [bp - 2], 4
9:2D2B  ebb2                 jmp 0x2cdf
9:2D2D  db 90
loc_2D2E:
9:2D2E  c45e06               les bx, ptr [bp + 6]
9:2D31  26ff7706             push word ptr es:[bx + 6]
9:2D35  8b76fe               mov si, word ptr [bp - 2]
9:2D38  8bc6                 mov ax, si
9:2D3A  03f6                 add si, si
9:2D3C  03f0                 add si, ax
9:2D3E  c1e602               shl si, 2
9:2D41  ffb4065d             push word ptr [si + 0x5d06]
9:2D45  e97eff               jmp 0x2cc6

; ---------------- TerraformDlg::setValue@s9:2D48 size=100 callers=0
;   apis: USER.GetDlgItemInt, USER.SetDlgItemInt
;   (vslot 28) a setting's number
9:2D48  c8080000             enter 8, 0
9:2D4C  66ff7606             push dword ptr [bp + 6]
9:2D50  90                   nop
9:2D51  0e                   push cs
9:2D52  e80987               call 0xffffb45e  ; BuildingDlgBase::setText@s9:B45E
9:2D55  c45e06               les bx, ptr [bp + 6]
9:2D58  26ff7706             push word ptr es:[bx + 6]
9:2D5C  686301               push 0x163
9:2D5F  8d46fe               lea ax, [bp - 2]
9:2D62  16                   push ss
9:2D63  50                   push ax
9:2D64  6a01                 push 1
9:2D66  9a802d0000           lcall 0, 0x2d80  ; USER.GetDlgItemInt
9:2D6B  8946fc               mov word ptr [bp - 4], ax
9:2D6E  c45e06               les bx, ptr [bp + 6]
9:2D71  26ff7706             push word ptr es:[bx + 6]
9:2D75  686501               push 0x165
9:2D78  8d46fe               lea ax, [bp - 2]
9:2D7B  16                   push ss
9:2D7C  50                   push ax
9:2D7D  6a01                 push 1
9:2D7F  9affff0000           lcall 0, 0xffff  ; USER.GetDlgItemInt
9:2D84  8946fa               mov word ptr [bp - 6], ax
9:2D87  c45e06               les bx, ptr [bp + 6]
9:2D8A  26ff7706             push word ptr es:[bx + 6]
9:2D8E  686501               push 0x165
9:2D91  837efc00             cmp word ptr [bp - 4], 0
9:2D95  7405                 je 0x2d9c
9:2D97  2bd2                 sub dx, dx
9:2D99  f776fc               div word ptr [bp - 4]
loc_2D9C:
9:2D9C  8946f8               mov word ptr [bp - 8], ax
9:2D9F  50                   push ax
9:2DA0  6a01                 push 1
9:2DA2  9affff0000           lcall 0, 0xffff  ; USER.SetDlgItemInt
9:2DA7  c9                   leave
9:2DA8  ca0400               retf 4
9:2DAB  db 00

; ---------------- TerraformDlg::apply@s9:2DAC FAR size=84 callers=0
;   (vslot 30) writes the settings
9:2DAC  c8080000             enter 8, 0
9:2DB0  c45e06               les bx, ptr [bp + 6]
9:2DB3  26c49f9000           les bx, ptr es:[bx + 0x90]
9:2DB8  6626ff7706           push dword ptr es:[bx + 6]
9:2DBD  9aa8738a2a           lcall 0x2a8a, 0x73a8  ; DbObj::resolveLink16@s7:73A8
9:2DC2  8946fc               mov word ptr [bp - 4], ax
9:2DC5  8956fe               mov word ptr [bp - 2], dx
9:2DC8  c746fa0500           mov word ptr [bp - 6], 5
9:2DCD  c746f80000           mov word ptr [bp - 8], 0
9:2DD2  eb20                 jmp 0x2df4
loc_2DD4:
9:2DD4  8b5ef8               mov bx, word ptr [bp - 8]
9:2DD7  8bc3                 mov ax, bx
9:2DD9  03db                 add bx, bx
9:2DDB  03d8                 add bx, ax
9:2DDD  c1e302               shl bx, 2
9:2DE0  ffb7025d             push word ptr [bx + 0x5d02]
9:2DE4  ffb7045d             push word ptr [bx + 0x5d04]
9:2DE8  66ff76fc             push dword ptr [bp - 4]
9:2DEC  9ab24a972a           lcall 0x2a97, 0x4ab2  ; TerraForm::setSystem@s6:4AB2
9:2DF1  ff46f8               inc word ptr [bp - 8]
loc_2DF4:
9:2DF4  8b46fa               mov ax, word ptr [bp - 6]
9:2DF7  3946f8               cmp word ptr [bp - 8], ax
9:2DFA  7cd8                 jl 0x2dd4
9:2DFC  c9                   leave
9:2DFD  ca0400               retf 4

; ---------------- TerraformDlg::scalar_dtor@s9:2E00 FAR size=162 callers=0
;   deleting destructor
9:2E00  55                   push bp
9:2E01  8bec                 mov bp, sp
9:2E03  66ff7606             push dword ptr [bp + 6]
9:2E07  90                   nop
9:2E08  0e                   push cs
9:2E09  e816fc               call 0x2a22  ; TerraformDlg::~TerraformDlg@s9:2A22
9:2E0C  f6460a01             test byte ptr [bp + 0xa], 1
9:2E10  7409                 je 0x2e1b
9:2E12  66ff7606             push dword ptr [bp + 6]
9:2E16  9ace176d2b           lcall 0x2b6d, 0x17ce  ; operator_delete@s1:17CE
loc_2E1B:
9:2E1B  8b4606               mov ax, word ptr [bp + 6]
9:2E1E  8b5608               mov dx, word ptr [bp + 8]
9:2E21  c9                   leave
9:2E22  ca0600               retf 6
9:2E25  db 90 00 2e 30 2e 10 3a a6 2b 64 2a 34 2e 16 b3 38
9:2E35  db 2e b2 2b 3c 2e 26 b7 40 2e 56 7f 44 2e b2 7b 48
9:2E45  db 2e 1c 7f 50 2e 48 88 88 2e 86 7f 54 2e 0c 80 58
9:2E55  db 2e 54 80 5c 2e 72 b3 60 2e 58 81 64 2e b6 81 68
9:2E65  db 2e fe 81 70 2e ea 60 7c 2e 4a 82 74 2e 66 82 78
9:2E75  db 2e de 78 84 2e ee 60 80 2e f4 60 8c 2e c8 b4 90
9:2E85  db 2e 42 88 b8 29 fe 60 9c 29 7e 80 94 2e 3c b4 98
9:2E95  db 2e 48 2d 9c 2e 7c b1 a0 2e ac 2d 32 2a

; ---------------- TradeDlg::TradeDlg@s9:2EA2 FAR size=100 callers=1
;   dialog 384 "%s - Trade" (vtable 3436)
9:2EA2  55                   push bp
9:2EA3  8bec                 mov bp, sp
9:2EA5  ff7612               push word ptr [bp + 0x12]
9:2EA8  688001               push 0x180
9:2EAB  66ff760a             push dword ptr [bp + 0xa]
9:2EAF  6a01                 push 1
9:2EB1  66ff7606             push dword ptr [bp + 6]
9:2EB5  90                   nop
9:2EB6  0e                   push cs
9:2EB7  e86e48               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:2EBA  6633c0               xor eax, eax
9:2EBD  c45e06               les bx, ptr [bp + 6]
9:2EC0  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:2EC5  2689879000           mov word ptr es:[bx + 0x90], ax
9:2ECA  2689879200           mov word ptr es:[bx + 0x92], ax
9:2ECF  2689879400           mov word ptr es:[bx + 0x94], ax
9:2ED4  662689879600         mov dword ptr es:[bx + 0x96], eax
9:2EDA  26c7073634           mov word ptr es:[bx], 0x3436
9:2EDF  26c74702282e         mov word ptr es:[bx + 2], 0x2e28  ; SEGMENT s9:0000
9:2EE5  6a3c                 push 0x3c
9:2EE7  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:2EEC  9aba20f129           lcall 0x29f1, 0x20ba  ; Registry_get@s3:20BA
9:2EF1  c45e06               les bx, ptr [bp + 6]
9:2EF4  2689879600           mov word ptr es:[bx + 0x96], ax
9:2EF9  2689979800           mov word ptr es:[bx + 0x98], dx
9:2EFE  8bc3                 mov ax, bx
9:2F00  8cc2                 mov dx, es
9:2F02  c9                   leave
9:2F03  ca0e00               retf 0xe

; ---------------- TradeDlg::~TradeDlg@s9:2F06 FAR size=44 callers=1
;   dtor
9:2F06  55                   push bp
9:2F07  8bec                 mov bp, sp
9:2F09  c45e06               les bx, ptr [bp + 6]
9:2F0C  26c7073634           mov word ptr es:[bx], 0x3436
9:2F11  26c74702e32e         mov word ptr es:[bx + 2], 0x2ee3  ; SEGMENT s9:0000
9:2F17  26ff7706             push word ptr es:[bx + 6]
9:2F1B  66ff367c5b           push dword ptr [0x5b7c]
9:2F20  9ae0b64c2e           lcall 0x2e4c, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:2F25  66ff7606             push dword ptr [bp + 6]
9:2F29  90                   nop
9:2F2A  0e                   push cs
9:2F2B  e8fe48               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:2F2E  c9                   leave
9:2F2F  ca0400               retf 4

; ---------------- TradeDlg::close@s9:2F32 size=40 callers=0
;   (vslot 5) unless the trade alert is on
9:2F32  c8040000             enter 4, 0
9:2F36  666a2b               push 0x2b
9:2F39  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:2F3E  9aba20482f           lcall 0x2f48, 0x20ba  ; Registry_get@s3:20BA
9:2F43  52                   push dx
9:2F44  50                   push ax
9:2F45  9a8e03ef2e           lcall 0x2eef, 0x38e  ; Alerts::isOn@s3:038E
9:2F4A  66ff7608             push dword ptr [bp + 8]
9:2F4E  ff7606               push word ptr [bp + 6]
9:2F51  90                   nop
9:2F52  0e                   push cs
9:2F53  e8424c               call 0x7b98  ; OPDialog::close@s9:7B98
9:2F56  c9                   leave
9:2F57  ca0600               retf 6

; ---------------- TradeDlg::init@s9:2F5A FAR size=54 callers=0
;   apis: USER.SetFocus, USER.ShowWindow
;   (vslot 2)
9:2F5A  55                   push bp
9:2F5B  8bec                 mov bp, sp
9:2F5D  66ff7606             push dword ptr [bp + 6]
9:2F61  90                   nop
9:2F62  0e                   push cs
9:2F63  e87c49               call 0x78e2  ; OPDialog::create@s9:78E2
9:2F66  666aff               push -1
9:2F69  66ff7606             push dword ptr [bp + 6]
9:2F6D  90                   nop
9:2F6E  0e                   push cs
9:2F6F  e8fa52               call 0x826c  ; OPDialog::position@s9:826C
9:2F72  c45e06               les bx, ptr [bp + 6]
9:2F75  26ff7706             push word ptr es:[bx + 6]
9:2F79  6a05                 push 5
9:2F7B  9af8240000           lcall 0, 0x24f8  ; USER.ShowWindow
9:2F80  c45e06               les bx, ptr [bp + 6]
9:2F83  26ff7706             push word ptr es:[bx + 6]
9:2F87  9a0d130000           lcall 0, 0x130d  ; USER.SetFocus
9:2F8C  c9                   leave
9:2F8D  ca0400               retf 4

; ---------------- TradeDlg::fill@s9:2F90 size=394 callers=0
;   apis: USER.GetDlgItem, USER.GetWindowText, USER.SendDlgItemMessage, USER.SendMessage, USER.SetWindowText, USER._wsprintf
;   (vslot 20) partner lists, title
9:2F90  c82c0100             enter 0x12c, 0
9:2F94  6a02                 push 2
9:2F96  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:2F9B  9aba203d30           lcall 0x303d, 0x20ba  ; Registry_get@s3:20BA
9:2FA0  8946fc               mov word ptr [bp - 4], ax
9:2FA3  8956fe               mov word ptr [bp - 2], dx
9:2FA6  c45efc               les bx, ptr [bp - 4]
9:2FA9  66268b4768           mov eax, dword ptr es:[bx + 0x68]
9:2FAE  668946f8             mov dword ptr [bp - 8], eax
9:2FB2  c45e06               les bx, ptr [bp + 6]
9:2FB5  26ff7706             push word ptr es:[bx + 6]
9:2FB9  8d8676ff             lea ax, [bp - 0x8a]
9:2FBD  16                   push ss
9:2FBE  50                   push ax
9:2FBF  688000               push 0x80
9:2FC2  9affff0000           lcall 0, 0xffff  ; USER.GetWindowText
9:2FC7  66ff76f8             push dword ptr [bp - 8]
9:2FCB  8d8676ff             lea ax, [bp - 0x8a]
9:2FCF  16                   push ss
9:2FD0  50                   push ax
9:2FD1  8d86f4fe             lea ax, [bp - 0x10c]
9:2FD5  16                   push ss
9:2FD6  50                   push ax
9:2FD7  9a1c190000           lcall 0, 0x191c  ; USER._wsprintf
9:2FDC  83c40c               add sp, 0xc
9:2FDF  c45e06               les bx, ptr [bp + 6]
9:2FE2  26ff7706             push word ptr es:[bx + 6]
9:2FE6  8d86f4fe             lea ax, [bp - 0x10c]
9:2FEA  16                   push ss
9:2FEB  50                   push ax
9:2FEC  9affff0000           lcall 0, 0xffff  ; USER.SetWindowText
9:2FF1  c45e06               les bx, ptr [bp + 6]
9:2FF4  26ff7706             push word ptr es:[bx + 6]
9:2FF8  688201               push 0x182
9:2FFB  9a8d300000           lcall 0, 0x308d  ; USER.GetDlgItem
9:3000  c45e06               les bx, ptr [bp + 6]
9:3003  2689879200           mov word ptr es:[bx + 0x92], ax
9:3008  8d86f0fe             lea ax, [bp - 0x110]
9:300C  16                   push ss
9:300D  50                   push ax
9:300E  8d8eecfe             lea cx, [bp - 0x114]
9:3012  16                   push ss
9:3013  51                   push cx
9:3014  6626ffb79600         push dword ptr es:[bx + 0x96]
9:301A  9a943a6330           lcall 0x3063, 0x3a94  ; TradeMarket::colonyLists@s4:3A94
9:301F  c45e06               les bx, ptr [bp + 6]
9:3022  26ffb79200           push word ptr es:[bx + 0x92]
9:3027  66ffb6f0fe           push dword ptr [bp - 0x110]
9:302C  06                   push es
9:302D  53                   push bx
9:302E  90                   nop
9:302F  0e                   push cs
9:3030  e84103               call 0x3374  ; TradeDlg::fillPartners@s9:3374
9:3033  6a2f                 push 0x2f
9:3035  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:303A  9aba20b130           lcall 0x30b1, 0x20ba  ; Registry_get@s3:20BA
9:303F  8986e8fe             mov word ptr [bp - 0x118], ax
9:3043  8996eafe             mov word ptr [bp - 0x116], dx
9:3047  c49ee8fe             les bx, ptr [bp - 0x118]
9:304B  66268b4724           mov eax, dword ptr es:[bx + 0x24]
9:3050  668986e4fe           mov dword ptr [bp - 0x11c], eax
9:3055  6650                 push eax
9:3057  c45e06               les bx, ptr [bp + 6]
9:305A  6626ffb79600         push dword ptr es:[bx + 0x96]
9:3060  9a7a3a6c2e           lcall 0x2e6c, 0x3a7a  ; TradeMarket::partnerName@s4:3A7A
9:3065  8986e0fe             mov word ptr [bp - 0x120], ax
9:3069  8996e2fe             mov word ptr [bp - 0x11e], dx
9:306D  c45e06               les bx, ptr [bp + 6]
9:3070  26ffb79200           push word ptr es:[bx + 0x92]
9:3075  6668ffff0d04         push 0x40dffff
9:307B  52                   push dx
9:307C  50                   push ax
9:307D  9aa8160000           lcall 0, 0x16a8  ; USER.SendMessage
9:3082  c45e06               les bx, ptr [bp + 6]
9:3085  26ff7706             push word ptr es:[bx + 6]
9:3089  688301               push 0x183
9:308C  9af5300000           lcall 0, 0x30f5  ; USER.GetDlgItem
9:3091  c45e06               les bx, ptr [bp + 6]
9:3094  2689879400           mov word ptr es:[bx + 0x94], ax
9:3099  50                   push ax
9:309A  66ffb6ecfe           push dword ptr [bp - 0x114]
9:309F  06                   push es
9:30A0  53                   push bx
9:30A1  90                   nop
9:30A2  0e                   push cs
9:30A3  e8ce02               call 0x3374  ; TradeDlg::fillPartners@s9:3374
9:30A6  683105               push 0x531
9:30A9  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:30AE  9a7e84412f           lcall 0x2f41, 0x847e  ; LoadStringRes@s3:847E
9:30B3  8986dcfe             mov word ptr [bp - 0x124], ax
9:30B7  8996defe             mov word ptr [bp - 0x122], dx
9:30BB  c45e06               les bx, ptr [bp + 6]
9:30BE  26ff7706             push word ptr es:[bx + 6]
9:30C2  666803048301         push 0x1830403
9:30C8  6a00                 push 0
9:30CA  52                   push dx
9:30CB  50                   push ax
9:30CC  9ae6300000           lcall 0, 0x30e6  ; USER.SendDlgItemMessage
9:30D1  c45e06               les bx, ptr [bp + 6]
9:30D4  26ff7706             push word ptr es:[bx + 6]
9:30D8  66680d048301         push 0x183040d
9:30DE  6aff                 push -1
9:30E0  66ffb6dcfe           push dword ptr [bp - 0x124]
9:30E5  9a05060000           lcall 0, 0x605  ; USER.SendDlgItemMessage
9:30EA  c45e06               les bx, ptr [bp + 6]
9:30ED  26ff7706             push word ptr es:[bx + 6]
9:30F1  688101               push 0x181
9:30F4  9a09310000           lcall 0, 0x3109  ; USER.GetDlgItem
9:30F9  c45e06               les bx, ptr [bp + 6]
9:30FC  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:3101  26ff7706             push word ptr es:[bx + 6]
9:3105  688401               push 0x184
9:3108  9a222c0000           lcall 0, 0x2c22  ; USER.GetDlgItem
9:310D  c45e06               les bx, ptr [bp + 6]
9:3110  2689879000           mov word ptr es:[bx + 0x90], ax
9:3115  c9                   leave
9:3116  ca0400               retf 4
9:3119  db 00

; ---------------- TradeDlg::onCommand@s9:311A FAR size=290 callers=0
;   apis: USER.SendMessage
;   (vslot 4) choose a partner, open the session
9:311A  c8140000             enter 0x14, 0
9:311E  57                   push di
9:311F  56                   push si
9:3120  66ff7606             push dword ptr [bp + 6]
9:3124  90                   nop
9:3125  0e                   push cs
9:3126  e81301               call 0x323c  ; TradeDlg::selectPartner@s9:323C
9:3129  683105               push 0x531
9:312C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:3131  9a7e842832           lcall 0x3228, 0x847e  ; LoadStringRes@s3:847E
9:3136  8b460e               mov ax, word ptr [bp + 0xe]
9:3139  2d8101               sub ax, 0x181
9:313C  7434                 je 0x3172
9:313E  2d0100               sub ax, 1
9:3141  7205                 jb 0x3148
9:3143  2d0100               sub ax, 1
9:3146  7616                 jbe 0x315e
loc_3148:
9:3148  66ff760c             push dword ptr [bp + 0xc]
9:314C  66ff7608             push dword ptr [bp + 8]
9:3150  ff7606               push word ptr [bp + 6]
9:3153  90                   nop
9:3154  0e                   push cs
9:3155  e8e449               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:3158  5e                   pop si
9:3159  5f                   pop di
9:315A  c9                   leave
9:315B  ca0a00               retf 0xa
loc_315E:
9:315E  66ff760c             push dword ptr [bp + 0xc]
9:3162  66ff7608             push dword ptr [bp + 8]
9:3166  ff7606               push word ptr [bp + 6]
9:3169  90                   nop
9:316A  0e                   push cs
9:316B  e8ac01               call 0x331a  ; TradeDlg::onNotify@s9:331A
9:316E  e9c300               jmp 0x3234
9:3171  db 90
loc_3172:
9:3172  8b4606               mov ax, word ptr [bp + 6]
9:3175  8b5608               mov dx, word ptr [bp + 8]
9:3178  059a00               add ax, 0x9a
9:317B  52                   push dx
9:317C  50                   push ax
9:317D  8b4e06               mov cx, word ptr [bp + 6]
9:3180  81c19a01             add cx, 0x19a
9:3184  52                   push dx
9:3185  51                   push cx
9:3186  c45e06               les bx, ptr [bp + 6]
9:3189  6626ffb79600         push dword ptr es:[bx + 0x96]
9:318F  8bf0                 mov si, ax
9:3191  8bfa                 mov di, dx
9:3193  9ada3ca431           lcall 0x31a4, 0x3cda  ; TradeMarket::setPartner@s4:3CDA
9:3198  c45e06               les bx, ptr [bp + 6]
9:319B  6626ffb79600         push dword ptr es:[bx + 0x96]
9:31A1  9a2434b831           lcall 0x31b8, 0x3424  ; TradeMarket::colonyPopulation@s4:3424
9:31A6  0bc0                 or ax, ax
9:31A8  7448                 je 0x31f2
9:31AA  57                   push di
9:31AB  56                   push si
9:31AC  c45e06               les bx, ptr [bp + 6]
9:31AF  6626ffb79600         push dword ptr es:[bx + 0x96]
9:31B5  9a423a1d30           lcall 0x301d, 0x3a42  ; TradeMarket::partner@s4:3A42
9:31BA  52                   push dx
9:31BB  50                   push ax
9:31BC  66ff364857           push dword ptr [0x5748]  ; g_sim
9:31C1  9a4483de31           lcall 0x31de, 0x8344  ; Sim::resolve@s7:8344
9:31C6  8946f0               mov word ptr [bp - 0x10], ax
9:31C9  8956f2               mov word ptr [bp - 0xe], dx
9:31CC  c45ef0               les bx, ptr [bp - 0x10]
9:31CF  66268b4710           mov eax, dword ptr es:[bx + 0x10]
9:31D4  6650                 push eax
9:31D6  66ff364857           push dword ptr [0x5748]  ; g_sim
9:31DB  9a4483c02d           lcall 0x2dc0, 0x8344  ; Sim::resolve@s7:8344
9:31E0  a30c5f               mov word ptr [0x5f0c], ax
9:31E3  89160e5f             mov word ptr [0x5f0e], dx
9:31E7  c706105f0100         mov word ptr [0x5f10], 1
9:31ED  6a25                 push 0x25
9:31EF  eb03                 jmp 0x31f4
9:31F1  db 90
loc_31F2:
9:31F2  6a21                 push 0x21
loc_31F4:
9:31F4  c45e06               les bx, ptr [bp + 6]
9:31F7  26ff7708             push word ptr es:[bx + 8]
9:31FB  66ff367c5b           push dword ptr [0x5b7c]
9:3200  9a40af232f           lcall 0x2f23, 0xaf40  ; DialogCtr::open@s8:AF40
9:3205  c45e06               les bx, ptr [bp + 6]
9:3208  26ff7706             push word ptr es:[bx + 6]
9:320C  666802001101         push 0x1110002
9:3212  666a00               push 0
9:3215  9a7e300000           lcall 0, 0x307e  ; USER.SendMessage
9:321A  66682b000100         push 0x1002b
9:3220  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:3225  9aba202f32           lcall 0x322f, 0x20ba  ; Registry_get@s3:20BA
9:322A  52                   push dx
9:322B  50                   push ax
9:322C  9a8e039e2f           lcall 0x2f9e, 0x38e  ; Alerts::isOn@s3:038E
9:3231  b80100               mov ax, 1
loc_3234:
9:3234  99                   cdq
9:3235  5e                   pop si
9:3236  5f                   pop di
9:3237  c9                   leave
9:3238  ca0a00               retf 0xa
9:323B  db 00

; ---------------- TradeDlg::selectPartner@s9:323C FAR size=108 callers=1
;   apis: USER.SendMessage
;   list selection
9:323C  c8080000             enter 8, 0
9:3240  c45e06               les bx, ptr [bp + 6]
9:3243  26ffb79200           push word ptr es:[bx + 0x92]
9:3248  666800000704         push 0x4070000
9:324E  666a00               push 0
9:3251  9a6b320000           lcall 0, 0x326b  ; USER.SendMessage
9:3256  8946fc               mov word ptr [bp - 4], ax
9:3259  c45e06               les bx, ptr [bp + 6]
9:325C  26ffb79400           push word ptr es:[bx + 0x94]
9:3261  666800000704         push 0x4070000
9:3267  666a00               push 0
9:326A  9a87320000           lcall 0, 0x3287  ; USER.SendMessage
9:326F  8946f8               mov word ptr [bp - 8], ax
9:3272  c45e06               les bx, ptr [bp + 6]
9:3275  26ffb79200           push word ptr es:[bx + 0x92]
9:327A  680804               push 0x408
9:327D  ff76fc               push word ptr [bp - 4]
9:3280  8d879a00             lea ax, [bx + 0x9a]
9:3284  06                   push es
9:3285  50                   push ax
9:3286  9aa0320000           lcall 0, 0x32a0  ; USER.SendMessage
9:328B  c45e06               les bx, ptr [bp + 6]
9:328E  26ffb79400           push word ptr es:[bx + 0x94]
9:3293  680804               push 0x408
9:3296  ff76f8               push word ptr [bp - 8]
9:3299  8d879a01             lea ax, [bx + 0x19a]
9:329D  06                   push es
9:329E  50                   push ax
9:329F  9a16320000           lcall 0, 0x3216  ; USER.SendMessage
9:32A4  c9                   leave
9:32A5  ca0400               retf 4

; ---------------- TradeDlg::showDiplomacy@s9:32A8 FAR size=114 callers=1
;   apis: USER.EnableWindow, USER.SetWindowText
;   the partner's diplomacy text
9:32A8  c80a0000             enter 0xa, 0
9:32AC  57                   push di
9:32AD  56                   push si
9:32AE  8b4606               mov ax, word ptr [bp + 6]
9:32B1  8b5608               mov dx, word ptr [bp + 8]
9:32B4  059a01               add ax, 0x19a
9:32B7  52                   push dx
9:32B8  50                   push ax
9:32B9  8b4e06               mov cx, word ptr [bp + 6]
9:32BC  81c19a00             add cx, 0x9a
9:32C0  52                   push dx
9:32C1  51                   push cx
9:32C2  c47606               les si, ptr [bp + 6]
9:32C5  6626ffb49600         push dword ptr es:[si + 0x96]
9:32CB  8bf1                 mov si, cx
9:32CD  8946f6               mov word ptr [bp - 0xa], ax
9:32D0  8956f8               mov word ptr [bp - 8], dx
9:32D3  8bfa                 mov di, dx
9:32D5  9a5c3afb32           lcall 0x32fb, 0x3a5c  ; TradeMarket::diplomacy@s4:3A5C
9:32DA  c45e06               les bx, ptr [bp + 6]
9:32DD  26ffb79000           push word ptr es:[bx + 0x90]
9:32E2  52                   push dx
9:32E3  50                   push ax
9:32E4  9aed2f0000           lcall 0, 0x2fed  ; USER.SetWindowText
9:32E9  66ff76f6             push dword ptr [bp - 0xa]
9:32ED  57                   push di
9:32EE  56                   push si
9:32EF  c45e06               les bx, ptr [bp + 6]
9:32F2  6626ffb79600         push dword ptr es:[bx + 0x96]
9:32F8  9ad8399631           lcall 0x3196, 0x39d8  ; TradeMarket::partnerByName@s4:39D8
9:32FD  8946fa               mov word ptr [bp - 6], ax
9:3300  c45e06               les bx, ptr [bp + 6]
9:3303  26ffb78e00           push word ptr es:[bx + 0x8e]
9:3308  8a46fa               mov al, byte ptr [bp - 6]
9:330B  250100               and ax, 1
9:330E  50                   push ax
9:330F  9a2a2c0000           lcall 0, 0x2c2a  ; USER.EnableWindow
9:3314  5e                   pop si
9:3315  5f                   pop di
9:3316  c9                   leave
9:3317  ca0400               retf 4

; ---------------- TradeDlg::onNotify@s9:331A FAR size=90 callers=1
;   apis: USER.GetWindowRect, USER.SetWindowPos
;   list notifications
9:331A  c80c0000             enter 0xc, 0
9:331E  8b460c               mov ax, word ptr [bp + 0xc]
9:3321  8946fe               mov word ptr [bp - 2], ax
9:3324  8b4e0a               mov cx, word ptr [bp + 0xa]
9:3327  894efc               mov word ptr [bp - 4], cx
9:332A  48                   dec ax
9:332B  7437                 je 0x3364
9:332D  2d0600               sub ax, 6
9:3330  7406                 je 0x3338
9:3332  33c0                 xor ax, ax
9:3334  c9                   leave
9:3335  ca0a00               retf 0xa
loc_3338:
9:3338  ff76fc               push word ptr [bp - 4]
9:333B  8d46f4               lea ax, [bp - 0xc]
9:333E  16                   push ss
9:333F  50                   push ax
9:3340  9a5d160000           lcall 0, 0x165d  ; USER.GetWindowRect
9:3345  ff76fc               push word ptr [bp - 4]
9:3348  666a00               push 0
9:334B  6a00                 push 0
9:334D  8b46f4               mov ax, word ptr [bp - 0xc]
9:3350  2946f8               sub word ptr [bp - 8], ax
9:3353  ff76f8               push word ptr [bp - 8]
9:3356  666802005000         push 0x500002
9:335C  9a46210000           lcall 0, 0x2146  ; USER.SetWindowPos
9:3361  eb0a                 jmp 0x336d
9:3363  db 90
loc_3364:
9:3364  66ff7606             push dword ptr [bp + 6]
9:3368  90                   nop
9:3369  0e                   push cs
9:336A  e83bff               call 0x32a8  ; TradeDlg::showDiplomacy@s9:32A8
loc_336D:
9:336D  b80100               mov ax, 1
9:3370  c9                   leave
9:3371  ca0a00               retf 0xa

; ---------------- TradeDlg::fillPartners@s9:3374 FAR size=156 callers=1
;   apis: USER.SendMessage
;   the partner list
9:3374  c8200000             enter 0x20, 0
9:3378  ff760e               push word ptr [bp + 0xe]
9:337B  666800000b04         push 0x40b0000
9:3381  666a00               push 0
9:3384  9ae6330000           lcall 0, 0x33e6  ; USER.SendMessage
9:3389  c45e0a               les bx, ptr [bp + 0xa]
9:338C  06                   push es
9:338D  53                   push bx
9:338E  26c41f               les bx, ptr es:[bx]
9:3391  26ff5f10             lcall es:[bx + 0x10]
9:3395  8946fc               mov word ptr [bp - 4], ax
9:3398  8956fe               mov word ptr [bp - 2], dx
9:339B  66c746f800000000     mov dword ptr [bp - 8], 0
9:33A3  eb05                 jmp 0x33aa
9:33A5  db 90
loc_33A6:
9:33A6  66ff46f8             inc dword ptr [bp - 8]
loc_33AA:
9:33AA  668b46fc             mov eax, dword ptr [bp - 4]
9:33AE  663946f8             cmp dword ptr [bp - 8], eax
9:33B2  7358                 jae 0x340c
9:33B4  66ff76f8             push dword ptr [bp - 8]
9:33B8  c45e0a               les bx, ptr [bp + 0xa]
9:33BB  06                   push es
9:33BC  53                   push bx
9:33BD  26c41f               les bx, ptr es:[bx]
9:33C0  26ff5f04             lcall es:[bx + 4]
9:33C4  52                   push dx
9:33C5  50                   push ax
9:33C6  c45e06               les bx, ptr [bp + 6]
9:33C9  6626ffb79600         push dword ptr es:[bx + 0x96]
9:33CF  9a7a3ad832           lcall 0x32d8, 0x3a7a  ; TradeMarket::partnerName@s4:3A7A
9:33D4  8946f0               mov word ptr [bp - 0x10], ax
9:33D7  8956f2               mov word ptr [bp - 0xe], dx
9:33DA  ff760e               push word ptr [bp + 0xe]
9:33DD  666800000304         push 0x4030000
9:33E3  52                   push dx
9:33E4  50                   push ax
9:33E5  9a52320000           lcall 0, 0x3252  ; USER.SendMessage
9:33EA  8946e8               mov word ptr [bp - 0x18], ax
9:33ED  8956ea               mov word ptr [bp - 0x16], dx
9:33F0  668b46f0             mov eax, dword ptr [bp - 0x10]
9:33F4  6650                 push eax
9:33F6  9ace17192e           lcall 0x2e19, 0x17ce  ; operator_delete@s1:17CE
9:33FB  83c404               add sp, 4
9:33FE  66837ee8ff           cmp dword ptr [bp - 0x18], -1
9:3403  7407                 je 0x340c
9:3405  66837ee8fe           cmp dword ptr [bp - 0x18], -2
9:340A  759a                 jne 0x33a6
loc_340C:
9:340C  c9                   leave
9:340D  ca0a00               retf 0xa

; ---------------- TradeDlg::scalar_dtor@s9:3410 FAR size=146 callers=0
;   deleting destructor
9:3410  55                   push bp
9:3411  8bec                 mov bp, sp
9:3413  66ff7606             push dword ptr [bp + 6]
9:3417  90                   nop
9:3418  0e                   push cs
9:3419  e8eafa               call 0x2f06  ; TradeDlg::~TradeDlg@s9:2F06
9:341C  f6460a01             test byte ptr [bp + 0xa], 1
9:3420  7409                 je 0x342b
9:3422  66ff7606             push dword ptr [bp + 6]
9:3426  9ace17f933           lcall 0x33f9, 0x17ce  ; operator_delete@s1:17CE
loc_342B:
9:342B  8b4606               mov ax, word ptr [bp + 6]
9:342E  8b5608               mov dx, word ptr [bp + 8]
9:3431  c9                   leave
9:3432  ca0600               retf 6
9:3435  db 90 10 34 40 34 10 3a 2c 2e 5a 2f 44 34 c0 79 48
9:3445  db 34 1a 31 4c 34 32 2f 50 34 56 7f 54 34 b2 7b 58
9:3455  db 34 1c 7f 5c 34 12 82 60 34 86 7f 64 34 0c 80 68
9:3465  db 34 54 80 6c 34 5e 7e 70 34 58 81 74 34 b6 81 78
9:3475  db 34 fe 81 80 34 ea 60 8c 34 4a 82 84 34 66 82 88
9:3485  db 34 90 2f a0 34 ee 60 90 34 f4 60 94 34 fa 60 9c
9:3495  db 34 a4 a2 03 32 fe 60 d2 33 7e 80 15 2f

; ---------------- CounterOfferDlg::CounterOfferDlg@s9:34A2 FAR size=100 callers=1
;   dialog 402 "%s - Trade Counter Offer" (vtable 38FA)
9:34A2  55                   push bp
9:34A3  8bec                 mov bp, sp
9:34A5  ff7612               push word ptr [bp + 0x12]
9:34A8  689201               push 0x192
9:34AB  66ff760a             push dword ptr [bp + 0xa]
9:34AF  6a01                 push 1
9:34B1  66ff7606             push dword ptr [bp + 6]
9:34B5  90                   nop
9:34B6  0e                   push cs
9:34B7  e86e42               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:34BA  c45e06               les bx, ptr [bp + 6]
9:34BD  662bc0               sub eax, eax
9:34C0  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:34C6  2689879200           mov word ptr es:[bx + 0x92], ax
9:34CB  2689879400           mov word ptr es:[bx + 0x94], ax
9:34D0  2689879600           mov word ptr es:[bx + 0x96], ax
9:34D5  2689879800           mov word ptr es:[bx + 0x98], ax
9:34DA  26c707fa38           mov word ptr es:[bx], 0x38fa
9:34DF  26c747023834         mov word ptr es:[bx + 2], 0x3438  ; SEGMENT s9:0000
9:34E5  6a3c                 push 0x3c
9:34E7  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:34EC  9aba203431           lcall 0x3134, 0x20ba  ; Registry_get@s3:20BA
9:34F1  c45e06               les bx, ptr [bp + 6]
9:34F4  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:34F9  2689979000           mov word ptr es:[bx + 0x90], dx
9:34FE  8bc3                 mov ax, bx
9:3500  8cc2                 mov dx, es
9:3502  c9                   leave
9:3503  ca0e00               retf 0xe

; ---------------- CounterOfferDlg::~CounterOfferDlg@s9:3506 FAR size=44 callers=1
;   dtor
9:3506  55                   push bp
9:3507  8bec                 mov bp, sp
9:3509  c45e06               les bx, ptr [bp + 6]
9:350C  26c707fa38           mov word ptr es:[bx], 0x38fa
9:3511  26c74702e334         mov word ptr es:[bx + 2], 0x34e3  ; SEGMENT s9:0000
9:3517  26ff7706             push word ptr es:[bx + 6]
9:351B  66ff367c5b           push dword ptr [0x5b7c]
9:3520  9ae0b69834           lcall 0x3498, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:3525  66ff7606             push dword ptr [bp + 6]
9:3529  90                   nop
9:352A  0e                   push cs
9:352B  e8fe42               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:352E  c9                   leave
9:352F  ca0400               retf 4

; ---------------- CounterOfferDlg::close@s9:3532 size=40 callers=0
;   (vslot 5)
9:3532  c8040000             enter 4, 0
9:3536  666a2b               push 0x2b
9:3539  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:353E  9aba204835           lcall 0x3548, 0x20ba  ; Registry_get@s3:20BA
9:3543  52                   push dx
9:3544  50                   push ax
9:3545  9a8e03ef34           lcall 0x34ef, 0x38e  ; Alerts::isOn@s3:038E
9:354A  66ff7608             push dword ptr [bp + 8]
9:354E  ff7606               push word ptr [bp + 6]
9:3551  90                   nop
9:3552  0e                   push cs
9:3553  e84246               call 0x7b98  ; OPDialog::close@s9:7B98
9:3556  c9                   leave
9:3557  ca0600               retf 6

; ---------------- CounterOfferDlg::init@s9:355A FAR size=54 callers=0
;   apis: USER.SetFocus, USER.ShowWindow
;   (vslot 2)
9:355A  55                   push bp
9:355B  8bec                 mov bp, sp
9:355D  66ff7606             push dword ptr [bp + 6]
9:3561  90                   nop
9:3562  0e                   push cs
9:3563  e87c43               call 0x78e2  ; OPDialog::create@s9:78E2
9:3566  666aff               push -1
9:3569  66ff7606             push dword ptr [bp + 6]
9:356D  90                   nop
9:356E  0e                   push cs
9:356F  e8fa4c               call 0x826c  ; OPDialog::position@s9:826C
9:3572  c45e06               les bx, ptr [bp + 6]
9:3575  26ff7706             push word ptr es:[bx + 6]
9:3579  6a05                 push 5
9:357B  9a7c2f0000           lcall 0, 0x2f7c  ; USER.ShowWindow
9:3580  c45e06               les bx, ptr [bp + 6]
9:3583  26ff7706             push word ptr es:[bx + 6]
9:3587  9a882f0000           lcall 0, 0x2f88  ; USER.SetFocus
9:358C  c9                   leave
9:358D  ca0400               retf 4

; ---------------- CounterOfferDlg::fill@s9:3590 size=608 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.GetWindowText, USER.SetWindowText, USER._wsprintf
;   (vslot 20) the offer and its prices
9:3590  c8ae0500             enter 0x5ae, 0
9:3594  6a02                 push 2
9:3596  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:359B  9aba205936           lcall 0x3659, 0x20ba  ; Registry_get@s3:20BA
9:35A0  8986fafb             mov word ptr [bp - 0x406], ax
9:35A4  8996fcfb             mov word ptr [bp - 0x404], dx
9:35A8  c49efafb             les bx, ptr [bp - 0x406]
9:35AC  66268b4768           mov eax, dword ptr es:[bx + 0x68]
9:35B1  668986f6fb           mov dword ptr [bp - 0x40a], eax
9:35B6  c45e06               les bx, ptr [bp + 6]
9:35B9  26ff7706             push word ptr es:[bx + 6]
9:35BD  8d86f6fa             lea ax, [bp - 0x50a]
9:35C1  16                   push ss
9:35C2  50                   push ax
9:35C3  688000               push 0x80
9:35C6  9ac32f0000           lcall 0, 0x2fc3  ; USER.GetWindowText
9:35CB  66ffb6f6fb           push dword ptr [bp - 0x40a]
9:35D0  8d86f6fa             lea ax, [bp - 0x50a]
9:35D4  16                   push ss
9:35D5  50                   push ax
9:35D6  8d8674fa             lea ax, [bp - 0x58c]
9:35DA  16                   push ss
9:35DB  50                   push ax
9:35DC  9a6d360000           lcall 0, 0x366d  ; USER._wsprintf
9:35E1  83c40c               add sp, 0xc
9:35E4  c45e06               les bx, ptr [bp + 6]
9:35E7  26ff7706             push word ptr es:[bx + 6]
9:35EB  8d8674fa             lea ax, [bp - 0x58c]
9:35EF  16                   push ss
9:35F0  50                   push ax
9:35F1  9a8f360000           lcall 0, 0x368f  ; USER.SetWindowText
9:35F6  c45e06               les bx, ptr [bp + 6]
9:35F9  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:35FF  9ab6342436           lcall 0x3624, 0x34b6  ; TradeMarket::offerText@s4:34B6
9:3604  898670fa             mov word ptr [bp - 0x590], ax
9:3608  899672fa             mov word ptr [bp - 0x58e], dx
9:360C  8d866cfa             lea ax, [bp - 0x594]
9:3610  16                   push ss
9:3611  50                   push ax
9:3612  8d8e68fa             lea cx, [bp - 0x598]
9:3616  16                   push ss
9:3617  51                   push cx
9:3618  c45e06               les bx, ptr [bp + 6]
9:361B  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:3621  9a443db336           lcall 0x36b3, 0x3d44  ; TradeMarket::prices@s4:3D44
9:3626  c45e06               les bx, ptr [bp + 6]
9:3629  26ff7706             push word ptr es:[bx + 6]
9:362D  689301               push 0x193
9:3630  9a7f360000           lcall 0, 0x367f  ; USER.GetDlgItem
9:3635  c45e06               les bx, ptr [bp + 6]
9:3638  2689879800           mov word ptr es:[bx + 0x98], ax
9:363D  50                   push ax
9:363E  6a01                 push 1
9:3640  9ad7370000           lcall 0, 0x37d7  ; USER.EnableWindow
9:3645  684b04               push 0x44b
9:3648  8d86fefb             lea ax, [bp - 0x402]
9:364C  16                   push ss
9:364D  50                   push ax
9:364E  68ff03               push 0x3ff
9:3651  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:3656  9ae084e336           lcall 0x36e3, 0x84e0  ; LoadStringTo@s3:84E0
9:365B  66ffb66cfa           push dword ptr [bp - 0x594]
9:3660  8d86fefb             lea ax, [bp - 0x402]
9:3664  16                   push ss
9:3665  50                   push ax
9:3666  8d86f6fa             lea ax, [bp - 0x50a]
9:366A  16                   push ss
9:366B  50                   push ax
9:366C  9a1c370000           lcall 0, 0x371c  ; USER._wsprintf
9:3671  83c40c               add sp, 0xc
9:3674  c45e06               les bx, ptr [bp + 6]
9:3677  26ff7706             push word ptr es:[bx + 6]
9:367B  689501               push 0x195
9:367E  9a9e360000           lcall 0, 0x369e  ; USER.GetDlgItem
9:3683  898666fa             mov word ptr [bp - 0x59a], ax
9:3687  50                   push ax
9:3688  8d86f6fa             lea ax, [bp - 0x50a]
9:368C  16                   push ss
9:368D  50                   push ax
9:368E  9ab8360000           lcall 0, 0x36b8  ; USER.SetWindowText
9:3693  c45e06               les bx, ptr [bp + 6]
9:3696  26ff7706             push word ptr es:[bx + 6]
9:369A  689601               push 0x196
9:369D  9ac7360000           lcall 0, 0x36c7  ; USER.GetDlgItem
9:36A2  898664fa             mov word ptr [bp - 0x59c], ax
9:36A6  50                   push ax
9:36A7  c45e06               les bx, ptr [bp + 6]
9:36AA  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:36B0  9ab6346137           lcall 0x3761, 0x34b6  ; TradeMarket::offerText@s4:34B6
9:36B5  52                   push dx
9:36B6  50                   push ax
9:36B7  9af0360000           lcall 0, 0x36f0  ; USER.SetWindowText
9:36BC  c45e06               les bx, ptr [bp + 6]
9:36BF  26ff7706             push word ptr es:[bx + 6]
9:36C3  689701               push 0x197
9:36C6  9a2e370000           lcall 0, 0x372e  ; USER.GetDlgItem
9:36CB  898662fa             mov word ptr [bp - 0x59e], ax
9:36CF  684304               push 0x443
9:36D2  8d86fefb             lea ax, [bp - 0x402]
9:36D6  16                   push ss
9:36D7  50                   push ax
9:36D8  68ff03               push 0x3ff
9:36DB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:36E0  9ae0840837           lcall 0x3708, 0x84e0  ; LoadStringTo@s3:84E0
9:36E5  ffb662fa             push word ptr [bp - 0x59e]
9:36E9  8d86fefb             lea ax, [bp - 0x402]
9:36ED  16                   push ss
9:36EE  50                   push ax
9:36EF  9a3e370000           lcall 0, 0x373e  ; USER.SetWindowText
9:36F4  684c04               push 0x44c
9:36F7  8d86fefb             lea ax, [bp - 0x402]
9:36FB  16                   push ss
9:36FC  50                   push ax
9:36FD  68ff03               push 0x3ff
9:3700  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:3705  9ae0848337           lcall 0x3783, 0x84e0  ; LoadStringTo@s3:84E0
9:370A  66ffb668fa           push dword ptr [bp - 0x598]
9:370F  8d86fefb             lea ax, [bp - 0x402]
9:3713  16                   push ss
9:3714  50                   push ax
9:3715  8d86f6fa             lea ax, [bp - 0x50a]
9:3719  16                   push ss
9:371A  50                   push ax
9:371B  9ad82f0000           lcall 0, 0x2fd8  ; USER._wsprintf
9:3720  83c40c               add sp, 0xc
9:3723  c45e06               les bx, ptr [bp + 6]
9:3726  26ff7706             push word ptr es:[bx + 6]
9:372A  689801               push 0x198
9:372D  9a4d370000           lcall 0, 0x374d  ; USER.GetDlgItem
9:3732  898660fa             mov word ptr [bp - 0x5a0], ax
9:3736  50                   push ax
9:3737  8d86f6fa             lea ax, [bp - 0x50a]
9:373B  16                   push ss
9:373C  50                   push ax
9:373D  9a90370000           lcall 0, 0x3790  ; USER.SetWindowText
9:3742  c45e06               les bx, ptr [bp + 6]
9:3745  26ff7706             push word ptr es:[bx + 6]
9:3749  689901               push 0x199
9:374C  9a9f370000           lcall 0, 0x379f  ; USER.GetDlgItem
9:3751  89865efa             mov word ptr [bp - 0x5a2], ax
9:3755  c45e06               les bx, ptr [bp + 6]
9:3758  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:375E  9ab0357c34           lcall 0x347c, 0x35b0  ; TradeMarket::priceText@s4:35B0
9:3763  89865afa             mov word ptr [bp - 0x5a6], ax
9:3767  89965cfa             mov word ptr [bp - 0x5a4], dx
9:376B  0bd0                 or dx, ax
9:376D  7571                 jne 0x37e0
9:376F  684d04               push 0x44d
9:3772  8d86fefb             lea ax, [bp - 0x402]
9:3776  16                   push ss
9:3777  50                   push ax
9:3778  68ff03               push 0x3ff
9:377B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:3780  9ae084bb37           lcall 0x37bb, 0x84e0  ; LoadStringTo@s3:84E0
9:3785  ffb65efa             push word ptr [bp - 0x5a2]
9:3789  8d86fefb             lea ax, [bp - 0x402]
9:378D  16                   push ss
9:378E  50                   push ax
9:378F  9ac8370000           lcall 0, 0x37c8  ; USER.SetWindowText
9:3794  c45e06               les bx, ptr [bp + 6]
9:3797  26ff7706             push word ptr es:[bx + 6]
9:379B  689a01               push 0x19a
9:379E  9afc2f0000           lcall 0, 0x2ffc  ; USER.GetDlgItem
9:37A3  898652fa             mov word ptr [bp - 0x5ae], ax
9:37A7  684e04               push 0x44e
9:37AA  8d86fefb             lea ax, [bp - 0x402]
9:37AE  16                   push ss
9:37AF  50                   push ax
9:37B0  68ff03               push 0x3ff
9:37B3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:37B8  9ae0844135           lcall 0x3541, 0x84e0  ; LoadStringTo@s3:84E0
9:37BD  ffb652fa             push word ptr [bp - 0x5ae]
9:37C1  8d86fefb             lea ax, [bp - 0x402]
9:37C5  16                   push ss
9:37C6  50                   push ax
9:37C7  9ae7370000           lcall 0, 0x37e7  ; USER.SetWindowText
9:37CC  c45e06               les bx, ptr [bp + 6]
9:37CF  26ffb79800           push word ptr es:[bx + 0x98]
9:37D4  6a00                 push 0
9:37D6  9a10330000           lcall 0, 0x3310  ; USER.EnableWindow
9:37DB  c9                   leave
9:37DC  ca0400               retf 4
9:37DF  db 90
loc_37E0:
9:37E0  66ffb65cfa           push dword ptr [bp - 0x5a4]
9:37E5  50                   push ax
9:37E6  9ae5320000           lcall 0, 0x32e5  ; USER.SetWindowText
9:37EB  c9                   leave
9:37EC  ca0400               retf 4
9:37EF  db 00

; ---------------- CounterOfferDlg::onCommand@s9:37F0 FAR size=228 callers=0
;   apis: USER.MessageBox, USER.PostMessage, USER.SendMessage
;   (vslot 4) accept: makes the trade
9:37F0  c8120400             enter 0x412, 0
9:37F4  8b460e               mov ax, word ptr [bp + 0xe]
9:37F7  2d9301               sub ax, 0x193
9:37FA  7460                 je 0x385c
9:37FC  48                   dec ax
9:37FD  7415                 je 0x3814
9:37FF  66ff760c             push dword ptr [bp + 0xc]
9:3803  66ff7608             push dword ptr [bp + 8]
9:3807  ff7606               push word ptr [bp + 6]
9:380A  90                   nop
9:380B  0e                   push cs
9:380C  e82d43               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:380F  c9                   leave
9:3810  ca0a00               retf 0xa
9:3813  db 90
loc_3814:
9:3814  6a21                 push 0x21
9:3816  c45e06               les bx, ptr [bp + 6]
9:3819  26ff7708             push word ptr es:[bx + 8]
9:381D  66ff367c5b           push dword ptr [0x5b7c]
9:3822  9a40af2335           lcall 0x3523, 0xaf40  ; DialogCtr::open@s8:AF40
9:3827  c45e06               les bx, ptr [bp + 6]
9:382A  26ff7706             push word ptr es:[bx + 6]
9:382E  666802001101         push 0x1110002
9:3834  666a00               push 0
9:3837  9a85330000           lcall 0, 0x3385  ; USER.SendMessage
9:383C  66682b000100         push 0x1002b
9:3842  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:3847  9aba205738           lcall 0x3857, 0x20ba  ; Registry_get@s3:20BA
9:384C  8946fc               mov word ptr [bp - 4], ax
9:384F  8956fe               mov word ptr [bp - 2], dx
9:3852  52                   push dx
9:3853  50                   push ax
9:3854  9a8e036638           lcall 0x3866, 0x38e  ; Alerts::isOn@s3:038E
9:3859  eb70                 jmp 0x38cb
9:385B  db 90
loc_385C:
9:385C  6a02                 push 2
9:385E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:3863  9aba208e38           lcall 0x388e, 0x20ba  ; Registry_get@s3:20BA
9:3868  8946fc               mov word ptr [bp - 4], ax
9:386B  8956fe               mov word ptr [bp - 2], dx
9:386E  c45efc               les bx, ptr [bp - 4]
9:3871  66268b4768           mov eax, dword ptr es:[bx + 0x68]
9:3876  668946f8             mov dword ptr [bp - 8], eax
9:387A  684f04               push 0x44f
9:387D  8d86f6fb             lea ax, [bp - 0x40a]
9:3881  16                   push ss
9:3882  50                   push ax
9:3883  68ff03               push 0x3ff
9:3886  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:388B  9ae0849e35           lcall 0x359e, 0x84e0  ; LoadStringTo@s3:84E0
9:3890  c45e06               les bx, ptr [bp + 6]
9:3893  26ff7706             push word ptr es:[bx + 6]
9:3897  8d86f6fb             lea ax, [bp - 0x40a]
9:389B  16                   push ss
9:389C  50                   push ax
9:389D  66ff76f8             push dword ptr [bp - 8]
9:38A1  6a30                 push 0x30
9:38A3  9a78080000           lcall 0, 0x878  ; USER.MessageBox
9:38A8  c45e06               les bx, ptr [bp + 6]
9:38AB  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:38B1  9a10370236           lcall 0x3602, 0x3710  ; TradeMarket::trade@s4:3710
9:38B6  c45e06               les bx, ptr [bp + 6]
9:38B9  26ff7706             push word ptr es:[bx + 6]
9:38BD  666802001101         push 0x1110002
9:38C3  666a00               push 0
9:38C6  9aa7270000           lcall 0, 0x27a7  ; USER.PostMessage
loc_38CB:
9:38CB  b80100               mov ax, 1
9:38CE  99                   cdq
9:38CF  c9                   leave
9:38D0  ca0a00               retf 0xa
9:38D3  db 00

; ---------------- CounterOfferDlg::scalar_dtor@s9:38D4 FAR size=146 callers=0
;   deleting destructor
9:38D4  55                   push bp
9:38D5  8bec                 mov bp, sp
9:38D7  66ff7606             push dword ptr [bp + 6]
9:38DB  90                   nop
9:38DC  0e                   push cs
9:38DD  e826fc               call 0x3506  ; CounterOfferDlg::~CounterOfferDlg@s9:3506
9:38E0  f6460a01             test byte ptr [bp + 0xa], 1
9:38E4  7409                 je 0x38ef
9:38E6  66ff7606             push dword ptr [bp + 6]
9:38EA  9ace172934           lcall 0x3429, 0x17ce  ; operator_delete@s1:17CE
loc_38EF:
9:38EF  8b4606               mov ax, word ptr [bp + 6]
9:38F2  8b5608               mov dx, word ptr [bp + 8]
9:38F5  c9                   leave
9:38F6  ca0600               retf 6
9:38F9  db 90 d4 38 04 39 10 3a 3c 34 5a 35 08 39 c0 79 0c
9:3909  db 39 f0 37 10 39 32 35 14 39 56 7f 18 39 b2 7b 1c
9:3919  db 39 1c 7f 20 39 12 82 24 39 86 7f 28 39 0c 80 2c
9:3929  db 39 54 80 30 39 5e 7e 34 39 58 81 38 39 b6 81 3c
9:3939  db 39 fe 81 44 39 ea 60 50 39 4a 82 48 39 66 82 4c
9:3949  db 39 90 35 64 39 ee 60 54 39 f4 60 58 39 fa 60 60
9:3959  db 39 a4 a2 25 38 fe 60 b4 38 7e 80 15 35

; ---------------- TradeSessionDlg::TradeSessionDlg@s9:3966 FAR size=124 callers=1
;   dialog 389 "%s - Trade Session" (vtable 3FFC)
9:3966  55                   push bp
9:3967  8bec                 mov bp, sp
9:3969  ff7612               push word ptr [bp + 0x12]
9:396C  688501               push 0x185
9:396F  66ff760a             push dword ptr [bp + 0xa]
9:3973  6a01                 push 1
9:3975  66ff7606             push dword ptr [bp + 6]
9:3979  90                   nop
9:397A  0e                   push cs
9:397B  e8aa3d               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:397E  c45e06               les bx, ptr [bp + 6]
9:3981  662bc0               sub eax, eax
9:3984  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:398A  662689879200         mov dword ptr es:[bx + 0x92], eax
9:3990  662689879600         mov dword ptr es:[bx + 0x96], eax
9:3996  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:399B  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:39A0  2689879e00           mov word ptr es:[bx + 0x9e], ax
9:39A5  268987a000           mov word ptr es:[bx + 0xa0], ax
9:39AA  268987a200           mov word ptr es:[bx + 0xa2], ax
9:39AF  26c787a4000500       mov word ptr es:[bx + 0xa4], 5
9:39B6  26c707fc3f           mov word ptr es:[bx], 0x3ffc
9:39BB  26c74702fc38         mov word ptr es:[bx + 2], 0x38fc  ; SEGMENT s9:0000 | 'Null Ptr'
9:39C1  6a3c                 push 0x3c
9:39C3  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:39C8  9aba204a38           lcall 0x384a, 0x20ba  ; Registry_get@s3:20BA
9:39CD  c45e06               les bx, ptr [bp + 6]
9:39D0  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:39D5  2689979000           mov word ptr es:[bx + 0x90], dx
9:39DA  8bc3                 mov ax, bx
9:39DC  8cc2                 mov dx, es
9:39DE  c9                   leave
9:39DF  ca0e00               retf 0xe

; ---------------- TradeSessionDlg::~TradeSessionDlg@s9:39E2 FAR size=44 callers=1
;   dtor
9:39E2  55                   push bp
9:39E3  8bec                 mov bp, sp
9:39E5  c45e06               les bx, ptr [bp + 6]
9:39E8  26c707fc3f           mov word ptr es:[bx], 0x3ffc
9:39ED  26c74702bf39         mov word ptr es:[bx + 2], 0x39bf  ; SEGMENT s9:0000
9:39F3  26ff7706             push word ptr es:[bx + 6]
9:39F7  66ff367c5b           push dword ptr [0x5b7c]
9:39FC  9ae0b65c39           lcall 0x395c, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:3A01  66ff7606             push dword ptr [bp + 6]
9:3A05  90                   nop
9:3A06  0e                   push cs
9:3A07  e8223e               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:3A0A  c9                   leave
9:3A0B  ca0400               retf 4

; ---------------- TradeSessionDlg::close@s9:3A0E size=40 callers=0
;   (vslot 5)
9:3A0E  c8040000             enter 4, 0
9:3A12  666a2b               push 0x2b
9:3A15  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:3A1A  9aba20243a           lcall 0x3a24, 0x20ba  ; Registry_get@s3:20BA
9:3A1F  52                   push dx
9:3A20  50                   push ax
9:3A21  9a8e03cb39           lcall 0x39cb, 0x38e  ; Alerts::isOn@s3:038E
9:3A26  66ff7608             push dword ptr [bp + 8]
9:3A2A  ff7606               push word ptr [bp + 6]
9:3A2D  90                   nop
9:3A2E  0e                   push cs
9:3A2F  e86641               call 0x7b98  ; OPDialog::close@s9:7B98
9:3A32  c9                   leave
9:3A33  ca0600               retf 6

; ---------------- TradeSessionDlg::setQuantity@s9:3A36 size=178 callers=0
;   apis: USER.EnableWindow, USER.SetDlgItemInt
;   (vslot 21)
9:3A36  c8020000             enter 2, 0
9:3A3A  c746fe0000           mov word ptr [bp - 2], 0
9:3A3F  8b460e               mov ax, word ptr [bp + 0xe]
9:3A42  eb2e                 jmp 0x3a72
loc_3A44:
9:3A44  c45e06               les bx, ptr [bp + 6]
9:3A47  268b879e00           mov ax, word ptr es:[bx + 0x9e]
9:3A4C  2639879c00           cmp word ptr es:[bx + 0x9c], ax
9:3A51  7326                 jae 0x3a79
9:3A53  26ff879c00           inc word ptr es:[bx + 0x9c]
loc_3A58:
9:3A58  c746fe0100           mov word ptr [bp - 2], 1
9:3A5D  eb1a                 jmp 0x3a79
9:3A5F  db 90
loc_3A60:
9:3A60  c45e06               les bx, ptr [bp + 6]
9:3A63  2683bf9c0000         cmp word ptr es:[bx + 0x9c], 0
9:3A69  740e                 je 0x3a79
9:3A6B  26ff8f9c00           dec word ptr es:[bx + 0x9c]
9:3A70  ebe6                 jmp 0x3a58
loc_3A72:
9:3A72  0bc0                 or ax, ax
9:3A74  74ce                 je 0x3a44
9:3A76  48                   dec ax
9:3A77  74e7                 je 0x3a60
loc_3A79:
9:3A79  837efe00             cmp word ptr [bp - 2], 0
9:3A7D  7416                 je 0x3a95
9:3A7F  c45e06               les bx, ptr [bp + 6]
9:3A82  26ff7706             push word ptr es:[bx + 6]
9:3A86  688e01               push 0x18e
9:3A89  26ffb79c00           push word ptr es:[bx + 0x9c]
9:3A8E  6a00                 push 0
9:3A90  9aa32d0000           lcall 0, 0x2da3  ; USER.SetDlgItemInt
loc_3A95:
9:3A95  c45e06               les bx, ptr [bp + 6]
9:3A98  2683bf9c0000         cmp word ptr es:[bx + 0x9c], 0
9:3A9E  741b                 je 0x3abb
9:3AA0  2683bfa20000         cmp word ptr es:[bx + 0xa2], 0
9:3AA6  7513                 jne 0x3abb
9:3AA8  26c787a2000100       mov word ptr es:[bx + 0xa2], 1
9:3AAF  26ffb79a00           push word ptr es:[bx + 0x9a]
9:3AB4  6a01                 push 1
9:3AB6  9add3a0000           lcall 0, 0x3add  ; USER.EnableWindow
loc_3ABB:
9:3ABB  c45e06               les bx, ptr [bp + 6]
9:3ABE  2683bf9c0000         cmp word ptr es:[bx + 0x9c], 0
9:3AC4  751b                 jne 0x3ae1
9:3AC6  2683bfa20000         cmp word ptr es:[bx + 0xa2], 0
9:3ACC  7413                 je 0x3ae1
9:3ACE  26c787a2000000       mov word ptr es:[bx + 0xa2], 0
9:3AD5  26ffb79a00           push word ptr es:[bx + 0x9a]
9:3ADA  6a00                 push 0
9:3ADC  9a41360000           lcall 0, 0x3641  ; USER.EnableWindow
loc_3AE1:
9:3AE1  33c0                 xor ax, ax
9:3AE3  c9                   leave
9:3AE4  ca0a00               retf 0xa
9:3AE7  db 00

; ---------------- TradeSessionDlg::init@s9:3AE8 FAR size=54 callers=0
;   apis: USER.SetFocus, USER.ShowWindow
;   (vslot 2)
9:3AE8  55                   push bp
9:3AE9  8bec                 mov bp, sp
9:3AEB  66ff7606             push dword ptr [bp + 6]
9:3AEF  90                   nop
9:3AF0  0e                   push cs
9:3AF1  e8ee3d               call 0x78e2  ; OPDialog::create@s9:78E2
9:3AF4  666aff               push -1
9:3AF7  66ff7606             push dword ptr [bp + 6]
9:3AFB  90                   nop
9:3AFC  0e                   push cs
9:3AFD  e86c47               call 0x826c  ; OPDialog::position@s9:826C
9:3B00  c45e06               les bx, ptr [bp + 6]
9:3B03  26ff7706             push word ptr es:[bx + 6]
9:3B07  6a05                 push 5
9:3B09  9a7c350000           lcall 0, 0x357c  ; USER.ShowWindow
9:3B0E  c45e06               les bx, ptr [bp + 6]
9:3B11  26ff7706             push word ptr es:[bx + 6]
9:3B15  9a88350000           lcall 0, 0x3588  ; USER.SetFocus
9:3B1A  c9                   leave
9:3B1B  ca0400               retf 4

; ---------------- TradeSessionDlg::fill@s9:3B1E size=326 callers=0
;   apis: USER.CheckRadioButton, USER.GetDlgItem, USER.GetWindowText, USER.SetDlgItemText, USER.SetWindowText, USER._wsprintf
;   (vslot 20) the page radio buttons and prices
9:3B1E  c8180100             enter 0x118, 0
9:3B22  57                   push di
9:3B23  56                   push si
9:3B24  6a02                 push 2
9:3B26  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:3B2B  9aba20c33b           lcall 0x3bc3, 0x20ba  ; Registry_get@s3:20BA
9:3B30  8946fc               mov word ptr [bp - 4], ax
9:3B33  8956fe               mov word ptr [bp - 2], dx
9:3B36  c45efc               les bx, ptr [bp - 4]
9:3B39  66268b4768           mov eax, dword ptr es:[bx + 0x68]
9:3B3E  668946f8             mov dword ptr [bp - 8], eax
9:3B42  c45e06               les bx, ptr [bp + 6]
9:3B45  26ff7706             push word ptr es:[bx + 6]
9:3B49  8d8676ff             lea ax, [bp - 0x8a]
9:3B4D  16                   push ss
9:3B4E  50                   push ax
9:3B4F  688000               push 0x80
9:3B52  9ac7350000           lcall 0, 0x35c7  ; USER.GetWindowText
9:3B57  66ff76f8             push dword ptr [bp - 8]
9:3B5B  8d8676ff             lea ax, [bp - 0x8a]
9:3B5F  16                   push ss
9:3B60  50                   push ax
9:3B61  8d86f4fe             lea ax, [bp - 0x10c]
9:3B65  16                   push ss
9:3B66  50                   push ax
9:3B67  9ae03b0000           lcall 0, 0x3be0  ; USER._wsprintf
9:3B6C  83c40c               add sp, 0xc
9:3B6F  c45e06               les bx, ptr [bp + 6]
9:3B72  26ff7706             push word ptr es:[bx + 6]
9:3B76  8d86f4fe             lea ax, [bp - 0x10c]
9:3B7A  16                   push ss
9:3B7B  50                   push ax
9:3B7C  9af2350000           lcall 0, 0x35f2  ; USER.SetWindowText
9:3B81  8b4606               mov ax, word ptr [bp + 6]
9:3B84  8b5608               mov dx, word ptr [bp + 8]
9:3B87  059600               add ax, 0x96
9:3B8A  52                   push dx
9:3B8B  50                   push ax
9:3B8C  8b4e06               mov cx, word ptr [bp + 6]
9:3B8F  81c19200             add cx, 0x92
9:3B93  52                   push dx
9:3B94  51                   push cx
9:3B95  c47606               les si, ptr [bp + 6]
9:3B98  6626ffb48e00         push dword ptr es:[si + 0x8e]
9:3B9E  8bf1                 mov si, cx
9:3BA0  8986e8fe             mov word ptr [bp - 0x118], ax
9:3BA4  8996eafe             mov word ptr [bp - 0x116], dx
9:3BA8  8bfa                 mov di, dx
9:3BAA  9a443d293c           lcall 0x3c29, 0x3d44  ; TradeMarket::prices@s4:3D44
9:3BAF  68d707               push 0x7d7
9:3BB2  8d86f4fe             lea ax, [bp - 0x10c]
9:3BB6  16                   push ss
9:3BB7  50                   push ax
9:3BB8  688000               push 0x80
9:3BBB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:3BC0  9ae0841d3a           lcall 0x3a1d, 0x84e0  ; LoadStringTo@s3:84E0
9:3BC5  8ec7                 mov es, di
9:3BC7  6626ff34             push dword ptr es:[si]
9:3BCB  c49ee8fe             les bx, ptr [bp - 0x118]
9:3BCF  6626ff37             push dword ptr es:[bx]
9:3BD3  8d86f4fe             lea ax, [bp - 0x10c]
9:3BD7  16                   push ss
9:3BD8  50                   push ax
9:3BD9  8d8676ff             lea ax, [bp - 0x8a]
9:3BDD  16                   push ss
9:3BDE  50                   push ax
9:3BDF  9add350000           lcall 0, 0x35dd  ; USER._wsprintf
9:3BE4  83c410               add sp, 0x10
9:3BE7  c45e06               les bx, ptr [bp + 6]
9:3BEA  26ff7706             push word ptr es:[bx + 6]
9:3BEE  688701               push 0x187
9:3BF1  8d8676ff             lea ax, [bp - 0x8a]
9:3BF5  16                   push ss
9:3BF6  50                   push ax
9:3BF7  9a462c0000           lcall 0, 0x2c46  ; USER.SetDlgItemText
9:3BFC  c45e06               les bx, ptr [bp + 6]
9:3BFF  26ff7706             push word ptr es:[bx + 6]
9:3C03  66688d018801         push 0x188018d
9:3C09  688801               push 0x188
9:3C0C  9affff0000           lcall 0, 0xffff  ; USER.CheckRadioButton
9:3C11  c45e06               les bx, ptr [bp + 6]
9:3C14  26c787a0008801       mov word ptr es:[bx + 0xa0], 0x188
9:3C1B  26ffb7a000           push word ptr es:[bx + 0xa0]
9:3C20  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:3C26  9a9e3b4039           lcall 0x3940, 0x3b9e  ; TradeMarket::pageList@s4:3B9E
9:3C2B  8986f0fe             mov word ptr [bp - 0x110], ax
9:3C2F  8996f2fe             mov word ptr [bp - 0x10e], dx
9:3C33  52                   push dx
9:3C34  50                   push ax
9:3C35  66ff7606             push dword ptr [bp + 6]
9:3C39  90                   nop
9:3C3A  0e                   push cs
9:3C3B  e8d402               call 0x3f12  ; TradeSessionDlg::fillList@s9:3F12
9:3C3E  66ff7606             push dword ptr [bp + 6]
9:3C42  90                   nop
9:3C43  0e                   push cs
9:3C44  e8c101               call 0x3e08  ; TradeSessionDlg::showPage@s9:3E08
9:3C47  c45e06               les bx, ptr [bp + 6]
9:3C4A  26ff7706             push word ptr es:[bx + 6]
9:3C4E  688601               push 0x186
9:3C51  9a31360000           lcall 0, 0x3631  ; USER.GetDlgItem
9:3C56  c45e06               les bx, ptr [bp + 6]
9:3C59  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:3C5E  5e                   pop si
9:3C5F  5f                   pop di
9:3C60  c9                   leave
9:3C61  ca0400               retf 4

; ---------------- TradeSessionDlg::onCommand@s9:3C64 size=250 callers=0
;   apis: USER.GetDlgItemInt, USER.SendDlgItemMessage, USER.SendMessage
;   (vslot 4) page, quantity, offer
9:3C64  c80a0000             enter 0xa, 0
9:3C68  8b460e               mov ax, word ptr [bp + 0xe]
9:3C6B  2d8601               sub ax, 0x186
9:3C6E  7460                 je 0x3cd0
9:3C70  2d0200               sub ax, 2
9:3C73  720a                 jb 0x3c7f
9:3C75  2d0500               sub ax, 5
9:3C78  762e                 jbe 0x3ca8
9:3C7A  2d0300               sub ax, 3
9:3C7D  7415                 je 0x3c94
loc_3C7F:
9:3C7F  66ff760c             push dword ptr [bp + 0xc]
9:3C83  66ff7608             push dword ptr [bp + 8]
9:3C87  ff7606               push word ptr [bp + 6]
9:3C8A  90                   nop
9:3C8B  0e                   push cs
9:3C8C  e8ad3e               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:3C8F  c9                   leave
9:3C90  ca0a00               retf 0xa
9:3C93  db 90
loc_3C94:
9:3C94  8b460c               mov ax, word ptr [bp + 0xc]
9:3C97  48                   dec ax
9:3C98  0f85b900             jne 0x3d55
loc_3C9C:
9:3C9C  66ff7606             push dword ptr [bp + 6]
9:3CA0  90                   nop
9:3CA1  0e                   push cs
9:3CA2  e86301               call 0x3e08  ; TradeSessionDlg::showPage@s9:3E08
9:3CA5  e9ad00               jmp 0x3d55
loc_3CA8:
9:3CA8  8b460e               mov ax, word ptr [bp + 0xe]
9:3CAB  c45e06               les bx, ptr [bp + 6]
9:3CAE  268987a000           mov word ptr es:[bx + 0xa0], ax
9:3CB3  50                   push ax
9:3CB4  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:3CBA  9a9e3b143d           lcall 0x3d14, 0x3b9e  ; TradeMarket::pageList@s4:3B9E
9:3CBF  8946fa               mov word ptr [bp - 6], ax
9:3CC2  52                   push dx
9:3CC3  50                   push ax
9:3CC4  66ff7606             push dword ptr [bp + 6]
9:3CC8  90                   nop
9:3CC9  0e                   push cs
9:3CCA  e84502               call 0x3f12  ; TradeSessionDlg::fillList@s9:3F12
9:3CCD  ebcd                 jmp 0x3c9c
9:3CCF  db 90
loc_3CD0:
9:3CD0  c45e06               les bx, ptr [bp + 6]
9:3CD3  26ff7706             push word ptr es:[bx + 6]
9:3CD7  666809049001         push 0x1900409
9:3CDD  666a00               push 0
9:3CE0  6a00                 push 0
9:3CE2  9acd300000           lcall 0, 0x30cd  ; USER.SendDlgItemMessage
9:3CE7  8946fa               mov word ptr [bp - 6], ax
9:3CEA  c45e06               les bx, ptr [bp + 6]
9:3CED  26ff7706             push word ptr es:[bx + 6]
9:3CF1  666800008e01         push 0x18e0000
9:3CF7  666a00               push 0
9:3CFA  9a672d0000           lcall 0, 0x2d67  ; USER.GetDlgItemInt
9:3CFF  c45e06               les bx, ptr [bp + 6]
9:3D02  26ffb7a000           push word ptr es:[bx + 0xa0]
9:3D07  ff76fa               push word ptr [bp - 6]
9:3D0A  50                   push ax
9:3D0B  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:3D11  9ae636ad3b           lcall 0x3bad, 0x36e6  ; TradeMarket::setOffer@s4:36E6
9:3D16  6a22                 push 0x22
9:3D18  c45e06               les bx, ptr [bp + 6]
9:3D1B  26ff7708             push word ptr es:[bx + 8]
9:3D1F  66ff367c5b           push dword ptr [0x5b7c]
9:3D24  9a40afff39           lcall 0x39ff, 0xaf40  ; DialogCtr::open@s8:AF40
9:3D29  c45e06               les bx, ptr [bp + 6]
9:3D2C  26ff7706             push word ptr es:[bx + 6]
9:3D30  666802001101         push 0x1110002
9:3D36  666a00               push 0
9:3D39  9a38380000           lcall 0, 0x3838  ; USER.SendMessage
9:3D3E  66682b000100         push 0x1002b
9:3D44  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:3D49  9aba20533d           lcall 0x3d53, 0x20ba  ; Registry_get@s3:20BA
9:3D4E  52                   push dx
9:3D4F  50                   push ax
9:3D50  9a8e032e3b           lcall 0x3b2e, 0x38e  ; Alerts::isOn@s3:038E
loc_3D55:
9:3D55  b80100               mov ax, 1
9:3D58  99                   cdq
9:3D59  c9                   leave
9:3D5A  ca0a00               retf 0xa
9:3D5D  db 00

; ---------------- TradeSessionDlg::loadBackground@s9:3D5E FAR size=126 callers=0
;   apis: USER.GetDC, USER.ReleaseDC
;   (vslot 24)
9:3D5E  c8060000             enter 6, 0
9:3D62  57                   push di
9:3D63  56                   push si
9:3D64  c45e06               les bx, ptr [bp + 6]
9:3D67  26ff7706             push word ptr es:[bx + 6]
9:3D6B  9affff0000           lcall 0, 0xffff  ; USER.GetDC
9:3D70  8946fe               mov word ptr [bp - 2], ax
9:3D73  c45e06               les bx, ptr [bp + 6]
9:3D76  26ffb7a400           push word ptr es:[bx + 0xa4]
9:3D7B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:3D80  9a0a834c3d           lcall 0x3d4c, 0x830a  ; ResLibr::picture@s3:830A
9:3D85  8946fa               mov word ptr [bp - 6], ax
9:3D88  8956fc               mov word ptr [bp - 4], dx
9:3D8B  8d46fe               lea ax, [bp - 2]
9:3D8E  16                   push ss
9:3D8F  50                   push ax
9:3D90  c45efa               les bx, ptr [bp - 6]
9:3D93  06                   push es
9:3D94  53                   push bx
9:3D95  26c41f               les bx, ptr es:[bx]
9:3D98  8bf3                 mov si, bx
9:3D9A  8cc7                 mov di, es
9:3D9C  26ff5f08             lcall es:[bx + 8]
9:3DA0  8d46fe               lea ax, [bp - 2]
9:3DA3  16                   push ss
9:3DA4  50                   push ax
9:3DA5  666878000500         push 0x50078
9:3DAB  66ff76fa             push dword ptr [bp - 6]
9:3DAF  8ec7                 mov es, di
9:3DB1  26ff5c04             lcall es:[si + 4]
9:3DB5  8d46fe               lea ax, [bp - 2]
9:3DB8  16                   push ss
9:3DB9  50                   push ax
9:3DBA  66ff76fa             push dword ptr [bp - 6]
9:3DBE  8ec7                 mov es, di
9:3DC0  26ff5c0c             lcall es:[si + 0xc]
9:3DC4  c45e06               les bx, ptr [bp + 6]
9:3DC7  26ff7706             push word ptr es:[bx + 6]
9:3DCB  ff76fe               push word ptr [bp - 2]
9:3DCE  9affff0000           lcall 0, 0xffff  ; USER.ReleaseDC
9:3DD3  33c0                 xor ax, ax
9:3DD5  5e                   pop si
9:3DD6  5f                   pop di
9:3DD7  c9                   leave
9:3DD8  ca0400               retf 4
9:3DDB  db 00

; ---------------- TradeSessionDlg::invalidatePicture@s9:3DDC FAR size=44 callers=1
;   apis: USER.InvalidateRect
;   InvalidateRect of the picture box
9:3DDC  c8080000             enter 8, 0
9:3DE0  66c746f805007800     mov dword ptr [bp - 8], 0x780005
9:3DE8  66c746fc6900dc00     mov dword ptr [bp - 4], 0xdc0069
9:3DF0  c45e06               les bx, ptr [bp + 6]
9:3DF3  26ff7706             push word ptr es:[bx + 6]
9:3DF7  8d46f8               lea ax, [bp - 8]
9:3DFA  16                   push ss
9:3DFB  50                   push ax
9:3DFC  6a00                 push 0
9:3DFE  9affff0000           lcall 0, 0xffff  ; USER.InvalidateRect
9:3E03  c9                   leave
9:3E04  ca0400               retf 4
9:3E07  db 00

; ---------------- TradeSessionDlg::showPage@s9:3E08 FAR size=266 callers=2
;   apis: USER.CheckRadioButton, USER.SendDlgItemMessage, USER.SetDlgItemInt
;   the page's list
9:3E08  c8040000             enter 4, 0
9:3E0C  c45e06               les bx, ptr [bp + 6]
9:3E0F  26ff7706             push word ptr es:[bx + 6]
9:3E13  66688d018801         push 0x188018d
9:3E19  26ffb7a000           push word ptr es:[bx + 0xa0]
9:3E1E  9a0d3c0000           lcall 0, 0x3c0d  ; USER.CheckRadioButton
9:3E23  33c0                 xor ax, ax
9:3E25  c45e06               les bx, ptr [bp + 6]
9:3E28  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:3E2D  2689879e00           mov word ptr es:[bx + 0x9e], ax
9:3E32  26ff7706             push word ptr es:[bx + 6]
9:3E36  666809049001         push 0x1900409
9:3E3C  50                   push ax
9:3E3D  50                   push ax
9:3E3E  50                   push ax
9:3E3F  9ae33c0000           lcall 0, 0x3ce3  ; USER.SendDlgItemMessage
9:3E44  3dffff               cmp ax, 0xffff
9:3E47  7504                 jne 0x3e4d
9:3E49  3bd0                 cmp dx, ax
9:3E4B  741c                 je 0x3e69
loc_3E4D:
9:3E4D  c45e06               les bx, ptr [bp + 6]
9:3E50  26ffb7a000           push word ptr es:[bx + 0xa0]
9:3E55  50                   push ax
9:3E56  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:3E5C  9ab23abd3c           lcall 0x3cbd, 0x3ab2  ; TradeMarket::listText@s4:3AB2
9:3E61  c45e06               les bx, ptr [bp + 6]
9:3E64  2689879e00           mov word ptr es:[bx + 0x9e], ax
loc_3E69:
9:3E69  c45e06               les bx, ptr [bp + 6]
9:3E6C  26ff7706             push word ptr es:[bx + 6]
9:3E70  688e01               push 0x18e
9:3E73  26ffb79c00           push word ptr es:[bx + 0x9c]
9:3E78  6a00                 push 0
9:3E7A  9a913e0000           lcall 0, 0x3e91  ; USER.SetDlgItemInt
9:3E7F  c45e06               les bx, ptr [bp + 6]
9:3E82  26ff7706             push word ptr es:[bx + 6]
9:3E86  689101               push 0x191
9:3E89  26ffb79e00           push word ptr es:[bx + 0x9e]
9:3E8E  6a00                 push 0
9:3E90  9a913a0000           lcall 0, 0x3a91  ; USER.SetDlgItemInt
9:3E95  c45e06               les bx, ptr [bp + 6]
9:3E98  268b87a000           mov ax, word ptr es:[bx + 0xa0]
9:3E9D  eb49                 jmp 0x3ee8
9:3E9F  db 90
loc_3EA0:
9:3EA0  c45e06               les bx, ptr [bp + 6]
9:3EA3  26c787a4000500       mov word ptr es:[bx + 0xa4], 5
9:3EAA  eb58                 jmp 0x3f04
loc_3EAC:
9:3EAC  c45e06               les bx, ptr [bp + 6]
9:3EAF  26c787a4000600       mov word ptr es:[bx + 0xa4], 6
9:3EB6  eb4c                 jmp 0x3f04
loc_3EB8:
9:3EB8  c45e06               les bx, ptr [bp + 6]
9:3EBB  26c787a4000700       mov word ptr es:[bx + 0xa4], 7
9:3EC2  eb40                 jmp 0x3f04
loc_3EC4:
9:3EC4  c45e06               les bx, ptr [bp + 6]
9:3EC7  26c787a4000800       mov word ptr es:[bx + 0xa4], 8
9:3ECE  eb34                 jmp 0x3f04
loc_3ED0:
9:3ED0  c45e06               les bx, ptr [bp + 6]
9:3ED3  26c787a4000900       mov word ptr es:[bx + 0xa4], 9
9:3EDA  eb28                 jmp 0x3f04
loc_3EDC:
9:3EDC  c45e06               les bx, ptr [bp + 6]
9:3EDF  26c787a4000a00       mov word ptr es:[bx + 0xa4], 0xa
9:3EE6  eb1c                 jmp 0x3f04
loc_3EE8:
9:3EE8  2d8801               sub ax, 0x188
9:3EEB  3d0500               cmp ax, 5
9:3EEE  7714                 ja 0x3f04
9:3EF0  03c0                 add ax, ax
9:3EF2  93                   xchg bx, ax
9:3EF3  2effa7f83e           jmp word ptr cs:[bx + 0x3ef8]
switch_table_3EF8:
    dw loc_3EA0
    dw loc_3EAC
    dw loc_3EB8
    dw loc_3EC4
    dw loc_3ED0
    dw loc_3EDC
loc_3F04:
9:3F04  66ff7606             push dword ptr [bp + 6]
9:3F08  90                   nop
9:3F09  0e                   push cs
9:3F0A  e8cffe               call 0x3ddc  ; TradeSessionDlg::invalidatePicture@s9:3DDC
9:3F0D  c9                   leave
9:3F0E  ca0400               retf 4
9:3F11  db 00

; ---------------- TradeSessionDlg::fillList@s9:3F12 FAR size=196 callers=2
;   apis: USER.SendDlgItemMessage
;   list entries
9:3F12  c8140000             enter 0x14, 0
9:3F16  c45e06               les bx, ptr [bp + 6]
9:3F19  26ff7706             push word ptr es:[bx + 6]
9:3F1D  66680b009001         push 0x190000b
9:3F23  666a00               push 0
9:3F26  6a00                 push 0
9:3F28  9a403f0000           lcall 0, 0x3f40  ; USER.SendDlgItemMessage
9:3F2D  c45e06               les bx, ptr [bp + 6]
9:3F30  26ff7706             push word ptr es:[bx + 6]
9:3F34  666805049001         push 0x1900405
9:3F3A  666a00               push 0
9:3F3D  6a00                 push 0
9:3F3F  9a843f0000           lcall 0, 0x3f84  ; USER.SendDlgItemMessage
9:3F44  66ff760a             push dword ptr [bp + 0xa]
9:3F48  8d46f8               lea ax, [bp - 8]
9:3F4B  16                   push ss
9:3F4C  50                   push ax
9:3F4D  9a84575a3f           lcall 0x3f5a, 0x5784  ; ListIter::ListIter@s2:5784
loc_3F52:
9:3F52  8d46f8               lea ax, [bp - 8]
9:3F55  16                   push ss
9:3F56  50                   push ax
9:3F57  9a125b0039           lcall 0x3900, 0x5b12  ; ListIter::next@s2:5B12
9:3F5C  8946f4               mov word ptr [bp - 0xc], ax
9:3F5F  8956f6               mov word ptr [bp - 0xa], dx
9:3F62  0bd0                 or dx, ax
9:3F64  743b                 je 0x3fa1
9:3F66  c45ef4               les bx, ptr [bp - 0xc]
9:3F69  66268b4704           mov eax, dword ptr es:[bx + 4]
9:3F6E  668946f0             mov dword ptr [bp - 0x10], eax
9:3F72  c45e06               les bx, ptr [bp + 6]
9:3F75  26ff7706             push word ptr es:[bx + 6]
9:3F79  666801049001         push 0x1900401
9:3F7F  6a00                 push 0
9:3F81  6650                 push eax
9:3F83  9ab43f0000           lcall 0, 0x3fb4  ; USER.SendDlgItemMessage
9:3F88  8946ec               mov word ptr [bp - 0x14], ax
9:3F8B  8956ee               mov word ptr [bp - 0x12], dx
9:3F8E  3dffff               cmp ax, 0xffff
9:3F91  7504                 jne 0x3f97
9:3F93  3bd0                 cmp dx, ax
9:3F95  740a                 je 0x3fa1
loc_3F97:
9:3F97  3dfeff               cmp ax, 0xfffe
9:3F9A  75b6                 jne 0x3f52
9:3F9C  83faff               cmp dx, -1
9:3F9F  75b1                 jne 0x3f52
loc_3FA1:
9:3FA1  c45e06               les bx, ptr [bp + 6]
9:3FA4  26ff7706             push word ptr es:[bx + 6]
9:3FA8  666807049001         push 0x1900407
9:3FAE  666a00               push 0
9:3FB1  6a00                 push 0
9:3FB3  9ace3f0000           lcall 0, 0x3fce  ; USER.SendDlgItemMessage
9:3FB8  c45e06               les bx, ptr [bp + 6]
9:3FBB  26ff7706             push word ptr es:[bx + 6]
9:3FBF  66680b009001         push 0x190000b
9:3FC5  666800000100         push 0x10000
9:3FCB  6a00                 push 0
9:3FCD  9a403e0000           lcall 0, 0x3e40  ; USER.SendDlgItemMessage
9:3FD2  c9                   leave
9:3FD3  ca0800               retf 8

; ---------------- TradeSessionDlg::scalar_dtor@s9:3FD6 FAR size=146 callers=0
;   deleting destructor
9:3FD6  55                   push bp
9:3FD7  8bec                 mov bp, sp
9:3FD9  66ff7606             push dword ptr [bp + 6]
9:3FDD  90                   nop
9:3FDE  0e                   push cs
9:3FDF  e800fa               call 0x39e2  ; TradeSessionDlg::~TradeSessionDlg@s9:39E2
9:3FE2  f6460a01             test byte ptr [bp + 0xa], 1
9:3FE6  7409                 je 0x3ff1
9:3FE8  66ff7606             push dword ptr [bp + 6]
9:3FEC  9ace17ed38           lcall 0x38ed, 0x17ce  ; operator_delete@s1:17CE
loc_3FF1:
9:3FF1  8b4606               mov ax, word ptr [bp + 6]
9:3FF4  8b5608               mov dx, word ptr [bp + 8]
9:3FF7  c9                   leave
9:3FF8  ca0600               retf 6
9:3FFB  db 90 d6 3f 06 40 10 3a 50 3f e8 3a 0a 40 c0 79 0e
9:400B  db 40 64 3c 12 40 0e 3a 16 40 56 7f 1a 40 b2 7b 1e
9:401B  db 40 1c 7f 22 40 12 82 26 40 86 7f 2a 40 0c 80 2e
9:402B  db 40 54 80 32 40 5e 7e 36 40 58 81 3a 40 b6 81 3e
9:403B  db 40 fe 81 46 40 ea 60 56 40 4a 82 4a 40 66 82 4e
9:404B  db 40 1e 3b 52 40 36 3a 5e 40 f4 60 5a 40 fa 60 62
9:405B  db 40 5e 3d 66 40 fe 60 5f 3e 7e 80 f1 39

; ---------------- TurnsDlg::TurnsDlg@s9:4068 FAR size=122 callers=1
;   dialog 4023 "Turns": run multiple turns (vtable 4466)
9:4068  55                   push bp
9:4069  8bec                 mov bp, sp
9:406B  ff7612               push word ptr [bp + 0x12]
9:406E  68b70f               push 0xfb7
9:4071  66ff760a             push dword ptr [bp + 0xa]
9:4075  6a01                 push 1
9:4077  66ff7606             push dword ptr [bp + 6]
9:407B  90                   nop
9:407C  0e                   push cs
9:407D  e8a836               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:4080  c45e06               les bx, ptr [bp + 6]
9:4083  662bc0               sub eax, eax
9:4086  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:408C  662689879200         mov dword ptr es:[bx + 0x92], eax
9:4092  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:4097  26c7076644           mov word ptr es:[bx], 0x4466
9:409C  26c74702fe3f         mov word ptr es:[bx + 2], 0x3ffe  ; SEGMENT s9:0000
9:40A2  26c747760100         mov word ptr es:[bx + 0x76], 1
9:40A8  6a02                 push 2
9:40AA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:40AF  9aba20cb40           lcall 0x40cb, 0x20ba  ; Registry_get@s3:20BA
9:40B4  c45e06               les bx, ptr [bp + 6]
9:40B7  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:40BC  2689979000           mov word ptr es:[bx + 0x90], dx
9:40C1  6a29                 push 0x29
9:40C3  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:40C8  9aba20833d           lcall 0x3d83, 0x20ba  ; Registry_get@s3:20BA
9:40CD  c45e06               les bx, ptr [bp + 6]
9:40D0  2689879600           mov word ptr es:[bx + 0x96], ax
9:40D5  2689979800           mov word ptr es:[bx + 0x98], dx
9:40DA  8bc3                 mov ax, bx
9:40DC  8cc2                 mov dx, es
9:40DE  c9                   leave
9:40DF  ca0e00               retf 0xe

; ---------------- TurnsDlg::~TurnsDlg@s9:40E2 FAR size=44 callers=1
;   dtor
9:40E2  55                   push bp
9:40E3  8bec                 mov bp, sp
9:40E5  c45e06               les bx, ptr [bp + 6]
9:40E8  26c7076644           mov word ptr es:[bx], 0x4466
9:40ED  26c74702a040         mov word ptr es:[bx + 2], 0x40a0  ; SEGMENT s9:0000
9:40F3  26ff7706             push word ptr es:[bx + 6]
9:40F7  66ff367c5b           push dword ptr [0x5b7c]
9:40FC  9ae0b6273d           lcall 0x3d27, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:4101  66ff7606             push dword ptr [bp + 6]
9:4105  90                   nop
9:4106  0e                   push cs
9:4107  e82237               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:410A  c9                   leave
9:410B  ca0400               retf 4

; ---------------- TurnsDlg::init@s9:410E size=420 callers=0
;   apis: USER.GetDlgItem, USER.GetWindowRect, USER.SendMessage, USER.SetFocus, USER.ShowWindow
;   (vslot 2) the number of turns, its place
9:410E  c8500000             enter 0x50, 0
9:4112  57                   push di
9:4113  56                   push si
9:4114  66ff7606             push dword ptr [bp + 6]
9:4118  90                   nop
9:4119  0e                   push cs
9:411A  e8c537               call 0x78e2  ; OPDialog::create@s9:78E2
9:411D  666800000a00         push 0xa0000
9:4123  8d46f6               lea ax, [bp - 0xa]
9:4126  16                   push ss
9:4127  50                   push ax
9:4128  9a06494941           lcall 0x4149, 0x4906  ; _fmemset@s1:4906
9:412D  83c408               add sp, 8
9:4130  c45e06               les bx, ptr [bp + 6]
9:4133  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:4138  6626ff7776           push dword ptr es:[bx + 0x76]
9:413D  1e                   push ds
9:413E  68385d               push 0x5d38  ; '%lu'
9:4141  8d46f6               lea ax, [bp - 0xa]
9:4144  16                   push ss
9:4145  50                   push ax
9:4146  9a9c3fac41           lcall 0x41ac, 0x3f9c  ; _fsprintf@s1:3F9C
9:414B  83c40c               add sp, 0xc
9:414E  c45e06               les bx, ptr [bp + 6]
9:4151  26ff7706             push word ptr es:[bx + 6]
9:4155  68b50f               push 0xfb5
9:4158  9a523c0000           lcall 0, 0x3c52  ; USER.GetDlgItem
9:415D  8946f4               mov word ptr [bp - 0xc], ax
9:4160  50                   push ax
9:4161  666800000c00         push 0xc0000
9:4167  8d4ef6               lea cx, [bp - 0xa]
9:416A  16                   push ss
9:416B  51                   push cx
9:416C  9a89410000           lcall 0, 0x4189  ; USER.SendMessage
9:4171  ff76f4               push word ptr [bp - 0xc]
9:4174  9a163b0000           lcall 0, 0x3b16  ; USER.SetFocus
9:4179  ff76f4               push word ptr [bp - 0xc]
9:417C  666800000104         push 0x4010000
9:4182  66680000ffff         push 0xffff0000
9:4188  9a3a3d0000           lcall 0, 0x3d3a  ; USER.SendMessage
9:418D  c45e06               les bx, ptr [bp + 6]
9:4190  26ff7706             push word ptr es:[bx + 6]
9:4194  8d46ec               lea ax, [bp - 0x14]
9:4197  16                   push ss
9:4198  50                   push ax
9:4199  9a41330000           lcall 0, 0x3341  ; USER.GetWindowRect
9:419E  666800000800         push 0x80000
9:41A4  8d46e4               lea ax, [bp - 0x1c]
9:41A7  16                   push ss
9:41A8  50                   push ax
9:41A9  9a0649ef3f           lcall 0x3fef, 0x4906  ; _fmemset@s1:4906
9:41AE  83c408               add sp, 8
9:41B1  666800000700         push 0x70000
9:41B7  c45e06               les bx, ptr [bp + 6]
9:41BA  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:41C0  9a7a5f3642           lcall 0x4236, 0x5f7a  ; Options::hasWindowPlace@s3:5F7A
9:41C5  8946e0               mov word ptr [bp - 0x20], ax
9:41C8  8956e2               mov word ptr [bp - 0x1e], dx
9:41CB  0bd0                 or dx, ax
9:41CD  7412                 je 0x41e1
9:41CF  8b56e2               mov dx, word ptr [bp - 0x1e]
9:41D2  1e                   push ds
9:41D3  8d7ee4               lea di, [bp - 0x1c]
9:41D6  8bf0                 mov si, ax
9:41D8  16                   push ss
9:41D9  07                   pop es
9:41DA  8eda                 mov ds, dx
9:41DC  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:41DE  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:41E0  1f                   pop ds
loc_41E1:
9:41E1  837ee600             cmp word ptr [bp - 0x1a], 0
9:41E5  0f85a500             jne 0x428e
9:41E9  837ee400             cmp word ptr [bp - 0x1c], 0
9:41ED  0f859d00             jne 0x428e
9:41F1  8d46d2               lea ax, [bp - 0x2e]
9:41F4  16                   push ss
9:41F5  50                   push ax
9:41F6  9a383e2042           lcall 0x4220, 0x3e38  ; Pos3::Pos3@s2:3E38
9:41FB  8d46d2               lea ax, [bp - 0x2e]
9:41FE  16                   push ss
9:41FF  50                   push ax
9:4200  c45e06               les bx, ptr [bp + 6]
9:4203  6626ffb79600         push dword ptr es:[bx + 0x96]
9:4209  9a78264240           lcall 0x4042, 0x2678  ; defaultPosC@s4:2678
9:420E  8d46d8               lea ax, [bp - 0x28]
9:4211  16                   push ss
9:4212  50                   push ax
9:4213  8d46d0               lea ax, [bp - 0x30]
9:4216  16                   push ss
9:4217  50                   push ax
9:4218  8d46d2               lea ax, [bp - 0x2e]
9:421B  16                   push ss
9:421C  50                   push ax
9:421D  9a943e4642           lcall 0x4246, 0x3e94  ; Pos3::getXY@s2:3E94
9:4222  8d46ce               lea ax, [bp - 0x32]
9:4225  16                   push ss
9:4226  50                   push ax
9:4227  8d46cc               lea ax, [bp - 0x34]
9:422A  16                   push ss
9:422B  50                   push ax
9:422C  6a48                 push 0x48
9:422E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:4233  9aba20b240           lcall 0x40b2, 0x20ba  ; Registry_get@s3:20BA
9:4238  8946c4               mov word ptr [bp - 0x3c], ax
9:423B  8956c6               mov word ptr [bp - 0x3a], dx
9:423E  050e00               add ax, 0xe
9:4241  52                   push dx
9:4242  50                   push ax
9:4243  9a943e0240           lcall 0x4002, 0x3e94  ; Pos3::getXY@s2:3E94
9:4248  c45ec4               les bx, ptr [bp - 0x3c]
9:424B  268b470a             mov ax, word ptr es:[bx + 0xa]
9:424F  8946ca               mov word ptr [bp - 0x36], ax
9:4252  268b470c             mov ax, word ptr es:[bx + 0xc]
9:4256  8946c8               mov word ptr [bp - 0x38], ax
9:4259  8b46f0               mov ax, word ptr [bp - 0x10]
9:425C  2b46ec               sub ax, word ptr [bp - 0x14]
9:425F  8946e8               mov word ptr [bp - 0x18], ax
9:4262  8b46ce               mov ax, word ptr [bp - 0x32]
9:4265  0346d8               add ax, word ptr [bp - 0x28]
9:4268  8946e4               mov word ptr [bp - 0x1c], ax
9:426B  6b46c8ec             imul ax, word ptr [bp - 0x38], -0x14
9:426F  b95802               mov cx, 0x258
9:4272  99                   cdq
9:4273  f7f9                 idiv cx
9:4275  8b4ef2               mov cx, word ptr [bp - 0xe]
9:4278  2b4eee               sub cx, word ptr [bp - 0x12]
9:427B  894eea               mov word ptr [bp - 0x16], cx
9:427E  2bc1                 sub ax, cx
9:4280  8b4ecc               mov cx, word ptr [bp - 0x34]
9:4283  034ed0               add cx, word ptr [bp - 0x30]
9:4286  894ee6               mov word ptr [bp - 0x1a], cx
9:4289  03c1                 add ax, cx
9:428B  8946e6               mov word ptr [bp - 0x1a], ax
loc_428E:
9:428E  ff76e4               push word ptr [bp - 0x1c]
9:4291  ff76e6               push word ptr [bp - 0x1a]
9:4294  66ff7606             push dword ptr [bp + 6]
9:4298  90                   nop
9:4299  0e                   push cs
9:429A  e8cf3f               call 0x826c  ; OPDialog::position@s9:826C
9:429D  c45e06               les bx, ptr [bp + 6]
9:42A0  26ff7706             push word ptr es:[bx + 6]
9:42A4  6a05                 push 5
9:42A6  9a0a3b0000           lcall 0, 0x3b0a  ; USER.ShowWindow
9:42AB  5e                   pop si
9:42AC  5f                   pop di
9:42AD  c9                   leave
9:42AE  ca0400               retf 4
9:42B1  db 00

; ---------------- TurnsDlg::onOK@s9:42B2 FAR size=312 callers=0
;   apis: USER.DestroyWindow, USER.EnableWindow, USER.GetDlgItem, USER.PostMessage, USER.SendMessage, USER.SetFocus, USER._wsprintf
;   (vslot 5) runs the turns
9:42B2  c8640000             enter 0x64, 0
9:42B6  837e0a00             cmp word ptr [bp + 0xa], 0
9:42BA  0f841401             je 0x43d2
9:42BE  666800005100         push 0x510000
9:42C4  8d46ae               lea ax, [bp - 0x52]
9:42C7  16                   push ss
9:42C8  50                   push ax
9:42C9  9a0649fc42           lcall 0x42fc, 0x4906  ; _fmemset@s1:4906
9:42CE  83c408               add sp, 8
9:42D1  c45e06               les bx, ptr [bp + 6]
9:42D4  26ff7706             push word ptr es:[bx + 6]
9:42D8  68b50f               push 0xfb5
9:42DB  9a7c430000           lcall 0, 0x437c  ; USER.GetDlgItem
9:42E0  8946ac               mov word ptr [bp - 0x54], ax
9:42E3  50                   push ax
9:42E4  666851000d00         push 0xd0051
9:42EA  8d46ae               lea ax, [bp - 0x52]
9:42ED  16                   push ss
9:42EE  50                   push ax
9:42EF  9a4e430000           lcall 0, 0x434e  ; USER.SendMessage
9:42F4  8d46ae               lea ax, [bp - 0x52]
9:42F7  16                   push ss
9:42F8  50                   push ax
9:42F9  9a283e2b41           lcall 0x412b, 0x3e28  ; _fatol@s1:3E28
9:42FE  83c404               add sp, 4
9:4301  8946a8               mov word ptr [bp - 0x58], ax
9:4304  8956aa               mov word ptr [bp - 0x56], dx
9:4307  0bd0                 or dx, ax
9:4309  7410                 je 0x431b
9:430B  8b56aa               mov dx, word ptr [bp - 0x56]
9:430E  c45e06               les bx, ptr [bp + 6]
9:4311  2689879200           mov word ptr es:[bx + 0x92], ax
9:4316  2689979400           mov word ptr es:[bx + 0x94], dx
loc_431B:
9:431B  837eaa00             cmp word ptr [bp - 0x56], 0
9:431F  7d51                 jge 0x4372
9:4321  c45e06               les bx, ptr [bp + 6]
9:4324  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:4329  6626ff7776           push dword ptr es:[bx + 0x76]
9:432E  1e                   push ds
9:432F  683c5d               push 0x5d3c  ; '%ld'
9:4332  8d46ae               lea ax, [bp - 0x52]
9:4335  16                   push ss
9:4336  50                   push ax
9:4337  9a683b0000           lcall 0, 0x3b68  ; USER._wsprintf
9:433C  83c40c               add sp, 0xc
9:433F  ff76ac               push word ptr [bp - 0x54]
9:4342  666800000c00         push 0xc0000
9:4348  8d46ae               lea ax, [bp - 0x52]
9:434B  16                   push ss
9:434C  50                   push ax
9:434D  9a6a430000           lcall 0, 0x436a  ; USER.SendMessage
9:4352  ff76ac               push word ptr [bp - 0x54]
9:4355  9a75410000           lcall 0, 0x4175  ; USER.SetFocus
9:435A  ff76ac               push word ptr [bp - 0x54]
9:435D  666800000104         push 0x4010000
9:4363  66680000ffff         push 0xffff0000
9:4369  9a6d410000           lcall 0, 0x416d  ; USER.SendMessage
9:436E  c9                   leave
9:436F  ca0600               retf 6
loc_4372:
9:4372  c45e06               les bx, ptr [bp + 6]
9:4375  26ff7706             push word ptr es:[bx + 6]
9:4379  6a01                 push 1
9:437B  9ac1430000           lcall 0, 0x43c1  ; USER.GetDlgItem
9:4380  50                   push ax
9:4381  6a00                 push 0
9:4383  9ac9430000           lcall 0, 0x43c9  ; USER.EnableWindow
9:4388  c45e06               les bx, ptr [bp + 6]
9:438B  66268b879200         mov eax, dword ptr es:[bx + 0x92]
9:4391  6689469c             mov dword ptr [bp - 0x64], eax
9:4395  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:439A  6626894776           mov dword ptr es:[bx + 0x76], eax
9:439F  ff369603             push word ptr [0x396]
9:43A3  666800000004         push 0x4000000
9:43A9  c45e06               les bx, ptr [bp + 6]
9:43AC  6626ffb79200         push dword ptr es:[bx + 0x92]
9:43B2  9ac7380000           lcall 0, 0x38c7  ; USER.PostMessage
9:43B7  c45e06               les bx, ptr [bp + 6]
9:43BA  26ff7706             push word ptr es:[bx + 6]
9:43BE  6a01                 push 1
9:43C0  9a59410000           lcall 0, 0x4159  ; USER.GetDlgItem
9:43C5  50                   push ax
9:43C6  6a01                 push 1
9:43C8  9ab73a0000           lcall 0, 0x3ab7  ; USER.EnableWindow
9:43CD  c9                   leave
9:43CE  ca0600               retf 6
9:43D1  db 90
loc_43D2:
9:43D2  c45e06               les bx, ptr [bp + 6]
9:43D5  26c7879a000100       mov word ptr es:[bx + 0x9a], 1
9:43DC  26ff7706             push word ptr es:[bx + 6]
9:43E0  9a9b1d0000           lcall 0, 0x1d9b  ; USER.DestroyWindow
9:43E5  c9                   leave
9:43E6  ca0600               retf 6
9:43E9  db 00

; ---------------- TurnsDlg::rememberPlace@s9:43EA FAR size=86 callers=0
;   apis: USER.GetWindowRect
;   (vslot 9)
9:43EA  c8100000             enter 0x10, 0
9:43EE  c45e06               les bx, ptr [bp + 6]
9:43F1  26ff7706             push word ptr es:[bx + 6]
9:43F5  8d46f8               lea ax, [bp - 8]
9:43F8  16                   push ss
9:43F9  50                   push ax
9:43FA  9a9a410000           lcall 0, 0x419a  ; USER.GetWindowRect
9:43FF  8b46f8               mov ax, word ptr [bp - 8]
9:4402  2946fc               sub word ptr [bp - 4], ax
9:4405  8b46fa               mov ax, word ptr [bp - 6]
9:4408  2946fe               sub word ptr [bp - 2], ax
9:440B  6a07                 push 7
9:440D  8d46f8               lea ax, [bp - 8]
9:4410  16                   push ss
9:4411  50                   push ax
9:4412  6a00                 push 0
9:4414  c45e06               les bx, ptr [bp + 6]
9:4417  6626ffb78e00         push dword ptr es:[bx + 0x8e]
9:441D  9ab05fc341           lcall 0x41c3, 0x5fb0  ; Options::setWindowPlace@s3:5FB0
9:4422  c45e06               les bx, ptr [bp + 6]
9:4425  2683bf9a0001         cmp word ptr es:[bx + 0x9a], 1
9:442B  1bc0                 sbb ax, ax
9:442D  f7d8                 neg ax
9:442F  8946f0               mov word ptr [bp - 0x10], ax
9:4432  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:4437  2689477a             mov word ptr es:[bx + 0x7a], ax
9:443B  c9                   leave
9:443C  ca0400               retf 4
9:443F  db 00

; ---------------- TurnsDlg::scalar_dtor@s9:4440 FAR size=146 callers=0
;   deleting destructor
9:4440  55                   push bp
9:4441  8bec                 mov bp, sp
9:4443  66ff7606             push dword ptr [bp + 6]
9:4447  90                   nop
9:4448  0e                   push cs
9:4449  e896fc               call 0x40e2  ; TurnsDlg::~TurnsDlg@s9:40E2
9:444C  f6460a01             test byte ptr [bp + 0xa], 1
9:4450  7409                 je 0x445b
9:4452  66ff7606             push dword ptr [bp + 6]
9:4456  9ace17cc42           lcall 0x42cc, 0x17ce  ; operator_delete@s1:17CE
loc_445B:
9:445B  8b4606               mov ax, word ptr [bp + 6]
9:445E  8b5608               mov dx, word ptr [bp + 8]
9:4461  c9                   leave
9:4462  ca0600               retf 6
9:4465  db 90 40 44 70 44 10 3a f9 41 0e 41 74 44 c0 79 78
9:4475  db 44 3c 7b 7c 44 b2 42 80 44 56 7f 84 44 b2 7b 88
9:4485  db 44 1c 7f 8c 44 ea 43 90 44 86 7f 94 44 0c 80 98
9:4495  db 44 54 80 9c 44 5e 7e a0 44 58 81 a4 44 b6 81 a8
9:44A5  db 44 fe 81 b0 44 ea 60 bc 44 4a 82 b4 44 66 82 b8
9:44B5  db 44 de 78 d0 44 ee 60 c0 44 f4 60 c4 44 fa 60 cc
9:44C5  db 44 a4 a2 ff 40 fe 60 0c 42 7e 80 f1 40

; ---------------- ExecSummaryDlg::ExecSummaryDlg@s9:44D2 FAR size=278 callers=1
;   dialog 4002 "Executive Summary" (vtable 4824)
9:44D2  c8060000             enter 6, 0
9:44D6  57                   push di
9:44D7  56                   push si
9:44D8  ff760e               push word ptr [bp + 0xe]
9:44DB  68a20f               push 0xfa2
9:44DE  66ff7606             push dword ptr [bp + 6]
9:44E2  90                   nop
9:44E3  0e                   push cs
9:44E4  e89b6b               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:44E7  c45e06               les bx, ptr [bp + 6]
9:44EA  26c7072448           mov word ptr es:[bx], 0x4824
9:44EF  26c747027b45         mov word ptr es:[bx + 2], 0x457b  ; SEGMENT s9:0000
9:44F5  6a18                 push 0x18
9:44F7  9a9c175a45           lcall 0x455a, 0x179c  ; operator_new@s1:179C
9:44FC  83c402               add sp, 2
9:44FF  8946fa               mov word ptr [bp - 6], ax
9:4502  8956fc               mov word ptr [bp - 4], dx
9:4505  0bd0                 or dx, ax
9:4507  7419                 je 0x4522
9:4509  ff76fc               push word ptr [bp - 4]
9:450C  50                   push ax
9:450D  90                   nop
9:450E  0e                   push cs
9:450F  e88660               call 0xa598  ; ReportRow::ReportRow@s9:A598
9:4512  c45e06               les bx, ptr [bp + 6]
9:4515  2689879000           mov word ptr es:[bx + 0x90], ax
9:451A  2689979200           mov word ptr es:[bx + 0x92], dx
9:451F  eb0e                 jmp 0x452f
9:4521  db 90
loc_4522:
9:4522  c45e06               les bx, ptr [bp + 6]
9:4525  6626c787900000000000 mov dword ptr es:[bx + 0x90], 0
loc_452F:
9:452F  c45e06               les bx, ptr [bp + 6]
9:4532  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4537  26c7071400           mov word ptr es:[bx], 0x14
9:453C  c45e06               les bx, ptr [bp + 6]
9:453F  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4544  268b07               mov ax, word ptr es:[bx]
9:4547  8946fe               mov word ptr [bp - 2], ax
9:454A  8bc8                 mov cx, ax
9:454C  c1e002               shl ax, 2
9:454F  03c1                 add ax, cx
9:4551  03c0                 add ax, ax
9:4553  050200               add ax, 2
9:4556  50                   push ax
9:4557  9a9c178745           lcall 0x4587, 0x179c  ; operator_new@s1:179C
9:455C  83c402               add sp, 2
9:455F  8946fa               mov word ptr [bp - 6], ax
9:4562  8956fc               mov word ptr [bp - 4], dx
9:4565  0bd0                 or dx, ax
9:4567  7433                 je 0x459c
9:4569  8b46fe               mov ax, word ptr [bp - 2]
9:456C  c45efa               les bx, ptr [bp - 6]
9:456F  268907               mov word ptr es:[bx], ax
9:4572  8d4f02               lea cx, [bx + 2]
9:4575  06                   push es
9:4576  51                   push cx
9:4577  6a0a                 push 0xa
9:4579  50                   push ax
9:457A  686844               push 0x4468  ; SEGMENT s9:0000
9:457D  6864a5               push 0xa564
9:4580  8bf1                 mov si, cx
9:4582  8cc7                 mov di, es
9:4584  9a86555944           lcall 0x4459, 0x5586  ; __vec_ctor@s1:5586
9:4589  c45e06               les bx, ptr [bp + 6]
9:458C  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4591  26897702             mov word ptr es:[bx + 2], si
9:4595  26897f04             mov word ptr es:[bx + 4], di
9:4599  eb12                 jmp 0x45ad
9:459B  db 90
loc_459C:
9:459C  c45e06               les bx, ptr [bp + 6]
9:459F  26c49f9000           les bx, ptr es:[bx + 0x90]
9:45A4  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_45AD:
9:45AD  668b460a             mov eax, dword ptr [bp + 0xa]
9:45B1  c45e06               les bx, ptr [bp + 6]
9:45B4  26c49f9000           les bx, ptr es:[bx + 0x90]
9:45B9  6626894706           mov dword ptr es:[bx + 6], eax
9:45BE  c45e06               les bx, ptr [bp + 6]
9:45C1  26c49f9000           les bx, ptr es:[bx + 0x90]
9:45C6  26c7470a0100         mov word ptr es:[bx + 0xa], 1
9:45CC  c45e06               les bx, ptr [bp + 6]
9:45CF  268b470a             mov ax, word ptr es:[bx + 0xa]
9:45D3  26c49f9000           les bx, ptr es:[bx + 0x90]
9:45D8  26894712             mov word ptr es:[bx + 0x12], ax
9:45DC  8b4606               mov ax, word ptr [bp + 6]
9:45DF  8b5608               mov dx, word ptr [bp + 8]
9:45E2  5e                   pop si
9:45E3  5f                   pop di
9:45E4  c9                   leave
9:45E5  ca0a00               retf 0xa

; ---------------- ExecSummaryDlg::refresh@s9:45E8 size=382 callers=0
;   (vslot 4) the rows
9:45E8  c81a0000             enter 0x1a, 0
9:45EC  57                   push di
9:45ED  56                   push si
9:45EE  8b460e               mov ax, word ptr [bp + 0xe]
9:45F1  2deb00               sub ax, 0xeb
9:45F4  0f855801             jne 0x4750
9:45F8  6a03                 push 3
9:45FA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:45FF  9aba201a47           lcall 0x471a, 0x20ba  ; Registry_get@s3:20BA
9:4604  8946fc               mov word ptr [bp - 4], ax
9:4607  8956fe               mov word ptr [bp - 2], dx
9:460A  c45e06               les bx, ptr [bp + 6]
9:460D  66268b879000         mov eax, dword ptr es:[bx + 0x90]
9:4613  668946f8             mov dword ptr [bp - 8], eax
9:4617  660bc0               or eax, eax
9:461A  750a                 jne 0x4626
9:461C  33c0                 xor ax, ax
loc_461E:
9:461E  33d2                 xor dx, dx
9:4620  5e                   pop si
9:4621  5f                   pop di
9:4622  c9                   leave
9:4623  ca0a00               retf 0xa
loc_4626:
9:4626  6a18                 push 0x18
9:4628  9a9c178146           lcall 0x4681, 0x179c  ; operator_new@s1:179C
9:462D  83c402               add sp, 2
9:4630  8946f2               mov word ptr [bp - 0xe], ax
9:4633  8956f4               mov word ptr [bp - 0xc], dx
9:4636  0bd0                 or dx, ax
9:4638  740c                 je 0x4646
9:463A  ff76f4               push word ptr [bp - 0xc]
9:463D  50                   push ax
9:463E  90                   nop
9:463F  0e                   push cs
9:4640  e8555f               call 0xa598  ; ReportRow::ReportRow@s9:A598
9:4643  eb04                 jmp 0x4649
9:4645  db 90
loc_4646:
9:4646  33c0                 xor ax, ax
9:4648  99                   cdq
loc_4649:
9:4649  c45e06               les bx, ptr [bp + 6]
9:464C  2689879000           mov word ptr es:[bx + 0x90], ax
9:4651  2689979200           mov word ptr es:[bx + 0x92], dx
9:4656  c45e06               les bx, ptr [bp + 6]
9:4659  26c49f9000           les bx, ptr es:[bx + 0x90]
9:465E  26c7071400           mov word ptr es:[bx], 0x14
9:4663  c45e06               les bx, ptr [bp + 6]
9:4666  26c49f9000           les bx, ptr es:[bx + 0x90]
9:466B  268b07               mov ax, word ptr es:[bx]
9:466E  8946f6               mov word ptr [bp - 0xa], ax
9:4671  8bc8                 mov cx, ax
9:4673  c1e002               shl ax, 2
9:4676  03c1                 add ax, cx
9:4678  03c0                 add ax, ax
9:467A  050200               add ax, 2
9:467D  50                   push ax
9:467E  9a9c17ae46           lcall 0x46ae, 0x179c  ; operator_new@s1:179C
9:4683  83c402               add sp, 2
9:4686  8946f2               mov word ptr [bp - 0xe], ax
9:4689  8956f4               mov word ptr [bp - 0xc], dx
9:468C  0bd0                 or dx, ax
9:468E  7432                 je 0x46c2
9:4690  8b46f6               mov ax, word ptr [bp - 0xa]
9:4693  c45ef2               les bx, ptr [bp - 0xe]
9:4696  268907               mov word ptr es:[bx], ax
9:4699  8d4f02               lea cx, [bx + 2]
9:469C  06                   push es
9:469D  51                   push cx
9:469E  6a0a                 push 0xa
9:46A0  50                   push ax
9:46A1  68f344               push 0x44f3  ; SEGMENT s9:0000
9:46A4  6864a5               push 0xa564
9:46A7  8bf1                 mov si, cx
9:46A9  8cc7                 mov di, es
9:46AB  9a86553947           lcall 0x4739, 0x5586  ; __vec_ctor@s1:5586
9:46B0  c45e06               les bx, ptr [bp + 6]
9:46B3  26c49f9000           les bx, ptr es:[bx + 0x90]
9:46B8  26897702             mov word ptr es:[bx + 2], si
9:46BC  26897f04             mov word ptr es:[bx + 4], di
9:46C0  eb11                 jmp 0x46d3
loc_46C2:
9:46C2  c45e06               les bx, ptr [bp + 6]
9:46C5  26c49f9000           les bx, ptr es:[bx + 0x90]
9:46CA  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_46D3:
9:46D3  c45ef8               les bx, ptr [bp - 8]
9:46D6  66268b4706           mov eax, dword ptr es:[bx + 6]
9:46DB  c45e06               les bx, ptr [bp + 6]
9:46DE  26c49f9000           les bx, ptr es:[bx + 0x90]
9:46E3  6626894706           mov dword ptr es:[bx + 6], eax
9:46E8  c45e06               les bx, ptr [bp + 6]
9:46EB  26c49f9000           les bx, ptr es:[bx + 0x90]
9:46F0  26c7470a0100         mov word ptr es:[bx + 0xa], 1
9:46F6  c45e06               les bx, ptr [bp + 6]
9:46F9  268b470a             mov ax, word ptr es:[bx + 0xa]
9:46FD  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4702  26894712             mov word ptr es:[bx + 0x12], ax
9:4706  c45e06               les bx, ptr [bp + 6]
9:4709  6626ffb79000         push dword ptr es:[bx + 0x90]
9:470F  1e                   push ds
9:4710  68405d               push 0x5d40
9:4713  66ff76fc             push dword ptr [bp - 4]
9:4717  9a0ca52044           lcall 0x4420, 0xa50c  ; Reports::resourceRow@s3:A50C
9:471C  668b46f8             mov eax, dword ptr [bp - 8]
9:4720  668946f2             mov dword ptr [bp - 0xe], eax
9:4724  660bc0               or eax, eax
9:4727  7415                 je 0x473e
9:4729  ff76fa               push word ptr [bp - 6]
9:472C  50                   push ax
9:472D  90                   nop
9:472E  0e                   push cs
9:472F  e89e5e               call 0xa5d0  ; ReportRow::free@s9:A5D0
9:4732  66ff76f8             push dword ptr [bp - 8]
9:4736  9ace17fa44           lcall 0x44fa, 0x17ce  ; operator_delete@s1:17CE
9:473B  83c404               add sp, 4
loc_473E:
9:473E  c45e06               les bx, ptr [bp + 6]
9:4741  06                   push es
9:4742  53                   push bx
9:4743  26c41f               les bx, ptr es:[bx]
9:4746  26ff5f70             lcall es:[bx + 0x70]
9:474A  b80100               mov ax, 1
9:474D  e9cefe               jmp 0x461e
loc_4750:
9:4750  66ff760c             push dword ptr [bp + 0xc]
9:4754  66ff7608             push dword ptr [bp + 8]
9:4758  ff7606               push word ptr [bp + 6]
9:475B  90                   nop
9:475C  0e                   push cs
9:475D  e8ea6d               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:4760  5e                   pop si
9:4761  5f                   pop di
9:4762  c9                   leave
9:4763  ca0a00               retf 0xa

; ---------------- ExecSummaryDlg::title@s9:4766 FAR size=24 callers=0
;   (vslot 20)
9:4766  55                   push bp
9:4767  8bec                 mov bp, sp
9:4769  1e                   push ds
9:476A  68405d               push 0x5d40
9:476D  c45e06               les bx, ptr [bp + 6]
9:4770  06                   push es
9:4771  53                   push bx
9:4772  26c41f               les bx, ptr es:[bx]
9:4775  26ff5f74             lcall es:[bx + 0x74]
9:4779  c9                   leave
9:477A  ca0400               retf 4
9:477D  db 00

; ---------------- ExecSummaryDlg::init@s9:477E FAR size=128 callers=0
;   (vslot 2) title with the colony name
9:477E  c8100000             enter 0x10, 0
9:4782  66ff7606             push dword ptr [bp + 6]
9:4786  90                   nop
9:4787  0e                   push cs
9:4788  e8a56a               call 0xb230  ; BuildingDlgBase::position@s9:B230
9:478B  6a03                 push 3
9:478D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:4792  9aba20c947           lcall 0x47c9, 0x20ba  ; Registry_get@s3:20BA
9:4797  8946fc               mov word ptr [bp - 4], ax
9:479A  8956fe               mov word ptr [bp - 2], dx
9:479D  1e                   push ds
9:479E  68685d               push 0x5d68
9:47A1  6668eb050000         push 0x5eb
9:47A7  68d307               push 0x7d3
9:47AA  9ad85f6c44           lcall 0x446c, 0x5fd8  ; joinResourceStrings@s2:5FD8
9:47AF  83c406               add sp, 6
9:47B2  8946f8               mov word ptr [bp - 8], ax
9:47B5  8956fa               mov word ptr [bp - 6], dx
9:47B8  52                   push dx
9:47B9  50                   push ax
9:47BA  9aea3cd447           lcall 0x47d4, 0x3cea  ; _fstrcat@s1:3CEA
9:47BF  83c408               add sp, 8
9:47C2  66ff76fc             push dword ptr [bp - 4]
9:47C6  9a64e90246           lcall 0x4602, 0xe964  ; viewColonyNameCopy@s3:E964
9:47CB  52                   push dx
9:47CC  50                   push ax
9:47CD  66ff76f8             push dword ptr [bp - 8]
9:47D1  9aea3ce947           lcall 0x47e9, 0x3cea  ; _fstrcat@s1:3CEA
9:47D6  83c408               add sp, 8
9:47D9  66ff76f8             push dword ptr [bp - 8]
9:47DD  668b4606             mov eax, dword ptr [bp + 6]
9:47E1  051000               add ax, 0x10
9:47E4  6650                 push eax
9:47E6  9a3e3df747           lcall 0x47f7, 0x3d3e  ; _fstrcpy@s1:3D3E
9:47EB  83c408               add sp, 8
9:47EE  668b46f8             mov eax, dword ptr [bp - 8]
9:47F2  6650                 push eax
9:47F4  9ace172b46           lcall 0x462b, 0x17ce  ; operator_delete@s1:17CE
9:47F9  c9                   leave
9:47FA  ca0400               retf 4
9:47FD  db 00

; ---------------- ExecSummaryDlg::scalar_dtor@s9:47FE FAR size=162 callers=0
;   deleting destructor
9:47FE  c8040000             enter 4, 0
9:4802  66ff7606             push dword ptr [bp + 6]
9:4806  90                   nop
9:4807  0e                   push cs
9:4808  e8ed68               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:480B  f6460a01             test byte ptr [bp + 0xa], 1
9:480F  7409                 je 0x481a
9:4811  66ff7606             push dword ptr [bp + 6]
9:4815  9ace17bd47           lcall 0x47bd, 0x17ce  ; operator_delete@s1:17CE
loc_481A:
9:481A  8b4606               mov ax, word ptr [bp + 6]
9:481D  8b5608               mov dx, word ptr [bp + 8]
9:4820  c9                   leave
9:4821  ca0600               retf 6
9:4824  db fe 47 2e 48 10 3a ad 47 7e 47 32 48 16 b3 36 48
9:4834  db e8 45 3a 48 26 b7 3e 48 56 7f 42 48 b2 7b 46 48
9:4844  db 1c 7f 4e 48 48 88 86 48 86 7f 52 48 0c 80 56 48
9:4854  db 54 80 5a 48 72 b3 5e 48 58 81 62 48 b6 81 66 48
9:4864  db fe 81 6e 48 ea 60 7a 48 4a 82 72 48 66 82 76 48
9:4874  db 66 47 82 48 ee 60 7e 48 f4 60 8a 48 c8 b4 8e 48
9:4884  db 42 88 9e 48 fe 60 ac 44 7e 80 92 48 3c b4 96 48
9:4894  db 5e b4 9a 48 7c b1 a2 46 4c 88 c8 44

; ---------------- FactoryDlg::FactoryDlg@s9:48A0 FAR size=362 callers=1
;   dialog 4001 "Factory Summary": the product list (combobox 6000; vtable 4E18)
9:48A0  c8060000             enter 6, 0
9:48A4  57                   push di
9:48A5  56                   push si
9:48A6  ff7610               push word ptr [bp + 0x10]
9:48A9  68a10f               push 0xfa1
9:48AC  66ff7606             push dword ptr [bp + 6]
9:48B0  90                   nop
9:48B1  0e                   push cs
9:48B2  e8cd67               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:48B5  c45e06               les bx, ptr [bp + 6]
9:48B8  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
9:48C2  26c707184e           mov word ptr es:[bx], 0x4e18
9:48C7  26c747026b49         mov word ptr es:[bx + 2], 0x496b  ; SEGMENT s9:0000
9:48CD  6a03                 push 3
9:48CF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:48D4  9aba20fc49           lcall 0x49fc, 0x20ba  ; Registry_get@s3:20BA
9:48D9  c45e06               les bx, ptr [bp + 6]
9:48DC  2689879400           mov word ptr es:[bx + 0x94], ax
9:48E1  2689979600           mov word ptr es:[bx + 0x96], dx
9:48E6  6a18                 push 0x18
9:48E8  9a9c174a49           lcall 0x494a, 0x179c  ; operator_new@s1:179C
9:48ED  83c402               add sp, 2
9:48F0  8946fa               mov word ptr [bp - 6], ax
9:48F3  8956fc               mov word ptr [bp - 4], dx
9:48F6  0bd0                 or dx, ax
9:48F8  7418                 je 0x4912
9:48FA  ff76fc               push word ptr [bp - 4]
9:48FD  50                   push ax
9:48FE  90                   nop
9:48FF  0e                   push cs
9:4900  e8955c               call 0xa598  ; ReportRow::ReportRow@s9:A598
9:4903  c45e06               les bx, ptr [bp + 6]
9:4906  2689879000           mov word ptr es:[bx + 0x90], ax
9:490B  2689979200           mov word ptr es:[bx + 0x92], dx
9:4910  eb0d                 jmp 0x491f
loc_4912:
9:4912  c45e06               les bx, ptr [bp + 6]
9:4915  6626c787900000000000 mov dword ptr es:[bx + 0x90], 0
loc_491F:
9:491F  c45e06               les bx, ptr [bp + 6]
9:4922  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4927  26c7070700           mov word ptr es:[bx], 7
9:492C  c45e06               les bx, ptr [bp + 6]
9:492F  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4934  268b07               mov ax, word ptr es:[bx]
9:4937  8946fe               mov word ptr [bp - 2], ax
9:493A  8bc8                 mov cx, ax
9:493C  c1e002               shl ax, 2
9:493F  03c1                 add ax, cx
9:4941  03c0                 add ax, ax
9:4943  050200               add ax, 2
9:4946  50                   push ax
9:4947  9a9c177749           lcall 0x4977, 0x179c  ; operator_new@s1:179C
9:494C  83c402               add sp, 2
9:494F  8946fa               mov word ptr [bp - 6], ax
9:4952  8956fc               mov word ptr [bp - 4], dx
9:4955  0bd0                 or dx, ax
9:4957  7433                 je 0x498c
9:4959  8b46fe               mov ax, word ptr [bp - 2]
9:495C  c45efa               les bx, ptr [bp - 6]
9:495F  268907               mov word ptr es:[bx], ax
9:4962  8d4f02               lea cx, [bx + 2]
9:4965  06                   push es
9:4966  51                   push cx
9:4967  6a0a                 push 0xa
9:4969  50                   push ax
9:496A  682648               push 0x4826  ; SEGMENT s9:0000
9:496D  6864a5               push 0xa564
9:4970  8bf1                 mov si, cx
9:4972  8cc7                 mov di, es
9:4974  9a86551848           lcall 0x4818, 0x5586  ; __vec_ctor@s1:5586
9:4979  c45e06               les bx, ptr [bp + 6]
9:497C  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4981  26897702             mov word ptr es:[bx + 2], si
9:4985  26897f04             mov word ptr es:[bx + 4], di
9:4989  eb12                 jmp 0x499d
9:498B  db 90
loc_498C:
9:498C  c45e06               les bx, ptr [bp + 6]
9:498F  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4994  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_499D:
9:499D  668b460c             mov eax, dword ptr [bp + 0xc]
9:49A1  c45e06               les bx, ptr [bp + 6]
9:49A4  26c49f9000           les bx, ptr es:[bx + 0x90]
9:49A9  6626894706           mov dword ptr es:[bx + 6], eax
9:49AE  8b4e0a               mov cx, word ptr [bp + 0xa]
9:49B1  c45e06               les bx, ptr [bp + 6]
9:49B4  26c49f9000           les bx, ptr es:[bx + 0x90]
9:49B9  26894f0a             mov word ptr es:[bx + 0xa], cx
9:49BD  c45e06               les bx, ptr [bp + 6]
9:49C0  268b4f0a             mov cx, word ptr es:[bx + 0xa]
9:49C4  26c49f9000           les bx, ptr es:[bx + 0x90]
9:49C9  26894f12             mov word ptr es:[bx + 0x12], cx
9:49CD  6650                 push eax
9:49CF  c45e06               les bx, ptr [bp + 6]
9:49D2  268b879000           mov ax, word ptr es:[bx + 0x90]
9:49D7  268b979200           mov dx, word ptr es:[bx + 0x92]
9:49DC  8bc8                 mov cx, ax
9:49DE  050c00               add ax, 0xc
9:49E1  52                   push dx
9:49E2  50                   push ax
9:49E3  8bd9                 mov bx, cx
9:49E5  83c110               add cx, 0x10
9:49E8  52                   push dx
9:49E9  51                   push cx
9:49EA  8ec2                 mov es, dx
9:49EC  26ff770a             push word ptr es:[bx + 0xa]
9:49F0  c45e06               les bx, ptr [bp + 6]
9:49F3  6626ffb79400         push dword ptr es:[bx + 0x94]
9:49F9  9abede9547           lcall 0x4795, 0xdebe  ; factoryProducts@s3:DEBE
9:49FE  8b4606               mov ax, word ptr [bp + 6]
9:4A01  8b5608               mov dx, word ptr [bp + 8]
9:4A04  5e                   pop si
9:4A05  5f                   pop di
9:4A06  c9                   leave
9:4A07  ca0c00               retf 0xc

; ---------------- FactoryDlg::fillProducts@s9:4A0A size=218 callers=0
;   apis: USER.GetDlgItem, USER.SendMessage
;   (vslot 20) the products it can make
9:4A0A  c80e0000             enter 0xe, 0
9:4A0E  56                   push si
9:4A0F  1e                   push ds
9:4A10  686a5d               push 0x5d6a
9:4A13  c45e06               les bx, ptr [bp + 6]
9:4A16  06                   push es
9:4A17  53                   push bx
9:4A18  26c41f               les bx, ptr es:[bx]
9:4A1B  26ff5f74             lcall es:[bx + 0x74]
9:4A1F  c45e06               les bx, ptr [bp + 6]
9:4A22  26ff7706             push word ptr es:[bx + 6]
9:4A26  687017               push 0x1770
9:4A29  9adc420000           lcall 0, 0x42dc  ; USER.GetDlgItem
9:4A2E  8946fe               mov word ptr [bp - 2], ax
9:4A31  50                   push ax
9:4A32  666800000b04         push 0x40b0000
9:4A38  666a00               push 0
9:4A3B  9a4d4a0000           lcall 0, 0x4a4d  ; USER.SendMessage
9:4A40  ff76fe               push word ptr [bp - 2]
9:4A43  666800000b00         push 0xb0000
9:4A49  666a00               push 0
9:4A4C  9a804a0000           lcall 0, 0x4a80  ; USER.SendMessage
9:4A51  c746f80000           mov word ptr [bp - 8], 0
9:4A56  eb2f                 jmp 0x4a87
loc_4A58:
9:4A58  ff76fe               push word ptr [bp - 2]
9:4A5B  666800000304         push 0x4030000
9:4A61  8bf0                 mov si, ax
9:4A63  03f0                 add si, ax
9:4A65  c45e06               les bx, ptr [bp + 6]
9:4A68  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4A6D  26c45f0c             les bx, ptr es:[bx + 0xc]
9:4A71  26ff30               push word ptr es:[bx + si]
9:4A74  66ff7606             push dword ptr [bp + 6]
9:4A78  90                   nop
9:4A79  0e                   push cs
9:4A7A  e84f03               call 0x4dcc  ; FactoryDlg::productText@s9:4DCC
9:4A7D  52                   push dx
9:4A7E  50                   push ax
9:4A7F  9aca4a0000           lcall 0, 0x4aca  ; USER.SendMessage
9:4A84  ff46f8               inc word ptr [bp - 8]
loc_4A87:
9:4A87  8b46f8               mov ax, word ptr [bp - 8]
9:4A8A  c45e06               les bx, ptr [bp + 6]
9:4A8D  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4A92  26394710             cmp word ptr es:[bx + 0x10], ax
9:4A96  7fc0                 jg 0x4a58
9:4A98  66ff7606             push dword ptr [bp + 6]
9:4A9C  90                   nop
9:4A9D  0e                   push cs
9:4A9E  e8dd02               call 0x4d7e  ; FactoryDlg::productIndex@s9:4D7E
9:4AA1  0bc0                 or ax, ax
9:4AA3  7529                 jne 0x4ace
9:4AA5  ff76fe               push word ptr [bp - 2]
9:4AA8  680a04               push 0x40a
9:4AAB  50                   push ax
9:4AAC  c45e06               les bx, ptr [bp + 6]
9:4AAF  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4AB4  26ff770a             push word ptr es:[bx + 0xa]
9:4AB8  50                   push ax
9:4AB9  c45e06               les bx, ptr [bp + 6]
9:4ABC  6626ffb79400         push dword ptr es:[bx + 0x94]
9:4AC2  9aa6add748           lcall 0x48d7, 0xada6  ; productName@s3:ADA6
9:4AC7  52                   push dx
9:4AC8  50                   push ax
9:4AC9  9adb4a0000           lcall 0, 0x4adb  ; USER.SendMessage
loc_4ACE:
9:4ACE  ff76fe               push word ptr [bp - 2]
9:4AD1  666801000b00         push 0xb0001
9:4AD7  666a00               push 0
9:4ADA  9af0420000           lcall 0, 0x42f0  ; USER.SendMessage
9:4ADF  5e                   pop si
9:4AE0  c9                   leave
9:4AE1  ca0400               retf 4

; ---------------- FactoryDlg::refresh@s9:4AE4 size=462 callers=0
;   apis: USER.GetWindowRect, USER.SetWindowPos
;   (vslot 4)
9:4AE4  c8220000             enter 0x22, 0
9:4AE8  57                   push di
9:4AE9  56                   push si
9:4AEA  8b460e               mov ax, word ptr [bp + 0xe]
9:4AED  2deb00               sub ax, 0xeb
9:4AF0  741e                 je 0x4b10
9:4AF2  2d8516               sub ax, 0x1685
9:4AF5  0f847b01             je 0x4c74
9:4AF9  66ff760c             push dword ptr [bp + 0xc]
9:4AFD  66ff7608             push dword ptr [bp + 8]
9:4B01  ff7606               push word ptr [bp + 6]
9:4B04  90                   nop
9:4B05  0e                   push cs
9:4B06  e8416a               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:4B09  5e                   pop si
9:4B0A  5f                   pop di
9:4B0B  c9                   leave
9:4B0C  ca0a00               retf 0xa
9:4B0F  db 90
loc_4B10:
9:4B10  6a03                 push 3
9:4B12  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:4B17  9aba203a4c           lcall 0x4c3a, 0x20ba  ; Registry_get@s3:20BA
9:4B1C  8946fc               mov word ptr [bp - 4], ax
9:4B1F  8956fe               mov word ptr [bp - 2], dx
9:4B22  c45e06               les bx, ptr [bp + 6]
9:4B25  66268b879000         mov eax, dword ptr es:[bx + 0x90]
9:4B2B  668946f8             mov dword ptr [bp - 8], eax
9:4B2F  660bc0               or eax, eax
9:4B32  750a                 jne 0x4b3e
loc_4B34:
9:4B34  33c0                 xor ax, ax
loc_4B36:
9:4B36  33d2                 xor dx, dx
9:4B38  5e                   pop si
9:4B39  5f                   pop di
9:4B3A  c9                   leave
9:4B3B  ca0a00               retf 0xa
loc_4B3E:
9:4B3E  6a18                 push 0x18
9:4B40  9a9c17994b           lcall 0x4b99, 0x179c  ; operator_new@s1:179C
9:4B45  83c402               add sp, 2
9:4B48  8946f2               mov word ptr [bp - 0xe], ax
9:4B4B  8956f4               mov word ptr [bp - 0xc], dx
9:4B4E  0bd0                 or dx, ax
9:4B50  740c                 je 0x4b5e
9:4B52  ff76f4               push word ptr [bp - 0xc]
9:4B55  50                   push ax
9:4B56  90                   nop
9:4B57  0e                   push cs
9:4B58  e83d5a               call 0xa598  ; ReportRow::ReportRow@s9:A598
9:4B5B  eb04                 jmp 0x4b61
9:4B5D  db 90
loc_4B5E:
9:4B5E  33c0                 xor ax, ax
9:4B60  99                   cdq
loc_4B61:
9:4B61  c45e06               les bx, ptr [bp + 6]
9:4B64  2689879000           mov word ptr es:[bx + 0x90], ax
9:4B69  2689979200           mov word ptr es:[bx + 0x92], dx
9:4B6E  c45e06               les bx, ptr [bp + 6]
9:4B71  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4B76  26c7070700           mov word ptr es:[bx], 7
9:4B7B  c45e06               les bx, ptr [bp + 6]
9:4B7E  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4B83  268b07               mov ax, word ptr es:[bx]
9:4B86  8946f6               mov word ptr [bp - 0xa], ax
9:4B89  8bc8                 mov cx, ax
9:4B8B  c1e002               shl ax, 2
9:4B8E  03c1                 add ax, cx
9:4B90  03c0                 add ax, ax
9:4B92  050200               add ax, 2
9:4B95  50                   push ax
9:4B96  9a9c17c64b           lcall 0x4bc6, 0x179c  ; operator_new@s1:179C
9:4B9B  83c402               add sp, 2
9:4B9E  8946f2               mov word ptr [bp - 0xe], ax
9:4BA1  8956f4               mov word ptr [bp - 0xc], dx
9:4BA4  0bd0                 or dx, ax
9:4BA6  7432                 je 0x4bda
9:4BA8  8b46f6               mov ax, word ptr [bp - 0xa]
9:4BAB  c45ef2               les bx, ptr [bp - 0xe]
9:4BAE  268907               mov word ptr es:[bx], ax
9:4BB1  8d4f02               lea cx, [bx + 2]
9:4BB4  06                   push es
9:4BB5  51                   push cx
9:4BB6  6a0a                 push 0xa
9:4BB8  50                   push ax
9:4BB9  68cb48               push 0x48cb  ; SEGMENT s9:0000
9:4BBC  6864a5               push 0xa564
9:4BBF  8bf1                 mov si, cx
9:4BC1  8cc7                 mov di, es
9:4BC3  9a86555d4c           lcall 0x4c5d, 0x5586  ; __vec_ctor@s1:5586
9:4BC8  c45e06               les bx, ptr [bp + 6]
9:4BCB  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4BD0  26897702             mov word ptr es:[bx + 2], si
9:4BD4  26897f04             mov word ptr es:[bx + 4], di
9:4BD8  eb11                 jmp 0x4beb
loc_4BDA:
9:4BDA  c45e06               les bx, ptr [bp + 6]
9:4BDD  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4BE2  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_4BEB:
9:4BEB  c45ef8               les bx, ptr [bp - 8]
9:4BEE  66268b4706           mov eax, dword ptr es:[bx + 6]
9:4BF3  c45e06               les bx, ptr [bp + 6]
9:4BF6  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4BFB  6626894706           mov dword ptr es:[bx + 6], eax
9:4C00  c45ef8               les bx, ptr [bp - 8]
9:4C03  268b470a             mov ax, word ptr es:[bx + 0xa]
9:4C07  c45e06               les bx, ptr [bp + 6]
9:4C0A  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4C0F  2689470a             mov word ptr es:[bx + 0xa], ax
9:4C13  c45ef8               les bx, ptr [bp - 8]
9:4C16  268b4712             mov ax, word ptr es:[bx + 0x12]
9:4C1A  c45e06               les bx, ptr [bp + 6]
9:4C1D  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4C22  26894712             mov word ptr es:[bx + 0x12], ax
9:4C26  c45e06               les bx, ptr [bp + 6]
9:4C29  6626ffb79000         push dword ptr es:[bx + 0x90]
9:4C2F  1e                   push ds
9:4C30  686a5d               push 0x5d6a
9:4C33  66ff76fc             push dword ptr [bp - 4]
9:4C37  9a0ca5c54a           lcall 0x4ac5, 0xa50c  ; Reports::resourceRow@s3:A50C
9:4C3C  668b46f8             mov eax, dword ptr [bp - 8]
9:4C40  668946ee             mov dword ptr [bp - 0x12], eax
9:4C44  668946f2             mov dword ptr [bp - 0xe], eax
9:4C48  660bc0               or eax, eax
9:4C4B  7415                 je 0x4c62
9:4C4D  ff76fa               push word ptr [bp - 6]
9:4C50  50                   push ax
9:4C51  90                   nop
9:4C52  0e                   push cs
9:4C53  e87a59               call 0xa5d0  ; ReportRow::free@s9:A5D0
9:4C56  66ff76f8             push dword ptr [bp - 8]
9:4C5A  9ace17eb48           lcall 0x48eb, 0x17ce  ; operator_delete@s1:17CE
9:4C5F  83c404               add sp, 4
loc_4C62:
9:4C62  c45e06               les bx, ptr [bp + 6]
9:4C65  06                   push es
9:4C66  53                   push bx
9:4C67  26c41f               les bx, ptr es:[bx]
9:4C6A  26ff5f70             lcall es:[bx + 0x70]
loc_4C6E:
9:4C6E  b80100               mov ax, 1
9:4C71  e9c2fe               jmp 0x4b36
loc_4C74:
9:4C74  8b460c               mov ax, word ptr [bp + 0xc]
9:4C77  2d0700               sub ax, 7
9:4C7A  740a                 je 0x4c86
9:4C7C  48                   dec ax
9:4C7D  48                   dec ax
9:4C7E  74ee                 je 0x4c6e
9:4C80  48                   dec ax
9:4C81  74eb                 je 0x4c6e
9:4C83  e9aefe               jmp 0x4b34
loc_4C86:
9:4C86  ff760a               push word ptr [bp + 0xa]
9:4C89  8d46de               lea ax, [bp - 0x22]
9:4C8C  16                   push ss
9:4C8D  50                   push ax
9:4C8E  9afb430000           lcall 0, 0x43fb  ; USER.GetWindowRect
9:4C93  ff760a               push word ptr [bp + 0xa]
9:4C96  666a00               push 0
9:4C99  6a00                 push 0
9:4C9B  8b46de               mov ax, word ptr [bp - 0x22]
9:4C9E  2946e2               sub word ptr [bp - 0x1e], ax
9:4CA1  ff76e2               push word ptr [bp - 0x1e]
9:4CA4  666802005000         push 0x500002
9:4CAA  9a5d330000           lcall 0, 0x335d  ; USER.SetWindowPos
9:4CAF  ebbd                 jmp 0x4c6e
9:4CB1  db 00

; ---------------- FactoryDlg::selectCurrent@s9:4CB2 FAR size=66 callers=0
;   apis: USER.GetDlgItem, USER.SendMessage
;   (vslot 28) the current product selected, else a None row
9:4CB2  c8040000             enter 4, 0
9:4CB6  66ff7606             push dword ptr [bp + 6]
9:4CBA  90                   nop
9:4CBB  0e                   push cs
9:4CBC  e89f67               call 0xb45e  ; BuildingDlgBase::setText@s9:B45E
9:4CBF  c45e06               les bx, ptr [bp + 6]
9:4CC2  26ff7706             push word ptr es:[bx + 6]
9:4CC6  687017               push 0x1770
9:4CC9  9a2a4a0000           lcall 0, 0x4a2a  ; USER.GetDlgItem
9:4CCE  50                   push ax
9:4CCF  6668ffff0d04         push 0x40dffff
9:4CD5  66ff7606             push dword ptr [bp + 6]
9:4CD9  90                   nop
9:4CDA  0e                   push cs
9:4CDB  e8a000               call 0x4d7e  ; FactoryDlg::productIndex@s9:4D7E
9:4CDE  50                   push ax
9:4CDF  66ff7606             push dword ptr [bp + 6]
9:4CE3  90                   nop
9:4CE4  0e                   push cs
9:4CE5  e8e400               call 0x4dcc  ; FactoryDlg::productText@s9:4DCC
9:4CE8  52                   push dx
9:4CE9  50                   push ax
9:4CEA  9a3c4a0000           lcall 0, 0x4a3c  ; USER.SendMessage
9:4CEF  c9                   leave
9:4CF0  ca0400               retf 4
9:4CF3  db 00

; ---------------- FactoryDlg::onOK@s9:4CF4 FAR size=138 callers=0
;   apis: USER.GetDlgItem, USER.SendMessage
;   (vslot 30) sets the chosen product
9:4CF4  c8560000             enter 0x56, 0
9:4CF8  c45e06               les bx, ptr [bp + 6]
9:4CFB  26ff7706             push word ptr es:[bx + 6]
9:4CFF  687017               push 0x1770
9:4D02  9aca4c0000           lcall 0, 0x4cca  ; USER.GetDlgItem
9:4D07  8946ae               mov word ptr [bp - 0x52], ax
9:4D0A  50                   push ax
9:4D0B  666800000704         push 0x4070000
9:4D11  666a00               push 0
9:4D14  9a2e4d0000           lcall 0, 0x4d2e  ; USER.SendMessage
9:4D19  8946ac               mov word ptr [bp - 0x54], ax
9:4D1C  3dffff               cmp ax, 0xffff
9:4D1F  7411                 je 0x4d32
9:4D21  ff76ae               push word ptr [bp - 0x52]
9:4D24  680804               push 0x408
9:4D27  50                   push ax
9:4D28  8d46b0               lea ax, [bp - 0x50]
9:4D2B  16                   push ss
9:4D2C  50                   push ax
9:4D2D  9aeb4c0000           lcall 0, 0x4ceb  ; USER.SendMessage
loc_4D32:
9:4D32  c45e06               les bx, ptr [bp + 6]
9:4D35  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4D3A  26ff770a             push word ptr es:[bx + 0xa]
9:4D3E  8d46b0               lea ax, [bp - 0x50]
9:4D41  16                   push ss
9:4D42  50                   push ax
9:4D43  c45e06               les bx, ptr [bp + 6]
9:4D46  6626ffb79400         push dword ptr es:[bx + 0x94]
9:4D4C  9a12ae774d           lcall 0x4d77, 0xae12  ; productByName@s3:AE12
9:4D51  8946aa               mov word ptr [bp - 0x56], ax
9:4D54  40                   inc ax
9:4D55  7422                 je 0x4d79
9:4D57  c45e06               les bx, ptr [bp + 6]
9:4D5A  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4D5F  6626ff7706           push dword ptr es:[bx + 6]
9:4D64  26ff770a             push word ptr es:[bx + 0xa]
9:4D68  ff76aa               push word ptr [bp - 0x56]
9:4D6B  c45e06               les bx, ptr [bp + 6]
9:4D6E  6626ffb79400         push dword ptr es:[bx + 0x94]
9:4D74  9a92ae1a4b           lcall 0x4b1a, 0xae92  ; setFactoryProduct@s3:AE92
loc_4D79:
9:4D79  c9                   leave
9:4D7A  ca0400               retf 4
9:4D7D  db 00

; ---------------- FactoryDlg::productIndex@s9:4D7E FAR size=78 callers=2
;   index of a product
9:4D7E  c8080000             enter 8, 0
9:4D82  c45e06               les bx, ptr [bp + 6]
9:4D85  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4D8A  66268b4702           mov eax, dword ptr es:[bx + 2]
9:4D8F  668946fc             mov dword ptr [bp - 4], eax
9:4D93  c746fa0000           mov word ptr [bp - 6], 0
9:4D98  eb07                 jmp 0x4da1
loc_4D9A:
9:4D9A  ff46fa               inc word ptr [bp - 6]
9:4D9D  8346fc0a             add word ptr [bp - 4], 0xa
loc_4DA1:
9:4DA1  8b46fa               mov ax, word ptr [bp - 6]
9:4DA4  c45e06               les bx, ptr [bp + 6]
9:4DA7  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4DAC  263907               cmp word ptr es:[bx], ax
9:4DAF  7e0b                 jle 0x4dbc
9:4DB1  c45efc               les bx, ptr [bp - 4]
9:4DB4  26817f047017         cmp word ptr es:[bx + 4], 0x1770
9:4DBA  75de                 jne 0x4d9a
loc_4DBC:
9:4DBC  c45efc               les bx, ptr [bp - 4]
9:4DBF  6626ff37             push dword ptr es:[bx]
9:4DC3  9a243e434b           lcall 0x4b43, 0x3e24  ; _fatoi@s1:3E24
9:4DC8  c9                   leave
9:4DC9  ca0400               retf 4

; ---------------- FactoryDlg::productText@s9:4DCC FAR size=38 callers=2
;   a product's name
9:4DCC  c8040000             enter 4, 0
9:4DD0  c45e06               les bx, ptr [bp + 6]
9:4DD3  26c49f9000           les bx, ptr es:[bx + 0x90]
9:4DD8  26ff770a             push word ptr es:[bx + 0xa]
9:4DDC  ff760a               push word ptr [bp + 0xa]
9:4DDF  c45e06               les bx, ptr [bp + 6]
9:4DE2  6626ffb79400         push dword ptr es:[bx + 0x94]
9:4DE8  9aa6ad4f4d           lcall 0x4d4f, 0xada6  ; productName@s3:ADA6
9:4DED  c9                   leave
9:4DEE  ca0600               retf 6
9:4DF1  db 00

; ---------------- FactoryDlg::scalar_dtor@s9:4DF2 FAR size=162 callers=0
;   deleting destructor
9:4DF2  c8040000             enter 4, 0
9:4DF6  66ff7606             push dword ptr [bp + 6]
9:4DFA  90                   nop
9:4DFB  0e                   push cs
9:4DFC  e8f962               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:4DFF  f6460a01             test byte ptr [bp + 0xa], 1
9:4E03  7409                 je 0x4e0e
9:4E05  66ff7606             push dword ptr [bp + 6]
9:4E09  9ace17c64d           lcall 0x4dc6, 0x17ce  ; operator_delete@s1:17CE
loc_4E0E:
9:4E0E  8b4606               mov ax, word ptr [bp + 6]
9:4E11  8b5608               mov dx, word ptr [bp + 8]
9:4E14  c9                   leave
9:4E15  ca0600               retf 6
9:4E18  db f2 4d 22 4e 10 3a 2a 48 30 b2 26 4e 16 b3 2a 4e
9:4E28  db e4 4a 2e 4e 26 b7 32 4e 56 7f 36 4e b2 7b 3a 4e
9:4E38  db 1c 7f 42 4e 48 88 7a 4e 86 7f 46 4e 0c 80 4a 4e
9:4E48  db 54 80 4e 4e 72 b3 52 4e 58 81 56 4e b6 81 5a 4e
9:4E58  db fe 81 62 4e ea 60 6e 4e 4a 82 66 4e 66 82 6a 4e
9:4E68  db 0a 4a 76 4e ee 60 72 4e f4 60 7e 4e c8 b4 82 4e
9:4E78  db 42 88 4a 48 fe 60 6a 48 7e 80 86 4e 3c b4 8a 4e
9:4E88  db b2 4c 8e 4e 7c b1 92 4e f4 4c ba 4b

; ---------------- LabDlg::LabDlg@s9:4E94 FAR size=118 callers=1
;   dialog 4011: a laboratory's topic (vtable 55A2)
9:4E94  55                   push bp
9:4E95  8bec                 mov bp, sp
9:4E97  ff760e               push word ptr [bp + 0xe]
9:4E9A  66680000ab0f         push 0xfab0000
9:4EA0  6a00                 push 0
9:4EA2  66ff7606             push dword ptr [bp + 6]
9:4EA6  90                   nop
9:4EA7  0e                   push cs
9:4EA8  e81162               call 0xb0bc  ; ObjectDlgBase::ObjectDlgBase@s9:B0BC
9:4EAB  c45e06               les bx, ptr [bp + 6]
9:4EAE  662bc0               sub eax, eax
9:4EB1  662689879400         mov dword ptr es:[bx + 0x94], eax
9:4EB7  662689879800         mov dword ptr es:[bx + 0x98], eax
9:4EBD  66268987b000         mov dword ptr es:[bx + 0xb0], eax
9:4EC3  268987b400           mov word ptr es:[bx + 0xb4], ax
9:4EC8  268987b600           mov word ptr es:[bx + 0xb6], ax
9:4ECD  26c707a255           mov word ptr es:[bx], 0x55a2
9:4ED2  26c747021a4e         mov word ptr es:[bx + 2], 0x4e1a  ; SEGMENT s9:0000
9:4ED8  66837e0a00           cmp dword ptr [bp + 0xa], 0
9:4EDD  7420                 je 0x4eff
9:4EDF  c45e0a               les bx, ptr [bp + 0xa]
9:4EE2  66268b4706           mov eax, dword ptr es:[bx + 6]
9:4EE7  c45e06               les bx, ptr [bp + 6]
9:4EEA  66268987b000         mov dword ptr es:[bx + 0xb0], eax
9:4EF0  c45e0a               les bx, ptr [bp + 0xa]
9:4EF3  268b4714             mov ax, word ptr es:[bx + 0x14]
9:4EF7  c45e06               les bx, ptr [bp + 6]
9:4EFA  268987b400           mov word ptr es:[bx + 0xb4], ax
loc_4EFF:
9:4EFF  8b4606               mov ax, word ptr [bp + 6]
9:4F02  8b5608               mov dx, word ptr [bp + 8]
9:4F05  c9                   leave
9:4F06  ca0a00               retf 0xa
9:4F09  db 00

; ---------------- LabDlg::~LabDlg@s9:4F0A FAR size=30 callers=1
;   dtor
9:4F0A  55                   push bp
9:4F0B  8bec                 mov bp, sp
9:4F0D  c45e06               les bx, ptr [bp + 6]
9:4F10  26c707a255           mov word ptr es:[bx], 0x55a2
9:4F15  26c74702d64e         mov word ptr es:[bx + 2], 0x4ed6  ; SEGMENT s9:0000
9:4F1B  66ff7606             push dword ptr [bp + 6]
9:4F1F  90                   nop
9:4F20  0e                   push cs
9:4F21  e8d461               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:4F24  c9                   leave
9:4F25  ca0400               retf 4

; ---------------- LabDlg::dlgProc@s9:4F28 FAR size=90 callers=0
;   (vslot 3)
9:4F28  55                   push bp
9:4F29  8bec                 mov bp, sp
9:4F2B  8b4610               mov ax, word ptr [bp + 0x10]
9:4F2E  2d2b00               sub ax, 0x2b
9:4F31  741b                 je 0x4f4e
9:4F33  2de600               sub ax, 0xe6
9:4F36  7430                 je 0x4f68
9:4F38  66ff760e             push dword ptr [bp + 0xe]
9:4F3C  66ff760a             push dword ptr [bp + 0xa]
9:4F40  66ff7606             push dword ptr [bp + 6]
9:4F44  90                   nop
9:4F45  0e                   push cs
9:4F46  e8cd63               call 0xb316  ; BuildingDlgBase::dlgProc@s9:B316
9:4F49  c9                   leave
9:4F4A  ca0c00               retf 0xc
9:4F4D  db 90
loc_4F4E:
9:4F4E  8b4e0c               mov cx, word ptr [bp + 0xc]
9:4F51  8b5e0a               mov bx, word ptr [bp + 0xa]
9:4F54  8ec1                 mov es, cx
9:4F56  26833f04             cmp word ptr es:[bx], 4
9:4F5A  751f                 jne 0x4f7b
9:4F5C  51                   push cx
9:4F5D  53                   push bx
9:4F5E  90                   nop
9:4F5F  0e                   push cs
9:4F60  e80346               call 0x9566  ; objectFromHwnd@s9:9566
9:4F63  8be5                 mov sp, bp
9:4F65  eb14                 jmp 0x4f7b
9:4F67  db 90
loc_4F68:
9:4F68  66ff760c             push dword ptr [bp + 0xc]
9:4F6C  ff760a               push word ptr [bp + 0xa]
9:4F6F  c45e06               les bx, ptr [bp + 6]
9:4F72  06                   push es
9:4F73  53                   push bx
9:4F74  26c41f               les bx, ptr es:[bx]
9:4F77  26ff5f7c             lcall es:[bx + 0x7c]
loc_4F7B:
9:4F7B  b80100               mov ax, 1
9:4F7E  c9                   leave
9:4F7F  ca0c00               retf 0xc

; ---------------- LabDlg::refresh@s9:4F82 FAR size=20 callers=0
;   (vslot 9)
9:4F82  55                   push bp
9:4F83  8bec                 mov bp, sp
9:4F85  c45e06               les bx, ptr [bp + 6]
9:4F88  06                   push es
9:4F89  53                   push bx
9:4F8A  26c41f               les bx, ptr es:[bx]
9:4F8D  26ff9f8000           lcall es:[bx + 0x80]
9:4F92  c9                   leave
9:4F93  ca0400               retf 4

; ---------------- LabDlg::init@s9:4F96 size=674 callers=0
;   apis: USER.SetWindowPos
;   (vslot 2) topic, progress, priority
9:4F96  c81a0000             enter 0x1a, 0
9:4F9A  66ff7606             push dword ptr [bp + 6]
9:4F9E  90                   nop
9:4F9F  0e                   push cs
9:4FA0  e83f29               call 0x78e2  ; OPDialog::create@s9:78E2
9:4FA3  6a41                 push 0x41
9:4FA5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:4FAA  9aba20b051           lcall 0x51b0, 0x20ba  ; Registry_get@s3:20BA
9:4FAF  c45e06               les bx, ptr [bp + 6]
9:4FB2  2689879800           mov word ptr es:[bx + 0x98], ax
9:4FB7  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:4FBC  52                   push dx
9:4FBD  26ffb79800           push word ptr es:[bx + 0x98]
9:4FC2  26c49f9800           les bx, ptr es:[bx + 0x98]
9:4FC7  26c41f               les bx, ptr es:[bx]
9:4FCA  26ff5f10             lcall es:[bx + 0x10]
9:4FCE  6a0a                 push 0xa
9:4FD0  9a9c172450           lcall 0x5024, 0x179c  ; operator_new@s1:179C
9:4FD5  83c402               add sp, 2
9:4FD8  8956f0               mov word ptr [bp - 0x10], dx
9:4FDB  0bd0                 or dx, ax
9:4FDD  741f                 je 0x4ffe
9:4FDF  c45e06               les bx, ptr [bp + 6]
9:4FE2  26ff7706             push word ptr es:[bx + 6]
9:4FE6  ff76f0               push word ptr [bp - 0x10]
9:4FE9  50                   push ax
9:4FEA  90                   nop
9:4FEB  0e                   push cs
9:4FEC  e84f6f               call 0xbf3e  ; TreeView::TreeView@s9:BF3E
9:4FEF  c45e06               les bx, ptr [bp + 6]
9:4FF2  2689879400           mov word ptr es:[bx + 0x94], ax
9:4FF7  2689979600           mov word ptr es:[bx + 0x96], dx
9:4FFC  eb0d                 jmp 0x500b
loc_4FFE:
9:4FFE  c45e06               les bx, ptr [bp + 6]
9:5001  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
loc_500B:
9:500B  c45e06               les bx, ptr [bp + 6]
9:500E  6626ffb79800         push dword ptr es:[bx + 0x98]
9:5014  6626ffb79400         push dword ptr es:[bx + 0x94]
9:501A  90                   nop
9:501B  0e                   push cs
9:501C  e8bf6f               call 0xbfde  ; TreeView::attach@s9:BFDE
9:501F  6a42                 push 0x42
9:5021  9a9c175950           lcall 0x5059, 0x179c  ; operator_new@s1:179C
9:5026  83c402               add sp, 2
9:5029  8956f0               mov word ptr [bp - 0x10], dx
9:502C  0bd0                 or dx, ax
9:502E  7424                 je 0x5054
9:5030  c45e06               les bx, ptr [bp + 6]
9:5033  26ff7706             push word ptr es:[bx + 6]
9:5037  666880000a01         push 0x10a0080
9:503D  666800008100         push 0x810000
9:5043  66680a000a00         push 0xa000a
9:5049  6a01                 push 1
9:504B  ff76f0               push word ptr [bp - 0x10]
9:504E  50                   push ax
9:504F  9ad63b8750           lcall 0x5087, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_5054:
9:5054  6a42                 push 0x42
9:5056  9a9c178e50           lcall 0x508e, 0x179c  ; operator_new@s1:179C
9:505B  83c402               add sp, 2
9:505E  8956f0               mov word ptr [bp - 0x10], dx
9:5061  0bd0                 or dx, ax
9:5063  7424                 je 0x5089
9:5065  c45e06               les bx, ptr [bp + 6]
9:5068  26ff7706             push word ptr es:[bx + 6]
9:506C  666884000b01         push 0x10b0084
9:5072  666800008500         push 0x850000
9:5078  666828000a00         push 0xa0028
9:507E  6a01                 push 1
9:5080  ff76f0               push word ptr [bp - 0x10]
9:5083  50                   push ax
9:5084  9ad63bbc50           lcall 0x50bc, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_5089:
9:5089  6a42                 push 0x42
9:508B  9a9c17c350           lcall 0x50c3, 0x179c  ; operator_new@s1:179C
9:5090  83c402               add sp, 2
9:5093  8956f0               mov word ptr [bp - 0x10], dx
9:5096  0bd0                 or dx, ax
9:5098  7424                 je 0x50be
9:509A  c45e06               les bx, ptr [bp + 6]
9:509D  26ff7706             push word ptr es:[bx + 6]
9:50A1  666886000d01         push 0x10d0086
9:50A7  666800008700         push 0x870000
9:50AD  666846000a00         push 0xa0046
9:50B3  6a01                 push 1
9:50B5  ff76f0               push word ptr [bp - 0x10]
9:50B8  50                   push ax
9:50B9  9ad63bf150           lcall 0x50f1, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_50BE:
9:50BE  6a42                 push 0x42
9:50C0  9a9c17f850           lcall 0x50f8, 0x179c  ; operator_new@s1:179C
9:50C5  83c402               add sp, 2
9:50C8  8956f0               mov word ptr [bp - 0x10], dx
9:50CB  0bd0                 or dx, ax
9:50CD  7424                 je 0x50f3
9:50CF  c45e06               les bx, ptr [bp + 6]
9:50D2  26ff7706             push word ptr es:[bx + 6]
9:50D6  666888000e01         push 0x10e0088
9:50DC  666800008900         push 0x890000
9:50E2  666864000a00         push 0xa0064
9:50E8  6a01                 push 1
9:50EA  ff76f0               push word ptr [bp - 0x10]
9:50ED  50                   push ax
9:50EE  9ad63b2651           lcall 0x5126, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_50F3:
9:50F3  6a42                 push 0x42
9:50F5  9a9c172d51           lcall 0x512d, 0x179c  ; operator_new@s1:179C
9:50FA  83c402               add sp, 2
9:50FD  8956f0               mov word ptr [bp - 0x10], dx
9:5100  0bd0                 or dx, ax
9:5102  7424                 je 0x5128
9:5104  c45e06               les bx, ptr [bp + 6]
9:5107  26ff7706             push word ptr es:[bx + 6]
9:510B  666882000c01         push 0x10c0082
9:5111  666800008300         push 0x830000
9:5117  666882000a00         push 0xa0082
9:511D  6a01                 push 1
9:511F  ff76f0               push word ptr [bp - 0x10]
9:5122  50                   push ax
9:5123  9ad63b5b51           lcall 0x515b, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_5128:
9:5128  6a42                 push 0x42
9:512A  9a9c176351           lcall 0x5163, 0x179c  ; operator_new@s1:179C
9:512F  83c402               add sp, 2
9:5132  8956f0               mov word ptr [bp - 0x10], dx
9:5135  0bd0                 or dx, ax
9:5137  7424                 je 0x515d
9:5139  c45e06               les bx, ptr [bp + 6]
9:513C  26ff7706             push word ptr es:[bx + 6]
9:5140  66688a00bb0b         push 0xbbb008a
9:5146  666800008b00         push 0x8b0000
9:514C  6668d2000a00         push 0xa00d2
9:5152  6a01                 push 1
9:5154  ff76f0               push word ptr [bp - 0x10]
9:5157  50                   push ax
9:5158  9ad63b9151           lcall 0x5191, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_515D:
9:515D  666a42               push 0x42
9:5160  9a9c170c4e           lcall 0x4e0c, 0x179c  ; operator_new@s1:179C
9:5165  83c402               add sp, 2
9:5168  8956f0               mov word ptr [bp - 0x10], dx
9:516B  0bd0                 or dx, ax
9:516D  7427                 je 0x5196
9:516F  c45e06               les bx, ptr [bp + 6]
9:5172  26ff7706             push word ptr es:[bx + 6]
9:5176  66688c00bc0b         push 0xbbc008c
9:517C  66688e008d00         push 0x8d008e
9:5182  6668a0000a00         push 0xa00a0
9:5188  6a01                 push 1
9:518A  ff76f0               push word ptr [bp - 0x10]
9:518D  50                   push ax
9:518E  9ad63b1e4e           lcall 0x4e1e, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:5193  eb04                 jmp 0x5199
9:5195  db 90
loc_5196:
9:5196  33c0                 xor ax, ax
9:5198  99                   cdq
loc_5199:
9:5199  8946fc               mov word ptr [bp - 4], ax
9:519C  8956fe               mov word ptr [bp - 2], dx
9:519F  52                   push dx
9:51A0  50                   push ax
9:51A1  90                   nop
9:51A2  0e                   push cs
9:51A3  e88e40               call 0x9234  ; OPCtrl::enable@s9:9234
9:51A6  6a03                 push 3
9:51A8  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:51AD  9aba20c651           lcall 0x51c6, 0x20ba  ; Registry_get@s3:20BA
9:51B2  8946f8               mov word ptr [bp - 8], ax
9:51B5  8956fa               mov word ptr [bp - 6], dx
9:51B8  c45e06               les bx, ptr [bp + 6]
9:51BB  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:51C1  52                   push dx
9:51C2  50                   push ax
9:51C3  9aaca5d451           lcall 0x51d4, 0xa5ac  ; Lab::topicOf@s3:A5AC
9:51C8  8946f6               mov word ptr [bp - 0xa], ax
9:51CB  6a1e                 push 0x1e
9:51CD  66ff76f8             push dword ptr [bp - 8]
9:51D1  9a62ace451           lcall 0x51e4, 0xac62  ; Player1::flag@s3:AC62
9:51D6  0bc0                 or ax, ax
9:51D8  742b                 je 0x5205
9:51DA  ff76f6               push word ptr [bp - 0xa]
9:51DD  66ff76f8             push dword ptr [bp - 8]
9:51E1  9acaa5f451           lcall 0x51f4, 0xa5ca  ; Player1::progress@s3:A5CA
9:51E6  0bc0                 or ax, ax
9:51E8  7e1b                 jle 0x5205
9:51EA  ff76f6               push word ptr [bp - 0xa]
9:51ED  66ff76f8             push dword ptr [bp - 8]
9:51F1  9a8aa5eb4d           lcall 0x4deb, 0xa58a  ; Player1::isPriority@s3:A58A
9:51F6  0bc0                 or ax, ax
9:51F8  750b                 jne 0x5205
9:51FA  6a01                 push 1
9:51FC  66ff76fc             push dword ptr [bp - 4]
9:5200  90                   nop
9:5201  0e                   push cs
9:5202  e82f40               call 0x9234  ; OPCtrl::enable@s9:9234
loc_5205:
9:5205  c45e06               les bx, ptr [bp + 6]
9:5208  66268b879800         mov eax, dword ptr es:[bx + 0x98]
9:520E  050a00               add ax, 0xa
9:5211  668946f2             mov dword ptr [bp - 0xe], eax
9:5215  26ff7706             push word ptr es:[bx + 6]
9:5219  6a00                 push 0
9:521B  c45ef2               les bx, ptr [bp - 0xe]
9:521E  26ff37               push word ptr es:[bx]
9:5221  26ff7702             push word ptr es:[bx + 2]
9:5225  26ff7704             push word ptr es:[bx + 4]
9:5229  26ff7706             push word ptr es:[bx + 6]
9:522D  6a40                 push 0x40
9:522F  9aab4c0000           lcall 0, 0x4cab  ; USER.SetWindowPos
9:5234  c9                   leave
9:5235  ca0400               retf 4

; ---------------- LabDlg::onCommand@s9:5238 FAR size=30 callers=0
;   (vslot 24)
9:5238  55                   push bp
9:5239  8bec                 mov bp, sp
9:523B  c45e06               les bx, ptr [bp + 6]
9:523E  6626ffb79400         push dword ptr es:[bx + 0x94]
9:5244  26c49f9400           les bx, ptr es:[bx + 0x94]
9:5249  26c41f               les bx, ptr es:[bx]
9:524C  26ff5f08             lcall es:[bx + 8]
9:5250  33c0                 xor ax, ax
9:5252  c9                   leave
9:5253  ca0400               retf 4

; ---------------- LabDlg::destroy@s9:5256 size=106 callers=0
;   apis: USER.DestroyWindow, USER.IsWindow
;   (vslot 32)
9:5256  c8080000             enter 8, 0
9:525A  56                   push si
9:525B  c45e06               les bx, ptr [bp + 6]
9:525E  2683bfb60000         cmp word ptr es:[bx + 0xb6], 0
9:5264  741b                 je 0x5281
9:5266  26ffb7b600           push word ptr es:[bx + 0xb6]
9:526B  9ad80a0000           lcall 0, 0xad8  ; USER.IsWindow
9:5270  0bc0                 or ax, ax
9:5272  740d                 je 0x5281
9:5274  c45e06               les bx, ptr [bp + 6]
9:5277  26ffb7b600           push word ptr es:[bx + 0xb6]
9:527C  9ae1430000           lcall 0, 0x43e1  ; USER.DestroyWindow
loc_5281:
9:5281  c45e06               les bx, ptr [bp + 6]
9:5284  26c787b6000000       mov word ptr es:[bx + 0xb6], 0
9:528B  268b879400           mov ax, word ptr es:[bx + 0x94]
9:5290  268b979600           mov dx, word ptr es:[bx + 0x96]
9:5295  8bda                 mov bx, dx
9:5297  0bd0                 or dx, ax
9:5299  740e                 je 0x52a9
9:529B  6a01                 push 1
9:529D  53                   push bx
9:529E  50                   push ax
9:529F  8ec3                 mov es, bx
9:52A1  8bf0                 mov si, ax
9:52A3  26c41c               les bx, ptr es:[si]
9:52A6  26ff1f               lcall es:[bx]
loc_52A9:
9:52A9  c45e06               les bx, ptr [bp + 6]
9:52AC  662bc0               sub eax, eax
9:52AF  662689879400         mov dword ptr es:[bx + 0x94], eax
9:52B5  662689879800         mov dword ptr es:[bx + 0x98], eax
9:52BB  5e                   pop si
9:52BC  c9                   leave
9:52BD  ca0400               retf 4

; ---------------- LabDlg::onTopic@s9:52C0 size=700 callers=0
;   apis: USER.DestroyWindow, USER.EnableWindow, USER.GetClientRect, USER.GetDlgItem, USER.InvalidateRect, USER.IsWindow, USER.SendMessage, USER.ShowWindow
;   (vslot 31) picks a topic in the tree
9:52C0  c8200000             enter 0x20, 0
9:52C4  8b460e               mov ax, word ptr [bp + 0xe]
9:52C7  3d0c01               cmp ax, 0x10c
9:52CA  0f844201             je 0x5410
9:52CE  0f877802             ja 0x554a
9:52D2  2dfa00               sub ax, 0xfa
9:52D5  740d                 je 0x52e4
9:52D7  2d1000               sub ax, 0x10
9:52DA  7428                 je 0x5304
9:52DC  48                   dec ax
9:52DD  0f84ab00             je 0x538c
9:52E1  e97c02               jmp 0x5560
loc_52E4:
9:52E4  66ff36fe5e           push dword ptr [0x5efe]
9:52E9  6a00                 push 0
9:52EB  c45e06               les bx, ptr [bp + 6]
9:52EE  6626ffb79800         push dword ptr es:[bx + 0x98]
9:52F4  26c49f9800           les bx, ptr es:[bx + 0x98]
9:52F9  26c41f               les bx, ptr es:[bx]
9:52FC  26ff5f18             lcall es:[bx + 0x18]
9:5300  e97102               jmp 0x5574
9:5303  db 90
loc_5304:
9:5304  c45e06               les bx, ptr [bp + 6]
9:5307  26ff7706             push word ptr es:[bx + 6]
9:530B  8d46f8               lea ax, [bp - 8]
9:530E  16                   push ss
9:530F  50                   push ax
9:5310  9a57210000           lcall 0, 0x2157  ; USER.GetClientRect
9:5315  c45e06               les bx, ptr [bp + 6]
9:5318  26c49f9800           les bx, ptr es:[bx + 0x98]
9:531D  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:5321  8946f6               mov word ptr [bp - 0xa], ax
9:5324  c45e06               les bx, ptr [bp + 6]
9:5327  26c49f9800           les bx, ptr es:[bx + 0x98]
9:532C  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:5330  8946f4               mov word ptr [bp - 0xc], ax
9:5333  8346fa03             add word ptr [bp - 6], 3
9:5337  8b46f6               mov ax, word ptr [bp - 0xa]
9:533A  2d0900               sub ax, 9
9:533D  8946f8               mov word ptr [bp - 8], ax
9:5340  836efc03             sub word ptr [bp - 4], 3
9:5344  836efe03             sub word ptr [bp - 2], 3
9:5348  c45e06               les bx, ptr [bp + 6]
9:534B  26ff7706             push word ptr es:[bx + 6]
9:534F  8d46f8               lea ax, [bp - 8]
9:5352  16                   push ss
9:5353  50                   push ax
9:5354  6a01                 push 1
9:5356  9aff3d0000           lcall 0, 0x3dff  ; USER.InvalidateRect
9:535B  c45e06               les bx, ptr [bp + 6]
9:535E  6626ffb79800         push dword ptr es:[bx + 0x98]
9:5364  9aa02f7853           lcall 0x5378, 0x2fa0  ; ResearchTreeBase::destroyButtons@s3:2FA0
9:5369  666a00               push 0
9:536C  c45e06               les bx, ptr [bp + 6]
9:536F  6626ffb79800         push dword ptr es:[bx + 0x98]
9:5375  9ac0328653           lcall 0x5386, 0x32c0  ; ResearchTreeBase::setWindow@s3:32C0
9:537A  c45e06               les bx, ptr [bp + 6]
9:537D  6626ffb79800         push dword ptr es:[bx + 0x98]
9:5383  9ae22ea653           lcall 0x53a6, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:5388  e9e901               jmp 0x5574
9:538B  db 90
loc_538C:
9:538C  c45e06               les bx, ptr [bp + 6]
9:538F  26c49f9800           les bx, ptr es:[bx + 0x98]
9:5394  268b4712             mov ax, word ptr es:[bx + 0x12]
9:5398  8946e0               mov word ptr [bp - 0x20], ax
9:539B  50                   push ax
9:539C  6a03                 push 3
9:539E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:53A3  9aba20b353           lcall 0x53b3, 0x20ba  ; Registry_get@s3:20BA
9:53A8  8946e4               mov word ptr [bp - 0x1c], ax
9:53AB  8956e6               mov word ptr [bp - 0x1a], dx
9:53AE  52                   push dx
9:53AF  50                   push ax
9:53B0  9acaa5df53           lcall 0x53df, 0xa5ca  ; Player1::progress@s3:A5CA
9:53B5  8946e8               mov word ptr [bp - 0x18], ax
9:53B8  837ee070             cmp word ptr [bp - 0x20], 0x70
9:53BC  7406                 je 0x53c4
9:53BE  0bc0                 or ax, ax
9:53C0  0f84b001             je 0x5574
loc_53C4:
9:53C4  c45e06               les bx, ptr [bp + 6]
9:53C7  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:53CD  26c49f9800           les bx, ptr es:[bx + 0x98]
9:53D2  26ff7712             push word ptr es:[bx + 0x12]
9:53D6  ff76e6               push word ptr [bp - 0x1a]
loc_53D9:
9:53D9  ff76e4               push word ptr [bp - 0x1c]
9:53DC  9aeca52a54           lcall 0x542a, 0xa5ec  ; setLabTopic@s3:A5EC
9:53E1  c45e06               les bx, ptr [bp + 6]
9:53E4  2683bfb40000         cmp word ptr es:[bx + 0xb4], 0
9:53EA  7424                 je 0x5410
9:53EC  26ffb7b400           push word ptr es:[bx + 0xb4]
9:53F1  9a9b540000           lcall 0, 0x549b  ; USER.IsWindow
9:53F6  0bc0                 or ax, ax
9:53F8  7416                 je 0x5410
9:53FA  c45e06               les bx, ptr [bp + 6]
9:53FD  26ffb7b400           push word ptr es:[bx + 0xb4]
9:5402  6668eb001101         push 0x11100eb
9:5408  666a00               push 0
9:540B  9a154d0000           lcall 0, 0x4d15  ; USER.SendMessage
loc_5410:
9:5410  c45e06               les bx, ptr [bp + 6]
9:5413  26ff7706             push word ptr es:[bx + 6]
loc_5417:
9:5417  9a7d520000           lcall 0, 0x527d  ; USER.DestroyWindow
9:541C  e95501               jmp 0x5574
9:541F  db 90
loc_5420:
9:5420  6a03                 push 3
9:5422  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:5427  9aba205054           lcall 0x5450, 0x20ba  ; Registry_get@s3:20BA
9:542C  8946e4               mov word ptr [bp - 0x1c], ax
9:542F  8956e6               mov word ptr [bp - 0x1a], dx
9:5432  c45e06               les bx, ptr [bp + 6]
9:5435  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:543B  b87100               mov ax, 0x71
9:543E  8946e0               mov word ptr [bp - 0x20], ax
9:5441  50                   push ax
9:5442  52                   push dx
9:5443  eb94                 jmp 0x53d9
9:5445  db 90
loc_5446:
9:5446  6a32                 push 0x32
9:5448  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:544D  9aba206954           lcall 0x5469, 0x20ba  ; Registry_get@s3:20BA
9:5452  8946e0               mov word ptr [bp - 0x20], ax
9:5455  8956e2               mov word ptr [bp - 0x1e], dx
9:5458  c45e06               les bx, ptr [bp + 6]
9:545B  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:5461  68c60f               push 0xfc6
9:5464  52                   push dx
9:5465  50                   push ax
9:5466  9aaa798554           lcall 0x5485, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:546B  0bc0                 or ax, ax
9:546D  0f850301             jne 0x5574
9:5471  c45e06               les bx, ptr [bp + 6]
9:5474  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:547A  6a13                 push 0x13
9:547C  50                   push ax
9:547D  50                   push ax
9:547E  66ff76e0             push dword ptr [bp - 0x20]
9:5482  9a0073fc54           lcall 0x54fc, 0x7300  ; BuildingWindows::open@s3:7300
9:5487  e9ea00               jmp 0x5574
loc_548A:
9:548A  c45e06               les bx, ptr [bp + 6]
9:548D  2683bfb60000         cmp word ptr es:[bx + 0xb6], 0
9:5493  7419                 je 0x54ae
9:5495  26ffb7b600           push word ptr es:[bx + 0xb6]
9:549A  9a6c520000           lcall 0, 0x526c  ; USER.IsWindow
9:549F  0bc0                 or ax, ax
9:54A1  740b                 je 0x54ae
9:54A3  c45e06               les bx, ptr [bp + 6]
9:54A6  26ffb7b600           push word ptr es:[bx + 0xb6]
9:54AB  e969ff               jmp 0x5417
loc_54AE:
9:54AE  6a1b                 push 0x1b
9:54B0  c45e06               les bx, ptr [bp + 6]
9:54B3  26ff7706             push word ptr es:[bx + 6]
9:54B7  66ff367c5b           push dword ptr [0x5b7c]
9:54BC  9a40afdd54           lcall 0x54dd, 0xaf40  ; DialogCtr::open@s8:AF40
9:54C1  8946e0               mov word ptr [bp - 0x20], ax
9:54C4  8956e2               mov word ptr [bp - 0x1e], dx
9:54C7  c45ee0               les bx, ptr [bp - 0x20]
9:54CA  268b4706             mov ax, word ptr es:[bx + 6]
9:54CE  c45e06               les bx, ptr [bp + 6]
9:54D1  268987b600           mov word ptr es:[bx + 0xb6], ax
9:54D6  66ff76e0             push dword ptr [bp - 0x20]
9:54DA  9adcab3e4e           lcall 0x4e3e, 0xabdc  ; placeBelowControl@s8:ABDC
9:54DF  c45e06               les bx, ptr [bp + 6]
9:54E2  26ffb7b600           push word ptr es:[bx + 0xb6]
9:54E7  6a01                 push 1
9:54E9  9aa7420000           lcall 0, 0x42a7  ; USER.ShowWindow
9:54EE  e98300               jmp 0x5574
9:54F1  db 90
loc_54F2:
9:54F2  6a03                 push 3
9:54F4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:54F9  9aba201255           lcall 0x5512, 0x20ba  ; Registry_get@s3:20BA
9:54FE  8946e0               mov word ptr [bp - 0x20], ax
9:5501  8956e2               mov word ptr [bp - 0x1e], dx
9:5504  c45e06               les bx, ptr [bp + 6]
9:5507  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:550D  52                   push dx
9:550E  50                   push ax
9:550F  9aaca51f55           lcall 0x551f, 0xa5ac  ; Lab::topicOf@s3:A5AC
9:5514  8946e4               mov word ptr [bp - 0x1c], ax
9:5517  50                   push ax
9:5518  66ff76e0             push dword ptr [bp - 0x20]
9:551C  9a8aa52f55           lcall 0x552f, 0xa58a  ; Player1::isPriority@s3:A58A
9:5521  0bc0                 or ax, ax
9:5523  750c                 jne 0x5531
9:5525  66ff76e2             push dword ptr [bp - 0x1e]
9:5529  ff76e0               push word ptr [bp - 0x20]
9:552C  9a68a5ad4f           lcall 0x4fad, 0xa568  ; Player1::topicPoints@s3:A568
loc_5531:
9:5531  c45e06               les bx, ptr [bp + 6]
9:5534  26ff7706             push word ptr es:[bx + 6]
9:5538  ff760e               push word ptr [bp + 0xe]
9:553B  9a034d0000           lcall 0, 0x4d03  ; USER.GetDlgItem
9:5540  50                   push ax
9:5541  6a00                 push 0
9:5543  9a84430000           lcall 0, 0x4384  ; USER.EnableWindow
9:5548  eb2a                 jmp 0x5574
loc_554A:
9:554A  2d0d01               sub ax, 0x10d
9:554D  0f84cffe             je 0x5420
9:5551  48                   dec ax
9:5552  0f84f0fe             je 0x5446
9:5556  2dad0a               sub ax, 0xaad
9:5559  0f842dff             je 0x548a
9:555D  48                   dec ax
9:555E  7492                 je 0x54f2
loc_5560:
9:5560  66ff760c             push dword ptr [bp + 0xc]
9:5564  66ff7608             push dword ptr [bp + 8]
9:5568  ff7606               push word ptr [bp + 6]
9:556B  90                   nop
9:556C  0e                   push cs
9:556D  e8da5f               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:5570  c9                   leave
9:5571  ca0a00               retf 0xa
loc_5574:
9:5574  b80100               mov ax, 1
9:5577  99                   cdq
9:5578  c9                   leave
9:5579  ca0a00               retf 0xa

; ---------------- LabDlg::scalar_dtor@s9:557C FAR size=170 callers=0
;   deleting destructor
9:557C  55                   push bp
9:557D  8bec                 mov bp, sp
9:557F  66ff7606             push dword ptr [bp + 6]
9:5583  90                   nop
9:5584  0e                   push cs
9:5585  e882f9               call 0x4f0a  ; LabDlg::~LabDlg@s9:4F0A
9:5588  f6460a01             test byte ptr [bp + 0xa], 1
9:558C  7409                 je 0x5597
9:558E  66ff7606             push dword ptr [bp + 6]
9:5592  9ace17d34f           lcall 0x4fd3, 0x17ce  ; operator_delete@s1:17CE
loc_5597:
9:5597  8b4606               mov ax, word ptr [bp + 6]
9:559A  8b5608               mov dx, word ptr [bp + 8]
9:559D  c9                   leave
9:559E  ca0600               retf 6
9:55A1  db 90 7c 55 ac 55 10 3a 52 50 96 4f b0 55 28 4f b4
9:55B1  db 55 4a b5 b8 55 26 b7 bc 55 56 7f c0 55 b2 7b c4
9:55C1  db 55 1c 7f c8 55 82 4f cc 55 86 7f d0 55 0c 80 d4
9:55D1  db 55 54 80 d8 55 72 b3 dc 55 58 81 e0 55 b6 81 e4
9:55E1  db 55 fe 81 ec 55 ea 60 f8 55 4a 82 f0 55 66 82 f4
9:55F1  db 55 de 78 00 56 ee 60 fc 55 f4 60 08 56 c8 b4 04
9:5601  db 56 38 52 0c 56 fe 60 5e 4e 7e 80 10 56 3c b4 14
9:5611  db 56 5e b4 18 56 7c b1 20 56 4c 88 bf 54 c0 52 24
9:5621  db 56 56 52 19 4f

; ---------------- LabSummaryDlg::LabSummaryDlg@s9:5626 FAR size=346 callers=1
;   dialog 4003 "Laboratory Summary" (vtable 6386)
9:5626  c80e0000             enter 0xe, 0
9:562A  57                   push di
9:562B  56                   push si
9:562C  ff760e               push word ptr [bp + 0xe]
9:562F  68a30f               push 0xfa3
9:5632  66ff7606             push dword ptr [bp + 6]
9:5636  90                   nop
9:5637  0e                   push cs
9:5638  e8475a               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:563B  c45e06               les bx, ptr [bp + 6]
9:563E  33c0                 xor ax, ax
9:5640  2689879400           mov word ptr es:[bx + 0x94], ax
9:5645  2689879600           mov word ptr es:[bx + 0x96], ax
9:564A  2689879800           mov word ptr es:[bx + 0x98], ax
9:564F  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:5654  26c7078663           mov word ptr es:[bx], 0x6386
9:5659  26c74702e556         mov word ptr es:[bx + 2], 0x56e5  ; SEGMENT s9:0000
9:565F  6a18                 push 0x18
9:5661  9a9c17c456           lcall 0x56c4, 0x179c  ; operator_new@s1:179C
9:5666  83c402               add sp, 2
9:5669  8946f6               mov word ptr [bp - 0xa], ax
9:566C  8956f8               mov word ptr [bp - 8], dx
9:566F  0bd0                 or dx, ax
9:5671  7419                 je 0x568c
9:5673  ff76f8               push word ptr [bp - 8]
9:5676  50                   push ax
9:5677  90                   nop
9:5678  0e                   push cs
9:5679  e81c4f               call 0xa598  ; ReportRow::ReportRow@s9:A598
9:567C  c45e06               les bx, ptr [bp + 6]
9:567F  2689879000           mov word ptr es:[bx + 0x90], ax
9:5684  2689979200           mov word ptr es:[bx + 0x92], dx
9:5689  eb0e                 jmp 0x5699
9:568B  db 90
loc_568C:
9:568C  c45e06               les bx, ptr [bp + 6]
9:568F  6626c787900000000000 mov dword ptr es:[bx + 0x90], 0
loc_5699:
9:5699  c45e06               les bx, ptr [bp + 6]
9:569C  26c49f9000           les bx, ptr es:[bx + 0x90]
9:56A1  26c7070600           mov word ptr es:[bx], 6
9:56A6  c45e06               les bx, ptr [bp + 6]
9:56A9  26c49f9000           les bx, ptr es:[bx + 0x90]
9:56AE  268b07               mov ax, word ptr es:[bx]
9:56B1  8946fe               mov word ptr [bp - 2], ax
9:56B4  8bc8                 mov cx, ax
9:56B6  c1e002               shl ax, 2
9:56B9  03c1                 add ax, cx
9:56BB  03c0                 add ax, ax
9:56BD  050200               add ax, 2
9:56C0  50                   push ax
9:56C1  9a9c17f156           lcall 0x56f1, 0x179c  ; operator_new@s1:179C
9:56C6  83c402               add sp, 2
9:56C9  8946f6               mov word ptr [bp - 0xa], ax
9:56CC  8956f8               mov word ptr [bp - 8], dx
9:56CF  0bd0                 or dx, ax
9:56D1  7433                 je 0x5706
9:56D3  8b46fe               mov ax, word ptr [bp - 2]
9:56D6  c45ef6               les bx, ptr [bp - 0xa]
9:56D9  268907               mov word ptr es:[bx], ax
9:56DC  8d4f02               lea cx, [bx + 2]
9:56DF  06                   push es
9:56E0  51                   push cx
9:56E1  6a0a                 push 0xa
9:56E3  50                   push ax
9:56E4  68a455               push 0x55a4  ; SEGMENT s9:0000
9:56E7  6864a5               push 0xa564
9:56EA  8bf1                 mov si, cx
9:56EC  8cc7                 mov di, es
9:56EE  9a86559555           lcall 0x5595, 0x5586  ; __vec_ctor@s1:5586
9:56F3  c45e06               les bx, ptr [bp + 6]
9:56F6  26c49f9000           les bx, ptr es:[bx + 0x90]
9:56FB  26897702             mov word ptr es:[bx + 2], si
9:56FF  26897f04             mov word ptr es:[bx + 4], di
9:5703  eb12                 jmp 0x5717
9:5705  db 90
loc_5706:
9:5706  c45e06               les bx, ptr [bp + 6]
9:5709  26c49f9000           les bx, ptr es:[bx + 0x90]
9:570E  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_5717:
9:5717  668b460a             mov eax, dword ptr [bp + 0xa]
9:571B  c45e06               les bx, ptr [bp + 6]
9:571E  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5723  6626894706           mov dword ptr es:[bx + 6], eax
9:5728  c45e06               les bx, ptr [bp + 6]
9:572B  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5730  26c7470a0400         mov word ptr es:[bx + 0xa], 4
9:5736  c45e06               les bx, ptr [bp + 6]
9:5739  268b470a             mov ax, word ptr es:[bx + 0xa]
9:573D  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5742  26894712             mov word ptr es:[bx + 0x12], ax
9:5746  66ff7606             push dword ptr [bp + 6]
9:574A  90                   nop
9:574B  0e                   push cs
9:574C  e8c305               call 0x5d12  ; LabSummaryDlg::lab@s9:5D12
9:574F  8946fa               mov word ptr [bp - 6], ax
9:5752  8956fc               mov word ptr [bp - 4], dx
9:5755  0bd0                 or dx, ax
9:5757  7411                 je 0x576a
9:5759  c45efa               les bx, ptr [bp - 6]
9:575C  268b4720             mov ax, word ptr es:[bx + 0x20]
9:5760  c45e06               les bx, ptr [bp + 6]
9:5763  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:5768  eb0a                 jmp 0x5774
loc_576A:
9:576A  c45e06               les bx, ptr [bp + 6]
9:576D  26c7879a000000       mov word ptr es:[bx + 0x9a], 0
loc_5774:
9:5774  8b4606               mov ax, word ptr [bp + 6]
9:5777  8b5608               mov dx, word ptr [bp + 8]
9:577A  5e                   pop si
9:577B  5f                   pop di
9:577C  c9                   leave
9:577D  ca0a00               retf 0xa

; ---------------- LabSummaryDlg::enable@s9:5780 size=84 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem
;   (vslot 20)
9:5780  c8060000             enter 6, 0
9:5784  1e                   push ds
9:5785  68785d               push 0x5d78
9:5788  c45e06               les bx, ptr [bp + 6]
9:578B  06                   push es
9:578C  53                   push bx
9:578D  26c41f               les bx, ptr es:[bx]
9:5790  26ff5f74             lcall es:[bx + 0x74]
9:5794  6a03                 push 3
9:5796  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:579B  9aba20b257           lcall 0x57b2, 0x20ba  ; Registry_get@s3:20BA
9:57A0  c45e06               les bx, ptr [bp + 6]
9:57A3  26c49f9000           les bx, ptr es:[bx + 0x90]
9:57A8  6626ff7706           push dword ptr es:[bx + 6]
9:57AD  52                   push dx
9:57AE  50                   push ax
9:57AF  9ac0ac6753           lcall 0x5367, 0xacc0  ; isNotState4@s3:ACC0
9:57B4  0bc0                 or ax, ax
9:57B6  7417                 je 0x57cf
9:57B8  c45e06               les bx, ptr [bp + 6]
9:57BB  26ff7706             push word ptr es:[bx + 6]
9:57BF  689017               push 0x1790
9:57C2  9a3c550000           lcall 0, 0x553c  ; USER.GetDlgItem
9:57C7  50                   push ax
9:57C8  6a01                 push 1
9:57CA  9a44550000           lcall 0, 0x5544  ; USER.EnableWindow
loc_57CF:
9:57CF  c9                   leave
9:57D0  ca0400               retf 4
9:57D3  db 00

; ---------------- LabSummaryDlg::init@s9:57D4 FAR size=44 callers=0
;   (vslot 2)
9:57D4  55                   push bp
9:57D5  8bec                 mov bp, sp
9:57D7  66ff7606             push dword ptr [bp + 6]
9:57DB  90                   nop
9:57DC  0e                   push cs
9:57DD  e86205               call 0x5d42  ; LabSummaryDlg::title@s9:5D42
9:57E0  66ff7606             push dword ptr [bp + 6]
9:57E4  90                   nop
9:57E5  0e                   push cs
9:57E6  e8c106               call 0x5eaa  ; LabSummaryDlg::texts@s9:5EAA
9:57E9  66ff7606             push dword ptr [bp + 6]
9:57ED  90                   nop
9:57EE  0e                   push cs
9:57EF  e8d205               call 0x5dc4  ; LabSummaryDlg::progress@s9:5DC4
9:57F2  66ff7606             push dword ptr [bp + 6]
9:57F6  90                   nop
9:57F7  0e                   push cs
9:57F8  e8355a               call 0xb230  ; BuildingDlgBase::position@s9:B230
9:57FB  c9                   leave
9:57FC  ca0400               retf 4
9:57FF  db 00

; ---------------- LabSummaryDlg::refresh@s9:5800 FAR size=518 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.GetWindowRect, USER.InvalidateRect
;   (vslot 4)
9:5800  c8220000             enter 0x22, 0
9:5804  57                   push di
9:5805  56                   push si
9:5806  8b460e               mov ax, word ptr [bp + 0xe]
9:5809  2deb00               sub ax, 0xeb
9:580C  740a                 je 0x5818
9:580E  2d5000               sub ax, 0x50
9:5811  0f84bf01             je 0x59d4
9:5815  e9d801               jmp 0x59f0
loc_5818:
9:5818  6a03                 push 3
9:581A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:581F  9aba203a59           lcall 0x593a, 0x20ba  ; Registry_get@s3:20BA
9:5824  8946fc               mov word ptr [bp - 4], ax
9:5827  8956fe               mov word ptr [bp - 2], dx
9:582A  c45e06               les bx, ptr [bp + 6]
9:582D  66268b879000         mov eax, dword ptr es:[bx + 0x90]
9:5833  668946f8             mov dword ptr [bp - 8], eax
9:5837  660bc0               or eax, eax
9:583A  750a                 jne 0x5846
9:583C  33c0                 xor ax, ax
loc_583E:
9:583E  33d2                 xor dx, dx
9:5840  5e                   pop si
9:5841  5f                   pop di
9:5842  c9                   leave
9:5843  ca0a00               retf 0xa
loc_5846:
9:5846  6a18                 push 0x18
9:5848  9a9c17a158           lcall 0x58a1, 0x179c  ; operator_new@s1:179C
9:584D  83c402               add sp, 2
9:5850  8946ea               mov word ptr [bp - 0x16], ax
9:5853  8956ec               mov word ptr [bp - 0x14], dx
9:5856  0bd0                 or dx, ax
9:5858  740c                 je 0x5866
9:585A  ff76ec               push word ptr [bp - 0x14]
9:585D  50                   push ax
9:585E  90                   nop
9:585F  0e                   push cs
9:5860  e8354d               call 0xa598  ; ReportRow::ReportRow@s9:A598
9:5863  eb04                 jmp 0x5869
9:5865  db 90
loc_5866:
9:5866  33c0                 xor ax, ax
9:5868  99                   cdq
loc_5869:
9:5869  c45e06               les bx, ptr [bp + 6]
9:586C  2689879000           mov word ptr es:[bx + 0x90], ax
9:5871  2689979200           mov word ptr es:[bx + 0x92], dx
9:5876  c45e06               les bx, ptr [bp + 6]
9:5879  26c49f9000           les bx, ptr es:[bx + 0x90]
9:587E  26c7070600           mov word ptr es:[bx], 6
9:5883  c45e06               les bx, ptr [bp + 6]
9:5886  26c49f9000           les bx, ptr es:[bx + 0x90]
9:588B  268b07               mov ax, word ptr es:[bx]
9:588E  8946f6               mov word ptr [bp - 0xa], ax
9:5891  8bc8                 mov cx, ax
9:5893  c1e002               shl ax, 2
9:5896  03c1                 add ax, cx
9:5898  03c0                 add ax, ax
9:589A  050200               add ax, 2
9:589D  50                   push ax
9:589E  9a9c17ce58           lcall 0x58ce, 0x179c  ; operator_new@s1:179C
9:58A3  83c402               add sp, 2
9:58A6  8946ea               mov word ptr [bp - 0x16], ax
9:58A9  8956ec               mov word ptr [bp - 0x14], dx
9:58AC  0bd0                 or dx, ax
9:58AE  7432                 je 0x58e2
9:58B0  8b46f6               mov ax, word ptr [bp - 0xa]
9:58B3  c45eea               les bx, ptr [bp - 0x16]
9:58B6  268907               mov word ptr es:[bx], ax
9:58B9  8d4f02               lea cx, [bx + 2]
9:58BC  06                   push es
9:58BD  51                   push cx
9:58BE  6a0a                 push 0xa
9:58C0  50                   push ax
9:58C1  685d56               push 0x565d  ; SEGMENT s9:0000
9:58C4  6864a5               push 0xa564
9:58C7  8bf1                 mov si, cx
9:58C9  8cc7                 mov di, es
9:58CB  9a86555d59           lcall 0x595d, 0x5586  ; __vec_ctor@s1:5586
9:58D0  c45e06               les bx, ptr [bp + 6]
9:58D3  26c49f9000           les bx, ptr es:[bx + 0x90]
9:58D8  26897702             mov word ptr es:[bx + 2], si
9:58DC  26897f04             mov word ptr es:[bx + 4], di
9:58E0  eb11                 jmp 0x58f3
loc_58E2:
9:58E2  c45e06               les bx, ptr [bp + 6]
9:58E5  26c49f9000           les bx, ptr es:[bx + 0x90]
9:58EA  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_58F3:
9:58F3  c45ef8               les bx, ptr [bp - 8]
9:58F6  66268b4706           mov eax, dword ptr es:[bx + 6]
9:58FB  c45e06               les bx, ptr [bp + 6]
9:58FE  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5903  6626894706           mov dword ptr es:[bx + 6], eax
9:5908  c45e06               les bx, ptr [bp + 6]
9:590B  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5910  26c7470a0400         mov word ptr es:[bx + 0xa], 4
9:5916  c45e06               les bx, ptr [bp + 6]
9:5919  268b470a             mov ax, word ptr es:[bx + 0xa]
9:591D  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5922  26894712             mov word ptr es:[bx + 0x12], ax
9:5926  c45e06               les bx, ptr [bp + 6]
9:5929  6626ffb79000         push dword ptr es:[bx + 0x90]
9:592F  1e                   push ds
9:5930  68785d               push 0x5d78
9:5933  66ff76fc             push dword ptr [bp - 4]
9:5937  9a0ca59e57           lcall 0x579e, 0xa50c  ; Reports::resourceRow@s3:A50C
9:593C  668b46f8             mov eax, dword ptr [bp - 8]
9:5940  668946e6             mov dword ptr [bp - 0x1a], eax
9:5944  668946ea             mov dword ptr [bp - 0x16], eax
9:5948  660bc0               or eax, eax
9:594B  7415                 je 0x5962
9:594D  ff76fa               push word ptr [bp - 6]
9:5950  50                   push ax
9:5951  90                   nop
9:5952  0e                   push cs
9:5953  e87a4c               call 0xa5d0  ; ReportRow::free@s9:A5D0
9:5956  66ff76f8             push dword ptr [bp - 8]
9:595A  9ace176456           lcall 0x5664, 0x17ce  ; operator_delete@s1:17CE
9:595F  83c404               add sp, 4
loc_5962:
9:5962  c45e06               les bx, ptr [bp + 6]
9:5965  06                   push es
9:5966  53                   push bx
9:5967  26c41f               les bx, ptr es:[bx]
9:596A  26ff5f70             lcall es:[bx + 0x70]
9:596E  66ff7606             push dword ptr [bp + 6]
9:5972  90                   nop
9:5973  0e                   push cs
9:5974  e85f03               call 0x5cd6  ; LabSummaryDlg::topic@s9:5CD6
9:5977  0bc0                 or ax, ax
9:5979  7413                 je 0x598e
9:597B  66ff7606             push dword ptr [bp + 6]
9:597F  90                   nop
9:5980  0e                   push cs
9:5981  e82605               call 0x5eaa  ; LabSummaryDlg::texts@s9:5EAA
9:5984  c45e06               les bx, ptr [bp + 6]
9:5987  26c78794000000       mov word ptr es:[bx + 0x94], 0
loc_598E:
9:598E  66ff7606             push dword ptr [bp + 6]
9:5992  90                   nop
9:5993  0e                   push cs
9:5994  e82d04               call 0x5dc4  ; LabSummaryDlg::progress@s9:5DC4
9:5997  c45e06               les bx, ptr [bp + 6]
9:599A  26ff7706             push word ptr es:[bx + 6]
9:599E  8d46ee               lea ax, [bp - 0x12]
9:59A1  16                   push ss
9:59A2  50                   push ax
9:59A3  9a8f4c0000           lcall 0, 0x4c8f  ; USER.GetWindowRect
9:59A8  c45e06               les bx, ptr [bp + 6]
9:59AB  26ff7706             push word ptr es:[bx + 6]
9:59AF  666a00               push 0
9:59B2  26ffb79c00           push word ptr es:[bx + 0x9c]
9:59B7  9a57530000           lcall 0, 0x5357  ; USER.InvalidateRect
9:59BC  c45e06               les bx, ptr [bp + 6]
9:59BF  2683bf9c0000         cmp word ptr es:[bx + 0x9c], 0
9:59C5  7407                 je 0x59ce
9:59C7  26c7879c000000       mov word ptr es:[bx + 0x9c], 0
loc_59CE:
9:59CE  b80100               mov ax, 1
9:59D1  e96afe               jmp 0x583e
loc_59D4:
9:59D4  c45e06               les bx, ptr [bp + 6]
9:59D7  26ff7706             push word ptr es:[bx + 6]
9:59DB  689017               push 0x1790
9:59DE  9ac3570000           lcall 0, 0x57c3  ; USER.GetDlgItem
9:59E3  8946de               mov word ptr [bp - 0x22], ax
9:59E6  50                   push ax
9:59E7  6a01                 push 1
9:59E9  9acb570000           lcall 0, 0x57cb  ; USER.EnableWindow
9:59EE  ebde                 jmp 0x59ce
loc_59F0:
9:59F0  66ff760c             push dword ptr [bp + 0xc]
9:59F4  66ff7608             push dword ptr [bp + 8]
9:59F8  ff7606               push word ptr [bp + 6]
9:59FB  90                   nop
9:59FC  0e                   push cs
9:59FD  e84a5b               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:5A00  5e                   pop si
9:5A01  5f                   pop di
9:5A02  c9                   leave
9:5A03  ca0a00               retf 0xa

; ---------------- LabSummaryDlg::paint@s9:5A06 size=720 callers=0
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.LineTo, GDI.MoveTo, GDI.SelectObject, USER.BeginPaint, USER.EndPaint, USER.GetSystemMetrics, USER.GetWindowRect, USER.SelectPalette
;   (vslot 24) the progress bars
9:5A06  c8600000             enter 0x60, 0
9:5A0A  57                   push di
9:5A0B  56                   push si
9:5A0C  c45e06               les bx, ptr [bp + 6]
9:5A0F  26ff7706             push word ptr es:[bx + 6]
9:5A13  8d46f8               lea ax, [bp - 8]
9:5A16  16                   push ss
9:5A17  50                   push ax
9:5A18  9aa4590000           lcall 0, 0x59a4  ; USER.GetWindowRect
9:5A1D  c45e06               les bx, ptr [bp + 6]
9:5A20  26ff7706             push word ptr es:[bx + 6]
9:5A24  8d46d8               lea ax, [bp - 0x28]
9:5A27  16                   push ss
9:5A28  50                   push ax
9:5A29  9ae7210000           lcall 0, 0x21e7  ; USER.BeginPaint
9:5A2E  8946d6               mov word ptr [bp - 0x2a], ax
9:5A31  c41e3042             les bx, ptr [0x4230]
9:5A35  66268b470e           mov eax, dword ptr es:[bx + 0xe]
9:5A3A  668946d2             mov dword ptr [bp - 0x2e], eax
9:5A3E  8d46d6               lea ax, [bp - 0x2a]
9:5A41  16                   push ss
9:5A42  50                   push ax
9:5A43  66ff76d2             push dword ptr [bp - 0x2e]
9:5A47  9a084e7a5a           lcall 0x5a7a, 0x4e08  ; Palette::selectAndRealize@s2:4E08
9:5A4C  8946d0               mov word ptr [bp - 0x30], ax
9:5A4F  662bc0               sub eax, eax
9:5A52  668946cc             mov dword ptr [bp - 0x34], eax
9:5A56  c45e06               les bx, ptr [bp + 6]
9:5A59  2639879800           cmp word ptr es:[bx + 0x98], ax
9:5A5E  7479                 je 0x5ad9
9:5A60  26ffb79800           push word ptr es:[bx + 0x98]
9:5A65  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:5A6A  9a0a83af5a           lcall 0x5aaf, 0x830a  ; ResLibr::picture@s3:830A
9:5A6F  8946cc               mov word ptr [bp - 0x34], ax
9:5A72  8956ce               mov word ptr [bp - 0x32], dx
9:5A75  52                   push dx
9:5A76  50                   push ax
9:5A77  9a7247985b           lcall 0x5b98, 0x4772  ; DIB::rect@s2:4772
9:5A7C  0bd0                 or dx, ax
9:5A7E  7537                 jne 0x5ab7
9:5A80  66837ecc00           cmp dword ptr [bp - 0x34], 0
9:5A85  741e                 je 0x5aa5
9:5A87  668b46cc             mov eax, dword ptr [bp - 0x34]
9:5A8B  668946a0             mov dword ptr [bp - 0x60], eax
9:5A8F  668946a4             mov dword ptr [bp - 0x5c], eax
9:5A93  660bc0               or eax, eax
9:5A96  740d                 je 0x5aa5
9:5A98  6a01                 push 1
9:5A9A  c45ecc               les bx, ptr [bp - 0x34]
9:5A9D  06                   push es
9:5A9E  50                   push ax
9:5A9F  26c41f               les bx, ptr es:[bx]
9:5AA2  26ff1f               lcall es:[bx]
loc_5AA5:
9:5AA5  6a4d                 push 0x4d
9:5AA7  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:5AAC  9a0a830e5b           lcall 0x5b0e, 0x830a  ; ResLibr::picture@s3:830A
9:5AB1  8946cc               mov word ptr [bp - 0x34], ax
9:5AB4  8956ce               mov word ptr [bp - 0x32], dx
loc_5AB7:
9:5AB7  8d46d6               lea ax, [bp - 0x2a]
9:5ABA  16                   push ss
9:5ABB  50                   push ax
9:5ABC  66680400d701         push 0x1d70004
9:5AC2  9a225b0000           lcall 0, 0x5b22  ; USER.GetSystemMetrics
9:5AC7  2d2300               sub ax, 0x23
9:5ACA  f7d8                 neg ax
9:5ACC  50                   push ax
9:5ACD  c45ecc               les bx, ptr [bp - 0x34]
9:5AD0  06                   push es
9:5AD1  53                   push bx
9:5AD2  26c41f               les bx, ptr es:[bx]
9:5AD5  26ff5f04             lcall es:[bx + 4]
loc_5AD9:
9:5AD9  66837ecc00           cmp dword ptr [bp - 0x34], 0
9:5ADE  741e                 je 0x5afe
9:5AE0  668b46cc             mov eax, dword ptr [bp - 0x34]
9:5AE4  668946a4             mov dword ptr [bp - 0x5c], eax
9:5AE8  668946a0             mov dword ptr [bp - 0x60], eax
9:5AEC  660bc0               or eax, eax
9:5AEF  740d                 je 0x5afe
9:5AF1  6a01                 push 1
9:5AF3  c45ecc               les bx, ptr [bp - 0x34]
9:5AF6  06                   push es
9:5AF7  50                   push ax
9:5AF8  26c41f               les bx, ptr es:[bx]
9:5AFB  26ff1f               lcall es:[bx]
loc_5AFE:
9:5AFE  c45e06               les bx, ptr [bp + 6]
9:5B01  26ffb79600           push word ptr es:[bx + 0x96]
9:5B06  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:5B0B  9a0a838b5b           lcall 0x5b8b, 0x830a  ; ResLibr::picture@s3:830A
9:5B10  8946cc               mov word ptr [bp - 0x34], ax
9:5B13  8956ce               mov word ptr [bp - 0x32], dx
9:5B16  8d46d6               lea ax, [bp - 0x2a]
9:5B19  16                   push ss
9:5B1A  50                   push ax
9:5B1B  666804000d00         push 0xd0004
9:5B21  9ab95b0000           lcall 0, 0x5bb9  ; USER.GetSystemMetrics
9:5B26  2d2300               sub ax, 0x23
9:5B29  f7d8                 neg ax
9:5B2B  50                   push ax
9:5B2C  c45ecc               les bx, ptr [bp - 0x34]
9:5B2F  06                   push es
9:5B30  53                   push bx
9:5B31  26c41f               les bx, ptr es:[bx]
9:5B34  8bf3                 mov si, bx
9:5B36  8cc7                 mov di, es
9:5B38  26ff5f04             lcall es:[bx + 4]
9:5B3C  66837ecc00           cmp dword ptr [bp - 0x34], 0
9:5B41  741c                 je 0x5b5f
9:5B43  668b46cc             mov eax, dword ptr [bp - 0x34]
9:5B47  668946a0             mov dword ptr [bp - 0x60], eax
9:5B4B  668946a4             mov dword ptr [bp - 0x5c], eax
9:5B4F  660bc0               or eax, eax
9:5B52  740b                 je 0x5b5f
9:5B54  6a01                 push 1
9:5B56  ff76ce               push word ptr [bp - 0x32]
9:5B59  50                   push ax
9:5B5A  8ec7                 mov es, di
9:5B5C  26ff1c               lcall es:[si]
loc_5B5F:
9:5B5F  c746ca2500           mov word ptr [bp - 0x36], 0x25
9:5B64  666a00               push 0
9:5B67  666825000001         push 0x1000025
9:5B6D  9affff0000           lcall 0, 0xffff  ; GDI.CreatePen
9:5B72  8946c8               mov word ptr [bp - 0x38], ax
9:5B75  ff76d6               push word ptr [bp - 0x2a]
9:5B78  50                   push ax
9:5B79  9a9d5c0000           lcall 0, 0x5c9d  ; GDI.SelectObject
9:5B7E  8946c6               mov word ptr [bp - 0x3a], ax
9:5B81  6a4f                 push 0x4f
9:5B83  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:5B88  9a0a832258           lcall 0x5822, 0x830a  ; ResLibr::picture@s3:830A
9:5B8D  8946cc               mov word ptr [bp - 0x34], ax
9:5B90  8956ce               mov word ptr [bp - 0x32], dx
9:5B93  52                   push dx
9:5B94  50                   push ax
9:5B95  9a7247a855           lcall 0x55a8, 0x4772  ; DIB::rect@s2:4772
9:5B9A  8ec2                 mov es, dx
9:5B9C  8bd8                 mov bx, ax
9:5B9E  8946c2               mov word ptr [bp - 0x3e], ax
9:5BA1  8c46c4               mov word ptr [bp - 0x3c], es
9:5BA4  66268b4704           mov eax, dword ptr es:[bx + 4]
9:5BA9  668946be             mov dword ptr [bp - 0x42], eax
9:5BAD  66268b4708           mov eax, dword ptr es:[bx + 8]
9:5BB2  668946ba             mov dword ptr [bp - 0x46], eax
9:5BB6  6a04                 push 4
9:5BB8  9ac85b0000           lcall 0, 0x5bc8  ; USER.GetSystemMetrics
9:5BBD  2dc100               sub ax, 0xc1
9:5BC0  f7d8                 neg ax
9:5BC2  8946b8               mov word ptr [bp - 0x48], ax
9:5BC5  6a04                 push 4
9:5BC7  9a4b5c0000           lcall 0, 0x5c4b  ; USER.GetSystemMetrics
9:5BCC  2b46ba               sub ax, word ptr [bp - 0x46]
9:5BCF  f7d8                 neg ax
9:5BD1  05c500               add ax, 0xc5
9:5BD4  8946b6               mov word ptr [bp - 0x4a], ax
9:5BD7  ff76d6               push word ptr [bp - 0x2a]
9:5BDA  b88200               mov ax, 0x82
9:5BDD  8946b4               mov word ptr [bp - 0x4c], ax
9:5BE0  50                   push ax
9:5BE1  ff76b8               push word ptr [bp - 0x48]
9:5BE4  9affff0000           lcall 0, 0xffff  ; GDI.MoveTo
9:5BE9  ff76d6               push word ptr [bp - 0x2a]
9:5BEC  8b46be               mov ax, word ptr [bp - 0x42]
9:5BEF  8bc8                 mov cx, ax
9:5BF1  c1e002               shl ax, 2
9:5BF4  03c1                 add ax, cx
9:5BF6  03c0                 add ax, ax
9:5BF8  058500               add ax, 0x85
9:5BFB  8946b2               mov word ptr [bp - 0x4e], ax
9:5BFE  50                   push ax
9:5BFF  ff76b8               push word ptr [bp - 0x48]
9:5C02  8bf0                 mov si, ax
9:5C04  9a115c0000           lcall 0, 0x5c11  ; GDI.LineTo
9:5C09  ff76d6               push word ptr [bp - 0x2a]
9:5C0C  56                   push si
9:5C0D  ff76b6               push word ptr [bp - 0x4a]
9:5C10  9a1f5c0000           lcall 0, 0x5c1f  ; GDI.LineTo
9:5C15  ff76d6               push word ptr [bp - 0x2a]
9:5C18  688200               push 0x82
9:5C1B  ff76b6               push word ptr [bp - 0x4a]
9:5C1E  9a2d5c0000           lcall 0, 0x5c2d  ; GDI.LineTo
9:5C23  ff76d6               push word ptr [bp - 0x2a]
9:5C26  688200               push 0x82
9:5C29  ff76b8               push word ptr [bp - 0x48]
9:5C2C  9affff0000           lcall 0, 0xffff  ; GDI.LineTo
9:5C31  c746b00000           mov word ptr [bp - 0x50], 0
9:5C36  eb2c                 jmp 0x5c64
loc_5C38:
9:5C38  8d4ed6               lea cx, [bp - 0x2a]
9:5C3B  16                   push ss
9:5C3C  51                   push cx
9:5C3D  8bc8                 mov cx, ax
9:5C3F  8b46be               mov ax, word ptr [bp - 0x42]
9:5C42  f7e9                 imul cx
9:5C44  058400               add ax, 0x84
9:5C47  50                   push ax
9:5C48  6a04                 push 4
9:5C4A  9affff0000           lcall 0, 0xffff  ; USER.GetSystemMetrics
9:5C4F  2dc400               sub ax, 0xc4
9:5C52  f7d8                 neg ax
9:5C54  50                   push ax
9:5C55  c45ecc               les bx, ptr [bp - 0x34]
9:5C58  06                   push es
9:5C59  53                   push bx
9:5C5A  26c41f               les bx, ptr es:[bx]
9:5C5D  26ff5f04             lcall es:[bx + 4]
9:5C61  ff46b0               inc word ptr [bp - 0x50]
loc_5C64:
9:5C64  8b46b0               mov ax, word ptr [bp - 0x50]
9:5C67  c45e06               les bx, ptr [bp + 6]
9:5C6A  2639879400           cmp word ptr es:[bx + 0x94], ax
9:5C6F  77c7                 ja 0x5c38
9:5C71  66837ecc00           cmp dword ptr [bp - 0x34], 0
9:5C76  741e                 je 0x5c96
9:5C78  668b46cc             mov eax, dword ptr [bp - 0x34]
9:5C7C  668946a4             mov dword ptr [bp - 0x5c], eax
9:5C80  668946a0             mov dword ptr [bp - 0x60], eax
9:5C84  660bc0               or eax, eax
9:5C87  740d                 je 0x5c96
9:5C89  6a01                 push 1
9:5C8B  c45ecc               les bx, ptr [bp - 0x34]
9:5C8E  06                   push es
9:5C8F  50                   push ax
9:5C90  26c41f               les bx, ptr es:[bx]
9:5C93  26ff1f               lcall es:[bx]
loc_5C96:
9:5C96  ff76d6               push word ptr [bp - 0x2a]
9:5C99  ff76c6               push word ptr [bp - 0x3a]
9:5C9C  9a9c220000           lcall 0, 0x229c  ; GDI.SelectObject
9:5CA1  ff76c8               push word ptr [bp - 0x38]
9:5CA4  9ab85c0000           lcall 0, 0x5cb8  ; GDI.DeleteObject
9:5CA9  ff76d6               push word ptr [bp - 0x2a]
9:5CAC  ff76d0               push word ptr [bp - 0x30]
9:5CAF  6a00                 push 0
9:5CB1  9a35230000           lcall 0, 0x2335  ; USER.SelectPalette
9:5CB6  50                   push ax
9:5CB7  9a3b230000           lcall 0, 0x233b  ; GDI.DeleteObject
9:5CBC  c45e06               les bx, ptr [bp + 6]
9:5CBF  26ff7706             push word ptr es:[bx + 6]
9:5CC3  8d46d8               lea ax, [bp - 0x28]
9:5CC6  16                   push ss
9:5CC7  50                   push ax
9:5CC8  9a4c230000           lcall 0, 0x234c  ; USER.EndPaint
9:5CCD  33c0                 xor ax, ax
9:5CCF  5e                   pop si
9:5CD0  5f                   pop di
9:5CD1  c9                   leave
9:5CD2  ca0400               retf 4
9:5CD5  db 00

; ---------------- LabSummaryDlg::topic@s9:5CD6 FAR size=60 callers=1
;   the lab's topic
9:5CD6  c80a0000             enter 0xa, 0
9:5CDA  66ff7606             push dword ptr [bp + 6]
9:5CDE  90                   nop
9:5CDF  0e                   push cs
9:5CE0  e82f00               call 0x5d12  ; LabSummaryDlg::lab@s9:5D12
9:5CE3  8946fc               mov word ptr [bp - 4], ax
9:5CE6  8956fe               mov word ptr [bp - 2], dx
9:5CE9  0bd0                 or dx, ax
9:5CEB  7507                 jne 0x5cf4
loc_5CED:
9:5CED  33c0                 xor ax, ax
9:5CEF  c9                   leave
9:5CF0  ca0400               retf 4
9:5CF3  db 90
loc_5CF4:
9:5CF4  c45efc               les bx, ptr [bp - 4]
9:5CF7  268b4720             mov ax, word ptr es:[bx + 0x20]
9:5CFB  c45e06               les bx, ptr [bp + 6]
9:5CFE  2639879a00           cmp word ptr es:[bx + 0x9a], ax
9:5D03  74e8                 je 0x5ced
9:5D05  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:5D0A  b80100               mov ax, 1
9:5D0D  c9                   leave
9:5D0E  ca0400               retf 4
9:5D11  db 00

; ---------------- LabSummaryDlg::lab@s9:5D12 FAR size=48 callers=3
;   the lab object
9:5D12  c8040000             enter 4, 0
9:5D16  c45e06               les bx, ptr [bp + 6]
9:5D19  26c49f9000           les bx, ptr es:[bx + 0x90]
9:5D1E  268b4706             mov ax, word ptr es:[bx + 6]
9:5D22  268b5708             mov dx, word ptr es:[bx + 8]
9:5D26  8956fe               mov word ptr [bp - 2], dx
9:5D29  0bd0                 or dx, ax
9:5D2B  740d                 je 0x5d3a
9:5D2D  ff76fe               push word ptr [bp - 2]
9:5D30  50                   push ax
9:5D31  9aa873c431           lcall 0x31c4, 0x73a8  ; DbObj::resolveLink16@s7:73A8
9:5D36  c9                   leave
9:5D37  ca0400               retf 4
loc_5D3A:
9:5D3A  33c0                 xor ax, ax
9:5D3C  99                   cdq
9:5D3D  c9                   leave
9:5D3E  ca0400               retf 4
9:5D41  db 00

; ---------------- LabSummaryDlg::title@s9:5D42 FAR size=130 callers=1
;   the title
9:5D42  c80a0000             enter 0xa, 0
9:5D46  66ff7606             push dword ptr [bp + 6]
9:5D4A  90                   nop
9:5D4B  0e                   push cs
9:5D4C  e8c3ff               call 0x5d12  ; LabSummaryDlg::lab@s9:5D12
9:5D4F  8946fc               mov word ptr [bp - 4], ax
9:5D52  8956fe               mov word ptr [bp - 2], dx
9:5D55  0bd0                 or dx, ax
9:5D57  7466                 je 0x5dbf
9:5D59  c45efc               les bx, ptr [bp - 4]
9:5D5C  268b470c             mov ax, word ptr es:[bx + 0xc]
9:5D60  eb46                 jmp 0x5da8
loc_5D62:
9:5D62  c45e06               les bx, ptr [bp + 6]
9:5D65  26c78796005100       mov word ptr es:[bx + 0x96], 0x51
9:5D6C  c9                   leave
9:5D6D  ca0400               retf 4
loc_5D70:
9:5D70  c45e06               les bx, ptr [bp + 6]
9:5D73  26c78796005200       mov word ptr es:[bx + 0x96], 0x52
9:5D7A  c9                   leave
9:5D7B  ca0400               retf 4
loc_5D7E:
9:5D7E  c45e06               les bx, ptr [bp + 6]
9:5D81  26c78796005300       mov word ptr es:[bx + 0x96], 0x53  ; 'New failed in Op::Op->DialogCtr'
9:5D88  c9                   leave
9:5D89  ca0400               retf 4
loc_5D8C:
9:5D8C  c45e06               les bx, ptr [bp + 6]
9:5D8F  26c78796005400       mov word ptr es:[bx + 0x96], 0x54
9:5D96  c9                   leave
9:5D97  ca0400               retf 4
loc_5D9A:
9:5D9A  c45e06               les bx, ptr [bp + 6]
9:5D9D  26c78796005500       mov word ptr es:[bx + 0x96], 0x55
9:5DA4  c9                   leave
9:5DA5  ca0400               retf 4
loc_5DA8:
9:5DA8  3d5f00               cmp ax, 0x5f
9:5DAB  74d1                 je 0x5d7e
9:5DAD  7710                 ja 0x5dbf
9:5DAF  2c28                 sub al, 0x28
9:5DB1  74d9                 je 0x5d8c
9:5DB3  fec8                 dec al
9:5DB5  74e3                 je 0x5d9a
9:5DB7  2c34                 sub al, 0x34
9:5DB9  74a7                 je 0x5d62
9:5DBB  fec8                 dec al
9:5DBD  74b1                 je 0x5d70
loc_5DBF:
9:5DBF  c9                   leave
9:5DC0  ca0400               retf 4
9:5DC3  db 00

; ---------------- LabSummaryDlg::progress@s9:5DC4 FAR size=230 callers=2
;   the topic's progress
9:5DC4  c8160000             enter 0x16, 0
9:5DC8  57                   push di
9:5DC9  56                   push si
9:5DCA  6a03                 push 3
9:5DCC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:5DD1  9aba20e35d           lcall 0x5de3, 0x20ba  ; Registry_get@s3:20BA
9:5DD6  c45e06               les bx, ptr [bp + 6]
9:5DD9  26ffb79a00           push word ptr es:[bx + 0x9a]
9:5DDE  52                   push dx
9:5DDF  50                   push ax
9:5DE0  9acaa5245e           lcall 0x5e24, 0xa5ca  ; Player1::progress@s3:A5CA
9:5DE5  8946fa               mov word ptr [bp - 6], ax
9:5DE8  0bc0                 or ax, ax
9:5DEA  750f                 jne 0x5dfb
9:5DEC  c45e06               les bx, ptr [bp + 6]
9:5DEF  2689879400           mov word ptr es:[bx + 0x94], ax
9:5DF4  26c7879c000100       mov word ptr es:[bx + 0x9c], 1
loc_5DFB:
9:5DFB  837efa00             cmp word ptr [bp - 6], 0
9:5DFF  0f8ca000             jl 0x5ea3
9:5E03  66c746f600000000     mov dword ptr [bp - 0xa], 0
9:5E0B  c45e06               les bx, ptr [bp + 6]
9:5E0E  2683bf9a0072         cmp word ptr es:[bx + 0x9a], 0x72
9:5E14  7d04                 jge 0x5e1a
9:5E16  6a31                 push 0x31
9:5E18  eb02                 jmp 0x5e1c
loc_5E1A:
9:5E1A  6a41                 push 0x41
loc_5E1C:
9:5E1C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:5E21  9aba206d5a           lcall 0x5a6d, 0x20ba  ; Registry_get@s3:20BA
9:5E26  8946f6               mov word ptr [bp - 0xa], ax
9:5E29  8956f8               mov word ptr [bp - 8], dx
9:5E2C  c45e06               les bx, ptr [bp + 6]
9:5E2F  66260fbf879a00       movsx eax, word ptr es:[bx + 0x9a]
9:5E36  6650                 push eax
9:5E38  c45ef6               les bx, ptr [bp - 0xa]
9:5E3B  06                   push es
9:5E3C  53                   push bx
9:5E3D  26c41f               les bx, ptr es:[bx]
9:5E40  26ff5f14             lcall es:[bx + 0x14]
9:5E44  8946f2               mov word ptr [bp - 0xe], ax
9:5E47  8956f4               mov word ptr [bp - 0xc], dx
9:5E4A  0bd0                 or dx, ax
9:5E4C  7410                 je 0x5e5e
9:5E4E  c45ef2               les bx, ptr [bp - 0xe]
9:5E51  26c45f16             les bx, ptr es:[bx + 0x16]
9:5E55  268b4704             mov ax, word ptr es:[bx + 4]
9:5E59  8946f0               mov word ptr [bp - 0x10], ax
9:5E5C  eb05                 jmp 0x5e63
loc_5E5E:
9:5E5E  c746f00000           mov word ptr [bp - 0x10], 0
loc_5E63:
9:5E63  837ef000             cmp word ptr [bp - 0x10], 0
9:5E67  743a                 je 0x5ea3
9:5E69  837efa00             cmp word ptr [bp - 6], 0
9:5E6D  7434                 je 0x5ea3
9:5E6F  8b46f0               mov ax, word ptr [bp - 0x10]
9:5E72  8bc8                 mov cx, ax
9:5E74  2b46fa               sub ax, word ptr [bp - 6]
9:5E77  6bc064               imul ax, ax, 0x64
9:5E7A  99                   cdq
9:5E7B  f7f9                 idiv cx
9:5E7D  b90a00               mov cx, 0xa
9:5E80  8bd8                 mov bx, ax
9:5E82  2bd2                 sub dx, dx
9:5E84  f7f1                 div cx
9:5E86  c47606               les si, ptr [bp + 6]
9:5E89  8bf8                 mov di, ax
9:5E8B  2689849400           mov word ptr es:[si + 0x94], ax
9:5E90  8bc3                 mov ax, bx
9:5E92  2bd2                 sub dx, dx
9:5E94  f7f1                 div cx
9:5E96  83fa04               cmp dx, 4
9:5E99  7608                 jbe 0x5ea3
9:5E9B  8d4501               lea ax, [di + 1]
9:5E9E  2689849400           mov word ptr es:[si + 0x94], ax
loc_5EA3:
9:5EA3  5e                   pop si
9:5EA4  5f                   pop di
9:5EA5  c9                   leave
9:5EA6  ca0400               retf 4
9:5EA9  db 00

; ---------------- LabSummaryDlg::texts@s9:5EAA FAR size=1206 callers=2
;   the text lines
9:5EAA  55                   push bp
9:5EAB  8bec                 mov bp, sp
9:5EAD  c45e06               les bx, ptr [bp + 6]
9:5EB0  268b879a00           mov ax, word ptr es:[bx + 0x9a]
9:5EB5  e98e03               jmp 0x6246
loc_5EB8:
9:5EB8  c45e06               les bx, ptr [bp + 6]
9:5EBB  26c78798000000       mov word ptr es:[bx + 0x98], 0
9:5EC2  c9                   leave
9:5EC3  ca0400               retf 4
loc_5EC6:
9:5EC6  c45e06               les bx, ptr [bp + 6]
9:5EC9  26c78798000d00       mov word ptr es:[bx + 0x98], 0xd
9:5ED0  c9                   leave
9:5ED1  ca0400               retf 4
loc_5ED4:
9:5ED4  c45e06               les bx, ptr [bp + 6]
9:5ED7  26c78798000e00       mov word ptr es:[bx + 0x98], 0xe
9:5EDE  c9                   leave
9:5EDF  ca0400               retf 4
loc_5EE2:
9:5EE2  c45e06               les bx, ptr [bp + 6]
9:5EE5  26c78798001000       mov word ptr es:[bx + 0x98], 0x10
9:5EEC  c9                   leave
9:5EED  ca0400               retf 4
loc_5EF0:
9:5EF0  c45e06               les bx, ptr [bp + 6]
9:5EF3  26c78798000f00       mov word ptr es:[bx + 0x98], 0xf
9:5EFA  e95f04               jmp 0x635c
9:5EFD  db 90
loc_5EFE:
9:5EFE  c45e06               les bx, ptr [bp + 6]
9:5F01  26c78798001100       mov word ptr es:[bx + 0x98], 0x11
9:5F08  c9                   leave
9:5F09  ca0400               retf 4
loc_5F0C:
9:5F0C  c45e06               les bx, ptr [bp + 6]
9:5F0F  26c78798001200       mov word ptr es:[bx + 0x98], 0x12  ; 'version %d %d'
9:5F16  e94304               jmp 0x635c
9:5F19  db 90
loc_5F1A:
9:5F1A  c45e06               les bx, ptr [bp + 6]
9:5F1D  26c78798001300       mov word ptr es:[bx + 0x98], 0x13
9:5F24  e93504               jmp 0x635c
9:5F27  db 90
loc_5F28:
9:5F28  c45e06               les bx, ptr [bp + 6]
9:5F2B  26c78798001800       mov word ptr es:[bx + 0x98], 0x18
9:5F32  e92704               jmp 0x635c
9:5F35  db 90
loc_5F36:
9:5F36  c45e06               les bx, ptr [bp + 6]
9:5F39  26c78798001900       mov word ptr es:[bx + 0x98], 0x19
9:5F40  e91904               jmp 0x635c
9:5F43  db 90
loc_5F44:
9:5F44  c45e06               les bx, ptr [bp + 6]
9:5F47  26c78798001400       mov word ptr es:[bx + 0x98], 0x14
9:5F4E  e90b04               jmp 0x635c
9:5F51  db 90
loc_5F52:
9:5F52  c45e06               les bx, ptr [bp + 6]
9:5F55  26c78798001500       mov word ptr es:[bx + 0x98], 0x15
9:5F5C  e9fd03               jmp 0x635c
9:5F5F  db 90
loc_5F60:
9:5F60  c45e06               les bx, ptr [bp + 6]
9:5F63  26c78798001600       mov word ptr es:[bx + 0x98], 0x16
9:5F6A  e9ef03               jmp 0x635c
9:5F6D  db 90
loc_5F6E:
9:5F6E  c45e06               les bx, ptr [bp + 6]
9:5F71  26c78798001700       mov word ptr es:[bx + 0x98], 0x17
9:5F78  e9e103               jmp 0x635c
9:5F7B  db 90
loc_5F7C:
9:5F7C  c45e06               les bx, ptr [bp + 6]
9:5F7F  26c78798001a00       mov word ptr es:[bx + 0x98], 0x1a
9:5F86  e9d303               jmp 0x635c
9:5F89  db 90
loc_5F8A:
9:5F8A  c45e06               les bx, ptr [bp + 6]
9:5F8D  26c78798001b00       mov word ptr es:[bx + 0x98], 0x1b
9:5F94  e9c503               jmp 0x635c
9:5F97  db 90
loc_5F98:
9:5F98  c45e06               les bx, ptr [bp + 6]
9:5F9B  26c78798001c00       mov word ptr es:[bx + 0x98], 0x1c
9:5FA2  e9b703               jmp 0x635c
9:5FA5  db 90
loc_5FA6:
9:5FA6  c45e06               les bx, ptr [bp + 6]
9:5FA9  26c78798001d00       mov word ptr es:[bx + 0x98], 0x1d
9:5FB0  e9a903               jmp 0x635c
9:5FB3  db 90
loc_5FB4:
9:5FB4  c45e06               les bx, ptr [bp + 6]
9:5FB7  26c78798001e00       mov word ptr es:[bx + 0x98], 0x1e
9:5FBE  e99b03               jmp 0x635c
9:5FC1  db 90
loc_5FC2:
9:5FC2  c45e06               les bx, ptr [bp + 6]
9:5FC5  26c78798001f00       mov word ptr es:[bx + 0x98], 0x1f
9:5FCC  e98d03               jmp 0x635c
9:5FCF  db 90
loc_5FD0:
9:5FD0  c45e06               les bx, ptr [bp + 6]
9:5FD3  26c78798002000       mov word ptr es:[bx + 0x98], 0x20  ; 'New failed in Op::Op'
9:5FDA  e97f03               jmp 0x635c
9:5FDD  db 90
loc_5FDE:
9:5FDE  c45e06               les bx, ptr [bp + 6]
9:5FE1  26c78798002100       mov word ptr es:[bx + 0x98], 0x21
9:5FE8  e97103               jmp 0x635c
9:5FEB  db 90
loc_5FEC:
9:5FEC  c45e06               les bx, ptr [bp + 6]
9:5FEF  26c78798002200       mov word ptr es:[bx + 0x98], 0x22
9:5FF6  e96303               jmp 0x635c
9:5FF9  db 90
loc_5FFA:
9:5FFA  c45e06               les bx, ptr [bp + 6]
9:5FFD  26c78798002300       mov word ptr es:[bx + 0x98], 0x23
9:6004  e95503               jmp 0x635c
9:6007  db 90
loc_6008:
9:6008  c45e06               les bx, ptr [bp + 6]
9:600B  26c78798002400       mov word ptr es:[bx + 0x98], 0x24
9:6012  e94703               jmp 0x635c
9:6015  db 90
loc_6016:
9:6016  c45e06               les bx, ptr [bp + 6]
9:6019  26c78798002500       mov word ptr es:[bx + 0x98], 0x25
9:6020  e93903               jmp 0x635c
9:6023  db 90
loc_6024:
9:6024  c45e06               les bx, ptr [bp + 6]
9:6027  26c78798002600       mov word ptr es:[bx + 0x98], 0x26
9:602E  e92b03               jmp 0x635c
9:6031  db 90
loc_6032:
9:6032  c45e06               les bx, ptr [bp + 6]
9:6035  26c78798002700       mov word ptr es:[bx + 0x98], 0x27
9:603C  e91d03               jmp 0x635c
9:603F  db 90
loc_6040:
9:6040  c45e06               les bx, ptr [bp + 6]
9:6043  26c78798002800       mov word ptr es:[bx + 0x98], 0x28
9:604A  e90f03               jmp 0x635c
9:604D  db 90
loc_604E:
9:604E  c45e06               les bx, ptr [bp + 6]
9:6051  26c78798002900       mov word ptr es:[bx + 0x98], 0x29
9:6058  e90103               jmp 0x635c
9:605B  db 90
loc_605C:
9:605C  c45e06               les bx, ptr [bp + 6]
9:605F  26c78798004c00       mov word ptr es:[bx + 0x98], 0x4c
9:6066  e9f302               jmp 0x635c
9:6069  db 90
loc_606A:
9:606A  c45e06               les bx, ptr [bp + 6]
9:606D  26c78798002a00       mov word ptr es:[bx + 0x98], 0x2a
9:6074  e9e502               jmp 0x635c
9:6077  db 90
loc_6078:
9:6078  c45e06               les bx, ptr [bp + 6]
9:607B  26c78798002b00       mov word ptr es:[bx + 0x98], 0x2b
9:6082  e9d702               jmp 0x635c
9:6085  db 90
loc_6086:
9:6086  c45e06               les bx, ptr [bp + 6]
9:6089  26c78798002c00       mov word ptr es:[bx + 0x98], 0x2c
9:6090  e9c902               jmp 0x635c
9:6093  db 90
loc_6094:
9:6094  c45e06               les bx, ptr [bp + 6]
9:6097  26c78798002d00       mov word ptr es:[bx + 0x98], 0x2d
9:609E  e9bb02               jmp 0x635c
9:60A1  db 90
loc_60A2:
9:60A2  c45e06               les bx, ptr [bp + 6]
9:60A5  26c78798002e00       mov word ptr es:[bx + 0x98], 0x2e
9:60AC  e9ad02               jmp 0x635c
9:60AF  db 90
loc_60B0:
9:60B0  c45e06               les bx, ptr [bp + 6]
9:60B3  26c78798002f00       mov word ptr es:[bx + 0x98], 0x2f
9:60BA  e99f02               jmp 0x635c
9:60BD  db 90
loc_60BE:
9:60BE  c45e06               les bx, ptr [bp + 6]
9:60C1  26c78798003000       mov word ptr es:[bx + 0x98], 0x30
9:60C8  e99102               jmp 0x635c
9:60CB  db 90
loc_60CC:
9:60CC  c45e06               les bx, ptr [bp + 6]
9:60CF  26c78798003100       mov word ptr es:[bx + 0x98], 0x31
9:60D6  e98302               jmp 0x635c
9:60D9  db 90
loc_60DA:
9:60DA  c45e06               les bx, ptr [bp + 6]
9:60DD  26c78798003200       mov word ptr es:[bx + 0x98], 0x32
9:60E4  e97502               jmp 0x635c
9:60E7  db 90
loc_60E8:
9:60E8  c45e06               les bx, ptr [bp + 6]
9:60EB  26c78798003300       mov word ptr es:[bx + 0x98], 0x33
9:60F2  e96702               jmp 0x635c
9:60F5  db 90
loc_60F6:
9:60F6  c45e06               les bx, ptr [bp + 6]
9:60F9  26c78798003400       mov word ptr es:[bx + 0x98], 0x34
9:6100  e95902               jmp 0x635c
9:6103  db 90
loc_6104:
9:6104  c45e06               les bx, ptr [bp + 6]
9:6107  26c78798003500       mov word ptr es:[bx + 0x98], 0x35  ; 'New failed in Op::Op->ResLibr'
9:610E  e94b02               jmp 0x635c
9:6111  db 90
loc_6112:
9:6112  c45e06               les bx, ptr [bp + 6]
9:6115  26c78798003600       mov word ptr es:[bx + 0x98], 0x36
9:611C  e93d02               jmp 0x635c
9:611F  db 90
loc_6120:
9:6120  c45e06               les bx, ptr [bp + 6]
9:6123  26c78798003700       mov word ptr es:[bx + 0x98], 0x37
9:612A  e92f02               jmp 0x635c
9:612D  db 90
loc_612E:
9:612E  c45e06               les bx, ptr [bp + 6]
9:6131  26c78798003800       mov word ptr es:[bx + 0x98], 0x38
9:6138  e92102               jmp 0x635c
9:613B  db 90
loc_613C:
9:613C  c45e06               les bx, ptr [bp + 6]
9:613F  26c78798003900       mov word ptr es:[bx + 0x98], 0x39
9:6146  e91302               jmp 0x635c
9:6149  db 90
loc_614A:
9:614A  c45e06               les bx, ptr [bp + 6]
9:614D  26c78798003a00       mov word ptr es:[bx + 0x98], 0x3a
9:6154  e90502               jmp 0x635c
9:6157  db 90
loc_6158:
9:6158  c45e06               les bx, ptr [bp + 6]
9:615B  26c78798003b00       mov word ptr es:[bx + 0x98], 0x3b
9:6162  e9f701               jmp 0x635c
9:6165  db 90
loc_6166:
9:6166  c45e06               les bx, ptr [bp + 6]
9:6169  26c78798003c00       mov word ptr es:[bx + 0x98], 0x3c
9:6170  e9e901               jmp 0x635c
9:6173  db 90
loc_6174:
9:6174  c45e06               les bx, ptr [bp + 6]
9:6177  26c78798003d00       mov word ptr es:[bx + 0x98], 0x3d
9:617E  e9db01               jmp 0x635c
9:6181  db 90
loc_6182:
9:6182  c45e06               les bx, ptr [bp + 6]
9:6185  26c78798003e00       mov word ptr es:[bx + 0x98], 0x3e
9:618C  e9cd01               jmp 0x635c
9:618F  db 90
loc_6190:
9:6190  c45e06               les bx, ptr [bp + 6]
9:6193  26c78798003f00       mov word ptr es:[bx + 0x98], 0x3f
9:619A  e9bf01               jmp 0x635c
9:619D  db 90
loc_619E:
9:619E  c45e06               les bx, ptr [bp + 6]
9:61A1  26c78798004000       mov word ptr es:[bx + 0x98], 0x40
9:61A8  e9b101               jmp 0x635c
9:61AB  db 90
loc_61AC:
9:61AC  c45e06               les bx, ptr [bp + 6]
9:61AF  26c78798004100       mov word ptr es:[bx + 0x98], 0x41
9:61B6  e9a301               jmp 0x635c
9:61B9  db 90
loc_61BA:
9:61BA  c45e06               les bx, ptr [bp + 6]
9:61BD  26c78798004200       mov word ptr es:[bx + 0x98], 0x42
9:61C4  e99501               jmp 0x635c
9:61C7  db 90
loc_61C8:
9:61C8  c45e06               les bx, ptr [bp + 6]
9:61CB  26c78798004300       mov word ptr es:[bx + 0x98], 0x43
9:61D2  e98701               jmp 0x635c
9:61D5  db 90
loc_61D6:
9:61D6  c45e06               les bx, ptr [bp + 6]
9:61D9  26c78798004400       mov word ptr es:[bx + 0x98], 0x44
9:61E0  e97901               jmp 0x635c
9:61E3  db 90
loc_61E4:
9:61E4  c45e06               les bx, ptr [bp + 6]
9:61E7  26c78798004500       mov word ptr es:[bx + 0x98], 0x45
9:61EE  e96b01               jmp 0x635c
9:61F1  db 90
loc_61F2:
9:61F2  c45e06               les bx, ptr [bp + 6]
9:61F5  26c78798004600       mov word ptr es:[bx + 0x98], 0x46
9:61FC  e95d01               jmp 0x635c
9:61FF  db 90
loc_6200:
9:6200  c45e06               les bx, ptr [bp + 6]
9:6203  26c78798004700       mov word ptr es:[bx + 0x98], 0x47
9:620A  e94f01               jmp 0x635c
9:620D  db 90
loc_620E:
9:620E  c45e06               les bx, ptr [bp + 6]
9:6211  26c78798004800       mov word ptr es:[bx + 0x98], 0x48
9:6218  e94101               jmp 0x635c
9:621B  db 90
loc_621C:
9:621C  c45e06               les bx, ptr [bp + 6]
9:621F  26c78798004900       mov word ptr es:[bx + 0x98], 0x49
9:6226  e93301               jmp 0x635c
9:6229  db 90
loc_622A:
9:622A  c45e06               les bx, ptr [bp + 6]
9:622D  26c78798004a00       mov word ptr es:[bx + 0x98], 0x4a
9:6234  e92501               jmp 0x635c
9:6237  db 90
loc_6238:
9:6238  c45e06               les bx, ptr [bp + 6]
9:623B  26c78798004b00       mov word ptr es:[bx + 0x98], 0x4b
9:6242  e91701               jmp 0x635c
9:6245  db 90
loc_6246:
9:6246  3d8200               cmp ax, 0x82
9:6249  0f870f01             ja 0x635c
9:624D  03c0                 add ax, ax
9:624F  93                   xchg bx, ax
9:6250  2effa75662           jmp word ptr cs:[bx + 0x6256]
9:6255  db 90
switch_table_6256:
    dw loc_5EB8
    dw loc_5EC6
    dw loc_5EC6
    dw loc_5ED4
    dw loc_5EF0
    dw loc_5EE2
    dw loc_5EFE
    dw loc_5F0C
    dw loc_5F1A
    dw loc_5F44
    dw loc_5F44
    dw loc_5F44
    dw loc_5F28
    dw loc_5F36
    dw loc_5F6E
    dw loc_5F7C
    dw loc_5F7C
    dw loc_5F7C
    dw loc_5F8A
    dw loc_5F98
    dw loc_5FA6
    dw loc_5FB4
    dw loc_5FB4
    dw loc_5FB4
    dw loc_5FB4
    dw loc_5FB4
    dw loc_5FC2
    dw loc_5FD0
    dw loc_5FDE
    dw loc_5FDE
    dw loc_5FDE
    dw loc_5FEC
    dw loc_5FFA
    dw loc_6008
    dw loc_6016
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6024
    dw loc_6032
    dw loc_6040
    dw loc_604E
    dw loc_604E
    dw loc_604E
    dw loc_604E
    dw loc_606A
    dw loc_606A
    dw loc_606A
    dw loc_606A
    dw loc_6078
    dw loc_6086
    dw loc_6086
    dw loc_6086
    dw loc_6094
    dw loc_60A2
    dw loc_60A2
    dw loc_60B0
    dw loc_60BE
    dw loc_60CC
    dw loc_60DA
    dw loc_60E8
    dw loc_60F6
    dw loc_6104
    dw loc_6112
    dw loc_6120
    dw loc_612E
    dw loc_613C
    dw loc_614A
    dw loc_614A
    dw loc_614A
    dw loc_5EF0
    dw loc_6158
    dw loc_606A
    dw loc_6166
    dw loc_6174
    dw loc_6174
    dw loc_6182
    dw loc_6182
    dw loc_6182
    dw loc_6182
    dw loc_6182
    dw loc_6190
    dw loc_6190
    dw loc_6190
    dw loc_6190
    dw loc_6190
    dw loc_619E
    dw loc_61AC
    dw loc_61AC
    dw loc_61AC
    dw loc_61BA
    dw loc_61BA
    dw loc_61BA
    dw loc_61C8
    dw loc_61C8
    dw loc_61C8
    dw loc_61C8
    dw loc_61C8
    dw loc_61D6
    dw loc_61D6
    dw loc_61E4
    dw loc_61F2
    dw loc_6200
    dw loc_620E
    dw loc_621C
    dw loc_622A
    dw loc_6238
    dw loc_5EB8
    dw loc_5EB8
    dw loc_635C
    dw loc_635C
    dw loc_5F52
    dw loc_5F60
    dw loc_5F6E
    dw loc_635C
    dw loc_605C
    dw loc_635C
    dw loc_605C
    dw loc_605C
    dw loc_605C
    dw loc_605C
    dw loc_605C
    dw loc_605C
    dw loc_605C
    dw loc_605C
    dw loc_605C
loc_635C:
9:635C  c9                   leave
9:635D  ca0400               retf 4

; ---------------- LabSummaryDlg::scalar_dtor@s9:6360 size=162 callers=0
;   deleting destructor
9:6360  c8040000             enter 4, 0
9:6364  66ff7606             push dword ptr [bp + 6]
9:6368  90                   nop
9:6369  0e                   push cs
9:636A  e88b4d               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:636D  f6460a01             test byte ptr [bp + 0xa], 1
9:6371  7409                 je 0x637c
9:6373  66ff7606             push dword ptr [bp + 6]
9:6377  9ace174b58           lcall 0x584b, 0x17ce  ; operator_delete@s1:17CE
loc_637C:
9:637C  8b4606               mov ax, word ptr [bp + 6]
9:637F  8b5608               mov dx, word ptr [bp + 8]
9:6382  c9                   leave
9:6383  ca0600               retf 6
9:6386  db 60 63 90 63 10 3a 4a 5a d4 57 94 63 16 b3 98 63
9:6396  db 00 58 9c 63 26 b7 a0 63 56 7f a4 63 b2 7b a8 63
9:63A6  db 1c 7f b0 63 48 88 00 64 86 7f b4 63 0c 80 b8 63
9:63B6  db 54 80 bc 63 72 b3 c0 63 58 81 c4 63 b6 81 c8 63
9:63C6  db fe 81 d0 63 ea 60 dc 63 4a 82 d4 63 66 82 d8 63
9:63D6  db 80 57 e4 63 ee 60 e0 63 f4 60 ec 63 c8 b4 e8 63
9:63E6  db 06 5a f0 63 fe 60 e8 55 7e 80 f4 63 3c b4 f8 63
9:63F6  db 5e b4 fc 63 7c b1 c2 58 4c 88 1c 56

; ---------------- MacroDlg::MacroDlg@s9:6402 FAR size=110 callers=1
;   dialog 6224 "Macromanagement Functions" (vtable 67BA)
9:6402  55                   push bp
9:6403  8bec                 mov bp, sp
9:6405  ff760a               push word ptr [bp + 0xa]
9:6408  666800005018         push 0x18500000
9:640E  666a01               push 1
9:6411  66ff7606             push dword ptr [bp + 6]
9:6415  90                   nop
9:6416  0e                   push cs
9:6417  e80e13               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:641A  c45e06               les bx, ptr [bp + 6]
9:641D  662bc0               sub eax, eax
9:6420  662689878e00         mov dword ptr es:[bx + 0x8e], eax
9:6426  662689879200         mov dword ptr es:[bx + 0x92], eax
9:642C  26c707ba67           mov word ptr es:[bx], 0x67ba
9:6431  26c747028863         mov word ptr es:[bx + 2], 0x6388  ; SEGMENT s9:0000
9:6437  6a2b                 push 0x2b
9:6439  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:643E  9aba20d45d           lcall 0x5dd4, 0x20ba  ; Registry_get@s3:20BA
9:6443  c45e06               les bx, ptr [bp + 6]
9:6446  2689879200           mov word ptr es:[bx + 0x92], ax
9:644B  2689979400           mov word ptr es:[bx + 0x94], dx
9:6450  06                   push es
9:6451  53                   push bx
9:6452  6a00                 push 0
9:6454  52                   push dx
9:6455  26ffb79200           push word ptr es:[bx + 0x92]
9:645A  26c49f9200           les bx, ptr es:[bx + 0x92]
9:645F  26c41f               les bx, ptr es:[bx]
9:6462  26ff5f04             lcall es:[bx + 4]
9:6466  8b4606               mov ax, word ptr [bp + 6]
9:6469  8b5608               mov dx, word ptr [bp + 8]
9:646C  c9                   leave
9:646D  ca0600               retf 6

; ---------------- MacroDlg::~MacroDlg@s9:6470 FAR size=90 callers=1
;   dtor
9:6470  c8080000             enter 8, 0
9:6474  c45e06               les bx, ptr [bp + 6]
9:6477  26c707ba67           mov word ptr es:[bx], 0x67ba
9:647C  26c747023564         mov word ptr es:[bx + 2], 0x6435  ; SEGMENT s9:0000
9:6482  662683bf920000       cmp dword ptr es:[bx + 0x92], 0
9:6489  740d                 je 0x6498
9:648B  06                   push es
9:648C  53                   push bx
9:648D  6626ffb79200         push dword ptr es:[bx + 0x92]
9:6493  9aa61e4164           lcall 0x6441, 0x1ea6  ; RegObj::removeListener@s3:1EA6
loc_6498:
9:6498  c45e06               les bx, ptr [bp + 6]
9:649B  26ff7706             push word ptr es:[bx + 6]
9:649F  66ff367c5b           push dword ptr [0x5b7c]
9:64A4  9ae0b6ac63           lcall 0x63ac, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:64A9  c45e06               les bx, ptr [bp + 6]
9:64AC  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
9:64B2  6650                 push eax
9:64B4  9ace177a63           lcall 0x637a, 0x17ce  ; operator_delete@s1:17CE
9:64B9  83c404               add sp, 4
9:64BC  66ff7606             push dword ptr [bp + 6]
9:64C0  90                   nop
9:64C1  0e                   push cs
9:64C2  e86713               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:64C5  c9                   leave
9:64C6  ca0400               retf 4
9:64C9  db 00

; ---------------- MacroDlg::message@s9:64CA FAR size=240 callers=1
;   apis: USER.MessageBox
;   a message box
9:64CA  c8100200             enter 0x210, 0
9:64CE  680010               push 0x1000
9:64D1  9a9c173065           lcall 0x6530, 0x179c  ; operator_new@s1:179C
9:64D6  83c402               add sp, 2
9:64D9  8986f8fd             mov word ptr [bp - 0x208], ax
9:64DD  8996fafd             mov word ptr [bp - 0x206], dx
9:64E1  687b05               push 0x57b
9:64E4  8d86fcfd             lea ax, [bp - 0x204]
9:64E8  16                   push ss
9:64E9  50                   push ax
9:64EA  680001               push 0x100
9:64ED  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:64F2  9ae0840a65           lcall 0x650a, 0x84e0  ; LoadStringTo@s3:84E0
9:64F7  68ff07               push 0x7ff
9:64FA  66ffb6f8fd           push dword ptr [bp - 0x208]
9:64FF  68ff03               push 0x3ff
9:6502  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:6507  9ae0842065           lcall 0x6520, 0x84e0  ; LoadStringTo@s3:84E0
9:650C  680008               push 0x800
9:650F  8d86fefe             lea ax, [bp - 0x102]
9:6513  16                   push ss
9:6514  50                   push ax
9:6515  68ff03               push 0x3ff
9:6518  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:651D  9ae0844965           lcall 0x6549, 0x84e0  ; LoadStringTo@s3:84E0
9:6522  8d86fefe             lea ax, [bp - 0x102]
9:6526  16                   push ss
9:6527  50                   push ax
9:6528  66ffb6f8fd           push dword ptr [bp - 0x208]
9:652D  9aea3c5965           lcall 0x6559, 0x3cea  ; _fstrcat@s1:3CEA
9:6532  83c408               add sp, 8
9:6535  680108               push 0x801
9:6538  8d86fefe             lea ax, [bp - 0x102]
9:653C  16                   push ss
9:653D  50                   push ax
9:653E  68ff03               push 0x3ff
9:6541  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:6546  9ae0847265           lcall 0x6572, 0x84e0  ; LoadStringTo@s3:84E0
9:654B  8d86fefe             lea ax, [bp - 0x102]
9:654F  16                   push ss
9:6550  50                   push ax
9:6551  66ffb6f8fd           push dword ptr [bp - 0x208]
9:6556  9aea3c8265           lcall 0x6582, 0x3cea  ; _fstrcat@s1:3CEA
9:655B  83c408               add sp, 8
9:655E  680208               push 0x802
9:6561  8d86fefe             lea ax, [bp - 0x102]
9:6565  16                   push ss
9:6566  50                   push ax
9:6567  68ff03               push 0x3ff
9:656A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:656F  9ae0849664           lcall 0x6496, 0x84e0  ; LoadStringTo@s3:84E0
9:6574  8d86fefe             lea ax, [bp - 0x102]
9:6578  16                   push ss
9:6579  50                   push ax
9:657A  66ffb6f8fd           push dword ptr [bp - 0x208]
9:657F  9aea3cb465           lcall 0x65b4, 0x3cea  ; _fstrcat@s1:3CEA
9:6584  83c408               add sp, 8
9:6587  c45e06               les bx, ptr [bp + 6]
9:658A  26ff7706             push word ptr es:[bx + 6]
9:658E  66ffb6f8fd           push dword ptr [bp - 0x208]
9:6593  8d86fcfd             lea ax, [bp - 0x204]
9:6597  16                   push ss
9:6598  50                   push ax
9:6599  6a00                 push 0
9:659B  9aa4380000           lcall 0, 0x38a4  ; USER.MessageBox
9:65A0  668b86f8fd           mov eax, dword ptr [bp - 0x208]
9:65A5  668986f4fd           mov dword ptr [bp - 0x20c], eax
9:65AA  668986f0fd           mov dword ptr [bp - 0x210], eax
9:65AF  6650                 push eax
9:65B1  9ace17b764           lcall 0x64b7, 0x17ce  ; operator_delete@s1:17CE
9:65B6  c9                   leave
9:65B7  ca0400               retf 4

; ---------------- MacroDlg::init@s9:65BA size=372 callers=0
;   apis: USER.MapDialogRect, USER.ShowWindow
;   (vslot 2) the functions by the alerts
9:65BA  c8240000             enter 0x24, 0
9:65BE  57                   push di
9:65BF  56                   push si
9:65C0  66ff7606             push dword ptr [bp + 6]
9:65C4  90                   nop
9:65C5  0e                   push cs
9:65C6  e81913               call 0x78e2  ; OPDialog::create@s9:78E2
9:65C9  6a2b                 push 0x2b
9:65CB  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:65D0  9aba20e065           lcall 0x65e0, 0x20ba  ; Registry_get@s3:20BA
9:65D5  8946fc               mov word ptr [bp - 4], ax
9:65D8  8956fe               mov word ptr [bp - 2], dx
9:65DB  52                   push dx
9:65DC  50                   push ax
9:65DD  9a98088466           lcall 0x6684, 0x898  ; Alerts::count3c@s3:0898
9:65E2  8946fa               mov word ptr [bp - 6], ax
9:65E5  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
9:65EB  7409                 je 0x65f6
9:65ED  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
9:65F0  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
9:65F4  eb05                 jmp 0x65fb
loc_65F6:
9:65F6  9a0a161466           lcall 0x6614, 0x160a  ; SH_DefaultPool@s1:160A
loc_65FB:
9:65FB  8946e8               mov word ptr [bp - 0x18], ax
9:65FE  8956ea               mov word ptr [bp - 0x16], dx
9:6601  52                   push dx
9:6602  50                   push ax
9:6603  6a01                 push 1
9:6605  8b46fa               mov ax, word ptr [bp - 6]
9:6608  050200               add ax, 2
9:660B  c1e002               shl ax, 2
9:660E  6a00                 push 0
9:6610  50                   push ax
9:6611  9a0817bc66           lcall 0x66bc, 0x1708  ; SH_MemAllocPtr@s1:1708
9:6616  83c40a               add sp, 0xa
9:6619  c45e06               les bx, ptr [bp + 6]
9:661C  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:6621  2689979000           mov word ptr es:[bx + 0x90], dx
9:6626  c746f80100           mov word ptr [bp - 8], 1
9:662B  eb43                 jmp 0x6670
9:662D  db 90
loc_662E:
9:662E  c45e06               les bx, ptr [bp + 6]
9:6631  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:6636  8b76f8               mov si, word ptr [bp - 8]
9:6639  c1e602               shl si, 2
9:663C  6626c70000000000     mov dword ptr es:[bx + si], 0
loc_6644:
9:6644  c45e06               les bx, ptr [bp + 6]
9:6647  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:664C  8b76f8               mov si, word ptr [bp - 8]
9:664F  c1e602               shl si, 2
9:6652  6626833800           cmp dword ptr es:[bx + si], 0
9:6657  7414                 je 0x666d
9:6659  8cc0                 mov ax, es
9:665B  c47ee8               les di, ptr [bp - 0x18]
9:665E  26ff7506             push word ptr es:[di + 6]
9:6662  8ec0                 mov es, ax
9:6664  6626ff30             push dword ptr es:[bx + si]
9:6668  90                   nop
9:6669  0e                   push cs
9:666A  e8c72b               call 0x9234  ; OPCtrl::enable@s9:9234
loc_666D:
9:666D  ff46f8               inc word ptr [bp - 8]
loc_6670:
9:6670  8b46fa               mov ax, word ptr [bp - 6]
9:6673  3946f8               cmp word ptr [bp - 8], ax
9:6676  0f8f9400             jg 0x670e
9:667A  ff76f8               push word ptr [bp - 8]
9:667D  66ff76fc             push dword ptr [bp - 4]
9:6681  9a4609f564           lcall 0x64f5, 0x946  ; Alerts::tradeAlerts@s3:0946
9:6686  8ec2                 mov es, dx
9:6688  8bd8                 mov bx, ax
9:668A  8946e8               mov word ptr [bp - 0x18], ax
9:668D  8c46ea               mov word ptr [bp - 0x16], es
9:6690  268b07               mov ax, word ptr es:[bx]
9:6693  8946e0               mov word ptr [bp - 0x20], ax
9:6696  268b4702             mov ax, word ptr es:[bx + 2]
9:669A  8946e2               mov word ptr [bp - 0x1e], ax
9:669D  b80100               mov ax, 1
9:66A0  8946e4               mov word ptr [bp - 0x1c], ax
9:66A3  8946e6               mov word ptr [bp - 0x1a], ax
9:66A6  c45e06               les bx, ptr [bp + 6]
9:66A9  26ff7706             push word ptr es:[bx + 6]
9:66AD  8d46e0               lea ax, [bp - 0x20]
9:66B0  16                   push ss
9:66B1  50                   push ax
9:66B2  9a642b0000           lcall 0, 0x2b64  ; USER.MapDialogRect
9:66B7  6a42                 push 0x42
9:66B9  9a9c17d464           lcall 0x64d4, 0x179c  ; operator_new@s1:179C
9:66BE  83c402               add sp, 2
9:66C1  8946dc               mov word ptr [bp - 0x24], ax
9:66C4  8956de               mov word ptr [bp - 0x22], dx
9:66C7  0bd0                 or dx, ax
9:66C9  0f8461ff             je 0x662e
9:66CD  c45e06               les bx, ptr [bp + 6]
9:66D0  26ff7706             push word ptr es:[bx + 6]
9:66D4  c45ee8               les bx, ptr [bp - 0x18]
9:66D7  26ff7704             push word ptr es:[bx + 4]
9:66DB  66680001ff00         push 0xff0100
9:66E1  680101               push 0x101
9:66E4  ff76e0               push word ptr [bp - 0x20]
9:66E7  ff76e2               push word ptr [bp - 0x1e]
9:66EA  6a00                 push 0
9:66EC  ff76de               push word ptr [bp - 0x22]
9:66EF  50                   push ax
9:66F0  9ad63b8c63           lcall 0x638c, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:66F5  c45e06               les bx, ptr [bp + 6]
9:66F8  26c49f8e00           les bx, ptr es:[bx + 0x8e]
9:66FD  8b76f8               mov si, word ptr [bp - 8]
9:6700  c1e602               shl si, 2
9:6703  268900               mov word ptr es:[bx + si], ax
9:6706  26895002             mov word ptr es:[bx + si + 2], dx
9:670A  e937ff               jmp 0x6644
9:670D  db 90
loc_670E:
9:670E  666aff               push -1
9:6711  66ff7606             push dword ptr [bp + 6]
9:6715  90                   nop
9:6716  0e                   push cs
9:6717  e8521b               call 0x826c  ; OPDialog::position@s9:826C
9:671A  c45e06               les bx, ptr [bp + 6]
9:671D  26ff7706             push word ptr es:[bx + 6]
9:6721  6a05                 push 5
9:6723  9aea540000           lcall 0, 0x54ea  ; USER.ShowWindow
9:6728  5e                   pop si
9:6729  5f                   pop di
9:672A  c9                   leave
9:672B  ca0400               retf 4

; ---------------- MacroDlg::onCommand@s9:672E FAR size=102 callers=0
;   apis: USER.PostMessage
;   (vslot 4)
9:672E  55                   push bp
9:672F  8bec                 mov bp, sp
9:6731  8b460e               mov ax, word ptr [bp + 0xe]
9:6734  2d4118               sub ax, 0x1841
9:6737  744b                 je 0x6784
9:6739  2d1000               sub ax, 0x10
9:673C  7418                 je 0x6756
9:673E  48                   dec ax
9:673F  743f                 je 0x6780
9:6741  66ff760c             push dword ptr [bp + 0xc]
9:6745  66ff7608             push dword ptr [bp + 8]
9:6749  ff7606               push word ptr [bp + 6]
9:674C  90                   nop
9:674D  0e                   push cs
9:674E  e8eb13               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:6751  c9                   leave
9:6752  ca0a00               retf 0xa
9:6755  db 90
loc_6756:
9:6756  6a2a                 push 0x2a
loc_6758:
9:6758  c45e06               les bx, ptr [bp + 6]
9:675B  26ff7708             push word ptr es:[bx + 8]
9:675F  66ff367c5b           push dword ptr [0x5b7c]
9:6764  9a40afa764           lcall 0x64a7, 0xaf40  ; DialogCtr::open@s8:AF40
9:6769  c45e06               les bx, ptr [bp + 6]
9:676C  26ff7706             push word ptr es:[bx + 6]
9:6770  666802001101         push 0x1110002
9:6776  666a00               push 0
9:6779  9ab3430000           lcall 0, 0x43b3  ; USER.PostMessage
9:677E  eb0d                 jmp 0x678d
loc_6780:
9:6780  6a29                 push 0x29
9:6782  ebd4                 jmp 0x6758
loc_6784:
9:6784  66ff7606             push dword ptr [bp + 6]
9:6788  90                   nop
9:6789  0e                   push cs
9:678A  e83dfd               call 0x64ca  ; MacroDlg::message@s9:64CA
loc_678D:
9:678D  33c0                 xor ax, ax
9:678F  99                   cdq
9:6790  c9                   leave
9:6791  ca0a00               retf 0xa

; ---------------- MacroDlg::scalar_dtor@s9:6794 FAR size=146 callers=0
;   deleting destructor
9:6794  55                   push bp
9:6795  8bec                 mov bp, sp
9:6797  66ff7606             push dword ptr [bp + 6]
9:679B  90                   nop
9:679C  0e                   push cs
9:679D  e8d0fc               call 0x6470  ; MacroDlg::~MacroDlg@s9:6470
9:67A0  f6460a01             test byte ptr [bp + 0xa], 1
9:67A4  7409                 je 0x67af
9:67A6  66ff7606             push dword ptr [bp + 6]
9:67AA  9ace17f965           lcall 0x65f9, 0x17ce  ; operator_delete@s1:17CE
loc_67AF:
9:67AF  8b4606               mov ax, word ptr [bp + 6]
9:67B2  8b5608               mov dx, word ptr [bp + 8]
9:67B5  c9                   leave
9:67B6  ca0600               retf 6
9:67B9  db 90 94 67 c4 67 10 3a f3 66 ba 65 c8 67 c0 79 cc
9:67C9  db 67 2e 67 d0 67 98 7b d4 67 56 7f d8 67 b2 7b dc
9:67D9  db 67 1c 7f e0 67 12 82 e4 67 86 7f e8 67 0c 80 ec
9:67E9  db 67 54 80 f0 67 5e 7e f4 67 58 81 f8 67 b6 81 fc
9:67F9  db 67 fe 81 04 68 ea 60 10 68 4a 82 08 68 66 82 0c
9:6809  db 68 de 78 24 68 ee 60 14 68 f4 60 18 68 fa 60 20
9:6819  db 68 a4 a2 67 67 fe 60 cc 63 7e 80 80 64

; ---------------- ResearchTreeDlg::ResearchTreeDlg@s9:6826 FAR size=60 callers=1
;   dialog 4058: a research tree window (vtable 6F32)
9:6826  55                   push bp
9:6827  8bec                 mov bp, sp
9:6829  ff760a               push word ptr [bp + 0xa]
9:682C  66680000da0f         push 0xfda0000
9:6832  6a00                 push 0
9:6834  66ff7606             push dword ptr [bp + 6]
9:6838  90                   nop
9:6839  0e                   push cs
9:683A  e87f48               call 0xb0bc  ; ObjectDlgBase::ObjectDlgBase@s9:B0BC
9:683D  c45e06               les bx, ptr [bp + 6]
9:6840  662bc0               sub eax, eax
9:6843  662689879400         mov dword ptr es:[bx + 0x94], eax
9:6849  662689879800         mov dword ptr es:[bx + 0x98], eax
9:684F  26c707326f           mov word ptr es:[bx], 0x6f32
9:6854  26c74702bc67         mov word ptr es:[bx + 2], 0x67bc  ; SEGMENT s9:0000
9:685A  8bc3                 mov ax, bx
9:685C  8cc2                 mov dx, es
9:685E  c9                   leave
9:685F  ca0600               retf 6

; ---------------- ResearchTreeDlg::~ResearchTreeDlg@s9:6862 FAR size=30 callers=1
;   dtor
9:6862  55                   push bp
9:6863  8bec                 mov bp, sp
9:6865  c45e06               les bx, ptr [bp + 6]
9:6868  26c707326f           mov word ptr es:[bx], 0x6f32
9:686D  26c747025868         mov word ptr es:[bx + 2], 0x6858  ; SEGMENT s9:0000
9:6873  66ff7606             push dword ptr [bp + 6]
9:6877  90                   nop
9:6878  0e                   push cs
9:6879  e87c48               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:687C  c9                   leave
9:687D  ca0400               retf 4

; ---------------- ResearchTreeDlg::onNotify@s9:6880 size=82 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem
;   (vslot 1)
9:6880  c80a0000             enter 0xa, 0
9:6884  8b460a               mov ax, word ptr [bp + 0xa]
9:6887  2d0800               sub ax, 8
9:688A  7542                 jne 0x68ce
9:688C  c45e06               les bx, ptr [bp + 6]
9:688F  26ff7706             push word ptr es:[bx + 6]
9:6893  680701               push 0x107
9:6896  9ab8680000           lcall 0, 0x68b8  ; USER.GetDlgItem
9:689B  50                   push ax
9:689C  c45e06               les bx, ptr [bp + 6]
9:689F  26c49f9400           les bx, ptr es:[bx + 0x94]
9:68A4  26ff7724             push word ptr es:[bx + 0x24]
9:68A8  9aca680000           lcall 0, 0x68ca  ; USER.EnableWindow
9:68AD  c45e06               les bx, ptr [bp + 6]
9:68B0  26ff7706             push word ptr es:[bx + 6]
9:68B4  680801               push 0x108
9:68B7  9adf590000           lcall 0, 0x59df  ; USER.GetDlgItem
9:68BC  50                   push ax
9:68BD  c45e06               les bx, ptr [bp + 6]
9:68C0  26c49f9400           les bx, ptr es:[bx + 0x94]
9:68C5  26ff7726             push word ptr es:[bx + 0x26]
9:68C9  9aea590000           lcall 0, 0x59ea  ; USER.EnableWindow
loc_68CE:
9:68CE  c9                   leave
9:68CF  ca0600               retf 6

; ---------------- ResearchTreeDlg::dlgProc@s9:68D2 FAR size=92 callers=0
;   (vslot 3)
9:68D2  55                   push bp
9:68D3  8bec                 mov bp, sp
9:68D5  8b4610               mov ax, word ptr [bp + 0x10]
9:68D8  2d2b00               sub ax, 0x2b
9:68DB  741b                 je 0x68f8
9:68DD  2de600               sub ax, 0xe6
9:68E0  7430                 je 0x6912
9:68E2  66ff760e             push dword ptr [bp + 0xe]
9:68E6  66ff760a             push dword ptr [bp + 0xa]
9:68EA  66ff7606             push dword ptr [bp + 6]
9:68EE  90                   nop
9:68EF  0e                   push cs
9:68F0  e8234a               call 0xb316  ; BuildingDlgBase::dlgProc@s9:B316
9:68F3  c9                   leave
9:68F4  ca0c00               retf 0xc
9:68F7  db 90
loc_68F8:
9:68F8  8b4e0c               mov cx, word ptr [bp + 0xc]
9:68FB  8b5e0a               mov bx, word ptr [bp + 0xa]
9:68FE  8ec1                 mov es, cx
9:6900  26833f04             cmp word ptr es:[bx], 4
9:6904  7520                 jne 0x6926
9:6906  51                   push cx
9:6907  53                   push bx
9:6908  90                   nop
9:6909  0e                   push cs
9:690A  e8592c               call 0x9566  ; objectFromHwnd@s9:9566
9:690D  8be5                 mov sp, bp
9:690F  eb15                 jmp 0x6926
9:6911  db 90
loc_6912:
9:6912  66ff760c             push dword ptr [bp + 0xc]
9:6916  ff760a               push word ptr [bp + 0xa]
9:6919  c45e06               les bx, ptr [bp + 6]
9:691C  06                   push es
9:691D  53                   push bx
9:691E  26c41f               les bx, ptr es:[bx]
9:6921  26ff9f8000           lcall es:[bx + 0x80]
loc_6926:
9:6926  b80100               mov ax, 1
9:6929  c9                   leave
9:692A  ca0c00               retf 0xc
9:692D  db 00

; ---------------- ResearchTreeDlg::refresh@s9:692E FAR size=20 callers=0
;   (vslot 9)
9:692E  55                   push bp
9:692F  8bec                 mov bp, sp
9:6931  c45e06               les bx, ptr [bp + 6]
9:6934  06                   push es
9:6935  53                   push bx
9:6936  26c41f               les bx, ptr es:[bx]
9:6939  26ff5f7c             lcall es:[bx + 0x7c]
9:693D  c9                   leave
9:693E  ca0400               retf 4
9:6941  db 00

; ---------------- ResearchTreeDlg::init@s9:6942 FAR size=874 callers=0
;   apis: GDI.GetTextExtent, USER.CreateWindow, USER.GetDC, USER.PostMessage, USER.ReleaseDC, USER.SendMessage, USER.SetWindowPos
;   (vslot 2) static texts and tree buttons
9:6942  c8740000             enter 0x74, 0
9:6946  66ff7606             push dword ptr [bp + 6]
9:694A  90                   nop
9:694B  0e                   push cs
9:694C  e8930f               call 0x78e2  ; OPDialog::create@s9:78E2
9:694F  6a33                 push 0x33
9:6951  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:6956  9aba20fb6a           lcall 0x6afb, 0x20ba  ; Registry_get@s3:20BA
9:695B  c45e06               les bx, ptr [bp + 6]
9:695E  2689879400           mov word ptr es:[bx + 0x94], ax
9:6963  2689979600           mov word ptr es:[bx + 0x96], dx
9:6968  06                   push es
9:6969  53                   push bx
9:696A  6a00                 push 0
9:696C  52                   push dx
9:696D  26ffb79400           push word ptr es:[bx + 0x94]
9:6972  26c49f9400           les bx, ptr es:[bx + 0x94]
9:6977  26c41f               les bx, ptr es:[bx]
9:697A  26ff5f04             lcall es:[bx + 4]
9:697E  6a0a                 push 0xa
9:6980  9a9c17d869           lcall 0x69d8, 0x179c  ; operator_new@s1:179C
9:6985  83c402               add sp, 2
9:6988  894694               mov word ptr [bp - 0x6c], ax
9:698B  895696               mov word ptr [bp - 0x6a], dx
9:698E  0bd0                 or dx, ax
9:6990  7420                 je 0x69b2
9:6992  c45e06               les bx, ptr [bp + 6]
9:6995  26ff7706             push word ptr es:[bx + 6]
9:6999  ff7696               push word ptr [bp - 0x6a]
9:699C  50                   push ax
9:699D  90                   nop
9:699E  0e                   push cs
9:699F  e89c55               call 0xbf3e  ; TreeView::TreeView@s9:BF3E
9:69A2  c45e06               les bx, ptr [bp + 6]
9:69A5  2689879800           mov word ptr es:[bx + 0x98], ax
9:69AA  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:69AF  eb0e                 jmp 0x69bf
9:69B1  db 90
loc_69B2:
9:69B2  c45e06               les bx, ptr [bp + 6]
9:69B5  6626c787980000000000 mov dword ptr es:[bx + 0x98], 0
loc_69BF:
9:69BF  c45e06               les bx, ptr [bp + 6]
9:69C2  6626ffb79400         push dword ptr es:[bx + 0x94]
9:69C8  6626ffb79800         push dword ptr es:[bx + 0x98]
9:69CE  90                   nop
9:69CF  0e                   push cs
9:69D0  e80b56               call 0xbfde  ; TreeView::attach@s9:BFDE
9:69D3  6a42                 push 0x42
9:69D5  9a9c17106a           lcall 0x6a10, 0x179c  ; operator_new@s1:179C
9:69DA  83c402               add sp, 2
9:69DD  894694               mov word ptr [bp - 0x6c], ax
9:69E0  895696               mov word ptr [bp - 0x6a], dx
9:69E3  0bd0                 or dx, ax
9:69E5  7424                 je 0x6a0b
9:69E7  c45e06               les bx, ptr [bp + 6]
9:69EA  26ff7706             push word ptr es:[bx + 6]
9:69EE  666880000a01         push 0x10a0080
9:69F4  666800008100         push 0x810000
9:69FA  66680a000a00         push 0xa000a
9:6A00  6a01                 push 1
9:6A02  ff7696               push word ptr [bp - 0x6a]
9:6A05  50                   push ax
9:6A06  9ad63b416a           lcall 0x6a41, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_6A0B:
9:6A0B  6a42                 push 0x42
9:6A0D  9a9c17496a           lcall 0x6a49, 0x179c  ; operator_new@s1:179C
9:6A12  83c402               add sp, 2
9:6A15  894694               mov word ptr [bp - 0x6c], ax
9:6A18  895696               mov word ptr [bp - 0x6a], dx
9:6A1B  0bd0                 or dx, ax
9:6A1D  7424                 je 0x6a43
9:6A1F  c45e06               les bx, ptr [bp + 6]
9:6A22  26ff7706             push word ptr es:[bx + 6]
9:6A26  666882000c01         push 0x10c0082
9:6A2C  666800008300         push 0x830000
9:6A32  666828000a00         push 0xa0028
9:6A38  6a01                 push 1
9:6A3A  ff7696               push word ptr [bp - 0x6a]
9:6A3D  50                   push ax
9:6A3E  9ad63b7a6a           lcall 0x6a7a, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_6A43:
9:6A43  666a42               push 0x42
9:6A46  9a9c17946a           lcall 0x6a94, 0x179c  ; operator_new@s1:179C
9:6A4B  83c402               add sp, 2
9:6A4E  894694               mov word ptr [bp - 0x6c], ax
9:6A51  895696               mov word ptr [bp - 0x6a], dx
9:6A54  0bd0                 or dx, ax
9:6A56  7426                 je 0x6a7e
9:6A58  c45e06               les bx, ptr [bp + 6]
9:6A5B  26ff7706             push word ptr es:[bx + 6]
9:6A5F  6668ff000701         push 0x10700ff
9:6A65  666801010001         push 0x1000101
9:6A6B  6668aa000a00         push 0xa00aa
9:6A71  6a01                 push 1
9:6A73  ff7696               push word ptr [bp - 0x6a]
9:6A76  50                   push ax
9:6A77  9ad63bc56a           lcall 0x6ac5, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:6A7C  eb03                 jmp 0x6a81
loc_6A7E:
9:6A7E  33c0                 xor ax, ax
9:6A80  99                   cdq
loc_6A81:
9:6A81  8946fc               mov word ptr [bp - 4], ax
9:6A84  8956fe               mov word ptr [bp - 2], dx
9:6A87  52                   push dx
9:6A88  50                   push ax
9:6A89  90                   nop
9:6A8A  0e                   push cs
9:6A8B  e8a627               call 0x9234  ; OPCtrl::enable@s9:9234
9:6A8E  666a42               push 0x42
9:6A91  9a9c170a6b           lcall 0x6b0a, 0x179c  ; operator_new@s1:179C
9:6A96  83c402               add sp, 2
9:6A99  894694               mov word ptr [bp - 0x6c], ax
9:6A9C  895696               mov word ptr [bp - 0x6a], dx
9:6A9F  0bd0                 or dx, ax
9:6AA1  7427                 je 0x6aca
9:6AA3  c45e06               les bx, ptr [bp + 6]
9:6AA6  26ff7706             push word ptr es:[bx + 6]
9:6AAA  6668ff000801         push 0x10800ff
9:6AB0  666801010001         push 0x1000101
9:6AB6  6668c2000a00         push 0xa00c2
9:6ABC  6a01                 push 1
9:6ABE  ff7696               push word ptr [bp - 0x6a]
9:6AC1  50                   push ax
9:6AC2  9ad63bc067           lcall 0x67c0, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:6AC7  eb04                 jmp 0x6acd
9:6AC9  db 90
loc_6ACA:
9:6ACA  33c0                 xor ax, ax
9:6ACC  99                   cdq
loc_6ACD:
9:6ACD  8946fc               mov word ptr [bp - 4], ax
9:6AD0  8956fe               mov word ptr [bp - 2], dx
9:6AD3  52                   push dx
9:6AD4  50                   push ax
9:6AD5  90                   nop
9:6AD6  0e                   push cs
9:6AD7  e85a27               call 0x9234  ; OPCtrl::enable@s9:9234
9:6ADA  c45e06               les bx, ptr [bp + 6]
9:6ADD  26ff7706             push word ptr es:[bx + 6]
9:6AE1  9a6c3d0000           lcall 0, 0x3d6c  ; USER.GetDC
9:6AE6  8946fa               mov word ptr [bp - 6], ax
9:6AE9  68cd07               push 0x7cd
9:6AEC  8d46aa               lea ax, [bp - 0x56]
9:6AEF  16                   push ss
9:6AF0  50                   push ax
9:6AF1  6a50                 push 0x50
9:6AF3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:6AF8  9ae0845e6b           lcall 0x6b5e, 0x84e0  ; LoadStringTo@s3:84E0
9:6AFD  ff76fa               push word ptr [bp - 6]
9:6B00  8d46aa               lea ax, [bp - 0x56]
9:6B03  16                   push ss
9:6B04  50                   push ax
9:6B05  16                   push ss
9:6B06  50                   push ax
9:6B07  9aa43d6d6b           lcall 0x6b6d, 0x3da4  ; _fstrlen@s1:3DA4
9:6B0C  83c404               add sp, 4
9:6B0F  50                   push ax
9:6B10  9a746b0000           lcall 0, 0x6b74  ; GDI.GetTextExtent
9:6B15  8946a6               mov word ptr [bp - 0x5a], ax
9:6B18  8956a8               mov word ptr [bp - 0x58], dx
9:6B1B  1e                   push ds
9:6B1C  68845d               push 0x5d84  ; 'static'
9:6B1F  8d46aa               lea ax, [bp - 0x56]
9:6B22  16                   push ss
9:6B23  50                   push ax
9:6B24  666800000050         push 0x50000000
9:6B2A  6668ad002200         push 0x2200ad
9:6B30  ff76a6               push word ptr [bp - 0x5a]
9:6B33  ff76a8               push word ptr [bp - 0x58]
9:6B36  c45e06               les bx, ptr [bp + 6]
9:6B39  26ff7706             push word ptr es:[bx + 6]
9:6B3D  68cd07               push 0x7cd
9:6B40  ff368c03             push word ptr [0x38c]
9:6B44  666a00               push 0
9:6B47  9aba6b0000           lcall 0, 0x6bba  ; USER.CreateWindow
9:6B4C  68ce07               push 0x7ce
9:6B4F  8d46aa               lea ax, [bp - 0x56]
9:6B52  16                   push ss
9:6B53  50                   push ax
9:6B54  6a50                 push 0x50
9:6B56  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:6B5B  9ae084916c           lcall 0x6c91, 0x84e0  ; LoadStringTo@s3:84E0
9:6B60  ff76fa               push word ptr [bp - 6]
9:6B63  8d46aa               lea ax, [bp - 0x56]
9:6B66  16                   push ss
9:6B67  50                   push ax
9:6B68  16                   push ss
9:6B69  50                   push ax
9:6B6A  9aa43dad67           lcall 0x67ad, 0x3da4  ; _fstrlen@s1:3DA4
9:6B6F  83c404               add sp, 4
9:6B72  50                   push ax
9:6B73  9affff0000           lcall 0, 0xffff  ; GDI.GetTextExtent
9:6B78  8946a6               mov word ptr [bp - 0x5a], ax
9:6B7B  8956a8               mov word ptr [bp - 0x58], dx
9:6B7E  c45e06               les bx, ptr [bp + 6]
9:6B81  26ff7706             push word ptr es:[bx + 6]
9:6B85  ff76fa               push word ptr [bp - 6]
9:6B88  9acf3d0000           lcall 0, 0x3dcf  ; USER.ReleaseDC
9:6B8D  1e                   push ds
9:6B8E  688b5d               push 0x5d8b  ; 'static'
9:6B91  8d46aa               lea ax, [bp - 0x56]
9:6B94  16                   push ss
9:6B95  50                   push ax
9:6B96  666800000050         push 0x50000000
9:6B9C  6668c5002200         push 0x2200c5
9:6BA2  ff76a6               push word ptr [bp - 0x5a]
9:6BA5  ff76a8               push word ptr [bp - 0x58]
9:6BA8  c45e06               les bx, ptr [bp + 6]
9:6BAB  26ff7706             push word ptr es:[bx + 6]
9:6BAF  68ce07               push 0x7ce
9:6BB2  ff368c03             push word ptr [0x38c]
9:6BB6  666a00               push 0
9:6BB9  9aaa210000           lcall 0, 0x21aa  ; USER.CreateWindow
9:6BBE  66c7469e0a005a00     mov dword ptr [bp - 0x62], 0x5a000a
9:6BC6  66c746a250001400     mov dword ptr [bp - 0x5e], 0x140050
9:6BCE  c45e06               les bx, ptr [bp + 6]
9:6BD1  26ff7706             push word ptr es:[bx + 6]
9:6BD5  6668eb05fd00         push 0xfd05eb
9:6BDB  8d469e               lea ax, [bp - 0x62]
9:6BDE  16                   push ss
9:6BDF  50                   push ax
9:6BE0  6a01                 push 1
9:6BE2  06                   push es
9:6BE3  53                   push bx
9:6BE4  90                   nop
9:6BE5  0e                   push cs
9:6BE6  e8c502               call 0x6eae  ; ResearchTreeDlg::makeButton@s9:6EAE
9:6BE9  89469c               mov word ptr [bp - 0x64], ax
9:6BEC  8346a014             add word ptr [bp - 0x60], 0x14
9:6BF0  c45e06               les bx, ptr [bp + 6]
9:6BF3  26ff7706             push word ptr es:[bx + 6]
9:6BF7  6668ec05fe00         push 0xfe05ec
9:6BFD  8d469e               lea ax, [bp - 0x62]
9:6C00  16                   push ss
9:6C01  50                   push ax
9:6C02  6a00                 push 0
9:6C04  06                   push es
9:6C05  53                   push bx
9:6C06  90                   nop
9:6C07  0e                   push cs
9:6C08  e8a302               call 0x6eae  ; ResearchTreeDlg::makeButton@s9:6EAE
9:6C0B  8346a014             add word ptr [bp - 0x60], 0x14
9:6C0F  c45e06               les bx, ptr [bp + 6]
9:6C12  26ff7706             push word ptr es:[bx + 6]
9:6C16  6668ee05ff00         push 0xff05ee
9:6C1C  8d469e               lea ax, [bp - 0x62]
9:6C1F  16                   push ss
9:6C20  50                   push ax
9:6C21  6a00                 push 0
9:6C23  06                   push es
9:6C24  53                   push bx
9:6C25  90                   nop
9:6C26  0e                   push cs
9:6C27  e88402               call 0x6eae  ; ResearchTreeDlg::makeButton@s9:6EAE
9:6C2A  ff769c               push word ptr [bp - 0x64]
9:6C2D  666801000104         push 0x4010001
9:6C33  666a00               push 0
9:6C36  9a0c540000           lcall 0, 0x540c  ; USER.SendMessage
9:6C3B  c45e06               les bx, ptr [bp + 6]
9:6C3E  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:6C44  050a00               add ax, 0xa
9:6C47  66894698             mov dword ptr [bp - 0x68], eax
9:6C4B  26ff7706             push word ptr es:[bx + 6]
9:6C4F  6a00                 push 0
9:6C51  c45e98               les bx, ptr [bp - 0x68]
9:6C54  26ff37               push word ptr es:[bx]
9:6C57  26ff7702             push word ptr es:[bx + 2]
9:6C5B  26ff7704             push word ptr es:[bx + 4]
9:6C5F  26ff7706             push word ptr es:[bx + 6]
9:6C63  6a40                 push 0x40
9:6C65  9a30520000           lcall 0, 0x5230  ; USER.SetWindowPos
9:6C6A  c706cc0e0000         mov word ptr [0xecc], 0
9:6C70  c45e06               les bx, ptr [bp + 6]
9:6C73  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6C79  26c49f9400           les bx, ptr es:[bx + 0x94]
9:6C7E  26c41f               les bx, ptr es:[bx]
9:6C81  26ff5f10             lcall es:[bx + 0x10]
9:6C85  c45e06               les bx, ptr [bp + 6]
9:6C88  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6C8E  9ae22ed365           lcall 0x65d3, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:6C93  c45e06               les bx, ptr [bp + 6]
9:6C96  26ff7706             push word ptr es:[bx + 6]
9:6C9A  66680a011101         push 0x111010a
9:6CA0  666a00               push 0
9:6CA3  9a7a670000           lcall 0, 0x677a  ; USER.PostMessage
9:6CA8  c9                   leave
9:6CA9  ca0400               retf 4

; ---------------- ResearchTreeDlg::destroy@s9:6CAC size=78 callers=0
;   (vslot 31)
9:6CAC  c8080000             enter 8, 0
9:6CB0  56                   push si
9:6CB1  c45e06               les bx, ptr [bp + 6]
9:6CB4  06                   push es
9:6CB5  53                   push bx
9:6CB6  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6CBC  9aa61e5969           lcall 0x6959, 0x1ea6  ; RegObj::removeListener@s3:1EA6
9:6CC1  c45e06               les bx, ptr [bp + 6]
9:6CC4  268b879800           mov ax, word ptr es:[bx + 0x98]
9:6CC9  268b979a00           mov dx, word ptr es:[bx + 0x9a]
9:6CCE  8bda                 mov bx, dx
9:6CD0  0bd0                 or dx, ax
9:6CD2  740e                 je 0x6ce2
9:6CD4  6a01                 push 1
9:6CD6  53                   push bx
9:6CD7  50                   push ax
9:6CD8  8ec3                 mov es, bx
9:6CDA  8bf0                 mov si, ax
9:6CDC  26c41c               les bx, ptr es:[si]
9:6CDF  26ff1f               lcall es:[bx]
loc_6CE2:
9:6CE2  c45e06               les bx, ptr [bp + 6]
9:6CE5  662bc0               sub eax, eax
9:6CE8  662689879800         mov dword ptr es:[bx + 0x98], eax
9:6CEE  662689879400         mov dword ptr es:[bx + 0x94], eax
9:6CF4  5e                   pop si
9:6CF5  c9                   leave
9:6CF6  ca0400               retf 4
9:6CF9  db 00

; ---------------- ResearchTreeDlg::onCommand@s9:6CFA FAR size=32 callers=0
;   (vslot 24)
9:6CFA  55                   push bp
9:6CFB  8bec                 mov bp, sp
9:6CFD  c45e06               les bx, ptr [bp + 6]
9:6D00  6626ffb79800         push dword ptr es:[bx + 0x98]
9:6D06  26c49f9800           les bx, ptr es:[bx + 0x98]
9:6D0B  26c41f               les bx, ptr es:[bx]
9:6D0E  26ff5f08             lcall es:[bx + 8]
9:6D12  b80100               mov ax, 1
9:6D15  c9                   leave
9:6D16  ca0400               retf 4
9:6D19  db 00

; ---------------- ResearchTreeDlg::onTopic@s9:6D1A FAR size=404 callers=0
;   apis: USER.DestroyWindow, USER.GetClientRect, USER.InvalidateRect, USER.PostMessage
;   (vslot 32) opens/closes a topic
9:6D1A  c8200000             enter 0x20, 0
9:6D1E  8b460e               mov ax, word ptr [bp + 0xe]
9:6D21  e94c01               jmp 0x6e70
loc_6D24:
9:6D24  66ff36fe5e           push dword ptr [0x5efe]
9:6D29  6a00                 push 0
9:6D2B  c45e06               les bx, ptr [bp + 6]
9:6D2E  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6D34  26c49f9400           les bx, ptr es:[bx + 0x94]
9:6D39  26c41f               les bx, ptr es:[bx]
9:6D3C  26ff5f18             lcall es:[bx + 0x18]
9:6D40  e96301               jmp 0x6ea6
9:6D43  db 90
loc_6D44:
9:6D44  c45e06               les bx, ptr [bp + 6]
9:6D47  26ff7706             push word ptr es:[bx + 6]
9:6D4B  8d46f8               lea ax, [bp - 8]
9:6D4E  16                   push ss
9:6D4F  50                   push ax
9:6D50  9a11530000           lcall 0, 0x5311  ; USER.GetClientRect
9:6D55  c45e06               les bx, ptr [bp + 6]
9:6D58  26c49f9400           les bx, ptr es:[bx + 0x94]
9:6D5D  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:6D61  8946f6               mov word ptr [bp - 0xa], ax
9:6D64  c45e06               les bx, ptr [bp + 6]
9:6D67  26c49f9400           les bx, ptr es:[bx + 0x94]
9:6D6C  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:6D70  8946f4               mov word ptr [bp - 0xc], ax
9:6D73  8346fa03             add word ptr [bp - 6], 3
9:6D77  8b46f6               mov ax, word ptr [bp - 0xa]
9:6D7A  2d0900               sub ax, 9
9:6D7D  8946f8               mov word ptr [bp - 8], ax
9:6D80  836efc03             sub word ptr [bp - 4], 3
9:6D84  836efe03             sub word ptr [bp - 2], 3
9:6D88  c45e06               les bx, ptr [bp + 6]
9:6D8B  26ff7706             push word ptr es:[bx + 6]
9:6D8F  8d46f8               lea ax, [bp - 8]
9:6D92  16                   push ss
9:6D93  50                   push ax
9:6D94  6a01                 push 1
9:6D96  9ab8590000           lcall 0, 0x59b8  ; USER.InvalidateRect
9:6D9B  c45e06               les bx, ptr [bp + 6]
9:6D9E  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6DA4  9aa02fb86d           lcall 0x6db8, 0x2fa0  ; ResearchTreeBase::destroyButtons@s3:2FA0
9:6DA9  666a00               push 0
9:6DAC  c45e06               les bx, ptr [bp + 6]
9:6DAF  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6DB5  9ac032c66d           lcall 0x6dc6, 0x32c0  ; ResearchTreeBase::setWindow@s3:32C0
9:6DBA  c45e06               les bx, ptr [bp + 6]
9:6DBD  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6DC3  9ae22e0c6e           lcall 0x6e0c, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:6DC8  e9db00               jmp 0x6ea6
9:6DCB  db 90
loc_6DCC:
9:6DCC  c45e06               les bx, ptr [bp + 6]
9:6DCF  26ff7706             push word ptr es:[bx + 6]
9:6DD3  9a18540000           lcall 0, 0x5418  ; USER.DestroyWindow
9:6DD8  e9cb00               jmp 0x6ea6
9:6DDB  db 90
loc_6DDC:
9:6DDC  833ecc0e00           cmp word ptr [0xecc], 0
9:6DE1  0f84c100             je 0x6ea6
9:6DE5  c706cc0e0000         mov word ptr [0xecc], 0
loc_6DEB:
9:6DEB  c45e06               les bx, ptr [bp + 6]
9:6DEE  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6DF4  26c49f9400           les bx, ptr es:[bx + 0x94]
9:6DF9  26c41f               les bx, ptr es:[bx]
9:6DFC  26ff5f10             lcall es:[bx + 0x10]
9:6E00  c45e06               les bx, ptr [bp + 6]
9:6E03  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6E09  9ae22e546e           lcall 0x6e54, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:6E0E  c45e06               les bx, ptr [bp + 6]
9:6E11  26ff7706             push word ptr es:[bx + 6]
9:6E15  66680a011101         push 0x111010a
9:6E1B  666a00               push 0
9:6E1E  9aa46c0000           lcall 0, 0x6ca4  ; USER.PostMessage
9:6E23  e98000               jmp 0x6ea6
loc_6E26:
9:6E26  833ecc0e01           cmp word ptr [0xecc], 1
9:6E2B  7479                 je 0x6ea6
9:6E2D  c706cc0e0100         mov word ptr [0xecc], 1
9:6E33  ebb6                 jmp 0x6deb
9:6E35  db 90
loc_6E36:
9:6E36  833ecc0e02           cmp word ptr [0xecc], 2
9:6E3B  7469                 je 0x6ea6
9:6E3D  c706cc0e0200         mov word ptr [0xecc], 2
9:6E43  eba6                 jmp 0x6deb
9:6E45  db 90
loc_6E46:
9:6E46  6a00                 push 0
loc_6E48:
9:6E48  c45e06               les bx, ptr [bp + 6]
9:6E4B  6626ffb79400         push dword ptr es:[bx + 0x94]
9:6E51  9a0232bf6c           lcall 0x6cbf, 0x3202  ; ResearchTreeBase::close@s3:3202
9:6E56  eb4e                 jmp 0x6ea6
loc_6E58:
9:6E58  6a01                 push 1
9:6E5A  ebec                 jmp 0x6e48
loc_6E5C:
9:6E5C  66ff760c             push dword ptr [bp + 0xc]
9:6E60  66ff7608             push dword ptr [bp + 8]
9:6E64  ff7606               push word ptr [bp + 6]
9:6E67  90                   nop
9:6E68  0e                   push cs
9:6E69  e8de46               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:6E6C  c9                   leave
9:6E6D  ca0a00               retf 0xa
loc_6E70:
9:6E70  2dfa00               sub ax, 0xfa
9:6E73  3d1200               cmp ax, 0x12
9:6E76  77e4                 ja 0x6e5c
9:6E78  03c0                 add ax, ax
9:6E7A  93                   xchg bx, ax
9:6E7B  2effa7806e           jmp word ptr cs:[bx + 0x6e80]
switch_table_6E80:
    dw loc_6D24
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6DDC
    dw loc_6E26
    dw loc_6E36
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6E5C
    dw loc_6E46
    dw loc_6E58
    dw loc_6E5C
    dw loc_6D44
    dw loc_6E5C
    dw loc_6DCC
loc_6EA6:
9:6EA6  b80100               mov ax, 1
9:6EA9  99                   cdq
9:6EAA  c9                   leave
9:6EAB  ca0a00               retf 0xa

; ---------------- ResearchTreeDlg::makeButton@s9:6EAE FAR size=94 callers=1
;   apis: USER.CreateWindow
;   a "button" child
9:6EAE  c8080000             enter 8, 0
9:6EB2  ff7610               push word ptr [bp + 0x10]
9:6EB5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:6EBA  9a7e84a76d           lcall 0x6da7, 0x847e  ; LoadStringRes@s3:847E
9:6EBF  66c746f809000050     mov dword ptr [bp - 8], 0x50000009
9:6EC7  837e0a00             cmp word ptr [bp + 0xa], 0
9:6ECB  7408                 je 0x6ed5
9:6ECD  66c746f809000250     mov dword ptr [bp - 8], 0x50020009
loc_6ED5:
9:6ED5  1e                   push ds
9:6ED6  68925d               push 0x5d92  ; 'button'
9:6ED9  52                   push dx
9:6EDA  50                   push ax
9:6EDB  66ff76f8             push dword ptr [bp - 8]
9:6EDF  c45e0c               les bx, ptr [bp + 0xc]
9:6EE2  26ff37               push word ptr es:[bx]
9:6EE5  26ff7702             push word ptr es:[bx + 2]
9:6EE9  26ff7704             push word ptr es:[bx + 4]
9:6EED  26ff7706             push word ptr es:[bx + 6]
9:6EF1  c45e06               les bx, ptr [bp + 6]
9:6EF4  26ff7706             push word ptr es:[bx + 6]
9:6EF8  ff7612               push word ptr [bp + 0x12]
9:6EFB  ff368c03             push word ptr [0x38c]
9:6EFF  666a00               push 0
9:6F02  9a486b0000           lcall 0, 0x6b48  ; USER.CreateWindow
9:6F07  c9                   leave
9:6F08  ca1000               retf 0x10
9:6F0B  db 00

; ---------------- ResearchTreeDlg::scalar_dtor@s9:6F0C FAR size=170 callers=0
;   deleting destructor
9:6F0C  55                   push bp
9:6F0D  8bec                 mov bp, sp
9:6F0F  66ff7606             push dword ptr [bp + 6]
9:6F13  90                   nop
9:6F14  0e                   push cs
9:6F15  e84af9               call 0x6862  ; ResearchTreeDlg::~ResearchTreeDlg@s9:6862
9:6F18  f6460a01             test byte ptr [bp + 0xa], 1
9:6F1C  7409                 je 0x6f27
9:6F1E  66ff7606             push dword ptr [bp + 6]
9:6F22  9ace178369           lcall 0x6983, 0x17ce  ; operator_delete@s1:17CE
loc_6F27:
9:6F27  8b4606               mov ax, word ptr [bp + 6]
9:6F2A  8b5608               mov dx, word ptr [bp + 8]
9:6F2D  c9                   leave
9:6F2E  ca0600               retf 6
9:6F31  db 90 0c 6f 38 6f 80 68 3c 6f 42 69 40 6f d2 68 44
9:6F41  db 6f 4a b5 48 6f 26 b7 4c 6f 56 7f 50 6f b2 7b 54
9:6F51  db 6f 1c 7f 58 6f 2e 69 5c 6f 86 7f 60 6f 0c 80 64
9:6F61  db 6f 54 80 68 6f 72 b3 6c 6f 58 81 70 6f b6 81 74
9:6F71  db 6f fe 81 7c 6f ea 60 88 6f 4a 82 80 6f 66 82 84
9:6F81  db 6f de 78 90 6f ee 60 8c 6f f4 60 98 6f c8 b4 94
9:6F91  db 6f fa 6c 9c 6f fe 60 00 68 7e 80 a0 6f 3c b4 a4
9:6FA1  db 6f 5e b4 a8 6f 7c b1 b0 6f 4c 88 1c 68 ac 6c b4
9:6FB1  db 6f 1a 6d 71 68

; ---------------- UgResearchTreeDlg::UgResearchTreeDlg@s9:6FB6 FAR size=60 callers=1
;   dialog 4057: the underground research tree window (vtable 76A4)
9:6FB6  55                   push bp
9:6FB7  8bec                 mov bp, sp
9:6FB9  ff760a               push word ptr [bp + 0xa]
9:6FBC  66680000d90f         push 0xfd90000
9:6FC2  6a00                 push 0
9:6FC4  66ff7606             push dword ptr [bp + 6]
9:6FC8  90                   nop
9:6FC9  0e                   push cs
9:6FCA  e8ef40               call 0xb0bc  ; ObjectDlgBase::ObjectDlgBase@s9:B0BC
9:6FCD  c45e06               les bx, ptr [bp + 6]
9:6FD0  662bc0               sub eax, eax
9:6FD3  662689879400         mov dword ptr es:[bx + 0x94], eax
9:6FD9  662689879800         mov dword ptr es:[bx + 0x98], eax
9:6FDF  26c707a476           mov word ptr es:[bx], 0x76a4
9:6FE4  26c74702346f         mov word ptr es:[bx + 2], 0x6f34  ; SEGMENT s9:0000
9:6FEA  8bc3                 mov ax, bx
9:6FEC  8cc2                 mov dx, es
9:6FEE  c9                   leave
9:6FEF  ca0600               retf 6

; ---------------- UgResearchTreeDlg::onNotify@s9:6FF2 size=82 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem
;   (vslot 1)
9:6FF2  c80a0000             enter 0xa, 0
9:6FF6  8b460a               mov ax, word ptr [bp + 0xa]
9:6FF9  2d0800               sub ax, 8
9:6FFC  7542                 jne 0x7040
9:6FFE  c45e06               les bx, ptr [bp + 6]
9:7001  26ff7706             push word ptr es:[bx + 6]
9:7005  680701               push 0x107
9:7008  9a2a700000           lcall 0, 0x702a  ; USER.GetDlgItem
9:700D  50                   push ax
9:700E  c45e06               les bx, ptr [bp + 6]
9:7011  26c49f9400           les bx, ptr es:[bx + 0x94]
9:7016  26ff7724             push word ptr es:[bx + 0x24]
9:701A  9a3c700000           lcall 0, 0x703c  ; USER.EnableWindow
9:701F  c45e06               les bx, ptr [bp + 6]
9:7022  26ff7706             push word ptr es:[bx + 6]
9:7026  680801               push 0x108
9:7029  9a97680000           lcall 0, 0x6897  ; USER.GetDlgItem
9:702E  50                   push ax
9:702F  c45e06               les bx, ptr [bp + 6]
9:7032  26c49f9400           les bx, ptr es:[bx + 0x94]
9:7037  26ff7726             push word ptr es:[bx + 0x26]
9:703B  9aa9680000           lcall 0, 0x68a9  ; USER.EnableWindow
loc_7040:
9:7040  c9                   leave
9:7041  ca0600               retf 6

; ---------------- UgResearchTreeDlg::dlgProc@s9:7044 FAR size=92 callers=0
;   (vslot 3)
9:7044  55                   push bp
9:7045  8bec                 mov bp, sp
9:7047  8b4610               mov ax, word ptr [bp + 0x10]
9:704A  2d2b00               sub ax, 0x2b
9:704D  741b                 je 0x706a
9:704F  2de600               sub ax, 0xe6
9:7052  7430                 je 0x7084
9:7054  66ff760e             push dword ptr [bp + 0xe]
9:7058  66ff760a             push dword ptr [bp + 0xa]
9:705C  66ff7606             push dword ptr [bp + 6]
9:7060  90                   nop
9:7061  0e                   push cs
9:7062  e8b142               call 0xb316  ; BuildingDlgBase::dlgProc@s9:B316
9:7065  c9                   leave
9:7066  ca0c00               retf 0xc
9:7069  db 90
loc_706A:
9:706A  8b4e0c               mov cx, word ptr [bp + 0xc]
9:706D  8b5e0a               mov bx, word ptr [bp + 0xa]
9:7070  8ec1                 mov es, cx
9:7072  26833f04             cmp word ptr es:[bx], 4
9:7076  7520                 jne 0x7098
9:7078  51                   push cx
9:7079  53                   push bx
9:707A  90                   nop
9:707B  0e                   push cs
9:707C  e8e724               call 0x9566  ; objectFromHwnd@s9:9566
9:707F  8be5                 mov sp, bp
9:7081  eb15                 jmp 0x7098
9:7083  db 90
loc_7084:
9:7084  66ff760c             push dword ptr [bp + 0xc]
9:7088  ff760a               push word ptr [bp + 0xa]
9:708B  c45e06               les bx, ptr [bp + 6]
9:708E  06                   push es
9:708F  53                   push bx
9:7090  26c41f               les bx, ptr es:[bx]
9:7093  26ff9f8000           lcall es:[bx + 0x80]
loc_7098:
9:7098  b80100               mov ax, 1
9:709B  c9                   leave
9:709C  ca0c00               retf 0xc
9:709F  db 00

; ---------------- UgResearchTreeDlg::refresh@s9:70A0 FAR size=20 callers=0
;   (vslot 9)
9:70A0  55                   push bp
9:70A1  8bec                 mov bp, sp
9:70A3  c45e06               les bx, ptr [bp + 6]
9:70A6  06                   push es
9:70A7  53                   push bx
9:70A8  26c41f               les bx, ptr es:[bx]
9:70AB  26ff5f7c             lcall es:[bx + 0x7c]
9:70AF  c9                   leave
9:70B0  ca0400               retf 4
9:70B3  db 00

; ---------------- UgResearchTreeDlg::init@s9:70B4 FAR size=874 callers=0
;   apis: GDI.GetTextExtent, USER.CreateWindow, USER.GetDC, USER.PostMessage, USER.ReleaseDC, USER.SendMessage, USER.SetWindowPos
;   (vslot 2)
9:70B4  c8740000             enter 0x74, 0
9:70B8  66ff7606             push dword ptr [bp + 6]
9:70BC  90                   nop
9:70BD  0e                   push cs
9:70BE  e82108               call 0x78e2  ; OPDialog::create@s9:78E2
9:70C1  6a34                 push 0x34
9:70C3  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:70C8  9aba206d72           lcall 0x726d, 0x20ba  ; Registry_get@s3:20BA
9:70CD  c45e06               les bx, ptr [bp + 6]
9:70D0  2689879400           mov word ptr es:[bx + 0x94], ax
9:70D5  2689979600           mov word ptr es:[bx + 0x96], dx
9:70DA  06                   push es
9:70DB  53                   push bx
9:70DC  6a00                 push 0
9:70DE  52                   push dx
9:70DF  26ffb79400           push word ptr es:[bx + 0x94]
9:70E4  26c49f9400           les bx, ptr es:[bx + 0x94]
9:70E9  26c41f               les bx, ptr es:[bx]
9:70EC  26ff5f04             lcall es:[bx + 4]
9:70F0  6a0a                 push 0xa
9:70F2  9a9c174a71           lcall 0x714a, 0x179c  ; operator_new@s1:179C
9:70F7  83c402               add sp, 2
9:70FA  894694               mov word ptr [bp - 0x6c], ax
9:70FD  895696               mov word ptr [bp - 0x6a], dx
9:7100  0bd0                 or dx, ax
9:7102  7420                 je 0x7124
9:7104  c45e06               les bx, ptr [bp + 6]
9:7107  26ff7706             push word ptr es:[bx + 6]
9:710B  ff7696               push word ptr [bp - 0x6a]
9:710E  50                   push ax
9:710F  90                   nop
9:7110  0e                   push cs
9:7111  e82a4e               call 0xbf3e  ; TreeView::TreeView@s9:BF3E
9:7114  c45e06               les bx, ptr [bp + 6]
9:7117  2689879800           mov word ptr es:[bx + 0x98], ax
9:711C  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:7121  eb0e                 jmp 0x7131
9:7123  db 90
loc_7124:
9:7124  c45e06               les bx, ptr [bp + 6]
9:7127  6626c787980000000000 mov dword ptr es:[bx + 0x98], 0
loc_7131:
9:7131  c45e06               les bx, ptr [bp + 6]
9:7134  6626ffb79400         push dword ptr es:[bx + 0x94]
9:713A  6626ffb79800         push dword ptr es:[bx + 0x98]
9:7140  90                   nop
9:7141  0e                   push cs
9:7142  e8994e               call 0xbfde  ; TreeView::attach@s9:BFDE
9:7145  6a42                 push 0x42
9:7147  9a9c178271           lcall 0x7182, 0x179c  ; operator_new@s1:179C
9:714C  83c402               add sp, 2
9:714F  894694               mov word ptr [bp - 0x6c], ax
9:7152  895696               mov word ptr [bp - 0x6a], dx
9:7155  0bd0                 or dx, ax
9:7157  7424                 je 0x717d
9:7159  c45e06               les bx, ptr [bp + 6]
9:715C  26ff7706             push word ptr es:[bx + 6]
9:7160  666880000a01         push 0x10a0080
9:7166  666800008100         push 0x810000
9:716C  66680a000a00         push 0xa000a
9:7172  6a01                 push 1
9:7174  ff7696               push word ptr [bp - 0x6a]
9:7177  50                   push ax
9:7178  9ad63bb371           lcall 0x71b3, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_717D:
9:717D  6a42                 push 0x42
9:717F  9a9c17bb71           lcall 0x71bb, 0x179c  ; operator_new@s1:179C
9:7184  83c402               add sp, 2
9:7187  894694               mov word ptr [bp - 0x6c], ax
9:718A  895696               mov word ptr [bp - 0x6a], dx
9:718D  0bd0                 or dx, ax
9:718F  7424                 je 0x71b5
9:7191  c45e06               les bx, ptr [bp + 6]
9:7194  26ff7706             push word ptr es:[bx + 6]
9:7198  666882000c01         push 0x10c0082
9:719E  666800008300         push 0x830000
9:71A4  666828000a00         push 0xa0028
9:71AA  6a01                 push 1
9:71AC  ff7696               push word ptr [bp - 0x6a]
9:71AF  50                   push ax
9:71B0  9ad63bec71           lcall 0x71ec, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_71B5:
9:71B5  666a42               push 0x42
9:71B8  9a9c170672           lcall 0x7206, 0x179c  ; operator_new@s1:179C
9:71BD  83c402               add sp, 2
9:71C0  894694               mov word ptr [bp - 0x6c], ax
9:71C3  895696               mov word ptr [bp - 0x6a], dx
9:71C6  0bd0                 or dx, ax
9:71C8  7426                 je 0x71f0
9:71CA  c45e06               les bx, ptr [bp + 6]
9:71CD  26ff7706             push word ptr es:[bx + 6]
9:71D1  6668ff000701         push 0x10700ff
9:71D7  666801010001         push 0x1000101
9:71DD  6668aa000a00         push 0xa00aa
9:71E3  6a01                 push 1
9:71E5  ff7696               push word ptr [bp - 0x6a]
9:71E8  50                   push ax
9:71E9  9ad63b3772           lcall 0x7237, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:71EE  eb03                 jmp 0x71f3
loc_71F0:
9:71F0  33c0                 xor ax, ax
9:71F2  99                   cdq
loc_71F3:
9:71F3  8946fc               mov word ptr [bp - 4], ax
9:71F6  8956fe               mov word ptr [bp - 2], dx
9:71F9  52                   push dx
9:71FA  50                   push ax
9:71FB  90                   nop
9:71FC  0e                   push cs
9:71FD  e83420               call 0x9234  ; OPCtrl::enable@s9:9234
9:7200  666a42               push 0x42
9:7203  9a9c177c72           lcall 0x727c, 0x179c  ; operator_new@s1:179C
9:7208  83c402               add sp, 2
9:720B  894694               mov word ptr [bp - 0x6c], ax
9:720E  895696               mov word ptr [bp - 0x6a], dx
9:7211  0bd0                 or dx, ax
9:7213  7427                 je 0x723c
9:7215  c45e06               les bx, ptr [bp + 6]
9:7218  26ff7706             push word ptr es:[bx + 6]
9:721C  6668ff000801         push 0x10800ff
9:7222  666801010001         push 0x1000101
9:7228  6668c2000a00         push 0xa00c2
9:722E  6a01                 push 1
9:7230  ff7696               push word ptr [bp - 0x6a]
9:7233  50                   push ax
9:7234  9ad63b096a           lcall 0x6a09, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:7239  eb04                 jmp 0x723f
9:723B  db 90
loc_723C:
9:723C  33c0                 xor ax, ax
9:723E  99                   cdq
loc_723F:
9:723F  8946fc               mov word ptr [bp - 4], ax
9:7242  8956fe               mov word ptr [bp - 2], dx
9:7245  52                   push dx
9:7246  50                   push ax
9:7247  90                   nop
9:7248  0e                   push cs
9:7249  e8e81f               call 0x9234  ; OPCtrl::enable@s9:9234
9:724C  c45e06               les bx, ptr [bp + 6]
9:724F  26ff7706             push word ptr es:[bx + 6]
9:7253  9ae26a0000           lcall 0, 0x6ae2  ; USER.GetDC
9:7258  8946fa               mov word ptr [bp - 6], ax
9:725B  68cd07               push 0x7cd
9:725E  8d46aa               lea ax, [bp - 0x56]
9:7261  16                   push ss
9:7262  50                   push ax
9:7263  6a50                 push 0x50
9:7265  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:726A  9ae084d072           lcall 0x72d0, 0x84e0  ; LoadStringTo@s3:84E0
9:726F  ff76fa               push word ptr [bp - 6]
9:7272  8d46aa               lea ax, [bp - 0x56]
9:7275  16                   push ss
9:7276  50                   push ax
9:7277  16                   push ss
9:7278  50                   push ax
9:7279  9aa43ddf72           lcall 0x72df, 0x3da4  ; _fstrlen@s1:3DA4
9:727E  83c404               add sp, 4
9:7281  50                   push ax
9:7282  9ae6720000           lcall 0, 0x72e6  ; GDI.GetTextExtent
9:7287  8946a6               mov word ptr [bp - 0x5a], ax
9:728A  8956a8               mov word ptr [bp - 0x58], dx
9:728D  1e                   push ds
9:728E  689a5d               push 0x5d9a  ; 'static'
9:7291  8d46aa               lea ax, [bp - 0x56]
9:7294  16                   push ss
9:7295  50                   push ax
9:7296  666800000050         push 0x50000000
9:729C  6668ad002200         push 0x2200ad
9:72A2  ff76a6               push word ptr [bp - 0x5a]
9:72A5  ff76a8               push word ptr [bp - 0x58]
9:72A8  c45e06               les bx, ptr [bp + 6]
9:72AB  26ff7706             push word ptr es:[bx + 6]
9:72AF  68cd07               push 0x7cd
9:72B2  ff368c03             push word ptr [0x38c]
9:72B6  666a00               push 0
9:72B9  9a2c730000           lcall 0, 0x732c  ; USER.CreateWindow
9:72BE  68ce07               push 0x7ce
9:72C1  8d46aa               lea ax, [bp - 0x56]
9:72C4  16                   push ss
9:72C5  50                   push ax
9:72C6  6a50                 push 0x50
9:72C8  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:72CD  9ae0840374           lcall 0x7403, 0x84e0  ; LoadStringTo@s3:84E0
9:72D2  ff76fa               push word ptr [bp - 6]
9:72D5  8d46aa               lea ax, [bp - 0x56]
9:72D8  16                   push ss
9:72D9  50                   push ax
9:72DA  16                   push ss
9:72DB  50                   push ax
9:72DC  9aa43d256f           lcall 0x6f25, 0x3da4  ; _fstrlen@s1:3DA4
9:72E1  83c404               add sp, 4
9:72E4  50                   push ax
9:72E5  9a116b0000           lcall 0, 0x6b11  ; GDI.GetTextExtent
9:72EA  8946a6               mov word ptr [bp - 0x5a], ax
9:72ED  8956a8               mov word ptr [bp - 0x58], dx
9:72F0  c45e06               les bx, ptr [bp + 6]
9:72F3  26ff7706             push word ptr es:[bx + 6]
9:72F7  ff76fa               push word ptr [bp - 6]
9:72FA  9a896b0000           lcall 0, 0x6b89  ; USER.ReleaseDC
9:72FF  1e                   push ds
9:7300  68a15d               push 0x5da1  ; 'static'
9:7303  8d46aa               lea ax, [bp - 0x56]
9:7306  16                   push ss
9:7307  50                   push ax
9:7308  666800000050         push 0x50000000
9:730E  6668c5002200         push 0x2200c5
9:7314  ff76a6               push word ptr [bp - 0x5a]
9:7317  ff76a8               push word ptr [bp - 0x58]
9:731A  c45e06               les bx, ptr [bp + 6]
9:731D  26ff7706             push word ptr es:[bx + 6]
9:7321  68ce07               push 0x7ce
9:7324  ff368c03             push word ptr [0x38c]
9:7328  666a00               push 0
9:732B  9a036f0000           lcall 0, 0x6f03  ; USER.CreateWindow
9:7330  66c7469e0a005a00     mov dword ptr [bp - 0x62], 0x5a000a
9:7338  66c746a250001400     mov dword ptr [bp - 0x5e], 0x140050
9:7340  c45e06               les bx, ptr [bp + 6]
9:7343  26ff7706             push word ptr es:[bx + 6]
9:7347  6668eb05fd00         push 0xfd05eb
9:734D  8d469e               lea ax, [bp - 0x62]
9:7350  16                   push ss
9:7351  50                   push ax
9:7352  6a01                 push 1
9:7354  06                   push es
9:7355  53                   push bx
9:7356  90                   nop
9:7357  0e                   push cs
9:7358  e8c502               call 0x7620  ; UgResearchTreeDlg::makeButton@s9:7620
9:735B  89469c               mov word ptr [bp - 0x64], ax
9:735E  8346a014             add word ptr [bp - 0x60], 0x14
9:7362  c45e06               les bx, ptr [bp + 6]
9:7365  26ff7706             push word ptr es:[bx + 6]
9:7369  6668ed05fe00         push 0xfe05ed
9:736F  8d469e               lea ax, [bp - 0x62]
9:7372  16                   push ss
9:7373  50                   push ax
9:7374  6a00                 push 0
9:7376  06                   push es
9:7377  53                   push bx
9:7378  90                   nop
9:7379  0e                   push cs
9:737A  e8a302               call 0x7620  ; UgResearchTreeDlg::makeButton@s9:7620
9:737D  8346a014             add word ptr [bp - 0x60], 0x14
9:7381  c45e06               les bx, ptr [bp + 6]
9:7384  26ff7706             push word ptr es:[bx + 6]
9:7388  6668ef05ff00         push 0xff05ef
9:738E  8d469e               lea ax, [bp - 0x62]
9:7391  16                   push ss
9:7392  50                   push ax
9:7393  6a00                 push 0
9:7395  06                   push es
9:7396  53                   push bx
9:7397  90                   nop
9:7398  0e                   push cs
9:7399  e88402               call 0x7620  ; UgResearchTreeDlg::makeButton@s9:7620
9:739C  ff769c               push word ptr [bp - 0x64]
9:739F  666801000104         push 0x4010001
9:73A5  666a00               push 0
9:73A8  9a376c0000           lcall 0, 0x6c37  ; USER.SendMessage
9:73AD  c45e06               les bx, ptr [bp + 6]
9:73B0  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:73B6  050a00               add ax, 0xa
9:73B9  66894698             mov dword ptr [bp - 0x68], eax
9:73BD  26ff7706             push word ptr es:[bx + 6]
9:73C1  6a00                 push 0
9:73C3  c45e98               les bx, ptr [bp - 0x68]
9:73C6  26ff37               push word ptr es:[bx]
9:73C9  26ff7702             push word ptr es:[bx + 2]
9:73CD  26ff7704             push word ptr es:[bx + 4]
9:73D1  26ff7706             push word ptr es:[bx + 6]
9:73D5  6a40                 push 0x40
9:73D7  9a666c0000           lcall 0, 0x6c66  ; USER.SetWindowPos
9:73DC  c706cc0e0000         mov word ptr [0xecc], 0
9:73E2  c45e06               les bx, ptr [bp + 6]
9:73E5  6626ffb79400         push dword ptr es:[bx + 0x94]
9:73EB  26c49f9400           les bx, ptr es:[bx + 0x94]
9:73F0  26c41f               les bx, ptr es:[bx]
9:73F3  26ff5f10             lcall es:[bx + 0x10]
9:73F7  c45e06               les bx, ptr [bp + 6]
9:73FA  6626ffb79400         push dword ptr es:[bx + 0x94]
9:7400  9ae22ebd6e           lcall 0x6ebd, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:7405  c45e06               les bx, ptr [bp + 6]
9:7408  26ff7706             push word ptr es:[bx + 6]
9:740C  66680a011101         push 0x111010a
9:7412  666a00               push 0
9:7415  9a1f6e0000           lcall 0, 0x6e1f  ; USER.PostMessage
9:741A  c9                   leave
9:741B  ca0400               retf 4

; ---------------- UgResearchTreeDlg::destroy@s9:741E size=78 callers=0
;   (vslot 31)
9:741E  c8080000             enter 8, 0
9:7422  56                   push si
9:7423  c45e06               les bx, ptr [bp + 6]
9:7426  06                   push es
9:7427  53                   push bx
9:7428  6626ffb79400         push dword ptr es:[bx + 0x94]
9:742E  9aa61ecb70           lcall 0x70cb, 0x1ea6  ; RegObj::removeListener@s3:1EA6
9:7433  c45e06               les bx, ptr [bp + 6]
9:7436  268b879800           mov ax, word ptr es:[bx + 0x98]
9:743B  268b979a00           mov dx, word ptr es:[bx + 0x9a]
9:7440  8bda                 mov bx, dx
9:7442  0bd0                 or dx, ax
9:7444  740e                 je 0x7454
9:7446  6a01                 push 1
9:7448  53                   push bx
9:7449  50                   push ax
9:744A  8ec3                 mov es, bx
9:744C  8bf0                 mov si, ax
9:744E  26c41c               les bx, ptr es:[si]
9:7451  26ff1f               lcall es:[bx]
loc_7454:
9:7454  c45e06               les bx, ptr [bp + 6]
9:7457  662bc0               sub eax, eax
9:745A  662689879800         mov dword ptr es:[bx + 0x98], eax
9:7460  662689879400         mov dword ptr es:[bx + 0x94], eax
9:7466  5e                   pop si
9:7467  c9                   leave
9:7468  ca0400               retf 4
9:746B  db 00

; ---------------- UgResearchTreeDlg::onCommand@s9:746C FAR size=32 callers=0
;   (vslot 24)
9:746C  55                   push bp
9:746D  8bec                 mov bp, sp
9:746F  c45e06               les bx, ptr [bp + 6]
9:7472  6626ffb79800         push dword ptr es:[bx + 0x98]
9:7478  26c49f9800           les bx, ptr es:[bx + 0x98]
9:747D  26c41f               les bx, ptr es:[bx]
9:7480  26ff5f08             lcall es:[bx + 8]
9:7484  b80100               mov ax, 1
9:7487  c9                   leave
9:7488  ca0400               retf 4
9:748B  db 00

; ---------------- UgResearchTreeDlg::onTopic@s9:748C FAR size=404 callers=0
;   apis: USER.DestroyWindow, USER.GetClientRect, USER.InvalidateRect, USER.PostMessage
;   (vslot 32)
9:748C  c8200000             enter 0x20, 0
9:7490  8b460e               mov ax, word ptr [bp + 0xe]
9:7493  e94c01               jmp 0x75e2
loc_7496:
9:7496  66ff36fe5e           push dword ptr [0x5efe]
9:749B  6a00                 push 0
9:749D  c45e06               les bx, ptr [bp + 6]
9:74A0  6626ffb79400         push dword ptr es:[bx + 0x94]
9:74A6  26c49f9400           les bx, ptr es:[bx + 0x94]
9:74AB  26c41f               les bx, ptr es:[bx]
9:74AE  26ff5f18             lcall es:[bx + 0x18]
9:74B2  e96301               jmp 0x7618
9:74B5  db 90
loc_74B6:
9:74B6  c45e06               les bx, ptr [bp + 6]
9:74B9  26ff7706             push word ptr es:[bx + 6]
9:74BD  8d46f8               lea ax, [bp - 8]
9:74C0  16                   push ss
9:74C1  50                   push ax
9:74C2  9a516d0000           lcall 0, 0x6d51  ; USER.GetClientRect
9:74C7  c45e06               les bx, ptr [bp + 6]
9:74CA  26c49f9400           les bx, ptr es:[bx + 0x94]
9:74CF  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:74D3  8946f6               mov word ptr [bp - 0xa], ax
9:74D6  c45e06               les bx, ptr [bp + 6]
9:74D9  26c49f9400           les bx, ptr es:[bx + 0x94]
9:74DE  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:74E2  8946f4               mov word ptr [bp - 0xc], ax
9:74E5  8346fa03             add word ptr [bp - 6], 3
9:74E9  8b46f6               mov ax, word ptr [bp - 0xa]
9:74EC  2d0900               sub ax, 9
9:74EF  8946f8               mov word ptr [bp - 8], ax
9:74F2  836efc03             sub word ptr [bp - 4], 3
9:74F6  836efe03             sub word ptr [bp - 2], 3
9:74FA  c45e06               les bx, ptr [bp + 6]
9:74FD  26ff7706             push word ptr es:[bx + 6]
9:7501  8d46f8               lea ax, [bp - 8]
9:7504  16                   push ss
9:7505  50                   push ax
9:7506  6a01                 push 1
9:7508  9a976d0000           lcall 0, 0x6d97  ; USER.InvalidateRect
9:750D  c45e06               les bx, ptr [bp + 6]
9:7510  6626ffb79400         push dword ptr es:[bx + 0x94]
9:7516  9aa02f2a75           lcall 0x752a, 0x2fa0  ; ResearchTreeBase::destroyButtons@s3:2FA0
9:751B  666a00               push 0
9:751E  c45e06               les bx, ptr [bp + 6]
9:7521  6626ffb79400         push dword ptr es:[bx + 0x94]
9:7527  9ac0323875           lcall 0x7538, 0x32c0  ; ResearchTreeBase::setWindow@s3:32C0
9:752C  c45e06               les bx, ptr [bp + 6]
9:752F  6626ffb79400         push dword ptr es:[bx + 0x94]
9:7535  9ae22e7e75           lcall 0x757e, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:753A  e9db00               jmp 0x7618
9:753D  db 90
loc_753E:
9:753E  c45e06               les bx, ptr [bp + 6]
9:7541  26ff7706             push word ptr es:[bx + 6]
9:7545  9ad46d0000           lcall 0, 0x6dd4  ; USER.DestroyWindow
9:754A  e9cb00               jmp 0x7618
9:754D  db 90
loc_754E:
9:754E  833ecc0e00           cmp word ptr [0xecc], 0
9:7553  0f84c100             je 0x7618
9:7557  c706cc0e0000         mov word ptr [0xecc], 0
loc_755D:
9:755D  c45e06               les bx, ptr [bp + 6]
9:7560  6626ffb79400         push dword ptr es:[bx + 0x94]
9:7566  26c49f9400           les bx, ptr es:[bx + 0x94]
9:756B  26c41f               les bx, ptr es:[bx]
9:756E  26ff5f10             lcall es:[bx + 0x10]
9:7572  c45e06               les bx, ptr [bp + 6]
9:7575  6626ffb79400         push dword ptr es:[bx + 0x94]
9:757B  9ae22ec675           lcall 0x75c6, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:7580  c45e06               les bx, ptr [bp + 6]
9:7583  26ff7706             push word ptr es:[bx + 6]
9:7587  66680a011101         push 0x111010a
9:758D  666a00               push 0
9:7590  9a16740000           lcall 0, 0x7416  ; USER.PostMessage
9:7595  e98000               jmp 0x7618
loc_7598:
9:7598  833ecc0e01           cmp word ptr [0xecc], 1
9:759D  7479                 je 0x7618
9:759F  c706cc0e0100         mov word ptr [0xecc], 1
9:75A5  ebb6                 jmp 0x755d
9:75A7  db 90
loc_75A8:
9:75A8  833ecc0e02           cmp word ptr [0xecc], 2
9:75AD  7469                 je 0x7618
9:75AF  c706cc0e0200         mov word ptr [0xecc], 2
9:75B5  eba6                 jmp 0x755d
9:75B7  db 90
loc_75B8:
9:75B8  6a00                 push 0
loc_75BA:
9:75BA  c45e06               les bx, ptr [bp + 6]
9:75BD  6626ffb79400         push dword ptr es:[bx + 0x94]
9:75C3  9a02323174           lcall 0x7431, 0x3202  ; ResearchTreeBase::close@s3:3202
9:75C8  eb4e                 jmp 0x7618
loc_75CA:
9:75CA  6a01                 push 1
9:75CC  ebec                 jmp 0x75ba
loc_75CE:
9:75CE  66ff760c             push dword ptr [bp + 0xc]
9:75D2  66ff7608             push dword ptr [bp + 8]
9:75D6  ff7606               push word ptr [bp + 6]
9:75D9  90                   nop
9:75DA  0e                   push cs
9:75DB  e86c3f               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:75DE  c9                   leave
9:75DF  ca0a00               retf 0xa
loc_75E2:
9:75E2  2dfa00               sub ax, 0xfa
9:75E5  3d1200               cmp ax, 0x12
9:75E8  77e4                 ja 0x75ce
9:75EA  03c0                 add ax, ax
9:75EC  93                   xchg bx, ax
9:75ED  2effa7f275           jmp word ptr cs:[bx + 0x75f2]
switch_table_75F2:
    dw loc_7496
    dw loc_75CE
    dw loc_75CE
    dw loc_754E
    dw loc_7598
    dw loc_75A8
    dw loc_75CE
    dw loc_75CE
    dw loc_75CE
    dw loc_75CE
    dw loc_75CE
    dw loc_75CE
    dw loc_75CE
    dw loc_75B8
    dw loc_75CA
    dw loc_75CE
    dw loc_74B6
    dw loc_75CE
    dw loc_753E
loc_7618:
9:7618  b80100               mov ax, 1
9:761B  99                   cdq
9:761C  c9                   leave
9:761D  ca0a00               retf 0xa

; ---------------- UgResearchTreeDlg::makeButton@s9:7620 FAR size=94 callers=1
;   apis: USER.CreateWindow
;   a "button" child
9:7620  c8080000             enter 8, 0
9:7624  ff7610               push word ptr [bp + 0x10]
9:7627  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:762C  9a7e841975           lcall 0x7519, 0x847e  ; LoadStringRes@s3:847E
9:7631  66c746f809000050     mov dword ptr [bp - 8], 0x50000009
9:7639  837e0a00             cmp word ptr [bp + 0xa], 0
9:763D  7408                 je 0x7647
9:763F  66c746f809000250     mov dword ptr [bp - 8], 0x50020009
loc_7647:
9:7647  1e                   push ds
9:7648  68a85d               push 0x5da8  ; 'button'
9:764B  52                   push dx
9:764C  50                   push ax
9:764D  66ff76f8             push dword ptr [bp - 8]
9:7651  c45e0c               les bx, ptr [bp + 0xc]
9:7654  26ff37               push word ptr es:[bx]
9:7657  26ff7702             push word ptr es:[bx + 2]
9:765B  26ff7704             push word ptr es:[bx + 4]
9:765F  26ff7706             push word ptr es:[bx + 6]
9:7663  c45e06               les bx, ptr [bp + 6]
9:7666  26ff7706             push word ptr es:[bx + 6]
9:766A  ff7612               push word ptr [bp + 0x12]
9:766D  ff368c03             push word ptr [0x38c]
9:7671  666a00               push 0
9:7674  9aba720000           lcall 0, 0x72ba  ; USER.CreateWindow
9:7679  c9                   leave
9:767A  ca1000               retf 0x10
9:767D  db 00

; ---------------- UgResearchTreeDlg::scalar_dtor@s9:767E FAR size=170 callers=0
;   deleting destructor
9:767E  c8040000             enter 4, 0
9:7682  66ff7606             push dword ptr [bp + 6]
9:7686  90                   nop
9:7687  0e                   push cs
9:7688  e86d3a               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:768B  f6460a01             test byte ptr [bp + 0xa], 1
9:768F  7409                 je 0x769a
9:7691  66ff7606             push dword ptr [bp + 6]
9:7695  9ace17f570           lcall 0x70f5, 0x17ce  ; operator_delete@s1:17CE
loc_769A:
9:769A  8b4606               mov ax, word ptr [bp + 6]
9:769D  8b5608               mov dx, word ptr [bp + 8]
9:76A0  c9                   leave
9:76A1  ca0600               retf 6
9:76A4  db 7e 76 aa 76 f2 6f ae 76 b4 70 b2 76 44 70 b6 76
9:76B4  db 4a b5 ba 76 26 b7 be 76 56 7f c2 76 b2 7b c6 76
9:76C4  db 1c 7f ca 76 a0 70 ce 76 86 7f d2 76 0c 80 d6 76
9:76D4  db 54 80 da 76 72 b3 de 76 58 81 e2 76 b6 81 e6 76
9:76E4  db fe 81 ee 76 ea 60 fa 76 4a 82 f2 76 66 82 f6 76
9:76F4  db de 78 02 77 ee 60 fe 76 f4 60 0a 77 c8 b4 06 77
9:7704  db 6c 74 0e 77 fe 60 78 6f 7e 80 12 77 3c b4 16 77
9:7714  db 5e b4 1a 77 7c b1 22 77 4c 88 ac 6f 1e 74 26 77
9:7724  db 8c 74 e8 6f

; ---------------- OPDialog::OPDialog@s9:7728 FAR size=260 callers=38
;   apis: USER.GetSystemMetrics
;   modeless dialog base (dialog id, parent; vtable 840C)
9:7728  c8080000             enter 8, 0
9:772C  56                   push si
9:772D  c45e06               les bx, ptr [bp + 6]
9:7730  26c7079a38           mov word ptr es:[bx], 0x389a
9:7735  26c747024777         mov word ptr es:[bx + 2], 0x7747  ; SEGMENT s2:0000
9:773B  c45e06               les bx, ptr [bp + 6]
9:773E  26c707a83a           mov word ptr es:[bx], 0x3aa8
9:7743  26c747027b71         mov word ptr es:[bx + 2], 0x717b  ; SEGMENT s2:0000
9:7749  33c0                 xor ax, ax
9:774B  c45e06               les bx, ptr [bp + 6]
9:774E  26894704             mov word ptr es:[bx + 4], ax
9:7752  26894706             mov word ptr es:[bx + 6], ax
9:7756  8b4e12               mov cx, word ptr [bp + 0x12]
9:7759  26894f08             mov word ptr es:[bx + 8], cx
9:775D  8b4e10               mov cx, word ptr [bp + 0x10]
9:7760  26894f0a             mov word ptr es:[bx + 0xa], cx
9:7764  662bc9               sub ecx, ecx
9:7767  6626894f0c           mov dword ptr es:[bx + 0xc], ecx
9:776C  26894f60             mov word ptr es:[bx + 0x60], cx
9:7770  26894762             mov word ptr es:[bx + 0x62], ax
9:7774  26894f64             mov word ptr es:[bx + 0x64], cx
9:7778  26894f66             mov word ptr es:[bx + 0x66], cx
9:777C  26894768             mov word ptr es:[bx + 0x68], ax
9:7780  668b560c             mov edx, dword ptr [bp + 0xc]
9:7784  662689576a           mov dword ptr es:[bx + 0x6a], edx
9:7789  8b560a               mov dx, word ptr [bp + 0xa]
9:778C  2689576e             mov word ptr es:[bx + 0x6e], dx
9:7790  6626c7477000000000   mov dword ptr es:[bx + 0x70], 0
9:7799  26894f74             mov word ptr es:[bx + 0x74], cx
9:779D  26894776             mov word ptr es:[bx + 0x76], ax
9:77A1  26894f78             mov word ptr es:[bx + 0x78], cx
9:77A5  2689878a00           mov word ptr es:[bx + 0x8a], ax
9:77AA  2689878c00           mov word ptr es:[bx + 0x8c], ax
9:77AF  26c7070c84           mov word ptr es:[bx], 0x840c
9:77B4  26c74702a676         mov word ptr es:[bx + 2], 0x76a6  ; SEGMENT s9:0000
9:77BA  1e                   push ds
9:77BB  68b05d               push 0x5db0
9:77BE  8d4710               lea ax, [bx + 0x10]
9:77C1  06                   push es
9:77C2  50                   push ax
9:77C3  9a3e3ddd77           lcall 0x77dd, 0x3d3e  ; _fstrcpy@s1:3D3E
9:77C8  83c408               add sp, 8
9:77CB  666800000800         push 0x80000
9:77D1  668b4606             mov eax, dword ptr [bp + 6]
9:77D5  057a00               add ax, 0x7a
9:77D8  6650                 push eax
9:77DA  9a0649f477           lcall 0x77f4, 0x4906  ; _fmemset@s1:4906
9:77DF  83c408               add sp, 8
9:77E2  666800000800         push 0x80000
9:77E8  668b4606             mov eax, dword ptr [bp + 6]
9:77EC  058200               add ax, 0x82
9:77EF  6650                 push eax
9:77F1  9a06499876           lcall 0x7698, 0x4906  ; _fmemset@s1:4906
9:77F6  83c408               add sp, 8
9:77F9  6a04                 push 4
9:77FB  9a0a780000           lcall 0, 0x780a  ; USER.GetSystemMetrics
9:7800  c45e06               les bx, ptr [bp + 6]
9:7803  26894762             mov word ptr es:[bx + 0x62], ax
9:7807  6a05                 push 5
9:7809  9a18780000           lcall 0, 0x7818  ; USER.GetSystemMetrics
9:780E  c45e06               les bx, ptr [bp + 6]
9:7811  26894764             mov word ptr es:[bx + 0x64], ax
9:7815  6a06                 push 6
9:7817  9ac35a0000           lcall 0, 0x5ac3  ; USER.GetSystemMetrics
9:781C  c45e06               les bx, ptr [bp + 6]
9:781F  26894766             mov word ptr es:[bx + 0x66], ax
9:7823  8bc3                 mov ax, bx
9:7825  8cc2                 mov dx, es
9:7827  5e                   pop si
9:7828  c9                   leave
9:7829  ca0e00               retf 0xe

; ---------------- OPDialog::~OPDialog@s9:782C FAR size=178 callers=35
;   apis: GDI.DeleteObject, USER.DestroyMenu, USER.RemoveProp
;   removes the window properties (thisLo/thisHi/procLo/procHi)
9:782C  c8100000             enter 0x10, 0
9:7830  56                   push si
9:7831  c45e06               les bx, ptr [bp + 6]
9:7834  26c7070c84           mov word ptr es:[bx], 0x840c
9:7839  26c74702b877         mov word ptr es:[bx + 2], 0x77b8  ; SEGMENT s9:0000
9:783F  268b4770             mov ax, word ptr es:[bx + 0x70]
9:7843  268b5772             mov dx, word ptr es:[bx + 0x72]
9:7847  8bda                 mov bx, dx
9:7849  0bd0                 or dx, ax
9:784B  740e                 je 0x785b
9:784D  6a01                 push 1
9:784F  53                   push bx
9:7850  50                   push ax
9:7851  8ec3                 mov es, bx
9:7853  8bf0                 mov si, ax
9:7855  26c41c               les bx, ptr es:[si]
9:7858  26ff1f               lcall es:[bx]
loc_785B:
9:785B  c45e06               les bx, ptr [bp + 6]
9:785E  26837f0400           cmp word ptr es:[bx + 4], 0
9:7863  7412                 je 0x7877
9:7865  26ff7704             push word ptr es:[bx + 4]
9:7869  9aa55c0000           lcall 0, 0x5ca5  ; GDI.DeleteObject
9:786E  c45e06               les bx, ptr [bp + 6]
9:7871  26c747040000         mov word ptr es:[bx + 4], 0
loc_7877:
9:7877  c45e06               les bx, ptr [bp + 6]
9:787A  26837f6800           cmp word ptr es:[bx + 0x68], 0
9:787F  7409                 je 0x788a
9:7881  26ff7768             push word ptr es:[bx + 0x68]
9:7885  9affff0000           lcall 0, 0xffff  ; USER.DestroyMenu
loc_788A:
9:788A  c45e06               les bx, ptr [bp + 6]
9:788D  26ff7706             push word ptr es:[bx + 6]
9:7891  1e                   push ds
9:7892  68b15d               push 0x5db1  ; 'thisLo'
9:7895  9aa6780000           lcall 0, 0x78a6  ; USER.RemoveProp
9:789A  c45e06               les bx, ptr [bp + 6]
9:789D  26ff7706             push word ptr es:[bx + 6]
9:78A1  1e                   push ds
9:78A2  68b85d               push 0x5db8  ; 'thisHi'
9:78A5  9ab6780000           lcall 0, 0x78b6  ; USER.RemoveProp
9:78AA  c45e06               les bx, ptr [bp + 6]
9:78AD  26ff7706             push word ptr es:[bx + 6]
9:78B1  1e                   push ds
9:78B2  68bf5d               push 0x5dbf  ; 'procLo'
9:78B5  9ac6780000           lcall 0, 0x78c6  ; USER.RemoveProp
9:78BA  c45e06               les bx, ptr [bp + 6]
9:78BD  26ff7706             push word ptr es:[bx + 6]
9:78C1  1e                   push ds
9:78C2  68c65d               push 0x5dc6  ; 'procHi'
9:78C5  9affff0000           lcall 0, 0xffff  ; USER.RemoveProp
9:78CA  c45e06               les bx, ptr [bp + 6]
9:78CD  26c7079a38           mov word ptr es:[bx], 0x389a
9:78D2  26c747023977         mov word ptr es:[bx + 2], 0x7739  ; SEGMENT s2:0000
9:78D8  5e                   pop si
9:78D9  c9                   leave
9:78DA  ca0400               retf 4
9:78DD  db 00

; ---------------- OPDialog::nop@s9:78DE FAR size=4 callers=2
;   empty virtual (vslot 20)
9:78DE  ca0400               retf 4
9:78E1  db 00

; ---------------- OPDialog::create@s9:78E2 FAR size=222 callers=41
;   apis: USER.CreateDialog, USER.GetWindowLong, USER.GetWindowText, USER.SetProp, USER.SetWindowLong
;   (vslot 2) CreateDialog and the this-pointer properties
9:78E2  c80c0000             enter 0xc, 0
9:78E6  57                   push di
9:78E7  c45e06               les bx, ptr [bp + 6]
9:78EA  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
9:78F0  740a                 je 0x78fc
9:78F2  268b470c             mov ax, word ptr es:[bx + 0xc]
9:78F6  268b570e             mov dx, word ptr es:[bx + 0xe]
9:78FA  eb0c                 jmp 0x7908
loc_78FC:
9:78FC  c41ec85b             les bx, ptr [0x5bc8]
9:7900  268b4704             mov ax, word ptr es:[bx + 4]
9:7904  268b5706             mov dx, word ptr es:[bx + 6]
loc_7908:
9:7908  8946fc               mov word ptr [bp - 4], ax
9:790B  8956fe               mov word ptr [bp - 2], dx
9:790E  ff368c03             push word ptr [0x38c]
9:7912  c45e06               les bx, ptr [bp + 6]
9:7915  2bd2                 sub dx, dx
9:7917  268b470a             mov ax, word ptr es:[bx + 0xa]
9:791B  52                   push dx
9:791C  50                   push ax
9:791D  26ff7708             push word ptr es:[bx + 8]
9:7921  66ff76fc             push dword ptr [bp - 4]
9:7925  9affff0000           lcall 0, 0xffff  ; USER.CreateDialog
9:792A  c45e06               les bx, ptr [bp + 6]
9:792D  26894706             mov word ptr es:[bx + 6], ax
9:7931  50                   push ax
9:7932  8d4710               lea ax, [bx + 0x10]
9:7935  06                   push es
9:7936  50                   push ax
9:7937  6a50                 push 0x50
9:7939  9a533b0000           lcall 0, 0x3b53  ; USER.GetWindowText
9:793E  c45e06               les bx, ptr [bp + 6]
9:7941  26ff7706             push word ptr es:[bx + 6]
9:7945  6afc                 push -4
9:7947  9affff0000           lcall 0, 0xffff  ; USER.GetWindowLong
9:794C  8946f8               mov word ptr [bp - 8], ax
9:794F  8956fa               mov word ptr [bp - 6], dx
9:7952  c45e06               les bx, ptr [bp + 6]
9:7955  26ff7706             push word ptr es:[bx + 6]
9:7959  6afc                 push -4
9:795B  66ff36cc5b           push dword ptr [0x5bcc]
9:7960  9affff0000           lcall 0, 0xffff  ; USER.SetWindowLong
9:7965  c45e06               les bx, ptr [bp + 6]
9:7968  26ff7706             push word ptr es:[bx + 6]
9:796C  1e                   push ds
9:796D  68cd5d               push 0x5dcd  ; 'thisLo'
9:7970  53                   push bx
9:7971  8cc7                 mov di, es
9:7973  9a85790000           lcall 0, 0x7985  ; USER.SetProp
9:7978  c45e06               les bx, ptr [bp + 6]
9:797B  26ff7706             push word ptr es:[bx + 6]
9:797F  1e                   push ds
9:7980  68d45d               push 0x5dd4  ; 'thisHi'
9:7983  57                   push di
9:7984  9a98790000           lcall 0, 0x7998  ; USER.SetProp
9:7989  c45e06               les bx, ptr [bp + 6]
9:798C  26ff7706             push word ptr es:[bx + 6]
9:7990  1e                   push ds
9:7991  68db5d               push 0x5ddb  ; 'procLo'
9:7994  ff76f8               push word ptr [bp - 8]
9:7997  9aab790000           lcall 0, 0x79ab  ; USER.SetProp
9:799C  c45e06               les bx, ptr [bp + 6]
9:799F  26ff7706             push word ptr es:[bx + 6]
9:79A3  1e                   push ds
9:79A4  68e25d               push 0x5de2  ; 'procHi'
9:79A7  ff76fa               push word ptr [bp - 6]
9:79AA  9affff0000           lcall 0, 0xffff  ; USER.SetProp
9:79AF  c45e06               les bx, ptr [bp + 6]
9:79B2  06                   push es
9:79B3  53                   push bx
9:79B4  26c41f               les bx, ptr es:[bx]
9:79B7  26ff5f50             lcall es:[bx + 0x50]
9:79BB  5f                   pop di
9:79BC  c9                   leave
9:79BD  ca0400               retf 4

; ---------------- OPDialog::dlgProc@s9:79C0 FAR size=380 callers=1
;   (vslot 3) dispatches dialog messages
9:79C0  c8020000             enter 2, 0
9:79C4  c746fe0100           mov word ptr [bp - 2], 1
9:79C9  8b4610               mov ax, word ptr [bp + 0x10]
9:79CC  3da100               cmp ax, 0xa1
9:79CF  0f841701             je 0x7aea
9:79D3  0f872901             ja 0x7b00
9:79D7  3d8500               cmp ax, 0x85
9:79DA  0f84b200             je 0x7a90
9:79DE  0f873301             ja 0x7b15
9:79E2  2c02                 sub al, 2
9:79E4  0f849800             je 0x7a80
9:79E8  2c0a                 sub al, 0xa
9:79EA  0f84b200             je 0x7aa0
9:79EE  2c03                 sub al, 3
9:79F0  743a                 je 0x7a2c
9:79F2  2c1c                 sub al, 0x1c
9:79F4  0f84bc00             je 0x7ab4
9:79F8  e91a01               jmp 0x7b15
9:79FB  db 90
loc_79FC:
9:79FC  66ff760c             push dword ptr [bp + 0xc]
9:7A00  ff760a               push word ptr [bp + 0xa]
9:7A03  c45e06               les bx, ptr [bp + 6]
9:7A06  06                   push es
9:7A07  53                   push bx
9:7A08  26c41f               les bx, ptr es:[bx]
9:7A0B  26ff5f58             lcall es:[bx + 0x58]
loc_7A0F:
9:7A0F  8946fe               mov word ptr [bp - 2], ax
9:7A12  e91f01               jmp 0x7b34
9:7A15  db 90
loc_7A16:
9:7A16  66ff760c             push dword ptr [bp + 0xc]
9:7A1A  ff760a               push word ptr [bp + 0xa]
9:7A1D  c45e06               les bx, ptr [bp + 6]
9:7A20  06                   push es
9:7A21  53                   push bx
9:7A22  26c41f               les bx, ptr es:[bx]
9:7A25  26ff5f54             lcall es:[bx + 0x54]
9:7A29  ebe4                 jmp 0x7a0f
9:7A2B  db 90
loc_7A2C:
9:7A2C  c45e06               les bx, ptr [bp + 6]
9:7A2F  06                   push es
9:7A30  53                   push bx
9:7A31  26c41f               les bx, ptr es:[bx]
9:7A34  26ff5f60             lcall es:[bx + 0x60]
9:7A38  ebd5                 jmp 0x7a0f
loc_7A3A:
9:7A3A  66ff760c             push dword ptr [bp + 0xc]
9:7A3E  ff760a               push word ptr [bp + 0xa]
9:7A41  c45e06               les bx, ptr [bp + 6]
9:7A44  06                   push es
9:7A45  53                   push bx
9:7A46  26c41f               les bx, ptr es:[bx]
9:7A49  26ff5f30             lcall es:[bx + 0x30]
9:7A4D  ebc0                 jmp 0x7a0f
9:7A4F  db 90
loc_7A50:
9:7A50  ff760e               push word ptr [bp + 0xe]
9:7A53  ff760a               push word ptr [bp + 0xa]
9:7A56  ff760c               push word ptr [bp + 0xc]
9:7A59  c45e06               les bx, ptr [bp + 6]
9:7A5C  06                   push es
9:7A5D  53                   push bx
9:7A5E  26c41f               les bx, ptr es:[bx]
9:7A61  26ff5f28             lcall es:[bx + 0x28]
9:7A65  e9cc00               jmp 0x7b34
loc_7A68:
9:7A68  ff760e               push word ptr [bp + 0xe]
9:7A6B  ff760a               push word ptr [bp + 0xa]
9:7A6E  ff760c               push word ptr [bp + 0xc]
9:7A71  c45e06               les bx, ptr [bp + 6]
9:7A74  06                   push es
9:7A75  53                   push bx
9:7A76  26c41f               les bx, ptr es:[bx]
9:7A79  26ff5f44             lcall es:[bx + 0x44]
9:7A7D  e9b400               jmp 0x7b34
loc_7A80:
9:7A80  c45e06               les bx, ptr [bp + 6]
9:7A83  06                   push es
9:7A84  53                   push bx
9:7A85  26c41f               les bx, ptr es:[bx]
9:7A88  26ff5f24             lcall es:[bx + 0x24]
9:7A8C  e9a500               jmp 0x7b34
9:7A8F  db 90
loc_7A90:
9:7A90  c45e06               les bx, ptr [bp + 6]
9:7A93  06                   push es
9:7A94  53                   push bx
9:7A95  26c41f               les bx, ptr es:[bx]
9:7A98  26ff5f1c             lcall es:[bx + 0x1c]
9:7A9C  e99500               jmp 0x7b34
9:7A9F  db 90
loc_7AA0:
9:7AA0  66ff760a             push dword ptr [bp + 0xa]
9:7AA4  c45e06               les bx, ptr [bp + 6]
9:7AA7  06                   push es
9:7AA8  53                   push bx
9:7AA9  26c41f               les bx, ptr es:[bx]
9:7AAC  26ff5f18             lcall es:[bx + 0x18]
9:7AB0  e98100               jmp 0x7b34
9:7AB3  db 90
loc_7AB4:
9:7AB4  8b4e0c               mov cx, word ptr [bp + 0xc]
9:7AB7  8b5e0a               mov bx, word ptr [bp + 0xa]
9:7ABA  8ec1                 mov es, cx
9:7ABC  26833f04             cmp word ptr es:[bx], 4
9:7AC0  7572                 jne 0x7b34
9:7AC2  51                   push cx
9:7AC3  53                   push bx
9:7AC4  90                   nop
9:7AC5  0e                   push cs
9:7AC6  e89d1a               call 0x9566  ; objectFromHwnd@s9:9566
9:7AC9  83c404               add sp, 4
9:7ACC  b80100               mov ax, 1
9:7ACF  c9                   leave
9:7AD0  ca0c00               retf 0xc
9:7AD3  db 90
loc_7AD4:
9:7AD4  66ff760c             push dword ptr [bp + 0xc]
9:7AD8  ff760a               push word ptr [bp + 0xa]
9:7ADB  c45e06               les bx, ptr [bp + 6]
9:7ADE  06                   push es
9:7ADF  53                   push bx
9:7AE0  26c41f               les bx, ptr es:[bx]
9:7AE3  26ff5f10             lcall es:[bx + 0x10]
9:7AE7  e925ff               jmp 0x7a0f
loc_7AEA:
9:7AEA  66ff760c             push dword ptr [bp + 0xc]
9:7AEE  ff760a               push word ptr [bp + 0xa]
9:7AF1  c45e06               les bx, ptr [bp + 6]
9:7AF4  06                   push es
9:7AF5  53                   push bx
9:7AF6  26c41f               les bx, ptr es:[bx]
9:7AF9  26ff5f38             lcall es:[bx + 0x38]
9:7AFD  e90fff               jmp 0x7a0f
loc_7B00:
9:7B00  3d1401               cmp ax, 0x114
9:7B03  0f84f5fe             je 0x79fc
9:7B07  7713                 ja 0x7b1c
9:7B09  2d0401               sub ax, 0x104
9:7B0C  0f842aff             je 0x7a3a
9:7B10  2d0d00               sub ax, 0xd
9:7B13  74bf                 je 0x7ad4
loc_7B15:
9:7B15  c746fe0000           mov word ptr [bp - 2], 0
9:7B1A  eb18                 jmp 0x7b34
loc_7B1C:
9:7B1C  2d1501               sub ax, 0x115
9:7B1F  0f84f3fe             je 0x7a16
9:7B23  2dec00               sub ax, 0xec
9:7B26  0f843eff             je 0x7a68
9:7B2A  2d0300               sub ax, 3
9:7B2D  0f841fff             je 0x7a50
9:7B31  ebe2                 jmp 0x7b15
9:7B33  db 90
loc_7B34:
9:7B34  8b46fe               mov ax, word ptr [bp - 2]
9:7B37  c9                   leave
9:7B38  ca0c00               retf 0xc
9:7B3B  db 00

; ---------------- OPDialog::onCommand@s9:7B3C FAR size=92 callers=23
;   apis: USER.PostMessage
;   (vslot 4) default commands (OK/Cancel/help)
9:7B3C  55                   push bp
9:7B3D  8bec                 mov bp, sp
9:7B3F  8b460e               mov ax, word ptr [bp + 0xe]
9:7B42  48                   dec ax
9:7B43  7415                 je 0x7b5a
9:7B45  48                   dec ax
9:7B46  7426                 je 0x7b6e
9:7B48  2d6d00               sub ax, 0x6d
9:7B4B  7425                 je 0x7b72
9:7B4D  2dbf00               sub ax, 0xbf
9:7B50  742e                 je 0x7b80
9:7B52  33c0                 xor ax, ax
loc_7B54:
9:7B54  33d2                 xor dx, dx
9:7B56  c9                   leave
9:7B57  ca0a00               retf 0xa
loc_7B5A:
9:7B5A  6a01                 push 1
loc_7B5C:
9:7B5C  c45e06               les bx, ptr [bp + 6]
9:7B5F  06                   push es
9:7B60  53                   push bx
9:7B61  26c41f               les bx, ptr es:[bx]
9:7B64  26ff5f14             lcall es:[bx + 0x14]
loc_7B68:
9:7B68  b80100               mov ax, 1
9:7B6B  ebe7                 jmp 0x7b54
9:7B6D  db 90
loc_7B6E:
9:7B6E  6a00                 push 0
9:7B70  ebea                 jmp 0x7b5c
loc_7B72:
9:7B72  c45e06               les bx, ptr [bp + 6]
9:7B75  06                   push es
9:7B76  53                   push bx
9:7B77  26c41f               les bx, ptr es:[bx]
9:7B7A  26ff5f2c             lcall es:[bx + 0x2c]
9:7B7E  ebe8                 jmp 0x7b68
loc_7B80:
9:7B80  c45e06               les bx, ptr [bp + 6]
9:7B83  26ff7706             push word ptr es:[bx + 6]
9:7B87  666860f01201         push 0x112f060
9:7B8D  666a00               push 0
9:7B90  9a91750000           lcall 0, 0x7591  ; USER.PostMessage
9:7B95  ebd1                 jmp 0x7b68
9:7B97  db 00

; ---------------- OPDialog::close@s9:7B98 FAR size=26 callers=10
;   apis: USER.DestroyWindow
;   (vslot 5) DestroyWindow unless modal
9:7B98  55                   push bp
9:7B99  8bec                 mov bp, sp
9:7B9B  c45e06               les bx, ptr [bp + 6]
9:7B9E  26837f7400           cmp word ptr es:[bx + 0x74], 0
9:7BA3  7509                 jne 0x7bae
9:7BA5  26ff7706             push word ptr es:[bx + 6]
9:7BA9  9a46750000           lcall 0, 0x7546  ; USER.DestroyWindow
loc_7BAE:
9:7BAE  c9                   leave
9:7BAF  ca0600               retf 6

; ---------------- OPDialog::ncPaint@s9:7BB2 size=684 callers=0
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.GetStockObject, GDI.GetTextExtent, GDI.LineTo, GDI.MoveTo, GDI.SelectObject, GDI.SetBkColor, GDI.SetTextColor, GDI.TextOut, KERNEL.lstrlen, USER.FillRect, USER.GetProp, USER.GetWindowDC, USER.GetWindowLong, USER.GetWindowRect, USER.IsIconic, USER.ReleaseDC, USER.SelectPalette
;   (vslot 7) the game's own caption
9:7BB2  c8320000             enter 0x32, 0
9:7BB6  56                   push si
9:7BB7  c45e06               les bx, ptr [bp + 6]
9:7BBA  26ff7706             push word ptr es:[bx + 6]
9:7BBE  9affff0000           lcall 0, 0xffff  ; USER.IsIconic
9:7BC3  0bc0                 or ax, ax
9:7BC5  0f858f02             jne 0x7e58
9:7BC9  c45e06               les bx, ptr [bp + 6]
9:7BCC  26ff7706             push word ptr es:[bx + 6]
9:7BD0  9affff0000           lcall 0, 0xffff  ; USER.GetWindowDC
9:7BD5  8946fe               mov word ptr [bp - 2], ax
9:7BD8  c45e06               les bx, ptr [bp + 6]
9:7BDB  26ff776e             push word ptr es:[bx + 0x6e]
9:7BDF  06                   push es
9:7BE0  53                   push bx
9:7BE1  26c41f               les bx, ptr es:[bx]
9:7BE4  26ff5f68             lcall es:[bx + 0x68]
9:7BE8  8946fa               mov word ptr [bp - 6], ax
9:7BEB  8956fc               mov word ptr [bp - 4], dx
9:7BEE  0bd0                 or dx, ax
9:7BF0  7514                 jne 0x7c06
loc_7BF2:
9:7BF2  c45e06               les bx, ptr [bp + 6]
9:7BF5  26ff7706             push word ptr es:[bx + 6]
9:7BF9  ff76fe               push word ptr [bp - 2]
9:7BFC  9afb720000           lcall 0, 0x72fb  ; USER.ReleaseDC
9:7C01  5e                   pop si
9:7C02  c9                   leave
9:7C03  ca0400               retf 4
loc_7C06:
9:7C06  8d46fe               lea ax, [bp - 2]
9:7C09  16                   push ss
9:7C0A  50                   push ax
9:7C0B  66ff76fa             push dword ptr [bp - 6]
9:7C0F  9a084ed678           lcall 0x78d6, 0x4e08  ; Palette::selectAndRealize@s2:4E08
9:7C14  8946f8               mov word ptr [bp - 8], ax
9:7C17  c45e06               les bx, ptr [bp + 6]
9:7C1A  26ff7706             push word ptr es:[bx + 6]
9:7C1E  8d46f0               lea ax, [bp - 0x10]
9:7C21  16                   push ss
9:7C22  50                   push ax
9:7C23  9a195a0000           lcall 0, 0x5a19  ; USER.GetWindowRect
9:7C28  8b46f4               mov ax, word ptr [bp - 0xc]
9:7C2B  2b46f0               sub ax, word ptr [bp - 0x10]
9:7C2E  48                   dec ax
9:7C2F  8946ee               mov word ptr [bp - 0x12], ax
9:7C32  8b46f6               mov ax, word ptr [bp - 0xa]
9:7C35  2b46f2               sub ax, word ptr [bp - 0xe]
9:7C38  48                   dec ax
9:7C39  8946ec               mov word ptr [bp - 0x14], ax
9:7C3C  666a00               push 0
9:7C3F  c45e06               les bx, ptr [bp + 6]
9:7C42  26837f6001           cmp word ptr es:[bx + 0x60], 1
9:7C47  1bc0                 sbb ax, ax
9:7C49  251e00               and ax, 0x1e
9:7C4C  052500               add ax, 0x25
9:7C4F  8946ea               mov word ptr [bp - 0x16], ax
9:7C52  680001               push 0x100
9:7C55  50                   push ax
9:7C56  9a6e5b0000           lcall 0, 0x5b6e  ; GDI.CreatePen
9:7C5B  8946e8               mov word ptr [bp - 0x18], ax
9:7C5E  ff76fe               push word ptr [bp - 2]
9:7C61  50                   push ax
9:7C62  9a777d0000           lcall 0, 0x7d77  ; GDI.SelectObject
9:7C67  8946e6               mov word ptr [bp - 0x1a], ax
9:7C6A  ff76fe               push word ptr [bp - 2]
9:7C6D  666a00               push 0
9:7C70  9ae07c0000           lcall 0, 0x7ce0  ; GDI.MoveTo
9:7C75  ff76fe               push word ptr [bp - 2]
9:7C78  ff76ee               push word ptr [bp - 0x12]
9:7C7B  6a00                 push 0
9:7C7D  9a8a7c0000           lcall 0, 0x7c8a  ; GDI.LineTo
9:7C82  ff76fe               push word ptr [bp - 2]
9:7C85  66ff76ec             push dword ptr [bp - 0x14]
9:7C89  9a977c0000           lcall 0, 0x7c97  ; GDI.LineTo
9:7C8E  ff76fe               push word ptr [bp - 2]
9:7C91  6a00                 push 0
9:7C93  ff76ec               push word ptr [bp - 0x14]
9:7C96  9aa27c0000           lcall 0, 0x7ca2  ; GDI.LineTo
9:7C9B  ff76fe               push word ptr [bp - 2]
9:7C9E  666a00               push 0
9:7CA1  9aee7c0000           lcall 0, 0x7cee  ; GDI.LineTo
9:7CA6  c45e06               les bx, ptr [bp + 6]
9:7CA9  26ff7706             push word ptr es:[bx + 6]
9:7CAD  6af0                 push -0x10
9:7CAF  9a48790000           lcall 0, 0x7948  ; USER.GetWindowLong
9:7CB4  8946e2               mov word ptr [bp - 0x1e], ax
9:7CB7  8956e4               mov word ptr [bp - 0x1c], dx
9:7CBA  f7c28000             test dx, 0x80
9:7CBE  0f845601             je 0x7e18
9:7CC2  f746e44000           test word ptr [bp - 0x1c], 0x40
9:7CC7  0f844d01             je 0x7e18
9:7CCB  c45e06               les bx, ptr [bp + 6]
9:7CCE  268b4762             mov ax, word ptr es:[bx + 0x62]
9:7CD2  262b4766             sub ax, word ptr es:[bx + 0x66]
9:7CD6  8946e0               mov word ptr [bp - 0x20], ax
9:7CD9  ff76fe               push word ptr [bp - 2]
9:7CDC  6a00                 push 0
9:7CDE  50                   push ax
9:7CDF  9ae55b0000           lcall 0, 0x5be5  ; GDI.MoveTo
9:7CE4  ff76fe               push word ptr [bp - 2]
9:7CE7  ff76ee               push word ptr [bp - 0x12]
9:7CEA  ff76e0               push word ptr [bp - 0x20]
9:7CED  9a055c0000           lcall 0, 0x5c05  ; GDI.LineTo
9:7CF2  c45e06               les bx, ptr [bp + 6]
9:7CF5  268b4764             mov ax, word ptr es:[bx + 0x64]
9:7CF9  2689477a             mov word ptr es:[bx + 0x7a], ax
9:7CFD  268b4766             mov ax, word ptr es:[bx + 0x66]
9:7D01  2689477c             mov word ptr es:[bx + 0x7c], ax
9:7D05  8b46ee               mov ax, word ptr [bp - 0x12]
9:7D08  2689477e             mov word ptr es:[bx + 0x7e], ax
9:7D0C  268b4762             mov ax, word ptr es:[bx + 0x62]
9:7D10  262b4766             sub ax, word ptr es:[bx + 0x66]
9:7D14  2689878000           mov word ptr es:[bx + 0x80], ax
9:7D19  ff76fe               push word ptr [bp - 2]
9:7D1C  8d477a               lea ax, [bx + 0x7a]
9:7D1F  06                   push es
9:7D20  50                   push ax
9:7D21  6a04                 push 4
9:7D23  9ac70c0000           lcall 0, 0xcc7  ; GDI.GetStockObject
9:7D28  50                   push ax
9:7D29  9affff0000           lcall 0, 0xffff  ; USER.FillRect
9:7D2E  c45e06               les bx, ptr [bp + 6]
9:7D31  26837f7600           cmp word ptr es:[bx + 0x76], 0
9:7D36  740a                 je 0x7d42
9:7D38  ff76fe               push word ptr [bp - 2]
9:7D3B  06                   push es
9:7D3C  53                   push bx
9:7D3D  90                   nop
9:7D3E  0e                   push cs
9:7D3F  e8ac05               call 0x82ee  ; OPDialog::drawFrame@s9:82EE
loc_7D42:
9:7D42  c45e06               les bx, ptr [bp + 6]
9:7D45  83c310               add bx, 0x10
9:7D48  895edc               mov word ptr [bp - 0x24], bx
9:7D4B  8c46de               mov word ptr [bp - 0x22], es
9:7D4E  26803f00             cmp byte ptr es:[bx], 0
9:7D52  0f84c200             je 0x7e18
9:7D56  c746d80000           mov word ptr [bp - 0x28], 0
9:7D5B  8b5e06               mov bx, word ptr [bp + 6]
9:7D5E  26ff7706             push word ptr es:[bx + 6]
9:7D62  1e                   push ds
9:7D63  68e95d               push 0x5de9  ; 'hfont'
9:7D66  9a8c220000           lcall 0, 0x228c  ; USER.GetProp
9:7D6B  8946da               mov word ptr [bp - 0x26], ax
9:7D6E  0bc0                 or ax, ax
9:7D70  740c                 je 0x7d7e
9:7D72  ff76fe               push word ptr [bp - 2]
9:7D75  50                   push ax
9:7D76  9a147e0000           lcall 0, 0x7e14  ; GDI.SelectObject
9:7D7B  8946d8               mov word ptr [bp - 0x28], ax
loc_7D7E:
9:7D7E  ff76fe               push word ptr [bp - 2]
9:7D81  666a00               push 0
9:7D84  9a7d280000           lcall 0, 0x287d  ; GDI.SetBkColor
9:7D89  ff76fe               push word ptr [bp - 2]
9:7D8C  680001               push 0x100
9:7D8F  ff76ea               push word ptr [bp - 0x16]
9:7D92  9a6f280000           lcall 0, 0x286f  ; GDI.SetTextColor
9:7D97  66ff76dc             push dword ptr [bp - 0x24]
9:7D9B  9affff0000           lcall 0, 0xffff  ; KERNEL.lstrlen
9:7DA0  8946d6               mov word ptr [bp - 0x2a], ax
9:7DA3  ff76fe               push word ptr [bp - 2]
9:7DA6  66ff76dc             push dword ptr [bp - 0x24]
9:7DAA  50                   push ax
9:7DAB  9a83720000           lcall 0, 0x7283  ; GDI.GetTextExtent
9:7DB0  8946d2               mov word ptr [bp - 0x2e], ax
9:7DB3  8956d4               mov word ptr [bp - 0x2c], dx
9:7DB6  8946d0               mov word ptr [bp - 0x30], ax
9:7DB9  8bca                 mov cx, dx
9:7DBB  8956ce               mov word ptr [bp - 0x32], dx
9:7DBE  ff76fe               push word ptr [bp - 2]
9:7DC1  99                   cdq
9:7DC2  2bc2                 sub ax, dx
9:7DC4  d1f8                 sar ax, 1
9:7DC6  c45e06               les bx, ptr [bp + 6]
9:7DC9  8bd0                 mov dx, ax
9:7DCB  268b477e             mov ax, word ptr es:[bx + 0x7e]
9:7DCF  262b477a             sub ax, word ptr es:[bx + 0x7a]
9:7DD3  8bf2                 mov si, dx
9:7DD5  99                   cdq
9:7DD6  2bc2                 sub ax, dx
9:7DD8  d1f8                 sar ax, 1
9:7DDA  2bc6                 sub ax, si
9:7DDC  2603477a             add ax, word ptr es:[bx + 0x7a]
9:7DE0  50                   push ax
9:7DE1  8bc1                 mov ax, cx
9:7DE3  99                   cdq
9:7DE4  2bc2                 sub ax, dx
9:7DE6  d1f8                 sar ax, 1
9:7DE8  8bc8                 mov cx, ax
9:7DEA  268b878000           mov ax, word ptr es:[bx + 0x80]
9:7DEF  262b477c             sub ax, word ptr es:[bx + 0x7c]
9:7DF3  99                   cdq
9:7DF4  2bc2                 sub ax, dx
9:7DF6  d1f8                 sar ax, 1
9:7DF8  2bc1                 sub ax, cx
9:7DFA  50                   push ax
9:7DFB  66ff76dc             push dword ptr [bp - 0x24]
9:7DFF  ff76d6               push word ptr [bp - 0x2a]
9:7E02  9affff0000           lcall 0, 0xffff  ; GDI.TextOut
9:7E07  837eda00             cmp word ptr [bp - 0x26], 0
9:7E0B  740b                 je 0x7e18
9:7E0D  ff76fe               push word ptr [bp - 2]
9:7E10  ff76d8               push word ptr [bp - 0x28]
9:7E13  9a487e0000           lcall 0, 0x7e48  ; GDI.SelectObject
loc_7E18:
9:7E18  66ff76fc             push dword ptr [bp - 4]
9:7E1C  ff76fa               push word ptr [bp - 6]
9:7E1F  c45e06               les bx, ptr [bp + 6]
9:7E22  06                   push es
9:7E23  53                   push bx
9:7E24  26c41f               les bx, ptr es:[bx]
9:7E27  26ff5f64             lcall es:[bx + 0x64]
9:7E2B  ff76fe               push word ptr [bp - 2]
9:7E2E  ff76f8               push word ptr [bp - 8]
9:7E31  6a00                 push 0
9:7E33  9ab25c0000           lcall 0, 0x5cb2  ; USER.SelectPalette
9:7E38  8946f8               mov word ptr [bp - 8], ax
9:7E3B  50                   push ax
9:7E3C  9a507e0000           lcall 0, 0x7e50  ; GDI.DeleteObject
9:7E41  ff76fe               push word ptr [bp - 2]
9:7E44  ff76e6               push word ptr [bp - 0x1a]
9:7E47  9a7a5b0000           lcall 0, 0x5b7a  ; GDI.SelectObject
9:7E4C  ff76e8               push word ptr [bp - 0x18]
9:7E4F  9a6a780000           lcall 0, 0x786a  ; GDI.DeleteObject
9:7E54  e99bfd               jmp 0x7bf2
9:7E57  db 90
loc_7E58:
9:7E58  5e                   pop si
9:7E59  c9                   leave
9:7E5A  ca0400               retf 4
9:7E5D  db 00

; ---------------- OPDialog::onCtlColor@s9:7E5E FAR size=190 callers=0
;   apis: GDI.GetStockObject, GDI.SetBkColor, GDI.SetTextColor, USER.GetDlgCtrlID
;   (vslot 13)
9:7E5E  c80a0000             enter 0xa, 0
9:7E62  6a04                 push 4
9:7E64  9a247d0000           lcall 0, 0x7d24  ; GDI.GetStockObject
9:7E69  8946fe               mov word ptr [bp - 2], ax
9:7E6C  66833ef05d00         cmp dword ptr [0x5df0], 0
9:7E72  754e                 jne 0x7ec2
9:7E74  c45e06               les bx, ptr [bp + 6]
9:7E77  26ff776e             push word ptr es:[bx + 0x6e]
9:7E7B  06                   push es
9:7E7C  53                   push bx
9:7E7D  26c41f               les bx, ptr es:[bx]
9:7E80  26ff5f68             lcall es:[bx + 0x68]
9:7E84  8956fc               mov word ptr [bp - 4], dx
9:7E87  0bd0                 or dx, ax
9:7E89  7507                 jne 0x7e92
loc_7E8B:
9:7E8B  33c0                 xor ax, ax
9:7E8D  99                   cdq
9:7E8E  c9                   leave
9:7E8F  ca0a00               retf 0xa
loc_7E92:
9:7E92  ff76fc               push word ptr [bp - 4]
9:7E95  50                   push ax
9:7E96  9a724d127c           lcall 0x7c12, 0x4d72  ; MemBlock::data@s2:4D72
9:7E9B  8946f6               mov word ptr [bp - 0xa], ax
9:7E9E  8956f8               mov word ptr [bp - 8], dx
9:7EA1  c45ef6               les bx, ptr [bp - 0xa]
9:7EA4  2ac0                 sub al, al
9:7EA6  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:7EAB  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:7EB0  2aed                 sub ch, ch
9:7EB2  0bc1                 or ax, cx
9:7EB4  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:7EB9  b502                 mov ch, 2
9:7EBB  a3f05d               mov word ptr [0x5df0], ax
9:7EBE  890ef25d             mov word ptr [0x5df2], cx
loc_7EC2:
9:7EC2  8b460c               mov ax, word ptr [bp + 0xc]
9:7EC5  2d0500               sub ax, 5
9:7EC8  762e                 jbe 0x7ef8
9:7ECA  48                   dec ax
9:7ECB  75be                 jne 0x7e8b
9:7ECD  ff760a               push word ptr [bp + 0xa]
9:7ED0  9a46280000           lcall 0, 0x2846  ; USER.GetDlgCtrlID
9:7ED5  8946f6               mov word ptr [bp - 0xa], ax
9:7ED8  3d4c01               cmp ax, 0x14c
9:7EDB  750b                 jne 0x7ee8
9:7EDD  ff760e               push word ptr [bp + 0xe]
9:7EE0  6668ffff0000         push 0xffff
9:7EE6  eb18                 jmp 0x7f00
loc_7EE8:
9:7EE8  3d7501               cmp ax, 0x175
9:7EEB  750b                 jne 0x7ef8
9:7EED  ff760e               push word ptr [bp + 0xe]
9:7EF0  6668ff000000         push 0xff
9:7EF6  eb08                 jmp 0x7f00
loc_7EF8:
9:7EF8  ff760e               push word ptr [bp + 0xe]
9:7EFB  66ff36f05d           push dword ptr [0x5df0]
loc_7F00:
9:7F00  9a937d0000           lcall 0, 0x7d93  ; GDI.SetTextColor
9:7F05  ff760e               push word ptr [bp + 0xe]
9:7F08  666800000001         push 0x1000000
9:7F0E  9a857d0000           lcall 0, 0x7d85  ; GDI.SetBkColor
9:7F13  8b46fe               mov ax, word ptr [bp - 2]
9:7F16  8cda                 mov dx, ds
9:7F18  c9                   leave
9:7F19  ca0a00               retf 0xa

; ---------------- OPDialog::activate@s9:7F1C size=58 callers=0
;   apis: USER.PostMessage
;   (vslot 8)
9:7F1C  c8020000             enter 2, 0
9:7F20  c45e06               les bx, ptr [bp + 6]
9:7F23  26837f7800           cmp word ptr es:[bx + 0x78], 0
9:7F28  7406                 je 0x7f30
9:7F2A  33c0                 xor ax, ax
9:7F2C  c9                   leave
9:7F2D  ca0600               retf 6
loc_7F30:
9:7F30  8b460a               mov ax, word ptr [bp + 0xa]
9:7F33  26394760             cmp word ptr es:[bx + 0x60], ax
9:7F37  7416                 je 0x7f4f
9:7F39  26894760             mov word ptr es:[bx + 0x60], ax
9:7F3D  26ff7706             push word ptr es:[bx + 6]
9:7F41  666800008500         push 0x850000
9:7F47  666a00               push 0
9:7F4A  9a917b0000           lcall 0, 0x7b91  ; USER.PostMessage
loc_7F4F:
9:7F4F  b80100               mov ax, 1
9:7F52  c9                   leave
9:7F53  ca0600               retf 6

; ---------------- OPDialog::setTitle@s9:7F56 FAR size=48 callers=0
;   apis: USER.PostMessage
;   (vslot 6)
9:7F56  55                   push bp
9:7F57  8bec                 mov bp, sp
9:7F59  66ff760a             push dword ptr [bp + 0xa]
9:7F5D  668b4606             mov eax, dword ptr [bp + 6]
9:7F61  051000               add ax, 0x10
9:7F64  6650                 push eax
9:7F66  9a3e3dc677           lcall 0x77c6, 0x3d3e  ; _fstrcpy@s1:3D3E
9:7F6B  8be5                 mov sp, bp
9:7F6D  c45e06               les bx, ptr [bp + 6]
9:7F70  26ff7706             push word ptr es:[bx + 6]
9:7F74  666800008500         push 0x850000
9:7F7A  666a00               push 0
9:7F7D  9a4b7f0000           lcall 0, 0x7f4b  ; USER.PostMessage
9:7F82  c9                   leave
9:7F83  ca0800               retf 8

; ---------------- OPDialog::contextMenu@s9:7F86 size=134 callers=0
;   apis: USER.ClientToScreen, USER.GetSubMenu, USER.LoadMenu, USER.TrackPopupMenu
;   (vslot 10)
9:7F86  c8040000             enter 4, 0
9:7F8A  c45e06               les bx, ptr [bp + 6]
9:7F8D  6626837f6a00         cmp dword ptr es:[bx + 0x6a], 0
9:7F93  7439                 je 0x7fce
9:7F95  26837f6800           cmp word ptr es:[bx + 0x68], 0
9:7F9A  7532                 jne 0x7fce
9:7F9C  ff368c03             push word ptr [0x38c]
9:7FA0  6626ff776a           push dword ptr es:[bx + 0x6a]
9:7FA5  9affff0000           lcall 0, 0xffff  ; USER.LoadMenu
9:7FAA  c45e06               les bx, ptr [bp + 6]
9:7FAD  26894768             mov word ptr es:[bx + 0x68], ax
9:7FB1  0bc0                 or ax, ax
9:7FB3  7453                 je 0x8008
9:7FB5  c45e06               les bx, ptr [bp + 6]
9:7FB8  26ff7768             push word ptr es:[bx + 0x68]
9:7FBC  6a00                 push 0
9:7FBE  9affff0000           lcall 0, 0xffff  ; USER.GetSubMenu
9:7FC3  c45e06               les bx, ptr [bp + 6]
9:7FC6  26894768             mov word ptr es:[bx + 0x68], ax
9:7FCA  0bc0                 or ax, ax
9:7FCC  743a                 je 0x8008
loc_7FCE:
9:7FCE  8b460c               mov ax, word ptr [bp + 0xc]
9:7FD1  8946fc               mov word ptr [bp - 4], ax
9:7FD4  8b460a               mov ax, word ptr [bp + 0xa]
9:7FD7  8946fe               mov word ptr [bp - 2], ax
9:7FDA  c45e06               les bx, ptr [bp + 6]
9:7FDD  26ff7706             push word ptr es:[bx + 6]
9:7FE1  8d46fc               lea ax, [bp - 4]
9:7FE4  16                   push ss
9:7FE5  50                   push ax
9:7FE6  9affff0000           lcall 0, 0xffff  ; USER.ClientToScreen
9:7FEB  c45e06               les bx, ptr [bp + 6]
9:7FEE  26ff7768             push word ptr es:[bx + 0x68]
9:7FF2  6a00                 push 0
9:7FF4  ff76fc               push word ptr [bp - 4]
9:7FF7  ff76fe               push word ptr [bp - 2]
9:7FFA  6a00                 push 0
9:7FFC  26ff7706             push word ptr es:[bx + 6]
9:8000  666a00               push 0
9:8003  9affff0000           lcall 0, 0xffff  ; USER.TrackPopupMenu
loc_8008:
9:8008  c9                   leave
9:8009  ca0a00               retf 0xa

; ---------------- OPDialog::help@s9:800C size=72 callers=0
;   apis: USER.WinHelp
;   (vslot 11) WinHelp
9:800C  c8040000             enter 4, 0
9:8010  68f801               push 0x1f8
9:8013  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:8018  9a0a832f76           lcall 0x762f, 0x830a  ; ResLibr::picture@s3:830A
9:801D  c45e06               les bx, ptr [bp + 6]
9:8020  2683bf8a0000         cmp word ptr es:[bx + 0x8a], 0
9:8026  7414                 je 0x803c
9:8028  26ff7706             push word ptr es:[bx + 6]
9:802C  52                   push dx
9:802D  50                   push ax
9:802E  6a01                 push 1
9:8030  66260fbf878a00       movsx eax, word ptr es:[bx + 0x8a]
9:8037  6650                 push eax
9:8039  eb0f                 jmp 0x804a
9:803B  db 90
loc_803C:
9:803C  26ff7706             push word ptr es:[bx + 6]
9:8040  52                   push dx
9:8041  50                   push ax
9:8042  666800000300         push 0x30000
9:8048  6a00                 push 0
loc_804A:
9:804A  9affff0000           lcall 0, 0xffff  ; USER.WinHelp
9:804F  c9                   leave
9:8050  ca0400               retf 4
9:8053  db 00

; ---------------- OPDialog::zero@s9:8054 FAR size=6 callers=0
;   (vslot 12) virtual returning 0
9:8054  33c0                 xor ax, ax
9:8056  ca0a00               retf 0xa
9:8059  db 00

; ---------------- currentPictureCache@s9:805A FAR size=36 callers=1
;   registry 0x28's picture (DGROUP 0x4230)
9:805A  66833e304200         cmp dword ptr [0x4230], 0
9:8060  750c                 jne 0x806e
9:8062  6a28                 push 0x28
9:8064  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:8069  9aba201b80           lcall 0x801b, 0x20ba  ; Registry_get@s3:20BA
loc_806E:
9:806E  c41e3042             les bx, ptr [0x4230]
9:8072  268b470e             mov ax, word ptr es:[bx + 0xe]
9:8076  268b5710             mov dx, word ptr es:[bx + 0x10]
9:807A  ca0400               retf 4
9:807D  db 00

; ---------------- OPDialog::loadBackground@s9:807E FAR size=218 callers=0
;   (vslot 26) the dialog's picture
9:807E  c8100000             enter 0x10, 0
9:8082  56                   push si
9:8083  837e0a01             cmp word ptr [bp + 0xa], 1
9:8087  750f                 jne 0x8098
9:8089  66ff7606             push dword ptr [bp + 6]
9:808D  90                   nop
9:808E  0e                   push cs
9:808F  e8c8ff               call 0x805a  ; currentPictureCache@s9:805A
9:8092  5e                   pop si
9:8093  c9                   leave
9:8094  ca0600               retf 6
9:8097  db 90
loc_8098:
9:8098  ff760a               push word ptr [bp + 0xa]
9:809B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:80A0  9a0a836c80           lcall 0x806c, 0x830a  ; ResLibr::picture@s3:830A
9:80A5  8946fc               mov word ptr [bp - 4], ax
9:80A8  8956fe               mov word ptr [bp - 2], dx
9:80AB  0bd0                 or dx, ax
9:80AD  0f849f00             je 0x8150
9:80B1  c45efc               les bx, ptr [bp - 4]
9:80B4  06                   push es
9:80B5  50                   push ax
9:80B6  26c41f               les bx, ptr es:[bx]
9:80B9  26ff5f14             lcall es:[bx + 0x14]
9:80BD  8946f8               mov word ptr [bp - 8], ax
9:80C0  8956fa               mov word ptr [bp - 6], dx
9:80C3  c45e06               les bx, ptr [bp + 6]
9:80C6  6626837f7000         cmp dword ptr es:[bx + 0x70], 0
9:80CC  741f                 je 0x80ed
9:80CE  268b4770             mov ax, word ptr es:[bx + 0x70]
9:80D2  268b5772             mov dx, word ptr es:[bx + 0x72]
9:80D6  8956f2               mov word ptr [bp - 0xe], dx
9:80D9  8bda                 mov bx, dx
9:80DB  0bd0                 or dx, ax
9:80DD  740e                 je 0x80ed
9:80DF  6a01                 push 1
9:80E1  53                   push bx
9:80E2  50                   push ax
9:80E3  8ec3                 mov es, bx
9:80E5  8bf0                 mov si, ax
9:80E7  26c41c               les bx, ptr es:[si]
9:80EA  26ff1f               lcall es:[bx]
loc_80ED:
9:80ED  6a14                 push 0x14
9:80EF  9a9c17697f           lcall 0x7f69, 0x179c  ; operator_new@s1:179C
9:80F4  83c402               add sp, 2
9:80F7  8956f2               mov word ptr [bp - 0xe], dx
9:80FA  0bd0                 or dx, ax
9:80FC  740c                 je 0x810a
9:80FE  ff76f2               push word ptr [bp - 0xe]
9:8101  50                   push ax
9:8102  9a584c2781           lcall 0x8127, 0x4c58  ; MemBlock::MemBlock@s2:4C58
9:8107  eb04                 jmp 0x810d
9:8109  db 90
loc_810A:
9:810A  33c0                 xor ax, ax
9:810C  99                   cdq
loc_810D:
9:810D  c45e06               les bx, ptr [bp + 6]
9:8110  26894770             mov word ptr es:[bx + 0x70], ax
9:8114  26895772             mov word ptr es:[bx + 0x72], dx
9:8118  66ff76f8             push dword ptr [bp - 8]
9:811C  c45e06               les bx, ptr [bp + 6]
9:811F  6626ff7770           push dword ptr es:[bx + 0x70]
9:8124  9a844d997e           lcall 0x7e99, 0x4d84  ; MemBlock::copyFrom@s2:4D84
9:8129  668b46fc             mov eax, dword ptr [bp - 4]
9:812D  660bc0               or eax, eax
9:8130  740d                 je 0x813f
9:8132  6a01                 push 1
9:8134  c45efc               les bx, ptr [bp - 4]
9:8137  06                   push es
9:8138  50                   push ax
9:8139  26c41f               les bx, ptr es:[bx]
9:813C  26ff1f               lcall es:[bx]
loc_813F:
9:813F  c45e06               les bx, ptr [bp + 6]
9:8142  268b4770             mov ax, word ptr es:[bx + 0x70]
9:8146  268b5772             mov dx, word ptr es:[bx + 0x72]
9:814A  5e                   pop si
9:814B  c9                   leave
9:814C  ca0600               retf 6
9:814F  db 90
loc_8150:
9:8150  33c0                 xor ax, ax
9:8152  99                   cdq
9:8153  5e                   pop si
9:8154  c9                   leave
9:8155  ca0600               retf 6

; ---------------- OPDialog::hitCaption@s9:8158 size=94 callers=0
;   apis: USER.GetSystemMetrics, USER.PtInRect, USER.ScreenToClient
;   (vslot 14)
9:8158  c8040000             enter 4, 0
9:815C  837e0e02             cmp word ptr [bp + 0xe], 2
9:8160  754e                 jne 0x81b0
9:8162  c45e06               les bx, ptr [bp + 6]
9:8165  26837f7600           cmp word ptr es:[bx + 0x76], 0
9:816A  7444                 je 0x81b0
9:816C  668b460a             mov eax, dword ptr [bp + 0xa]
9:8170  668946fc             mov dword ptr [bp - 4], eax
9:8174  26ff7706             push word ptr es:[bx + 6]
9:8178  8d46fc               lea ax, [bp - 4]
9:817B  16                   push ss
9:817C  50                   push ax
9:817D  9affff0000           lcall 0, 0xffff  ; USER.ScreenToClient
9:8182  6a04                 push 4
9:8184  9afc770000           lcall 0, 0x77fc  ; USER.GetSystemMetrics
9:8189  0146fe               add word ptr [bp - 2], ax
9:818C  668b4606             mov eax, dword ptr [bp + 6]
9:8190  058200               add ax, 0x82
9:8193  6650                 push eax
9:8195  66ff76fc             push dword ptr [bp - 4]
9:8199  9affff0000           lcall 0, 0xffff  ; USER.PtInRect
9:819E  0bc0                 or ax, ax
9:81A0  740e                 je 0x81b0
9:81A2  6a00                 push 0
9:81A4  c45e06               les bx, ptr [bp + 6]
9:81A7  06                   push es
9:81A8  53                   push bx
9:81A9  26c41f               les bx, ptr es:[bx]
9:81AC  26ff5f14             lcall es:[bx + 0x14]
loc_81B0:
9:81B0  33c0                 xor ax, ax
9:81B2  c9                   leave
9:81B3  ca0a00               retf 0xa

; ---------------- OPDialog::runModal@s9:81B6 size=72 callers=0
;   apis: USER.GetMessage, USER.IsDialogMessage, USER.IsWindow
;   (vslot 15) own message loop
9:81B6  c8120000             enter 0x12, 0
9:81BA  c45e06               les bx, ptr [bp + 6]
9:81BD  26c747780100         mov word ptr es:[bx + 0x78], 1
9:81C3  eb25                 jmp 0x81ea
9:81C5  db 90
loc_81C6:
9:81C6  8d46ee               lea ax, [bp - 0x12]
9:81C9  16                   push ss
9:81CA  50                   push ax
9:81CB  666a00               push 0
9:81CE  6a00                 push 0
9:81D0  9affff0000           lcall 0, 0xffff  ; USER.GetMessage
9:81D5  0bc0                 or ax, ax
9:81D7  7421                 je 0x81fa
9:81D9  c45e06               les bx, ptr [bp + 6]
9:81DC  26ff7706             push word ptr es:[bx + 6]
9:81E0  8d46ee               lea ax, [bp - 0x12]
9:81E3  16                   push ss
9:81E4  50                   push ax
9:81E5  9affff0000           lcall 0, 0xffff  ; USER.IsDialogMessage
loc_81EA:
9:81EA  c45e06               les bx, ptr [bp + 6]
9:81ED  26ff7706             push word ptr es:[bx + 6]
9:81F1  9af2530000           lcall 0, 0x53f2  ; USER.IsWindow
9:81F6  0bc0                 or ax, ax
9:81F8  75cc                 jne 0x81c6
loc_81FA:
9:81FA  c9                   leave
9:81FB  ca0400               retf 4

; ---------------- OPDialog::setSysModal@s9:81FE size=20 callers=0
;   apis: USER.SetSysModalWindow
;   (vslot 16)
9:81FE  c8020000             enter 2, 0
9:8202  c45e06               les bx, ptr [bp + 6]
9:8205  26ff7706             push word ptr es:[bx + 6]
9:8209  9affff0000           lcall 0, 0xffff  ; USER.SetSysModalWindow
9:820E  c9                   leave
9:820F  ca0400               retf 4

; ---------------- OPDialog::destroyChild@s9:8212 FAR size=56 callers=1
;   apis: USER.DestroyWindow, USER.IsWindow
;   (vslot 9) the child window at +0x8C
9:8212  55                   push bp
9:8213  8bec                 mov bp, sp
9:8215  c45e06               les bx, ptr [bp + 6]
9:8218  2683bf8c0000         cmp word ptr es:[bx + 0x8c], 0
9:821E  7425                 je 0x8245
9:8220  26ffb78c00           push word ptr es:[bx + 0x8c]
9:8225  9af2810000           lcall 0, 0x81f2  ; USER.IsWindow
9:822A  0bc0                 or ax, ax
9:822C  7417                 je 0x8245
9:822E  c45e06               les bx, ptr [bp + 6]
9:8231  26ffb78c00           push word ptr es:[bx + 0x8c]
9:8236  9aaa7b0000           lcall 0, 0x7baa  ; USER.DestroyWindow
9:823B  c45e06               les bx, ptr [bp + 6]
9:823E  26c7878c000000       mov word ptr es:[bx + 0x8c], 0
loc_8245:
9:8245  c9                   leave
9:8246  ca0400               retf 4
9:8249  db 00

; ---------------- OPDialog::isOtherWindow@s9:824A FAR size=28 callers=0
;   (vslot 18)
9:824A  55                   push bp
9:824B  8bec                 mov bp, sp
9:824D  8b460a               mov ax, word ptr [bp + 0xa]
9:8250  c45e06               les bx, ptr [bp + 6]
9:8253  26394706             cmp word ptr es:[bx + 6], ax
9:8257  7407                 je 0x8260
9:8259  b80100               mov ax, 1
9:825C  c9                   leave
9:825D  ca0600               retf 6
loc_8260:
9:8260  33c0                 xor ax, ax
9:8262  c9                   leave
9:8263  ca0600               retf 6

; ---------------- OPDialog::zero19@s9:8266 FAR size=6 callers=0
;   (vslot 19)
9:8266  33c0                 xor ax, ax
9:8268  ca0400               retf 4
9:826B  db 00

; ---------------- OPDialog::position@s9:826C FAR size=130 callers=25
;   apis: USER.GetSystemMetrics, USER.GetWindowRect, USER.MoveWindow
;   moves the dialog into the screen
9:826C  c8140000             enter 0x14, 0
9:8270  c45e06               les bx, ptr [bp + 6]
9:8273  26ff7706             push word ptr es:[bx + 6]
9:8277  8d46f4               lea ax, [bp - 0xc]
9:827A  16                   push ss
9:827B  50                   push ax
9:827C  9a247c0000           lcall 0, 0x7c24  ; USER.GetWindowRect
9:8281  8b46f8               mov ax, word ptr [bp - 8]
9:8284  2b46f4               sub ax, word ptr [bp - 0xc]
9:8287  8946f2               mov word ptr [bp - 0xe], ax
9:828A  8b46fa               mov ax, word ptr [bp - 6]
9:828D  2b46f6               sub ax, word ptr [bp - 0xa]
9:8290  8946f0               mov word ptr [bp - 0x10], ax
9:8293  837e0cff             cmp word ptr [bp + 0xc], -1
9:8297  7406                 je 0x829f
9:8299  837e0aff             cmp word ptr [bp + 0xa], -1
9:829D  7529                 jne 0x82c8
loc_829F:
9:829F  6a00                 push 0
9:82A1  9ab7820000           lcall 0, 0x82b7  ; USER.GetSystemMetrics
9:82A6  8946ee               mov word ptr [bp - 0x12], ax
9:82A9  2b46f2               sub ax, word ptr [bp - 0xe]
9:82AC  99                   cdq
9:82AD  2bc2                 sub ax, dx
9:82AF  d1f8                 sar ax, 1
9:82B1  8946fe               mov word ptr [bp - 2], ax
9:82B4  6a01                 push 1
9:82B6  9a85810000           lcall 0, 0x8185  ; USER.GetSystemMetrics
9:82BB  8946ec               mov word ptr [bp - 0x14], ax
9:82BE  2b46f0               sub ax, word ptr [bp - 0x10]
9:82C1  99                   cdq
9:82C2  2bc2                 sub ax, dx
9:82C4  d1f8                 sar ax, 1
9:82C6  eb09                 jmp 0x82d1
loc_82C8:
9:82C8  8b460c               mov ax, word ptr [bp + 0xc]
9:82CB  8946fe               mov word ptr [bp - 2], ax
9:82CE  8b460a               mov ax, word ptr [bp + 0xa]
loc_82D1:
9:82D1  8946fc               mov word ptr [bp - 4], ax
9:82D4  c45e06               les bx, ptr [bp + 6]
9:82D7  26ff7706             push word ptr es:[bx + 6]
9:82DB  ff76fe               push word ptr [bp - 2]
9:82DE  50                   push ax
9:82DF  66ff76f0             push dword ptr [bp - 0x10]
9:82E3  6a00                 push 0
9:82E5  9affff0000           lcall 0, 0xffff  ; USER.MoveWindow
9:82EA  c9                   leave
9:82EB  ca0800               retf 8

; ---------------- OPDialog::drawFrame@s9:82EE FAR size=248 callers=1
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.FrameRect
;   FrameRect
9:82EE  c8180000             enter 0x18, 0
9:82F2  57                   push di
9:82F3  56                   push si
9:82F4  c45e06               les bx, ptr [bp + 6]
9:82F7  268b878000           mov ax, word ptr es:[bx + 0x80]
9:82FC  262b477c             sub ax, word ptr es:[bx + 0x7c]
9:8300  2d0200               sub ax, 2
9:8303  8946fe               mov word ptr [bp - 2], ax
9:8306  8946fc               mov word ptr [bp - 4], ax
9:8309  26837f6001           cmp word ptr es:[bx + 0x60], 1
9:830E  1bc0                 sbb ax, ax
9:8310  251e00               and ax, 0x1e
9:8313  052500               add ax, 0x25
9:8316  8946fa               mov word ptr [bp - 6], ax
9:8319  680001               push 0x100
9:831C  50                   push ax
9:831D  9ade270000           lcall 0, 0x27de  ; GDI.CreateSolidBrush
9:8322  8946f8               mov word ptr [bp - 8], ax
9:8325  c45e06               les bx, ptr [bp + 6]
9:8328  2683bf860000         cmp word ptr es:[bx + 0x86], 0
9:832E  752b                 jne 0x835b
9:8330  268b4764             mov ax, word ptr es:[bx + 0x64]
9:8334  050200               add ax, 2
9:8337  8946e8               mov word ptr [bp - 0x18], ax
9:833A  268b4766             mov ax, word ptr es:[bx + 0x66]
9:833E  050200               add ax, 2
9:8341  8946ea               mov word ptr [bp - 0x16], ax
9:8344  8b46fc               mov ax, word ptr [bp - 4]
9:8347  8946ec               mov word ptr [bp - 0x14], ax
9:834A  8b46fe               mov ax, word ptr [bp - 2]
9:834D  8946ee               mov word ptr [bp - 0x12], ax
9:8350  8dbf8200             lea di, [bx + 0x82]
9:8354  8d76e8               lea si, [bp - 0x18]
9:8357  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:8359  66a5                 movsd dword ptr es:[di], dword ptr [si]
loc_835B:
9:835B  8b5e06               mov bx, word ptr [bp + 6]
9:835E  268b878200           mov ax, word ptr es:[bx + 0x82]
9:8363  050200               add ax, 2
9:8366  8946f0               mov word ptr [bp - 0x10], ax
9:8369  268b878800           mov ax, word ptr es:[bx + 0x88]
9:836E  262b878400           sub ax, word ptr es:[bx + 0x84]
9:8373  99                   cdq
9:8374  2bc2                 sub ax, dx
9:8376  d1f8                 sar ax, 1
9:8378  2603878400           add ax, word ptr es:[bx + 0x84]
9:837D  2d0200               sub ax, 2
9:8380  8946f2               mov word ptr [bp - 0xe], ax
9:8383  268b878600           mov ax, word ptr es:[bx + 0x86]
9:8388  2d0200               sub ax, 2
9:838B  8946f4               mov word ptr [bp - 0xc], ax
9:838E  268b878800           mov ax, word ptr es:[bx + 0x88]
9:8393  262b878400           sub ax, word ptr es:[bx + 0x84]
9:8398  99                   cdq
9:8399  2bc2                 sub ax, dx
9:839B  d1f8                 sar ax, 1
9:839D  2603878400           add ax, word ptr es:[bx + 0x84]
9:83A2  050200               add ax, 2
9:83A5  8946f6               mov word ptr [bp - 0xa], ax
9:83A8  ff760a               push word ptr [bp + 0xa]
9:83AB  8d878200             lea ax, [bx + 0x82]
9:83AF  06                   push es
9:83B0  50                   push ax
9:83B1  ff76f8               push word ptr [bp - 8]
9:83B4  9ac5830000           lcall 0, 0x83c5  ; USER.FrameRect
9:83B9  ff760a               push word ptr [bp + 0xa]
9:83BC  8d46f0               lea ax, [bp - 0x10]
9:83BF  16                   push ss
9:83C0  50                   push ax
9:83C1  ff76f8               push word ptr [bp - 8]
9:83C4  9affff0000           lcall 0, 0xffff  ; USER.FrameRect
9:83C9  ff76f8               push word ptr [bp - 8]
9:83CC  9a3d7e0000           lcall 0, 0x7e3d  ; GDI.DeleteObject
9:83D1  c45e06               les bx, ptr [bp + 6]
9:83D4  268b878600           mov ax, word ptr es:[bx + 0x86]
9:83D9  050200               add ax, 2
9:83DC  2689477a             mov word ptr es:[bx + 0x7a], ax
9:83E0  5e                   pop si
9:83E1  5f                   pop di
9:83E2  c9                   leave
9:83E3  ca0600               retf 6

; ---------------- OPDialog::scalar_dtor@s9:83E6 FAR size=146 callers=0
;   deleting destructor
9:83E6  55                   push bp
9:83E7  8bec                 mov bp, sp
9:83E9  66ff7606             push dword ptr [bp + 6]
9:83ED  90                   nop
9:83EE  0e                   push cs
9:83EF  e83af4               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:83F2  f6460a01             test byte ptr [bp + 0xa], 1
9:83F6  7409                 je 0x8401
9:83F8  66ff7606             push dword ptr [bp + 6]
9:83FC  9ace17f280           lcall 0x80f2, 0x17ce  ; operator_delete@s1:17CE
loc_8401:
9:8401  8b4606               mov ax, word ptr [bp + 6]
9:8404  8b5608               mov dx, word ptr [bp + 8]
9:8407  c9                   leave
9:8408  ca0600               retf 6
9:840B  db 90 e6 83 16 84 10 3a 05 81 e2 78 1a 84 c0 79 1e
9:841B  db 84 3c 7b 22 84 98 7b 26 84 56 7f 2a 84 b2 7b 2e
9:842B  db 84 1c 7f 32 84 12 82 36 84 86 7f 3a 84 0c 80 3e
9:843B  db 84 54 80 42 84 5e 7e 46 84 58 81 4a 84 b6 81 4e
9:844B  db 84 fe 81 56 84 ea 60 62 84 4a 82 5a 84 66 82 5e
9:845B  db 84 de 78 76 84 ee 60 66 84 f4 60 6a 84 fa 60 72
9:846B  db 84 a4 a2 1e 77 fe 60 ea 76 7e 80 3d 78

; ---------------- OPMessageBox::OPMessageBox@s9:8478 FAR size=168 callers=4
;   message box (dialog 4035) with a text
9:8478  c8080000             enter 8, 0
9:847C  57                   push di
9:847D  56                   push si
9:847E  ff7614               push word ptr [bp + 0x14]
9:8481  66680000c30f         push 0xfc30000
9:8487  666a01               push 1
9:848A  66ff7606             push dword ptr [bp + 6]
9:848E  90                   nop
9:848F  0e                   push cs
9:8490  e895f2               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:8493  c45e06               les bx, ptr [bp + 6]
9:8496  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
9:849D  8b460a               mov ax, word ptr [bp + 0xa]
9:84A0  2689879800           mov word ptr es:[bx + 0x98], ax
9:84A5  33c0                 xor ax, ax
9:84A7  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:84AC  268987b200           mov word ptr es:[bx + 0xb2], ax
9:84B1  26c707dc8d           mov word ptr es:[bx], 0x8ddc
9:84B6  26c747020e84         mov word ptr es:[bx + 2], 0x840e  ; SEGMENT s9:0000
9:84BC  c746fc2c01           mov word ptr [bp - 4], 0x12c
9:84C1  8946f8               mov word ptr [bp - 8], ax
9:84C4  8946fa               mov word ptr [bp - 6], ax
9:84C7  8946fe               mov word ptr [bp - 2], ax
9:84CA  8dbf9e00             lea di, [bx + 0x9e]
9:84CE  8d76f8               lea si, [bp - 8]
9:84D1  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:84D3  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:84D5  66ff7610             push dword ptr [bp + 0x10]
9:84D9  9ae860f584           lcall 0x84f5, 0x60e8  ; _strdup@s2:60E8
9:84DE  83c404               add sp, 4
9:84E1  c45e06               les bx, ptr [bp + 6]
9:84E4  2689879000           mov word ptr es:[bx + 0x90], ax
9:84E9  2689979200           mov word ptr es:[bx + 0x92], dx
9:84EE  66ff760c             push dword ptr [bp + 0xc]
9:84F2  9ae8601284           lcall 0x8412, 0x60e8  ; _strdup@s2:60E8
9:84F7  83c404               add sp, 4
9:84FA  c45e06               les bx, ptr [bp + 6]
9:84FD  2689879400           mov word ptr es:[bx + 0x94], ax
9:8502  2689979600           mov word ptr es:[bx + 0x96], dx
9:8507  06                   push es
9:8508  53                   push bx
9:8509  90                   nop
9:850A  0e                   push cs
9:850B  e88406               call 0x8b92  ; OPMessageBox::icon@s9:8B92
9:850E  c706f85d0000         mov word ptr [0x5df8], 0
9:8514  8b4606               mov ax, word ptr [bp + 6]
9:8517  8b5608               mov dx, word ptr [bp + 8]
9:851A  5e                   pop si
9:851B  5f                   pop di
9:851C  c9                   leave
9:851D  ca1000               retf 0x10

; ---------------- OPMessageBox::OPMessageBox(ids)@s9:8520 FAR size=378 callers=14
;   message box from string ids (MB_YESNO ...; caption 1403 "Outpost")
9:8520  c81e0000             enter 0x1e, 0
9:8524  57                   push di
9:8525  56                   push si
9:8526  ff760a               push word ptr [bp + 0xa]
9:8529  66680000c30f         push 0xfc30000
9:852F  666a01               push 1
9:8532  66ff7606             push dword ptr [bp + 6]
9:8536  90                   nop
9:8537  0e                   push cs
9:8538  e8edf1               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:853B  c45e06               les bx, ptr [bp + 6]
9:853E  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
9:8545  8b460c               mov ax, word ptr [bp + 0xc]
9:8548  2689879800           mov word ptr es:[bx + 0x98], ax
9:854D  33c0                 xor ax, ax
9:854F  2689879a00           mov word ptr es:[bx + 0x9a], ax
9:8554  268987b200           mov word ptr es:[bx + 0xb2], ax
9:8559  26c707dc8d           mov word ptr es:[bx], 0x8ddc
9:855E  26c74702ba84         mov word ptr es:[bx + 2], 0x84ba  ; SEGMENT s9:0000
9:8564  c746fc2c01           mov word ptr [bp - 4], 0x12c
9:8569  8946f8               mov word ptr [bp - 8], ax
9:856C  8946fa               mov word ptr [bp - 6], ax
9:856F  8946fe               mov word ptr [bp - 2], ax
9:8572  8dbf9e00             lea di, [bx + 0x9e]
9:8576  8d76f8               lea si, [bp - 8]
9:8579  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:857B  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:857D  8d4e10               lea cx, [bp + 0x10]
9:8580  894ef4               mov word ptr [bp - 0xc], cx
9:8583  8c56f6               mov word ptr [bp - 0xa], ss
9:8586  8b4e0e               mov cx, word ptr [bp + 0xe]
9:8589  894ef2               mov word ptr [bp - 0xe], cx
9:858C  3bc8                 cmp cx, ax
9:858E  7427                 je 0x85b7
9:8590  8d4612               lea ax, [bp + 0x12]
9:8593  8946f4               mov word ptr [bp - 0xc], ax
9:8596  8b4610               mov ax, word ptr [bp + 0x10]
9:8599  8946f0               mov word ptr [bp - 0x10], ax
9:859C  50                   push ax
9:859D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:85A2  9aac84d485           lcall 0x85d4, 0x84ac  ; LoadStringDup@s3:84AC
9:85A7  c45e06               les bx, ptr [bp + 6]
9:85AA  2689879400           mov word ptr es:[bx + 0x94], ax
9:85AF  2689979600           mov word ptr es:[bx + 0x96], dx
9:85B4  ff4ef2               dec word ptr [bp - 0xe]
loc_85B7:
9:85B7  c746ec0000           mov word ptr [bp - 0x14], 0
9:85BC  eb2b                 jmp 0x85e9
loc_85BE:
9:85BE  c45ef4               les bx, ptr [bp - 0xc]
9:85C1  8346f402             add word ptr [bp - 0xc], 2
9:85C5  268b07               mov ax, word ptr es:[bx]
9:85C8  8946ee               mov word ptr [bp - 0x12], ax
9:85CB  50                   push ax
9:85CC  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:85D1  9a7e843f86           lcall 0x863f, 0x847e  ; LoadStringRes@s3:847E
9:85D6  8946e6               mov word ptr [bp - 0x1a], ax
9:85D9  8956e8               mov word ptr [bp - 0x18], dx
9:85DC  52                   push dx
9:85DD  50                   push ax
9:85DE  9aa43dfb85           lcall 0x85fb, 0x3da4  ; _fstrlen@s1:3DA4
9:85E3  83c404               add sp, 4
9:85E6  0146ec               add word ptr [bp - 0x14], ax
loc_85E9:
9:85E9  8b46f2               mov ax, word ptr [bp - 0xe]
9:85EC  ff4ef2               dec word ptr [bp - 0xe]
9:85EF  0bc0                 or ax, ax
9:85F1  75cb                 jne 0x85be
9:85F3  8b46ec               mov ax, word ptr [bp - 0x14]
9:85F6  40                   inc ax
9:85F7  50                   push ax
9:85F8  9a9c177286           lcall 0x8672, 0x179c  ; operator_new@s1:179C
9:85FD  83c402               add sp, 2
9:8600  c45e06               les bx, ptr [bp + 6]
9:8603  2689879000           mov word ptr es:[bx + 0x90], ax
9:8608  2689979200           mov word ptr es:[bx + 0x92], dx
9:860D  8d4612               lea ax, [bp + 0x12]
9:8610  8946f4               mov word ptr [bp - 0xc], ax
9:8613  8c56f6               mov word ptr [bp - 0xa], ss
9:8616  8b460e               mov ax, word ptr [bp + 0xe]
9:8619  48                   dec ax
9:861A  8946f2               mov word ptr [bp - 0xe], ax
9:861D  0bc0                 or ax, ax
9:861F  7456                 je 0x8677
9:8621  8d4614               lea ax, [bp + 0x14]
9:8624  8946f4               mov word ptr [bp - 0xc], ax
9:8627  8b4612               mov ax, word ptr [bp + 0x12]
9:862A  8946ee               mov word ptr [bp - 0x12], ax
9:862D  50                   push ax
9:862E  6626ffb79000         push dword ptr es:[bx + 0x90]
9:8634  68ff03               push 0x3ff
9:8637  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:863C  9ae0845c86           lcall 0x865c, 0x84e0  ; LoadStringTo@s3:84E0
9:8641  ff4ef2               dec word ptr [bp - 0xe]
9:8644  eb31                 jmp 0x8677
loc_8646:
9:8646  c45ef4               les bx, ptr [bp - 0xc]
9:8649  8346f402             add word ptr [bp - 0xc], 2
9:864D  268b07               mov ax, word ptr es:[bx]
9:8650  8946ee               mov word ptr [bp - 0x12], ax
9:8653  50                   push ax
9:8654  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:8659  9a7e84a380           lcall 0x80a3, 0x847e  ; LoadStringRes@s3:847E
9:865E  8946e2               mov word ptr [bp - 0x1e], ax
9:8661  8956e4               mov word ptr [bp - 0x1c], dx
9:8664  52                   push dx
9:8665  50                   push ax
9:8666  c45e06               les bx, ptr [bp + 6]
9:8669  6626ffb79000         push dword ptr es:[bx + 0x90]
9:866F  9aea3cff83           lcall 0x83ff, 0x3cea  ; _fstrcat@s1:3CEA
9:8674  83c408               add sp, 8
loc_8677:
9:8677  8b46f2               mov ax, word ptr [bp - 0xe]
9:867A  ff4ef2               dec word ptr [bp - 0xe]
9:867D  0bc0                 or ax, ax
9:867F  75c5                 jne 0x8646
9:8681  66ff7606             push dword ptr [bp + 6]
9:8685  90                   nop
9:8686  0e                   push cs
9:8687  e80805               call 0x8b92  ; OPMessageBox::icon@s9:8B92
9:868A  c706f85d0000         mov word ptr [0x5df8], 0
9:8690  8b4606               mov ax, word ptr [bp + 6]
9:8693  8b5608               mov dx, word ptr [bp + 8]
9:8696  5e                   pop si
9:8697  5f                   pop di
9:8698  c9                   leave
9:8699  cb                   retf

; ---------------- OPMessageBox::~OPMessageBox@s9:869A FAR size=66 callers=1
;   dtor
9:869A  c80c0000             enter 0xc, 0
9:869E  c45e06               les bx, ptr [bp + 6]
9:86A1  26c707dc8d           mov word ptr es:[bx], 0x8ddc
9:86A6  26c747026285         mov word ptr es:[bx + 2], 0x8562  ; SEGMENT s9:0000
9:86AC  66268b879000         mov eax, dword ptr es:[bx + 0x90]
9:86B2  6650                 push eax
9:86B4  9ace17ca86           lcall 0x86ca, 0x17ce  ; operator_delete@s1:17CE
9:86B9  83c404               add sp, 4
9:86BC  c45e06               les bx, ptr [bp + 6]
9:86BF  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:86C5  6650                 push eax
9:86C7  9ace17e185           lcall 0x85e1, 0x17ce  ; operator_delete@s1:17CE
9:86CC  83c404               add sp, 4
9:86CF  66ff7606             push dword ptr [bp + 6]
9:86D3  90                   nop
9:86D4  0e                   push cs
9:86D5  e854f1               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:86D8  c9                   leave
9:86D9  ca0400               retf 4

; ---------------- OPMessageBox::enableButtons@s9:86DC size=60 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem
;   (vslot 30)
9:86DC  c8020000             enter 2, 0
9:86E0  c45e06               les bx, ptr [bp + 6]
9:86E3  26ff7706             push word ptr es:[bx + 6]
9:86E7  6a01                 push 1
9:86E9  9a04870000           lcall 0, 0x8704  ; USER.GetDlgItem
9:86EE  0bc0                 or ax, ax
9:86F0  7422                 je 0x8714
9:86F2  50                   push ax
9:86F3  6a01                 push 1
9:86F5  9a10870000           lcall 0, 0x8710  ; USER.EnableWindow
9:86FA  c45e06               les bx, ptr [bp + 6]
9:86FD  26ff7706             push word ptr es:[bx + 6]
9:8701  6a02                 push 2
9:8703  9a09700000           lcall 0, 0x7009  ; USER.GetDlgItem
9:8708  0bc0                 or ax, ax
9:870A  7408                 je 0x8714
9:870C  50                   push ax
9:870D  6a01                 push 1
9:870F  9a1b700000           lcall 0, 0x701b  ; USER.EnableWindow
loc_8714:
9:8714  c9                   leave
9:8715  ca0400               retf 4

; ---------------- OPMessageBox::run@s9:8718 size=608 callers=0
;   apis: USER.PostMessage, USER.SetWindowPos
;   (vslot 29) lays out, modal loop
9:8718  c81e0100             enter 0x11e, 0
9:871C  1e                   push ds
9:871D  68f45d               push 0x5df4
9:8720  9a10952189           lcall 0x8921, 0x9510  ; MessageLoop_modal@s2:9510
9:8725  83c404               add sp, 4
9:8728  66ff7606             push dword ptr [bp + 6]
9:872C  90                   nop
9:872D  0e                   push cs
9:872E  e8b1f1               call 0x78e2  ; OPDialog::create@s9:78E2
9:8731  c45e06               les bx, ptr [bp + 6]
9:8734  268b4706             mov ax, word ptr es:[bx + 6]
9:8738  a3f65d               mov word ptr [0x5df6], ax
9:873B  662683bf940000       cmp dword ptr es:[bx + 0x94], 0
9:8742  7413                 je 0x8757
9:8744  6626ffb79400         push dword ptr es:[bx + 0x94]
9:874A  8d4710               lea ax, [bx + 0x10]
9:874D  06                   push es
9:874E  50                   push ax
9:874F  9a3e3db786           lcall 0x86b7, 0x3d3e  ; _fstrcpy@s1:3D3E
9:8754  83c408               add sp, 8
loc_8757:
9:8757  66ff7606             push dword ptr [bp + 6]
9:875B  90                   nop
9:875C  0e                   push cs
9:875D  e80605               call 0x8c66  ; OPMessageBox::layout@s9:8C66
9:8760  c45e06               les bx, ptr [bp + 6]
9:8763  268a879800           mov al, byte ptr es:[bx + 0x98]
9:8768  250f00               and ax, 0xf
9:876B  8946fe               mov word ptr [bp - 2], ax
9:876E  48                   dec ax
9:876F  7579                 jne 0x87ea
9:8771  268b87aa00           mov ax, word ptr es:[bx + 0xaa]
9:8776  2dc400               sub ax, 0xc4
9:8779  99                   cdq
9:877A  2bc2                 sub ax, dx
9:877C  d1f8                 sar ax, 1
9:877E  268987ae00           mov word ptr es:[bx + 0xae], ax
9:8783  689205               push 0x592
9:8786  8d86fefe             lea ax, [bp - 0x102]
9:878A  16                   push ss
9:878B  50                   push ax
9:878C  68ff00               push 0xff
9:878F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:8794  9ae084d287           lcall 0x87d2, 0x84e0  ; LoadStringTo@s3:84E0
9:8799  8d86fefe             lea ax, [bp - 0x102]
9:879D  16                   push ss
9:879E  50                   push ax
9:879F  c45e06               les bx, ptr [bp + 6]
9:87A2  6626ffb7ae00         push dword ptr es:[bx + 0xae]
9:87A8  666801000100         push 0x10001
9:87AE  06                   push es
9:87AF  53                   push bx
9:87B0  90                   nop
9:87B1  0e                   push cs
9:87B2  e83504               call 0x8bea  ; OPMessageBox::makeButtons@s9:8BEA
9:87B5  c45e06               les bx, ptr [bp + 6]
9:87B8  268387ae006c         add word ptr es:[bx + 0xae], 0x6c
9:87BE  68d807               push 0x7d8
9:87C1  8d86fefe             lea ax, [bp - 0x102]
9:87C5  16                   push ss
9:87C6  50                   push ax
9:87C7  68ff00               push 0xff
9:87CA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:87CF  9ae0841688           lcall 0x8816, 0x84e0  ; LoadStringTo@s3:84E0
9:87D4  8d86fefe             lea ax, [bp - 0x102]
9:87D8  16                   push ss
9:87D9  50                   push ax
9:87DA  c45e06               les bx, ptr [bp + 6]
9:87DD  6626ffb7ae00         push dword ptr es:[bx + 0xae]
9:87E3  6a02                 push 2
loc_87E5:
9:87E5  6a00                 push 0
9:87E7  e9bb00               jmp 0x88a5
loc_87EA:
9:87EA  837efe04             cmp word ptr [bp - 2], 4
9:87EE  7578                 jne 0x8868
9:87F0  268b87aa00           mov ax, word ptr es:[bx + 0xaa]
9:87F5  2dc400               sub ax, 0xc4
9:87F8  99                   cdq
9:87F9  2bc2                 sub ax, dx
9:87FB  d1f8                 sar ax, 1
9:87FD  268987ae00           mov word ptr es:[bx + 0xae], ax
9:8802  685006               push 0x650
9:8805  8d86fefe             lea ax, [bp - 0x102]
9:8809  16                   push ss
9:880A  50                   push ax
9:880B  68ff00               push 0xff
9:880E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:8813  9ae0845188           lcall 0x8851, 0x84e0  ; LoadStringTo@s3:84E0
9:8818  8d86fefe             lea ax, [bp - 0x102]
9:881C  16                   push ss
9:881D  50                   push ax
9:881E  c45e06               les bx, ptr [bp + 6]
9:8821  6626ffb7ae00         push dword ptr es:[bx + 0xae]
9:8827  666801000600         push 0x60001
9:882D  06                   push es
9:882E  53                   push bx
9:882F  90                   nop
9:8830  0e                   push cs
9:8831  e8b603               call 0x8bea  ; OPMessageBox::makeButtons@s9:8BEA
9:8834  c45e06               les bx, ptr [bp + 6]
9:8837  268387ae006c         add word ptr es:[bx + 0xae], 0x6c
9:883D  685106               push 0x651
9:8840  8d86fefe             lea ax, [bp - 0x102]
9:8844  16                   push ss
9:8845  50                   push ax
9:8846  68ff00               push 0xff
9:8849  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:884E  9ae0848e88           lcall 0x888e, 0x84e0  ; LoadStringTo@s3:84E0
9:8853  8d86fefe             lea ax, [bp - 0x102]
9:8857  16                   push ss
9:8858  50                   push ax
9:8859  c45e06               les bx, ptr [bp + 6]
9:885C  6626ffb7ae00         push dword ptr es:[bx + 0xae]
9:8862  6a07                 push 7
9:8864  e97eff               jmp 0x87e5
9:8867  db 90
loc_8868:
9:8868  268b87aa00           mov ax, word ptr es:[bx + 0xaa]
9:886D  2d5800               sub ax, 0x58
9:8870  99                   cdq
9:8871  2bc2                 sub ax, dx
9:8873  d1f8                 sar ax, 1
9:8875  268987ae00           mov word ptr es:[bx + 0xae], ax
9:887A  689205               push 0x592
9:887D  8d86fefe             lea ax, [bp - 0x102]
9:8881  16                   push ss
9:8882  50                   push ax
9:8883  68ff00               push 0xff
9:8886  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:888B  9ae084b688           lcall 0x88b6, 0x84e0  ; LoadStringTo@s3:84E0
9:8890  8d86fefe             lea ax, [bp - 0x102]
9:8894  16                   push ss
9:8895  50                   push ax
9:8896  c45e06               les bx, ptr [bp + 6]
9:8899  6626ffb7ae00         push dword ptr es:[bx + 0xae]
9:889F  666801000100         push 0x10001
loc_88A5:
9:88A5  06                   push es
9:88A6  53                   push bx
9:88A7  90                   nop
9:88A8  0e                   push cs
9:88A9  e83e03               call 0x8bea  ; OPMessageBox::makeButtons@s9:8BEA
9:88AC  6a48                 push 0x48
9:88AE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:88B3  9aba204a89           lcall 0x894a, 0x20ba  ; Registry_get@s3:20BA
9:88B8  8ec2                 mov es, dx
9:88BA  8bd8                 mov bx, ax
9:88BC  8986fafe             mov word ptr [bp - 0x106], ax
9:88C0  8c86fcfe             mov word ptr [bp - 0x104], es
9:88C4  268b470a             mov ax, word ptr es:[bx + 0xa]
9:88C8  8986fefe             mov word ptr [bp - 0x102], ax
9:88CC  268b470c             mov ax, word ptr es:[bx + 0xc]
9:88D0  8946fe               mov word ptr [bp - 2], ax
9:88D3  8b86fefe             mov ax, word ptr [bp - 0x102]
9:88D7  c45e06               les bx, ptr [bp + 6]
9:88DA  262b87aa00           sub ax, word ptr es:[bx + 0xaa]
9:88DF  99                   cdq
9:88E0  2bc2                 sub ax, dx
9:88E2  d1f8                 sar ax, 1
9:88E4  8986f8fe             mov word ptr [bp - 0x108], ax
9:88E8  8bc8                 mov cx, ax
9:88EA  8b46fe               mov ax, word ptr [bp - 2]
9:88ED  262b87ac00           sub ax, word ptr es:[bx + 0xac]
9:88F2  99                   cdq
9:88F3  2bc2                 sub ax, dx
9:88F5  d1f8                 sar ax, 1
9:88F7  8986f6fe             mov word ptr [bp - 0x10a], ax
9:88FB  26ff7706             push word ptr es:[bx + 6]
9:88FF  6a00                 push 0
9:8901  51                   push cx
9:8902  50                   push ax
9:8903  26ffb7aa00           push word ptr es:[bx + 0xaa]
9:8908  26ffb7ac00           push word ptr es:[bx + 0xac]
9:890D  6a40                 push 0x40
9:890F  9ad8730000           lcall 0, 0x73d8  ; USER.SetWindowPos
9:8914  c706f45d0100         mov word ptr [0x5df4], 1
9:891A  1e                   push ds
9:891B  68f45d               push 0x5df4
9:891E  9a10955989           lcall 0x8959, 0x9510  ; MessageLoop_modal@s2:9510
9:8923  83c404               add sp, 4
9:8926  66ff7606             push dword ptr [bp + 6]
9:892A  90                   nop
9:892B  0e                   push cs
9:892C  e84f02               call 0x8b7e  ; OPMessageBox::destroy@s9:8B7E
9:892F  c706f65d0000         mov word ptr [0x5df6], 0
9:8935  c45e06               les bx, ptr [bp + 6]
9:8938  2683bfb20000         cmp word ptr es:[bx + 0xb2], 0
9:893E  7431                 je 0x8971
9:8940  6a37                 push 0x37
9:8942  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:8947  9aba20a585           lcall 0x85a5, 0x20ba  ; Registry_get@s3:20BA
9:894C  8986e2fe             mov word ptr [bp - 0x11e], ax
9:8950  8996e4fe             mov word ptr [bp - 0x11c], dx
9:8954  52                   push dx
9:8955  50                   push ax
9:8956  9a54abdc84           lcall 0x84dc, 0xab54  ; MessageLog::hasEntries@s2:AB54
9:895B  0bc0                 or ax, ax
9:895D  7412                 je 0x8971
9:895F  ff369603             push word ptr [0x396]
9:8963  6668fc001101         push 0x11100fc
9:8969  666a00               push 0
9:896C  9a7e7f0000           lcall 0, 0x7f7e  ; USER.PostMessage
loc_8971:
9:8971  a1f85d               mov ax, word ptr [0x5df8]
9:8974  c9                   leave
9:8975  ca0400               retf 4

; ---------------- OPMessageBox::runWithSound@s9:8978 FAR size=44 callers=0
;   (vslot 28) with a catalog sound
9:8978  55                   push bp
9:8979  8bec                 mov bp, sp
9:897B  1e                   push ds
9:897C  68f45d               push 0x5df4
9:897F  9a10959289           lcall 0x8992, 0x9510  ; MessageLoop_modal@s2:9510
9:8984  83c404               add sp, 4
9:8987  ff760a               push word ptr [bp + 0xa]
9:898A  66ff36a002           push dword ptr [0x2a0]
9:898F  9a5c5c2387           lcall 0x8723, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
9:8994  c45e06               les bx, ptr [bp + 6]
9:8997  06                   push es
9:8998  53                   push bx
9:8999  26c41f               les bx, ptr es:[bx]
9:899C  26ff5f74             lcall es:[bx + 0x74]
9:89A0  c9                   leave
9:89A1  ca0600               retf 6

; ---------------- OPMessageBox::runWithVoice@s9:89A4 size=98 callers=0
;   (vslot 27) with a voice line
9:89A4  c80e0000             enter 0xe, 0
9:89A8  1e                   push ds
9:89A9  68f45d               push 0x5df4
9:89AC  9a1095ec89           lcall 0x89ec, 0x9510  ; MessageLoop_modal@s2:9510
9:89B1  83c404               add sp, 4
9:89B4  c45e0a               les bx, ptr [bp + 0xa]
9:89B7  268b4702             mov ax, word ptr es:[bx + 2]
9:89BB  8946fe               mov word ptr [bp - 2], ax
9:89BE  268b07               mov ax, word ptr es:[bx]
9:89C1  8946fc               mov word ptr [bp - 4], ax
9:89C4  6a02                 push 2
9:89C6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:89CB  9aba209787           lcall 0x8797, 0x20ba  ; Registry_get@s3:20BA
9:89D0  8946f8               mov word ptr [bp - 8], ax
9:89D3  8956fa               mov word ptr [bp - 6], dx
9:89D6  c45ef8               les bx, ptr [bp - 8]
9:89D9  26837f7200           cmp word ptr es:[bx + 0x72], 0
9:89DE  7416                 je 0x89f6
9:89E0  66ff76fc             push dword ptr [bp - 4]
9:89E4  66ff36a002           push dword ptr [0x2a0]
9:89E9  9a7c5c8289           lcall 0x8982, 0x5c7c  ; SoundMgr::playVoice@s2:5C7C
9:89EE  c45e06               les bx, ptr [bp + 6]
9:89F1  2689878c00           mov word ptr es:[bx + 0x8c], ax
loc_89F6:
9:89F6  c45e06               les bx, ptr [bp + 6]
9:89F9  06                   push es
9:89FA  53                   push bx
9:89FB  26c41f               les bx, ptr es:[bx]
9:89FE  26ff5f74             lcall es:[bx + 0x74]
9:8A02  c9                   leave
9:8A03  ca0800               retf 8

; ---------------- OPMessageBox::paint@s9:8A06 size=310 callers=0
;   apis: GDI.DeleteObject, GDI.SelectObject, GDI.SetBkColor, GDI.SetTextColor, USER.BeginPaint, USER.DrawIcon, USER.DrawText, USER.EndPaint, USER.GetProp, USER.SelectPalette
;   (vslot 24) icon and text
9:8A06  c8440000             enter 0x44, 0
9:8A0A  c45e06               les bx, ptr [bp + 6]
9:8A0D  26ff7706             push word ptr es:[bx + 6]
9:8A11  8d46e0               lea ax, [bp - 0x20]
9:8A14  16                   push ss
9:8A15  50                   push ax
9:8A16  9a2a5a0000           lcall 0, 0x5a2a  ; USER.BeginPaint
9:8A1B  8946de               mov word ptr [bp - 0x22], ax
9:8A1E  c41e3042             les bx, ptr [0x4230]
9:8A22  66268b470e           mov eax, dword ptr es:[bx + 0xe]
9:8A27  668946da             mov dword ptr [bp - 0x26], eax
9:8A2B  8d46de               lea ax, [bp - 0x22]
9:8A2E  16                   push ss
9:8A2F  50                   push ax
9:8A30  66ff76da             push dword ptr [bp - 0x26]
9:8A34  9a084e438a           lcall 0x8a43, 0x4e08  ; Palette::selectAndRealize@s2:4E08
9:8A39  8946d8               mov word ptr [bp - 0x28], ax
9:8A3C  66ff76da             push dword ptr [bp - 0x26]
9:8A40  9a724daf89           lcall 0x89af, 0x4d72  ; MemBlock::data@s2:4D72
9:8A45  8946d4               mov word ptr [bp - 0x2c], ax
9:8A48  8956d6               mov word ptr [bp - 0x2a], dx
9:8A4B  c45ed4               les bx, ptr [bp - 0x2c]
9:8A4E  2ac0                 sub al, al
9:8A50  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:8A55  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:8A5A  2aed                 sub ch, ch
9:8A5C  0bc1                 or ax, cx
9:8A5E  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:8A63  b502                 mov ch, 2
9:8A65  8946d0               mov word ptr [bp - 0x30], ax
9:8A68  894ed2               mov word ptr [bp - 0x2e], cx
9:8A6B  ff76de               push word ptr [bp - 0x22]
9:8A6E  66680a001400         push 0x14000a
9:8A74  c45e06               les bx, ptr [bp + 6]
9:8A77  26ffb78e00           push word ptr es:[bx + 0x8e]
9:8A7C  9affff0000           lcall 0, 0xffff  ; USER.DrawIcon
9:8A81  ff76de               push word ptr [bp - 0x22]
9:8A84  666a00               push 0
9:8A87  9a008b0000           lcall 0, 0x8b00  ; GDI.SetBkColor
9:8A8C  8946cc               mov word ptr [bp - 0x34], ax
9:8A8F  8956ce               mov word ptr [bp - 0x32], dx
9:8A92  ff76de               push word ptr [bp - 0x22]
9:8A95  66ff76d0             push dword ptr [bp - 0x30]
9:8A99  9a0c8b0000           lcall 0, 0x8b0c  ; GDI.SetTextColor
9:8A9E  8946c8               mov word ptr [bp - 0x38], ax
9:8AA1  8956ca               mov word ptr [bp - 0x36], dx
9:8AA4  c746c40000           mov word ptr [bp - 0x3c], 0
9:8AA9  c45e06               les bx, ptr [bp + 6]
9:8AAC  26ff7706             push word ptr es:[bx + 6]
9:8AB0  1e                   push ds
9:8AB1  68fa5d               push 0x5dfa  ; 'hfont'
9:8AB4  9a677d0000           lcall 0, 0x7d67  ; USER.GetProp
9:8AB9  8946c6               mov word ptr [bp - 0x3a], ax
9:8ABC  0bc0                 or ax, ax
9:8ABE  740c                 je 0x8acc
9:8AC0  ff76de               push word ptr [bp - 0x22]
9:8AC3  50                   push ax
9:8AC4  9af48a0000           lcall 0, 0x8af4  ; GDI.SelectObject
9:8AC9  8946c4               mov word ptr [bp - 0x3c], ax
loc_8ACC:
9:8ACC  ff76de               push word ptr [bp - 0x22]
9:8ACF  c45e06               les bx, ptr [bp + 6]
9:8AD2  6626ffb79000         push dword ptr es:[bx + 0x90]
9:8AD8  6aff                 push -1
9:8ADA  8d879e00             lea ax, [bx + 0x9e]
9:8ADE  06                   push es
9:8ADF  50                   push ax
9:8AE0  6a10                 push 0x10
9:8AE2  9aba220000           lcall 0, 0x22ba  ; USER.DrawText
9:8AE7  837ec600             cmp word ptr [bp - 0x3a], 0
9:8AEB  740b                 je 0x8af8
9:8AED  ff76de               push word ptr [bp - 0x22]
9:8AF0  ff76c4               push word ptr [bp - 0x3c]
9:8AF3  9a637c0000           lcall 0, 0x7c63  ; GDI.SelectObject
loc_8AF8:
9:8AF8  ff76de               push word ptr [bp - 0x22]
9:8AFB  66ff76cc             push dword ptr [bp - 0x34]
9:8AFF  9a0f7f0000           lcall 0, 0x7f0f  ; GDI.SetBkColor
9:8B04  ff76de               push word ptr [bp - 0x22]
9:8B07  66ff76c8             push dword ptr [bp - 0x38]
9:8B0B  9a017f0000           lcall 0, 0x7f01  ; GDI.SetTextColor
9:8B10  ff76de               push word ptr [bp - 0x22]
9:8B13  ff76d8               push word ptr [bp - 0x28]
9:8B16  6a00                 push 0
9:8B18  9a347e0000           lcall 0, 0x7e34  ; USER.SelectPalette
9:8B1D  50                   push ax
9:8B1E  9acd830000           lcall 0, 0x83cd  ; GDI.DeleteObject
9:8B23  c45e06               les bx, ptr [bp + 6]
9:8B26  26ff7706             push word ptr es:[bx + 6]
9:8B2A  8d46e0               lea ax, [bp - 0x20]
9:8B2D  16                   push ss
9:8B2E  50                   push ax
9:8B2F  9ac95c0000           lcall 0, 0x5cc9  ; USER.EndPaint
9:8B34  b80100               mov ax, 1
9:8B37  c9                   leave
9:8B38  ca0400               retf 4
9:8B3B  db 00

; ---------------- OPMessageBox::onCommand@s9:8B3C FAR size=66 callers=0
;   (vslot 4)
9:8B3C  55                   push bp
9:8B3D  8bec                 mov bp, sp
9:8B3F  8b460e               mov ax, word ptr [bp + 0xe]
9:8B42  2d0100               sub ax, 1
9:8B45  720f                 jb 0x8b56
9:8B47  2d0100               sub ax, 1
9:8B4A  761e                 jbe 0x8b6a
9:8B4C  2d0400               sub ax, 4
9:8B4F  7205                 jb 0x8b56
9:8B51  2d0100               sub ax, 1
9:8B54  7614                 jbe 0x8b6a
loc_8B56:
9:8B56  66ff760c             push dword ptr [bp + 0xc]
9:8B5A  66ff7608             push dword ptr [bp + 8]
9:8B5E  ff7606               push word ptr [bp + 6]
9:8B61  90                   nop
9:8B62  0e                   push cs
9:8B63  e8d6ef               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:8B66  c9                   leave
9:8B67  ca0a00               retf 0xa
loc_8B6A:
9:8B6A  c706f45d0000         mov word ptr [0x5df4], 0
9:8B70  8b460e               mov ax, word ptr [bp + 0xe]
9:8B73  a3f85d               mov word ptr [0x5df8], ax
9:8B76  b80100               mov ax, 1
9:8B79  99                   cdq
9:8B7A  c9                   leave
9:8B7B  ca0a00               retf 0xa

; ---------------- OPMessageBox::destroy@s9:8B7E FAR size=20 callers=1
;   apis: USER.DestroyWindow
;   DestroyWindow
9:8B7E  55                   push bp
9:8B7F  8bec                 mov bp, sp
9:8B81  c45e06               les bx, ptr [bp + 6]
9:8B84  26ff7706             push word ptr es:[bx + 6]
9:8B88  9a37820000           lcall 0, 0x8237  ; USER.DestroyWindow
9:8B8D  c9                   leave
9:8B8E  ca0400               retf 4
9:8B91  db 00

; ---------------- OPMessageBox::icon@s9:8B92 FAR size=88 callers=2
;   apis: USER.LoadIcon
;   icon by MB_ type
9:8B92  c8020000             enter 2, 0
9:8B96  c45e06               les bx, ptr [bp + 6]
9:8B99  268a879800           mov al, byte ptr es:[bx + 0x98]
9:8B9E  25f000               and ax, 0xf0
9:8BA1  3d3000               cmp ax, 0x30
9:8BA4  7508                 jne 0x8bae
9:8BA6  666a00               push 0
9:8BA9  68037f               push 0x7f03
9:8BAC  eb2b                 jmp 0x8bd9
loc_8BAE:
9:8BAE  3d1000               cmp ax, 0x10
9:8BB1  7402                 je 0x8bb5
9:8BB3  7509                 jne 0x8bbe
loc_8BB5:
9:8BB5  666a00               push 0
9:8BB8  68017f               push 0x7f01
9:8BBB  eb1c                 jmp 0x8bd9
9:8BBD  db 90
loc_8BBE:
9:8BBE  3d4000               cmp ax, 0x40
9:8BC1  7402                 je 0x8bc5
9:8BC3  7509                 jne 0x8bce
loc_8BC5:
9:8BC5  666a00               push 0
9:8BC8  68047f               push 0x7f04
9:8BCB  eb0c                 jmp 0x8bd9
9:8BCD  db 90
loc_8BCE:
9:8BCE  3d2000               cmp ax, 0x20
9:8BD1  7513                 jne 0x8be6
9:8BD3  666a00               push 0
9:8BD6  68027f               push 0x7f02
loc_8BD9:
9:8BD9  9affff0000           lcall 0, 0xffff  ; USER.LoadIcon
9:8BDE  c45e06               les bx, ptr [bp + 6]
9:8BE1  2689878e00           mov word ptr es:[bx + 0x8e], ax
loc_8BE6:
9:8BE6  c9                   leave
9:8BE7  ca0400               retf 4

; ---------------- OPMessageBox::makeButtons@s9:8BEA FAR size=124 callers=1
;   apis: USER.CreateWindow, USER.GetProp, USER.SendMessage
;   OPButtons
9:8BEA  c8080000             enter 8, 0
9:8BEE  66c746fc00000150     mov dword ptr [bp - 4], 0x50010000
9:8BF6  837e0a00             cmp word ptr [bp + 0xa], 0
9:8BFA  7408                 je 0x8c04
9:8BFC  66c746fc01000150     mov dword ptr [bp - 4], 0x50010001
loc_8C04:
9:8C04  c45e06               les bx, ptr [bp + 6]
9:8C07  26837f7400           cmp word ptr es:[bx + 0x74], 0
9:8C0C  7404                 je 0x8c12
9:8C0E  804eff08             or byte ptr [bp - 1], 8
loc_8C12:
9:8C12  1e                   push ds
9:8C13  68005e               push 0x5e00  ; 'OPButton'
9:8C16  66ff7612             push dword ptr [bp + 0x12]
9:8C1A  66ff76fc             push dword ptr [bp - 4]
9:8C1E  ff760e               push word ptr [bp + 0xe]
9:8C21  ff7610               push word ptr [bp + 0x10]
9:8C24  666817005800         push 0x580017
9:8C2A  26ff7706             push word ptr es:[bx + 6]
9:8C2E  ff760c               push word ptr [bp + 0xc]
9:8C31  ff368c03             push word ptr [0x38c]
9:8C35  666a00               push 0
9:8C38  9a75760000           lcall 0, 0x7675  ; USER.CreateWindow
9:8C3D  8946fa               mov word ptr [bp - 6], ax
9:8C40  c45e06               les bx, ptr [bp + 6]
9:8C43  26ff7706             push word ptr es:[bx + 6]
9:8C47  1e                   push ds
9:8C48  68095e               push 0x5e09  ; 'hfont'
9:8C4B  9ab58a0000           lcall 0, 0x8ab5  ; USER.GetProp
9:8C50  0bc0                 or ax, ax
9:8C52  740e                 je 0x8c62
9:8C54  ff76fa               push word ptr [bp - 6]
9:8C57  6a30                 push 0x30
9:8C59  50                   push ax
9:8C5A  666a01               push 1
9:8C5D  9aa9730000           lcall 0, 0x73a9  ; USER.SendMessage
loc_8C62:
9:8C62  c9                   leave
9:8C63  ca1000               retf 0x10

; ---------------- OPMessageBox::layout@s9:8C66 FAR size=174 callers=1
;   apis: USER.GetDC, USER.GetSystemMetrics, USER.ReleaseDC
;   sizes to the text
9:8C66  c8040000             enter 4, 0
9:8C6A  57                   push di
9:8C6B  56                   push si
9:8C6C  c45e06               les bx, ptr [bp + 6]
9:8C6F  26ff7706             push word ptr es:[bx + 6]
9:8C73  9a54720000           lcall 0, 0x7254  ; USER.GetDC
9:8C78  8946fe               mov word ptr [bp - 2], ax
9:8C7B  50                   push ax
9:8C7C  66ff7606             push dword ptr [bp + 6]
9:8C80  90                   nop
9:8C81  0e                   push cs
9:8C82  e88f00               call 0x8d14  ; OPMessageBox::measureText@s9:8D14
9:8C85  c45e06               les bx, ptr [bp + 6]
9:8C88  1e                   push ds
9:8C89  8dbfa600             lea di, [bx + 0xa6]
9:8C8D  8db79e00             lea si, [bx + 0x9e]
9:8C91  06                   push es
9:8C92  1f                   pop ds
9:8C93  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:8C95  66a5                 movsd dword ptr es:[di], dword ptr [si]
9:8C97  1f                   pop ds
9:8C98  6a04                 push 4
9:8C9A  9ac68c0000           lcall 0, 0x8cc6  ; USER.GetSystemMetrics
9:8C9F  c45e06               les bx, ptr [bp + 6]
9:8CA2  260187ac00           add word ptr es:[bx + 0xac], ax
9:8CA7  268a879800           mov al, byte ptr es:[bx + 0x98]
9:8CAC  25f000               and ax, 0xf0
9:8CAF  3d3000               cmp ax, 0x30
9:8CB2  740f                 je 0x8cc3
9:8CB4  3d1000               cmp ax, 0x10
9:8CB7  740a                 je 0x8cc3
9:8CB9  3d4000               cmp ax, 0x40
9:8CBC  7405                 je 0x8cc3
9:8CBE  3d2000               cmp ax, 0x20
9:8CC1  7520                 jne 0x8ce3
loc_8CC3:
9:8CC3  6a0c                 push 0xc
9:8CC5  9ad78c0000           lcall 0, 0x8cd7  ; USER.GetSystemMetrics
9:8CCA  c45e06               les bx, ptr [bp + 6]
9:8CCD  263987ac00           cmp word ptr es:[bx + 0xac], ax
9:8CD2  7d0f                 jge 0x8ce3
9:8CD4  6a0c                 push 0xc
9:8CD6  9aa2820000           lcall 0, 0x82a2  ; USER.GetSystemMetrics
9:8CDB  c45e06               les bx, ptr [bp + 6]
9:8CDE  268987ac00           mov word ptr es:[bx + 0xac], ax
loc_8CE3:
9:8CE3  c45e06               les bx, ptr [bp + 6]
9:8CE6  268387aa0014         add word ptr es:[bx + 0xaa], 0x14
9:8CEC  268387ac000a         add word ptr es:[bx + 0xac], 0xa
9:8CF2  268b87ac00           mov ax, word ptr es:[bx + 0xac]
9:8CF7  268987b000           mov word ptr es:[bx + 0xb0], ax
9:8CFC  268387ac0030         add word ptr es:[bx + 0xac], 0x30
9:8D02  26ff7706             push word ptr es:[bx + 6]
9:8D06  ff76fe               push word ptr [bp - 2]
9:8D09  9afd7b0000           lcall 0, 0x7bfd  ; USER.ReleaseDC
9:8D0E  5e                   pop si
9:8D0F  5f                   pop di
9:8D10  c9                   leave
9:8D11  ca0400               retf 4

; ---------------- OPMessageBox::measureText@s9:8D14 FAR size=162 callers=1
;   apis: GDI.SelectObject, USER.DrawText, USER.GetProp, USER.GetSystemMetrics
;   DrawText CALCRECT
9:8D14  c8060000             enter 6, 0
9:8D18  c45e06               les bx, ptr [bp + 6]
9:8D1B  268a879800           mov al, byte ptr es:[bx + 0x98]
9:8D20  25f000               and ax, 0xf0
9:8D23  3d3000               cmp ax, 0x30
9:8D26  740f                 je 0x8d37
9:8D28  3d1000               cmp ax, 0x10
9:8D2B  740a                 je 0x8d37
9:8D2D  3d4000               cmp ax, 0x40
9:8D30  7405                 je 0x8d37
9:8D32  3d2000               cmp ax, 0x20
9:8D35  751b                 jne 0x8d52
loc_8D37:
9:8D37  26c787a0000a00       mov word ptr es:[bx + 0xa0], 0xa
9:8D3E  6a0b                 push 0xb
9:8D40  9a9b8c0000           lcall 0, 0x8c9b  ; USER.GetSystemMetrics
9:8D45  052800               add ax, 0x28
9:8D48  c45e06               les bx, ptr [bp + 6]
9:8D4B  2689879e00           mov word ptr es:[bx + 0x9e], ax
9:8D50  eb0e                 jmp 0x8d60
loc_8D52:
9:8D52  26c787a0000a00       mov word ptr es:[bx + 0xa0], 0xa
9:8D59  26c7879e001400       mov word ptr es:[bx + 0x9e], 0x14
loc_8D60:
9:8D60  c746fa0000           mov word ptr [bp - 6], 0
9:8D65  c45e06               les bx, ptr [bp + 6]
9:8D68  26ff7706             push word ptr es:[bx + 6]
9:8D6C  1e                   push ds
9:8D6D  680f5e               push 0x5e0f  ; 'hfont'
9:8D70  9a4c8c0000           lcall 0, 0x8c4c  ; USER.GetProp
9:8D75  0bc0                 or ax, ax
9:8D77  740c                 je 0x8d85
9:8D79  ff760a               push word ptr [bp + 0xa]
9:8D7C  50                   push ax
9:8D7D  9aae8d0000           lcall 0, 0x8dae  ; GDI.SelectObject
9:8D82  8946fa               mov word ptr [bp - 6], ax
loc_8D85:
9:8D85  ff760a               push word ptr [bp + 0xa]
9:8D88  c45e06               les bx, ptr [bp + 6]
9:8D8B  6626ffb79000         push dword ptr es:[bx + 0x90]
9:8D91  6aff                 push -1
9:8D93  8d879e00             lea ax, [bx + 0x9e]
9:8D97  06                   push es
9:8D98  50                   push ax
9:8D99  681004               push 0x410
9:8D9C  9ae38a0000           lcall 0, 0x8ae3  ; USER.DrawText
9:8DA1  837efa00             cmp word ptr [bp - 6], 0
9:8DA5  740b                 je 0x8db2
9:8DA7  ff760a               push word ptr [bp + 0xa]
9:8DAA  ff76fa               push word ptr [bp - 6]
9:8DAD  9ac58a0000           lcall 0, 0x8ac5  ; GDI.SelectObject
loc_8DB2:
9:8DB2  c9                   leave
9:8DB3  ca0600               retf 6

; ---------------- OPMessageBox::scalar_dtor@s9:8DB6 FAR size=162 callers=0
;   deleting destructor
9:8DB6  55                   push bp
9:8DB7  8bec                 mov bp, sp
9:8DB9  66ff7606             push dword ptr [bp + 6]
9:8DBD  90                   nop
9:8DBE  0e                   push cs
9:8DBF  e8d8f8               call 0x869a  ; OPMessageBox::~OPMessageBox@s9:869A
9:8DC2  f6460a01             test byte ptr [bp + 0xa], 1
9:8DC6  7409                 je 0x8dd1
9:8DC8  66ff7606             push dword ptr [bp + 6]
9:8DCC  9ace175287           lcall 0x8752, 0x17ce  ; operator_delete@s1:17CE
loc_8DD1:
9:8DD1  8b4606               mov ax, word ptr [bp + 6]
9:8DD4  8b5608               mov dx, word ptr [bp + 8]
9:8DD7  c9                   leave
9:8DD8  ca0600               retf 6
9:8DDB  db 90 b6 8d e6 8d 10 3a 37 8a e2 78 ea 8d c0 79 ee
9:8DEB  db 8d 3c 8b f2 8d 98 7b f6 8d 56 7f fa 8d b2 7b fe
9:8DFB  db 8d 1c 7f 02 8e 12 82 06 8e 86 7f 0a 8e 0c 80 0e
9:8E0B  db 8e 54 80 12 8e 5e 7e 16 8e 58 81 1a 8e b6 81 1e
9:8E1B  db 8e fe 81 26 8e ea 60 32 8e 4a 82 2a 8e 66 82 2e
9:8E2B  db 8e de 78 3e 8e ee 60 36 8e f4 60 3a 8e fa 60 42
9:8E3B  db 8e 06 8a 46 8e fe 60 52 84 7e 80 4a 8e a4 89 4e
9:8E4B  db 8e 78 89 52 8e 18 87 56 8e dc 86 aa 86

; ---------------- BuildingDlg::BuildingDlg@s9:8E58 FAR size=42 callers=1
;   a building's window (its type's dialog; vtable 8F3C)
9:8E58  55                   push bp
9:8E59  8bec                 mov bp, sp
9:8E5B  66ff760c             push dword ptr [bp + 0xc]
9:8E5F  66ff7608             push dword ptr [bp + 8]
9:8E63  ff7606               push word ptr [bp + 6]
9:8E66  90                   nop
9:8E67  0e                   push cs
9:8E68  e8d521               call 0xb040  ; BuildingDlgBase::BuildingDlgBase@s9:B040
9:8E6B  c45e06               les bx, ptr [bp + 6]
9:8E6E  26c7073c8f           mov word ptr es:[bx], 0x8f3c
9:8E73  26c74702de8d         mov word ptr es:[bx + 2], 0x8dde  ; SEGMENT s9:0000
9:8E79  8bc3                 mov ax, bx
9:8E7B  8cc2                 mov dx, es
9:8E7D  c9                   leave
9:8E7E  ca0a00               retf 0xa
9:8E81  db 00

; ---------------- BuildingDlg::~BuildingDlg@s9:8E82 FAR size=30 callers=1
;   dtor
9:8E82  55                   push bp
9:8E83  8bec                 mov bp, sp
9:8E85  c45e06               les bx, ptr [bp + 6]
9:8E88  26c7073c8f           mov word ptr es:[bx], 0x8f3c
9:8E8D  26c74702778e         mov word ptr es:[bx + 2], 0x8e77  ; SEGMENT s9:0000
9:8E93  66ff7606             push dword ptr [bp + 6]
9:8E97  90                   nop
9:8E98  0e                   push cs
9:8E99  e85c22               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:8E9C  c9                   leave
9:8E9D  ca0400               retf 4

; ---------------- BuildingDlg::onCommand@s9:8EA0 size=118 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SetWindowPos
;   (vslot 4)
9:8EA0  c8080000             enter 8, 0
9:8EA4  8b460e               mov ax, word ptr [bp + 0xe]
9:8EA7  2df800               sub ax, 0xf8
9:8EAA  744e                 je 0x8efa
9:8EAC  2de016               sub ax, 0x16e0
9:8EAF  7415                 je 0x8ec6
9:8EB1  66ff760c             push dword ptr [bp + 0xc]
9:8EB5  66ff7608             push dword ptr [bp + 8]
9:8EB9  ff7606               push word ptr [bp + 6]
9:8EBC  90                   nop
9:8EBD  0e                   push cs
9:8EBE  e88926               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:8EC1  c9                   leave
9:8EC2  ca0a00               retf 0xa
9:8EC5  db 90
loc_8EC6:
9:8EC6  c45e06               les bx, ptr [bp + 6]
9:8EC9  26ff7706             push word ptr es:[bx + 6]
9:8ECD  666a00               push 0
9:8ED0  666869020000         push 0x269
9:8ED6  66680600f600         push 0xf60006
9:8EDC  9a10890000           lcall 0, 0x8910  ; USER.SetWindowPos
9:8EE1  c45e06               les bx, ptr [bp + 6]
9:8EE4  26ff7706             push word ptr es:[bx + 6]
9:8EE8  68d817               push 0x17d8
9:8EEB  9a058f0000           lcall 0, 0x8f05  ; USER.GetDlgItem
9:8EF0  50                   push ax
9:8EF1  6a00                 push 0
loc_8EF3:
9:8EF3  9af6860000           lcall 0, 0x86f6  ; USER.EnableWindow
9:8EF8  eb14                 jmp 0x8f0e
loc_8EFA:
9:8EFA  c45e06               les bx, ptr [bp + 6]
9:8EFD  26ff7706             push word ptr es:[bx + 6]
9:8F01  68d817               push 0x17d8
9:8F04  9aea860000           lcall 0, 0x86ea  ; USER.GetDlgItem
9:8F09  50                   push ax
9:8F0A  6a01                 push 1
9:8F0C  ebe5                 jmp 0x8ef3
loc_8F0E:
9:8F0E  b80100               mov ax, 1
9:8F11  99                   cdq
9:8F12  c9                   leave
9:8F13  ca0a00               retf 0xa

; ---------------- BuildingDlg::scalar_dtor@s9:8F16 FAR size=162 callers=0
;   deleting destructor
9:8F16  55                   push bp
9:8F17  8bec                 mov bp, sp
9:8F19  66ff7606             push dword ptr [bp + 6]
9:8F1D  90                   nop
9:8F1E  0e                   push cs
9:8F1F  e860ff               call 0x8e82  ; BuildingDlg::~BuildingDlg@s9:8E82
9:8F22  f6460a01             test byte ptr [bp + 0xa], 1
9:8F26  7409                 je 0x8f31
9:8F28  66ff7606             push dword ptr [bp + 6]
9:8F2C  9ace17cf8d           lcall 0x8dcf, 0x17ce  ; operator_delete@s1:17CE
loc_8F31:
9:8F31  8b4606               mov ax, word ptr [bp + 6]
9:8F34  8b5608               mov dx, word ptr [bp + 8]
9:8F37  c9                   leave
9:8F38  ca0600               retf 6
9:8F3B  db 90 16 8f 46 8f 10 3a e2 8d 30 b2 4a 8f 16 b3 4e
9:8F4B  db 8f a0 8e 52 8f 26 b7 56 8f 56 7f 5a 8f b2 7b 5e
9:8F5B  db 8f 1c 7f 66 8f 48 88 9e 8f 86 7f 6a 8f 0c 80 6e
9:8F6B  db 8f 54 80 72 8f 72 b3 76 8f 58 81 7a 8f b6 81 7e
9:8F7B  db 8f fe 81 86 8f ea 60 92 8f 4a 82 8a 8f 66 82 8e
9:8F8B  db 8f de 78 9a 8f ee 60 96 8f f4 60 a2 8f c8 b4 a6
9:8F9B  db 8f 42 88 b6 8f fe 60 22 8e 7e 80 aa 8f 3c b4 ae
9:8FAB  db 8f 5e b4 b2 8f 7c b1 91 8e 4c 88 6e 84

; ---------------- OPCtrl::OPCtrl@s9:8FB8 FAR size=358 callers=2
;   apis: KERNEL.MakeProcInstance
;   custom control base (subclassed button; vtable 9800)
9:8FB8  c8040000             enter 4, 0
9:8FBC  c45e06               les bx, ptr [bp + 6]
9:8FBF  26c7079a38           mov word ptr es:[bx], 0x389a
9:8FC4  26c74702ce90         mov word ptr es:[bx + 2], 0x90ce  ; SEGMENT s2:0000
9:8FCA  c45e06               les bx, ptr [bp + 6]
9:8FCD  662bc0               sub eax, eax
9:8FD0  6626894704           mov dword ptr es:[bx + 4], eax
9:8FD5  6626894708           mov dword ptr es:[bx + 8], eax
9:8FDA  662689470c           mov dword ptr es:[bx + 0xc], eax
9:8FDF  6626894710           mov dword ptr es:[bx + 0x10], eax
9:8FE4  6626894714           mov dword ptr es:[bx + 0x14], eax
9:8FE9  26894718             mov word ptr es:[bx + 0x18], ax
9:8FED  8b4618               mov ax, word ptr [bp + 0x18]
9:8FF0  2689471a             mov word ptr es:[bx + 0x1a], ax
9:8FF4  8b4616               mov ax, word ptr [bp + 0x16]
9:8FF7  2689471c             mov word ptr es:[bx + 0x1c], ax
9:8FFB  26c747360500         mov word ptr es:[bx + 0x36], 5
9:9001  33c0                 xor ax, ax
9:9003  26894738             mov word ptr es:[bx + 0x38], ax
9:9007  2689473a             mov word ptr es:[bx + 0x3a], ax
9:900B  26c7473c0200         mov word ptr es:[bx + 0x3c], 2
9:9011  2689473e             mov word ptr es:[bx + 0x3e], ax
9:9015  8b4e0a               mov cx, word ptr [bp + 0xa]
9:9018  26894f40             mov word ptr es:[bx + 0x40], cx
9:901C  26c7070098           mov word ptr es:[bx], 0x9800
9:9021  26c74702fa90         mov word ptr es:[bx + 2], 0x90fa  ; SEGMENT s9:0000
9:9027  268b4f36             mov cx, word ptr es:[bx + 0x36]
9:902B  26894f28             mov word ptr es:[bx + 0x28], cx
9:902F  26894f26             mov word ptr es:[bx + 0x26], cx
9:9033  2689472c             mov word ptr es:[bx + 0x2c], ax
9:9037  2689472a             mov word ptr es:[bx + 0x2a], ax
9:903B  394614               cmp word ptr [bp + 0x14], ax
9:903E  7468                 je 0x90a8
9:9040  394612               cmp word ptr [bp + 0x12], ax
9:9043  7463                 je 0x90a8
9:9045  26c747380100         mov word ptr es:[bx + 0x38], 1
9:904B  ff7614               push word ptr [bp + 0x14]
9:904E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:9053  9a0a836e90           lcall 0x906e, 0x830a  ; ResLibr::picture@s3:830A
9:9058  c45e06               les bx, ptr [bp + 6]
9:905B  26894708             mov word ptr es:[bx + 8], ax
9:905F  2689570a             mov word ptr es:[bx + 0xa], dx
9:9063  ff7612               push word ptr [bp + 0x12]
9:9066  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:906B  9a0a838c90           lcall 0x908c, 0x830a  ; ResLibr::picture@s3:830A
9:9070  c45e06               les bx, ptr [bp + 6]
9:9073  2689470c             mov word ptr es:[bx + 0xc], ax
9:9077  2689570e             mov word ptr es:[bx + 0xe], dx
9:907B  837e1000             cmp word ptr [bp + 0x10], 0
9:907F  741b                 je 0x909c
9:9081  ff7610               push word ptr [bp + 0x10]
9:9084  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:9089  9a0a83ce89           lcall 0x89ce, 0x830a  ; ResLibr::picture@s3:830A
9:908E  c45e06               les bx, ptr [bp + 6]
9:9091  26894710             mov word ptr es:[bx + 0x10], ax
9:9095  26895712             mov word ptr es:[bx + 0x12], dx
9:9099  eb0d                 jmp 0x90a8
9:909B  db 90
loc_909C:
9:909C  c45e06               les bx, ptr [bp + 6]
9:909F  6626c7471000000000   mov dword ptr es:[bx + 0x10], 0
loc_90A8:
9:90A8  c45e06               les bx, ptr [bp + 6]
9:90AB  268b4736             mov ax, word ptr es:[bx + 0x36]
9:90AF  26894730             mov word ptr es:[bx + 0x30], ax
9:90B3  2689472e             mov word ptr es:[bx + 0x2e], ax
9:90B7  6626c7473200000000   mov dword ptr es:[bx + 0x32], 0
9:90C0  66837e0c00           cmp dword ptr [bp + 0xc], 0
9:90C5  7417                 je 0x90de
9:90C7  66ff760c             push dword ptr [bp + 0xc]
9:90CB  9ae860428f           lcall 0x8f42, 0x60e8  ; _strdup@s2:60E8
9:90D0  83c404               add sp, 4
9:90D3  c45e06               les bx, ptr [bp + 6]
9:90D6  26894704             mov word ptr es:[bx + 4], ax
9:90DA  26895706             mov word ptr es:[bx + 6], dx
loc_90DE:
9:90DE  6633c0               xor eax, eax
9:90E1  c45e06               les bx, ptr [bp + 6]
9:90E4  6626894722           mov dword ptr es:[bx + 0x22], eax
9:90E9  2689471e             mov word ptr es:[bx + 0x1e], ax
9:90ED  26894720             mov word ptr es:[bx + 0x20], ax
9:90F1  66833e185e00         cmp dword ptr [0x5e18], 0
9:90F7  7516                 jne 0x910f
9:90F9  683e8f               push 0x8f3e  ; SEGMENT s9:0000
9:90FC  688496               push 0x9684
9:90FF  ff368c03             push word ptr [0x38c]
9:9103  9affff0000           lcall 0, 0xffff  ; KERNEL.MakeProcInstance
9:9108  a3185e               mov word ptr [0x5e18], ax
9:910B  89161a5e             mov word ptr [0x5e1a], dx
loc_910F:
9:910F  ff06165e             inc word ptr [0x5e16]
9:9113  8b4606               mov ax, word ptr [bp + 6]
9:9116  8b5608               mov dx, word ptr [bp + 8]
9:9119  c9                   leave
9:911A  ca1400               retf 0x14
9:911D  db 00

; ---------------- OPCtrl::~OPCtrl@s9:911E FAR size=278 callers=3
;   apis: KERNEL.FreeProcInstance, USER.RemoveProp, USER.SetWindowLong
;   removes the properties, restores the window proc
9:911E  c80c0000             enter 0xc, 0
9:9122  56                   push si
9:9123  c45e06               les bx, ptr [bp + 6]
9:9126  26c7070098           mov word ptr es:[bx], 0x9800
9:912B  26c747022590         mov word ptr es:[bx + 2], 0x9025  ; SEGMENT s9:0000
9:9131  26837f3800           cmp word ptr es:[bx + 0x38], 0
9:9136  745a                 je 0x9192
9:9138  268b4708             mov ax, word ptr es:[bx + 8]
9:913C  268b570a             mov dx, word ptr es:[bx + 0xa]
9:9140  8bda                 mov bx, dx
9:9142  0bd0                 or dx, ax
9:9144  740e                 je 0x9154
9:9146  6a01                 push 1
9:9148  53                   push bx
9:9149  50                   push ax
9:914A  8ec3                 mov es, bx
9:914C  8bf0                 mov si, ax
9:914E  26c41c               les bx, ptr es:[si]
9:9151  26ff1f               lcall es:[bx]
loc_9154:
9:9154  c45e06               les bx, ptr [bp + 6]
9:9157  268b470c             mov ax, word ptr es:[bx + 0xc]
9:915B  268b570e             mov dx, word ptr es:[bx + 0xe]
9:915F  8bda                 mov bx, dx
9:9161  0bd8                 or bx, ax
9:9163  740e                 je 0x9173
9:9165  6a01                 push 1
9:9167  52                   push dx
9:9168  50                   push ax
9:9169  8ec2                 mov es, dx
9:916B  8bd8                 mov bx, ax
9:916D  26c41f               les bx, ptr es:[bx]
9:9170  26ff1f               lcall es:[bx]
loc_9173:
9:9173  c45e06               les bx, ptr [bp + 6]
9:9176  268b4710             mov ax, word ptr es:[bx + 0x10]
9:917A  268b5712             mov dx, word ptr es:[bx + 0x12]
9:917E  8bda                 mov bx, dx
9:9180  0bd8                 or bx, ax
9:9182  740e                 je 0x9192
9:9184  6a01                 push 1
9:9186  52                   push dx
9:9187  50                   push ax
9:9188  8ec2                 mov es, dx
9:918A  8bd8                 mov bx, ax
9:918C  26c41f               les bx, ptr es:[bx]
9:918F  26ff1f               lcall es:[bx]
loc_9192:
9:9192  c45e06               les bx, ptr [bp + 6]
9:9195  66268b4704           mov eax, dword ptr es:[bx + 4]
9:919A  6650                 push eax
9:919C  9ace172f8f           lcall 0x8f2f, 0x17ce  ; operator_delete@s1:17CE
9:91A1  83c404               add sp, 4
9:91A4  c45e06               les bx, ptr [bp + 6]
9:91A7  26ff7718             push word ptr es:[bx + 0x18]
9:91AB  6afc                 push -4
9:91AD  6626ff7714           push dword ptr es:[bx + 0x14]
9:91B2  9a61790000           lcall 0, 0x7961  ; USER.SetWindowLong
9:91B7  c45e06               les bx, ptr [bp + 6]
9:91BA  26ff7718             push word ptr es:[bx + 0x18]
9:91BE  1e                   push ds
9:91BF  681c5e               push 0x5e1c  ; 'thisLo'
9:91C2  9ad3910000           lcall 0, 0x91d3  ; USER.RemoveProp
9:91C7  c45e06               les bx, ptr [bp + 6]
9:91CA  26ff7718             push word ptr es:[bx + 0x18]
9:91CE  1e                   push ds
9:91CF  68235e               push 0x5e23  ; 'thisHi'
9:91D2  9ae3910000           lcall 0, 0x91e3  ; USER.RemoveProp
9:91D7  c45e06               les bx, ptr [bp + 6]
9:91DA  26ff7718             push word ptr es:[bx + 0x18]
9:91DE  1e                   push ds
9:91DF  682a5e               push 0x5e2a  ; 'procLo'
9:91E2  9af3910000           lcall 0, 0x91f3  ; USER.RemoveProp
9:91E7  c45e06               les bx, ptr [bp + 6]
9:91EA  26ff7718             push word ptr es:[bx + 0x18]
9:91EE  1e                   push ds
9:91EF  68315e               push 0x5e31  ; 'procHi'
9:91F2  9a03920000           lcall 0, 0x9203  ; USER.RemoveProp
9:91F7  c45e06               les bx, ptr [bp + 6]
9:91FA  26ff7718             push word ptr es:[bx + 0x18]
9:91FE  1e                   push ds
9:91FF  68385e               push 0x5e38  ; 'IsDlg'
9:9202  9a96780000           lcall 0, 0x7896  ; USER.RemoveProp
9:9207  ff0e165e             dec word ptr [0x5e16]
9:920B  7513                 jne 0x9220
9:920D  66ff36185e           push dword ptr [0x5e18]
9:9212  9affff0000           lcall 0, 0xffff  ; KERNEL.FreeProcInstance
9:9217  66c706185e00000000   mov dword ptr [0x5e18], 0
loc_9220:
9:9220  c45e06               les bx, ptr [bp + 6]
9:9223  26c7079a38           mov word ptr es:[bx], 0x389a
9:9228  26c74702c88f         mov word ptr es:[bx + 2], 0x8fc8  ; SEGMENT s2:0000
9:922E  5e                   pop si
9:922F  c9                   leave
9:9230  ca0400               retf 4
9:9233  db 00

; ---------------- OPCtrl::enable@s9:9234 FAR size=30 callers=9
;   apis: USER.EnableWindow
;   EnableWindow
9:9234  55                   push bp
9:9235  8bec                 mov bp, sp
9:9237  c45e06               les bx, ptr [bp + 6]
9:923A  26837f1800           cmp word ptr es:[bx + 0x18], 0
9:923F  740c                 je 0x924d
9:9241  26ff7718             push word ptr es:[bx + 0x18]
9:9245  ff760a               push word ptr [bp + 0xa]
9:9248  9af48e0000           lcall 0, 0x8ef4  ; USER.EnableWindow
loc_924D:
9:924D  c9                   leave
9:924E  ca0600               retf 6
9:9251  db 00

; ---------------- OPCtrl::layout@s9:9252 FAR size=138 callers=2
;   (vslot 1) size from its picture and label
9:9252  55                   push bp
9:9253  8bec                 mov bp, sp
9:9255  c45e06               les bx, ptr [bp + 6]
9:9258  6626837f0400         cmp dword ptr es:[bx + 4], 0
9:925E  7407                 je 0x9267
9:9260  06                   push es
9:9261  53                   push bx
9:9262  90                   nop
9:9263  0e                   push cs
9:9264  e8e903               call 0x9650  ; OPCtrl::measureLabel@s9:9650
loc_9267:
9:9267  c45e06               les bx, ptr [bp + 6]
9:926A  6626837f0800         cmp dword ptr es:[bx + 8], 0
9:9270  7407                 je 0x9279
9:9272  06                   push es
9:9273  53                   push bx
9:9274  90                   nop
9:9275  0e                   push cs
9:9276  e89f03               call 0x9618  ; OPCtrl::sizeFromPicture@s9:9618
loc_9279:
9:9279  c45e06               les bx, ptr [bp + 6]
9:927C  268b4732             mov ax, word ptr es:[bx + 0x32]
9:9280  26394722             cmp word ptr es:[bx + 0x22], ax
9:9284  7d04                 jge 0x928a
9:9286  26894722             mov word ptr es:[bx + 0x22], ax
loc_928A:
9:928A  c45e06               les bx, ptr [bp + 6]
9:928D  268b4734             mov ax, word ptr es:[bx + 0x34]
9:9291  26394724             cmp word ptr es:[bx + 0x24], ax
9:9295  7d04                 jge 0x929b
9:9297  26894724             mov word ptr es:[bx + 0x24], ax
loc_929B:
9:929B  c45e06               les bx, ptr [bp + 6]
9:929E  268b4726             mov ax, word ptr es:[bx + 0x26]
9:92A2  2603472a             add ax, word ptr es:[bx + 0x2a]
9:92A6  263b4722             cmp ax, word ptr es:[bx + 0x22]
9:92AA  7e04                 jle 0x92b0
9:92AC  26894722             mov word ptr es:[bx + 0x22], ax
loc_92B0:
9:92B0  c45e06               les bx, ptr [bp + 6]
9:92B3  268b4728             mov ax, word ptr es:[bx + 0x28]
9:92B7  2603472c             add ax, word ptr es:[bx + 0x2c]
9:92BB  263b4724             cmp ax, word ptr es:[bx + 0x24]
9:92BF  7e04                 jle 0x92c5
9:92C1  26894724             mov word ptr es:[bx + 0x24], ax
loc_92C5:
9:92C5  c45e06               les bx, ptr [bp + 6]
9:92C8  268b4736             mov ax, word ptr es:[bx + 0x36]
9:92CC  26014722             add word ptr es:[bx + 0x22], ax
9:92D0  268b4736             mov ax, word ptr es:[bx + 0x36]
9:92D4  26014724             add word ptr es:[bx + 0x24], ax
9:92D8  c9                   leave
9:92D9  ca0400               retf 4

; ---------------- OPCtrl::create@s9:92DC FAR size=206 callers=1
;   apis: USER.CreateWindow, USER.SetProp, USER.SetWindowLong, USER.ShowWindow
;   (vslot 2) CreateWindow "button", subclass
9:92DC  55                   push bp
9:92DD  8bec                 mov bp, sp
9:92DF  57                   push di
9:92E0  c45e06               les bx, ptr [bp + 6]
9:92E3  26837f1800           cmp word ptr es:[bx + 0x18], 0
9:92E8  0f85b900             jne 0x93a5
9:92EC  1e                   push ds
9:92ED  683f5e               push 0x5e3f  ; 'button'
9:92F0  1e                   push ds
9:92F1  683e5e               push 0x5e3e
9:92F4  66680b000040         push 0x4000000b
9:92FA  26ff771e             push word ptr es:[bx + 0x1e]
9:92FE  26ff7720             push word ptr es:[bx + 0x20]
9:9302  666a00               push 0
9:9305  26ff771a             push word ptr es:[bx + 0x1a]
9:9309  26ff771c             push word ptr es:[bx + 0x1c]
9:930D  ff368c03             push word ptr [0x38c]
9:9311  666a00               push 0
9:9314  9a398c0000           lcall 0, 0x8c39  ; USER.CreateWindow
9:9319  c45e06               les bx, ptr [bp + 6]
9:931C  26894718             mov word ptr es:[bx + 0x18], ax
9:9320  50                   push ax
9:9321  6afc                 push -4
9:9323  66ff36185e           push dword ptr [0x5e18]
9:9328  9ab3910000           lcall 0, 0x91b3  ; USER.SetWindowLong
9:932D  c45e06               les bx, ptr [bp + 6]
9:9330  26894714             mov word ptr es:[bx + 0x14], ax
9:9334  26895716             mov word ptr es:[bx + 0x16], dx
9:9338  26ff7718             push word ptr es:[bx + 0x18]
9:933C  1e                   push ds
9:933D  68465e               push 0x5e46  ; 'procHi'
9:9340  52                   push dx
9:9341  9a56930000           lcall 0, 0x9356  ; USER.SetProp
9:9346  c45e06               les bx, ptr [bp + 6]
9:9349  26ff7718             push word ptr es:[bx + 0x18]
9:934D  1e                   push ds
9:934E  684d5e               push 0x5e4d  ; 'procLo'
9:9351  26ff7714             push word ptr es:[bx + 0x14]
9:9355  9a69930000           lcall 0, 0x9369  ; USER.SetProp
9:935A  c45e06               les bx, ptr [bp + 6]
9:935D  26ff7718             push word ptr es:[bx + 0x18]
9:9361  1e                   push ds
9:9362  68545e               push 0x5e54  ; 'thisHi'
9:9365  06                   push es
9:9366  8bfb                 mov di, bx
9:9368  9a7a930000           lcall 0, 0x937a  ; USER.SetProp
9:936D  c45e06               les bx, ptr [bp + 6]
9:9370  26ff7718             push word ptr es:[bx + 0x18]
9:9374  1e                   push ds
9:9375  685b5e               push 0x5e5b  ; 'thisLo'
9:9378  57                   push di
9:9379  9a93930000           lcall 0, 0x9393  ; USER.SetProp
9:937E  c45e06               les bx, ptr [bp + 6]
9:9381  26837f4000           cmp word ptr es:[bx + 0x40], 0
9:9386  740f                 je 0x9397
9:9388  26ff7718             push word ptr es:[bx + 0x18]
9:938C  1e                   push ds
9:938D  68625e               push 0x5e62  ; 'IsDlg'
9:9390  6a01                 push 1
9:9392  9a74790000           lcall 0, 0x7974  ; USER.SetProp
loc_9397:
9:9397  c45e06               les bx, ptr [bp + 6]
9:939A  26ff7718             push word ptr es:[bx + 0x18]
9:939E  6a05                 push 5
9:93A0  9a24670000           lcall 0, 0x6724  ; USER.ShowWindow
loc_93A5:
9:93A5  5f                   pop di
9:93A6  c9                   leave
9:93A7  ca0400               retf 4

; ---------------- OPCtrl::move@s9:93AA FAR size=60 callers=3
;   apis: USER.MoveWindow, USER.UpdateWindow
;   MoveWindow
9:93AA  55                   push bp
9:93AB  8bec                 mov bp, sp
9:93AD  8b460c               mov ax, word ptr [bp + 0xc]
9:93B0  c45e06               les bx, ptr [bp + 6]
9:93B3  2689471e             mov word ptr es:[bx + 0x1e], ax
9:93B7  8b460a               mov ax, word ptr [bp + 0xa]
9:93BA  26894720             mov word ptr es:[bx + 0x20], ax
9:93BE  26ff7718             push word ptr es:[bx + 0x18]
9:93C2  26ff771e             push word ptr es:[bx + 0x1e]
9:93C6  50                   push ax
9:93C7  26ff7722             push word ptr es:[bx + 0x22]
9:93CB  26ff7724             push word ptr es:[bx + 0x24]
9:93CF  6a01                 push 1
9:93D1  9ae6820000           lcall 0, 0x82e6  ; USER.MoveWindow
9:93D6  c45e06               les bx, ptr [bp + 6]
9:93D9  26ff7718             push word ptr es:[bx + 0x18]
9:93DD  9affff0000           lcall 0, 0xffff  ; USER.UpdateWindow
9:93E2  c9                   leave
9:93E3  ca0800               retf 8

; ---------------- OPCtrl::notifyParent@s9:93E6 FAR size=30 callers=0
;   apis: USER.SendMessage
;   (vslot 7) WM_COMMAND to the parent
9:93E6  55                   push bp
9:93E7  8bec                 mov bp, sp
9:93E9  c45e06               les bx, ptr [bp + 6]
9:93EC  26ff771a             push word ptr es:[bx + 0x1a]
9:93F0  681101               push 0x111
9:93F3  26ff771c             push word ptr es:[bx + 0x1c]
9:93F7  666a00               push 0
9:93FA  9a5e8c0000           lcall 0, 0x8c5e  ; USER.SendMessage
9:93FF  c9                   leave
9:9400  ca0a00               retf 0xa
9:9403  db 00

; ---------------- OPCtrl::notifyParent2@s9:9404 FAR size=30 callers=0
;   apis: USER.SendMessage
;   (vslot 8) WM_COMMAND to the parent
9:9404  55                   push bp
9:9405  8bec                 mov bp, sp
9:9407  c45e06               les bx, ptr [bp + 6]
9:940A  26ff771a             push word ptr es:[bx + 0x1a]
9:940E  681101               push 0x111
9:9411  26ff771c             push word ptr es:[bx + 0x1c]
9:9415  666a00               push 0
9:9418  9afb930000           lcall 0, 0x93fb  ; USER.SendMessage
9:941D  c9                   leave
9:941E  ca0a00               retf 0xa
9:9421  db 00

; ---------------- OPCtrl::paint@s9:9422 FAR size=54 callers=0
;   (vslot 3)
9:9422  55                   push bp
9:9423  8bec                 mov bp, sp
9:9425  c45e06               les bx, ptr [bp + 6]
9:9428  6626837f0800         cmp dword ptr es:[bx + 8], 0
9:942E  740d                 je 0x943d
9:9430  66ff760a             push dword ptr [bp + 0xa]
9:9434  06                   push es
9:9435  53                   push bx
9:9436  26c41f               les bx, ptr es:[bx]
9:9439  26ff5f10             lcall es:[bx + 0x10]
loc_943D:
9:943D  c45e06               les bx, ptr [bp + 6]
9:9440  6626837f0400         cmp dword ptr es:[bx + 4], 0
9:9446  740c                 je 0x9454
9:9448  ff760c               push word ptr [bp + 0xc]
9:944B  06                   push es
9:944C  53                   push bx
9:944D  26c41f               les bx, ptr es:[bx]
9:9450  26ff5f14             lcall es:[bx + 0x14]
loc_9454:
9:9454  c9                   leave
9:9455  ca0800               retf 8

; ---------------- OPCtrl::releasePalette@s9:9458 size=164 callers=0
;   apis: GDI.DeleteObject, USER.SelectPalette
;   (vslot 4)
9:9458  c8060000             enter 6, 0
9:945C  57                   push di
9:945D  56                   push si
9:945E  c45e06               les bx, ptr [bp + 6]
9:9461  6626837f0800         cmp dword ptr es:[bx + 8], 0
9:9467  0f848a00             je 0x94f5
9:946B  66268b4708           mov eax, dword ptr es:[bx + 8]
9:9470  268b570a             mov dx, word ptr es:[bx + 0xa]
9:9474  668946fc             mov dword ptr [bp - 4], eax
9:9478  268b470e             mov ax, word ptr es:[bx + 0xe]
9:947C  260b470c             or ax, word ptr es:[bx + 0xc]
9:9480  7413                 je 0x9495
9:9482  f6460a01             test byte ptr [bp + 0xa], 1
9:9486  740d                 je 0x9495
9:9488  66268b470c           mov eax, dword ptr es:[bx + 0xc]
9:948D  268b570e             mov dx, word ptr es:[bx + 0xe]
9:9491  668946fc             mov dword ptr [bp - 4], eax
loc_9495:
9:9495  6626837f1000         cmp dword ptr es:[bx + 0x10], 0
9:949B  7413                 je 0x94b0
9:949D  f6460a04             test byte ptr [bp + 0xa], 4
9:94A1  740d                 je 0x94b0
9:94A3  66268b4710           mov eax, dword ptr es:[bx + 0x10]
9:94A8  268b5712             mov dx, word ptr es:[bx + 0x12]
9:94AC  668946fc             mov dword ptr [bp - 4], eax
loc_94B0:
9:94B0  8d460c               lea ax, [bp + 0xc]
9:94B3  16                   push ss
9:94B4  50                   push ax
9:94B5  52                   push dx
9:94B6  c45efc               les bx, ptr [bp - 4]
9:94B9  53                   push bx
9:94BA  26c41f               les bx, ptr es:[bx]
9:94BD  8bf3                 mov si, bx
9:94BF  8cc7                 mov di, es
9:94C1  26ff5f08             lcall es:[bx + 8]
9:94C5  8946fa               mov word ptr [bp - 6], ax
9:94C8  8d460c               lea ax, [bp + 0xc]
9:94CB  16                   push ss
9:94CC  50                   push ax
9:94CD  c45e06               les bx, ptr [bp + 6]
9:94D0  26ff7726             push word ptr es:[bx + 0x26]
9:94D4  26ff7728             push word ptr es:[bx + 0x28]
9:94D8  66ff76fc             push dword ptr [bp - 4]
9:94DC  8ec7                 mov es, di
9:94DE  26ff5c04             lcall es:[si + 4]
9:94E2  ff760c               push word ptr [bp + 0xc]
9:94E5  ff76fa               push word ptr [bp - 6]
9:94E8  6a00                 push 0
9:94EA  9a198b0000           lcall 0, 0x8b19  ; USER.SelectPalette
9:94EF  50                   push ax
9:94F0  9a1f8b0000           lcall 0, 0x8b1f  ; GDI.DeleteObject
loc_94F5:
9:94F5  5e                   pop si
9:94F6  5f                   pop di
9:94F7  c9                   leave
9:94F8  ca0800               retf 8
9:94FB  db 00

; ---------------- OPCtrl::drawLabel@s9:94FC FAR size=106 callers=1
;   apis: GDI.SetBkColor, GDI.SetTextColor, USER.DrawText
;   (vslot 5) DrawText
9:94FC  c8080000             enter 8, 0
9:9500  ff760a               push word ptr [bp + 0xa]
9:9503  c45e06               les bx, ptr [bp + 6]
9:9506  680001               push 0x100
9:9509  26ff773a             push word ptr es:[bx + 0x3a]
9:950D  9a51950000           lcall 0, 0x9551  ; GDI.SetBkColor
9:9512  8946fc               mov word ptr [bp - 4], ax
9:9515  8956fe               mov word ptr [bp - 2], dx
9:9518  ff760a               push word ptr [bp + 0xa]
9:951B  c45e06               les bx, ptr [bp + 6]
9:951E  680001               push 0x100
9:9521  26ff773c             push word ptr es:[bx + 0x3c]
9:9525  9a5d950000           lcall 0, 0x955d  ; GDI.SetTextColor
9:952A  8946f8               mov word ptr [bp - 8], ax
9:952D  8956fa               mov word ptr [bp - 6], dx
9:9530  ff760a               push word ptr [bp + 0xa]
9:9533  c45e06               les bx, ptr [bp + 6]
9:9536  6626ff7704           push dword ptr es:[bx + 4]
9:953B  6aff                 push -1
9:953D  8d472e               lea ax, [bx + 0x2e]
9:9540  06                   push es
9:9541  50                   push ax
9:9542  6a10                 push 0x10
9:9544  9a9d8d0000           lcall 0, 0x8d9d  ; USER.DrawText
9:9549  ff760a               push word ptr [bp + 0xa]
9:954C  66ff76fc             push dword ptr [bp - 4]
9:9550  9a888a0000           lcall 0, 0x8a88  ; GDI.SetBkColor
9:9555  ff760a               push word ptr [bp + 0xa]
9:9558  66ff76f8             push dword ptr [bp - 8]
9:955C  9a9a8a0000           lcall 0, 0x8a9a  ; GDI.SetTextColor
9:9561  c9                   leave
9:9562  ca0600               retf 6
9:9565  db 00

; ---------------- objectFromHwnd@s9:9566 FAR size=178 callers=6
;   apis: USER.GetProp
;   the C++ object of a window (GetProp thisLo/thisHi)
9:9566  c80a0000             enter 0xa, 0
9:956A  56                   push si
9:956B  c45e06               les bx, ptr [bp + 6]
9:956E  895efc               mov word ptr [bp - 4], bx
9:9571  8c46fe               mov word ptr [bp - 2], es
9:9574  26833f04             cmp word ptr es:[bx], 4
9:9578  0f859800             jne 0x9614
9:957C  268b470c             mov ax, word ptr es:[bx + 0xc]
9:9580  8946fa               mov word ptr [bp - 6], ax
9:9583  26ff770a             push word ptr es:[bx + 0xa]
9:9587  1e                   push ds
9:9588  686f5e               push 0x5e6f  ; 'thisHi'
9:958B  9a9e950000           lcall 0, 0x959e  ; USER.GetProp
9:9590  c45efc               les bx, ptr [bp - 4]
9:9593  26ff770a             push word ptr es:[bx + 0xa]
9:9597  1e                   push ds
9:9598  68685e               push 0x5e68  ; 'thisLo'
9:959B  8bf0                 mov si, ax
9:959D  9a718d0000           lcall 0, 0x8d71  ; USER.GetProp
9:95A2  8bd6                 mov dx, si
9:95A4  8946f6               mov word ptr [bp - 0xa], ax
9:95A7  8976f8               mov word ptr [bp - 8], si
9:95AA  0bd0                 or dx, ax
9:95AC  7466                 je 0x9614
9:95AE  c45efc               les bx, ptr [bp - 4]
9:95B1  268b4706             mov ax, word ptr es:[bx + 6]
9:95B5  eb53                 jmp 0x960a
9:95B7  db 90
loc_95B8:
9:95B8  ff76fa               push word ptr [bp - 6]
9:95BB  c45efc               les bx, ptr [bp - 4]
9:95BE  26ff7708             push word ptr es:[bx + 8]
9:95C2  c45ef6               les bx, ptr [bp - 0xa]
9:95C5  06                   push es
9:95C6  53                   push bx
9:95C7  26c41f               les bx, ptr es:[bx]
9:95CA  26ff5f0c             lcall es:[bx + 0xc]
9:95CE  5e                   pop si
9:95CF  c9                   leave
9:95D0  cb                   retf
9:95D1  db 90
loc_95D2:
9:95D2  ff76fa               push word ptr [bp - 6]
9:95D5  c45efc               les bx, ptr [bp - 4]
9:95D8  26ff7708             push word ptr es:[bx + 8]
9:95DC  c45ef6               les bx, ptr [bp - 0xa]
9:95DF  06                   push es
9:95E0  53                   push bx
9:95E1  26c41f               les bx, ptr es:[bx]
9:95E4  26ff5f10             lcall es:[bx + 0x10]
9:95E8  5e                   pop si
9:95E9  c9                   leave
9:95EA  cb                   retf
9:95EB  db 90
loc_95EC:
9:95EC  ff76fa               push word ptr [bp - 6]
9:95EF  c45efc               les bx, ptr [bp - 4]
9:95F2  268a4708             mov al, byte ptr es:[bx + 8]
9:95F6  251000               and ax, 0x10
9:95F9  50                   push ax
9:95FA  c45ef6               les bx, ptr [bp - 0xa]
9:95FD  06                   push es
9:95FE  53                   push bx
9:95FF  26c41f               les bx, ptr es:[bx]
9:9602  26ff5f18             lcall es:[bx + 0x18]
9:9606  5e                   pop si
9:9607  c9                   leave
9:9608  cb                   retf
9:9609  db 90
loc_960A:
9:960A  48                   dec ax
9:960B  74ab                 je 0x95b8
9:960D  48                   dec ax
9:960E  74c2                 je 0x95d2
9:9610  48                   dec ax
9:9611  48                   dec ax
9:9612  74d8                 je 0x95ec
loc_9614:
9:9614  5e                   pop si
9:9615  c9                   leave
9:9616  cb                   retf
9:9617  db 00

; ---------------- OPCtrl::sizeFromPicture@s9:9618 FAR size=56 callers=2
;   width/height from its DIB
9:9618  c8040000             enter 4, 0
9:961C  c45e06               les bx, ptr [bp + 6]
9:961F  6626ff7708           push dword ptr es:[bx + 8]
9:9624  9a72472c92           lcall 0x922c, 0x4772  ; DIB::rect@s2:4772
9:9629  8946fc               mov word ptr [bp - 4], ax
9:962C  8956fe               mov word ptr [bp - 2], dx
9:962F  8bd8                 mov bx, ax
9:9631  8ec2                 mov es, dx
9:9633  268b4704             mov ax, word ptr es:[bx + 4]
9:9637  c45e06               les bx, ptr [bp + 6]
9:963A  2689472a             mov word ptr es:[bx + 0x2a], ax
9:963E  c45efc               les bx, ptr [bp - 4]
9:9641  268b4708             mov ax, word ptr es:[bx + 8]
9:9645  c45e06               les bx, ptr [bp + 6]
9:9648  2689472c             mov word ptr es:[bx + 0x2c], ax
9:964C  c9                   leave
9:964D  ca0400               retf 4

; ---------------- OPCtrl::measureLabel@s9:9650 FAR size=52 callers=1
;   apis: USER.DrawText, USER.GetDC, USER.ReleaseDC
;   text size
9:9650  c8020000             enter 2, 0
9:9654  6a00                 push 0
9:9656  9a748c0000           lcall 0, 0x8c74  ; USER.GetDC
9:965B  8946fe               mov word ptr [bp - 2], ax
9:965E  50                   push ax
9:965F  c45e06               les bx, ptr [bp + 6]
9:9662  6626ff7704           push dword ptr es:[bx + 4]
9:9667  6aff                 push -1
9:9669  8d472e               lea ax, [bx + 0x2e]
9:966C  06                   push es
9:966D  50                   push ax
9:966E  681004               push 0x410
9:9671  9a45950000           lcall 0, 0x9545  ; USER.DrawText
9:9676  6a00                 push 0
9:9678  ff76fe               push word ptr [bp - 2]
9:967B  9a0a8d0000           lcall 0, 0x8d0a  ; USER.ReleaseDC
9:9680  c9                   leave
9:9681  ca0400               retf 4

; ---------------- OPCtrl::subclassProc@s9:9684 FAR size=342 callers=0
;   apis: USER.CallWindowProc, USER.GetClientRect, USER.GetProp, USER.PtInRect
;   the custom controls' subclass procedure ("button %08lx rdown")
9:9684  8cd0                 mov ax, ss
9:9686  c8220000             enter 0x22, 0
9:968A  57                   push di
9:968B  56                   push si
9:968C  1e                   push ds
9:968D  8ed8                 mov ds, ax
9:968F  ff760e               push word ptr [bp + 0xe]
9:9692  1e                   push ds
9:9693  687d5e               push 0x5e7d  ; 'procHi'
9:9696  9aa5960000           lcall 0, 0x96a5  ; USER.GetProp
9:969B  ff760e               push word ptr [bp + 0xe]
9:969E  1e                   push ds
9:969F  68765e               push 0x5e76  ; 'procLo'
9:96A2  8bf0                 mov si, ax
9:96A4  9ab7960000           lcall 0, 0x96b7  ; USER.GetProp
9:96A9  8946fc               mov word ptr [bp - 4], ax
9:96AC  8976fe               mov word ptr [bp - 2], si
9:96AF  ff760e               push word ptr [bp + 0xe]
9:96B2  1e                   push ds
9:96B3  688b5e               push 0x5e8b  ; 'thisHi'
9:96B6  9ac9960000           lcall 0, 0x96c9  ; USER.GetProp
9:96BB  2bc9                 sub cx, cx
9:96BD  ff760e               push word ptr [bp + 0xe]
9:96C0  1e                   push ds
9:96C1  68845e               push 0x5e84  ; 'thisLo'
9:96C4  8bf1                 mov si, cx
9:96C6  8bf8                 mov di, ax
9:96C8  9a32970000           lcall 0, 0x9732  ; USER.GetProp
9:96CD  0bf0                 or si, ax
9:96CF  8976f8               mov word ptr [bp - 8], si
9:96D2  897efa               mov word ptr [bp - 6], di
9:96D5  0bfe                 or di, si
9:96D7  7433                 je 0x970c
9:96D9  8b460c               mov ax, word ptr [bp + 0xc]
9:96DC  48                   dec ax
9:96DD  48                   dec ax
9:96DE  740e                 je 0x96ee
9:96E0  2dff01               sub ax, 0x1ff
9:96E3  7445                 je 0x972a
9:96E5  2d0300               sub ax, 3
9:96E8  0f849c00             je 0x9788
9:96EC  eb1e                 jmp 0x970c
loc_96EE:
9:96EE  668b46f8             mov eax, dword ptr [bp - 8]
9:96F2  668946f0             mov dword ptr [bp - 0x10], eax
9:96F6  668946f4             mov dword ptr [bp - 0xc], eax
9:96FA  660bc0               or eax, eax
9:96FD  740d                 je 0x970c
9:96FF  6a01                 push 1
9:9701  c45ef8               les bx, ptr [bp - 8]
9:9704  06                   push es
9:9705  50                   push ax
9:9706  26c41f               les bx, ptr es:[bx]
9:9709  26ff1f               lcall es:[bx]
loc_970C:
9:970C  66837efc00           cmp dword ptr [bp - 4], 0
9:9711  746f                 je 0x9782
9:9713  66ff76fc             push dword ptr [bp - 4]
9:9717  66ff760c             push dword ptr [bp + 0xc]
9:971B  66ff7608             push dword ptr [bp + 8]
9:971F  ff7606               push word ptr [bp + 6]
9:9722  9affff0000           lcall 0, 0xffff  ; USER.CallWindowProc
9:9727  e9a800               jmp 0x97d2
loc_972A:
9:972A  ff760e               push word ptr [bp + 0xe]
9:972D  1e                   push ds
9:972E  68925e               push 0x5e92  ; 'IsDlg'
9:9731  9a8c950000           lcall 0, 0x958c  ; USER.GetProp
9:9736  0bc0                 or ax, ax
9:9738  75d2                 jne 0x970c
9:973A  c45ef8               les bx, ptr [bp - 8]
9:973D  26ff7718             push word ptr es:[bx + 0x18]
9:9741  8d46e8               lea ax, [bp - 0x18]
9:9744  16                   push ss
9:9745  50                   push ax
9:9746  9a95970000           lcall 0, 0x9795  ; USER.GetClientRect
9:974B  8d46e8               lea ax, [bp - 0x18]
9:974E  16                   push ss
9:974F  50                   push ax
9:9750  66ff7606             push dword ptr [bp + 6]
9:9754  9aa3970000           lcall 0, 0x97a3  ; USER.PtInRect
9:9759  0bc0                 or ax, ax
9:975B  7425                 je 0x9782
9:975D  66ff76f8             push dword ptr [bp - 8]
9:9761  1e                   push ds
9:9762  68985e               push 0x5e98  ; 'button %08lx ldown'
9:9765  9a4860b697           lcall 0x97b6, 0x6048  ; debugPrintf@s2:6048
9:976A  83c408               add sp, 8
9:976D  ff760a               push word ptr [bp + 0xa]
9:9770  ff7606               push word ptr [bp + 6]
9:9773  ff7608               push word ptr [bp + 8]
9:9776  c45ef8               les bx, ptr [bp - 8]
9:9779  06                   push es
9:977A  53                   push bx
9:977B  26c41f               les bx, ptr es:[bx]
9:977E  26ff5f1c             lcall es:[bx + 0x1c]
loc_9782:
9:9782  33c0                 xor ax, ax
9:9784  99                   cdq
9:9785  eb4b                 jmp 0x97d2
9:9787  db 90
loc_9788:
9:9788  c45ef8               les bx, ptr [bp - 8]
9:978B  26ff7718             push word ptr es:[bx + 0x18]
9:978F  8d46e8               lea ax, [bp - 0x18]
9:9792  16                   push ss
9:9793  50                   push ax
9:9794  9ac3740000           lcall 0, 0x74c3  ; USER.GetClientRect
9:9799  8d46e8               lea ax, [bp - 0x18]
9:979C  16                   push ss
9:979D  50                   push ax
9:979E  66ff7606             push dword ptr [bp + 6]
9:97A2  9a9a810000           lcall 0, 0x819a  ; USER.PtInRect
9:97A7  0bc0                 or ax, ax
9:97A9  74d7                 je 0x9782
9:97AB  66ff76f8             push dword ptr [bp - 8]
9:97AF  1e                   push ds
9:97B0  68ab5e               push 0x5eab  ; 'button %08lx rdown'
9:97B3  9a48602796           lcall 0x9627, 0x6048  ; debugPrintf@s2:6048
9:97B8  83c408               add sp, 8
9:97BB  ff760a               push word ptr [bp + 0xa]
9:97BE  ff7606               push word ptr [bp + 6]
9:97C1  ff7608               push word ptr [bp + 8]
9:97C4  c45ef8               les bx, ptr [bp - 8]
9:97C7  06                   push es
9:97C8  53                   push bx
9:97C9  26c41f               les bx, ptr es:[bx]
9:97CC  26ff5f20             lcall es:[bx + 0x20]
9:97D0  ebb0                 jmp 0x9782
loc_97D2:
9:97D2  1f                   pop ds
9:97D3  5e                   pop si
9:97D4  5f                   pop di
9:97D5  c9                   leave
9:97D6  ca0a00               retf 0xa
9:97D9  db 00

; ---------------- OPCtrl::scalar_dtor@s9:97DA FAR size=74 callers=0
;   deleting destructor
9:97DA  55                   push bp
9:97DB  8bec                 mov bp, sp
9:97DD  66ff7606             push dword ptr [bp + 6]
9:97E1  90                   nop
9:97E2  0e                   push cs
9:97E3  e838f9               call 0x911e  ; OPCtrl::~OPCtrl@s9:911E
9:97E6  f6460a01             test byte ptr [bp + 0xa], 1
9:97EA  7409                 je 0x97f5
9:97EC  66ff7606             push dword ptr [bp + 6]
9:97F0  9ace179f91           lcall 0x919f, 0x17ce  ; operator_delete@s1:17CE
loc_97F5:
9:97F5  8b4606               mov ax, word ptr [bp + 6]
9:97F8  8b5608               mov dx, word ptr [bp + 8]
9:97FB  c9                   leave
9:97FC  ca0600               retf 6
9:97FF  db 90 da 97 06 98 52 92 0a 98 dc 92 0e 98 22 94 12
9:980F  db 98 58 94 16 98 fc 94 1e 98 d2 3c 68 97 e6 93 22
9:981F  db 98 04 94 2f 91

; ---------------- OPButtonData::init@s9:9824 FAR size=48 callers=1
;   zeroes an OPButton's data
9:9824  55                   push bp
9:9825  8bec                 mov bp, sp
9:9827  c45e06               les bx, ptr [bp + 6]
9:982A  6626c70700000000     mov dword ptr es:[bx], 0
9:9832  26c747040000         mov word ptr es:[bx + 4], 0
9:9838  662bc0               sub eax, eax
9:983B  6626894756           mov dword ptr es:[bx + 0x56], eax
9:9840  2689475a             mov word ptr es:[bx + 0x5a], ax
9:9844  2689475c             mov word ptr es:[bx + 0x5c], ax
9:9848  26884706             mov byte ptr es:[bx + 6], al
9:984C  8bc3                 mov ax, bx
9:984E  8cc2                 mov dx, es
9:9850  c9                   leave
9:9851  ca0400               retf 4

; ---------------- OPButton::OPButton@s9:9854 FAR size=108 callers=1
;   apis: GDI.GetStockObject, USER.LoadCursor
;   the OPButton class (vtable A230)
9:9854  c8040000             enter 4, 0
9:9858  c45e06               les bx, ptr [bp + 6]
9:985B  26c7079a38           mov word ptr es:[bx], 0x389a
9:9860  26c747021a98         mov word ptr es:[bx + 2], 0x981a  ; SEGMENT s2:0000
9:9866  c45e06               les bx, ptr [bp + 6]
9:9869  26c70730a2           mov word ptr es:[bx], 0xa230
9:986E  26c747020298         mov word ptr es:[bx + 2], 0x9802  ; SEGMENT s9:0000
9:9874  1e                   push ds
9:9875  68ce5e               push 0x5ece  ; 'OPButton'
9:9878  8d4704               lea ax, [bx + 4]
9:987B  06                   push es
9:987C  50                   push ax
9:987D  9a3e3df397           lcall 0x97f3, 0x3d3e  ; _fstrcpy@s1:3D3E
9:9882  83c408               add sp, 8
9:9885  c45e06               les bx, ptr [bp + 6]
9:9888  26c747540300         mov word ptr es:[bx + 0x54], 3
9:988E  666a00               push 0
9:9891  68007f               push 0x7f00
9:9894  9a23040000           lcall 0, 0x423  ; USER.LoadCursor
9:9899  c45e06               les bx, ptr [bp + 6]
9:989C  26894758             mov word ptr es:[bx + 0x58], ax
9:98A0  6a04                 push 4
9:98A2  9a657e0000           lcall 0, 0x7e65  ; GDI.GetStockObject
9:98A7  c45e06               les bx, ptr [bp + 6]
9:98AA  26894756             mov word ptr es:[bx + 0x56], ax
9:98AE  06                   push es
9:98AF  53                   push bx
9:98B0  90                   nop
9:98B1  0e                   push cs
9:98B2  e80b00               call 0x98c0  ; OPButton::registerClass@s9:98C0
9:98B5  8b4606               mov ax, word ptr [bp + 6]
9:98B8  8b5608               mov dx, word ptr [bp + 8]
9:98BB  c9                   leave
9:98BC  ca0400               retf 4
9:98BF  db 00

; ---------------- OPButton::registerClass@s9:98C0 FAR size=136 callers=1
;   apis: USER.GetClassInfo, USER.RegisterClass
;   registers "OPButton" (its window procedure follows)
9:98C0  c81a0000             enter 0x1a, 0
9:98C4  57                   push di
9:98C5  56                   push si
9:98C6  ff368c03             push word ptr [0x38c]
9:98CA  8b4606               mov ax, word ptr [bp + 6]
9:98CD  8b5608               mov dx, word ptr [bp + 8]
9:98D0  050400               add ax, 4
9:98D3  52                   push dx
9:98D4  50                   push ax
9:98D5  8d4ee6               lea cx, [bp - 0x1a]
9:98D8  16                   push ss
9:98D9  51                   push cx
9:98DA  8bf0                 mov si, ax
9:98DC  8bfa                 mov di, dx
9:98DE  9affff0000           lcall 0, 0xffff  ; USER.GetClassInfo
9:98E3  0bc0                 or ax, ax
9:98E5  755a                 jne 0x9941
9:98E7  c45e06               les bx, ptr [bp + 6]
9:98EA  268b4754             mov ax, word ptr es:[bx + 0x54]
9:98EE  8946e6               mov word ptr [bp - 0x1a], ax
9:98F1  c746e8de9c           mov word ptr [bp - 0x18], 0x9cde
9:98F6  c746ea7298           mov word ptr [bp - 0x16], 0x9872  ; SEGMENT s9:0000
9:98FB  66c746ec00000400     mov dword ptr [bp - 0x14], 0x40000
9:9903  a18c03               mov ax, word ptr [0x38c]
9:9906  8946f0               mov word ptr [bp - 0x10], ax
9:9909  c746f20000           mov word ptr [bp - 0xe], 0
9:990E  268b4758             mov ax, word ptr es:[bx + 0x58]
9:9912  8946f4               mov word ptr [bp - 0xc], ax
9:9915  268b4756             mov ax, word ptr es:[bx + 0x56]
9:9919  8946f6               mov word ptr [bp - 0xa], ax
9:991C  66c746f800000000     mov dword ptr [bp - 8], 0
9:9924  8976fc               mov word ptr [bp - 4], si
9:9927  897efe               mov word ptr [bp - 2], di
9:992A  8d46e6               lea ax, [bp - 0x1a]
9:992D  16                   push ss
9:992E  50                   push ax
9:992F  9affff0000           lcall 0, 0xffff  ; USER.RegisterClass
9:9934  0bc0                 or ax, ax
9:9936  7509                 jne 0x9941
9:9938  50                   push ax
9:9939  9acd248098           lcall 0x9880, 0x24cd  ; exit@s1:24CD
9:993E  83c402               add sp, 2
loc_9941:
9:9941  5e                   pop si
9:9942  5f                   pop di
9:9943  c9                   leave
9:9944  ca0400               retf 4
9:9947  db 00

; ---------------- OPButton::paint@s9:9948 FAR size=918 callers=1
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.GetStockObject, GDI.LineTo, GDI.MoveTo, GDI.SelectObject, GDI.SetBkColor, GDI.SetMapMode, GDI.SetTextColor, USER.BeginPaint, USER.DrawText, USER.EndPaint, USER.GetClientRect, USER.GrayString
;   draws an OPButton (frame, picture, text, grey when disabled)
9:9948  c85e0000             enter 0x5e, 0
9:994C  b80100               mov ax, 1
9:994F  8946fc               mov word ptr [bp - 4], ax
9:9952  8946fe               mov word ptr [bp - 2], ax
9:9955  33c9                 xor cx, cx
9:9957  894ef8               mov word ptr [bp - 8], cx
9:995A  894efa               mov word ptr [bp - 6], cx
9:995D  894ee6               mov word ptr [bp - 0x1a], cx
9:9960  894ee4               mov word ptr [bp - 0x1c], cx
9:9963  c45e08               les bx, ptr [bp + 8]
9:9966  268a5704             mov dl, byte ptr es:[bx + 4]
9:996A  83e208               and dx, 8
9:996D  8956e2               mov word ptr [bp - 0x1e], dx
9:9970  268a5756             mov dl, byte ptr es:[bx + 0x56]
9:9974  23d0                 and dx, ax
9:9976  8956e0               mov word ptr [bp - 0x20], dx
9:9979  ff7606               push word ptr [bp + 6]
9:997C  8d56c0               lea dx, [bp - 0x40]
9:997F  16                   push ss
9:9980  52                   push dx
9:9981  9a178a0000           lcall 0, 0x8a17  ; USER.BeginPaint
9:9986  8946be               mov word ptr [bp - 0x42], ax
9:9989  50                   push ax
9:998A  6a01                 push 1
9:998C  9aba9c0000           lcall 0, 0x9cba  ; GDI.SetMapMode
9:9991  8946bc               mov word ptr [bp - 0x44], ax
9:9994  ff7606               push word ptr [bp + 6]
9:9997  8d46f0               lea ax, [bp - 0x10]
9:999A  16                   push ss
9:999B  50                   push ax
9:999C  9a47970000           lcall 0, 0x9747  ; USER.GetClientRect
9:99A1  ff4ef4               dec word ptr [bp - 0xc]
9:99A4  ff4ef6               dec word ptr [bp - 0xa]
9:99A7  837ee000             cmp word ptr [bp - 0x20], 0
9:99AB  7420                 je 0x99cd
9:99AD  668b46f0             mov eax, dword ptr [bp - 0x10]
9:99B1  668946e8             mov dword ptr [bp - 0x18], eax
9:99B5  668b46f4             mov eax, dword ptr [bp - 0xc]
9:99B9  668946ec             mov dword ptr [bp - 0x14], eax
9:99BD  8346f202             add word ptr [bp - 0xe], 2
9:99C1  8346f002             add word ptr [bp - 0x10], 2
9:99C5  836ef402             sub word ptr [bp - 0xc], 2
9:99C9  836ef602             sub word ptr [bp - 0xa], 2
loc_99CD:
9:99CD  c45e08               les bx, ptr [bp + 8]
9:99D0  26807f0600           cmp byte ptr es:[bx + 6], 0
9:99D5  746f                 je 0x9a46
9:99D7  c746e60100           mov word ptr [bp - 0x1a], 1
9:99DC  26837f5a00           cmp word ptr es:[bx + 0x5a], 0
9:99E1  740f                 je 0x99f2
9:99E3  ff76be               push word ptr [bp - 0x42]
9:99E6  26ff775a             push word ptr es:[bx + 0x5a]
9:99EA  9a6d9a0000           lcall 0, 0x9a6d  ; GDI.SelectObject
9:99EF  8946e4               mov word ptr [bp - 0x1c], ax
loc_99F2:
9:99F2  ff76be               push word ptr [bp - 0x42]
9:99F5  8b4608               mov ax, word ptr [bp + 8]
9:99F8  8b560a               mov dx, word ptr [bp + 0xa]
9:99FB  050600               add ax, 6
9:99FE  52                   push dx
9:99FF  50                   push ax
9:9A00  52                   push dx
9:9A01  50                   push ax
9:9A02  9aa43dfa9b           lcall 0x9bfa, 0x3da4  ; _fstrlen@s1:3DA4
9:9A07  83c404               add sp, 4
9:9A0A  50                   push ax
9:9A0B  8d46f8               lea ax, [bp - 8]
9:9A0E  16                   push ss
9:9A0F  50                   push ax
9:9A10  680004               push 0x400
9:9A13  9a7d9c0000           lcall 0, 0x9c7d  ; USER.DrawText
9:9A18  8b46f6               mov ax, word ptr [bp - 0xa]
9:9A1B  2b46fe               sub ax, word ptr [bp - 2]
9:9A1E  0346fa               add ax, word ptr [bp - 6]
9:9A21  99                   cdq
9:9A22  2bc2                 sub ax, dx
9:9A24  d1f8                 sar ax, 1
9:9A26  0346f2               add ax, word ptr [bp - 0xe]
9:9A29  8946fa               mov word ptr [bp - 6], ax
9:9A2C  0146fe               add word ptr [bp - 2], ax
9:9A2F  8b46f4               mov ax, word ptr [bp - 0xc]
9:9A32  2b46fc               sub ax, word ptr [bp - 4]
9:9A35  0346f8               add ax, word ptr [bp - 8]
9:9A38  99                   cdq
9:9A39  2bc2                 sub ax, dx
9:9A3B  d1f8                 sar ax, 1
9:9A3D  0346f0               add ax, word ptr [bp - 0x10]
9:9A40  8946f8               mov word ptr [bp - 8], ax
9:9A43  0146fc               add word ptr [bp - 4], ax
loc_9A46:
9:9A46  666a01               push 1
9:9A49  66ff36c25e           push dword ptr [0x5ec2]
9:9A4E  9a5f9a0000           lcall 0, 0x9a5f  ; GDI.CreatePen
9:9A53  8946ba               mov word ptr [bp - 0x46], ax
9:9A56  666a01               push 1
9:9A59  66ff36be5e           push dword ptr [0x5ebe]
9:9A5E  9a577c0000           lcall 0, 0x7c57  ; GDI.CreatePen
9:9A63  8946b8               mov word ptr [bp - 0x48], ax
9:9A66  ff76be               push word ptr [bp - 0x42]
9:9A69  ff76ba               push word ptr [bp - 0x46]
9:9A6C  9a469b0000           lcall 0, 0x9b46  ; GDI.SelectObject
9:9A71  8946b6               mov word ptr [bp - 0x4a], ax
9:9A74  837ee000             cmp word ptr [bp - 0x20], 0
9:9A78  745e                 je 0x9ad8
9:9A7A  c746b40000           mov word ptr [bp - 0x4c], 0
loc_9A7F:
9:9A7F  ff76be               push word ptr [bp - 0x42]
9:9A82  ff76e8               push word ptr [bp - 0x18]
9:9A85  ff76ee               push word ptr [bp - 0x12]
9:9A88  9aec9a0000           lcall 0, 0x9aec  ; GDI.MoveTo
9:9A8D  ff76be               push word ptr [bp - 0x42]
9:9A90  ff76ec               push word ptr [bp - 0x14]
9:9A93  ff76ee               push word ptr [bp - 0x12]
9:9A96  9aa39a0000           lcall 0, 0x9aa3  ; GDI.LineTo
9:9A9B  ff76be               push word ptr [bp - 0x42]
9:9A9E  66ff76ea             push dword ptr [bp - 0x16]
9:9AA2  9ab19a0000           lcall 0, 0x9ab1  ; GDI.LineTo
9:9AA7  ff76be               push word ptr [bp - 0x42]
9:9AAA  ff76e8               push word ptr [bp - 0x18]
9:9AAD  ff76ea               push word ptr [bp - 0x16]
9:9AB0  9abf9a0000           lcall 0, 0x9abf  ; GDI.LineTo
9:9AB5  ff76be               push word ptr [bp - 0x42]
9:9AB8  ff76e8               push word ptr [bp - 0x18]
9:9ABB  ff76ee               push word ptr [bp - 0x12]
9:9ABE  9afa9a0000           lcall 0, 0x9afa  ; GDI.LineTo
9:9AC3  ff46ea               inc word ptr [bp - 0x16]
9:9AC6  ff46e8               inc word ptr [bp - 0x18]
9:9AC9  ff4eec               dec word ptr [bp - 0x14]
9:9ACC  ff4eee               dec word ptr [bp - 0x12]
9:9ACF  ff46b4               inc word ptr [bp - 0x4c]
9:9AD2  837eb401             cmp word ptr [bp - 0x4c], 1
9:9AD6  7ca7                 jl 0x9a7f
loc_9AD8:
9:9AD8  c45e08               les bx, ptr [bp + 8]
9:9ADB  26f6470402           test byte ptr es:[bx + 4], 2
9:9AE0  7448                 je 0x9b2a
9:9AE2  ff76be               push word ptr [bp - 0x42]
9:9AE5  ff76f0               push word ptr [bp - 0x10]
9:9AE8  ff76f6               push word ptr [bp - 0xa]
9:9AEB  9a549b0000           lcall 0, 0x9b54  ; GDI.MoveTo
9:9AF0  ff76be               push word ptr [bp - 0x42]
9:9AF3  ff76f0               push word ptr [bp - 0x10]
9:9AF6  ff76f2               push word ptr [bp - 0xe]
9:9AF9  9a0a9b0000           lcall 0, 0x9b0a  ; GDI.LineTo
9:9AFE  ff76be               push word ptr [bp - 0x42]
9:9B01  8b46f4               mov ax, word ptr [bp - 0xc]
9:9B04  40                   inc ax
9:9B05  50                   push ax
9:9B06  ff76f2               push word ptr [bp - 0xe]
9:9B09  9a629b0000           lcall 0, 0x9b62  ; GDI.LineTo
9:9B0E  837ee600             cmp word ptr [bp - 0x1a], 0
9:9B12  0f84a600             je 0x9bbc
9:9B16  8346fa02             add word ptr [bp - 6], 2
9:9B1A  8346f802             add word ptr [bp - 8], 2
9:9B1E  8346fc02             add word ptr [bp - 4], 2
9:9B22  8346fe02             add word ptr [bp - 2], 2
9:9B26  e99300               jmp 0x9bbc
9:9B29  db 90
loc_9B2A:
9:9B2A  668b46f0             mov eax, dword ptr [bp - 0x10]
9:9B2E  668946ac             mov dword ptr [bp - 0x54], eax
9:9B32  668b46f4             mov eax, dword ptr [bp - 0xc]
9:9B36  668946b0             mov dword ptr [bp - 0x50], eax
9:9B3A  c746b40000           mov word ptr [bp - 0x4c], 0
loc_9B3F:
9:9B3F  ff76be               push word ptr [bp - 0x42]
9:9B42  ff76ba               push word ptr [bp - 0x46]
9:9B45  9a7e9b0000           lcall 0, 0x9b7e  ; GDI.SelectObject
9:9B4A  ff76be               push word ptr [bp - 0x42]
9:9B4D  ff76ac               push word ptr [bp - 0x54]
9:9B50  ff76b2               push word ptr [bp - 0x4e]
9:9B53  9ac39b0000           lcall 0, 0x9bc3  ; GDI.MoveTo
9:9B58  ff76be               push word ptr [bp - 0x42]
9:9B5B  ff76b0               push word ptr [bp - 0x50]
9:9B5E  ff76b2               push word ptr [bp - 0x4e]
9:9B61  9a6e9b0000           lcall 0, 0x9b6e  ; GDI.LineTo
9:9B66  ff76be               push word ptr [bp - 0x42]
9:9B69  66ff76ae             push dword ptr [bp - 0x52]
9:9B6D  9a8c9b0000           lcall 0, 0x9b8c  ; GDI.LineTo
9:9B72  c746aa0000           mov word ptr [bp - 0x56], 0
loc_9B77:
9:9B77  ff76be               push word ptr [bp - 0x42]
9:9B7A  ff76b8               push word ptr [bp - 0x48]
9:9B7D  9aa69c0000           lcall 0, 0x9ca6  ; GDI.SelectObject
9:9B82  ff76be               push word ptr [bp - 0x42]
9:9B85  ff76ac               push word ptr [bp - 0x54]
9:9B88  ff76ae               push word ptr [bp - 0x52]
9:9B8B  9a9a9b0000           lcall 0, 0x9b9a  ; GDI.LineTo
9:9B90  ff76be               push word ptr [bp - 0x42]
9:9B93  ff76ac               push word ptr [bp - 0x54]
9:9B96  ff76b2               push word ptr [bp - 0x4e]
9:9B99  9a7e7c0000           lcall 0, 0x7c7e  ; GDI.LineTo
9:9B9E  ff46aa               inc word ptr [bp - 0x56]
9:9BA1  837eaa02             cmp word ptr [bp - 0x56], 2
9:9BA5  7cd0                 jl 0x9b77
9:9BA7  ff46ae               inc word ptr [bp - 0x52]
9:9BAA  ff46ac               inc word ptr [bp - 0x54]
9:9BAD  ff4eb0               dec word ptr [bp - 0x50]
9:9BB0  ff4eb2               dec word ptr [bp - 0x4e]
9:9BB3  ff46b4               inc word ptr [bp - 0x4c]
9:9BB6  837eb402             cmp word ptr [bp - 0x4c], 2
9:9BBA  7c83                 jl 0x9b3f
loc_9BBC:
9:9BBC  ff76be               push word ptr [bp - 0x42]
9:9BBF  666a00               push 0
9:9BC2  9a717c0000           lcall 0, 0x7c71  ; GDI.MoveTo
9:9BC7  837ee600             cmp word ptr [bp - 0x1a], 0
9:9BCB  0f84db00             je 0x9caa
9:9BCF  c45e08               les bx, ptr [bp + 8]
9:9BD2  26f6470404           test byte ptr es:[bx + 4], 4
9:9BD7  7443                 je 0x9c1c
9:9BD9  6a01                 push 1
9:9BDB  9aa3980000           lcall 0, 0x98a3  ; GDI.GetStockObject
9:9BE0  8946aa               mov word ptr [bp - 0x56], ax
9:9BE3  ff76be               push word ptr [bp - 0x42]
9:9BE6  50                   push ax
9:9BE7  666a00               push 0
9:9BEA  8b4608               mov ax, word ptr [bp + 8]
9:9BED  8b560a               mov dx, word ptr [bp + 0xa]
9:9BF0  050600               add ax, 6
9:9BF3  52                   push dx
9:9BF4  50                   push ax
9:9BF5  52                   push dx
9:9BF6  50                   push ax
9:9BF7  9aa43d6f9c           lcall 0x9c6f, 0x3da4  ; _fstrlen@s1:3DA4
9:9BFC  83c404               add sp, 4
9:9BFF  50                   push ax
9:9C00  ff76f8               push word ptr [bp - 8]
9:9C03  ff76fa               push word ptr [bp - 6]
9:9C06  8b46fc               mov ax, word ptr [bp - 4]
9:9C09  2b46f8               sub ax, word ptr [bp - 8]
9:9C0C  50                   push ax
9:9C0D  8b46fe               mov ax, word ptr [bp - 2]
9:9C10  2b46fa               sub ax, word ptr [bp - 6]
9:9C13  50                   push ax
9:9C14  9affff0000           lcall 0, 0xffff  ; USER.GrayString
9:9C19  eb7e                 jmp 0x9c99
9:9C1B  db 90
loc_9C1C:
9:9C1C  ff76be               push word ptr [bp - 0x42]
9:9C1F  837ee200             cmp word ptr [bp - 0x1e], 0
9:9C23  7409                 je 0x9c2e
9:9C25  a1ca5e               mov ax, word ptr [0x5eca]
9:9C28  8b16cc5e             mov dx, word ptr [0x5ecc]
9:9C2C  eb07                 jmp 0x9c35
loc_9C2E:
9:9C2E  a1c65e               mov ax, word ptr [0x5ec6]
9:9C31  8b16c85e             mov dx, word ptr [0x5ec8]
loc_9C35:
9:9C35  8946ac               mov word ptr [bp - 0x54], ax
9:9C38  8956ae               mov word ptr [bp - 0x52], dx
9:9C3B  52                   push dx
9:9C3C  50                   push ax
9:9C3D  9a899c0000           lcall 0, 0x9c89  ; GDI.SetTextColor
9:9C42  8946a6               mov word ptr [bp - 0x5a], ax
9:9C45  8956a8               mov word ptr [bp - 0x58], dx
9:9C48  ff76be               push word ptr [bp - 0x42]
9:9C4B  666800000001         push 0x1000000
9:9C51  9a959c0000           lcall 0, 0x9c95  ; GDI.SetBkColor
9:9C56  8946a2               mov word ptr [bp - 0x5e], ax
9:9C59  8956a4               mov word ptr [bp - 0x5c], dx
9:9C5C  ff76be               push word ptr [bp - 0x42]
9:9C5F  8b4608               mov ax, word ptr [bp + 8]
9:9C62  8b560a               mov dx, word ptr [bp + 0xa]
9:9C65  050600               add ax, 6
9:9C68  52                   push dx
9:9C69  50                   push ax
9:9C6A  52                   push dx
9:9C6B  50                   push ax
9:9C6C  9aa43d3c99           lcall 0x993c, 0x3da4  ; _fstrlen@s1:3DA4
9:9C71  83c404               add sp, 4
9:9C74  50                   push ax
9:9C75  8d46f8               lea ax, [bp - 8]
9:9C78  16                   push ss
9:9C79  50                   push ax
9:9C7A  6a01                 push 1
9:9C7C  9a72960000           lcall 0, 0x9672  ; USER.DrawText
9:9C81  ff76be               push word ptr [bp - 0x42]
9:9C84  66ff76a6             push dword ptr [bp - 0x5a]
9:9C88  9a26950000           lcall 0, 0x9526  ; GDI.SetTextColor
9:9C8D  ff76be               push word ptr [bp - 0x42]
9:9C90  66ff76a2             push dword ptr [bp - 0x5e]
9:9C94  9a0e950000           lcall 0, 0x950e  ; GDI.SetBkColor
loc_9C99:
9:9C99  837ee400             cmp word ptr [bp - 0x1c], 0
9:9C9D  740b                 je 0x9caa
9:9C9F  ff76be               push word ptr [bp - 0x42]
9:9CA2  ff76e4               push word ptr [bp - 0x1c]
9:9CA5  9ab19c0000           lcall 0, 0x9cb1  ; GDI.SelectObject
loc_9CAA:
9:9CAA  ff76be               push word ptr [bp - 0x42]
9:9CAD  ff76b6               push word ptr [bp - 0x4a]
9:9CB0  9a7e8d0000           lcall 0, 0x8d7e  ; GDI.SelectObject
9:9CB5  66ff76bc             push dword ptr [bp - 0x44]
9:9CB9  9affff0000           lcall 0, 0xffff  ; GDI.SetMapMode
9:9CBE  ff76ba               push word ptr [bp - 0x46]
9:9CC1  9aca9c0000           lcall 0, 0x9cca  ; GDI.DeleteObject
9:9CC6  ff76b8               push word ptr [bp - 0x48]
9:9CC9  9af1940000           lcall 0, 0x94f1  ; GDI.DeleteObject
9:9CCE  ff7606               push word ptr [bp + 6]
9:9CD1  8d46c0               lea ax, [bp - 0x40]
9:9CD4  16                   push ss
9:9CD5  50                   push ax
9:9CD6  9a308b0000           lcall 0, 0x8b30  ; USER.EndPaint
9:9CDB  c9                   leave
9:9CDC  cb                   retf
9:9CDD  db 00

; ---------------- OPButton::wndProc@s9:9CDE FAR size=1318 callers=0
;   apis: USER.DefWindowProc, USER.GetClientRect, USER.GetDlgCtrlID, USER.GetNextDlgTabItem, USER.GetWindowLong, USER.InvalidateRect, USER.IsWindow, USER.PostMessage, USER.PtInRect, USER.ReleaseCapture, USER.SendDlgItemMessage, USER.SendMessage, USER.SetCapture, USER.SetFocus, USER.SetWindowLong, USER.UpdateWindow
;   the OPButton window procedure
9:9CDE  8cd0                 mov ax, ss
9:9CE0  c81c0000             enter 0x1c, 0
9:9CE4  1e                   push ds
9:9CE5  8ed8                 mov ds, ax
9:9CE7  ff760e               push word ptr [bp + 0xe]
9:9CEA  6a00                 push 0
9:9CEC  9a829d0000           lcall 0, 0x9d82  ; USER.GetWindowLong
9:9CF1  8946f0               mov word ptr [bp - 0x10], ax
9:9CF4  8956f2               mov word ptr [bp - 0xe], dx
9:9CF7  8b460c               mov ax, word ptr [bp + 0xc]
9:9CFA  3d3000               cmp ax, 0x30
9:9CFD  0f840d01             je 0x9e0e
9:9D01  0f87bf04             ja 0xa1c4
9:9D05  3d1f00               cmp ax, 0x1f
9:9D08  7422                 je 0x9d2c
9:9D0A  0f87a004             ja 0xa1ae
9:9D0E  3c08                 cmp al, 8
9:9D10  0f842603             je 0xa03a
9:9D14  0f878404             ja 0xa19c
9:9D18  fec8                 dec al
9:9D1A  7460                 je 0x9d7c
9:9D1C  fec8                 dec al
9:9D1E  0f841601             je 0x9e38
9:9D22  2c05                 sub al, 5
9:9D24  0f84a802             je 0x9fd0
9:9D28  e98304               jmp 0xa1ae
9:9D2B  db 90
loc_9D2C:
9:9D2C  c45ef0               les bx, ptr [bp - 0x10]
9:9D2F  26c747040000         mov word ptr es:[bx + 4], 0
9:9D35  9aa59e0000           lcall 0, 0x9ea5  ; USER.ReleaseCapture
9:9D3A  e9d903               jmp 0xa116
9:9D3D  db 90
loc_9D3E:
9:9D3E  ff760e               push word ptr [bp + 0xe]
9:9D41  666a5e               push 0x5e
9:9D44  9a9c17d29d           lcall 0x9dd2, 0x179c  ; operator_new@s1:179C
9:9D49  83c402               add sp, 2
9:9D4C  8946e8               mov word ptr [bp - 0x18], ax
9:9D4F  8956ea               mov word ptr [bp - 0x16], dx
9:9D52  0bd0                 or dx, ax
9:9D54  740c                 je 0x9d62
9:9D56  ff76ea               push word ptr [bp - 0x16]
9:9D59  50                   push ax
9:9D5A  90                   nop
9:9D5B  0e                   push cs
9:9D5C  e8c5fa               call 0x9824  ; OPButtonData::init@s9:9824
9:9D5F  eb04                 jmp 0x9d65
9:9D61  db 90
loc_9D62:
9:9D62  33c0                 xor ax, ax
9:9D64  99                   cdq
loc_9D65:
9:9D65  8946ec               mov word ptr [bp - 0x14], ax
9:9D68  8956ee               mov word ptr [bp - 0x12], dx
9:9D6B  52                   push dx
9:9D6C  50                   push ax
9:9D6D  9a5a9e0000           lcall 0, 0x9e5a  ; USER.SetWindowLong
loc_9D72:
9:9D72  b80100               mov ax, 1
loc_9D75:
9:9D75  33d2                 xor dx, dx
9:9D77  1f                   pop ds
9:9D78  c9                   leave
9:9D79  ca0a00               retf 0xa
loc_9D7C:
9:9D7C  ff760e               push word ptr [bp + 0xe]
9:9D7F  6a00                 push 0
9:9D81  9ab07c0000           lcall 0, 0x7cb0  ; USER.GetWindowLong
9:9D86  8946ec               mov word ptr [bp - 0x14], ax
9:9D89  8956ee               mov word ptr [bp - 0x12], dx
9:9D8C  c45e06               les bx, ptr [bp + 6]
9:9D8F  895ee4               mov word ptr [bp - 0x1c], bx
9:9D92  8c46e6               mov word ptr [bp - 0x1a], es
9:9D95  268b4708             mov ax, word ptr es:[bx + 8]
9:9D99  c45eec               les bx, ptr [bp - 0x14]
9:9D9C  26894702             mov word ptr es:[bx + 2], ax
9:9DA0  ff760e               push word ptr [bp + 0xe]
9:9DA3  9ad17e0000           lcall 0, 0x7ed1  ; USER.GetDlgCtrlID
9:9DA8  c45eec               les bx, ptr [bp - 0x14]
9:9DAB  268907               mov word ptr es:[bx], ax
9:9DAE  c45ee4               les bx, ptr [bp - 0x1c]
9:9DB1  66268b4712           mov eax, dword ptr es:[bx + 0x12]
9:9DB6  c45eec               les bx, ptr [bp - 0x14]
9:9DB9  6626894756           mov dword ptr es:[bx + 0x56], eax
9:9DBE  c45ee4               les bx, ptr [bp - 0x1c]
9:9DC1  6626ff7716           push dword ptr es:[bx + 0x16]
9:9DC6  668b46ec             mov eax, dword ptr [bp - 0x14]
9:9DCA  050600               add ax, 6
9:9DCD  6650                 push eax
9:9DCF  9a3e3d4c9e           lcall 0x9e4c, 0x3d3e  ; _fstrcpy@s1:3D3E
9:9DD4  83c408               add sp, 8
9:9DD7  c45ee4               les bx, ptr [bp - 0x1c]
9:9DDA  26f6471201           test byte ptr es:[bx + 0x12], 1
9:9DDF  7415                 je 0x9df6
9:9DE1  26ff7708             push word ptr es:[bx + 8]
9:9DE5  680104               push 0x401
9:9DE8  c45eec               les bx, ptr [bp - 0x14]
9:9DEB  26ff37               push word ptr es:[bx]
9:9DEE  666a00               push 0
9:9DF1  9ae69f0000           lcall 0, 0x9fe6  ; USER.SendMessage
loc_9DF6:
9:9DF6  c45ee4               les bx, ptr [bp - 0x1c]
9:9DF9  26f747140008         test word ptr es:[bx + 0x14], 0x800
9:9DFF  0f846fff             je 0x9d72
9:9E03  c45eec               les bx, ptr [bp - 0x14]
9:9E06  26804f0404           or byte ptr es:[bx + 4], 4
9:9E0B  e964ff               jmp 0x9d72
loc_9E0E:
9:9E0E  8b460a               mov ax, word ptr [bp + 0xa]
9:9E11  c45ef0               les bx, ptr [bp - 0x10]
9:9E14  2689475a             mov word ptr es:[bx + 0x5a], ax
loc_9E18:
9:9E18  837e0600             cmp word ptr [bp + 6], 0
loc_9E1C:
9:9E1C  0f84f602             je 0xa116
loc_9E20:
9:9E20  ff760e               push word ptr [bp + 0xe]
9:9E23  666a00               push 0
9:9E26  6a01                 push 1
9:9E28  9a8d9e0000           lcall 0, 0x9e8d  ; USER.InvalidateRect
9:9E2D  ff760e               push word ptr [bp + 0xe]
9:9E30  9a959e0000           lcall 0, 0x9e95  ; USER.UpdateWindow
9:9E35  e9de02               jmp 0xa116
loc_9E38:
9:9E38  8b46f0               mov ax, word ptr [bp - 0x10]
9:9E3B  8946e8               mov word ptr [bp - 0x18], ax
9:9E3E  8956ea               mov word ptr [bp - 0x16], dx
9:9E41  8946e4               mov word ptr [bp - 0x1c], ax
9:9E44  8956e6               mov word ptr [bp - 0x1a], dx
9:9E47  52                   push dx
9:9E48  50                   push ax
9:9E49  9ace17059a           lcall 0x9a05, 0x17ce  ; operator_delete@s1:17CE
9:9E4E  83c404               add sp, 4
9:9E51  ff760e               push word ptr [bp + 0xe]
9:9E54  666a00               push 0
9:9E57  6a00                 push 0
9:9E59  9a29930000           lcall 0, 0x9329  ; USER.SetWindowLong
9:9E5E  e9b502               jmp 0xa116
9:9E61  db 90
loc_9E62:
9:9E62  66ff76f0             push dword ptr [bp - 0x10]
9:9E66  ff760e               push word ptr [bp + 0xe]
9:9E69  90                   nop
9:9E6A  0e                   push cs
9:9E6B  e8dafa               call 0x9948  ; OPButton::paint@s9:9948
9:9E6E  83c406               add sp, 6
9:9E71  e9a202               jmp 0xa116
loc_9E74:
9:9E74  ff760e               push word ptr [bp + 0xe]
9:9E77  9a56430000           lcall 0, 0x4356  ; USER.SetFocus
9:9E7C  c45ef0               les bx, ptr [bp - 0x10]
9:9E7F  26804f0403           or byte ptr es:[bx + 4], 3
9:9E84  ff760e               push word ptr [bp + 0xe]
9:9E87  666a00               push 0
9:9E8A  6a01                 push 1
9:9E8C  9ad89e0000           lcall 0, 0x9ed8  ; USER.InvalidateRect
9:9E91  ff760e               push word ptr [bp + 0xe]
9:9E94  9ae09e0000           lcall 0, 0x9ee0  ; USER.UpdateWindow
9:9E99  ff760e               push word ptr [bp + 0xe]
9:9E9C  9affff0000           lcall 0, 0xffff  ; USER.SetCapture
9:9EA1  e97202               jmp 0xa116
loc_9EA4:
9:9EA4  9affff0000           lcall 0, 0xffff  ; USER.ReleaseCapture
9:9EA9  ff760e               push word ptr [bp + 0xe]
9:9EAC  8d46f8               lea ax, [bp - 8]
9:9EAF  16                   push ss
9:9EB0  50                   push ax
9:9EB1  9a2d9f0000           lcall 0, 0x9f2d  ; USER.GetClientRect
9:9EB6  668b4606             mov eax, dword ptr [bp + 6]
9:9EBA  668946f4             mov dword ptr [bp - 0xc], eax
9:9EBE  c45ef0               les bx, ptr [bp - 0x10]
9:9EC1  26f6470401           test byte ptr es:[bx + 4], 1
9:9EC6  0f844c02             je 0xa116
9:9ECA  26806704fc           and byte ptr es:[bx + 4], 0xfc
9:9ECF  ff760e               push word ptr [bp + 0xe]
9:9ED2  666a00               push 0
9:9ED5  6a01                 push 1
9:9ED7  9a09750000           lcall 0, 0x7509  ; USER.InvalidateRect
9:9EDC  ff760e               push word ptr [bp + 0xe]
9:9EDF  9ade930000           lcall 0, 0x93de  ; USER.UpdateWindow
9:9EE4  8d46f8               lea ax, [bp - 8]
9:9EE7  16                   push ss
9:9EE8  50                   push ax
9:9EE9  66ff76f4             push dword ptr [bp - 0xc]
9:9EED  9a459f0000           lcall 0, 0x9f45  ; USER.PtInRect
9:9EF2  0bc0                 or ax, ax
9:9EF4  0f841e02             je 0xa116
9:9EF8  c45ef0               les bx, ptr [bp - 0x10]
9:9EFB  26ff7702             push word ptr es:[bx + 2]
9:9EFF  681101               push 0x111
9:9F02  26ff37               push word ptr es:[bx]
9:9F05  666a00               push 0
9:9F08  9a6d890000           lcall 0, 0x896d  ; USER.PostMessage
9:9F0D  e90602               jmp 0xa116
loc_9F10:
9:9F10  c45ef0               les bx, ptr [bp - 0x10]
9:9F13  26f6470401           test byte ptr es:[bx + 4], 1
9:9F18  0f84fa01             je 0xa116
9:9F1C  668b4606             mov eax, dword ptr [bp + 6]
9:9F20  668946f4             mov dword ptr [bp - 0xc], eax
9:9F24  ff760e               push word ptr [bp + 0xe]
9:9F27  8d46f8               lea ax, [bp - 8]
9:9F2A  16                   push ss
9:9F2B  50                   push ax
9:9F2C  9a9d990000           lcall 0, 0x999d  ; USER.GetClientRect
9:9F31  c45ef0               les bx, ptr [bp - 0x10]
9:9F34  268b4704             mov ax, word ptr es:[bx + 4]
9:9F38  8946e4               mov word ptr [bp - 0x1c], ax
9:9F3B  8d46f8               lea ax, [bp - 8]
9:9F3E  16                   push ss
9:9F3F  50                   push ax
9:9F40  66ff76f4             push dword ptr [bp - 0xc]
9:9F44  9a55970000           lcall 0, 0x9755  ; USER.PtInRect
9:9F49  0bc0                 or ax, ax
9:9F4B  750b                 jne 0x9f58
9:9F4D  c45ef0               les bx, ptr [bp - 0x10]
9:9F50  26806704fd           and byte ptr es:[bx + 4], 0xfd
9:9F55  eb09                 jmp 0x9f60
9:9F57  db 90
loc_9F58:
9:9F58  c45ef0               les bx, ptr [bp - 0x10]
9:9F5B  26804f0402           or byte ptr es:[bx + 4], 2
loc_9F60:
9:9F60  8b46e4               mov ax, word ptr [bp - 0x1c]
9:9F63  c45ef0               les bx, ptr [bp - 0x10]
9:9F66  26394704             cmp word ptr es:[bx + 4], ax
9:9F6A  e9affe               jmp 0x9e1c
9:9F6D  db 90
loc_9F6E:
9:9F6E  c746e40100           mov word ptr [bp - 0x1c], 1
9:9F73  c45ef0               les bx, ptr [bp - 0x10]
9:9F76  26f6475601           test byte ptr es:[bx + 0x56], 1
9:9F7B  7407                 je 0x9f84
9:9F7D  c746e41100           mov word ptr [bp - 0x1c], 0x11
9:9F82  eb04                 jmp 0x9f88
loc_9F84:
9:9F84  804ee420             or byte ptr [bp - 0x1c], 0x20
loc_9F88:
9:9F88  8b46e4               mov ax, word ptr [bp - 0x1c]
9:9F8B  2bd2                 sub dx, dx
9:9F8D  1f                   pop ds
9:9F8E  c9                   leave
9:9F8F  ca0a00               retf 0xa
loc_9F92:
9:9F92  c45ef0               les bx, ptr [bp - 0x10]
9:9F95  26806704fb           and byte ptr es:[bx + 4], 0xfb
9:9F9A  837e0a00             cmp word ptr [bp + 0xa], 0
9:9F9E  0f857efe             jne 0x9e20
9:9FA2  26804f0404           or byte ptr es:[bx + 4], 4
9:9FA7  e976fe               jmp 0x9e20
loc_9FAA:
9:9FAA  837e0a01             cmp word ptr [bp + 0xa], 1
9:9FAE  7510                 jne 0x9fc0
9:9FB0  c45ef0               les bx, ptr [bp - 0x10]
9:9FB3  6626c7475601000000   mov dword ptr es:[bx + 0x56], 1
9:9FBC  e959fe               jmp 0x9e18
9:9FBF  db 90
loc_9FC0:
9:9FC0  c45ef0               les bx, ptr [bp - 0x10]
9:9FC3  6626c7475600000000   mov dword ptr es:[bx + 0x56], 0
9:9FCC  e949fe               jmp 0x9e18
9:9FCF  db 90
loc_9FD0:
9:9FD0  c45ef0               les bx, ptr [bp - 0x10]
9:9FD3  26804f0408           or byte ptr es:[bx + 4], 8
9:9FD8  26ff7702             push word ptr es:[bx + 2]
9:9FDC  666800000004         push 0x4000000
9:9FE2  666a00               push 0
9:9FE5  9a26a00000           lcall 0, 0xa026  ; USER.SendMessage
9:9FEA  8946e4               mov word ptr [bp - 0x1c], ax
9:9FED  8956e6               mov word ptr [bp - 0x1a], dx
9:9FF0  81fa4b53             cmp dx, 0x534b
9:9FF4  751f                 jne 0xa015
9:9FF6  c45ef0               les bx, ptr [bp - 0x10]
9:9FF9  2689475c             mov word ptr es:[bx + 0x5c], ax
9:9FFD  263b07               cmp ax, word ptr es:[bx]
9:A000  7413                 je 0xa015
9:A002  26ff7702             push word ptr es:[bx + 2]
9:A006  50                   push ax
9:A007  666800000404         push 0x4040000
9:A00D  666a01               push 1
9:A010  9a293f0000           lcall 0, 0x3f29  ; USER.SendDlgItemMessage
loc_A015:
9:A015  c45ef0               les bx, ptr [bp - 0x10]
9:A018  26ff7702             push word ptr es:[bx + 2]
9:A01C  680104               push 0x401
9:A01F  26ff37               push word ptr es:[bx]
9:A022  666a00               push 0
9:A025  9a60a00000           lcall 0, 0xa060  ; USER.SendMessage
9:A02A  c45ef0               les bx, ptr [bp - 0x10]
9:A02D  6626c7475601000000   mov dword ptr es:[bx + 0x56], 1
9:A036  e9e7fd               jmp 0x9e20
9:A039  db 90
loc_A03A:
9:A03A  c45ef0               les bx, ptr [bp - 0x10]
9:A03D  26806704f7           and byte ptr es:[bx + 4], 0xf7
9:A042  c746e40000           mov word ptr [bp - 0x1c], 0
9:A047  ff760a               push word ptr [bp + 0xa]
9:A04A  9a26820000           lcall 0, 0x8226  ; USER.IsWindow
9:A04F  0bc0                 or ax, ax
9:A051  7424                 je 0xa077
9:A053  ff760a               push word ptr [bp + 0xa]
9:A056  666800008700         push 0x870000
9:A05C  666a00               push 0
9:A05F  9a19940000           lcall 0, 0x9419  ; USER.SendMessage
9:A064  8946ec               mov word ptr [bp - 0x14], ax
9:A067  8956ee               mov word ptr [bp - 0x12], dx
9:A06A  252000               and ax, 0x20
9:A06D  3d0100               cmp ax, 1
9:A070  1bc0                 sbb ax, ax
9:A072  f7d8                 neg ax
9:A074  8946e4               mov word ptr [bp - 0x1c], ax
loc_A077:
9:A077  c45ef0               les bx, ptr [bp - 0x10]
9:A07A  662bc0               sub eax, eax
9:A07D  6626894756           mov dword ptr es:[bx + 0x56], eax
9:A082  26ff7702             push word ptr es:[bx + 2]
9:A086  680104               push 0x401
9:A089  26ff775c             push word ptr es:[bx + 0x5c]
9:A08D  50                   push ax
9:A08E  50                   push ax
9:A08F  9a95a10000           lcall 0, 0xa195  ; USER.SendMessage
9:A094  c45ef0               les bx, ptr [bp - 0x10]
9:A097  26837f5c00           cmp word ptr es:[bx + 0x5c], 0
9:A09C  7423                 je 0xa0c1
9:A09E  268b07               mov ax, word ptr es:[bx]
9:A0A1  2639475c             cmp word ptr es:[bx + 0x5c], ax
9:A0A5  741a                 je 0xa0c1
9:A0A7  26ff7702             push word ptr es:[bx + 2]
9:A0AB  26ff775c             push word ptr es:[bx + 0x5c]
9:A0AF  666801000404         push 0x4040001
9:A0B5  660fbf46e4           movsx eax, word ptr [bp - 0x1c]
9:A0BA  6650                 push eax
9:A0BC  9a11a00000           lcall 0, 0xa011  ; USER.SendDlgItemMessage
loc_A0C1:
9:A0C1  c45ef0               les bx, ptr [bp - 0x10]
9:A0C4  26c7475c0000         mov word ptr es:[bx + 0x5c], 0
9:A0CA  e953fd               jmp 0x9e20
9:A0CD  db 90
loc_A0CE:
9:A0CE  66837e0600           cmp dword ptr [bp + 6], 0
9:A0D3  0f8449fd             je 0x9e20
9:A0D7  66ff7606             push dword ptr [bp + 6]
9:A0DB  668b46f0             mov eax, dword ptr [bp - 0x10]
9:A0DF  050600               add ax, 6
9:A0E2  6650                 push eax
9:A0E4  9a3e3d479d           lcall 0x9d47, 0x3d3e  ; _fstrcpy@s1:3D3E
9:A0E9  83c408               add sp, 8
9:A0EC  e931fd               jmp 0x9e20
9:A0EF  db 90
loc_A0F0:
9:A0F0  837e0a26             cmp word ptr [bp + 0xa], 0x26
9:A0F4  7406                 je 0xa0fc
9:A0F6  837e0a25             cmp word ptr [bp + 0xa], 0x25
9:A0FA  7520                 jne 0xa11c
loc_A0FC:
9:A0FC  c45ef0               les bx, ptr [bp - 0x10]
9:A0FF  26ff7702             push word ptr es:[bx + 2]
9:A103  ff760e               push word ptr [bp + 0xe]
9:A106  6a01                 push 1
loc_A108:
9:A108  9affff0000           lcall 0, 0xffff  ; USER.GetNextDlgTabItem
9:A10D  8946e4               mov word ptr [bp - 0x1c], ax
9:A110  50                   push ax
9:A111  9a789e0000           lcall 0, 0x9e78  ; USER.SetFocus
loc_A116:
9:A116  33c0                 xor ax, ax
9:A118  e95afc               jmp 0x9d75
9:A11B  db 90
loc_A11C:
9:A11C  837e0a28             cmp word ptr [bp + 0xa], 0x28
9:A120  7406                 je 0xa128
9:A122  837e0a27             cmp word ptr [bp + 0xa], 0x27
9:A126  750e                 jne 0xa136
loc_A128:
9:A128  c45ef0               les bx, ptr [bp - 0x10]
9:A12B  26ff7702             push word ptr es:[bx + 2]
9:A12F  ff760e               push word ptr [bp + 0xe]
9:A132  6a00                 push 0
9:A134  ebd2                 jmp 0xa108
loc_A136:
9:A136  837e0a20             cmp word ptr [bp + 0xa], 0x20
9:A13A  7406                 je 0xa142
9:A13C  837e0a0d             cmp word ptr [bp + 0xa], 0xd
9:A140  756c                 jne 0xa1ae
loc_A142:
9:A142  833ed85e00           cmp word ptr [0x5ed8], 0
9:A147  7565                 jne 0xa1ae
9:A149  c706d85e0100         mov word ptr [0x5ed8], 1
9:A14F  c45ef0               les bx, ptr [bp - 0x10]
9:A152  26804f0402           or byte ptr es:[bx + 4], 2
9:A157  e9c6fc               jmp 0x9e20
loc_A15A:
9:A15A  833ed85e00           cmp word ptr [0x5ed8], 0
9:A15F  744d                 je 0xa1ae
9:A161  c706d85e0000         mov word ptr [0x5ed8], 0
9:A167  c45ef0               les bx, ptr [bp - 0x10]
9:A16A  26806704fd           and byte ptr es:[bx + 4], 0xfd
9:A16F  ff760e               push word ptr [bp + 0xe]
9:A172  666a00               push 0
9:A175  6a01                 push 1
9:A177  9a299e0000           lcall 0, 0x9e29  ; USER.InvalidateRect
9:A17C  ff760e               push word ptr [bp + 0xe]
9:A17F  9a319e0000           lcall 0, 0x9e31  ; USER.UpdateWindow
9:A184  c45ef0               les bx, ptr [bp - 0x10]
9:A187  26ff7702             push word ptr es:[bx + 2]
9:A18B  681101               push 0x111
9:A18E  26ff37               push word ptr es:[bx]
9:A191  666a00               push 0
9:A194  9af29d0000           lcall 0, 0x9df2  ; USER.SendMessage
9:A199  e97aff               jmp 0xa116
loc_A19C:
9:A19C  2c0a                 sub al, 0xa
9:A19E  0f84f0fd             je 0x9f92
9:A1A2  2c02                 sub al, 2
9:A1A4  0f8426ff             je 0xa0ce
9:A1A8  2c03                 sub al, 3
9:A1AA  0f84b4fc             je 0x9e62
loc_A1AE:
9:A1AE  66ff760c             push dword ptr [bp + 0xc]
9:A1B2  66ff7608             push dword ptr [bp + 8]
9:A1B6  ff7606               push word ptr [bp + 6]
9:A1B9  9affff0000           lcall 0, 0xffff  ; USER.DefWindowProc
9:A1BE  1f                   pop ds
9:A1BF  c9                   leave
9:A1C0  ca0a00               retf 0xa
9:A1C3  db 90
loc_A1C4:
9:A1C4  3d0002               cmp ax, 0x200
9:A1C7  0f8445fd             je 0x9f10
9:A1CB  771d                 ja 0xa1ea
9:A1CD  2d8100               sub ax, 0x81
9:A1D0  0f846afb             je 0x9d3e
9:A1D4  2d0600               sub ax, 6
9:A1D7  0f8493fd             je 0x9f6e
9:A1DB  2d7900               sub ax, 0x79
9:A1DE  0f840eff             je 0xa0f0
9:A1E2  48                   dec ax
9:A1E3  0f8473ff             je 0xa15a
9:A1E7  ebc5                 jmp 0xa1ae
9:A1E9  db 90
loc_A1EA:
9:A1EA  2d0102               sub ax, 0x201
9:A1ED  0f8483fc             je 0x9e74
9:A1F1  48                   dec ax
9:A1F2  0f84aefc             je 0x9ea4
9:A1F6  48                   dec ax
9:A1F7  0f8479fc             je 0x9e74
9:A1FB  2d0102               sub ax, 0x201
9:A1FE  0f84a8fd             je 0x9faa
9:A202  ebaa                 jmp 0xa1ae

; ---------------- OPButton::scalar_dtor@s9:A204 FAR size=48 callers=0
;   deleting destructor
9:A204  c8080000             enter 8, 0
9:A208  c45e06               les bx, ptr [bp + 6]
9:A20B  26c7079a38           mov word ptr es:[bx], 0x389a
9:A210  26c747026498         mov word ptr es:[bx + 2], 0x9864  ; SEGMENT s2:0000
9:A216  f6460a01             test byte ptr [bp + 0xa], 1
9:A21A  7409                 je 0xa225
9:A21C  66ff7606             push dword ptr [bp + 6]
9:A220  9ace17e7a0           lcall 0xa0e7, 0x17ce  ; operator_delete@s1:17CE
loc_A225:
9:A225  8b4606               mov ax, word ptr [bp + 6]
9:A228  8b5608               mov dx, word ptr [bp + 8]
9:A22B  c9                   leave
9:A22C  ca0600               retf 6
9:A22F  db 90 04 a2 f9 98

; ---------------- LabTopicDlg::LabTopicDlg@s9:A234 FAR size=96 callers=1
;   apis: KERNEL.MakeProcInstance
;   a lab building's window with its topic list (vtable A4E8)
9:A234  55                   push bp
9:A235  8bec                 mov bp, sp
9:A237  66ff760c             push dword ptr [bp + 0xc]
9:A23B  66ff7608             push dword ptr [bp + 8]
9:A23F  ff7606               push word ptr [bp + 6]
9:A242  90                   nop
9:A243  0e                   push cs
9:A244  e8f90d               call 0xb040  ; BuildingDlgBase::BuildingDlgBase@s9:B040
9:A247  c45e06               les bx, ptr [bp + 6]
9:A24A  26c707e8a4           mov word ptr es:[bx], 0xa4e8
9:A24F  26c747025ea2         mov word ptr es:[bx + 2], 0xa25e  ; SEGMENT s9:0000
9:A255  66833edc5e00         cmp dword ptr [0x5edc], 0
9:A25B  7516                 jne 0xa273
9:A25D  6832a2               push 0xa232  ; SEGMENT s9:0000
9:A260  680ea4               push 0xa40e
9:A263  ff368c03             push word ptr [0x38c]
9:A267  9a04910000           lcall 0, 0x9104  ; KERNEL.MakeProcInstance
9:A26C  a3dc5e               mov word ptr [0x5edc], ax
9:A26F  8916de5e             mov word ptr [0x5ede], dx
loc_A273:
9:A273  66a1dc5e             mov eax, dword ptr [0x5edc]
9:A277  c45e06               les bx, ptr [bp + 6]
9:A27A  662689470c           mov dword ptr es:[bx + 0xc], eax
9:A27F  891ee05e             mov word ptr [0x5ee0], bx
9:A283  8c06e25e             mov word ptr [0x5ee2], es
9:A287  ff06da5e             inc word ptr [0x5eda]
9:A28B  8bc3                 mov ax, bx
9:A28D  8cc2                 mov dx, es
9:A28F  c9                   leave
9:A290  ca0a00               retf 0xa
9:A293  db 00

; ---------------- LabTopicDlg::~LabTopicDlg@s9:A294 FAR size=56 callers=1
;   apis: KERNEL.FreeProcInstance
;   dtor
9:A294  55                   push bp
9:A295  8bec                 mov bp, sp
9:A297  c45e06               les bx, ptr [bp + 6]
9:A29A  26c707e8a4           mov word ptr es:[bx], 0xa4e8
9:A29F  26c7470253a2         mov word ptr es:[bx + 2], 0xa253  ; SEGMENT s9:0000
9:A2A5  ff0eda5e             dec word ptr [0x5eda]
9:A2A9  7513                 jne 0xa2be
9:A2AB  66ff36dc5e           push dword ptr [0x5edc]
9:A2B0  9a13920000           lcall 0, 0x9213  ; KERNEL.FreeProcInstance
9:A2B5  66c706dc5e00000000   mov dword ptr [0x5edc], 0
loc_A2BE:
9:A2BE  66ff7606             push dword ptr [bp + 6]
9:A2C2  90                   nop
9:A2C3  0e                   push cs
9:A2C4  e8310e               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:A2C7  c9                   leave
9:A2C8  ca0400               retf 4
9:A2CB  db 00

; ---------------- LabTopicDlg::onCommand@s9:A2CC FAR size=60 callers=0
;   (vslot 4) control 6182
9:A2CC  55                   push bp
9:A2CD  8bec                 mov bp, sp
9:A2CF  817e0e2618           cmp word ptr [bp + 0xe], 0x1826
9:A2D4  751e                 jne 0xa2f4
9:A2D6  8b460c               mov ax, word ptr [bp + 0xc]
9:A2D9  48                   dec ax
9:A2DA  7412                 je 0xa2ee
9:A2DC  2d0200               sub ax, 2
9:A2DF  7205                 jb 0xa2e6
9:A2E1  2d0100               sub ax, 1
9:A2E4  7608                 jbe 0xa2ee
loc_A2E6:
9:A2E6  33c0                 xor ax, ax
loc_A2E8:
9:A2E8  33d2                 xor dx, dx
9:A2EA  c9                   leave
9:A2EB  ca0a00               retf 0xa
loc_A2EE:
9:A2EE  b80100               mov ax, 1
9:A2F1  ebf5                 jmp 0xa2e8
9:A2F3  db 90
loc_A2F4:
9:A2F4  66ff760c             push dword ptr [bp + 0xc]
9:A2F8  66ff7608             push dword ptr [bp + 8]
9:A2FC  ff7606               push word ptr [bp + 6]
9:A2FF  90                   nop
9:A300  0e                   push cs
9:A301  e84612               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:A304  c9                   leave
9:A305  ca0a00               retf 0xa

; ---------------- LabTopicDlg::fillTopics@s9:A308 FAR size=200 callers=2
;   apis: USER.SendMessage
;   topic names
9:A308  c80e0000             enter 0xe, 0
9:A30C  56                   push si
9:A30D  ff760e               push word ptr [bp + 0xe]
9:A310  666800000504         push 0x4050000
9:A316  666a00               push 0
9:A319  9a2ba30000           lcall 0, 0xa32b  ; USER.SendMessage
9:A31E  ff760e               push word ptr [bp + 0xe]
9:A321  666800000b00         push 0xb0000
9:A327  666a00               push 0
9:A32A  9a94a30000           lcall 0, 0xa394  ; USER.SendMessage
9:A32F  c45e06               les bx, ptr [bp + 6]
9:A332  26c49f9000           les bx, ptr es:[bx + 0x90]
9:A337  26837f1000           cmp word ptr es:[bx + 0x10], 0
9:A33C  745c                 je 0xa39a
9:A33E  6a03                 push 3
9:A340  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:A345  9aba208fa3           lcall 0xa38f, 0x20ba  ; Registry_get@s3:20BA
9:A34A  8946f8               mov word ptr [bp - 8], ax
9:A34D  8956fa               mov word ptr [bp - 6], dx
9:A350  c746f60000           mov word ptr [bp - 0xa], 0
9:A355  eb04                 jmp 0xa35b
9:A357  db 90
loc_A358:
9:A358  ff46f6               inc word ptr [bp - 0xa]
loc_A35B:
9:A35B  8b46f6               mov ax, word ptr [bp - 0xa]
9:A35E  c45e06               les bx, ptr [bp + 6]
9:A361  26c49f9000           les bx, ptr es:[bx + 0x90]
9:A366  26394710             cmp word ptr es:[bx + 0x10], ax
9:A36A  7e4b                 jle 0xa3b7
9:A36C  ff760e               push word ptr [bp + 0xe]
9:A36F  666800000104         push 0x4010000
9:A375  8bf0                 mov si, ax
9:A377  03f0                 add si, ax
9:A379  c45e06               les bx, ptr [bp + 6]
9:A37C  26c49f9000           les bx, ptr es:[bx + 0x90]
9:A381  26c45f0c             les bx, ptr es:[bx + 0xc]
9:A385  26ff30               push word ptr es:[bx + si]
9:A388  66ff76f8             push dword ptr [bp - 8]
9:A38C  9a92acaea3           lcall 0xa3ae, 0xac92  ; researchTopicName@s3:AC92
9:A391  52                   push dx
9:A392  50                   push ax
9:A393  9ab3a30000           lcall 0, 0xa3b3  ; USER.SendMessage
9:A398  ebbe                 jmp 0xa358
loc_A39A:
9:A39A  ff760e               push word ptr [bp + 0xe]
9:A39D  666800000104         push 0x4010000
9:A3A3  683105               push 0x531
9:A3A6  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:A3AB  9a7e845690           lcall 0x9056, 0x847e  ; LoadStringRes@s3:847E
9:A3B0  52                   push dx
9:A3B1  50                   push ax
9:A3B2  9ac4a30000           lcall 0, 0xa3c4  ; USER.SendMessage
loc_A3B7:
9:A3B7  ff760e               push word ptr [bp + 0xe]
9:A3BA  666801000b00         push 0xb0001
9:A3C0  666a00               push 0
9:A3C3  9a90a00000           lcall 0, 0xa090  ; USER.SendMessage
9:A3C8  b80100               mov ax, 1
9:A3CB  5e                   pop si
9:A3CC  c9                   leave
9:A3CD  ca0a00               retf 0xa

; ---------------- LabTopicDlg::init@s9:A3D0 size=62 callers=0
;   apis: USER.GetDlgItem
;   (vslot 28)
9:A3D0  c8020000             enter 2, 0
9:A3D4  c45e06               les bx, ptr [bp + 6]
9:A3D7  662683bf900000       cmp dword ptr es:[bx + 0x90], 0
9:A3DE  7429                 je 0xa409
9:A3E0  268b4706             mov ax, word ptr es:[bx + 6]
9:A3E4  26c49f9000           les bx, ptr es:[bx + 0x90]
9:A3E9  26894714             mov word ptr es:[bx + 0x14], ax
9:A3ED  c45e06               les bx, ptr [bp + 6]
9:A3F0  26ff7706             push word ptr es:[bx + 6]
9:A3F4  682618               push 0x1826
9:A3F7  9aec8e0000           lcall 0, 0x8eec  ; USER.GetDlgItem
9:A3FC  50                   push ax
9:A3FD  666a00               push 0
9:A400  66ff7606             push dword ptr [bp + 6]
9:A404  90                   nop
9:A405  0e                   push cs
9:A406  e8fffe               call 0xa308  ; LabTopicDlg::fillTopics@s9:A308
loc_A409:
9:A409  c9                   leave
9:A40A  ca0400               retf 4
9:A40D  db 00

; ---------------- LabTopicDlg::listProc@s9:A40E FAR size=180 callers=0
;   apis: USER.CallWindowProc
;   subclass procedure of the topic list
9:A40E  8cd0                 mov ax, ss
9:A410  c8100000             enter 0x10, 0
9:A414  1e                   push ds
9:A415  8ed8                 mov ds, ax
9:A417  66c746fc00000000     mov dword ptr [bp - 4], 0
9:A41F  8b460c               mov ax, word ptr [bp + 0xc]
9:A422  2d1900               sub ax, 0x19
9:A425  740d                 je 0xa434
9:A427  2d6d00               sub ax, 0x6d
9:A42A  7432                 je 0xa45e
9:A42C  2d8a00               sub ax, 0x8a
9:A42F  7443                 je 0xa474
9:A431  eb1b                 jmp 0xa44e
9:A433  db 90
loc_A434:
9:A434  66ff7608             push dword ptr [bp + 8]
9:A438  ff7606               push word ptr [bp + 6]
9:A43B  c41ee05e             les bx, ptr [0x5ee0]
9:A43F  06                   push es
9:A440  53                   push bx
9:A441  26c41f               les bx, ptr es:[bx]
9:A444  26ff5f34             lcall es:[bx + 0x34]
9:A448  8946fc               mov word ptr [bp - 4], ax
9:A44B  8956fe               mov word ptr [bp - 2], dx
loc_A44E:
9:A44E  66837efc00           cmp dword ptr [bp - 4], 0
9:A453  7435                 je 0xa48a
9:A455  8b46fc               mov ax, word ptr [bp - 4]
9:A458  1f                   pop ds
9:A459  c9                   leave
9:A45A  ca0a00               retf 0xa
9:A45D  db 90
loc_A45E:
9:A45E  ff760a               push word ptr [bp + 0xa]
9:A461  c41ee05e             les bx, ptr [0x5ee0]
9:A465  06                   push es
9:A466  53                   push bx
9:A467  26c41f               les bx, ptr es:[bx]
9:A46A  26ff5f20             lcall es:[bx + 0x20]
9:A46E  1f                   pop ds
9:A46F  c9                   leave
9:A470  ca0a00               retf 0xa
9:A473  db 90
loc_A474:
9:A474  66ff7608             push dword ptr [bp + 8]
9:A478  ff7606               push word ptr [bp + 6]
9:A47B  66ff36e05e           push dword ptr [0x5ee0]
9:A480  90                   nop
9:A481  0e                   push cs
9:A482  e883fe               call 0xa308  ; LabTopicDlg::fillTopics@s9:A308
9:A485  1f                   pop ds
9:A486  c9                   leave
9:A487  ca0a00               retf 0xa
loc_A48A:
9:A48A  c41ec85b             les bx, ptr [0x5bc8]
9:A48E  268b4704             mov ax, word ptr es:[bx + 4]
9:A492  268b5706             mov dx, word ptr es:[bx + 6]
9:A496  8946f8               mov word ptr [bp - 8], ax
9:A499  8bc2                 mov ax, dx
9:A49B  0b46f8               or ax, word ptr [bp - 8]
9:A49E  741a                 je 0xa4ba
9:A4A0  52                   push dx
9:A4A1  ff76f8               push word ptr [bp - 8]
9:A4A4  66ff760c             push dword ptr [bp + 0xc]
9:A4A8  66ff7608             push dword ptr [bp + 8]
9:A4AC  ff7606               push word ptr [bp + 6]
9:A4AF  9a23970000           lcall 0, 0x9723  ; USER.CallWindowProc
9:A4B4  1f                   pop ds
9:A4B5  c9                   leave
9:A4B6  ca0a00               retf 0xa
9:A4B9  db 90
loc_A4BA:
9:A4BA  33c0                 xor ax, ax
9:A4BC  1f                   pop ds
9:A4BD  c9                   leave
9:A4BE  ca0a00               retf 0xa
9:A4C1  db 00

; ---------------- LabTopicDlg::scalar_dtor@s9:A4C2 FAR size=162 callers=0
;   deleting destructor
9:A4C2  55                   push bp
9:A4C3  8bec                 mov bp, sp
9:A4C5  66ff7606             push dword ptr [bp + 6]
9:A4C9  90                   nop
9:A4CA  0e                   push cs
9:A4CB  e8c6fd               call 0xa294  ; LabTopicDlg::~LabTopicDlg@s9:A294
9:A4CE  f6460a01             test byte ptr [bp + 0xa], 1
9:A4D2  7409                 je 0xa4dd
9:A4D4  66ff7606             push dword ptr [bp + 6]
9:A4D8  9ace1723a2           lcall 0xa223, 0x17ce  ; operator_delete@s1:17CE
loc_A4DD:
9:A4DD  8b4606               mov ax, word ptr [bp + 6]
9:A4E0  8b5608               mov dx, word ptr [bp + 8]
9:A4E3  c9                   leave
9:A4E4  ca0600               retf 6
9:A4E7  db 90 c2 a4 f2 a4 10 3a 14 a2 30 b2 f6 a4 16 b3 fa
9:A4F7  db a4 cc a2 fe a4 26 b7 02 a5 56 7f 06 a5 b2 7b 0a
9:A507  db a5 1c 7f 12 a5 48 88 4a a5 86 7f 16 a5 0c 80 1a
9:A517  db a5 54 80 1e a5 72 b3 22 a5 58 81 26 a5 b6 81 2a
9:A527  db a5 fe 81 32 a5 ea 60 3e a5 4a 82 36 a5 66 82 3a
9:A537  db a5 de 78 46 a5 ee 60 42 a5 f4 60 4e a5 c8 b4 52
9:A547  db a5 42 88 62 a5 fe 60 82 8f 7e 80 56 a5 3c b4 5a
9:A557  db a5 d0 a3 5e a5 7c b1 a3 a2 4c 88 62 8f

; ---------------- SmallRecord::init@s9:A564 FAR size=30 callers=0
;   zeroes 10 bytes
9:A564  55                   push bp
9:A565  8bec                 mov bp, sp
9:A567  c45e06               les bx, ptr [bp + 6]
9:A56A  662bc0               sub eax, eax
9:A56D  66268907             mov dword ptr es:[bx], eax
9:A571  26894704             mov word ptr es:[bx + 4], ax
9:A575  6626894706           mov dword ptr es:[bx + 6], eax
9:A57A  8bc3                 mov ax, bx
9:A57C  8cc2                 mov dx, es
9:A57E  c9                   leave
9:A57F  ca0400               retf 4

; ---------------- deletePtrField2@s9:A582 size=22 callers=0
;   deletes the pointer at +0
9:A582  c8080000             enter 8, 0
9:A586  c45e06               les bx, ptr [bp + 6]
9:A589  66268b0f             mov ecx, dword ptr es:[bx]
9:A58D  6651                 push ecx
9:A58F  9ace17dba4           lcall 0xa4db, 0x17ce  ; operator_delete@s1:17CE
9:A594  c9                   leave
9:A595  ca0400               retf 4

; ---------------- ReportRow::ReportRow@s9:A598 FAR size=56 callers=9
;   one row of a report (zeroed)
9:A598  55                   push bp
9:A599  8bec                 mov bp, sp
9:A59B  c45e06               les bx, ptr [bp + 6]
9:A59E  662bc0               sub eax, eax
9:A5A1  268907               mov word ptr es:[bx], ax
9:A5A4  6626894702           mov dword ptr es:[bx + 2], eax
9:A5A9  6626894706           mov dword ptr es:[bx + 6], eax
9:A5AE  2689470a             mov word ptr es:[bx + 0xa], ax
9:A5B2  662689470c           mov dword ptr es:[bx + 0xc], eax
9:A5B7  26894710             mov word ptr es:[bx + 0x10], ax
9:A5BB  26894712             mov word ptr es:[bx + 0x12], ax
9:A5BF  26894714             mov word ptr es:[bx + 0x14], ax
9:A5C3  26894716             mov word ptr es:[bx + 0x16], ax
9:A5C7  8bc3                 mov ax, bx
9:A5C9  8cc2                 mov dx, es
9:A5CB  c9                   leave
9:A5CC  ca0400               retf 4
9:A5CF  db 00

; ---------------- ReportRow::free@s9:A5D0 FAR size=86 callers=8
;   frees its strings
9:A5D0  c8200000             enter 0x20, 0
9:A5D4  c45e06               les bx, ptr [bp + 6]
9:A5D7  268b4702             mov ax, word ptr es:[bx + 2]
9:A5DB  268b5704             mov dx, word ptr es:[bx + 4]
9:A5DF  8bda                 mov bx, dx
9:A5E1  8946fc               mov word ptr [bp - 4], ax
9:A5E4  8956fe               mov word ptr [bp - 2], dx
9:A5E7  0bd8                 or bx, ax
9:A5E9  7427                 je 0xa612
9:A5EB  52                   push dx
9:A5EC  50                   push ax
9:A5ED  6a0a                 push 0xa
9:A5EF  c45efc               les bx, ptr [bp - 4]
9:A5F2  26ff77fe             push word ptr es:[bx - 2]
9:A5F6  68eaa4               push 0xa4ea  ; SEGMENT s9:0000
9:A5F9  6882a5               push 0xa582
9:A5FC  9ae8540da6           lcall 0xa60d, 0x54e8  ; _fstrlwr?@s1:54E8
9:A601  668b46fc             mov eax, dword ptr [bp - 4]
9:A605  2d0200               sub ax, 2
9:A608  6650                 push eax
9:A60A  9ace171fa6           lcall 0xa61f, 0x17ce  ; operator_delete@s1:17CE
9:A60F  83c404               add sp, 4
loc_A612:
9:A612  c45e06               les bx, ptr [bp + 6]
9:A615  66268b4f0c           mov ecx, dword ptr es:[bx + 0xc]
9:A61A  6651                 push ecx
9:A61C  9ace1792a5           lcall 0xa592, 0x17ce  ; operator_delete@s1:17CE
9:A621  c9                   leave
9:A622  ca0400               retf 4
9:A625  db 00

; ---------------- ReportRow::setText@s9:A626 FAR size=26 callers=12
;   copies a text
9:A626  55                   push bp
9:A627  8bec                 mov bp, sp
9:A629  66ff760a             push dword ptr [bp + 0xa]
9:A62D  9ae860eea4           lcall 0xa4ee, 0x60e8  ; _strdup@s2:60E8
9:A632  c45e06               les bx, ptr [bp + 6]
9:A635  268907               mov word ptr es:[bx], ax
9:A638  26895702             mov word ptr es:[bx + 2], dx
9:A63C  c9                   leave
9:A63D  ca0800               retf 8

; ---------------- RoboCmdDlg::RoboCmdDlg@s9:A640 FAR size=62 callers=1
;   dialog 497 "Robot Command" (vtable AC08)
9:A640  55                   push bp
9:A641  8bec                 mov bp, sp
9:A643  ff760e               push word ptr [bp + 0xe]
9:A646  68f101               push 0x1f1
9:A649  66ff7606             push dword ptr [bp + 6]
9:A64D  90                   nop
9:A64E  0e                   push cs
9:A64F  e8300a               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:A652  668b460a             mov eax, dword ptr [bp + 0xa]
9:A656  c45e06               les bx, ptr [bp + 6]
9:A659  662689879400         mov dword ptr es:[bx + 0x94], eax
9:A65F  33c0                 xor ax, ax
9:A661  2689879800           mov word ptr es:[bx + 0x98], ax
9:A666  268987ea00           mov word ptr es:[bx + 0xea], ax
9:A66B  26c70708ac           mov word ptr es:[bx], 0xac08
9:A670  26c74702f7a5         mov word ptr es:[bx + 2], 0xa5f7  ; SEGMENT s9:0000
9:A676  8bc3                 mov ax, bx
9:A678  8cc2                 mov dx, es
9:A67A  c9                   leave
9:A67B  ca0a00               retf 0xa

; ---------------- RoboCmdDlg::onCtlColor@s9:A67E size=262 callers=0
;   apis: GDI.CreateSolidBrush, GDI.SetBkColor, GDI.SetTextColor
;   (vslot 13)
9:A67E  c8100000             enter 0x10, 0
9:A682  56                   push si
9:A683  c45e06               les bx, ptr [bp + 6]
9:A686  2683bf8e0000         cmp word ptr es:[bx + 0x8e], 0
9:A68C  7510                 jne 0xa69e
9:A68E  666a00               push 0
9:A691  9a1e830000           lcall 0, 0x831e  ; GDI.CreateSolidBrush
9:A696  c45e06               les bx, ptr [bp + 6]
9:A699  2689878e00           mov word ptr es:[bx + 0x8e], ax
loc_A69E:
9:A69E  66833ee85e00         cmp dword ptr [0x5ee8], 0
9:A6A4  754f                 jne 0xa6f5
9:A6A6  c41e3042             les bx, ptr [0x4230]
9:A6AA  66268b470e           mov eax, dword ptr es:[bx + 0xe]
9:A6AF  6650                 push eax
9:A6B1  9a724d30a6           lcall 0xa630, 0x4d72  ; MemBlock::data@s2:4D72
9:A6B6  8946f8               mov word ptr [bp - 8], ax
9:A6B9  8956fa               mov word ptr [bp - 6], dx
9:A6BC  c45ef8               les bx, ptr [bp - 8]
9:A6BF  2ac0                 sub al, al
9:A6C1  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:A6C6  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:A6CB  2aed                 sub ch, ch
9:A6CD  0bc1                 or ax, cx
9:A6CF  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:A6D4  a3e85e               mov word ptr [0x5ee8], ax
9:A6D7  890eea5e             mov word ptr [0x5eea], cx
9:A6DB  268aa7e503           mov ah, byte ptr es:[bx + 0x3e5]
9:A6E0  2ac0                 sub al, al
9:A6E2  268a8fe603           mov cl, byte ptr es:[bx + 0x3e6]
9:A6E7  0bc1                 or ax, cx
9:A6E9  268a8fe403           mov cl, byte ptr es:[bx + 0x3e4]
9:A6EE  a3ec5e               mov word ptr [0x5eec], ax
9:A6F1  890eee5e             mov word ptr [0x5eee], cx
loc_A6F5:
9:A6F5  8b460c               mov ax, word ptr [bp + 0xc]
9:A6F8  2d0500               sub ax, 5
9:A6FB  760b                 jbe 0xa708
9:A6FD  48                   dec ax
9:A6FE  7426                 je 0xa726
9:A700  33c0                 xor ax, ax
9:A702  99                   cdq
9:A703  5e                   pop si
9:A704  c9                   leave
9:A705  ca0a00               retf 0xa
loc_A708:
9:A708  ff760e               push word ptr [bp + 0xe]
9:A70B  66ff36e85e           push dword ptr [0x5ee8]
loc_A710:
9:A710  9a3e9c0000           lcall 0, 0x9c3e  ; GDI.SetTextColor
9:A715  ff760e               push word ptr [bp + 0xe]
9:A718  666800000001         push 0x1000000
9:A71E  9a529c0000           lcall 0, 0x9c52  ; GDI.SetBkColor
9:A723  eb4f                 jmp 0xa774
9:A725  db 90
loc_A726:
9:A726  33c0                 xor ax, ax
9:A728  8946f0               mov word ptr [bp - 0x10], ax
9:A72B  8946f4               mov word ptr [bp - 0xc], ax
9:A72E  eb03                 jmp 0xa733
loc_A730:
9:A730  ff46f4               inc word ptr [bp - 0xc]
loc_A733:
9:A733  8b46f4               mov ax, word ptr [bp - 0xc]
9:A736  c45e06               les bx, ptr [bp + 6]
9:A739  263987ea00           cmp word ptr es:[bx + 0xea], ax
9:A73E  7e15                 jle 0xa755
9:A740  8bf0                 mov si, ax
9:A742  03f0                 add si, ax
9:A744  81c39a00             add bx, 0x9a
9:A748  8b460a               mov ax, word ptr [bp + 0xa]
9:A74B  263900               cmp word ptr es:[bx + si], ax
9:A74E  75e0                 jne 0xa730
9:A750  c746f00100           mov word ptr [bp - 0x10], 1
loc_A755:
9:A755  ff760e               push word ptr [bp + 0xe]
9:A758  837ef000             cmp word ptr [bp - 0x10], 0
9:A75C  740a                 je 0xa768
9:A75E  a1ec5e               mov ax, word ptr [0x5eec]
9:A761  8b16ee5e             mov dx, word ptr [0x5eee]
9:A765  eb08                 jmp 0xa76f
9:A767  db 90
loc_A768:
9:A768  a1e85e               mov ax, word ptr [0x5ee8]
9:A76B  8b16ea5e             mov dx, word ptr [0x5eea]
loc_A76F:
9:A76F  52                   push dx
9:A770  50                   push ax
9:A771  eb9d                 jmp 0xa710
9:A773  db 90
loc_A774:
9:A774  c45e06               les bx, ptr [bp + 6]
9:A777  8cda                 mov dx, ds
9:A779  268b878e00           mov ax, word ptr es:[bx + 0x8e]
9:A77E  5e                   pop si
9:A77F  c9                   leave
9:A780  ca0a00               retf 0xa
9:A783  db 00

; ---------------- RoboCmdDlg::onCommand@s9:A784 FAR size=198 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.PostMessage, USER.SetWindowPos
;   (vslot 4)
9:A784  c8080000             enter 8, 0
9:A788  8b460e               mov ax, word ptr [bp + 0xe]
9:A78B  2deb00               sub ax, 0xeb
9:A78E  0f84aa00             je 0xa83c
9:A792  2d0901               sub ax, 0x109
9:A795  7465                 je 0xa7fc
9:A797  2d0300               sub ax, 3
9:A79A  746c                 je 0xa808
9:A79C  2de115               sub ax, 0x15e1
9:A79F  7415                 je 0xa7b6
9:A7A1  66ff760c             push dword ptr [bp + 0xc]
9:A7A5  66ff7608             push dword ptr [bp + 8]
9:A7A9  ff7606               push word ptr [bp + 6]
9:A7AC  90                   nop
9:A7AD  0e                   push cs
9:A7AE  e8990d               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:A7B1  c9                   leave
9:A7B2  ca0a00               retf 0xa
9:A7B5  db 90
loc_A7B6:
9:A7B6  c45e06               les bx, ptr [bp + 6]
9:A7B9  26ff7706             push word ptr es:[bx + 6]
9:A7BD  666a00               push 0
9:A7C0  666837020000         push 0x237
9:A7C6  66680600ed00         push 0xed0006
9:A7CC  9add8e0000           lcall 0, 0x8edd  ; USER.SetWindowPos
9:A7D1  c45e06               les bx, ptr [bp + 6]
9:A7D4  26ff7706             push word ptr es:[bx + 6]
9:A7D8  68d817               push 0x17d8
9:A7DB  9af8a30000           lcall 0, 0xa3f8  ; USER.GetDlgItem
9:A7E0  50                   push ax
9:A7E1  6a00                 push 0
9:A7E3  9a49920000           lcall 0, 0x9249  ; USER.EnableWindow
9:A7E8  c45e06               les bx, ptr [bp + 6]
9:A7EB  26c78798000100       mov word ptr es:[bx + 0x98], 1
9:A7F2  06                   push es
9:A7F3  53                   push bx
loc_A7F4:
9:A7F4  90                   nop
9:A7F5  0e                   push cs
9:A7F6  e85101               call 0xa94a  ; RoboCmdDlg::fill@s9:A94A
9:A7F9  eb47                 jmp 0xa842
9:A7FB  db 90
loc_A7FC:
9:A7FC  66ff7606             push dword ptr [bp + 6]
9:A800  90                   nop
9:A801  0e                   push cs
9:A802  e85500               call 0xa85a  ; RoboCmdDlg::message@s9:A85A
9:A805  eb3b                 jmp 0xa842
9:A807  db 90
loc_A808:
9:A808  c45e06               les bx, ptr [bp + 6]
9:A80B  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:A811  66a3f05e             mov dword ptr [0x5ef0], eax
9:A815  6a23                 push 0x23
9:A817  26ff7708             push word ptr es:[bx + 8]
9:A81B  66ff367c5b           push dword ptr [0x5b7c]
9:A820  9a40af0ea5           lcall 0xa50e, 0xaf40  ; DialogCtr::open@s8:AF40
9:A825  c45e06               les bx, ptr [bp + 6]
9:A828  26ff7706             push word ptr es:[bx + 6]
9:A82C  666802001101         push 0x1110002
9:A832  666a00               push 0
9:A835  9a099f0000           lcall 0, 0x9f09  ; USER.PostMessage
9:A83A  eb06                 jmp 0xa842
loc_A83C:
9:A83C  66ff7606             push dword ptr [bp + 6]
9:A840  ebb2                 jmp 0xa7f4
loc_A842:
9:A842  b80100               mov ax, 1
9:A845  99                   cdq
9:A846  c9                   leave
9:A847  ca0a00               retf 0xa

; ---------------- RoboCmdDlg::refresh@s9:A84A FAR size=16 callers=0
;   (vslot 20)
9:A84A  55                   push bp
9:A84B  8bec                 mov bp, sp
9:A84D  66ff7606             push dword ptr [bp + 6]
9:A851  90                   nop
9:A852  0e                   push cs
9:A853  e8f400               call 0xa94a  ; RoboCmdDlg::fill@s9:A94A
9:A856  c9                   leave
9:A857  ca0400               retf 4

; ---------------- RoboCmdDlg::message@s9:A85A FAR size=240 callers=1
;   apis: USER.MessageBox
;   a message box
9:A85A  c8100200             enter 0x210, 0
9:A85E  680010               push 0x1000
9:A861  9a9c17c0a8           lcall 0xa8c0, 0x179c  ; operator_new@s1:179C
9:A866  83c402               add sp, 2
9:A869  8986f8fd             mov word ptr [bp - 0x208], ax
9:A86D  8996fafd             mov word ptr [bp - 0x206], dx
9:A871  687b05               push 0x57b
9:A874  8d86fcfd             lea ax, [bp - 0x204]
9:A878  16                   push ss
9:A879  50                   push ax
9:A87A  680001               push 0x100
9:A87D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:A882  9ae0849aa8           lcall 0xa89a, 0x84e0  ; LoadStringTo@s3:84E0
9:A887  68ef07               push 0x7ef
9:A88A  66ffb6f8fd           push dword ptr [bp - 0x208]
9:A88F  68ff03               push 0x3ff
9:A892  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:A897  9ae084b0a8           lcall 0xa8b0, 0x84e0  ; LoadStringTo@s3:84E0
9:A89C  68f007               push 0x7f0
9:A89F  8d86fefe             lea ax, [bp - 0x102]
9:A8A3  16                   push ss
9:A8A4  50                   push ax
9:A8A5  68ff03               push 0x3ff
9:A8A8  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:A8AD  9ae084d9a8           lcall 0xa8d9, 0x84e0  ; LoadStringTo@s3:84E0
9:A8B2  8d86fefe             lea ax, [bp - 0x102]
9:A8B6  16                   push ss
9:A8B7  50                   push ax
9:A8B8  66ffb6f8fd           push dword ptr [bp - 0x208]
9:A8BD  9aea3ce9a8           lcall 0xa8e9, 0x3cea  ; _fstrcat@s1:3CEA
9:A8C2  83c408               add sp, 8
9:A8C5  68f107               push 0x7f1
9:A8C8  8d86fefe             lea ax, [bp - 0x102]
9:A8CC  16                   push ss
9:A8CD  50                   push ax
9:A8CE  68ff03               push 0x3ff
9:A8D1  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:A8D6  9ae08402a9           lcall 0xa902, 0x84e0  ; LoadStringTo@s3:84E0
9:A8DB  8d86fefe             lea ax, [bp - 0x102]
9:A8DF  16                   push ss
9:A8E0  50                   push ax
9:A8E1  66ffb6f8fd           push dword ptr [bp - 0x208]
9:A8E6  9aea3c12a9           lcall 0xa912, 0x3cea  ; _fstrcat@s1:3CEA
9:A8EB  83c408               add sp, 8
9:A8EE  68f207               push 0x7f2
9:A8F1  8d86fefe             lea ax, [bp - 0x102]
9:A8F5  16                   push ss
9:A8F6  50                   push ax
9:A8F7  68ff03               push 0x3ff
9:A8FA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:A8FF  9ae08448a3           lcall 0xa348, 0x84e0  ; LoadStringTo@s3:84E0
9:A904  8d86fefe             lea ax, [bp - 0x102]
9:A908  16                   push ss
9:A909  50                   push ax
9:A90A  66ffb6f8fd           push dword ptr [bp - 0x208]
9:A90F  9aea3c44a9           lcall 0xa944, 0x3cea  ; _fstrcat@s1:3CEA
9:A914  83c408               add sp, 8
9:A917  c45e06               les bx, ptr [bp + 6]
9:A91A  26ff7706             push word ptr es:[bx + 6]
9:A91E  66ffb6f8fd           push dword ptr [bp - 0x208]
9:A923  8d86fcfd             lea ax, [bp - 0x204]
9:A927  16                   push ss
9:A928  50                   push ax
9:A929  6a00                 push 0
9:A92B  9a9c650000           lcall 0, 0x659c  ; USER.MessageBox
9:A930  668b86f8fd           mov eax, dword ptr [bp - 0x208]
9:A935  668986f4fd           mov dword ptr [bp - 0x20c], eax
9:A93A  668986f0fd           mov dword ptr [bp - 0x210], eax
9:A93F  6650                 push eax
9:A941  9ace17ffa5           lcall 0xa5ff, 0x17ce  ; operator_delete@s1:17CE
9:A946  c9                   leave
9:A947  ca0400               retf 4

; ---------------- RoboCmdDlg::fill@s9:A94A FAR size=664 callers=2
;   apis: USER.GetDlgItem, USER.SetDlgItemInt, USER.SetDlgItemText
;   the robots and their jobs
9:A94A  c8260100             enter 0x126, 0
9:A94E  57                   push di
9:A94F  56                   push si
9:A950  6a03                 push 3
9:A952  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:A957  9aba207ba9           lcall 0xa97b, 0x20ba  ; Registry_get@s3:20BA
9:A95C  8986fcfe             mov word ptr [bp - 0x104], ax
9:A960  8996fefe             mov word ptr [bp - 0x102], dx
9:A964  c45e06               les bx, ptr [bp + 6]
9:A967  6626ffb79400         push dword ptr es:[bx + 0x94]
9:A96D  8d8600ff             lea ax, [bp - 0x100]
9:A971  16                   push ss
9:A972  50                   push ax
9:A973  66ffb6fcfe           push dword ptr [bp - 0x104]
9:A978  9ac2c3a9a9           lcall 0xa9a9, 0xc3c2  ; objectLabel@s3:C3C2
9:A97D  c45e06               les bx, ptr [bp + 6]
9:A980  26ff7706             push word ptr es:[bx + 6]
9:A984  68f201               push 0x1f2
9:A987  8d8600ff             lea ax, [bp - 0x100]
9:A98B  16                   push ss
9:A98C  50                   push ax
9:A98D  9abca90000           lcall 0, 0xa9bc  ; USER.SetDlgItemText
9:A992  c45e06               les bx, ptr [bp + 6]
9:A995  6626ffb79400         push dword ptr es:[bx + 0x94]
9:A99B  8d8600ff             lea ax, [bp - 0x100]
9:A99F  16                   push ss
9:A9A0  50                   push ax
9:A9A1  66ffb6fcfe           push dword ptr [bp - 0x104]
9:A9A6  9a20c3d7a9           lcall 0xa9d7, 0xc320  ; resourceAmountText@s3:C320
9:A9AB  c45e06               les bx, ptr [bp + 6]
9:A9AE  26ff7706             push word ptr es:[bx + 6]
9:A9B2  687417               push 0x1774
9:A9B5  8d8600ff             lea ax, [bp - 0x100]
9:A9B9  16                   push ss
9:A9BA  50                   push ax
9:A9BB  9aeaa90000           lcall 0, 0xa9ea  ; USER.SetDlgItemText
9:A9C0  c45e06               les bx, ptr [bp + 6]
9:A9C3  6626ffb79400         push dword ptr es:[bx + 0x94]
9:A9C9  8d8600ff             lea ax, [bp - 0x100]
9:A9CD  16                   push ss
9:A9CE  50                   push ax
9:A9CF  66ffb6fcfe           push dword ptr [bp - 0x104]
9:A9D4  9a46c451aa           lcall 0xaa51, 0xc446  ; listText@s3:C446
9:A9D9  c45e06               les bx, ptr [bp + 6]
9:A9DC  26ff7706             push word ptr es:[bx + 6]
9:A9E0  687317               push 0x1773
9:A9E3  8d8600ff             lea ax, [bp - 0x100]
9:A9E7  16                   push ss
9:A9E8  50                   push ax
9:A9E9  9ae6aa0000           lcall 0, 0xaae6  ; USER.SetDlgItemText
9:A9EE  c45e06               les bx, ptr [bp + 6]
9:A9F1  6626ffb79400         push dword ptr es:[bx + 0x94]
9:A9F7  9adc6d1eaa           lcall 0xaa1e, 0x6ddc  ; Tile::roboCmdBusy@s7:6DDC
9:A9FC  8986fafe             mov word ptr [bp - 0x106], ax
9:AA00  c45e06               les bx, ptr [bp + 6]
9:AA03  26ff7706             push word ptr es:[bx + 6]
9:AA07  68f501               push 0x1f5
9:AA0A  50                   push ax
9:AA0B  6a00                 push 0
9:AA0D  9a32aa0000           lcall 0, 0xaa32  ; USER.SetDlgItemInt
9:AA12  c45e06               les bx, ptr [bp + 6]
9:AA15  6626ffb79400         push dword ptr es:[bx + 0x94]
9:AA1B  9a146e345d           lcall 0x5d34, 0x6e14  ; Tile::roboCmdIdle@s7:6E14
9:AA20  8986fafe             mov word ptr [bp - 0x106], ax
9:AA24  c45e06               les bx, ptr [bp + 6]
9:AA27  26ff7706             push word ptr es:[bx + 6]
9:AA2B  68f601               push 0x1f6
9:AA2E  50                   push ax
9:AA2F  6a00                 push 0
9:AA31  9affaa0000           lcall 0, 0xaaff  ; USER.SetDlgItemInt
9:AA36  c45e06               les bx, ptr [bp + 6]
9:AA39  2683bf980000         cmp word ptr es:[bx + 0x98], 0
9:AA3F  0f849901             je 0xabdc
9:AA43  6626ffb79400         push dword ptr es:[bx + 0x94]
9:AA49  66ffb6fcfe           push dword ptr [bp - 0x104]
9:AA4E  9a5edd85a8           lcall 0xa885, 0xdd5e  ; ReportPage::nameCell@s3:DD5E
9:AA53  8986f6fe             mov word ptr [bp - 0x10a], ax
9:AA57  8996f8fe             mov word ptr [bp - 0x108], dx
9:AA5B  0bd0                 or dx, ax
9:AA5D  0f847b01             je 0xabdc
9:AA61  c786f4fe0000         mov word ptr [bp - 0x10c], 0
9:AA67  c45e06               les bx, ptr [bp + 6]
9:AA6A  26c49f9400           les bx, ptr es:[bx + 0x94]
9:AA6F  66268b4726           mov eax, dword ptr es:[bx + 0x26]
9:AA74  268b5728             mov dx, word ptr es:[bx + 0x28]
9:AA78  668986f0fe           mov dword ptr [bp - 0x110], eax
9:AA7D  c786eefe9817         mov word ptr [bp - 0x112], 0x1798
9:AA83  c786ecfec317         mov word ptr [bp - 0x114], 0x17c3
9:AA89  c45e06               les bx, ptr [bp + 6]
9:AA8C  26c787ea000000       mov word ptr es:[bx + 0xea], 0
9:AA93  c786e2fe0100         mov word ptr [bp - 0x11e], 1
9:AA99  e91d01               jmp 0xabb9
loc_AA9C:
9:AA9C  33c0                 xor ax, ax
9:AA9E  99                   cdq
loc_AA9F:
9:AA9F  8986e4fe             mov word ptr [bp - 0x11c], ax
9:AAA3  8996e6fe             mov word ptr [bp - 0x11a], dx
9:AAA7  66c786e8fe00000000   mov dword ptr [bp - 0x118], 0
9:AAB0  8b9ee2fe             mov bx, word ptr [bp - 0x11e]
9:AAB4  c1e302               shl bx, 2
9:AAB7  c4b6f6fe             les si, ptr [bp - 0x10a]
9:AABB  6626833800           cmp dword ptr es:[bx + si], 0
9:AAC0  744a                 je 0xab0c
9:AAC2  ffb6e2fe             push word ptr [bp - 0x11e]
9:AAC6  8bfb                 mov di, bx
9:AAC8  9ad8c026ab           lcall 0xab26, 0xc0d8  ; ResourceName@s5:C0D8
9:AACD  83c402               add sp, 2
9:AAD0  8986dafe             mov word ptr [bp - 0x126], ax
9:AAD4  8996dcfe             mov word ptr [bp - 0x124], dx
9:AAD8  c45e06               les bx, ptr [bp + 6]
9:AADB  26ff7706             push word ptr es:[bx + 6]
9:AADF  ffb6eefe             push word ptr [bp - 0x112]
9:AAE3  52                   push dx
9:AAE4  50                   push ax
9:AAE5  9a41ab0000           lcall 0, 0xab41  ; USER.SetDlgItemText
9:AAEA  c45e06               les bx, ptr [bp + 6]
9:AAED  26ff7706             push word ptr es:[bx + 6]
9:AAF1  ffb6ecfe             push word ptr [bp - 0x114]
9:AAF5  c49ef6fe             les bx, ptr [bp - 0x10a]
9:AAF9  26ff31               push word ptr es:[bx + di]
9:AAFC  6a00                 push 0
9:AAFE  9a57ab0000           lcall 0, 0xab57  ; USER.SetDlgItemInt
9:AB03  66c786e8fe01000100   mov dword ptr [bp - 0x118], 0x10001
loc_AB0C:
9:AB0C  8b86e6fe             mov ax, word ptr [bp - 0x11a]
9:AB10  0b86e4fe             or ax, word ptr [bp - 0x11c]
9:AB14  0f848e00             je 0xaba6
9:AB18  83bee8fe00           cmp word ptr [bp - 0x118], 0
9:AB1D  7526                 jne 0xab45
9:AB1F  ffb6e2fe             push word ptr [bp - 0x11e]
9:AB23  9ad8c0d6ab           lcall 0xabd6, 0xc0d8  ; ResourceName@s5:C0D8
9:AB28  83c402               add sp, 2
9:AB2B  8986dafe             mov word ptr [bp - 0x126], ax
9:AB2F  8996dcfe             mov word ptr [bp - 0x124], dx
9:AB33  c45e06               les bx, ptr [bp + 6]
9:AB36  26ff7706             push word ptr es:[bx + 6]
9:AB3A  ffb6eefe             push word ptr [bp - 0x112]
9:AB3E  52                   push dx
9:AB3F  50                   push ax
9:AB40  9af83b0000           lcall 0, 0x3bf8  ; USER.SetDlgItemText
loc_AB45:
9:AB45  c45e06               les bx, ptr [bp + 6]
9:AB48  26ff7706             push word ptr es:[bx + 6]
9:AB4C  ffb6ecfe             push word ptr [bp - 0x114]
9:AB50  ffb6e4fe             push word ptr [bp - 0x11c]
9:AB54  6a00                 push 0
9:AB56  9a7b3e0000           lcall 0, 0x3e7b  ; USER.SetDlgItemInt
9:AB5B  c45e06               les bx, ptr [bp + 6]
9:AB5E  268bb7ea00           mov si, word ptr es:[bx + 0xea]
9:AB63  03f6                 add si, si
9:AB65  26ff7706             push word ptr es:[bx + 6]
9:AB69  ffb6eefe             push word ptr [bp - 0x112]
9:AB6D  9a8fab0000           lcall 0, 0xab8f  ; USER.GetDlgItem
9:AB72  c45e06               les bx, ptr [bp + 6]
9:AB75  2689809a00           mov word ptr es:[bx + si + 0x9a], ax
9:AB7A  26ff87ea00           inc word ptr es:[bx + 0xea]
9:AB7F  268bb7ea00           mov si, word ptr es:[bx + 0xea]
9:AB84  03f6                 add si, si
9:AB86  26ff7706             push word ptr es:[bx + 6]
9:AB8A  ffb6ecfe             push word ptr [bp - 0x114]
9:AB8E  9adca70000           lcall 0, 0xa7dc  ; USER.GetDlgItem
9:AB93  c45e06               les bx, ptr [bp + 6]
9:AB96  2689809a00           mov word ptr es:[bx + si + 0x9a], ax
9:AB9B  26ff87ea00           inc word ptr es:[bx + 0xea]
9:ABA0  c786eafe0100         mov word ptr [bp - 0x116], 1
loc_ABA6:
9:ABA6  83beeafe00           cmp word ptr [bp - 0x116], 0
9:ABAB  7408                 je 0xabb5
9:ABAD  ff86eefe             inc word ptr [bp - 0x112]
9:ABB1  ff86ecfe             inc word ptr [bp - 0x114]
loc_ABB5:
9:ABB5  ff86e2fe             inc word ptr [bp - 0x11e]
loc_ABB9:
9:ABB9  83bee2fe25           cmp word ptr [bp - 0x11e], 0x25
9:ABBE  7d1c                 jge 0xabdc
9:ABC0  6683bef0fe00         cmp dword ptr [bp - 0x110], 0
9:ABC6  0f84d2fe             je 0xaa9c
9:ABCA  ffb6e2fe             push word ptr [bp - 0x11e]
9:ABCE  66ffb6f0fe           push dword ptr [bp - 0x110]
9:ABD3  9ae6baffff           lcall 0xffff, 0xbae6  ; SparseTable::get@s5:BAE6
9:ABD8  e9c4fe               jmp 0xaa9f
9:ABDB  db 90
loc_ABDC:
9:ABDC  5e                   pop si
9:ABDD  5f                   pop di
9:ABDE  c9                   leave
9:ABDF  ca0400               retf 4

; ---------------- RoboCmdDlg::scalar_dtor@s9:ABE2 size=162 callers=0
;   deleting destructor
9:ABE2  c8040000             enter 4, 0
9:ABE6  66ff7606             push dword ptr [bp + 6]
9:ABEA  90                   nop
9:ABEB  0e                   push cs
9:ABEC  e80905               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:ABEF  f6460a01             test byte ptr [bp + 0xa], 1
9:ABF3  7409                 je 0xabfe
9:ABF5  66ff7606             push dword ptr [bp + 6]
9:ABF9  9ace1764a8           lcall 0xa864, 0x17ce  ; operator_delete@s1:17CE
loc_ABFE:
9:ABFE  8b4606               mov ax, word ptr [bp + 6]
9:AC01  8b5608               mov dx, word ptr [bp + 8]
9:AC04  c9                   leave
9:AC05  ca0600               retf 6
9:AC08  db e2 ab 12 ac 10 3a b4 a6 30 b2 16 ac 16 b3 1a ac
9:AC18  db 84 a7 1e ac 26 b7 22 ac 56 7f 26 ac b2 7b 2a ac
9:AC28  db 1c 7f 32 ac 48 88 6a ac 86 7f 36 ac 0c 80 3a ac
9:AC38  db 54 80 3e ac 7e a6 42 ac 58 81 46 ac b6 81 4a ac
9:AC48  db fe 81 52 ac ea 60 5e ac 4a 82 56 ac 66 82 5a ac
9:AC58  db 4a a8 66 ac ee 60 62 ac f4 60 6e ac c8 b4 72 ac
9:AC68  db 42 88 82 ac fe 60 2e a5 7e 80 76 ac 3c b4 7a ac
9:AC78  db 5e b4 7e ac 7c b1 74 a6 4c 88 23 a8

; ---------------- RoboCmdDetailsDlg::RoboCmdDetailsDlg@s9:AC84 FAR size=100 callers=1
;   dialog 499 "Robot Command Details" (vtable AFC4)
9:AC84  55                   push bp
9:AC85  8bec                 mov bp, sp
9:AC87  ff760a               push word ptr [bp + 0xa]
9:AC8A  68f301               push 0x1f3
9:AC8D  66ff7606             push dword ptr [bp + 6]
9:AC91  90                   nop
9:AC92  0e                   push cs
9:AC93  e8ec03               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:AC96  c45e06               les bx, ptr [bp + 6]
9:AC99  662bc0               sub eax, eax
9:AC9C  662689879400         mov dword ptr es:[bx + 0x94], eax
9:ACA2  662689879800         mov dword ptr es:[bx + 0x98], eax
9:ACA8  26c707c4af           mov word ptr es:[bx], 0xafc4
9:ACAD  26c747020aac         mov word ptr es:[bx + 2], 0xac0a  ; SEGMENT s9:0000
9:ACB3  66a1f05e             mov eax, dword ptr [0x5ef0]
9:ACB7  662689879400         mov dword ptr es:[bx + 0x94], eax
9:ACBD  66c706f05e00000000   mov dword ptr [0x5ef0], 0
9:ACC6  6a3d                 push 0x3d
9:ACC8  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:ACCD  9aba205aa9           lcall 0xa95a, 0x20ba  ; Registry_get@s3:20BA
9:ACD2  c45e06               les bx, ptr [bp + 6]
9:ACD5  2689879800           mov word ptr es:[bx + 0x98], ax
9:ACDA  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:ACDF  8bc3                 mov ax, bx
9:ACE1  8cc2                 mov dx, es
9:ACE3  c9                   leave
9:ACE4  ca0600               retf 6
9:ACE7  db 00

; ---------------- RoboCmdDetailsDlg::~RoboCmdDetailsDlg@s9:ACE8 FAR size=44 callers=1
;   dtor
9:ACE8  55                   push bp
9:ACE9  8bec                 mov bp, sp
9:ACEB  c45e06               les bx, ptr [bp + 6]
9:ACEE  26c707c4af           mov word ptr es:[bx], 0xafc4
9:ACF3  26c74702b1ac         mov word ptr es:[bx + 2], 0xacb1  ; SEGMENT s9:0000
9:ACF9  26ff7706             push word ptr es:[bx + 6]
9:ACFD  66ff367c5b           push dword ptr [0x5b7c]
9:AD02  9ae0b62eac           lcall 0xac2e, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:AD07  66ff7606             push dword ptr [bp + 6]
9:AD0B  90                   nop
9:AD0C  0e                   push cs
9:AD0D  e8e803               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:AD10  c9                   leave
9:AD11  ca0400               retf 4

; ---------------- RoboCmdDetailsDlg::refresh@s9:AD14 FAR size=16 callers=0
;   (vslot 20)
9:AD14  55                   push bp
9:AD15  8bec                 mov bp, sp
9:AD17  66ff7606             push dword ptr [bp + 6]
9:AD1B  90                   nop
9:AD1C  0e                   push cs
9:AD1D  e8e400               call 0xae04  ; RoboCmdDetailsDlg::fill@s9:AE04
9:AD20  c9                   leave
9:AD21  ca0400               retf 4

; ---------------- RoboCmdDetailsDlg::onCommand@s9:AD24 FAR size=66 callers=0
;   (vslot 4)
9:AD24  55                   push bp
9:AD25  8bec                 mov bp, sp
9:AD27  8b460e               mov ax, word ptr [bp + 0xe]
9:AD2A  2deb00               sub ax, 0xeb
9:AD2D  7419                 je 0xad48
9:AD2F  2d0501               sub ax, 0x105
9:AD32  7420                 je 0xad54
9:AD34  66ff760c             push dword ptr [bp + 0xc]
9:AD38  66ff7608             push dword ptr [bp + 8]
9:AD3C  ff7606               push word ptr [bp + 6]
9:AD3F  90                   nop
9:AD40  0e                   push cs
9:AD41  e80608               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:AD44  c9                   leave
9:AD45  ca0a00               retf 0xa
loc_AD48:
9:AD48  66ff7606             push dword ptr [bp + 6]
9:AD4C  90                   nop
9:AD4D  0e                   push cs
9:AD4E  e8b300               call 0xae04  ; RoboCmdDetailsDlg::fill@s9:AE04
9:AD51  eb0a                 jmp 0xad5d
9:AD53  db 90
loc_AD54:
9:AD54  66ff7606             push dword ptr [bp + 6]
9:AD58  90                   nop
9:AD59  0e                   push cs
9:AD5A  e80900               call 0xad66  ; RoboCmdDetailsDlg::message@s9:AD66
loc_AD5D:
9:AD5D  b80100               mov ax, 1
9:AD60  99                   cdq
9:AD61  c9                   leave
9:AD62  ca0a00               retf 0xa
9:AD65  db 00

; ---------------- RoboCmdDetailsDlg::message@s9:AD66 FAR size=158 callers=1
;   apis: USER.MessageBox
;   a message box
9:AD66  c8100200             enter 0x210, 0
9:AD6A  680010               push 0x1000
9:AD6D  9a9c17ccad           lcall 0xadcc, 0x179c  ; operator_new@s1:179C
9:AD72  83c402               add sp, 2
9:AD75  8986f8fd             mov word ptr [bp - 0x208], ax
9:AD79  8996fafd             mov word ptr [bp - 0x206], dx
9:AD7D  687b05               push 0x57b
9:AD80  8d86fcfd             lea ax, [bp - 0x204]
9:AD84  16                   push ss
9:AD85  50                   push ax
9:AD86  680001               push 0x100
9:AD89  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:AD8E  9ae084a6ad           lcall 0xada6, 0x84e0  ; LoadStringTo@s3:84E0
9:AD93  68f307               push 0x7f3
9:AD96  66ffb6f8fd           push dword ptr [bp - 0x208]
9:AD9B  68ff03               push 0x3ff
9:AD9E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:ADA3  9ae084bcad           lcall 0xadbc, 0x84e0  ; LoadStringTo@s3:84E0
9:ADA8  68f407               push 0x7f4
9:ADAB  8d86fefe             lea ax, [bp - 0x102]
9:ADAF  16                   push ss
9:ADB0  50                   push ax
9:ADB1  68ff03               push 0x3ff
9:ADB4  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:ADB9  9ae084d0ac           lcall 0xacd0, 0x84e0  ; LoadStringTo@s3:84E0
9:ADBE  8d86fefe             lea ax, [bp - 0x102]
9:ADC2  16                   push ss
9:ADC3  50                   push ax
9:ADC4  66ffb6f8fd           push dword ptr [bp - 0x208]
9:ADC9  9aea3cfead           lcall 0xadfe, 0x3cea  ; _fstrcat@s1:3CEA
9:ADCE  83c408               add sp, 8
9:ADD1  c45e06               les bx, ptr [bp + 6]
9:ADD4  26ff7706             push word ptr es:[bx + 6]
9:ADD8  66ffb6f8fd           push dword ptr [bp - 0x208]
9:ADDD  8d86fcfd             lea ax, [bp - 0x204]
9:ADE1  16                   push ss
9:ADE2  50                   push ax
9:ADE3  6a00                 push 0
9:ADE5  9a2ca90000           lcall 0, 0xa92c  ; USER.MessageBox
9:ADEA  668b86f8fd           mov eax, dword ptr [bp - 0x208]
9:ADEF  668986f4fd           mov dword ptr [bp - 0x20c], eax
9:ADF4  668986f0fd           mov dword ptr [bp - 0x210], eax
9:ADF9  6650                 push eax
9:ADFB  9ace17fcab           lcall 0xabfc, 0x17ce  ; operator_delete@s1:17CE
9:AE00  c9                   leave
9:AE01  ca0400               retf 4

; ---------------- RoboCmdDetailsDlg::fill@s9:AE04 FAR size=410 callers=2
;   apis: USER.SetDlgItemText, USER._wsprintf
;   the vehicle, its cargo and route
9:AE04  c81e0100             enter 0x11e, 0
9:AE08  57                   push di
9:AE09  56                   push si
9:AE0A  6a03                 push 3
9:AE0C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:AE11  9aba2035ae           lcall 0xae35, 0x20ba  ; Registry_get@s3:20BA
9:AE16  8986fcfe             mov word ptr [bp - 0x104], ax
9:AE1A  8996fefe             mov word ptr [bp - 0x102], dx
9:AE1E  c45e06               les bx, ptr [bp + 6]
9:AE21  6626ffb79400         push dword ptr es:[bx + 0x94]
9:AE27  8d8600ff             lea ax, [bp - 0x100]
9:AE2B  16                   push ss
9:AE2C  50                   push ax
9:AE2D  66ffb6fcfe           push dword ptr [bp - 0x104]
9:AE32  9ac2c33daf           lcall 0xaf3d, 0xc3c2  ; objectLabel@s3:C3C2
9:AE37  c45e06               les bx, ptr [bp + 6]
9:AE3A  26ff7706             push word ptr es:[bx + 6]
9:AE3E  687817               push 0x1778
9:AE41  8d8600ff             lea ax, [bp - 0x100]
9:AE45  16                   push ss
9:AE46  50                   push ax
9:AE47  9aecae0000           lcall 0, 0xaeec  ; USER.SetDlgItemText
9:AE4C  c45e06               les bx, ptr [bp + 6]
9:AE4F  6626ffb79400         push dword ptr es:[bx + 0x94]
9:AE55  9aa87375ae           lcall 0xae75, 0x73a8  ; DbObj::resolveLink16@s7:73A8
9:AE5A  8986f8fe             mov word ptr [bp - 0x108], ax
9:AE5E  8996fafe             mov word ptr [bp - 0x106], dx
9:AE62  052000               add ax, 0x20
9:AE65  8986f4fe             mov word ptr [bp - 0x10c], ax
9:AE69  8996f6fe             mov word ptr [bp - 0x10a], dx
9:AE6D  66ff364857           push dword ptr [0x5748]  ; g_sim
9:AE72  9a2683faa9           lcall 0xa9fa, 0x8326  ; Sim::getTurnNumber@s7:8326
9:AE77  8986f0fe             mov word ptr [bp - 0x110], ax
9:AE7B  8996f2fe             mov word ptr [bp - 0x10e], dx
9:AE7F  6633c0               xor eax, eax
9:AE82  668986ecfe           mov dword ptr [bp - 0x114], eax
9:AE87  8986eafe             mov word ptr [bp - 0x116], ax
9:AE8B  e9d300               jmp 0xaf61
loc_AE8E:
9:AE8E  8b9eeafe             mov bx, word ptr [bp - 0x116]
9:AE92  8bc3                 mov ax, bx
9:AE94  03db                 add bx, bx
9:AE96  03d8                 add bx, ax
9:AE98  c1e302               shl bx, 2
9:AE9B  c4b6f4fe             les si, ptr [bp - 0x10c]
9:AE9F  268b4002             mov ax, word ptr es:[bx + si + 2]
9:AEA3  260b00               or ax, word ptr es:[bx + si]
9:AEA6  0f84b300             je 0xaf5d
9:AEAA  c786eefe0100         mov word ptr [bp - 0x112], 1
9:AEB0  8b9eeafe             mov bx, word ptr [bp - 0x116]
9:AEB4  8bc3                 mov ax, bx
9:AEB6  03db                 add bx, bx
9:AEB8  03d8                 add bx, ax
9:AEBA  c1e302               shl bx, 2
9:AEBD  03de                 add bx, si
9:AEBF  26ff7704             push word ptr es:[bx + 4]
9:AEC3  8bf3                 mov si, bx
9:AEC5  8cc7                 mov di, es
9:AEC7  9a22c2cbaa           lcall 0xaacb, 0xc222  ; productAName@s5:C222
9:AECC  83c402               add sp, 2
9:AECF  8986e2fe             mov word ptr [bp - 0x11e], ax
9:AED3  8996e4fe             mov word ptr [bp - 0x11c], dx
9:AED7  c45e06               les bx, ptr [bp + 6]
9:AEDA  26ff7706             push word ptr es:[bx + 6]
9:AEDE  8b86ecfe             mov ax, word ptr [bp - 0x114]
9:AEE2  05d201               add ax, 0x1d2
9:AEE5  50                   push ax
9:AEE6  52                   push dx
9:AEE7  ffb6e2fe             push word ptr [bp - 0x11e]
9:AEEB  9a25af0000           lcall 0, 0xaf25  ; USER.SetDlgItemText
9:AEF0  8ec7                 mov es, di
9:AEF2  66268b04             mov eax, dword ptr es:[si]
9:AEF6  662b86f0fe           sub eax, dword ptr [bp - 0x110]
9:AEFB  6650                 push eax
9:AEFD  1e                   push ds
9:AEFE  68f45e               push 0x5ef4  ; '%ld'
9:AF01  8d8600ff             lea ax, [bp - 0x100]
9:AF05  16                   push ss
9:AF06  50                   push ax
9:AF07  9a38430000           lcall 0, 0x4338  ; USER._wsprintf
9:AF0C  83c40c               add sp, 0xc
9:AF0F  c45e06               les bx, ptr [bp + 6]
9:AF12  26ff7706             push word ptr es:[bx + 6]
9:AF16  8b86ecfe             mov ax, word ptr [bp - 0x114]
9:AF1A  05dc01               add ax, 0x1dc
9:AF1D  50                   push ax
9:AF1E  8d8600ff             lea ax, [bp - 0x100]
9:AF22  16                   push ss
9:AF23  50                   push ax
9:AF24  9a55af0000           lcall 0, 0xaf55  ; USER.SetDlgItemText
9:AF29  57                   push di
9:AF2A  56                   push si
9:AF2B  8d8600ff             lea ax, [bp - 0x100]
9:AF2F  16                   push ss
9:AF30  50                   push ax
9:AF31  c45e06               les bx, ptr [bp + 6]
9:AF34  6626ffb79800         push dword ptr es:[bx + 0x98]
9:AF3A  9a968c7caf           lcall 0xaf7c, 0x8c96  ; RegObj3D::describe@s3:8C96
9:AF3F  c45e06               les bx, ptr [bp + 6]
9:AF42  26ff7706             push word ptr es:[bx + 6]
9:AF46  8b86ecfe             mov ax, word ptr [bp - 0x114]
9:AF4A  05e601               add ax, 0x1e6
9:AF4D  50                   push ax
9:AF4E  8d8600ff             lea ax, [bp - 0x100]
9:AF52  16                   push ss
9:AF53  50                   push ax
9:AF54  9a93af0000           lcall 0, 0xaf93  ; USER.SetDlgItemText
9:AF59  ff86ecfe             inc word ptr [bp - 0x114]
loc_AF5D:
9:AF5D  ff86eafe             inc word ptr [bp - 0x116]
loc_AF61:
9:AF61  83beeafe0a           cmp word ptr [bp - 0x116], 0xa
9:AF66  0f8c24ff             jl 0xae8e
9:AF6A  83beeefe00           cmp word ptr [bp - 0x112], 0
9:AF6F  7526                 jne 0xaf97
9:AF71  683105               push 0x531
9:AF74  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:AF79  9a7e8491ad           lcall 0xad91, 0x847e  ; LoadStringRes@s3:847E
9:AF7E  8986e2fe             mov word ptr [bp - 0x11e], ax
9:AF82  8996e4fe             mov word ptr [bp - 0x11c], dx
9:AF86  c45e06               les bx, ptr [bp + 6]
9:AF89  26ff7706             push word ptr es:[bx + 6]
9:AF8D  68d201               push 0x1d2
9:AF90  52                   push dx
9:AF91  50                   push ax
9:AF92  9a8ea90000           lcall 0, 0xa98e  ; USER.SetDlgItemText
loc_AF97:
9:AF97  5e                   pop si
9:AF98  5f                   pop di
9:AF99  c9                   leave
9:AF9A  ca0400               retf 4
9:AF9D  db 00

; ---------------- RoboCmdDetailsDlg::scalar_dtor@s9:AF9E FAR size=162 callers=0
;   deleting destructor
9:AF9E  55                   push bp
9:AF9F  8bec                 mov bp, sp
9:AFA1  66ff7606             push dword ptr [bp + 6]
9:AFA5  90                   nop
9:AFA6  0e                   push cs
9:AFA7  e83efd               call 0xace8  ; RoboCmdDetailsDlg::~RoboCmdDetailsDlg@s9:ACE8
9:AFAA  f6460a01             test byte ptr [bp + 0xa], 1
9:AFAE  7409                 je 0xafb9
9:AFB0  66ff7606             push dword ptr [bp + 6]
9:AFB4  9ace1770ad           lcall 0xad70, 0x17ce  ; operator_delete@s1:17CE
loc_AFB9:
9:AFB9  8b4606               mov ax, word ptr [bp + 6]
9:AFBC  8b5608               mov dx, word ptr [bp + 8]
9:AFBF  c9                   leave
9:AFC0  ca0600               retf 6
9:AFC3  db 90 9e af ce af 10 3a 0e ac 30 b2 d2 af 16 b3 d6
9:AFD3  db af 24 ad da af 26 b7 de af 56 7f e2 af b2 7b e6
9:AFE3  db af 1c 7f ee af 48 88 26 b0 86 7f f2 af 0c 80 f6
9:AFF3  db af 54 80 fa af 72 b3 fe af 58 81 02 b0 b6 81 06
9:B003  db b0 fe 81 0e b0 ea 60 1a b0 4a 82 12 b0 66 82 16
9:B013  db b0 14 ad 22 b0 ee 60 1e b0 f4 60 2a b0 c8 b4 2e
9:B023  db b0 42 88 3e b0 fe 60 4e ac 7e 80 32 b0 3c b4 36
9:B033  db b0 5e b4 3a b0 7c b1 f7 ac 4c 88 05 ad

; ---------------- BuildingDlgBase::BuildingDlgBase@s9:B040 FAR size=66 callers=5
;   a building's window base (dialog id from the type's record +0x12; vtable B772)
9:B040  55                   push bp
9:B041  8bec                 mov bp, sp
9:B043  ff760e               push word ptr [bp + 0xe]
9:B046  c45e0a               les bx, ptr [bp + 0xa]
9:B049  26ff7712             push word ptr es:[bx + 0x12]
9:B04D  666a00               push 0
9:B050  6a01                 push 1
9:B052  66ff7606             push dword ptr [bp + 6]
9:B056  90                   nop
9:B057  0e                   push cs
9:B058  e8cdc6               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:B05B  c45e06               les bx, ptr [bp + 6]
9:B05E  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
9:B065  668b460a             mov eax, dword ptr [bp + 0xa]
9:B069  662689879000         mov dword ptr es:[bx + 0x90], eax
9:B06F  26c70772b7           mov word ptr es:[bx], 0xb772
9:B074  26c74702c6af         mov word ptr es:[bx + 2], 0xafc6  ; SEGMENT s9:0000
9:B07A  8bc3                 mov ax, bx
9:B07C  8cc2                 mov dx, es
9:B07E  c9                   leave
9:B07F  ca0a00               retf 0xa

; ---------------- ReportDlgBase::ReportDlgBase@s9:B082 FAR size=58 callers=11
;   a report window base (dialog id)
9:B082  55                   push bp
9:B083  8bec                 mov bp, sp
9:B085  66ff760a             push dword ptr [bp + 0xa]
9:B089  666a00               push 0
9:B08C  6a01                 push 1
9:B08E  66ff7606             push dword ptr [bp + 6]
9:B092  90                   nop
9:B093  0e                   push cs
9:B094  e891c6               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:B097  c45e06               les bx, ptr [bp + 6]
9:B09A  662bc0               sub eax, eax
9:B09D  2689878e00           mov word ptr es:[bx + 0x8e], ax
9:B0A2  662689879000         mov dword ptr es:[bx + 0x90], eax
9:B0A8  26c70772b7           mov word ptr es:[bx], 0xb772
9:B0AD  26c7470278b0         mov word ptr es:[bx + 2], 0xb078  ; SEGMENT s9:0000
9:B0B3  8bc3                 mov ax, bx
9:B0B5  8cc2                 mov dx, es
9:B0B7  c9                   leave
9:B0B8  ca0800               retf 8
9:B0BB  db 00

; ---------------- ObjectDlgBase::ObjectDlgBase@s9:B0BC FAR size=60 callers=5
;   a window about an object (dialog id, object)
9:B0BC  55                   push bp
9:B0BD  8bec                 mov bp, sp
9:B0BF  66ff760e             push dword ptr [bp + 0xe]
9:B0C3  666a00               push 0
9:B0C6  6a01                 push 1
9:B0C8  66ff7606             push dword ptr [bp + 6]
9:B0CC  90                   nop
9:B0CD  0e                   push cs
9:B0CE  e857c6               call 0x7728  ; OPDialog::OPDialog@s9:7728
9:B0D1  c45e06               les bx, ptr [bp + 6]
9:B0D4  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
9:B0DB  668b460a             mov eax, dword ptr [bp + 0xa]
9:B0DF  662689879000         mov dword ptr es:[bx + 0x90], eax
9:B0E5  26c70772b7           mov word ptr es:[bx], 0xb772
9:B0EA  26c74702b1b0         mov word ptr es:[bx + 2], 0xb0b1  ; SEGMENT s9:0000
9:B0F0  8bc3                 mov ax, bx
9:B0F2  8cc2                 mov dx, es
9:B0F4  c9                   leave
9:B0F5  ca0c00               retf 0xc

; ---------------- BuildingDlgBase::~BuildingDlgBase@s9:B0F8 FAR size=132 callers=22
;   apis: GDI.DeleteObject
;   dtor: closes the object's windows
9:B0F8  c8140000             enter 0x14, 0
9:B0FC  c45e06               les bx, ptr [bp + 6]
9:B0FF  26c70772b7           mov word ptr es:[bx], 0xb772
9:B104  26c74702eeb0         mov word ptr es:[bx + 2], 0xb0ee  ; SEGMENT s9:0000
9:B10A  6a32                 push 0x32
9:B10C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B111  9aba2022b1           lcall 0xb122, 0x20ba  ; Registry_get@s3:20BA
9:B116  c45e06               les bx, ptr [bp + 6]
9:B119  26ff7706             push word ptr es:[bx + 6]
9:B11D  52                   push dx
9:B11E  50                   push ax
9:B11F  9a8c7b14ae           lcall 0xae14, 0x7b8c  ; BuildingWindows::closeFor@s3:7B8C
9:B124  c45e06               les bx, ptr [bp + 6]
9:B127  2683bf8e0000         cmp word ptr es:[bx + 0x8e], 0
9:B12D  7414                 je 0xb143
9:B12F  26ffb78e00           push word ptr es:[bx + 0x8e]
9:B134  9ac29c0000           lcall 0, 0x9cc2  ; GDI.DeleteObject
9:B139  c45e06               les bx, ptr [bp + 6]
9:B13C  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
loc_B143:
9:B143  c45e06               les bx, ptr [bp + 6]
9:B146  268b879000           mov ax, word ptr es:[bx + 0x90]
9:B14B  268b979200           mov dx, word ptr es:[bx + 0x92]
9:B150  8bda                 mov bx, dx
9:B152  8946f8               mov word ptr [bp - 8], ax
9:B155  8956fa               mov word ptr [bp - 6], dx
9:B158  0bd8                 or bx, ax
9:B15A  7413                 je 0xb16f
9:B15C  52                   push dx
9:B15D  50                   push ax
9:B15E  90                   nop
9:B15F  0e                   push cs
9:B160  e86df4               call 0xa5d0  ; ReportRow::free@s9:A5D0
9:B163  66ff76f8             push dword ptr [bp - 8]
9:B167  9ace17b7af           lcall 0xafb7, 0x17ce  ; operator_delete@s1:17CE
9:B16C  83c404               add sp, 4
loc_B16F:
9:B16F  66ff7606             push dword ptr [bp + 6]
9:B173  90                   nop
9:B174  0e                   push cs
9:B175  e8b4c6               call 0x782c  ; OPDialog::~OPDialog@s9:782C
9:B178  c9                   leave
9:B179  ca0400               retf 4

; ---------------- BuildingDlgBase::fieldText@s9:B17C FAR size=180 callers=0
;   (vslot 29) a field's text (s3:B038)
9:B17C  c80e0000             enter 0xe, 0
9:B180  57                   push di
9:B181  56                   push si
9:B182  c746fe0000           mov word ptr [bp - 2], 0
9:B187  eb27                 jmp 0xb1b0
9:B189  db 90
loc_B18A:
9:B18A  8bcb                 mov cx, bx
9:B18C  8bd8                 mov bx, ax
9:B18E  03d8                 add bx, ax
9:B190  8cc2                 mov dx, es
9:B192  c4760a               les si, ptr [bp + 0xa]
9:B195  268b38               mov di, word ptr es:[bx + si]
9:B198  8bd8                 mov bx, ax
9:B19A  c1e302               shl bx, 2
9:B19D  03d8                 add bx, ax
9:B19F  03db                 add bx, bx
9:B1A1  8ec2                 mov es, dx
9:B1A3  8bf1                 mov si, cx
9:B1A5  26c47402             les si, ptr es:[si + 2]
9:B1A9  26897804             mov word ptr es:[bx + si + 4], di
9:B1AD  ff46fe               inc word ptr [bp - 2]
loc_B1B0:
9:B1B0  8b46fe               mov ax, word ptr [bp - 2]
9:B1B3  c45e06               les bx, ptr [bp + 6]
9:B1B6  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B1BB  263907               cmp word ptr es:[bx], ax
9:B1BE  7fca                 jg 0xb18a
9:B1C0  6a03                 push 3
9:B1C2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B1C7  9aba2005b2           lcall 0xb205, 0x20ba  ; Registry_get@s3:20BA
9:B1CC  8946fa               mov word ptr [bp - 6], ax
9:B1CF  8956fc               mov word ptr [bp - 4], dx
9:B1D2  c45e06               les bx, ptr [bp + 6]
9:B1D5  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B1DA  66268b4702           mov eax, dword ptr es:[bx + 2]
9:B1DF  668946f6             mov dword ptr [bp - 0xa], eax
9:B1E3  c746fe0000           mov word ptr [bp - 2], 0
9:B1E8  eb2f                 jmp 0xb219
loc_B1EA:
9:B1EA  c45ef6               les bx, ptr [bp - 0xa]
9:B1ED  26ff7704             push word ptr es:[bx + 4]
9:B1F1  c45e06               les bx, ptr [bp + 6]
9:B1F4  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B1F9  6626ff7706           push dword ptr es:[bx + 6]
9:B1FE  66ff76fa             push dword ptr [bp - 6]
9:B202  9a38b014b1           lcall 0xb114, 0xb038  ; BldgText::field@s3:B038
9:B207  52                   push dx
9:B208  50                   push ax
9:B209  66ff76f6             push dword ptr [bp - 0xa]
9:B20D  90                   nop
9:B20E  0e                   push cs
9:B20F  e814f4               call 0xa626  ; ReportRow::setText@s9:A626
9:B212  8346f60a             add word ptr [bp - 0xa], 0xa
9:B216  ff46fe               inc word ptr [bp - 2]
loc_B219:
9:B219  8b46fe               mov ax, word ptr [bp - 2]
9:B21C  c45e06               les bx, ptr [bp + 6]
9:B21F  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B224  263907               cmp word ptr es:[bx], ax
9:B227  7fc1                 jg 0xb1ea
9:B229  5e                   pop si
9:B22A  5f                   pop di
9:B22B  c9                   leave
9:B22C  ca0800               retf 8
9:B22F  db 00

; ---------------- BuildingDlgBase::position@s9:B230 FAR size=230 callers=4
;   apis: USER.GetSystemMetrics, USER.GetWindowRect, USER.SetWindowPos
;   (vslot 2) its place by the building
9:B230  c8300000             enter 0x30, 0
9:B234  66ff7606             push dword ptr [bp + 6]
9:B238  90                   nop
9:B239  0e                   push cs
9:B23A  e8a5c6               call 0x78e2  ; OPDialog::create@s9:78E2
9:B23D  833ef85e05           cmp word ptr [0x5ef8], 5
9:B242  7506                 jne 0xb24a
9:B244  c706f85e0000         mov word ptr [0x5ef8], 0
loc_B24A:
9:B24A  8d46fe               lea ax, [bp - 2]
9:B24D  16                   push ss
9:B24E  50                   push ax
9:B24F  8d46fc               lea ax, [bp - 4]
9:B252  16                   push ss
9:B253  50                   push ax
9:B254  6a48                 push 0x48
9:B256  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B25B  9aba20cab1           lcall 0xb1ca, 0x20ba  ; Registry_get@s3:20BA
9:B260  8946f8               mov word ptr [bp - 8], ax
9:B263  8956fa               mov word ptr [bp - 6], dx
9:B266  050e00               add ax, 0xe
9:B269  52                   push dx
9:B26A  50                   push ax
9:B26B  9a943ecaaf           lcall 0xafca, 0x3e94  ; Pos3::getXY@s2:3E94
9:B270  c45ef8               les bx, ptr [bp - 8]
9:B273  268b470a             mov ax, word ptr es:[bx + 0xa]
9:B277  8946f6               mov word ptr [bp - 0xa], ax
9:B27A  268b470c             mov ax, word ptr es:[bx + 0xc]
9:B27E  8946f4               mov word ptr [bp - 0xc], ax
9:B281  6a04                 push 4
9:B283  9a418d0000           lcall 0, 0x8d41  ; USER.GetSystemMetrics
9:B288  f72ef85e             imul word ptr [0x5ef8]
9:B28C  050a00               add ax, 0xa
9:B28F  8946f2               mov word ptr [bp - 0xe], ax
9:B292  ff06f85e             inc word ptr [0x5ef8]
9:B296  0346fc               add ax, word ptr [bp - 4]
9:B299  8946f0               mov word ptr [bp - 0x10], ax
9:B29C  8b46fe               mov ax, word ptr [bp - 2]
9:B29F  0146f2               add word ptr [bp - 0xe], ax
9:B2A2  c45e06               les bx, ptr [bp + 6]
9:B2A5  26ff7706             push word ptr es:[bx + 6]
9:B2A9  8d46e8               lea ax, [bp - 0x18]
9:B2AC  16                   push ss
9:B2AD  50                   push ax
9:B2AE  9a7d820000           lcall 0, 0x827d  ; USER.GetWindowRect
9:B2B3  8b46ee               mov ax, word ptr [bp - 0x12]
9:B2B6  2b46ea               sub ax, word ptr [bp - 0x16]
9:B2B9  8bc8                 mov cx, ax
9:B2BB  8946e6               mov word ptr [bp - 0x1a], ax
9:B2BE  0346f0               add ax, word ptr [bp - 0x10]
9:B2C1  3b46f4               cmp ax, word ptr [bp - 0xc]
9:B2C4  7e0b                 jle 0xb2d1
9:B2C6  2b4ef4               sub cx, word ptr [bp - 0xc]
9:B2C9  f7d9                 neg cx
9:B2CB  83e902               sub cx, 2
9:B2CE  894ef0               mov word ptr [bp - 0x10], cx
loc_B2D1:
9:B2D1  8b46ec               mov ax, word ptr [bp - 0x14]
9:B2D4  2b46e8               sub ax, word ptr [bp - 0x18]
9:B2D7  8bc8                 mov cx, ax
9:B2D9  8946e4               mov word ptr [bp - 0x1c], ax
9:B2DC  0346f2               add ax, word ptr [bp - 0xe]
9:B2DF  3b46f6               cmp ax, word ptr [bp - 0xa]
9:B2E2  7e0b                 jle 0xb2ef
9:B2E4  2b4ef6               sub cx, word ptr [bp - 0xa]
9:B2E7  f7d9                 neg cx
9:B2E9  83e902               sub cx, 2
9:B2EC  894ef2               mov word ptr [bp - 0xe], cx
loc_B2EF:
9:B2EF  c45e06               les bx, ptr [bp + 6]
9:B2F2  26ff7706             push word ptr es:[bx + 6]
9:B2F6  6a00                 push 0
9:B2F8  66ff76f0             push dword ptr [bp - 0x10]
9:B2FC  666a00               push 0
9:B2FF  6a01                 push 1
9:B301  9acda70000           lcall 0, 0xa7cd  ; USER.SetWindowPos
9:B306  c45e06               les bx, ptr [bp + 6]
9:B309  06                   push es
9:B30A  53                   push bx
9:B30B  26c41f               les bx, ptr es:[bx]
9:B30E  26ff5f6c             lcall es:[bx + 0x6c]
9:B312  c9                   leave
9:B313  ca0400               retf 4

; ---------------- BuildingDlgBase::dlgProc@s9:B316 FAR size=92 callers=4
;   (vslot 3)
9:B316  c8020000             enter 2, 0
9:B31A  c746fe0000           mov word ptr [bp - 2], 0
9:B31F  8b4610               mov ax, word ptr [bp + 0x10]
9:B322  2d0f00               sub ax, 0xf
9:B325  7419                 je 0xb340
9:B327  2d0201               sub ax, 0x102
9:B32A  7426                 je 0xb352
9:B32C  66ff760e             push dword ptr [bp + 0xe]
9:B330  66ff760a             push dword ptr [bp + 0xa]
9:B334  66ff7606             push dword ptr [bp + 6]
9:B338  90                   nop
9:B339  0e                   push cs
9:B33A  e883c6               call 0x79c0  ; OPDialog::dlgProc@s9:79C0
9:B33D  eb0d                 jmp 0xb34c
9:B33F  db 90
loc_B340:
9:B340  c45e06               les bx, ptr [bp + 6]
9:B343  06                   push es
9:B344  53                   push bx
9:B345  26c41f               les bx, ptr es:[bx]
9:B348  26ff5f60             lcall es:[bx + 0x60]
loc_B34C:
9:B34C  8946fe               mov word ptr [bp - 2], ax
9:B34F  eb19                 jmp 0xb36a
9:B351  db 90
loc_B352:
9:B352  66ff760c             push dword ptr [bp + 0xc]
9:B356  ff760a               push word ptr [bp + 0xa]
9:B359  c45e06               les bx, ptr [bp + 6]
9:B35C  06                   push es
9:B35D  53                   push bx
9:B35E  26c41f               les bx, ptr es:[bx]
9:B361  26ff5f10             lcall es:[bx + 0x10]
9:B365  c746fe0100           mov word ptr [bp - 2], 1
loc_B36A:
9:B36A  8b46fe               mov ax, word ptr [bp - 2]
9:B36D  c9                   leave
9:B36E  ca0c00               retf 0xc
9:B371  db 00

; ---------------- BuildingDlgBase::onCtlColor@s9:B372 FAR size=202 callers=0
;   apis: GDI.CreateSolidBrush, GDI.SetBkColor, GDI.SetTextColor, USER.GetDlgCtrlID
;   (vslot 13)
9:B372  c8100000             enter 0x10, 0
9:B376  c45e06               les bx, ptr [bp + 6]
9:B379  2683bf8e0000         cmp word ptr es:[bx + 0x8e], 0
9:B37F  7510                 jne 0xb391
9:B381  666a00               push 0
9:B384  9a92a60000           lcall 0, 0xa692  ; GDI.CreateSolidBrush
9:B389  c45e06               les bx, ptr [bp + 6]
9:B38C  2689878e00           mov word ptr es:[bx + 0x8e], ax
loc_B391:
9:B391  66833efa5e00         cmp dword ptr [0x5efa], 0
9:B397  7535                 jne 0xb3ce
9:B399  c41e3042             les bx, ptr [0x4230]
9:B39D  66268b470e           mov eax, dword ptr es:[bx + 0xe]
9:B3A2  6650                 push eax
9:B3A4  9a724d6eb2           lcall 0xb26e, 0x4d72  ; MemBlock::data@s2:4D72
9:B3A9  8946f8               mov word ptr [bp - 8], ax
9:B3AC  8956fa               mov word ptr [bp - 6], dx
9:B3AF  c45ef8               les bx, ptr [bp - 8]
9:B3B2  2ac0                 sub al, al
9:B3B4  268aa79500           mov ah, byte ptr es:[bx + 0x95]
9:B3B9  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
9:B3BE  2aed                 sub ch, ch
9:B3C0  0bc1                 or ax, cx
9:B3C2  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
9:B3C7  a3fa5e               mov word ptr [0x5efa], ax
9:B3CA  890efc5e             mov word ptr [0x5efc], cx
loc_B3CE:
9:B3CE  8b460c               mov ax, word ptr [bp + 0xc]
9:B3D1  2d0300               sub ax, 3
9:B3D4  7614                 jbe 0xb3ea
9:B3D6  48                   dec ax
9:B3D7  7439                 je 0xb412
9:B3D9  2d0100               sub ax, 1
9:B3DC  7205                 jb 0xb3e3
9:B3DE  2d0100               sub ax, 1
9:B3E1  7607                 jbe 0xb3ea
loc_B3E3:
9:B3E3  33c0                 xor ax, ax
9:B3E5  99                   cdq
9:B3E6  c9                   leave
9:B3E7  ca0a00               retf 0xa
loc_B3EA:
9:B3EA  ff760a               push word ptr [bp + 0xa]
9:B3ED  9aa49d0000           lcall 0, 0x9da4  ; USER.GetDlgCtrlID
9:B3F2  3d4c01               cmp ax, 0x14c
9:B3F5  750b                 jne 0xb402
9:B3F7  ff760e               push word ptr [bp + 0xe]
9:B3FA  6668ffff0000         push 0xffff
9:B400  eb18                 jmp 0xb41a
loc_B402:
9:B402  3d7501               cmp ax, 0x175
9:B405  750b                 jne 0xb412
9:B407  ff760e               push word ptr [bp + 0xe]
9:B40A  6668ff000000         push 0xff
9:B410  eb08                 jmp 0xb41a
loc_B412:
9:B412  ff760e               push word ptr [bp + 0xe]
9:B415  66ff36fa5e           push dword ptr [0x5efa]
loc_B41A:
9:B41A  9a11a70000           lcall 0, 0xa711  ; GDI.SetTextColor
9:B41F  ff760e               push word ptr [bp + 0xe]
9:B422  666800000001         push 0x1000000
9:B428  9a1fa70000           lcall 0, 0xa71f  ; GDI.SetBkColor
9:B42D  c45e06               les bx, ptr [bp + 6]
9:B430  8cda                 mov dx, ds
9:B432  268b878e00           mov ax, word ptr es:[bx + 0x8e]
9:B437  c9                   leave
9:B438  ca0a00               retf 0xa
9:B43B  db 00

; ---------------- BuildingDlgBase::show@s9:B43C FAR size=34 callers=0
;   apis: USER.ShowWindow
;   (vslot 27)
9:B43C  55                   push bp
9:B43D  8bec                 mov bp, sp
9:B43F  c45e06               les bx, ptr [bp + 6]
9:B442  06                   push es
9:B443  53                   push bx
9:B444  26c41f               les bx, ptr es:[bx]
9:B447  26ff5f70             lcall es:[bx + 0x70]
9:B44B  c45e06               les bx, ptr [bp + 6]
9:B44E  26ff7706             push word ptr es:[bx + 6]
9:B452  6a05                 push 5
9:B454  9aa1930000           lcall 0, 0x93a1  ; USER.ShowWindow
9:B459  c9                   leave
9:B45A  ca0400               retf 4
9:B45D  db 00

; ---------------- BuildingDlgBase::setText@s9:B45E FAR size=106 callers=2
;   apis: USER.SetDlgItemText
;   (vslot 28)
9:B45E  c8060000             enter 6, 0
9:B462  c45e06               les bx, ptr [bp + 6]
9:B465  662683bf900000       cmp dword ptr es:[bx + 0x90], 0
9:B46C  7456                 je 0xb4c4
9:B46E  268b4706             mov ax, word ptr es:[bx + 6]
9:B472  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B477  26894714             mov word ptr es:[bx + 0x14], ax
9:B47B  c45e06               les bx, ptr [bp + 6]
9:B47E  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B483  66268b4702           mov eax, dword ptr es:[bx + 2]
9:B488  668946fc             mov dword ptr [bp - 4], eax
9:B48C  c746fa0000           mov word ptr [bp - 6], 0
9:B491  eb08                 jmp 0xb49b
9:B493  db 90
loc_B494:
9:B494  ff46fa               inc word ptr [bp - 6]
9:B497  8346fc0a             add word ptr [bp - 4], 0xa
loc_B49B:
9:B49B  8b46fa               mov ax, word ptr [bp - 6]
9:B49E  c45e06               les bx, ptr [bp + 6]
9:B4A1  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B4A6  263907               cmp word ptr es:[bx], ax
9:B4A9  7e19                 jle 0xb4c4
9:B4AB  c45e06               les bx, ptr [bp + 6]
9:B4AE  26ff7706             push word ptr es:[bx + 6]
9:B4B2  c45efc               les bx, ptr [bp - 4]
9:B4B5  6626ff7702           push dword ptr es:[bx + 2]
9:B4BA  26ff37               push word ptr es:[bx]
9:B4BD  9a48ae0000           lcall 0, 0xae48  ; USER.SetDlgItemText
9:B4C2  ebd0                 jmp 0xb494
loc_B4C4:
9:B4C4  c9                   leave
9:B4C5  ca0400               retf 4

; ---------------- BuildingDlgBase::openRelated@s9:B4C8 FAR size=130 callers=0
;   (vslot 23)
9:B4C8  c8040000             enter 4, 0
9:B4CC  c45e06               les bx, ptr [bp + 6]
9:B4CF  662683bf900000       cmp dword ptr es:[bx + 0x90], 0
9:B4D6  746e                 je 0xb546
9:B4D8  6a32                 push 0x32
9:B4DA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B4DF  9aba2005b5           lcall 0xb505, 0x20ba  ; Registry_get@s3:20BA
9:B4E4  8946fc               mov word ptr [bp - 4], ax
9:B4E7  8956fe               mov word ptr [bp - 2], dx
9:B4EA  c45e06               les bx, ptr [bp + 6]
9:B4ED  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B4F2  268b470a             mov ax, word ptr es:[bx + 0xa]
9:B4F6  eb40                 jmp 0xb538
loc_B4F8:
9:B4F8  666a00               push 0
9:B4FB  68d90f               push 0xfd9
9:B4FE  66ff76fc             push dword ptr [bp - 4]
9:B502  9aaa7918b5           lcall 0xb518, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:B507  0bc0                 or ax, ax
9:B509  753b                 jne 0xb546
9:B50B  50                   push ax
9:B50C  50                   push ax
9:B50D  6a0e                 push 0xe
loc_B50F:
9:B50F  50                   push ax
9:B510  50                   push ax
9:B511  66ff76fc             push dword ptr [bp - 4]
9:B515  9a00732bb5           lcall 0xb52b, 0x7300  ; BuildingWindows::open@s3:7300
9:B51A  c9                   leave
9:B51B  ca0400               retf 4
loc_B51E:
9:B51E  666a00               push 0
9:B521  68da0f               push 0xfda
9:B524  66ff76fc             push dword ptr [bp - 4]
9:B528  9aaa795eb2           lcall 0xb25e, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:B52D  0bc0                 or ax, ax
9:B52F  7515                 jne 0xb546
9:B531  50                   push ax
9:B532  50                   push ax
9:B533  6a0d                 push 0xd
9:B535  ebd8                 jmp 0xb50f
9:B537  db 90
loc_B538:
9:B538  2d0400               sub ax, 4
9:B53B  74bb                 je 0xb4f8
9:B53D  48                   dec ax
9:B53E  48                   dec ax
9:B53F  7c05                 jl 0xb546
9:B541  7003                 jo 0xb546
9:B543  48                   dec ax
9:B544  7ed8                 jle 0xb51e
loc_B546:
9:B546  c9                   leave
9:B547  ca0400               retf 4

; ---------------- BuildingDlgBase::onCommand@s9:B54A FAR size=476 callers=20
;   (vslot 4) the shared buttons (reports, building windows)
9:B54A  c8180000             enter 0x18, 0
9:B54E  8b460e               mov ax, word ptr [bp + 0xe]
9:B551  2dea00               sub ax, 0xea
9:B554  741c                 je 0xb572
9:B556  48                   dec ax
9:B557  0f84db00             je 0xb636
9:B55B  2da516               sub ax, 0x16a5
9:B55E  7422                 je 0xb582
9:B560  2d9400               sub ax, 0x94
9:B563  0f848d00             je 0xb5f4
9:B567  2d0c00               sub ax, 0xc
9:B56A  0f845e01             je 0xb6cc
9:B56E  e9a101               jmp 0xb712
9:B571  db 90
loc_B572:
9:B572  c45e06               les bx, ptr [bp + 6]
9:B575  06                   push es
9:B576  53                   push bx
9:B577  26c41f               les bx, ptr es:[bx]
9:B57A  26ff5f5c             lcall es:[bx + 0x5c]
9:B57E  e94601               jmp 0xb6c7
9:B581  db 90
loc_B582:
9:B582  6a32                 push 0x32
9:B584  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B589  9aba20a6b5           lcall 0xb5a6, 0x20ba  ; Registry_get@s3:20BA
9:B58E  8946fa               mov word ptr [bp - 6], ax
9:B591  8956fc               mov word ptr [bp - 4], dx
9:B594  c45e06               les bx, ptr [bp + 6]
9:B597  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B59C  6626ff7706           push dword ptr es:[bx + 6]
9:B5A1  52                   push dx
9:B5A2  50                   push ax
9:B5A3  9a387db8b5           lcall 0xb5b8, 0x7d38  ; BuildingWindows::positionOf@s3:7D38
9:B5A8  8946fe               mov word ptr [bp - 2], ax
9:B5AB  666a00               push 0
9:B5AE  68ab0f               push 0xfab
9:B5B1  66ff76fa             push dword ptr [bp - 6]
9:B5B5  9aaa79eeb5           lcall 0xb5ee, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:B5BA  0bc0                 or ax, ax
9:B5BC  0f850701             jne 0xb6c7
9:B5C0  3946fe               cmp word ptr [bp - 2], ax
9:B5C3  7411                 je 0xb5d6
9:B5C5  c45e06               les bx, ptr [bp + 6]
9:B5C8  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B5CD  6626ff7706           push dword ptr es:[bx + 6]
9:B5D2  6a09                 push 9
9:B5D4  eb0f                 jmp 0xb5e5
loc_B5D6:
9:B5D6  c45e06               les bx, ptr [bp + 6]
9:B5D9  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B5DE  6626ff7706           push dword ptr es:[bx + 6]
9:B5E3  6a14                 push 0x14
loc_B5E5:
9:B5E5  06                   push es
9:B5E6  53                   push bx
loc_B5E7:
9:B5E7  66ff76fa             push dword ptr [bp - 6]
loc_B5EB:
9:B5EB  9a0073feb5           lcall 0xb5fe, 0x7300  ; BuildingWindows::open@s3:7300
9:B5F0  e9d400               jmp 0xb6c7
9:B5F3  db 90
loc_B5F4:
9:B5F4  6a32                 push 0x32
9:B5F6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B5FB  9aba201bb6           lcall 0xb61b, 0x20ba  ; Registry_get@s3:20BA
9:B600  8946fa               mov word ptr [bp - 6], ax
9:B603  8956fc               mov word ptr [bp - 4], dx
9:B606  c45e06               les bx, ptr [bp + 6]
9:B609  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B60E  6626ff7706           push dword ptr es:[bx + 6]
9:B613  68c50f               push 0xfc5
9:B616  52                   push dx
9:B617  50                   push ax
9:B618  9aaa7940b6           lcall 0xb640, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:B61D  0bc0                 or ax, ax
9:B61F  0f85a400             jne 0xb6c7
9:B623  c45e06               les bx, ptr [bp + 6]
9:B626  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B62B  6626ff7706           push dword ptr es:[bx + 6]
9:B630  6a12                 push 0x12  ; 'version %d %d'
9:B632  50                   push ax
9:B633  50                   push ax
9:B634  ebb1                 jmp 0xb5e7
loc_B636:
9:B636  6a03                 push 3
9:B638  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B63D  9aba2075b6           lcall 0xb675, 0x20ba  ; Registry_get@s3:20BA
9:B642  8946fa               mov word ptr [bp - 6], ax
9:B645  8956fc               mov word ptr [bp - 4], dx
9:B648  c45e06               les bx, ptr [bp + 6]
9:B64B  66268b879000         mov eax, dword ptr es:[bx + 0x90]
9:B651  668946f6             mov dword ptr [bp - 0xa], eax
9:B655  660bc0               or eax, eax
9:B658  7508                 jne 0xb662
9:B65A  33c0                 xor ax, ax
loc_B65C:
9:B65C  33d2                 xor dx, dx
9:B65E  c9                   leave
9:B65F  ca0a00               retf 0xa
loc_B662:
9:B662  c45ef6               les bx, ptr [bp - 0xa]
9:B665  6626ff7706           push dword ptr es:[bx + 6]
9:B66A  26ff770a             push word ptr es:[bx + 0xa]
9:B66E  66ff76fa             push dword ptr [bp - 6]
9:B672  9a64add6b6           lcall 0xb6d6, 0xad64  ; Reports::openFor@s3:AD64
9:B677  c45e06               les bx, ptr [bp + 6]
9:B67A  2689879000           mov word ptr es:[bx + 0x90], ax
9:B67F  2689979200           mov word ptr es:[bx + 0x92], dx
9:B684  8bc2                 mov ax, dx
9:B686  260b879000           or ax, word ptr es:[bx + 0x90]
9:B68B  742d                 je 0xb6ba
9:B68D  668b46f6             mov eax, dword ptr [bp - 0xa]
9:B691  660bc0               or eax, eax
9:B694  7415                 je 0xb6ab
9:B696  ff76f8               push word ptr [bp - 8]
9:B699  50                   push ax
9:B69A  90                   nop
9:B69B  0e                   push cs
9:B69C  e831ef               call 0xa5d0  ; ReportRow::free@s9:A5D0
9:B69F  66ff76f6             push dword ptr [bp - 0xa]
9:B6A3  9ace176ab1           lcall 0xb16a, 0x17ce  ; operator_delete@s1:17CE
9:B6A8  83c404               add sp, 4
loc_B6AB:
9:B6AB  c45e06               les bx, ptr [bp + 6]
9:B6AE  06                   push es
9:B6AF  53                   push bx
9:B6B0  26c41f               les bx, ptr es:[bx]
9:B6B3  26ff5f70             lcall es:[bx + 0x70]
9:B6B7  eb0e                 jmp 0xb6c7
9:B6B9  db 90
loc_B6BA:
9:B6BA  668b46f6             mov eax, dword ptr [bp - 0xa]
9:B6BE  c45e06               les bx, ptr [bp + 6]
9:B6C1  662689879000         mov dword ptr es:[bx + 0x90], eax
loc_B6C7:
9:B6C7  b80100               mov ax, 1
9:B6CA  eb90                 jmp 0xb65c
loc_B6CC:
9:B6CC  6a32                 push 0x32
9:B6CE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B6D3  9aba20f3b6           lcall 0xb6f3, 0x20ba  ; Registry_get@s3:20BA
9:B6D8  8946ea               mov word ptr [bp - 0x16], ax
9:B6DB  8956ec               mov word ptr [bp - 0x14], dx
9:B6DE  c45e06               les bx, ptr [bp + 6]
9:B6E1  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B6E6  6626ff7706           push dword ptr es:[bx + 6]
9:B6EB  68b60f               push 0xfb6
9:B6EE  52                   push dx
9:B6EF  50                   push ax
9:B6F0  9aaa79e2b4           lcall 0xb4e2, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:B6F5  0bc0                 or ax, ax
9:B6F7  75ce                 jne 0xb6c7
9:B6F9  c45e06               les bx, ptr [bp + 6]
9:B6FC  26c49f9000           les bx, ptr es:[bx + 0x90]
9:B701  6626ff7706           push dword ptr es:[bx + 6]
9:B706  6a0c                 push 0xc
9:B708  50                   push ax
9:B709  50                   push ax
9:B70A  66ff76ea             push dword ptr [bp - 0x16]
9:B70E  e9dafe               jmp 0xb5eb
9:B711  db 90
loc_B712:
9:B712  66ff760c             push dword ptr [bp + 0xc]
9:B716  66ff7608             push dword ptr [bp + 8]
9:B71A  ff7606               push word ptr [bp + 6]
9:B71D  90                   nop
9:B71E  0e                   push cs
9:B71F  e81ac4               call 0x7b3c  ; OPDialog::onCommand@s9:7B3C
9:B722  c9                   leave
9:B723  ca0a00               retf 0xa

; ---------------- BuildingDlgBase::close@s9:B726 FAR size=38 callers=2
;   apis: USER.DestroyWindow
;   (vslot 5)
9:B726  55                   push bp
9:B727  8bec                 mov bp, sp
9:B729  837e0a00             cmp word ptr [bp + 0xa], 0
9:B72D  740c                 je 0xb73b
9:B72F  c45e06               les bx, ptr [bp + 6]
9:B732  06                   push es
9:B733  53                   push bx
9:B734  26c41f               les bx, ptr es:[bx]
9:B737  26ff5f78             lcall es:[bx + 0x78]
loc_B73B:
9:B73B  c45e06               les bx, ptr [bp + 6]
9:B73E  26ff7706             push word ptr es:[bx + 6]
9:B742  9a898b0000           lcall 0, 0x8b89  ; USER.DestroyWindow
9:B747  c9                   leave
9:B748  ca0600               retf 6
9:B74B  db 00

; ---------------- BuildingDlgBase::scalar_dtor@s9:B74C FAR size=162 callers=0
;   deleting destructor
9:B74C  55                   push bp
9:B74D  8bec                 mov bp, sp
9:B74F  66ff7606             push dword ptr [bp + 6]
9:B753  90                   nop
9:B754  0e                   push cs
9:B755  e8a0f9               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:B758  f6460a01             test byte ptr [bp + 0xa], 1
9:B75C  7409                 je 0xb767
9:B75E  66ff7606             push dword ptr [bp + 6]
9:B762  9ace17a6b6           lcall 0xb6a6, 0x17ce  ; operator_delete@s1:17CE
loc_B767:
9:B767  8b4606               mov ax, word ptr [bp + 6]
9:B76A  8b5608               mov dx, word ptr [bp + 8]
9:B76D  c9                   leave
9:B76E  ca0600               retf 6
9:B771  db 90 4c b7 7c b7 10 3a a7 b3 30 b2 80 b7 16 b3 84
9:B781  db b7 4a b5 88 b7 26 b7 8c b7 56 7f 90 b7 b2 7b 94
9:B791  db b7 1c 7f 9c b7 48 88 d4 b7 86 7f a0 b7 0c 80 a4
9:B7A1  db b7 54 80 a8 b7 72 b3 ac b7 58 81 b0 b7 b6 81 b4
9:B7B1  db b7 fe 81 bc b7 ea 60 c8 b7 4a 82 c0 b7 66 82 c4
9:B7C1  db b7 de 78 d0 b7 ee 60 cc b7 f4 60 d8 b7 c8 b4 dc
9:B7D1  db b7 42 88 ec b7 fe 60 0a b0 7e 80 e0 b7 3c b4 e4
9:B7E1  db b7 5e b4 e8 b7 7c b1 08 b1 4c 88 ea af

; ---------------- UgLabDlg::UgLabDlg@s9:B7EE FAR size=118 callers=1
;   dialog 4011 for an underground lab (vtable BEBA)
9:B7EE  55                   push bp
9:B7EF  8bec                 mov bp, sp
9:B7F1  ff760e               push word ptr [bp + 0xe]
9:B7F4  66680000ab0f         push 0xfab0000
9:B7FA  6a00                 push 0
9:B7FC  66ff7606             push dword ptr [bp + 6]
9:B800  90                   nop
9:B801  0e                   push cs
9:B802  e8b7f8               call 0xb0bc  ; ObjectDlgBase::ObjectDlgBase@s9:B0BC
9:B805  c45e06               les bx, ptr [bp + 6]
9:B808  662bc0               sub eax, eax
9:B80B  662689879400         mov dword ptr es:[bx + 0x94], eax
9:B811  662689879800         mov dword ptr es:[bx + 0x98], eax
9:B817  66268987b000         mov dword ptr es:[bx + 0xb0], eax
9:B81D  268987b400           mov word ptr es:[bx + 0xb4], ax
9:B822  268987b600           mov word ptr es:[bx + 0xb6], ax
9:B827  26c707babe           mov word ptr es:[bx], 0xbeba
9:B82C  26c7470274b7         mov word ptr es:[bx + 2], 0xb774  ; SEGMENT s9:0000
9:B832  66837e0a00           cmp dword ptr [bp + 0xa], 0
9:B837  7420                 je 0xb859
9:B839  c45e0a               les bx, ptr [bp + 0xa]
9:B83C  66268b4706           mov eax, dword ptr es:[bx + 6]
9:B841  c45e06               les bx, ptr [bp + 6]
9:B844  66268987b000         mov dword ptr es:[bx + 0xb0], eax
9:B84A  c45e0a               les bx, ptr [bp + 0xa]
9:B84D  268b4714             mov ax, word ptr es:[bx + 0x14]
9:B851  c45e06               les bx, ptr [bp + 6]
9:B854  268987b400           mov word ptr es:[bx + 0xb4], ax
loc_B859:
9:B859  8b4606               mov ax, word ptr [bp + 6]
9:B85C  8b5608               mov dx, word ptr [bp + 8]
9:B85F  c9                   leave
9:B860  ca0a00               retf 0xa
9:B863  db 00

; ---------------- UgLabDlg::dlgProc@s9:B864 FAR size=90 callers=0
;   (vslot 3)
9:B864  55                   push bp
9:B865  8bec                 mov bp, sp
9:B867  8b4610               mov ax, word ptr [bp + 0x10]
9:B86A  2d2b00               sub ax, 0x2b
9:B86D  741b                 je 0xb88a
9:B86F  2de600               sub ax, 0xe6
9:B872  7430                 je 0xb8a4
9:B874  66ff760e             push dword ptr [bp + 0xe]
9:B878  66ff760a             push dword ptr [bp + 0xa]
9:B87C  66ff7606             push dword ptr [bp + 6]
9:B880  90                   nop
9:B881  0e                   push cs
9:B882  e891fa               call 0xb316  ; BuildingDlgBase::dlgProc@s9:B316
9:B885  c9                   leave
9:B886  ca0c00               retf 0xc
9:B889  db 90
loc_B88A:
9:B88A  8b4e0c               mov cx, word ptr [bp + 0xc]
9:B88D  8b5e0a               mov bx, word ptr [bp + 0xa]
9:B890  8ec1                 mov es, cx
9:B892  26833f04             cmp word ptr es:[bx], 4
9:B896  751f                 jne 0xb8b7
9:B898  51                   push cx
9:B899  53                   push bx
9:B89A  90                   nop
9:B89B  0e                   push cs
9:B89C  e8c7dc               call 0x9566  ; objectFromHwnd@s9:9566
9:B89F  8be5                 mov sp, bp
9:B8A1  eb14                 jmp 0xb8b7
9:B8A3  db 90
loc_B8A4:
9:B8A4  66ff760c             push dword ptr [bp + 0xc]
9:B8A8  ff760a               push word ptr [bp + 0xa]
9:B8AB  c45e06               les bx, ptr [bp + 6]
9:B8AE  06                   push es
9:B8AF  53                   push bx
9:B8B0  26c41f               les bx, ptr es:[bx]
9:B8B3  26ff5f7c             lcall es:[bx + 0x7c]
loc_B8B7:
9:B8B7  b80100               mov ax, 1
9:B8BA  c9                   leave
9:B8BB  ca0c00               retf 0xc

; ---------------- UgLabDlg::refresh@s9:B8BE FAR size=20 callers=0
;   (vslot 9)
9:B8BE  55                   push bp
9:B8BF  8bec                 mov bp, sp
9:B8C1  c45e06               les bx, ptr [bp + 6]
9:B8C4  06                   push es
9:B8C5  53                   push bx
9:B8C6  26c41f               les bx, ptr es:[bx]
9:B8C9  26ff9f8000           lcall es:[bx + 0x80]
9:B8CE  c9                   leave
9:B8CF  ca0400               retf 4

; ---------------- UgLabDlg::init@s9:B8D2 size=648 callers=0
;   apis: USER.SetWindowPos
;   (vslot 2)
9:B8D2  c81a0000             enter 0x1a, 0
9:B8D6  66ff7606             push dword ptr [bp + 6]
9:B8DA  90                   nop
9:B8DB  0e                   push cs
9:B8DC  e803c0               call 0x78e2  ; OPDialog::create@s9:78E2
9:B8DF  6a31                 push 0x31
9:B8E1  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:B8E6  9aba20d1ba           lcall 0xbad1, 0x20ba  ; Registry_get@s3:20BA
9:B8EB  c45e06               les bx, ptr [bp + 6]
9:B8EE  2689879800           mov word ptr es:[bx + 0x98], ax
9:B8F3  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:B8F8  6a0a                 push 0xa
9:B8FA  9a9c174eb9           lcall 0xb94e, 0x179c  ; operator_new@s1:179C
9:B8FF  83c402               add sp, 2
9:B902  8956f0               mov word ptr [bp - 0x10], dx
9:B905  0bd0                 or dx, ax
9:B907  741f                 je 0xb928
9:B909  c45e06               les bx, ptr [bp + 6]
9:B90C  26ff7706             push word ptr es:[bx + 6]
9:B910  ff76f0               push word ptr [bp - 0x10]
9:B913  50                   push ax
9:B914  90                   nop
9:B915  0e                   push cs
9:B916  e82506               call 0xbf3e  ; TreeView::TreeView@s9:BF3E
9:B919  c45e06               les bx, ptr [bp + 6]
9:B91C  2689879400           mov word ptr es:[bx + 0x94], ax
9:B921  2689979600           mov word ptr es:[bx + 0x96], dx
9:B926  eb0d                 jmp 0xb935
loc_B928:
9:B928  c45e06               les bx, ptr [bp + 6]
9:B92B  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
loc_B935:
9:B935  c45e06               les bx, ptr [bp + 6]
9:B938  6626ffb79800         push dword ptr es:[bx + 0x98]
9:B93E  6626ffb79400         push dword ptr es:[bx + 0x94]
9:B944  90                   nop
9:B945  0e                   push cs
9:B946  e89506               call 0xbfde  ; TreeView::attach@s9:BFDE
9:B949  6a42                 push 0x42
9:B94B  9a9c1783b9           lcall 0xb983, 0x179c  ; operator_new@s1:179C
9:B950  83c402               add sp, 2
9:B953  8956f0               mov word ptr [bp - 0x10], dx
9:B956  0bd0                 or dx, ax
9:B958  7424                 je 0xb97e
9:B95A  c45e06               les bx, ptr [bp + 6]
9:B95D  26ff7706             push word ptr es:[bx + 6]
9:B961  666880000a01         push 0x10a0080
9:B967  666800008100         push 0x810000
9:B96D  66680a000a00         push 0xa000a
9:B973  6a01                 push 1
9:B975  ff76f0               push word ptr [bp - 0x10]
9:B978  50                   push ax
9:B979  9ad63bb1b9           lcall 0xb9b1, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_B97E:
9:B97E  6a42                 push 0x42
9:B980  9a9c17b8b9           lcall 0xb9b8, 0x179c  ; operator_new@s1:179C
9:B985  83c402               add sp, 2
9:B988  8956f0               mov word ptr [bp - 0x10], dx
9:B98B  0bd0                 or dx, ax
9:B98D  7424                 je 0xb9b3
9:B98F  c45e06               les bx, ptr [bp + 6]
9:B992  26ff7706             push word ptr es:[bx + 6]
9:B996  666884000b01         push 0x10b0084
9:B99C  666800008500         push 0x850000
9:B9A2  666828000a00         push 0xa0028
9:B9A8  6a01                 push 1
9:B9AA  ff76f0               push word ptr [bp - 0x10]
9:B9AD  50                   push ax
9:B9AE  9ad63be6b9           lcall 0xb9e6, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_B9B3:
9:B9B3  6a42                 push 0x42
9:B9B5  9a9c17edb9           lcall 0xb9ed, 0x179c  ; operator_new@s1:179C
9:B9BA  83c402               add sp, 2
9:B9BD  8956f0               mov word ptr [bp - 0x10], dx
9:B9C0  0bd0                 or dx, ax
9:B9C2  7424                 je 0xb9e8
9:B9C4  c45e06               les bx, ptr [bp + 6]
9:B9C7  26ff7706             push word ptr es:[bx + 6]
9:B9CB  666886000d01         push 0x10d0086
9:B9D1  666800008700         push 0x870000
9:B9D7  666846000a00         push 0xa0046
9:B9DD  6a01                 push 1
9:B9DF  ff76f0               push word ptr [bp - 0x10]
9:B9E2  50                   push ax
9:B9E3  9ad63b1bba           lcall 0xba1b, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_B9E8:
9:B9E8  6a42                 push 0x42
9:B9EA  9a9c1722ba           lcall 0xba22, 0x179c  ; operator_new@s1:179C
9:B9EF  83c402               add sp, 2
9:B9F2  8956f0               mov word ptr [bp - 0x10], dx
9:B9F5  0bd0                 or dx, ax
9:B9F7  7424                 je 0xba1d
9:B9F9  c45e06               les bx, ptr [bp + 6]
9:B9FC  26ff7706             push word ptr es:[bx + 6]
9:BA00  666888000e01         push 0x10e0088
9:BA06  666800008900         push 0x890000
9:BA0C  666864000a00         push 0xa0064
9:BA12  6a01                 push 1
9:BA14  ff76f0               push word ptr [bp - 0x10]
9:BA17  50                   push ax
9:BA18  9ad63b50ba           lcall 0xba50, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_BA1D:
9:BA1D  6a42                 push 0x42
9:BA1F  9a9c1757ba           lcall 0xba57, 0x179c  ; operator_new@s1:179C
9:BA24  83c402               add sp, 2
9:BA27  8956f0               mov word ptr [bp - 0x10], dx
9:BA2A  0bd0                 or dx, ax
9:BA2C  7424                 je 0xba52
9:BA2E  c45e06               les bx, ptr [bp + 6]
9:BA31  26ff7706             push word ptr es:[bx + 6]
9:BA35  666882000c01         push 0x10c0082
9:BA3B  666800008300         push 0x830000
9:BA41  666882000a00         push 0xa0082
9:BA47  6a01                 push 1
9:BA49  ff76f0               push word ptr [bp - 0x10]
9:BA4C  50                   push ax
9:BA4D  9ad63b85ba           lcall 0xba85, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_BA52:
9:BA52  6a42                 push 0x42
9:BA54  9a9c178cba           lcall 0xba8c, 0x179c  ; operator_new@s1:179C
9:BA59  83c402               add sp, 2
9:BA5C  8956f0               mov word ptr [bp - 0x10], dx
9:BA5F  0bd0                 or dx, ax
9:BA61  7424                 je 0xba87
9:BA63  c45e06               les bx, ptr [bp + 6]
9:BA66  26ff7706             push word ptr es:[bx + 6]
9:BA6A  66688a00bb0b         push 0xbbb008a
9:BA70  666800008b00         push 0x8b0000
9:BA76  6668d2000a00         push 0xa00d2
9:BA7C  6a01                 push 1
9:BA7E  ff76f0               push word ptr [bp - 0x10]
9:BA81  50                   push ax
9:BA82  9ad63bbaba           lcall 0xbaba, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
loc_BA87:
9:BA87  6a42                 push 0x42
9:BA89  9a9c1765b7           lcall 0xb765, 0x179c  ; operator_new@s1:179C
9:BA8E  83c402               add sp, 2
9:BA91  8956f0               mov word ptr [bp - 0x10], dx
9:BA94  0bd0                 or dx, ax
9:BA96  7426                 je 0xbabe
9:BA98  c45e06               les bx, ptr [bp + 6]
9:BA9B  26ff7706             push word ptr es:[bx + 6]
9:BA9F  66688c00bc0b         push 0xbbc008c
9:BAA5  66688e008d00         push 0x8d008e
9:BAAB  6668a0000a00         push 0xa00a0
9:BAB1  6a01                 push 1
9:BAB3  ff76f0               push word ptr [bp - 0x10]
9:BAB6  50                   push ax
9:BAB7  9ad63b78b7           lcall 0xb778, 0x3bd6  ; PalDialog::PalDialog@s2:3BD6
9:BABC  eb03                 jmp 0xbac1
loc_BABE:
9:BABE  33c0                 xor ax, ax
9:BAC0  99                   cdq
loc_BAC1:
9:BAC1  8946fc               mov word ptr [bp - 4], ax
9:BAC4  8956fe               mov word ptr [bp - 2], dx
9:BAC7  6a03                 push 3
9:BAC9  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:BACE  9aba20e7ba           lcall 0xbae7, 0x20ba  ; Registry_get@s3:20BA
9:BAD3  8946f8               mov word ptr [bp - 8], ax
9:BAD6  8956fa               mov word ptr [bp - 6], dx
9:BAD9  c45e06               les bx, ptr [bp + 6]
9:BADC  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:BAE2  52                   push dx
9:BAE3  50                   push ax
9:BAE4  9aaca5f5ba           lcall 0xbaf5, 0xa5ac  ; Lab::topicOf@s3:A5AC
9:BAE9  8946f6               mov word ptr [bp - 0xa], ax
9:BAEC  6a1e                 push 0x1e
9:BAEE  66ff76f8             push dword ptr [bp - 8]
9:BAF2  9a62ac05bb           lcall 0xbb05, 0xac62  ; Player1::flag@s3:AC62
9:BAF7  0bc0                 or ax, ax
9:BAF9  7420                 je 0xbb1b
9:BAFB  ff76f6               push word ptr [bp - 0xa]
9:BAFE  66ff76f8             push dword ptr [bp - 8]
9:BB02  9acaa515bb           lcall 0xbb15, 0xa5ca  ; Player1::progress@s3:A5CA
9:BB07  0bc0                 or ax, ax
9:BB09  7e10                 jle 0xbb1b
9:BB0B  ff76f6               push word ptr [bp - 0xa]
9:BB0E  66ff76f8             push dword ptr [bp - 8]
9:BB12  9a8aa58cb5           lcall 0xb58c, 0xa58a  ; Player1::isPriority@s3:A58A
9:BB17  0bc0                 or ax, ax
9:BB19  740b                 je 0xbb26
loc_BB1B:
9:BB1B  6a00                 push 0
9:BB1D  66ff76fc             push dword ptr [bp - 4]
9:BB21  90                   nop
9:BB22  0e                   push cs
9:BB23  e80ed7               call 0x9234  ; OPCtrl::enable@s9:9234
loc_BB26:
9:BB26  c45e06               les bx, ptr [bp + 6]
9:BB29  66268b879800         mov eax, dword ptr es:[bx + 0x98]
9:BB2F  050a00               add ax, 0xa
9:BB32  668946f2             mov dword ptr [bp - 0xe], eax
9:BB36  26ff7706             push word ptr es:[bx + 6]
9:BB3A  6a00                 push 0
9:BB3C  c45ef2               les bx, ptr [bp - 0xe]
9:BB3F  26ff37               push word ptr es:[bx]
9:BB42  26ff7702             push word ptr es:[bx + 2]
9:BB46  26ff7704             push word ptr es:[bx + 4]
9:BB4A  26ff7706             push word ptr es:[bx + 6]
9:BB4E  6a40                 push 0x40
9:BB50  9a02b30000           lcall 0, 0xb302  ; USER.SetWindowPos
9:BB55  c9                   leave
9:BB56  ca0400               retf 4
9:BB59  db 00

; ---------------- UgLabDlg::onCommand@s9:BB5A FAR size=30 callers=0
;   (vslot 24)
9:BB5A  55                   push bp
9:BB5B  8bec                 mov bp, sp
9:BB5D  c45e06               les bx, ptr [bp + 6]
9:BB60  6626ffb79400         push dword ptr es:[bx + 0x94]
9:BB66  26c49f9400           les bx, ptr es:[bx + 0x94]
9:BB6B  26c41f               les bx, ptr es:[bx]
9:BB6E  26ff5f08             lcall es:[bx + 8]
9:BB72  33c0                 xor ax, ax
9:BB74  c9                   leave
9:BB75  ca0400               retf 4

; ---------------- UgLabDlg::destroy@s9:BB78 size=106 callers=0
;   apis: USER.DestroyWindow, USER.IsWindow
;   (vslot 32)
9:BB78  c8080000             enter 8, 0
9:BB7C  56                   push si
9:BB7D  c45e06               les bx, ptr [bp + 6]
9:BB80  2683bfb60000         cmp word ptr es:[bx + 0xb6], 0
9:BB86  741b                 je 0xbba3
9:BB88  26ffb7b600           push word ptr es:[bx + 0xb6]
9:BB8D  9a4ba00000           lcall 0, 0xa04b  ; USER.IsWindow
9:BB92  0bc0                 or ax, ax
9:BB94  740d                 je 0xbba3
9:BB96  c45e06               les bx, ptr [bp + 6]
9:BB99  26ffb7b600           push word ptr es:[bx + 0xb6]
9:BB9E  9a43b70000           lcall 0, 0xb743  ; USER.DestroyWindow
loc_BBA3:
9:BBA3  c45e06               les bx, ptr [bp + 6]
9:BBA6  26c787b6000000       mov word ptr es:[bx + 0xb6], 0
9:BBAD  268b879400           mov ax, word ptr es:[bx + 0x94]
9:BBB2  268b979600           mov dx, word ptr es:[bx + 0x96]
9:BBB7  8bda                 mov bx, dx
9:BBB9  0bd0                 or dx, ax
9:BBBB  740e                 je 0xbbcb
9:BBBD  6a01                 push 1
9:BBBF  53                   push bx
9:BBC0  50                   push ax
9:BBC1  8ec3                 mov es, bx
9:BBC3  8bf0                 mov si, ax
9:BBC5  26c41c               les bx, ptr es:[si]
9:BBC8  26ff1f               lcall es:[bx]
loc_BBCB:
9:BBCB  c45e06               les bx, ptr [bp + 6]
9:BBCE  662bc0               sub eax, eax
9:BBD1  662689879400         mov dword ptr es:[bx + 0x94], eax
9:BBD7  662689879800         mov dword ptr es:[bx + 0x98], eax
9:BBDD  5e                   pop si
9:BBDE  c9                   leave
9:BBDF  ca0400               retf 4

; ---------------- UgLabDlg::onTopic@s9:BBE2 size=690 callers=0
;   apis: USER.DestroyWindow, USER.EnableWindow, USER.GetClientRect, USER.GetDlgItem, USER.InvalidateRect, USER.IsWindow, USER.SendMessage, USER.ShowWindow
;   (vslot 31)
9:BBE2  c8200000             enter 0x20, 0
9:BBE6  8b460e               mov ax, word ptr [bp + 0xe]
9:BBE9  3d0c01               cmp ax, 0x10c
9:BBEC  0f844201             je 0xbd32
9:BBF0  0f876e02             ja 0xbe62
9:BBF4  2dfa00               sub ax, 0xfa
9:BBF7  740d                 je 0xbc06
9:BBF9  2d1000               sub ax, 0x10
9:BBFC  7428                 je 0xbc26
9:BBFE  48                   dec ax
9:BBFF  0f84ab00             je 0xbcae
9:BC03  e97202               jmp 0xbe78
loc_BC06:
9:BC06  66ff36fe5e           push dword ptr [0x5efe]
9:BC0B  6a00                 push 0
9:BC0D  c45e06               les bx, ptr [bp + 6]
9:BC10  6626ffb79800         push dword ptr es:[bx + 0x98]
9:BC16  26c49f9800           les bx, ptr es:[bx + 0x98]
9:BC1B  26c41f               les bx, ptr es:[bx]
9:BC1E  26ff5f18             lcall es:[bx + 0x18]
9:BC22  e96702               jmp 0xbe8c
9:BC25  db 90
loc_BC26:
9:BC26  c45e06               les bx, ptr [bp + 6]
9:BC29  26ff7706             push word ptr es:[bx + 6]
9:BC2D  8d46f8               lea ax, [bp - 8]
9:BC30  16                   push ss
9:BC31  50                   push ax
9:BC32  9ab29e0000           lcall 0, 0x9eb2  ; USER.GetClientRect
9:BC37  c45e06               les bx, ptr [bp + 6]
9:BC3A  26c49f9800           les bx, ptr es:[bx + 0x98]
9:BC3F  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:BC43  8946f6               mov word ptr [bp - 0xa], ax
9:BC46  c45e06               les bx, ptr [bp + 6]
9:BC49  26c49f9800           les bx, ptr es:[bx + 0x98]
9:BC4E  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:BC52  8946f4               mov word ptr [bp - 0xc], ax
9:BC55  8346fa03             add word ptr [bp - 6], 3
9:BC59  8b46f6               mov ax, word ptr [bp - 0xa]
9:BC5C  2d0900               sub ax, 9
9:BC5F  8946f8               mov word ptr [bp - 8], ax
9:BC62  836efc03             sub word ptr [bp - 4], 3
9:BC66  836efe03             sub word ptr [bp - 2], 3
9:BC6A  c45e06               les bx, ptr [bp + 6]
9:BC6D  26ff7706             push word ptr es:[bx + 6]
9:BC71  8d46f8               lea ax, [bp - 8]
9:BC74  16                   push ss
9:BC75  50                   push ax
9:BC76  6a01                 push 1
9:BC78  9a78a10000           lcall 0, 0xa178  ; USER.InvalidateRect
9:BC7D  c45e06               les bx, ptr [bp + 6]
9:BC80  6626ffb79800         push dword ptr es:[bx + 0x98]
9:BC86  9aa02f9abc           lcall 0xbc9a, 0x2fa0  ; ResearchTreeBase::destroyButtons@s3:2FA0
9:BC8B  666a00               push 0
9:BC8E  c45e06               les bx, ptr [bp + 6]
9:BC91  6626ffb79800         push dword ptr es:[bx + 0x98]
9:BC97  9ac032a8bc           lcall 0xbca8, 0x32c0  ; ResearchTreeBase::setWindow@s3:32C0
9:BC9C  c45e06               les bx, ptr [bp + 6]
9:BC9F  6626ffb79800         push dword ptr es:[bx + 0x98]
9:BCA5  9ae22ec8bc           lcall 0xbcc8, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:BCAA  e9df01               jmp 0xbe8c
9:BCAD  db 90
loc_BCAE:
9:BCAE  c45e06               les bx, ptr [bp + 6]
9:BCB1  26c49f9800           les bx, ptr es:[bx + 0x98]
9:BCB6  268b4712             mov ax, word ptr es:[bx + 0x12]
9:BCBA  8946e0               mov word ptr [bp - 0x20], ax
9:BCBD  50                   push ax
9:BCBE  6a03                 push 3
9:BCC0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:BCC5  9aba20d5bc           lcall 0xbcd5, 0x20ba  ; Registry_get@s3:20BA
9:BCCA  8946e4               mov word ptr [bp - 0x1c], ax
9:BCCD  8956e6               mov word ptr [bp - 0x1a], dx
9:BCD0  52                   push dx
9:BCD1  50                   push ax
9:BCD2  9acaa501bd           lcall 0xbd01, 0xa5ca  ; Player1::progress@s3:A5CA
9:BCD7  8946e8               mov word ptr [bp - 0x18], ax
9:BCDA  837ee070             cmp word ptr [bp - 0x20], 0x70
9:BCDE  7406                 je 0xbce6
9:BCE0  0bc0                 or ax, ax
9:BCE2  0f84a601             je 0xbe8c
loc_BCE6:
9:BCE6  c45e06               les bx, ptr [bp + 6]
9:BCE9  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:BCEF  26c49f9800           les bx, ptr es:[bx + 0x98]
9:BCF4  26ff7712             push word ptr es:[bx + 0x12]
9:BCF8  ff76e6               push word ptr [bp - 0x1a]
loc_BCFB:
9:BCFB  ff76e4               push word ptr [bp - 0x1c]
9:BCFE  9aeca54cbd           lcall 0xbd4c, 0xa5ec  ; setLabTopic@s3:A5EC
9:BD03  c45e06               les bx, ptr [bp + 6]
9:BD06  2683bfb40000         cmp word ptr es:[bx + 0xb4], 0
9:BD0C  7424                 je 0xbd32
9:BD0E  26ffb7b400           push word ptr es:[bx + 0xb4]
9:BD13  9abdbd0000           lcall 0, 0xbdbd  ; USER.IsWindow
9:BD18  0bc0                 or ax, ax
9:BD1A  7416                 je 0xbd32
9:BD1C  c45e06               les bx, ptr [bp + 6]
9:BD1F  26ffb7b400           push word ptr es:[bx + 0xb4]
9:BD24  6668eb001101         push 0x11100eb
9:BD2A  666a00               push 0
9:BD2D  9a1aa30000           lcall 0, 0xa31a  ; USER.SendMessage
loc_BD32:
9:BD32  c45e06               les bx, ptr [bp + 6]
9:BD35  26ff7706             push word ptr es:[bx + 6]
loc_BD39:
9:BD39  9a9fbb0000           lcall 0, 0xbb9f  ; USER.DestroyWindow
9:BD3E  e94b01               jmp 0xbe8c
9:BD41  db 90
loc_BD42:
9:BD42  6a03                 push 3
9:BD44  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:BD49  9aba2072bd           lcall 0xbd72, 0x20ba  ; Registry_get@s3:20BA
9:BD4E  8946e4               mov word ptr [bp - 0x1c], ax
9:BD51  8956e6               mov word ptr [bp - 0x1a], dx
9:BD54  c45e06               les bx, ptr [bp + 6]
9:BD57  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:BD5D  b87100               mov ax, 0x71
9:BD60  8946e0               mov word ptr [bp - 0x20], ax
9:BD63  50                   push ax
9:BD64  52                   push dx
9:BD65  eb94                 jmp 0xbcfb
9:BD67  db 90
loc_BD68:
9:BD68  6a32                 push 0x32
9:BD6A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:BD6F  9aba208bbd           lcall 0xbd8b, 0x20ba  ; Registry_get@s3:20BA
9:BD74  8946e0               mov word ptr [bp - 0x20], ax
9:BD77  8956e2               mov word ptr [bp - 0x1e], dx
9:BD7A  c45e06               les bx, ptr [bp + 6]
9:BD7D  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:BD83  68c60f               push 0xfc6
9:BD86  52                   push dx
9:BD87  50                   push ax
9:BD88  9aaa79a7bd           lcall 0xbda7, 0x79aa  ; BuildingWindows::raise@s3:79AA
9:BD8D  0bc0                 or ax, ax
9:BD8F  0f85f900             jne 0xbe8c
9:BD93  c45e06               les bx, ptr [bp + 6]
9:BD96  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:BD9C  6a13                 push 0x13
9:BD9E  50                   push ax
9:BD9F  50                   push ax
9:BDA0  66ff76e0             push dword ptr [bp - 0x20]
9:BDA4  9a007314be           lcall 0xbe14, 0x7300  ; BuildingWindows::open@s3:7300
9:BDA9  e9e000               jmp 0xbe8c
loc_BDAC:
9:BDAC  c45e06               les bx, ptr [bp + 6]
9:BDAF  2683bfb60000         cmp word ptr es:[bx + 0xb6], 0
9:BDB5  7419                 je 0xbdd0
9:BDB7  26ffb7b600           push word ptr es:[bx + 0xb6]
9:BDBC  9a8ebb0000           lcall 0, 0xbb8e  ; USER.IsWindow
9:BDC1  0bc0                 or ax, ax
9:BDC3  740b                 je 0xbdd0
9:BDC5  c45e06               les bx, ptr [bp + 6]
9:BDC8  26ffb7b600           push word ptr es:[bx + 0xb6]
9:BDCD  e969ff               jmp 0xbd39
loc_BDD0:
9:BDD0  6a1b                 push 0x1b
9:BDD2  c45e06               les bx, ptr [bp + 6]
9:BDD5  26ff7706             push word ptr es:[bx + 6]
9:BDD9  66ff367c5b           push dword ptr [0x5b7c]
9:BDDE  9a40af98b7           lcall 0xb798, 0xaf40  ; DialogCtr::open@s8:AF40
9:BDE3  8946e0               mov word ptr [bp - 0x20], ax
9:BDE6  8956e2               mov word ptr [bp - 0x1e], dx
9:BDE9  c45ee0               les bx, ptr [bp - 0x20]
9:BDEC  268b4706             mov ax, word ptr es:[bx + 6]
9:BDF0  c45e06               les bx, ptr [bp + 6]
9:BDF3  268987b600           mov word ptr es:[bx + 0xb6], ax
9:BDF8  c45e06               les bx, ptr [bp + 6]
9:BDFB  26ffb7b600           push word ptr es:[bx + 0xb6]
9:BE00  6a01                 push 1
9:BE02  9a55b40000           lcall 0, 0xb455  ; USER.ShowWindow
9:BE07  e98200               jmp 0xbe8c
loc_BE0A:
9:BE0A  6a03                 push 3
9:BE0C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:BE11  9aba202abe           lcall 0xbe2a, 0x20ba  ; Registry_get@s3:20BA
9:BE16  8946e0               mov word ptr [bp - 0x20], ax
9:BE19  8956e2               mov word ptr [bp - 0x1e], dx
9:BE1C  c45e06               les bx, ptr [bp + 6]
9:BE1F  6626ffb7b000         push dword ptr es:[bx + 0xb0]
9:BE25  52                   push dx
9:BE26  50                   push ax
9:BE27  9aaca537be           lcall 0xbe37, 0xa5ac  ; Lab::topicOf@s3:A5AC
9:BE2C  8946e4               mov word ptr [bp - 0x1c], ax
9:BE2F  50                   push ax
9:BE30  66ff76e0             push dword ptr [bp - 0x20]
9:BE34  9a8aa547be           lcall 0xbe47, 0xa58a  ; Player1::isPriority@s3:A58A
9:BE39  0bc0                 or ax, ax
9:BE3B  750c                 jne 0xbe49
9:BE3D  66ff76e2             push dword ptr [bp - 0x1e]
9:BE41  ff76e0               push word ptr [bp - 0x20]
9:BE44  9a68a5e9b8           lcall 0xb8e9, 0xa568  ; Player1::topicPoints@s3:A568
loc_BE49:
9:BE49  c45e06               les bx, ptr [bp + 6]
9:BE4C  26ff7706             push word ptr es:[bx + 6]
9:BE50  ff760e               push word ptr [bp + 0xe]
9:BE53  9a6eab0000           lcall 0, 0xab6e  ; USER.GetDlgItem
9:BE58  50                   push ax
9:BE59  6a00                 push 0
9:BE5B  9ae4a70000           lcall 0, 0xa7e4  ; USER.EnableWindow
9:BE60  eb2a                 jmp 0xbe8c
loc_BE62:
9:BE62  2d0d01               sub ax, 0x10d
9:BE65  0f84d9fe             je 0xbd42
9:BE69  48                   dec ax
9:BE6A  0f84fafe             je 0xbd68
9:BE6E  2dad0a               sub ax, 0xaad
9:BE71  0f8437ff             je 0xbdac
9:BE75  48                   dec ax
9:BE76  7492                 je 0xbe0a
loc_BE78:
9:BE78  66ff760c             push dword ptr [bp + 0xc]
9:BE7C  66ff7608             push dword ptr [bp + 8]
9:BE80  ff7606               push word ptr [bp + 6]
9:BE83  90                   nop
9:BE84  0e                   push cs
9:BE85  e8c2f6               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:BE88  c9                   leave
9:BE89  ca0a00               retf 0xa
loc_BE8C:
9:BE8C  b80100               mov ax, 1
9:BE8F  99                   cdq
9:BE90  c9                   leave
9:BE91  ca0a00               retf 0xa

; ---------------- UgLabDlg::scalar_dtor@s9:BE94 size=170 callers=0
;   deleting destructor
9:BE94  c8040000             enter 4, 0
9:BE98  66ff7606             push dword ptr [bp + 6]
9:BE9C  90                   nop
9:BE9D  0e                   push cs
9:BE9E  e857f2               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:BEA1  f6460a01             test byte ptr [bp + 0xa], 1
9:BEA5  7409                 je 0xbeb0
9:BEA7  66ff7606             push dword ptr [bp + 6]
9:BEAB  9ace17fdb8           lcall 0xb8fd, 0x17ce  ; operator_delete@s1:17CE
loc_BEB0:
9:BEB0  8b4606               mov ax, word ptr [bp + 6]
9:BEB3  8b5608               mov dx, word ptr [bp + 8]
9:BEB6  c9                   leave
9:BEB7  ca0600               retf 6
9:BEBA  db 94 be c4 be 10 3a 7c b9 d2 b8 c8 be 64 b8 cc be
9:BECA  db 4a b5 d0 be 26 b7 d4 be 56 7f d8 be b2 7b dc be
9:BEDA  db 1c 7f e0 be be b8 e4 be 86 7f e8 be 0c 80 ec be
9:BEEA  db 54 80 f0 be 72 b3 f4 be 58 81 f8 be b6 81 fc be
9:BEFA  db fe 81 04 bf ea 60 10 bf 4a 82 08 bf 66 82 0c bf
9:BF0A  db de 78 18 bf ee 60 14 bf f4 60 20 bf c8 b4 1c bf
9:BF1A  db 5a bb 24 bf fe 60 b8 b7 7e 80 28 bf 3c b4 2c bf
9:BF2A  db 5e b4 30 bf 7c b1 38 bf 4c 88 e1 bd e2 bb 3c bf
9:BF3A  db 78 bb 30 b8

; ---------------- TreeView::TreeView@s9:BF3E FAR size=84 callers=4
;   the research tree's lines (vtable C53E)
9:BF3E  c8100000             enter 0x10, 0
9:BF42  c45e06               les bx, ptr [bp + 6]
9:BF45  26c7079a38           mov word ptr es:[bx], 0x389a
9:BF4A  26c747025cbf         mov word ptr es:[bx + 2], 0xbf5c  ; SEGMENT s2:0000
9:BF50  c45e06               les bx, ptr [bp + 6]
9:BF53  26c707a83a           mov word ptr es:[bx], 0x3aa8
9:BF58  26c7470271bf         mov word ptr es:[bx + 2], 0xbf71  ; SEGMENT s2:0000
9:BF5E  8b460a               mov ax, word ptr [bp + 0xa]
9:BF61  c45e06               les bx, ptr [bp + 6]
9:BF64  26894704             mov word ptr es:[bx + 4], ax
9:BF68  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
9:BF6D  26c74702c0be         mov word ptr es:[bx + 2], 0xbec0  ; SEGMENT s2:0000
9:BF73  c45e06               les bx, ptr [bp + 6]
9:BF76  6626c7470600000000   mov dword ptr es:[bx + 6], 0
9:BF7F  26c7073ec5           mov word ptr es:[bx], 0xc53e
9:BF84  26c74702bcbe         mov word ptr es:[bx + 2], 0xbebc  ; SEGMENT s9:0000
9:BF8A  8bc3                 mov ax, bx
9:BF8C  8cc2                 mov dx, es
9:BF8E  c9                   leave
9:BF8F  ca0600               retf 6

; ---------------- TreeView::~TreeView@s9:BF92 FAR size=76 callers=1
;   dtor
9:BF92  c80c0000             enter 0xc, 0
9:BF96  c45e06               les bx, ptr [bp + 6]
9:BF99  26c7073ec5           mov word ptr es:[bx], 0xc53e
9:BF9E  26c7470288bf         mov word ptr es:[bx + 2], 0xbf88  ; SEGMENT s9:0000
9:BFA4  06                   push es
9:BFA5  53                   push bx
9:BFA6  6626ff7706           push dword ptr es:[bx + 6]
9:BFAB  9aa61ebbbf           lcall 0xbfbb, 0x1ea6  ; RegObj::removeListener@s3:1EA6
9:BFB0  c45e06               les bx, ptr [bp + 6]
9:BFB3  6626ff7706           push dword ptr es:[bx + 6]
9:BFB8  9aa02f89bc           lcall 0xbc89, 0x2fa0  ; ResearchTreeBase::destroyButtons@s3:2FA0
9:BFBD  c45e06               les bx, ptr [bp + 6]
9:BFC0  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
9:BFC5  26c74702d7bf         mov word ptr es:[bx + 2], 0xbfd7  ; SEGMENT s2:0000
9:BFCB  c45e06               les bx, ptr [bp + 6]
9:BFCE  26c7079a38           mov word ptr es:[bx], 0x389a
9:BFD3  26c747024ebf         mov word ptr es:[bx + 2], 0xbf4e  ; SEGMENT s2:0000
9:BFD9  c9                   leave
9:BFDA  ca0400               retf 4
9:BFDD  db 00

; ---------------- TreeView::attach@s9:BFDE FAR size=74 callers=4
;   attaches a tree
9:BFDE  c8080000             enter 8, 0
9:BFE2  66ff7606             push dword ptr [bp + 6]
9:BFE6  6a00                 push 0
9:BFE8  c45e0a               les bx, ptr [bp + 0xa]
9:BFEB  06                   push es
9:BFEC  53                   push bx
9:BFED  c45e06               les bx, ptr [bp + 6]
9:BFF0  668b460a             mov eax, dword ptr [bp + 0xa]
9:BFF4  8b560c               mov dx, word ptr [bp + 0xc]
9:BFF7  6626894706           mov dword ptr es:[bx + 6], eax
9:BFFC  8ec2                 mov es, dx
9:BFFE  8bd8                 mov bx, ax
9:C000  26c41f               les bx, ptr es:[bx]
9:C003  26ff5f04             lcall es:[bx + 4]
9:C007  c45e06               les bx, ptr [bp + 6]
9:C00A  268b4704             mov ax, word ptr es:[bx + 4]
9:C00E  26c45f06             les bx, ptr es:[bx + 6]
9:C012  26894722             mov word ptr es:[bx + 0x22], ax
9:C016  c45e06               les bx, ptr [bp + 6]
9:C019  6626ff7706           push dword ptr es:[bx + 6]
9:C01E  9ae22eaebf           lcall 0xbfae, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:C023  c9                   leave
9:C024  ca0800               retf 8
9:C027  db 00

; ---------------- TreeView::onNotify@s9:C028 FAR size=510 callers=0
;   apis: USER.GetClientRect, USER.InvalidateRect
;   (vslot 1) invalidates
9:C028  c8320000             enter 0x32, 0
9:C02C  56                   push si
9:C02D  8b460a               mov ax, word ptr [bp + 0xa]
9:C030  e9df01               jmp 0xc212
9:C033  db 90
loc_C034:
9:C034  c45e06               les bx, ptr [bp + 6]
9:C037  26ff7704             push word ptr es:[bx + 4]
9:C03B  8d46f8               lea ax, [bp - 8]
9:C03E  16                   push ss
9:C03F  50                   push ax
9:C040  9a03c10000           lcall 0, 0xc103  ; USER.GetClientRect
9:C045  c45e06               les bx, ptr [bp + 6]
9:C048  66268b4706           mov eax, dword ptr es:[bx + 6]
9:C04D  052a00               add ax, 0x2a
9:C050  668946f0             mov dword ptr [bp - 0x10], eax
9:C054  26c45f06             les bx, ptr es:[bx + 6]
9:C058  268b4716             mov ax, word ptr es:[bx + 0x16]
9:C05C  8946ee               mov word ptr [bp - 0x12], ax
9:C05F  c45e06               les bx, ptr [bp + 6]
9:C062  26c45f06             les bx, ptr es:[bx + 6]
9:C066  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:C06A  8946f6               mov word ptr [bp - 0xa], ax
9:C06D  c45e06               les bx, ptr [bp + 6]
9:C070  26c45f06             les bx, ptr es:[bx + 6]
9:C074  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:C078  8946f4               mov word ptr [bp - 0xc], ax
9:C07B  837eee00             cmp word ptr [bp - 0x12], 0
9:C07F  7505                 jne 0xc086
9:C081  8b46f6               mov ax, word ptr [bp - 0xa]
9:C084  eb30                 jmp 0xc0b6
loc_C086:
9:C086  837eee01             cmp word ptr [bp - 0x12], 1
9:C08A  7e06                 jle 0xc092
9:C08C  b80200               mov ax, 2
9:C08F  eb04                 jmp 0xc095
9:C091  db 90
loc_C092:
9:C092  b80100               mov ax, 1
loc_C095:
9:C095  2946ee               sub word ptr [bp - 0x12], ax
9:C098  8b5eee               mov bx, word ptr [bp - 0x12]
9:C09B  c1e302               shl bx, 2
9:C09E  c476f0               les si, ptr [bp - 0x10]
9:C0A1  66268b00             mov eax, dword ptr es:[bx + si]
9:C0A5  051e00               add ax, 0x1e
9:C0A8  668946d6             mov dword ptr [bp - 0x2a], eax
9:C0AC  c45ed6               les bx, ptr [bp - 0x2a]
9:C0AF  268b4704             mov ax, word ptr es:[bx + 4]
9:C0B3  260307               add ax, word ptr es:[bx]
loc_C0B6:
9:C0B6  8946f8               mov word ptr [bp - 8], ax
9:C0B9  8b46f4               mov ax, word ptr [bp - 0xc]
9:C0BC  8946fa               mov word ptr [bp - 6], ax
9:C0BF  c45e06               les bx, ptr [bp + 6]
9:C0C2  26c45f06             les bx, ptr es:[bx + 6]
9:C0C6  268b471e             mov ax, word ptr es:[bx + 0x1e]
9:C0CA  8946f6               mov word ptr [bp - 0xa], ax
9:C0CD  c45e06               les bx, ptr [bp + 6]
9:C0D0  26c45f06             les bx, ptr es:[bx + 6]
9:C0D4  268b4720             mov ax, word ptr es:[bx + 0x20]
9:C0D8  8946f4               mov word ptr [bp - 0xc], ax
9:C0DB  8b46f6               mov ax, word ptr [bp - 0xa]
9:C0DE  8946fc               mov word ptr [bp - 4], ax
9:C0E1  836efe05             sub word ptr [bp - 2], 5
9:C0E5  e9a700               jmp 0xc18f
loc_C0E8:
9:C0E8  33c0                 xor ax, ax
9:C0EA  8946f8               mov word ptr [bp - 8], ax
9:C0ED  8946fa               mov word ptr [bp - 6], ax
9:C0F0  8946fc               mov word ptr [bp - 4], ax
9:C0F3  8946fe               mov word ptr [bp - 2], ax
9:C0F6  c45e06               les bx, ptr [bp + 6]
9:C0F9  26ff7704             push word ptr es:[bx + 4]
9:C0FD  8d46f8               lea ax, [bp - 8]
9:C100  16                   push ss
9:C101  50                   push ax
9:C102  9a33bc0000           lcall 0, 0xbc33  ; USER.GetClientRect
9:C107  c45e06               les bx, ptr [bp + 6]
9:C10A  26c45f06             les bx, ptr es:[bx + 6]
9:C10E  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:C112  8946d6               mov word ptr [bp - 0x2a], ax
9:C115  c45e06               les bx, ptr [bp + 6]
9:C118  26c45f06             les bx, ptr es:[bx + 6]
9:C11C  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:C120  8946da               mov word ptr [bp - 0x26], ax
9:C123  8b46d6               mov ax, word ptr [bp - 0x2a]
9:C126  8946f8               mov word ptr [bp - 8], ax
9:C129  c45e06               les bx, ptr [bp + 6]
9:C12C  26c45f06             les bx, ptr es:[bx + 6]
9:C130  268b471e             mov ax, word ptr es:[bx + 0x1e]
9:C134  8946d6               mov word ptr [bp - 0x2a], ax
9:C137  c45e06               les bx, ptr [bp + 6]
9:C13A  26c45f06             les bx, ptr es:[bx + 6]
9:C13E  268b4720             mov ax, word ptr es:[bx + 0x20]
9:C142  8946da               mov word ptr [bp - 0x26], ax
9:C145  8b46d6               mov ax, word ptr [bp - 0x2a]
9:C148  8946fc               mov word ptr [bp - 4], ax
9:C14B  836efe05             sub word ptr [bp - 2], 5
9:C14F  c45e06               les bx, ptr [bp + 6]
9:C152  66268b4706           mov eax, dword ptr es:[bx + 6]
9:C157  052a00               add ax, 0x2a
9:C15A  668946de             mov dword ptr [bp - 0x22], eax
9:C15E  26c45f06             les bx, ptr es:[bx + 6]
9:C162  268b4716             mov ax, word ptr es:[bx + 0x16]
9:C166  8946e2               mov word ptr [bp - 0x1e], ax
9:C169  0bc0                 or ax, ax
9:C16B  7e22                 jle 0xc18f
9:C16D  8bf0                 mov si, ax
9:C16F  c1e602               shl si, 2
9:C172  c45ede               les bx, ptr [bp - 0x22]
9:C175  66268b40fc           mov eax, dword ptr es:[bx + si - 4]
9:C17A  051e00               add ax, 0x1e
9:C17D  668946d2             mov dword ptr [bp - 0x2e], eax
9:C181  c45ed2               les bx, ptr [bp - 0x2e]
9:C184  268b4702             mov ax, word ptr es:[bx + 2]
9:C188  26034706             add ax, word ptr es:[bx + 6]
9:C18C  8946fa               mov word ptr [bp - 6], ax
loc_C18F:
9:C18F  c45e06               les bx, ptr [bp + 6]
9:C192  26ff7704             push word ptr es:[bx + 4]
9:C196  8d46f8               lea ax, [bp - 8]
9:C199  16                   push ss
9:C19A  50                   push ax
9:C19B  6a01                 push 1
loc_C19D:
9:C19D  9a79bc0000           lcall 0, 0xbc79  ; USER.InvalidateRect
9:C1A2  5e                   pop si
9:C1A3  c9                   leave
9:C1A4  ca0600               retf 6
9:C1A7  db 90
loc_C1A8:
9:C1A8  c45e06               les bx, ptr [bp + 6]
9:C1AB  66268b4706           mov eax, dword ptr es:[bx + 6]
9:C1B0  268b5708             mov dx, word ptr es:[bx + 8]
9:C1B4  052a00               add ax, 0x2a
9:C1B7  668946ce             mov dword ptr [bp - 0x32], eax
9:C1BB  0bd0                 or dx, ax
9:C1BD  7462                 je 0xc221
9:C1BF  26c45f06             les bx, ptr es:[bx + 6]
9:C1C3  268b4716             mov ax, word ptr es:[bx + 0x16]
9:C1C7  48                   dec ax
9:C1C8  8946d6               mov word ptr [bp - 0x2a], ax
9:C1CB  8bd8                 mov bx, ax
9:C1CD  c1e302               shl bx, 2
9:C1D0  c476ce               les si, ptr [bp - 0x32]
9:C1D3  66268b00             mov eax, dword ptr es:[bx + si]
9:C1D7  051e00               add ax, 0x1e
9:C1DA  668946da             mov dword ptr [bp - 0x26], eax
9:C1DE  c45eda               les bx, ptr [bp - 0x26]
9:C1E1  268b4702             mov ax, word ptr es:[bx + 2]
9:C1E5  2d0800               sub ax, 8
9:C1E8  8946fa               mov word ptr [bp - 6], ax
9:C1EB  268b07               mov ax, word ptr es:[bx]
9:C1EE  8946f8               mov word ptr [bp - 8], ax
9:C1F1  268b4704             mov ax, word ptr es:[bx + 4]
9:C1F5  260307               add ax, word ptr es:[bx]
9:C1F8  8946fc               mov word ptr [bp - 4], ax
9:C1FB  268b4702             mov ax, word ptr es:[bx + 2]
9:C1FF  8946fe               mov word ptr [bp - 2], ax
9:C202  c45e06               les bx, ptr [bp + 6]
9:C205  26ff7704             push word ptr es:[bx + 4]
9:C209  8d46f8               lea ax, [bp - 8]
9:C20C  16                   push ss
9:C20D  50                   push ax
9:C20E  6a00                 push 0
9:C210  eb8b                 jmp 0xc19d
loc_C212:
9:C212  2d0800               sub ax, 8
9:C215  0f841bfe             je 0xc034
9:C219  48                   dec ax
9:C21A  0f84cafe             je 0xc0e8
9:C21E  48                   dec ax
9:C21F  7487                 je 0xc1a8
loc_C221:
9:C221  5e                   pop si
9:C222  c9                   leave
9:C223  ca0600               retf 6

; ---------------- TreeView::paint@s9:C226 size=220 callers=0
;   apis: GDI.CreatePen, GDI.CreateSolidBrush, GDI.DeleteObject, GDI.SelectObject, USER.BeginPaint, USER.EndPaint, USER.FrameRect, USER.GetClientRect
;   (vslot 2)
9:C226  c8480000             enter 0x48, 0
9:C22A  c45e06               les bx, ptr [bp + 6]
9:C22D  26ff7704             push word ptr es:[bx + 4]
9:C231  8d46e0               lea ax, [bp - 0x20]
9:C234  16                   push ss
9:C235  50                   push ax
9:C236  9a82990000           lcall 0, 0x9982  ; USER.BeginPaint
9:C23B  8946de               mov word ptr [bp - 0x22], ax
9:C23E  666800800000         push 0x8000
9:C244  9a85b30000           lcall 0, 0xb385  ; GDI.CreateSolidBrush
9:C249  8946dc               mov word ptr [bp - 0x24], ax
9:C24C  c45e06               les bx, ptr [bp + 6]
9:C24F  26ff7704             push word ptr es:[bx + 4]
9:C253  8d46d0               lea ax, [bp - 0x30]
9:C256  16                   push ss
9:C257  50                   push ax
9:C258  9a41c00000           lcall 0, 0xc041  ; USER.GetClientRect
9:C25D  c45e06               les bx, ptr [bp + 6]
9:C260  26c45f06             les bx, ptr es:[bx + 6]
9:C264  268b471a             mov ax, word ptr es:[bx + 0x1a]
9:C268  8946da               mov word ptr [bp - 0x26], ax
9:C26B  c45e06               les bx, ptr [bp + 6]
9:C26E  26c45f06             les bx, ptr es:[bx + 6]
9:C272  268b471c             mov ax, word ptr es:[bx + 0x1c]
9:C276  8946d8               mov word ptr [bp - 0x28], ax
9:C279  8346d202             add word ptr [bp - 0x2e], 2
9:C27D  8b46da               mov ax, word ptr [bp - 0x26]
9:C280  2d0a00               sub ax, 0xa
9:C283  8946d0               mov word ptr [bp - 0x30], ax
9:C286  836ed402             sub word ptr [bp - 0x2c], 2
9:C28A  836ed602             sub word ptr [bp - 0x2a], 2
9:C28E  ff76de               push word ptr [bp - 0x22]
9:C291  8d46d0               lea ax, [bp - 0x30]
9:C294  16                   push ss
9:C295  50                   push ax
9:C296  ff76dc               push word ptr [bp - 0x24]
9:C299  9ab5830000           lcall 0, 0x83b5  ; USER.FrameRect
9:C29E  ff76dc               push word ptr [bp - 0x24]
9:C2A1  9ae8c20000           lcall 0, 0xc2e8  ; GDI.DeleteObject
9:C2A6  ff76de               push word ptr [bp - 0x22]
9:C2A9  666a02               push 2
9:C2AC  666880800000         push 0x8080
9:C2B2  9a4f9a0000           lcall 0, 0x9a4f  ; GDI.CreatePen
9:C2B7  8946ce               mov word ptr [bp - 0x32], ax
9:C2BA  50                   push ax
9:C2BB  9ae2c20000           lcall 0, 0xc2e2  ; GDI.SelectObject
9:C2C0  8946cc               mov word ptr [bp - 0x34], ax
9:C2C3  ff76de               push word ptr [bp - 0x22]
9:C2C6  66ff7606             push dword ptr [bp + 6]
9:C2CA  90                   nop
9:C2CB  0e                   push cs
9:C2CC  e83300               call 0xc302  ; TreeView::drawLines@s9:C302
9:C2CF  ff76de               push word ptr [bp - 0x22]
9:C2D2  66ff7606             push dword ptr [bp + 6]
9:C2D6  90                   nop
9:C2D7  0e                   push cs
9:C2D8  e8b300               call 0xc38e  ; TreeView::drawBranch@s9:C38E
9:C2DB  ff76de               push word ptr [bp - 0x22]
9:C2DE  ff76cc               push word ptr [bp - 0x34]
9:C2E1  9aeb990000           lcall 0, 0x99eb  ; GDI.SelectObject
9:C2E6  50                   push ax
9:C2E7  9a35b10000           lcall 0, 0xb135  ; GDI.DeleteObject
9:C2EC  c45e06               les bx, ptr [bp + 6]
9:C2EF  26ff7704             push word ptr es:[bx + 4]
9:C2F3  8d46e0               lea ax, [bp - 0x20]
9:C2F6  16                   push ss
9:C2F7  50                   push ax
9:C2F8  9ad79c0000           lcall 0, 0x9cd7  ; USER.EndPaint
9:C2FD  c9                   leave
9:C2FE  ca0400               retf 4
9:C301  db 00

; ---------------- TreeView::drawLines@s9:C302 FAR size=140 callers=1
;   apis: GDI.LineTo, GDI.MoveTo
;   lines between buttons
9:C302  c81a0000             enter 0x1a, 0
9:C306  56                   push si
9:C307  c45e06               les bx, ptr [bp + 6]
9:C30A  26c45f06             les bx, ptr es:[bx + 6]
9:C30E  268b4716             mov ax, word ptr es:[bx + 0x16]
9:C312  8946fe               mov word ptr [bp - 2], ax
9:C315  3d0200               cmp ax, 2
9:C318  7c6f                 jl 0xc389
9:C31A  c45e06               les bx, ptr [bp + 6]
9:C31D  66268b4706           mov eax, dword ptr es:[bx + 6]
9:C322  052a00               add ax, 0x2a
9:C325  668946fa             mov dword ptr [bp - 6], eax
9:C329  c45efa               les bx, ptr [bp - 6]
9:C32C  66268b07             mov eax, dword ptr es:[bx]
9:C330  051e00               add ax, 0x1e
9:C333  668946f6             mov dword ptr [bp - 0xa], eax
9:C337  ff760a               push word ptr [bp + 0xa]
9:C33A  c45ef6               les bx, ptr [bp - 0xa]
9:C33D  268b4704             mov ax, word ptr es:[bx + 4]
9:C341  99                   cdq
9:C342  2bc2                 sub ax, dx
9:C344  d1f8                 sar ax, 1
9:C346  260307               add ax, word ptr es:[bx]
9:C349  50                   push ax
9:C34A  268b4702             mov ax, word ptr es:[bx + 2]
9:C34E  26034706             add ax, word ptr es:[bx + 6]
9:C352  50                   push ax
9:C353  9a899a0000           lcall 0, 0x9a89  ; GDI.MoveTo
9:C358  8b76fe               mov si, word ptr [bp - 2]
9:C35B  c1e602               shl si, 2
9:C35E  c45efa               les bx, ptr [bp - 6]
9:C361  66268b40fc           mov eax, dword ptr es:[bx + si - 4]
9:C366  051e00               add ax, 0x1e
9:C369  668946f6             mov dword ptr [bp - 0xa], eax
9:C36D  ff760a               push word ptr [bp + 0xa]
9:C370  c45ef6               les bx, ptr [bp - 0xa]
9:C373  268b4704             mov ax, word ptr es:[bx + 4]
9:C377  99                   cdq
9:C378  2bc2                 sub ax, dx
9:C37A  d1f8                 sar ax, 1
9:C37C  260307               add ax, word ptr es:[bx]
9:C37F  50                   push ax
9:C380  26ff7702             push word ptr es:[bx + 2]
9:C384  9a979a0000           lcall 0, 0x9a97  ; GDI.LineTo
loc_C389:
9:C389  5e                   pop si
9:C38A  c9                   leave
9:C38B  ca0600               retf 6

; ---------------- TreeView::drawBranch@s9:C38E FAR size=394 callers=1
;   apis: GDI.GetCurrentPosition, GDI.LineTo, GDI.MoveTo
;   a branch
9:C38E  c8320000             enter 0x32, 0
9:C392  56                   push si
9:C393  c45e06               les bx, ptr [bp + 6]
9:C396  26c45f06             les bx, ptr es:[bx + 6]
9:C39A  268b4718             mov ax, word ptr es:[bx + 0x18]
9:C39E  8946fe               mov word ptr [bp - 2], ax
9:C3A1  0bc0                 or ax, ax
9:C3A3  0f846c01             je 0xc513
9:C3A7  c45e06               les bx, ptr [bp + 6]
9:C3AA  26c45f06             les bx, ptr es:[bx + 6]
9:C3AE  26837f1600           cmp word ptr es:[bx + 0x16], 0
9:C3B3  0f845c01             je 0xc513
9:C3B7  c45e06               les bx, ptr [bp + 6]
9:C3BA  6626ff7706           push dword ptr es:[bx + 6]
9:C3BF  9ae22e21c0           lcall 0xc021, 0x2ee2  ; ResearchTreeBase::toggle@s3:2EE2
9:C3C4  8946fa               mov word ptr [bp - 6], ax
9:C3C7  8956fc               mov word ptr [bp - 4], dx
9:C3CA  662bc0               sub eax, eax
9:C3CD  668946f6             mov dword ptr [bp - 0xa], eax
9:C3D1  8946e8               mov word ptr [bp - 0x18], ax
9:C3D4  eb6b                 jmp 0xc441
loc_C3D6:
9:C3D6  8b5ee8               mov bx, word ptr [bp - 0x18]
9:C3D9  c1e302               shl bx, 2
9:C3DC  c476fa               les si, ptr [bp - 6]
9:C3DF  66268b00             mov eax, dword ptr es:[bx + si]
9:C3E3  051e00               add ax, 0x1e
9:C3E6  668946f6             mov dword ptr [bp - 0xa], eax
9:C3EA  c45ef6               les bx, ptr [bp - 0xa]
9:C3ED  268b4706             mov ax, word ptr es:[bx + 6]
9:C3F1  99                   cdq
9:C3F2  2bc2                 sub ax, dx
9:C3F4  d1f8                 sar ax, 1
9:C3F6  26034702             add ax, word ptr es:[bx + 2]
9:C3FA  8946e4               mov word ptr [bp - 0x1c], ax
9:C3FD  ff760a               push word ptr [bp + 0xa]
9:C400  26ff37               push word ptr es:[bx]
9:C403  50                   push ax
9:C404  9ab8c40000           lcall 0, 0xc4b8  ; GDI.MoveTo
9:C409  ff760a               push word ptr [bp + 0xa]
9:C40C  c45ef6               les bx, ptr [bp - 0xa]
9:C40F  268b07               mov ax, word ptr es:[bx]
9:C412  2d0f00               sub ax, 0xf
9:C415  50                   push ax
9:C416  ff76e4               push word ptr [bp - 0x1c]
9:C419  9ad4c40000           lcall 0, 0xc4d4  ; GDI.LineTo
9:C41E  ff760a               push word ptr [bp + 0xa]
9:C421  9adcc40000           lcall 0, 0xc4dc  ; GDI.GetCurrentPosition
9:C426  8946ea               mov word ptr [bp - 0x16], ax
9:C429  837ee800             cmp word ptr [bp - 0x18], 0
9:C42D  7506                 jne 0xc435
9:C42F  8946f2               mov word ptr [bp - 0xe], ax
9:C432  8956f4               mov word ptr [bp - 0xc], dx
loc_C435:
9:C435  8b46ea               mov ax, word ptr [bp - 0x16]
9:C438  8946ee               mov word ptr [bp - 0x12], ax
9:C43B  8956f0               mov word ptr [bp - 0x10], dx
9:C43E  ff46e8               inc word ptr [bp - 0x18]
loc_C441:
9:C441  8b46fe               mov ax, word ptr [bp - 2]
9:C444  3946e8               cmp word ptr [bp - 0x18], ax
9:C447  7c8d                 jl 0xc3d6
9:C449  c45e06               les bx, ptr [bp + 6]
9:C44C  26c45f06             les bx, ptr es:[bx + 6]
9:C450  26837f2400           cmp word ptr es:[bx + 0x24], 0
9:C455  7404                 je 0xc45b
9:C457  836ef40d             sub word ptr [bp - 0xc], 0xd
loc_C45B:
9:C45B  c45e06               les bx, ptr [bp + 6]
9:C45E  26c45f06             les bx, ptr es:[bx + 6]
9:C462  26837f2600           cmp word ptr es:[bx + 0x26], 0
9:C467  7404                 je 0xc46d
9:C469  8346f00d             add word ptr [bp - 0x10], 0xd
loc_C46D:
9:C46D  c45e06               les bx, ptr [bp + 6]
9:C470  66268b4706           mov eax, dword ptr es:[bx + 6]
9:C475  052a00               add ax, 0x2a
9:C478  668946fa             mov dword ptr [bp - 6], eax
9:C47C  26c45f06             les bx, ptr es:[bx + 6]
9:C480  268b4716             mov ax, word ptr es:[bx + 0x16]
9:C484  8946fe               mov word ptr [bp - 2], ax
9:C487  8bf0                 mov si, ax
9:C489  c1e602               shl si, 2
9:C48C  c45efa               les bx, ptr [bp - 6]
9:C48F  66268b40fc           mov eax, dword ptr es:[bx + si - 4]
9:C494  051e00               add ax, 0x1e
9:C497  668946f6             mov dword ptr [bp - 0xa], eax
9:C49B  ff760a               push word ptr [bp + 0xa]
9:C49E  c45ef6               les bx, ptr [bp - 0xa]
9:C4A1  268b4704             mov ax, word ptr es:[bx + 4]
9:C4A5  260307               add ax, word ptr es:[bx]
9:C4A8  50                   push ax
9:C4A9  268b4706             mov ax, word ptr es:[bx + 6]
9:C4AD  99                   cdq
9:C4AE  2bc2                 sub ax, dx
9:C4B0  d1f8                 sar ax, 1
9:C4B2  26034702             add ax, word ptr es:[bx + 2]
9:C4B6  50                   push ax
9:C4B7  9a01c50000           lcall 0, 0xc501  ; GDI.MoveTo
9:C4BC  ff760a               push word ptr [bp + 0xa]
9:C4BF  ff76f2               push word ptr [bp - 0xe]
9:C4C2  c45ef6               les bx, ptr [bp - 0xa]
9:C4C5  268b4706             mov ax, word ptr es:[bx + 6]
9:C4C9  99                   cdq
9:C4CA  2bc2                 sub ax, dx
9:C4CC  d1f8                 sar ax, 1
9:C4CE  26034702             add ax, word ptr es:[bx + 2]
9:C4D2  50                   push ax
9:C4D3  9a0fc50000           lcall 0, 0xc50f  ; GDI.LineTo
9:C4D8  ff760a               push word ptr [bp + 0xa]
9:C4DB  9affff0000           lcall 0, 0xffff  ; GDI.GetCurrentPosition
9:C4E0  8946ea               mov word ptr [bp - 0x16], ax
9:C4E3  8b46f4               mov ax, word ptr [bp - 0xc]
9:C4E6  3bd0                 cmp dx, ax
9:C4E8  7d03                 jge 0xc4ed
9:C4EA  8956f4               mov word ptr [bp - 0xc], dx
loc_C4ED:
9:C4ED  8b46f0               mov ax, word ptr [bp - 0x10]
9:C4F0  3bd0                 cmp dx, ax
9:C4F2  7e03                 jle 0xc4f7
9:C4F4  8956f0               mov word ptr [bp - 0x10], dx
loc_C4F7:
9:C4F7  ff760a               push word ptr [bp + 0xa]
9:C4FA  ff76f2               push word ptr [bp - 0xe]
9:C4FD  ff76f4               push word ptr [bp - 0xc]
9:C500  9a54c30000           lcall 0, 0xc354  ; GDI.MoveTo
9:C505  ff760a               push word ptr [bp + 0xa]
9:C508  ff76ee               push word ptr [bp - 0x12]
9:C50B  ff76f0               push word ptr [bp - 0x10]
9:C50E  9a85c30000           lcall 0, 0xc385  ; GDI.LineTo
loc_C513:
9:C513  5e                   pop si
9:C514  c9                   leave
9:C515  ca0600               retf 6

; ---------------- TreeView::scalar_dtor@s9:C518 FAR size=50 callers=0
;   deleting destructor
9:C518  55                   push bp
9:C519  8bec                 mov bp, sp
9:C51B  66ff7606             push dword ptr [bp + 6]
9:C51F  90                   nop
9:C520  0e                   push cs
9:C521  e86efa               call 0xbf92  ; TreeView::~TreeView@s9:BF92
9:C524  f6460a01             test byte ptr [bp + 0xa], 1
9:C528  7409                 je 0xc533
9:C52A  66ff7606             push dword ptr [bp + 6]
9:C52E  9ace17aebe           lcall 0xbeae, 0x17ce  ; operator_delete@s1:17CE
loc_C533:
9:C533  8b4606               mov ax, word ptr [bp + 6]
9:C536  8b5608               mov dx, word ptr [bp + 8]
9:C539  c9                   leave
9:C53A  ca0600               retf 6
9:C53D  db 90 18 c5 44 c5 28 c0 48 c5 26 c2 a2 bf

; ---------------- TreeButton::TreeButton@s9:C54A FAR size=98 callers=3
;   a research topic button (vtable C9F2)
9:C54A  c8060000             enter 6, 0
9:C54E  ff7610               push word ptr [bp + 0x10]
9:C551  c45e0c               les bx, ptr [bp + 0xc]
9:C554  268b4712             mov ax, word ptr es:[bx + 0x12]
9:C558  05c800               add ax, 0xc8
9:C55B  50                   push ax
9:C55C  666a00               push 0
9:C55F  6a00                 push 0
9:C561  06                   push es
9:C562  53                   push bx
9:C563  26c41f               les bx, ptr es:[bx]
9:C566  26ff5f14             lcall es:[bx + 0x14]
9:C56A  52                   push dx
9:C56B  50                   push ax
9:C56C  6a00                 push 0
9:C56E  66ff7606             push dword ptr [bp + 6]
9:C572  90                   nop
9:C573  0e                   push cs
9:C574  e841ca               call 0x8fb8  ; OPCtrl::OPCtrl@s9:8FB8
9:C577  668b460c             mov eax, dword ptr [bp + 0xc]
9:C57B  c45e06               les bx, ptr [bp + 6]
9:C57E  6626894742           mov dword ptr es:[bx + 0x42], eax
9:C583  26c747460000         mov word ptr es:[bx + 0x46], 0
9:C589  8b460a               mov ax, word ptr [bp + 0xa]
9:C58C  26894748             mov word ptr es:[bx + 0x48], ax
9:C590  26c707f2c9           mov word ptr es:[bx], 0xc9f2
9:C595  26c7470240c5         mov word ptr es:[bx + 2], 0xc540  ; SEGMENT s9:0000
9:C59B  06                   push es
9:C59C  53                   push bx
9:C59D  90                   nop
9:C59E  0e                   push cs
9:C59F  e88e00               call 0xc630  ; TreeButton::loadPicture@s9:C630
9:C5A2  8b4606               mov ax, word ptr [bp + 6]
9:C5A5  8b5608               mov dx, word ptr [bp + 8]
9:C5A8  c9                   leave
9:C5A9  ca0c00               retf 0xc

; ---------------- TreeButton::~TreeButton@s9:C5AC FAR size=98 callers=1
;   dtor
9:C5AC  c8080000             enter 8, 0
9:C5B0  56                   push si
9:C5B1  c45e06               les bx, ptr [bp + 6]
9:C5B4  26c707f2c9           mov word ptr es:[bx], 0xc9f2
9:C5B9  26c7470299c5         mov word ptr es:[bx + 2], 0xc599  ; SEGMENT s9:0000
9:C5BF  ff0e025f             dec word ptr [0x5f02]
9:C5C3  753b                 jne 0xc600
9:C5C5  268b4708             mov ax, word ptr es:[bx + 8]
9:C5C9  268b570a             mov dx, word ptr es:[bx + 0xa]
9:C5CD  8bda                 mov bx, dx
9:C5CF  0bd0                 or dx, ax
9:C5D1  740e                 je 0xc5e1
9:C5D3  6a01                 push 1
9:C5D5  53                   push bx
9:C5D6  50                   push ax
9:C5D7  8ec3                 mov es, bx
9:C5D9  8bf0                 mov si, ax
9:C5DB  26c41c               les bx, ptr es:[si]
9:C5DE  26ff1f               lcall es:[bx]
loc_C5E1:
9:C5E1  c45e06               les bx, ptr [bp + 6]
9:C5E4  268b470c             mov ax, word ptr es:[bx + 0xc]
9:C5E8  268b570e             mov dx, word ptr es:[bx + 0xe]
9:C5EC  8bda                 mov bx, dx
9:C5EE  0bd8                 or bx, ax
9:C5F0  740e                 je 0xc600
9:C5F2  6a01                 push 1
9:C5F4  52                   push dx
9:C5F5  50                   push ax
9:C5F6  8ec2                 mov es, dx
9:C5F8  8bd8                 mov bx, ax
9:C5FA  26c41f               les bx, ptr es:[bx]
9:C5FD  26ff1f               lcall es:[bx]
loc_C600:
9:C600  66ff7606             push dword ptr [bp + 6]
9:C604  90                   nop
9:C605  0e                   push cs
9:C606  e815cb               call 0x911e  ; OPCtrl::~OPCtrl@s9:911E
9:C609  5e                   pop si
9:C60A  c9                   leave
9:C60B  ca0400               retf 4

; ---------------- TreeButton::nodeId@s9:C60E FAR size=34 callers=1
;   its node's id
9:C60E  c8060000             enter 6, 0
9:C612  c45e06               les bx, ptr [bp + 6]
9:C615  6626837f4200         cmp dword ptr es:[bx + 0x42], 0
9:C61B  740d                 je 0xc62a
9:C61D  26c45f42             les bx, ptr es:[bx + 0x42]
9:C621  268b4712             mov ax, word ptr es:[bx + 0x12]
9:C625  c9                   leave
9:C626  ca0400               retf 4
9:C629  db 90
loc_C62A:
9:C62A  33c0                 xor ax, ax
9:C62C  c9                   leave
9:C62D  ca0400               retf 4

; ---------------- TreeButton::loadPicture@s9:C630 FAR size=238 callers=1
;   treebutn picture
9:C630  c8060000             enter 6, 0
9:C634  57                   push di
9:C635  56                   push si
9:C636  c45e06               les bx, ptr [bp + 6]
9:C639  26c45f42             les bx, ptr es:[bx + 0x42]
9:C63D  26837f1271           cmp word ptr es:[bx + 0x12], 0x71
9:C642  0f84d100             je 0xc717
9:C646  b80500               mov ax, 5
9:C649  c45e06               les bx, ptr [bp + 6]
9:C64C  26894736             mov word ptr es:[bx + 0x36], ax
9:C650  26894726             mov word ptr es:[bx + 0x26], ax
9:C654  26894728             mov word ptr es:[bx + 0x28], ax
9:C658  268b4736             mov ax, word ptr es:[bx + 0x36]
9:C65C  26894730             mov word ptr es:[bx + 0x30], ax
9:C660  2689472e             mov word ptr es:[bx + 0x2e], ax
9:C664  833e025f00           cmp word ptr [0x5f02], 0
9:C669  7528                 jne 0xc693
9:C66B  68ff00               push 0xff
9:C66E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:C673  9a0a838ac6           lcall 0xc68a, 0x830a  ; ResLibr::picture@s3:830A
9:C678  a3045f               mov word ptr [0x5f04], ax
9:C67B  8916065f             mov word ptr [0x5f06], dx
9:C67F  680001               push 0x100
9:C682  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:C687  9a0a83c2c3           lcall 0xc3c2, 0x830a  ; ResLibr::picture@s3:830A
9:C68C  a3085f               mov word ptr [0x5f08], ax
9:C68F  89160a5f             mov word ptr [0x5f0a], dx
loc_C693:
9:C693  ff06025f             inc word ptr [0x5f02]
9:C697  66a1045f             mov eax, dword ptr [0x5f04]
9:C69B  c45e06               les bx, ptr [bp + 6]
9:C69E  6626894708           mov dword ptr es:[bx + 8], eax
9:C6A3  66a1085f             mov eax, dword ptr [0x5f08]
9:C6A7  662689470c           mov dword ptr es:[bx + 0xc], eax
9:C6AC  06                   push es
9:C6AD  53                   push bx
9:C6AE  90                   nop
9:C6AF  0e                   push cs
9:C6B0  e865cf               call 0x9618  ; OPCtrl::sizeFromPicture@s9:9618
9:C6B3  c45e06               les bx, ptr [bp + 6]
9:C6B6  26c747200000         mov word ptr es:[bx + 0x20], 0
9:C6BC  26c7471ec800         mov word ptr es:[bx + 0x1e], 0xc8
9:C6C2  26c74722a000         mov word ptr es:[bx + 0x22], 0xa0
9:C6C8  268b472c             mov ax, word ptr es:[bx + 0x2c]
9:C6CC  26034736             add ax, word ptr es:[bx + 0x36]
9:C6D0  26894724             mov word ptr es:[bx + 0x24], ax
9:C6D4  268b4736             mov ax, word ptr es:[bx + 0x36]
9:C6D8  8bc8                 mov cx, ax
9:C6DA  03c0                 add ax, ax
9:C6DC  03c1                 add ax, cx
9:C6DE  2603472a             add ax, word ptr es:[bx + 0x2a]
9:C6E2  2689472e             mov word ptr es:[bx + 0x2e], ax
9:C6E6  268b4736             mov ax, word ptr es:[bx + 0x36]
9:C6EA  26894730             mov word ptr es:[bx + 0x30], ax
9:C6EE  268b4722             mov ax, word ptr es:[bx + 0x22]
9:C6F2  262b4736             sub ax, word ptr es:[bx + 0x36]
9:C6F6  26894732             mov word ptr es:[bx + 0x32], ax
9:C6FA  26c7473c2500         mov word ptr es:[bx + 0x3c], 0x25
9:C700  06                   push es
9:C701  53                   push bx
9:C702  26c41f               les bx, ptr es:[bx]
9:C705  8bf3                 mov si, bx
9:C707  8cc7                 mov di, es
9:C709  26ff5f04             lcall es:[bx + 4]
9:C70D  66ff7606             push dword ptr [bp + 6]
9:C711  8ec7                 mov es, di
9:C713  26ff5c08             lcall es:[si + 8]
loc_C717:
9:C717  5e                   pop si
9:C718  5f                   pop di
9:C719  c9                   leave
9:C71A  ca0400               retf 4
9:C71D  db 00

; ---------------- TreeButton::layout@s9:C71E FAR size=46 callers=0
;   (vslot 1)
9:C71E  55                   push bp
9:C71F  8bec                 mov bp, sp
9:C721  66ff7606             push dword ptr [bp + 6]
9:C725  90                   nop
9:C726  0e                   push cs
9:C727  e828cb               call 0x9252  ; OPCtrl::layout@s9:9252
9:C72A  c45e06               les bx, ptr [bp + 6]
9:C72D  268b472c             mov ax, word ptr es:[bx + 0x2c]
9:C731  99                   cdq
9:C732  2bc2                 sub ax, dx
9:C734  d1f8                 sar ax, 1
9:C736  8bc8                 mov cx, ax
9:C738  268b4724             mov ax, word ptr es:[bx + 0x24]
9:C73C  99                   cdq
9:C73D  2bc2                 sub ax, dx
9:C73F  d1f8                 sar ax, 1
9:C741  2bc1                 sub ax, cx
9:C743  26894728             mov word ptr es:[bx + 0x28], ax
9:C747  c9                   leave
9:C748  ca0400               retf 4
9:C74B  db 00

; ---------------- TreeButton::paint@s9:C74C FAR size=270 callers=0
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.GetStockObject, GDI.LineTo, GDI.MoveTo, GDI.Rectangle, GDI.SelectObject, USER.SelectPalette
;   (vslot 3)
9:C74C  c8160000             enter 0x16, 0
9:C750  57                   push di
9:C751  56                   push si
9:C752  c41e3042             les bx, ptr [0x4230]
9:C756  268b470e             mov ax, word ptr es:[bx + 0xe]
9:C75A  268b5710             mov dx, word ptr es:[bx + 0x10]
9:C75E  8946fc               mov word ptr [bp - 4], ax
9:C761  8d460c               lea ax, [bp + 0xc]
9:C764  16                   push ss
9:C765  50                   push ax
9:C766  52                   push dx
9:C767  ff76fc               push word ptr [bp - 4]
9:C76A  9a084ec9bf           lcall 0xbfc9, 0x4e08  ; Palette::selectAndRealize@s2:4E08
9:C76F  8946fa               mov word ptr [bp - 6], ax
9:C772  c45e06               les bx, ptr [bp + 6]
9:C775  26c747460100         mov word ptr es:[bx + 0x46], 1
9:C77B  6a04                 push 4
9:C77D  9adc9b0000           lcall 0, 0x9bdc  ; GDI.GetStockObject
9:C782  8946f8               mov word ptr [bp - 8], ax
9:C785  666a01               push 1
9:C788  666802000001         push 0x1000002
9:C78E  9ab3c20000           lcall 0, 0xc2b3  ; GDI.CreatePen
9:C793  8946f6               mov word ptr [bp - 0xa], ax
9:C796  ff760c               push word ptr [bp + 0xc]
9:C799  ff76f8               push word ptr [bp - 8]
9:C79C  9aabc70000           lcall 0, 0xc7ab  ; GDI.SelectObject
9:C7A1  8946f4               mov word ptr [bp - 0xc], ax
9:C7A4  ff760c               push word ptr [bp + 0xc]
9:C7A7  ff76f6               push word ptr [bp - 0xa]
9:C7AA  9a01c80000           lcall 0, 0xc801  ; GDI.SelectObject
9:C7AF  8946f2               mov word ptr [bp - 0xe], ax
9:C7B2  ff760c               push word ptr [bp + 0xc]
9:C7B5  666a00               push 0
9:C7B8  c45e06               les bx, ptr [bp + 6]
9:C7BB  26ff7722             push word ptr es:[bx + 0x22]
9:C7BF  26ff7724             push word ptr es:[bx + 0x24]
9:C7C3  9affff0000           lcall 0, 0xffff  ; GDI.Rectangle
9:C7C8  ff760c               push word ptr [bp + 0xc]
9:C7CB  c45e06               les bx, ptr [bp + 6]
9:C7CE  268b4736             mov ax, word ptr es:[bx + 0x36]
9:C7D2  03c0                 add ax, ax
9:C7D4  2603472a             add ax, word ptr es:[bx + 0x2a]
9:C7D8  50                   push ax
9:C7D9  6a00                 push 0
9:C7DB  9a05c40000           lcall 0, 0xc405  ; GDI.MoveTo
9:C7E0  ff760c               push word ptr [bp + 0xc]
9:C7E3  c45e06               les bx, ptr [bp + 6]
9:C7E6  268b4736             mov ax, word ptr es:[bx + 0x36]
9:C7EA  03c0                 add ax, ax
9:C7EC  2603472a             add ax, word ptr es:[bx + 0x2a]
9:C7F0  50                   push ax
9:C7F1  26ff7724             push word ptr es:[bx + 0x24]
9:C7F5  9a1ac40000           lcall 0, 0xc41a  ; GDI.LineTo
9:C7FA  ff760c               push word ptr [bp + 0xc]
9:C7FD  ff76f4               push word ptr [bp - 0xc]
9:C800  9a0cc80000           lcall 0, 0xc80c  ; GDI.SelectObject
9:C805  ff760c               push word ptr [bp + 0xc]
9:C808  ff76f2               push word ptr [bp - 0xe]
9:C80B  9abcc20000           lcall 0, 0xc2bc  ; GDI.SelectObject
9:C810  50                   push ax
9:C811  9a4fc80000           lcall 0, 0xc84f  ; GDI.DeleteObject
9:C816  66ff760a             push dword ptr [bp + 0xa]
9:C81A  c45e06               les bx, ptr [bp + 6]
9:C81D  06                   push es
9:C81E  53                   push bx
9:C81F  26c41f               les bx, ptr es:[bx]
9:C822  8bf3                 mov si, bx
9:C824  8cc7                 mov di, es
9:C826  26ff5f10             lcall es:[bx + 0x10]
9:C82A  ff760c               push word ptr [bp + 0xc]
9:C82D  66ff7606             push dword ptr [bp + 6]
9:C831  8ec7                 mov es, di
9:C833  26ff5c14             lcall es:[si + 0x14]
9:C837  c45e06               les bx, ptr [bp + 6]
9:C83A  26c747460000         mov word ptr es:[bx + 0x46], 0
9:C840  ff760c               push word ptr [bp + 0xc]
9:C843  ff76fa               push word ptr [bp - 6]
9:C846  6a00                 push 0
9:C848  9aeb940000           lcall 0, 0x94eb  ; USER.SelectPalette
9:C84D  50                   push ax
9:C84E  9aa2c20000           lcall 0, 0xc2a2  ; GDI.DeleteObject
9:C853  5e                   pop si
9:C854  5f                   pop di
9:C855  c9                   leave
9:C856  ca0800               retf 8
9:C859  db 00

; ---------------- TreeButton::click@s9:C85A FAR size=40 callers=0
;   apis: USER.SendMessage
;   (vslot 7) SendMessage 0xFA to the dialog
9:C85A  55                   push bp
9:C85B  8bec                 mov bp, sp
9:C85D  668b4606             mov eax, dword ptr [bp + 6]
9:C861  8b5608               mov dx, word ptr [bp + 8]
9:C864  66a3fe5e             mov dword ptr [0x5efe], eax
9:C868  8ec2                 mov es, dx
9:C86A  8bd8                 mov bx, ax
9:C86C  26ff771a             push word ptr es:[bx + 0x1a]
9:C870  6668fa001101         push 0x11100fa
9:C876  666a00               push 0
9:C879  9a2ebd0000           lcall 0, 0xbd2e  ; USER.SendMessage
9:C87E  c9                   leave
9:C87F  ca0a00               retf 0xa

; ---------------- TreeButton::nop@s9:C882 FAR size=4 callers=0
;   empty virtual
9:C882  ca0a00               retf 0xa
9:C885  db 00

; ---------------- TreeButton::releasePalette@s9:C886 FAR size=196 callers=0
;   apis: GDI.DeleteObject, USER.SelectPalette
;   (vslot 4)
9:C886  c8120000             enter 0x12, 0
9:C88A  c45e06               les bx, ptr [bp + 6]
9:C88D  268b470a             mov ax, word ptr es:[bx + 0xa]
9:C891  260b4708             or ax, word ptr es:[bx + 8]
9:C895  0f84ad00             je 0xc946
9:C899  c746fe0000           mov word ptr [bp - 2], 0
9:C89E  26837f4600           cmp word ptr es:[bx + 0x46], 0
9:C8A3  7520                 jne 0xc8c5
9:C8A5  c41e3042             les bx, ptr [0x4230]
9:C8A9  268b470e             mov ax, word ptr es:[bx + 0xe]
9:C8AD  268b5710             mov dx, word ptr es:[bx + 0x10]
9:C8B1  8946f6               mov word ptr [bp - 0xa], ax
9:C8B4  8d460c               lea ax, [bp + 0xc]
9:C8B7  16                   push ss
9:C8B8  50                   push ax
9:C8B9  52                   push dx
9:C8BA  ff76f6               push word ptr [bp - 0xa]
9:C8BD  9a084e6dc7           lcall 0xc76d, 0x4e08  ; Palette::selectAndRealize@s2:4E08
9:C8C2  8946fe               mov word ptr [bp - 2], ax
loc_C8C5:
9:C8C5  c45e06               les bx, ptr [bp + 6]
9:C8C8  66268b4708           mov eax, dword ptr es:[bx + 8]
9:C8CD  268b570a             mov dx, word ptr es:[bx + 0xa]
9:C8D1  668946fa             mov dword ptr [bp - 6], eax
9:C8D5  268b470e             mov ax, word ptr es:[bx + 0xe]
9:C8D9  260b470c             or ax, word ptr es:[bx + 0xc]
9:C8DD  7413                 je 0xc8f2
9:C8DF  f6460a01             test byte ptr [bp + 0xa], 1
9:C8E3  740d                 je 0xc8f2
9:C8E5  66268b470c           mov eax, dword ptr es:[bx + 0xc]
9:C8EA  268b570e             mov dx, word ptr es:[bx + 0xe]
9:C8EE  668946fa             mov dword ptr [bp - 6], eax
loc_C8F2:
9:C8F2  6626837f1000         cmp dword ptr es:[bx + 0x10], 0
9:C8F8  7413                 je 0xc90d
9:C8FA  f6460a04             test byte ptr [bp + 0xa], 4
9:C8FE  740d                 je 0xc90d
9:C900  66268b4710           mov eax, dword ptr es:[bx + 0x10]
9:C905  268b5712             mov dx, word ptr es:[bx + 0x12]
9:C909  668946fa             mov dword ptr [bp - 6], eax
loc_C90D:
9:C90D  8d460c               lea ax, [bp + 0xc]
9:C910  16                   push ss
9:C911  50                   push ax
9:C912  c45e06               les bx, ptr [bp + 6]
9:C915  26ff7726             push word ptr es:[bx + 0x26]
9:C919  26ff7728             push word ptr es:[bx + 0x28]
9:C91D  52                   push dx
9:C91E  c45efa               les bx, ptr [bp - 6]
9:C921  53                   push bx
9:C922  26c41f               les bx, ptr es:[bx]
9:C925  26ff5f04             lcall es:[bx + 4]
9:C929  c45e06               les bx, ptr [bp + 6]
9:C92C  26837f4600           cmp word ptr es:[bx + 0x46], 0
9:C931  7513                 jne 0xc946
9:C933  ff760c               push word ptr [bp + 0xc]
9:C936  ff76fe               push word ptr [bp - 2]
9:C939  6a00                 push 0
9:C93B  9a49c80000           lcall 0, 0xc849  ; USER.SelectPalette
9:C940  50                   push ax
9:C941  9a12c80000           lcall 0, 0xc812  ; GDI.DeleteObject
loc_C946:
9:C946  c9                   leave
9:C947  ca0800               retf 8

; ---------------- TreeButton::label@s9:C94A size=130 callers=0
;   (vslot 5) with the topic's progress
9:C94A  c80e0000             enter 0xe, 0
9:C94E  c45e06               les bx, ptr [bp + 6]
9:C951  26837f4800           cmp word ptr es:[bx + 0x48], 0
9:C956  7463                 je 0xc9bb
9:C958  6a03                 push 3
9:C95A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:C95F  9aba207dc9           lcall 0xc97d, 0x20ba  ; Registry_get@s3:20BA
9:C964  8946fc               mov word ptr [bp - 4], ax
9:C967  c45e06               les bx, ptr [bp + 6]
9:C96A  26c45f42             les bx, ptr es:[bx + 0x42]
9:C96E  268b4712             mov ax, word ptr es:[bx + 0x12]
9:C972  8946fa               mov word ptr [bp - 6], ax
9:C975  50                   push ax
9:C976  52                   push dx
9:C977  ff76fc               push word ptr [bp - 4]
9:C97A  9acaa576c6           lcall 0xc676, 0xa5ca  ; Player1::progress@s3:A5CA
9:C97F  40                   inc ax
9:C980  7424                 je 0xc9a6
9:C982  48                   dec ax
9:C983  752d                 jne 0xc9b2
9:C985  c45e06               les bx, ptr [bp + 6]
9:C988  26c7473c2500         mov word ptr es:[bx + 0x3c], 0x25
9:C98E  837efa5b             cmp word ptr [bp - 6], 0x5b
9:C992  7406                 je 0xc99a
9:C994  837efa09             cmp word ptr [bp - 6], 9
9:C998  7521                 jne 0xc9bb
loc_C99A:
9:C99A  c45e06               les bx, ptr [bp + 6]
9:C99D  26c7473cfe00         mov word ptr es:[bx + 0x3c], 0xfe
9:C9A3  eb16                 jmp 0xc9bb
9:C9A5  db 90
loc_C9A6:
9:C9A6  c45e06               les bx, ptr [bp + 6]
9:C9A9  26c7473cf900         mov word ptr es:[bx + 0x3c], 0xf9
9:C9AF  eb0a                 jmp 0xc9bb
9:C9B1  db 90
loc_C9B2:
9:C9B2  c45e06               les bx, ptr [bp + 6]
9:C9B5  26c7473cfb00         mov word ptr es:[bx + 0x3c], 0xfb
loc_C9BB:
9:C9BB  66ff7608             push dword ptr [bp + 8]
9:C9BF  ff7606               push word ptr [bp + 6]
9:C9C2  90                   nop
9:C9C3  0e                   push cs
9:C9C4  e835cb               call 0x94fc  ; OPCtrl::drawLabel@s9:94FC
9:C9C7  c9                   leave
9:C9C8  ca0600               retf 6
9:C9CB  db 00

; ---------------- TreeButton::scalar_dtor@s9:C9CC FAR size=74 callers=0
;   deleting destructor
9:C9CC  55                   push bp
9:C9CD  8bec                 mov bp, sp
9:C9CF  66ff7606             push dword ptr [bp + 6]
9:C9D3  90                   nop
9:C9D4  0e                   push cs
9:C9D5  e8d4fb               call 0xc5ac  ; TreeButton::~TreeButton@s9:C5AC
9:C9D8  f6460a01             test byte ptr [bp + 0xa], 1
9:C9DC  7409                 je 0xc9e7
9:C9DE  66ff7606             push dword ptr [bp + 6]
9:C9E2  9ace1731c5           lcall 0xc531, 0x17ce  ; operator_delete@s1:17CE
loc_C9E7:
9:C9E7  8b4606               mov ax, word ptr [bp + 6]
9:C9EA  8b5608               mov dx, word ptr [bp + 8]
9:C9ED  c9                   leave
9:C9EE  ca0600               retf 6
9:C9F1  db 90 cc c9 f8 c9 1e c7 fc c9 dc 92 00 ca 4c c7 04
9:CA01  db ca 86 c8 08 ca 4a c9 10 ca d2 3c c0 c8 5a c8 14
9:CA11  db ca 82 c8 bd c5

; ---------------- TransferAssetsDlg::TransferAssetsDlg@s9:CA16 FAR size=94 callers=1
;   dialog 6208 "Transfer Assets" (vtable D07C)
9:CA16  55                   push bp
9:CA17  8bec                 mov bp, sp
9:CA19  ff760a               push word ptr [bp + 0xa]
9:CA1C  684018               push 0x1840
9:CA1F  66ff7606             push dword ptr [bp + 6]
9:CA23  90                   nop
9:CA24  0e                   push cs
9:CA25  e85ae6               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:CA28  66a10c5f             mov eax, dword ptr [0x5f0c]
9:CA2C  c45e06               les bx, ptr [bp + 6]
9:CA2F  662689879400         mov dword ptr es:[bx + 0x94], eax
9:CA35  662bc0               sub eax, eax
9:CA38  662689879800         mov dword ptr es:[bx + 0x98], eax
9:CA3E  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:CA43  2689879e00           mov word ptr es:[bx + 0x9e], ax
9:CA48  26c7077cd0           mov word ptr es:[bx], 0xd07c
9:CA4D  26c74702f4c9         mov word ptr es:[bx + 2], 0xc9f4  ; SEGMENT s9:0000
9:CA53  6a3e                 push 0x3e
9:CA55  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:CA5A  9aba2062c9           lcall 0xc962, 0x20ba  ; Registry_get@s3:20BA
9:CA5F  c45e06               les bx, ptr [bp + 6]
9:CA62  2689879800           mov word ptr es:[bx + 0x98], ax
9:CA67  2689979a00           mov word ptr es:[bx + 0x9a], dx
9:CA6C  8bc3                 mov ax, bx
9:CA6E  8cc2                 mov dx, es
9:CA70  c9                   leave
9:CA71  ca0600               retf 6

; ---------------- TransferAssetsDlg::~TransferAssetsDlg@s9:CA74 FAR size=50 callers=1
;   dtor
9:CA74  55                   push bp
9:CA75  8bec                 mov bp, sp
9:CA77  c45e06               les bx, ptr [bp + 6]
9:CA7A  26c7077cd0           mov word ptr es:[bx], 0xd07c
9:CA7F  26c7470251ca         mov word ptr es:[bx + 2], 0xca51  ; SEGMENT s9:0000
9:CA85  26ff7706             push word ptr es:[bx + 6]
9:CA89  66ff367c5b           push dword ptr [0x5b7c]
9:CA8E  9ae0b634bf           lcall 0xbf34, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:CA93  c706105f0000         mov word ptr [0x5f10], 0
9:CA99  66ff7606             push dword ptr [bp + 6]
9:CA9D  90                   nop
9:CA9E  0e                   push cs
9:CA9F  e856e6               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:CAA2  c9                   leave
9:CAA3  ca0400               retf 4

; ---------------- TransferAssetsDlg::close@s9:CAA6 size=40 callers=0
;   (vslot 5)
9:CAA6  c8040000             enter 4, 0
9:CAAA  666a2b               push 0x2b
9:CAAD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:CAB2  9aba20bcca           lcall 0xcabc, 0x20ba  ; Registry_get@s3:20BA
9:CAB7  52                   push dx
9:CAB8  50                   push ax
9:CAB9  9a8e035dca           lcall 0xca5d, 0x38e  ; Alerts::isOn@s3:038E
9:CABE  66ff7608             push dword ptr [bp + 8]
9:CAC2  ff7606               push word ptr [bp + 6]
9:CAC5  90                   nop
9:CAC6  0e                   push cs
9:CAC7  e85cec               call 0xb726  ; BuildingDlgBase::close@s9:B726
9:CACA  c9                   leave
9:CACB  ca0600               retf 6

; ---------------- TransferAssetsDlg::apply@s9:CACE size=408 callers=0
;   apis: USER.GetDlgItemInt, USER.MessageBox
;   (vslot 30) moves the cargo
9:CACE  c8160200             enter 0x216, 0
9:CAD2  c45e06               les bx, ptr [bp + 6]
9:CAD5  26ff7706             push word ptr es:[bx + 6]
9:CAD9  688e01               push 0x18e
9:CADC  8d46fe               lea ax, [bp - 2]
9:CADF  16                   push ss
9:CAE0  50                   push ax
9:CAE1  6a00                 push 0
9:CAE3  9afdca0000           lcall 0, 0xcafd  ; USER.GetDlgItemInt
9:CAE8  8946fc               mov word ptr [bp - 4], ax
9:CAEB  c45e06               les bx, ptr [bp + 6]
9:CAEE  26ff7706             push word ptr es:[bx + 6]
9:CAF2  689101               push 0x191
9:CAF5  8d46fe               lea ax, [bp - 2]
9:CAF8  16                   push ss
9:CAF9  50                   push ax
9:CAFA  6a00                 push 0
9:CAFC  9afb3c0000           lcall 0, 0x3cfb  ; USER.GetDlgItemInt
9:CB01  8946fa               mov word ptr [bp - 6], ax
9:CB04  837efc00             cmp word ptr [bp - 4], 0
9:CB08  0f845601             je 0xcc62
9:CB0C  c45e06               les bx, ptr [bp + 6]
9:CB0F  6626ffb79400         push dword ptr es:[bx + 0x94]
9:CB15  ff76fc               push word ptr [bp - 4]
9:CB18  6626ffb79800         push dword ptr es:[bx + 0x98]
9:CB1E  9aea5000bf           lcall 0xbf00, 0x50ea  ; CargoList::CargoList@s4:50EA
9:CB23  687b05               push 0x57b
9:CB26  8d86fafd             lea ax, [bp - 0x206]
9:CB2A  16                   push ss
9:CB2B  50                   push ax
9:CB2C  68ff03               push 0x3ff
9:CB2F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CB34  9ae08466cb           lcall 0xcb66, 0x84e0  ; LoadStringTo@s3:84E0
9:CB39  66c786f6fd00000000   mov dword ptr [bp - 0x20a], 0
9:CB42  c45e06               les bx, ptr [bp + 6]
9:CB45  26c49f9400           les bx, ptr es:[bx + 0x94]
9:CB4A  6626837f3600         cmp dword ptr es:[bx + 0x36], 0
9:CB50  743e                 je 0xcb90
9:CB52  68ec07               push 0x7ec
9:CB55  8d86fafe             lea ax, [bp - 0x106]
9:CB59  16                   push ss
9:CB5A  50                   push ax
9:CB5B  68ff03               push 0x3ff
9:CB5E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CB63  9ae084a4cb           lcall 0xcba4, 0x84e0  ; LoadStringTo@s3:84E0
9:CB68  c45e06               les bx, ptr [bp + 6]
9:CB6B  26ff7708             push word ptr es:[bx + 8]
9:CB6F  8d86fafe             lea ax, [bp - 0x106]
9:CB73  16                   push ss
9:CB74  50                   push ax
9:CB75  8d86fafd             lea ax, [bp - 0x206]
9:CB79  16                   push ss
9:CB7A  50                   push ax
9:CB7B  6a34                 push 0x34
9:CB7D  9abccb0000           lcall 0, 0xcbbc  ; USER.MessageBox
9:CB82  8986eefd             mov word ptr [bp - 0x212], ax
9:CB86  3d0600               cmp ax, 6
9:CB89  753e                 jne 0xcbc9
loc_CB8B:
9:CB8B  b80100               mov ax, 1
9:CB8E  eb3b                 jmp 0xcbcb
loc_CB90:
9:CB90  68ed07               push 0x7ed
9:CB93  8d86fafe             lea ax, [bp - 0x106]
9:CB97  16                   push ss
9:CB98  50                   push ax
9:CB99  68ff03               push 0x3ff
9:CB9C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CBA1  9ae084f5cb           lcall 0xcbf5, 0x84e0  ; LoadStringTo@s3:84E0
9:CBA6  c45e06               les bx, ptr [bp + 6]
9:CBA9  26ff7708             push word ptr es:[bx + 8]
9:CBAD  8d86fafe             lea ax, [bp - 0x106]
9:CBB1  16                   push ss
9:CBB2  50                   push ax
9:CBB3  8d86fafd             lea ax, [bp - 0x206]
9:CBB7  16                   push ss
9:CBB8  50                   push ax
9:CBB9  6a34                 push 0x34
9:CBBB  9a0dcc0000           lcall 0, 0xcc0d  ; USER.MessageBox
9:CBC0  8986eefd             mov word ptr [bp - 0x212], ax
9:CBC4  3d0600               cmp ax, 6
9:CBC7  74c2                 je 0xcb8b
loc_CBC9:
9:CBC9  33c0                 xor ax, ax
loc_CBCB:
9:CBCB  8986f6fd             mov word ptr [bp - 0x20a], ax
9:CBCF  0bc0                 or ax, ax
9:CBD1  7553                 jne 0xcc26
9:CBD3  c45e06               les bx, ptr [bp + 6]
9:CBD6  26c49f9400           les bx, ptr es:[bx + 0x94]
9:CBDB  26394734             cmp word ptr es:[bx + 0x34], ax
9:CBDF  7f45                 jg 0xcc26
9:CBE1  68ee07               push 0x7ee
9:CBE4  8d86fafe             lea ax, [bp - 0x106]
9:CBE8  16                   push ss
9:CBE9  50                   push ax
9:CBEA  68ff03               push 0x3ff
9:CBED  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CBF2  9ae084b5ca           lcall 0xcab5, 0x84e0  ; LoadStringTo@s3:84E0
9:CBF7  c45e06               les bx, ptr [bp + 6]
9:CBFA  26ff7708             push word ptr es:[bx + 8]
9:CBFE  8d86fafe             lea ax, [bp - 0x106]
9:CC02  16                   push ss
9:CC03  50                   push ax
9:CC04  8d86fafd             lea ax, [bp - 0x206]
9:CC08  16                   push ss
9:CC09  50                   push ax
9:CC0A  6a34                 push 0x34
9:CC0C  9ae6ad0000           lcall 0, 0xade6  ; USER.MessageBox
9:CC11  8986eafd             mov word ptr [bp - 0x216], ax
9:CC15  3d0600               cmp ax, 6
9:CC18  7506                 jne 0xcc20
9:CC1A  b80100               mov ax, 1
9:CC1D  eb03                 jmp 0xcc22
9:CC1F  db 90
loc_CC20:
9:CC20  33c0                 xor ax, ax
loc_CC22:
9:CC22  8986f8fd             mov word ptr [bp - 0x208], ax
loc_CC26:
9:CC26  83bef6fd00           cmp word ptr [bp - 0x20a], 0
9:CC2B  7411                 je 0xcc3e
9:CC2D  c45e06               les bx, ptr [bp + 6]
9:CC30  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:CC36  66a3165f             mov dword ptr [0x5f16], eax
9:CC3A  6a26                 push 0x26
9:CC3C  eb16                 jmp 0xcc54
loc_CC3E:
9:CC3E  83bef8fd00           cmp word ptr [bp - 0x208], 0
9:CC43  741d                 je 0xcc62
9:CC45  c45e06               les bx, ptr [bp + 6]
9:CC48  66268b879400         mov eax, dword ptr es:[bx + 0x94]
9:CC4E  66a3685a             mov dword ptr [0x5a68], eax
9:CC52  6a27                 push 0x27
loc_CC54:
9:CC54  26ff7708             push word ptr es:[bx + 8]
9:CC58  66ff367c5b           push dword ptr [0x5b7c]
9:CC5D  9a40af91ca           lcall 0xca91, 0xaf40  ; DialogCtr::open@s8:AF40
loc_CC62:
9:CC62  c9                   leave
9:CC63  ca0400               retf 4

; ---------------- TransferAssetsDlg::refresh@s9:CC66 FAR size=38 callers=0
;   (vslot 20)
9:CC66  55                   push bp
9:CC67  8bec                 mov bp, sp
9:CC69  c45e06               les bx, ptr [bp + 6]
9:CC6C  6626ffb79800         push dword ptr es:[bx + 0x98]
9:CC72  26c49f9800           les bx, ptr es:[bx + 0x98]
9:CC77  26c41f               les bx, ptr es:[bx]
9:CC7A  26ff5f10             lcall es:[bx + 0x10]
9:CC7E  66ff7606             push dword ptr [bp + 6]
9:CC82  90                   nop
9:CC83  0e                   push cs
9:CC84  e89502               call 0xcf1c  ; TransferAssetsDlg::fill@s9:CF1C
9:CC87  c9                   leave
9:CC88  ca0400               retf 4
9:CC8B  db 00

; ---------------- TransferAssetsDlg::onCommand@s9:CC8C FAR size=88 callers=0
;   (vslot 4)
9:CC8C  c8020000             enter 2, 0
9:CC90  8b460e               mov ax, word ptr [bp + 0xe]
9:CC93  2deb00               sub ax, 0xeb
9:CC96  742e                 je 0xccc6
9:CC98  2d5617               sub ax, 0x1756
9:CC9B  7435                 je 0xccd2
9:CC9D  48                   dec ax
9:CC9E  7414                 je 0xccb4
9:CCA0  66ff760c             push dword ptr [bp + 0xc]
9:CCA4  66ff7608             push dword ptr [bp + 8]
9:CCA8  ff7606               push word ptr [bp + 6]
9:CCAB  90                   nop
9:CCAC  0e                   push cs
9:CCAD  e89ae8               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:CCB0  c9                   leave
9:CCB1  ca0a00               retf 0xa
loc_CCB4:
9:CCB4  8b460c               mov ax, word ptr [bp + 0xc]
9:CCB7  48                   dec ax
9:CCB8  7521                 jne 0xccdb
9:CCBA  66ff7606             push dword ptr [bp + 6]
9:CCBE  90                   nop
9:CCBF  0e                   push cs
9:CCC0  e8b301               call 0xce76  ; TransferAssetsDlg::select@s9:CE76
9:CCC3  eb16                 jmp 0xccdb
9:CCC5  db 90
loc_CCC6:
9:CCC6  66ff7606             push dword ptr [bp + 6]
9:CCCA  90                   nop
9:CCCB  0e                   push cs
9:CCCC  e84d02               call 0xcf1c  ; TransferAssetsDlg::fill@s9:CF1C
9:CCCF  eb0a                 jmp 0xccdb
9:CCD1  db 90
loc_CCD2:
9:CCD2  66ff7606             push dword ptr [bp + 6]
9:CCD6  90                   nop
9:CCD7  0e                   push cs
9:CCD8  e80900               call 0xcce4  ; TransferAssetsDlg::message@s9:CCE4
loc_CCDB:
9:CCDB  b80100               mov ax, 1
9:CCDE  99                   cdq
9:CCDF  c9                   leave
9:CCE0  ca0a00               retf 0xa
9:CCE3  db 00

; ---------------- TransferAssetsDlg::message@s9:CCE4 FAR size=200 callers=1
;   apis: USER.MessageBox
;   a message box
9:CCE4  c8100200             enter 0x210, 0
9:CCE8  680010               push 0x1000
9:CCEB  9a9c174acd           lcall 0xcd4a, 0x179c  ; operator_new@s1:179C
9:CCF0  83c402               add sp, 2
9:CCF3  8986f8fd             mov word ptr [bp - 0x208], ax
9:CCF7  8996fafd             mov word ptr [bp - 0x206], dx
9:CCFB  687b05               push 0x57b
9:CCFE  8d86fcfd             lea ax, [bp - 0x204]
9:CD02  16                   push ss
9:CD03  50                   push ax
9:CD04  680001               push 0x100
9:CD07  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CD0C  9ae08424cd           lcall 0xcd24, 0x84e0  ; LoadStringTo@s3:84E0
9:CD11  68e907               push 0x7e9
9:CD14  66ffb6f8fd           push dword ptr [bp - 0x208]
9:CD19  68ff03               push 0x3ff
9:CD1C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CD21  9ae0843acd           lcall 0xcd3a, 0x84e0  ; LoadStringTo@s3:84E0
9:CD26  68ea07               push 0x7ea
9:CD29  8d86fefe             lea ax, [bp - 0x102]
9:CD2D  16                   push ss
9:CD2E  50                   push ax
9:CD2F  68ff03               push 0x3ff
9:CD32  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CD37  9ae08463cd           lcall 0xcd63, 0x84e0  ; LoadStringTo@s3:84E0
9:CD3C  8d86fefe             lea ax, [bp - 0x102]
9:CD40  16                   push ss
9:CD41  50                   push ax
9:CD42  66ffb6f8fd           push dword ptr [bp - 0x208]
9:CD47  9aea3c73cd           lcall 0xcd73, 0x3cea  ; _fstrcat@s1:3CEA
9:CD4C  83c408               add sp, 8
9:CD4F  68eb07               push 0x7eb
9:CD52  8d86fefe             lea ax, [bp - 0x102]
9:CD56  16                   push ss
9:CD57  50                   push ax
9:CD58  68ff03               push 0x3ff
9:CD5B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CD60  9ae08437cb           lcall 0xcb37, 0x84e0  ; LoadStringTo@s3:84E0
9:CD65  8d86fefe             lea ax, [bp - 0x102]
9:CD69  16                   push ss
9:CD6A  50                   push ax
9:CD6B  66ffb6f8fd           push dword ptr [bp - 0x208]
9:CD70  9aea3ca5cd           lcall 0xcda5, 0x3cea  ; _fstrcat@s1:3CEA
9:CD75  83c408               add sp, 8
9:CD78  c45e06               les bx, ptr [bp + 6]
9:CD7B  26ff7706             push word ptr es:[bx + 6]
9:CD7F  66ffb6f8fd           push dword ptr [bp - 0x208]
9:CD84  8d86fcfd             lea ax, [bp - 0x204]
9:CD88  16                   push ss
9:CD89  50                   push ax
9:CD8A  6a00                 push 0
9:CD8C  9a7ecb0000           lcall 0, 0xcb7e  ; USER.MessageBox
9:CD91  668b86f8fd           mov eax, dword ptr [bp - 0x208]
9:CD96  668986f4fd           mov dword ptr [bp - 0x20c], eax
9:CD9B  668986f0fd           mov dword ptr [bp - 0x210], eax
9:CDA0  6650                 push eax
9:CDA2  9ace17e5c9           lcall 0xc9e5, 0x17ce  ; operator_delete@s1:17CE
9:CDA7  c9                   leave
9:CDA8  ca0400               retf 4
9:CDAB  db 00

; ---------------- TransferAssetsDlg::setQuantity@s9:CDAC FAR size=102 callers=0
;   apis: USER.SetDlgItemInt
;   (vslot 21)
9:CDAC  c8020000             enter 2, 0
9:CDB0  c746fe0000           mov word ptr [bp - 2], 0
9:CDB5  8b460e               mov ax, word ptr [bp + 0xe]
9:CDB8  eb2e                 jmp 0xcde8
loc_CDBA:
9:CDBA  c45e06               les bx, ptr [bp + 6]
9:CDBD  268b879e00           mov ax, word ptr es:[bx + 0x9e]
9:CDC2  2639879c00           cmp word ptr es:[bx + 0x9c], ax
9:CDC7  7e26                 jle 0xcdef
9:CDC9  26ff879e00           inc word ptr es:[bx + 0x9e]
loc_CDCE:
9:CDCE  c746fe0100           mov word ptr [bp - 2], 1
9:CDD3  eb1a                 jmp 0xcdef
9:CDD5  db 90
loc_CDD6:
9:CDD6  c45e06               les bx, ptr [bp + 6]
9:CDD9  2683bf9e0000         cmp word ptr es:[bx + 0x9e], 0
9:CDDF  7e0e                 jle 0xcdef
9:CDE1  26ff8f9e00           dec word ptr es:[bx + 0x9e]
9:CDE6  ebe6                 jmp 0xcdce
loc_CDE8:
9:CDE8  0bc0                 or ax, ax
9:CDEA  74ce                 je 0xcdba
9:CDEC  48                   dec ax
9:CDED  74e7                 je 0xcdd6
loc_CDEF:
9:CDEF  837efe00             cmp word ptr [bp - 2], 0
9:CDF3  7416                 je 0xce0b
9:CDF5  c45e06               les bx, ptr [bp + 6]
9:CDF8  26ff7706             push word ptr es:[bx + 6]
9:CDFC  688e01               push 0x18e
9:CDFF  26ffb79e00           push word ptr es:[bx + 0x9e]
9:CE04  6a00                 push 0
9:CE06  9a0eaa0000           lcall 0, 0xaa0e  ; USER.SetDlgItemInt
loc_CE0B:
9:CE0B  33c0                 xor ax, ax
9:CE0D  c9                   leave
9:CE0E  ca0a00               retf 0xa
9:CE11  db 00

; ---------------- TransferAssetsDlg::fillList@s9:CE12 FAR size=100 callers=1
;   apis: USER.SendDlgItemMessage, USER._wsprintf
;   the cargo list
9:CE12  c80c0100             enter 0x10c, 0
9:CE16  66ff760a             push dword ptr [bp + 0xa]
9:CE1A  8d46f8               lea ax, [bp - 8]
9:CE1D  16                   push ss
9:CE1E  50                   push ax
9:CE1F  9a84572cce           lcall 0xce2c, 0x5784  ; ListIter::ListIter@s2:5784
loc_CE24:
9:CE24  8d46f8               lea ax, [bp - 8]
9:CE27  16                   push ss
9:CE28  50                   push ax
9:CE29  9a125b0cca           lcall 0xca0c, 0x5b12  ; ListIter::next@s2:5B12
9:CE2E  8986f4fe             mov word ptr [bp - 0x10c], ax
9:CE32  8996f6fe             mov word ptr [bp - 0x10a], dx
9:CE36  0bd0                 or dx, ax
9:CE38  7438                 je 0xce72
9:CE3A  c49ef4fe             les bx, ptr [bp - 0x10c]
9:CE3E  6626ff7704           push dword ptr es:[bx + 4]
9:CE43  1e                   push ds
9:CE44  68125f               push 0x5f12
9:CE47  8d86f8fe             lea ax, [bp - 0x108]
9:CE4B  16                   push ss
9:CE4C  50                   push ax
9:CE4D  9a08af0000           lcall 0, 0xaf08  ; USER._wsprintf
9:CE52  83c40c               add sp, 0xc
9:CE55  c45e06               les bx, ptr [bp + 6]
9:CE58  26ff7706             push word ptr es:[bx + 6]
9:CE5C  ff760e               push word ptr [bp + 0xe]
9:CE5F  666800000104         push 0x4010000
9:CE65  8d86f8fe             lea ax, [bp - 0x108]
9:CE69  16                   push ss
9:CE6A  50                   push ax
9:CE6B  9abda00000           lcall 0, 0xa0bd  ; USER.SendDlgItemMessage
9:CE70  ebb2                 jmp 0xce24
loc_CE72:
9:CE72  c9                   leave
9:CE73  ca0a00               retf 0xa

; ---------------- TransferAssetsDlg::select@s9:CE76 FAR size=166 callers=1
;   apis: USER.SendDlgItemMessage, USER.SetDlgItemInt
;   an entry
9:CE76  c8080100             enter 0x108, 0
9:CE7A  c45e06               les bx, ptr [bp + 6]
9:CE7D  26ff7706             push word ptr es:[bx + 6]
9:CE81  666809044218         push 0x18420409
9:CE87  666a00               push 0
9:CE8A  6a00                 push 0
9:CE8C  9ab6ce0000           lcall 0, 0xceb6  ; USER.SendDlgItemMessage
9:CE91  99                   cdq
9:CE92  8946fc               mov word ptr [bp - 4], ax
9:CE95  8956fe               mov word ptr [bp - 2], dx
9:CE98  3dffff               cmp ax, 0xffff
9:CE9B  7504                 jne 0xcea1
9:CE9D  3bd0                 cmp dx, ax
9:CE9F  7477                 je 0xcf18
loc_CEA1:
9:CEA1  c45e06               les bx, ptr [bp + 6]
9:CEA4  26ff7706             push word ptr es:[bx + 6]
9:CEA8  66680a044218         push 0x1842040a
9:CEAE  50                   push ax
9:CEAF  8d86fcfe             lea ax, [bp - 0x104]
9:CEB3  16                   push ss
9:CEB4  50                   push ax
9:CEB5  9a6cce0000           lcall 0, 0xce6c  ; USER.SendDlgItemMessage
9:CEBA  8d86fcfe             lea ax, [bp - 0x104]
9:CEBE  16                   push ss
9:CEBF  50                   push ax
9:CEC0  c45e06               les bx, ptr [bp + 6]
9:CEC3  6626ffb79800         push dword ptr es:[bx + 0x98]
9:CEC9  9a065221cb           lcall 0xcb21, 0x5206  ; CargoList::find@s4:5206
9:CECE  8986f8fe             mov word ptr [bp - 0x108], ax
9:CED2  8996fafe             mov word ptr [bp - 0x106], dx
9:CED6  0bd0                 or dx, ax
9:CED8  743e                 je 0xcf18
9:CEDA  c49ef8fe             les bx, ptr [bp - 0x108]
9:CEDE  268b4708             mov ax, word ptr es:[bx + 8]
9:CEE2  c45e06               les bx, ptr [bp + 6]
9:CEE5  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:CEEA  26c7879e000000       mov word ptr es:[bx + 0x9e], 0
9:CEF1  26ff7706             push word ptr es:[bx + 6]
9:CEF5  666800008e01         push 0x18e0000
9:CEFB  6a00                 push 0
9:CEFD  9a14cf0000           lcall 0, 0xcf14  ; USER.SetDlgItemInt
9:CF02  c45e06               les bx, ptr [bp + 6]
9:CF05  26ff7706             push word ptr es:[bx + 6]
9:CF09  689101               push 0x191
9:CF0C  26ffb79c00           push word ptr es:[bx + 0x9c]
9:CF11  6a00                 push 0
9:CF13  9a07ce0000           lcall 0, 0xce07  ; USER.SetDlgItemInt
loc_CF18:
9:CF18  c9                   leave
9:CF19  ca0400               retf 4

; ---------------- TransferAssetsDlg::fill@s9:CF1C FAR size=314 callers=2
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SendDlgItemMessage
;   the colony and its cargo
9:CF1C  c80a0500             enter 0x50a, 0
9:CF20  6a03                 push 3
9:CF22  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:CF27  9aba2048cf           lcall 0xcf48, 0x20ba  ; Registry_get@s3:20BA
9:CF2C  8946fc               mov word ptr [bp - 4], ax
9:CF2F  8956fe               mov word ptr [bp - 2], dx
9:CF32  c45e06               les bx, ptr [bp + 6]
9:CF35  6626ffb79400         push dword ptr es:[bx + 0x94]
9:CF3B  8d86fcfe             lea ax, [bp - 0x104]
9:CF3F  16                   push ss
9:CF40  50                   push ax
9:CF41  66ff76fc             push dword ptr [bp - 4]
9:CF45  9ac2c3f1cf           lcall 0xcff1, 0xc3c2  ; objectLabel@s3:C3C2
9:CF4A  c45e06               les bx, ptr [bp + 6]
9:CF4D  26ff7706             push word ptr es:[bx + 6]
9:CF51  66680c004618         push 0x1846000c
9:CF57  6a00                 push 0
9:CF59  8d86fcfe             lea ax, [bp - 0x104]
9:CF5D  16                   push ss
9:CF5E  50                   push ax
9:CF5F  9a77cf0000           lcall 0, 0xcf77  ; USER.SendDlgItemMessage
9:CF64  c45e06               les bx, ptr [bp + 6]
9:CF67  26ff7706             push word ptr es:[bx + 6]
9:CF6B  66680b004218         push 0x1842000b
9:CF71  666a00               push 0
9:CF74  6a00                 push 0
9:CF76  9a8ecf0000           lcall 0, 0xcf8e  ; USER.SendDlgItemMessage
9:CF7B  c45e06               les bx, ptr [bp + 6]
9:CF7E  26ff7706             push word ptr es:[bx + 6]
9:CF82  666805044218         push 0x18420405
9:CF88  666a00               push 0
9:CF8B  6a00                 push 0
9:CF8D  9acfcf0000           lcall 0, 0xcfcf  ; USER.SendDlgItemMessage
9:CF92  684218               push 0x1842
9:CF95  c45e06               les bx, ptr [bp + 6]
9:CF98  6626ffb79400         push dword ptr es:[bx + 0x94]
9:CF9E  6626ffb79800         push dword ptr es:[bx + 0x98]
9:CFA4  9a6a52ccce           lcall 0xcecc, 0x526a  ; CargoList::entries@s4:526A
9:CFA9  8986f8fe             mov word ptr [bp - 0x108], ax
9:CFAD  8996fafe             mov word ptr [bp - 0x106], dx
9:CFB1  52                   push dx
9:CFB2  50                   push ax
9:CFB3  66ff7606             push dword ptr [bp + 6]
9:CFB7  90                   nop
9:CFB8  0e                   push cs
9:CFB9  e856fe               call 0xce12  ; TransferAssetsDlg::fillList@s9:CE12
9:CFBC  c45e06               les bx, ptr [bp + 6]
9:CFBF  26ff7706             push word ptr es:[bx + 6]
9:CFC3  66680c044218         push 0x1842040c
9:CFC9  666a00               push 0
9:CFCC  6a00                 push 0
9:CFCE  9a09d00000           lcall 0, 0xd009  ; USER.SendDlgItemMessage
9:CFD3  0bd2                 or dx, dx
9:CFD5  7f6b                 jg 0xd042
9:CFD7  7c04                 jl 0xcfdd
9:CFD9  0bc0                 or ax, ax
9:CFDB  7565                 jne 0xd042
loc_CFDD:
9:CFDD  684a04               push 0x44a
9:CFE0  8d86f6fa             lea ax, [bp - 0x50a]
9:CFE4  16                   push ss
9:CFE5  50                   push ax
9:CFE6  68ff03               push 0x3ff
9:CFE9  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:CFEE  9ae0840fcd           lcall 0xcd0f, 0x84e0  ; LoadStringTo@s3:84E0
9:CFF3  c45e06               les bx, ptr [bp + 6]
9:CFF6  26ff7706             push word ptr es:[bx + 6]
9:CFFA  666801044218         push 0x18420401
9:D000  6a00                 push 0
9:D002  8d86f6fa             lea ax, [bp - 0x50a]
9:D006  16                   push ss
9:D007  50                   push ax
9:D008  9a39d00000           lcall 0, 0xd039  ; USER.SendDlgItemMessage
9:D00D  c45e06               les bx, ptr [bp + 6]
9:D010  26ff7706             push word ptr es:[bx + 6]
9:D014  6a01                 push 1
9:D016  9a4cd00000           lcall 0, 0xd04c  ; USER.GetDlgItem
9:D01B  50                   push ax
9:D01C  6a00                 push 0
loc_D01E:
9:D01E  9a5cbe0000           lcall 0, 0xbe5c  ; USER.EnableWindow
9:D023  c45e06               les bx, ptr [bp + 6]
9:D026  26ff7706             push word ptr es:[bx + 6]
9:D02A  66680b004218         push 0x1842000b
9:D030  666800000100         push 0x10000
9:D036  6a00                 push 0
9:D038  9a8dce0000           lcall 0, 0xce8d  ; USER.SendDlgItemMessage
9:D03D  c9                   leave
9:D03E  ca0400               retf 4
9:D041  db 90
loc_D042:
9:D042  c45e06               les bx, ptr [bp + 6]
9:D045  26ff7706             push word ptr es:[bx + 6]
9:D049  6a01                 push 1
9:D04B  9a54be0000           lcall 0, 0xbe54  ; USER.GetDlgItem
9:D050  50                   push ax
9:D051  6a01                 push 1
9:D053  ebc9                 jmp 0xd01e
9:D055  db 00

; ---------------- TransferAssetsDlg::scalar_dtor@s9:D056 FAR size=162 callers=0
;   deleting destructor
9:D056  55                   push bp
9:D057  8bec                 mov bp, sp
9:D059  66ff7606             push dword ptr [bp + 6]
9:D05D  90                   nop
9:D05E  0e                   push cs
9:D05F  e812fa               call 0xca74  ; TransferAssetsDlg::~TransferAssetsDlg@s9:CA74
9:D062  f6460a01             test byte ptr [bp + 0xa], 1
9:D066  7409                 je 0xd071
9:D068  66ff7606             push dword ptr [bp + 6]
9:D06C  9ace17eecc           lcall 0xccee, 0x17ce  ; operator_delete@s1:17CE
loc_D071:
9:D071  8b4606               mov ax, word ptr [bp + 6]
9:D074  8b5608               mov dx, word ptr [bp + 8]
9:D077  c9                   leave
9:D078  ca0600               retf 6
9:D07B  db 90 56 d0 86 d0 10 3a 22 ce 30 b2 8a d0 16 b3 8e
9:D08B  db d0 8c cc 92 d0 a6 ca 96 d0 56 7f 9a d0 b2 7b 9e
9:D09B  db d0 1c 7f a6 d0 48 88 de d0 86 7f aa d0 0c 80 ae
9:D0AB  db d0 54 80 b2 d0 72 b3 b6 d0 58 81 ba d0 b6 81 be
9:D0BB  db d0 fe 81 c6 d0 ea 60 d6 d0 4a 82 ca d0 66 82 ce
9:D0CB  db d0 66 cc d2 d0 ac cd da d0 f4 60 e2 d0 c8 b4 e6
9:D0DB  db d0 42 88 60 cc fe 60 a7 cf 7e 80 ea d0 3c b4 ee
9:D0EB  db d0 5e b4 f2 d0 7c b1 f6 d0 ce ca 83 ca

; ---------------- TransitInfoDlg::TransitInfoDlg@s9:D0F8 FAR size=196 callers=1
;   dialog 6213 "Transit Information": a vehicle's route (vtable D8C4)
9:D0F8  c8040000             enter 4, 0
9:D0FC  ff760a               push word ptr [bp + 0xa]
9:D0FF  684518               push 0x1845
9:D102  66ff7606             push dword ptr [bp + 6]
9:D106  90                   nop
9:D107  0e                   push cs
9:D108  e877df               call 0xb082  ; ReportDlgBase::ReportDlgBase@s9:B082
9:D10B  c45e06               les bx, ptr [bp + 6]
9:D10E  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
9:D118  66a1165f             mov eax, dword ptr [0x5f16]
9:D11C  662689879800         mov dword ptr es:[bx + 0x98], eax
9:D122  662bc0               sub eax, eax
9:D125  662689879c00         mov dword ptr es:[bx + 0x9c], eax
9:D12B  268987a000           mov word ptr es:[bx + 0xa0], ax
9:D130  26c707c4d8           mov word ptr es:[bx], 0xd8c4
9:D135  26c747027ed0         mov word ptr es:[bx + 2], 0xd07e  ; SEGMENT s9:0000
9:D13B  6a47                 push 0x47
9:D13D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:D142  9aba2093d1           lcall 0xd193, 0x20ba  ; Registry_get@s3:20BA
9:D147  c45e06               les bx, ptr [bp + 6]
9:D14A  2689879400           mov word ptr es:[bx + 0x94], ax
9:D14F  2689979600           mov word ptr es:[bx + 0x96], dx
9:D154  6626ffb79800         push dword ptr es:[bx + 0x98]
9:D15A  52                   push dx
9:D15B  26ffb79400           push word ptr es:[bx + 0x94]
9:D160  9a3257c2d0           lcall 0xd0c2, 0x5732  ; RouteEdit::start@s4:5732
9:D165  c45e06               les bx, ptr [bp + 6]
9:D168  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:D16D  2689979e00           mov word ptr es:[bx + 0x9e], dx
9:D172  8bc2                 mov ax, dx
9:D174  260b879c00           or ax, word ptr es:[bx + 0x9c]
9:D179  7536                 jne 0xd1b1
9:D17B  6a0c                 push 0xc
9:D17D  9a9c176fd0           lcall 0xd06f, 0x179c  ; operator_new@s1:179C
9:D182  83c402               add sp, 2
9:D185  8956fe               mov word ptr [bp - 2], dx
9:D188  0bd0                 or dx, ax
9:D18A  7418                 je 0xd1a4
9:D18C  ff76fe               push word ptr [bp - 2]
9:D18F  50                   push ax
9:D190  9af28e2acf           lcall 0xcf2a, 0x8ef2  ; Route::Route@s3:8EF2
9:D195  c45e06               les bx, ptr [bp + 6]
9:D198  2689879c00           mov word ptr es:[bx + 0x9c], ax
9:D19D  2689979e00           mov word ptr es:[bx + 0x9e], dx
9:D1A2  eb0d                 jmp 0xd1b1
loc_D1A4:
9:D1A4  c45e06               les bx, ptr [bp + 6]
9:D1A7  6626c7879c0000000000 mov dword ptr es:[bx + 0x9c], 0
loc_D1B1:
9:D1B1  8b4606               mov ax, word ptr [bp + 6]
9:D1B4  8b5608               mov dx, word ptr [bp + 8]
9:D1B7  c9                   leave
9:D1B8  ca0600               retf 6
9:D1BB  db 00

; ---------------- TransitInfoDlg::~TransitInfoDlg@s9:D1BC FAR size=80 callers=1
;   dtor
9:D1BC  c8080000             enter 8, 0
9:D1C0  56                   push si
9:D1C1  c45e06               les bx, ptr [bp + 6]
9:D1C4  26c707c4d8           mov word ptr es:[bx], 0xd8c4
9:D1C9  26c7470239d1         mov word ptr es:[bx + 2], 0xd139  ; SEGMENT s9:0000
9:D1CF  26ff7706             push word ptr es:[bx + 6]
9:D1D3  66ff367c5b           push dword ptr [0x5b7c]
9:D1D8  9ae0b6a2d0           lcall 0xd0a2, 0xb6e0  ; DialogCtr::forget@s8:B6E0
9:D1DD  c45e06               les bx, ptr [bp + 6]
9:D1E0  268b879c00           mov ax, word ptr es:[bx + 0x9c]
9:D1E5  268b979e00           mov dx, word ptr es:[bx + 0x9e]
9:D1EA  8bda                 mov bx, dx
9:D1EC  0bd0                 or dx, ax
9:D1EE  740e                 je 0xd1fe
9:D1F0  6a01                 push 1
9:D1F2  53                   push bx
9:D1F3  50                   push ax
9:D1F4  8ec3                 mov es, bx
9:D1F6  8bf0                 mov si, ax
9:D1F8  26c41c               les bx, ptr es:[si]
9:D1FB  26ff1f               lcall es:[bx]
loc_D1FE:
9:D1FE  66ff7606             push dword ptr [bp + 6]
9:D202  90                   nop
9:D203  0e                   push cs
9:D204  e8f1de               call 0xb0f8  ; BuildingDlgBase::~BuildingDlgBase@s9:B0F8
9:D207  5e                   pop si
9:D208  c9                   leave
9:D209  ca0400               retf 4

; ---------------- TransitInfoDlg::showRoute@s9:D20C FAR size=144 callers=1
;   apis: USER.SendDlgItemMessage
;   the route's stops
9:D20C  c8080100             enter 0x108, 0
9:D210  66837e0a00           cmp dword ptr [bp + 0xa], 0
9:D215  750d                 jne 0xd224
9:D217  66ff7606             push dword ptr [bp + 6]
9:D21B  90                   nop
9:D21C  0e                   push cs
9:D21D  e8ee03               call 0xd60e  ; TransitInfoDlg::enableAdd@s9:D60E
9:D220  c9                   leave
9:D221  ca0800               retf 8
loc_D224:
9:D224  c45e06               les bx, ptr [bp + 6]
9:D227  2683bfa00000         cmp word ptr es:[bx + 0xa0], 0
9:D22D  7469                 je 0xd298
9:D22F  66ff760a             push dword ptr [bp + 0xa]
9:D233  6626ffb79c00         push dword ptr es:[bx + 0x9c]
9:D239  9a10926dd2           lcall 0xd26d, 0x9210  ; Route::stop@s3:9210
9:D23E  66ff7606             push dword ptr [bp + 6]
9:D242  90                   nop
9:D243  0e                   push cs
9:D244  e8c703               call 0xd60e  ; TransitInfoDlg::enableAdd@s9:D60E
9:D247  66ff760a             push dword ptr [bp + 0xa]
9:D24B  66ff364857           push dword ptr [0x5748]  ; g_sim
9:D250  9a448358ae           lcall 0xae58, 0x8344  ; Sim::resolve@s7:8344
9:D255  8946fc               mov word ptr [bp - 4], ax
9:D258  8956fe               mov word ptr [bp - 2], dx
9:D25B  52                   push dx
9:D25C  50                   push ax
9:D25D  8d86fcfe             lea ax, [bp - 0x104]
9:D261  16                   push ss
9:D262  50                   push ax
9:D263  6a03                 push 3
9:D265  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:D26A  9aba207cd2           lcall 0xd27c, 0x20ba  ; Registry_get@s3:20BA
9:D26F  8986f8fe             mov word ptr [bp - 0x108], ax
9:D273  8996fafe             mov word ptr [bp - 0x106], dx
9:D277  52                   push dx
9:D278  50                   push ax
9:D279  9ac2c345d1           lcall 0xd145, 0xc3c2  ; objectLabel@s3:C3C2
9:D27E  c45e06               les bx, ptr [bp + 6]
9:D281  26ff7706             push word ptr es:[bx + 6]
9:D285  666801044718         push 0x18470401
9:D28B  6a00                 push 0
9:D28D  8d86fcfe             lea ax, [bp - 0x104]
9:D291  16                   push ss
9:D292  50                   push ax
9:D293  9a60cf0000           lcall 0, 0xcf60  ; USER.SendDlgItemMessage
loc_D298:
9:D298  c9                   leave
9:D299  ca0800               retf 8

; ---------------- TransitInfoDlg::refresh@s9:D29C FAR size=16 callers=0
;   (vslot 20)
9:D29C  55                   push bp
9:D29D  8bec                 mov bp, sp
9:D29F  66ff7606             push dword ptr [bp + 6]
9:D2A3  90                   nop
9:D2A4  0e                   push cs
9:D2A5  e8f404               call 0xd79c  ; TransitInfoDlg::fillRoute@s9:D79C
9:D2A8  c9                   leave
9:D2A9  ca0400               retf 4

; ---------------- TransitInfoDlg::onCommand@s9:D2AC size=292 callers=0
;   apis: USER.PostMessage, USER.SendDlgItemMessage
;   (vslot 4) add/remove stops, OK
9:D2AC  c8060000             enter 6, 0
9:D2B0  8b460e               mov ax, word ptr [bp + 0xe]
9:D2B3  3d4818               cmp ax, 0x1848
9:D2B6  7416                 je 0xd2ce
9:D2B8  0f87ea00             ja 0xd3a6
9:D2BC  2deb00               sub ax, 0xeb
9:D2BF  0f84cb00             je 0xd38e
9:D2C3  2d5617               sub ax, 0x1756
9:D2C6  0f84d000             je 0xd39a
9:D2CA  e9e600               jmp 0xd3b3
9:D2CD  db 90
loc_D2CE:
9:D2CE  c45e06               les bx, ptr [bp + 6]
9:D2D1  26ff7706             push word ptr es:[bx + 6]
9:D2D5  666805044718         push 0x18470405
9:D2DB  666a00               push 0
9:D2DE  6a00                 push 0
9:D2E0  9a09d30000           lcall 0, 0xd309  ; USER.SendDlgItemMessage
9:D2E5  c45e06               les bx, ptr [bp + 6]
9:D2E8  6626ffb79c00         push dword ptr es:[bx + 0x9c]
9:D2EE  9a72913bd3           lcall 0xd33b, 0x9172  ; Route::add@s3:9172
9:D2F3  e9d200               jmp 0xd3c8
loc_D2F6:
9:D2F6  c45e06               les bx, ptr [bp + 6]
9:D2F9  26ff7706             push word ptr es:[bx + 6]
9:D2FD  66680c044718         push 0x1847040c
9:D303  666a00               push 0
9:D306  6a00                 push 0
9:D308  9a2bd30000           lcall 0, 0xd32b  ; USER.SendDlgItemMessage
9:D30D  3dffff               cmp ax, 0xffff
9:D310  7506                 jne 0xd318
9:D312  3bd0                 cmp dx, ax
9:D314  0f84b000             je 0xd3c8
loc_D318:
9:D318  48                   dec ax
9:D319  c45e06               les bx, ptr [bp + 6]
9:D31C  26ff7706             push word ptr es:[bx + 6]
9:D320  666803044718         push 0x18470403
9:D326  50                   push ax
9:D327  666a00               push 0
9:D32A  9a94d20000           lcall 0, 0xd294  ; USER.SendDlgItemMessage
9:D32F  c45e06               les bx, ptr [bp + 6]
9:D332  6626ffb79c00         push dword ptr es:[bx + 0x9c]
9:D338  9acc913cd2           lcall 0xd23c, 0x91cc  ; Route::removeLast@s3:91CC
9:D33D  e98800               jmp 0xd3c8
loc_D340:
9:D340  66ff7606             push dword ptr [bp + 6]
9:D344  90                   nop
9:D345  0e                   push cs
9:D346  e87503               call 0xd6be  ; TransitInfoDlg::enableRemove@s9:D6BE
9:D349  c45e06               les bx, ptr [bp + 6]
9:D34C  06                   push es
9:D34D  53                   push bx
9:D34E  6626ffb79400         push dword ptr es:[bx + 0x94]
9:D354  9ad25763d1           lcall 0xd163, 0x57d2  ; RouteEdit::setRoute@s4:57D2
9:D359  ff369603             push word ptr [0x396]
9:D35D  666803021101         push 0x1110203
9:D363  666a00               push 0
9:D366  9a36a80000           lcall 0, 0xa836  ; USER.PostMessage
9:D36B  eb5b                 jmp 0xd3c8
9:D36D  db 90
loc_D36E:
9:D36E  c45e06               les bx, ptr [bp + 6]
9:D371  66268b879800         mov eax, dword ptr es:[bx + 0x98]
9:D377  66a3685a             mov dword ptr [0x5a68], eax
9:D37B  6a27                 push 0x27
9:D37D  26ff7706             push word ptr es:[bx + 6]
9:D381  66ff367c5b           push dword ptr [0x5b7c]
9:D386  9a40afdbd1           lcall 0xd1db, 0xaf40  ; DialogCtr::open@s8:AF40
9:D38B  eb3b                 jmp 0xd3c8
9:D38D  db 90
loc_D38E:
9:D38E  66ff7606             push dword ptr [bp + 6]
9:D392  90                   nop
9:D393  0e                   push cs
9:D394  e80504               call 0xd79c  ; TransitInfoDlg::fillRoute@s9:D79C
9:D397  eb2f                 jmp 0xd3c8
9:D399  db 90
loc_D39A:
9:D39A  66ff7606             push dword ptr [bp + 6]
9:D39E  90                   nop
9:D39F  0e                   push cs
9:D3A0  e82d00               call 0xd3d0  ; TransitInfoDlg::message@s9:D3D0
9:D3A3  eb23                 jmp 0xd3c8
9:D3A5  db 90
loc_D3A6:
9:D3A6  2d4918               sub ax, 0x1849
9:D3A9  0f8449ff             je 0xd2f6
9:D3AD  48                   dec ax
9:D3AE  7490                 je 0xd340
9:D3B0  48                   dec ax
9:D3B1  74bb                 je 0xd36e
loc_D3B3:
9:D3B3  66ff760c             push dword ptr [bp + 0xc]
9:D3B7  66ff7608             push dword ptr [bp + 8]
9:D3BB  ff7606               push word ptr [bp + 6]
9:D3BE  90                   nop
9:D3BF  0e                   push cs
9:D3C0  e887e1               call 0xb54a  ; BuildingDlgBase::onCommand@s9:B54A
9:D3C3  c9                   leave
9:D3C4  ca0a00               retf 0xa
9:D3C7  db 90
loc_D3C8:
9:D3C8  b80100               mov ax, 1
9:D3CB  99                   cdq
9:D3CC  c9                   leave
9:D3CD  ca0a00               retf 0xa

; ---------------- TransitInfoDlg::message@s9:D3D0 FAR size=574 callers=1
;   apis: USER.MessageBox
;   a message box
9:D3D0  c8100200             enter 0x210, 0
9:D3D4  680010               push 0x1000
9:D3D7  9a9c1736d4           lcall 0xd436, 0x179c  ; operator_new@s1:179C
9:D3DC  83c402               add sp, 2
9:D3DF  8986f8fd             mov word ptr [bp - 0x208], ax
9:D3E3  8996fafd             mov word ptr [bp - 0x206], dx
9:D3E7  687b05               push 0x57b
9:D3EA  8d86fcfd             lea ax, [bp - 0x204]
9:D3EE  16                   push ss
9:D3EF  50                   push ax
9:D3F0  680001               push 0x100
9:D3F3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D3F8  9ae08410d4           lcall 0xd410, 0x84e0  ; LoadStringTo@s3:84E0
9:D3FD  68da07               push 0x7da
9:D400  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D405  68ff03               push 0x3ff
9:D408  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D40D  9ae08426d4           lcall 0xd426, 0x84e0  ; LoadStringTo@s3:84E0
9:D412  68db07               push 0x7db
9:D415  8d86fefe             lea ax, [bp - 0x102]
9:D419  16                   push ss
9:D41A  50                   push ax
9:D41B  68ff03               push 0x3ff
9:D41E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D423  9ae0844fd4           lcall 0xd44f, 0x84e0  ; LoadStringTo@s3:84E0
9:D428  8d86fefe             lea ax, [bp - 0x102]
9:D42C  16                   push ss
9:D42D  50                   push ax
9:D42E  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D433  9aea3c5fd4           lcall 0xd45f, 0x3cea  ; _fstrcat@s1:3CEA
9:D438  83c408               add sp, 8
9:D43B  68dc07               push 0x7dc
9:D43E  8d86fefe             lea ax, [bp - 0x102]
9:D442  16                   push ss
9:D443  50                   push ax
9:D444  68ff03               push 0x3ff
9:D447  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D44C  9ae08478d4           lcall 0xd478, 0x84e0  ; LoadStringTo@s3:84E0
9:D451  8d86fefe             lea ax, [bp - 0x102]
9:D455  16                   push ss
9:D456  50                   push ax
9:D457  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D45C  9aea3c88d4           lcall 0xd488, 0x3cea  ; _fstrcat@s1:3CEA
9:D461  83c408               add sp, 8
9:D464  68dd07               push 0x7dd
9:D467  8d86fefe             lea ax, [bp - 0x102]
9:D46B  16                   push ss
9:D46C  50                   push ax
9:D46D  68ff03               push 0x3ff
9:D470  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D475  9ae084a1d4           lcall 0xd4a1, 0x84e0  ; LoadStringTo@s3:84E0
9:D47A  8d86fefe             lea ax, [bp - 0x102]
9:D47E  16                   push ss
9:D47F  50                   push ax
9:D480  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D485  9aea3cb1d4           lcall 0xd4b1, 0x3cea  ; _fstrcat@s1:3CEA
9:D48A  83c408               add sp, 8
9:D48D  68de07               push 0x7de
9:D490  8d86fefe             lea ax, [bp - 0x102]
9:D494  16                   push ss
9:D495  50                   push ax
9:D496  68ff03               push 0x3ff
9:D499  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D49E  9ae084cad4           lcall 0xd4ca, 0x84e0  ; LoadStringTo@s3:84E0
9:D4A3  8d86fefe             lea ax, [bp - 0x102]
9:D4A7  16                   push ss
9:D4A8  50                   push ax
9:D4A9  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D4AE  9aea3cdad4           lcall 0xd4da, 0x3cea  ; _fstrcat@s1:3CEA
9:D4B3  83c408               add sp, 8
9:D4B6  68df07               push 0x7df
9:D4B9  8d86fefe             lea ax, [bp - 0x102]
9:D4BD  16                   push ss
9:D4BE  50                   push ax
9:D4BF  68ff03               push 0x3ff
9:D4C2  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D4C7  9ae0840bd5           lcall 0xd50b, 0x84e0  ; LoadStringTo@s3:84E0
9:D4CC  8d86fefe             lea ax, [bp - 0x102]
9:D4D0  16                   push ss
9:D4D1  50                   push ax
9:D4D2  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D4D7  9aea3c31d5           lcall 0xd531, 0x3cea  ; _fstrcat@s1:3CEA
9:D4DC  83c408               add sp, 8
9:D4DF  c45e06               les bx, ptr [bp + 6]
9:D4E2  26ff7706             push word ptr es:[bx + 6]
9:D4E6  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D4EB  8d86fcfd             lea ax, [bp - 0x204]
9:D4EF  16                   push ss
9:D4F0  50                   push ax
9:D4F1  6a00                 push 0
9:D4F3  9aefd50000           lcall 0, 0xd5ef  ; USER.MessageBox
9:D4F8  68e007               push 0x7e0
9:D4FB  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D500  68ff03               push 0x3ff
9:D503  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D508  9ae08421d5           lcall 0xd521, 0x84e0  ; LoadStringTo@s3:84E0
9:D50D  68e107               push 0x7e1
9:D510  8d86fefe             lea ax, [bp - 0x102]
9:D514  16                   push ss
9:D515  50                   push ax
9:D516  68ff03               push 0x3ff
9:D519  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D51E  9ae0844ad5           lcall 0xd54a, 0x84e0  ; LoadStringTo@s3:84E0
9:D523  8d86fefe             lea ax, [bp - 0x102]
9:D527  16                   push ss
9:D528  50                   push ax
9:D529  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D52E  9aea3c5ad5           lcall 0xd55a, 0x3cea  ; _fstrcat@s1:3CEA
9:D533  83c408               add sp, 8
9:D536  68e207               push 0x7e2
9:D539  8d86fefe             lea ax, [bp - 0x102]
9:D53D  16                   push ss
9:D53E  50                   push ax
9:D53F  68ff03               push 0x3ff
9:D542  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D547  9ae08473d5           lcall 0xd573, 0x84e0  ; LoadStringTo@s3:84E0
9:D54C  8d86fefe             lea ax, [bp - 0x102]
9:D550  16                   push ss
9:D551  50                   push ax
9:D552  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D557  9aea3c83d5           lcall 0xd583, 0x3cea  ; _fstrcat@s1:3CEA
9:D55C  83c408               add sp, 8
9:D55F  68e307               push 0x7e3
9:D562  8d86fefe             lea ax, [bp - 0x102]
9:D566  16                   push ss
9:D567  50                   push ax
9:D568  68ff03               push 0x3ff
9:D56B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D570  9ae0849cd5           lcall 0xd59c, 0x84e0  ; LoadStringTo@s3:84E0
9:D575  8d86fefe             lea ax, [bp - 0x102]
9:D579  16                   push ss
9:D57A  50                   push ax
9:D57B  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D580  9aea3cacd5           lcall 0xd5ac, 0x3cea  ; _fstrcat@s1:3CEA
9:D585  83c408               add sp, 8
9:D588  68e407               push 0x7e4
9:D58B  8d86fefe             lea ax, [bp - 0x102]
9:D58F  16                   push ss
9:D590  50                   push ax
9:D591  68ff03               push 0x3ff
9:D594  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D599  9ae084c5d5           lcall 0xd5c5, 0x84e0  ; LoadStringTo@s3:84E0
9:D59E  8d86fefe             lea ax, [bp - 0x102]
9:D5A2  16                   push ss
9:D5A3  50                   push ax
9:D5A4  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D5A9  9aea3cd5d5           lcall 0xd5d5, 0x3cea  ; _fstrcat@s1:3CEA
9:D5AE  83c408               add sp, 8
9:D5B1  68e507               push 0x7e5
9:D5B4  8d86fefe             lea ax, [bp - 0x102]
9:D5B8  16                   push ss
9:D5B9  50                   push ax
9:D5BA  68ff03               push 0x3ff
9:D5BD  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
9:D5C2  9ae084f1d2           lcall 0xd2f1, 0x84e0  ; LoadStringTo@s3:84E0
9:D5C7  8d86fefe             lea ax, [bp - 0x102]
9:D5CB  16                   push ss
9:D5CC  50                   push ax
9:D5CD  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D5D2  9aea3c07d6           lcall 0xd607, 0x3cea  ; _fstrcat@s1:3CEA
9:D5D7  83c408               add sp, 8
9:D5DA  c45e06               les bx, ptr [bp + 6]
9:D5DD  26ff7706             push word ptr es:[bx + 6]
9:D5E1  66ffb6f8fd           push dword ptr [bp - 0x208]
9:D5E6  8d86fcfd             lea ax, [bp - 0x204]
9:D5EA  16                   push ss
9:D5EB  50                   push ax
9:D5EC  6a00                 push 0
9:D5EE  9a8dcd0000           lcall 0, 0xcd8d  ; USER.MessageBox
9:D5F3  668b86f8fd           mov eax, dword ptr [bp - 0x208]
9:D5F8  668986f4fd           mov dword ptr [bp - 0x20c], eax
9:D5FD  668986f0fd           mov dword ptr [bp - 0x210], eax
9:D602  6650                 push eax
9:D604  9ace1780d1           lcall 0xd180, 0x17ce  ; operator_delete@s1:17CE
9:D609  c9                   leave
9:D60A  ca0400               retf 4
9:D60D  db 00

; ---------------- TransitInfoDlg::enableAdd@s9:D60E FAR size=176 callers=1
;   apis: USER.EnableWindow, USER.GetDlgItem
;   buttons
9:D60E  55                   push bp
9:D60F  8bec                 mov bp, sp
9:D611  c45e06               les bx, ptr [bp + 6]
9:D614  26ff7706             push word ptr es:[bx + 6]
9:D618  6a01                 push 1
9:D61A  9a31d60000           lcall 0, 0xd631  ; USER.GetDlgItem
9:D61F  50                   push ax
9:D620  6a01                 push 1
9:D622  9a39d60000           lcall 0, 0xd639  ; USER.EnableWindow
9:D627  c45e06               les bx, ptr [bp + 6]
9:D62A  26ff7706             push word ptr es:[bx + 6]
9:D62E  6a02                 push 2
9:D630  9a48d60000           lcall 0, 0xd648  ; USER.GetDlgItem
9:D635  50                   push ax
9:D636  6a01                 push 1
9:D638  9a50d60000           lcall 0, 0xd650  ; USER.EnableWindow
9:D63D  c45e06               les bx, ptr [bp + 6]
9:D640  26ff7706             push word ptr es:[bx + 6]
9:D644  684118               push 0x1841
9:D647  9a5fd60000           lcall 0, 0xd65f  ; USER.GetDlgItem
9:D64C  50                   push ax
9:D64D  6a01                 push 1
9:D64F  9a67d60000           lcall 0, 0xd667  ; USER.EnableWindow
9:D654  c45e06               les bx, ptr [bp + 6]
9:D657  26ff7706             push word ptr es:[bx + 6]
9:D65B  684818               push 0x1848
9:D65E  9a76d60000           lcall 0, 0xd676  ; USER.GetDlgItem
9:D663  50                   push ax
9:D664  6a01                 push 1
9:D666  9a7ed60000           lcall 0, 0xd67e  ; USER.EnableWindow
9:D66B  c45e06               les bx, ptr [bp + 6]
9:D66E  26ff7706             push word ptr es:[bx + 6]
9:D672  684918               push 0x1849
9:D675  9a8dd60000           lcall 0, 0xd68d  ; USER.GetDlgItem
9:D67A  50                   push ax
9:D67B  6a01                 push 1
9:D67D  9a95d60000           lcall 0, 0xd695  ; USER.EnableWindow
9:D682  c45e06               les bx, ptr [bp + 6]
9:D685  26ff7706             push word ptr es:[bx + 6]
9:D689  684a18               push 0x184a
9:D68C  9aa4d60000           lcall 0, 0xd6a4  ; USER.GetDlgItem
9:D691  50                   push ax
9:D692  6a01                 push 1
9:D694  9aacd60000           lcall 0, 0xd6ac  ; USER.EnableWindow
9:D699  c45e06               les bx, ptr [bp + 6]
9:D69C  26ff7706             push word ptr es:[bx + 6]
9:D6A0  684b18               push 0x184b
9:D6A3  9a17d00000           lcall 0, 0xd017  ; USER.GetDlgItem
9:D6A8  50                   push ax
9:D6A9  6a01                 push 1
9:D6AB  9a1fd00000           lcall 0, 0xd01f  ; USER.EnableWindow
9:D6B0  c45e06               les bx, ptr [bp + 6]
9:D6B3  26c787a0000000       mov word ptr es:[bx + 0xa0], 0
9:D6BA  c9                   leave
9:D6BB  ca0400               retf 4

; ---------------- TransitInfoDlg::enableRemove@s9:D6BE FAR size=176 callers=1
;   apis: USER.EnableWindow, USER.GetDlgItem
;   buttons
9:D6BE  55                   push bp
9:D6BF  8bec                 mov bp, sp
9:D6C1  c45e06               les bx, ptr [bp + 6]
9:D6C4  26ff7706             push word ptr es:[bx + 6]
9:D6C8  6a01                 push 1
9:D6CA  9ae1d60000           lcall 0, 0xd6e1  ; USER.GetDlgItem
9:D6CF  50                   push ax
9:D6D0  6a00                 push 0
9:D6D2  9ae9d60000           lcall 0, 0xd6e9  ; USER.EnableWindow
9:D6D7  c45e06               les bx, ptr [bp + 6]
9:D6DA  26ff7706             push word ptr es:[bx + 6]
9:D6DE  6a02                 push 2
9:D6E0  9af8d60000           lcall 0, 0xd6f8  ; USER.GetDlgItem
9:D6E5  50                   push ax
9:D6E6  6a00                 push 0
9:D6E8  9a00d70000           lcall 0, 0xd700  ; USER.EnableWindow
9:D6ED  c45e06               les bx, ptr [bp + 6]
9:D6F0  26ff7706             push word ptr es:[bx + 6]
9:D6F4  684118               push 0x1841
9:D6F7  9a0fd70000           lcall 0, 0xd70f  ; USER.GetDlgItem
9:D6FC  50                   push ax
9:D6FD  6a00                 push 0
9:D6FF  9a17d70000           lcall 0, 0xd717  ; USER.EnableWindow
9:D704  c45e06               les bx, ptr [bp + 6]
9:D707  26ff7706             push word ptr es:[bx + 6]
9:D70B  684818               push 0x1848
9:D70E  9a26d70000           lcall 0, 0xd726  ; USER.GetDlgItem
9:D713  50                   push ax
9:D714  6a00                 push 0
9:D716  9a2ed70000           lcall 0, 0xd72e  ; USER.EnableWindow
9:D71B  c45e06               les bx, ptr [bp + 6]
9:D71E  26ff7706             push word ptr es:[bx + 6]
9:D722  684918               push 0x1849
9:D725  9a3dd70000           lcall 0, 0xd73d  ; USER.GetDlgItem
9:D72A  50                   push ax
9:D72B  6a00                 push 0
9:D72D  9a45d70000           lcall 0, 0xd745  ; USER.EnableWindow
9:D732  c45e06               les bx, ptr [bp + 6]
9:D735  26ff7706             push word ptr es:[bx + 6]
9:D739  684a18               push 0x184a
9:D73C  9a54d70000           lcall 0, 0xd754  ; USER.GetDlgItem
9:D741  50                   push ax
9:D742  6a00                 push 0
9:D744  9a5cd70000           lcall 0, 0xd75c  ; USER.EnableWindow
9:D749  c45e06               les bx, ptr [bp + 6]
9:D74C  26ff7706             push word ptr es:[bx + 6]
9:D750  684b18               push 0x184b
9:D753  9a1bd60000           lcall 0, 0xd61b  ; USER.GetDlgItem
9:D758  50                   push ax
9:D759  6a00                 push 0
9:D75B  9a23d60000           lcall 0, 0xd623  ; USER.EnableWindow
9:D760  c45e06               les bx, ptr [bp + 6]
9:D763  26c787a0000100       mov word ptr es:[bx + 0xa0], 1
9:D76A  c9                   leave
9:D76B  ca0400               retf 4

; ---------------- TransitInfoDlg::addStop@s9:D76E FAR size=46 callers=0
;   (vslot 30)
9:D76E  55                   push bp
9:D76F  8bec                 mov bp, sp
9:D771  c45e06               les bx, ptr [bp + 6]
9:D774  6626ffb79800         push dword ptr es:[bx + 0x98]
9:D77A  6626ffb79c00         push dword ptr es:[bx + 0x9c]
9:D780  6626ffb79400         push dword ptr es:[bx + 0x94]
9:D786  9a425757d3           lcall 0xd357, 0x5742  ; RouteEdit::addStop@s4:5742
9:D78B  c45e06               les bx, ptr [bp + 6]
9:D78E  6626c7879c0000000000 mov dword ptr es:[bx + 0x9c], 0
9:D798  c9                   leave
9:D799  ca0400               retf 4

; ---------------- TransitInfoDlg::fillRoute@s9:D79C FAR size=258 callers=2
;   apis: USER.SendDlgItemMessage
;   the stop list
9:D79C  c80c0100             enter 0x10c, 0
9:D7A0  6a03                 push 3
9:D7A2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
9:D7A7  9aba20c8d7           lcall 0xd7c8, 0x20ba  ; Registry_get@s3:20BA
9:D7AC  8946fc               mov word ptr [bp - 4], ax
9:D7AF  8956fe               mov word ptr [bp - 2], dx
9:D7B2  c45e06               les bx, ptr [bp + 6]
9:D7B5  6626ffb79800         push dword ptr es:[bx + 0x98]
9:D7BB  8d86fcfe             lea ax, [bp - 0x104]
9:D7BF  16                   push ss
9:D7C0  50                   push ax
9:D7C1  66ff76fc             push dword ptr [bp - 4]
9:D7C5  9ac2c31ed8           lcall 0xd81e, 0xc3c2  ; objectLabel@s3:C3C2
9:D7CA  c45e06               les bx, ptr [bp + 6]
9:D7CD  26ff7706             push word ptr es:[bx + 6]
9:D7D1  66680c004618         push 0x1846000c
9:D7D7  6a00                 push 0
9:D7D9  8d86fcfe             lea ax, [bp - 0x104]
9:D7DD  16                   push ss
9:D7DE  50                   push ax
9:D7DF  9af7d70000           lcall 0, 0xd7f7  ; USER.SendDlgItemMessage
9:D7E4  c45e06               les bx, ptr [bp + 6]
9:D7E7  26ff7706             push word ptr es:[bx + 6]
9:D7EB  66680b004718         push 0x1847000b
9:D7F1  666a00               push 0
9:D7F4  6a00                 push 0
9:D7F6  9a0ed80000           lcall 0, 0xd80e  ; USER.SendDlgItemMessage
9:D7FB  c45e06               les bx, ptr [bp + 6]
9:D7FE  26ff7706             push word ptr es:[bx + 6]
9:D802  666805044718         push 0x18470405
9:D808  666a00               push 0
9:D80B  6a00                 push 0
9:D80D  9a7ad80000           lcall 0, 0xd87a  ; USER.SendDlgItemMessage
9:D812  c45e06               les bx, ptr [bp + 6]
9:D815  6626ffb79c00         push dword ptr es:[bx + 0x9c]
9:D81B  9a44905bd8           lcall 0xd85b, 0x9044  ; Route::count@s3:9044
9:D820  8986f8fe             mov word ptr [bp - 0x108], ax
9:D824  8996fafe             mov word ptr [bp - 0x106], dx
9:D828  66c786f4fe00000000   mov dword ptr [bp - 0x10c], 0
9:D831  eb06                 jmp 0xd839
9:D833  db 90
loc_D834:
9:D834  66ff86f4fe           inc dword ptr [bp - 0x10c]
loc_D839:
9:D839  668b86f8fe           mov eax, dword ptr [bp - 0x108]
9:D83E  663986f4fe           cmp dword ptr [bp - 0x10c], eax
9:D843  733b                 jae 0xd880
9:D845  ffb6f4fe             push word ptr [bp - 0x10c]
9:D849  8d86fcfe             lea ax, [bp - 0x104]
9:D84D  16                   push ss
9:D84E  50                   push ax
9:D84F  c45e06               les bx, ptr [bp + 6]
9:D852  6626ffb79c00         push dword ptr es:[bx + 0x9c]
9:D858  9a3091fbd3           lcall 0xd3fb, 0x9130  ; Route::stopName@s3:9130
9:D85D  80befcfe00           cmp byte ptr [bp - 0x104], 0
9:D862  74d0                 je 0xd834
9:D864  c45e06               les bx, ptr [bp + 6]
9:D867  26ff7706             push word ptr es:[bx + 6]
9:D86B  666801044718         push 0x18470401
9:D871  6a00                 push 0
9:D873  8d86fcfe             lea ax, [bp - 0x104]
9:D877  16                   push ss
9:D878  50                   push ax
9:D879  9a96d80000           lcall 0, 0xd896  ; USER.SendDlgItemMessage
9:D87E  ebb4                 jmp 0xd834
loc_D880:
9:D880  c45e06               les bx, ptr [bp + 6]
9:D883  26ff7706             push word ptr es:[bx + 6]
9:D887  66680b004718         push 0x1847000b
9:D88D  666800000100         push 0x10000
9:D893  6a00                 push 0
9:D895  9ae1d20000           lcall 0, 0xd2e1  ; USER.SendDlgItemMessage
9:D89A  c9                   leave
9:D89B  ca0400               retf 4

; ---------------- TransitInfoDlg::scalar_dtor@s9:D89E FAR size=214 callers=0
;   deleting destructor
9:D89E  55                   push bp
9:D89F  8bec                 mov bp, sp
9:D8A1  66ff7606             push dword ptr [bp + 6]
9:D8A5  90                   nop
9:D8A6  0e                   push cs
9:D8A7  e812f9               call 0xd1bc  ; TransitInfoDlg::~TransitInfoDlg@s9:D1BC
9:D8AA  f6460a01             test byte ptr [bp + 0xa], 1
9:D8AE  7409                 je 0xd8b9
9:D8B0  66ff7606             push dword ptr [bp + 6]
9:D8B4  9ace17dad3           lcall 0xd3da, 0x17ce  ; operator_delete@s1:17CE
loc_D8B9:
9:D8B9  8b4606               mov ax, word ptr [bp + 6]
9:D8BC  8b5608               mov dx, word ptr [bp + 8]
9:D8BF  c9                   leave
9:D8C0  ca0600               retf 6
9:D8C3  db 90 9e d8 ce d8 10 3a 82 d0 30 b2 d2 d8 16 b3 d6
9:D8D3  db d8 ac d2 da d8 26 b7 de d8 56 7f e2 d8 b2 7b e6
9:D8E3  db d8 1c 7f ee d8 48 88 26 d9 86 7f f2 d8 0c 80 f6
9:D8F3  db d8 54 80 fa d8 72 b3 fe d8 58 81 02 d9 b6 81 06
9:D903  db d9 fe 81 0e d9 ea 60 1a d9 4a 82 12 d9 66 82 16
9:D913  db d9 9c d2 22 d9 ee 60 1e d9 f4 60 2a d9 c8 b4 2e
9:D923  db d9 42 88 89 d3 fe 60 89 d7 7e 80 32 d9 3c b4 36
9:D933  db d9 5e b4 3a d9 7c b1 3e d9 6e d7 cd d1 0a 0d 53
9:D943  db 6d 61 72 74 48 65 61 70 20 65 72 72 6f 72 20 68
9:D953  db 61 6e 64 6c 65 72 20 72 65 63 75 72 73 69 76 65
9:D963  db 6c 79 20 72 65 2d 65 6e 74 65 72 65 64 2e 0a 0d
9:D973  db 00
