; OUTPOST.EXE segment 2 (CODE), 61408 bytes

; ---------------- sub_s2:0000 FAR size=54 callers=1
2:0000  c8040000             enter 4, 0
2:0004  c45e06               les bx, ptr [bp + 6]
2:0007  26c7072a05           mov word ptr es:[bx], 0x52a
2:000C  26c747022b00         mov word ptr es:[bx + 2], 0x2b  ; SEGMENT s2:0000
2:0012  c45e06               les bx, ptr [bp + 6]
2:0015  662bc0               sub eax, eax
2:0018  6626894704           mov dword ptr es:[bx + 4], eax
2:001D  6626894708           mov dword ptr es:[bx + 8], eax
2:0022  26c7071e05           mov word ptr es:[bx], 0x51e
2:0027  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT s2:0000
2:002D  8bc3                 mov ax, bx
2:002F  8cc2                 mov dx, es
2:0031  c9                   leave
2:0032  ca0400               retf 4
2:0035  db 00

; ---------------- sub_s2:0036 FAR size=312 callers=1
2:0036  c8100000             enter 0x10, 0
2:003A  c45e06               les bx, ptr [bp + 6]
2:003D  26c7071e05           mov word ptr es:[bx], 0x51e
2:0042  26c747021000         mov word ptr es:[bx + 2], 0x10  ; SEGMENT s2:0000
2:0048  66268b4708           mov eax, dword ptr es:[bx + 8]
2:004D  268b570a             mov dx, word ptr es:[bx + 0xa]
2:0051  668946f8             mov dword ptr [bp - 8], eax
2:0055  668946fc             mov dword ptr [bp - 4], eax
2:0059  8bda                 mov bx, dx
2:005B  0bd0                 or dx, ax
2:005D  7413                 je 0x72
2:005F  53                   push bx
2:0060  50                   push ax
2:0061  90                   nop
2:0062  0e                   push cs
2:0063  e84453               call 0x53aa  ; sub_s2:53AA
2:0066  66ff76fc             push dword ptr [bp - 4]
2:006A  9ace179d00           lcall 0x9d, 0x17ce  ; operator_delete@s1:17CE
2:006F  83c404               add sp, 4
loc_0072:
2:0072  66c706980200000000   mov dword ptr [0x298], 0
2:007B  66a14857             mov eax, dword ptr [0x5748]  ; g_sim
2:007F  668946fc             mov dword ptr [bp - 4], eax
2:0083  668946f8             mov dword ptr [bp - 8], eax
2:0087  660bc0               or eax, eax
2:008A  7416                 je 0xa2
2:008C  ff364a57             push word ptr [0x574a]  ; g_sim+2
2:0090  50                   push ax
2:0091  9a1082ffff           lcall 0xffff, 0x8210  ; sub_s7:8210
2:0096  66ff76f8             push dword ptr [bp - 8]
2:009A  9ace17c400           lcall 0xc4, 0x17ce  ; operator_delete@s1:17CE
2:009F  83c404               add sp, 4
loc_00A2:
2:00A2  66a1d00e             mov eax, dword ptr [0xed0]  ; g_registry
2:00A6  668946f8             mov dword ptr [bp - 8], eax
2:00AA  668946fc             mov dword ptr [bp - 4], eax
2:00AE  660bc0               or eax, eax
2:00B1  7416                 je 0xc9
2:00B3  ff36d20e             push word ptr [0xed2]  ; g_registry+2
2:00B7  50                   push ax
2:00B8  9a5020e200           lcall 0xe2, 0x2050  ; sub_s3:2050
2:00BD  66ff76fc             push dword ptr [bp - 4]
2:00C1  9ace17eb00           lcall 0xeb, 0x17ce  ; operator_delete@s1:17CE
2:00C6  83c404               add sp, 4
loc_00C9:
2:00C9  66a1cc14             mov eax, dword ptr [0x14cc]  ; g_hInstRes
2:00CD  668946fc             mov dword ptr [bp - 4], eax
2:00D1  668946f8             mov dword ptr [bp - 8], eax
2:00D5  660bc0               or eax, eax
2:00D8  7416                 je 0xf0
2:00DA  ff36ce14             push word ptr [0x14ce]  ; g_hInstRes+2
2:00DE  50                   push ax
2:00DF  9afc7effff           lcall 0xffff, 0x7efc  ; sub_s3:7EFC
2:00E4  66ff76f8             push dword ptr [bp - 8]
2:00E8  9ace170e01           lcall 0x10e, 0x17ce  ; operator_delete@s1:17CE
2:00ED  83c404               add sp, 4
loc_00F0:
2:00F0  66a17c5b             mov eax, dword ptr [0x5b7c]
2:00F4  668946fc             mov dword ptr [bp - 4], eax
2:00F8  660bc0               or eax, eax
2:00FB  7416                 je 0x113
2:00FD  ff367e5b             push word ptr [0x5b7e]
2:0101  50                   push ax
2:0102  9a34afffff           lcall 0xffff, 0xaf34  ; sub_s8:AF34
2:0107  66ff76fc             push dword ptr [bp - 4]
2:010B  9ace17ffff           lcall 0xffff, 0x17ce  ; operator_delete@s1:17CE
2:0110  83c404               add sp, 4
loc_0113:
2:0113  66a1c85b             mov eax, dword ptr [0x5bc8]
2:0117  660bc0               or eax, eax
2:011A  740e                 je 0x12a
2:011C  6a01                 push 1
2:011E  c41ec85b             les bx, ptr [0x5bc8]
2:0122  06                   push es
2:0123  50                   push ax
2:0124  26c41f               les bx, ptr es:[bx]
2:0127  26ff1f               lcall es:[bx]
loc_012A:
2:012A  66a1a002             mov eax, dword ptr [0x2a0]
2:012E  660bc0               or eax, eax
2:0131  740e                 je 0x141
2:0133  6a01                 push 1
2:0135  c41ea002             les bx, ptr [0x2a0]
2:0139  06                   push es
2:013A  50                   push ax
2:013B  26c41f               les bx, ptr es:[bx]
2:013E  26ff1f               lcall es:[bx]
loc_0141:
2:0141  c45e06               les bx, ptr [bp + 6]
2:0144  268b4704             mov ax, word ptr es:[bx + 4]
2:0148  268b5706             mov dx, word ptr es:[bx + 6]
2:014C  8bda                 mov bx, dx
2:014E  0bd8                 or bx, ax
2:0150  740e                 je 0x160
2:0152  6a01                 push 1
2:0154  52                   push dx
2:0155  50                   push ax
2:0156  8ec2                 mov es, dx
2:0158  8bd8                 mov bx, ax
2:015A  26c41f               les bx, ptr es:[bx]
2:015D  26ff1f               lcall es:[bx]
loc_0160:
2:0160  66ff7606             push dword ptr [bp + 6]
2:0164  90                   nop
2:0165  0e                   push cs
2:0166  e8fd92               call 0xffff9466  ; sub_s2:9466
2:0169  c9                   leave
2:016A  ca0400               retf 4
2:016D  db 00

; ---------------- sub_s2:016E FAR size=814 callers=0
;   apis: KERNEL.GetVersion, USER.LoadString, USER.MessageBox, USER.UpdateWindow
2:016E  c8be0100             enter 0x1be, 0
2:0172  9affff0000           lcall 0, 0xffff  ; KERNEL.GetVersion
2:0177  8946fc               mov word ptr [bp - 4], ax
2:017A  8956fe               mov word ptr [bp - 2], dx
2:017D  8bc8                 mov cx, ax
2:017F  2ae4                 sub ah, ah
2:0181  8946fa               mov word ptr [bp - 6], ax
2:0184  8acd                 mov cl, ch
2:0186  2aed                 sub ch, ch
2:0188  894ef8               mov word ptr [bp - 8], cx
2:018B  3d0300               cmp ax, 3
2:018E  7c07                 jl 0x197
2:0190  7555                 jne 0x1e7
2:0192  83f90a               cmp cx, 0xa
2:0195  7d50                 jge 0x1e7
loc_0197:
2:0197  68b400               push 0xb4
2:019A  9a9c17e201           lcall 0x1e2, 0x179c  ; operator_new@s1:179C
2:019F  83c402               add sp, 2
2:01A2  8946f0               mov word ptr [bp - 0x10], ax
2:01A5  8956f2               mov word ptr [bp - 0xe], dx
2:01A8  0bd0                 or dx, ax
2:01AA  741c                 je 0x1c8
2:01AC  6668de05dd05         push 0x5dd05de
2:01B2  666810000200         push 0x20010
2:01B8  6a00                 push 0
2:01BA  ff76f2               push word ptr [bp - 0xe]
2:01BD  50                   push ax
2:01BE  9a2085ffff           lcall 0xffff, 0x8520  ; sub_s9:8520
2:01C3  83c40e               add sp, 0xe
2:01C6  eb03                 jmp 0x1cb
loc_01C8:
2:01C8  33c0                 xor ax, ax
2:01CA  99                   cdq
loc_01CB:
2:01CB  8946f4               mov word ptr [bp - 0xc], ax
2:01CE  8956f6               mov word ptr [bp - 0xa], dx
2:01D1  52                   push dx
2:01D2  c45ef4               les bx, ptr [bp - 0xc]
2:01D5  50                   push ax
2:01D6  26c41f               les bx, ptr es:[bx]
2:01D9  26ff5f74             lcall es:[bx + 0x74]
2:01DD  6a01                 push 1
2:01DF  9acd243102           lcall 0x231, 0x24cd  ; sub_s1:24CD
2:01E4  83c402               add sp, 2
loc_01E7:
2:01E7  ff76f8               push word ptr [bp - 8]
2:01EA  ff76fa               push word ptr [bp - 6]
2:01ED  1e                   push ds
2:01EE  681200               push 0x12  ; 'version %d %d'
2:01F1  90                   nop
2:01F2  0e                   push cs
2:01F3  e8525e               call 0x6048  ; sub_s2:6048
2:01F6  83c408               add sp, 8
2:01F9  837efa03             cmp word ptr [bp - 6], 3
2:01FD  750c                 jne 0x20b
2:01FF  837ef80b             cmp word ptr [bp - 8], 0xb
2:0203  7e06                 jle 0x20b
2:0205  c70610000100         mov word ptr [0x10], 1
loc_020B:
2:020B  ff368c03             push word ptr [0x38c]
2:020F  687805               push 0x578
2:0212  8d8670ff             lea ax, [bp - 0x90]
2:0216  16                   push ss
2:0217  50                   push ax
2:0218  688000               push 0x80
2:021B  9a4b020000           lcall 0, 0x24b  ; USER.LoadString
2:0220  8d8644ff             lea ax, [bp - 0xbc]
2:0224  16                   push ss
2:0225  50                   push ax
2:0226  6a01                 push 1
2:0228  8d8670ff             lea ax, [bp - 0x90]
2:022C  16                   push ss
2:022D  50                   push ax
2:022E  9aaa517e02           lcall 0x27e, 0x51aa  ; sub_s1:51AA
2:0233  83c40a               add sp, 0xa
2:0236  0bc0                 or ax, ax
2:0238  7449                 je 0x283
2:023A  ff368c03             push word ptr [0x38c]
2:023E  687b05               push 0x57b
2:0241  8d86c4fe             lea ax, [bp - 0x13c]
2:0245  16                   push ss
2:0246  50                   push ax
2:0247  688000               push 0x80
2:024A  9a60020000           lcall 0, 0x260  ; USER.LoadString
2:024F  ff368c03             push word ptr [0x38c]
2:0253  682e06               push 0x62e
2:0256  8d8644fe             lea ax, [bp - 0x1bc]
2:025A  16                   push ss
2:025B  50                   push ax
2:025C  688000               push 0x80
2:025F  9affff0000           lcall 0, 0xffff  ; USER.LoadString
2:0264  6a00                 push 0
2:0266  8d8644fe             lea ax, [bp - 0x1bc]
2:026A  16                   push ss
2:026B  50                   push ax
2:026C  8d86c4fe             lea ax, [bp - 0x13c]
2:0270  16                   push ss
2:0271  50                   push ax
2:0272  6a10                 push 0x10
2:0274  9affff0000           lcall 0, 0xffff  ; USER.MessageBox
2:0279  6a01                 push 1
2:027B  9acd248802           lcall 0x288, 0x24cd  ; sub_s1:24CD
2:0280  83c402               add sp, 2
loc_0283:
2:0283  6a04                 push 4
2:0285  9a9c17d102           lcall 0x2d1, 0x179c  ; operator_new@s1:179C
2:028A  83c402               add sp, 2
2:028D  8946f0               mov word ptr [bp - 0x10], ax
2:0290  8956f2               mov word ptr [bp - 0xe], dx
2:0293  0bd0                 or dx, ax
2:0295  740b                 je 0x2a2
2:0297  ff76f2               push word ptr [bp - 0xe]
2:029A  50                   push ax
2:029B  90                   nop
2:029C  0e                   push cs
2:029D  e8f450               call 0x5394  ; sub_s2:5394
2:02A0  eb03                 jmp 0x2a5
loc_02A2:
2:02A2  33c0                 xor ax, ax
2:02A4  99                   cdq
loc_02A5:
2:02A5  c45e06               les bx, ptr [bp + 6]
2:02A8  26894708             mov word ptr es:[bx + 8], ax
2:02AC  2689570a             mov word ptr es:[bx + 0xa], dx
2:02B0  c45e06               les bx, ptr [bp + 6]
2:02B3  66268b4708           mov eax, dword ptr es:[bx + 8]
2:02B8  66a39802             mov dword ptr [0x298], eax
2:02BC  26c45f08             les bx, ptr es:[bx + 8]
2:02C0  26c707ffff           mov word ptr es:[bx], 0xffff  ; OFFSET KERNEL.OutputDebugString
2:02C5  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT KERNEL.OutputDebugString
2:02CB  682601               push 0x126
2:02CE  9a9c170203           lcall 0x302, 0x179c  ; operator_new@s1:179C
2:02D3  83c402               add sp, 2
2:02D6  8946f0               mov word ptr [bp - 0x10], ax
2:02D9  8956f2               mov word ptr [bp - 0xe], dx
2:02DC  0bd0                 or dx, ax
2:02DE  7409                 je 0x2e9
2:02E0  ff76f2               push word ptr [bp - 0xe]
2:02E3  50                   push ax
2:02E4  9a24202303           lcall 0x323, 0x2024  ; sub_s3:2024
loc_02E9:
2:02E9  66833ed00e00         cmp dword ptr [0xed0], 0  ; g_registry
2:02EF  7516                 jne 0x307
2:02F1  1e                   push ds
2:02F2  682000               push 0x20  ; 'New failed in Op::Op'
2:02F5  90                   nop
2:02F6  0e                   push cs
2:02F7  e84e5d               call 0x6048  ; sub_s2:6048
2:02FA  83c404               add sp, 4
2:02FD  6a01                 push 1
2:02FF  9acd240d03           lcall 0x30d, 0x24cd  ; sub_s1:24CD
2:0304  83c402               add sp, 2
loc_0307:
2:0307  688c0e               push 0xe8c
2:030A  9a9c173e03           lcall 0x33e, 0x179c  ; operator_new@s1:179C
2:030F  83c402               add sp, 2
2:0312  8946f0               mov word ptr [bp - 0x10], ax
2:0315  8956f2               mov word ptr [bp - 0xe], dx
2:0318  0bd0                 or dx, ax
2:031A  7409                 je 0x325
2:031C  ff76f2               push word ptr [bp - 0xe]
2:031F  50                   push ax
2:0320  9a407ebb00           lcall 0xbb, 0x7e40  ; sub_s3:7E40
loc_0325:
2:0325  66833ecc1400         cmp dword ptr [0x14cc], 0  ; g_hInstRes
2:032B  7516                 jne 0x343
2:032D  1e                   push ds
2:032E  683500               push 0x35  ; 'New failed in Op::Op->ResLibr'
2:0331  90                   nop
2:0332  0e                   push cs
2:0333  e8125d               call 0x6048  ; sub_s2:6048
2:0336  83c404               add sp, 4
2:0339  6a01                 push 1
2:033B  9acd244903           lcall 0x349, 0x24cd  ; sub_s1:24CD
2:0340  83c402               add sp, 2
loc_0343:
2:0343  68b000               push 0xb0
2:0346  9a9c177a03           lcall 0x37a, 0x179c  ; operator_new@s1:179C
2:034B  83c402               add sp, 2
2:034E  8946f0               mov word ptr [bp - 0x10], ax
2:0351  8956f2               mov word ptr [bp - 0xe], dx
2:0354  0bd0                 or dx, ax
2:0356  7409                 je 0x361
2:0358  ff76f2               push word ptr [bp - 0xe]
2:035B  50                   push ax
2:035C  9acaae9a03           lcall 0x39a, 0xaeca  ; sub_s8:AECA
loc_0361:
2:0361  66833e7c5b00         cmp dword ptr [0x5b7c], 0
2:0367  7516                 jne 0x37f
2:0369  1e                   push ds
2:036A  685300               push 0x53  ; 'New failed in Op::Op->DialogCtr'
2:036D  90                   nop
2:036E  0e                   push cs
2:036F  e8d65c               call 0x6048  ; sub_s2:6048
2:0372  83c404               add sp, 4
2:0375  6a01                 push 1
2:0377  9acd248403           lcall 0x384, 0x24cd  ; sub_s1:24CD
2:037C  83c402               add sp, 2
loc_037F:
2:037F  6a0a                 push 0xa
2:0381  9a9c17b503           lcall 0x3b5, 0x179c  ; operator_new@s1:179C
2:0386  83c402               add sp, 2
2:0389  8946f0               mov word ptr [bp - 0x10], ax
2:038C  8956f2               mov word ptr [bp - 0xe], dx
2:038F  0bd0                 or dx, ax
2:0391  7409                 je 0x39c
2:0393  ff76f2               push word ptr [bp - 0xe]
2:0396  50                   push ax
2:0397  9a6ccf0501           lcall 0x105, 0xcf6c  ; sub_s8:CF6C
loc_039C:
2:039C  66833ec85b00         cmp dword ptr [0x5bc8], 0
2:03A2  7516                 jne 0x3ba
2:03A4  1e                   push ds
2:03A5  687300               push 0x73  ; 'New failed in Op::Op->DialogHandler'
2:03A8  90                   nop
2:03A9  0e                   push cs
2:03AA  e89b5c               call 0x6048  ; sub_s2:6048
2:03AD  83c404               add sp, 4
2:03B0  6a01                 push 1
2:03B2  9acd24bf03           lcall 0x3bf, 0x24cd  ; sub_s1:24CD
2:03B7  83c402               add sp, 2
loc_03BA:
2:03BA  6a14                 push 0x14
2:03BC  9a9c17f003           lcall 0x3f0, 0x179c  ; operator_new@s1:179C
2:03C1  83c402               add sp, 2
2:03C4  8946f0               mov word ptr [bp - 0x10], ax
2:03C7  8956f2               mov word ptr [bp - 0xe], dx
2:03CA  0bd0                 or dx, ax
2:03CC  7409                 je 0x3d7
2:03CE  ff76f2               push word ptr [bp - 0xe]
2:03D1  50                   push ax
2:03D2  90                   nop
2:03D3  0e                   push cs
2:03D4  e80558               call 0x5bdc  ; sub_s2:5BDC
loc_03D7:
2:03D7  66833ea00200         cmp dword ptr [0x2a0], 0
2:03DD  7516                 jne 0x3f5
2:03DF  1e                   push ds
2:03E0  689700               push 0x97  ; 'New failed in Op::Op->Simulator'
2:03E3  90                   nop
2:03E4  0e                   push cs
2:03E5  e8605c               call 0x6048  ; sub_s2:6048
2:03E8  83c404               add sp, 4
2:03EB  6a01                 push 1
2:03ED  9acd24fb03           lcall 0x3fb, 0x24cd  ; sub_s1:24CD
2:03F2  83c402               add sp, 2
loc_03F5:
2:03F5  68fc00               push 0xfc
2:03F8  9a9c174004           lcall 0x440, 0x179c  ; operator_new@s1:179C
2:03FD  83c402               add sp, 2
2:0400  8946f0               mov word ptr [bp - 0x10], ax
2:0403  8956f2               mov word ptr [bp - 0xe], dx
2:0406  0bd0                 or dx, ax
2:0408  740c                 je 0x416
2:040A  ff76f2               push word ptr [bp - 0xe]
2:040D  50                   push ax
2:040E  90                   nop
2:040F  0e                   push cs
2:0410  e82301               call 0x536  ; sub_s2:0536
2:0413  eb04                 jmp 0x419
2:0415  db 90
loc_0416:
2:0416  33c0                 xor ax, ax
2:0418  99                   cdq
loc_0419:
2:0419  c45e06               les bx, ptr [bp + 6]
2:041C  26894704             mov word ptr es:[bx + 4], ax
2:0420  26895706             mov word ptr es:[bx + 6], dx
2:0424  c45e06               les bx, ptr [bp + 6]
2:0427  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:042D  7516                 jne 0x445
2:042F  1e                   push ds
2:0430  68b700               push 0xb7  ; 'New failed in Op::Op'
2:0433  90                   nop
2:0434  0e                   push cs
2:0435  e8105c               call 0x6048  ; sub_s2:6048
2:0438  83c404               add sp, 4
2:043B  6a01                 push 1
2:043D  9acd246d00           lcall 0x6d, 0x24cd  ; sub_s1:24CD
2:0442  83c402               add sp, 2
loc_0445:
2:0445  c45e06               les bx, ptr [bp + 6]
2:0448  6626ff7704           push dword ptr es:[bx + 4]
2:044D  90                   nop
2:044E  0e                   push cs
2:044F  e88092               call 0xffff96d2  ; RegisterWindowClass@s2:96D2
2:0452  c45e06               les bx, ptr [bp + 6]
2:0455  6626ff7704           push dword ptr es:[bx + 4]
2:045A  26c45f04             les bx, ptr es:[bx + 4]
2:045E  26c41f               les bx, ptr es:[bx]
2:0461  26ff5f08             lcall es:[bx + 8]
2:0465  c45e06               les bx, ptr [bp + 6]
2:0468  26c45f04             les bx, ptr es:[bx + 4]
2:046C  268b4708             mov ax, word ptr es:[bx + 8]
2:0470  a39603               mov word ptr [0x396], ax
2:0473  6a03                 push 3
2:0475  c45e06               les bx, ptr [bp + 6]
2:0478  6626ff7704           push dword ptr es:[bx + 4]
2:047D  26c45f04             les bx, ptr es:[bx + 4]
2:0481  26c41f               les bx, ptr es:[bx]
2:0484  26ff5f0c             lcall es:[bx + 0xc]
2:0488  c45e06               les bx, ptr [bp + 6]
2:048B  26c45f04             les bx, ptr es:[bx + 4]
2:048F  26ff7708             push word ptr es:[bx + 8]
2:0493  9affff0000           lcall 0, 0xffff  ; USER.UpdateWindow
2:0498  c9                   leave
2:0499  ca0400               retf 4

; ---------------- sub_s2:049C FAR size=54 callers=0
2:049C  55                   push bp
2:049D  8bec                 mov bp, sp
2:049F  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:04A4  7428                 je 0x4ce
2:04A6  66ff760a             push dword ptr [bp + 0xa]
2:04AA  9aa43dc304           lcall 0x4c3, 0x3da4  ; sub_s1:3DA4
2:04AF  8be5                 mov sp, bp
2:04B1  0bc0                 or ax, ax
2:04B3  7419                 je 0x4ce
2:04B5  1e                   push ds
2:04B6  68cc00               push 0xcc  ; 'nomono2'
2:04B9  668b460a             mov eax, dword ptr [bp + 0xa]
2:04BD  40                   inc ax
2:04BE  6650                 push eax
2:04C0  9a5a549d01           lcall 0x19d, 0x545a  ; sub_s1:545A
2:04C5  8be5                 mov sp, bp
2:04C7  0bc0                 or ax, ax
2:04C9  7503                 jne 0x4ce
2:04CB  a3ec02               mov word ptr [0x2ec], ax
loc_04CE:
2:04CE  c9                   leave
2:04CF  ca0800               retf 8

; ---------------- sub_s2:04D2 FAR size=38 callers=0
2:04D2  55                   push bp
2:04D3  8bec                 mov bp, sp
2:04D5  66ff7606             push dword ptr [bp + 6]
2:04D9  90                   nop
2:04DA  0e                   push cs
2:04DB  e8888f               call 0xffff9466  ; sub_s2:9466
2:04DE  f6460a01             test byte ptr [bp + 0xa], 1
2:04E2  7409                 je 0x4ed
2:04E4  66ff7606             push dword ptr [bp + 6]
2:04E8  9ace17ad04           lcall 0x4ad, 0x17ce  ; operator_delete@s1:17CE
loc_04ED:
2:04ED  8b4606               mov ax, word ptr [bp + 6]
2:04F0  8b5608               mov dx, word ptr [bp + 8]
2:04F3  c9                   leave
2:04F4  ca0600               retf 6
2:04F7  db 00

; ---------------- sub_s2:04F8 FAR size=62 callers=0
2:04F8  55                   push bp
2:04F9  8bec                 mov bp, sp
2:04FB  66ff7606             push dword ptr [bp + 6]
2:04FF  90                   nop
2:0500  0e                   push cs
2:0501  e832fb               call 0x36  ; sub_s2:0036
2:0504  f6460a01             test byte ptr [bp + 0xa], 1
2:0508  7409                 je 0x513
2:050A  66ff7606             push dword ptr [bp + 6]
2:050E  9ace17eb04           lcall 0x4eb, 0x17ce  ; operator_delete@s1:17CE
loc_0513:
2:0513  8b4606               mov ax, word ptr [bp + 6]
2:0516  8b5608               mov dx, word ptr [bp + 8]
2:0519  c9                   leave
2:051A  ca0600               retf 6
2:051D  db 90 f8 04 24 05 9c 04 28 05 6e 01 46 00 d2 04 30
2:052D  db 05 94 94 34 05 90 94 20 05

; ---------------- sub_s2:0536 FAR size=226 callers=1
;   apis: GDI.GetStockObject, USER.LoadCursor, USER.LoadIcon
2:0536  55                   push bp
2:0537  8bec                 mov bp, sp
2:0539  66ff7606             push dword ptr [bp + 6]
2:053D  90                   nop
2:053E  0e                   push cs
2:053F  e87635               call 0x3ab8  ; sub_s2:3AB8
2:0542  c45e06               les bx, ptr [bp + 6]
2:0545  662bc0               sub eax, eax
2:0548  66268987e000         mov dword ptr es:[bx + 0xe0], eax
2:054E  66268987e400         mov dword ptr es:[bx + 0xe4], eax
2:0554  66268987e800         mov dword ptr es:[bx + 0xe8], eax
2:055A  268987ec00           mov word ptr es:[bx + 0xec], ax
2:055F  66268987ee00         mov dword ptr es:[bx + 0xee], eax
2:0565  268987f200           mov word ptr es:[bx + 0xf2], ax
2:056A  66268987f400         mov dword ptr es:[bx + 0xf4], eax
2:0570  66268987f800         mov dword ptr es:[bx + 0xf8], eax
2:0576  26c7079e38           mov word ptr es:[bx], 0x389e
2:057B  26c747022c05         mov word ptr es:[bx + 2], 0x52c  ; SEGMENT s2:0000
2:0581  26c787c8000820       mov word ptr es:[bx + 0xc8], 0x2008
2:0588  268987ac00           mov word ptr es:[bx + 0xac], ax
2:058D  26c787ae000087       mov word ptr es:[bx + 0xae], 0x8700
2:0594  ff368c03             push word ptr [0x38c]
2:0598  1e                   push ds
2:0599  68d400               push 0xd4
2:059C  9affff0000           lcall 0, 0xffff  ; USER.LoadIcon
2:05A1  c45e06               les bx, ptr [bp + 6]
2:05A4  268987c200           mov word ptr es:[bx + 0xc2], ax
2:05A9  666a00               push 0
2:05AC  68007f               push 0x7f00
2:05AF  9affff0000           lcall 0, 0xffff  ; USER.LoadCursor
2:05B4  c45e06               les bx, ptr [bp + 6]
2:05B7  268987c400           mov word ptr es:[bx + 0xc4], ax
2:05BC  6a04                 push 4
2:05BE  9affff0000           lcall 0, 0xffff  ; GDI.GetStockObject
2:05C3  c45e06               les bx, ptr [bp + 6]
2:05C6  268987c600           mov word ptr es:[bx + 0xc6], ax
2:05CB  6a48                 push 0x48
2:05CD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:05D2  9aba20f605           lcall 0x5f6, 0x20ba  ; sub_s3:20BA
2:05D7  1e                   push ds
2:05D8  68d700               push 0xd7  ; 'Outpost'
2:05DB  668b4606             mov eax, dword ptr [bp + 6]
2:05DF  050a00               add ax, 0xa
2:05E2  6650                 push eax
2:05E4  9a3e3d1105           lcall 0x511, 0x3d3e  ; _fstrcpy@s1:3D3E
2:05E9  83c408               add sp, 8
2:05EC  6a32                 push 0x32
2:05EE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:05F3  9aba20e702           lcall 0x2e7, 0x20ba  ; sub_s3:20BA
2:05F8  c45e06               les bx, ptr [bp + 6]
2:05FB  268987f400           mov word ptr es:[bx + 0xf4], ax
2:0600  268997f600           mov word ptr es:[bx + 0xf6], dx
2:0605  6a01                 push 1
2:0607  06                   push es
2:0608  53                   push bx
2:0609  90                   nop
2:060A  0e                   push cs
2:060B  e8702f               call 0x357e  ; sub_s2:357E
2:060E  8b4606               mov ax, word ptr [bp + 6]
2:0611  8b5608               mov dx, word ptr [bp + 8]
2:0614  c9                   leave
2:0615  ca0400               retf 4

; ---------------- sub_s2:0618 FAR size=168 callers=1
;   apis: USER.DestroyIcon, USER.DestroyMenu
2:0618  c81c0000             enter 0x1c, 0
2:061C  56                   push si
2:061D  c45e06               les bx, ptr [bp + 6]
2:0620  26c7079e38           mov word ptr es:[bx], 0x389e
2:0625  26c74702ab06         mov word ptr es:[bx + 2], 0x6ab  ; SEGMENT s2:0000
2:062B  6a00                 push 0
2:062D  06                   push es
2:062E  53                   push bx
2:062F  90                   nop
2:0630  0e                   push cs
2:0631  e84a2f               call 0x357e  ; sub_s2:357E
2:0634  c45e06               les bx, ptr [bp + 6]
2:0637  66268b87f800         mov eax, dword ptr es:[bx + 0xf8]
2:063D  6650                 push eax
2:063F  9ace17e705           lcall 0x5e7, 0x17ce  ; operator_delete@s1:17CE
2:0644  83c404               add sp, 4
2:0647  c45e06               les bx, ptr [bp + 6]
2:064A  2683bfec0000         cmp word ptr es:[bx + 0xec], 0
2:0650  740a                 je 0x65c
2:0652  26ffb7ec00           push word ptr es:[bx + 0xec]
2:0657  9affff0000           lcall 0, 0xffff  ; USER.DestroyMenu
loc_065C:
2:065C  c45e06               les bx, ptr [bp + 6]
2:065F  26ffb7c200           push word ptr es:[bx + 0xc2]
2:0664  9affff0000           lcall 0, 0xffff  ; USER.DestroyIcon
2:0669  c45e06               les bx, ptr [bp + 6]
2:066C  26c787c2000000       mov word ptr es:[bx + 0xc2], 0
2:0673  268b87e000           mov ax, word ptr es:[bx + 0xe0]
2:0678  268b97e200           mov dx, word ptr es:[bx + 0xe2]
2:067D  8bda                 mov bx, dx
2:067F  0bd0                 or dx, ax
2:0681  740e                 je 0x691
2:0683  6a01                 push 1
2:0685  53                   push bx
2:0686  50                   push ax
2:0687  8ec3                 mov es, bx
2:0689  8bf0                 mov si, ax
2:068B  26c41c               les bx, ptr es:[si]
2:068E  26ff1f               lcall es:[bx]
loc_0691:
2:0691  668b4606             mov eax, dword ptr [bp + 6]
2:0695  05d200               add ax, 0xd2
2:0698  6650                 push eax
2:069A  90                   nop
2:069B  0e                   push cs
2:069C  e82551               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:069F  c45e06               les bx, ptr [bp + 6]
2:06A2  26c7070a38           mov word ptr es:[bx], 0x380a
2:06A7  26c74702b906         mov word ptr es:[bx + 2], 0x6b9  ; SEGMENT s2:0000
2:06AD  c45e06               les bx, ptr [bp + 6]
2:06B0  26c7079a38           mov word ptr es:[bx], 0x389a
2:06B5  26c747027f05         mov word ptr es:[bx + 2], 0x57f  ; SEGMENT s2:0000
2:06BB  5e                   pop si
2:06BC  c9                   leave
2:06BD  ca0400               retf 4

; ---------------- sub_s2:06C0 size=280 callers=0
;   apis: USER.LoadCursor, USER.MessageBox, USER.PostMessage, USER.SetCursor
2:06C0  c8660000             enter 0x66, 0
2:06C4  817e100004           cmp word ptr [bp + 0x10], 0x400
2:06C9  0f850601             jne 0x7d3
2:06CD  666801000004         push 0x4000001
2:06D3  66ff364857           push dword ptr [0x5748]  ; g_sim
2:06D8  9a44833907           lcall 0x739, 0x8344  ; sub_s7:8344
2:06DD  0bd0                 or dx, ax
2:06DF  0f84f000             je 0x7d3
2:06E3  833ee84f00           cmp word ptr [0x4fe8], 0
2:06E8  742c                 je 0x716
2:06EA  687b05               push 0x57b
2:06ED  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:06F2  9a7e844f07           lcall 0x74f, 0x847e  ; LoadStringRes@s3:847E
2:06F7  8946a0               mov word ptr [bp - 0x60], ax
2:06FA  8956a2               mov word ptr [bp - 0x5e], dx
2:06FD  c45e06               les bx, ptr [bp + 6]
2:0700  26ff7708             push word ptr es:[bx + 8]
2:0704  1e                   push ds
2:0705  68df00               push 0xdf  ; 'You may not run a turn. The game is over!'
2:0708  52                   push dx
2:0709  50                   push ax
2:070A  6a10                 push 0x10
2:070C  9a75020000           lcall 0, 0x275  ; USER.MessageBox
2:0711  c9                   leave
2:0712  ca0c00               retf 0xc
2:0715  db 90
loc_0716:
2:0716  666a00               push 0
2:0719  68027f               push 0x7f02
2:071C  9ab0050000           lcall 0, 0x5b0  ; USER.LoadCursor
2:0721  8946fe               mov word ptr [bp - 2], ax
2:0724  50                   push ax
2:0725  9aba070000           lcall 0, 0x7ba  ; USER.SetCursor
2:072A  8946fc               mov word ptr [bp - 4], ax
2:072D  66ff760a             push dword ptr [bp + 0xa]
2:0731  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0736  9aba836607           lcall 0x766, 0x83ba  ; Sim::runTurns@s7:83BA
2:073B  c41e4857             les bx, ptr [0x5748]  ; g_sim
2:073F  26c747080100         mov word ptr es:[bx + 8], 1
2:0745  6a29                 push 0x29
2:0747  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:074C  9aba207507           lcall 0x775, 0x20ba  ; sub_s3:20BA
2:0751  8946f8               mov word ptr [bp - 8], ax
2:0754  8956fa               mov word ptr [bp - 6], dx
2:0757  52                   push dx
2:0758  50                   push ax
2:0759  9a2e26ffff           lcall 0xffff, 0x262e  ; sub_s4:262E
2:075E  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0763  9a26839400           lcall 0x94, 0x8326  ; Sim::getTurnNumber@s7:8326
2:0768  52                   push dx
2:0769  50                   push ax
2:076A  68dc05               push 0x5dc
2:076D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:0772  9a7e84a707           lcall 0x7a7, 0x847e  ; LoadStringRes@s3:847E
2:0777  52                   push dx
2:0778  50                   push ax
2:0779  1e                   push ds
2:077A  680901               push 0x109  ; '%s %ld'
2:077D  8d46a8               lea ax, [bp - 0x58]
2:0780  16                   push ss
2:0781  50                   push ax
2:0782  9a9c3f4206           lcall 0x642, 0x3f9c  ; _fsprintf@s1:3F9C
2:0787  83c410               add sp, 0x10
2:078A  8d46a8               lea ax, [bp - 0x58]
2:078D  16                   push ss
2:078E  50                   push ax
2:078F  6a00                 push 0
2:0791  c45e06               les bx, ptr [bp + 6]
2:0794  06                   push es
2:0795  53                   push bx
2:0796  26c41f               les bx, ptr es:[bx]
2:0799  26ff5f14             lcall es:[bx + 0x14]
2:079D  6a37                 push 0x37
2:079F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:07A4  9aba20d505           lcall 0x5d5, 0x20ba  ; sub_s3:20BA
2:07A9  8946a4               mov word ptr [bp - 0x5c], ax
2:07AC  8956a6               mov word ptr [bp - 0x5a], dx
2:07AF  52                   push dx
2:07B0  50                   push ax
2:07B1  90                   nop
2:07B2  0e                   push cs
2:07B3  e836a2               call 0xffffa9ec  ; sub_s2:A9EC
2:07B6  ff76fc               push word ptr [bp - 4]
2:07B9  9affff0000           lcall 0, 0xffff  ; USER.SetCursor
2:07BE  c45e06               les bx, ptr [bp + 6]
2:07C1  26ff7708             push word ptr es:[bx + 8]
2:07C5  6668fc001101         push 0x11100fc
2:07CB  666a00               push 0
2:07CE  9affff0000           lcall 0, 0xffff  ; USER.PostMessage
loc_07D3:
2:07D3  c9                   leave
2:07D4  ca0c00               retf 0xc
2:07D7  db 00

; ---------------- sub_s2:07D8 FAR size=166 callers=1
2:07D8  c8040000             enter 4, 0
2:07DC  66833e485700         cmp dword ptr [0x5748], 0  ; g_sim
2:07E2  0f859400             jne 0x87a
2:07E6  6a0a                 push 0xa
2:07E8  9a9c171908           lcall 0x819, 0x179c  ; operator_new@s1:179C
2:07ED  83c402               add sp, 2
2:07F0  8956fe               mov word ptr [bp - 2], dx
2:07F3  0bd0                 or dx, ax
2:07F5  7409                 je 0x800
2:07F7  ff76fe               push word ptr [bp - 2]
2:07FA  50                   push ax
2:07FB  9a28816e08           lcall 0x86e, 0x8128  ; sub_s7:8128
loc_0800:
2:0800  66833e485700         cmp dword ptr [0x5748], 0  ; g_sim
2:0806  7516                 jne 0x81e
2:0808  1e                   push ds
2:0809  681001               push 0x110  ; 'New failed in Op::Op->Simulator'
2:080C  90                   nop
2:080D  0e                   push cs
2:080E  e83758               call 0x6048  ; sub_s2:6048
2:0811  83c404               add sp, 4
2:0814  6a01                 push 1
2:0816  9acd248507           lcall 0x785, 0x24cd  ; sub_s1:24CD
2:081B  83c402               add sp, 2
loc_081E:
2:081E  666a00               push 0
2:0821  666800000008         push 0x8000000
2:0827  666a00               push 0
2:082A  6a00                 push 0
2:082C  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:0831  9ae0e24c08           lcall 0x84c, 0xe2e0  ; sub_s6:E2E0
2:0836  666a00               push 0
2:0839  666800000008         push 0x8000000
2:083F  666a00               push 0
2:0842  6a00                 push 0
2:0844  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:0849  9ae0e26408           lcall 0x864, 0xe2e0  ; sub_s6:E2E0
2:084E  666a00               push 0
2:0851  6668000000ff         push 0xff000000
2:0857  666a00               push 0
2:085A  6a00                 push 0
2:085C  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:0861  9ae0e2ffff           lcall 0xffff, 0xe2e0  ; sub_s6:E2E0
2:0866  66ff364857           push dword ptr [0x5748]  ; g_sim
2:086B  9a8e837808           lcall 0x878, 0x838e  ; sub_s7:838E
2:0870  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0875  9a3483db06           lcall 0x6db, 0x8334  ; sub_s7:8334
loc_087A:
2:087A  c9                   leave
2:087B  ca0400               retf 4

; ---------------- sub_s2:087E FAR size=180 callers=1
2:087E  c81c0100             enter 0x11c, 0
2:0882  6a0a                 push 0xa
2:0884  9a9c17b808           lcall 0x8b8, 0x179c  ; operator_new@s1:179C
2:0889  83c402               add sp, 2
2:088C  8946fc               mov word ptr [bp - 4], ax
2:088F  8956fe               mov word ptr [bp - 2], dx
2:0892  0bd0                 or dx, ax
2:0894  7409                 je 0x89f
2:0896  ff76fe               push word ptr [bp - 2]
2:0899  50                   push ax
2:089A  9a2881fc08           lcall 0x8fc, 0x8128  ; sub_s7:8128
loc_089F:
2:089F  66833e485700         cmp dword ptr [0x5748], 0  ; g_sim
2:08A5  7516                 jne 0x8bd
2:08A7  1e                   push ds
2:08A8  683001               push 0x130  ; 'New failed in Op::Op->Simulator'
2:08AB  90                   nop
2:08AC  0e                   push cs
2:08AD  e89857               call 0x6048  ; sub_s2:6048
2:08B0  83c404               add sp, 4
2:08B3  6a01                 push 1
2:08B5  9acd24eb07           lcall 0x7eb, 0x24cd  ; sub_s1:24CD
2:08BA  83c402               add sp, 2
loc_08BD:
2:08BD  666a00               push 0
2:08C0  666800000008         push 0x8000000
2:08C6  666a00               push 0
2:08C9  6a00                 push 0
2:08CB  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:08D0  9ae0e2eb08           lcall 0x8eb, 0xe2e0  ; sub_s6:E2E0
2:08D5  666a00               push 0
2:08D8  666800000008         push 0x8000000
2:08DE  666a00               push 0
2:08E1  6a00                 push 0
2:08E3  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:08E8  9ae0e23408           lcall 0x834, 0xe2e0  ; sub_s6:E2E0
2:08ED  6668000000ff         push 0xff000000
2:08F3  8d86f0fe             lea ax, [bp - 0x110]
2:08F7  16                   push ss
2:08F8  50                   push ax
2:08F9  9a2e530c09           lcall 0x90c, 0x532e  ; SCSelect@s7:532E
2:08FE  8d86f0fe             lea ax, [bp - 0x110]
2:0902  16                   push ss
2:0903  50                   push ax
2:0904  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0909  9a5a831609           lcall 0x916, 0x835a  ; Sim::enqueue@s7:835A
2:090E  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0913  9a8e832c09           lcall 0x92c, 0x838e  ; sub_s7:838E
2:0918  c786f0fe9a38         mov word ptr [bp - 0x110], 0x389a
2:091E  c786f2fe2906         mov word ptr [bp - 0x10e], 0x629  ; SEGMENT s2:0000
2:0924  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0929  9a3483fe07           lcall 0x7fe, 0x8334  ; sub_s7:8334
2:092E  c9                   leave
2:092F  ca0400               retf 4

; ---------------- sub_s2:0932 FAR size=82 callers=0
2:0932  66833ecc1400         cmp dword ptr [0x14cc], 0  ; g_hInstRes
2:0938  740a                 je 0x944
2:093A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:093F  9ad67ff506           lcall 0x6f5, 0x7fd6  ; sub_s3:7FD6
loc_0944:
2:0944  66ff36a003           push dword ptr [0x3a0]
2:0949  9a16005609           lcall 0x956, 0x16  ; sub_s1:0016
2:094E  66ff369c02           push dword ptr [0x29c]
2:0953  9a16006009           lcall 0x960, 0x16  ; sub_s1:0016
2:0958  66ff36b84f           push dword ptr [0x4fb8]
2:095D  9a16006a09           lcall 0x96a, 0x16  ; sub_s1:0016
2:0962  66ff36a268           push dword ptr [0x68a2]
2:0967  9a16007409           lcall 0x974, 0x16  ; sub_s1:0016
2:096C  66ff364457           push dword ptr [0x5744]
2:0971  9a16007e09           lcall 0x97e, 0x16  ; sub_s1:0016
2:0976  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:097B  9a16008708           lcall 0x887, 0x16  ; sub_s1:0016
2:0980  ca0400               retf 4
2:0983  db 00

; ---------------- sub_s2:0984 FAR size=54 callers=0
2:0984  55                   push bp
2:0985  8bec                 mov bp, sp
2:0987  66ff7608             push dword ptr [bp + 8]
2:098B  ff7606               push word ptr [bp + 6]
2:098E  90                   nop
2:098F  0e                   push cs
2:0990  e8eb2b               call 0x357e  ; sub_s2:357E
2:0993  c45e06               les bx, ptr [bp + 6]
2:0996  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:099D  7416                 je 0x9b5
2:099F  ff760a               push word ptr [bp + 0xa]
2:09A2  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:09A8  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:09AD  26c41f               les bx, ptr es:[bx]
2:09B0  26ff9f9800           lcall es:[bx + 0x98]
loc_09B5:
2:09B5  c9                   leave
2:09B6  ca0600               retf 6
2:09B9  db 00

; ---------------- sub_s2:09BA FAR size=130 callers=0
;   apis: USER.ClientToScreen, USER.GetSubMenu, USER.LoadMenu, USER.TrackPopupMenu
2:09BA  c8040000             enter 4, 0
2:09BE  c45e06               les bx, ptr [bp + 6]
2:09C1  2683bfec0000         cmp word ptr es:[bx + 0xec], 0
2:09C7  7534                 jne 0x9fd
2:09C9  ff368c03             push word ptr [0x38c]
2:09CD  1e                   push ds
2:09CE  685001               push 0x150  ; 'OPPOPMENU'
2:09D1  9affff0000           lcall 0, 0xffff  ; USER.LoadMenu
2:09D6  c45e06               les bx, ptr [bp + 6]
2:09D9  268987ec00           mov word ptr es:[bx + 0xec], ax
2:09DE  0bc0                 or ax, ax
2:09E0  7456                 je 0xa38
2:09E2  c45e06               les bx, ptr [bp + 6]
2:09E5  26ffb7ec00           push word ptr es:[bx + 0xec]
2:09EA  6a00                 push 0
2:09EC  9affff0000           lcall 0, 0xffff  ; USER.GetSubMenu
2:09F1  c45e06               les bx, ptr [bp + 6]
2:09F4  268987ec00           mov word ptr es:[bx + 0xec], ax
2:09F9  0bc0                 or ax, ax
2:09FB  743b                 je 0xa38
loc_09FD:
2:09FD  8b460c               mov ax, word ptr [bp + 0xc]
2:0A00  8946fc               mov word ptr [bp - 4], ax
2:0A03  8b460a               mov ax, word ptr [bp + 0xa]
2:0A06  8946fe               mov word ptr [bp - 2], ax
2:0A09  c45e06               les bx, ptr [bp + 6]
2:0A0C  26ff7708             push word ptr es:[bx + 8]
2:0A10  8d46fc               lea ax, [bp - 4]
2:0A13  16                   push ss
2:0A14  50                   push ax
2:0A15  9affff0000           lcall 0, 0xffff  ; USER.ClientToScreen
2:0A1A  c45e06               les bx, ptr [bp + 6]
2:0A1D  26ffb7ec00           push word ptr es:[bx + 0xec]
2:0A22  6a00                 push 0
2:0A24  ff76fc               push word ptr [bp - 4]
2:0A27  ff76fe               push word ptr [bp - 2]
2:0A2A  6a00                 push 0
2:0A2C  ff369603             push word ptr [0x396]
2:0A30  666a00               push 0
2:0A33  9affff0000           lcall 0, 0xffff  ; USER.TrackPopupMenu
loc_0A38:
2:0A38  c9                   leave
2:0A39  ca0a00               retf 0xa

; ---------------- sub_s2:0A3C FAR size=86 callers=0
;   apis: USER.IsIconic, USER.PostMessage
2:0A3C  55                   push bp
2:0A3D  8bec                 mov bp, sp
2:0A3F  8b460a               mov ax, word ptr [bp + 0xa]
2:0A42  24f0                 and al, 0xf0
2:0A44  3d40f1               cmp ax, 0xf140
2:0A47  750d                 jne 0xa56
2:0A49  c45e06               les bx, ptr [bp + 6]
2:0A4C  268b87de00           mov ax, word ptr es:[bx + 0xde]
2:0A51  c9                   leave
2:0A52  ca0600               retf 6
2:0A55  db 90
loc_0A56:
2:0A56  8b460a               mov ax, word ptr [bp + 0xa]
2:0A59  24f0                 and al, 0xf0
2:0A5B  3d60f0               cmp ax, 0xf060
2:0A5E  752a                 jne 0xa8a
2:0A60  c45e06               les bx, ptr [bp + 6]
2:0A63  26ff7708             push word ptr es:[bx + 8]
2:0A67  9affff0000           lcall 0, 0xffff  ; USER.IsIconic
2:0A6C  0bc0                 or ax, ax
2:0A6E  7514                 jne 0xa84
2:0A70  c45e06               les bx, ptr [bp + 6]
2:0A73  26ff7708             push word ptr es:[bx + 8]
2:0A77  666867001101         push 0x1110067
2:0A7D  50                   push ax
2:0A7E  50                   push ax
2:0A7F  9acf070000           lcall 0, 0x7cf  ; USER.PostMessage
loc_0A84:
2:0A84  33c0                 xor ax, ax
2:0A86  c9                   leave
2:0A87  ca0600               retf 6
loc_0A8A:
2:0A8A  b80100               mov ax, 1
2:0A8D  c9                   leave
2:0A8E  ca0600               retf 6
2:0A91  db 00

; ---------------- sub_s2:0A92 FAR size=102 callers=0
2:0A92  c8080000             enter 8, 0
2:0A96  c45e06               les bx, ptr [bp + 6]
2:0A99  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
2:0AA0  7413                 je 0xab5
2:0AA2  6626ffb7ee00         push dword ptr es:[bx + 0xee]
2:0AA8  26c49fee00           les bx, ptr es:[bx + 0xee]
2:0AAD  26c41f               les bx, ptr es:[bx]
2:0AB0  26ff9f9000           lcall es:[bx + 0x90]
loc_0AB5:
2:0AB5  c45e06               les bx, ptr [bp + 6]
2:0AB8  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:0ABF  7413                 je 0xad4
2:0AC1  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:0AC7  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:0ACC  26c41f               les bx, ptr es:[bx]
2:0ACF  26ff9f9000           lcall es:[bx + 0x90]
loc_0AD4:
2:0AD4  66a18803             mov eax, dword ptr [0x388]
2:0AD8  660bc0               or eax, eax
2:0ADB  740e                 je 0xaeb
2:0ADD  6a01                 push 1
2:0ADF  c41e8803             les bx, ptr [0x388]
2:0AE3  06                   push es
2:0AE4  50                   push ax
2:0AE5  26c41f               les bx, ptr es:[bx]
2:0AE8  26ff1f               lcall es:[bx]
loc_0AEB:
2:0AEB  66ff7606             push dword ptr [bp + 6]
2:0AEF  90                   nop
2:0AF0  0e                   push cs
2:0AF1  e80030               call 0x3af4  ; sub_s2:3AF4
2:0AF4  c9                   leave
2:0AF5  ca0400               retf 4

; ---------------- sub_s2:0AF8 size=360 callers=0
2:0AF8  c8040000             enter 4, 0
2:0AFC  66ff7606             push dword ptr [bp + 6]
2:0B00  90                   nop
2:0B01  0e                   push cs
2:0B02  e85b8c               call 0xffff9760  ; sub_s2:9760
2:0B05  c45e06               les bx, ptr [bp + 6]
2:0B08  268b4708             mov ax, word ptr es:[bx + 8]
2:0B0C  a39603               mov word ptr [0x396], ax
2:0B0F  6a12                 push 0x12  ; 'version %d %d'
2:0B11  9a9c17310b           lcall 0xb31, 0x179c  ; operator_new@s1:179C
2:0B16  83c402               add sp, 2
2:0B19  8946fc               mov word ptr [bp - 4], ax
2:0B1C  8956fe               mov word ptr [bp - 2], dx
2:0B1F  0bd0                 or dx, ax
2:0B21  7409                 je 0xb2c
2:0B23  ff76fe               push word ptr [bp - 2]
2:0B26  50                   push ax
2:0B27  90                   nop
2:0B28  0e                   push cs
2:0B29  e88e86               call 0xffff91ba  ; sub_s2:91BA
loc_0B2C:
2:0B2C  6a06                 push 6
2:0B2E  9a9c17850b           lcall 0xb85, 0x179c  ; operator_new@s1:179C
2:0B33  83c402               add sp, 2
2:0B36  8946fc               mov word ptr [bp - 4], ax
2:0B39  8956fe               mov word ptr [bp - 2], dx
2:0B3C  0bd0                 or dx, ax
2:0B3E  7420                 je 0xb60
2:0B40  c45e06               les bx, ptr [bp + 6]
2:0B43  26ff7708             push word ptr es:[bx + 8]
2:0B47  ff76fe               push word ptr [bp - 2]
2:0B4A  50                   push ax
2:0B4B  90                   nop
2:0B4C  0e                   push cs
2:0B4D  e8de2d               call 0x392e  ; sub_s2:392E
2:0B50  c45e06               les bx, ptr [bp + 6]
2:0B53  268987e000           mov word ptr es:[bx + 0xe0], ax
2:0B58  268997e200           mov word ptr es:[bx + 0xe2], dx
2:0B5D  eb0e                 jmp 0xb6d
2:0B5F  db 90
loc_0B60:
2:0B60  c45e06               les bx, ptr [bp + 6]
2:0B63  6626c787e00000000000 mov dword ptr es:[bx + 0xe0], 0
loc_0B6D:
2:0B6D  1e                   push ds
2:0B6E  685a01               push 0x15a  ; 'Outpost'
2:0B71  6a00                 push 0
2:0B73  c45e06               les bx, ptr [bp + 6]
2:0B76  06                   push es
2:0B77  53                   push bx
2:0B78  26c41f               les bx, ptr es:[bx]
2:0B7B  26ff5f14             lcall es:[bx + 0x14]
2:0B7F  68ec00               push 0xec
2:0B82  9a9c174c09           lcall 0x94c, 0x179c  ; operator_new@s1:179C
2:0B87  83c402               add sp, 2
2:0B8A  8946fc               mov word ptr [bp - 4], ax
2:0B8D  8956fe               mov word ptr [bp - 2], dx
2:0B90  0bd0                 or dx, ax
2:0B92  7428                 je 0xbbc
2:0B94  c45e06               les bx, ptr [bp + 6]
2:0B97  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:0B9C  06                   push es
2:0B9D  53                   push bx
2:0B9E  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:0BA3  66ff76fc             push dword ptr [bp - 4]
2:0BA7  9ab608ffff           lcall 0xffff, 0x8b6  ; sub_s5:08B6
2:0BAC  c45e06               les bx, ptr [bp + 6]
2:0BAF  268987e400           mov word ptr es:[bx + 0xe4], ax
2:0BB4  268997e600           mov word ptr es:[bx + 0xe6], dx
2:0BB9  eb0e                 jmp 0xbc9
2:0BBB  db 90
loc_0BBC:
2:0BBC  c45e06               les bx, ptr [bp + 6]
2:0BBF  6626c787e40000000000 mov dword ptr es:[bx + 0xe4], 0
loc_0BC9:
2:0BC9  c45e06               les bx, ptr [bp + 6]
2:0BCC  662683bfce0000       cmp dword ptr es:[bx + 0xce], 0
2:0BD3  7414                 je 0xbe9
2:0BD5  6a00                 push 0
2:0BD7  6626ffb7ce00         push dword ptr es:[bx + 0xce]
2:0BDD  26c49fce00           les bx, ptr es:[bx + 0xce]
2:0BE2  26c41f               les bx, ptr es:[bx]
2:0BE5  26ff5f10             lcall es:[bx + 0x10]
loc_0BE9:
2:0BE9  c45e06               les bx, ptr [bp + 6]
2:0BEC  66268b87e400         mov eax, dword ptr es:[bx + 0xe4]
2:0BF2  66268987ce00         mov dword ptr es:[bx + 0xce], eax
2:0BF8  6a01                 push 1
2:0BFA  6626ffb7e400         push dword ptr es:[bx + 0xe4]
2:0C00  26c49fe400           les bx, ptr es:[bx + 0xe4]
2:0C05  26c41f               les bx, ptr es:[bx]
2:0C08  26ff5f10             lcall es:[bx + 0x10]
2:0C0C  c45e06               les bx, ptr [bp + 6]
2:0C0F  66268b87e400         mov eax, dword ptr es:[bx + 0xe4]
2:0C15  268b97e600           mov dx, word ptr es:[bx + 0xe6]
2:0C1A  66268987e800         mov dword ptr es:[bx + 0xe8], eax
2:0C20  52                   push dx
2:0C21  26ffb7e800           push word ptr es:[bx + 0xe8]
2:0C26  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:0C2B  26c41f               les bx, ptr es:[bx]
2:0C2E  26ff5f08             lcall es:[bx + 8]
2:0C32  6a05                 push 5
2:0C34  c45e06               les bx, ptr [bp + 6]
2:0C37  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:0C3D  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:0C42  26c41f               les bx, ptr es:[bx]
2:0C45  26ff5f0c             lcall es:[bx + 0xc]
2:0C49  c45e06               les bx, ptr [bp + 6]
2:0C4C  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:0C52  6a00                 push 0
2:0C54  06                   push es
2:0C55  53                   push bx
2:0C56  90                   nop
2:0C57  0e                   push cs
2:0C58  e81d5d               call 0x6978  ; sub_s2:6978
2:0C5B  c9                   leave
2:0C5C  ca0400               retf 4
2:0C5F  db 00

; ---------------- sub_s2:0C60 FAR size=1488 callers=0
;   apis: KERNEL.WinExec, USER.LoadCursor, USER.MessageBox, USER.PostMessage, USER.SendMessage, USER.SetCursor, USER.WinHelp
2:0C60  c8700000             enter 0x70, 0
2:0C64  8b460a               mov ax, word ptr [bp + 0xa]
2:0C67  e91c04               jmp 0x1086
loc_0C6A:
2:0C6A  68dc01               push 0x1dc
2:0C6D  66ff36a002           push dword ptr [0x2a0]
2:0C72  90                   nop
2:0C73  0e                   push cs
2:0C74  e8e54f               call 0x5c5c  ; sub_s2:5C5C
2:0C77  e9b205               jmp 0x122c
loc_0C7A:
2:0C7A  68f801               push 0x1f8
2:0C7D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:0C82  9a0a836c0d           lcall 0xd6c, 0x830a  ; sub_s3:830A
2:0C87  8946fc               mov word ptr [bp - 4], ax
2:0C8A  8956fe               mov word ptr [bp - 2], dx
2:0C8D  c45e06               les bx, ptr [bp + 6]
2:0C90  26ff7708             push word ptr es:[bx + 8]
2:0C94  52                   push dx
2:0C95  50                   push ax
2:0C96  666800000300         push 0x30000
2:0C9C  6a00                 push 0
2:0C9E  9affff0000           lcall 0, 0xffff  ; USER.WinHelp
2:0CA3  e98605               jmp 0x122c
loc_0CA6:
2:0CA6  1e                   push ds
2:0CA7  686201               push 0x162  ; 'notepad read.me'
2:0CAA  6a03                 push 3
2:0CAC  9affff0000           lcall 0, 0xffff  ; KERNEL.WinExec
2:0CB1  e97805               jmp 0x122c
loc_0CB4:
2:0CB4  6a01                 push 1
2:0CB6  eb02                 jmp 0xcba
loc_0CB8:
2:0CB8  6a02                 push 2
loc_0CBA:
2:0CBA  c45e06               les bx, ptr [bp + 6]
2:0CBD  26ff7708             push word ptr es:[bx + 8]
2:0CC1  66ff367c5b           push dword ptr [0x5b7c]
2:0CC6  9a40af5f03           lcall 0x35f, 0xaf40  ; sub_s8:AF40
2:0CCB  e95e05               jmp 0x122c
loc_0CCE:
2:0CCE  66ff7606             push dword ptr [bp + 6]
2:0CD2  90                   nop
2:0CD3  0e                   push cs
2:0CD4  e801fb               call 0x7d8  ; sub_s2:07D8
2:0CD7  66ff7606             push dword ptr [bp + 6]
2:0CDB  90                   nop
2:0CDC  0e                   push cs
2:0CDD  e8ba21               call 0x2e9a  ; sub_s2:2E9A
2:0CE0  e94905               jmp 0x122c
2:0CE3  db 90
loc_0CE4:
2:0CE4  66ff7606             push dword ptr [bp + 6]
2:0CE8  90                   nop
2:0CE9  0e                   push cs
2:0CEA  e82b23               call 0x3018  ; sub_s2:3018
2:0CED  e93c05               jmp 0x122c
loc_0CF0:
2:0CF0  66ff7606             push dword ptr [bp + 6]
2:0CF4  90                   nop
2:0CF5  0e                   push cs
2:0CF6  e8d323               call 0x30cc  ; sub_s2:30CC
2:0CF9  e93005               jmp 0x122c
loc_0CFC:
2:0CFC  66ff7606             push dword ptr [bp + 6]
2:0D00  90                   nop
2:0D01  0e                   push cs
2:0D02  e84f1e               call 0x2b54  ; sub_s2:2B54
2:0D05  0bc0                 or ax, ax
2:0D07  0f842105             je 0x122c
loc_0D0B:
2:0D0B  c45e06               les bx, ptr [bp + 6]
2:0D0E  26ff7708             push word ptr es:[bx + 8]
2:0D12  666800001000         push 0x100000
loc_0D18:
2:0D18  666a00               push 0
2:0D1B  9affff0000           lcall 0, 0xffff  ; USER.SendMessage
2:0D20  e90905               jmp 0x122c
2:0D23  db 90
loc_0D24:
2:0D24  c45e06               les bx, ptr [bp + 6]
2:0D27  26ff7708             push word ptr es:[bx + 8]
2:0D2B  666820f01201         push 0x112f020
2:0D31  ebe5                 jmp 0xd18
2:0D33  db 90
loc_0D34:
2:0D34  c45e06               les bx, ptr [bp + 6]
2:0D37  26ff7708             push word ptr es:[bx + 8]
2:0D3B  666860f01201         push 0x112f060
2:0D41  e9f900               jmp 0xe3d
loc_0D44:
2:0D44  666801000004         push 0x4000001
2:0D4A  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0D4F  9a4483c40d           lcall 0xdc4, 0x8344  ; sub_s7:8344
2:0D54  0bd0                 or dx, ax
2:0D56  0f84d204             je 0x122c
2:0D5A  833ee84f00           cmp word ptr [0x4fe8], 0
2:0D5F  742b                 je 0xd8c
2:0D61  687b05               push 0x57b
2:0D64  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:0D69  9a7e84ad0d           lcall 0xdad, 0x847e  ; LoadStringRes@s3:847E
2:0D6E  894696               mov word ptr [bp - 0x6a], ax
2:0D71  895698               mov word ptr [bp - 0x68], dx
2:0D74  c45e06               les bx, ptr [bp + 6]
2:0D77  26ff7708             push word ptr es:[bx + 8]
2:0D7B  1e                   push ds
2:0D7C  687201               push 0x172  ; 'You may not run a turn. The game is over!'
2:0D7F  52                   push dx
2:0D80  50                   push ax
2:0D81  6a10                 push 0x10
2:0D83  9a0d070000           lcall 0, 0x70d  ; USER.MessageBox
2:0D88  e9a104               jmp 0x122c
2:0D8B  db 90
loc_0D8C:
2:0D8C  666a00               push 0
2:0D8F  68027f               push 0x7f02
2:0D92  9a1d070000           lcall 0, 0x71d  ; USER.LoadCursor
2:0D97  8946f4               mov word ptr [bp - 0xc], ax
2:0D9A  50                   push ax
2:0D9B  9a2c0e0000           lcall 0, 0xe2c  ; USER.SetCursor
2:0DA0  8946f2               mov word ptr [bp - 0xe], ax
2:0DA3  6a29                 push 0x29
2:0DA5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:0DAA  9aba20e70d           lcall 0xde7, 0x20ba  ; sub_s3:20BA
2:0DAF  8946ee               mov word ptr [bp - 0x12], ax
2:0DB2  8956f0               mov word ptr [bp - 0x10], dx
2:0DB5  52                   push dx
2:0DB6  50                   push ax
2:0DB7  9a2e265c07           lcall 0x75c, 0x262e  ; sub_s4:262E
2:0DBC  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0DC1  9a8e83d80d           lcall 0xdd8, 0x838e  ; sub_s7:838E
2:0DC6  c41e4857             les bx, ptr [0x5748]  ; g_sim
2:0DCA  26c747080100         mov word ptr es:[bx + 8], 1
2:0DD0  66ff364857           push dword ptr [0x5748]  ; g_sim
2:0DD5  9a26839d08           lcall 0x89d, 0x8326  ; Sim::getTurnNumber@s7:8326
2:0DDA  52                   push dx
2:0DDB  50                   push ax
2:0DDC  68dc05               push 0x5dc
2:0DDF  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:0DE4  9a7e84190e           lcall 0xe19, 0x847e  ; LoadStringRes@s3:847E
2:0DE9  52                   push dx
2:0DEA  50                   push ax
2:0DEB  1e                   push ds
2:0DEC  689c01               push 0x19c  ; '%s %ld'
2:0DEF  8d469e               lea ax, [bp - 0x62]
2:0DF2  16                   push ss
2:0DF3  50                   push ax
2:0DF4  9a9c3f140b           lcall 0xb14, 0x3f9c  ; _fsprintf@s1:3F9C
2:0DF9  83c410               add sp, 0x10
2:0DFC  8d469e               lea ax, [bp - 0x62]
2:0DFF  16                   push ss
2:0E00  50                   push ax
2:0E01  6a00                 push 0
2:0E03  c45e06               les bx, ptr [bp + 6]
2:0E06  06                   push es
2:0E07  53                   push bx
2:0E08  26c41f               les bx, ptr es:[bx]
2:0E0B  26ff5f14             lcall es:[bx + 0x14]
2:0E0F  6a37                 push 0x37
2:0E11  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:0E16  9aba204209           lcall 0x942, 0x20ba  ; sub_s3:20BA
2:0E1B  89469a               mov word ptr [bp - 0x66], ax
2:0E1E  89569c               mov word ptr [bp - 0x64], dx
2:0E21  52                   push dx
2:0E22  50                   push ax
2:0E23  90                   nop
2:0E24  0e                   push cs
2:0E25  e8c49b               call 0xffffa9ec  ; sub_s2:A9EC
2:0E28  ff76f2               push word ptr [bp - 0xe]
2:0E2B  9a26070000           lcall 0, 0x726  ; USER.SetCursor
2:0E30  c45e06               les bx, ptr [bp + 6]
2:0E33  26ff7708             push word ptr es:[bx + 8]
2:0E37  6668fc001101         push 0x11100fc
loc_0E3D:
2:0E3D  666a00               push 0
2:0E40  9a800a0000           lcall 0, 0xa80  ; USER.PostMessage
2:0E45  c9                   leave
2:0E46  ca0600               retf 6
2:0E49  db 90
loc_0E4A:
2:0E4A  6a01                 push 1
2:0E4C  e9ef00               jmp 0xf3e
2:0E4F  db 90
loc_0E50:
2:0E50  6a03                 push 3
2:0E52  e9e900               jmp 0xf3e
2:0E55  db 90
loc_0E56:
2:0E56  6a05                 push 5
2:0E58  e9e300               jmp 0xf3e
2:0E5B  db 90
loc_0E5C:
2:0E5C  66ff7606             push dword ptr [bp + 6]
2:0E60  90                   nop
2:0E61  0e                   push cs
2:0E62  e819fa               call 0x87e  ; sub_s2:087E
2:0E65  6a06                 push 6
2:0E67  e9d400               jmp 0xf3e
loc_0E6A:
2:0E6A  6a04                 push 4
2:0E6C  e9cf00               jmp 0xf3e
2:0E6F  db 90
loc_0E70:
2:0E70  6a07                 push 7
2:0E72  e9c900               jmp 0xf3e
2:0E75  db 90
loc_0E76:
2:0E76  6a08                 push 8
2:0E78  e9c300               jmp 0xf3e
2:0E7B  db 90
loc_0E7C:
2:0E7C  6a09                 push 9
2:0E7E  e9bd00               jmp 0xf3e
2:0E81  db 90
loc_0E82:
2:0E82  6a0a                 push 0xa
2:0E84  e9b700               jmp 0xf3e
2:0E87  db 90
loc_0E88:
2:0E88  6a0b                 push 0xb
2:0E8A  e9b100               jmp 0xf3e
2:0E8D  db 90
loc_0E8E:
2:0E8E  6a0c                 push 0xc
2:0E90  e9ab00               jmp 0xf3e
2:0E93  db 90
loc_0E94:
2:0E94  6a0d                 push 0xd
2:0E96  e9a500               jmp 0xf3e
2:0E99  db 90
loc_0E9A:
2:0E9A  6a0e                 push 0xe
2:0E9C  e99f00               jmp 0xf3e
2:0E9F  db 90
loc_0EA0:
2:0EA0  6a0f                 push 0xf
2:0EA2  e99900               jmp 0xf3e
2:0EA5  db 90
loc_0EA6:
2:0EA6  6a10                 push 0x10
2:0EA8  e99300               jmp 0xf3e
2:0EAB  db 90
loc_0EAC:
2:0EAC  6a11                 push 0x11
2:0EAE  e98d00               jmp 0xf3e
2:0EB1  db 90
loc_0EB2:
2:0EB2  6a12                 push 0x12  ; 'version %d %d'
2:0EB4  e98700               jmp 0xf3e
2:0EB7  db 90
loc_0EB8:
2:0EB8  6a13                 push 0x13
2:0EBA  e98100               jmp 0xf3e
2:0EBD  db 90
loc_0EBE:
2:0EBE  6a14                 push 0x14
2:0EC0  eb7c                 jmp 0xf3e
2:0EC2  db 90 90
loc_0EC4:
2:0EC4  6a17                 push 0x17
2:0EC6  eb76                 jmp 0xf3e
loc_0EC8:
2:0EC8  6a18                 push 0x18
2:0ECA  eb72                 jmp 0xf3e
loc_0ECC:
2:0ECC  6a19                 push 0x19
2:0ECE  eb6e                 jmp 0xf3e
loc_0ED0:
2:0ED0  6a1a                 push 0x1a
2:0ED2  eb6a                 jmp 0xf3e
loc_0ED4:
2:0ED4  6a1b                 push 0x1b
2:0ED6  eb66                 jmp 0xf3e
loc_0ED8:
2:0ED8  6a1c                 push 0x1c
2:0EDA  eb62                 jmp 0xf3e
loc_0EDC:
2:0EDC  6a1d                 push 0x1d
2:0EDE  eb5e                 jmp 0xf3e
loc_0EE0:
2:0EE0  6a1e                 push 0x1e
2:0EE2  eb5a                 jmp 0xf3e
loc_0EE4:
2:0EE4  6a1f                 push 0x1f
2:0EE6  eb56                 jmp 0xf3e
loc_0EE8:
2:0EE8  6a21                 push 0x21
2:0EEA  eb52                 jmp 0xf3e
loc_0EEC:
2:0EEC  6a35                 push 0x35  ; 'New failed in Op::Op->ResLibr'
2:0EEE  eb4e                 jmp 0xf3e
loc_0EF0:
2:0EF0  6a22                 push 0x22
2:0EF2  eb4a                 jmp 0xf3e
loc_0EF4:
2:0EF4  6a23                 push 0x23
2:0EF6  eb46                 jmp 0xf3e
loc_0EF8:
2:0EF8  6a24                 push 0x24
2:0EFA  eb42                 jmp 0xf3e
loc_0EFC:
2:0EFC  6a25                 push 0x25
2:0EFE  eb3e                 jmp 0xf3e
loc_0F00:
2:0F00  6a5e                 push 0x5e
2:0F02  eb3a                 jmp 0xf3e
loc_0F04:
2:0F04  6a26                 push 0x26
2:0F06  eb36                 jmp 0xf3e
loc_0F08:
2:0F08  6a27                 push 0x27
2:0F0A  eb32                 jmp 0xf3e
loc_0F0C:
2:0F0C  6a28                 push 0x28
2:0F0E  eb2e                 jmp 0xf3e
loc_0F10:
2:0F10  6a29                 push 0x29
2:0F12  eb2a                 jmp 0xf3e
loc_0F14:
2:0F14  6a2a                 push 0x2a
2:0F16  eb26                 jmp 0xf3e
loc_0F18:
2:0F18  6a2b                 push 0x2b
2:0F1A  eb22                 jmp 0xf3e
loc_0F1C:
2:0F1C  6a2c                 push 0x2c
2:0F1E  eb1e                 jmp 0xf3e
loc_0F20:
2:0F20  6a2d                 push 0x2d
2:0F22  eb1a                 jmp 0xf3e
loc_0F24:
2:0F24  6a2e                 push 0x2e
2:0F26  eb16                 jmp 0xf3e
loc_0F28:
2:0F28  6a2f                 push 0x2f
2:0F2A  eb12                 jmp 0xf3e
loc_0F2C:
2:0F2C  6a30                 push 0x30
2:0F2E  eb0e                 jmp 0xf3e
loc_0F30:
2:0F30  6a31                 push 0x31
2:0F32  eb0a                 jmp 0xf3e
loc_0F34:
2:0F34  6a32                 push 0x32
2:0F36  eb06                 jmp 0xf3e
loc_0F38:
2:0F38  6a33                 push 0x33
2:0F3A  eb02                 jmp 0xf3e
loc_0F3C:
2:0F3C  6a34                 push 0x34
loc_0F3E:
2:0F3E  66ff7606             push dword ptr [bp + 6]
2:0F42  90                   nop
2:0F43  0e                   push cs
2:0F44  e8851e               call 0x2dcc  ; sub_s2:2DCC
2:0F47  c9                   leave
2:0F48  ca0600               retf 6
2:0F4B  db 90
loc_0F4C:
2:0F4C  66ff7606             push dword ptr [bp + 6]
2:0F50  90                   nop
2:0F51  0e                   push cs
2:0F52  e8cd1d               call 0x2d22  ; sub_s2:2D22
2:0F55  c9                   leave
2:0F56  ca0600               retf 6
2:0F59  db 90
loc_0F5A:
2:0F5A  6a15                 push 0x15
2:0F5C  e9ef00               jmp 0x104e
2:0F5F  db 90
loc_0F60:
2:0F60  6a16                 push 0x16
2:0F62  e9e900               jmp 0x104e
2:0F65  db 90
loc_0F66:
2:0F66  6a36                 push 0x36
2:0F68  e9e300               jmp 0x104e
2:0F6B  db 90
loc_0F6C:
2:0F6C  6a37                 push 0x37
2:0F6E  e9dd00               jmp 0x104e
2:0F71  db 90
loc_0F72:
2:0F72  6a38                 push 0x38
2:0F74  e9d700               jmp 0x104e
2:0F77  db 90
loc_0F78:
2:0F78  6a39                 push 0x39
2:0F7A  e9d100               jmp 0x104e
2:0F7D  db 90
loc_0F7E:
2:0F7E  6a3a                 push 0x3a
2:0F80  e9cb00               jmp 0x104e
2:0F83  db 90
loc_0F84:
2:0F84  6a3b                 push 0x3b
2:0F86  e9c500               jmp 0x104e
2:0F89  db 90
loc_0F8A:
2:0F8A  6a3c                 push 0x3c
2:0F8C  e9bf00               jmp 0x104e
2:0F8F  db 90
loc_0F90:
2:0F90  6a3d                 push 0x3d
2:0F92  e9b900               jmp 0x104e
2:0F95  db 90
loc_0F96:
2:0F96  6a3e                 push 0x3e
2:0F98  e9b300               jmp 0x104e
2:0F9B  db 90
loc_0F9C:
2:0F9C  6a3f                 push 0x3f
2:0F9E  e9ad00               jmp 0x104e
2:0FA1  db 90
loc_0FA2:
2:0FA2  6a40                 push 0x40
2:0FA4  e9a700               jmp 0x104e
2:0FA7  db 90
loc_0FA8:
2:0FA8  6a41                 push 0x41
2:0FAA  e9a100               jmp 0x104e
2:0FAD  db 90
loc_0FAE:
2:0FAE  6a42                 push 0x42
2:0FB0  e99b00               jmp 0x104e
2:0FB3  db 90
loc_0FB4:
2:0FB4  6a43                 push 0x43
2:0FB6  e99500               jmp 0x104e
2:0FB9  db 90
loc_0FBA:
2:0FBA  6a44                 push 0x44
2:0FBC  e98f00               jmp 0x104e
2:0FBF  db 90
loc_0FC0:
2:0FC0  6a45                 push 0x45
2:0FC2  e98900               jmp 0x104e
2:0FC5  db 90
loc_0FC6:
2:0FC6  6a46                 push 0x46
2:0FC8  e98300               jmp 0x104e
2:0FCB  db 90
loc_0FCC:
2:0FCC  6a47                 push 0x47
2:0FCE  eb7e                 jmp 0x104e
loc_0FD0:
2:0FD0  6a48                 push 0x48
2:0FD2  eb7a                 jmp 0x104e
loc_0FD4:
2:0FD4  6a49                 push 0x49
2:0FD6  eb76                 jmp 0x104e
loc_0FD8:
2:0FD8  6a4a                 push 0x4a
2:0FDA  eb72                 jmp 0x104e
loc_0FDC:
2:0FDC  6a4b                 push 0x4b
2:0FDE  eb6e                 jmp 0x104e
loc_0FE0:
2:0FE0  6a4c                 push 0x4c
2:0FE2  eb6a                 jmp 0x104e
loc_0FE4:
2:0FE4  6a4d                 push 0x4d
2:0FE6  eb66                 jmp 0x104e
loc_0FE8:
2:0FE8  6a4e                 push 0x4e
2:0FEA  eb62                 jmp 0x104e
loc_0FEC:
2:0FEC  6a4f                 push 0x4f
2:0FEE  eb5e                 jmp 0x104e
loc_0FF0:
2:0FF0  6a50                 push 0x50
2:0FF2  eb5a                 jmp 0x104e
loc_0FF4:
2:0FF4  6a51                 push 0x51
2:0FF6  eb56                 jmp 0x104e
loc_0FF8:
2:0FF8  6a52                 push 0x52
2:0FFA  eb52                 jmp 0x104e
loc_0FFC:
2:0FFC  6a53                 push 0x53  ; 'New failed in Op::Op->DialogCtr'
2:0FFE  eb4e                 jmp 0x104e
loc_1000:
2:1000  6a55                 push 0x55
2:1002  eb4a                 jmp 0x104e
loc_1004:
2:1004  6a56                 push 0x56
2:1006  eb46                 jmp 0x104e
loc_1008:
2:1008  6a57                 push 0x57
2:100A  eb42                 jmp 0x104e
loc_100C:
2:100C  6a58                 push 0x58
2:100E  eb3e                 jmp 0x104e
loc_1010:
2:1010  6a59                 push 0x59
2:1012  eb3a                 jmp 0x104e
loc_1014:
2:1014  6a5a                 push 0x5a
2:1016  eb36                 jmp 0x104e
loc_1018:
2:1018  6a5b                 push 0x5b
2:101A  eb32                 jmp 0x104e
loc_101C:
2:101C  6a5c                 push 0x5c
2:101E  eb2e                 jmp 0x104e
loc_1020:
2:1020  6a5d                 push 0x5d
2:1022  eb2a                 jmp 0x104e
loc_1024:
2:1024  6a5f                 push 0x5f
2:1026  eb26                 jmp 0x104e
loc_1028:
2:1028  6a60                 push 0x60
2:102A  eb22                 jmp 0x104e
loc_102C:
2:102C  6a61                 push 0x61
2:102E  eb1e                 jmp 0x104e
loc_1030:
2:1030  6a62                 push 0x62
2:1032  eb1a                 jmp 0x104e
loc_1034:
2:1034  6a63                 push 0x63
2:1036  eb16                 jmp 0x104e
loc_1038:
2:1038  6a64                 push 0x64
2:103A  eb12                 jmp 0x104e
loc_103C:
2:103C  6a65                 push 0x65
2:103E  eb0e                 jmp 0x104e
loc_1040:
2:1040  6a66                 push 0x66
2:1042  eb0a                 jmp 0x104e
loc_1044:
2:1044  6a67                 push 0x67
2:1046  eb06                 jmp 0x104e
loc_1048:
2:1048  6a68                 push 0x68
2:104A  eb02                 jmp 0x104e
loc_104C:
2:104C  6a69                 push 0x69
loc_104E:
2:104E  66ff7606             push dword ptr [bp + 6]
2:1052  90                   nop
2:1053  0e                   push cs
2:1054  e8f71b               call 0x2c4e  ; sub_s2:2C4E
2:1057  c9                   leave
2:1058  ca0600               retf 6
2:105B  db 90
loc_105C:
2:105C  c45e06               les bx, ptr [bp + 6]
2:105F  268b87ea00           mov ax, word ptr es:[bx + 0xea]
2:1064  260b87e800           or ax, word ptr es:[bx + 0xe8]
2:1069  0f84bf01             je 0x122c
2:106D  ff760a               push word ptr [bp + 0xa]
2:1070  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:1076  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:107B  26c41f               les bx, ptr es:[bx]
2:107E  26ff5f40             lcall es:[bx + 0x40]
2:1082  c9                   leave
2:1083  ca0600               retf 6
loc_1086:
2:1086  2d6400               sub ax, 0x64
2:1089  3dca00               cmp ax, 0xca
2:108C  77ce                 ja 0x105c
2:108E  03c0                 add ax, ax
2:1090  93                   xchg bx, ax
2:1091  2effa79610           jmp word ptr cs:[bx + 0x1096]
switch_table_1096:
    dw loc_0CCE
    dw loc_0CE4
    dw loc_0CF0
    dw loc_0CFC
    dw loc_0D44
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_0CB8
    dw loc_0C7A
    dw loc_0CB4
    dw loc_0CA6
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_0F4C
    dw loc_0E88
    dw loc_0EE0
    dw loc_0EE4
    dw loc_0EE8
    dw loc_0EEC
    dw loc_0F78
    dw loc_0EF0
    dw loc_0F66
    dw loc_0F6C
    dw loc_0F72
    dw loc_0F7E
    dw loc_0F84
    dw loc_0F8A
    dw loc_0F90
    dw loc_0F96
    dw loc_0F9C
    dw loc_0FA2
    dw loc_0E8E
    dw loc_0FA8
    dw loc_0FAE
    dw loc_0FB4
    dw loc_0FBA
    dw loc_0FC0
    dw loc_0FC6
    dw loc_0FCC
    dw loc_0EF4
    dw loc_0EF8
    dw loc_0FD0
    dw loc_0FD4
    dw loc_0FD8
    dw loc_0FDC
    dw loc_0FE0
    dw loc_0E94
    dw loc_0FE4
    dw loc_0FE8
    dw loc_0FEC
    dw loc_0FF0
    dw loc_0FF4
    dw loc_0E9A
    dw loc_0EA0
    dw loc_0FF8
    dw loc_0EA6
    dw loc_0FFC
    dw loc_0EAC
    dw loc_0EB2
    dw loc_1008
    dw loc_0EB8
    dw loc_0EBE
    dw loc_100C
    dw loc_1034
    dw loc_1010
    dw loc_1014
    dw loc_1018
    dw loc_0F5A
    dw loc_0EFC
    dw loc_101C
    dw loc_0F60
    dw loc_1020
    dw loc_0F00
    dw loc_1024
    dw loc_1028
    dw loc_102C
    dw loc_1030
    dw loc_1038
    dw loc_103C
    dw loc_1040
    dw loc_1044
    dw loc_1048
    dw loc_104C
    dw loc_0EC4
    dw loc_0EC8
    dw loc_0ECC
    dw loc_0ED0
    dw loc_0ED4
    dw loc_0ED8
    dw loc_0EDC
    dw loc_0E6A
    dw loc_105C
    dw loc_0E50
    dw loc_0E4A
    dw loc_0E56
    dw loc_0E5C
    dw loc_0E70
    dw loc_0E76
    dw loc_0E7C
    dw loc_0E82
    dw loc_0F04
    dw loc_0F08
    dw loc_0F0C
    dw loc_0F10
    dw loc_0F14
    dw loc_0F18
    dw loc_0F1C
    dw loc_0F20
    dw loc_0F24
    dw loc_0F28
    dw loc_0F2C
    dw loc_0F30
    dw loc_0F34
    dw loc_0F38
    dw loc_0F3C
    dw loc_1000
    dw loc_1004
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_0D0B
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_0C6A
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_105C
    dw loc_0D24
    dw loc_105C
    dw loc_0D34
loc_122C:
2:122C  c9                   leave
2:122D  ca0600               retf 6

; ---------------- sub_s2:1230 FAR size=22 callers=0
2:1230  55                   push bp
2:1231  8bec                 mov bp, sp
2:1233  c45e06               les bx, ptr [bp + 6]
2:1236  6626ffb7e000         push dword ptr es:[bx + 0xe0]
2:123C  90                   nop
2:123D  0e                   push cs
2:123E  e86b27               call 0x39ac  ; sub_s2:39AC
2:1241  c9                   leave
2:1242  ca0400               retf 4
2:1245  db 00

; ---------------- sub_s2:1246 FAR size=44 callers=0
2:1246  55                   push bp
2:1247  8bec                 mov bp, sp
2:1249  c45e06               les bx, ptr [bp + 6]
2:124C  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:1253  7419                 je 0x126e
2:1255  66ff760c             push dword ptr [bp + 0xc]
2:1259  ff760a               push word ptr [bp + 0xa]
2:125C  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:1262  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:1267  26c41f               les bx, ptr es:[bx]
2:126A  26ff5f4c             lcall es:[bx + 0x4c]
loc_126E:
2:126E  c9                   leave
2:126F  ca0a00               retf 0xa

; ---------------- sub_s2:1272 FAR size=56 callers=0
2:1272  55                   push bp
2:1273  8bec                 mov bp, sp
2:1275  c45e06               les bx, ptr [bp + 6]
2:1278  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:127F  741b                 je 0x129c
2:1281  ff760a               push word ptr [bp + 0xa]
2:1284  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:128A  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:128F  26c41f               les bx, ptr es:[bx]
2:1292  26ff9f8800           lcall es:[bx + 0x88]
2:1297  c9                   leave
2:1298  ca0600               retf 6
2:129B  db 90
loc_129C:
2:129C  ff760a               push word ptr [bp + 0xa]
2:129F  06                   push es
2:12A0  53                   push bx
2:12A1  90                   nop
2:12A2  0e                   push cs
2:12A3  e81e8a               call 0xffff9cc4  ; sub_s2:9CC4
2:12A6  c9                   leave
2:12A7  ca0600               retf 6

; ---------------- sub_s2:12AA FAR size=50 callers=0
2:12AA  55                   push bp
2:12AB  8bec                 mov bp, sp
2:12AD  c45e06               les bx, ptr [bp + 6]
2:12B0  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:12B7  7417                 je 0x12d0
2:12B9  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:12BF  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:12C4  26c41f               les bx, ptr es:[bx]
2:12C7  26ff9f8c00           lcall es:[bx + 0x8c]
2:12CC  c9                   leave
2:12CD  ca0400               retf 4
loc_12D0:
2:12D0  06                   push es
2:12D1  53                   push bx
2:12D2  90                   nop
2:12D3  0e                   push cs
2:12D4  e8098a               call 0xffff9ce0  ; sub_s2:9CE0
2:12D7  c9                   leave
2:12D8  ca0400               retf 4
2:12DB  db 00

; ---------------- sub_s2:12DC FAR size=312 callers=2
;   apis: USER.LoadCursor, USER.MessageBeep, USER.MessageBox, USER.SetCursor
2:12DC  c8260000             enter 0x26, 0
2:12E0  666a00               push 0
2:12E3  68027f               push 0x7f02
2:12E6  9a930d0000           lcall 0, 0xd93  ; USER.LoadCursor
2:12EB  8946fe               mov word ptr [bp - 2], ax
2:12EE  50                   push ax
2:12EF  9a17130000           lcall 0, 0x1317  ; USER.SetCursor
2:12F4  8946fc               mov word ptr [bp - 4], ax
2:12F7  66ff760a             push dword ptr [bp + 0xa]
2:12FB  8d46f6               lea ax, [bp - 0xa]
2:12FE  16                   push ss
2:12FF  50                   push ax
2:1300  90                   nop
2:1301  0e                   push cs
2:1302  e8855a               call 0x6d8a  ; sub_s2:6D8A
2:1305  8d46f6               lea ax, [bp - 0xa]
2:1308  16                   push ss
2:1309  50                   push ax
2:130A  90                   nop
2:130B  0e                   push cs
2:130C  e8f35a               call 0x6e02  ; sub_s2:6E02
2:130F  0bc0                 or ax, ax
2:1311  7575                 jne 0x1388
2:1313  ff76fc               push word ptr [bp - 4]
2:1316  9a96130000           lcall 0, 0x1396  ; USER.SetCursor
2:131B  a11003               mov ax, word ptr [0x310]
2:131E  8946de               mov word ptr [bp - 0x22], ax
2:1321  c746e00000           mov word ptr [bp - 0x20], 0
2:1326  50                   push ax
2:1327  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:132C  9a7e845213           lcall 0x1352, 0x847e  ; LoadStringRes@s3:847E
2:1331  8946f2               mov word ptr [bp - 0xe], ax
2:1334  8956f4               mov word ptr [bp - 0xc], dx
2:1337  52                   push dx
2:1338  50                   push ax
2:1339  90                   nop
2:133A  0e                   push cs
2:133B  e8aa4d               call 0x60e8  ; sub_s2:60E8
2:133E  83c404               add sp, 4
2:1341  8946f2               mov word ptr [bp - 0xe], ax
2:1344  8956f4               mov word ptr [bp - 0xc], dx
2:1347  687b05               push 0x57b
2:134A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:134F  9a7e84a513           lcall 0x13a5, 0x847e  ; LoadStringRes@s3:847E
2:1354  8946ee               mov word ptr [bp - 0x12], ax
2:1357  8956f0               mov word ptr [bp - 0x10], dx
2:135A  6a10                 push 0x10
2:135C  9ad3130000           lcall 0, 0x13d3  ; USER.MessageBeep
2:1361  c45e06               les bx, ptr [bp + 6]
2:1364  26ff7708             push word ptr es:[bx + 8]
2:1368  66ff76f2             push dword ptr [bp - 0xe]
2:136C  66ff76ee             push dword ptr [bp - 0x12]
2:1370  6a10                 push 0x10
2:1372  9ae9130000           lcall 0, 0x13e9  ; USER.MessageBox
2:1377  668b46f2             mov eax, dword ptr [bp - 0xe]
2:137B  8b56f4               mov dx, word ptr [bp - 0xc]
2:137E  668946da             mov dword ptr [bp - 0x26], eax
2:1382  668946de             mov dword ptr [bp - 0x22], eax
2:1386  eb74                 jmp 0x13fc
loc_1388:
2:1388  c41e4857             les bx, ptr [0x5748]  ; g_sim
2:138C  26c747080000         mov word ptr es:[bx + 8], 0
2:1392  ff76fc               push word ptr [bp - 4]
2:1395  9a9c0d0000           lcall 0, 0xd9c  ; USER.SetCursor
2:139A  68d306               push 0x6d3
2:139D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:13A2  9a7e84c813           lcall 0x13c8, 0x847e  ; LoadStringRes@s3:847E
2:13A7  8946de               mov word ptr [bp - 0x22], ax
2:13AA  8956e0               mov word ptr [bp - 0x20], dx
2:13AD  52                   push dx
2:13AE  50                   push ax
2:13AF  90                   nop
2:13B0  0e                   push cs
2:13B1  e8344d               call 0x60e8  ; sub_s2:60E8
2:13B4  83c404               add sp, 4
2:13B7  8946de               mov word ptr [bp - 0x22], ax
2:13BA  8956e0               mov word ptr [bp - 0x20], dx
2:13BD  687b05               push 0x57b
2:13C0  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:13C5  9a7e84850c           lcall 0xc85, 0x847e  ; LoadStringRes@s3:847E
2:13CA  8946e2               mov word ptr [bp - 0x1e], ax
2:13CD  8956e4               mov word ptr [bp - 0x1c], dx
2:13D0  6a00                 push 0
2:13D2  9affff0000           lcall 0, 0xffff  ; USER.MessageBeep
2:13D7  c45e06               les bx, ptr [bp + 6]
2:13DA  26ff7708             push word ptr es:[bx + 8]
2:13DE  66ff76de             push dword ptr [bp - 0x22]
2:13E2  66ff76e2             push dword ptr [bp - 0x1e]
2:13E6  6a40                 push 0x40
2:13E8  9a840d0000           lcall 0, 0xd84  ; USER.MessageBox
2:13ED  668b46de             mov eax, dword ptr [bp - 0x22]
2:13F1  8b56e0               mov dx, word ptr [bp - 0x20]
2:13F4  668946da             mov dword ptr [bp - 0x26], eax
2:13F8  668946e6             mov dword ptr [bp - 0x1a], eax
loc_13FC:
2:13FC  52                   push dx
2:13FD  50                   push ax
2:13FE  9ace17f70d           lcall 0xdf7, 0x17ce  ; operator_delete@s1:17CE
2:1403  83c404               add sp, 4
2:1406  8d46f6               lea ax, [bp - 0xa]
2:1409  16                   push ss
2:140A  50                   push ax
2:140B  90                   nop
2:140C  0e                   push cs
2:140D  e8c059               call 0x6dd0  ; sub_s2:6DD0
2:1410  c9                   leave
2:1411  ca0800               retf 8

; ---------------- sub_s2:1414 FAR size=448 callers=1
;   apis: USER.MessageBeep, USER.MessageBox
2:1414  c8560000             enter 0x56, 0
2:1418  57                   push di
2:1419  56                   push si
2:141A  66ff760a             push dword ptr [bp + 0xa]
2:141E  8d46fa               lea ax, [bp - 6]
2:1421  16                   push ss
2:1422  50                   push ax
2:1423  90                   nop
2:1424  0e                   push cs
2:1425  e86259               call 0x6d8a  ; sub_s2:6D8A
2:1428  8d46fa               lea ax, [bp - 6]
2:142B  16                   push ss
2:142C  50                   push ax
2:142D  90                   nop
2:142E  0e                   push cs
2:142F  e8465a               call 0x6e78  ; sub_s2:6E78
2:1432  0bc0                 or ax, ax
2:1434  0f858800             jne 0x14c0
2:1438  39061003             cmp word ptr [0x310], ax
2:143C  7506                 jne 0x1444
2:143E  c7061003d406         mov word ptr [0x310], 0x6d4
loc_1444:
2:1444  a11003               mov ax, word ptr [0x310]
2:1447  8946b6               mov word ptr [bp - 0x4a], ax
2:144A  c746b80000           mov word ptr [bp - 0x48], 0
2:144F  50                   push ax
2:1450  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:1455  9a7e847b14           lcall 0x147b, 0x847e  ; LoadStringRes@s3:847E
2:145A  8946ca               mov word ptr [bp - 0x36], ax
2:145D  8956cc               mov word ptr [bp - 0x34], dx
2:1460  52                   push dx
2:1461  50                   push ax
2:1462  90                   nop
2:1463  0e                   push cs
2:1464  e8814c               call 0x60e8  ; sub_s2:60E8
2:1467  83c404               add sp, 4
2:146A  8946ca               mov word ptr [bp - 0x36], ax
2:146D  8956cc               mov word ptr [bp - 0x34], dx
2:1470  687b05               push 0x57b
2:1473  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:1478  9a7e84d514           lcall 0x14d5, 0x847e  ; LoadStringRes@s3:847E
2:147D  8946c6               mov word ptr [bp - 0x3a], ax
2:1480  8956c8               mov word ptr [bp - 0x38], dx
2:1483  6a10                 push 0x10
2:1485  9a5d130000           lcall 0, 0x135d  ; USER.MessageBeep
2:148A  c45e06               les bx, ptr [bp + 6]
2:148D  26ff7708             push word ptr es:[bx + 8]
2:1491  66ff76ca             push dword ptr [bp - 0x36]
2:1495  66ff76c6             push dword ptr [bp - 0x3a]
2:1499  6a10                 push 0x10
2:149B  9a73130000           lcall 0, 0x1373  ; USER.MessageBox
2:14A0  668b46ca             mov eax, dword ptr [bp - 0x36]
2:14A4  668946b2             mov dword ptr [bp - 0x4e], eax
2:14A8  668946b6             mov dword ptr [bp - 0x4a], eax
2:14AC  6650                 push eax
2:14AE  9ace17bb14           lcall 0x14bb, 0x17ce  ; operator_delete@s1:17CE
2:14B3  83c404               add sp, 4
2:14B6  6a01                 push 1
2:14B8  9acd240114           lcall 0x1401, 0x24cd  ; sub_s1:24CD
2:14BD  83c402               add sp, 2
loc_14C0:
2:14C0  6a08                 push 8
2:14C2  66ff7606             push dword ptr [bp + 6]
2:14C6  90                   nop
2:14C7  0e                   push cs
2:14C8  e80119               call 0x2dcc  ; sub_s2:2DCC
2:14CB  6a2f                 push 0x2f
2:14CD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:14D2  9aba209215           lcall 0x1592, 0x20ba  ; sub_s3:20BA
2:14D7  8946f6               mov word ptr [bp - 0xa], ax
2:14DA  8956f8               mov word ptr [bp - 8], dx
2:14DD  c45ef6               les bx, ptr [bp - 0xa]
2:14E0  66268b4720           mov eax, dword ptr es:[bx + 0x20]
2:14E5  668946f2             mov dword ptr [bp - 0xe], eax
2:14E9  6650                 push eax
2:14EB  66ff364857           push dword ptr [0x5748]  ; g_sim
2:14F0  9a44833915           lcall 0x1539, 0x8344  ; sub_s7:8344
2:14F5  8946ee               mov word ptr [bp - 0x12], ax
2:14F8  8956f0               mov word ptr [bp - 0x10], dx
2:14FB  c45eee               les bx, ptr [bp - 0x12]
2:14FE  66268b4710           mov eax, dword ptr es:[bx + 0x10]
2:1503  668946ea             mov dword ptr [bp - 0x16], eax
2:1507  6a02                 push 2
2:1509  c45eea               les bx, ptr [bp - 0x16]
2:150C  268b4702             mov ax, word ptr es:[bx + 2]
2:1510  48                   dec ax
2:1511  50                   push ax
2:1512  66ff76f2             push dword ptr [bp - 0xe]
2:1516  c45e06               les bx, ptr [bp + 6]
2:1519  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:151F  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:1524  26c41f               les bx, ptr es:[bx]
2:1527  26ff5f04             lcall es:[bx + 4]
2:152B  666801000004         push 0x4000001
2:1531  66ff364857           push dword ptr [0x5748]  ; g_sim
2:1536  9a44835715           lcall 0x1557, 0x8344  ; sub_s7:8344
2:153B  8946e6               mov word ptr [bp - 0x1a], ax
2:153E  8956e8               mov word ptr [bp - 0x18], dx
2:1541  c45ee6               les bx, ptr [bp - 0x1a]
2:1544  66268b4710           mov eax, dword ptr es:[bx + 0x10]
2:1549  668946e2             mov dword ptr [bp - 0x1e], eax
2:154D  6650                 push eax
2:154F  66ff364857           push dword ptr [0x5748]  ; g_sim
2:1554  9a44837d15           lcall 0x157d, 0x8344  ; sub_s7:8344
2:1559  8946de               mov word ptr [bp - 0x22], ax
2:155C  8956e0               mov word ptr [bp - 0x20], dx
2:155F  050c00               add ax, 0xc
2:1562  1e                   push ds
2:1563  8d7ed8               lea di, [bp - 0x28]
2:1566  8bf0                 mov si, ax
2:1568  16                   push ss
2:1569  07                   pop es
2:156A  8eda                 mov ds, dx
2:156C  66a5                 movsd dword ptr es:[di], dword ptr [si]
2:156E  a5                   movsw word ptr es:[di], word ptr [si]
2:156F  1f                   pop ds
2:1570  8d46d8               lea ax, [bp - 0x28]
2:1573  8946b6               mov word ptr [bp - 0x4a], ax
2:1576  66ff76ee             push dword ptr [bp - 0x12]
2:157A  9a005b520d           lcall 0xd52, 0x5b00  ; sub_s7:5B00
2:157F  8946d6               mov word ptr [bp - 0x2a], ax
2:1582  8d46d8               lea ax, [bp - 0x28]
2:1585  16                   push ss
2:1586  50                   push ax
2:1587  ff76d6               push word ptr [bp - 0x2a]
2:158A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:158F  9aba20b515           lcall 0x15b5, 0x20ba  ; sub_s3:20BA
2:1594  8946d2               mov word ptr [bp - 0x2e], ax
2:1597  8956d4               mov word ptr [bp - 0x2c], dx
2:159A  52                   push dx
2:159B  50                   push ax
2:159C  9a9e17ba0d           lcall 0xdba, 0x179e  ; sub_s4:179E
2:15A1  666800041b00         push 0x1b0400
2:15A7  66682b000100         push 0x1002b
2:15AD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:15B2  9aba20c215           lcall 0x15c2, 0x20ba  ; sub_s3:20BA
2:15B7  8946ce               mov word ptr [bp - 0x32], ax
2:15BA  8956d0               mov word ptr [bp - 0x30], dx
2:15BD  52                   push dx
2:15BE  50                   push ax
2:15BF  9a3a042f13           lcall 0x132f, 0x43a  ; sub_s3:043A
2:15C4  8d46fa               lea ax, [bp - 6]
2:15C7  16                   push ss
2:15C8  50                   push ax
2:15C9  90                   nop
2:15CA  0e                   push cs
2:15CB  e80258               call 0x6dd0  ; sub_s2:6DD0
2:15CE  5e                   pop si
2:15CF  5f                   pop di
2:15D0  c9                   leave
2:15D1  ca0800               retf 8

; ---------------- sub_s2:15D4 FAR size=5504 callers=2
2:15D4  c81e0000             enter 0x1e, 0
2:15D8  66c746fc00000000     mov dword ptr [bp - 4], 0
2:15E0  668b4606             mov eax, dword ptr [bp + 6]
2:15E4  05d200               add ax, 0xd2
2:15E7  6650                 push eax
2:15E9  8d46f4               lea ax, [bp - 0xc]
2:15EC  16                   push ss
2:15ED  50                   push ax
2:15EE  90                   nop
2:15EF  0e                   push cs
2:15F0  e8b141               call 0x57a4  ; sub_s2:57A4
loc_15F3:
2:15F3  8d46f4               lea ax, [bp - 0xc]
2:15F6  16                   push ss
2:15F7  50                   push ax
2:15F8  90                   nop
2:15F9  0e                   push cs
2:15FA  e81545               call 0x5b12  ; ListIter::next@s2:5B12
2:15FD  8946f0               mov word ptr [bp - 0x10], ax
2:1600  8956f2               mov word ptr [bp - 0xe], dx
2:1603  0bd0                 or dx, ax
2:1605  7423                 je 0x162a
2:1607  c45ef0               les bx, ptr [bp - 0x10]
2:160A  66268b4704           mov eax, dword ptr es:[bx + 4]
2:160F  268b5706             mov dx, word ptr es:[bx + 6]
2:1613  668946ec             mov dword ptr [bp - 0x14], eax
2:1617  8b460a               mov ax, word ptr [bp + 0xa]
2:161A  c45eec               les bx, ptr [bp - 0x14]
2:161D  263987de00           cmp word ptr es:[bx + 0xde], ax
2:1622  75cf                 jne 0x15f3
2:1624  895efc               mov word ptr [bp - 4], bx
2:1627  8956fe               mov word ptr [bp - 2], dx
loc_162A:
2:162A  66837efc00           cmp dword ptr [bp - 4], 0
2:162F  0f851615             jne 0x2b49
2:1633  8b460a               mov ax, word ptr [bp + 0xa]
2:1636  e92114               jmp 0x2a5a
2:1639  db 90
loc_163A:
2:163A  68f600               push 0xf6
2:163D  9a9c177016           lcall 0x1670, 0x179c  ; operator_new@s1:179C
2:1642  83c402               add sp, 2
2:1645  8946e2               mov word ptr [bp - 0x1e], ax
2:1648  8956e4               mov word ptr [bp - 0x1c], dx
2:164B  0bd0                 or dx, ax
2:164D  744b                 je 0x169a
2:164F  c45e06               les bx, ptr [bp + 6]
2:1652  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1657  06                   push es
2:1658  53                   push bx
2:1659  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:165E  66ff76e2             push dword ptr [bp - 0x1e]
2:1662  9adce59516           lcall 0x1695, 0xe5dc  ; sub_s4:E5DC
2:1667  e9cb13               jmp 0x2a35
loc_166A:
2:166A  68f600               push 0xf6
2:166D  9a9c17ac16           lcall 0x16ac, 0x179c  ; operator_new@s1:179C
2:1672  83c402               add sp, 2
2:1675  8946e2               mov word ptr [bp - 0x1e], ax
2:1678  8956e4               mov word ptr [bp - 0x1c], dx
2:167B  0bd0                 or dx, ax
2:167D  741b                 je 0x169a
2:167F  c45e06               les bx, ptr [bp + 6]
2:1682  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1687  06                   push es
2:1688  53                   push bx
2:1689  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:168E  66ff76e2             push dword ptr [bp - 0x1e]
2:1692  9acc663317           lcall 0x1733, 0x66cc  ; sub_s4:66CC
2:1697  e99b13               jmp 0x2a35
loc_169A:
2:169A  66c746fc00000000     mov dword ptr [bp - 4], 0
2:16A2  e99514               jmp 0x2b3a
2:16A5  db 90
loc_16A6:
2:16A6  681801               push 0x118
2:16A9  9a9c17dc16           lcall 0x16dc, 0x179c  ; operator_new@s1:179C
2:16AE  83c402               add sp, 2
2:16B1  8946e2               mov word ptr [bp - 0x1e], ax
2:16B4  8956e4               mov word ptr [bp - 0x1c], dx
2:16B7  0bd0                 or dx, ax
2:16B9  74df                 je 0x169a
2:16BB  c45e06               les bx, ptr [bp + 6]
2:16BE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:16C3  06                   push es
2:16C4  53                   push bx
2:16C5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:16CA  66ff76e2             push dword ptr [bp - 0x1e]
2:16CE  9ac8410117           lcall 0x1701, 0x41c8  ; sub_s5:41C8
2:16D3  e95f13               jmp 0x2a35
loc_16D6:
2:16D6  68f600               push 0xf6
2:16D9  9a9c170c17           lcall 0x170c, 0x179c  ; operator_new@s1:179C
2:16DE  83c402               add sp, 2
2:16E1  8946e2               mov word ptr [bp - 0x1e], ax
2:16E4  8956e4               mov word ptr [bp - 0x1c], dx
2:16E7  0bd0                 or dx, ax
2:16E9  74af                 je 0x169a
2:16EB  c45e06               les bx, ptr [bp + 6]
2:16EE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:16F3  06                   push es
2:16F4  53                   push bx
2:16F5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:16FA  66ff76e2             push dword ptr [bp - 0x1e]
2:16FE  9a24256517           lcall 0x1765, 0x2524  ; sub_s5:2524
2:1703  e92f13               jmp 0x2a35
loc_1706:
2:1706  68f600               push 0xf6
2:1709  9a9c173e17           lcall 0x173e, 0x179c  ; operator_new@s1:179C
2:170E  83c402               add sp, 2
2:1711  8946e2               mov word ptr [bp - 0x1e], ax
2:1714  8956e4               mov word ptr [bp - 0x1c], dx
2:1717  0bd0                 or dx, ax
2:1719  0f847dff             je 0x169a
2:171D  c45e06               les bx, ptr [bp + 6]
2:1720  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1725  06                   push es
2:1726  53                   push bx
2:1727  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:172C  66ff76e2             push dword ptr [bp - 0x1e]
2:1730  9a30e29717           lcall 0x1797, 0xe230  ; sub_s4:E230
2:1735  e9fd12               jmp 0x2a35
loc_1738:
2:1738  68f600               push 0xf6
2:173B  9a9c177017           lcall 0x1770, 0x179c  ; operator_new@s1:179C
2:1740  83c402               add sp, 2
2:1743  8946e2               mov word ptr [bp - 0x1e], ax
2:1746  8956e4               mov word ptr [bp - 0x1c], dx
2:1749  0bd0                 or dx, ax
2:174B  0f844bff             je 0x169a
2:174F  c45e06               les bx, ptr [bp + 6]
2:1752  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1757  06                   push es
2:1758  53                   push bx
2:1759  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:175E  66ff76e2             push dword ptr [bp - 0x1e]
2:1762  9a5475fb17           lcall 0x17fb, 0x7554  ; sub_s5:7554
2:1767  e9cb12               jmp 0x2a35
loc_176A:
2:176A  68fa00               push 0xfa
2:176D  9a9c17a217           lcall 0x17a2, 0x179c  ; operator_new@s1:179C
2:1772  83c402               add sp, 2
2:1775  8946e2               mov word ptr [bp - 0x1e], ax
2:1778  8956e4               mov word ptr [bp - 0x1c], dx
2:177B  0bd0                 or dx, ax
2:177D  0f8419ff             je 0x169a
2:1781  c45e06               les bx, ptr [bp + 6]
2:1784  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1789  06                   push es
2:178A  53                   push bx
2:178B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1790  66ff76e2             push dword ptr [bp - 0x1e]
2:1794  9a1ee9c917           lcall 0x17c9, 0xe91e  ; sub_s4:E91E
2:1799  e99912               jmp 0x2a35
loc_179C:
2:179C  68f800               push 0xf8
2:179F  9a9c17d417           lcall 0x17d4, 0x179c  ; operator_new@s1:179C
2:17A4  83c402               add sp, 2
2:17A7  8946e2               mov word ptr [bp - 0x1e], ax
2:17AA  8956e4               mov word ptr [bp - 0x1c], dx
2:17AD  0bd0                 or dx, ax
2:17AF  0f84e7fe             je 0x169a
2:17B3  c45e06               les bx, ptr [bp + 6]
2:17B6  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:17BB  06                   push es
2:17BC  53                   push bx
2:17BD  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:17C2  66ff76e2             push dword ptr [bp - 0x1e]
2:17C6  9a40583a18           lcall 0x183a, 0x5840  ; sub_s4:5840
2:17CB  e96712               jmp 0x2a35
loc_17CE:
2:17CE  68ec00               push 0xec
2:17D1  9a9c171318           lcall 0x1813, 0x179c  ; operator_new@s1:179C
2:17D6  83c402               add sp, 2
2:17D9  8946e2               mov word ptr [bp - 0x1e], ax
2:17DC  8956e4               mov word ptr [bp - 0x1c], dx
2:17DF  0bd0                 or dx, ax
2:17E1  0f84b5fe             je 0x169a
2:17E5  c45e06               les bx, ptr [bp + 6]
2:17E8  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:17ED  06                   push es
2:17EE  53                   push bx
2:17EF  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:17F4  66ff76e2             push dword ptr [bp - 0x1e]
2:17F8  9ab608aa0b           lcall 0xbaa, 0x8b6  ; sub_s5:08B6
2:17FD  e93512               jmp 0x2a35
loc_1800:
2:1800  68d301               push 0x1d3
2:1803  66ff36a002           push dword ptr [0x2a0]
2:1808  90                   nop
2:1809  0e                   push cs
2:180A  e84f44               call 0x5c5c  ; sub_s2:5C5C
2:180D  68f200               push 0xf2
2:1810  9a9c174618           lcall 0x1846, 0x179c  ; operator_new@s1:179C
2:1815  83c402               add sp, 2
2:1818  8946e2               mov word ptr [bp - 0x1e], ax
2:181B  8956e4               mov word ptr [bp - 0x1c], dx
2:181E  0bd0                 or dx, ax
2:1820  0f8476fe             je 0x169a
2:1824  c45e06               les bx, ptr [bp + 6]
2:1827  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:182C  06                   push es
2:182D  53                   push bx
2:182E  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1833  66ff76e2             push dword ptr [bp - 0x1e]
2:1837  9a026d6d18           lcall 0x186d, 0x6d02  ; sub_s4:6D02
2:183C  e9f611               jmp 0x2a35
2:183F  db 90
loc_1840:
2:1840  68f200               push 0xf2
2:1843  9a9c177818           lcall 0x1878, 0x179c  ; operator_new@s1:179C
2:1848  83c402               add sp, 2
2:184B  8946e2               mov word ptr [bp - 0x1e], ax
2:184E  8956e4               mov word ptr [bp - 0x1c], dx
2:1851  0bd0                 or dx, ax
2:1853  0f8443fe             je 0x169a
2:1857  c45e06               les bx, ptr [bp + 6]
2:185A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:185F  06                   push es
2:1860  53                   push bx
2:1861  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1866  66ff76e2             push dword ptr [bp - 0x1e]
2:186A  9a386d9f18           lcall 0x189f, 0x6d38  ; sub_s4:6D38
2:186F  e9c311               jmp 0x2a35
loc_1872:
2:1872  68f200               push 0xf2
2:1875  9a9c17aa18           lcall 0x18aa, 0x179c  ; operator_new@s1:179C
2:187A  83c402               add sp, 2
2:187D  8946e2               mov word ptr [bp - 0x1e], ax
2:1880  8956e4               mov word ptr [bp - 0x1c], dx
2:1883  0bd0                 or dx, ax
2:1885  0f8411fe             je 0x169a
2:1889  c45e06               les bx, ptr [bp + 6]
2:188C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1891  06                   push es
2:1892  53                   push bx
2:1893  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1898  66ff76e2             push dword ptr [bp - 0x1e]
2:189C  9a6e6dd118           lcall 0x18d1, 0x6d6e  ; sub_s4:6D6E
2:18A1  e99111               jmp 0x2a35
loc_18A4:
2:18A4  68f200               push 0xf2
2:18A7  9a9c17dc18           lcall 0x18dc, 0x179c  ; operator_new@s1:179C
2:18AC  83c402               add sp, 2
2:18AF  8946e2               mov word ptr [bp - 0x1e], ax
2:18B2  8956e4               mov word ptr [bp - 0x1c], dx
2:18B5  0bd0                 or dx, ax
2:18B7  0f84dffd             je 0x169a
2:18BB  c45e06               les bx, ptr [bp + 6]
2:18BE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:18C3  06                   push es
2:18C4  53                   push bx
2:18C5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:18CA  66ff76e2             push dword ptr [bp - 0x1e]
2:18CE  9aa46d0319           lcall 0x1903, 0x6da4  ; sub_s4:6DA4
2:18D3  e95f11               jmp 0x2a35
loc_18D6:
2:18D6  68f200               push 0xf2
2:18D9  9a9c170e19           lcall 0x190e, 0x179c  ; operator_new@s1:179C
2:18DE  83c402               add sp, 2
2:18E1  8946e2               mov word ptr [bp - 0x1e], ax
2:18E4  8956e4               mov word ptr [bp - 0x1c], dx
2:18E7  0bd0                 or dx, ax
2:18E9  0f84adfd             je 0x169a
2:18ED  c45e06               les bx, ptr [bp + 6]
2:18F0  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:18F5  06                   push es
2:18F6  53                   push bx
2:18F7  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:18FC  66ff76e2             push dword ptr [bp - 0x1e]
2:1900  9ada6d3519           lcall 0x1935, 0x6dda  ; sub_s4:6DDA
2:1905  e92d11               jmp 0x2a35
loc_1908:
2:1908  68f200               push 0xf2
2:190B  9a9c174019           lcall 0x1940, 0x179c  ; operator_new@s1:179C
2:1910  83c402               add sp, 2
2:1913  8946e2               mov word ptr [bp - 0x1e], ax
2:1916  8956e4               mov word ptr [bp - 0x1c], dx
2:1919  0bd0                 or dx, ax
2:191B  0f847bfd             je 0x169a
2:191F  c45e06               les bx, ptr [bp + 6]
2:1922  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1927  06                   push es
2:1928  53                   push bx
2:1929  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:192E  66ff76e2             push dword ptr [bp - 0x1e]
2:1932  9a106e6719           lcall 0x1967, 0x6e10  ; sub_s4:6E10
2:1937  e9fb10               jmp 0x2a35
loc_193A:
2:193A  68f200               push 0xf2
2:193D  9a9c177219           lcall 0x1972, 0x179c  ; operator_new@s1:179C
2:1942  83c402               add sp, 2
2:1945  8946e2               mov word ptr [bp - 0x1e], ax
2:1948  8956e4               mov word ptr [bp - 0x1c], dx
2:194B  0bd0                 or dx, ax
2:194D  0f8449fd             je 0x169a
2:1951  c45e06               les bx, ptr [bp + 6]
2:1954  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1959  06                   push es
2:195A  53                   push bx
2:195B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1960  66ff76e2             push dword ptr [bp - 0x1e]
2:1964  9a466e9f15           lcall 0x159f, 0x6e46  ; sub_s4:6E46
2:1969  e9c910               jmp 0x2a35
loc_196C:
2:196C  68f200               push 0xf2
2:196F  9a9c17b114           lcall 0x14b1, 0x179c  ; operator_new@s1:179C
2:1974  83c402               add sp, 2
2:1977  8946e2               mov word ptr [bp - 0x1e], ax
2:197A  8956e4               mov word ptr [bp - 0x1c], dx
2:197D  0bd0                 or dx, ax
2:197F  0f8417fd             je 0x169a
2:1983  c45e06               les bx, ptr [bp + 6]
2:1986  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:198B  06                   push es
2:198C  53                   push bx
2:198D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1992  66ff76e2             push dword ptr [bp - 0x1e]
2:1996  9a7c6ecb19           lcall 0x19cb, 0x6e7c  ; sub_s4:6E7C
2:199B  e99710               jmp 0x2a35
loc_199E:
2:199E  68f200               push 0xf2
2:19A1  9a9c17d619           lcall 0x19d6, 0x179c  ; operator_new@s1:179C
2:19A6  83c402               add sp, 2
2:19A9  8946e2               mov word ptr [bp - 0x1e], ax
2:19AC  8956e4               mov word ptr [bp - 0x1c], dx
2:19AF  0bd0                 or dx, ax
2:19B1  0f84e5fc             je 0x169a
2:19B5  c45e06               les bx, ptr [bp + 6]
2:19B8  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:19BD  06                   push es
2:19BE  53                   push bx
2:19BF  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:19C4  66ff76e2             push dword ptr [bp - 0x1e]
2:19C8  9ab26efd19           lcall 0x19fd, 0x6eb2  ; sub_s4:6EB2
2:19CD  e96510               jmp 0x2a35
loc_19D0:
2:19D0  68f200               push 0xf2
2:19D3  9a9c17081a           lcall 0x1a08, 0x179c  ; operator_new@s1:179C
2:19D8  83c402               add sp, 2
2:19DB  8946e2               mov word ptr [bp - 0x1e], ax
2:19DE  8956e4               mov word ptr [bp - 0x1c], dx
2:19E1  0bd0                 or dx, ax
2:19E3  0f84b3fc             je 0x169a
2:19E7  c45e06               les bx, ptr [bp + 6]
2:19EA  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:19EF  06                   push es
2:19F0  53                   push bx
2:19F1  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:19F6  66ff76e2             push dword ptr [bp - 0x1e]
2:19FA  9ae86e2f1a           lcall 0x1a2f, 0x6ee8  ; sub_s4:6EE8
2:19FF  e93310               jmp 0x2a35
loc_1A02:
2:1A02  68f200               push 0xf2
2:1A05  9a9c173a1a           lcall 0x1a3a, 0x179c  ; operator_new@s1:179C
2:1A0A  83c402               add sp, 2
2:1A0D  8946e2               mov word ptr [bp - 0x1e], ax
2:1A10  8956e4               mov word ptr [bp - 0x1c], dx
2:1A13  0bd0                 or dx, ax
2:1A15  0f8481fc             je 0x169a
2:1A19  c45e06               les bx, ptr [bp + 6]
2:1A1C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1A21  06                   push es
2:1A22  53                   push bx
2:1A23  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1A28  66ff76e2             push dword ptr [bp - 0x1e]
2:1A2C  9a1e6f611a           lcall 0x1a61, 0x6f1e  ; sub_s4:6F1E
2:1A31  e90110               jmp 0x2a35
loc_1A34:
2:1A34  68f200               push 0xf2
2:1A37  9a9c176c1a           lcall 0x1a6c, 0x179c  ; operator_new@s1:179C
2:1A3C  83c402               add sp, 2
2:1A3F  8946e2               mov word ptr [bp - 0x1e], ax
2:1A42  8956e4               mov word ptr [bp - 0x1c], dx
2:1A45  0bd0                 or dx, ax
2:1A47  0f844ffc             je 0x169a
2:1A4B  c45e06               les bx, ptr [bp + 6]
2:1A4E  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1A53  06                   push es
2:1A54  53                   push bx
2:1A55  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1A5A  66ff76e2             push dword ptr [bp - 0x1e]
2:1A5E  9a546f931a           lcall 0x1a93, 0x6f54  ; sub_s4:6F54
2:1A63  e9cf0f               jmp 0x2a35
loc_1A66:
2:1A66  68f200               push 0xf2
2:1A69  9a9c179e1a           lcall 0x1a9e, 0x179c  ; operator_new@s1:179C
2:1A6E  83c402               add sp, 2
2:1A71  8946e2               mov word ptr [bp - 0x1e], ax
2:1A74  8956e4               mov word ptr [bp - 0x1c], dx
2:1A77  0bd0                 or dx, ax
2:1A79  0f841dfc             je 0x169a
2:1A7D  c45e06               les bx, ptr [bp + 6]
2:1A80  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1A85  06                   push es
2:1A86  53                   push bx
2:1A87  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1A8C  66ff76e2             push dword ptr [bp - 0x1e]
2:1A90  9a8a6fc51a           lcall 0x1ac5, 0x6f8a  ; sub_s4:6F8A
2:1A95  e99d0f               jmp 0x2a35
loc_1A98:
2:1A98  68f200               push 0xf2
2:1A9B  9a9c17d01a           lcall 0x1ad0, 0x179c  ; operator_new@s1:179C
2:1AA0  83c402               add sp, 2
2:1AA3  8946e2               mov word ptr [bp - 0x1e], ax
2:1AA6  8956e4               mov word ptr [bp - 0x1c], dx
2:1AA9  0bd0                 or dx, ax
2:1AAB  0f84ebfb             je 0x169a
2:1AAF  c45e06               les bx, ptr [bp + 6]
2:1AB2  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1AB7  06                   push es
2:1AB8  53                   push bx
2:1AB9  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1ABE  66ff76e2             push dword ptr [bp - 0x1e]
2:1AC2  9ac06ff71a           lcall 0x1af7, 0x6fc0  ; sub_s4:6FC0
2:1AC7  e96b0f               jmp 0x2a35
loc_1ACA:
2:1ACA  68f200               push 0xf2
2:1ACD  9a9c17021b           lcall 0x1b02, 0x179c  ; operator_new@s1:179C
2:1AD2  83c402               add sp, 2
2:1AD5  8946e2               mov word ptr [bp - 0x1e], ax
2:1AD8  8956e4               mov word ptr [bp - 0x1c], dx
2:1ADB  0bd0                 or dx, ax
2:1ADD  0f84b9fb             je 0x169a
2:1AE1  c45e06               les bx, ptr [bp + 6]
2:1AE4  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1AE9  06                   push es
2:1AEA  53                   push bx
2:1AEB  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1AF0  66ff76e2             push dword ptr [bp - 0x1e]
2:1AF4  9af66f291b           lcall 0x1b29, 0x6ff6  ; sub_s4:6FF6
2:1AF9  e9390f               jmp 0x2a35
loc_1AFC:
2:1AFC  68f200               push 0xf2
2:1AFF  9a9c17341b           lcall 0x1b34, 0x179c  ; operator_new@s1:179C
2:1B04  83c402               add sp, 2
2:1B07  8946e2               mov word ptr [bp - 0x1e], ax
2:1B0A  8956e4               mov word ptr [bp - 0x1c], dx
2:1B0D  0bd0                 or dx, ax
2:1B0F  0f8487fb             je 0x169a
2:1B13  c45e06               les bx, ptr [bp + 6]
2:1B16  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1B1B  06                   push es
2:1B1C  53                   push bx
2:1B1D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1B22  66ff76e2             push dword ptr [bp - 0x1e]
2:1B26  9a2c705b1b           lcall 0x1b5b, 0x702c  ; sub_s4:702C
2:1B2B  e9070f               jmp 0x2a35
loc_1B2E:
2:1B2E  68f200               push 0xf2
2:1B31  9a9c17661b           lcall 0x1b66, 0x179c  ; operator_new@s1:179C
2:1B36  83c402               add sp, 2
2:1B39  8946e2               mov word ptr [bp - 0x1e], ax
2:1B3C  8956e4               mov word ptr [bp - 0x1c], dx
2:1B3F  0bd0                 or dx, ax
2:1B41  0f8455fb             je 0x169a
2:1B45  c45e06               les bx, ptr [bp + 6]
2:1B48  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1B4D  06                   push es
2:1B4E  53                   push bx
2:1B4F  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1B54  66ff76e2             push dword ptr [bp - 0x1e]
2:1B58  9a62708d1b           lcall 0x1b8d, 0x7062  ; sub_s4:7062
2:1B5D  e9d50e               jmp 0x2a35
loc_1B60:
2:1B60  68f200               push 0xf2
2:1B63  9a9c17981b           lcall 0x1b98, 0x179c  ; operator_new@s1:179C
2:1B68  83c402               add sp, 2
2:1B6B  8946e2               mov word ptr [bp - 0x1e], ax
2:1B6E  8956e4               mov word ptr [bp - 0x1c], dx
2:1B71  0bd0                 or dx, ax
2:1B73  0f8423fb             je 0x169a
2:1B77  c45e06               les bx, ptr [bp + 6]
2:1B7A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1B7F  06                   push es
2:1B80  53                   push bx
2:1B81  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1B86  66ff76e2             push dword ptr [bp - 0x1e]
2:1B8A  9a9870bf1b           lcall 0x1bbf, 0x7098  ; sub_s4:7098
2:1B8F  e9a30e               jmp 0x2a35
loc_1B92:
2:1B92  68f200               push 0xf2
2:1B95  9a9c17ca1b           lcall 0x1bca, 0x179c  ; operator_new@s1:179C
2:1B9A  83c402               add sp, 2
2:1B9D  8946e2               mov word ptr [bp - 0x1e], ax
2:1BA0  8956e4               mov word ptr [bp - 0x1c], dx
2:1BA3  0bd0                 or dx, ax
2:1BA5  0f84f1fa             je 0x169a
2:1BA9  c45e06               les bx, ptr [bp + 6]
2:1BAC  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1BB1  06                   push es
2:1BB2  53                   push bx
2:1BB3  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1BB8  66ff76e2             push dword ptr [bp - 0x1e]
2:1BBC  9ace70f11b           lcall 0x1bf1, 0x70ce  ; sub_s4:70CE
2:1BC1  e9710e               jmp 0x2a35
loc_1BC4:
2:1BC4  68f200               push 0xf2
2:1BC7  9a9c17fc1b           lcall 0x1bfc, 0x179c  ; operator_new@s1:179C
2:1BCC  83c402               add sp, 2
2:1BCF  8946e2               mov word ptr [bp - 0x1e], ax
2:1BD2  8956e4               mov word ptr [bp - 0x1c], dx
2:1BD5  0bd0                 or dx, ax
2:1BD7  0f84bffa             je 0x169a
2:1BDB  c45e06               les bx, ptr [bp + 6]
2:1BDE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1BE3  06                   push es
2:1BE4  53                   push bx
2:1BE5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1BEA  66ff76e2             push dword ptr [bp - 0x1e]
2:1BEE  9a0471231c           lcall 0x1c23, 0x7104  ; sub_s4:7104
2:1BF3  e93f0e               jmp 0x2a35
loc_1BF6:
2:1BF6  68f200               push 0xf2
2:1BF9  9a9c172e1c           lcall 0x1c2e, 0x179c  ; operator_new@s1:179C
2:1BFE  83c402               add sp, 2
2:1C01  8946e2               mov word ptr [bp - 0x1e], ax
2:1C04  8956e4               mov word ptr [bp - 0x1c], dx
2:1C07  0bd0                 or dx, ax
2:1C09  0f848dfa             je 0x169a
2:1C0D  c45e06               les bx, ptr [bp + 6]
2:1C10  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1C15  06                   push es
2:1C16  53                   push bx
2:1C17  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1C1C  66ff76e2             push dword ptr [bp - 0x1e]
2:1C20  9a3a71551c           lcall 0x1c55, 0x713a  ; sub_s4:713A
2:1C25  e90d0e               jmp 0x2a35
loc_1C28:
2:1C28  68f200               push 0xf2
2:1C2B  9a9c17601c           lcall 0x1c60, 0x179c  ; operator_new@s1:179C
2:1C30  83c402               add sp, 2
2:1C33  8946e2               mov word ptr [bp - 0x1e], ax
2:1C36  8956e4               mov word ptr [bp - 0x1c], dx
2:1C39  0bd0                 or dx, ax
2:1C3B  0f845bfa             je 0x169a
2:1C3F  c45e06               les bx, ptr [bp + 6]
2:1C42  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1C47  06                   push es
2:1C48  53                   push bx
2:1C49  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1C4E  66ff76e2             push dword ptr [bp - 0x1e]
2:1C52  9a7071871c           lcall 0x1c87, 0x7170  ; sub_s4:7170
2:1C57  e9db0d               jmp 0x2a35
loc_1C5A:
2:1C5A  68f200               push 0xf2
2:1C5D  9a9c17921c           lcall 0x1c92, 0x179c  ; operator_new@s1:179C
2:1C62  83c402               add sp, 2
2:1C65  8946e2               mov word ptr [bp - 0x1e], ax
2:1C68  8956e4               mov word ptr [bp - 0x1c], dx
2:1C6B  0bd0                 or dx, ax
2:1C6D  0f8429fa             je 0x169a
2:1C71  c45e06               les bx, ptr [bp + 6]
2:1C74  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1C79  06                   push es
2:1C7A  53                   push bx
2:1C7B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1C80  66ff76e2             push dword ptr [bp - 0x1e]
2:1C84  9ac273b91c           lcall 0x1cb9, 0x73c2  ; sub_s4:73C2
2:1C89  e9a90d               jmp 0x2a35
loc_1C8C:
2:1C8C  68f200               push 0xf2
2:1C8F  9a9c17c41c           lcall 0x1cc4, 0x179c  ; operator_new@s1:179C
2:1C94  83c402               add sp, 2
2:1C97  8946e2               mov word ptr [bp - 0x1e], ax
2:1C9A  8956e4               mov word ptr [bp - 0x1c], dx
2:1C9D  0bd0                 or dx, ax
2:1C9F  0f84f7f9             je 0x169a
2:1CA3  c45e06               les bx, ptr [bp + 6]
2:1CA6  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1CAB  06                   push es
2:1CAC  53                   push bx
2:1CAD  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1CB2  66ff76e2             push dword ptr [bp - 0x1e]
2:1CB6  9a5e74eb1c           lcall 0x1ceb, 0x745e  ; sub_s4:745E
2:1CBB  e9770d               jmp 0x2a35
loc_1CBE:
2:1CBE  68f200               push 0xf2
2:1CC1  9a9c17f61c           lcall 0x1cf6, 0x179c  ; operator_new@s1:179C
2:1CC6  83c402               add sp, 2
2:1CC9  8946e2               mov word ptr [bp - 0x1e], ax
2:1CCC  8956e4               mov word ptr [bp - 0x1c], dx
2:1CCF  0bd0                 or dx, ax
2:1CD1  0f84c5f9             je 0x169a
2:1CD5  c45e06               les bx, ptr [bp + 6]
2:1CD8  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1CDD  06                   push es
2:1CDE  53                   push bx
2:1CDF  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1CE4  66ff76e2             push dword ptr [bp - 0x1e]
2:1CE8  9aa6711d1d           lcall 0x1d1d, 0x71a6  ; sub_s4:71A6
2:1CED  e9450d               jmp 0x2a35
loc_1CF0:
2:1CF0  68f200               push 0xf2
2:1CF3  9a9c17281d           lcall 0x1d28, 0x179c  ; operator_new@s1:179C
2:1CF8  83c402               add sp, 2
2:1CFB  8946e2               mov word ptr [bp - 0x1e], ax
2:1CFE  8956e4               mov word ptr [bp - 0x1c], dx
2:1D01  0bd0                 or dx, ax
2:1D03  0f8493f9             je 0x169a
2:1D07  c45e06               les bx, ptr [bp + 6]
2:1D0A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1D0F  06                   push es
2:1D10  53                   push bx
2:1D11  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1D16  66ff76e2             push dword ptr [bp - 0x1e]
2:1D1A  9adc716516           lcall 0x1665, 0x71dc  ; sub_s4:71DC
2:1D1F  e9130d               jmp 0x2a35
loc_1D22:
2:1D22  68f200               push 0xf2
2:1D25  9a9c174016           lcall 0x1640, 0x179c  ; operator_new@s1:179C
2:1D2A  83c402               add sp, 2
2:1D2D  8946e2               mov word ptr [bp - 0x1e], ax
2:1D30  8956e4               mov word ptr [bp - 0x1c], dx
2:1D33  0bd0                 or dx, ax
2:1D35  0f8461f9             je 0x169a
2:1D39  c45e06               les bx, ptr [bp + 6]
2:1D3C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1D41  06                   push es
2:1D42  53                   push bx
2:1D43  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1D48  66ff76e2             push dword ptr [bp - 0x1e]
2:1D4C  9a1272811d           lcall 0x1d81, 0x7212  ; sub_s4:7212
2:1D51  e9e10c               jmp 0x2a35
loc_1D54:
2:1D54  68f200               push 0xf2
2:1D57  9a9c178c1d           lcall 0x1d8c, 0x179c  ; operator_new@s1:179C
2:1D5C  83c402               add sp, 2
2:1D5F  8946e2               mov word ptr [bp - 0x1e], ax
2:1D62  8956e4               mov word ptr [bp - 0x1c], dx
2:1D65  0bd0                 or dx, ax
2:1D67  0f842ff9             je 0x169a
2:1D6B  c45e06               les bx, ptr [bp + 6]
2:1D6E  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1D73  06                   push es
2:1D74  53                   push bx
2:1D75  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1D7A  66ff76e2             push dword ptr [bp - 0x1e]
2:1D7E  9a987cb31d           lcall 0x1db3, 0x7c98  ; sub_s4:7C98
2:1D83  e9af0c               jmp 0x2a35
loc_1D86:
2:1D86  68f200               push 0xf2
2:1D89  9a9c17be1d           lcall 0x1dbe, 0x179c  ; operator_new@s1:179C
2:1D8E  83c402               add sp, 2
2:1D91  8946e2               mov word ptr [bp - 0x1e], ax
2:1D94  8956e4               mov word ptr [bp - 0x1c], dx
2:1D97  0bd0                 or dx, ax
2:1D99  0f84fdf8             je 0x169a
2:1D9D  c45e06               les bx, ptr [bp + 6]
2:1DA0  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1DA5  06                   push es
2:1DA6  53                   push bx
2:1DA7  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1DAC  66ff76e2             push dword ptr [bp - 0x1e]
2:1DB0  9a9474e51d           lcall 0x1de5, 0x7494  ; sub_s4:7494
2:1DB5  e97d0c               jmp 0x2a35
loc_1DB8:
2:1DB8  68f200               push 0xf2
2:1DBB  9a9c17f01d           lcall 0x1df0, 0x179c  ; operator_new@s1:179C
2:1DC0  83c402               add sp, 2
2:1DC3  8946e2               mov word ptr [bp - 0x1e], ax
2:1DC6  8956e4               mov word ptr [bp - 0x1c], dx
2:1DC9  0bd0                 or dx, ax
2:1DCB  0f84cbf8             je 0x169a
2:1DCF  c45e06               les bx, ptr [bp + 6]
2:1DD2  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1DD7  06                   push es
2:1DD8  53                   push bx
2:1DD9  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1DDE  66ff76e2             push dword ptr [bp - 0x1e]
2:1DE2  9aca74171e           lcall 0x1e17, 0x74ca  ; sub_s4:74CA
2:1DE7  e94b0c               jmp 0x2a35
loc_1DEA:
2:1DEA  68f200               push 0xf2
2:1DED  9a9c17221e           lcall 0x1e22, 0x179c  ; operator_new@s1:179C
2:1DF2  83c402               add sp, 2
2:1DF5  8946e2               mov word ptr [bp - 0x1e], ax
2:1DF8  8956e4               mov word ptr [bp - 0x1c], dx
2:1DFB  0bd0                 or dx, ax
2:1DFD  0f8499f8             je 0x169a
2:1E01  c45e06               les bx, ptr [bp + 6]
2:1E04  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1E09  06                   push es
2:1E0A  53                   push bx
2:1E0B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1E10  66ff76e2             push dword ptr [bp - 0x1e]
2:1E14  9a0075491e           lcall 0x1e49, 0x7500  ; sub_s4:7500
2:1E19  e9190c               jmp 0x2a35
loc_1E1C:
2:1E1C  68f200               push 0xf2
2:1E1F  9a9c17541e           lcall 0x1e54, 0x179c  ; operator_new@s1:179C
2:1E24  83c402               add sp, 2
2:1E27  8946e2               mov word ptr [bp - 0x1e], ax
2:1E2A  8956e4               mov word ptr [bp - 0x1c], dx
2:1E2D  0bd0                 or dx, ax
2:1E2F  0f8467f8             je 0x169a
2:1E33  c45e06               les bx, ptr [bp + 6]
2:1E36  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1E3B  06                   push es
2:1E3C  53                   push bx
2:1E3D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1E42  66ff76e2             push dword ptr [bp - 0x1e]
2:1E46  9af8737b1e           lcall 0x1e7b, 0x73f8  ; sub_s4:73F8
2:1E4B  e9e70b               jmp 0x2a35
loc_1E4E:
2:1E4E  68f200               push 0xf2
2:1E51  9a9c17861e           lcall 0x1e86, 0x179c  ; operator_new@s1:179C
2:1E56  83c402               add sp, 2
2:1E59  8946e2               mov word ptr [bp - 0x1e], ax
2:1E5C  8956e4               mov word ptr [bp - 0x1c], dx
2:1E5F  0bd0                 or dx, ax
2:1E61  0f8435f8             je 0x169a
2:1E65  c45e06               les bx, ptr [bp + 6]
2:1E68  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1E6D  06                   push es
2:1E6E  53                   push bx
2:1E6F  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1E74  66ff76e2             push dword ptr [bp - 0x1e]
2:1E78  9a3675ad1e           lcall 0x1ead, 0x7536  ; sub_s4:7536
2:1E7D  e9b50b               jmp 0x2a35
loc_1E80:
2:1E80  68f200               push 0xf2
2:1E83  9a9c17b81e           lcall 0x1eb8, 0x179c  ; operator_new@s1:179C
2:1E88  83c402               add sp, 2
2:1E8B  8946e2               mov word ptr [bp - 0x1e], ax
2:1E8E  8956e4               mov word ptr [bp - 0x1c], dx
2:1E91  0bd0                 or dx, ax
2:1E93  0f8403f8             je 0x169a
2:1E97  c45e06               les bx, ptr [bp + 6]
2:1E9A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1E9F  06                   push es
2:1EA0  53                   push bx
2:1EA1  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1EA6  66ff76e2             push dword ptr [bp - 0x1e]
2:1EAA  9a6c75df1e           lcall 0x1edf, 0x756c  ; sub_s4:756C
2:1EAF  e9830b               jmp 0x2a35
loc_1EB2:
2:1EB2  68f200               push 0xf2
2:1EB5  9a9c17ea1e           lcall 0x1eea, 0x179c  ; operator_new@s1:179C
2:1EBA  83c402               add sp, 2
2:1EBD  8946e2               mov word ptr [bp - 0x1e], ax
2:1EC0  8956e4               mov word ptr [bp - 0x1c], dx
2:1EC3  0bd0                 or dx, ax
2:1EC5  0f84d1f7             je 0x169a
2:1EC9  c45e06               les bx, ptr [bp + 6]
2:1ECC  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1ED1  06                   push es
2:1ED2  53                   push bx
2:1ED3  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1ED8  66ff76e2             push dword ptr [bp - 0x1e]
2:1EDC  9aa275111f           lcall 0x1f11, 0x75a2  ; sub_s4:75A2
2:1EE1  e9510b               jmp 0x2a35
loc_1EE4:
2:1EE4  68f200               push 0xf2
2:1EE7  9a9c171c1f           lcall 0x1f1c, 0x179c  ; operator_new@s1:179C
2:1EEC  83c402               add sp, 2
2:1EEF  8946e2               mov word ptr [bp - 0x1e], ax
2:1EF2  8956e4               mov word ptr [bp - 0x1c], dx
2:1EF5  0bd0                 or dx, ax
2:1EF7  0f849ff7             je 0x169a
2:1EFB  c45e06               les bx, ptr [bp + 6]
2:1EFE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1F03  06                   push es
2:1F04  53                   push bx
2:1F05  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1F0A  66ff76e2             push dword ptr [bp - 0x1e]
2:1F0E  9ad875431f           lcall 0x1f43, 0x75d8  ; sub_s4:75D8
2:1F13  e91f0b               jmp 0x2a35
loc_1F16:
2:1F16  68f200               push 0xf2
2:1F19  9a9c174e1f           lcall 0x1f4e, 0x179c  ; operator_new@s1:179C
2:1F1E  83c402               add sp, 2
2:1F21  8946e2               mov word ptr [bp - 0x1e], ax
2:1F24  8956e4               mov word ptr [bp - 0x1c], dx
2:1F27  0bd0                 or dx, ax
2:1F29  0f846df7             je 0x169a
2:1F2D  c45e06               les bx, ptr [bp + 6]
2:1F30  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1F35  06                   push es
2:1F36  53                   push bx
2:1F37  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1F3C  66ff76e2             push dword ptr [bp - 0x1e]
2:1F40  9a0e76751f           lcall 0x1f75, 0x760e  ; sub_s4:760E
2:1F45  e9ed0a               jmp 0x2a35
loc_1F48:
2:1F48  68f200               push 0xf2
2:1F4B  9a9c17801f           lcall 0x1f80, 0x179c  ; operator_new@s1:179C
2:1F50  83c402               add sp, 2
2:1F53  8946e2               mov word ptr [bp - 0x1e], ax
2:1F56  8956e4               mov word ptr [bp - 0x1c], dx
2:1F59  0bd0                 or dx, ax
2:1F5B  0f843bf7             je 0x169a
2:1F5F  c45e06               les bx, ptr [bp + 6]
2:1F62  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1F67  06                   push es
2:1F68  53                   push bx
2:1F69  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1F6E  66ff76e2             push dword ptr [bp - 0x1e]
2:1F72  9a4476a71f           lcall 0x1fa7, 0x7644  ; sub_s4:7644
2:1F77  e9bb0a               jmp 0x2a35
loc_1F7A:
2:1F7A  68f200               push 0xf2
2:1F7D  9a9c17b21f           lcall 0x1fb2, 0x179c  ; operator_new@s1:179C
2:1F82  83c402               add sp, 2
2:1F85  8946e2               mov word ptr [bp - 0x1e], ax
2:1F88  8956e4               mov word ptr [bp - 0x1c], dx
2:1F8B  0bd0                 or dx, ax
2:1F8D  0f8409f7             je 0x169a
2:1F91  c45e06               les bx, ptr [bp + 6]
2:1F94  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1F99  06                   push es
2:1F9A  53                   push bx
2:1F9B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1FA0  66ff76e2             push dword ptr [bp - 0x1e]
2:1FA4  9a7a76d91f           lcall 0x1fd9, 0x767a  ; sub_s4:767A
2:1FA9  e9890a               jmp 0x2a35
loc_1FAC:
2:1FAC  68f200               push 0xf2
2:1FAF  9a9c17e41f           lcall 0x1fe4, 0x179c  ; operator_new@s1:179C
2:1FB4  83c402               add sp, 2
2:1FB7  8946e2               mov word ptr [bp - 0x1e], ax
2:1FBA  8956e4               mov word ptr [bp - 0x1c], dx
2:1FBD  0bd0                 or dx, ax
2:1FBF  0f84d7f6             je 0x169a
2:1FC3  c45e06               les bx, ptr [bp + 6]
2:1FC6  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1FCB  06                   push es
2:1FCC  53                   push bx
2:1FCD  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:1FD2  66ff76e2             push dword ptr [bp - 0x1e]
2:1FD6  9ab0760b20           lcall 0x200b, 0x76b0  ; sub_s4:76B0
2:1FDB  e9570a               jmp 0x2a35
loc_1FDE:
2:1FDE  68f200               push 0xf2
2:1FE1  9a9c171620           lcall 0x2016, 0x179c  ; operator_new@s1:179C
2:1FE6  83c402               add sp, 2
2:1FE9  8946e2               mov word ptr [bp - 0x1e], ax
2:1FEC  8956e4               mov word ptr [bp - 0x1c], dx
2:1FEF  0bd0                 or dx, ax
2:1FF1  0f84a5f6             je 0x169a
2:1FF5  c45e06               les bx, ptr [bp + 6]
2:1FF8  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:1FFD  06                   push es
2:1FFE  53                   push bx
2:1FFF  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2004  66ff76e2             push dword ptr [bp - 0x1e]
2:2008  9ae6763d20           lcall 0x203d, 0x76e6  ; sub_s4:76E6
2:200D  e9250a               jmp 0x2a35
loc_2010:
2:2010  68f200               push 0xf2
2:2013  9a9c174820           lcall 0x2048, 0x179c  ; operator_new@s1:179C
2:2018  83c402               add sp, 2
2:201B  8946e2               mov word ptr [bp - 0x1e], ax
2:201E  8956e4               mov word ptr [bp - 0x1c], dx
2:2021  0bd0                 or dx, ax
2:2023  0f8473f6             je 0x169a
2:2027  c45e06               les bx, ptr [bp + 6]
2:202A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:202F  06                   push es
2:2030  53                   push bx
2:2031  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2036  66ff76e2             push dword ptr [bp - 0x1e]
2:203A  9a1c776f20           lcall 0x206f, 0x771c  ; sub_s4:771C
2:203F  e9f309               jmp 0x2a35
loc_2042:
2:2042  68f200               push 0xf2
2:2045  9a9c177a20           lcall 0x207a, 0x179c  ; operator_new@s1:179C
2:204A  83c402               add sp, 2
2:204D  8946e2               mov word ptr [bp - 0x1e], ax
2:2050  8956e4               mov word ptr [bp - 0x1c], dx
2:2053  0bd0                 or dx, ax
2:2055  0f8441f6             je 0x169a
2:2059  c45e06               les bx, ptr [bp + 6]
2:205C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2061  06                   push es
2:2062  53                   push bx
2:2063  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2068  66ff76e2             push dword ptr [bp - 0x1e]
2:206C  9a5277a120           lcall 0x20a1, 0x7752  ; sub_s4:7752
2:2071  e9c109               jmp 0x2a35
loc_2074:
2:2074  68f200               push 0xf2
2:2077  9a9c17ac20           lcall 0x20ac, 0x179c  ; operator_new@s1:179C
2:207C  83c402               add sp, 2
2:207F  8946e2               mov word ptr [bp - 0x1e], ax
2:2082  8956e4               mov word ptr [bp - 0x1c], dx
2:2085  0bd0                 or dx, ax
2:2087  0f840ff6             je 0x169a
2:208B  c45e06               les bx, ptr [bp + 6]
2:208E  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2093  06                   push es
2:2094  53                   push bx
2:2095  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:209A  66ff76e2             push dword ptr [bp - 0x1e]
2:209E  9a8877d320           lcall 0x20d3, 0x7788  ; sub_s4:7788
2:20A3  e98f09               jmp 0x2a35
loc_20A6:
2:20A6  68f200               push 0xf2
2:20A9  9a9c17de20           lcall 0x20de, 0x179c  ; operator_new@s1:179C
2:20AE  83c402               add sp, 2
2:20B1  8946e2               mov word ptr [bp - 0x1e], ax
2:20B4  8956e4               mov word ptr [bp - 0x1c], dx
2:20B7  0bd0                 or dx, ax
2:20B9  0f84ddf5             je 0x169a
2:20BD  c45e06               les bx, ptr [bp + 6]
2:20C0  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:20C5  06                   push es
2:20C6  53                   push bx
2:20C7  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:20CC  66ff76e2             push dword ptr [bp - 0x1e]
2:20D0  9abe779919           lcall 0x1999, 0x77be  ; sub_s4:77BE
2:20D5  e95d09               jmp 0x2a35
loc_20D8:
2:20D8  68f200               push 0xf2
2:20DB  9a9c17a419           lcall 0x19a4, 0x179c  ; operator_new@s1:179C
2:20E0  83c402               add sp, 2
2:20E3  8946e2               mov word ptr [bp - 0x1e], ax
2:20E6  8956e4               mov word ptr [bp - 0x1c], dx
2:20E9  0bd0                 or dx, ax
2:20EB  0f84abf5             je 0x169a
2:20EF  c45e06               les bx, ptr [bp + 6]
2:20F2  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:20F7  06                   push es
2:20F8  53                   push bx
2:20F9  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:20FE  66ff76e2             push dword ptr [bp - 0x1e]
2:2102  9af4773721           lcall 0x2137, 0x77f4  ; sub_s4:77F4
2:2107  e92b09               jmp 0x2a35
loc_210A:
2:210A  68f200               push 0xf2
2:210D  9a9c174221           lcall 0x2142, 0x179c  ; operator_new@s1:179C
2:2112  83c402               add sp, 2
2:2115  8946e2               mov word ptr [bp - 0x1e], ax
2:2118  8956e4               mov word ptr [bp - 0x1c], dx
2:211B  0bd0                 or dx, ax
2:211D  0f8479f5             je 0x169a
2:2121  c45e06               les bx, ptr [bp + 6]
2:2124  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2129  06                   push es
2:212A  53                   push bx
2:212B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2130  66ff76e2             push dword ptr [bp - 0x1e]
2:2134  9a2a786921           lcall 0x2169, 0x782a  ; sub_s4:782A
2:2139  e9f908               jmp 0x2a35
loc_213C:
2:213C  68f200               push 0xf2
2:213F  9a9c177421           lcall 0x2174, 0x179c  ; operator_new@s1:179C
2:2144  83c402               add sp, 2
2:2147  8946e2               mov word ptr [bp - 0x1e], ax
2:214A  8956e4               mov word ptr [bp - 0x1c], dx
2:214D  0bd0                 or dx, ax
2:214F  0f8447f5             je 0x169a
2:2153  c45e06               les bx, ptr [bp + 6]
2:2156  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:215B  06                   push es
2:215C  53                   push bx
2:215D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2162  66ff76e2             push dword ptr [bp - 0x1e]
2:2166  9a60789b21           lcall 0x219b, 0x7860  ; sub_s4:7860
2:216B  e9c708               jmp 0x2a35
loc_216E:
2:216E  68f200               push 0xf2
2:2171  9a9c17a621           lcall 0x21a6, 0x179c  ; operator_new@s1:179C
2:2176  83c402               add sp, 2
2:2179  8946e2               mov word ptr [bp - 0x1e], ax
2:217C  8956e4               mov word ptr [bp - 0x1c], dx
2:217F  0bd0                 or dx, ax
2:2181  0f8415f5             je 0x169a
2:2185  c45e06               les bx, ptr [bp + 6]
2:2188  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:218D  06                   push es
2:218E  53                   push bx
2:218F  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2194  66ff76e2             push dword ptr [bp - 0x1e]
2:2198  9a9678cd21           lcall 0x21cd, 0x7896  ; sub_s4:7896
2:219D  e99508               jmp 0x2a35
loc_21A0:
2:21A0  68f200               push 0xf2
2:21A3  9a9c17d821           lcall 0x21d8, 0x179c  ; operator_new@s1:179C
2:21A8  83c402               add sp, 2
2:21AB  8946e2               mov word ptr [bp - 0x1e], ax
2:21AE  8956e4               mov word ptr [bp - 0x1c], dx
2:21B1  0bd0                 or dx, ax
2:21B3  0f84e3f4             je 0x169a
2:21B7  c45e06               les bx, ptr [bp + 6]
2:21BA  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:21BF  06                   push es
2:21C0  53                   push bx
2:21C1  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:21C6  66ff76e2             push dword ptr [bp - 0x1e]
2:21CA  9acc78ff21           lcall 0x21ff, 0x78cc  ; sub_s4:78CC
2:21CF  e96308               jmp 0x2a35
loc_21D2:
2:21D2  68f200               push 0xf2
2:21D5  9a9c170a22           lcall 0x220a, 0x179c  ; operator_new@s1:179C
2:21DA  83c402               add sp, 2
2:21DD  8946e2               mov word ptr [bp - 0x1e], ax
2:21E0  8956e4               mov word ptr [bp - 0x1c], dx
2:21E3  0bd0                 or dx, ax
2:21E5  0f84b1f4             je 0x169a
2:21E9  c45e06               les bx, ptr [bp + 6]
2:21EC  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:21F1  06                   push es
2:21F2  53                   push bx
2:21F3  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:21F8  66ff76e2             push dword ptr [bp - 0x1e]
2:21FC  9a02793122           lcall 0x2231, 0x7902  ; sub_s4:7902
2:2201  e93108               jmp 0x2a35
loc_2204:
2:2204  68f200               push 0xf2
2:2207  9a9c173c22           lcall 0x223c, 0x179c  ; operator_new@s1:179C
2:220C  83c402               add sp, 2
2:220F  8946e2               mov word ptr [bp - 0x1e], ax
2:2212  8956e4               mov word ptr [bp - 0x1c], dx
2:2215  0bd0                 or dx, ax
2:2217  0f847ff4             je 0x169a
2:221B  c45e06               les bx, ptr [bp + 6]
2:221E  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2223  06                   push es
2:2224  53                   push bx
2:2225  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:222A  66ff76e2             push dword ptr [bp - 0x1e]
2:222E  9a38796322           lcall 0x2263, 0x7938  ; sub_s4:7938
2:2233  e9ff07               jmp 0x2a35
loc_2236:
2:2236  68f200               push 0xf2
2:2239  9a9c176e22           lcall 0x226e, 0x179c  ; operator_new@s1:179C
2:223E  83c402               add sp, 2
2:2241  8946e2               mov word ptr [bp - 0x1e], ax
2:2244  8956e4               mov word ptr [bp - 0x1c], dx
2:2247  0bd0                 or dx, ax
2:2249  0f844df4             je 0x169a
2:224D  c45e06               les bx, ptr [bp + 6]
2:2250  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2255  06                   push es
2:2256  53                   push bx
2:2257  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:225C  66ff76e2             push dword ptr [bp - 0x1e]
2:2260  9a6e799522           lcall 0x2295, 0x796e  ; sub_s4:796E
2:2265  e9cd07               jmp 0x2a35
loc_2268:
2:2268  68f200               push 0xf2
2:226B  9a9c17a022           lcall 0x22a0, 0x179c  ; operator_new@s1:179C
2:2270  83c402               add sp, 2
2:2273  8946e2               mov word ptr [bp - 0x1e], ax
2:2276  8956e4               mov word ptr [bp - 0x1c], dx
2:2279  0bd0                 or dx, ax
2:227B  0f841bf4             je 0x169a
2:227F  c45e06               les bx, ptr [bp + 6]
2:2282  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2287  06                   push es
2:2288  53                   push bx
2:2289  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:228E  66ff76e2             push dword ptr [bp - 0x1e]
2:2292  9aa479c722           lcall 0x22c7, 0x79a4  ; sub_s4:79A4
2:2297  e99b07               jmp 0x2a35
loc_229A:
2:229A  68f200               push 0xf2
2:229D  9a9c17d222           lcall 0x22d2, 0x179c  ; operator_new@s1:179C
2:22A2  83c402               add sp, 2
2:22A5  8946e2               mov word ptr [bp - 0x1e], ax
2:22A8  8956e4               mov word ptr [bp - 0x1c], dx
2:22AB  0bd0                 or dx, ax
2:22AD  0f84e9f3             je 0x169a
2:22B1  c45e06               les bx, ptr [bp + 6]
2:22B4  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:22B9  06                   push es
2:22BA  53                   push bx
2:22BB  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:22C0  66ff76e2             push dword ptr [bp - 0x1e]
2:22C4  9ada79f922           lcall 0x22f9, 0x79da  ; sub_s4:79DA
2:22C9  e96907               jmp 0x2a35
loc_22CC:
2:22CC  68f200               push 0xf2
2:22CF  9a9c170423           lcall 0x2304, 0x179c  ; operator_new@s1:179C
2:22D4  83c402               add sp, 2
2:22D7  8946e2               mov word ptr [bp - 0x1e], ax
2:22DA  8956e4               mov word ptr [bp - 0x1c], dx
2:22DD  0bd0                 or dx, ax
2:22DF  0f84b7f3             je 0x169a
2:22E3  c45e06               les bx, ptr [bp + 6]
2:22E6  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:22EB  06                   push es
2:22EC  53                   push bx
2:22ED  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:22F2  66ff76e2             push dword ptr [bp - 0x1e]
2:22F6  9a107a2b23           lcall 0x232b, 0x7a10  ; sub_s4:7A10
2:22FB  e93707               jmp 0x2a35
loc_22FE:
2:22FE  68f200               push 0xf2
2:2301  9a9c173623           lcall 0x2336, 0x179c  ; operator_new@s1:179C
2:2306  83c402               add sp, 2
2:2309  8946e2               mov word ptr [bp - 0x1e], ax
2:230C  8956e4               mov word ptr [bp - 0x1c], dx
2:230F  0bd0                 or dx, ax
2:2311  0f8485f3             je 0x169a
2:2315  c45e06               les bx, ptr [bp + 6]
2:2318  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:231D  06                   push es
2:231E  53                   push bx
2:231F  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2324  66ff76e2             push dword ptr [bp - 0x1e]
2:2328  9a467a5d23           lcall 0x235d, 0x7a46  ; sub_s4:7A46
2:232D  e90507               jmp 0x2a35
loc_2330:
2:2330  68f200               push 0xf2
2:2333  9a9c176823           lcall 0x2368, 0x179c  ; operator_new@s1:179C
2:2338  83c402               add sp, 2
2:233B  8946e2               mov word ptr [bp - 0x1e], ax
2:233E  8956e4               mov word ptr [bp - 0x1c], dx
2:2341  0bd0                 or dx, ax
2:2343  0f8453f3             je 0x169a
2:2347  c45e06               les bx, ptr [bp + 6]
2:234A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:234F  06                   push es
2:2350  53                   push bx
2:2351  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2356  66ff76e2             push dword ptr [bp - 0x1e]
2:235A  9a7c7a8f23           lcall 0x238f, 0x7a7c  ; sub_s4:7A7C
2:235F  e9d306               jmp 0x2a35
loc_2362:
2:2362  68f200               push 0xf2
2:2365  9a9c179a23           lcall 0x239a, 0x179c  ; operator_new@s1:179C
2:236A  83c402               add sp, 2
2:236D  8946e2               mov word ptr [bp - 0x1e], ax
2:2370  8956e4               mov word ptr [bp - 0x1c], dx
2:2373  0bd0                 or dx, ax
2:2375  0f8421f3             je 0x169a
2:2379  c45e06               les bx, ptr [bp + 6]
2:237C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2381  06                   push es
2:2382  53                   push bx
2:2383  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2388  66ff76e2             push dword ptr [bp - 0x1e]
2:238C  9ab27ac123           lcall 0x23c1, 0x7ab2  ; sub_s4:7AB2
2:2391  e9a106               jmp 0x2a35
loc_2394:
2:2394  68f200               push 0xf2
2:2397  9a9c17cc23           lcall 0x23cc, 0x179c  ; operator_new@s1:179C
2:239C  83c402               add sp, 2
2:239F  8946e2               mov word ptr [bp - 0x1e], ax
2:23A2  8956e4               mov word ptr [bp - 0x1c], dx
2:23A5  0bd0                 or dx, ax
2:23A7  0f84eff2             je 0x169a
2:23AB  c45e06               les bx, ptr [bp + 6]
2:23AE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:23B3  06                   push es
2:23B4  53                   push bx
2:23B5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:23BA  66ff76e2             push dword ptr [bp - 0x1e]
2:23BE  9ae87af323           lcall 0x23f3, 0x7ae8  ; sub_s4:7AE8
2:23C3  e96f06               jmp 0x2a35
loc_23C6:
2:23C6  68f200               push 0xf2
2:23C9  9a9c17fe23           lcall 0x23fe, 0x179c  ; operator_new@s1:179C
2:23CE  83c402               add sp, 2
2:23D1  8946e2               mov word ptr [bp - 0x1e], ax
2:23D4  8956e4               mov word ptr [bp - 0x1c], dx
2:23D7  0bd0                 or dx, ax
2:23D9  0f84bdf2             je 0x169a
2:23DD  c45e06               les bx, ptr [bp + 6]
2:23E0  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:23E5  06                   push es
2:23E6  53                   push bx
2:23E7  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:23EC  66ff76e2             push dword ptr [bp - 0x1e]
2:23F0  9a1e7b2524           lcall 0x2425, 0x7b1e  ; sub_s4:7B1E
2:23F5  e93d06               jmp 0x2a35
loc_23F8:
2:23F8  68f200               push 0xf2
2:23FB  9a9c173024           lcall 0x2430, 0x179c  ; operator_new@s1:179C
2:2400  83c402               add sp, 2
2:2403  8946e2               mov word ptr [bp - 0x1e], ax
2:2406  8956e4               mov word ptr [bp - 0x1c], dx
2:2409  0bd0                 or dx, ax
2:240B  0f848bf2             je 0x169a
2:240F  c45e06               les bx, ptr [bp + 6]
2:2412  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2417  06                   push es
2:2418  53                   push bx
2:2419  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:241E  66ff76e2             push dword ptr [bp - 0x1e]
2:2422  9a547b5724           lcall 0x2457, 0x7b54  ; sub_s4:7B54
2:2427  e90b06               jmp 0x2a35
loc_242A:
2:242A  68f200               push 0xf2
2:242D  9a9c176224           lcall 0x2462, 0x179c  ; operator_new@s1:179C
2:2432  83c402               add sp, 2
2:2435  8946e2               mov word ptr [bp - 0x1e], ax
2:2438  8956e4               mov word ptr [bp - 0x1c], dx
2:243B  0bd0                 or dx, ax
2:243D  0f8459f2             je 0x169a
2:2441  c45e06               les bx, ptr [bp + 6]
2:2444  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2449  06                   push es
2:244A  53                   push bx
2:244B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2450  66ff76e2             push dword ptr [bp - 0x1e]
2:2454  9a8a7b8924           lcall 0x2489, 0x7b8a  ; sub_s4:7B8A
2:2459  e9d905               jmp 0x2a35
loc_245C:
2:245C  68f200               push 0xf2
2:245F  9a9c175a1d           lcall 0x1d5a, 0x179c  ; operator_new@s1:179C
2:2464  83c402               add sp, 2
2:2467  8946e2               mov word ptr [bp - 0x1e], ax
2:246A  8956e4               mov word ptr [bp - 0x1c], dx
2:246D  0bd0                 or dx, ax
2:246F  0f8427f2             je 0x169a
2:2473  c45e06               les bx, ptr [bp + 6]
2:2476  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:247B  06                   push es
2:247C  53                   push bx
2:247D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2482  66ff76e2             push dword ptr [bp - 0x1e]
2:2486  9ac07b4f1d           lcall 0x1d4f, 0x7bc0  ; sub_s4:7BC0
2:248B  e9a705               jmp 0x2a35
loc_248E:
2:248E  68f200               push 0xf2
2:2491  9a9c17c624           lcall 0x24c6, 0x179c  ; operator_new@s1:179C
2:2496  83c402               add sp, 2
2:2499  8946e2               mov word ptr [bp - 0x1e], ax
2:249C  8956e4               mov word ptr [bp - 0x1c], dx
2:249F  0bd0                 or dx, ax
2:24A1  0f84f5f1             je 0x169a
2:24A5  c45e06               les bx, ptr [bp + 6]
2:24A8  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:24AD  06                   push es
2:24AE  53                   push bx
2:24AF  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:24B4  66ff76e2             push dword ptr [bp - 0x1e]
2:24B8  9af67bed24           lcall 0x24ed, 0x7bf6  ; sub_s4:7BF6
2:24BD  e97505               jmp 0x2a35
loc_24C0:
2:24C0  68f200               push 0xf2
2:24C3  9a9c17f824           lcall 0x24f8, 0x179c  ; operator_new@s1:179C
2:24C8  83c402               add sp, 2
2:24CB  8946e2               mov word ptr [bp - 0x1e], ax
2:24CE  8956e4               mov word ptr [bp - 0x1c], dx
2:24D1  0bd0                 or dx, ax
2:24D3  0f84c3f1             je 0x169a
2:24D7  c45e06               les bx, ptr [bp + 6]
2:24DA  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:24DF  06                   push es
2:24E0  53                   push bx
2:24E1  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:24E6  66ff76e2             push dword ptr [bp - 0x1e]
2:24EA  9a2c7c1f25           lcall 0x251f, 0x7c2c  ; sub_s4:7C2C
2:24EF  e94305               jmp 0x2a35
loc_24F2:
2:24F2  68f200               push 0xf2
2:24F5  9a9c172a25           lcall 0x252a, 0x179c  ; operator_new@s1:179C
2:24FA  83c402               add sp, 2
2:24FD  8946e2               mov word ptr [bp - 0x1e], ax
2:2500  8956e4               mov word ptr [bp - 0x1c], dx
2:2503  0bd0                 or dx, ax
2:2505  0f8491f1             je 0x169a
2:2509  c45e06               les bx, ptr [bp + 6]
2:250C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2511  06                   push es
2:2512  53                   push bx
2:2513  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2518  66ff76e2             push dword ptr [bp - 0x1e]
2:251C  9a627c5125           lcall 0x2551, 0x7c62  ; sub_s4:7C62
2:2521  e91105               jmp 0x2a35
loc_2524:
2:2524  68f200               push 0xf2
2:2527  9a9c175c25           lcall 0x255c, 0x179c  ; operator_new@s1:179C
2:252C  83c402               add sp, 2
2:252F  8946e2               mov word ptr [bp - 0x1e], ax
2:2532  8956e4               mov word ptr [bp - 0x1c], dx
2:2535  0bd0                 or dx, ax
2:2537  0f845ff1             je 0x169a
2:253B  c45e06               les bx, ptr [bp + 6]
2:253E  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2543  06                   push es
2:2544  53                   push bx
2:2545  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:254A  66ff76e2             push dword ptr [bp - 0x1e]
2:254E  9ace7c8325           lcall 0x2583, 0x7cce  ; sub_s4:7CCE
2:2553  e9df04               jmp 0x2a35
loc_2556:
2:2556  68f200               push 0xf2
2:2559  9a9c178e25           lcall 0x258e, 0x179c  ; operator_new@s1:179C
2:255E  83c402               add sp, 2
2:2561  8946e2               mov word ptr [bp - 0x1e], ax
2:2564  8956e4               mov word ptr [bp - 0x1c], dx
2:2567  0bd0                 or dx, ax
2:2569  0f842df1             je 0x169a
2:256D  c45e06               les bx, ptr [bp + 6]
2:2570  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2575  06                   push es
2:2576  53                   push bx
2:2577  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:257C  66ff76e2             push dword ptr [bp - 0x1e]
2:2580  9a047db525           lcall 0x25b5, 0x7d04  ; sub_s4:7D04
2:2585  e9ad04               jmp 0x2a35
loc_2588:
2:2588  68f200               push 0xf2
2:258B  9a9c17c025           lcall 0x25c0, 0x179c  ; operator_new@s1:179C
2:2590  83c402               add sp, 2
2:2593  8946e2               mov word ptr [bp - 0x1e], ax
2:2596  8956e4               mov word ptr [bp - 0x1c], dx
2:2599  0bd0                 or dx, ax
2:259B  0f84fbf0             je 0x169a
2:259F  c45e06               les bx, ptr [bp + 6]
2:25A2  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:25A7  06                   push es
2:25A8  53                   push bx
2:25A9  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:25AE  66ff76e2             push dword ptr [bp - 0x1e]
2:25B2  9a3a7de725           lcall 0x25e7, 0x7d3a  ; sub_s4:7D3A
2:25B7  e97b04               jmp 0x2a35
loc_25BA:
2:25BA  68f200               push 0xf2
2:25BD  9a9c17f225           lcall 0x25f2, 0x179c  ; operator_new@s1:179C
2:25C2  83c402               add sp, 2
2:25C5  8946e2               mov word ptr [bp - 0x1e], ax
2:25C8  8956e4               mov word ptr [bp - 0x1c], dx
2:25CB  0bd0                 or dx, ax
2:25CD  0f84c9f0             je 0x169a
2:25D1  c45e06               les bx, ptr [bp + 6]
2:25D4  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:25D9  06                   push es
2:25DA  53                   push bx
2:25DB  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:25E0  66ff76e2             push dword ptr [bp - 0x1e]
2:25E4  9a707d1926           lcall 0x2619, 0x7d70  ; sub_s4:7D70
2:25E9  e94904               jmp 0x2a35
loc_25EC:
2:25EC  68f200               push 0xf2
2:25EF  9a9c172426           lcall 0x2624, 0x179c  ; operator_new@s1:179C
2:25F4  83c402               add sp, 2
2:25F7  8946e2               mov word ptr [bp - 0x1e], ax
2:25FA  8956e4               mov word ptr [bp - 0x1c], dx
2:25FD  0bd0                 or dx, ax
2:25FF  0f8497f0             je 0x169a
2:2603  c45e06               les bx, ptr [bp + 6]
2:2606  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:260B  06                   push es
2:260C  53                   push bx
2:260D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2612  66ff76e2             push dword ptr [bp - 0x1e]
2:2616  9a48724b26           lcall 0x264b, 0x7248  ; sub_s4:7248
2:261B  e91704               jmp 0x2a35
loc_261E:
2:261E  68f200               push 0xf2
2:2621  9a9c175626           lcall 0x2656, 0x179c  ; operator_new@s1:179C
2:2626  83c402               add sp, 2
2:2629  8946e2               mov word ptr [bp - 0x1e], ax
2:262C  8956e4               mov word ptr [bp - 0x1c], dx
2:262F  0bd0                 or dx, ax
2:2631  0f8465f0             je 0x169a
2:2635  c45e06               les bx, ptr [bp + 6]
2:2638  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:263D  06                   push es
2:263E  53                   push bx
2:263F  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2644  66ff76e2             push dword ptr [bp - 0x1e]
2:2648  9a7e727d26           lcall 0x267d, 0x727e  ; sub_s4:727E
2:264D  e9e503               jmp 0x2a35
loc_2650:
2:2650  68f200               push 0xf2
2:2653  9a9c178826           lcall 0x2688, 0x179c  ; operator_new@s1:179C
2:2658  83c402               add sp, 2
2:265B  8946e2               mov word ptr [bp - 0x1e], ax
2:265E  8956e4               mov word ptr [bp - 0x1c], dx
2:2661  0bd0                 or dx, ax
2:2663  0f8433f0             je 0x169a
2:2667  c45e06               les bx, ptr [bp + 6]
2:266A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:266F  06                   push es
2:2670  53                   push bx
2:2671  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2676  66ff76e2             push dword ptr [bp - 0x1e]
2:267A  9ab472af26           lcall 0x26af, 0x72b4  ; sub_s4:72B4
2:267F  e9b303               jmp 0x2a35
loc_2682:
2:2682  68f200               push 0xf2
2:2685  9a9c17ba26           lcall 0x26ba, 0x179c  ; operator_new@s1:179C
2:268A  83c402               add sp, 2
2:268D  8946e2               mov word ptr [bp - 0x1e], ax
2:2690  8956e4               mov word ptr [bp - 0x1c], dx
2:2693  0bd0                 or dx, ax
2:2695  0f8401f0             je 0x169a
2:2699  c45e06               les bx, ptr [bp + 6]
2:269C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:26A1  06                   push es
2:26A2  53                   push bx
2:26A3  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:26A8  66ff76e2             push dword ptr [bp - 0x1e]
2:26AC  9aea72e126           lcall 0x26e1, 0x72ea  ; sub_s4:72EA
2:26B1  e98103               jmp 0x2a35
loc_26B4:
2:26B4  68f200               push 0xf2
2:26B7  9a9c17ec26           lcall 0x26ec, 0x179c  ; operator_new@s1:179C
2:26BC  83c402               add sp, 2
2:26BF  8946e2               mov word ptr [bp - 0x1e], ax
2:26C2  8956e4               mov word ptr [bp - 0x1c], dx
2:26C5  0bd0                 or dx, ax
2:26C7  0f84cfef             je 0x169a
2:26CB  c45e06               les bx, ptr [bp + 6]
2:26CE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:26D3  06                   push es
2:26D4  53                   push bx
2:26D5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:26DA  66ff76e2             push dword ptr [bp - 0x1e]
2:26DE  9a20731327           lcall 0x2713, 0x7320  ; sub_s4:7320
2:26E3  e94f03               jmp 0x2a35
loc_26E6:
2:26E6  68f200               push 0xf2
2:26E9  9a9c171e27           lcall 0x271e, 0x179c  ; operator_new@s1:179C
2:26EE  83c402               add sp, 2
2:26F1  8946e2               mov word ptr [bp - 0x1e], ax
2:26F4  8956e4               mov word ptr [bp - 0x1c], dx
2:26F7  0bd0                 or dx, ax
2:26F9  0f849def             je 0x169a
2:26FD  c45e06               les bx, ptr [bp + 6]
2:2700  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2705  06                   push es
2:2706  53                   push bx
2:2707  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:270C  66ff76e2             push dword ptr [bp - 0x1e]
2:2710  9a56734527           lcall 0x2745, 0x7356  ; sub_s4:7356
2:2715  e91d03               jmp 0x2a35
loc_2718:
2:2718  68f200               push 0xf2
2:271B  9a9c175027           lcall 0x2750, 0x179c  ; operator_new@s1:179C
2:2720  83c402               add sp, 2
2:2723  8946e2               mov word ptr [bp - 0x1e], ax
2:2726  8956e4               mov word ptr [bp - 0x1c], dx
2:2729  0bd0                 or dx, ax
2:272B  0f846bef             je 0x169a
2:272F  c45e06               les bx, ptr [bp + 6]
2:2732  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2737  06                   push es
2:2738  53                   push bx
2:2739  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:273E  66ff76e2             push dword ptr [bp - 0x1e]
2:2742  9a8c737727           lcall 0x2777, 0x738c  ; sub_s4:738C
2:2747  e9eb02               jmp 0x2a35
loc_274A:
2:274A  681401               push 0x114
2:274D  9a9c178227           lcall 0x2782, 0x179c  ; operator_new@s1:179C
2:2752  83c402               add sp, 2
2:2755  8946e2               mov word ptr [bp - 0x1e], ax
2:2758  8956e4               mov word ptr [bp - 0x1c], dx
2:275B  0bd0                 or dx, ax
2:275D  0f8439ef             je 0x169a
2:2761  c45e06               les bx, ptr [bp + 6]
2:2764  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2769  06                   push es
2:276A  53                   push bx
2:276B  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2770  66ff76e2             push dword ptr [bp - 0x1e]
2:2774  9a58c9a927           lcall 0x27a9, 0xc958  ; sub_s4:C958
2:2779  e9b902               jmp 0x2a35
loc_277C:
2:277C  681401               push 0x114
2:277F  9a9c17b427           lcall 0x27b4, 0x179c  ; operator_new@s1:179C
2:2784  83c402               add sp, 2
2:2787  8946e2               mov word ptr [bp - 0x1e], ax
2:278A  8956e4               mov word ptr [bp - 0x1c], dx
2:278D  0bd0                 or dx, ax
2:278F  0f8407ef             je 0x169a
2:2793  c45e06               les bx, ptr [bp + 6]
2:2796  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:279B  06                   push es
2:279C  53                   push bx
2:279D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:27A2  66ff76e2             push dword ptr [bp - 0x1e]
2:27A6  9aa6c9db27           lcall 0x27db, 0xc9a6  ; sub_s4:C9A6
2:27AB  e98702               jmp 0x2a35
loc_27AE:
2:27AE  681401               push 0x114
2:27B1  9a9c17e627           lcall 0x27e6, 0x179c  ; operator_new@s1:179C
2:27B6  83c402               add sp, 2
2:27B9  8946e2               mov word ptr [bp - 0x1e], ax
2:27BC  8956e4               mov word ptr [bp - 0x1c], dx
2:27BF  0bd0                 or dx, ax
2:27C1  0f84d5ee             je 0x169a
2:27C5  c45e06               les bx, ptr [bp + 6]
2:27C8  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:27CD  06                   push es
2:27CE  53                   push bx
2:27CF  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:27D4  66ff76e2             push dword ptr [bp - 0x1e]
2:27D8  9af4c90d28           lcall 0x280d, 0xc9f4  ; sub_s4:C9F4
2:27DD  e95502               jmp 0x2a35
loc_27E0:
2:27E0  681401               push 0x114
2:27E3  9a9c171828           lcall 0x2818, 0x179c  ; operator_new@s1:179C
2:27E8  83c402               add sp, 2
2:27EB  8946e2               mov word ptr [bp - 0x1e], ax
2:27EE  8956e4               mov word ptr [bp - 0x1c], dx
2:27F1  0bd0                 or dx, ax
2:27F3  0f84a3ee             je 0x169a
2:27F7  c45e06               les bx, ptr [bp + 6]
2:27FA  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:27FF  06                   push es
2:2800  53                   push bx
2:2801  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2806  66ff76e2             push dword ptr [bp - 0x1e]
2:280A  9a48ca0521           lcall 0x2105, 0xca48  ; sub_s4:CA48
2:280F  e92302               jmp 0x2a35
loc_2812:
2:2812  681401               push 0x114
2:2815  9a9c171021           lcall 0x2110, 0x179c  ; operator_new@s1:179C
2:281A  83c402               add sp, 2
2:281D  8946e2               mov word ptr [bp - 0x1e], ax
2:2820  8956e4               mov word ptr [bp - 0x1c], dx
2:2823  0bd0                 or dx, ax
2:2825  0f8471ee             je 0x169a
2:2829  c45e06               les bx, ptr [bp + 6]
2:282C  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2831  06                   push es
2:2832  53                   push bx
2:2833  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2838  66ff76e2             push dword ptr [bp - 0x1e]
2:283C  9a96ca7128           lcall 0x2871, 0xca96  ; sub_s4:CA96
2:2841  e9f101               jmp 0x2a35
loc_2844:
2:2844  681401               push 0x114
2:2847  9a9c177c28           lcall 0x287c, 0x179c  ; operator_new@s1:179C
2:284C  83c402               add sp, 2
2:284F  8946e2               mov word ptr [bp - 0x1e], ax
2:2852  8956e4               mov word ptr [bp - 0x1c], dx
2:2855  0bd0                 or dx, ax
2:2857  0f843fee             je 0x169a
2:285B  c45e06               les bx, ptr [bp + 6]
2:285E  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2863  06                   push es
2:2864  53                   push bx
2:2865  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:286A  66ff76e2             push dword ptr [bp - 0x1e]
2:286E  9aeacaa328           lcall 0x28a3, 0xcaea  ; sub_s4:CAEA
2:2873  e9bf01               jmp 0x2a35
loc_2876:
2:2876  681401               push 0x114
2:2879  9a9c17ae28           lcall 0x28ae, 0x179c  ; operator_new@s1:179C
2:287E  83c402               add sp, 2
2:2881  8946e2               mov word ptr [bp - 0x1e], ax
2:2884  8956e4               mov word ptr [bp - 0x1c], dx
2:2887  0bd0                 or dx, ax
2:2889  0f840dee             je 0x169a
2:288D  c45e06               les bx, ptr [bp + 6]
2:2890  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2895  06                   push es
2:2896  53                   push bx
2:2897  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:289C  66ff76e2             push dword ptr [bp - 0x1e]
2:28A0  9a38cbd528           lcall 0x28d5, 0xcb38  ; sub_s4:CB38
2:28A5  e98d01               jmp 0x2a35
loc_28A8:
2:28A8  681401               push 0x114
2:28AB  9a9c17e028           lcall 0x28e0, 0x179c  ; operator_new@s1:179C
2:28B0  83c402               add sp, 2
2:28B3  8946e2               mov word ptr [bp - 0x1e], ax
2:28B6  8956e4               mov word ptr [bp - 0x1c], dx
2:28B9  0bd0                 or dx, ax
2:28BB  0f84dbed             je 0x169a
2:28BF  c45e06               les bx, ptr [bp + 6]
2:28C2  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:28C7  06                   push es
2:28C8  53                   push bx
2:28C9  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:28CE  66ff76e2             push dword ptr [bp - 0x1e]
2:28D2  9a86cb0729           lcall 0x2907, 0xcb86  ; sub_s4:CB86
2:28D7  e95b01               jmp 0x2a35
loc_28DA:
2:28DA  681401               push 0x114
2:28DD  9a9c171229           lcall 0x2912, 0x179c  ; operator_new@s1:179C
2:28E2  83c402               add sp, 2
2:28E5  8946e2               mov word ptr [bp - 0x1e], ax
2:28E8  8956e4               mov word ptr [bp - 0x1c], dx
2:28EB  0bd0                 or dx, ax
2:28ED  0f84a9ed             je 0x169a
2:28F1  c45e06               les bx, ptr [bp + 6]
2:28F4  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:28F9  06                   push es
2:28FA  53                   push bx
2:28FB  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2900  66ff76e2             push dword ptr [bp - 0x1e]
2:2904  9adacb3929           lcall 0x2939, 0xcbda  ; sub_s4:CBDA
2:2909  e92901               jmp 0x2a35
loc_290C:
2:290C  681401               push 0x114
2:290F  9a9c174429           lcall 0x2944, 0x179c  ; operator_new@s1:179C
2:2914  83c402               add sp, 2
2:2917  8946e2               mov word ptr [bp - 0x1e], ax
2:291A  8956e4               mov word ptr [bp - 0x1c], dx
2:291D  0bd0                 or dx, ax
2:291F  0f8477ed             je 0x169a
2:2923  c45e06               les bx, ptr [bp + 6]
2:2926  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:292B  06                   push es
2:292C  53                   push bx
2:292D  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2932  66ff76e2             push dword ptr [bp - 0x1e]
2:2936  9a28cc6b29           lcall 0x296b, 0xcc28  ; sub_s4:CC28
2:293B  e9f700               jmp 0x2a35
loc_293E:
2:293E  681401               push 0x114
2:2941  9a9c177629           lcall 0x2976, 0x179c  ; operator_new@s1:179C
2:2946  83c402               add sp, 2
2:2949  8946e2               mov word ptr [bp - 0x1e], ax
2:294C  8956e4               mov word ptr [bp - 0x1c], dx
2:294F  0bd0                 or dx, ax
2:2951  0f8445ed             je 0x169a
2:2955  c45e06               les bx, ptr [bp + 6]
2:2958  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:295D  06                   push es
2:295E  53                   push bx
2:295F  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2964  66ff76e2             push dword ptr [bp - 0x1e]
2:2968  9a76cc9d29           lcall 0x299d, 0xcc76  ; sub_s4:CC76
2:296D  e9c500               jmp 0x2a35
loc_2970:
2:2970  681401               push 0x114
2:2973  9a9c17a829           lcall 0x29a8, 0x179c  ; operator_new@s1:179C
2:2978  83c402               add sp, 2
2:297B  8946e2               mov word ptr [bp - 0x1e], ax
2:297E  8956e4               mov word ptr [bp - 0x1c], dx
2:2981  0bd0                 or dx, ax
2:2983  0f8413ed             je 0x169a
2:2987  c45e06               les bx, ptr [bp + 6]
2:298A  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:298F  06                   push es
2:2990  53                   push bx
2:2991  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2996  66ff76e2             push dword ptr [bp - 0x1e]
2:299A  9ac4cccf29           lcall 0x29cf, 0xccc4  ; sub_s4:CCC4
2:299F  e99300               jmp 0x2a35
loc_29A2:
2:29A2  681401               push 0x114
2:29A5  9a9c17da29           lcall 0x29da, 0x179c  ; operator_new@s1:179C
2:29AA  83c402               add sp, 2
2:29AD  8946e2               mov word ptr [bp - 0x1e], ax
2:29B0  8956e4               mov word ptr [bp - 0x1c], dx
2:29B3  0bd0                 or dx, ax
2:29B5  0f84e1ec             je 0x169a
2:29B9  c45e06               les bx, ptr [bp + 6]
2:29BC  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:29C1  06                   push es
2:29C2  53                   push bx
2:29C3  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:29C8  66ff76e2             push dword ptr [bp - 0x1e]
2:29CC  9a12cd012a           lcall 0x2a01, 0xcd12  ; sub_s4:CD12
2:29D1  eb62                 jmp 0x2a35
2:29D3  db 90
loc_29D4:
2:29D4  681401               push 0x114
2:29D7  9a9c170c2a           lcall 0x2a0c, 0x179c  ; operator_new@s1:179C
2:29DC  83c402               add sp, 2
2:29DF  8946e2               mov word ptr [bp - 0x1e], ax
2:29E2  8956e4               mov word ptr [bp - 0x1c], dx
2:29E5  0bd0                 or dx, ax
2:29E7  0f84afec             je 0x169a
2:29EB  c45e06               les bx, ptr [bp + 6]
2:29EE  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:29F3  06                   push es
2:29F4  53                   push bx
2:29F5  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:29FA  66ff76e2             push dword ptr [bp - 0x1e]
2:29FE  9a60cd332a           lcall 0x2a33, 0xcd60  ; sub_s4:CD60
2:2A03  eb30                 jmp 0x2a35
2:2A05  db 90
loc_2A06:
2:2A06  681401               push 0x114
2:2A09  9a9c17522a           lcall 0x2a52, 0x179c  ; operator_new@s1:179C
2:2A0E  83c402               add sp, 2
2:2A11  8946e2               mov word ptr [bp - 0x1e], ax
2:2A14  8956e4               mov word ptr [bp - 0x1c], dx
2:2A17  0bd0                 or dx, ax
2:2A19  0f847dec             je 0x169a
2:2A1D  c45e06               les bx, ptr [bp + 6]
2:2A20  26ff87cc00           inc word ptr es:[bx + 0xcc]
2:2A25  06                   push es
2:2A26  53                   push bx
2:2A27  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:2A2C  66ff76e2             push dword ptr [bp - 0x1e]
2:2A30  9a74cfbb24           lcall 0x24bb, 0xcf74  ; sub_s4:CF74
loc_2A35:
2:2A35  8946fc               mov word ptr [bp - 4], ax
2:2A38  8956fe               mov word ptr [bp - 2], dx
2:2A3B  e9fc00               jmp 0x2b3a
loc_2A3E:
2:2A3E  ff760a               push word ptr [bp + 0xa]
2:2A41  1e                   push ds
2:2A42  68a301               push 0x1a3  ; 'OpWnd::getKid->Unknown target mode->%d'
2:2A45  90                   nop
2:2A46  0e                   push cs
2:2A47  e8fe35               call 0x6048  ; sub_s2:6048
2:2A4A  83c406               add sp, 6
2:2A4D  6a01                 push 1
2:2A4F  9acd249424           lcall 0x2494, 0x24cd  ; sub_s1:24CD
2:2A54  83c402               add sp, 2
2:2A57  e9e000               jmp 0x2b3a
loc_2A5A:
2:2A5A  48                   dec ax
2:2A5B  3d6800               cmp ax, 0x68
2:2A5E  77de                 ja 0x2a3e
2:2A60  03c0                 add ax, ax
2:2A62  93                   xchg bx, ax
2:2A63  2effa7682a           jmp word ptr cs:[bx + 0x2a68]
switch_table_2A68:
    dw loc_17CE
    dw loc_2A3E
    dw loc_176A
    dw loc_1706
    dw loc_1738
    dw loc_179C
    dw loc_16D6
    dw loc_16A6
    dw loc_163A
    dw loc_166A
    dw loc_1800
    dw loc_1840
    dw loc_1872
    dw loc_18A4
    dw loc_18D6
    dw loc_1908
    dw loc_193A
    dw loc_196C
    dw loc_199E
    dw loc_19D0
    dw loc_1A02
    dw loc_1A34
    dw loc_1A66
    dw loc_1A98
    dw loc_1ACA
    dw loc_1AFC
    dw loc_1B2E
    dw loc_1B60
    dw loc_1B92
    dw loc_1BC4
    dw loc_1BF6
    dw loc_2A3E
    dw loc_1C28
    dw loc_1C8C
    dw loc_1CBE
    dw loc_1CF0
    dw loc_1D22
    dw loc_274A
    dw loc_277C
    dw loc_27AE
    dw loc_27E0
    dw loc_2812
    dw loc_2844
    dw loc_2876
    dw loc_28A8
    dw loc_28DA
    dw loc_290C
    dw loc_293E
    dw loc_2970
    dw loc_29A2
    dw loc_29D4
    dw loc_2A06
    dw loc_1C5A
    dw loc_1D86
    dw loc_1DB8
    dw loc_1DEA
    dw loc_1E1C
    dw loc_1E4E
    dw loc_1E80
    dw loc_1EB2
    dw loc_1EE4
    dw loc_1F16
    dw loc_1F48
    dw loc_1F7A
    dw loc_1FAC
    dw loc_1FDE
    dw loc_2010
    dw loc_2042
    dw loc_2074
    dw loc_20A6
    dw loc_20D8
    dw loc_210A
    dw loc_213C
    dw loc_216E
    dw loc_21A0
    dw loc_21D2
    dw loc_2204
    dw loc_2236
    dw loc_2268
    dw loc_229A
    dw loc_22CC
    dw loc_22FE
    dw loc_2330
    dw loc_2A3E
    dw loc_2362
    dw loc_2394
    dw loc_23C6
    dw loc_23F8
    dw loc_242A
    dw loc_245C
    dw loc_248E
    dw loc_24C0
    dw loc_24F2
    dw loc_1D54
    dw loc_2524
    dw loc_2556
    dw loc_2588
    dw loc_25BA
    dw loc_25EC
    dw loc_261E
    dw loc_2650
    dw loc_2682
    dw loc_26B4
    dw loc_26E6
    dw loc_2718
loc_2B3A:
2:2B3A  66ff76fc             push dword ptr [bp - 4]
2:2B3E  6a00                 push 0
2:2B40  66ff7606             push dword ptr [bp + 6]
2:2B44  90                   nop
2:2B45  0e                   push cs
2:2B46  e82f3e               call 0x6978  ; sub_s2:6978
loc_2B49:
2:2B49  8b46fc               mov ax, word ptr [bp - 4]
2:2B4C  8b56fe               mov dx, word ptr [bp - 2]
2:2B4F  c9                   leave
2:2B50  ca0600               retf 6
2:2B53  db 00

; ---------------- sub_s2:2B54 FAR size=250 callers=1
;   apis: USER.MessageBox, USER.PostMessage
2:2B54  c8a80000             enter 0xa8, 0
2:2B58  c746fe0000           mov word ptr [bp - 2], 0
2:2B5D  66833e304200         cmp dword ptr [0x4230], 0
2:2B63  7551                 jne 0x2bb6
2:2B65  68f205               push 0x5f2
2:2B68  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:2B6D  9a7e848c2b           lcall 0x2b8c, 0x847e  ; LoadStringRes@s3:847E
2:2B72  52                   push dx
2:2B73  50                   push ax
2:2B74  8d46ac               lea ax, [bp - 0x54]
2:2B77  16                   push ss
2:2B78  50                   push ax
2:2B79  9a3e3d992b           lcall 0x2b99, 0x3d3e  ; _fstrcpy@s1:3D3E
2:2B7E  83c408               add sp, 8
2:2B81  687b05               push 0x57b
2:2B84  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:2B89  9a7e845814           lcall 0x1458, 0x847e  ; LoadStringRes@s3:847E
2:2B8E  52                   push dx
2:2B8F  50                   push ax
2:2B90  8d865cff             lea ax, [bp - 0xa4]
2:2B94  16                   push ss
2:2B95  50                   push ax
2:2B96  9a3e3dbc2b           lcall 0x2bbc, 0x3d3e  ; _fstrcpy@s1:3D3E
2:2B9B  83c408               add sp, 8
2:2B9E  ff369603             push word ptr [0x396]
2:2BA2  8d46ac               lea ax, [bp - 0x54]
2:2BA5  16                   push ss
2:2BA6  50                   push ax
2:2BA7  8d865cff             lea ax, [bp - 0xa4]
2:2BAB  16                   push ss
2:2BAC  50                   push ax
2:2BAD  6a21                 push 0x21
2:2BAF  9a9c140000           lcall 0, 0x149c  ; USER.MessageBox
2:2BB4  eb4e                 jmp 0x2c04
loc_2BB6:
2:2BB6  68b400               push 0xb4
2:2BB9  9a9c174a28           lcall 0x284a, 0x179c  ; operator_new@s1:179C
2:2BBE  83c402               add sp, 2
2:2BC1  898658ff             mov word ptr [bp - 0xa8], ax
2:2BC5  89965aff             mov word ptr [bp - 0xa6], dx
2:2BC9  0bd0                 or dx, ax
2:2BCB  741f                 je 0x2bec
2:2BCD  66687b05f205         push 0x5f2057b
2:2BD3  666821000200         push 0x20021
2:2BD9  ff369603             push word ptr [0x396]
2:2BDD  ffb65aff             push word ptr [bp - 0xa6]
2:2BE1  50                   push ax
2:2BE2  9a2085c101           lcall 0x1c1, 0x8520  ; sub_s9:8520
2:2BE7  83c40e               add sp, 0xe
2:2BEA  eb03                 jmp 0x2bef
loc_2BEC:
2:2BEC  33c0                 xor ax, ax
2:2BEE  99                   cdq
loc_2BEF:
2:2BEF  89865cff             mov word ptr [bp - 0xa4], ax
2:2BF3  89965eff             mov word ptr [bp - 0xa2], dx
2:2BF7  52                   push dx
2:2BF8  c49e5cff             les bx, ptr [bp - 0xa4]
2:2BFC  50                   push ax
2:2BFD  26c41f               les bx, ptr es:[bx]
2:2C00  26ff5f74             lcall es:[bx + 0x74]
loc_2C04:
2:2C04  8946fe               mov word ptr [bp - 2], ax
2:2C07  3d0100               cmp ax, 1
2:2C0A  7402                 je 0x2c0e
2:2C0C  33c0                 xor ax, ax
loc_2C0E:
2:2C0E  8946fc               mov word ptr [bp - 4], ax
2:2C11  0bc0                 or ax, ax
2:2C13  7432                 je 0x2c47
2:2C15  66833e485700         cmp dword ptr [0x5748], 0  ; g_sim
2:2C1B  742a                 je 0x2c47
2:2C1D  c41e4857             les bx, ptr [0x5748]  ; g_sim
2:2C21  268b4708             mov ax, word ptr es:[bx + 8]
2:2C25  89865cff             mov word ptr [bp - 0xa4], ax
2:2C29  0bc0                 or ax, ax
2:2C2B  741a                 je 0x2c47
2:2C2D  c45e06               les bx, ptr [bp + 6]
2:2C30  26ff7708             push word ptr es:[bx + 8]
2:2C34  6668b4001101         push 0x11100b4
2:2C3A  666a00               push 0
2:2C3D  9a410e0000           lcall 0, 0xe41  ; USER.PostMessage
2:2C42  c746fc0000           mov word ptr [bp - 4], 0
loc_2C47:
2:2C47  8b46fc               mov ax, word ptr [bp - 4]
2:2C4A  c9                   leave
2:2C4B  ca0400               retf 4

; ---------------- sub_s2:2C4E FAR size=212 callers=2
;   apis: USER.BringWindowToTop, USER.LoadCursor, USER.SetCursor
2:2C4E  c80a0000             enter 0xa, 0
2:2C52  666a00               push 0
2:2C55  68027f               push 0x7f02
2:2C58  9ae7120000           lcall 0, 0x12e7  ; USER.LoadCursor
2:2C5D  50                   push ax
2:2C5E  9a192d0000           lcall 0, 0x2d19  ; USER.SetCursor
2:2C63  8946fc               mov word ptr [bp - 4], ax
2:2C66  c45e06               les bx, ptr [bp + 6]
2:2C69  26ff87f200           inc word ptr es:[bx + 0xf2]
2:2C6E  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
2:2C75  7413                 je 0x2c8a
2:2C77  6626ffb7ee00         push dword ptr es:[bx + 0xee]
2:2C7D  26c49fee00           les bx, ptr es:[bx + 0xee]
2:2C82  26c41f               les bx, ptr es:[bx]
2:2C85  26ff9f9000           lcall es:[bx + 0x90]
loc_2C8A:
2:2C8A  66ff7608             push dword ptr [bp + 8]
2:2C8E  ff7606               push word ptr [bp + 6]
2:2C91  90                   nop
2:2C92  0e                   push cs
2:2C93  e83ee9               call 0x15d4  ; sub_s2:15D4
2:2C96  c45e06               les bx, ptr [bp + 6]
2:2C99  268987ee00           mov word ptr es:[bx + 0xee], ax
2:2C9E  268997f000           mov word ptr es:[bx + 0xf0], dx
2:2CA3  52                   push dx
2:2CA4  26ffb7ee00           push word ptr es:[bx + 0xee]
2:2CA9  26c49fee00           les bx, ptr es:[bx + 0xee]
2:2CAE  26c41f               les bx, ptr es:[bx]
2:2CB1  26ff5f08             lcall es:[bx + 8]
2:2CB5  c45e06               les bx, ptr [bp + 6]
2:2CB8  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:2CBF  7414                 je 0x2cd5
2:2CC1  6a00                 push 0
2:2CC3  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:2CC9  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2CCE  26c41f               les bx, ptr es:[bx]
2:2CD1  26ff5f0c             lcall es:[bx + 0xc]
loc_2CD5:
2:2CD5  66ff367c5b           push dword ptr [0x5b7c]
2:2CDA  9a34b6c90c           lcall 0xcc9, 0xb634  ; sub_s8:B634
2:2CDF  c45e06               les bx, ptr [bp + 6]
2:2CE2  6626ffb7f400         push dword ptr es:[bx + 0xf4]
2:2CE8  9a767a702b           lcall 0x2b70, 0x7a76  ; sub_s3:7A76
2:2CED  6a05                 push 5
2:2CEF  c45e06               les bx, ptr [bp + 6]
2:2CF2  6626ffb7ee00         push dword ptr es:[bx + 0xee]
2:2CF8  26c49fee00           les bx, ptr es:[bx + 0xee]
2:2CFD  26c41f               les bx, ptr es:[bx]
2:2D00  26ff5f0c             lcall es:[bx + 0xc]
2:2D04  c45e06               les bx, ptr [bp + 6]
2:2D07  26c49fee00           les bx, ptr es:[bx + 0xee]
2:2D0C  26ff7708             push word ptr es:[bx + 8]
2:2D10  9affff0000           lcall 0, 0xffff  ; USER.BringWindowToTop
2:2D15  ff76fc               push word ptr [bp - 4]
2:2D18  9af0120000           lcall 0, 0x12f0  ; USER.SetCursor
2:2D1D  c9                   leave
2:2D1E  ca0600               retf 6
2:2D21  db 00

; ---------------- sub_s2:2D22 FAR size=170 callers=1
;   apis: USER.PostMessage
2:2D22  55                   push bp
2:2D23  8bec                 mov bp, sp
2:2D25  c45e06               les bx, ptr [bp + 6]
2:2D28  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
2:2D2F  0f849500             je 0x2dc8
2:2D33  26ff8ff200           dec word ptr es:[bx + 0xf2]
2:2D38  2683bff20000         cmp word ptr es:[bx + 0xf2], 0
2:2D3E  0f8f8600             jg 0x2dc8
2:2D42  c45e06               les bx, ptr [bp + 6]
2:2D45  6626ffb7ee00         push dword ptr es:[bx + 0xee]
2:2D4B  26c49fee00           les bx, ptr es:[bx + 0xee]
2:2D50  26c41f               les bx, ptr es:[bx]
2:2D53  26ff9f9000           lcall es:[bx + 0x90]
2:2D58  c45e06               les bx, ptr [bp + 6]
2:2D5B  662bc0               sub eax, eax
2:2D5E  66268987ee00         mov dword ptr es:[bx + 0xee], eax
2:2D64  268987f200           mov word ptr es:[bx + 0xf2], ax
2:2D69  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:2D70  7456                 je 0x2dc8
2:2D72  6a03                 push 3
2:2D74  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:2D7A  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2D7F  26c41f               les bx, ptr es:[bx]
2:2D82  26ff5f0c             lcall es:[bx + 0xc]
2:2D86  66ff367c5b           push dword ptr [0x5b7c]
2:2D8B  9a8ab6dd2c           lcall 0x2cdd, 0xb68a  ; sub_s8:B68A
2:2D90  c45e06               les bx, ptr [bp + 6]
2:2D93  6626ffb7f400         push dword ptr es:[bx + 0xf4]
2:2D99  9ace7aeb2c           lcall 0x2ceb, 0x7ace  ; sub_s3:7ACE
2:2D9E  6a01                 push 1
2:2DA0  c45e06               les bx, ptr [bp + 6]
2:2DA3  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:2DA9  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2DAE  26c41f               les bx, ptr es:[bx]
2:2DB1  26ff9f9800           lcall es:[bx + 0x98]
2:2DB6  ff369603             push word ptr [0x396]
2:2DBA  6668fc001101         push 0x11100fc
2:2DC0  666a00               push 0
2:2DC3  9a3e2c0000           lcall 0, 0x2c3e  ; USER.PostMessage
loc_2DC8:
2:2DC8  c9                   leave
2:2DC9  ca0400               retf 4

; ---------------- sub_s2:2DCC FAR size=206 callers=2
;   apis: USER.LoadCursor, USER.SetCursor
2:2DCC  c80a0000             enter 0xa, 0
2:2DD0  666a00               push 0
2:2DD3  68027f               push 0x7f02
2:2DD6  9a592c0000           lcall 0, 0x2c59  ; USER.LoadCursor
2:2DDB  50                   push ax
2:2DDC  9a912e0000           lcall 0, 0x2e91  ; USER.SetCursor
2:2DE1  8946fc               mov word ptr [bp - 4], ax
2:2DE4  c45e06               les bx, ptr [bp + 6]
2:2DE7  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
2:2DEE  7413                 je 0x2e03
2:2DF0  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:2DF6  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2DFB  26c41f               les bx, ptr es:[bx]
2:2DFE  26ff9f9000           lcall es:[bx + 0x90]
loc_2E03:
2:2E03  66ff7608             push dword ptr [bp + 8]
2:2E07  ff7606               push word ptr [bp + 6]
2:2E0A  90                   nop
2:2E0B  0e                   push cs
2:2E0C  e8c5e7               call 0x15d4  ; sub_s2:15D4
2:2E0F  c45e06               les bx, ptr [bp + 6]
2:2E12  268987e800           mov word ptr es:[bx + 0xe8], ax
2:2E17  268997ea00           mov word ptr es:[bx + 0xea], dx
2:2E1C  c45e06               les bx, ptr [bp + 6]
2:2E1F  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2E24  2683bfe00000         cmp word ptr es:[bx + 0xe0], 0
2:2E2A  7426                 je 0x2e52
2:2E2C  c45e06               les bx, ptr [bp + 6]
2:2E2F  6626c787e80000000000 mov dword ptr es:[bx + 0xe8], 0
2:2E39  ff760a               push word ptr [bp + 0xa]
2:2E3C  06                   push es
2:2E3D  53                   push bx
2:2E3E  90                   nop
2:2E3F  0e                   push cs
2:2E40  e80bfe               call 0x2c4e  ; sub_s2:2C4E
2:2E43  c45e06               les bx, ptr [bp + 6]
2:2E46  6626c787ce0000000000 mov dword ptr es:[bx + 0xce], 0
2:2E50  eb3b                 jmp 0x2e8d
loc_2E52:
2:2E52  c45e06               les bx, ptr [bp + 6]
2:2E55  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:2E5B  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2E60  26c41f               les bx, ptr es:[bx]
2:2E63  26ff5f08             lcall es:[bx + 8]
2:2E67  6a03                 push 3
2:2E69  c45e06               les bx, ptr [bp + 6]
2:2E6C  6626ffb7e800         push dword ptr es:[bx + 0xe8]
2:2E72  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2E77  26c41f               les bx, ptr es:[bx]
2:2E7A  26ff5f0c             lcall es:[bx + 0xc]
2:2E7E  c45e06               les bx, ptr [bp + 6]
2:2E81  66268b87e800         mov eax, dword ptr es:[bx + 0xe8]
2:2E87  66268987ce00         mov dword ptr es:[bx + 0xce], eax
loc_2E8D:
2:2E8D  ff76fc               push word ptr [bp - 4]
2:2E90  9a5f2c0000           lcall 0, 0x2c5f  ; USER.SetCursor
2:2E95  c9                   leave
2:2E96  ca0600               retf 6
2:2E99  db 00

; ---------------- sub_s2:2E9A FAR size=382 callers=1
;   apis: USER.LoadCursor, USER.PostMessage, USER.SetCursor, USER.UpdateWindow
2:2E9A  c82c0200             enter 0x22c, 0
2:2E9E  56                   push si
2:2E9F  c68600ff00           mov byte ptr [bp - 0x100], 0
2:2EA4  6a02                 push 2
2:2EA6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:2EAB  9aba20b22f           lcall 0x2fb2, 0x20ba  ; sub_s3:20BA
2:2EB0  8986fcfe             mov word ptr [bp - 0x104], ax
2:2EB4  8996fefe             mov word ptr [bp - 0x102], dx
2:2EB8  c49efcfe             les bx, ptr [bp - 0x104]
2:2EBC  66268b4716           mov eax, dword ptr es:[bx + 0x16]
2:2EC1  268b5718             mov dx, word ptr es:[bx + 0x18]
2:2EC5  668986f8fe           mov dword ptr [bp - 0x108], eax
2:2ECA  8bc2                 mov ax, dx
2:2ECC  0b86f8fe             or ax, word ptr [bp - 0x108]
2:2ED0  7456                 je 0x2f28
2:2ED2  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:2ED7  668986e8fe           mov dword ptr [bp - 0x118], eax
2:2EDC  6650                 push eax
2:2EDE  8d8600ff             lea ax, [bp - 0x100]
2:2EE2  16                   push ss
2:2EE3  50                   push ax
2:2EE4  9a3e3df52e           lcall 0x2ef5, 0x3d3e  ; _fstrcpy@s1:3D3E
2:2EE9  83c408               add sp, 8
2:2EEC  8d8600ff             lea ax, [bp - 0x100]
2:2EF0  16                   push ss
2:2EF1  50                   push ax
2:2EF2  9aa43d1f2f           lcall 0x2f1f, 0x3da4  ; sub_s1:3DA4
2:2EF7  83c404               add sp, 4
2:2EFA  8bf0                 mov si, ax
2:2EFC  8986e6fe             mov word ptr [bp - 0x11a], ax
2:2F00  80bafffe5c           cmp byte ptr [bp + si - 0x101], 0x5c
2:2F05  740a                 je 0x2f11
2:2F07  c68200ff5c           mov byte ptr [bp + si - 0x100], 0x5c
2:2F0C  c68201ff00           mov byte ptr [bp + si - 0xff], 0
loc_2F11:
2:2F11  66ffb6f8fe           push dword ptr [bp - 0x108]
2:2F16  8d8600ff             lea ax, [bp - 0x100]
2:2F1A  16                   push ss
2:2F1B  50                   push ax
2:2F1C  9aea3c642f           lcall 0x2f64, 0x3cea  ; sub_s1:3CEA
2:2F21  83c408               add sp, 8
2:2F24  e98d00               jmp 0x2fb4
2:2F27  db 90
loc_2F28:
2:2F28  6a01                 push 1
2:2F2A  66ff7606             push dword ptr [bp + 6]
2:2F2E  90                   nop
2:2F2F  0e                   push cs
2:2F30  e84502               call 0x3178  ; FileDialog_s2_3178@s2:3178
2:2F33  8986f8fe             mov word ptr [bp - 0x108], ax
2:2F37  8996fafe             mov word ptr [bp - 0x106], dx
2:2F3B  0bd0                 or dx, ax
2:2F3D  7517                 jne 0x2f56
2:2F3F  ff369603             push word ptr [0x396]
2:2F43  66683d011101         push 0x111013d
2:2F49  666a00               push 0
2:2F4C  9ac42d0000           lcall 0, 0x2dc4  ; USER.PostMessage
2:2F51  5e                   pop si
2:2F52  c9                   leave
2:2F53  ca0400               retf 4
loc_2F56:
2:2F56  ffb6fafe             push word ptr [bp - 0x106]
2:2F5A  50                   push ax
2:2F5B  8d8600ff             lea ax, [bp - 0x100]
2:2F5F  16                   push ss
2:2F60  50                   push ax
2:2F61  9a3e3d842f           lcall 0x2f84, 0x3d3e  ; _fstrcpy@s1:3D3E
2:2F66  83c408               add sp, 8
2:2F69  8d86d4fd             lea ax, [bp - 0x22c]
2:2F6D  16                   push ss
2:2F6E  50                   push ax
2:2F6F  8d8edefd             lea cx, [bp - 0x222]
2:2F73  16                   push ss
2:2F74  51                   push cx
2:2F75  666a00               push 0
2:2F78  666a00               push 0
2:2F7B  8d8e00ff             lea cx, [bp - 0x100]
2:2F7F  16                   push ss
2:2F80  51                   push cx
2:2F81  9a584d9f2f           lcall 0x2f9f, 0x4d58  ; sub_s1:4D58
2:2F86  83c414               add sp, 0x14
2:2F89  80bed4fd00           cmp byte ptr [bp - 0x22c], 0
2:2F8E  7414                 je 0x2fa4
2:2F90  8d86d4fd             lea ax, [bp - 0x22c]
2:2F94  16                   push ss
2:2F95  50                   push ax
2:2F96  8d86defd             lea ax, [bp - 0x222]
2:2F9A  16                   push ss
2:2F9B  50                   push ax
2:2F9C  9aea3c7c2b           lcall 0x2b7c, 0x3cea  ; sub_s1:3CEA
2:2FA1  83c408               add sp, 8
loc_2FA4:
2:2FA4  8d86defd             lea ax, [bp - 0x222]
2:2FA8  16                   push ss
2:2FA9  50                   push ax
2:2FAA  66ffb6fcfe           push dword ptr [bp - 0x104]
2:2FAF  9a1e5f9c2d           lcall 0x2d9c, 0x5f1e  ; sub_s3:5F1E
loc_2FB4:
2:2FB4  80be00ff00           cmp byte ptr [bp - 0x100], 0
2:2FB9  7457                 je 0x3012
2:2FBB  c45e06               les bx, ptr [bp + 6]
2:2FBE  66268b87e800         mov eax, dword ptr es:[bx + 0xe8]
2:2FC4  668986f4fe           mov dword ptr [bp - 0x10c], eax
2:2FC9  6650                 push eax
2:2FCB  9a7e09d116           lcall 0x16d1, 0x97e  ; sub_s5:097E
2:2FD0  c45e06               les bx, ptr [bp + 6]
2:2FD3  26c49fe800           les bx, ptr es:[bx + 0xe8]
2:2FD8  26ff7708             push word ptr es:[bx + 8]
2:2FDC  9a94040000           lcall 0, 0x494  ; USER.UpdateWindow
2:2FE1  666a00               push 0
2:2FE4  68027f               push 0x7f02
2:2FE7  9ad72d0000           lcall 0, 0x2dd7  ; USER.LoadCursor
2:2FEC  8986f2fe             mov word ptr [bp - 0x10e], ax
2:2FF0  50                   push ax
2:2FF1  9a0e300000           lcall 0, 0x300e  ; USER.SetCursor
2:2FF6  8986f0fe             mov word ptr [bp - 0x110], ax
2:2FFA  8d8600ff             lea ax, [bp - 0x100]
2:2FFE  16                   push ss
2:2FFF  50                   push ax
2:3000  66ff7606             push dword ptr [bp + 6]
2:3004  90                   nop
2:3005  0e                   push cs
2:3006  e80be4               call 0x1414  ; sub_s2:1414
2:3009  ffb6f0fe             push word ptr [bp - 0x110]
2:300D  9add2d0000           lcall 0, 0x2ddd  ; USER.SetCursor
loc_3012:
2:3012  5e                   pop si
2:3013  c9                   leave
2:3014  ca0400               retf 4
2:3017  db 00

; ---------------- sub_s2:3018 FAR size=180 callers=1
2:3018  c81a0100             enter 0x11a, 0
2:301C  56                   push si
2:301D  c68600ff00           mov byte ptr [bp - 0x100], 0
2:3022  6a02                 push 2
2:3024  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:3029  9aba20ae2e           lcall 0x2eae, 0x20ba  ; sub_s3:20BA
2:302E  8986fcfe             mov word ptr [bp - 0x104], ax
2:3032  8996fefe             mov word ptr [bp - 0x102], dx
2:3036  c49efcfe             les bx, ptr [bp - 0x104]
2:303A  66268b4712           mov eax, dword ptr es:[bx + 0x12]
2:303F  268b5714             mov dx, word ptr es:[bx + 0x14]
2:3043  668986f8fe           mov dword ptr [bp - 0x108], eax
2:3048  8bc2                 mov ax, dx
2:304A  0b86f8fe             or ax, word ptr [bp - 0x108]
2:304E  746e                 je 0x30be
2:3050  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:3055  668986f0fe           mov dword ptr [bp - 0x110], eax
2:305A  6650                 push eax
2:305C  8d8600ff             lea ax, [bp - 0x100]
2:3060  16                   push ss
2:3061  50                   push ax
2:3062  9a3e3d7330           lcall 0x3073, 0x3d3e  ; _fstrcpy@s1:3D3E
2:3067  83c408               add sp, 8
2:306A  8d8600ff             lea ax, [bp - 0x100]
2:306E  16                   push ss
2:306F  50                   push ax
2:3070  9aa43d9d30           lcall 0x309d, 0x3da4  ; sub_s1:3DA4
2:3075  83c404               add sp, 4
2:3078  8bf0                 mov si, ax
2:307A  8986eefe             mov word ptr [bp - 0x112], ax
2:307E  80bafffe5c           cmp byte ptr [bp + si - 0x101], 0x5c
2:3083  740a                 je 0x308f
2:3085  c68200ff5c           mov byte ptr [bp + si - 0x100], 0x5c
2:308A  c68201ff00           mov byte ptr [bp + si - 0xff], 0
loc_308F:
2:308F  66ffb6f8fe           push dword ptr [bp - 0x108]
2:3094  8d8600ff             lea ax, [bp - 0x100]
2:3098  16                   push ss
2:3099  50                   push ax
2:309A  9aea3ce72e           lcall 0x2ee7, 0x3cea  ; sub_s1:3CEA
2:309F  83c408               add sp, 8
2:30A2  80be00ff00           cmp byte ptr [bp - 0x100], 0
2:30A7  741e                 je 0x30c7
2:30A9  8d8600ff             lea ax, [bp - 0x100]
2:30AD  16                   push ss
2:30AE  50                   push ax
2:30AF  66ff7606             push dword ptr [bp + 6]
2:30B3  90                   nop
2:30B4  0e                   push cs
2:30B5  e824e2               call 0x12dc  ; sub_s2:12DC
2:30B8  5e                   pop si
2:30B9  c9                   leave
2:30BA  ca0400               retf 4
2:30BD  db 90
loc_30BE:
2:30BE  66ff7606             push dword ptr [bp + 6]
2:30C2  90                   nop
2:30C3  0e                   push cs
2:30C4  e80500               call 0x30cc  ; sub_s2:30CC
loc_30C7:
2:30C7  5e                   pop si
2:30C8  c9                   leave
2:30C9  ca0400               retf 4

; ---------------- sub_s2:30CC FAR size=172 callers=2
2:30CC  c8120200             enter 0x212, 0
2:30D0  c68600ff00           mov byte ptr [bp - 0x100], 0
2:30D5  6a02                 push 2
2:30D7  66ff7606             push dword ptr [bp + 6]
2:30DB  90                   nop
2:30DC  0e                   push cs
2:30DD  e89800               call 0x3178  ; FileDialog_s2_3178@s2:3178
2:30E0  8986fcfe             mov word ptr [bp - 0x104], ax
2:30E4  8996fefe             mov word ptr [bp - 0x102], dx
2:30E8  0bd0                 or dx, ax
2:30EA  0f848500             je 0x3173
2:30EE  ffb6fefe             push word ptr [bp - 0x102]
2:30F2  50                   push ax
2:30F3  8d8600ff             lea ax, [bp - 0x100]
2:30F7  16                   push ss
2:30F8  50                   push ax
2:30F9  9a3e3d1c31           lcall 0x311c, 0x3d3e  ; _fstrcpy@s1:3D3E
2:30FE  83c408               add sp, 8
2:3101  8d86f2fd             lea ax, [bp - 0x20e]
2:3105  16                   push ss
2:3106  50                   push ax
2:3107  8d8efcfd             lea cx, [bp - 0x204]
2:310B  16                   push ss
2:310C  51                   push cx
2:310D  666a00               push 0
2:3110  666a00               push 0
2:3113  8d8e00ff             lea cx, [bp - 0x100]
2:3117  16                   push ss
2:3118  51                   push cx
2:3119  9a584d3731           lcall 0x3137, 0x4d58  ; sub_s1:4D58
2:311E  83c414               add sp, 0x14
2:3121  80bef2fd00           cmp byte ptr [bp - 0x20e], 0
2:3126  7414                 je 0x313c
2:3128  8d86f2fd             lea ax, [bp - 0x20e]
2:312C  16                   push ss
2:312D  50                   push ax
2:312E  8d86fcfd             lea ax, [bp - 0x204]
2:3132  16                   push ss
2:3133  50                   push ax
2:3134  9aea3c6530           lcall 0x3065, 0x3cea  ; sub_s1:3CEA
2:3139  83c408               add sp, 8
loc_313C:
2:313C  8d86fcfd             lea ax, [bp - 0x204]
2:3140  16                   push ss
2:3141  50                   push ax
2:3142  6a02                 push 2
2:3144  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:3149  9aba205b31           lcall 0x315b, 0x20ba  ; sub_s3:20BA
2:314E  8986eefd             mov word ptr [bp - 0x212], ax
2:3152  8996f0fd             mov word ptr [bp - 0x210], dx
2:3156  52                   push dx
2:3157  50                   push ax
2:3158  9a4c5f2c30           lcall 0x302c, 0x5f4c  ; sub_s3:5F4C
2:315D  80be00ff00           cmp byte ptr [bp - 0x100], 0
2:3162  740f                 je 0x3173
2:3164  8d8600ff             lea ax, [bp - 0x100]
2:3168  16                   push ss
2:3169  50                   push ax
2:316A  66ff7606             push dword ptr [bp + 6]
2:316E  90                   nop
2:316F  0e                   push cs
2:3170  e869e1               call 0x12dc  ; sub_s2:12DC
loc_3173:
2:3173  c9                   leave
2:3174  ca0400               retf 4
2:3177  db 00

; ---------------- FileDialog_s2_3178@s2:3178 FAR size=1030 callers=2
;   apis: COMMDLG.GetOpenFileName, COMMDLG.GetSaveFileName, USER.MessageBox
2:3178  c8840700             enter 0x784, 0
2:317C  56                   push si
2:317D  32c0                 xor al, al
2:317F  888600ff             mov byte ptr [bp - 0x100], al
2:3183  888600fd             mov byte ptr [bp - 0x300], al
2:3187  888600fe             mov byte ptr [bp - 0x200], al
2:318B  6a02                 push 2
2:318D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:3192  9aba20b032           lcall 0x32b0, 0x20ba  ; sub_s3:20BA
2:3197  8986fcfc             mov word ptr [bp - 0x304], ax
2:319B  8996fefc             mov word ptr [bp - 0x302], dx
2:319F  c49efcfc             les bx, ptr [bp - 0x304]
2:31A3  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:31A8  268b571c             mov dx, word ptr es:[bx + 0x1c]
2:31AC  668986f8fc           mov dword ptr [bp - 0x308], eax
2:31B1  8bc2                 mov ax, dx
2:31B3  0b86f8fc             or ax, word ptr [bp - 0x308]
2:31B7  7407                 je 0x31c0
2:31B9  52                   push dx
2:31BA  ffb6f8fc             push word ptr [bp - 0x308]
2:31BE  eb46                 jmp 0x3206
loc_31C0:
2:31C0  66268b4764           mov eax, dword ptr es:[bx + 0x64]
2:31C5  268b5766             mov dx, word ptr es:[bx + 0x66]
2:31C9  66898694f9           mov dword ptr [bp - 0x66c], eax
2:31CE  8bc2                 mov ax, dx
2:31D0  0b8694f9             or ax, word ptr [bp - 0x66c]
2:31D4  743e                 je 0x3214
2:31D6  52                   push dx
2:31D7  ffb694f9             push word ptr [bp - 0x66c]
2:31DB  8d8684f9             lea ax, [bp - 0x67c]
2:31DF  16                   push ss
2:31E0  50                   push ax
2:31E1  90                   nop
2:31E2  0e                   push cs
2:31E3  e89e25               call 0x5784  ; ListIter::ListIter@s2:5784
2:31E6  8d8684f9             lea ax, [bp - 0x67c]
2:31EA  16                   push ss
2:31EB  50                   push ax
2:31EC  90                   nop
2:31ED  0e                   push cs
2:31EE  e82129               call 0x5b12  ; ListIter::next@s2:5B12
2:31F1  89868cf9             mov word ptr [bp - 0x674], ax
2:31F5  89968ef9             mov word ptr [bp - 0x672], dx
2:31F9  0bd0                 or dx, ax
2:31FB  7417                 je 0x3214
2:31FD  c49e8cf9             les bx, ptr [bp - 0x674]
2:3201  6626ff7704           push dword ptr es:[bx + 4]
loc_3206:
2:3206  8d8600ff             lea ax, [bp - 0x100]
2:320A  16                   push ss
2:320B  50                   push ax
2:320C  9a3e3d2032           lcall 0x3220, 0x3d3e  ; _fstrcpy@s1:3D3E
2:3211  83c408               add sp, 8
loc_3214:
2:3214  680001               push 0x100
2:3217  8d86f6fb             lea ax, [bp - 0x40a]
2:321B  16                   push ss
2:321C  50                   push ax
2:321D  9a08502e32           lcall 0x322e, 0x5008  ; sub_s1:5008
2:3222  83c406               add sp, 6
2:3225  8d86f6fb             lea ax, [bp - 0x40a]
2:3229  16                   push ss
2:322A  50                   push ax
2:322B  9aa43d4e32           lcall 0x324e, 0x3da4  ; sub_s1:3DA4
2:3230  83c404               add sp, 4
2:3233  8bf0                 mov si, ax
2:3235  8986f4fb             mov word ptr [bp - 0x40c], ax
2:3239  80baf5fb5c           cmp byte ptr [bp + si - 0x40b], 0x5c
2:323E  7505                 jne 0x3245
2:3240  c682f5fb00           mov byte ptr [bp + si - 0x40b], 0
loc_3245:
2:3245  8d8600ff             lea ax, [bp - 0x100]
2:3249  16                   push ss
2:324A  50                   push ax
2:324B  9aa43d6e32           lcall 0x326e, 0x3da4  ; sub_s1:3DA4
2:3250  83c404               add sp, 4
2:3253  8bf0                 mov si, ax
2:3255  8986f4fb             mov word ptr [bp - 0x40c], ax
2:3259  80bafffe5c           cmp byte ptr [bp + si - 0x101], 0x5c
2:325E  7505                 jne 0x3265
2:3260  c682fffe00           mov byte ptr [bp + si - 0x101], 0
loc_3265:
2:3265  8d8600ff             lea ax, [bp - 0x100]
2:3269  16                   push ss
2:326A  50                   push ax
2:326B  9a2e4f9b32           lcall 0x329b, 0x4f2e  ; sub_s1:4F2E
2:3270  83c404               add sp, 4
2:3273  c49efcfc             les bx, ptr [bp - 0x304]
2:3277  66268b4712           mov eax, dword ptr es:[bx + 0x12]
2:327C  268b5714             mov dx, word ptr es:[bx + 0x14]
2:3280  668986f8fc           mov dword ptr [bp - 0x308], eax
2:3285  8bc2                 mov ax, dx
2:3287  0b86f8fc             or ax, word ptr [bp - 0x308]
2:328B  7413                 je 0x32a0
2:328D  52                   push dx
2:328E  ffb6f8fc             push word ptr [bp - 0x308]
2:3292  8d8600fe             lea ax, [bp - 0x200]
2:3296  16                   push ss
2:3297  50                   push ax
2:3298  9a3e3dbd32           lcall 0x32bd, 0x3d3e  ; _fstrcpy@s1:3D3E
2:329D  83c408               add sp, 8
loc_32A0:
2:32A0  c686ecfb00           mov byte ptr [bp - 0x414], 0
2:32A5  687905               push 0x579
2:32A8  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:32AD  9a7e842833           lcall 0x3328, 0x847e  ; LoadStringRes@s3:847E
2:32B2  52                   push dx
2:32B3  50                   push ax
2:32B4  8d86ecfb             lea ax, [bp - 0x414]
2:32B8  16                   push ss
2:32B9  50                   push ax
2:32BA  9a3e3dcb32           lcall 0x32cb, 0x3d3e  ; _fstrcpy@s1:3D3E
2:32BF  83c408               add sp, 8
2:32C2  8d86ecfb             lea ax, [bp - 0x414]
2:32C6  16                   push ss
2:32C7  50                   push ax
2:32C8  9aa43df432           lcall 0x32f4, 0x3da4  ; sub_s1:3DA4
2:32CD  83c404               add sp, 4
2:32D0  8986f4fb             mov word ptr [bp - 0x40c], ax
2:32D4  8986eafb             mov word ptr [bp - 0x416], ax
2:32D8  eb37                 jmp 0x3311
loc_32DA:
2:32DA  8bb6eafb             mov si, word ptr [bp - 0x416]
2:32DE  80baecfb2e           cmp byte ptr [bp + si - 0x414], 0x2e
2:32E3  7528                 jne 0x330d
2:32E5  8d82edfb             lea ax, [bp + si - 0x413]
2:32E9  16                   push ss
2:32EA  50                   push ax
2:32EB  8d8684f9             lea ax, [bp - 0x67c]
2:32EF  16                   push ss
2:32F0  50                   push ax
2:32F1  9a3e3d0833           lcall 0x3308, 0x3d3e  ; _fstrcpy@s1:3D3E
2:32F6  83c408               add sp, 8
2:32F9  8d8684f9             lea ax, [bp - 0x67c]
2:32FD  16                   push ss
2:32FE  50                   push ax
2:32FF  8d86ecfb             lea ax, [bp - 0x414]
2:3303  16                   push ss
2:3304  50                   push ax
2:3305  9a3e3d3533           lcall 0x3335, 0x3d3e  ; _fstrcpy@s1:3D3E
2:330A  83c408               add sp, 8
loc_330D:
2:330D  ff8eeafb             dec word ptr [bp - 0x416]
loc_3311:
2:3311  83beeafb00           cmp word ptr [bp - 0x416], 0
2:3316  7dc2                 jge 0x32da
2:3318  c686eafa00           mov byte ptr [bp - 0x516], 0
2:331D  684c07               push 0x74c
2:3320  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:3325  9a7e842a34           lcall 0x342a, 0x847e  ; LoadStringRes@s3:847E
2:332A  52                   push dx
2:332B  50                   push ax
2:332C  8d86eafa             lea ax, [bp - 0x516]
2:3330  16                   push ss
2:3331  50                   push ax
2:3332  9a3e3d4333           lcall 0x3343, 0x3d3e  ; _fstrcpy@s1:3D3E
2:3337  83c408               add sp, 8
2:333A  8d86eafa             lea ax, [bp - 0x516]
2:333E  16                   push ss
2:333F  50                   push ax
2:3340  9aa43d8b33           lcall 0x338b, 0x3da4  ; sub_s1:3DA4
2:3345  83c404               add sp, 4
2:3348  8bf0                 mov si, ax
2:334A  8986f4fb             mov word ptr [bp - 0x40c], ax
2:334E  8a82e9fa             mov al, byte ptr [bp + si - 0x517]
2:3352  8886e8fa             mov byte ptr [bp - 0x518], al
2:3356  c786eafb0000         mov word ptr [bp - 0x416], 0
2:335C  eb13                 jmp 0x3371
loc_335E:
2:335E  8a86e8fa             mov al, byte ptr [bp - 0x518]
2:3362  3882eafa             cmp byte ptr [bp + si - 0x516], al
2:3366  7505                 jne 0x336d
2:3368  c682eafa00           mov byte ptr [bp + si - 0x516], 0
loc_336D:
2:336D  ff86eafb             inc word ptr [bp - 0x416]
loc_3371:
2:3371  8bb6eafb             mov si, word ptr [bp - 0x416]
2:3375  80baeafa00           cmp byte ptr [bp + si - 0x516], 0
2:337A  75e2                 jne 0x335e
2:337C  666800004800         push 0x480000
2:3382  8d86a0fa             lea ax, [bp - 0x560]
2:3386  16                   push ss
2:3387  50                   push ax
2:3388  9a06493734           lcall 0x3437, 0x4906  ; sub_s1:4906
2:338D  83c408               add sp, 8
2:3390  66c786a0fa48000000   mov dword ptr [bp - 0x560], 0x48
2:3399  c45e06               les bx, ptr [bp + 6]
2:339C  268b4708             mov ax, word ptr es:[bx + 8]
2:33A0  8986a4fa             mov word ptr [bp - 0x55c], ax
2:33A4  8d86eafa             lea ax, [bp - 0x516]
2:33A8  8986a8fa             mov word ptr [bp - 0x558], ax
2:33AC  8c96aafa             mov word ptr [bp - 0x556], ss
2:33B0  8d8600fe             lea ax, [bp - 0x200]
2:33B4  8986b8fa             mov word ptr [bp - 0x548], ax
2:33B8  8c96bafa             mov word ptr [bp - 0x546], ss
2:33BC  8d8600fd             lea ax, [bp - 0x300]
2:33C0  8986c0fa             mov word ptr [bp - 0x540], ax
2:33C4  8c96c2fa             mov word ptr [bp - 0x53e], ss
2:33C8  66b800010000         mov eax, 0x100
2:33CE  668986bcfa           mov dword ptr [bp - 0x544], eax
2:33D3  668986c4fa           mov dword ptr [bp - 0x53c], eax
2:33D8  8d8600ff             lea ax, [bp - 0x100]
2:33DC  8986c8fa             mov word ptr [bp - 0x538], ax
2:33E0  8c96cafa             mov word ptr [bp - 0x536], ss
2:33E4  8d86ecfb             lea ax, [bp - 0x414]
2:33E8  8986d8fa             mov word ptr [bp - 0x528], ax
2:33EC  8c96dafa             mov word ptr [bp - 0x526], ss
2:33F0  662bc0               sub eax, eax
2:33F3  6689869cfa           mov dword ptr [bp - 0x564], eax
2:33F8  88869cf9             mov byte ptr [bp - 0x664], al
2:33FC  8b460a               mov ax, word ptr [bp + 0xa]
2:33FF  48                   dec ax
2:3400  7414                 je 0x3416
2:3402  48                   dec ax
2:3403  0f84e700             je 0x34ee
2:3407  1e                   push ds
2:3408  68ca01               push 0x1ca  ; 'Unsupported FileStructType in Opwnd::initFileStruct'
2:340B  90                   nop
2:340C  0e                   push cs
2:340D  e8382c               call 0x6048  ; sub_s2:6048
2:3410  83c404               add sp, 4
2:3413  eb4c                 jmp 0x3461
2:3415  db 90
loc_3416:
2:3416  66c786d0fa04180000   mov dword ptr [bp - 0x530], 0x1804
2:341F  684d07               push 0x74d
2:3422  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:3427  9a7e848434           lcall 0x3484, 0x847e  ; LoadStringRes@s3:847E
2:342C  52                   push dx
2:342D  50                   push ax
2:342E  8d869cf9             lea ax, [bp - 0x664]
2:3432  16                   push ss
2:3433  50                   push ax
2:3434  9a3e3de734           lcall 0x34e7, 0x3d3e  ; _fstrcpy@s1:3D3E
2:3439  83c408               add sp, 8
2:343C  8d869cf9             lea ax, [bp - 0x664]
2:3440  8986ccfa             mov word ptr [bp - 0x534], ax
2:3444  8c96cefa             mov word ptr [bp - 0x532], ss
2:3448  8d86a0fa             lea ax, [bp - 0x560]
2:344C  16                   push ss
2:344D  50                   push ax
2:344E  9affff0000           lcall 0, 0xffff  ; COMMDLG.GetOpenFileName
loc_3453:
2:3453  0bc0                 or ax, ax
2:3455  740a                 je 0x3461
2:3457  668b86b8fa           mov eax, dword ptr [bp - 0x548]
2:345C  6689869cfa           mov dword ptr [bp - 0x564], eax
loc_3461:
2:3461  6683be9cfa00         cmp dword ptr [bp - 0x564], 0
2:3467  0f84f700             je 0x3562
2:346B  8b86d4fa             mov ax, word ptr [bp - 0x52c]
2:346F  898684f9             mov word ptr [bp - 0x67c], ax
2:3473  0bc0                 or ax, ax
2:3475  0f8db500             jge 0x352e
2:3479  68fd03               push 0x3fd
2:347C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:3481  9a7e84ab34           lcall 0x34ab, 0x847e  ; LoadStringRes@s3:847E
2:3486  89868cf9             mov word ptr [bp - 0x674], ax
2:348A  89968ef9             mov word ptr [bp - 0x672], dx
2:348E  52                   push dx
2:348F  50                   push ax
2:3490  90                   nop
2:3491  0e                   push cs
2:3492  e8532c               call 0x60e8  ; sub_s2:60E8
2:3495  83c404               add sp, 4
2:3498  89868cf9             mov word ptr [bp - 0x674], ax
2:349C  89968ef9             mov word ptr [bp - 0x672], dx
2:34A0  687b05               push 0x57b
2:34A3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:34A8  9a7e840235           lcall 0x3502, 0x847e  ; LoadStringRes@s3:847E
2:34AD  898690f9             mov word ptr [bp - 0x670], ax
2:34B1  899692f9             mov word ptr [bp - 0x66e], dx
2:34B5  c45e06               les bx, ptr [bp + 6]
2:34B8  26ff7708             push word ptr es:[bx + 8]
2:34BC  66ffb68cf9           push dword ptr [bp - 0x674]
2:34C1  52                   push dx
2:34C2  50                   push ax
2:34C3  6a10                 push 0x10
2:34C5  9ab02b0000           lcall 0, 0x2bb0  ; USER.MessageBox
2:34CA  66c7869cfa00000000   mov dword ptr [bp - 0x564], 0
2:34D3  668b868cf9           mov eax, dword ptr [bp - 0x674]
2:34D8  6689867cf8           mov dword ptr [bp - 0x784], eax
2:34DD  66898694f9           mov dword ptr [bp - 0x66c], eax
2:34E2  6650                 push eax
2:34E4  9ace170f35           lcall 0x350f, 0x17ce  ; operator_delete@s1:17CE
2:34E9  83c404               add sp, 4
2:34EC  eb74                 jmp 0x3562
loc_34EE:
2:34EE  66c786d0fa06000000   mov dword ptr [bp - 0x530], 6
2:34F7  684e07               push 0x74e
2:34FA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:34FF  9a7e844c31           lcall 0x314c, 0x847e  ; LoadStringRes@s3:847E
2:3504  52                   push dx
2:3505  50                   push ax
2:3506  8d869cf9             lea ax, [bp - 0x664]
2:350A  16                   push ss
2:350B  50                   push ax
2:350C  9a3e3dfc30           lcall 0x30fc, 0x3d3e  ; _fstrcpy@s1:3D3E
2:3511  83c408               add sp, 8
2:3514  8d869cf9             lea ax, [bp - 0x664]
2:3518  8986ccfa             mov word ptr [bp - 0x534], ax
2:351C  8c96cefa             mov word ptr [bp - 0x532], ss
2:3520  8d86a0fa             lea ax, [bp - 0x560]
2:3524  16                   push ss
2:3525  50                   push ax
2:3526  9affff0000           lcall 0, 0xffff  ; COMMDLG.GetSaveFileName
2:352B  e925ff               jmp 0x3453
loc_352E:
2:352E  50                   push ax
2:352F  66ffb6b8fa           push dword ptr [bp - 0x548]
2:3534  8d8680f8             lea ax, [bp - 0x780]
2:3538  16                   push ss
2:3539  50                   push ax
2:353A  9abe3d6b35           lcall 0x356b, 0x3dbe  ; sub_s1:3DBE
2:353F  83c40a               add sp, 0xa
2:3542  8bb6d4fa             mov si, word ptr [bp - 0x52c]
2:3546  c68280f800           mov byte ptr [bp + si - 0x780], 0
2:354B  80be80f800           cmp byte ptr [bp - 0x780], 0
2:3550  7410                 je 0x3562
2:3552  8d8680f8             lea ax, [bp - 0x780]
2:3556  16                   push ss
2:3557  50                   push ax
2:3558  66ffb6fcfc           push dword ptr [bp - 0x304]
2:355D  9acc609531           lcall 0x3195, 0x60cc  ; sub_s3:60CC
loc_3562:
2:3562  8d86f6fb             lea ax, [bp - 0x40a]
2:3566  16                   push ss
2:3567  50                   push ax
2:3568  9a2e4f0f32           lcall 0x320f, 0x4f2e  ; sub_s1:4F2E
2:356D  83c404               add sp, 4
2:3570  8b869cfa             mov ax, word ptr [bp - 0x564]
2:3574  8b969efa             mov dx, word ptr [bp - 0x562]
2:3578  5e                   pop si
2:3579  c9                   leave
2:357A  ca0600               retf 6
2:357D  db 00

; ---------------- sub_s2:357E FAR size=406 callers=3
;   apis: USER.GetSysColor, USER.SetSysColors
2:357E  c8820000             enter 0x82, 0
2:3582  56                   push si
2:3583  66c746d604000700     mov dword ptr [bp - 0x2a], 0x70004
2:358B  66c746da00000f00     mov dword ptr [bp - 0x26], 0xf0000
2:3593  66c746de14001000     mov dword ptr [bp - 0x22], 0x100014
2:359B  66c746e212000d00     mov dword ptr [bp - 0x1e], 0xd0012  ; 'version %d %d'
2:35A3  66c746e60e000600     mov dword ptr [bp - 0x1a], 0x6000e
2:35AB  66c746ea05000800     mov dword ptr [bp - 0x16], 0x80005
2:35B3  66c746ee11000100     mov dword ptr [bp - 0x12], 0x10011
2:35BB  66c746f202000300     mov dword ptr [bp - 0xe], 0x30002
2:35C3  66c746f609000a00     mov dword ptr [bp - 0xa], 0xa0009
2:35CB  66c746fa0b000c00     mov dword ptr [bp - 6], 0xc000b
2:35D3  c746fe1300           mov word ptr [bp - 2], 0x13
2:35D8  662bc0               sub eax, eax
2:35DB  66894682             mov dword ptr [bp - 0x7e], eax
2:35DF  66c7469680808000     mov dword ptr [bp - 0x6a], 0x808080
2:35E7  ba0001               mov dx, 0x100
2:35EA  89468e               mov word ptr [bp - 0x72], ax
2:35ED  895690               mov word ptr [bp - 0x70], dx
2:35F0  89469e               mov word ptr [bp - 0x62], ax
2:35F3  8956a0               mov word ptr [bp - 0x60], dx
2:35F6  c746a2ffff           mov word ptr [bp - 0x5e], 0xffff
2:35FB  8946a4               mov word ptr [bp - 0x5c], ax
2:35FE  b80200               mov ax, 2
2:3601  894686               mov word ptr [bp - 0x7a], ax
2:3604  895688               mov word ptr [bp - 0x78], dx
2:3607  89468a               mov word ptr [bp - 0x76], ax
2:360A  89568c               mov word ptr [bp - 0x74], dx
2:360D  89469a               mov word ptr [bp - 0x66], ax
2:3610  89569c               mov word ptr [bp - 0x64], dx
2:3613  8946a6               mov word ptr [bp - 0x5a], ax
2:3616  8956a8               mov word ptr [bp - 0x58], dx
2:3619  662bc0               sub eax, eax
2:361C  668946aa             mov dword ptr [bp - 0x56], eax
2:3620  c746b2c0c0           mov word ptr [bp - 0x4e], 0xc0c0
2:3625  8946b4               mov word ptr [bp - 0x4c], ax
2:3628  668946b6             mov dword ptr [bp - 0x4a], eax
2:362C  668946ba             mov dword ptr [bp - 0x46], eax
2:3630  668946be             mov dword ptr [bp - 0x42], eax
2:3634  668946ce             mov dword ptr [bp - 0x32], eax
2:3638  66b800800000         mov eax, 0x8000
2:363E  66894692             mov dword ptr [bp - 0x6e], eax
2:3642  668946ae             mov dword ptr [bp - 0x52], eax
2:3646  668946c2             mov dword ptr [bp - 0x3e], eax
2:364A  668946c6             mov dword ptr [bp - 0x3a], eax
2:364E  668946ca             mov dword ptr [bp - 0x36], eax
2:3652  668946d2             mov dword ptr [bp - 0x2e], eax
2:3656  c746801500           mov word ptr [bp - 0x80], 0x15
2:365B  c45e06               les bx, ptr [bp + 6]
2:365E  662683bff80000       cmp dword ptr es:[bx + 0xf8], 0
2:3665  7550                 jne 0x36b7
2:3667  6a54                 push 0x54
2:3669  9a9c173d35           lcall 0x353d, 0x179c  ; operator_new@s1:179C
2:366E  83c402               add sp, 2
2:3671  c45e06               les bx, ptr [bp + 6]
2:3674  268987f800           mov word ptr es:[bx + 0xf8], ax
2:3679  268997fa00           mov word ptr es:[bx + 0xfa], dx
2:367E  c7867eff0000         mov word ptr [bp - 0x82], 0
2:3684  eb28                 jmp 0x36ae
loc_3686:
2:3686  8bb67eff             mov si, word ptr [bp - 0x82]
2:368A  03f6                 add si, si
2:368C  ff72d6               push word ptr [bp + si - 0x2a]
2:368F  9ac1360000           lcall 0, 0x36c1  ; USER.GetSysColor
2:3694  c45e06               les bx, ptr [bp + 6]
2:3697  26c49ff800           les bx, ptr es:[bx + 0xf8]
2:369C  8bb67eff             mov si, word ptr [bp - 0x82]
2:36A0  c1e602               shl si, 2
2:36A3  268900               mov word ptr es:[bx + si], ax
2:36A6  26895002             mov word ptr es:[bx + si + 2], dx
2:36AA  ff867eff             inc word ptr [bp - 0x82]
loc_36AE:
2:36AE  8b4680               mov ax, word ptr [bp - 0x80]
2:36B1  39867eff             cmp word ptr [bp - 0x82], ax
2:36B5  7ccf                 jl 0x3686
loc_36B7:
2:36B7  837e0a00             cmp word ptr [bp + 0xa], 0
2:36BB  7412                 je 0x36cf
2:36BD  ff76d6               push word ptr [bp - 0x2a]
2:36C0  9affff0000           lcall 0, 0xffff  ; USER.GetSysColor
2:36C5  3b4682               cmp ax, word ptr [bp - 0x7e]
2:36C8  7505                 jne 0x36cf
2:36CA  3b5684               cmp dx, word ptr [bp - 0x7c]
2:36CD  743f                 je 0x370e
loc_36CF:
2:36CF  833e100000           cmp word ptr [0x10], 0
2:36D4  750d                 jne 0x36e3
2:36D6  c746800a00           mov word ptr [bp - 0x80], 0xa
2:36DB  66c74692c0c0c000     mov dword ptr [bp - 0x6e], 0xc0c0c0
loc_36E3:
2:36E3  837e0a00             cmp word ptr [bp + 0xa], 0
2:36E7  7513                 jne 0x36fc
2:36E9  ff7680               push word ptr [bp - 0x80]
2:36EC  8d46d6               lea ax, [bp - 0x2a]
2:36EF  16                   push ss
2:36F0  50                   push ax
2:36F1  c45e06               les bx, ptr [bp + 6]
2:36F4  6626ffb7f800         push dword ptr es:[bx + 0xf8]
2:36FA  eb0d                 jmp 0x3709
loc_36FC:
2:36FC  ff7680               push word ptr [bp - 0x80]
2:36FF  8d46d6               lea ax, [bp - 0x2a]
2:3702  16                   push ss
2:3703  50                   push ax
2:3704  8d4682               lea ax, [bp - 0x7e]
2:3707  16                   push ss
2:3708  50                   push ax
loc_3709:
2:3709  9affff0000           lcall 0, 0xffff  ; USER.SetSysColors
loc_370E:
2:370E  5e                   pop si
2:370F  c9                   leave
2:3710  ca0600               retf 6
2:3713  db 00

; ---------------- sub_s2:3714 FAR size=24 callers=0
2:3714  55                   push bp
2:3715  8bec                 mov bp, sp
2:3717  66ff760e             push dword ptr [bp + 0xe]
2:371B  66ff760a             push dword ptr [bp + 0xa]
2:371F  66ff7606             push dword ptr [bp + 6]
2:3723  90                   nop
2:3724  0e                   push cs
2:3725  e8e606               call 0x3e0e  ; sub_s2:3E0E
2:3728  c9                   leave
2:3729  ca0c00               retf 0xc

; ---------------- sub_s2:372C FAR size=16 callers=0
2:372C  55                   push bp
2:372D  8bec                 mov bp, sp
2:372F  8b4606               mov ax, word ptr [bp + 6]
2:3732  8b5608               mov dx, word ptr [bp + 8]
2:3735  050a00               add ax, 0xa
2:3738  c9                   leave
2:3739  ca0400               retf 4

; ---------------- sub_s2:373C FAR size=4 callers=0
2:373C  ca0600               retf 6
2:373F  db 00

; ---------------- sub_s2:3740 FAR size=4 callers=0
2:3740  ca0a00               retf 0xa
2:3743  db 00

; ---------------- sub_s2:3744 FAR size=4 callers=0
2:3744  ca0c00               retf 0xc
2:3747  db 00

; ---------------- sub_s2:3748 FAR size=4 callers=0
2:3748  ca0400               retf 4
2:374B  db 00

; ---------------- sub_s2:374C FAR size=4 callers=0
2:374C  ca0600               retf 6
2:374F  db 00

; ---------------- sub_s2:3750 FAR size=4 callers=0
2:3750  ca0400               retf 4
2:3753  db 00

; ---------------- sub_s2:3754 FAR size=4 callers=0
2:3754  ca0600               retf 6
2:3757  db 00

; ---------------- sub_s2:3758 FAR size=6 callers=0
2:3758  b80100               mov ax, 1
2:375B  ca0600               retf 6

; ---------------- sub_s2:375E FAR size=4 callers=0
2:375E  ca0a00               retf 0xa
2:3761  db 00

; ---------------- sub_s2:3762 FAR size=4 callers=0
2:3762  ca0800               retf 8
2:3765  db 00

; ---------------- sub_s2:3766 FAR size=4 callers=0
2:3766  ca0a00               retf 0xa
2:3769  db 00

; ---------------- sub_s2:376A FAR size=4 callers=0
2:376A  ca0a00               retf 0xa
2:376D  db 00

; ---------------- sub_s2:376E FAR size=4 callers=0
2:376E  ca0a00               retf 0xa
2:3771  db 00

; ---------------- sub_s2:3772 FAR size=4 callers=0
2:3772  ca0600               retf 6
2:3775  db 00

; ---------------- sub_s2:3776 FAR size=4 callers=0
2:3776  ca0600               retf 6
2:3779  db 00

; ---------------- sub_s2:377A FAR size=4 callers=0
2:377A  ca0800               retf 8
2:377D  db 00

; ---------------- sub_s2:377E FAR size=44 callers=0
2:377E  c8040000             enter 4, 0
2:3782  c45e06               les bx, ptr [bp + 6]
2:3785  26c7079a38           mov word ptr es:[bx], 0x389a
2:378A  26c747022209         mov word ptr es:[bx + 2], 0x922  ; SEGMENT s2:0000
2:3790  f6460a01             test byte ptr [bp + 0xa], 1
2:3794  7409                 je 0x379f
2:3796  66ff7606             push dword ptr [bp + 6]
2:379A  9ace176c36           lcall 0x366c, 0x17ce  ; operator_delete@s1:17CE
loc_379F:
2:379F  8b4606               mov ax, word ptr [bp + 6]
2:37A2  8b5608               mov dx, word ptr [bp + 8]
2:37A5  c9                   leave
2:37A6  ca0600               retf 6
2:37A9  db 00

; ---------------- sub_s2:37AA FAR size=58 callers=0
2:37AA  c80c0000             enter 0xc, 0
2:37AE  c45e06               les bx, ptr [bp + 6]
2:37B1  26c7070a38           mov word ptr es:[bx], 0x380a
2:37B6  26c74702c837         mov word ptr es:[bx + 2], 0x37c8  ; SEGMENT s2:0000
2:37BC  c45e06               les bx, ptr [bp + 6]
2:37BF  26c7079a38           mov word ptr es:[bx], 0x389a
2:37C4  26c747028e37         mov word ptr es:[bx + 2], 0x378e  ; SEGMENT s2:0000
2:37CA  f6460a01             test byte ptr [bp + 0xa], 1
2:37CE  7409                 je 0x37d9
2:37D0  66ff7606             push dword ptr [bp + 6]
2:37D4  9ace179d37           lcall 0x379d, 0x17ce  ; operator_delete@s1:17CE
loc_37D9:
2:37D9  8b4606               mov ax, word ptr [bp + 6]
2:37DC  8b5608               mov dx, word ptr [bp + 8]
2:37DF  c9                   leave
2:37E0  ca0600               retf 6
2:37E3  db 00

; ---------------- sub_s2:37E4 FAR size=330 callers=0
2:37E4  55                   push bp
2:37E5  8bec                 mov bp, sp
2:37E7  66ff7606             push dword ptr [bp + 6]
2:37EB  90                   nop
2:37EC  0e                   push cs
2:37ED  e828ce               call 0x618  ; sub_s2:0618
2:37F0  f6460a01             test byte ptr [bp + 0xa], 1
2:37F4  7409                 je 0x37ff
2:37F6  66ff7606             push dword ptr [bp + 6]
2:37FA  9ace17d737           lcall 0x37d7, 0x17ce  ; operator_delete@s1:17CE
loc_37FF:
2:37FF  8b4606               mov ax, word ptr [bp + 6]
2:3802  8b5608               mov dx, word ptr [bp + 8]
2:3805  c9                   leave
2:3806  ca0600               retf 6
2:3809  db 90 aa 37 10 38 14 37 14 38 60 97 18 38 ae 96 1c
2:3819  db 38 40 96 20 38 64 96 24 38 2c 37 28 38 f2 97 2c
2:3829  db 38 3c 37 30 38 40 37 34 38 44 37 38 38 48 37 3c
2:3839  db 38 4c 37 40 38 c8 97 44 38 98 96 48 38 50 37 4c
2:3849  db 38 54 37 50 38 60 9c 54 38 58 37 58 38 5e 37 5c
2:3859  db 38 4e 9c 60 38 62 37 64 38 4a 9c 68 38 66 37 6c
2:3869  db 38 6a 37 70 38 6e 37 74 38 72 37 78 38 76 37 7c
2:3879  db 38 7a 37 80 38 52 9c 84 38 56 9c 88 38 16 9c 8c
2:3889  db 38 30 9c 90 38 86 9c 94 38 c4 9c 98 38 e0 9c ba
2:3899  db 37 7e 37 0c 38 e4 37 a4 38 ea 68 a8 38 f8 0a ac
2:38A9  db 38 c6 68 b0 38 40 96 b4 38 64 96 b8 38 2c 37 bc
2:38B9  db 38 f2 97 c0 38 3c 37 c4 38 40 37 c8 38 c0 06 cc
2:38C9  db 38 32 09 d0 38 84 09 d4 38 30 12 d8 38 98 96 dc
2:38D9  db 38 92 0a e0 38 60 0c e4 38 60 9c e8 38 3c 0a ec
2:38E9  db 38 46 12 f0 38 4e 9c f4 38 62 37 f8 38 4a 9c fc
2:38F9  db 38 66 37 00 39 ba 09 04 39 4a 6a 08 39 2e 6b 0c
2:3909  db 39 02 6b 10 39 7a 37 14 39 52 9c 18 39 56 9c 1c
2:3919  db 39 16 9c 20 39 30 9c 24 39 86 9c 28 39 72 12 2c
2:3929  db 39 aa 12 9c 38

; ---------------- sub_s2:392E FAR size=76 callers=1
2:392E  c8100000             enter 0x10, 0
2:3932  c45e06               les bx, ptr [bp + 6]
2:3935  26c7079a38           mov word ptr es:[bx], 0x389a
2:393A  26c747024c39         mov word ptr es:[bx + 2], 0x394c  ; SEGMENT s2:0000
2:3940  c45e06               les bx, ptr [bp + 6]
2:3943  26c707a83a           mov word ptr es:[bx], 0x3aa8
2:3948  26c747026139         mov word ptr es:[bx + 2], 0x3961  ; SEGMENT s2:0000
2:394E  8b460a               mov ax, word ptr [bp + 0xa]
2:3951  c45e06               les bx, ptr [bp + 6]
2:3954  26894704             mov word ptr es:[bx + 4], ax
2:3958  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
2:395D  26c747026f39         mov word ptr es:[bx + 2], 0x396f  ; SEGMENT s2:0000
2:3963  c45e06               les bx, ptr [bp + 6]
2:3966  26c707a03a           mov word ptr es:[bx], 0x3aa0  ; '0.76'
2:396B  26c74702a038         mov word ptr es:[bx + 2], 0x38a0  ; SEGMENT s2:0000
2:3971  8bc3                 mov ax, bx
2:3973  8cc2                 mov dx, es
2:3975  c9                   leave
2:3976  ca0600               retf 6
2:3979  db 00

; ---------------- sub_s2:397A FAR size=50 callers=1
2:397A  c80c0000             enter 0xc, 0
2:397E  c45e06               les bx, ptr [bp + 6]
2:3981  26c707a03a           mov word ptr es:[bx], 0x3aa0  ; '0.76'
2:3986  26c747029839         mov word ptr es:[bx + 2], 0x3998  ; SEGMENT s2:0000
2:398C  c45e06               les bx, ptr [bp + 6]
2:398F  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
2:3994  26c74702a639         mov word ptr es:[bx + 2], 0x39a6  ; SEGMENT s2:0000
2:399A  c45e06               les bx, ptr [bp + 6]
2:399D  26c7079a38           mov word ptr es:[bx], 0x389a
2:39A2  26c747023e39         mov word ptr es:[bx + 2], 0x393e  ; SEGMENT s2:0000
2:39A8  c9                   leave
2:39A9  ca0400               retf 4

; ---------------- sub_s2:39AC FAR size=100 callers=1
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.FillRect, USER.GetClientRect
2:39AC  c82c0000             enter 0x2c, 0
2:39B0  c45e06               les bx, ptr [bp + 6]
2:39B3  26ff7704             push word ptr es:[bx + 4]
2:39B7  8d46e0               lea ax, [bp - 0x20]
2:39BA  16                   push ss
2:39BB  50                   push ax
2:39BC  9affff0000           lcall 0, 0xffff  ; USER.BeginPaint
2:39C1  8946de               mov word ptr [bp - 0x22], ax
2:39C4  66680b071002         push 0x210070b
2:39CA  9affff0000           lcall 0, 0xffff  ; GDI.CreateSolidBrush
2:39CF  8946dc               mov word ptr [bp - 0x24], ax
2:39D2  c45e06               les bx, ptr [bp + 6]
2:39D5  26ff7704             push word ptr es:[bx + 4]
2:39D9  8d46d4               lea ax, [bp - 0x2c]
2:39DC  16                   push ss
2:39DD  50                   push ax
2:39DE  9affff0000           lcall 0, 0xffff  ; USER.GetClientRect
2:39E3  ff76de               push word ptr [bp - 0x22]
2:39E6  8d46d4               lea ax, [bp - 0x2c]
2:39E9  16                   push ss
2:39EA  50                   push ax
2:39EB  ff76dc               push word ptr [bp - 0x24]
2:39EE  9affff0000           lcall 0, 0xffff  ; USER.FillRect
2:39F3  c45e06               les bx, ptr [bp + 6]
2:39F6  26ff7704             push word ptr es:[bx + 4]
2:39FA  8d46e0               lea ax, [bp - 0x20]
2:39FD  16                   push ss
2:39FE  50                   push ax
2:39FF  9affff0000           lcall 0, 0xffff  ; USER.EndPaint
2:3A04  ff76dc               push word ptr [bp - 0x24]
2:3A07  9affff0000           lcall 0, 0xffff  ; GDI.DeleteObject
2:3A0C  c9                   leave
2:3A0D  ca0400               retf 4

; ---------------- sub_s2:3A10 FAR size=4 callers=0
2:3A10  ca0600               retf 6
2:3A13  db 00

; ---------------- sub_s2:3A14 FAR size=44 callers=0
2:3A14  c8080000             enter 8, 0
2:3A18  c45e06               les bx, ptr [bp + 6]
2:3A1B  26c7079a38           mov word ptr es:[bx], 0x389a
2:3A20  26c747028a39         mov word ptr es:[bx + 2], 0x398a  ; SEGMENT s2:0000
2:3A26  f6460a01             test byte ptr [bp + 0xa], 1
2:3A2A  7409                 je 0x3a35
2:3A2C  66ff7606             push dword ptr [bp + 6]
2:3A30  9ace17fd37           lcall 0x37fd, 0x17ce  ; operator_delete@s1:17CE
loc_3A35:
2:3A35  8b4606               mov ax, word ptr [bp + 6]
2:3A38  8b5608               mov dx, word ptr [bp + 8]
2:3A3B  c9                   leave
2:3A3C  ca0600               retf 6
2:3A3F  db 00

; ---------------- sub_s2:3A40 FAR size=58 callers=0
2:3A40  c80c0000             enter 0xc, 0
2:3A44  c45e06               les bx, ptr [bp + 6]
2:3A47  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
2:3A4C  26c747025e3a         mov word ptr es:[bx + 2], 0x3a5e  ; SEGMENT s2:0000
2:3A52  c45e06               les bx, ptr [bp + 6]
2:3A55  26c7079a38           mov word ptr es:[bx], 0x389a
2:3A5A  26c74702243a         mov word ptr es:[bx + 2], 0x3a24  ; SEGMENT s2:0000 | '4.19'
2:3A60  f6460a01             test byte ptr [bp + 0xa], 1
2:3A64  7409                 je 0x3a6f
2:3A66  66ff7606             push dword ptr [bp + 6]
2:3A6A  9ace17333a           lcall 0x3a33, 0x17ce  ; operator_delete@s1:17CE
loc_3A6F:
2:3A6F  8b4606               mov ax, word ptr [bp + 6]
2:3A72  8b5608               mov dx, word ptr [bp + 8]
2:3A75  c9                   leave
2:3A76  ca0600               retf 6
2:3A79  db 00

; ---------------- sub_s2:3A7A FAR size=62 callers=0
2:3A7A  55                   push bp
2:3A7B  8bec                 mov bp, sp
2:3A7D  66ff7606             push dword ptr [bp + 6]
2:3A81  90                   nop
2:3A82  0e                   push cs
2:3A83  e8f4fe               call 0x397a  ; sub_s2:397A
2:3A86  f6460a01             test byte ptr [bp + 0xa], 1
2:3A8A  7409                 je 0x3a95
2:3A8C  66ff7606             push dword ptr [bp + 6]
2:3A90  9ace176d3a           lcall 0x3a6d, 0x17ce  ; operator_delete@s1:17CE
loc_3A95:
2:3A95  8b4606               mov ax, word ptr [bp + 6]
2:3A98  8b5608               mov dx, word ptr [bp + 8]
2:3A9B  c9                   leave
2:3A9C  ca0600               retf 6
2:3A9F  db 90 7a 3a a6 3a 10 3a 50 3a 14 3a ae 3a 10 3a a2
2:3AAF  db 3a 40 3a b6 3a 10 3a aa 3a

; ---------------- sub_s2:3AB8 FAR size=60 callers=1
2:3AB8  55                   push bp
2:3AB9  8bec                 mov bp, sp
2:3ABB  666a00               push 0
2:3ABE  66ff7606             push dword ptr [bp + 6]
2:3AC2  90                   nop
2:3AC3  0e                   push cs
2:3AC4  e8b32d               call 0x687a  ; sub_s2:687A
2:3AC7  c45e06               les bx, ptr [bp + 6]
2:3ACA  26c787de000000       mov word ptr es:[bx + 0xde], 0
2:3AD1  26c707463b           mov word ptr es:[bx], 0x3b46  ; '0.000'
2:3AD6  26c74702b23a         mov word ptr es:[bx + 2], 0x3ab2  ; SEGMENT s2:0000
2:3ADC  1e                   push ds
2:3ADD  68fe01               push 0x1fe  ; 'SOLDefaultWindowClass'
2:3AE0  8d475b               lea ax, [bx + 0x5b]
2:3AE3  06                   push es
2:3AE4  50                   push ax
2:3AE5  9a3e3d933a           lcall 0x3a93, 0x3d3e  ; _fstrcpy@s1:3D3E
2:3AEA  8b4606               mov ax, word ptr [bp + 6]
2:3AED  8b5608               mov dx, word ptr [bp + 8]
2:3AF0  c9                   leave
2:3AF1  ca0400               retf 4

; ---------------- sub_s2:3AF4 FAR size=10 callers=1
;   apis: USER.PostQuitMessage
2:3AF4  6a00                 push 0
2:3AF6  9affff0000           lcall 0, 0xffff  ; USER.PostQuitMessage
2:3AFB  ca0400               retf 4

; ---------------- sub_s2:3AFE size=216 callers=0
2:3AFE  c8140000             enter 0x14, 0
2:3B02  668b4606             mov eax, dword ptr [bp + 6]
2:3B06  05d200               add ax, 0xd2
2:3B09  6650                 push eax
2:3B0B  90                   nop
2:3B0C  0e                   push cs
2:3B0D  e8b41c               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:3B10  c45e06               les bx, ptr [bp + 6]
2:3B13  26c7070a38           mov word ptr es:[bx], 0x380a
2:3B18  26c747022a3b         mov word ptr es:[bx + 2], 0x3b2a  ; SEGMENT s2:0000 | '0.011'
2:3B1E  c45e06               les bx, ptr [bp + 6]
2:3B21  26c7079a38           mov word ptr es:[bx], 0x389a
2:3B26  26c74702da3a         mov word ptr es:[bx + 2], 0x3ada  ; SEGMENT s2:0000
2:3B2C  f6460a01             test byte ptr [bp + 0xa], 1
2:3B30  7409                 je 0x3b3b
2:3B32  66ff7606             push dword ptr [bp + 6]
2:3B36  9ace17e83a           lcall 0x3ae8, 0x17ce  ; operator_delete@s1:17CE
loc_3B3B:
2:3B3B  8b4606               mov ax, word ptr [bp + 6]
2:3B3E  8b5608               mov dx, word ptr [bp + 8]
2:3B41  c9                   leave
2:3B42  ca0600               retf 6
2:3B45  db 00 fe 3a 4c 3b ea 68 50 3b 60 97 54 3b c6 68 58
2:3B55  db 3b 40 96 5c 3b 64 96 60 3b 2c 37 64 3b f2 97 68
2:3B65  db 3b 3c 37 6c 3b 40 37 70 3b 44 37 74 3b 48 37 78
2:3B75  db 3b 4c 37 7c 3b c8 97 80 3b 98 96 84 3b f4 3a 88
2:3B85  db 3b 54 37 8c 3b 60 9c 90 3b 58 37 94 3b 5e 37 98
2:3B95  db 3b 4e 9c 9c 3b 62 37 a0 3b 4a 9c a4 3b 66 37 a8
2:3BA5  db 3b 6a 37 ac 3b 4a 6a b0 3b 2e 6b b4 3b 02 6b b8
2:3BB5  db 3b 7a 37 bc 3b 52 9c c0 3b 56 9c c4 3b 16 9c c8
2:3BC5  db 3b 30 9c cc 3b 86 9c d0 3b c4 9c d4 3b e0 9c 1c
2:3BD5  db 3b

; ---------------- sub_s2:3BD6 FAR size=94 callers=15
2:3BD6  55                   push bp
2:3BD7  8bec                 mov bp, sp
2:3BD9  66ff7616             push dword ptr [bp + 0x16]
2:3BDD  66ff7612             push dword ptr [bp + 0x12]
2:3BE1  ff7610               push word ptr [bp + 0x10]
2:3BE4  666a00               push 0
2:3BE7  66ff7608             push dword ptr [bp + 8]
2:3BEB  ff7606               push word ptr [bp + 6]
2:3BEE  9ab88f123c           lcall 0x3c12, 0x8fb8  ; sub_s9:8FB8
2:3BF3  c45e06               les bx, ptr [bp + 6]
2:3BF6  26c707fc3c           mov word ptr es:[bx], 0x3cfc
2:3BFB  26c74702483b         mov word ptr es:[bx + 2], 0x3b48  ; SEGMENT s2:0000
2:3C01  6633c0               xor eax, eax
2:3C04  26894736             mov word ptr es:[bx + 0x36], ax
2:3C08  6626894726           mov dword ptr es:[bx + 0x26], eax
2:3C0D  06                   push es
2:3C0E  53                   push bx
2:3C0F  9a52921b3c           lcall 0x3c1b, 0x9252  ; sub_s9:9252
2:3C14  66ff7606             push dword ptr [bp + 6]
2:3C18  9adc92283c           lcall 0x3c28, 0x92dc  ; sub_s9:92DC
2:3C1D  66ff760c             push dword ptr [bp + 0xc]
2:3C21  66ff7606             push dword ptr [bp + 6]
2:3C25  9aaa93e52b           lcall 0x2be5, 0x93aa  ; sub_s9:93AA
2:3C2A  8b4606               mov ax, word ptr [bp + 6]
2:3C2D  8b5608               mov dx, word ptr [bp + 8]
2:3C30  c9                   leave
2:3C31  ca1400               retf 0x14

; ---------------- sub_s2:3C34 size=158 callers=0
;   apis: GDI.DeleteObject, USER.SelectPalette
2:3C34  c8120000             enter 0x12, 0
2:3C38  c45e06               les bx, ptr [bp + 6]
2:3C3B  268b470a             mov ax, word ptr es:[bx + 0xa]
2:3C3F  260b4708             or ax, word ptr es:[bx + 8]
2:3C43  0f848600             je 0x3ccd
2:3C47  66268b4708           mov eax, dword ptr es:[bx + 8]
2:3C4C  668946fc             mov dword ptr [bp - 4], eax
2:3C50  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
2:3C56  740f                 je 0x3c67
2:3C58  f6460a01             test byte ptr [bp + 0xa], 1
2:3C5C  7409                 je 0x3c67
2:3C5E  66268b470c           mov eax, dword ptr es:[bx + 0xc]
2:3C63  668946fc             mov dword ptr [bp - 4], eax
loc_3C67:
2:3C67  6626837f1000         cmp dword ptr es:[bx + 0x10], 0
2:3C6D  740f                 je 0x3c7e
2:3C6F  f6460a04             test byte ptr [bp + 0xa], 4
2:3C73  7409                 je 0x3c7e
2:3C75  66268b4710           mov eax, dword ptr es:[bx + 0x10]
2:3C7A  668946fc             mov dword ptr [bp - 4], eax
loc_3C7E:
2:3C7E  c41e3042             les bx, ptr [0x4230]
2:3C82  268b470e             mov ax, word ptr es:[bx + 0xe]
2:3C86  268b5710             mov dx, word ptr es:[bx + 0x10]
2:3C8A  8946f8               mov word ptr [bp - 8], ax
2:3C8D  8d460c               lea ax, [bp + 0xc]
2:3C90  16                   push ss
2:3C91  50                   push ax
2:3C92  52                   push dx
2:3C93  ff76f8               push word ptr [bp - 8]
2:3C96  90                   nop
2:3C97  0e                   push cs
2:3C98  e86d11               call 0x4e08  ; sub_s2:4E08
2:3C9B  8946f6               mov word ptr [bp - 0xa], ax
2:3C9E  8d460c               lea ax, [bp + 0xc]
2:3CA1  16                   push ss
2:3CA2  50                   push ax
2:3CA3  c45e06               les bx, ptr [bp + 6]
2:3CA6  26ff7726             push word ptr es:[bx + 0x26]
2:3CAA  26ff7728             push word ptr es:[bx + 0x28]
2:3CAE  c45efc               les bx, ptr [bp - 4]
2:3CB1  06                   push es
2:3CB2  53                   push bx
2:3CB3  26c41f               les bx, ptr es:[bx]
2:3CB6  26ff5f04             lcall es:[bx + 4]
2:3CBA  ff760c               push word ptr [bp + 0xc]
2:3CBD  ff76f6               push word ptr [bp - 0xa]
2:3CC0  6a00                 push 0
2:3CC2  9affff0000           lcall 0, 0xffff  ; USER.SelectPalette
2:3CC7  50                   push ax
2:3CC8  9a083a0000           lcall 0, 0x3a08  ; GDI.DeleteObject
loc_3CCD:
2:3CCD  c9                   leave
2:3CCE  ca0800               retf 8
2:3CD1  db 00

; ---------------- sub_s2:3CD2 FAR size=4 callers=0
2:3CD2  ca0800               retf 8
2:3CD5  db 00

; ---------------- sub_s2:3CD6 FAR size=74 callers=0
2:3CD6  c8040000             enter 4, 0
2:3CDA  66ff7606             push dword ptr [bp + 6]
2:3CDE  9a1e91f13b           lcall 0x3bf1, 0x911e  ; sub_s9:911E
2:3CE3  f6460a01             test byte ptr [bp + 0xa], 1
2:3CE7  7409                 je 0x3cf2
2:3CE9  66ff7606             push dword ptr [bp + 6]
2:3CED  9ace17393b           lcall 0x3b39, 0x17ce  ; operator_delete@s1:17CE
loc_3CF2:
2:3CF2  8b4606               mov ax, word ptr [bp + 6]
2:3CF5  8b5608               mov dx, word ptr [bp + 8]
2:3CF8  c9                   leave
2:3CF9  ca0600               retf 6
2:3CFC  db d6 3c 0e 3d 52 92 06 3d dc 92 0a 3d 22 94 12 3d
2:3D0C  db 34 3c 16 3d fc 94 1a 3d d2 3c ff 3b e6 93 1e 3d
2:3D1C  db 04 94 e1 3c

; ---------------- sub_s2:3D20 FAR size=32 callers=0
;   apis: USER.PostMessage
2:3D20  55                   push bp
2:3D21  8bec                 mov bp, sp
2:3D23  c45e06               les bx, ptr [bp + 6]
2:3D26  26ffb7bc00           push word ptr es:[bx + 0xbc]
2:3D2B  681101               push 0x111
2:3D2E  26ffb7cc00           push word ptr es:[bx + 0xcc]
2:3D33  666a00               push 0
2:3D36  9a4d2f0000           lcall 0, 0x2f4d  ; USER.PostMessage
2:3D3B  c9                   leave
2:3D3C  ca0a00               retf 0xa
2:3D3F  db 00

; ---------------- sub_s2:3D40 FAR size=4 callers=0
2:3D40  ca0a00               retf 0xa
2:3D43  db 00

; ---------------- sub_s2:3D44 FAR size=202 callers=0
2:3D44  c8100000             enter 0x10, 0
2:3D48  c45e06               les bx, ptr [bp + 6]
2:3D4B  26c7070a38           mov word ptr es:[bx], 0x380a
2:3D50  26c74702623d         mov word ptr es:[bx + 2], 0x3d62  ; SEGMENT s2:0000
2:3D56  c45e06               les bx, ptr [bp + 6]
2:3D59  26c7079a38           mov word ptr es:[bx], 0x389a
2:3D5E  26c74702fe3c         mov word ptr es:[bx + 2], 0x3cfe  ; SEGMENT s2:0000
2:3D64  f6460a01             test byte ptr [bp + 0xa], 1
2:3D68  7409                 je 0x3d73
2:3D6A  66ff7606             push dword ptr [bp + 6]
2:3D6E  9ace17f03c           lcall 0x3cf0, 0x17ce  ; operator_delete@s1:17CE
loc_3D73:
2:3D73  8b4606               mov ax, word ptr [bp + 6]
2:3D76  8b5608               mov dx, word ptr [bp + 8]
2:3D79  c9                   leave
2:3D7A  ca0600               retf 6
2:3D7D  db 00 44 3d 84 3d 14 37 88 3d 60 97 8c 3d ae 96 90
2:3D8D  db 3d 40 96 94 3d 64 96 98 3d 2c 37 9c 3d f2 97 a0
2:3D9D  db 3d 3c 37 a4 3d 40 37 a8 3d 44 37 ac 3d 48 37 b0
2:3DAD  db 3d 4c 37 b4 3d c8 97 b8 3d 98 96 bc 3d 50 37 c0
2:3DBD  db 3d 54 37 c4 3d 60 9c c8 3d 58 37 cc 3d 5e 37 d0
2:3DCD  db 3d 4e 9c d4 3d 62 37 d8 3d 4a 9c dc 3d 20 3d e0
2:3DDD  db 3d 40 3d e4 3d 6e 37 e8 3d 72 37 ec 3d 76 37 f0
2:3DED  db 3d 7a 37 f4 3d 52 9c f8 3d 56 9c fc 3d 16 9c 00
2:3DFD  db 3e 30 9c 04 3e 86 9c 08 3e c4 9c 0c 3e e0 9c 54
2:3E0D  db 3d

; ---------------- sub_s2:3E0E FAR size=42 callers=7
2:3E0E  55                   push bp
2:3E0F  8bec                 mov bp, sp
2:3E11  c45e06               les bx, ptr [bp + 6]
2:3E14  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:3E1A  7418                 je 0x3e34
2:3E1C  66ff760e             push dword ptr [bp + 0xe]
2:3E20  66ff760a             push dword ptr [bp + 0xa]
2:3E24  6626ff7704           push dword ptr es:[bx + 4]
2:3E29  26c45f04             les bx, ptr es:[bx + 4]
2:3E2D  26c41f               les bx, ptr es:[bx]
2:3E30  26ff5f04             lcall es:[bx + 4]
loc_3E34:
2:3E34  c9                   leave
2:3E35  ca0c00               retf 0xc

; ---------------- sub_s2:3E38 FAR size=28 callers=53
2:3E38  55                   push bp
2:3E39  8bec                 mov bp, sp
2:3E3B  33c0                 xor ax, ax
2:3E3D  c45e06               les bx, ptr [bp + 6]
2:3E40  268907               mov word ptr es:[bx], ax
2:3E43  26894702             mov word ptr es:[bx + 2], ax
2:3E47  26894704             mov word ptr es:[bx + 4], ax
2:3E4B  8bc3                 mov ax, bx
2:3E4D  8cc2                 mov dx, es
2:3E4F  c9                   leave
2:3E50  ca0400               retf 4
2:3E53  db 00

; ---------------- sub_s2:3E54 FAR size=34 callers=19
2:3E54  55                   push bp
2:3E55  8bec                 mov bp, sp
2:3E57  8b460e               mov ax, word ptr [bp + 0xe]
2:3E5A  c45e06               les bx, ptr [bp + 6]
2:3E5D  268907               mov word ptr es:[bx], ax
2:3E60  8b460c               mov ax, word ptr [bp + 0xc]
2:3E63  26894702             mov word ptr es:[bx + 2], ax
2:3E67  8b460a               mov ax, word ptr [bp + 0xa]
2:3E6A  26894704             mov word ptr es:[bx + 4], ax
2:3E6E  8bc3                 mov ax, bx
2:3E70  8cc2                 mov dx, es
2:3E72  c9                   leave
2:3E73  ca0a00               retf 0xa

; ---------------- sub_s2:3E76 FAR size=30 callers=32
2:3E76  55                   push bp
2:3E77  8bec                 mov bp, sp
2:3E79  8b460e               mov ax, word ptr [bp + 0xe]
2:3E7C  c45e06               les bx, ptr [bp + 6]
2:3E7F  268907               mov word ptr es:[bx], ax
2:3E82  8b460c               mov ax, word ptr [bp + 0xc]
2:3E85  26894702             mov word ptr es:[bx + 2], ax
2:3E89  8b460a               mov ax, word ptr [bp + 0xa]
2:3E8C  26894704             mov word ptr es:[bx + 4], ax
2:3E90  c9                   leave
2:3E91  ca0a00               retf 0xa

; ---------------- sub_s2:3E94 FAR size=32 callers=51
2:3E94  55                   push bp
2:3E95  8bec                 mov bp, sp
2:3E97  c45e06               les bx, ptr [bp + 6]
2:3E9A  268b07               mov ax, word ptr es:[bx]
2:3E9D  c45e0e               les bx, ptr [bp + 0xe]
2:3EA0  268907               mov word ptr es:[bx], ax
2:3EA3  c45e06               les bx, ptr [bp + 6]
2:3EA6  268b4702             mov ax, word ptr es:[bx + 2]
2:3EAA  c45e0a               les bx, ptr [bp + 0xa]
2:3EAD  268907               mov word ptr es:[bx], ax
2:3EB0  c9                   leave
2:3EB1  ca0c00               retf 0xc

; ---------------- sub_s2:3EB4 FAR size=46 callers=42
2:3EB4  55                   push bp
2:3EB5  8bec                 mov bp, sp
2:3EB7  c45e06               les bx, ptr [bp + 6]
2:3EBA  268b07               mov ax, word ptr es:[bx]
2:3EBD  c45e12               les bx, ptr [bp + 0x12]
2:3EC0  268907               mov word ptr es:[bx], ax
2:3EC3  c45e06               les bx, ptr [bp + 6]
2:3EC6  268b4702             mov ax, word ptr es:[bx + 2]
2:3ECA  c45e0e               les bx, ptr [bp + 0xe]
2:3ECD  268907               mov word ptr es:[bx], ax
2:3ED0  c45e06               les bx, ptr [bp + 6]
2:3ED3  268b4704             mov ax, word ptr es:[bx + 4]
2:3ED7  c45e0a               les bx, ptr [bp + 0xa]
2:3EDA  268907               mov word ptr es:[bx], ax
2:3EDD  c9                   leave
2:3EDE  ca1000               retf 0x10
2:3EE1  db 00

; ---------------- sub_s2:3EE2 FAR size=80 callers=1
2:3EE2  c8120000             enter 0x12, 0
2:3EE6  c45e0a               les bx, ptr [bp + 0xa]
2:3EE9  268b07               mov ax, word ptr es:[bx]
2:3EEC  c45e06               les bx, ptr [bp + 6]
2:3EEF  268b0f               mov cx, word ptr es:[bx]
2:3EF2  2bc1                 sub ax, cx
2:3EF4  7902                 jns 0x3ef8
2:3EF6  f7d8                 neg ax
loc_3EF8:
2:3EF8  40                   inc ax
2:3EF9  268907               mov word ptr es:[bx], ax
2:3EFC  c45e0a               les bx, ptr [bp + 0xa]
2:3EFF  268b4702             mov ax, word ptr es:[bx + 2]
2:3F03  c45e06               les bx, ptr [bp + 6]
2:3F06  268b4f02             mov cx, word ptr es:[bx + 2]
2:3F0A  2bc1                 sub ax, cx
2:3F0C  7902                 jns 0x3f10
2:3F0E  f7d8                 neg ax
loc_3F10:
2:3F10  40                   inc ax
2:3F11  26894702             mov word ptr es:[bx + 2], ax
2:3F15  c45e0a               les bx, ptr [bp + 0xa]
2:3F18  268b4704             mov ax, word ptr es:[bx + 4]
2:3F1C  c45e06               les bx, ptr [bp + 6]
2:3F1F  268b4f04             mov cx, word ptr es:[bx + 4]
2:3F23  2bc1                 sub ax, cx
2:3F25  7902                 jns 0x3f29
2:3F27  f7d8                 neg ax
loc_3F29:
2:3F29  40                   inc ax
2:3F2A  26894704             mov word ptr es:[bx + 4], ax
2:3F2E  c9                   leave
2:3F2F  ca0800               retf 8

; ---------------- sub_s2:3F32 FAR size=48 callers=6
2:3F32  55                   push bp
2:3F33  8bec                 mov bp, sp
2:3F35  c45e0a               les bx, ptr [bp + 0xa]
2:3F38  268b07               mov ax, word ptr es:[bx]
2:3F3B  c45e06               les bx, ptr [bp + 6]
2:3F3E  260107               add word ptr es:[bx], ax
2:3F41  c45e0a               les bx, ptr [bp + 0xa]
2:3F44  268b4702             mov ax, word ptr es:[bx + 2]
2:3F48  c45e06               les bx, ptr [bp + 6]
2:3F4B  26014702             add word ptr es:[bx + 2], ax
2:3F4F  c45e0a               les bx, ptr [bp + 0xa]
2:3F52  268b4704             mov ax, word ptr es:[bx + 4]
2:3F56  c45e06               les bx, ptr [bp + 6]
2:3F59  26014704             add word ptr es:[bx + 4], ax
2:3F5D  c9                   leave
2:3F5E  ca0800               retf 8
2:3F61  db 00

; ---------------- sub_s2:3F62 FAR size=48 callers=44
2:3F62  55                   push bp
2:3F63  8bec                 mov bp, sp
2:3F65  c45e0a               les bx, ptr [bp + 0xa]
2:3F68  268b07               mov ax, word ptr es:[bx]
2:3F6B  c45e06               les bx, ptr [bp + 6]
2:3F6E  268907               mov word ptr es:[bx], ax
2:3F71  c45e0a               les bx, ptr [bp + 0xa]
2:3F74  268b4702             mov ax, word ptr es:[bx + 2]
2:3F78  c45e06               les bx, ptr [bp + 6]
2:3F7B  26894702             mov word ptr es:[bx + 2], ax
2:3F7F  c45e0a               les bx, ptr [bp + 0xa]
2:3F82  268b4704             mov ax, word ptr es:[bx + 4]
2:3F86  c45e06               les bx, ptr [bp + 6]
2:3F89  26894704             mov word ptr es:[bx + 4], ax
2:3F8D  c9                   leave
2:3F8E  ca0800               retf 8
2:3F91  db 00

; ---------------- sub_s2:3F92 FAR size=132 callers=5
2:3F92  55                   push bp
2:3F93  8bec                 mov bp, sp
2:3F95  66ff7606             push dword ptr [bp + 6]
2:3F99  90                   nop
2:3F9A  0e                   push cs
2:3F9B  e81617               call 0x56b4  ; sub_s2:56B4
2:3F9E  c45e06               les bx, ptr [bp + 6]
2:3FA1  662bc0               sub eax, eax
2:3FA4  6626894706           mov dword ptr es:[bx + 6], eax
2:3FA9  662689470a           mov dword ptr es:[bx + 0xa], eax
2:3FAE  2689470e             mov word ptr es:[bx + 0xe], ax
2:3FB2  6626894710           mov dword ptr es:[bx + 0x10], eax
2:3FB7  6626894714           mov dword ptr es:[bx + 0x14], eax
2:3FBC  6626894718           mov dword ptr es:[bx + 0x18], eax
2:3FC1  2689471c             mov word ptr es:[bx + 0x1c], ax
2:3FC5  26c707de48           mov word ptr es:[bx], 0x48de
2:3FCA  26c74702803d         mov word ptr es:[bx + 2], 0x3d80  ; SEGMENT s2:0000
2:3FD0  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:3FD5  7509                 jne 0x3fe0
2:3FD7  8bc3                 mov ax, bx
2:3FD9  8cc2                 mov dx, es
2:3FDB  c9                   leave
2:3FDC  ca0800               retf 8
2:3FDF  db 90
loc_3FE0:
2:3FE0  c45e0a               les bx, ptr [bp + 0xa]
2:3FE3  06                   push es
2:3FE4  53                   push bx
2:3FE5  26c41f               les bx, ptr es:[bx]
2:3FE8  26ff5f08             lcall es:[bx + 8]
2:3FEC  66ff760a             push dword ptr [bp + 0xa]
2:3FF0  66ff7606             push dword ptr [bp + 6]
2:3FF4  90                   nop
2:3FF5  0e                   push cs
2:3FF6  e81b02               call 0x4214  ; sub_s2:4214
2:3FF9  66ff7606             push dword ptr [bp + 6]
2:3FFD  90                   nop
2:3FFE  0e                   push cs
2:3FFF  e8ca07               call 0x47cc  ; sub_s2:47CC
2:4002  66ff7606             push dword ptr [bp + 6]
2:4006  90                   nop
2:4007  0e                   push cs
2:4008  e82908               call 0x4834  ; sub_s2:4834
2:400B  8b4606               mov ax, word ptr [bp + 6]
2:400E  8b5608               mov dx, word ptr [bp + 8]
2:4011  c9                   leave
2:4012  ca0800               retf 8
2:4015  db 00

; ---------------- sub_s2:4016 FAR size=70 callers=3
2:4016  55                   push bp
2:4017  8bec                 mov bp, sp
2:4019  66ff7606             push dword ptr [bp + 6]
2:401D  90                   nop
2:401E  0e                   push cs
2:401F  e89216               call 0x56b4  ; sub_s2:56B4
2:4022  c45e06               les bx, ptr [bp + 6]
2:4025  662bc0               sub eax, eax
2:4028  6626894706           mov dword ptr es:[bx + 6], eax
2:402D  662689470a           mov dword ptr es:[bx + 0xa], eax
2:4032  2689470e             mov word ptr es:[bx + 0xe], ax
2:4036  6626894710           mov dword ptr es:[bx + 0x10], eax
2:403B  6626894714           mov dword ptr es:[bx + 0x14], eax
2:4040  6626894718           mov dword ptr es:[bx + 0x18], eax
2:4045  2689471c             mov word ptr es:[bx + 0x1c], ax
2:4049  26c707de48           mov word ptr es:[bx], 0x48de
2:404E  26c74702ce3f         mov word ptr es:[bx + 2], 0x3fce  ; SEGMENT s2:0000
2:4054  8bc3                 mov ax, bx
2:4056  8cc2                 mov dx, es
2:4058  c9                   leave
2:4059  ca0400               retf 4

; ---------------- sub_s2:405C FAR size=352 callers=3
2:405C  c8080000             enter 8, 0
2:4060  57                   push di
2:4061  56                   push si
2:4062  66ff7606             push dword ptr [bp + 6]
2:4066  90                   nop
2:4067  0e                   push cs
2:4068  e84916               call 0x56b4  ; sub_s2:56B4
2:406B  c45e06               les bx, ptr [bp + 6]
2:406E  662bc0               sub eax, eax
2:4071  6626894706           mov dword ptr es:[bx + 6], eax
2:4076  662689470a           mov dword ptr es:[bx + 0xa], eax
2:407B  2689470e             mov word ptr es:[bx + 0xe], ax
2:407F  6626894710           mov dword ptr es:[bx + 0x10], eax
2:4084  6626894714           mov dword ptr es:[bx + 0x14], eax
2:4089  6626894718           mov dword ptr es:[bx + 0x18], eax
2:408E  2689471c             mov word ptr es:[bx + 0x1c], ax
2:4092  26c707de48           mov word ptr es:[bx], 0x48de
2:4097  26c747025240         mov word ptr es:[bx + 2], 0x4052  ; SEGMENT s2:0000
2:409D  8b460e               mov ax, word ptr [bp + 0xe]
2:40A0  99                   cdq
2:40A1  52                   push dx
2:40A2  50                   push ax
2:40A3  8bc8                 mov cx, ax
2:40A5  8b4610               mov ax, word ptr [bp + 0x10]
2:40A8  c1e003               shl ax, 3
2:40AB  051f00               add ax, 0x1f
2:40AE  8bf2                 mov si, dx
2:40B0  99                   cdq
2:40B1  83e21f               and dx, 0x1f
2:40B4  03c2                 add ax, dx
2:40B6  c1f805               sar ax, 5
2:40B9  c1e002               shl ax, 2
2:40BC  99                   cdq
2:40BD  52                   push dx
2:40BE  50                   push ax
2:40BF  8bf8                 mov di, ax
2:40C1  894ef8               mov word ptr [bp - 8], cx
2:40C4  8976fa               mov word ptr [bp - 6], si
2:40C7  8bf2                 mov si, dx
2:40C9  6658                 pop eax
2:40CB  6659                 pop ecx
2:40CD  66f7e9               imul ecx
2:40D0  660536040000         add eax, 0x436
2:40D6  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:40DB  6650                 push eax
2:40DD  6a01                 push 1
2:40DF  9a480a713d           lcall 0x3d71, 0xa48  ; sub_s1:0A48
2:40E4  c45e06               les bx, ptr [bp + 6]
2:40E7  26894706             mov word ptr es:[bx + 6], ax
2:40EB  26895708             mov word ptr es:[bx + 8], dx
2:40EF  06                   push es
2:40F0  53                   push bx
2:40F1  90                   nop
2:40F2  0e                   push cs
2:40F3  e8d606               call 0x47cc  ; sub_s2:47CC
2:40F6  c45e06               les bx, ptr [bp + 6]
2:40F9  26897f18             mov word ptr es:[bx + 0x18], di
2:40FD  2689771a             mov word ptr es:[bx + 0x1a], si
2:4101  26c45f10             les bx, ptr es:[bx + 0x10]
2:4105  6626c70728000000     mov dword ptr es:[bx], 0x28
2:410D  660fbf4610           movsx eax, word ptr [bp + 0x10]
2:4112  c45e06               les bx, ptr [bp + 6]
2:4115  26c45f10             les bx, ptr es:[bx + 0x10]
2:4119  6626894704           mov dword ptr es:[bx + 4], eax
2:411E  668b46f8             mov eax, dword ptr [bp - 8]
2:4122  8b56fa               mov dx, word ptr [bp - 6]
2:4125  c45e06               les bx, ptr [bp + 6]
2:4128  26c45f10             les bx, ptr es:[bx + 0x10]
2:412C  6626894708           mov dword ptr es:[bx + 8], eax
2:4131  c45e06               les bx, ptr [bp + 6]
2:4134  26c45f10             les bx, ptr es:[bx + 0x10]
2:4138  26c7470c0100         mov word ptr es:[bx + 0xc], 1
2:413E  c45e06               les bx, ptr [bp + 6]
2:4141  26c45f10             les bx, ptr es:[bx + 0x10]
2:4145  26c7470e0800         mov word ptr es:[bx + 0xe], 8
2:414B  c45e06               les bx, ptr [bp + 6]
2:414E  26c45f10             les bx, ptr es:[bx + 0x10]
2:4152  6626c7471000000000   mov dword ptr es:[bx + 0x10], 0
2:415B  668bc8               mov ecx, eax
2:415E  c45e06               les bx, ptr [bp + 6]
2:4161  66268b4718           mov eax, dword ptr es:[bx + 0x18]
2:4166  66f7e1               mul ecx
2:4169  c45e06               les bx, ptr [bp + 6]
2:416C  26c45f10             les bx, ptr es:[bx + 0x10]
2:4170  6626894714           mov dword ptr es:[bx + 0x14], eax
2:4175  c45e06               les bx, ptr [bp + 6]
2:4178  26c45f10             les bx, ptr es:[bx + 0x10]
2:417C  6626c7472000010000   mov dword ptr es:[bx + 0x20], 0x100
2:4185  c45e06               les bx, ptr [bp + 6]
2:4188  26c45f10             les bx, ptr es:[bx + 0x10]
2:418C  6626c7472400010000   mov dword ptr es:[bx + 0x24], 0x100
2:4195  66ff7606             push dword ptr [bp + 6]
2:4199  90                   nop
2:419A  0e                   push cs
2:419B  e89606               call 0x4834  ; sub_s2:4834
2:419E  66ff760a             push dword ptr [bp + 0xa]
2:41A2  c45e06               les bx, ptr [bp + 6]
2:41A5  6626ff770a           push dword ptr es:[bx + 0xa]
2:41AA  90                   nop
2:41AB  0e                   push cs
2:41AC  e8d50b               call 0x4d84  ; sub_s2:4D84
2:41AF  8b4606               mov ax, word ptr [bp + 6]
2:41B2  8b5608               mov dx, word ptr [bp + 8]
2:41B5  5e                   pop si
2:41B6  5f                   pop di
2:41B7  c9                   leave
2:41B8  ca0c00               retf 0xc
2:41BB  db 00

; ---------------- sub_s2:41BC FAR size=88 callers=6
2:41BC  c8100000             enter 0x10, 0
2:41C0  56                   push si
2:41C1  c45e06               les bx, ptr [bp + 6]
2:41C4  26c707de48           mov word ptr es:[bx], 0x48de
2:41C9  26c747020c42         mov word ptr es:[bx + 2], 0x420c  ; SEGMENT s2:0000
2:41CF  268b470a             mov ax, word ptr es:[bx + 0xa]
2:41D3  268b570c             mov dx, word ptr es:[bx + 0xc]
2:41D7  8bda                 mov bx, dx
2:41D9  0bd0                 or dx, ax
2:41DB  740e                 je 0x41eb
2:41DD  6a01                 push 1
2:41DF  53                   push bx
2:41E0  50                   push ax
2:41E1  8ec3                 mov es, bx
2:41E3  8bf0                 mov si, ax
2:41E5  26c41c               les bx, ptr es:[si]
2:41E8  26ff1f               lcall es:[bx]
loc_41EB:
2:41EB  c45e06               les bx, ptr [bp + 6]
2:41EE  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:41F4  740a                 je 0x4200
2:41F6  6626ff7706           push dword ptr es:[bx + 6]
2:41FB  9ac60de240           lcall 0x40e2, 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_4200:
2:4200  c45e06               les bx, ptr [bp + 6]
2:4203  26c7079a38           mov word ptr es:[bx], 0x389a
2:4208  26c747029b40         mov word ptr es:[bx + 2], 0x409b  ; SEGMENT s2:0000
2:420E  5e                   pop si
2:420F  c9                   leave
2:4210  ca0400               retf 4
2:4213  db 00

; ---------------- sub_s2:4214 FAR size=96 callers=2
2:4214  c8080000             enter 8, 0
2:4218  56                   push si
2:4219  c45e0a               les bx, ptr [bp + 0xa]
2:421C  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:4221  c45e06               les bx, ptr [bp + 6]
2:4224  6626894706           mov dword ptr es:[bx + 6], eax
2:4229  c45e0a               les bx, ptr [bp + 0xa]
2:422C  6626c7471a00000000   mov dword ptr es:[bx + 0x1a], 0
2:4235  268b4704             mov ax, word ptr es:[bx + 4]
2:4239  268b5706             mov dx, word ptr es:[bx + 6]
2:423D  8bda                 mov bx, dx
2:423F  0bd0                 or dx, ax
2:4241  740e                 je 0x4251
2:4243  6a01                 push 1
2:4245  53                   push bx
2:4246  50                   push ax
2:4247  8ec3                 mov es, bx
2:4249  8bf0                 mov si, ax
2:424B  26c41c               les bx, ptr es:[si]
2:424E  26ff1f               lcall es:[bx]
loc_4251:
2:4251  c45e0a               les bx, ptr [bp + 0xa]
2:4254  662bc0               sub eax, eax
2:4257  6626894704           mov dword ptr es:[bx + 4], eax
2:425C  662689470e           mov dword ptr es:[bx + 0xe], eax
2:4261  6626894712           mov dword ptr es:[bx + 0x12], eax
2:4266  6626894716           mov dword ptr es:[bx + 0x16], eax
2:426B  2689471e             mov word ptr es:[bx + 0x1e], ax
2:426F  5e                   pop si
2:4270  c9                   leave
2:4271  ca0800               retf 8

; ---------------- sub_s2:4274 size=168 callers=0
;   apis: KERNEL.hmemcpy
2:4274  c8100000             enter 0x10, 0
2:4278  c45e06               les bx, ptr [bp + 6]
2:427B  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4281  7507                 jne 0x428a
loc_4283:
2:4283  33c0                 xor ax, ax
2:4285  99                   cdq
2:4286  c9                   leave
2:4287  ca0400               retf 4
loc_428A:
2:428A  6626ff7706           push dword ptr es:[bx + 6]
2:428F  9a8412a642           lcall 0x42a6, 0x1284  ; sub_s1:1284
2:4294  8946fc               mov word ptr [bp - 4], ax
2:4297  8956fe               mov word ptr [bp - 2], dx
2:429A  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:429F  52                   push dx
2:42A0  50                   push ax
2:42A1  6a01                 push 1
2:42A3  9a480acc42           lcall 0x42cc, 0xa48  ; sub_s1:0A48
2:42A8  8946f8               mov word ptr [bp - 8], ax
2:42AB  8956fa               mov word ptr [bp - 6], dx
2:42AE  0bd0                 or dx, ax
2:42B0  74d1                 je 0x4283
2:42B2  ff76fa               push word ptr [bp - 6]
2:42B5  50                   push ax
2:42B6  c45e06               les bx, ptr [bp + 6]
2:42B9  6626ff7706           push dword ptr es:[bx + 6]
2:42BE  66ff76fc             push dword ptr [bp - 4]
2:42C2  9affff0000           lcall 0, 0xffff  ; KERNEL.hmemcpy
2:42C7  6a1e                 push 0x1e
2:42C9  9a9c17fe41           lcall 0x41fe, 0x179c  ; operator_new@s1:179C
2:42CE  83c402               add sp, 2
2:42D1  8956f2               mov word ptr [bp - 0xe], dx
2:42D4  0bd0                 or dx, ax
2:42D6  7410                 je 0x42e8
2:42D8  ff76f2               push word ptr [bp - 0xe]
2:42DB  50                   push ax
2:42DC  90                   nop
2:42DD  0e                   push cs
2:42DE  e835fd               call 0x4016  ; sub_s2:4016
2:42E1  8ec2                 mov es, dx
2:42E3  8bd8                 mov bx, ax
2:42E5  eb05                 jmp 0x42ec
2:42E7  db 90
loc_42E8:
2:42E8  33db                 xor bx, bx
2:42EA  8ec3                 mov es, bx
loc_42EC:
2:42EC  895ef4               mov word ptr [bp - 0xc], bx
2:42EF  8c46f6               mov word ptr [bp - 0xa], es
2:42F2  668b46f8             mov eax, dword ptr [bp - 8]
2:42F6  6626894706           mov dword ptr es:[bx + 6], eax
2:42FB  06                   push es
2:42FC  53                   push bx
2:42FD  90                   nop
2:42FE  0e                   push cs
2:42FF  e8ca04               call 0x47cc  ; sub_s2:47CC
2:4302  66ff76f4             push dword ptr [bp - 0xc]
2:4306  90                   nop
2:4307  0e                   push cs
2:4308  e82905               call 0x4834  ; sub_s2:4834
2:430B  c45ef4               les bx, ptr [bp - 0xc]
2:430E  26c7471c0100         mov word ptr es:[bx + 0x1c], 1
2:4314  8bc3                 mov ax, bx
2:4316  8cc2                 mov dx, es
2:4318  c9                   leave
2:4319  ca0400               retf 4

; ---------------- sub_s2:431C FAR size=176 callers=1
2:431C  c80a0000             enter 0xa, 0
2:4320  c45e06               les bx, ptr [bp + 6]
2:4323  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4329  7507                 jne 0x4332
2:432B  06                   push es
2:432C  53                   push bx
2:432D  90                   nop
2:432E  0e                   push cs
2:432F  e89a04               call 0x47cc  ; sub_s2:47CC
loc_4332:
2:4332  c45e06               les bx, ptr [bp + 6]
2:4335  268b4708             mov ax, word ptr es:[bx + 8]
2:4339  260b4706             or ax, word ptr es:[bx + 6]
2:433D  751d                 jne 0x435c
2:433F  c746fa0000           mov word ptr [bp - 6], 0
loc_4344:
2:4344  837efa00             cmp word ptr [bp - 6], 0
2:4348  747e                 je 0x43c8
2:434A  c45e06               les bx, ptr [bp + 6]
2:434D  268b4716             mov ax, word ptr es:[bx + 0x16]
2:4351  260b4714             or ax, word ptr es:[bx + 0x14]
2:4355  751d                 jne 0x4374
2:4357  c9                   leave
2:4358  ca0600               retf 6
2:435B  db 90
loc_435C:
2:435C  268b470c             mov ax, word ptr es:[bx + 0xc]
2:4360  260b470a             or ax, word ptr es:[bx + 0xa]
2:4364  7507                 jne 0x436d
2:4366  06                   push es
2:4367  53                   push bx
2:4368  90                   nop
2:4369  0e                   push cs
2:436A  e8c704               call 0x4834  ; sub_s2:4834
loc_436D:
2:436D  c746fa0100           mov word ptr [bp - 6], 1
2:4372  ebd0                 jmp 0x4344
loc_4374:
2:4374  66c746fc00000000     mov dword ptr [bp - 4], 0
2:437C  eb04                 jmp 0x4382
loc_437E:
2:437E  66ff46fc             inc dword ptr [bp - 4]
loc_4382:
2:4382  668b46fc             mov eax, dword ptr [bp - 4]
2:4386  8b56fe               mov dx, word ptr [bp - 2]
2:4389  c45e06               les bx, ptr [bp + 6]
2:438C  26c45f10             les bx, ptr es:[bx + 0x10]
2:4390  6626394708           cmp dword ptr es:[bx + 8], eax
2:4395  7e31                 jle 0x43c8
2:4397  666a00               push 0
2:439A  52                   push dx
2:439B  50                   push ax
2:439C  66ff7606             push dword ptr [bp + 6]
2:43A0  90                   nop
2:43A1  0e                   push cs
2:43A2  e89f01               call 0x4544  ; sub_s2:4544
2:43A5  8946f6               mov word ptr [bp - 0xa], ax
2:43A8  c45e06               les bx, ptr [bp + 6]
2:43AB  26c45f10             les bx, ptr es:[bx + 0x10]
2:43AF  26ff7704             push word ptr es:[bx + 4]
2:43B3  8a460a               mov al, byte ptr [bp + 0xa]
2:43B6  2ae4                 sub ah, ah
2:43B8  50                   push ax
2:43B9  52                   push dx
2:43BA  ff76f6               push word ptr [bp - 0xa]
2:43BD  9a06499242           lcall 0x4292, 0x4906  ; sub_s1:4906
2:43C2  83c408               add sp, 8
2:43C5  ebb7                 jmp 0x437e
2:43C7  db 90
loc_43C8:
2:43C8  c9                   leave
2:43C9  ca0600               retf 6

; ---------------- sub_s2:43CC FAR size=90 callers=1
2:43CC  c8060000             enter 6, 0
2:43D0  c45e06               les bx, ptr [bp + 6]
2:43D3  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:43D9  7507                 jne 0x43e2
2:43DB  06                   push es
2:43DC  53                   push bx
2:43DD  90                   nop
2:43DE  0e                   push cs
2:43DF  e8ea03               call 0x47cc  ; sub_s2:47CC
loc_43E2:
2:43E2  c45e06               les bx, ptr [bp + 6]
2:43E5  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:43EB  7513                 jne 0x4400
2:43ED  c746fe0000           mov word ptr [bp - 2], 0
loc_43F2:
2:43F2  837efe00             cmp word ptr [bp - 2], 0
2:43F6  751e                 jne 0x4416
2:43F8  33c0                 xor ax, ax
2:43FA  99                   cdq
2:43FB  c9                   leave
2:43FC  ca0400               retf 4
2:43FF  db 90
loc_4400:
2:4400  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:4406  7507                 jne 0x440f
2:4408  06                   push es
2:4409  53                   push bx
2:440A  90                   nop
2:440B  0e                   push cs
2:440C  e82504               call 0x4834  ; sub_s2:4834
loc_440F:
2:440F  c746fe0100           mov word ptr [bp - 2], 1
2:4414  ebdc                 jmp 0x43f2
loc_4416:
2:4416  c45e06               les bx, ptr [bp + 6]
2:4419  268b4714             mov ax, word ptr es:[bx + 0x14]
2:441D  268b5716             mov dx, word ptr es:[bx + 0x16]
2:4421  c9                   leave
2:4422  ca0400               retf 4
2:4425  db 00

; ---------------- sub_s2:4426 FAR size=90 callers=0
2:4426  c8060000             enter 6, 0
2:442A  c45e06               les bx, ptr [bp + 6]
2:442D  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4433  7507                 jne 0x443c
2:4435  06                   push es
2:4436  53                   push bx
2:4437  90                   nop
2:4438  0e                   push cs
2:4439  e89003               call 0x47cc  ; sub_s2:47CC
loc_443C:
2:443C  c45e06               les bx, ptr [bp + 6]
2:443F  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4445  7513                 jne 0x445a
2:4447  c746fe0000           mov word ptr [bp - 2], 0
loc_444C:
2:444C  837efe00             cmp word ptr [bp - 2], 0
2:4450  751e                 jne 0x4470
2:4452  33c0                 xor ax, ax
2:4454  99                   cdq
2:4455  c9                   leave
2:4456  ca0400               retf 4
2:4459  db 90
loc_445A:
2:445A  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:4460  7507                 jne 0x4469
2:4462  06                   push es
2:4463  53                   push bx
2:4464  90                   nop
2:4465  0e                   push cs
2:4466  e8cb03               call 0x4834  ; sub_s2:4834
loc_4469:
2:4469  c746fe0100           mov word ptr [bp - 2], 1
2:446E  ebdc                 jmp 0x444c
loc_4470:
2:4470  c45e06               les bx, ptr [bp + 6]
2:4473  268b470a             mov ax, word ptr es:[bx + 0xa]
2:4477  268b570c             mov dx, word ptr es:[bx + 0xc]
2:447B  c9                   leave
2:447C  ca0400               retf 4
2:447F  db 00

; ---------------- sub_s2:4480 FAR size=196 callers=15
2:4480  c81a0000             enter 0x1a, 0
2:4484  8d46fe               lea ax, [bp - 2]
2:4487  16                   push ss
2:4488  50                   push ax
2:4489  8d46fc               lea ax, [bp - 4]
2:448C  16                   push ss
2:448D  50                   push ax
2:448E  66ff760a             push dword ptr [bp + 0xa]
2:4492  90                   nop
2:4493  0e                   push cs
2:4494  e8fdf9               call 0x3e94  ; sub_s2:3E94
2:4497  66ff760e             push dword ptr [bp + 0xe]
2:449B  90                   nop
2:449C  0e                   push cs
2:449D  e8d202               call 0x4772  ; sub_s2:4772
2:44A0  8ec2                 mov es, dx
2:44A2  8bd8                 mov bx, ax
2:44A4  8946f8               mov word ptr [bp - 8], ax
2:44A7  8c46fa               mov word ptr [bp - 6], es
2:44AA  268b4704             mov ax, word ptr es:[bx + 4]
2:44AE  8946f6               mov word ptr [bp - 0xa], ax
2:44B1  268b4708             mov ax, word ptr es:[bx + 8]
2:44B5  8946f4               mov word ptr [bp - 0xc], ax
2:44B8  c746f20000           mov word ptr [bp - 0xe], 0
2:44BD  eb04                 jmp 0x44c3
2:44BF  db 90
loc_44C0:
2:44C0  ff46f2               inc word ptr [bp - 0xe]
loc_44C3:
2:44C3  8b46f4               mov ax, word ptr [bp - 0xc]
2:44C6  3946f2               cmp word ptr [bp - 0xe], ax
2:44C9  7d75                 jge 0x4540
2:44CB  660fbf46fe           movsx eax, word ptr [bp - 2]
2:44D0  6650                 push eax
2:44D2  8b46fc               mov ax, word ptr [bp - 4]
2:44D5  ff46fc               inc word ptr [bp - 4]
2:44D8  99                   cdq
2:44D9  52                   push dx
2:44DA  50                   push ax
2:44DB  66ff7606             push dword ptr [bp + 6]
2:44DF  90                   nop
2:44E0  0e                   push cs
2:44E1  e86000               call 0x4544  ; sub_s2:4544
2:44E4  8946ee               mov word ptr [bp - 0x12], ax
2:44E7  8956f0               mov word ptr [bp - 0x10], dx
2:44EA  666a00               push 0
2:44ED  660fbf46f2           movsx eax, word ptr [bp - 0xe]
2:44F2  6650                 push eax
2:44F4  66ff760e             push dword ptr [bp + 0xe]
2:44F8  90                   nop
2:44F9  0e                   push cs
2:44FA  e84700               call 0x4544  ; sub_s2:4544
2:44FD  8946ea               mov word ptr [bp - 0x16], ax
2:4500  8956ec               mov word ptr [bp - 0x14], dx
2:4503  8b46f6               mov ax, word ptr [bp - 0xa]
2:4506  8946e8               mov word ptr [bp - 0x18], ax
loc_4509:
2:4509  8b46e8               mov ax, word ptr [bp - 0x18]
2:450C  ff4ee8               dec word ptr [bp - 0x18]
2:450F  0bc0                 or ax, ax
2:4511  74ad                 je 0x44c0
2:4513  c45eea               les bx, ptr [bp - 0x16]
2:4516  26803fff             cmp byte ptr es:[bx], 0xff
2:451A  7409                 je 0x4525
2:451C  268a07               mov al, byte ptr es:[bx]
2:451F  c45eee               les bx, ptr [bp - 0x12]
2:4522  268807               mov byte ptr es:[bx], al
loc_4525:
2:4525  8346ea01             add word ptr [bp - 0x16], 1
2:4529  1bc0                 sbb ax, ax
2:452B  253845               and ax, 0x4538  ; OFFSET KERNEL.__AHINCR
2:452E  0146ec               add word ptr [bp - 0x14], ax
2:4531  8346ee01             add word ptr [bp - 0x12], 1
2:4535  1bc0                 sbb ax, ax
2:4537  25ffff               and ax, 0xffff  ; OFFSET KERNEL.__AHINCR
2:453A  0146f0               add word ptr [bp - 0x10], ax
2:453D  ebca                 jmp 0x4509
2:453F  db 90
loc_4540:
2:4540  c9                   leave
2:4541  ca0c00               retf 0xc

; ---------------- sub_s2:4544 FAR size=146 callers=8
2:4544  c80a0000             enter 0xa, 0
2:4548  c45e06               les bx, ptr [bp + 6]
2:454B  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4551  7507                 jne 0x455a
2:4553  06                   push es
2:4554  53                   push bx
2:4555  90                   nop
2:4556  0e                   push cs
2:4557  e87202               call 0x47cc  ; sub_s2:47CC
loc_455A:
2:455A  c45e06               les bx, ptr [bp + 6]
2:455D  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4563  7513                 jne 0x4578
2:4565  c746fa0000           mov word ptr [bp - 6], 0
loc_456A:
2:456A  837efa00             cmp word ptr [bp - 6], 0
2:456E  751e                 jne 0x458e
2:4570  33c0                 xor ax, ax
2:4572  99                   cdq
2:4573  c9                   leave
2:4574  ca0c00               retf 0xc
2:4577  db 90
loc_4578:
2:4578  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:457E  7507                 jne 0x4587
2:4580  06                   push es
2:4581  53                   push bx
2:4582  90                   nop
2:4583  0e                   push cs
2:4584  e8ad02               call 0x4834  ; sub_s2:4834
loc_4587:
2:4587  c746fa0100           mov word ptr [bp - 6], 1
2:458C  ebdc                 jmp 0x456a
loc_458E:
2:458E  c45e06               les bx, ptr [bp + 6]
2:4591  26c45f10             les bx, ptr es:[bx + 0x10]
2:4595  66268b4708           mov eax, dword ptr es:[bx + 8]
2:459A  662b460a             sub eax, dword ptr [bp + 0xa]
2:459E  6648                 dec eax
2:45A0  6689460a             mov dword ptr [bp + 0xa], eax
2:45A4  6650                 push eax
2:45A6  c45e06               les bx, ptr [bp + 6]
2:45A9  66268b4718           mov eax, dword ptr es:[bx + 0x18]
2:45AE  6659                 pop ecx
2:45B0  66f7e1               mul ecx
2:45B3  6603460e             add eax, dword ptr [bp + 0xe]
2:45B7  668bd0               mov edx, eax
2:45BA  66c1ea10             shr edx, 0x10
2:45BE  c45e06               les bx, ptr [bp + 6]
2:45C1  26034714             add ax, word ptr es:[bx + 0x14]
2:45C5  83d200               adc dx, 0
2:45C8  b9ffff               mov cx, 0xffff  ; OFFSET KERNEL.__AHSHIFT
2:45CB  d3e2                 shl dx, cl
2:45CD  26035716             add dx, word ptr es:[bx + 0x16]
2:45D1  c9                   leave
2:45D2  ca0c00               retf 0xc
2:45D5  db 00

; ---------------- BlitDib_s2_45D6@s2:45D6 FAR size=132 callers=0
;   apis: GDI.SetDIBitsToDevice
2:45D6  c8080000             enter 8, 0
2:45DA  56                   push si
2:45DB  c45e06               les bx, ptr [bp + 6]
2:45DE  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:45E4  7507                 jne 0x45ed
2:45E6  06                   push es
2:45E7  53                   push bx
2:45E8  90                   nop
2:45E9  0e                   push cs
2:45EA  e8df01               call 0x47cc  ; sub_s2:47CC
loc_45ED:
2:45ED  c45e06               les bx, ptr [bp + 6]
2:45F0  268b4708             mov ax, word ptr es:[bx + 8]
2:45F4  260b4706             or ax, word ptr es:[bx + 6]
2:45F8  7510                 jne 0x460a
2:45FA  c746fc0000           mov word ptr [bp - 4], 0
loc_45FF:
2:45FF  837efc00             cmp word ptr [bp - 4], 0
2:4603  751d                 jne 0x4622
2:4605  5e                   pop si
2:4606  c9                   leave
2:4607  ca0c00               retf 0xc
loc_460A:
2:460A  268b470c             mov ax, word ptr es:[bx + 0xc]
2:460E  260b470a             or ax, word ptr es:[bx + 0xa]
2:4612  7507                 jne 0x461b
2:4614  06                   push es
2:4615  53                   push bx
2:4616  90                   nop
2:4617  0e                   push cs
2:4618  e81902               call 0x4834  ; sub_s2:4834
loc_461B:
2:461B  c746fc0100           mov word ptr [bp - 4], 1
2:4620  ebdd                 jmp 0x45ff
loc_4622:
2:4622  c45e0e               les bx, ptr [bp + 0xe]
2:4625  26ff37               push word ptr es:[bx]
2:4628  66ff760a             push dword ptr [bp + 0xa]
2:462C  c45e06               les bx, ptr [bp + 6]
2:462F  26c45f10             les bx, ptr es:[bx + 0x10]
2:4633  26ff7704             push word ptr es:[bx + 4]
2:4637  268b4708             mov ax, word ptr es:[bx + 8]
2:463B  50                   push ax
2:463C  666a00               push 0
2:463F  6a00                 push 0
2:4641  50                   push ax
2:4642  8cc0                 mov ax, es
2:4644  c47606               les si, ptr [bp + 6]
2:4647  6626ff7414           push dword ptr es:[si + 0x14]
2:464C  50                   push ax
2:464D  53                   push bx
2:464E  6a00                 push 0
2:4650  9affff0000           lcall 0, 0xffff  ; GDI.SetDIBitsToDevice
2:4655  5e                   pop si
2:4656  c9                   leave
2:4657  ca0c00               retf 0xc

; ---------------- BlitDib_s2_465A@s2:465A size=138 callers=0
;   apis: GDI.StretchDIBits
2:465A  c8060000             enter 6, 0
2:465E  56                   push si
2:465F  c45e06               les bx, ptr [bp + 6]
2:4662  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4668  7507                 jne 0x4671
2:466A  06                   push es
2:466B  53                   push bx
2:466C  90                   nop
2:466D  0e                   push cs
2:466E  e85b01               call 0x47cc  ; sub_s2:47CC
loc_4671:
2:4671  c45e06               les bx, ptr [bp + 6]
2:4674  268b4708             mov ax, word ptr es:[bx + 8]
2:4678  260b4706             or ax, word ptr es:[bx + 6]
2:467C  7510                 jne 0x468e
2:467E  c746fe0000           mov word ptr [bp - 2], 0
loc_4683:
2:4683  837efe00             cmp word ptr [bp - 2], 0
2:4687  751d                 jne 0x46a6
2:4689  5e                   pop si
2:468A  c9                   leave
2:468B  ca0c00               retf 0xc
loc_468E:
2:468E  268b470c             mov ax, word ptr es:[bx + 0xc]
2:4692  260b470a             or ax, word ptr es:[bx + 0xa]
2:4696  7507                 jne 0x469f
2:4698  06                   push es
2:4699  53                   push bx
2:469A  90                   nop
2:469B  0e                   push cs
2:469C  e89501               call 0x4834  ; sub_s2:4834
loc_469F:
2:469F  c746fe0100           mov word ptr [bp - 2], 1
2:46A4  ebdd                 jmp 0x4683
loc_46A6:
2:46A6  c45e0e               les bx, ptr [bp + 0xe]
2:46A9  26ff37               push word ptr es:[bx]
2:46AC  66ff760a             push dword ptr [bp + 0xa]
2:46B0  c45e06               les bx, ptr [bp + 6]
2:46B3  26c45f10             les bx, ptr es:[bx + 0x10]
2:46B7  268b4704             mov ax, word ptr es:[bx + 4]
2:46BB  50                   push ax
2:46BC  268b4f08             mov cx, word ptr es:[bx + 8]
2:46C0  51                   push cx
2:46C1  666a00               push 0
2:46C4  50                   push ax
2:46C5  51                   push cx
2:46C6  8cc0                 mov ax, es
2:46C8  c47606               les si, ptr [bp + 6]
2:46CB  6626ff7414           push dword ptr es:[si + 0x14]
2:46D0  50                   push ax
2:46D1  53                   push bx
2:46D2  6668cc000000         push 0xcc  ; 'nomono2'
2:46D8  6a20                 push 0x20  ; 'New failed in Op::Op'
2:46DA  9affff0000           lcall 0, 0xffff  ; GDI.StretchDIBits
2:46DF  5e                   pop si
2:46E0  c9                   leave
2:46E1  ca0c00               retf 0xc

; ---------------- sub_s2:46E4 FAR size=142 callers=1
;   apis: USER.RealizePalette, USER.SelectPalette
2:46E4  c8060000             enter 6, 0
2:46E8  c45e06               les bx, ptr [bp + 6]
2:46EB  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:46F1  7507                 jne 0x46fa
2:46F3  06                   push es
2:46F4  53                   push bx
2:46F5  90                   nop
2:46F6  0e                   push cs
2:46F7  e8d200               call 0x47cc  ; sub_s2:47CC
loc_46FA:
2:46FA  c45e06               les bx, ptr [bp + 6]
2:46FD  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4703  7511                 jne 0x4716
2:4705  c746fe0000           mov word ptr [bp - 2], 0
loc_470A:
2:470A  837efe00             cmp word ptr [bp - 2], 0
2:470E  751c                 jne 0x472c
2:4710  33c0                 xor ax, ax
2:4712  c9                   leave
2:4713  ca0800               retf 8
loc_4716:
2:4716  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:471C  7507                 jne 0x4725
2:471E  06                   push es
2:471F  53                   push bx
2:4720  90                   nop
2:4721  0e                   push cs
2:4722  e80f01               call 0x4834  ; sub_s2:4834
loc_4725:
2:4725  c746fe0100           mov word ptr [bp - 2], 1
2:472A  ebde                 jmp 0x470a
loc_472C:
2:472C  c45e06               les bx, ptr [bp + 6]
2:472F  6626ff770a           push dword ptr es:[bx + 0xa]
2:4734  90                   nop
2:4735  0e                   push cs
2:4736  e8ff06               call 0x4e38  ; CreateGamePalette_s2_4E38@s2:4E38
2:4739  c45e06               les bx, ptr [bp + 6]
2:473C  2689470e             mov word ptr es:[bx + 0xe], ax
2:4740  c45e0a               les bx, ptr [bp + 0xa]
2:4743  26ff37               push word ptr es:[bx]
2:4746  c45e06               les bx, ptr [bp + 6]
2:4749  26ff770e             push word ptr es:[bx + 0xe]
2:474D  6a00                 push 0
2:474F  9ac33c0000           lcall 0, 0x3cc3  ; USER.SelectPalette
2:4754  c45e06               les bx, ptr [bp + 6]
2:4757  26894704             mov word ptr es:[bx + 4], ax
2:475B  c45e0a               les bx, ptr [bp + 0xa]
2:475E  26ff37               push word ptr es:[bx]
2:4761  9affff0000           lcall 0, 0xffff  ; USER.RealizePalette
2:4766  c45e06               les bx, ptr [bp + 6]
2:4769  268b4704             mov ax, word ptr es:[bx + 4]
2:476D  c9                   leave
2:476E  ca0800               retf 8
2:4771  db 00

; ---------------- sub_s2:4772 FAR size=90 callers=41
2:4772  c8060000             enter 6, 0
2:4776  c45e06               les bx, ptr [bp + 6]
2:4779  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:477F  7507                 jne 0x4788
2:4781  06                   push es
2:4782  53                   push bx
2:4783  90                   nop
2:4784  0e                   push cs
2:4785  e84400               call 0x47cc  ; sub_s2:47CC
loc_4788:
2:4788  c45e06               les bx, ptr [bp + 6]
2:478B  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:4791  7513                 jne 0x47a6
2:4793  c746fe0000           mov word ptr [bp - 2], 0
loc_4798:
2:4798  837efe00             cmp word ptr [bp - 2], 0
2:479C  751e                 jne 0x47bc
2:479E  33c0                 xor ax, ax
2:47A0  99                   cdq
2:47A1  c9                   leave
2:47A2  ca0400               retf 4
2:47A5  db 90
loc_47A6:
2:47A6  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:47AC  7507                 jne 0x47b5
2:47AE  06                   push es
2:47AF  53                   push bx
2:47B0  90                   nop
2:47B1  0e                   push cs
2:47B2  e87f00               call 0x4834  ; sub_s2:4834
loc_47B5:
2:47B5  c746fe0100           mov word ptr [bp - 2], 1
2:47BA  ebdc                 jmp 0x4798
loc_47BC:
2:47BC  c45e06               les bx, ptr [bp + 6]
2:47BF  268b4710             mov ax, word ptr es:[bx + 0x10]
2:47C3  268b5712             mov dx, word ptr es:[bx + 0x12]
2:47C7  c9                   leave
2:47C8  ca0400               retf 4
2:47CB  db 00

; ---------------- sub_s2:47CC FAR size=104 callers=12
2:47CC  55                   push bp
2:47CD  8bec                 mov bp, sp
2:47CF  c45e06               les bx, ptr [bp + 6]
2:47D2  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:47D8  7456                 je 0x4830
2:47DA  66268b4706           mov eax, dword ptr es:[bx + 6]
2:47DF  268b5708             mov dx, word ptr es:[bx + 8]
2:47E3  050e00               add ax, 0xe
2:47E6  6626894710           mov dword ptr es:[bx + 0x10], eax
2:47EB  052804               add ax, 0x428
2:47EE  1bc9                 sbb cx, cx
2:47F0  81e12c45             and cx, 0x452c  ; OFFSET KERNEL.__AHINCR
2:47F4  03d1                 add dx, cx
2:47F6  26894714             mov word ptr es:[bx + 0x14], ax
2:47FA  26895716             mov word ptr es:[bx + 0x16], dx
2:47FE  666a20               push 0x20  ; 'New failed in Op::Op'
2:4801  26c45f10             les bx, ptr es:[bx + 0x10]
2:4805  6626ff7704           push dword ptr es:[bx + 4]
2:480A  6a00                 push 0
2:480C  26ff770e             push word ptr es:[bx + 0xe]
2:4810  6658                 pop eax
2:4812  6659                 pop ecx
2:4814  66f7e9               imul ecx
2:4817  66051f000000         add eax, 0x1f
2:481D  6659                 pop ecx
2:481F  6699                 cdq
2:4821  66f7f9               idiv ecx
2:4824  66c1e002             shl eax, 2
2:4828  c45e06               les bx, ptr [bp + 6]
2:482B  6626894718           mov dword ptr es:[bx + 0x18], eax
loc_4830:
2:4830  c9                   leave
2:4831  ca0400               retf 4

; ---------------- sub_s2:4834 FAR size=118 callers=12
2:4834  c8080000             enter 8, 0
2:4838  c45e06               les bx, ptr [bp + 6]
2:483B  268b470a             mov ax, word ptr es:[bx + 0xa]
2:483F  268b570c             mov dx, word ptr es:[bx + 0xc]
2:4843  8bda                 mov bx, dx
2:4845  8946f8               mov word ptr [bp - 8], ax
2:4848  8956fa               mov word ptr [bp - 6], dx
2:484B  0bd8                 or bx, ax
2:484D  740e                 je 0x485d
2:484F  6a01                 push 1
2:4851  52                   push dx
2:4852  50                   push ax
2:4853  8ec2                 mov es, dx
2:4855  8bd8                 mov bx, ax
2:4857  26c41f               les bx, ptr es:[bx]
2:485A  26ff1f               lcall es:[bx]
loc_485D:
2:485D  6a14                 push 0x14
2:485F  9a9c17c043           lcall 0x43c0, 0x179c  ; operator_new@s1:179C
2:4864  83c402               add sp, 2
2:4867  8946f8               mov word ptr [bp - 8], ax
2:486A  8956fa               mov word ptr [bp - 6], dx
2:486D  0bd0                 or dx, ax
2:486F  7429                 je 0x489a
2:4871  680001               push 0x100
2:4874  c45e06               les bx, ptr [bp + 6]
2:4877  66268b4710           mov eax, dword ptr es:[bx + 0x10]
2:487C  052800               add ax, 0x28
2:487F  6650                 push eax
2:4881  66ff76f8             push dword ptr [bp - 8]
2:4885  90                   nop
2:4886  0e                   push cs
2:4887  e80e04               call 0x4c98  ; sub_s2:4C98
2:488A  c45e06               les bx, ptr [bp + 6]
2:488D  2689470a             mov word ptr es:[bx + 0xa], ax
2:4891  2689570c             mov word ptr es:[bx + 0xc], dx
2:4895  c9                   leave
2:4896  ca0400               retf 4
2:4899  db 90
loc_489A:
2:489A  c45e06               les bx, ptr [bp + 6]
2:489D  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
2:48A6  c9                   leave
2:48A7  ca0400               retf 4

; ---------------- sub_s2:48AA FAR size=14 callers=0
2:48AA  55                   push bp
2:48AB  8bec                 mov bp, sp
2:48AD  c45e06               les bx, ptr [bp + 6]
2:48B0  268b470e             mov ax, word ptr es:[bx + 0xe]
2:48B4  c9                   leave
2:48B5  ca0400               retf 4

; ---------------- sub_s2:48B8 FAR size=70 callers=0
2:48B8  55                   push bp
2:48B9  8bec                 mov bp, sp
2:48BB  66ff7606             push dword ptr [bp + 6]
2:48BF  90                   nop
2:48C0  0e                   push cs
2:48C1  e8f8f8               call 0x41bc  ; sub_s2:41BC
2:48C4  f6460a01             test byte ptr [bp + 0xa], 1
2:48C8  7409                 je 0x48d3
2:48CA  66ff7606             push dword ptr [bp + 6]
2:48CE  9ace176248           lcall 0x4862, 0x17ce  ; operator_delete@s1:17CE
loc_48D3:
2:48D3  8b4606               mov ax, word ptr [bp + 6]
2:48D6  8b5608               mov dx, word ptr [bp + 8]
2:48D9  c9                   leave
2:48DA  ca0600               retf 6
2:48DD  db 90 b8 48 e4 48 d6 45 e8 48 e4 46 ec 48 e2 56 f0
2:48ED  db 48 5a 46 f4 48 26 44 f8 48 aa 48 fc 48 74 42 cd
2:48FD  db 41

; ---------------- sub_s2:48FE FAR size=110 callers=6
2:48FE  c8040000             enter 4, 0
2:4902  c45e06               les bx, ptr [bp + 6]
2:4905  26c7079a38           mov word ptr es:[bx], 0x389a
2:490A  26c747024e49         mov word ptr es:[bx + 2], 0x494e  ; SEGMENT s2:0000
2:4910  c45e06               les bx, ptr [bp + 6]
2:4913  662bc0               sub eax, eax
2:4916  6626894704           mov dword ptr es:[bx + 4], eax
2:491B  6626894708           mov dword ptr es:[bx + 8], eax
2:4920  26c7470cffff         mov word ptr es:[bx + 0xc], 0xffff
2:4926  662689470e           mov dword ptr es:[bx + 0xe], eax
2:492B  6626894712           mov dword ptr es:[bx + 0x12], eax
2:4930  6626894716           mov dword ptr es:[bx + 0x16], eax
2:4935  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:493A  2689471e             mov word ptr es:[bx + 0x1e], ax
2:493E  8b460a               mov ax, word ptr [bp + 0xa]
2:4941  26894722             mov word ptr es:[bx + 0x22], ax
2:4945  26c7074c4c           mov word ptr es:[bx], 0x4c4c
2:494A  26c74702e048         mov word ptr es:[bx + 2], 0x48e0  ; SEGMENT s2:0000
2:4950  66ff760c             push dword ptr [bp + 0xc]
2:4954  90                   nop
2:4955  0e                   push cs
2:4956  e88f17               call 0x60e8  ; sub_s2:60E8
2:4959  c45e06               les bx, ptr [bp + 6]
2:495C  26894708             mov word ptr es:[bx + 8], ax
2:4960  2689570a             mov word ptr es:[bx + 0xa], dx
2:4964  8bc3                 mov ax, bx
2:4966  8cc2                 mov dx, es
2:4968  c9                   leave
2:4969  ca0a00               retf 0xa

; ---------------- sub_s2:496C FAR size=124 callers=7
;   apis: KERNEL._lclose
2:496C  c80c0000             enter 0xc, 0
2:4970  56                   push si
2:4971  c45e06               les bx, ptr [bp + 6]
2:4974  26c7074c4c           mov word ptr es:[bx], 0x4c4c
2:4979  26c74702e149         mov word ptr es:[bx + 2], 0x49e1  ; SEGMENT s2:0000
2:497F  268b4704             mov ax, word ptr es:[bx + 4]
2:4983  268b5706             mov dx, word ptr es:[bx + 6]
2:4987  8bda                 mov bx, dx
2:4989  0bd0                 or dx, ax
2:498B  740e                 je 0x499b
2:498D  6a01                 push 1
2:498F  53                   push bx
2:4990  50                   push ax
2:4991  8ec3                 mov es, bx
2:4993  8bf0                 mov si, ax
2:4995  26c41c               les bx, ptr es:[si]
2:4998  26ff1f               lcall es:[bx]
loc_499B:
2:499B  c45e06               les bx, ptr [bp + 6]
2:499E  66268b4708           mov eax, dword ptr es:[bx + 8]
2:49A3  6650                 push eax
2:49A5  9ace17c049           lcall 0x49c0, 0x17ce  ; operator_delete@s1:17CE
2:49AA  83c404               add sp, 4
2:49AD  c45e06               les bx, ptr [bp + 6]
2:49B0  6626837f1a00         cmp dword ptr es:[bx + 0x1a], 0
2:49B6  740a                 je 0x49c2
2:49B8  6626ff771a           push dword ptr es:[bx + 0x1a]
2:49BD  9ac60dd148           lcall 0x48d1, 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_49C2:
2:49C2  c45e06               les bx, ptr [bp + 6]
2:49C5  26837f0cff           cmp word ptr es:[bx + 0xc], -1
2:49CA  7409                 je 0x49d5
2:49CC  26ff770c             push word ptr es:[bx + 0xc]
2:49D0  9affff0000           lcall 0, 0xffff  ; KERNEL._lclose
loc_49D5:
2:49D5  c45e06               les bx, ptr [bp + 6]
2:49D8  26c7079a38           mov word ptr es:[bx], 0x389a
2:49DD  26c747020e49         mov word ptr es:[bx + 2], 0x490e  ; SEGMENT s2:0000
2:49E3  5e                   pop si
2:49E4  c9                   leave
2:49E5  ca0400               retf 4

; ---------------- sub_s2:49E8 FAR size=374 callers=1
;   apis: KERNEL._hread, KERNEL._lclose, KERNEL._llseek, KERNEL._lopen
2:49E8  c81a0000             enter 0x1a, 0
2:49EC  c45e06               les bx, ptr [bp + 6]
2:49EF  6626837f0800         cmp dword ptr es:[bx + 8], 0
2:49F5  7507                 jne 0x49fe
loc_49F7:
2:49F7  33c0                 xor ax, ax
2:49F9  c9                   leave
2:49FA  ca0400               retf 4
2:49FD  db 90
loc_49FE:
2:49FE  26837f1e00           cmp word ptr es:[bx + 0x1e], 0
2:4A03  7407                 je 0x4a0c
loc_4A05:
2:4A05  b80100               mov ax, 1
2:4A08  c9                   leave
2:4A09  ca0400               retf 4
loc_4A0C:
2:4A0C  26837f0cff           cmp word ptr es:[bx + 0xc], -1
2:4A11  7518                 jne 0x4a2b
2:4A13  6626ff7708           push dword ptr es:[bx + 8]
2:4A18  6a00                 push 0
2:4A1A  9affff0000           lcall 0, 0xffff  ; KERNEL._lopen
2:4A1F  c45e06               les bx, ptr [bp + 6]
2:4A22  2689470c             mov word ptr es:[bx + 0xc], ax
2:4A26  3dffff               cmp ax, 0xffff
2:4A29  74cc                 je 0x49f7
loc_4A2B:
2:4A2B  66c746fc00000000     mov dword ptr [bp - 4], 0
2:4A33  c45e06               les bx, ptr [bp + 6]
2:4A36  26ff770c             push word ptr es:[bx + 0xc]
2:4A3A  8d46ea               lea ax, [bp - 0x16]
2:4A3D  16                   push ss
2:4A3E  50                   push ax
2:4A3F  666a0e               push 0xe
2:4A42  9abe4a0000           lcall 0, 0x4abe  ; KERNEL._hread
2:4A47  3d0e00               cmp ax, 0xe
2:4A4A  7504                 jne 0x4a50
2:4A4C  0bd2                 or dx, dx
2:4A4E  7418                 je 0x4a68
loc_4A50:
2:4A50  c45e06               les bx, ptr [bp + 6]
2:4A53  26ff770c             push word ptr es:[bx + 0xc]
2:4A57  9ad04a0000           lcall 0, 0x4ad0  ; KERNEL._lclose
2:4A5C  c45e06               les bx, ptr [bp + 6]
2:4A5F  26c7470cffff         mov word ptr es:[bx + 0xc], 0xffff
2:4A65  eb90                 jmp 0x49f7
2:4A67  db 90
loc_4A68:
2:4A68  668b46ec             mov eax, dword ptr [bp - 0x14]
2:4A6C  668946fc             mov dword ptr [bp - 4], eax
2:4A70  817eea424d           cmp word ptr [bp - 0x16], 0x4d42
2:4A75  75d9                 jne 0x4a50
2:4A77  c45e06               les bx, ptr [bp + 6]
2:4A7A  26ff770c             push word ptr es:[bx + 0xc]
2:4A7E  666a00               push 0
2:4A81  6a00                 push 0
2:4A83  9affff0000           lcall 0, 0xffff  ; KERNEL._llseek
2:4A88  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:4A8D  66ff76fc             push dword ptr [bp - 4]
2:4A91  6a01                 push 1
2:4A93  9a480a074b           lcall 0x4b07, 0xa48  ; sub_s1:0A48
2:4A98  c45e06               les bx, ptr [bp + 6]
2:4A9B  2689471a             mov word ptr es:[bx + 0x1a], ax
2:4A9F  2689571c             mov word ptr es:[bx + 0x1c], dx
2:4AA3  8bc2                 mov ax, dx
2:4AA5  260b471a             or ax, word ptr es:[bx + 0x1a]
2:4AA9  0f844aff             je 0x49f7
2:4AAD  c45e06               les bx, ptr [bp + 6]
2:4AB0  26ff770c             push word ptr es:[bx + 0xc]
2:4AB4  6626ff771a           push dword ptr es:[bx + 0x1a]
2:4AB9  66ff76fc             push dword ptr [bp - 4]
2:4ABD  9affff0000           lcall 0, 0xffff  ; KERNEL._hread
2:4AC2  8946f8               mov word ptr [bp - 8], ax
2:4AC5  8956fa               mov word ptr [bp - 6], dx
2:4AC8  c45e06               les bx, ptr [bp + 6]
2:4ACB  26ff770c             push word ptr es:[bx + 0xc]
2:4ACF  9ad1490000           lcall 0, 0x49d1  ; KERNEL._lclose
2:4AD4  c45e06               les bx, ptr [bp + 6]
2:4AD7  26c7470cffff         mov word ptr es:[bx + 0xc], 0xffff
2:4ADD  26c7471e0100         mov word ptr es:[bx + 0x1e], 1
2:4AE3  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:4AE8  662689470e           mov dword ptr es:[bx + 0xe], eax
2:4AED  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:4AF2  050e00               add ax, 0xe
2:4AF5  6626894712           mov dword ptr es:[bx + 0x12], eax
2:4AFA  052804               add ax, 0x428
2:4AFD  6626894716           mov dword ptr es:[bx + 0x16], eax
2:4B02  6a14                 push 0x14
2:4B04  9a9c17a849           lcall 0x49a8, 0x179c  ; operator_new@s1:179C
2:4B09  83c402               add sp, 2
2:4B0C  8946e6               mov word ptr [bp - 0x1a], ax
2:4B0F  8956e8               mov word ptr [bp - 0x18], dx
2:4B12  0bd0                 or dx, ax
2:4B14  7426                 je 0x4b3c
2:4B16  680001               push 0x100
2:4B19  c45e06               les bx, ptr [bp + 6]
2:4B1C  66268b4712           mov eax, dword ptr es:[bx + 0x12]
2:4B21  052800               add ax, 0x28
2:4B24  6650                 push eax
2:4B26  66ff76e6             push dword ptr [bp - 0x1a]
2:4B2A  90                   nop
2:4B2B  0e                   push cs
2:4B2C  e86901               call 0x4c98  ; sub_s2:4C98
2:4B2F  c45e06               les bx, ptr [bp + 6]
2:4B32  26894704             mov word ptr es:[bx + 4], ax
2:4B36  26895706             mov word ptr es:[bx + 6], dx
2:4B3A  eb0c                 jmp 0x4b48
loc_4B3C:
2:4B3C  c45e06               les bx, ptr [bp + 6]
2:4B3F  6626c7470400000000   mov dword ptr es:[bx + 4], 0
loc_4B48:
2:4B48  c45e06               les bx, ptr [bp + 6]
2:4B4B  26837f2200           cmp word ptr es:[bx + 0x22], 0
2:4B50  0f84b1fe             je 0x4a05
2:4B54  06                   push es
2:4B55  53                   push bx
2:4B56  90                   nop
2:4B57  0e                   push cs
2:4B58  e83300               call 0x4b8e  ; sub_s2:4B8E
2:4B5B  e9a7fe               jmp 0x4a05

; ---------------- sub_s2:4B5E FAR size=48 callers=0
2:4B5E  55                   push bp
2:4B5F  8bec                 mov bp, sp
2:4B61  c45e06               les bx, ptr [bp + 6]
2:4B64  26837f1e00           cmp word ptr es:[bx + 0x1e], 0
2:4B69  7513                 jne 0x4b7e
2:4B6B  06                   push es
2:4B6C  53                   push bx
2:4B6D  26c41f               les bx, ptr es:[bx]
2:4B70  26ff5f08             lcall es:[bx + 8]
2:4B74  0bc0                 or ax, ax
2:4B76  7506                 jne 0x4b7e
2:4B78  99                   cdq
2:4B79  c9                   leave
2:4B7A  ca0400               retf 4
2:4B7D  db 90
loc_4B7E:
2:4B7E  c45e06               les bx, ptr [bp + 6]
2:4B81  268b4704             mov ax, word ptr es:[bx + 4]
2:4B85  268b5706             mov dx, word ptr es:[bx + 6]
2:4B89  c9                   leave
2:4B8A  ca0400               retf 4
2:4B8D  db 00

; ---------------- sub_s2:4B8E FAR size=152 callers=1
2:4B8E  c8180000             enter 0x18, 0
2:4B92  6a48                 push 0x48
2:4B94  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:4B99  9aba206035           lcall 0x3560, 0x20ba  ; sub_s3:20BA
2:4B9E  8946fc               mov word ptr [bp - 4], ax
2:4BA1  8956fe               mov word ptr [bp - 2], dx
2:4BA4  c45efc               les bx, ptr [bp - 4]
2:4BA7  66268b4718           mov eax, dword ptr es:[bx + 0x18]
2:4BAC  668946f8             mov dword ptr [bp - 8], eax
2:4BB0  268b4716             mov ax, word ptr es:[bx + 0x16]
2:4BB4  99                   cdq
2:4BB5  2bc2                 sub ax, dx
2:4BB7  d1f8                 sar ax, 1
2:4BB9  8946f4               mov word ptr [bp - 0xc], ax
2:4BBC  c746f20000           mov word ptr [bp - 0xe], 0
2:4BC1  eb20                 jmp 0x4be3
2:4BC3  db 90
loc_4BC4:
2:4BC4  8b46f2               mov ax, word ptr [bp - 0xe]
2:4BC7  50                   push ax
2:4BC8  c1e002               shl ax, 2
2:4BCB  0346f8               add ax, word ptr [bp - 8]
2:4BCE  8b56fa               mov dx, word ptr [bp - 6]
2:4BD1  52                   push dx
2:4BD2  50                   push ax
2:4BD3  c45e06               les bx, ptr [bp + 6]
2:4BD6  6626ff7704           push dword ptr es:[bx + 4]
2:4BDB  90                   nop
2:4BDC  0e                   push cs
2:4BDD  e84601               call 0x4d26  ; sub_s2:4D26
2:4BE0  ff46f2               inc word ptr [bp - 0xe]
loc_4BE3:
2:4BE3  8b46f4               mov ax, word ptr [bp - 0xc]
2:4BE6  3946f2               cmp word ptr [bp - 0xe], ax
2:4BE9  7cd9                 jl 0x4bc4
2:4BEB  b80001               mov ax, 0x100
2:4BEE  2b46f4               sub ax, word ptr [bp - 0xc]
2:4BF1  8946f0               mov word ptr [bp - 0x10], ax
2:4BF4  eb24                 jmp 0x4c1a
loc_4BF6:
2:4BF6  ff76f0               push word ptr [bp - 0x10]
2:4BF9  8b46f2               mov ax, word ptr [bp - 0xe]
2:4BFC  c1e002               shl ax, 2
2:4BFF  0346f8               add ax, word ptr [bp - 8]
2:4C02  8b56fa               mov dx, word ptr [bp - 6]
2:4C05  52                   push dx
2:4C06  50                   push ax
2:4C07  c45e06               les bx, ptr [bp + 6]
2:4C0A  6626ff7704           push dword ptr es:[bx + 4]
2:4C0F  90                   nop
2:4C10  0e                   push cs
2:4C11  e81201               call 0x4d26  ; sub_s2:4D26
2:4C14  ff46f0               inc word ptr [bp - 0x10]
2:4C17  ff46f2               inc word ptr [bp - 0xe]
loc_4C1A:
2:4C1A  817ef00001           cmp word ptr [bp - 0x10], 0x100
2:4C1F  7cd5                 jl 0x4bf6
2:4C21  c9                   leave
2:4C22  ca0400               retf 4
2:4C25  db 00

; ---------------- sub_s2:4C26 FAR size=50 callers=0
2:4C26  55                   push bp
2:4C27  8bec                 mov bp, sp
2:4C29  66ff7606             push dword ptr [bp + 6]
2:4C2D  90                   nop
2:4C2E  0e                   push cs
2:4C2F  e83afd               call 0x496c  ; sub_s2:496C
2:4C32  f6460a01             test byte ptr [bp + 0xa], 1
2:4C36  7409                 je 0x4c41
2:4C38  66ff7606             push dword ptr [bp + 6]
2:4C3C  9ace17964a           lcall 0x4a96, 0x17ce  ; operator_delete@s1:17CE
loc_4C41:
2:4C41  8b4606               mov ax, word ptr [bp + 6]
2:4C44  8b5608               mov dx, word ptr [bp + 8]
2:4C47  c9                   leave
2:4C48  ca0600               retf 6
2:4C4B  db 90 26 4c 52 4c 5e 4b 56 4c e8 49 7d 49

; ---------------- sub_s2:4C58 FAR size=64 callers=6
2:4C58  c8040000             enter 4, 0
2:4C5C  c45e06               les bx, ptr [bp + 6]
2:4C5F  26c7079a38           mov word ptr es:[bx], 0x389a
2:4C64  26c747028d4c         mov word ptr es:[bx + 2], 0x4c8d  ; SEGMENT s2:0000
2:4C6A  c45e06               les bx, ptr [bp + 6]
2:4C6D  662bc0               sub eax, eax
2:4C70  6626894704           mov dword ptr es:[bx + 4], eax
2:4C75  2689470c             mov word ptr es:[bx + 0xc], ax
2:4C79  662689470e           mov dword ptr es:[bx + 0xe], eax
2:4C7E  26c747120100         mov word ptr es:[bx + 0x12], 1
2:4C84  26c7071c4f           mov word ptr es:[bx], 0x4f1c
2:4C89  26c747024e4c         mov word ptr es:[bx + 2], 0x4c4e  ; SEGMENT s2:0000
2:4C8F  8bc3                 mov ax, bx
2:4C91  8cc2                 mov dx, es
2:4C93  c9                   leave
2:4C94  ca0400               retf 4
2:4C97  db 00

; ---------------- sub_s2:4C98 FAR size=68 callers=2
2:4C98  c8040000             enter 4, 0
2:4C9C  c45e06               les bx, ptr [bp + 6]
2:4C9F  26c7079a38           mov word ptr es:[bx], 0x389a
2:4CA4  26c74702d24c         mov word ptr es:[bx + 2], 0x4cd2  ; SEGMENT s2:0000
2:4CAA  668b460a             mov eax, dword ptr [bp + 0xa]
2:4CAE  c45e06               les bx, ptr [bp + 6]
2:4CB1  6626894704           mov dword ptr es:[bx + 4], eax
2:4CB6  8b460e               mov ax, word ptr [bp + 0xe]
2:4CB9  2689470c             mov word ptr es:[bx + 0xc], ax
2:4CBD  662bc0               sub eax, eax
2:4CC0  662689470e           mov dword ptr es:[bx + 0xe], eax
2:4CC5  26894712             mov word ptr es:[bx + 0x12], ax
2:4CC9  26c7071c4f           mov word ptr es:[bx], 0x4f1c
2:4CCE  26c74702684c         mov word ptr es:[bx + 2], 0x4c68  ; SEGMENT s2:0000
2:4CD4  8bc3                 mov ax, bx
2:4CD6  8cc2                 mov dx, es
2:4CD8  c9                   leave
2:4CD9  ca0a00               retf 0xa

; ---------------- sub_s2:4CDC FAR size=74 callers=1
2:4CDC  c80c0000             enter 0xc, 0
2:4CE0  c45e06               les bx, ptr [bp + 6]
2:4CE3  26c7071c4f           mov word ptr es:[bx], 0x4f1c
2:4CE8  26c747021f4d         mov word ptr es:[bx + 2], 0x4d1f  ; SEGMENT s2:0000
2:4CEE  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:4CF3  6650                 push eax
2:4CF5  9ace17114d           lcall 0x4d11, 0x17ce  ; operator_delete@s1:17CE
2:4CFA  83c404               add sp, 4
2:4CFD  c45e06               les bx, ptr [bp + 6]
2:4D00  26837f1200           cmp word ptr es:[bx + 0x12], 0
2:4D05  740c                 je 0x4d13
2:4D07  66268b4704           mov eax, dword ptr es:[bx + 4]
2:4D0C  6650                 push eax
2:4D0E  9ace173f4c           lcall 0x4c3f, 0x17ce  ; operator_delete@s1:17CE
loc_4D13:
2:4D13  c45e06               les bx, ptr [bp + 6]
2:4D16  26c7079a38           mov word ptr es:[bx], 0x389a
2:4D1B  26c74702a84c         mov word ptr es:[bx + 2], 0x4ca8  ; SEGMENT s2:0000
2:4D21  c9                   leave
2:4D22  ca0400               retf 4
2:4D25  db 00

; ---------------- sub_s2:4D26 FAR size=76 callers=1
2:4D26  55                   push bp
2:4D27  8bec                 mov bp, sp
2:4D29  56                   push si
2:4D2A  c45e06               les bx, ptr [bp + 6]
2:4D2D  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:4D33  740f                 je 0x4d44
2:4D35  837e0e00             cmp word ptr [bp + 0xe], 0
2:4D39  7c09                 jl 0x4d44
2:4D3B  8b460e               mov ax, word ptr [bp + 0xe]
2:4D3E  2639470c             cmp word ptr es:[bx + 0xc], ax
2:4D42  7f08                 jg 0x4d4c
loc_4D44:
2:4D44  33c0                 xor ax, ax
2:4D46  5e                   pop si
2:4D47  c9                   leave
2:4D48  ca0a00               retf 0xa
2:4D4B  db 90
loc_4D4C:
2:4D4C  c45e0a               les bx, ptr [bp + 0xa]
2:4D4F  268b07               mov ax, word ptr es:[bx]
2:4D52  268b5702             mov dx, word ptr es:[bx + 2]
2:4D56  c45e06               les bx, ptr [bp + 6]
2:4D59  26c45f04             les bx, ptr es:[bx + 4]
2:4D5D  8b760e               mov si, word ptr [bp + 0xe]
2:4D60  c1e602               shl si, 2
2:4D63  268900               mov word ptr es:[bx + si], ax
2:4D66  26895002             mov word ptr es:[bx + si + 2], dx
2:4D6A  b80100               mov ax, 1
2:4D6D  5e                   pop si
2:4D6E  c9                   leave
2:4D6F  ca0a00               retf 0xa

; ---------------- sub_s2:4D72 FAR size=18 callers=9
2:4D72  55                   push bp
2:4D73  8bec                 mov bp, sp
2:4D75  c45e06               les bx, ptr [bp + 6]
2:4D78  268b4704             mov ax, word ptr es:[bx + 4]
2:4D7C  268b5706             mov dx, word ptr es:[bx + 6]
2:4D80  c9                   leave
2:4D81  ca0400               retf 4

; ---------------- sub_s2:4D84 FAR size=132 callers=9
2:4D84  c8080000             enter 8, 0
2:4D88  c45e06               les bx, ptr [bp + 6]
2:4D8B  26837f1200           cmp word ptr es:[bx + 0x12], 0
2:4D90  7444                 je 0x4dd6
2:4D92  c45e0a               les bx, ptr [bp + 0xa]
2:4D95  268b470c             mov ax, word ptr es:[bx + 0xc]
2:4D99  c45e06               les bx, ptr [bp + 6]
2:4D9C  2689470c             mov word ptr es:[bx + 0xc], ax
2:4DA0  66268b4704           mov eax, dword ptr es:[bx + 4]
2:4DA5  6650                 push eax
2:4DA7  9ace17c64d           lcall 0x4dc6, 0x17ce  ; operator_delete@s1:17CE
2:4DAC  83c404               add sp, 4
2:4DAF  c45e06               les bx, ptr [bp + 6]
2:4DB2  6626c7470400000000   mov dword ptr es:[bx + 4], 0
2:4DBB  268b470c             mov ax, word ptr es:[bx + 0xc]
2:4DBF  c1e002               shl ax, 2
2:4DC2  50                   push ax
2:4DC3  9a9c17fe4d           lcall 0x4dfe, 0x179c  ; operator_new@s1:179C
2:4DC8  83c402               add sp, 2
2:4DCB  c45e06               les bx, ptr [bp + 6]
2:4DCE  26894704             mov word ptr es:[bx + 4], ax
2:4DD2  26895706             mov word ptr es:[bx + 6], dx
loc_4DD6:
2:4DD6  c45e06               les bx, ptr [bp + 6]
2:4DD9  26817f0c0001         cmp word ptr es:[bx + 0xc], 0x100
2:4DDF  7407                 je 0x4de8
2:4DE1  33c0                 xor ax, ax
2:4DE3  c9                   leave
2:4DE4  ca0800               retf 8
2:4DE7  db 90
loc_4DE8:
2:4DE8  680004               push 0x400
2:4DEB  c45e0a               les bx, ptr [bp + 0xa]
2:4DEE  6626ff7704           push dword ptr es:[bx + 4]
2:4DF3  c45e06               les bx, ptr [bp + 6]
2:4DF6  6626ff7704           push dword ptr es:[bx + 4]
2:4DFB  9aa848f84c           lcall 0x4cf8, 0x48a8  ; sub_s1:48A8
2:4E00  b80100               mov ax, 1
2:4E03  c9                   leave
2:4E04  ca0800               retf 8
2:4E07  db 00

; ---------------- sub_s2:4E08 FAR size=48 callers=11
;   apis: USER.RealizePalette, USER.SelectPalette
2:4E08  c8020000             enter 2, 0
2:4E0C  c45e0a               les bx, ptr [bp + 0xa]
2:4E0F  26ff37               push word ptr es:[bx]
2:4E12  66ff7606             push dword ptr [bp + 6]
2:4E16  90                   nop
2:4E17  0e                   push cs
2:4E18  e81d00               call 0x4e38  ; CreateGamePalette_s2_4E38@s2:4E38
2:4E1B  50                   push ax
2:4E1C  6a00                 push 0
2:4E1E  9a50470000           lcall 0, 0x4750  ; USER.SelectPalette
2:4E23  8946fe               mov word ptr [bp - 2], ax
2:4E26  c45e0a               les bx, ptr [bp + 0xa]
2:4E29  26ff37               push word ptr es:[bx]
2:4E2C  9a62470000           lcall 0, 0x4762  ; USER.RealizePalette
2:4E31  8b46fe               mov ax, word ptr [bp - 2]
2:4E34  c9                   leave
2:4E35  ca0800               retf 8

; ---------------- CreateGamePalette_s2_4E38@s2:4E38 FAR size=190 callers=4
;   apis: GDI.CreatePalette
2:4E38  c80c0000             enter 0xc, 0
2:4E3C  c45e06               les bx, ptr [bp + 6]
2:4E3F  268b470c             mov ax, word ptr es:[bx + 0xc]
2:4E43  050200               add ax, 2
2:4E46  c1e002               shl ax, 2
2:4E49  8946fe               mov word ptr [bp - 2], ax
2:4E4C  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
2:4E52  0f859200             jne 0x4ee8
2:4E56  ff76fe               push word ptr [bp - 2]
2:4E59  9a9c17aa4d           lcall 0x4daa, 0x179c  ; operator_new@s1:179C
2:4E5E  83c402               add sp, 2
2:4E61  c45e06               les bx, ptr [bp + 6]
2:4E64  2689470e             mov word ptr es:[bx + 0xe], ax
2:4E68  26895710             mov word ptr es:[bx + 0x10], dx
2:4E6C  26c45f0e             les bx, ptr es:[bx + 0xe]
2:4E70  26c7070003           mov word ptr es:[bx], 0x300
2:4E75  c45e06               les bx, ptr [bp + 6]
2:4E78  268b470c             mov ax, word ptr es:[bx + 0xc]
2:4E7C  26c45f0e             les bx, ptr es:[bx + 0xe]
2:4E80  26894702             mov word ptr es:[bx + 2], ax
2:4E84  c45e06               les bx, ptr [bp + 6]
2:4E87  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:4E8C  050400               add ax, 4
2:4E8F  668946fa             mov dword ptr [bp - 6], eax
2:4E93  66268b4704           mov eax, dword ptr es:[bx + 4]
2:4E98  668946f6             mov dword ptr [bp - 0xa], eax
2:4E9C  c746f40000           mov word ptr [bp - 0xc], 0
2:4EA1  eb39                 jmp 0x4edc
2:4EA3  db 90
loc_4EA4:
2:4EA4  c45ef6               les bx, ptr [bp - 0xa]
2:4EA7  268a4702             mov al, byte ptr es:[bx + 2]
2:4EAB  c45efa               les bx, ptr [bp - 6]
2:4EAE  268807               mov byte ptr es:[bx], al
2:4EB1  c45ef6               les bx, ptr [bp - 0xa]
2:4EB4  268a4701             mov al, byte ptr es:[bx + 1]
2:4EB8  c45efa               les bx, ptr [bp - 6]
2:4EBB  26884701             mov byte ptr es:[bx + 1], al
2:4EBF  c45ef6               les bx, ptr [bp - 0xa]
2:4EC2  268a07               mov al, byte ptr es:[bx]
2:4EC5  c45efa               les bx, ptr [bp - 6]
2:4EC8  26884702             mov byte ptr es:[bx + 2], al
2:4ECC  26c6470300           mov byte ptr es:[bx + 3], 0
2:4ED1  ff46f4               inc word ptr [bp - 0xc]
2:4ED4  8346fa04             add word ptr [bp - 6], 4
2:4ED8  8346f604             add word ptr [bp - 0xa], 4
loc_4EDC:
2:4EDC  8b46f4               mov ax, word ptr [bp - 0xc]
2:4EDF  c45e06               les bx, ptr [bp + 6]
2:4EE2  2639470c             cmp word ptr es:[bx + 0xc], ax
2:4EE6  7fbc                 jg 0x4ea4
loc_4EE8:
2:4EE8  6626ff770e           push dword ptr es:[bx + 0xe]
2:4EED  9affff0000           lcall 0, 0xffff  ; GDI.CreatePalette
2:4EF2  c9                   leave
2:4EF3  ca0400               retf 4

; ---------------- sub_s2:4EF6 FAR size=42 callers=0
2:4EF6  55                   push bp
2:4EF7  8bec                 mov bp, sp
2:4EF9  66ff7606             push dword ptr [bp + 6]
2:4EFD  90                   nop
2:4EFE  0e                   push cs
2:4EFF  e8dafd               call 0x4cdc  ; sub_s2:4CDC
2:4F02  f6460a01             test byte ptr [bp + 0xa], 1
2:4F06  7409                 je 0x4f11
2:4F08  66ff7606             push dword ptr [bp + 6]
2:4F0C  9ace175c4e           lcall 0x4e5c, 0x17ce  ; operator_delete@s1:17CE
loc_4F11:
2:4F11  8b4606               mov ax, word ptr [bp + 6]
2:4F14  8b5608               mov dx, word ptr [bp + 8]
2:4F17  c9                   leave
2:4F18  ca0600               retf 6
2:4F1B  db 90 f6 4e ec 4c

; ---------------- sub_s2:4F20 FAR size=328 callers=1
;   apis: GDI.CreateDC, GDI.DeleteDC, GDI.DeleteObject, GDI.SetBkColor, GDI.SetTextColor, GDI.TextOut, USER.SelectPalette
2:4F20  c8360000             enter 0x36, 0
2:4F24  66ff7606             push dword ptr [bp + 6]
2:4F28  90                   nop
2:4F29  0e                   push cs
2:4F2A  e8e9f0               call 0x4016  ; sub_s2:4016
2:4F2D  668b4610             mov eax, dword ptr [bp + 0x10]
2:4F31  c45e06               les bx, ptr [bp + 6]
2:4F34  662689471e           mov dword ptr es:[bx + 0x1e], eax
2:4F39  8b460e               mov ax, word ptr [bp + 0xe]
2:4F3C  26894722             mov word ptr es:[bx + 0x22], ax
2:4F40  668b460a             mov eax, dword ptr [bp + 0xa]
2:4F44  6626894724           mov dword ptr es:[bx + 0x24], eax
2:4F49  26c707a250           mov word ptr es:[bx], 0x50a2
2:4F4E  26c747021e4f         mov word ptr es:[bx + 2], 0x4f1e  ; SEGMENT s2:0000
2:4F54  6a02                 push 2
2:4F56  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:4F5B  9a0a839c4b           lcall 0x4b9c, 0x830a  ; sub_s3:830A
2:4F60  52                   push dx
2:4F61  50                   push ax
2:4F62  6a01                 push 1
2:4F64  8d46dc               lea ax, [bp - 0x24]
2:4F67  16                   push ss
2:4F68  50                   push ax
2:4F69  90                   nop
2:4F6A  0e                   push cs
2:4F6B  e890f9               call 0x48fe  ; sub_s2:48FE
2:4F6E  8d46dc               lea ax, [bp - 0x24]
2:4F71  16                   push ss
2:4F72  50                   push ax
2:4F73  90                   nop
2:4F74  0e                   push cs
2:4F75  e870fa               call 0x49e8  ; sub_s2:49E8
2:4F78  8d46dc               lea ax, [bp - 0x24]
2:4F7B  16                   push ss
2:4F7C  50                   push ax
2:4F7D  66ff7606             push dword ptr [bp + 6]
2:4F81  90                   nop
2:4F82  0e                   push cs
2:4F83  e8e200               call 0x5068  ; sub_s2:5068
2:4F86  66ff7606             push dword ptr [bp + 6]
2:4F8A  90                   nop
2:4F8B  0e                   push cs
2:4F8C  e83df8               call 0x47cc  ; sub_s2:47CC
2:4F8F  66ff7606             push dword ptr [bp + 6]
2:4F93  90                   nop
2:4F94  0e                   push cs
2:4F95  e89cf8               call 0x4834  ; sub_s2:4834
2:4F98  1e                   push ds
2:4F99  687e02               push 0x27e  ; 'dib'
2:4F9C  666a00               push 0
2:4F9F  666a00               push 0
2:4FA2  66ff7606             push dword ptr [bp + 6]
2:4FA6  90                   nop
2:4FA7  0e                   push cs
2:4FA8  e8c7f7               call 0x4772  ; sub_s2:4772
2:4FAB  8946d8               mov word ptr [bp - 0x28], ax
2:4FAE  8956da               mov word ptr [bp - 0x26], dx
2:4FB1  52                   push dx
2:4FB2  50                   push ax
2:4FB3  9affff0000           lcall 0, 0xffff  ; GDI.CreateDC
2:4FB8  8946d6               mov word ptr [bp - 0x2a], ax
2:4FBB  8d46d6               lea ax, [bp - 0x2a]
2:4FBE  16                   push ss
2:4FBF  50                   push ax
2:4FC0  66ff7606             push dword ptr [bp + 6]
2:4FC4  90                   nop
2:4FC5  0e                   push cs
2:4FC6  e81bf7               call 0x46e4  ; sub_s2:46E4
2:4FC9  8946d4               mov word ptr [bp - 0x2c], ax
2:4FCC  ff76d6               push word ptr [bp - 0x2a]
2:4FCF  6668ffffff00         push 0xffffff
2:4FD5  9a27500000           lcall 0, 0x5027  ; GDI.SetBkColor
2:4FDA  8946d0               mov word ptr [bp - 0x30], ax
2:4FDD  8956d2               mov word ptr [bp - 0x2e], dx
2:4FE0  ff76d6               push word ptr [bp - 0x2a]
2:4FE3  c45e06               les bx, ptr [bp + 6]
2:4FE6  680001               push 0x100
2:4FE9  26ff7722             push word ptr es:[bx + 0x22]
2:4FED  9a33500000           lcall 0, 0x5033  ; GDI.SetTextColor
2:4FF2  8946cc               mov word ptr [bp - 0x34], ax
2:4FF5  8956ce               mov word ptr [bp - 0x32], dx
2:4FF8  c45e06               les bx, ptr [bp + 6]
2:4FFB  6626ff771e           push dword ptr es:[bx + 0x1e]
2:5000  9aa43d0f4f           lcall 0x4f0f, 0x3da4  ; sub_s1:3DA4
2:5005  83c404               add sp, 4
2:5008  8946ca               mov word ptr [bp - 0x36], ax
2:500B  ff76d6               push word ptr [bp - 0x2a]
2:500E  666a00               push 0
2:5011  c45e06               les bx, ptr [bp + 6]
2:5014  6626ff771e           push dword ptr es:[bx + 0x1e]
2:5019  50                   push ax
2:501A  9affff0000           lcall 0, 0xffff  ; GDI.TextOut
2:501F  ff76d6               push word ptr [bp - 0x2a]
2:5022  66ff76d0             push dword ptr [bp - 0x30]
2:5026  9affff0000           lcall 0, 0xffff  ; GDI.SetBkColor
2:502B  ff76d6               push word ptr [bp - 0x2a]
2:502E  66ff76cc             push dword ptr [bp - 0x34]
2:5032  9affff0000           lcall 0, 0xffff  ; GDI.SetTextColor
2:5037  66ff76d4             push dword ptr [bp - 0x2c]
2:503B  6a00                 push 0
2:503D  9a1f4e0000           lcall 0, 0x4e1f  ; USER.SelectPalette
2:5042  8946d4               mov word ptr [bp - 0x2c], ax
2:5045  50                   push ax
2:5046  9ac93c0000           lcall 0, 0x3cc9  ; GDI.DeleteObject
2:504B  ff76d6               push word ptr [bp - 0x2a]
2:504E  9affff0000           lcall 0, 0xffff  ; GDI.DeleteDC
2:5053  8d46dc               lea ax, [bp - 0x24]
2:5056  16                   push ss
2:5057  50                   push ax
2:5058  90                   nop
2:5059  0e                   push cs
2:505A  e80ff9               call 0x496c  ; sub_s2:496C
2:505D  8b4606               mov ax, word ptr [bp + 6]
2:5060  8b5608               mov dx, word ptr [bp + 8]
2:5063  c9                   leave
2:5064  ca0e00               retf 0xe
2:5067  db 00

; ---------------- sub_s2:5068 FAR size=20 callers=1
2:5068  55                   push bp
2:5069  8bec                 mov bp, sp
2:506B  66ff760a             push dword ptr [bp + 0xa]
2:506F  66ff7606             push dword ptr [bp + 6]
2:5073  90                   nop
2:5074  0e                   push cs
2:5075  e89cf1               call 0x4214  ; sub_s2:4214
2:5078  c9                   leave
2:5079  ca0800               retf 8

; ---------------- sub_s2:507C size=70 callers=0
2:507C  c8040000             enter 4, 0
2:5080  66ff7606             push dword ptr [bp + 6]
2:5084  90                   nop
2:5085  0e                   push cs
2:5086  e833f1               call 0x41bc  ; sub_s2:41BC
2:5089  f6460a01             test byte ptr [bp + 0xa], 1
2:508D  7409                 je 0x5098
2:508F  66ff7606             push dword ptr [bp + 6]
2:5093  9ace170350           lcall 0x5003, 0x17ce  ; operator_delete@s1:17CE
loc_5098:
2:5098  8b4606               mov ax, word ptr [bp + 6]
2:509B  8b5608               mov dx, word ptr [bp + 8]
2:509E  c9                   leave
2:509F  ca0600               retf 6
2:50A2  db 7c 50 a8 50 d6 45 ac 50 e4 46 b0 50 e2 56 b4 50
2:50B2  db 5a 46 b8 50 26 44 bc 50 aa 48 c0 50 74 42 52 4f

; ---------------- sub_s2:50C2 FAR size=86 callers=6
2:50C2  c8040000             enter 4, 0
2:50C6  c45e12               les bx, ptr [bp + 0x12]
2:50C9  268b07               mov ax, word ptr es:[bx]
2:50CC  c45e06               les bx, ptr [bp + 6]
2:50CF  268907               mov word ptr es:[bx], ax
2:50D2  c45e12               les bx, ptr [bp + 0x12]
2:50D5  268b4702             mov ax, word ptr es:[bx + 2]
2:50D9  c45e06               les bx, ptr [bp + 6]
2:50DC  26894702             mov word ptr es:[bx + 2], ax
2:50E0  668b460e             mov eax, dword ptr [bp + 0xe]
2:50E4  c45e06               les bx, ptr [bp + 6]
2:50E7  6626894704           mov dword ptr es:[bx + 4], eax
2:50EC  668b460a             mov eax, dword ptr [bp + 0xa]
2:50F0  6626894708           mov dword ptr es:[bx + 8], eax
2:50F5  668b4616             mov eax, dword ptr [bp + 0x16]
2:50F9  662689470c           mov dword ptr es:[bx + 0xc], eax
2:50FE  6626c7471000000000   mov dword ptr es:[bx + 0x10], 0
2:5107  06                   push es
2:5108  53                   push bx
2:5109  90                   nop
2:510A  0e                   push cs
2:510B  e8ee01               call 0x52fc  ; sub_s2:52FC
2:510E  8b4606               mov ax, word ptr [bp + 6]
2:5111  8b5608               mov dx, word ptr [bp + 8]
2:5114  c9                   leave
2:5115  ca1400               retf 0x14

; ---------------- sub_s2:5118 FAR size=28 callers=8
2:5118  55                   push bp
2:5119  8bec                 mov bp, sp
2:511B  c45e06               les bx, ptr [bp + 6]
2:511E  6626837f1000         cmp dword ptr es:[bx + 0x10], 0
2:5124  740a                 je 0x5130
2:5126  6626ff7710           push dword ptr es:[bx + 0x10]
2:512B  9ac60d9650           lcall 0x5096, 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_5130:
2:5130  c9                   leave
2:5131  ca0400               retf 4

; ---------------- sub_s2:5134 FAR size=258 callers=6
2:5134  c8180000             enter 0x18, 0
2:5138  57                   push di
2:5139  56                   push si
2:513A  c45e06               les bx, ptr [bp + 6]
2:513D  6626ff7708           push dword ptr es:[bx + 8]
2:5142  66268b4704           mov eax, dword ptr es:[bx + 4]
2:5147  6659                 pop ecx
2:5149  66f7e9               imul ecx
2:514C  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:5151  6650                 push eax
2:5153  6a01                 push 1
2:5155  9a480a0252           lcall 0x5202, 0xa48  ; sub_s1:0A48
2:515A  c45e06               les bx, ptr [bp + 6]
2:515D  26894710             mov word ptr es:[bx + 0x10], ax
2:5161  26895712             mov word ptr es:[bx + 0x12], dx
2:5165  8bc2                 mov ax, dx
2:5167  260b4710             or ax, word ptr es:[bx + 0x10]
2:516B  7509                 jne 0x5176
2:516D  33c0                 xor ax, ax
2:516F  5e                   pop si
2:5170  5f                   pop di
2:5171  c9                   leave
2:5172  ca0400               retf 4
2:5175  db 90
loc_5176:
2:5176  c45e06               les bx, ptr [bp + 6]
2:5179  6626ff7704           push dword ptr es:[bx + 4]
2:517E  268b4708             mov ax, word ptr es:[bx + 8]
2:5182  268b570a             mov dx, word ptr es:[bx + 0xa]
2:5186  8bc8                 mov cx, ax
2:5188  8bf2                 mov si, dx
2:518A  2d0100               sub ax, 1
2:518D  83da00               sbb dx, 0
2:5190  52                   push dx
2:5191  50                   push ax
2:5192  8bf9                 mov di, cx
2:5194  6658                 pop eax
2:5196  6659                 pop ecx
2:5198  66f7e9               imul ecx
2:519B  668bd0               mov edx, eax
2:519E  66c1ea10             shr edx, 0x10
2:51A2  c45e06               les bx, ptr [bp + 6]
2:51A5  26034710             add ax, word ptr es:[bx + 0x10]
2:51A9  83d200               adc dx, 0
2:51AC  b92352               mov cx, 0x5223  ; OFFSET KERNEL.__AHSHIFT
2:51AF  d3e2                 shl dx, cl
2:51B1  26035712             add dx, word ptr es:[bx + 0x12]
2:51B5  8946f8               mov word ptr [bp - 8], ax
2:51B8  8956fa               mov word ptr [bp - 6], dx
2:51BB  897ef4               mov word ptr [bp - 0xc], di
2:51BE  8976f6               mov word ptr [bp - 0xa], si
2:51C1  268b4702             mov ax, word ptr es:[bx + 2]
2:51C5  8946f2               mov word ptr [bp - 0xe], ax
loc_51C8:
2:51C8  668b46f4             mov eax, dword ptr [bp - 0xc]
2:51CC  66ff4ef4             dec dword ptr [bp - 0xc]
2:51D0  660bc0               or eax, eax
2:51D3  7457                 je 0x522c
2:51D5  8b5e06               mov bx, word ptr [bp + 6]
2:51D8  66260fbf07           movsx eax, word ptr es:[bx]
2:51DD  6650                 push eax
2:51DF  8b46f2               mov ax, word ptr [bp - 0xe]
2:51E2  ff46f2               inc word ptr [bp - 0xe]
2:51E5  99                   cdq
2:51E6  52                   push dx
2:51E7  50                   push ax
2:51E8  6626ff770c           push dword ptr es:[bx + 0xc]
2:51ED  90                   nop
2:51EE  0e                   push cs
2:51EF  e852f3               call 0x4544  ; sub_s2:4544
2:51F2  c45e06               les bx, ptr [bp + 6]
2:51F5  26ff7704             push word ptr es:[bx + 4]
2:51F9  52                   push dx
2:51FA  50                   push ax
2:51FB  66ff76f8             push dword ptr [bp - 8]
2:51FF  9aa8482e51           lcall 0x512e, 0x48a8  ; sub_s1:48A8
2:5204  83c40a               add sp, 0xa
2:5207  c45e06               les bx, ptr [bp + 6]
2:520A  268b4704             mov ax, word ptr es:[bx + 4]
2:520E  268b5706             mov dx, word ptr es:[bx + 6]
2:5212  f7d8                 neg ax
2:5214  83d200               adc dx, 0
2:5217  f7da                 neg dx
2:5219  2bdb                 sub bx, bx
2:521B  8bc8                 mov cx, ax
2:521D  014ef8               add word ptr [bp - 8], cx
2:5220  13da                 adc bx, dx
2:5222  b9c945               mov cx, 0x45c9  ; OFFSET KERNEL.__AHSHIFT
2:5225  d3e3                 shl bx, cl
2:5227  015efa               add word ptr [bp - 6], bx
2:522A  eb9c                 jmp 0x51c8
loc_522C:
2:522C  b80100               mov ax, 1
2:522F  5e                   pop si
2:5230  5f                   pop di
2:5231  c9                   leave
2:5232  ca0400               retf 4
2:5235  db 00

; ---------------- sub_s2:5236 FAR size=198 callers=7
2:5236  c8140000             enter 0x14, 0
2:523A  57                   push di
2:523B  56                   push si
2:523C  c45e06               les bx, ptr [bp + 6]
2:523F  6626ff7704           push dword ptr es:[bx + 4]
2:5244  268b4708             mov ax, word ptr es:[bx + 8]
2:5248  268b570a             mov dx, word ptr es:[bx + 0xa]
2:524C  8bc8                 mov cx, ax
2:524E  8bf2                 mov si, dx
2:5250  2d0100               sub ax, 1
2:5253  83da00               sbb dx, 0
2:5256  52                   push dx
2:5257  50                   push ax
2:5258  8bf9                 mov di, cx
2:525A  6658                 pop eax
2:525C  6659                 pop ecx
2:525E  66f7e9               imul ecx
2:5261  668bd0               mov edx, eax
2:5264  66c1ea10             shr edx, 0x10
2:5268  c45e06               les bx, ptr [bp + 6]
2:526B  26034710             add ax, word ptr es:[bx + 0x10]
2:526F  83d200               adc dx, 0
2:5272  b9e952               mov cx, 0x52e9  ; OFFSET KERNEL.__AHSHIFT
2:5275  d3e2                 shl dx, cl
2:5277  26035712             add dx, word ptr es:[bx + 0x12]
2:527B  8946fc               mov word ptr [bp - 4], ax
2:527E  8956fe               mov word ptr [bp - 2], dx
2:5281  897ef8               mov word ptr [bp - 8], di
2:5284  8976fa               mov word ptr [bp - 6], si
2:5287  268b4702             mov ax, word ptr es:[bx + 2]
2:528B  8946f6               mov word ptr [bp - 0xa], ax
loc_528E:
2:528E  668b46f8             mov eax, dword ptr [bp - 8]
2:5292  66ff4ef8             dec dword ptr [bp - 8]
2:5296  660bc0               or eax, eax
2:5299  7457                 je 0x52f2
2:529B  8b5e06               mov bx, word ptr [bp + 6]
2:529E  66260fbf07           movsx eax, word ptr es:[bx]
2:52A3  6650                 push eax
2:52A5  8b46f6               mov ax, word ptr [bp - 0xa]
2:52A8  ff46f6               inc word ptr [bp - 0xa]
2:52AB  99                   cdq
2:52AC  52                   push dx
2:52AD  50                   push ax
2:52AE  6626ff770c           push dword ptr es:[bx + 0xc]
2:52B3  90                   nop
2:52B4  0e                   push cs
2:52B5  e88cf2               call 0x4544  ; sub_s2:4544
2:52B8  c45e06               les bx, ptr [bp + 6]
2:52BB  26ff7704             push word ptr es:[bx + 4]
2:52BF  66ff76fc             push dword ptr [bp - 4]
2:52C3  52                   push dx
2:52C4  50                   push ax
2:52C5  9aa8485851           lcall 0x5158, 0x48a8  ; sub_s1:48A8
2:52CA  83c40a               add sp, 0xa
2:52CD  c45e06               les bx, ptr [bp + 6]
2:52D0  268b4704             mov ax, word ptr es:[bx + 4]
2:52D4  268b5706             mov dx, word ptr es:[bx + 6]
2:52D8  f7d8                 neg ax
2:52DA  83d200               adc dx, 0
2:52DD  f7da                 neg dx
2:52DF  2bdb                 sub bx, bx
2:52E1  8bc8                 mov cx, ax
2:52E3  014efc               add word ptr [bp - 4], cx
2:52E6  13da                 adc bx, dx
2:52E8  b9ad51               mov cx, 0x51ad  ; OFFSET KERNEL.__AHSHIFT
2:52EB  d3e3                 shl bx, cl
2:52ED  015efe               add word ptr [bp - 2], bx
2:52F0  eb9c                 jmp 0x528e
loc_52F2:
2:52F2  b80100               mov ax, 1
2:52F5  5e                   pop si
2:52F6  5f                   pop di
2:52F7  c9                   leave
2:52F8  ca0400               retf 4
2:52FB  db 00

; ---------------- sub_s2:52FC FAR size=152 callers=1
2:52FC  c8100000             enter 0x10, 0
2:5300  56                   push si
2:5301  c45e06               les bx, ptr [bp + 6]
2:5304  6626ff770c           push dword ptr es:[bx + 0xc]
2:5309  90                   nop
2:530A  0e                   push cs
2:530B  e864f4               call 0x4772  ; sub_s2:4772
2:530E  8bd8                 mov bx, ax
2:5310  8ec2                 mov es, dx
2:5312  268b4704             mov ax, word ptr es:[bx + 4]
2:5316  268b5706             mov dx, word ptr es:[bx + 6]
2:531A  2d0100               sub ax, 1
2:531D  83da00               sbb dx, 0
2:5320  66268b4f08           mov ecx, dword ptr es:[bx + 8]
2:5325  6649                 dec ecx
2:5327  66894ef4             mov dword ptr [bp - 0xc], ecx
2:532B  c45e06               les bx, ptr [bp + 6]
2:532E  8bc8                 mov cx, ax
2:5330  268b07               mov ax, word ptr es:[bx]
2:5333  8bf2                 mov si, dx
2:5335  99                   cdq
2:5336  8946f0               mov word ptr [bp - 0x10], ax
2:5339  8956f2               mov word ptr [bp - 0xe], dx
2:533C  26034704             add ax, word ptr es:[bx + 4]
2:5340  26135706             adc dx, word ptr es:[bx + 6]
2:5344  3bf2                 cmp si, dx
2:5346  7f14                 jg 0x535c
2:5348  7c04                 jl 0x534e
2:534A  3bc8                 cmp cx, ax
2:534C  730e                 jae 0x535c
loc_534E:
2:534E  2b4ef0               sub cx, word ptr [bp - 0x10]
2:5351  1b76f2               sbb si, word ptr [bp - 0xe]
2:5354  26894f04             mov word ptr es:[bx + 4], cx
2:5358  26897706             mov word ptr es:[bx + 6], si
loc_535C:
2:535C  c45e06               les bx, ptr [bp + 6]
2:535F  268b4702             mov ax, word ptr es:[bx + 2]
2:5363  99                   cdq
2:5364  8bc8                 mov cx, ax
2:5366  8bf2                 mov si, dx
2:5368  26034708             add ax, word ptr es:[bx + 8]
2:536C  2613570a             adc dx, word ptr es:[bx + 0xa]
2:5370  3b56f6               cmp dx, word ptr [bp - 0xa]
2:5373  7c19                 jl 0x538e
2:5375  7f05                 jg 0x537c
2:5377  3b46f4               cmp ax, word ptr [bp - 0xc]
2:537A  7612                 jbe 0x538e
loc_537C:
2:537C  8b46f4               mov ax, word ptr [bp - 0xc]
2:537F  8b56f6               mov dx, word ptr [bp - 0xa]
2:5382  2bc1                 sub ax, cx
2:5384  1bd6                 sbb dx, si
2:5386  26894708             mov word ptr es:[bx + 8], ax
2:538A  2689570a             mov word ptr es:[bx + 0xa], dx
loc_538E:
2:538E  5e                   pop si
2:538F  c9                   leave
2:5390  ca0400               retf 4
2:5393  db 90

; ---------------- sub_s2:5394 FAR size=22 callers=1
2:5394  55                   push bp
2:5395  8bec                 mov bp, sp
2:5397  c45e06               les bx, ptr [bp + 6]
2:539A  6626c70700000000     mov dword ptr es:[bx], 0
2:53A2  8bc3                 mov ax, bx
2:53A4  8cc2                 mov dx, es
2:53A6  c9                   leave
2:53A7  ca0400               retf 4

; ---------------- sub_s2:53AA FAR size=4 callers=1
2:53AA  ca0400               retf 4
2:53AD  db 00

; ---------------- Mci_s2_53AE@s2:53AE FAR size=252 callers=1
;   apis: MMSYSTEM.mciGetErrorString, MMSYSTEM.mciSendCommand
2:53AE  c8300400             enter 0x430, 0
2:53B2  66c746e400000000     mov dword ptr [bp - 0x1c], 0
2:53BA  c746ec8c02           mov word ptr [bp - 0x14], 0x28c  ; 'mciaap.drv'
2:53BF  8c5eee               mov word ptr [bp - 0x12], ds
2:53C2  668b4606             mov eax, dword ptr [bp + 6]
2:53C6  668946f0             mov dword ptr [bp - 0x10], eax
2:53CA  662bc0               sub eax, eax
2:53CD  668946f4             mov dword ptr [bp - 0xc], eax
2:53D1  8946f8               mov word ptr [bp - 8], ax
2:53D4  c746fa0040           mov word ptr [bp - 6], 0x4000
2:53D9  8b460a               mov ax, word ptr [bp + 0xa]
2:53DC  8946fc               mov word ptr [bp - 4], ax
2:53DF  666803080000         push 0x803
2:53E5  666800020300         push 0x30200
2:53EB  8d46e4               lea ax, [bp - 0x1c]
2:53EE  16                   push ss
2:53EF  50                   push ax
2:53F0  9a4b540000           lcall 0, 0x544b  ; MMSYSTEM.mciSendCommand
2:53F5  8946e0               mov word ptr [bp - 0x20], ax
2:53F8  8956e2               mov word ptr [bp - 0x1e], dx
2:53FB  837ee800             cmp word ptr [bp - 0x18], 0
2:53FF  0f84a400             je 0x54a7
2:5403  8bc2                 mov ax, dx
2:5405  0b46e0               or ax, word ptr [bp - 0x20]
2:5408  7412                 je 0x541c
2:540A  52                   push dx
2:540B  ff76e0               push word ptr [bp - 0x20]
2:540E  8d86d0fb             lea ax, [bp - 0x430]
2:5412  16                   push ss
2:5413  50                   push ax
2:5414  680004               push 0x400
2:5417  9a67540000           lcall 0, 0x5467  ; MMSYSTEM.mciGetErrorString
loc_541C:
2:541C  666800000c00         push 0xc0000
2:5422  8d46d4               lea ax, [bp - 0x2c]
2:5425  16                   push ss
2:5426  50                   push ax
2:5427  9a0649c852           lcall 0x52c8, 0x4906  ; sub_s1:4906
2:542C  83c408               add sp, 8
2:542F  8b460a               mov ax, word ptr [bp + 0xa]
2:5432  8946d4               mov word ptr [bp - 0x2c], ax
2:5435  c746d60000           mov word ptr [bp - 0x2a], 0
2:543A  ff76e8               push word ptr [bp - 0x18]
2:543D  666800000608         push 0x8060000
2:5443  6a02                 push 2
2:5445  8d46d4               lea ax, [bp - 0x2c]
2:5448  16                   push ss
2:5449  50                   push ax
2:544A  9a87540000           lcall 0, 0x5487  ; MMSYSTEM.mciSendCommand
2:544F  8946e0               mov word ptr [bp - 0x20], ax
2:5452  8956e2               mov word ptr [bp - 0x1e], dx
2:5455  0bd0                 or dx, ax
2:5457  7412                 je 0x546b
2:5459  ff76e2               push word ptr [bp - 0x1e]
2:545C  50                   push ax
2:545D  8d86d0fb             lea ax, [bp - 0x430]
2:5461  16                   push ss
2:5462  50                   push ax
2:5463  680004               push 0x400
2:5466  9aa3540000           lcall 0, 0x54a3  ; MMSYSTEM.mciGetErrorString
loc_546B:
2:546B  8b460a               mov ax, word ptr [bp + 0xa]
2:546E  8946d0               mov word ptr [bp - 0x30], ax
2:5471  c746d20000           mov word ptr [bp - 0x2e], 0
2:5476  ff76e8               push word ptr [bp - 0x18]
2:5479  666800000408         push 0x8040000
2:547F  6a01                 push 1
2:5481  8d46d0               lea ax, [bp - 0x30]
2:5484  16                   push ss
2:5485  50                   push ax
2:5486  9affff0000           lcall 0, 0xffff  ; MMSYSTEM.mciSendCommand
2:548B  8946e0               mov word ptr [bp - 0x20], ax
2:548E  8956e2               mov word ptr [bp - 0x1e], dx
2:5491  0bd0                 or dx, ax
2:5493  7412                 je 0x54a7
2:5495  ff76e2               push word ptr [bp - 0x1e]
2:5498  50                   push ax
2:5499  8d86d0fb             lea ax, [bp - 0x430]
2:549D  16                   push ss
2:549E  50                   push ax
2:549F  680004               push 0x400
2:54A2  9affff0000           lcall 0, 0xffff  ; MMSYSTEM.mciGetErrorString
loc_54A7:
2:54A7  c9                   leave
2:54A8  cb                   retf
2:54A9  db 90

; ---------------- sub_s2:54AA FAR size=522 callers=1
2:54AA  c8140000             enter 0x14, 0
2:54AE  57                   push di
2:54AF  56                   push si
2:54B0  837e0c00             cmp word ptr [bp + 0xc], 0
2:54B4  7408                 je 0x54be
2:54B6  33c0                 xor ax, ax
2:54B8  5e                   pop si
2:54B9  5f                   pop di
2:54BA  c9                   leave
2:54BB  ca0a00               retf 0xa
loc_54BE:
2:54BE  666a00               push 0
2:54C1  9a5c43cd54           lcall 0x54cd, 0x435c  ; sub_s1:435C
2:54C6  83c404               add sp, 4
2:54C9  50                   push ax
2:54CA  9a0c4dd554           lcall 0x54d5, 0x4d0c  ; sub_s1:4D0C
2:54CF  83c402               add sp, 2
2:54D2  9aea1fe654           lcall 0x54e6, 0x1fea  ; sub_s1:1FEA
2:54D7  666800001200         push 0x120000
2:54DD  666800003200         push 0x320000
2:54E3  9a0219fe54           lcall 0x54fe, 0x1902  ; sub_s1:1902
2:54E8  a3a003               mov word ptr [0x3a0], ax
2:54EB  8916a203             mov word ptr [0x3a2], dx
2:54EF  666800000c00         push 0xc0000
2:54F5  666800006400         push 0x640000
2:54FB  9a02191655           lcall 0x5516, 0x1902  ; sub_s1:1902
2:5500  a39c02               mov word ptr [0x29c], ax
2:5503  89169e02             mov word ptr [0x29e], dx
2:5507  666800001000         push 0x100000
2:550D  666800006400         push 0x640000
2:5513  9a02192e55           lcall 0x552e, 0x1902  ; sub_s1:1902
2:5518  a3b84f               mov word ptr [0x4fb8], ax
2:551B  8916ba4f             mov word ptr [0x4fba], dx
2:551F  666800000e00         push 0xe0000
2:5525  666800006400         push 0x640000
2:552B  9a02194655           lcall 0x5546, 0x1902  ; sub_s1:1902
2:5530  a3a268               mov word ptr [0x68a2], ax
2:5533  8916a468             mov word ptr [0x68a4], dx
2:5537  666800004200         push 0x420000
2:553D  66680000f401         push 0x1f40000
2:5543  9a02195e55           lcall 0x555e, 0x1902  ; sub_s1:1902
2:5548  a34457               mov word ptr [0x5744], ax
2:554B  89164657             mov word ptr [0x5746], dx
2:554F  666800000600         push 0x60000
2:5555  666800003200         push 0x320000
2:555B  9a02199155           lcall 0x5591, 0x1902  ; sub_s1:1902
2:5560  a36857               mov word ptr [0x5768], ax
2:5563  89166a57             mov word ptr [0x576a], dx
2:5567  8b460e               mov ax, word ptr [bp + 0xe]
2:556A  a38c03               mov word ptr [0x38c], ax
2:556D  8b460c               mov ax, word ptr [bp + 0xc]
2:5570  a38e03               mov word ptr [0x38e], ax
2:5573  8b4606               mov ax, word ptr [bp + 6]
2:5576  a39003               mov word ptr [0x390], ax
2:5579  66ff7608             push dword ptr [bp + 8]
2:557D  90                   nop
2:557E  0e                   push cs
2:557F  e8660b               call 0x60e8  ; sub_s2:60E8
2:5582  83c404               add sp, 4
2:5585  a39203               mov word ptr [0x392], ax
2:5588  89169403             mov word ptr [0x394], dx
2:558C  6a0c                 push 0xc
2:558E  9a9c17fe55           lcall 0x55fe, 0x179c  ; operator_new@s1:179C
2:5593  83c402               add sp, 2
2:5596  8956f2               mov word ptr [bp - 0xe], dx
2:5599  0bd0                 or dx, ax
2:559B  740b                 je 0x55a8
2:559D  ff76f2               push word ptr [bp - 0xe]
2:55A0  50                   push ax
2:55A1  90                   nop
2:55A2  0e                   push cs
2:55A3  e85aaa               call 0  ; sub_s2:0000
2:55A6  eb03                 jmp 0x55ab
loc_55A8:
2:55A8  33c0                 xor ax, ax
2:55AA  99                   cdq
loc_55AB:
2:55AB  8946f6               mov word ptr [bp - 0xa], ax
2:55AE  8956f8               mov word ptr [bp - 8], dx
2:55B1  66833e920300         cmp dword ptr [0x392], 0
2:55B7  7411                 je 0x55ca
2:55B9  66ff369203           push dword ptr [0x392]
2:55BE  52                   push dx
2:55BF  c45ef6               les bx, ptr [bp - 0xa]
2:55C2  53                   push bx
2:55C3  26c41f               les bx, ptr es:[bx]
2:55C6  26ff5f04             lcall es:[bx + 4]
loc_55CA:
2:55CA  c45ef6               les bx, ptr [bp - 0xa]
2:55CD  06                   push es
2:55CE  53                   push bx
2:55CF  26c41f               les bx, ptr es:[bx]
2:55D2  8bf3                 mov si, bx
2:55D4  8cc7                 mov di, es
2:55D6  26ff5f08             lcall es:[bx + 8]
2:55DA  90                   nop
2:55DB  0e                   push cs
2:55DC  e8b93e               call 0x9498  ; MessageLoop@s2:9498
2:55DF  8946f4               mov word ptr [bp - 0xc], ax
2:55E2  668b46f6             mov eax, dword ptr [bp - 0xa]
2:55E6  660bc0               or eax, eax
2:55E9  740b                 je 0x55f6
2:55EB  6a01                 push 1
2:55ED  ff76f8               push word ptr [bp - 8]
2:55F0  50                   push ax
2:55F1  8ec7                 mov es, di
2:55F3  26ff1c               lcall es:[si]
loc_55F6:
2:55F6  66ff36a003           push dword ptr [0x3a0]
2:55FB  9a681b0856           lcall 0x5608, 0x1b68  ; sub_s1:1B68
2:5600  66ff369c02           push dword ptr [0x29c]
2:5605  9a681b1256           lcall 0x5612, 0x1b68  ; sub_s1:1B68
2:560A  66ff36b84f           push dword ptr [0x4fb8]
2:560F  9a681b1c56           lcall 0x561c, 0x1b68  ; sub_s1:1B68
2:5614  66ff36a268           push dword ptr [0x68a2]
2:5619  9a681b2656           lcall 0x5626, 0x1b68  ; sub_s1:1B68
2:561E  66ff364457           push dword ptr [0x5744]
2:5623  9a681b2a54           lcall 0x542a, 0x1b68  ; sub_s1:1B68
2:5628  8b46f4               mov ax, word ptr [bp - 0xc]
2:562B  5e                   pop si
2:562C  5f                   pop di
2:562D  c9                   leave
2:562E  ca0a00               retf 0xa
2:5631  db 00 8c d0 c8 18 00 00 1e 8e d8 ff 76 0e 6a 00 9a
2:5641  db ff ff 00 00 89 46 fc 89 56 fe 8b c2 0b 46 fc 75
2:5651  db 48 83 7e 0c 01 75 2c 8b 46 06 8b 56 08 8b d8 8e
2:5661  db c2 66 26 8b 07 66 89 46 fc ff 76 0e 6a 00 66 50
2:5671  db 9a ff ff 00 00 ff 76 0e 66 ff 76 fc 90 0e e8 a6
2:5681  db 3f eb 16 66 ff 76 0c 66 ff 76 08 ff 76 06 9a ff
2:5691  db ff 00 00 1f c9 ca 0a 00 90 66 ff 76 0a 66 ff 76
2:56A1  db 06 c4 5e fc 06 53 26 c4 1f 26 ff 5f 1c 1f c9 ca
2:56B1  db 0a 00 90

; ---------------- sub_s2:56B4 FAR size=46 callers=3
2:56B4  c8040000             enter 4, 0
2:56B8  c45e06               les bx, ptr [bp + 6]
2:56BB  26c7079a38           mov word ptr es:[bx], 0x389a
2:56C0  26c74702d856         mov word ptr es:[bx + 2], 0x56d8  ; SEGMENT s2:0000
2:56C6  c45e06               les bx, ptr [bp + 6]
2:56C9  26c747040000         mov word ptr es:[bx + 4], 0
2:56CF  26c7073a57           mov word ptr es:[bx], 0x573a  ; '%s %d'
2:56D4  26c74702a450         mov word ptr es:[bx + 2], 0x50a4  ; SEGMENT s2:0000
2:56DA  8bc3                 mov ax, bx
2:56DC  8cc2                 mov dx, es
2:56DE  c9                   leave
2:56DF  ca0400               retf 4

; ---------------- sub_s2:56E2 FAR size=44 callers=0
;   apis: GDI.DeleteObject, USER.SelectPalette
2:56E2  55                   push bp
2:56E3  8bec                 mov bp, sp
2:56E5  c45e0a               les bx, ptr [bp + 0xa]
2:56E8  26ff37               push word ptr es:[bx]
2:56EB  c45e06               les bx, ptr [bp + 6]
2:56EE  26ff7704             push word ptr es:[bx + 4]
2:56F2  6a00                 push 0
2:56F4  9a3e500000           lcall 0, 0x503e  ; USER.SelectPalette
2:56F9  c45e06               les bx, ptr [bp + 6]
2:56FC  26894704             mov word ptr es:[bx + 4], ax
2:5700  50                   push ax
2:5701  9a47500000           lcall 0, 0x5047  ; GDI.DeleteObject
2:5706  b80100               mov ax, 1
2:5709  c9                   leave
2:570A  ca0800               retf 8
2:570D  db 00

; ---------------- sub_s2:570E FAR size=60 callers=0
2:570E  c8080000             enter 8, 0
2:5712  c45e06               les bx, ptr [bp + 6]
2:5715  26c7079a38           mov word ptr es:[bx], 0x389a
2:571A  26c74702c456         mov word ptr es:[bx + 2], 0x56c4  ; SEGMENT s2:0000
2:5720  f6460a01             test byte ptr [bp + 0xa], 1
2:5724  7409                 je 0x572f
2:5726  66ff7606             push dword ptr [bp + 6]
2:572A  9ace17c454           lcall 0x54c4, 0x17ce  ; operator_delete@s1:17CE
loc_572F:
2:572F  8b4606               mov ax, word ptr [bp + 6]
2:5732  8b5608               mov dx, word ptr [bp + 8]
2:5735  c9                   leave
2:5736  ca0600               retf 6
2:5739  db 90 0e 57 48 57 1a 4f 44 57 1a 4f 2d 57 e2 56 1e
2:5749  db 57

; ---------------- sub_s2:574A FAR size=58 callers=42
2:574A  c8040000             enter 4, 0
2:574E  c45e06               les bx, ptr [bp + 6]
2:5751  26c7079a38           mov word ptr es:[bx], 0x389a
2:5756  26c747027a57         mov word ptr es:[bx + 2], 0x577a  ; SEGMENT s2:0000
2:575C  c45e06               les bx, ptr [bp + 6]
2:575F  662bc0               sub eax, eax
2:5762  6626894704           mov dword ptr es:[bx + 4], eax
2:5767  26894708             mov word ptr es:[bx + 8], ax
2:576B  26c7470a0100         mov word ptr es:[bx + 0xa], 1
2:5771  26c707c45b           mov word ptr es:[bx], 0x5bc4
2:5776  26c747023c57         mov word ptr es:[bx + 2], 0x573c  ; SEGMENT s2:0000
2:577C  8bc3                 mov ax, bx
2:577E  8cc2                 mov dx, es
2:5780  c9                   leave
2:5781  ca0400               retf 4

; ---------------- ListIter::ListIter@s2:5784 FAR size=32 callers=75
2:5784  55                   push bp
2:5785  8bec                 mov bp, sp
2:5787  668b460a             mov eax, dword ptr [bp + 0xa]
2:578B  c45e06               les bx, ptr [bp + 6]
2:578E  66268907             mov dword ptr es:[bx], eax
2:5792  6626c7470400000000   mov dword ptr es:[bx + 4], 0
2:579B  8bc3                 mov ax, bx
2:579D  8cc2                 mov dx, es
2:579F  c9                   leave
2:57A0  ca0800               retf 8
2:57A3  db 00

; ---------------- sub_s2:57A4 FAR size=32 callers=6
2:57A4  55                   push bp
2:57A5  8bec                 mov bp, sp
2:57A7  668b460a             mov eax, dword ptr [bp + 0xa]
2:57AB  c45e06               les bx, ptr [bp + 6]
2:57AE  66268907             mov dword ptr es:[bx], eax
2:57B2  6626c7470400000000   mov dword ptr es:[bx + 4], 0
2:57BB  8bc3                 mov ax, bx
2:57BD  8cc2                 mov dx, es
2:57BF  c9                   leave
2:57C0  ca0800               retf 8
2:57C3  db 00

; ---------------- ListIter::~ListIter@s2:57C4 FAR size=44 callers=93
2:57C4  c8040000             enter 4, 0
2:57C8  c45e06               les bx, ptr [bp + 6]
2:57CB  26c707c45b           mov word ptr es:[bx], 0x5bc4
2:57D0  26c74702e957         mov word ptr es:[bx + 2], 0x57e9  ; SEGMENT s2:0000
2:57D6  06                   push es
2:57D7  53                   push bx
2:57D8  90                   nop
2:57D9  0e                   push cs
2:57DA  e85300               call 0x5830  ; sub_s2:5830
2:57DD  c45e06               les bx, ptr [bp + 6]
2:57E0  26c7079a38           mov word ptr es:[bx], 0x389a
2:57E5  26c747025a57         mov word ptr es:[bx + 2], 0x575a  ; SEGMENT s2:0000
2:57EB  c9                   leave
2:57EC  ca0400               retf 4
2:57EF  db 00

; ---------------- sub_s2:57F0 FAR size=64 callers=3
2:57F0  c8100000             enter 0x10, 0
2:57F4  66ff7606             push dword ptr [bp + 6]
2:57F8  8d46f8               lea ax, [bp - 8]
2:57FB  16                   push ss
2:57FC  50                   push ax
2:57FD  90                   nop
2:57FE  0e                   push cs
2:57FF  e882ff               call 0x5784  ; ListIter::ListIter@s2:5784
2:5802  c746f60000           mov word ptr [bp - 0xa], 0
loc_5807:
2:5807  8d46f8               lea ax, [bp - 8]
2:580A  16                   push ss
2:580B  50                   push ax
2:580C  90                   nop
2:580D  0e                   push cs
2:580E  e80103               call 0x5b12  ; ListIter::next@s2:5B12
2:5811  8946f2               mov word ptr [bp - 0xe], ax
2:5814  8956f4               mov word ptr [bp - 0xc], dx
2:5817  0bd0                 or dx, ax
2:5819  740b                 je 0x5826
2:581B  8b46f6               mov ax, word ptr [bp - 0xa]
2:581E  ff46f6               inc word ptr [bp - 0xa]
2:5821  3b460a               cmp ax, word ptr [bp + 0xa]
2:5824  75e1                 jne 0x5807
loc_5826:
2:5826  8b46f2               mov ax, word ptr [bp - 0xe]
2:5829  8b56f4               mov dx, word ptr [bp - 0xc]
2:582C  c9                   leave
2:582D  ca0600               retf 6

; ---------------- sub_s2:5830 FAR size=118 callers=1
2:5830  c80c0000             enter 0xc, 0
2:5834  56                   push si
loc_5835:
2:5835  c45e06               les bx, ptr [bp + 6]
2:5838  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:583E  745a                 je 0x589a
2:5840  26837f0a00           cmp word ptr es:[bx + 0xa], 0
2:5845  7420                 je 0x5867
2:5847  26c45f04             les bx, ptr es:[bx + 4]
2:584B  268b4708             mov ax, word ptr es:[bx + 8]
2:584F  268b570a             mov dx, word ptr es:[bx + 0xa]
2:5853  8bda                 mov bx, dx
2:5855  0bd0                 or dx, ax
2:5857  740e                 je 0x5867
2:5859  6a01                 push 1
2:585B  53                   push bx
2:585C  50                   push ax
2:585D  8ec3                 mov es, bx
2:585F  8bf0                 mov si, ax
2:5861  26c41c               les bx, ptr es:[si]
2:5864  26ff1f               lcall es:[bx]
loc_5867:
2:5867  c45e06               les bx, ptr [bp + 6]
2:586A  26c45f04             les bx, ptr es:[bx + 4]
2:586E  895efc               mov word ptr [bp - 4], bx
2:5871  8c46fe               mov word ptr [bp - 2], es
2:5874  66268b4704           mov eax, dword ptr es:[bx + 4]
2:5879  c45e06               les bx, ptr [bp + 6]
2:587C  6626894704           mov dword ptr es:[bx + 4], eax
2:5881  668b46fc             mov eax, dword ptr [bp - 4]
2:5885  660bc0               or eax, eax
2:5888  74ab                 je 0x5835
2:588A  6a01                 push 1
2:588C  c45efc               les bx, ptr [bp - 4]
2:588F  06                   push es
2:5890  50                   push ax
2:5891  26c41f               les bx, ptr es:[bx]
2:5894  26ff1f               lcall es:[bx]
2:5897  eb9c                 jmp 0x5835
2:5899  db 90
loc_589A:
2:589A  26c747080000         mov word ptr es:[bx + 8], 0
2:58A0  5e                   pop si
2:58A1  c9                   leave
2:58A2  ca0400               retf 4
2:58A5  db 00

; ---------------- sub_s2:58A6 FAR size=150 callers=0
2:58A6  c81c0000             enter 0x1c, 0
2:58AA  66a19c02             mov eax, dword ptr [0x29c]
2:58AE  6650                 push eax
2:58B0  9afc074057           lcall 0x5740, 0x7fc  ; sub_s1:07FC
2:58B5  8946f8               mov word ptr [bp - 8], ax
2:58B8  8956fa               mov word ptr [bp - 6], dx
2:58BB  0bd0                 or dx, ax
2:58BD  7433                 je 0x58f2
2:58BF  c45ef8               les bx, ptr [bp - 8]
2:58C2  26c7079a38           mov word ptr es:[bx], 0x389a
2:58C7  26c74702e658         mov word ptr es:[bx + 2], 0x58e6  ; SEGMENT s2:0000
2:58CD  c45ef8               les bx, ptr [bp - 8]
2:58D0  662bc0               sub eax, eax
2:58D3  6626894704           mov dword ptr es:[bx + 4], eax
2:58D8  6626894708           mov dword ptr es:[bx + 8], eax
2:58DD  26c707c05b           mov word ptr es:[bx], 0x5bc0  ; '%s %s!'
2:58E2  26c74702d457         mov word ptr es:[bx + 2], 0x57d4  ; SEGMENT s2:0000
2:58E8  668b46f8             mov eax, dword ptr [bp - 8]
2:58EC  668946fc             mov dword ptr [bp - 4], eax
2:58F0  eb08                 jmp 0x58fa
loc_58F2:
2:58F2  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_58FA:
2:58FA  66837efc00           cmp dword ptr [bp - 4], 0
2:58FF  7507                 jne 0x5908
2:5901  33c0                 xor ax, ax
2:5903  c9                   leave
2:5904  ca0800               retf 8
2:5907  db 90
loc_5908:
2:5908  668b460a             mov eax, dword ptr [bp + 0xa]
2:590C  c45efc               les bx, ptr [bp - 4]
2:590F  6626894708           mov dword ptr es:[bx + 8], eax
2:5914  c45e06               les bx, ptr [bp + 6]
2:5917  66268b4704           mov eax, dword ptr es:[bx + 4]
2:591C  c45efc               les bx, ptr [bp - 4]
2:591F  6626894704           mov dword ptr es:[bx + 4], eax
2:5924  c45e06               les bx, ptr [bp + 6]
2:5927  668b46fc             mov eax, dword ptr [bp - 4]
2:592B  6626894704           mov dword ptr es:[bx + 4], eax
2:5930  26ff4708             inc word ptr es:[bx + 8]
2:5934  b80100               mov ax, 1
2:5937  c9                   leave
2:5938  ca0800               retf 8
2:593B  db 00

; ---------------- sub_s2:593C FAR size=184 callers=0
2:593C  c8200000             enter 0x20, 0
2:5940  c45e06               les bx, ptr [bp + 6]
2:5943  26837f0800           cmp word ptr es:[bx + 8], 0
2:5948  7512                 jne 0x595c
2:594A  66ff760a             push dword ptr [bp + 0xa]
2:594E  06                   push es
2:594F  53                   push bx
2:5950  26c41f               les bx, ptr es:[bx]
2:5953  26ff5f04             lcall es:[bx + 4]
2:5957  c9                   leave
2:5958  ca0800               retf 8
2:595B  db 90
loc_595C:
2:595C  66a19c02             mov eax, dword ptr [0x29c]
2:5960  6650                 push eax
2:5962  9afc07b358           lcall 0x58b3, 0x7fc  ; sub_s1:07FC
2:5967  8946f4               mov word ptr [bp - 0xc], ax
2:596A  8956f6               mov word ptr [bp - 0xa], dx
2:596D  0bd0                 or dx, ax
2:596F  7433                 je 0x59a4
2:5971  c45ef4               les bx, ptr [bp - 0xc]
2:5974  26c7079a38           mov word ptr es:[bx], 0x389a
2:5979  26c747029859         mov word ptr es:[bx + 2], 0x5998  ; SEGMENT s2:0000
2:597F  c45ef4               les bx, ptr [bp - 0xc]
2:5982  662bc0               sub eax, eax
2:5985  6626894704           mov dword ptr es:[bx + 4], eax
2:598A  6626894708           mov dword ptr es:[bx + 8], eax
2:598F  26c707c05b           mov word ptr es:[bx], 0x5bc0  ; '%s %s!'
2:5994  26c74702cb58         mov word ptr es:[bx + 2], 0x58cb  ; SEGMENT s2:0000
2:599A  668b46f4             mov eax, dword ptr [bp - 0xc]
2:599E  668946fc             mov dword ptr [bp - 4], eax
2:59A2  eb08                 jmp 0x59ac
loc_59A4:
2:59A4  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_59AC:
2:59AC  66837efc00           cmp dword ptr [bp - 4], 0
2:59B1  7507                 jne 0x59ba
2:59B3  33c0                 xor ax, ax
2:59B5  c9                   leave
2:59B6  ca0800               retf 8
2:59B9  db 90
loc_59BA:
2:59BA  668b460a             mov eax, dword ptr [bp + 0xa]
2:59BE  c45efc               les bx, ptr [bp - 4]
2:59C1  6626894708           mov dword ptr es:[bx + 8], eax
2:59C6  c45e06               les bx, ptr [bp + 6]
loc_59C9:
2:59C9  66268b4704           mov eax, dword ptr es:[bx + 4]
2:59CE  668946f8             mov dword ptr [bp - 8], eax
2:59D2  c45ef8               les bx, ptr [bp - 8]
2:59D5  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:59DB  75ec                 jne 0x59c9
2:59DD  668b46fc             mov eax, dword ptr [bp - 4]
2:59E1  6626894704           mov dword ptr es:[bx + 4], eax
2:59E6  c45e06               les bx, ptr [bp + 6]
2:59E9  b80100               mov ax, 1
2:59EC  26ff4708             inc word ptr es:[bx + 8]
2:59F0  c9                   leave
2:59F1  ca0800               retf 8

; ---------------- sub_s2:59F4 size=196 callers=0
2:59F4  c8100000             enter 0x10, 0
2:59F8  66c746fc00000000     mov dword ptr [bp - 4], 0
2:5A00  c45e06               les bx, ptr [bp + 6]
2:5A03  eb07                 jmp 0x5a0c
2:5A05  db 90
loc_5A06:
2:5A06  895efc               mov word ptr [bp - 4], bx
2:5A09  8c46fe               mov word ptr [bp - 2], es
loc_5A0C:
2:5A0C  66268b4704           mov eax, dword ptr es:[bx + 4]
2:5A11  268b5706             mov dx, word ptr es:[bx + 6]
2:5A15  668946f8             mov dword ptr [bp - 8], eax
2:5A19  8bc2                 mov ax, dx
2:5A1B  0b46f8               or ax, word ptr [bp - 8]
2:5A1E  740e                 je 0x5a2e
2:5A20  668b460a             mov eax, dword ptr [bp + 0xa]
2:5A24  c45ef8               les bx, ptr [bp - 8]
2:5A27  6626394708           cmp dword ptr es:[bx + 8], eax
2:5A2C  75d8                 jne 0x5a06
loc_5A2E:
2:5A2E  66837ef800           cmp dword ptr [bp - 8], 0
2:5A33  7507                 jne 0x5a3c
2:5A35  33c0                 xor ax, ax
2:5A37  c9                   leave
2:5A38  ca0800               retf 8
2:5A3B  db 90
loc_5A3C:
2:5A3C  66837efc00           cmp dword ptr [bp - 4], 0
2:5A41  7411                 je 0x5a54
2:5A43  c45ef8               les bx, ptr [bp - 8]
2:5A46  268b4704             mov ax, word ptr es:[bx + 4]
2:5A4A  268b5706             mov dx, word ptr es:[bx + 6]
2:5A4E  c45efc               les bx, ptr [bp - 4]
2:5A51  eb0f                 jmp 0x5a62
2:5A53  db 90
loc_5A54:
2:5A54  c45ef8               les bx, ptr [bp - 8]
2:5A57  268b4704             mov ax, word ptr es:[bx + 4]
2:5A5B  268b5706             mov dx, word ptr es:[bx + 6]
2:5A5F  c45e06               les bx, ptr [bp + 6]
loc_5A62:
2:5A62  26894704             mov word ptr es:[bx + 4], ax
2:5A66  26895706             mov word ptr es:[bx + 6], dx
2:5A6A  c45e06               les bx, ptr [bp + 6]
2:5A6D  26837f0a00           cmp word ptr es:[bx + 0xa], 0
2:5A72  741f                 je 0x5a93
2:5A74  c45ef8               les bx, ptr [bp - 8]
2:5A77  268b4708             mov ax, word ptr es:[bx + 8]
2:5A7B  268b570a             mov dx, word ptr es:[bx + 0xa]
2:5A7F  8bda                 mov bx, dx
2:5A81  0bd8                 or bx, ax
2:5A83  740e                 je 0x5a93
2:5A85  6a01                 push 1
2:5A87  52                   push dx
2:5A88  50                   push ax
2:5A89  8ec2                 mov es, dx
2:5A8B  8bd8                 mov bx, ax
2:5A8D  26c41f               les bx, ptr es:[bx]
2:5A90  26ff1f               lcall es:[bx]
loc_5A93:
2:5A93  668b46f8             mov eax, dword ptr [bp - 8]
2:5A97  660bc0               or eax, eax
2:5A9A  740d                 je 0x5aa9
2:5A9C  6a01                 push 1
2:5A9E  c45ef8               les bx, ptr [bp - 8]
2:5AA1  06                   push es
2:5AA2  50                   push ax
2:5AA3  26c41f               les bx, ptr es:[bx]
2:5AA6  26ff1f               lcall es:[bx]
loc_5AA9:
2:5AA9  c45e06               les bx, ptr [bp + 6]
2:5AAC  b80100               mov ax, 1
2:5AAF  26ff4f08             dec word ptr es:[bx + 8]
2:5AB3  c9                   leave
2:5AB4  ca0800               retf 8
2:5AB7  db 00

; ---------------- sub_s2:5AB8 FAR size=90 callers=0
2:5AB8  c8100000             enter 0x10, 0
2:5ABC  c45e06               les bx, ptr [bp + 6]
2:5ABF  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:5AC5  7507                 jne 0x5ace
2:5AC7  33c0                 xor ax, ax
2:5AC9  99                   cdq
2:5ACA  c9                   leave
2:5ACB  ca0400               retf 4
loc_5ACE:
2:5ACE  26c45f04             les bx, ptr es:[bx + 4]
2:5AD2  895efc               mov word ptr [bp - 4], bx
2:5AD5  8c46fe               mov word ptr [bp - 2], es
2:5AD8  66268b4704           mov eax, dword ptr es:[bx + 4]
2:5ADD  c45e06               les bx, ptr [bp + 6]
2:5AE0  6626894704           mov dword ptr es:[bx + 4], eax
2:5AE5  c45efc               les bx, ptr [bp - 4]
2:5AE8  66268b4708           mov eax, dword ptr es:[bx + 8]
2:5AED  668946f8             mov dword ptr [bp - 8], eax
2:5AF1  8cc0                 mov ax, es
2:5AF3  0bc3                 or ax, bx
2:5AF5  740a                 je 0x5b01
2:5AF7  6a01                 push 1
2:5AF9  06                   push es
2:5AFA  53                   push bx
2:5AFB  26c41f               les bx, ptr es:[bx]
2:5AFE  26ff1f               lcall es:[bx]
loc_5B01:
2:5B01  c45e06               les bx, ptr [bp + 6]
2:5B04  26ff4f08             dec word ptr es:[bx + 8]
2:5B08  8b46f8               mov ax, word ptr [bp - 8]
2:5B0B  8b56fa               mov dx, word ptr [bp - 6]
2:5B0E  c9                   leave
2:5B0F  ca0400               retf 4

; ---------------- ListIter::next@s2:5B12 FAR size=92 callers=81
2:5B12  55                   push bp
2:5B13  8bec                 mov bp, sp
2:5B15  c45e06               les bx, ptr [bp + 6]
2:5B18  6626833f00           cmp dword ptr es:[bx], 0
2:5B1D  7447                 je 0x5b66
2:5B1F  26c41f               les bx, ptr es:[bx]
2:5B22  26837f0800           cmp word ptr es:[bx + 8], 0
2:5B27  743d                 je 0x5b66
2:5B29  c45e06               les bx, ptr [bp + 6]
2:5B2C  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:5B32  7406                 je 0x5b3a
2:5B34  26c45f04             les bx, ptr es:[bx + 4]
2:5B38  eb03                 jmp 0x5b3d
loc_5B3A:
2:5B3A  26c41f               les bx, ptr es:[bx]
loc_5B3D:
2:5B3D  66268b4704           mov eax, dword ptr es:[bx + 4]
2:5B42  c45e06               les bx, ptr [bp + 6]
2:5B45  6626894704           mov dword ptr es:[bx + 4], eax
2:5B4A  c45e06               les bx, ptr [bp + 6]
2:5B4D  6626837f0400         cmp dword ptr es:[bx + 4], 0
2:5B53  7411                 je 0x5b66
2:5B55  26c45f04             les bx, ptr es:[bx + 4]
2:5B59  268b4708             mov ax, word ptr es:[bx + 8]
2:5B5D  268b570a             mov dx, word ptr es:[bx + 0xa]
2:5B61  c9                   leave
2:5B62  ca0400               retf 4
2:5B65  db 90
loc_5B66:
2:5B66  33c0                 xor ax, ax
2:5B68  99                   cdq
2:5B69  c9                   leave
2:5B6A  ca0400               retf 4
2:5B6D  db 00

; ---------------- sub_s2:5B6E FAR size=44 callers=0
2:5B6E  c8080000             enter 8, 0
2:5B72  c45e06               les bx, ptr [bp + 6]
2:5B75  26c7079a38           mov word ptr es:[bx], 0x389a
2:5B7A  26c747027d59         mov word ptr es:[bx + 2], 0x597d  ; SEGMENT s2:0000
2:5B80  f6460a01             test byte ptr [bp + 0xa], 1
2:5B84  7409                 je 0x5b8f
2:5B86  66ff7606             push dword ptr [bp + 6]
2:5B8A  9a3a096559           lcall 0x5965, 0x93a  ; sub_s1:093A
loc_5B8F:
2:5B8F  8b4606               mov ax, word ptr [bp + 6]
2:5B92  8b5608               mov dx, word ptr [bp + 8]
2:5B95  c9                   leave
2:5B96  ca0600               retf 6
2:5B99  db 00

; ---------------- sub_s2:5B9A FAR size=66 callers=0
2:5B9A  55                   push bp
2:5B9B  8bec                 mov bp, sp
2:5B9D  66ff7606             push dword ptr [bp + 6]
2:5BA1  90                   nop
2:5BA2  0e                   push cs
2:5BA3  e81efc               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:5BA6  f6460a01             test byte ptr [bp + 0xa], 1
2:5BAA  7409                 je 0x5bb5
2:5BAC  66ff7606             push dword ptr [bp + 6]
2:5BB0  9ace178d5b           lcall 0x5b8d, 0x17ce  ; operator_delete@s1:17CE
loc_5BB5:
2:5BB5  8b4606               mov ax, word ptr [bp + 6]
2:5BB8  8b5608               mov dx, word ptr [bp + 8]
2:5BBB  c9                   leave
2:5BBC  ca0600               retf 6
2:5BBF  db 90 6e 5b 7e 5b 9a 5b ca 5b a6 58 ce 5b 3c 59 d2
2:5BCF  db 5b f4 59 d6 5b b8 5a da 5b 30 58 c2 5b

; ---------------- sub_s2:5BDC FAR size=88 callers=2
2:5BDC  55                   push bp
2:5BDD  8bec                 mov bp, sp
2:5BDF  6a44                 push 0x44
2:5BE1  66ff7606             push dword ptr [bp + 6]
2:5BE5  9a481d1e5c           lcall 0x5c1e, 0x1d48  ; sub_s3:1D48
2:5BEA  c45e06               les bx, ptr [bp + 6]
2:5BED  662bc0               sub eax, eax
2:5BF0  2689470a             mov word ptr es:[bx + 0xa], ax
2:5BF4  662689470c           mov dword ptr es:[bx + 0xc], eax
2:5BF9  26894710             mov word ptr es:[bx + 0x10], ax
2:5BFD  26894712             mov word ptr es:[bx + 0x12], ax
2:5C01  26c707c85f           mov word ptr es:[bx], 0x5fc8
2:5C06  26c74702c65b         mov word ptr es:[bx + 2], 0x5bc6  ; SEGMENT s2:0000
2:5C0C  891ea002             mov word ptr [0x2a0], bx
2:5C10  8c06a202             mov word ptr [0x2a2], es
2:5C14  6a02                 push 2
2:5C16  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:5C1B  9aba205e4f           lcall 0x4f5e, 0x20ba  ; sub_s3:20BA
2:5C20  c45e06               les bx, ptr [bp + 6]
2:5C23  2689470c             mov word ptr es:[bx + 0xc], ax
2:5C27  2689570e             mov word ptr es:[bx + 0xe], dx
2:5C2B  8bc3                 mov ax, bx
2:5C2D  8cc2                 mov dx, es
2:5C2F  c9                   leave
2:5C30  ca0400               retf 4
2:5C33  db 00

; ---------------- sub_s2:5C34 FAR size=40 callers=2
2:5C34  55                   push bp
2:5C35  8bec                 mov bp, sp
2:5C37  c45e06               les bx, ptr [bp + 6]
2:5C3A  26c707c85f           mov word ptr es:[bx], 0x5fc8
2:5C3F  26c747020a5c         mov word ptr es:[bx + 2], 0x5c0a  ; SEGMENT s2:0000
2:5C45  66c706a00200000000   mov dword ptr [0x2a0], 0
2:5C4E  66ff7606             push dword ptr [bp + 6]
2:5C52  9a801de85b           lcall 0x5be8, 0x1d80  ; sub_s3:1D80
2:5C57  c9                   leave
2:5C58  ca0400               retf 4
2:5C5B  db 00

; ---------------- sub_s2:5C5C FAR size=32 callers=14
2:5C5C  c8040000             enter 4, 0
2:5C60  ff760a               push word ptr [bp + 0xa]
2:5C63  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:5C68  9af884555c           lcall 0x5c55, 0x84f8  ; sub_s3:84F8
2:5C6D  52                   push dx
2:5C6E  50                   push ax
2:5C6F  66ff7606             push dword ptr [bp + 6]
2:5C73  90                   nop
2:5C74  0e                   push cs
2:5C75  e88600               call 0x5cfe  ; Mci_s2_5CFE@s2:5CFE
2:5C78  c9                   leave
2:5C79  ca0600               retf 6

; ---------------- sub_s2:5C7C FAR size=34 callers=16
2:5C7C  c8040000             enter 4, 0
2:5C80  66ff760a             push dword ptr [bp + 0xa]
2:5C84  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:5C89  9abe856b5c           lcall 0x5c6b, 0x85be  ; sub_s3:85BE
2:5C8E  52                   push dx
2:5C8F  50                   push ax
2:5C90  66ff7606             push dword ptr [bp + 6]
2:5C94  90                   nop
2:5C95  0e                   push cs
2:5C96  e86500               call 0x5cfe  ; Mci_s2_5CFE@s2:5CFE
2:5C99  c9                   leave
2:5C9A  ca0800               retf 8
2:5C9D  db 00

; ---------------- sub_s2:5C9E FAR size=24 callers=9
2:5C9E  c80c0000             enter 0xc, 0
2:5CA2  c45e0a               les bx, ptr [bp + 0xa]
2:5CA5  6626ff37             push dword ptr es:[bx]
2:5CA9  66ff7606             push dword ptr [bp + 6]
2:5CAD  90                   nop
2:5CAE  0e                   push cs
2:5CAF  e8caff               call 0x5c7c  ; sub_s2:5C7C
2:5CB2  c9                   leave
2:5CB3  ca0800               retf 8

; ---------------- Mci_s2_5CB6@s2:5CB6 FAR size=72 callers=2
;   apis: MMSYSTEM.mciSendCommand
2:5CB6  c8040000             enter 4, 0
2:5CBA  ff760a               push word ptr [bp + 0xa]
2:5CBD  666800000408         push 0x8040000
2:5CC3  666a00               push 0
2:5CC6  6a00                 push 0
2:5CC8  9af1530000           lcall 0, 0x53f1  ; MMSYSTEM.mciSendCommand
2:5CCD  c45e06               les bx, ptr [bp + 6]
2:5CD0  26837f0a00           cmp word ptr es:[bx + 0xa], 0
2:5CD5  7413                 je 0x5cea
2:5CD7  8b460a               mov ax, word ptr [bp + 0xa]
2:5CDA  2639470a             cmp word ptr es:[bx + 0xa], ax
2:5CDE  750a                 jne 0x5cea
2:5CE0  26c747100000         mov word ptr es:[bx + 0x10], 0
2:5CE6  6a10                 push 0x10
2:5CE8  eb08                 jmp 0x5cf2
loc_5CEA:
2:5CEA  26c747120000         mov word ptr es:[bx + 0x12], 0
2:5CF0  6a11                 push 0x11
loc_5CF2:
2:5CF2  06                   push es
2:5CF3  53                   push bx
2:5CF4  9a621f8c5c           lcall 0x5c8c, 0x1f62  ; sub_s3:1F62
2:5CF9  c9                   leave
2:5CFA  ca0600               retf 6
2:5CFD  db 00

; ---------------- Mci_s2_5CFE@s2:5CFE FAR size=384 callers=2
;   apis: MMSYSTEM.mciSendCommand, USER.SetWindowWord
2:5CFE  c82e0100             enter 0x12e, 0
2:5D02  666800001400         push 0x140000
2:5D08  8d46ec               lea ax, [bp - 0x14]
2:5D0B  16                   push ss
2:5D0C  50                   push ax
2:5D0D  9a06494e5d           lcall 0x5d4e, 0x4906  ; sub_s1:4906
2:5D12  83c408               add sp, 8
2:5D15  668b460a             mov eax, dword ptr [bp + 0xa]
2:5D19  668946f8             mov dword ptr [bp - 8], eax
2:5D1D  c45e06               les bx, ptr [bp + 6]
2:5D20  26c45f0c             les bx, ptr es:[bx + 0xc]
2:5D24  268b4772             mov ax, word ptr es:[bx + 0x72]
2:5D28  8946ea               mov word ptr [bp - 0x16], ax
2:5D2B  c746e80100           mov word ptr [bp - 0x18], 1
2:5D30  c746e4a402           mov word ptr [bp - 0x1c], 0x2a4  ; 'waveaudio'
2:5D35  8c5ee6               mov word ptr [bp - 0x1a], ds
2:5D38  8d86e4fe             lea ax, [bp - 0x11c]
2:5D3C  16                   push ss
2:5D3D  50                   push ax
2:5D3E  666a00               push 0
2:5D41  666a00               push 0
2:5D44  666a00               push 0
2:5D47  66ff76f8             push dword ptr [bp - 8]
2:5D4B  9a584d605d           lcall 0x5d60, 0x4d58  ; sub_s1:4D58
2:5D50  83c414               add sp, 0x14
2:5D53  1e                   push ds
2:5D54  68ae02               push 0x2ae  ; '.mid'
2:5D57  8d86e4fe             lea ax, [bp - 0x11c]
2:5D5B  16                   push ss
2:5D5C  50                   push ax
2:5D5D  9a5e473f5e           lcall 0x5e3f, 0x475e  ; sub_s1:475E
2:5D62  83c408               add sp, 8
2:5D65  0bc0                 or ax, ax
2:5D67  751b                 jne 0x5d84
2:5D69  c45e06               les bx, ptr [bp + 6]
2:5D6C  26c45f0c             les bx, ptr es:[bx + 0xc]
2:5D70  268b4774             mov ax, word ptr es:[bx + 0x74]
2:5D74  8946ea               mov word ptr [bp - 0x16], ax
2:5D77  c746e4b302           mov word ptr [bp - 0x1c], 0x2b3  ; 'sequencer'
2:5D7C  8c5ee6               mov word ptr [bp - 0x1a], ds
2:5D7F  c746e80000           mov word ptr [bp - 0x18], 0
loc_5D84:
2:5D84  837eea00             cmp word ptr [bp - 0x16], 0
2:5D88  7518                 jne 0x5da2
2:5D8A  837ee800             cmp word ptr [bp - 0x18], 0
2:5D8E  755a                 jne 0x5dea
loc_5D90:
2:5D90  6a11                 push 0x11
loc_5D92:
2:5D92  66ff7606             push dword ptr [bp + 6]
2:5D96  9a621ff75c           lcall 0x5cf7, 0x1f62  ; sub_s3:1F62
loc_5D9B:
2:5D9B  33c0                 xor ax, ax
2:5D9D  c9                   leave
2:5D9E  ca0800               retf 8
2:5DA1  db 90
loc_5DA2:
2:5DA2  837ee800             cmp word ptr [bp - 0x18], 0
2:5DA6  740a                 je 0x5db2
2:5DA8  c45e06               les bx, ptr [bp + 6]
2:5DAB  26837f1000           cmp word ptr es:[bx + 0x10], 0
2:5DB0  75e9                 jne 0x5d9b
loc_5DB2:
2:5DB2  837ee800             cmp word ptr [bp - 0x18], 0
2:5DB6  750a                 jne 0x5dc2
2:5DB8  c45e06               les bx, ptr [bp + 6]
2:5DBB  26837f1200           cmp word ptr es:[bx + 0x12], 0
2:5DC0  75d9                 jne 0x5d9b
loc_5DC2:
2:5DC2  668b46e4             mov eax, dword ptr [bp - 0x1c]
2:5DC6  668946f4             mov dword ptr [bp - 0xc], eax
2:5DCA  666803080000         push 0x803
2:5DD0  666800220000         push 0x2200  ; '559a.bmp'
2:5DD6  8d46ec               lea ax, [bp - 0x14]
2:5DD9  16                   push ss
2:5DDA  50                   push ax
2:5DDB  9a645e0000           lcall 0, 0x5e64  ; MMSYSTEM.mciSendCommand
2:5DE0  0bd0                 or dx, ax
2:5DE2  740a                 je 0x5dee
2:5DE4  837ee800             cmp word ptr [bp - 0x18], 0
2:5DE8  74a6                 je 0x5d90
loc_5DEA:
2:5DEA  6a10                 push 0x10
2:5DEC  eba4                 jmp 0x5d92
loc_5DEE:
2:5DEE  837ee800             cmp word ptr [bp - 0x18], 0
2:5DF2  7412                 je 0x5e06
2:5DF4  8b46f0               mov ax, word ptr [bp - 0x10]
2:5DF7  c45e06               les bx, ptr [bp + 6]
2:5DFA  2689470a             mov word ptr es:[bx + 0xa], ax
2:5DFE  26c747100100         mov word ptr es:[bx + 0x10], 1
2:5E04  eb09                 jmp 0x5e0f
loc_5E06:
2:5E06  c45e06               les bx, ptr [bp + 6]
2:5E09  26c747120100         mov word ptr es:[bx + 0x12], 1
loc_5E0F:
2:5E0F  66ff7606             push dword ptr [bp + 6]
2:5E13  90                   nop
2:5E14  0e                   push cs
2:5E15  e86600               call 0x5e7e  ; RegisterWindowClass@s2:5E7E
2:5E18  8986e2fe             mov word ptr [bp - 0x11e], ax
2:5E1C  0bc0                 or ax, ax
2:5E1E  7510                 jne 0x5e30
2:5E20  ff76f0               push word ptr [bp - 0x10]
2:5E23  66ff7606             push dword ptr [bp + 6]
2:5E27  90                   nop
2:5E28  0e                   push cs
2:5E29  e88afe               call 0x5cb6  ; Mci_s2_5CB6@s2:5CB6
2:5E2C  e96cff               jmp 0x5d9b
2:5E2F  db 90
loc_5E30:
2:5E30  666800000c00         push 0xc0000
2:5E36  8d86d6fe             lea ax, [bp - 0x12a]
2:5E3A  16                   push ss
2:5E3B  50                   push ax
2:5E3C  9a0649b35b           lcall 0x5bb3, 0x4906  ; sub_s1:4906
2:5E41  83c408               add sp, 8
2:5E44  8b86e2fe             mov ax, word ptr [bp - 0x11e]
2:5E48  8986d6fe             mov word ptr [bp - 0x12a], ax
2:5E4C  c786d8fe0000         mov word ptr [bp - 0x128], 0
2:5E52  ff76f0               push word ptr [bp - 0x10]
2:5E55  666800000608         push 0x8060000
2:5E5B  6a01                 push 1
2:5E5D  8d8ed6fe             lea cx, [bp - 0x12a]
2:5E61  16                   push ss
2:5E62  51                   push cx
2:5E63  9ac95c0000           lcall 0, 0x5cc9  ; MMSYSTEM.mciSendCommand
2:5E68  ffb6e2fe             push word ptr [bp - 0x11e]
2:5E6C  6a00                 push 0
2:5E6E  ff76f0               push word ptr [bp - 0x10]
2:5E71  9affff0000           lcall 0, 0xffff  ; USER.SetWindowWord
2:5E76  8b86e2fe             mov ax, word ptr [bp - 0x11e]
2:5E7A  c9                   leave
2:5E7B  ca0800               retf 8

; ---------------- RegisterWindowClass@s2:5E7E FAR size=198 callers=1
;   apis: GDI.GetStockObject, KERNEL.OutputDebugString, USER.CreateWindow, USER.GetClassInfo, USER.RegisterClass
2:5E7E  c82c0000             enter 0x2c, 0
2:5E82  57                   push di
2:5E83  56                   push si
2:5E84  8d7ef0               lea di, [bp - 0x10]
2:5E87  bebd02               mov si, 0x2bd  ; 'MciSoundWindow'
2:5E8A  8cd0                 mov ax, ss
2:5E8C  8ec0                 mov es, ax
2:5E8E  66b903000000         mov ecx, 3
2:5E94  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
2:5E97  a5                   movsw word ptr es:[di], word ptr [si]
2:5E98  a4                   movsb byte ptr es:[di], byte ptr [si]
2:5E99  c746d60020           mov word ptr [bp - 0x2a], 0x2000
2:5E9E  c746d8445f           mov word ptr [bp - 0x28], 0x5f44
2:5EA3  c746da435c           mov word ptr [bp - 0x26], 0x5c43  ; SEGMENT s2:0000
2:5EA8  c746de0200           mov word ptr [bp - 0x22], 2
2:5EAD  a18c03               mov ax, word ptr [0x38c]
2:5EB0  8946e0               mov word ptr [bp - 0x20], ax
2:5EB3  33c0                 xor ax, ax
2:5EB5  8946e2               mov word ptr [bp - 0x1e], ax
2:5EB8  8946e4               mov word ptr [bp - 0x1c], ax
2:5EBB  33c9                 xor cx, cx
2:5EBD  894edc               mov word ptr [bp - 0x24], cx
2:5EC0  51                   push cx
2:5EC1  9abf050000           lcall 0, 0x5bf  ; GDI.GetStockObject
2:5EC6  8946e6               mov word ptr [bp - 0x1a], ax
2:5EC9  66c746e800000000     mov dword ptr [bp - 0x18], 0
2:5ED1  8d46f0               lea ax, [bp - 0x10]
2:5ED4  8946ec               mov word ptr [bp - 0x14], ax
2:5ED7  8c56ee               mov word ptr [bp - 0x12], ss
2:5EDA  ff368c03             push word ptr [0x38c]
2:5EDE  16                   push ss
2:5EDF  50                   push ax
2:5EE0  8d46d6               lea ax, [bp - 0x2a]
2:5EE3  16                   push ss
2:5EE4  50                   push ax
2:5EE5  9affff0000           lcall 0, 0xffff  ; USER.GetClassInfo
2:5EEA  0bc0                 or ax, ax
2:5EEC  7520                 jne 0x5f0e
2:5EEE  8d46d6               lea ax, [bp - 0x2a]
2:5EF1  16                   push ss
2:5EF2  50                   push ax
2:5EF3  9affff0000           lcall 0, 0xffff  ; USER.RegisterClass
2:5EF8  0bc0                 or ax, ax
2:5EFA  7512                 jne 0x5f0e
2:5EFC  1e                   push ds
2:5EFD  68cc02               push 0x2cc  ; 'MciSound registerClass failed'
2:5F00  9affff0000           lcall 0, 0xffff  ; KERNEL.OutputDebugString
2:5F05  33c0                 xor ax, ax
2:5F07  5e                   pop si
2:5F08  5f                   pop di
2:5F09  c9                   leave
2:5F0A  ca0400               retf 4
2:5F0D  db 90
loc_5F0E:
2:5F0E  8d46f0               lea ax, [bp - 0x10]
2:5F11  16                   push ss
2:5F12  50                   push ax
2:5F13  1e                   push ds
2:5F14  68ea02               push 0x2ea
2:5F17  66680000cf00         push 0xcf0000
2:5F1D  666800800080         push 0x80008000
2:5F23  666801000100         push 0x10001
2:5F29  ff369603             push word ptr [0x396]
2:5F2D  6a00                 push 0
2:5F2F  ff368c03             push word ptr [0x38c]
2:5F33  666a00               push 0
2:5F36  9affff0000           lcall 0, 0xffff  ; USER.CreateWindow
2:5F3B  8946d4               mov word ptr [bp - 0x2c], ax
2:5F3E  5e                   pop si
2:5F3F  5f                   pop di
2:5F40  c9                   leave
2:5F41  ca0400               retf 4

; ---------------- sub_s2:5F44 size=94 callers=0
;   apis: USER.DefWindowProc, USER.DestroyWindow, USER.GetWindowWord
2:5F44  c8060000             enter 6, 0
2:5F48  8b460c               mov ax, word ptr [bp + 0xc]
2:5F4B  48                   dec ax
2:5F4C  48                   dec ax
2:5F4D  7423                 je 0x5f72
2:5F4F  2db703               sub ax, 0x3b7
2:5F52  7414                 je 0x5f68
2:5F54  66ff760c             push dword ptr [bp + 0xc]
2:5F58  66ff7608             push dword ptr [bp + 8]
2:5F5C  ff7606               push word ptr [bp + 6]
2:5F5F  9a90560000           lcall 0, 0x5690  ; USER.DefWindowProc
2:5F64  c9                   leave
2:5F65  ca0a00               retf 0xa
loc_5F68:
2:5F68  ff760e               push word ptr [bp + 0xe]
2:5F6B  9affff0000           lcall 0, 0xffff  ; USER.DestroyWindow
2:5F70  eb28                 jmp 0x5f9a
loc_5F72:
2:5F72  ff760e               push word ptr [bp + 0xe]
2:5F75  6a00                 push 0
2:5F77  9affff0000           lcall 0, 0xffff  ; USER.GetWindowWord
2:5F7C  50                   push ax
2:5F7D  66ff36a002           push dword ptr [0x2a0]
2:5F82  90                   nop
2:5F83  0e                   push cs
2:5F84  e82ffd               call 0x5cb6  ; Mci_s2_5CB6@s2:5CB6
2:5F87  6a37                 push 0x37
2:5F89  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:5F8E  9aba20995d           lcall 0x5d99, 0x20ba  ; sub_s3:20BA
2:5F93  52                   push dx
2:5F94  50                   push ax
2:5F95  90                   nop
2:5F96  0e                   push cs
2:5F97  e88e4a               call 0xaa28  ; sub_s2:AA28
loc_5F9A:
2:5F9A  33c0                 xor ax, ax
2:5F9C  99                   cdq
2:5F9D  c9                   leave
2:5F9E  ca0a00               retf 0xa
2:5FA1  db 00

; ---------------- sub_s2:5FA2 FAR size=54 callers=0
2:5FA2  55                   push bp
2:5FA3  8bec                 mov bp, sp
2:5FA5  66ff7606             push dword ptr [bp + 6]
2:5FA9  90                   nop
2:5FAA  0e                   push cs
2:5FAB  e886fc               call 0x5c34  ; sub_s2:5C34
2:5FAE  f6460a01             test byte ptr [bp + 0xa], 1
2:5FB2  7409                 je 0x5fbd
2:5FB4  66ff7606             push dword ptr [bp + 6]
2:5FB8  9ace17105d           lcall 0x5d10, 0x17ce  ; operator_delete@s1:17CE
loc_5FBD:
2:5FBD  8b4606               mov ax, word ptr [bp + 6]
2:5FC0  8b5608               mov dx, word ptr [bp + 8]
2:5FC3  c9                   leave
2:5FC4  ca0600               retf 6
2:5FC7  db 90 a2 5f a6 5e f2 1d d2 5f ce 1d d6 5f d4 1d 91
2:5FD7  db 5f

; ---------------- sub_s2:5FD8 FAR size=112 callers=4
2:5FD8  c8220000             enter 0x22, 0
2:5FDC  8d4608               lea ax, [bp + 8]
2:5FDF  8946fc               mov word ptr [bp - 4], ax
2:5FE2  8c56fe               mov word ptr [bp - 2], ss
2:5FE5  680010               push 0x1000
2:5FE8  9a9c170d60           lcall 0x600d, 0x179c  ; operator_new@s1:179C
2:5FED  83c402               add sp, 2
2:5FF0  8946f8               mov word ptr [bp - 8], ax
2:5FF3  8956fa               mov word ptr [bp - 6], dx
2:5FF6  8b4606               mov ax, word ptr [bp + 6]
2:5FF9  50                   push ax
2:5FFA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:5FFF  9a7e841b60           lcall 0x601b, 0x847e  ; LoadStringRes@s3:847E
2:6004  52                   push dx
2:6005  50                   push ax
2:6006  66ff76f8             push dword ptr [bp - 8]
2:600A  9a3e3d2660           lcall 0x6026, 0x3d3e  ; _fstrcpy@s1:3D3E
2:600F  eb17                 jmp 0x6028
2:6011  db 90
loc_6012:
2:6012  50                   push ax
2:6013  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:6018  9a7e84ce5f           lcall 0x5fce, 0x847e  ; LoadStringRes@s3:847E
2:601D  52                   push dx
2:601E  50                   push ax
2:601F  66ff76f8             push dword ptr [bp - 8]
2:6023  9aea3cbb5f           lcall 0x5fbb, 0x3cea  ; sub_s1:3CEA
loc_6028:
2:6028  83c408               add sp, 8
2:602B  c45efc               les bx, ptr [bp - 4]
2:602E  8346fc02             add word ptr [bp - 4], 2
2:6032  268b07               mov ax, word ptr es:[bx]
2:6035  0bc0                 or ax, ax
2:6037  75d9                 jne 0x6012
2:6039  8946fe               mov word ptr [bp - 2], ax
2:603C  8946fc               mov word ptr [bp - 4], ax
2:603F  8b46f8               mov ax, word ptr [bp - 8]
2:6042  8b56fa               mov dx, word ptr [bp - 6]
2:6045  c9                   leave
2:6046  cb                   retf
2:6047  db 00

; ---------------- sub_s2:6048 FAR size=160 callers=7
;   apis: KERNEL.OutputDebugString, USER.wvsprintf
2:6048  c8080100             enter 0x108, 0
2:604C  833eec0200           cmp word ptr [0x2ec], 0
2:6051  0f849100             je 0x60e6
2:6055  8d460a               lea ax, [bp + 0xa]
2:6058  8946fc               mov word ptr [bp - 4], ax
2:605B  8c56fe               mov word ptr [bp - 2], ss
2:605E  833eee02ff           cmp word ptr [0x2ee], -1
2:6063  7522                 jne 0x6087
2:6065  1e                   push ds
2:6066  68f402               push 0x2f4  ; 'MONO2'
2:6069  9ac03ecf60           lcall 0x60cf, 0x3ec0  ; sub_s1:3EC0
2:606E  83c404               add sp, 4
2:6071  8986f8fe             mov word ptr [bp - 0x108], ax
2:6075  8996fafe             mov word ptr [bp - 0x106], dx
2:6079  0bd0                 or dx, ax
2:607B  7405                 je 0x6082
2:607D  b80100               mov ax, 1
2:6080  eb02                 jmp 0x6084
loc_6082:
2:6082  33c0                 xor ax, ax
loc_6084:
2:6084  a3ee02               mov word ptr [0x2ee], ax
loc_6087:
2:6087  833eee0200           cmp word ptr [0x2ee], 0
2:608C  7450                 je 0x60de
2:608E  8d86fcfe             lea ax, [bp - 0x104]
2:6092  16                   push ss
2:6093  50                   push ax
2:6094  66ff7606             push dword ptr [bp + 6]
2:6098  66ff76fc             push dword ptr [bp - 4]
2:609C  9affff0000           lcall 0, 0xffff  ; USER.wvsprintf
2:60A1  8d86fcfe             lea ax, [bp - 0x104]
2:60A5  16                   push ss
2:60A6  50                   push ax
2:60A7  9ab1600000           lcall 0, 0x60b1  ; KERNEL.OutputDebugString
2:60AC  1e                   push ds
2:60AD  68fa02               push 0x2fa
2:60B0  9a015f0000           lcall 0, 0x5f01  ; KERNEL.OutputDebugString
2:60B5  66833ef00200         cmp dword ptr [0x2f0], 0
2:60BB  7421                 je 0x60de
2:60BD  8d86fcfe             lea ax, [bp - 0x104]
2:60C1  16                   push ss
2:60C2  50                   push ax
2:60C3  1e                   push ds
2:60C4  68fd02               push 0x2fd  ; '%s\n'
2:60C7  66ff36f002           push dword ptr [0x2f0]
2:60CC  9a5c2bdc60           lcall 0x60dc, 0x2b5c  ; sub_s1:2B5C
2:60D1  83c40c               add sp, 0xc
2:60D4  66ff36f002           push dword ptr [0x2f0]
2:60D9  9a482feb5f           lcall 0x5feb, 0x2f48  ; sub_s1:2F48
loc_60DE:
2:60DE  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_60E6:
2:60E6  c9                   leave
2:60E7  cb                   retf

; ---------------- sub_s2:60E8 FAR size=70 callers=52
2:60E8  c8060000             enter 6, 0
2:60EC  66837e0600           cmp dword ptr [bp + 6], 0
2:60F1  7505                 jne 0x60f8
loc_60F3:
2:60F3  33c0                 xor ax, ax
2:60F5  99                   cdq
2:60F6  c9                   leave
2:60F7  cb                   retf
loc_60F8:
2:60F8  66ff7606             push dword ptr [bp + 6]
2:60FC  9aa43d0961           lcall 0x6109, 0x3da4  ; sub_s1:3DA4
2:6101  83c404               add sp, 4
2:6104  40                   inc ax
2:6105  50                   push ax
2:6106  9a9c172361           lcall 0x6123, 0x179c  ; operator_new@s1:179C
2:610B  83c402               add sp, 2
2:610E  8946fa               mov word ptr [bp - 6], ax
2:6111  8956fc               mov word ptr [bp - 4], dx
2:6114  0bd0                 or dx, ax
2:6116  74db                 je 0x60f3
2:6118  66ff7606             push dword ptr [bp + 6]
2:611C  ff76fc               push word ptr [bp - 4]
2:611F  50                   push ax
2:6120  9a3e3d6c60           lcall 0x606c, 0x3d3e  ; _fstrcpy@s1:3D3E
2:6125  8b46fa               mov ax, word ptr [bp - 6]
2:6128  8b56fc               mov dx, word ptr [bp - 4]
2:612B  c9                   leave
2:612C  cb                   retf
2:612D  db 00

; ---------------- sub_s2:612E FAR size=132 callers=25
2:612E  c8140000             enter 0x14, 0
2:6132  9a244dff60           lcall 0x60ff, 0x4d24  ; sub_s1:4D24
2:6137  8946fe               mov word ptr [bp - 2], ax
2:613A  8b4608               mov ax, word ptr [bp + 8]
2:613D  2b4606               sub ax, word ptr [bp + 6]
2:6140  40                   inc ax
2:6141  99                   cdq
2:6142  8956fc               mov word ptr [bp - 4], dx
2:6145  0bd0                 or dx, ax
2:6147  7505                 jne 0x614e
2:6149  8b4606               mov ax, word ptr [bp + 6]
2:614C  c9                   leave
2:614D  cb                   retf
loc_614E:
2:614E  ff76fc               push word ptr [bp - 4]
2:6151  50                   push ax
2:6152  66b8ff7f0000         mov eax, 0x7fff
2:6158  6659                 pop ecx
2:615A  6699                 cdq
2:615C  66f7f9               idiv ecx
2:615F  668946f6             mov dword ptr [bp - 0xa], eax
2:6163  8b4608               mov ax, word ptr [bp + 8]
2:6166  8946f4               mov word ptr [bp - 0xc], ax
2:6169  c746f20100           mov word ptr [bp - 0xe], 1
2:616E  8b4606               mov ax, word ptr [bp + 6]
2:6171  8946f0               mov word ptr [bp - 0x10], ax
2:6174  eb06                 jmp 0x617c
loc_6176:
2:6176  ff46f0               inc word ptr [bp - 0x10]
2:6179  ff46f2               inc word ptr [bp - 0xe]
loc_617C:
2:617C  8b4608               mov ax, word ptr [bp + 8]
2:617F  3946f0               cmp word ptr [bp - 0x10], ax
2:6182  7f28                 jg 0x61ac
2:6184  660fbf46f2           movsx eax, word ptr [bp - 0xe]
2:6189  66f76ef6             imul dword ptr [bp - 0xa]
2:618D  668bd0               mov edx, eax
2:6190  66c1ea10             shr edx, 0x10
2:6194  8bc8                 mov cx, ax
2:6196  8b46fe               mov ax, word ptr [bp - 2]
2:6199  8bda                 mov bx, dx
2:619B  99                   cdq
2:619C  3bda                 cmp bx, dx
2:619E  7cd6                 jl 0x6176
2:61A0  7f04                 jg 0x61a6
2:61A2  3bc8                 cmp cx, ax
2:61A4  72d0                 jb 0x6176
loc_61A6:
2:61A6  8b46f0               mov ax, word ptr [bp - 0x10]
2:61A9  8946f4               mov word ptr [bp - 0xc], ax
loc_61AC:
2:61AC  8b46f4               mov ax, word ptr [bp - 0xc]
2:61AF  c9                   leave
2:61B0  cb                   retf
2:61B1  db 90

; ---------------- sub_s2:61B2 FAR size=220 callers=4
;   apis: GDI.GetStockObject, USER.LoadCursor
2:61B2  c81a0000             enter 0x1a, 0
2:61B6  66ff760e             push dword ptr [bp + 0xe]
2:61BA  66ff7606             push dword ptr [bp + 6]
2:61BE  90                   nop
2:61BF  0e                   push cs
2:61C0  e8b706               call 0x687a  ; sub_s2:687A
2:61C3  8b460a               mov ax, word ptr [bp + 0xa]
2:61C6  c45e06               les bx, ptr [bp + 6]
2:61C9  268987de00           mov word ptr es:[bx + 0xde], ax
2:61CE  26c787e0000000       mov word ptr es:[bx + 0xe0], 0
2:61D5  26c7077863           mov word ptr es:[bx], 0x6378
2:61DA  26c74702ca5f         mov word ptr es:[bx + 2], 0x5fca  ; SEGMENT s2:0000
2:61E0  1e                   push ds
2:61E1  680203               push 0x302  ; 'DanBrotherton'
2:61E4  8d475b               lea ax, [bx + 0x5b]
2:61E7  06                   push es
2:61E8  50                   push ax
2:61E9  9a3e3d3561           lcall 0x6135, 0x3d3e  ; _fstrcpy@s1:3D3E
2:61EE  83c408               add sp, 8
2:61F1  6a04                 push 4
2:61F3  9ac25e0000           lcall 0, 0x5ec2  ; GDI.GetStockObject
2:61F8  c45e06               les bx, ptr [bp + 6]
2:61FB  268987c600           mov word ptr es:[bx + 0xc6], ax
2:6200  666a00               push 0
2:6203  68007f               push 0x7f00
2:6206  9ae82f0000           lcall 0, 0x2fe8  ; USER.LoadCursor
2:620B  c45e06               les bx, ptr [bp + 6]
2:620E  268987c400           mov word ptr es:[bx + 0xc4], ax
2:6213  26c787c8000b20       mov word ptr es:[bx + 0xc8], 0x200b
2:621A  6626c787ac0000000045 mov dword ptr es:[bx + 0xac], 0x45000000
2:6224  c45e0e               les bx, ptr [bp + 0xe]
2:6227  268b4708             mov ax, word ptr es:[bx + 8]
2:622B  c45e06               les bx, ptr [bp + 6]
2:622E  268987bc00           mov word ptr es:[bx + 0xbc], ax
2:6233  6a48                 push 0x48
2:6235  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:623A  9aba200260           lcall 0x6002, 0x20ba  ; sub_s3:20BA
2:623F  8946fc               mov word ptr [bp - 4], ax
2:6242  8956fe               mov word ptr [bp - 2], dx
2:6245  33c0                 xor ax, ax
2:6247  c45e06               les bx, ptr [bp + 6]
2:624A  268987b400           mov word ptr es:[bx + 0xb4], ax
2:624F  268987b600           mov word ptr es:[bx + 0xb6], ax
2:6254  c45efc               les bx, ptr [bp - 4]
2:6257  268b470a             mov ax, word ptr es:[bx + 0xa]
2:625B  c45e06               les bx, ptr [bp + 6]
2:625E  268987b800           mov word ptr es:[bx + 0xb8], ax
2:6263  c45efc               les bx, ptr [bp - 4]
2:6266  268b470c             mov ax, word ptr es:[bx + 0xc]
2:626A  c45e06               les bx, ptr [bp + 6]
2:626D  268987ba00           mov word ptr es:[bx + 0xba], ax
2:6272  8b460c               mov ax, word ptr [bp + 0xc]
2:6275  c45e06               les bx, ptr [bp + 6]
2:6278  268987ca00           mov word ptr es:[bx + 0xca], ax
2:627D  06                   push es
2:627E  53                   push bx
2:627F  90                   nop
2:6280  0e                   push cs
2:6281  e84e34               call 0x96d2  ; RegisterWindowClass@s2:96D2
2:6284  8b4606               mov ax, word ptr [bp + 6]
2:6287  8b5608               mov dx, word ptr [bp + 8]
2:628A  c9                   leave
2:628B  ca0c00               retf 0xc

; ---------------- sub_s2:628E FAR size=50 callers=11
;   apis: USER.DestroyWindow
2:628E  55                   push bp
2:628F  8bec                 mov bp, sp
2:6291  8b4606               mov ax, word ptr [bp + 6]
2:6294  8b5608               mov dx, word ptr [bp + 8]
2:6297  05d200               add ax, 0xd2
2:629A  52                   push dx
2:629B  50                   push ax
2:629C  8ec2                 mov es, dx
2:629E  8bd8                 mov bx, ax
2:62A0  26c41f               les bx, ptr es:[bx]
2:62A3  26ff5f14             lcall es:[bx + 0x14]
2:62A7  c45e06               les bx, ptr [bp + 6]
2:62AA  26ff7708             push word ptr es:[bx + 8]
2:62AE  9a6c5f0000           lcall 0, 0x5f6c  ; USER.DestroyWindow
2:62B3  c45e06               les bx, ptr [bp + 6]
2:62B6  26c747080000         mov word ptr es:[bx + 8], 0
2:62BC  c9                   leave
2:62BD  ca0400               retf 4

; ---------------- sub_s2:62C0 size=100 callers=0
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.FillRect, USER.GetClientRect
2:62C0  c8380000             enter 0x38, 0
2:62C4  c45e06               les bx, ptr [bp + 6]
2:62C7  26ff7708             push word ptr es:[bx + 8]
2:62CB  8d46e0               lea ax, [bp - 0x20]
2:62CE  16                   push ss
2:62CF  50                   push ax
2:62D0  9abd390000           lcall 0, 0x39bd  ; USER.BeginPaint
2:62D5  8946de               mov word ptr [bp - 0x22], ax
2:62D8  66680b071002         push 0x210070b
2:62DE  9acb390000           lcall 0, 0x39cb  ; GDI.CreateSolidBrush
2:62E3  8946dc               mov word ptr [bp - 0x24], ax
2:62E6  c45e06               les bx, ptr [bp + 6]
2:62E9  26ff7708             push word ptr es:[bx + 8]
2:62ED  8d46d4               lea ax, [bp - 0x2c]
2:62F0  16                   push ss
2:62F1  50                   push ax
2:62F2  9adf390000           lcall 0, 0x39df  ; USER.GetClientRect
2:62F7  ff76de               push word ptr [bp - 0x22]
2:62FA  8d46d4               lea ax, [bp - 0x2c]
2:62FD  16                   push ss
2:62FE  50                   push ax
2:62FF  ff76dc               push word ptr [bp - 0x24]
2:6302  9aef390000           lcall 0, 0x39ef  ; USER.FillRect
2:6307  c45e06               les bx, ptr [bp + 6]
2:630A  26ff7708             push word ptr es:[bx + 8]
2:630E  8d46e0               lea ax, [bp - 0x20]
2:6311  16                   push ss
2:6312  50                   push ax
2:6313  9a003a0000           lcall 0, 0x3a00  ; USER.EndPaint
2:6318  ff76dc               push word ptr [bp - 0x24]
2:631B  9a02570000           lcall 0, 0x5702  ; GDI.DeleteObject
2:6320  c9                   leave
2:6321  ca0400               retf 4

; ---------------- sub_s2:6324 FAR size=4 callers=0
2:6324  ca0a00               retf 0xa
2:6327  db 00

; ---------------- sub_s2:6328 FAR size=4 callers=0
2:6328  ca0600               retf 6
2:632B  db 00

; ---------------- sub_s2:632C FAR size=4 callers=0
2:632C  ca0600               retf 6
2:632F  db 00

; ---------------- sub_s2:6330 FAR size=228 callers=0
2:6330  c8140000             enter 0x14, 0
2:6334  668b4606             mov eax, dword ptr [bp + 6]
2:6338  05d200               add ax, 0xd2
2:633B  6650                 push eax
2:633D  90                   nop
2:633E  0e                   push cs
2:633F  e882f4               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:6342  c45e06               les bx, ptr [bp + 6]
2:6345  26c7070a38           mov word ptr es:[bx], 0x380a
2:634A  26c747025c63         mov word ptr es:[bx + 2], 0x635c  ; SEGMENT s2:0000
2:6350  c45e06               les bx, ptr [bp + 6]
2:6353  26c7079a38           mov word ptr es:[bx], 0x389a
2:6358  26c74702de61         mov word ptr es:[bx + 2], 0x61de  ; SEGMENT s2:0000
2:635E  f6460a01             test byte ptr [bp + 0xa], 1
2:6362  7409                 je 0x636d
2:6364  66ff7606             push dword ptr [bp + 6]
2:6368  9ace17ec61           lcall 0x61ec, 0x17ce  ; operator_delete@s1:17CE
loc_636D:
2:636D  8b4606               mov ax, word ptr [bp + 6]
2:6370  8b5608               mov dx, word ptr [bp + 8]
2:6373  c9                   leave
2:6374  ca0600               retf 6
2:6377  db 00 30 63 7e 63 ea 68 82 63 60 97 86 63 c6 68 8a
2:6387  db 63 40 96 8e 63 64 96 92 63 2c 37 96 63 f2 97 9a
2:6397  db 63 3c 37 9e 63 40 37 a2 63 44 37 a6 63 48 37 aa
2:63A7  db 63 4c 37 ae 63 c0 62 b2 63 98 96 b6 63 50 37 ba
2:63B7  db 63 54 37 be 63 60 9c c2 63 58 37 c6 63 24 63 ca
2:63C7  db 63 4e 9c ce 63 62 37 d2 63 4a 9c d6 63 66 37 da
2:63D7  db 63 6a 37 de 63 4a 6a e2 63 2e 6b e6 63 02 6b ea
2:63E7  db 63 7a 37 ee 63 52 9c f2 63 56 9c f6 63 16 9c fa
2:63F7  db 63 30 9c fe 63 86 9c 02 64 c4 9c 06 64 e0 9c 0a
2:6407  db 64 8e 62 0e 64 28 63 12 64 2c 63 4e 63

; ---------------- sub_s2:6414 FAR size=142 callers=2
2:6414  c8280000             enter 0x28, 0
2:6418  c45e06               les bx, ptr [bp + 6]
2:641B  662bc0               sub eax, eax
2:641E  66268907             mov dword ptr es:[bx], eax
2:6422  6626894704           mov dword ptr es:[bx + 4], eax
2:6427  66ff760a             push dword ptr [bp + 0xa]
2:642B  6a01                 push 1
2:642D  8d46dc               lea ax, [bp - 0x24]
2:6430  16                   push ss
2:6431  50                   push ax
2:6432  90                   nop
2:6433  0e                   push cs
2:6434  e8c7e4               call 0x48fe  ; sub_s2:48FE
2:6437  6a1e                 push 0x1e
2:6439  9a9c176b63           lcall 0x636b, 0x179c  ; operator_new@s1:179C
2:643E  83c402               add sp, 2
2:6441  8946d8               mov word ptr [bp - 0x28], ax
2:6444  8956da               mov word ptr [bp - 0x26], dx
2:6447  0bd0                 or dx, ax
2:6449  741b                 je 0x6466
2:644B  8d46dc               lea ax, [bp - 0x24]
2:644E  16                   push ss
2:644F  50                   push ax
2:6450  66ff76d8             push dword ptr [bp - 0x28]
2:6454  90                   nop
2:6455  0e                   push cs
2:6456  e839db               call 0x3f92  ; sub_s2:3F92
2:6459  c45e06               les bx, ptr [bp + 6]
2:645C  268907               mov word ptr es:[bx], ax
2:645F  26895702             mov word ptr es:[bx + 2], dx
2:6463  eb0c                 jmp 0x6471
2:6465  db 90
loc_6466:
2:6466  c45e06               les bx, ptr [bp + 6]
2:6469  6626c70700000000     mov dword ptr es:[bx], 0
loc_6471:
2:6471  c45e06               les bx, ptr [bp + 6]
2:6474  6626ff37             push dword ptr es:[bx]
2:6478  26c41f               les bx, ptr es:[bx]
2:647B  26c41f               les bx, ptr es:[bx]
2:647E  26ff5f14             lcall es:[bx + 0x14]
2:6482  c45e06               les bx, ptr [bp + 6]
2:6485  26894704             mov word ptr es:[bx + 4], ax
2:6489  26895706             mov word ptr es:[bx + 6], dx
2:648D  8d46dc               lea ax, [bp - 0x24]
2:6490  16                   push ss
2:6491  50                   push ax
2:6492  90                   nop
2:6493  0e                   push cs
2:6494  e8d5e4               call 0x496c  ; sub_s2:496C
2:6497  8b4606               mov ax, word ptr [bp + 6]
2:649A  8b5608               mov dx, word ptr [bp + 8]
2:649D  c9                   leave
2:649E  ca0800               retf 8
2:64A1  db 00

; ---------------- sub_s2:64A2 FAR size=38 callers=4
2:64A2  c8080000             enter 8, 0
2:64A6  c45e06               les bx, ptr [bp + 6]
2:64A9  268b07               mov ax, word ptr es:[bx]
2:64AC  268b5702             mov dx, word ptr es:[bx + 2]
2:64B0  8bda                 mov bx, dx
2:64B2  0bd8                 or bx, ax
2:64B4  740e                 je 0x64c4
2:64B6  6a01                 push 1
2:64B8  52                   push dx
2:64B9  50                   push ax
2:64BA  8ec2                 mov es, dx
2:64BC  8bd8                 mov bx, ax
2:64BE  26c41f               les bx, ptr es:[bx]
2:64C1  26ff1f               lcall es:[bx]
loc_64C4:
2:64C4  c9                   leave
2:64C5  ca0400               retf 4

; ---------------- sub_s2:64C8 FAR size=154 callers=2
2:64C8  c8180000             enter 0x18, 0
2:64CC  c45e06               les bx, ptr [bp + 6]
2:64CF  6626833f00           cmp dword ptr es:[bx], 0
2:64D4  7508                 jne 0x64de
2:64D6  33c0                 xor ax, ax
2:64D8  99                   cdq
2:64D9  c9                   leave
2:64DA  ca0c00               retf 0xc
2:64DD  db 90
loc_64DE:
2:64DE  6a1e                 push 0x1e
2:64E0  9a9c174965           lcall 0x6549, 0x179c  ; operator_new@s1:179C
2:64E5  83c402               add sp, 2
2:64E8  8956f8               mov word ptr [bp - 8], dx
2:64EB  0bd0                 or dx, ax
2:64ED  740f                 je 0x64fe
2:64EF  66ff760a             push dword ptr [bp + 0xa]
2:64F3  ff76f8               push word ptr [bp - 8]
2:64F6  50                   push ax
2:64F7  90                   nop
2:64F8  0e                   push cs
2:64F9  e80801               call 0x6604  ; sub_s2:6604
2:64FC  eb03                 jmp 0x6501
loc_64FE:
2:64FE  33c0                 xor ax, ax
2:6500  99                   cdq
loc_6501:
2:6501  8946fc               mov word ptr [bp - 4], ax
2:6504  8956fe               mov word ptr [bp - 2], dx
2:6507  c746fa0000           mov word ptr [bp - 6], 0
2:650C  eb40                 jmp 0x654e
loc_650E:
2:650E  660fbf4610           movsx eax, word ptr [bp + 0x10]
2:6513  6650                 push eax
2:6515  8b460e               mov ax, word ptr [bp + 0xe]
2:6518  ff460e               inc word ptr [bp + 0xe]
2:651B  99                   cdq
2:651C  52                   push dx
2:651D  50                   push ax
2:651E  c45e06               les bx, ptr [bp + 6]
2:6521  6626ff37             push dword ptr es:[bx]
2:6525  90                   nop
2:6526  0e                   push cs
2:6527  e81ae0               call 0x4544  ; sub_s2:4544
2:652A  ff760c               push word ptr [bp + 0xc]
2:652D  52                   push dx
2:652E  50                   push ax
2:652F  666a00               push 0
2:6532  8b46fa               mov ax, word ptr [bp - 6]
2:6535  ff46fa               inc word ptr [bp - 6]
2:6538  99                   cdq
2:6539  52                   push dx
2:653A  50                   push ax
2:653B  66ff76fc             push dword ptr [bp - 4]
2:653F  90                   nop
2:6540  0e                   push cs
2:6541  e800e0               call 0x4544  ; sub_s2:4544
2:6544  52                   push dx
2:6545  50                   push ax
2:6546  9aa8483c64           lcall 0x643c, 0x48a8  ; sub_s1:48A8
2:654B  83c40a               add sp, 0xa
loc_654E:
2:654E  8b460a               mov ax, word ptr [bp + 0xa]
2:6551  ff4e0a               dec word ptr [bp + 0xa]
2:6554  0bc0                 or ax, ax
2:6556  75b6                 jne 0x650e
2:6558  8b46fc               mov ax, word ptr [bp - 4]
2:655B  8b56fe               mov dx, word ptr [bp - 2]
2:655E  c9                   leave
2:655F  ca0c00               retf 0xc

; ---------------- sub_s2:6562 FAR size=162 callers=3
2:6562  c8180000             enter 0x18, 0
2:6566  c45e06               les bx, ptr [bp + 6]
2:6569  6626833f00           cmp dword ptr es:[bx], 0
2:656E  7508                 jne 0x6578
2:6570  33c0                 xor ax, ax
2:6572  99                   cdq
2:6573  c9                   leave
2:6574  ca0c00               retf 0xc
2:6577  db 90
loc_6578:
2:6578  6a1e                 push 0x1e
2:657A  9a9c17eb65           lcall 0x65eb, 0x179c  ; operator_new@s1:179C
2:657F  83c402               add sp, 2
2:6582  8956f8               mov word ptr [bp - 8], dx
2:6585  0bd0                 or dx, ax
2:6587  7417                 je 0x65a0
2:6589  66ff760a             push dword ptr [bp + 0xa]
2:658D  c45e06               les bx, ptr [bp + 6]
2:6590  6626ff7704           push dword ptr es:[bx + 4]
2:6595  ff76f8               push word ptr [bp - 8]
2:6598  50                   push ax
2:6599  90                   nop
2:659A  0e                   push cs
2:659B  e8beda               call 0x405c  ; sub_s2:405C
2:659E  eb03                 jmp 0x65a3
loc_65A0:
2:65A0  33c0                 xor ax, ax
2:65A2  99                   cdq
loc_65A3:
2:65A3  8946fc               mov word ptr [bp - 4], ax
2:65A6  8956fe               mov word ptr [bp - 2], dx
2:65A9  c746fa0000           mov word ptr [bp - 6], 0
2:65AE  eb40                 jmp 0x65f0
loc_65B0:
2:65B0  660fbf4610           movsx eax, word ptr [bp + 0x10]
2:65B5  6650                 push eax
2:65B7  8b460e               mov ax, word ptr [bp + 0xe]
2:65BA  ff460e               inc word ptr [bp + 0xe]
2:65BD  99                   cdq
2:65BE  52                   push dx
2:65BF  50                   push ax
2:65C0  c45e06               les bx, ptr [bp + 6]
2:65C3  6626ff37             push dword ptr es:[bx]
2:65C7  90                   nop
2:65C8  0e                   push cs
2:65C9  e878df               call 0x4544  ; sub_s2:4544
2:65CC  ff760c               push word ptr [bp + 0xc]
2:65CF  52                   push dx
2:65D0  50                   push ax
2:65D1  666a00               push 0
2:65D4  8b46fa               mov ax, word ptr [bp - 6]
2:65D7  ff46fa               inc word ptr [bp - 6]
2:65DA  99                   cdq
2:65DB  52                   push dx
2:65DC  50                   push ax
2:65DD  66ff76fc             push dword ptr [bp - 4]
2:65E1  90                   nop
2:65E2  0e                   push cs
2:65E3  e85edf               call 0x4544  ; sub_s2:4544
2:65E6  52                   push dx
2:65E7  50                   push ax
2:65E8  9aa848e364           lcall 0x64e3, 0x48a8  ; sub_s1:48A8
2:65ED  83c40a               add sp, 0xa
loc_65F0:
2:65F0  8b460a               mov ax, word ptr [bp + 0xa]
2:65F3  ff4e0a               dec word ptr [bp + 0xa]
2:65F6  0bc0                 or ax, ax
2:65F8  75b6                 jne 0x65b0
2:65FA  8b46fc               mov ax, word ptr [bp - 4]
2:65FD  8b56fe               mov dx, word ptr [bp - 2]
2:6600  c9                   leave
2:6601  ca0c00               retf 0xc

; ---------------- sub_s2:6604 FAR size=302 callers=3
2:6604  c8040000             enter 4, 0
2:6608  57                   push di
2:6609  56                   push si
2:660A  66ff7606             push dword ptr [bp + 6]
2:660E  90                   nop
2:660F  0e                   push cs
2:6610  e803da               call 0x4016  ; sub_s2:4016
2:6613  c45e06               les bx, ptr [bp + 6]
2:6616  26c7075a68           mov word ptr es:[bx], 0x685a
2:661B  26c747027a63         mov word ptr es:[bx + 2], 0x637a  ; SEGMENT s2:0000
2:6621  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:6626  666a28               push 0x28
2:6629  6a01                 push 1
2:662B  9a480a7c66           lcall 0x667c, 0xa48  ; sub_s1:0A48
2:6630  c45e06               les bx, ptr [bp + 6]
2:6633  26894710             mov word ptr es:[bx + 0x10], ax
2:6637  26895712             mov word ptr es:[bx + 0x12], dx
2:663B  8b460c               mov ax, word ptr [bp + 0xc]
2:663E  c1e003               shl ax, 3
2:6641  051f00               add ax, 0x1f
2:6644  99                   cdq
2:6645  83e21f               and dx, 0x1f
2:6648  03c2                 add ax, dx
2:664A  c1f805               sar ax, 5
2:664D  c1e002               shl ax, 2
2:6650  99                   cdq
2:6651  26894718             mov word ptr es:[bx + 0x18], ax
2:6655  2689571a             mov word ptr es:[bx + 0x1a], dx
2:6659  8bc8                 mov cx, ax
2:665B  8b460a               mov ax, word ptr [bp + 0xa]
2:665E  8bf2                 mov si, dx
2:6660  99                   cdq
2:6661  52                   push dx
2:6662  50                   push ax
2:6663  56                   push si
2:6664  51                   push cx
2:6665  8bf0                 mov si, ax
2:6667  8bfa                 mov di, dx
2:6669  6658                 pop eax
2:666B  6659                 pop ecx
2:666D  66f7e9               imul ecx
2:6670  66ff362c5f           push dword ptr [0x5f2c]  ; g_defaultHeap
2:6675  6650                 push eax
2:6677  6a01                 push 1
2:6679  9a480a7d65           lcall 0x657d, 0xa48  ; sub_s1:0A48
2:667E  c45e06               les bx, ptr [bp + 6]
2:6681  26894706             mov word ptr es:[bx + 6], ax
2:6685  26895708             mov word ptr es:[bx + 8], dx
2:6689  268b4706             mov ax, word ptr es:[bx + 6]
2:668D  26894714             mov word ptr es:[bx + 0x14], ax
2:6691  26895716             mov word ptr es:[bx + 0x16], dx
2:6695  26c45f10             les bx, ptr es:[bx + 0x10]
2:6699  6626c70728000000     mov dword ptr es:[bx], 0x28
2:66A1  660fbf460c           movsx eax, word ptr [bp + 0xc]
2:66A6  c45e06               les bx, ptr [bp + 6]
2:66A9  26c45f10             les bx, ptr es:[bx + 0x10]
2:66AD  6626894704           mov dword ptr es:[bx + 4], eax
2:66B2  c45e06               les bx, ptr [bp + 6]
2:66B5  26c45f10             les bx, ptr es:[bx + 0x10]
2:66B9  26897708             mov word ptr es:[bx + 8], si
2:66BD  26897f0a             mov word ptr es:[bx + 0xa], di
2:66C1  c45e06               les bx, ptr [bp + 6]
2:66C4  26c45f10             les bx, ptr es:[bx + 0x10]
2:66C8  26c7470c0100         mov word ptr es:[bx + 0xc], 1
2:66CE  c45e06               les bx, ptr [bp + 6]
2:66D1  26c45f10             les bx, ptr es:[bx + 0x10]
2:66D5  26c7470e0800         mov word ptr es:[bx + 0xe], 8
2:66DB  c45e06               les bx, ptr [bp + 6]
2:66DE  26c45f10             les bx, ptr es:[bx + 0x10]
2:66E2  6626c7471000000000   mov dword ptr es:[bx + 0x10], 0
2:66EB  57                   push di
2:66EC  56                   push si
2:66ED  c45e06               les bx, ptr [bp + 6]
2:66F0  66268b4718           mov eax, dword ptr es:[bx + 0x18]
2:66F5  6659                 pop ecx
2:66F7  66f7e1               mul ecx
2:66FA  c45e06               les bx, ptr [bp + 6]
2:66FD  26c45f10             les bx, ptr es:[bx + 0x10]
2:6701  6626894714           mov dword ptr es:[bx + 0x14], eax
2:6706  c45e06               les bx, ptr [bp + 6]
2:6709  26c45f10             les bx, ptr es:[bx + 0x10]
2:670D  6626c7472000010000   mov dword ptr es:[bx + 0x20], 0x100
2:6716  c45e06               les bx, ptr [bp + 6]
2:6719  26c45f10             les bx, ptr es:[bx + 0x10]
2:671D  6626c7472400010000   mov dword ptr es:[bx + 0x24], 0x100
2:6726  8b4606               mov ax, word ptr [bp + 6]
2:6729  8b5608               mov dx, word ptr [bp + 8]
2:672C  5e                   pop si
2:672D  5f                   pop di
2:672E  c9                   leave
2:672F  ca0800               retf 8

; ---------------- sub_s2:6732 FAR size=60 callers=1
2:6732  55                   push bp
2:6733  8bec                 mov bp, sp
2:6735  c45e06               les bx, ptr [bp + 6]
2:6738  26c7075a68           mov word ptr es:[bx], 0x685a
2:673D  26c747021f66         mov word ptr es:[bx + 2], 0x661f  ; SEGMENT s2:0000
2:6743  6626837f1000         cmp dword ptr es:[bx + 0x10], 0
2:6749  740a                 je 0x6755
2:674B  6626ff7710           push dword ptr es:[bx + 0x10]
2:6750  9ac60d2e66           lcall 0x662e, 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_6755:
2:6755  c45e06               les bx, ptr [bp + 6]
2:6758  6626c7471000000000   mov dword ptr es:[bx + 0x10], 0
2:6761  66ff7606             push dword ptr [bp + 6]
2:6765  90                   nop
2:6766  0e                   push cs
2:6767  e852da               call 0x41bc  ; sub_s2:41BC
2:676A  c9                   leave
2:676B  ca0400               retf 4

; ---------------- sub_s2:676E FAR size=166 callers=1
;   apis: KERNEL.hmemcpy
2:676E  c80c0000             enter 0xc, 0
2:6772  c45e06               les bx, ptr [bp + 6]
2:6775  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:677B  7507                 jne 0x6784
2:677D  33c0                 xor ax, ax
2:677F  99                   cdq
2:6780  c9                   leave
2:6781  ca0400               retf 4
loc_6784:
2:6784  6a1e                 push 0x1e
2:6786  9a9c17ce67           lcall 0x67ce, 0x179c  ; operator_new@s1:179C
2:678B  83c402               add sp, 2
2:678E  8956f6               mov word ptr [bp - 0xa], dx
2:6791  0bd0                 or dx, ax
2:6793  741b                 je 0x67b0
2:6795  c45e06               les bx, ptr [bp + 6]
2:6798  26c45f10             les bx, ptr es:[bx + 0x10]
2:679C  26ff7704             push word ptr es:[bx + 4]
2:67A0  26ff7708             push word ptr es:[bx + 8]
2:67A4  ff76f6               push word ptr [bp - 0xa]
2:67A7  50                   push ax
2:67A8  90                   nop
2:67A9  0e                   push cs
2:67AA  e857fe               call 0x6604  ; sub_s2:6604
2:67AD  eb04                 jmp 0x67b3
2:67AF  db 90
loc_67B0:
2:67B0  33c0                 xor ax, ax
2:67B2  99                   cdq
loc_67B3:
2:67B3  8946fc               mov word ptr [bp - 4], ax
2:67B6  8956fe               mov word ptr [bp - 2], dx
2:67B9  6a28                 push 0x28
2:67BB  c45e06               les bx, ptr [bp + 6]
2:67BE  6626ff7710           push dword ptr es:[bx + 0x10]
2:67C3  c45efc               les bx, ptr [bp - 4]
2:67C6  6626ff7710           push dword ptr es:[bx + 0x10]
2:67CB  9aa8485367           lcall 0x6753, 0x48a8  ; sub_s1:48A8
2:67D0  83c40a               add sp, 0xa
2:67D3  c45e06               les bx, ptr [bp + 6]
2:67D6  6626ff7718           push dword ptr es:[bx + 0x18]
2:67DB  c45efc               les bx, ptr [bp - 4]
2:67DE  26c45f10             les bx, ptr es:[bx + 0x10]
2:67E2  66268b4708           mov eax, dword ptr es:[bx + 8]
2:67E7  6659                 pop ecx
2:67E9  66f7e9               imul ecx
2:67EC  c45efc               les bx, ptr [bp - 4]
2:67EF  6626ff7706           push dword ptr es:[bx + 6]
2:67F4  c45e06               les bx, ptr [bp + 6]
2:67F7  6626ff7706           push dword ptr es:[bx + 6]
2:67FC  6650                 push eax
2:67FE  9ac3420000           lcall 0, 0x42c3  ; KERNEL.hmemcpy
2:6803  c45efc               les bx, ptr [bp - 4]
2:6806  26c7471c0100         mov word ptr es:[bx + 0x1c], 1
2:680C  8bc3                 mov ax, bx
2:680E  8cc2                 mov dx, es
2:6810  c9                   leave
2:6811  ca0400               retf 4

; ---------------- sub_s2:6814 FAR size=6 callers=0
2:6814  33c0                 xor ax, ax
2:6816  99                   cdq
2:6817  ca0400               retf 4

; ---------------- sub_s2:681A FAR size=4 callers=0
2:681A  ca0c00               retf 0xc
2:681D  db 00

; ---------------- sub_s2:681E FAR size=4 callers=0
2:681E  ca0c00               retf 0xc
2:6821  db 00

; ---------------- sub_s2:6822 FAR size=6 callers=0
2:6822  33c0                 xor ax, ax
2:6824  ca0800               retf 8
2:6827  db 00

; ---------------- sub_s2:6828 FAR size=6 callers=0
2:6828  33c0                 xor ax, ax
2:682A  99                   cdq
2:682B  ca0400               retf 4

; ---------------- sub_s2:682E FAR size=6 callers=0
2:682E  33c0                 xor ax, ax
2:6830  ca0400               retf 4
2:6833  db 00

; ---------------- sub_s2:6834 FAR size=70 callers=0
2:6834  55                   push bp
2:6835  8bec                 mov bp, sp
2:6837  66ff7606             push dword ptr [bp + 6]
2:683B  90                   nop
2:683C  0e                   push cs
2:683D  e8f2fe               call 0x6732  ; sub_s2:6732
2:6840  f6460a01             test byte ptr [bp + 0xa], 1
2:6844  7409                 je 0x684f
2:6846  66ff7606             push dword ptr [bp + 6]
2:684A  9ace178967           lcall 0x6789, 0x17ce  ; operator_delete@s1:17CE
loc_684F:
2:684F  8b4606               mov ax, word ptr [bp + 6]
2:6852  8b5608               mov dx, word ptr [bp + 8]
2:6855  c9                   leave
2:6856  ca0600               retf 6
2:6859  db 90 34 68 60 68 1a 68 64 68 22 68 68 68 e2 56 6c
2:6869  db 68 1e 68 70 68 28 68 74 68 2e 68 78 68 14 68 41
2:6879  db 67

; ---------------- sub_s2:687A FAR size=76 callers=3
2:687A  c8080000             enter 8, 0
2:687E  66ff760a             push dword ptr [bp + 0xa]
2:6882  66ff7606             push dword ptr [bp + 6]
2:6886  90                   nop
2:6887  0e                   push cs
2:6888  e8f92c               call 0x9584  ; sub_s2:9584
2:688B  c45e06               les bx, ptr [bp + 6]
2:688E  662bc0               sub eax, eax
2:6891  268987cc00           mov word ptr es:[bx + 0xcc], ax
2:6896  66268987ce00         mov dword ptr es:[bx + 0xce], eax
2:689C  8d87d200             lea ax, [bx + 0xd2]
2:68A0  06                   push es
2:68A1  50                   push ax
2:68A2  90                   nop
2:68A3  0e                   push cs
2:68A4  e8a3ee               call 0x574a  ; sub_s2:574A
2:68A7  c45e06               les bx, ptr [bp + 6]
2:68AA  26c707fc6b           mov word ptr es:[bx], 0x6bfc
2:68AF  26c747025c68         mov word ptr es:[bx + 2], 0x685c  ; SEGMENT s2:0000
2:68B5  26c787dc000000       mov word ptr es:[bx + 0xdc], 0
2:68BC  8b4606               mov ax, word ptr [bp + 6]
2:68BF  8b5608               mov dx, word ptr [bp + 8]
2:68C2  c9                   leave
2:68C3  ca0800               retf 8

; ---------------- sub_s2:68C6 FAR size=36 callers=2
2:68C6  c8020000             enter 2, 0
2:68CA  66ff7608             push dword ptr [bp + 8]
2:68CE  ff7606               push word ptr [bp + 6]
2:68D1  90                   nop
2:68D2  0e                   push cs
2:68D3  e8d82d               call 0x96ae  ; sub_s2:96AE
2:68D6  8946fe               mov word ptr [bp - 2], ax
2:68D9  66ff7606             push dword ptr [bp + 6]
2:68DD  90                   nop
2:68DE  0e                   push cs
2:68DF  e82201               call 0x6a04  ; sub_s2:6A04
2:68E2  8b46fe               mov ax, word ptr [bp - 2]
2:68E5  c9                   leave
2:68E6  ca0600               retf 6
2:68E9  db 00

; ---------------- sub_s2:68EA FAR size=142 callers=1
2:68EA  c8140000             enter 0x14, 0
2:68EE  8b4610               mov ax, word ptr [bp + 0x10]
2:68F1  0bc0                 or ax, ax
2:68F3  756d                 jne 0x6962
2:68F5  668b460a             mov eax, dword ptr [bp + 0xa]
2:68F9  668946fc             mov dword ptr [bp - 4], eax
2:68FD  c45e06               les bx, ptr [bp + 6]
2:6900  66263987ce00         cmp dword ptr es:[bx + 0xce], eax
2:6906  746b                 je 0x6973
2:6908  662683bfce0000       cmp dword ptr es:[bx + 0xce], 0
2:690F  7414                 je 0x6925
2:6911  6a00                 push 0
2:6913  6626ffb7ce00         push dword ptr es:[bx + 0xce]
2:6919  26c49fce00           les bx, ptr es:[bx + 0xce]
2:691E  26c41f               les bx, ptr es:[bx]
2:6921  26ff5f10             lcall es:[bx + 0x10]
loc_6925:
2:6925  6a01                 push 1
2:6927  c45efc               les bx, ptr [bp - 4]
2:692A  06                   push es
2:692B  53                   push bx
2:692C  c45e06               les bx, ptr [bp + 6]
2:692F  668b46fc             mov eax, dword ptr [bp - 4]
2:6933  8b56fe               mov dx, word ptr [bp - 2]
2:6936  66268987ce00         mov dword ptr es:[bx + 0xce], eax
2:693C  8ec2                 mov es, dx
2:693E  8bd8                 mov bx, ax
2:6940  26c41f               les bx, ptr es:[bx]
2:6943  26ff5f10             lcall es:[bx + 0x10]
2:6947  6a01                 push 1
2:6949  c45e06               les bx, ptr [bp + 6]
2:694C  6626ffb7ce00         push dword ptr es:[bx + 0xce]
2:6952  26c49fce00           les bx, ptr es:[bx + 0xce]
2:6957  26c41f               les bx, ptr es:[bx]
2:695A  26ff5f0c             lcall es:[bx + 0xc]
2:695E  c9                   leave
2:695F  ca0c00               retf 0xc
loc_6962:
2:6962  50                   push ax
2:6963  66ff760c             push dword ptr [bp + 0xc]
2:6967  66ff7608             push dword ptr [bp + 8]
2:696B  ff7606               push word ptr [bp + 6]
2:696E  90                   nop
2:696F  0e                   push cs
2:6970  e89bd4               call 0x3e0e  ; sub_s2:3E0E
loc_6973:
2:6973  c9                   leave
2:6974  ca0c00               retf 0xc
2:6977  db 00

; ---------------- sub_s2:6978 FAR size=140 callers=5
2:6978  c81e0000             enter 0x1e, 0
2:697C  6a0a                 push 0xa
2:697E  9a9c174d68           lcall 0x684d, 0x179c  ; operator_new@s1:179C
2:6983  83c402               add sp, 2
2:6986  8946f8               mov word ptr [bp - 8], ax
2:6989  8956fa               mov word ptr [bp - 6], dx
2:698C  0bd0                 or dx, ax
2:698E  744e                 je 0x69de
2:6990  837e0a00             cmp word ptr [bp + 0xa], 0
2:6994  7406                 je 0x699c
2:6996  8b460a               mov ax, word ptr [bp + 0xa]
2:6999  eb09                 jmp 0x69a4
2:699B  db 90
loc_699C:
2:699C  c45e06               les bx, ptr [bp + 6]
2:699F  268b87cc00           mov ax, word ptr es:[bx + 0xcc]
loc_69A4:
2:69A4  8946f6               mov word ptr [bp - 0xa], ax
2:69A7  c45ef8               les bx, ptr [bp - 8]
2:69AA  26c7079a38           mov word ptr es:[bx], 0x389a
2:69AF  26c74702d169         mov word ptr es:[bx + 2], 0x69d1  ; SEGMENT s2:0000
2:69B5  668b460c             mov eax, dword ptr [bp + 0xc]
2:69B9  c45ef8               les bx, ptr [bp - 8]
2:69BC  6626894704           mov dword ptr es:[bx + 4], eax
2:69C1  8b46f6               mov ax, word ptr [bp - 0xa]
2:69C4  26894708             mov word ptr es:[bx + 8], ax
2:69C8  26c7078c6c           mov word ptr es:[bx], 0x6c8c
2:69CD  26c74702b368         mov word ptr es:[bx + 2], 0x68b3  ; SEGMENT s2:0000
2:69D3  668b46f8             mov eax, dword ptr [bp - 8]
2:69D7  668946fc             mov dword ptr [bp - 4], eax
2:69DB  eb09                 jmp 0x69e6
2:69DD  db 90
loc_69DE:
2:69DE  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_69E6:
2:69E6  66ff76fc             push dword ptr [bp - 4]
2:69EA  8b4606               mov ax, word ptr [bp + 6]
2:69ED  8b5608               mov dx, word ptr [bp + 8]
2:69F0  05d200               add ax, 0xd2
2:69F3  52                   push dx
2:69F4  50                   push ax
2:69F5  8ec2                 mov es, dx
2:69F7  8bd8                 mov bx, ax
2:69F9  26c41f               les bx, ptr es:[bx]
2:69FC  26ff5f04             lcall es:[bx + 4]
2:6A00  c9                   leave
2:6A01  ca0a00               retf 0xa

; ---------------- sub_s2:6A04 FAR size=70 callers=1
2:6A04  c80c0000             enter 0xc, 0
2:6A08  668b4606             mov eax, dword ptr [bp + 6]
2:6A0C  05d200               add ax, 0xd2
2:6A0F  6650                 push eax
2:6A11  8d46f8               lea ax, [bp - 8]
2:6A14  16                   push ss
2:6A15  50                   push ax
2:6A16  90                   nop
2:6A17  0e                   push cs
2:6A18  e889ed               call 0x57a4  ; sub_s2:57A4
loc_6A1B:
2:6A1B  8d46f8               lea ax, [bp - 8]
2:6A1E  16                   push ss
2:6A1F  50                   push ax
2:6A20  90                   nop
2:6A21  0e                   push cs
2:6A22  e8edf0               call 0x5b12  ; ListIter::next@s2:5B12
2:6A25  8946f4               mov word ptr [bp - 0xc], ax
2:6A28  8956f6               mov word ptr [bp - 0xa], dx
2:6A2B  0bd0                 or dx, ax
2:6A2D  7417                 je 0x6a46
2:6A2F  6a05                 push 5
2:6A31  c45ef4               les bx, ptr [bp - 0xc]
2:6A34  6626ff7704           push dword ptr es:[bx + 4]
2:6A39  26c45f04             les bx, ptr es:[bx + 4]
2:6A3D  26c41f               les bx, ptr es:[bx]
2:6A40  26ff5f0c             lcall es:[bx + 0xc]
2:6A44  ebd5                 jmp 0x6a1b
loc_6A46:
2:6A46  c9                   leave
2:6A47  ca0400               retf 4

; ---------------- sub_s2:6A4A FAR size=184 callers=0
2:6A4A  c8100000             enter 0x10, 0
2:6A4E  837e0e02             cmp word ptr [bp + 0xe], 2
2:6A52  0f85a700             jne 0x6afd
2:6A56  668b4606             mov eax, dword ptr [bp + 6]
2:6A5A  05d200               add ax, 0xd2
2:6A5D  6650                 push eax
2:6A5F  8d46f4               lea ax, [bp - 0xc]
2:6A62  16                   push ss
2:6A63  50                   push ax
2:6A64  90                   nop
2:6A65  0e                   push cs
2:6A66  e83bed               call 0x57a4  ; sub_s2:57A4
loc_6A69:
2:6A69  8d46f4               lea ax, [bp - 0xc]
2:6A6C  16                   push ss
2:6A6D  50                   push ax
2:6A6E  90                   nop
2:6A6F  0e                   push cs
2:6A70  e89ff0               call 0x5b12  ; ListIter::next@s2:5B12
2:6A73  8946fc               mov word ptr [bp - 4], ax
2:6A76  8956fe               mov word ptr [bp - 2], dx
2:6A79  0bd0                 or dx, ax
2:6A7B  740c                 je 0x6a89
2:6A7D  8b460a               mov ax, word ptr [bp + 0xa]
2:6A80  c45efc               les bx, ptr [bp - 4]
2:6A83  26394708             cmp word ptr es:[bx + 8], ax
2:6A87  75e0                 jne 0x6a69
loc_6A89:
2:6A89  66837efc00           cmp dword ptr [bp - 4], 0
2:6A8E  746d                 je 0x6afd
2:6A90  66ff76fc             push dword ptr [bp - 4]
2:6A94  8b4606               mov ax, word ptr [bp + 6]
2:6A97  8b5608               mov dx, word ptr [bp + 8]
2:6A9A  05d200               add ax, 0xd2
2:6A9D  52                   push dx
2:6A9E  50                   push ax
2:6A9F  8ec2                 mov es, dx
2:6AA1  8bd8                 mov bx, ax
2:6AA3  26c41f               les bx, ptr es:[bx]
2:6AA6  26ff5f0c             lcall es:[bx + 0xc]
2:6AAA  66c746f800000000     mov dword ptr [bp - 8], 0
2:6AB2  8d46f4               lea ax, [bp - 0xc]
2:6AB5  16                   push ss
2:6AB6  50                   push ax
2:6AB7  90                   nop
2:6AB8  0e                   push cs
2:6AB9  e856f0               call 0x5b12  ; ListIter::next@s2:5B12
2:6ABC  8946fc               mov word ptr [bp - 4], ax
2:6ABF  8956fe               mov word ptr [bp - 2], dx
2:6AC2  0bd0                 or dx, ax
2:6AC4  742a                 je 0x6af0
2:6AC6  6a01                 push 1
2:6AC8  c45efc               les bx, ptr [bp - 4]
2:6ACB  6626ff7704           push dword ptr es:[bx + 4]
2:6AD0  26c45f04             les bx, ptr es:[bx + 4]
2:6AD4  26c41f               les bx, ptr es:[bx]
2:6AD7  26ff5f10             lcall es:[bx + 0x10]
2:6ADB  c45efc               les bx, ptr [bp - 4]
2:6ADE  66268b4704           mov eax, dword ptr es:[bx + 4]
2:6AE3  c45e06               les bx, ptr [bp + 6]
2:6AE6  66268987ce00         mov dword ptr es:[bx + 0xce], eax
2:6AEC  c9                   leave
2:6AED  ca0a00               retf 0xa
loc_6AF0:
2:6AF0  c45e06               les bx, ptr [bp + 6]
2:6AF3  6626c787ce0000000000 mov dword ptr es:[bx + 0xce], 0
loc_6AFD:
2:6AFD  c9                   leave
2:6AFE  ca0a00               retf 0xa
2:6B01  db 00

; ---------------- sub_s2:6B02 FAR size=44 callers=0
2:6B02  55                   push bp
2:6B03  8bec                 mov bp, sp
2:6B05  c45e06               les bx, ptr [bp + 6]
2:6B08  268b87d000           mov ax, word ptr es:[bx + 0xd0]
2:6B0D  260b87ce00           or ax, word ptr es:[bx + 0xce]
2:6B12  7416                 je 0x6b2a
2:6B14  8a460a               mov al, byte ptr [bp + 0xa]
2:6B17  50                   push ax
2:6B18  6626ffb7ce00         push dword ptr es:[bx + 0xce]
2:6B1E  26c49fce00           les bx, ptr es:[bx + 0xce]
2:6B23  26c41f               les bx, ptr es:[bx]
2:6B26  26ff5f6c             lcall es:[bx + 0x6c]
loc_6B2A:
2:6B2A  c9                   leave
2:6B2B  ca0600               retf 6

; ---------------- sub_s2:6B2E FAR size=44 callers=0
2:6B2E  55                   push bp
2:6B2F  8bec                 mov bp, sp
2:6B31  c45e06               les bx, ptr [bp + 6]
2:6B34  268b87d000           mov ax, word ptr es:[bx + 0xd0]
2:6B39  260b87ce00           or ax, word ptr es:[bx + 0xce]
2:6B3E  7416                 je 0x6b56
2:6B40  8a460a               mov al, byte ptr [bp + 0xa]
2:6B43  50                   push ax
2:6B44  6626ffb7ce00         push dword ptr es:[bx + 0xce]
2:6B4A  26c49fce00           les bx, ptr es:[bx + 0xce]
2:6B4F  26c41f               les bx, ptr es:[bx]
2:6B52  26ff5f68             lcall es:[bx + 0x68]
loc_6B56:
2:6B56  c9                   leave
2:6B57  ca0600               retf 6

; ---------------- sub_s2:6B5A size=90 callers=0
2:6B5A  c8100000             enter 0x10, 0
2:6B5E  56                   push si
2:6B5F  c45e06               les bx, ptr [bp + 6]
2:6B62  26c7078c6c           mov word ptr es:[bx], 0x6c8c
2:6B67  26c74702956b         mov word ptr es:[bx + 2], 0x6b95  ; SEGMENT s2:0000
2:6B6D  268b4704             mov ax, word ptr es:[bx + 4]
2:6B71  268b5706             mov dx, word ptr es:[bx + 6]
2:6B75  8bda                 mov bx, dx
2:6B77  0bd0                 or dx, ax
2:6B79  740e                 je 0x6b89
2:6B7B  6a01                 push 1
2:6B7D  53                   push bx
2:6B7E  50                   push ax
2:6B7F  8ec3                 mov es, bx
2:6B81  8bf0                 mov si, ax
2:6B83  26c41c               les bx, ptr es:[si]
2:6B86  26ff1f               lcall es:[bx]
loc_6B89:
2:6B89  c45e06               les bx, ptr [bp + 6]
2:6B8C  26c7079a38           mov word ptr es:[bx], 0x389a
2:6B91  26c74702b369         mov word ptr es:[bx + 2], 0x69b3  ; SEGMENT s2:0000
2:6B97  f6460a01             test byte ptr [bp + 0xa], 1
2:6B9B  740c                 je 0x6ba9
2:6B9D  66ff7606             push dword ptr [bp + 6]
2:6BA1  9ace178169           lcall 0x6981, 0x17ce  ; operator_delete@s1:17CE
2:6BA6  83c404               add sp, 4
loc_6BA9:
2:6BA9  8b4606               mov ax, word ptr [bp + 6]
2:6BAC  8b5608               mov dx, word ptr [bp + 8]
2:6BAF  5e                   pop si
2:6BB0  c9                   leave
2:6BB1  ca0600               retf 6

; ---------------- sub_s2:6BB4 size=220 callers=0
2:6BB4  c8100000             enter 0x10, 0
2:6BB8  668b4606             mov eax, dword ptr [bp + 6]
2:6BBC  05d200               add ax, 0xd2
2:6BBF  6650                 push eax
2:6BC1  90                   nop
2:6BC2  0e                   push cs
2:6BC3  e8feeb               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:6BC6  c45e06               les bx, ptr [bp + 6]
2:6BC9  26c7070a38           mov word ptr es:[bx], 0x380a
2:6BCE  26c74702e06b         mov word ptr es:[bx + 2], 0x6be0  ; SEGMENT s2:0000
2:6BD4  c45e06               les bx, ptr [bp + 6]
2:6BD7  26c7079a38           mov word ptr es:[bx], 0x389a
2:6BDC  26c747026b6b         mov word ptr es:[bx + 2], 0x6b6b  ; SEGMENT s2:0000
2:6BE2  f6460a01             test byte ptr [bp + 0xa], 1
2:6BE6  7409                 je 0x6bf1
2:6BE8  66ff7606             push dword ptr [bp + 6]
2:6BEC  9ace17a46b           lcall 0x6ba4, 0x17ce  ; operator_delete@s1:17CE
loc_6BF1:
2:6BF1  8b4606               mov ax, word ptr [bp + 6]
2:6BF4  8b5608               mov dx, word ptr [bp + 8]
2:6BF7  c9                   leave
2:6BF8  ca0600               retf 6
2:6BFB  db 00 b4 6b 02 6c ea 68 06 6c 60 97 0a 6c c6 68 0e
2:6C0B  db 6c 40 96 12 6c 64 96 16 6c 2c 37 1a 6c f2 97 1e
2:6C1B  db 6c 3c 37 22 6c 40 37 26 6c 44 37 2a 6c 48 37 2e
2:6C2B  db 6c 4c 37 32 6c c8 97 36 6c 98 96 3a 6c 50 37 3e
2:6C3B  db 6c 54 37 42 6c 60 9c 46 6c 58 37 4a 6c 5e 37 4e
2:6C4B  db 6c 4e 9c 52 6c 62 37 56 6c 4a 9c 5a 6c 66 37 5e
2:6C5B  db 6c 6a 37 62 6c 4a 6a 66 6c 2e 6b 6a 6c 02 6b 6e
2:6C6B  db 6c 7a 37 72 6c 52 9c 76 6c 56 9c 7a 6c 16 9c 7e
2:6C7B  db 6c 30 9c 82 6c 86 9c 86 6c c4 9c 8a 6c e0 9c d2
2:6C8B  db 6b 5a 6b fe 6b

; ---------------- sub_s2:6C90 FAR size=36 callers=7
2:6C90  55                   push bp
2:6C91  8bec                 mov bp, sp
2:6C93  66ff7606             push dword ptr [bp + 6]
2:6C97  90                   nop
2:6C98  0e                   push cs
2:6C99  e89cd1               call 0x3e38  ; sub_s2:3E38
2:6C9C  668b4606             mov eax, dword ptr [bp + 6]
2:6CA0  050600               add ax, 6
2:6CA3  6650                 push eax
2:6CA5  90                   nop
2:6CA6  0e                   push cs
2:6CA7  e88ed1               call 0x3e38  ; sub_s2:3E38
2:6CAA  8b4606               mov ax, word ptr [bp + 6]
2:6CAD  8b5608               mov dx, word ptr [bp + 8]
2:6CB0  c9                   leave
2:6CB1  ca0400               retf 4

; ---------------- sub_s2:6CB4 FAR size=56 callers=1
2:6CB4  55                   push bp
2:6CB5  8bec                 mov bp, sp
2:6CB7  57                   push di
2:6CB8  56                   push si
2:6CB9  8b460e               mov ax, word ptr [bp + 0xe]
2:6CBC  8b5610               mov dx, word ptr [bp + 0x10]
2:6CBF  1e                   push ds
2:6CC0  8bf0                 mov si, ax
2:6CC2  8eda                 mov ds, dx
2:6CC4  c47e06               les di, ptr [bp + 6]
2:6CC7  66a5                 movsd dword ptr es:[di], dword ptr [si]
2:6CC9  a5                   movsw word ptr es:[di], word ptr [si]
2:6CCA  1f                   pop ds
2:6CCB  8b5e06               mov bx, word ptr [bp + 6]
2:6CCE  8b460a               mov ax, word ptr [bp + 0xa]
2:6CD1  8b560c               mov dx, word ptr [bp + 0xc]
2:6CD4  1e                   push ds
2:6CD5  8d7f06               lea di, [bx + 6]
2:6CD8  8bf0                 mov si, ax
2:6CDA  8eda                 mov ds, dx
2:6CDC  66a5                 movsd dword ptr es:[di], dword ptr [si]
2:6CDE  a5                   movsw word ptr es:[di], word ptr [si]
2:6CDF  1f                   pop ds
2:6CE0  8b4606               mov ax, word ptr [bp + 6]
2:6CE3  8cc2                 mov dx, es
2:6CE5  5e                   pop si
2:6CE6  5f                   pop di
2:6CE7  c9                   leave
2:6CE8  ca0c00               retf 0xc
2:6CEB  db 00

; ---------------- sub_s2:6CEC FAR size=44 callers=4
2:6CEC  55                   push bp
2:6CED  8bec                 mov bp, sp
2:6CEF  66ff7612             push dword ptr [bp + 0x12]
2:6CF3  ff7610               push word ptr [bp + 0x10]
2:6CF6  66ff7606             push dword ptr [bp + 6]
2:6CFA  90                   nop
2:6CFB  0e                   push cs
2:6CFC  e877d1               call 0x3e76  ; sub_s2:3E76
2:6CFF  66ff760c             push dword ptr [bp + 0xc]
2:6D03  ff760a               push word ptr [bp + 0xa]
2:6D06  668b4606             mov eax, dword ptr [bp + 6]
2:6D0A  050600               add ax, 6
2:6D0D  6650                 push eax
2:6D0F  90                   nop
2:6D10  0e                   push cs
2:6D11  e862d1               call 0x3e76  ; sub_s2:3E76
2:6D14  c9                   leave
2:6D15  ca1000               retf 0x10

; ---------------- sub_s2:6D18 FAR size=38 callers=1
2:6D18  55                   push bp
2:6D19  8bec                 mov bp, sp
2:6D1B  66ff760e             push dword ptr [bp + 0xe]
2:6D1F  66ff7606             push dword ptr [bp + 6]
2:6D23  90                   nop
2:6D24  0e                   push cs
2:6D25  e83ad2               call 0x3f62  ; sub_s2:3F62
2:6D28  66ff760a             push dword ptr [bp + 0xa]
2:6D2C  668b4606             mov eax, dword ptr [bp + 6]
2:6D30  050600               add ax, 6
2:6D33  6650                 push eax
2:6D35  90                   nop
2:6D36  0e                   push cs
2:6D37  e828d2               call 0x3f62  ; sub_s2:3F62
2:6D3A  c9                   leave
2:6D3B  ca0c00               retf 0xc

; ---------------- sub_s2:6D3E FAR size=38 callers=2
2:6D3E  55                   push bp
2:6D3F  8bec                 mov bp, sp
2:6D41  66ff7606             push dword ptr [bp + 6]
2:6D45  66ff760e             push dword ptr [bp + 0xe]
2:6D49  90                   nop
2:6D4A  0e                   push cs
2:6D4B  e814d2               call 0x3f62  ; sub_s2:3F62
2:6D4E  668b4606             mov eax, dword ptr [bp + 6]
2:6D52  050600               add ax, 6
2:6D55  6650                 push eax
2:6D57  66ff760a             push dword ptr [bp + 0xa]
2:6D5B  90                   nop
2:6D5C  0e                   push cs
2:6D5D  e802d2               call 0x3f62  ; sub_s2:3F62
2:6D60  c9                   leave
2:6D61  ca0c00               retf 0xc

; ---------------- sub_s2:6D64 FAR size=38 callers=5
2:6D64  55                   push bp
2:6D65  8bec                 mov bp, sp
2:6D67  66ff7606             push dword ptr [bp + 6]
2:6D6B  66ff760a             push dword ptr [bp + 0xa]
2:6D6F  90                   nop
2:6D70  0e                   push cs
2:6D71  e8eed1               call 0x3f62  ; sub_s2:3F62
2:6D74  668b4606             mov eax, dword ptr [bp + 6]
2:6D78  050600               add ax, 6
2:6D7B  6650                 push eax
2:6D7D  66ff760a             push dword ptr [bp + 0xa]
2:6D81  90                   nop
2:6D82  0e                   push cs
2:6D83  e85cd1               call 0x3ee2  ; sub_s2:3EE2
2:6D86  c9                   leave
2:6D87  ca0800               retf 8

; ---------------- sub_s2:6D8A FAR size=70 callers=2
2:6D8A  55                   push bp
2:6D8B  8bec                 mov bp, sp
2:6D8D  c45e06               les bx, ptr [bp + 6]
2:6D90  6626c70700000000     mov dword ptr es:[bx], 0
2:6D98  26c74704ffff         mov word ptr es:[bx + 4], 0xffff
2:6D9E  b80400               mov ax, 4
2:6DA1  a31203               mov word ptr [0x312], ax
2:6DA4  50                   push ax
2:6DA5  66ff361c03           push dword ptr [0x31c]
2:6DAA  1e                   push ds
2:6DAB  68a065               push 0x65a0
2:6DAE  9a9c3fef6b           lcall 0x6bef, 0x3f9c  ; _fsprintf@s1:3F9C
2:6DB3  8be5                 mov sp, bp
2:6DB5  66ff760a             push dword ptr [bp + 0xa]
2:6DB9  90                   nop
2:6DBA  0e                   push cs
2:6DBB  e82af3               call 0x60e8  ; sub_s2:60E8
2:6DBE  c45e06               les bx, ptr [bp + 6]
2:6DC1  268907               mov word ptr es:[bx], ax
2:6DC4  26895702             mov word ptr es:[bx + 2], dx
2:6DC8  8bc3                 mov ax, bx
2:6DCA  8cc2                 mov dx, es
2:6DCC  c9                   leave
2:6DCD  ca0800               retf 8

; ---------------- sub_s2:6DD0 FAR size=50 callers=2
;   apis: KERNEL._lclose
2:6DD0  c8080000             enter 8, 0
2:6DD4  c45e06               les bx, ptr [bp + 6]
2:6DD7  26837f04ff           cmp word ptr es:[bx + 4], -1
2:6DDC  7412                 je 0x6df0
2:6DDE  26ff7704             push word ptr es:[bx + 4]
2:6DE2  9a584a0000           lcall 0, 0x4a58  ; KERNEL._lclose
2:6DE7  c45e06               les bx, ptr [bp + 6]
2:6DEA  26c74704ffff         mov word ptr es:[bx + 4], 0xffff
loc_6DF0:
2:6DF0  c45e06               les bx, ptr [bp + 6]
2:6DF3  66268b0f             mov ecx, dword ptr es:[bx]
2:6DF7  6651                 push ecx
2:6DF9  9ace17b16d           lcall 0x6db1, 0x17ce  ; operator_delete@s1:17CE
2:6DFE  c9                   leave
2:6DFF  ca0400               retf 4

; ---------------- sub_s2:6E02 FAR size=118 callers=1
;   apis: KERNEL._lclose
2:6E02  c8020000             enter 2, 0
2:6E06  c70610030000         mov word ptr [0x310], 0
2:6E0C  66ff7606             push dword ptr [bp + 6]
2:6E10  90                   nop
2:6E11  0e                   push cs
2:6E12  e89102               call 0x70a6  ; sub_s2:70A6
2:6E15  0bc0                 or ax, ax
2:6E17  7507                 jne 0x6e20
loc_6E19:
2:6E19  33c0                 xor ax, ax
2:6E1B  c9                   leave
2:6E1C  ca0400               retf 4
2:6E1F  db 90
loc_6E20:
2:6E20  c45e06               les bx, ptr [bp + 6]
2:6E23  26ff7704             push word ptr es:[bx + 4]
2:6E27  8d46fe               lea ax, [bp - 2]
2:6E2A  16                   push ss
2:6E2B  50                   push ax
2:6E2C  90                   nop
2:6E2D  0e                   push cs
2:6E2E  e87704               call 0x72a8  ; sub_s2:72A8
2:6E31  8d46fe               lea ax, [bp - 2]
2:6E34  16                   push ss
2:6E35  50                   push ax
2:6E36  66ff7606             push dword ptr [bp + 6]
2:6E3A  90                   nop
2:6E3B  0e                   push cs
2:6E3C  e8c701               call 0x7006  ; sub_s2:7006
2:6E3F  0bc0                 or ax, ax
2:6E41  7412                 je 0x6e55
2:6E43  8d46fe               lea ax, [bp - 2]
2:6E46  16                   push ss
2:6E47  50                   push ax
2:6E48  66ff7606             push dword ptr [bp + 6]
2:6E4C  90                   nop
2:6E4D  0e                   push cs
2:6E4E  e89d00               call 0x6eee  ; sub_s2:6EEE
2:6E51  0bc0                 or ax, ax
2:6E53  750f                 jne 0x6e64
loc_6E55:
2:6E55  c45e06               les bx, ptr [bp + 6]
2:6E58  26ff7704             push word ptr es:[bx + 4]
2:6E5C  9ae36d0000           lcall 0, 0x6de3  ; KERNEL._lclose
2:6E61  ebb6                 jmp 0x6e19
2:6E63  db 90
loc_6E64:
2:6E64  66ff7606             push dword ptr [bp + 6]
2:6E68  90                   nop
2:6E69  0e                   push cs
2:6E6A  e8ff03               call 0x726c  ; sub_s2:726C
2:6E6D  0bc0                 or ax, ax
2:6E6F  74a8                 je 0x6e19
2:6E71  b80100               mov ax, 1
2:6E74  c9                   leave
2:6E75  ca0400               retf 4

; ---------------- sub_s2:6E78 FAR size=118 callers=1
;   apis: KERNEL._lclose
2:6E78  c8020000             enter 2, 0
2:6E7C  c70610030000         mov word ptr [0x310], 0
2:6E82  66ff7606             push dword ptr [bp + 6]
2:6E86  90                   nop
2:6E87  0e                   push cs
2:6E88  e8bb02               call 0x7146  ; sub_s2:7146
2:6E8B  0bc0                 or ax, ax
2:6E8D  7507                 jne 0x6e96
loc_6E8F:
2:6E8F  33c0                 xor ax, ax
2:6E91  c9                   leave
2:6E92  ca0400               retf 4
2:6E95  db 90
loc_6E96:
2:6E96  c45e06               les bx, ptr [bp + 6]
2:6E99  26ff7704             push word ptr es:[bx + 4]
2:6E9D  8d46fe               lea ax, [bp - 2]
2:6EA0  16                   push ss
2:6EA1  50                   push ax
2:6EA2  90                   nop
2:6EA3  0e                   push cs
2:6EA4  e80104               call 0x72a8  ; sub_s2:72A8
2:6EA7  8d46fe               lea ax, [bp - 2]
2:6EAA  16                   push ss
2:6EAB  50                   push ax
2:6EAC  66ff7606             push dword ptr [bp + 6]
2:6EB0  90                   nop
2:6EB1  0e                   push cs
2:6EB2  e8a101               call 0x7056  ; sub_s2:7056
2:6EB5  0bc0                 or ax, ax
2:6EB7  7412                 je 0x6ecb
2:6EB9  8d46fe               lea ax, [bp - 2]
2:6EBC  16                   push ss
2:6EBD  50                   push ax
2:6EBE  66ff7606             push dword ptr [bp + 6]
2:6EC2  90                   nop
2:6EC3  0e                   push cs
2:6EC4  e8b300               call 0x6f7a  ; sub_s2:6F7A
2:6EC7  0bc0                 or ax, ax
2:6EC9  750f                 jne 0x6eda
loc_6ECB:
2:6ECB  c45e06               les bx, ptr [bp + 6]
2:6ECE  26ff7704             push word ptr es:[bx + 4]
2:6ED2  9a5d6e0000           lcall 0, 0x6e5d  ; KERNEL._lclose
2:6ED7  ebb6                 jmp 0x6e8f
2:6ED9  db 90
loc_6EDA:
2:6EDA  66ff7606             push dword ptr [bp + 6]
2:6EDE  90                   nop
2:6EDF  0e                   push cs
2:6EE0  e88903               call 0x726c  ; sub_s2:726C
2:6EE3  0bc0                 or ax, ax
2:6EE5  74a8                 je 0x6e8f
2:6EE7  b80100               mov ax, 1
2:6EEA  c9                   leave
2:6EEB  ca0400               retf 4

; ---------------- sub_s2:6EEE FAR size=140 callers=1
2:6EEE  c8180000             enter 0x18, 0
2:6EF2  c41e4857             les bx, ptr [0x5748]  ; g_sim
2:6EF6  66268b07             mov eax, dword ptr es:[bx]
2:6EFA  668946fc             mov dword ptr [bp - 4], eax
2:6EFE  c45efc               les bx, ptr [bp - 4]
2:6F01  66268b07             mov eax, dword ptr es:[bx]
2:6F05  668946f8             mov dword ptr [bp - 8], eax
2:6F09  8d46f4               lea ax, [bp - 0xc]
2:6F0C  16                   push ss
2:6F0D  50                   push ax
2:6F0E  9a3ea4666f           lcall 0x6f66, 0xa43e  ; sub_s5:A43E
2:6F13  66ff760a             push dword ptr [bp + 0xa]
2:6F17  66ff76f8             push dword ptr [bp - 8]
2:6F1B  9aa0d7426f           lcall 0x6f42, 0xd7a0  ; sub_s6:D7A0
2:6F20  0bc0                 or ax, ax
2:6F22  7448                 je 0x6f6c
2:6F24  66ff760a             push dword ptr [bp + 0xa]
2:6F28  66ff363657           push dword ptr [0x5736]  ; g_handleAllocator
2:6F2D  9a1a5cf314           lcall 0x14f3, 0x5c1a  ; sub_s7:5C1A
2:6F32  0bc0                 or ax, ax
2:6F34  7436                 je 0x6f6c
2:6F36  66ff760a             push dword ptr [bp + 0xa]
2:6F3A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:6F3F  9ae2dcd308           lcall 0x8d3, 0xdce2  ; sub_s6:DCE2
2:6F44  0bc0                 or ax, ax
2:6F46  7424                 je 0x6f6c
2:6F48  66ff760a             push dword ptr [bp + 0xa]
2:6F4C  66ff36645a           push dword ptr [0x5a64]
2:6F51  9a207b8e2d           lcall 0x2d8e, 0x7b20  ; sub_s8:7B20
2:6F56  0bc0                 or ax, ax
2:6F58  7412                 je 0x6f6c
2:6F5A  66ff760a             push dword ptr [bp + 0xa]
2:6F5E  8d46f4               lea ax, [bp - 0xc]
2:6F61  16                   push ss
2:6F62  50                   push ax
2:6F63  9a44a6ce2f           lcall 0x2fce, 0xa644  ; sub_s5:A644
2:6F68  0bc0                 or ax, ax
2:6F6A  7506                 jne 0x6f72
loc_6F6C:
2:6F6C  33c0                 xor ax, ax
2:6F6E  c9                   leave
2:6F6F  ca0800               retf 8
loc_6F72:
2:6F72  b80100               mov ax, 1
2:6F75  c9                   leave
2:6F76  ca0800               retf 8
2:6F79  db 00

; ---------------- sub_s2:6F7A FAR size=140 callers=1
2:6F7A  c8180000             enter 0x18, 0
2:6F7E  c41e4857             les bx, ptr [0x5748]  ; g_sim
2:6F82  66268b07             mov eax, dword ptr es:[bx]
2:6F86  668946fc             mov dword ptr [bp - 4], eax
2:6F8A  c45efc               les bx, ptr [bp - 4]
2:6F8D  66268b07             mov eax, dword ptr es:[bx]
2:6F91  668946f8             mov dword ptr [bp - 8], eax
2:6F95  8d46f4               lea ax, [bp - 0xc]
2:6F98  16                   push ss
2:6F99  50                   push ax
2:6F9A  9a3ea4f26f           lcall 0x6ff2, 0xa43e  ; sub_s5:A43E
2:6F9F  66ff760a             push dword ptr [bp + 0xa]
2:6FA3  66ff76f8             push dword ptr [bp - 8]
2:6FA7  9abad7ce6f           lcall 0x6fce, 0xd7ba  ; sub_s6:D7BA
2:6FAC  0bc0                 or ax, ax
2:6FAE  7448                 je 0x6ff8
2:6FB0  66ff760a             push dword ptr [bp + 0xa]
2:6FB4  66ff363657           push dword ptr [0x5736]  ; g_handleAllocator
2:6FB9  9a525c306f           lcall 0x6f30, 0x5c52  ; sub_s7:5C52
2:6FBE  0bc0                 or ax, ax
2:6FC0  7436                 je 0x6ff8
2:6FC2  66ff760a             push dword ptr [bp + 0xa]
2:6FC6  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:6FCB  9af2de1e6f           lcall 0x6f1e, 0xdef2  ; sub_s6:DEF2
2:6FD0  0bc0                 or ax, ax
2:6FD2  7424                 je 0x6ff8
2:6FD4  66ff760a             push dword ptr [bp + 0xa]
2:6FD8  66ff36645a           push dword ptr [0x5a64]
2:6FDD  9a027c546f           lcall 0x6f54, 0x7c02  ; sub_s8:7C02
2:6FE2  0bc0                 or ax, ax
2:6FE4  7412                 je 0x6ff8
2:6FE6  66ff760a             push dword ptr [bp + 0xa]
2:6FEA  8d46f4               lea ax, [bp - 0xc]
2:6FED  16                   push ss
2:6FEE  50                   push ax
2:6FEF  9a5ea6116f           lcall 0x6f11, 0xa65e  ; sub_s5:A65E
2:6FF4  0bc0                 or ax, ax
2:6FF6  7506                 jne 0x6ffe
loc_6FF8:
2:6FF8  33c0                 xor ax, ax
2:6FFA  c9                   leave
2:6FFB  ca0800               retf 8
loc_6FFE:
2:6FFE  b80100               mov ax, 1
2:7001  c9                   leave
2:7002  ca0800               retf 8
2:7005  db 00

; ---------------- sub_s2:7006 FAR size=80 callers=1
2:7006  c8060000             enter 6, 0
2:700A  c746fe0000           mov word ptr [bp - 2], 0
2:700F  eb04                 jmp 0x7015
2:7011  db 90
loc_7012:
2:7012  ff46fe               inc word ptr [bp - 2]
loc_7015:
2:7015  a13403               mov ax, word ptr [0x334]
2:7018  3946fe               cmp word ptr [bp - 2], ax
2:701B  7d31                 jge 0x704e
2:701D  8b5efe               mov bx, word ptr [bp - 2]
2:7020  03db                 add bx, bx
2:7022  ffb72003             push word ptr [bx + 0x320]
2:7026  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:702B  9aba203d62           lcall 0x623d, 0x20ba  ; sub_s3:20BA
2:7030  8946fa               mov word ptr [bp - 6], ax
2:7033  8956fc               mov word ptr [bp - 4], dx
2:7036  66ff760a             push dword ptr [bp + 0xa]
2:703A  52                   push dx
2:703B  c45efa               les bx, ptr [bp - 6]
2:703E  50                   push ax
2:703F  26c41f               les bx, ptr es:[bx]
2:7042  26ff5f08             lcall es:[bx + 8]
2:7046  0bc0                 or ax, ax
2:7048  75c8                 jne 0x7012
2:704A  c9                   leave
2:704B  ca0800               retf 8
loc_704E:
2:704E  b80100               mov ax, 1
2:7051  c9                   leave
2:7052  ca0800               retf 8
2:7055  db 00

; ---------------- sub_s2:7056 FAR size=80 callers=1
2:7056  c8060000             enter 6, 0
2:705A  c746fe0000           mov word ptr [bp - 2], 0
2:705F  eb04                 jmp 0x7065
2:7061  db 90
loc_7062:
2:7062  ff46fe               inc word ptr [bp - 2]
loc_7065:
2:7065  a13403               mov ax, word ptr [0x334]
2:7068  3946fe               cmp word ptr [bp - 2], ax
2:706B  7d31                 jge 0x709e
2:706D  8b5efe               mov bx, word ptr [bp - 2]
2:7070  03db                 add bx, bx
2:7072  ffb72003             push word ptr [bx + 0x320]
2:7076  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:707B  9aba202e70           lcall 0x702e, 0x20ba  ; sub_s3:20BA
2:7080  8946fa               mov word ptr [bp - 6], ax
2:7083  8956fc               mov word ptr [bp - 4], dx
2:7086  66ff760a             push dword ptr [bp + 0xa]
2:708A  52                   push dx
2:708B  c45efa               les bx, ptr [bp - 6]
2:708E  50                   push ax
2:708F  26c41f               les bx, ptr es:[bx]
2:7092  26ff5f0c             lcall es:[bx + 0xc]
2:7096  0bc0                 or ax, ax
2:7098  75c8                 jne 0x7062
2:709A  c9                   leave
2:709B  ca0800               retf 8
loc_709E:
2:709E  b80100               mov ax, 1
2:70A1  c9                   leave
2:70A2  ca0800               retf 8
2:70A5  db 00

; ---------------- sub_s2:70A6 FAR size=160 callers=1
;   apis: KERNEL._hwrite, KERNEL._lclose, KERNEL._lcreat
2:70A6  c8060000             enter 6, 0
2:70AA  57                   push di
2:70AB  56                   push si
2:70AC  c45e06               les bx, ptr [bp + 6]
2:70AF  26837f04ff           cmp word ptr es:[bx + 4], -1
2:70B4  7412                 je 0x70c8
2:70B6  26ff7704             push word ptr es:[bx + 4]
2:70BA  9ad36e0000           lcall 0, 0x6ed3  ; KERNEL._lclose
2:70BF  c45e06               les bx, ptr [bp + 6]
2:70C2  26c74704ffff         mov word ptr es:[bx + 4], 0xffff
loc_70C8:
2:70C8  c45e06               les bx, ptr [bp + 6]
2:70CB  6626ff37             push dword ptr es:[bx]
2:70CF  6a00                 push 0
2:70D1  9affff0000           lcall 0, 0xffff  ; KERNEL._lcreat
2:70D6  c45e06               les bx, ptr [bp + 6]
2:70D9  26894704             mov word ptr es:[bx + 4], ax
2:70DD  3dffff               cmp ax, 0xffff
2:70E0  750e                 jne 0x70f0
2:70E2  c7061003cf06         mov word ptr [0x310], 0x6cf
loc_70E8:
2:70E8  33c0                 xor ax, ax
2:70EA  5e                   pop si
2:70EB  5f                   pop di
2:70EC  c9                   leave
2:70ED  ca0400               retf 4
loc_70F0:
2:70F0  b80400               mov ax, 4
2:70F3  a31203               mov word ptr [0x312], ax
2:70F6  50                   push ax
2:70F7  66ff361c03           push dword ptr [0x31c]
2:70FC  1e                   push ds
2:70FD  68a065               push 0x65a0
2:7100  9a9c3f0f71           lcall 0x710f, 0x3f9c  ; _fsprintf@s1:3F9C
2:7105  83c40a               add sp, 0xa
2:7108  1e                   push ds
2:7109  68a065               push 0x65a0
2:710C  9aa43dfc6d           lcall 0x6dfc, 0x3da4  ; sub_s1:3DA4
2:7111  83c404               add sp, 4
2:7114  c45e06               les bx, ptr [bp + 6]
2:7117  26ff7704             push word ptr es:[bx + 4]
2:711B  1e                   push ds
2:711C  68a065               push 0x65a0
2:711F  99                   cdq
2:7120  52                   push dx
2:7121  50                   push ax
2:7122  8bf0                 mov si, ax
2:7124  8bfa                 mov di, dx
2:7126  9affff0000           lcall 0, 0xffff  ; KERNEL._hwrite
2:712B  3bc6                 cmp ax, si
2:712D  7504                 jne 0x7133
2:712F  3bd7                 cmp dx, di
2:7131  7409                 je 0x713c
loc_7133:
2:7133  c7061003d006         mov word ptr [0x310], 0x6d0
2:7139  ebad                 jmp 0x70e8
2:713B  db 90
loc_713C:
2:713C  b80100               mov ax, 1
2:713F  5e                   pop si
2:7140  5f                   pop di
2:7141  c9                   leave
2:7142  ca0400               retf 4
2:7145  db 00

; ---------------- sub_s2:7146 FAR size=90 callers=1
;   apis: KERNEL._lclose, KERNEL._lopen
2:7146  55                   push bp
2:7147  8bec                 mov bp, sp
2:7149  c45e06               les bx, ptr [bp + 6]
2:714C  26837f04ff           cmp word ptr es:[bx + 4], -1
2:7151  7412                 je 0x7165
2:7153  26ff7704             push word ptr es:[bx + 4]
2:7157  9abb700000           lcall 0, 0x70bb  ; KERNEL._lclose
2:715C  c45e06               les bx, ptr [bp + 6]
2:715F  26c74704ffff         mov word ptr es:[bx + 4], 0xffff
loc_7165:
2:7165  c45e06               les bx, ptr [bp + 6]
2:7168  6626ff37             push dword ptr es:[bx]
2:716C  6a00                 push 0
2:716E  9a1b4a0000           lcall 0, 0x4a1b  ; KERNEL._lopen
2:7173  c45e06               les bx, ptr [bp + 6]
2:7176  26894704             mov word ptr es:[bx + 4], ax
2:717A  3dffff               cmp ax, 0xffff
2:717D  750d                 jne 0x718c
2:717F  c7061003cf06         mov word ptr [0x310], 0x6cf
loc_7185:
2:7185  33c0                 xor ax, ax
2:7187  c9                   leave
2:7188  ca0400               retf 4
2:718B  db 90
loc_718C:
2:718C  66ff7606             push dword ptr [bp + 6]
2:7190  90                   nop
2:7191  0e                   push cs
2:7192  e80b00               call 0x71a0  ; sub_s2:71A0
2:7195  0bc0                 or ax, ax
2:7197  74ec                 je 0x7185
2:7199  b80100               mov ax, 1
2:719C  c9                   leave
2:719D  ca0400               retf 4

; ---------------- sub_s2:71A0 FAR size=204 callers=1
;   apis: KERNEL._hread
2:71A0  c81a0000             enter 0x1a, 0
2:71A4  57                   push di
2:71A5  56                   push si
2:71A6  c746fe0100           mov word ptr [bp - 2], 1
2:71AB  1e                   push ds
2:71AC  68a065               push 0x65a0
2:71AF  9aa43d5d72           lcall 0x725d, 0x3da4  ; sub_s1:3DA4
2:71B4  83c404               add sp, 4
2:71B7  8946f2               mov word ptr [bp - 0xe], ax
2:71BA  c746ec0000           mov word ptr [bp - 0x14], 0
2:71BF  c45e06               les bx, ptr [bp + 6]
2:71C2  26ff7704             push word ptr es:[bx + 4]
2:71C6  8d46f4               lea ax, [bp - 0xc]
2:71C9  16                   push ss
2:71CA  50                   push ax
2:71CB  8b46f2               mov ax, word ptr [bp - 0xe]
2:71CE  99                   cdq
2:71CF  52                   push dx
2:71D0  50                   push ax
2:71D1  8bf0                 mov si, ax
2:71D3  8bfa                 mov di, dx
2:71D5  9a434a0000           lcall 0, 0x4a43  ; KERNEL._hread
2:71DA  8946ee               mov word ptr [bp - 0x12], ax
2:71DD  8956f0               mov word ptr [bp - 0x10], dx
2:71E0  3bd7                 cmp dx, di
2:71E2  7c08                 jl 0x71ec
2:71E4  7f04                 jg 0x71ea
2:71E6  3bc6                 cmp ax, si
2:71E8  7602                 jbe 0x71ec
loc_71EA:
2:71EA  8bc6                 mov ax, si
loc_71EC:
2:71EC  2d0200               sub ax, 2
2:71EF  7902                 jns 0x71f3
2:71F1  33c0                 xor ax, ax
loc_71F3:
2:71F3  8946ea               mov word ptr [bp - 0x16], ax
2:71F6  c746e80200           mov word ptr [bp - 0x18], 2
2:71FB  eb1a                 jmp 0x7217
2:71FD  db 90
loc_71FE:
2:71FE  b80a00               mov ax, 0xa
2:7201  f76eec               imul word ptr [bp - 0x14]
2:7204  8946ec               mov word ptr [bp - 0x14], ax
2:7207  8b76e8               mov si, word ptr [bp - 0x18]
2:720A  8a42f4               mov al, byte ptr [bp + si - 0xc]
2:720D  98                   cwde
2:720E  2d3000               sub ax, 0x30
2:7211  0146ec               add word ptr [bp - 0x14], ax
2:7214  ff46e8               inc word ptr [bp - 0x18]
loc_7217:
2:7217  8b46ea               mov ax, word ptr [bp - 0x16]
2:721A  ff4eea               dec word ptr [bp - 0x16]
2:721D  0bc0                 or ax, ax
2:721F  75dd                 jne 0x71fe
2:7221  8b46ec               mov ax, word ptr [bp - 0x14]
2:7224  48                   dec ax
2:7225  7407                 je 0x722e
2:7227  2d0300               sub ax, 3
2:722A  740a                 je 0x7236
2:722C  eb10                 jmp 0x723e
loc_722E:
2:722E  c70612030100         mov word ptr [0x312], 1
2:7234  eb17                 jmp 0x724d
loc_7236:
2:7236  c70612030400         mov word ptr [0x312], 4
2:723C  eb0f                 jmp 0x724d
loc_723E:
2:723E  c646fd00             mov byte ptr [bp - 3], 0
2:7242  c70612030100         mov word ptr [0x312], 1
2:7248  c746fe0000           mov word ptr [bp - 2], 0
loc_724D:
2:724D  ff361203             push word ptr [0x312]
2:7251  66ff361c03           push dword ptr [0x31c]
2:7256  1e                   push ds
2:7257  68a065               push 0x65a0
2:725A  9a9c3f0371           lcall 0x7103, 0x3f9c  ; _fsprintf@s1:3F9C
2:725F  83c40a               add sp, 0xa
2:7262  8b46fe               mov ax, word ptr [bp - 2]
2:7265  5e                   pop si
2:7266  5f                   pop di
2:7267  c9                   leave
2:7268  ca0400               retf 4
2:726B  db 00

; ---------------- sub_s2:726C FAR size=60 callers=2
;   apis: KERNEL._lclose
2:726C  c8020000             enter 2, 0
2:7270  c45e06               les bx, ptr [bp + 6]
2:7273  26837f04ff           cmp word ptr es:[bx + 4], -1
2:7278  7427                 je 0x72a1
2:727A  26ff7704             push word ptr es:[bx + 4]
2:727E  9a58710000           lcall 0, 0x7158  ; KERNEL._lclose
2:7283  40                   inc ax
2:7284  750c                 jne 0x7292
2:7286  c7061003d106         mov word ptr [0x310], 0x6d1
2:728C  33c0                 xor ax, ax
2:728E  c9                   leave
2:728F  ca0400               retf 4
loc_7292:
2:7292  c45e06               les bx, ptr [bp + 6]
2:7295  26c74704ffff         mov word ptr es:[bx + 4], 0xffff
2:729B  c70610030000         mov word ptr [0x310], 0
loc_72A1:
2:72A1  b80100               mov ax, 1
2:72A4  c9                   leave
2:72A5  ca0400               retf 4

; ---------------- sub_s2:72A8 FAR size=20 callers=2
2:72A8  55                   push bp
2:72A9  8bec                 mov bp, sp
2:72AB  8b460a               mov ax, word ptr [bp + 0xa]
2:72AE  c45e06               les bx, ptr [bp + 6]
2:72B1  268907               mov word ptr es:[bx], ax
2:72B4  8bc3                 mov ax, bx
2:72B6  8cc2                 mov dx, es
2:72B8  c9                   leave
2:72B9  ca0600               retf 6

; ---------------- sub_s2:72BC FAR size=208 callers=8
2:72BC  55                   push bp
2:72BD  8bec                 mov bp, sp
2:72BF  833e120301           cmp word ptr [0x312], 1
2:72C4  0f8fbc00             jg 0x7384
2:72C8  8b460a               mov ax, word ptr [bp + 0xa]
2:72CB  eb7d                 jmp 0x734a
2:72CD  db 90
loc_72CE:
2:72CE  b80100               mov ax, 1
2:72D1  e9b300               jmp 0x7387
loc_72D4:
2:72D4  b80200               mov ax, 2
2:72D7  e9ad00               jmp 0x7387
loc_72DA:
2:72DA  b80300               mov ax, 3
2:72DD  e9a700               jmp 0x7387
loc_72E0:
2:72E0  b80500               mov ax, 5
2:72E3  e9a100               jmp 0x7387
loc_72E6:
2:72E6  b80400               mov ax, 4
2:72E9  e99b00               jmp 0x7387
loc_72EC:
2:72EC  b80600               mov ax, 6
2:72EF  e99500               jmp 0x7387
loc_72F2:
2:72F2  b80700               mov ax, 7
2:72F5  e98f00               jmp 0x7387
loc_72F8:
2:72F8  b80800               mov ax, 8
2:72FB  e98900               jmp 0x7387
loc_72FE:
2:72FE  b80900               mov ax, 9
2:7301  e98300               jmp 0x7387
2:7304  db 90 90
loc_7306:
2:7306  b80a00               mov ax, 0xa
2:7309  eb7c                 jmp 0x7387
2:730B  db 90
loc_730C:
2:730C  b80b00               mov ax, 0xb
2:730F  eb76                 jmp 0x7387
2:7311  db 90
loc_7312:
2:7312  b80c00               mov ax, 0xc
2:7315  eb70                 jmp 0x7387
2:7317  db 90
loc_7318:
2:7318  b80d00               mov ax, 0xd
2:731B  eb6a                 jmp 0x7387
2:731D  db 90
loc_731E:
2:731E  b80e00               mov ax, 0xe
2:7321  eb64                 jmp 0x7387
2:7323  db 90
loc_7324:
2:7324  b80f00               mov ax, 0xf
2:7327  eb5e                 jmp 0x7387
2:7329  db 90
loc_732A:
2:732A  b81000               mov ax, 0x10
2:732D  c9                   leave
2:732E  ca0600               retf 6
2:7331  db 90
loc_7332:
2:7332  b81100               mov ax, 0x11
2:7335  c9                   leave
2:7336  ca0600               retf 6
2:7339  db 90
loc_733A:
2:733A  b81200               mov ax, 0x12  ; 'version %d %d'
2:733D  c9                   leave
2:733E  ca0600               retf 6
2:7341  db 90
loc_7342:
2:7342  b81300               mov ax, 0x13
2:7345  c9                   leave
2:7346  ca0600               retf 6
2:7349  db 90
loc_734A:
2:734A  48                   dec ax
2:734B  3d1200               cmp ax, 0x12
2:734E  772e                 ja 0x737e
2:7350  03c0                 add ax, ax
2:7352  93                   xchg bx, ax
2:7353  2effa75873           jmp word ptr cs:[bx + 0x7358]
switch_table_7358:
    dw loc_72CE
    dw loc_72D4
    dw loc_72DA
    dw loc_72E0
    dw loc_72E6
    dw loc_72EC
    dw loc_72F2
    dw loc_72F8
    dw loc_72FE
    dw loc_7306
    dw loc_730C
    dw loc_7312
    dw loc_7318
    dw loc_731E
    dw loc_7324
    dw loc_732A
    dw loc_7332
    dw loc_733A
    dw loc_7342
loc_737E:
2:737E  33c0                 xor ax, ax
2:7380  c9                   leave
2:7381  ca0600               retf 6
loc_7384:
2:7384  8b460a               mov ax, word ptr [bp + 0xa]
loc_7387:
2:7387  c9                   leave
2:7388  ca0600               retf 6
2:738B  db 00

; ---------------- sub_s2:738C FAR size=94 callers=1
2:738C  55                   push bp
2:738D  8bec                 mov bp, sp
2:738F  8b460a               mov ax, word ptr [bp + 0xa]
2:7392  eb34                 jmp 0x73c8
loc_7394:
2:7394  b80300               mov ax, 3
2:7397  eb4d                 jmp 0x73e6
2:7399  db 90
loc_739A:
2:739A  b80400               mov ax, 4
2:739D  eb47                 jmp 0x73e6
2:739F  db 90
loc_73A0:
2:73A0  b80500               mov ax, 5
2:73A3  c9                   leave
2:73A4  ca0600               retf 6
2:73A7  db 90
loc_73A8:
2:73A8  b80600               mov ax, 6
2:73AB  c9                   leave
2:73AC  ca0600               retf 6
2:73AF  db 90
loc_73B0:
2:73B0  b80800               mov ax, 8
2:73B3  c9                   leave
2:73B4  ca0600               retf 6
2:73B7  db 90
loc_73B8:
2:73B8  b80900               mov ax, 9
2:73BB  c9                   leave
2:73BC  ca0600               retf 6
2:73BF  db 90
loc_73C0:
2:73C0  b80a00               mov ax, 0xa
2:73C3  c9                   leave
2:73C4  ca0600               retf 6
2:73C7  db 90
loc_73C8:
2:73C8  48                   dec ax
2:73C9  3d0600               cmp ax, 6
2:73CC  7716                 ja 0x73e4
2:73CE  03c0                 add ax, ax
2:73D0  93                   xchg bx, ax
2:73D1  2effa7d673           jmp word ptr cs:[bx + 0x73d6]
switch_table_73D6:
    dw loc_7394
    dw loc_739A
    dw loc_73A0
    dw loc_73A8
    dw loc_73B0
    dw loc_73B8
    dw loc_73C0
loc_73E4:
2:73E4  33c0                 xor ax, ax
loc_73E6:
2:73E6  c9                   leave
2:73E7  ca0600               retf 6

; ---------------- sub_s2:73EA FAR size=350 callers=4
2:73EA  c8020000             enter 2, 0
2:73EE  c746fe0000           mov word ptr [bp - 2], 0
2:73F3  833e120301           cmp word ptr [0x312], 1
2:73F8  0f8f3e01             jg 0x753a
2:73FC  8b460a               mov ax, word ptr [bp + 0xa]
2:73FF  eb29                 jmp 0x742a
2:7401  db 90
loc_7402:
2:7402  8b460a               mov ax, word ptr [bp + 0xa]
2:7405  050300               add ax, 3
2:7408  e93201               jmp 0x753d
2:740B  db 90
loc_740C:
2:740C  8b460a               mov ax, word ptr [bp + 0xa]
2:740F  050400               add ax, 4
2:7412  e92801               jmp 0x753d
2:7415  db 90
loc_7416:
2:7416  8b460a               mov ax, word ptr [bp + 0xa]
2:7419  050800               add ax, 8
2:741C  e91e01               jmp 0x753d
2:741F  db 90
loc_7420:
2:7420  8b460a               mov ax, word ptr [bp + 0xa]
2:7423  050900               add ax, 9
2:7426  e91401               jmp 0x753d
2:7429  db 90
loc_742A:
2:742A  48                   dec ax
2:742B  3d7f00               cmp ax, 0x7f
2:742E  0f870e01             ja 0x7540
2:7432  03c0                 add ax, ax
2:7434  93                   xchg bx, ax
2:7435  2effa73a74           jmp word ptr cs:[bx + 0x743a]
switch_table_743A:
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_753A
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_7402
    dw loc_740C
    dw loc_740C
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7416
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
    dw loc_7420
loc_753A:
2:753A  8b460a               mov ax, word ptr [bp + 0xa]
loc_753D:
2:753D  8946fe               mov word ptr [bp - 2], ax
loc_7540:
2:7540  8b46fe               mov ax, word ptr [bp - 2]
2:7543  c9                   leave
2:7544  ca0600               retf 6
2:7547  db 00

; ---------------- sub_s2:7548 FAR size=294 callers=1
2:7548  c82e0000             enter 0x2e, 0
2:754C  662bc0               sub eax, eax
2:754F  668946fc             mov dword ptr [bp - 4], eax
2:7553  50                   push ax
2:7554  6a04                 push 4
2:7556  8d46fc               lea ax, [bp - 4]
2:7559  16                   push ss
2:755A  50                   push ax
2:755B  66ff7606             push dword ptr [bp + 6]
2:755F  90                   nop
2:7560  0e                   push cs
2:7561  e88a08               call 0x7dee  ; File_read@s2:7DEE
2:7564  0bc0                 or ax, ax
2:7566  7506                 jne 0x756e
loc_7568:
2:7568  33c0                 xor ax, ax
2:756A  c9                   leave
2:756B  ca0800               retf 8
loc_756E:
2:756E  66837efc00           cmp dword ptr [bp - 4], 0
2:7573  7507                 jne 0x757c
loc_7575:
2:7575  b80100               mov ax, 1
2:7578  c9                   leave
2:7579  ca0800               retf 8
loc_757C:
2:757C  668b46fc             mov eax, dword ptr [bp - 4]
2:7580  8b56fe               mov dx, word ptr [bp - 2]
2:7583  663dc8000000         cmp eax, 0xc8
2:7589  7305                 jae 0x7590
2:758B  33d2                 xor dx, dx
2:758D  b8c800               mov ax, 0xc8
loc_7590:
2:7590  8946f8               mov word ptr [bp - 8], ax
2:7593  8956fa               mov word ptr [bp - 6], dx
2:7596  c45e0a               les bx, ptr [bp + 0xa]
2:7599  6626833f00           cmp dword ptr es:[bx], 0
2:759E  753b                 jne 0x75db
2:75A0  6a1e                 push 0x1e
2:75A2  9a9c17b271           lcall 0x71b2, 0x179c  ; operator_new@s1:179C
2:75A7  83c402               add sp, 2
2:75AA  8946e2               mov word ptr [bp - 0x1e], ax
2:75AD  8956e4               mov word ptr [bp - 0x1c], dx
2:75B0  0bd0                 or dx, ax
2:75B2  741c                 je 0x75d0
2:75B4  66ff76f8             push dword ptr [bp - 8]
2:75B8  666a64               push 0x64
2:75BB  ff76e4               push word ptr [bp - 0x1c]
2:75BE  50                   push ax
2:75BF  9a44c49d6f           lcall 0x6f9d, 0xc444  ; sub_s5:C444
2:75C4  c45e0a               les bx, ptr [bp + 0xa]
2:75C7  268907               mov word ptr es:[bx], ax
2:75CA  26895702             mov word ptr es:[bx + 2], dx
2:75CE  eb0b                 jmp 0x75db
loc_75D0:
2:75D0  c45e0a               les bx, ptr [bp + 0xa]
2:75D3  6626c70700000000     mov dword ptr es:[bx], 0
loc_75DB:
2:75DB  c45e0a               les bx, ptr [bp + 0xa]
2:75DE  6626ff37             push dword ptr es:[bx]
2:75E2  26c41f               les bx, ptr es:[bx]
2:75E5  26c41f               les bx, ptr es:[bx]
2:75E8  26ff5f24             lcall es:[bx + 0x24]
2:75EC  66c746f400000000     mov dword ptr [bp - 0xc], 0
2:75F4  eb1c                 jmp 0x7612
loc_75F6:
2:75F6  66ff76e6             push dword ptr [bp - 0x1a]
2:75FA  ff76ea               push word ptr [bp - 0x16]
2:75FD  c45e0a               les bx, ptr [bp + 0xa]
2:7600  6626ff37             push dword ptr es:[bx]
2:7604  26c41f               les bx, ptr es:[bx]
2:7607  26c41f               les bx, ptr es:[bx]
2:760A  26ff5f28             lcall es:[bx + 0x28]
2:760E  66ff46f4             inc dword ptr [bp - 0xc]
loc_7612:
2:7612  668b46fc             mov eax, dword ptr [bp - 4]
2:7616  663946f4             cmp dword ptr [bp - 0xc], eax
2:761A  733e                 jae 0x765a
2:761C  666a04               push 4
2:761F  8d46e6               lea ax, [bp - 0x1a]
2:7622  16                   push ss
2:7623  50                   push ax
2:7624  66ff7606             push dword ptr [bp + 6]
2:7628  90                   nop
2:7629  0e                   push cs
2:762A  e8c107               call 0x7dee  ; File_read@s2:7DEE
2:762D  0bc0                 or ax, ax
2:762F  7415                 je 0x7646
2:7631  666a02               push 2
2:7634  8d46ea               lea ax, [bp - 0x16]
2:7637  16                   push ss
2:7638  50                   push ax
2:7639  66ff7606             push dword ptr [bp + 6]
2:763D  90                   nop
2:763E  0e                   push cs
2:763F  e8ac07               call 0x7dee  ; File_read@s2:7DEE
2:7642  0bc0                 or ax, ax
2:7644  75b0                 jne 0x75f6
loc_7646:
2:7646  c45e0a               les bx, ptr [bp + 0xa]
2:7649  6626ff37             push dword ptr es:[bx]
2:764D  26c41f               les bx, ptr es:[bx]
2:7650  26c41f               les bx, ptr es:[bx]
2:7653  26ff5f1c             lcall es:[bx + 0x1c]
2:7657  e90eff               jmp 0x7568
loc_765A:
2:765A  c45e0a               les bx, ptr [bp + 0xa]
2:765D  6626ff37             push dword ptr es:[bx]
2:7661  26c41f               les bx, ptr es:[bx]
2:7664  26c41f               les bx, ptr es:[bx]
2:7667  26ff5f1c             lcall es:[bx + 0x1c]
2:766B  e907ff               jmp 0x7575

; ---------------- sub_s2:766E FAR size=118 callers=2
2:766E  c8080000             enter 8, 0
2:7672  c45e0a               les bx, ptr [bp + 0xa]
2:7675  662bc0               sub eax, eax
2:7678  66268907             mov dword ptr es:[bx], eax
2:767C  668946fc             mov dword ptr [bp - 4], eax
2:7680  8d46fc               lea ax, [bp - 4]
2:7683  16                   push ss
2:7684  50                   push ax
2:7685  66ff7606             push dword ptr [bp + 6]
2:7689  90                   nop
2:768A  0e                   push cs
2:768B  e85600               call 0x76e4  ; sub_s2:76E4
2:768E  0bc0                 or ax, ax
2:7690  744e                 je 0x76e0
2:7692  66837efc00           cmp dword ptr [bp - 4], 0
2:7697  7507                 jne 0x76a0
loc_7699:
2:7699  b80100               mov ax, 1
2:769C  c9                   leave
2:769D  ca0800               retf 8
loc_76A0:
2:76A0  6a0c                 push 0xc
2:76A2  9a9c17a575           lcall 0x75a5, 0x179c  ; operator_new@s1:179C
2:76A7  83c402               add sp, 2
2:76AA  8946f8               mov word ptr [bp - 8], ax
2:76AD  8956fa               mov word ptr [bp - 6], dx
2:76B0  0bd0                 or dx, ax
2:76B2  740c                 je 0x76c0
2:76B4  ff76fa               push word ptr [bp - 6]
2:76B7  50                   push ax
2:76B8  9af28edb76           lcall 0x76db, 0x8ef2  ; sub_s3:8EF2
2:76BD  eb04                 jmp 0x76c3
2:76BF  db 90
loc_76C0:
2:76C0  33c0                 xor ax, ax
2:76C2  99                   cdq
loc_76C3:
2:76C3  c45e0a               les bx, ptr [bp + 0xa]
2:76C6  268907               mov word ptr es:[bx], ax
2:76C9  26895702             mov word ptr es:[bx + 2], dx
2:76CD  66ff76fc             push dword ptr [bp - 4]
2:76D1  c45e0a               les bx, ptr [bp + 0xa]
2:76D4  6626ff37             push dword ptr es:[bx]
2:76D8  9a5e907e70           lcall 0x707e, 0x905e  ; sub_s3:905E
2:76DD  ebba                 jmp 0x7699
2:76DF  db 90
loc_76E0:
2:76E0  c9                   leave
2:76E1  ca0800               retf 8

; ---------------- sub_s2:76E4 FAR size=232 callers=3
2:76E4  c8220000             enter 0x22, 0
2:76E8  662bc0               sub eax, eax
2:76EB  668946fc             mov dword ptr [bp - 4], eax
2:76EF  50                   push ax
2:76F0  6a04                 push 4
2:76F2  8d46fc               lea ax, [bp - 4]
2:76F5  16                   push ss
2:76F6  50                   push ax
2:76F7  66ff7606             push dword ptr [bp + 6]
2:76FB  90                   nop
2:76FC  0e                   push cs
2:76FD  e8ee06               call 0x7dee  ; File_read@s2:7DEE
2:7700  0bc0                 or ax, ax
2:7702  7506                 jne 0x770a
loc_7704:
2:7704  33c0                 xor ax, ax
2:7706  c9                   leave
2:7707  ca0800               retf 8
loc_770A:
2:770A  66837efc00           cmp dword ptr [bp - 4], 0
2:770F  7507                 jne 0x7718
loc_7711:
2:7711  b80100               mov ax, 1
2:7714  c9                   leave
2:7715  ca0800               retf 8
loc_7718:
2:7718  c45e0a               les bx, ptr [bp + 0xa]
2:771B  6626833f00           cmp dword ptr es:[bx], 0
2:7720  753b                 jne 0x775d
2:7722  6a18                 push 0x18
2:7724  9a9c17a576           lcall 0x76a5, 0x179c  ; operator_new@s1:179C
2:7729  83c402               add sp, 2
2:772C  8946e6               mov word ptr [bp - 0x1a], ax
2:772F  8956e8               mov word ptr [bp - 0x18], dx
2:7732  0bd0                 or dx, ax
2:7734  741c                 je 0x7752
2:7736  66ff76fc             push dword ptr [bp - 4]
2:773A  666a05               push 5
2:773D  ff76e8               push word ptr [bp - 0x18]
2:7740  50                   push ax
2:7741  9ad81cbc6f           lcall 0x6fbc, 0x1cd8  ; sub_s7:1CD8
2:7746  c45e0a               les bx, ptr [bp + 0xa]
2:7749  268907               mov word ptr es:[bx], ax
2:774C  26895702             mov word ptr es:[bx + 2], dx
2:7750  eb0b                 jmp 0x775d
loc_7752:
2:7752  c45e0a               les bx, ptr [bp + 0xa]
2:7755  6626c70700000000     mov dword ptr es:[bx], 0
loc_775D:
2:775D  66ff76fc             push dword ptr [bp - 4]
2:7761  c45e0a               les bx, ptr [bp + 0xa]
2:7764  6626ff37             push dword ptr es:[bx]
2:7768  26c41f               les bx, ptr es:[bx]
2:776B  26c41f               les bx, ptr es:[bx]
2:776E  26ff5f14             lcall es:[bx + 0x14]
2:7772  66c746f800000000     mov dword ptr [bp - 8], 0
2:777A  eb04                 jmp 0x7780
loc_777C:
2:777C  66ff46f8             inc dword ptr [bp - 8]
loc_7780:
2:7780  668b46fc             mov eax, dword ptr [bp - 4]
2:7784  663946f8             cmp dword ptr [bp - 8], eax
2:7788  732e                 jae 0x77b8
2:778A  666a04               push 4
2:778D  8d46ea               lea ax, [bp - 0x16]
2:7790  16                   push ss
2:7791  50                   push ax
2:7792  66ff7606             push dword ptr [bp + 6]
2:7796  90                   nop
2:7797  0e                   push cs
2:7798  e85306               call 0x7dee  ; File_read@s2:7DEE
2:779B  0bc0                 or ax, ax
2:779D  0f8463ff             je 0x7704
2:77A1  66ff76ea             push dword ptr [bp - 0x16]
2:77A5  c45e0a               les bx, ptr [bp + 0xa]
2:77A8  6626ff37             push dword ptr es:[bx]
2:77AC  26c41f               les bx, ptr es:[bx]
2:77AF  26c41f               les bx, ptr es:[bx]
2:77B2  26ff5f18             lcall es:[bx + 0x18]
2:77B6  ebc4                 jmp 0x777c
loc_77B8:
2:77B8  c45e0a               les bx, ptr [bp + 0xa]
2:77BB  6626ff37             push dword ptr es:[bx]
2:77BF  26c41f               les bx, ptr es:[bx]
2:77C2  26c41f               les bx, ptr es:[bx]
2:77C5  26ff5f1c             lcall es:[bx + 0x1c]
2:77C9  e945ff               jmp 0x7711

; ---------------- sub_s2:77CC FAR size=204 callers=2
2:77CC  c8260000             enter 0x26, 0
2:77D0  c746fe0000           mov word ptr [bp - 2], 0
2:77D5  666a02               push 2
2:77D8  8d46fe               lea ax, [bp - 2]
2:77DB  16                   push ss
2:77DC  50                   push ax
2:77DD  66ff7606             push dword ptr [bp + 6]
2:77E1  90                   nop
2:77E2  0e                   push cs
2:77E3  e80806               call 0x7dee  ; File_read@s2:7DEE
2:77E6  0bc0                 or ax, ax
2:77E8  7506                 jne 0x77f0
loc_77EA:
2:77EA  33c0                 xor ax, ax
2:77EC  c9                   leave
2:77ED  ca0800               retf 8
loc_77F0:
2:77F0  837efe00             cmp word ptr [bp - 2], 0
2:77F4  7508                 jne 0x77fe
loc_77F6:
2:77F6  b80100               mov ax, 1
2:77F9  c9                   leave
2:77FA  ca0800               retf 8
2:77FD  db 90
loc_77FE:
2:77FE  c45e0a               les bx, ptr [bp + 0xa]
2:7801  6626833f00           cmp dword ptr es:[bx], 0
2:7806  753b                 jne 0x7843
2:7808  6a0a                 push 0xa
2:780A  9a9c172777           lcall 0x7727, 0x179c  ; operator_new@s1:179C
2:780F  83c402               add sp, 2
2:7812  8946ea               mov word ptr [bp - 0x16], ax
2:7815  8956ec               mov word ptr [bp - 0x14], dx
2:7818  0bd0                 or dx, ax
2:781A  741c                 je 0x7838
2:781C  666805000500         push 0x50005
2:7822  ff76ec               push word ptr [bp - 0x14]
2:7825  50                   push ax
2:7826  9a3eba5b78           lcall 0x785b, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
2:782B  c45e0a               les bx, ptr [bp + 0xa]
2:782E  268907               mov word ptr es:[bx], ax
2:7831  26895702             mov word ptr es:[bx + 2], dx
2:7835  eb0c                 jmp 0x7843
2:7837  db 90
loc_7838:
2:7838  c45e0a               les bx, ptr [bp + 0xa]
2:783B  6626c70700000000     mov dword ptr es:[bx], 0
loc_7843:
2:7843  c746fc0000           mov word ptr [bp - 4], 0
2:7848  eb16                 jmp 0x7860
loc_784A:
2:784A  ff76ee               push word ptr [bp - 0x12]
2:784D  66ff76f2             push dword ptr [bp - 0xe]
2:7851  c45e0a               les bx, ptr [bp + 0xa]
2:7854  6626ff37             push dword ptr es:[bx]
2:7858  9a8abbc275           lcall 0x75c2, 0xbb8a  ; SparseTable::set@s5:BB8A
2:785D  ff46fc               inc word ptr [bp - 4]
loc_7860:
2:7860  8b46fe               mov ax, word ptr [bp - 2]
2:7863  3946fc               cmp word ptr [bp - 4], ax
2:7866  738e                 jae 0x77f6
2:7868  666a02               push 2
2:786B  8d46ee               lea ax, [bp - 0x12]
2:786E  16                   push ss
2:786F  50                   push ax
2:7870  66ff7606             push dword ptr [bp + 6]
2:7874  90                   nop
2:7875  0e                   push cs
2:7876  e87505               call 0x7dee  ; File_read@s2:7DEE
2:7879  0bc0                 or ax, ax
2:787B  0f846bff             je 0x77ea
2:787F  666a04               push 4
2:7882  8d46f2               lea ax, [bp - 0xe]
2:7885  16                   push ss
2:7886  50                   push ax
2:7887  66ff7606             push dword ptr [bp + 6]
2:788B  90                   nop
2:788C  0e                   push cs
2:788D  e85e05               call 0x7dee  ; File_read@s2:7DEE
2:7890  0bc0                 or ax, ax
2:7892  75b6                 jne 0x784a
2:7894  e953ff               jmp 0x77ea
2:7897  db 00

; ---------------- sub_s2:7898 FAR size=188 callers=1
2:7898  c8240000             enter 0x24, 0
2:789C  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:78A1  740f                 je 0x78b2
2:78A3  c45e0a               les bx, ptr [bp + 0xa]
2:78A6  06                   push es
2:78A7  53                   push bx
2:78A8  26c41f               les bx, ptr es:[bx]
2:78AB  26ff5f10             lcall es:[bx + 0x10]
2:78AF  eb04                 jmp 0x78b5
2:78B1  db 90
loc_78B2:
2:78B2  33c0                 xor ax, ax
2:78B4  99                   cdq
loc_78B5:
2:78B5  8946fc               mov word ptr [bp - 4], ax
2:78B8  8956fe               mov word ptr [bp - 2], dx
2:78BB  8946ea               mov word ptr [bp - 0x16], ax
2:78BE  8956ec               mov word ptr [bp - 0x14], dx
2:78C1  666a04               push 4
2:78C4  8d46ea               lea ax, [bp - 0x16]
2:78C7  16                   push ss
2:78C8  50                   push ax
2:78C9  66ff7606             push dword ptr [bp + 6]
2:78CD  90                   nop
2:78CE  0e                   push cs
2:78CF  e84a05               call 0x7e1c  ; File_write@s2:7E1C
2:78D2  0bc0                 or ax, ax
2:78D4  750c                 jne 0x78e2
loc_78D6:
2:78D6  c7061003d006         mov word ptr [0x310], 0x6d0
2:78DC  33c0                 xor ax, ax
2:78DE  c9                   leave
2:78DF  ca0800               retf 8
loc_78E2:
2:78E2  66c746f800000000     mov dword ptr [bp - 8], 0
2:78EA  eb04                 jmp 0x78f0
loc_78EC:
2:78EC  66ff46f8             inc dword ptr [bp - 8]
loc_78F0:
2:78F0  668b46fc             mov eax, dword ptr [bp - 4]
2:78F4  663946f8             cmp dword ptr [bp - 8], eax
2:78F8  7352                 jae 0x794c
2:78FA  66ff76f8             push dword ptr [bp - 8]
2:78FE  8d46ea               lea ax, [bp - 0x16]
2:7901  16                   push ss
2:7902  50                   push ax
2:7903  8d4eee               lea cx, [bp - 0x12]
2:7906  16                   push ss
2:7907  51                   push cx
2:7908  66ff760a             push dword ptr [bp + 0xa]
2:790C  9aa8c42978           lcall 0x7829, 0xc4a8  ; sub_s5:C4A8
2:7911  668b46ea             mov eax, dword ptr [bp - 0x16]
2:7915  668946de             mov dword ptr [bp - 0x22], eax
2:7919  666a04               push 4
2:791C  8d46de               lea ax, [bp - 0x22]
2:791F  16                   push ss
2:7920  50                   push ax
2:7921  66ff7606             push dword ptr [bp + 6]
2:7925  90                   nop
2:7926  0e                   push cs
2:7927  e8f204               call 0x7e1c  ; File_write@s2:7E1C
2:792A  0bc0                 or ax, ax
2:792C  74a8                 je 0x78d6
2:792E  8b46ee               mov ax, word ptr [bp - 0x12]
2:7931  8946dc               mov word ptr [bp - 0x24], ax
2:7934  666a02               push 2
2:7937  8d46dc               lea ax, [bp - 0x24]
2:793A  16                   push ss
2:793B  50                   push ax
2:793C  66ff7606             push dword ptr [bp + 6]
2:7940  90                   nop
2:7941  0e                   push cs
2:7942  e8d704               call 0x7e1c  ; File_write@s2:7E1C
2:7945  0bc0                 or ax, ax
2:7947  75a3                 jne 0x78ec
2:7949  eb8b                 jmp 0x78d6
2:794B  db 90
loc_794C:
2:794C  b80100               mov ax, 1
2:794F  c9                   leave
2:7950  ca0800               retf 8
2:7953  db 00

; ---------------- sub_s2:7954 FAR size=156 callers=3
2:7954  c81e0000             enter 0x1e, 0
2:7958  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:795D  740f                 je 0x796e
2:795F  c45e0a               les bx, ptr [bp + 0xa]
2:7962  06                   push es
2:7963  53                   push bx
2:7964  26c41f               les bx, ptr es:[bx]
2:7967  26ff5f10             lcall es:[bx + 0x10]
2:796B  eb04                 jmp 0x7971
2:796D  db 90
loc_796E:
2:796E  33c0                 xor ax, ax
2:7970  99                   cdq
loc_7971:
2:7971  8946fc               mov word ptr [bp - 4], ax
2:7974  8956fe               mov word ptr [bp - 2], dx
2:7977  8946ea               mov word ptr [bp - 0x16], ax
2:797A  8956ec               mov word ptr [bp - 0x14], dx
2:797D  666a04               push 4
2:7980  8d46ea               lea ax, [bp - 0x16]
2:7983  16                   push ss
2:7984  50                   push ax
2:7985  66ff7606             push dword ptr [bp + 6]
2:7989  90                   nop
2:798A  0e                   push cs
2:798B  e88e04               call 0x7e1c  ; File_write@s2:7E1C
2:798E  0bc0                 or ax, ax
2:7990  750a                 jne 0x799c
loc_7992:
2:7992  c7061003d006         mov word ptr [0x310], 0x6d0
2:7998  c9                   leave
2:7999  ca0800               retf 8
loc_799C:
2:799C  66c746f800000000     mov dword ptr [bp - 8], 0
2:79A4  eb04                 jmp 0x79aa
loc_79A6:
2:79A6  66ff46f8             inc dword ptr [bp - 8]
loc_79AA:
2:79AA  668b46fc             mov eax, dword ptr [bp - 4]
2:79AE  663946f8             cmp dword ptr [bp - 8], eax
2:79B2  7334                 jae 0x79e8
2:79B4  66ff76f8             push dword ptr [bp - 8]
2:79B8  c45e0a               les bx, ptr [bp + 0xa]
2:79BB  06                   push es
2:79BC  53                   push bx
2:79BD  26c41f               les bx, ptr es:[bx]
2:79C0  26ff5f04             lcall es:[bx + 4]
2:79C4  8946ea               mov word ptr [bp - 0x16], ax
2:79C7  8956ec               mov word ptr [bp - 0x14], dx
2:79CA  8946e2               mov word ptr [bp - 0x1e], ax
2:79CD  8956e4               mov word ptr [bp - 0x1c], dx
2:79D0  666a04               push 4
2:79D3  8d46e2               lea ax, [bp - 0x1e]
2:79D6  16                   push ss
2:79D7  50                   push ax
2:79D8  66ff7606             push dword ptr [bp + 6]
2:79DC  90                   nop
2:79DD  0e                   push cs
2:79DE  e83b04               call 0x7e1c  ; File_write@s2:7E1C
2:79E1  0bc0                 or ax, ax
2:79E3  75c1                 jne 0x79a6
2:79E5  ebab                 jmp 0x7992
2:79E7  db 90
loc_79E8:
2:79E8  b80100               mov ax, 1
2:79EB  c9                   leave
2:79EC  ca0800               retf 8
2:79EF  db 00

; ---------------- sub_s2:79F0 FAR size=50 callers=2
2:79F0  c8080000             enter 8, 0
2:79F4  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:79F9  7411                 je 0x7a0c
2:79FB  c45e0a               les bx, ptr [bp + 0xa]
2:79FE  268b4704             mov ax, word ptr es:[bx + 4]
2:7A02  268b5706             mov dx, word ptr es:[bx + 6]
2:7A06  8956fe               mov word ptr [bp - 2], dx
2:7A09  eb06                 jmp 0x7a11
2:7A0B  db 90
loc_7A0C:
2:7A0C  2bc0                 sub ax, ax
2:7A0E  8946fe               mov word ptr [bp - 2], ax
loc_7A11:
2:7A11  ff76fe               push word ptr [bp - 2]
2:7A14  50                   push ax
2:7A15  66ff7606             push dword ptr [bp + 6]
2:7A19  90                   nop
2:7A1A  0e                   push cs
2:7A1B  e836ff               call 0x7954  ; sub_s2:7954
2:7A1E  c9                   leave
2:7A1F  ca0800               retf 8

; ---------------- sub_s2:7A22 FAR size=178 callers=3
2:7A22  c8220000             enter 0x22, 0
2:7A26  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:7A2B  740d                 je 0x7a3a
2:7A2D  c45e0a               les bx, ptr [bp + 0xa]
2:7A30  268b4704             mov ax, word ptr es:[bx + 4]
2:7A34  8946fe               mov word ptr [bp - 2], ax
2:7A37  eb06                 jmp 0x7a3f
2:7A39  db 90
loc_7A3A:
2:7A3A  c746fe0000           mov word ptr [bp - 2], 0
loc_7A3F:
2:7A3F  8b46fe               mov ax, word ptr [bp - 2]
2:7A42  8946f0               mov word ptr [bp - 0x10], ax
2:7A45  666a02               push 2
2:7A48  8d46f0               lea ax, [bp - 0x10]
2:7A4B  16                   push ss
2:7A4C  50                   push ax
2:7A4D  66ff7606             push dword ptr [bp + 6]
2:7A51  90                   nop
2:7A52  0e                   push cs
2:7A53  e8c603               call 0x7e1c  ; File_write@s2:7E1C
2:7A56  0bc0                 or ax, ax
2:7A58  750c                 jne 0x7a66
2:7A5A  c7061003d006         mov word ptr [0x310], 0x6d0
loc_7A60:
2:7A60  33c0                 xor ax, ax
2:7A62  c9                   leave
2:7A63  ca0800               retf 8
loc_7A66:
2:7A66  c746fc0000           mov word ptr [bp - 4], 0
2:7A6B  eb04                 jmp 0x7a71
2:7A6D  db 90
loc_7A6E:
2:7A6E  ff46fc               inc word ptr [bp - 4]
loc_7A71:
2:7A71  8b46fe               mov ax, word ptr [bp - 2]
2:7A74  3946fc               cmp word ptr [bp - 4], ax
2:7A77  7353                 jae 0x7acc
2:7A79  ff76fc               push word ptr [bp - 4]
2:7A7C  8d46f0               lea ax, [bp - 0x10]
2:7A7F  16                   push ss
2:7A80  50                   push ax
2:7A81  8d4ef2               lea cx, [bp - 0xe]
2:7A84  16                   push ss
2:7A85  51                   push cx
2:7A86  66ff760a             push dword ptr [bp + 0xa]
2:7A8A  9a16bb0f79           lcall 0x790f, 0xbb16  ; sub_s5:BB16
2:7A8F  8b46f0               mov ax, word ptr [bp - 0x10]
2:7A92  8946f8               mov word ptr [bp - 8], ax
2:7A95  8946e6               mov word ptr [bp - 0x1a], ax
2:7A98  666a02               push 2
2:7A9B  8d46e6               lea ax, [bp - 0x1a]
2:7A9E  16                   push ss
2:7A9F  50                   push ax
2:7AA0  66ff7606             push dword ptr [bp + 6]
2:7AA4  90                   nop
2:7AA5  0e                   push cs
2:7AA6  e87303               call 0x7e1c  ; File_write@s2:7E1C
2:7AA9  0bc0                 or ax, ax
2:7AAB  74b3                 je 0x7a60
2:7AAD  668b46f2             mov eax, dword ptr [bp - 0xe]
2:7AB1  668946de             mov dword ptr [bp - 0x22], eax
2:7AB5  666a04               push 4
2:7AB8  8d46de               lea ax, [bp - 0x22]
2:7ABB  16                   push ss
2:7ABC  50                   push ax
2:7ABD  66ff7606             push dword ptr [bp + 6]
2:7AC1  90                   nop
2:7AC2  0e                   push cs
2:7AC3  e85603               call 0x7e1c  ; File_write@s2:7E1C
2:7AC6  0bc0                 or ax, ax
2:7AC8  75a4                 jne 0x7a6e
2:7ACA  eb94                 jmp 0x7a60
loc_7ACC:
2:7ACC  b80100               mov ax, 1
2:7ACF  c9                   leave
2:7AD0  ca0800               retf 8
2:7AD3  db 00

; ---------------- sub_s2:7AD4 FAR size=120 callers=1
2:7AD4  c8220000             enter 0x22, 0
2:7AD8  666a02               push 2
2:7ADB  8d46fe               lea ax, [bp - 2]
2:7ADE  16                   push ss
2:7ADF  50                   push ax
2:7AE0  66ff7606             push dword ptr [bp + 6]
2:7AE4  90                   nop
2:7AE5  0e                   push cs
2:7AE6  e80503               call 0x7dee  ; File_read@s2:7DEE
2:7AE9  0bc0                 or ax, ax
2:7AEB  7507                 jne 0x7af4
loc_7AED:
2:7AED  33c0                 xor ax, ax
2:7AEF  c9                   leave
2:7AF0  ca0800               retf 8
2:7AF3  db 90
loc_7AF4:
2:7AF4  c746fc0000           mov word ptr [bp - 4], 0
2:7AF9  eb14                 jmp 0x7b0f
2:7AFB  db 90
loc_7AFC:
2:7AFC  ff76ee               push word ptr [bp - 0x12]
2:7AFF  66ff76f2             push dword ptr [bp - 0xe]
2:7B03  66ff760a             push dword ptr [bp + 0xa]
2:7B07  9a8abb8d7a           lcall 0x7a8d, 0xbb8a  ; SparseTable::set@s5:BB8A
2:7B0C  ff46fc               inc word ptr [bp - 4]
loc_7B0F:
2:7B0F  8b46fe               mov ax, word ptr [bp - 2]
2:7B12  3946fc               cmp word ptr [bp - 4], ax
2:7B15  732d                 jae 0x7b44
2:7B17  666a02               push 2
2:7B1A  8d46ee               lea ax, [bp - 0x12]
2:7B1D  16                   push ss
2:7B1E  50                   push ax
2:7B1F  66ff7606             push dword ptr [bp + 6]
2:7B23  90                   nop
2:7B24  0e                   push cs
2:7B25  e8c602               call 0x7dee  ; File_read@s2:7DEE
2:7B28  0bc0                 or ax, ax
2:7B2A  74c1                 je 0x7aed
2:7B2C  666a04               push 4
2:7B2F  8d46f2               lea ax, [bp - 0xe]
2:7B32  16                   push ss
2:7B33  50                   push ax
2:7B34  66ff7606             push dword ptr [bp + 6]
2:7B38  90                   nop
2:7B39  0e                   push cs
2:7B3A  e8b102               call 0x7dee  ; File_read@s2:7DEE
2:7B3D  0bc0                 or ax, ax
2:7B3F  75bb                 jne 0x7afc
2:7B41  ebaa                 jmp 0x7aed
2:7B43  db 90
loc_7B44:
2:7B44  b80100               mov ax, 1
2:7B47  c9                   leave
2:7B48  ca0800               retf 8
2:7B4B  db 00

; ---------------- sub_s2:7B4C FAR size=124 callers=7
2:7B4C  c8140000             enter 0x14, 0
2:7B50  8d46fe               lea ax, [bp - 2]
2:7B53  16                   push ss
2:7B54  50                   push ax
2:7B55  8d4efc               lea cx, [bp - 4]
2:7B58  16                   push ss
2:7B59  51                   push cx
2:7B5A  8d4efa               lea cx, [bp - 6]
2:7B5D  16                   push ss
2:7B5E  51                   push cx
2:7B5F  66ff760a             push dword ptr [bp + 0xa]
2:7B63  90                   nop
2:7B64  0e                   push cs
2:7B65  e84cc3               call 0x3eb4  ; sub_s2:3EB4
2:7B68  8b46fe               mov ax, word ptr [bp - 2]
2:7B6B  8946f0               mov word ptr [bp - 0x10], ax
2:7B6E  666a02               push 2
2:7B71  8d46f0               lea ax, [bp - 0x10]
2:7B74  16                   push ss
2:7B75  50                   push ax
2:7B76  66ff7606             push dword ptr [bp + 6]
2:7B7A  90                   nop
2:7B7B  0e                   push cs
2:7B7C  e89d02               call 0x7e1c  ; File_write@s2:7E1C
2:7B7F  0bc0                 or ax, ax
2:7B81  7436                 je 0x7bb9
2:7B83  8b46fc               mov ax, word ptr [bp - 4]
2:7B86  8946f6               mov word ptr [bp - 0xa], ax
2:7B89  666a02               push 2
2:7B8C  8d46f6               lea ax, [bp - 0xa]
2:7B8F  16                   push ss
2:7B90  50                   push ax
2:7B91  66ff7606             push dword ptr [bp + 6]
2:7B95  90                   nop
2:7B96  0e                   push cs
2:7B97  e88202               call 0x7e1c  ; File_write@s2:7E1C
2:7B9A  0bc0                 or ax, ax
2:7B9C  741b                 je 0x7bb9
2:7B9E  8b46fa               mov ax, word ptr [bp - 6]
2:7BA1  8946f6               mov word ptr [bp - 0xa], ax
2:7BA4  666a02               push 2
2:7BA7  8d46f6               lea ax, [bp - 0xa]
2:7BAA  16                   push ss
2:7BAB  50                   push ax
2:7BAC  66ff7606             push dword ptr [bp + 6]
2:7BB0  90                   nop
2:7BB1  0e                   push cs
2:7BB2  e86702               call 0x7e1c  ; File_write@s2:7E1C
2:7BB5  0bc0                 or ax, ax
2:7BB7  7507                 jne 0x7bc0
loc_7BB9:
2:7BB9  33c0                 xor ax, ax
2:7BBB  c9                   leave
2:7BBC  ca0800               retf 8
2:7BBF  db 90
loc_7BC0:
2:7BC0  b80100               mov ax, 1
2:7BC3  c9                   leave
2:7BC4  ca0800               retf 8
2:7BC7  db 00

; ---------------- sub_s2:7BC8 FAR size=98 callers=7
2:7BC8  c8180000             enter 0x18, 0
2:7BCC  666a02               push 2
2:7BCF  8d46fe               lea ax, [bp - 2]
2:7BD2  16                   push ss
2:7BD3  50                   push ax
2:7BD4  66ff7606             push dword ptr [bp + 6]
2:7BD8  90                   nop
2:7BD9  0e                   push cs
2:7BDA  e81102               call 0x7dee  ; File_read@s2:7DEE
2:7BDD  0bc0                 or ax, ax
2:7BDF  742a                 je 0x7c0b
2:7BE1  666a02               push 2
2:7BE4  8d46fc               lea ax, [bp - 4]
2:7BE7  16                   push ss
2:7BE8  50                   push ax
2:7BE9  66ff7606             push dword ptr [bp + 6]
2:7BED  90                   nop
2:7BEE  0e                   push cs
2:7BEF  e8fc01               call 0x7dee  ; File_read@s2:7DEE
2:7BF2  0bc0                 or ax, ax
2:7BF4  7415                 je 0x7c0b
2:7BF6  666a02               push 2
2:7BF9  8d46fa               lea ax, [bp - 6]
2:7BFC  16                   push ss
2:7BFD  50                   push ax
2:7BFE  66ff7606             push dword ptr [bp + 6]
2:7C02  90                   nop
2:7C03  0e                   push cs
2:7C04  e8e701               call 0x7dee  ; File_read@s2:7DEE
2:7C07  0bc0                 or ax, ax
2:7C09  7507                 jne 0x7c12
loc_7C0B:
2:7C0B  33c0                 xor ax, ax
2:7C0D  c9                   leave
2:7C0E  ca0800               retf 8
2:7C11  db 90
loc_7C12:
2:7C12  66ff76fc             push dword ptr [bp - 4]
2:7C16  ff76fa               push word ptr [bp - 6]
2:7C19  66ff760a             push dword ptr [bp + 0xa]
2:7C1D  90                   nop
2:7C1E  0e                   push cs
2:7C1F  e854c2               call 0x3e76  ; sub_s2:3E76
2:7C22  b80100               mov ax, 1
2:7C25  c9                   leave
2:7C26  ca0800               retf 8
2:7C29  db 00

; ---------------- sub_s2:7C2A FAR size=68 callers=6
2:7C2A  c8020000             enter 2, 0
2:7C2E  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:7C33  7421                 je 0x7c56
2:7C35  66ff760a             push dword ptr [bp + 0xa]
2:7C39  9aa43d0d78           lcall 0x780d, 0x3da4  ; sub_s1:3DA4
2:7C3E  83c404               add sp, 4
2:7C41  40                   inc ax
2:7C42  99                   cdq
2:7C43  52                   push dx
2:7C44  50                   push ax
2:7C45  66ff760a             push dword ptr [bp + 0xa]
2:7C49  66ff7606             push dword ptr [bp + 6]
2:7C4D  90                   nop
2:7C4E  0e                   push cs
2:7C4F  e8ca01               call 0x7e1c  ; File_write@s2:7E1C
2:7C52  c9                   leave
2:7C53  ca0800               retf 8
loc_7C56:
2:7C56  666a01               push 1
2:7C59  1e                   push ds
2:7C5A  689a14               push 0x149a
2:7C5D  66ff7606             push dword ptr [bp + 6]
2:7C61  90                   nop
2:7C62  0e                   push cs
2:7C63  e8b601               call 0x7e1c  ; File_write@s2:7E1C
2:7C66  b80100               mov ax, 1
2:7C69  c9                   leave
2:7C6A  ca0800               retf 8
2:7C6D  db 00

; ---------------- sub_s2:7C6E FAR size=62 callers=6
;   apis: KERNEL._hread
2:7C6E  c80e0000             enter 0xe, 0
2:7C72  eb0c                 jmp 0x7c80
loc_7C74:
2:7C74  8a46f6               mov al, byte ptr [bp - 0xa]
2:7C77  c45e0a               les bx, ptr [bp + 0xa]
2:7C7A  ff460a               inc word ptr [bp + 0xa]
2:7C7D  268807               mov byte ptr es:[bx], al
loc_7C80:
2:7C80  c45e06               les bx, ptr [bp + 6]
2:7C83  26ff37               push word ptr es:[bx]
2:7C86  8d46f6               lea ax, [bp - 0xa]
2:7C89  16                   push ss
2:7C8A  50                   push ax
2:7C8B  666a01               push 1
2:7C8E  9ad6710000           lcall 0, 0x71d6  ; KERNEL._hread
2:7C93  8946f2               mov word ptr [bp - 0xe], ax
2:7C96  8956f4               mov word ptr [bp - 0xc], dx
2:7C99  807ef600             cmp byte ptr [bp - 0xa], 0
2:7C9D  75d5                 jne 0x7c74
2:7C9F  c45e0a               les bx, ptr [bp + 0xa]
2:7CA2  b80100               mov ax, 1
2:7CA5  268827               mov byte ptr es:[bx], ah
2:7CA8  c9                   leave
2:7CA9  ca0800               retf 8

; ---------------- Save_writeChunkTag@s2:7CAC FAR size=82 callers=15
2:7CAC  c80a0000             enter 0xa, 0
2:7CB0  ff760a               push word ptr [bp + 0xa]
2:7CB3  66ff363c03           push dword ptr [0x33c]
2:7CB8  1e                   push ds
2:7CB9  684003               push 0x340  ; '%s%02x'
2:7CBC  8d46f6               lea ax, [bp - 0xa]
2:7CBF  16                   push ss
2:7CC0  50                   push ax
2:7CC1  9a9c3fd17c           lcall 0x7cd1, 0x3f9c  ; _fsprintf@s1:3F9C
2:7CC6  83c40e               add sp, 0xe
2:7CC9  8d46f6               lea ax, [bp - 0xa]
2:7CCC  16                   push ss
2:7CCD  50                   push ax
2:7CCE  9aa43d3c7c           lcall 0x7c3c, 0x3da4  ; sub_s1:3DA4
2:7CD3  83c404               add sp, 4
2:7CD6  6a00                 push 0
2:7CD8  50                   push ax
2:7CD9  8d46f6               lea ax, [bp - 0xa]
2:7CDC  16                   push ss
2:7CDD  50                   push ax
2:7CDE  66ff7606             push dword ptr [bp + 6]
2:7CE2  90                   nop
2:7CE3  0e                   push cs
2:7CE4  e83501               call 0x7e1c  ; File_write@s2:7E1C
2:7CE7  0bc0                 or ax, ax
2:7CE9  750b                 jne 0x7cf6
2:7CEB  c7061003d006         mov word ptr [0x310], 0x6d0
2:7CF1  c9                   leave
2:7CF2  ca0600               retf 6
2:7CF5  db 90
loc_7CF6:
2:7CF6  b80100               mov ax, 1
2:7CF9  c9                   leave
2:7CFA  ca0600               retf 6
2:7CFD  db 00

; ---------------- sub_s2:7CFE FAR size=240 callers=15
;   apis: KERNEL._hread, KERNEL._llseek
2:7CFE  c80e0400             enter 0x40e, 0
2:7D02  56                   push si
2:7D03  662bc0               sub eax, eax
2:7D06  668946fc             mov dword ptr [bp - 4], eax
2:7D0A  8986fafb             mov word ptr [bp - 0x406], ax
loc_7D0E:
2:7D0E  c45e06               les bx, ptr [bp + 6]
2:7D11  26ff37               push word ptr es:[bx]
2:7D14  66ff76fc             push dword ptr [bp - 4]
2:7D18  6a00                 push 0
2:7D1A  9a807d0000           lcall 0, 0x7d80  ; KERNEL._llseek
2:7D1F  c45e06               les bx, ptr [bp + 6]
2:7D22  26ff37               push word ptr es:[bx]
2:7D25  8d86fcfb             lea ax, [bp - 0x404]
2:7D29  16                   push ss
2:7D2A  50                   push ax
2:7D2B  666800040000         push 0x400
2:7D31  9a8f7c0000           lcall 0, 0x7c8f  ; KERNEL._hread
2:7D36  8986f6fb             mov word ptr [bp - 0x40a], ax
2:7D3A  8996f8fb             mov word ptr [bp - 0x408], dx
2:7D3E  66c786f2fb00000000   mov dword ptr [bp - 0x40e], 0
2:7D47  eb48                 jmp 0x7d91
2:7D49  db 90
loc_7D4A:
2:7D4A  c786fafb0000         mov word ptr [bp - 0x406], 0
2:7D50  8d82fcfb             lea ax, [bp + si - 0x404]
2:7D54  16                   push ss
2:7D55  50                   push ax
2:7D56  66ff7608             push dword ptr [bp + 8]
2:7D5A  ff7606               push word ptr [bp + 6]
2:7D5D  90                   nop
2:7D5E  0e                   push cs
2:7D5F  e8e800               call 0x7e4a  ; sub_s2:7E4A
2:7D62  0bc0                 or ax, ax
2:7D64  7426                 je 0x7d8c
2:7D66  c45e06               les bx, ptr [bp + 6]
2:7D69  26ff37               push word ptr es:[bx]
2:7D6C  668b86f2fb           mov eax, dword ptr [bp - 0x40e]
2:7D71  660346fc             add eax, dword ptr [bp - 4]
2:7D75  660507000000         add eax, 7
2:7D7B  6650                 push eax
2:7D7D  6a00                 push 0
2:7D7F  9a844a0000           lcall 0, 0x4a84  ; KERNEL._llseek
2:7D84  b80100               mov ax, 1
2:7D87  5e                   pop si
2:7D88  c9                   leave
2:7D89  ca0600               retf 6
loc_7D8C:
2:7D8C  66ff86f2fb           inc dword ptr [bp - 0x40e]
loc_7D91:
2:7D91  668b86f6fb           mov eax, dword ptr [bp - 0x40a]
2:7D96  663986f2fb           cmp dword ptr [bp - 0x40e], eax
2:7D9B  7d2a                 jge 0x7dc7
2:7D9D  c41e3c03             les bx, ptr [0x33c]
2:7DA1  8bb6f2fb             mov si, word ptr [bp - 0x40e]
2:7DA5  268a07               mov al, byte ptr es:[bx]
2:7DA8  3882fcfb             cmp byte ptr [bp + si - 0x404], al
2:7DAC  75de                 jne 0x7d8c
2:7DAE  83befafb00           cmp word ptr [bp - 0x406], 0
2:7DB3  7595                 jne 0x7d4a
2:7DB5  c786fafb0100         mov word ptr [bp - 0x406], 1
2:7DBB  8bc6                 mov ax, si
2:7DBD  8b96f4fb             mov dx, word ptr [bp - 0x40c]
2:7DC1  0146fc               add word ptr [bp - 4], ax
2:7DC4  1156fe               adc word ptr [bp - 2], dx
loc_7DC7:
2:7DC7  83befafb00           cmp word ptr [bp - 0x406], 0
2:7DCC  0f853eff             jne 0x7d0e
2:7DD0  6681bef6fb00040000   cmp dword ptr [bp - 0x40a], 0x400
2:7DD9  7c0b                 jl 0x7de6
2:7DDB  8046fd04             add byte ptr [bp - 3], 4
2:7DDF  8356fe00             adc word ptr [bp - 2], 0
2:7DE3  e928ff               jmp 0x7d0e
loc_7DE6:
2:7DE6  33c0                 xor ax, ax
2:7DE8  5e                   pop si
2:7DE9  c9                   leave
2:7DEA  ca0600               retf 6
2:7DED  db 00

; ---------------- File_read@s2:7DEE FAR size=46 callers=47
;   apis: KERNEL._hread
2:7DEE  c8040000             enter 4, 0
2:7DF2  c45e06               les bx, ptr [bp + 6]
2:7DF5  26ff37               push word ptr es:[bx]
2:7DF8  66ff760a             push dword ptr [bp + 0xa]
2:7DFC  66ff760e             push dword ptr [bp + 0xe]
2:7E00  9a327d0000           lcall 0, 0x7d32  ; KERNEL._hread
2:7E05  3b460e               cmp ax, word ptr [bp + 0xe]
2:7E08  750c                 jne 0x7e16
2:7E0A  3b5610               cmp dx, word ptr [bp + 0x10]
2:7E0D  7507                 jne 0x7e16
2:7E0F  b80100               mov ax, 1
2:7E12  c9                   leave
2:7E13  ca0c00               retf 0xc
loc_7E16:
2:7E16  33c0                 xor ax, ax
2:7E18  c9                   leave
2:7E19  ca0c00               retf 0xc

; ---------------- File_write@s2:7E1C FAR size=46 callers=47
;   apis: KERNEL._hwrite
2:7E1C  c8040000             enter 4, 0
2:7E20  c45e06               les bx, ptr [bp + 6]
2:7E23  26ff37               push word ptr es:[bx]
2:7E26  66ff760a             push dword ptr [bp + 0xa]
2:7E2A  66ff760e             push dword ptr [bp + 0xe]
2:7E2E  9a27710000           lcall 0, 0x7127  ; KERNEL._hwrite
2:7E33  3b460e               cmp ax, word ptr [bp + 0xe]
2:7E36  750c                 jne 0x7e44
2:7E38  3b5610               cmp dx, word ptr [bp + 0x10]
2:7E3B  7507                 jne 0x7e44
2:7E3D  b80100               mov ax, 1
2:7E40  c9                   leave
2:7E41  ca0c00               retf 0xc
loc_7E44:
2:7E44  33c0                 xor ax, ax
2:7E46  c9                   leave
2:7E47  ca0c00               retf 0xc

; ---------------- sub_s2:7E4A FAR size=78 callers=1
2:7E4A  c80a0000             enter 0xa, 0
2:7E4E  ff760a               push word ptr [bp + 0xa]
2:7E51  66ff363c03           push dword ptr [0x33c]
2:7E56  1e                   push ds
2:7E57  684703               push 0x347  ; '%s%02x'
2:7E5A  8d46f6               lea ax, [bp - 0xa]
2:7E5D  16                   push ss
2:7E5E  50                   push ax
2:7E5F  9a9c3f6f7e           lcall 0x7e6f, 0x3f9c  ; _fsprintf@s1:3F9C
2:7E64  83c40e               add sp, 0xe
2:7E67  8d46f6               lea ax, [bp - 0xa]
2:7E6A  16                   push ss
2:7E6B  50                   push ax
2:7E6C  9aa43d817e           lcall 0x7e81, 0x3da4  ; sub_s1:3DA4
2:7E71  83c404               add sp, 4
2:7E74  50                   push ax
2:7E75  8d46f6               lea ax, [bp - 0xa]
2:7E78  16                   push ss
2:7E79  50                   push ax
2:7E7A  66ff760c             push dword ptr [bp + 0xc]
2:7E7E  9ae83dc47c           lcall 0x7cc4, 0x3de8  ; sub_s1:3DE8
2:7E83  83c40a               add sp, 0xa
2:7E86  0bc0                 or ax, ax
2:7E88  7508                 jne 0x7e92
2:7E8A  b80100               mov ax, 1
2:7E8D  c9                   leave
2:7E8E  ca0a00               retf 0xa
2:7E91  db 90
loc_7E92:
2:7E92  33c0                 xor ax, ax
2:7E94  c9                   leave
2:7E95  ca0a00               retf 0xa

; ---------------- sub_s2:7E98 size=202 callers=0
2:7E98  c8100000             enter 0x10, 0
2:7E9C  c45e06               les bx, ptr [bp + 6]
2:7E9F  26c7070a38           mov word ptr es:[bx], 0x380a
2:7EA4  26c74702b67e         mov word ptr es:[bx + 2], 0x7eb6  ; SEGMENT s2:0000
2:7EAA  c45e06               les bx, ptr [bp + 6]
2:7EAD  26c7079a38           mov word ptr es:[bx], 0x389a
2:7EB2  26c747028e6c         mov word ptr es:[bx + 2], 0x6c8e  ; SEGMENT s2:0000
2:7EB8  f6460a01             test byte ptr [bp + 0xa], 1
2:7EBC  7409                 je 0x7ec7
2:7EBE  66ff7606             push dword ptr [bp + 6]
2:7EC2  9ace17627e           lcall 0x7e62, 0x17ce  ; operator_delete@s1:17CE
loc_7EC7:
2:7EC7  8b4606               mov ax, word ptr [bp + 6]
2:7ECA  8b5608               mov dx, word ptr [bp + 8]
2:7ECD  c9                   leave
2:7ECE  ca0600               retf 6
2:7ED1  db 00 98 7e d8 7e 14 37 dc 7e 60 97 e0 7e ae 96 e4
2:7EE1  db 7e 40 96 e8 7e 64 96 ec 7e 2c 37 f0 7e f2 97 f4
2:7EF1  db 7e 3c 37 f8 7e 40 37 fc 7e 44 37 00 7f 48 37 04
2:7F01  db 7f 4c 37 08 7f c8 97 0c 7f 98 96 10 7f 50 37 14
2:7F11  db 7f 54 37 18 7f 60 9c 1c 7f 58 37 20 7f 5e 37 24
2:7F21  db 7f 4e 9c 28 7f 62 37 2c 7f 4a 9c 30 7f 66 37 34
2:7F31  db 7f 6a 37 38 7f 6e 37 3c 7f 72 37 40 7f 76 37 44
2:7F41  db 7f 7a 37 48 7f 52 9c 4c 7f 56 9c 50 7f 16 9c 54
2:7F51  db 7f 30 9c 58 7f 86 9c 5c 7f c4 9c 60 7f e0 9c a8
2:7F61  db 7e

; ---------------- sub_s2:7F62 FAR size=152 callers=1
;   apis: GDI.GetStockObject, USER.LoadCursor
2:7F62  c8060000             enter 6, 0
2:7F66  66ff760c             push dword ptr [bp + 0xc]
2:7F6A  66ff7606             push dword ptr [bp + 6]
2:7F6E  90                   nop
2:7F6F  0e                   push cs
2:7F70  e807e9               call 0x687a  ; sub_s2:687A
2:7F73  8b460a               mov ax, word ptr [bp + 0xa]
2:7F76  c45e06               les bx, ptr [bp + 6]
2:7F79  268987de00           mov word ptr es:[bx + 0xde], ax
2:7F7E  26c7074280           mov word ptr es:[bx], 0x8042
2:7F83  26c74702d47e         mov word ptr es:[bx + 2], 0x7ed4  ; SEGMENT s2:0000
2:7F89  1e                   push ds
2:7F8A  685803               push 0x358  ; 'SOLChildPar'
2:7F8D  8d475b               lea ax, [bx + 0x5b]
2:7F90  06                   push es
2:7F91  50                   push ax
2:7F92  9a3e3dc57e           lcall 0x7ec5, 0x3d3e  ; _fstrcpy@s1:3D3E
2:7F97  83c408               add sp, 8
2:7F9A  6a05                 push 5
2:7F9C  9af4610000           lcall 0, 0x61f4  ; GDI.GetStockObject
2:7FA1  c45e06               les bx, ptr [bp + 6]
2:7FA4  268987c600           mov word ptr es:[bx + 0xc6], ax
2:7FA9  666a00               push 0
2:7FAC  68007f               push 0x7f00
2:7FAF  9a07620000           lcall 0, 0x6207  ; USER.LoadCursor
2:7FB4  c45e06               les bx, ptr [bp + 6]
2:7FB7  268987c400           mov word ptr es:[bx + 0xc4], ax
2:7FBC  26c787c8000820       mov word ptr es:[bx + 0xc8], 0x2008
2:7FC3  6626c787ac0000000044 mov dword ptr es:[bx + 0xac], 0x44000000
2:7FCD  c45e0c               les bx, ptr [bp + 0xc]
2:7FD0  268b4708             mov ax, word ptr es:[bx + 8]
2:7FD4  c45e06               les bx, ptr [bp + 6]
2:7FD7  268987bc00           mov word ptr es:[bx + 0xbc], ax
2:7FDC  c45e06               les bx, ptr [bp + 6]
2:7FDF  268b87de00           mov ax, word ptr es:[bx + 0xde]
2:7FE4  268987ca00           mov word ptr es:[bx + 0xca], ax
2:7FE9  06                   push es
2:7FEA  53                   push bx
2:7FEB  90                   nop
2:7FEC  0e                   push cs
2:7FED  e8e216               call 0x96d2  ; RegisterWindowClass@s2:96D2
2:7FF0  8b4606               mov ax, word ptr [bp + 6]
2:7FF3  8b5608               mov dx, word ptr [bp + 8]
2:7FF6  c9                   leave
2:7FF7  ca0a00               retf 0xa

; ---------------- sub_s2:7FFA size=244 callers=0
2:7FFA  c8140000             enter 0x14, 0
2:7FFE  668b4606             mov eax, dword ptr [bp + 6]
2:8002  05d200               add ax, 0xd2
2:8005  6650                 push eax
2:8007  90                   nop
2:8008  0e                   push cs
2:8009  e8b8d7               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:800C  c45e06               les bx, ptr [bp + 6]
2:800F  26c7070a38           mov word ptr es:[bx], 0x380a
2:8014  26c747022680         mov word ptr es:[bx + 2], 0x8026  ; SEGMENT s2:0000
2:801A  c45e06               les bx, ptr [bp + 6]
2:801D  26c7079a38           mov word ptr es:[bx], 0x389a
2:8022  26c74702877f         mov word ptr es:[bx + 2], 0x7f87  ; SEGMENT s2:0000
2:8028  f6460a01             test byte ptr [bp + 0xa], 1
2:802C  7409                 je 0x8037
2:802E  66ff7606             push dword ptr [bp + 6]
2:8032  9ace17957f           lcall 0x7f95, 0x17ce  ; operator_delete@s1:17CE
loc_8037:
2:8037  8b4606               mov ax, word ptr [bp + 6]
2:803A  8b5608               mov dx, word ptr [bp + 8]
2:803D  c9                   leave
2:803E  ca0600               retf 6
2:8041  db 00 fa 7f 48 80 ea 68 4c 80 60 97 50 80 c6 68 54
2:8051  db 80 40 96 58 80 64 96 5c 80 2c 37 60 80 f2 97 64
2:8061  db 80 3c 37 68 80 40 37 6c 80 44 37 70 80 48 37 74
2:8071  db 80 4c 37 78 80 c8 97 7c 80 98 96 80 80 50 37 84
2:8081  db 80 54 37 88 80 60 9c 8c 80 58 37 90 80 5e 37 94
2:8091  db 80 4e 9c 98 80 62 37 9c 80 4a 9c a0 80 66 37 a4
2:80A1  db 80 6a 37 a8 80 4a 6a ac 80 2e 6b b0 80 02 6b b4
2:80B1  db 80 7a 37 b8 80 52 9c bc 80 56 9c c0 80 16 9c c4
2:80C1  db 80 30 9c c8 80 86 9c cc 80 c4 9c d0 80 e0 9c 18
2:80D1  db 80 55 8b ec c4 5e 06 66 26 c7 07 00 00 00 00 26
2:80E1  db c7 47 04 00 00 8b c3 8c c2 c9 ca 04 00

; ---------------- sub_s2:80EE FAR size=122 callers=1
;   apis: GDI.GetStockObject, USER.LoadCursor
2:80EE  c8040000             enter 4, 0
2:80F2  c45e06               les bx, ptr [bp + 6]
2:80F5  26c7079a38           mov word ptr es:[bx], 0x389a
2:80FA  26c747021a81         mov word ptr es:[bx + 2], 0x811a  ; SEGMENT s2:0000
2:8100  c45e06               les bx, ptr [bp + 6]
2:8103  33c0                 xor ax, ax
2:8105  26894754             mov word ptr es:[bx + 0x54], ax
2:8109  26894756             mov word ptr es:[bx + 0x56], ax
2:810D  26894758             mov word ptr es:[bx + 0x58], ax
2:8111  26c707c887           mov word ptr es:[bx], 0x87c8
2:8116  26c747024480         mov word ptr es:[bx + 2], 0x8044  ; SEGMENT s2:0000
2:811C  1e                   push ds
2:811D  687003               push 0x370  ; 'MicroSpinControl'
2:8120  8d4f04               lea cx, [bx + 4]
2:8123  06                   push es
2:8124  51                   push cx
2:8125  9a3e3d3580           lcall 0x8035, 0x3d3e  ; _fstrcpy@s1:3D3E
2:812A  83c408               add sp, 8
2:812D  c45e06               les bx, ptr [bp + 6]
2:8130  26c747540300         mov word ptr es:[bx + 0x54], 3
2:8136  666a00               push 0
2:8139  68007f               push 0x7f00
2:813C  9ab07f0000           lcall 0, 0x7fb0  ; USER.LoadCursor
2:8141  c45e06               les bx, ptr [bp + 6]
2:8144  26894758             mov word ptr es:[bx + 0x58], ax
2:8148  6a04                 push 4
2:814A  9a9d7f0000           lcall 0, 0x7f9d  ; GDI.GetStockObject
2:814F  c45e06               les bx, ptr [bp + 6]
2:8152  26894756             mov word ptr es:[bx + 0x56], ax
2:8156  06                   push es
2:8157  53                   push bx
2:8158  90                   nop
2:8159  0e                   push cs
2:815A  e82f00               call 0x818c  ; RegisterWindowClass@s2:818C
2:815D  8b4606               mov ax, word ptr [bp + 6]
2:8160  8b5608               mov dx, word ptr [bp + 8]
2:8163  c9                   leave
2:8164  ca0400               retf 4
2:8167  db 00

; ---------------- sub_s2:8168 FAR size=36 callers=2
2:8168  c8040000             enter 4, 0
2:816C  c45e06               les bx, ptr [bp + 6]
2:816F  26c707c887           mov word ptr es:[bx], 0x87c8
2:8174  26c747028681         mov word ptr es:[bx + 2], 0x8186  ; SEGMENT s2:0000
2:817A  c45e06               les bx, ptr [bp + 6]
2:817D  26c7079a38           mov word ptr es:[bx], 0x389a
2:8182  26c74702fe80         mov word ptr es:[bx + 2], 0x80fe  ; SEGMENT s2:0000
2:8188  c9                   leave
2:8189  ca0400               retf 4

; ---------------- RegisterWindowClass@s2:818C FAR size=252 callers=1
;   apis: USER.GetClassInfo, USER.RegisterClass
2:818C  c81a0000             enter 0x1a, 0
2:8190  57                   push di
2:8191  56                   push si
2:8192  ff368c03             push word ptr [0x38c]
2:8196  8b4606               mov ax, word ptr [bp + 6]
2:8199  8b5608               mov dx, word ptr [bp + 8]
2:819C  050400               add ax, 4
2:819F  52                   push dx
2:81A0  50                   push ax
2:81A1  8d4ee6               lea cx, [bp - 0x1a]
2:81A4  16                   push ss
2:81A5  51                   push cx
2:81A6  8bf0                 mov si, ax
2:81A8  8bfa                 mov di, dx
2:81AA  9ae65e0000           lcall 0, 0x5ee6  ; USER.GetClassInfo
2:81AF  0bc0                 or ax, ax
2:81B1  755a                 jne 0x820d
2:81B3  c45e06               les bx, ptr [bp + 6]
2:81B6  268b4754             mov ax, word ptr es:[bx + 0x54]
2:81BA  8946e6               mov word ptr [bp - 0x1a], ax
2:81BD  c746e8f284           mov word ptr [bp - 0x18], 0x84f2
2:81C2  c746ea7881           mov word ptr [bp - 0x16], 0x8178  ; SEGMENT s2:0000
2:81C7  66c746ec00000400     mov dword ptr [bp - 0x14], 0x40000
2:81CF  a18c03               mov ax, word ptr [0x38c]
2:81D2  8946f0               mov word ptr [bp - 0x10], ax
2:81D5  c746f20000           mov word ptr [bp - 0xe], 0
2:81DA  268b4758             mov ax, word ptr es:[bx + 0x58]
2:81DE  8946f4               mov word ptr [bp - 0xc], ax
2:81E1  268b4756             mov ax, word ptr es:[bx + 0x56]
2:81E5  8946f6               mov word ptr [bp - 0xa], ax
2:81E8  66c746f800000000     mov dword ptr [bp - 8], 0
2:81F0  8976fc               mov word ptr [bp - 4], si
2:81F3  897efe               mov word ptr [bp - 2], di
2:81F6  8d46e6               lea ax, [bp - 0x1a]
2:81F9  16                   push ss
2:81FA  50                   push ax
2:81FB  9af45e0000           lcall 0, 0x5ef4  ; USER.RegisterClass
2:8200  0bc0                 or ax, ax
2:8202  7509                 jne 0x820d
2:8204  50                   push ax
2:8205  9acd242881           lcall 0x8128, 0x24cd  ; sub_s1:24CD
2:820A  83c402               add sp, 2
loc_820D:
2:820D  5e                   pop si
2:820E  5f                   pop di
2:820F  c9                   leave
2:8210  ca0400               retf 4
2:8213  db 00 c8 08 00 00 81 7e 08 81 00 75 31 ff 76 06 66
2:8223  db 6a 06 9a 9c 17 08 82 83 c4 02 89 56 fa 0b d0 74
2:8233  db 0c ff 76 fa 50 90 0e e8 95 fe eb 04 90 33 c0 99
2:8243  db 89 46 fc 89 56 fe 52 50 9a 72 56 00 00 83 7e 08
2:8253  db 01 75 2c ff 76 06 6a 00 9a 41 56 00 00 89 46 fc
2:8263  db 89 56 fe c4 5e 0c 26 8b 47 08 c4 5e fc 26 89 07
2:8273  db ff 76 06 9a ff ff 00 00 c4 5e fc 26 89 47 02 b8
2:8283  db 01 00 99 c9 cb

; ---------------- sub_s2:8288 size=562 callers=0
;   apis: GDI.CreatePen, GDI.CreateSolidBrush, GDI.DeleteObject, GDI.GetStockObject, GDI.LineTo, GDI.MoveTo, GDI.Polygon, GDI.Rectangle, GDI.SelectObject, USER.BeginPaint, USER.EndPaint, USER.GetClientRect
2:8288  c85c0000             enter 0x5c, 0
2:828C  56                   push si
2:828D  ff7606               push word ptr [bp + 6]
2:8290  8d46c6               lea ax, [bp - 0x3a]
2:8293  16                   push ss
2:8294  50                   push ax
2:8295  9ad1620000           lcall 0, 0x62d1  ; USER.BeginPaint
2:829A  8946b8               mov word ptr [bp - 0x48], ax
2:829D  33c0                 xor ax, ax
2:829F  8946fe               mov word ptr [bp - 2], ax
2:82A2  50                   push ax
2:82A3  6a01                 push 1
2:82A5  66ff366803           push dword ptr [0x368]
2:82AA  9abb820000           lcall 0, 0x82bb  ; GDI.CreatePen
2:82AF  8946b6               mov word ptr [bp - 0x4a], ax
2:82B2  666a01               push 1
2:82B5  66ff366403           push dword ptr [0x364]
2:82BA  9affff0000           lcall 0, 0xffff  ; GDI.CreatePen
2:82BF  8946b4               mov word ptr [bp - 0x4c], ax
2:82C2  66ff366403           push dword ptr [0x364]
2:82C7  9adf620000           lcall 0, 0x62df  ; GDI.CreateSolidBrush
2:82CC  8946b2               mov word ptr [bp - 0x4e], ax
2:82CF  ff7606               push word ptr [bp + 6]
2:82D2  8d46aa               lea ax, [bp - 0x56]
2:82D5  16                   push ss
2:82D6  50                   push ax
2:82D7  9af3620000           lcall 0, 0x62f3  ; USER.GetClientRect
2:82DC  8b46ae               mov ax, word ptr [bp - 0x52]
2:82DF  8946c4               mov word ptr [bp - 0x3c], ax
2:82E2  8b4eb0               mov cx, word ptr [bp - 0x50]
2:82E5  894ec2               mov word ptr [bp - 0x3e], cx
2:82E8  d1e8                 shr ax, 1
2:82EA  8946c0               mov word ptr [bp - 0x40], ax
2:82ED  d1e9                 shr cx, 1
2:82EF  894ebe               mov word ptr [bp - 0x42], cx
2:82F2  d1e8                 shr ax, 1
2:82F4  8946bc               mov word ptr [bp - 0x44], ax
2:82F7  d1e9                 shr cx, 1
2:82F9  894eba               mov word ptr [bp - 0x46], cx
2:82FC  ff76b8               push word ptr [bp - 0x48]
2:82FF  6a07                 push 7
2:8301  9a15830000           lcall 0, 0x8315  ; GDI.GetStockObject
2:8306  50                   push ax
2:8307  9a1b830000           lcall 0, 0x831b  ; GDI.SelectObject
2:830C  8946a8               mov word ptr [bp - 0x58], ax
2:830F  ff76b8               push word ptr [bp - 0x48]
2:8312  6a04                 push 4
2:8314  9a4b810000           lcall 0, 0x814b  ; GDI.GetStockObject
2:8319  50                   push ax
2:831A  9a91830000           lcall 0, 0x8391  ; GDI.SelectObject
2:831F  8946a6               mov word ptr [bp - 0x5a], ax
2:8322  ff76b8               push word ptr [bp - 0x48]
2:8325  ff76aa               push word ptr [bp - 0x56]
2:8328  ff76ac               push word ptr [bp - 0x54]
2:832B  ff76ae               push word ptr [bp - 0x52]
2:832E  ff76b0               push word ptr [bp - 0x50]
2:8331  9affff0000           lcall 0, 0xffff  ; GDI.Rectangle
2:8336  ff76b8               push word ptr [bp - 0x48]
2:8339  6a00                 push 0
2:833B  ff76be               push word ptr [bp - 0x42]
2:833E  9aac830000           lcall 0, 0x83ac  ; GDI.MoveTo
2:8343  ff76b8               push word ptr [bp - 0x48]
2:8346  ff76c4               push word ptr [bp - 0x3c]
2:8349  ff76be               push word ptr [bp - 0x42]
2:834C  9aba830000           lcall 0, 0x83ba  ; GDI.LineTo
2:8351  c45e08               les bx, ptr [bp + 8]
2:8354  26f6470404           test byte ptr es:[bx + 4], 4
2:8359  7405                 je 0x8360
2:835B  c746fe0100           mov word ptr [bp - 2], 1
loc_8360:
2:8360  8b46c0               mov ax, word ptr [bp - 0x40]
2:8363  0346fe               add ax, word ptr [bp - 2]
2:8366  8946f2               mov word ptr [bp - 0xe], ax
2:8369  8b4eba               mov cx, word ptr [bp - 0x46]
2:836C  034efe               add cx, word ptr [bp - 2]
2:836F  83e902               sub cx, 2
2:8372  894ef4               mov word ptr [bp - 0xc], cx
2:8375  8bd0                 mov dx, ax
2:8377  2d0300               sub ax, 3
2:837A  8946f6               mov word ptr [bp - 0xa], ax
2:837D  83c103               add cx, 3
2:8380  894ef8               mov word ptr [bp - 8], cx
2:8383  83c203               add dx, 3
2:8386  8956fa               mov word ptr [bp - 6], dx
2:8389  894efc               mov word ptr [bp - 4], cx
2:838C  66ff76b6             push dword ptr [bp - 0x4a]
2:8390  9a4f840000           lcall 0, 0x844f  ; GDI.SelectObject
2:8395  8b46fe               mov ax, word ptr [bp - 2]
2:8398  8946a4               mov word ptr [bp - 0x5c], ax
2:839B  0bc0                 or ax, ax
2:839D  752e                 jne 0x83cd
2:839F  ff76b8               push word ptr [bp - 0x48]
2:83A2  6a01                 push 1
2:83A4  8b46be               mov ax, word ptr [bp - 0x42]
2:83A7  2d0200               sub ax, 2
2:83AA  50                   push ax
2:83AB  9a25840000           lcall 0, 0x8425  ; GDI.MoveTo
2:83B0  ff76b8               push word ptr [bp - 0x48]
2:83B3  666801000100         push 0x10001
2:83B9  9ac9830000           lcall 0, 0x83c9  ; GDI.LineTo
2:83BE  ff76b8               push word ptr [bp - 0x48]
2:83C1  8b46c4               mov ax, word ptr [bp - 0x3c]
2:83C4  48                   dec ax
2:83C5  50                   push ax
2:83C6  6a01                 push 1
2:83C8  9a36840000           lcall 0, 0x8436  ; GDI.LineTo
loc_83CD:
2:83CD  c746fe0000           mov word ptr [bp - 2], 0
2:83D2  c45e08               les bx, ptr [bp + 8]
2:83D5  26f6470408           test byte ptr es:[bx + 4], 8
2:83DA  7405                 je 0x83e1
2:83DC  c746fe0100           mov word ptr [bp - 2], 1
loc_83E1:
2:83E1  8b46c0               mov ax, word ptr [bp - 0x40]
2:83E4  0346fe               add ax, word ptr [bp - 2]
2:83E7  8946e6               mov word ptr [bp - 0x1a], ax
2:83EA  8b4ec2               mov cx, word ptr [bp - 0x3e]
2:83ED  2b4eba               sub cx, word ptr [bp - 0x46]
2:83F0  034efe               add cx, word ptr [bp - 2]
2:83F3  41                   inc cx
2:83F4  894ee8               mov word ptr [bp - 0x18], cx
2:83F7  8bd0                 mov dx, ax
2:83F9  2d0300               sub ax, 3
2:83FC  8946ea               mov word ptr [bp - 0x16], ax
2:83FF  83e903               sub cx, 3
2:8402  894eec               mov word ptr [bp - 0x14], cx
2:8405  83c203               add dx, 3
2:8408  8956ee               mov word ptr [bp - 0x12], dx
2:840B  894ef0               mov word ptr [bp - 0x10], cx
2:840E  8b46fe               mov ax, word ptr [bp - 2]
2:8411  8946a4               mov word ptr [bp - 0x5c], ax
2:8414  0bc0                 or ax, ax
2:8416  7530                 jne 0x8448
2:8418  ff76b8               push word ptr [bp - 0x48]
2:841B  6a01                 push 1
2:841D  8b46b0               mov ax, word ptr [bp - 0x50]
2:8420  2d0200               sub ax, 2
2:8423  50                   push ax
2:8424  9affff0000           lcall 0, 0xffff  ; GDI.MoveTo
2:8429  ff76b8               push word ptr [bp - 0x48]
2:842C  6a01                 push 1
2:842E  8b46be               mov ax, word ptr [bp - 0x42]
2:8431  40                   inc ax
2:8432  50                   push ax
2:8433  8bf0                 mov si, ax
2:8435  9a44840000           lcall 0, 0x8444  ; GDI.LineTo
2:843A  ff76b8               push word ptr [bp - 0x48]
2:843D  8b46c4               mov ax, word ptr [bp - 0x3c]
2:8440  48                   dec ax
2:8441  50                   push ax
2:8442  56                   push si
2:8443  9affff0000           lcall 0, 0xffff  ; GDI.LineTo
loc_8448:
2:8448  ff76b8               push word ptr [bp - 0x48]
2:844B  ff76b4               push word ptr [bp - 0x4c]
2:844E  9a5a840000           lcall 0, 0x845a  ; GDI.SelectObject
2:8453  ff76b8               push word ptr [bp - 0x48]
2:8456  ff76b2               push word ptr [bp - 0x4e]
2:8459  9a83840000           lcall 0, 0x8483  ; GDI.SelectObject
2:845E  ff76b8               push word ptr [bp - 0x48]
2:8461  8d46f2               lea ax, [bp - 0xe]
2:8464  16                   push ss
2:8465  50                   push ax
2:8466  6a03                 push 3
2:8468  9a78840000           lcall 0, 0x8478  ; GDI.Polygon
2:846D  ff76b8               push word ptr [bp - 0x48]
2:8470  8d46e6               lea ax, [bp - 0x1a]
2:8473  16                   push ss
2:8474  50                   push ax
2:8475  6a03                 push 3
2:8477  9affff0000           lcall 0, 0xffff  ; GDI.Polygon
2:847C  ff76b8               push word ptr [bp - 0x48]
2:847F  ff76a6               push word ptr [bp - 0x5a]
2:8482  9a8e840000           lcall 0, 0x848e  ; GDI.SelectObject
2:8487  ff76b8               push word ptr [bp - 0x48]
2:848A  ff76a8               push word ptr [bp - 0x58]
2:848D  9affff0000           lcall 0, 0xffff  ; GDI.SelectObject
2:8492  ff76b6               push word ptr [bp - 0x4a]
2:8495  9a9e840000           lcall 0, 0x849e  ; GDI.DeleteObject
2:849A  ff76b4               push word ptr [bp - 0x4c]
2:849D  9aa6840000           lcall 0, 0x84a6  ; GDI.DeleteObject
2:84A2  ff76b2               push word ptr [bp - 0x4e]
2:84A5  9a1c630000           lcall 0, 0x631c  ; GDI.DeleteObject
2:84AA  ff7606               push word ptr [bp + 6]
2:84AD  8d46c6               lea ax, [bp - 0x3a]
2:84B0  16                   push ss
2:84B1  50                   push ax
2:84B2  9a14630000           lcall 0, 0x6314  ; USER.EndPaint
2:84B7  5e                   pop si
2:84B8  c9                   leave
2:84B9  cb                   retf

; ---------------- sub_s2:84BA size=744 callers=0
;   apis: USER.SendMessage
2:84BA  c8020000             enter 2, 0
2:84BE  c45e08               les bx, ptr [bp + 8]
2:84C1  26f6470404           test byte ptr es:[bx + 4], 4
2:84C6  7408                 je 0x84d0
2:84C8  c746fe0000           mov word ptr [bp - 2], 0
2:84CD  eb0d                 jmp 0x84dc
2:84CF  db 90
loc_84D0:
2:84D0  26f6470408           test byte ptr es:[bx + 4], 8
2:84D5  7419                 je 0x84f0
2:84D7  c746fe0100           mov word ptr [bp - 2], 1
loc_84DC:
2:84DC  26ff37               push word ptr es:[bx]
2:84DF  681501               push 0x115
2:84E2  ff76fe               push word ptr [bp - 2]
2:84E5  6a00                 push 0
2:84E7  26ff7702             push word ptr es:[bx + 2]
2:84EB  9a1c0d0000           lcall 0, 0xd1c  ; USER.SendMessage
loc_84F0:
2:84F0  c9                   leave
2:84F1  cb                   retf
2:84F2  db 8c d0 c8 1c 00 00 1e 8e d8 ff 76 0e 6a 00 9a 5c
2:8502  db 82 00 00 89 46 ec 89 56 ee 8b 46 0c 3d 1f 00 74
2:8512  db 25 0f 87 43 02 3d 14 00 0f 84 7c 02 0f 87 4f 02
2:8522  db fe c8 74 3a fe c8 74 50 2c 0a 0f 84 6a 02 2c 03
2:8532  db 74 62 e9 3a 02 90 c4 5e ec 26 c7 47 04 00 00 ff
2:8542  db 76 0e 68 a6 0f 9a 53 85 00 00 ff 76 0e 68 a7 0f
2:8552  db 9a 29 86 00 00 9a 39 86 00 00 e9 3b 02 90 66 ff
2:8562  db 76 06 ff 76 0a ff 76 0c ff 76 0e 90 0e e8 a2 fc
2:8572  db 83 c4 0a 1f c9 ca 0a 00 8b 46 ec 89 46 e8 89 56
2:8582  db ea 89 46 e4 89 56 e6 52 50 9a ce 17 28 82 83 c4
2:8592  db 04 e9 04 02 52 ff 76 ec ff 76 0e 90 0e e8 e6 fc
2:85A2  db 83 c4 06 e9 f2 01 8b 46 08 89 46 f6 c4 5e ec 26
2:85B2  db 80 4f 04 01 ff 76 0e 8d 46 f8 16 50 9a dd 86 00
2:85C2  db 00 8b 46 fe d1 f8 89 46 f4 3b 46 f6 76 0a c4 5e
2:85D2  db ec 26 80 4f 04 04 eb 08 c4 5e ec 26 80 4f 04 08
2:85E2  db 66 ff 76 ec ff 76 0e 90 0e e8 cc fe 83 c4 06 ff
2:85F2  db 76 0e 66 68 2c 01 a6 0f 66 6a 00 9a a3 86 00 00
2:8602  db ff 76 0e 66 6a 00 6a 01 9a 5e 86 00 00 ff 76 0e
2:8612  db 9a 66 86 00 00 ff 76 0e 9a ff ff 00 00 e9 78 01
2:8622  db ff 76 0e 68 a6 0f 9a 34 86 00 00 ff 76 0e 68 a7
2:8632  db 0f 9a 92 86 00 00 9a ff ff 00 00 c4 5e ec 26 8b
2:8642  db 47 04 8b c8 a8 01 74 20 f7 c1 fd ff 74 1a 26 80
2:8652  db 67 04 f2 ff 76 0e 66 6a 00 6a 01 9a 4b 87 00 00
2:8662  db ff 76 0e 9a 53 87 00 00 c4 5e ec 26 ff 37 66 68
2:8672  db f9 00 11 01 6a 00 26 ff 77 02 9a ec 84 00 00 e9
2:8682  db 16 01 81 7e 0a a6 0f 75 1c ff 76 0e ff 76 0a 9a
2:8692  db ff ff 00 00 ff 76 0e 66 68 01 00 a7 0f 66 6a 00
2:86A2  db 9a ff ff 00 00 c4 5e ec 26 f6 47 04 02 0f 85 e7
2:86B2  db 00 06 53 ff 76 0e 90 0e e8 fd fd e9 e2 fe c4 5e
2:86C2  db ec 26 f6 47 04 01 0f 84 ce 00 66 8b 46 06 66 89
2:86D2  db 46 f0 ff 76 0e 8d 46 f8 16 50 9a d8 82 00 00 8b
2:86E2  db 46 fe d1 f8 89 46 f4 c4 5e ec 26 8b 47 04 89 46
2:86F2  db e4 26 80 67 04 f3 8d 46 f8 16 50 66 ff 76 f0 9a
2:8702  db ff ff 00 00 0b c0 75 0a c4 5e ec 26 80 4f 04 02
2:8712  db eb 22 8b 46 f4 39 46 f2 7d 0a c4 5e ec 26 80 4f
2:8722  db 04 04 eb 08 c4 5e ec 26 80 4f 04 08 c4 5e ec 26
2:8732  db 80 67 04 fd 8b 46 e4 c4 5e ec 26 39 47 04 74 58
2:8742  db ff 76 0e 66 6a 00 6a 01 9a ff ff 00 00 ff 76 0e
2:8752  db 9a dd 2f 00 00 eb 41 90 3d 00 02 0f 84 5f ff 77
2:8762  db 23 2d 81 00 0f 84 f6 fd 2d 92 00 0f 84 13 ff 66
2:8772  db ff 76 0c 66 ff 76 08 ff 76 06 9a 60 5f 00 00 1f
2:8782  db c9 ca 0a 00 2d 01 02 0f 84 1b fe 48 0f 84 90 fe
2:8792  db 48 0f 84 11 fe eb d8 90 33 c0 99 1f c9 ca 0a 00

; ---------------- sub_s2:87A2 FAR size=42 callers=0
2:87A2  55                   push bp
2:87A3  8bec                 mov bp, sp
2:87A5  66ff7606             push dword ptr [bp + 6]
2:87A9  90                   nop
2:87AA  0e                   push cs
2:87AB  e8baf9               call 0x8168  ; sub_s2:8168
2:87AE  f6460a01             test byte ptr [bp + 0xa], 1
2:87B2  7409                 je 0x87bd
2:87B4  66ff7606             push dword ptr [bp + 6]
2:87B8  9ace178e85           lcall 0x858e, 0x17ce  ; operator_delete@s1:17CE
loc_87BD:
2:87BD  8b4606               mov ax, word ptr [bp + 6]
2:87C0  8b5608               mov dx, word ptr [bp + 8]
2:87C3  c9                   leave
2:87C4  ca0600               retf 6
2:87C7  db 90 a2 87 c5 81

; ---------------- sub_s2:87CC FAR size=726 callers=2
2:87CC  c8320000             enter 0x32, 0
2:87D0  57                   push di
2:87D1  56                   push si
2:87D2  c45e06               les bx, ptr [bp + 6]
2:87D5  26c7079a38           mov word ptr es:[bx], 0x389a
2:87DA  26c747026988         mov word ptr es:[bx + 2], 0x8869  ; SEGMENT s2:0000
2:87E0  668b4610             mov eax, dword ptr [bp + 0x10]
2:87E4  c45e06               les bx, ptr [bp + 6]
2:87E7  6626894704           mov dword ptr es:[bx + 4], eax
2:87EC  6626c7470800000000   mov dword ptr es:[bx + 8], 0
2:87F5  8b460c               mov ax, word ptr [bp + 0xc]
2:87F8  2689470c             mov word ptr es:[bx + 0xc], ax
2:87FC  8b460a               mov ax, word ptr [bp + 0xa]
2:87FF  2689470e             mov word ptr es:[bx + 0xe], ax
2:8803  33c0                 xor ax, ax
2:8805  26894710             mov word ptr es:[bx + 0x10], ax
2:8809  26894712             mov word ptr es:[bx + 0x12], ax
2:880D  8d471c               lea ax, [bx + 0x1c]
2:8810  06                   push es
2:8811  50                   push ax
2:8812  90                   nop
2:8813  0e                   push cs
2:8814  e821b6               call 0x3e38  ; sub_s2:3E38
2:8817  668b4606             mov eax, dword ptr [bp + 6]
2:881B  052200               add ax, 0x22
2:881E  6650                 push eax
2:8820  90                   nop
2:8821  0e                   push cs
2:8822  e813b6               call 0x3e38  ; sub_s2:3E38
2:8825  668b4606             mov eax, dword ptr [bp + 6]
2:8829  052800               add ax, 0x28
2:882C  6650                 push eax
2:882E  90                   nop
2:882F  0e                   push cs
2:8830  e805b6               call 0x3e38  ; sub_s2:3E38
2:8833  8b460e               mov ax, word ptr [bp + 0xe]
2:8836  c45e06               les bx, ptr [bp + 6]
2:8839  2689472e             mov word ptr es:[bx + 0x2e], ax
2:883D  26c74730ffff         mov word ptr es:[bx + 0x30], 0xffff
2:8843  6626c7473a00000000   mov dword ptr es:[bx + 0x3a], 0
2:884C  b80100               mov ax, 1
2:884F  2689473e             mov word ptr es:[bx + 0x3e], ax
2:8853  26894740             mov word ptr es:[bx + 0x40], ax
2:8857  668b4614             mov eax, dword ptr [bp + 0x14]
2:885B  6626894742           mov dword ptr es:[bx + 0x42], eax
2:8860  26c7079a8e           mov word ptr es:[bx], 0x8e9a
2:8865  26c74702ca87         mov word ptr es:[bx + 2], 0x87ca  ; SEGMENT s2:0000
2:886B  66833e820300         cmp dword ptr [0x382], 0
2:8871  7513                 jne 0x8886
2:8873  6a2e                 push 0x2e
2:8875  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:887A  9aba20bb76           lcall 0x76bb, 0x20ba  ; sub_s3:20BA
2:887F  a38203               mov word ptr [0x382], ax
2:8882  89168403             mov word ptr [0x384], dx
loc_8886:
2:8886  c45e06               les bx, ptr [bp + 6]
2:8889  6626ff7704           push dword ptr es:[bx + 4]
2:888E  90                   nop
2:888F  0e                   push cs
2:8890  e8dfbe               call 0x4772  ; sub_s2:4772
2:8893  8946fc               mov word ptr [bp - 4], ax
2:8896  8956fe               mov word ptr [bp - 2], dx
2:8899  8ec2                 mov es, dx
2:889B  8bd8                 mov bx, ax
2:889D  b82f00               mov ax, 0x2f
2:88A0  262b4708             sub ax, word ptr es:[bx + 8]
2:88A4  c45e06               les bx, ptr [bp + 6]
2:88A7  26894712             mov word ptr es:[bx + 0x12], ax
2:88AB  c41e8203             les bx, ptr [0x382]
2:88AF  268b470a             mov ax, word ptr es:[bx + 0xa]
2:88B3  8946fa               mov word ptr [bp - 6], ax
2:88B6  268b470c             mov ax, word ptr es:[bx + 0xc]
2:88BA  8946f8               mov word ptr [bp - 8], ax
2:88BD  268b470e             mov ax, word ptr es:[bx + 0xe]
2:88C1  8946f6               mov word ptr [bp - 0xa], ax
2:88C4  268b4710             mov ax, word ptr es:[bx + 0x10]
2:88C8  8946f4               mov word ptr [bp - 0xc], ax
2:88CB  c45e06               les bx, ptr [bp + 6]
2:88CE  268b470c             mov ax, word ptr es:[bx + 0xc]
2:88D2  8bc8                 mov cx, ax
2:88D4  262b470e             sub ax, word ptr es:[bx + 0xe]
2:88D8  f76ef6               imul word ptr [bp - 0xa]
2:88DB  26034710             add ax, word ptr es:[bx + 0x10]
2:88DF  0346fa               add ax, word ptr [bp - 6]
2:88E2  50                   push ax
2:88E3  8bc1                 mov ax, cx
2:88E5  2603470e             add ax, word ptr es:[bx + 0xe]
2:88E9  f76ef4               imul word ptr [bp - 0xc]
2:88EC  26034712             add ax, word ptr es:[bx + 0x12]
2:88F0  0346f8               add ax, word ptr [bp - 8]
2:88F3  50                   push ax
2:88F4  6a00                 push 0
2:88F6  8d471c               lea ax, [bx + 0x1c]
2:88F9  06                   push es
2:88FA  50                   push ax
2:88FB  90                   nop
2:88FC  0e                   push cs
2:88FD  e876b5               call 0x3e76  ; sub_s2:3E76
2:8900  c45e06               les bx, ptr [bp + 6]
2:8903  268b471c             mov ax, word ptr es:[bx + 0x1c]
2:8907  052000               add ax, 0x20
2:890A  26894714             mov word ptr es:[bx + 0x14], ax
2:890E  c45efc               les bx, ptr [bp - 4]
2:8911  268b4708             mov ax, word ptr es:[bx + 8]
2:8915  c45e06               les bx, ptr [bp + 6]
2:8918  2603471e             add ax, word ptr es:[bx + 0x1e]
2:891C  2d2500               sub ax, 0x25
2:891F  26894716             mov word ptr es:[bx + 0x16], ax
2:8923  c45e06               les bx, ptr [bp + 6]
2:8926  268b4714             mov ax, word ptr es:[bx + 0x14]
2:892A  053200               add ax, 0x32
2:892D  26894718             mov word ptr es:[bx + 0x18], ax
2:8931  268b4716             mov ax, word ptr es:[bx + 0x16]
2:8935  051900               add ax, 0x19
2:8938  2689471a             mov word ptr es:[bx + 0x1a], ax
2:893C  6a06                 push 6
2:893E  9a9c17a089           lcall 0x89a0, 0x179c  ; operator_new@s1:179C
2:8943  83c402               add sp, 2
2:8946  8946e8               mov word ptr [bp - 0x18], ax
2:8949  8956ea               mov word ptr [bp - 0x16], dx
2:894C  0bd0                 or dx, ax
2:894E  741e                 je 0x896e
2:8950  c45e06               les bx, ptr [bp + 6]
2:8953  26ff772e             push word ptr es:[bx + 0x2e]
2:8957  ff76ea               push word ptr [bp - 0x16]
2:895A  50                   push ax
2:895B  90                   nop
2:895C  0e                   push cs
2:895D  e84224               call 0xada2  ; sub_s2:ADA2
2:8960  c45e06               les bx, ptr [bp + 6]
2:8963  26894708             mov word ptr es:[bx + 8], ax
2:8967  2689570a             mov word ptr es:[bx + 0xa], dx
2:896B  eb0d                 jmp 0x897a
2:896D  db 90
loc_896E:
2:896E  c45e06               les bx, ptr [bp + 6]
2:8971  6626c7470800000000   mov dword ptr es:[bx + 8], 0
loc_897A:
2:897A  c45e06               les bx, ptr [bp + 6]
2:897D  6626ff7708           push dword ptr es:[bx + 8]
2:8982  90                   nop
2:8983  0e                   push cs
2:8984  e85125               call 0xaed8  ; sub_s2:AED8
2:8987  0bc0                 or ax, ax
2:8989  7529                 jne 0x89b4
2:898B  c45e06               les bx, ptr [bp + 6]
2:898E  66268b4708           mov eax, dword ptr es:[bx + 8]
2:8993  668946e8             mov dword ptr [bp - 0x18], eax
2:8997  668946f0             mov dword ptr [bp - 0x10], eax
2:899B  6650                 push eax
2:899D  9ace17bb87           lcall 0x87bb, 0x17ce  ; operator_delete@s1:17CE
2:89A2  83c404               add sp, 4
2:89A5  c45e06               les bx, ptr [bp + 6]
2:89A8  6626c7470800000000   mov dword ptr es:[bx + 8], 0
2:89B1  e9e100               jmp 0x8a95
loc_89B4:
2:89B4  c45e06               les bx, ptr [bp + 6]
2:89B7  66268b4708           mov eax, dword ptr es:[bx + 8]
2:89BC  668946ce             mov dword ptr [bp - 0x32], eax
2:89C0  6650                 push eax
2:89C2  66ff368203           push dword ptr [0x382]
2:89C7  9aee20068a           lcall 0x8a06, 0x20ee  ; sub_s4:20EE
2:89CC  8946f0               mov word ptr [bp - 0x10], ax
2:89CF  8956f2               mov word ptr [bp - 0xe], dx
2:89D2  c45e06               les bx, ptr [bp + 6]
2:89D5  6626ff7708           push dword ptr es:[bx + 8]
2:89DA  90                   nop
2:89DB  0e                   push cs
2:89DC  e8f323               call 0xadd2  ; sub_s2:ADD2
2:89DF  66ff76f0             push dword ptr [bp - 0x10]
2:89E3  90                   nop
2:89E4  0e                   push cs
2:89E5  e88abd               call 0x4772  ; sub_s2:4772
2:89E8  8946e4               mov word ptr [bp - 0x1c], ax
2:89EB  8956e6               mov word ptr [bp - 0x1a], dx
2:89EE  c45e06               les bx, ptr [bp + 6]
2:89F1  26ff772e             push word ptr es:[bx + 0x2e]
2:89F5  8d4728               lea ax, [bx + 0x28]
2:89F8  06                   push es
2:89F9  50                   push ax
2:89FA  66ff368203           push dword ptr [0x382]
2:89FF  8bf0                 mov si, ax
2:8A01  8cc7                 mov di, es
2:8A03  9a4e213f28           lcall 0x283f, 0x214e  ; sub_s4:214E
2:8A08  8b4606               mov ax, word ptr [bp + 6]
2:8A0B  8b5608               mov dx, word ptr [bp + 8]
2:8A0E  051c00               add ax, 0x1c
2:8A11  56                   push si
2:8A12  57                   push di
2:8A13  1e                   push ds
2:8A14  8d7ede               lea di, [bp - 0x22]
2:8A17  8bf0                 mov si, ax
2:8A19  16                   push ss
2:8A1A  07                   pop es
2:8A1B  8eda                 mov ds, dx
2:8A1D  66a5                 movsd dword ptr es:[di], dword ptr [si]
2:8A1F  a5                   movsw word ptr es:[di], word ptr [si]
2:8A20  1f                   pop ds
2:8A21  5f                   pop di
2:8A22  5e                   pop si
2:8A23  8d46de               lea ax, [bp - 0x22]
2:8A26  8946ce               mov word ptr [bp - 0x32], ax
2:8A29  57                   push di
2:8A2A  56                   push si
2:8A2B  16                   push ss
2:8A2C  50                   push ax
2:8A2D  90                   nop
2:8A2E  0e                   push cs
2:8A2F  e800b5               call 0x3f32  ; sub_s2:3F32
2:8A32  8b4606               mov ax, word ptr [bp + 6]
2:8A35  8b5608               mov dx, word ptr [bp + 8]
2:8A38  053200               add ax, 0x32
2:8A3B  52                   push dx
2:8A3C  50                   push ax
2:8A3D  8b4e06               mov cx, word ptr [bp + 6]
2:8A40  83c134               add cx, 0x34
2:8A43  52                   push dx
2:8A44  51                   push cx
2:8A45  8d76de               lea si, [bp - 0x22]
2:8A48  16                   push ss
2:8A49  56                   push si
2:8A4A  8bf9                 mov di, cx
2:8A4C  8946d2               mov word ptr [bp - 0x2e], ax
2:8A4F  8956d4               mov word ptr [bp - 0x2c], dx
2:8A52  8bf2                 mov si, dx
2:8A54  90                   nop
2:8A55  0e                   push cs
2:8A56  e83bb4               call 0x3e94  ; sub_s2:3E94
2:8A59  c45ee4               les bx, ptr [bp - 0x1c]
2:8A5C  268b4704             mov ax, word ptr es:[bx + 4]
2:8A60  c45ed2               les bx, ptr [bp - 0x2e]
2:8A63  260307               add ax, word ptr es:[bx]
2:8A66  c45e06               les bx, ptr [bp + 6]
2:8A69  26894736             mov word ptr es:[bx + 0x36], ax
2:8A6D  c45ee4               les bx, ptr [bp - 0x1c]
2:8A70  268b4708             mov ax, word ptr es:[bx + 8]
2:8A74  8ec6                 mov es, si
2:8A76  260305               add ax, word ptr es:[di]
2:8A79  c45e06               les bx, ptr [bp + 6]
2:8A7C  26894738             mov word ptr es:[bx + 0x38], ax
2:8A80  666802000500         push 0x50002
2:8A86  90                   nop
2:8A87  0e                   push cs
2:8A88  e8a3d6               call 0x612e  ; sub_s2:612E
2:8A8B  83c404               add sp, 4
2:8A8E  c45e06               les bx, ptr [bp + 6]
2:8A91  2689473e             mov word ptr es:[bx + 0x3e], ax
loc_8A95:
2:8A95  8b4606               mov ax, word ptr [bp + 6]
2:8A98  8b5608               mov dx, word ptr [bp + 8]
2:8A9B  5e                   pop si
2:8A9C  5f                   pop di
2:8A9D  c9                   leave
2:8A9E  ca1200               retf 0x12
2:8AA1  db 00

; ---------------- sub_s2:8AA2 FAR size=126 callers=1
2:8AA2  c8140000             enter 0x14, 0
2:8AA6  c45e06               les bx, ptr [bp + 6]
2:8AA9  26c7079a8e           mov word ptr es:[bx], 0x8e9a
2:8AAE  26c747021a8b         mov word ptr es:[bx + 2], 0x8b1a  ; SEGMENT s2:0000
2:8AB4  c45e06               les bx, ptr [bp + 6]
2:8AB7  26c45f04             les bx, ptr es:[bx + 4]
2:8ABB  26837f1c00           cmp word ptr es:[bx + 0x1c], 0
2:8AC0  7425                 je 0x8ae7
2:8AC2  c45e06               les bx, ptr [bp + 6]
2:8AC5  268b4704             mov ax, word ptr es:[bx + 4]
2:8AC9  268b5706             mov dx, word ptr es:[bx + 6]
2:8ACD  8bda                 mov bx, dx
2:8ACF  8946f2               mov word ptr [bp - 0xe], ax
2:8AD2  8956f4               mov word ptr [bp - 0xc], dx
2:8AD5  0bd8                 or bx, ax
2:8AD7  740e                 je 0x8ae7
2:8AD9  6a01                 push 1
2:8ADB  52                   push dx
2:8ADC  50                   push ax
2:8ADD  8ec2                 mov es, dx
2:8ADF  8bd8                 mov bx, ax
2:8AE1  26c41f               les bx, ptr es:[bx]
2:8AE4  26ff1f               lcall es:[bx]
loc_8AE7:
2:8AE7  c45e06               les bx, ptr [bp + 6]
2:8AEA  268b473a             mov ax, word ptr es:[bx + 0x3a]
2:8AEE  268b573c             mov dx, word ptr es:[bx + 0x3c]
2:8AF2  8bda                 mov bx, dx
2:8AF4  8946f2               mov word ptr [bp - 0xe], ax
2:8AF7  8956f4               mov word ptr [bp - 0xc], dx
2:8AFA  0bd8                 or bx, ax
2:8AFC  7410                 je 0x8b0e
2:8AFE  52                   push dx
2:8AFF  50                   push ax
2:8B00  90                   nop
2:8B01  0e                   push cs
2:8B02  e813c6               call 0x5118  ; sub_s2:5118
2:8B05  66ff76f2             push dword ptr [bp - 0xe]
2:8B09  9ace174189           lcall 0x8941, 0x17ce  ; operator_delete@s1:17CE
loc_8B0E:
2:8B0E  c45e06               les bx, ptr [bp + 6]
2:8B11  26c7079a38           mov word ptr es:[bx], 0x389a
2:8B16  26c74702de87         mov word ptr es:[bx + 2], 0x87de  ; SEGMENT s2:0000
2:8B1C  c9                   leave
2:8B1D  ca0400               retf 4

; ---------------- sub_s2:8B20 FAR size=166 callers=1
2:8B20  c81a0000             enter 0x1a, 0
2:8B24  57                   push di
2:8B25  56                   push si
2:8B26  c45e06               les bx, ptr [bp + 6]
2:8B29  6626837f0800         cmp dword ptr es:[bx + 8], 0
2:8B2F  7509                 jne 0x8b3a
loc_8B31:
2:8B31  33c0                 xor ax, ax
2:8B33  99                   cdq
2:8B34  5e                   pop si
2:8B35  5f                   pop di
2:8B36  c9                   leave
2:8B37  ca0400               retf 4
loc_8B3A:
2:8B3A  268b4740             mov ax, word ptr es:[bx + 0x40]
2:8B3E  26ff4740             inc word ptr es:[bx + 0x40]
2:8B42  8946f6               mov word ptr [bp - 0xa], ax
2:8B45  99                   cdq
2:8B46  26f77f3e             idiv word ptr es:[bx + 0x3e]
2:8B4A  0bd2                 or dx, dx
2:8B4C  75e3                 jne 0x8b31
2:8B4E  c45e06               les bx, ptr [bp + 6]
2:8B51  26c747400100         mov word ptr es:[bx + 0x40], 1
2:8B57  66268b4708           mov eax, dword ptr es:[bx + 8]
2:8B5C  668946e6             mov dword ptr [bp - 0x1a], eax
2:8B60  6650                 push eax
2:8B62  66ff368203           push dword ptr [0x382]
2:8B67  9aee20ca89           lcall 0x89ca, 0x20ee  ; sub_s4:20EE
2:8B6C  8946fc               mov word ptr [bp - 4], ax
2:8B6F  8956fe               mov word ptr [bp - 2], dx
2:8B72  8d46fa               lea ax, [bp - 6]
2:8B75  16                   push ss
2:8B76  50                   push ax
2:8B77  8d46f8               lea ax, [bp - 8]
2:8B7A  16                   push ss
2:8B7B  50                   push ax
2:8B7C  8b4606               mov ax, word ptr [bp + 6]
2:8B7F  8b5608               mov dx, word ptr [bp + 8]
2:8B82  052800               add ax, 0x28
2:8B85  52                   push dx
2:8B86  50                   push ax
2:8B87  8bf0                 mov si, ax
2:8B89  8bfa                 mov di, dx
2:8B8B  90                   nop
2:8B8C  0e                   push cs
2:8B8D  e804b3               call 0x3e94  ; sub_s2:3E94
2:8B90  c45e06               les bx, ptr [bp + 6]
2:8B93  6626ff7704           push dword ptr es:[bx + 4]
2:8B98  66ff76fc             push dword ptr [bp - 4]
2:8B9C  06                   push es
2:8B9D  53                   push bx
2:8B9E  90                   nop
2:8B9F  0e                   push cs
2:8BA0  e8e701               call 0x8d8a  ; sub_s2:8D8A
2:8BA3  66ff76fc             push dword ptr [bp - 4]
2:8BA7  57                   push di
2:8BA8  56                   push si
2:8BA9  c45e06               les bx, ptr [bp + 6]
2:8BAC  6626ff7704           push dword ptr es:[bx + 4]
2:8BB1  90                   nop
2:8BB2  0e                   push cs
2:8BB3  e8cab8               call 0x4480  ; sub_s2:4480
2:8BB6  8b4606               mov ax, word ptr [bp + 6]
2:8BB9  8b5608               mov dx, word ptr [bp + 8]
2:8BBC  053200               add ax, 0x32
2:8BBF  5e                   pop si
2:8BC0  5f                   pop di
2:8BC1  c9                   leave
2:8BC2  ca0400               retf 4
2:8BC5  db 00

; ---------------- sub_s2:8BC6 FAR size=136 callers=2
2:8BC6  c8180000             enter 0x18, 0
2:8BCA  57                   push di
2:8BCB  56                   push si
2:8BCC  c45e06               les bx, ptr [bp + 6]
2:8BCF  6626837f0800         cmp dword ptr es:[bx + 8], 0
2:8BD5  7509                 jne 0x8be0
2:8BD7  33c0                 xor ax, ax
2:8BD9  99                   cdq
2:8BDA  5e                   pop si
2:8BDB  5f                   pop di
2:8BDC  c9                   leave
2:8BDD  ca0400               retf 4
loc_8BE0:
2:8BE0  66268b4708           mov eax, dword ptr es:[bx + 8]
2:8BE5  668946e8             mov dword ptr [bp - 0x18], eax
2:8BE9  6650                 push eax
2:8BEB  66ff368203           push dword ptr [0x382]
2:8BF0  9aee206a8b           lcall 0x8b6a, 0x20ee  ; sub_s4:20EE
2:8BF5  8946fc               mov word ptr [bp - 4], ax
2:8BF8  8956fe               mov word ptr [bp - 2], dx
2:8BFB  8d46fa               lea ax, [bp - 6]
2:8BFE  16                   push ss
2:8BFF  50                   push ax
2:8C00  8d46f8               lea ax, [bp - 8]
2:8C03  16                   push ss
2:8C04  50                   push ax
2:8C05  8b4606               mov ax, word ptr [bp + 6]
2:8C08  8b5608               mov dx, word ptr [bp + 8]
2:8C0B  052800               add ax, 0x28
2:8C0E  52                   push dx
2:8C0F  50                   push ax
2:8C10  8bf0                 mov si, ax
2:8C12  8bfa                 mov di, dx
2:8C14  90                   nop
2:8C15  0e                   push cs
2:8C16  e87bb2               call 0x3e94  ; sub_s2:3E94
2:8C19  c45e06               les bx, ptr [bp + 6]
2:8C1C  6626ff7704           push dword ptr es:[bx + 4]
2:8C21  66ff76fc             push dword ptr [bp - 4]
2:8C25  06                   push es
2:8C26  53                   push bx
2:8C27  90                   nop
2:8C28  0e                   push cs
2:8C29  e85e01               call 0x8d8a  ; sub_s2:8D8A
2:8C2C  66ff76fc             push dword ptr [bp - 4]
2:8C30  57                   push di
2:8C31  56                   push si
2:8C32  c45e06               les bx, ptr [bp + 6]
2:8C35  6626ff7704           push dword ptr es:[bx + 4]
2:8C3A  90                   nop
2:8C3B  0e                   push cs
2:8C3C  e841b8               call 0x4480  ; sub_s2:4480
2:8C3F  8b4606               mov ax, word ptr [bp + 6]
2:8C42  8b5608               mov dx, word ptr [bp + 8]
2:8C45  053200               add ax, 0x32
2:8C48  5e                   pop si
2:8C49  5f                   pop di
2:8C4A  c9                   leave
2:8C4B  ca0400               retf 4

; ---------------- sub_s2:8C4E FAR size=150 callers=1
2:8C4E  c80c0000             enter 0xc, 0
2:8C52  c45e06               les bx, ptr [bp + 6]
2:8C55  6626ff7704           push dword ptr es:[bx + 4]
2:8C5A  90                   nop
2:8C5B  0e                   push cs
2:8C5C  e813bb               call 0x4772  ; sub_s2:4772
2:8C5F  8946fc               mov word ptr [bp - 4], ax
2:8C62  8956fe               mov word ptr [bp - 2], dx
2:8C65  662bc0               sub eax, eax
2:8C68  668946f8             mov dword ptr [bp - 8], eax
2:8C6C  c45e06               les bx, ptr [bp + 6]
2:8C6F  2639470c             cmp word ptr es:[bx + 0xc], ax
2:8C73  7406                 je 0x8c7b
2:8C75  2639470e             cmp word ptr es:[bx + 0xe], ax
2:8C79  7549                 jne 0x8cc4
loc_8C7B:
2:8C7B  6a14                 push 0x14
2:8C7D  9a9c170c8b           lcall 0x8b0c, 0x179c  ; operator_new@s1:179C
2:8C82  83c402               add sp, 2
2:8C85  8946f4               mov word ptr [bp - 0xc], ax
2:8C88  8956f6               mov word ptr [bp - 0xa], dx
2:8C8B  0bd0                 or dx, ax
2:8C8D  7425                 je 0x8cb4
2:8C8F  66ff760a             push dword ptr [bp + 0xa]
2:8C93  668b4606             mov eax, dword ptr [bp + 6]
2:8C97  051c00               add ax, 0x1c
2:8C9A  6650                 push eax
2:8C9C  c45efc               les bx, ptr [bp - 4]
2:8C9F  6626ff7704           push dword ptr es:[bx + 4]
2:8CA4  6626ff7708           push dword ptr es:[bx + 8]
2:8CA9  66ff76f4             push dword ptr [bp - 0xc]
2:8CAD  90                   nop
2:8CAE  0e                   push cs
2:8CAF  e810c4               call 0x50c2  ; sub_s2:50C2
2:8CB2  eb03                 jmp 0x8cb7
loc_8CB4:
2:8CB4  33c0                 xor ax, ax
2:8CB6  99                   cdq
loc_8CB7:
2:8CB7  8946f8               mov word ptr [bp - 8], ax
2:8CBA  8956fa               mov word ptr [bp - 6], dx
2:8CBD  52                   push dx
2:8CBE  50                   push ax
2:8CBF  90                   nop
2:8CC0  0e                   push cs
2:8CC1  e870c4               call 0x5134  ; sub_s2:5134
loc_8CC4:
2:8CC4  c45e06               les bx, ptr [bp + 6]
2:8CC7  6626ff7704           push dword ptr es:[bx + 4]
2:8CCC  8d471c               lea ax, [bx + 0x1c]
2:8CCF  06                   push es
2:8CD0  50                   push ax
2:8CD1  66ff760a             push dword ptr [bp + 0xa]
2:8CD5  90                   nop
2:8CD6  0e                   push cs
2:8CD7  e8a6b7               call 0x4480  ; sub_s2:4480
2:8CDA  8b46f8               mov ax, word ptr [bp - 8]
2:8CDD  8b56fa               mov dx, word ptr [bp - 6]
2:8CE0  c9                   leave
2:8CE1  ca0800               retf 8

; ---------------- sub_s2:8CE4 FAR size=166 callers=1
2:8CE4  c8120000             enter 0x12, 0
2:8CE8  c45e06               les bx, ptr [bp + 6]
2:8CEB  6626ff7704           push dword ptr es:[bx + 4]
2:8CF0  90                   nop
2:8CF1  0e                   push cs
2:8CF2  e87dba               call 0x4772  ; sub_s2:4772
2:8CF5  8946fc               mov word ptr [bp - 4], ax
2:8CF8  8956fe               mov word ptr [bp - 2], dx
2:8CFB  662bc0               sub eax, eax
2:8CFE  668946f8             mov dword ptr [bp - 8], eax
2:8D02  c45e06               les bx, ptr [bp + 6]
2:8D05  26ff7710             push word ptr es:[bx + 0x10]
2:8D09  26ff7712             push word ptr es:[bx + 0x12]
2:8D0D  50                   push ax
2:8D0E  8d46f2               lea ax, [bp - 0xe]
2:8D11  16                   push ss
2:8D12  50                   push ax
2:8D13  90                   nop
2:8D14  0e                   push cs
2:8D15  e83cb1               call 0x3e54  ; sub_s2:3E54
2:8D18  8d46f2               lea ax, [bp - 0xe]
2:8D1B  16                   push ss
2:8D1C  50                   push ax
2:8D1D  66ff760a             push dword ptr [bp + 0xa]
2:8D21  90                   nop
2:8D22  0e                   push cs
2:8D23  e80cb2               call 0x3f32  ; sub_s2:3F32
2:8D26  6a14                 push 0x14
2:8D28  9a9c17808c           lcall 0x8c80, 0x179c  ; operator_new@s1:179C
2:8D2D  83c402               add sp, 2
2:8D30  8946ee               mov word ptr [bp - 0x12], ax
2:8D33  8956f0               mov word ptr [bp - 0x10], dx
2:8D36  0bd0                 or dx, ax
2:8D38  7420                 je 0x8d5a
2:8D3A  66ff760e             push dword ptr [bp + 0xe]
2:8D3E  66ff760a             push dword ptr [bp + 0xa]
2:8D42  c45efc               les bx, ptr [bp - 4]
2:8D45  6626ff7704           push dword ptr es:[bx + 4]
2:8D4A  6626ff7708           push dword ptr es:[bx + 8]
2:8D4F  ff76f0               push word ptr [bp - 0x10]
2:8D52  50                   push ax
2:8D53  90                   nop
2:8D54  0e                   push cs
2:8D55  e86ac3               call 0x50c2  ; sub_s2:50C2
2:8D58  eb03                 jmp 0x8d5d
loc_8D5A:
2:8D5A  33c0                 xor ax, ax
2:8D5C  99                   cdq
loc_8D5D:
2:8D5D  8946f8               mov word ptr [bp - 8], ax
2:8D60  8956fa               mov word ptr [bp - 6], dx
2:8D63  52                   push dx
2:8D64  50                   push ax
2:8D65  90                   nop
2:8D66  0e                   push cs
2:8D67  e8cac3               call 0x5134  ; sub_s2:5134
2:8D6A  c45e06               les bx, ptr [bp + 6]
2:8D6D  6626ff7704           push dword ptr es:[bx + 4]
2:8D72  66ff760a             push dword ptr [bp + 0xa]
2:8D76  66ff760e             push dword ptr [bp + 0xe]
2:8D7A  90                   nop
2:8D7B  0e                   push cs
2:8D7C  e801b7               call 0x4480  ; sub_s2:4480
2:8D7F  8b46f8               mov ax, word ptr [bp - 8]
2:8D82  8b56fa               mov dx, word ptr [bp - 6]
2:8D85  c9                   leave
2:8D86  ca0c00               retf 0xc
2:8D89  db 00

; ---------------- sub_s2:8D8A FAR size=234 callers=2
2:8D8A  c8080000             enter 8, 0
2:8D8E  c45e06               les bx, ptr [bp + 6]
2:8D91  268b472e             mov ax, word ptr es:[bx + 0x2e]
2:8D95  3d2700               cmp ax, 0x27
2:8D98  7f36                 jg 0x8dd0
2:8D9A  3d2500               cmp ax, 0x25
2:8D9D  7d17                 jge 0x8db6
2:8D9F  3d2300               cmp ax, 0x23
2:8DA2  7412                 je 0x8db6
2:8DA4  0f87c700             ja 0x8e6f
2:8DA8  2c0b                 sub al, 0xb
2:8DAA  740a                 je 0x8db6
2:8DAC  2c04                 sub al, 4
2:8DAE  7406                 je 0x8db6
2:8DB0  2c12                 sub al, 0x12
2:8DB2  0f85b900             jne 0x8e6f
loc_8DB6:
2:8DB6  c45e06               les bx, ptr [bp + 6]
2:8DB9  6626837f3a00         cmp dword ptr es:[bx + 0x3a], 0
2:8DBF  7441                 je 0x8e02
2:8DC1  6626ff773a           push dword ptr es:[bx + 0x3a]
2:8DC6  90                   nop
2:8DC7  0e                   push cs
2:8DC8  e86bc4               call 0x5236  ; sub_s2:5236
2:8DCB  c9                   leave
2:8DCC  ca0c00               retf 0xc
2:8DCF  db 90
loc_8DD0:
2:8DD0  3d4500               cmp ax, 0x45
2:8DD3  7f19                 jg 0x8dee
2:8DD5  3d4300               cmp ax, 0x43
2:8DD8  7ddc                 jge 0x8db6
2:8DDA  2d3300               sub ax, 0x33
2:8DDD  0f8c8e00             jl 0x8e6f
2:8DE1  48                   dec ax
2:8DE2  7ed2                 jle 0x8db6
2:8DE4  2d0300               sub ax, 3
2:8DE7  74cd                 je 0x8db6
2:8DE9  c9                   leave
2:8DEA  ca0c00               retf 0xc
2:8DED  db 90
loc_8DEE:
2:8DEE  2d4900               sub ax, 0x49
2:8DF1  74c3                 je 0x8db6
2:8DF3  2d2a00               sub ax, 0x2a
2:8DF6  7c77                 jl 0x8e6f
2:8DF8  2d0500               sub ax, 5
2:8DFB  7eb9                 jle 0x8db6
2:8DFD  c9                   leave
2:8DFE  ca0c00               retf 0xc
2:8E01  db 90
loc_8E02:
2:8E02  66ff760a             push dword ptr [bp + 0xa]
2:8E06  90                   nop
2:8E07  0e                   push cs
2:8E08  e867b9               call 0x4772  ; sub_s2:4772
2:8E0B  8946fc               mov word ptr [bp - 4], ax
2:8E0E  8956fe               mov word ptr [bp - 2], dx
2:8E11  6a14                 push 0x14
2:8E13  9a9c172b8d           lcall 0x8d2b, 0x179c  ; operator_new@s1:179C
2:8E18  83c402               add sp, 2
2:8E1B  8946f8               mov word ptr [bp - 8], ax
2:8E1E  8956fa               mov word ptr [bp - 6], dx
2:8E21  0bd0                 or dx, ax
2:8E23  7431                 je 0x8e56
2:8E25  66ff760e             push dword ptr [bp + 0xe]
2:8E29  668b4606             mov eax, dword ptr [bp + 6]
2:8E2D  052800               add ax, 0x28
2:8E30  6650                 push eax
2:8E32  c45efc               les bx, ptr [bp - 4]
2:8E35  6626ff7704           push dword ptr es:[bx + 4]
2:8E3A  6626ff7708           push dword ptr es:[bx + 8]
2:8E3F  66ff76f8             push dword ptr [bp - 8]
2:8E43  90                   nop
2:8E44  0e                   push cs
2:8E45  e87ac2               call 0x50c2  ; sub_s2:50C2
2:8E48  c45e06               les bx, ptr [bp + 6]
2:8E4B  2689473a             mov word ptr es:[bx + 0x3a], ax
2:8E4F  2689573c             mov word ptr es:[bx + 0x3c], dx
2:8E53  eb0d                 jmp 0x8e62
2:8E55  db 90
loc_8E56:
2:8E56  c45e06               les bx, ptr [bp + 6]
2:8E59  6626c7473a00000000   mov dword ptr es:[bx + 0x3a], 0
loc_8E62:
2:8E62  c45e06               les bx, ptr [bp + 6]
2:8E65  6626ff773a           push dword ptr es:[bx + 0x3a]
2:8E6A  90                   nop
2:8E6B  0e                   push cs
2:8E6C  e8c5c2               call 0x5134  ; sub_s2:5134
loc_8E6F:
2:8E6F  c9                   leave
2:8E70  ca0c00               retf 0xc
2:8E73  db 00

; ---------------- sub_s2:8E74 FAR size=42 callers=0
2:8E74  55                   push bp
2:8E75  8bec                 mov bp, sp
2:8E77  66ff7606             push dword ptr [bp + 6]
2:8E7B  90                   nop
2:8E7C  0e                   push cs
2:8E7D  e822fc               call 0x8aa2  ; sub_s2:8AA2
2:8E80  f6460a01             test byte ptr [bp + 0xa], 1
2:8E84  7409                 je 0x8e8f
2:8E86  66ff7606             push dword ptr [bp + 6]
2:8E8A  9ace17168e           lcall 0x8e16, 0x17ce  ; operator_delete@s1:17CE
loc_8E8F:
2:8E8F  8b4606               mov ax, word ptr [bp + 6]
2:8E92  8b5608               mov dx, word ptr [bp + 8]
2:8E95  c9                   leave
2:8E96  ca0600               retf 6
2:8E99  db 90 74 8e b2 8a

; ---------------- sub_s2:8E9E FAR size=134 callers=2
2:8E9E  c8040000             enter 4, 0
2:8EA2  c45e06               les bx, ptr [bp + 6]
2:8EA5  26c7079a38           mov word ptr es:[bx], 0x389a
2:8EAA  26c74702ee8e         mov word ptr es:[bx + 2], 0x8eee  ; SEGMENT s2:0000
2:8EB0  c45e06               les bx, ptr [bp + 6]
2:8EB3  662bc0               sub eax, eax
2:8EB6  26894704             mov word ptr es:[bx + 4], ax
2:8EBA  6626894706           mov dword ptr es:[bx + 6], eax
2:8EBF  662689470a           mov dword ptr es:[bx + 0xa], eax
2:8EC4  668b460e             mov eax, dword ptr [bp + 0xe]
2:8EC8  662689470e           mov dword ptr es:[bx + 0xe], eax
2:8ECD  6626c7471200000000   mov dword ptr es:[bx + 0x12], 0
2:8ED6  668b460a             mov eax, dword ptr [bp + 0xa]
2:8EDA  6626894716           mov dword ptr es:[bx + 0x16], eax
2:8EDF  26c7471a0100         mov word ptr es:[bx + 0x1a], 1
2:8EE5  26c7077091           mov word ptr es:[bx], 0x9170
2:8EEA  26c747029c8e         mov word ptr es:[bx + 2], 0x8e9c  ; SEGMENT s2:0000
2:8EF0  6626837f0e06         cmp dword ptr es:[bx + 0xe], 6
2:8EF6  7709                 ja 0x8f01
2:8EF8  6626c7470e06000000   mov dword ptr es:[bx + 0xe], 6
loc_8F01:
2:8F01  66ff7606             push dword ptr [bp + 6]
2:8F05  90                   nop
2:8F06  0e                   push cs
2:8F07  e89201               call 0x909c  ; sub_s2:909C
2:8F0A  c45e06               les bx, ptr [bp + 6]
2:8F0D  26c45f06             les bx, ptr es:[bx + 6]
2:8F11  6626c70700000000     mov dword ptr es:[bx], 0
2:8F19  8b4606               mov ax, word ptr [bp + 6]
2:8F1C  8b5608               mov dx, word ptr [bp + 8]
2:8F1F  c9                   leave
2:8F20  ca0c00               retf 0xc
2:8F23  db 00

; ---------------- sub_s2:8F24 FAR size=134 callers=1
2:8F24  c80c0000             enter 0xc, 0
2:8F28  56                   push si
2:8F29  c45e06               les bx, ptr [bp + 6]
2:8F2C  26c7077091           mov word ptr es:[bx], 0x9170
2:8F31  26c74702a28f         mov word ptr es:[bx + 2], 0x8fa2  ; SEGMENT s2:0000
2:8F37  26837f1a00           cmp word ptr es:[bx + 0x1a], 0
2:8F3C  7442                 je 0x8f80
2:8F3E  66c746fc00000000     mov dword ptr [bp - 4], 0
2:8F46  eb04                 jmp 0x8f4c
loc_8F48:
2:8F48  66ff46fc             inc dword ptr [bp - 4]
loc_8F4C:
2:8F4C  668b46fc             mov eax, dword ptr [bp - 4]
2:8F50  c45e06               les bx, ptr [bp + 6]
2:8F53  662639470a           cmp dword ptr es:[bx + 0xa], eax
2:8F58  7626                 jbe 0x8f80
2:8F5A  8bf0                 mov si, ax
2:8F5C  c1e602               shl si, 2
2:8F5F  26c45f06             les bx, ptr es:[bx + 6]
2:8F63  268b00               mov ax, word ptr es:[bx + si]
2:8F66  268b5002             mov dx, word ptr es:[bx + si + 2]
2:8F6A  8bda                 mov bx, dx
2:8F6C  0bd0                 or dx, ax
2:8F6E  74d8                 je 0x8f48
2:8F70  6a01                 push 1
2:8F72  53                   push bx
2:8F73  50                   push ax
2:8F74  8ec3                 mov es, bx
2:8F76  8bf0                 mov si, ax
2:8F78  26c41c               les bx, ptr es:[si]
2:8F7B  26ff1f               lcall es:[bx]
2:8F7E  ebc8                 jmp 0x8f48
loc_8F80:
2:8F80  c45e06               les bx, ptr [bp + 6]
2:8F83  66268b4706           mov eax, dword ptr es:[bx + 6]
2:8F88  668946fc             mov dword ptr [bp - 4], eax
2:8F8C  6650                 push eax
2:8F8E  9ace178d8e           lcall 0x8e8d, 0x17ce  ; operator_delete@s1:17CE
2:8F93  83c404               add sp, 4
2:8F96  c45e06               les bx, ptr [bp + 6]
2:8F99  26c7079a38           mov word ptr es:[bx], 0x389a
2:8F9E  26c74702ae8e         mov word ptr es:[bx + 2], 0x8eae  ; SEGMENT s2:0000
2:8FA4  5e                   pop si
2:8FA5  c9                   leave
2:8FA6  ca0400               retf 4
2:8FA9  db 00

; ---------------- sub_s2:8FAA FAR size=26 callers=3
2:8FAA  55                   push bp
2:8FAB  8bec                 mov bp, sp
2:8FAD  c45e06               les bx, ptr [bp + 6]
2:8FB0  6626ff770a           push dword ptr es:[bx + 0xa]
2:8FB5  66ff760a             push dword ptr [bp + 0xa]
2:8FB9  06                   push es
2:8FBA  53                   push bx
2:8FBB  90                   nop
2:8FBC  0e                   push cs
2:8FBD  e84400               call 0x9004  ; sub_s2:9004
2:8FC0  c9                   leave
2:8FC1  ca0800               retf 8

; ---------------- sub_s2:8FC4 FAR size=64 callers=8
2:8FC4  c8040000             enter 4, 0
2:8FC8  56                   push si
2:8FC9  66c746fc00000000     mov dword ptr [bp - 4], 0
2:8FD1  c45e06               les bx, ptr [bp + 6]
2:8FD4  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:8FDA  741c                 je 0x8ff8
2:8FDC  668b460a             mov eax, dword ptr [bp + 0xa]
2:8FE0  662639470a           cmp dword ptr es:[bx + 0xa], eax
2:8FE5  7611                 jbe 0x8ff8
2:8FE7  8bf0                 mov si, ax
2:8FE9  c1e602               shl si, 2
2:8FEC  26c45f06             les bx, ptr es:[bx + 6]
2:8FF0  66268b00             mov eax, dword ptr es:[bx + si]
2:8FF4  668946fc             mov dword ptr [bp - 4], eax
loc_8FF8:
2:8FF8  8b46fc               mov ax, word ptr [bp - 4]
2:8FFB  8b56fe               mov dx, word ptr [bp - 2]
2:8FFE  5e                   pop si
2:8FFF  c9                   leave
2:9000  ca0800               retf 8
2:9003  db 00

; ---------------- sub_s2:9004 FAR size=152 callers=1
2:9004  55                   push bp
2:9005  8bec                 mov bp, sp
2:9007  56                   push si
2:9008  668b460e             mov eax, dword ptr [bp + 0xe]
2:900C  8b5610               mov dx, word ptr [bp + 0x10]
2:900F  c45e06               les bx, ptr [bp + 6]
2:9012  662639470a           cmp dword ptr es:[bx + 0xa], eax
2:9017  7608                 jbe 0x9021
2:9019  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:901F  7558                 jne 0x9079
loc_9021:
2:9021  8b460e               mov ax, word ptr [bp + 0xe]
2:9024  26395714             cmp word ptr es:[bx + 0x14], dx
2:9028  770f                 ja 0x9039
2:902A  7206                 jb 0x9032
2:902C  26394712             cmp word ptr es:[bx + 0x12], ax
2:9030  7707                 ja 0x9039
loc_9032:
2:9032  06                   push es
2:9033  53                   push bx
2:9034  90                   nop
2:9035  0e                   push cs
2:9036  e86300               call 0x909c  ; sub_s2:909C
loc_9039:
2:9039  668b460e             mov eax, dword ptr [bp + 0xe]
2:903D  8b5610               mov dx, word ptr [bp + 0x10]
2:9040  c45e06               les bx, ptr [bp + 6]
2:9043  6626394712           cmp dword ptr es:[bx + 0x12], eax
2:9048  7608                 jbe 0x9052
2:904A  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:9050  7508                 jne 0x905a
loc_9052:
2:9052  33c0                 xor ax, ax
2:9054  5e                   pop si
2:9055  c9                   leave
2:9056  ca0c00               retf 0xc
2:9059  db 90
loc_905A:
2:905A  8b460e               mov ax, word ptr [bp + 0xe]
2:905D  2639570c             cmp word ptr es:[bx + 0xc], dx
2:9061  7716                 ja 0x9079
2:9063  7206                 jb 0x906b
2:9065  2639470a             cmp word ptr es:[bx + 0xa], ax
2:9069  770e                 ja 0x9079
loc_906B:
2:906B  050100               add ax, 1
2:906E  83d200               adc dx, 0
2:9071  2689470a             mov word ptr es:[bx + 0xa], ax
2:9075  2689570c             mov word ptr es:[bx + 0xc], dx
loc_9079:
2:9079  8b460a               mov ax, word ptr [bp + 0xa]
2:907C  8b560c               mov dx, word ptr [bp + 0xc]
2:907F  c45e06               les bx, ptr [bp + 6]
2:9082  26c45f06             les bx, ptr es:[bx + 6]
2:9086  8b760e               mov si, word ptr [bp + 0xe]
2:9089  c1e602               shl si, 2
2:908C  268900               mov word ptr es:[bx + si], ax
2:908F  26895002             mov word ptr es:[bx + si + 2], dx
2:9093  b80100               mov ax, 1
2:9096  5e                   pop si
2:9097  c9                   leave
2:9098  ca0c00               retf 0xc
2:909B  db 00

; ---------------- sub_s2:909C FAR size=174 callers=2
2:909C  c8160000             enter 0x16, 0
2:90A0  c45e06               les bx, ptr [bp + 6]
2:90A3  6626837f1200         cmp dword ptr es:[bx + 0x12], 0
2:90A9  7413                 je 0x90be
2:90AB  268b4712             mov ax, word ptr es:[bx + 0x12]
2:90AF  268b5714             mov dx, word ptr es:[bx + 0x14]
2:90B3  26034716             add ax, word ptr es:[bx + 0x16]
2:90B7  26135718             adc dx, word ptr es:[bx + 0x18]
2:90BB  eb09                 jmp 0x90c6
2:90BD  db 90
loc_90BE:
2:90BE  268b470e             mov ax, word ptr es:[bx + 0xe]
2:90C2  268b5710             mov dx, word ptr es:[bx + 0x10]
loc_90C6:
2:90C6  8946fc               mov word ptr [bp - 4], ax
2:90C9  8956fe               mov word ptr [bp - 2], dx
2:90CC  66c746f800000000     mov dword ptr [bp - 8], 0
2:90D4  6626837f0600         cmp dword ptr es:[bx + 6], 0
2:90DA  741c                 je 0x90f8
2:90DC  6626ff7706           push dword ptr es:[bx + 6]
2:90E1  8b46fc               mov ax, word ptr [bp - 4]
2:90E4  03c0                 add ax, ax
2:90E6  13d2                 adc dx, dx
2:90E8  03c0                 add ax, ax
2:90EA  13d2                 adc dx, dx
2:90EC  52                   push dx
2:90ED  50                   push ax
2:90EE  6a01                 push 1
2:90F0  9ad40e0d91           lcall 0x910d, 0xed4  ; sub_s1:0ED4
2:90F5  eb2d                 jmp 0x9124
2:90F7  db 90
loc_90F8:
2:90F8  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
2:90FE  740a                 je 0x910a
2:9100  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
2:9103  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
2:9107  eb06                 jmp 0x910f
2:9109  db 90
loc_910A:
2:910A  9a0a161f91           lcall 0x911f, 0x160a  ; SH_DefaultPool@s1:160A
loc_910F:
2:910F  52                   push dx
2:9110  50                   push ax
2:9111  6a01                 push 1
2:9113  8b46fc               mov ax, word ptr [bp - 4]
2:9116  c1e002               shl ax, 2
2:9119  6a00                 push 0
2:911B  50                   push ax
2:911C  9a0817918f           lcall 0x8f91, 0x1708  ; SH_MemAllocPtr@s1:1708
2:9121  83c40a               add sp, 0xa
loc_9124:
2:9124  8946f8               mov word ptr [bp - 8], ax
2:9127  8956fa               mov word ptr [bp - 6], dx
2:912A  8bc2                 mov ax, dx
2:912C  0b46f8               or ax, word ptr [bp - 8]
2:912F  7415                 je 0x9146
2:9131  668b46fc             mov eax, dword ptr [bp - 4]
2:9135  c45e06               les bx, ptr [bp + 6]
2:9138  6626894712           mov dword ptr es:[bx + 0x12], eax
2:913D  668b46f8             mov eax, dword ptr [bp - 8]
2:9141  6626894706           mov dword ptr es:[bx + 6], eax
loc_9146:
2:9146  c9                   leave
2:9147  ca0400               retf 4

; ---------------- sub_s2:914A FAR size=42 callers=0
2:914A  55                   push bp
2:914B  8bec                 mov bp, sp
2:914D  66ff7606             push dword ptr [bp + 6]
2:9151  90                   nop
2:9152  0e                   push cs
2:9153  e8cefd               call 0x8f24  ; sub_s2:8F24
2:9156  f6460a01             test byte ptr [bp + 0xa], 1
2:915A  7409                 je 0x9165
2:915C  66ff7606             push dword ptr [bp + 6]
2:9160  9ace17f390           lcall 0x90f3, 0x17ce  ; operator_delete@s1:17CE
loc_9165:
2:9165  8b4606               mov ax, word ptr [bp + 6]
2:9168  8b5608               mov dx, word ptr [bp + 8]
2:916B  c9                   leave
2:916C  ca0600               retf 6
2:916F  db 90 4a 91 35 8f

; ---------------- sub_s2:9174 FAR size=70 callers=1
2:9174  c8040000             enter 4, 0
2:9178  c45e06               les bx, ptr [bp + 6]
2:917B  26c7079a38           mov word ptr es:[bx], 0x389a
2:9180  26c74702af91         mov word ptr es:[bx + 2], 0x91af  ; SEGMENT s2:0000
2:9186  668b460e             mov eax, dword ptr [bp + 0xe]
2:918A  c45e06               les bx, ptr [bp + 6]
2:918D  6626894704           mov dword ptr es:[bx + 4], eax
2:9192  668b460a             mov eax, dword ptr [bp + 0xa]
2:9196  6626894708           mov dword ptr es:[bx + 8], eax
2:919B  662689470c           mov dword ptr es:[bx + 0xc], eax
2:91A0  26c747100000         mov word ptr es:[bx + 0x10], 0
2:91A6  26c7071294           mov word ptr es:[bx], 0x9412
2:91AB  26c747027291         mov word ptr es:[bx + 2], 0x9172  ; SEGMENT s2:0000
2:91B1  8bc3                 mov ax, bx
2:91B3  8cc2                 mov dx, es
2:91B5  c9                   leave
2:91B6  ca0c00               retf 0xc
2:91B9  db 00

; ---------------- sub_s2:91BA FAR size=98 callers=1
;   apis: USER.SetTimer
2:91BA  c8040000             enter 4, 0
2:91BE  c45e06               les bx, ptr [bp + 6]
2:91C1  26c7079a38           mov word ptr es:[bx], 0x389a
2:91C6  26c74702eb91         mov word ptr es:[bx + 2], 0x91eb  ; SEGMENT s2:0000
2:91CC  c45e06               les bx, ptr [bp + 6]
2:91CF  26c747040000         mov word ptr es:[bx + 4], 0
2:91D5  8d4706               lea ax, [bx + 6]
2:91D8  06                   push es
2:91D9  50                   push ax
2:91DA  90                   nop
2:91DB  0e                   push cs
2:91DC  e86bc5               call 0x574a  ; sub_s2:574A
2:91DF  c45e06               les bx, ptr [bp + 6]
2:91E2  26c7071694           mov word ptr es:[bx], 0x9416
2:91E7  26c747028491         mov word ptr es:[bx + 2], 0x9184  ; SEGMENT s2:0000
2:91ED  891e8803             mov word ptr [0x388], bx
2:91F1  8c068a03             mov word ptr [0x38a], es
2:91F5  ff369603             push word ptr [0x396]
2:91F9  666801000100         push 0x10001
2:91FF  666a00               push 0
2:9202  9afe850000           lcall 0, 0x85fe  ; USER.SetTimer
2:9207  0bc0                 or ax, ax
2:9209  7507                 jne 0x9212
2:920B  6a01                 push 1
2:920D  9acd246391           lcall 0x9163, 0x24cd  ; sub_s1:24CD
loc_9212:
2:9212  8b4606               mov ax, word ptr [bp + 6]
2:9215  8b5608               mov dx, word ptr [bp + 8]
2:9218  c9                   leave
2:9219  ca0400               retf 4

; ---------------- sub_s2:921C FAR size=70 callers=1
;   apis: USER.KillTimer
2:921C  c8040000             enter 4, 0
2:9220  c45e06               les bx, ptr [bp + 6]
2:9223  26c7071694           mov word ptr es:[bx], 0x9416
2:9228  26c747025c92         mov word ptr es:[bx + 2], 0x925c  ; SEGMENT s2:0000
2:922E  ff369603             push word ptr [0x396]
2:9232  6a01                 push 1
2:9234  9a48850000           lcall 0, 0x8548  ; USER.KillTimer
2:9239  66c706880300000000   mov dword ptr [0x388], 0
2:9242  668b4606             mov eax, dword ptr [bp + 6]
2:9246  050600               add ax, 6
2:9249  6650                 push eax
2:924B  90                   nop
2:924C  0e                   push cs
2:924D  e874c5               call 0x57c4  ; ListIter::~ListIter@s2:57C4
2:9250  c45e06               les bx, ptr [bp + 6]
2:9253  26c7079a38           mov word ptr es:[bx], 0x389a
2:9258  26c74702ca91         mov word ptr es:[bx + 2], 0x91ca  ; SEGMENT s2:0000
2:925E  c9                   leave
2:925F  ca0400               retf 4

; ---------------- sub_s2:9262 FAR size=80 callers=4
2:9262  c8080000             enter 8, 0
2:9266  6a12                 push 0x12  ; 'version %d %d'
2:9268  9a9c171092           lcall 0x9210, 0x179c  ; operator_new@s1:179C
2:926D  83c402               add sp, 2
2:9270  8956fa               mov word ptr [bp - 6], dx
2:9273  0bd0                 or dx, ax
2:9275  7413                 je 0x928a
2:9277  66ff760e             push dword ptr [bp + 0xe]
2:927B  66ff760a             push dword ptr [bp + 0xa]
2:927F  ff76fa               push word ptr [bp - 6]
2:9282  50                   push ax
2:9283  90                   nop
2:9284  0e                   push cs
2:9285  e8ecfe               call 0x9174  ; sub_s2:9174
2:9288  eb03                 jmp 0x928d
loc_928A:
2:928A  33c0                 xor ax, ax
2:928C  99                   cdq
loc_928D:
2:928D  8956fe               mov word ptr [bp - 2], dx
2:9290  0bd0                 or dx, ax
2:9292  741a                 je 0x92ae
2:9294  ff76fe               push word ptr [bp - 2]
2:9297  50                   push ax
2:9298  8b4606               mov ax, word ptr [bp + 6]
2:929B  8b5608               mov dx, word ptr [bp + 8]
2:929E  050600               add ax, 6
2:92A1  52                   push dx
2:92A2  50                   push ax
2:92A3  8ec2                 mov es, dx
2:92A5  8bd8                 mov bx, ax
2:92A7  26c41f               les bx, ptr es:[bx]
2:92AA  26ff5f04             lcall es:[bx + 4]
loc_92AE:
2:92AE  c9                   leave
2:92AF  ca0c00               retf 0xc

; ---------------- sub_s2:92B2 FAR size=120 callers=4
2:92B2  c8120000             enter 0x12, 0
2:92B6  c746fe0000           mov word ptr [bp - 2], 0
2:92BB  668b4606             mov eax, dword ptr [bp + 6]
2:92BF  050600               add ax, 6
2:92C2  6650                 push eax
2:92C4  8d46f6               lea ax, [bp - 0xa]
2:92C7  16                   push ss
2:92C8  50                   push ax
2:92C9  90                   nop
2:92CA  0e                   push cs
2:92CB  e8d6c4               call 0x57a4  ; sub_s2:57A4
loc_92CE:
2:92CE  8d46f6               lea ax, [bp - 0xa]
2:92D1  16                   push ss
2:92D2  50                   push ax
2:92D3  90                   nop
2:92D4  0e                   push cs
2:92D5  e83ac8               call 0x5b12  ; ListIter::next@s2:5B12
2:92D8  8946f2               mov word ptr [bp - 0xe], ax
2:92DB  8956f4               mov word ptr [bp - 0xc], dx
2:92DE  0bd0                 or dx, ax
2:92E0  7440                 je 0x9322
2:92E2  668b460e             mov eax, dword ptr [bp + 0xe]
2:92E6  c45ef2               les bx, ptr [bp - 0xe]
2:92E9  6626394704           cmp dword ptr es:[bx + 4], eax
2:92EE  75de                 jne 0x92ce
2:92F0  668b460a             mov eax, dword ptr [bp + 0xa]
2:92F4  6626394708           cmp dword ptr es:[bx + 8], eax
2:92F9  75d3                 jne 0x92ce
2:92FB  c746fe0100           mov word ptr [bp - 2], 1
2:9300  06                   push es
2:9301  53                   push bx
2:9302  8b4606               mov ax, word ptr [bp + 6]
2:9305  8b5608               mov dx, word ptr [bp + 8]
2:9308  050600               add ax, 6
2:930B  52                   push dx
2:930C  50                   push ax
2:930D  8ec2                 mov es, dx
2:930F  8bd8                 mov bx, ax
2:9311  26c41f               les bx, ptr es:[bx]
2:9314  26ff5f0c             lcall es:[bx + 0xc]
2:9318  66c746fa00000000     mov dword ptr [bp - 6], 0
2:9320  ebac                 jmp 0x92ce
loc_9322:
2:9322  8b46fe               mov ax, word ptr [bp - 2]
2:9325  c9                   leave
2:9326  ca0c00               retf 0xc
2:9329  db 00

; ---------------- sub_s2:932A FAR size=150 callers=1
2:932A  c80c0000             enter 0xc, 0
2:932E  c45e06               les bx, ptr [bp + 6]
2:9331  26837f0400           cmp word ptr es:[bx + 4], 0
2:9336  0f858100             jne 0x93bb
2:933A  26c747040100         mov word ptr es:[bx + 4], 1
2:9340  8d4706               lea ax, [bx + 6]
2:9343  06                   push es
2:9344  50                   push ax
2:9345  8d46f8               lea ax, [bp - 8]
2:9348  16                   push ss
2:9349  50                   push ax
2:934A  90                   nop
2:934B  0e                   push cs
2:934C  e855c4               call 0x57a4  ; sub_s2:57A4
loc_934F:
2:934F  8d46f8               lea ax, [bp - 8]
2:9352  16                   push ss
2:9353  50                   push ax
2:9354  90                   nop
2:9355  0e                   push cs
2:9356  e8b9c7               call 0x5b12  ; ListIter::next@s2:5B12
2:9359  8946f4               mov word ptr [bp - 0xc], ax
2:935C  8956f6               mov word ptr [bp - 0xa], dx
2:935F  0bd0                 or dx, ax
2:9361  744f                 je 0x93b2
2:9363  c45ef4               les bx, ptr [bp - 0xc]
2:9366  268b470c             mov ax, word ptr es:[bx + 0xc]
2:936A  268b570e             mov dx, word ptr es:[bx + 0xe]
2:936E  2d3700               sub ax, 0x37
2:9371  83da00               sbb dx, 0
2:9374  2689470c             mov word ptr es:[bx + 0xc], ax
2:9378  2689570e             mov word ptr es:[bx + 0xe], dx
2:937C  83fa00               cmp dx, 0
2:937F  7fce                 jg 0x934f
2:9381  7c07                 jl 0x938a
2:9383  26837f0c00           cmp word ptr es:[bx + 0xc], 0
2:9388  75c5                 jne 0x934f
loc_938A:
2:938A  26837f1000           cmp word ptr es:[bx + 0x10], 0
2:938F  75be                 jne 0x934f
2:9391  6a02                 push 2
2:9393  6626ff7704           push dword ptr es:[bx + 4]
2:9398  26c45f04             les bx, ptr es:[bx + 4]
2:939C  26c41f               les bx, ptr es:[bx]
2:939F  26ff5f04             lcall es:[bx + 4]
2:93A3  c45ef4               les bx, ptr [bp - 0xc]
2:93A6  66268b4708           mov eax, dword ptr es:[bx + 8]
2:93AB  662689470c           mov dword ptr es:[bx + 0xc], eax
2:93B0  eb9d                 jmp 0x934f
loc_93B2:
2:93B2  c45e06               les bx, ptr [bp + 6]
2:93B5  26c747040000         mov word ptr es:[bx + 4], 0
loc_93BB:
2:93BB  c9                   leave
2:93BC  ca0400               retf 4
2:93BF  db 00

; ---------------- sub_s2:93C0 FAR size=44 callers=0
2:93C0  c8080000             enter 8, 0
2:93C4  c45e06               les bx, ptr [bp + 6]
2:93C7  26c7079a38           mov word ptr es:[bx], 0x389a
2:93CC  26c747022c92         mov word ptr es:[bx + 2], 0x922c  ; SEGMENT s2:0000
2:93D2  f6460a01             test byte ptr [bp + 0xa], 1
2:93D6  7409                 je 0x93e1
2:93D8  66ff7606             push dword ptr [bp + 6]
2:93DC  9ace176b92           lcall 0x926b, 0x17ce  ; operator_delete@s1:17CE
loc_93E1:
2:93E1  8b4606               mov ax, word ptr [bp + 6]
2:93E4  8b5608               mov dx, word ptr [bp + 8]
2:93E7  c9                   leave
2:93E8  ca0600               retf 6
2:93EB  db 00

; ---------------- sub_s2:93EC FAR size=46 callers=0
2:93EC  55                   push bp
2:93ED  8bec                 mov bp, sp
2:93EF  66ff7606             push dword ptr [bp + 6]
2:93F3  90                   nop
2:93F4  0e                   push cs
2:93F5  e824fe               call 0x921c  ; sub_s2:921C
2:93F8  f6460a01             test byte ptr [bp + 0xa], 1
2:93FC  7409                 je 0x9407
2:93FE  66ff7606             push dword ptr [bp + 6]
2:9402  9ace17df93           lcall 0x93df, 0x17ce  ; operator_delete@s1:17CE
loc_9407:
2:9407  8b4606               mov ax, word ptr [bp + 6]
2:940A  8b5608               mov dx, word ptr [bp + 8]
2:940D  c9                   leave
2:940E  ca0600               retf 6
2:9411  db 90 c0 93 d0 93 ec 93 14 94

; ---------------- sub_s2:941A FAR size=28 callers=27
2:941A  55                   push bp
2:941B  8bec                 mov bp, sp
2:941D  8b460a               mov ax, word ptr [bp + 0xa]
2:9420  c45e06               les bx, ptr [bp + 6]
2:9423  268907               mov word ptr es:[bx], ax
2:9426  8b460c               mov ax, word ptr [bp + 0xc]
2:9429  26894702             mov word ptr es:[bx + 2], ax
2:942D  8bc3                 mov ax, bx
2:942F  8cc2                 mov dx, es
2:9431  c9                   leave
2:9432  ca0800               retf 8
2:9435  db 00

; ---------------- sub_s2:9436 FAR size=24 callers=1
2:9436  55                   push bp
2:9437  8bec                 mov bp, sp
2:9439  33c0                 xor ax, ax
2:943B  c45e06               les bx, ptr [bp + 6]
2:943E  268907               mov word ptr es:[bx], ax
2:9441  26894702             mov word ptr es:[bx + 2], ax
2:9445  8bc3                 mov ax, bx
2:9447  8cc2                 mov dx, es
2:9449  c9                   leave
2:944A  ca0400               retf 4
2:944D  db 00

; ---------------- sub_s2:944E FAR size=24 callers=1
2:944E  55                   push bp
2:944F  8bec                 mov bp, sp
2:9451  8b460c               mov ax, word ptr [bp + 0xc]
2:9454  c45e06               les bx, ptr [bp + 6]
2:9457  26894702             mov word ptr es:[bx + 2], ax
2:945B  8b460a               mov ax, word ptr [bp + 0xa]
2:945E  268907               mov word ptr es:[bx], ax
2:9461  c9                   leave
2:9462  ca0800               retf 8
2:9465  db 90

; ---------------- sub_s2:9466 FAR size=42 callers=2
2:9466  c8080000             enter 8, 0
2:946A  c45e06               les bx, ptr [bp + 6]
2:946D  26c7072a05           mov word ptr es:[bx], 0x52a
2:9472  26c747021894         mov word ptr es:[bx + 2], 0x9418  ; SEGMENT s2:0000
2:9478  66a19203             mov eax, dword ptr [0x392]
2:947C  6650                 push eax
2:947E  9ace170594           lcall 0x9405, 0x17ce  ; operator_delete@s1:17CE
2:9483  66c706920300000000   mov dword ptr [0x392], 0
2:948C  c9                   leave
2:948D  ca0400               retf 4

; ---------------- sub_s2:9490 FAR size=4 callers=0
2:9490  ca0400               retf 4
2:9493  db 00

; ---------------- sub_s2:9494 FAR size=4 callers=0
2:9494  ca0800               retf 8
2:9497  db 00

; ---------------- MessageLoop@s2:9498 FAR size=120 callers=1
;   apis: USER.DispatchMessage, USER.GetMessage, USER.IsDialogMessage, USER.TranslateAccelerator, USER.TranslateMessage
2:9498  c81c0000             enter 0x1c, 0
loc_949C:
2:949C  8d46ec               lea ax, [bp - 0x14]
2:949F  16                   push ss
2:94A0  50                   push ax
2:94A1  33c0                 xor ax, ax
2:94A3  8946ea               mov word ptr [bp - 0x16], ax
2:94A6  50                   push ax
2:94A7  50                   push ax
2:94A8  50                   push ax
2:94A9  9affff0000           lcall 0, 0xffff  ; USER.GetMessage
2:94AE  0bc0                 or ax, ax
2:94B0  750c                 jne 0x94be
2:94B2  8b46f0               mov ax, word ptr [bp - 0x10]
2:94B5  8946fe               mov word ptr [bp - 2], ax
2:94B8  8b46fe               mov ax, word ptr [bp - 2]
2:94BB  c9                   leave
2:94BC  cb                   retf
2:94BD  db 90
loc_94BE:
2:94BE  c41ec85b             les bx, ptr [0x5bc8]
2:94C2  268b4708             mov ax, word ptr es:[bx + 8]
2:94C6  8946ea               mov word ptr [bp - 0x16], ax
2:94C9  0bc0                 or ax, ax
2:94CB  740f                 je 0x94dc
2:94CD  50                   push ax
2:94CE  8d46ec               lea ax, [bp - 0x14]
2:94D1  16                   push ss
2:94D2  50                   push ax
2:94D3  9affff0000           lcall 0, 0xffff  ; USER.IsDialogMessage
2:94D8  0bc0                 or ax, ax
2:94DA  75c0                 jne 0x949c
loc_94DC:
2:94DC  833e980300           cmp word ptr [0x398], 0
2:94E1  7416                 je 0x94f9
2:94E3  ff369603             push word ptr [0x396]
2:94E7  ff369803             push word ptr [0x398]
2:94EB  8d46ec               lea ax, [bp - 0x14]
2:94EE  16                   push ss
2:94EF  50                   push ax
2:94F0  9affff0000           lcall 0, 0xffff  ; USER.TranslateAccelerator
2:94F5  0bc0                 or ax, ax
2:94F7  75a3                 jne 0x949c
loc_94F9:
2:94F9  8d46ec               lea ax, [bp - 0x14]
2:94FC  16                   push ss
2:94FD  50                   push ax
2:94FE  9affff0000           lcall 0, 0xffff  ; USER.TranslateMessage
2:9503  8d46ec               lea ax, [bp - 0x14]
2:9506  16                   push ss
2:9507  50                   push ax
2:9508  9affff0000           lcall 0, 0xffff  ; USER.DispatchMessage
2:950D  eb8d                 jmp 0x949c
2:950F  db 00

; ---------------- MessageLoop@s2:9510 FAR size=116 callers=7
;   apis: USER.DispatchMessage, USER.GetMessage, USER.IsDialogMessage, USER.TranslateAccelerator, USER.TranslateMessage
2:9510  c81a0000             enter 0x1a, 0
2:9514  eb62                 jmp 0x9578
loc_9516:
2:9516  8d46ee               lea ax, [bp - 0x12]
2:9519  16                   push ss
2:951A  50                   push ax
2:951B  666a00               push 0
2:951E  6a00                 push 0
2:9520  9aaa940000           lcall 0, 0x94aa  ; USER.GetMessage
2:9525  0bc0                 or ax, ax
2:9527  7458                 je 0x9581
2:9529  c41ec85b             les bx, ptr [0x5bc8]
2:952D  268b4708             mov ax, word ptr es:[bx + 8]
2:9531  8946ec               mov word ptr [bp - 0x14], ax
2:9534  0bc0                 or ax, ax
2:9536  740f                 je 0x9547
2:9538  50                   push ax
2:9539  8d46ee               lea ax, [bp - 0x12]
2:953C  16                   push ss
2:953D  50                   push ax
2:953E  9ad4940000           lcall 0, 0x94d4  ; USER.IsDialogMessage
2:9543  0bc0                 or ax, ax
2:9545  7531                 jne 0x9578
loc_9547:
2:9547  833e980300           cmp word ptr [0x398], 0
2:954C  7416                 je 0x9564
2:954E  ff369603             push word ptr [0x396]
2:9552  ff369803             push word ptr [0x398]
2:9556  8d46ee               lea ax, [bp - 0x12]
2:9559  16                   push ss
2:955A  50                   push ax
2:955B  9af1940000           lcall 0, 0x94f1  ; USER.TranslateAccelerator
2:9560  0bc0                 or ax, ax
2:9562  7514                 jne 0x9578
loc_9564:
2:9564  8d46ee               lea ax, [bp - 0x12]
2:9567  16                   push ss
2:9568  50                   push ax
2:9569  9aff940000           lcall 0, 0x94ff  ; USER.TranslateMessage
2:956E  8d46ee               lea ax, [bp - 0x12]
2:9571  16                   push ss
2:9572  50                   push ax
2:9573  9a09950000           lcall 0, 0x9509  ; USER.DispatchMessage
loc_9578:
2:9578  c45e06               les bx, ptr [bp + 6]
2:957B  26833f00             cmp word ptr es:[bx], 0
2:957F  7595                 jne 0x9516
loc_9581:
2:9581  c9                   leave
2:9582  cb                   retf
2:9583  db 00

; ---------------- sub_s2:9584 FAR size=188 callers=1
2:9584  c8100000             enter 0x10, 0
2:9588  c45e06               les bx, ptr [bp + 6]
2:958B  26c7079a38           mov word ptr es:[bx], 0x389a
2:9590  26c74702ab95         mov word ptr es:[bx + 2], 0x95ab  ; SEGMENT s2:0000
2:9596  668b460a             mov eax, dword ptr [bp + 0xa]
2:959A  c45e06               les bx, ptr [bp + 6]
2:959D  6626894704           mov dword ptr es:[bx + 4], eax
2:95A2  26c7072e9d           mov word ptr es:[bx], 0x9d2e
2:95A7  26c747021596         mov word ptr es:[bx + 2], 0x9615  ; SEGMENT s2:0000
2:95AD  c45e06               les bx, ptr [bp + 6]
2:95B0  26c747080000         mov word ptr es:[bx + 8], 0
2:95B6  6626c787ac0000000002 mov dword ptr es:[bx + 0xac], 0x2000000
2:95C0  6626c787b00000000000 mov dword ptr es:[bx + 0xb0], 0
2:95CA  b80080               mov ax, 0x8000
2:95CD  268987b400           mov word ptr es:[bx + 0xb4], ax
2:95D2  268987b600           mov word ptr es:[bx + 0xb6], ax
2:95D7  268987b800           mov word ptr es:[bx + 0xb8], ax
2:95DC  268987ba00           mov word ptr es:[bx + 0xba], ax
2:95E1  26c787bc000000       mov word ptr es:[bx + 0xbc], 0
2:95E8  662bc0               sub eax, eax
2:95EB  66268987be00         mov dword ptr es:[bx + 0xbe], eax
2:95F1  268987c200           mov word ptr es:[bx + 0xc2], ax
2:95F6  268987c400           mov word ptr es:[bx + 0xc4], ax
2:95FB  268987c600           mov word ptr es:[bx + 0xc6], ax
2:9600  26c787c8000820       mov word ptr es:[bx + 0xc8], 0x2008
2:9607  268987ca00           mov word ptr es:[bx + 0xca], ax
2:960C  26c7070a38           mov word ptr es:[bx], 0x380a
2:9611  26c747027694         mov word ptr es:[bx + 2], 0x9476  ; SEGMENT s2:0000
2:9617  2688475b             mov byte ptr es:[bx + 0x5b], al
2:961B  2688470a             mov byte ptr es:[bx + 0xa], al
2:961F  8bc3                 mov ax, bx
2:9621  8cc2                 mov dx, es
2:9623  c9                   leave
2:9624  ca0800               retf 8
2:9627  db 00 55 8b ec c4 5e 06 26 83 7f 08 00 75 07 8b 46
2:9637  db 0a 26 89 47 08 c9 ca 06 00

; ---------------- sub_s2:9640 FAR size=36 callers=0
;   apis: USER.SendMessage
2:9640  55                   push bp
2:9641  8bec                 mov bp, sp
2:9643  c45e06               les bx, ptr [bp + 6]
2:9646  26837f0800           cmp word ptr es:[bx + 8], 0
2:964B  7412                 je 0x965f
2:964D  26ff7708             push word ptr es:[bx + 8]
2:9651  688600               push 0x86
2:9654  ff760a               push word ptr [bp + 0xa]
2:9657  666a00               push 0
2:965A  9a7d860000           lcall 0, 0x867d  ; USER.SendMessage
loc_965F:
2:965F  c9                   leave
2:9660  ca0600               retf 6
2:9663  db 00

; ---------------- sub_s2:9664 FAR size=52 callers=0
;   apis: USER.SetWindowText
2:9664  55                   push bp
2:9665  8bec                 mov bp, sp
2:9667  57                   push di
2:9668  56                   push si
2:9669  66ff760c             push dword ptr [bp + 0xc]
2:966D  8b4606               mov ax, word ptr [bp + 6]
2:9670  8b5608               mov dx, word ptr [bp + 8]
2:9673  050a00               add ax, 0xa
2:9676  52                   push dx
2:9677  50                   push ax
2:9678  8bf0                 mov si, ax
2:967A  8bfa                 mov di, dx
2:967C  9a3e3d8194           lcall 0x9481, 0x3d3e  ; _fstrcpy@s1:3D3E
2:9681  83c408               add sp, 8
2:9684  c45e06               les bx, ptr [bp + 6]
2:9687  26ff7708             push word ptr es:[bx + 8]
2:968B  57                   push di
2:968C  56                   push si
2:968D  9affff0000           lcall 0, 0xffff  ; USER.SetWindowText
2:9692  5e                   pop si
2:9693  5f                   pop di
2:9694  c9                   leave
2:9695  ca0a00               retf 0xa

; ---------------- sub_s2:9698 FAR size=22 callers=0
;   apis: USER.DestroyWindow
2:9698  55                   push bp
2:9699  8bec                 mov bp, sp
2:969B  c45e06               les bx, ptr [bp + 6]
2:969E  26ff7708             push word ptr es:[bx + 8]
2:96A2  9aaf620000           lcall 0, 0x62af  ; USER.DestroyWindow
2:96A7  33c0                 xor ax, ax
2:96A9  99                   cdq
2:96AA  c9                   leave
2:96AB  ca0400               retf 4

; ---------------- sub_s2:96AE FAR size=36 callers=1
;   apis: USER.ShowWindow
2:96AE  55                   push bp
2:96AF  8bec                 mov bp, sp
2:96B1  c45e06               les bx, ptr [bp + 6]
2:96B4  26837f0800           cmp word ptr es:[bx + 8], 0
2:96B9  7411                 je 0x96cc
2:96BB  26ff7708             push word ptr es:[bx + 8]
2:96BF  ff760a               push word ptr [bp + 0xa]
2:96C2  9affff0000           lcall 0, 0xffff  ; USER.ShowWindow
2:96C7  c9                   leave
2:96C8  ca0600               retf 6
2:96CB  db 90
loc_96CC:
2:96CC  33c0                 xor ax, ax
2:96CE  c9                   leave
2:96CF  ca0600               retf 6

; ---------------- RegisterWindowClass@s2:96D2 FAR size=142 callers=5
;   apis: USER.GetClassInfo, USER.RegisterClass
2:96D2  c81a0000             enter 0x1a, 0
2:96D6  57                   push di
2:96D7  56                   push si
2:96D8  ff368c03             push word ptr [0x38c]
2:96DC  8b4606               mov ax, word ptr [bp + 6]
2:96DF  8b5608               mov dx, word ptr [bp + 8]
2:96E2  055b00               add ax, 0x5b
2:96E5  52                   push dx
2:96E6  50                   push ax
2:96E7  8d4ee6               lea cx, [bp - 0x1a]
2:96EA  16                   push ss
2:96EB  51                   push cx
2:96EC  8bf0                 mov si, ax
2:96EE  8bfa                 mov di, dx
2:96F0  9aab810000           lcall 0, 0x81ab  ; USER.GetClassInfo
2:96F5  0bc0                 or ax, ax
2:96F7  7560                 jne 0x9759
2:96F9  c45e06               les bx, ptr [bp + 6]
2:96FC  268b87c800           mov ax, word ptr es:[bx + 0xc8]
2:9701  8946e6               mov word ptr [bp - 0x1a], ax
2:9704  c746e83256           mov word ptr [bp - 0x18], 0x5632
2:9709  c746ea9495           mov word ptr [bp - 0x16], 0x9594  ; SEGMENT s2:0000
2:970E  66c746ec00000400     mov dword ptr [bp - 0x14], 0x40000
2:9716  a18c03               mov ax, word ptr [0x38c]
2:9719  8946f0               mov word ptr [bp - 0x10], ax
2:971C  268b87c200           mov ax, word ptr es:[bx + 0xc2]
2:9721  8946f2               mov word ptr [bp - 0xe], ax
2:9724  268b87c400           mov ax, word ptr es:[bx + 0xc4]
2:9729  8946f4               mov word ptr [bp - 0xc], ax
2:972C  268b87c600           mov ax, word ptr es:[bx + 0xc6]
2:9731  8946f6               mov word ptr [bp - 0xa], ax
2:9734  66c746f800000000     mov dword ptr [bp - 8], 0
2:973C  8976fc               mov word ptr [bp - 4], si
2:973F  897efe               mov word ptr [bp - 2], di
2:9742  8d46e6               lea ax, [bp - 0x1a]
2:9745  16                   push ss
2:9746  50                   push ax
2:9747  9afc810000           lcall 0, 0x81fc  ; USER.RegisterClass
2:974C  0bc0                 or ax, ax
2:974E  7509                 jne 0x9759
2:9750  50                   push ax
2:9751  9acd247f96           lcall 0x967f, 0x24cd  ; sub_s1:24CD
2:9756  83c402               add sp, 2
loc_9759:
2:9759  5e                   pop si
2:975A  5f                   pop di
2:975B  c9                   leave
2:975C  ca0400               retf 4
2:975F  db 00

; ---------------- sub_s2:9760 FAR size=104 callers=16
;   apis: USER.CreateWindowEx
2:9760  55                   push bp
2:9761  8bec                 mov bp, sp
2:9763  c45e06               les bx, ptr [bp + 6]
2:9766  26837f0800           cmp word ptr es:[bx + 8], 0
2:976B  7545                 jne 0x97b2
2:976D  6626ffb7b000         push dword ptr es:[bx + 0xb0]
2:9773  8d475b               lea ax, [bx + 0x5b]
2:9776  06                   push es
2:9777  50                   push ax
2:9778  1e                   push ds
2:9779  689e03               push 0x39e
2:977C  6626ffb7ac00         push dword ptr es:[bx + 0xac]
2:9782  26ffb7b400           push word ptr es:[bx + 0xb4]
2:9787  26ffb7b600           push word ptr es:[bx + 0xb6]
2:978C  26ffb7b800           push word ptr es:[bx + 0xb8]
2:9791  26ffb7ba00           push word ptr es:[bx + 0xba]
2:9796  26ffb7bc00           push word ptr es:[bx + 0xbc]
2:979B  26ffb7ca00           push word ptr es:[bx + 0xca]
2:97A0  ff368c03             push word ptr [0x38c]
2:97A4  06                   push es
2:97A5  53                   push bx
2:97A6  9affff0000           lcall 0, 0xffff  ; USER.CreateWindowEx
2:97AB  c45e06               les bx, ptr [bp + 6]
2:97AE  26894708             mov word ptr es:[bx + 8], ax
loc_97B2:
2:97B2  c45e06               les bx, ptr [bp + 6]
2:97B5  26837f0800           cmp word ptr es:[bx + 8], 0
2:97BA  7507                 jne 0x97c3
2:97BC  6a00                 push 0
2:97BE  9acd245497           lcall 0x9754, 0x24cd  ; sub_s1:24CD
loc_97C3:
2:97C3  c9                   leave
2:97C4  ca0400               retf 4
2:97C7  db 00

; ---------------- sub_s2:97C8 FAR size=42 callers=0
;   apis: USER.BeginPaint, USER.EndPaint
2:97C8  c8200000             enter 0x20, 0
2:97CC  c45e06               les bx, ptr [bp + 6]
2:97CF  26ff7708             push word ptr es:[bx + 8]
2:97D3  8d46e0               lea ax, [bp - 0x20]
2:97D6  16                   push ss
2:97D7  50                   push ax
2:97D8  9a96820000           lcall 0, 0x8296  ; USER.BeginPaint
2:97DD  c45e06               les bx, ptr [bp + 6]
2:97E0  26ff7708             push word ptr es:[bx + 8]
2:97E4  8d46e0               lea ax, [bp - 0x20]
2:97E7  16                   push ss
2:97E8  50                   push ax
2:97E9  9ab3840000           lcall 0, 0x84b3  ; USER.EndPaint
2:97EE  c9                   leave
2:97EF  ca0400               retf 4

; ---------------- sub_s2:97F2 FAR size=1060 callers=0
;   apis: USER.IsWindow, USER.PostMessage, USER.SetWindowLong
2:97F2  c80c0000             enter 0xc, 0
2:97F6  8b4610               mov ax, word ptr [bp + 0x10]
2:97F9  e92203               jmp 0x9b1e
loc_97FC:
2:97FC  c45e06               les bx, ptr [bp + 6]
2:97FF  06                   push es
2:9800  53                   push bx
2:9801  26c41f               les bx, ptr es:[bx]
2:9804  26ff5f2c             lcall es:[bx + 0x2c]
2:9808  e9e902               jmp 0x9af4
2:980B  db 90
loc_980C:
2:980C  ff760e               push word ptr [bp + 0xe]
2:980F  c45e06               les bx, ptr [bp + 6]
2:9812  06                   push es
2:9813  53                   push bx
2:9814  26c41f               les bx, ptr es:[bx]
2:9817  26ff5f30             lcall es:[bx + 0x30]
2:981B  e9d602               jmp 0x9af4
loc_981E:
2:981E  66ff760c             push dword ptr [bp + 0xc]
2:9822  ff760a               push word ptr [bp + 0xa]
2:9825  c45e06               les bx, ptr [bp + 6]
2:9828  06                   push es
2:9829  53                   push bx
2:982A  26c41f               les bx, ptr es:[bx]
2:982D  26ff5f7c             lcall es:[bx + 0x7c]
2:9831  e9de03               jmp 0x9c12
loc_9834:
2:9834  66ff760c             push dword ptr [bp + 0xc]
2:9838  ff760a               push word ptr [bp + 0xa]
2:983B  c45e06               les bx, ptr [bp + 6]
2:983E  06                   push es
2:983F  53                   push bx
2:9840  26c41f               les bx, ptr es:[bx]
2:9843  26ff9f8000           lcall es:[bx + 0x80]
2:9848  e9c703               jmp 0x9c12
2:984B  db 90
loc_984C:
2:984C  66ff760c             push dword ptr [bp + 0xc]
2:9850  ff760a               push word ptr [bp + 0xa]
2:9853  c45e06               les bx, ptr [bp + 6]
2:9856  06                   push es
2:9857  53                   push bx
2:9858  26c41f               les bx, ptr es:[bx]
2:985B  26ff5f24             lcall es:[bx + 0x24]
2:985F  e99202               jmp 0x9af4
loc_9862:
2:9862  c45e06               les bx, ptr [bp + 6]
2:9865  06                   push es
2:9866  53                   push bx
2:9867  26c41f               les bx, ptr es:[bx]
2:986A  26ff5f38             lcall es:[bx + 0x38]
2:986E  e9a103               jmp 0x9c12
2:9871  db 90
loc_9872:
2:9872  c45e06               les bx, ptr [bp + 6]
2:9875  2bd2                 sub dx, dx
2:9877  268b87c200           mov ax, word ptr es:[bx + 0xc2]
2:987C  c9                   leave
2:987D  ca0c00               retf 0xc
loc_9880:
2:9880  833e9a0300           cmp word ptr [0x39a], 0
2:9885  0f856b02             jne 0x9af4
2:9889  ff760e               push word ptr [bp + 0xe]
2:988C  c45e06               les bx, ptr [bp + 6]
2:988F  06                   push es
2:9890  53                   push bx
2:9891  26c41f               les bx, ptr es:[bx]
2:9894  26ff5f48             lcall es:[bx + 0x48]
2:9898  0bc0                 or ax, ax
2:989A  0f845602             je 0x9af4
2:989E  66ff760e             push dword ptr [bp + 0xe]
2:98A2  66ff760a             push dword ptr [bp + 0xa]
2:98A6  66ff7606             push dword ptr [bp + 6]
2:98AA  90                   nop
2:98AB  0e                   push cs
2:98AC  e83704               call 0x9ce6  ; sub_s2:9CE6
2:98AF  e94202               jmp 0x9af4
loc_98B2:
2:98B2  66833e880300         cmp dword ptr [0x388], 0
2:98B8  0f843802             je 0x9af4
2:98BC  66ff368803           push dword ptr [0x388]
2:98C1  90                   nop
2:98C2  0e                   push cs
2:98C3  e864fa               call 0x932a  ; sub_s2:932A
2:98C6  e92b02               jmp 0x9af4
2:98C9  db 90
loc_98CA:
2:98CA  8b460c               mov ax, word ptr [bp + 0xc]
2:98CD  0bc0                 or ax, ax
2:98CF  7517                 jne 0x98e8
2:98D1  ff760e               push word ptr [bp + 0xe]
2:98D4  ff760a               push word ptr [bp + 0xa]
2:98D7  50                   push ax
2:98D8  c45e06               les bx, ptr [bp + 6]
2:98DB  06                   push es
2:98DC  53                   push bx
2:98DD  26c41f               les bx, ptr es:[bx]
2:98E0  26ff5f4c             lcall es:[bx + 0x4c]
2:98E4  e90d02               jmp 0x9af4
2:98E7  db 90
loc_98E8:
2:98E8  ff760e               push word ptr [bp + 0xe]
2:98EB  c45e06               les bx, ptr [bp + 6]
2:98EE  06                   push es
2:98EF  53                   push bx
2:98F0  26c41f               les bx, ptr es:[bx]
2:98F3  26ff5f20             lcall es:[bx + 0x20]
2:98F7  e9fa01               jmp 0x9af4
loc_98FA:
2:98FA  833e9a0300           cmp word ptr [0x39a], 0
2:98FF  0f85f101             jne 0x9af4
2:9903  8a460e               mov al, byte ptr [bp + 0xe]
2:9906  50                   push ax
2:9907  c45e06               les bx, ptr [bp + 6]
2:990A  06                   push es
2:990B  53                   push bx
2:990C  26c41f               les bx, ptr es:[bx]
2:990F  26ff5f6c             lcall es:[bx + 0x6c]
2:9913  e9de01               jmp 0x9af4
loc_9916:
2:9916  833e9a0300           cmp word ptr [0x39a], 0
2:991B  0f85d501             jne 0x9af4
2:991F  8a460e               mov al, byte ptr [bp + 0xe]
2:9922  50                   push ax
2:9923  c45e06               les bx, ptr [bp + 6]
2:9926  06                   push es
2:9927  53                   push bx
2:9928  26c41f               les bx, ptr es:[bx]
2:992B  26ff5f68             lcall es:[bx + 0x68]
2:992F  e9c201               jmp 0x9af4
loc_9932:
2:9932  ff760e               push word ptr [bp + 0xe]
2:9935  ff760a               push word ptr [bp + 0xa]
2:9938  ff760c               push word ptr [bp + 0xc]
2:993B  c45e06               les bx, ptr [bp + 6]
2:993E  06                   push es
2:993F  53                   push bx
2:9940  26c41f               les bx, ptr es:[bx]
2:9943  26ff5f64             lcall es:[bx + 0x64]
2:9947  e9aa01               jmp 0x9af4
loc_994A:
2:994A  ff760e               push word ptr [bp + 0xe]
2:994D  ff760a               push word ptr [bp + 0xa]
2:9950  ff760c               push word ptr [bp + 0xc]
2:9953  c45e06               les bx, ptr [bp + 6]
2:9956  06                   push es
2:9957  53                   push bx
2:9958  26c41f               les bx, ptr es:[bx]
2:995B  26ff5f58             lcall es:[bx + 0x58]
2:995F  e99201               jmp 0x9af4
loc_9962:
2:9962  ff760a               push word ptr [bp + 0xa]
2:9965  ff760c               push word ptr [bp + 0xc]
2:9968  c45e06               les bx, ptr [bp + 6]
2:996B  06                   push es
2:996C  53                   push bx
2:996D  26c41f               les bx, ptr es:[bx]
2:9970  26ff5f54             lcall es:[bx + 0x54]
2:9974  e97d01               jmp 0x9af4
2:9977  db 90
loc_9978:
2:9978  833e9a0300           cmp word ptr [0x39a], 0
2:997D  0f857301             jne 0x9af4
2:9981  ff760e               push word ptr [bp + 0xe]
2:9984  ff760a               push word ptr [bp + 0xa]
2:9987  ff760c               push word ptr [bp + 0xc]
2:998A  c45e06               les bx, ptr [bp + 6]
2:998D  06                   push es
2:998E  53                   push bx
2:998F  26c41f               les bx, ptr es:[bx]
2:9992  26ff5f5c             lcall es:[bx + 0x5c]
2:9996  e95b01               jmp 0x9af4
2:9999  db 90
loc_999A:
2:999A  833e9a0300           cmp word ptr [0x39a], 0
2:999F  0f855101             jne 0x9af4
2:99A3  ff760e               push word ptr [bp + 0xe]
2:99A6  ff760a               push word ptr [bp + 0xa]
2:99A9  ff760c               push word ptr [bp + 0xc]
2:99AC  c45e06               les bx, ptr [bp + 6]
2:99AF  06                   push es
2:99B0  53                   push bx
2:99B1  26c41f               les bx, ptr es:[bx]
2:99B4  26ff5f60             lcall es:[bx + 0x60]
2:99B8  e93901               jmp 0x9af4
2:99BB  db 90
loc_99BC:
2:99BC  ff760e               push word ptr [bp + 0xe]
2:99BF  c45e06               les bx, ptr [bp + 6]
2:99C2  06                   push es
2:99C3  53                   push bx
2:99C4  26c41f               les bx, ptr es:[bx]
2:99C7  26ff5f50             lcall es:[bx + 0x50]
2:99CB  e92601               jmp 0x9af4
loc_99CE:
2:99CE  ff760e               push word ptr [bp + 0xe]
2:99D1  c45e06               les bx, ptr [bp + 6]
2:99D4  06                   push es
2:99D5  53                   push bx
2:99D6  26c41f               les bx, ptr es:[bx]
2:99D9  26ff5f74             lcall es:[bx + 0x74]
2:99DD  e91401               jmp 0x9af4
loc_99E0:
2:99E0  c45e06               les bx, ptr [bp + 6]
2:99E3  06                   push es
2:99E4  53                   push bx
2:99E5  26c41f               les bx, ptr es:[bx]
2:99E8  26ff5f3c             lcall es:[bx + 0x3c]
2:99EC  c45e06               les bx, ptr [bp + 6]
2:99EF  268b4708             mov ax, word ptr es:[bx + 8]
2:99F3  50                   push ax
2:99F4  666a00               push 0
2:99F7  6a00                 push 0
2:99F9  9a4c820000           lcall 0, 0x824c  ; USER.SetWindowLong
2:99FE  c45e06               les bx, ptr [bp + 6]
2:9A01  26ffb7bc00           push word ptr es:[bx + 0xbc]
2:9A06  9affff0000           lcall 0, 0xffff  ; USER.IsWindow
2:9A0B  0bc0                 or ax, ax
2:9A0D  0f84e300             je 0x9af4
2:9A11  c45e06               les bx, ptr [bp + 6]
2:9A14  26ffb7bc00           push word ptr es:[bx + 0xbc]
2:9A19  6668c7001101         push 0x11100c7
2:9A1F  06                   push es
2:9A20  53                   push bx
2:9A21  9a373d0000           lcall 0, 0x3d37  ; USER.PostMessage
2:9A26  e9cb00               jmp 0x9af4
2:9A29  db 90
loc_9A2A:
2:9A2A  a19c03               mov ax, word ptr [0x39c]
2:9A2D  39460e               cmp word ptr [bp + 0xe], ax
2:9A30  0f84c000             je 0x9af4
2:9A34  833e9a0300           cmp word ptr [0x39a], 0
2:9A39  0f85b700             jne 0x9af4
2:9A3D  837e0a00             cmp word ptr [bp + 0xa], 0
2:9A41  7417                 je 0x9a5a
2:9A43  66ff760c             push dword ptr [bp + 0xc]
2:9A47  ff760a               push word ptr [bp + 0xa]
2:9A4A  c45e06               les bx, ptr [bp + 6]
2:9A4D  06                   push es
2:9A4E  53                   push bx
2:9A4F  26c41f               les bx, ptr es:[bx]
2:9A52  26ff5f44             lcall es:[bx + 0x44]
2:9A56  e99b00               jmp 0x9af4
2:9A59  db 90
loc_9A5A:
2:9A5A  ff760e               push word ptr [bp + 0xe]
2:9A5D  c45e06               les bx, ptr [bp + 6]
2:9A60  06                   push es
2:9A61  53                   push bx
2:9A62  26c41f               les bx, ptr es:[bx]
2:9A65  26ff5f40             lcall es:[bx + 0x40]
2:9A69  e98800               jmp 0x9af4
loc_9A6C:
2:9A6C  c45e06               les bx, ptr [bp + 6]
2:9A6F  06                   push es
2:9A70  53                   push bx
2:9A71  26c41f               les bx, ptr es:[bx]
2:9A74  26ff5f34             lcall es:[bx + 0x34]
2:9A78  eb7a                 jmp 0x9af4
loc_9A7A:
2:9A7A  8b4e0c               mov cx, word ptr [bp + 0xc]
2:9A7D  8b5e0a               mov bx, word ptr [bp + 0xa]
2:9A80  8ec1                 mov es, cx
2:9A82  26833f04             cmp word ptr es:[bx], 4
2:9A86  7514                 jne 0x9a9c
2:9A88  51                   push cx
2:9A89  53                   push bx
2:9A8A  9a6695023d           lcall 0x3d02, 0x9566  ; sub_s9:9566
2:9A8F  83c404               add sp, 4
loc_9A92:
2:9A92  b80100               mov ax, 1
loc_9A95:
2:9A95  33d2                 xor dx, dx
2:9A97  c9                   leave
2:9A98  ca0c00               retf 0xc
2:9A9B  db 90
loc_9A9C:
2:9A9C  51                   push cx
2:9A9D  53                   push bx
2:9A9E  c45e06               les bx, ptr [bp + 6]
2:9AA1  06                   push es
2:9AA2  53                   push bx
2:9AA3  26c41f               les bx, ptr es:[bx]
2:9AA6  26ff5f70             lcall es:[bx + 0x70]
2:9AAA  ebe6                 jmp 0x9a92
loc_9AAC:
2:9AAC  66ff760c             push dword ptr [bp + 0xc]
2:9AB0  ff760a               push word ptr [bp + 0xa]
2:9AB3  c45e06               les bx, ptr [bp + 6]
2:9AB6  06                   push es
2:9AB7  53                   push bx
2:9AB8  26c41f               les bx, ptr es:[bx]
2:9ABB  26ff5f78             lcall es:[bx + 0x78]
2:9ABF  8cda                 mov dx, ds
2:9AC1  c9                   leave
2:9AC2  ca0c00               retf 0xc
2:9AC5  db 90
loc_9AC6:
2:9AC6  66ff760c             push dword ptr [bp + 0xc]
2:9ACA  ff760a               push word ptr [bp + 0xa]
2:9ACD  c45e06               les bx, ptr [bp + 6]
2:9AD0  06                   push es
2:9AD1  53                   push bx
2:9AD2  26c41f               les bx, ptr es:[bx]
2:9AD5  26ff9f8400           lcall es:[bx + 0x84]
loc_9ADA:
2:9ADA  99                   cdq
2:9ADB  c9                   leave
2:9ADC  ca0c00               retf 0xc
2:9ADF  db 90
loc_9AE0:
2:9AE0  ff760e               push word ptr [bp + 0xe]
2:9AE3  c45e06               les bx, ptr [bp + 6]
2:9AE6  06                   push es
2:9AE7  53                   push bx
2:9AE8  26c41f               les bx, ptr es:[bx]
2:9AEB  26ff9f8800           lcall es:[bx + 0x88]
2:9AF0  0bc0                 or ax, ax
2:9AF2  7504                 jne 0x9af8
loc_9AF4:
2:9AF4  33c0                 xor ax, ax
2:9AF6  eb9d                 jmp 0x9a95
loc_9AF8:
2:9AF8  c45e06               les bx, ptr [bp + 6]
2:9AFB  06                   push es
2:9AFC  53                   push bx
2:9AFD  26c41f               les bx, ptr es:[bx]
2:9B00  26ff9f8c00           lcall es:[bx + 0x8c]
2:9B05  ebd3                 jmp 0x9ada
2:9B07  db 90
loc_9B08:
2:9B08  66ff760e             push dword ptr [bp + 0xe]
2:9B0C  66ff760a             push dword ptr [bp + 0xa]
2:9B10  66ff7606             push dword ptr [bp + 6]
2:9B14  90                   nop
2:9B15  0e                   push cs
2:9B16  e8cd01               call 0x9ce6  ; sub_s2:9CE6
2:9B19  c9                   leave
2:9B1A  ca0c00               retf 0xc
2:9B1D  db 90
loc_9B1E:
2:9B1E  3d2b00               cmp ax, 0x2b
2:9B21  0f8455ff             je 0x9a7a
2:9B25  7747                 ja 0x9b6e
2:9B27  48                   dec ax
2:9B28  3d1b00               cmp ax, 0x1b
2:9B2B  7768                 ja 0x9b95
2:9B2D  03c0                 add ax, ax
2:9B2F  93                   xchg bx, ax
2:9B30  2effa7369b           jmp word ptr cs:[bx - 0x64ca]
2:9B35  db 90
switch_table_9B36:
    dw loc_9AF4
    dw loc_99E0
    dw loc_9962
    dw loc_9B95
    dw loc_994A
    dw loc_9B95
    dw loc_99BC
    dw loc_99CE
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9AC6
    dw loc_9B95
    dw loc_9A6C
    dw loc_9862
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9B95
    dw loc_9AAC
    dw loc_9B95
    dw loc_9B95
    dw loc_980C
loc_9B6E:
2:9B6E  3d1201               cmp ax, 0x112
2:9B71  0f840bfd             je 0x9880
2:9B75  775d                 ja 0x9bd4
2:9B77  3d8600               cmp ax, 0x86
2:9B7A  0f84b6fc             je 0x9834
2:9B7E  773e                 ja 0x9bbe
2:9B80  3d8500               cmp ax, 0x85
2:9B83  0f8497fc             je 0x981e
2:9B87  770c                 ja 0x9b95
2:9B89  2c37                 sub al, 0x37
2:9B8B  0f84e3fc             je 0x9872
2:9B8F  2c0a                 sub al, 0xa
2:9B91  0f8467fc             je 0x97fc
loc_9B95:
2:9B95  817e100004           cmp word ptr [bp + 0x10], 0x400
2:9B9A  0f826aff             jb 0x9b08
2:9B9E  817e10ff7f           cmp word ptr [bp + 0x10], 0x7fff
2:9BA3  0f8361ff             jae 0x9b08
2:9BA7  66ff760e             push dword ptr [bp + 0xe]
2:9BAB  66ff760a             push dword ptr [bp + 0xa]
2:9BAF  c45e06               les bx, ptr [bp + 6]
2:9BB2  06                   push es
2:9BB3  53                   push bx
2:9BB4  26c41f               les bx, ptr es:[bx]
2:9BB7  26ff5f28             lcall es:[bx + 0x28]
2:9BBB  e936ff               jmp 0x9af4
loc_9BBE:
2:9BBE  2d0001               sub ax, 0x100
2:9BC1  0f8435fd             je 0x98fa
2:9BC5  48                   dec ax
2:9BC6  48                   dec ax
2:9BC7  0f844bfd             je 0x9916
2:9BCB  2d0f00               sub ax, 0xf
2:9BCE  0f8458fe             je 0x9a2a
2:9BD2  ebc1                 jmp 0x9b95
loc_9BD4:
2:9BD4  3d0402               cmp ax, 0x204
2:9BD7  0f84bffd             je 0x999a
2:9BDB  7717                 ja 0x9bf4
2:9BDD  2d1301               sub ax, 0x113
2:9BE0  0f84cefc             je 0x98b2
2:9BE4  2d0400               sub ax, 4
2:9BE7  0f84dffc             je 0x98ca
2:9BEB  2dea00               sub ax, 0xea
2:9BEE  0f8486fd             je 0x9978
2:9BF2  eba1                 jmp 0x9b95
loc_9BF4:
2:9BF4  2d1002               sub ax, 0x210
2:9BF7  0f8437fd             je 0x9932
2:9BFB  2dff00               sub ax, 0xff
2:9BFE  0f84f6fe             je 0x9af8
2:9C02  48                   dec ax
2:9C03  48                   dec ax
2:9C04  0f84d8fe             je 0x9ae0
2:9C08  2da800               sub ax, 0xa8
2:9C0B  0f843dfc             je 0x984c
2:9C0F  eb84                 jmp 0x9b95
2:9C11  db 90
loc_9C12:
2:9C12  c9                   leave
2:9C13  ca0c00               retf 0xc

; ---------------- sub_s2:9C16 FAR size=26 callers=0
2:9C16  55                   push bp
2:9C17  8bec                 mov bp, sp
2:9C19  688500               push 0x85
2:9C1C  66ff760c             push dword ptr [bp + 0xc]
2:9C20  66ff7608             push dword ptr [bp + 8]
2:9C24  ff7606               push word ptr [bp + 6]
2:9C27  90                   nop
2:9C28  0e                   push cs
2:9C29  e8ba00               call 0x9ce6  ; sub_s2:9CE6
2:9C2C  c9                   leave
2:9C2D  ca0a00               retf 0xa

; ---------------- sub_s2:9C30 FAR size=26 callers=0
2:9C30  55                   push bp
2:9C31  8bec                 mov bp, sp
2:9C33  688600               push 0x86
2:9C36  66ff760c             push dword ptr [bp + 0xc]
2:9C3A  66ff7608             push dword ptr [bp + 8]
2:9C3E  ff7606               push word ptr [bp + 6]
2:9C41  90                   nop
2:9C42  0e                   push cs
2:9C43  e8a000               call 0x9ce6  ; sub_s2:9CE6
2:9C46  c9                   leave
2:9C47  ca0a00               retf 0xa

; ---------------- sub_s2:9C4A FAR size=4 callers=0
2:9C4A  ca0a00               retf 0xa
2:9C4D  db 00

; ---------------- sub_s2:9C4E FAR size=4 callers=0
2:9C4E  ca0600               retf 6
2:9C51  db 00

; ---------------- sub_s2:9C52 FAR size=4 callers=0
2:9C52  ca0600               retf 6
2:9C55  db 00

; ---------------- sub_s2:9C56 FAR size=10 callers=0
;   apis: GDI.GetStockObject
2:9C56  6a05                 push 5
2:9C58  9a02830000           lcall 0, 0x8302  ; GDI.GetStockObject
2:9C5D  ca0a00               retf 0xa

; ---------------- sub_s2:9C60 FAR size=38 callers=0
2:9C60  c8080000             enter 8, 0
2:9C64  817e0ec700           cmp word ptr [bp + 0xe], 0xc7
2:9C69  7516                 jne 0x9c81
2:9C6B  668b460a             mov eax, dword ptr [bp + 0xa]
2:9C6F  660bc0               or eax, eax
2:9C72  740d                 je 0x9c81
2:9C74  6a01                 push 1
2:9C76  c45e0a               les bx, ptr [bp + 0xa]
2:9C79  06                   push es
2:9C7A  50                   push ax
2:9C7B  26c41f               les bx, ptr es:[bx]
2:9C7E  26ff1f               lcall es:[bx]
loc_9C81:
2:9C81  c9                   leave
2:9C82  ca0a00               retf 0xa
2:9C85  db 00

; ---------------- sub_s2:9C86 FAR size=62 callers=0
2:9C86  c8020000             enter 2, 0
2:9C8A  668b4606             mov eax, dword ptr [bp + 6]
2:9C8E  050a00               add ax, 0xa
2:9C91  6650                 push eax
2:9C93  9aa43dbb9c           lcall 0x9cbb, 0x3da4  ; sub_s1:3DA4
2:9C98  83c404               add sp, 4
2:9C9B  8946fe               mov word ptr [bp - 2], ax
2:9C9E  3b460e               cmp ax, word ptr [bp + 0xe]
2:9CA1  7e07                 jle 0x9caa
2:9CA3  8b460e               mov ax, word ptr [bp + 0xe]
2:9CA6  48                   dec ax
2:9CA7  8946fe               mov word ptr [bp - 2], ax
loc_9CAA:
2:9CAA  50                   push ax
2:9CAB  668b4606             mov eax, dword ptr [bp + 6]
2:9CAF  050a00               add ax, 0xa
2:9CB2  6650                 push eax
2:9CB4  66ff760a             push dword ptr [bp + 0xa]
2:9CB8  9abe3dc197           lcall 0x97c1, 0x3dbe  ; sub_s1:3DBE
2:9CBD  8b46fe               mov ax, word ptr [bp - 2]
2:9CC0  c9                   leave
2:9CC1  ca0a00               retf 0xa

; ---------------- sub_s2:9CC4 FAR size=28 callers=1
2:9CC4  55                   push bp
2:9CC5  8bec                 mov bp, sp
2:9CC7  8b460a               mov ax, word ptr [bp + 0xa]
2:9CCA  c45e06               les bx, ptr [bp + 6]
2:9CCD  26394708             cmp word ptr es:[bx + 8], ax
2:9CD1  7407                 je 0x9cda
2:9CD3  b80100               mov ax, 1
2:9CD6  c9                   leave
2:9CD7  ca0600               retf 6
loc_9CDA:
2:9CDA  33c0                 xor ax, ax
2:9CDC  c9                   leave
2:9CDD  ca0600               retf 6

; ---------------- sub_s2:9CE0 FAR size=6 callers=1
2:9CE0  33c0                 xor ax, ax
2:9CE2  ca0400               retf 4
2:9CE5  db 00

; ---------------- sub_s2:9CE6 FAR size=28 callers=3
;   apis: USER.DefWindowProc
2:9CE6  55                   push bp
2:9CE7  8bec                 mov bp, sp
2:9CE9  c45e06               les bx, ptr [bp + 6]
2:9CEC  26ff7708             push word ptr es:[bx + 8]
2:9CF0  66ff760e             push dword ptr [bp + 0xe]
2:9CF4  66ff760a             push dword ptr [bp + 0xa]
2:9CF8  9a7d870000           lcall 0, 0x877d  ; USER.DefWindowProc
2:9CFD  c9                   leave
2:9CFE  ca0c00               retf 0xc
2:9D01  db 00

; ---------------- sub_s2:9D02 FAR size=52 callers=0
2:9D02  c8080000             enter 8, 0
2:9D06  c45e06               les bx, ptr [bp + 6]
2:9D09  26c7079a38           mov word ptr es:[bx], 0x389a
2:9D0E  26c747020c97         mov word ptr es:[bx + 2], 0x970c  ; SEGMENT s2:0000
2:9D14  f6460a01             test byte ptr [bp + 0xa], 1
2:9D18  7409                 je 0x9d23
2:9D1A  66ff7606             push dword ptr [bp + 6]
2:9D1E  9ace17969c           lcall 0x9c96, 0x17ce  ; operator_delete@s1:17CE
loc_9D23:
2:9D23  8b4606               mov ax, word ptr [bp + 6]
2:9D26  8b5608               mov dx, word ptr [bp + 8]
2:9D29  c9                   leave
2:9D2A  ca0600               retf 6
2:9D2D  db 00 02 9d 34 9d 14 37 12 9d

; ---------------- sub_s2:9D36 FAR size=292 callers=1
2:9D36  c8120000             enter 0x12, 0
2:9D3A  56                   push si
2:9D3B  66ff7608             push dword ptr [bp + 8]
2:9D3F  ff7606               push word ptr [bp + 6]
2:9D42  9ada4cb79d           lcall 0x9db7, 0x4cda  ; sub_s4:4CDA
2:9D47  c45e06               les bx, ptr [bp + 6]
2:9D4A  26c7471c9a38         mov word ptr es:[bx + 0x1c], 0x389a
2:9D50  26c7471e639d         mov word ptr es:[bx + 0x1e], 0x9d63  ; SEGMENT s2:0000
2:9D56  c45e06               les bx, ptr [bp + 6]
2:9D59  26c7471ca83a         mov word ptr es:[bx + 0x1c], 0x3aa8
2:9D5F  26c7471e849d         mov word ptr es:[bx + 0x1e], 0x9d84  ; SEGMENT s2:0000
2:9D65  c45e06               les bx, ptr [bp + 6]
2:9D68  26c747200000         mov word ptr es:[bx + 0x20], 0
2:9D6E  8d4752               lea ax, [bx + 0x52]
2:9D71  06                   push es
2:9D72  50                   push ax
2:9D73  90                   nop
2:9D74  0e                   push cs
2:9D75  e8c0a0               call 0x3e38  ; sub_s2:3E38
2:9D78  c45e06               les bx, ptr [bp + 6]
2:9D7B  26c707b29f           mov word ptr es:[bx], 0x9fb2
2:9D80  26c74702909d         mov word ptr es:[bx + 2], 0x9d90  ; SEGMENT s2:0000
2:9D86  26c7471cca9f         mov word ptr es:[bx + 0x1c], 0x9fca
2:9D8C  26c7471e309d         mov word ptr es:[bx + 0x1e], 0x9d30  ; SEGMENT s2:0000
2:9D92  891e3042             mov word ptr [0x4230], bx
2:9D96  8c063242             mov word ptr [0x4232], es
2:9D9A  666800003000         push 0x300000
2:9DA0  8d4722               lea ax, [bx + 0x22]
2:9DA3  06                   push es
2:9DA4  50                   push ax
2:9DA5  9a0649219d           lcall 0x9d21, 0x4906  ; sub_s1:4906
2:9DAA  83c408               add sp, 8
2:9DAD  68c001               push 0x1c0
2:9DB0  66ff7606             push dword ptr [bp + 6]
2:9DB4  9ace4df38b           lcall 0x8bf3, 0x4dce  ; sub_s4:4DCE
2:9DB9  c746fe0000           mov word ptr [bp - 2], 0
loc_9DBE:
2:9DBE  8b46fe               mov ax, word ptr [bp - 2]
2:9DC1  05c001               add ax, 0x1c0
2:9DC4  50                   push ax
2:9DC5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:9DCA  9a0a837d88           lcall 0x887d, 0x830a  ; sub_s3:830A
2:9DCF  8b76fe               mov si, word ptr [bp - 2]
2:9DD2  c1e602               shl si, 2
2:9DD5  c45e06               les bx, ptr [bp + 6]
2:9DD8  26894022             mov word ptr es:[bx + si + 0x22], ax
2:9DDC  26895024             mov word ptr es:[bx + si + 0x24], dx
2:9DE0  ff46fe               inc word ptr [bp - 2]
2:9DE3  837efe0c             cmp word ptr [bp - 2], 0xc
2:9DE7  7cd5                 jl 0x9dbe
2:9DE9  c45e06               les bx, ptr [bp + 6]
2:9DEC  6626ff7722           push dword ptr es:[bx + 0x22]
2:9DF1  90                   nop
2:9DF2  0e                   push cs
2:9DF3  e87ca9               call 0x4772  ; sub_s2:4772
2:9DF6  8ec2                 mov es, dx
2:9DF8  8bd8                 mov bx, ax
2:9DFA  b88002               mov ax, 0x280
2:9DFD  262b4704             sub ax, word ptr es:[bx + 4]
2:9E01  99                   cdq
2:9E02  2bc2                 sub ax, dx
2:9E04  d1f8                 sar ax, 1
2:9E06  8bc8                 mov cx, ax
2:9E08  b8e001               mov ax, 0x1e0
2:9E0B  262b4708             sub ax, word ptr es:[bx + 8]
2:9E0F  99                   cdq
2:9E10  2bc2                 sub ax, dx
2:9E12  d1f8                 sar ax, 1
2:9E14  2d3200               sub ax, 0x32
2:9E17  51                   push cx
2:9E18  50                   push ax
2:9E19  6a00                 push 0
2:9E1B  668b4606             mov eax, dword ptr [bp + 6]
2:9E1F  055200               add ax, 0x52
2:9E22  6650                 push eax
2:9E24  90                   nop
2:9E25  0e                   push cs
2:9E26  e84da0               call 0x3e76  ; sub_s2:3E76
2:9E29  66837e0600           cmp dword ptr [bp + 6], 0
2:9E2E  740c                 je 0x9e3c
2:9E30  8b4606               mov ax, word ptr [bp + 6]
2:9E33  8b5608               mov dx, word ptr [bp + 8]
2:9E36  051c00               add ax, 0x1c
2:9E39  eb04                 jmp 0x9e3f
2:9E3B  db 90
loc_9E3C:
2:9E3C  33c0                 xor ax, ax
2:9E3E  99                   cdq
loc_9E3F:
2:9E3F  52                   push dx
2:9E40  50                   push ax
2:9E41  666a50               push 0x50
2:9E44  66ff368803           push dword ptr [0x388]
2:9E49  90                   nop
2:9E4A  0e                   push cs
2:9E4B  e814f4               call 0x9262  ; sub_s2:9262
2:9E4E  8b4606               mov ax, word ptr [bp + 6]
2:9E51  8b5608               mov dx, word ptr [bp + 8]
2:9E54  5e                   pop si
2:9E55  c9                   leave
2:9E56  ca0600               retf 6
2:9E59  db 00

; ---------------- sub_s2:9E5A FAR size=190 callers=1
2:9E5A  c8160000             enter 0x16, 0
2:9E5E  56                   push si
2:9E5F  c45e06               les bx, ptr [bp + 6]
2:9E62  26c707b29f           mov word ptr es:[bx], 0x9fb2
2:9E67  26c74702779e         mov word ptr es:[bx + 2], 0x9e77  ; SEGMENT s2:0000
2:9E6D  26c7471cca9f         mov word ptr es:[bx + 0x1c], 0x9fca
2:9E73  26c7471e079f         mov word ptr es:[bx + 0x1e], 0x9f07  ; SEGMENT s2:0000
2:9E79  66833e880300         cmp dword ptr [0x388], 0
2:9E7F  7429                 je 0x9eaa
2:9E81  8cc0                 mov ax, es
2:9E83  0bc3                 or ax, bx
2:9E85  740b                 je 0x9e92
2:9E87  8b4606               mov ax, word ptr [bp + 6]
2:9E8A  8b5608               mov dx, word ptr [bp + 8]
2:9E8D  051c00               add ax, 0x1c
2:9E90  eb03                 jmp 0x9e95
loc_9E92:
2:9E92  33c0                 xor ax, ax
2:9E94  99                   cdq
loc_9E95:
2:9E95  8946fa               mov word ptr [bp - 6], ax
2:9E98  8956fc               mov word ptr [bp - 4], dx
2:9E9B  52                   push dx
2:9E9C  50                   push ax
2:9E9D  666a50               push 0x50
2:9EA0  66ff368803           push dword ptr [0x388]
2:9EA5  90                   nop
2:9EA6  0e                   push cs
2:9EA7  e808f4               call 0x92b2  ; sub_s2:92B2
loc_9EAA:
2:9EAA  c746fe0000           mov word ptr [bp - 2], 0
loc_9EAF:
2:9EAF  c45e06               les bx, ptr [bp + 6]
2:9EB2  83c322               add bx, 0x22
2:9EB5  8b76fe               mov si, word ptr [bp - 2]
2:9EB8  c1e602               shl si, 2
2:9EBB  268b00               mov ax, word ptr es:[bx + si]
2:9EBE  268b5002             mov dx, word ptr es:[bx + si + 2]
2:9EC2  8bda                 mov bx, dx
2:9EC4  0bd0                 or dx, ax
2:9EC6  740e                 je 0x9ed6
2:9EC8  6a01                 push 1
2:9ECA  53                   push bx
2:9ECB  50                   push ax
2:9ECC  8ec3                 mov es, bx
2:9ECE  8bf0                 mov si, ax
2:9ED0  26c41c               les bx, ptr es:[si]
2:9ED3  26ff1f               lcall es:[bx]
loc_9ED6:
2:9ED6  ff46fe               inc word ptr [bp - 2]
2:9ED9  837efe0c             cmp word ptr [bp - 2], 0xc
2:9EDD  7cd0                 jl 0x9eaf
2:9EDF  66837e0600           cmp dword ptr [bp + 6], 0
2:9EE4  740c                 je 0x9ef2
2:9EE6  8b4606               mov ax, word ptr [bp + 6]
2:9EE9  8b5608               mov dx, word ptr [bp + 8]
2:9EEC  051c00               add ax, 0x1c
2:9EEF  eb04                 jmp 0x9ef5
2:9EF1  db 90
loc_9EF2:
2:9EF2  33c0                 xor ax, ax
2:9EF4  99                   cdq
loc_9EF5:
2:9EF5  8946fa               mov word ptr [bp - 6], ax
2:9EF8  8956fc               mov word ptr [bp - 4], dx
2:9EFB  c45efa               les bx, ptr [bp - 6]
2:9EFE  26c7079a38           mov word ptr es:[bx], 0x389a
2:9F03  26c74702549d         mov word ptr es:[bx + 2], 0x9d54  ; SEGMENT s2:0000
2:9F09  66ff7606             push dword ptr [bp + 6]
2:9F0D  9a224d459d           lcall 0x9d45, 0x4d22  ; sub_s4:4D22
2:9F12  5e                   pop si
2:9F13  c9                   leave
2:9F14  ca0400               retf 4
2:9F17  db 00

; ---------------- sub_s2:9F18 FAR size=48 callers=0
2:9F18  55                   push bp
2:9F19  8bec                 mov bp, sp
2:9F1B  57                   push di
2:9F1C  56                   push si
2:9F1D  837e0a02             cmp word ptr [bp + 0xa], 2
2:9F21  751e                 jne 0x9f41
2:9F23  8b4606               mov ax, word ptr [bp + 6]
2:9F26  8b5608               mov dx, word ptr [bp + 8]
2:9F29  2d1c00               sub ax, 0x1c
2:9F2C  52                   push dx
2:9F2D  50                   push ax
2:9F2E  8bf0                 mov si, ax
2:9F30  8bfa                 mov di, dx
2:9F32  90                   nop
2:9F33  0e                   push cs
2:9F34  e82d00               call 0x9f64  ; sub_s2:9F64
2:9F37  ff760a               push word ptr [bp + 0xa]
2:9F3A  57                   push di
2:9F3B  56                   push si
2:9F3C  9a621fcd9d           lcall 0x9dcd, 0x1f62  ; sub_s3:1F62
loc_9F41:
2:9F41  5e                   pop si
2:9F42  5f                   pop di
2:9F43  c9                   leave
2:9F44  ca0600               retf 6
2:9F47  db 00

; ---------------- sub_s2:9F48 FAR size=28 callers=2
2:9F48  55                   push bp
2:9F49  8bec                 mov bp, sp
2:9F4B  56                   push si
2:9F4C  c45e06               les bx, ptr [bp + 6]
2:9F4F  268b7720             mov si, word ptr es:[bx + 0x20]
2:9F53  c1e602               shl si, 2
2:9F56  268b4022             mov ax, word ptr es:[bx + si + 0x22]
2:9F5A  268b5024             mov dx, word ptr es:[bx + si + 0x24]
2:9F5E  5e                   pop si
2:9F5F  c9                   leave
2:9F60  ca0400               retf 4
2:9F63  db 00

; ---------------- sub_s2:9F64 FAR size=28 callers=1
2:9F64  55                   push bp
2:9F65  8bec                 mov bp, sp
2:9F67  c45e06               les bx, ptr [bp + 6]
2:9F6A  26ff4720             inc word ptr es:[bx + 0x20]
2:9F6E  26837f200c           cmp word ptr es:[bx + 0x20], 0xc
2:9F73  7c06                 jl 0x9f7b
2:9F75  26c747200000         mov word ptr es:[bx + 0x20], 0
loc_9F7B:
2:9F7B  c9                   leave
2:9F7C  ca0400               retf 4
2:9F7F  db 00

; ---------------- sub_s2:9F80 FAR size=12 callers=0
2:9F80  8bdc                 mov bx, sp
2:9F82  36836f041c           sub word ptr ss:[bx + 4], 0x1c
2:9F87  e90200               jmp 0x9f8c
2:9F8A  db 90 90

; ---------------- sub_s2:9F8C FAR size=70 callers=0
2:9F8C  55                   push bp
2:9F8D  8bec                 mov bp, sp
2:9F8F  66ff7606             push dword ptr [bp + 6]
2:9F93  90                   nop
2:9F94  0e                   push cs
2:9F95  e8c2fe               call 0x9e5a  ; sub_s2:9E5A
2:9F98  f6460a01             test byte ptr [bp + 0xa], 1
2:9F9C  7409                 je 0x9fa7
2:9F9E  66ff7606             push dword ptr [bp + 6]
2:9FA2  9ace17a89d           lcall 0x9da8, 0x17ce  ; operator_delete@s1:17CE
loc_9FA7:
2:9FA7  8b4606               mov ax, word ptr [bp + 6]
2:9FAA  8b5608               mov dx, word ptr [bp + 8]
2:9FAD  c9                   leave
2:9FAE  ca0600               retf 6
2:9FB1  db 90 8c 9f 6b 9e f2 1d bc 9f ce 1d c0 9f d4 1d 3f
2:9FC1  db 9f 04 4e c8 9f 18 4f 10 9f 80 9f d0 9f 18 9f b4
2:9FD1  db 9f

; ---------------- sub_s2:9FD2 FAR size=180 callers=1
2:9FD2  c8040000             enter 4, 0
2:9FD6  66ff7608             push dword ptr [bp + 8]
2:9FDA  ff7606               push word ptr [bp + 6]
2:9FDD  9a481db89f           lcall 0x9fb8, 0x1d48  ; sub_s3:1D48
2:9FE2  c45e06               les bx, ptr [bp + 6]
2:9FE5  662bc0               sub eax, eax
2:9FE8  662689470a           mov dword ptr es:[bx + 0xa], eax
2:9FED  662689871004         mov dword ptr es:[bx + 0x410], eax
2:9FF3  2689871404           mov word ptr es:[bx + 0x414], ax
2:9FF8  2689871604           mov word ptr es:[bx + 0x416], ax
2:9FFD  2689871804           mov word ptr es:[bx + 0x418], ax
2:A002  2689871a04           mov word ptr es:[bx + 0x41a], ax
2:A007  2689871c04           mov word ptr es:[bx + 0x41c], ax
2:A00C  2689871e04           mov word ptr es:[bx + 0x41e], ax
2:A011  26c70792ad           mov word ptr es:[bx], 0xad92
2:A016  26c74702cc9f         mov word ptr es:[bx + 2], 0x9fcc  ; SEGMENT s2:0000
2:A01C  6a0c                 push 0xc
2:A01E  9a9c1755a0           lcall 0xa055, 0x179c  ; operator_new@s1:179C
2:A023  83c402               add sp, 2
2:A026  8956fe               mov word ptr [bp - 2], dx
2:A029  0bd0                 or dx, ax
2:A02B  7417                 je 0xa044
2:A02D  ff76fe               push word ptr [bp - 2]
2:A030  50                   push ax
2:A031  90                   nop
2:A032  0e                   push cs
2:A033  e814b7               call 0x574a  ; sub_s2:574A
2:A036  c45e06               les bx, ptr [bp + 6]
2:A039  2689470a             mov word ptr es:[bx + 0xa], ax
2:A03D  2689570c             mov word ptr es:[bx + 0xc], dx
2:A041  eb0d                 jmp 0xa050
2:A043  db 90
loc_A044:
2:A044  c45e06               les bx, ptr [bp + 6]
2:A047  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
loc_A050:
2:A050  6a0c                 push 0xc
2:A052  9a9c17a59f           lcall 0x9fa5, 0x179c  ; operator_new@s1:179C
2:A057  83c402               add sp, 2
2:A05A  8956fe               mov word ptr [bp - 2], dx
2:A05D  0bd0                 or dx, ax
2:A05F  740b                 je 0xa06c
2:A061  ff76fe               push word ptr [bp - 2]
2:A064  50                   push ax
2:A065  90                   nop
2:A066  0e                   push cs
2:A067  e8e0b6               call 0x574a  ; sub_s2:574A
2:A06A  eb03                 jmp 0xa06f
loc_A06C:
2:A06C  33c0                 xor ax, ax
2:A06E  99                   cdq
loc_A06F:
2:A06F  c45e06               les bx, ptr [bp + 6]
2:A072  2689871004           mov word ptr es:[bx + 0x410], ax
2:A077  2689971204           mov word ptr es:[bx + 0x412], dx
2:A07C  8b4606               mov ax, word ptr [bp + 6]
2:A07F  8b5608               mov dx, word ptr [bp + 8]
2:A082  c9                   leave
2:A083  ca0600               retf 6

; ---------------- sub_s2:A086 FAR size=94 callers=1
2:A086  c8080000             enter 8, 0
2:A08A  56                   push si
2:A08B  c45e06               les bx, ptr [bp + 6]
2:A08E  26c70792ad           mov word ptr es:[bx], 0xad92
2:A093  26c747021aa0         mov word ptr es:[bx + 2], 0xa01a  ; SEGMENT s2:0000
2:A099  268b470a             mov ax, word ptr es:[bx + 0xa]
2:A09D  268b570c             mov dx, word ptr es:[bx + 0xc]
2:A0A1  8bda                 mov bx, dx
2:A0A3  0bd0                 or dx, ax
2:A0A5  740e                 je 0xa0b5
2:A0A7  6a01                 push 1
2:A0A9  53                   push bx
2:A0AA  50                   push ax
2:A0AB  8ec3                 mov es, bx
2:A0AD  8bf0                 mov si, ax
2:A0AF  26c41c               les bx, ptr es:[si]
2:A0B2  26ff1f               lcall es:[bx]
loc_A0B5:
2:A0B5  c45e06               les bx, ptr [bp + 6]
2:A0B8  268b871004           mov ax, word ptr es:[bx + 0x410]
2:A0BD  268b971204           mov dx, word ptr es:[bx + 0x412]
2:A0C2  8bda                 mov bx, dx
2:A0C4  0bd8                 or bx, ax
2:A0C6  740e                 je 0xa0d6
2:A0C8  6a01                 push 1
2:A0CA  52                   push dx
2:A0CB  50                   push ax
2:A0CC  8ec2                 mov es, dx
2:A0CE  8bd8                 mov bx, ax
2:A0D0  26c41f               les bx, ptr es:[bx]
2:A0D3  26ff1f               lcall es:[bx]
loc_A0D6:
2:A0D6  66ff7606             push dword ptr [bp + 6]
2:A0DA  9a801de09f           lcall 0x9fe0, 0x1d80  ; sub_s3:1D80
2:A0DF  5e                   pop si
2:A0E0  c9                   leave
2:A0E1  ca0400               retf 4

; ---------------- sub_s2:A0E4 FAR size=268 callers=16
;   apis: USER.PostMessage
2:A0E4  c8420000             enter 0x42, 0
2:A0E8  c45e06               les bx, ptr [bp + 6]
2:A0EB  6626ff770a           push dword ptr es:[bx + 0xa]
2:A0F0  8d46f8               lea ax, [bp - 8]
2:A0F3  16                   push ss
2:A0F4  50                   push ax
2:A0F5  90                   nop
2:A0F6  0e                   push cs
2:A0F7  e88ab6               call 0x5784  ; ListIter::ListIter@s2:5784
2:A0FA  662bc0               sub eax, eax
2:A0FD  668946f4             mov dword ptr [bp - 0xc], eax
2:A101  8946f2               mov word ptr [bp - 0xe], ax
loc_A104:
2:A104  8d46f8               lea ax, [bp - 8]
2:A107  16                   push ss
2:A108  50                   push ax
2:A109  90                   nop
2:A10A  0e                   push cs
2:A10B  e804ba               call 0x5b12  ; ListIter::next@s2:5B12
2:A10E  8946f4               mov word ptr [bp - 0xc], ax
2:A111  8956f6               mov word ptr [bp - 0xa], dx
2:A114  0bd0                 or dx, ax
2:A116  742e                 je 0xa146
2:A118  8b4616               mov ax, word ptr [bp + 0x16]
2:A11B  c45ef4               les bx, ptr [bp - 0xc]
2:A11E  26394704             cmp word ptr es:[bx + 4], ax
2:A122  75e0                 jne 0xa104
2:A124  268b470c             mov ax, word ptr es:[bx + 0xc]
2:A128  03460e               add ax, word ptr [bp + 0xe]
2:A12B  2689470c             mov word ptr es:[bx + 0xc], ax
2:A12F  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:A134  6603460a             add eax, dword ptr [bp + 0xa]
2:A138  662689470e           mov dword ptr es:[bx + 0xe], eax
2:A13D  268b5710             mov dx, word ptr es:[bx + 0x10]
2:A141  c746f20100           mov word ptr [bp - 0xe], 1
loc_A146:
2:A146  837ef200             cmp word ptr [bp - 0xe], 0
2:A14A  0f858500             jne 0xa1d3
2:A14E  66a1a003             mov eax, dword ptr [0x3a0]
2:A152  668946e2             mov dword ptr [bp - 0x1e], eax
2:A156  6650                 push eax
2:A158  9afc0721a0           lcall 0xa021, 0x7fc  ; sub_s1:07FC
2:A15D  8946ee               mov word ptr [bp - 0x12], ax
2:A160  8956f0               mov word ptr [bp - 0x10], dx
2:A163  0bd0                 or dx, ax
2:A165  744d                 je 0xa1b4
2:A167  c45eee               les bx, ptr [bp - 0x12]
2:A16A  26c7079a38           mov word ptr es:[bx], 0x389a
2:A16F  26c74702a8a1         mov word ptr es:[bx + 2], 0xa1a8  ; SEGMENT s2:0000
2:A175  8b4616               mov ax, word ptr [bp + 0x16]
2:A178  c45eee               les bx, ptr [bp - 0x12]
2:A17B  26894704             mov word ptr es:[bx + 4], ax
2:A17F  668b4612             mov eax, dword ptr [bp + 0x12]
2:A183  6626894706           mov dword ptr es:[bx + 6], eax
2:A188  8b4610               mov ax, word ptr [bp + 0x10]
2:A18B  2689470a             mov word ptr es:[bx + 0xa], ax
2:A18F  8b460e               mov ax, word ptr [bp + 0xe]
2:A192  2689470c             mov word ptr es:[bx + 0xc], ax
2:A196  668b460a             mov eax, dword ptr [bp + 0xa]
2:A19A  662689470e           mov dword ptr es:[bx + 0xe], eax
2:A19F  26c7078ead           mov word ptr es:[bx], 0xad8e
2:A1A4  26c7470297a0         mov word ptr es:[bx + 2], 0xa097  ; SEGMENT s2:0000
2:A1AA  668b46ee             mov eax, dword ptr [bp - 0x12]
2:A1AE  668946f4             mov dword ptr [bp - 0xc], eax
2:A1B2  eb08                 jmp 0xa1bc
loc_A1B4:
2:A1B4  66c746f400000000     mov dword ptr [bp - 0xc], 0
loc_A1BC:
2:A1BC  66ff76f4             push dword ptr [bp - 0xc]
2:A1C0  c45e06               les bx, ptr [bp + 6]
2:A1C3  6626ff770a           push dword ptr es:[bx + 0xa]
2:A1C8  26c45f0a             les bx, ptr es:[bx + 0xa]
2:A1CC  26c41f               les bx, ptr es:[bx]
2:A1CF  26ff5f08             lcall es:[bx + 8]
loc_A1D3:
2:A1D3  837e1614             cmp word ptr [bp + 0x16], 0x14
2:A1D7  7512                 jne 0xa1eb
2:A1D9  ff369603             push word ptr [0x396]
2:A1DD  6668fc001101         push 0x11100fc
2:A1E3  666a00               push 0
2:A1E6  9a229a0000           lcall 0, 0x9a22  ; USER.PostMessage
loc_A1EB:
2:A1EB  c9                   leave
2:A1EC  ca1200               retf 0x12
2:A1EF  db 00

; ---------------- sub_s2:A1F0 FAR size=1796 callers=1
2:A1F0  c8100100             enter 0x110, 0
2:A1F4  57                   push di
2:A1F5  56                   push si
2:A1F6  33c0                 xor ax, ax
2:A1F8  c45e16               les bx, ptr [bp + 0x16]
2:A1FB  268907               mov word ptr es:[bx], ax
2:A1FE  c45e12               les bx, ptr [bp + 0x12]
2:A201  268907               mov word ptr es:[bx], ax
2:A204  c45e0e               les bx, ptr [bp + 0xe]
2:A207  268907               mov word ptr es:[bx], ax
2:A20A  c45e0a               les bx, ptr [bp + 0xa]
2:A20D  268907               mov word ptr es:[bx], ax
2:A210  c45e06               les bx, ptr [bp + 6]
2:A213  2688470e             mov byte ptr es:[bx + 0xe], al
2:A217  6626ff770a           push dword ptr es:[bx + 0xa]
2:A21C  26c45f0a             les bx, ptr es:[bx + 0xa]
2:A220  26c41f               les bx, ptr es:[bx]
2:A223  26ff5f10             lcall es:[bx + 0x10]
2:A227  8946fc               mov word ptr [bp - 4], ax
2:A22A  8956fe               mov word ptr [bp - 2], dx
2:A22D  0bd0                 or dx, ax
2:A22F  7509                 jne 0xa23a
2:A231  33c0                 xor ax, ax
2:A233  99                   cdq
2:A234  5e                   pop si
2:A235  5f                   pop di
2:A236  c9                   leave
2:A237  ca1400               retf 0x14
loc_A23A:
2:A23A  c45efc               les bx, ptr [bp - 4]
2:A23D  268b4704             mov ax, word ptr es:[bx + 4]
2:A241  c45e16               les bx, ptr [bp + 0x16]
2:A244  268907               mov word ptr es:[bx], ax
2:A247  c45efc               les bx, ptr [bp - 4]
2:A24A  268b470a             mov ax, word ptr es:[bx + 0xa]
2:A24E  c45e0e               les bx, ptr [bp + 0xe]
2:A251  268907               mov word ptr es:[bx], ax
2:A254  c45e16               les bx, ptr [bp + 0x16]
2:A257  26ff37               push word ptr es:[bx]
2:A25A  66ff7606             push dword ptr [bp + 6]
2:A25E  90                   nop
2:A25F  0e                   push cs
2:A260  e81d09               call 0xab80  ; sub_s2:AB80
2:A263  c45e0a               les bx, ptr [bp + 0xa]
2:A266  268907               mov word ptr es:[bx], ax
2:A269  c45efc               les bx, ptr [bp - 4]
2:A26C  268b4704             mov ax, word ptr es:[bx + 4]
2:A270  e9b705               jmp 0xa82a
2:A273  db 90
loc_A274:
2:A274  680004               push 0x400
loc_A277:
2:A277  668b4606             mov eax, dword ptr [bp + 6]
2:A27B  050e00               add ax, 0xe
2:A27E  6650                 push eax
2:A280  68ff03               push 0x3ff
2:A283  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A288  9ae084a7a2           lcall 0xa2a7, 0x84e0  ; sub_s3:84E0
2:A28D  e93406               jmp 0xa8c4
loc_A290:
2:A290  689a05               push 0x59a
2:A293  668b4606             mov eax, dword ptr [bp + 6]
2:A297  050e00               add ax, 0xe
2:A29A  6650                 push eax
2:A29C  68ff03               push 0x3ff
2:A29F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A2A4  9ae084eaa2           lcall 0xa2ea, 0x84e0  ; sub_s3:84E0
2:A2A9  c45e12               les bx, ptr [bp + 0x12]
2:A2AC  26c707d100           mov word ptr es:[bx], 0xd1
loc_A2B1:
2:A2B1  c45e0e               les bx, ptr [bp + 0xe]
2:A2B4  26c7070100           mov word ptr es:[bx], 1
2:A2B9  e90806               jmp 0xa8c4
loc_A2BC:
2:A2BC  c45efc               les bx, ptr [bp - 4]
2:A2BF  6626ff7706           push dword ptr es:[bx + 6]
2:A2C4  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:A2C9  9aece1aa6f           lcall 0x6faa, 0xe1ec  ; Db::resolveHandle@s6:E1EC
2:A2CE  8986f8fe             mov word ptr [bp - 0x108], ax
2:A2D2  8996fafe             mov word ptr [bp - 0x106], dx
2:A2D6  68ff03               push 0x3ff
2:A2D9  8d86fcfe             lea ax, [bp - 0x104]
2:A2DD  16                   push ss
2:A2DE  50                   push ax
2:A2DF  680001               push 0x100
2:A2E2  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A2E7  9ae08437a3           lcall 0xa337, 0x84e0  ; sub_s3:84E0
2:A2EC  c45efc               les bx, ptr [bp - 4]
2:A2EF  26ff770c             push word ptr es:[bx + 0xc]
2:A2F3  66ffb6f8fe           push dword ptr [bp - 0x108]
2:A2F8  9a284de06f           lcall 0x6fe0, 0x4d28  ; sub_s8:4D28
2:A2FD  52                   push dx
2:A2FE  50                   push ax
2:A2FF  8d86fcfe             lea ax, [bp - 0x104]
2:A303  16                   push ss
2:A304  50                   push ax
2:A305  668b4606             mov eax, dword ptr [bp + 6]
2:A309  050e00               add ax, 0xe
2:A30C  6650                 push eax
2:A30E  9a9c3fd1a3           lcall 0xa3d1, 0x3f9c  ; _fsprintf@s1:3F9C
2:A313  83c40e               add sp, 0xe
2:A316  e9ab05               jmp 0xa8c4
2:A319  db 90
loc_A31A:
2:A31A  689b05               push 0x59b
2:A31D  e957ff               jmp 0xa277
loc_A320:
2:A320  683106               push 0x631
2:A323  668b4606             mov eax, dword ptr [bp + 6]
2:A327  050e00               add ax, 0xe
2:A32A  6650                 push eax
2:A32C  68ff03               push 0x3ff
2:A32F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A334  9ae084bba3           lcall 0xa3bb, 0x84e0  ; sub_s3:84E0
2:A339  c45e12               les bx, ptr [bp + 0x12]
2:A33C  26c707d400           mov word ptr es:[bx], 0xd4
2:A341  e96dff               jmp 0xa2b1
loc_A344:
2:A344  c45e06               les bx, ptr [bp + 6]
2:A347  2683bf160400         cmp word ptr es:[bx + 0x416], 0
2:A34D  750b                 jne 0xa35a
2:A34F  26c78716040100       mov word ptr es:[bx + 0x416], 1
2:A356  e96b05               jmp 0xa8c4
2:A359  db 90
loc_A35A:
2:A35A  c45e0a               les bx, ptr [bp + 0xa]
2:A35D  26c7070000           mov word ptr es:[bx], 0
2:A362  e95f05               jmp 0xa8c4
2:A365  db 90
loc_A366:
2:A366  c45e06               les bx, ptr [bp + 6]
2:A369  2683bf1a0400         cmp word ptr es:[bx + 0x41a], 0
2:A36F  75e9                 jne 0xa35a
2:A371  26c7871a040100       mov word ptr es:[bx + 0x41a], 1
2:A378  e94905               jmp 0xa8c4
2:A37B  db 90
loc_A37C:
2:A37C  c45e06               les bx, ptr [bp + 6]
2:A37F  2683bf1c0400         cmp word ptr es:[bx + 0x41c], 0
2:A385  75d3                 jne 0xa35a
2:A387  26c7871c040100       mov word ptr es:[bx + 0x41c], 1
2:A38E  e93305               jmp 0xa8c4
2:A391  db 90
loc_A392:
2:A392  c45e06               les bx, ptr [bp + 6]
2:A395  2683bf180400         cmp word ptr es:[bx + 0x418], 0
2:A39B  75bd                 jne 0xa35a
2:A39D  26c78718040100       mov word ptr es:[bx + 0x418], 1
2:A3A4  682a07               push 0x72a
2:A3A7  8d470e               lea ax, [bx + 0xe]
2:A3AA  06                   push es
2:A3AB  50                   push ax
2:A3AC  68ff03               push 0x3ff
2:A3AF  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A3B4  8bf0                 mov si, ax
2:A3B6  8cc7                 mov di, es
2:A3B8  9ae084c8a3           lcall 0xa3c8, 0x84e0  ; sub_s3:84E0
2:A3BD  682b07               push 0x72b
2:A3C0  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A3C5  9a7e84eea3           lcall 0xa3ee, 0x847e  ; LoadStringRes@s3:847E
2:A3CA  52                   push dx
2:A3CB  50                   push ax
2:A3CC  57                   push di
2:A3CD  56                   push si
2:A3CE  9aea3c5ba1           lcall 0xa15b, 0x3cea  ; sub_s1:3CEA
2:A3D3  83c408               add sp, 8
2:A3D6  c45e12               les bx, ptr [bp + 0x12]
2:A3D9  26c7074c00           mov word ptr es:[bx], 0x4c
2:A3DE  666801000a00         push 0xa0001
2:A3E4  6a2b                 push 0x2b
2:A3E6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:A3EB  9aba20fda3           lcall 0xa3fd, 0x20ba  ; sub_s3:20BA
2:A3F0  8986f8fe             mov word ptr [bp - 0x108], ax
2:A3F4  8996fafe             mov word ptr [bp - 0x106], dx
2:A3F8  52                   push dx
2:A3F9  50                   push ax
2:A3FA  9a9e0819a4           lcall 0xa419, 0x89e  ; sub_s3:089E
2:A3FF  e9c204               jmp 0xa8c4
loc_A402:
2:A402  681307               push 0x713
2:A405  668b4606             mov eax, dword ptr [bp + 6]
2:A409  050e00               add ax, 0xe
2:A40C  6650                 push eax
2:A40E  68ff03               push 0x3ff
2:A411  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A416  9ae0843da4           lcall 0xa43d, 0x84e0  ; sub_s3:84E0
2:A41B  c45e12               les bx, ptr [bp + 0x12]
2:A41E  26c7072800           mov word ptr es:[bx], 0x28
2:A423  e99e04               jmp 0xa8c4
loc_A426:
2:A426  681707               push 0x717
2:A429  668b4606             mov eax, dword ptr [bp + 6]
2:A42D  050e00               add ax, 0xe
2:A430  6650                 push eax
2:A432  68ff03               push 0x3ff
2:A435  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A43A  9ae08461a4           lcall 0xa461, 0x84e0  ; sub_s3:84E0
2:A43F  c45e12               les bx, ptr [bp + 0x12]
2:A442  26c7072c00           mov word ptr es:[bx], 0x2c
2:A447  e97a04               jmp 0xa8c4
loc_A44A:
2:A44A  681907               push 0x719
2:A44D  668b4606             mov eax, dword ptr [bp + 6]
2:A451  050e00               add ax, 0xe
2:A454  6650                 push eax
2:A456  68ff03               push 0x3ff
2:A459  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A45E  9ae08485a4           lcall 0xa485, 0x84e0  ; sub_s3:84E0
2:A463  c45e12               les bx, ptr [bp + 0x12]
2:A466  26c7072e00           mov word ptr es:[bx], 0x2e
2:A46B  e95604               jmp 0xa8c4
loc_A46E:
2:A46E  681b07               push 0x71b
2:A471  668b4606             mov eax, dword ptr [bp + 6]
2:A475  050e00               add ax, 0xe
2:A478  6650                 push eax
2:A47A  68ff03               push 0x3ff
2:A47D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A482  9ae084a9a4           lcall 0xa4a9, 0x84e0  ; sub_s3:84E0
2:A487  c45e12               les bx, ptr [bp + 0x12]
2:A48A  26c7073000           mov word ptr es:[bx], 0x30
2:A48F  e93204               jmp 0xa8c4
loc_A492:
2:A492  681d07               push 0x71d
2:A495  668b4606             mov eax, dword ptr [bp + 6]
2:A499  050e00               add ax, 0xe
2:A49C  6650                 push eax
2:A49E  68ff03               push 0x3ff
2:A4A1  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A4A6  9ae084cda4           lcall 0xa4cd, 0x84e0  ; sub_s3:84E0
2:A4AB  c45e12               les bx, ptr [bp + 0x12]
2:A4AE  26c7073200           mov word ptr es:[bx], 0x32
2:A4B3  e90e04               jmp 0xa8c4
loc_A4B6:
2:A4B6  682007               push 0x720
2:A4B9  668b4606             mov eax, dword ptr [bp + 6]
2:A4BD  050e00               add ax, 0xe
2:A4C0  6650                 push eax
2:A4C2  68ff03               push 0x3ff
2:A4C5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A4CA  9ae08409a5           lcall 0xa509, 0x84e0  ; sub_s3:84E0
2:A4CF  c45e12               les bx, ptr [bp + 0x12]
2:A4D2  26c7073400           mov word ptr es:[bx], 0x34
2:A4D7  e9ea03               jmp 0xa8c4
loc_A4DA:
2:A4DA  c45e06               les bx, ptr [bp + 6]
2:A4DD  2683bf1e0400         cmp word ptr es:[bx + 0x41e], 0
2:A4E3  0f8573fe             jne 0xa35a
2:A4E7  26c7871e040100       mov word ptr es:[bx + 0x41e], 1
2:A4EE  e9d303               jmp 0xa8c4
2:A4F1  db 90
loc_A4F2:
2:A4F2  681507               push 0x715
2:A4F5  668b4606             mov eax, dword ptr [bp + 6]
2:A4F9  050e00               add ax, 0xe
2:A4FC  6650                 push eax
2:A4FE  68ff03               push 0x3ff
2:A501  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A506  9ae0842da5           lcall 0xa52d, 0x84e0  ; sub_s3:84E0
2:A50B  c45e12               les bx, ptr [bp + 0x12]
2:A50E  26c7072a00           mov word ptr es:[bx], 0x2a
2:A513  e9ae03               jmp 0xa8c4
loc_A516:
2:A516  681207               push 0x712
2:A519  668b4606             mov eax, dword ptr [bp + 6]
2:A51D  050e00               add ax, 0xe
2:A520  6650                 push eax
2:A522  68ff03               push 0x3ff
2:A525  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A52A  9ae08451a5           lcall 0xa551, 0x84e0  ; sub_s3:84E0
2:A52F  c45e12               les bx, ptr [bp + 0x12]
2:A532  26c7072700           mov word ptr es:[bx], 0x27
2:A537  e98a03               jmp 0xa8c4
loc_A53A:
2:A53A  681407               push 0x714
2:A53D  668b4606             mov eax, dword ptr [bp + 6]
2:A541  050e00               add ax, 0xe
2:A544  6650                 push eax
2:A546  68ff03               push 0x3ff
2:A549  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A54E  9ae08475a5           lcall 0xa575, 0x84e0  ; sub_s3:84E0
2:A553  c45e12               les bx, ptr [bp + 0x12]
2:A556  26c7072900           mov word ptr es:[bx], 0x29
2:A55B  e96603               jmp 0xa8c4
loc_A55E:
2:A55E  681607               push 0x716
2:A561  668b4606             mov eax, dword ptr [bp + 6]
2:A565  050e00               add ax, 0xe
2:A568  6650                 push eax
2:A56A  68ff03               push 0x3ff
2:A56D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A572  9ae08499a5           lcall 0xa599, 0x84e0  ; sub_s3:84E0
2:A577  c45e12               les bx, ptr [bp + 0x12]
2:A57A  26c7072b00           mov word ptr es:[bx], 0x2b
2:A57F  e94203               jmp 0xa8c4
loc_A582:
2:A582  681807               push 0x718
2:A585  668b4606             mov eax, dword ptr [bp + 6]
2:A589  050e00               add ax, 0xe
2:A58C  6650                 push eax
2:A58E  68ff03               push 0x3ff
2:A591  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A596  9ae084dda0           lcall 0xa0dd, 0x84e0  ; sub_s3:84E0
2:A59B  c45e12               les bx, ptr [bp + 0x12]
2:A59E  26c7072d00           mov word ptr es:[bx], 0x2d
2:A5A3  e91e03               jmp 0xa8c4
loc_A5A6:
2:A5A6  681a07               push 0x71a
2:A5A9  668b4606             mov eax, dword ptr [bp + 6]
2:A5AD  050e00               add ax, 0xe
2:A5B0  6650                 push eax
2:A5B2  68ff03               push 0x3ff
2:A5B5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A5BA  9ae084e1a5           lcall 0xa5e1, 0x84e0  ; sub_s3:84E0
2:A5BF  c45e12               les bx, ptr [bp + 0x12]
2:A5C2  26c7072f00           mov word ptr es:[bx], 0x2f
2:A5C7  e9fa02               jmp 0xa8c4
loc_A5CA:
2:A5CA  681c07               push 0x71c
2:A5CD  668b4606             mov eax, dword ptr [bp + 6]
2:A5D1  050e00               add ax, 0xe
2:A5D4  6650                 push eax
2:A5D6  68ff03               push 0x3ff
2:A5D9  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A5DE  9ae0840ba6           lcall 0xa60b, 0x84e0  ; sub_s3:84E0
2:A5E3  c45e12               les bx, ptr [bp + 0x12]
2:A5E6  26c7073100           mov word ptr es:[bx], 0x31
2:A5EB  e9d602               jmp 0xa8c4
loc_A5EE:
2:A5EE  681e07               push 0x71e
2:A5F1  8b4606               mov ax, word ptr [bp + 6]
2:A5F4  8b5608               mov dx, word ptr [bp + 8]
2:A5F7  050e00               add ax, 0xe
2:A5FA  52                   push dx
2:A5FB  50                   push ax
2:A5FC  68ff03               push 0x3ff
2:A5FF  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A604  8bf0                 mov si, ax
2:A606  8bfa                 mov di, dx
2:A608  9ae08418a6           lcall 0xa618, 0x84e0  ; sub_s3:84E0
2:A60D  681f07               push 0x71f
2:A610  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A615  9a7e8449a6           lcall 0xa649, 0x847e  ; LoadStringRes@s3:847E
2:A61A  52                   push dx
2:A61B  50                   push ax
2:A61C  57                   push di
2:A61D  56                   push si
2:A61E  9aea3c11a3           lcall 0xa311, 0x3cea  ; sub_s1:3CEA
2:A623  83c408               add sp, 8
2:A626  c45e12               les bx, ptr [bp + 0x12]
2:A629  26c7073300           mov word ptr es:[bx], 0x33
2:A62E  e99302               jmp 0xa8c4
2:A631  db 90
loc_A632:
2:A632  682107               push 0x721
2:A635  668b4606             mov eax, dword ptr [bp + 6]
2:A639  050e00               add ax, 0xe
2:A63C  6650                 push eax
2:A63E  68ff03               push 0x3ff
2:A641  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A646  9ae0846da6           lcall 0xa66d, 0x84e0  ; sub_s3:84E0
2:A64B  c45e12               les bx, ptr [bp + 0x12]
2:A64E  26c7073500           mov word ptr es:[bx], 0x35  ; 'New failed in Op::Op->ResLibr'
2:A653  e96e02               jmp 0xa8c4
loc_A656:
2:A656  682207               push 0x722
2:A659  668b4606             mov eax, dword ptr [bp + 6]
2:A65D  050e00               add ax, 0xe
2:A660  6650                 push eax
2:A662  68ff03               push 0x3ff
2:A665  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A66A  9ae08491a6           lcall 0xa691, 0x84e0  ; sub_s3:84E0
2:A66F  c45e12               les bx, ptr [bp + 0x12]
2:A672  26c7073600           mov word ptr es:[bx], 0x36
2:A677  e94a02               jmp 0xa8c4
loc_A67A:
2:A67A  682307               push 0x723
2:A67D  668b4606             mov eax, dword ptr [bp + 6]
2:A681  050e00               add ax, 0xe
2:A684  6650                 push eax
2:A686  68ff03               push 0x3ff
2:A689  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A68E  9ae084b5a6           lcall 0xa6b5, 0x84e0  ; sub_s3:84E0
2:A693  c45e12               les bx, ptr [bp + 0x12]
2:A696  26c7073700           mov word ptr es:[bx], 0x37
2:A69B  e92602               jmp 0xa8c4
loc_A69E:
2:A69E  682407               push 0x724
2:A6A1  668b4606             mov eax, dword ptr [bp + 6]
2:A6A5  050e00               add ax, 0xe
2:A6A8  6650                 push eax
2:A6AA  68ff03               push 0x3ff
2:A6AD  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A6B2  9ae084d9a6           lcall 0xa6d9, 0x84e0  ; sub_s3:84E0
2:A6B7  c45e12               les bx, ptr [bp + 0x12]
2:A6BA  26c7073800           mov word ptr es:[bx], 0x38
2:A6BF  e90202               jmp 0xa8c4
loc_A6C2:
2:A6C2  682507               push 0x725
2:A6C5  668b4606             mov eax, dword ptr [bp + 6]
2:A6C9  050e00               add ax, 0xe
2:A6CC  6650                 push eax
2:A6CE  68ff03               push 0x3ff
2:A6D1  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A6D6  9ae084fda6           lcall 0xa6fd, 0x84e0  ; sub_s3:84E0
2:A6DB  c45e12               les bx, ptr [bp + 0x12]
2:A6DE  26c7073900           mov word ptr es:[bx], 0x39
2:A6E3  e9de01               jmp 0xa8c4
loc_A6E6:
2:A6E6  684207               push 0x742
2:A6E9  668b4606             mov eax, dword ptr [bp + 6]
2:A6ED  050e00               add ax, 0xe
2:A6F0  6650                 push eax
2:A6F2  68ff03               push 0x3ff
2:A6F5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A6FA  9ae08421a7           lcall 0xa721, 0x84e0  ; sub_s3:84E0
2:A6FF  c45e12               les bx, ptr [bp + 0x12]
2:A702  26c707ce00           mov word ptr es:[bx], 0xce
2:A707  e9ba01               jmp 0xa8c4
loc_A70A:
2:A70A  684307               push 0x743
2:A70D  668b4606             mov eax, dword ptr [bp + 6]
2:A711  050e00               add ax, 0xe
2:A714  6650                 push eax
2:A716  68ff03               push 0x3ff
2:A719  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A71E  9ae08445a7           lcall 0xa745, 0x84e0  ; sub_s3:84E0
2:A723  c45e12               les bx, ptr [bp + 0x12]
2:A726  26c707cf00           mov word ptr es:[bx], 0xcf
2:A72B  e99601               jmp 0xa8c4
loc_A72E:
2:A72E  684407               push 0x744
2:A731  668b4606             mov eax, dword ptr [bp + 6]
2:A735  050e00               add ax, 0xe
2:A738  6650                 push eax
2:A73A  68ff03               push 0x3ff
2:A73D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A742  9ae08469a7           lcall 0xa769, 0x84e0  ; sub_s3:84E0
2:A747  c45e12               les bx, ptr [bp + 0x12]
2:A74A  26c707d000           mov word ptr es:[bx], 0xd0
2:A74F  e97201               jmp 0xa8c4
loc_A752:
2:A752  684507               push 0x745
2:A755  668b4606             mov eax, dword ptr [bp + 6]
2:A759  050e00               add ax, 0xe
2:A75C  6650                 push eax
2:A75E  68ff03               push 0x3ff
2:A761  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A766  9ae0848da7           lcall 0xa78d, 0x84e0  ; sub_s3:84E0
2:A76B  c45e12               les bx, ptr [bp + 0x12]
2:A76E  26c707d100           mov word ptr es:[bx], 0xd1
2:A773  e94e01               jmp 0xa8c4
loc_A776:
2:A776  684607               push 0x746
2:A779  668b4606             mov eax, dword ptr [bp + 6]
2:A77D  050e00               add ax, 0xe
2:A780  6650                 push eax
2:A782  68ff03               push 0x3ff
2:A785  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A78A  9ae084b1a7           lcall 0xa7b1, 0x84e0  ; sub_s3:84E0
2:A78F  c45e12               les bx, ptr [bp + 0x12]
2:A792  26c707d200           mov word ptr es:[bx], 0xd2
2:A797  e92a01               jmp 0xa8c4
loc_A79A:
2:A79A  684707               push 0x747
2:A79D  668b4606             mov eax, dword ptr [bp + 6]
2:A7A1  050e00               add ax, 0xe
2:A7A4  6650                 push eax
2:A7A6  68ff03               push 0x3ff
2:A7A9  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A7AE  9ae084d5a7           lcall 0xa7d5, 0x84e0  ; sub_s3:84E0
2:A7B3  c45e12               les bx, ptr [bp + 0x12]
2:A7B6  26c707d300           mov word ptr es:[bx], 0xd3
2:A7BB  e90601               jmp 0xa8c4
loc_A7BE:
2:A7BE  684807               push 0x748
2:A7C1  668b4606             mov eax, dword ptr [bp + 6]
2:A7C5  050e00               add ax, 0xe
2:A7C8  6650                 push eax
2:A7CA  68ff03               push 0x3ff
2:A7CD  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A7D2  9ae084f9a7           lcall 0xa7f9, 0x84e0  ; sub_s3:84E0
2:A7D7  c45e12               les bx, ptr [bp + 0x12]
2:A7DA  26c707d500           mov word ptr es:[bx], 0xd5
2:A7DF  e9e200               jmp 0xa8c4
loc_A7E2:
2:A7E2  684907               push 0x749
2:A7E5  668b4606             mov eax, dword ptr [bp + 6]
2:A7E9  050e00               add ax, 0xe
2:A7EC  6650                 push eax
2:A7EE  68ff03               push 0x3ff
2:A7F1  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A7F6  9ae0841da8           lcall 0xa81d, 0x84e0  ; sub_s3:84E0
2:A7FB  c45e12               les bx, ptr [bp + 0x12]
2:A7FE  26c707d600           mov word ptr es:[bx], 0xd6
2:A803  e9be00               jmp 0xa8c4
loc_A806:
2:A806  684a07               push 0x74a
2:A809  668b4606             mov eax, dword ptr [bp + 6]
2:A80D  050e00               add ax, 0xe
2:A810  6650                 push eax
2:A812  68ff03               push 0x3ff
2:A815  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:A81A  9ae0848ba2           lcall 0xa28b, 0x84e0  ; sub_s3:84E0
2:A81F  c45e12               les bx, ptr [bp + 0x12]
2:A822  26c707d700           mov word ptr es:[bx], 0xd7  ; 'Outpost'
2:A827  e99a00               jmp 0xa8c4
loc_A82A:
2:A82A  48                   dec ax
2:A82B  3d4400               cmp ax, 0x44
2:A82E  0f879200             ja 0xa8c4
2:A832  03c0                 add ax, ax
2:A834  93                   xchg bx, ax
2:A835  2effa73aa8           jmp word ptr cs:[bx - 0x57c6]
switch_table_A83A:
    dw loc_A290
    dw loc_A2BC
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A31A
    dw loc_A320
    dw loc_A274
    dw loc_A8C4
    dw loc_A344
    dw loc_A8C4
    dw loc_A366
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A37C
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A392
    dw loc_A8C4
    dw loc_A402
    dw loc_A426
    dw loc_A44A
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A46E
    dw loc_A492
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A4B6
    dw loc_A8C4
    dw loc_A4DA
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A4F2
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A8C4
    dw loc_A516
    dw loc_A53A
    dw loc_A55E
    dw loc_A582
    dw loc_A5A6
    dw loc_A5CA
    dw loc_A5EE
    dw loc_A632
    dw loc_A656
    dw loc_A67A
    dw loc_A69E
    dw loc_A6C2
    dw loc_A6E6
    dw loc_A70A
    dw loc_A72E
    dw loc_A752
    dw loc_A776
    dw loc_A79A
    dw loc_A7BE
    dw loc_A7E2
    dw loc_A806
loc_A8C4:
2:A8C4  668b46fc             mov eax, dword ptr [bp - 4]
2:A8C8  668986f0fe           mov dword ptr [bp - 0x110], eax
2:A8CD  668986f4fe           mov dword ptr [bp - 0x10c], eax
2:A8D2  660bc0               or eax, eax
2:A8D5  740d                 je 0xa8e4
2:A8D7  6a01                 push 1
2:A8D9  c45efc               les bx, ptr [bp - 4]
2:A8DC  06                   push es
2:A8DD  50                   push ax
2:A8DE  26c41f               les bx, ptr es:[bx]
2:A8E1  26ff1f               lcall es:[bx]
loc_A8E4:
2:A8E4  8b4606               mov ax, word ptr [bp + 6]
2:A8E7  8b5608               mov dx, word ptr [bp + 8]
2:A8EA  050e00               add ax, 0xe
2:A8ED  5e                   pop si
2:A8EE  5f                   pop di
2:A8EF  c9                   leave
2:A8F0  ca1400               retf 0x14
2:A8F3  db 00

; ---------------- sub_s2:A8F4 FAR size=60 callers=1
2:A8F4  c8080000             enter 8, 0
2:A8F8  66ff7612             push dword ptr [bp + 0x12]
2:A8FC  8d46fe               lea ax, [bp - 2]
2:A8FF  16                   push ss
2:A900  50                   push ax
2:A901  8d4efc               lea cx, [bp - 4]
2:A904  16                   push ss
2:A905  51                   push cx
2:A906  66ff760a             push dword ptr [bp + 0xa]
2:A90A  66ff7606             push dword ptr [bp + 6]
2:A90E  90                   nop
2:A90F  0e                   push cs
2:A910  e8ddf8               call 0xa1f0  ; sub_s2:A1F0
2:A913  8946f8               mov word ptr [bp - 8], ax
2:A916  8956fa               mov word ptr [bp - 6], dx
2:A919  66ff76fc             push dword ptr [bp - 4]
2:A91D  66ff760e             push dword ptr [bp + 0xe]
2:A921  90                   nop
2:A922  0e                   push cs
2:A923  e828eb               call 0x944e  ; sub_s2:944E
2:A926  8b46f8               mov ax, word ptr [bp - 8]
2:A929  8b56fa               mov dx, word ptr [bp - 6]
2:A92C  c9                   leave
2:A92D  ca1000               retf 0x10

; ---------------- sub_s2:A930 FAR size=188 callers=1
2:A930  c8220000             enter 0x22, 0
2:A934  837e0a00             cmp word ptr [bp + 0xa], 0
2:A938  7506                 jne 0xa940
2:A93A  33c0                 xor ax, ax
2:A93C  c9                   leave
2:A93D  ca0600               retf 6
loc_A940:
2:A940  c45e06               les bx, ptr [bp + 6]
2:A943  6626ffb71004         push dword ptr es:[bx + 0x410]
2:A949  8d46f8               lea ax, [bp - 8]
2:A94C  16                   push ss
2:A94D  50                   push ax
2:A94E  90                   nop
2:A94F  0e                   push cs
2:A950  e831ae               call 0x5784  ; ListIter::ListIter@s2:5784
2:A953  66c746f400000000     mov dword ptr [bp - 0xc], 0
loc_A95B:
2:A95B  8d46f8               lea ax, [bp - 8]
2:A95E  16                   push ss
2:A95F  50                   push ax
2:A960  90                   nop
2:A961  0e                   push cs
2:A962  e8adb1               call 0x5b12  ; ListIter::next@s2:5B12
2:A965  8946f4               mov word ptr [bp - 0xc], ax
2:A968  8956f6               mov word ptr [bp - 0xa], dx
2:A96B  0bd0                 or dx, ax
2:A96D  7413                 je 0xa982
2:A96F  8b460a               mov ax, word ptr [bp + 0xa]
2:A972  c45ef4               les bx, ptr [bp - 0xc]
2:A975  26394704             cmp word ptr es:[bx + 4], ax
2:A979  75e0                 jne 0xa95b
2:A97B  b80100               mov ax, 1
2:A97E  c9                   leave
2:A97F  ca0600               retf 6
loc_A982:
2:A982  6a06                 push 6
2:A984  9a9c1721a6           lcall 0xa621, 0x179c  ; operator_new@s1:179C
2:A989  83c402               add sp, 2
2:A98C  8946ea               mov word ptr [bp - 0x16], ax
2:A98F  8956ec               mov word ptr [bp - 0x14], dx
2:A992  0bd0                 or dx, ax
2:A994  742e                 je 0xa9c4
2:A996  c45eea               les bx, ptr [bp - 0x16]
2:A999  26c7079a38           mov word ptr es:[bx], 0x389a
2:A99E  26c74702b7a9         mov word ptr es:[bx + 2], 0xa9b7  ; SEGMENT s2:0000
2:A9A4  8b460a               mov ax, word ptr [bp + 0xa]
2:A9A7  c45eea               les bx, ptr [bp - 0x16]
2:A9AA  26894704             mov word ptr es:[bx + 4], ax
2:A9AE  26c7078aad           mov word ptr es:[bx], 0xad8a
2:A9B3  26c7470273a1         mov word ptr es:[bx + 2], 0xa173  ; SEGMENT s2:0000
2:A9B9  668b46ea             mov eax, dword ptr [bp - 0x16]
2:A9BD  668946f0             mov dword ptr [bp - 0x10], eax
2:A9C1  eb09                 jmp 0xa9cc
2:A9C3  db 90
loc_A9C4:
2:A9C4  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_A9CC:
2:A9CC  66ff76f0             push dword ptr [bp - 0x10]
2:A9D0  c45e06               les bx, ptr [bp + 6]
2:A9D3  6626ffb71004         push dword ptr es:[bx + 0x410]
2:A9D9  26c49f1004           les bx, ptr es:[bx + 0x410]
2:A9DE  26c41f               les bx, ptr es:[bx]
2:A9E1  26ff5f08             lcall es:[bx + 8]
2:A9E5  8946ee               mov word ptr [bp - 0x12], ax
2:A9E8  c9                   leave
2:A9E9  ca0600               retf 6

; ---------------- sub_s2:A9EC FAR size=60 callers=3
2:A9EC  c8080000             enter 8, 0
2:A9F0  c746fe0000           mov word ptr [bp - 2], 0
2:A9F5  c45e06               les bx, ptr [bp + 6]
2:A9F8  2683bf140400         cmp word ptr es:[bx + 0x414], 0
2:A9FE  7520                 jne 0xaa20
2:AA00  26c49f1004           les bx, ptr es:[bx + 0x410]
2:AA05  26837f0800           cmp word ptr es:[bx + 8], 0
2:AA0A  7414                 je 0xaa20
2:AA0C  c45e06               les bx, ptr [bp + 6]
2:AA0F  26c78714040100       mov word ptr es:[bx + 0x414], 1
2:AA16  06                   push es
2:AA17  53                   push bx
2:AA18  90                   nop
2:AA19  0e                   push cs
2:AA1A  e80b00               call 0xaa28  ; sub_s2:AA28
2:AA1D  8946fe               mov word ptr [bp - 2], ax
loc_AA20:
2:AA20  8b46fe               mov ax, word ptr [bp - 2]
2:AA23  c9                   leave
2:AA24  ca0400               retf 4
2:AA27  db 00

; ---------------- sub_s2:AA28 FAR size=128 callers=2
2:AA28  c8140000             enter 0x14, 0
2:AA2C  c45e06               les bx, ptr [bp + 6]
2:AA2F  2683bf140400         cmp word ptr es:[bx + 0x414], 0
2:AA35  7507                 jne 0xaa3e
loc_AA37:
2:AA37  33c0                 xor ax, ax
2:AA39  c9                   leave
2:AA3A  ca0400               retf 4
2:AA3D  db 90
loc_AA3E:
2:AA3E  26c49f1004           les bx, ptr es:[bx + 0x410]
2:AA43  26837f0800           cmp word ptr es:[bx + 8], 0
2:AA48  750e                 jne 0xaa58
2:AA4A  33c0                 xor ax, ax
2:AA4C  c45e06               les bx, ptr [bp + 6]
2:AA4F  2689871404           mov word ptr es:[bx + 0x414], ax
2:AA54  c9                   leave
2:AA55  ca0400               retf 4
loc_AA58:
2:AA58  c45e06               les bx, ptr [bp + 6]
2:AA5B  6626ffb71004         push dword ptr es:[bx + 0x410]
2:AA61  26c49f1004           les bx, ptr es:[bx + 0x410]
2:AA66  26c41f               les bx, ptr es:[bx]
2:AA69  26ff5f10             lcall es:[bx + 0x10]
2:AA6D  8946fc               mov word ptr [bp - 4], ax
2:AA70  8956fe               mov word ptr [bp - 2], dx
2:AA73  0bd0                 or dx, ax
2:AA75  74c0                 je 0xaa37
2:AA77  c45efc               les bx, ptr [bp - 4]
2:AA7A  26ff7704             push word ptr es:[bx + 4]
2:AA7E  66ff36a002           push dword ptr [0x2a0]
2:AA83  90                   nop
2:AA84  0e                   push cs
2:AA85  e8d4b1               call 0x5c5c  ; sub_s2:5C5C
2:AA88  8946fa               mov word ptr [bp - 6], ax
2:AA8B  668b46fc             mov eax, dword ptr [bp - 4]
2:AA8F  660bc0               or eax, eax
2:AA92  740d                 je 0xaaa1
2:AA94  6a01                 push 1
2:AA96  c45efc               les bx, ptr [bp - 4]
2:AA99  06                   push es
2:AA9A  50                   push ax
2:AA9B  26c41f               les bx, ptr es:[bx]
2:AA9E  26ff1f               lcall es:[bx]
loc_AAA1:
2:AAA1  8b46fa               mov ax, word ptr [bp - 6]
2:AAA4  c9                   leave
2:AAA5  ca0400               retf 4

; ---------------- sub_s2:AAA8 FAR size=106 callers=1
2:AAA8  c8020000             enter 2, 0
2:AAAC  c746fe0000           mov word ptr [bp - 2], 0
2:AAB1  8b460a               mov ax, word ptr [bp + 0xa]
2:AAB4  eb38                 jmp 0xaaee
loc_AAB6:
2:AAB6  c746fe2400           mov word ptr [bp - 2], 0x24
2:AABB  eb4d                 jmp 0xab0a
2:AABD  db 90
loc_AABE:
2:AABE  c746fe1600           mov word ptr [bp - 2], 0x16
2:AAC3  eb45                 jmp 0xab0a
2:AAC5  db 90
loc_AAC6:
2:AAC6  c746fe1700           mov word ptr [bp - 2], 0x17
2:AACB  eb3d                 jmp 0xab0a
2:AACD  db 90
loc_AACE:
2:AACE  c746fe1800           mov word ptr [bp - 2], 0x18
2:AAD3  eb35                 jmp 0xab0a
2:AAD5  db 90
loc_AAD6:
2:AAD6  c746fe1b00           mov word ptr [bp - 2], 0x1b
2:AADB  eb2d                 jmp 0xab0a
2:AADD  db 90
loc_AADE:
2:AADE  c746fe1c00           mov word ptr [bp - 2], 0x1c
2:AAE3  eb25                 jmp 0xab0a
2:AAE5  db 90
loc_AAE6:
2:AAE6  c746fe1f00           mov word ptr [bp - 2], 0x1f
2:AAEB  eb1d                 jmp 0xab0a
2:AAED  db 90
loc_AAEE:
2:AAEE  48                   dec ax
2:AAEF  3d0600               cmp ax, 6
2:AAF2  7716                 ja 0xab0a
2:AAF4  03c0                 add ax, ax
2:AAF6  93                   xchg bx, ax
2:AAF7  2effa7fcaa           jmp word ptr cs:[bx - 0x5504]
switch_table_AAFC:
    dw loc_AAB6
    dw loc_AABE
    dw loc_AAC6
    dw loc_AACE
    dw loc_AAD6
    dw loc_AADE
    dw loc_AAE6
loc_AB0A:
2:AB0A  8b46fe               mov ax, word ptr [bp - 2]
2:AB0D  c9                   leave
2:AB0E  ca0600               retf 6
2:AB11  db 00

; ---------------- sub_s2:AB12 FAR size=66 callers=1
2:AB12  c8020000             enter 2, 0
2:AB16  c746fe0000           mov word ptr [bp - 2], 0
2:AB1B  8b460a               mov ax, word ptr [bp + 0xa]
2:AB1E  3d3700               cmp ax, 0x37
2:AB21  7415                 je 0xab38
2:AB23  7723                 ja 0xab48
2:AB25  2c0d                 sub al, 0xd
2:AB27  7407                 je 0xab30
2:AB29  2c1d                 sub al, 0x1d
2:AB2B  7413                 je 0xab40
2:AB2D  eb19                 jmp 0xab48
2:AB2F  db 90
loc_AB30:
2:AB30  c746fe0f00           mov word ptr [bp - 2], 0xf
2:AB35  eb16                 jmp 0xab4d
2:AB37  db 90
loc_AB38:
2:AB38  c746fe2200           mov word ptr [bp - 2], 0x22
2:AB3D  eb0e                 jmp 0xab4d
2:AB3F  db 90
loc_AB40:
2:AB40  c746fe2b00           mov word ptr [bp - 2], 0x2b
2:AB45  eb06                 jmp 0xab4d
2:AB47  db 90
loc_AB48:
2:AB48  c746fe0000           mov word ptr [bp - 2], 0
loc_AB4D:
2:AB4D  8b46fe               mov ax, word ptr [bp - 2]
2:AB50  c9                   leave
2:AB51  ca0600               retf 6

; ---------------- sub_s2:AB54 FAR size=44 callers=1
2:AB54  c8080000             enter 8, 0
2:AB58  c746fe0000           mov word ptr [bp - 2], 0
2:AB5D  c45e06               les bx, ptr [bp + 6]
2:AB60  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:AB66  7410                 je 0xab78
2:AB68  26c45f0a             les bx, ptr es:[bx + 0xa]
2:AB6C  26837f0800           cmp word ptr es:[bx + 8], 0
2:AB71  7405                 je 0xab78
2:AB73  c746fe0100           mov word ptr [bp - 2], 1
loc_AB78:
2:AB78  8b46fe               mov ax, word ptr [bp - 2]
2:AB7B  c9                   leave
2:AB7C  ca0400               retf 4
2:AB7F  db 00

; ---------------- sub_s2:AB80 FAR size=396 callers=1
2:AB80  c8020000             enter 2, 0
2:AB84  c746fe0000           mov word ptr [bp - 2], 0
2:AB89  8b460a               mov ax, word ptr [bp + 0xa]
2:AB8C  e91901               jmp 0xaca8
2:AB8F  db 90
loc_AB90:
2:AB90  c746fe8200           mov word ptr [bp - 2], 0x82
2:AB95  e96c01               jmp 0xad04
loc_AB98:
2:AB98  c746fe7f00           mov word ptr [bp - 2], 0x7f
2:AB9D  e96401               jmp 0xad04
loc_ABA0:
2:ABA0  c746fe8400           mov word ptr [bp - 2], 0x84
2:ABA5  e95c01               jmp 0xad04
loc_ABA8:
2:ABA8  c746fe8000           mov word ptr [bp - 2], 0x80
2:ABAD  e95401               jmp 0xad04
loc_ABB0:
2:ABB0  c746fe8900           mov word ptr [bp - 2], 0x89
2:ABB5  e94c01               jmp 0xad04
loc_ABB8:
2:ABB8  c746fe8a00           mov word ptr [bp - 2], 0x8a
2:ABBD  e94401               jmp 0xad04
loc_ABC0:
2:ABC0  c746fe8c00           mov word ptr [bp - 2], 0x8c
2:ABC5  e93c01               jmp 0xad04
loc_ABC8:
2:ABC8  c746fe8e00           mov word ptr [bp - 2], 0x8e
2:ABCD  e93401               jmp 0xad04
loc_ABD0:
2:ABD0  c746fe8f00           mov word ptr [bp - 2], 0x8f
2:ABD5  e92c01               jmp 0xad04
loc_ABD8:
2:ABD8  c746fe9000           mov word ptr [bp - 2], 0x90
2:ABDD  e92401               jmp 0xad04
loc_ABE0:
2:ABE0  c746fe9100           mov word ptr [bp - 2], 0x91
2:ABE5  e91c01               jmp 0xad04
loc_ABE8:
2:ABE8  c746fe9500           mov word ptr [bp - 2], 0x95
2:ABED  e91401               jmp 0xad04
loc_ABF0:
2:ABF0  c746fe9600           mov word ptr [bp - 2], 0x96
2:ABF5  e90c01               jmp 0xad04
loc_ABF8:
2:ABF8  c746fe9b00           mov word ptr [bp - 2], 0x9b
2:ABFD  e90401               jmp 0xad04
loc_AC00:
2:AC00  c746fe9f00           mov word ptr [bp - 2], 0x9f
2:AC05  e9fc00               jmp 0xad04
loc_AC08:
2:AC08  c746fea200           mov word ptr [bp - 2], 0xa2
2:AC0D  e9f400               jmp 0xad04
loc_AC10:
2:AC10  c746fea400           mov word ptr [bp - 2], 0xa4
2:AC15  e9ec00               jmp 0xad04
loc_AC18:
2:AC18  c746fedf00           mov word ptr [bp - 2], 0xdf  ; 'You may not run a turn. The game is over!'
2:AC1D  e9e400               jmp 0xad04
loc_AC20:
2:AC20  c746fee000           mov word ptr [bp - 2], 0xe0
2:AC25  e9dc00               jmp 0xad04
loc_AC28:
2:AC28  c746fea700           mov word ptr [bp - 2], 0xa7
2:AC2D  e9d400               jmp 0xad04
loc_AC30:
2:AC30  c746feaa00           mov word ptr [bp - 2], 0xaa
2:AC35  e9cc00               jmp 0xad04
loc_AC38:
2:AC38  c746feac00           mov word ptr [bp - 2], 0xac
2:AC3D  e9c400               jmp 0xad04
loc_AC40:
2:AC40  c746fead00           mov word ptr [bp - 2], 0xad
2:AC45  e9bc00               jmp 0xad04
loc_AC48:
2:AC48  c746feae00           mov word ptr [bp - 2], 0xae
2:AC4D  e9b400               jmp 0xad04
loc_AC50:
2:AC50  c746feb100           mov word ptr [bp - 2], 0xb1
2:AC55  e9ac00               jmp 0xad04
loc_AC58:
2:AC58  c746feb300           mov word ptr [bp - 2], 0xb3
2:AC5D  e9a400               jmp 0xad04
loc_AC60:
2:AC60  c746feb400           mov word ptr [bp - 2], 0xb4
2:AC65  e99c00               jmp 0xad04
loc_AC68:
2:AC68  c746feb500           mov word ptr [bp - 2], 0xb5
2:AC6D  e99400               jmp 0xad04
loc_AC70:
2:AC70  c746feb600           mov word ptr [bp - 2], 0xb6
2:AC75  e98c00               jmp 0xad04
loc_AC78:
2:AC78  c746feb700           mov word ptr [bp - 2], 0xb7  ; 'New failed in Op::Op'
2:AC7D  e98400               jmp 0xad04
loc_AC80:
2:AC80  c746feab00           mov word ptr [bp - 2], 0xab
2:AC85  eb7d                 jmp 0xad04
2:AC87  db 90
loc_AC88:
2:AC88  c746feb900           mov word ptr [bp - 2], 0xb9
2:AC8D  eb75                 jmp 0xad04
2:AC8F  db 90
loc_AC90:
2:AC90  c746feba00           mov word ptr [bp - 2], 0xba
2:AC95  eb6d                 jmp 0xad04
2:AC97  db 90
loc_AC98:
2:AC98  c746febc00           mov word ptr [bp - 2], 0xbc
2:AC9D  eb65                 jmp 0xad04
2:AC9F  db 90
loc_ACA0:
2:ACA0  c746febe00           mov word ptr [bp - 2], 0xbe
2:ACA5  eb5d                 jmp 0xad04
2:ACA7  db 90
loc_ACA8:
2:ACA8  2d0800               sub ax, 8
2:ACAB  3d2500               cmp ax, 0x25
2:ACAE  7754                 ja 0xad04
2:ACB0  03c0                 add ax, ax
2:ACB2  93                   xchg bx, ax
2:ACB3  2effa7b8ac           jmp word ptr cs:[bx - 0x5348]
switch_table_ACB8:
    dw loc_AB90
    dw loc_AB98
    dw loc_ABA8
    dw loc_ABA0
    dw loc_ABB0
    dw loc_ABB8
    dw loc_ABC0
    dw loc_ABC8
    dw loc_ABD0
    dw loc_ABD8
    dw loc_ABE0
    dw loc_ABE8
    dw loc_ABF0
    dw loc_AD04
    dw loc_ABF8
    dw loc_AC00
    dw loc_AC08
    dw loc_AC10
    dw loc_AD04
    dw loc_AC28
    dw loc_AC28
    dw loc_AC30
    dw loc_AC38
    dw loc_AC40
    dw loc_AC48
    dw loc_AC50
    dw loc_AC58
    dw loc_AC60
    dw loc_AC68
    dw loc_AC70
    dw loc_AC78
    dw loc_AC80
    dw loc_AC88
    dw loc_AC90
    dw loc_AC98
    dw loc_ACA0
    dw loc_AC18
    dw loc_AC20
loc_AD04:
2:AD04  8b46fe               mov ax, word ptr [bp - 2]
2:AD07  c9                   leave
2:AD08  ca0600               retf 6
2:AD0B  db 00

; ---------------- sub_s2:AD0C FAR size=44 callers=0
2:AD0C  c8080000             enter 8, 0
2:AD10  c45e06               les bx, ptr [bp + 6]
2:AD13  26c7079a38           mov word ptr es:[bx], 0x389a
2:AD18  26c74702a2a9         mov word ptr es:[bx + 2], 0xa9a2  ; SEGMENT s2:0000
2:AD1E  f6460a01             test byte ptr [bp + 0xa], 1
2:AD22  7409                 je 0xad2d
2:AD24  66ff7606             push dword ptr [bp + 6]
2:AD28  9a3a0987a9           lcall 0xa987, 0x93a  ; sub_s1:093A
loc_AD2D:
2:AD2D  8b4606               mov ax, word ptr [bp + 6]
2:AD30  8b5608               mov dx, word ptr [bp + 8]
2:AD33  c9                   leave
2:AD34  ca0600               retf 6
2:AD37  db 00

; ---------------- sub_s2:AD38 FAR size=44 callers=0
2:AD38  c8080000             enter 8, 0
2:AD3C  c45e06               les bx, ptr [bp + 6]
2:AD3F  26c7079a38           mov word ptr es:[bx], 0x389a
2:AD44  26c747021cad         mov word ptr es:[bx + 2], 0xad1c  ; SEGMENT s2:0000
2:AD4A  f6460a01             test byte ptr [bp + 0xa], 1
2:AD4E  7409                 je 0xad59
2:AD50  66ff7606             push dword ptr [bp + 6]
2:AD54  9ace172bad           lcall 0xad2b, 0x17ce  ; operator_delete@s1:17CE
loc_AD59:
2:AD59  8b4606               mov ax, word ptr [bp + 6]
2:AD5C  8b5608               mov dx, word ptr [bp + 8]
2:AD5F  c9                   leave
2:AD60  ca0600               retf 6
2:AD63  db 00

; ---------------- sub_s2:AD64 FAR size=62 callers=0
2:AD64  55                   push bp
2:AD65  8bec                 mov bp, sp
2:AD67  66ff7606             push dword ptr [bp + 6]
2:AD6B  90                   nop
2:AD6C  0e                   push cs
2:AD6D  e816f3               call 0xa086  ; sub_s2:A086
2:AD70  f6460a01             test byte ptr [bp + 0xa], 1
2:AD74  7409                 je 0xad7f
2:AD76  66ff7606             push dword ptr [bp + 6]
2:AD7A  9ace1757ad           lcall 0xad57, 0x17ce  ; operator_delete@s1:17CE
loc_AD7F:
2:AD7F  8b4606               mov ax, word ptr [bp + 6]
2:AD82  8b5608               mov dx, word ptr [bp + 8]
2:AD85  c9                   leave
2:AD86  ca0600               retf 6
2:AD89  db 90 38 ad 48 ad 0c ad 8c ad 64 ad 90 ad f2 1d 9c
2:AD99  db ad ce 1d a0 ad d4 1d bd a5

; ---------------- sub_s2:ADA2 FAR size=48 callers=1
2:ADA2  55                   push bp
2:ADA3  8bec                 mov bp, sp
2:ADA5  56                   push si
2:ADA6  33c0                 xor ax, ax
2:ADA8  c45e06               les bx, ptr [bp + 6]
2:ADAB  268907               mov word ptr es:[bx], ax
2:ADAE  26894702             mov word ptr es:[bx + 2], ax
2:ADB2  8b760a               mov si, word ptr [bp + 0xa]
2:ADB5  26897704             mov word ptr es:[bx + 4], si
2:ADB9  8bc6                 mov ax, si
2:ADBB  03f6                 add si, si
2:ADBD  03f0                 add si, ax
2:ADBF  03f6                 add si, si
2:ADC1  8b84a403             mov ax, word ptr [si + 0x3a4]
2:ADC5  268907               mov word ptr es:[bx], ax
2:ADC8  8bc3                 mov ax, bx
2:ADCA  8cc2                 mov dx, es
2:ADCC  5e                   pop si
2:ADCD  c9                   leave
2:ADCE  ca0600               retf 6
2:ADD1  db 00

; ---------------- sub_s2:ADD2 FAR size=32 callers=1
2:ADD2  55                   push bp
2:ADD3  8bec                 mov bp, sp
2:ADD5  56                   push si
2:ADD6  c45e06               les bx, ptr [bp + 6]
2:ADD9  268b7704             mov si, word ptr es:[bx + 4]
2:ADDD  8bc6                 mov ax, si
2:ADDF  03f6                 add si, si
2:ADE1  03f0                 add si, ax
2:ADE3  03f6                 add si, si
2:ADE5  8b84a403             mov ax, word ptr [si + 0x3a4]
2:ADE9  268907               mov word ptr es:[bx], ax
2:ADEC  5e                   pop si
2:ADED  c9                   leave
2:ADEE  ca0400               retf 4
2:ADF1  db 00

; ---------------- sub_s2:ADF2 FAR size=26 callers=1
2:ADF2  55                   push bp
2:ADF3  8bec                 mov bp, sp
2:ADF5  c45e06               les bx, ptr [bp + 6]
2:ADF8  268b5f04             mov bx, word ptr es:[bx + 4]
2:ADFC  8bc3                 mov ax, bx
2:ADFE  03db                 add bx, bx
2:AE00  03d8                 add bx, ax
2:AE02  03db                 add bx, bx
2:AE04  8b87a403             mov ax, word ptr [bx + 0x3a4]
2:AE08  c9                   leave
2:AE09  ca0400               retf 4

; ---------------- sub_s2:AE0C FAR size=26 callers=1
2:AE0C  55                   push bp
2:AE0D  8bec                 mov bp, sp
2:AE0F  c45e06               les bx, ptr [bp + 6]
2:AE12  268b5f04             mov bx, word ptr es:[bx + 4]
2:AE16  8bc3                 mov ax, bx
2:AE18  03db                 add bx, bx
2:AE1A  03d8                 add bx, ax
2:AE1C  03db                 add bx, bx
2:AE1E  8b87a603             mov ax, word ptr [bx + 0x3a6]
2:AE22  c9                   leave
2:AE23  ca0400               retf 4

; ---------------- sub_s2:AE26 FAR size=178 callers=1
2:AE26  55                   push bp
2:AE27  8bec                 mov bp, sp
2:AE29  56                   push si
2:AE2A  c45e06               les bx, ptr [bp + 6]
2:AE2D  268b5f04             mov bx, word ptr es:[bx + 4]
2:AE31  8bc3                 mov ax, bx
2:AE33  03db                 add bx, bx
2:AE35  03d8                 add bx, ax
2:AE37  03db                 add bx, bx
2:AE39  8b87a803             mov ax, word ptr [bx + 0x3a8]
2:AE3D  48                   dec ax
2:AE3E  48                   dec ax
2:AE3F  740d                 je 0xae4e
2:AE41  48                   dec ax
2:AE42  0f848c00             je 0xaed2
2:AE46  48                   dec ax
2:AE47  0f848700             je 0xaed2
2:AE4B  eb63                 jmp 0xaeb0
2:AE4D  db 90
loc_AE4E:
2:AE4E  8b5e06               mov bx, word ptr [bp + 6]
2:AE51  26837f0201           cmp word ptr es:[bx + 2], 1
2:AE56  752c                 jne 0xae84
2:AE58  26ff0f               dec word ptr es:[bx]
2:AE5B  268b07               mov ax, word ptr es:[bx]
2:AE5E  268b7704             mov si, word ptr es:[bx + 4]
2:AE62  8bce                 mov cx, si
2:AE64  03f6                 add si, si
2:AE66  03f1                 add si, cx
2:AE68  03f6                 add si, si
2:AE6A  3984a403             cmp word ptr [si + 0x3a4], ax
2:AE6E  7e62                 jle 0xaed2
2:AE70  8b84a403             mov ax, word ptr [si + 0x3a4]
2:AE74  40                   inc ax
2:AE75  268907               mov word ptr es:[bx], ax
2:AE78  26c747020000         mov word ptr es:[bx + 2], 0
2:AE7E  5e                   pop si
2:AE7F  c9                   leave
2:AE80  ca0400               retf 4
2:AE83  db 90
loc_AE84:
2:AE84  26ff07               inc word ptr es:[bx]
2:AE87  268b07               mov ax, word ptr es:[bx]
2:AE8A  268b7704             mov si, word ptr es:[bx + 4]
2:AE8E  8bce                 mov cx, si
2:AE90  03f6                 add si, si
2:AE92  03f1                 add si, cx
2:AE94  03f6                 add si, si
2:AE96  3984a603             cmp word ptr [si + 0x3a6], ax
2:AE9A  7d36                 jge 0xaed2
2:AE9C  8b84a603             mov ax, word ptr [si + 0x3a6]
2:AEA0  48                   dec ax
2:AEA1  268907               mov word ptr es:[bx], ax
2:AEA4  26c747020100         mov word ptr es:[bx + 2], 1
2:AEAA  5e                   pop si
2:AEAB  c9                   leave
2:AEAC  ca0400               retf 4
2:AEAF  db 90
loc_AEB0:
2:AEB0  8b5e06               mov bx, word ptr [bp + 6]
2:AEB3  26ff07               inc word ptr es:[bx]
2:AEB6  268b07               mov ax, word ptr es:[bx]
2:AEB9  268b7704             mov si, word ptr es:[bx + 4]
2:AEBD  8bce                 mov cx, si
2:AEBF  03f6                 add si, si
2:AEC1  03f1                 add si, cx
2:AEC3  03f6                 add si, si
2:AEC5  3984a603             cmp word ptr [si + 0x3a6], ax
2:AEC9  7d07                 jge 0xaed2
2:AECB  8b84a403             mov ax, word ptr [si + 0x3a4]
2:AECF  268907               mov word ptr es:[bx], ax
loc_AED2:
2:AED2  5e                   pop si
2:AED3  c9                   leave
2:AED4  ca0400               retf 4
2:AED7  db 00

; ---------------- sub_s2:AED8 FAR size=38 callers=2
2:AED8  55                   push bp
2:AED9  8bec                 mov bp, sp
2:AEDB  c45e06               les bx, ptr [bp + 6]
2:AEDE  268b5f04             mov bx, word ptr es:[bx + 4]
2:AEE2  8bc3                 mov ax, bx
2:AEE4  03db                 add bx, bx
2:AEE6  03d8                 add bx, ax
2:AEE8  03db                 add bx, bx
2:AEEA  83bfa40300           cmp word ptr [bx + 0x3a4], 0
2:AEEF  7407                 je 0xaef8
2:AEF1  b80100               mov ax, 1
2:AEF4  c9                   leave
2:AEF5  ca0400               retf 4
loc_AEF8:
2:AEF8  33c0                 xor ax, ax
2:AEFA  c9                   leave
2:AEFB  ca0400               retf 4

; ---------------- sub_s2:AEFE FAR size=58 callers=1
2:AEFE  55                   push bp
2:AEFF  8bec                 mov bp, sp
2:AF01  66ff7608             push dword ptr [bp + 8]
2:AF05  ff7606               push word ptr [bp + 6]
2:AF08  9ada4c2baf           lcall 0xaf2b, 0x4cda  ; sub_s4:4CDA
2:AF0D  c45e06               les bx, ptr [bp + 6]
2:AF10  26c7077caf           mov word ptr es:[bx], 0xaf7c
2:AF15  26c7470294ad         mov word ptr es:[bx + 2], 0xad94  ; SEGMENT s2:0000
2:AF1B  891e3042             mov word ptr [0x4230], bx
2:AF1F  8c063242             mov word ptr [0x4232], es
2:AF23  68b301               push 0x1b3
2:AF26  06                   push es
2:AF27  53                   push bx
2:AF28  9ace4dc49f           lcall 0x9fc4, 0x4dce  ; sub_s4:4DCE
2:AF2D  8b4606               mov ax, word ptr [bp + 6]
2:AF30  8b5608               mov dx, word ptr [bp + 8]
2:AF33  c9                   leave
2:AF34  ca0600               retf 6
2:AF37  db 00

; ---------------- sub_s2:AF38 FAR size=30 callers=1
2:AF38  55                   push bp
2:AF39  8bec                 mov bp, sp
2:AF3B  c45e06               les bx, ptr [bp + 6]
2:AF3E  26c7077caf           mov word ptr es:[bx], 0xaf7c
2:AF43  26c7470219af         mov word ptr es:[bx + 2], 0xaf19  ; SEGMENT s2:0000
2:AF49  66ff7606             push dword ptr [bp + 6]
2:AF4D  9a224d0baf           lcall 0xaf0b, 0x4d22  ; sub_s4:4D22
2:AF52  c9                   leave
2:AF53  ca0400               retf 4

; ---------------- sub_s2:AF56 FAR size=62 callers=0
2:AF56  55                   push bp
2:AF57  8bec                 mov bp, sp
2:AF59  66ff7606             push dword ptr [bp + 6]
2:AF5D  90                   nop
2:AF5E  0e                   push cs
2:AF5F  e8d6ff               call 0xaf38  ; sub_s2:AF38
2:AF62  f6460a01             test byte ptr [bp + 0xa], 1
2:AF66  7409                 je 0xaf71
2:AF68  66ff7606             push dword ptr [bp + 6]
2:AF6C  9ace177dad           lcall 0xad7d, 0x17ce  ; operator_delete@s1:17CE
loc_AF71:
2:AF71  8b4606               mov ax, word ptr [bp + 6]
2:AF74  8b5608               mov dx, word ptr [bp + 8]
2:AF77  c9                   leave
2:AF78  ca0600               retf 6
2:AF7B  db 90 56 af 47 af f2 1d 86 af ce 1d 8a af d4 1d 98
2:AF8B  db ad 04 4e 92 af 18 4f 50 af

; ---------------- sub_s2:AF94 FAR size=74 callers=1
2:AF94  55                   push bp
2:AF95  8bec                 mov bp, sp
2:AF97  66ff7608             push dword ptr [bp + 8]
2:AF9B  ff7606               push word ptr [bp + 6]
2:AF9E  9a481d82af           lcall 0xaf82, 0x1d48  ; sub_s3:1D48
2:AFA3  c45e06               les bx, ptr [bp + 6]
2:AFA6  662bc0               sub eax, eax
2:AFA9  662689470a           mov dword ptr es:[bx + 0xa], eax
2:AFAE  662689470e           mov dword ptr es:[bx + 0xe], eax
2:AFB3  6626894712           mov dword ptr es:[bx + 0x12], eax
2:AFB8  6626894716           mov dword ptr es:[bx + 0x16], eax
2:AFBD  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:AFC2  662689471e           mov dword ptr es:[bx + 0x1e], eax
2:AFC7  26894722             mov word ptr es:[bx + 0x22], ax
2:AFCB  26c707ccbd           mov word ptr es:[bx], 0xbdcc
2:AFD0  26c747027eaf         mov word ptr es:[bx + 2], 0xaf7e  ; SEGMENT s2:0000
2:AFD6  8bc3                 mov ax, bx
2:AFD8  8cc2                 mov dx, es
2:AFDA  c9                   leave
2:AFDB  ca0600               retf 6

; ---------------- sub_s2:AFDE FAR size=124 callers=1
2:AFDE  c8080000             enter 8, 0
2:AFE2  56                   push si
2:AFE3  c45e06               les bx, ptr [bp + 6]
2:AFE6  26c707ccbd           mov word ptr es:[bx], 0xbdcc
2:AFEB  26c74702d4af         mov word ptr es:[bx + 2], 0xafd4  ; SEGMENT s2:0000
2:AFF1  268b470a             mov ax, word ptr es:[bx + 0xa]
2:AFF5  268b570c             mov dx, word ptr es:[bx + 0xc]
2:AFF9  8bda                 mov bx, dx
2:AFFB  0bd0                 or dx, ax
2:AFFD  740e                 je 0xb00d
2:AFFF  6a01                 push 1
2:B001  53                   push bx
2:B002  50                   push ax
2:B003  8ec3                 mov es, bx
2:B005  8bf0                 mov si, ax
2:B007  26c41c               les bx, ptr es:[si]
2:B00A  26ff1f               lcall es:[bx]
loc_B00D:
2:B00D  c45e06               les bx, ptr [bp + 6]
2:B010  268b470e             mov ax, word ptr es:[bx + 0xe]
2:B014  268b5710             mov dx, word ptr es:[bx + 0x10]
2:B018  8bda                 mov bx, dx
2:B01A  0bd8                 or bx, ax
2:B01C  740e                 je 0xb02c
2:B01E  6a01                 push 1
2:B020  52                   push dx
2:B021  50                   push ax
2:B022  8ec2                 mov es, dx
2:B024  8bd8                 mov bx, ax
2:B026  26c41f               les bx, ptr es:[bx]
2:B029  26ff1f               lcall es:[bx]
loc_B02C:
2:B02C  c45e06               les bx, ptr [bp + 6]
2:B02F  268b4712             mov ax, word ptr es:[bx + 0x12]
2:B033  268b5714             mov dx, word ptr es:[bx + 0x14]
2:B037  8bda                 mov bx, dx
2:B039  0bd8                 or bx, ax
2:B03B  740e                 je 0xb04b
2:B03D  6a01                 push 1
2:B03F  52                   push dx
2:B040  50                   push ax
2:B041  8ec2                 mov es, dx
2:B043  8bd8                 mov bx, ax
2:B045  26c41f               les bx, ptr es:[bx]
2:B048  26ff1f               lcall es:[bx]
loc_B04B:
2:B04B  66ff7606             push dword ptr [bp + 6]
2:B04F  9a801da1af           lcall 0xafa1, 0x1d80  ; sub_s3:1D80
2:B054  5e                   pop si
2:B055  c9                   leave
2:B056  ca0400               retf 4
2:B059  db 00

; ---------------- sub_s2:B05A FAR size=50 callers=3
2:B05A  c8040000             enter 4, 0
2:B05E  c45e06               les bx, ptr [bp + 6]
2:B061  26c7079a38           mov word ptr es:[bx], 0x389a
2:B066  26c7470281b0         mov word ptr es:[bx + 2], 0xb081  ; SEGMENT s2:0000
2:B06C  c45e06               les bx, ptr [bp + 6]
2:B06F  6626c7470400000000   mov dword ptr es:[bx + 4], 0
2:B078  26c707c8bd           mov word ptr es:[bx], 0xbdc8
2:B07D  26c74702efaf         mov word ptr es:[bx + 2], 0xafef  ; SEGMENT s2:0000
2:B083  8bc3                 mov ax, bx
2:B085  8cc2                 mov dx, es
2:B087  c9                   leave
2:B088  ca0400               retf 4
2:B08B  db 00

; ---------------- sub_s2:B08C FAR size=48 callers=4
2:B08C  c8080000             enter 8, 0
2:B090  c45e06               les bx, ptr [bp + 6]
2:B093  26c707c8bd           mov word ptr es:[bx], 0xbdc8
2:B098  26c74702b6b0         mov word ptr es:[bx + 2], 0xb0b6  ; SEGMENT s2:0000
2:B09E  66268b4704           mov eax, dword ptr es:[bx + 4]
2:B0A3  6650                 push eax
2:B0A5  9ace176faf           lcall 0xaf6f, 0x17ce  ; operator_delete@s1:17CE
2:B0AA  c45e06               les bx, ptr [bp + 6]
2:B0AD  26c7079a38           mov word ptr es:[bx], 0x389a
2:B0B2  26c747026ab0         mov word ptr es:[bx + 2], 0xb06a  ; SEGMENT s2:0000
2:B0B8  c9                   leave
2:B0B9  ca0400               retf 4

; ---------------- sub_s2:B0BC FAR size=54 callers=3
2:B0BC  55                   push bp
2:B0BD  8bec                 mov bp, sp
2:B0BF  66ff7606             push dword ptr [bp + 6]
2:B0C3  90                   nop
2:B0C4  0e                   push cs
2:B0C5  e892ff               call 0xb05a  ; sub_s2:B05A
2:B0C8  c45e06               les bx, ptr [bp + 6]
2:B0CB  662bc0               sub eax, eax
2:B0CE  26894708             mov word ptr es:[bx + 8], ax
2:B0D2  662689470a           mov dword ptr es:[bx + 0xa], eax
2:B0D7  2689470e             mov word ptr es:[bx + 0xe], ax
2:B0DB  26894710             mov word ptr es:[bx + 0x10], ax
2:B0DF  26c707c4bd           mov word ptr es:[bx], 0xbdc4
2:B0E4  26c747029cb0         mov word ptr es:[bx + 2], 0xb09c  ; SEGMENT s2:0000
2:B0EA  8bc3                 mov ax, bx
2:B0EC  8cc2                 mov dx, es
2:B0EE  c9                   leave
2:B0EF  ca0400               retf 4

; ---------------- sub_s2:B0F2 FAR size=44 callers=1
2:B0F2  55                   push bp
2:B0F3  8bec                 mov bp, sp
2:B0F5  66ff7606             push dword ptr [bp + 6]
2:B0F9  90                   nop
2:B0FA  0e                   push cs
2:B0FB  e85cff               call 0xb05a  ; sub_s2:B05A
2:B0FE  c45e06               les bx, ptr [bp + 6]
2:B101  6626c7470800000000   mov dword ptr es:[bx + 8], 0
2:B10A  26c707c0bd           mov word ptr es:[bx], 0xbdc0
2:B10F  26c74702e8b0         mov word ptr es:[bx + 2], 0xb0e8  ; SEGMENT s2:0000
2:B115  8bc3                 mov ax, bx
2:B117  8cc2                 mov dx, es
2:B119  c9                   leave
2:B11A  ca0400               retf 4
2:B11D  db 00

; ---------------- sub_s2:B11E FAR size=40 callers=1
2:B11E  55                   push bp
2:B11F  8bec                 mov bp, sp
2:B121  66ff7606             push dword ptr [bp + 6]
2:B125  90                   nop
2:B126  0e                   push cs
2:B127  e830ff               call 0xb05a  ; sub_s2:B05A
2:B12A  c45e06               les bx, ptr [bp + 6]
2:B12D  26c747080000         mov word ptr es:[bx + 8], 0
2:B133  26c707dcbd           mov word ptr es:[bx], 0xbddc
2:B138  26c7470213b1         mov word ptr es:[bx + 2], 0xb113  ; SEGMENT s2:0000
2:B13E  8bc3                 mov ax, bx
2:B140  8cc2                 mov dx, es
2:B142  c9                   leave
2:B143  ca0400               retf 4

; ---------------- sub_s2:B146 FAR size=96 callers=1
2:B146  c8040000             enter 4, 0
2:B14A  c45e06               les bx, ptr [bp + 6]
2:B14D  6626837f1600         cmp dword ptr es:[bx + 0x16], 0
2:B153  744c                 je 0xb1a1
2:B155  26c45f16             les bx, ptr es:[bx + 0x16]
2:B159  6626ff770a           push dword ptr es:[bx + 0xa]
2:B15E  66ff364857           push dword ptr [0x5748]  ; g_sim
2:B163  9a44834477           lcall 0x7744, 0x8344  ; sub_s7:8344
2:B168  52                   push dx
2:B169  50                   push ax
2:B16A  9a0836fba2           lcall 0xa2fb, 0x3608  ; sub_s8:3608
2:B16F  c45e06               les bx, ptr [bp + 6]
2:B172  26c45f16             les bx, ptr es:[bx + 0x16]
2:B176  26c747080000         mov word ptr es:[bx + 8], 0
2:B17C  c45e06               les bx, ptr [bp + 6]
2:B17F  26c45f16             les bx, ptr es:[bx + 0x16]
2:B183  662bc0               sub eax, eax
2:B186  662689470a           mov dword ptr es:[bx + 0xa], eax
2:B18B  c45e06               les bx, ptr [bp + 6]
2:B18E  26c45f16             les bx, ptr es:[bx + 0x16]
2:B192  2689470e             mov word ptr es:[bx + 0xe], ax
2:B196  c45e06               les bx, ptr [bp + 6]
2:B199  26c45f16             les bx, ptr es:[bx + 0x16]
2:B19D  26894710             mov word ptr es:[bx + 0x10], ax
loc_B1A1:
2:B1A1  c9                   leave
2:B1A2  ca0400               retf 4
2:B1A5  db 00

; ---------------- sub_s2:B1A6 FAR size=74 callers=1
2:B1A6  c8080000             enter 8, 0
2:B1AA  c45e06               les bx, ptr [bp + 6]
2:B1AD  6626837f1600         cmp dword ptr es:[bx + 0x16], 0
2:B1B3  7437                 je 0xb1ec
2:B1B5  26c45f16             les bx, ptr es:[bx + 0x16]
2:B1B9  66268b4704           mov eax, dword ptr es:[bx + 4]
2:B1BE  6650                 push eax
2:B1C0  9ace17a8b0           lcall 0xb0a8, 0x17ce  ; operator_delete@s1:17CE
2:B1C5  83c404               add sp, 4
2:B1C8  66ff760a             push dword ptr [bp + 0xa]
2:B1CC  90                   nop
2:B1CD  0e                   push cs
2:B1CE  e817af               call 0x60e8  ; sub_s2:60E8
2:B1D1  c45e06               les bx, ptr [bp + 6]
2:B1D4  26c45f16             les bx, ptr es:[bx + 0x16]
2:B1D8  26894704             mov word ptr es:[bx + 4], ax
2:B1DC  26895706             mov word ptr es:[bx + 6], dx
2:B1E0  c45e06               les bx, ptr [bp + 6]
2:B1E3  6626c7471600000000   mov dword ptr es:[bx + 0x16], 0
loc_B1EC:
2:B1EC  c9                   leave
2:B1ED  ca0800               retf 8

; ---------------- sub_s2:B1F0 FAR size=16 callers=1
2:B1F0  683105               push 0x531
2:B1F3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:B1F8  9a7e8452b0           lcall 0xb052, 0x847e  ; LoadStringRes@s3:847E
2:B1FD  ca0400               retf 4

; ---------------- sub_s2:B200 FAR size=320 callers=2
2:B200  c82a0000             enter 0x2a, 0
2:B204  c45e06               les bx, ptr [bp + 6]
2:B207  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
2:B20D  740d                 je 0xb21c
2:B20F  268b470e             mov ax, word ptr es:[bx + 0xe]
2:B213  268b5710             mov dx, word ptr es:[bx + 0x10]
2:B217  c9                   leave
2:B218  ca0400               retf 4
2:B21B  db 90
loc_B21C:
2:B21C  268b470e             mov ax, word ptr es:[bx + 0xe]
2:B220  268b5710             mov dx, word ptr es:[bx + 0x10]
2:B224  8bda                 mov bx, dx
2:B226  8946e2               mov word ptr [bp - 0x1e], ax
2:B229  8956e4               mov word ptr [bp - 0x1c], dx
2:B22C  8946e6               mov word ptr [bp - 0x1a], ax
2:B22F  8956e8               mov word ptr [bp - 0x18], dx
2:B232  0bd8                 or bx, ax
2:B234  740e                 je 0xb244
2:B236  6a01                 push 1
2:B238  52                   push dx
2:B239  50                   push ax
2:B23A  8ec2                 mov es, dx
2:B23C  8bd8                 mov bx, ax
2:B23E  26c41f               les bx, ptr es:[bx]
2:B241  26ff1f               lcall es:[bx]
loc_B244:
2:B244  6a0c                 push 0xc
2:B246  9a9c17bfb2           lcall 0xb2bf, 0x179c  ; operator_new@s1:179C
2:B24B  83c402               add sp, 2
2:B24E  8946e2               mov word ptr [bp - 0x1e], ax
2:B251  8956e4               mov word ptr [bp - 0x1c], dx
2:B254  0bd0                 or dx, ax
2:B256  740c                 je 0xb264
2:B258  ff76e4               push word ptr [bp - 0x1c]
2:B25B  50                   push ax
2:B25C  90                   nop
2:B25D  0e                   push cs
2:B25E  e8e9a4               call 0x574a  ; sub_s2:574A
2:B261  eb04                 jmp 0xb267
2:B263  db 90
loc_B264:
2:B264  33c0                 xor ax, ax
2:B266  99                   cdq
loc_B267:
2:B267  c45e06               les bx, ptr [bp + 6]
2:B26A  2689470e             mov word ptr es:[bx + 0xe], ax
2:B26E  26895710             mov word ptr es:[bx + 0x10], dx
2:B272  666800000004         push 0x4000000
2:B278  6a01                 push 1
2:B27A  8d46ee               lea ax, [bp - 0x12]
2:B27D  16                   push ss
2:B27E  50                   push ax
2:B27F  9a52dc8cb2           lcall 0xb28c, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_B284:
2:B284  8d46ee               lea ax, [bp - 0x12]
2:B287  16                   push ss
2:B288  50                   push ax
2:B289  9aece4cca2           lcall 0xa2cc, 0xe4ec  ; DbIter::next@s6:E4EC
2:B28E  8946ea               mov word ptr [bp - 0x16], ax
2:B291  8956ec               mov word ptr [bp - 0x14], dx
2:B294  0bd0                 or dx, ax
2:B296  0f848800             je 0xb322
2:B29A  c45eea               les bx, ptr [bp - 0x16]
2:B29D  66268b870002         mov eax, dword ptr es:[bx + 0x200]
2:B2A3  668946de             mov dword ptr [bp - 0x22], eax
2:B2A7  66268b4704           mov eax, dword ptr es:[bx + 4]
2:B2AC  668946da             mov dword ptr [bp - 0x26], eax
2:B2B0  66817ede01000008     cmp dword ptr [bp - 0x22], 0x8000001
2:B2B8  75ca                 jne 0xb284
2:B2BA  6a0c                 push 0xc
2:B2BC  9a9c17c3b1           lcall 0xb1c3, 0x179c  ; operator_new@s1:179C
2:B2C1  83c402               add sp, 2
2:B2C4  8946e6               mov word ptr [bp - 0x1a], ax
2:B2C7  8956e8               mov word ptr [bp - 0x18], dx
2:B2CA  0bd0                 or dx, ax
2:B2CC  740c                 je 0xb2da
2:B2CE  ff76e8               push word ptr [bp - 0x18]
2:B2D1  50                   push ax
2:B2D2  90                   nop
2:B2D3  0e                   push cs
2:B2D4  e81bfe               call 0xb0f2  ; sub_s2:B0F2
2:B2D7  eb04                 jmp 0xb2dd
2:B2D9  db 90
loc_B2DA:
2:B2DA  33c0                 xor ax, ax
2:B2DC  99                   cdq
loc_B2DD:
2:B2DD  8946d6               mov word ptr [bp - 0x2a], ax
2:B2E0  8956d8               mov word ptr [bp - 0x28], dx
2:B2E3  66ff76ea             push dword ptr [bp - 0x16]
2:B2E7  9a284d6db1           lcall 0xb16d, 0x4d28  ; sub_s8:4D28
2:B2EC  52                   push dx
2:B2ED  50                   push ax
2:B2EE  90                   nop
2:B2EF  0e                   push cs
2:B2F0  e8f5ad               call 0x60e8  ; sub_s2:60E8
2:B2F3  83c404               add sp, 4
2:B2F6  c45ed6               les bx, ptr [bp - 0x2a]
2:B2F9  26894704             mov word ptr es:[bx + 4], ax
2:B2FD  26895706             mov word ptr es:[bx + 6], dx
2:B301  668b46da             mov eax, dword ptr [bp - 0x26]
2:B305  6626894708           mov dword ptr es:[bx + 8], eax
2:B30A  06                   push es
2:B30B  53                   push bx
2:B30C  c45e06               les bx, ptr [bp + 6]
2:B30F  6626ff770e           push dword ptr es:[bx + 0xe]
2:B314  26c45f0e             les bx, ptr es:[bx + 0xe]
2:B318  26c41f               les bx, ptr es:[bx]
2:B31B  26ff5f08             lcall es:[bx + 8]
2:B31F  e962ff               jmp 0xb284
loc_B322:
2:B322  c45e06               les bx, ptr [bp + 6]
2:B325  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:B32A  268b5710             mov dx, word ptr es:[bx + 0x10]
2:B32E  668946e2             mov dword ptr [bp - 0x1e], eax
2:B332  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
2:B337  c746f03cb1           mov word ptr [bp - 0x10], 0xb13c  ; SEGMENT s2:0000
2:B33C  c9                   leave
2:B33D  ca0400               retf 4

; ---------------- sub_s2:B340 FAR size=38 callers=2
2:B340  55                   push bp
2:B341  8bec                 mov bp, sp
2:B343  c45e06               les bx, ptr [bp + 6]
2:B346  6626837f1600         cmp dword ptr es:[bx + 0x16], 0
2:B34C  7410                 je 0xb35e
2:B34E  26c45f16             les bx, ptr es:[bx + 0x16]
2:B352  268b4704             mov ax, word ptr es:[bx + 4]
2:B356  268b5706             mov dx, word ptr es:[bx + 6]
2:B35A  c9                   leave
2:B35B  ca0400               retf 4
loc_B35E:
2:B35E  33c0                 xor ax, ax
2:B360  99                   cdq
2:B361  c9                   leave
2:B362  ca0400               retf 4
2:B365  db 00

; ---------------- sub_s2:B366 FAR size=38 callers=2
2:B366  55                   push bp
2:B367  8bec                 mov bp, sp
2:B369  c45e06               les bx, ptr [bp + 6]
2:B36C  6626837f1a00         cmp dword ptr es:[bx + 0x1a], 0
2:B372  7410                 je 0xb384
2:B374  26c45f1a             les bx, ptr es:[bx + 0x1a]
2:B378  268b4704             mov ax, word ptr es:[bx + 4]
2:B37C  268b5706             mov dx, word ptr es:[bx + 6]
2:B380  c9                   leave
2:B381  ca0400               retf 4
loc_B384:
2:B384  33c0                 xor ax, ax
2:B386  99                   cdq
2:B387  c9                   leave
2:B388  ca0400               retf 4
2:B38B  db 00

; ---------------- sub_s2:B38C FAR size=238 callers=2
2:B38C  c8180000             enter 0x18, 0
2:B390  c45e06               les bx, ptr [bp + 6]
2:B393  6626837f1200         cmp dword ptr es:[bx + 0x12], 0
2:B399  0f85cd00             jne 0xb46a
2:B39D  6a0c                 push 0xc
2:B39F  9a9c174fb4           lcall 0xb44f, 0x179c  ; operator_new@s1:179C
2:B3A4  83c402               add sp, 2
2:B3A7  8956fc               mov word ptr [bp - 4], dx
2:B3AA  0bd0                 or dx, ax
2:B3AC  7416                 je 0xb3c4
2:B3AE  ff76fc               push word ptr [bp - 4]
2:B3B1  50                   push ax
2:B3B2  90                   nop
2:B3B3  0e                   push cs
2:B3B4  e893a3               call 0x574a  ; sub_s2:574A
2:B3B7  c45e06               les bx, ptr [bp + 6]
2:B3BA  26894712             mov word ptr es:[bx + 0x12], ax
2:B3BE  26895714             mov word ptr es:[bx + 0x14], dx
2:B3C2  eb0c                 jmp 0xb3d0
loc_B3C4:
2:B3C4  c45e06               les bx, ptr [bp + 6]
2:B3C7  6626c7471200000000   mov dword ptr es:[bx + 0x12], 0
loc_B3D0:
2:B3D0  c746fed906           mov word ptr [bp - 2], 0x6d9
2:B3D5  eb44                 jmp 0xb41b
2:B3D7  db 90
loc_B3D8:
2:B3D8  33c0                 xor ax, ax
2:B3DA  99                   cdq
loc_B3DB:
2:B3DB  8946f6               mov word ptr [bp - 0xa], ax
2:B3DE  8956f8               mov word ptr [bp - 8], dx
2:B3E1  ff76fe               push word ptr [bp - 2]
2:B3E4  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:B3E9  9aac84fbb1           lcall 0xb1fb, 0x84ac  ; sub_s3:84AC
2:B3EE  c45ef6               les bx, ptr [bp - 0xa]
2:B3F1  26894704             mov word ptr es:[bx + 4], ax
2:B3F5  26895706             mov word ptr es:[bx + 6], dx
2:B3F9  8b46fe               mov ax, word ptr [bp - 2]
2:B3FC  2dd806               sub ax, 0x6d8
2:B3FF  26894708             mov word ptr es:[bx + 8], ax
2:B403  06                   push es
2:B404  53                   push bx
2:B405  c45e06               les bx, ptr [bp + 6]
2:B408  6626ff7712           push dword ptr es:[bx + 0x12]
2:B40D  26c45f12             les bx, ptr es:[bx + 0x12]
2:B411  26c41f               les bx, ptr es:[bx]
2:B414  26ff5f08             lcall es:[bx + 8]
loc_B418:
2:B418  ff46fe               inc word ptr [bp - 2]
loc_B41B:
2:B41B  817efee606           cmp word ptr [bp - 2], 0x6e6
2:B420  7f48                 jg 0xb46a
2:B422  817efee306           cmp word ptr [bp - 2], 0x6e3
2:B427  7521                 jne 0xb44a
2:B429  666801000008         push 0x8000001
2:B42F  66ff364857           push dword ptr [0x5748]  ; g_sim
2:B434  9a448366b1           lcall 0xb166, 0x8344  ; sub_s7:8344
2:B439  8946f2               mov word ptr [bp - 0xe], ax
2:B43C  8956f4               mov word ptr [bp - 0xc], dx
2:B43F  c45ef2               les bx, ptr [bp - 0xe]
2:B442  2683bf360100         cmp word ptr es:[bx + 0x136], 0
2:B448  74ce                 je 0xb418
loc_B44A:
2:B44A  6a0a                 push 0xa
2:B44C  9a9c1749b2           lcall 0xb249, 0x179c  ; operator_new@s1:179C
2:B451  83c402               add sp, 2
2:B454  8956fc               mov word ptr [bp - 4], dx
2:B457  0bd0                 or dx, ax
2:B459  0f847bff             je 0xb3d8
2:B45D  ff76fc               push word ptr [bp - 4]
2:B460  50                   push ax
2:B461  90                   nop
2:B462  0e                   push cs
2:B463  e8b8fc               call 0xb11e  ; sub_s2:B11E
2:B466  e972ff               jmp 0xb3db
2:B469  db 90
loc_B46A:
2:B46A  c45e06               les bx, ptr [bp + 6]
2:B46D  268b4712             mov ax, word ptr es:[bx + 0x12]
2:B471  268b5714             mov dx, word ptr es:[bx + 0x14]
2:B475  c9                   leave
2:B476  ca0400               retf 4
2:B479  db 00

; ---------------- sub_s2:B47A FAR size=38 callers=2
2:B47A  55                   push bp
2:B47B  8bec                 mov bp, sp
2:B47D  c45e06               les bx, ptr [bp + 6]
2:B480  6626837f1e00         cmp dword ptr es:[bx + 0x1e], 0
2:B486  7410                 je 0xb498
2:B488  26c45f1e             les bx, ptr es:[bx + 0x1e]
2:B48C  268b4704             mov ax, word ptr es:[bx + 4]
2:B490  268b5706             mov dx, word ptr es:[bx + 6]
2:B494  c9                   leave
2:B495  ca0400               retf 4
loc_B498:
2:B498  33c0                 xor ax, ax
2:B49A  99                   cdq
2:B49B  c9                   leave
2:B49C  ca0400               retf 4
2:B49F  db 00

; ---------------- sub_s2:B4A0 FAR size=164 callers=1
2:B4A0  55                   push bp
2:B4A1  8bec                 mov bp, sp
2:B4A3  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:B4A8  741a                 je 0xb4c4
2:B4AA  66ff760a             push dword ptr [bp + 0xa]
2:B4AE  66ff7606             push dword ptr [bp + 6]
2:B4B2  90                   nop
2:B4B3  0e                   push cs
2:B4B4  e81705               call 0xb9ce  ; sub_s2:B9CE
2:B4B7  c45e06               les bx, ptr [bp + 6]
2:B4BA  26894716             mov word ptr es:[bx + 0x16], ax
2:B4BE  26895718             mov word ptr es:[bx + 0x18], dx
2:B4C2  eb0c                 jmp 0xb4d0
loc_B4C4:
2:B4C4  c45e06               les bx, ptr [bp + 6]
2:B4C7  6626c7471600000000   mov dword ptr es:[bx + 0x16], 0
loc_B4D0:
2:B4D0  c45e06               les bx, ptr [bp + 6]
2:B4D3  26c45f16             les bx, ptr es:[bx + 0x16]
2:B4D7  26837f0800           cmp word ptr es:[bx + 8], 0
2:B4DC  7452                 je 0xb530
2:B4DE  66ff7606             push dword ptr [bp + 6]
2:B4E2  90                   nop
2:B4E3  0e                   push cs
2:B4E4  e819fd               call 0xb200  ; sub_s2:B200
2:B4E7  66ff7606             push dword ptr [bp + 6]
2:B4EB  90                   nop
2:B4EC  0e                   push cs
2:B4ED  e89cfe               call 0xb38c  ; sub_s2:B38C
2:B4F0  c45e06               les bx, ptr [bp + 6]
2:B4F3  26c45f16             les bx, ptr es:[bx + 0x16]
2:B4F7  6626ff770a           push dword ptr es:[bx + 0xa]
2:B4FC  66ff7606             push dword ptr [bp + 6]
2:B500  90                   nop
2:B501  0e                   push cs
2:B502  e85703               call 0xb85c  ; sub_s2:B85C
2:B505  c45e06               les bx, ptr [bp + 6]
2:B508  2689471a             mov word ptr es:[bx + 0x1a], ax
2:B50C  2689571c             mov word ptr es:[bx + 0x1c], dx
2:B510  26c45f16             les bx, ptr es:[bx + 0x16]
2:B514  26ff770e             push word ptr es:[bx + 0xe]
2:B518  66ff7606             push dword ptr [bp + 6]
2:B51C  90                   nop
2:B51D  0e                   push cs
2:B51E  e88b03               call 0xb8ac  ; sub_s2:B8AC
2:B521  c45e06               les bx, ptr [bp + 6]
2:B524  2689471e             mov word ptr es:[bx + 0x1e], ax
2:B528  26895720             mov word ptr es:[bx + 0x20], dx
2:B52C  c9                   leave
2:B52D  ca0800               retf 8
loc_B530:
2:B530  c45e06               les bx, ptr [bp + 6]
2:B533  662bc0               sub eax, eax
2:B536  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:B53B  662689471e           mov dword ptr es:[bx + 0x1e], eax
2:B540  c9                   leave
2:B541  ca0800               retf 8

; ---------------- sub_s2:B544 FAR size=214 callers=1
2:B544  c80c0000             enter 0xc, 0
2:B548  56                   push si
2:B549  837e0a00             cmp word ptr [bp + 0xa], 0
2:B54D  7460                 je 0xb5af
2:B54F  c45e06               les bx, ptr [bp + 6]
2:B552  6626837f1a00         cmp dword ptr es:[bx + 0x1a], 0
2:B558  7455                 je 0xb5af
2:B55A  26c45f16             les bx, ptr es:[bx + 0x16]
2:B55E  26c747080100         mov word ptr es:[bx + 8], 1
2:B564  c45e06               les bx, ptr [bp + 6]
2:B567  26c45f1a             les bx, ptr es:[bx + 0x1a]
2:B56B  66268b4708           mov eax, dword ptr es:[bx + 8]
2:B570  c45e06               les bx, ptr [bp + 6]
2:B573  26c45f16             les bx, ptr es:[bx + 0x16]
2:B577  662689470a           mov dword ptr es:[bx + 0xa], eax
2:B57C  c45e06               les bx, ptr [bp + 6]
2:B57F  26c45f1e             les bx, ptr es:[bx + 0x1e]
2:B583  268b4708             mov ax, word ptr es:[bx + 8]
2:B587  c45e06               les bx, ptr [bp + 6]
2:B58A  26c45f16             les bx, ptr es:[bx + 0x16]
2:B58E  2689470e             mov word ptr es:[bx + 0xe], ax
2:B592  c45e06               les bx, ptr [bp + 6]
2:B595  26c45f16             les bx, ptr es:[bx + 0x16]
2:B599  6626ff770a           push dword ptr es:[bx + 0xa]
2:B59E  66ff364857           push dword ptr [0x5748]  ; g_sim
2:B5A3  9a448337b4           lcall 0xb437, 0x8344  ; sub_s7:8344
2:B5A8  52                   push dx
2:B5A9  50                   push ax
2:B5AA  9a0836eab2           lcall 0xb2ea, 0x3608  ; sub_s8:3608
loc_B5AF:
2:B5AF  c45e06               les bx, ptr [bp + 6]
2:B5B2  662bc0               sub eax, eax
2:B5B5  662689471e           mov dword ptr es:[bx + 0x1e], eax
2:B5BA  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:B5BF  6626894716           mov dword ptr es:[bx + 0x16], eax
2:B5C4  268b470e             mov ax, word ptr es:[bx + 0xe]
2:B5C8  268b5710             mov dx, word ptr es:[bx + 0x10]
2:B5CC  8bda                 mov bx, dx
2:B5CE  0bd0                 or dx, ax
2:B5D0  740e                 je 0xb5e0
2:B5D2  6a01                 push 1
2:B5D4  53                   push bx
2:B5D5  50                   push ax
2:B5D6  8ec3                 mov es, bx
2:B5D8  8bf0                 mov si, ax
2:B5DA  26c41c               les bx, ptr es:[si]
2:B5DD  26ff1f               lcall es:[bx]
loc_B5E0:
2:B5E0  c45e06               les bx, ptr [bp + 6]
2:B5E3  6626c7470e00000000   mov dword ptr es:[bx + 0xe], 0
2:B5EC  268b4712             mov ax, word ptr es:[bx + 0x12]
2:B5F0  268b5714             mov dx, word ptr es:[bx + 0x14]
2:B5F4  8bda                 mov bx, dx
2:B5F6  0bd0                 or dx, ax
2:B5F8  740e                 je 0xb608
2:B5FA  6a01                 push 1
2:B5FC  53                   push bx
2:B5FD  50                   push ax
2:B5FE  8ec3                 mov es, bx
2:B600  8bf0                 mov si, ax
2:B602  26c41c               les bx, ptr es:[si]
2:B605  26ff1f               lcall es:[bx]
loc_B608:
2:B608  c45e06               les bx, ptr [bp + 6]
2:B60B  6626c7471200000000   mov dword ptr es:[bx + 0x12], 0
2:B614  5e                   pop si
2:B615  c9                   leave
2:B616  ca0600               retf 6
2:B619  db 00

; ---------------- sub_s2:B61A FAR size=32 callers=2
2:B61A  55                   push bp
2:B61B  8bec                 mov bp, sp
2:B61D  66ff760a             push dword ptr [bp + 0xa]
2:B621  66ff7606             push dword ptr [bp + 6]
2:B625  90                   nop
2:B626  0e                   push cs
2:B627  e8d002               call 0xb8fa  ; sub_s2:B8FA
2:B62A  c45e06               les bx, ptr [bp + 6]
2:B62D  2689471a             mov word ptr es:[bx + 0x1a], ax
2:B631  2689571c             mov word ptr es:[bx + 0x1c], dx
2:B635  c9                   leave
2:B636  ca0800               retf 8
2:B639  db 00

; ---------------- sub_s2:B63A FAR size=32 callers=2
2:B63A  55                   push bp
2:B63B  8bec                 mov bp, sp
2:B63D  66ff760a             push dword ptr [bp + 0xa]
2:B641  66ff7606             push dword ptr [bp + 6]
2:B645  90                   nop
2:B646  0e                   push cs
2:B647  e81a03               call 0xb964  ; sub_s2:B964
2:B64A  c45e06               les bx, ptr [bp + 6]
2:B64D  2689471e             mov word ptr es:[bx + 0x1e], ax
2:B651  26895720             mov word ptr es:[bx + 0x20], dx
2:B655  c9                   leave
2:B656  ca0800               retf 8
2:B659  db 00

; ---------------- sub_s2:B65A FAR size=66 callers=1
2:B65A  c8040000             enter 4, 0
2:B65E  66ff760e             push dword ptr [bp + 0xe]
2:B662  66ff7606             push dword ptr [bp + 6]
2:B666  90                   nop
2:B667  0e                   push cs
2:B668  e86303               call 0xb9ce  ; sub_s2:B9CE
2:B66B  8946fc               mov word ptr [bp - 4], ax
2:B66E  8956fe               mov word ptr [bp - 2], dx
2:B671  0bd0                 or dx, ax
2:B673  740a                 je 0xb67f
2:B675  c45efc               les bx, ptr [bp - 4]
2:B678  26837f0801           cmp word ptr es:[bx + 8], 1
2:B67D  7405                 je 0xb684
loc_B67F:
2:B67F  683404               push 0x434
2:B682  eb03                 jmp 0xb687
loc_B684:
2:B684  683504               push 0x435
loc_B687:
2:B687  66ff760a             push dword ptr [bp + 0xa]
2:B68B  68ff03               push 0x3ff
2:B68E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:B693  9ae084ecb3           lcall 0xb3ec, 0x84e0  ; sub_s3:84E0
2:B698  c9                   leave
2:B699  ca0c00               retf 0xc

; ---------------- sub_s2:B69C FAR size=238 callers=1
;   apis: USER._wsprintf
2:B69C  c80a0200             enter 0x20a, 0
2:B6A0  68e706               push 0x6e7
2:B6A3  8d8600fe             lea ax, [bp - 0x200]
2:B6A7  16                   push ss
2:B6A8  50                   push ax
2:B6A9  680001               push 0x100
2:B6AC  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:B6B1  9ae08496b6           lcall 0xb696, 0x84e0  ; sub_s3:84E0
2:B6B6  c45e06               les bx, ptr [bp + 6]
2:B6B9  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:B6BF  0f85c200             jne 0xb785
2:B6C3  6a0c                 push 0xc
2:B6C5  9a9c175eb7           lcall 0xb75e, 0x179c  ; operator_new@s1:179C
2:B6CA  83c402               add sp, 2
2:B6CD  8986fafd             mov word ptr [bp - 0x206], ax
2:B6D1  8996fcfd             mov word ptr [bp - 0x204], dx
2:B6D5  0bd0                 or dx, ax
2:B6D7  740d                 je 0xb6e6
2:B6D9  ffb6fcfd             push word ptr [bp - 0x204]
2:B6DD  50                   push ax
2:B6DE  90                   nop
2:B6DF  0e                   push cs
2:B6E0  e867a0               call 0x574a  ; sub_s2:574A
2:B6E3  eb04                 jmp 0xb6e9
2:B6E5  db 90
loc_B6E6:
2:B6E6  33c0                 xor ax, ax
2:B6E8  99                   cdq
loc_B6E9:
2:B6E9  c45e06               les bx, ptr [bp + 6]
2:B6EC  2689470a             mov word ptr es:[bx + 0xa], ax
2:B6F0  2689570c             mov word ptr es:[bx + 0xc], dx
2:B6F4  c786fefd0100         mov word ptr [bp - 0x202], 1
2:B6FA  eb56                 jmp 0xb752
loc_B6FC:
2:B6FC  33c0                 xor ax, ax
2:B6FE  99                   cdq
loc_B6FF:
2:B6FF  8986f6fd             mov word ptr [bp - 0x20a], ax
2:B703  8996f8fd             mov word ptr [bp - 0x208], dx
2:B707  ffb6fefd             push word ptr [bp - 0x202]
2:B70B  8d8600fe             lea ax, [bp - 0x200]
2:B70F  16                   push ss
2:B710  50                   push ax
2:B711  8d8600ff             lea ax, [bp - 0x100]
2:B715  16                   push ss
2:B716  50                   push ax
2:B717  9affff0000           lcall 0, 0xffff  ; USER._wsprintf
2:B71C  83c40a               add sp, 0xa
2:B71F  8d8600ff             lea ax, [bp - 0x100]
2:B723  16                   push ss
2:B724  50                   push ax
2:B725  90                   nop
2:B726  0e                   push cs
2:B727  e8bea9               call 0x60e8  ; sub_s2:60E8
2:B72A  83c404               add sp, 4
2:B72D  c49ef6fd             les bx, ptr [bp - 0x20a]
2:B731  26894704             mov word ptr es:[bx + 4], ax
2:B735  26895706             mov word ptr es:[bx + 6], dx
2:B739  06                   push es
2:B73A  53                   push bx
2:B73B  c45e06               les bx, ptr [bp + 6]
2:B73E  6626ff770a           push dword ptr es:[bx + 0xa]
2:B743  26c45f0a             les bx, ptr es:[bx + 0xa]
2:B747  26c41f               les bx, ptr es:[bx]
2:B74A  26ff5f08             lcall es:[bx + 8]
2:B74E  ff86fefd             inc word ptr [bp - 0x202]
loc_B752:
2:B752  83befefd05           cmp word ptr [bp - 0x202], 5
2:B757  7f23                 jg 0xb77c
2:B759  6a12                 push 0x12  ; 'version %d %d'
2:B75B  9a9c17a2b3           lcall 0xb3a2, 0x179c  ; operator_new@s1:179C
2:B760  83c402               add sp, 2
2:B763  8986fafd             mov word ptr [bp - 0x206], ax
2:B767  8996fcfd             mov word ptr [bp - 0x204], dx
2:B76B  0bd0                 or dx, ax
2:B76D  748d                 je 0xb6fc
2:B76F  ffb6fcfd             push word ptr [bp - 0x204]
2:B773  50                   push ax
2:B774  90                   nop
2:B775  0e                   push cs
2:B776  e843f9               call 0xb0bc  ; sub_s2:B0BC
2:B779  eb84                 jmp 0xb6ff
2:B77B  db 90
loc_B77C:
2:B77C  c45e06               les bx, ptr [bp + 6]
2:B77F  26c747220500         mov word ptr es:[bx + 0x22], 5
loc_B785:
2:B785  c9                   leave
2:B786  ca0400               retf 4
2:B789  db 00

; ---------------- sub_s2:B78A FAR size=150 callers=1
;   apis: USER._wsprintf
2:B78A  c8080200             enter 0x208, 0
2:B78E  6a12                 push 0x12  ; 'version %d %d'
2:B790  9a9c17c8b6           lcall 0xb6c8, 0x179c  ; operator_new@s1:179C
2:B795  83c402               add sp, 2
2:B798  8986f8fd             mov word ptr [bp - 0x208], ax
2:B79C  8996fafd             mov word ptr [bp - 0x206], dx
2:B7A0  0bd0                 or dx, ax
2:B7A2  740c                 je 0xb7b0
2:B7A4  ffb6fafd             push word ptr [bp - 0x206]
2:B7A8  50                   push ax
2:B7A9  90                   nop
2:B7AA  0e                   push cs
2:B7AB  e80ef9               call 0xb0bc  ; sub_s2:B0BC
2:B7AE  eb03                 jmp 0xb7b3
loc_B7B0:
2:B7B0  33c0                 xor ax, ax
2:B7B2  99                   cdq
loc_B7B3:
2:B7B3  8946fc               mov word ptr [bp - 4], ax
2:B7B6  8956fe               mov word ptr [bp - 2], dx
2:B7B9  68e706               push 0x6e7
2:B7BC  8d86fcfd             lea ax, [bp - 0x204]
2:B7C0  16                   push ss
2:B7C1  50                   push ax
2:B7C2  680001               push 0x100
2:B7C5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:B7CA  9ae084b4b6           lcall 0xb6b4, 0x84e0  ; sub_s3:84E0
2:B7CF  c45e06               les bx, ptr [bp + 6]
2:B7D2  26ff4722             inc word ptr es:[bx + 0x22]
2:B7D6  26ff7722             push word ptr es:[bx + 0x22]
2:B7DA  8d86fcfd             lea ax, [bp - 0x204]
2:B7DE  16                   push ss
2:B7DF  50                   push ax
2:B7E0  8d86fcfe             lea ax, [bp - 0x104]
2:B7E4  16                   push ss
2:B7E5  50                   push ax
2:B7E6  9a18b70000           lcall 0, 0xb718  ; USER._wsprintf
2:B7EB  83c40a               add sp, 0xa
2:B7EE  8d86fcfe             lea ax, [bp - 0x104]
2:B7F2  16                   push ss
2:B7F3  50                   push ax
2:B7F4  90                   nop
2:B7F5  0e                   push cs
2:B7F6  e8efa8               call 0x60e8  ; sub_s2:60E8
2:B7F9  83c404               add sp, 4
2:B7FC  c45efc               les bx, ptr [bp - 4]
2:B7FF  26894704             mov word ptr es:[bx + 4], ax
2:B803  26895706             mov word ptr es:[bx + 6], dx
2:B807  06                   push es
2:B808  53                   push bx
2:B809  c45e06               les bx, ptr [bp + 6]
2:B80C  6626ff770a           push dword ptr es:[bx + 0xa]
2:B811  26c45f0a             les bx, ptr es:[bx + 0xa]
2:B815  26c41f               les bx, ptr es:[bx]
2:B818  26ff5f08             lcall es:[bx + 8]
2:B81C  c9                   leave
2:B81D  ca0400               retf 4

; ---------------- sub_s2:B820 FAR size=60 callers=5
2:B820  c80e0000             enter 0xe, 0
2:B824  666801000008         push 0x8000001
2:B82A  66ff364857           push dword ptr [0x5748]  ; g_sim
2:B82F  9a4483a6b5           lcall 0xb5a6, 0x8344  ; sub_s7:8344
2:B834  8946fc               mov word ptr [bp - 4], ax
2:B837  8956fe               mov word ptr [bp - 2], dx
2:B83A  c45efc               les bx, ptr [bp - 4]
2:B83D  2683bf520100         cmp word ptr es:[bx + 0x152], 0
2:B843  7507                 jne 0xb84c
2:B845  33c0                 xor ax, ax
2:B847  99                   cdq
2:B848  c9                   leave
2:B849  ca0400               retf 4
loc_B84C:
2:B84C  c45e06               les bx, ptr [bp + 6]
2:B84F  268b470a             mov ax, word ptr es:[bx + 0xa]
2:B853  268b570c             mov dx, word ptr es:[bx + 0xc]
2:B857  c9                   leave
2:B858  ca0400               retf 4
2:B85B  db 00

; ---------------- sub_s2:B85C FAR size=80 callers=1
2:B85C  c8100000             enter 0x10, 0
2:B860  c45e06               les bx, ptr [bp + 6]
2:B863  6626ff770e           push dword ptr es:[bx + 0xe]
2:B868  8d46f8               lea ax, [bp - 8]
2:B86B  16                   push ss
2:B86C  50                   push ax
2:B86D  90                   nop
2:B86E  0e                   push cs
2:B86F  e8129f               call 0x5784  ; ListIter::ListIter@s2:5784
2:B872  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_B87A:
2:B87A  8d46f8               lea ax, [bp - 8]
2:B87D  16                   push ss
2:B87E  50                   push ax
2:B87F  90                   nop
2:B880  0e                   push cs
2:B881  e88ea2               call 0x5b12  ; ListIter::next@s2:5B12
2:B884  8946f4               mov word ptr [bp - 0xc], ax
2:B887  8956f6               mov word ptr [bp - 0xa], dx
2:B88A  0bd0                 or dx, ax
2:B88C  7414                 je 0xb8a2
2:B88E  668b460a             mov eax, dword ptr [bp + 0xa]
2:B892  c45ef4               les bx, ptr [bp - 0xc]
2:B895  6626394708           cmp dword ptr es:[bx + 8], eax
2:B89A  75de                 jne 0xb87a
2:B89C  895ef0               mov word ptr [bp - 0x10], bx
2:B89F  8c46f2               mov word ptr [bp - 0xe], es
loc_B8A2:
2:B8A2  8b46f0               mov ax, word ptr [bp - 0x10]
2:B8A5  8b56f2               mov dx, word ptr [bp - 0xe]
2:B8A8  c9                   leave
2:B8A9  ca0800               retf 8

; ---------------- sub_s2:B8AC FAR size=78 callers=1
2:B8AC  c8100000             enter 0x10, 0
2:B8B0  c45e06               les bx, ptr [bp + 6]
2:B8B3  6626ff7712           push dword ptr es:[bx + 0x12]
2:B8B8  8d46f8               lea ax, [bp - 8]
2:B8BB  16                   push ss
2:B8BC  50                   push ax
2:B8BD  90                   nop
2:B8BE  0e                   push cs
2:B8BF  e8c29e               call 0x5784  ; ListIter::ListIter@s2:5784
2:B8C2  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_B8CA:
2:B8CA  8d46f8               lea ax, [bp - 8]
2:B8CD  16                   push ss
2:B8CE  50                   push ax
2:B8CF  90                   nop
2:B8D0  0e                   push cs
2:B8D1  e83ea2               call 0x5b12  ; ListIter::next@s2:5B12
2:B8D4  8946f4               mov word ptr [bp - 0xc], ax
2:B8D7  8956f6               mov word ptr [bp - 0xa], dx
2:B8DA  0bd0                 or dx, ax
2:B8DC  7412                 je 0xb8f0
2:B8DE  8b460a               mov ax, word ptr [bp + 0xa]
2:B8E1  c45ef4               les bx, ptr [bp - 0xc]
2:B8E4  26394708             cmp word ptr es:[bx + 8], ax
2:B8E8  75e0                 jne 0xb8ca
2:B8EA  895ef0               mov word ptr [bp - 0x10], bx
2:B8ED  8c46f2               mov word ptr [bp - 0xe], es
loc_B8F0:
2:B8F0  8b46f0               mov ax, word ptr [bp - 0x10]
2:B8F3  8b56f2               mov dx, word ptr [bp - 0xe]
2:B8F6  c9                   leave
2:B8F7  ca0600               retf 6

; ---------------- sub_s2:B8FA FAR size=106 callers=1
2:B8FA  c8100000             enter 0x10, 0
2:B8FE  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:B903  7507                 jne 0xb90c
2:B905  33c0                 xor ax, ax
2:B907  99                   cdq
2:B908  c9                   leave
2:B909  ca0800               retf 8
loc_B90C:
2:B90C  c45e06               les bx, ptr [bp + 6]
2:B90F  6626ff770e           push dword ptr es:[bx + 0xe]
2:B914  8d46f8               lea ax, [bp - 8]
2:B917  16                   push ss
2:B918  50                   push ax
2:B919  90                   nop
2:B91A  0e                   push cs
2:B91B  e8669e               call 0x5784  ; ListIter::ListIter@s2:5784
2:B91E  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_B926:
2:B926  8d46f8               lea ax, [bp - 8]
2:B929  16                   push ss
2:B92A  50                   push ax
2:B92B  90                   nop
2:B92C  0e                   push cs
2:B92D  e8e2a1               call 0x5b12  ; ListIter::next@s2:5B12
2:B930  8946f4               mov word ptr [bp - 0xc], ax
2:B933  8956f6               mov word ptr [bp - 0xa], dx
2:B936  0bd0                 or dx, ax
2:B938  7420                 je 0xb95a
2:B93A  66ff760a             push dword ptr [bp + 0xa]
2:B93E  c45ef4               les bx, ptr [bp - 0xc]
2:B941  6626ff7704           push dword ptr es:[bx + 4]
2:B946  9a7a3d93b7           lcall 0xb793, 0x3d7a  ; sub_s1:3D7A
2:B94B  83c408               add sp, 8
2:B94E  0bc0                 or ax, ax
2:B950  75d4                 jne 0xb926
2:B952  668b46f4             mov eax, dword ptr [bp - 0xc]
2:B956  668946f0             mov dword ptr [bp - 0x10], eax
loc_B95A:
2:B95A  8b46f0               mov ax, word ptr [bp - 0x10]
2:B95D  8b56f2               mov dx, word ptr [bp - 0xe]
2:B960  c9                   leave
2:B961  ca0800               retf 8

; ---------------- sub_s2:B964 FAR size=106 callers=1
2:B964  c8100000             enter 0x10, 0
2:B968  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:B96D  7507                 jne 0xb976
2:B96F  33c0                 xor ax, ax
2:B971  99                   cdq
2:B972  c9                   leave
2:B973  ca0800               retf 8
loc_B976:
2:B976  c45e06               les bx, ptr [bp + 6]
2:B979  6626ff7712           push dword ptr es:[bx + 0x12]
2:B97E  8d46f8               lea ax, [bp - 8]
2:B981  16                   push ss
2:B982  50                   push ax
2:B983  90                   nop
2:B984  0e                   push cs
2:B985  e8fc9d               call 0x5784  ; ListIter::ListIter@s2:5784
2:B988  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_B990:
2:B990  8d46f8               lea ax, [bp - 8]
2:B993  16                   push ss
2:B994  50                   push ax
2:B995  90                   nop
2:B996  0e                   push cs
2:B997  e878a1               call 0x5b12  ; ListIter::next@s2:5B12
2:B99A  8946f4               mov word ptr [bp - 0xc], ax
2:B99D  8956f6               mov word ptr [bp - 0xa], dx
2:B9A0  0bd0                 or dx, ax
2:B9A2  7420                 je 0xb9c4
2:B9A4  66ff760a             push dword ptr [bp + 0xa]
2:B9A8  c45ef4               les bx, ptr [bp - 0xc]
2:B9AB  6626ff7704           push dword ptr es:[bx + 4]
2:B9B0  9a7a3d49b9           lcall 0xb949, 0x3d7a  ; sub_s1:3D7A
2:B9B5  83c408               add sp, 8
2:B9B8  0bc0                 or ax, ax
2:B9BA  75d4                 jne 0xb990
2:B9BC  668b46f4             mov eax, dword ptr [bp - 0xc]
2:B9C0  668946f0             mov dword ptr [bp - 0x10], eax
loc_B9C4:
2:B9C4  8b46f0               mov ax, word ptr [bp - 0x10]
2:B9C7  8b56f2               mov dx, word ptr [bp - 0xe]
2:B9CA  c9                   leave
2:B9CB  ca0800               retf 8

; ---------------- sub_s2:B9CE FAR size=106 callers=2
2:B9CE  c8100000             enter 0x10, 0
2:B9D2  66837e0a00           cmp dword ptr [bp + 0xa], 0
2:B9D7  7507                 jne 0xb9e0
2:B9D9  33c0                 xor ax, ax
2:B9DB  99                   cdq
2:B9DC  c9                   leave
2:B9DD  ca0800               retf 8
loc_B9E0:
2:B9E0  c45e06               les bx, ptr [bp + 6]
2:B9E3  6626ff770a           push dword ptr es:[bx + 0xa]
2:B9E8  8d46f8               lea ax, [bp - 8]
2:B9EB  16                   push ss
2:B9EC  50                   push ax
2:B9ED  90                   nop
2:B9EE  0e                   push cs
2:B9EF  e8929d               call 0x5784  ; ListIter::ListIter@s2:5784
2:B9F2  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_B9FA:
2:B9FA  8d46f8               lea ax, [bp - 8]
2:B9FD  16                   push ss
2:B9FE  50                   push ax
2:B9FF  90                   nop
2:BA00  0e                   push cs
2:BA01  e80ea1               call 0x5b12  ; ListIter::next@s2:5B12
2:BA04  8946f4               mov word ptr [bp - 0xc], ax
2:BA07  8956f6               mov word ptr [bp - 0xa], dx
2:BA0A  0bd0                 or dx, ax
2:BA0C  7420                 je 0xba2e
2:BA0E  66ff760a             push dword ptr [bp + 0xa]
2:BA12  c45ef4               les bx, ptr [bp - 0xc]
2:BA15  6626ff7704           push dword ptr es:[bx + 4]
2:BA1A  9a7a3db3b9           lcall 0xb9b3, 0x3d7a  ; sub_s1:3D7A
2:BA1F  83c408               add sp, 8
2:BA22  0bc0                 or ax, ax
2:BA24  75d4                 jne 0xb9fa
2:BA26  668b46f4             mov eax, dword ptr [bp - 0xc]
2:BA2A  668946f0             mov dword ptr [bp - 0x10], eax
loc_BA2E:
2:BA2E  8b46f0               mov ax, word ptr [bp - 0x10]
2:BA31  8b56f2               mov dx, word ptr [bp - 0xe]
2:BA34  c9                   leave
2:BA35  ca0800               retf 8

; ---------------- sub_s2:BA38 size=294 callers=0
2:BA38  c8280000             enter 0x28, 0
2:BA3C  6a16                 push 0x16
2:BA3E  66ff760a             push dword ptr [bp + 0xa]
2:BA42  90                   nop
2:BA43  0e                   push cs
2:BA44  e865c2               call 0x7cac  ; Save_writeChunkTag@s2:7CAC
2:BA47  0bc0                 or ax, ax
2:BA49  7507                 jne 0xba52
loc_BA4B:
2:BA4B  33c0                 xor ax, ax
2:BA4D  c9                   leave
2:BA4E  ca0800               retf 8
2:BA51  db 90
loc_BA52:
2:BA52  c45e06               les bx, ptr [bp + 6]
2:BA55  268b4722             mov ax, word ptr es:[bx + 0x22]
2:BA59  8946f6               mov word ptr [bp - 0xa], ax
2:BA5C  666a02               push 2
2:BA5F  8d46f6               lea ax, [bp - 0xa]
2:BA62  16                   push ss
2:BA63  50                   push ax
2:BA64  66ff760a             push dword ptr [bp + 0xa]
2:BA68  90                   nop
2:BA69  0e                   push cs
2:BA6A  e8afc3               call 0x7e1c  ; File_write@s2:7E1C
2:BA6D  0bc0                 or ax, ax
2:BA6F  7509                 jne 0xba7a
loc_BA71:
2:BA71  c7061003d006         mov word ptr [0x310], 0x6d0
2:BA77  ebd2                 jmp 0xba4b
2:BA79  db 90
loc_BA7A:
2:BA7A  c45e06               les bx, ptr [bp + 6]
2:BA7D  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:BA83  740d                 je 0xba92
2:BA85  26c45f0a             les bx, ptr es:[bx + 0xa]
2:BA89  268b4708             mov ax, word ptr es:[bx + 8]
2:BA8D  8946f6               mov word ptr [bp - 0xa], ax
2:BA90  eb05                 jmp 0xba97
loc_BA92:
2:BA92  c746f60000           mov word ptr [bp - 0xa], 0
loc_BA97:
2:BA97  8b46f6               mov ax, word ptr [bp - 0xa]
2:BA9A  8946e4               mov word ptr [bp - 0x1c], ax
2:BA9D  666a02               push 2
2:BAA0  8d46e4               lea ax, [bp - 0x1c]
2:BAA3  16                   push ss
2:BAA4  50                   push ax
2:BAA5  66ff760a             push dword ptr [bp + 0xa]
2:BAA9  90                   nop
2:BAAA  0e                   push cs
2:BAAB  e86ec3               call 0x7e1c  ; File_write@s2:7E1C
2:BAAE  0bc0                 or ax, ax
2:BAB0  74bf                 je 0xba71
2:BAB2  c45e06               les bx, ptr [bp + 6]
2:BAB5  6626ff770a           push dword ptr es:[bx + 0xa]
2:BABA  8d46ee               lea ax, [bp - 0x12]
2:BABD  16                   push ss
2:BABE  50                   push ax
2:BABF  90                   nop
2:BAC0  0e                   push cs
2:BAC1  e8c09c               call 0x5784  ; ListIter::ListIter@s2:5784
loc_BAC4:
2:BAC4  8d46ee               lea ax, [bp - 0x12]
2:BAC7  16                   push ss
2:BAC8  50                   push ax
2:BAC9  90                   nop
2:BACA  0e                   push cs
2:BACB  e844a0               call 0x5b12  ; ListIter::next@s2:5B12
2:BACE  8946f8               mov word ptr [bp - 8], ax
2:BAD1  8956fa               mov word ptr [bp - 6], dx
2:BAD4  0bd0                 or dx, ax
2:BAD6  747e                 je 0xbb56
2:BAD8  c45ef8               les bx, ptr [bp - 8]
2:BADB  6626ff7704           push dword ptr es:[bx + 4]
2:BAE0  66ff760a             push dword ptr [bp + 0xa]
2:BAE4  90                   nop
2:BAE5  0e                   push cs
2:BAE6  e841c1               call 0x7c2a  ; sub_s2:7C2A
2:BAE9  0bc0                 or ax, ax
2:BAEB  7484                 je 0xba71
2:BAED  c45ef8               les bx, ptr [bp - 8]
2:BAF0  268b4708             mov ax, word ptr es:[bx + 8]
2:BAF4  8946fc               mov word ptr [bp - 4], ax
2:BAF7  666a02               push 2
2:BAFA  8d46fc               lea ax, [bp - 4]
2:BAFD  16                   push ss
2:BAFE  50                   push ax
2:BAFF  66ff760a             push dword ptr [bp + 0xa]
2:BB03  90                   nop
2:BB04  0e                   push cs
2:BB05  e814c3               call 0x7e1c  ; File_write@s2:7E1C
2:BB08  0bc0                 or ax, ax
2:BB0A  0f8463ff             je 0xba71
2:BB0E  c45ef8               les bx, ptr [bp - 8]
2:BB11  66268b470a           mov eax, dword ptr es:[bx + 0xa]
2:BB16  668946d8             mov dword ptr [bp - 0x28], eax
2:BB1A  666a04               push 4
2:BB1D  8d46d8               lea ax, [bp - 0x28]
2:BB20  16                   push ss
2:BB21  50                   push ax
2:BB22  66ff760a             push dword ptr [bp + 0xa]
2:BB26  90                   nop
2:BB27  0e                   push cs
2:BB28  e8f1c2               call 0x7e1c  ; File_write@s2:7E1C
2:BB2B  0bc0                 or ax, ax
2:BB2D  0f8440ff             je 0xba71
2:BB31  c45ef8               les bx, ptr [bp - 8]
2:BB34  268b470e             mov ax, word ptr es:[bx + 0xe]
2:BB38  8946fc               mov word ptr [bp - 4], ax
2:BB3B  666a02               push 2
2:BB3E  8d46fc               lea ax, [bp - 4]
2:BB41  16                   push ss
2:BB42  50                   push ax
2:BB43  66ff760a             push dword ptr [bp + 0xa]
2:BB47  90                   nop
2:BB48  0e                   push cs
2:BB49  e8d0c2               call 0x7e1c  ; File_write@s2:7E1C
2:BB4C  0bc0                 or ax, ax
2:BB4E  0f8572ff             jne 0xbac4
2:BB52  e91cff               jmp 0xba71
2:BB55  db 90
loc_BB56:
2:BB56  b80100               mov ax, 1
2:BB59  c9                   leave
2:BB5A  ca0800               retf 8
2:BB5D  db 00

; ---------------- sub_s2:BB5E FAR size=420 callers=0
2:BB5E  c83a0100             enter 0x13a, 0
2:BB62  833e120302           cmp word ptr [0x312], 2
2:BB67  7d07                 jge 0xbb70
loc_BB69:
2:BB69  b80100               mov ax, 1
2:BB6C  c9                   leave
2:BB6D  ca0800               retf 8
loc_BB70:
2:BB70  6a16                 push 0x16
2:BB72  66ff760a             push dword ptr [bp + 0xa]
2:BB76  90                   nop
2:BB77  0e                   push cs
2:BB78  e883c1               call 0x7cfe  ; sub_s2:7CFE
2:BB7B  0bc0                 or ax, ax
2:BB7D  750d                 jne 0xbb8c
2:BB7F  c7061003d406         mov word ptr [0x310], 0x6d4
loc_BB85:
2:BB85  33c0                 xor ax, ax
2:BB87  c9                   leave
2:BB88  ca0800               retf 8
2:BB8B  db 90
loc_BB8C:
2:BB8C  666a02               push 2
2:BB8F  668b4606             mov eax, dword ptr [bp + 6]
2:BB93  052200               add ax, 0x22
2:BB96  6650                 push eax
2:BB98  66ff760a             push dword ptr [bp + 0xa]
2:BB9C  90                   nop
2:BB9D  0e                   push cs
2:BB9E  e84dc2               call 0x7dee  ; File_read@s2:7DEE
2:BBA1  0bc0                 or ax, ax
2:BBA3  7509                 jne 0xbbae
loc_BBA5:
2:BBA5  c7061003d206         mov word ptr [0x310], 0x6d2
2:BBAB  ebd8                 jmp 0xbb85
2:BBAD  db 90
loc_BBAE:
2:BBAE  666a02               push 2
2:BBB1  8d46f2               lea ax, [bp - 0xe]
2:BBB4  16                   push ss
2:BBB5  50                   push ax
2:BBB6  66ff760a             push dword ptr [bp + 0xa]
2:BBBA  90                   nop
2:BBBB  0e                   push cs
2:BBBC  e82fc2               call 0x7dee  ; File_read@s2:7DEE
2:BBBF  0bc0                 or ax, ax
2:BBC1  74e2                 je 0xbba5
2:BBC3  837ef200             cmp word ptr [bp - 0xe], 0
2:BBC7  74a0                 je 0xbb69
2:BBC9  6a0c                 push 0xc
2:BBCB  9a9c17e2bc           lcall 0xbce2, 0x179c  ; operator_new@s1:179C
2:BBD0  83c402               add sp, 2
2:BBD3  8986e0fe             mov word ptr [bp - 0x120], ax
2:BBD7  8996e2fe             mov word ptr [bp - 0x11e], dx
2:BBDB  0bd0                 or dx, ax
2:BBDD  740d                 je 0xbbec
2:BBDF  ffb6e2fe             push word ptr [bp - 0x11e]
2:BBE3  50                   push ax
2:BBE4  90                   nop
2:BBE5  0e                   push cs
2:BBE6  e8619b               call 0x574a  ; sub_s2:574A
2:BBE9  eb04                 jmp 0xbbef
2:BBEB  db 90
loc_BBEC:
2:BBEC  33c0                 xor ax, ax
2:BBEE  99                   cdq
loc_BBEF:
2:BBEF  c45e06               les bx, ptr [bp + 6]
2:BBF2  2689470a             mov word ptr es:[bx + 0xa], ax
2:BBF6  2689570c             mov word ptr es:[bx + 0xc], dx
2:BBFA  c786e4fe0000         mov word ptr [bp - 0x11c], 0
2:BC00  e9cf00               jmp 0xbcd2
2:BC03  db 90
loc_BC04:
2:BC04  33c0                 xor ax, ax
2:BC06  99                   cdq
loc_BC07:
2:BC07  8986e6fe             mov word ptr [bp - 0x11a], ax
2:BC0B  8996e8fe             mov word ptr [bp - 0x118], dx
2:BC0F  8d86eafe             lea ax, [bp - 0x116]
2:BC13  16                   push ss
2:BC14  50                   push ax
2:BC15  66ff760a             push dword ptr [bp + 0xa]
2:BC19  90                   nop
2:BC1A  0e                   push cs
2:BC1B  e850c0               call 0x7c6e  ; sub_s2:7C6E
2:BC1E  0bc0                 or ax, ax
2:BC20  743f                 je 0xbc61
2:BC22  666a02               push 2
2:BC25  8d46ee               lea ax, [bp - 0x12]
2:BC28  16                   push ss
2:BC29  50                   push ax
2:BC2A  66ff760a             push dword ptr [bp + 0xa]
2:BC2E  90                   nop
2:BC2F  0e                   push cs
2:BC30  e8bbc1               call 0x7dee  ; File_read@s2:7DEE
2:BC33  0bc0                 or ax, ax
2:BC35  742a                 je 0xbc61
2:BC37  666a04               push 4
2:BC3A  8d46fa               lea ax, [bp - 6]
2:BC3D  16                   push ss
2:BC3E  50                   push ax
2:BC3F  66ff760a             push dword ptr [bp + 0xa]
2:BC43  90                   nop
2:BC44  0e                   push cs
2:BC45  e8a6c1               call 0x7dee  ; File_read@s2:7DEE
2:BC48  0bc0                 or ax, ax
2:BC4A  7415                 je 0xbc61
2:BC4C  666a02               push 2
2:BC4F  8d46ea               lea ax, [bp - 0x16]
2:BC52  16                   push ss
2:BC53  50                   push ax
2:BC54  66ff760a             push dword ptr [bp + 0xa]
2:BC58  90                   nop
2:BC59  0e                   push cs
2:BC5A  e891c1               call 0x7dee  ; File_read@s2:7DEE
2:BC5D  0bc0                 or ax, ax
2:BC5F  7527                 jne 0xbc88
loc_BC61:
2:BC61  668b86e6fe           mov eax, dword ptr [bp - 0x11a]
2:BC66  668986c6fe           mov dword ptr [bp - 0x13a], eax
2:BC6B  668986e0fe           mov dword ptr [bp - 0x120], eax
2:BC70  660bc0               or eax, eax
2:BC73  0f842eff             je 0xbba5
2:BC77  6a01                 push 1
2:BC79  c49ee6fe             les bx, ptr [bp - 0x11a]
2:BC7D  06                   push es
2:BC7E  50                   push ax
2:BC7F  26c41f               les bx, ptr es:[bx]
2:BC82  26ff1f               lcall es:[bx]
2:BC85  e91dff               jmp 0xbba5
loc_BC88:
2:BC88  8d86eafe             lea ax, [bp - 0x116]
2:BC8C  16                   push ss
2:BC8D  50                   push ax
2:BC8E  90                   nop
2:BC8F  0e                   push cs
2:BC90  e855a4               call 0x60e8  ; sub_s2:60E8
2:BC93  83c404               add sp, 4
2:BC96  c49ee6fe             les bx, ptr [bp - 0x11a]
2:BC9A  26894704             mov word ptr es:[bx + 4], ax
2:BC9E  26895706             mov word ptr es:[bx + 6], dx
2:BCA2  8b46ee               mov ax, word ptr [bp - 0x12]
2:BCA5  26894708             mov word ptr es:[bx + 8], ax
2:BCA9  668b46fa             mov eax, dword ptr [bp - 6]
2:BCAD  662689470a           mov dword ptr es:[bx + 0xa], eax
2:BCB2  8b46ea               mov ax, word ptr [bp - 0x16]
2:BCB5  2689470e             mov word ptr es:[bx + 0xe], ax
2:BCB9  06                   push es
2:BCBA  53                   push bx
2:BCBB  c45e06               les bx, ptr [bp + 6]
2:BCBE  6626ff770a           push dword ptr es:[bx + 0xa]
2:BCC3  26c45f0a             les bx, ptr es:[bx + 0xa]
2:BCC7  26c41f               les bx, ptr es:[bx]
2:BCCA  26ff5f08             lcall es:[bx + 8]
2:BCCE  ff86e4fe             inc word ptr [bp - 0x11c]
loc_BCD2:
2:BCD2  8b46f2               mov ax, word ptr [bp - 0xe]
2:BCD5  3986e4fe             cmp word ptr [bp - 0x11c], ax
2:BCD9  0f838cfe             jae 0xbb69
2:BCDD  6a12                 push 0x12  ; 'version %d %d'
2:BCDF  9a9c171dba           lcall 0xba1d, 0x179c  ; operator_new@s1:179C
2:BCE4  83c402               add sp, 2
2:BCE7  8986e0fe             mov word ptr [bp - 0x120], ax
2:BCEB  8996e2fe             mov word ptr [bp - 0x11e], dx
2:BCEF  0bd0                 or dx, ax
2:BCF1  0f840fff             je 0xbc04
2:BCF5  ffb6e2fe             push word ptr [bp - 0x11e]
2:BCF9  50                   push ax
2:BCFA  90                   nop
2:BCFB  0e                   push cs
2:BCFC  e8bdf3               call 0xb0bc  ; sub_s2:B0BC
2:BCFF  e905ff               jmp 0xbc07

; ---------------- sub_s2:BD02 FAR size=38 callers=0
2:BD02  55                   push bp
2:BD03  8bec                 mov bp, sp
2:BD05  66ff7606             push dword ptr [bp + 6]
2:BD09  90                   nop
2:BD0A  0e                   push cs
2:BD0B  e8d0f2               call 0xafde  ; sub_s2:AFDE
2:BD0E  f6460a01             test byte ptr [bp + 0xa], 1
2:BD12  7409                 je 0xbd1d
2:BD14  66ff7606             push dword ptr [bp + 6]
2:BD18  9ace17cebb           lcall 0xbbce, 0x17ce  ; operator_delete@s1:17CE
loc_BD1D:
2:BD1D  8b4606               mov ax, word ptr [bp + 6]
2:BD20  8b5608               mov dx, word ptr [bp + 8]
2:BD23  c9                   leave
2:BD24  ca0600               retf 6
2:BD27  db 00

; ---------------- sub_s2:BD28 FAR size=38 callers=0
2:BD28  55                   push bp
2:BD29  8bec                 mov bp, sp
2:BD2B  66ff7606             push dword ptr [bp + 6]
2:BD2F  90                   nop
2:BD30  0e                   push cs
2:BD31  e858f3               call 0xb08c  ; sub_s2:B08C
2:BD34  f6460a01             test byte ptr [bp + 0xa], 1
2:BD38  7409                 je 0xbd43
2:BD3A  66ff7606             push dword ptr [bp + 6]
2:BD3E  9ace171bbd           lcall 0xbd1b, 0x17ce  ; operator_delete@s1:17CE
loc_BD43:
2:BD43  8b4606               mov ax, word ptr [bp + 6]
2:BD46  8b5608               mov dx, word ptr [bp + 8]
2:BD49  c9                   leave
2:BD4A  ca0600               retf 6
2:BD4D  db 00

; ---------------- sub_s2:BD4E FAR size=38 callers=0
2:BD4E  c8040000             enter 4, 0
2:BD52  66ff7606             push dword ptr [bp + 6]
2:BD56  90                   nop
2:BD57  0e                   push cs
2:BD58  e831f3               call 0xb08c  ; sub_s2:B08C
2:BD5B  f6460a01             test byte ptr [bp + 0xa], 1
2:BD5F  7409                 je 0xbd6a
2:BD61  66ff7606             push dword ptr [bp + 6]
2:BD65  9ace1741bd           lcall 0xbd41, 0x17ce  ; operator_delete@s1:17CE
loc_BD6A:
2:BD6A  8b4606               mov ax, word ptr [bp + 6]
2:BD6D  8b5608               mov dx, word ptr [bp + 8]
2:BD70  c9                   leave
2:BD71  ca0600               retf 6

; ---------------- sub_s2:BD74 size=38 callers=0
2:BD74  c8040000             enter 4, 0
2:BD78  66ff7606             push dword ptr [bp + 6]
2:BD7C  90                   nop
2:BD7D  0e                   push cs
2:BD7E  e80bf3               call 0xb08c  ; sub_s2:B08C
2:BD81  f6460a01             test byte ptr [bp + 0xa], 1
2:BD85  7409                 je 0xbd90
2:BD87  66ff7606             push dword ptr [bp + 6]
2:BD8B  9ace1768bd           lcall 0xbd68, 0x17ce  ; operator_delete@s1:17CE
loc_BD90:
2:BD90  8b4606               mov ax, word ptr [bp + 6]
2:BD93  8b5608               mov dx, word ptr [bp + 8]
2:BD96  c9                   leave
2:BD97  ca0600               retf 6

; ---------------- sub_s2:BD9A size=70 callers=0
2:BD9A  c8040000             enter 4, 0
2:BD9E  66ff7606             push dword ptr [bp + 6]
2:BDA2  90                   nop
2:BDA3  0e                   push cs
2:BDA4  e8e5f2               call 0xb08c  ; sub_s2:B08C
2:BDA7  f6460a01             test byte ptr [bp + 0xa], 1
2:BDAB  7409                 je 0xbdb6
2:BDAD  66ff7606             push dword ptr [bp + 6]
2:BDB1  9ace178ebd           lcall 0xbd8e, 0x17ce  ; operator_delete@s1:17CE
loc_BDB6:
2:BDB6  8b4606               mov ax, word ptr [bp + 6]
2:BDB9  8b5608               mov dx, word ptr [bp + 8]
2:BDBC  c9                   leave
2:BDBD  ca0600               retf 6
2:BDC0  db 74 bd 3a b3 4e bd c2 bd 28 bd c6 bd 02 bd d6 bd
2:BDD0  db f2 1d cd b7 38 ba da bd 5e bb ca bd 9a bd ce bd

; ---------------- sub_s2:BDE0 FAR size=2118 callers=1
2:BDE0  c8100000             enter 0x10, 0
2:BDE4  668b4606             mov eax, dword ptr [bp + 6]
2:BDE8  66a3e006             mov dword ptr [0x6e0], eax  ; g_bldgGroups
2:BDEC  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
2:BDF2  740a                 je 0xbdfe
2:BDF4  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
2:BDF7  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
2:BDFB  eb06                 jmp 0xbe03
2:BDFD  db 90
loc_BDFE:
2:BDFE  9a0a1611be           lcall 0xbe11, 0x160a  ; SH_DefaultPool@s1:160A
loc_BE03:
2:BE03  52                   push dx
2:BE04  50                   push ax
2:BE05  666800000100         push 0x10000
2:BE0B  68aa01               push 0x1aa
2:BE0E  9a0817b4bd           lcall 0xbdb4, 0x1708  ; SH_MemAllocPtr@s1:1708
2:BE13  c45e06               les bx, ptr [bp + 6]
2:BE16  268907               mov word ptr es:[bx], ax
2:BE19  26895702             mov word ptr es:[bx + 2], dx
2:BE1D  c45e06               les bx, ptr [bp + 6]
2:BE20  26c41f               les bx, ptr es:[bx]
2:BE23  26c74706e406         mov word ptr es:[bx + 6], 0x6e4
2:BE29  268c5f08             mov word ptr es:[bx + 8], ds
2:BE2D  c45e06               les bx, ptr [bp + 6]
2:BE30  26c41f               les bx, ptr es:[bx]
2:BE33  26c7470a0300         mov word ptr es:[bx + 0xa], 3
2:BE39  c45e06               les bx, ptr [bp + 6]
2:BE3C  26c41f               les bx, ptr es:[bx]
2:BE3F  26c7470cea06         mov word ptr es:[bx + 0xc], 0x6ea
2:BE45  268c5f0e             mov word ptr es:[bx + 0xe], ds
2:BE49  c45e06               les bx, ptr [bp + 6]
2:BE4C  26c41f               les bx, ptr es:[bx]
2:BE4F  26c747100200         mov word ptr es:[bx + 0x10], 2
2:BE55  c45e06               les bx, ptr [bp + 6]
2:BE58  26c41f               les bx, ptr es:[bx]
2:BE5B  26c74712ee06         mov word ptr es:[bx + 0x12], 0x6ee
2:BE61  268c5f14             mov word ptr es:[bx + 0x14], ds
2:BE65  c45e06               les bx, ptr [bp + 6]
2:BE68  26c41f               les bx, ptr es:[bx]
2:BE6B  26c747160200         mov word ptr es:[bx + 0x16], 2
2:BE71  c45e06               les bx, ptr [bp + 6]
2:BE74  26c41f               les bx, ptr es:[bx]
2:BE77  26c74718f206         mov word ptr es:[bx + 0x18], 0x6f2
2:BE7D  268c5f1a             mov word ptr es:[bx + 0x1a], ds
2:BE81  c45e06               les bx, ptr [bp + 6]
2:BE84  26c41f               les bx, ptr es:[bx]
2:BE87  26c7471c0200         mov word ptr es:[bx + 0x1c], 2
2:BE8D  c45e06               les bx, ptr [bp + 6]
2:BE90  26c41f               les bx, ptr es:[bx]
2:BE93  26c7471ef606         mov word ptr es:[bx + 0x1e], 0x6f6
2:BE99  268c5f20             mov word ptr es:[bx + 0x20], ds
2:BE9D  c45e06               les bx, ptr [bp + 6]
2:BEA0  26c41f               les bx, ptr es:[bx]
2:BEA3  26c747220400         mov word ptr es:[bx + 0x22], 4
2:BEA9  c45e06               les bx, ptr [bp + 6]
2:BEAC  26c41f               les bx, ptr es:[bx]
2:BEAF  26c74724fe06         mov word ptr es:[bx + 0x24], 0x6fe
2:BEB5  268c5f26             mov word ptr es:[bx + 0x26], ds
2:BEB9  c45e06               les bx, ptr [bp + 6]
2:BEBC  26c41f               les bx, ptr es:[bx]
2:BEBF  26c747280200         mov word ptr es:[bx + 0x28], 2
2:BEC5  c45e06               les bx, ptr [bp + 6]
2:BEC8  26c41f               les bx, ptr es:[bx]
2:BECB  26c7472a0207         mov word ptr es:[bx + 0x2a], 0x702
2:BED1  268c5f2c             mov word ptr es:[bx + 0x2c], ds
2:BED5  c45e06               les bx, ptr [bp + 6]
2:BED8  26c41f               les bx, ptr es:[bx]
2:BEDB  26c7472e0300         mov word ptr es:[bx + 0x2e], 3
2:BEE1  c45e06               les bx, ptr [bp + 6]
2:BEE4  26c41f               les bx, ptr es:[bx]
2:BEE7  26c747300807         mov word ptr es:[bx + 0x30], 0x708
2:BEED  268c5f32             mov word ptr es:[bx + 0x32], ds
2:BEF1  c45e06               les bx, ptr [bp + 6]
2:BEF4  26c41f               les bx, ptr es:[bx]
2:BEF7  26c747340300         mov word ptr es:[bx + 0x34], 3
2:BEFD  c45e06               les bx, ptr [bp + 6]
2:BF00  26c41f               les bx, ptr es:[bx]
2:BF03  26c747360e07         mov word ptr es:[bx + 0x36], 0x70e
2:BF09  268c5f38             mov word ptr es:[bx + 0x38], ds
2:BF0D  c45e06               les bx, ptr [bp + 6]
2:BF10  26c41f               les bx, ptr es:[bx]
2:BF13  26c7473a0300         mov word ptr es:[bx + 0x3a], 3
2:BF19  c45e06               les bx, ptr [bp + 6]
2:BF1C  26c41f               les bx, ptr es:[bx]
2:BF1F  26c7473c1407         mov word ptr es:[bx + 0x3c], 0x714
2:BF25  268c5f3e             mov word ptr es:[bx + 0x3e], ds
2:BF29  c45e06               les bx, ptr [bp + 6]
2:BF2C  26c41f               les bx, ptr es:[bx]
2:BF2F  26c747400300         mov word ptr es:[bx + 0x40], 3
2:BF35  c45e06               les bx, ptr [bp + 6]
2:BF38  26c41f               les bx, ptr es:[bx]
2:BF3B  26c747421a07         mov word ptr es:[bx + 0x42], 0x71a
2:BF41  268c5f44             mov word ptr es:[bx + 0x44], ds
2:BF45  c45e06               les bx, ptr [bp + 6]
2:BF48  26c41f               les bx, ptr es:[bx]
2:BF4B  26c747460200         mov word ptr es:[bx + 0x46], 2
2:BF51  c45e06               les bx, ptr [bp + 6]
2:BF54  26c41f               les bx, ptr es:[bx]
2:BF57  26c747481e07         mov word ptr es:[bx + 0x48], 0x71e
2:BF5D  268c5f4a             mov word ptr es:[bx + 0x4a], ds
2:BF61  c45e06               les bx, ptr [bp + 6]
2:BF64  26c41f               les bx, ptr es:[bx]
2:BF67  26c7474c0700         mov word ptr es:[bx + 0x4c], 7
2:BF6D  c45e06               les bx, ptr [bp + 6]
2:BF70  26c41f               les bx, ptr es:[bx]
2:BF73  26c7474e2c07         mov word ptr es:[bx + 0x4e], 0x72c
2:BF79  268c5f50             mov word ptr es:[bx + 0x50], ds
2:BF7D  c45e06               les bx, ptr [bp + 6]
2:BF80  26c41f               les bx, ptr es:[bx]
2:BF83  26c747520600         mov word ptr es:[bx + 0x52], 6
2:BF89  c45e06               les bx, ptr [bp + 6]
2:BF8C  26c41f               les bx, ptr es:[bx]
2:BF8F  26c747543807         mov word ptr es:[bx + 0x54], 0x738
2:BF95  268c5f56             mov word ptr es:[bx + 0x56], ds
2:BF99  c45e06               les bx, ptr [bp + 6]
2:BF9C  26c41f               les bx, ptr es:[bx]
2:BF9F  26c747580300         mov word ptr es:[bx + 0x58], 3
2:BFA5  c45e06               les bx, ptr [bp + 6]
2:BFA8  26c41f               les bx, ptr es:[bx]
2:BFAB  26c7475a3e07         mov word ptr es:[bx + 0x5a], 0x73e
2:BFB1  268c5f5c             mov word ptr es:[bx + 0x5c], ds
2:BFB5  c45e06               les bx, ptr [bp + 6]
2:BFB8  26c41f               les bx, ptr es:[bx]
2:BFBB  26c7475e0300         mov word ptr es:[bx + 0x5e], 3
2:BFC1  c45e06               les bx, ptr [bp + 6]
2:BFC4  26c41f               les bx, ptr es:[bx]
2:BFC7  26c747604407         mov word ptr es:[bx + 0x60], 0x744
2:BFCD  268c5f62             mov word ptr es:[bx + 0x62], ds
2:BFD1  c45e06               les bx, ptr [bp + 6]
2:BFD4  26c41f               les bx, ptr es:[bx]
2:BFD7  26c747640400         mov word ptr es:[bx + 0x64], 4
2:BFDD  c45e06               les bx, ptr [bp + 6]
2:BFE0  26c41f               les bx, ptr es:[bx]
2:BFE3  26c747664c07         mov word ptr es:[bx + 0x66], 0x74c
2:BFE9  268c5f68             mov word ptr es:[bx + 0x68], ds
2:BFED  c45e06               les bx, ptr [bp + 6]
2:BFF0  26c41f               les bx, ptr es:[bx]
2:BFF3  26c7476a0200         mov word ptr es:[bx + 0x6a], 2
2:BFF9  c45e06               les bx, ptr [bp + 6]
2:BFFC  26c41f               les bx, ptr es:[bx]
2:BFFF  26c7476c5007         mov word ptr es:[bx + 0x6c], 0x750
2:C005  268c5f6e             mov word ptr es:[bx + 0x6e], ds
2:C009  c45e06               les bx, ptr [bp + 6]
2:C00C  26c41f               les bx, ptr es:[bx]
2:C00F  26c747700300         mov word ptr es:[bx + 0x70], 3
2:C015  c45e06               les bx, ptr [bp + 6]
2:C018  26c41f               les bx, ptr es:[bx]
2:C01B  26c747725607         mov word ptr es:[bx + 0x72], 0x756
2:C021  268c5f74             mov word ptr es:[bx + 0x74], ds
2:C025  c45e06               les bx, ptr [bp + 6]
2:C028  26c41f               les bx, ptr es:[bx]
2:C02B  26c747760200         mov word ptr es:[bx + 0x76], 2
2:C031  c45e06               les bx, ptr [bp + 6]
2:C034  26c41f               les bx, ptr es:[bx]
2:C037  26c747785a07         mov word ptr es:[bx + 0x78], 0x75a
2:C03D  268c5f7a             mov word ptr es:[bx + 0x7a], ds
2:C041  c45e06               les bx, ptr [bp + 6]
2:C044  26c41f               les bx, ptr es:[bx]
2:C047  26c7477c0200         mov word ptr es:[bx + 0x7c], 2
2:C04D  c45e06               les bx, ptr [bp + 6]
2:C050  26c41f               les bx, ptr es:[bx]
2:C053  26c7477e5e07         mov word ptr es:[bx + 0x7e], 0x75e
2:C059  268c9f8000           mov word ptr es:[bx + 0x80], ds
2:C05E  c45e06               les bx, ptr [bp + 6]
2:C061  26c41f               les bx, ptr es:[bx]
2:C064  26c78782000300       mov word ptr es:[bx + 0x82], 3
2:C06B  c45e06               les bx, ptr [bp + 6]
2:C06E  26c41f               les bx, ptr es:[bx]
2:C071  26c78784006407       mov word ptr es:[bx + 0x84], 0x764
2:C078  268c9f8600           mov word ptr es:[bx + 0x86], ds
2:C07D  c45e06               les bx, ptr [bp + 6]
2:C080  26c41f               les bx, ptr es:[bx]
2:C083  26c78788000300       mov word ptr es:[bx + 0x88], 3
2:C08A  c45e06               les bx, ptr [bp + 6]
2:C08D  26c41f               les bx, ptr es:[bx]
2:C090  26c7878a006a07       mov word ptr es:[bx + 0x8a], 0x76a
2:C097  268c9f8c00           mov word ptr es:[bx + 0x8c], ds
2:C09C  c45e06               les bx, ptr [bp + 6]
2:C09F  26c41f               les bx, ptr es:[bx]
2:C0A2  26c7878e000300       mov word ptr es:[bx + 0x8e], 3
2:C0A9  c45e06               les bx, ptr [bp + 6]
2:C0AC  26c41f               les bx, ptr es:[bx]
2:C0AF  26c78790007007       mov word ptr es:[bx + 0x90], 0x770
2:C0B6  268c9f9200           mov word ptr es:[bx + 0x92], ds
2:C0BB  c45e06               les bx, ptr [bp + 6]
2:C0BE  26c41f               les bx, ptr es:[bx]
2:C0C1  26c78794000200       mov word ptr es:[bx + 0x94], 2
2:C0C8  c45e06               les bx, ptr [bp + 6]
2:C0CB  26c41f               les bx, ptr es:[bx]
2:C0CE  26c78796007407       mov word ptr es:[bx + 0x96], 0x774
2:C0D5  268c9f9800           mov word ptr es:[bx + 0x98], ds
2:C0DA  c45e06               les bx, ptr [bp + 6]
2:C0DD  26c41f               les bx, ptr es:[bx]
2:C0E0  26c7879a000400       mov word ptr es:[bx + 0x9a], 4
2:C0E7  c45e06               les bx, ptr [bp + 6]
2:C0EA  26c41f               les bx, ptr es:[bx]
2:C0ED  26c7879c007c07       mov word ptr es:[bx + 0x9c], 0x77c
2:C0F4  268c9f9e00           mov word ptr es:[bx + 0x9e], ds
2:C0F9  c45e06               les bx, ptr [bp + 6]
2:C0FC  26c41f               les bx, ptr es:[bx]
2:C0FF  26c787a0000200       mov word ptr es:[bx + 0xa0], 2
2:C106  c45e06               les bx, ptr [bp + 6]
2:C109  26c41f               les bx, ptr es:[bx]
2:C10C  26c787a2008007       mov word ptr es:[bx + 0xa2], 0x780
2:C113  268c9fa400           mov word ptr es:[bx + 0xa4], ds
2:C118  c45e06               les bx, ptr [bp + 6]
2:C11B  26c41f               les bx, ptr es:[bx]
2:C11E  26c787a6000100       mov word ptr es:[bx + 0xa6], 1
2:C125  c45e06               les bx, ptr [bp + 6]
2:C128  26c41f               les bx, ptr es:[bx]
2:C12B  26c787a8008207       mov word ptr es:[bx + 0xa8], 0x782
2:C132  268c9faa00           mov word ptr es:[bx + 0xaa], ds
2:C137  c45e06               les bx, ptr [bp + 6]
2:C13A  26c41f               les bx, ptr es:[bx]
2:C13D  26c787ac000200       mov word ptr es:[bx + 0xac], 2
2:C144  c45e06               les bx, ptr [bp + 6]
2:C147  26c41f               les bx, ptr es:[bx]
2:C14A  26c787ae008607       mov word ptr es:[bx + 0xae], 0x786
2:C151  268c9fb000           mov word ptr es:[bx + 0xb0], ds
2:C156  c45e06               les bx, ptr [bp + 6]
2:C159  26c41f               les bx, ptr es:[bx]
2:C15C  26c787b2000200       mov word ptr es:[bx + 0xb2], 2
2:C163  c45e06               les bx, ptr [bp + 6]
2:C166  26c41f               les bx, ptr es:[bx]
2:C169  26c787b4008a07       mov word ptr es:[bx + 0xb4], 0x78a
2:C170  268c9fb600           mov word ptr es:[bx + 0xb6], ds
2:C175  c45e06               les bx, ptr [bp + 6]
2:C178  26c41f               les bx, ptr es:[bx]
2:C17B  26c787b8000200       mov word ptr es:[bx + 0xb8], 2
2:C182  c45e06               les bx, ptr [bp + 6]
2:C185  26c41f               les bx, ptr es:[bx]
2:C188  26c787ba008e07       mov word ptr es:[bx + 0xba], 0x78e
2:C18F  268c9fbc00           mov word ptr es:[bx + 0xbc], ds
2:C194  c45e06               les bx, ptr [bp + 6]
2:C197  26c41f               les bx, ptr es:[bx]
2:C19A  26c787be000200       mov word ptr es:[bx + 0xbe], 2
2:C1A1  c45e06               les bx, ptr [bp + 6]
2:C1A4  26c41f               les bx, ptr es:[bx]
2:C1A7  26c787c0009207       mov word ptr es:[bx + 0xc0], 0x792
2:C1AE  268c9fc200           mov word ptr es:[bx + 0xc2], ds
2:C1B3  c45e06               les bx, ptr [bp + 6]
2:C1B6  26c41f               les bx, ptr es:[bx]
2:C1B9  26c787c4000200       mov word ptr es:[bx + 0xc4], 2
2:C1C0  c45e06               les bx, ptr [bp + 6]
2:C1C3  26c41f               les bx, ptr es:[bx]
2:C1C6  26c787c6009607       mov word ptr es:[bx + 0xc6], 0x796
2:C1CD  268c9fc800           mov word ptr es:[bx + 0xc8], ds
2:C1D2  c45e06               les bx, ptr [bp + 6]
2:C1D5  26c41f               les bx, ptr es:[bx]
2:C1D8  26c787ca000400       mov word ptr es:[bx + 0xca], 4
2:C1DF  c45e06               les bx, ptr [bp + 6]
2:C1E2  26c41f               les bx, ptr es:[bx]
2:C1E5  26c787cc009e07       mov word ptr es:[bx + 0xcc], 0x79e
2:C1EC  268c9fce00           mov word ptr es:[bx + 0xce], ds
2:C1F1  c45e06               les bx, ptr [bp + 6]
2:C1F4  26c41f               les bx, ptr es:[bx]
2:C1F7  26c787d0000100       mov word ptr es:[bx + 0xd0], 1
2:C1FE  c45e06               les bx, ptr [bp + 6]
2:C201  26c41f               les bx, ptr es:[bx]
2:C204  26c787d200a007       mov word ptr es:[bx + 0xd2], 0x7a0
2:C20B  268c9fd400           mov word ptr es:[bx + 0xd4], ds
2:C210  c45e06               les bx, ptr [bp + 6]
2:C213  26c41f               les bx, ptr es:[bx]
2:C216  26c787d6000200       mov word ptr es:[bx + 0xd6], 2
2:C21D  c45e06               les bx, ptr [bp + 6]
2:C220  26c41f               les bx, ptr es:[bx]
2:C223  26c787d800a407       mov word ptr es:[bx + 0xd8], 0x7a4
2:C22A  268c9fda00           mov word ptr es:[bx + 0xda], ds
2:C22F  c45e06               les bx, ptr [bp + 6]
2:C232  26c41f               les bx, ptr es:[bx]
2:C235  26c787dc000100       mov word ptr es:[bx + 0xdc], 1
2:C23C  c45e06               les bx, ptr [bp + 6]
2:C23F  26c41f               les bx, ptr es:[bx]
2:C242  26c787de00a607       mov word ptr es:[bx + 0xde], 0x7a6
2:C249  268c9fe000           mov word ptr es:[bx + 0xe0], ds
2:C24E  c45e06               les bx, ptr [bp + 6]
2:C251  26c41f               les bx, ptr es:[bx]
2:C254  26c787e2000600       mov word ptr es:[bx + 0xe2], 6
2:C25B  c45e06               les bx, ptr [bp + 6]
2:C25E  26c41f               les bx, ptr es:[bx]
2:C261  26c787e400b207       mov word ptr es:[bx + 0xe4], 0x7b2
2:C268  268c9fe600           mov word ptr es:[bx + 0xe6], ds
2:C26D  c45e06               les bx, ptr [bp + 6]
2:C270  26c41f               les bx, ptr es:[bx]
2:C273  26c787e8000100       mov word ptr es:[bx + 0xe8], 1
2:C27A  c45e06               les bx, ptr [bp + 6]
2:C27D  26c41f               les bx, ptr es:[bx]
2:C280  26c787ea00b407       mov word ptr es:[bx + 0xea], 0x7b4
2:C287  268c9fec00           mov word ptr es:[bx + 0xec], ds
2:C28C  c45e06               les bx, ptr [bp + 6]
2:C28F  26c41f               les bx, ptr es:[bx]
2:C292  26c787ee000300       mov word ptr es:[bx + 0xee], 3
2:C299  c45e06               les bx, ptr [bp + 6]
2:C29C  26c41f               les bx, ptr es:[bx]
2:C29F  26c787f000ba07       mov word ptr es:[bx + 0xf0], 0x7ba
2:C2A6  268c9ff200           mov word ptr es:[bx + 0xf2], ds
2:C2AB  c45e06               les bx, ptr [bp + 6]
2:C2AE  26c41f               les bx, ptr es:[bx]
2:C2B1  26c787f4002d00       mov word ptr es:[bx + 0xf4], 0x2d
2:C2B8  c45e06               les bx, ptr [bp + 6]
2:C2BB  26c41f               les bx, ptr es:[bx]
2:C2BE  26c787f6001408       mov word ptr es:[bx + 0xf6], 0x814
2:C2C5  268c9ff800           mov word ptr es:[bx + 0xf8], ds
2:C2CA  c45e06               les bx, ptr [bp + 6]
2:C2CD  26c41f               les bx, ptr es:[bx]
2:C2D0  26c787fa000300       mov word ptr es:[bx + 0xfa], 3
2:C2D7  c45e06               les bx, ptr [bp + 6]
2:C2DA  26c41f               les bx, ptr es:[bx]
2:C2DD  26c787fc001a08       mov word ptr es:[bx + 0xfc], 0x81a
2:C2E4  268c9ffe00           mov word ptr es:[bx + 0xfe], ds
2:C2E9  c45e06               les bx, ptr [bp + 6]
2:C2EC  26c41f               les bx, ptr es:[bx]
2:C2EF  26c78700010100       mov word ptr es:[bx + 0x100], 1
2:C2F6  c45e06               les bx, ptr [bp + 6]
2:C2F9  26c41f               les bx, ptr es:[bx]
2:C2FC  26c78702011c08       mov word ptr es:[bx + 0x102], 0x81c
2:C303  268c9f0401           mov word ptr es:[bx + 0x104], ds
2:C308  c45e06               les bx, ptr [bp + 6]
2:C30B  26c41f               les bx, ptr es:[bx]
2:C30E  26c78706014b00       mov word ptr es:[bx + 0x106], 0x4b
2:C315  c45e06               les bx, ptr [bp + 6]
2:C318  26c41f               les bx, ptr es:[bx]
2:C31B  26c7870801b208       mov word ptr es:[bx + 0x108], 0x8b2
2:C322  268c9f0a01           mov word ptr es:[bx + 0x10a], ds
2:C327  c45e06               les bx, ptr [bp + 6]
2:C32A  26c41f               les bx, ptr es:[bx]
2:C32D  26c7870c010600       mov word ptr es:[bx + 0x10c], 6
2:C334  c45e06               les bx, ptr [bp + 6]
2:C337  26c41f               les bx, ptr es:[bx]
2:C33A  26c7870e01be08       mov word ptr es:[bx + 0x10e], 0x8be
2:C341  268c9f1001           mov word ptr es:[bx + 0x110], ds
2:C346  c45e06               les bx, ptr [bp + 6]
2:C349  26c41f               les bx, ptr es:[bx]
2:C34C  26c78712010400       mov word ptr es:[bx + 0x112], 4
2:C353  c45e06               les bx, ptr [bp + 6]
2:C356  26c41f               les bx, ptr es:[bx]
2:C359  26c7871a01c608       mov word ptr es:[bx + 0x11a], 0x8c6
2:C360  268c9f1c01           mov word ptr es:[bx + 0x11c], ds
2:C365  c45e06               les bx, ptr [bp + 6]
2:C368  26c41f               les bx, ptr es:[bx]
2:C36B  26c7871e013500       mov word ptr es:[bx + 0x11e], 0x35  ; 'New failed in Op::Op->ResLibr'
2:C372  c45e06               les bx, ptr [bp + 6]
2:C375  26c41f               les bx, ptr es:[bx]
2:C378  26c78720013009       mov word ptr es:[bx + 0x120], 0x930
2:C37F  268c9f2201           mov word ptr es:[bx + 0x122], ds
2:C384  c45e06               les bx, ptr [bp + 6]
2:C387  26c41f               les bx, ptr es:[bx]
2:C38A  26c78724012e00       mov word ptr es:[bx + 0x124], 0x2e
2:C391  c45e06               les bx, ptr [bp + 6]
2:C394  26c41f               les bx, ptr es:[bx]
2:C397  26c78714018c09       mov word ptr es:[bx + 0x114], 0x98c
2:C39E  268c9f1601           mov word ptr es:[bx + 0x116], ds
2:C3A3  c45e06               les bx, ptr [bp + 6]
2:C3A6  26c41f               les bx, ptr es:[bx]
2:C3A9  26c78718010100       mov word ptr es:[bx + 0x118], 1
2:C3B0  c45e06               les bx, ptr [bp + 6]
2:C3B3  26c41f               les bx, ptr es:[bx]
2:C3B6  26c78726018e09       mov word ptr es:[bx + 0x126], 0x98e
2:C3BD  268c9f2801           mov word ptr es:[bx + 0x128], ds
2:C3C2  c45e06               les bx, ptr [bp + 6]
2:C3C5  26c41f               les bx, ptr es:[bx]
2:C3C8  26c7872a010900       mov word ptr es:[bx + 0x12a], 9
2:C3CF  c45e06               les bx, ptr [bp + 6]
2:C3D2  26c41f               les bx, ptr es:[bx]
2:C3D5  26c7872c01a009       mov word ptr es:[bx + 0x12c], 0x9a0
2:C3DC  268c9f2e01           mov word ptr es:[bx + 0x12e], ds
2:C3E1  c45e06               les bx, ptr [bp + 6]
2:C3E4  26c41f               les bx, ptr es:[bx]
2:C3E7  26c78730011a00       mov word ptr es:[bx + 0x130], 0x1a
2:C3EE  c45e06               les bx, ptr [bp + 6]
2:C3F1  26c41f               les bx, ptr es:[bx]
2:C3F4  26c7873201d409       mov word ptr es:[bx + 0x132], 0x9d4
2:C3FB  268c9f3401           mov word ptr es:[bx + 0x134], ds
2:C400  c45e06               les bx, ptr [bp + 6]
2:C403  26c41f               les bx, ptr es:[bx]
2:C406  26c78736010800       mov word ptr es:[bx + 0x136], 8
2:C40D  c45e06               les bx, ptr [bp + 6]
2:C410  26c41f               les bx, ptr es:[bx]
2:C413  26c7873801e409       mov word ptr es:[bx + 0x138], 0x9e4
2:C41A  268c9f3a01           mov word ptr es:[bx + 0x13a], ds
2:C41F  c45e06               les bx, ptr [bp + 6]
2:C422  26c41f               les bx, ptr es:[bx]
2:C425  26c7873c014a00       mov word ptr es:[bx + 0x13c], 0x4a
2:C42C  c45e06               les bx, ptr [bp + 6]
2:C42F  26c41f               les bx, ptr es:[bx]
2:C432  26c7874401780a       mov word ptr es:[bx + 0x144], 0xa78
2:C439  268c9f4601           mov word ptr es:[bx + 0x146], ds
2:C43E  c45e06               les bx, ptr [bp + 6]
2:C441  26c41f               les bx, ptr es:[bx]
2:C444  26c78748010200       mov word ptr es:[bx + 0x148], 2
2:C44B  c45e06               les bx, ptr [bp + 6]
2:C44E  26c41f               les bx, ptr es:[bx]
2:C451  26c7874a017c0a       mov word ptr es:[bx + 0x14a], 0xa7c
2:C458  268c9f4c01           mov word ptr es:[bx + 0x14c], ds
2:C45D  c45e06               les bx, ptr [bp + 6]
2:C460  26c41f               les bx, ptr es:[bx]
2:C463  26c7874e010100       mov word ptr es:[bx + 0x14e], 1
2:C46A  c45e06               les bx, ptr [bp + 6]
2:C46D  26c41f               les bx, ptr es:[bx]
2:C470  26c78750017e0a       mov word ptr es:[bx + 0x150], 0xa7e
2:C477  268c9f5201           mov word ptr es:[bx + 0x152], ds
2:C47C  c45e06               les bx, ptr [bp + 6]
2:C47F  26c41f               les bx, ptr es:[bx]
2:C482  26c78754010100       mov word ptr es:[bx + 0x154], 1
2:C489  c45e06               les bx, ptr [bp + 6]
2:C48C  26c41f               les bx, ptr es:[bx]
2:C48F  26c7875601800a       mov word ptr es:[bx + 0x156], 0xa80
2:C496  268c9f5801           mov word ptr es:[bx + 0x158], ds
2:C49B  c45e06               les bx, ptr [bp + 6]
2:C49E  26c41f               les bx, ptr es:[bx]
2:C4A1  26c7875a010300       mov word ptr es:[bx + 0x15a], 3
2:C4A8  c45e06               les bx, ptr [bp + 6]
2:C4AB  26c41f               les bx, ptr es:[bx]
2:C4AE  26c7875c01860a       mov word ptr es:[bx + 0x15c], 0xa86
2:C4B5  268c9f5e01           mov word ptr es:[bx + 0x15e], ds
2:C4BA  c45e06               les bx, ptr [bp + 6]
2:C4BD  26c41f               les bx, ptr es:[bx]
2:C4C0  26c78760010200       mov word ptr es:[bx + 0x160], 2
2:C4C7  c45e06               les bx, ptr [bp + 6]
2:C4CA  26c41f               les bx, ptr es:[bx]
2:C4CD  26c78768018a0a       mov word ptr es:[bx + 0x168], 0xa8a
2:C4D4  268c9f6a01           mov word ptr es:[bx + 0x16a], ds
2:C4D9  c45e06               les bx, ptr [bp + 6]
2:C4DC  26c41f               les bx, ptr es:[bx]
2:C4DF  26c7876c011b00       mov word ptr es:[bx + 0x16c], 0x1b
2:C4E6  c45e06               les bx, ptr [bp + 6]
2:C4E9  26c41f               les bx, ptr es:[bx]
2:C4EC  26c7876e01c00a       mov word ptr es:[bx + 0x16e], 0xac0
2:C4F3  268c9f7001           mov word ptr es:[bx + 0x170], ds
2:C4F8  c45e06               les bx, ptr [bp + 6]
2:C4FB  26c41f               les bx, ptr es:[bx]
2:C4FE  26c78772011600       mov word ptr es:[bx + 0x172], 0x16
2:C505  c45e06               les bx, ptr [bp + 6]
2:C508  26c41f               les bx, ptr es:[bx]
2:C50B  26c7877401ec0a       mov word ptr es:[bx + 0x174], 0xaec
2:C512  268c9f7601           mov word ptr es:[bx + 0x176], ds
2:C517  c45e06               les bx, ptr [bp + 6]
2:C51A  26c41f               les bx, ptr es:[bx]
2:C51D  26c78778013e00       mov word ptr es:[bx + 0x178], 0x3e
2:C524  c45e06               les bx, ptr [bp + 6]
2:C527  26c41f               les bx, ptr es:[bx]
2:C52A  26c7877a01680b       mov word ptr es:[bx + 0x17a], 0xb68
2:C531  268c9f7c01           mov word ptr es:[bx + 0x17c], ds
2:C536  c45e06               les bx, ptr [bp + 6]
2:C539  26c41f               les bx, ptr es:[bx]
2:C53C  26c7877e014600       mov word ptr es:[bx + 0x17e], 0x46
2:C543  c45e06               les bx, ptr [bp + 6]
2:C546  26c41f               les bx, ptr es:[bx]
2:C549  26c7878001f40b       mov word ptr es:[bx + 0x180], 0xbf4
2:C550  268c9f8201           mov word ptr es:[bx + 0x182], ds
2:C555  c45e06               les bx, ptr [bp + 6]
2:C558  26c41f               les bx, ptr es:[bx]
2:C55B  26c78784010100       mov word ptr es:[bx + 0x184], 1
2:C562  c45e06               les bx, ptr [bp + 6]
2:C565  26c41f               les bx, ptr es:[bx]
2:C568  26c7878601f60b       mov word ptr es:[bx + 0x186], 0xbf6
2:C56F  268c9f8801           mov word ptr es:[bx + 0x188], ds
2:C574  c45e06               les bx, ptr [bp + 6]
2:C577  26c41f               les bx, ptr es:[bx]
2:C57A  26c7878a010300       mov word ptr es:[bx + 0x18a], 3
2:C581  c45e06               les bx, ptr [bp + 6]
2:C584  26c41f               les bx, ptr es:[bx]
2:C587  26c7878c01fc0b       mov word ptr es:[bx + 0x18c], 0xbfc
2:C58E  268c9f8e01           mov word ptr es:[bx + 0x18e], ds
2:C593  c45e06               les bx, ptr [bp + 6]
2:C596  26c41f               les bx, ptr es:[bx]
2:C599  26c78790010300       mov word ptr es:[bx + 0x190], 3
2:C5A0  c45e06               les bx, ptr [bp + 6]
2:C5A3  26c41f               les bx, ptr es:[bx]
2:C5A6  26c7879201020c       mov word ptr es:[bx + 0x192], 0xc02
2:C5AD  268c9f9401           mov word ptr es:[bx + 0x194], ds
2:C5B2  c45e06               les bx, ptr [bp + 6]
2:C5B5  26c41f               les bx, ptr es:[bx]
2:C5B8  26c78796010a00       mov word ptr es:[bx + 0x196], 0xa
2:C5BF  c45e06               les bx, ptr [bp + 6]
2:C5C2  26c41f               les bx, ptr es:[bx]
2:C5C5  26c7879801160c       mov word ptr es:[bx + 0x198], 0xc16
2:C5CC  268c9f9a01           mov word ptr es:[bx + 0x19a], ds
2:C5D1  c45e06               les bx, ptr [bp + 6]
2:C5D4  26c41f               les bx, ptr es:[bx]
2:C5D7  26c7879c012400       mov word ptr es:[bx + 0x19c], 0x24
2:C5DE  c45e06               les bx, ptr [bp + 6]
2:C5E1  26c41f               les bx, ptr es:[bx]
2:C5E4  26c7879e015e0c       mov word ptr es:[bx + 0x19e], 0xc5e
2:C5EB  268c9fa001           mov word ptr es:[bx + 0x1a0], ds
2:C5F0  c45e06               les bx, ptr [bp + 6]
2:C5F3  26c41f               les bx, ptr es:[bx]
2:C5F6  26c787a2010200       mov word ptr es:[bx + 0x1a2], 2
2:C5FD  c45e06               les bx, ptr [bp + 6]
2:C600  26c41f               les bx, ptr es:[bx]
2:C603  26c787a401620c       mov word ptr es:[bx + 0x1a4], 0xc62
2:C60A  268c9fa601           mov word ptr es:[bx + 0x1a6], ds
2:C60F  c45e06               les bx, ptr [bp + 6]
2:C612  26c41f               les bx, ptr es:[bx]
2:C615  26c787a8014400       mov word ptr es:[bx + 0x1a8], 0x44
2:C61C  8b4606               mov ax, word ptr [bp + 6]
2:C61F  8b5608               mov dx, word ptr [bp + 8]
2:C622  c9                   leave
2:C623  ca0400               retf 4

; ---------------- sub_s2:C626 FAR size=32 callers=1
2:C626  c8080000             enter 8, 0
2:C62A  66c706e00600000000   mov dword ptr [0x6e0], 0  ; g_bldgGroups
2:C633  c45e06               les bx, ptr [bp + 6]
2:C636  66268b0f             mov ecx, dword ptr es:[bx]
2:C63A  6651                 push ecx
2:C63C  9ace1701be           lcall 0xbe01, 0x17ce  ; operator_delete@s1:17CE
2:C641  c9                   leave
2:C642  ca0400               retf 4
2:C645  db 00

; ---------------- sub_s2:C646 FAR size=104 callers=2
2:C646  c8180000             enter 0x18, 0
2:C64A  56                   push si
2:C64B  66ff7608             push dword ptr [bp + 8]
2:C64F  ff7606               push word ptr [bp + 6]
2:C652  90                   nop
2:C653  0e                   push cs
2:C654  e8a300               call 0xc6fa  ; sub_s2:C6FA
2:C657  8946fc               mov word ptr [bp - 4], ax
2:C65A  8956fe               mov word ptr [bp - 2], dx
2:C65D  6a35                 push 0x35  ; 'New failed in Op::Op->ResLibr'
2:C65F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:C664  9aba20d2bd           lcall 0xbdd2, 0x20ba  ; sub_s3:20BA
2:C669  050a00               add ax, 0xa
2:C66C  8946f4               mov word ptr [bp - 0xc], ax
2:C66F  8956f6               mov word ptr [bp - 0xa], dx
2:C672  66c746f000000000     mov dword ptr [bp - 0x10], 0
2:C67A  eb03                 jmp 0xc67f
loc_C67C:
2:C67C  ff46f0               inc word ptr [bp - 0x10]
loc_C67F:
2:C67F  8b46f0               mov ax, word ptr [bp - 0x10]
2:C682  c45efc               les bx, ptr [bp - 4]
2:C685  26394704             cmp word ptr es:[bx + 4], ax
2:C689  7e1a                 jle 0xc6a5
2:C68B  8bf0                 mov si, ax
2:C68D  03f0                 add si, ax
2:C68F  26c41f               les bx, ptr es:[bx]
2:C692  268b00               mov ax, word ptr es:[bx + si]
2:C695  8bd8                 mov bx, ax
2:C697  03d8                 add bx, ax
2:C699  c476f4               les si, ptr [bp - 0xc]
2:C69C  26833800             cmp word ptr es:[bx + si], 0
2:C6A0  74da                 je 0xc67c
2:C6A2  8946f2               mov word ptr [bp - 0xe], ax
loc_C6A5:
2:C6A5  8b46f2               mov ax, word ptr [bp - 0xe]
2:C6A8  5e                   pop si
2:C6A9  c9                   leave
2:C6AA  ca0600               retf 6
2:C6AD  db 00

; ---------------- BldgGroups::contains@s2:C6AE FAR size=76 callers=62
2:C6AE  c8060000             enter 6, 0
2:C6B2  56                   push si
2:C6B3  ff760c               push word ptr [bp + 0xc]
2:C6B6  66ff7606             push dword ptr [bp + 6]
2:C6BA  90                   nop
2:C6BB  0e                   push cs
2:C6BC  e83b00               call 0xc6fa  ; sub_s2:C6FA
2:C6BF  8946fc               mov word ptr [bp - 4], ax
2:C6C2  8956fe               mov word ptr [bp - 2], dx
2:C6C5  c746fa0000           mov word ptr [bp - 6], 0
2:C6CA  eb03                 jmp 0xc6cf
loc_C6CC:
2:C6CC  ff46fa               inc word ptr [bp - 6]
loc_C6CF:
2:C6CF  8b46fa               mov ax, word ptr [bp - 6]
2:C6D2  c45efc               les bx, ptr [bp - 4]
2:C6D5  26394704             cmp word ptr es:[bx + 4], ax
2:C6D9  7e17                 jle 0xc6f2
2:C6DB  8bf0                 mov si, ax
2:C6DD  03f0                 add si, ax
2:C6DF  26c41f               les bx, ptr es:[bx]
2:C6E2  8b460a               mov ax, word ptr [bp + 0xa]
2:C6E5  263900               cmp word ptr es:[bx + si], ax
2:C6E8  75e2                 jne 0xc6cc
2:C6EA  b80100               mov ax, 1
2:C6ED  5e                   pop si
2:C6EE  c9                   leave
2:C6EF  ca0800               retf 8
loc_C6F2:
2:C6F2  33c0                 xor ax, ax
2:C6F4  5e                   pop si
2:C6F5  c9                   leave
2:C6F6  ca0800               retf 8
2:C6F9  db 00

; ---------------- sub_s2:C6FA FAR size=48 callers=43
2:C6FA  55                   push bp
2:C6FB  8bec                 mov bp, sp
2:C6FD  837e0a00             cmp word ptr [bp + 0xa], 0
2:C701  7e06                 jle 0xc709
2:C703  837e0a47             cmp word ptr [bp + 0xa], 0x47
2:C707  7c07                 jl 0xc710
loc_C709:
2:C709  33c0                 xor ax, ax
2:C70B  99                   cdq
2:C70C  c9                   leave
2:C70D  ca0600               retf 6
loc_C710:
2:C710  8b460a               mov ax, word ptr [bp + 0xa]
2:C713  8bc8                 mov cx, ax
2:C715  03c0                 add ax, ax
2:C717  03c1                 add ax, cx
2:C719  03c0                 add ax, ax
2:C71B  c45e06               les bx, ptr [bp + 6]
2:C71E  260307               add ax, word ptr es:[bx]
2:C721  268b5702             mov dx, word ptr es:[bx + 2]
2:C725  c9                   leave
2:C726  ca0600               retf 6
2:C729  db 90

; ---------------- sub_s2:C72A FAR size=50 callers=1
2:C72A  55                   push bp
2:C72B  8bec                 mov bp, sp
2:C72D  66ff7608             push dword ptr [bp + 8]
2:C731  ff7606               push word ptr [bp + 6]
2:C734  9a481d67c6           lcall 0xc667, 0x1d48  ; sub_s3:1D48
2:C739  c45e06               les bx, ptr [bp + 6]
2:C73C  662bc0               sub eax, eax
2:C73F  662689470a           mov dword ptr es:[bx + 0xa], eax
2:C744  662689470e           mov dword ptr es:[bx + 0xe], eax
2:C749  26c7074aca           mov word ptr es:[bx], 0xca4a
2:C74E  26c74702debd         mov word ptr es:[bx + 2], 0xbdde  ; SEGMENT s2:0000
2:C754  8bc3                 mov ax, bx
2:C756  8cc2                 mov dx, es
2:C758  c9                   leave
2:C759  ca0600               retf 6

; ---------------- sub_s2:C75C FAR size=62 callers=1
2:C75C  c8080000             enter 8, 0
2:C760  56                   push si
2:C761  c45e06               les bx, ptr [bp + 6]
2:C764  26c7074aca           mov word ptr es:[bx], 0xca4a
2:C769  26c7470252c7         mov word ptr es:[bx + 2], 0xc752  ; SEGMENT s2:0000
2:C76F  268b470a             mov ax, word ptr es:[bx + 0xa]
2:C773  268b570c             mov dx, word ptr es:[bx + 0xc]
2:C777  8bda                 mov bx, dx
2:C779  0bd0                 or dx, ax
2:C77B  740e                 je 0xc78b
2:C77D  6a01                 push 1
2:C77F  53                   push bx
2:C780  50                   push ax
2:C781  8ec3                 mov es, bx
2:C783  8bf0                 mov si, ax
2:C785  26c41c               les bx, ptr es:[si]
2:C788  26ff1f               lcall es:[bx]
loc_C78B:
2:C78B  66ff7606             push dword ptr [bp + 6]
2:C78F  9a801d37c7           lcall 0xc737, 0x1d80  ; sub_s3:1D80
2:C794  5e                   pop si
2:C795  c9                   leave
2:C796  ca0400               retf 4
2:C799  db 00

; ---------------- sub_s2:C79A FAR size=160 callers=1
2:C79A  c8240000             enter 0x24, 0
2:C79E  c45e06               les bx, ptr [bp + 6]
2:C7A1  6626ff770a           push dword ptr es:[bx + 0xa]
2:C7A6  8d46f8               lea ax, [bp - 8]
2:C7A9  16                   push ss
2:C7AA  50                   push ax
2:C7AB  90                   nop
2:C7AC  0e                   push cs
2:C7AD  e8d48f               call 0x5784  ; ListIter::ListIter@s2:5784
loc_C7B0:
2:C7B0  8d46f8               lea ax, [bp - 8]
2:C7B3  16                   push ss
2:C7B4  50                   push ax
2:C7B5  90                   nop
2:C7B6  0e                   push cs
2:C7B7  e85893               call 0x5b12  ; ListIter::next@s2:5B12
2:C7BA  8946f4               mov word ptr [bp - 0xc], ax
2:C7BD  8956f6               mov word ptr [bp - 0xa], dx
2:C7C0  0bd0                 or dx, ax
2:C7C2  7472                 je 0xc836
2:C7C4  66ff760a             push dword ptr [bp + 0xa]
2:C7C8  c45ef4               les bx, ptr [bp - 0xc]
2:C7CB  6626ff7704           push dword ptr es:[bx + 4]
2:C7D0  9a7a3d3fc6           lcall 0xc63f, 0x3d7a  ; sub_s1:3D7A
2:C7D5  83c408               add sp, 8
2:C7D8  0bc0                 or ax, ax
2:C7DA  75d4                 jne 0xc7b0
2:C7DC  8d46f0               lea ax, [bp - 0x10]
2:C7DF  16                   push ss
2:C7E0  50                   push ax
2:C7E1  9a3ea4f5c7           lcall 0xc7f5, 0xa43e  ; sub_s5:A43E
2:C7E6  c45ef4               les bx, ptr [bp - 0xc]
2:C7E9  26ff7712             push word ptr es:[bx + 0x12]
2:C7ED  8d46f0               lea ax, [bp - 0x10]
2:C7F0  16                   push ss
2:C7F1  50                   push ax
2:C7F2  9aeea60a7b           lcall 0x7b0a, 0xa6ee  ; sub_s5:A6EE
2:C7F7  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
2:C7FB  66268b4752           mov eax, dword ptr es:[bx + 0x52]
2:C800  668946ec             mov dword ptr [bp - 0x14], eax
2:C804  c45ef4               les bx, ptr [bp - 0xc]
2:C807  26ff7712             push word ptr es:[bx + 0x12]
2:C80B  6650                 push eax
2:C80D  9abe4b32b8           lcall 0xb832, 0x4bbe  ; sub_s7:4BBE
2:C812  8946e8               mov word ptr [bp - 0x18], ax
2:C815  8956ea               mov word ptr [bp - 0x16], dx
2:C818  c45ee8               les bx, ptr [bp - 0x18]
2:C81B  66260fbf879400       movsx eax, word ptr es:[bx + 0x94]
2:C822  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
2:C826  66260307             add eax, dword ptr es:[bx]
2:C82A  c45e06               les bx, ptr [bp + 6]
2:C82D  662689470e           mov dword ptr es:[bx + 0xe], eax
2:C832  e97bff               jmp 0xc7b0
2:C835  db 90
loc_C836:
2:C836  c9                   leave
2:C837  ca0800               retf 8

; ---------------- sub_s2:C83A FAR size=36 callers=1
2:C83A  c8080000             enter 8, 0
2:C83E  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
2:C842  66268b07             mov eax, dword ptr es:[bx]
2:C846  c45e06               les bx, ptr [bp + 6]
2:C849  662639470e           cmp dword ptr es:[bx + 0xe], eax
2:C84E  7208                 jb 0xc858
2:C850  b80100               mov ax, 1
2:C853  c9                   leave
2:C854  ca0400               retf 4
2:C857  db 90
loc_C858:
2:C858  33c0                 xor ax, ax
2:C85A  c9                   leave
2:C85B  ca0400               retf 4

; ---------------- sub_s2:C85E FAR size=36 callers=1
2:C85E  55                   push bp
2:C85F  8bec                 mov bp, sp
2:C861  c45e06               les bx, ptr [bp + 6]
2:C864  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:C86A  7507                 jne 0xc873
2:C86C  06                   push es
2:C86D  53                   push bx
2:C86E  90                   nop
2:C86F  0e                   push cs
2:C870  e80f00               call 0xc882  ; sub_s2:C882
loc_C873:
2:C873  c45e06               les bx, ptr [bp + 6]
2:C876  268b470a             mov ax, word ptr es:[bx + 0xa]
2:C87A  268b570c             mov dx, word ptr es:[bx + 0xc]
2:C87E  c9                   leave
2:C87F  ca0400               retf 4

; ---------------- sub_s2:C882 FAR size=268 callers=1
2:C882  c8260000             enter 0x26, 0
2:C886  56                   push si
2:C887  c45e06               les bx, ptr [bp + 6]
2:C88A  268b470a             mov ax, word ptr es:[bx + 0xa]
2:C88E  268b570c             mov dx, word ptr es:[bx + 0xc]
2:C892  8bda                 mov bx, dx
2:C894  8956ec               mov word ptr [bp - 0x14], dx
2:C897  8956f0               mov word ptr [bp - 0x10], dx
2:C89A  0bd8                 or bx, ax
2:C89C  740e                 je 0xc8ac
2:C89E  6a01                 push 1
2:C8A0  52                   push dx
2:C8A1  50                   push ax
2:C8A2  8ec2                 mov es, dx
2:C8A4  8bd8                 mov bx, ax
2:C8A6  26c41f               les bx, ptr es:[bx]
2:C8A9  26ff1f               lcall es:[bx]
loc_C8AC:
2:C8AC  6a0c                 push 0xc
2:C8AE  9a9c1763c9           lcall 0xc963, 0x179c  ; operator_new@s1:179C
2:C8B3  83c402               add sp, 2
2:C8B6  8956ec               mov word ptr [bp - 0x14], dx
2:C8B9  0bd0                 or dx, ax
2:C8BB  740b                 je 0xc8c8
2:C8BD  ff76ec               push word ptr [bp - 0x14]
2:C8C0  50                   push ax
2:C8C1  90                   nop
2:C8C2  0e                   push cs
2:C8C3  e8848e               call 0x574a  ; sub_s2:574A
2:C8C6  eb03                 jmp 0xc8cb
loc_C8C8:
2:C8C8  33c0                 xor ax, ax
2:C8CA  99                   cdq
loc_C8CB:
2:C8CB  c45e06               les bx, ptr [bp + 6]
2:C8CE  2689470a             mov word ptr es:[bx + 0xa], ax
2:C8D2  2689570c             mov word ptr es:[bx + 0xc], dx
2:C8D6  6a35                 push 0x35  ; 'New failed in Op::Op->ResLibr'
2:C8D8  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:C8DD  9aba2092c7           lcall 0xc792, 0x20ba  ; sub_s3:20BA
2:C8E2  050a00               add ax, 0xa
2:C8E5  8946f8               mov word ptr [bp - 8], ax
2:C8E8  8956fa               mov word ptr [bp - 6], dx
2:C8EB  6a44                 push 0x44
2:C8ED  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
2:C8F2  90                   nop
2:C8F3  0e                   push cs
2:C8F4  e803fe               call 0xc6fa  ; sub_s2:C6FA
2:C8F7  8946f4               mov word ptr [bp - 0xc], ax
2:C8FA  8956f6               mov word ptr [bp - 0xa], dx
2:C8FD  c746f20000           mov word ptr [bp - 0xe], 0
2:C902  eb1b                 jmp 0xc91f
loc_C904:
2:C904  33c0                 xor ax, ax
2:C906  99                   cdq
loc_C907:
2:C907  52                   push dx
2:C908  50                   push ax
2:C909  c45e06               les bx, ptr [bp + 6]
2:C90C  6626ff770a           push dword ptr es:[bx + 0xa]
2:C911  26c45f0a             les bx, ptr es:[bx + 0xa]
2:C915  26c41f               les bx, ptr es:[bx]
2:C918  26ff5f04             lcall es:[bx + 4]
loc_C91C:
2:C91C  ff46f2               inc word ptr [bp - 0xe]
loc_C91F:
2:C91F  8b46f2               mov ax, word ptr [bp - 0xe]
2:C922  c45ef4               les bx, ptr [bp - 0xc]
2:C925  26394704             cmp word ptr es:[bx + 4], ax
2:C929  7e5d                 jle 0xc988
2:C92B  8bf0                 mov si, ax
2:C92D  03f0                 add si, ax
2:C92F  26c41f               les bx, ptr es:[bx]
2:C932  268b00               mov ax, word ptr es:[bx + si]
2:C935  8946e2               mov word ptr [bp - 0x1e], ax
2:C938  8bd8                 mov bx, ax
2:C93A  03d8                 add bx, ax
2:C93C  c476f8               les si, ptr [bp - 8]
2:C93F  26833800             cmp word ptr es:[bx + si], 0
2:C943  74d7                 je 0xc91c
2:C945  50                   push ax
2:C946  9a80bde4c7           lcall 0xc7e4, 0xbd80  ; sub_s5:BD80
2:C94B  83c402               add sp, 2
2:C94E  52                   push dx
2:C94F  50                   push ax
2:C950  90                   nop
2:C951  0e                   push cs
2:C952  e89397               call 0x60e8  ; sub_s2:60E8
2:C955  83c404               add sp, 4
2:C958  8946de               mov word ptr [bp - 0x22], ax
2:C95B  8956e0               mov word ptr [bp - 0x20], dx
2:C95E  6a14                 push 0x14
2:C960  9a9c17d3c7           lcall 0xc7d3, 0x179c  ; operator_new@s1:179C
2:C965  83c402               add sp, 2
2:C968  8956f0               mov word ptr [bp - 0x10], dx
2:C96B  0bd0                 or dx, ax
2:C96D  7495                 je 0xc904
2:C96F  666a00               push 0
2:C972  66ff76e0             push dword ptr [bp - 0x20]
2:C976  ff76de               push word ptr [bp - 0x22]
2:C979  666a01               push 1
2:C97C  ff76f0               push word ptr [bp - 0x10]
2:C97F  50                   push ax
2:C980  9ac8478eaf           lcall 0xaf8e, 0x47c8  ; sub_s4:47C8
2:C985  e97fff               jmp 0xc907
loc_C988:
2:C988  5e                   pop si
2:C989  c9                   leave
2:C98A  ca0400               retf 4
2:C98D  db 00

; ---------------- sub_s2:C98E FAR size=70 callers=0
2:C98E  c80e0000             enter 0xe, 0
2:C992  6a15                 push 0x15
2:C994  66ff760a             push dword ptr [bp + 0xa]
2:C998  90                   nop
2:C999  0e                   push cs
2:C99A  e80fb3               call 0x7cac  ; Save_writeChunkTag@s2:7CAC
2:C99D  0bc0                 or ax, ax
2:C99F  742e                 je 0xc9cf
2:C9A1  c45e06               les bx, ptr [bp + 6]
2:C9A4  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:C9A9  668946f2             mov dword ptr [bp - 0xe], eax
2:C9AD  666a04               push 4
2:C9B0  8d46f2               lea ax, [bp - 0xe]
2:C9B3  16                   push ss
2:C9B4  50                   push ax
2:C9B5  66ff760a             push dword ptr [bp + 0xa]
2:C9B9  90                   nop
2:C9BA  0e                   push cs
2:C9BB  e85eb4               call 0x7e1c  ; File_write@s2:7E1C
2:C9BE  0bc0                 or ax, ax
2:C9C0  750a                 jne 0xc9cc
2:C9C2  c7061003d006         mov word ptr [0x310], 0x6d0
2:C9C8  c9                   leave
2:C9C9  ca0800               retf 8
loc_C9CC:
2:C9CC  b80100               mov ax, 1
loc_C9CF:
2:C9CF  c9                   leave
2:C9D0  ca0800               retf 8
2:C9D3  db 00

; ---------------- sub_s2:C9D4 FAR size=80 callers=0
2:C9D4  c80e0000             enter 0xe, 0
2:C9D8  833e120302           cmp word ptr [0x312], 2
2:C9DD  7d07                 jge 0xc9e6
loc_C9DF:
2:C9DF  b80100               mov ax, 1
2:C9E2  c9                   leave
2:C9E3  ca0800               retf 8
loc_C9E6:
2:C9E6  6a15                 push 0x15
2:C9E8  66ff760a             push dword ptr [bp + 0xa]
2:C9EC  90                   nop
2:C9ED  0e                   push cs
2:C9EE  e80db3               call 0x7cfe  ; sub_s2:7CFE
2:C9F1  0bc0                 or ax, ax
2:C9F3  750b                 jne 0xca00
2:C9F5  c7061003d406         mov word ptr [0x310], 0x6d4
2:C9FB  c9                   leave
2:C9FC  ca0800               retf 8
2:C9FF  db 90
loc_CA00:
2:CA00  666a04               push 4
2:CA03  668b4606             mov eax, dword ptr [bp + 6]
2:CA07  050e00               add ax, 0xe
2:CA0A  6650                 push eax
2:CA0C  66ff760a             push dword ptr [bp + 0xa]
2:CA10  90                   nop
2:CA11  0e                   push cs
2:CA12  e8d9b3               call 0x7dee  ; File_read@s2:7DEE
2:CA15  0bc0                 or ax, ax
2:CA17  75c6                 jne 0xc9df
2:CA19  c7061003d206         mov word ptr [0x310], 0x6d2
2:CA1F  c9                   leave
2:CA20  ca0800               retf 8
2:CA23  db 00

; ---------------- sub_s2:CA24 FAR size=54 callers=0
2:CA24  55                   push bp
2:CA25  8bec                 mov bp, sp
2:CA27  66ff7606             push dword ptr [bp + 6]
2:CA2B  90                   nop
2:CA2C  0e                   push cs
2:CA2D  e82cfd               call 0xc75c  ; sub_s2:C75C
2:CA30  f6460a01             test byte ptr [bp + 0xa], 1
2:CA34  7409                 je 0xca3f
2:CA36  66ff7606             push dword ptr [bp + 6]
2:CA3A  9ace17b1c8           lcall 0xc8b1, 0x17ce  ; operator_delete@s1:17CE
loc_CA3F:
2:CA3F  8b4606               mov ax, word ptr [bp + 6]
2:CA42  8b5608               mov dx, word ptr [bp + 8]
2:CA45  c9                   leave
2:CA46  ca0600               retf 6
2:CA49  db 90 24 ca 54 ca f2 1d e0 c8 8e c9 58 ca d4 c9 6d
2:CA59  db c7

; ---------------- sub_s2:CA5A FAR size=70 callers=1
2:CA5A  55                   push bp
2:CA5B  8bec                 mov bp, sp
2:CA5D  66ff7608             push dword ptr [bp + 8]
2:CA61  ff7606               push word ptr [bp + 6]
2:CA64  9a481d50ca           lcall 0xca50, 0x1d48  ; sub_s3:1D48
2:CA69  c45e06               les bx, ptr [bp + 6]
2:CA6C  662bc0               sub eax, eax
2:CA6F  662689470a           mov dword ptr es:[bx + 0xa], eax
2:CA74  662689470e           mov dword ptr es:[bx + 0xe], eax
2:CA79  6626894712           mov dword ptr es:[bx + 0x12], eax
2:CA7E  6626894716           mov dword ptr es:[bx + 0x16], eax
2:CA83  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:CA88  662689471e           mov dword ptr es:[bx + 0x1e], eax
2:CA8D  26c7071ad7           mov word ptr es:[bx], 0xd71a
2:CA92  26c747024cca         mov word ptr es:[bx + 2], 0xca4c  ; SEGMENT s2:0000
2:CA98  8bc3                 mov ax, bx
2:CA9A  8cc2                 mov dx, es
2:CA9C  c9                   leave
2:CA9D  ca0600               retf 6

; ---------------- sub_s2:CAA0 FAR size=38 callers=2
2:CAA0  55                   push bp
2:CAA1  8bec                 mov bp, sp
2:CAA3  c45e06               les bx, ptr [bp + 6]
2:CAA6  26c7071ad7           mov word ptr es:[bx], 0xd71a
2:CAAB  26c7470296ca         mov word ptr es:[bx + 2], 0xca96  ; SEGMENT s2:0000
2:CAB1  06                   push es
2:CAB2  53                   push bx
2:CAB3  90                   nop
2:CAB4  0e                   push cs
2:CAB5  e80e00               call 0xcac6  ; sub_s2:CAC6
2:CAB8  66ff7606             push dword ptr [bp + 6]
2:CABC  9a801d67ca           lcall 0xca67, 0x1d80  ; sub_s3:1D80
2:CAC1  c9                   leave
2:CAC2  ca0400               retf 4
2:CAC5  db 00

; ---------------- sub_s2:CAC6 FAR size=254 callers=2
2:CAC6  c8080000             enter 8, 0
2:CACA  56                   push si
2:CACB  c45e06               les bx, ptr [bp + 6]
2:CACE  268b470a             mov ax, word ptr es:[bx + 0xa]
2:CAD2  268b570c             mov dx, word ptr es:[bx + 0xc]
2:CAD6  8bda                 mov bx, dx
2:CAD8  0bd8                 or bx, ax
2:CADA  740e                 je 0xcaea
2:CADC  6a01                 push 1
2:CADE  52                   push dx
2:CADF  50                   push ax
2:CAE0  8ec2                 mov es, dx
2:CAE2  8bd8                 mov bx, ax
2:CAE4  26c41f               les bx, ptr es:[bx]
2:CAE7  26ff1f               lcall es:[bx]
loc_CAEA:
2:CAEA  c45e06               les bx, ptr [bp + 6]
2:CAED  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
2:CAF6  268b470e             mov ax, word ptr es:[bx + 0xe]
2:CAFA  268b5710             mov dx, word ptr es:[bx + 0x10]
2:CAFE  8bda                 mov bx, dx
2:CB00  0bd0                 or dx, ax
2:CB02  740e                 je 0xcb12
2:CB04  6a01                 push 1
2:CB06  53                   push bx
2:CB07  50                   push ax
2:CB08  8ec3                 mov es, bx
2:CB0A  8bf0                 mov si, ax
2:CB0C  26c41c               les bx, ptr es:[si]
2:CB0F  26ff1f               lcall es:[bx]
loc_CB12:
2:CB12  c45e06               les bx, ptr [bp + 6]
2:CB15  6626c7470e00000000   mov dword ptr es:[bx + 0xe], 0
2:CB1E  268b4712             mov ax, word ptr es:[bx + 0x12]
2:CB22  268b5714             mov dx, word ptr es:[bx + 0x14]
2:CB26  8bda                 mov bx, dx
2:CB28  0bd0                 or dx, ax
2:CB2A  740e                 je 0xcb3a
2:CB2C  6a01                 push 1
2:CB2E  53                   push bx
2:CB2F  50                   push ax
2:CB30  8ec3                 mov es, bx
2:CB32  8bf0                 mov si, ax
2:CB34  26c41c               les bx, ptr es:[si]
2:CB37  26ff1f               lcall es:[bx]
loc_CB3A:
2:CB3A  c45e06               les bx, ptr [bp + 6]
2:CB3D  6626c7471200000000   mov dword ptr es:[bx + 0x12], 0
2:CB46  268b4716             mov ax, word ptr es:[bx + 0x16]
2:CB4A  268b5718             mov dx, word ptr es:[bx + 0x18]
2:CB4E  8bda                 mov bx, dx
2:CB50  0bd0                 or dx, ax
2:CB52  740e                 je 0xcb62
2:CB54  6a01                 push 1
2:CB56  53                   push bx
2:CB57  50                   push ax
2:CB58  8ec3                 mov es, bx
2:CB5A  8bf0                 mov si, ax
2:CB5C  26c41c               les bx, ptr es:[si]
2:CB5F  26ff1f               lcall es:[bx]
loc_CB62:
2:CB62  c45e06               les bx, ptr [bp + 6]
2:CB65  6626c7471600000000   mov dword ptr es:[bx + 0x16], 0
2:CB6E  268b471a             mov ax, word ptr es:[bx + 0x1a]
2:CB72  268b571c             mov dx, word ptr es:[bx + 0x1c]
2:CB76  8bda                 mov bx, dx
2:CB78  0bd0                 or dx, ax
2:CB7A  740e                 je 0xcb8a
2:CB7C  6a01                 push 1
2:CB7E  53                   push bx
2:CB7F  50                   push ax
2:CB80  8ec3                 mov es, bx
2:CB82  8bf0                 mov si, ax
2:CB84  26c41c               les bx, ptr es:[si]
2:CB87  26ff1f               lcall es:[bx]
loc_CB8A:
2:CB8A  c45e06               les bx, ptr [bp + 6]
2:CB8D  6626c7471a00000000   mov dword ptr es:[bx + 0x1a], 0
2:CB96  268b471e             mov ax, word ptr es:[bx + 0x1e]
2:CB9A  268b5720             mov dx, word ptr es:[bx + 0x20]
2:CB9E  8bda                 mov bx, dx
2:CBA0  0bd0                 or dx, ax
2:CBA2  740e                 je 0xcbb2
2:CBA4  6a01                 push 1
2:CBA6  53                   push bx
2:CBA7  50                   push ax
2:CBA8  8ec3                 mov es, bx
2:CBAA  8bf0                 mov si, ax
2:CBAC  26c41c               les bx, ptr es:[si]
2:CBAF  26ff1f               lcall es:[bx]
loc_CBB2:
2:CBB2  c45e06               les bx, ptr [bp + 6]
2:CBB5  6626c7471e00000000   mov dword ptr es:[bx + 0x1e], 0
2:CBBE  5e                   pop si
2:CBBF  c9                   leave
2:CBC0  ca0400               retf 4
2:CBC3  db 00

; ---------------- sub_s2:CBC4 FAR size=478 callers=1
2:CBC4  c83e0000             enter 0x3e, 0
2:CBC8  c45e06               les bx, ptr [bp + 6]
2:CBCB  268b471e             mov ax, word ptr es:[bx + 0x1e]
2:CBCF  268b5720             mov dx, word ptr es:[bx + 0x20]
2:CBD3  8bda                 mov bx, dx
2:CBD5  8946da               mov word ptr [bp - 0x26], ax
2:CBD8  8956dc               mov word ptr [bp - 0x24], dx
2:CBDB  8946de               mov word ptr [bp - 0x22], ax
2:CBDE  8956e0               mov word ptr [bp - 0x20], dx
2:CBE1  0bd8                 or bx, ax
2:CBE3  740e                 je 0xcbf3
2:CBE5  6a01                 push 1
2:CBE7  52                   push dx
2:CBE8  50                   push ax
2:CBE9  8ec2                 mov es, dx
2:CBEB  8bd8                 mov bx, ax
2:CBED  26c41f               les bx, ptr es:[bx]
2:CBF0  26ff1f               lcall es:[bx]
loc_CBF3:
2:CBF3  6a0c                 push 0xc
2:CBF5  9a9c17decc           lcall 0xccde, 0x179c  ; operator_new@s1:179C
2:CBFA  83c402               add sp, 2
2:CBFD  8946da               mov word ptr [bp - 0x26], ax
2:CC00  8956dc               mov word ptr [bp - 0x24], dx
2:CC03  0bd0                 or dx, ax
2:CC05  740b                 je 0xcc12
2:CC07  ff76dc               push word ptr [bp - 0x24]
2:CC0A  50                   push ax
2:CC0B  90                   nop
2:CC0C  0e                   push cs
2:CC0D  e83a8b               call 0x574a  ; sub_s2:574A
2:CC10  eb03                 jmp 0xcc15
loc_CC12:
2:CC12  33c0                 xor ax, ax
2:CC14  99                   cdq
loc_CC15:
2:CC15  c45e06               les bx, ptr [bp + 6]
2:CC18  2689471e             mov word ptr es:[bx + 0x1e], ax
2:CC1C  26895720             mov word ptr es:[bx + 0x20], dx
2:CC20  c45e0a               les bx, ptr [bp + 0xa]
2:CC23  66268b870002         mov eax, dword ptr es:[bx + 0x200]
2:CC29  668946fc             mov dword ptr [bp - 4], eax
2:CC2D  666800000004         push 0x4000000
2:CC33  6a01                 push 1
2:CC35  8d46ea               lea ax, [bp - 0x16]
2:CC38  16                   push ss
2:CC39  50                   push ax
2:CC3A  9a52dc4ccc           lcall 0xcc4c, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
2:CC3F  c746e40000           mov word ptr [bp - 0x1c], 0
loc_CC44:
2:CC44  8d46ea               lea ax, [bp - 0x16]
2:CC47  16                   push ss
2:CC48  50                   push ax
2:CC49  9aece49acc           lcall 0xcc9a, 0xe4ec  ; DbIter::next@s6:E4EC
2:CC4E  8946e6               mov word ptr [bp - 0x1a], ax
2:CC51  8956e8               mov word ptr [bp - 0x18], dx
2:CC54  0bd0                 or dx, ax
2:CC56  7414                 je 0xcc6c
2:CC58  668b46fc             mov eax, dword ptr [bp - 4]
2:CC5C  c45ee6               les bx, ptr [bp - 0x1a]
2:CC5F  662639870002         cmp dword ptr es:[bx + 0x200], eax
2:CC65  75dd                 jne 0xcc44
2:CC67  ff46e4               inc word ptr [bp - 0x1c]
2:CC6A  ebd8                 jmp 0xcc44
loc_CC6C:
2:CC6C  c746e20000           mov word ptr [bp - 0x1e], 0
2:CC71  837ee401             cmp word ptr [bp - 0x1c], 1
2:CC75  0f8ebb00             jle 0xcd34
2:CC79  837efa00             cmp word ptr [bp - 6], 0
2:CC7D  7407                 je 0xcc86
2:CC7F  b80100               mov ax, 1
2:CC82  99                   cdq
2:CC83  eb07                 jmp 0xcc8c
2:CC85  db 90
loc_CC86:
2:CC86  8b46f6               mov ax, word ptr [bp - 0xa]
2:CC89  8b56f8               mov dx, word ptr [bp - 8]
loc_CC8C:
2:CC8C  8946f2               mov word ptr [bp - 0xe], ax
2:CC8F  8956f4               mov word ptr [bp - 0xc], dx
loc_CC92:
2:CC92  8d46ea               lea ax, [bp - 0x16]
2:CC95  16                   push ss
2:CC96  50                   push ax
2:CC97  9aece482b2           lcall 0xb282, 0xe4ec  ; DbIter::next@s6:E4EC
2:CC9C  8946e6               mov word ptr [bp - 0x1a], ax
2:CC9F  8956e8               mov word ptr [bp - 0x18], dx
2:CCA2  0bd0                 or dx, ax
2:CCA4  0f848c00             je 0xcd34
2:CCA8  668b46fc             mov eax, dword ptr [bp - 4]
2:CCAC  c45ee6               les bx, ptr [bp - 0x1a]
2:CCAF  662639870002         cmp dword ptr es:[bx + 0x200], eax
2:CCB5  75db                 jne 0xcc92
2:CCB7  6626817f0401000004   cmp dword ptr es:[bx + 4], 0x4000001
2:CCC0  74d0                 je 0xcc92
2:CCC2  06                   push es
2:CCC3  53                   push bx
2:CCC4  9a284dadb5           lcall 0xb5ad, 0x4d28  ; sub_s8:4D28
2:CCC9  52                   push dx
2:CCCA  50                   push ax
2:CCCB  90                   nop
2:CCCC  0e                   push cs
2:CCCD  e81894               call 0x60e8  ; sub_s2:60E8
2:CCD0  83c404               add sp, 4
2:CCD3  8946ce               mov word ptr [bp - 0x32], ax
2:CCD6  8956d0               mov word ptr [bp - 0x30], dx
2:CCD9  6a12                 push 0x12  ; 'version %d %d'
2:CCDB  9a9c1752cd           lcall 0xcd52, 0x179c  ; operator_new@s1:179C
2:CCE0  83c402               add sp, 2
2:CCE3  8946de               mov word ptr [bp - 0x22], ax
2:CCE6  8956e0               mov word ptr [bp - 0x20], dx
2:CCE9  0bd0                 or dx, ax
2:CCEB  7421                 je 0xcd0e
2:CCED  c45ee6               les bx, ptr [bp - 0x1a]
2:CCF0  6626ff7704           push dword ptr es:[bx + 4]
2:CCF5  66ff76ce             push dword ptr [bp - 0x32]
2:CCF9  666a01               push 1
2:CCFC  ff76e0               push word ptr [bp - 0x20]
2:CCFF  50                   push ax
2:CD00  9a204972cd           lcall 0xcd72, 0x4920  ; sub_s4:4920
2:CD05  8946ca               mov word ptr [bp - 0x36], ax
2:CD08  8956cc               mov word ptr [bp - 0x34], dx
2:CD0B  eb08                 jmp 0xcd15
2:CD0D  db 90
loc_CD0E:
2:CD0E  662bc0               sub eax, eax
2:CD11  668946ca             mov dword ptr [bp - 0x36], eax
loc_CD15:
2:CD15  ff76cc               push word ptr [bp - 0x34]
2:CD18  50                   push ax
2:CD19  c45e06               les bx, ptr [bp + 6]
2:CD1C  6626ff771e           push dword ptr es:[bx + 0x1e]
2:CD21  26c45f1e             les bx, ptr es:[bx + 0x1e]
2:CD25  26c41f               les bx, ptr es:[bx]
2:CD28  26ff5f04             lcall es:[bx + 4]
2:CD2C  c746e20100           mov word ptr [bp - 0x1e], 1
2:CD31  e95eff               jmp 0xcc92
loc_CD34:
2:CD34  837ee200             cmp word ptr [bp - 0x1e], 0
2:CD38  755a                 jne 0xcd94
2:CD3A  683d04               push 0x43d
2:CD3D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:CD42  9aac84bfca           lcall 0xcabf, 0x84ac  ; sub_s3:84AC
2:CD47  8946c2               mov word ptr [bp - 0x3e], ax
2:CD4A  8956c4               mov word ptr [bp - 0x3c], dx
2:CD4D  6a12                 push 0x12  ; 'version %d %d'
2:CD4F  9a9c173dca           lcall 0xca3d, 0x179c  ; operator_new@s1:179C
2:CD54  83c402               add sp, 2
2:CD57  8946da               mov word ptr [bp - 0x26], ax
2:CD5A  8956dc               mov word ptr [bp - 0x24], dx
2:CD5D  0bd0                 or dx, ax
2:CD5F  7415                 je 0xcd76
2:CD61  666a00               push 0
2:CD64  66ff76c2             push dword ptr [bp - 0x3e]
2:CD68  666a00               push 0
2:CD6B  ff76dc               push word ptr [bp - 0x24]
2:CD6E  50                   push ax
2:CD6F  9a204983c9           lcall 0xc983, 0x4920  ; sub_s4:4920
2:CD74  eb03                 jmp 0xcd79
loc_CD76:
2:CD76  33c0                 xor ax, ax
2:CD78  99                   cdq
loc_CD79:
2:CD79  8946c6               mov word ptr [bp - 0x3a], ax
2:CD7C  8956c8               mov word ptr [bp - 0x38], dx
2:CD7F  52                   push dx
2:CD80  50                   push ax
2:CD81  c45e06               les bx, ptr [bp + 6]
2:CD84  6626ff771e           push dword ptr es:[bx + 0x1e]
2:CD89  26c45f1e             les bx, ptr es:[bx + 0x1e]
2:CD8D  26c41f               les bx, ptr es:[bx]
2:CD90  26ff5f04             lcall es:[bx + 4]
loc_CD94:
2:CD94  c746ea9a38           mov word ptr [bp - 0x16], 0x389a
2:CD99  c746ecafca           mov word ptr [bp - 0x14], 0xcaaf  ; SEGMENT s2:0000
2:CD9E  c9                   leave
2:CD9F  ca0800               retf 8

; ---------------- sub_s2:CDA2 FAR size=510 callers=1
2:CDA2  c8340000             enter 0x34, 0
2:CDA6  c45e06               les bx, ptr [bp + 6]
2:CDA9  268b471a             mov ax, word ptr es:[bx + 0x1a]
2:CDAD  268b571c             mov dx, word ptr es:[bx + 0x1c]
2:CDB1  8bda                 mov bx, dx
2:CDB3  8946f0               mov word ptr [bp - 0x10], ax
2:CDB6  8956f2               mov word ptr [bp - 0xe], dx
2:CDB9  8946f4               mov word ptr [bp - 0xc], ax
2:CDBC  8956f6               mov word ptr [bp - 0xa], dx
2:CDBF  0bd8                 or bx, ax
2:CDC1  740e                 je 0xcdd1
2:CDC3  6a01                 push 1
2:CDC5  52                   push dx
2:CDC6  50                   push ax
2:CDC7  8ec2                 mov es, dx
2:CDC9  8bd8                 mov bx, ax
2:CDCB  26c41f               les bx, ptr es:[bx]
2:CDCE  26ff1f               lcall es:[bx]
loc_CDD1:
2:CDD1  6a0c                 push 0xc
2:CDD3  9a9c1756ce           lcall 0xce56, 0x179c  ; operator_new@s1:179C
2:CDD8  83c402               add sp, 2
2:CDDB  8946f0               mov word ptr [bp - 0x10], ax
2:CDDE  8956f2               mov word ptr [bp - 0xe], dx
2:CDE1  0bd0                 or dx, ax
2:CDE3  740b                 je 0xcdf0
2:CDE5  ff76f2               push word ptr [bp - 0xe]
2:CDE8  50                   push ax
2:CDE9  90                   nop
2:CDEA  0e                   push cs
2:CDEB  e85c89               call 0x574a  ; sub_s2:574A
2:CDEE  eb03                 jmp 0xcdf3
loc_CDF0:
2:CDF0  33c0                 xor ax, ax
2:CDF2  99                   cdq
loc_CDF3:
2:CDF3  c45e06               les bx, ptr [bp + 6]
2:CDF6  2689471a             mov word ptr es:[bx + 0x1a], ax
2:CDFA  2689571c             mov word ptr es:[bx + 0x1c], dx
2:CDFE  c746fe0000           mov word ptr [bp - 2], 0
2:CE03  c45e0a               les bx, ptr [bp + 0xa]
2:CE06  66268b871002         mov eax, dword ptr es:[bx + 0x210]
2:CE0C  268b971202           mov dx, word ptr es:[bx + 0x212]
2:CE11  668946fa             mov dword ptr [bp - 6], eax
2:CE15  8bc2                 mov ax, dx
2:CE17  0b46fa               or ax, word ptr [bp - 6]
2:CE1A  0f841a01             je 0xcf38
2:CE1E  c45efa               les bx, ptr [bp - 6]
2:CE21  66268b470a           mov eax, dword ptr es:[bx + 0xa]
2:CE26  668946e8             mov dword ptr [bp - 0x18], eax
2:CE2A  66c746e400000000     mov dword ptr [bp - 0x1c], 0
2:CE32  e9d700               jmp 0xcf0c
2:CE35  db 90
loc_CE36:
2:CE36  ff76de               push word ptr [bp - 0x22]
2:CE39  9a22c249c9           lcall 0xc949, 0xc222  ; sub_s5:C222
2:CE3E  83c402               add sp, 2
2:CE41  52                   push dx
2:CE42  50                   push ax
2:CE43  90                   nop
2:CE44  0e                   push cs
2:CE45  e8a092               call 0x60e8  ; sub_s2:60E8
2:CE48  83c404               add sp, 4
2:CE4B  8946cc               mov word ptr [bp - 0x34], ax
2:CE4E  8956ce               mov word ptr [bp - 0x32], dx
2:CE51  6a10                 push 0x10
2:CE53  9a9c175bcf           lcall 0xcf5b, 0x179c  ; operator_new@s1:179C
2:CE58  83c402               add sp, 2
2:CE5B  8946f4               mov word ptr [bp - 0xc], ax
2:CE5E  8956f6               mov word ptr [bp - 0xa], dx
2:CE61  0bd0                 or dx, ax
2:CE63  7419                 je 0xce7e
2:CE65  ff76de               push word ptr [bp - 0x22]
2:CE68  66ff76cc             push dword ptr [bp - 0x34]
2:CE6C  660fbf46dc           movsx eax, word ptr [bp - 0x24]
2:CE71  6650                 push eax
2:CE73  66ff76f4             push dword ptr [bp - 0xc]
2:CE77  9ab0487acf           lcall 0xcf7a, 0x48b0  ; sub_s4:48B0
2:CE7C  eb03                 jmp 0xce81
loc_CE7E:
2:CE7E  33c0                 xor ax, ax
2:CE80  99                   cdq
loc_CE81:
2:CE81  8946d0               mov word ptr [bp - 0x30], ax
2:CE84  8956d2               mov word ptr [bp - 0x2e], dx
2:CE87  52                   push dx
2:CE88  50                   push ax
2:CE89  c45e06               les bx, ptr [bp + 6]
2:CE8C  6626ff771a           push dword ptr es:[bx + 0x1a]
2:CE91  26c45f1a             les bx, ptr es:[bx + 0x1a]
2:CE95  26c41f               les bx, ptr es:[bx]
2:CE98  26ff5f04             lcall es:[bx + 4]
loc_CE9C:
2:CE9C  c746fe0100           mov word ptr [bp - 2], 1
loc_CEA1:
2:CEA1  ff46de               inc word ptr [bp - 0x22]
loc_CEA4:
2:CEA4  837ede15             cmp word ptr [bp - 0x22], 0x15
2:CEA8  7d5e                 jge 0xcf08
2:CEAA  ff76de               push word ptr [bp - 0x22]
2:CEAD  66ff76e0             push dword ptr [bp - 0x20]
2:CEB1  9a2ece24cf           lcall 0xcf24, 0xce2e  ; sub_s7:CE2E
2:CEB6  8946dc               mov word ptr [bp - 0x24], ax
2:CEB9  0bc0                 or ax, ax
2:CEBB  74e4                 je 0xcea1
2:CEBD  c45e06               les bx, ptr [bp + 6]
2:CEC0  6626ff771a           push dword ptr es:[bx + 0x1a]
2:CEC5  8d46d4               lea ax, [bp - 0x2c]
2:CEC8  16                   push ss
2:CEC9  50                   push ax
2:CECA  90                   nop
2:CECB  0e                   push cs
2:CECC  e8b588               call 0x5784  ; ListIter::ListIter@s2:5784
loc_CECF:
2:CECF  8d46d4               lea ax, [bp - 0x2c]
2:CED2  16                   push ss
2:CED3  50                   push ax
2:CED4  90                   nop
2:CED5  0e                   push cs
2:CED6  e8398c               call 0x5b12  ; ListIter::next@s2:5B12
2:CED9  8946d0               mov word ptr [bp - 0x30], ax
2:CEDC  8956d2               mov word ptr [bp - 0x2e], dx
2:CEDF  0bd0                 or dx, ax
2:CEE1  740c                 je 0xceef
2:CEE3  8b46de               mov ax, word ptr [bp - 0x22]
2:CEE6  c45ed0               les bx, ptr [bp - 0x30]
2:CEE9  2639470e             cmp word ptr es:[bx + 0xe], ax
2:CEED  75e0                 jne 0xcecf
loc_CEEF:
2:CEEF  66837ed000           cmp dword ptr [bp - 0x30], 0
2:CEF4  0f843eff             je 0xce36
2:CEF8  660fbf46dc           movsx eax, word ptr [bp - 0x24]
2:CEFD  c45ed0               les bx, ptr [bp - 0x30]
2:CF00  6626014708           add dword ptr es:[bx + 8], eax
2:CF05  eb95                 jmp 0xce9c
2:CF07  db 90
loc_CF08:
2:CF08  66ff46e4             inc dword ptr [bp - 0x1c]
loc_CF0C:
2:CF0C  668b46e8             mov eax, dword ptr [bp - 0x18]
2:CF10  8b56ea               mov dx, word ptr [bp - 0x16]
2:CF13  663946e4             cmp dword ptr [bp - 0x1c], eax
2:CF17  731f                 jae 0xcf38
2:CF19  66ff76e4             push dword ptr [bp - 0x1c]
2:CF1D  66ff76fa             push dword ptr [bp - 6]
2:CF21  9a121310c8           lcall 0xc810, 0x1312  ; sub_s7:1312
2:CF26  8946e0               mov word ptr [bp - 0x20], ax
2:CF29  8956e2               mov word ptr [bp - 0x1e], dx
2:CF2C  0bd0                 or dx, ax
2:CF2E  74d8                 je 0xcf08
2:CF30  c746de0100           mov word ptr [bp - 0x22], 1
2:CF35  e96cff               jmp 0xcea4
loc_CF38:
2:CF38  c746f80000           mov word ptr [bp - 8], 0
2:CF3D  837efe00             cmp word ptr [bp - 2], 0
2:CF41  7559                 jne 0xcf9c
2:CF43  683f04               push 0x43f
2:CF46  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:CF4B  9aac8445cd           lcall 0xcd45, 0x84ac  ; sub_s3:84AC
2:CF50  8946cc               mov word ptr [bp - 0x34], ax
2:CF53  8956ce               mov word ptr [bp - 0x32], dx
2:CF56  6a10                 push 0x10
2:CF58  9a9c17f8cb           lcall 0xcbf8, 0x179c  ; operator_new@s1:179C
2:CF5D  83c402               add sp, 2
2:CF60  8946f0               mov word ptr [bp - 0x10], ax
2:CF63  8956f2               mov word ptr [bp - 0xe], dx
2:CF66  0bd0                 or dx, ax
2:CF68  7414                 je 0xcf7e
2:CF6A  6a00                 push 0
2:CF6C  66ff76cc             push dword ptr [bp - 0x34]
2:CF70  666a00               push 0
2:CF73  ff76f2               push word ptr [bp - 0xe]
2:CF76  50                   push ax
2:CF77  9ab04803cd           lcall 0xcd03, 0x48b0  ; sub_s4:48B0
2:CF7C  eb03                 jmp 0xcf81
loc_CF7E:
2:CF7E  33c0                 xor ax, ax
2:CF80  99                   cdq
loc_CF81:
2:CF81  8946d0               mov word ptr [bp - 0x30], ax
2:CF84  8956d2               mov word ptr [bp - 0x2e], dx
2:CF87  52                   push dx
2:CF88  50                   push ax
2:CF89  c45e06               les bx, ptr [bp + 6]
2:CF8C  6626ff771a           push dword ptr es:[bx + 0x1a]
2:CF91  26c45f1a             les bx, ptr es:[bx + 0x1a]
2:CF95  26c41f               les bx, ptr es:[bx]
2:CF98  26ff5f04             lcall es:[bx + 4]
loc_CF9C:
2:CF9C  c9                   leave
2:CF9D  ca0800               retf 8

; ---------------- sub_s2:CFA0 FAR size=550 callers=1
2:CFA0  c8220000             enter 0x22, 0
2:CFA4  c45e06               les bx, ptr [bp + 6]
2:CFA7  268b4716             mov ax, word ptr es:[bx + 0x16]
2:CFAB  268b5718             mov dx, word ptr es:[bx + 0x18]
2:CFAF  8bda                 mov bx, dx
2:CFB1  8956ec               mov word ptr [bp - 0x14], dx
2:CFB4  8956f0               mov word ptr [bp - 0x10], dx
2:CFB7  0bd8                 or bx, ax
2:CFB9  740e                 je 0xcfc9
2:CFBB  6a01                 push 1
2:CFBD  52                   push dx
2:CFBE  50                   push ax
2:CFBF  8ec2                 mov es, dx
2:CFC1  8bd8                 mov bx, ax
2:CFC3  26c41f               les bx, ptr es:[bx]
2:CFC6  26ff1f               lcall es:[bx]
loc_CFC9:
2:CFC9  6a0c                 push 0xc
2:CFCB  9a9c1737d0           lcall 0xd037, 0x179c  ; operator_new@s1:179C
2:CFD0  83c402               add sp, 2
2:CFD3  8956ec               mov word ptr [bp - 0x14], dx
2:CFD6  0bd0                 or dx, ax
2:CFD8  740c                 je 0xcfe6
2:CFDA  ff76ec               push word ptr [bp - 0x14]
2:CFDD  50                   push ax
2:CFDE  90                   nop
2:CFDF  0e                   push cs
2:CFE0  e86787               call 0x574a  ; sub_s2:574A
2:CFE3  eb04                 jmp 0xcfe9
2:CFE5  db 90
loc_CFE6:
2:CFE6  33c0                 xor ax, ax
2:CFE8  99                   cdq
loc_CFE9:
2:CFE9  c45e06               les bx, ptr [bp + 6]
2:CFEC  26894716             mov word ptr es:[bx + 0x16], ax
2:CFF0  26895718             mov word ptr es:[bx + 0x18], dx
2:CFF4  c746fe0000           mov word ptr [bp - 2], 0
2:CFF9  c45e0a               les bx, ptr [bp + 0xa]
2:CFFC  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
2:D002  668946fa             mov dword ptr [bp - 6], eax
2:D006  6a02                 push 2
2:D008  6650                 push eax
2:D00A  9af23884d0           lcall 0xd084, 0x38f2  ; sub_s7:38F2
2:D00F  8946f2               mov word ptr [bp - 0xe], ax
2:D012  8956f4               mov word ptr [bp - 0xc], dx
2:D015  0bd2                 or dx, dx
2:D017  7c62                 jl 0xd07b
2:D019  7f04                 jg 0xd01f
2:D01B  0bc0                 or ax, ax
2:D01D  745c                 je 0xd07b
loc_D01F:
2:D01F  683004               push 0x430
2:D022  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D027  9aac84a1d0           lcall 0xd0a1, 0x84ac  ; sub_s3:84AC
2:D02C  8946f6               mov word ptr [bp - 0xa], ax
2:D02F  8956f8               mov word ptr [bp - 8], dx
2:D032  6a14                 push 0x14
2:D034  9a9c17aed0           lcall 0xd0ae, 0x179c  ; operator_new@s1:179C
2:D039  83c402               add sp, 2
2:D03C  8956f0               mov word ptr [bp - 0x10], dx
2:D03F  0bd0                 or dx, ax
2:D041  7415                 je 0xd058
2:D043  6a02                 push 2
2:D045  66ff76f6             push dword ptr [bp - 0xa]
2:D049  66ff76f2             push dword ptr [bp - 0xe]
2:D04D  ff76f0               push word ptr [bp - 0x10]
2:D050  50                   push ax
2:D051  9a4248cbd0           lcall 0xd0cb, 0x4842  ; sub_s4:4842
2:D056  eb03                 jmp 0xd05b
loc_D058:
2:D058  33c0                 xor ax, ax
2:D05A  99                   cdq
loc_D05B:
2:D05B  8946e2               mov word ptr [bp - 0x1e], ax
2:D05E  8956e4               mov word ptr [bp - 0x1c], dx
2:D061  52                   push dx
2:D062  50                   push ax
2:D063  c45e06               les bx, ptr [bp + 6]
2:D066  6626ff7716           push dword ptr es:[bx + 0x16]
2:D06B  26c45f16             les bx, ptr es:[bx + 0x16]
2:D06F  26c41f               les bx, ptr es:[bx]
2:D072  26ff5f04             lcall es:[bx + 4]
2:D076  c746fe0100           mov word ptr [bp - 2], 1
loc_D07B:
2:D07B  6a03                 push 3
2:D07D  66ff76fa             push dword ptr [bp - 6]
2:D081  9af238fcd0           lcall 0xd0fc, 0x38f2  ; sub_s7:38F2
2:D086  8946f2               mov word ptr [bp - 0xe], ax
2:D089  8956f4               mov word ptr [bp - 0xc], dx
2:D08C  0bd2                 or dx, dx
2:D08E  7c63                 jl 0xd0f3
2:D090  7f04                 jg 0xd096
2:D092  0bc0                 or ax, ax
2:D094  745d                 je 0xd0f3
loc_D096:
2:D096  683104               push 0x431
2:D099  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D09E  9aac8419d1           lcall 0xd119, 0x84ac  ; sub_s3:84AC
2:D0A3  8946f6               mov word ptr [bp - 0xa], ax
2:D0A6  8956f8               mov word ptr [bp - 8], dx
2:D0A9  6a14                 push 0x14
2:D0AB  9a9c1726d1           lcall 0xd126, 0x179c  ; operator_new@s1:179C
2:D0B0  83c402               add sp, 2
2:D0B3  8956ec               mov word ptr [bp - 0x14], dx
2:D0B6  0bd0                 or dx, ax
2:D0B8  7416                 je 0xd0d0
2:D0BA  6a03                 push 3
2:D0BC  66ff76f6             push dword ptr [bp - 0xa]
2:D0C0  66ff76f2             push dword ptr [bp - 0xe]
2:D0C4  ff76ec               push word ptr [bp - 0x14]
2:D0C7  50                   push ax
2:D0C8  9a424843d1           lcall 0xd143, 0x4842  ; sub_s4:4842
2:D0CD  eb04                 jmp 0xd0d3
2:D0CF  db 90
loc_D0D0:
2:D0D0  33c0                 xor ax, ax
2:D0D2  99                   cdq
loc_D0D3:
2:D0D3  8946e2               mov word ptr [bp - 0x1e], ax
2:D0D6  8956e4               mov word ptr [bp - 0x1c], dx
2:D0D9  52                   push dx
2:D0DA  50                   push ax
2:D0DB  c45e06               les bx, ptr [bp + 6]
2:D0DE  6626ff7716           push dword ptr es:[bx + 0x16]
2:D0E3  26c45f16             les bx, ptr es:[bx + 0x16]
2:D0E7  26c41f               les bx, ptr es:[bx]
2:D0EA  26ff5f04             lcall es:[bx + 4]
2:D0EE  c746fe0100           mov word ptr [bp - 2], 1
loc_D0F3:
2:D0F3  6a04                 push 4
2:D0F5  66ff76fa             push dword ptr [bp - 6]
2:D0F9  9af238b4ce           lcall 0xceb4, 0x38f2  ; sub_s7:38F2
2:D0FE  8946f2               mov word ptr [bp - 0xe], ax
2:D101  8956f4               mov word ptr [bp - 0xc], dx
2:D104  0bd2                 or dx, dx
2:D106  7c63                 jl 0xd16b
2:D108  7f04                 jg 0xd10e
2:D10A  0bc0                 or ax, ax
2:D10C  745d                 je 0xd16b
loc_D10E:
2:D10E  683204               push 0x432
2:D111  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D116  9aac847cd1           lcall 0xd17c, 0x84ac  ; sub_s3:84AC
2:D11B  8946f6               mov word ptr [bp - 0xa], ax
2:D11E  8956f8               mov word ptr [bp - 8], dx
2:D121  6a14                 push 0x14
2:D123  9a9c1789d1           lcall 0xd189, 0x179c  ; operator_new@s1:179C
2:D128  83c402               add sp, 2
2:D12B  8956f0               mov word ptr [bp - 0x10], dx
2:D12E  0bd0                 or dx, ax
2:D130  7416                 je 0xd148
2:D132  6a04                 push 4
2:D134  66ff76f6             push dword ptr [bp - 0xa]
2:D138  66ff76f2             push dword ptr [bp - 0xe]
2:D13C  ff76f0               push word ptr [bp - 0x10]
2:D13F  50                   push ax
2:D140  9a4248a5d1           lcall 0xd1a5, 0x4842  ; sub_s4:4842
2:D145  eb04                 jmp 0xd14b
2:D147  db 90
loc_D148:
2:D148  33c0                 xor ax, ax
2:D14A  99                   cdq
loc_D14B:
2:D14B  8946e2               mov word ptr [bp - 0x1e], ax
2:D14E  8956e4               mov word ptr [bp - 0x1c], dx
2:D151  52                   push dx
2:D152  50                   push ax
2:D153  c45e06               les bx, ptr [bp + 6]
2:D156  6626ff7716           push dword ptr es:[bx + 0x16]
2:D15B  26c45f16             les bx, ptr es:[bx + 0x16]
2:D15F  26c41f               les bx, ptr es:[bx]
2:D162  26ff5f04             lcall es:[bx + 4]
2:D166  c746fe0100           mov word ptr [bp - 2], 1
loc_D16B:
2:D16B  837efe00             cmp word ptr [bp - 2], 0
2:D16F  7551                 jne 0xd1c2
2:D171  684004               push 0x440
2:D174  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D179  9aac844ecf           lcall 0xcf4e, 0x84ac  ; sub_s3:84AC
2:D17E  8946e2               mov word ptr [bp - 0x1e], ax
2:D181  8956e4               mov word ptr [bp - 0x1c], dx
2:D184  6a14                 push 0x14
2:D186  9a9c17d6cd           lcall 0xcdd6, 0x179c  ; operator_new@s1:179C
2:D18B  83c402               add sp, 2
2:D18E  8956ec               mov word ptr [bp - 0x14], dx
2:D191  0bd0                 or dx, ax
2:D193  7415                 je 0xd1aa
2:D195  6a00                 push 0
2:D197  66ff76e2             push dword ptr [bp - 0x1e]
2:D19B  666a00               push 0
2:D19E  ff76ec               push word ptr [bp - 0x14]
2:D1A1  50                   push ax
2:D1A2  9a42487ace           lcall 0xce7a, 0x4842  ; sub_s4:4842
2:D1A7  eb04                 jmp 0xd1ad
2:D1A9  db 90
loc_D1AA:
2:D1AA  33c0                 xor ax, ax
2:D1AC  99                   cdq
loc_D1AD:
2:D1AD  52                   push dx
2:D1AE  50                   push ax
2:D1AF  c45e06               les bx, ptr [bp + 6]
2:D1B2  6626ff7716           push dword ptr es:[bx + 0x16]
2:D1B7  26c45f16             les bx, ptr es:[bx + 0x16]
2:D1BB  26c41f               les bx, ptr es:[bx]
2:D1BE  26ff5f04             lcall es:[bx + 4]
loc_D1C2:
2:D1C2  c9                   leave
2:D1C3  ca0800               retf 8

; ---------------- sub_s2:D1C6 FAR size=488 callers=1
;   apis: USER._wsprintf
2:D1C6  c8400000             enter 0x40, 0
2:D1CA  c45e06               les bx, ptr [bp + 6]
2:D1CD  268b4712             mov ax, word ptr es:[bx + 0x12]
2:D1D1  268b5714             mov dx, word ptr es:[bx + 0x14]
2:D1D5  8bda                 mov bx, dx
2:D1D7  8956e8               mov word ptr [bp - 0x18], dx
2:D1DA  8956ec               mov word ptr [bp - 0x14], dx
2:D1DD  0bd8                 or bx, ax
2:D1DF  740e                 je 0xd1ef
2:D1E1  6a01                 push 1
2:D1E3  52                   push dx
2:D1E4  50                   push ax
2:D1E5  8ec2                 mov es, dx
2:D1E7  8bd8                 mov bx, ax
2:D1E9  26c41f               les bx, ptr es:[bx]
2:D1EC  26ff1f               lcall es:[bx]
loc_D1EF:
2:D1EF  6a0c                 push 0xc
2:D1F1  9a9c17ebd2           lcall 0xd2eb, 0x179c  ; operator_new@s1:179C
2:D1F6  83c402               add sp, 2
2:D1F9  8956e8               mov word ptr [bp - 0x18], dx
2:D1FC  0bd0                 or dx, ax
2:D1FE  740c                 je 0xd20c
2:D200  ff76e8               push word ptr [bp - 0x18]
2:D203  50                   push ax
2:D204  90                   nop
2:D205  0e                   push cs
2:D206  e84185               call 0x574a  ; sub_s2:574A
2:D209  eb04                 jmp 0xd20f
2:D20B  db 90
loc_D20C:
2:D20C  33c0                 xor ax, ax
2:D20E  99                   cdq
loc_D20F:
2:D20F  c45e06               les bx, ptr [bp + 6]
2:D212  26894712             mov word ptr es:[bx + 0x12], ax
2:D216  26895714             mov word ptr es:[bx + 0x14], dx
2:D21A  6a02                 push 2
2:D21C  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
2:D221  90                   nop
2:D222  0e                   push cs
2:D223  e8d4f4               call 0xc6fa  ; sub_s2:C6FA
2:D226  52                   push dx
2:D227  50                   push ax
2:D228  66ff760a             push dword ptr [bp + 0xa]
2:D22C  9a784ec7cc           lcall 0xccc7, 0x4e78  ; sub_s8:4E78
2:D231  8946f8               mov word ptr [bp - 8], ax
2:D234  8956fa               mov word ptr [bp - 6], dx
2:D237  52                   push dx
2:D238  c45ef8               les bx, ptr [bp - 8]
2:D23B  50                   push ax
2:D23C  26c41f               les bx, ptr es:[bx]
2:D23F  26ff5f10             lcall es:[bx + 0x10]
2:D243  8946f4               mov word ptr [bp - 0xc], ax
2:D246  8956f6               mov word ptr [bp - 0xa], dx
2:D249  c746f20000           mov word ptr [bp - 0xe], 0
2:D24E  66c746ee00000000     mov dword ptr [bp - 0x12], 0
2:D256  eb14                 jmp 0xd26c
loc_D258:
2:D258  c45ee2               les bx, ptr [bp - 0x1e]
2:D25B  66268b471c           mov eax, dword ptr es:[bx + 0x1c]
2:D260  663d02000008         cmp eax, 0x8000002
2:D266  752a                 jne 0xd292
loc_D268:
2:D268  66ff46ee             inc dword ptr [bp - 0x12]
loc_D26C:
2:D26C  668b46f4             mov eax, dword ptr [bp - 0xc]
2:D270  663946ee             cmp dword ptr [bp - 0x12], eax
2:D274  0f83c000             jae 0xd338
2:D278  66ff76ee             push dword ptr [bp - 0x12]
2:D27C  66ff76f8             push dword ptr [bp - 8]
2:D280  9a7c1d0dd0           lcall 0xd00d, 0x1d7c  ; sub_s7:1D7C
2:D285  8946e2               mov word ptr [bp - 0x1e], ax
2:D288  8956e4               mov word ptr [bp - 0x1c], dx
2:D28B  0bd0                 or dx, ax
2:D28D  75c9                 jne 0xd258
2:D28F  ebd7                 jmp 0xd268
2:D291  db 90
loc_D292:
2:D292  268b4712             mov ax, word ptr es:[bx + 0x12]
2:D296  3d0500               cmp ax, 5
2:D299  7405                 je 0xd2a0
2:D29B  3d0600               cmp ax, 6
2:D29E  75c8                 jne 0xd268
loc_D2A0:
2:D2A0  268b4704             mov ax, word ptr es:[bx + 4]
2:D2A4  268b5706             mov dx, word ptr es:[bx + 6]
2:D2A8  2af6                 sub dh, dh
2:D2AA  52                   push dx
2:D2AB  50                   push ax
2:D2AC  26ff770c             push word ptr es:[bx + 0xc]
2:D2B0  9a80bd3cce           lcall 0xce3c, 0xbd80  ; sub_s5:BD80
2:D2B5  83c402               add sp, 2
2:D2B8  52                   push dx
2:D2B9  50                   push ax
2:D2BA  1e                   push ds
2:D2BB  68ea0c               push 0xcea  ; '%s #%02ld'
2:D2BE  668b4606             mov eax, dword ptr [bp + 6]
2:D2C2  052200               add ax, 0x22
2:D2C5  6650                 push eax
2:D2C7  9ae7b70000           lcall 0, 0xb7e7  ; USER._wsprintf
2:D2CC  83c410               add sp, 0x10
2:D2CF  668b4606             mov eax, dword ptr [bp + 6]
2:D2D3  052200               add ax, 0x22
2:D2D6  6650                 push eax
2:D2D8  90                   nop
2:D2D9  0e                   push cs
2:D2DA  e80b8e               call 0x60e8  ; sub_s2:60E8
2:D2DD  83c404               add sp, 4
2:D2E0  8946d0               mov word ptr [bp - 0x30], ax
2:D2E3  8956d2               mov word ptr [bp - 0x2e], dx
2:D2E6  6a12                 push 0x12  ; 'version %d %d'
2:D2E8  9a9c1756d3           lcall 0xd356, 0x179c  ; operator_new@s1:179C
2:D2ED  83c402               add sp, 2
2:D2F0  8956ec               mov word ptr [bp - 0x14], dx
2:D2F3  0bd0                 or dx, ax
2:D2F5  741d                 je 0xd314
2:D2F7  c45ee2               les bx, ptr [bp - 0x1e]
2:D2FA  6626ff7704           push dword ptr es:[bx + 4]
2:D2FF  66ff76d0             push dword ptr [bp - 0x30]
2:D303  666a01               push 1
2:D306  ff76ec               push word ptr [bp - 0x14]
2:D309  50                   push ax
2:D30A  9a084873d3           lcall 0xd373, 0x4808  ; sub_s4:4808
2:D30F  8956ce               mov word ptr [bp - 0x32], dx
2:D312  eb05                 jmp 0xd319
loc_D314:
2:D314  2bc0                 sub ax, ax
2:D316  8946ce               mov word ptr [bp - 0x32], ax
loc_D319:
2:D319  ff76ce               push word ptr [bp - 0x32]
2:D31C  50                   push ax
2:D31D  c45e06               les bx, ptr [bp + 6]
2:D320  6626ff7712           push dword ptr es:[bx + 0x12]
2:D325  26c45f12             les bx, ptr es:[bx + 0x12]
2:D329  26c41f               les bx, ptr es:[bx]
2:D32C  26ff5f04             lcall es:[bx + 4]
2:D330  c746f20100           mov word ptr [bp - 0xe], 1
2:D335  e930ff               jmp 0xd268
loc_D338:
2:D338  837ef200             cmp word ptr [bp - 0xe], 0
2:D33C  7552                 jne 0xd390
2:D33E  684104               push 0x441
2:D341  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D346  9aac842ad0           lcall 0xd02a, 0x84ac  ; sub_s3:84AC
2:D34B  8946c0               mov word ptr [bp - 0x40], ax
2:D34E  8956c2               mov word ptr [bp - 0x3e], dx
2:D351  6a12                 push 0x12  ; 'version %d %d'
2:D353  9a9c17cecf           lcall 0xcfce, 0x179c  ; operator_new@s1:179C
2:D358  83c402               add sp, 2
2:D35B  8956e8               mov word ptr [bp - 0x18], dx
2:D35E  0bd0                 or dx, ax
2:D360  7416                 je 0xd378
2:D362  666a00               push 0
2:D365  66ff76c0             push dword ptr [bp - 0x40]
2:D369  666a00               push 0
2:D36C  ff76e8               push word ptr [bp - 0x18]
2:D36F  50                   push ax
2:D370  9a084854d0           lcall 0xd054, 0x4808  ; sub_s4:4808
2:D375  eb04                 jmp 0xd37b
2:D377  db 90
loc_D378:
2:D378  33c0                 xor ax, ax
2:D37A  99                   cdq
loc_D37B:
2:D37B  52                   push dx
2:D37C  50                   push ax
2:D37D  c45e06               les bx, ptr [bp + 6]
2:D380  6626ff7712           push dword ptr es:[bx + 0x12]
2:D385  26c45f12             les bx, ptr es:[bx + 0x12]
2:D389  26c41f               les bx, ptr es:[bx]
2:D38C  26ff5f04             lcall es:[bx + 4]
loc_D390:
2:D390  8b46f8               mov ax, word ptr [bp - 8]
2:D393  8b56fa               mov dx, word ptr [bp - 6]
2:D396  8956ec               mov word ptr [bp - 0x14], dx
2:D399  0bd0                 or dx, ax
2:D39B  740d                 je 0xd3aa
2:D39D  6a01                 push 1
2:D39F  c45ef8               les bx, ptr [bp - 8]
2:D3A2  06                   push es
2:D3A3  50                   push ax
2:D3A4  26c41f               les bx, ptr es:[bx]
2:D3A7  26ff1f               lcall es:[bx]
loc_D3AA:
2:D3AA  c9                   leave
2:D3AB  ca0800               retf 8

; ---------------- sub_s2:D3AE FAR size=328 callers=1
2:D3AE  c81c0000             enter 0x1c, 0
2:D3B2  c45e06               les bx, ptr [bp + 6]
2:D3B5  268b470a             mov ax, word ptr es:[bx + 0xa]
2:D3B9  268b570c             mov dx, word ptr es:[bx + 0xc]
2:D3BD  8bda                 mov bx, dx
2:D3BF  8956f6               mov word ptr [bp - 0xa], dx
2:D3C2  8956fa               mov word ptr [bp - 6], dx
2:D3C5  0bd8                 or bx, ax
2:D3C7  740e                 je 0xd3d7
2:D3C9  6a01                 push 1
2:D3CB  52                   push dx
2:D3CC  50                   push ax
2:D3CD  8ec2                 mov es, dx
2:D3CF  8bd8                 mov bx, ax
2:D3D1  26c41f               les bx, ptr es:[bx]
2:D3D4  26ff1f               lcall es:[bx]
loc_D3D7:
2:D3D7  6a0c                 push 0xc
2:D3D9  9a9c1773d4           lcall 0xd473, 0x179c  ; operator_new@s1:179C
2:D3DE  83c402               add sp, 2
2:D3E1  8956f6               mov word ptr [bp - 0xa], dx
2:D3E4  0bd0                 or dx, ax
2:D3E6  740c                 je 0xd3f4
2:D3E8  ff76f6               push word ptr [bp - 0xa]
2:D3EB  50                   push ax
2:D3EC  90                   nop
2:D3ED  0e                   push cs
2:D3EE  e85983               call 0x574a  ; sub_s2:574A
2:D3F1  eb04                 jmp 0xd3f7
2:D3F3  db 90
loc_D3F4:
2:D3F4  33c0                 xor ax, ax
2:D3F6  99                   cdq
loc_D3F7:
2:D3F7  c45e06               les bx, ptr [bp + 6]
2:D3FA  2689470a             mov word ptr es:[bx + 0xa], ax
2:D3FE  2689570c             mov word ptr es:[bx + 0xc], dx
2:D402  c746fe0000           mov word ptr [bp - 2], 0
2:D407  c746fc2100           mov word ptr [bp - 4], 0x21
2:D40C  eb21                 jmp 0xd42f
loc_D40E:
2:D40E  33c0                 xor ax, ax
2:D410  99                   cdq
loc_D411:
2:D411  8946e4               mov word ptr [bp - 0x1c], ax
2:D414  8956e6               mov word ptr [bp - 0x1a], dx
2:D417  52                   push dx
2:D418  50                   push ax
2:D419  c45e06               les bx, ptr [bp + 6]
2:D41C  6626ff770a           push dword ptr es:[bx + 0xa]
2:D421  26c45f0a             les bx, ptr es:[bx + 0xa]
2:D425  26c41f               les bx, ptr es:[bx]
2:D428  26ff5f04             lcall es:[bx + 4]
loc_D42C:
2:D42C  ff4efc               dec word ptr [bp - 4]
loc_D42F:
2:D42F  837efc11             cmp word ptr [bp - 4], 0x11
2:D433  7c61                 jl 0xd496
2:D435  ff76fc               push word ptr [bp - 4]
2:D438  66ff760a             push dword ptr [bp + 0xa]
2:D43C  9a0a542fd2           lcall 0xd22f, 0x540a  ; sub_s8:540A
2:D441  8946f0               mov word ptr [bp - 0x10], ax
2:D444  8956f2               mov word ptr [bp - 0xe], dx
2:D447  8bc2                 mov ax, dx
2:D449  0b46f0               or ax, word ptr [bp - 0x10]
2:D44C  74de                 je 0xd42c
2:D44E  c746fe0100           mov word ptr [bp - 2], 1
2:D453  ff76fc               push word ptr [bp - 4]
2:D456  9acac0b3d2           lcall 0xd2b3, 0xc0ca  ; sub_s5:C0CA
2:D45B  83c402               add sp, 2
2:D45E  52                   push dx
2:D45F  50                   push ax
2:D460  90                   nop
2:D461  0e                   push cs
2:D462  e8838c               call 0x60e8  ; sub_s2:60E8
2:D465  83c404               add sp, 4
2:D468  8946ea               mov word ptr [bp - 0x16], ax
2:D46B  8956ec               mov word ptr [bp - 0x14], dx
2:D46E  6a10                 push 0x10
2:D470  9a9c17b4d4           lcall 0xd4b4, 0x179c  ; operator_new@s1:179C
2:D475  83c402               add sp, 2
2:D478  8956fa               mov word ptr [bp - 6], dx
2:D47B  0bd0                 or dx, ax
2:D47D  748f                 je 0xd40e
2:D47F  ff76fc               push word ptr [bp - 4]
2:D482  66ff76ea             push dword ptr [bp - 0x16]
2:D486  66ff76f0             push dword ptr [bp - 0x10]
2:D48A  ff76fa               push word ptr [bp - 6]
2:D48D  50                   push ax
2:D48E  9a9047d0d4           lcall 0xd4d0, 0x4790  ; sub_s4:4790
2:D493  e97bff               jmp 0xd411
loc_D496:
2:D496  837efe00             cmp word ptr [bp - 2], 0
2:D49A  7556                 jne 0xd4f2
2:D49C  683e04               push 0x43e
2:D49F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D4A4  9aac8449d3           lcall 0xd349, 0x84ac  ; sub_s3:84AC
2:D4A9  8946e4               mov word ptr [bp - 0x1c], ax
2:D4AC  8956e6               mov word ptr [bp - 0x1a], dx
2:D4AF  6a10                 push 0x10
2:D4B1  9a9c17f4d1           lcall 0xd1f4, 0x179c  ; operator_new@s1:179C
2:D4B6  83c402               add sp, 2
2:D4B9  8956f6               mov word ptr [bp - 0xa], dx
2:D4BC  0bd0                 or dx, ax
2:D4BE  7414                 je 0xd4d4
2:D4C0  6a00                 push 0
2:D4C2  66ff76e4             push dword ptr [bp - 0x1c]
2:D4C6  666a00               push 0
2:D4C9  ff76f6               push word ptr [bp - 0xa]
2:D4CC  50                   push ax
2:D4CD  9a90470dd3           lcall 0xd30d, 0x4790  ; sub_s4:4790
2:D4D2  eb03                 jmp 0xd4d7
loc_D4D4:
2:D4D4  33c0                 xor ax, ax
2:D4D6  99                   cdq
loc_D4D7:
2:D4D7  8946ea               mov word ptr [bp - 0x16], ax
2:D4DA  8956ec               mov word ptr [bp - 0x14], dx
2:D4DD  52                   push dx
2:D4DE  50                   push ax
2:D4DF  c45e06               les bx, ptr [bp + 6]
2:D4E2  6626ff770a           push dword ptr es:[bx + 0xa]
2:D4E7  26c45f0a             les bx, ptr es:[bx + 0xa]
2:D4EB  26c41f               les bx, ptr es:[bx]
2:D4EE  26ff5f04             lcall es:[bx + 4]
loc_D4F2:
2:D4F2  c9                   leave
2:D4F3  ca0800               retf 8

; ---------------- sub_s2:D4F6 FAR size=510 callers=1
;   apis: USER._wsprintf
2:D4F6  c84c0000             enter 0x4c, 0
2:D4FA  57                   push di
2:D4FB  56                   push si
2:D4FC  c45e0a               les bx, ptr [bp + 0xa]
2:D4FF  66268b870002         mov eax, dword ptr es:[bx + 0x200]
2:D505  668946fc             mov dword ptr [bp - 4], eax
2:D509  c45e06               les bx, ptr [bp + 6]
2:D50C  268b470e             mov ax, word ptr es:[bx + 0xe]
2:D510  268b5710             mov dx, word ptr es:[bx + 0x10]
2:D514  8bda                 mov bx, dx
2:D516  8956e4               mov word ptr [bp - 0x1c], dx
2:D519  8956e8               mov word ptr [bp - 0x18], dx
2:D51C  0bd8                 or bx, ax
2:D51E  740e                 je 0xd52e
2:D520  6a01                 push 1
2:D522  52                   push dx
2:D523  50                   push ax
2:D524  8ec2                 mov es, dx
2:D526  8bd8                 mov bx, ax
2:D528  26c41f               les bx, ptr es:[bx]
2:D52B  26ff1f               lcall es:[bx]
loc_D52E:
2:D52E  6a0c                 push 0xc
2:D530  9a9c1743d6           lcall 0xd643, 0x179c  ; operator_new@s1:179C
2:D535  83c402               add sp, 2
2:D538  8956e4               mov word ptr [bp - 0x1c], dx
2:D53B  0bd0                 or dx, ax
2:D53D  740b                 je 0xd54a
2:D53F  ff76e4               push word ptr [bp - 0x1c]
2:D542  50                   push ax
2:D543  90                   nop
2:D544  0e                   push cs
2:D545  e80282               call 0x574a  ; sub_s2:574A
2:D548  eb03                 jmp 0xd54d
loc_D54A:
2:D54A  33c0                 xor ax, ax
2:D54C  99                   cdq
loc_D54D:
2:D54D  c45e06               les bx, ptr [bp + 6]
2:D550  2689470e             mov word ptr es:[bx + 0xe], ax
2:D554  26895710             mov word ptr es:[bx + 0x10], dx
2:D558  c45e0a               les bx, ptr [bp + 0xa]
2:D55B  66268b470c           mov eax, dword ptr es:[bx + 0xc]
2:D560  268b570e             mov dx, word ptr es:[bx + 0xe]
2:D564  668946f8             mov dword ptr [bp - 8], eax
2:D568  52                   push dx
2:D569  c45ef8               les bx, ptr [bp - 8]
2:D56C  50                   push ax
2:D56D  26c41f               les bx, ptr es:[bx]
2:D570  26ff5f10             lcall es:[bx + 0x10]
2:D574  8946f4               mov word ptr [bp - 0xc], ax
2:D577  8956f6               mov word ptr [bp - 0xa], dx
2:D57A  c746f20000           mov word ptr [bp - 0xe], 0
2:D57F  66c746ee00000000     mov dword ptr [bp - 0x12], 0
2:D587  eb15                 jmp 0xd59e
2:D589  db 90
loc_D58A:
2:D58A  c45eea               les bx, ptr [bp - 0x16]
2:D58D  66268b471c           mov eax, dword ptr es:[bx + 0x1c]
2:D592  663d02000008         cmp eax, 0x8000002
2:D598  752c                 jne 0xd5c6
loc_D59A:
2:D59A  66ff46ee             inc dword ptr [bp - 0x12]
loc_D59E:
2:D59E  668b46f4             mov eax, dword ptr [bp - 0xc]
2:D5A2  8b56f6               mov dx, word ptr [bp - 0xa]
2:D5A5  663946ee             cmp dword ptr [bp - 0x12], eax
2:D5A9  0f83e700             jae 0xd694
2:D5AD  66ff76ee             push dword ptr [bp - 0x12]
2:D5B1  66ff76f8             push dword ptr [bp - 8]
2:D5B5  9a7c1d83d2           lcall 0xd283, 0x1d7c  ; sub_s7:1D7C
2:D5BA  8946ea               mov word ptr [bp - 0x16], ax
2:D5BD  8956ec               mov word ptr [bp - 0x14], dx
2:D5C0  0bd0                 or dx, ax
2:D5C2  75c6                 jne 0xd58a
2:D5C4  ebd4                 jmp 0xd59a
loc_D5C6:
2:D5C6  268b4712             mov ax, word ptr es:[bx + 0x12]
2:D5CA  3d0500               cmp ax, 5
2:D5CD  7405                 je 0xd5d4
2:D5CF  3d0600               cmp ax, 6
2:D5D2  75c6                 jne 0xd59a
loc_D5D4:
2:D5D4  268b470c             mov ax, word ptr es:[bx + 0xc]
2:D5D8  8946d6               mov word ptr [bp - 0x2a], ax
2:D5DB  6a34                 push 0x34
2:D5DD  50                   push ax
2:D5DE  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
2:D5E3  90                   nop
2:D5E4  0e                   push cs
2:D5E5  e8c6f0               call 0xc6ae  ; BldgGroups::contains@s2:C6AE
2:D5E8  0bc0                 or ax, ax
2:D5EA  75ae                 jne 0xd59a
2:D5EC  668b46fc             mov eax, dword ptr [bp - 4]
2:D5F0  c45eea               les bx, ptr [bp - 0x16]
2:D5F3  662639471c           cmp dword ptr es:[bx + 0x1c], eax
2:D5F8  74a0                 je 0xd59a
2:D5FA  268b4704             mov ax, word ptr es:[bx + 4]
2:D5FE  268b5706             mov dx, word ptr es:[bx + 6]
2:D602  2af6                 sub dh, dh
2:D604  52                   push dx
2:D605  50                   push ax
2:D606  ff76d6               push word ptr [bp - 0x2a]
2:D609  9a80bd59d4           lcall 0xd459, 0xbd80  ; sub_s5:BD80
2:D60E  83c402               add sp, 2
2:D611  52                   push dx
2:D612  50                   push ax
2:D613  1e                   push ds
2:D614  68f40c               push 0xcf4  ; '%s #%02ld'
2:D617  8b4606               mov ax, word ptr [bp + 6]
2:D61A  8b5608               mov dx, word ptr [bp + 8]
2:D61D  052200               add ax, 0x22
2:D620  52                   push dx
2:D621  50                   push ax
2:D622  8bf0                 mov si, ax
2:D624  8bfa                 mov di, dx
2:D626  9ac8d20000           lcall 0, 0xd2c8  ; USER._wsprintf
2:D62B  83c410               add sp, 0x10
2:D62E  57                   push di
2:D62F  56                   push si
2:D630  90                   nop
2:D631  0e                   push cs
2:D632  e8b38a               call 0x60e8  ; sub_s2:60E8
2:D635  83c404               add sp, 4
2:D638  8946ca               mov word ptr [bp - 0x36], ax
2:D63B  8956cc               mov word ptr [bp - 0x34], dx
2:D63E  6a14                 push 0x14
2:D640  9a9c17b2d6           lcall 0xd6b2, 0x179c  ; operator_new@s1:179C
2:D645  83c402               add sp, 2
2:D648  8956e8               mov word ptr [bp - 0x18], dx
2:D64B  0bd0                 or dx, ax
2:D64D  7421                 je 0xd670
2:D64F  c45eea               les bx, ptr [bp - 0x16]
2:D652  6626ff7704           push dword ptr es:[bx + 4]
2:D657  26ff770c             push word ptr es:[bx + 0xc]
2:D65B  66ff76ca             push dword ptr [bp - 0x36]
2:D65F  666a01               push 1
2:D662  ff76e8               push word ptr [bp - 0x18]
2:D665  50                   push ax
2:D666  9ac847d1d6           lcall 0xd6d1, 0x47c8  ; sub_s4:47C8
2:D66B  8956c8               mov word ptr [bp - 0x38], dx
2:D66E  eb05                 jmp 0xd675
loc_D670:
2:D670  2bc0                 sub ax, ax
2:D672  8946c8               mov word ptr [bp - 0x38], ax
loc_D675:
2:D675  ff76c8               push word ptr [bp - 0x38]
2:D678  50                   push ax
2:D679  c45e06               les bx, ptr [bp + 6]
2:D67C  6626ff770e           push dword ptr es:[bx + 0xe]
2:D681  26c45f0e             les bx, ptr es:[bx + 0xe]
2:D685  26c41f               les bx, ptr es:[bx]
2:D688  26ff5f04             lcall es:[bx + 4]
2:D68C  c746f20100           mov word ptr [bp - 0xe], 1
2:D691  e906ff               jmp 0xd59a
loc_D694:
2:D694  837ef200             cmp word ptr [bp - 0xe], 0
2:D698  7554                 jne 0xd6ee
2:D69A  684204               push 0x442
2:D69D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D6A2  9aac84a7d4           lcall 0xd4a7, 0x84ac  ; sub_s3:84AC
2:D6A7  8946b4               mov word ptr [bp - 0x4c], ax
2:D6AA  8956b6               mov word ptr [bp - 0x4a], dx
2:D6AD  6a14                 push 0x14
2:D6AF  9a9c17dcd3           lcall 0xd3dc, 0x179c  ; operator_new@s1:179C
2:D6B4  83c402               add sp, 2
2:D6B7  8956e4               mov word ptr [bp - 0x1c], dx
2:D6BA  0bd0                 or dx, ax
2:D6BC  7418                 je 0xd6d6
2:D6BE  666a00               push 0
2:D6C1  6a00                 push 0
2:D6C3  66ff76b4             push dword ptr [bp - 0x4c]
2:D6C7  666a00               push 0
2:D6CA  ff76e4               push word ptr [bp - 0x1c]
2:D6CD  50                   push ax
2:D6CE  9ac84791d4           lcall 0xd491, 0x47c8  ; sub_s4:47C8
2:D6D3  eb04                 jmp 0xd6d9
2:D6D5  db 90
loc_D6D6:
2:D6D6  33c0                 xor ax, ax
2:D6D8  99                   cdq
loc_D6D9:
2:D6D9  52                   push dx
2:D6DA  50                   push ax
2:D6DB  c45e06               les bx, ptr [bp + 6]
2:D6DE  6626ff770e           push dword ptr es:[bx + 0xe]
2:D6E3  26c45f0e             les bx, ptr es:[bx + 0xe]
2:D6E7  26c41f               les bx, ptr es:[bx]
2:D6EA  26ff5f04             lcall es:[bx + 4]
loc_D6EE:
2:D6EE  5e                   pop si
2:D6EF  5f                   pop di
2:D6F0  c9                   leave
2:D6F1  ca0800               retf 8

; ---------------- sub_s2:D6F4 FAR size=58 callers=0
2:D6F4  55                   push bp
2:D6F5  8bec                 mov bp, sp
2:D6F7  66ff7606             push dword ptr [bp + 6]
2:D6FB  90                   nop
2:D6FC  0e                   push cs
2:D6FD  e8a0f3               call 0xcaa0  ; sub_s2:CAA0
2:D700  f6460a01             test byte ptr [bp + 0xa], 1
2:D704  7409                 je 0xd70f
2:D706  66ff7606             push dword ptr [bp + 6]
2:D70A  9ace1733d5           lcall 0xd533, 0x17ce  ; operator_delete@s1:17CE
loc_D70F:
2:D70F  8b4606               mov ax, word ptr [bp + 6]
2:D712  8b5608               mov dx, word ptr [bp + 8]
2:D715  c9                   leave
2:D716  ca0600               retf 6
2:D719  db 90 f4 d6 2c d7 f2 1d 24 d7 ce 1d 28 d7 d4 1d a5
2:D729  db d6 c6 ca 9c cd

; ---------------- sub_s2:D72E FAR size=44 callers=1
2:D72E  55                   push bp
2:D72F  8bec                 mov bp, sp
2:D731  66ff7608             push dword ptr [bp + 8]
2:D735  ff7606               push word ptr [bp + 6]
2:D738  9a481d20d7           lcall 0xd720, 0x1d48  ; sub_s3:1D48
2:D73D  c45e06               les bx, ptr [bp + 6]
2:D740  26c7470a0000         mov word ptr es:[bx + 0xa], 0
2:D746  26c70780d7           mov word ptr es:[bx], 0xd780
2:D74B  26c747021cd7         mov word ptr es:[bx + 2], 0xd71c  ; SEGMENT s2:0000
2:D751  8bc3                 mov ax, bx
2:D753  8cc2                 mov dx, es
2:D755  c9                   leave
2:D756  ca0600               retf 6
2:D759  db 00

; ---------------- sub_s2:D75A FAR size=54 callers=0
2:D75A  c8040000             enter 4, 0
2:D75E  66ff7606             push dword ptr [bp + 6]
2:D762  9a801d3bd7           lcall 0xd73b, 0x1d80  ; sub_s3:1D80
2:D767  f6460a01             test byte ptr [bp + 0xa], 1
2:D76B  7409                 je 0xd776
2:D76D  66ff7606             push dword ptr [bp + 6]
2:D771  9ace170dd7           lcall 0xd70d, 0x17ce  ; operator_delete@s1:17CE
loc_D776:
2:D776  8b4606               mov ax, word ptr [bp + 6]
2:D779  8b5608               mov dx, word ptr [bp + 8]
2:D77C  c9                   leave
2:D77D  ca0600               retf 6
2:D780  db 5a d7 4f d7 f2 1d 8a d7 ce 1d 8e d7 d4 1d 65 d7

; ---------------- sub_s2:D790 FAR size=74 callers=1
2:D790  55                   push bp
2:D791  8bec                 mov bp, sp
2:D793  66ff7608             push dword ptr [bp + 8]
2:D797  ff7606               push word ptr [bp + 6]
2:D79A  9a481dc4d7           lcall 0xd7c4, 0x1d48  ; sub_s3:1D48
2:D79F  c45e06               les bx, ptr [bp + 6]
2:D7A2  662bc0               sub eax, eax
2:D7A5  662689470a           mov dword ptr es:[bx + 0xa], eax
2:D7AA  2689470e             mov word ptr es:[bx + 0xe], ax
2:D7AE  26c7078ed9           mov word ptr es:[bx], 0xd98e
2:D7B3  26c7470282d7         mov word ptr es:[bx + 2], 0xd782  ; SEGMENT s2:0000
2:D7B9  689b00               push 0x9b
2:D7BC  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:D7C1  9a0a8386d7           lcall 0xd786, 0x830a  ; sub_s3:830A
2:D7C6  c45e06               les bx, ptr [bp + 6]
2:D7C9  2689470a             mov word ptr es:[bx + 0xa], ax
2:D7CD  2689570c             mov word ptr es:[bx + 0xc], dx
2:D7D1  8bc3                 mov ax, bx
2:D7D3  8cc2                 mov dx, es
2:D7D5  c9                   leave
2:D7D6  ca0600               retf 6
2:D7D9  db 00

; ---------------- sub_s2:D7DA FAR size=62 callers=1
2:D7DA  c8080000             enter 8, 0
2:D7DE  56                   push si
2:D7DF  c45e06               les bx, ptr [bp + 6]
2:D7E2  26c7078ed9           mov word ptr es:[bx], 0xd98e
2:D7E7  26c74702b7d7         mov word ptr es:[bx + 2], 0xd7b7  ; SEGMENT s2:0000
2:D7ED  268b470a             mov ax, word ptr es:[bx + 0xa]
2:D7F1  268b570c             mov dx, word ptr es:[bx + 0xc]
2:D7F5  8bda                 mov bx, dx
2:D7F7  0bd0                 or dx, ax
2:D7F9  740e                 je 0xd809
2:D7FB  6a01                 push 1
2:D7FD  53                   push bx
2:D7FE  50                   push ax
2:D7FF  8ec3                 mov es, bx
2:D801  8bf0                 mov si, ax
2:D803  26c41c               les bx, ptr es:[si]
2:D806  26ff1f               lcall es:[bx]
loc_D809:
2:D809  66ff7606             push dword ptr [bp + 6]
2:D80D  9a801d9dd7           lcall 0xd79d, 0x1d80  ; sub_s3:1D80
2:D812  5e                   pop si
2:D813  c9                   leave
2:D814  ca0400               retf 4
2:D817  db 00

; ---------------- sub_s2:D818 FAR size=336 callers=1
2:D818  55                   push bp
2:D819  8bec                 mov bp, sp
2:D81B  8b460a               mov ax, word ptr [bp + 0xa]
2:D81E  e90901               jmp 0xd92a
2:D821  db 90
loc_D822:
2:D822  c45e06               les bx, ptr [bp + 6]
2:D825  26c7470e1400         mov word ptr es:[bx + 0xe], 0x14
2:D82B  e93601               jmp 0xd964
loc_D82E:
2:D82E  c45e06               les bx, ptr [bp + 6]
2:D831  26c7470e0300         mov word ptr es:[bx + 0xe], 3
2:D837  e92a01               jmp 0xd964
loc_D83A:
2:D83A  c45e06               les bx, ptr [bp + 6]
2:D83D  26c7470e0200         mov word ptr es:[bx + 0xe], 2
2:D843  e91e01               jmp 0xd964
loc_D846:
2:D846  c45e06               les bx, ptr [bp + 6]
2:D849  26c7470e0e00         mov word ptr es:[bx + 0xe], 0xe
2:D84F  e91201               jmp 0xd964
loc_D852:
2:D852  c45e06               les bx, ptr [bp + 6]
2:D855  26c7470e0c00         mov word ptr es:[bx + 0xe], 0xc
2:D85B  e90601               jmp 0xd964
loc_D85E:
2:D85E  c45e06               les bx, ptr [bp + 6]
2:D861  26c7470e0400         mov word ptr es:[bx + 0xe], 4
2:D867  e9fa00               jmp 0xd964
loc_D86A:
2:D86A  c45e06               les bx, ptr [bp + 6]
2:D86D  26c7470e0b00         mov word ptr es:[bx + 0xe], 0xb
2:D873  e9ee00               jmp 0xd964
loc_D876:
2:D876  c45e06               les bx, ptr [bp + 6]
2:D879  26c7470e0600         mov word ptr es:[bx + 0xe], 6
2:D87F  e9e200               jmp 0xd964
loc_D882:
2:D882  c45e06               les bx, ptr [bp + 6]
2:D885  26c7470e0a00         mov word ptr es:[bx + 0xe], 0xa
2:D88B  e9d600               jmp 0xd964
loc_D88E:
2:D88E  c45e06               les bx, ptr [bp + 6]
2:D891  26c7470e0d00         mov word ptr es:[bx + 0xe], 0xd
2:D897  e9ca00               jmp 0xd964
loc_D89A:
2:D89A  c45e06               les bx, ptr [bp + 6]
2:D89D  26c7470e1300         mov word ptr es:[bx + 0xe], 0x13
2:D8A3  e9be00               jmp 0xd964
loc_D8A6:
2:D8A6  c45e06               les bx, ptr [bp + 6]
2:D8A9  26c7470e0500         mov word ptr es:[bx + 0xe], 5
2:D8AF  e9b200               jmp 0xd964
loc_D8B2:
2:D8B2  c45e06               les bx, ptr [bp + 6]
2:D8B5  26c7470e0900         mov word ptr es:[bx + 0xe], 9
2:D8BB  e9a600               jmp 0xd964
loc_D8BE:
2:D8BE  c45e06               les bx, ptr [bp + 6]
2:D8C1  26c7470e0800         mov word ptr es:[bx + 0xe], 8
2:D8C7  e99a00               jmp 0xd964
loc_D8CA:
2:D8CA  c45e06               les bx, ptr [bp + 6]
2:D8CD  26c7470e1200         mov word ptr es:[bx + 0xe], 0x12  ; 'version %d %d'
2:D8D3  e98e00               jmp 0xd964
loc_D8D6:
2:D8D6  c45e06               les bx, ptr [bp + 6]
2:D8D9  26c7470e1100         mov word ptr es:[bx + 0xe], 0x11
2:D8DF  e98200               jmp 0xd964
2:D8E2  db 90 90
loc_D8E4:
2:D8E4  c45e06               les bx, ptr [bp + 6]
2:D8E7  26c7470e0700         mov word ptr es:[bx + 0xe], 7
2:D8ED  c9                   leave
2:D8EE  ca0600               retf 6
2:D8F1  db 90
loc_D8F2:
2:D8F2  c45e06               les bx, ptr [bp + 6]
2:D8F5  26c7470e1000         mov word ptr es:[bx + 0xe], 0x10
2:D8FB  c9                   leave
2:D8FC  ca0600               retf 6
2:D8FF  db 90
loc_D900:
2:D900  c45e06               les bx, ptr [bp + 6]
2:D903  26c7470e0100         mov word ptr es:[bx + 0xe], 1
2:D909  c9                   leave
2:D90A  ca0600               retf 6
2:D90D  db 90
loc_D90E:
2:D90E  c45e06               les bx, ptr [bp + 6]
2:D911  26c7470e0f00         mov word ptr es:[bx + 0xe], 0xf
2:D917  c9                   leave
2:D918  ca0600               retf 6
2:D91B  db 90
loc_D91C:
2:D91C  c45e06               les bx, ptr [bp + 6]
2:D91F  26c7470e1500         mov word ptr es:[bx + 0xe], 0x15
2:D925  c9                   leave
2:D926  ca0600               retf 6
2:D929  db 90
loc_D92A:
2:D92A  2da001               sub ax, 0x1a0
2:D92D  3d1400               cmp ax, 0x14
2:D930  7732                 ja 0xd964
2:D932  03c0                 add ax, ax
2:D934  93                   xchg bx, ax
2:D935  2effa73ad9           jmp word ptr cs:[bx - 0x26c6]
switch_table_D93A:
    dw loc_D822
    dw loc_D82E
    dw loc_D83A
    dw loc_D846
    dw loc_D852
    dw loc_D85E
    dw loc_D86A
    dw loc_D876
    dw loc_D882
    dw loc_D88E
    dw loc_D89A
    dw loc_D8A6
    dw loc_D8B2
    dw loc_D8BE
    dw loc_D8CA
    dw loc_D8D6
    dw loc_D8E4
    dw loc_D8F2
    dw loc_D900
    dw loc_D90E
    dw loc_D91C
loc_D964:
2:D964  c9                   leave
2:D965  ca0600               retf 6

; ---------------- sub_s2:D968 FAR size=54 callers=0
2:D968  55                   push bp
2:D969  8bec                 mov bp, sp
2:D96B  66ff7606             push dword ptr [bp + 6]
2:D96F  90                   nop
2:D970  0e                   push cs
2:D971  e866fe               call 0xd7da  ; sub_s2:D7DA
2:D974  f6460a01             test byte ptr [bp + 0xa], 1
2:D978  7409                 je 0xd983
2:D97A  66ff7606             push dword ptr [bp + 6]
2:D97E  9ace1774d7           lcall 0xd774, 0x17ce  ; operator_delete@s1:17CE
loc_D983:
2:D983  8b4606               mov ax, word ptr [bp + 6]
2:D986  8b5608               mov dx, word ptr [bp + 8]
2:D989  c9                   leave
2:D98A  ca0600               retf 6
2:D98D  db 90 68 d9 eb d7 f2 1d 98 d9 ce 1d 9c d9 d4 1d 10
2:D99D  db d8

; ---------------- sub_s2:D99E FAR size=54 callers=1
2:D99E  55                   push bp
2:D99F  8bec                 mov bp, sp
2:D9A1  66ff7608             push dword ptr [bp + 8]
2:D9A5  ff7606               push word ptr [bp + 6]
2:D9A8  9ada4cc3d9           lcall 0xd9c3, 0x4cda  ; sub_s4:4CDA
2:D9AD  c45e06               les bx, ptr [bp + 6]
2:D9B0  26c707fad9           mov word ptr es:[bx], 0xd9fa
2:D9B5  26c7470290d9         mov word ptr es:[bx + 2], 0xd990  ; SEGMENT s2:0000
2:D9BB  689a00               push 0x9a
2:D9BE  06                   push es
2:D9BF  53                   push bx
2:D9C0  9ace4d69d6           lcall 0xd669, 0x4dce  ; sub_s4:4DCE
2:D9C5  668b4606             mov eax, dword ptr [bp + 6]
2:D9C9  8b5608               mov dx, word ptr [bp + 8]
2:D9CC  66a33042             mov dword ptr [0x4230], eax
2:D9D0  c9                   leave
2:D9D1  ca0600               retf 6

; ---------------- sub_s2:D9D4 size=62 callers=0
2:D9D4  c8040000             enter 4, 0
2:D9D8  66ff7606             push dword ptr [bp + 6]
2:D9DC  9a224dabd9           lcall 0xd9ab, 0x4d22  ; sub_s4:4D22
2:D9E1  f6460a01             test byte ptr [bp + 0xa], 1
2:D9E5  7409                 je 0xd9f0
2:D9E7  66ff7606             push dword ptr [bp + 6]
2:D9EB  9ace1781d9           lcall 0xd981, 0x17ce  ; operator_delete@s1:17CE
loc_D9F0:
2:D9F0  8b4606               mov ax, word ptr [bp + 6]
2:D9F3  8b5608               mov dx, word ptr [bp + 8]
2:D9F6  c9                   leave
2:D9F7  ca0600               retf 6
2:D9FA  db d4 d9 b9 d9 f2 1d 04 da ce 1d 08 da d4 1d 94 d9
2:DA0A  db 04 4e 10 da 18 4f df d9

; ---------------- sub_s2:DA12 FAR size=538 callers=1
;   apis: GDI.GetDeviceCaps, GDI.GetSystemPaletteEntries, USER.GetDC, USER.ReleaseDC
2:DA12  c8220000             enter 0x22, 0
2:DA16  57                   push di
2:DA17  56                   push si
2:DA18  66ff7608             push dword ptr [bp + 8]
2:DA1C  ff7606               push word ptr [bp + 6]
2:DA1F  9a481d00da           lcall 0xda00, 0x1d48  ; sub_s3:1D48
2:DA24  33c0                 xor ax, ax
2:DA26  c45e06               les bx, ptr [bp + 6]
2:DA29  2689470a             mov word ptr es:[bx + 0xa], ax
2:DA2D  2689470c             mov word ptr es:[bx + 0xc], ax
2:DA31  8d4f0e               lea cx, [bx + 0xe]
2:DA34  06                   push es
2:DA35  51                   push cx
2:DA36  8bf1                 mov si, cx
2:DA38  8cc7                 mov di, es
2:DA3A  90                   nop
2:DA3B  0e                   push cs
2:DA3C  e8f963               call 0x13e38  ; sub_s2:3E38
2:DA3F  33c0                 xor ax, ax
2:DA41  c45e06               les bx, ptr [bp + 6]
2:DA44  26894714             mov word ptr es:[bx + 0x14], ax
2:DA48  26894716             mov word ptr es:[bx + 0x16], ax
2:DA4C  6626c7471800000000   mov dword ptr es:[bx + 0x18], 0
2:DA55  26c70780dc           mov word ptr es:[bx], 0xdc80
2:DA5A  26c74702fcd9         mov word ptr es:[bx + 2], 0xd9fc  ; SEGMENT s2:0000
2:DA60  50                   push ax
2:DA61  9affff0000           lcall 0, 0xffff  ; USER.GetDC
2:DA66  8946fe               mov word ptr [bp - 2], ax
2:DA69  50                   push ax
2:DA6A  6a08                 push 8
2:DA6C  9a7eda0000           lcall 0, 0xda7e  ; GDI.GetDeviceCaps
2:DA71  c45e06               les bx, ptr [bp + 6]
2:DA74  2689470a             mov word ptr es:[bx + 0xa], ax
2:DA78  ff76fe               push word ptr [bp - 2]
2:DA7B  6a0a                 push 0xa
2:DA7D  9ab2da0000           lcall 0, 0xdab2  ; GDI.GetDeviceCaps
2:DA82  c45e06               les bx, ptr [bp + 6]
2:DA85  2689470c             mov word ptr es:[bx + 0xc], ax
2:DA89  268b470a             mov ax, word ptr es:[bx + 0xa]
2:DA8D  2d8002               sub ax, 0x280
2:DA90  99                   cdq
2:DA91  2bc2                 sub ax, dx
2:DA93  d1f8                 sar ax, 1
2:DA95  50                   push ax
2:DA96  268b470c             mov ax, word ptr es:[bx + 0xc]
2:DA9A  2de001               sub ax, 0x1e0
2:DA9D  99                   cdq
2:DA9E  2bc2                 sub ax, dx
2:DAA0  d1f8                 sar ax, 1
2:DAA2  50                   push ax
2:DAA3  6a00                 push 0
2:DAA5  57                   push di
2:DAA6  56                   push si
2:DAA7  90                   nop
2:DAA8  0e                   push cs
2:DAA9  e8ca63               call 0x13e76  ; sub_s2:3E76
2:DAAC  ff76fe               push word ptr [bp - 2]
2:DAAF  6a26                 push 0x26
2:DAB1  9ac3da0000           lcall 0, 0xdac3  ; GDI.GetDeviceCaps
2:DAB6  f6c401               test ah, 1
2:DAB9  0f845901             je 0xdc16
2:DABD  ff76fe               push word ptr [bp - 2]
2:DAC0  6a68                 push 0x68
2:DAC2  9ad4da0000           lcall 0, 0xdad4  ; GDI.GetDeviceCaps
2:DAC7  c45e06               les bx, ptr [bp + 6]
2:DACA  26894714             mov word ptr es:[bx + 0x14], ax
2:DACE  ff76fe               push word ptr [bp - 2]
2:DAD1  6a6a                 push 0x6a
2:DAD3  9affff0000           lcall 0, 0xffff  ; GDI.GetDeviceCaps
2:DAD8  c45e06               les bx, ptr [bp + 6]
2:DADB  26894716             mov word ptr es:[bx + 0x16], ax
2:DADF  40                   inc ax
2:DAE0  c1e002               shl ax, 2
2:DAE3  8946f4               mov word ptr [bp - 0xc], ax
2:DAE6  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
2:DAEC  740a                 je 0xdaf8
2:DAEE  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
2:DAF1  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
2:DAF5  eb06                 jmp 0xdafd
2:DAF7  db 90
loc_DAF8:
2:DAF8  9a0a160bdb           lcall 0xdb0b, 0x160a  ; SH_DefaultPool@s1:160A
loc_DAFD:
2:DAFD  52                   push dx
2:DAFE  50                   push ax
2:DAFF  666800000100         push 0x10000
2:DB05  ff76f4               push word ptr [bp - 0xc]
2:DB08  9a081739db           lcall 0xdb39, 0x1708  ; SH_MemAllocPtr@s1:1708
2:DB0D  83c40a               add sp, 0xa
2:DB10  8946fa               mov word ptr [bp - 6], ax
2:DB13  8956fc               mov word ptr [bp - 4], dx
2:DB16  c45e06               les bx, ptr [bp + 6]
2:DB19  268b4716             mov ax, word ptr es:[bx + 0x16]
2:DB1D  40                   inc ax
2:DB1E  c1e002               shl ax, 2
2:DB21  8946f6               mov word ptr [bp - 0xa], ax
2:DB24  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
2:DB2A  740a                 je 0xdb36
2:DB2C  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
2:DB2F  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
2:DB33  eb06                 jmp 0xdb3b
2:DB35  db 90
loc_DB36:
2:DB36  9a0a164cdb           lcall 0xdb4c, 0x160a  ; SH_DefaultPool@s1:160A
loc_DB3B:
2:DB3B  8946ea               mov word ptr [bp - 0x16], ax
2:DB3E  52                   push dx
2:DB3F  50                   push ax
2:DB40  666800000100         push 0x10000
2:DB46  ff76f6               push word ptr [bp - 0xa]
2:DB49  9a081711dc           lcall 0xdc11, 0x1708  ; SH_MemAllocPtr@s1:1708
2:DB4E  83c40a               add sp, 0xa
2:DB51  c45e06               les bx, ptr [bp + 6]
2:DB54  26894718             mov word ptr es:[bx + 0x18], ax
2:DB58  2689571a             mov word ptr es:[bx + 0x1a], dx
2:DB5C  66837efa00           cmp dword ptr [bp - 6], 0
2:DB61  0f849f00             je 0xdc04
2:DB65  c45e06               les bx, ptr [bp + 6]
2:DB68  6626837f1800         cmp dword ptr es:[bx + 0x18], 0
2:DB6E  0f849200             je 0xdc04
2:DB72  ff76fe               push word ptr [bp - 2]
2:DB75  6a00                 push 0
2:DB77  268b4716             mov ax, word ptr es:[bx + 0x16]
2:DB7B  99                   cdq
2:DB7C  2bc2                 sub ax, dx
2:DB7E  d1f8                 sar ax, 1
2:DB80  8946ea               mov word ptr [bp - 0x16], ax
2:DB83  50                   push ax
2:DB84  66ff76fa             push dword ptr [bp - 6]
2:DB88  9aabdb0000           lcall 0, 0xdbab  ; GDI.GetSystemPaletteEntries
2:DB8D  ff76fe               push word ptr [bp - 2]
2:DB90  c45e06               les bx, ptr [bp + 6]
2:DB93  268b4714             mov ax, word ptr es:[bx + 0x14]
2:DB97  2b46ea               sub ax, word ptr [bp - 0x16]
2:DB9A  50                   push ax
2:DB9B  8b46ea               mov ax, word ptr [bp - 0x16]
2:DB9E  50                   push ax
2:DB9F  c1e002               shl ax, 2
2:DBA2  0346fa               add ax, word ptr [bp - 6]
2:DBA5  8b56fc               mov dx, word ptr [bp - 4]
2:DBA8  52                   push dx
2:DBA9  50                   push ax
2:DBAA  9affff0000           lcall 0, 0xffff  ; GDI.GetSystemPaletteEntries
2:DBAF  c45e06               les bx, ptr [bp + 6]
2:DBB2  66268b4718           mov eax, dword ptr es:[bx + 0x18]
2:DBB7  668946e2             mov dword ptr [bp - 0x1e], eax
2:DBBB  c746f20000           mov word ptr [bp - 0xe], 0
2:DBC0  eb36                 jmp 0xdbf8
loc_DBC2:
2:DBC2  8bd8                 mov bx, ax
2:DBC4  c1e302               shl bx, 2
2:DBC7  c476fa               les si, ptr [bp - 6]
2:DBCA  268a00               mov al, byte ptr es:[bx + si]
2:DBCD  03de                 add bx, si
2:DBCF  2ae4                 sub ah, ah
2:DBD1  8bd0                 mov dx, ax
2:DBD3  2bc9                 sub cx, cx
2:DBD5  268a6701             mov ah, byte ptr es:[bx + 1]
2:DBD9  2ac0                 sub al, al
2:DBDB  8946f4               mov word ptr [bp - 0xc], ax
2:DBDE  268a4702             mov al, byte ptr es:[bx + 2]
2:DBE2  2ae4                 sub ah, ah
2:DBE4  0b46f4               or ax, word ptr [bp - 0xc]
2:DBE7  c45ee2               les bx, ptr [bp - 0x1e]
2:DBEA  8346e204             add word ptr [bp - 0x1e], 4
2:DBEE  268907               mov word ptr es:[bx], ax
2:DBF1  26895702             mov word ptr es:[bx + 2], dx
2:DBF5  ff46f2               inc word ptr [bp - 0xe]
loc_DBF8:
2:DBF8  8b46f2               mov ax, word ptr [bp - 0xe]
2:DBFB  c45e06               les bx, ptr [bp + 6]
2:DBFE  26394716             cmp word ptr es:[bx + 0x16], ax
2:DC02  7fbe                 jg 0xdbc2
loc_DC04:
2:DC04  668b46fa             mov eax, dword ptr [bp - 6]
2:DC08  668946e2             mov dword ptr [bp - 0x1e], eax
2:DC0C  6650                 push eax
2:DC0E  9ace17eed9           lcall 0xd9ee, 0x17ce  ; operator_delete@s1:17CE
2:DC13  83c404               add sp, 4
loc_DC16:
2:DC16  6a00                 push 0
2:DC18  ff76fe               push word ptr [bp - 2]
2:DC1B  9affff0000           lcall 0, 0xffff  ; USER.ReleaseDC
2:DC20  8b4606               mov ax, word ptr [bp + 6]
2:DC23  8b5608               mov dx, word ptr [bp + 8]
2:DC26  5e                   pop si
2:DC27  5f                   pop di
2:DC28  c9                   leave
2:DC29  ca0600               retf 6

; ---------------- sub_s2:DC2C FAR size=46 callers=1
2:DC2C  c8080000             enter 8, 0
2:DC30  c45e06               les bx, ptr [bp + 6]
2:DC33  26c70780dc           mov word ptr es:[bx], 0xdc80
2:DC38  26c747025eda         mov word ptr es:[bx + 2], 0xda5e  ; SEGMENT s2:0000
2:DC3E  66268b4718           mov eax, dword ptr es:[bx + 0x18]
2:DC43  6650                 push eax
2:DC45  9ace17fbda           lcall 0xdafb, 0x17ce  ; operator_delete@s1:17CE
2:DC4A  83c404               add sp, 4
2:DC4D  66ff7606             push dword ptr [bp + 6]
2:DC51  9a801d22da           lcall 0xda22, 0x1d80  ; sub_s3:1D80
2:DC56  c9                   leave
2:DC57  ca0400               retf 4

; ---------------- sub_s2:DC5A FAR size=54 callers=0
2:DC5A  55                   push bp
2:DC5B  8bec                 mov bp, sp
2:DC5D  66ff7606             push dword ptr [bp + 6]
2:DC61  90                   nop
2:DC62  0e                   push cs
2:DC63  e8c6ff               call 0xdc2c  ; sub_s2:DC2C
2:DC66  f6460a01             test byte ptr [bp + 0xa], 1
2:DC6A  7409                 je 0xdc75
2:DC6C  66ff7606             push dword ptr [bp + 6]
2:DC70  9ace1748dc           lcall 0xdc48, 0x17ce  ; operator_delete@s1:17CE
loc_DC75:
2:DC75  8b4606               mov ax, word ptr [bp + 6]
2:DC78  8b5608               mov dx, word ptr [bp + 8]
2:DC7B  c9                   leave
2:DC7C  ca0600               retf 6
2:DC7F  db 90 5a dc 3c dc f2 1d 8a dc ce 1d 8e dc d4 1d 54
2:DC8F  db dc

; ---------------- sub_s2:DC90 FAR size=76 callers=2
2:DC90  c8040000             enter 4, 0
2:DC94  c45e06               les bx, ptr [bp + 6]
2:DC97  26c7079a38           mov word ptr es:[bx], 0x389a
2:DC9C  26c74702d2dc         mov word ptr es:[bx + 2], 0xdcd2  ; SEGMENT s2:0000
2:DCA2  668b460e             mov eax, dword ptr [bp + 0xe]
2:DCA6  c45e06               les bx, ptr [bp + 6]
2:DCA9  6626894704           mov dword ptr es:[bx + 4], eax
2:DCAE  668b460a             mov eax, dword ptr [bp + 0xa]
2:DCB2  6626894708           mov dword ptr es:[bx + 8], eax
2:DCB7  26c7470c0000         mov word ptr es:[bx + 0xc], 0
2:DCBD  662bc0               sub eax, eax
2:DCC0  662689470e           mov dword ptr es:[bx + 0xe], eax
2:DCC5  26894712             mov word ptr es:[bx + 0x12], ax
2:DCC9  26c7074add           mov word ptr es:[bx], 0xdd4a
2:DCCE  26c7470282dc         mov word ptr es:[bx + 2], 0xdc82  ; SEGMENT s2:0000
2:DCD4  8bc3                 mov ax, bx
2:DCD6  8cc2                 mov dx, es
2:DCD8  c9                   leave
2:DCD9  ca0c00               retf 0xc

; ---------------- sub_s2:DCDC FAR size=66 callers=1
2:DCDC  c8040000             enter 4, 0
2:DCE0  c45e06               les bx, ptr [bp + 6]
2:DCE3  26c7079a38           mov word ptr es:[bx], 0x389a
2:DCE8  26c7470214dd         mov word ptr es:[bx + 2], 0xdd14  ; SEGMENT s2:0000
2:DCEE  c45e06               les bx, ptr [bp + 6]
2:DCF1  662bc0               sub eax, eax
2:DCF4  6626894704           mov dword ptr es:[bx + 4], eax
2:DCF9  6626894708           mov dword ptr es:[bx + 8], eax
2:DCFE  2689470c             mov word ptr es:[bx + 0xc], ax
2:DD02  662689470e           mov dword ptr es:[bx + 0xe], eax
2:DD07  26894712             mov word ptr es:[bx + 0x12], ax
2:DD0B  26c7074add           mov word ptr es:[bx], 0xdd4a
2:DD10  26c74702a0dc         mov word ptr es:[bx + 2], 0xdca0  ; SEGMENT s2:0000
2:DD16  8bc3                 mov ax, bx
2:DD18  8cc2                 mov dx, es
2:DD1A  c9                   leave
2:DD1B  ca0400               retf 4

; ---------------- sub_s2:DD1E size=48 callers=0
2:DD1E  c8080000             enter 8, 0
2:DD22  c45e06               les bx, ptr [bp + 6]
2:DD25  26c7079a38           mov word ptr es:[bx], 0x389a
2:DD2A  26c74702ecdc         mov word ptr es:[bx + 2], 0xdcec  ; SEGMENT s2:0000
2:DD30  f6460a01             test byte ptr [bp + 0xa], 1
2:DD34  7409                 je 0xdd3f
2:DD36  66ff7606             push dword ptr [bp + 6]
2:DD3A  9ace1773dc           lcall 0xdc73, 0x17ce  ; operator_delete@s1:17CE
loc_DD3F:
2:DD3F  8b4606               mov ax, word ptr [bp + 6]
2:DD42  8b5608               mov dx, word ptr [bp + 8]
2:DD45  c9                   leave
2:DD46  ca0600               retf 6
2:DD49  db 90 1e dd 2e dd

; ---------------- sub_s2:DD4E FAR size=124 callers=1
2:DD4E  c8040000             enter 4, 0
2:DD52  66ff7608             push dword ptr [bp + 8]
2:DD56  ff7606               push word ptr [bp + 6]
2:DD59  9a481d86dc           lcall 0xdc86, 0x1d48  ; sub_s3:1D48
2:DD5E  c45e06               les bx, ptr [bp + 6]
2:DD61  662bc0               sub eax, eax
2:DD64  662689470a           mov dword ptr es:[bx + 0xa], eax
2:DD69  662689470e           mov dword ptr es:[bx + 0xe], eax
2:DD6E  6626894712           mov dword ptr es:[bx + 0x12], eax
2:DD73  6626894716           mov dword ptr es:[bx + 0x16], eax
2:DD78  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:DD7D  662689471e           mov dword ptr es:[bx + 0x1e], eax
2:DD82  26c707acea           mov word ptr es:[bx], 0xeaac
2:DD87  26c747024cdd         mov word ptr es:[bx + 2], 0xdd4c  ; SEGMENT s2:0000
2:DD8D  6a0c                 push 0xc
2:DD8F  9a9c173ddd           lcall 0xdd3d, 0x179c  ; operator_new@s1:179C
2:DD94  83c402               add sp, 2
2:DD97  8956fe               mov word ptr [bp - 2], dx
2:DD9A  0bd0                 or dx, ax
2:DD9C  7416                 je 0xddb4
2:DD9E  ff76fe               push word ptr [bp - 2]
2:DDA1  50                   push ax
2:DDA2  90                   nop
2:DDA3  0e                   push cs
2:DDA4  e8a379               call 0x1574a  ; sub_s2:574A
2:DDA7  c45e06               les bx, ptr [bp + 6]
2:DDAA  2689470a             mov word ptr es:[bx + 0xa], ax
2:DDAE  2689570c             mov word ptr es:[bx + 0xc], dx
2:DDB2  eb0c                 jmp 0xddc0
loc_DDB4:
2:DDB4  c45e06               les bx, ptr [bp + 6]
2:DDB7  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
loc_DDC0:
2:DDC0  8b4606               mov ax, word ptr [bp + 6]
2:DDC3  8b5608               mov dx, word ptr [bp + 8]
2:DDC6  c9                   leave
2:DDC7  ca0600               retf 6

; ---------------- sub_s2:DDCA FAR size=142 callers=1
2:DDCA  c80c0000             enter 0xc, 0
2:DDCE  56                   push si
2:DDCF  c45e06               les bx, ptr [bp + 6]
2:DDD2  26c707acea           mov word ptr es:[bx], 0xeaac
2:DDD7  26c747028bdd         mov word ptr es:[bx + 2], 0xdd8b  ; SEGMENT s2:0000
2:DDDD  268b470e             mov ax, word ptr es:[bx + 0xe]
2:DDE1  268b5710             mov dx, word ptr es:[bx + 0x10]
2:DDE5  8bda                 mov bx, dx
2:DDE7  0bd0                 or dx, ax
2:DDE9  740e                 je 0xddf9
2:DDEB  6a01                 push 1
2:DDED  53                   push bx
2:DDEE  50                   push ax
2:DDEF  8ec3                 mov es, bx
2:DDF1  8bf0                 mov si, ax
2:DDF3  26c41c               les bx, ptr es:[si]
2:DDF6  26ff1f               lcall es:[bx]
loc_DDF9:
2:DDF9  c45e06               les bx, ptr [bp + 6]
2:DDFC  268b4712             mov ax, word ptr es:[bx + 0x12]
2:DE00  268b5714             mov dx, word ptr es:[bx + 0x14]
2:DE04  8bda                 mov bx, dx
2:DE06  0bd8                 or bx, ax
2:DE08  740e                 je 0xde18
2:DE0A  6a01                 push 1
2:DE0C  52                   push dx
2:DE0D  50                   push ax
2:DE0E  8ec2                 mov es, dx
2:DE10  8bd8                 mov bx, ax
2:DE12  26c41f               les bx, ptr es:[bx]
2:DE15  26ff1f               lcall es:[bx]
loc_DE18:
2:DE18  c45e06               les bx, ptr [bp + 6]
2:DE1B  268b470a             mov ax, word ptr es:[bx + 0xa]
2:DE1F  268b570c             mov dx, word ptr es:[bx + 0xc]
2:DE23  8bda                 mov bx, dx
2:DE25  0bd8                 or bx, ax
2:DE27  740e                 je 0xde37
2:DE29  6a01                 push 1
2:DE2B  52                   push dx
2:DE2C  50                   push ax
2:DE2D  8ec2                 mov es, dx
2:DE2F  8bd8                 mov bx, ax
2:DE31  26c41f               les bx, ptr es:[bx]
2:DE34  26ff1f               lcall es:[bx]
loc_DE37:
2:DE37  c45e06               les bx, ptr [bp + 6]
2:DE3A  66268b4f1e           mov ecx, dword ptr es:[bx + 0x1e]
2:DE3F  6651                 push ecx
2:DE41  9ace1792dd           lcall 0xdd92, 0x17ce  ; operator_delete@s1:17CE
2:DE46  83c404               add sp, 4
2:DE49  66ff7606             push dword ptr [bp + 6]
2:DE4D  9a801d5cdd           lcall 0xdd5c, 0x1d80  ; sub_s3:1D80
2:DE52  5e                   pop si
2:DE53  c9                   leave
2:DE54  ca0400               retf 4
2:DE57  db 00

; ---------------- sub_s2:DE58 FAR size=242 callers=1
2:DE58  c8120000             enter 0x12, 0
2:DE5C  c45e06               les bx, ptr [bp + 6]
2:DE5F  6626ff770a           push dword ptr es:[bx + 0xa]
2:DE64  8d46f8               lea ax, [bp - 8]
2:DE67  16                   push ss
2:DE68  50                   push ax
2:DE69  90                   nop
2:DE6A  0e                   push cs
2:DE6B  e81679               call 0x15784  ; ListIter::ListIter@s2:5784
2:DE6E  662bc0               sub eax, eax
2:DE71  668946f4             mov dword ptr [bp - 0xc], eax
2:DE75  8946f2               mov word ptr [bp - 0xe], ax
loc_DE78:
2:DE78  8d46f8               lea ax, [bp - 8]
2:DE7B  16                   push ss
2:DE7C  50                   push ax
2:DE7D  90                   nop
2:DE7E  0e                   push cs
2:DE7F  e8907c               call 0x15b12  ; ListIter::next@s2:5B12
2:DE82  8946f4               mov word ptr [bp - 0xc], ax
2:DE85  8956f6               mov word ptr [bp - 0xa], dx
2:DE88  0bd0                 or dx, ax
2:DE8A  744f                 je 0xdedb
2:DE8C  668b460e             mov eax, dword ptr [bp + 0xe]
2:DE90  c45ef4               les bx, ptr [bp - 0xc]
2:DE93  6626394704           cmp dword ptr es:[bx + 4], eax
2:DE98  750b                 jne 0xdea5
2:DE9A  668b460a             mov eax, dword ptr [bp + 0xa]
2:DE9E  6626394708           cmp dword ptr es:[bx + 8], eax
2:DEA3  7416                 je 0xdebb
loc_DEA5:
2:DEA5  668b460e             mov eax, dword ptr [bp + 0xe]
2:DEA9  6626394708           cmp dword ptr es:[bx + 8], eax
2:DEAE  75c8                 jne 0xde78
2:DEB0  668b460a             mov eax, dword ptr [bp + 0xa]
2:DEB4  6626394704           cmp dword ptr es:[bx + 4], eax
2:DEB9  75bd                 jne 0xde78
loc_DEBB:
2:DEBB  26c7470c0100         mov word ptr es:[bx + 0xc], 1
2:DEC1  66ff364857           push dword ptr [0x5748]  ; g_sim
2:DEC6  9a268324df           lcall 0xdf24, 0x8326  ; Sim::getTurnNumber@s7:8326
2:DECB  c45ef4               les bx, ptr [bp - 0xc]
2:DECE  2689470e             mov word ptr es:[bx + 0xe], ax
2:DED2  26895710             mov word ptr es:[bx + 0x10], dx
2:DED6  c746f20100           mov word ptr [bp - 0xe], 1
loc_DEDB:
2:DEDB  837ef200             cmp word ptr [bp - 0xe], 0
2:DEDF  7565                 jne 0xdf46
2:DEE1  6a14                 push 0x14
2:DEE3  9a9c1744de           lcall 0xde44, 0x179c  ; operator_new@s1:179C
2:DEE8  83c402               add sp, 2
2:DEEB  8946ee               mov word ptr [bp - 0x12], ax
2:DEEE  8956f0               mov word ptr [bp - 0x10], dx
2:DEF1  0bd0                 or dx, ax
2:DEF3  7417                 je 0xdf0c
2:DEF5  66ff760e             push dword ptr [bp + 0xe]
2:DEF9  66ff760a             push dword ptr [bp + 0xa]
2:DEFD  ff76f0               push word ptr [bp - 0x10]
2:DF00  50                   push ax
2:DF01  90                   nop
2:DF02  0e                   push cs
2:DF03  e88afd               call 0xdc90  ; sub_s2:DC90
2:DF06  8ec2                 mov es, dx
2:DF08  8bd8                 mov bx, ax
2:DF0A  eb04                 jmp 0xdf10
loc_DF0C:
2:DF0C  33db                 xor bx, bx
2:DF0E  8ec3                 mov es, bx
loc_DF10:
2:DF10  895ef4               mov word ptr [bp - 0xc], bx
2:DF13  8c46f6               mov word ptr [bp - 0xa], es
2:DF16  26c7470c0100         mov word ptr es:[bx + 0xc], 1
2:DF1C  66ff364857           push dword ptr [0x5748]  ; g_sim
2:DF21  9a2683b8d5           lcall 0xd5b8, 0x8326  ; Sim::getTurnNumber@s7:8326
2:DF26  c45ef4               les bx, ptr [bp - 0xc]
2:DF29  2689470e             mov word ptr es:[bx + 0xe], ax
2:DF2D  26895710             mov word ptr es:[bx + 0x10], dx
2:DF31  06                   push es
2:DF32  53                   push bx
2:DF33  c45e06               les bx, ptr [bp + 6]
2:DF36  6626ff770a           push dword ptr es:[bx + 0xa]
2:DF3B  26c45f0a             les bx, ptr es:[bx + 0xa]
2:DF3F  26c41f               les bx, ptr es:[bx]
2:DF42  26ff5f04             lcall es:[bx + 4]
loc_DF46:
2:DF46  c9                   leave
2:DF47  ca0c00               retf 0xc

; ---------------- sub_s2:DF4A FAR size=92 callers=1
2:DF4A  c80c0000             enter 0xc, 0
2:DF4E  c45e06               les bx, ptr [bp + 6]
2:DF51  6626ff770a           push dword ptr es:[bx + 0xa]
2:DF56  8d46f8               lea ax, [bp - 8]
2:DF59  16                   push ss
2:DF5A  50                   push ax
2:DF5B  90                   nop
2:DF5C  0e                   push cs
2:DF5D  e82478               call 0x15784  ; ListIter::ListIter@s2:5784
2:DF60  66c746f400000000     mov dword ptr [bp - 0xc], 0
loc_DF68:
2:DF68  8d46f8               lea ax, [bp - 8]
2:DF6B  16                   push ss
2:DF6C  50                   push ax
2:DF6D  90                   nop
2:DF6E  0e                   push cs
2:DF6F  e8a07b               call 0x15b12  ; ListIter::next@s2:5B12
2:DF72  8946f4               mov word ptr [bp - 0xc], ax
2:DF75  8956f6               mov word ptr [bp - 0xa], dx
2:DF78  0bd0                 or dx, ax
2:DF7A  7426                 je 0xdfa2
2:DF7C  c45ef4               les bx, ptr [bp - 0xc]
2:DF7F  26837f0c02           cmp word ptr es:[bx + 0xc], 2
2:DF84  7407                 je 0xdf8d
2:DF86  26837f0c03           cmp word ptr es:[bx + 0xc], 3
2:DF8B  75db                 jne 0xdf68
loc_DF8D:
2:DF8D  06                   push es
2:DF8E  50                   push ax
2:DF8F  66ff7606             push dword ptr [bp + 6]
2:DF93  90                   nop
2:DF94  0e                   push cs
2:DF95  e80c0a               call 0xe9a4  ; sub_s2:E9A4
2:DF98  0bc0                 or ax, ax
2:DF9A  74cc                 je 0xdf68
2:DF9C  c45ef4               les bx, ptr [bp - 0xc]
2:DF9F  ebc7                 jmp 0xdf68
2:DFA1  db 90
loc_DFA2:
2:DFA2  c9                   leave
2:DFA3  ca0400               retf 4

; ---------------- sub_s2:DFA6 FAR size=118 callers=2
2:DFA6  c80c0000             enter 0xc, 0
2:DFAA  c45e06               les bx, ptr [bp + 6]
2:DFAD  6626ff770a           push dword ptr es:[bx + 0xa]
2:DFB2  8d46f8               lea ax, [bp - 8]
2:DFB5  16                   push ss
2:DFB6  50                   push ax
2:DFB7  90                   nop
2:DFB8  0e                   push cs
2:DFB9  e8c877               call 0x15784  ; ListIter::ListIter@s2:5784
2:DFBC  66c746f400000000     mov dword ptr [bp - 0xc], 0
loc_DFC4:
2:DFC4  8d46f8               lea ax, [bp - 8]
2:DFC7  16                   push ss
2:DFC8  50                   push ax
2:DFC9  90                   nop
2:DFCA  0e                   push cs
2:DFCB  e8447b               call 0x15b12  ; ListIter::next@s2:5B12
2:DFCE  8946f4               mov word ptr [bp - 0xc], ax
2:DFD1  8956f6               mov word ptr [bp - 0xa], dx
2:DFD4  0bd0                 or dx, ax
2:DFD6  743e                 je 0xe016
2:DFD8  668b460e             mov eax, dword ptr [bp + 0xe]
2:DFDC  c45ef4               les bx, ptr [bp - 0xc]
2:DFDF  6626394704           cmp dword ptr es:[bx + 4], eax
2:DFE4  750b                 jne 0xdff1
2:DFE6  668b460a             mov eax, dword ptr [bp + 0xa]
2:DFEA  6626394708           cmp dword ptr es:[bx + 8], eax
2:DFEF  7416                 je 0xe007
loc_DFF1:
2:DFF1  668b460e             mov eax, dword ptr [bp + 0xe]
2:DFF5  6626394708           cmp dword ptr es:[bx + 8], eax
2:DFFA  75c8                 jne 0xdfc4
2:DFFC  668b460a             mov eax, dword ptr [bp + 0xa]
2:E000  6626394704           cmp dword ptr es:[bx + 4], eax
2:E005  75bd                 jne 0xdfc4
loc_E007:
2:E007  26837f0c01           cmp word ptr es:[bx + 0xc], 1
2:E00C  7508                 jne 0xe016
2:E00E  b80100               mov ax, 1
2:E011  c9                   leave
2:E012  ca0c00               retf 0xc
2:E015  db 90
loc_E016:
2:E016  33c0                 xor ax, ax
2:E018  c9                   leave
2:E019  ca0c00               retf 0xc

; ---------------- sub_s2:E01C FAR size=28 callers=1
2:E01C  55                   push bp
2:E01D  8bec                 mov bp, sp
2:E01F  668b460e             mov eax, dword ptr [bp + 0xe]
2:E023  c45e06               les bx, ptr [bp + 6]
2:E026  6626894716           mov dword ptr es:[bx + 0x16], eax
2:E02B  668b460a             mov eax, dword ptr [bp + 0xa]
2:E02F  662689471a           mov dword ptr es:[bx + 0x1a], eax
2:E034  c9                   leave
2:E035  ca0c00               retf 0xc

; ---------------- sub_s2:E038 FAR size=38 callers=1
2:E038  55                   push bp
2:E039  8bec                 mov bp, sp
2:E03B  c45e06               les bx, ptr [bp + 6]
2:E03E  66268b4716           mov eax, dword ptr es:[bx + 0x16]
2:E043  c45e0e               les bx, ptr [bp + 0xe]
2:E046  66268907             mov dword ptr es:[bx], eax
2:E04A  c45e06               les bx, ptr [bp + 6]
2:E04D  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
2:E052  c45e0a               les bx, ptr [bp + 0xa]
2:E055  66268907             mov dword ptr es:[bx], eax
2:E059  c9                   leave
2:E05A  ca0c00               retf 0xc
2:E05D  db 00

; ---------------- sub_s2:E05E FAR size=174 callers=1
2:E05E  c82c0100             enter 0x12c, 0
2:E062  66ff7610             push dword ptr [bp + 0x10]
2:E066  66ff760c             push dword ptr [bp + 0xc]
2:E06A  66ff7606             push dword ptr [bp + 6]
2:E06E  90                   nop
2:E06F  0e                   push cs
2:E070  e85908               call 0xe8cc  ; sub_s2:E8CC
2:E073  8946fc               mov word ptr [bp - 4], ax
2:E076  8956fe               mov word ptr [bp - 2], dx
2:E079  0bd0                 or dx, ax
2:E07B  741c                 je 0xe099
2:E07D  66ff364857           push dword ptr [0x5748]  ; g_sim
2:E082  9a2683eae0           lcall 0xe0ea, 0x8326  ; Sim::getTurnNumber@s7:8326
2:E087  c45efc               les bx, ptr [bp - 4]
2:E08A  2689470e             mov word ptr es:[bx + 0xe], ax
2:E08E  26895710             mov word ptr es:[bx + 0x10], dx
2:E092  8b460a               mov ax, word ptr [bp + 0xa]
2:E095  2689470c             mov word ptr es:[bx + 0xc], ax
loc_E099:
2:E099  c45e06               les bx, ptr [bp + 6]
2:E09C  6626ff770a           push dword ptr es:[bx + 0xa]
2:E0A1  8d46f4               lea ax, [bp - 0xc]
2:E0A4  16                   push ss
2:E0A5  50                   push ax
2:E0A6  90                   nop
2:E0A7  0e                   push cs
2:E0A8  e8d976               call 0x15784  ; ListIter::ListIter@s2:5784
2:E0AB  c746f20000           mov word ptr [bp - 0xe], 0
loc_E0B0:
2:E0B0  8d46f4               lea ax, [bp - 0xc]
2:E0B3  16                   push ss
2:E0B4  50                   push ax
2:E0B5  90                   nop
2:E0B6  0e                   push cs
2:E0B7  e8587a               call 0x15b12  ; ListIter::next@s2:5B12
2:E0BA  8946fc               mov word ptr [bp - 4], ax
2:E0BD  8956fe               mov word ptr [bp - 2], dx
2:E0C0  0bd0                 or dx, ax
2:E0C2  740f                 je 0xe0d3
2:E0C4  c45efc               les bx, ptr [bp - 4]
2:E0C7  26837f0c01           cmp word ptr es:[bx + 0xc], 1
2:E0CC  75e2                 jne 0xe0b0
2:E0CE  c746f20100           mov word ptr [bp - 0xe], 1
loc_E0D3:
2:E0D3  837ef200             cmp word ptr [bp - 0xe], 0
2:E0D7  752f                 jne 0xe108
2:E0D9  666a00               push 0
2:E0DC  666a00               push 0
2:E0DF  6a00                 push 0
2:E0E1  8d86e0fe             lea ax, [bp - 0x120]
2:E0E5  16                   push ss
2:E0E6  50                   push ax
2:E0E7  9abee2fae0           lcall 0xe0fa, 0xe2be  ; sub_s7:E2BE
2:E0EC  8d86e0fe             lea ax, [bp - 0x120]
2:E0F0  16                   push ss
2:E0F1  50                   push ax
2:E0F2  66ff364857           push dword ptr [0x5748]  ; g_sim
2:E0F7  9a5a83c9de           lcall 0xdec9, 0x835a  ; Sim::enqueue@s7:835A
2:E0FC  c786e0fe9a38         mov word ptr [bp - 0x120], 0x389a
2:E102  c786e2fedbdd         mov word ptr [bp - 0x11e], 0xdddb  ; SEGMENT s2:0000
loc_E108:
2:E108  c9                   leave
2:E109  ca0e00               retf 0xe

; ---------------- sub_s2:E10C FAR size=88 callers=1
2:E10C  c8040000             enter 4, 0
2:E110  66ff760e             push dword ptr [bp + 0xe]
2:E114  66ff760a             push dword ptr [bp + 0xa]
2:E118  66ff7606             push dword ptr [bp + 6]
2:E11C  90                   nop
2:E11D  0e                   push cs
2:E11E  e8ab07               call 0xe8cc  ; sub_s2:E8CC
2:E121  8946fc               mov word ptr [bp - 4], ax
2:E124  8956fe               mov word ptr [bp - 2], dx
2:E127  0bd0                 or dx, ax
2:E129  7507                 jne 0xe132
loc_E12B:
2:E12B  b80100               mov ax, 1
2:E12E  c9                   leave
2:E12F  ca0c00               retf 0xc
loc_E132:
2:E132  c45efc               les bx, ptr [bp - 4]
2:E135  268b470c             mov ax, word ptr es:[bx + 0xc]
2:E139  eb13                 jmp 0xe14e
2:E13B  db 90
loc_E13C:
2:E13C  66ff76fc             push dword ptr [bp - 4]
2:E140  66ff7606             push dword ptr [bp + 6]
2:E144  90                   nop
2:E145  0e                   push cs
2:E146  e85b08               call 0xe9a4  ; sub_s2:E9A4
2:E149  c9                   leave
2:E14A  ca0c00               retf 0xc
2:E14D  db 90
loc_E14E:
2:E14E  0bc0                 or ax, ax
2:E150  7c0b                 jl 0xe15d
2:E152  7009                 jo 0xe15d
2:E154  48                   dec ax
2:E155  7ed4                 jle 0xe12b
2:E157  48                   dec ax
2:E158  7c03                 jl 0xe15d
2:E15A  48                   dec ax
2:E15B  7edf                 jle 0xe13c
loc_E15D:
2:E15D  33c0                 xor ax, ax
2:E15F  c9                   leave
2:E160  ca0c00               retf 0xc
2:E163  db 00

; ---------------- sub_s2:E164 FAR size=320 callers=1
2:E164  c82a0100             enter 0x12a, 0
2:E168  c45e06               les bx, ptr [bp + 6]
2:E16B  6626ff7716           push dword ptr es:[bx + 0x16]
2:E170  6626ff771a           push dword ptr es:[bx + 0x1a]
2:E175  06                   push es
2:E176  53                   push bx
2:E177  90                   nop
2:E178  0e                   push cs
2:E179  e85007               call 0xe8cc  ; sub_s2:E8CC
2:E17C  8946fc               mov word ptr [bp - 4], ax
2:E17F  8956fe               mov word ptr [bp - 2], dx
2:E182  0bd0                 or dx, ax
2:E184  0f859a00             jne 0xe222
2:E188  c45e06               les bx, ptr [bp + 6]
2:E18B  6626ff7716           push dword ptr es:[bx + 0x16]
2:E190  06                   push es
2:E191  53                   push bx
2:E192  90                   nop
2:E193  0e                   push cs
2:E194  e8bb06               call 0xe852  ; sub_s2:E852
2:E197  8986e2fe             mov word ptr [bp - 0x11e], ax
2:E19B  8996e4fe             mov word ptr [bp - 0x11c], dx
2:E19F  c45e06               les bx, ptr [bp + 6]
2:E1A2  6626ff771a           push dword ptr es:[bx + 0x1a]
2:E1A7  06                   push es
2:E1A8  53                   push bx
2:E1A9  90                   nop
2:E1AA  0e                   push cs
2:E1AB  e8a406               call 0xe852  ; sub_s2:E852
2:E1AE  8986defe             mov word ptr [bp - 0x122], ax
2:E1B2  8996e0fe             mov word ptr [bp - 0x120], dx
2:E1B6  6a14                 push 0x14
2:E1B8  9a9c17e6de           lcall 0xdee6, 0x179c  ; operator_new@s1:179C
2:E1BD  83c402               add sp, 2
2:E1C0  8986dafe             mov word ptr [bp - 0x126], ax
2:E1C4  8996dcfe             mov word ptr [bp - 0x124], dx
2:E1C8  0bd0                 or dx, ax
2:E1CA  741a                 je 0xe1e6
2:E1CC  66ffb6e2fe           push dword ptr [bp - 0x11e]
2:E1D1  66ffb6defe           push dword ptr [bp - 0x122]
2:E1D6  ffb6dcfe             push word ptr [bp - 0x124]
2:E1DA  50                   push ax
2:E1DB  90                   nop
2:E1DC  0e                   push cs
2:E1DD  e8b0fa               call 0xdc90  ; sub_s2:DC90
2:E1E0  8ec2                 mov es, dx
2:E1E2  8bd8                 mov bx, ax
2:E1E4  eb04                 jmp 0xe1ea
loc_E1E6:
2:E1E6  33db                 xor bx, bx
2:E1E8  8ec3                 mov es, bx
loc_E1EA:
2:E1EA  895efc               mov word ptr [bp - 4], bx
2:E1ED  8c46fe               mov word ptr [bp - 2], es
2:E1F0  26c7470c0100         mov word ptr es:[bx + 0xc], 1
2:E1F6  66ff364857           push dword ptr [0x5748]  ; g_sim
2:E1FB  9a268364e2           lcall 0xe264, 0x8326  ; Sim::getTurnNumber@s7:8326
2:E200  c45efc               les bx, ptr [bp - 4]
2:E203  2689470e             mov word ptr es:[bx + 0xe], ax
2:E207  26895710             mov word ptr es:[bx + 0x10], dx
2:E20B  06                   push es
2:E20C  53                   push bx
2:E20D  c45e06               les bx, ptr [bp + 6]
2:E210  6626ff770a           push dword ptr es:[bx + 0xa]
2:E215  26c45f0a             les bx, ptr es:[bx + 0xa]
2:E219  26c41f               les bx, ptr es:[bx]
2:E21C  26ff5f04             lcall es:[bx + 4]
2:E220  eb2a                 jmp 0xe24c
loc_E222:
2:E222  c45efc               les bx, ptr [bp - 4]
2:E225  268b470c             mov ax, word ptr es:[bx + 0xc]
2:E229  eb0d                 jmp 0xe238
2:E22B  db 90
loc_E22C:
2:E22C  c45efc               les bx, ptr [bp - 4]
2:E22F  26c747120100         mov word ptr es:[bx + 0x12], 1
2:E235  eb0c                 jmp 0xe243
2:E237  db 90
loc_E238:
2:E238  48                   dec ax
2:E239  7464                 je 0xe29f
2:E23B  48                   dec ax
2:E23C  7c05                 jl 0xe243
2:E23E  7003                 jo 0xe243
2:E240  48                   dec ax
2:E241  7ee9                 jle 0xe22c
loc_E243:
2:E243  c45efc               les bx, ptr [bp - 4]
2:E246  26c7470c0100         mov word ptr es:[bx + 0xc], 1
loc_E24C:
2:E24C  c45efc               les bx, ptr [bp - 4]
2:E24F  6626ff7704           push dword ptr es:[bx + 4]
2:E254  6626ff7708           push dword ptr es:[bx + 8]
2:E259  6a01                 push 1
2:E25B  8d86eafe             lea ax, [bp - 0x116]
2:E25F  16                   push ss
2:E260  50                   push ax
2:E261  9abee26ee2           lcall 0xe26e, 0xe2be  ; sub_s7:E2BE
2:E266  66ff364857           push dword ptr [0x5748]  ; g_sim
2:E26B  9a268391e2           lcall 0xe291, 0x8326  ; Sim::getTurnNumber@s7:8326
2:E270  050100               add ax, 1
2:E273  83d200               adc dx, 0
2:E276  8986e6fe             mov word ptr [bp - 0x11a], ax
2:E27A  8996e8fe             mov word ptr [bp - 0x118], dx
2:E27E  8d86eafe             lea ax, [bp - 0x116]
2:E282  16                   push ss
2:E283  50                   push ax
2:E284  66ffb6e6fe           push dword ptr [bp - 0x11a]
2:E289  66ff364857           push dword ptr [0x5748]  ; g_sim
2:E28E  9a728385e0           lcall 0xe085, 0x8372  ; sub_s7:8372
2:E293  c786eafe9a38         mov word ptr [bp - 0x116], 0x389a
2:E299  c786ecfe06e1         mov word ptr [bp - 0x114], 0xe106  ; SEGMENT s2:0000
loc_E29F:
2:E29F  c9                   leave
2:E2A0  ca0400               retf 4
2:E2A3  db 00

; ---------------- sub_s2:E2A4 FAR size=124 callers=1
2:E2A4  c8080000             enter 8, 0
2:E2A8  66ff760a             push dword ptr [bp + 0xa]
2:E2AC  683105               push 0x531
2:E2AF  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:E2B4  9a7e8450de           lcall 0xde50, 0x847e  ; LoadStringRes@s3:847E
2:E2B9  52                   push dx
2:E2BA  50                   push ax
2:E2BB  9a7a3dd2e2           lcall 0xe2d2, 0x3d7a  ; sub_s1:3D7A
2:E2C0  83c408               add sp, 8
2:E2C3  0bc0                 or ax, ax
2:E2C5  7414                 je 0xe2db
2:E2C7  66ff760a             push dword ptr [bp + 0xa]
2:E2CB  66ff760e             push dword ptr [bp + 0xe]
2:E2CF  9a7a3dbbe1           lcall 0xe1bb, 0x3d7a  ; sub_s1:3D7A
2:E2D4  83c408               add sp, 8
2:E2D7  0bc0                 or ax, ax
2:E2D9  7507                 jne 0xe2e2
loc_E2DB:
2:E2DB  33c0                 xor ax, ax
2:E2DD  c9                   leave
2:E2DE  ca0c00               retf 0xc
2:E2E1  db 90
loc_E2E2:
2:E2E2  66ff760e             push dword ptr [bp + 0xe]
2:E2E6  66ff760a             push dword ptr [bp + 0xa]
2:E2EA  66ff7606             push dword ptr [bp + 6]
2:E2EE  90                   nop
2:E2EF  0e                   push cs
2:E2F0  e8d905               call 0xe8cc  ; sub_s2:E8CC
2:E2F3  8946f8               mov word ptr [bp - 8], ax
2:E2F6  8956fa               mov word ptr [bp - 6], dx
2:E2F9  0bd0                 or dx, ax
2:E2FB  7507                 jne 0xe304
loc_E2FD:
2:E2FD  b80100               mov ax, 1
2:E300  c9                   leave
2:E301  ca0c00               retf 0xc
loc_E304:
2:E304  c45ef8               les bx, ptr [bp - 8]
2:E307  268b470c             mov ax, word ptr es:[bx + 0xc]
2:E30B  48                   dec ax
2:E30C  740a                 je 0xe318
2:E30E  48                   dec ax
2:E30F  7cca                 jl 0xe2db
2:E311  70c8                 jo 0xe2db
2:E313  48                   dec ax
2:E314  7ee7                 jle 0xe2fd
2:E316  ebc3                 jmp 0xe2db
loc_E318:
2:E318  b80200               mov ax, 2
2:E31B  c9                   leave
2:E31C  ca0c00               retf 0xc
2:E31F  db 00

; ---------------- sub_s2:E320 FAR size=204 callers=2
2:E320  c8120000             enter 0x12, 0
2:E324  c45e06               les bx, ptr [bp + 6]
2:E327  66268b471e           mov eax, dword ptr es:[bx + 0x1e]
2:E32C  6650                 push eax
2:E32E  9ace1758e3           lcall 0xe358, 0x17ce  ; operator_delete@s1:17CE
2:E333  83c404               add sp, 4
2:E336  c45e06               les bx, ptr [bp + 6]
2:E339  6626c7471e00000000   mov dword ptr es:[bx + 0x1e], 0
2:E342  66ff760a             push dword ptr [bp + 0xa]
2:E346  683105               push 0x531
2:E349  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:E34E  9a7e8480e3           lcall 0xe380, 0x847e  ; LoadStringRes@s3:847E
2:E353  52                   push dx
2:E354  50                   push ax
2:E355  9a7a3d6ce3           lcall 0xe36c, 0x3d7a  ; sub_s1:3D7A
2:E35A  83c408               add sp, 8
2:E35D  0bc0                 or ax, ax
2:E35F  7414                 je 0xe375
2:E361  66ff760a             push dword ptr [bp + 0xa]
2:E365  66ff760e             push dword ptr [bp + 0xe]
2:E369  9a7a3dbee2           lcall 0xe2be, 0x3d7a  ; sub_s1:3D7A
2:E36E  83c408               add sp, 8
2:E371  0bc0                 or ax, ax
2:E373  7521                 jne 0xe396
loc_E375:
2:E375  684304               push 0x443
loc_E378:
2:E378  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:E37D  9aac84b7e2           lcall 0xe2b7, 0x84ac  ; sub_s3:84AC
2:E382  c45e06               les bx, ptr [bp + 6]
2:E385  2689471e             mov word ptr es:[bx + 0x1e], ax
2:E389  26895720             mov word ptr es:[bx + 0x20], dx
2:E38D  268b471e             mov ax, word ptr es:[bx + 0x1e]
2:E391  c9                   leave
2:E392  ca0c00               retf 0xc
2:E395  db 90
loc_E396:
2:E396  66ff760e             push dword ptr [bp + 0xe]
2:E39A  66ff760a             push dword ptr [bp + 0xa]
2:E39E  66ff7606             push dword ptr [bp + 6]
2:E3A2  90                   nop
2:E3A3  0e                   push cs
2:E3A4  e82505               call 0xe8cc  ; sub_s2:E8CC
2:E3A7  8946f8               mov word ptr [bp - 8], ax
2:E3AA  8956fa               mov word ptr [bp - 6], dx
2:E3AD  0bd0                 or dx, ax
2:E3AF  7505                 jne 0xe3b6
2:E3B1  684404               push 0x444
2:E3B4  ebc2                 jmp 0xe378
loc_E3B6:
2:E3B6  c746f64304           mov word ptr [bp - 0xa], 0x443
2:E3BB  c45ef8               les bx, ptr [bp - 8]
2:E3BE  268b470c             mov ax, word ptr es:[bx + 0xc]
2:E3C2  0bc0                 or ax, ax
2:E3C4  740c                 je 0xe3d2
2:E3C6  48                   dec ax
2:E3C7  7413                 je 0xe3dc
2:E3C9  48                   dec ax
2:E3CA  7406                 je 0xe3d2
2:E3CC  48                   dec ax
2:E3CD  7415                 je 0xe3e4
2:E3CF  eb06                 jmp 0xe3d7
2:E3D1  db 90
loc_E3D2:
2:E3D2  c746f64404           mov word ptr [bp - 0xa], 0x444
loc_E3D7:
2:E3D7  ff76f6               push word ptr [bp - 0xa]
2:E3DA  eb9c                 jmp 0xe378
loc_E3DC:
2:E3DC  c746f64504           mov word ptr [bp - 0xa], 0x445
2:E3E1  ebf4                 jmp 0xe3d7
2:E3E3  db 90
loc_E3E4:
2:E3E4  c746f64604           mov word ptr [bp - 0xa], 0x446
2:E3E9  ebec                 jmp 0xe3d7
2:E3EB  db 00

; ---------------- sub_s2:E3EC FAR size=410 callers=2
2:E3EC  c82a0000             enter 0x2a, 0
2:E3F0  56                   push si
2:E3F1  c45e06               les bx, ptr [bp + 6]
2:E3F4  268b470e             mov ax, word ptr es:[bx + 0xe]
2:E3F8  268b5710             mov dx, word ptr es:[bx + 0x10]
2:E3FC  8bda                 mov bx, dx
2:E3FE  8946e2               mov word ptr [bp - 0x1e], ax
2:E401  8956e4               mov word ptr [bp - 0x1c], dx
2:E404  8946e6               mov word ptr [bp - 0x1a], ax
2:E407  8956e8               mov word ptr [bp - 0x18], dx
2:E40A  0bd8                 or bx, ax
2:E40C  740e                 je 0xe41c
2:E40E  6a01                 push 1
2:E410  52                   push dx
2:E411  50                   push ax
2:E412  8ec2                 mov es, dx
2:E414  8bd8                 mov bx, ax
2:E416  26c41f               les bx, ptr es:[bx]
2:E419  26ff1f               lcall es:[bx]
loc_E41C:
2:E41C  6a18                 push 0x18
2:E41E  9a9c17e4e4           lcall 0xe4e4, 0x179c  ; operator_new@s1:179C
2:E423  83c402               add sp, 2
2:E426  8946e2               mov word ptr [bp - 0x1e], ax
2:E429  8956e4               mov word ptr [bp - 0x1c], dx
2:E42C  0bd0                 or dx, ax
2:E42E  7412                 je 0xe442
2:E430  666a05               push 5
2:E433  666a05               push 5
2:E436  ff76e4               push word ptr [bp - 0x1c]
2:E439  50                   push ax
2:E43A  9ad81c00e5           lcall 0xe500, 0x1cd8  ; sub_s7:1CD8
2:E43F  eb04                 jmp 0xe445
2:E441  db 90
loc_E442:
2:E442  33c0                 xor ax, ax
2:E444  99                   cdq
loc_E445:
2:E445  c45e06               les bx, ptr [bp + 6]
2:E448  2689470e             mov word ptr es:[bx + 0xe], ax
2:E44C  26895710             mov word ptr es:[bx + 0x10], dx
2:E450  666800000004         push 0x4000000
2:E456  6a01                 push 1
2:E458  8d46ee               lea ax, [bp - 0x12]
2:E45B  16                   push ss
2:E45C  50                   push ax
2:E45D  9a52dc72e4           lcall 0xe472, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
2:E462  66c746ea00000000     mov dword ptr [bp - 0x16], 0
loc_E46A:
2:E46A  8d46ee               lea ax, [bp - 0x12]
2:E46D  16                   push ss
2:E46E  50                   push ax
2:E46F  9aece43ae5           lcall 0xe53a, 0xe4ec  ; DbIter::next@s6:E4EC
2:E474  8946ea               mov word ptr [bp - 0x16], ax
2:E477  8956ec               mov word ptr [bp - 0x14], dx
2:E47A  0bd0                 or dx, ax
2:E47C  742a                 je 0xe4a8
2:E47E  c45eea               les bx, ptr [bp - 0x16]
2:E481  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
2:E48B  74dd                 je 0xe46a
2:E48D  6626ff7704           push dword ptr es:[bx + 4]
2:E492  c45e06               les bx, ptr [bp + 6]
2:E495  6626ff770e           push dword ptr es:[bx + 0xe]
2:E49A  26c45f0e             les bx, ptr es:[bx + 0xe]
2:E49E  26c41f               les bx, ptr es:[bx]
2:E4A1  26ff5f0c             lcall es:[bx + 0xc]
2:E4A5  ebc3                 jmp 0xe46a
2:E4A7  db 90
loc_E4A8:
2:E4A8  c45e06               les bx, ptr [bp + 6]
2:E4AB  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:E4B0  c45e0e               les bx, ptr [bp + 0xe]
2:E4B3  66268907             mov dword ptr es:[bx], eax
2:E4B7  c45e06               les bx, ptr [bp + 6]
2:E4BA  66268b4712           mov eax, dword ptr es:[bx + 0x12]
2:E4BF  268b5714             mov dx, word ptr es:[bx + 0x14]
2:E4C3  668946e2             mov dword ptr [bp - 0x1e], eax
2:E4C7  668946e6             mov dword ptr [bp - 0x1a], eax
2:E4CB  8bda                 mov bx, dx
2:E4CD  0bd0                 or dx, ax
2:E4CF  740e                 je 0xe4df
2:E4D1  6a01                 push 1
2:E4D3  53                   push bx
2:E4D4  50                   push ax
2:E4D5  8ec3                 mov es, bx
2:E4D7  8bf0                 mov si, ax
2:E4D9  26c41c               les bx, ptr es:[si]
2:E4DC  26ff1f               lcall es:[bx]
loc_E4DF:
2:E4DF  6a18                 push 0x18
2:E4E1  9a9c1731e3           lcall 0xe331, 0x179c  ; operator_new@s1:179C
2:E4E6  83c402               add sp, 2
2:E4E9  8946e2               mov word ptr [bp - 0x1e], ax
2:E4EC  8956e4               mov word ptr [bp - 0x1c], dx
2:E4EF  0bd0                 or dx, ax
2:E4F1  7411                 je 0xe504
2:E4F3  666a05               push 5
2:E4F6  666a05               push 5
2:E4F9  ff76e4               push word ptr [bp - 0x1c]
2:E4FC  50                   push ax
2:E4FD  9ad81cfee1           lcall 0xe1fe, 0x1cd8  ; sub_s7:1CD8
2:E502  eb03                 jmp 0xe507
loc_E504:
2:E504  33c0                 xor ax, ax
2:E506  99                   cdq
loc_E507:
2:E507  c45e06               les bx, ptr [bp + 6]
2:E50A  26894712             mov word ptr es:[bx + 0x12], ax
2:E50E  26895714             mov word ptr es:[bx + 0x14], dx
2:E512  837efe00             cmp word ptr [bp - 2], 0
2:E516  7406                 je 0xe51e
2:E518  b80100               mov ax, 1
2:E51B  99                   cdq
2:E51C  eb06                 jmp 0xe524
loc_E51E:
2:E51E  8b46fa               mov ax, word ptr [bp - 6]
2:E521  8b56fc               mov dx, word ptr [bp - 4]
loc_E524:
2:E524  8946f6               mov word ptr [bp - 0xa], ax
2:E527  8956f8               mov word ptr [bp - 8], dx
2:E52A  66c746ea00000000     mov dword ptr [bp - 0x16], 0
loc_E532:
2:E532  8d46ee               lea ax, [bp - 0x12]
2:E535  16                   push ss
2:E536  50                   push ax
2:E537  9aece43dcc           lcall 0xcc3d, 0xe4ec  ; DbIter::next@s6:E4EC
2:E53C  8946ea               mov word ptr [bp - 0x16], ax
2:E53F  8956ec               mov word ptr [bp - 0x14], dx
2:E542  0bd0                 or dx, ax
2:E544  741e                 je 0xe564
2:E546  c45eea               les bx, ptr [bp - 0x16]
2:E549  6626ff7704           push dword ptr es:[bx + 4]
2:E54E  c45e06               les bx, ptr [bp + 6]
2:E551  6626ff7712           push dword ptr es:[bx + 0x12]
2:E556  26c45f12             les bx, ptr es:[bx + 0x12]
2:E55A  26c41f               les bx, ptr es:[bx]
2:E55D  26ff5f0c             lcall es:[bx + 0xc]
2:E561  ebcf                 jmp 0xe532
2:E563  db 90
loc_E564:
2:E564  c45e06               les bx, ptr [bp + 6]
2:E567  66268b4712           mov eax, dword ptr es:[bx + 0x12]
2:E56C  268b5714             mov dx, word ptr es:[bx + 0x14]
2:E570  c45e0a               les bx, ptr [bp + 0xa]
2:E573  66268907             mov dword ptr es:[bx], eax
2:E577  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
2:E57C  c746f09de2           mov word ptr [bp - 0x10], 0xe29d  ; SEGMENT s2:0000
2:E581  5e                   pop si
2:E582  c9                   leave
2:E583  ca0c00               retf 0xc

; ---------------- sub_s2:E586 FAR size=84 callers=3
2:E586  c8080000             enter 8, 0
2:E58A  66ff760a             push dword ptr [bp + 0xa]
2:E58E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:E593  9aece160e4           lcall 0xe460, 0xe1ec  ; Db::resolveHandle@s6:E1EC
2:E598  8946fc               mov word ptr [bp - 4], ax
2:E59B  8956fe               mov word ptr [bp - 2], dx
2:E59E  0bd0                 or dx, ax
2:E5A0  7508                 jne 0xe5aa
2:E5A2  33c0                 xor ax, ax
2:E5A4  99                   cdq
2:E5A5  c9                   leave
2:E5A6  ca0800               retf 8
2:E5A9  db 90
loc_E5AA:
2:E5AA  688000               push 0x80
2:E5AD  9a9c17cde5           lcall 0xe5cd, 0x179c  ; operator_new@s1:179C
2:E5B2  83c402               add sp, 2
2:E5B5  8946f8               mov word ptr [bp - 8], ax
2:E5B8  8956fa               mov word ptr [bp - 6], dx
2:E5BB  66ff76fc             push dword ptr [bp - 4]
2:E5BF  9a284d3fd4           lcall 0xd43f, 0x4d28  ; sub_s8:4D28
2:E5C4  52                   push dx
2:E5C5  50                   push ax
2:E5C6  66ff76f8             push dword ptr [bp - 8]
2:E5CA  9a3e3d21e4           lcall 0xe421, 0x3d3e  ; _fstrcpy@s1:3D3E
2:E5CF  8b46f8               mov ax, word ptr [bp - 8]
2:E5D2  8b56fa               mov dx, word ptr [bp - 6]
2:E5D5  c9                   leave
2:E5D6  ca0800               retf 8
2:E5D9  db 00

; ---------------- sub_s2:E5DA FAR size=308 callers=0
2:E5DA  c82e0000             enter 0x2e, 0
2:E5DE  6a14                 push 0x14
2:E5E0  66ff760a             push dword ptr [bp + 0xa]
2:E5E4  90                   nop
2:E5E5  0e                   push cs
2:E5E6  e8c396               call 0x7cac  ; Save_writeChunkTag@s2:7CAC
2:E5E9  0bc0                 or ax, ax
2:E5EB  7507                 jne 0xe5f4
loc_E5ED:
2:E5ED  33c0                 xor ax, ax
2:E5EF  c9                   leave
2:E5F0  ca0800               retf 8
2:E5F3  db 90
loc_E5F4:
2:E5F4  c45e06               les bx, ptr [bp + 6]
2:E5F7  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
2:E5FD  740d                 je 0xe60c
2:E5FF  26c45f0a             les bx, ptr es:[bx + 0xa]
2:E603  268b4708             mov ax, word ptr es:[bx + 8]
2:E607  8946fe               mov word ptr [bp - 2], ax
2:E60A  eb05                 jmp 0xe611
loc_E60C:
2:E60C  c746fe0000           mov word ptr [bp - 2], 0
loc_E611:
2:E611  8b46fe               mov ax, word ptr [bp - 2]
2:E614  8946e6               mov word ptr [bp - 0x1a], ax
2:E617  666a02               push 2
2:E61A  8d46e6               lea ax, [bp - 0x1a]
2:E61D  16                   push ss
2:E61E  50                   push ax
2:E61F  66ff760a             push dword ptr [bp + 0xa]
2:E623  90                   nop
2:E624  0e                   push cs
2:E625  e8f497               call 0x7e1c  ; File_write@s2:7E1C
2:E628  0bc0                 or ax, ax
2:E62A  7508                 jne 0xe634
loc_E62C:
2:E62C  c7061003d006         mov word ptr [0x310], 0x6d0
2:E632  ebb9                 jmp 0xe5ed
loc_E634:
2:E634  c45e06               les bx, ptr [bp + 6]
2:E637  6626ff770a           push dword ptr es:[bx + 0xa]
2:E63C  8d46f6               lea ax, [bp - 0xa]
2:E63F  16                   push ss
2:E640  50                   push ax
2:E641  90                   nop
2:E642  0e                   push cs
2:E643  e83e71               call 0x15784  ; ListIter::ListIter@s2:5784
loc_E646:
2:E646  8d46f6               lea ax, [bp - 0xa]
2:E649  16                   push ss
2:E64A  50                   push ax
2:E64B  90                   nop
2:E64C  0e                   push cs
2:E64D  e8c274               call 0x15b12  ; ListIter::next@s2:5B12
2:E650  8946f2               mov word ptr [bp - 0xe], ax
2:E653  8956f4               mov word ptr [bp - 0xc], dx
2:E656  0bd0                 or dx, ax
2:E658  0f84aa00             je 0xe706
2:E65C  c45ef2               les bx, ptr [bp - 0xe]
2:E65F  66268b4704           mov eax, dword ptr es:[bx + 4]
2:E664  668946de             mov dword ptr [bp - 0x22], eax
2:E668  666a04               push 4
2:E66B  8d46de               lea ax, [bp - 0x22]
2:E66E  16                   push ss
2:E66F  50                   push ax
2:E670  66ff760a             push dword ptr [bp + 0xa]
2:E674  90                   nop
2:E675  0e                   push cs
2:E676  e8a397               call 0x7e1c  ; File_write@s2:7E1C
2:E679  0bc0                 or ax, ax
2:E67B  74af                 je 0xe62c
2:E67D  c45ef2               les bx, ptr [bp - 0xe]
2:E680  66268b4708           mov eax, dword ptr es:[bx + 8]
2:E685  668946da             mov dword ptr [bp - 0x26], eax
2:E689  666a04               push 4
2:E68C  8d46da               lea ax, [bp - 0x26]
2:E68F  16                   push ss
2:E690  50                   push ax
2:E691  66ff760a             push dword ptr [bp + 0xa]
2:E695  90                   nop
2:E696  0e                   push cs
2:E697  e88297               call 0x7e1c  ; File_write@s2:7E1C
2:E69A  0bc0                 or ax, ax
2:E69C  748e                 je 0xe62c
2:E69E  c45ef2               les bx, ptr [bp - 0xe]
2:E6A1  268b470c             mov ax, word ptr es:[bx + 0xc]
2:E6A5  8946ec               mov word ptr [bp - 0x14], ax
2:E6A8  666a02               push 2
2:E6AB  8d46ec               lea ax, [bp - 0x14]
2:E6AE  16                   push ss
2:E6AF  50                   push ax
2:E6B0  66ff760a             push dword ptr [bp + 0xa]
2:E6B4  90                   nop
2:E6B5  0e                   push cs
2:E6B6  e86397               call 0x7e1c  ; File_write@s2:7E1C
2:E6B9  0bc0                 or ax, ax
2:E6BB  0f846dff             je 0xe62c
2:E6BF  c45ef2               les bx, ptr [bp - 0xe]
2:E6C2  66268b470e           mov eax, dword ptr es:[bx + 0xe]
2:E6C7  668946d2             mov dword ptr [bp - 0x2e], eax
2:E6CB  666a04               push 4
2:E6CE  8d46d2               lea ax, [bp - 0x2e]
2:E6D1  16                   push ss
2:E6D2  50                   push ax
2:E6D3  66ff760a             push dword ptr [bp + 0xa]
2:E6D7  90                   nop
2:E6D8  0e                   push cs
2:E6D9  e84097               call 0x7e1c  ; File_write@s2:7E1C
2:E6DC  0bc0                 or ax, ax
2:E6DE  0f844aff             je 0xe62c
2:E6E2  c45ef2               les bx, ptr [bp - 0xe]
2:E6E5  268b4712             mov ax, word ptr es:[bx + 0x12]
2:E6E9  8946ec               mov word ptr [bp - 0x14], ax
2:E6EC  666a02               push 2
2:E6EF  8d46ec               lea ax, [bp - 0x14]
2:E6F2  16                   push ss
2:E6F3  50                   push ax
2:E6F4  66ff760a             push dword ptr [bp + 0xa]
2:E6F8  90                   nop
2:E6F9  0e                   push cs
2:E6FA  e81f97               call 0x7e1c  ; File_write@s2:7E1C
2:E6FD  0bc0                 or ax, ax
2:E6FF  0f8543ff             jne 0xe646
2:E703  e926ff               jmp 0xe62c
loc_E706:
2:E706  b80100               mov ax, 1
2:E709  c9                   leave
2:E70A  ca0800               retf 8
2:E70D  db 00

; ---------------- sub_s2:E70E FAR size=324 callers=0
2:E70E  c8360000             enter 0x36, 0
2:E712  833e120302           cmp word ptr [0x312], 2
2:E717  7d07                 jge 0xe720
loc_E719:
2:E719  b80100               mov ax, 1
2:E71C  c9                   leave
2:E71D  ca0800               retf 8
loc_E720:
2:E720  6a14                 push 0x14
2:E722  66ff760a             push dword ptr [bp + 0xa]
2:E726  90                   nop
2:E727  0e                   push cs
2:E728  e8d395               call 0x7cfe  ; sub_s2:7CFE
2:E72B  0bc0                 or ax, ax
2:E72D  7507                 jne 0xe736
loc_E72F:
2:E72F  33c0                 xor ax, ax
2:E731  c9                   leave
2:E732  ca0800               retf 8
2:E735  db 90
loc_E736:
2:E736  666a02               push 2
2:E739  8d46fe               lea ax, [bp - 2]
2:E73C  16                   push ss
2:E73D  50                   push ax
2:E73E  66ff760a             push dword ptr [bp + 0xa]
2:E742  90                   nop
2:E743  0e                   push cs
2:E744  e8a796               call 0x7dee  ; File_read@s2:7DEE
2:E747  0bc0                 or ax, ax
2:E749  7509                 jne 0xe754
loc_E74B:
2:E74B  c7061003d206         mov word ptr [0x310], 0x6d2
2:E751  ebdc                 jmp 0xe72f
2:E753  db 90
loc_E754:
2:E754  837efe00             cmp word ptr [bp - 2], 0
2:E758  74bf                 je 0xe719
2:E75A  c746f80000           mov word ptr [bp - 8], 0
2:E75F  e9c400               jmp 0xe826
loc_E762:
2:E762  33c0                 xor ax, ax
2:E764  99                   cdq
loc_E765:
2:E765  8946f4               mov word ptr [bp - 0xc], ax
2:E768  8956f6               mov word ptr [bp - 0xa], dx
2:E76B  666a04               push 4
2:E76E  050400               add ax, 4
2:E771  52                   push dx
2:E772  50                   push ax
2:E773  66ff760a             push dword ptr [bp + 0xa]
2:E777  90                   nop
2:E778  0e                   push cs
2:E779  e87296               call 0x7dee  ; File_read@s2:7DEE
2:E77C  0bc0                 or ax, ax
2:E77E  7460                 je 0xe7e0
2:E780  666a04               push 4
2:E783  668b46f4             mov eax, dword ptr [bp - 0xc]
2:E787  050800               add ax, 8
2:E78A  6650                 push eax
2:E78C  66ff760a             push dword ptr [bp + 0xa]
2:E790  90                   nop
2:E791  0e                   push cs
2:E792  e85996               call 0x7dee  ; File_read@s2:7DEE
2:E795  0bc0                 or ax, ax
2:E797  7447                 je 0xe7e0
2:E799  666a02               push 2
2:E79C  8d46f0               lea ax, [bp - 0x10]
2:E79F  16                   push ss
2:E7A0  50                   push ax
2:E7A1  66ff760a             push dword ptr [bp + 0xa]
2:E7A5  90                   nop
2:E7A6  0e                   push cs
2:E7A7  e84496               call 0x7dee  ; File_read@s2:7DEE
2:E7AA  0bc0                 or ax, ax
2:E7AC  7432                 je 0xe7e0
2:E7AE  666a04               push 4
2:E7B1  668b46f4             mov eax, dword ptr [bp - 0xc]
2:E7B5  050e00               add ax, 0xe
2:E7B8  6650                 push eax
2:E7BA  66ff760a             push dword ptr [bp + 0xa]
2:E7BE  90                   nop
2:E7BF  0e                   push cs
2:E7C0  e82b96               call 0x7dee  ; File_read@s2:7DEE
2:E7C3  0bc0                 or ax, ax
2:E7C5  7419                 je 0xe7e0
2:E7C7  666a02               push 2
2:E7CA  668b46f4             mov eax, dword ptr [bp - 0xc]
2:E7CE  051200               add ax, 0x12
2:E7D1  6650                 push eax
2:E7D3  66ff760a             push dword ptr [bp + 0xa]
2:E7D7  90                   nop
2:E7D8  0e                   push cs
2:E7D9  e81296               call 0x7dee  ; File_read@s2:7DEE
2:E7DC  0bc0                 or ax, ax
2:E7DE  7524                 jne 0xe804
loc_E7E0:
2:E7E0  668b46f4             mov eax, dword ptr [bp - 0xc]
2:E7E4  668946ca             mov dword ptr [bp - 0x36], eax
2:E7E8  668946ec             mov dword ptr [bp - 0x14], eax
2:E7EC  660bc0               or eax, eax
2:E7EF  0f8458ff             je 0xe74b
2:E7F3  6a01                 push 1
2:E7F5  c45ef4               les bx, ptr [bp - 0xc]
2:E7F8  06                   push es
2:E7F9  50                   push ax
2:E7FA  26c41f               les bx, ptr es:[bx]
2:E7FD  26ff1f               lcall es:[bx]
2:E800  e948ff               jmp 0xe74b
2:E803  db 90
loc_E804:
2:E804  8b46f0               mov ax, word ptr [bp - 0x10]
2:E807  c45ef4               les bx, ptr [bp - 0xc]
2:E80A  2689470c             mov word ptr es:[bx + 0xc], ax
2:E80E  06                   push es
2:E80F  53                   push bx
2:E810  c45e06               les bx, ptr [bp + 6]
2:E813  6626ff770a           push dword ptr es:[bx + 0xa]
2:E818  26c45f0a             les bx, ptr es:[bx + 0xa]
2:E81C  26c41f               les bx, ptr es:[bx]
2:E81F  26ff5f04             lcall es:[bx + 4]
2:E823  ff46f8               inc word ptr [bp - 8]
loc_E826:
2:E826  8b46fe               mov ax, word ptr [bp - 2]
2:E829  3946f8               cmp word ptr [bp - 8], ax
2:E82C  0f83e9fe             jae 0xe719
2:E830  6a14                 push 0x14
2:E832  9a9c17b0e5           lcall 0xe5b0, 0x179c  ; operator_new@s1:179C
2:E837  83c402               add sp, 2
2:E83A  8946ec               mov word ptr [bp - 0x14], ax
2:E83D  8956ee               mov word ptr [bp - 0x12], dx
2:E840  0bd0                 or dx, ax
2:E842  0f841cff             je 0xe762
2:E846  ff76ee               push word ptr [bp - 0x12]
2:E849  50                   push ax
2:E84A  90                   nop
2:E84B  0e                   push cs
2:E84C  e88df4               call 0xdcdc  ; sub_s2:DCDC
2:E84F  e913ff               jmp 0xe765

; ---------------- sub_s2:E852 FAR size=122 callers=6
2:E852  c8260000             enter 0x26, 0
2:E856  666800000004         push 0x4000000
2:E85C  6a01                 push 1
2:E85E  8d46ee               lea ax, [bp - 0x12]
2:E861  16                   push ss
2:E862  50                   push ax
2:E863  9a52dc78e8           lcall 0xe878, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
2:E868  66c746ea00000000     mov dword ptr [bp - 0x16], 0
loc_E870:
2:E870  8d46ee               lea ax, [bp - 0x12]
2:E873  16                   push ss
2:E874  50                   push ax
2:E875  9aece496e5           lcall 0xe596, 0xe4ec  ; DbIter::next@s6:E4EC
2:E87A  8946ea               mov word ptr [bp - 0x16], ax
2:E87D  8956ec               mov word ptr [bp - 0x14], dx
2:E880  0bd0                 or dx, ax
2:E882  741b                 je 0xe89f
2:E884  ff76ec               push word ptr [bp - 0x14]
2:E887  50                   push ax
2:E888  9a284dc2e5           lcall 0xe5c2, 0x4d28  ; sub_s8:4D28
2:E88D  52                   push dx
2:E88E  50                   push ax
2:E88F  66ff760a             push dword ptr [bp + 0xa]
2:E893  9a7a3d35e8           lcall 0xe835, 0x3d7a  ; sub_s1:3D7A
2:E898  83c408               add sp, 8
2:E89B  0bc0                 or ax, ax
2:E89D  75d1                 jne 0xe870
loc_E89F:
2:E89F  66837eea00           cmp dword ptr [bp - 0x16], 0
2:E8A4  740e                 je 0xe8b4
2:E8A6  c45eea               les bx, ptr [bp - 0x16]
2:E8A9  66268b4704           mov eax, dword ptr es:[bx + 4]
2:E8AE  668946e6             mov dword ptr [bp - 0x1a], eax
2:E8B2  eb07                 jmp 0xe8bb
loc_E8B4:
2:E8B4  662bc0               sub eax, eax
2:E8B7  668946e6             mov dword ptr [bp - 0x1a], eax
loc_E8BB:
2:E8BB  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
2:E8C0  c746f07fe5           mov word ptr [bp - 0x10], 0xe57f  ; SEGMENT s2:0000
2:E8C5  8b56e8               mov dx, word ptr [bp - 0x18]
2:E8C8  c9                   leave
2:E8C9  ca0800               retf 8

; ---------------- sub_s2:E8CC FAR size=216 callers=5
2:E8CC  c81c0000             enter 0x1c, 0
2:E8D0  c45e06               les bx, ptr [bp + 6]
2:E8D3  6626ff770a           push dword ptr es:[bx + 0xa]
2:E8D8  8d46f8               lea ax, [bp - 8]
2:E8DB  16                   push ss
2:E8DC  50                   push ax
2:E8DD  90                   nop
2:E8DE  0e                   push cs
2:E8DF  e8a26e               call 0x15784  ; ListIter::ListIter@s2:5784
loc_E8E2:
2:E8E2  8d46f8               lea ax, [bp - 8]
2:E8E5  16                   push ss
2:E8E6  50                   push ax
2:E8E7  90                   nop
2:E8E8  0e                   push cs
2:E8E9  e82672               call 0x15b12  ; ListIter::next@s2:5B12
2:E8EC  8946f4               mov word ptr [bp - 0xc], ax
2:E8EF  8956f6               mov word ptr [bp - 0xa], dx
2:E8F2  0bd0                 or dx, ax
2:E8F4  0f84a200             je 0xe99a
2:E8F8  c45ef4               les bx, ptr [bp - 0xc]
2:E8FB  6626ff7704           push dword ptr es:[bx + 4]
2:E900  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:E905  9aece120e9           lcall 0xe920, 0xe1ec  ; Db::resolveHandle@s6:E1EC
2:E90A  8946f0               mov word ptr [bp - 0x10], ax
2:E90D  8956f2               mov word ptr [bp - 0xe], dx
2:E910  c45ef4               les bx, ptr [bp - 0xc]
2:E913  6626ff7708           push dword ptr es:[bx + 8]
2:E918  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
2:E91D  9aece166e8           lcall 0xe866, 0xe1ec  ; Db::resolveHandle@s6:E1EC
2:E922  8946ec               mov word ptr [bp - 0x14], ax
2:E925  8956ee               mov word ptr [bp - 0x12], dx
2:E928  66ff76f0             push dword ptr [bp - 0x10]
2:E92C  9a284d3ee9           lcall 0xe93e, 0x4d28  ; sub_s8:4D28
2:E931  8946e8               mov word ptr [bp - 0x18], ax
2:E934  8956ea               mov word ptr [bp - 0x16], dx
2:E937  66ff76ec             push dword ptr [bp - 0x14]
2:E93B  9a284d8be8           lcall 0xe88b, 0x4d28  ; sub_s8:4D28
2:E940  8946e4               mov word ptr [bp - 0x1c], ax
2:E943  8956e6               mov word ptr [bp - 0x1a], dx
2:E946  66ff76e8             push dword ptr [bp - 0x18]
2:E94A  66ff760e             push dword ptr [bp + 0xe]
2:E94E  9a7a3d65e9           lcall 0xe965, 0x3d7a  ; sub_s1:3D7A
2:E953  83c408               add sp, 8
2:E956  0bc0                 or ax, ax
2:E958  7514                 jne 0xe96e
2:E95A  66ff76e4             push dword ptr [bp - 0x1c]
2:E95E  66ff760a             push dword ptr [bp + 0xa]
2:E962  9a7a3d79e9           lcall 0xe979, 0x3d7a  ; sub_s1:3D7A
2:E967  83c408               add sp, 8
2:E96A  0bc0                 or ax, ax
2:E96C  742c                 je 0xe99a
loc_E96E:
2:E96E  66ff76e8             push dword ptr [bp - 0x18]
2:E972  66ff760a             push dword ptr [bp + 0xa]
2:E976  9a7a3d8fe9           lcall 0xe98f, 0x3d7a  ; sub_s1:3D7A
2:E97B  83c408               add sp, 8
2:E97E  0bc0                 or ax, ax
2:E980  0f855eff             jne 0xe8e2
2:E984  66ff76e4             push dword ptr [bp - 0x1c]
2:E988  66ff760e             push dword ptr [bp + 0xe]
2:E98C  9a7a3d96e8           lcall 0xe896, 0x3d7a  ; sub_s1:3D7A
2:E991  83c408               add sp, 8
2:E994  0bc0                 or ax, ax
2:E996  0f8548ff             jne 0xe8e2
loc_E99A:
2:E99A  8b46f4               mov ax, word ptr [bp - 0xc]
2:E99D  8b56f6               mov dx, word ptr [bp - 0xa]
2:E9A0  c9                   leave
2:E9A1  ca0c00               retf 0xc

; ---------------- sub_s2:E9A4 FAR size=226 callers=2
2:E9A4  c8160000             enter 0x16, 0
2:E9A8  66ff364857           push dword ptr [0x5748]  ; g_sim
2:E9AD  9a26833de4           lcall 0xe43d, 0x8326  ; Sim::getTurnNumber@s7:8326
2:E9B2  c45e0a               les bx, ptr [bp + 0xa]
2:E9B5  262b470e             sub ax, word ptr es:[bx + 0xe]
2:E9B9  261b5710             sbb dx, word ptr es:[bx + 0x10]
2:E9BD  8946fc               mov word ptr [bp - 4], ax
2:E9C0  8956fe               mov word ptr [bp - 2], dx
2:E9C3  6a02                 push 2
2:E9C5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:E9CA  9aba2051e3           lcall 0xe351, 0x20ba  ; sub_s3:20BA
2:E9CF  a1ae13               mov ax, word ptr [0x13ae]
2:E9D2  8946f6               mov word ptr [bp - 0xa], ax
2:E9D5  66c746f200000000     mov dword ptr [bp - 0xe], 0
2:E9DD  8b46f6               mov ax, word ptr [bp - 0xa]
2:E9E0  48                   dec ax
2:E9E1  7c48                 jl 0xea2b
2:E9E3  7046                 jo 0xea2b
2:E9E5  48                   dec ax
2:E9E6  7e08                 jle 0xe9f0
2:E9E8  48                   dec ax
2:E9E9  7415                 je 0xea00
2:E9EB  48                   dec ax
2:E9EC  7428                 je 0xea16
2:E9EE  eb3b                 jmp 0xea2b
loc_E9F0:
2:E9F0  c45e0a               les bx, ptr [bp + 0xa]
2:E9F3  26837f1200           cmp word ptr es:[bx + 0x12], 0
2:E9F8  7426                 je 0xea20
2:E9FA  b80a00               mov ax, 0xa
2:E9FD  eb24                 jmp 0xea23
2:E9FF  db 90
loc_EA00:
2:EA00  c45e0a               les bx, ptr [bp + 0xa]
2:EA03  26837f1200           cmp word ptr es:[bx + 0x12], 0
2:EA08  7406                 je 0xea10
2:EA0A  b81400               mov ax, 0x14
2:EA0D  eb14                 jmp 0xea23
2:EA0F  db 90
loc_EA10:
2:EA10  b82800               mov ax, 0x28
2:EA13  eb0e                 jmp 0xea23
2:EA15  db 90
loc_EA16:
2:EA16  c45e0a               les bx, ptr [bp + 0xa]
2:EA19  26837f1200           cmp word ptr es:[bx + 0x12], 0
2:EA1E  7418                 je 0xea38
loc_EA20:
2:EA20  b81e00               mov ax, 0x1e
loc_EA23:
2:EA23  33d2                 xor dx, dx
2:EA25  8946f2               mov word ptr [bp - 0xe], ax
2:EA28  8956f4               mov word ptr [bp - 0xc], dx
loc_EA2B:
2:EA2B  668b46fc             mov eax, dword ptr [bp - 4]
2:EA2F  663946f2             cmp dword ptr [bp - 0xe], eax
2:EA33  7209                 jb 0xea3e
2:EA35  eb49                 jmp 0xea80
2:EA37  db 90
loc_EA38:
2:EA38  b83200               mov ax, 0x32
2:EA3B  ebe6                 jmp 0xea23
2:EA3D  db 90
loc_EA3E:
2:EA3E  666801006400         push 0x640001
2:EA44  90                   nop
2:EA45  0e                   push cs
2:EA46  e8e576               call 0x1612e  ; sub_s2:612E
2:EA49  83c404               add sp, 4
2:EA4C  8946f0               mov word ptr [bp - 0x10], ax
2:EA4F  c746ee0000           mov word ptr [bp - 0x12], 0
2:EA54  c45e0a               les bx, ptr [bp + 0xa]
2:EA57  268b470c             mov ax, word ptr es:[bx + 0xc]
2:EA5B  48                   dec ax
2:EA5C  48                   dec ax
2:EA5D  7405                 je 0xea64
2:EA5F  48                   dec ax
2:EA60  7416                 je 0xea78
2:EA62  eb05                 jmp 0xea69
loc_EA64:
2:EA64  c746ee3200           mov word ptr [bp - 0x12], 0x32
loc_EA69:
2:EA69  8b46f0               mov ax, word ptr [bp - 0x10]
2:EA6C  3946ee               cmp word ptr [bp - 0x12], ax
2:EA6F  7e0f                 jle 0xea80
2:EA71  b80100               mov ax, 1
2:EA74  c9                   leave
2:EA75  ca0800               retf 8
loc_EA78:
2:EA78  c746ee1900           mov word ptr [bp - 0x12], 0x19
2:EA7D  ebea                 jmp 0xea69
2:EA7F  db 90
loc_EA80:
2:EA80  33c0                 xor ax, ax
2:EA82  c9                   leave
2:EA83  ca0800               retf 8

; ---------------- sub_s2:EA86 FAR size=54 callers=0
2:EA86  55                   push bp
2:EA87  8bec                 mov bp, sp
2:EA89  66ff7606             push dword ptr [bp + 6]
2:EA8D  90                   nop
2:EA8E  0e                   push cs
2:EA8F  e838f3               call 0xddca  ; sub_s2:DDCA
2:EA92  f6460a01             test byte ptr [bp + 0xa], 1
2:EA96  7409                 je 0xeaa1
2:EA98  66ff7606             push dword ptr [bp + 6]
2:EA9C  9ace1751e9           lcall 0xe951, 0x17ce  ; operator_delete@s1:17CE
loc_EAA1:
2:EAA1  8b4606               mov ax, word ptr [bp + 6]
2:EAA4  8b5608               mov dx, word ptr [bp + 8]
2:EAA7  c9                   leave
2:EAA8  ca0600               retf 6
2:EAAB  db 90 86 ea b6 ea f2 1d cd e9 da e5 ba ea 0e e7 c3
2:EABB  db e8

; ---------------- sub_s2:EABC FAR size=56 callers=1
2:EABC  55                   push bp
2:EABD  8bec                 mov bp, sp
2:EABF  66ff7608             push dword ptr [bp + 8]
2:EAC3  ff7606               push word ptr [bp + 6]
2:EAC6  9a481db2ea           lcall 0xeab2, 0x1d48  ; sub_s3:1D48
2:EACB  c45e06               les bx, ptr [bp + 6]
2:EACE  26c7470a0000         mov word ptr es:[bx + 0xa], 0
2:EAD4  8d470c               lea ax, [bx + 0xc]
2:EAD7  06                   push es
2:EAD8  50                   push ax
2:EAD9  90                   nop
2:EADA  0e                   push cs
2:EADB  e85a53               call 0x13e38  ; sub_s2:3E38
2:EADE  c45e06               les bx, ptr [bp + 6]
2:EAE1  26c7071aeb           mov word ptr es:[bx], 0xeb1a
2:EAE6  26c74702aeea         mov word ptr es:[bx + 2], 0xeaae  ; SEGMENT s2:0000
2:EAEC  8bc3                 mov ax, bx
2:EAEE  8cc2                 mov dx, es
2:EAF0  c9                   leave
2:EAF1  ca0600               retf 6

; ---------------- sub_s2:EAF4 size=54 callers=0
2:EAF4  c8040000             enter 4, 0
2:EAF8  66ff7606             push dword ptr [bp + 6]
2:EAFC  9a801dc9ea           lcall 0xeac9, 0x1d80  ; sub_s3:1D80
2:EB01  f6460a01             test byte ptr [bp + 0xa], 1
2:EB05  7409                 je 0xeb10
2:EB07  66ff7606             push dword ptr [bp + 6]
2:EB0B  9ace179fea           lcall 0xea9f, 0x17ce  ; operator_delete@s1:17CE
loc_EB10:
2:EB10  8b4606               mov ax, word ptr [bp + 6]
2:EB13  8b5608               mov dx, word ptr [bp + 8]
2:EB16  c9                   leave
2:EB17  ca0600               retf 6
2:EB1A  db f4 ea ea ea f2 1d 24 eb ce 1d 28 eb d4 1d ff ea

; ---------------- sub_s2:EB2A FAR size=50 callers=1
2:EB2A  55                   push bp
2:EB2B  8bec                 mov bp, sp
2:EB2D  66ff7608             push dword ptr [bp + 8]
2:EB31  ff7606               push word ptr [bp + 6]
2:EB34  9a481d20eb           lcall 0xeb20, 0x1d48  ; sub_s3:1D48
2:EB39  c45e06               les bx, ptr [bp + 6]
2:EB3C  662bc0               sub eax, eax
2:EB3F  2689470a             mov word ptr es:[bx + 0xa], ax
2:EB43  662689470c           mov dword ptr es:[bx + 0xc], eax
2:EB48  26c70700ec           mov word ptr es:[bx], 0xec00
2:EB4D  26c747021ceb         mov word ptr es:[bx + 2], 0xeb1c  ; SEGMENT s2:0000
2:EB53  8bc3                 mov ax, bx
2:EB55  8cc2                 mov dx, es
2:EB57  c9                   leave
2:EB58  ca0600               retf 6
2:EB5B  db 00

; ---------------- sub_s2:EB5C FAR size=18 callers=1
2:EB5C  55                   push bp
2:EB5D  8bec                 mov bp, sp
2:EB5F  8b460a               mov ax, word ptr [bp + 0xa]
2:EB62  c1e004               shl ax, 4
2:EB65  050e0d               add ax, 0xd0e
2:EB68  8cda                 mov dx, ds
2:EB6A  c9                   leave
2:EB6B  ca0600               retf 6

; ---------------- sub_s2:EB6E FAR size=6 callers=1
2:EB6E  b80500               mov ax, 5
2:EB71  ca0400               retf 4

; ---------------- sub_s2:EB74 FAR size=102 callers=2
2:EB74  c80c0000             enter 0xc, 0
2:EB78  56                   push si
2:EB79  8b460a               mov ax, word ptr [bp + 0xa]
2:EB7C  c45e06               les bx, ptr [bp + 6]
2:EB7F  2689470a             mov word ptr es:[bx + 0xa], ax
2:EB83  0bc0                 or ax, ax
2:EB85  744e                 je 0xebd5
2:EB87  6a03                 push 3
2:EB89  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:EB8E  9aba2098eb           lcall 0xeb98, 0x20ba  ; sub_s3:20BA
2:EB93  52                   push dx
2:EB94  50                   push ax
2:EB95  9a12c337eb           lcall 0xeb37, 0xc312  ; sub_s3:C312
2:EB9A  8946f8               mov word ptr [bp - 8], ax
2:EB9D  8956fa               mov word ptr [bp - 6], dx
2:EBA0  c45e06               les bx, ptr [bp + 6]
2:EBA3  268b5f0a             mov bx, word ptr es:[bx + 0xa]
2:EBA7  8bc3                 mov ax, bx
2:EBA9  c1e304               shl bx, 4
2:EBAC  668b8f040d           mov ecx, dword ptr [bx + 0xd04]
2:EBB1  6651                 push ecx
2:EBB3  8bf0                 mov si, ax
2:EBB5  668b46f8             mov eax, dword ptr [bp - 8]
2:EBB9  6659                 pop ecx
2:EBBB  6633d2               xor edx, edx
2:EBBE  66f7f1               div ecx
2:EBC1  668bc2               mov eax, edx
2:EBC4  66c1ea10             shr edx, 0x10
2:EBC8  8bd8                 mov bx, ax
2:EBCA  c1e603               shl si, 3
2:EBCD  03de                 add bx, si
2:EBCF  03db                 add bx, bx
2:EBD1  8b87080d             mov ax, word ptr [bx + 0xd08]
loc_EBD5:
2:EBD5  5e                   pop si
2:EBD6  c9                   leave
2:EBD7  ca0600               retf 6

; ---------------- sub_s2:EBDA size=54 callers=0
2:EBDA  c8040000             enter 4, 0
2:EBDE  66ff7606             push dword ptr [bp + 6]
2:EBE2  9a801d91eb           lcall 0xeb91, 0x1d80  ; sub_s3:1D80
2:EBE7  f6460a01             test byte ptr [bp + 0xa], 1
2:EBEB  7409                 je 0xebf6
2:EBED  66ff7606             push dword ptr [bp + 6]
2:EBF1  9ace170eeb           lcall 0xeb0e, 0x17ce  ; operator_delete@s1:17CE
loc_EBF6:
2:EBF6  8b4606               mov ax, word ptr [bp + 6]
2:EBF9  8b5608               mov dx, word ptr [bp + 8]
2:EBFC  c9                   leave
2:EBFD  ca0600               retf 6
2:EC00  db da eb 51 eb f2 1d 0a ec ce 1d 0e ec d4 1d e5 eb

; ---------------- sub_s2:EC10 FAR size=44 callers=1
2:EC10  55                   push bp
2:EC11  8bec                 mov bp, sp
2:EC13  66ff7608             push dword ptr [bp + 8]
2:EC17  ff7606               push word ptr [bp + 6]
2:EC1A  9a481d06ec           lcall 0xec06, 0x1d48  ; sub_s3:1D48
2:EC1F  c45e06               les bx, ptr [bp + 6]
2:EC22  26c7470a0000         mov word ptr es:[bx + 0xa], 0
2:EC28  26c70762ec           mov word ptr es:[bx], 0xec62
2:EC2D  26c7470202ec         mov word ptr es:[bx + 2], 0xec02  ; SEGMENT s2:0000
2:EC33  8bc3                 mov ax, bx
2:EC35  8cc2                 mov dx, es
2:EC37  c9                   leave
2:EC38  ca0600               retf 6
2:EC3B  db 00

; ---------------- sub_s2:EC3C FAR size=54 callers=0
2:EC3C  c8040000             enter 4, 0
2:EC40  66ff7606             push dword ptr [bp + 6]
2:EC44  9a801d1dec           lcall 0xec1d, 0x1d80  ; sub_s3:1D80
2:EC49  f6460a01             test byte ptr [bp + 0xa], 1
2:EC4D  7409                 je 0xec58
2:EC4F  66ff7606             push dword ptr [bp + 6]
2:EC53  9ace17f4eb           lcall 0xebf4, 0x17ce  ; operator_delete@s1:17CE
loc_EC58:
2:EC58  8b4606               mov ax, word ptr [bp + 6]
2:EC5B  8b5608               mov dx, word ptr [bp + 8]
2:EC5E  c9                   leave
2:EC5F  ca0600               retf 6
2:EC62  db 3c ec 31 ec f2 1d 6c ec ce 1d 70 ec d4 1d 47 ec

; ---------------- sub_s2:EC72 FAR size=34 callers=2
2:EC72  55                   push bp
2:EC73  8bec                 mov bp, sp
2:EC75  66ff7606             push dword ptr [bp + 6]
2:EC79  9a3a3868ec           lcall 0xec68, 0x383a  ; sub_s3:383A
2:EC7E  c45e06               les bx, ptr [bp + 6]
2:EC81  26c707c4ef           mov word ptr es:[bx], 0xefc4
2:EC86  26c7470264ec         mov word ptr es:[bx + 2], 0xec64  ; SEGMENT s2:0000
2:EC8C  8bc3                 mov ax, bx
2:EC8E  8cc2                 mov dx, es
2:EC90  c9                   leave
2:EC91  ca0400               retf 4

; ---------------- sub_s2:EC94 FAR size=30 callers=2
2:EC94  55                   push bp
2:EC95  8bec                 mov bp, sp
2:EC97  c45e06               les bx, ptr [bp + 6]
2:EC9A  26c707c4ef           mov word ptr es:[bx], 0xefc4
2:EC9F  26c747028aec         mov word ptr es:[bx + 2], 0xec8a  ; SEGMENT s2:0000
2:ECA5  66ff7606             push dword ptr [bp + 6]
2:ECA9  9a80387cec           lcall 0xec7c, 0x3880  ; sub_s3:3880
2:ECAE  c9                   leave
2:ECAF  ca0400               retf 4

; ---------------- sub_s2:ECB2 FAR size=78 callers=1
2:ECB2  55                   push bp
2:ECB3  8bec                 mov bp, sp
2:ECB5  66ff7608             push dword ptr [bp + 8]
2:ECB9  ff7606               push word ptr [bp + 6]
2:ECBC  9ad22cacec           lcall 0xecac, 0x2cd2  ; sub_s3:2CD2
2:ECC1  c45e06               les bx, ptr [bp + 6]
2:ECC4  26c7079cef           mov word ptr es:[bx], 0xef9c
2:ECC9  26c74702a3ec         mov word ptr es:[bx + 2], 0xeca3  ; SEGMENT s2:0000
2:ECCF  680c02               push 0x20c
2:ECD2  9a9c17f3ec           lcall 0xecf3, 0x179c  ; operator_new@s1:179C
2:ECD7  83c402               add sp, 2
2:ECDA  c45e06               les bx, ptr [bp + 6]
2:ECDD  2689475c             mov word ptr es:[bx + 0x5c], ax
2:ECE1  2689575e             mov word ptr es:[bx + 0x5e], dx
2:ECE5  666800000c02         push 0x20c0000
2:ECEB  52                   push dx
2:ECEC  26ff775c             push word ptr es:[bx + 0x5c]
2:ECF0  9a064956ec           lcall 0xec56, 0x4906  ; sub_s1:4906
2:ECF5  8b4606               mov ax, word ptr [bp + 6]
2:ECF8  8b5608               mov dx, word ptr [bp + 8]
2:ECFB  c9                   leave
2:ECFC  ca0600               retf 6
2:ECFF  db 00

; ---------------- sub_s2:ED00 FAR size=30 callers=1
2:ED00  55                   push bp
2:ED01  8bec                 mov bp, sp
2:ED03  c45e06               les bx, ptr [bp + 6]
2:ED06  26c7079cef           mov word ptr es:[bx], 0xef9c
2:ED0B  26c74702cdec         mov word ptr es:[bx + 2], 0xeccd  ; SEGMENT s2:0000
2:ED11  66ff7606             push dword ptr [bp + 6]
2:ED15  9ab22dbfec           lcall 0xecbf, 0x2db2  ; sub_s3:2DB2
2:ED1A  c9                   leave
2:ED1B  ca0400               retf 4

; ---------------- sub_s2:ED1E size=68 callers=0
2:ED1E  c8040000             enter 4, 0
2:ED22  837e0a00             cmp word ptr [bp + 0xa], 0
2:ED26  7526                 jne 0xed4e
2:ED28  6a1a                 push 0x1a
2:ED2A  9a9c1758ed           lcall 0xed58, 0x179c  ; operator_new@s1:179C
2:ED2F  83c402               add sp, 2
2:ED32  8956fe               mov word ptr [bp - 2], dx
2:ED35  0bd0                 or dx, ax
2:ED37  740d                 je 0xed46
2:ED39  ff76fe               push word ptr [bp - 2]
2:ED3C  50                   push ax
2:ED3D  90                   nop
2:ED3E  0e                   push cs
2:ED3F  e830ff               call 0xec72  ; sub_s2:EC72
2:ED42  c9                   leave
2:ED43  ca0600               retf 6
loc_ED46:
2:ED46  33c0                 xor ax, ax
2:ED48  99                   cdq
2:ED49  c9                   leave
2:ED4A  ca0600               retf 6
2:ED4D  db 90
loc_ED4E:
2:ED4E  8b460a               mov ax, word ptr [bp + 0xa]
2:ED51  c1e002               shl ax, 2
2:ED54  50                   push ax
2:ED55  9a9c17d5ec           lcall 0xecd5, 0x179c  ; operator_new@s1:179C
2:ED5A  83c402               add sp, 2
2:ED5D  c9                   leave
2:ED5E  ca0600               retf 6
2:ED61  db 00

; ---------------- sub_s2:ED62 FAR size=40 callers=0
2:ED62  c8080000             enter 8, 0
2:ED66  56                   push si
2:ED67  8b460a               mov ax, word ptr [bp + 0xa]
2:ED6A  c1e003               shl ax, 3
2:ED6D  8bf0                 mov si, ax
2:ED6F  055e0d               add ax, 0xd5e
2:ED72  c45e06               les bx, ptr [bp + 6]
2:ED75  26894716             mov word ptr es:[bx + 0x16], ax
2:ED79  268c5f18             mov word ptr es:[bx + 0x18], ds
2:ED7D  8b84640d             mov ax, word ptr [si + 0xd64]
2:ED81  26894712             mov word ptr es:[bx + 0x12], ax
2:ED85  5e                   pop si
2:ED86  c9                   leave
2:ED87  ca0600               retf 6

; ---------------- sub_s2:ED8A size=138 callers=0
2:ED8A  c80a0000             enter 0xa, 0
2:ED8E  56                   push si
2:ED8F  837e0e00             cmp word ptr [bp + 0xe], 0
2:ED93  7e7a                 jle 0xee0f
2:ED95  66833ef60d00         cmp dword ptr [0xdf6], 0
2:ED9B  751e                 jne 0xedbb
2:ED9D  c45e06               les bx, ptr [bp + 6]
2:EDA0  06                   push es
2:EDA1  53                   push bx
2:EDA2  26c41f               les bx, ptr es:[bx]
2:EDA5  26ff5f18             lcall es:[bx + 0x18]
2:EDA9  50                   push ax
2:EDAA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:EDAF  9aba20ceed           lcall 0xedce, 0x20ba  ; sub_s3:20BA
2:EDB4  a3f60d               mov word ptr [0xdf6], ax
2:EDB7  8916f80d             mov word ptr [0xdf8], dx
loc_EDBB:
2:EDBB  c45e06               les bx, ptr [bp + 6]
2:EDBE  26c45f0c             les bx, ptr es:[bx + 0xc]
2:EDC2  26ff7712             push word ptr es:[bx + 0x12]
2:EDC6  66ff36f60d           push dword ptr [0xdf6]
2:EDCB  9a022e0dee           lcall 0xee0d, 0x2e02  ; sub_s3:2E02
2:EDD0  8b5e0a               mov bx, word ptr [bp + 0xa]
2:EDD3  8b760c               mov si, word ptr [bp + 0xc]
2:EDD6  83c301               add bx, 1
2:EDD9  83d600               adc si, 0
2:EDDC  8a4e0e               mov cl, byte ptr [bp + 0xe]
2:EDDF  fec9                 dec cl
2:EDE1  c0e102               shl cl, 2
2:EDE4  0ac9                 or cl, cl
2:EDE6  7408                 je 0xedf0
loc_EDE8:
2:EDE8  03db                 add bx, bx
2:EDEA  13f6                 adc si, si
2:EDEC  fec9                 dec cl
2:EDEE  75f8                 jne 0xede8
loc_EDF0:
2:EDF0  0bd8                 or bx, ax
2:EDF2  0bf2                 or si, dx
2:EDF4  895efc               mov word ptr [bp - 4], bx
2:EDF7  8b5e10               mov bx, word ptr [bp + 0x10]
2:EDFA  c1e303               shl bx, 3
2:EDFD  ffb7640d             push word ptr [bx + 0xd64]
2:EE01  56                   push si
2:EE02  ff76fc               push word ptr [bp - 4]
2:EE05  66ff36f60d           push dword ptr [0xdf6]
2:EE0A  9a302e18ed           lcall 0xed18, 0x2e30  ; sub_s3:2E30
loc_EE0F:
2:EE0F  5e                   pop si
2:EE10  c9                   leave
2:EE11  ca0c00               retf 0xc

; ---------------- sub_s2:EE14 size=66 callers=0
2:EE14  c81a0000             enter 0x1a, 0
2:EE18  c45e06               les bx, ptr [bp + 6]
2:EE1B  6626837f5600         cmp dword ptr es:[bx + 0x56], 0
2:EE21  752f                 jne 0xee52
2:EE23  8d46e6               lea ax, [bp - 0x1a]
2:EE26  16                   push ss
2:EE27  50                   push ax
2:EE28  90                   nop
2:EE29  0e                   push cs
2:EE2A  e845fe               call 0xec72  ; sub_s2:EC72
2:EE2D  666a00               push 0
2:EE30  666a00               push 0
2:EE33  8d46e6               lea ax, [bp - 0x1a]
2:EE36  16                   push ss
2:EE37  50                   push ax
2:EE38  9a8e39b2ed           lcall 0xedb2, 0x398e  ; sub_s3:398E
2:EE3D  c45e06               les bx, ptr [bp + 6]
2:EE40  26894756             mov word ptr es:[bx + 0x56], ax
2:EE44  26895758             mov word ptr es:[bx + 0x58], dx
2:EE48  8d46e6               lea ax, [bp - 0x1a]
2:EE4B  16                   push ss
2:EE4C  50                   push ax
2:EE4D  90                   nop
2:EE4E  0e                   push cs
2:EE4F  e842fe               call 0xec94  ; sub_s2:EC94
loc_EE52:
2:EE52  c9                   leave
2:EE53  ca0400               retf 4

; ---------------- sub_s2:EE56 FAR size=28 callers=0
2:EE56  55                   push bp
2:EE57  8bec                 mov bp, sp
2:EE59  c45e06               les bx, ptr [bp + 6]
2:EE5C  26c45f16             les bx, ptr es:[bx + 0x16]
2:EE60  26ff37               push word ptr es:[bx]
2:EE63  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
2:EE68  9a7e843bee           lcall 0xee3b, 0x847e  ; LoadStringRes@s3:847E
2:EE6D  c9                   leave
2:EE6E  ca0400               retf 4
2:EE71  db 00

; ---------------- sub_s2:EE72 FAR size=52 callers=0
2:EE72  c8040000             enter 4, 0
2:EE76  c45e06               les bx, ptr [bp + 6]
2:EE79  6626837f5600         cmp dword ptr es:[bx + 0x56], 0
2:EE7F  7509                 jne 0xee8a
2:EE81  06                   push es
2:EE82  53                   push bx
2:EE83  26c41f               les bx, ptr es:[bx]
2:EE86  26ff5f10             lcall es:[bx + 0x10]
loc_EE8A:
2:EE8A  66ff7608             push dword ptr [bp + 8]
2:EE8E  ff7606               push word ptr [bp + 6]
2:EE91  9a022e9fee           lcall 0xee9f, 0x2e02  ; sub_s3:2E02
2:EE96  52                   push dx
2:EE97  50                   push ax
2:EE98  66ff7606             push dword ptr [bp + 6]
2:EE9C  9a5c2e6bee           lcall 0xee6b, 0x2e5c  ; sub_s3:2E5C
2:EEA1  c9                   leave
2:EEA2  ca0800               retf 8
2:EEA5  db 00

; ---------------- sub_s2:EEA6 FAR size=6 callers=0
2:EEA6  33c0                 xor ax, ax
2:EEA8  ca0800               retf 8
2:EEAB  db 00

; ---------------- sub_s2:EEAC FAR size=140 callers=0
2:EEAC  c80e0000             enter 0xe, 0
2:EEB0  c746fe0000           mov word ptr [bp - 2], 0
2:EEB5  c45e0a               les bx, ptr [bp + 0xa]
2:EEB8  268b4712             mov ax, word ptr es:[bx + 0x12]
2:EEBC  8946fc               mov word ptr [bp - 4], ax
2:EEBF  6a03                 push 3
2:EEC1  66ff36d00e           push dword ptr [0xed0]  ; g_registry
2:EEC6  9aba20ffee           lcall 0xeeff, 0x20ba  ; sub_s3:20BA
2:EECB  8946f8               mov word ptr [bp - 8], ax
2:EECE  8956fa               mov word ptr [bp - 6], dx
2:EED1  8b46fc               mov ax, word ptr [bp - 4]
2:EED4  3d7d00               cmp ax, 0x7d
2:EED7  741d                 je 0xeef6
2:EED9  7741                 ja 0xef1c
2:EEDB  2c73                 sub al, 0x73
2:EEDD  740b                 je 0xeeea
2:EEDF  2c04                 sub al, 4
2:EEE1  740f                 je 0xeef2
2:EEE3  2c02                 sub al, 2
2:EEE5  7407                 je 0xeeee
2:EEE7  eb33                 jmp 0xef1c
2:EEE9  db 90
loc_EEEA:
2:EEEA  6a09                 push 9
2:EEEC  eb31                 jmp 0xef1f
loc_EEEE:
2:EEEE  6a5b                 push 0x5b
2:EEF0  eb2d                 jmp 0xef1f
loc_EEF2:
2:EEF2  6a2e                 push 0x2e
2:EEF4  eb29                 jmp 0xef1f
loc_EEF6:
2:EEF6  6a7c                 push 0x7c
2:EEF8  52                   push dx
2:EEF9  ff76f8               push word ptr [bp - 8]
2:EEFC  9acaa50eef           lcall 0xef0e, 0xa5ca  ; sub_s3:A5CA
2:EF01  0bc0                 or ax, ax
2:EF03  752c                 jne 0xef31
2:EF05  6a7d                 push 0x7d
2:EF07  66ff76f8             push dword ptr [bp - 8]
2:EF0B  9acaa526ef           lcall 0xef26, 0xa5ca  ; sub_s3:A5CA
2:EF10  0bc0                 or ax, ax
2:EF12  751d                 jne 0xef31
2:EF14  6a78                 push 0x78
2:EF16  ff76fa               push word ptr [bp - 6]
2:EF19  eb05                 jmp 0xef20
2:EF1B  db 90
loc_EF1C:
2:EF1C  ff76fc               push word ptr [bp - 4]
loc_EF1F:
2:EF1F  52                   push dx
loc_EF20:
2:EF20  ff76f8               push word ptr [bp - 8]
2:EF23  9acaa594ee           lcall 0xee94, 0xa5ca  ; sub_s3:A5CA
2:EF28  0bc0                 or ax, ax
2:EF2A  7505                 jne 0xef31
2:EF2C  c746fe0100           mov word ptr [bp - 2], 1
loc_EF31:
2:EF31  8b46fe               mov ax, word ptr [bp - 2]
2:EF34  c9                   leave
2:EF35  ca0800               retf 8

; ---------------- sub_s2:EF38 FAR size=18 callers=0
2:EF38  55                   push bp
2:EF39  8bec                 mov bp, sp
2:EF3B  c45e06               les bx, ptr [bp + 6]
2:EF3E  26c45f16             les bx, ptr es:[bx + 0x16]
2:EF42  268b4702             mov ax, word ptr es:[bx + 2]
2:EF46  c9                   leave
2:EF47  ca0400               retf 4

; ---------------- sub_s2:EF4A FAR size=6 callers=0
2:EF4A  b84100               mov ax, 0x41
2:EF4D  ca0400               retf 4

; ---------------- sub_s2:EF50 FAR size=38 callers=0
2:EF50  55                   push bp
2:EF51  8bec                 mov bp, sp
2:EF53  66ff7606             push dword ptr [bp + 6]
2:EF57  90                   nop
2:EF58  0e                   push cs
2:EF59  e838fd               call 0xec94  ; sub_s2:EC94
2:EF5C  f6460a01             test byte ptr [bp + 0xa], 1
2:EF60  7409                 je 0xef6b
2:EF62  66ff7606             push dword ptr [bp + 6]
2:EF66  9ace172ded           lcall 0xed2d, 0x17ce  ; operator_delete@s1:17CE
loc_EF6B:
2:EF6B  8b4606               mov ax, word ptr [bp + 6]
2:EF6E  8b5608               mov dx, word ptr [bp + 8]
2:EF71  c9                   leave
2:EF72  ca0600               retf 6
2:EF75  db 00

; ---------------- sub_s2:EF76 FAR size=106 callers=0
2:EF76  55                   push bp
2:EF77  8bec                 mov bp, sp
2:EF79  66ff7606             push dword ptr [bp + 6]
2:EF7D  90                   nop
2:EF7E  0e                   push cs
2:EF7F  e87efd               call 0xed00  ; sub_s2:ED00
2:EF82  f6460a01             test byte ptr [bp + 0xa], 1
2:EF86  7409                 je 0xef91
2:EF88  66ff7606             push dword ptr [bp + 6]
2:EF8C  9ace1769ef           lcall 0xef69, 0x17ce  ; operator_delete@s1:17CE
loc_EF91:
2:EF91  8b4606               mov ax, word ptr [bp + 6]
2:EF94  8b5608               mov dx, word ptr [bp + 8]
2:EF97  c9                   leave
2:EF98  ca0600               retf 6
2:EF9B  db 90 76 ef ae ef f2 1d a6 ef ce 1d aa ef d4 1d b6
2:EFAB  db ef 14 ee b2 ef 72 ee be ef 5a 30 ba ef 80 36 c9
2:EFBB  db ee a6 ee c2 ef ac ee 0f ed 50 ef ca ef 38 ef ce
2:EFCB  db ef 1e ed d2 ef 62 ed d6 ef 8a ed da ef 56 ee de
2:EFDB  db ef 4a ef 9e ef
