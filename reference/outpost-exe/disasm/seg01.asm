; OUTPOST.EXE segment 1 (CODE), 21943 bytes
1:0000  db 57 56 8c d9 8e c1 8b fb 8b f0 8b ca d1 e9 fc f3
1:0010  db a5 5e 5f c3 90 00

; ---------------- SH_MemPoolSize?@s1:0016 FAR size=60 callers=1
;   SmartHeap: checks pool signature 0xBEAD, walks the pool (error 10 on a bad pool)
1:0016  c8040000             enter 4, 0
1:001A  c45e06               les bx, ptr [bp + 6]
1:001D  26817f14adbe         cmp word ptr es:[bx + 0x14], 0xbead
1:0023  7413                 je 0x38
1:0025  6a00                 push 0
1:0027  6a00                 push 0
1:0029  6a0a                 push 0xa
1:002B  90                   nop
1:002C  0e                   push cs
1:002D  e8311e               call 0x1e61  ; SH_error@s1:1E61
1:0030  b8ffff               mov ax, 0xffff
1:0033  99                   cdq
1:0034  c9                   leave
1:0035  ca0400               retf 4
loc_0038:
1:0038  1e                   push ds
1:0039  8e5e08               mov ds, word ptr [bp + 8]
1:003C  33db                 xor bx, bx
1:003E  e81100               call 0x52  ; SH_poolWalk@s1:0052
1:0041  8946fc               mov word ptr [bp - 4], ax
1:0044  8956fe               mov word ptr [bp - 2], dx
1:0047  1f                   pop ds
1:0048  8b46fc               mov ax, word ptr [bp - 4]
1:004B  8b56fe               mov dx, word ptr [bp - 2]
1:004E  c9                   leave
1:004F  ca0400               retf 4

; ---------------- SH_poolWalk@s1:0052 size=186 callers=2
;   SmartHeap internal: walks a pool's pages
1:0052  c8120000             enter 0x12, 0
1:0056  53                   push bx
1:0057  56                   push si
1:0058  8b471e               mov ax, word ptr [bx + 0x1e]
1:005B  8b5720               mov dx, word ptr [bx + 0x20]
1:005E  8946fc               mov word ptr [bp - 4], ax
1:0061  8956fe               mov word ptr [bp - 2], dx
1:0064  c746fa0000           mov word ptr [bp - 6], 0
loc_0069:
1:0069  8b5efa               mov bx, word ptr [bp - 6]
1:006C  03db                 add bx, bx
1:006E  8b76ec               mov si, word ptr [bp - 0x14]
1:0071  8b00                 mov ax, word ptr [bx + si]
1:0073  8946f8               mov word ptr [bp - 8], ax
1:0076  0bc0                 or ax, ax
1:0078  7461                 je 0xdb
1:007A  837efa03             cmp word ptr [bp - 6], 3
1:007E  745b                 je 0xdb
1:0080  c746f40000           mov word ptr [bp - 0xc], 0
loc_0085:
1:0085  8b5ef8               mov bx, word ptr [bp - 8]
1:0088  8b4704               mov ax, word ptr [bx + 4]
1:008B  8946f6               mov word ptr [bp - 0xa], ax
1:008E  c45f08               les bx, ptr [bx + 8]
1:0091  26837f0a00           cmp word ptr es:[bx + 0xa], 0
1:0096  752c                 jne 0xc4
1:0098  895ef0               mov word ptr [bp - 0x10], bx
1:009B  8c46f2               mov word ptr [bp - 0xe], es
1:009E  1e                   push ds
1:009F  8e5ef2               mov ds, word ptr [bp - 0xe]
1:00A2  33db                 xor bx, bx
1:00A4  b80100               mov ax, 1
1:00A7  e86604               call 0x510  ; SH_pageRelease@s1:0510
1:00AA  8946ee               mov word ptr [bp - 0x12], ax
1:00AD  1f                   pop ds
1:00AE  837eee00             cmp word ptr [bp - 0x12], 0
1:00B2  7445                 je 0xf9
1:00B4  8b46f8               mov ax, word ptr [bp - 8]
1:00B7  3946f6               cmp word ptr [bp - 0xa], ax
1:00BA  7514                 jne 0xd0
1:00BC  c746f60000           mov word ptr [bp - 0xa], 0
1:00C1  eb0d                 jmp 0xd0
1:00C3  db 90
loc_00C4:
1:00C4  837ef400             cmp word ptr [bp - 0xc], 0
1:00C8  7506                 jne 0xd0
1:00CA  8b46f8               mov ax, word ptr [bp - 8]
1:00CD  8946f4               mov word ptr [bp - 0xc], ax
loc_00D0:
1:00D0  8b46f6               mov ax, word ptr [bp - 0xa]
1:00D3  8946f8               mov word ptr [bp - 8], ax
1:00D6  3b46f4               cmp ax, word ptr [bp - 0xc]
1:00D9  75aa                 jne 0x85
loc_00DB:
1:00DB  ff46fa               inc word ptr [bp - 6]
1:00DE  837efa05             cmp word ptr [bp - 6], 5
1:00E2  7285                 jb 0x69
1:00E4  8b5eec               mov bx, word ptr [bp - 0x14]
1:00E7  837f3200             cmp word ptr [bx + 0x32], 0
1:00EB  740c                 je 0xf9
1:00ED  8b4732               mov ax, word ptr [bx + 0x32]
1:00F0  8946ee               mov word ptr [bp - 0x12], ax
1:00F3  b8ffff               mov ax, 0xffff
1:00F6  ff56ee               call word ptr [bp - 0x12]
loc_00F9:
1:00F9  8b46fc               mov ax, word ptr [bp - 4]
1:00FC  8b5eec               mov bx, word ptr [bp - 0x14]
1:00FF  8b56fe               mov dx, word ptr [bp - 2]
1:0102  2b471e               sub ax, word ptr [bx + 0x1e]
1:0105  1b5720               sbb dx, word ptr [bx + 0x20]
1:0108  5e                   pop si
1:0109  c9                   leave
1:010A  c3                   ret
1:010B  db 00

; ---------------- SH_MemPoolFreeAll?@s1:010C FAR size=164 callers=1
;   SmartHeap: frees a pool's pages (called from MemPoolInit)
1:010C  c8060000             enter 6, 0
1:0110  2bc0                 sub ax, ax
1:0112  8946fc               mov word ptr [bp - 4], ax
1:0115  8946fa               mov word ptr [bp - 6], ax
1:0118  c45e0c               les bx, ptr [bp + 0xc]
1:011B  26817f14adbe         cmp word ptr es:[bx + 0x14], 0xbead
1:0121  7411                 je 0x134
1:0123  50                   push ax
1:0124  50                   push ax
1:0125  6a0a                 push 0xa
loc_0127:
1:0127  90                   nop
1:0128  0e                   push cs
1:0129  e8351d               call 0x1e61  ; SH_error@s1:1E61
loc_012C:
1:012C  b8ffff               mov ax, 0xffff
1:012F  99                   cdq
1:0130  c9                   leave
1:0131  ca0a00               retf 0xa
loc_0134:
1:0134  c706305f0100         mov word ptr [0x5f30], 1
1:013A  8b4606               mov ax, word ptr [bp + 6]
1:013D  48                   dec ax
1:013E  740a                 je 0x14a
1:0140  48                   dec ax
1:0141  7421                 je 0x164
1:0143  48                   dec ax
1:0144  48                   dec ax
1:0145  7415                 je 0x15c
1:0147  ebe3                 jmp 0x12c
1:0149  db 90
loc_014A:
1:014A  c746fe0100           mov word ptr [bp - 2], 1
1:014F  26837f1800           cmp word ptr es:[bx + 0x18], 0
1:0154  7513                 jne 0x169
1:0156  06                   push es
1:0157  53                   push bx
1:0158  6a04                 push 4
1:015A  ebcb                 jmp 0x127
loc_015C:
1:015C  c746fe0000           mov word ptr [bp - 2], 0
1:0161  eb06                 jmp 0x169
1:0163  db 90
loc_0164:
1:0164  c746fe0200           mov word ptr [bp - 2], 2
loc_0169:
1:0169  1e                   push ds
1:016A  8e5e0e               mov ds, word ptr [bp + 0xe]
loc_016D:
1:016D  8b4608               mov ax, word ptr [bp + 8]
1:0170  8b560a               mov dx, word ptr [bp + 0xa]
1:0173  3956fc               cmp word ptr [bp - 4], dx
1:0176  772c                 ja 0x1a4
1:0178  7205                 jb 0x17f
1:017A  3946fa               cmp word ptr [bp - 6], ax
1:017D  7325                 jae 0x1a4
loc_017F:
1:017F  6a00                 push 0
1:0181  ff361a00             push word ptr [0x1a]
1:0185  33db                 xor bx, bx
1:0187  8b46fe               mov ax, word ptr [bp - 2]
1:018A  33d2                 xor dx, dx
1:018C  e83702               call 0x3c6  ; SH_blockAlloc@s1:03C6
1:018F  0bd0                 or dx, ax
1:0191  7411                 je 0x1a4
1:0193  bb1a00               mov bx, 0x1a
1:0196  2bd2                 sub dx, dx
1:0198  8b061a00             mov ax, word ptr [0x1a]
1:019C  0146fa               add word ptr [bp - 6], ax
1:019F  1156fc               adc word ptr [bp - 4], dx
1:01A2  ebc9                 jmp 0x16d
loc_01A4:
1:01A4  1f                   pop ds
1:01A5  8b46fa               mov ax, word ptr [bp - 6]
1:01A8  8b56fc               mov dx, word ptr [bp - 4]
1:01AB  c9                   leave
1:01AC  ca0a00               retf 0xa
1:01AF  db 00

; ---------------- SH_pageAlloc@s1:01B0 size=344 callers=1
;   SmartHeap internal: allocates a new page for a pool (GlobalAlloc/realloc)
1:01B0  c80c0000             enter 0xc, 0
1:01B4  53                   push bx
1:01B5  57                   push di
1:01B6  56                   push si
1:01B7  8bfb                 mov di, bx
1:01B9  c746f40000           mov word ptr [bp - 0xc], 0
1:01BE  8b4540               mov ax, word ptr [di + 0x40]
1:01C1  0b453e               or ax, word ptr [di + 0x3e]
1:01C4  7503                 jne 0x1c9
1:01C6  e9cb00               jmp 0x294
loc_01C9:
1:01C9  1e                   push ds
1:01CA  53                   push bx
1:01CB  90                   nop
1:01CC  0e                   push cs
1:01CD  e86213               call 0x1532  ; SH_globalSize@s1:1532
1:01D0  8946fc               mov word ptr [bp - 4], ax
1:01D3  8956fe               mov word ptr [bp - 2], dx
1:01D6  0bd2                 or dx, dx
1:01D8  7403                 je 0x1dd
1:01DA  e9a700               jmp 0x284
loc_01DD:
1:01DD  3df0ff               cmp ax, 0xfff0
1:01E0  7203                 jb 0x1e5
1:01E2  e99f00               jmp 0x284
loc_01E5:
1:01E5  3d0020               cmp ax, 0x2000
1:01E8  7206                 jb 0x1f0
1:01EA  be0020               mov si, 0x2000
1:01ED  eb03                 jmp 0x1f2
1:01EF  db 90
loc_01F0:
1:01F0  8bf0                 mov si, ax
loc_01F2:
1:01F2  1e                   push ds
1:01F3  57                   push di
1:01F4  8bc6                 mov ax, si
1:01F6  2bd2                 sub dx, dx
1:01F8  0346fc               add ax, word ptr [bp - 4]
1:01FB  1356fe               adc dx, word ptr [bp - 2]
1:01FE  0bd2                 or dx, dx
1:0200  7505                 jne 0x207
1:0202  3df0ff               cmp ax, 0xfff0
1:0205  7605                 jbe 0x20c
loc_0207:
1:0207  33d2                 xor dx, dx
1:0209  b8f0ff               mov ax, 0xfff0
loc_020C:
1:020C  8946f6               mov word ptr [bp - 0xa], ax
1:020F  8956f8               mov word ptr [bp - 8], dx
1:0212  52                   push dx
1:0213  50                   push ax
1:0214  8b4516               mov ax, word ptr [di + 0x16]
1:0217  80cc10               or ah, 0x10
1:021A  50                   push ax
1:021B  90                   nop
1:021C  0e                   push cs
1:021D  e8d212               call 0x14f2  ; SH_globalReAllocChecked@s1:14F2
1:0220  0bc0                 or ax, ax
1:0222  7532                 jne 0x256
1:0224  d1ee                 shr si, 1
1:0226  83fe0c               cmp si, 0xc
1:0229  73c7                 jae 0x1f2
1:022B  03f6                 add si, si
1:022D  1e                   push ds
1:022E  57                   push di
1:022F  6a02                 push 2
1:0231  90                   nop
1:0232  0e                   push cs
1:0233  e82b1c               call 0x1e61  ; SH_error@s1:1E61
1:0236  0bc0                 or ax, ax
1:0238  7410                 je 0x24a
1:023A  1e                   push ds
1:023B  57                   push di
1:023C  90                   nop
1:023D  0e                   push cs
1:023E  e8f112               call 0x1532  ; SH_globalSize@s1:1532
1:0241  8946fc               mov word ptr [bp - 4], ax
1:0244  8956fe               mov word ptr [bp - 2], dx
1:0247  eba9                 jmp 0x1f2
1:0249  db 90
loc_024A:
1:024A  837d0a01             cmp word ptr [di + 0xa], 1
1:024E  1bc0                 sbb ax, ax
1:0250  40                   inc ax
1:0251  5e                   pop si
1:0252  5f                   pop di
1:0253  c9                   leave
1:0254  c3                   ret
1:0255  db 90
loc_0256:
1:0256  6a00                 push 0
1:0258  6a0c                 push 0xc
1:025A  8b46fc               mov ax, word ptr [bp - 4]
1:025D  8b56fe               mov dx, word ptr [bp - 2]
1:0260  2d4200               sub ax, 0x42
1:0263  83da00               sbb dx, 0
1:0266  52                   push dx
1:0267  50                   push ax
1:0268  90                   nop
1:0269  0e                   push cs
1:026A  e82351               call 0x5390  ; __aFuldiv@s1:5390
1:026D  8bf0                 mov si, ax
1:026F  03f0                 add si, ax
1:0271  03f0                 add si, ax
1:0273  c1e602               shl si, 2
1:0276  03f7                 add si, di
1:0278  83c642               add si, 0x42
1:027B  8b46fc               mov ax, word ptr [bp - 4]
1:027E  8b56fe               mov dx, word ptr [bp - 2]
1:0281  eb21                 jmp 0x2a4
1:0283  db 90
loc_0284:
1:0284  1e                   push ds
1:0285  57                   push di
1:0286  6a08                 push 8
1:0288  90                   nop
1:0289  0e                   push cs
1:028A  e8d41b               call 0x1e61  ; SH_error@s1:1E61
1:028D  33c0                 xor ax, ax
1:028F  5e                   pop si
1:0290  5f                   pop di
1:0291  c9                   leave
1:0292  c3                   ret
1:0293  db 90
loc_0294:
1:0294  8d7536               lea si, [di + 0x36]
1:0297  1e                   push ds
1:0298  57                   push di
1:0299  90                   nop
1:029A  0e                   push cs
1:029B  e89412               call 0x1532  ; SH_globalSize@s1:1532
1:029E  8946f6               mov word ptr [bp - 0xa], ax
1:02A1  8956f8               mov word ptr [bp - 8], dx
loc_02A4:
1:02A4  29451e               sub word ptr [di + 0x1e], ax
1:02A7  195520               sbb word ptr [di + 0x20], dx
1:02AA  0bf6                 or si, si
1:02AC  742f                 je 0x2dd
1:02AE  6a00                 push 0
1:02B0  6a0c                 push 0xc
1:02B2  1e                   push ds
1:02B3  57                   push di
1:02B4  90                   nop
1:02B5  0e                   push cs
1:02B6  e87912               call 0x1532  ; SH_globalSize@s1:1532
1:02B9  8946f6               mov word ptr [bp - 0xa], ax
1:02BC  8956f8               mov word ptr [bp - 8], dx
1:02BF  2d4200               sub ax, 0x42
1:02C2  83da00               sbb dx, 0
1:02C5  52                   push dx
1:02C6  50                   push ax
1:02C7  90                   nop
1:02C8  0e                   push cs
1:02C9  e8c450               call 0x5390  ; __aFuldiv@s1:5390
1:02CC  8bc8                 mov cx, ax
1:02CE  03c0                 add ax, ax
1:02D0  03c1                 add ax, cx
1:02D2  c1e002               shl ax, 2
1:02D5  03c7                 add ax, di
1:02D7  053600               add ax, 0x36
1:02DA  8946f4               mov word ptr [bp - 0xc], ax
loc_02DD:
1:02DD  8b46f6               mov ax, word ptr [bp - 0xa]
1:02E0  8b56f8               mov dx, word ptr [bp - 8]
1:02E3  01451e               add word ptr [di + 0x1e], ax
1:02E6  115520               adc word ptr [di + 0x20], dx
1:02E9  8b4d0a               mov cx, word ptr [di + 0xa]
loc_02EC:
1:02EC  894c04               mov word ptr [si + 4], cx
1:02EF  8bce                 mov cx, si
1:02F1  8bde                 mov bx, si
1:02F3  83c60c               add si, 0xc
1:02F6  395ef4               cmp word ptr [bp - 0xc], bx
1:02F9  77f1                 ja 0x2ec
1:02FB  8b5ef2               mov bx, word ptr [bp - 0xe]
1:02FE  b80100               mov ax, 1
1:0301  894f0a               mov word ptr [bx + 0xa], cx
1:0304  5e                   pop si
1:0305  5f                   pop di
1:0306  c9                   leave
1:0307  c3                   ret

; ---------------- SH_pageGet@s1:0308 size=96 callers=1
;   SmartHeap internal: gets a free page, allocating one if needed
1:0308  c8060000             enter 6, 0
1:030C  50                   push ax
1:030D  57                   push di
1:030E  56                   push si
1:030F  8bf3                 mov si, bx
1:0311  837c0a00             cmp word ptr [si + 0xa], 0
1:0315  7507                 jne 0x31e
1:0317  e896fe               call 0x1b0  ; SH_pageAlloc@s1:01B0
1:031A  0bc0                 or ax, ax
1:031C  7446                 je 0x364
loc_031E:
1:031E  8b5c0a               mov bx, word ptr [si + 0xa]
1:0321  8b4704               mov ax, word ptr [bx + 4]
1:0324  89440a               mov word ptr [si + 0xa], ax
1:0327  8b4ef8               mov cx, word ptr [bp - 8]
1:032A  8bf9                 mov di, cx
1:032C  03f9                 add di, cx
1:032E  03fe                 add di, si
1:0330  897efa               mov word ptr [bp - 6], di
1:0333  833d00               cmp word ptr [di], 0
1:0336  7508                 jne 0x340
1:0338  895f06               mov word ptr [bx + 6], bx
1:033B  895f04               mov word ptr [bx + 4], bx
1:033E  eb1d                 jmp 0x35d
loc_0340:
1:0340  8b05                 mov ax, word ptr [di]
1:0342  8946fc               mov word ptr [bp - 4], ax
1:0345  894706               mov word ptr [bx + 6], ax
1:0348  8b7efc               mov di, word ptr [bp - 4]
1:034B  8b4504               mov ax, word ptr [di + 4]
1:034E  894704               mov word ptr [bx + 4], ax
1:0351  8b7d04               mov di, word ptr [di + 4]
1:0354  895d06               mov word ptr [di + 6], bx
1:0357  8b7efc               mov di, word ptr [bp - 4]
1:035A  895d04               mov word ptr [di + 4], bx
loc_035D:
1:035D  8b7efa               mov di, word ptr [bp - 6]
1:0360  8bc3                 mov ax, bx
1:0362  891d                 mov word ptr [di], bx
loc_0364:
1:0364  5e                   pop si
1:0365  5f                   pop di
1:0366  c9                   leave
1:0367  c3                   ret

; ---------------- SH_pageUnlink@s1:0368 size=94 callers=1
;   SmartHeap internal: unlinks a page from a pool list
1:0368  c8040000             enter 4, 0
1:036C  52                   push dx
1:036D  50                   push ax
1:036E  53                   push bx
1:036F  57                   push di
1:0370  56                   push si
1:0371  8bf0                 mov si, ax
1:0373  394404               cmp word ptr [si + 4], ax
1:0376  750a                 jne 0x382
1:0378  8bf2                 mov si, dx
1:037A  03f2                 add si, dx
1:037C  c7000000             mov word ptr [bx + si], 0
1:0380  eb34                 jmp 0x3b6
loc_0382:
1:0382  8bd8                 mov bx, ax
1:0384  8b7706               mov si, word ptr [bx + 6]
1:0387  8b4704               mov ax, word ptr [bx + 4]
1:038A  894404               mov word ptr [si + 4], ax
1:038D  8b7704               mov si, word ptr [bx + 4]
1:0390  8b4706               mov ax, word ptr [bx + 6]
1:0393  894406               mov word ptr [si + 6], ax
1:0396  8b5ef6               mov bx, word ptr [bp - 0xa]
1:0399  8b7efa               mov di, word ptr [bp - 6]
1:039C  8b46f8               mov ax, word ptr [bp - 8]
1:039F  8bf7                 mov si, di
1:03A1  03f7                 add si, di
1:03A3  03f3                 add si, bx
1:03A5  8976fc               mov word ptr [bp - 4], si
1:03A8  3904                 cmp word ptr [si], ax
1:03AA  750a                 jne 0x3b6
1:03AC  8bf0                 mov si, ax
1:03AE  8b4404               mov ax, word ptr [si + 4]
1:03B1  8b76fc               mov si, word ptr [bp - 4]
1:03B4  8904                 mov word ptr [si], ax
loc_03B6:
1:03B6  8b76f8               mov si, word ptr [bp - 8]
1:03B9  8b470a               mov ax, word ptr [bx + 0xa]
1:03BC  894404               mov word ptr [si + 4], ax
1:03BF  89770a               mov word ptr [bx + 0xa], si
1:03C2  5e                   pop si
1:03C3  5f                   pop di
1:03C4  c9                   leave
1:03C5  c3                   ret

; ---------------- SH_blockAlloc@s1:03C6 size=330 callers=4
;   SmartHeap internal: allocates a block from a page
1:03C6  c8120000             enter 0x12, 0
1:03CA  52                   push dx
1:03CB  50                   push ax
1:03CC  53                   push bx
1:03CD  895ef6               mov word ptr [bp - 0xa], bx
1:03D0  8c5ef8               mov word ptr [bp - 8], ds
1:03D3  8b4604               mov ax, word ptr [bp + 4]
1:03D6  8b5606               mov dx, word ptr [bp + 6]
1:03D9  05ff0f               add ax, 0xfff
1:03DC  83d200               adc dx, 0
1:03DF  2500f0               and ax, 0xf000
1:03E2  03471e               add ax, word ptr [bx + 0x1e]
1:03E5  135720               adc dx, word ptr [bx + 0x20]
1:03E8  3b5728               cmp dx, word ptr [bx + 0x28]
1:03EB  7217                 jb 0x404
1:03ED  7705                 ja 0x3f4
1:03EF  3b4726               cmp ax, word ptr [bx + 0x26]
1:03F2  7610                 jbe 0x404
loc_03F4:
1:03F4  1e                   push ds
1:03F5  53                   push bx
1:03F6  6a07                 push 7
1:03F8  90                   nop
1:03F9  0e                   push cs
1:03FA  e8641a               call 0x1e61  ; SH_error@s1:1E61
loc_03FD:
1:03FD  33c0                 xor ax, ax
1:03FF  99                   cdq
1:0400  c9                   leave
1:0401  c20400               ret 4
loc_0404:
1:0404  837eea03             cmp word ptr [bp - 0x16], 3
1:0408  7518                 jne 0x422
1:040A  8a46ec               mov al, byte ptr [bp - 0x14]
1:040D  250100               and ax, 1
1:0410  3d0100               cmp ax, 1
1:0413  f5                   cmc
1:0414  1bc0                 sbb ax, ax
1:0416  250001               and ax, 0x100
1:0419  80cc20               or ah, 0x20
1:041C  8946ee               mov word ptr [bp - 0x12], ax
1:041F  eb06                 jmp 0x427
1:0421  db 90
loc_0422:
1:0422  c746ee0010           mov word ptr [bp - 0x12], 0x1000
loc_0427:
1:0427  ff7606               push word ptr [bp + 6]
1:042A  ff7604               push word ptr [bp + 4]
1:042D  8b4716               mov ax, word ptr [bx + 0x16]
1:0430  0b46ee               or ax, word ptr [bp - 0x12]
1:0433  50                   push ax
1:0434  90                   nop
1:0435  0e                   push cs
1:0436  e8e30e               call 0x131c  ; SH_globalAllocPage@s1:131C
1:0439  8946f0               mov word ptr [bp - 0x10], ax
1:043C  8956f2               mov word ptr [bp - 0xe], dx
1:043F  0bd0                 or dx, ax
1:0441  74ba                 je 0x3fd
1:0443  8b5ee8               mov bx, word ptr [bp - 0x18]
1:0446  8b46ea               mov ax, word ptr [bp - 0x16]
1:0449  e8bcfe               call 0x308  ; SH_pageGet@s1:0308
1:044C  8946fe               mov word ptr [bp - 2], ax
1:044F  8946fa               mov word ptr [bp - 6], ax
1:0452  8c5efc               mov word ptr [bp - 4], ds
1:0455  0bc0                 or ax, ax
1:0457  750d                 jne 0x466
1:0459  ff76f2               push word ptr [bp - 0xe]
1:045C  ff76f0               push word ptr [bp - 0x10]
1:045F  90                   nop
1:0460  0e                   push cs
1:0461  e86a0f               call 0x13ce  ; SH_globalFree@s1:13CE
1:0464  eb97                 jmp 0x3fd
loc_0466:
1:0466  8b46f0               mov ax, word ptr [bp - 0x10]
1:0469  8b5efe               mov bx, word ptr [bp - 2]
1:046C  8b56f2               mov dx, word ptr [bp - 0xe]
1:046F  894708               mov word ptr [bx + 8], ax
1:0472  89570a               mov word ptr [bx + 0xa], dx
1:0475  1e                   push ds
1:0476  8e5ef2               mov ds, word ptr [bp - 0xe]
1:0479  8b46ea               mov ax, word ptr [bp - 0x16]
1:047C  0dd0ca               or ax, 0xcad0
1:047F  89060c00             mov word ptr [0xc], ax
1:0483  8b46f6               mov ax, word ptr [bp - 0xa]
1:0486  8b56f8               mov dx, word ptr [bp - 8]
1:0489  89060000             mov word ptr [0], ax
1:048D  89160200             mov word ptr [2], dx
1:0491  8b46fa               mov ax, word ptr [bp - 6]
1:0494  8b56fc               mov dx, word ptr [bp - 4]
1:0497  89060400             mov word ptr [4], ax
1:049B  89160600             mov word ptr [6], dx
1:049F  c7060a000000         mov word ptr [0xa], 0
1:04A5  ff76f2               push word ptr [bp - 0xe]
1:04A8  ff76f0               push word ptr [bp - 0x10]
1:04AB  90                   nop
1:04AC  0e                   push cs
1:04AD  e88210               call 0x1532  ; SH_globalSize@s1:1532
1:04B0  894604               mov word ptr [bp + 4], ax
1:04B3  895606               mov word ptr [bp + 6], dx
1:04B6  8b46ea               mov ax, word ptr [bp - 0x16]
1:04B9  48                   dec ax
1:04BA  740e                 je 0x4ca
1:04BC  48                   dec ax
1:04BD  48                   dec ax
1:04BE  741e                 je 0x4de
1:04C0  8b4604               mov ax, word ptr [bp + 4]
1:04C3  33db                 xor bx, bx
1:04C5  e80205               call 0x9ca  ; SH_freeListFix@s1:09CA
1:04C8  eb0e                 jmp 0x4d8
loc_04CA:
1:04CA  ff76f8               push word ptr [bp - 8]
1:04CD  ff76f6               push word ptr [bp - 0xa]
1:04D0  8b4604               mov ax, word ptr [bp + 4]
1:04D3  33db                 xor bx, bx
1:04D5  e8aa02               call 0x782  ; SH_pageInitVar@s1:0782
loc_04D8:
1:04D8  8946f4               mov word ptr [bp - 0xc], ax
1:04DB  eb0b                 jmp 0x4e8
1:04DD  db 90
loc_04DE:
1:04DE  33db                 xor bx, bx
1:04E0  8b46ec               mov ax, word ptr [bp - 0x14]
1:04E3  e8ce00               call 0x5b4  ; SH_pageInitFixed@s1:05B4
1:04E6  ebf0                 jmp 0x4d8
loc_04E8:
1:04E8  1f                   pop ds
1:04E9  8b5efe               mov bx, word ptr [bp - 2]
1:04EC  8b46f4               mov ax, word ptr [bp - 0xc]
1:04EF  8907                 mov word ptr [bx], ax
1:04F1  c747020080           mov word ptr [bx + 2], 0x8000
1:04F6  8b4604               mov ax, word ptr [bp + 4]
1:04F9  8b5ee8               mov bx, word ptr [bp - 0x18]
1:04FC  8b5606               mov dx, word ptr [bp + 6]
1:04FF  01471e               add word ptr [bx + 0x1e], ax
1:0502  115720               adc word ptr [bx + 0x20], dx
1:0505  8b46f0               mov ax, word ptr [bp - 0x10]
1:0508  8b56f2               mov dx, word ptr [bp - 0xe]
1:050B  c9                   leave
1:050C  c20400               ret 4
1:050F  db 00

; ---------------- SH_pageRelease@s1:0510 size=164 callers=2
;   SmartHeap internal: releases an empty page
1:0510  c8100000             enter 0x10, 0
1:0514  50                   push ax
1:0515  53                   push bx
1:0516  8b07                 mov ax, word ptr [bx]
1:0518  8b5702               mov dx, word ptr [bx + 2]
1:051B  8946fc               mov word ptr [bp - 4], ax
1:051E  8956fe               mov word ptr [bp - 2], dx
1:0521  8b4704               mov ax, word ptr [bx + 4]
1:0524  8b5706               mov dx, word ptr [bx + 6]
1:0527  8946f8               mov word ptr [bp - 8], ax
1:052A  8956fa               mov word ptr [bp - 6], dx
1:052D  8a470c               mov al, byte ptr [bx + 0xc]
1:0530  250700               and ax, 7
1:0533  8946f6               mov word ptr [bp - 0xa], ax
1:0536  1e                   push ds
1:0537  53                   push bx
1:0538  90                   nop
1:0539  0e                   push cs
1:053A  e8f50f               call 0x1532  ; SH_globalSize@s1:1532
1:053D  8946f2               mov word ptr [bp - 0xe], ax
1:0540  8956f4               mov word ptr [bp - 0xc], dx
1:0543  1e                   push ds
1:0544  8e5efe               mov ds, word ptr [bp - 2]
1:0547  837eee00             cmp word ptr [bp - 0x12], 0
1:054B  7427                 je 0x574
1:054D  c45efc               les bx, ptr [bp - 4]
1:0550  268b471e             mov ax, word ptr es:[bx + 0x1e]
1:0554  268b5720             mov dx, word ptr es:[bx + 0x20]
1:0558  2b46f2               sub ax, word ptr [bp - 0xe]
1:055B  1b56f4               sbb dx, word ptr [bp - 0xc]
1:055E  263b5724             cmp dx, word ptr es:[bx + 0x24]
1:0562  7710                 ja 0x574
1:0564  7206                 jb 0x56c
1:0566  263b4722             cmp ax, word ptr es:[bx + 0x22]
1:056A  7308                 jae 0x574
loc_056C:
1:056C  c746f00000           mov word ptr [bp - 0x10], 0
1:0571  eb22                 jmp 0x595
1:0573  db 90
loc_0574:
1:0574  8b46f8               mov ax, word ptr [bp - 8]
1:0577  33db                 xor bx, bx
1:0579  8b56f6               mov dx, word ptr [bp - 0xa]
1:057C  e8e9fd               call 0x368  ; SH_pageUnlink@s1:0368
1:057F  8b46f2               mov ax, word ptr [bp - 0xe]
1:0582  bb1e00               mov bx, 0x1e
1:0585  8b56f4               mov dx, word ptr [bp - 0xc]
1:0588  29061e00             sub word ptr [0x1e], ax
1:058C  19162000             sbb word ptr [0x20], dx
1:0590  c746f00100           mov word ptr [bp - 0x10], 1
loc_0595:
1:0595  1f                   pop ds
1:0596  837ef000             cmp word ptr [bp - 0x10], 0
1:059A  7414                 je 0x5b0
1:059C  8b5eec               mov bx, word ptr [bp - 0x14]
1:059F  c7470c0000           mov word ptr [bx + 0xc], 0
1:05A4  1e                   push ds
1:05A5  53                   push bx
1:05A6  90                   nop
1:05A7  0e                   push cs
1:05A8  e8230e               call 0x13ce  ; SH_globalFree@s1:13CE
1:05AB  b80100               mov ax, 1
1:05AE  c9                   leave
1:05AF  c3                   ret
loc_05B0:
1:05B0  33c0                 xor ax, ax
1:05B2  c9                   leave
1:05B3  c3                   ret

; ---------------- SH_pageInitFixed@s1:05B4 size=46 callers=1
;   SmartHeap internal: initialises a fixed-size page header
1:05B4  55                   push bp
1:05B5  8bec                 mov bp, sp
1:05B7  50                   push ax
1:05B8  56                   push si
1:05B9  8bf3                 mov si, bx
1:05BB  c7440a0100           mov word ptr [si + 0xa], 1
1:05C0  c744086806           mov word ptr [si + 8], 0x668
1:05C5  8a46fe               mov al, byte ptr [bp - 2]
1:05C8  250200               and ax, 2
1:05CB  3d0100               cmp ax, 1
1:05CE  f5                   cmc
1:05CF  1ac0                 sbb al, al
1:05D1  2402                 and al, 2
1:05D3  884413               mov byte ptr [si + 0x13], al
1:05D6  2bc0                 sub ax, ax
1:05D8  894410               mov word ptr [si + 0x10], ax
1:05DB  89440e               mov word ptr [si + 0xe], ax
1:05DE  5e                   pop si
1:05DF  c9                   leave
1:05E0  c3                   ret
1:05E1  db 00

; ---------------- SH_allocFixedInternal@s1:05E2 size=142 callers=2
;   SmartHeap internal: fixed-size block allocation
1:05E2  c8040000             enter 4, 0
1:05E6  57                   push di
1:05E7  56                   push si
1:05E8  8bf3                 mov si, bx
1:05EA  8bf8                 mov di, ax
1:05EC  83460414             add word ptr [bp + 4], 0x14
1:05F0  83560600             adc word ptr [bp + 6], 0
loc_05F4:
1:05F4  ff7606               push word ptr [bp + 6]
1:05F7  ff7604               push word ptr [bp + 4]
1:05FA  8bde                 mov bx, si
1:05FC  b80300               mov ax, 3
1:05FF  8bd7                 mov dx, di
1:0601  e8c2fd               call 0x3c6  ; SH_blockAlloc@s1:03C6
1:0604  8946fc               mov word ptr [bp - 4], ax
1:0607  8956fe               mov word ptr [bp - 2], dx
1:060A  0bd0                 or dx, ax
1:060C  7544                 jne 0x652
1:060E  8bde                 mov bx, si
1:0610  e83ffa               call 0x52  ; SH_poolWalk@s1:0052
1:0613  8946fc               mov word ptr [bp - 4], ax
1:0616  8956fe               mov word ptr [bp - 2], dx
1:0619  8b4604               mov ax, word ptr [bp + 4]
1:061C  8b5606               mov dx, word ptr [bp + 6]
1:061F  05ff0f               add ax, 0xfff
1:0622  83d200               adc dx, 0
1:0625  2500f0               and ax, 0xf000
1:0628  03441e               add ax, word ptr [si + 0x1e]
1:062B  135420               adc dx, word ptr [si + 0x20]
1:062E  3b5428               cmp dx, word ptr [si + 0x28]
1:0631  772b                 ja 0x65e
1:0633  7205                 jb 0x63a
1:0635  3b4426               cmp ax, word ptr [si + 0x26]
1:0638  7724                 ja 0x65e
loc_063A:
1:063A  8b46fe               mov ax, word ptr [bp - 2]
1:063D  0b46fc               or ax, word ptr [bp - 4]
1:0640  75b2                 jne 0x5f4
1:0642  1e                   push ds
1:0643  56                   push si
1:0644  6a02                 push 2
1:0646  90                   nop
1:0647  0e                   push cs
1:0648  e81618               call 0x1e61  ; SH_error@s1:1E61
1:064B  0bc0                 or ax, ax
1:064D  75a5                 jne 0x5f4
1:064F  eb0d                 jmp 0x65e
1:0651  db 90
loc_0652:
1:0652  8b56fe               mov dx, word ptr [bp - 2]
1:0655  051400               add ax, 0x14
1:0658  5e                   pop si
1:0659  5f                   pop di
1:065A  c9                   leave
1:065B  c20400               ret 4
loc_065E:
1:065E  33c0                 xor ax, ax
1:0660  99                   cdq
1:0661  5e                   pop si
1:0662  5f                   pop di
1:0663  c9                   leave
1:0664  c20400               ret 4
1:0667  db 00 33 db 33 c0 e8 a1 fe c3

; ---------------- SH_reallocLarge@s1:0670 size=274 callers=1
;   SmartHeap internal: grows/shrinks a large (GlobalAlloc) block
1:0670  c8100000             enter 0x10, 0
1:0674  52                   push dx
1:0675  50                   push ax
1:0676  57                   push di
1:0677  56                   push si
1:0678  8bfb                 mov di, bx
1:067A  8b7604               mov si, word ptr [bp + 4]
1:067D  8b05                 mov ax, word ptr [di]
1:067F  8b5502               mov dx, word ptr [di + 2]
1:0682  8946f8               mov word ptr [bp - 8], ax
1:0685  8956fa               mov word ptr [bp - 6], dx
1:0688  1e                   push ds
1:0689  53                   push bx
1:068A  90                   nop
1:068B  0e                   push cs
1:068C  e8a30e               call 0x1532  ; SH_globalSize@s1:1532
1:068F  8946fc               mov word ptr [bp - 4], ax
1:0692  8956fe               mov word ptr [bp - 2], dx
1:0695  8346ec14             add word ptr [bp - 0x14], 0x14
1:0699  8356ee00             adc word ptr [bp - 0x12], 0
1:069D  8bc6                 mov ax, si
1:069F  250100               and ax, 1
1:06A2  3d0100               cmp ax, 1
1:06A5  f5                   cmc
1:06A6  1bc0                 sbb ax, ax
1:06A8  250001               and ax, 0x100
1:06AB  8bce                 mov cx, si
1:06AD  83e104               and cx, 4
1:06B0  83f901               cmp cx, 1
1:06B3  f5                   cmc
1:06B4  1bc9                 sbb cx, cx
1:06B6  81e10004             and cx, 0x400
1:06BA  0bc1                 or ax, cx
1:06BC  c41d                 les bx, ptr [di]
1:06BE  260b4716             or ax, word ptr es:[bx + 0x16]
1:06C2  8bf0                 mov si, ax
1:06C4  8b4608               mov ax, word ptr [bp + 8]
1:06C7  0b4606               or ax, word ptr [bp + 6]
1:06CA  7470                 je 0x73c
1:06CC  897604               mov word ptr [bp + 4], si
1:06CF  8b4504               mov ax, word ptr [di + 4]
1:06D2  8b5506               mov dx, word ptr [di + 6]
1:06D5  8946f4               mov word ptr [bp - 0xc], ax
1:06D8  8956f6               mov word ptr [bp - 0xa], dx
loc_06DB:
1:06DB  1e                   push ds
1:06DC  57                   push di
1:06DD  ff76ee               push word ptr [bp - 0x12]
1:06E0  ff76ec               push word ptr [bp - 0x14]
1:06E3  8b4604               mov ax, word ptr [bp + 4]
1:06E6  80cc20               or ah, 0x20
1:06E9  50                   push ax
1:06EA  90                   nop
1:06EB  0e                   push cs
1:06EC  e8190d               call 0x1408  ; SH_globalReAlloc@s1:1408
1:06EF  8bf0                 mov si, ax
1:06F1  8956f2               mov word ptr [bp - 0xe], dx
1:06F4  0bd0                 or dx, ax
1:06F6  7511                 jne 0x709
1:06F8  ff76fa               push word ptr [bp - 6]
1:06FB  ff76f8               push word ptr [bp - 8]
1:06FE  6a02                 push 2
1:0700  90                   nop
1:0701  0e                   push cs
1:0702  e85c17               call 0x1e61  ; SH_error@s1:1E61
1:0705  0bc0                 or ax, ax
1:0707  75d2                 jne 0x6db
loc_0709:
1:0709  8b46f2               mov ax, word ptr [bp - 0xe]
1:070C  0bc6                 or ax, si
1:070E  741e                 je 0x72e
1:0710  8b46f2               mov ax, word ptr [bp - 0xe]
1:0713  c45ef4               les bx, ptr [bp - 0xc]
1:0716  26897708             mov word ptr es:[bx + 8], si
1:071A  2689470a             mov word ptr es:[bx + 0xa], ax
1:071E  8d4c14               lea cx, [si + 0x14]
1:0721  c45e06               les bx, ptr [bp + 6]
1:0724  26890f               mov word ptr es:[bx], cx
1:0727  26894702             mov word ptr es:[bx + 2], ax
1:072B  eb2a                 jmp 0x757
1:072D  db 90
loc_072E:
1:072E  c45e06               les bx, ptr [bp + 6]
1:0731  2bc0                 sub ax, ax
1:0733  26894702             mov word ptr es:[bx + 2], ax
1:0737  268907               mov word ptr es:[bx], ax
1:073A  eb3e                 jmp 0x77a
loc_073C:
1:073C  1e                   push ds
1:073D  57                   push di
1:073E  ff76ee               push word ptr [bp - 0x12]
1:0741  ff76ec               push word ptr [bp - 0x14]
1:0744  81ce0020             or si, 0x2000
1:0748  56                   push si
1:0749  90                   nop
1:074A  0e                   push cs
1:074B  e8a40d               call 0x14f2  ; SH_globalReAllocChecked@s1:14F2
1:074E  0bc0                 or ax, ax
1:0750  7428                 je 0x77a
1:0752  8bf7                 mov si, di
1:0754  8c5ef2               mov word ptr [bp - 0xe], ds
loc_0757:
1:0757  ff76f2               push word ptr [bp - 0xe]
1:075A  56                   push si
1:075B  90                   nop
1:075C  0e                   push cs
1:075D  e8d20d               call 0x1532  ; SH_globalSize@s1:1532
1:0760  2b46fc               sub ax, word ptr [bp - 4]
1:0763  1b56fe               sbb dx, word ptr [bp - 2]
1:0766  c45ef8               les bx, ptr [bp - 8]
1:0769  2601471e             add word ptr es:[bx + 0x1e], ax
1:076D  26115720             adc word ptr es:[bx + 0x20], dx
1:0771  b80100               mov ax, 1
1:0774  5e                   pop si
1:0775  5f                   pop di
1:0776  c9                   leave
1:0777  c20600               ret 6
loc_077A:
1:077A  33c0                 xor ax, ax
1:077C  5e                   pop si
1:077D  5f                   pop di
1:077E  c9                   leave
1:077F  c20600               ret 6

; ---------------- SH_pageInitVar@s1:0782 size=42 callers=1
;   SmartHeap internal: initialises a variable-size page header
1:0782  55                   push bp
1:0783  8bec                 mov bp, sp
1:0785  50                   push ax
1:0786  56                   push si
1:0787  c7470e0000           mov word ptr [bx + 0xe], 0
1:078C  8d4714               lea ax, [bx + 0x14]
1:078F  894710               mov word ptr [bx + 0x10], ax
1:0792  c74708a009           mov word ptr [bx + 8], 0x9a0
1:0797  c47604               les si, ptr [bp + 4]
1:079A  8b56fe               mov dx, word ptr [bp - 2]
1:079D  268b4418             mov ax, word ptr es:[si + 0x18]
1:07A1  e80800               call 0x7ac  ; SH_pageFormat@s1:07AC
1:07A4  b80100               mov ax, 1
1:07A7  5e                   pop si
1:07A8  c9                   leave
1:07A9  c20400               ret 4

; ---------------- SH_pageFormat@s1:07AC size=80 callers=1
;   SmartHeap internal: formats the free list of a new page
1:07AC  c8040000             enter 4, 0
1:07B0  50                   push ax
1:07B1  53                   push bx
1:07B2  57                   push di
1:07B3  56                   push si
1:07B4  8bf3                 mov si, bx
1:07B6  8bda                 mov bx, dx
1:07B8  8b7c10               mov di, word ptr [si + 0x10]
1:07BB  897c0e               mov word ptr [si + 0xe], di
1:07BE  2bf7                 sub si, di
1:07C0  03de                 add bx, si
1:07C2  8bc3                 mov ax, bx
1:07C4  8bcb                 mov cx, bx
1:07C6  2bd2                 sub dx, dx
1:07C8  f776fa               div word ptr [bp - 6]
1:07CB  8bc7                 mov ax, di
1:07CD  2bfa                 sub di, dx
1:07CF  8b5ef8               mov bx, word ptr [bp - 8]
1:07D2  03cf                 add cx, di
1:07D4  894f10               mov word ptr [bx + 0x10], cx
1:07D7  2b4efa               sub cx, word ptr [bp - 6]
1:07DA  3bc8                 cmp cx, ax
1:07DC  7704                 ja 0x7e2
1:07DE  8bd8                 mov bx, ax
1:07E0  eb11                 jmp 0x7f3
loc_07E2:
1:07E2  8bd8                 mov bx, ax
1:07E4  8b7efa               mov di, word ptr [bp - 6]
loc_07E7:
1:07E7  8bc3                 mov ax, bx
1:07E9  03c7                 add ax, di
1:07EB  8907                 mov word ptr [bx], ax
1:07ED  8bd8                 mov bx, ax
1:07EF  3bd9                 cmp bx, cx
1:07F1  72f4                 jb 0x7e7
loc_07F3:
1:07F3  c7070000             mov word ptr [bx], 0
1:07F7  5e                   pop si
1:07F8  5f                   pop di
1:07F9  c9                   leave
1:07FA  c3                   ret
1:07FB  db 00

; ---------------- SH_MemAllocFS@s1:07FC FAR size=60 callers=21
;   SmartHeap MemAllocFS(pool): fixed-size block from a pool (checks 0xBEAD)
1:07FC  c8040000             enter 4, 0
1:0800  c45e06               les bx, ptr [bp + 6]
1:0803  26817f14adbe         cmp word ptr es:[bx + 0x14], 0xbead
1:0809  7413                 je 0x81e
1:080B  6a00                 push 0
1:080D  6a00                 push 0
1:080F  6a0a                 push 0xa
1:0811  90                   nop
1:0812  0e                   push cs
1:0813  e84b16               call 0x1e61  ; SH_error@s1:1E61
1:0816  33c0                 xor ax, ax
1:0818  99                   cdq
1:0819  c9                   leave
1:081A  ca0400               retf 4
1:081D  db 90
loc_081E:
1:081E  1e                   push ds
1:081F  8e5e08               mov ds, word ptr [bp + 8]
1:0822  33db                 xor bx, bx
1:0824  e81100               call 0x838  ; SH_allocFS@s1:0838
1:0827  8946fc               mov word ptr [bp - 4], ax
1:082A  8956fe               mov word ptr [bp - 2], dx
1:082D  1f                   pop ds
1:082E  8b46fc               mov ax, word ptr [bp - 4]
1:0831  8b56fe               mov dx, word ptr [bp - 2]
1:0834  c9                   leave
1:0835  ca0400               retf 4

; ---------------- SH_allocFS@s1:0838 size=258 callers=2
;   SmartHeap internal behind MemAllocFS
1:0838  c80c0000             enter 0xc, 0
1:083C  53                   push bx
1:083D  57                   push di
1:083E  56                   push si
1:083F  8b7702               mov si, word ptr [bx + 2]
1:0842  8976fe               mov word ptr [bp - 2], si
1:0845  837f0200             cmp word ptr [bx + 2], 0
1:0849  7410                 je 0x85b
loc_084B:
1:084B  833c00               cmp word ptr [si], 0
1:084E  7403                 je 0x853
1:0850  e99300               jmp 0x8e6
loc_0853:
1:0853  8b7404               mov si, word ptr [si + 4]
1:0856  3b76fe               cmp si, word ptr [bp - 2]
1:0859  75f0                 jne 0x84b
loc_085B:
1:085B  8b5ef2               mov bx, word ptr [bp - 0xe]
1:085E  837f1800             cmp word ptr [bx + 0x18], 0
1:0862  7510                 jne 0x874
1:0864  1e                   push ds
1:0865  53                   push bx
1:0866  6a04                 push 4
1:0868  90                   nop
1:0869  0e                   push cs
1:086A  e8f415               call 0x1e61  ; SH_error@s1:1E61
loc_086D:
1:086D  33c0                 xor ax, ax
1:086F  99                   cdq
1:0870  5e                   pop si
1:0871  5f                   pop di
1:0872  c9                   leave
1:0873  c3                   ret
loc_0874:
1:0874  8b471a               mov ax, word ptr [bx + 0x1a]
1:0877  8946fc               mov word ptr [bp - 4], ax
loc_087A:
1:087A  8b46fc               mov ax, word ptr [bp - 4]
1:087D  2bd2                 sub dx, dx
1:087F  52                   push dx
1:0880  50                   push ax
1:0881  8b5ef2               mov bx, word ptr [bp - 0xe]
1:0884  8bf8                 mov di, ax
1:0886  b80100               mov ax, 1
1:0889  897ef8               mov word ptr [bp - 8], di
1:088C  8956fa               mov word ptr [bp - 6], dx
1:088F  e834fb               call 0x3c6  ; SH_blockAlloc@s1:03C6
1:0892  0bd0                 or dx, ax
1:0894  7540                 jne 0x8d6
1:0896  8b5ef2               mov bx, word ptr [bp - 0xe]
1:0899  8b471e               mov ax, word ptr [bx + 0x1e]
1:089C  8b5720               mov dx, word ptr [bx + 0x20]
1:089F  0346f8               add ax, word ptr [bp - 8]
1:08A2  1356fa               adc dx, word ptr [bp - 6]
1:08A5  3b5728               cmp dx, word ptr [bx + 0x28]
1:08A8  7207                 jb 0x8b1
1:08AA  77c1                 ja 0x86d
1:08AC  3b4726               cmp ax, word ptr [bx + 0x26]
1:08AF  77bc                 ja 0x86d
loc_08B1:
1:08B1  8b4718               mov ax, word ptr [bx + 0x18]
1:08B4  051400               add ax, 0x14
1:08B7  d16efc               shr word ptr [bp - 4], 1
1:08BA  8b4efc               mov cx, word ptr [bp - 4]
1:08BD  3bc1                 cmp ax, cx
1:08BF  76b9                 jbe 0x87a
1:08C1  03c9                 add cx, cx
1:08C3  894efc               mov word ptr [bp - 4], cx
1:08C6  1e                   push ds
1:08C7  53                   push bx
1:08C8  6a02                 push 2
1:08CA  90                   nop
1:08CB  0e                   push cs
1:08CC  e89215               call 0x1e61  ; SH_error@s1:1E61
1:08CF  0bc0                 or ax, ax
1:08D1  749a                 je 0x86d
1:08D3  eba5                 jmp 0x87a
1:08D5  db 90
loc_08D6:
1:08D6  8b5ef2               mov bx, word ptr [bp - 0xe]
1:08D9  8b7702               mov si, word ptr [bx + 2]
1:08DC  8b4404               mov ax, word ptr [si + 4]
1:08DF  8946fe               mov word ptr [bp - 2], ax
1:08E2  e966ff               jmp 0x84b
1:08E5  db 90
loc_08E6:
1:08E6  8b4408               mov ax, word ptr [si + 8]
1:08E9  8b540a               mov dx, word ptr [si + 0xa]
1:08EC  8946f8               mov word ptr [bp - 8], ax
1:08EF  8956fa               mov word ptr [bp - 6], dx
1:08F2  1e                   push ds
1:08F3  bb0e00               mov bx, 0xe
1:08F6  8e5efa               mov ds, word ptr [bp - 6]
1:08F9  8b07                 mov ax, word ptr [bx]
1:08FB  8bc8                 mov cx, ax
1:08FD  8946fc               mov word ptr [bp - 4], ax
1:0900  0bc0                 or ax, ax
1:0902  7416                 je 0x91a
1:0904  8bf8                 mov di, ax
1:0906  8b15                 mov dx, word ptr [di]
1:0908  8917                 mov word ptr [bx], dx
1:090A  bb0a00               mov bx, 0xa
1:090D  ff060a00             inc word ptr [0xa]
1:0911  8b46fc               mov ax, word ptr [bp - 4]
1:0914  8946f4               mov word ptr [bp - 0xc], ax
1:0917  8c5ef6               mov word ptr [bp - 0xa], ds
loc_091A:
1:091A  1f                   pop ds
1:091B  837efc00             cmp word ptr [bp - 4], 0
1:091F  7411                 je 0x932
1:0921  8b5ef2               mov bx, word ptr [bp - 0xe]
1:0924  897702               mov word ptr [bx + 2], si
1:0927  8b46f4               mov ax, word ptr [bp - 0xc]
1:092A  8b56f6               mov dx, word ptr [bp - 0xa]
1:092D  5e                   pop si
1:092E  5f                   pop di
1:092F  c9                   leave
1:0930  c3                   ret
1:0931  db 90
loc_0932:
1:0932  c7040000             mov word ptr [si], 0
1:0936  e91aff               jmp 0x853
1:0939  db 00

; ---------------- SH_MemFreeFS@s1:093A FAR size=144 callers=6
;   SmartHeap MemFreeFS(ptr): frees a fixed-size block (page signature 0xCAD1)
1:093A  c8040000             enter 4, 0
1:093E  8b4608               mov ax, word ptr [bp + 8]
1:0941  8bc8                 mov cx, ax
1:0943  2bdb                 sub bx, bx
1:0945  8ec0                 mov es, ax
1:0947  26813e0c00d1ca       cmp word ptr es:[0xc], 0xcad1
1:094E  7410                 je 0x960
1:0950  53                   push bx
1:0951  53                   push bx
1:0952  6a0e                 push 0xe
1:0954  90                   nop
1:0955  0e                   push cs
1:0956  e80815               call 0x1e61  ; SH_error@s1:1E61
1:0959  33c0                 xor ax, ax
1:095B  c9                   leave
1:095C  ca0400               retf 4
1:095F  db 90
loc_0960:
1:0960  1e                   push ds
1:0961  bb0e00               mov bx, 0xe
1:0964  8e5e08               mov ds, word ptr [bp + 8]
1:0967  8b07                 mov ax, word ptr [bx]
1:0969  8b5e06               mov bx, word ptr [bp + 6]
1:096C  8907                 mov word ptr [bx], ax
1:096E  8b5e06               mov bx, word ptr [bp + 6]
1:0971  833f00               cmp word ptr [bx], 0
1:0974  7509                 jne 0x97f
1:0976  c41e0400             les bx, ptr [4]
1:097A  26c7070100           mov word ptr es:[bx], 1
loc_097F:
1:097F  8b4606               mov ax, word ptr [bp + 6]
1:0982  89060e00             mov word ptr [0xe], ax
1:0986  bb0a00               mov bx, 0xa
1:0989  ff0e0a00             dec word ptr [0xa]
1:098D  7508                 jne 0x997
1:098F  33db                 xor bx, bx
1:0991  b80100               mov ax, 1
1:0994  e879fb               call 0x510  ; SH_pageRelease@s1:0510
loc_0997:
1:0997  1f                   pop ds
1:0998  b80100               mov ax, 1
1:099B  c9                   leave
1:099C  ca0400               retf 4
1:099F  db 00 56 8b f3 8b 06 0e 00 89 04 0b c0 75 09 c4 1e
1:09AF  db 04 00 26 c7 07 01 00 89 36 0e 00 ff 0e 0a 00 75
1:09BF  db 08 33 db b8 01 00 e8 48 fb 5e c3

; ---------------- SH_freeListFix@s1:09CA size=126 callers=1
;   SmartHeap internal: free-list maintenance
1:09CA  57                   push di
1:09CB  56                   push si
1:09CC  8bfb                 mov di, bx
1:09CE  8d4d14               lea cx, [di + 0x14]
1:09D1  2bd9                 sub bx, cx
1:09D3  03d8                 add bx, ax
1:09D5  83eb06               sub bx, 6
1:09D8  80e3fc               and bl, 0xfc
1:09DB  03d9                 add bx, cx
1:09DD  c7070100             mov word ptr [bx], 1
1:09E1  894d0e               mov word ptr [di + 0xe], cx
1:09E4  895f04               mov word ptr [bx + 4], bx
1:09E7  895f02               mov word ptr [bx + 2], bx
1:09EA  895d10               mov word ptr [di + 0x10], bx
1:09ED  8a450c               mov al, byte ptr [di + 0xc]
1:09F0  2407                 and al, 7
1:09F2  3c02                 cmp al, 2
1:09F4  7508                 jne 0x9fe
1:09F6  c745120800           mov word ptr [di + 0x12], 8
1:09FB  eb19                 jmp 0xa16
1:09FD  db 90
loc_09FE:
1:09FE  c435                 les si, ptr [di]
1:0A00  268b4418             mov ax, word ptr es:[si + 0x18]
1:0A04  050300               add ax, 3
1:0A07  2d0800               sub ax, 8
1:0A0A  1bd2                 sbb dx, dx
1:0A0C  f7d2                 not dx
1:0A0E  23c2                 and ax, dx
1:0A10  050800               add ax, 8
1:0A13  894512               mov word ptr [di + 0x12], ax
loc_0A16:
1:0A16  8bc3                 mov ax, bx
1:0A18  8bf3                 mov si, bx
1:0A1A  2bd9                 sub bx, cx
1:0A1C  895cfe               mov word ptr [si - 2], bx
1:0A1F  8bf1                 mov si, cx
1:0A21  80cb02               or bl, 2
1:0A24  891c                 mov word ptr [si], bx
1:0A26  8bd8                 mov bx, ax
1:0A28  894404               mov word ptr [si + 4], ax
1:0A2B  8b4702               mov ax, word ptr [bx + 2]
1:0A2E  894402               mov word ptr [si + 2], ax
1:0A31  8b7702               mov si, word ptr [bx + 2]
1:0A34  894c04               mov word ptr [si + 4], cx
1:0A37  894f02               mov word ptr [bx + 2], cx
1:0A3A  8bd9                 mov bx, cx
1:0A3C  c74508080e           mov word ptr [di + 8], 0xe08
1:0A41  8b07                 mov ax, word ptr [bx]
1:0A43  24fc                 and al, 0xfc
1:0A45  5e                   pop si
1:0A46  5f                   pop di
1:0A47  c3                   ret

; ---------------- SH_MemAllocPtr_core@s1:0A48 FAR size=216 callers=11
;   SmartHeap internal: variable-size allocation used by MemAllocPtr/malloc
1:0A48  c8040000             enter 4, 0
1:0A4C  57                   push di
1:0A4D  56                   push si
1:0A4E  c45e0c               les bx, ptr [bp + 0xc]
1:0A51  26817f14adbe         cmp word ptr es:[bx + 0x14], 0xbead
1:0A57  7415                 je 0xa6e
1:0A59  6a00                 push 0
1:0A5B  6a00                 push 0
1:0A5D  6a0a                 push 0xa
1:0A5F  90                   nop
1:0A60  0e                   push cs
1:0A61  e8fd13               call 0x1e61  ; SH_error@s1:1E61
1:0A64  33c0                 xor ax, ax
1:0A66  99                   cdq
1:0A67  5e                   pop si
1:0A68  5f                   pop di
1:0A69  c9                   leave
1:0A6A  ca0a00               retf 0xa
1:0A6D  db 90
loc_0A6E:
1:0A6E  1e                   push ds
1:0A6F  bb1800               mov bx, 0x18
1:0A72  8e5e0e               mov ds, word ptr [bp + 0xe]
1:0A75  8b07                 mov ax, word ptr [bx]
1:0A77  2bd2                 sub dx, dx
1:0A79  39560a               cmp word ptr [bp + 0xa], dx
1:0A7C  775c                 ja 0xada
1:0A7E  7205                 jb 0xa85
1:0A80  394608               cmp word ptr [bp + 8], ax
1:0A83  7755                 ja 0xada
loc_0A85:
1:0A85  39560a               cmp word ptr [bp + 0xa], dx
1:0A88  7505                 jne 0xa8f
1:0A8A  395608               cmp word ptr [bp + 8], dx
1:0A8D  7433                 je 0xac2
loc_0A8F:
1:0A8F  33db                 xor bx, bx
1:0A91  e8a4fd               call 0x838  ; SH_allocFS@s1:0838
1:0A94  8946fc               mov word ptr [bp - 4], ax
1:0A97  8956fe               mov word ptr [bp - 2], dx
1:0A9A  0bd0                 or dx, ax
1:0A9C  7474                 je 0xb12
1:0A9E  f6460601             test byte ptr [bp + 6], 1
1:0AA2  746e                 je 0xb12
1:0AA4  33c0                 xor ax, ax
1:0AA6  be1800               mov si, 0x18
1:0AA9  8b0e1800             mov cx, word ptr [0x18]
1:0AAD  8b5efc               mov bx, word ptr [bp - 4]
1:0AB0  8b56fe               mov dx, word ptr [bp - 2]
1:0AB3  8bfb                 mov di, bx
1:0AB5  8ec2                 mov es, dx
1:0AB7  d1e9                 shr cx, 1
1:0AB9  f3ab                 rep stosw word ptr es:[di], ax
1:0ABB  7355                 jae 0xb12
1:0ABD  aa                   stosb byte ptr es:[di], al
1:0ABE  eb52                 jmp 0xb12
1:0AC0  db 90 90
loc_0AC2:
1:0AC2  ff760e               push word ptr [bp + 0xe]
1:0AC5  ff760c               push word ptr [bp + 0xc]
1:0AC8  6a04                 push 4
1:0ACA  90                   nop
1:0ACB  0e                   push cs
1:0ACC  e89213               call 0x1e61  ; SH_error@s1:1E61
1:0ACF  2bc0                 sub ax, ax
1:0AD1  8946fe               mov word ptr [bp - 2], ax
1:0AD4  8946fc               mov word ptr [bp - 4], ax
1:0AD7  eb39                 jmp 0xb12
1:0AD9  db 90
loc_0ADA:
1:0ADA  bb1c00               mov bx, 0x1c
1:0ADD  8b061c00             mov ax, word ptr [0x1c]
1:0AE1  39560a               cmp word ptr [bp + 0xa], dx
1:0AE4  7716                 ja 0xafc
1:0AE6  7205                 jb 0xaed
1:0AE8  394608               cmp word ptr [bp + 8], ax
1:0AEB  770f                 ja 0xafc
loc_0AED:
1:0AED  8b4606               mov ax, word ptr [bp + 6]
1:0AF0  24fd                 and al, 0xfd
1:0AF2  8b5608               mov dx, word ptr [bp + 8]
1:0AF5  33db                 xor bx, bx
1:0AF7  e82600               call 0xb20  ; SH_allocVar@s1:0B20
1:0AFA  eb10                 jmp 0xb0c
loc_0AFC:
1:0AFC  ff760a               push word ptr [bp + 0xa]
1:0AFF  ff7608               push word ptr [bp + 8]
1:0B02  8b4606               mov ax, word ptr [bp + 6]
1:0B05  24fd                 and al, 0xfd
1:0B07  33db                 xor bx, bx
1:0B09  e8d6fa               call 0x5e2  ; SH_allocFixedInternal@s1:05E2
loc_0B0C:
1:0B0C  8946fc               mov word ptr [bp - 4], ax
1:0B0F  8956fe               mov word ptr [bp - 2], dx
loc_0B12:
1:0B12  1f                   pop ds
1:0B13  8b46fc               mov ax, word ptr [bp - 4]
1:0B16  8b56fe               mov dx, word ptr [bp - 2]
1:0B19  5e                   pop si
1:0B1A  5f                   pop di
1:0B1B  c9                   leave
1:0B1C  ca0a00               retf 0xa
1:0B1F  db 00

; ---------------- SH_allocVar@s1:0B20 size=274 callers=1
;   SmartHeap internal: variable-size block search
1:0B20  c80e0000             enter 0xe, 0
1:0B24  52                   push dx
1:0B25  50                   push ax
1:0B26  53                   push bx
1:0B27  57                   push di
1:0B28  56                   push si
1:0B29  8bf2                 mov si, dx
1:0B2B  250200               and ax, 2
1:0B2E  8946fe               mov word ptr [bp - 2], ax
1:0B31  8d4c05               lea cx, [si + 5]
1:0B34  80e1fc               and cl, 0xfc
1:0B37  83e908               sub cx, 8
1:0B3A  1bd2                 sbb dx, dx
1:0B3C  f7d2                 not dx
1:0B3E  23ca                 and cx, dx
1:0B40  83c108               add cx, 8
1:0B43  8bf1                 mov si, cx
1:0B45  8bd8                 mov bx, ax
1:0B47  03d8                 add bx, ax
1:0B49  035eec               add bx, word ptr [bp - 0x14]
1:0B4C  8b3f                 mov di, word ptr [bx]
1:0B4E  0bff                 or di, di
1:0B50  7412                 je 0xb64
1:0B52  897efc               mov word ptr [bp - 4], di
loc_0B55:
1:0B55  3935                 cmp word ptr [di], si
1:0B57  7203                 jb 0xb5c
1:0B59  e99600               jmp 0xbf2
loc_0B5C:
1:0B5C  8b7d04               mov di, word ptr [di + 4]
1:0B5F  3b7efc               cmp di, word ptr [bp - 4]
1:0B62  75f1                 jne 0xb55
loc_0B64:
1:0B64  f646ee02             test byte ptr [bp - 0x12], 2
1:0B68  7434                 je 0xb9e
1:0B6A  f646ee40             test byte ptr [bp - 0x12], 0x40
1:0B6E  752e                 jne 0xb9e
1:0B70  8b5eec               mov bx, word ptr [bp - 0x14]
1:0B73  837f3200             cmp word ptr [bx + 0x32], 0
1:0B77  7425                 je 0xb9e
1:0B79  8b4732               mov ax, word ptr [bx + 0x32]
1:0B7C  8946fa               mov word ptr [bp - 6], ax
1:0B7F  8bc6                 mov ax, si
1:0B81  ff56fa               call word ptr [bp - 6]
1:0B84  3bc6                 cmp ax, si
1:0B86  7216                 jb 0xb9e
1:0B88  804eee40             or byte ptr [bp - 0x12], 0x40
loc_0B8C:
1:0B8C  8b5efe               mov bx, word ptr [bp - 2]
1:0B8F  03db                 add bx, bx
1:0B91  035eec               add bx, word ptr [bp - 0x14]
1:0B94  8b3f                 mov di, word ptr [bx]
1:0B96  8b4504               mov ax, word ptr [di + 4]
1:0B99  8946fc               mov word ptr [bp - 4], ax
1:0B9C  ebb7                 jmp 0xb55
loc_0B9E:
1:0B9E  f646ee10             test byte ptr [bp - 0x12], 0x10
1:0BA2  7514                 jne 0xbb8
1:0BA4  8b5eec               mov bx, word ptr [bp - 0x14]
1:0BA7  6a00                 push 0
1:0BA9  ff771a               push word ptr [bx + 0x1a]
1:0BAC  8b46fe               mov ax, word ptr [bp - 2]
1:0BAF  33d2                 xor dx, dx
1:0BB1  e812f8               call 0x3c6  ; SH_blockAlloc@s1:03C6
1:0BB4  0bd0                 or dx, ax
1:0BB6  75d4                 jne 0xb8c
loc_0BB8:
1:0BB8  f646ee20             test byte ptr [bp - 0x12], 0x20
1:0BBC  752c                 jne 0xbea
1:0BBE  8d84ff0f             lea ax, [si + 0xfff]
1:0BC2  2500f0               and ax, 0xf000
1:0BC5  8b5eec               mov bx, word ptr [bp - 0x14]
1:0BC8  2bd2                 sub dx, dx
1:0BCA  03471e               add ax, word ptr [bx + 0x1e]
1:0BCD  135720               adc dx, word ptr [bx + 0x20]
1:0BD0  3b5728               cmp dx, word ptr [bx + 0x28]
1:0BD3  7715                 ja 0xbea
1:0BD5  7205                 jb 0xbdc
1:0BD7  3b4726               cmp ax, word ptr [bx + 0x26]
1:0BDA  770e                 ja 0xbea
loc_0BDC:
1:0BDC  6a00                 push 0
1:0BDE  56                   push si
1:0BDF  8b46ee               mov ax, word ptr [bp - 0x12]
1:0BE2  e8fdf9               call 0x5e2  ; SH_allocFixedInternal@s1:05E2
1:0BE5  5e                   pop si
1:0BE6  5f                   pop di
1:0BE7  c9                   leave
1:0BE8  c3                   ret
1:0BE9  db 90
loc_0BEA:
1:0BEA  33c0                 xor ax, ax
1:0BEC  99                   cdq
1:0BED  5e                   pop si
1:0BEE  5f                   pop di
1:0BEF  c9                   leave
1:0BF0  c3                   ret
1:0BF1  db 90
loc_0BF2:
1:0BF2  8b4508               mov ax, word ptr [di + 8]
1:0BF5  8b550a               mov dx, word ptr [di + 0xa]
1:0BF8  8946f6               mov word ptr [bp - 0xa], ax
1:0BFB  8956f8               mov word ptr [bp - 8], dx
1:0BFE  1e                   push ds
1:0BFF  8e5ef8               mov ds, word ptr [bp - 8]
1:0C02  33db                 xor bx, bx
1:0C04  8bc6                 mov ax, si
1:0C06  8b56ee               mov dx, word ptr [bp - 0x12]
1:0C09  e82600               call 0xc32  ; SH_allocVarSplit@s1:0C32
1:0C0C  8946f2               mov word ptr [bp - 0xe], ax
1:0C0F  8956f4               mov word ptr [bp - 0xc], dx
1:0C12  1f                   pop ds
1:0C13  8b46f4               mov ax, word ptr [bp - 0xc]
1:0C16  0b46f2               or ax, word ptr [bp - 0xe]
1:0C19  7503                 jne 0xc1e
1:0C1B  e93eff               jmp 0xb5c
loc_0C1E:
1:0C1E  8b5efe               mov bx, word ptr [bp - 2]
1:0C21  03db                 add bx, bx
1:0C23  035eec               add bx, word ptr [bp - 0x14]
1:0C26  893f                 mov word ptr [bx], di
1:0C28  8b46f2               mov ax, word ptr [bp - 0xe]
1:0C2B  8b56f4               mov dx, word ptr [bp - 0xc]
1:0C2E  5e                   pop si
1:0C2F  5f                   pop di
1:0C30  c9                   leave
1:0C31  c3                   ret

; ---------------- SH_allocVarSplit@s1:0C32 size=404 callers=1
;   SmartHeap internal: splits a free block
1:0C32  c8080000             enter 8, 0
1:0C36  52                   push dx
1:0C37  50                   push ax
1:0C38  53                   push bx
1:0C39  57                   push di
1:0C3A  56                   push si
1:0C3B  8bfb                 mov di, bx
1:0C3D  8b5d0e               mov bx, word ptr [di + 0xe]
1:0C40  895efa               mov word ptr [bp - 6], bx
1:0C43  c746fc0000           mov word ptr [bp - 4], 0
loc_0C48:
1:0C48  8b0f                 mov cx, word ptr [bx]
1:0C4A  394ef4               cmp word ptr [bp - 0xc], cx
1:0C4D  7657                 jbe 0xca6
1:0C4F  394efc               cmp word ptr [bp - 4], cx
1:0C52  7303                 jae 0xc57
1:0C54  894efc               mov word ptr [bp - 4], cx
loc_0C57:
1:0C57  8b5f02               mov bx, word ptr [bx + 2]
1:0C5A  3b5efa               cmp bx, word ptr [bp - 6]
1:0C5D  75e9                 jne 0xc48
1:0C5F  f646f602             test byte ptr [bp - 0xa], 2
1:0C63  742f                 je 0xc94
1:0C65  f646f640             test byte ptr [bp - 0xa], 0x40
1:0C69  7529                 jne 0xc94
1:0C6B  c41d                 les bx, ptr [di]
1:0C6D  26837f3400           cmp word ptr es:[bx + 0x34], 0
1:0C72  7420                 je 0xc94
1:0C74  268b4734             mov ax, word ptr es:[bx + 0x34]
1:0C78  8946f8               mov word ptr [bp - 8], ax
1:0C7B  8bdf                 mov bx, di
1:0C7D  8b46f4               mov ax, word ptr [bp - 0xc]
1:0C80  33d2                 xor dx, dx
1:0C82  ff56f8               call word ptr [bp - 8]
1:0C85  8946fc               mov word ptr [bp - 4], ax
1:0C88  3b46f4               cmp ax, word ptr [bp - 0xc]
1:0C8B  7207                 jb 0xc94
1:0C8D  8b5d0e               mov bx, word ptr [di + 0xe]
1:0C90  0bdb                 or bx, bx
1:0C92  75b4                 jne 0xc48
loc_0C94:
1:0C94  8b46fc               mov ax, word ptr [bp - 4]
1:0C97  24fc                 and al, 0xfc
1:0C99  c45d04               les bx, ptr [di + 4]
1:0C9C  268907               mov word ptr es:[bx], ax
1:0C9F  33c0                 xor ax, ax
1:0CA1  99                   cdq
1:0CA2  5e                   pop si
1:0CA3  5f                   pop di
1:0CA4  c9                   leave
1:0CA5  c3                   ret
loc_0CA6:
1:0CA6  80e1fc               and cl, 0xfc
1:0CA9  2b4ef4               sub cx, word ptr [bp - 0xc]
1:0CAC  8b76f2               mov si, word ptr [bp - 0xe]
1:0CAF  394c12               cmp word ptr [si + 0x12], cx
1:0CB2  7630                 jbe 0xce4
1:0CB4  8bf3                 mov si, bx
1:0CB6  8bcb                 mov cx, bx
1:0CB8  8bfb                 mov di, bx
1:0CBA  8b5c02               mov bx, word ptr [si + 2]
1:0CBD  8b7504               mov si, word ptr [di + 4]
1:0CC0  895c02               mov word ptr [si + 2], bx
1:0CC3  8b7502               mov si, word ptr [di + 2]
1:0CC6  8b4504               mov ax, word ptr [di + 4]
1:0CC9  894404               mov word ptr [si + 4], ax
1:0CCC  800d01               or byte ptr [di], 1
1:0CCF  8b05                 mov ax, word ptr [di]
1:0CD1  24fc                 and al, 0xfc
1:0CD3  03f8                 add di, ax
1:0CD5  8946f4               mov word ptr [bp - 0xc], ax
1:0CD8  8b05                 mov ax, word ptr [di]
1:0CDA  0c02                 or al, 2
1:0CDC  8905                 mov word ptr [di], ax
1:0CDE  894efa               mov word ptr [bp - 6], cx
1:0CE1  e98400               jmp 0xd68
loc_0CE4:
1:0CE4  8bf9                 mov di, cx
1:0CE6  f646f606             test byte ptr [bp - 0xa], 6
1:0CEA  7454                 je 0xd40
1:0CEC  8bf3                 mov si, bx
1:0CEE  8a04                 mov al, byte ptr [si]
1:0CF0  250200               and ax, 2
1:0CF3  0b46f4               or ax, word ptr [bp - 0xc]
1:0CF6  0c01                 or al, 1
1:0CF8  8904                 mov word ptr [si], ax
1:0CFA  8b4402               mov ax, word ptr [si + 2]
1:0CFD  8b7404               mov si, word ptr [si + 4]
1:0D00  894402               mov word ptr [si + 2], ax
1:0D03  8bf3                 mov si, bx
1:0D05  8b4404               mov ax, word ptr [si + 4]
1:0D08  8b7402               mov si, word ptr [si + 2]
1:0D0B  894404               mov word ptr [si + 4], ax
1:0D0E  895efa               mov word ptr [bp - 6], bx
1:0D11  035ef4               add bx, word ptr [bp - 0xc]
1:0D14  8979fe               mov word ptr [bx + di - 2], di
1:0D17  8bc7                 mov ax, di
1:0D19  0c02                 or al, 2
1:0D1B  8907                 mov word ptr [bx], ax
1:0D1D  8b76f2               mov si, word ptr [bp - 0xe]
1:0D20  8b4410               mov ax, word ptr [si + 0x10]
1:0D23  8946fc               mov word ptr [bp - 4], ax
1:0D26  894704               mov word ptr [bx + 4], ax
1:0D29  8b76fc               mov si, word ptr [bp - 4]
1:0D2C  8b4402               mov ax, word ptr [si + 2]
1:0D2F  894702               mov word ptr [bx + 2], ax
1:0D32  8b7402               mov si, word ptr [si + 2]
1:0D35  895c04               mov word ptr [si + 4], bx
1:0D38  8b76fc               mov si, word ptr [bp - 4]
1:0D3B  895c02               mov word ptr [si + 2], bx
1:0D3E  eb28                 jmp 0xd68
loc_0D40:
1:0D40  8bc7                 mov ax, di
1:0D42  03c3                 add ax, bx
1:0D44  8bf0                 mov si, ax
1:0D46  8946fa               mov word ptr [bp - 6], ax
1:0D49  897cfe               mov word ptr [si - 2], di
1:0D4C  8bc7                 mov ax, di
1:0D4E  0c02                 or al, 2
1:0D50  8907                 mov word ptr [bx], ax
1:0D52  8b5f02               mov bx, word ptr [bx + 2]
1:0D55  8b76fa               mov si, word ptr [bp - 6]
1:0D58  0376f4               add si, word ptr [bp - 0xc]
1:0D5B  800c02               or byte ptr [si], 2
1:0D5E  8b46f4               mov ax, word ptr [bp - 0xc]
1:0D61  8b76fa               mov si, word ptr [bp - 6]
1:0D64  0c01                 or al, 1
1:0D66  8904                 mov word ptr [si], ax
loc_0D68:
1:0D68  8b76f2               mov si, word ptr [bp - 0xe]
1:0D6B  895c0e               mov word ptr [si + 0xe], bx
1:0D6E  f646f601             test byte ptr [bp - 0xa], 1
1:0D72  7417                 je 0xd8b
1:0D74  33c0                 xor ax, ax
1:0D76  8b76fa               mov si, word ptr [bp - 6]
1:0D79  8b4ef4               mov cx, word ptr [bp - 0xc]
1:0D7C  83e902               sub cx, 2
1:0D7F  8d7c02               lea di, [si + 2]
1:0D82  1e                   push ds
1:0D83  07                   pop es
1:0D84  d1e9                 shr cx, 1
1:0D86  f3ab                 rep stosw word ptr es:[di], ax
1:0D88  7301                 jae 0xd8b
1:0D8A  aa                   stosb byte ptr es:[di], al
loc_0D8B:
1:0D8B  f646f602             test byte ptr [bp - 0xa], 2
1:0D8F  7423                 je 0xdb4
1:0D91  8b4704               mov ax, word ptr [bx + 4]
1:0D94  394702               cmp word ptr [bx + 2], ax
1:0D97  751b                 jne 0xdb4
1:0D99  8b5ef2               mov bx, word ptr [bp - 0xe]
1:0D9C  8b7710               mov si, word ptr [bx + 0x10]
1:0D9F  8b7402               mov si, word ptr [si + 2]
1:0DA2  8b04                 mov ax, word ptr [si]
1:0DA4  24fc                 and al, 0xfc
1:0DA6  c47704               les si, ptr [bx + 4]
1:0DA9  268904               mov word ptr es:[si], ax
1:0DAC  c45f04               les bx, ptr [bx + 4]
1:0DAF  26804f0380           or byte ptr es:[bx + 3], 0x80
loc_0DB4:
1:0DB4  8b5ef2               mov bx, word ptr [bp - 0xe]
1:0DB7  ff470a               inc word ptr [bx + 0xa]
1:0DBA  8b46fa               mov ax, word ptr [bp - 6]
1:0DBD  050200               add ax, 2
1:0DC0  8cda                 mov dx, ds
1:0DC2  5e                   pop si
1:0DC3  5f                   pop di
1:0DC4  c9                   leave
1:0DC5  c3                   ret

; ---------------- SH_MemFreePtr@s1:0DC6 FAR size=270 callers=10
;   SmartHeap MemFreePtr(ptr)
1:0DC6  c8060000             enter 6, 0
1:0DCA  8b4608               mov ax, word ptr [bp + 8]
1:0DCD  8bc8                 mov cx, ax
1:0DCF  2bdb                 sub bx, bx
1:0DD1  8ec0                 mov es, ax
1:0DD3  268b060c00           mov ax, word ptr es:[0xc]
1:0DD8  24f8                 and al, 0xf8
1:0DDA  3dd0ca               cmp ax, 0xcad0
1:0DDD  740f                 je 0xdee
1:0DDF  53                   push bx
1:0DE0  53                   push bx
1:0DE1  6a0e                 push 0xe
1:0DE3  90                   nop
1:0DE4  0e                   push cs
1:0DE5  e87910               call 0x1e61  ; SH_error@s1:1E61
1:0DE8  33c0                 xor ax, ax
1:0DEA  c9                   leave
1:0DEB  ca0400               retf 4
loc_0DEE:
1:0DEE  1e                   push ds
1:0DEF  bb0800               mov bx, 8
1:0DF2  8e5e08               mov ds, word ptr [bp + 8]
1:0DF5  8b07                 mov ax, word ptr [bx]
1:0DF7  8946fa               mov word ptr [bp - 6], ax
1:0DFA  8b5e06               mov bx, word ptr [bp + 6]
1:0DFD  ff56fa               call word ptr [bp - 6]
1:0E00  1f                   pop ds
1:0E01  b80100               mov ax, 1
1:0E04  c9                   leave
1:0E05  ca0400               retf 4
1:0E08  db 57 56 8d 4f fe bf 01 00 8b d9 f6 07 02 75 0f 2b
1:0E18  db 4f fe 8b 07 8b d9 24 fc 01 07 33 ff eb 03 80 27
1:0E28  db fe 8b 1f 80 e3 fc 03 d9 f6 07 01 75 2d 8b 07 8b
1:0E38  db f1 24 fc 01 04 3b 1e 0e 00 75 04 89 0e 0e 00 8b
1:0E48  db 77 04 8b 47 02 89 44 02 8b 77 02 8b 47 04 8b d9
1:0E58  db 89 44 04 8b 1f 80 e3 fc 03 d9 8b f1 8b 04 24 fc
1:0E68  db 89 47 fe c4 36 04 00 26 8b 04 39 47 fe 76 0d 8b
1:0E78  db f1 8b 04 8b 36 04 00 24 fc 26 89 04 80 27 fd 0b
1:0E88  db ff 74 38 8b 06 10 00 8b d8 39 47 02 74 09 c4 1e
1:0E98  db 04 00 26 80 67 03 7f 8b f1 8b 06 10 00 89 44 04
1:0EA8  db 8b 3e 10 00 8b 45 02 89 44 02 8b 3e 10 00 8b 7d
1:0EB8  db 02 89 4d 04 8b 1e 10 00 89 4f 02 ff 0e 0a 00 75
1:0EC8  db 08 33 db b8 01 00 e8 3f f6 5e 5f c3

; ---------------- SH_MemReAllocPtr@s1:0ED4 FAR size=228 callers=9
;   SmartHeap MemReAllocPtr(ptr, size, flags)
1:0ED4  c80a0000             enter 0xa, 0
1:0ED8  57                   push di
1:0ED9  56                   push si
1:0EDA  8b460e               mov ax, word ptr [bp + 0xe]
1:0EDD  8bc8                 mov cx, ax
1:0EDF  2bdb                 sub bx, bx
1:0EE1  8ec0                 mov es, ax
1:0EE3  268b060c00           mov ax, word ptr es:[0xc]
1:0EE8  24f8                 and al, 0xf8
1:0EEA  3dd0ca               cmp ax, 0xcad0
1:0EED  7413                 je 0xf02
1:0EEF  53                   push bx
1:0EF0  53                   push bx
1:0EF1  6a0e                 push 0xe
loc_0EF3:
1:0EF3  90                   nop
1:0EF4  0e                   push cs
1:0EF5  e8690f               call 0x1e61  ; SH_error@s1:1E61
loc_0EF8:
1:0EF8  33c0                 xor ax, ax
1:0EFA  99                   cdq
1:0EFB  5e                   pop si
1:0EFC  5f                   pop di
1:0EFD  c9                   leave
1:0EFE  ca0a00               retf 0xa
1:0F01  db 90
loc_0F02:
1:0F02  1e                   push ds
1:0F03  33db                 xor bx, bx
1:0F05  8e5e0e               mov ds, word ptr [bp + 0xe]
1:0F08  8b07                 mov ax, word ptr [bx]
1:0F0A  8b5702               mov dx, word ptr [bx + 2]
1:0F0D  8946fc               mov word ptr [bp - 4], ax
1:0F10  8956fe               mov word ptr [bp - 2], dx
1:0F13  f6460608             test byte ptr [bp + 6], 8
1:0F17  7405                 je 0xf1e
1:0F19  33c0                 xor ax, ax
1:0F1B  99                   cdq
1:0F1C  eb05                 jmp 0xf23
loc_0F1E:
1:0F1E  8d460c               lea ax, [bp + 0xc]
1:0F21  8cd2                 mov dx, ss
loc_0F23:
1:0F23  8946f6               mov word ptr [bp - 0xa], ax
1:0F26  8956f8               mov word ptr [bp - 8], dx
1:0F29  52                   push dx
1:0F2A  50                   push ax
1:0F2B  ff7606               push word ptr [bp + 6]
1:0F2E  8b5e0c               mov bx, word ptr [bp + 0xc]
1:0F31  8b4608               mov ax, word ptr [bp + 8]
1:0F34  8b560a               mov dx, word ptr [bp + 0xa]
1:0F37  e87e00               call 0xfb8  ; SH_reallocInternal@s1:0FB8
1:0F3A  8946fa               mov word ptr [bp - 6], ax
1:0F3D  1f                   pop ds
1:0F3E  837efa00             cmp word ptr [bp - 6], 0
1:0F42  750c                 jne 0xf50
1:0F44  8b460c               mov ax, word ptr [bp + 0xc]
1:0F47  8b560e               mov dx, word ptr [bp + 0xe]
1:0F4A  5e                   pop si
1:0F4B  5f                   pop di
1:0F4C  c9                   leave
1:0F4D  ca0a00               retf 0xa
loc_0F50:
1:0F50  f6460608             test byte ptr [bp + 6], 8
1:0F54  754c                 jne 0xfa2
1:0F56  ff76fe               push word ptr [bp - 2]
1:0F59  ff76fc               push word ptr [bp - 4]
1:0F5C  ff760a               push word ptr [bp + 0xa]
1:0F5F  ff7608               push word ptr [bp + 8]
1:0F62  ff7606               push word ptr [bp + 6]
1:0F65  90                   nop
1:0F66  0e                   push cs
1:0F67  e8defa               call 0xa48  ; SH_MemAllocPtr_core@s1:0A48
1:0F6A  8946f6               mov word ptr [bp - 0xa], ax
1:0F6D  8956f8               mov word ptr [bp - 8], dx
1:0F70  0bd0                 or dx, ax
1:0F72  7421                 je 0xf95
1:0F74  8b460c               mov ax, word ptr [bp + 0xc]
1:0F77  8b560e               mov dx, word ptr [bp + 0xe]
1:0F7A  8b4efa               mov cx, word ptr [bp - 6]
1:0F7D  1e                   push ds
1:0F7E  8bf0                 mov si, ax
1:0F80  8eda                 mov ds, dx
1:0F82  c47ef6               les di, ptr [bp - 0xa]
1:0F85  d1e9                 shr cx, 1
1:0F87  f3a5                 rep movsw word ptr es:[di], word ptr [si]
1:0F89  13c9                 adc cx, cx
1:0F8B  f3a4                 rep movsb byte ptr es:[di], byte ptr [si]
1:0F8D  1f                   pop ds
1:0F8E  52                   push dx
1:0F8F  50                   push ax
1:0F90  90                   nop
1:0F91  0e                   push cs
1:0F92  e831fe               call 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_0F95:
1:0F95  8b46f6               mov ax, word ptr [bp - 0xa]
1:0F98  8b56f8               mov dx, word ptr [bp - 8]
1:0F9B  5e                   pop si
1:0F9C  5f                   pop di
1:0F9D  c9                   leave
1:0F9E  ca0a00               retf 0xa
1:0FA1  db 90
loc_0FA2:
1:0FA2  8b460a               mov ax, word ptr [bp + 0xa]
1:0FA5  0b4608               or ax, word ptr [bp + 8]
1:0FA8  7503                 jne 0xfad
1:0FAA  e94bff               jmp 0xef8
loc_0FAD:
1:0FAD  ff76fe               push word ptr [bp - 2]
1:0FB0  ff76fc               push word ptr [bp - 4]
1:0FB3  6a05                 push 5
1:0FB5  e93bff               jmp 0xef3

; ---------------- SH_reallocInternal@s1:0FB8 size=420 callers=1
;   SmartHeap internal behind MemReAllocPtr
1:0FB8  c8080000             enter 8, 0
1:0FBC  52                   push dx
1:0FBD  50                   push ax
1:0FBE  53                   push bx
1:0FBF  57                   push di
1:0FC0  56                   push si
1:0FC1  8bc2                 mov ax, dx
1:0FC3  0b46f4               or ax, word ptr [bp - 0xc]
1:0FC6  7532                 jne 0xffa
1:0FC8  8b7606               mov si, word ptr [bp + 6]
1:0FCB  ff360200             push word ptr [2]
1:0FCF  ff360000             push word ptr [0]
1:0FD3  6a04                 push 4
1:0FD5  90                   nop
1:0FD6  0e                   push cs
1:0FD7  e8870e               call 0x1e61  ; SH_error@s1:1E61
1:0FDA  8b4608               mov ax, word ptr [bp + 8]
1:0FDD  0bc6                 or ax, si
1:0FDF  740f                 je 0xff0
1:0FE1  8e4608               mov es, word ptr [bp + 8]
1:0FE4  2bc0                 sub ax, ax
1:0FE6  26894402             mov word ptr es:[si + 2], ax
1:0FEA  268904               mov word ptr es:[si], ax
1:0FED  e96401               jmp 0x1154
loc_0FF0:
1:0FF0  b80100               mov ax, 1
1:0FF3  5e                   pop si
1:0FF4  5f                   pop di
1:0FF5  c9                   leave
1:0FF6  c20600               ret 6
1:0FF9  db 90
loc_0FFA:
1:0FFA  8a060c00             mov al, byte ptr [0xc]
1:0FFE  250700               and ax, 7
1:1001  7429                 je 0x102c
1:1003  48                   dec ax
1:1004  7503                 jne 0x1009
1:1006  e9d100               jmp 0x10da
loc_1009:
1:1009  48                   dec ax
1:100A  7420                 je 0x102c
1:100C  48                   dec ax
1:100D  7503                 jne 0x1012
1:100F  e9e400               jmp 0x10f6
loc_1012:
1:1012  8b5e06               mov bx, word ptr [bp + 6]
1:1015  8b4608               mov ax, word ptr [bp + 8]
1:1018  0bc3                 or ax, bx
1:101A  74d4                 je 0xff0
1:101C  8e4608               mov es, word ptr [bp + 8]
1:101F  2bc0                 sub ax, ax
1:1021  26894702             mov word ptr es:[bx + 2], ax
1:1025  268907               mov word ptr es:[bx], ax
1:1028  e92901               jmp 0x1154
1:102B  db 90
loc_102C:
1:102C  8b76f2               mov si, word ptr [bp - 0xe]
1:102F  83ee02               sub si, 2
1:1032  8b04                 mov ax, word ptr [si]
1:1034  25fc7f               and ax, 0x7ffc
1:1037  2d0200               sub ax, 2
1:103A  8946fe               mov word ptr [bp - 2], ax
1:103D  f6440180             test byte ptr [si + 1], 0x80
1:1041  7404                 je 0x1047
1:1043  836efe04             sub word ptr [bp - 2], 4
loc_1047:
1:1047  8b46fe               mov ax, word ptr [bp - 2]
1:104A  2bd2                 sub dx, dx
1:104C  3b56f6               cmp dx, word ptr [bp - 0xa]
1:104F  7725                 ja 0x1076
1:1051  7205                 jb 0x1058
1:1053  3b46f4               cmp ax, word ptr [bp - 0xc]
1:1056  731e                 jae 0x1076
loc_1058:
1:1058  c41e0000             les bx, ptr [0]
1:105C  268b471c             mov ax, word ptr es:[bx + 0x1c]
1:1060  3b56f6               cmp dx, word ptr [bp - 0xa]
1:1063  7711                 ja 0x1076
1:1065  7205                 jb 0x106c
1:1067  3b46f4               cmp ax, word ptr [bp - 0xc]
1:106A  730a                 jae 0x1076
loc_106C:
1:106C  8b46fe               mov ax, word ptr [bp - 2]
1:106F  5e                   pop si
1:1070  5f                   pop di
1:1071  c9                   leave
1:1072  c20600               ret 6
1:1075  db 90
loc_1076:
1:1076  8b46f4               mov ax, word ptr [bp - 0xc]
1:1079  8bde                 mov bx, si
1:107B  e8de00               call 0x115c  ; SH_reallocInPlace@s1:115C
1:107E  0bc0                 or ax, ax
1:1080  74ea                 je 0x106c
1:1082  f6460401             test byte ptr [bp + 4], 1
1:1086  7503                 jne 0x108b
1:1088  e9c900               jmp 0x1154
loc_108B:
1:108B  8b04                 mov ax, word ptr [si]
1:108D  25fc7f               and ax, 0x7ffc
1:1090  2d0200               sub ax, 2
1:1093  8946fc               mov word ptr [bp - 4], ax
1:1096  8b46fe               mov ax, word ptr [bp - 2]
1:1099  3946f4               cmp word ptr [bp - 0xc], ax
1:109C  7620                 jbe 0x10be
1:109E  33c0                 xor ax, ax
1:10A0  8b5efe               mov bx, word ptr [bp - 2]
1:10A3  035ef2               add bx, word ptr [bp - 0xe]
1:10A6  8b4efc               mov cx, word ptr [bp - 4]
1:10A9  2b4efe               sub cx, word ptr [bp - 2]
loc_10AC:
1:10AC  8bfb                 mov di, bx
1:10AE  1e                   push ds
1:10AF  07                   pop es
1:10B0  d1e9                 shr cx, 1
1:10B2  f3ab                 rep stosw word ptr es:[di], ax
1:10B4  7203                 jb 0x10b9
1:10B6  e99b00               jmp 0x1154
loc_10B9:
1:10B9  aa                   stosb byte ptr es:[di], al
1:10BA  e99700               jmp 0x1154
1:10BD  db 90
loc_10BE:
1:10BE  8b46fc               mov ax, word ptr [bp - 4]
1:10C1  3946f4               cmp word ptr [bp - 0xc], ax
1:10C4  7203                 jb 0x10c9
1:10C6  e98b00               jmp 0x1154
loc_10C9:
1:10C9  33c0                 xor ax, ax
1:10CB  8b5ef4               mov bx, word ptr [bp - 0xc]
1:10CE  035ef2               add bx, word ptr [bp - 0xe]
1:10D1  8b4efc               mov cx, word ptr [bp - 4]
1:10D4  2b4ef4               sub cx, word ptr [bp - 0xc]
1:10D7  ebd3                 jmp 0x10ac
1:10D9  db 90
loc_10DA:
1:10DA  c41e0000             les bx, ptr [0]
1:10DE  2bd2                 sub dx, dx
1:10E0  268b4718             mov ax, word ptr es:[bx + 0x18]
1:10E4  3b56f6               cmp dx, word ptr [bp - 0xa]
1:10E7  776b                 ja 0x1154
1:10E9  726b                 jb 0x1156
1:10EB  3b46f4               cmp ax, word ptr [bp - 0xc]
1:10EE  7364                 jae 0x1154
1:10F0  5e                   pop si
1:10F1  5f                   pop di
1:10F2  c9                   leave
1:10F3  c20600               ret 6
loc_10F6:
1:10F6  8b7606               mov si, word ptr [bp + 6]
1:10F9  8b4608               mov ax, word ptr [bp + 8]
1:10FC  0bc6                 or ax, si
1:10FE  7434                 je 0x1134
1:1100  c41e0000             les bx, ptr [0]
1:1104  2bd2                 sub dx, dx
1:1106  268b471c             mov ax, word ptr es:[bx + 0x1c]
1:110A  3b56f6               cmp dx, word ptr [bp - 0xa]
1:110D  7225                 jb 0x1134
1:110F  7705                 ja 0x1116
1:1111  3b46f4               cmp ax, word ptr [bp - 0xc]
1:1114  721e                 jb 0x1134
loc_1116:
1:1116  1e                   push ds
1:1117  ff76f2               push word ptr [bp - 0xe]
1:111A  90                   nop
1:111B  0e                   push cs
1:111C  e86501               call 0x1284  ; SH_MemSizePtr@s1:1284
1:111F  3b56f6               cmp dx, word ptr [bp - 0xa]
1:1122  7232                 jb 0x1156
1:1124  7705                 ja 0x112b
1:1126  3b46f4               cmp ax, word ptr [bp - 0xc]
1:1129  762b                 jbe 0x1156
loc_112B:
1:112B  8b46f4               mov ax, word ptr [bp - 0xc]
1:112E  5e                   pop si
1:112F  5f                   pop di
1:1130  c9                   leave
1:1131  c20600               ret 6
loc_1134:
1:1134  ff7608               push word ptr [bp + 8]
1:1137  56                   push si
1:1138  ff7604               push word ptr [bp + 4]
1:113B  33db                 xor bx, bx
1:113D  8b46f4               mov ax, word ptr [bp - 0xc]
1:1140  8b56f6               mov dx, word ptr [bp - 0xa]
1:1143  e82af5               call 0x670  ; SH_reallocLarge@s1:0670
1:1146  0bc0                 or ax, ax
1:1148  750a                 jne 0x1154
1:114A  8b4608               mov ax, word ptr [bp + 8]
1:114D  0bc6                 or ax, si
1:114F  7503                 jne 0x1154
1:1151  e99cfe               jmp 0xff0
loc_1154:
1:1154  33c0                 xor ax, ax
loc_1156:
1:1156  5e                   pop si
1:1157  5f                   pop di
1:1158  c9                   leave
1:1159  c20600               ret 6

; ---------------- SH_reallocInPlace@s1:115C size=296 callers=1
;   SmartHeap internal: grows a block in place
1:115C  c8060000             enter 6, 0
1:1160  57                   push di
1:1161  56                   push si
1:1162  8bfb                 mov di, bx
1:1164  8bc8                 mov cx, ax
1:1166  8b05                 mov ax, word ptr [di]
1:1168  25fc7f               and ax, 0x7ffc
1:116B  8946fa               mov word ptr [bp - 6], ax
1:116E  8bd1                 mov dx, cx
1:1170  83c205               add dx, 5
1:1173  80e2fc               and dl, 0xfc
1:1176  83ea08               sub dx, 8
1:1179  1bf6                 sbb si, si
1:117B  f7d6                 not si
1:117D  23d6                 and dx, si
1:117F  83c208               add dx, 8
1:1182  8bca                 mov cx, dx
1:1184  3bc8                 cmp cx, ax
1:1186  7752                 ja 0x11da
1:1188  2bc2                 sub ax, dx
1:118A  8946fe               mov word ptr [bp - 2], ax
1:118D  3b061200             cmp ax, word ptr [0x12]
1:1191  7303                 jae 0x1196
1:1193  e9d000               jmp 0x1266
loc_1196:
1:1196  8b5efa               mov bx, word ptr [bp - 6]
1:1199  03df                 add bx, di
1:119B  f60701               test byte ptr [bx], 1
1:119E  7526                 jne 0x11c6
1:11A0  8b07                 mov ax, word ptr [bx]
1:11A2  24fc                 and al, 0xfc
1:11A4  0146fe               add word ptr [bp - 2], ax
1:11A7  3b1e0e00             cmp bx, word ptr [0xe]
1:11AB  7507                 jne 0x11b4
1:11AD  8b4702               mov ax, word ptr [bx + 2]
1:11B0  89060e00             mov word ptr [0xe], ax
loc_11B4:
1:11B4  8b7704               mov si, word ptr [bx + 4]
1:11B7  8b4702               mov ax, word ptr [bx + 2]
1:11BA  894402               mov word ptr [si + 2], ax
1:11BD  8b7702               mov si, word ptr [bx + 2]
1:11C0  8b4704               mov ax, word ptr [bx + 4]
1:11C3  894404               mov word ptr [si + 4], ax
loc_11C6:
1:11C6  c41e0400             les bx, ptr [4]
1:11CA  268b07               mov ax, word ptr es:[bx]
1:11CD  3946fe               cmp word ptr [bp - 2], ax
1:11D0  7653                 jbe 0x1225
1:11D2  8b46fe               mov ax, word ptr [bp - 2]
1:11D5  268907               mov word ptr es:[bx], ax
1:11D8  eb4b                 jmp 0x1225
loc_11DA:
1:11DA  8bd8                 mov bx, ax
1:11DC  03df                 add bx, di
1:11DE  f60701               test byte ptr [bx], 1
1:11E1  7403                 je 0x11e6
1:11E3  e99800               jmp 0x127e
loc_11E6:
1:11E6  8b07                 mov ax, word ptr [bx]
1:11E8  24fc                 and al, 0xfc
1:11EA  0346fa               add ax, word ptr [bp - 6]
1:11ED  3bc2                 cmp ax, dx
1:11EF  7303                 jae 0x11f4
1:11F1  e98a00               jmp 0x127e
loc_11F4:
1:11F4  3b1e0e00             cmp bx, word ptr [0xe]
1:11F8  7507                 jne 0x1201
1:11FA  8b4702               mov ax, word ptr [bx + 2]
1:11FD  89060e00             mov word ptr [0xe], ax
loc_1201:
1:1201  8b7704               mov si, word ptr [bx + 4]
1:1204  8b4702               mov ax, word ptr [bx + 2]
1:1207  894402               mov word ptr [si + 2], ax
1:120A  8b7702               mov si, word ptr [bx + 2]
1:120D  8b4704               mov ax, word ptr [bx + 4]
1:1210  894404               mov word ptr [si + 4], ax
1:1213  8b07                 mov ax, word ptr [bx]
1:1215  24fc                 and al, 0xfc
1:1217  0346fa               add ax, word ptr [bp - 6]
1:121A  2bc2                 sub ax, dx
1:121C  8946fe               mov word ptr [bp - 2], ax
1:121F  3b061200             cmp ax, word ptr [0x12]
1:1223  7249                 jb 0x126e
loc_1225:
1:1225  8b05                 mov ax, word ptr [di]
1:1227  250380               and ax, 0x8003
1:122A  0bc2                 or ax, dx
1:122C  8905                 mov word ptr [di], ax
1:122E  8b46fe               mov ax, word ptr [bp - 2]
1:1231  8bda                 mov bx, dx
1:1233  0c02                 or al, 2
1:1235  8901                 mov word ptr [bx + di], ax
1:1237  03df                 add bx, di
1:1239  8b061000             mov ax, word ptr [0x10]
1:123D  894704               mov word ptr [bx + 4], ax
1:1240  8b361000             mov si, word ptr [0x10]
1:1244  8b4402               mov ax, word ptr [si + 2]
1:1247  894702               mov word ptr [bx + 2], ax
1:124A  8b361000             mov si, word ptr [0x10]
1:124E  8b7402               mov si, word ptr [si + 2]
1:1251  895c04               mov word ptr [si + 4], bx
1:1254  8b361000             mov si, word ptr [0x10]
1:1258  895c02               mov word ptr [si + 2], bx
1:125B  8b46fe               mov ax, word ptr [bp - 2]
1:125E  03d8                 add bx, ax
1:1260  8947fe               mov word ptr [bx - 2], ax
1:1263  8027fd               and byte ptr [bx], 0xfd
loc_1266:
1:1266  b80100               mov ax, 1
1:1269  5e                   pop si
1:126A  5f                   pop di
1:126B  c9                   leave
1:126C  c3                   ret
1:126D  db 90
loc_126E:
1:126E  8b07                 mov ax, word ptr [bx]
1:1270  24fc                 and al, 0xfc
1:1272  0105                 add word ptr [di], ax
1:1274  8b37                 mov si, word ptr [bx]
1:1276  83e6fc               and si, 0xfffc
1:1279  800802               or byte ptr [bx + si], 2
1:127C  ebe8                 jmp 0x1266
loc_127E:
1:127E  33c0                 xor ax, ax
1:1280  5e                   pop si
1:1281  5f                   pop di
1:1282  c9                   leave
1:1283  c3                   ret

; ---------------- SH_MemSizePtr@s1:1284 FAR size=152 callers=2
;   SmartHeap MemSizePtr(ptr): size of a block (page signature 0xCAD0)
1:1284  c8080000             enter 8, 0
1:1288  8b4608               mov ax, word ptr [bp + 8]
1:128B  8bc8                 mov cx, ax
1:128D  2bdb                 sub bx, bx
1:128F  8ec0                 mov es, ax
1:1291  895ef8               mov word ptr [bp - 8], bx
1:1294  268b060c00           mov ax, word ptr es:[0xc]
1:1299  24f8                 and al, 0xf8
1:129B  3dd0ca               cmp ax, 0xcad0
1:129E  7412                 je 0x12b2
1:12A0  53                   push bx
1:12A1  53                   push bx
1:12A2  6a0e                 push 0xe
1:12A4  90                   nop
1:12A5  0e                   push cs
1:12A6  e8b80b               call 0x1e61  ; SH_error@s1:1E61
loc_12A9:
1:12A9  b8ffff               mov ax, 0xffff
1:12AC  99                   cdq
1:12AD  c9                   leave
1:12AE  ca0400               retf 4
1:12B1  db 90
loc_12B2:
1:12B2  8b5ef8               mov bx, word ptr [bp - 8]
1:12B5  268a470c             mov al, byte ptr es:[bx + 0xc]
1:12B9  250700               and ax, 7
1:12BC  740c                 je 0x12ca
1:12BE  48                   dec ax
1:12BF  7437                 je 0x12f8
1:12C1  48                   dec ax
1:12C2  7406                 je 0x12ca
1:12C4  48                   dec ax
1:12C5  743f                 je 0x1306
1:12C7  ebe0                 jmp 0x12a9
1:12C9  db 90
loc_12CA:
1:12CA  c45e06               les bx, ptr [bp + 6]
1:12CD  268b47fe             mov ax, word ptr es:[bx - 2]
1:12D1  8bc8                 mov cx, ax
1:12D3  25fc7f               and ax, 0x7ffc
1:12D6  2d0200               sub ax, 2
1:12D9  8946fc               mov word ptr [bp - 4], ax
1:12DC  c746fe0000           mov word ptr [bp - 2], 0
1:12E1  f6c580               test ch, 0x80
1:12E4  7408                 je 0x12ee
1:12E6  836efc04             sub word ptr [bp - 4], 4
1:12EA  835efe00             sbb word ptr [bp - 2], 0
loc_12EE:
1:12EE  8b46fc               mov ax, word ptr [bp - 4]
1:12F1  8b56fe               mov dx, word ptr [bp - 2]
1:12F4  c9                   leave
1:12F5  ca0400               retf 4
loc_12F8:
1:12F8  26c41f               les bx, ptr es:[bx]
1:12FB  2bd2                 sub dx, dx
1:12FD  268b4718             mov ax, word ptr es:[bx + 0x18]
1:1301  c9                   leave
1:1302  ca0400               retf 4
1:1305  db 90
loc_1306:
1:1306  8bd1                 mov dx, cx
1:1308  2bc9                 sub cx, cx
1:130A  52                   push dx
1:130B  51                   push cx
1:130C  90                   nop
1:130D  0e                   push cs
1:130E  e82102               call 0x1532  ; SH_globalSize@s1:1532
1:1311  2d1400               sub ax, 0x14
1:1314  83da00               sbb dx, 0
1:1317  c9                   leave
1:1318  ca0400               retf 4
1:131B  db 90

; ---------------- SH_globalAllocPage@s1:131C FAR size=178 callers=2
;   apis: KERNEL.GlobalAlloc, KERNEL.GlobalLock, KERNEL.GlobalPageLock
;   SmartHeap: GlobalAlloc + GlobalLock + GlobalPageLock for a page
1:131C  c8080000             enter 8, 0
1:1320  57                   push di
1:1321  56                   push si
1:1322  8b5e06               mov bx, word ptr [bp + 6]
1:1325  be3200               mov si, 0x32
1:1328  c746fc0100           mov word ptr [bp - 4], 1
1:132D  f6c710               test bh, 0x10
1:1330  7416                 je 0x1348
1:1332  837e0a00             cmp word ptr [bp + 0xa], 0
1:1336  7506                 jne 0x133e
1:1338  837e08f0             cmp word ptr [bp + 8], -0x10
1:133C  760a                 jbe 0x1348
loc_133E:
1:133E  c74608f0ff           mov word ptr [bp + 8], 0xfff0
1:1343  c7460a0000           mov word ptr [bp + 0xa], 0
loc_1348:
1:1348  f6c701               test bh, 1
1:134B  7403                 je 0x1350
1:134D  be7200               mov si, 0x72
loc_1350:
1:1350  f6c301               test bl, 1
1:1353  7404                 je 0x1359
1:1355  81ce0020             or si, 0x2000
loc_1359:
1:1359  8ac3                 mov al, bl
1:135B  2404                 and al, 4
1:135D  7412                 je 0x1371
1:135F  83e6fd               and si, 0xfffd
1:1362  8b4608               mov ax, word ptr [bp + 8]
1:1365  8b560a               mov dx, word ptr [bp + 0xa]
1:1368  e8ed01               call 0x1558  ; SH_dosAlloc@s1:1558
1:136B  8946f8               mov word ptr [bp - 8], ax
1:136E  8956fa               mov word ptr [bp - 6], dx
loc_1371:
1:1371  8b7efc               mov di, word ptr [bp - 4]
loc_1374:
1:1374  56                   push si
1:1375  ff760a               push word ptr [bp + 0xa]
1:1378  ff7608               push word ptr [bp + 8]
1:137B  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalAlloc
1:1380  8946fe               mov word ptr [bp - 2], ax
1:1383  0bc0                 or ax, ax
1:1385  750a                 jne 0x1391
1:1387  83e6cf               and si, 0xffcf
1:138A  8bc7                 mov ax, di
1:138C  4f                   dec di
1:138D  0bc0                 or ax, ax
1:138F  75e3                 jne 0x1374
loc_1391:
1:1391  8a4606               mov al, byte ptr [bp + 6]
1:1394  2404                 and al, 4
1:1396  7417                 je 0x13af
1:1398  837efe00             cmp word ptr [bp - 2], 0
1:139C  7408                 je 0x13a6
1:139E  ff76fe               push word ptr [bp - 2]
1:13A1  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalPageLock
loc_13A6:
1:13A6  ff76fa               push word ptr [bp - 6]
1:13A9  ff76f8               push word ptr [bp - 8]
1:13AC  e81f02               call 0x15ce  ; SH_dosFree@s1:15CE
loc_13AF:
1:13AF  837efe00             cmp word ptr [bp - 2], 0
1:13B3  740f                 je 0x13c4
1:13B5  ff76fe               push word ptr [bp - 2]
1:13B8  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalLock
1:13BD  5e                   pop si
1:13BE  5f                   pop di
1:13BF  c9                   leave
1:13C0  ca0600               retf 6
1:13C3  db 90
loc_13C4:
1:13C4  33c0                 xor ax, ax
1:13C6  99                   cdq
1:13C7  5e                   pop si
1:13C8  5f                   pop di
1:13C9  c9                   leave
1:13CA  ca0600               retf 6
1:13CD  db 00

; ---------------- SH_globalFree@s1:13CE FAR size=58 callers=3
;   apis: KERNEL.GlobalFree, KERNEL.GlobalHandle
;   SmartHeap: GlobalHandle + GlobalFree
1:13CE  c8020000             enter 2, 0
1:13D2  ff7608               push word ptr [bp + 8]
1:13D5  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalHandle
1:13DA  8946fe               mov word ptr [bp - 2], ax
1:13DD  8cd8                 mov ax, ds
1:13DF  3b4608               cmp ax, word ptr [bp + 8]
1:13E2  7504                 jne 0x13e8
1:13E4  33c0                 xor ax, ax
1:13E6  8ed8                 mov ds, ax
loc_13E8:
1:13E8  837efe00             cmp word ptr [bp - 2], 0
1:13EC  7414                 je 0x1402
1:13EE  ff76fe               push word ptr [bp - 2]
1:13F1  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalFree
1:13F6  3d0100               cmp ax, 1
1:13F9  1bc0                 sbb ax, ax
1:13FB  f7d8                 neg ax
1:13FD  c9                   leave
1:13FE  ca0400               retf 4
1:1401  db 90
loc_1402:
1:1402  33c0                 xor ax, ax
1:1404  c9                   leave
1:1405  ca0400               retf 4

; ---------------- SH_globalReAlloc@s1:1408 FAR size=234 callers=2
;   apis: KERNEL.GlobalHandle, KERNEL.GlobalLock, KERNEL.GlobalPageLock, KERNEL.GlobalPageUnlock, KERNEL.GlobalReAlloc
;   SmartHeap: GlobalReAlloc of a large block
1:1408  c80c0000             enter 0xc, 0
1:140C  ff760e               push word ptr [bp + 0xe]
1:140F  9ad6130000           lcall 0, 0x13d6  ; KERNEL.GlobalHandle
1:1414  8946fe               mov word ptr [bp - 2], ax
1:1417  c746fa3200           mov word ptr [bp - 6], 0x32
1:141C  c746f80000           mov word ptr [bp - 8], 0
1:1421  c746f60100           mov word ptr [bp - 0xa], 1
1:1426  f6460710             test byte ptr [bp + 7], 0x10
1:142A  7416                 je 0x1442
1:142C  837e0a00             cmp word ptr [bp + 0xa], 0
1:1430  7506                 jne 0x1438
1:1432  837e08f0             cmp word ptr [bp + 8], -0x10
1:1436  760a                 jbe 0x1442
loc_1438:
1:1438  c74608f0ff           mov word ptr [bp + 8], 0xfff0
1:143D  c7460a0000           mov word ptr [bp + 0xa], 0
loc_1442:
1:1442  f6460701             test byte ptr [bp + 7], 1
1:1446  7404                 je 0x144c
1:1448  804efa40             or byte ptr [bp - 6], 0x40
loc_144C:
1:144C  f746060408           test word ptr [bp + 6], 0x804
1:1451  7404                 je 0x1457
1:1453  8066fafd             and byte ptr [bp - 6], 0xfd
loc_1457:
1:1457  0bc0                 or ax, ax
1:1459  7503                 jne 0x145e
1:145B  e98e00               jmp 0x14ec
loc_145E:
1:145E  f6460604             test byte ptr [bp + 6], 4
1:1462  7406                 je 0x146a
1:1464  50                   push ax
1:1465  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalPageUnlock
loc_146A:
1:146A  837e0a00             cmp word ptr [bp + 0xa], 0
1:146E  7506                 jne 0x1476
1:1470  837e08f0             cmp word ptr [bp + 8], -0x10
1:1474  7610                 jbe 0x1486
loc_1476:
1:1476  8cd8                 mov ax, ds
1:1478  3b460e               cmp ax, word ptr [bp + 0xe]
1:147B  7504                 jne 0x1481
1:147D  33c0                 xor ax, ax
1:147F  8ed8                 mov ds, ax
loc_1481:
1:1481  c746f80100           mov word ptr [bp - 8], 1
loc_1486:
1:1486  ff76fe               push word ptr [bp - 2]
1:1489  ff760a               push word ptr [bp + 0xa]
1:148C  ff7608               push word ptr [bp + 8]
1:148F  ff76fa               push word ptr [bp - 6]
1:1492  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalReAlloc
1:1497  8946fc               mov word ptr [bp - 4], ax
1:149A  0bc0                 or ax, ax
1:149C  750e                 jne 0x14ac
1:149E  8066facf             and byte ptr [bp - 6], 0xcf
1:14A2  8b46f6               mov ax, word ptr [bp - 0xa]
1:14A5  ff4ef6               dec word ptr [bp - 0xa]
1:14A8  0bc0                 or ax, ax
1:14AA  75da                 jne 0x1486
loc_14AC:
1:14AC  837ef800             cmp word ptr [bp - 8], 0
1:14B0  7411                 je 0x14c3
1:14B2  837efc00             cmp word ptr [bp - 4], 0
1:14B6  7408                 je 0x14c0
1:14B8  8b46fe               mov ax, word ptr [bp - 2]
1:14BB  3946fc               cmp word ptr [bp - 4], ax
1:14BE  7503                 jne 0x14c3
loc_14C0:
1:14C0  8e5e0e               mov ds, word ptr [bp + 0xe]
loc_14C3:
1:14C3  837efc00             cmp word ptr [bp - 4], 0
1:14C7  740e                 je 0x14d7
1:14C9  f6460604             test byte ptr [bp + 6], 4
1:14CD  7408                 je 0x14d7
1:14CF  ff76fc               push word ptr [bp - 4]
1:14D2  9aa2130000           lcall 0, 0x13a2  ; KERNEL.GlobalPageLock
loc_14D7:
1:14D7  837efc00             cmp word ptr [bp - 4], 0
1:14DB  740d                 je 0x14ea
1:14DD  ff76fc               push word ptr [bp - 4]
1:14E0  9ab9130000           lcall 0, 0x13b9  ; KERNEL.GlobalLock
1:14E5  c9                   leave
1:14E6  ca0a00               retf 0xa
1:14E9  db 90
loc_14EA:
1:14EA  33c0                 xor ax, ax
loc_14EC:
1:14EC  99                   cdq
1:14ED  c9                   leave
1:14EE  ca0a00               retf 0xa
1:14F1  db 00

; ---------------- SH_globalReAllocChecked@s1:14F2 FAR size=64 callers=2
;   SmartHeap: GlobalReAlloc with size check
1:14F2  55                   push bp
1:14F3  8bec                 mov bp, sp
1:14F5  8b4e06               mov cx, word ptr [bp + 6]
1:14F8  f6c510               test ch, 0x10
1:14FB  750c                 jne 0x1509
1:14FD  837e0a00             cmp word ptr [bp + 0xa], 0
1:1501  7529                 jne 0x152c
1:1503  837e08f0             cmp word ptr [bp + 8], -0x10
1:1507  7723                 ja 0x152c
loc_1509:
1:1509  ff760e               push word ptr [bp + 0xe]
1:150C  ff760c               push word ptr [bp + 0xc]
1:150F  ff760a               push word ptr [bp + 0xa]
1:1512  ff7608               push word ptr [bp + 8]
1:1515  80e5fd               and ch, 0xfd
1:1518  80cd08               or ch, 8
1:151B  51                   push cx
1:151C  90                   nop
1:151D  0e                   push cs
1:151E  e8e7fe               call 0x1408  ; SH_globalReAlloc@s1:1408
1:1521  0bd0                 or dx, ax
1:1523  7407                 je 0x152c
1:1525  b80100               mov ax, 1
1:1528  c9                   leave
1:1529  ca0a00               retf 0xa
loc_152C:
1:152C  33c0                 xor ax, ax
1:152E  c9                   leave
1:152F  ca0a00               retf 0xa

; ---------------- SH_globalSize@s1:1532 FAR size=38 callers=6
;   apis: KERNEL.GlobalHandle, KERNEL.GlobalSize
;   SmartHeap: GlobalHandle + GlobalSize
1:1532  55                   push bp
1:1533  8bec                 mov bp, sp
1:1535  56                   push si
1:1536  ff7608               push word ptr [bp + 8]
1:1539  9a10140000           lcall 0, 0x1410  ; KERNEL.GlobalHandle
1:153E  8bf0                 mov si, ax
1:1540  0bf0                 or si, ax
1:1542  740c                 je 0x1550
1:1544  56                   push si
1:1545  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalSize
1:154A  5e                   pop si
1:154B  c9                   leave
1:154C  ca0400               retf 4
1:154F  db 90
loc_1550:
1:1550  33c0                 xor ax, ax
1:1552  99                   cdq
1:1553  5e                   pop si
1:1554  c9                   leave
1:1555  ca0400               retf 4

; ---------------- SH_dosAlloc@s1:1558 size=118 callers=1
;   apis: KERNEL.GlobalDOSAlloc
;   SmartHeap: GlobalDOSAlloc (fixed low memory)
1:1558  c80c0000             enter 0xc, 0
1:155C  52                   push dx
1:155D  50                   push ax
1:155E  56                   push si
1:155F  2bc0                 sub ax, ax
1:1561  8946f6               mov word ptr [bp - 0xa], ax
1:1564  8946f4               mov word ptr [bp - 0xc], ax
1:1567  8946f8               mov word ptr [bp - 8], ax
1:156A  c746fa0800           mov word ptr [bp - 6], 8
1:156F  83fa08               cmp dx, 8
1:1572  7750                 ja 0x15c4
1:1574  7205                 jb 0x157b
1:1576  3946f0               cmp word ptr [bp - 0x10], ax
1:1579  7549                 jne 0x15c4
loc_157B:
1:157B  ff76fa               push word ptr [bp - 6]
1:157E  ff76f8               push word ptr [bp - 8]
1:1581  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalDOSAlloc
1:1586  8bd0                 mov dx, ax
1:1588  2bc9                 sub cx, cx
1:158A  8bf1                 mov si, cx
1:158C  8946fe               mov word ptr [bp - 2], ax
1:158F  0bd1                 or dx, cx
1:1591  7419                 je 0x15ac
1:1593  8b46f4               mov ax, word ptr [bp - 0xc]
1:1596  8b56f6               mov dx, word ptr [bp - 0xa]
1:1599  8e46fe               mov es, word ptr [bp - 2]
1:159C  268904               mov word ptr es:[si], ax
1:159F  26895402             mov word ptr es:[si + 2], dx
1:15A3  894ef4               mov word ptr [bp - 0xc], cx
1:15A6  8c46f6               mov word ptr [bp - 0xa], es
1:15A9  ebd0                 jmp 0x157b
1:15AB  db 90
loc_15AC:
1:15AC  8b46f0               mov ax, word ptr [bp - 0x10]
1:15AF  8b56f2               mov dx, word ptr [bp - 0xe]
1:15B2  d16efa               shr word ptr [bp - 6], 1
1:15B5  d15ef8               rcr word ptr [bp - 8], 1
1:15B8  3956fa               cmp word ptr [bp - 6], dx
1:15BB  77be                 ja 0x157b
1:15BD  7205                 jb 0x15c4
1:15BF  3946f8               cmp word ptr [bp - 8], ax
1:15C2  73b7                 jae 0x157b
loc_15C4:
1:15C4  8b46f4               mov ax, word ptr [bp - 0xc]
1:15C7  8b56f6               mov dx, word ptr [bp - 0xa]
1:15CA  5e                   pop si
1:15CB  c9                   leave
1:15CC  c3                   ret
1:15CD  db 00

; ---------------- SH_dosFree@s1:15CE size=60 callers=1
;   apis: KERNEL.GlobalDOSFree
;   SmartHeap: GlobalDOSFree of a chain
1:15CE  c8080000             enter 8, 0
1:15D2  57                   push di
1:15D3  56                   push si
1:15D4  8b4604               mov ax, word ptr [bp + 4]
1:15D7  8b5606               mov dx, word ptr [bp + 6]
1:15DA  8bf0                 mov si, ax
1:15DC  8956fa               mov word ptr [bp - 6], dx
1:15DF  0bd0                 or dx, ax
1:15E1  7421                 je 0x1604
loc_15E3:
1:15E3  8e46fa               mov es, word ptr [bp - 6]
1:15E6  268b04               mov ax, word ptr es:[si]
1:15E9  268b5402             mov dx, word ptr es:[si + 2]
1:15ED  8bf8                 mov di, ax
1:15EF  8956fe               mov word ptr [bp - 2], dx
1:15F2  06                   push es
1:15F3  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalDOSFree
1:15F8  8b46fe               mov ax, word ptr [bp - 2]
1:15FB  8bf7                 mov si, di
1:15FD  8946fa               mov word ptr [bp - 6], ax
1:1600  0bc7                 or ax, di
1:1602  75df                 jne 0x15e3
loc_1604:
1:1604  5e                   pop si
1:1605  5f                   pop di
1:1606  c9                   leave
1:1607  c20400               ret 4

; ---------------- SH_DefaultPool@s1:160A FAR size=112 callers=32
;   SmartHeap: creates the default pool on first use
1:160A  90                   nop
1:160B  0e                   push cs
1:160C  e8370b               call 0x2146  ; SH_hookTrue@s1:2146
1:160F  0bc0                 or ax, ax
1:1611  7503                 jne 0x1616
1:1613  99                   cdq
1:1614  cb                   retf
1:1615  db 90
loc_1616:
1:1616  a12e5f               mov ax, word ptr [0x5f2e]  ; g_defaultHeap+2
1:1619  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:161D  754e                 jne 0x166d
1:161F  b80100               mov ax, 1
1:1622  a3305f               mov word ptr [0x5f30], ax
1:1625  a3325f               mov word ptr [0x5f32], ax
1:1628  ff36465f             push word ptr [0x5f46]
1:162C  90                   nop
1:162D  0e                   push cs
1:162E  e8bb02               call 0x18ec  ; SH_MemPoolInitDefault@s1:18EC
1:1631  a32c5f               mov word ptr [0x5f2c], ax  ; g_defaultHeap
1:1634  89162e5f             mov word ptr [0x5f2e], dx  ; g_defaultHeap+2
1:1638  8bc2                 mov ax, dx
1:163A  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:163E  742d                 je 0x166d
1:1640  833e425f00           cmp word ptr [0x5f42], 0
1:1645  740e                 je 0x1655
1:1647  52                   push dx
1:1648  ff362c5f             push word ptr [0x5f2c]  ; g_defaultHeap
1:164C  ff36425f             push word ptr [0x5f42]
1:1650  90                   nop
1:1651  0e                   push cs
1:1652  e8ff03               call 0x1a54  ; SH_MemPoolSetPageSize@s1:1A54
loc_1655:
1:1655  833e445fff           cmp word ptr [0x5f44], -1
1:165A  7411                 je 0x166d
1:165C  ff362e5f             push word ptr [0x5f2e]  ; g_defaultHeap+2
1:1660  ff362c5f             push word ptr [0x5f2c]  ; g_defaultHeap
1:1664  ff36445f             push word ptr [0x5f44]
1:1668  90                   nop
1:1669  0e                   push cs
1:166A  e89104               call 0x1afe  ; SH_MemPoolSetBlockSizeFS@s1:1AFE
loc_166D:
1:166D  90                   nop
1:166E  0e                   push cs
1:166F  e8d80a               call 0x214a  ; SH_hookNop@s1:214A
1:1672  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
1:1675  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
1:1679  cb                   retf

; ---------------- _fmalloc@s1:167A FAR size=48 callers=5
;   C runtime malloc (SmartHeap default pool)
1:167A  55                   push bp
1:167B  8bec                 mov bp, sp
1:167D  a12e5f               mov ax, word ptr [0x5f2e]  ; g_defaultHeap+2
1:1680  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:1684  750e                 jne 0x1694
1:1686  90                   nop
1:1687  0e                   push cs
1:1688  e87fff               call 0x160a  ; SH_DefaultPool@s1:160A
1:168B  0bd0                 or dx, ax
1:168D  7505                 jne 0x1694
1:168F  33c0                 xor ax, ax
1:1691  99                   cdq
1:1692  c9                   leave
1:1693  cb                   retf
loc_1694:
1:1694  ff362e5f             push word ptr [0x5f2e]  ; g_defaultHeap+2
1:1698  ff362c5f             push word ptr [0x5f2c]  ; g_defaultHeap
1:169C  6a00                 push 0
1:169E  ff7606               push word ptr [bp + 6]
1:16A1  6a00                 push 0
1:16A3  90                   nop
1:16A4  0e                   push cs
1:16A5  e8a0f3               call 0xa48  ; SH_MemAllocPtr_core@s1:0A48
1:16A8  c9                   leave
1:16A9  cb                   retf

; ---------------- _frealloc@s1:16AA FAR size=68 callers=1
;   C runtime realloc (malloc when NULL)
1:16AA  55                   push bp
1:16AB  8bec                 mov bp, sp
1:16AD  8b4608               mov ax, word ptr [bp + 8]
1:16B0  0b4606               or ax, word ptr [bp + 6]
1:16B3  750d                 jne 0x16c2
1:16B5  ff760a               push word ptr [bp + 0xa]
1:16B8  90                   nop
1:16B9  0e                   push cs
1:16BA  e8bdff               call 0x167a  ; _fmalloc@s1:167A
1:16BD  8be5                 mov sp, bp
1:16BF  c9                   leave
1:16C0  cb                   retf
1:16C1  db 90
loc_16C2:
1:16C2  8b4e0a               mov cx, word ptr [bp + 0xa]
1:16C5  0bc9                 or cx, cx
1:16C7  7513                 jne 0x16dc
1:16C9  ff7608               push word ptr [bp + 8]
1:16CC  ff7606               push word ptr [bp + 6]
1:16CF  90                   nop
1:16D0  0e                   push cs
1:16D1  e81a00               call 0x16ee  ; _ffree@s1:16EE
1:16D4  8be5                 mov sp, bp
1:16D6  33c0                 xor ax, ax
1:16D8  99                   cdq
1:16D9  c9                   leave
1:16DA  cb                   retf
1:16DB  db 90
loc_16DC:
1:16DC  ff7608               push word ptr [bp + 8]
1:16DF  ff7606               push word ptr [bp + 6]
1:16E2  6a00                 push 0
1:16E4  51                   push cx
1:16E5  6a00                 push 0
1:16E7  90                   nop
1:16E8  0e                   push cs
1:16E9  e8e8f7               call 0xed4  ; SH_MemReAllocPtr@s1:0ED4
1:16EC  c9                   leave
1:16ED  cb                   retf

; ---------------- _ffree@s1:16EE FAR size=26 callers=2
;   C runtime free
1:16EE  55                   push bp
1:16EF  8bec                 mov bp, sp
1:16F1  8b4e06               mov cx, word ptr [bp + 6]
1:16F4  8b4608               mov ax, word ptr [bp + 8]
1:16F7  0bc1                 or ax, cx
1:16F9  740a                 je 0x1705
1:16FB  8b4608               mov ax, word ptr [bp + 8]
1:16FE  50                   push ax
1:16FF  51                   push cx
1:1700  90                   nop
1:1701  0e                   push cs
1:1702  e8c1f6               call 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_1705:
1:1705  c9                   leave
1:1706  cb                   retf
1:1707  db 00

; ---------------- SH_MemAllocPtr@s1:1708 FAR size=148 callers=29
;   SmartHeap MemAllocPtr(pool, size, flags)
1:1708  c8040000             enter 4, 0
1:170C  57                   push di
1:170D  56                   push si
1:170E  8b4608               mov ax, word ptr [bp + 8]
1:1711  0b4606               or ax, word ptr [bp + 6]
1:1714  7508                 jne 0x171e
1:1716  83460601             add word ptr [bp + 6], 1
1:171A  83560800             adc word ptr [bp + 8], 0
loc_171E:
1:171E  8b760c               mov si, word ptr [bp + 0xc]
1:1721  8b7e0a               mov di, word ptr [bp + 0xa]
loc_1724:
1:1724  8b460e               mov ax, word ptr [bp + 0xe]
1:1727  0bc6                 or ax, si
1:1729  7417                 je 0x1742
1:172B  ff760e               push word ptr [bp + 0xe]
1:172E  56                   push si
1:172F  ff7608               push word ptr [bp + 8]
1:1732  ff7606               push word ptr [bp + 6]
1:1735  57                   push di
1:1736  90                   nop
1:1737  0e                   push cs
1:1738  e80df3               call 0xa48  ; SH_MemAllocPtr_core@s1:0A48
1:173B  8956fe               mov word ptr [bp - 2], dx
1:173E  0bd0                 or dx, ax
1:1740  754a                 jne 0x178c
loc_1742:
1:1742  f7c70080             test di, 0x8000
1:1746  741e                 je 0x1766
1:1748  a13a5f               mov ax, word ptr [0x5f3a]
1:174B  0b06385f             or ax, word ptr [0x5f38]
1:174F  7415                 je 0x1766
1:1751  6a01                 push 1
1:1753  ff7608               push word ptr [bp + 8]
1:1756  ff7606               push word ptr [bp + 6]
1:1759  ff1e385f             lcall [0x5f38]
1:175D  83c406               add sp, 6
loc_1760:
1:1760  0bc0                 or ax, ax
1:1762  75c0                 jne 0x1724
1:1764  eb2e                 jmp 0x1794
loc_1766:
1:1766  a1365f               mov ax, word ptr [0x5f36]
1:1769  0b06345f             or ax, word ptr [0x5f34]
1:176D  740d                 je 0x177c
1:176F  ff7606               push word ptr [bp + 6]
1:1772  ff1e345f             lcall [0x5f34]
1:1776  83c402               add sp, 2
1:1779  ebe5                 jmp 0x1760
1:177B  db 90
loc_177C:
1:177C  a13e5f               mov ax, word ptr [0x5f3e]
1:177F  0b063c5f             or ax, word ptr [0x5f3c]
1:1783  740f                 je 0x1794
1:1785  ff1e3c5f             lcall [0x5f3c]
1:1789  eb99                 jmp 0x1724
1:178B  db 90
loc_178C:
1:178C  8b56fe               mov dx, word ptr [bp - 2]
1:178F  5e                   pop si
1:1790  5f                   pop di
1:1791  c9                   leave
1:1792  cb                   retf
1:1793  db 90
loc_1794:
1:1794  33c0                 xor ax, ax
1:1796  99                   cdq
1:1797  5e                   pop si
1:1798  5f                   pop di
1:1799  c9                   leave
1:179A  cb                   retf
1:179B  db 00

; ---------------- operator_new@s1:179C FAR size=50 callers=297
;   C++ operator new (SmartHeap default pool)
1:179C  c8040000             enter 4, 0
1:17A0  a12e5f               mov ax, word ptr [0x5f2e]  ; g_defaultHeap+2
1:17A3  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:17A7  7409                 je 0x17b2
1:17A9  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
1:17AC  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
1:17B0  eb05                 jmp 0x17b7
loc_17B2:
1:17B2  90                   nop
1:17B3  0e                   push cs
1:17B4  e853fe               call 0x160a  ; SH_DefaultPool@s1:160A
loc_17B7:
1:17B7  8956fe               mov word ptr [bp - 2], dx
1:17BA  52                   push dx
1:17BB  50                   push ax
1:17BC  6a00                 push 0
1:17BE  6a00                 push 0
1:17C0  ff7606               push word ptr [bp + 6]
1:17C3  90                   nop
1:17C4  0e                   push cs
1:17C5  e840ff               call 0x1708  ; SH_MemAllocPtr@s1:1708
1:17C8  83c40a               add sp, 0xa
1:17CB  c9                   leave
1:17CC  cb                   retf
1:17CD  db 00

; ---------------- operator_delete@s1:17CE FAR size=26 callers=579
;   C++ operator delete
1:17CE  55                   push bp
1:17CF  8bec                 mov bp, sp
1:17D1  8b4e06               mov cx, word ptr [bp + 6]
1:17D4  8b4608               mov ax, word ptr [bp + 8]
1:17D7  0bc1                 or ax, cx
1:17D9  740a                 je 0x17e5
1:17DB  8b4608               mov ax, word ptr [bp + 8]
1:17DE  50                   push ax
1:17DF  51                   push cx
1:17E0  90                   nop
1:17E1  0e                   push cs
1:17E2  e8e1f5               call 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_17E5:
1:17E5  c9                   leave
1:17E6  cb                   retf
1:17E7  db 00

; ---------------- _set_new_handler@s1:17E8 FAR size=36 callers=0
;   swaps the new-handler (DGROUP 0x5F34)
1:17E8  c8040000             enter 4, 0
1:17EC  a1345f               mov ax, word ptr [0x5f34]
1:17EF  8b16365f             mov dx, word ptr [0x5f36]
1:17F3  8bd8                 mov bx, ax
1:17F5  8956fe               mov word ptr [bp - 2], dx
1:17F8  8b4606               mov ax, word ptr [bp + 6]
1:17FB  8b5608               mov dx, word ptr [bp + 8]
1:17FE  a3345f               mov word ptr [0x5f34], ax
1:1801  8916365f             mov word ptr [0x5f36], dx
1:1805  8bc3                 mov ax, bx
1:1807  8b56fe               mov dx, word ptr [bp - 2]
1:180A  c9                   leave
1:180B  cb                   retf

; ---------------- _nmalloc_pool@s1:180C FAR size=48 callers=1
;   malloc from the default pool
1:180C  55                   push bp
1:180D  8bec                 mov bp, sp
1:180F  a12e5f               mov ax, word ptr [0x5f2e]  ; g_defaultHeap+2
1:1812  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:1816  750e                 jne 0x1826
1:1818  90                   nop
1:1819  0e                   push cs
1:181A  e8edfd               call 0x160a  ; SH_DefaultPool@s1:160A
1:181D  0bd0                 or dx, ax
1:181F  7505                 jne 0x1826
1:1821  33c0                 xor ax, ax
1:1823  99                   cdq
1:1824  c9                   leave
1:1825  cb                   retf
loc_1826:
1:1826  ff362e5f             push word ptr [0x5f2e]  ; g_defaultHeap+2
1:182A  ff362c5f             push word ptr [0x5f2c]  ; g_defaultHeap
1:182E  6a00                 push 0
1:1830  ff7606               push word ptr [bp + 6]
1:1833  6a00                 push 0
1:1835  90                   nop
1:1836  0e                   push cs
1:1837  e80ef2               call 0xa48  ; SH_MemAllocPtr_core@s1:0A48
1:183A  c9                   leave
1:183B  cb                   retf

; ---------------- _nmalloc?@s1:183C size=82 callers=0
;   C runtime near malloc through SmartHeap
1:183C  c8040000             enter 4, 0
1:1840  8b4608               mov ax, word ptr [bp + 8]
1:1843  f76606               mul word ptr [bp + 6]
1:1846  8946fc               mov word ptr [bp - 4], ax
1:1849  8956fe               mov word ptr [bp - 2], dx
1:184C  8bda                 mov bx, dx
1:184E  2bd2                 sub dx, dx
1:1850  3bd3                 cmp dx, bx
1:1852  7406                 je 0x185a
loc_1854:
1:1854  33c0                 xor ax, ax
1:1856  99                   cdq
1:1857  c9                   leave
1:1858  cb                   retf
1:1859  db 90
loc_185A:
1:185A  a12e5f               mov ax, word ptr [0x5f2e]  ; g_defaultHeap+2
1:185D  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:1861  7514                 jne 0x1877
1:1863  90                   nop
1:1864  0e                   push cs
1:1865  e8a2fd               call 0x160a  ; SH_DefaultPool@s1:160A
1:1868  a32c5f               mov word ptr [0x5f2c], ax  ; g_defaultHeap
1:186B  89162e5f             mov word ptr [0x5f2e], dx  ; g_defaultHeap+2
1:186F  8bc2                 mov ax, dx
1:1871  0b062c5f             or ax, word ptr [0x5f2c]  ; g_defaultHeap
1:1875  74dd                 je 0x1854
loc_1877:
1:1877  ff362e5f             push word ptr [0x5f2e]  ; g_defaultHeap+2
1:187B  ff362c5f             push word ptr [0x5f2c]  ; g_defaultHeap
1:187F  ff76fe               push word ptr [bp - 2]
1:1882  ff76fc               push word ptr [bp - 4]
1:1885  6a01                 push 1
1:1887  90                   nop
1:1888  0e                   push cs
1:1889  e8bcf1               call 0xa48  ; SH_MemAllocPtr_core@s1:0A48
1:188C  c9                   leave
1:188D  cb                   retf

; ---------------- _nrealloc_pool@s1:188E FAR size=68 callers=0
;   realloc in the default pool
1:188E  55                   push bp
1:188F  8bec                 mov bp, sp
1:1891  8b4608               mov ax, word ptr [bp + 8]
1:1894  0b4606               or ax, word ptr [bp + 6]
1:1897  750d                 jne 0x18a6
1:1899  ff760a               push word ptr [bp + 0xa]
1:189C  90                   nop
1:189D  0e                   push cs
1:189E  e86bff               call 0x180c  ; _nmalloc_pool@s1:180C
1:18A1  8be5                 mov sp, bp
1:18A3  c9                   leave
1:18A4  cb                   retf
1:18A5  db 90
loc_18A6:
1:18A6  8b4e0a               mov cx, word ptr [bp + 0xa]
1:18A9  0bc9                 or cx, cx
1:18AB  7513                 jne 0x18c0
1:18AD  ff7608               push word ptr [bp + 8]
1:18B0  ff7606               push word ptr [bp + 6]
1:18B3  90                   nop
1:18B4  0e                   push cs
1:18B5  e81a00               call 0x18d2  ; _nfree_pool@s1:18D2
1:18B8  8be5                 mov sp, bp
1:18BA  33c0                 xor ax, ax
1:18BC  99                   cdq
1:18BD  c9                   leave
1:18BE  cb                   retf
1:18BF  db 90
loc_18C0:
1:18C0  ff7608               push word ptr [bp + 8]
1:18C3  ff7606               push word ptr [bp + 6]
1:18C6  6a00                 push 0
1:18C8  51                   push cx
1:18C9  6a00                 push 0
1:18CB  90                   nop
1:18CC  0e                   push cs
1:18CD  e804f6               call 0xed4  ; SH_MemReAllocPtr@s1:0ED4
1:18D0  c9                   leave
1:18D1  cb                   retf

; ---------------- _nfree_pool@s1:18D2 FAR size=26 callers=1
;   free in the default pool
1:18D2  55                   push bp
1:18D3  8bec                 mov bp, sp
1:18D5  8b4e06               mov cx, word ptr [bp + 6]
1:18D8  8b4608               mov ax, word ptr [bp + 8]
1:18DB  0bc1                 or ax, cx
1:18DD  740a                 je 0x18e9
1:18DF  8b4608               mov ax, word ptr [bp + 8]
1:18E2  50                   push ax
1:18E3  51                   push cx
1:18E4  90                   nop
1:18E5  0e                   push cs
1:18E6  e8ddf4               call 0xdc6  ; SH_MemFreePtr@s1:0DC6
loc_18E9:
1:18E9  c9                   leave
1:18EA  cb                   retf
1:18EB  db 90

; ---------------- SH_MemPoolInitDefault@s1:18EC FAR size=22 callers=1
;   SmartHeap MemPoolInit(flags) wrapper
1:18EC  55                   push bp
1:18ED  8bec                 mov bp, sp
1:18EF  6a0c                 push 0xc
1:18F1  6a00                 push 0
1:18F3  6a00                 push 0
1:18F5  ff7606               push word ptr [bp + 6]
1:18F8  90                   nop
1:18F9  0e                   push cs
1:18FA  e80500               call 0x1902  ; SH_MemPoolInit@s1:1902
1:18FD  c9                   leave
1:18FE  ca0200               retf 2
1:1901  db 00

; ---------------- SH_MemPoolInit@s1:1902 FAR size=338 callers=2
;   SmartHeap MemPoolInit: creates a pool (WinMain creates the game pool)
1:1902  c8040000             enter 4, 0
1:1906  57                   push di
1:1907  56                   push si
1:1908  f6460780             test byte ptr [bp + 7], 0x80
1:190C  7419                 je 0x1927
1:190E  bb701e               mov bx, 0x1e70
1:1911  b9ffff               mov cx, 0xffff  ; SEGMENT s1:0000
1:1914  83c301               add bx, 1
1:1917  83d100               adc cx, 0
1:191A  8ec1                 mov es, cx
1:191C  26813f9090           cmp word ptr es:[bx], 0x9090
1:1921  7404                 je 0x1927
1:1923  804e0601             or byte ptr [bp + 6], 1
loc_1927:
1:1927  b81a5f               mov ax, 0x5f1a
1:192A  8cd9                 mov cx, ds
1:192C  0bc8                 or cx, ax
1:192E  750a                 jne 0x193a
loc_1930:
1:1930  33c0                 xor ax, ax
1:1932  99                   cdq
1:1933  5e                   pop si
1:1934  5f                   pop di
1:1935  c9                   leave
1:1936  ca0800               retf 8
1:1939  db 90
loc_193A:
1:193A  6a00                 push 0
1:193C  680001               push 0x100
1:193F  8b4606               mov ax, word ptr [bp + 6]
1:1942  24fb                 and al, 0xfb
1:1944  80cc10               or ah, 0x10
1:1947  50                   push ax
1:1948  90                   nop
1:1949  0e                   push cs
1:194A  e8cff9               call 0x131c  ; SH_globalAllocPage@s1:131C
1:194D  8bf0                 mov si, ax
1:194F  8956fe               mov word ptr [bp - 2], dx
1:1952  0bd0                 or dx, ax
1:1954  750f                 jne 0x1965
1:1956  6a00                 push 0
1:1958  6a00                 push 0
1:195A  6a02                 push 2
1:195C  90                   nop
1:195D  0e                   push cs
1:195E  e80005               call 0x1e61  ; SH_error@s1:1E61
1:1961  0bc0                 or ax, ax
1:1963  75d5                 jne 0x193a
loc_1965:
1:1965  8b46fe               mov ax, word ptr [bp - 2]
1:1968  0bc6                 or ax, si
1:196A  74c4                 je 0x1930
1:196C  b81a5f               mov ax, 0x5f1a
1:196F  8e46fe               mov es, word ptr [bp - 2]
1:1972  2689442e             mov word ptr es:[si + 0x2e], ax
1:1976  8bd8                 mov bx, ax
1:1978  268c5c30             mov word ptr es:[si + 0x30], ds
1:197C  8b4704               mov ax, word ptr [bx + 4]
1:197F  8b5706               mov dx, word ptr [bx + 6]
1:1982  2689442a             mov word ptr es:[si + 0x2a], ax
1:1986  2689542c             mov word ptr es:[si + 0x2c], dx
1:198A  897704               mov word ptr [bx + 4], si
1:198D  8c4706               mov word ptr [bx + 6], es
1:1990  33c0                 xor ax, ax
1:1992  b90500               mov cx, 5
1:1995  8bfe                 mov di, si
1:1997  f3ab                 rep stosw word ptr es:[di], ax
1:1999  8b7e0c               mov di, word ptr [bp + 0xc]
1:199C  8e46fe               mov es, word ptr [bp - 2]
1:199F  2689440a             mov word ptr es:[si + 0xa], ax
1:19A3  2689440e             mov word ptr es:[si + 0xe], ax
1:19A7  2689440c             mov word ptr es:[si + 0xc], ax
1:19AB  26894412             mov word ptr es:[si + 0x12], ax
1:19AF  26894410             mov word ptr es:[si + 0x10], ax
1:19B3  26c74414adbe         mov word ptr es:[si + 0x14], 0xbead
1:19B9  8b4606               mov ax, word ptr [bp + 6]
1:19BC  24fd                 and al, 0xfd
1:19BE  26894416             mov word ptr es:[si + 0x16], ax
1:19C2  26c744180000         mov word ptr es:[si + 0x18], 0
1:19C8  26c7441a0020         mov word ptr es:[si + 0x1a], 0x2000
1:19CE  26c7441c0008         mov word ptr es:[si + 0x1c], 0x800
1:19D4  06                   push es
1:19D5  56                   push si
1:19D6  90                   nop
1:19D7  0e                   push cs
1:19D8  e857fb               call 0x1532  ; SH_globalSize@s1:1532
1:19DB  8e46fe               mov es, word ptr [bp - 2]
1:19DE  2689441e             mov word ptr es:[si + 0x1e], ax
1:19E2  26895420             mov word ptr es:[si + 0x20], dx
1:19E6  2bc0                 sub ax, ax
1:19E8  26894424             mov word ptr es:[si + 0x24], ax
1:19EC  26894422             mov word ptr es:[si + 0x22], ax
1:19F0  26c74426feff         mov word ptr es:[si + 0x26], 0xfffe
1:19F6  26c74428ffff         mov word ptr es:[si + 0x28], 0xffff
1:19FC  26894432             mov word ptr es:[si + 0x32], ax
1:1A00  26894434             mov word ptr es:[si + 0x34], ax
1:1A04  26894440             mov word ptr es:[si + 0x40], ax
1:1A08  2689443e             mov word ptr es:[si + 0x3e], ax
1:1A0C  06                   push es
1:1A0D  56                   push si
1:1A0E  57                   push di
1:1A0F  90                   nop
1:1A10  0e                   push cs
1:1A11  e8ea00               call 0x1afe  ; SH_MemPoolSetBlockSizeFS@s1:1AFE
1:1A14  0bc0                 or ax, ax
1:1A16  750e                 jne 0x1a26
1:1A18  ff76fe               push word ptr [bp - 2]
1:1A1B  56                   push si
1:1A1C  50                   push ax
1:1A1D  90                   nop
1:1A1E  0e                   push cs
1:1A1F  e87801               call 0x1b9a  ; SH_poolFreeInternal@s1:1B9A
1:1A22  e90bff               jmp 0x1930
1:1A25  db 90
loc_1A26:
1:1A26  8b460a               mov ax, word ptr [bp + 0xa]
1:1A29  0b4608               or ax, word ptr [bp + 8]
1:1A2C  741b                 je 0x1a49
1:1A2E  ff76fe               push word ptr [bp - 2]
1:1A31  56                   push si
1:1A32  6a00                 push 0
1:1A34  57                   push di
1:1A35  ff760a               push word ptr [bp + 0xa]
1:1A38  ff7608               push word ptr [bp + 8]
1:1A3B  90                   nop
1:1A3C  0e                   push cs
1:1A3D  e87e38               call 0x52be  ; __aFlmul@s1:52BE
1:1A40  52                   push dx
1:1A41  50                   push ax
1:1A42  6a01                 push 1
1:1A44  90                   nop
1:1A45  0e                   push cs
1:1A46  e8c3e6               call 0x10c  ; SH_MemPoolFreeAll?@s1:010C
loc_1A49:
1:1A49  8bc6                 mov ax, si
1:1A4B  8b56fe               mov dx, word ptr [bp - 2]
1:1A4E  5e                   pop si
1:1A4F  5f                   pop di
1:1A50  c9                   leave
1:1A51  ca0800               retf 8

; ---------------- SH_MemPoolSetPageSize@s1:1A54 FAR size=92 callers=1
;   SmartHeap MemPoolSetPageSize (validates 0x1000/0x2000)
1:1A54  55                   push bp
1:1A55  8bec                 mov bp, sp
1:1A57  57                   push di
1:1A58  56                   push si
1:1A59  8b7e08               mov di, word ptr [bp + 8]
1:1A5C  8e460a               mov es, word ptr [bp + 0xa]
1:1A5F  26817d14adbe         cmp word ptr es:[di + 0x14], 0xbead
1:1A65  7413                 je 0x1a7a
1:1A67  6a00                 push 0
1:1A69  6a00                 push 0
1:1A6B  6a0a                 push 0xa
1:1A6D  90                   nop
1:1A6E  0e                   push cs
1:1A6F  e8ef03               call 0x1e61  ; SH_error@s1:1E61
1:1A72  33c0                 xor ax, ax
1:1A74  5e                   pop si
1:1A75  5f                   pop di
1:1A76  c9                   leave
1:1A77  ca0600               retf 6
loc_1A7A:
1:1A7A  8b7606               mov si, word ptr [bp + 6]
1:1A7D  8bc6                 mov ax, si
1:1A7F  e82e00               call 0x1ab0  ; SH_roundPageSize@s1:1AB0
1:1A82  8bf0                 mov si, ax
1:1A84  8e460a               mov es, word ptr [bp + 0xa]
1:1A87  268b4518             mov ax, word ptr es:[di + 0x18]
1:1A8B  051400               add ax, 0x14
1:1A8E  3bc6                 cmp ax, si
1:1A90  7604                 jbe 0x1a96
1:1A92  33c9                 xor cx, cx
1:1A94  eb11                 jmp 0x1aa7
loc_1A96:
1:1A96  268b4d1a             mov cx, word ptr es:[di + 0x1a]
1:1A9A  2689751a             mov word ptr es:[di + 0x1a], si
1:1A9E  8bc6                 mov ax, si
1:1AA0  c1e802               shr ax, 2
1:1AA3  2689451c             mov word ptr es:[di + 0x1c], ax
loc_1AA7:
1:1AA7  8bc1                 mov ax, cx
1:1AA9  5e                   pop si
1:1AAA  5f                   pop di
1:1AAB  c9                   leave
1:1AAC  ca0600               retf 6
1:1AAF  db 00

; ---------------- SH_roundPageSize@s1:1AB0 size=78 callers=1
;   SmartHeap internal: rounds a page size
1:1AB0  57                   push di
1:1AB1  56                   push si
1:1AB2  8bf8                 mov di, ax
1:1AB4  81ff0020             cmp di, 0x2000
1:1AB8  7440                 je 0x1afa
1:1ABA  83fff0               cmp di, -0x10
1:1ABD  7207                 jb 0x1ac6
loc_1ABF:
1:1ABF  b8f0ff               mov ax, 0xfff0
1:1AC2  5e                   pop si
1:1AC3  5f                   pop di
1:1AC4  c3                   ret
1:1AC5  db 90
loc_1AC6:
1:1AC6  81ff0010             cmp di, 0x1000
1:1ACA  7706                 ja 0x1ad2
1:1ACC  b80010               mov ax, 0x1000
1:1ACF  5e                   pop si
1:1AD0  5f                   pop di
1:1AD1  c3                   ret
loc_1AD2:
1:1AD2  be0020               mov si, 0x2000
1:1AD5  3bfe                 cmp di, si
1:1AD7  7617                 jbe 0x1af0
loc_1AD9:
1:1AD9  03f6                 add si, si
1:1ADB  74e2                 je 0x1abf
1:1ADD  3bf7                 cmp si, di
1:1ADF  72f8                 jb 0x1ad9
1:1AE1  8bc6                 mov ax, si
1:1AE3  2df0ff               sub ax, 0xfff0
1:1AE6  1bc9                 sbb cx, cx
1:1AE8  23c1                 and ax, cx
1:1AEA  05f0ff               add ax, 0xfff0
1:1AED  5e                   pop si
1:1AEE  5f                   pop di
1:1AEF  c3                   ret
loc_1AF0:
1:1AF0  d1ee                 shr si, 1
1:1AF2  3bf7                 cmp si, di
1:1AF4  73fa                 jae 0x1af0
1:1AF6  8bc6                 mov ax, si
1:1AF8  03c6                 add ax, si
loc_1AFA:
1:1AFA  5e                   pop si
1:1AFB  5f                   pop di
1:1AFC  c3                   ret
1:1AFD  db 00

; ---------------- SH_MemPoolSetBlockSizeFS@s1:1AFE FAR size=106 callers=2
;   SmartHeap: sets a pool's fixed block size
1:1AFE  55                   push bp
1:1AFF  8bec                 mov bp, sp
1:1B01  57                   push di
1:1B02  56                   push si
1:1B03  8b5e06               mov bx, word ptr [bp + 6]
1:1B06  0bdb                 or bx, bx
1:1B08  7408                 je 0x1b12
1:1B0A  8d4f01               lea cx, [bx + 1]
1:1B0D  80e1fe               and cl, 0xfe
1:1B10  eb02                 jmp 0x1b14
loc_1B12:
1:1B12  33c9                 xor cx, cx
loc_1B14:
1:1B14  c47608               les si, ptr [bp + 8]
1:1B17  26817c14adbe         cmp word ptr es:[si + 0x14], 0xbead
1:1B1D  7413                 je 0x1b32
1:1B1F  6a00                 push 0
1:1B21  6a00                 push 0
1:1B23  6a0a                 push 0xa
1:1B25  90                   nop
1:1B26  0e                   push cs
1:1B27  e83703               call 0x1e61  ; SH_error@s1:1E61
1:1B2A  33c0                 xor ax, ax
1:1B2C  5e                   pop si
1:1B2D  5f                   pop di
1:1B2E  c9                   leave
1:1B2F  ca0600               retf 6
loc_1B32:
1:1B32  8bfe                 mov di, si
1:1B34  3bcb                 cmp cx, bx
1:1B36  721c                 jb 0x1b54
1:1B38  268b451a             mov ax, word ptr es:[di + 0x1a]
1:1B3C  2d1400               sub ax, 0x14
1:1B3F  3bc1                 cmp ax, cx
1:1B41  7211                 jb 0x1b54
1:1B43  26837d0200           cmp word ptr es:[di + 2], 0
1:1B48  7513                 jne 0x1b5d
1:1B4A  26894d18             mov word ptr es:[di + 0x18], cx
1:1B4E  be0100               mov si, 1
1:1B51  eb0c                 jmp 0x1b5f
1:1B53  db 90
loc_1B54:
1:1B54  06                   push es
1:1B55  57                   push di
1:1B56  6a03                 push 3
1:1B58  90                   nop
1:1B59  0e                   push cs
1:1B5A  e80403               call 0x1e61  ; SH_error@s1:1E61
loc_1B5D:
1:1B5D  33f6                 xor si, si
loc_1B5F:
1:1B5F  8bc6                 mov ax, si
1:1B61  5e                   pop si
1:1B62  5f                   pop di
1:1B63  c9                   leave
1:1B64  ca0600               retf 6
1:1B67  db 00

; ---------------- SH_MemPoolFree@s1:1B68 FAR size=50 callers=1
;   SmartHeap MemPoolFree(pool) (WinMain at exit)
1:1B68  55                   push bp
1:1B69  8bec                 mov bp, sp
1:1B6B  56                   push si
1:1B6C  8b7606               mov si, word ptr [bp + 6]
1:1B6F  8e4608               mov es, word ptr [bp + 8]
1:1B72  26817c14adbe         cmp word ptr es:[si + 0x14], 0xbead
1:1B78  7412                 je 0x1b8c
1:1B7A  6a00                 push 0
1:1B7C  6a00                 push 0
1:1B7E  6a0a                 push 0xa
1:1B80  90                   nop
1:1B81  0e                   push cs
1:1B82  e8dc02               call 0x1e61  ; SH_error@s1:1E61
1:1B85  33c0                 xor ax, ax
1:1B87  5e                   pop si
1:1B88  c9                   leave
1:1B89  ca0400               retf 4
loc_1B8C:
1:1B8C  06                   push es
1:1B8D  56                   push si
1:1B8E  6a00                 push 0
1:1B90  90                   nop
1:1B91  0e                   push cs
1:1B92  e80500               call 0x1b9a  ; SH_poolFreeInternal@s1:1B9A
1:1B95  5e                   pop si
1:1B96  c9                   leave
1:1B97  ca0400               retf 4

; ---------------- SH_poolFreeInternal@s1:1B9A FAR size=608 callers=2
;   SmartHeap internal: frees every page of a pool
1:1B9A  c80a0000             enter 0xa, 0
1:1B9E  56                   push si
1:1B9F  c45e08               les bx, ptr [bp + 8]
1:1BA2  26c747140000         mov word ptr es:[bx + 0x14], 0
1:1BA8  1e                   push ds
1:1BA9  8e5e0a               mov ds, word ptr [bp + 0xa]
1:1BAC  c746fe0000           mov word ptr [bp - 2], 0
loc_1BB1:
1:1BB1  8b5efe               mov bx, word ptr [bp - 2]
1:1BB4  03db                 add bx, bx
1:1BB6  8b37                 mov si, word ptr [bx]
1:1BB8  0bf6                 or si, si
1:1BBA  7420                 je 0x1bdc
loc_1BBC:
1:1BBC  c45c08               les bx, ptr [si + 8]
1:1BBF  26c7470c0000         mov word ptr es:[bx + 0xc], 0
1:1BC5  ff740a               push word ptr [si + 0xa]
1:1BC8  ff7408               push word ptr [si + 8]
1:1BCB  90                   nop
1:1BCC  0e                   push cs
1:1BCD  e8fef7               call 0x13ce  ; SH_globalFree@s1:13CE
1:1BD0  8b7404               mov si, word ptr [si + 4]
1:1BD3  8b5efe               mov bx, word ptr [bp - 2]
1:1BD6  03db                 add bx, bx
1:1BD8  3937                 cmp word ptr [bx], si
1:1BDA  75e0                 jne 0x1bbc
loc_1BDC:
1:1BDC  ff46fe               inc word ptr [bp - 2]
1:1BDF  837efe05             cmp word ptr [bp - 2], 5
1:1BE3  72cc                 jb 0x1bb1
1:1BE5  1f                   pop ds
1:1BE6  c45e08               les bx, ptr [bp + 8]
1:1BE9  268b4710             mov ax, word ptr es:[bx + 0x10]
1:1BED  268b5712             mov dx, word ptr es:[bx + 0x12]
loc_1BF1:
1:1BF1  8946fa               mov word ptr [bp - 6], ax
1:1BF4  8956fc               mov word ptr [bp - 4], dx
1:1BF7  8bc2                 mov ax, dx
1:1BF9  0b46fa               or ax, word ptr [bp - 6]
1:1BFC  7420                 je 0x1c1e
1:1BFE  c45efa               les bx, ptr [bp - 6]
1:1C01  268b07               mov ax, word ptr es:[bx]
1:1C04  268b5702             mov dx, word ptr es:[bx + 2]
1:1C08  8946f6               mov word ptr [bp - 0xa], ax
1:1C0B  8956f8               mov word ptr [bp - 8], dx
1:1C0E  06                   push es
1:1C0F  53                   push bx
1:1C10  90                   nop
1:1C11  0e                   push cs
1:1C12  e8b9f7               call 0x13ce  ; SH_globalFree@s1:13CE
1:1C15  8b46f6               mov ax, word ptr [bp - 0xa]
1:1C18  8b56f8               mov dx, word ptr [bp - 8]
1:1C1B  ebd4                 jmp 0x1bf1
1:1C1D  db 90
loc_1C1E:
1:1C1E  ff760a               push word ptr [bp + 0xa]
1:1C21  ff7608               push word ptr [bp + 8]
1:1C24  90                   nop
1:1C25  0e                   push cs
1:1C26  e87904               call 0x20a2  ; SH_MemUnregisterTask@s1:20A2
1:1C29  ff760a               push word ptr [bp + 0xa]
1:1C2C  ff7608               push word ptr [bp + 8]
1:1C2F  90                   nop
1:1C30  0e                   push cs
1:1C31  e89af7               call 0x13ce  ; SH_globalFree@s1:13CE
1:1C34  b80100               mov ax, 1
1:1C37  5e                   pop si
1:1C38  c9                   leave
1:1C39  ca0600               retf 6
1:1C3C  db 4f 75 74 20 6f 66 20 6d 65 6d 6f 72 79 2e 20 20
1:1C4C  db 50 6c 65 61 73 65 20 66 72 65 65 20 73 6f 6d 65
1:1C5C  db 20 6d 65 6d 6f 72 79 2c 20 74 68 65 6e 20 63 68
1:1C6C  db 6f 6f 73 65 20 72 65 74 72 79 2e 00 00 00 00 00
1:1C7C  db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1:1C8C  db 00 00 00 01 00 4d 45 4d 5f 49 4e 54 45 52 4e 41
1:1C9C  db 4c 5f 45 52 52 4f 52 00 00 00 02 00 00 00 00 00
1:1CAC  db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1:1CBC  db 00 03 00 4d 45 4d 5f 42 4c 4f 43 4b 5f 54 4f 4f
1:1CCC  db 5f 42 49 47 00 00 00 00 04 00 4d 45 4d 5f 41 4c
1:1CDC  db 4c 4f 43 5f 5a 45 52 4f 00 00 00 00 00 00 00 05
1:1CEC  db 00 4d 45 4d 5f 52 45 53 49 5a 45 5f 46 41 49 4c
1:1CFC  db 45 44 00 00 00 00 06 00 4d 45 4d 5f 4c 4f 43 4b
1:1D0C  db 5f 45 52 52 4f 52 00 00 00 00 00 00 00 07 00 4d
1:1D1C  db 45 4d 5f 45 58 43 45 45 44 45 44 5f 43 45 49 4c
1:1D2C  db 49 4e 47 00 08 00 4d 45 4d 5f 54 4f 4f 5f 4d 41
1:1D3C  db 4e 59 5f 50 41 47 45 53 00 00 00 09 00 4d 45 4d
1:1D4C  db 5f 54 4f 4f 5f 4d 41 4e 59 5f 54 41 53 4b 53 00
1:1D5C  db 00 00 0a 00 4d 45 4d 5f 42 41 44 5f 4d 45 4d 5f
1:1D6C  db 50 4f 4f 4c 00 00 00 00 00 0b 00 4d 45 4d 5f 42
1:1D7C  db 41 44 5f 42 4c 4f 43 4b 00 00 00 00 00 00 00 00
1:1D8C  db 0c 00 4d 45 4d 5f 42 41 44 5f 46 52 45 45 5f 42
1:1D9C  db 4c 4f 43 4b 00 00 00 0d 00 4d 45 4d 5f 42 41 44
1:1DAC  db 5f 48 41 4e 44 4c 45 00 00 00 00 00 00 00 0e 00
1:1DBC  db 4d 45 4d 5f 42 41 44 5f 50 4f 49 4e 54 45 52 00
1:1DCC  db 00 00 00 00 00 0e 00 4d 45 4d 5f 57 52 4f 4e 47
1:1DDC  db 5f 54 41 53 4b 00 00 00 00 00 00 00 53 6d 61 72
1:1DEC  db 74 48 65 61 70 20 4c 69 62 72 61 72 79 00

; ---------------- SH_errorRecord@s1:1DFA size=103 callers=2
;   SmartHeap internal: fills the error record
1:1DFA  55                   push bp
1:1DFB  8bec                 mov bp, sp
1:1DFD  8a4606               mov al, byte ptr [bp + 6]
1:1E00  250400               and ax, 4
1:1E03  3d0100               cmp ax, 1
1:1E06  1bc9                 sbb cx, cx
1:1E08  81e10082             and cx, 0x8200
1:1E0C  80c518               add ch, 0x18
1:1E0F  0bc0                 or ax, ax
1:1E11  7406                 je 0x1e19
1:1E13  b80018               mov ax, 0x1800
1:1E16  eb12                 jmp 0x1e2a
1:1E18  db 90
loc_1E19:
1:1E19  8a4606               mov al, byte ptr [bp + 6]
1:1E1C  250200               and ax, 2
1:1E1F  3d0100               cmp ax, 1
1:1E22  1bc0                 sbb ax, ax
1:1E24  2500fe               and ax, 0xfe00
1:1E27  80c492               add ah, 0x92
loc_1E2A:
1:1E2A  8bd0                 mov dx, ax
1:1E2C  8b5e0a               mov bx, word ptr [bp + 0xa]
1:1E2F  0bdb                 or bx, bx
1:1E31  7425                 je 0x1e58
1:1E33  0f02c3               lar ax, bx
1:1E36  7520                 jne 0x1e58
1:1E38  23c1                 and ax, cx
1:1E3A  3bc2                 cmp ax, dx
1:1E3C  751a                 jne 0x1e58
1:1E3E  8b4e04               mov cx, word ptr [bp + 4]
1:1E41  e30f                 jcxz 0x1e52
1:1E43  0f03c3               lsl ax, bx
1:1E46  8b5e08               mov bx, word ptr [bp + 8]
1:1E49  49                   dec cx
1:1E4A  03d9                 add bx, cx
1:1E4C  720a                 jb 0x1e58
1:1E4E  3bc3                 cmp ax, bx
1:1E50  7206                 jb 0x1e58
loc_1E52:
1:1E52  33c0                 xor ax, ax
1:1E54  c9                   leave
1:1E55  c20800               ret 8
loc_1E58:
1:1E58  b80100               mov ax, 1
1:1E5B  c9                   leave
1:1E5C  c20800               ret 8
1:1E5F  db ff ff

; ---------------- SH_error@s1:1E61 FAR size=15 callers=18
;   SmartHeap error trampoline (into _SHI_INVOKEERRORHANDLER1)
1:1E61  2e813e711e9090       cmp word ptr cs:[0x1e71], 0x9090
1:1E68  7502                 jne 0x1e6c
1:1E6A  8cd0                 mov ax, ss
loc_1E6C:
1:1E6C  e90100               jmp 0x1e70
1:1E6F  db 00

; ---------------- _SHI_INVOKEERRORHANDLER1@s1:1E70 size=180 callers=0
;   SmartHeap exported error-handler dispatcher
1:1E70  8cd8                 mov ax, ds
1:1E72  90                   nop
1:1E73  c83e0000             enter 0x3e, 0
1:1E77  57                   push di
1:1E78  1e                   push ds
1:1E79  8ed8                 mov ds, ax
1:1E7B  8b4608               mov ax, word ptr [bp + 8]
1:1E7E  8b560a               mov dx, word ptr [bp + 0xa]
1:1E81  8946c4               mov word ptr [bp - 0x3c], ax
1:1E84  8956c6               mov word ptr [bp - 0x3a], dx
1:1E87  8b4606               mov ax, word ptr [bp + 6]
1:1E8A  8946c2               mov word ptr [bp - 0x3e], ax
1:1E8D  b81a5f               mov ax, 0x5f1a
1:1E90  8bd8                 mov bx, ax
1:1E92  8c5efe               mov word ptr [bp - 2], ds
1:1E95  8cd9                 mov cx, ds
1:1E97  0bc8                 or cx, ax
1:1E99  7509                 jne 0x1ea4
loc_1E9B:
1:1E9B  33c0                 xor ax, ax
1:1E9D  1f                   pop ds
1:1E9E  5f                   pop di
1:1E9F  c9                   leave
1:1EA0  ca0600               retf 6
1:1EA3  db 90
loc_1EA4:
1:1EA4  895efc               mov word ptr [bp - 4], bx
1:1EA7  a11c5f               mov ax, word ptr [0x5f1c]
1:1EAA  0b061a5f             or ax, word ptr [0x5f1a]
1:1EAE  742a                 je 0x1eda
1:1EB0  ff361c5f             push word ptr [0x5f1c]
1:1EB4  ff361a5f             push word ptr [0x5f1a]
1:1EB8  90                   nop
1:1EB9  0e                   push cs
1:1EBA  e8f902               call 0x21b6  ; SH_invokeHandler@s1:21B6
1:1EBD  0bc0                 or ax, ax
1:1EBF  7409                 je 0x1eca
1:1EC1  a11a5f               mov ax, word ptr [0x5f1a]
1:1EC4  8b161c5f             mov dx, word ptr [0x5f1c]
1:1EC8  eb13                 jmp 0x1edd
loc_1ECA:
1:1ECA  b87e1f               mov ax, 0x1f7e
1:1ECD  ba1219               mov dx, 0x1912  ; SEGMENT s1:0000
1:1ED0  a31a5f               mov word ptr [0x5f1a], ax
1:1ED3  89161c5f             mov word ptr [0x5f1c], dx
1:1ED7  eb04                 jmp 0x1edd
1:1ED9  db 90
loc_1EDA:
1:1EDA  33c0                 xor ax, ax
1:1EDC  99                   cdq
loc_1EDD:
1:1EDD  8bd8                 mov bx, ax
1:1EDF  8956fe               mov word ptr [bp - 2], dx
1:1EE2  8bc2                 mov ax, dx
1:1EE4  0bc3                 or ax, bx
1:1EE6  74b3                 je 0x1e9b
1:1EE8  895efc               mov word ptr [bp - 4], bx
1:1EEB  1e                   push ds
1:1EEC  681a5f               push 0x5f1a
1:1EEF  33c0                 xor ax, ax
1:1EF1  e83000               call 0x1f24  ; SH_errorCount@s1:1F24
1:1EF4  0bc0                 or ax, ax
1:1EF6  740c                 je 0x1f04
1:1EF8  2bc0                 sub ax, ax
1:1EFA  8946fe               mov word ptr [bp - 2], ax
1:1EFD  8946fc               mov word ptr [bp - 4], ax
1:1F00  33ff                 xor di, di
1:1F02  eb0a                 jmp 0x1f0e
loc_1F04:
1:1F04  8d46c2               lea ax, [bp - 0x3e]
1:1F07  16                   push ss
1:1F08  50                   push ax
1:1F09  ff5efc               lcall [bp - 4]
1:1F0C  8bf8                 mov di, ax
loc_1F0E:
1:1F0E  8b46fe               mov ax, word ptr [bp - 2]
1:1F11  0b46fc               or ax, word ptr [bp - 4]
1:1F14  7405                 je 0x1f1b
1:1F16  90                   nop
1:1F17  0e                   push cs
1:1F18  e84d00               call 0x1f68  ; SH_errorReset@s1:1F68
loc_1F1B:
1:1F1B  8bc7                 mov ax, di
1:1F1D  1f                   pop ds
1:1F1E  5f                   pop di
1:1F1F  c9                   leave
1:1F20  ca0600               retf 6
1:1F23  db 00

; ---------------- SH_errorCount@s1:1F24 size=68 callers=1
;   SmartHeap internal: counts repeated errors
1:1F24  c8020000             enter 2, 0
1:1F28  57                   push di
1:1F29  56                   push si
1:1F2A  8b4e04               mov cx, word ptr [bp + 4]
1:1F2D  8bf8                 mov di, ax
1:1F2F  8bd9                 mov bx, cx
1:1F31  8e4606               mov es, word ptr [bp + 6]
1:1F34  268b770c             mov si, word ptr es:[bx + 0xc]
1:1F38  3bf0                 cmp si, ax
1:1F3A  7704                 ja 0x1f40
1:1F3C  26ff470c             inc word ptr es:[bx + 0xc]
loc_1F40:
1:1F40  3bf7                 cmp si, di
1:1F42  760f                 jbe 0x1f53
1:1F44  68ffff               push 0xffff  ; SEGMENT s9:0000
1:1F47  6840d9               push 0xd940
1:1F4A  6a00                 push 0
1:1F4C  6a00                 push 0
1:1F4E  90                   nop
1:1F4F  0e                   push cs
1:1F50  e8f901               call 0x214c  ; SH_defaultErrorHandler@s1:214C
loc_1F53:
1:1F53  3bf7                 cmp si, di
1:1F55  7609                 jbe 0x1f60
1:1F57  b80100               mov ax, 1
1:1F5A  5e                   pop si
1:1F5B  5f                   pop di
1:1F5C  c9                   leave
1:1F5D  c20400               ret 4
loc_1F60:
1:1F60  33c0                 xor ax, ax
1:1F62  5e                   pop si
1:1F63  5f                   pop di
1:1F64  c9                   leave
1:1F65  c20400               ret 4

; ---------------- SH_errorReset@s1:1F68 FAR size=22 callers=1
;   SmartHeap internal: resets the error nesting counter
1:1F68  b81a5f               mov ax, 0x5f1a
1:1F6B  8cd9                 mov cx, ds
1:1F6D  0bc8                 or cx, ax
1:1F6F  740c                 je 0x1f7d
1:1F71  ff0e265f             dec word ptr [0x5f26]
1:1F75  7906                 jns 0x1f7d
1:1F77  c706265f0000         mov word ptr [0x5f26], 0
loc_1F7D:
1:1F7D  cb                   retf

; ---------------- SH_errorText@s1:1F7E size=84 callers=0
;   SmartHeap internal: formats an error message
1:1F7E  c8020000             enter 2, 0
1:1F82  56                   push si
1:1F83  c45e06               les bx, ptr [bp + 6]
1:1F86  b81a5f               mov ax, 0x5f1a
1:1F89  268b0f               mov cx, word ptr es:[bx]
1:1F8C  8cda                 mov dx, ds
1:1F8E  0bd0                 or dx, ax
1:1F90  7508                 jne 0x1f9a
1:1F92  33c0                 xor ax, ax
1:1F94  5e                   pop si
1:1F95  c9                   leave
1:1F96  ca0400               retf 4
1:1F99  db 90
loc_1F9A:
1:1F9A  8bc1                 mov ax, cx
1:1F9C  3d0f00               cmp ax, 0xf
1:1F9F  7415                 je 0x1fb6
1:1FA1  770c                 ja 0x1faf
1:1FA3  2c02                 sub al, 2
1:1FA5  740f                 je 0x1fb6
1:1FA7  fec8                 dec al
1:1FA9  7c04                 jl 0x1faf
1:1FAB  2c0b                 sub al, 0xb
1:1FAD  7e0d                 jle 0x1fbc
loc_1FAF:
1:1FAF  33f6                 xor si, si
1:1FB1  b90100               mov cx, 1
1:1FB4  eb08                 jmp 0x1fbe
loc_1FB6:
1:1FB6  be0100               mov si, 1
1:1FB9  eb03                 jmp 0x1fbe
1:1FBB  db 90
loc_1FBC:
1:1FBC  33f6                 xor si, si
loc_1FBE:
1:1FBE  8bc1                 mov ax, cx
1:1FC0  e80f00               call 0x1fd2  ; SH_errorString@s1:1FD2
1:1FC3  52                   push dx
1:1FC4  50                   push ax
1:1FC5  56                   push si
1:1FC6  6a00                 push 0
1:1FC8  90                   nop
1:1FC9  0e                   push cs
1:1FCA  e87f01               call 0x214c  ; SH_defaultErrorHandler@s1:214C
1:1FCD  5e                   pop si
1:1FCE  c9                   leave
1:1FCF  ca0400               retf 4

; ---------------- SH_errorString@s1:1FD2 size=24 callers=1
;   SmartHeap internal: error number -> message string
1:1FD2  8bd8                 mov bx, ax
1:1FD4  83fb02               cmp bx, 2
1:1FD7  7507                 jne 0x1fe0
1:1FD9  b83c1c               mov ax, 0x1c3c
1:1FDC  bae71f               mov dx, 0x1fe7  ; SEGMENT s1:0000 | '568.bmp'
1:1FDF  c3                   ret
loc_1FE0:
1:1FE0  6bc317               imul ax, bx, 0x17
1:1FE3  057a1c               add ax, 0x1c7a
1:1FE6  bace1e               mov dx, 0x1ece  ; SEGMENT s1:0000
1:1FE9  c3                   ret

; ---------------- SH_MemRegisterTask@s1:1FEA FAR size=184 callers=1
;   SmartHeap MemRegisterTask/error-handler setup (WinMain start)
1:1FEA  b81a5f               mov ax, 0x5f1a
1:1FED  8cd9                 mov cx, ds
1:1FEF  0bc8                 or cx, ax
1:1FF1  7418                 je 0x200b
1:1FF3  a1225f               mov ax, word ptr [0x5f22]
1:1FF6  ff06225f             inc word ptr [0x5f22]
1:1FFA  0bc0                 or ax, ax
1:1FFC  750d                 jne 0x200b
1:1FFE  a1205f               mov ax, word ptr [0x5f20]
1:2001  0b061e5f             or ax, word ptr [0x5f1e]
1:2005  7404                 je 0x200b
1:2007  ff06225f             inc word ptr [0x5f22]
loc_200B:
1:200B  b81a5f               mov ax, 0x5f1a
1:200E  8cd9                 mov cx, ds
1:2010  0bc8                 or cx, ax
1:2012  7404                 je 0x2018
1:2014  b80100               mov ax, 1
1:2017  cb                   retf
loc_2018:
1:2018  33c0                 xor ax, ax
1:201A  cb                   retf
1:201B  db 00 56 8b f3 0b c0 75 06 89 44 06 89 44 04 8b 44
1:202B  db 06 0b 44 04 74 38 ff 74 06 ff 74 04 90 0e e8 30
1:203B  db 00 0b c0 74 10 ff 74 06 ff 74 04 6a 01 90 0e e8
1:204B  db 4d fb eb 12 90 c4 5c 04 26 8b 47 2a 26 8b 57 2c
1:205B  db 89 44 04 89 54 06 8b 44 06 0b 44 04 75 c8 5e c3
1:206B  db 00 55 8b ec 56 8b 76 06 ff 76 08 56 6a 00 6a 42
1:207B  db 68 02 01 90 0e e8 4f 01 0b c0 74 13 8e 46 08 26
1:208B  db 81 7c 14 ad be 75 08 b8 01 00 5e c9 ca 04 00 33
1:209B  db c0 5e c9 ca 04 00 00

; ---------------- SH_MemUnregisterTask@s1:20A2 FAR size=164 callers=1
;   SmartHeap internal: task cleanup
1:20A2  c80c0000             enter 0xc, 0
1:20A6  57                   push di
1:20A7  56                   push si
1:20A8  8b4e06               mov cx, word ptr [bp + 6]
1:20AB  8bd9                 mov bx, cx
1:20AD  8e4608               mov es, word ptr [bp + 8]
1:20B0  268b472e             mov ax, word ptr es:[bx + 0x2e]
1:20B4  268b5730             mov dx, word ptr es:[bx + 0x30]
1:20B8  8946f4               mov word ptr [bp - 0xc], ax
1:20BB  8956f6               mov word ptr [bp - 0xa], dx
1:20BE  33db                 xor bx, bx
1:20C0  33f6                 xor si, si
1:20C2  8bfb                 mov di, bx
1:20C4  8976fa               mov word ptr [bp - 6], si
1:20C7  8bf0                 mov si, ax
1:20C9  8ec2                 mov es, dx
1:20CB  268b4404             mov ax, word ptr es:[si + 4]
1:20CF  268b5406             mov dx, word ptr es:[si + 6]
1:20D3  8bd8                 mov bx, ax
1:20D5  8956fe               mov word ptr [bp - 2], dx
1:20D8  0bd0                 or dx, ax
1:20DA  7464                 je 0x2140
loc_20DC:
1:20DC  8b46fe               mov ax, word ptr [bp - 2]
1:20DF  3bd9                 cmp bx, cx
1:20E1  7505                 jne 0x20e8
1:20E3  3b4608               cmp ax, word ptr [bp + 8]
1:20E6  741e                 je 0x2106
loc_20E8:
1:20E8  8bfb                 mov di, bx
1:20EA  8946fa               mov word ptr [bp - 6], ax
1:20ED  8ec0                 mov es, ax
1:20EF  268b472a             mov ax, word ptr es:[bx + 0x2a]
1:20F3  268b572c             mov dx, word ptr es:[bx + 0x2c]
1:20F7  8bd8                 mov bx, ax
1:20F9  8956fe               mov word ptr [bp - 2], dx
1:20FC  0bd0                 or dx, ax
1:20FE  75dc                 jne 0x20dc
1:2100  5e                   pop si
1:2101  5f                   pop di
1:2102  c9                   leave
1:2103  ca0400               retf 4
loc_2106:
1:2106  8b46fa               mov ax, word ptr [bp - 6]
1:2109  0bc7                 or ax, di
1:210B  741d                 je 0x212a
1:210D  8e46fe               mov es, word ptr [bp - 2]
1:2110  268b472a             mov ax, word ptr es:[bx + 0x2a]
1:2114  268b572c             mov dx, word ptr es:[bx + 0x2c]
1:2118  8e46fa               mov es, word ptr [bp - 6]
1:211B  2689452a             mov word ptr es:[di + 0x2a], ax
1:211F  2689552c             mov word ptr es:[di + 0x2c], dx
1:2123  5e                   pop si
1:2124  5f                   pop di
1:2125  c9                   leave
1:2126  ca0400               retf 4
1:2129  db 90
loc_212A:
1:212A  8e46fe               mov es, word ptr [bp - 2]
1:212D  268b472a             mov ax, word ptr es:[bx + 0x2a]
1:2131  268b572c             mov dx, word ptr es:[bx + 0x2c]
1:2135  c45ef4               les bx, ptr [bp - 0xc]
1:2138  26894704             mov word ptr es:[bx + 4], ax
1:213C  26895706             mov word ptr es:[bx + 6], dx
loc_2140:
1:2140  5e                   pop si
1:2141  5f                   pop di
1:2142  c9                   leave
1:2143  ca0400               retf 4

; ---------------- SH_hookTrue@s1:2146 FAR size=4 callers=1
;   SmartHeap stub hook (returns 1)
1:2146  b80100               mov ax, 1
1:2149  cb                   retf

; ---------------- SH_hookNop@s1:214A FAR size=2 callers=1
;   SmartHeap stub hook (returns)
1:214A  cb                   retf
1:214B  db 90

; ---------------- SH_defaultErrorHandler@s1:214C FAR size=106 callers=2
;   apis: USER.MessageBeep, USER.MessageBox
;   SmartHeap default error handler: MessageBeep + MessageBox, abort
1:214C  55                   push bp
1:214D  8bec                 mov bp, sp
1:214F  57                   push di
1:2150  56                   push si
1:2151  837e0801             cmp word ptr [bp + 8], 1
1:2155  1bf6                 sbb si, si
1:2157  83c602               add si, 2
1:215A  81ce1021             or si, 0x2110
1:215E  6a00                 push 0
1:2160  9affff0000           lcall 0, 0xffff  ; USER.MessageBeep
1:2165  8b7e0a               mov di, word ptr [bp + 0xa]
loc_2168:
1:2168  6a00                 push 0
1:216A  ff760c               push word ptr [bp + 0xc]
1:216D  57                   push di
1:216E  68dd1f               push 0x1fdd  ; SEGMENT s1:0000
1:2171  68e81d               push 0x1de8
1:2174  56                   push si
1:2175  9affff0000           lcall 0, 0xffff  ; USER.MessageBox
1:217A  48                   dec ax
1:217B  7431                 je 0x21ae
1:217D  48                   dec ax
1:217E  7c0b                 jl 0x218b
1:2180  7009                 jo 0x218b
1:2182  48                   dec ax
1:2183  7e17                 jle 0x219c
1:2185  48                   dec ax
1:2186  741c                 je 0x21a4
1:2188  48                   dec ax
1:2189  7423                 je 0x21ae
loc_218B:
1:218B  f7c60020             test si, 0x2000
1:218F  741d                 je 0x21ae
1:2191  81e6efdf             and si, 0xdfef
1:2195  81ce1010             or si, 0x1010
1:2199  ebcd                 jmp 0x2168
1:219B  db 90
loc_219C:
1:219C  90                   nop
1:219D  0e                   push cs
1:219E  e8fd1c               call 0x3e9e  ; abort@s1:3E9E
1:21A1  eb0b                 jmp 0x21ae
1:21A3  db 90
loc_21A4:
1:21A4  b80100               mov ax, 1
1:21A7  5e                   pop si
1:21A8  5f                   pop di
1:21A9  c9                   leave
1:21AA  ca0800               retf 8
1:21AD  db 90
loc_21AE:
1:21AE  33c0                 xor ax, ax
1:21B0  5e                   pop si
1:21B1  5f                   pop di
1:21B2  c9                   leave
1:21B3  ca0800               retf 8

; ---------------- SH_invokeHandler@s1:21B6 FAR size=28 callers=1
;   SmartHeap internal: calls the installed error handler
1:21B6  55                   push bp
1:21B7  8bec                 mov bp, sp
1:21B9  ff7608               push word ptr [bp + 8]
1:21BC  ff7606               push word ptr [bp + 6]
1:21BF  6a04                 push 4
1:21C1  6a00                 push 0
1:21C3  e834fc               call 0x1dfa  ; SH_errorRecord@s1:1DFA
1:21C6  3d0100               cmp ax, 1
1:21C9  1bc0                 sbb ax, ax
1:21CB  f7d8                 neg ax
1:21CD  c9                   leave
1:21CE  ca0400               retf 4
1:21D1  db 00

; ---------------- SH_reportError@s1:21D2 FAR size=112 callers=0
;   SmartHeap: records an error, may exit
1:21D2  55                   push bp
1:21D3  8bec                 mov bp, sp
1:21D5  2ef7065f1e0200       test word ptr cs:[0x1e5f], 2
1:21DC  7404                 je 0x21e2
1:21DE  e94300               jmp 0x2224
1:21E1  db 90
loc_21E2:
1:21E2  ff760e               push word ptr [bp + 0xe]
1:21E5  ff760c               push word ptr [bp + 0xc]
1:21E8  ff7606               push word ptr [bp + 6]
1:21EB  6a00                 push 0
1:21ED  e80afc               call 0x1dfa  ; SH_errorRecord@s1:1DFA
1:21F0  0bc0                 or ax, ax
1:21F2  7406                 je 0x21fa
loc_21F4:
1:21F4  33c0                 xor ax, ax
1:21F6  c9                   leave
1:21F7  ca0a00               retf 0xa
loc_21FA:
1:21FA  f6460604             test byte ptr [bp + 6], 4
1:21FE  7524                 jne 0x2224
1:2200  6633db               xor ebx, ebx
1:2203  8b5e0e               mov bx, word ptr [bp + 0xe]
1:2206  660f03d3             lsl edx, ebx
1:220A  75e8                 jne 0x21f4
1:220C  8b5e0c               mov bx, word ptr [bp + 0xc]
1:220F  668b4e08             mov ecx, dword ptr [bp + 8]
1:2213  66e324               jcxz 0x223a
1:2216  6649                 dec ecx
1:2218  6603d9               add ebx, ecx
1:221B  72d7                 jb 0x21f4
1:221D  663bd3               cmp edx, ebx
1:2220  72d2                 jb 0x21f4
1:2222  eb16                 jmp 0x223a
loc_2224:
1:2224  ff760e               push word ptr [bp + 0xe]
1:2227  ff760c               push word ptr [bp + 0xc]
1:222A  8b4608               mov ax, word ptr [bp + 8]
1:222D  8b560a               mov dx, word ptr [bp + 0xa]
1:2230  8b5e06               mov bx, word ptr [bp + 6]
1:2233  e88a00               call 0x22c0  ; SH_fatalExit@s1:22C0
1:2236  0bc0                 or ax, ax
1:2238  74ba                 je 0x21f4
loc_223A:
1:223A  b80100               mov ax, 1
1:223D  c9                   leave
1:223E  ca0a00               retf 0xa
1:2241  db 90

; ---------------- _exit_hook@s1:2242 size=126 callers=1
;   C runtime: exit path (calls _cexit)
1:2242  c8060000             enter 6, 0
1:2246  53                   push bx
1:2247  50                   push ax
1:2248  57                   push di
1:2249  56                   push si
1:224A  8b4606               mov ax, word ptr [bp + 6]
1:224D  0b4604               or ax, word ptr [bp + 4]
1:2250  7464                 je 0x22b6
loc_2252:
1:2252  837e0600             cmp word ptr [bp + 6], 0
1:2256  7406                 je 0x225e
1:2258  beffff               mov si, 0xffff
1:225B  eb04                 jmp 0x2261
1:225D  db 90
loc_225E:
1:225E  8b7604               mov si, word ptr [bp + 4]
loc_2261:
1:2261  8b4608               mov ax, word ptr [bp + 8]
1:2264  2bd2                 sub dx, dx
1:2266  03c6                 add ax, si
1:2268  13d2                 adc dx, dx
1:226A  7402                 je 0x226e
1:226C  2bf0                 sub si, ax
loc_226E:
1:226E  2bc0                 sub ax, ax
1:2270  297604               sub word ptr [bp + 4], si
1:2273  194606               sbb word ptr [bp + 6], ax
1:2276  ff760a               push word ptr [bp + 0xa]
1:2279  ff7608               push word ptr [bp + 8]
1:227C  ff76f6               push word ptr [bp - 0xa]
1:227F  56                   push si
1:2280  ff56f8               call word ptr [bp - 8]
1:2283  8bf8                 mov di, ax
1:2285  0bf8                 or di, ax
1:2287  751d                 jne 0x22a6
1:2289  2bc0                 sub ax, ax
1:228B  2bd2                 sub dx, dx
1:228D  8bce                 mov cx, si
1:228F  014e08               add word ptr [bp + 8], cx
1:2292  13d0                 adc dx, ax
1:2294  b9ffff               mov cx, 0xffff  ; OFFSET KERNEL.__AHSHIFT
1:2297  d3e2                 shl dx, cl
1:2299  01560a               add word ptr [bp + 0xa], dx
1:229C  8b4606               mov ax, word ptr [bp + 6]
1:229F  0b4604               or ax, word ptr [bp + 4]
1:22A2  75ae                 jne 0x2252
1:22A4  eb10                 jmp 0x22b6
loc_22A6:
1:22A6  8bc7                 mov ax, di
1:22A8  2bd2                 sub dx, dx
1:22AA  034604               add ax, word ptr [bp + 4]
1:22AD  135606               adc dx, word ptr [bp + 6]
1:22B0  5e                   pop si
1:22B1  5f                   pop di
1:22B2  c9                   leave
1:22B3  c20800               ret 8
loc_22B6:
1:22B6  33c0                 xor ax, ax
1:22B8  99                   cdq
1:22B9  5e                   pop si
1:22BA  5f                   pop di
1:22BB  c9                   leave
1:22BC  c20800               ret 8
1:22BF  db 00

; ---------------- SH_fatalExit@s1:22C0 FAR size=64 callers=1
;   SmartHeap: terminates after a fatal error
1:22C0  55                   push bp
1:22C1  8bec                 mov bp, sp
1:22C3  ff7606               push word ptr [bp + 6]
1:22C6  ff7604               push word ptr [bp + 4]
1:22C9  52                   push dx
1:22CA  50                   push ax
1:22CB  8bc3                 mov ax, bx
1:22CD  8d1efa1d             lea bx, [0x1dfa]
1:22D1  e86eff               call 0x2242  ; _exit_hook@s1:2242
1:22D4  0bd0                 or dx, ax
1:22D6  7508                 jne 0x22e0
1:22D8  b80100               mov ax, 1
1:22DB  c9                   leave
1:22DC  c20400               ret 4
1:22DF  db 90
loc_22E0:
1:22E0  33c0                 xor ax, ax
1:22E2  c9                   leave
1:22E3  c20400               ret 4
1:22E6  db 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
1:22F6  db 5f 1e
loc_22F8:
1:22F8  b0ff                 mov al, 0xff
1:22FA  50                   push ax
1:22FB  90                   nop
1:22FC  0e                   push cs
1:22FD  e8db01               call 0x24db  ; _doexit@s1:24DB

; ---------------- __astart@s1:2300 size=190 callers=0
;   apis: KERNEL.DOS3Call, KERNEL.GetVersion, KERNEL.InitTask, KERNEL.LockSegment, KERNEL.WaitEvent, USER.InitApp
;   C runtime start: InitTask, WaitEvent, InitApp, _cinit, WinMain, exit
1:2300  33ed                 xor bp, bp
1:2302  55                   push bp
1:2303  9affff0000           lcall 0, 0xffff  ; KERNEL.InitTask
1:2308  0bc0                 or ax, ax
1:230A  74ec                 je 0x22f8
1:230C  8c067e5f             mov word ptr [0x5f7e], es
1:2310  81c10001             add cx, 0x100
1:2314  72e2                 jb 0x22f8
1:2316  890e485f             mov word ptr [0x5f48], cx
1:231A  89364a5f             mov word ptr [0x5f4a], si
1:231E  893e4c5f             mov word ptr [0x5f4c], di
1:2322  891e4e5f             mov word ptr [0x5f4e], bx
1:2326  8c06505f             mov word ptr [0x5f50], es
1:232A  8916525f             mov word ptr [0x5f52], dx
1:232E  b8ffff               mov ax, 0xffff
1:2331  50                   push ax
1:2332  9affff0000           lcall 0, 0xffff  ; KERNEL.LockSegment
1:2337  9affff0000           lcall 0, 0xffff  ; KERNEL.GetVersion
1:233C  86c4                 xchg ah, al
1:233E  a3805f               mov word ptr [0x5f80], ax
1:2341  b430                 mov ah, 0x30
1:2343  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:234A  7407                 je 0x2353
1:234C  9affff0000           lcall 0, 0xffff  ; KERNEL.DOS3Call
1:2351  eb02                 jmp 0x2355
loc_2353:
1:2353  cd21                 int 0x21
loc_2355:
1:2355  a3845f               mov word ptr [0x5f84], ax
1:2358  86c4                 xchg ah, al
1:235A  a3825f               mov word ptr [0x5f82], ax
1:235D  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:2364  7505                 jne 0x236b
1:2366  b000                 mov al, 0
1:2368  a2875f               mov byte ptr [0x5f87], al
loc_236B:
1:236B  33c0                 xor ax, ax
1:236D  50                   push ax
1:236E  9affff0000           lcall 0, 0xffff  ; KERNEL.WaitEvent
1:2373  ff364c5f             push word ptr [0x5f4c]
1:2377  9affff0000           lcall 0, 0xffff  ; USER.InitApp
1:237C  0bc0                 or ax, ax
1:237E  7503                 jne 0x2383
1:2380  e975ff               jmp 0x22f8
loc_2383:
1:2383  90                   nop
1:2384  0e                   push cs
1:2385  e86200               call 0x23ea  ; _cinit@s1:23EA
1:2388  90                   nop
1:2389  0e                   push cs
1:238A  e89f02               call 0x262c  ; _setargv@s1:262C
1:238D  90                   nop
1:238E  0e                   push cs
1:238F  e84404               call 0x27d6  ; _setenvp@s1:27D6
1:2392  e81732               call 0x55ac  ; _nullcheck@s1:55AC
1:2395  ff36c05f             push word ptr [0x5fc0]
1:2399  ff36be5f             push word ptr [0x5fbe]
1:239D  ff36bc5f             push word ptr [0x5fbc]
1:23A1  ff36ba5f             push word ptr [0x5fba]
1:23A5  ff36b85f             push word ptr [0x5fb8]
1:23A9  90                   nop
1:23AA  0e                   push cs
1:23AB  e81000               call 0x23be  ; __callWinMain@s1:23BE
1:23AE  83c40a               add sp, 0xa
1:23B1  50                   push ax
1:23B2  90                   nop
1:23B3  0e                   push cs
1:23B4  e81601               call 0x24cd  ; exit@s1:24CD
1:23B7  b81500               mov ax, 0x15
1:23BA  e9dd04               jmp 0x289a
1:23BD  db 00

; ---------------- __callWinMain@s1:23BE FAR size=44 callers=1
;   C runtime: pushes hInstance/hPrev/lpCmdLine/nCmdShow and calls WinMain (s2:54AA)
1:23BE  8cd8                 mov ax, ds
1:23C0  90                   nop
1:23C1  45                   inc bp
1:23C2  55                   push bp
1:23C3  8bec                 mov bp, sp
1:23C5  1e                   push ds
1:23C6  8ed8                 mov ds, ax
1:23C8  ff364c5f             push word ptr [0x5f4c]
1:23CC  ff364a5f             push word ptr [0x5f4a]
1:23D0  ff36505f             push word ptr [0x5f50]
1:23D4  ff364e5f             push word ptr [0x5f4e]
1:23D8  ff36525f             push word ptr [0x5f52]
1:23DC  9aaa54ffff           lcall 0xffff, 0x54aa  ; WinMain@s2:54AA
1:23E1  83ed02               sub bp, 2
1:23E4  8be5                 mov sp, bp
1:23E6  1f                   pop ds
1:23E7  5d                   pop bp
1:23E8  4d                   dec bp
1:23E9  cb                   retf

; ---------------- _cinit@s1:23EA FAR size=227 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime init: _C_FILE_INFO inheritance, runs the initialiser table
1:23EA  8cd8                 mov ax, ds
1:23EC  90                   nop
1:23ED  45                   inc bp
1:23EE  55                   push bp
1:23EF  8bec                 mov bp, sp
1:23F1  1e                   push ds
1:23F2  8ed8                 mov ds, ax
1:23F4  b80035               mov ax, 0x3500
1:23F7  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:23FE  7407                 je 0x2407
1:2400  9a4d230000           lcall 0, 0x234d  ; KERNEL.DOS3Call
1:2405  eb02                 jmp 0x2409
loc_2407:
1:2407  cd21                 int 0x21
loc_2409:
1:2409  891e6a5f             mov word ptr [0x5f6a], bx
1:240D  8c066c5f             mov word ptr [0x5f6c], es
1:2411  0e                   push cs
1:2412  1f                   pop ds
1:2413  b80025               mov ax, 0x2500
1:2416  ba9028               mov dx, 0x2890
1:2419  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:2420  7407                 je 0x2429
1:2422  9a01240000           lcall 0, 0x2401  ; KERNEL.DOS3Call
1:2427  eb02                 jmp 0x242b
loc_2429:
1:2429  cd21                 int 0x21
loc_242B:
1:242B  0e                   push cs
1:242C  e8ad05               call 0x29dc  ; _getDGROUP@s1:29DC
1:242F  8ed8                 mov ds, ax
1:2431  8b0e0262             mov cx, word ptr [0x6202]
1:2435  e329                 jcxz 0x2460
1:2437  8e067e5f             mov es, word ptr [0x5f7e]
1:243B  268b362c00           mov si, word ptr es:[0x2c]
1:2440  a10462               mov ax, word ptr [0x6204]
1:2443  8b160662             mov dx, word ptr [0x6206]
1:2447  33db                 xor bx, bx
1:2449  ff1e0062             lcall [0x6200]
1:244D  7303                 jae 0x2452
1:244F  e97a01               jmp 0x25cc
loc_2452:
1:2452  a10862               mov ax, word ptr [0x6208]
1:2455  8b160a62             mov dx, word ptr [0x620a]
1:2459  bb0300               mov bx, 3
1:245C  ff1e0062             lcall [0x6200]
loc_2460:
1:2460  8e067e5f             mov es, word ptr [0x5f7e]
1:2464  268b0e2c00           mov cx, word ptr es:[0x2c]
1:2469  e33e                 jcxz 0x24a9
1:246B  8ec1                 mov es, cx
1:246D  33ff                 xor di, di
loc_246F:
1:246F  26803d00             cmp byte ptr es:[di], 0
1:2473  7434                 je 0x24a9
1:2475  b90d00               mov cx, 0xd
1:2478  be5c5f               mov si, 0x5f5c  ; '_C_FILE_INFO='
1:247B  f3a6                 repe cmpsb byte ptr [si], byte ptr es:[di]
1:247D  740b                 je 0x248a
1:247F  b9ff7f               mov cx, 0x7fff
1:2482  33c0                 xor ax, ax
1:2484  f2ae                 repne scasb al, byte ptr es:[di]
1:2486  7521                 jne 0x24a9
1:2488  ebe5                 jmp 0x246f
loc_248A:
1:248A  06                   push es
1:248B  1e                   push ds
1:248C  07                   pop es
1:248D  1f                   pop ds
1:248E  8bf7                 mov si, di
1:2490  bf905f               mov di, 0x5f90
1:2493  b104                 mov cl, 4
loc_2495:
1:2495  ac                   lodsb al, byte ptr [si]
1:2496  2c41                 sub al, 0x41
1:2498  720d                 jb 0x24a7
1:249A  d2e0                 shl al, cl
1:249C  92                   xchg dx, ax
1:249D  ac                   lodsb al, byte ptr [si]
1:249E  2c41                 sub al, 0x41
1:24A0  7205                 jb 0x24a7
1:24A2  0ac2                 or al, dl
1:24A4  aa                   stosb byte ptr es:[di], al
1:24A5  ebee                 jmp 0x2495
loc_24A7:
1:24A7  06                   push es
1:24A8  1f                   pop ds
loc_24A9:
1:24A9  be0c62               mov si, 0x620c
1:24AC  bf0c62               mov di, 0x620c
1:24AF  e8e200               call 0x2594  ; _initterm@s1:2594
1:24B2  be0c62               mov si, 0x620c
1:24B5  bf0c62               mov di, 0x620c
1:24B8  e8d900               call 0x2594  ; _initterm@s1:2594
1:24BB  beee61               mov si, 0x61ee
1:24BE  bffe61               mov di, 0x61fe
1:24C1  e8d000               call 0x2594  ; _initterm@s1:2594
1:24C4  83ed02               sub bp, 2
1:24C7  8be5                 mov sp, bp
1:24C9  1f                   pop ds
1:24CA  5d                   pop bp
1:24CB  4d                   dec bp
1:24CC  cb                   retf

; ---------------- exit@s1:24CD FAR size=14 callers=11
;   C runtime exit(code)
1:24CD  8cd8                 mov ax, ds
1:24CF  90                   nop
1:24D0  45                   inc bp
1:24D1  55                   push bp
1:24D2  8bec                 mov bp, sp
1:24D4  1e                   push ds
1:24D5  8ed8                 mov ds, ax
1:24D7  33c9                 xor cx, cx
1:24D9  eb2f                 jmp 0x250a

; ---------------- _doexit@s1:24DB FAR size=144 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime: runs atexit/terminators, restores vectors, terminates
1:24DB  8cd8                 mov ax, ds
1:24DD  90                   nop
1:24DE  45                   inc bp
1:24DF  55                   push bp
1:24E0  8bec                 mov bp, sp
1:24E2  1e                   push ds
1:24E3  8ed8                 mov ds, ax
1:24E5  b90100               mov cx, 1
1:24E8  eb20                 jmp 0x250a
1:24EA  db 8c d8 90 45 55 8b ec 1e 8e d8 56 57 b9 00 01 eb
1:24FA  db 0f 8c d8 90 45 55 8b ec 1e 8e d8 56 57 b9 01 01
loc_250A:
1:250A  882ec95f             mov byte ptr [0x5fc9], ch
1:250E  51                   push cx
1:250F  0ac9                 or cl, cl
1:2511  751c                 jne 0x252f
1:2513  beb668               mov si, 0x68b6
1:2516  bfb668               mov di, 0x68b6
1:2519  e87800               call 0x2594  ; _initterm@s1:2594
1:251C  be0c62               mov si, 0x620c
1:251F  bf1062               mov di, 0x6210
1:2522  e86f00               call 0x2594  ; _initterm@s1:2594
1:2525  8b7606               mov si, word ptr [bp + 6]
1:2528  56                   push si
1:2529  e88030               call 0x55ac  ; _nullcheck@s1:55AC
1:252C  83c402               add sp, 2
loc_252F:
1:252F  be1062               mov si, 0x6210
1:2532  bf1062               mov di, 0x6210
1:2535  e85c00               call 0x2594  ; _initterm@s1:2594
1:2538  be1062               mov si, 0x6210
1:253B  bf1062               mov di, 0x6210
1:253E  e85300               call 0x2594  ; _initterm@s1:2594
1:2541  e82700               call 0x256b  ; _ctermsub@s1:256B
1:2544  58                   pop ax
1:2545  0ae4                 or ah, ah
1:2547  7517                 jne 0x2560
1:2549  8b4606               mov ax, word ptr [bp + 6]
1:254C  b44c                 mov ah, 0x4c
1:254E  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:2555  7407                 je 0x255e
1:2557  9a23240000           lcall 0, 0x2423  ; KERNEL.DOS3Call
1:255C  eb02                 jmp 0x2560
loc_255E:
1:255E  cd21                 int 0x21
loc_2560:
1:2560  5f                   pop di
1:2561  5e                   pop si
1:2562  83ed02               sub bp, 2
1:2565  8be5                 mov sp, bp
1:2567  1f                   pop ds
1:2568  5d                   pop bp
1:2569  4d                   dec bp
1:256A  cb                   retf

; ---------------- _ctermsub@s1:256B size=41 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime: restores DOS interrupt vectors
1:256B  8b0e0262             mov cx, word ptr [0x6202]
1:256F  e307                 jcxz 0x2578
1:2571  bb0200               mov bx, 2
1:2574  ff1e0062             lcall [0x6200]
loc_2578:
1:2578  1e                   push ds
1:2579  c5166a5f             lds dx, ptr [0x5f6a]
1:257D  b80025               mov ax, 0x2500
1:2580  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:2587  7407                 je 0x2590
1:2589  9a58250000           lcall 0, 0x2558  ; KERNEL.DOS3Call
1:258E  eb02                 jmp 0x2592
loc_2590:
1:2590  cd21                 int 0x21
loc_2592:
1:2592  1f                   pop ds
1:2593  c3                   ret

; ---------------- _initterm@s1:2594 size=20 callers=2
;   C runtime: calls a table of far function pointers
1:2594  3bf7                 cmp si, di
1:2596  730e                 jae 0x25a6
1:2598  83ef04               sub di, 4
1:259B  8b05                 mov ax, word ptr [di]
1:259D  0b4502               or ax, word ptr [di + 2]
1:25A0  74f2                 je 0x2594
1:25A2  ff1d                 lcall [di]
1:25A4  ebee                 jmp 0x2594
loc_25A6:
1:25A6  c3                   ret
1:25A7  db 00

; ---------------- _FF_MSGBANNER@s1:25A8 FAR size=74 callers=1
;   C runtime: writes the run-time error banner
1:25A8  8cd8                 mov ax, ds
1:25AA  90                   nop
1:25AB  45                   inc bp
1:25AC  55                   push bp
1:25AD  8bec                 mov bp, sp
1:25AF  1e                   push ds
1:25B0  8ed8                 mov ds, ax
1:25B2  b8fc00               mov ax, 0xfc
1:25B5  50                   push ax
1:25B6  0e                   push cs
1:25B7  e85903               call 0x2913  ; _NMSG_WRITE@s1:2913
1:25BA  b8ff00               mov ax, 0xff
1:25BD  50                   push ax
1:25BE  0e                   push cs
1:25BF  e85103               call 0x2913  ; _NMSG_WRITE@s1:2913
1:25C2  83ed02               sub bp, 2
1:25C5  8be5                 mov sp, bp
1:25C7  1f                   pop ds
1:25C8  5d                   pop bp
1:25C9  4d                   dec bp
1:25CA  cb                   retf
1:25CB  db 00
loc_25CC:
1:25CC  b80200               mov ax, 2
1:25CF  e9c802               jmp 0x289a
1:25D2  db 5b 40 24 fe 2b c4 73 4c f7 d8 36 39 06 0a 00 77
1:25E2  db 43 36 39 06 0c 00 76 04 36 a3 0c 00 8b e0 ff e3

; ---------------- _chkstk@s1:25F2 FAR size=58 callers=3
;   C runtime stack probe / alloca
1:25F2  5b                   pop bx
1:25F3  5a                   pop dx
1:25F4  40                   inc ax
1:25F5  24fe                 and al, 0xfe
1:25F7  2bc4                 sub ax, sp
1:25F9  7319                 jae 0x2614
1:25FB  f7d8                 neg ax
1:25FD  3639060a00           cmp word ptr ss:[0xa], ax
1:2602  7710                 ja 0x2614
1:2604  3639060c00           cmp word ptr ss:[0xc], ax
1:2609  7604                 jbe 0x260f
1:260B  36a30c00             mov word ptr ss:[0xc], ax
loc_260F:
1:260F  8be0                 mov sp, ax
1:2611  52                   push dx
1:2612  53                   push bx
1:2613  cb                   retf
loc_2614:
1:2614  90                   nop
1:2615  0e                   push cs
1:2616  e8c303               call 0x29dc  ; _getDGROUP@s1:29DC
1:2619  8ed8                 mov ds, ax
1:261B  8b16ce5f             mov dx, word ptr [0x5fce]
1:261F  42                   inc dx
1:2620  7404                 je 0x2626
1:2622  ff2ece5f             ljmp [0x5fce]
loc_2626:
1:2626  b80000               mov ax, 0
1:2629  e96e02               jmp 0x289a

; ---------------- _setargv@s1:262C FAR size=426 callers=1
;   apis: KERNEL.GetModuleFileName
;   C runtime: builds argv from the command line (GetModuleFileName)
1:262C  8f06d25f             pop word ptr [0x5fd2]
1:2630  8f06d45f             pop word ptr [0x5fd4]
1:2634  b80401               mov ax, 0x104
1:2637  b90800               mov cx, 8
1:263A  e81303               call 0x2950  ; _malloc_crt@s1:2950
1:263D  8916c45f             mov word ptr [0x5fc4], dx
1:2641  a3c25f               mov word ptr [0x5fc2], ax
1:2644  52                   push dx
1:2645  50                   push ax
1:2646  ff364c5f             push word ptr [0x5f4c]
1:264A  52                   push dx
1:264B  50                   push ax
1:264C  b80401               mov ax, 0x104
1:264F  50                   push ax
1:2650  9affff0000           lcall 0, 0xffff  ; KERNEL.GetModuleFileName
1:2655  5b                   pop bx
1:2656  07                   pop es
1:2657  03d8                 add bx, ax
1:2659  26c60700             mov byte ptr es:[bx], 0
1:265D  ba0100               mov dx, 1
1:2660  1e                   push ds
1:2661  07                   pop es
1:2662  bf0100               mov di, 1
1:2665  be8100               mov si, 0x81
1:2668  8e1e7e5f             mov ds, word ptr [0x5f7e]
loc_266C:
1:266C  ac                   lodsb al, byte ptr [si]
1:266D  3c20                 cmp al, 0x20
1:266F  74fb                 je 0x266c
1:2671  3c09                 cmp al, 9
1:2673  74f7                 je 0x266c
1:2675  3c0d                 cmp al, 0xd
1:2677  746f                 je 0x26e8
1:2679  0ac0                 or al, al
1:267B  746b                 je 0x26e8
1:267D  47                   inc di
loc_267E:
1:267E  4e                   dec si
loc_267F:
1:267F  ac                   lodsb al, byte ptr [si]
1:2680  3c20                 cmp al, 0x20
1:2682  74e8                 je 0x266c
1:2684  3c09                 cmp al, 9
1:2686  74e4                 je 0x266c
1:2688  3c0d                 cmp al, 0xd
1:268A  745c                 je 0x26e8
1:268C  0ac0                 or al, al
1:268E  7458                 je 0x26e8
1:2690  3c22                 cmp al, 0x22
1:2692  7424                 je 0x26b8
1:2694  3c5c                 cmp al, 0x5c
1:2696  7403                 je 0x269b
1:2698  42                   inc dx
1:2699  ebe4                 jmp 0x267f
loc_269B:
1:269B  33c9                 xor cx, cx
loc_269D:
1:269D  41                   inc cx
1:269E  ac                   lodsb al, byte ptr [si]
1:269F  3c5c                 cmp al, 0x5c
1:26A1  74fa                 je 0x269d
1:26A3  3c22                 cmp al, 0x22
1:26A5  7404                 je 0x26ab
1:26A7  03d1                 add dx, cx
1:26A9  ebd3                 jmp 0x267e
loc_26AB:
1:26AB  8bc1                 mov ax, cx
1:26AD  d1e9                 shr cx, 1
1:26AF  13d1                 adc dx, cx
1:26B1  a801                 test al, 1
1:26B3  75ca                 jne 0x267f
1:26B5  eb01                 jmp 0x26b8
loc_26B7:
1:26B7  4e                   dec si
loc_26B8:
1:26B8  ac                   lodsb al, byte ptr [si]
1:26B9  3c0d                 cmp al, 0xd
1:26BB  742b                 je 0x26e8
1:26BD  0ac0                 or al, al
1:26BF  7427                 je 0x26e8
1:26C1  3c22                 cmp al, 0x22
1:26C3  74ba                 je 0x267f
1:26C5  3c5c                 cmp al, 0x5c
1:26C7  7403                 je 0x26cc
1:26C9  42                   inc dx
1:26CA  ebec                 jmp 0x26b8
loc_26CC:
1:26CC  33c9                 xor cx, cx
loc_26CE:
1:26CE  41                   inc cx
1:26CF  ac                   lodsb al, byte ptr [si]
1:26D0  3c5c                 cmp al, 0x5c
1:26D2  74fa                 je 0x26ce
1:26D4  3c22                 cmp al, 0x22
1:26D6  7404                 je 0x26dc
1:26D8  03d1                 add dx, cx
1:26DA  ebdb                 jmp 0x26b7
loc_26DC:
1:26DC  8bc1                 mov ax, cx
1:26DE  d1e9                 shr cx, 1
1:26E0  13d1                 adc dx, cx
1:26E2  a801                 test al, 1
1:26E4  75d2                 jne 0x26b8
1:26E6  eb97                 jmp 0x267f
loc_26E8:
1:26E8  06                   push es
1:26E9  1f                   pop ds
1:26EA  893eb85f             mov word ptr [0x5fb8], di
1:26EE  03d7                 add dx, di
1:26F0  47                   inc di
1:26F1  d1e7                 shl di, 1
1:26F3  d1e7                 shl di, 1
1:26F5  03d7                 add dx, di
1:26F7  42                   inc dx
1:26F8  80e2fe               and dl, 0xfe
1:26FB  2be2                 sub sp, dx
1:26FD  8bc4                 mov ax, sp
1:26FF  a3ba5f               mov word ptr [0x5fba], ax
1:2702  8c16bc5f             mov word ptr [0x5fbc], ss
1:2706  8bd8                 mov bx, ax
1:2708  03fb                 add di, bx
1:270A  16                   push ss
1:270B  07                   pop es
1:270C  c536c25f             lds si, ptr [0x5fc2]
1:2710  368937               mov word ptr ss:[bx], si
1:2713  368c5f02             mov word ptr ss:[bx + 2], ds
1:2717  83c304               add bx, 4
1:271A  50                   push ax
1:271B  0e                   push cs
1:271C  e8bd02               call 0x29dc  ; _getDGROUP@s1:29DC
1:271F  8ed8                 mov ds, ax
1:2721  58                   pop ax
1:2722  8e1e7e5f             mov ds, word ptr [0x5f7e]
1:2726  be8100               mov si, 0x81
1:2729  eb03                 jmp 0x272e
loc_272B:
1:272B  33c0                 xor ax, ax
1:272D  aa                   stosb byte ptr es:[di], al
loc_272E:
1:272E  ac                   lodsb al, byte ptr [si]
1:272F  3c20                 cmp al, 0x20
1:2731  74fb                 je 0x272e
1:2733  3c09                 cmp al, 9
1:2735  74f7                 je 0x272e
1:2737  3c0d                 cmp al, 0xd
1:2739  7503                 jne 0x273e
1:273B  e98300               jmp 0x27c1
loc_273E:
1:273E  0ac0                 or al, al
1:2740  7502                 jne 0x2744
1:2742  eb7d                 jmp 0x27c1
loc_2744:
1:2744  36893f               mov word ptr ss:[bx], di
1:2747  368c5702             mov word ptr ss:[bx + 2], ss
1:274B  83c304               add bx, 4
loc_274E:
1:274E  4e                   dec si
loc_274F:
1:274F  ac                   lodsb al, byte ptr [si]
1:2750  3c20                 cmp al, 0x20
1:2752  74d7                 je 0x272b
1:2754  3c09                 cmp al, 9
1:2756  74d3                 je 0x272b
1:2758  3c0d                 cmp al, 0xd
1:275A  7462                 je 0x27be
1:275C  0ac0                 or al, al
1:275E  745e                 je 0x27be
1:2760  3c22                 cmp al, 0x22
1:2762  7427                 je 0x278b
1:2764  3c5c                 cmp al, 0x5c
1:2766  7403                 je 0x276b
1:2768  aa                   stosb byte ptr es:[di], al
1:2769  ebe4                 jmp 0x274f
loc_276B:
1:276B  33c9                 xor cx, cx
loc_276D:
1:276D  41                   inc cx
1:276E  ac                   lodsb al, byte ptr [si]
1:276F  3c5c                 cmp al, 0x5c
1:2771  74fa                 je 0x276d
1:2773  3c22                 cmp al, 0x22
1:2775  7406                 je 0x277d
1:2777  b05c                 mov al, 0x5c
1:2779  f3aa                 rep stosb byte ptr es:[di], al
1:277B  ebd1                 jmp 0x274e
loc_277D:
1:277D  b05c                 mov al, 0x5c
1:277F  d1e9                 shr cx, 1
1:2781  f3aa                 rep stosb byte ptr es:[di], al
1:2783  7306                 jae 0x278b
1:2785  b022                 mov al, 0x22
1:2787  aa                   stosb byte ptr es:[di], al
1:2788  ebc5                 jmp 0x274f
loc_278A:
1:278A  4e                   dec si
loc_278B:
1:278B  ac                   lodsb al, byte ptr [si]
1:278C  3c0d                 cmp al, 0xd
1:278E  742e                 je 0x27be
1:2790  0ac0                 or al, al
1:2792  742a                 je 0x27be
1:2794  3c22                 cmp al, 0x22
1:2796  74b7                 je 0x274f
1:2798  3c5c                 cmp al, 0x5c
1:279A  7403                 je 0x279f
1:279C  aa                   stosb byte ptr es:[di], al
1:279D  ebec                 jmp 0x278b
loc_279F:
1:279F  33c9                 xor cx, cx
loc_27A1:
1:27A1  41                   inc cx
1:27A2  ac                   lodsb al, byte ptr [si]
1:27A3  3c5c                 cmp al, 0x5c
1:27A5  74fa                 je 0x27a1
1:27A7  3c22                 cmp al, 0x22
1:27A9  7406                 je 0x27b1
1:27AB  b05c                 mov al, 0x5c
1:27AD  f3aa                 rep stosb byte ptr es:[di], al
1:27AF  ebd9                 jmp 0x278a
loc_27B1:
1:27B1  b05c                 mov al, 0x5c
1:27B3  d1e9                 shr cx, 1
1:27B5  f3aa                 rep stosb byte ptr es:[di], al
1:27B7  7396                 jae 0x274f
1:27B9  b022                 mov al, 0x22
1:27BB  aa                   stosb byte ptr es:[di], al
1:27BC  ebcd                 jmp 0x278b
loc_27BE:
1:27BE  33c0                 xor ax, ax
1:27C0  aa                   stosb byte ptr es:[di], al
loc_27C1:
1:27C1  0e                   push cs
1:27C2  e81702               call 0x29dc  ; _getDGROUP@s1:29DC
1:27C5  8ed8                 mov ds, ax
1:27C7  36c7070000           mov word ptr ss:[bx], 0
1:27CC  36c747020000         mov word ptr ss:[bx + 2], 0
1:27D2  ff2ed25f             ljmp [0x5fd2]

; ---------------- _setenvp@s1:27D6 FAR size=262 callers=1
;   apis: KERNEL.FatalAppExit, KERNEL.GetDOSEnvironment
;   C runtime: builds the environment (GetDOSEnvironment), FatalAppExit on failure
1:27D6  8cd8                 mov ax, ds
1:27D8  90                   nop
1:27D9  45                   inc bp
1:27DA  55                   push bp
1:27DB  8bec                 mov bp, sp
1:27DD  1e                   push ds
1:27DE  8ed8                 mov ds, ax
1:27E0  83ec06               sub sp, 6
1:27E3  1e                   push ds
1:27E4  9affff0000           lcall 0, 0xffff  ; KERNEL.GetDOSEnvironment
1:27E9  0bc0                 or ax, ax
1:27EB  7403                 je 0x27f0
1:27ED  ba0000               mov dx, 0
loc_27F0:
1:27F0  8bda                 mov bx, dx
1:27F2  8ec2                 mov es, dx
1:27F4  8c46fc               mov word ptr [bp - 4], es
1:27F7  8c5ef8               mov word ptr [bp - 8], ds
1:27FA  33c0                 xor ax, ax
1:27FC  33f6                 xor si, si
1:27FE  33ff                 xor di, di
1:2800  b9ffff               mov cx, 0xffff
1:2803  0bdb                 or bx, bx
1:2805  740e                 je 0x2815
1:2807  26803e000000         cmp byte ptr es:[0], 0
1:280D  7406                 je 0x2815
loc_280F:
1:280F  f2ae                 repne scasb al, byte ptr es:[di]
1:2811  46                   inc si
1:2812  ae                   scasb al, byte ptr es:[di]
1:2813  75fa                 jne 0x280f
loc_2815:
1:2815  8bc7                 mov ax, di
1:2817  40                   inc ax
1:2818  24fe                 and al, 0xfe
1:281A  46                   inc si
1:281B  8bfe                 mov di, si
1:281D  d1e6                 shl si, 1
1:281F  d1e6                 shl si, 1
1:2821  b90900               mov cx, 9
1:2824  e82901               call 0x2950  ; _malloc_crt@s1:2950
1:2827  52                   push dx
1:2828  50                   push ax
1:2829  8bc6                 mov ax, si
1:282B  e82201               call 0x2950  ; _malloc_crt@s1:2950
1:282E  a3be5f               mov word ptr [0x5fbe], ax
1:2831  8916c05f             mov word ptr [0x5fc0], dx
1:2835  8956fa               mov word ptr [bp - 6], dx
1:2838  06                   push es
1:2839  1f                   pop ds
1:283A  8bcf                 mov cx, di
1:283C  8bd8                 mov bx, ax
1:283E  33f6                 xor si, si
1:2840  5f                   pop di
1:2841  07                   pop es
1:2842  49                   dec cx
1:2843  e338                 jcxz 0x287d
loc_2845:
1:2845  8b04                 mov ax, word ptr [si]
1:2847  1e                   push ds
1:2848  8e5ef8               mov ds, word ptr [bp - 8]
1:284B  3b065c5f             cmp ax, word ptr [0x5f5c]
1:284F  1f                   pop ds
1:2850  7515                 jne 0x2867
1:2852  51                   push cx
1:2853  56                   push si
1:2854  57                   push di
1:2855  06                   push es
1:2856  8e46f8               mov es, word ptr [bp - 8]
1:2859  bf5c5f               mov di, 0x5f5c  ; '_C_FILE_INFO='
1:285C  b90600               mov cx, 6
1:285F  f3a7                 repe cmpsw word ptr [si], word ptr es:[di]
1:2861  07                   pop es
1:2862  5f                   pop di
1:2863  5e                   pop si
1:2864  59                   pop cx
1:2865  740b                 je 0x2872
loc_2867:
1:2867  8e5efa               mov ds, word ptr [bp - 6]
1:286A  893f                 mov word ptr [bx], di
1:286C  8c4702               mov word ptr [bx + 2], es
1:286F  83c304               add bx, 4
loc_2872:
1:2872  8e5efc               mov ds, word ptr [bp - 4]
loc_2875:
1:2875  ac                   lodsb al, byte ptr [si]
1:2876  aa                   stosb byte ptr es:[di], al
1:2877  0ac0                 or al, al
1:2879  75fa                 jne 0x2875
1:287B  e2c8                 loop 0x2845
loc_287D:
1:287D  8e5efa               mov ds, word ptr [bp - 6]
1:2880  890f                 mov word ptr [bx], cx
1:2882  894f02               mov word ptr [bx + 2], cx
1:2885  1f                   pop ds
1:2886  83ed02               sub bp, 2
1:2889  8be5                 mov sp, bp
1:288B  1f                   pop ds
1:288C  5d                   pop bp
1:288D  4d                   dec bp
1:288E  cb                   retf
1:288F  db 00 90 0e e8 47 01 8e d8 b8 03 00
loc_289A:
1:289A  50                   push ax
1:289B  50                   push ax
1:289C  0e                   push cs
1:289D  e808fd               call 0x25a8  ; _FF_MSGBANNER@s1:25A8
1:28A0  0e                   push cs
1:28A1  e86f00               call 0x2913  ; _NMSG_WRITE@s1:2913
1:28A4  0e                   push cs
1:28A5  e83400               call 0x28dc  ; _NMSG_TEXT@s1:28DC
1:28A8  33db                 xor bx, bx
1:28AA  0bc0                 or ax, ax
1:28AC  741d                 je 0x28cb
1:28AE  8bf8                 mov di, ax
1:28B0  b80900               mov ax, 9
1:28B3  803d4d               cmp byte ptr [di], 0x4d
1:28B6  7503                 jne 0x28bb
1:28B8  b80f00               mov ax, 0xf
loc_28BB:
1:28BB  03f8                 add di, ax
1:28BD  57                   push di
1:28BE  1e                   push ds
1:28BF  07                   pop es
1:28C0  b00d                 mov al, 0xd
1:28C2  b92200               mov cx, 0x22
1:28C5  f2ae                 repne scasb al, byte ptr es:[di]
1:28C7  885dff               mov byte ptr [di - 1], bl
1:28CA  58                   pop ax
loc_28CB:
1:28CB  53                   push bx
1:28CC  1e                   push ds
1:28CD  50                   push ax
1:28CE  9affff0000           lcall 0, 0xffff  ; KERNEL.FatalAppExit
1:28D3  db b8 ff 00 50 9a ff ff 00 00

; ---------------- _NMSG_TEXT@s1:28DC FAR size=55 callers=2
;   C runtime: run-time message number -> text
1:28DC  8cd8                 mov ax, ds
1:28DE  90                   nop
1:28DF  45                   inc bp
1:28E0  55                   push bp
1:28E1  8bec                 mov bp, sp
1:28E3  1e                   push ds
1:28E4  8ed8                 mov ds, ax
1:28E6  56                   push si
1:28E7  57                   push di
1:28E8  1e                   push ds
1:28E9  07                   pop es
1:28EA  8b5606               mov dx, word ptr [bp + 6]
1:28ED  befe63               mov si, 0x63fe
loc_28F0:
1:28F0  ad                   lodsw ax, word ptr [si]
1:28F1  3bc2                 cmp ax, dx
1:28F3  7410                 je 0x2905
1:28F5  40                   inc ax
1:28F6  96                   xchg si, ax
1:28F7  740c                 je 0x2905
1:28F9  97                   xchg di, ax
1:28FA  33c0                 xor ax, ax
1:28FC  b9ffff               mov cx, 0xffff
1:28FF  f2ae                 repne scasb al, byte ptr es:[di]
1:2901  8bf7                 mov si, di
1:2903  ebeb                 jmp 0x28f0
loc_2905:
1:2905  96                   xchg si, ax
1:2906  5f                   pop di
1:2907  5e                   pop si
1:2908  83ed02               sub bp, 2
1:290B  8be5                 mov sp, bp
1:290D  1f                   pop ds
1:290E  5d                   pop bp
1:290F  4d                   dec bp
1:2910  ca0200               retf 2

; ---------------- _NMSG_WRITE@s1:2913 FAR size=61 callers=2
;   C runtime: writes a run-time message
1:2913  8cd8                 mov ax, ds
1:2915  90                   nop
1:2916  45                   inc bp
1:2917  55                   push bp
1:2918  8bec                 mov bp, sp
1:291A  1e                   push ds
1:291B  8ed8                 mov ds, ax
1:291D  57                   push di
1:291E  833eec6100           cmp word ptr [0x61ec], 0
1:2923  741f                 je 0x2944
1:2925  ff7606               push word ptr [bp + 6]
1:2928  0e                   push cs
1:2929  e8b0ff               call 0x28dc  ; _NMSG_TEXT@s1:28DC
1:292C  0bc0                 or ax, ax
1:292E  7414                 je 0x2944
1:2930  92                   xchg dx, ax
1:2931  8bfa                 mov di, dx
1:2933  33c0                 xor ax, ax
1:2935  b9ffff               mov cx, 0xffff
1:2938  f2ae                 repne scasb al, byte ptr es:[di]
1:293A  f7d1                 not cx
1:293C  49                   dec cx
1:293D  8b1e8a5f             mov bx, word ptr [0x5f8a]
1:2941  e86d2c               call 0x55b1  ; _amsg_exit_R6020@s1:55B1
loc_2944:
1:2944  5f                   pop di
1:2945  83ed02               sub bp, 2
1:2948  8be5                 mov sp, bp
1:294A  1f                   pop ds
1:294B  5d                   pop bp
1:294C  4d                   dec bp
1:294D  ca0200               retf 2

; ---------------- _malloc_crt@s1:2950 size=95 callers=2
;   C runtime internal allocation (exits on failure)
1:2950  55                   push bp
1:2951  8bec                 mov bp, sp
1:2953  53                   push bx
1:2954  06                   push es
1:2955  51                   push cx
1:2956  b90010               mov cx, 0x1000
1:2959  870e6660             xchg word ptr [0x6066], cx
1:295D  51                   push cx
1:295E  50                   push ax
1:295F  90                   nop
1:2960  0e                   push cs
1:2961  e816ed               call 0x167a  ; _fmalloc@s1:167A
1:2964  5b                   pop bx
1:2965  8f066660             pop word ptr [0x6066]
1:2969  59                   pop cx
1:296A  8bda                 mov bx, dx
1:296C  0bd8                 or bx, ax
1:296E  7404                 je 0x2974
1:2970  07                   pop es
1:2971  5b                   pop bx
1:2972  eb05                 jmp 0x2979
loc_2974:
1:2974  8bc1                 mov ax, cx
1:2976  e921ff               jmp 0x289a
loc_2979:
1:2979  8be5                 mov sp, bp
1:297B  5d                   pop bp
1:297C  c3                   ret
1:297D  db 00
loc_297E:
1:297E  721f                 jb 0x299f
loc_2980:
1:2980  33c0                 xor ax, ax
1:2982  83ed02               sub bp, 2
1:2985  8be5                 mov sp, bp
1:2987  1f                   pop ds
1:2988  5d                   pop bp
1:2989  4d                   dec bp
1:298A  cb                   retf
loc_298B:
1:298B  73f3                 jae 0x2980
1:298D  50                   push ax
1:298E  e82400               call 0x29b5  ; _dosmaperr@s1:29B5
1:2991  58                   pop ax
1:2992  32e4                 xor ah, ah
1:2994  83ed02               sub bp, 2
1:2997  8be5                 mov sp, bp
1:2999  1f                   pop ds
1:299A  5d                   pop bp
1:299B  4d                   dec bp
1:299C  cb                   retf
loc_299D:
1:299D  7307                 jae 0x29a6
loc_299F:
1:299F  e81300               call 0x29b5  ; _dosmaperr@s1:29B5
1:29A2  b8ffff               mov ax, 0xffff
1:29A5  99                   cdq
loc_29A6:
1:29A6  83ed02               sub bp, 2
1:29A9  8be5                 mov sp, bp
1:29AB  1f                   pop ds
1:29AC  5d                   pop bp
1:29AD  4d                   dec bp
1:29AE  cb                   retf

; ---------------- _dosmaperr_far@s1:29AF FAR size=6 callers=1
;   C runtime: DOS error -> errno (far entry)
1:29AF  32e4                 xor ah, ah
1:29B1  e80100               call 0x29b5  ; _dosmaperr@s1:29B5
1:29B4  cb                   retf

; ---------------- _dosmaperr@s1:29B5 size=39 callers=2
;   C runtime: DOS error -> errno
1:29B5  a2885f               mov byte ptr [0x5f88], al
1:29B8  0ae4                 or ah, ah
1:29BA  751b                 jne 0x29d7
1:29BC  3c22                 cmp al, 0x22
1:29BE  730c                 jae 0x29cc
1:29C0  3c20                 cmp al, 0x20
1:29C2  7204                 jb 0x29c8
1:29C4  b005                 mov al, 5
1:29C6  eb06                 jmp 0x29ce
loc_29C8:
1:29C8  3c13                 cmp al, 0x13
1:29CA  7602                 jbe 0x29ce
loc_29CC:
1:29CC  b013                 mov al, 0x13
loc_29CE:
1:29CE  bbd65f               mov bx, 0x5fd6
1:29D1  d7                   xlatb
loc_29D2:
1:29D2  98                   cwde
1:29D3  a3785f               mov word ptr [0x5f78], ax
1:29D6  c3                   ret
loc_29D7:
1:29D7  8ac4                 mov al, ah
1:29D9  ebf7                 jmp 0x29d2
1:29DB  db 00

; ---------------- _getDGROUP@s1:29DC FAR size=16 callers=3
;   C runtime: returns the data segment
1:29DC  2e803eec29b8         cmp byte ptr cs:[0x29ec], 0xb8
1:29E2  7403                 je 0x29e7
1:29E4  8cd0                 mov ax, ss
1:29E6  cb                   retf
loc_29E7:
1:29E7  2ea1ed29             mov ax, word ptr cs:[0x29ed]
1:29EB  cb                   retf

; ---------------- ___EXPORTEDSTUB@s1:29EC size=20 callers=0
;   exported prologue stub
1:29EC  8cd8                 mov ax, ds
1:29EE  90                   nop
1:29EF  45                   inc bp
1:29F0  55                   push bp
1:29F1  8bec                 mov bp, sp
1:29F3  1e                   push ds
1:29F4  8ed8                 mov ds, ax
1:29F6  33c0                 xor ax, ax
1:29F8  8d66fe               lea sp, [bp - 2]
1:29FB  1f                   pop ds
1:29FC  5d                   pop bp
1:29FD  4d                   dec bp
1:29FE  cb                   retf
1:29FF  db 90

; ---------------- fclose@s1:2A00 FAR size=258 callers=1
;   C runtime fclose (flush, free the buffer, close, remove a temp file)
1:2A00  45                   inc bp
1:2A01  55                   push bp
1:2A02  8bec                 mov bp, sp
1:2A04  1e                   push ds
1:2A05  83ec14               sub sp, 0x14
1:2A08  57                   push di
1:2A09  56                   push si
1:2A0A  bfffff               mov di, 0xffff
1:2A0D  8b4606               mov ax, word ptr [bp + 6]
1:2A10  8bf0                 mov si, ax
1:2A12  8bd8                 mov bx, ax
1:2A14  f6470a40             test byte ptr [bx + 0xa], 0x40
1:2A18  7408                 je 0x2a22
1:2A1A  c6470a00             mov byte ptr [bx + 0xa], 0
1:2A1E  e9d500               jmp 0x2af6
1:2A21  db 90
loc_2A22:
1:2A22  f6440a83             test byte ptr [si + 0xa], 0x83
1:2A26  7503                 jne 0x2a2b
1:2A28  e9c700               jmp 0x2af2
loc_2A2B:
1:2A2B  1e                   push ds
1:2A2C  56                   push si
1:2A2D  e87405               call 0x2fa4  ; _flush@s1:2FA4
1:2A30  83c404               add sp, 4
1:2A33  8bf8                 mov di, ax
1:2A35  8bde                 mov bx, si
1:2A37  81eb1062             sub bx, 0x6210
1:2A3B  8b870463             mov ax, word ptr [bx + 0x6304]
1:2A3F  8946fc               mov word ptr [bp - 4], ax
1:2A42  1e                   push ds
1:2A43  56                   push si
1:2A44  e86902               call 0x2cb0  ; _freebuf@s1:2CB0
1:2A47  83c404               add sp, 4
1:2A4A  8a440b               mov al, byte ptr [si + 0xb]
1:2A4D  2ae4                 sub ah, ah
1:2A4F  8946ea               mov word ptr [bp - 0x16], ax
1:2A52  3b068a5f             cmp ax, word ptr [0x5f8a]
1:2A56  7e18                 jle 0x2a70
1:2A58  33c0                 xor ax, ax
1:2A5A  50                   push ax
1:2A5B  ff76ea               push word ptr [bp - 0x16]
1:2A5E  90                   nop
1:2A5F  0e                   push cs
1:2A60  e84e2b               call 0x55b1  ; _amsg_exit_R6020@s1:55B1
1:2A63  83c404               add sp, 4
1:2A66  0bc0                 or ax, ax
1:2A68  7d18                 jge 0x2a82
loc_2A6A:
1:2A6A  b80100               mov ax, 1
1:2A6D  eb15                 jmp 0x2a84
1:2A6F  db 90
loc_2A70:
1:2A70  8a440b               mov al, byte ptr [si + 0xb]
1:2A73  2ae4                 sub ah, ah
1:2A75  50                   push ax
1:2A76  90                   nop
1:2A77  0e                   push cs
1:2A78  e8830b               call 0x35fe  ; _close@s1:35FE
1:2A7B  83c402               add sp, 2
1:2A7E  0bc0                 or ax, ax
1:2A80  7ce8                 jl 0x2a6a
loc_2A82:
1:2A82  33c0                 xor ax, ax
loc_2A84:
1:2A84  8946ec               mov word ptr [bp - 0x14], ax
1:2A87  0bc0                 or ax, ax
1:2A89  7564                 jne 0x2aef
1:2A8B  3946fc               cmp word ptr [bp - 4], ax
1:2A8E  7462                 je 0x2af2
1:2A90  b8ea5f               mov ax, 0x5fea
1:2A93  1e                   push ds
1:2A94  50                   push ax
1:2A95  8d4ef2               lea cx, [bp - 0xe]
1:2A98  16                   push ss
1:2A99  51                   push cx
1:2A9A  90                   nop
1:2A9B  0e                   push cs
1:2A9C  e89f12               call 0x3d3e  ; _fstrcpy@s1:3D3E
1:2A9F  83c408               add sp, 8
1:2AA2  8d46f4               lea ax, [bp - 0xc]
1:2AA5  8946ee               mov word ptr [bp - 0x12], ax
1:2AA8  8c56f0               mov word ptr [bp - 0x10], ss
1:2AAB  807ef25c             cmp byte ptr [bp - 0xe], 0x5c
1:2AAF  7415                 je 0x2ac6
1:2AB1  b8ec5f               mov ax, 0x5fec
1:2AB4  1e                   push ds
1:2AB5  50                   push ax
1:2AB6  8d46f2               lea ax, [bp - 0xe]
1:2AB9  16                   push ss
1:2ABA  50                   push ax
1:2ABB  90                   nop
1:2ABC  0e                   push cs
1:2ABD  e82a12               call 0x3cea  ; _fstrcat@s1:3CEA
1:2AC0  83c408               add sp, 8
1:2AC3  eb04                 jmp 0x2ac9
1:2AC5  db 90
loc_2AC6:
1:2AC6  ff4eee               dec word ptr [bp - 0x12]
loc_2AC9:
1:2AC9  b80a00               mov ax, 0xa
1:2ACC  50                   push ax
1:2ACD  ff76f0               push word ptr [bp - 0x10]
1:2AD0  ff76ee               push word ptr [bp - 0x12]
1:2AD3  ff76fc               push word ptr [bp - 4]
1:2AD6  90                   nop
1:2AD7  0e                   push cs
1:2AD8  e8a713               call 0x3e82  ; _itoa@s1:3E82
1:2ADB  83c408               add sp, 8
1:2ADE  8d46f2               lea ax, [bp - 0xe]
1:2AE1  16                   push ss
1:2AE2  50                   push ax
1:2AE3  90                   nop
1:2AE4  0e                   push cs
1:2AE5  e86626               call 0x514e  ; remove@s1:514E
1:2AE8  83c404               add sp, 4
1:2AEB  0bc0                 or ax, ax
1:2AED  7403                 je 0x2af2
loc_2AEF:
1:2AEF  bfffff               mov di, 0xffff
loc_2AF2:
1:2AF2  c6440a00             mov byte ptr [si + 0xa], 0
loc_2AF6:
1:2AF6  8bc7                 mov ax, di
1:2AF8  5e                   pop si
1:2AF9  5f                   pop di
1:2AFA  8d66fe               lea sp, [bp - 2]
1:2AFD  1f                   pop ds
1:2AFE  5d                   pop bp
1:2AFF  4d                   dec bp
1:2B00  cb                   retf
1:2B01  db 90

; ---------------- _fsopen@s1:2B02 FAR size=58 callers=1
;   C runtime: opens a FILE stream with a share mode
1:2B02  45                   inc bp
1:2B03  55                   push bp
1:2B04  8bec                 mov bp, sp
1:2B06  1e                   push ds
1:2B07  83ec08               sub sp, 8
1:2B0A  90                   nop
1:2B0B  0e                   push cs
1:2B0C  e89b0a               call 0x35aa  ; _getstream@s1:35AA
1:2B0F  8956fc               mov word ptr [bp - 4], dx
1:2B12  0bd0                 or dx, ax
1:2B14  7506                 jne 0x2b1c
1:2B16  33c0                 xor ax, ax
1:2B18  99                   cdq
1:2B19  eb19                 jmp 0x2b34
1:2B1B  db 90
loc_2B1C:
1:2B1C  ff76fc               push word ptr [bp - 4]
1:2B1F  50                   push ax
1:2B20  ff760e               push word ptr [bp + 0xe]
1:2B23  ff760c               push word ptr [bp + 0xc]
1:2B26  ff760a               push word ptr [bp + 0xa]
1:2B29  ff7608               push word ptr [bp + 8]
1:2B2C  ff7606               push word ptr [bp + 6]
1:2B2F  90                   nop
1:2B30  0e                   push cs
1:2B31  e80002               call 0x2d34  ; _openfile@s1:2D34
loc_2B34:
1:2B34  8d66fe               lea sp, [bp - 2]
1:2B37  1f                   pop ds
1:2B38  5d                   pop bp
1:2B39  4d                   dec bp
1:2B3A  cb                   retf
1:2B3B  db 90

; ---------------- fopen@s1:2B3C FAR size=32 callers=1
;   C runtime fopen (used for the debug log simres.out)
1:2B3C  45                   inc bp
1:2B3D  55                   push bp
1:2B3E  8bec                 mov bp, sp
1:2B40  1e                   push ds
1:2B41  33c0                 xor ax, ax
1:2B43  50                   push ax
1:2B44  ff760c               push word ptr [bp + 0xc]
1:2B47  ff760a               push word ptr [bp + 0xa]
1:2B4A  ff7608               push word ptr [bp + 8]
1:2B4D  ff7606               push word ptr [bp + 6]
1:2B50  90                   nop
1:2B51  0e                   push cs
1:2B52  e8adff               call 0x2b02  ; _fsopen@s1:2B02
1:2B55  8d66fe               lea sp, [bp - 2]
1:2B58  1f                   pop ds
1:2B59  5d                   pop bp
1:2B5A  4d                   dec bp
1:2B5B  cb                   retf

; ---------------- fprintf@s1:2B5C FAR size=68 callers=2
;   C runtime fprintf
1:2B5C  45                   inc bp
1:2B5D  55                   push bp
1:2B5E  8bec                 mov bp, sp
1:2B60  1e                   push ds
1:2B61  83ec06               sub sp, 6
1:2B64  57                   push di
1:2B65  56                   push si
1:2B66  8b7606               mov si, word ptr [bp + 6]
1:2B69  1e                   push ds
1:2B6A  56                   push si
1:2B6B  e80603               call 0x2e74  ; _stbuf@s1:2E74
1:2B6E  83c404               add sp, 4
1:2B71  8bf8                 mov di, ax
1:2B73  8d460e               lea ax, [bp + 0xe]
1:2B76  16                   push ss
1:2B77  50                   push ax
1:2B78  ff760c               push word ptr [bp + 0xc]
1:2B7B  ff760a               push word ptr [bp + 0xa]
1:2B7E  1e                   push ds
1:2B7F  56                   push si
1:2B80  90                   nop
1:2B81  0e                   push cs
1:2B82  e82f05               call 0x30b4  ; _output@s1:30B4
1:2B85  83c40c               add sp, 0xc
1:2B88  8946f8               mov word ptr [bp - 8], ax
1:2B8B  1e                   push ds
1:2B8C  56                   push si
1:2B8D  57                   push di
1:2B8E  e86f03               call 0x2f00  ; _ftbuf@s1:2F00
1:2B91  83c406               add sp, 6
1:2B94  8b46f8               mov ax, word ptr [bp - 8]
1:2B97  5e                   pop si
1:2B98  5f                   pop di
1:2B99  8d66fe               lea sp, [bp - 2]
1:2B9C  1f                   pop ds
1:2B9D  5d                   pop bp
1:2B9E  4d                   dec bp
1:2B9F  cb                   retf

; ---------------- _endstdio@s1:2BA0 FAR size=22 callers=0
;   C runtime: flushes and closes the streams at exit
1:2BA0  55                   push bp
1:2BA1  8bec                 mov bp, sp
1:2BA3  90                   nop
1:2BA4  0e                   push cs
1:2BA5  e87c04               call 0x3024  ; flushall@s1:3024
1:2BA8  a0c95f               mov al, byte ptr [0x5fc9]
1:2BAB  0ac0                 or al, al
1:2BAD  7405                 je 0x2bb4
1:2BAF  90                   nop
1:2BB0  0e                   push cs
1:2BB1  e8a813               call 0x3f5c  ; _fcloseall@s1:3F5C
loc_2BB4:
1:2BB4  5d                   pop bp
1:2BB5  cb                   retf

; ---------------- _flsbuf@s1:2BB6 FAR size=250 callers=2
;   C runtime: flushes a full stream buffer
1:2BB6  8cd8                 mov ax, ds
1:2BB8  90                   nop
1:2BB9  45                   inc bp
1:2BBA  55                   push bp
1:2BBB  8bec                 mov bp, sp
1:2BBD  1e                   push ds
1:2BBE  8ed8                 mov ds, ax
1:2BC0  56                   push si
1:2BC1  57                   push di
1:2BC2  8b7608               mov si, word ptr [bp + 8]
1:2BC5  8a440a               mov al, byte ptr [si + 0xa]
1:2BC8  a882                 test al, 0x82
1:2BCA  746b                 je 0x2c37
1:2BCC  a840                 test al, 0x40
1:2BCE  7567                 jne 0x2c37
1:2BD0  c744040000           mov word ptr [si + 4], 0
1:2BD5  a801                 test al, 1
1:2BD7  740b                 je 0x2be4
1:2BD9  a810                 test al, 0x10
1:2BDB  745a                 je 0x2c37
1:2BDD  8b4c06               mov cx, word ptr [si + 6]
1:2BE0  890c                 mov word ptr [si], cx
1:2BE2  24fe                 and al, 0xfe
loc_2BE4:
1:2BE4  0c02                 or al, 2
1:2BE6  24ef                 and al, 0xef
1:2BE8  88440a               mov byte ptr [si + 0xa], al
1:2BEB  8bfe                 mov di, si
1:2BED  81ef1062             sub di, 0x6210
1:2BF1  81c70063             add di, 0x6300
1:2BF5  33db                 xor bx, bx
1:2BF7  8a5c0b               mov bl, byte ptr [si + 0xb]
1:2BFA  a808                 test al, 8
1:2BFC  7552                 jne 0x2c50
1:2BFE  a804                 test al, 4
1:2C00  751f                 jne 0x2c21
1:2C02  f60501               test byte ptr [di], 1
1:2C05  7549                 jne 0x2c50
1:2C07  833eec6100           cmp word ptr [0x61ec], 0
1:2C0C  7432                 je 0x2c40
1:2C0E  81fe1c62             cmp si, 0x621c
1:2C12  7406                 je 0x2c1a
1:2C14  81fe2862             cmp si, 0x6228
1:2C18  7526                 jne 0x2c40
loc_2C1A:
1:2C1A  f687905f40           test byte ptr [bx + 0x5f90], 0x40
1:2C1F  741f                 je 0x2c40
loc_2C21:
1:2C21  b90100               mov cx, 1
1:2C24  8d7e06               lea di, [bp + 6]
1:2C27  51                   push cx
1:2C28  16                   push ss
1:2C29  57                   push di
1:2C2A  53                   push bx
1:2C2B  0e                   push cs
1:2C2C  e8c30d               call 0x39f2  ; _write@s1:39F2
1:2C2F  83c408               add sp, 8
1:2C32  b90100               mov cx, 1
1:2C35  eb46                 jmp 0x2c7d
loc_2C37:
1:2C37  b8ffff               mov ax, 0xffff
1:2C3A  804c0a20             or byte ptr [si + 0xa], 0x20
1:2C3E  eb65                 jmp 0x2ca5
loc_2C40:
1:2C40  53                   push bx
1:2C41  1e                   push ds
1:2C42  56                   push si
1:2C43  e8a200               call 0x2ce8  ; _getbuf@s1:2CE8
1:2C46  83c404               add sp, 4
1:2C49  5b                   pop bx
1:2C4A  f6440a08             test byte ptr [si + 0xa], 8
1:2C4E  74d1                 je 0x2c21
loc_2C50:
1:2C50  8b0c                 mov cx, word ptr [si]
1:2C52  8b5406               mov dx, word ptr [si + 6]
1:2C55  2bca                 sub cx, dx
1:2C57  42                   inc dx
1:2C58  8914                 mov word ptr [si], dx
1:2C5A  8b5502               mov dx, word ptr [di + 2]
1:2C5D  4a                   dec dx
1:2C5E  895404               mov word ptr [si + 4], dx
1:2C61  e325                 jcxz 0x2c88
1:2C63  51                   push cx
1:2C64  51                   push cx
1:2C65  ff7408               push word ptr [si + 8]
1:2C68  ff7406               push word ptr [si + 6]
1:2C6B  53                   push bx
1:2C6C  0e                   push cs
1:2C6D  e8820d               call 0x39f2  ; _write@s1:39F2
1:2C70  83c408               add sp, 8
1:2C73  59                   pop cx
loc_2C74:
1:2C74  c47c06               les di, ptr [si + 6]
1:2C77  8b5606               mov dx, word ptr [bp + 6]
1:2C7A  268815               mov byte ptr es:[di], dl
loc_2C7D:
1:2C7D  3bc1                 cmp ax, cx
1:2C7F  75b6                 jne 0x2c37
1:2C81  33c0                 xor ax, ax
1:2C83  8a4606               mov al, byte ptr [bp + 6]
1:2C86  eb1d                 jmp 0x2ca5
loc_2C88:
1:2C88  33c0                 xor ax, ax
1:2C8A  f687905f20           test byte ptr [bx + 0x5f90], 0x20
1:2C8F  74e3                 je 0x2c74
1:2C91  b90200               mov cx, 2
1:2C94  51                   push cx
1:2C95  50                   push ax
1:2C96  50                   push ax
1:2C97  53                   push bx
1:2C98  0e                   push cs
1:2C99  e89a09               call 0x3636  ; _lseek@s1:3636
1:2C9C  83c408               add sp, 8
1:2C9F  33c0                 xor ax, ax
1:2CA1  8bc8                 mov cx, ax
1:2CA3  ebcf                 jmp 0x2c74
loc_2CA5:
1:2CA5  5f                   pop di
1:2CA6  5e                   pop si
1:2CA7  83ed02               sub bp, 2
1:2CAA  8be5                 mov sp, bp
1:2CAC  1f                   pop ds
1:2CAD  5d                   pop bp
1:2CAE  4d                   dec bp
1:2CAF  cb                   retf

; ---------------- _freebuf@s1:2CB0 FAR size=56 callers=1
;   C runtime: frees a stream buffer
1:2CB0  55                   push bp
1:2CB1  8bec                 mov bp, sp
1:2CB3  56                   push si
1:2CB4  8b7604               mov si, word ptr [bp + 4]
1:2CB7  8a440a               mov al, byte ptr [si + 0xa]
1:2CBA  a883                 test al, 0x83
1:2CBC  7426                 je 0x2ce4
1:2CBE  a808                 test al, 8
1:2CC0  7422                 je 0x2ce4
1:2CC2  ff7408               push word ptr [si + 8]
1:2CC5  ff7406               push word ptr [si + 6]
1:2CC8  90                   nop
1:2CC9  0e                   push cs
1:2CCA  e821ea               call 0x16ee  ; _ffree@s1:16EE
1:2CCD  83c404               add sp, 4
1:2CD0  80640af7             and byte ptr [si + 0xa], 0xf7
1:2CD4  33c0                 xor ax, ax
1:2CD6  894406               mov word ptr [si + 6], ax
1:2CD9  894408               mov word ptr [si + 8], ax
1:2CDC  8904                 mov word ptr [si], ax
1:2CDE  894402               mov word ptr [si + 2], ax
1:2CE1  894404               mov word ptr [si + 4], ax
loc_2CE4:
1:2CE4  5e                   pop si
1:2CE5  5d                   pop bp
1:2CE6  c3                   ret
1:2CE7  db 00

; ---------------- _getbuf@s1:2CE8 size=76 callers=1
;   C runtime: allocates a stream buffer
1:2CE8  55                   push bp
1:2CE9  8bec                 mov bp, sp
1:2CEB  56                   push si
1:2CEC  8b7604               mov si, word ptr [bp + 4]
1:2CEF  b80002               mov ax, 0x200
1:2CF2  50                   push ax
1:2CF3  90                   nop
1:2CF4  0e                   push cs
1:2CF5  e882e9               call 0x167a  ; _fmalloc@s1:167A
1:2CF8  59                   pop cx
1:2CF9  8bde                 mov bx, si
1:2CFB  81eb1062             sub bx, 0x6210
1:2CFF  81c30063             add bx, 0x6300
1:2D03  0bd2                 or dx, dx
1:2D05  740b                 je 0x2d12
1:2D07  804c0a08             or byte ptr [si + 0xa], 8
1:2D0B  c747020002           mov word ptr [bx + 2], 0x200
1:2D10  eb0e                 jmp 0x2d20
loc_2D12:
1:2D12  804c0a04             or byte ptr [si + 0xa], 4
1:2D16  c747020100           mov word ptr [bx + 2], 1
1:2D1B  8cda                 mov dx, ds
1:2D1D  8d4701               lea ax, [bx + 1]
loc_2D20:
1:2D20  895402               mov word ptr [si + 2], dx
1:2D23  8904                 mov word ptr [si], ax
1:2D25  895408               mov word ptr [si + 8], dx
1:2D28  894406               mov word ptr [si + 6], ax
1:2D2B  c744040000           mov word ptr [si + 4], 0
1:2D30  5e                   pop si
1:2D31  5d                   pop bp
1:2D32  c3                   ret
1:2D33  db 00

; ---------------- _openfile@s1:2D34 FAR size=320 callers=1
;   C runtime: parses the fopen mode and opens the file
1:2D34  45                   inc bp
1:2D35  55                   push bp
1:2D36  8bec                 mov bp, sp
1:2D38  1e                   push ds
1:2D39  83ec0c               sub sp, 0xc
1:2D3C  57                   push di
1:2D3D  56                   push si
1:2D3E  a06260               mov al, byte ptr [0x6062]
1:2D41  8846fa               mov byte ptr [bp - 6], al
1:2D44  c746f80000           mov word ptr [bp - 8], 0
1:2D49  c45e0a               les bx, ptr [bp + 0xa]
1:2D4C  268a07               mov al, byte ptr es:[bx]
1:2D4F  98                   cwde
1:2D50  3d7700               cmp ax, 0x77
1:2D53  7457                 je 0x2dac
1:2D55  7708                 ja 0x2d5f
1:2D57  2c61                 sub al, 0x61
1:2D59  745b                 je 0x2db6
1:2D5B  2c11                 sub al, 0x11
1:2D5D  7407                 je 0x2d66
loc_2D5F:
1:2D5F  33c0                 xor ax, ax
1:2D61  99                   cdq
1:2D62  e90601               jmp 0x2e6b
1:2D65  db 90
loc_2D66:
1:2D66  33f6                 xor si, si
1:2D68  c646fc01             mov byte ptr [bp - 4], 1
loc_2D6C:
1:2D6C  c746f60100           mov word ptr [bp - 0xa], 1
loc_2D71:
1:2D71  ff460a               inc word ptr [bp + 0xa]
1:2D74  c45e0a               les bx, ptr [bp + 0xa]
1:2D77  26803f00             cmp byte ptr es:[bx], 0
1:2D7B  7503                 jne 0x2d80
1:2D7D  e98a00               jmp 0x2e0a
loc_2D80:
1:2D80  837ef600             cmp word ptr [bp - 0xa], 0
1:2D84  7503                 jne 0x2d89
1:2D86  e98100               jmp 0x2e0a
loc_2D89:
1:2D89  268a07               mov al, byte ptr es:[bx]
1:2D8C  98                   cwde
1:2D8D  3d7400               cmp ax, 0x74
1:2D90  743c                 je 0x2dce
1:2D92  7710                 ja 0x2da4
1:2D94  2c2b                 sub al, 0x2b
1:2D96  7424                 je 0x2dbc
1:2D98  2c37                 sub al, 0x37
1:2D9A  743e                 je 0x2dda
1:2D9C  fec8                 dec al
1:2D9E  7446                 je 0x2de6
1:2DA0  2c0b                 sub al, 0xb
1:2DA2  7454                 je 0x2df8
loc_2DA4:
1:2DA4  c746f60000           mov word ptr [bp - 0xa], 0
1:2DA9  ebc6                 jmp 0x2d71
1:2DAB  db 90
loc_2DAC:
1:2DAC  be0103               mov si, 0x301
loc_2DAF:
1:2DAF  c646fc02             mov byte ptr [bp - 4], 2
1:2DB3  ebb7                 jmp 0x2d6c
1:2DB5  db 90
loc_2DB6:
1:2DB6  be0901               mov si, 0x109  ; '%s %ld'
1:2DB9  ebf4                 jmp 0x2daf
1:2DBB  db 90
loc_2DBC:
1:2DBC  f7c60200             test si, 2
1:2DC0  75e2                 jne 0x2da4
1:2DC2  83ce02               or si, 2
1:2DC5  83e6fe               and si, 0xfffe
1:2DC8  c646fc80             mov byte ptr [bp - 4], 0x80
1:2DCC  eba3                 jmp 0x2d71
loc_2DCE:
1:2DCE  f7c600c0             test si, 0xc000
1:2DD2  75d0                 jne 0x2da4
1:2DD4  81ce0040             or si, 0x4000
1:2DD8  eb97                 jmp 0x2d71
loc_2DDA:
1:2DDA  f7c600c0             test si, 0xc000
1:2DDE  75c4                 jne 0x2da4
1:2DE0  81ce0080             or si, 0x8000
1:2DE4  eb8b                 jmp 0x2d71
loc_2DE6:
1:2DE6  837ef800             cmp word ptr [bp - 8], 0
1:2DEA  75b8                 jne 0x2da4
1:2DEC  c746f80100           mov word ptr [bp - 8], 1
1:2DF1  804efa40             or byte ptr [bp - 6], 0x40
1:2DF5  e979ff               jmp 0x2d71
loc_2DF8:
1:2DF8  837ef800             cmp word ptr [bp - 8], 0
1:2DFC  75a6                 jne 0x2da4
1:2DFE  c746f80100           mov word ptr [bp - 8], 1
1:2E03  8066fabf             and byte ptr [bp - 6], 0xbf
1:2E07  e967ff               jmp 0x2d71
loc_2E0A:
1:2E0A  b8a401               mov ax, 0x1a4
1:2E0D  50                   push ax
1:2E0E  ff760e               push word ptr [bp + 0xe]
1:2E11  56                   push si
1:2E12  ff7608               push word ptr [bp + 8]
1:2E15  ff7606               push word ptr [bp + 6]
1:2E18  90                   nop
1:2E19  0e                   push cs
1:2E1A  e8ed08               call 0x370a  ; _sopen@s1:370A
1:2E1D  83c40a               add sp, 0xa
1:2E20  8946f4               mov word ptr [bp - 0xc], ax
1:2E23  0bc0                 or ax, ax
1:2E25  7d03                 jge 0x2e2a
1:2E27  e935ff               jmp 0x2d5f
loc_2E2A:
1:2E2A  ff06ee5f             inc word ptr [0x5fee]
1:2E2E  8b4610               mov ax, word ptr [bp + 0x10]
1:2E31  8bf8                 mov di, ax
1:2E33  8bc8                 mov cx, ax
1:2E35  81e91062             sub cx, 0x6210
1:2E39  81c10063             add cx, 0x6300
1:2E3D  8bd8                 mov bx, ax
1:2E3F  8a46fc               mov al, byte ptr [bp - 4]
1:2E42  88470a               mov byte ptr [bx + 0xa], al
1:2E45  2bc0                 sub ax, ax
1:2E47  894502               mov word ptr [di + 2], ax
1:2E4A  8905                 mov word ptr [di], ax
1:2E4C  894508               mov word ptr [di + 8], ax
1:2E4F  894506               mov word ptr [di + 6], ax
1:2E52  8a46f4               mov al, byte ptr [bp - 0xc]
1:2E55  88450b               mov byte ptr [di + 0xb], al
1:2E58  8bd9                 mov bx, cx
1:2E5A  8a46fa               mov al, byte ptr [bp - 6]
1:2E5D  8807                 mov byte ptr [bx], al
1:2E5F  33c0                 xor ax, ax
1:2E61  894504               mov word ptr [di + 4], ax
1:2E64  894704               mov word ptr [bx + 4], ax
1:2E67  8bc7                 mov ax, di
1:2E69  8cda                 mov dx, ds
loc_2E6B:
1:2E6B  5e                   pop si
1:2E6C  5f                   pop di
1:2E6D  8d66fe               lea sp, [bp - 2]
1:2E70  1f                   pop ds
1:2E71  5d                   pop bp
1:2E72  4d                   dec bp
1:2E73  cb                   retf

; ---------------- _stbuf@s1:2E74 size=140 callers=1
;   C runtime: temporary buffering for console streams
1:2E74  55                   push bp
1:2E75  8bec                 mov bp, sp
1:2E77  56                   push si
1:2E78  57                   push di
1:2E79  833eec6100           cmp word ptr [0x61ec], 0
1:2E7E  747a                 je 0x2efa
1:2E80  8b7604               mov si, word ptr [bp + 4]
1:2E83  8bfe                 mov di, si
1:2E85  81ef1062             sub di, 0x6210
1:2E89  81c70063             add di, 0x6300
1:2E8D  bbf25f               mov bx, 0x5ff2
1:2E90  81fe1c62             cmp si, 0x621c
1:2E94  7416                 je 0x2eac
1:2E96  bbf65f               mov bx, 0x5ff6
1:2E99  81fe2862             cmp si, 0x6228
1:2E9D  740d                 je 0x2eac
1:2E9F  a08a5f               mov al, byte ptr [0x5f8a]
1:2EA2  38440b               cmp byte ptr [si + 0xb], al
1:2EA5  7253                 jb 0x2efa
1:2EA7  800d10               or byte ptr [di], 0x10
1:2EAA  eb4e                 jmp 0x2efa
loc_2EAC:
1:2EAC  f6440a0c             test byte ptr [si + 0xa], 0xc
1:2EB0  7548                 jne 0x2efa
1:2EB2  f60501               test byte ptr [di], 1
1:2EB5  7543                 jne 0x2efa
1:2EB7  8b07                 mov ax, word ptr [bx]
1:2EB9  8b5702               mov dx, word ptr [bx + 2]
1:2EBC  8bc8                 mov cx, ax
1:2EBE  0bca                 or cx, dx
1:2EC0  7421                 je 0x2ee3
loc_2EC2:
1:2EC2  894406               mov word ptr [si + 6], ax
1:2EC5  895408               mov word ptr [si + 8], dx
1:2EC8  8904                 mov word ptr [si], ax
1:2ECA  895402               mov word ptr [si + 2], dx
1:2ECD  c744040002           mov word ptr [si + 4], 0x200
1:2ED2  c745020002           mov word ptr [di + 2], 0x200
1:2ED7  804c0a02             or byte ptr [si + 0xa], 2
1:2EDB  c60511               mov byte ptr [di], 0x11
1:2EDE  b80100               mov ax, 1
1:2EE1  eb19                 jmp 0x2efc
loc_2EE3:
1:2EE3  53                   push bx
1:2EE4  b80002               mov ax, 0x200
1:2EE7  50                   push ax
1:2EE8  90                   nop
1:2EE9  0e                   push cs
1:2EEA  e88de7               call 0x167a  ; _fmalloc@s1:167A
1:2EED  5b                   pop bx
1:2EEE  5b                   pop bx
1:2EEF  0bd2                 or dx, dx
1:2EF1  7407                 je 0x2efa
1:2EF3  8907                 mov word ptr [bx], ax
1:2EF5  895702               mov word ptr [bx + 2], dx
1:2EF8  ebc8                 jmp 0x2ec2
loc_2EFA:
1:2EFA  33c0                 xor ax, ax
loc_2EFC:
1:2EFC  5f                   pop di
1:2EFD  5e                   pop si
1:2EFE  5d                   pop bp
1:2EFF  c3                   ret

; ---------------- _ftbuf@s1:2F00 size=72 callers=1
;   C runtime: ends temporary buffering
1:2F00  55                   push bp
1:2F01  8bec                 mov bp, sp
1:2F03  56                   push si
1:2F04  57                   push di
1:2F05  8b7606               mov si, word ptr [bp + 6]
1:2F08  8bfe                 mov di, si
1:2F0A  81ef1062             sub di, 0x6210
1:2F0E  81c70063             add di, 0x6300
1:2F12  f60510               test byte ptr [di], 0x10
1:2F15  742c                 je 0x2f43
1:2F17  33db                 xor bx, bx
1:2F19  8a5c0b               mov bl, byte ptr [si + 0xb]
1:2F1C  f687905f40           test byte ptr [bx + 0x5f90], 0x40
1:2F21  7420                 je 0x2f43
1:2F23  1e                   push ds
1:2F24  56                   push si
1:2F25  e87c00               call 0x2fa4  ; _flush@s1:2FA4
1:2F28  83c404               add sp, 4
1:2F2B  837e0400             cmp word ptr [bp + 4], 0
1:2F2F  7412                 je 0x2f43
1:2F31  33c0                 xor ax, ax
1:2F33  8805                 mov byte ptr [di], al
1:2F35  894502               mov word ptr [di + 2], ax
1:2F38  8904                 mov word ptr [si], ax
1:2F3A  894402               mov word ptr [si + 2], ax
1:2F3D  894406               mov word ptr [si + 6], ax
1:2F40  894408               mov word ptr [si + 8], ax
loc_2F43:
1:2F43  5f                   pop di
1:2F44  5e                   pop si
1:2F45  5d                   pop bp
1:2F46  c3                   ret
1:2F47  db 00

; ---------------- fflush@s1:2F48 FAR size=92 callers=3
;   C runtime fflush (NULL flushes every stream)
1:2F48  45                   inc bp
1:2F49  55                   push bp
1:2F4A  8bec                 mov bp, sp
1:2F4C  1e                   push ds
1:2F4D  56                   push si
1:2F4E  8b4608               mov ax, word ptr [bp + 8]
1:2F51  0b4606               or ax, word ptr [bp + 6]
1:2F54  7508                 jne 0x2f5e
1:2F56  33c0                 xor ax, ax
1:2F58  50                   push ax
1:2F59  e8dc00               call 0x3038  ; _flsall@s1:3038
1:2F5C  eb3e                 jmp 0x2f9c
loc_2F5E:
1:2F5E  ff7608               push word ptr [bp + 8]
1:2F61  ff7606               push word ptr [bp + 6]
1:2F64  e83d00               call 0x2fa4  ; _flush@s1:2FA4
1:2F67  83c404               add sp, 4
1:2F6A  0bc0                 or ax, ax
1:2F6C  7406                 je 0x2f74
1:2F6E  b8ffff               mov ax, 0xffff
1:2F71  eb29                 jmp 0x2f9c
1:2F73  db 90
loc_2F74:
1:2F74  8b7606               mov si, word ptr [bp + 6]
1:2F77  81ee1062             sub si, 0x6210
1:2F7B  81c60063             add si, 0x6300
1:2F7F  f60440               test byte ptr [si], 0x40
1:2F82  7418                 je 0x2f9c
1:2F84  c45e06               les bx, ptr [bp + 6]
1:2F87  2ae4                 sub ah, ah
1:2F89  268a470b             mov al, byte ptr es:[bx + 0xb]
1:2F8D  50                   push ax
1:2F8E  90                   nop
1:2F8F  0e                   push cs
1:2F90  e87710               call 0x400a  ; _commit_flush?@s1:400A
1:2F93  83c402               add sp, 2
1:2F96  3d0100               cmp ax, 1
1:2F99  f5                   cmc
1:2F9A  1bc0                 sbb ax, ax
loc_2F9C:
1:2F9C  5e                   pop si
1:2F9D  8d66fe               lea sp, [bp - 2]
1:2FA0  1f                   pop ds
1:2FA1  5d                   pop bp
1:2FA2  4d                   dec bp
1:2FA3  cb                   retf

; ---------------- _flush@s1:2FA4 size=128 callers=3
;   C runtime: writes a stream's buffer
1:2FA4  55                   push bp
1:2FA5  8bec                 mov bp, sp
1:2FA7  83ec02               sub sp, 2
1:2FAA  57                   push di
1:2FAB  56                   push si
1:2FAC  33ff                 xor di, di
1:2FAE  8b4604               mov ax, word ptr [bp + 4]
1:2FB1  8bd8                 mov bx, ax
1:2FB3  8bf0                 mov si, ax
1:2FB5  8a4f0a               mov cl, byte ptr [bx + 0xa]
1:2FB8  8bd1                 mov dx, cx
1:2FBA  80e103               and cl, 3
1:2FBD  80f902               cmp cl, 2
1:2FC0  7549                 jne 0x300b
1:2FC2  f6c208               test dl, 8
1:2FC5  750b                 jne 0x2fd2
1:2FC7  81eb1062             sub bx, 0x6210
1:2FCB  f687006301           test byte ptr [bx + 0x6300], 1
1:2FD0  7439                 je 0x300b
loc_2FD2:
1:2FD2  8b04                 mov ax, word ptr [si]
1:2FD4  2b4406               sub ax, word ptr [si + 6]
1:2FD7  8946fe               mov word ptr [bp - 2], ax
1:2FDA  0bc0                 or ax, ax
1:2FDC  7e2d                 jle 0x300b
1:2FDE  50                   push ax
1:2FDF  ff7408               push word ptr [si + 8]
1:2FE2  ff7406               push word ptr [si + 6]
1:2FE5  8a440b               mov al, byte ptr [si + 0xb]
1:2FE8  2ae4                 sub ah, ah
1:2FEA  50                   push ax
1:2FEB  90                   nop
1:2FEC  0e                   push cs
1:2FED  e8020a               call 0x39f2  ; _write@s1:39F2
1:2FF0  83c408               add sp, 8
1:2FF3  3b46fe               cmp ax, word ptr [bp - 2]
1:2FF6  750c                 jne 0x3004
1:2FF8  f6440a80             test byte ptr [si + 0xa], 0x80
1:2FFC  740d                 je 0x300b
1:2FFE  80640afd             and byte ptr [si + 0xa], 0xfd
1:3002  eb07                 jmp 0x300b
loc_3004:
1:3004  804c0a20             or byte ptr [si + 0xa], 0x20
1:3008  bfffff               mov di, 0xffff
loc_300B:
1:300B  8b4406               mov ax, word ptr [si + 6]
1:300E  8b5408               mov dx, word ptr [si + 8]
1:3011  8904                 mov word ptr [si], ax
1:3013  895402               mov word ptr [si + 2], dx
1:3016  c744040000           mov word ptr [si + 4], 0
1:301B  8bc7                 mov ax, di
1:301D  5e                   pop si
1:301E  5f                   pop di
1:301F  8be5                 mov sp, bp
1:3021  5d                   pop bp
1:3022  c3                   ret
1:3023  db 90

; ---------------- flushall@s1:3024 FAR size=20 callers=1
;   C runtime flushall
1:3024  45                   inc bp
1:3025  55                   push bp
1:3026  8bec                 mov bp, sp
1:3028  1e                   push ds
1:3029  b80100               mov ax, 1
1:302C  50                   push ax
1:302D  e80800               call 0x3038  ; _flsall@s1:3038
1:3030  8d66fe               lea sp, [bp - 2]
1:3033  1f                   pop ds
1:3034  5d                   pop bp
1:3035  4d                   dec bp
1:3036  cb                   retf
1:3037  db 90

; ---------------- _flsall@s1:3038 size=124 callers=2
;   C runtime: flushes all streams
1:3038  55                   push bp
1:3039  8bec                 mov bp, sp
1:303B  83ec02               sub sp, 2
1:303E  57                   push di
1:303F  56                   push si
1:3040  be1062               mov si, 0x6210
1:3043  33ff                 xor di, di
1:3045  897efe               mov word ptr [bp - 2], di
1:3048  eb21                 jmp 0x306b
loc_304A:
1:304A  837e0400             cmp word ptr [bp + 4], 0
1:304E  7518                 jne 0x3068
1:3050  f6440a02             test byte ptr [si + 0xa], 2
1:3054  7412                 je 0x3068
1:3056  1e                   push ds
1:3057  56                   push si
1:3058  90                   nop
1:3059  0e                   push cs
1:305A  e8ebfe               call 0x2f48  ; fflush@s1:2F48
1:305D  83c404               add sp, 4
1:3060  40                   inc ax
1:3061  7505                 jne 0x3068
1:3063  c746feffff           mov word ptr [bp - 2], 0xffff
loc_3068:
1:3068  83c60c               add si, 0xc
loc_306B:
1:306B  3936f05f             cmp word ptr [0x5ff0], si
1:306F  721d                 jb 0x308e
1:3071  837e0401             cmp word ptr [bp + 4], 1
1:3075  75d3                 jne 0x304a
1:3077  f6440a83             test byte ptr [si + 0xa], 0x83
1:307B  74cd                 je 0x304a
1:307D  1e                   push ds
1:307E  56                   push si
1:307F  90                   nop
1:3080  0e                   push cs
1:3081  e8c4fe               call 0x2f48  ; fflush@s1:2F48
1:3084  83c404               add sp, 4
1:3087  40                   inc ax
1:3088  74de                 je 0x3068
1:308A  47                   inc di
1:308B  ebdb                 jmp 0x3068
1:308D  db 90
loc_308E:
1:308E  837e0401             cmp word ptr [bp + 4], 1
1:3092  7504                 jne 0x3098
1:3094  8bc7                 mov ax, di
1:3096  eb03                 jmp 0x309b
loc_3098:
1:3098  8b46fe               mov ax, word ptr [bp - 2]
loc_309B:
1:309B  5e                   pop si
1:309C  5f                   pop di
1:309D  8be5                 mov sp, bp
1:309F  5d                   pop bp
1:30A0  c20200               ret 2
1:30A3  db 90
switch_table_30A4:
    dw loc_3113
    dw loc_311E
    dw loc_3134
    dw loc_3168
    dw loc_3194
    dw loc_319C
    dw loc_31C5
    dw loc_31F7

; ---------------- _output@s1:30B4 FAR size=1051 callers=2
;   C runtime printf formatting engine
1:30B4  8cd8                 mov ax, ds
1:30B6  90                   nop
1:30B7  45                   inc bp
1:30B8  55                   push bp
1:30B9  8bec                 mov bp, sp
1:30BB  1e                   push ds
1:30BC  8ed8                 mov ds, ax
1:30BE  b81402               mov ax, 0x214  ; 'SOLClearWnd'
1:30C1  0e                   push cs
1:30C2  e82df5               call 0x25f2  ; _chkstk@s1:25F2
1:30C5  56                   push si
1:30C6  57                   push di
1:30C7  33c0                 xor ax, ax
1:30C9  8946f6               mov word ptr [bp - 0xa], ax
1:30CC  8846f9               mov byte ptr [bp - 7], al
loc_30CF:
1:30CF  c4760a               les si, ptr [bp + 0xa]
1:30D2  26ac                 lodsb al, byte ptr es:[si]
1:30D4  89760a               mov word ptr [bp + 0xa], si
1:30D7  8846fc               mov byte ptr [bp - 4], al
1:30DA  0ac0                 or al, al
1:30DC  7406                 je 0x30e4
1:30DE  837ef600             cmp word ptr [bp - 0xa], 0
1:30E2  7d06                 jge 0x30ea
loc_30E4:
1:30E4  8b46f6               mov ax, word ptr [bp - 0xa]
1:30E7  e9b504               jmp 0x359f
loc_30EA:
1:30EA  bbfe5f               mov bx, 0x5ffe
1:30ED  2c20                 sub al, 0x20
1:30EF  3c58                 cmp al, 0x58
1:30F1  7705                 ja 0x30f8
1:30F3  d7                   xlatb
1:30F4  240f                 and al, 0xf
1:30F6  eb02                 jmp 0x30fa
loc_30F8:
1:30F8  b000                 mov al, 0
loc_30FA:
1:30FA  b103                 mov cl, 3
1:30FC  d2e0                 shl al, cl
1:30FE  0246f9               add al, byte ptr [bp - 7]
1:3101  d7                   xlatb
1:3102  fec1                 inc cl
1:3104  d2e8                 shr al, cl
1:3106  8846f9               mov byte ptr [bp - 7], al
1:3109  98                   cwde
1:310A  8bd8                 mov bx, ax
1:310C  d1e3                 shl bx, 1
1:310E  2effa7a430           jmp word ptr cs:[bx + 0x30a4]
loc_3113:
1:3113  8a56fc               mov dl, byte ptr [bp - 4]
1:3116  b90100               mov cx, 1
1:3119  e83604               call 0x3552  ; _output_pad@s1:3552
1:311C  ebb1                 jmp 0x30cf
loc_311E:
1:311E  33c0                 xor ax, ax
1:3120  8946ee               mov word ptr [bp - 0x12], ax
1:3123  8946f4               mov word ptr [bp - 0xc], ax
1:3126  8946ec               mov word ptr [bp - 0x14], ax
1:3129  c746fa2000           mov word ptr [bp - 6], 0x20  ; 'New failed in Op::Op'
1:312E  48                   dec ax
1:312F  8946f2               mov word ptr [bp - 0xe], ax
1:3132  eb9b                 jmp 0x30cf
loc_3134:
1:3134  8a46fc               mov al, byte ptr [bp - 4]
1:3137  3c2d                 cmp al, 0x2d
1:3139  7506                 jne 0x3141
1:313B  804efa04             or byte ptr [bp - 6], 4
1:313F  eb8e                 jmp 0x30cf
loc_3141:
1:3141  3c2b                 cmp al, 0x2b
1:3143  7506                 jne 0x314b
1:3145  804efa01             or byte ptr [bp - 6], 1
1:3149  eb84                 jmp 0x30cf
loc_314B:
1:314B  3c20                 cmp al, 0x20
1:314D  7507                 jne 0x3156
1:314F  804efa02             or byte ptr [bp - 6], 2
1:3153  e979ff               jmp 0x30cf
loc_3156:
1:3156  3c23                 cmp al, 0x23
1:3158  7507                 jne 0x3161
1:315A  804efa80             or byte ptr [bp - 6], 0x80
1:315E  e96eff               jmp 0x30cf
loc_3161:
1:3161  804efa08             or byte ptr [bp - 6], 8
1:3165  e967ff               jmp 0x30cf
loc_3168:
1:3168  8a4efc               mov cl, byte ptr [bp - 4]
1:316B  80f92a               cmp cl, 0x2a
1:316E  750f                 jne 0x317f
1:3170  e85c03               call 0x34cf  ; _output_getint@s1:34CF
1:3173  0bc0                 or ax, ax
1:3175  7917                 jns 0x318e
1:3177  f7d8                 neg ax
1:3179  804efa04             or byte ptr [bp - 6], 4
1:317D  eb0f                 jmp 0x318e
loc_317F:
1:317F  80e930               sub cl, 0x30
1:3182  32ed                 xor ch, ch
1:3184  8b46f4               mov ax, word ptr [bp - 0xc]
1:3187  bb0a00               mov bx, 0xa
1:318A  f7e3                 mul bx
1:318C  03c1                 add ax, cx
loc_318E:
1:318E  8946f4               mov word ptr [bp - 0xc], ax
1:3191  e93bff               jmp 0x30cf
loc_3194:
1:3194  c746f20000           mov word ptr [bp - 0xe], 0
1:3199  e933ff               jmp 0x30cf
loc_319C:
1:319C  8a4efc               mov cl, byte ptr [bp - 4]
1:319F  80f92a               cmp cl, 0x2a
1:31A2  750c                 jne 0x31b0
1:31A4  e82803               call 0x34cf  ; _output_getint@s1:34CF
1:31A7  0bc0                 or ax, ax
1:31A9  7914                 jns 0x31bf
1:31AB  b8ffff               mov ax, 0xffff
1:31AE  eb0f                 jmp 0x31bf
loc_31B0:
1:31B0  80e930               sub cl, 0x30
1:31B3  32ed                 xor ch, ch
1:31B5  8b46f2               mov ax, word ptr [bp - 0xe]
1:31B8  bb0a00               mov bx, 0xa
1:31BB  f7e3                 mul bx
1:31BD  03c1                 add ax, cx
loc_31BF:
1:31BF  8946f2               mov word ptr [bp - 0xe], ax
1:31C2  e90aff               jmp 0x30cf
loc_31C5:
1:31C5  8a46fc               mov al, byte ptr [bp - 4]
1:31C8  3c6c                 cmp al, 0x6c
1:31CA  7506                 jne 0x31d2
1:31CC  804efa10             or byte ptr [bp - 6], 0x10
1:31D0  eb22                 jmp 0x31f4
loc_31D2:
1:31D2  3c46                 cmp al, 0x46
1:31D4  7506                 jne 0x31dc
1:31D6  804efa20             or byte ptr [bp - 6], 0x20
1:31DA  eb18                 jmp 0x31f4
loc_31DC:
1:31DC  3c4e                 cmp al, 0x4e
1:31DE  7506                 jne 0x31e6
1:31E0  804efb10             or byte ptr [bp - 5], 0x10
1:31E4  eb0e                 jmp 0x31f4
loc_31E6:
1:31E6  3c4c                 cmp al, 0x4c
1:31E8  7506                 jne 0x31f0
1:31EA  804efb04             or byte ptr [bp - 5], 4
1:31EE  eb04                 jmp 0x31f4
loc_31F0:
1:31F0  804efb08             or byte ptr [bp - 5], 8
loc_31F4:
1:31F4  e9d8fe               jmp 0x30cf
loc_31F7:
1:31F7  8a46fc               mov al, byte ptr [bp - 4]
1:31FA  3c64                 cmp al, 0x64
1:31FC  7503                 jne 0x3201
1:31FE  e99401               jmp 0x3395
loc_3201:
1:3201  3c69                 cmp al, 0x69
1:3203  7503                 jne 0x3208
1:3205  e98d01               jmp 0x3395
loc_3208:
1:3208  3c75                 cmp al, 0x75
1:320A  7503                 jne 0x320f
1:320C  e98a01               jmp 0x3399
loc_320F:
1:320F  3c58                 cmp al, 0x58
1:3211  7503                 jne 0x3216
1:3213  e98901               jmp 0x339f
loc_3216:
1:3216  3c78                 cmp al, 0x78
1:3218  7503                 jne 0x321d
1:321A  e98801               jmp 0x33a5
loc_321D:
1:321D  3c6f                 cmp al, 0x6f
1:321F  7503                 jne 0x3224
1:3221  e9a201               jmp 0x33c6
loc_3224:
1:3224  3c63                 cmp al, 0x63
1:3226  741a                 je 0x3242
1:3228  3c73                 cmp al, 0x73
1:322A  7427                 je 0x3253
1:322C  3c6e                 cmp al, 0x6e
1:322E  7451                 je 0x3281
1:3230  3c70                 cmp al, 0x70
1:3232  7460                 je 0x3294
1:3234  3c45                 cmp al, 0x45
1:3236  7407                 je 0x323f
1:3238  3c47                 cmp al, 0x47
1:323A  7403                 je 0x323f
1:323C  e9bb00               jmp 0x32fa
loc_323F:
1:323F  e9b500               jmp 0x32f7
loc_3242:
1:3242  e88a02               call 0x34cf  ; _output_getint@s1:34CF
1:3245  8dbeeafd             lea di, [bp - 0x216]
1:3249  16                   push ss
1:324A  07                   pop es
1:324B  aa                   stosb byte ptr es:[di], al
1:324C  4f                   dec di
1:324D  b90100               mov cx, 1
1:3250  e9f101               jmp 0x3444
loc_3253:
1:3253  e89002               call 0x34e6  ; _output_getptr@s1:34E6
1:3256  0bff                 or di, di
1:3258  7512                 jne 0x326c
1:325A  8cc0                 mov ax, es
1:325C  0bc0                 or ax, ax
1:325E  750c                 jne 0x326c
1:3260  1e                   push ds
1:3261  07                   pop es
1:3262  bf5760               mov di, 0x6057
1:3265  8b0e5d60             mov cx, word ptr [0x605d]
1:3269  e9d801               jmp 0x3444
loc_326C:
1:326C  57                   push di
1:326D  8b4ef2               mov cx, word ptr [bp - 0xe]
1:3270  e307                 jcxz 0x3279
1:3272  32c0                 xor al, al
1:3274  f2ae                 repne scasb al, byte ptr es:[di]
1:3276  7501                 jne 0x3279
1:3278  4f                   dec di
loc_3279:
1:3279  59                   pop cx
1:327A  2bf9                 sub di, cx
1:327C  87cf                 xchg di, cx
1:327E  e9c301               jmp 0x3444
loc_3281:
1:3281  e86202               call 0x34e6  ; _output_getptr@s1:34E6
1:3284  8b46f6               mov ax, word ptr [bp - 0xa]
1:3287  ab                   stosw word ptr es:[di], ax
1:3288  f646fa10             test byte ptr [bp - 6], 0x10
1:328C  7403                 je 0x3291
1:328E  33c0                 xor ax, ax
1:3290  ab                   stosw word ptr es:[di], ax
loc_3291:
1:3291  e93bfe               jmp 0x30cf
loc_3294:
1:3294  f646fa30             test byte ptr [bp - 6], 0x30
1:3298  7505                 jne 0x329f
1:329A  e83202               call 0x34cf  ; _output_getint@s1:34CF
1:329D  eb39                 jmp 0x32d8
loc_329F:
1:329F  e83602               call 0x34d8  ; _output_getlong@s1:34D8
1:32A2  f646fb18             test byte ptr [bp - 5], 0x18
1:32A6  7530                 jne 0x32d8
1:32A8  c646fd07             mov byte ptr [bp - 3], 7
1:32AC  b91000               mov cx, 0x10
1:32AF  16                   push ss
1:32B0  07                   pop es
1:32B1  52                   push dx
1:32B2  33d2                 xor dx, dx
1:32B4  8dbef2fd             lea di, [bp - 0x20e]
1:32B8  be0400               mov si, 4
1:32BB  e8b002               call 0x356e  ; _output_cvtnum@s1:356E
1:32BE  b91000               mov cx, 0x10
1:32C1  8dbeedfd             lea di, [bp - 0x213]
1:32C5  58                   pop ax
1:32C6  33d2                 xor dx, dx
1:32C8  be0400               mov si, 4
1:32CB  e8a002               call 0x356e  ; _output_cvtnum@s1:356E
1:32CE  c686eefd3a           mov byte ptr [bp - 0x212], 0x3a
1:32D3  b90900               mov cx, 9
1:32D6  eb18                 jmp 0x32f0
loc_32D8:
1:32D8  c646fd07             mov byte ptr [bp - 3], 7
1:32DC  b91000               mov cx, 0x10
1:32DF  16                   push ss
1:32E0  07                   pop es
1:32E1  33d2                 xor dx, dx
1:32E3  8dbeedfd             lea di, [bp - 0x213]
1:32E7  be0400               mov si, 4
1:32EA  e88102               call 0x356e  ; _output_cvtnum@s1:356E
1:32ED  b90400               mov cx, 4
loc_32F0:
1:32F0  8dbeeafd             lea di, [bp - 0x216]
1:32F4  e94d01               jmp 0x3444
loc_32F7:
1:32F7  ff46ec               inc word ptr [bp - 0x14]
loc_32FA:
1:32FA  804efa40             or byte ptr [bp - 6], 0x40
1:32FE  8a46fc               mov al, byte ptr [bp - 4]
1:3301  0c20                 or al, 0x20
1:3303  98                   cwde
1:3304  8bf0                 mov si, ax
1:3306  837ef200             cmp word ptr [bp - 0xe], 0
1:330A  7f13                 jg 0x331f
1:330C  7407                 je 0x3315
1:330E  c746f20600           mov word ptr [bp - 0xe], 6
1:3313  eb0a                 jmp 0x331f
loc_3315:
1:3315  83f867               cmp ax, 0x67
1:3318  7505                 jne 0x331f
1:331A  c746f20100           mov word ptr [bp - 0xe], 1
loc_331F:
1:331F  8dbeeafd             lea di, [bp - 0x216]
1:3323  ff76ec               push word ptr [bp - 0x14]
1:3326  ff76f2               push word ptr [bp - 0xe]
1:3329  56                   push si
1:332A  16                   push ss
1:332B  57                   push di
1:332C  ff7610               push word ptr [bp + 0x10]
1:332F  ff760e               push word ptr [bp + 0xe]
1:3332  f646fb04             test byte ptr [bp - 5], 4
1:3336  740a                 je 0x3342
1:3338  ff1e7c60             lcall [0x607c]
1:333C  83460e0a             add word ptr [bp + 0xe], 0xa
1:3340  eb08                 jmp 0x334a
loc_3342:
1:3342  ff1e6860             lcall [0x6068]
1:3346  83460e08             add word ptr [bp + 0xe], 8
loc_334A:
1:334A  83c40e               add sp, 0xe
1:334D  f646fa80             test byte ptr [bp - 6], 0x80
1:3351  740f                 je 0x3362
1:3353  837ef200             cmp word ptr [bp - 0xe], 0
1:3357  7509                 jne 0x3362
1:3359  16                   push ss
1:335A  57                   push di
1:335B  ff1e7460             lcall [0x6074]
1:335F  83c404               add sp, 4
loc_3362:
1:3362  83fe67               cmp si, 0x67
1:3365  7510                 jne 0x3377
1:3367  f746fa8000           test word ptr [bp - 6], 0x80
1:336C  7509                 jne 0x3377
1:336E  16                   push ss
1:336F  57                   push di
1:3370  ff1e7060             lcall [0x6070]
1:3374  83c404               add sp, 4
loc_3377:
1:3377  16                   push ss
1:3378  07                   pop es
1:3379  26803d2d             cmp byte ptr es:[di], 0x2d
1:337D  7505                 jne 0x3384
1:337F  47                   inc di
1:3380  804efb01             or byte ptr [bp - 5], 1
loc_3384:
1:3384  b9ffff               mov cx, 0xffff
1:3387  57                   push di
1:3388  b000                 mov al, 0
1:338A  f2ae                 repne scasb al, byte ptr es:[di]
1:338C  4f                   dec di
1:338D  59                   pop cx
1:338E  2bf9                 sub di, cx
1:3390  87cf                 xchg di, cx
1:3392  e9af00               jmp 0x3444
loc_3395:
1:3395  804efa40             or byte ptr [bp - 6], 0x40
loc_3399:
1:3399  c646f80a             mov byte ptr [bp - 8], 0xa
1:339D  eb35                 jmp 0x33d4
loc_339F:
1:339F  c646fd07             mov byte ptr [bp - 3], 7
1:33A3  eb04                 jmp 0x33a9
loc_33A5:
1:33A5  c646fd27             mov byte ptr [bp - 3], 0x27
loc_33A9:
1:33A9  f646fa80             test byte ptr [bp - 6], 0x80
1:33AD  7411                 je 0x33c0
1:33AF  c746ee0200           mov word ptr [bp - 0x12], 2
1:33B4  c646f030             mov byte ptr [bp - 0x10], 0x30
1:33B8  b251                 mov dl, 0x51
1:33BA  0256fd               add dl, byte ptr [bp - 3]
1:33BD  8856f1               mov byte ptr [bp - 0xf], dl
loc_33C0:
1:33C0  c646f810             mov byte ptr [bp - 8], 0x10
1:33C4  eb0e                 jmp 0x33d4
loc_33C6:
1:33C6  f646fa80             test byte ptr [bp - 6], 0x80
1:33CA  7404                 je 0x33d0
1:33CC  804efb02             or byte ptr [bp - 5], 2
loc_33D0:
1:33D0  c646f808             mov byte ptr [bp - 8], 8
loc_33D4:
1:33D4  f646fa10             test byte ptr [bp - 6], 0x10
1:33D8  7405                 je 0x33df
1:33DA  e8fb00               call 0x34d8  ; _output_getlong@s1:34D8
1:33DD  eb0e                 jmp 0x33ed
loc_33DF:
1:33DF  e8ed00               call 0x34cf  ; _output_getint@s1:34CF
1:33E2  f646fa40             test byte ptr [bp - 6], 0x40
1:33E6  7403                 je 0x33eb
1:33E8  99                   cdq
1:33E9  eb02                 jmp 0x33ed
loc_33EB:
1:33EB  33d2                 xor dx, dx
loc_33ED:
1:33ED  f646fa40             test byte ptr [bp - 6], 0x40
1:33F1  740f                 je 0x3402
1:33F3  0bd2                 or dx, dx
1:33F5  7d0b                 jge 0x3402
1:33F7  804efb01             or byte ptr [bp - 5], 1
1:33FB  f7d8                 neg ax
1:33FD  83d200               adc dx, 0
1:3400  f7da                 neg dx
loc_3402:
1:3402  837ef200             cmp word ptr [bp - 0xe], 0
1:3406  7d07                 jge 0x340f
1:3408  c746f20100           mov word ptr [bp - 0xe], 1
1:340D  eb04                 jmp 0x3413
loc_340F:
1:340F  8066faf7             and byte ptr [bp - 6], 0xf7
loc_3413:
1:3413  8bd8                 mov bx, ax
1:3415  0bda                 or bx, dx
1:3417  7505                 jne 0x341e
1:3419  c746ee0000           mov word ptr [bp - 0x12], 0
loc_341E:
1:341E  8d7ee9               lea di, [bp - 0x17]
1:3421  16                   push ss
1:3422  07                   pop es
1:3423  8a4ef8               mov cl, byte ptr [bp - 8]
1:3426  32ed                 xor ch, ch
1:3428  8b76f2               mov si, word ptr [bp - 0xe]
1:342B  e84001               call 0x356e  ; _output_cvtnum@s1:356E
1:342E  f646fb02             test byte ptr [bp - 5], 2
1:3432  740e                 je 0x3442
1:3434  e306                 jcxz 0x343c
1:3436  26803d30             cmp byte ptr es:[di], 0x30
1:343A  7406                 je 0x3442
loc_343C:
1:343C  4f                   dec di
1:343D  26c60530             mov byte ptr es:[di], 0x30
1:3441  41                   inc cx
loc_3442:
1:3442  eb00                 jmp 0x3444
loc_3444:
1:3444  f646fa40             test byte ptr [bp - 6], 0x40
1:3448  7431                 je 0x347b
1:344A  f646fb01             test byte ptr [bp - 5], 1
1:344E  740b                 je 0x345b
1:3450  c646f02d             mov byte ptr [bp - 0x10], 0x2d
1:3454  c746ee0100           mov word ptr [bp - 0x12], 1
1:3459  eb20                 jmp 0x347b
loc_345B:
1:345B  f646fa01             test byte ptr [bp - 6], 1
1:345F  740b                 je 0x346c
1:3461  c646f02b             mov byte ptr [bp - 0x10], 0x2b
1:3465  c746ee0100           mov word ptr [bp - 0x12], 1
1:346A  eb0f                 jmp 0x347b
loc_346C:
1:346C  f646fa02             test byte ptr [bp - 6], 2
1:3470  7409                 je 0x347b
1:3472  c646f020             mov byte ptr [bp - 0x10], 0x20  ; 'New failed in Op::Op'
1:3476  c746ee0100           mov word ptr [bp - 0x12], 1
loc_347B:
1:347B  8b46f4               mov ax, word ptr [bp - 0xc]
1:347E  2bc1                 sub ax, cx
1:3480  2b46ee               sub ax, word ptr [bp - 0x12]
1:3483  7d02                 jge 0x3487
1:3485  33c0                 xor ax, ax
loc_3487:
1:3487  06                   push es
1:3488  57                   push di
1:3489  51                   push cx
1:348A  f646fa0c             test byte ptr [bp - 6], 0xc
1:348E  7507                 jne 0x3497
1:3490  8bc8                 mov cx, ax
1:3492  b220                 mov dl, 0x20  ; 'New failed in Op::Op'
1:3494  e8bb00               call 0x3552  ; _output_pad@s1:3552
loc_3497:
1:3497  50                   push ax
1:3498  16                   push ss
1:3499  07                   pop es
1:349A  8d7ef0               lea di, [bp - 0x10]
1:349D  8b4eee               mov cx, word ptr [bp - 0x12]
1:34A0  e89100               call 0x3534  ; _output_putstr@s1:3534
1:34A3  58                   pop ax
1:34A4  f646fa08             test byte ptr [bp - 6], 8
1:34A8  740d                 je 0x34b7
1:34AA  f646fa04             test byte ptr [bp - 6], 4
1:34AE  7507                 jne 0x34b7
1:34B0  8bc8                 mov cx, ax
1:34B2  b230                 mov dl, 0x30
1:34B4  e89b00               call 0x3552  ; _output_pad@s1:3552
loc_34B7:
1:34B7  59                   pop cx
1:34B8  5f                   pop di
1:34B9  07                   pop es
1:34BA  50                   push ax
1:34BB  e87600               call 0x3534  ; _output_putstr@s1:3534
1:34BE  58                   pop ax
1:34BF  f646fa04             test byte ptr [bp - 6], 4
1:34C3  7407                 je 0x34cc
1:34C5  8bc8                 mov cx, ax
1:34C7  b220                 mov dl, 0x20  ; 'New failed in Op::Op'
1:34C9  e88600               call 0x3552  ; _output_pad@s1:3552
loc_34CC:
1:34CC  e900fc               jmp 0x30cf

; ---------------- _output_getint@s1:34CF size=9 callers=2
;   C runtime _output helper: next int argument
1:34CF  c4760e               les si, ptr [bp + 0xe]
1:34D2  26ad                 lodsw ax, word ptr es:[si]
1:34D4  89760e               mov word ptr [bp + 0xe], si
1:34D7  c3                   ret

; ---------------- _output_getlong@s1:34D8 size=14 callers=2
;   C runtime _output helper: next long argument
1:34D8  c4760e               les si, ptr [bp + 0xe]
1:34DB  26ad                 lodsw ax, word ptr es:[si]
1:34DD  8bd0                 mov dx, ax
1:34DF  26ad                 lodsw ax, word ptr es:[si]
1:34E1  92                   xchg dx, ax
1:34E2  89760e               mov word ptr [bp + 0xe], si
1:34E5  c3                   ret

; ---------------- _output_getptr@s1:34E6 size=29 callers=1
;   C runtime _output helper: next pointer argument
1:34E6  f646fa20             test byte ptr [bp - 6], 0x20
1:34EA  7408                 je 0x34f4
1:34EC  e8e9ff               call 0x34d8  ; _output_getlong@s1:34D8
1:34EF  8ec2                 mov es, dx
1:34F1  8bf8                 mov di, ax
1:34F3  c3                   ret
loc_34F4:
1:34F4  e8d8ff               call 0x34cf  ; _output_getint@s1:34CF
1:34F7  8bf8                 mov di, ax
1:34F9  0bc0                 or ax, ax
1:34FB  7503                 jne 0x3500
1:34FD  8ec0                 mov es, ax
1:34FF  c3                   ret
loc_3500:
1:3500  1e                   push ds
1:3501  07                   pop es
1:3502  c3                   ret

; ---------------- _output_putc@s1:3503 size=49 callers=2
;   C runtime _output helper: writes one character
1:3503  98                   cwde
1:3504  06                   push es
1:3505  57                   push di
1:3506  c45e06               les bx, ptr [bp + 6]
1:3509  26ff4f04             dec word ptr es:[bx + 4]
1:350D  7810                 js 0x351f
1:350F  268b3f               mov di, word ptr es:[bx]
1:3512  26ff07               inc word ptr es:[bx]
1:3515  268e4702             mov es, word ptr es:[bx + 2]
1:3519  aa                   stosb byte ptr es:[di], al
loc_351A:
1:351A  33c0                 xor ax, ax
loc_351C:
1:351C  5f                   pop di
1:351D  07                   pop es
1:351E  c3                   ret
loc_351F:
1:351F  51                   push cx
1:3520  52                   push dx
1:3521  06                   push es
1:3522  53                   push bx
1:3523  50                   push ax
1:3524  0e                   push cs
1:3525  e88ef6               call 0x2bb6  ; _flsbuf@s1:2BB6
1:3528  83c406               add sp, 6
1:352B  5a                   pop dx
1:352C  59                   pop cx
1:352D  83f8ff               cmp ax, -1
1:3530  75e8                 jne 0x351a
1:3532  ebe8                 jmp 0x351c

; ---------------- _output_putstr@s1:3534 size=30 callers=1
;   C runtime _output helper: writes a string
1:3534  e31b                 jcxz 0x3551
1:3536  8bf7                 mov si, di
1:3538  014ef6               add word ptr [bp - 0xa], cx
1:353B  57                   push di
1:353C  33ff                 xor di, di
loc_353E:
1:353E  26ac                 lodsb al, byte ptr es:[si]
1:3540  e8c0ff               call 0x3503  ; _output_putc@s1:3503
1:3543  0bf8                 or di, ax
1:3545  e2f7                 loop 0x353e
1:3547  0bff                 or di, di
1:3549  5f                   pop di
1:354A  7405                 je 0x3551
1:354C  c746f6ffff           mov word ptr [bp - 0xa], 0xffff
loc_3551:
1:3551  c3                   ret

; ---------------- _output_pad@s1:3552 size=28 callers=1
;   C runtime _output helper: writes padding
1:3552  e319                 jcxz 0x356d
1:3554  014ef6               add word ptr [bp - 0xa], cx
1:3557  57                   push di
1:3558  33ff                 xor di, di
loc_355A:
1:355A  8ac2                 mov al, dl
1:355C  e8a4ff               call 0x3503  ; _output_putc@s1:3503
1:355F  0bf8                 or di, ax
1:3561  e2f7                 loop 0x355a
1:3563  0bff                 or di, di
1:3565  5f                   pop di
1:3566  7405                 je 0x356d
1:3568  c746f6ffff           mov word ptr [bp - 0xa], 0xffff
loc_356D:
1:356D  c3                   ret

; ---------------- _output_cvtnum@s1:356E size=60 callers=1
;   C runtime _output helper: number to digits
1:356E  fd                   std
1:356F  57                   push di
1:3570  93                   xchg bx, ax
loc_3571:
1:3571  0bf6                 or si, si
1:3573  7f0a                 jg 0x357f
1:3575  0bdb                 or bx, bx
1:3577  7506                 jne 0x357f
1:3579  0bd2                 or dx, dx
1:357B  7502                 jne 0x357f
1:357D  eb1a                 jmp 0x3599
loc_357F:
1:357F  92                   xchg dx, ax
1:3580  33d2                 xor dx, dx
1:3582  f7f1                 div cx
1:3584  93                   xchg bx, ax
1:3585  f7f1                 div cx
1:3587  92                   xchg dx, ax
1:3588  87d3                 xchg bx, dx
1:358A  0430                 add al, 0x30
1:358C  3c39                 cmp al, 0x39
1:358E  7603                 jbe 0x3593
1:3590  0246fd               add al, byte ptr [bp - 3]
loc_3593:
1:3593  aa                   stosb byte ptr es:[di], al
1:3594  8bc2                 mov ax, dx
1:3596  4e                   dec si
1:3597  ebd8                 jmp 0x3571
loc_3599:
1:3599  59                   pop cx
1:359A  2bcf                 sub cx, di
1:359C  47                   inc di
1:359D  fc                   cld
1:359E  c3                   ret
loc_359F:
1:359F  5f                   pop di
1:35A0  5e                   pop si
1:35A1  83ed02               sub bp, 2
1:35A4  8be5                 mov sp, bp
1:35A6  1f                   pop ds
1:35A7  5d                   pop bp
1:35A8  4d                   dec bp
1:35A9  cb                   retf

; ---------------- _getstream@s1:35AA FAR size=84 callers=1
;   C runtime: finds a free FILE slot
1:35AA  45                   inc bp
1:35AB  55                   push bp
1:35AC  8bec                 mov bp, sp
1:35AE  1e                   push ds
1:35AF  83ec04               sub sp, 4
1:35B2  56                   push si
1:35B3  be1062               mov si, 0x6210
1:35B6  2bc0                 sub ax, ax
1:35B8  8946fc               mov word ptr [bp - 4], ax
1:35BB  8946fa               mov word ptr [bp - 6], ax
1:35BE  eb03                 jmp 0x35c3
loc_35C0:
1:35C0  83c60c               add si, 0xc
loc_35C3:
1:35C3  3936f05f             cmp word ptr [0x5ff0], si
1:35C7  7226                 jb 0x35ef
1:35C9  f6440a83             test byte ptr [si + 0xa], 0x83
1:35CD  75f1                 jne 0x35c0
1:35CF  c6440a00             mov byte ptr [si + 0xa], 0
1:35D3  c744040000           mov word ptr [si + 4], 0
1:35D8  2bc0                 sub ax, ax
1:35DA  894408               mov word ptr [si + 8], ax
1:35DD  894406               mov word ptr [si + 6], ax
1:35E0  894402               mov word ptr [si + 2], ax
1:35E3  8904                 mov word ptr [si], ax
1:35E5  c6440bff             mov byte ptr [si + 0xb], 0xff
1:35E9  8976fa               mov word ptr [bp - 6], si
1:35EC  8c5efc               mov word ptr [bp - 4], ds
loc_35EF:
1:35EF  8b46fa               mov ax, word ptr [bp - 6]
1:35F2  8b56fc               mov dx, word ptr [bp - 4]
1:35F5  5e                   pop si
1:35F6  8d66fe               lea sp, [bp - 2]
1:35F9  1f                   pop ds
1:35FA  5d                   pop bp
1:35FB  4d                   dec bp
1:35FC  cb                   retf
1:35FD  db 90

; ---------------- _close@s1:35FE FAR size=56 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime _close (DOS 3Eh)
1:35FE  8cd8                 mov ax, ds
1:3600  90                   nop
1:3601  45                   inc bp
1:3602  55                   push bp
1:3603  8bec                 mov bp, sp
1:3605  1e                   push ds
1:3606  8ed8                 mov ds, ax
1:3608  8b5e06               mov bx, word ptr [bp + 6]
1:360B  3b1e8a5f             cmp bx, word ptr [0x5f8a]
1:360F  7206                 jb 0x3617
1:3611  b80009               mov ax, 0x900
1:3614  f9                   stc
1:3615  eb1b                 jmp 0x3632
loc_3617:
1:3617  b43e                 mov ah, 0x3e
1:3619  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3620  7407                 je 0x3629
1:3622  9a8a250000           lcall 0, 0x258a  ; KERNEL.DOS3Call
1:3627  eb02                 jmp 0x362b
loc_3629:
1:3629  cd21                 int 0x21
loc_362B:
1:362B  7205                 jb 0x3632
1:362D  c687905f00           mov byte ptr [bx + 0x5f90], 0
loc_3632:
1:3632  e949f3               jmp 0x297e
1:3635  db 00

; ---------------- _lseek@s1:3636 FAR size=212 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime _lseek (DOS 42h)
1:3636  8cd8                 mov ax, ds
1:3638  90                   nop
1:3639  45                   inc bp
1:363A  55                   push bp
1:363B  8bec                 mov bp, sp
1:363D  1e                   push ds
1:363E  8ed8                 mov ds, ax
1:3640  83ec04               sub sp, 4
1:3643  8b5e06               mov bx, word ptr [bp + 6]
1:3646  3b1e8a5f             cmp bx, word ptr [0x5f8a]
1:364A  7211                 jb 0x365d
1:364C  833eec6100           cmp word ptr [0x61ec], 0
1:3651  740a                 je 0x365d
1:3653  83fb02               cmp bx, 2
1:3656  7705                 ja 0x365d
1:3658  b80009               mov ax, 0x900
1:365B  eb41                 jmp 0x369e
loc_365D:
1:365D  833e646000           cmp word ptr [0x6064], 0
1:3662  747f                 je 0x36e3
1:3664  f7460a0080           test word ptr [bp + 0xa], 0x8000
1:3669  7478                 je 0x36e3
1:366B  837e0c00             cmp word ptr [bp + 0xc], 0
1:366F  742a                 je 0x369b
1:3671  33c9                 xor cx, cx
1:3673  8bd1                 mov dx, cx
1:3675  b80142               mov ax, 0x4201
1:3678  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:367F  7407                 je 0x3688
1:3681  9a23360000           lcall 0, 0x3623  ; KERNEL.DOS3Call
1:3686  eb02                 jmp 0x368a
loc_3688:
1:3688  cd21                 int 0x21
loc_368A:
1:368A  727b                 jb 0x3707
1:368C  f7460c0200           test word ptr [bp + 0xc], 2
1:3691  750e                 jne 0x36a1
1:3693  034608               add ax, word ptr [bp + 8]
1:3696  13560a               adc dx, word ptr [bp + 0xa]
1:3699  7948                 jns 0x36e3
loc_369B:
1:369B  b80016               mov ax, 0x1600  ; '471.bmp'
loc_369E:
1:369E  f9                   stc
1:369F  eb66                 jmp 0x3707
loc_36A1:
1:36A1  8956fc               mov word ptr [bp - 4], dx
1:36A4  8946fa               mov word ptr [bp - 6], ax
1:36A7  8bd1                 mov dx, cx
1:36A9  b80242               mov ax, 0x4202
1:36AC  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:36B3  7407                 je 0x36bc
1:36B5  9a82360000           lcall 0, 0x3682  ; KERNEL.DOS3Call
1:36BA  eb02                 jmp 0x36be
loc_36BC:
1:36BC  cd21                 int 0x21
loc_36BE:
1:36BE  034608               add ax, word ptr [bp + 8]
1:36C1  13560a               adc dx, word ptr [bp + 0xa]
1:36C4  791d                 jns 0x36e3
1:36C6  8b4efc               mov cx, word ptr [bp - 4]
1:36C9  8b56fa               mov dx, word ptr [bp - 6]
1:36CC  b80042               mov ax, 0x4200
1:36CF  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:36D6  7407                 je 0x36df
1:36D8  9ab6360000           lcall 0, 0x36b6  ; KERNEL.DOS3Call
1:36DD  eb02                 jmp 0x36e1
loc_36DF:
1:36DF  cd21                 int 0x21
loc_36E1:
1:36E1  ebb8                 jmp 0x369b
loc_36E3:
1:36E3  8b5608               mov dx, word ptr [bp + 8]
1:36E6  8b4e0a               mov cx, word ptr [bp + 0xa]
1:36E9  8a460c               mov al, byte ptr [bp + 0xc]
1:36EC  b442                 mov ah, 0x42
1:36EE  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:36F5  7407                 je 0x36fe
1:36F7  9ad9360000           lcall 0, 0x36d9  ; KERNEL.DOS3Call
1:36FC  eb02                 jmp 0x3700
loc_36FE:
1:36FE  cd21                 int 0x21
loc_3700:
1:3700  7205                 jb 0x3707
1:3702  80a7905ffd           and byte ptr [bx + 0x5f90], 0xfd
loc_3707:
1:3707  e993f2               jmp 0x299d

; ---------------- _sopen@s1:370A FAR size=727 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime _open/_sopen (DOS 3Dh/3Ch)
1:370A  8cd8                 mov ax, ds
1:370C  90                   nop
1:370D  45                   inc bp
1:370E  55                   push bp
1:370F  8bec                 mov bp, sp
1:3711  1e                   push ds
1:3712  8ed8                 mov ds, ax
1:3714  83ec04               sub sp, 4
1:3717  8a7e0c               mov bh, byte ptr [bp + 0xc]
1:371A  8b460e               mov ax, word ptr [bp + 0xe]
1:371D  89460c               mov word ptr [bp + 0xc], ax
1:3720  eb0f                 jmp 0x3731
1:3722  db 8c d8 90 45 55 8b ec 1e 8e d8 83 ec 04 32 ff
loc_3731:
1:3731  887efc               mov byte ptr [bp - 4], bh
1:3734  8b460a               mov ax, word ptr [bp + 0xa]
1:3737  8bc8                 mov cx, ax
1:3739  c646fa00             mov byte ptr [bp - 6], 0
1:373D  a90080               test ax, 0x8000
1:3740  7510                 jne 0x3752
1:3742  a90040               test ax, 0x4000
1:3745  7507                 jne 0x374e
1:3747  f606616080           test byte ptr [0x6061], 0x80
1:374C  7504                 jne 0x3752
loc_374E:
1:374E  c646fa80             mov byte ptr [bp - 6], 0x80
loc_3752:
1:3752  1e                   push ds
1:3753  c55606               lds dx, ptr [bp + 6]
1:3756  2403                 and al, 3
1:3758  0ac7                 or al, bh
1:375A  b43d                 mov ah, 0x3d
1:375C  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3763  7407                 je 0x376c
1:3765  9af8360000           lcall 0, 0x36f8  ; KERNEL.DOS3Call
1:376A  eb02                 jmp 0x376e
loc_376C:
1:376C  cd21                 int 0x21
loc_376E:
1:376E  1f                   pop ds
1:376F  7312                 jae 0x3783
1:3771  83f802               cmp ax, 2
1:3774  7509                 jne 0x377f
1:3776  f7c10001             test cx, 0x100
1:377A  7403                 je 0x377f
1:377C  e94701               jmp 0x38c6
loc_377F:
1:377F  f9                   stc
1:3780  e91af2               jmp 0x299d
loc_3783:
1:3783  93                   xchg bx, ax
1:3784  8bc1                 mov ax, cx
1:3786  250005               and ax, 0x500
1:3789  3d0005               cmp ax, 0x500
1:378C  7519                 jne 0x37a7
1:378E  b43e                 mov ah, 0x3e
1:3790  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3797  7407                 je 0x37a0
1:3799  9a66370000           lcall 0, 0x3766  ; KERNEL.DOS3Call
1:379E  eb02                 jmp 0x37a2
loc_37A0:
1:37A0  cd21                 int 0x21
loc_37A2:
1:37A2  b80011               mov ax, 0x1100
1:37A5  ebd8                 jmp 0x377f
loc_37A7:
1:37A7  c646fb01             mov byte ptr [bp - 5], 1
1:37AB  b80044               mov ax, 0x4400
1:37AE  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:37B5  7407                 je 0x37be
1:37B7  9a9a370000           lcall 0, 0x379a  ; KERNEL.DOS3Call
1:37BC  eb02                 jmp 0x37c0
loc_37BE:
1:37BE  cd21                 int 0x21
loc_37C0:
1:37C0  f6c280               test dl, 0x80
1:37C3  7404                 je 0x37c9
1:37C5  804efa40             or byte ptr [bp - 6], 0x40
loc_37C9:
1:37C9  f646fa40             test byte ptr [bp - 6], 0x40
1:37CD  7403                 je 0x37d2
1:37CF  e9a101               jmp 0x3973
loc_37D2:
1:37D2  8b460a               mov ax, word ptr [bp + 0xa]
1:37D5  a90002               test ax, 0x200
1:37D8  744f                 je 0x3829
1:37DA  a90300               test ax, 3
1:37DD  7419                 je 0x37f8
1:37DF  33c9                 xor cx, cx
1:37E1  b440                 mov ah, 0x40
1:37E3  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:37EA  7407                 je 0x37f3
1:37EC  9ab8370000           lcall 0, 0x37b8  ; KERNEL.DOS3Call
1:37F1  eb02                 jmp 0x37f5
loc_37F3:
1:37F3  cd21                 int 0x21
loc_37F5:
1:37F5  e97b01               jmp 0x3973
loc_37F8:
1:37F8  b43e                 mov ah, 0x3e
1:37FA  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3801  7407                 je 0x380a
1:3803  9aed370000           lcall 0, 0x37ed  ; KERNEL.DOS3Call
1:3808  eb02                 jmp 0x380c
loc_380A:
1:380A  cd21                 int 0x21
loc_380C:
1:380C  1e                   push ds
1:380D  c55606               lds dx, ptr [bp + 6]
1:3810  b80043               mov ax, 0x4300
1:3813  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:381A  7407                 je 0x3823
1:381C  9a04380000           lcall 0, 0x3804  ; KERNEL.DOS3Call
1:3821  eb02                 jmp 0x3825
loc_3823:
1:3823  cd21                 int 0x21
loc_3825:
1:3825  1f                   pop ds
1:3826  e9ba00               jmp 0x38e3
loc_3829:
1:3829  f646fa80             test byte ptr [bp - 6], 0x80
1:382D  7503                 jne 0x3832
1:382F  e94101               jmp 0x3973
loc_3832:
1:3832  a90200               test ax, 2
1:3835  7503                 jne 0x383a
1:3837  e93901               jmp 0x3973
loc_383A:
1:383A  b9ffff               mov cx, 0xffff
1:383D  8bd1                 mov dx, cx
1:383F  b80242               mov ax, 0x4202
1:3842  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3849  7407                 je 0x3852
1:384B  9a1d380000           lcall 0, 0x381d  ; KERNEL.DOS3Call
1:3850  eb02                 jmp 0x3854
loc_3852:
1:3852  cd21                 int 0x21
loc_3854:
1:3854  f7d9                 neg cx
1:3856  1e                   push ds
1:3857  16                   push ss
1:3858  1f                   pop ds
1:3859  8d56fd               lea dx, [bp - 3]
1:385C  b43f                 mov ah, 0x3f
1:385E  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3865  7407                 je 0x386e
1:3867  9a4c380000           lcall 0, 0x384c  ; KERNEL.DOS3Call
1:386C  eb02                 jmp 0x3870
loc_386E:
1:386E  cd21                 int 0x21
loc_3870:
1:3870  1f                   pop ds
1:3871  0bc0                 or ax, ax
1:3873  7435                 je 0x38aa
1:3875  807efd1a             cmp byte ptr [bp - 3], 0x1a
1:3879  752f                 jne 0x38aa
1:387B  f7d9                 neg cx
1:387D  8bd1                 mov dx, cx
1:387F  b80242               mov ax, 0x4202
1:3882  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3889  7407                 je 0x3892
1:388B  9a68380000           lcall 0, 0x3868  ; KERNEL.DOS3Call
1:3890  eb02                 jmp 0x3894
loc_3892:
1:3892  cd21                 int 0x21
loc_3894:
1:3894  33c9                 xor cx, cx
1:3896  b440                 mov ah, 0x40
1:3898  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:389F  7407                 je 0x38a8
1:38A1  9a8c380000           lcall 0, 0x388c  ; KERNEL.DOS3Call
1:38A6  eb02                 jmp 0x38aa
loc_38A8:
1:38A8  cd21                 int 0x21
loc_38AA:
1:38AA  33c9                 xor cx, cx
1:38AC  8bd1                 mov dx, cx
1:38AE  b80042               mov ax, 0x4200
1:38B1  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:38B8  7407                 je 0x38c1
1:38BA  9aa2380000           lcall 0, 0x38a2  ; KERNEL.DOS3Call
1:38BF  eb02                 jmp 0x38c3
loc_38C1:
1:38C1  cd21                 int 0x21
loc_38C3:
1:38C3  e9ad00               jmp 0x3973
loc_38C6:
1:38C6  c646fb00             mov byte ptr [bp - 5], 0
1:38CA  8b4e0c               mov cx, word ptr [bp + 0xc]
1:38CD  e81101               call 0x39e1  ; _umaskval@s1:39E1
1:38D0  894e0c               mov word ptr [bp + 0xc], cx
1:38D3  f646fcff             test byte ptr [bp - 4], 0xff
1:38D7  7507                 jne 0x38e0
1:38D9  f7460a0200           test word ptr [bp + 0xa], 2
1:38DE  7503                 jne 0x38e3
loc_38E0:
1:38E0  80e1fe               and cl, 0xfe
loc_38E3:
1:38E3  1e                   push ds
1:38E4  c55606               lds dx, ptr [bp + 6]
1:38E7  b43c                 mov ah, 0x3c
1:38E9  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:38F0  7407                 je 0x38f9
1:38F2  9abb380000           lcall 0, 0x38bb  ; KERNEL.DOS3Call
1:38F7  eb02                 jmp 0x38fb
loc_38F9:
1:38F9  cd21                 int 0x21
loc_38FB:
1:38FB  1f                   pop ds
1:38FC  7303                 jae 0x3901
loc_38FE:
1:38FE  e99cf0               jmp 0x299d
loc_3901:
1:3901  93                   xchg bx, ax
1:3902  f646fcff             test byte ptr [bp - 4], 0xff
1:3906  7507                 jne 0x390f
1:3908  f7460a0200           test word ptr [bp + 0xa], 2
1:390D  7564                 jne 0x3973
loc_390F:
1:390F  b43e                 mov ah, 0x3e
1:3911  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3918  7407                 je 0x3921
1:391A  9af3380000           lcall 0, 0x38f3  ; KERNEL.DOS3Call
1:391F  eb02                 jmp 0x3923
loc_3921:
1:3921  cd21                 int 0x21
loc_3923:
1:3923  8a460a               mov al, byte ptr [bp + 0xa]
1:3926  2403                 and al, 3
1:3928  0a46fc               or al, byte ptr [bp - 4]
1:392B  1e                   push ds
1:392C  c55606               lds dx, ptr [bp + 6]
1:392F  b43d                 mov ah, 0x3d
1:3931  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3938  7407                 je 0x3941
1:393A  9a1b390000           lcall 0, 0x391b  ; KERNEL.DOS3Call
1:393F  eb02                 jmp 0x3943
loc_3941:
1:3941  cd21                 int 0x21
loc_3943:
1:3943  1f                   pop ds
1:3944  72b8                 jb 0x38fe
1:3946  93                   xchg bx, ax
1:3947  f646fb01             test byte ptr [bp - 5], 1
1:394B  7526                 jne 0x3973
1:394D  f7460c0100           test word ptr [bp + 0xc], 1
1:3952  741f                 je 0x3973
1:3954  80c901               or cl, 1
1:3957  1e                   push ds
1:3958  c55606               lds dx, ptr [bp + 6]
1:395B  b80143               mov ax, 0x4301
1:395E  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3965  7407                 je 0x396e
1:3967  9a3b390000           lcall 0, 0x393b  ; KERNEL.DOS3Call
1:396C  eb02                 jmp 0x3970
loc_396E:
1:396E  cd21                 int 0x21
loc_3970:
1:3970  1f                   pop ds
1:3971  728b                 jb 0x38fe
loc_3973:
1:3973  f646fa40             test byte ptr [bp - 6], 0x40
1:3977  7564                 jne 0x39dd
1:3979  1e                   push ds
1:397A  c55606               lds dx, ptr [bp + 6]
1:397D  b80043               mov ax, 0x4300
1:3980  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3987  7407                 je 0x3990
1:3989  9a68390000           lcall 0, 0x3968  ; KERNEL.DOS3Call
1:398E  eb02                 jmp 0x3992
loc_3990:
1:3990  cd21                 int 0x21
loc_3992:
1:3992  1f                   pop ds
1:3993  8bc1                 mov ax, cx
1:3995  32c9                 xor cl, cl
1:3997  83e001               and ax, 1
1:399A  7402                 je 0x399e
1:399C  b110                 mov cl, 0x10
loc_399E:
1:399E  f7460a0800           test word ptr [bp + 0xa], 8
1:39A3  7403                 je 0x39a8
1:39A5  80c920               or cl, 0x20
loc_39A8:
1:39A8  3b1e8a5f             cmp bx, word ptr [0x5f8a]
1:39AC  721a                 jb 0x39c8
1:39AE  b43e                 mov ah, 0x3e
1:39B0  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:39B7  7407                 je 0x39c0
1:39B9  9a8a390000           lcall 0, 0x398a  ; KERNEL.DOS3Call
1:39BE  eb02                 jmp 0x39c2
loc_39C0:
1:39C0  cd21                 int 0x21
loc_39C2:
1:39C2  b80018               mov ax, 0x1800
1:39C5  e9b7fd               jmp 0x377f
loc_39C8:
1:39C8  0a4efa               or cl, byte ptr [bp - 6]
1:39CB  80c901               or cl, 1
1:39CE  888f905f             mov byte ptr [bx + 0x5f90], cl
1:39D2  8bc3                 mov ax, bx
1:39D4  83ed02               sub bp, 2
1:39D7  8be5                 mov sp, bp
1:39D9  1f                   pop ds
1:39DA  5d                   pop bp
1:39DB  4d                   dec bp
1:39DC  cb                   retf
loc_39DD:
1:39DD  32c9                 xor cl, cl
1:39DF  ebc7                 jmp 0x39a8

; ---------------- _umaskval@s1:39E1 size=17 callers=1
;   C runtime: applies the umask to open flags
1:39E1  a17a5f               mov ax, word ptr [0x5f7a]
1:39E4  f7d0                 not ax
1:39E6  23c1                 and ax, cx
1:39E8  33c9                 xor cx, cx
1:39EA  a880                 test al, 0x80
1:39EC  7503                 jne 0x39f1
1:39EE  80c901               or cl, 1
loc_39F1:
1:39F1  c3                   ret

; ---------------- _write@s1:39F2 FAR size=231 callers=2
;   apis: KERNEL.DOS3Call
;   C runtime _write (text-mode LF->CRLF)
1:39F2  8cd8                 mov ax, ds
1:39F4  90                   nop
1:39F5  45                   inc bp
1:39F6  55                   push bp
1:39F7  8bec                 mov bp, sp
1:39F9  1e                   push ds
1:39FA  8ed8                 mov ds, ax
1:39FC  83ec0a               sub sp, 0xa
1:39FF  8b5e06               mov bx, word ptr [bp + 6]
1:3A02  a18a5f               mov ax, word ptr [0x5f8a]
1:3A05  8946f4               mov word ptr [bp - 0xc], ax
1:3A08  833eec6100           cmp word ptr [0x61ec], 0
1:3A0D  740f                 je 0x3a1e
1:3A0F  a18e5f               mov ax, word ptr [0x5f8e]
1:3A12  83fb02               cmp bx, 2
1:3A15  7707                 ja 0x3a1e
1:3A17  8b1e8a5f             mov bx, word ptr [0x5f8a]
1:3A1B  895e06               mov word ptr [bp + 6], bx
loc_3A1E:
1:3A1E  3bd8                 cmp bx, ax
1:3A20  7207                 jb 0x3a29
1:3A22  b80009               mov ax, 0x900
1:3A25  f9                   stc
loc_3A26:
1:3A26  e974ef               jmp 0x299d
loc_3A29:
1:3A29  f687905f20           test byte ptr [bx + 0x5f90], 0x20
1:3A2E  741b                 je 0x3a4b
1:3A30  b80242               mov ax, 0x4202
1:3A33  33c9                 xor cx, cx
1:3A35  8bd1                 mov dx, cx
1:3A37  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3A3E  7407                 je 0x3a47
1:3A40  9aba390000           lcall 0, 0x39ba  ; KERNEL.DOS3Call
1:3A45  eb02                 jmp 0x3a49
loc_3A47:
1:3A47  cd21                 int 0x21
loc_3A49:
1:3A49  72db                 jb 0x3a26
loc_3A4B:
1:3A4B  f687905f80           test byte ptr [bx + 0x5f90], 0x80
1:3A50  747d                 je 0x3acf
1:3A52  8c5ef8               mov word ptr [bp - 8], ds
1:3A55  8e460a               mov es, word ptr [bp + 0xa]
1:3A58  c55608               lds dx, ptr [bp + 8]
1:3A5B  33c0                 xor ax, ax
1:3A5D  8946fc               mov word ptr [bp - 4], ax
1:3A60  8946fa               mov word ptr [bp - 6], ax
1:3A63  fc                   cld
1:3A64  57                   push di
1:3A65  56                   push si
1:3A66  8bfa                 mov di, dx
1:3A68  8bf2                 mov si, dx
1:3A6A  8966f6               mov word ptr [bp - 0xa], sp
1:3A6D  8b4e0c               mov cx, word ptr [bp + 0xc]
1:3A70  e33f                 jcxz 0x3ab1
1:3A72  b00a                 mov al, 0xa
1:3A74  f2ae                 repne scasb al, byte ptr es:[di]
1:3A76  7552                 jne 0x3aca
1:3A78  1e                   push ds
1:3A79  8e5ef8               mov ds, word ptr [bp - 8]
1:3A7C  90                   nop
1:3A7D  0e                   push cs
1:3A7E  e82b01               call 0x3bac  ; _stackavail?@s1:3BAC
1:3A81  3da800               cmp ax, 0xa8
1:3A84  764c                 jbe 0x3ad2
1:3A86  1f                   pop ds
1:3A87  83ec02               sub sp, 2
1:3A8A  8bdc                 mov bx, sp
1:3A8C  ba0002               mov dx, 0x200
1:3A8F  3d2802               cmp ax, 0x228
1:3A92  7303                 jae 0x3a97
1:3A94  ba8000               mov dx, 0x80
loc_3A97:
1:3A97  2be2                 sub sp, dx
1:3A99  8bd4                 mov dx, sp
1:3A9B  8bfa                 mov di, dx
1:3A9D  16                   push ss
1:3A9E  07                   pop es
1:3A9F  8b4e0c               mov cx, word ptr [bp + 0xc]
loc_3AA2:
1:3AA2  ac                   lodsb al, byte ptr [si]
1:3AA3  3c0a                 cmp al, 0xa
1:3AA5  740d                 je 0x3ab4
loc_3AA7:
1:3AA7  3bfb                 cmp di, bx
1:3AA9  741a                 je 0x3ac5
loc_3AAB:
1:3AAB  aa                   stosb byte ptr es:[di], al
1:3AAC  e2f4                 loop 0x3aa2
1:3AAE  e82800               call 0x3ad9  ; _write_text@s1:3AD9
loc_3AB1:
1:3AB1  e99400               jmp 0x3b48
loc_3AB4:
1:3AB4  b00d                 mov al, 0xd
1:3AB6  3bfb                 cmp di, bx
1:3AB8  7503                 jne 0x3abd
1:3ABA  e81c00               call 0x3ad9  ; _write_text@s1:3AD9
loc_3ABD:
1:3ABD  aa                   stosb byte ptr es:[di], al
1:3ABE  b00a                 mov al, 0xa
1:3AC0  ff46fa               inc word ptr [bp - 6]
1:3AC3  ebe2                 jmp 0x3aa7
loc_3AC5:
1:3AC5  e81100               call 0x3ad9  ; _write_text@s1:3AD9
1:3AC8  ebe1                 jmp 0x3aab
loc_3ACA:
1:3ACA  5e                   pop si
1:3ACB  5f                   pop di
1:3ACC  8e5ef8               mov ds, word ptr [bp - 8]
loc_3ACF:
1:3ACF  e98700               jmp 0x3b59
loc_3AD2:
1:3AD2  b8fcff               mov ax, 0xfffc
1:3AD5  0e                   push cs
1:3AD6  e819eb               call 0x25f2  ; _chkstk@s1:25F2

; ---------------- _write_text@s1:3AD9 size=211 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime _write helper for text mode
1:3AD9  50                   push ax
1:3ADA  53                   push bx
1:3ADB  51                   push cx
1:3ADC  1e                   push ds
1:3ADD  06                   push es
1:3ADE  1f                   pop ds
1:3ADF  8bcf                 mov cx, di
1:3AE1  2bca                 sub cx, dx
1:3AE3  e32c                 jcxz 0x3b11
1:3AE5  51                   push cx
1:3AE6  8b5e06               mov bx, word ptr [bp + 6]
1:3AE9  3b5ef4               cmp bx, word ptr [bp - 0xc]
1:3AEC  7205                 jb 0x3af3
1:3AEE  e8c01a               call 0x55b1  ; _amsg_exit_R6020@s1:55B1
1:3AF1  eb14                 jmp 0x3b07
loc_3AF3:
1:3AF3  b440                 mov ah, 0x40
1:3AF5  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3AFC  7407                 je 0x3b05
1:3AFE  9a413a0000           lcall 0, 0x3a41  ; KERNEL.DOS3Call
1:3B03  eb02                 jmp 0x3b07
loc_3B05:
1:3B05  cd21                 int 0x21
loc_3B07:
1:3B07  59                   pop cx
1:3B08  720e                 jb 0x3b18
1:3B0A  0146fc               add word ptr [bp - 4], ax
1:3B0D  3bc8                 cmp cx, ax
1:3B0F  7707                 ja 0x3b18
loc_3B11:
1:3B11  1f                   pop ds
1:3B12  59                   pop cx
1:3B13  5b                   pop bx
1:3B14  58                   pop ax
1:3B15  8bfa                 mov di, dx
1:3B17  c3                   ret
loc_3B18:
1:3B18  9f                   lahf
1:3B19  1f                   pop ds
1:3B1A  83c408               add sp, 8
1:3B1D  837efc00             cmp word ptr [bp - 4], 0
1:3B21  7525                 jne 0x3b48
1:3B23  9e                   sahf
1:3B24  7304                 jae 0x3b2a
1:3B26  b409                 mov ah, 9
1:3B28  eb24                 jmp 0x3b4e
loc_3B2A:
1:3B2A  8e5ef8               mov ds, word ptr [bp - 8]
1:3B2D  f687905f40           test byte ptr [bx + 0x5f90], 0x40
1:3B32  740e                 je 0x3b42
1:3B34  8e5e0a               mov ds, word ptr [bp + 0xa]
1:3B37  8b5e08               mov bx, word ptr [bp + 8]
1:3B3A  803f1a               cmp byte ptr [bx], 0x1a
1:3B3D  7503                 jne 0x3b42
1:3B3F  f8                   clc
1:3B40  eb0c                 jmp 0x3b4e
loc_3B42:
1:3B42  f9                   stc
1:3B43  b8001c               mov ax, 0x1c00
1:3B46  eb06                 jmp 0x3b4e
loc_3B48:
1:3B48  8b46fc               mov ax, word ptr [bp - 4]
1:3B4B  2b46fa               sub ax, word ptr [bp - 6]
loc_3B4E:
1:3B4E  8b66f6               mov sp, word ptr [bp - 0xa]
1:3B51  5e                   pop si
1:3B52  5f                   pop di
1:3B53  8e5ef8               mov ds, word ptr [bp - 8]
loc_3B56:
1:3B56  e944ee               jmp 0x299d
loc_3B59:
1:3B59  8b4e0c               mov cx, word ptr [bp + 0xc]
1:3B5C  0bc9                 or cx, cx
1:3B5E  7505                 jne 0x3b65
1:3B60  8bc1                 mov ax, cx
1:3B62  e938ee               jmp 0x299d
loc_3B65:
1:3B65  1e                   push ds
1:3B66  c55608               lds dx, ptr [bp + 8]
1:3B69  3b5ef4               cmp bx, word ptr [bp - 0xc]
1:3B6C  7205                 jb 0x3b73
1:3B6E  e8401a               call 0x55b1  ; _amsg_exit_R6020@s1:55B1
1:3B71  eb14                 jmp 0x3b87
loc_3B73:
1:3B73  b440                 mov ah, 0x40
1:3B75  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:3B7C  7407                 je 0x3b85
1:3B7E  9aff3a0000           lcall 0, 0x3aff  ; KERNEL.DOS3Call
1:3B83  eb02                 jmp 0x3b87
loc_3B85:
1:3B85  cd21                 int 0x21
loc_3B87:
1:3B87  1e                   push ds
1:3B88  07                   pop es
1:3B89  1f                   pop ds
1:3B8A  7304                 jae 0x3b90
1:3B8C  b409                 mov ah, 9
1:3B8E  ebc6                 jmp 0x3b56
loc_3B90:
1:3B90  0bc0                 or ax, ax
1:3B92  75c2                 jne 0x3b56
1:3B94  f687905f40           test byte ptr [bx + 0x5f90], 0x40
1:3B99  740b                 je 0x3ba6
1:3B9B  8bda                 mov bx, dx
1:3B9D  26803f1a             cmp byte ptr es:[bx], 0x1a
1:3BA1  7503                 jne 0x3ba6
1:3BA3  f8                   clc
1:3BA4  ebb0                 jmp 0x3b56
loc_3BA6:
1:3BA6  f9                   stc
1:3BA7  b8001c               mov ax, 0x1c00
1:3BAA  ebaa                 jmp 0x3b56

; ---------------- _stackavail?@s1:3BAC FAR size=318 callers=2
;   C runtime: stack-space helper used by _write and qsort
1:3BAC  59                   pop cx
1:3BAD  5a                   pop dx
1:3BAE  a1485f               mov ax, word ptr [0x5f48]
1:3BB1  3bc4                 cmp ax, sp
1:3BB3  7307                 jae 0x3bbc
1:3BB5  2bc4                 sub ax, sp
1:3BB7  f7d8                 neg ax
loc_3BB9:
1:3BB9  52                   push dx
1:3BBA  51                   push cx
1:3BBB  cb                   retf
loc_3BBC:
1:3BBC  33c0                 xor ax, ax
1:3BBE  ebf9                 jmp 0x3bb9
1:3BC0  db 51 57 f6 47 02 01 74 68 e8 ec 00 8b fe 8b 04 a8
1:3BD0  db 01 74 03 2b c8 49 41 41 8b 77 04 0b f6 74 51 03
1:3BE0  db ce 73 09 33 c0 ba f0 ff e3 35 eb 44 90 0e e8 eb
1:3BF0  db ed 8e c0 26 a1 66 60 3d 00 10 74 16 ba 00 80 3b
1:3C00  db d0 72 06 d1 ea 75 f8 eb 22 83 fa 08 72 1d d1 e2
1:3C10  db 8b c2 48 8b d0 03 c1 73 02 33 c0 f7 d2 23 c2 52
1:3C20  db e8 2e 00 5a 73 0d 83 fa f0 74 05 b8 10 00 eb e2
1:3C30  db f9 eb 1b 8b d0 2b 57 04 89 47 04 89 7f 0a 8b 77
1:3C40  db 0c 4a 89 14 42 03 f2 c7 04 fe ff 89 77 0c 5f 59
1:3C50  db c3 8b d0 f6 47 02 04 74 02 eb 51 52 51 53 8b 77
1:3C60  db 06 2e 8b 1e f6 22 33 c9 0b d2 75 07 f7 c3 10 00
1:3C70  db 75 40 41 b8 02 00 f7 c3 01 00 75 03 b8 20 00 56
1:3C80  db 51 52 50 9a 93 14 00 00 0b c0 74 26 3b c6 75 1c
1:3C90  db 56 9a 46 15 00 00 0b d0 74 12 5b 59 5a 8b c2 f6
1:3CA0  db 47 02 04 74 04 4a 89 57 fe f8 eb 0a b8 12 00 e9
1:3CB0  db e8 eb 5b 59 5a f9 c3 57 8b 77 0a 3b 77 0c 75 03
1:3CC0  db 8b 77 08 ad 83 f8 fe 74 08 8b fe 24 fe 03 f0 eb
1:3CD0  db f2 4f 4f 8b f7 5f c3 00 55 8b ec ff 76 08 ff 76
1:3CE0  db 06 90 0e e8 94 03 8b e5 5d cb

; ---------------- _fstrcat@s1:3CEA FAR size=84 callers=28
;   C runtime _fstrcat
1:3CEA  55                   push bp
1:3CEB  8bec                 mov bp, sp
1:3CED  8bd7                 mov dx, di
1:3CEF  8bde                 mov bx, si
1:3CF1  1e                   push ds
1:3CF2  c47e06               les di, ptr [bp + 6]
1:3CF5  33c0                 xor ax, ax
1:3CF7  b9ffff               mov cx, 0xffff
1:3CFA  f2ae                 repne scasb al, byte ptr es:[di]
1:3CFC  8d75ff               lea si, [di - 1]
1:3CFF  c47e0a               les di, ptr [bp + 0xa]
1:3D02  b9ffff               mov cx, 0xffff
1:3D05  f2ae                 repne scasb al, byte ptr es:[di]
1:3D07  f7d1                 not cx
1:3D09  7403                 je 0x3d0e
1:3D0B  2bf9                 sub di, cx
1:3D0D  41                   inc cx
loc_3D0E:
1:3D0E  2bf9                 sub di, cx
1:3D10  8cc0                 mov ax, es
1:3D12  8ed8                 mov ds, ax
1:3D14  8e4608               mov es, word ptr [bp + 8]
1:3D17  87fe                 xchg si, di
1:3D19  8b4606               mov ax, word ptr [bp + 6]
1:3D1C  0bc9                 or cx, cx
1:3D1E  7505                 jne 0x3d25
1:3D20  a5                   movsw word ptr es:[di], word ptr [si]
1:3D21  49                   dec cx
1:3D22  49                   dec cx
1:3D23  eb08                 jmp 0x3d2d
loc_3D25:
1:3D25  f7c60100             test si, 1
1:3D29  7402                 je 0x3d2d
1:3D2B  a4                   movsb byte ptr es:[di], byte ptr [si]
1:3D2C  49                   dec cx
loc_3D2D:
1:3D2D  d1e9                 shr cx, 1
1:3D2F  f3a5                 rep movsw word ptr es:[di], word ptr [si]
1:3D31  13c9                 adc cx, cx
1:3D33  f3a4                 rep movsb byte ptr es:[di], byte ptr [si]
1:3D35  8bf3                 mov si, bx
1:3D37  8bfa                 mov di, dx
1:3D39  1f                   pop ds
1:3D3A  8cc2                 mov dx, es
1:3D3C  5d                   pop bp
1:3D3D  cb                   retf

; ---------------- _fstrcpy@s1:3D3E FAR size=60 callers=73
;   C runtime _fstrcpy
1:3D3E  55                   push bp
1:3D3F  8bec                 mov bp, sp
1:3D41  8bd7                 mov dx, di
1:3D43  8bde                 mov bx, si
1:3D45  1e                   push ds
1:3D46  c5760a               lds si, ptr [bp + 0xa]
1:3D49  8bfe                 mov di, si
1:3D4B  8cd8                 mov ax, ds
1:3D4D  8ec0                 mov es, ax
1:3D4F  33c0                 xor ax, ax
1:3D51  b9ffff               mov cx, 0xffff
1:3D54  f2ae                 repne scasb al, byte ptr es:[di]
1:3D56  f7d1                 not cx
1:3D58  c47e06               les di, ptr [bp + 6]
1:3D5B  8bc7                 mov ax, di
1:3D5D  7404                 je 0x3d63
1:3D5F  a5                   movsw word ptr es:[di], word ptr [si]
1:3D60  49                   dec cx
1:3D61  eb06                 jmp 0x3d69
loc_3D63:
1:3D63  a801                 test al, 1
1:3D65  7402                 je 0x3d69
1:3D67  a4                   movsb byte ptr es:[di], byte ptr [si]
1:3D68  49                   dec cx
loc_3D69:
1:3D69  d1e9                 shr cx, 1
1:3D6B  f3a5                 rep movsw word ptr es:[di], word ptr [si]
1:3D6D  13c9                 adc cx, cx
1:3D6F  f3a4                 rep movsb byte ptr es:[di], byte ptr [si]
1:3D71  8bf3                 mov si, bx
1:3D73  8bfa                 mov di, dx
1:3D75  1f                   pop ds
1:3D76  8cc2                 mov dx, es
1:3D78  5d                   pop bp
1:3D79  cb                   retf

; ---------------- _fstrcmp@s1:3D7A FAR size=42 callers=14
;   C runtime _fstrcmp
1:3D7A  55                   push bp
1:3D7B  8bec                 mov bp, sp
1:3D7D  8bd7                 mov dx, di
1:3D7F  8bde                 mov bx, si
1:3D81  1e                   push ds
1:3D82  c57606               lds si, ptr [bp + 6]
1:3D85  c47e0a               les di, ptr [bp + 0xa]
1:3D88  33c0                 xor ax, ax
1:3D8A  b9ffff               mov cx, 0xffff
1:3D8D  f2ae                 repne scasb al, byte ptr es:[di]
1:3D8F  f7d1                 not cx
1:3D91  2bf9                 sub di, cx
1:3D93  f3a6                 repe cmpsb byte ptr [si], byte ptr es:[di]
1:3D95  7405                 je 0x3d9c
1:3D97  1bc0                 sbb ax, ax
1:3D99  83d8ff               sbb ax, -1
loc_3D9C:
1:3D9C  1f                   pop ds
1:3D9D  8bf3                 mov si, bx
1:3D9F  8bfa                 mov di, dx
1:3DA1  5d                   pop bp
1:3DA2  cb                   retf
1:3DA3  db 00

; ---------------- _fstrlen@s1:3DA4 FAR size=26 callers=27
;   C runtime _fstrlen
1:3DA4  55                   push bp
1:3DA5  8bec                 mov bp, sp
1:3DA7  8bd7                 mov dx, di
1:3DA9  c47e06               les di, ptr [bp + 6]
1:3DAC  33c0                 xor ax, ax
1:3DAE  b9ffff               mov cx, 0xffff
1:3DB1  f2ae                 repne scasb al, byte ptr es:[di]
1:3DB3  f7d1                 not cx
1:3DB5  7501                 jne 0x3db8
1:3DB7  49                   dec cx
loc_3DB8:
1:3DB8  91                   xchg cx, ax
1:3DB9  8bfa                 mov di, dx
1:3DBB  5d                   pop bp
1:3DBC  cb                   retf
1:3DBD  db 00

; ---------------- _fstrncpy@s1:3DBE FAR size=42 callers=4
;   C runtime _fstrncpy
1:3DBE  55                   push bp
1:3DBF  8bec                 mov bp, sp
1:3DC1  57                   push di
1:3DC2  56                   push si
1:3DC3  1e                   push ds
1:3DC4  c47e06               les di, ptr [bp + 6]
1:3DC7  c5760a               lds si, ptr [bp + 0xa]
1:3DCA  8bdf                 mov bx, di
1:3DCC  8b4e0e               mov cx, word ptr [bp + 0xe]
1:3DCF  e30c                 jcxz 0x3ddd
loc_3DD1:
1:3DD1  ac                   lodsb al, byte ptr [si]
1:3DD2  0ac0                 or al, al
1:3DD4  7403                 je 0x3dd9
1:3DD6  aa                   stosb byte ptr es:[di], al
1:3DD7  e2f8                 loop 0x3dd1
loc_3DD9:
1:3DD9  32c0                 xor al, al
1:3DDB  f3aa                 rep stosb byte ptr es:[di], al
loc_3DDD:
1:3DDD  8bc3                 mov ax, bx
1:3DDF  8cc2                 mov dx, es
1:3DE1  1f                   pop ds
1:3DE2  5e                   pop si
1:3DE3  5f                   pop di
1:3DE4  8be5                 mov sp, bp
1:3DE6  5d                   pop bp
1:3DE7  cb                   retf

; ---------------- _fstrncmp?@s1:3DE8 FAR size=60 callers=3
;   C runtime: bounded string compare (getenv, save tags)
1:3DE8  55                   push bp
1:3DE9  8bec                 mov bp, sp
1:3DEB  57                   push di
1:3DEC  56                   push si
1:3DED  1e                   push ds
1:3DEE  8b4e0e               mov cx, word ptr [bp + 0xe]
1:3DF1  e327                 jcxz 0x3e1a
1:3DF3  8bd9                 mov bx, cx
1:3DF5  c47e06               les di, ptr [bp + 6]
1:3DF8  8bf7                 mov si, di
1:3DFA  33c0                 xor ax, ax
1:3DFC  f2ae                 repne scasb al, byte ptr es:[di]
1:3DFE  f7d9                 neg cx
1:3E00  03cb                 add cx, bx
1:3E02  8bfe                 mov di, si
1:3E04  c5760a               lds si, ptr [bp + 0xa]
1:3E07  f3a6                 repe cmpsb byte ptr [si], byte ptr es:[di]
1:3E09  8a44ff               mov al, byte ptr [si - 1]
1:3E0C  33c9                 xor cx, cx
1:3E0E  263a45ff             cmp al, byte ptr es:[di - 1]
1:3E12  7704                 ja 0x3e18
1:3E14  7404                 je 0x3e1a
1:3E16  49                   dec cx
1:3E17  49                   dec cx
loc_3E18:
1:3E18  f7d1                 not cx
loc_3E1A:
1:3E1A  8bc1                 mov ax, cx
1:3E1C  1f                   pop ds
1:3E1D  5e                   pop si
1:3E1E  5f                   pop di
1:3E1F  8be5                 mov sp, bp
1:3E21  5d                   pop bp
1:3E22  cb                   retf
1:3E23  db 00

; ---------------- _fatoi@s1:3E24 FAR size=4 callers=4
;   C runtime atoi (jumps into atol)
1:3E24  e90500               jmp 0x3e2c
1:3E27  db 00

; ---------------- _fatol@s1:3E28 FAR size=90 callers=6
;   C runtime atol
1:3E28  e90100               jmp 0x3e2c
1:3E2B  db 00
loc_3E2C:
1:3E2C  55                   push bp
1:3E2D  8bec                 mov bp, sp
1:3E2F  57                   push di
1:3E30  56                   push si
1:3E31  1e                   push ds
1:3E32  c57606               lds si, ptr [bp + 6]
1:3E35  33c0                 xor ax, ax
1:3E37  99                   cdq
1:3E38  33db                 xor bx, bx
loc_3E3A:
1:3E3A  ac                   lodsb al, byte ptr [si]
1:3E3B  3c20                 cmp al, 0x20
1:3E3D  74fb                 je 0x3e3a
1:3E3F  3c09                 cmp al, 9
1:3E41  74f7                 je 0x3e3a
1:3E43  50                   push ax
1:3E44  3c2d                 cmp al, 0x2d
1:3E46  7404                 je 0x3e4c
1:3E48  3c2b                 cmp al, 0x2b
1:3E4A  7501                 jne 0x3e4d
loc_3E4C:
1:3E4C  ac                   lodsb al, byte ptr [si]
loc_3E4D:
1:3E4D  3c39                 cmp al, 0x39
1:3E4F  771f                 ja 0x3e70
1:3E51  2c30                 sub al, 0x30
1:3E53  721b                 jb 0x3e70
1:3E55  d1e3                 shl bx, 1
1:3E57  d1d2                 rcl dx, 1
1:3E59  8bcb                 mov cx, bx
1:3E5B  8bfa                 mov di, dx
1:3E5D  d1e3                 shl bx, 1
1:3E5F  d1d2                 rcl dx, 1
1:3E61  d1e3                 shl bx, 1
1:3E63  d1d2                 rcl dx, 1
1:3E65  03d9                 add bx, cx
1:3E67  13d7                 adc dx, di
1:3E69  03d8                 add bx, ax
1:3E6B  83d200               adc dx, 0
1:3E6E  ebdc                 jmp 0x3e4c
loc_3E70:
1:3E70  58                   pop ax
1:3E71  3c2d                 cmp al, 0x2d
1:3E73  93                   xchg bx, ax
1:3E74  7507                 jne 0x3e7d
1:3E76  f7d8                 neg ax
1:3E78  83d200               adc dx, 0
1:3E7B  f7da                 neg dx
loc_3E7D:
1:3E7D  1f                   pop ds
1:3E7E  5e                   pop si
1:3E7F  5f                   pop di
1:3E80  5d                   pop bp
1:3E81  cb                   retf

; ---------------- _itoa@s1:3E82 FAR size=28 callers=1
;   C runtime _itoa
1:3E82  55                   push bp
1:3E83  8bec                 mov bp, sp
1:3E85  56                   push si
1:3E86  57                   push di
1:3E87  b301                 mov bl, 1
1:3E89  8b4e0c               mov cx, word ptr [bp + 0xc]
1:3E8C  8b4606               mov ax, word ptr [bp + 6]
1:3E8F  33d2                 xor dx, dx
1:3E91  83f90a               cmp cx, 0xa
1:3E94  7501                 jne 0x3e97
1:3E96  99                   cdq
loc_3E97:
1:3E97  1e                   push ds
1:3E98  c57e08               lds di, ptr [bp + 8]
1:3E9B  e9bd0a               jmp 0x495b

; ---------------- abort@s1:3E9E FAR size=34 callers=1
;   apis: KERNEL.FatalAppExit
;   C runtime abort: FatalAppExit "ABNORMAL PROGRAM TERMINATION"
1:3E9E  8cd8                 mov ax, ds
1:3EA0  90                   nop
1:3EA1  45                   inc bp
1:3EA2  55                   push bp
1:3EA3  8bec                 mov bp, sp
1:3EA5  1e                   push ds
1:3EA6  8ed8                 mov ds, ax
1:3EA8  b80000               mov ax, 0
1:3EAB  50                   push ax
1:3EAC  1e                   push ds
1:3EAD  b84465               mov ax, 0x6544  ; 'ABNORMAL PROGRAM TERMINATION'
1:3EB0  50                   push ax
1:3EB1  9acf280000           lcall 0, 0x28cf  ; KERNEL.FatalAppExit
1:3EB6  db 83 ed 02 8b e5 1f 5d 4d cb 00

; ---------------- getenv@s1:3EC0 FAR size=156 callers=2
;   C runtime getenv
1:3EC0  45                   inc bp
1:3EC1  55                   push bp
1:3EC2  8bec                 mov bp, sp
1:3EC4  1e                   push ds
1:3EC5  83ec04               sub sp, 4
1:3EC8  56                   push si
1:3EC9  a1be5f               mov ax, word ptr [0x5fbe]
1:3ECC  8b16c05f             mov dx, word ptr [0x5fc0]
1:3ED0  8946fa               mov word ptr [bp - 6], ax
1:3ED3  8956fc               mov word ptr [bp - 4], dx
1:3ED6  0bd0                 or dx, ax
1:3ED8  7476                 je 0x3f50
1:3EDA  8b4608               mov ax, word ptr [bp + 8]
1:3EDD  0b4606               or ax, word ptr [bp + 6]
1:3EE0  746e                 je 0x3f50
1:3EE2  ff7608               push word ptr [bp + 8]
1:3EE5  ff7606               push word ptr [bp + 6]
1:3EE8  90                   nop
1:3EE9  0e                   push cs
1:3EEA  e8b7fe               call 0x3da4  ; _fstrlen@s1:3DA4
1:3EED  83c404               add sp, 4
1:3EF0  8bf0                 mov si, ax
loc_3EF2:
1:3EF2  c45efa               les bx, ptr [bp - 6]
1:3EF5  268b4702             mov ax, word ptr es:[bx + 2]
1:3EF9  260b07               or ax, word ptr es:[bx]
1:3EFC  7452                 je 0x3f50
1:3EFE  26ff7702             push word ptr es:[bx + 2]
1:3F02  26ff37               push word ptr es:[bx]
1:3F05  90                   nop
1:3F06  0e                   push cs
1:3F07  e89afe               call 0x3da4  ; _fstrlen@s1:3DA4
1:3F0A  83c404               add sp, 4
1:3F0D  3bc6                 cmp ax, si
1:3F0F  7639                 jbe 0x3f4a
1:3F11  c45efa               les bx, ptr [bp - 6]
1:3F14  26c41f               les bx, ptr es:[bx]
1:3F17  2680383d             cmp byte ptr es:[bx + si], 0x3d
1:3F1B  752d                 jne 0x3f4a
1:3F1D  56                   push si
1:3F1E  ff7608               push word ptr [bp + 8]
1:3F21  ff7606               push word ptr [bp + 6]
1:3F24  c45efa               les bx, ptr [bp - 6]
1:3F27  26ff7702             push word ptr es:[bx + 2]
1:3F2B  26ff37               push word ptr es:[bx]
1:3F2E  90                   nop
1:3F2F  0e                   push cs
1:3F30  e8b5fe               call 0x3de8  ; _fstrncmp?@s1:3DE8
1:3F33  83c40a               add sp, 0xa
1:3F36  0bc0                 or ax, ax
1:3F38  7510                 jne 0x3f4a
1:3F3A  c45efa               les bx, ptr [bp - 6]
1:3F3D  268b07               mov ax, word ptr es:[bx]
1:3F40  268b5702             mov dx, word ptr es:[bx + 2]
1:3F44  03c6                 add ax, si
1:3F46  40                   inc ax
1:3F47  eb0a                 jmp 0x3f53
1:3F49  db 90
loc_3F4A:
1:3F4A  8346fa04             add word ptr [bp - 6], 4
1:3F4E  eba2                 jmp 0x3ef2
loc_3F50:
1:3F50  33c0                 xor ax, ax
1:3F52  99                   cdq
loc_3F53:
1:3F53  5e                   pop si
1:3F54  8d66fe               lea sp, [bp - 2]
1:3F57  1f                   pop ds
1:3F58  5d                   pop bp
1:3F59  4d                   dec bp
1:3F5A  cb                   retf
1:3F5B  db 90

; ---------------- _fcloseall@s1:3F5C FAR size=64 callers=1
;   C runtime _fcloseall
1:3F5C  45                   inc bp
1:3F5D  55                   push bp
1:3F5E  8bec                 mov bp, sp
1:3F60  1e                   push ds
1:3F61  57                   push di
1:3F62  56                   push si
1:3F63  33ff                 xor di, di
1:3F65  393eec61             cmp word ptr [0x61ec], di
1:3F69  7405                 je 0x3f70
1:3F6B  be3462               mov si, 0x6234
1:3F6E  eb09                 jmp 0x3f79
loc_3F70:
1:3F70  be1062               mov si, 0x6210
1:3F73  eb04                 jmp 0x3f79
1:3F75  db 90
loc_3F76:
1:3F76  83c60c               add si, 0xc
loc_3F79:
1:3F79  3936f05f             cmp word ptr [0x5ff0], si
1:3F7D  7211                 jb 0x3f90
1:3F7F  1e                   push ds
1:3F80  56                   push si
1:3F81  90                   nop
1:3F82  0e                   push cs
1:3F83  e87aea               call 0x2a00  ; fclose@s1:2A00
1:3F86  83c404               add sp, 4
1:3F89  40                   inc ax
1:3F8A  74ea                 je 0x3f76
1:3F8C  47                   inc di
1:3F8D  ebe7                 jmp 0x3f76
1:3F8F  db 90
loc_3F90:
1:3F90  8bc7                 mov ax, di
1:3F92  5e                   pop si
1:3F93  5f                   pop di
1:3F94  8d66fe               lea sp, [bp - 2]
1:3F97  1f                   pop ds
1:3F98  5d                   pop bp
1:3F99  4d                   dec bp
1:3F9A  cb                   retf
1:3F9B  db 90

; ---------------- _fsprintf@s1:3F9C FAR size=110 callers=36
;   C runtime sprintf
1:3F9C  45                   inc bp
1:3F9D  55                   push bp
1:3F9E  8bec                 mov bp, sp
1:3FA0  1e                   push ds
1:3FA1  83ec04               sub sp, 4
1:3FA4  57                   push di
1:3FA5  56                   push si
1:3FA6  c606b26842           mov byte ptr [0x68b2], 0x42
1:3FAB  8b4606               mov ax, word ptr [bp + 6]
1:3FAE  8b5608               mov dx, word ptr [bp + 8]
1:3FB1  a3ae68               mov word ptr [0x68ae], ax
1:3FB4  8916b068             mov word ptr [0x68b0], dx
1:3FB8  bea868               mov si, 0x68a8
1:3FBB  8904                 mov word ptr [si], ax
1:3FBD  895402               mov word ptr [si + 2], dx
1:3FC0  c706ac68ff7f         mov word ptr [0x68ac], 0x7fff
1:3FC6  8d460e               lea ax, [bp + 0xe]
1:3FC9  16                   push ss
1:3FCA  50                   push ax
1:3FCB  ff760c               push word ptr [bp + 0xc]
1:3FCE  ff760a               push word ptr [bp + 0xa]
1:3FD1  1e                   push ds
1:3FD2  56                   push si
1:3FD3  90                   nop
1:3FD4  0e                   push cs
1:3FD5  e8dcf0               call 0x30b4  ; _output@s1:30B4
1:3FD8  83c40c               add sp, 0xc
1:3FDB  8bf8                 mov di, ax
1:3FDD  ff0eac68             dec word ptr [0x68ac]
1:3FE1  780f                 js 0x3ff2
1:3FE3  c41ea868             les bx, ptr [0x68a8]
1:3FE7  ff06a868             inc word ptr [0x68a8]
1:3FEB  26c60700             mov byte ptr es:[bx], 0
1:3FEF  eb0e                 jmp 0x3fff
1:3FF1  db 90
loc_3FF2:
1:3FF2  1e                   push ds
1:3FF3  56                   push si
1:3FF4  33c0                 xor ax, ax
1:3FF6  50                   push ax
1:3FF7  90                   nop
1:3FF8  0e                   push cs
1:3FF9  e8baeb               call 0x2bb6  ; _flsbuf@s1:2BB6
1:3FFC  83c406               add sp, 6
loc_3FFF:
1:3FFF  8bc7                 mov ax, di
1:4001  5e                   pop si
1:4002  5f                   pop di
1:4003  8d66fe               lea sp, [bp - 2]
1:4006  1f                   pop ds
1:4007  5d                   pop bp
1:4008  4d                   dec bp
1:4009  cb                   retf

; ---------------- _commit_flush?@s1:400A FAR size=112 callers=1
;   C runtime: flush with commit (DOS 68h via _commit)
1:400A  45                   inc bp
1:400B  55                   push bp
1:400C  8bec                 mov bp, sp
1:400E  1e                   push ds
1:400F  57                   push di
1:4010  56                   push si
1:4011  8b7606               mov si, word ptr [bp + 6]
1:4014  0bf6                 or si, si
1:4016  7c06                 jl 0x401e
1:4018  39368e5f             cmp word ptr [0x5f8e], si
1:401C  7f0c                 jg 0x402a
loc_401E:
1:401E  c706785f0900         mov word ptr [0x5f78], 9
1:4024  b8ffff               mov ax, 0xffff
1:4027  eb48                 jmp 0x4071
1:4029  db 90
loc_402A:
1:402A  833eec6100           cmp word ptr [0x61ec], 0
1:402F  740f                 je 0x4040
1:4031  39368a5f             cmp word ptr [0x5f8a], si
1:4035  7e05                 jle 0x403c
1:4037  83fe02               cmp si, 2
1:403A  7f04                 jg 0x4040
loc_403C:
1:403C  33c0                 xor ax, ax
1:403E  eb31                 jmp 0x4071
loc_4040:
1:4040  a0825f               mov al, byte ptr [0x5f82]
1:4043  8a26835f             mov ah, byte ptr [0x5f83]
1:4047  3d1e03               cmp ax, 0x31e
1:404A  7cf0                 jl 0x403c
1:404C  f684905f01           test byte ptr [si + 0x5f90], 1
1:4051  7413                 je 0x4066
1:4053  56                   push si
1:4054  90                   nop
1:4055  0e                   push cs
1:4056  e81b11               call 0x5174  ; _commit@s1:5174
1:4059  83c402               add sp, 2
1:405C  8bf8                 mov di, ax
1:405E  0bf8                 or di, ax
1:4060  740d                 je 0x406f
1:4062  893e885f             mov word ptr [0x5f88], di
loc_4066:
1:4066  c706785f0900         mov word ptr [0x5f78], 9
1:406C  bfffff               mov di, 0xffff
loc_406F:
1:406F  8bc7                 mov ax, di
loc_4071:
1:4071  5e                   pop si
1:4072  5f                   pop di
1:4073  8d66fe               lea sp, [bp - 2]
1:4076  1f                   pop ds
1:4077  5d                   pop bp
1:4078  4d                   dec bp
1:4079  cb                   retf

; ---------------- _hfree@s1:407A FAR size=53 callers=0
;   apis: KERNEL.GlobalFree, KERNEL.GlobalUnlock
;   C runtime huge free (GlobalUnlock/GlobalFree)
1:407A  8cd8                 mov ax, ds
1:407C  90                   nop
1:407D  45                   inc bp
1:407E  55                   push bp
1:407F  8bec                 mov bp, sp
1:4081  1e                   push ds
1:4082  8ed8                 mov ds, ax
1:4084  ff7608               push word ptr [bp + 8]
1:4087  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:408E  7411                 je 0x40a1
1:4090  e84d01               call 0x41e0  ; _hfind@s1:41E0
1:4093  83c402               add sp, 2
1:4096  0bc0                 or ax, ax
1:4098  740c                 je 0x40a6
1:409A  50                   push ax
1:409B  50                   push ax
1:409C  9affff0000           lcall 0, 0xffff  ; KERNEL.GlobalUnlock
loc_40A1:
1:40A1  9af2130000           lcall 0, 0x13f2  ; KERNEL.GlobalFree
loc_40A6:
1:40A6  83ed02               sub bp, 2
1:40A9  8be5                 mov sp, bp
1:40AB  1f                   pop ds
1:40AC  5d                   pop bp
1:40AD  4d                   dec bp
1:40AE  cb                   retf

; ---------------- _halloc@s1:40AF FAR size=305 callers=0
;   apis: KERNEL.GlobalAlloc, KERNEL.GlobalFree, KERNEL.GlobalLock, KERNEL.GlobalUnlock
;   C runtime huge alloc (GlobalAlloc + GlobalLock)
1:40AF  8cd8                 mov ax, ds
1:40B1  90                   nop
1:40B2  45                   inc bp
1:40B3  55                   push bp
1:40B4  8bec                 mov bp, sp
1:40B6  1e                   push ds
1:40B7  8ed8                 mov ds, ax
1:40B9  83ec02               sub sp, 2
1:40BC  56                   push si
1:40BD  57                   push di
loc_40BE:
1:40BE  8b5e0a               mov bx, word ptr [bp + 0xa]
1:40C1  8b4606               mov ax, word ptr [bp + 6]
1:40C4  f7e3                 mul bx
1:40C6  8bc8                 mov cx, ax
1:40C8  8bfa                 mov di, dx
1:40CA  8b4608               mov ax, word ptr [bp + 8]
1:40CD  f7e3                 mul bx
1:40CF  03c7                 add ax, di
1:40D1  8bd0                 mov dx, ax
1:40D3  0bc1                 or ax, cx
1:40D5  7503                 jne 0x40da
1:40D7  e9d000               jmp 0x41aa
loc_40DA:
1:40DA  33f6                 xor si, si
1:40DC  8d47ff               lea ax, [bx - 1]
1:40DF  83fa02               cmp dx, 2
1:40E2  7704                 ja 0x40e8
1:40E4  720b                 jb 0x40f1
1:40E6  e309                 jcxz 0x40f1
loc_40E8:
1:40E8  23c3                 and ax, bx
1:40EA  7403                 je 0x40ef
1:40EC  e9bb00               jmp 0x41aa
loc_40EF:
1:40EF  eb28                 jmp 0x4119
loc_40F1:
1:40F1  83fa01               cmp dx, 1
1:40F4  730f                 jae 0x4105
1:40F6  81c1ff0f             add cx, 0xfff
1:40FA  81e100f0             and cx, 0xf000
1:40FE  0bc9                 or cx, cx
1:4100  7517                 jne 0x4119
1:4102  42                   inc dx
1:4103  eb14                 jmp 0x4119
loc_4105:
1:4105  23c3                 and ax, bx
1:4107  7410                 je 0x4119
1:4109  33c0                 xor ax, ax
1:410B  f7f3                 div bx
1:410D  8bf2                 mov si, dx
1:410F  03ca                 add cx, dx
1:4111  7303                 jae 0x4116
1:4113  e99400               jmp 0x41aa
loc_4116:
1:4116  ba0100               mov dx, 1
loc_4119:
1:4119  52                   push dx
1:411A  51                   push cx
1:411B  2e8b1ef622           mov bx, word ptr cs:[0x22f6]
1:4120  b80200               mov ax, 2
1:4123  f7c30100             test bx, 1
1:4127  7503                 jne 0x412c
1:4129  b82000               mov ax, 0x20  ; 'New failed in Op::Op'
loc_412C:
1:412C  53                   push bx
1:412D  50                   push ax
1:412E  52                   push dx
1:412F  51                   push cx
1:4130  9a7c130000           lcall 0, 0x137c  ; KERNEL.GlobalAlloc
1:4135  5b                   pop bx
1:4136  0bc0                 or ax, ax
1:4138  7438                 je 0x4172
1:413A  f7c30100             test bx, 1
1:413E  7432                 je 0x4172
1:4140  50                   push ax
1:4141  50                   push ax
1:4142  50                   push ax
1:4143  9ae1140000           lcall 0, 0x14e1  ; KERNEL.GlobalLock
1:4148  0bc0                 or ax, ax
1:414A  7403                 je 0x414f
1:414C  e98b00               jmp 0x41da
loc_414F:
1:414F  0bc2                 or ax, dx
1:4151  7503                 jne 0x4156
1:4153  e98400               jmp 0x41da
loc_4156:
1:4156  8bc2                 mov ax, dx
1:4158  50                   push ax
1:4159  e8ce00               call 0x422a  ; _hadd@s1:422A
1:415C  83c404               add sp, 4
1:415F  59                   pop cx
1:4160  0bc0                 or ax, ax
1:4162  750e                 jne 0x4172
1:4164  51                   push cx
1:4165  51                   push cx
1:4166  9a9d400000           lcall 0, 0x409d  ; KERNEL.GlobalUnlock
1:416B  9aa2400000           lcall 0, 0x40a2  ; KERNEL.GlobalFree
1:4170  33c0                 xor ax, ax
loc_4172:
1:4172  59                   pop cx
1:4173  5a                   pop dx
1:4174  0bc0                 or ax, ax
1:4176  7432                 je 0x41aa
1:4178  8946fc               mov word ptr [bp - 4], ax
1:417B  fc                   cld
1:417C  33ff                 xor di, di
1:417E  8bd9                 mov bx, cx
1:4180  85d2                 test dx, dx
1:4182  7416                 je 0x419a
loc_4184:
1:4184  8ec0                 mov es, ax
1:4186  33c0                 xor ax, ax
1:4188  b90080               mov cx, 0x8000
1:418B  f3ab                 rep stosw word ptr es:[di], ax
1:418D  40                   inc ax
1:418E  b99522               mov cx, 0x2295  ; OFFSET KERNEL.__AHSHIFT
1:4191  d3e0                 shl ax, cl
1:4193  8cc1                 mov cx, es
1:4195  03c1                 add ax, cx
1:4197  4a                   dec dx
1:4198  75ea                 jne 0x4184
loc_419A:
1:419A  8bcb                 mov cx, bx
1:419C  e306                 jcxz 0x41a4
1:419E  8ec0                 mov es, ax
1:41A0  33c0                 xor ax, ax
1:41A2  f3aa                 rep stosb byte ptr es:[di], al
loc_41A4:
1:41A4  8b56fc               mov dx, word ptr [bp - 4]
1:41A7  96                   xchg si, ax
1:41A8  eb25                 jmp 0x41cf
loc_41AA:
1:41AA  33c0                 xor ax, ax
1:41AC  99                   cdq
1:41AD  8b0e8e61             mov cx, word ptr [0x618e]
1:41B1  0b0e8c61             or cx, word ptr [0x618c]
1:41B5  7418                 je 0x41cf
1:41B7  ff7608               push word ptr [bp + 8]
1:41BA  ff7606               push word ptr [bp + 6]
1:41BD  ff760a               push word ptr [bp + 0xa]
1:41C0  ff1e8c61             lcall [0x618c]
1:41C4  83c406               add sp, 6
1:41C7  99                   cdq
1:41C8  0bc0                 or ax, ax
1:41CA  7403                 je 0x41cf
1:41CC  e9effe               jmp 0x40be
loc_41CF:
1:41CF  5f                   pop di
1:41D0  5e                   pop si
1:41D1  83ed02               sub bp, 2
1:41D4  8be5                 mov sp, bp
1:41D6  1f                   pop ds
1:41D7  5d                   pop bp
1:41D8  4d                   dec bp
1:41D9  cb                   retf
loc_41DA:
1:41DA  b81200               mov ax, 0x12  ; 'version %d %d'
1:41DD  e9bae6               jmp 0x289a

; ---------------- _hfind@s1:41E0 size=74 callers=1
;   huge-block handle table lookup
1:41E0  55                   push bp
1:41E1  8bec                 mov bp, sp
1:41E3  83ec08               sub sp, 8
1:41E6  a19061               mov ax, word ptr [0x6190]
1:41E9  8b169261             mov dx, word ptr [0x6192]
1:41ED  8946fc               mov word ptr [bp - 4], ax
1:41F0  8956fe               mov word ptr [bp - 2], dx
1:41F3  8b0e9461             mov cx, word ptr [0x6194]
1:41F7  80e1fc               and cl, 0xfc
1:41FA  03c1                 add ax, cx
1:41FC  8946f8               mov word ptr [bp - 8], ax
1:41FF  eb05                 jmp 0x4206
1:4201  db 90
loc_4202:
1:4202  8346fc04             add word ptr [bp - 4], 4
loc_4206:
1:4206  8b46fc               mov ax, word ptr [bp - 4]
1:4209  3946f8               cmp word ptr [bp - 8], ax
1:420C  7616                 jbe 0x4224
1:420E  8b4604               mov ax, word ptr [bp + 4]
1:4211  c45efc               les bx, ptr [bp - 4]
1:4214  263907               cmp word ptr es:[bx], ax
1:4217  75e9                 jne 0x4202
1:4219  26c7070000           mov word ptr es:[bx], 0
1:421E  268b4702             mov ax, word ptr es:[bx + 2]
1:4222  eb02                 jmp 0x4226
loc_4224:
1:4224  33c0                 xor ax, ax
loc_4226:
1:4226  8be5                 mov sp, bp
1:4228  5d                   pop bp
1:4229  c3                   ret

; ---------------- _hadd@s1:422A FAR size=180 callers=1
;   huge-block handle table insert
1:422A  55                   push bp
1:422B  8bec                 mov bp, sp
1:422D  83ec0a               sub sp, 0xa
1:4230  a19061               mov ax, word ptr [0x6190]
1:4233  8b169261             mov dx, word ptr [0x6192]
1:4237  8946fc               mov word ptr [bp - 4], ax
1:423A  8956fe               mov word ptr [bp - 2], dx
1:423D  8b0e9461             mov cx, word ptr [0x6194]
1:4241  80e1fc               and cl, 0xfc
1:4244  03c1                 add ax, cx
1:4246  8946f8               mov word ptr [bp - 8], ax
1:4249  eb05                 jmp 0x4250
1:424B  db 90
loc_424C:
1:424C  8346fc04             add word ptr [bp - 4], 4
loc_4250:
1:4250  8b46fc               mov ax, word ptr [bp - 4]
1:4253  3946f8               cmp word ptr [bp - 8], ax
1:4256  7618                 jbe 0x4270
1:4258  c45efc               les bx, ptr [bp - 4]
1:425B  26833f00             cmp word ptr es:[bx], 0
1:425F  75eb                 jne 0x424c
1:4261  8b4606               mov ax, word ptr [bp + 6]
1:4264  26894702             mov word ptr es:[bx + 2], ax
1:4268  8b4604               mov ax, word ptr [bp + 4]
1:426B  268907               mov word ptr es:[bx], ax
1:426E  eb6a                 jmp 0x42da
loc_4270:
1:4270  a19461               mov ax, word ptr [0x6194]
1:4273  052800               add ax, 0x28
1:4276  8946f6               mov word ptr [bp - 0xa], ax
1:4279  50                   push ax
1:427A  ff369261             push word ptr [0x6192]
1:427E  ff369061             push word ptr [0x6190]
1:4282  90                   nop
1:4283  0e                   push cs
1:4284  e823d4               call 0x16aa  ; _frealloc@s1:16AA
1:4287  83c406               add sp, 6
1:428A  8946fc               mov word ptr [bp - 4], ax
1:428D  8956fe               mov word ptr [bp - 2], dx
1:4290  0bd0                 or dx, ax
1:4292  7504                 jne 0x4298
1:4294  33c0                 xor ax, ax
1:4296  eb42                 jmp 0x42da
loc_4298:
1:4298  8b56fe               mov dx, word ptr [bp - 2]
1:429B  a39061               mov word ptr [0x6190], ax
1:429E  89169261             mov word ptr [0x6192], dx
1:42A2  8b4604               mov ax, word ptr [bp + 4]
1:42A5  8b0e9461             mov cx, word ptr [0x6194]
1:42A9  80e1fc               and cl, 0xfc
1:42AC  014efc               add word ptr [bp - 4], cx
1:42AF  c45efc               les bx, ptr [bp - 4]
1:42B2  268907               mov word ptr es:[bx], ax
1:42B5  8b4e06               mov cx, word ptr [bp + 6]
1:42B8  26894f02             mov word ptr es:[bx + 2], cx
1:42BC  8b4ef6               mov cx, word ptr [bp - 0xa]
1:42BF  890e9461             mov word ptr [0x6194], cx
1:42C3  b92400               mov cx, 0x24
1:42C6  51                   push cx
1:42C7  33c9                 xor cx, cx
1:42C9  51                   push cx
1:42CA  8d4f04               lea cx, [bx + 4]
1:42CD  894efc               mov word ptr [bp - 4], cx
1:42D0  06                   push es
1:42D1  51                   push cx
1:42D2  90                   nop
1:42D3  0e                   push cs
1:42D4  e82f06               call 0x4906  ; _fmemset@s1:4906
1:42D7  8b4604               mov ax, word ptr [bp + 4]
loc_42DA:
1:42DA  8be5                 mov sp, bp
1:42DC  5d                   pop bp
1:42DD  c3                   ret

; ---------------- _validdrive?@s1:42DE FAR size=126 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime: DOS drive call used by _getdcwd
1:42DE  8cd8                 mov ax, ds
1:42E0  90                   nop
1:42E1  45                   inc bp
1:42E2  55                   push bp
1:42E3  8bec                 mov bp, sp
1:42E5  1e                   push ds
1:42E6  8ed8                 mov ds, ax
1:42E8  56                   push si
1:42E9  57                   push di
1:42EA  1e                   push ds
1:42EB  c57e06               lds di, ptr [bp + 6]
1:42EE  8b05                 mov ax, word ptr [di]
1:42F0  8b5d02               mov bx, word ptr [di + 2]
1:42F3  8b4d04               mov cx, word ptr [di + 4]
1:42F6  8b5506               mov dx, word ptr [di + 6]
1:42F9  8b7508               mov si, word ptr [di + 8]
1:42FC  ff750a               push word ptr [di + 0xa]
1:42FF  c57e0e               lds di, ptr [bp + 0xe]
1:4302  8e05                 mov es, word ptr [di]
1:4304  8e5d06               mov ds, word ptr [di + 6]
1:4307  5f                   pop di
1:4308  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:430F  7407                 je 0x4318
1:4311  9a7f3b0000           lcall 0, 0x3b7f  ; KERNEL.DOS3Call
1:4316  eb02                 jmp 0x431a
loc_4318:
1:4318  cd21                 int 0x21
loc_431A:
1:431A  57                   push di
1:431B  1e                   push ds
1:431C  c57e0e               lds di, ptr [bp + 0xe]
1:431F  8c05                 mov word ptr [di], es
1:4321  8f4506               pop word ptr [di + 6]
1:4324  c57e0a               lds di, ptr [bp + 0xa]
1:4327  8905                 mov word ptr [di], ax
1:4329  895d02               mov word ptr [di + 2], bx
1:432C  894d04               mov word ptr [di + 4], cx
1:432F  895506               mov word ptr [di + 6], dx
1:4332  897508               mov word ptr [di + 8], si
1:4335  8f450a               pop word ptr [di + 0xa]
1:4338  7204                 jb 0x433e
1:433A  33f6                 xor si, si
1:433C  eb0e                 jmp 0x434c
loc_433E:
1:433E  1f                   pop ds
1:433F  1e                   push ds
1:4340  0e                   push cs
1:4341  e86be6               call 0x29af  ; _dosmaperr_far@s1:29AF
1:4344  c57e0a               lds di, ptr [bp + 0xa]
1:4347  be0100               mov si, 1
1:434A  8b05                 mov ax, word ptr [di]
loc_434C:
1:434C  89750c               mov word ptr [di + 0xc], si
1:434F  1f                   pop ds
1:4350  5f                   pop di
1:4351  5e                   pop si
1:4352  83ed02               sub bp, 2
1:4355  8be5                 mov sp, bp
1:4357  1f                   pop ds
1:4358  5d                   pop bp
1:4359  4d                   dec bp
1:435A  cb                   retf
1:435B  db 00

; ---------------- time@s1:435C FAR size=148 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime time() (DOS date/time; WinMain seeds srand with it)
1:435C  8cd8                 mov ax, ds
1:435E  90                   nop
1:435F  45                   inc bp
1:4360  55                   push bp
1:4361  8bec                 mov bp, sp
1:4363  1e                   push ds
1:4364  8ed8                 mov ds, ax
1:4366  56                   push si
1:4367  b42a                 mov ah, 0x2a
1:4369  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:4370  7407                 je 0x4379
1:4372  9a12430000           lcall 0, 0x4312  ; KERNEL.DOS3Call
1:4377  eb02                 jmp 0x437b
loc_4379:
1:4379  cd21                 int 0x21
loc_437B:
1:437B  8bda                 mov bx, dx
1:437D  8bf1                 mov si, cx
1:437F  b42c                 mov ah, 0x2c
1:4381  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:4388  7407                 je 0x4391
1:438A  9a73430000           lcall 0, 0x4373  ; KERNEL.DOS3Call
1:438F  eb02                 jmp 0x4393
loc_4391:
1:4391  cd21                 int 0x21
loc_4393:
1:4393  b400                 mov ah, 0
1:4395  8ac6                 mov al, dh
1:4397  50                   push ax
1:4398  8ac1                 mov al, cl
1:439A  50                   push ax
1:439B  8ac5                 mov al, ch
1:439D  50                   push ax
1:439E  50                   push ax
1:439F  b42a                 mov ah, 0x2a
1:43A1  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:43A8  7407                 je 0x43b1
1:43AA  9a8b430000           lcall 0, 0x438b  ; KERNEL.DOS3Call
1:43AF  eb02                 jmp 0x43b3
loc_43B1:
1:43B1  cd21                 int 0x21
loc_43B3:
1:43B3  3bda                 cmp bx, dx
1:43B5  58                   pop ax
1:43B6  7408                 je 0x43c0
1:43B8  3c17                 cmp al, 0x17
1:43BA  7504                 jne 0x43c0
1:43BC  8bd3                 mov dx, bx
1:43BE  8bce                 mov cx, si
loc_43C0:
1:43C0  b400                 mov ah, 0
1:43C2  8ac2                 mov al, dl
1:43C4  50                   push ax
1:43C5  8ac6                 mov al, dh
1:43C7  50                   push ax
1:43C8  81e9bc07             sub cx, 0x7bc
1:43CC  51                   push cx
1:43CD  90                   nop
1:43CE  0e                   push cs
1:43CF  e85c02               call 0x462e  ; __loctotime_t@s1:462E
1:43D2  83c40c               add sp, 0xc
1:43D5  837e0800             cmp word ptr [bp + 8], 0
1:43D9  740a                 je 0x43e5
1:43DB  c45e06               les bx, ptr [bp + 6]
1:43DE  26895702             mov word ptr es:[bx + 2], dx
1:43E2  268907               mov word ptr es:[bx], ax
loc_43E5:
1:43E5  5e                   pop si
1:43E6  83ed02               sub bp, 2
1:43E9  8be5                 mov sp, bp
1:43EB  1f                   pop ds
1:43EC  5d                   pop bp
1:43ED  4d                   dec bp
1:43EE  cb                   retf
1:43EF  db 00

; ---------------- __tzset@s1:43F0 FAR size=28 callers=1
;   C runtime: runs _tzset once
1:43F0  45                   inc bp
1:43F1  55                   push bp
1:43F2  8bec                 mov bp, sp
1:43F4  1e                   push ds
1:43F5  833eb46800           cmp word ptr [0x68b4], 0
1:43FA  7509                 jne 0x4405
1:43FC  90                   nop
1:43FD  0e                   push cs
1:43FE  e80b00               call 0x440c  ; _tzset@s1:440C
1:4401  ff06b468             inc word ptr [0x68b4]
loc_4405:
1:4405  8d66fe               lea sp, [bp - 2]
1:4408  1f                   pop ds
1:4409  5d                   pop bp
1:440A  4d                   dec bp
1:440B  cb                   retf

; ---------------- _tzset@s1:440C FAR size=334 callers=1
;   C runtime _tzset (reads TZ via getenv)
1:440C  45                   inc bp
1:440D  55                   push bp
1:440E  8bec                 mov bp, sp
1:4410  1e                   push ds
1:4411  83ec04               sub sp, 4
1:4414  56                   push si
1:4415  33f6                 xor si, si
1:4417  b8ca61               mov ax, 0x61ca
1:441A  1e                   push ds
1:441B  50                   push ax
1:441C  90                   nop
1:441D  0e                   push cs
1:441E  e89ffa               call 0x3ec0  ; getenv@s1:3EC0
1:4421  83c404               add sp, 4
1:4424  8946fa               mov word ptr [bp - 6], ax
1:4427  8956fc               mov word ptr [bp - 4], dx
1:442A  0bd0                 or dx, ax
1:442C  7503                 jne 0x4431
1:442E  e92101               jmp 0x4552
loc_4431:
1:4431  c45efa               les bx, ptr [bp - 6]
1:4434  26803f00             cmp byte ptr es:[bx], 0
1:4438  7503                 jne 0x443d
1:443A  e91501               jmp 0x4552
loc_443D:
1:443D  b80300               mov ax, 3
1:4440  50                   push ax
1:4441  06                   push es
1:4442  53                   push bx
1:4443  ff36de61             push word ptr [0x61de]
1:4447  ff36dc61             push word ptr [0x61dc]
1:444B  90                   nop
1:444C  0e                   push cs
1:444D  e86ef9               call 0x3dbe  ; _fstrncpy@s1:3DBE
1:4450  83c40a               add sp, 0xa
1:4453  8346fa03             add word ptr [bp - 6], 3
1:4457  c45efa               les bx, ptr [bp - 6]
1:445A  26803f2d             cmp byte ptr es:[bx], 0x2d
1:445E  7507                 jne 0x4467
1:4460  46                   inc si
1:4461  8d4701               lea ax, [bx + 1]
1:4464  8946fa               mov word ptr [bp - 6], ax
loc_4467:
1:4467  b8100e               mov ax, 0xe10
1:446A  99                   cdq
1:446B  52                   push dx
1:446C  50                   push ax
1:446D  06                   push es
1:446E  ff76fa               push word ptr [bp - 6]
1:4471  90                   nop
1:4472  0e                   push cs
1:4473  e8b2f9               call 0x3e28  ; _fatol@s1:3E28
1:4476  83c404               add sp, 4
1:4479  52                   push dx
1:447A  50                   push ax
1:447B  90                   nop
1:447C  0e                   push cs
1:447D  e83e0e               call 0x52be  ; __aFlmul@s1:52BE
1:4480  a3ce61               mov word ptr [0x61ce], ax
1:4483  8916d061             mov word ptr [0x61d0], dx
loc_4487:
1:4487  c45efa               les bx, ptr [bp - 6]
1:448A  26803f2b             cmp byte ptr es:[bx], 0x2b
1:448E  740c                 je 0x449c
1:4490  26803f30             cmp byte ptr es:[bx], 0x30
1:4494  7c0c                 jl 0x44a2
1:4496  26803f39             cmp byte ptr es:[bx], 0x39
1:449A  7f06                 jg 0x44a2
loc_449C:
1:449C  ff46fa               inc word ptr [bp - 6]
1:449F  ebe6                 jmp 0x4487
1:44A1  db 90
loc_44A2:
1:44A2  26803f3a             cmp byte ptr es:[bx], 0x3a
1:44A6  756a                 jne 0x4512
1:44A8  b83c00               mov ax, 0x3c
1:44AB  99                   cdq
1:44AC  52                   push dx
1:44AD  50                   push ax
1:44AE  ff46fa               inc word ptr [bp - 6]
1:44B1  06                   push es
1:44B2  ff76fa               push word ptr [bp - 6]
1:44B5  90                   nop
1:44B6  0e                   push cs
1:44B7  e86ef9               call 0x3e28  ; _fatol@s1:3E28
1:44BA  83c404               add sp, 4
1:44BD  52                   push dx
1:44BE  50                   push ax
1:44BF  90                   nop
1:44C0  0e                   push cs
1:44C1  e8fa0d               call 0x52be  ; __aFlmul@s1:52BE
1:44C4  0106ce61             add word ptr [0x61ce], ax
1:44C8  1116d061             adc word ptr [0x61d0], dx
1:44CC  eb09                 jmp 0x44d7
loc_44CE:
1:44CE  26803f39             cmp byte ptr es:[bx], 0x39
1:44D2  7f0c                 jg 0x44e0
1:44D4  ff46fa               inc word ptr [bp - 6]
loc_44D7:
1:44D7  c45efa               les bx, ptr [bp - 6]
1:44DA  26803f30             cmp byte ptr es:[bx], 0x30
1:44DE  7dee                 jge 0x44ce
loc_44E0:
1:44E0  26803f3a             cmp byte ptr es:[bx], 0x3a
1:44E4  752c                 jne 0x4512
1:44E6  ff46fa               inc word ptr [bp - 6]
1:44E9  06                   push es
1:44EA  ff76fa               push word ptr [bp - 6]
1:44ED  90                   nop
1:44EE  0e                   push cs
1:44EF  e836f9               call 0x3e28  ; _fatol@s1:3E28
1:44F2  83c404               add sp, 4
1:44F5  0106ce61             add word ptr [0x61ce], ax
1:44F9  1116d061             adc word ptr [0x61d0], dx
1:44FD  eb0a                 jmp 0x4509
1:44FF  db 90
loc_4500:
1:4500  26803f39             cmp byte ptr es:[bx], 0x39
1:4504  7f0c                 jg 0x4512
1:4506  ff46fa               inc word ptr [bp - 6]
loc_4509:
1:4509  c45efa               les bx, ptr [bp - 6]
1:450C  26803f30             cmp byte ptr es:[bx], 0x30
1:4510  7dee                 jge 0x4500
loc_4512:
1:4512  0bf6                 or si, si
1:4514  740d                 je 0x4523
1:4516  f71ece61             neg word ptr [0x61ce]
1:451A  8316d06100           adc word ptr [0x61d0], 0
1:451F  f71ed061             neg word ptr [0x61d0]
loc_4523:
1:4523  c45efa               les bx, ptr [bp - 6]
1:4526  268a07               mov al, byte ptr es:[bx]
1:4529  98                   cwde
1:452A  a3d261               mov word ptr [0x61d2], ax
1:452D  0bc0                 or ax, ax
1:452F  7419                 je 0x454a
1:4531  b80300               mov ax, 3
1:4534  50                   push ax
1:4535  06                   push es
1:4536  53                   push bx
1:4537  ff36e261             push word ptr [0x61e2]
1:453B  ff36e061             push word ptr [0x61e0]
1:453F  90                   nop
1:4540  0e                   push cs
1:4541  e87af8               call 0x3dbe  ; _fstrncpy@s1:3DBE
1:4544  83c40a               add sp, 0xa
1:4547  eb09                 jmp 0x4552
1:4549  db 90
loc_454A:
1:454A  c41ee061             les bx, ptr [0x61e0]
1:454E  26c60700             mov byte ptr es:[bx], 0
loc_4552:
1:4552  5e                   pop si
1:4553  8d66fe               lea sp, [bp - 2]
1:4556  1f                   pop ds
1:4557  5d                   pop bp
1:4558  4d                   dec bp
1:4559  cb                   retf

; ---------------- _isindst@s1:455A FAR size=212 callers=1
;   C runtime: daylight-saving test
1:455A  45                   inc bp
1:455B  55                   push bp
1:455C  8bec                 mov bp, sp
1:455E  1e                   push ds
1:455F  83ec04               sub sp, 4
1:4562  56                   push si
1:4563  c45e06               les bx, ptr [bp + 6]
1:4566  26837f0a43           cmp word ptr es:[bx + 0xa], 0x43
1:456B  7d03                 jge 0x4570
1:456D  e9b300               jmp 0x4623
loc_4570:
1:4570  26837f0803           cmp word ptr es:[bx + 8], 3
1:4575  7d03                 jge 0x457a
1:4577  e9a900               jmp 0x4623
loc_457A:
1:457A  26837f0809           cmp word ptr es:[bx + 8], 9
1:457F  7e03                 jle 0x4584
1:4581  e99f00               jmp 0x4623
loc_4584:
1:4584  26837f0803           cmp word ptr es:[bx + 8], 3
1:4589  7e07                 jle 0x4592
1:458B  26837f0809           cmp word ptr es:[bx + 8], 9
1:4590  7c7c                 jl 0x460e
loc_4592:
1:4592  268b770a             mov si, word ptr es:[bx + 0xa]
1:4596  83fe56               cmp si, 0x56
1:4599  7e17                 jle 0x45b2
1:459B  26837f0803           cmp word ptr es:[bx + 8], 3
1:45A0  7510                 jne 0x45b2
1:45A2  268b5f08             mov bx, word ptr es:[bx + 8]
1:45A6  03db                 add bx, bx
1:45A8  8b87b061             mov ax, word ptr [bx + 0x61b0]
1:45AC  050700               add ax, 7
1:45AF  eb0b                 jmp 0x45bc
1:45B1  db 90
loc_45B2:
1:45B2  268b5f08             mov bx, word ptr es:[bx + 8]
1:45B6  03db                 add bx, bx
1:45B8  8b87b261             mov ax, word ptr [bx + 0x61b2]
loc_45BC:
1:45BC  8946fc               mov word ptr [bp - 4], ax
1:45BF  f7c60300             test si, 3
1:45C3  7503                 jne 0x45c8
1:45C5  ff46fc               inc word ptr [bp - 4]
loc_45C8:
1:45C8  b80700               mov ax, 7
1:45CB  99                   cdq
1:45CC  52                   push dx
1:45CD  50                   push ax
1:45CE  b96d01               mov cx, 0x16d
1:45D1  8d44ba               lea ax, [si - 0x46]
1:45D4  f7e9                 imul cx
1:45D6  8d4cff               lea cx, [si - 1]
1:45D9  d1f9                 sar cx, 1
1:45DB  d1f9                 sar cx, 1
1:45DD  03c1                 add ax, cx
1:45DF  0346fc               add ax, word ptr [bp - 4]
1:45E2  99                   cdq
1:45E3  2d0d00               sub ax, 0xd
1:45E6  83da00               sbb dx, 0
1:45E9  52                   push dx
1:45EA  50                   push ax
1:45EB  90                   nop
1:45EC  0e                   push cs
1:45ED  e8000d               call 0x52f0  ; __aFldiv@s1:52F0
1:45F0  2b46fc               sub ax, word ptr [bp - 4]
1:45F3  f7d8                 neg ax
1:45F5  c45e06               les bx, ptr [bp + 6]
1:45F8  26837f0803           cmp word ptr es:[bx + 8], 3
1:45FD  7515                 jne 0x4614
1:45FF  263b470e             cmp ax, word ptr es:[bx + 0xe]
1:4603  7c09                 jl 0x460e
1:4605  751c                 jne 0x4623
1:4607  26837f0402           cmp word ptr es:[bx + 4], 2
1:460C  7c15                 jl 0x4623
loc_460E:
1:460E  b80100               mov ax, 1
1:4611  eb12                 jmp 0x4625
1:4613  db 90
loc_4614:
1:4614  2639470e             cmp word ptr es:[bx + 0xe], ax
1:4618  7cf4                 jl 0x460e
1:461A  7507                 jne 0x4623
1:461C  26837f0401           cmp word ptr es:[bx + 4], 1
1:4621  7ceb                 jl 0x460e
loc_4623:
1:4623  33c0                 xor ax, ax
loc_4625:
1:4625  5e                   pop si
1:4626  8d66fe               lea sp, [bp - 2]
1:4629  1f                   pop ds
1:462A  5d                   pop bp
1:462B  4d                   dec bp
1:462C  cb                   retf
1:462D  db 90

; ---------------- __loctotime_t@s1:462E FAR size=254 callers=1
;   C runtime: DOS date/time -> time_t
1:462E  45                   inc bp
1:462F  55                   push bp
1:4630  8bec                 mov bp, sp
1:4632  1e                   push ds
1:4633  83ec1a               sub sp, 0x1a
1:4636  57                   push di
1:4637  56                   push si
1:4638  8b7606               mov si, word ptr [bp + 6]
1:463B  8b5e08               mov bx, word ptr [bp + 8]
1:463E  03db                 add bx, bx
1:4640  8bbfae61             mov di, word ptr [bx + 0x61ae]
1:4644  f7c60300             test si, 3
1:4648  7507                 jne 0x4651
1:464A  837e0802             cmp word ptr [bp + 8], 2
1:464E  7e01                 jle 0x4651
1:4650  47                   inc di
loc_4651:
1:4651  90                   nop
1:4652  0e                   push cs
1:4653  e89afd               call 0x43f0  ; __tzset@s1:43F0
1:4656  b83c00               mov ax, 0x3c
1:4659  99                   cdq
1:465A  52                   push dx
1:465B  50                   push ax
1:465C  52                   push dx
1:465D  50                   push ax
1:465E  b81800               mov ax, 0x18
1:4661  99                   cdq
1:4662  52                   push dx
1:4663  50                   push ax
1:4664  8bc6                 mov ax, si
1:4666  b96d01               mov cx, 0x16d
1:4669  f7e9                 imul cx
1:466B  8bc8                 mov cx, ax
1:466D  8b460a               mov ax, word ptr [bp + 0xa]
1:4670  8bda                 mov bx, dx
1:4672  99                   cdq
1:4673  8946e4               mov word ptr [bp - 0x1c], ax
1:4676  8956e6               mov word ptr [bp - 0x1a], dx
1:4679  8d4403               lea ax, [si + 3]
1:467C  d1f8                 sar ax, 1
1:467E  d1f8                 sar ax, 1
1:4680  99                   cdq
1:4681  0346e4               add ax, word ptr [bp - 0x1c]
1:4684  1356e6               adc dx, word ptr [bp - 0x1a]
1:4687  03c8                 add cx, ax
1:4689  13da                 adc bx, dx
1:468B  8bc7                 mov ax, di
1:468D  99                   cdq
1:468E  03cf                 add cx, di
1:4690  13da                 adc bx, dx
1:4692  81c1440e             add cx, 0xe44
1:4696  83d300               adc bx, 0
1:4699  53                   push bx
1:469A  51                   push cx
1:469B  90                   nop
1:469C  0e                   push cs
1:469D  e81e0c               call 0x52be  ; __aFlmul@s1:52BE
1:46A0  8bc8                 mov cx, ax
1:46A2  8b460c               mov ax, word ptr [bp + 0xc]
1:46A5  8bda                 mov bx, dx
1:46A7  99                   cdq
1:46A8  03c8                 add cx, ax
1:46AA  13da                 adc bx, dx
1:46AC  53                   push bx
1:46AD  51                   push cx
1:46AE  90                   nop
1:46AF  0e                   push cs
1:46B0  e80b0c               call 0x52be  ; __aFlmul@s1:52BE
1:46B3  8bc8                 mov cx, ax
1:46B5  8b460e               mov ax, word ptr [bp + 0xe]
1:46B8  8bda                 mov bx, dx
1:46BA  99                   cdq
1:46BB  03c8                 add cx, ax
1:46BD  13da                 adc bx, dx
1:46BF  53                   push bx
1:46C0  51                   push cx
1:46C1  90                   nop
1:46C2  0e                   push cs
1:46C3  e8f80b               call 0x52be  ; __aFlmul@s1:52BE
1:46C6  8bc8                 mov cx, ax
1:46C8  8b4610               mov ax, word ptr [bp + 0x10]
1:46CB  8bda                 mov bx, dx
1:46CD  99                   cdq
1:46CE  03c8                 add cx, ax
1:46D0  13da                 adc bx, dx
1:46D2  030ece61             add cx, word ptr [0x61ce]
1:46D6  131ed061             adc bx, word ptr [0x61d0]
1:46DA  894ee8               mov word ptr [bp - 0x18], cx
1:46DD  895eea               mov word ptr [bp - 0x16], bx
1:46E0  8b460a               mov ax, word ptr [bp + 0xa]
1:46E3  03c7                 add ax, di
1:46E5  8946fa               mov word ptr [bp - 6], ax
1:46E8  8d4450               lea ax, [si + 0x50]
1:46EB  8946f6               mov word ptr [bp - 0xa], ax
1:46EE  8b4608               mov ax, word ptr [bp + 8]
1:46F1  48                   dec ax
1:46F2  8946f4               mov word ptr [bp - 0xc], ax
1:46F5  8b460c               mov ax, word ptr [bp + 0xc]
1:46F8  8946f0               mov word ptr [bp - 0x10], ax
1:46FB  833ed26100           cmp word ptr [0x61d2], 0
1:4700  741a                 je 0x471c
1:4702  8d46ec               lea ax, [bp - 0x14]
1:4705  16                   push ss
1:4706  50                   push ax
1:4707  90                   nop
1:4708  0e                   push cs
1:4709  e84efe               call 0x455a  ; _isindst@s1:455A
1:470C  83c404               add sp, 4
1:470F  0bc0                 or ax, ax
1:4711  7409                 je 0x471c
1:4713  816ee8100e           sub word ptr [bp - 0x18], 0xe10
1:4718  835eea00             sbb word ptr [bp - 0x16], 0
loc_471C:
1:471C  8b46e8               mov ax, word ptr [bp - 0x18]
1:471F  8b56ea               mov dx, word ptr [bp - 0x16]
1:4722  5e                   pop si
1:4723  5f                   pop di
1:4724  8d66fe               lea sp, [bp - 2]
1:4727  1f                   pop ds
1:4728  5d                   pop bp
1:4729  4d                   dec bp
1:472A  cb                   retf
1:472B  db 90

; ---------------- _fstrchr@s1:472C FAR size=50 callers=2
;   C runtime _fstrchr
1:472C  55                   push bp
1:472D  8bec                 mov bp, sp
1:472F  57                   push di
1:4730  c47e06               les di, ptr [bp + 6]
1:4733  8bdf                 mov bx, di
1:4735  33c0                 xor ax, ax
1:4737  b9ffff               mov cx, 0xffff
1:473A  f2ae                 repne scasb al, byte ptr es:[di]
1:473C  f7d1                 not cx
1:473E  8a460a               mov al, byte ptr [bp + 0xa]
1:4741  8bfb                 mov di, bx
1:4743  f2ae                 repne scasb al, byte ptr es:[di]
1:4745  740d                 je 0x4754
1:4747  0ac0                 or al, al
1:4749  7503                 jne 0x474e
1:474B  47                   inc di
1:474C  eb06                 jmp 0x4754
loc_474E:
1:474E  33c0                 xor ax, ax
1:4750  33d2                 xor dx, dx
1:4752  eb05                 jmp 0x4759
loc_4754:
1:4754  8d45ff               lea ax, [di - 1]
1:4757  8cc2                 mov dx, es
loc_4759:
1:4759  5f                   pop di
1:475A  8be5                 mov sp, bp
1:475C  5d                   pop bp
1:475D  cb                   retf

; ---------------- _fstricmp@s1:475E FAR size=70 callers=4
;   C runtime case-insensitive compare
1:475E  55                   push bp
1:475F  8bec                 mov bp, sp
1:4761  8bd6                 mov dx, si
1:4763  1e                   push ds
1:4764  c5760a               lds si, ptr [bp + 0xa]
1:4767  c45e06               les bx, ptr [bp + 6]
1:476A  b0ff                 mov al, 0xff
loc_476C:
1:476C  0ac0                 or al, al
1:476E  742d                 je 0x479d
1:4770  ac                   lodsb al, byte ptr [si]
1:4771  268a27               mov ah, byte ptr es:[bx]
1:4774  43                   inc bx
1:4775  3ae0                 cmp ah, al
1:4777  74f3                 je 0x476c
1:4779  2c41                 sub al, 0x41
1:477B  3c1a                 cmp al, 0x1a
1:477D  1ac9                 sbb cl, cl
1:477F  80e120               and cl, 0x20
1:4782  02c1                 add al, cl
1:4784  0441                 add al, 0x41
1:4786  86e0                 xchg al, ah
1:4788  2c41                 sub al, 0x41
1:478A  3c1a                 cmp al, 0x1a
1:478C  1ac9                 sbb cl, cl
1:478E  80e120               and cl, 0x20
1:4791  02c1                 add al, cl
1:4793  0441                 add al, 0x41
1:4795  3ac4                 cmp al, ah
1:4797  74d3                 je 0x476c
1:4799  1ac0                 sbb al, al
1:479B  1cff                 sbb al, 0xff
loc_479D:
1:479D  98                   cwde
1:479E  1f                   pop ds
1:479F  8bf2                 mov si, dx
1:47A1  5d                   pop bp
1:47A2  cb                   retf
1:47A3  db 00

; ---------------- _fstrtok@s1:47A4 FAR size=168 callers=4
;   C runtime _fstrtok
1:47A4  55                   push bp
1:47A5  8bec                 mov bp, sp
1:47A7  83ec20               sub sp, 0x20
1:47AA  56                   push si
1:47AB  57                   push di
1:47AC  16                   push ss
1:47AD  07                   pop es
1:47AE  b91000               mov cx, 0x10
1:47B1  33c0                 xor ax, ax
1:47B3  8d7ee0               lea di, [bp - 0x20]
1:47B6  f3ab                 rep stosw word ptr es:[di], ax
1:47B8  1e                   push ds
1:47B9  07                   pop es
1:47BA  c5760a               lds si, ptr [bp + 0xa]
loc_47BD:
1:47BD  ac                   lodsb al, byte ptr [si]
1:47BE  0ac0                 or al, al
1:47C0  7414                 je 0x47d6
1:47C2  8bf8                 mov di, ax
1:47C4  8bc8                 mov cx, ax
1:47C6  b001                 mov al, 1
1:47C8  80e107               and cl, 7
1:47CB  d2e0                 shl al, cl
1:47CD  b103                 mov cl, 3
1:47CF  d3ef                 shr di, cl
1:47D1  0843e0               or byte ptr [bp + di - 0x20], al
1:47D4  ebe7                 jmp 0x47bd
loc_47D6:
1:47D6  c57606               lds si, ptr [bp + 6]
1:47D9  8cd8                 mov ax, ds
1:47DB  0bc6                 or ax, si
1:47DD  7505                 jne 0x47e4
1:47DF  26c536e461           lds si, ptr es:[0x61e4]
loc_47E4:
1:47E4  ac                   lodsb al, byte ptr [si]
1:47E5  25ff00               and ax, 0xff
1:47E8  750f                 jne 0x47f9
1:47EA  4e                   dec si
1:47EB  268936e461           mov word ptr es:[0x61e4], si
1:47F0  268c1ee661           mov word ptr es:[0x61e6], ds
1:47F5  8ed8                 mov ds, ax
1:47F7  eb48                 jmp 0x4841
loc_47F9:
1:47F9  8bf8                 mov di, ax
1:47FB  8bc8                 mov cx, ax
1:47FD  b001                 mov al, 1
1:47FF  80e107               and cl, 7
1:4802  d2e0                 shl al, cl
1:4804  b103                 mov cl, 3
1:4806  d3ef                 shr di, cl
1:4808  2243e0               and al, byte ptr [bp + di - 0x20]
1:480B  75d7                 jne 0x47e4
1:480D  8d44ff               lea ax, [si - 1]
1:4810  26a3e461             mov word ptr es:[0x61e4], ax
1:4814  268c1ee661           mov word ptr es:[0x61e6], ds
loc_4819:
1:4819  ac                   lodsb al, byte ptr [si]
1:481A  25ff00               and ax, 0xff
1:481D  7505                 jne 0x4824
1:481F  8d44ff               lea ax, [si - 1]
1:4822  eb18                 jmp 0x483c
loc_4824:
1:4824  8bf8                 mov di, ax
1:4826  8bc8                 mov cx, ax
1:4828  b001                 mov al, 1
1:482A  80e107               and cl, 7
1:482D  d2e0                 shl al, cl
1:482F  b103                 mov cl, 3
1:4831  d3ef                 shr di, cl
1:4833  2243e0               and al, byte ptr [bp + di - 0x20]
1:4836  74e1                 je 0x4819
1:4838  8864ff               mov byte ptr [si - 1], ah
1:483B  96                   xchg si, ax
loc_483C:
1:483C  268706e461           xchg word ptr es:[0x61e4], ax
loc_4841:
1:4841  8cda                 mov dx, ds
1:4843  06                   push es
1:4844  1f                   pop ds
1:4845  5f                   pop di
1:4846  5e                   pop si
1:4847  8be5                 mov sp, bp
1:4849  5d                   pop bp
1:484A  cb                   retf
1:484B  db 00

; ---------------- _fmemcmp@s1:484C FAR size=92 callers=1
;   C runtime _fmemcmp
1:484C  55                   push bp
1:484D  8bec                 mov bp, sp
1:484F  33c0                 xor ax, ax
1:4851  8b4e0e               mov cx, word ptr [bp + 0xe]
1:4854  e34f                 jcxz 0x48a5
1:4856  1e                   push ds
1:4857  57                   push di
1:4858  56                   push si
1:4859  c57606               lds si, ptr [bp + 6]
1:485C  c47e0a               les di, ptr [bp + 0xa]
loc_485F:
1:485F  8bc1                 mov ax, cx
1:4861  48                   dec ax
1:4862  8bd7                 mov dx, di
1:4864  f7d2                 not dx
1:4866  2bc2                 sub ax, dx
1:4868  1bdb                 sbb bx, bx
1:486A  23c3                 and ax, bx
1:486C  03c2                 add ax, dx
1:486E  8bd6                 mov dx, si
1:4870  f7d2                 not dx
1:4872  2bc2                 sub ax, dx
1:4874  1bdb                 sbb bx, bx
1:4876  23c3                 and ax, bx
1:4878  03c2                 add ax, dx
1:487A  40                   inc ax
1:487B  91                   xchg cx, ax
1:487C  2bc1                 sub ax, cx
1:487E  f3a6                 repe cmpsb byte ptr [si], byte ptr es:[di]
1:4880  751b                 jne 0x489d
1:4882  91                   xchg cx, ax
1:4883  e31d                 jcxz 0x48a2
1:4885  0bf6                 or si, si
1:4887  7507                 jne 0x4890
1:4889  8cd8                 mov ax, ds
1:488B  05ffff               add ax, 0xffff  ; OFFSET KERNEL.__AHINCR
1:488E  8ed8                 mov ds, ax
loc_4890:
1:4890  0bff                 or di, di
1:4892  75cb                 jne 0x485f
1:4894  8cc0                 mov ax, es
1:4896  058c48               add ax, 0x488c  ; OFFSET KERNEL.__AHINCR
1:4899  8ec0                 mov es, ax
1:489B  ebc2                 jmp 0x485f
loc_489D:
1:489D  1bc0                 sbb ax, ax
1:489F  83d8ff               sbb ax, -1
loc_48A2:
1:48A2  5e                   pop si
1:48A3  5f                   pop di
1:48A4  1f                   pop ds
loc_48A5:
1:48A5  5d                   pop bp
1:48A6  cb                   retf
1:48A7  db 00

; ---------------- _fmemcpy@s1:48A8 FAR size=94 callers=7
;   C runtime _fmemcpy/_fmemmove (DIB copies)
1:48A8  55                   push bp
1:48A9  8bec                 mov bp, sp
1:48AB  8b4e0e               mov cx, word ptr [bp + 0xe]
1:48AE  1e                   push ds
1:48AF  57                   push di
1:48B0  56                   push si
1:48B1  e348                 jcxz 0x48fb
1:48B3  c5760a               lds si, ptr [bp + 0xa]
1:48B6  c47e06               les di, ptr [bp + 6]
loc_48B9:
1:48B9  8bc1                 mov ax, cx
1:48BB  48                   dec ax
1:48BC  8bd7                 mov dx, di
1:48BE  f7d2                 not dx
1:48C0  2bc2                 sub ax, dx
1:48C2  1bdb                 sbb bx, bx
1:48C4  23c3                 and ax, bx
1:48C6  03c2                 add ax, dx
1:48C8  8bd6                 mov dx, si
1:48CA  f7d2                 not dx
1:48CC  2bc2                 sub ax, dx
1:48CE  1bdb                 sbb bx, bx
1:48D0  23c3                 and ax, bx
1:48D2  03c2                 add ax, dx
1:48D4  40                   inc ax
1:48D5  91                   xchg cx, ax
1:48D6  2bc1                 sub ax, cx
1:48D8  d1e9                 shr cx, 1
1:48DA  f3a5                 rep movsw word ptr es:[di], word ptr [si]
1:48DC  13c9                 adc cx, cx
1:48DE  f3a4                 rep movsb byte ptr es:[di], byte ptr [si]
1:48E0  91                   xchg cx, ax
1:48E1  e318                 jcxz 0x48fb
1:48E3  0bf6                 or si, si
1:48E5  7507                 jne 0x48ee
1:48E7  8cd8                 mov ax, ds
1:48E9  059748               add ax, 0x4897  ; OFFSET KERNEL.__AHINCR
1:48EC  8ed8                 mov ds, ax
loc_48EE:
1:48EE  0bff                 or di, di
1:48F0  75c7                 jne 0x48b9
1:48F2  8cc0                 mov ax, es
1:48F4  05ea48               add ax, 0x48ea  ; OFFSET KERNEL.__AHINCR
1:48F7  8ec0                 mov es, ax
1:48F9  ebbe                 jmp 0x48b9
loc_48FB:
1:48FB  8b4606               mov ax, word ptr [bp + 6]
1:48FE  8b5608               mov dx, word ptr [bp + 8]
1:4901  5e                   pop si
1:4902  5f                   pop di
1:4903  1f                   pop ds
1:4904  5d                   pop bp
1:4905  cb                   retf

; ---------------- _fmemset@s1:4906 FAR size=172 callers=58
;   C runtime _fmemset
1:4906  55                   push bp
1:4907  8bec                 mov bp, sp
1:4909  8b4e0c               mov cx, word ptr [bp + 0xc]
1:490C  e338                 jcxz 0x4946
1:490E  57                   push di
1:490F  c47e06               les di, ptr [bp + 6]
1:4912  8bd7                 mov dx, di
1:4914  f7da                 neg dx
1:4916  740c                 je 0x4924
1:4918  2bd1                 sub dx, cx
1:491A  1bdb                 sbb bx, bx
1:491C  23d3                 and dx, bx
1:491E  03d1                 add dx, cx
1:4920  87d1                 xchg cx, dx
1:4922  2bd1                 sub dx, cx
loc_4924:
1:4924  8b460a               mov ax, word ptr [bp + 0xa]
1:4927  8ae0                 mov ah, al
1:4929  d1e9                 shr cx, 1
1:492B  f3ab                 rep stosw word ptr es:[di], ax
1:492D  13c9                 adc cx, cx
1:492F  f3aa                 rep stosb byte ptr es:[di], al
1:4931  87d1                 xchg cx, dx
1:4933  e310                 jcxz 0x4945
1:4935  8cc3                 mov bx, es
1:4937  81c3f548             add bx, 0x48f5  ; OFFSET KERNEL.__AHINCR
1:493B  8ec3                 mov es, bx
1:493D  d1e9                 shr cx, 1
1:493F  f3ab                 rep stosw word ptr es:[di], ax
1:4941  13c9                 adc cx, cx
1:4943  f3aa                 rep stosb byte ptr es:[di], al
loc_4945:
1:4945  5f                   pop di
loc_4946:
1:4946  8b4606               mov ax, word ptr [bp + 6]
1:4949  8b5608               mov dx, word ptr [bp + 8]
1:494C  5d                   pop bp
1:494D  cb                   retf
1:494E  db 8b 4e 0e 8b 46 06 8b 56 08 1e c5 7e 0a
loc_495B:
1:495B  57                   push di
1:495C  1e                   push ds
1:495D  07                   pop es
1:495E  fc                   cld
1:495F  93                   xchg bx, ax
1:4960  0ac0                 or al, al
1:4962  7413                 je 0x4977
1:4964  83f90a               cmp cx, 0xa
1:4967  750e                 jne 0x4977
1:4969  0bd2                 or dx, dx
1:496B  790a                 jns 0x4977
1:496D  b02d                 mov al, 0x2d
1:496F  aa                   stosb byte ptr es:[di], al
1:4970  f7db                 neg bx
1:4972  83d200               adc dx, 0
1:4975  f7da                 neg dx
loc_4977:
1:4977  8bf7                 mov si, di
loc_4979:
1:4979  92                   xchg dx, ax
1:497A  33d2                 xor dx, dx
1:497C  0bc0                 or ax, ax
1:497E  7402                 je 0x4982
1:4980  f7f1                 div cx
loc_4982:
1:4982  93                   xchg bx, ax
1:4983  f7f1                 div cx
1:4985  92                   xchg dx, ax
1:4986  87d3                 xchg bx, dx
1:4988  0430                 add al, 0x30
1:498A  3c39                 cmp al, 0x39
1:498C  7602                 jbe 0x4990
1:498E  0427                 add al, 0x27
loc_4990:
1:4990  aa                   stosb byte ptr es:[di], al
1:4991  8bc2                 mov ax, dx
1:4993  0bc3                 or ax, bx
1:4995  75e2                 jne 0x4979
1:4997  8805                 mov byte ptr [di], al
loc_4999:
1:4999  4f                   dec di
1:499A  ac                   lodsb al, byte ptr [si]
1:499B  8605                 xchg byte ptr [di], al
1:499D  8844ff               mov byte ptr [si - 1], al
1:49A0  8d4401               lea ax, [si + 1]
1:49A3  3bc7                 cmp ax, di
1:49A5  72f2                 jb 0x4999
1:49A7  8cda                 mov dx, ds
1:49A9  58                   pop ax
1:49AA  1f                   pop ds
1:49AB  5f                   pop di
1:49AC  5e                   pop si
1:49AD  8be5                 mov sp, bp
1:49AF  5d                   pop bp
1:49B0  cb                   retf
1:49B1  db 00

; ---------------- abs@s1:49B2 FAR size=20 callers=4
;   C runtime abs
1:49B2  45                   inc bp
1:49B3  55                   push bp
1:49B4  8bec                 mov bp, sp
1:49B6  1e                   push ds
1:49B7  8b4606               mov ax, word ptr [bp + 6]
1:49BA  99                   cdq
1:49BB  33c2                 xor ax, dx
1:49BD  2bc2                 sub ax, dx
1:49BF  8d66fe               lea sp, [bp - 2]
1:49C2  1f                   pop ds
1:49C3  5d                   pop bp
1:49C4  4d                   dec bp
1:49C5  cb                   retf

; ---------------- bsearch@s1:49C6 FAR size=292 callers=2
;   C runtime bsearch (SparseTable::find)
1:49C6  45                   inc bp
1:49C7  55                   push bp
1:49C8  8bec                 mov bp, sp
1:49CA  1e                   push ds
1:49CB  83ec14               sub sp, 0x14
1:49CE  57                   push di
1:49CF  56                   push si
1:49D0  8b460a               mov ax, word ptr [bp + 0xa]
1:49D3  8b560c               mov dx, word ptr [bp + 0xc]
1:49D6  8946ee               mov word ptr [bp - 0x12], ax
1:49D9  8956f0               mov word ptr [bp - 0x10], dx
1:49DC  8b4e10               mov cx, word ptr [bp + 0x10]
1:49DF  2bdb                 sub bx, bx
1:49E1  53                   push bx
1:49E2  51                   push cx
1:49E3  8b4e0e               mov cx, word ptr [bp + 0xe]
1:49E6  83e901               sub cx, 1
1:49E9  1bdb                 sbb bx, bx
1:49EB  53                   push bx
1:49EC  51                   push cx
1:49ED  90                   nop
1:49EE  0e                   push cs
1:49EF  e8cc08               call 0x52be  ; __aFlmul@s1:52BE
1:49F2  03460a               add ax, word ptr [bp + 0xa]
1:49F5  83d200               adc dx, 0
1:49F8  b93e4a               mov cx, 0x4a3e  ; OFFSET KERNEL.__AHSHIFT
1:49FB  d3e2                 shl dx, cl
1:49FD  03560c               add dx, word ptr [bp + 0xc]
1:4A00  8946fa               mov word ptr [bp - 6], ax
1:4A03  8956fc               mov word ptr [bp - 4], dx
loc_4A06:
1:4A06  8b46ee               mov ax, word ptr [bp - 0x12]
1:4A09  8b56f0               mov dx, word ptr [bp - 0x10]
1:4A0C  3956fc               cmp word ptr [bp - 4], dx
1:4A0F  7303                 jae 0x4a14
1:4A11  e9c000               jmp 0x4ad4
loc_4A14:
1:4A14  7708                 ja 0x4a1e
1:4A16  3946fa               cmp word ptr [bp - 6], ax
1:4A19  7303                 jae 0x4a1e
1:4A1B  e9b600               jmp 0x4ad4
loc_4A1E:
1:4A1E  8b460e               mov ax, word ptr [bp + 0xe]
1:4A21  d1e8                 shr ax, 1
1:4A23  8946f4               mov word ptr [bp - 0xc], ax
1:4A26  0bc0                 or ax, ax
1:4A28  7503                 jne 0x4a2d
1:4A2A  e98d00               jmp 0x4aba
loc_4A2D:
1:4A2D  f6460e01             test byte ptr [bp + 0xe], 1
1:4A31  7501                 jne 0x4a34
1:4A33  48                   dec ax
loc_4A34:
1:4A34  f76610               mul word ptr [bp + 0x10]
1:4A37  0346ee               add ax, word ptr [bp - 0x12]
1:4A3A  83d200               adc dx, 0
1:4A3D  b97e4a               mov cx, 0x4a7e  ; OFFSET KERNEL.__AHSHIFT
1:4A40  d3e2                 shl dx, cl
1:4A42  0356f0               add dx, word ptr [bp - 0x10]
1:4A45  8946f6               mov word ptr [bp - 0xa], ax
1:4A48  8956f8               mov word ptr [bp - 8], dx
1:4A4B  52                   push dx
1:4A4C  50                   push ax
1:4A4D  ff7608               push word ptr [bp + 8]
1:4A50  ff7606               push word ptr [bp + 6]
1:4A53  8bf0                 mov si, ax
1:4A55  8bfa                 mov di, dx
1:4A57  ff5e12               lcall [bp + 0x12]
1:4A5A  83c408               add sp, 8
1:4A5D  0bc0                 or ax, ax
1:4A5F  7507                 jne 0x4a68
1:4A61  8bc6                 mov ax, si
1:4A63  8bd7                 mov dx, di
1:4A65  eb79                 jmp 0x4ae0
1:4A67  db 90
loc_4A68:
1:4A68  0bc0                 or ax, ax
1:4A6A  7d30                 jge 0x4a9c
1:4A6C  8b4610               mov ax, word ptr [bp + 0x10]
1:4A6F  2bd2                 sub dx, dx
1:4A71  f7d8                 neg ax
1:4A73  13d2                 adc dx, dx
1:4A75  f7da                 neg dx
1:4A77  0346f6               add ax, word ptr [bp - 0xa]
1:4A7A  83d200               adc dx, 0
1:4A7D  b9a74a               mov cx, 0x4aa7  ; OFFSET KERNEL.__AHSHIFT
1:4A80  d3e2                 shl dx, cl
1:4A82  0356f8               add dx, word ptr [bp - 8]
1:4A85  8946fa               mov word ptr [bp - 6], ax
1:4A88  8956fc               mov word ptr [bp - 4], dx
1:4A8B  f6460e01             test byte ptr [bp + 0xe], 1
1:4A8F  7523                 jne 0x4ab4
1:4A91  8b46f4               mov ax, word ptr [bp - 0xc]
1:4A94  48                   dec ax
loc_4A95:
1:4A95  89460e               mov word ptr [bp + 0xe], ax
1:4A98  e96bff               jmp 0x4a06
1:4A9B  db 90
loc_4A9C:
1:4A9C  8b4610               mov ax, word ptr [bp + 0x10]
1:4A9F  2bd2                 sub dx, dx
1:4AA1  0346f6               add ax, word ptr [bp - 0xa]
1:4AA4  13d2                 adc dx, dx
1:4AA6  b98f41               mov cx, 0x418f  ; OFFSET KERNEL.__AHSHIFT
1:4AA9  d3e2                 shl dx, cl
1:4AAB  0356f8               add dx, word ptr [bp - 8]
1:4AAE  8946ee               mov word ptr [bp - 0x12], ax
1:4AB1  8956f0               mov word ptr [bp - 0x10], dx
loc_4AB4:
1:4AB4  8b46f4               mov ax, word ptr [bp - 0xc]
1:4AB7  ebdc                 jmp 0x4a95
1:4AB9  db 90
loc_4ABA:
1:4ABA  837e0e00             cmp word ptr [bp + 0xe], 0
1:4ABE  7414                 je 0x4ad4
1:4AC0  52                   push dx
1:4AC1  ff76ee               push word ptr [bp - 0x12]
1:4AC4  ff7608               push word ptr [bp + 8]
1:4AC7  ff7606               push word ptr [bp + 6]
1:4ACA  ff5e12               lcall [bp + 0x12]
1:4ACD  83c408               add sp, 8
1:4AD0  0bc0                 or ax, ax
1:4AD2  7406                 je 0x4ada
loc_4AD4:
1:4AD4  33c0                 xor ax, ax
1:4AD6  99                   cdq
1:4AD7  eb07                 jmp 0x4ae0
1:4AD9  db 90
loc_4ADA:
1:4ADA  8b46ee               mov ax, word ptr [bp - 0x12]
1:4ADD  8b56f0               mov dx, word ptr [bp - 0x10]
loc_4AE0:
1:4AE0  5e                   pop si
1:4AE1  5f                   pop di
1:4AE2  8d66fe               lea sp, [bp - 2]
1:4AE5  1f                   pop ds
1:4AE6  5d                   pop bp
1:4AE7  4d                   dec bp
1:4AE8  cb                   retf
1:4AE9  db 90

; ---------------- qsort@s1:4AEA FAR size=513 callers=4
;   C runtime qsort (Microsoft C, huge-pointer swap)
1:4AEA  8cd8                 mov ax, ds
1:4AEC  90                   nop
1:4AED  45                   inc bp
1:4AEE  55                   push bp
1:4AEF  8bec                 mov bp, sp
1:4AF1  1e                   push ds
1:4AF2  8ed8                 mov ds, ax
1:4AF4  56                   push si
1:4AF5  57                   push di
1:4AF6  837e0c00             cmp word ptr [bp + 0xc], 0
1:4AFA  742a                 je 0x4b26
1:4AFC  8b4e0a               mov cx, word ptr [bp + 0xa]
1:4AFF  e325                 jcxz 0x4b26
1:4B01  49                   dec cx
1:4B02  7422                 je 0x4b26
1:4B04  8b7e08               mov di, word ptr [bp + 8]
1:4B07  8b7606               mov si, word ptr [bp + 6]
loc_4B0A:
1:4B0A  51                   push cx
1:4B0B  57                   push di
1:4B0C  56                   push si
1:4B0D  03760c               add si, word ptr [bp + 0xc]
1:4B10  1bc0                 sbb ax, ax
1:4B12  253949               and ax, 0x4939  ; OFFSET KERNEL.__AHINCR
1:4B15  03f8                 add di, ax
1:4B17  57                   push di
1:4B18  56                   push si
1:4B19  ff5e0e               lcall [bp + 0xe]
1:4B1C  83c408               add sp, 8
1:4B1F  59                   pop cx
1:4B20  0bc0                 or ax, ax
1:4B22  780d                 js 0x4b31
1:4B24  e2e4                 loop 0x4b0a
loc_4B26:
1:4B26  5f                   pop di
1:4B27  5e                   pop si
1:4B28  83ed02               sub bp, 2
1:4B2B  8be5                 mov sp, bp
1:4B2D  1f                   pop ds
1:4B2E  5d                   pop bp
1:4B2F  4d                   dec bp
1:4B30  cb                   retf
loc_4B31:
1:4B31  8b460a               mov ax, word ptr [bp + 0xa]
1:4B34  48                   dec ax
1:4B35  33c9                 xor cx, cx
loc_4B37:
1:4B37  d1e8                 shr ax, 1
1:4B39  e0fc                 loopne 0x4b37
1:4B3B  f7d9                 neg cx
1:4B3D  b80800               mov ax, 8
1:4B40  f7e1                 mul cx
1:4B42  7230                 jb 0x4b74
1:4B44  8bf0                 mov si, ax
1:4B46  90                   nop
1:4B47  0e                   push cs
1:4B48  e861f0               call 0x3bac  ; _stackavail?@s1:3BAC
1:4B4B  3bc6                 cmp ax, si
1:4B4D  7225                 jb 0x4b74
1:4B4F  55                   push bp
1:4B50  8bfc                 mov di, sp
1:4B52  8b460a               mov ax, word ptr [bp + 0xa]
1:4B55  48                   dec ax
1:4B56  f7660c               mul word ptr [bp + 0xc]
1:4B59  034606               add ax, word ptr [bp + 6]
1:4B5C  83d200               adc dx, 0
1:4B5F  b9f949               mov cx, 0x49f9  ; OFFSET KERNEL.__AHSHIFT
1:4B62  d3e2                 shl dx, cl
1:4B64  035608               add dx, word ptr [bp + 8]
1:4B67  52                   push dx
1:4B68  50                   push ax
1:4B69  ff7608               push word ptr [bp + 8]
1:4B6C  ff7606               push word ptr [bp + 6]
1:4B6F  eb0c                 jmp 0x4b7d
loc_4B71:
1:4B71  5d                   pop bp
1:4B72  ebb2                 jmp 0x4b26
loc_4B74:
1:4B74  b8fcff               mov ax, 0xfffc
1:4B77  0e                   push cs
1:4B78  e877da               call 0x25f2  ; _chkstk@s1:25F2
1:4B7B  eba9                 jmp 0x4b26
loc_4B7D:
1:4B7D  3be7                 cmp sp, di
1:4B7F  73f0                 jae 0x4b71
loc_4B81:
1:4B81  8bec                 mov bp, sp
1:4B83  8b5e02               mov bx, word ptr [bp + 2]
1:4B86  8b7600               mov si, word ptr [bp]
1:4B89  3b5e06               cmp bx, word ptr [bp + 6]
1:4B8C  720c                 jb 0x4b9a
1:4B8E  7705                 ja 0x4b95
1:4B90  3b7604               cmp si, word ptr [bp + 4]
1:4B93  7205                 jb 0x4b9a
loc_4B95:
1:4B95  83c408               add sp, 8
1:4B98  ebe3                 jmp 0x4b7d
loc_4B9A:
1:4B9A  83ec08               sub sp, 8
1:4B9D  8b4e06               mov cx, word ptr [bp + 6]
1:4BA0  8b5604               mov dx, word ptr [bp + 4]
1:4BA3  894efe               mov word ptr [bp - 2], cx
1:4BA6  8956fc               mov word ptr [bp - 4], dx
1:4BA9  36035514             add dx, word ptr ss:[di + 0x14]
1:4BAD  1bc0                 sbb ax, ax
1:4BAF  25134b               and ax, 0x4b13  ; OFFSET KERNEL.__AHINCR
1:4BB2  03c8                 add cx, ax
1:4BB4  895efa               mov word ptr [bp - 6], bx
1:4BB7  8976f8               mov word ptr [bp - 8], si
loc_4BBA:
1:4BBA  51                   push cx
1:4BBB  52                   push dx
loc_4BBC:
1:4BBC  36037514             add si, word ptr ss:[di + 0x14]
1:4BC0  1bc0                 sbb ax, ax
1:4BC2  25b04b               and ax, 0x4bb0  ; OFFSET KERNEL.__AHINCR
1:4BC5  03d8                 add bx, ax
1:4BC7  3b7604               cmp si, word ptr [bp + 4]
1:4BCA  7505                 jne 0x4bd1
1:4BCC  3b5e06               cmp bx, word ptr [bp + 6]
1:4BCF  741f                 je 0x4bf0
loc_4BD1:
1:4BD1  53                   push bx
1:4BD2  ff7602               push word ptr [bp + 2]
1:4BD5  ff7600               push word ptr [bp]
1:4BD8  53                   push bx
1:4BD9  56                   push si
1:4BDA  36ff5d16             lcall ss:[di + 0x16]
1:4BDE  83c408               add sp, 8
1:4BE1  5b                   pop bx
1:4BE2  0bc0                 or ax, ax
1:4BE4  7f0a                 jg 0x4bf0
1:4BE6  74d4                 je 0x4bbc
1:4BE8  895efa               mov word ptr [bp - 6], bx
1:4BEB  8976f8               mov word ptr [bp - 8], si
1:4BEE  ebcc                 jmp 0x4bbc
loc_4BF0:
1:4BF0  5a                   pop dx
1:4BF1  59                   pop cx
1:4BF2  53                   push bx
1:4BF3  56                   push si
1:4BF4  8bf2                 mov si, dx
loc_4BF6:
1:4BF6  362b7514             sub si, word ptr ss:[di + 0x14]
1:4BFA  1bc0                 sbb ax, ax
1:4BFC  25c34b               and ax, 0x4bc3  ; OFFSET KERNEL.__AHINCR
1:4BFF  2bc8                 sub cx, ax
1:4C01  51                   push cx
1:4C02  51                   push cx
1:4C03  56                   push si
1:4C04  ff7602               push word ptr [bp + 2]
1:4C07  ff7600               push word ptr [bp]
1:4C0A  36ff5d16             lcall ss:[di + 0x16]
1:4C0E  83c408               add sp, 8
1:4C11  59                   pop cx
1:4C12  0bc0                 or ax, ax
1:4C14  7f14                 jg 0x4c2a
1:4C16  7408                 je 0x4c20
1:4C18  894efe               mov word ptr [bp - 2], cx
1:4C1B  8976fc               mov word ptr [bp - 4], si
1:4C1E  ebd6                 jmp 0x4bf6
loc_4C20:
1:4C20  3b7600               cmp si, word ptr [bp]
1:4C23  75d1                 jne 0x4bf6
1:4C25  3b4e02               cmp cx, word ptr [bp + 2]
1:4C28  75cc                 jne 0x4bf6
loc_4C2A:
1:4C2A  8bd6                 mov dx, si
1:4C2C  5e                   pop si
1:4C2D  5b                   pop bx
1:4C2E  3bcb                 cmp cx, bx
1:4C30  7226                 jb 0x4c58
1:4C32  7704                 ja 0x4c38
1:4C34  3bd6                 cmp dx, si
1:4C36  7620                 jbe 0x4c58
loc_4C38:
1:4C38  1e                   push ds
1:4C39  8edb                 mov ds, bx
1:4C3B  8ec1                 mov es, cx
1:4C3D  368b4514             mov ax, word ptr ss:[di + 0x14]
1:4C41  87fa                 xchg dx, di
1:4C43  e8a500               call 0x4ceb  ; qsort_swap@s1:4CEB
1:4C46  87fa                 xchg dx, di
1:4C48  1f                   pop ds
1:4C49  894efe               mov word ptr [bp - 2], cx
1:4C4C  8956fc               mov word ptr [bp - 4], dx
1:4C4F  895efa               mov word ptr [bp - 6], bx
1:4C52  8976f8               mov word ptr [bp - 8], si
1:4C55  e962ff               jmp 0x4bba
loc_4C58:
1:4C58  368b4514             mov ax, word ptr ss:[di + 0x14]
1:4C5C  8ec1                 mov es, cx
1:4C5E  87fa                 xchg dx, di
1:4C60  1e                   push ds
1:4C61  56                   push si
1:4C62  c57600               lds si, ptr [bp]
1:4C65  e88300               call 0x4ceb  ; qsort_swap@s1:4CEB
1:4C68  5e                   pop si
1:4C69  1f                   pop ds
1:4C6A  87fa                 xchg dx, di
1:4C6C  8b7604               mov si, word ptr [bp + 4]
1:4C6F  8b5e06               mov bx, word ptr [bp + 6]
1:4C72  2b76fc               sub si, word ptr [bp - 4]
1:4C75  1bc0                 sbb ax, ax
1:4C77  25fd4b               and ax, 0x4bfd  ; OFFSET KERNEL.__AHINCR
1:4C7A  2bd8                 sub bx, ax
1:4C7C  2b5efe               sub bx, word ptr [bp - 2]
1:4C7F  037600               add si, word ptr [bp]
1:4C82  1bc0                 sbb ax, ax
1:4C84  25784c               and ax, 0x4c78  ; OFFSET KERNEL.__AHINCR
1:4C87  03d8                 add bx, ax
1:4C89  035e02               add bx, word ptr [bp + 2]
1:4C8C  2b76f8               sub si, word ptr [bp - 8]
1:4C8F  1bc0                 sbb ax, ax
1:4C91  25854c               and ax, 0x4c85  ; OFFSET KERNEL.__AHINCR
1:4C94  2bd8                 sub bx, ax
1:4C96  722c                 jb 0x4cc4
1:4C98  2b5efa               sub bx, word ptr [bp - 6]
1:4C9B  7227                 jb 0x4cc4
1:4C9D  8b5e02               mov bx, word ptr [bp + 2]
1:4CA0  8b4e00               mov cx, word ptr [bp]
1:4CA3  8b46fe               mov ax, word ptr [bp - 2]
1:4CA6  894602               mov word ptr [bp + 2], ax
1:4CA9  8b46fc               mov ax, word ptr [bp - 4]
1:4CAC  894600               mov word ptr [bp], ax
1:4CAF  8b46fa               mov ax, word ptr [bp - 6]
1:4CB2  8946fe               mov word ptr [bp - 2], ax
1:4CB5  8b46f8               mov ax, word ptr [bp - 8]
1:4CB8  8946fc               mov word ptr [bp - 4], ax
1:4CBB  895efa               mov word ptr [bp - 6], bx
1:4CBE  894ef8               mov word ptr [bp - 8], cx
1:4CC1  e9bdfe               jmp 0x4b81
loc_4CC4:
1:4CC4  8b5e06               mov bx, word ptr [bp + 6]
1:4CC7  8b4e04               mov cx, word ptr [bp + 4]
1:4CCA  8b46fa               mov ax, word ptr [bp - 6]
1:4CCD  894606               mov word ptr [bp + 6], ax
1:4CD0  8b46f8               mov ax, word ptr [bp - 8]
1:4CD3  894604               mov word ptr [bp + 4], ax
1:4CD6  8b46fe               mov ax, word ptr [bp - 2]
1:4CD9  8946fa               mov word ptr [bp - 6], ax
1:4CDC  8b46fc               mov ax, word ptr [bp - 4]
1:4CDF  8946f8               mov word ptr [bp - 8], ax
1:4CE2  895efe               mov word ptr [bp - 2], bx
1:4CE5  894efc               mov word ptr [bp - 4], cx
1:4CE8  e996fe               jmp 0x4b81

; ---------------- qsort_swap@s1:4CEB size=33 callers=1
;   qsort helper: swaps two elements
1:4CEB  53                   push bx
1:4CEC  8bd8                 mov bx, ax
1:4CEE  f7c30100             test bx, 1
1:4CF2  740a                 je 0x4cfe
1:4CF4  4b                   dec bx
1:4CF5  8a00                 mov al, byte ptr [bx + si]
1:4CF7  268601               xchg byte ptr es:[bx + di], al
1:4CFA  8800                 mov byte ptr [bx + si], al
1:4CFC  740c                 je 0x4d0a
loc_4CFE:
1:4CFE  83eb02               sub bx, 2
1:4D01  8b00                 mov ax, word ptr [bx + si]
1:4D03  268701               xchg word ptr es:[bx + di], ax
1:4D06  8900                 mov word ptr [bx + si], ax
1:4D08  75f4                 jne 0x4cfe
loc_4D0A:
1:4D0A  5b                   pop bx
1:4D0B  c3                   ret

; ---------------- srand@s1:4D0C FAR size=24 callers=1
;   C runtime srand
1:4D0C  45                   inc bp
1:4D0D  55                   push bp
1:4D0E  8bec                 mov bp, sp
1:4D10  1e                   push ds
1:4D11  8b4606               mov ax, word ptr [bp + 6]
1:4D14  a3e861               mov word ptr [0x61e8], ax
1:4D17  c706ea610000         mov word ptr [0x61ea], 0
1:4D1D  8d66fe               lea sp, [bp - 2]
1:4D20  1f                   pop ds
1:4D21  5d                   pop bp
1:4D22  4d                   dec bp
1:4D23  cb                   retf

; ---------------- rand@s1:4D24 FAR size=52 callers=1
;   C runtime rand (seed*0x343FD+0x269EC3)
1:4D24  45                   inc bp
1:4D25  55                   push bp
1:4D26  8bec                 mov bp, sp
1:4D28  1e                   push ds
1:4D29  b8fd43               mov ax, 0x43fd
1:4D2C  ba0300               mov dx, 3
1:4D2F  52                   push dx
1:4D30  50                   push ax
1:4D31  ff36ea61             push word ptr [0x61ea]
1:4D35  ff36e861             push word ptr [0x61e8]
1:4D39  90                   nop
1:4D3A  0e                   push cs
1:4D3B  e88005               call 0x52be  ; __aFlmul@s1:52BE
1:4D3E  05c39e               add ax, 0x9ec3
1:4D41  83d226               adc dx, 0x26
1:4D44  a3e861               mov word ptr [0x61e8], ax
1:4D47  8916ea61             mov word ptr [0x61ea], dx
1:4D4B  8bc2                 mov ax, dx
1:4D4D  80e47f               and ah, 0x7f
1:4D50  8d66fe               lea sp, [bp - 2]
1:4D53  1f                   pop ds
1:4D54  5d                   pop bp
1:4D55  4d                   dec bp
1:4D56  cb                   retf
1:4D57  db 90

; ---------------- _splitpath@s1:4D58 FAR size=450 callers=6
;   C runtime _splitpath
1:4D58  45                   inc bp
1:4D59  55                   push bp
1:4D5A  8bec                 mov bp, sp
1:4D5C  1e                   push ds
1:4D5D  83ec0e               sub sp, 0xe
1:4D60  56                   push si
1:4D61  2bc0                 sub ax, ax
1:4D63  8946fc               mov word ptr [bp - 4], ax
1:4D66  8946fa               mov word ptr [bp - 6], ax
1:4D69  8946f8               mov word ptr [bp - 8], ax
1:4D6C  8946f6               mov word ptr [bp - 0xa], ax
1:4D6F  c45e06               les bx, ptr [bp + 6]
1:4D72  263807               cmp byte ptr es:[bx], al
1:4D75  7431                 je 0x4da8
1:4D77  26807f013a           cmp byte ptr es:[bx + 1], 0x3a
1:4D7C  752a                 jne 0x4da8
1:4D7E  8b460c               mov ax, word ptr [bp + 0xc]
1:4D81  0b460a               or ax, word ptr [bp + 0xa]
1:4D84  741c                 je 0x4da2
1:4D86  268a07               mov al, byte ptr es:[bx]
1:4D89  c45e0a               les bx, ptr [bp + 0xa]
1:4D8C  268807               mov byte ptr es:[bx], al
1:4D8F  c45e06               les bx, ptr [bp + 6]
1:4D92  268a4701             mov al, byte ptr es:[bx + 1]
1:4D96  c45e0a               les bx, ptr [bp + 0xa]
1:4D99  26884701             mov byte ptr es:[bx + 1], al
1:4D9D  26c6470200           mov byte ptr es:[bx + 2], 0
loc_4DA2:
1:4DA2  83460602             add word ptr [bp + 6], 2
1:4DA6  eb0f                 jmp 0x4db7
loc_4DA8:
1:4DA8  8b460c               mov ax, word ptr [bp + 0xc]
1:4DAB  0b460a               or ax, word ptr [bp + 0xa]
1:4DAE  7407                 je 0x4db7
1:4DB0  c45e0a               les bx, ptr [bp + 0xa]
1:4DB3  26c60700             mov byte ptr es:[bx], 0
loc_4DB7:
1:4DB7  2bc0                 sub ax, ax
1:4DB9  8946fc               mov word ptr [bp - 4], ax
1:4DBC  8946fa               mov word ptr [bp - 6], ax
1:4DBF  8b4606               mov ax, word ptr [bp + 6]
1:4DC2  8b5608               mov dx, word ptr [bp + 8]
1:4DC5  8946f0               mov word ptr [bp - 0x10], ax
1:4DC8  8956f2               mov word ptr [bp - 0xe], dx
1:4DCB  eb10                 jmp 0x4ddd
1:4DCD  db 90
loc_4DCE:
1:4DCE  26803f2e             cmp byte ptr es:[bx], 0x2e
1:4DD2  7506                 jne 0x4dda
1:4DD4  895ef6               mov word ptr [bp - 0xa], bx
1:4DD7  8c46f8               mov word ptr [bp - 8], es
loc_4DDA:
1:4DDA  ff46f0               inc word ptr [bp - 0x10]
loc_4DDD:
1:4DDD  c45ef0               les bx, ptr [bp - 0x10]
1:4DE0  26803f00             cmp byte ptr es:[bx], 0
1:4DE4  7418                 je 0x4dfe
1:4DE6  26803f2f             cmp byte ptr es:[bx], 0x2f
1:4DEA  7406                 je 0x4df2
1:4DEC  26803f5c             cmp byte ptr es:[bx], 0x5c
1:4DF0  75dc                 jne 0x4dce
loc_4DF2:
1:4DF2  8bc3                 mov ax, bx
1:4DF4  40                   inc ax
1:4DF5  8946fa               mov word ptr [bp - 6], ax
1:4DF8  8c46fc               mov word ptr [bp - 4], es
1:4DFB  ebdd                 jmp 0x4dda
1:4DFD  db 90
loc_4DFE:
1:4DFE  8b46fc               mov ax, word ptr [bp - 4]
1:4E01  0b46fa               or ax, word ptr [bp - 6]
1:4E04  7442                 je 0x4e48
1:4E06  8b4610               mov ax, word ptr [bp + 0x10]
1:4E09  0b460e               or ax, word ptr [bp + 0xe]
1:4E0C  742c                 je 0x4e3a
1:4E0E  8b46fa               mov ax, word ptr [bp - 6]
1:4E11  2b4606               sub ax, word ptr [bp + 6]
1:4E14  3dff00               cmp ax, 0xff
1:4E17  7e03                 jle 0x4e1c
1:4E19  b8ff00               mov ax, 0xff
loc_4E1C:
1:4E1C  50                   push ax
1:4E1D  ff7608               push word ptr [bp + 8]
1:4E20  ff7606               push word ptr [bp + 6]
1:4E23  ff7610               push word ptr [bp + 0x10]
1:4E26  ff760e               push word ptr [bp + 0xe]
1:4E29  8bf0                 mov si, ax
1:4E2B  90                   nop
1:4E2C  0e                   push cs
1:4E2D  e88eef               call 0x3dbe  ; _fstrncpy@s1:3DBE
1:4E30  83c40a               add sp, 0xa
1:4E33  c45e0e               les bx, ptr [bp + 0xe]
1:4E36  26c60000             mov byte ptr es:[bx + si], 0
loc_4E3A:
1:4E3A  8b46fa               mov ax, word ptr [bp - 6]
1:4E3D  8b56fc               mov dx, word ptr [bp - 4]
1:4E40  894606               mov word ptr [bp + 6], ax
1:4E43  895608               mov word ptr [bp + 8], dx
1:4E46  eb0f                 jmp 0x4e57
loc_4E48:
1:4E48  8b4610               mov ax, word ptr [bp + 0x10]
1:4E4B  0b460e               or ax, word ptr [bp + 0xe]
1:4E4E  7407                 je 0x4e57
1:4E50  c45e0e               les bx, ptr [bp + 0xe]
1:4E53  26c60700             mov byte ptr es:[bx], 0
loc_4E57:
1:4E57  8b46f8               mov ax, word ptr [bp - 8]
1:4E5A  0b46f6               or ax, word ptr [bp - 0xa]
1:4E5D  746f                 je 0x4ece
1:4E5F  8b46f6               mov ax, word ptr [bp - 0xa]
1:4E62  8b4e06               mov cx, word ptr [bp + 6]
1:4E65  3bc1                 cmp ax, cx
1:4E67  7265                 jb 0x4ece
1:4E69  8b5614               mov dx, word ptr [bp + 0x14]
1:4E6C  0b5612               or dx, word ptr [bp + 0x12]
1:4E6F  7426                 je 0x4e97
1:4E71  2bc1                 sub ax, cx
1:4E73  3dff00               cmp ax, 0xff
1:4E76  7e03                 jle 0x4e7b
1:4E78  b8ff00               mov ax, 0xff
loc_4E7B:
1:4E7B  50                   push ax
1:4E7C  ff7608               push word ptr [bp + 8]
1:4E7F  51                   push cx
1:4E80  ff7614               push word ptr [bp + 0x14]
1:4E83  ff7612               push word ptr [bp + 0x12]
1:4E86  8bf0                 mov si, ax
1:4E88  90                   nop
1:4E89  0e                   push cs
1:4E8A  e831ef               call 0x3dbe  ; _fstrncpy@s1:3DBE
1:4E8D  83c40a               add sp, 0xa
1:4E90  c45e12               les bx, ptr [bp + 0x12]
1:4E93  26c60000             mov byte ptr es:[bx + si], 0
loc_4E97:
1:4E97  8b4618               mov ax, word ptr [bp + 0x18]
1:4E9A  0b4616               or ax, word ptr [bp + 0x16]
1:4E9D  7472                 je 0x4f11
1:4E9F  8b46f0               mov ax, word ptr [bp - 0x10]
1:4EA2  2b46f6               sub ax, word ptr [bp - 0xa]
1:4EA5  3dff00               cmp ax, 0xff
1:4EA8  7e03                 jle 0x4ead
1:4EAA  b8ff00               mov ax, 0xff
loc_4EAD:
1:4EAD  50                   push ax
1:4EAE  ff76f8               push word ptr [bp - 8]
1:4EB1  ff76f6               push word ptr [bp - 0xa]
1:4EB4  ff7618               push word ptr [bp + 0x18]
1:4EB7  ff7616               push word ptr [bp + 0x16]
1:4EBA  8bf0                 mov si, ax
1:4EBC  90                   nop
1:4EBD  0e                   push cs
1:4EBE  e8fdee               call 0x3dbe  ; _fstrncpy@s1:3DBE
1:4EC1  83c40a               add sp, 0xa
1:4EC4  c45e16               les bx, ptr [bp + 0x16]
1:4EC7  26c60000             mov byte ptr es:[bx + si], 0
1:4ECB  eb44                 jmp 0x4f11
1:4ECD  db 90
loc_4ECE:
1:4ECE  8b4614               mov ax, word ptr [bp + 0x14]
1:4ED1  0b4612               or ax, word ptr [bp + 0x12]
1:4ED4  742c                 je 0x4f02
1:4ED6  8b46f0               mov ax, word ptr [bp - 0x10]
1:4ED9  2b4606               sub ax, word ptr [bp + 6]
1:4EDC  3dff00               cmp ax, 0xff
1:4EDF  7e03                 jle 0x4ee4
1:4EE1  b8ff00               mov ax, 0xff
loc_4EE4:
1:4EE4  50                   push ax
1:4EE5  ff7608               push word ptr [bp + 8]
1:4EE8  ff7606               push word ptr [bp + 6]
1:4EEB  ff7614               push word ptr [bp + 0x14]
1:4EEE  ff7612               push word ptr [bp + 0x12]
1:4EF1  8bf0                 mov si, ax
1:4EF3  90                   nop
1:4EF4  0e                   push cs
1:4EF5  e8c6ee               call 0x3dbe  ; _fstrncpy@s1:3DBE
1:4EF8  83c40a               add sp, 0xa
1:4EFB  c45e12               les bx, ptr [bp + 0x12]
1:4EFE  26c60000             mov byte ptr es:[bx + si], 0
loc_4F02:
1:4F02  8b4618               mov ax, word ptr [bp + 0x18]
1:4F05  0b4616               or ax, word ptr [bp + 0x16]
1:4F08  7407                 je 0x4f11
1:4F0A  c45e16               les bx, ptr [bp + 0x16]
1:4F0D  26c60700             mov byte ptr es:[bx], 0
loc_4F11:
1:4F11  5e                   pop si
1:4F12  8d66fe               lea sp, [bp - 2]
1:4F15  1f                   pop ds
1:4F16  5d                   pop bp
1:4F17  4d                   dec bp
1:4F18  cb                   retf
1:4F19  db 90

; ---------------- _purecall@s1:4F1A FAR size=20 callers=0
;   C++ pure virtual call -> run-time error R6025
1:4F1A  b81900               mov ax, 0x19
1:4F1D  e97ad9               jmp 0x289a
1:4F20  db 8c d8 90 45 55 8b ec 1e 8e d8 b4 39 eb 0c

; ---------------- _chdir@s1:4F2E FAR size=102 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime _chdir (file dialog)
1:4F2E  8cd8                 mov ax, ds
1:4F30  90                   nop
1:4F31  45                   inc bp
1:4F32  55                   push bp
1:4F33  8bec                 mov bp, sp
1:4F35  1e                   push ds
1:4F36  8ed8                 mov ds, ax
1:4F38  b43b                 mov ah, 0x3b
1:4F3A  1e                   push ds
1:4F3B  c55606               lds dx, ptr [bp + 6]
1:4F3E  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:4F45  7407                 je 0x4f4e
1:4F47  9aab430000           lcall 0, 0x43ab  ; KERNEL.DOS3Call
1:4F4C  eb02                 jmp 0x4f50
loc_4F4E:
1:4F4E  cd21                 int 0x21
loc_4F50:
1:4F50  1f                   pop ds
1:4F51  e92ada               jmp 0x297e
1:4F54  db 8c d8 90 45 55 8b ec 1e 8e d8 b4 3a 1e c5 56 06
1:4F64  db 2e f7 06 f6 22 01 00 74 07 9a 48 4f 00 00 eb 02
1:4F74  db cd 21 73 d8 83 f8 10 75 d3 92 93 8a 07 43 3c 00
1:4F84  db 74 0a 3c 3f 74 04 3c 2a 75 f1 b2 03 92 f9 eb bc

; ---------------- _getcurdir@s1:4F94 FAR size=42 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime: DOS 47h current directory
1:4F94  8cd8                 mov ax, ds
1:4F96  90                   nop
1:4F97  45                   inc bp
1:4F98  55                   push bp
1:4F99  8bec                 mov bp, sp
1:4F9B  1e                   push ds
1:4F9C  8ed8                 mov ds, ax
1:4F9E  b419                 mov ah, 0x19
1:4FA0  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:4FA7  7407                 je 0x4fb0
1:4FA9  9a6e4f0000           lcall 0, 0x4f6e  ; KERNEL.DOS3Call
1:4FAE  eb02                 jmp 0x4fb2
loc_4FB0:
1:4FB0  cd21                 int 0x21
loc_4FB2:
1:4FB2  b400                 mov ah, 0
1:4FB4  40                   inc ax
1:4FB5  83ed02               sub bp, 2
1:4FB8  8be5                 mov sp, bp
1:4FBA  1f                   pop ds
1:4FBB  5d                   pop bp
1:4FBC  4d                   dec bp
1:4FBD  cb                   retf

; ---------------- _chdrive@s1:4FBE FAR size=74 callers=0
;   apis: KERNEL.DOS3Call
;   C runtime _chdrive (DOS 0Eh/19h)
1:4FBE  8cd8                 mov ax, ds
1:4FC0  90                   nop
1:4FC1  45                   inc bp
1:4FC2  55                   push bp
1:4FC3  8bec                 mov bp, sp
1:4FC5  1e                   push ds
1:4FC6  8ed8                 mov ds, ax
1:4FC8  8a5606               mov dl, byte ptr [bp + 6]
1:4FCB  4a                   dec dx
1:4FCC  b40e                 mov ah, 0xe
1:4FCE  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:4FD5  7407                 je 0x4fde
1:4FD7  9aaa4f0000           lcall 0, 0x4faa  ; KERNEL.DOS3Call
1:4FDC  eb02                 jmp 0x4fe0
loc_4FDE:
1:4FDE  cd21                 int 0x21
loc_4FE0:
1:4FE0  b419                 mov ah, 0x19
1:4FE2  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:4FE9  7407                 je 0x4ff2
1:4FEB  9ad84f0000           lcall 0, 0x4fd8  ; KERNEL.DOS3Call
1:4FF0  eb02                 jmp 0x4ff4
loc_4FF2:
1:4FF2  cd21                 int 0x21
loc_4FF4:
1:4FF4  40                   inc ax
1:4FF5  3a4606               cmp al, byte ptr [bp + 6]
1:4FF8  b8ffff               mov ax, 0xffff
1:4FFB  7501                 jne 0x4ffe
1:4FFD  40                   inc ax
loc_4FFE:
1:4FFE  83ed02               sub bp, 2
1:5001  8be5                 mov sp, bp
1:5003  1f                   pop ds
1:5004  5d                   pop bp
1:5005  4d                   dec bp
1:5006  cb                   retf
1:5007  db 00

; ---------------- _getcwd@s1:5008 FAR size=30 callers=2
;   C runtime _getcwd
1:5008  45                   inc bp
1:5009  55                   push bp
1:500A  8bec                 mov bp, sp
1:500C  1e                   push ds
1:500D  ff760a               push word ptr [bp + 0xa]
1:5010  ff7608               push word ptr [bp + 8]
1:5013  ff7606               push word ptr [bp + 6]
1:5016  33c0                 xor ax, ax
1:5018  50                   push ax
1:5019  90                   nop
1:501A  0e                   push cs
1:501B  e80800               call 0x5026  ; _getdcwd@s1:5026
1:501E  8d66fe               lea sp, [bp - 2]
1:5021  1f                   pop ds
1:5022  5d                   pop bp
1:5023  4d                   dec bp
1:5024  cb                   retf
1:5025  db 90

; ---------------- _getdcwd@s1:5026 FAR size=296 callers=1
;   C runtime _getdcwd
1:5026  45                   inc bp
1:5027  55                   push bp
1:5028  8bec                 mov bp, sp
1:502A  1e                   push ds
1:502B  81ec2e01             sub sp, 0x12e
1:502F  56                   push si
1:5030  8b760c               mov si, word ptr [bp + 0xc]
1:5033  8d86fafe             lea ax, [bp - 0x106]
1:5037  8986d2fe             mov word ptr [bp - 0x12e], ax
1:503B  8c96d4fe             mov word ptr [bp - 0x12c], ss
1:503F  837e0600             cmp word ptr [bp + 6], 0
1:5043  7508                 jne 0x504d
1:5045  90                   nop
1:5046  0e                   push cs
1:5047  e84aff               call 0x4f94  ; _getcurdir@s1:4F94
1:504A  894606               mov word ptr [bp + 6], ax
loc_504D:
1:504D  8a4606               mov al, byte ptr [bp + 6]
1:5050  0440                 add al, 0x40
1:5052  c49ed2fe             les bx, ptr [bp - 0x12e]
1:5056  ff86d2fe             inc word ptr [bp - 0x12e]
1:505A  268807               mov byte ptr es:[bx], al
1:505D  8b9ed2fe             mov bx, word ptr [bp - 0x12e]
1:5061  ff86d2fe             inc word ptr [bp - 0x12e]
1:5065  26c6073a             mov byte ptr es:[bx], 0x3a
1:5069  8b9ed2fe             mov bx, word ptr [bp - 0x12e]
1:506D  ff86d2fe             inc word ptr [bp - 0x12e]
1:5071  26c6075c             mov byte ptr es:[bx], 0x5c
1:5075  c686edfe47           mov byte ptr [bp - 0x113], 0x47
1:507A  8a4606               mov al, byte ptr [bp + 6]
1:507D  8886f2fe             mov byte ptr [bp - 0x10e], al
1:5081  8c86d6fe             mov word ptr [bp - 0x12a], es
1:5085  8c86dcfe             mov word ptr [bp - 0x124], es
1:5089  8b86d2fe             mov ax, word ptr [bp - 0x12e]
1:508D  8986f4fe             mov word ptr [bp - 0x10c], ax
1:5091  8d86d6fe             lea ax, [bp - 0x12a]
1:5095  16                   push ss
1:5096  50                   push ax
1:5097  8d86defe             lea ax, [bp - 0x122]
1:509B  16                   push ss
1:509C  50                   push ax
1:509D  8d86ecfe             lea ax, [bp - 0x114]
1:50A1  16                   push ss
1:50A2  50                   push ax
1:50A3  90                   nop
1:50A4  0e                   push cs
1:50A5  e836f2               call 0x42de  ; _validdrive?@s1:42DE
1:50A8  83c40c               add sp, 0xc
1:50AB  83beeafe00           cmp word ptr [bp - 0x116], 0
1:50B0  7416                 je 0x50c8
1:50B2  c706785f0d00         mov word ptr [0x5f78], 0xd
1:50B8  8b86defe             mov ax, word ptr [bp - 0x122]
1:50BC  a3885f               mov word ptr [0x5f88], ax
loc_50BF:
1:50BF  33c0                 xor ax, ax
1:50C1  99                   cdq
1:50C2  e98100               jmp 0x5146
1:50C5  db 90 90 90
loc_50C8:
1:50C8  8d86fafe             lea ax, [bp - 0x106]
1:50CC  16                   push ss
1:50CD  50                   push ax
1:50CE  90                   nop
1:50CF  0e                   push cs
1:50D0  e8d1ec               call 0x3da4  ; _fstrlen@s1:3DA4
1:50D3  83c404               add sp, 4
1:50D6  40                   inc ax
1:50D7  8986d0fe             mov word ptr [bp - 0x130], ax
1:50DB  8b4608               mov ax, word ptr [bp + 8]
1:50DE  8b560a               mov dx, word ptr [bp + 0xa]
1:50E1  8986d2fe             mov word ptr [bp - 0x12e], ax
1:50E5  8996d4fe             mov word ptr [bp - 0x12c], dx
1:50E9  0bd0                 or dx, ax
1:50EB  7535                 jne 0x5122
1:50ED  39b6d0fe             cmp word ptr [bp - 0x130], si
1:50F1  7e04                 jle 0x50f7
1:50F3  8bb6d0fe             mov si, word ptr [bp - 0x130]
loc_50F7:
1:50F7  56                   push si
1:50F8  90                   nop
1:50F9  0e                   push cs
1:50FA  e87dc5               call 0x167a  ; _fmalloc@s1:167A
1:50FD  83c402               add sp, 2
1:5100  8986d2fe             mov word ptr [bp - 0x12e], ax
1:5104  8996d4fe             mov word ptr [bp - 0x12c], dx
1:5108  0bd0                 or dx, ax
1:510A  750c                 jne 0x5118
1:510C  c706785f0c00         mov word ptr [0x5f78], 0xc
1:5112  8b96d4fe             mov dx, word ptr [bp - 0x12c]
1:5116  eb2e                 jmp 0x5146
loc_5118:
1:5118  8b96d4fe             mov dx, word ptr [bp - 0x12c]
1:511C  894608               mov word ptr [bp + 8], ax
1:511F  89560a               mov word ptr [bp + 0xa], dx
loc_5122:
1:5122  39b6d0fe             cmp word ptr [bp - 0x130], si
1:5126  7e08                 jle 0x5130
1:5128  c706785f2200         mov word ptr [0x5f78], 0x22
1:512E  eb8f                 jmp 0x50bf
loc_5130:
1:5130  8d86fafe             lea ax, [bp - 0x106]
1:5134  16                   push ss
1:5135  50                   push ax
1:5136  ffb6d4fe             push word ptr [bp - 0x12c]
1:513A  ffb6d2fe             push word ptr [bp - 0x12e]
1:513E  90                   nop
1:513F  0e                   push cs
1:5140  e8fbeb               call 0x3d3e  ; _fstrcpy@s1:3D3E
1:5143  83c408               add sp, 8
loc_5146:
1:5146  5e                   pop si
1:5147  8d66fe               lea sp, [bp - 2]
1:514A  1f                   pop ds
1:514B  5d                   pop bp
1:514C  4d                   dec bp
1:514D  cb                   retf

; ---------------- remove@s1:514E FAR size=38 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime remove (DOS 41h)
1:514E  8cd8                 mov ax, ds
1:5150  90                   nop
1:5151  45                   inc bp
1:5152  55                   push bp
1:5153  8bec                 mov bp, sp
1:5155  1e                   push ds
1:5156  8ed8                 mov ds, ax
1:5158  1e                   push ds
1:5159  c55606               lds dx, ptr [bp + 6]
1:515C  b441                 mov ah, 0x41
1:515E  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:5165  7407                 je 0x516e
1:5167  9aec4f0000           lcall 0, 0x4fec  ; KERNEL.DOS3Call
1:516C  eb02                 jmp 0x5170
loc_516E:
1:516E  cd21                 int 0x21
loc_5170:
1:5170  1f                   pop ds
1:5171  e90ad8               jmp 0x297e

; ---------------- _commit@s1:5174 FAR size=54 callers=1
;   apis: KERNEL.DOS3Call
;   C runtime _commit (DOS 68h)
1:5174  8cd8                 mov ax, ds
1:5176  90                   nop
1:5177  45                   inc bp
1:5178  55                   push bp
1:5179  8bec                 mov bp, sp
1:517B  1e                   push ds
1:517C  8ed8                 mov ds, ax
1:517E  8b5e06               mov bx, word ptr [bp + 6]
1:5181  b468                 mov ah, 0x68
1:5183  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:518A  7407                 je 0x5193
1:518C  9a68510000           lcall 0, 0x5168  ; KERNEL.DOS3Call
1:5191  eb02                 jmp 0x5195
loc_5193:
1:5193  cd21                 int 0x21
loc_5195:
1:5195  e9f3d7               jmp 0x298b
1:5198  db 8c d8 90 45 55 8b ec 1e 8e d8 1e b0 4f c5 56 06
1:51A8  db eb 10

; ---------------- _stat?@s1:51AA FAR size=122 callers=4
;   apis: KERNEL.DOS3Call
;   C runtime file status (DOS find/attributes)
1:51AA  8cd8                 mov ax, ds
1:51AC  90                   nop
1:51AD  45                   inc bp
1:51AE  55                   push bp
1:51AF  8bec                 mov bp, sp
1:51B1  1e                   push ds
1:51B2  8ed8                 mov ds, ax
1:51B4  1e                   push ds
1:51B5  b04e                 mov al, 0x4e
1:51B7  c5560c               lds dx, ptr [bp + 0xc]
1:51BA  b42f                 mov ah, 0x2f
1:51BC  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:51C3  7407                 je 0x51cc
1:51C5  9a8d510000           lcall 0, 0x518d  ; KERNEL.DOS3Call
1:51CA  eb02                 jmp 0x51ce
loc_51CC:
1:51CC  cd21                 int 0x21
loc_51CE:
1:51CE  b41a                 mov ah, 0x1a
1:51D0  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:51D7  7407                 je 0x51e0
1:51D9  9ac6510000           lcall 0, 0x51c6  ; KERNEL.DOS3Call
1:51DE  eb02                 jmp 0x51e2
loc_51E0:
1:51E0  cd21                 int 0x21
loc_51E2:
1:51E2  3c4e                 cmp al, 0x4e
1:51E4  7506                 jne 0x51ec
1:51E6  c55606               lds dx, ptr [bp + 6]
1:51E9  8b4e0a               mov cx, word ptr [bp + 0xa]
loc_51EC:
1:51EC  8ae0                 mov ah, al
1:51EE  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:51F5  7407                 je 0x51fe
1:51F7  9ada510000           lcall 0, 0x51da  ; KERNEL.DOS3Call
1:51FC  eb02                 jmp 0x5200
loc_51FE:
1:51FE  cd21                 int 0x21
loc_5200:
1:5200  50                   push ax
1:5201  9f                   lahf
1:5202  50                   push ax
1:5203  8cc2                 mov dx, es
1:5205  8eda                 mov ds, dx
1:5207  8bd3                 mov dx, bx
1:5209  b41a                 mov ah, 0x1a
1:520B  2ef706f6220100       test word ptr cs:[0x22f6], 1
1:5212  7407                 je 0x521b
1:5214  9af8510000           lcall 0, 0x51f8  ; KERNEL.DOS3Call
1:5219  eb02                 jmp 0x521d
loc_521B:
1:521B  cd21                 int 0x21
loc_521D:
1:521D  58                   pop ax
1:521E  9e                   sahf
1:521F  58                   pop ax
1:5220  1f                   pop ds
1:5221  e967d7               jmp 0x298b

; ---------------- __aFldiv_signed@s1:5224 FAR size=154 callers=0
;   C runtime signed 32-bit divide
1:5224  55                   push bp
1:5225  8bec                 mov bp, sp
1:5227  57                   push di
1:5228  56                   push si
1:5229  53                   push bx
1:522A  33ff                 xor di, di
1:522C  8b4608               mov ax, word ptr [bp + 8]
1:522F  0bc0                 or ax, ax
1:5231  7d11                 jge 0x5244
1:5233  47                   inc di
1:5234  8b5606               mov dx, word ptr [bp + 6]
1:5237  f7d8                 neg ax
1:5239  f7da                 neg dx
1:523B  83d800               sbb ax, 0
1:523E  894608               mov word ptr [bp + 8], ax
1:5241  895606               mov word ptr [bp + 6], dx
loc_5244:
1:5244  8b460c               mov ax, word ptr [bp + 0xc]
1:5247  0bc0                 or ax, ax
1:5249  7d11                 jge 0x525c
1:524B  47                   inc di
1:524C  8b560a               mov dx, word ptr [bp + 0xa]
1:524F  f7d8                 neg ax
1:5251  f7da                 neg dx
1:5253  83d800               sbb ax, 0
1:5256  89460c               mov word ptr [bp + 0xc], ax
1:5259  89560a               mov word ptr [bp + 0xa], dx
loc_525C:
1:525C  0bc0                 or ax, ax
1:525E  7515                 jne 0x5275
1:5260  8b4e0a               mov cx, word ptr [bp + 0xa]
1:5263  8b4608               mov ax, word ptr [bp + 8]
1:5266  33d2                 xor dx, dx
1:5268  f7f1                 div cx
1:526A  8bd8                 mov bx, ax
1:526C  8b4606               mov ax, word ptr [bp + 6]
1:526F  f7f1                 div cx
1:5271  8bd3                 mov dx, bx
1:5273  eb38                 jmp 0x52ad
loc_5275:
1:5275  8bd8                 mov bx, ax
1:5277  8b4e0a               mov cx, word ptr [bp + 0xa]
1:527A  8b5608               mov dx, word ptr [bp + 8]
1:527D  8b4606               mov ax, word ptr [bp + 6]
loc_5280:
1:5280  d1eb                 shr bx, 1
1:5282  d1d9                 rcr cx, 1
1:5284  d1ea                 shr dx, 1
1:5286  d1d8                 rcr ax, 1
1:5288  0bdb                 or bx, bx
1:528A  75f4                 jne 0x5280
1:528C  f7f1                 div cx
1:528E  8bf0                 mov si, ax
1:5290  f7660c               mul word ptr [bp + 0xc]
1:5293  91                   xchg cx, ax
1:5294  8b460a               mov ax, word ptr [bp + 0xa]
1:5297  f7e6                 mul si
1:5299  03d1                 add dx, cx
1:529B  720c                 jb 0x52a9
1:529D  3b5608               cmp dx, word ptr [bp + 8]
1:52A0  7707                 ja 0x52a9
1:52A2  7206                 jb 0x52aa
1:52A4  3b4606               cmp ax, word ptr [bp + 6]
1:52A7  7601                 jbe 0x52aa
loc_52A9:
1:52A9  4e                   dec si
loc_52AA:
1:52AA  33d2                 xor dx, dx
1:52AC  96                   xchg si, ax
loc_52AD:
1:52AD  4f                   dec di
1:52AE  7507                 jne 0x52b7
1:52B0  f7da                 neg dx
1:52B2  f7d8                 neg ax
1:52B4  83da00               sbb dx, 0
loc_52B7:
1:52B7  5b                   pop bx
1:52B8  5e                   pop si
1:52B9  5f                   pop di
1:52BA  5d                   pop bp
1:52BB  ca0800               retf 8

; ---------------- __aFlmul@s1:52BE FAR size=50 callers=6
;   C runtime 32-bit multiply helper
1:52BE  55                   push bp
1:52BF  8bec                 mov bp, sp
1:52C1  8b4608               mov ax, word ptr [bp + 8]
1:52C4  8b4e0c               mov cx, word ptr [bp + 0xc]
1:52C7  0bc8                 or cx, ax
1:52C9  8b4e0a               mov cx, word ptr [bp + 0xa]
1:52CC  7509                 jne 0x52d7
1:52CE  8b4606               mov ax, word ptr [bp + 6]
1:52D1  f7e1                 mul cx
1:52D3  5d                   pop bp
1:52D4  ca0800               retf 8
loc_52D7:
1:52D7  53                   push bx
1:52D8  f7e1                 mul cx
1:52DA  8bd8                 mov bx, ax
1:52DC  8b4606               mov ax, word ptr [bp + 6]
1:52DF  f7660c               mul word ptr [bp + 0xc]
1:52E2  03d8                 add bx, ax
1:52E4  8b4606               mov ax, word ptr [bp + 6]
1:52E7  f7e1                 mul cx
1:52E9  03d3                 add dx, bx
1:52EB  5b                   pop bx
1:52EC  5d                   pop bp
1:52ED  ca0800               retf 8

; ---------------- __aFldiv@s1:52F0 FAR size=160 callers=1
;   C runtime 32-bit divide helper
1:52F0  55                   push bp
1:52F1  8bec                 mov bp, sp
1:52F3  53                   push bx
1:52F4  57                   push di
1:52F5  33ff                 xor di, di
1:52F7  8b4608               mov ax, word ptr [bp + 8]
1:52FA  0bc0                 or ax, ax
1:52FC  7d11                 jge 0x530f
1:52FE  47                   inc di
1:52FF  8b5606               mov dx, word ptr [bp + 6]
1:5302  f7d8                 neg ax
1:5304  f7da                 neg dx
1:5306  83d800               sbb ax, 0
1:5309  894608               mov word ptr [bp + 8], ax
1:530C  895606               mov word ptr [bp + 6], dx
loc_530F:
1:530F  8b460c               mov ax, word ptr [bp + 0xc]
1:5312  0bc0                 or ax, ax
1:5314  7d10                 jge 0x5326
1:5316  8b560a               mov dx, word ptr [bp + 0xa]
1:5319  f7d8                 neg ax
1:531B  f7da                 neg dx
1:531D  83d800               sbb ax, 0
1:5320  89460c               mov word ptr [bp + 0xc], ax
1:5323  89560a               mov word ptr [bp + 0xa], dx
loc_5326:
1:5326  0bc0                 or ax, ax
1:5328  7518                 jne 0x5342
1:532A  8b4e0a               mov cx, word ptr [bp + 0xa]
1:532D  8b4608               mov ax, word ptr [bp + 8]
1:5330  33d2                 xor dx, dx
1:5332  f7f1                 div cx
1:5334  8b4606               mov ax, word ptr [bp + 6]
1:5337  f7f1                 div cx
1:5339  8bc2                 mov ax, dx
1:533B  33d2                 xor dx, dx
1:533D  4f                   dec di
1:533E  7943                 jns 0x5383
1:5340  eb48                 jmp 0x538a
loc_5342:
1:5342  8bd8                 mov bx, ax
1:5344  8b4e0a               mov cx, word ptr [bp + 0xa]
1:5347  8b5608               mov dx, word ptr [bp + 8]
1:534A  8b4606               mov ax, word ptr [bp + 6]
loc_534D:
1:534D  d1eb                 shr bx, 1
1:534F  d1d9                 rcr cx, 1
1:5351  d1ea                 shr dx, 1
1:5353  d1d8                 rcr ax, 1
1:5355  0bdb                 or bx, bx
1:5357  75f4                 jne 0x534d
1:5359  f7f1                 div cx
1:535B  8bc8                 mov cx, ax
1:535D  f7660c               mul word ptr [bp + 0xc]
1:5360  91                   xchg cx, ax
1:5361  f7660a               mul word ptr [bp + 0xa]
1:5364  03d1                 add dx, cx
1:5366  720c                 jb 0x5374
1:5368  3b5608               cmp dx, word ptr [bp + 8]
1:536B  7707                 ja 0x5374
1:536D  720b                 jb 0x537a
1:536F  3b4606               cmp ax, word ptr [bp + 6]
1:5372  7606                 jbe 0x537a
loc_5374:
1:5374  2b460a               sub ax, word ptr [bp + 0xa]
1:5377  1b560c               sbb dx, word ptr [bp + 0xc]
loc_537A:
1:537A  2b4606               sub ax, word ptr [bp + 6]
1:537D  1b5608               sbb dx, word ptr [bp + 8]
1:5380  4f                   dec di
1:5381  7907                 jns 0x538a
loc_5383:
1:5383  f7da                 neg dx
1:5385  f7d8                 neg ax
1:5387  83da00               sbb dx, 0
loc_538A:
1:538A  5f                   pop di
1:538B  5b                   pop bx
1:538C  5d                   pop bp
1:538D  ca0800               retf 8

; ---------------- __aFuldiv@s1:5390 FAR size=96 callers=1
;   C runtime 32-bit unsigned divide helper
1:5390  55                   push bp
1:5391  8bec                 mov bp, sp
1:5393  53                   push bx
1:5394  56                   push si
1:5395  8b460c               mov ax, word ptr [bp + 0xc]
1:5398  0bc0                 or ax, ax
1:539A  7515                 jne 0x53b1
1:539C  8b4e0a               mov cx, word ptr [bp + 0xa]
1:539F  8b4608               mov ax, word ptr [bp + 8]
1:53A2  33d2                 xor dx, dx
1:53A4  f7f1                 div cx
1:53A6  8bd8                 mov bx, ax
1:53A8  8b4606               mov ax, word ptr [bp + 6]
1:53AB  f7f1                 div cx
1:53AD  8bd3                 mov dx, bx
1:53AF  eb38                 jmp 0x53e9
loc_53B1:
1:53B1  8bc8                 mov cx, ax
1:53B3  8b5e0a               mov bx, word ptr [bp + 0xa]
1:53B6  8b5608               mov dx, word ptr [bp + 8]
1:53B9  8b4606               mov ax, word ptr [bp + 6]
loc_53BC:
1:53BC  d1e9                 shr cx, 1
1:53BE  d1db                 rcr bx, 1
1:53C0  d1ea                 shr dx, 1
1:53C2  d1d8                 rcr ax, 1
1:53C4  0bc9                 or cx, cx
1:53C6  75f4                 jne 0x53bc
1:53C8  f7f3                 div bx
1:53CA  8bf0                 mov si, ax
1:53CC  f7660c               mul word ptr [bp + 0xc]
1:53CF  91                   xchg cx, ax
1:53D0  8b460a               mov ax, word ptr [bp + 0xa]
1:53D3  f7e6                 mul si
1:53D5  03d1                 add dx, cx
1:53D7  720c                 jb 0x53e5
1:53D9  3b5608               cmp dx, word ptr [bp + 8]
1:53DC  7707                 ja 0x53e5
1:53DE  7206                 jb 0x53e6
1:53E0  3b4606               cmp ax, word ptr [bp + 6]
1:53E3  7601                 jbe 0x53e6
loc_53E5:
1:53E5  4e                   dec si
loc_53E6:
1:53E6  33d2                 xor dx, dx
1:53E8  96                   xchg si, ax
loc_53E9:
1:53E9  5e                   pop si
1:53EA  5b                   pop bx
1:53EB  5d                   pop bp
1:53EC  ca0800               retf 8
1:53EF  db 00

; ---------------- __aFlrem@s1:53F0 FAR size=106 callers=0
;   C runtime 32-bit remainder
1:53F0  55                   push bp
1:53F1  8bec                 mov bp, sp
1:53F3  53                   push bx
1:53F4  8b460c               mov ax, word ptr [bp + 0xc]
1:53F7  0bc0                 or ax, ax
1:53F9  7515                 jne 0x5410
1:53FB  8b4e0a               mov cx, word ptr [bp + 0xa]
1:53FE  8b4608               mov ax, word ptr [bp + 8]
1:5401  33d2                 xor dx, dx
1:5403  f7f1                 div cx
1:5405  8b4606               mov ax, word ptr [bp + 6]
1:5408  f7f1                 div cx
1:540A  8bc2                 mov ax, dx
1:540C  33d2                 xor dx, dx
1:540E  eb45                 jmp 0x5455
loc_5410:
1:5410  8bc8                 mov cx, ax
1:5412  8b5e0a               mov bx, word ptr [bp + 0xa]
1:5415  8b5608               mov dx, word ptr [bp + 8]
1:5418  8b4606               mov ax, word ptr [bp + 6]
loc_541B:
1:541B  d1e9                 shr cx, 1
1:541D  d1db                 rcr bx, 1
1:541F  d1ea                 shr dx, 1
1:5421  d1d8                 rcr ax, 1
1:5423  0bc9                 or cx, cx
1:5425  75f4                 jne 0x541b
1:5427  f7f3                 div bx
1:5429  8bc8                 mov cx, ax
1:542B  f7660c               mul word ptr [bp + 0xc]
1:542E  91                   xchg cx, ax
1:542F  f7660a               mul word ptr [bp + 0xa]
1:5432  03d1                 add dx, cx
1:5434  720c                 jb 0x5442
1:5436  3b5608               cmp dx, word ptr [bp + 8]
1:5439  7707                 ja 0x5442
1:543B  720b                 jb 0x5448
1:543D  3b4606               cmp ax, word ptr [bp + 6]
1:5440  7606                 jbe 0x5448
loc_5442:
1:5442  2b460a               sub ax, word ptr [bp + 0xa]
1:5445  1b560c               sbb dx, word ptr [bp + 0xc]
loc_5448:
1:5448  2b4606               sub ax, word ptr [bp + 6]
1:544B  1b5608               sbb dx, word ptr [bp + 8]
1:544E  f7da                 neg dx
1:5450  f7d8                 neg ax
1:5452  83da00               sbb dx, 0
loc_5455:
1:5455  5b                   pop bx
1:5456  5d                   pop bp
1:5457  ca0800               retf 8

; ---------------- _fstricmp2@s1:545A FAR size=70 callers=1
;   C runtime case-insensitive compare (second copy)
1:545A  55                   push bp
1:545B  8bec                 mov bp, sp
1:545D  8bd6                 mov dx, si
1:545F  1e                   push ds
1:5460  c5760a               lds si, ptr [bp + 0xa]
1:5463  c45e06               les bx, ptr [bp + 6]
1:5466  b0ff                 mov al, 0xff
loc_5468:
1:5468  0ac0                 or al, al
1:546A  742d                 je 0x5499
1:546C  ac                   lodsb al, byte ptr [si]
1:546D  268a27               mov ah, byte ptr es:[bx]
1:5470  43                   inc bx
1:5471  3ae0                 cmp ah, al
1:5473  74f3                 je 0x5468
1:5475  2c41                 sub al, 0x41
1:5477  3c1a                 cmp al, 0x1a
1:5479  1ac9                 sbb cl, cl
1:547B  80e120               and cl, 0x20
1:547E  02c1                 add al, cl
1:5480  0441                 add al, 0x41
1:5482  86e0                 xchg al, ah
1:5484  2c41                 sub al, 0x41
1:5486  3c1a                 cmp al, 0x1a
1:5488  1ac9                 sbb cl, cl
1:548A  80e120               and cl, 0x20
1:548D  02c1                 add al, cl
1:548F  0441                 add al, 0x41
1:5491  3ac4                 cmp al, ah
1:5493  74d3                 je 0x5468
1:5495  1ac0                 sbb al, al
1:5497  1cff                 sbb al, 0xff
loc_5499:
1:5499  98                   cwde
1:549A  1f                   pop ds
1:549B  8bf2                 mov si, dx
1:549D  5d                   pop bp
1:549E  cb                   retf
1:549F  db 00

; ---------------- _fmemchr@s1:54A0 FAR size=72 callers=1
;   C runtime _fmemchr
1:54A0  55                   push bp
1:54A1  8bec                 mov bp, sp
1:54A3  8b4e0c               mov cx, word ptr [bp + 0xc]
1:54A6  e338                 jcxz 0x54e0
1:54A8  57                   push di
1:54A9  c47e06               les di, ptr [bp + 6]
1:54AC  8bd7                 mov dx, di
1:54AE  f7da                 neg dx
1:54B0  740c                 je 0x54be
1:54B2  2bd1                 sub dx, cx
1:54B4  1bdb                 sbb bx, bx
1:54B6  23d3                 and dx, bx
1:54B8  03d1                 add dx, cx
1:54BA  87d1                 xchg cx, dx
1:54BC  2bd1                 sub dx, cx
loc_54BE:
1:54BE  8b460a               mov ax, word ptr [bp + 0xa]
1:54C1  8ae0                 mov ah, al
1:54C3  d1e9                 shr cx, 1
1:54C5  f3ab                 rep stosw word ptr es:[di], ax
1:54C7  13c9                 adc cx, cx
1:54C9  f3aa                 rep stosb byte ptr es:[di], al
1:54CB  87d1                 xchg cx, dx
1:54CD  e310                 jcxz 0x54df
1:54CF  8cc3                 mov bx, es
1:54D1  81c3924c             add bx, 0x4c92  ; OFFSET KERNEL.__AHINCR
1:54D5  8ec3                 mov es, bx
1:54D7  d1e9                 shr cx, 1
1:54D9  f3ab                 rep stosw word ptr es:[di], ax
1:54DB  13c9                 adc cx, cx
1:54DD  f3aa                 rep stosb byte ptr es:[di], al
loc_54DF:
1:54DF  5f                   pop di
loc_54E0:
1:54E0  8b4606               mov ax, word ptr [bp + 6]
1:54E3  8b5608               mov dx, word ptr [bp + 8]
1:54E6  5d                   pop bp
1:54E7  cb                   retf

; ---------------- _fstrlwr?@s1:54E8 FAR size=42 callers=1
;   C runtime string helper used by the custom controls
1:54E8  55                   push bp
1:54E9  8bec                 mov bp, sp
1:54EB  57                   push di
1:54EC  56                   push si
1:54ED  8b760a               mov si, word ptr [bp + 0xa]
1:54F0  8b7e0e               mov di, word ptr [bp + 0xe]
1:54F3  8b460c               mov ax, word ptr [bp + 0xc]
1:54F6  f7e6                 mul si
1:54F8  03f8                 add di, ax
1:54FA  eb0a                 jmp 0x5506
loc_54FC:
1:54FC  2b7e0c               sub di, word ptr [bp + 0xc]
1:54FF  ff7610               push word ptr [bp + 0x10]
1:5502  57                   push di
1:5503  ff5e06               lcall [bp + 6]
loc_5506:
1:5506  4e                   dec si
1:5507  79f3                 jns 0x54fc
1:5509  5e                   pop si
1:550A  5f                   pop di
1:550B  8be5                 mov sp, bp
1:550D  5d                   pop bp
1:550E  ca0c00               retf 0xc
1:5511  db 90

; ---------------- __aFlmuladd@s1:5512 FAR size=116 callers=0
;   C runtime 32-bit multiply-accumulate helper
1:5512  55                   push bp
1:5513  8bec                 mov bp, sp
1:5515  83ec04               sub sp, 4
1:5518  57                   push di
1:5519  56                   push si
1:551A  8b7e0e               mov di, word ptr [bp + 0xe]
1:551D  2bc0                 sub ax, ax
1:551F  50                   push ax
1:5520  57                   push di
1:5521  ff760c               push word ptr [bp + 0xc]
1:5524  ff760a               push word ptr [bp + 0xa]
1:5527  90                   nop
1:5528  0e                   push cs
1:5529  e892fd               call 0x52be  ; __aFlmul@s1:52BE
1:552C  2bdb                 sub bx, bx
1:552E  8bc8                 mov cx, ax
1:5530  014e10               add word ptr [bp + 0x10], cx
1:5533  13da                 adc bx, dx
1:5535  b9604b               mov cx, 0x4b60  ; OFFSET KERNEL.__AHSHIFT
1:5538  d3e3                 shl bx, cl
1:553A  015e12               add word ptr [bp + 0x12], bx
1:553D  8b7606               mov si, word ptr [bp + 6]
loc_5540:
1:5540  836e0a01             sub word ptr [bp + 0xa], 1
1:5544  835e0c00             sbb word ptr [bp + 0xc], 0
1:5548  837e0c00             cmp word ptr [bp + 0xc], 0
1:554C  7c30                 jl 0x557e
1:554E  8bc7                 mov ax, di
1:5550  2bd2                 sub dx, dx
1:5552  f7d8                 neg ax
1:5554  13d2                 adc dx, dx
1:5556  f7da                 neg dx
1:5558  2bdb                 sub bx, bx
1:555A  8bc8                 mov cx, ax
1:555C  014e10               add word ptr [bp + 0x10], cx
1:555F  13da                 adc bx, dx
1:5561  b93655               mov cx, 0x5536  ; OFFSET KERNEL.__AHSHIFT
1:5564  d3e3                 shl bx, cl
1:5566  015e12               add word ptr [bp + 0x12], bx
1:5569  ff7612               push word ptr [bp + 0x12]
1:556C  ff7610               push word ptr [bp + 0x10]
1:556F  8b4608               mov ax, word ptr [bp + 8]
1:5572  8946fe               mov word ptr [bp - 2], ax
1:5575  8976fc               mov word ptr [bp - 4], si
1:5578  ff5efc               lcall [bp - 4]
1:557B  ebc3                 jmp 0x5540
1:557D  db 90
loc_557E:
1:557E  5e                   pop si
1:557F  5f                   pop di
1:5580  8be5                 mov sp, bp
1:5582  5d                   pop bp
1:5583  ca0e00               retf 0xe

; ---------------- __vec_ctor@s1:5586 FAR size=38 callers=17
;   C++ vector constructor iterator: calls a ctor for each array element
1:5586  55                   push bp
1:5587  8bec                 mov bp, sp
1:5589  57                   push di
1:558A  56                   push si
1:558B  8b760e               mov si, word ptr [bp + 0xe]
1:558E  8b7e0a               mov di, word ptr [bp + 0xa]
1:5591  eb0d                 jmp 0x55a0
1:5593  db 90
loc_5594:
1:5594  ff7610               push word ptr [bp + 0x10]
1:5597  56                   push si
1:5598  ff5e06               lcall [bp + 6]
1:559B  8b460c               mov ax, word ptr [bp + 0xc]
1:559E  03f0                 add si, ax
loc_55A0:
1:55A0  4f                   dec di
1:55A1  79f1                 jns 0x5594
1:55A3  5e                   pop si
1:55A4  5f                   pop di
1:55A5  8be5                 mov sp, bp
1:55A7  5d                   pop bp
1:55A8  ca0c00               retf 0xc
1:55AB  db 90

; ---------------- _nullcheck@s1:55AC size=5 callers=2
;   C runtime: empty hook
1:55AC  55                   push bp
1:55AD  8bec                 mov bp, sp
1:55AF  5d                   pop bp
1:55B0  c3                   ret

; ---------------- _amsg_exit_R6020@s1:55B1 FAR size=6 callers=3
;   C runtime: run-time error R6020
1:55B1  b81400               mov ax, 0x14
1:55B4  e9e3d2               jmp 0x289a
