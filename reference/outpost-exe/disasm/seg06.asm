; OUTPOST.EXE segment 6 (CODE), 61374 bytes
loc_0000:
6:0000  94                   xchg sp, ax
6:0001  ef                   out dx, ax
6:0002  2a00                 sub al, byte ptr [bx + si]  ; SEGMENT s5:0000
6:0004  56                   push si
6:0005  bb0e00               mov bx, 0xe  ; SEGMENT s6:0000
6:0008  8e17                 mov ss, word ptr [bx]
6:000A  db ff ff ec b5 12 00 1a b8 16 00 1c bc 1a 00 38 bd
6:001A  db 1e 00 90 bc 22 00 7e bc 26 00 14 b5 42 00 7c ef
6:002A  db 2e 00 80 ef 32 00 84 ef 36 00 88 ef 3a 00 8c ef
6:003A  db 3e 00 90 ef ff ff f0 bb 46 00 02 bc 4a 00 a8 b5
6:004A  db 4e 00 ca b5 52 00 e6 b4 56 00 ec b4 5a 00 6e b4
6:005A  db 5e 00 4a c6 62 00 22 c5 66 00 d2 ce ff ff

; ---------------- sub_s6:0068 FAR size=100 callers=3
6:0068  c8040000             enter 4, 0
6:006C  66ff7606             push dword ptr [bp + 6]
6:0070  90                   nop
6:0071  0e                   push cs
6:0072  e8dfb2               call 0xffffb354  ; Building::Building()@s6:B354
6:0075  c45e06               les bx, ptr [bp + 6]
6:0078  662bc0               sub eax, eax
6:007B  26894720             mov word ptr es:[bx + 0x20], ax
6:007F  6626894722           mov dword ptr es:[bx + 0x22], eax
6:0084  26c707ec08           mov word ptr es:[bx], 0x8ec
6:0089  26c747020600         mov word ptr es:[bx + 2], 6  ; SEGMENT s6:0000
6:008F  6a0c                 push 0xc
6:0091  9a9c17ffff           lcall 0xffff, 0x179c  ; operator_new@s1:179C
6:0096  83c402               add sp, 2
6:0099  8956fe               mov word ptr [bp - 2], dx
6:009C  0bd0                 or dx, ax
6:009E  7416                 je 0xb6
6:00A0  ff76fe               push word ptr [bp - 2]
6:00A3  50                   push ax
6:00A4  9a4a57ffff           lcall 0xffff, 0x574a  ; sub_s2:574A
6:00A9  c45e06               les bx, ptr [bp + 6]
6:00AC  26894722             mov word ptr es:[bx + 0x22], ax
6:00B0  26895724             mov word ptr es:[bx + 0x24], dx
6:00B4  eb0c                 jmp 0xc2
loc_00B6:
6:00B6  c45e06               les bx, ptr [bp + 6]
6:00B9  6626c7472200000000   mov dword ptr es:[bx + 0x22], 0
loc_00C2:
6:00C2  8b4606               mov ax, word ptr [bp + 6]
6:00C5  8b5608               mov dx, word ptr [bp + 8]
6:00C8  c9                   leave
6:00C9  ca0400               retf 4

; ---------------- sub_s6:00CC FAR size=108 callers=3
6:00CC  c8040000             enter 4, 0
6:00D0  66ff760c             push dword ptr [bp + 0xc]
6:00D4  66ff7608             push dword ptr [bp + 8]
6:00D8  ff7606               push word ptr [bp + 6]
6:00DB  90                   nop
6:00DC  0e                   push cs
6:00DD  e8beb2               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:00E0  c45e06               les bx, ptr [bp + 6]
6:00E3  662bc0               sub eax, eax
6:00E6  26894720             mov word ptr es:[bx + 0x20], ax
6:00EA  6626894722           mov dword ptr es:[bx + 0x22], eax
6:00EF  26c707ec08           mov word ptr es:[bx], 0x8ec
6:00F4  26c747028d00         mov word ptr es:[bx + 2], 0x8d  ; SEGMENT s6:0000
6:00FA  6a0c                 push 0xc
6:00FC  9a9c179400           lcall 0x94, 0x179c  ; operator_new@s1:179C
6:0101  83c402               add sp, 2
6:0104  8956fe               mov word ptr [bp - 2], dx
6:0107  0bd0                 or dx, ax
6:0109  7417                 je 0x122
6:010B  ff76fe               push word ptr [bp - 2]
6:010E  50                   push ax
6:010F  9a4a57a700           lcall 0xa7, 0x574a  ; sub_s2:574A
6:0114  c45e06               les bx, ptr [bp + 6]
6:0117  26894722             mov word ptr es:[bx + 0x22], ax
6:011B  26895724             mov word ptr es:[bx + 0x24], dx
6:011F  eb0d                 jmp 0x12e
6:0121  db 90
loc_0122:
6:0122  c45e06               les bx, ptr [bp + 6]
6:0125  6626c7472200000000   mov dword ptr es:[bx + 0x22], 0
loc_012E:
6:012E  8b4606               mov ax, word ptr [bp + 6]
6:0131  8b5608               mov dx, word ptr [bp + 8]
6:0134  c9                   leave
6:0135  ca0a00               retf 0xa

; ---------------- sub_s6:0138 FAR size=62 callers=3
6:0138  c8080000             enter 8, 0
6:013C  56                   push si
6:013D  c45e06               les bx, ptr [bp + 6]
6:0140  26c707ec08           mov word ptr es:[bx], 0x8ec
6:0145  26c74702f800         mov word ptr es:[bx + 2], 0xf8  ; SEGMENT s6:0000
6:014B  268b4722             mov ax, word ptr es:[bx + 0x22]
6:014F  268b5724             mov dx, word ptr es:[bx + 0x24]
6:0153  8bda                 mov bx, dx
6:0155  0bd0                 or dx, ax
6:0157  740e                 je 0x167
6:0159  6a01                 push 1
6:015B  53                   push bx
6:015C  50                   push ax
6:015D  8ec3                 mov es, bx
6:015F  8bf0                 mov si, ax
6:0161  26c41c               les bx, ptr es:[si]
6:0164  26ff1f               lcall es:[bx]
loc_0167:
6:0167  66ff7606             push dword ptr [bp + 6]
6:016B  90                   nop
6:016C  0e                   push cs
6:016D  e8a8b2               call 0xffffb418  ; sub_s6:B418
6:0170  5e                   pop si
6:0171  c9                   leave
6:0172  ca0400               retf 4
6:0175  db 00

; ---------------- sub_s6:0176 FAR size=118 callers=0
6:0176  c80c0000             enter 0xc, 0
6:017A  56                   push si
6:017B  66ff760a             push dword ptr [bp + 0xa]
6:017F  66ff7606             push dword ptr [bp + 6]
6:0183  90                   nop
6:0184  0e                   push cs
6:0185  e8e6b2               call 0xffffb46e  ; sub_s6:B46E
6:0188  c45e06               les bx, ptr [bp + 6]
6:018B  268b4722             mov ax, word ptr es:[bx + 0x22]
6:018F  268b5724             mov dx, word ptr es:[bx + 0x24]
6:0193  8956f6               mov word ptr [bp - 0xa], dx
6:0196  8bda                 mov bx, dx
6:0198  0bd0                 or dx, ax
6:019A  740e                 je 0x1aa
6:019C  6a01                 push 1
6:019E  53                   push bx
6:019F  50                   push ax
6:01A0  8ec3                 mov es, bx
6:01A2  8bf0                 mov si, ax
6:01A4  26c41c               les bx, ptr es:[si]
6:01A7  26ff1f               lcall es:[bx]
loc_01AA:
6:01AA  6a0c                 push 0xc
6:01AC  9a9c17ff00           lcall 0xff, 0x179c  ; operator_new@s1:179C
6:01B1  83c402               add sp, 2
6:01B4  8956f6               mov word ptr [bp - 0xa], dx
6:01B7  0bd0                 or dx, ax
6:01B9  740b                 je 0x1c6
6:01BB  ff76f6               push word ptr [bp - 0xa]
6:01BE  50                   push ax
6:01BF  9a4a571201           lcall 0x112, 0x574a  ; sub_s2:574A
6:01C4  eb03                 jmp 0x1c9
loc_01C6:
6:01C6  33c0                 xor ax, ax
6:01C8  99                   cdq
loc_01C9:
6:01C9  c45e06               les bx, ptr [bp + 6]
6:01CC  26894722             mov word ptr es:[bx + 0x22], ax
6:01D0  26895724             mov word ptr es:[bx + 0x24], dx
6:01D4  6a14                 push 0x14
6:01D6  66ff7606             push dword ptr [bp + 6]
6:01DA  90                   nop
6:01DB  0e                   push cs
6:01DC  e8afb3               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:01DF  52                   push dx
6:01E0  50                   push ax
6:01E1  9a1a7f0a00           lcall 0xa, 0x7f1a  ; sub_s7:7F1A
6:01E6  5e                   pop si
6:01E7  c9                   leave
6:01E8  ca0800               retf 8
6:01EB  db 00

; ---------------- sub_s6:01EC FAR size=72 callers=0
6:01EC  c8040000             enter 4, 0
6:01F0  c45e06               les bx, ptr [bp + 6]
6:01F3  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:01F8  7407                 je 0x201
6:01FA  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:01FF  752e                 jne 0x22f
loc_0201:
6:0201  26c45f14             les bx, ptr es:[bx + 0x14]
6:0205  81c3a400             add bx, 0xa4
6:0209  26837f0214           cmp word ptr es:[bx + 2], 0x14
6:020E  7407                 je 0x217
6:0210  26837f0410           cmp word ptr es:[bx + 4], 0x10
6:0215  750f                 jne 0x226
loc_0217:
6:0217  6a06                 push 6
6:0219  66ff7606             push dword ptr [bp + 6]
6:021D  90                   nop
6:021E  0e                   push cs
6:021F  e88abb               call 0xffffbdac  ; sub_s6:BDAC
6:0222  c9                   leave
6:0223  ca0400               retf 4
loc_0226:
6:0226  66ff7606             push dword ptr [bp + 6]
6:022A  90                   nop
6:022B  0e                   push cs
6:022C  e8fbbb               call 0xffffbe2a  ; sub_s6:BE2A
loc_022F:
6:022F  c9                   leave
6:0230  ca0400               retf 4
6:0233  db 00

; ---------------- sub_s6:0234 FAR size=320 callers=0
6:0234  c82e0000             enter 0x2e, 0
6:0238  66ff760a             push dword ptr [bp + 0xa]
6:023C  66ff7606             push dword ptr [bp + 6]
6:0240  90                   nop
6:0241  0e                   push cs
6:0242  e8a7b3               call 0xffffb5ec  ; sub_s6:B5EC
6:0245  0bc0                 or ax, ax
6:0247  7507                 jne 0x250
loc_0249:
6:0249  33c0                 xor ax, ax
6:024B  c9                   leave
6:024C  ca0800               retf 8
6:024F  db 90
loc_0250:
6:0250  c45e06               les bx, ptr [bp + 6]
6:0253  268b4720             mov ax, word ptr es:[bx + 0x20]
6:0257  8946e8               mov word ptr [bp - 0x18], ax
6:025A  666a02               push 2
6:025D  8d46e8               lea ax, [bp - 0x18]
6:0260  16                   push ss
6:0261  50                   push ax
6:0262  66ff760a             push dword ptr [bp + 0xa]
6:0266  9a1c7e8802           lcall 0x288, 0x7e1c  ; File_write@s2:7E1C
6:026B  0bc0                 or ax, ax
6:026D  7509                 jne 0x278
loc_026F:
6:026F  c7061003d006         mov word ptr [0x310], 0x6d0
6:0275  ebd2                 jmp 0x249
6:0277  db 90
loc_0278:
6:0278  c45e06               les bx, ptr [bp + 6]
6:027B  6626ff7722           push dword ptr es:[bx + 0x22]
6:0280  8d46f8               lea ax, [bp - 8]
6:0283  16                   push ss
6:0284  50                   push ax
6:0285  9a8457aa02           lcall 0x2aa, 0x5784  ; ListIter::ListIter@s2:5784
6:028A  c45e06               les bx, ptr [bp + 6]
6:028D  26c45f22             les bx, ptr es:[bx + 0x22]
6:0291  268b4708             mov ax, word ptr es:[bx + 8]
6:0295  8946f2               mov word ptr [bp - 0xe], ax
6:0298  8946ee               mov word ptr [bp - 0x12], ax
6:029B  666a02               push 2
6:029E  8d46ee               lea ax, [bp - 0x12]
6:02A1  16                   push ss
6:02A2  50                   push ax
6:02A3  66ff760a             push dword ptr [bp + 0xa]
6:02A7  9a1c7eb802           lcall 0x2b8, 0x7e1c  ; File_write@s2:7E1C
6:02AC  0bc0                 or ax, ax
6:02AE  74bf                 je 0x26f
loc_02B0:
6:02B0  8d46f8               lea ax, [bp - 8]
6:02B3  16                   push ss
6:02B4  50                   push ax
6:02B5  9a125bdf02           lcall 0x2df, 0x5b12  ; ListIter::next@s2:5B12
6:02BA  8946f4               mov word ptr [bp - 0xc], ax
6:02BD  8956f6               mov word ptr [bp - 0xa], dx
6:02C0  0bd0                 or dx, ax
6:02C2  0f84a600             je 0x36c
6:02C6  c45ef4               les bx, ptr [bp - 0xc]
6:02C9  268b4704             mov ax, word ptr es:[bx + 4]
6:02CD  8946ee               mov word ptr [bp - 0x12], ax
6:02D0  666a02               push 2
6:02D3  8d46ee               lea ax, [bp - 0x12]
6:02D6  16                   push ss
6:02D7  50                   push ax
6:02D8  66ff760a             push dword ptr [bp + 0xa]
6:02DC  9a1c7efe02           lcall 0x2fe, 0x7e1c  ; File_write@s2:7E1C
6:02E1  0bc0                 or ax, ax
6:02E3  748a                 je 0x26f
6:02E5  c45ef4               les bx, ptr [bp - 0xc]
6:02E8  268b4706             mov ax, word ptr es:[bx + 6]
6:02EC  8946ee               mov word ptr [bp - 0x12], ax
6:02EF  666a02               push 2
6:02F2  8d46ee               lea ax, [bp - 0x12]
6:02F5  16                   push ss
6:02F6  50                   push ax
6:02F7  66ff760a             push dword ptr [bp + 0xa]
6:02FB  9a1c7e1f03           lcall 0x31f, 0x7e1c  ; File_write@s2:7E1C
6:0300  0bc0                 or ax, ax
6:0302  0f8469ff             je 0x26f
6:0306  c45ef4               les bx, ptr [bp - 0xc]
6:0309  268b4708             mov ax, word ptr es:[bx + 8]
6:030D  8946ee               mov word ptr [bp - 0x12], ax
6:0310  666a02               push 2
6:0313  8d46ee               lea ax, [bp - 0x12]
6:0316  16                   push ss
6:0317  50                   push ax
6:0318  66ff760a             push dword ptr [bp + 0xa]
6:031C  9a1c7e4003           lcall 0x340, 0x7e1c  ; File_write@s2:7E1C
6:0321  0bc0                 or ax, ax
6:0323  0f8448ff             je 0x26f
6:0327  c45ef4               les bx, ptr [bp - 0xc]
6:032A  268b470a             mov ax, word ptr es:[bx + 0xa]
6:032E  8946ee               mov word ptr [bp - 0x12], ax
6:0331  666a02               push 2
6:0334  8d46ee               lea ax, [bp - 0x12]
6:0337  16                   push ss
6:0338  50                   push ax
6:0339  66ff760a             push dword ptr [bp + 0xa]
6:033D  9a1c7e6103           lcall 0x361, 0x7e1c  ; File_write@s2:7E1C
6:0342  0bc0                 or ax, ax
6:0344  0f8427ff             je 0x26f
6:0348  c45ef4               les bx, ptr [bp - 0xc]
6:034B  268b470c             mov ax, word ptr es:[bx + 0xc]
6:034F  8946ee               mov word ptr [bp - 0x12], ax
6:0352  666a02               push 2
6:0355  8d46ee               lea ax, [bp - 0x12]
6:0358  16                   push ss
6:0359  50                   push ax
6:035A  66ff760a             push dword ptr [bp + 0xa]
6:035E  9a1c7ec201           lcall 0x1c2, 0x7e1c  ; File_write@s2:7E1C
6:0363  0bc0                 or ax, ax
6:0365  0f8547ff             jne 0x2b0
6:0369  e903ff               jmp 0x26f
loc_036C:
6:036C  b80100               mov ax, 1
6:036F  c9                   leave
6:0370  ca0800               retf 8
6:0373  db 00

; ---------------- sub_s6:0374 FAR size=378 callers=0
6:0374  c83e0000             enter 0x3e, 0
6:0378  66ff760a             push dword ptr [bp + 0xa]
6:037C  66ff7606             push dword ptr [bp + 6]
6:0380  90                   nop
6:0381  0e                   push cs
6:0382  e895b4               call 0xffffb81a  ; sub_s6:B81A
6:0385  0bc0                 or ax, ax
6:0387  7507                 jne 0x390
loc_0389:
6:0389  33c0                 xor ax, ax
6:038B  c9                   leave
6:038C  ca0800               retf 8
6:038F  db 90
loc_0390:
6:0390  666a02               push 2
6:0393  668b4606             mov eax, dword ptr [bp + 6]
6:0397  052000               add ax, 0x20
6:039A  6650                 push eax
6:039C  66ff760a             push dword ptr [bp + 0xa]
6:03A0  9aee7db803           lcall 0x3b8, 0x7dee  ; File_read@s2:7DEE
6:03A5  0bc0                 or ax, ax
6:03A7  7415                 je 0x3be
6:03A9  666a02               push 2
6:03AC  8d46fe               lea ax, [bp - 2]
6:03AF  16                   push ss
6:03B0  50                   push ax
6:03B1  66ff760a             push dword ptr [bp + 0xa]
6:03B5  9aee7de503           lcall 0x3e5, 0x7dee  ; File_read@s2:7DEE
6:03BA  0bc0                 or ax, ax
6:03BC  7508                 jne 0x3c6
loc_03BE:
6:03BE  c7061003d206         mov word ptr [0x310], 0x6d2
6:03C4  ebc3                 jmp 0x389
loc_03C6:
6:03C6  c746fc0000           mov word ptr [bp - 4], 0
6:03CB  e9b700               jmp 0x485
loc_03CE:
6:03CE  66c746ee00000000     mov dword ptr [bp - 0x12], 0
loc_03D6:
6:03D6  666a02               push 2
6:03D9  8d46f2               lea ax, [bp - 0xe]
6:03DC  16                   push ss
6:03DD  50                   push ax
6:03DE  66ff760a             push dword ptr [bp + 0xa]
6:03E2  9aee7dfa03           lcall 0x3fa, 0x7dee  ; File_read@s2:7DEE
6:03E7  0bc0                 or ax, ax
6:03E9  74d3                 je 0x3be
6:03EB  666a02               push 2
6:03EE  8d46f6               lea ax, [bp - 0xa]
6:03F1  16                   push ss
6:03F2  50                   push ax
6:03F3  66ff760a             push dword ptr [bp + 0xa]
6:03F7  9aee7d0f04           lcall 0x40f, 0x7dee  ; File_read@s2:7DEE
6:03FC  0bc0                 or ax, ax
6:03FE  74be                 je 0x3be
6:0400  666a02               push 2
6:0403  8d46ea               lea ax, [bp - 0x16]
6:0406  16                   push ss
6:0407  50                   push ax
6:0408  66ff760a             push dword ptr [bp + 0xa]
6:040C  9aee7d2804           lcall 0x428, 0x7dee  ; File_read@s2:7DEE
6:0411  0bc0                 or ax, ax
6:0413  74a9                 je 0x3be
6:0415  666a02               push 2
6:0418  668b46ee             mov eax, dword ptr [bp - 0x12]
6:041C  050a00               add ax, 0xa
6:041F  6650                 push eax
6:0421  66ff760a             push dword ptr [bp + 0xa]
6:0425  9aee7d4104           lcall 0x441, 0x7dee  ; File_read@s2:7DEE
6:042A  0bc0                 or ax, ax
6:042C  7490                 je 0x3be
6:042E  666a02               push 2
6:0431  668b46ee             mov eax, dword ptr [bp - 0x12]
6:0435  050c00               add ax, 0xc
6:0438  6650                 push eax
6:043A  66ff760a             push dword ptr [bp + 0xa]
6:043E  9aee7d5d04           lcall 0x45d, 0x7dee  ; File_read@s2:7DEE
6:0443  0bc0                 or ax, ax
6:0445  0f8475ff             je 0x3be
6:0449  8b46f2               mov ax, word ptr [bp - 0xe]
6:044C  c45eee               les bx, ptr [bp - 0x12]
6:044F  26894704             mov word ptr es:[bx + 4], ax
6:0453  ff76f6               push word ptr [bp - 0xa]
6:0456  66ff760a             push dword ptr [bp + 0xa]
6:045A  9abc72b404           lcall 0x4b4, 0x72bc  ; sub_s2:72BC
6:045F  c45eee               les bx, ptr [bp - 0x12]
6:0462  26894706             mov word ptr es:[bx + 6], ax
6:0466  8b46ea               mov ax, word ptr [bp - 0x16]
6:0469  26894708             mov word ptr es:[bx + 8], ax
6:046D  06                   push es
6:046E  53                   push bx
6:046F  c45e06               les bx, ptr [bp + 6]
6:0472  6626ff7722           push dword ptr es:[bx + 0x22]
6:0477  26c45f22             les bx, ptr es:[bx + 0x22]
6:047B  26c41f               les bx, ptr es:[bx]
6:047E  26ff5f08             lcall es:[bx + 8]
6:0482  ff46fc               inc word ptr [bp - 4]
loc_0485:
6:0485  8b46fe               mov ax, word ptr [bp - 2]
6:0488  3946fc               cmp word ptr [bp - 4], ax
6:048B  7359                 jae 0x4e6
6:048D  66a1a268             mov eax, dword ptr [0x68a2]
6:0491  668946da             mov dword ptr [bp - 0x26], eax
6:0495  6650                 push eax
6:0497  9afc07af01           lcall 0x1af, 0x7fc  ; sub_s1:07FC
6:049C  8946e6               mov word ptr [bp - 0x1a], ax
6:049F  8956e8               mov word ptr [bp - 0x18], dx
6:04A2  0bd0                 or dx, ax
6:04A4  0f8426ff             je 0x3ce
6:04A8  c45ee6               les bx, ptr [bp - 0x1a]
6:04AB  26c7079a38           mov word ptr es:[bx], 0x389a
6:04B0  26c747026902         mov word ptr es:[bx + 2], 0x269  ; SEGMENT s2:0000
6:04B6  33c0                 xor ax, ax
6:04B8  c45ee6               les bx, ptr [bp - 0x1a]
6:04BB  26894704             mov word ptr es:[bx + 4], ax
6:04BF  26894706             mov word ptr es:[bx + 6], ax
6:04C3  26894708             mov word ptr es:[bx + 8], ax
6:04C7  2689470a             mov word ptr es:[bx + 0xa], ax
6:04CB  2689470c             mov word ptr es:[bx + 0xc], ax
6:04CF  26c707ce56           mov word ptr es:[bx], 0x56ce
6:04D4  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT s4:0000
6:04DA  668b46e6             mov eax, dword ptr [bp - 0x1a]
6:04DE  668946ee             mov dword ptr [bp - 0x12], eax
6:04E2  e9f1fe               jmp 0x3d6
6:04E5  db 90
loc_04E6:
6:04E6  b80100               mov ax, 1
6:04E9  c9                   leave
6:04EA  ca0800               retf 8
6:04ED  db 00

; ---------------- sub_s6:04EE FAR size=98 callers=0
6:04EE  c80c0000             enter 0xc, 0
6:04F2  c45e0a               les bx, ptr [bp + 0xa]
6:04F5  6626c70700000000     mov dword ptr es:[bx], 0
6:04FD  c45e06               les bx, ptr [bp + 6]
6:0500  6626ff7722           push dword ptr es:[bx + 0x22]
6:0505  8d46f8               lea ax, [bp - 8]
6:0508  16                   push ss
6:0509  50                   push ax
6:050A  9a84571705           lcall 0x517, 0x5784  ; ListIter::ListIter@s2:5784
loc_050F:
6:050F  8d46f8               lea ax, [bp - 8]
6:0512  16                   push ss
6:0513  50                   push ax
6:0514  9a125ba303           lcall 0x3a3, 0x5b12  ; ListIter::next@s2:5B12
6:0519  8946f4               mov word ptr [bp - 0xc], ax
6:051C  8956f6               mov word ptr [bp - 0xa], dx
6:051F  0bd0                 or dx, ax
6:0521  7427                 je 0x54a
6:0523  c45ef4               les bx, ptr [bp - 0xc]
6:0526  2bd2                 sub dx, dx
6:0528  268b470c             mov ax, word ptr es:[bx + 0xc]
6:052C  c45e0a               les bx, ptr [bp + 0xa]
6:052F  260107               add word ptr es:[bx], ax
6:0532  26115702             adc word ptr es:[bx + 2], dx
6:0536  26395702             cmp word ptr es:[bx + 2], dx
6:053A  7506                 jne 0x542
6:053C  26833f1e             cmp word ptr es:[bx], 0x1e
6:0540  72cd                 jb 0x50f
loc_0542:
6:0542  b80100               mov ax, 1
6:0545  c9                   leave
6:0546  ca0800               retf 8
6:0549  db 90
loc_054A:
6:054A  33c0                 xor ax, ax
6:054C  c9                   leave
6:054D  ca0800               retf 8

; ---------------- sub_s6:0550 FAR size=50 callers=1
6:0550  c8040000             enter 4, 0
6:0554  66ff7606             push dword ptr [bp + 6]
6:0558  90                   nop
6:0559  0e                   push cs
6:055A  e841b9               call 0xffffbe9e  ; sub_s6:BE9E
6:055D  c45e06               les bx, ptr [bp + 6]
6:0560  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:0565  7516                 jne 0x57d
6:0567  666800000400         push 0x40000
6:056D  6a01                 push 1
6:056F  06                   push es
6:0570  53                   push bx
6:0571  90                   nop
6:0572  0e                   push cs
6:0573  e818b0               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:0576  52                   push dx
6:0577  50                   push ax
6:0578  9a507ce401           lcall 0x1e4, 0x7c50  ; sub_s7:7C50
loc_057D:
6:057D  c9                   leave
6:057E  ca0400               retf 4
6:0581  db 00

; ---------------- Factory::produce@s6:0582 FAR size=668 callers=0
6:0582  c8360100             enter 0x136, 0
6:0586  c45e06               les bx, ptr [bp + 6]
6:0589  26c45f14             les bx, ptr es:[bx + 0x14]
6:058D  81c3a400             add bx, 0xa4
6:0591  895efc               mov word ptr [bp - 4], bx
6:0594  8c46fe               mov word ptr [bp - 2], es
6:0597  26837f0200           cmp word ptr es:[bx + 2], 0
6:059C  0f842301             je 0x6c3
6:05A0  26837f0800           cmp word ptr es:[bx + 8], 0
6:05A5  0f841a01             je 0x6c3
6:05A9  66ff7606             push dword ptr [bp + 6]
6:05AD  90                   nop
6:05AE  0e                   push cs
6:05AF  e86c02               call 0x81e  ; sub_s6:081E
6:05B2  c45e06               les bx, ptr [bp + 6]
6:05B5  268b4720             mov ax, word ptr es:[bx + 0x20]
6:05B9  c45efc               les bx, ptr [bp - 4]
6:05BC  26394708             cmp word ptr es:[bx + 8], ax
6:05C0  0f87ff00             ja 0x6c3
6:05C4  8d46f8               lea ax, [bp - 8]
6:05C7  16                   push ss
6:05C8  50                   push ax
6:05C9  c45e06               les bx, ptr [bp + 6]
6:05CC  06                   push es
6:05CD  53                   push bx
6:05CE  26c41f               les bx, ptr es:[bx]
6:05D1  26ff5f40             lcall es:[bx + 0x40]
6:05D5  0bc0                 or ax, ax
6:05D7  0f85df00             jne 0x6ba
6:05DB  c45efc               les bx, ptr [bp - 4]
6:05DE  26837f020c           cmp word ptr es:[bx + 2], 0xc
6:05E3  7529                 jne 0x60e
6:05E5  66ff7606             push dword ptr [bp + 6]
6:05E9  90                   nop
6:05EA  0e                   push cs
6:05EB  e804af               call 0xffffb4f2  ; sub_s6:B4F2
6:05EE  8946f4               mov word ptr [bp - 0xc], ax
6:05F1  8956f6               mov word ptr [bp - 0xa], dx
6:05F4  c45ef4               les bx, ptr [bp - 0xc]
6:05F7  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:05FD  668946f0             mov dword ptr [bp - 0x10], eax
6:0601  c45ef0               les bx, ptr [bp - 0x10]
6:0604  6626ff877001         inc dword ptr es:[bx + 0x170]
6:060A  e9ad00               jmp 0x6ba
6:060D  db 90
loc_060E:
6:060E  66a1a268             mov eax, dword ptr [0x68a2]
6:0612  668946f0             mov dword ptr [bp - 0x10], eax
6:0616  6650                 push eax
6:0618  9afc071707           lcall 0x717, 0x7fc  ; sub_s1:07FC
6:061D  8946dc               mov word ptr [bp - 0x24], ax
6:0620  8956de               mov word ptr [bp - 0x22], dx
6:0623  0bd0                 or dx, ax
6:0625  743d                 je 0x664
6:0627  c45edc               les bx, ptr [bp - 0x24]
6:062A  26c7079a38           mov word ptr es:[bx], 0x389a
6:062F  26c747022f07         mov word ptr es:[bx + 2], 0x72f  ; SEGMENT s2:0000
6:0635  33c0                 xor ax, ax
6:0637  c45edc               les bx, ptr [bp - 0x24]
6:063A  26894704             mov word ptr es:[bx + 4], ax
6:063E  26894706             mov word ptr es:[bx + 6], ax
6:0642  26894708             mov word ptr es:[bx + 8], ax
6:0646  2689470a             mov word ptr es:[bx + 0xa], ax
6:064A  2689470c             mov word ptr es:[bx + 0xc], ax
6:064E  26c707ce56           mov word ptr es:[bx], 0x56ce
6:0653  26c747025307         mov word ptr es:[bx + 2], 0x753  ; SEGMENT s4:0000
6:0659  668b46dc             mov eax, dword ptr [bp - 0x24]
6:065D  668946e0             mov dword ptr [bp - 0x20], eax
6:0661  eb09                 jmp 0x66c
6:0663  db 90
loc_0664:
6:0664  66c746e000000000     mov dword ptr [bp - 0x20], 0
loc_066C:
6:066C  c45efc               les bx, ptr [bp - 4]
6:066F  268b4702             mov ax, word ptr es:[bx + 2]
6:0673  c45ee0               les bx, ptr [bp - 0x20]
6:0676  26894706             mov word ptr es:[bx + 6], ax
6:067A  c45efc               les bx, ptr [bp - 4]
6:067D  268b4706             mov ax, word ptr es:[bx + 6]
6:0681  c45ee0               les bx, ptr [bp - 0x20]
6:0684  2689470a             mov word ptr es:[bx + 0xa], ax
6:0688  c45efc               les bx, ptr [bp - 4]
6:068B  26ff7702             push word ptr es:[bx + 2]
6:068F  9ab4c38e07           lcall 0x78e, 0xc3b4  ; sub_s5:C3B4
6:0694  83c402               add sp, 2
6:0697  c45efc               les bx, ptr [bp - 4]
6:069A  26f76706             mul word ptr es:[bx + 6]
6:069E  c45ee0               les bx, ptr [bp - 0x20]
6:06A1  2689470c             mov word ptr es:[bx + 0xc], ax
6:06A5  06                   push es
6:06A6  53                   push bx
6:06A7  c45e06               les bx, ptr [bp + 6]
6:06AA  6626ff7722           push dword ptr es:[bx + 0x22]
6:06AF  26c45f22             les bx, ptr es:[bx + 0x22]
6:06B3  26c41f               les bx, ptr es:[bx]
6:06B6  26ff5f04             lcall es:[bx + 4]
loc_06BA:
6:06BA  c45e06               les bx, ptr [bp + 6]
6:06BD  26c747200000         mov word ptr es:[bx + 0x20], 0
loc_06C3:
6:06C3  c45efc               les bx, ptr [bp - 4]
6:06C6  26837f0400           cmp word ptr es:[bx + 4], 0
6:06CB  0f84f000             je 0x7bf
6:06CF  26837f0800           cmp word ptr es:[bx + 8], 0
6:06D4  0f84e700             je 0x7bf
6:06D8  66ff7606             push dword ptr [bp + 6]
6:06DC  90                   nop
6:06DD  0e                   push cs
6:06DE  e83d01               call 0x81e  ; sub_s6:081E
6:06E1  c45e06               les bx, ptr [bp + 6]
6:06E4  268b4720             mov ax, word ptr es:[bx + 0x20]
6:06E8  c45efc               les bx, ptr [bp - 4]
6:06EB  26394708             cmp word ptr es:[bx + 8], ax
6:06EF  0f87cc00             ja 0x7bf
6:06F3  8d46d8               lea ax, [bp - 0x28]
6:06F6  16                   push ss
6:06F7  50                   push ax
6:06F8  c45e06               les bx, ptr [bp + 6]
6:06FB  06                   push es
6:06FC  53                   push bx
6:06FD  26c41f               les bx, ptr es:[bx]
6:0700  26ff5f40             lcall es:[bx + 0x40]
6:0704  0bc0                 or ax, ax
6:0706  0f85ac00             jne 0x7b6
6:070A  66a1a268             mov eax, dword ptr [0x68a2]
6:070E  668946f0             mov dword ptr [bp - 0x10], eax
6:0712  6650                 push eax
6:0714  9afc079a04           lcall 0x49a, 0x7fc  ; sub_s1:07FC
6:0719  8946dc               mov word ptr [bp - 0x24], ax
6:071C  8956de               mov word ptr [bp - 0x22], dx
6:071F  0bd0                 or dx, ax
6:0721  743d                 je 0x760
6:0723  c45edc               les bx, ptr [bp - 0x24]
6:0726  26c7079a38           mov word ptr es:[bx], 0x389a
6:072B  26c747021708         mov word ptr es:[bx + 2], 0x817  ; SEGMENT s2:0000
6:0731  33c0                 xor ax, ax
6:0733  c45edc               les bx, ptr [bp - 0x24]
6:0736  26894704             mov word ptr es:[bx + 4], ax
6:073A  26894706             mov word ptr es:[bx + 6], ax
6:073E  26894708             mov word ptr es:[bx + 8], ax
6:0742  2689470a             mov word ptr es:[bx + 0xa], ax
6:0746  2689470c             mov word ptr es:[bx + 0xc], ax
6:074A  26c707ce56           mov word ptr es:[bx], 0x56ce
6:074F  26c74702d804         mov word ptr es:[bx + 2], 0x4d8  ; SEGMENT s4:0000
6:0755  668b46dc             mov eax, dword ptr [bp - 0x24]
6:0759  668946e0             mov dword ptr [bp - 0x20], eax
6:075D  eb09                 jmp 0x768
6:075F  db 90
loc_0760:
6:0760  66c746e000000000     mov dword ptr [bp - 0x20], 0
loc_0768:
6:0768  c45efc               les bx, ptr [bp - 4]
6:076B  268b4704             mov ax, word ptr es:[bx + 4]
6:076F  c45ee0               les bx, ptr [bp - 0x20]
6:0772  26894708             mov word ptr es:[bx + 8], ax
6:0776  c45efc               les bx, ptr [bp - 4]
6:0779  268b4706             mov ax, word ptr es:[bx + 6]
6:077D  c45ee0               les bx, ptr [bp - 0x20]
6:0780  2689470a             mov word ptr es:[bx + 0xa], ax
6:0784  c45efc               les bx, ptr [bp - 4]
6:0787  26ff7704             push word ptr es:[bx + 4]
6:078B  9a2ec40200           lcall 2, 0xc42e  ; sub_s5:C42E
6:0790  83c402               add sp, 2
6:0793  c45efc               les bx, ptr [bp - 4]
6:0796  26f76706             mul word ptr es:[bx + 6]
6:079A  c45ee0               les bx, ptr [bp - 0x20]
6:079D  2689470c             mov word ptr es:[bx + 0xc], ax
6:07A1  06                   push es
6:07A2  53                   push bx
6:07A3  c45e06               les bx, ptr [bp + 6]
6:07A6  6626ff7722           push dword ptr es:[bx + 0x22]
6:07AB  26c45f22             les bx, ptr es:[bx + 0x22]
6:07AF  26c41f               les bx, ptr es:[bx]
6:07B2  26ff5f04             lcall es:[bx + 4]
loc_07B6:
6:07B6  c45e06               les bx, ptr [bp + 6]
6:07B9  26c747200000         mov word ptr es:[bx + 0x20], 0
loc_07BF:
6:07BF  c45e06               les bx, ptr [bp + 6]
6:07C2  26837f0c0e           cmp word ptr es:[bx + 0xc], 0xe
6:07C7  7450                 je 0x819
6:07C9  06                   push es
6:07CA  53                   push bx
6:07CB  90                   nop
6:07CC  0e                   push cs
6:07CD  e8bead               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:07D0  8946d8               mov word ptr [bp - 0x28], ax
6:07D3  8956da               mov word ptr [bp - 0x26], dx
6:07D6  c45ed8               les bx, ptr [bp - 0x28]
6:07D9  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:07DE  668946e0             mov dword ptr [bp - 0x20], eax
6:07E2  c45ee0               les bx, ptr [bp - 0x20]
6:07E5  66268b4704           mov eax, dword ptr es:[bx + 4]
6:07EA  668946e4             mov dword ptr [bp - 0x1c], eax
6:07EE  6650                 push eax
6:07F0  6a01                 push 1
6:07F2  8d86cafe             lea ax, [bp - 0x136]
6:07F6  16                   push ss
6:07F7  50                   push ax
6:07F8  90                   nop
6:07F9  0e                   push cs
6:07FA  e8e160               call 0x68de  ; SCAddSpew@s6:68DE
6:07FD  8d86cafe             lea ax, [bp - 0x136]
6:0801  16                   push ss
6:0802  50                   push ax
6:0803  66ff364857           push dword ptr [0x5748]  ; g_sim
6:0808  9a5a837b05           lcall 0x57b, 0x835a  ; Sim::enqueue@s7:835A
6:080D  c786cafe9a38         mov word ptr [bp - 0x136], 0x389a
6:0813  c786ccfe0d05         mov word ptr [bp - 0x134], 0x50d  ; SEGMENT s2:0000
loc_0819:
6:0819  c9                   leave
6:081A  ca0400               retf 4
6:081D  db 00

; ---------------- sub_s6:081E FAR size=168 callers=1
6:081E  c8160000             enter 0x16, 0
6:0822  66ff7606             push dword ptr [bp + 6]
6:0826  90                   nop
6:0827  0e                   push cs
6:0828  e863ad               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:082B  8946fc               mov word ptr [bp - 4], ax
6:082E  8956fe               mov word ptr [bp - 2], dx
6:0831  c45efc               les bx, ptr [bp - 4]
6:0834  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:0839  668946f8             mov dword ptr [bp - 8], eax
6:083D  c45ef8               les bx, ptr [bp - 8]
6:0840  268b4718             mov ax, word ptr es:[bx + 0x18]
6:0844  8946f6               mov word ptr [bp - 0xa], ax
6:0847  c45e06               les bx, ptr [bp + 6]
6:084A  26ff4720             inc word ptr es:[bx + 0x20]
6:084E  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:0852  268b07               mov ax, word ptr es:[bx]
6:0855  268b5702             mov dx, word ptr es:[bx + 2]
6:0859  8946f2               mov word ptr [bp - 0xe], ax
6:085C  817ef6fa00           cmp word ptr [bp - 0xa], 0xfa
6:0861  7d11                 jge 0x874
6:0863  f646f201             test byte ptr [bp - 0xe], 1
loc_0867:
6:0867  7559                 jne 0x8c2
6:0869  c45e06               les bx, ptr [bp + 6]
6:086C  26ff4f20             dec word ptr es:[bx + 0x20]
6:0870  c9                   leave
6:0871  ca0400               retf 4
loc_0874:
6:0874  817ef6c201           cmp word ptr [bp - 0xa], 0x1c2
6:0879  7d1b                 jge 0x896
6:087B  666a03               push 3
6:087E  52                   push dx
6:087F  50                   push ax
6:0880  6658                 pop eax
6:0882  6659                 pop ecx
6:0884  6633d2               xor edx, edx
6:0887  66f7f1               div ecx
6:088A  668bc2               mov eax, edx
6:088D  66c1ea10             shr edx, 0x10
6:0891  0bd0                 or dx, ax
6:0893  ebd2                 jmp 0x867
6:0895  db 90
loc_0896:
6:0896  817ef62602           cmp word ptr [bp - 0xa], 0x226
6:089B  7c25                 jl 0x8c2
6:089D  817ef6ee02           cmp word ptr [bp - 0xa], 0x2ee
6:08A2  7d17                 jge 0x8bb
6:08A4  666a03               push 3
6:08A7  52                   push dx
6:08A8  50                   push ax
6:08A9  6658                 pop eax
6:08AB  6659                 pop ecx
6:08AD  6633d2               xor edx, edx
6:08B0  66f7f1               div ecx
6:08B3  668bc2               mov eax, edx
6:08B6  660bc0               or eax, eax
6:08B9  7507                 jne 0x8c2
loc_08BB:
6:08BB  c45e06               les bx, ptr [bp + 6]
6:08BE  26ff4720             inc word ptr es:[bx + 0x20]
loc_08C2:
6:08C2  c9                   leave
6:08C3  ca0400               retf 4

; ---------------- sub_s6:08C6 FAR size=142 callers=0
6:08C6  55                   push bp
6:08C7  8bec                 mov bp, sp
6:08C9  66ff7606             push dword ptr [bp + 6]
6:08CD  90                   nop
6:08CE  0e                   push cs
6:08CF  e866f8               call 0x138  ; sub_s6:0138
6:08D2  f6460a01             test byte ptr [bp + 0xa], 1
6:08D6  7409                 je 0x8e1
6:08D8  66ff7606             push dword ptr [bp + 6]
6:08DC  9ace171b06           lcall 0x61b, 0x17ce  ; operator_delete@s1:17CE
loc_08E1:
6:08E1  8b4606               mov ax, word ptr [bp + 6]
6:08E4  8b5608               mov dx, word ptr [bp + 8]
6:08E7  c9                   leave
6:08E8  ca0600               retf 6
6:08EB  db 90 c6 08 f2 08 56 bb fa 08 8e 17 0b 08 34 02 fe
6:08FB  db 08 74 03 02 09 1c bc 06 09 38 bd 0a 09 90 bc 0e
6:090B  db 09 7e bc 12 09 14 b5 16 09 ec 01 1a 09 16 bf 1e
6:091B  db 09 82 05 22 09 1e bf 26 09 50 05 2a 09 22 bf 2e
6:092B  db 09 ee 04 32 09 02 bc 36 09 a8 b5 3a 09 ca b5 3e
6:093B  db 09 e6 b4 42 09 ec b4 46 09 76 01 4a 09 4a c6 4e
6:094B  db 09 22 c5 52 09 d2 ce 49 01

; ---------------- sub_s6:0954 FAR size=46 callers=3
6:0954  55                   push bp
6:0955  8bec                 mov bp, sp
6:0957  66ff7606             push dword ptr [bp + 6]
6:095B  90                   nop
6:095C  0e                   push cs
6:095D  e8f4a9               call 0xffffb354  ; Building::Building()@s6:B354
6:0960  c45e06               les bx, ptr [bp + 6]
6:0963  26c747200000         mov word ptr es:[bx + 0x20], 0
6:0969  26c707da0a           mov word ptr es:[bx], 0xada
6:096E  26c74702ee08         mov word ptr es:[bx + 2], 0x8ee  ; SEGMENT s6:0000
6:0974  26c7470e4b00         mov word ptr es:[bx + 0xe], 0x4b
6:097A  8bc3                 mov ax, bx
6:097C  8cc2                 mov dx, es
6:097E  c9                   leave
6:097F  ca0400               retf 4

; ---------------- sub_s6:0982 FAR size=54 callers=3
6:0982  55                   push bp
6:0983  8bec                 mov bp, sp
6:0985  66ff760c             push dword ptr [bp + 0xc]
6:0989  66ff7608             push dword ptr [bp + 8]
6:098D  ff7606               push word ptr [bp + 6]
6:0990  90                   nop
6:0991  0e                   push cs
6:0992  e809aa               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:0995  c45e06               les bx, ptr [bp + 6]
6:0998  26c747200000         mov word ptr es:[bx + 0x20], 0
6:099E  26c707da0a           mov word ptr es:[bx], 0xada
6:09A3  26c747027209         mov word ptr es:[bx + 2], 0x972  ; SEGMENT s6:0000
6:09A9  26c7470e4b00         mov word ptr es:[bx + 0xe], 0x4b
6:09AF  8bc3                 mov ax, bx
6:09B1  8cc2                 mov dx, es
6:09B3  c9                   leave
6:09B4  ca0a00               retf 0xa
6:09B7  db 00

; ---------------- sub_s6:09B8 FAR size=28 callers=3
6:09B8  c80c0000             enter 0xc, 0
6:09BC  66ff7606             push dword ptr [bp + 6]
6:09C0  90                   nop
6:09C1  0e                   push cs
6:09C2  e8c9ab               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:09C5  8bd8                 mov bx, ax
6:09C7  8ec2                 mov es, dx
6:09C9  26c747140100         mov word ptr es:[bx + 0x14], 1
6:09CF  c9                   leave
6:09D0  ca0600               retf 6
6:09D3  db 00

; ---------------- sub_s6:09D4 FAR size=224 callers=1
6:09D4  c8160000             enter 0x16, 0
6:09D8  66ff7612             push dword ptr [bp + 0x12]
6:09DC  66ff760e             push dword ptr [bp + 0xe]
6:09E0  66ff760a             push dword ptr [bp + 0xa]
6:09E4  66ff7606             push dword ptr [bp + 6]
6:09E8  90                   nop
6:09E9  0e                   push cs
6:09EA  e827b9               call 0xffffc314  ; sub_s6:C314
6:09ED  0bc0                 or ax, ax
6:09EF  7507                 jne 0x9f8
loc_09F1:
6:09F1  33c0                 xor ax, ax
6:09F3  c9                   leave
6:09F4  ca1000               retf 0x10
6:09F7  db 90
loc_09F8:
6:09F8  66ff7612             push dword ptr [bp + 0x12]
6:09FC  66ff760a             push dword ptr [bp + 0xa]
6:0A00  66ff7606             push dword ptr [bp + 6]
6:0A04  90                   nop
6:0A05  0e                   push cs
6:0A06  e8adbd               call 0xffffc7b6  ; sub_s6:C7B6
6:0A09  8946fe               mov word ptr [bp - 2], ax
6:0A0C  0bc0                 or ax, ax
6:0A0E  0f848200             je 0xa94
6:0A12  2d0400               sub ax, 4
6:0A15  747d                 je 0xa94
6:0A17  48                   dec ax
6:0A18  48                   dec ax
6:0A19  7c07                 jl 0xa22
6:0A1B  7005                 jo 0xa22
6:0A1D  2d0300               sub ax, 3
6:0A20  7e72                 jle 0xa94
loc_0A22:
6:0A22  c45e06               les bx, ptr [bp + 6]
6:0A25  26837f0c3e           cmp word ptr es:[bx + 0xc], 0x3e
6:0A2A  7407                 je 0xa33
6:0A2C  26837f0c41           cmp word ptr es:[bx + 0xc], 0x41
6:0A31  7579                 jne 0xaac
loc_0A33:
6:0A33  8d46fc               lea ax, [bp - 4]
6:0A36  16                   push ss
6:0A37  50                   push ax
6:0A38  9aaebc810a           lcall 0xa81, 0xbcae  ; sub_s7:BCAE
6:0A3D  66ff760e             push dword ptr [bp + 0xe]
6:0A41  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:0A46  90                   nop
6:0A47  0e                   push cs
6:0A48  e8a1d7               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:0A4B  8946f8               mov word ptr [bp - 8], ax
6:0A4E  8956fa               mov word ptr [bp - 6], dx
6:0A51  c45ef8               les bx, ptr [bp - 8]
6:0A54  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:0A59  668946f4             mov dword ptr [bp - 0xc], eax
6:0A5D  66ff7612             push dword ptr [bp + 0x12]
6:0A61  66ff760a             push dword ptr [bp + 0xa]
6:0A65  6650                 push eax
6:0A67  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:0A6C  90                   nop
6:0A6D  0e                   push cs
6:0A6E  e87bd7               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:0A71  8946f0               mov word ptr [bp - 0x10], ax
6:0A74  8956f2               mov word ptr [bp - 0xe], dx
6:0A77  52                   push dx
6:0A78  50                   push ax
6:0A79  8d46fc               lea ax, [bp - 4]
6:0A7C  16                   push ss
6:0A7D  50                   push ax
6:0A7E  9adebcf608           lcall 0x8f6, 0xbcde  ; sub_s7:BCDE
6:0A83  8946ee               mov word ptr [bp - 0x12], ax
6:0A86  0bc0                 or ax, ax
6:0A88  7d14                 jge 0xa9e
6:0A8A  c706ca50af06         mov word ptr [0x50ca], 0x6af
6:0A90  e95eff               jmp 0x9f1
6:0A93  db 90
loc_0A94:
6:0A94  c706ca50a806         mov word ptr [0x50ca], 0x6a8
6:0A9A  e954ff               jmp 0x9f1
6:0A9D  db 90
loc_0A9E:
6:0A9E  3d0500               cmp ax, 5
6:0AA1  7e09                 jle 0xaac
6:0AA3  c706ca50b506         mov word ptr [0x50ca], 0x6b5
6:0AA9  e945ff               jmp 0x9f1
loc_0AAC:
6:0AAC  b80100               mov ax, 1
6:0AAF  c9                   leave
6:0AB0  ca1000               retf 0x10
6:0AB3  db 00

; ---------------- sub_s6:0AB4 FAR size=142 callers=0
6:0AB4  c8040000             enter 4, 0
6:0AB8  66ff7606             push dword ptr [bp + 6]
6:0ABC  90                   nop
6:0ABD  0e                   push cs
6:0ABE  e857a9               call 0xffffb418  ; sub_s6:B418
6:0AC1  f6460a01             test byte ptr [bp + 0xa], 1
6:0AC5  7409                 je 0xad0
6:0AC7  66ff7606             push dword ptr [bp + 6]
6:0ACB  9ace17df08           lcall 0x8df, 0x17ce  ; operator_delete@s1:17CE
loc_0AD0:
6:0AD0  8b4606               mov ax, word ptr [bp + 6]
6:0AD3  8b5608               mov dx, word ptr [bp + 8]
6:0AD6  c9                   leave
6:0AD7  ca0600               retf 6
6:0ADA  db b4 0a e0 0a 56 bb e8 0a 8e 17 3b 0a ec b5 ec 0a
6:0AEA  db 1a b8 f0 0a 1c bc f4 0a b8 09 f8 0a d4 09 fc 0a
6:0AFA  db 7e bc 00 0b 14 b5 04 0b 2a be 08 0b 16 bf 0c 0b
6:0B0A  db 1a bf 10 0b 1e bf 14 0b 9e be 18 0b 22 bf 1c 0b
6:0B1A  db f0 bb 20 0b 02 bc 24 0b a8 b5 28 0b ca b5 2c 0b
6:0B2A  db e6 b4 30 0b ec b4 34 0b 6e b4 38 0b 4a c6 3c 0b
6:0B3A  db 22 c5 40 0b d2 ce a7 09

; ---------------- sub_s6:0B42 FAR size=34 callers=1
6:0B42  55                   push bp
6:0B43  8bec                 mov bp, sp
6:0B45  66ff7606             push dword ptr [bp + 6]
6:0B49  90                   nop
6:0B4A  0e                   push cs
6:0B4B  e806a8               call 0xffffb354  ; Building::Building()@s6:B354
6:0B4E  c45e06               les bx, ptr [bp + 6]
6:0B51  26c707bc0b           mov word ptr es:[bx], 0xbbc
6:0B56  26c74702dc0a         mov word ptr es:[bx + 2], 0xadc  ; SEGMENT s6:0000
6:0B5C  8bc3                 mov ax, bx
6:0B5E  8cc2                 mov dx, es
6:0B60  c9                   leave
6:0B61  ca0400               retf 4

; ---------------- sub_s6:0B64 FAR size=42 callers=1
6:0B64  55                   push bp
6:0B65  8bec                 mov bp, sp
6:0B67  66ff760c             push dword ptr [bp + 0xc]
6:0B6B  66ff7608             push dword ptr [bp + 8]
6:0B6F  ff7606               push word ptr [bp + 6]
6:0B72  90                   nop
6:0B73  0e                   push cs
6:0B74  e827a8               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:0B77  c45e06               les bx, ptr [bp + 6]
6:0B7A  26c707bc0b           mov word ptr es:[bx], 0xbbc
6:0B7F  26c747025a0b         mov word ptr es:[bx + 2], 0xb5a  ; SEGMENT s6:0000
6:0B85  8bc3                 mov ax, bx
6:0B87  8cc2                 mov dx, es
6:0B89  c9                   leave
6:0B8A  ca0a00               retf 0xa
6:0B8D  db 00

; ---------------- sub_s6:0B8E FAR size=4 callers=0
6:0B8E  ca0400               retf 4
6:0B91  db 00

; ---------------- sub_s6:0B92 FAR size=4 callers=0
6:0B92  ca0400               retf 4
6:0B95  db 00

; ---------------- sub_s6:0B96 FAR size=142 callers=0
6:0B96  c8040000             enter 4, 0
6:0B9A  66ff7606             push dword ptr [bp + 6]
6:0B9E  90                   nop
6:0B9F  0e                   push cs
6:0BA0  e875a8               call 0xffffb418  ; sub_s6:B418
6:0BA3  f6460a01             test byte ptr [bp + 0xa], 1
6:0BA7  7409                 je 0xbb2
6:0BA9  66ff7606             push dword ptr [bp + 6]
6:0BAD  9ace17ce0a           lcall 0xace, 0x17ce  ; operator_delete@s1:17CE
loc_0BB2:
6:0BB2  8b4606               mov ax, word ptr [bp + 6]
6:0BB5  8b5608               mov dx, word ptr [bp + 8]
6:0BB8  c9                   leave
6:0BB9  ca0600               retf 6
6:0BBC  db 96 0b c2 0b 56 bb ca 0b 8e 17 e4 0a ec b5 ce 0b
6:0BCC  db 1a b8 d2 0b 1c bc d6 0b 38 bd da 0b 90 bc de 0b
6:0BDC  db 7e bc e2 0b 14 b5 e6 0b 2a be ea 0b 8e 0b ee 0b
6:0BEC  db 92 0b f2 0b 1e bf f6 0b 9e be fa 0b 22 bf fe 0b
6:0BFC  db f0 bb 02 0c 02 bc 06 0c a8 b5 0a 0c ca b5 0e 0c
6:0C0C  db e6 b4 12 0c ec b4 16 0c 6e b4 1a 0c 4a c6 1e 0c
6:0C1C  db 22 c5 22 0c d2 ce 83 0b

; ---------------- sub_s6:0C24 FAR size=44 callers=1
6:0C24  55                   push bp
6:0C25  8bec                 mov bp, sp
6:0C27  66ff7606             push dword ptr [bp + 6]
6:0C2B  90                   nop
6:0C2C  0e                   push cs
6:0C2D  e824a7               call 0xffffb354  ; Building::Building()@s6:B354
6:0C30  33c0                 xor ax, ax
6:0C32  c45e06               les bx, ptr [bp + 6]
6:0C35  26894720             mov word ptr es:[bx + 0x20], ax
6:0C39  26894722             mov word ptr es:[bx + 0x22], ax
6:0C3D  26c7072417           mov word ptr es:[bx], 0x1724
6:0C42  26c74702be0b         mov word ptr es:[bx + 2], 0xbbe  ; SEGMENT s6:0000
6:0C48  8bc3                 mov ax, bx
6:0C4A  8cc2                 mov dx, es
6:0C4C  c9                   leave
6:0C4D  ca0400               retf 4

; ---------------- sub_s6:0C50 FAR size=52 callers=1
6:0C50  55                   push bp
6:0C51  8bec                 mov bp, sp
6:0C53  66ff760c             push dword ptr [bp + 0xc]
6:0C57  66ff7608             push dword ptr [bp + 8]
6:0C5B  ff7606               push word ptr [bp + 6]
6:0C5E  90                   nop
6:0C5F  0e                   push cs
6:0C60  e83ba7               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:0C63  33c0                 xor ax, ax
6:0C65  c45e06               les bx, ptr [bp + 6]
6:0C68  26894720             mov word ptr es:[bx + 0x20], ax
6:0C6C  26894722             mov word ptr es:[bx + 0x22], ax
6:0C70  26c7072417           mov word ptr es:[bx], 0x1724
6:0C75  26c74702460c         mov word ptr es:[bx + 2], 0xc46  ; SEGMENT s6:0000
6:0C7B  8bc3                 mov ax, bx
6:0C7D  8cc2                 mov dx, es
6:0C7F  c9                   leave
6:0C80  ca0a00               retf 0xa
6:0C83  db 00

; ---------------- sub_s6:0C84 FAR size=252 callers=0
6:0C84  c8380000             enter 0x38, 0
6:0C88  57                   push di
6:0C89  56                   push si
6:0C8A  66ff7606             push dword ptr [bp + 6]
6:0C8E  90                   nop
6:0C8F  0e                   push cs
6:0C90  e8fba8               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:0C93  8946fc               mov word ptr [bp - 4], ax
6:0C96  8956fe               mov word ptr [bp - 2], dx
6:0C99  050c00               add ax, 0xc
6:0C9C  1e                   push ds
6:0C9D  8d7ef6               lea di, [bp - 0xa]
6:0CA0  8bf0                 mov si, ax
6:0CA2  16                   push ss
6:0CA3  07                   pop es
6:0CA4  8eda                 mov ds, dx
6:0CA6  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:0CA8  a5                   movsw word ptr es:[di], word ptr [si]
6:0CA9  1f                   pop ds
6:0CAA  8d46f6               lea ax, [bp - 0xa]
6:0CAD  8946e6               mov word ptr [bp - 0x1a], ax
6:0CB0  8b46fa               mov ax, word ptr [bp - 6]
6:0CB3  8946f4               mov word ptr [bp - 0xc], ax
6:0CB6  66ff7606             push dword ptr [bp + 6]
6:0CBA  90                   nop
6:0CBB  0e                   push cs
6:0CBC  e8f7ad               call 0xffffbab6  ; sub_s6:BAB6
6:0CBF  8946f0               mov word ptr [bp - 0x10], ax
6:0CC2  8956f2               mov word ptr [bp - 0xe], dx
6:0CC5  52                   push dx
6:0CC6  50                   push ax
6:0CC7  9aac2f100d           lcall 0xd10, 0x2fac  ; sub_s7:2FAC
6:0CCC  8946ee               mov word ptr [bp - 0x12], ax
6:0CCF  8d7ee8               lea di, [bp - 0x18]
6:0CD2  8d76f6               lea si, [bp - 0xa]
6:0CD5  8cd0                 mov ax, ss
6:0CD7  8ec0                 mov es, ax
6:0CD9  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:0CDB  a5                   movsw word ptr es:[di], word ptr [si]
6:0CDC  8d46e8               lea ax, [bp - 0x18]
6:0CDF  8946de               mov word ptr [bp - 0x22], ax
6:0CE2  8b46ee               mov ax, word ptr [bp - 0x12]
6:0CE5  ff46f4               inc word ptr [bp - 0xc]
6:0CE8  3946f4               cmp word ptr [bp - 0xc], ax
6:0CEB  7f77                 jg 0xd64
6:0CED  8b46f4               mov ax, word ptr [bp - 0xc]
6:0CF0  8946ec               mov word ptr [bp - 0x14], ax
6:0CF3  8d46d0               lea ax, [bp - 0x30]
6:0CF6  16                   push ss
6:0CF7  50                   push ax
6:0CF8  66ff7606             push dword ptr [bp + 6]
6:0CFC  90                   nop
6:0CFD  0e                   push cs
6:0CFE  e823ae               call 0xffffbb24  ; sub_s6:BB24
6:0D01  52                   push dx
6:0D02  50                   push ax
6:0D03  8d46e8               lea ax, [bp - 0x18]
6:0D06  16                   push ss
6:0D07  50                   push ax
6:0D08  66ff364057           push dword ptr [0x5740]
6:0D0D  9ace644c0d           lcall 0xd4c, 0x64ce  ; sub_s7:64CE
6:0D12  8bd8                 mov bx, ax
6:0D14  8ec2                 mov es, dx
6:0D16  66268b07             mov eax, dword ptr es:[bx]
6:0D1A  268b5702             mov dx, word ptr es:[bx + 2]
6:0D1E  668946da             mov dword ptr [bp - 0x26], eax
6:0D22  668946de             mov dword ptr [bp - 0x22], eax
6:0D26  668946c8             mov dword ptr [bp - 0x38], eax
6:0D2A  8a46cb               mov al, byte ptr [bp - 0x35]
6:0D2D  2ae4                 sub ah, ah
6:0D2F  a8ff                 test al, 0xff
6:0D31  7431                 je 0xd64
6:0D33  52                   push dx
6:0D34  ff76da               push word ptr [bp - 0x26]
6:0D37  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:0D3C  90                   nop
6:0D3D  0e                   push cs
6:0D3E  e8abd4               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:0D41  8946c8               mov word ptr [bp - 0x38], ax
6:0D44  8956ca               mov word ptr [bp - 0x36], dx
6:0D47  52                   push dx
6:0D48  50                   push ax
6:0D49  9aa873780d           lcall 0xd78, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:0D4E  8946cc               mov word ptr [bp - 0x34], ax
6:0D51  8956ce               mov word ptr [bp - 0x32], dx
6:0D54  66ff760a             push dword ptr [bp + 0xa]
6:0D58  52                   push dx
6:0D59  c45ecc               les bx, ptr [bp - 0x34]
6:0D5C  50                   push ax
6:0D5D  26c41f               les bx, ptr es:[bx]
6:0D60  26ff5f58             lcall es:[bx + 0x58]
loc_0D64:
6:0D64  66ff760a             push dword ptr [bp + 0xa]
6:0D68  66ff7606             push dword ptr [bp + 6]
6:0D6C  90                   nop
6:0D6D  0e                   push cs
6:0D6E  e8fda6               call 0xffffb46e  ; sub_s6:B46E
6:0D71  66ff76fc             push dword ptr [bp - 4]
6:0D75  9a9672c60b           lcall 0xbc6, 0x7296  ; sub_s7:7296
6:0D7A  5e                   pop si
6:0D7B  5f                   pop di
6:0D7C  c9                   leave
6:0D7D  ca0800               retf 8

; ---------------- sub_s6:0D80 FAR size=28 callers=2
6:0D80  c8020000             enter 2, 0
6:0D84  c45e06               les bx, ptr [bp + 6]
6:0D87  268b4720             mov ax, word ptr es:[bx + 0x20]
6:0D8B  8946fe               mov word ptr [bp - 2], ax
6:0D8E  06                   push es
6:0D8F  53                   push bx
6:0D90  90                   nop
6:0D91  0e                   push cs
6:0D92  e8b108               call 0x1646  ; sub_s6:1646
6:0D95  8b46fe               mov ax, word ptr [bp - 2]
6:0D98  c9                   leave
6:0D99  ca0400               retf 4

; ---------------- sub_s6:0D9C size=266 callers=0
6:0D9C  c8380000             enter 0x38, 0
6:0DA0  57                   push di
6:0DA1  56                   push si
6:0DA2  66ff7606             push dword ptr [bp + 6]
6:0DA6  90                   nop
6:0DA7  0e                   push cs
6:0DA8  e869a7               call 0xffffb514  ; sub_s6:B514
6:0DAB  66ff7606             push dword ptr [bp + 6]
6:0DAF  90                   nop
6:0DB0  0e                   push cs
6:0DB1  e8daa7               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:0DB4  8946fc               mov word ptr [bp - 4], ax
6:0DB7  8956fe               mov word ptr [bp - 2], dx
6:0DBA  050c00               add ax, 0xc
6:0DBD  1e                   push ds
6:0DBE  8d7ef6               lea di, [bp - 0xa]
6:0DC1  8bf0                 mov si, ax
6:0DC3  16                   push ss
6:0DC4  07                   pop es
6:0DC5  8eda                 mov ds, dx
6:0DC7  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:0DC9  a5                   movsw word ptr es:[di], word ptr [si]
6:0DCA  1f                   pop ds
6:0DCB  8d46f6               lea ax, [bp - 0xa]
6:0DCE  8946e6               mov word ptr [bp - 0x1a], ax
6:0DD1  8b46fa               mov ax, word ptr [bp - 6]
6:0DD4  8946f4               mov word ptr [bp - 0xc], ax
6:0DD7  66ff7606             push dword ptr [bp + 6]
6:0DDB  90                   nop
6:0DDC  0e                   push cs
6:0DDD  e8d6ac               call 0xffffbab6  ; sub_s6:BAB6
6:0DE0  8946f0               mov word ptr [bp - 0x10], ax
6:0DE3  8956f2               mov word ptr [bp - 0xe], dx
6:0DE6  52                   push dx
6:0DE7  50                   push ax
6:0DE8  9aac2f330e           lcall 0xe33, 0x2fac  ; sub_s7:2FAC
6:0DED  8946ee               mov word ptr [bp - 0x12], ax
6:0DF0  8d7ee8               lea di, [bp - 0x18]
6:0DF3  8d76f6               lea si, [bp - 0xa]
6:0DF6  8cd0                 mov ax, ss
6:0DF8  8ec0                 mov es, ax
6:0DFA  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:0DFC  a5                   movsw word ptr es:[di], word ptr [si]
6:0DFD  8d46e8               lea ax, [bp - 0x18]
6:0E00  8946de               mov word ptr [bp - 0x22], ax
6:0E03  8b46ee               mov ax, word ptr [bp - 0x12]
6:0E06  ff46f4               inc word ptr [bp - 0xc]
6:0E09  3946f4               cmp word ptr [bp - 0xc], ax
6:0E0C  0f8f9000             jg 0xea0
6:0E10  8b46f4               mov ax, word ptr [bp - 0xc]
6:0E13  8946ec               mov word ptr [bp - 0x14], ax
6:0E16  8d46d0               lea ax, [bp - 0x30]
6:0E19  16                   push ss
6:0E1A  50                   push ax
6:0E1B  66ff7606             push dword ptr [bp + 6]
6:0E1F  90                   nop
6:0E20  0e                   push cs
6:0E21  e800ad               call 0xffffbb24  ; sub_s6:BB24
6:0E24  52                   push dx
6:0E25  50                   push ax
6:0E26  8d46e8               lea ax, [bp - 0x18]
6:0E29  16                   push ss
6:0E2A  50                   push ax
6:0E2B  66ff364057           push dword ptr [0x5740]
6:0E30  9ace646f0e           lcall 0xe6f, 0x64ce  ; sub_s7:64CE
6:0E35  8bd8                 mov bx, ax
6:0E37  8ec2                 mov es, dx
6:0E39  66268b07             mov eax, dword ptr es:[bx]
6:0E3D  268b5702             mov dx, word ptr es:[bx + 2]
6:0E41  668946da             mov dword ptr [bp - 0x26], eax
6:0E45  668946de             mov dword ptr [bp - 0x22], eax
6:0E49  668946c8             mov dword ptr [bp - 0x38], eax
6:0E4D  8a46cb               mov al, byte ptr [bp - 0x35]
6:0E50  2ae4                 sub ah, ah
6:0E52  a8ff                 test al, 0xff
6:0E54  744a                 je 0xea0
6:0E56  52                   push dx
6:0E57  ff76da               push word ptr [bp - 0x26]
6:0E5A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:0E5F  90                   nop
6:0E60  0e                   push cs
6:0E61  e888d3               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:0E64  8946c8               mov word ptr [bp - 0x38], ax
6:0E67  8956ca               mov word ptr [bp - 0x36], dx
6:0E6A  52                   push dx
6:0E6B  50                   push ax
6:0E6C  9aa06f8c0e           lcall 0xe8c, 0x6fa0  ; sub_s7:6FA0
6:0E71  8946cc               mov word ptr [bp - 0x34], ax
6:0E74  6a13                 push 0x13
6:0E76  50                   push ax
6:0E77  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:0E7C  9aaec63306           lcall 0x633, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:0E81  0bc0                 or ax, ax
6:0E83  741b                 je 0xea0
6:0E85  66ff76c8             push dword ptr [bp - 0x38]
6:0E89  9aa873ca0c           lcall 0xcca, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:0E8E  8946d6               mov word ptr [bp - 0x2a], ax
6:0E91  8956d8               mov word ptr [bp - 0x28], dx
6:0E94  52                   push dx
6:0E95  c45ed6               les bx, ptr [bp - 0x2a]
6:0E98  50                   push ax
6:0E99  26c41f               les bx, ptr es:[bx]
6:0E9C  26ff5f24             lcall es:[bx + 0x24]
loc_0EA0:
6:0EA0  5e                   pop si
6:0EA1  5f                   pop di
6:0EA2  c9                   leave
6:0EA3  ca0400               retf 4

; ---------------- sub_s6:0EA6 size=254 callers=0
6:0EA6  c8180000             enter 0x18, 0
6:0EAA  57                   push di
6:0EAB  56                   push si
6:0EAC  c45e06               les bx, ptr [bp + 6]
6:0EAF  26837f0c10           cmp word ptr es:[bx + 0xc], 0x10
6:0EB4  0f84e500             je 0xf9d
6:0EB8  6a13                 push 0x13
6:0EBA  26ff770c             push word ptr es:[bx + 0xc]
6:0EBE  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:0EC3  9aaec6270f           lcall 0xf27, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:0EC8  0bc0                 or ax, ax
6:0ECA  744a                 je 0xf16
6:0ECC  c45e06               les bx, ptr [bp + 6]
6:0ECF  26837f2200           cmp word ptr es:[bx + 0x22], 0
6:0ED4  0f8f8a00             jg 0xf62
6:0ED8  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:0EDD  7409                 je 0xee8
6:0EDF  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:0EE4  0f85b500             jne 0xf9d
loc_0EE8:
6:0EE8  66268b4714           mov eax, dword ptr es:[bx + 0x14]
6:0EED  668946fc             mov dword ptr [bp - 4], eax
6:0EF1  668946f8             mov dword ptr [bp - 8], eax
6:0EF5  6650                 push eax
6:0EF7  9ace17b00b           lcall 0xbb0, 0x17ce  ; operator_delete@s1:17CE
6:0EFC  83c404               add sp, 4
6:0EFF  c45e06               les bx, ptr [bp + 6]
6:0F02  662bc0               sub eax, eax
6:0F05  6626894714           mov dword ptr es:[bx + 0x14], eax
loc_0F0A:
6:0F0A  26c747120900         mov word ptr es:[bx + 0x12], 9
6:0F10  5e                   pop si
6:0F11  5f                   pop di
6:0F12  c9                   leave
6:0F13  ca0400               retf 4
loc_0F16:
6:0F16  6a02                 push 2
6:0F18  c45e06               les bx, ptr [bp + 6]
6:0F1B  26ff770c             push word ptr es:[bx + 0xc]
6:0F1F  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:0F24  9aaec67f0e           lcall 0xe7f, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:0F29  0bc0                 or ax, ax
6:0F2B  7435                 je 0xf62
6:0F2D  c45e06               les bx, ptr [bp + 6]
6:0F30  26837f1207           cmp word ptr es:[bx + 0x12], 7
6:0F35  742b                 je 0xf62
6:0F37  26837f1204           cmp word ptr es:[bx + 0x12], 4
6:0F3C  7424                 je 0xf62
6:0F3E  06                   push es
6:0F3F  53                   push bx
6:0F40  90                   nop
6:0F41  0e                   push cs
6:0F42  e81106               call 0x1556  ; sub_s6:1556
6:0F45  8946f8               mov word ptr [bp - 8], ax
6:0F48  0bc0                 or ax, ax
6:0F4A  7506                 jne 0xf52
6:0F4C  c45e06               les bx, ptr [bp + 6]
6:0F4F  ebb9                 jmp 0xf0a
6:0F51  db 90
loc_0F52:
6:0F52  c45e06               les bx, ptr [bp + 6]
6:0F55  26837f1209           cmp word ptr es:[bx + 0x12], 9
6:0F5A  7506                 jne 0xf62
6:0F5C  26c747120500         mov word ptr es:[bx + 0x12], 5
loc_0F62:
6:0F62  66ff7606             push dword ptr [bp + 6]
6:0F66  90                   nop
6:0F67  0e                   push cs
6:0F68  e8bfae               call 0xffffbe2a  ; sub_s6:BE2A
6:0F6B  c45e06               les bx, ptr [bp + 6]
6:0F6E  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:0F73  7528                 jne 0xf9d
6:0F75  26ff4f22             dec word ptr es:[bx + 0x22]
6:0F79  06                   push es
6:0F7A  53                   push bx
6:0F7B  90                   nop
6:0F7C  0e                   push cs
6:0F7D  e80ea6               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:0F80  8946f8               mov word ptr [bp - 8], ax
6:0F83  8956fa               mov word ptr [bp - 6], dx
6:0F86  050c00               add ax, 0xc
6:0F89  1e                   push ds
6:0F8A  8d7ef2               lea di, [bp - 0xe]
6:0F8D  8bf0                 mov si, ax
6:0F8F  16                   push ss
6:0F90  07                   pop es
6:0F91  8eda                 mov ds, dx
6:0F93  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:0F95  a5                   movsw word ptr es:[di], word ptr [si]
6:0F96  1f                   pop ds
6:0F97  8d46f2               lea ax, [bp - 0xe]
6:0F9A  8946f0               mov word ptr [bp - 0x10], ax
loc_0F9D:
6:0F9D  5e                   pop si
6:0F9E  5f                   pop di
6:0F9F  c9                   leave
6:0FA0  ca0400               retf 4
6:0FA3  db 00

; ---------------- sub_s6:0FA4 FAR size=128 callers=0
6:0FA4  c80a0000             enter 0xa, 0
6:0FA8  66ff7606             push dword ptr [bp + 6]
6:0FAC  90                   nop
6:0FAD  0e                   push cs
6:0FAE  e8edae               call 0xffffbe9e  ; sub_s6:BE9E
6:0FB1  6a02                 push 2
6:0FB3  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:0FB8  9aba20ffff           lcall 0xffff, 0x20ba  ; sub_s3:20BA
6:0FBD  8946fc               mov word ptr [bp - 4], ax
6:0FC0  8956fe               mov word ptr [bp - 2], dx
6:0FC3  c45efc               les bx, ptr [bp - 4]
6:0FC6  268b878200           mov ax, word ptr es:[bx + 0x82]
6:0FCB  8946fa               mov word ptr [bp - 6], ax
6:0FCE  c45e06               les bx, ptr [bp + 6]
6:0FD1  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:0FD6  7548                 jne 0x1020
6:0FD8  6a02                 push 2
6:0FDA  26ff770c             push word ptr es:[bx + 0xc]
6:0FDE  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:0FE3  9aaec6c60e           lcall 0xec6, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:0FE8  0bc0                 or ax, ax
6:0FEA  742b                 je 0x1017
6:0FEC  833ebc4f00           cmp word ptr [0x4fbc], 0
6:0FF1  7406                 je 0xff9
6:0FF3  837efa00             cmp word ptr [bp - 6], 0
6:0FF7  741e                 je 0x1017
loc_0FF9:
6:0FF9  c706bc4f0100         mov word ptr [0x4fbc], 1
6:0FFF  666800000400         push 0x40000
6:1005  6a01                 push 1
6:1007  66ff7606             push dword ptr [bp + 6]
6:100B  90                   nop
6:100C  0e                   push cs
6:100D  e87ea5               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:1010  52                   push dx
6:1011  50                   push ax
6:1012  9a507ceb0d           lcall 0xdeb, 0x7c50  ; sub_s7:7C50
loc_1017:
6:1017  c45e06               les bx, ptr [bp + 6]
6:101A  26c747226400         mov word ptr es:[bx + 0x22], 0x64
loc_1020:
6:1020  c9                   leave
6:1021  ca0400               retf 4

; ---------------- sub_s6:1024 FAR size=226 callers=1
6:1024  c8320000             enter 0x32, 0
6:1028  57                   push di
6:1029  56                   push si
6:102A  66ff7606             push dword ptr [bp + 6]
6:102E  90                   nop
6:102F  0e                   push cs
6:1030  e883aa               call 0xffffbab6  ; sub_s6:BAB6
6:1033  8946fc               mov word ptr [bp - 4], ax
6:1036  8956fe               mov word ptr [bp - 2], dx
6:1039  52                   push dx
6:103A  50                   push ax
6:103B  9aac2fcc10           lcall 0x10cc, 0x2fac  ; sub_s7:2FAC
6:1040  8946fa               mov word ptr [bp - 6], ax
6:1043  66ff7606             push dword ptr [bp + 6]
6:1047  90                   nop
6:1048  0e                   push cs
6:1049  e8d8aa               call 0xffffbb24  ; sub_s6:BB24
6:104C  8946f6               mov word ptr [bp - 0xa], ax
6:104F  8956f8               mov word ptr [bp - 8], dx
6:1052  66ff7606             push dword ptr [bp + 6]
6:1056  90                   nop
6:1057  0e                   push cs
6:1058  e833a5               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:105B  8946f2               mov word ptr [bp - 0xe], ax
6:105E  8956f4               mov word ptr [bp - 0xc], dx
6:1061  050c00               add ax, 0xc
6:1064  1e                   push ds
6:1065  8d7eec               lea di, [bp - 0x14]
6:1068  8bf0                 mov si, ax
6:106A  16                   push ss
6:106B  07                   pop es
6:106C  8eda                 mov ds, dx
6:106E  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:1070  a5                   movsw word ptr es:[di], word ptr [si]
6:1071  1f                   pop ds
6:1072  8d46ec               lea ax, [bp - 0x14]
6:1075  8946e6               mov word ptr [bp - 0x1a], ax
6:1078  66c746e800000000     mov dword ptr [bp - 0x18], 0
6:1080  eb2b                 jmp 0x10ad
loc_1082:
6:1082  c45ed6               les bx, ptr [bp - 0x2a]
6:1085  268b470c             mov ax, word ptr es:[bx + 0xc]
6:1089  8946e6               mov word ptr [bp - 0x1a], ax
6:108C  6a13                 push 0x13
6:108E  50                   push ax
6:108F  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:1094  9aaec6e60f           lcall 0xfe6, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:1099  0bc0                 or ax, ax
6:109B  740d                 je 0x10aa
6:109D  c45ed6               les bx, ptr [bp - 0x2a]
6:10A0  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:10A5  7503                 jne 0x10aa
6:10A7  ff46ea               inc word ptr [bp - 0x16]
loc_10AA:
6:10AA  ff46e8               inc word ptr [bp - 0x18]
loc_10AD:
6:10AD  8b46fa               mov ax, word ptr [bp - 6]
6:10B0  3946e8               cmp word ptr [bp - 0x18], ax
6:10B3  7f48                 jg 0x10fd
6:10B5  8b46e8               mov ax, word ptr [bp - 0x18]
6:10B8  8946f0               mov word ptr [bp - 0x10], ax
6:10BB  66ff76f6             push dword ptr [bp - 0xa]
6:10BF  8d46ec               lea ax, [bp - 0x14]
6:10C2  16                   push ss
6:10C3  50                   push ax
6:10C4  66ff364057           push dword ptr [0x5740]
6:10C9  9a7e62f110           lcall 0x10f1, 0x627e  ; sub_s7:627E
6:10CE  8946de               mov word ptr [bp - 0x22], ax
6:10D1  8956e0               mov word ptr [bp - 0x20], dx
6:10D4  52                   push dx
6:10D5  50                   push ax
6:10D6  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:10DB  90                   nop
6:10DC  0e                   push cs
6:10DD  e80cd1               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:10E0  8946da               mov word ptr [bp - 0x26], ax
6:10E3  8956dc               mov word ptr [bp - 0x24], dx
6:10E6  0bd0                 or dx, ax
6:10E8  7413                 je 0x10fd
6:10EA  ff76dc               push word ptr [bp - 0x24]
6:10ED  50                   push ax
6:10EE  9aa8731510           lcall 0x1015, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:10F3  8946d6               mov word ptr [bp - 0x2a], ax
6:10F6  8956d8               mov word ptr [bp - 0x28], dx
6:10F9  0bd0                 or dx, ax
6:10FB  7585                 jne 0x1082
loc_10FD:
6:10FD  8b46ea               mov ax, word ptr [bp - 0x16]
6:1100  5e                   pop si
6:1101  5f                   pop di
6:1102  c9                   leave
6:1103  ca0400               retf 4

; ---------------- sub_s6:1106 FAR size=216 callers=1
6:1106  c8320000             enter 0x32, 0
6:110A  57                   push di
6:110B  56                   push si
6:110C  66ff7606             push dword ptr [bp + 6]
6:1110  90                   nop
6:1111  0e                   push cs
6:1112  e8a1a9               call 0xffffbab6  ; sub_s6:BAB6
6:1115  8946fc               mov word ptr [bp - 4], ax
6:1118  8956fe               mov word ptr [bp - 2], dx
6:111B  52                   push dx
6:111C  50                   push ax
6:111D  9aac2fa411           lcall 0x11a4, 0x2fac  ; sub_s7:2FAC
6:1122  8946fa               mov word ptr [bp - 6], ax
6:1125  66ff7606             push dword ptr [bp + 6]
6:1129  90                   nop
6:112A  0e                   push cs
6:112B  e8f6a9               call 0xffffbb24  ; sub_s6:BB24
6:112E  8946f6               mov word ptr [bp - 0xa], ax
6:1131  8956f8               mov word ptr [bp - 8], dx
6:1134  66ff7606             push dword ptr [bp + 6]
6:1138  90                   nop
6:1139  0e                   push cs
6:113A  e851a4               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:113D  8946f2               mov word ptr [bp - 0xe], ax
6:1140  8956f4               mov word ptr [bp - 0xc], dx
6:1143  050c00               add ax, 0xc
6:1146  1e                   push ds
6:1147  8d7eec               lea di, [bp - 0x14]
6:114A  8bf0                 mov si, ax
6:114C  16                   push ss
6:114D  07                   pop es
6:114E  8eda                 mov ds, dx
6:1150  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:1152  a5                   movsw word ptr es:[di], word ptr [si]
6:1153  1f                   pop ds
6:1154  8d46ec               lea ax, [bp - 0x14]
6:1157  8946e6               mov word ptr [bp - 0x1a], ax
6:115A  66c746e800000000     mov dword ptr [bp - 0x18], 0
6:1162  eb21                 jmp 0x1185
loc_1164:
6:1164  c45ed6               les bx, ptr [bp - 0x2a]
6:1167  268b470c             mov ax, word ptr es:[bx + 0xc]
6:116B  8946e6               mov word ptr [bp - 0x1a], ax
6:116E  6a13                 push 0x13
6:1170  50                   push ax
6:1171  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:1176  9aaec69710           lcall 0x1097, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:117B  0bc0                 or ax, ax
6:117D  7403                 je 0x1182
6:117F  ff46ea               inc word ptr [bp - 0x16]
loc_1182:
6:1182  ff46e8               inc word ptr [bp - 0x18]
loc_1185:
6:1185  8b46fa               mov ax, word ptr [bp - 6]
6:1188  3946e8               cmp word ptr [bp - 0x18], ax
6:118B  7f48                 jg 0x11d5
6:118D  8b46e8               mov ax, word ptr [bp - 0x18]
6:1190  8946f0               mov word ptr [bp - 0x10], ax
6:1193  66ff76f6             push dword ptr [bp - 0xa]
6:1197  8d46ec               lea ax, [bp - 0x14]
6:119A  16                   push ss
6:119B  50                   push ax
6:119C  66ff364057           push dword ptr [0x5740]
6:11A1  9a7e62c911           lcall 0x11c9, 0x627e  ; sub_s7:627E
6:11A6  8946de               mov word ptr [bp - 0x22], ax
6:11A9  8956e0               mov word ptr [bp - 0x20], dx
6:11AC  52                   push dx
6:11AD  50                   push ax
6:11AE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:11B3  90                   nop
6:11B4  0e                   push cs
6:11B5  e834d0               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:11B8  8946da               mov word ptr [bp - 0x26], ax
6:11BB  8956dc               mov word ptr [bp - 0x24], dx
6:11BE  0bd0                 or dx, ax
6:11C0  7413                 je 0x11d5
6:11C2  ff76dc               push word ptr [bp - 0x24]
6:11C5  50                   push ax
6:11C6  9aa8733e10           lcall 0x103e, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:11CB  8946d6               mov word ptr [bp - 0x2a], ax
6:11CE  8956d8               mov word ptr [bp - 0x28], dx
6:11D1  0bd0                 or dx, ax
6:11D3  758f                 jne 0x1164
loc_11D5:
6:11D5  8b46ea               mov ax, word ptr [bp - 0x16]
6:11D8  5e                   pop si
6:11D9  5f                   pop di
6:11DA  c9                   leave
6:11DB  ca0400               retf 4

; ---------------- sub_s6:11DE FAR size=64 callers=3
6:11DE  c8160000             enter 0x16, 0
6:11E2  57                   push di
6:11E3  56                   push si
6:11E4  66ff7606             push dword ptr [bp + 6]
6:11E8  90                   nop
6:11E9  0e                   push cs
6:11EA  e8a1a3               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:11ED  8946fc               mov word ptr [bp - 4], ax
6:11F0  8956fe               mov word ptr [bp - 2], dx
6:11F3  050c00               add ax, 0xc
6:11F6  1e                   push ds
6:11F7  8d7ef6               lea di, [bp - 0xa]
6:11FA  8bf0                 mov si, ax
6:11FC  16                   push ss
6:11FD  07                   pop es
6:11FE  8eda                 mov ds, dx
6:1200  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:1202  a5                   movsw word ptr es:[di], word ptr [si]
6:1203  1f                   pop ds
6:1204  8d46f6               lea ax, [bp - 0xa]
6:1207  8946f2               mov word ptr [bp - 0xe], ax
6:120A  8b46fa               mov ax, word ptr [bp - 6]
6:120D  8946f4               mov word ptr [bp - 0xc], ax
6:1210  3d0100               cmp ax, 1
6:1213  1bc0                 sbb ax, ax
6:1215  f7d8                 neg ax
6:1217  5e                   pop si
6:1218  5f                   pop di
6:1219  c9                   leave
6:121A  ca0400               retf 4
6:121D  db 00

; ---------------- sub_s6:121E FAR size=160 callers=4
6:121E  c8240000             enter 0x24, 0
6:1222  57                   push di
6:1223  56                   push si
6:1224  66ff7606             push dword ptr [bp + 6]
6:1228  90                   nop
6:1229  0e                   push cs
6:122A  e8b1ff               call 0x11de  ; sub_s6:11DE
6:122D  0bc0                 or ax, ax
6:122F  740d                 je 0x123e
6:1231  8b4606               mov ax, word ptr [bp + 6]
6:1234  8b5608               mov dx, word ptr [bp + 8]
6:1237  5e                   pop si
6:1238  5f                   pop di
6:1239  c9                   leave
6:123A  ca0400               retf 4
6:123D  db 90
loc_123E:
6:123E  66ff7606             push dword ptr [bp + 6]
6:1242  90                   nop
6:1243  0e                   push cs
6:1244  e847a3               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:1247  8946fc               mov word ptr [bp - 4], ax
6:124A  8956fe               mov word ptr [bp - 2], dx
6:124D  050c00               add ax, 0xc
6:1250  1e                   push ds
6:1251  8d7ef6               lea di, [bp - 0xa]
6:1254  8bf0                 mov si, ax
6:1256  16                   push ss
6:1257  07                   pop es
6:1258  8eda                 mov ds, dx
6:125A  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:125C  a5                   movsw word ptr es:[di], word ptr [si]
6:125D  1f                   pop ds
6:125E  8d46f6               lea ax, [bp - 0xa]
6:1261  8946e8               mov word ptr [bp - 0x18], ax
6:1264  c746fa0000           mov word ptr [bp - 6], 0
6:1269  66ff7606             push dword ptr [bp + 6]
6:126D  90                   nop
6:126E  0e                   push cs
6:126F  e8b2a8               call 0xffffbb24  ; sub_s6:BB24
6:1272  8946f2               mov word ptr [bp - 0xe], ax
6:1275  8956f4               mov word ptr [bp - 0xc], dx
6:1278  52                   push dx
6:1279  50                   push ax
6:127A  8d46f6               lea ax, [bp - 0xa]
6:127D  16                   push ss
6:127E  50                   push ax
6:127F  66ff364057           push dword ptr [0x5740]
6:1284  9a7e62b512           lcall 0x12b5, 0x627e  ; sub_s7:627E
6:1289  8946ee               mov word ptr [bp - 0x12], ax
6:128C  8956f0               mov word ptr [bp - 0x10], dx
6:128F  52                   push dx
6:1290  50                   push ax
6:1291  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:1296  90                   nop
6:1297  0e                   push cs
6:1298  e851cf               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:129B  8946ea               mov word ptr [bp - 0x16], ax
6:129E  8956ec               mov word ptr [bp - 0x14], dx
6:12A1  0bd0                 or dx, ax
6:12A3  7509                 jne 0x12ae
6:12A5  33c0                 xor ax, ax
6:12A7  99                   cdq
6:12A8  5e                   pop si
6:12A9  5f                   pop di
6:12AA  c9                   leave
6:12AB  ca0400               retf 4
loc_12AE:
6:12AE  ff76ec               push word ptr [bp - 0x14]
6:12B1  50                   push ax
6:12B2  9aa8732011           lcall 0x1120, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:12B7  5e                   pop si
6:12B8  5f                   pop di
6:12B9  c9                   leave
6:12BA  ca0400               retf 4
6:12BD  db 00

; ---------------- sub_s6:12BE FAR size=140 callers=0
6:12BE  c80a0000             enter 0xa, 0
6:12C2  66ff7606             push dword ptr [bp + 6]
6:12C6  90                   nop
6:12C7  0e                   push cs
6:12C8  e813ff               call 0x11de  ; sub_s6:11DE
6:12CB  0bc0                 or ax, ax
6:12CD  7523                 jne 0x12f2
6:12CF  66ff7606             push dword ptr [bp + 6]
6:12D3  90                   nop
6:12D4  0e                   push cs
6:12D5  e846ff               call 0x121e  ; sub_s6:121E
6:12D8  8946f6               mov word ptr [bp - 0xa], ax
6:12DB  8956f8               mov word ptr [bp - 8], dx
6:12DE  66ff760a             push dword ptr [bp + 0xa]
6:12E2  52                   push dx
6:12E3  c45ef6               les bx, ptr [bp - 0xa]
6:12E6  50                   push ax
6:12E7  26c41f               les bx, ptr es:[bx]
6:12EA  26ff5f40             lcall es:[bx + 0x40]
6:12EE  c9                   leave
6:12EF  ca0800               retf 8
loc_12F2:
6:12F2  c45e0a               les bx, ptr [bp + 0xa]
6:12F5  6626c70700000000     mov dword ptr es:[bx], 0
6:12FD  66ff7606             push dword ptr [bp + 6]
6:1301  90                   nop
6:1302  0e                   push cs
6:1303  e888a2               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:1306  8946fc               mov word ptr [bp - 4], ax
6:1309  8956fe               mov word ptr [bp - 2], dx
6:130C  c746fa0400           mov word ptr [bp - 6], 4
loc_1311:
6:1311  ff76fa               push word ptr [bp - 6]
6:1314  66ff76fc             push dword ptr [bp - 4]
6:1318  9a287c8712           lcall 0x1287, 0x7c28  ; sub_s7:7C28
6:131D  c45e0a               les bx, ptr [bp + 0xa]
6:1320  260107               add word ptr es:[bx], ax
6:1323  26115702             adc word ptr es:[bx + 2], dx
6:1327  ff46fa               inc word ptr [bp - 6]
6:132A  837efa0d             cmp word ptr [bp - 6], 0xd
6:132E  7ee1                 jle 0x1311
6:1330  c45e0a               les bx, ptr [bp + 0xa]
6:1333  6626813ff4010000     cmp dword ptr es:[bx], 0x1f4
6:133B  7607                 jbe 0x1344
6:133D  b80100               mov ax, 1
6:1340  c9                   leave
6:1341  ca0800               retf 8
loc_1344:
6:1344  33c0                 xor ax, ax
6:1346  c9                   leave
6:1347  ca0800               retf 8

; ---------------- Mine::mine@s6:134A size=204 callers=0
6:134A  c81a0000             enter 0x1a, 0
6:134E  6a13                 push 0x13
6:1350  c45e06               les bx, ptr [bp + 6]
6:1353  26ff770c             push word ptr es:[bx + 0xc]
6:1357  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:135C  9aaec67911           lcall 0x1179, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:1361  0bc0                 or ax, ax
6:1363  0f84aa00             je 0x1411
6:1367  8d46fc               lea ax, [bp - 4]
6:136A  16                   push ss
6:136B  50                   push ax
6:136C  c45e06               les bx, ptr [bp + 6]
6:136F  06                   push es
6:1370  53                   push bx
6:1371  26c41f               les bx, ptr es:[bx]
6:1374  26ff5f40             lcall es:[bx + 0x40]
6:1378  0bc0                 or ax, ax
6:137A  740c                 je 0x1388
6:137C  c45e06               les bx, ptr [bp + 6]
6:137F  26ff4722             inc word ptr es:[bx + 0x22]
6:1383  c9                   leave
6:1384  ca0400               retf 4
6:1387  db 90
loc_1388:
6:1388  66b8f4010000         mov eax, 0x1f4
6:138E  662b46fc             sub eax, dword ptr [bp - 4]
6:1392  668946f8             mov dword ptr [bp - 8], eax
6:1396  66ff7606             push dword ptr [bp + 6]
6:139A  90                   nop
6:139B  0e                   push cs
6:139C  e87ffe               call 0x121e  ; sub_s6:121E
6:139F  8946f4               mov word ptr [bp - 0xc], ax
6:13A2  8956f6               mov word ptr [bp - 0xa], dx
6:13A5  52                   push dx
6:13A6  50                   push ax
6:13A7  90                   nop
6:13A8  0e                   push cs
6:13A9  e8e2a1               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:13AC  8946f0               mov word ptr [bp - 0x10], ax
6:13AF  8956f2               mov word ptr [bp - 0xe], dx
6:13B2  c746ee0a00           mov word ptr [bp - 0x12], 0xa
6:13B7  c746ec0000           mov word ptr [bp - 0x14], 0
6:13BC  eb03                 jmp 0x13c1
loc_13BE:
6:13BE  ff46ec               inc word ptr [bp - 0x14]
loc_13C1:
6:13C1  8b46ee               mov ax, word ptr [bp - 0x12]
6:13C4  3946ec               cmp word ptr [bp - 0x14], ax
6:13C7  7d48                 jge 0x1411
6:13C9  8b5eec               mov bx, word ptr [bp - 0x14]
6:13CC  03db                 add bx, bx
6:13CE  660fbf87be4f         movsx eax, word ptr [bx + 0x4fbe]
6:13D4  668bd0               mov edx, eax
6:13D7  66c1ea10             shr edx, 0x10
6:13DB  663b46f8             cmp eax, dword ptr [bp - 8]
6:13DF  7e06                 jle 0x13e7
6:13E1  8b46f8               mov ax, word ptr [bp - 8]
6:13E4  8b56fa               mov dx, word ptr [bp - 6]
loc_13E7:
6:13E7  8946e8               mov word ptr [bp - 0x18], ax
6:13EA  8956ea               mov word ptr [bp - 0x16], dx
6:13ED  8b4eec               mov cx, word ptr [bp - 0x14]
6:13F0  83c104               add cx, 4
6:13F3  894ee6               mov word ptr [bp - 0x1a], cx
6:13F6  51                   push cx
6:13F7  52                   push dx
6:13F8  50                   push ax
6:13F9  66ff76f0             push dword ptr [bp - 0x10]
6:13FD  9adc7d1b13           lcall 0x131b, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:1402  668b46e8             mov eax, dword ptr [bp - 0x18]
6:1406  662946f8             sub dword ptr [bp - 8], eax
6:140A  66837ef800           cmp dword ptr [bp - 8], 0
6:140F  7fad                 jg 0x13be
loc_1411:
6:1411  c9                   leave
6:1412  ca0400               retf 4
6:1415  db 00

; ---------------- sub_s6:1416 FAR size=60 callers=2
6:1416  c8040000             enter 4, 0
6:141A  66ff7606             push dword ptr [bp + 6]
6:141E  90                   nop
6:141F  0e                   push cs
6:1420  e8bbfd               call 0x11de  ; sub_s6:11DE
6:1423  0bc0                 or ax, ax
6:1425  7515                 jne 0x143c
6:1427  66ff7606             push dword ptr [bp + 6]
6:142B  90                   nop
6:142C  0e                   push cs
6:142D  e8eefd               call 0x121e  ; sub_s6:121E
6:1430  52                   push dx
6:1431  50                   push ax
6:1432  90                   nop
6:1433  0e                   push cs
6:1434  e8dfff               call 0x1416  ; sub_s6:1416
6:1437  c9                   leave
6:1438  ca0400               retf 4
6:143B  db 90
loc_143C:
6:143C  66ff7606             push dword ptr [bp + 6]
6:1440  90                   nop
6:1441  0e                   push cs
6:1442  e8dffb               call 0x1024  ; sub_s6:1024
6:1445  8bc8                 mov cx, ax
6:1447  c1e004               shl ax, 4
6:144A  2bc1                 sub ax, cx
6:144C  2bd2                 sub dx, dx
6:144E  c9                   leave
6:144F  ca0400               retf 4

; ---------------- sub_s6:1452 size=134 callers=0
6:1452  c80e0000             enter 0xe, 0
6:1456  66ff760a             push dword ptr [bp + 0xa]
6:145A  66ff7606             push dword ptr [bp + 6]
6:145E  90                   nop
6:145F  0e                   push cs
6:1460  e889a1               call 0xffffb5ec  ; sub_s6:B5EC
6:1463  0bc0                 or ax, ax
6:1465  7507                 jne 0x146e
loc_1467:
6:1467  33c0                 xor ax, ax
6:1469  c9                   leave
6:146A  ca0800               retf 8
6:146D  db 90
loc_146E:
6:146E  c45e06               les bx, ptr [bp + 6]
6:1471  268b4722             mov ax, word ptr es:[bx + 0x22]
6:1475  8946f6               mov word ptr [bp - 0xa], ax
6:1478  666a02               push 2
6:147B  8d46f6               lea ax, [bp - 0xa]
6:147E  16                   push ss
6:147F  50                   push ax
6:1480  66ff760a             push dword ptr [bp + 0xa]
6:1484  9a1c7ea614           lcall 0x14a6, 0x7e1c  ; File_write@s2:7E1C
6:1489  0bc0                 or ax, ax
6:148B  743a                 je 0x14c7
6:148D  c45e06               les bx, ptr [bp + 6]
6:1490  268b4720             mov ax, word ptr es:[bx + 0x20]
6:1494  8946fc               mov word ptr [bp - 4], ax
6:1497  666a02               push 2
6:149A  8d46fc               lea ax, [bp - 4]
6:149D  16                   push ss
6:149E  50                   push ax
6:149F  66ff760a             push dword ptr [bp + 0xa]
6:14A3  9a1c7ec114           lcall 0x14c1, 0x7e1c  ; File_write@s2:7E1C
6:14A8  0bc0                 or ax, ax
6:14AA  741b                 je 0x14c7
6:14AC  a1bc4f               mov ax, word ptr [0x4fbc]
6:14AF  8946fc               mov word ptr [bp - 4], ax
6:14B2  666a02               push 2
6:14B5  8d46fc               lea ax, [bp - 4]
6:14B8  16                   push ss
6:14B9  50                   push ax
6:14BA  66ff760a             push dword ptr [bp + 0xa]
6:14BE  9a1c7e5f13           lcall 0x135f, 0x7e1c  ; File_write@s2:7E1C
6:14C3  0bc0                 or ax, ax
6:14C5  7509                 jne 0x14d0
loc_14C7:
6:14C7  c7061003d006         mov word ptr [0x310], 0x6d0
6:14CD  eb98                 jmp 0x1467
6:14CF  db 90
loc_14D0:
6:14D0  b80100               mov ax, 1
6:14D3  c9                   leave
6:14D4  ca0800               retf 8
6:14D7  db 00

; ---------------- sub_s6:14D8 FAR size=126 callers=0
6:14D8  c8160000             enter 0x16, 0
6:14DC  66ff760a             push dword ptr [bp + 0xa]
6:14E0  66ff7606             push dword ptr [bp + 6]
6:14E4  90                   nop
6:14E5  0e                   push cs
6:14E6  e831a3               call 0xffffb81a  ; sub_s6:B81A
6:14E9  0bc0                 or ax, ax
6:14EB  7507                 jne 0x14f4
loc_14ED:
6:14ED  33c0                 xor ax, ax
6:14EF  c9                   leave
6:14F0  ca0800               retf 8
6:14F3  db 90
loc_14F4:
6:14F4  666a02               push 2
6:14F7  668b4606             mov eax, dword ptr [bp + 6]
6:14FB  052200               add ax, 0x22
6:14FE  6650                 push eax
6:1500  66ff760a             push dword ptr [bp + 0xa]
6:1504  9aee7d1c15           lcall 0x151c, 0x7dee  ; File_read@s2:7DEE
6:1509  0bc0                 or ax, ax
6:150B  7415                 je 0x1522
6:150D  666a02               push 2
6:1510  8d46fe               lea ax, [bp - 2]
6:1513  16                   push ss
6:1514  50                   push ax
6:1515  66ff760a             push dword ptr [bp + 0xa]
6:1519  9aee7d4915           lcall 0x1549, 0x7dee  ; File_read@s2:7DEE
6:151E  0bc0                 or ax, ax
6:1520  7508                 jne 0x152a
loc_1522:
6:1522  c7061003d206         mov word ptr [0x310], 0x6d2
6:1528  ebc3                 jmp 0x14ed
loc_152A:
6:152A  8b46fe               mov ax, word ptr [bp - 2]
6:152D  c45e06               les bx, ptr [bp + 6]
6:1530  26894720             mov word ptr es:[bx + 0x20], ax
6:1534  833e120302           cmp word ptr [0x312], 2
6:1539  7c14                 jl 0x154f
6:153B  666a02               push 2
6:153E  1e                   push ds
6:153F  68bc4f               push 0x4fbc
6:1542  66ff760a             push dword ptr [bp + 0xa]
6:1546  9aee7d8714           lcall 0x1487, 0x7dee  ; File_read@s2:7DEE
6:154B  0bc0                 or ax, ax
6:154D  74d3                 je 0x1522
loc_154F:
6:154F  b80100               mov ax, 1
6:1552  c9                   leave
6:1553  ca0800               retf 8

; ---------------- sub_s6:1556 FAR size=240 callers=1
6:1556  c8320000             enter 0x32, 0
6:155A  57                   push di
6:155B  56                   push si
6:155C  66ff7606             push dword ptr [bp + 6]
6:1560  90                   nop
6:1561  0e                   push cs
6:1562  e851a5               call 0xffffbab6  ; sub_s6:BAB6
6:1565  8946fc               mov word ptr [bp - 4], ax
6:1568  8956fe               mov word ptr [bp - 2], dx
6:156B  52                   push dx
6:156C  50                   push ax
6:156D  9aac2fd815           lcall 0x15d8, 0x2fac  ; sub_s7:2FAC
6:1572  8946fa               mov word ptr [bp - 6], ax
6:1575  66ff7606             push dword ptr [bp + 6]
6:1579  90                   nop
6:157A  0e                   push cs
6:157B  e8a6a5               call 0xffffbb24  ; sub_s6:BB24
6:157E  8946f6               mov word ptr [bp - 0xa], ax
6:1581  8956f8               mov word ptr [bp - 8], dx
6:1584  66ff7606             push dword ptr [bp + 6]
6:1588  90                   nop
6:1589  0e                   push cs
6:158A  e801a0               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:158D  8946f2               mov word ptr [bp - 0xe], ax
6:1590  8956f4               mov word ptr [bp - 0xc], dx
6:1593  050c00               add ax, 0xc
6:1596  1e                   push ds
6:1597  8d7eec               lea di, [bp - 0x14]
6:159A  8bf0                 mov si, ax
6:159C  16                   push ss
6:159D  07                   pop es
6:159E  8eda                 mov ds, dx
6:15A0  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:15A2  a5                   movsw word ptr es:[di], word ptr [si]
6:15A3  1f                   pop ds
6:15A4  8d46ec               lea ax, [bp - 0x14]
6:15A7  8946e6               mov word ptr [bp - 0x1a], ax
6:15AA  c746ea0000           mov word ptr [bp - 0x16], 0
6:15AF  c746e80100           mov word ptr [bp - 0x18], 1
6:15B4  eb03                 jmp 0x15b9
loc_15B6:
6:15B6  ff46e8               inc word ptr [bp - 0x18]
loc_15B9:
6:15B9  8b46fa               mov ax, word ptr [bp - 6]
6:15BC  3946e8               cmp word ptr [bp - 0x18], ax
6:15BF  7f7d                 jg 0x163e
6:15C1  8b46e8               mov ax, word ptr [bp - 0x18]
6:15C4  8946f0               mov word ptr [bp - 0x10], ax
6:15C7  66ff76f6             push dword ptr [bp - 0xa]
6:15CB  8d46ec               lea ax, [bp - 0x14]
6:15CE  16                   push ss
6:15CF  50                   push ax
6:15D0  66ff364057           push dword ptr [0x5740]
6:15D5  9a7e62fd15           lcall 0x15fd, 0x627e  ; sub_s7:627E
6:15DA  8946de               mov word ptr [bp - 0x22], ax
6:15DD  8956e0               mov word ptr [bp - 0x20], dx
6:15E0  52                   push dx
6:15E1  50                   push ax
6:15E2  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:15E7  90                   nop
6:15E8  0e                   push cs
6:15E9  e800cc               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:15EC  8946da               mov word ptr [bp - 0x26], ax
6:15EF  8956dc               mov word ptr [bp - 0x24], dx
6:15F2  0bd0                 or dx, ax
6:15F4  7448                 je 0x163e
6:15F6  ff76dc               push word ptr [bp - 0x24]
6:15F9  50                   push ax
6:15FA  9aa8730014           lcall 0x1400, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:15FF  8946d6               mov word ptr [bp - 0x2a], ax
6:1602  8956d8               mov word ptr [bp - 0x28], dx
6:1605  0bd0                 or dx, ax
6:1607  7435                 je 0x163e
6:1609  c45ed6               les bx, ptr [bp - 0x2a]
6:160C  268b470c             mov ax, word ptr es:[bx + 0xc]
6:1610  8946e6               mov word ptr [bp - 0x1a], ax
6:1613  6a13                 push 0x13
6:1615  50                   push ax
6:1616  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:161B  9aaec60715           lcall 0x1507, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:1620  0bc0                 or ax, ax
6:1622  7506                 jne 0x162a
6:1624  837ee675             cmp word ptr [bp - 0x1a], 0x75
6:1628  7514                 jne 0x163e
loc_162A:
6:162A  c45ed6               les bx, ptr [bp - 0x2a]
6:162D  26837f1209           cmp word ptr es:[bx + 0x12], 9
6:1632  7482                 je 0x15b6
6:1634  b80100               mov ax, 1
6:1637  5e                   pop si
6:1638  5f                   pop di
6:1639  c9                   leave
6:163A  ca0400               retf 4
6:163D  db 90
loc_163E:
6:163E  33c0                 xor ax, ax
6:1640  5e                   pop si
6:1641  5f                   pop di
6:1642  c9                   leave
6:1643  ca0400               retf 4

; ---------------- sub_s6:1646 FAR size=184 callers=1
6:1646  55                   push bp
6:1647  8bec                 mov bp, sp
6:1649  c45e06               les bx, ptr [bp + 6]
6:164C  268b4720             mov ax, word ptr es:[bx + 0x20]
6:1650  e98500               jmp 0x16d8
6:1653  db 90
loc_1654:
6:1654  c45e06               les bx, ptr [bp + 6]
6:1657  26c747200500         mov word ptr es:[bx + 0x20], 5
6:165D  e99a00               jmp 0x16fa
loc_1660:
6:1660  c45e06               les bx, ptr [bp + 6]
6:1663  26c747200600         mov word ptr es:[bx + 0x20], 6
6:1669  e98e00               jmp 0x16fa
loc_166C:
6:166C  c45e06               les bx, ptr [bp + 6]
6:166F  26c747200700         mov word ptr es:[bx + 0x20], 7
6:1675  e98200               jmp 0x16fa
6:1678  db 90 90
loc_167A:
6:167A  c45e06               les bx, ptr [bp + 6]
6:167D  26c747200800         mov word ptr es:[bx + 0x20], 8
6:1683  eb75                 jmp 0x16fa
6:1685  db 90
loc_1686:
6:1686  c45e06               les bx, ptr [bp + 6]
6:1689  26c747200900         mov word ptr es:[bx + 0x20], 9
6:168F  eb69                 jmp 0x16fa
6:1691  db 90
loc_1692:
6:1692  c45e06               les bx, ptr [bp + 6]
6:1695  26c747200a00         mov word ptr es:[bx + 0x20], 0xa
6:169B  c9                   leave
6:169C  ca0400               retf 4
6:169F  db 90
loc_16A0:
6:16A0  c45e06               les bx, ptr [bp + 6]
6:16A3  26c747200b00         mov word ptr es:[bx + 0x20], 0xb
6:16A9  c9                   leave
6:16AA  ca0400               retf 4
6:16AD  db 90
loc_16AE:
6:16AE  c45e06               les bx, ptr [bp + 6]
6:16B1  26c747200c00         mov word ptr es:[bx + 0x20], 0xc
6:16B7  c9                   leave
6:16B8  ca0400               retf 4
6:16BB  db 90
loc_16BC:
6:16BC  c45e06               les bx, ptr [bp + 6]
6:16BF  26c747200d00         mov word ptr es:[bx + 0x20], 0xd
6:16C5  c9                   leave
6:16C6  ca0400               retf 4
6:16C9  db 90
loc_16CA:
6:16CA  c45e06               les bx, ptr [bp + 6]
6:16CD  26c747200400         mov word ptr es:[bx + 0x20], 4
6:16D3  c9                   leave
6:16D4  ca0400               retf 4
6:16D7  db 90
loc_16D8:
6:16D8  2d0400               sub ax, 4
6:16DB  3d0800               cmp ax, 8
6:16DE  77ea                 ja 0x16ca
6:16E0  03c0                 add ax, ax
6:16E2  93                   xchg bx, ax
6:16E3  2effa7e816           jmp word ptr cs:[bx + 0x16e8]
switch_table_16E8:
    dw loc_1654
    dw loc_1660
    dw loc_166C
    dw loc_167A
    dw loc_1686
    dw loc_1692
    dw loc_16A0
    dw loc_16AE
    dw loc_16BC
loc_16FA:
6:16FA  c9                   leave
6:16FB  ca0400               retf 4

; ---------------- sub_s6:16FE size=142 callers=0
6:16FE  c8040000             enter 4, 0
6:1702  66ff7606             push dword ptr [bp + 6]
6:1706  90                   nop
6:1707  0e                   push cs
6:1708  e80d9d               call 0xffffb418  ; sub_s6:B418
6:170B  f6460a01             test byte ptr [bp + 0xa], 1
6:170F  7409                 je 0x171a
6:1711  66ff7606             push dword ptr [bp + 6]
6:1715  9ace17fa0e           lcall 0xefa, 0x17ce  ; operator_delete@s1:17CE
loc_171A:
6:171A  8b4606               mov ax, word ptr [bp + 6]
6:171D  8b5608               mov dx, word ptr [bp + 8]
6:1720  c9                   leave
6:1721  ca0600               retf 6
6:1724  db fe 16 2a 17 56 bb 32 17 8e 17 70 15 52 14 36 17
6:1734  db d8 14 3a 17 1c bc 3e 17 38 bd 42 17 90 bc 46 17
6:1744  db 7e bc 4a 17 9c 0d 4e 17 a6 0e 52 17 4a 13 56 17
6:1754  db 1a bf 5a 17 1e bf 5e 17 a4 0f 62 17 22 bf 66 17
6:1764  db be 12 6a 17 02 bc 6e 17 a8 b5 72 17 ca b5 76 17
6:1774  db e6 b4 7a 17 ec b4 7e 17 84 0c 82 17 4a c6 86 17
6:1784  db 22 c5 8a 17 d2 ce 79 0c

; ---------------- sub_s6:178C FAR size=34 callers=1
6:178C  55                   push bp
6:178D  8bec                 mov bp, sp
6:178F  66ff7606             push dword ptr [bp + 6]
6:1793  9a96dc2e17           lcall 0x172e, 0xdc96  ; sub_s7:DC96
6:1798  c45e06               les bx, ptr [bp + 6]
6:179B  26c707541b           mov word ptr es:[bx], 0x1b54  ; '42.flc'
6:17A0  26c747022617         mov word ptr es:[bx + 2], 0x1726  ; SEGMENT s6:0000
6:17A6  8bc3                 mov ax, bx
6:17A8  8cc2                 mov dx, es
6:17AA  c9                   leave
6:17AB  ca0400               retf 4

; ---------------- sub_s6:17AE FAR size=42 callers=1
6:17AE  55                   push bp
6:17AF  8bec                 mov bp, sp
6:17B1  66ff760c             push dword ptr [bp + 0xc]
6:17B5  66ff7608             push dword ptr [bp + 8]
6:17B9  ff7606               push word ptr [bp + 6]
6:17BC  9ac2dc9617           lcall 0x1796, 0xdcc2  ; sub_s7:DCC2
6:17C1  c45e06               les bx, ptr [bp + 6]
6:17C4  26c707541b           mov word ptr es:[bx], 0x1b54  ; '42.flc'
6:17C9  26c74702a417         mov word ptr es:[bx + 2], 0x17a4  ; SEGMENT s6:0000
6:17CF  8bc3                 mov ax, bx
6:17D1  8cc2                 mov dx, es
6:17D3  c9                   leave
6:17D4  ca0a00               retf 0xa
6:17D7  db 00

; ---------------- sub_s6:17D8 FAR size=58 callers=0
6:17D8  c8100000             enter 0x10, 0
6:17DC  66ff7608             push dword ptr [bp + 8]
6:17E0  ff7606               push word ptr [bp + 6]
6:17E3  9a0cdfbf17           lcall 0x17bf, 0xdf0c  ; sub_s7:DF0C
6:17E8  66ff7606             push dword ptr [bp + 6]
6:17EC  90                   nop
6:17ED  0e                   push cs
6:17EE  e89d9d               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:17F1  8946fc               mov word ptr [bp - 4], ax
6:17F4  8956fe               mov word ptr [bp - 2], dx
6:17F7  c45efc               les bx, ptr [bp - 4]
6:17FA  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:17FF  666800000300         push 0x30000
6:1805  6a01                 push 1
6:1807  6650                 push eax
6:1809  9adc57ffff           lcall 0xffff, 0x57dc  ; sub_s8:57DC
6:180E  c9                   leave
6:180F  ca0600               retf 6

; ---------------- sub_s6:1812 FAR size=18 callers=0
6:1812  55                   push bp
6:1813  8bec                 mov bp, sp
6:1815  6a02                 push 2
6:1817  66ff7606             push dword ptr [bp + 6]
6:181B  90                   nop
6:181C  0e                   push cs
6:181D  e88ca5               call 0xffffbdac  ; sub_s6:BDAC
6:1820  c9                   leave
6:1821  ca0400               retf 4

; ---------------- sub_s6:1824 size=374 callers=0
6:1824  c8360000             enter 0x36, 0
6:1828  57                   push di
6:1829  56                   push si
6:182A  66ff7612             push dword ptr [bp + 0x12]
6:182E  66ff760e             push dword ptr [bp + 0xe]
6:1832  66ff760a             push dword ptr [bp + 0xa]
6:1836  66ff7606             push dword ptr [bp + 6]
6:183A  90                   nop
6:183B  0e                   push cs
6:183C  e86bab               call 0xffffc3aa  ; sub_s6:C3AA
6:183F  0bc0                 or ax, ax
6:1841  7419                 je 0x185c
6:1843  66ff7612             push dword ptr [bp + 0x12]
6:1847  66ff760e             push dword ptr [bp + 0xe]
6:184B  66ff760a             push dword ptr [bp + 0xa]
6:184F  66ff7606             push dword ptr [bp + 6]
6:1853  90                   nop
6:1854  0e                   push cs
6:1855  e8bcaa               call 0xffffc314  ; sub_s6:C314
6:1858  0bc0                 or ax, ax
6:185A  7508                 jne 0x1864
loc_185C:
6:185C  33c0                 xor ax, ax
6:185E  5e                   pop si
6:185F  5f                   pop di
6:1860  c9                   leave
6:1861  ca1000               retf 0x10
loc_1864:
6:1864  8d46f6               lea ax, [bp - 0xa]
6:1867  16                   push ss
6:1868  50                   push ax
6:1869  66ff7612             push dword ptr [bp + 0x12]
6:186D  66ff760a             push dword ptr [bp + 0xa]
6:1871  66ff364057           push dword ptr [0x5740]
6:1876  9ace64c818           lcall 0x18c8, 0x64ce  ; sub_s7:64CE
6:187B  8bd8                 mov bx, ax
6:187D  8ec2                 mov es, dx
6:187F  66268b07             mov eax, dword ptr es:[bx]
6:1883  268b5702             mov dx, word ptr es:[bx + 2]
6:1887  668946fc             mov dword ptr [bp - 4], eax
6:188B  c45e0a               les bx, ptr [bp + 0xa]
6:188E  268b4704             mov ax, word ptr es:[bx + 4]
6:1892  8946fa               mov word ptr [bp - 6], ax
6:1895  8b46fc               mov ax, word ptr [bp - 4]
6:1898  8946ec               mov word ptr [bp - 0x14], ax
6:189B  8956ee               mov word ptr [bp - 0x12], dx
6:189E  8946e2               mov word ptr [bp - 0x1e], ax
6:18A1  8956e4               mov word ptr [bp - 0x1c], dx
6:18A4  8a46e5               mov al, byte ptr [bp - 0x1b]
6:18A7  2ae4                 sub ah, ah
6:18A9  a8ff                 test al, 0xff
6:18AB  0f84e100             je 0x1990
6:18AF  52                   push dx
6:18B0  ff76fc               push word ptr [bp - 4]
6:18B3  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:18B8  90                   nop
6:18B9  0e                   push cs
6:18BA  e82fc9               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:18BD  8946e2               mov word ptr [bp - 0x1e], ax
6:18C0  8956e4               mov word ptr [bp - 0x1c], dx
6:18C3  52                   push dx
6:18C4  50                   push ax
6:18C5  9aa06f3a19           lcall 0x193a, 0x6fa0  ; sub_s7:6FA0
6:18CA  8946e6               mov word ptr [bp - 0x1a], ax
6:18CD  3d1000               cmp ax, 0x10
6:18D0  751a                 jne 0x18ec
6:18D2  837efa00             cmp word ptr [bp - 6], 0
6:18D6  750a                 jne 0x18e2
loc_18D8:
6:18D8  b80100               mov ax, 1
6:18DB  5e                   pop si
6:18DC  5f                   pop di
6:18DD  c9                   leave
6:18DE  ca1000               retf 0x10
6:18E1  db 90
loc_18E2:
6:18E2  c706ca50ab06         mov word ptr [0x50ca], 0x6ab
6:18E8  e971ff               jmp 0x185c
6:18EB  db 90
loc_18EC:
6:18EC  3d6000               cmp ax, 0x60
6:18EF  7407                 je 0x18f8
6:18F1  3d6100               cmp ax, 0x61
6:18F4  0f859800             jne 0x1990
loc_18F8:
6:18F8  6a2f                 push 0x2f
6:18FA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:18FF  9aba20bb0f           lcall 0xfbb, 0x20ba  ; sub_s3:20BA
6:1904  8946ec               mov word ptr [bp - 0x14], ax
6:1907  8956ee               mov word ptr [bp - 0x12], dx
6:190A  52                   push dx
6:190B  50                   push ax
6:190C  9ab8045706           lcall 0x657, 0x4b8  ; sub_s4:04B8
6:1911  8946f2               mov word ptr [bp - 0xe], ax
6:1914  8956f4               mov word ptr [bp - 0xc], dx
6:1917  c45eec               les bx, ptr [bp - 0x14]
6:191A  268b471e             mov ax, word ptr es:[bx + 0x1e]
6:191E  8946ea               mov word ptr [bp - 0x16], ax
6:1921  52                   push dx
6:1922  ff76f2               push word ptr [bp - 0xe]
6:1925  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:192A  90                   nop
6:192B  0e                   push cs
6:192C  e8bdc8               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:192F  8946de               mov word ptr [bp - 0x22], ax
6:1932  8956e0               mov word ptr [bp - 0x20], dx
6:1935  52                   push dx
6:1936  50                   push ax
6:1937  9aac2fe617           lcall 0x17e6, 0x2fac  ; sub_s7:2FAC
6:193C  3b46ea               cmp ax, word ptr [bp - 0x16]
6:193F  7f09                 jg 0x194a
6:1941  c706ca50ac06         mov word ptr [0x50ca], 0x6ac
6:1947  e912ff               jmp 0x185c
loc_194A:
6:194A  8b460a               mov ax, word ptr [bp + 0xa]
6:194D  8b560c               mov dx, word ptr [bp + 0xc]
6:1950  1e                   push ds
6:1951  8d7ed8               lea di, [bp - 0x28]
6:1954  8bf0                 mov si, ax
6:1956  16                   push ss
6:1957  07                   pop es
6:1958  8eda                 mov ds, dx
6:195A  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:195C  a5                   movsw word ptr es:[di], word ptr [si]
6:195D  1f                   pop ds
6:195E  8d46d8               lea ax, [bp - 0x28]
6:1961  8946d2               mov word ptr [bp - 0x2e], ax
6:1964  8b46fa               mov ax, word ptr [bp - 6]
6:1967  40                   inc ax
6:1968  8946dc               mov word ptr [bp - 0x24], ax
6:196B  66ff7612             push dword ptr [bp + 0x12]
6:196F  8d46d8               lea ax, [bp - 0x28]
6:1972  16                   push ss
6:1973  50                   push ax
6:1974  66ff7606             push dword ptr [bp + 6]
6:1978  90                   nop
6:1979  0e                   push cs
6:197A  e839ae               call 0xffffc7b6  ; sub_s6:C7B6
6:197D  8946d6               mov word ptr [bp - 0x2a], ax
6:1980  0bc0                 or ax, ax
6:1982  0f84d6fe             je 0x185c
6:1986  3d0600               cmp ax, 6
6:1989  0f854bff             jne 0x18d8
6:198D  e9ccfe               jmp 0x185c
loc_1990:
6:1990  c706ca50aa06         mov word ptr [0x50ca], 0x6aa
6:1996  e9c3fe               jmp 0x185c
6:1999  db 00

; ---------------- sub_s6:199A FAR size=388 callers=0
6:199A  c8600100             enter 0x160, 0
6:199E  57                   push di
6:199F  56                   push si
6:19A0  c45e06               les bx, ptr [bp + 6]
6:19A3  26ff4f14             dec word ptr es:[bx + 0x14]
6:19A7  0f856c01             jne 0x1b17
6:19AB  66ff7606             push dword ptr [bp + 6]
6:19AF  90                   nop
6:19B0  0e                   push cs
6:19B1  e8da9b               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:19B4  8946fc               mov word ptr [bp - 4], ax
6:19B7  8956fe               mov word ptr [bp - 2], dx
6:19BA  c45efc               les bx, ptr [bp - 4]
6:19BD  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:19C2  668946f8             mov dword ptr [bp - 8], eax
6:19C6  666800000300         push 0x30000
6:19CC  6a01                 push 1
6:19CE  6650                 push eax
6:19D0  9a04580c18           lcall 0x180c, 0x5804  ; sub_s8:5804
6:19D5  8b46fc               mov ax, word ptr [bp - 4]
6:19D8  8b56fe               mov dx, word ptr [bp - 2]
6:19DB  050c00               add ax, 0xc
6:19DE  1e                   push ds
6:19DF  8d7ef2               lea di, [bp - 0xe]
6:19E2  8bf0                 mov si, ax
6:19E4  16                   push ss
6:19E5  07                   pop es
6:19E6  8eda                 mov ds, dx
6:19E8  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:19EA  a5                   movsw word ptr es:[di], word ptr [si]
6:19EB  1f                   pop ds
6:19EC  8d46f2               lea ax, [bp - 0xe]
6:19EF  8946d0               mov word ptr [bp - 0x30], ax
6:19F2  8d46f0               lea ax, [bp - 0x10]
6:19F5  16                   push ss
6:19F6  50                   push ax
6:19F7  8d46ee               lea ax, [bp - 0x12]
6:19FA  16                   push ss
6:19FB  50                   push ax
6:19FC  8d46ec               lea ax, [bp - 0x14]
6:19FF  16                   push ss
6:1A00  50                   push ax
6:1A01  8d46f2               lea ax, [bp - 0xe]
6:1A04  16                   push ss
6:1A05  50                   push ax
6:1A06  9ab43ec61a           lcall 0x1ac6, 0x3eb4  ; sub_s2:3EB4
6:1A0B  6a2f                 push 0x2f
6:1A0D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:1A12  9aba200219           lcall 0x1902, 0x20ba  ; sub_s3:20BA
6:1A17  8946e8               mov word ptr [bp - 0x18], ax
6:1A1A  8956ea               mov word ptr [bp - 0x16], dx
6:1A1D  c45ee8               les bx, ptr [bp - 0x18]
6:1A20  66268b4720           mov eax, dword ptr es:[bx + 0x20]
6:1A25  668946e4             mov dword ptr [bp - 0x1c], eax
6:1A29  8d4ee2               lea cx, [bp - 0x1e]
6:1A2C  16                   push ss
6:1A2D  51                   push cx
6:1A2E  8d56e0               lea dx, [bp - 0x20]
6:1A31  16                   push ss
6:1A32  52                   push dx
6:1A33  66ff76e4             push dword ptr [bp - 0x1c]
6:1A37  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:1A3C  90                   nop
6:1A3D  0e                   push cs
6:1A3E  e8abc7               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:1A41  8946dc               mov word ptr [bp - 0x24], ax
6:1A44  8956de               mov word ptr [bp - 0x22], dx
6:1A47  52                   push dx
6:1A48  50                   push ax
6:1A49  9a1c5b621a           lcall 0x1a62, 0x5b1c  ; sub_s7:5B1C
6:1A4E  8b46ec               mov ax, word ptr [bp - 0x14]
6:1A51  40                   inc ax
6:1A52  3b46e0               cmp ax, word ptr [bp - 0x20]
6:1A55  7e20                 jle 0x1a77
6:1A57  ff76e2               push word ptr [bp - 0x1e]
6:1A5A  50                   push ax
6:1A5B  66ff76dc             push dword ptr [bp - 0x24]
6:1A5F  9a3e5b751a           lcall 0x1a75, 0x5b3e  ; sub_s7:5B3E
6:1A64  8d46e2               lea ax, [bp - 0x1e]
6:1A67  16                   push ss
6:1A68  50                   push ax
6:1A69  8d46e0               lea ax, [bp - 0x20]
6:1A6C  16                   push ss
6:1A6D  50                   push ax
6:1A6E  66ff76dc             push dword ptr [bp - 0x24]
6:1A72  9a1c5bba1a           lcall 0x1aba, 0x5b1c  ; sub_s7:5B1C
loc_1A77:
6:1A77  c45ef8               les bx, ptr [bp - 8]
6:1A7A  66268b4704           mov eax, dword ptr es:[bx + 4]
6:1A7F  268b5706             mov dx, word ptr es:[bx + 6]
6:1A83  668946d8             mov dword ptr [bp - 0x28], eax
6:1A87  66ff76e4             push dword ptr [bp - 0x1c]
6:1A8B  52                   push dx
6:1A8C  50                   push ax
6:1A8D  8d46f2               lea ax, [bp - 0xe]
6:1A90  16                   push ss
6:1A91  50                   push ax
6:1A92  837eec01             cmp word ptr [bp - 0x14], 1
6:1A96  1bc0                 sbb ax, ax
6:1A98  24d3                 and al, 0xd3
6:1A9A  056000               add ax, 0x60
6:1A9D  50                   push ax
6:1A9E  666a00               push 0
6:1AA1  8d86a4fe             lea ax, [bp - 0x15c]
6:1AA5  16                   push ss
6:1AA6  50                   push ax
6:1AA7  90                   nop
6:1AA8  0e                   push cs
6:1AA9  e8446d               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:1AAC  8d86a4fe             lea ax, [bp - 0x15c]
6:1AB0  16                   push ss
6:1AB1  50                   push ax
6:1AB2  66ff364857           push dword ptr [0x5748]  ; g_sim
6:1AB7  9a5a83091b           lcall 0x1b09, 0x835a  ; Sim::enqueue@s7:835A
6:1ABC  c786a4fe9a38         mov word ptr [bp - 0x15c], 0x389a
6:1AC2  c786a6fed91a         mov word ptr [bp - 0x15a], 0x1ad9  ; SEGMENT s2:0000
6:1AC8  66ff76ee             push dword ptr [bp - 0x12]
6:1ACC  8b46ec               mov ax, word ptr [bp - 0x14]
6:1ACF  40                   inc ax
6:1AD0  50                   push ax
6:1AD1  8d46f2               lea ax, [bp - 0xe]
6:1AD4  16                   push ss
6:1AD5  50                   push ax
6:1AD6  9a763e151b           lcall 0x1b15, 0x3e76  ; sub_s2:3E76
6:1ADB  66ff76e4             push dword ptr [bp - 0x1c]
6:1ADF  66ff76d8             push dword ptr [bp - 0x28]
6:1AE3  8d46f2               lea ax, [bp - 0xe]
6:1AE6  16                   push ss
6:1AE7  50                   push ax
6:1AE8  666800006000         push 0x600000
6:1AEE  6a00                 push 0
6:1AF0  8d86a4fe             lea ax, [bp - 0x15c]
6:1AF4  16                   push ss
6:1AF5  50                   push ax
6:1AF6  90                   nop
6:1AF7  0e                   push cs
6:1AF8  e8f56c               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:1AFB  8d86a4fe             lea ax, [bp - 0x15c]
6:1AFF  16                   push ss
6:1B00  50                   push ax
6:1B01  66ff364857           push dword ptr [0x5748]  ; g_sim
6:1B06  9a5a837918           lcall 0x1879, 0x835a  ; Sim::enqueue@s7:835A
6:1B0B  c786a4fe9a38         mov word ptr [bp - 0x15c], 0x389a
6:1B11  c786a6fe1e16         mov word ptr [bp - 0x15a], 0x161e  ; SEGMENT s2:0000
loc_1B17:
6:1B17  5e                   pop si
6:1B18  5f                   pop di
6:1B19  c9                   leave
6:1B1A  ca0400               retf 4
6:1B1D  db 00

; ---------------- sub_s6:1B1E FAR size=16 callers=0
6:1B1E  55                   push bp
6:1B1F  8bec                 mov bp, sp
6:1B21  c45e06               les bx, ptr [bp + 6]
6:1B24  26c747140700         mov word ptr es:[bx + 0x14], 7
6:1B2A  c9                   leave
6:1B2B  ca0400               retf 4

; ---------------- sub_s6:1B2E size=142 callers=0
6:1B2E  c8040000             enter 4, 0
6:1B32  66ff7606             push dword ptr [bp + 6]
6:1B36  9af4dc4c1a           lcall 0x1a4c, 0xdcf4  ; sub_s7:DCF4
6:1B3B  f6460a01             test byte ptr [bp + 0xa], 1
6:1B3F  7409                 je 0x1b4a
6:1B41  66ff7606             push dword ptr [bp + 6]
6:1B45  9ace171817           lcall 0x1718, 0x17ce  ; operator_delete@s1:17CE
loc_1B4A:
6:1B4A  8b4606               mov ax, word ptr [bp + 6]
6:1B4D  8b5608               mov dx, word ptr [bp + 8]
6:1B50  c9                   leave
6:1B51  ca0600               retf 6
6:1B54  db 2e 1b 5a 1b 56 bb 6a 1b 8e 17 62 1b 7c de 66 1b
6:1B64  db c4 de 39 1b 1c bc 6e 1b d8 17 72 1b 24 18 76 1b
6:1B74  db 12 18 7a 1b 14 b5 7e 1b 2a be 82 1b 16 bf 86 1b
6:1B84  db 1a bf 8a 1b 1e bf 8e 1b 9a 19 92 1b 1e 1b 96 1b
6:1B94  db f0 bb 9a 1b 02 bc 9e 1b a8 b5 a2 1b ca b5 a6 1b
6:1BA4  db e6 b4 aa 1b ec b4 ae 1b 6e b4 b2 1b 4a c6 b6 1b
6:1BB4  db 22 c5 ba 1b d2 ce cd 17

; ---------------- sub_s6:1BBC FAR size=44 callers=1
6:1BBC  55                   push bp
6:1BBD  8bec                 mov bp, sp
6:1BBF  66ff7606             push dword ptr [bp + 6]
6:1BC3  90                   nop
6:1BC4  0e                   push cs
6:1BC5  e88c97               call 0xffffb354  ; Building::Building()@s6:B354
6:1BC8  33c0                 xor ax, ax
6:1BCA  c45e06               les bx, ptr [bp + 6]
6:1BCD  26894720             mov word ptr es:[bx + 0x20], ax
6:1BD1  26894722             mov word ptr es:[bx + 0x22], ax
6:1BD5  26c707ee1e           mov word ptr es:[bx], 0x1eee
6:1BDA  26c74702561b         mov word ptr es:[bx + 2], 0x1b56  ; SEGMENT s6:0000
6:1BE0  8bc3                 mov ax, bx
6:1BE2  8cc2                 mov dx, es
6:1BE4  c9                   leave
6:1BE5  ca0400               retf 4

; ---------------- sub_s6:1BE8 FAR size=52 callers=1
6:1BE8  55                   push bp
6:1BE9  8bec                 mov bp, sp
6:1BEB  66ff760c             push dword ptr [bp + 0xc]
6:1BEF  66ff7608             push dword ptr [bp + 8]
6:1BF3  ff7606               push word ptr [bp + 6]
6:1BF6  90                   nop
6:1BF7  0e                   push cs
6:1BF8  e8a397               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:1BFB  33c0                 xor ax, ax
6:1BFD  c45e06               les bx, ptr [bp + 6]
6:1C00  26894720             mov word ptr es:[bx + 0x20], ax
6:1C04  26894722             mov word ptr es:[bx + 0x22], ax
6:1C08  26c707ee1e           mov word ptr es:[bx], 0x1eee
6:1C0D  26c74702de1b         mov word ptr es:[bx + 2], 0x1bde  ; SEGMENT s6:0000 | '140.flc'
6:1C13  8bc3                 mov ax, bx
6:1C15  8cc2                 mov dx, es
6:1C17  c9                   leave
6:1C18  ca0a00               retf 0xa
6:1C1B  db 00

; ---------------- sub_s6:1C1C FAR size=6 callers=1
6:1C1C  33c0                 xor ax, ax
6:1C1E  ca0400               retf 4
6:1C21  db 00

; ---------------- sub_s6:1C22 FAR size=68 callers=0
6:1C22  55                   push bp
6:1C23  8bec                 mov bp, sp
6:1C25  c45e06               les bx, ptr [bp + 6]
6:1C28  26837f2000           cmp word ptr es:[bx + 0x20], 0
6:1C2D  742b                 je 0x1c5a
6:1C2F  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:1C34  7407                 je 0x1c3d
6:1C36  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:1C3B  751d                 jne 0x1c5a
loc_1C3D:
6:1C3D  26837f0c16           cmp word ptr es:[bx + 0xc], 0x16
6:1C42  7508                 jne 0x1c4c
6:1C44  b81900               mov ax, 0x19
6:1C47  c9                   leave
6:1C48  ca0400               retf 4
6:1C4B  db 90
loc_1C4C:
6:1C4C  26837f0c17           cmp word ptr es:[bx + 0xc], 0x17
6:1C51  7507                 jne 0x1c5a
6:1C53  b81a00               mov ax, 0x1a
6:1C56  c9                   leave
6:1C57  ca0400               retf 4
loc_1C5A:
6:1C5A  06                   push es
6:1C5B  53                   push bx
6:1C5C  90                   nop
6:1C5D  0e                   push cs
6:1C5E  e8bb9f               call 0xffffbc1c  ; sub_s6:BC1C
6:1C61  c9                   leave
6:1C62  ca0400               retf 4
6:1C65  db 00

; ---------------- sub_s6:1C66 FAR size=100 callers=0
6:1C66  c80c0000             enter 0xc, 0
6:1C6A  c45e06               les bx, ptr [bp + 6]
6:1C6D  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:1C72  7552                 jne 0x1cc6
6:1C74  06                   push es
6:1C75  53                   push bx
6:1C76  90                   nop
6:1C77  0e                   push cs
6:1C78  e87798               call 0xffffb4f2  ; sub_s6:B4F2
6:1C7B  8946fc               mov word ptr [bp - 4], ax
6:1C7E  8956fe               mov word ptr [bp - 2], dx
6:1C81  c45efc               les bx, ptr [bp - 4]
6:1C84  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:1C8E  742b                 je 0x1cbb
6:1C90  c45e06               les bx, ptr [bp + 6]
6:1C93  06                   push es
6:1C94  53                   push bx
6:1C95  26c41f               les bx, ptr es:[bx]
6:1C98  26ff5f64             lcall es:[bx + 0x64]
6:1C9C  0bc0                 or ax, ax
6:1C9E  7426                 je 0x1cc6
6:1CA0  66ff7606             push dword ptr [bp + 6]
6:1CA4  90                   nop
6:1CA5  0e                   push cs
6:1CA6  e85bae               call 0xffffcb04  ; sub_s6:CB04
6:1CA9  0bc0                 or ax, ax
6:1CAB  7505                 jne 0x1cb2
6:1CAD  6a06                 push 6
6:1CAF  eb0c                 jmp 0x1cbd
6:1CB1  db 90
loc_1CB2:
6:1CB2  66ff7606             push dword ptr [bp + 6]
6:1CB6  90                   nop
6:1CB7  0e                   push cs
6:1CB8  e897ac               call 0xffffc952  ; sub_s6:C952
loc_1CBB:
6:1CBB  6a05                 push 5
loc_1CBD:
6:1CBD  66ff7606             push dword ptr [bp + 6]
6:1CC1  90                   nop
6:1CC2  0e                   push cs
6:1CC3  e8e6a0               call 0xffffbdac  ; sub_s6:BDAC
loc_1CC6:
6:1CC6  c9                   leave
6:1CC7  ca0400               retf 4

; ---------------- sub_s6:1CCA size=218 callers=0
6:1CCA  c8160000             enter 0x16, 0
6:1CCE  57                   push di
6:1CCF  56                   push si
6:1CD0  8b460a               mov ax, word ptr [bp + 0xa]
6:1CD3  8b560c               mov dx, word ptr [bp + 0xc]
6:1CD6  1e                   push ds
6:1CD7  8d7efa               lea di, [bp - 6]
6:1CDA  8bf0                 mov si, ax
6:1CDC  16                   push ss
6:1CDD  07                   pop es
6:1CDE  8eda                 mov ds, dx
6:1CE0  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:1CE2  a5                   movsw word ptr es:[di], word ptr [si]
6:1CE3  1f                   pop ds
6:1CE4  8d46fa               lea ax, [bp - 6]
6:1CE7  8946f2               mov word ptr [bp - 0xe], ax
6:1CEA  8d46f8               lea ax, [bp - 8]
6:1CED  16                   push ss
6:1CEE  50                   push ax
6:1CEF  8d46f6               lea ax, [bp - 0xa]
6:1CF2  16                   push ss
6:1CF3  50                   push ax
6:1CF4  8d4ef4               lea cx, [bp - 0xc]
6:1CF7  16                   push ss
6:1CF8  51                   push cx
6:1CF9  8d4efa               lea cx, [bp - 6]
6:1CFC  16                   push ss
6:1CFD  51                   push cx
6:1CFE  9ab43e091a           lcall 0x1a09, 0x3eb4  ; sub_s2:3EB4
6:1D03  8b46f6               mov ax, word ptr [bp - 0xa]
6:1D06  48                   dec ax
6:1D07  8946ea               mov word ptr [bp - 0x16], ax
6:1D0A  8946fc               mov word ptr [bp - 4], ax
6:1D0D  66ff7612             push dword ptr [bp + 0x12]
6:1D11  8d46fa               lea ax, [bp - 6]
6:1D14  16                   push ss
6:1D15  50                   push ax
6:1D16  6a16                 push 0x16
6:1D18  66ff7606             push dword ptr [bp + 6]
6:1D1C  90                   nop
6:1D1D  0e                   push cs
6:1D1E  e8f300               call 0x1e14  ; sub_s6:1E14
6:1D21  0bc0                 or ax, ax
6:1D23  7409                 je 0x1d2e
loc_1D25:
6:1D25  b80100               mov ax, 1
6:1D28  5e                   pop si
6:1D29  5f                   pop di
6:1D2A  c9                   leave
6:1D2B  ca1000               retf 0x10
loc_1D2E:
6:1D2E  8b46f6               mov ax, word ptr [bp - 0xa]
6:1D31  40                   inc ax
6:1D32  8946f0               mov word ptr [bp - 0x10], ax
6:1D35  8946fc               mov word ptr [bp - 4], ax
6:1D38  66ff7612             push dword ptr [bp + 0x12]
6:1D3C  8d46fa               lea ax, [bp - 6]
6:1D3F  16                   push ss
6:1D40  50                   push ax
6:1D41  6a16                 push 0x16
6:1D43  66ff7606             push dword ptr [bp + 6]
6:1D47  90                   nop
6:1D48  0e                   push cs
6:1D49  e8c800               call 0x1e14  ; sub_s6:1E14
6:1D4C  0bc0                 or ax, ax
6:1D4E  75d5                 jne 0x1d25
6:1D50  8b46f6               mov ax, word ptr [bp - 0xa]
6:1D53  8946f0               mov word ptr [bp - 0x10], ax
6:1D56  8946fc               mov word ptr [bp - 4], ax
6:1D59  8b46f8               mov ax, word ptr [bp - 8]
6:1D5C  48                   dec ax
6:1D5D  8946f0               mov word ptr [bp - 0x10], ax
6:1D60  8946fa               mov word ptr [bp - 6], ax
6:1D63  66ff7612             push dword ptr [bp + 0x12]
6:1D67  8d46fa               lea ax, [bp - 6]
6:1D6A  16                   push ss
6:1D6B  50                   push ax
6:1D6C  6a17                 push 0x17
6:1D6E  66ff7606             push dword ptr [bp + 6]
6:1D72  90                   nop
6:1D73  0e                   push cs
6:1D74  e89d00               call 0x1e14  ; sub_s6:1E14
6:1D77  0bc0                 or ax, ax
6:1D79  75aa                 jne 0x1d25
6:1D7B  8b46f8               mov ax, word ptr [bp - 8]
6:1D7E  40                   inc ax
6:1D7F  8946f0               mov word ptr [bp - 0x10], ax
6:1D82  8946fa               mov word ptr [bp - 6], ax
6:1D85  66ff7612             push dword ptr [bp + 0x12]
6:1D89  8d46fa               lea ax, [bp - 6]
6:1D8C  16                   push ss
6:1D8D  50                   push ax
6:1D8E  6a17                 push 0x17
6:1D90  66ff7606             push dword ptr [bp + 6]
6:1D94  90                   nop
6:1D95  0e                   push cs
6:1D96  e87b00               call 0x1e14  ; sub_s6:1E14
6:1D99  0bc0                 or ax, ax
6:1D9B  7588                 jne 0x1d25
6:1D9D  5e                   pop si
6:1D9E  5f                   pop di
6:1D9F  c9                   leave
6:1DA0  ca1000               retf 0x10
6:1DA3  db 00

; ---------------- sub_s6:1DA4 FAR size=112 callers=0
6:1DA4  c8140000             enter 0x14, 0
6:1DA8  8d46fe               lea ax, [bp - 2]
6:1DAB  16                   push ss
6:1DAC  50                   push ax
6:1DAD  9aaebcf61d           lcall 0x1df6, 0xbcae  ; sub_s7:BCAE
6:1DB2  66ff760e             push dword ptr [bp + 0xe]
6:1DB6  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:1DBB  90                   nop
6:1DBC  0e                   push cs
6:1DBD  e82cc4               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:1DC0  8946fa               mov word ptr [bp - 6], ax
6:1DC3  8956fc               mov word ptr [bp - 4], dx
6:1DC6  c45efa               les bx, ptr [bp - 6]
6:1DC9  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:1DCE  668946f6             mov dword ptr [bp - 0xa], eax
6:1DD2  66ff7612             push dword ptr [bp + 0x12]
6:1DD6  66ff760a             push dword ptr [bp + 0xa]
6:1DDA  6650                 push eax
6:1DDC  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:1DE1  90                   nop
6:1DE2  0e                   push cs
6:1DE3  e806c4               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:1DE6  8946f2               mov word ptr [bp - 0xe], ax
6:1DE9  8956f4               mov word ptr [bp - 0xc], dx
6:1DEC  52                   push dx
6:1DED  50                   push ax
6:1DEE  8d46fe               lea ax, [bp - 2]
6:1DF1  16                   push ss
6:1DF2  50                   push ax
6:1DF3  9adebc5e1b           lcall 0x1b5e, 0xbcde  ; sub_s7:BCDE
6:1DF8  8946f0               mov word ptr [bp - 0x10], ax
6:1DFB  0bc0                 or ax, ax
6:1DFD  7d0d                 jge 0x1e0c
6:1DFF  c706ca50af06         mov word ptr [0x50ca], 0x6af
6:1E05  33c0                 xor ax, ax
6:1E07  c9                   leave
6:1E08  ca1000               retf 0x10
6:1E0B  db 90
loc_1E0C:
6:1E0C  b80100               mov ax, 1
6:1E0F  c9                   leave
6:1E10  ca1000               retf 0x10
6:1E13  db 00

; ---------------- sub_s6:1E14 FAR size=118 callers=1
6:1E14  c8140000             enter 0x14, 0
6:1E18  66ff7610             push dword ptr [bp + 0x10]
6:1E1C  66ff760c             push dword ptr [bp + 0xc]
6:1E20  66ff364057           push dword ptr [0x5740]
6:1E25  9a7e625a1e           lcall 0x1e5a, 0x627e  ; sub_s7:627E
6:1E2A  8956fe               mov word ptr [bp - 2], dx
6:1E2D  0bd0                 or dx, ax
6:1E2F  7507                 jne 0x1e38
loc_1E31:
6:1E31  33c0                 xor ax, ax
6:1E33  c9                   leave
6:1E34  ca0e00               retf 0xe
6:1E37  db 90
loc_1E38:
6:1E38  ff76fe               push word ptr [bp - 2]
6:1E3B  50                   push ax
6:1E3C  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:1E41  90                   nop
6:1E42  0e                   push cs
6:1E43  e8a6c3               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:1E46  8946f8               mov word ptr [bp - 8], ax
6:1E49  c45e0c               les bx, ptr [bp + 0xc]
6:1E4C  8bc2                 mov ax, dx
6:1E4E  0b46f8               or ax, word ptr [bp - 8]
6:1E51  74de                 je 0x1e31
6:1E53  52                   push dx
6:1E54  ff76f8               push word ptr [bp - 8]
6:1E57  9aa873b01d           lcall 0x1db0, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:1E5C  8946f2               mov word ptr [bp - 0xe], ax
6:1E5F  8956f4               mov word ptr [bp - 0xc], dx
6:1E62  0bd0                 or dx, ax
6:1E64  74cb                 je 0x1e31
6:1E66  c45ef2               les bx, ptr [bp - 0xe]
6:1E69  268b470c             mov ax, word ptr es:[bx + 0xc]
6:1E6D  8946f0               mov word ptr [bp - 0x10], ax
6:1E70  3d1800               cmp ax, 0x18
6:1E73  740d                 je 0x1e82
6:1E75  3d3f00               cmp ax, 0x3f
6:1E78  7408                 je 0x1e82
6:1E7A  8b460a               mov ax, word ptr [bp + 0xa]
6:1E7D  3946f0               cmp word ptr [bp - 0x10], ax
6:1E80  75af                 jne 0x1e31
loc_1E82:
6:1E82  b80100               mov ax, 1
6:1E85  c9                   leave
6:1E86  ca0e00               retf 0xe
6:1E89  db 00

; ---------------- sub_s6:1E8A FAR size=62 callers=0
6:1E8A  c8040000             enter 4, 0
6:1E8E  c45e06               les bx, ptr [bp + 6]
6:1E91  26f6471a02           test byte ptr es:[bx + 0x1a], 2
6:1E96  7528                 jne 0x1ec0
6:1E98  666800002300         push 0x230000
6:1E9E  6a01                 push 1
6:1EA0  06                   push es
6:1EA1  53                   push bx
6:1EA2  90                   nop
6:1EA3  0e                   push cs
6:1EA4  e8e796               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:1EA7  52                   push dx
6:1EA8  50                   push ax
6:1EA9  9a7c7d281e           lcall 0x1e28, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:1EAE  6a06                 push 6
6:1EB0  66ff7606             push dword ptr [bp + 6]
6:1EB4  90                   nop
6:1EB5  0e                   push cs
6:1EB6  e8f39e               call 0xffffbdac  ; sub_s6:BDAC
6:1EB9  33c0                 xor ax, ax
6:1EBB  c9                   leave
6:1EBC  ca0400               retf 4
6:1EBF  db 90
loc_1EC0:
6:1EC0  b80100               mov ax, 1
6:1EC3  c9                   leave
6:1EC4  ca0400               retf 4
6:1EC7  db 00

; ---------------- sub_s6:1EC8 FAR size=142 callers=0
6:1EC8  c8040000             enter 4, 0
6:1ECC  66ff7606             push dword ptr [bp + 6]
6:1ED0  90                   nop
6:1ED1  0e                   push cs
6:1ED2  e84395               call 0xffffb418  ; sub_s6:B418
6:1ED5  f6460a01             test byte ptr [bp + 0xa], 1
6:1ED9  7409                 je 0x1ee4
6:1EDB  66ff7606             push dword ptr [bp + 6]
6:1EDF  9ace17481b           lcall 0x1b48, 0x17ce  ; operator_delete@s1:17CE
loc_1EE4:
6:1EE4  8b4606               mov ax, word ptr [bp + 6]
6:1EE7  8b5608               mov dx, word ptr [bp + 8]
6:1EEA  c9                   leave
6:1EEB  ca0600               retf 6
6:1EEE  db c8 1e f4 1e 56 bb fc 1e 8e 17 ac 1e ec b5 00 1f
6:1EFE  db 1a b8 04 1f 22 1c 08 1f 38 bd 0c 1f 90 bc 10 1f
6:1F0E  db 7e bc 14 1f 14 b5 18 1f 66 1c 1c 1f 16 bf 20 1f
6:1F1E  db 1a bf 24 1f 1e bf 28 1f 9e be 2c 1f 22 bf 30 1f
6:1F2E  db f0 bb 34 1f 02 bc 38 1f a8 b5 3c 1f ca b5 40 1f
6:1F3E  db e6 b4 44 1f ec b4 48 1f 6e b4 4c 1f ca 1c 50 1f
6:1F4E  db a4 1d 54 1f 8a 1e 11 1c

; ---------------- sub_s6:1F56 FAR size=114 callers=1
6:1F56  c80c0000             enter 0xc, 0
6:1F5A  66ff7606             push dword ptr [bp + 6]
6:1F5E  90                   nop
6:1F5F  0e                   push cs
6:1F60  e8f193               call 0xffffb354  ; Building::Building()@s6:B354
6:1F63  c45e06               les bx, ptr [bp + 6]
6:1F66  662bc0               sub eax, eax
6:1F69  6626894720           mov dword ptr es:[bx + 0x20], eax
6:1F6E  26894724             mov word ptr es:[bx + 0x24], ax
6:1F72  26c7077225           mov word ptr es:[bx], 0x2572
6:1F77  26c74702f01e         mov word ptr es:[bx + 2], 0x1ef0  ; SEGMENT s6:0000
6:1F7D  6a0c                 push 0xc
6:1F7F  9a9c17e21e           lcall 0x1ee2, 0x179c  ; operator_new@s1:179C
6:1F84  83c402               add sp, 2
6:1F87  8956fe               mov word ptr [bp - 2], dx
6:1F8A  0bd0                 or dx, ax
6:1F8C  7416                 je 0x1fa4
6:1F8E  ff76fe               push word ptr [bp - 2]
6:1F91  50                   push ax
6:1F92  9a4a57011d           lcall 0x1d01, 0x574a  ; sub_s2:574A
6:1F97  c45e06               les bx, ptr [bp + 6]
6:1F9A  26894720             mov word ptr es:[bx + 0x20], ax
6:1F9E  26895722             mov word ptr es:[bx + 0x22], dx
6:1FA2  eb0c                 jmp 0x1fb0
loc_1FA4:
6:1FA4  c45e06               les bx, ptr [bp + 6]
6:1FA7  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
loc_1FB0:
6:1FB0  c45e06               les bx, ptr [bp + 6]
6:1FB3  26c45f20             les bx, ptr es:[bx + 0x20]
6:1FB7  26c7470a0000         mov word ptr es:[bx + 0xa], 0
6:1FBD  8b4606               mov ax, word ptr [bp + 6]
6:1FC0  8b5608               mov dx, word ptr [bp + 8]
6:1FC3  c9                   leave
6:1FC4  ca0400               retf 4
6:1FC7  db 00

; ---------------- sub_s6:1FC8 FAR size=122 callers=1
6:1FC8  c80c0000             enter 0xc, 0
6:1FCC  66ff760c             push dword ptr [bp + 0xc]
6:1FD0  66ff7608             push dword ptr [bp + 8]
6:1FD4  ff7606               push word ptr [bp + 6]
6:1FD7  90                   nop
6:1FD8  0e                   push cs
6:1FD9  e8c293               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:1FDC  c45e06               les bx, ptr [bp + 6]
6:1FDF  662bc0               sub eax, eax
6:1FE2  6626894720           mov dword ptr es:[bx + 0x20], eax
6:1FE7  26894724             mov word ptr es:[bx + 0x24], ax
6:1FEB  26c7077225           mov word ptr es:[bx], 0x2572
6:1FF0  26c747027b1f         mov word ptr es:[bx + 2], 0x1f7b  ; SEGMENT s6:0000
6:1FF6  6a0c                 push 0xc
6:1FF8  9a9c17821f           lcall 0x1f82, 0x179c  ; operator_new@s1:179C
6:1FFD  83c402               add sp, 2
6:2000  8956fe               mov word ptr [bp - 2], dx
6:2003  0bd0                 or dx, ax
6:2005  7417                 je 0x201e
6:2007  ff76fe               push word ptr [bp - 2]
6:200A  50                   push ax
6:200B  9a4a57951f           lcall 0x1f95, 0x574a  ; sub_s2:574A
6:2010  c45e06               les bx, ptr [bp + 6]
6:2013  26894720             mov word ptr es:[bx + 0x20], ax
6:2017  26895722             mov word ptr es:[bx + 0x22], dx
6:201B  eb0d                 jmp 0x202a
6:201D  db 90
loc_201E:
6:201E  c45e06               les bx, ptr [bp + 6]
6:2021  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
loc_202A:
6:202A  c45e06               les bx, ptr [bp + 6]
6:202D  26c45f20             les bx, ptr es:[bx + 0x20]
6:2031  26c7470a0000         mov word ptr es:[bx + 0xa], 0
6:2037  8b4606               mov ax, word ptr [bp + 6]
6:203A  8b5608               mov dx, word ptr [bp + 8]
6:203D  c9                   leave
6:203E  ca0a00               retf 0xa
6:2041  db 00

; ---------------- sub_s6:2042 FAR size=110 callers=1
6:2042  c8100000             enter 0x10, 0
6:2046  c45e06               les bx, ptr [bp + 6]
6:2049  26c7077225           mov word ptr es:[bx], 0x2572
6:204E  26c74702f41f         mov word ptr es:[bx + 2], 0x1ff4  ; SEGMENT s6:0000
6:2054  26c45f20             les bx, ptr es:[bx + 0x20]
6:2058  26c7470a0100         mov word ptr es:[bx + 0xa], 1
6:205E  c45e06               les bx, ptr [bp + 6]
6:2061  268b4720             mov ax, word ptr es:[bx + 0x20]
6:2065  268b5722             mov dx, word ptr es:[bx + 0x22]
6:2069  8bda                 mov bx, dx
6:206B  0bd8                 or bx, ax
6:206D  740e                 je 0x207d
6:206F  6a01                 push 1
6:2071  52                   push dx
6:2072  50                   push ax
6:2073  8ec2                 mov es, dx
6:2075  8bd8                 mov bx, ax
6:2077  26c41f               les bx, ptr es:[bx]
6:207A  26ff1f               lcall es:[bx]
loc_207D:
6:207D  66833ee26500         cmp dword ptr [0x65e2], 0  ; g_objectDb
6:2083  741d                 je 0x20a2
6:2085  66833e645a00         cmp dword ptr [0x5a64], 0
6:208B  7415                 je 0x20a2
6:208D  66ff7606             push dword ptr [bp + 6]
6:2091  90                   nop
6:2092  0e                   push cs
6:2093  e8f894               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:2096  52                   push dx
6:2097  50                   push ax
6:2098  66ff36645a           push dword ptr [0x5a64]
6:209D  9af279d319           lcall 0x19d3, 0x79f2  ; sub_s8:79F2
loc_20A2:
6:20A2  66ff7606             push dword ptr [bp + 6]
6:20A6  90                   nop
6:20A7  0e                   push cs
6:20A8  e86d93               call 0xffffb418  ; sub_s6:B418
6:20AB  c9                   leave
6:20AC  ca0400               retf 4
6:20AF  db 00

; ---------------- sub_s6:20B0 FAR size=6 callers=1
6:20B0  33c0                 xor ax, ax
6:20B2  ca0400               retf 4
6:20B5  db 00

; ---------------- sub_s6:20B6 FAR size=260 callers=0
6:20B6  c8220000             enter 0x22, 0
6:20BA  57                   push di
6:20BB  56                   push si
6:20BC  66ff7606             push dword ptr [bp + 6]
6:20C0  90                   nop
6:20C1  0e                   push cs
6:20C2  e8d99d               call 0xffffbe9e  ; sub_s6:BE9E
6:20C5  c45e06               les bx, ptr [bp + 6]
6:20C8  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:20CD  0f85e300             jne 0x21b4
6:20D1  06                   push es
6:20D2  53                   push bx
6:20D3  90                   nop
6:20D4  0e                   push cs
6:20D5  e84c9a               call 0xffffbb24  ; sub_s6:BB24
6:20D8  8946fc               mov word ptr [bp - 4], ax
6:20DB  8956fe               mov word ptr [bp - 2], dx
6:20DE  66ff7606             push dword ptr [bp + 6]
6:20E2  90                   nop
6:20E3  0e                   push cs
6:20E4  e8a794               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:20E7  8946f8               mov word ptr [bp - 8], ax
6:20EA  8956fa               mov word ptr [bp - 6], dx
6:20ED  050c00               add ax, 0xc
6:20F0  1e                   push ds
6:20F1  8d7ef2               lea di, [bp - 0xe]
6:20F4  8bf0                 mov si, ax
6:20F6  16                   push ss
6:20F7  07                   pop es
6:20F8  8eda                 mov ds, dx
6:20FA  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:20FC  a5                   movsw word ptr es:[di], word ptr [si]
6:20FD  1f                   pop ds
6:20FE  8d46f2               lea ax, [bp - 0xe]
6:2101  8946ea               mov word ptr [bp - 0x16], ax
6:2104  8d46f0               lea ax, [bp - 0x10]
6:2107  16                   push ss
6:2108  50                   push ax
6:2109  8d46ee               lea ax, [bp - 0x12]
6:210C  16                   push ss
6:210D  50                   push ax
6:210E  8d4eec               lea cx, [bp - 0x14]
6:2111  16                   push ss
6:2112  51                   push cx
6:2113  8d4ef2               lea cx, [bp - 0xe]
6:2116  16                   push ss
6:2117  51                   push cx
6:2118  9ab43e0e20           lcall 0x200e, 0x3eb4  ; sub_s2:3EB4
6:211D  8b46ee               mov ax, word ptr [bp - 0x12]
6:2120  48                   dec ax
6:2121  8946ea               mov word ptr [bp - 0x16], ax
6:2124  8946f4               mov word ptr [bp - 0xc], ax
6:2127  66ff76fc             push dword ptr [bp - 4]
6:212B  8d46f2               lea ax, [bp - 0xe]
6:212E  16                   push ss
6:212F  50                   push ax
6:2130  66ff7606             push dword ptr [bp + 6]
6:2134  90                   nop
6:2135  0e                   push cs
6:2136  e88100               call 0x21ba  ; sub_s6:21BA
6:2139  0bc0                 or ax, ax
6:213B  7569                 jne 0x21a6
6:213D  8b46ee               mov ax, word ptr [bp - 0x12]
6:2140  40                   inc ax
6:2141  8946ea               mov word ptr [bp - 0x16], ax
6:2144  8946f4               mov word ptr [bp - 0xc], ax
6:2147  66ff76fc             push dword ptr [bp - 4]
6:214B  8d46f2               lea ax, [bp - 0xe]
6:214E  16                   push ss
6:214F  50                   push ax
6:2150  66ff7606             push dword ptr [bp + 6]
6:2154  90                   nop
6:2155  0e                   push cs
6:2156  e86100               call 0x21ba  ; sub_s6:21BA
6:2159  0bc0                 or ax, ax
6:215B  7549                 jne 0x21a6
6:215D  8b46ee               mov ax, word ptr [bp - 0x12]
6:2160  8946ea               mov word ptr [bp - 0x16], ax
6:2163  8946f4               mov word ptr [bp - 0xc], ax
6:2166  8b46f0               mov ax, word ptr [bp - 0x10]
6:2169  48                   dec ax
6:216A  8946ea               mov word ptr [bp - 0x16], ax
6:216D  8946f2               mov word ptr [bp - 0xe], ax
6:2170  66ff76fc             push dword ptr [bp - 4]
6:2174  8d46f2               lea ax, [bp - 0xe]
6:2177  16                   push ss
6:2178  50                   push ax
6:2179  66ff7606             push dword ptr [bp + 6]
6:217D  90                   nop
6:217E  0e                   push cs
6:217F  e83800               call 0x21ba  ; sub_s6:21BA
6:2182  0bc0                 or ax, ax
6:2184  7520                 jne 0x21a6
6:2186  8b46f0               mov ax, word ptr [bp - 0x10]
6:2189  40                   inc ax
6:218A  8946ea               mov word ptr [bp - 0x16], ax
6:218D  8946f2               mov word ptr [bp - 0xe], ax
6:2190  66ff76fc             push dword ptr [bp - 4]
6:2194  8d46f2               lea ax, [bp - 0xe]
6:2197  16                   push ss
6:2198  50                   push ax
6:2199  66ff7606             push dword ptr [bp + 6]
6:219D  90                   nop
6:219E  0e                   push cs
6:219F  e81800               call 0x21ba  ; sub_s6:21BA
6:21A2  0bc0                 or ax, ax
6:21A4  740e                 je 0x21b4
loc_21A6:
6:21A6  66ff76f8             push dword ptr [bp - 8]
6:21AA  66ff36645a           push dword ptr [0x5a64]
6:21AF  9ab279a020           lcall 0x20a0, 0x79b2  ; sub_s8:79B2
loc_21B4:
6:21B4  5e                   pop si
6:21B5  5f                   pop di
6:21B6  c9                   leave
6:21B7  ca0400               retf 4

; ---------------- sub_s6:21BA FAR size=102 callers=1
6:21BA  c8140000             enter 0x14, 0
6:21BE  66ff760e             push dword ptr [bp + 0xe]
6:21C2  66ff760a             push dword ptr [bp + 0xa]
6:21C6  66ff364057           push dword ptr [0x5740]
6:21CB  9a7e620022           lcall 0x2200, 0x627e  ; sub_s7:627E
6:21D0  8956fe               mov word ptr [bp - 2], dx
6:21D3  0bd0                 or dx, ax
6:21D5  7507                 jne 0x21de
loc_21D7:
6:21D7  33c0                 xor ax, ax
6:21D9  c9                   leave
6:21DA  ca0c00               retf 0xc
6:21DD  db 90
loc_21DE:
6:21DE  ff76fe               push word ptr [bp - 2]
6:21E1  50                   push ax
6:21E2  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:21E7  90                   nop
6:21E8  0e                   push cs
6:21E9  e800c0               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:21EC  8946f8               mov word ptr [bp - 8], ax
6:21EF  c45e0a               les bx, ptr [bp + 0xa]
6:21F2  8bc2                 mov ax, dx
6:21F4  0b46f8               or ax, word ptr [bp - 8]
6:21F7  74de                 je 0x21d7
6:21F9  52                   push dx
6:21FA  ff76f8               push word ptr [bp - 8]
6:21FD  9aa873f81e           lcall 0x1ef8, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:2202  8946f2               mov word ptr [bp - 0xe], ax
6:2205  8956f4               mov word ptr [bp - 0xc], dx
6:2208  0bd0                 or dx, ax
6:220A  74cb                 je 0x21d7
6:220C  c45ef2               les bx, ptr [bp - 0xe]
6:220F  268b470c             mov ax, word ptr es:[bx + 0xc]
6:2213  3d4000               cmp ax, 0x40
6:2216  75bf                 jne 0x21d7
6:2218  b80100               mov ax, 1
6:221B  c9                   leave
6:221C  ca0c00               retf 0xc
6:221F  db 00

; ---------------- sub_s6:2220 FAR size=112 callers=1
6:2220  c8140000             enter 0x14, 0
6:2224  66ff7610             push dword ptr [bp + 0x10]
6:2228  66ff760c             push dword ptr [bp + 0xc]
6:222C  66ff364057           push dword ptr [0x5740]
6:2231  9a7e626622           lcall 0x2266, 0x627e  ; sub_s7:627E
6:2236  8956fe               mov word ptr [bp - 2], dx
6:2239  0bd0                 or dx, ax
6:223B  7507                 jne 0x2244
loc_223D:
6:223D  33c0                 xor ax, ax
6:223F  c9                   leave
6:2240  ca0e00               retf 0xe
6:2243  db 90
loc_2244:
6:2244  ff76fe               push word ptr [bp - 2]
6:2247  50                   push ax
6:2248  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:224D  90                   nop
6:224E  0e                   push cs
6:224F  e89abf               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:2252  8946f8               mov word ptr [bp - 8], ax
6:2255  c45e0c               les bx, ptr [bp + 0xc]
6:2258  8bc2                 mov ax, dx
6:225A  0b46f8               or ax, word ptr [bp - 8]
6:225D  74de                 je 0x223d
6:225F  52                   push dx
6:2260  ff76f8               push word ptr [bp - 8]
6:2263  9aa873ce21           lcall 0x21ce, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:2268  8946f2               mov word ptr [bp - 0xe], ax
6:226B  8956f4               mov word ptr [bp - 0xc], dx
6:226E  0bd0                 or dx, ax
6:2270  74cb                 je 0x223d
6:2272  c45ef2               les bx, ptr [bp - 0xe]
6:2275  268b470c             mov ax, word ptr es:[bx + 0xc]
6:2279  8946f0               mov word ptr [bp - 0x10], ax
6:227C  3d4000               cmp ax, 0x40
6:227F  7408                 je 0x2289
6:2281  8b460a               mov ax, word ptr [bp + 0xa]
6:2284  3946f0               cmp word ptr [bp - 0x10], ax
6:2287  75b4                 jne 0x223d
loc_2289:
6:2289  b80100               mov ax, 1
6:228C  c9                   leave
6:228D  ca0e00               retf 0xe

; ---------------- sub_s6:2290 size=218 callers=0
6:2290  c8160000             enter 0x16, 0
6:2294  57                   push di
6:2295  56                   push si
6:2296  8b460a               mov ax, word ptr [bp + 0xa]
6:2299  8b560c               mov dx, word ptr [bp + 0xc]
6:229C  1e                   push ds
6:229D  8d7efa               lea di, [bp - 6]
6:22A0  8bf0                 mov si, ax
6:22A2  16                   push ss
6:22A3  07                   pop es
6:22A4  8eda                 mov ds, dx
6:22A6  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:22A8  a5                   movsw word ptr es:[di], word ptr [si]
6:22A9  1f                   pop ds
6:22AA  8d46fa               lea ax, [bp - 6]
6:22AD  8946f2               mov word ptr [bp - 0xe], ax
6:22B0  8d46f8               lea ax, [bp - 8]
6:22B3  16                   push ss
6:22B4  50                   push ax
6:22B5  8d46f6               lea ax, [bp - 0xa]
6:22B8  16                   push ss
6:22B9  50                   push ax
6:22BA  8d4ef4               lea cx, [bp - 0xc]
6:22BD  16                   push ss
6:22BE  51                   push cx
6:22BF  8d4efa               lea cx, [bp - 6]
6:22C2  16                   push ss
6:22C3  51                   push cx
6:22C4  9ab43e1b21           lcall 0x211b, 0x3eb4  ; sub_s2:3EB4
6:22C9  8b46f6               mov ax, word ptr [bp - 0xa]
6:22CC  48                   dec ax
6:22CD  8946ea               mov word ptr [bp - 0x16], ax
6:22D0  8946fc               mov word ptr [bp - 4], ax
6:22D3  66ff7612             push dword ptr [bp + 0x12]
6:22D7  8d46fa               lea ax, [bp - 6]
6:22DA  16                   push ss
6:22DB  50                   push ax
6:22DC  6a16                 push 0x16
6:22DE  66ff7606             push dword ptr [bp + 6]
6:22E2  90                   nop
6:22E3  0e                   push cs
6:22E4  e839ff               call 0x2220  ; sub_s6:2220
6:22E7  0bc0                 or ax, ax
6:22E9  7409                 je 0x22f4
loc_22EB:
6:22EB  b80100               mov ax, 1
6:22EE  5e                   pop si
6:22EF  5f                   pop di
6:22F0  c9                   leave
6:22F1  ca1000               retf 0x10
loc_22F4:
6:22F4  8b46f6               mov ax, word ptr [bp - 0xa]
6:22F7  40                   inc ax
6:22F8  8946f0               mov word ptr [bp - 0x10], ax
6:22FB  8946fc               mov word ptr [bp - 4], ax
6:22FE  66ff7612             push dword ptr [bp + 0x12]
6:2302  8d46fa               lea ax, [bp - 6]
6:2305  16                   push ss
6:2306  50                   push ax
6:2307  6a16                 push 0x16
6:2309  66ff7606             push dword ptr [bp + 6]
6:230D  90                   nop
6:230E  0e                   push cs
6:230F  e80eff               call 0x2220  ; sub_s6:2220
6:2312  0bc0                 or ax, ax
6:2314  75d5                 jne 0x22eb
6:2316  8b46f6               mov ax, word ptr [bp - 0xa]
6:2319  8946f0               mov word ptr [bp - 0x10], ax
6:231C  8946fc               mov word ptr [bp - 4], ax
6:231F  8b46f8               mov ax, word ptr [bp - 8]
6:2322  48                   dec ax
6:2323  8946f0               mov word ptr [bp - 0x10], ax
6:2326  8946fa               mov word ptr [bp - 6], ax
6:2329  66ff7612             push dword ptr [bp + 0x12]
6:232D  8d46fa               lea ax, [bp - 6]
6:2330  16                   push ss
6:2331  50                   push ax
6:2332  6a17                 push 0x17
6:2334  66ff7606             push dword ptr [bp + 6]
6:2338  90                   nop
6:2339  0e                   push cs
6:233A  e8e3fe               call 0x2220  ; sub_s6:2220
6:233D  0bc0                 or ax, ax
6:233F  75aa                 jne 0x22eb
6:2341  8b46f8               mov ax, word ptr [bp - 8]
6:2344  40                   inc ax
6:2345  8946f0               mov word ptr [bp - 0x10], ax
6:2348  8946fa               mov word ptr [bp - 6], ax
6:234B  66ff7612             push dword ptr [bp + 0x12]
6:234F  8d46fa               lea ax, [bp - 6]
6:2352  16                   push ss
6:2353  50                   push ax
6:2354  6a17                 push 0x17
6:2356  66ff7606             push dword ptr [bp + 6]
6:235A  90                   nop
6:235B  0e                   push cs
6:235C  e8c1fe               call 0x2220  ; sub_s6:2220
6:235F  0bc0                 or ax, ax
6:2361  7588                 jne 0x22eb
6:2363  5e                   pop si
6:2364  5f                   pop di
6:2365  c9                   leave
6:2366  ca1000               retf 0x10
6:2369  db 00

; ---------------- sub_s6:236A FAR size=62 callers=0
6:236A  c8040000             enter 4, 0
6:236E  c45e06               les bx, ptr [bp + 6]
6:2371  26f6471a02           test byte ptr es:[bx + 0x1a], 2
6:2376  7528                 jne 0x23a0
6:2378  666800002300         push 0x230000
6:237E  6a01                 push 1
6:2380  06                   push es
6:2381  53                   push bx
6:2382  90                   nop
6:2383  0e                   push cs
6:2384  e80792               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:2387  52                   push dx
6:2388  50                   push ax
6:2389  9a7c7d3422           lcall 0x2234, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:238E  6a06                 push 6
6:2390  66ff7606             push dword ptr [bp + 6]
6:2394  90                   nop
6:2395  0e                   push cs
6:2396  e8139a               call 0xffffbdac  ; sub_s6:BDAC
6:2399  33c0                 xor ax, ax
6:239B  c9                   leave
6:239C  ca0400               retf 4
6:239F  db 90
loc_23A0:
6:23A0  b80100               mov ax, 1
6:23A3  c9                   leave
6:23A4  ca0400               retf 4
6:23A7  db 00

; ---------------- sub_s6:23A8 FAR size=112 callers=0
6:23A8  c8140000             enter 0x14, 0
6:23AC  8d46fe               lea ax, [bp - 2]
6:23AF  16                   push ss
6:23B0  50                   push ax
6:23B1  9aaebcfa23           lcall 0x23fa, 0xbcae  ; sub_s7:BCAE
6:23B6  66ff760e             push dword ptr [bp + 0xe]
6:23BA  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:23BF  90                   nop
6:23C0  0e                   push cs
6:23C1  e828be               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:23C4  8946fa               mov word ptr [bp - 6], ax
6:23C7  8956fc               mov word ptr [bp - 4], dx
6:23CA  c45efa               les bx, ptr [bp - 6]
6:23CD  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:23D2  668946f6             mov dword ptr [bp - 0xa], eax
6:23D6  66ff7612             push dword ptr [bp + 0x12]
6:23DA  66ff760a             push dword ptr [bp + 0xa]
6:23DE  6650                 push eax
6:23E0  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:23E5  90                   nop
6:23E6  0e                   push cs
6:23E7  e802be               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:23EA  8946f2               mov word ptr [bp - 0xe], ax
6:23ED  8956f4               mov word ptr [bp - 0xc], dx
6:23F0  52                   push dx
6:23F1  50                   push ax
6:23F2  8d46fe               lea ax, [bp - 2]
6:23F5  16                   push ss
6:23F6  50                   push ax
6:23F7  9adebc8c23           lcall 0x238c, 0xbcde  ; sub_s7:BCDE
6:23FC  8946f0               mov word ptr [bp - 0x10], ax
6:23FF  0bc0                 or ax, ax
6:2401  7d0d                 jge 0x2410
6:2403  c706ca50af06         mov word ptr [0x50ca], 0x6af
6:2409  33c0                 xor ax, ax
6:240B  c9                   leave
6:240C  ca1000               retf 0x10
6:240F  db 90
loc_2410:
6:2410  b80100               mov ax, 1
6:2413  c9                   leave
6:2414  ca1000               retf 0x10
6:2417  db 00

; ---------------- sub_s6:2418 FAR size=138 callers=0
6:2418  c81a0000             enter 0x1a, 0
6:241C  66ff760a             push dword ptr [bp + 0xa]
6:2420  66ff7606             push dword ptr [bp + 6]
6:2424  90                   nop
6:2425  0e                   push cs
6:2426  e8c391               call 0xffffb5ec  ; sub_s6:B5EC
6:2429  0bc0                 or ax, ax
6:242B  7470                 je 0x249d
6:242D  c45e06               les bx, ptr [bp + 6]
6:2430  6626ff7720           push dword ptr es:[bx + 0x20]
6:2435  8d46f8               lea ax, [bp - 8]
6:2438  16                   push ss
6:2439  50                   push ax
6:243A  9a84575f24           lcall 0x245f, 0x5784  ; ListIter::ListIter@s2:5784
6:243F  c45e06               les bx, ptr [bp + 6]
6:2442  26c45f20             les bx, ptr es:[bx + 0x20]
6:2446  268b4708             mov ax, word ptr es:[bx + 8]
6:244A  8946f2               mov word ptr [bp - 0xe], ax
6:244D  8946e6               mov word ptr [bp - 0x1a], ax
6:2450  666a02               push 2
6:2453  8d46e6               lea ax, [bp - 0x1a]
6:2456  16                   push ss
6:2457  50                   push ax
6:2458  66ff760a             push dword ptr [bp + 0xa]
6:245C  9a1c7e7824           lcall 0x2478, 0x7e1c  ; File_write@s2:7E1C
6:2461  0bc0                 or ax, ax
6:2463  750b                 jne 0x2470
6:2465  c7061003d006         mov word ptr [0x310], 0x6d0
6:246B  c9                   leave
6:246C  ca0800               retf 8
6:246F  db 90
loc_2470:
6:2470  8d46f8               lea ax, [bp - 8]
6:2473  16                   push ss
6:2474  50                   push ax
6:2475  9a125bc722           lcall 0x22c7, 0x5b12  ; ListIter::next@s2:5B12
6:247A  8946f4               mov word ptr [bp - 0xc], ax
6:247D  8956f6               mov word ptr [bp - 0xa], dx
6:2480  0bd0                 or dx, ax
6:2482  7416                 je 0x249a
6:2484  66ff760a             push dword ptr [bp + 0xa]
6:2488  ff76f6               push word ptr [bp - 0xa]
6:248B  50                   push ax
6:248C  9aca75b221           lcall 0x21b2, 0x75ca  ; sub_s8:75CA
6:2491  0bc0                 or ax, ax
6:2493  75db                 jne 0x2470
6:2495  c9                   leave
6:2496  ca0800               retf 8
6:2499  db 90
loc_249A:
6:249A  b80100               mov ax, 1
loc_249D:
6:249D  c9                   leave
6:249E  ca0800               retf 8
6:24A1  db 00

; ---------------- sub_s6:24A2 FAR size=170 callers=0
6:24A2  c8160000             enter 0x16, 0
6:24A6  66ff760a             push dword ptr [bp + 0xa]
6:24AA  66ff7606             push dword ptr [bp + 6]
6:24AE  90                   nop
6:24AF  0e                   push cs
6:24B0  e86793               call 0xffffb81a  ; sub_s6:B81A
6:24B3  0bc0                 or ax, ax
6:24B5  7507                 jne 0x24be
loc_24B7:
6:24B7  33c0                 xor ax, ax
6:24B9  c9                   leave
6:24BA  ca0800               retf 8
6:24BD  db 90
loc_24BE:
6:24BE  833e120302           cmp word ptr [0x312], 2
6:24C3  7c7f                 jl 0x2544
6:24C5  666a02               push 2
6:24C8  8d46fe               lea ax, [bp - 2]
6:24CB  16                   push ss
6:24CC  50                   push ax
6:24CD  66ff760a             push dword ptr [bp + 0xa]
6:24D1  9aee7d3d24           lcall 0x243d, 0x7dee  ; File_read@s2:7DEE
6:24D6  0bc0                 or ax, ax
6:24D8  7508                 jne 0x24e2
6:24DA  c7061003d206         mov word ptr [0x310], 0x6d2
6:24E0  ebd5                 jmp 0x24b7
loc_24E2:
6:24E2  c746fc0000           mov word ptr [bp - 4], 0
6:24E7  eb2f                 jmp 0x2518
6:24E9  db 90
loc_24EA:
6:24EA  33c0                 xor ax, ax
6:24EC  99                   cdq
loc_24ED:
6:24ED  8946ee               mov word ptr [bp - 0x12], ax
6:24F0  8956f0               mov word ptr [bp - 0x10], dx
6:24F3  52                   push dx
6:24F4  50                   push ax
6:24F5  9a4e773f25           lcall 0x253f, 0x774e  ; sub_s8:774E
6:24FA  0bc0                 or ax, ax
6:24FC  74b9                 je 0x24b7
6:24FE  66ff76ee             push dword ptr [bp - 0x12]
6:2502  c45e06               les bx, ptr [bp + 6]
6:2505  6626ff7720           push dword ptr es:[bx + 0x20]
6:250A  26c45f20             les bx, ptr es:[bx + 0x20]
6:250E  26c41f               les bx, ptr es:[bx]
6:2511  26ff5f08             lcall es:[bx + 8]
6:2515  ff46fc               inc word ptr [bp - 4]
loc_2518:
6:2518  8b46fe               mov ax, word ptr [bp - 2]
6:251B  3946fc               cmp word ptr [bp - 4], ax
6:251E  7324                 jae 0x2544
6:2520  66ff760a             push dword ptr [bp + 0xa]
6:2524  6a2a                 push 0x2a
6:2526  9a9c17fb1f           lcall 0x1ffb, 0x179c  ; operator_new@s1:179C
6:252B  83c402               add sp, 2
6:252E  8946ea               mov word ptr [bp - 0x16], ax
6:2531  8956ec               mov word ptr [bp - 0x14], dx
6:2534  0bd0                 or dx, ax
6:2536  74b2                 je 0x24ea
6:2538  ff76ec               push word ptr [bp - 0x14]
6:253B  50                   push ax
6:253C  9a20658f24           lcall 0x248f, 0x6520  ; sub_s8:6520
6:2541  ebaa                 jmp 0x24ed
6:2543  db 90
loc_2544:
6:2544  b80100               mov ax, 1
6:2547  c9                   leave
6:2548  ca0800               retf 8
6:254B  db 00

; ---------------- sub_s6:254C FAR size=142 callers=0
6:254C  55                   push bp
6:254D  8bec                 mov bp, sp
6:254F  66ff7606             push dword ptr [bp + 6]
6:2553  90                   nop
6:2554  0e                   push cs
6:2555  e8eafa               call 0x2042  ; sub_s6:2042
6:2558  f6460a01             test byte ptr [bp + 0xa], 1
6:255C  7409                 je 0x2567
6:255E  66ff7606             push dword ptr [bp + 6]
6:2562  9ace172925           lcall 0x2529, 0x17ce  ; operator_delete@s1:17CE
loc_2567:
6:2567  8b4606               mov ax, word ptr [bp + 6]
6:256A  8b5608               mov dx, word ptr [bp + 8]
6:256D  c9                   leave
6:256E  ca0600               retf 6
6:2571  db 90 4c 25 78 25 56 bb 80 25 8e 17 b4 23 18 24 84
6:2581  db 25 a2 24 88 25 1c bc 8c 25 38 bd 90 25 90 bc 94
6:2591  db 25 7e bc 98 25 14 b5 9c 25 2a be a0 25 16 bf a4
6:25A1  db 25 1a bf a8 25 1e bf ac 25 b6 20 b0 25 22 bf b4
6:25B1  db 25 f0 bb b8 25 02 bc bc 25 a8 b5 c0 25 ca b5 c4
6:25C1  db 25 e6 b4 c8 25 ec b4 cc 25 6e b4 d0 25 90 22 d4
6:25D1  db 25 a8 23 d8 25 6a 23 52 20

; ---------------- sub_s6:25DA FAR size=34 callers=1
6:25DA  55                   push bp
6:25DB  8bec                 mov bp, sp
6:25DD  66ff7606             push dword ptr [bp + 6]
6:25E1  90                   nop
6:25E2  0e                   push cs
6:25E3  e86e8d               call 0xffffb354  ; Building::Building()@s6:B354
6:25E6  c45e06               les bx, ptr [bp + 6]
6:25E9  26c7074c26           mov word ptr es:[bx], 0x264c
6:25EE  26c747027425         mov word ptr es:[bx + 2], 0x2574  ; SEGMENT s6:0000
6:25F4  8bc3                 mov ax, bx
6:25F6  8cc2                 mov dx, es
6:25F8  c9                   leave
6:25F9  ca0400               retf 4

; ---------------- sub_s6:25FC FAR size=42 callers=1
6:25FC  55                   push bp
6:25FD  8bec                 mov bp, sp
6:25FF  66ff760c             push dword ptr [bp + 0xc]
6:2603  66ff7608             push dword ptr [bp + 8]
6:2607  ff7606               push word ptr [bp + 6]
6:260A  90                   nop
6:260B  0e                   push cs
6:260C  e88f8d               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:260F  c45e06               les bx, ptr [bp + 6]
6:2612  26c7074c26           mov word ptr es:[bx], 0x264c
6:2617  26c74702f225         mov word ptr es:[bx + 2], 0x25f2  ; SEGMENT s6:0000
6:261D  8bc3                 mov ax, bx
6:261F  8cc2                 mov dx, es
6:2621  c9                   leave
6:2622  ca0a00               retf 0xa
6:2625  db 00

; ---------------- sub_s6:2626 FAR size=142 callers=0
6:2626  c8040000             enter 4, 0
6:262A  66ff7606             push dword ptr [bp + 6]
6:262E  90                   nop
6:262F  0e                   push cs
6:2630  e8e58d               call 0xffffb418  ; sub_s6:B418
6:2633  f6460a01             test byte ptr [bp + 0xa], 1
6:2637  7409                 je 0x2642
6:2639  66ff7606             push dword ptr [bp + 6]
6:263D  9ace176525           lcall 0x2565, 0x17ce  ; operator_delete@s1:17CE
loc_2642:
6:2642  8b4606               mov ax, word ptr [bp + 6]
6:2645  8b5608               mov dx, word ptr [bp + 8]
6:2648  c9                   leave
6:2649  ca0600               retf 6
6:264C  db 26 26 52 26 56 bb 5a 26 8e 17 7c 25 ec b5 5e 26
6:265C  db 1a b8 62 26 1c bc 66 26 38 bd 6a 26 90 bc 6e 26
6:266C  db 7e bc 72 26 14 b5 76 26 2a be 7a 26 16 bf 7e 26
6:267C  db 1a bf 82 26 1e bf 86 26 9e be 8a 26 22 bf 8e 26
6:268C  db f0 bb 92 26 02 bc 96 26 a8 b5 9a 26 ca b5 9e 26
6:269C  db e6 b4 a2 26 ec b4 a6 26 6e b4 aa 26 4a c6 ae 26
6:26AC  db 22 c5 b2 26 d2 ce 1b 26

; ---------------- sub_s6:26B4 FAR size=34 callers=1
6:26B4  55                   push bp
6:26B5  8bec                 mov bp, sp
6:26B7  66ff7606             push dword ptr [bp + 6]
6:26BB  90                   nop
6:26BC  0e                   push cs
6:26BD  e8948c               call 0xffffb354  ; Building::Building()@s6:B354
6:26C0  c45e06               les bx, ptr [bp + 6]
6:26C3  26c7078827           mov word ptr es:[bx], 0x2788
6:26C8  26c747024e26         mov word ptr es:[bx + 2], 0x264e  ; SEGMENT s6:0000 | 'fem17.wav'
6:26CE  8bc3                 mov ax, bx
6:26D0  8cc2                 mov dx, es
6:26D2  c9                   leave
6:26D3  ca0400               retf 4

; ---------------- sub_s6:26D6 FAR size=42 callers=1
6:26D6  55                   push bp
6:26D7  8bec                 mov bp, sp
6:26D9  66ff760c             push dword ptr [bp + 0xc]
6:26DD  66ff7608             push dword ptr [bp + 8]
6:26E1  ff7606               push word ptr [bp + 6]
6:26E4  90                   nop
6:26E5  0e                   push cs
6:26E6  e8b58c               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:26E9  c45e06               les bx, ptr [bp + 6]
6:26EC  26c7078827           mov word ptr es:[bx], 0x2788
6:26F1  26c74702cc26         mov word ptr es:[bx + 2], 0x26cc  ; SEGMENT s6:0000
6:26F7  8bc3                 mov ax, bx
6:26F9  8cc2                 mov dx, es
6:26FB  c9                   leave
6:26FC  ca0a00               retf 0xa
6:26FF  db 00

; ---------------- sub_s6:2700 FAR size=46 callers=0
6:2700  c80c0000             enter 0xc, 0
6:2704  66ff7606             push dword ptr [bp + 6]
6:2708  90                   nop
6:2709  0e                   push cs
6:270A  e81d97               call 0xffffbe2a  ; sub_s6:BE2A
6:270D  c45e06               les bx, ptr [bp + 6]
6:2710  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:2715  7512                 jne 0x2729
6:2717  06                   push es
6:2718  53                   push bx
6:2719  90                   nop
6:271A  0e                   push cs
6:271B  e8d48d               call 0xffffb4f2  ; sub_s6:B4F2
6:271E  8bd8                 mov bx, ax
6:2720  8ec2                 mov es, dx
6:2722  26c78704020100       mov word ptr es:[bx + 0x204], 1
loc_2729:
6:2729  c9                   leave
6:272A  ca0400               retf 4
6:272D  db 00

; ---------------- sub_s6:272E FAR size=52 callers=0
6:272E  c80c0000             enter 0xc, 0
6:2732  66ff7606             push dword ptr [bp + 6]
6:2736  90                   nop
6:2737  0e                   push cs
6:2738  e86397               call 0xffffbe9e  ; sub_s6:BE9E
6:273B  66ff7606             push dword ptr [bp + 6]
6:273F  90                   nop
6:2740  0e                   push cs
6:2741  e8ae8d               call 0xffffb4f2  ; sub_s6:B4F2
6:2744  8946fc               mov word ptr [bp - 4], ax
6:2747  8956fe               mov word ptr [bp - 2], dx
6:274A  c45e06               les bx, ptr [bp + 6]
6:274D  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:2752  750a                 jne 0x275e
6:2754  c45efc               les bx, ptr [bp - 4]
6:2757  26c78704020100       mov word ptr es:[bx + 0x204], 1
loc_275E:
6:275E  c9                   leave
6:275F  ca0400               retf 4

; ---------------- sub_s6:2762 size=142 callers=0
6:2762  c8040000             enter 4, 0
6:2766  66ff7606             push dword ptr [bp + 6]
6:276A  90                   nop
6:276B  0e                   push cs
6:276C  e8a98c               call 0xffffb418  ; sub_s6:B418
6:276F  f6460a01             test byte ptr [bp + 0xa], 1
6:2773  7409                 je 0x277e
6:2775  66ff7606             push dword ptr [bp + 6]
6:2779  9ace174026           lcall 0x2640, 0x17ce  ; operator_delete@s1:17CE
loc_277E:
6:277E  8b4606               mov ax, word ptr [bp + 6]
6:2781  8b5608               mov dx, word ptr [bp + 8]
6:2784  c9                   leave
6:2785  ca0600               retf 6
6:2788  db 62 27 8e 27 56 bb 96 27 8e 17 56 26 ec b5 9a 27
6:2798  db 1a b8 9e 27 1c bc a2 27 38 bd a6 27 90 bc aa 27
6:27A8  db 7e bc ae 27 14 b5 b2 27 00 27 b6 27 16 bf ba 27
6:27B8  db 1a bf be 27 1e bf c2 27 2e 27 c6 27 22 bf ca 27
6:27C8  db f0 bb ce 27 02 bc d2 27 a8 b5 d6 27 ca b5 da 27
6:27D8  db e6 b4 de 27 ec b4 e2 27 6e b4 e6 27 4a c6 ea 27
6:27E8  db 22 c5 ee 27 d2 ce f5 26

; ---------------- sub_s6:27F0 FAR size=34 callers=1
6:27F0  55                   push bp
6:27F1  8bec                 mov bp, sp
6:27F3  66ff7606             push dword ptr [bp + 6]
6:27F7  90                   nop
6:27F8  0e                   push cs
6:27F9  e8588b               call 0xffffb354  ; Building::Building()@s6:B354
6:27FC  c45e06               les bx, ptr [bp + 6]
6:27FF  26c707922a           mov word ptr es:[bx], 0x2a92
6:2804  26c747028a27         mov word ptr es:[bx + 2], 0x278a  ; SEGMENT s6:0000
6:280A  8bc3                 mov ax, bx
6:280C  8cc2                 mov dx, es
6:280E  c9                   leave
6:280F  ca0400               retf 4

; ---------------- sub_s6:2812 FAR size=50 callers=1
6:2812  55                   push bp
6:2813  8bec                 mov bp, sp
6:2815  66ff760c             push dword ptr [bp + 0xc]
6:2819  66ff7608             push dword ptr [bp + 8]
6:281D  ff7606               push word ptr [bp + 6]
6:2820  90                   nop
6:2821  0e                   push cs
6:2822  e8798b               call 0xffffb39e  ; Building::Building(type,owner)@s6:B39E
6:2825  c45e06               les bx, ptr [bp + 6]
6:2828  26c707922a           mov word ptr es:[bx], 0x2a92
6:282D  26c747020828         mov word ptr es:[bx + 2], 0x2808  ; SEGMENT s6:0000
6:2833  268b470c             mov ax, word ptr es:[bx + 0xc]
6:2837  2689470e             mov word ptr es:[bx + 0xe], ax
6:283B  8bc3                 mov ax, bx
6:283D  8cc2                 mov dx, es
6:283F  c9                   leave
6:2840  ca0a00               retf 0xa
6:2843  db 00

; ---------------- sub_s6:2844 FAR size=312 callers=0
6:2844  c8160000             enter 0x16, 0
6:2848  57                   push di
6:2849  56                   push si
6:284A  8b460a               mov ax, word ptr [bp + 0xa]
6:284D  8b560c               mov dx, word ptr [bp + 0xc]
6:2850  1e                   push ds
6:2851  8d7efa               lea di, [bp - 6]
6:2854  8bf0                 mov si, ax
6:2856  16                   push ss
6:2857  07                   pop es
6:2858  8eda                 mov ds, dx
6:285A  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:285C  a5                   movsw word ptr es:[di], word ptr [si]
6:285D  1f                   pop ds
6:285E  8d46fa               lea ax, [bp - 6]
6:2861  8946f2               mov word ptr [bp - 0xe], ax
6:2864  8d46f8               lea ax, [bp - 8]
6:2867  16                   push ss
6:2868  50                   push ax
6:2869  8d46f6               lea ax, [bp - 0xa]
6:286C  16                   push ss
6:286D  50                   push ax
6:286E  8d4ef4               lea cx, [bp - 0xc]
6:2871  16                   push ss
6:2872  51                   push cx
6:2873  8d4efa               lea cx, [bp - 6]
6:2876  16                   push ss
6:2877  51                   push cx
6:2878  9ab43ed424           lcall 0x24d4, 0x3eb4  ; sub_s2:3EB4
6:287D  8b46f6               mov ax, word ptr [bp - 0xa]
6:2880  48                   dec ax
6:2881  8946ea               mov word ptr [bp - 0x16], ax
6:2884  8946fc               mov word ptr [bp - 4], ax
6:2887  66ff7612             push dword ptr [bp + 0x12]
6:288B  8d46fa               lea ax, [bp - 6]
6:288E  16                   push ss
6:288F  50                   push ax
6:2890  6a7b                 push 0x7b
6:2892  66ff7606             push dword ptr [bp + 6]
6:2896  90                   nop
6:2897  0e                   push cs
6:2898  e80b9d               call 0xffffc5a6  ; sub_s6:C5A6
6:289B  0bc0                 or ax, ax
6:289D  7516                 jne 0x28b5
6:289F  66ff7612             push dword ptr [bp + 0x12]
6:28A3  8d46fa               lea ax, [bp - 6]
6:28A6  16                   push ss
6:28A7  50                   push ax
6:28A8  66ff7606             push dword ptr [bp + 6]
6:28AC  90                   nop
6:28AD  0e                   push cs
6:28AE  e8cb00               call 0x297c  ; sub_s6:297C
6:28B1  0bc0                 or ax, ax
6:28B3  7409                 je 0x28be
loc_28B5:
6:28B5  b80100               mov ax, 1
6:28B8  5e                   pop si
6:28B9  5f                   pop di
6:28BA  c9                   leave
6:28BB  ca1000               retf 0x10
loc_28BE:
6:28BE  8b46f6               mov ax, word ptr [bp - 0xa]
6:28C1  40                   inc ax
6:28C2  8946f0               mov word ptr [bp - 0x10], ax
6:28C5  8946fc               mov word ptr [bp - 4], ax
6:28C8  66ff7612             push dword ptr [bp + 0x12]
6:28CC  8d46fa               lea ax, [bp - 6]
6:28CF  16                   push ss
6:28D0  50                   push ax
6:28D1  6a7b                 push 0x7b
6:28D3  66ff7606             push dword ptr [bp + 6]
6:28D7  90                   nop
6:28D8  0e                   push cs
6:28D9  e8ca9c               call 0xffffc5a6  ; sub_s6:C5A6
6:28DC  0bc0                 or ax, ax
6:28DE  75d5                 jne 0x28b5
6:28E0  66ff7612             push dword ptr [bp + 0x12]
6:28E4  8d46fa               lea ax, [bp - 6]
6:28E7  16                   push ss
6:28E8  50                   push ax
6:28E9  66ff7606             push dword ptr [bp + 6]
6:28ED  90                   nop
6:28EE  0e                   push cs
6:28EF  e88a00               call 0x297c  ; sub_s6:297C
6:28F2  0bc0                 or ax, ax
6:28F4  75bf                 jne 0x28b5
6:28F6  8b46f6               mov ax, word ptr [bp - 0xa]
6:28F9  8946f0               mov word ptr [bp - 0x10], ax
6:28FC  8946fc               mov word ptr [bp - 4], ax
6:28FF  8b46f8               mov ax, word ptr [bp - 8]
6:2902  48                   dec ax
6:2903  8946f0               mov word ptr [bp - 0x10], ax
6:2906  8946fa               mov word ptr [bp - 6], ax
6:2909  66ff7612             push dword ptr [bp + 0x12]
6:290D  8d46fa               lea ax, [bp - 6]
6:2910  16                   push ss
6:2911  50                   push ax
6:2912  6a7c                 push 0x7c
6:2914  66ff7606             push dword ptr [bp + 6]
6:2918  90                   nop
6:2919  0e                   push cs
6:291A  e8899c               call 0xffffc5a6  ; sub_s6:C5A6
6:291D  0bc0                 or ax, ax
6:291F  7594                 jne 0x28b5
6:2921  66ff7612             push dword ptr [bp + 0x12]
6:2925  8d46fa               lea ax, [bp - 6]
6:2928  16                   push ss
6:2929  50                   push ax
6:292A  66ff7606             push dword ptr [bp + 6]
6:292E  90                   nop
6:292F  0e                   push cs
6:2930  e84900               call 0x297c  ; sub_s6:297C
6:2933  0bc0                 or ax, ax
6:2935  0f857cff             jne 0x28b5
6:2939  8b46f8               mov ax, word ptr [bp - 8]
6:293C  40                   inc ax
6:293D  8946f0               mov word ptr [bp - 0x10], ax
6:2940  8946fa               mov word ptr [bp - 6], ax
6:2943  66ff7612             push dword ptr [bp + 0x12]
6:2947  8d46fa               lea ax, [bp - 6]
6:294A  16                   push ss
6:294B  50                   push ax
6:294C  6a7c                 push 0x7c
6:294E  66ff7606             push dword ptr [bp + 6]
6:2952  90                   nop
6:2953  0e                   push cs
6:2954  e84f9c               call 0xffffc5a6  ; sub_s6:C5A6
6:2957  0bc0                 or ax, ax
6:2959  0f8558ff             jne 0x28b5
6:295D  66ff7612             push dword ptr [bp + 0x12]
6:2961  8d46fa               lea ax, [bp - 6]
6:2964  16                   push ss
6:2965  50                   push ax
6:2966  66ff7606             push dword ptr [bp + 6]
6:296A  90                   nop
6:296B  0e                   push cs
6:296C  e80d00               call 0x297c  ; sub_s6:297C
6:296F  0bc0                 or ax, ax
6:2971  0f8540ff             jne 0x28b5
6:2975  5e                   pop si
6:2976  5f                   pop di
6:2977  c9                   leave
6:2978  ca1000               retf 0x10
6:297B  db 00

; ---------------- sub_s6:297C FAR size=240 callers=1
6:297C  c8140000             enter 0x14, 0
6:2980  66ff760e             push dword ptr [bp + 0xe]
6:2984  66ff760a             push dword ptr [bp + 0xa]
6:2988  66ff7606             push dword ptr [bp + 6]
6:298C  90                   nop
6:298D  0e                   push cs
6:298E  e8259e               call 0xffffc7b6  ; sub_s6:C7B6
6:2991  0bc0                 or ax, ax
6:2993  7519                 jne 0x29ae
6:2995  66ff760e             push dword ptr [bp + 0xe]
6:2999  66ff760a             push dword ptr [bp + 0xa]
6:299D  66ff364057           push dword ptr [0x5740]
6:29A2  9a7e62c729           lcall 0x29c7, 0x627e  ; sub_s7:627E
6:29A7  8956fc               mov word ptr [bp - 4], dx
6:29AA  0bd0                 or dx, ax
6:29AC  7506                 jne 0x29b4
loc_29AE:
6:29AE  33c0                 xor ax, ax
6:29B0  c9                   leave
6:29B1  ca0c00               retf 0xc
loc_29B4:
6:29B4  ff76fc               push word ptr [bp - 4]
6:29B7  50                   push ax
6:29B8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:29BD  90                   nop
6:29BE  0e                   push cs
6:29BF  e82ab8               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:29C2  52                   push dx
6:29C3  50                   push ax
6:29C4  9aa8739227           lcall 0x2792, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:29C9  8946f2               mov word ptr [bp - 0xe], ax
6:29CC  8956f4               mov word ptr [bp - 0xc], dx
6:29CF  c45ef2               les bx, ptr [bp - 0xe]
6:29D2  268b470c             mov ax, word ptr es:[bx + 0xc]
6:29D6  3d4a00               cmp ax, 0x4a
6:29D9  7f25                 jg 0x2a00
6:29DB  3d4800               cmp ax, 0x48
6:29DE  7dce                 jge 0x29ae
6:29E0  3d4100               cmp ax, 0x41
6:29E3  74c9                 je 0x29ae
6:29E5  7711                 ja 0x29f8
6:29E7  3c34                 cmp al, 0x34
6:29E9  7f09                 jg 0x29f4
6:29EB  3c33                 cmp al, 0x33
6:29ED  7dbf                 jge 0x29ae
6:29EF  2c10                 sub al, 0x10
6:29F1  eb03                 jmp 0x29f6
6:29F3  db 90
loc_29F4:
6:29F4  2c3e                 sub al, 0x3e
loc_29F6:
6:29F6  74b6                 je 0x29ae
loc_29F8:
6:29F8  b80100               mov ax, 1
6:29FB  c9                   leave
6:29FC  ca0c00               retf 0xc
6:29FF  db 90
loc_2A00:
6:2A00  2d4c00               sub ax, 0x4c
6:2A03  3d2d00               cmp ax, 0x2d
6:2A06  77f0                 ja 0x29f8
6:2A08  03c0                 add ax, ax
6:2A0A  93                   xchg bx, ax
6:2A0B  2effa7102a           jmp word ptr cs:[bx + 0x2a10]
switch_table_2A10:
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29AE
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29F8
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE
    dw loc_29AE

; ---------------- sub_s6:2A6C FAR size=142 callers=0
6:2A6C  c8040000             enter 4, 0
6:2A70  66ff7606             push dword ptr [bp + 6]
6:2A74  90                   nop
6:2A75  0e                   push cs
6:2A76  e89f89               call 0xffffb418  ; sub_s6:B418
6:2A79  f6460a01             test byte ptr [bp + 0xa], 1
6:2A7D  7409                 je 0x2a88
6:2A7F  66ff7606             push dword ptr [bp + 6]
6:2A83  9ace177c27           lcall 0x277c, 0x17ce  ; operator_delete@s1:17CE
loc_2A88:
6:2A88  8b4606               mov ax, word ptr [bp + 6]
6:2A8B  8b5608               mov dx, word ptr [bp + 8]
6:2A8E  c9                   leave
6:2A8F  ca0600               retf 6
6:2A92  db 6c 2a 98 2a 56 bb a0 2a 8e 17 a5 29 ec b5 a4 2a
6:2AA2  db 1a b8 a8 2a 1c bc ac 2a 38 bd b0 2a 90 bc b4 2a
6:2AB2  db 7e bc b8 2a 14 b5 bc 2a 2a be c0 2a 16 bf c4 2a
6:2AC2  db 1a bf c8 2a 1e bf cc 2a 9e be d0 2a 22 bf d4 2a
6:2AD2  db f0 bb d8 2a 02 bc dc 2a a8 b5 e0 2a ca b5 e4 2a
6:2AE2  db e6 b4 e8 2a ec b4 ec 2a 6e b4 f0 2a 44 28 f4 2a
6:2AF2  db 22 c5 f8 2a d2 ce 31 28

; ---------------- sub_s6:2AFA FAR size=34 callers=1
6:2AFA  55                   push bp
6:2AFB  8bec                 mov bp, sp
6:2AFD  66ff7606             push dword ptr [bp + 6]
6:2B01  9a96dc9c2a           lcall 0x2a9c, 0xdc96  ; sub_s7:DC96
6:2B06  c45e06               les bx, ptr [bp + 6]
6:2B09  26c707742b           mov word ptr es:[bx], 0x2b74
6:2B0E  26c74702942a         mov word ptr es:[bx + 2], 0x2a94  ; SEGMENT s6:0000 | 'fem124.wav'
6:2B14  8bc3                 mov ax, bx
6:2B16  8cc2                 mov dx, es
6:2B18  c9                   leave
6:2B19  ca0400               retf 4

; ---------------- sub_s6:2B1C FAR size=42 callers=1
6:2B1C  55                   push bp
6:2B1D  8bec                 mov bp, sp
6:2B1F  66ff760c             push dword ptr [bp + 0xc]
6:2B23  66ff7608             push dword ptr [bp + 8]
6:2B27  ff7606               push word ptr [bp + 6]
6:2B2A  9ac2dc042b           lcall 0x2b04, 0xdcc2  ; sub_s7:DCC2
6:2B2F  c45e06               les bx, ptr [bp + 6]
6:2B32  26c707742b           mov word ptr es:[bx], 0x2b74
6:2B37  26c74702122b         mov word ptr es:[bx + 2], 0x2b12  ; SEGMENT s6:0000
6:2B3D  8bc3                 mov ax, bx
6:2B3F  8cc2                 mov dx, es
6:2B41  c9                   leave
6:2B42  ca0a00               retf 0xa
6:2B45  db 00

; ---------------- sub_s6:2B46 FAR size=4 callers=0
6:2B46  ca0600               retf 6
6:2B49  db 00

; ---------------- sub_s6:2B4A FAR size=4 callers=0
6:2B4A  ca0400               retf 4
6:2B4D  db 00

; ---------------- sub_s6:2B4E FAR size=142 callers=0
6:2B4E  c8040000             enter 4, 0
6:2B52  66ff7606             push dword ptr [bp + 6]
6:2B56  9af4dc2d2b           lcall 0x2b2d, 0xdcf4  ; sub_s7:DCF4
6:2B5B  f6460a01             test byte ptr [bp + 0xa], 1
6:2B5F  7409                 je 0x2b6a
6:2B61  66ff7606             push dword ptr [bp + 6]
6:2B65  9ace17862a           lcall 0x2a86, 0x17ce  ; operator_delete@s1:17CE
loc_2B6A:
6:2B6A  8b4606               mov ax, word ptr [bp + 6]
6:2B6D  8b5608               mov dx, word ptr [bp + 8]
6:2B70  c9                   leave
6:2B71  ca0600               retf 6
6:2B74  db 4e 2b 7a 2b 56 bb 8a 2b 8e 17 82 2b 7c de 86 2b
6:2B84  db c4 de 59 2b 1c bc 8e 2b 46 2b 92 2b 90 bc 96 2b
6:2B94  db 7e bc 9a 2b 14 b5 9e 2b 2a be a2 2b 16 bf a6 2b
6:2BA4  db 4a 2b aa 2b 1e bf ae 2b 9e be b2 2b 22 bf b6 2b
6:2BB4  db f0 bb ba 2b 02 bc be 2b a8 b5 c2 2b ca b5 c6 2b
6:2BC4  db e6 b4 ca 2b ec b4 ce 2b 6e b4 d2 2b 4a c6 d6 2b
6:2BD4  db 22 c5 da 2b d2 ce 3b 2b

; ---------------- sub_s6:2BDC FAR size=34 callers=1
6:2BDC  55                   push bp
6:2BDD  8bec                 mov bp, sp
6:2BDF  66ff7606             push dword ptr [bp + 6]
6:2BE3  90                   nop
6:2BE4  0e                   push cs
6:2BE5  e86cdd               call 0x954  ; sub_s6:0954
6:2BE8  c45e06               les bx, ptr [bp + 6]
6:2BEB  26c7071c34           mov word ptr es:[bx], 0x341c
6:2BF0  26c74702762b         mov word ptr es:[bx + 2], 0x2b76  ; SEGMENT s6:0000
6:2BF6  8bc3                 mov ax, bx
6:2BF8  8cc2                 mov dx, es
6:2BFA  c9                   leave
6:2BFB  ca0400               retf 4

; ---------------- sub_s6:2BFE FAR size=42 callers=1
6:2BFE  55                   push bp
6:2BFF  8bec                 mov bp, sp
6:2C01  66ff760c             push dword ptr [bp + 0xc]
6:2C05  66ff7608             push dword ptr [bp + 8]
6:2C09  ff7606               push word ptr [bp + 6]
6:2C0C  90                   nop
6:2C0D  0e                   push cs
6:2C0E  e871dd               call 0x982  ; sub_s6:0982
6:2C11  c45e06               les bx, ptr [bp + 6]
6:2C14  26c7071c34           mov word ptr es:[bx], 0x341c
6:2C19  26c74702f42b         mov word ptr es:[bx + 2], 0x2bf4  ; SEGMENT s6:0000
6:2C1F  8bc3                 mov ax, bx
6:2C21  8cc2                 mov dx, es
6:2C23  c9                   leave
6:2C24  ca0a00               retf 0xa
6:2C27  db 00

; ---------------- sub_s6:2C28 FAR size=536 callers=0
6:2C28  c8100000             enter 0x10, 0
6:2C2C  57                   push di
6:2C2D  56                   push si
6:2C2E  66ff7612             push dword ptr [bp + 0x12]
6:2C32  66ff760e             push dword ptr [bp + 0xe]
6:2C36  66ff760a             push dword ptr [bp + 0xa]
6:2C3A  66ff7606             push dword ptr [bp + 6]
6:2C3E  90                   nop
6:2C3F  0e                   push cs
6:2C40  e891dd               call 0x9d4  ; sub_s6:09D4
6:2C43  0bc0                 or ax, ax
6:2C45  7509                 jne 0x2c50
loc_2C47:
6:2C47  33c0                 xor ax, ax
6:2C49  5e                   pop si
6:2C4A  5f                   pop di
6:2C4B  c9                   leave
6:2C4C  ca1000               retf 0x10
6:2C4F  db 90
loc_2C50:
6:2C50  8b460a               mov ax, word ptr [bp + 0xa]
6:2C53  8b560c               mov dx, word ptr [bp + 0xc]
6:2C56  1e                   push ds
6:2C57  8d7efa               lea di, [bp - 6]
6:2C5A  8bf0                 mov si, ax
6:2C5C  16                   push ss
6:2C5D  07                   pop es
6:2C5E  8eda                 mov ds, dx
6:2C60  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:2C62  a5                   movsw word ptr es:[di], word ptr [si]
6:2C63  1f                   pop ds
6:2C64  8d46fa               lea ax, [bp - 6]
6:2C67  8946f0               mov word ptr [bp - 0x10], ax
6:2C6A  8d46f8               lea ax, [bp - 8]
6:2C6D  16                   push ss
6:2C6E  50                   push ax
6:2C6F  8d4ef6               lea cx, [bp - 0xa]
6:2C72  16                   push ss
6:2C73  51                   push cx
6:2C74  8d56f4               lea dx, [bp - 0xc]
6:2C77  16                   push ss
6:2C78  52                   push dx
6:2C79  8d5efa               lea bx, [bp - 6]
6:2C7C  16                   push ss
6:2C7D  53                   push bx
6:2C7E  9ab43e982c           lcall 0x2c98, 0x3eb4  ; sub_s2:3EB4
6:2C83  8b46f8               mov ax, word ptr [bp - 8]
6:2C86  48                   dec ax
6:2C87  50                   push ax
6:2C88  8b46f6               mov ax, word ptr [bp - 0xa]
6:2C8B  48                   dec ax
6:2C8C  50                   push ax
6:2C8D  ff76f4               push word ptr [bp - 0xc]
6:2C90  8d46fa               lea ax, [bp - 6]
6:2C93  16                   push ss
6:2C94  50                   push ax
6:2C95  9a763ecf2c           lcall 0x2ccf, 0x3e76  ; sub_s2:3E76
6:2C9A  66ff7612             push dword ptr [bp + 0x12]
6:2C9E  8d46fa               lea ax, [bp - 6]
6:2CA1  16                   push ss
6:2CA2  50                   push ax
6:2CA3  66ff7606             push dword ptr [bp + 6]
6:2CA7  90                   nop
6:2CA8  0e                   push cs
6:2CA9  e80a9b               call 0xffffc7b6  ; sub_s6:C7B6
6:2CAC  8946f2               mov word ptr [bp - 0xe], ax
6:2CAF  0bc0                 or ax, ax
6:2CB1  7509                 jne 0x2cbc
loc_2CB3:
6:2CB3  c706ca50a806         mov word ptr [0x50ca], 0x6a8
6:2CB9  eb8c                 jmp 0x2c47
6:2CBB  db 90
loc_2CBC:
6:2CBC  ff76f8               push word ptr [bp - 8]
6:2CBF  8b46f6               mov ax, word ptr [bp - 0xa]
6:2CC2  48                   dec ax
6:2CC3  50                   push ax
6:2CC4  ff76f4               push word ptr [bp - 0xc]
6:2CC7  8d46fa               lea ax, [bp - 6]
6:2CCA  16                   push ss
6:2CCB  50                   push ax
6:2CCC  9a763eff2c           lcall 0x2cff, 0x3e76  ; sub_s2:3E76
6:2CD1  66ff7612             push dword ptr [bp + 0x12]
6:2CD5  8d46fa               lea ax, [bp - 6]
6:2CD8  16                   push ss
6:2CD9  50                   push ax
6:2CDA  66ff7606             push dword ptr [bp + 6]
6:2CDE  90                   nop
6:2CDF  0e                   push cs
6:2CE0  e8d39a               call 0xffffc7b6  ; sub_s6:C7B6
6:2CE3  8946f2               mov word ptr [bp - 0xe], ax
6:2CE6  0bc0                 or ax, ax
6:2CE8  74c9                 je 0x2cb3
6:2CEA  8b46f8               mov ax, word ptr [bp - 8]
6:2CED  40                   inc ax
6:2CEE  50                   push ax
6:2CEF  8b46f6               mov ax, word ptr [bp - 0xa]
6:2CF2  48                   dec ax
6:2CF3  50                   push ax
6:2CF4  ff76f4               push word ptr [bp - 0xc]
6:2CF7  8d46fa               lea ax, [bp - 6]
6:2CFA  16                   push ss
6:2CFB  50                   push ax
6:2CFC  9a763e2b2d           lcall 0x2d2b, 0x3e76  ; sub_s2:3E76
6:2D01  66ff7612             push dword ptr [bp + 0x12]
6:2D05  8d46fa               lea ax, [bp - 6]
6:2D08  16                   push ss
6:2D09  50                   push ax
6:2D0A  66ff7606             push dword ptr [bp + 6]
6:2D0E  90                   nop
6:2D0F  0e                   push cs
6:2D10  e8a39a               call 0xffffc7b6  ; sub_s6:C7B6
6:2D13  8946f2               mov word ptr [bp - 0xe], ax
6:2D16  0bc0                 or ax, ax
6:2D18  7499                 je 0x2cb3
6:2D1A  8b46f8               mov ax, word ptr [bp - 8]
6:2D1D  48                   dec ax
6:2D1E  50                   push ax
6:2D1F  66ff76f4             push dword ptr [bp - 0xc]
6:2D23  8d46fa               lea ax, [bp - 6]
6:2D26  16                   push ss
6:2D27  50                   push ax
6:2D28  9a763e572d           lcall 0x2d57, 0x3e76  ; sub_s2:3E76
6:2D2D  66ff7612             push dword ptr [bp + 0x12]
6:2D31  8d46fa               lea ax, [bp - 6]
6:2D34  16                   push ss
6:2D35  50                   push ax
6:2D36  66ff7606             push dword ptr [bp + 6]
6:2D3A  90                   nop
6:2D3B  0e                   push cs
6:2D3C  e8779a               call 0xffffc7b6  ; sub_s6:C7B6
6:2D3F  8946f2               mov word ptr [bp - 0xe], ax
6:2D42  0bc0                 or ax, ax
6:2D44  0f846bff             je 0x2cb3
6:2D48  66ff76f6             push dword ptr [bp - 0xa]
6:2D4C  ff76f4               push word ptr [bp - 0xc]
6:2D4F  8d46fa               lea ax, [bp - 6]
6:2D52  16                   push ss
6:2D53  50                   push ax
6:2D54  9a763e852d           lcall 0x2d85, 0x3e76  ; sub_s2:3E76
6:2D59  66ff7612             push dword ptr [bp + 0x12]
6:2D5D  8d46fa               lea ax, [bp - 6]
6:2D60  16                   push ss
6:2D61  50                   push ax
6:2D62  66ff7606             push dword ptr [bp + 6]
6:2D66  90                   nop
6:2D67  0e                   push cs
6:2D68  e84b9a               call 0xffffc7b6  ; sub_s6:C7B6
6:2D6B  8946f2               mov word ptr [bp - 0xe], ax
6:2D6E  0bc0                 or ax, ax
6:2D70  0f843fff             je 0x2cb3
6:2D74  8b46f8               mov ax, word ptr [bp - 8]
6:2D77  40                   inc ax
6:2D78  50                   push ax
6:2D79  66ff76f4             push dword ptr [bp - 0xc]
6:2D7D  8d46fa               lea ax, [bp - 6]
6:2D80  16                   push ss
6:2D81  50                   push ax
6:2D82  9a763eb72d           lcall 0x2db7, 0x3e76  ; sub_s2:3E76
6:2D87  66ff7612             push dword ptr [bp + 0x12]
6:2D8B  8d46fa               lea ax, [bp - 6]
6:2D8E  16                   push ss
6:2D8F  50                   push ax
6:2D90  66ff7606             push dword ptr [bp + 6]
6:2D94  90                   nop
6:2D95  0e                   push cs
6:2D96  e81d9a               call 0xffffc7b6  ; sub_s6:C7B6
6:2D99  8946f2               mov word ptr [bp - 0xe], ax
6:2D9C  0bc0                 or ax, ax
6:2D9E  0f8411ff             je 0x2cb3
6:2DA2  8b46f8               mov ax, word ptr [bp - 8]
6:2DA5  48                   dec ax
6:2DA6  50                   push ax
6:2DA7  8b46f6               mov ax, word ptr [bp - 0xa]
6:2DAA  40                   inc ax
6:2DAB  50                   push ax
6:2DAC  ff76f4               push word ptr [bp - 0xc]
6:2DAF  8d46fa               lea ax, [bp - 6]
6:2DB2  16                   push ss
6:2DB3  50                   push ax
6:2DB4  9a763ee72d           lcall 0x2de7, 0x3e76  ; sub_s2:3E76
6:2DB9  66ff7612             push dword ptr [bp + 0x12]
6:2DBD  8d46fa               lea ax, [bp - 6]
6:2DC0  16                   push ss
6:2DC1  50                   push ax
6:2DC2  66ff7606             push dword ptr [bp + 6]
6:2DC6  90                   nop
6:2DC7  0e                   push cs
6:2DC8  e8eb99               call 0xffffc7b6  ; sub_s6:C7B6
6:2DCB  8946f2               mov word ptr [bp - 0xe], ax
6:2DCE  0bc0                 or ax, ax
6:2DD0  0f84dffe             je 0x2cb3
6:2DD4  ff76f8               push word ptr [bp - 8]
6:2DD7  8b46f6               mov ax, word ptr [bp - 0xa]
6:2DDA  40                   inc ax
6:2DDB  50                   push ax
6:2DDC  ff76f4               push word ptr [bp - 0xc]
6:2DDF  8d46fa               lea ax, [bp - 6]
6:2DE2  16                   push ss
6:2DE3  50                   push ax
6:2DE4  9a763e192e           lcall 0x2e19, 0x3e76  ; sub_s2:3E76
6:2DE9  66ff7612             push dword ptr [bp + 0x12]
6:2DED  8d46fa               lea ax, [bp - 6]
6:2DF0  16                   push ss
6:2DF1  50                   push ax
6:2DF2  66ff7606             push dword ptr [bp + 6]
6:2DF6  90                   nop
6:2DF7  0e                   push cs
6:2DF8  e8bb99               call 0xffffc7b6  ; sub_s6:C7B6
6:2DFB  8946f2               mov word ptr [bp - 0xe], ax
6:2DFE  0bc0                 or ax, ax
6:2E00  0f84affe             je 0x2cb3
6:2E04  8b46f8               mov ax, word ptr [bp - 8]
6:2E07  40                   inc ax
6:2E08  50                   push ax
6:2E09  8b46f6               mov ax, word ptr [bp - 0xa]
6:2E0C  40                   inc ax
6:2E0D  50                   push ax
6:2E0E  ff76f4               push word ptr [bp - 0xc]
6:2E11  8d46fa               lea ax, [bp - 6]
6:2E14  16                   push ss
6:2E15  50                   push ax
6:2E16  9a763e7b28           lcall 0x287b, 0x3e76  ; sub_s2:3E76
6:2E1B  66ff7612             push dword ptr [bp + 0x12]
6:2E1F  8d46fa               lea ax, [bp - 6]
6:2E22  16                   push ss
6:2E23  50                   push ax
6:2E24  66ff7606             push dword ptr [bp + 6]
6:2E28  90                   nop
6:2E29  0e                   push cs
6:2E2A  e88999               call 0xffffc7b6  ; sub_s6:C7B6
6:2E2D  8946f2               mov word ptr [bp - 0xe], ax
6:2E30  0bc0                 or ax, ax
6:2E32  0f847dfe             je 0x2cb3
6:2E36  b80100               mov ax, 1
6:2E39  5e                   pop si
6:2E3A  5f                   pop di
6:2E3B  c9                   leave
6:2E3C  ca1000               retf 0x10
6:2E3F  db 00

; ---------------- sub_s6:2E40 FAR size=68 callers=0
6:2E40  c8040000             enter 4, 0
6:2E44  66ff7606             push dword ptr [bp + 6]
6:2E48  90                   nop
6:2E49  0e                   push cs
6:2E4A  e85190               call 0xffffbe9e  ; sub_s6:BE9E
6:2E4D  c45e06               les bx, ptr [bp + 6]
6:2E50  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:2E55  7529                 jne 0x2e80
6:2E57  06                   push es
6:2E58  53                   push bx
6:2E59  90                   nop
6:2E5A  0e                   push cs
6:2E5B  e8ba00               call 0x2f18  ; sub_s6:2F18
6:2E5E  66ff7606             push dword ptr [bp + 6]
6:2E62  90                   nop
6:2E63  0e                   push cs
6:2E64  e8df03               call 0x3246  ; Seed::giveStartingStock@s6:3246
6:2E67  666801000500         push 0x50001
6:2E6D  6a2b                 push 0x2b
6:2E6F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:2E74  9aba207e2e           lcall 0x2e7e, 0x20ba  ; sub_s3:20BA
6:2E79  52                   push dx
6:2E7A  50                   push ax
6:2E7B  9a9e08151a           lcall 0x1a15, 0x89e  ; sub_s3:089E
loc_2E80:
6:2E80  c9                   leave
6:2E81  ca0400               retf 4

; ---------------- sub_s6:2E84 size=148 callers=0
6:2E84  c8100000             enter 0x10, 0
6:2E88  66ff7608             push dword ptr [bp + 8]
6:2E8C  ff7606               push word ptr [bp + 6]
6:2E8F  90                   nop
6:2E90  0e                   push cs
6:2E91  e824db               call 0x9b8  ; sub_s6:09B8
6:2E94  837e0a00             cmp word ptr [bp + 0xa], 0
6:2E98  757a                 jne 0x2f14
6:2E9A  666800000800         push 0x80000
6:2EA0  666a01               push 1
6:2EA3  666a00               push 0
6:2EA6  666a37               push 0x37
6:2EA9  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:2EAE  9aba20ce2e           lcall 0x2ece, 0x20ba  ; sub_s3:20BA
6:2EB3  52                   push dx
6:2EB4  50                   push ax
6:2EB5  9ae4a0812c           lcall 0x2c81, 0xa0e4  ; sub_s2:A0E4
6:2EBA  666800040300         push 0x30400
6:2EC0  66682b000100         push 0x1002b
6:2EC6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:2ECB  9aba20db2e           lcall 0x2edb, 0x20ba  ; sub_s3:20BA
6:2ED0  8946f8               mov word ptr [bp - 8], ax
6:2ED3  8956fa               mov word ptr [bp - 6], dx
6:2ED6  52                   push dx
6:2ED7  50                   push ax
6:2ED8  9a3a04ec2e           lcall 0x2eec, 0x43a  ; sub_s3:043A
6:2EDD  666800040400         push 0x40400
6:2EE3  6a01                 push 1
6:2EE5  66ff76f8             push dword ptr [bp - 8]
6:2EE9  9a3a04f82e           lcall 0x2ef8, 0x43a  ; sub_s3:043A
6:2EEE  6a2f                 push 0x2f
6:2EF0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:2EF5  9aba20ff2e           lcall 0x2eff, 0x20ba  ; sub_s3:20BA
6:2EFA  52                   push dx
6:2EFB  50                   push ax
6:2EFC  9a84ec0b2f           lcall 0x2f0b, 0xec84  ; sub_s3:EC84
6:2F01  6a08                 push 8
6:2F03  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:2F08  9aba20122f           lcall 0x2f12, 0x20ba  ; sub_s3:20BA
6:2F0D  52                   push dx
6:2F0E  50                   push ax
6:2F0F  9a6697772e           lcall 0x2e77, 0x9766  ; sub_s3:9766
loc_2F14:
6:2F14  c9                   leave
6:2F15  ca0600               retf 6

; ---------------- sub_s6:2F18 FAR size=814 callers=1
6:2F18  c8ae0900             enter 0x9ae, 0
6:2F1C  57                   push di
6:2F1D  56                   push si
6:2F1E  66ff7606             push dword ptr [bp + 6]
6:2F22  90                   nop
6:2F23  0e                   push cs
6:2F24  e8fd8b               call 0xffffbb24  ; sub_s6:BB24
6:2F27  8946fc               mov word ptr [bp - 4], ax
6:2F2A  8956fe               mov word ptr [bp - 2], dx
6:2F2D  66ff7606             push dword ptr [bp + 6]
6:2F31  90                   nop
6:2F32  0e                   push cs
6:2F33  e85886               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:2F36  8946f8               mov word ptr [bp - 8], ax
6:2F39  8956fa               mov word ptr [bp - 6], dx
6:2F3C  c45ef8               les bx, ptr [bp - 8]
6:2F3F  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:2F44  668946f4             mov dword ptr [bp - 0xc], eax
6:2F48  c45ef4               les bx, ptr [bp - 0xc]
6:2F4B  66268b4704           mov eax, dword ptr es:[bx + 4]
6:2F50  668946f0             mov dword ptr [bp - 0x10], eax
6:2F54  8b46f8               mov ax, word ptr [bp - 8]
6:2F57  8b56fa               mov dx, word ptr [bp - 6]
6:2F5A  050c00               add ax, 0xc
6:2F5D  1e                   push ds
6:2F5E  8d7eea               lea di, [bp - 0x16]
6:2F61  8bf0                 mov si, ax
6:2F63  16                   push ss
6:2F64  07                   pop es
6:2F65  8eda                 mov ds, dx
6:2F67  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:2F69  a5                   movsw word ptr es:[di], word ptr [si]
6:2F6A  1f                   pop ds
6:2F6B  8d46ea               lea ax, [bp - 0x16]
6:2F6E  8986b2f6             mov word ptr [bp - 0x94e], ax
6:2F72  8d46e8               lea ax, [bp - 0x18]
6:2F75  16                   push ss
6:2F76  50                   push ax
6:2F77  8d4ee6               lea cx, [bp - 0x1a]
6:2F7A  16                   push ss
6:2F7B  51                   push cx
6:2F7C  8d56e4               lea dx, [bp - 0x1c]
6:2F7F  16                   push ss
6:2F80  52                   push dx
6:2F81  8d5eea               lea bx, [bp - 0x16]
6:2F84  16                   push ss
6:2F85  53                   push bx
6:2F86  9ab43ea02f           lcall 0x2fa0, 0x3eb4  ; sub_s2:3EB4
6:2F8B  8b46e8               mov ax, word ptr [bp - 0x18]
6:2F8E  48                   dec ax
6:2F8F  50                   push ax
6:2F90  8b46e6               mov ax, word ptr [bp - 0x1a]
6:2F93  48                   dec ax
6:2F94  50                   push ax
6:2F95  ff76e4               push word ptr [bp - 0x1c]
6:2F98  8d46ea               lea ax, [bp - 0x16]
6:2F9B  16                   push ss
6:2F9C  50                   push ax
6:2F9D  9a763ee72f           lcall 0x2fe7, 0x3e76  ; sub_s2:3E76
6:2FA2  66ff76fc             push dword ptr [bp - 4]
6:2FA6  66ff76f0             push dword ptr [bp - 0x10]
6:2FAA  8d46ea               lea ax, [bp - 0x16]
6:2FAD  16                   push ss
6:2FAE  50                   push ax
6:2FAF  666800000d00         push 0xd0000
6:2FB5  6a00                 push 0
6:2FB7  8d86c0fe             lea ax, [bp - 0x140]
6:2FBB  16                   push ss
6:2FBC  50                   push ax
6:2FBD  90                   nop
6:2FBE  0e                   push cs
6:2FBF  e82e58               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:2FC2  8d86c0fe             lea ax, [bp - 0x140]
6:2FC6  16                   push ss
6:2FC7  50                   push ax
6:2FC8  66ff364857           push dword ptr [0x5748]  ; g_sim
6:2FCD  9a5a831730           lcall 0x3017, 0x835a  ; Sim::enqueue@s7:835A
6:2FD2  8b46e8               mov ax, word ptr [bp - 0x18]
6:2FD5  40                   inc ax
6:2FD6  50                   push ax
6:2FD7  8b46e6               mov ax, word ptr [bp - 0x1a]
6:2FDA  40                   inc ax
6:2FDB  50                   push ax
6:2FDC  ff76e4               push word ptr [bp - 0x1c]
6:2FDF  8d46ea               lea ax, [bp - 0x16]
6:2FE2  16                   push ss
6:2FE3  50                   push ax
6:2FE4  9a763e2e30           lcall 0x302e, 0x3e76  ; sub_s2:3E76
6:2FE9  66ff76fc             push dword ptr [bp - 4]
6:2FED  66ff76f0             push dword ptr [bp - 0x10]
6:2FF1  8d46ea               lea ax, [bp - 0x16]
6:2FF4  16                   push ss
6:2FF5  50                   push ax
6:2FF6  666800000c00         push 0xc0000
6:2FFC  6a00                 push 0
6:2FFE  8d869cfd             lea ax, [bp - 0x264]
6:3002  16                   push ss
6:3003  50                   push ax
6:3004  90                   nop
6:3005  0e                   push cs
6:3006  e8e757               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:3009  8d869cfd             lea ax, [bp - 0x264]
6:300D  16                   push ss
6:300E  50                   push ax
6:300F  66ff364857           push dword ptr [0x5748]  ; g_sim
6:3014  9a5a835e30           lcall 0x305e, 0x835a  ; Sim::enqueue@s7:835A
6:3019  8b46e8               mov ax, word ptr [bp - 0x18]
6:301C  48                   dec ax
6:301D  50                   push ax
6:301E  8b46e6               mov ax, word ptr [bp - 0x1a]
6:3021  40                   inc ax
6:3022  50                   push ax
6:3023  ff76e4               push word ptr [bp - 0x1c]
6:3026  8d46ea               lea ax, [bp - 0x16]
6:3029  16                   push ss
6:302A  50                   push ax
6:302B  9a763e7630           lcall 0x3076, 0x3e76  ; sub_s2:3E76
6:3030  66ff76fc             push dword ptr [bp - 4]
6:3034  66ff76f0             push dword ptr [bp - 0x10]
6:3038  8d46ea               lea ax, [bp - 0x16]
6:303B  16                   push ss
6:303C  50                   push ax
6:303D  666800000e00         push 0xe0000
6:3043  6a00                 push 0
6:3045  8d8678fc             lea ax, [bp - 0x388]
6:3049  16                   push ss
6:304A  50                   push ax
6:304B  90                   nop
6:304C  0e                   push cs
6:304D  e8a057               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:3050  8d8678fc             lea ax, [bp - 0x388]
6:3054  16                   push ss
6:3055  50                   push ax
6:3056  66ff364857           push dword ptr [0x5748]  ; g_sim
6:305B  9a5a83a730           lcall 0x30a7, 0x835a  ; Sim::enqueue@s7:835A
6:3060  8b46e8               mov ax, word ptr [bp - 0x18]
6:3063  40                   inc ax
6:3064  50                   push ax
6:3065  8b46e6               mov ax, word ptr [bp - 0x1a]
6:3068  48                   dec ax
6:3069  50                   push ax
6:306A  ff76e4               push word ptr [bp - 0x1c]
6:306D  8d8672fc             lea ax, [bp - 0x38e]
6:3071  16                   push ss
6:3072  50                   push ax
6:3073  9a543ebc30           lcall 0x30bc, 0x3e54  ; sub_s2:3E54
6:3078  66ff76fc             push dword ptr [bp - 4]
6:307C  66ff76f0             push dword ptr [bp - 0x10]
6:3080  8d8672fc             lea ax, [bp - 0x38e]
6:3084  16                   push ss
6:3085  50                   push ax
6:3086  666800000b00         push 0xb0000
6:308C  6a00                 push 0
6:308E  8d864efb             lea ax, [bp - 0x4b2]
6:3092  16                   push ss
6:3093  50                   push ax
6:3094  90                   nop
6:3095  0e                   push cs
6:3096  e85757               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:3099  8d864efb             lea ax, [bp - 0x4b2]
6:309D  16                   push ss
6:309E  50                   push ax
6:309F  66ff364857           push dword ptr [0x5748]  ; g_sim
6:30A4  9a5a83ec30           lcall 0x30ec, 0x835a  ; Sim::enqueue@s7:835A
6:30A9  ff76e8               push word ptr [bp - 0x18]
6:30AC  8b46e6               mov ax, word ptr [bp - 0x1a]
6:30AF  48                   dec ax
6:30B0  50                   push ax
6:30B1  ff76e4               push word ptr [bp - 0x1c]
6:30B4  8d46ea               lea ax, [bp - 0x16]
6:30B7  16                   push ss
6:30B8  50                   push ax
6:30B9  9a763eff30           lcall 0x30ff, 0x3e76  ; sub_s2:3E76
6:30BE  66ff76fc             push dword ptr [bp - 4]
6:30C2  66ff76f0             push dword ptr [bp - 0x10]
6:30C6  8d46ea               lea ax, [bp - 0x16]
6:30C9  16                   push ss
6:30CA  50                   push ax
6:30CB  666800007a00         push 0x7a0000
6:30D1  6a00                 push 0
6:30D3  8d862afa             lea ax, [bp - 0x5d6]
6:30D7  16                   push ss
6:30D8  50                   push ax
6:30D9  90                   nop
6:30DA  0e                   push cs
6:30DB  e81257               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:30DE  8d862afa             lea ax, [bp - 0x5d6]
6:30E2  16                   push ss
6:30E3  50                   push ax
6:30E4  66ff364857           push dword ptr [0x5748]  ; g_sim
6:30E9  9a5a832f31           lcall 0x312f, 0x835a  ; Sim::enqueue@s7:835A
6:30EE  8b46e8               mov ax, word ptr [bp - 0x18]
6:30F1  40                   inc ax
6:30F2  50                   push ax
6:30F3  66ff76e4             push dword ptr [bp - 0x1c]
6:30F7  8d46ea               lea ax, [bp - 0x16]
6:30FA  16                   push ss
6:30FB  50                   push ax
6:30FC  9a763e4431           lcall 0x3144, 0x3e76  ; sub_s2:3E76
6:3101  66ff76fc             push dword ptr [bp - 4]
6:3105  66ff76f0             push dword ptr [bp - 0x10]
6:3109  8d46ea               lea ax, [bp - 0x16]
6:310C  16                   push ss
6:310D  50                   push ax
6:310E  666800007a00         push 0x7a0000
6:3114  6a00                 push 0
6:3116  8d8606f9             lea ax, [bp - 0x6fa]
6:311A  16                   push ss
6:311B  50                   push ax
6:311C  90                   nop
6:311D  0e                   push cs
6:311E  e8cf56               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:3121  8d8606f9             lea ax, [bp - 0x6fa]
6:3125  16                   push ss
6:3126  50                   push ax
6:3127  66ff364857           push dword ptr [0x5748]  ; g_sim
6:312C  9a5a837431           lcall 0x3174, 0x835a  ; Sim::enqueue@s7:835A
6:3131  ff76e8               push word ptr [bp - 0x18]
6:3134  8b46e6               mov ax, word ptr [bp - 0x1a]
6:3137  40                   inc ax
6:3138  50                   push ax
6:3139  ff76e4               push word ptr [bp - 0x1c]
6:313C  8d46ea               lea ax, [bp - 0x16]
6:313F  16                   push ss
6:3140  50                   push ax
6:3141  9a763e8731           lcall 0x3187, 0x3e76  ; sub_s2:3E76
6:3146  66ff76fc             push dword ptr [bp - 4]
6:314A  66ff76f0             push dword ptr [bp - 0x10]
6:314E  8d46ea               lea ax, [bp - 0x16]
6:3151  16                   push ss
6:3152  50                   push ax
6:3153  666800007a00         push 0x7a0000
6:3159  6a00                 push 0
6:315B  8d86e2f7             lea ax, [bp - 0x81e]
6:315F  16                   push ss
6:3160  50                   push ax
6:3161  90                   nop
6:3162  0e                   push cs
6:3163  e88a56               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:3166  8d86e2f7             lea ax, [bp - 0x81e]
6:316A  16                   push ss
6:316B  50                   push ax
6:316C  66ff364857           push dword ptr [0x5748]  ; g_sim
6:3171  9a5a83b731           lcall 0x31b7, 0x835a  ; Sim::enqueue@s7:835A
6:3176  8b46e8               mov ax, word ptr [bp - 0x18]
6:3179  48                   dec ax
6:317A  50                   push ax
6:317B  66ff76e4             push dword ptr [bp - 0x1c]
6:317F  8d46ea               lea ax, [bp - 0x16]
6:3182  16                   push ss
6:3183  50                   push ax
6:3184  9a763eea31           lcall 0x31ea, 0x3e76  ; sub_s2:3E76
6:3189  66ff76fc             push dword ptr [bp - 4]
6:318D  66ff76f0             push dword ptr [bp - 0x10]
6:3191  8d46ea               lea ax, [bp - 0x16]
6:3194  16                   push ss
6:3195  50                   push ax
6:3196  666800007a00         push 0x7a0000
6:319C  6a00                 push 0
6:319E  8d86bef6             lea ax, [bp - 0x942]
6:31A2  16                   push ss
6:31A3  50                   push ax
6:31A4  90                   nop
6:31A5  0e                   push cs
6:31A6  e84756               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:31A9  8d86bef6             lea ax, [bp - 0x942]
6:31AD  16                   push ss
6:31AE  50                   push ax
6:31AF  66ff364857           push dword ptr [0x5748]  ; g_sim
6:31B4  9a5a83cb31           lcall 0x31cb, 0x835a  ; Sim::enqueue@s7:835A
6:31B9  66ff76fc             push dword ptr [bp - 4]
6:31BD  8d8672fc             lea ax, [bp - 0x38e]
6:31C1  16                   push ss
6:31C2  50                   push ax
6:31C3  66ff364057           push dword ptr [0x5740]
6:31C8  9a7e627e2b           lcall 0x2b7e, 0x627e  ; sub_s7:627E
6:31CD  8986baf6             mov word ptr [bp - 0x946], ax
6:31D1  8996bcf6             mov word ptr [bp - 0x944], dx
6:31D5  c45ef4               les bx, ptr [bp - 0xc]
6:31D8  26894710             mov word ptr es:[bx + 0x10], ax
6:31DC  26895712             mov word ptr es:[bx + 0x12], dx
6:31E0  c786bef69a38         mov word ptr [bp - 0x942], 0x389a
6:31E6  c786c0f6f631         mov word ptr [bp - 0x940], 0x31f6  ; SEGMENT s2:0000
6:31EC  c786e2f79a38         mov word ptr [bp - 0x81e], 0x389a
6:31F2  c786e4f70232         mov word ptr [bp - 0x81c], 0x3202  ; SEGMENT s2:0000
6:31F8  c78606f99a38         mov word ptr [bp - 0x6fa], 0x389a
6:31FE  c78608f90e32         mov word ptr [bp - 0x6f8], 0x320e  ; SEGMENT s2:0000
6:3204  c7862afa9a38         mov word ptr [bp - 0x5d6], 0x389a
6:320A  c7862cfa1a32         mov word ptr [bp - 0x5d4], 0x321a  ; SEGMENT s2:0000
6:3210  c7864efb9a38         mov word ptr [bp - 0x4b2], 0x389a
6:3216  c78650fb2632         mov word ptr [bp - 0x4b0], 0x3226  ; SEGMENT s2:0000
6:321C  c78678fc9a38         mov word ptr [bp - 0x388], 0x389a
6:3222  c7867afc3232         mov word ptr [bp - 0x386], 0x3232  ; SEGMENT s2:0000
6:3228  c7869cfd9a38         mov word ptr [bp - 0x264], 0x389a
6:322E  c7869efd3e32         mov word ptr [bp - 0x262], 0x323e  ; SEGMENT s2:0000
6:3234  c786c0fe9a38         mov word ptr [bp - 0x140], 0x389a
6:323A  c786c2feb82e         mov word ptr [bp - 0x13e], 0x2eb8  ; SEGMENT s2:0000
6:3240  5e                   pop si
6:3241  5f                   pop di
6:3242  c9                   leave
6:3243  ca0400               retf 4

; ---------------- Seed::giveStartingStock@s6:3246 FAR size=432 callers=1
6:3246  c8260000             enter 0x26, 0
6:324A  66ff7606             push dword ptr [bp + 6]
6:324E  90                   nop
6:324F  0e                   push cs
6:3250  e83b83               call 0xffffb58e  ; DbObj::getOwner@s6:B58E
6:3253  8946fc               mov word ptr [bp - 4], ax
6:3256  8956fe               mov word ptr [bp - 2], dx
6:3259  c45efc               les bx, ptr [bp - 4]
6:325C  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:3261  668946f8             mov dword ptr [bp - 8], eax
6:3265  c45ef8               les bx, ptr [bp - 8]
6:3268  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:326D  668946f4             mov dword ptr [bp - 0xc], eax
6:3271  666800000100         push 0x10000
6:3277  6a01                 push 1
6:3279  6650                 push eax
6:327B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:3280  90                   nop
6:3281  0e                   push cs
6:3282  e867af               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:3285  8946f0               mov word ptr [bp - 0x10], ax
6:3288  8956f2               mov word ptr [bp - 0xe], dx
6:328B  52                   push dx
6:328C  50                   push ax
6:328D  9a507ca132           lcall 0x32a1, 0x7c50  ; sub_s7:7C50
6:3292  666800000200         push 0x20000
6:3298  6a01                 push 1
6:329A  66ff76f0             push dword ptr [bp - 0x10]
6:329E  9a507cb232           lcall 0x32b2, 0x7c50  ; sub_s7:7C50
6:32A3  666800000300         push 0x30000
6:32A9  6a01                 push 1
6:32AB  66ff76f0             push dword ptr [bp - 0x10]
6:32AF  9a507cc332           lcall 0x32c3, 0x7c50  ; sub_s7:7C50
6:32B4  666800000500         push 0x50000
6:32BA  6a01                 push 1
6:32BC  66ff76f0             push dword ptr [bp - 0x10]
6:32C0  9a507cf132           lcall 0x32f1, 0x7c50  ; sub_s7:7C50
6:32C5  6a02                 push 2
6:32C7  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:32CC  9aba20b12e           lcall 0x2eb1, 0x20ba  ; sub_s3:20BA
6:32D1  8946e8               mov word ptr [bp - 0x18], ax
6:32D4  8956ea               mov word ptr [bp - 0x16], dx
6:32D7  c45ee8               les bx, ptr [bp - 0x18]
6:32DA  2683bf820000         cmp word ptr es:[bx + 0x82], 0
6:32E0  7511                 jne 0x32f3
6:32E2  666800000400         push 0x40000
6:32E8  6a04                 push 4
6:32EA  66ff76f0             push dword ptr [bp - 0x10]
6:32EE  9a507c0333           lcall 0x3303, 0x7c50  ; sub_s7:7C50
loc_32F3:
6:32F3  666800001100         push 0x110000
6:32F9  68c800               push 0xc8
6:32FC  66ff76f0             push dword ptr [bp - 0x10]
6:3300  9adc7d1533           lcall 0x3315, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:3305  666800001200         push 0x120000
6:330B  68c800               push 0xc8
6:330E  66ff76f0             push dword ptr [bp - 0x10]
6:3312  9adc7d2733           lcall 0x3327, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:3317  666800001300         push 0x130000
6:331D  68c800               push 0xc8
6:3320  66ff76f0             push dword ptr [bp - 0x10]
6:3324  9adc7d3933           lcall 0x3339, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:3329  666800001400         push 0x140000
6:332F  68c800               push 0xc8
6:3332  66ff76f0             push dword ptr [bp - 0x10]
6:3336  9adc7d4a33           lcall 0x334a, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:333B  666800001500         push 0x150000
6:3341  6a14                 push 0x14
6:3343  66ff76f0             push dword ptr [bp - 0x10]
6:3347  9adc7d5b33           lcall 0x335b, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:334C  666800001600         push 0x160000
6:3352  6a14                 push 0x14
6:3354  66ff76f0             push dword ptr [bp - 0x10]
6:3358  9adc7d6d33           lcall 0x336d, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:335D  666800001700         push 0x170000
6:3363  68c800               push 0xc8
6:3366  66ff76f0             push dword ptr [bp - 0x10]
6:336A  9adc7d7f33           lcall 0x337f, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:336F  666800001800         push 0x180000
6:3375  68c800               push 0xc8
6:3378  66ff76f0             push dword ptr [bp - 0x10]
6:337C  9adc7d9133           lcall 0x3391, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:3381  666800001900         push 0x190000
6:3387  68c800               push 0xc8
6:338A  66ff76f0             push dword ptr [bp - 0x10]
6:338E  9adc7da233           lcall 0x33a2, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:3393  666800001a00         push 0x1a0000
6:3399  6a14                 push 0x14
6:339B  66ff76f0             push dword ptr [bp - 0x10]
6:339F  9adc7db333           lcall 0x33b3, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:33A4  666800001b00         push 0x1b0000
6:33AA  6a14                 push 0x14
6:33AC  66ff76f0             push dword ptr [bp - 0x10]
6:33B0  9adc7dc433           lcall 0x33c4, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:33B5  666800001c00         push 0x1c0000
6:33BB  6a14                 push 0x14
6:33BD  66ff76f0             push dword ptr [bp - 0x10]
6:33C1  9adc7dd02f           lcall 0x2fd0, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:33C6  c45ef8               les bx, ptr [bp - 8]
6:33C9  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:33D3  751d                 jne 0x33f2
6:33D5  8d46e2               lea ax, [bp - 0x1e]
6:33D8  16                   push ss
6:33D9  50                   push ax
6:33DA  9a3ea4f033           lcall 0x33f0, 0xa43e  ; sub_s5:A43E
6:33DF  668b46fc             mov eax, dword ptr [bp - 4]
6:33E3  050c00               add ax, 0xc
6:33E6  6650                 push eax
6:33E8  8d46e2               lea ax, [bp - 0x1e]
6:33EB  16                   push ss
6:33EC  50                   push ax
6:33ED  9a9ea89206           lcall 0x692, 0xa89e  ; sub_s5:A89E
loc_33F2:
6:33F2  c9                   leave
6:33F3  ca0400               retf 4

; ---------------- sub_s6:33F6 size=142 callers=0
6:33F6  c8080000             enter 8, 0
6:33FA  66ff7606             push dword ptr [bp + 6]
6:33FE  90                   nop
6:33FF  0e                   push cs
6:3400  e81580               call 0xffffb418  ; sub_s6:B418
6:3403  f6460a01             test byte ptr [bp + 0xa], 1
6:3407  7409                 je 0x3412
6:3409  66ff7606             push dword ptr [bp + 6]
6:340D  9ace17682b           lcall 0x2b68, 0x17ce  ; operator_delete@s1:17CE
loc_3412:
6:3412  8b4606               mov ax, word ptr [bp + 6]
6:3415  8b5608               mov dx, word ptr [bp + 8]
6:3418  c9                   leave
6:3419  ca0600               retf 6
6:341C  db f6 33 22 34 56 bb 2a 34 8e 17 90 32 ec b5 2e 34
6:342C  db 1a b8 32 34 1c bc 36 34 84 2e 3a 34 28 2c 3e 34
6:343C  db 7e bc 42 34 14 b5 46 34 2a be 4a 34 16 bf 4e 34
6:344C  db 1a bf 52 34 1e bf 56 34 40 2e 5a 34 22 bf 5e 34
6:345C  db f0 bb 62 34 02 bc 66 34 a8 b5 6a 34 ca b5 6e 34
6:346C  db e6 b4 72 34 ec b4 76 34 6e b4 7a 34 4a c6 7e 34
6:347C  db 22 c5 82 34 d2 ce 1d 2c

; ---------------- sub_s6:3484 FAR size=34 callers=1
6:3484  55                   push bp
6:3485  8bec                 mov bp, sp
6:3487  66ff7606             push dword ptr [bp + 6]
6:348B  90                   nop
6:348C  0e                   push cs
6:348D  e8d8cb               call 0x68  ; sub_s6:0068
6:3490  c45e06               les bx, ptr [bp + 6]
6:3493  26c707f634           mov word ptr es:[bx], 0x34f6
6:3498  26c747021e34         mov word ptr es:[bx + 2], 0x341e  ; SEGMENT s6:0000
6:349E  8bc3                 mov ax, bx
6:34A0  8cc2                 mov dx, es
6:34A2  c9                   leave
6:34A3  ca0400               retf 4

; ---------------- sub_s6:34A6 FAR size=42 callers=1
6:34A6  55                   push bp
6:34A7  8bec                 mov bp, sp
6:34A9  66ff760c             push dword ptr [bp + 0xc]
6:34AD  66ff7608             push dword ptr [bp + 8]
6:34B1  ff7606               push word ptr [bp + 6]
6:34B4  90                   nop
6:34B5  0e                   push cs
6:34B6  e813cc               call 0xcc  ; sub_s6:00CC
6:34B9  c45e06               les bx, ptr [bp + 6]
6:34BC  26c707f634           mov word ptr es:[bx], 0x34f6
6:34C1  26c747029c34         mov word ptr es:[bx + 2], 0x349c  ; SEGMENT s6:0000
6:34C7  8bc3                 mov ax, bx
6:34C9  8cc2                 mov dx, es
6:34CB  c9                   leave
6:34CC  ca0a00               retf 0xa
6:34CF  db 00

; ---------------- sub_s6:34D0 FAR size=142 callers=0
6:34D0  c8040000             enter 4, 0
6:34D4  66ff7606             push dword ptr [bp + 6]
6:34D8  90                   nop
6:34D9  0e                   push cs
6:34DA  e85bcc               call 0x138  ; sub_s6:0138
6:34DD  f6460a01             test byte ptr [bp + 0xa], 1
6:34E1  7409                 je 0x34ec
6:34E3  66ff7606             push dword ptr [bp + 6]
6:34E7  9ace171034           lcall 0x3410, 0x17ce  ; operator_delete@s1:17CE
loc_34EC:
6:34EC  8b4606               mov ax, word ptr [bp + 6]
6:34EF  8b5608               mov dx, word ptr [bp + 8]
6:34F2  c9                   leave
6:34F3  ca0600               retf 6
6:34F6  db d0 34 fc 34 56 bb 04 35 8e 17 26 34 34 02 08 35
6:3506  db 74 03 0c 35 1c bc 10 35 38 bd 14 35 90 bc 18 35
6:3516  db 7e bc 1c 35 14 b5 20 35 ec 01 24 35 16 bf 28 35
6:3526  db 82 05 2c 35 1e bf 30 35 50 05 34 35 22 bf 38 35
6:3536  db ee 04 3c 35 02 bc 40 35 a8 b5 44 35 ca b5 48 35
6:3546  db e6 b4 4c 35 ec b4 50 35 76 01 54 35 4a c6 58 35
6:3556  db 22 c5 5c 35 d2 ce c5 34

; ---------------- sub_s6:355E FAR size=34 callers=1
6:355E  55                   push bp
6:355F  8bec                 mov bp, sp
6:3561  66ff7606             push dword ptr [bp + 6]
6:3565  90                   nop
6:3566  0e                   push cs
6:3567  e8ea7d               call 0xb354  ; Building::Building()@s6:B354
6:356A  c45e06               les bx, ptr [bp + 6]
6:356D  26c7070836           mov word ptr es:[bx], 0x3608
6:3572  26c74702f834         mov word ptr es:[bx + 2], 0x34f8  ; SEGMENT s6:0000
6:3578  8bc3                 mov ax, bx
6:357A  8cc2                 mov dx, es
6:357C  c9                   leave
6:357D  ca0400               retf 4

; ---------------- sub_s6:3580 FAR size=42 callers=1
6:3580  55                   push bp
6:3581  8bec                 mov bp, sp
6:3583  66ff760c             push dword ptr [bp + 0xc]
6:3587  66ff7608             push dword ptr [bp + 8]
6:358B  ff7606               push word ptr [bp + 6]
6:358E  90                   nop
6:358F  0e                   push cs
6:3590  e80b7e               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:3593  c45e06               les bx, ptr [bp + 6]
6:3596  26c7070836           mov word ptr es:[bx], 0x3608
6:359B  26c747027635         mov word ptr es:[bx + 2], 0x3576  ; SEGMENT s6:0000
6:35A1  8bc3                 mov ax, bx
6:35A3  8cc2                 mov dx, es
6:35A5  c9                   leave
6:35A6  ca0a00               retf 0xa
6:35A9  db 00

; ---------------- sub_s6:35AA FAR size=6 callers=0
6:35AA  b80100               mov ax, 1
6:35AD  ca0400               retf 4

; ---------------- SeedPower::power@s6:35B0 size=50 callers=0
6:35B0  c8040000             enter 4, 0
6:35B4  66ff7606             push dword ptr [bp + 6]
6:35B8  90                   nop
6:35B9  0e                   push cs
6:35BA  e8d17f               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:35BD  837e0a00             cmp word ptr [bp + 0xa], 0
6:35C1  740b                 je 0x35ce
6:35C3  666800002300         push 0x230000
6:35C9  6a32                 push 0x32
6:35CB  eb09                 jmp 0x35d6
6:35CD  db 90
loc_35CE:
6:35CE  666800002300         push 0x230000
6:35D4  6a00                 push 0
loc_35D6:
6:35D6  52                   push dx
6:35D7  50                   push ax
6:35D8  9a1c7d0035           lcall 0x3500, 0x7d1c  ; Tile::setBas(value,res)@s7:7D1C
6:35DD  c9                   leave
6:35DE  ca0600               retf 6
6:35E1  db 00

; ---------------- sub_s6:35E2 FAR size=142 callers=0
6:35E2  c8040000             enter 4, 0
6:35E6  66ff7606             push dword ptr [bp + 6]
6:35EA  90                   nop
6:35EB  0e                   push cs
6:35EC  e8297e               call 0xb418  ; sub_s6:B418
6:35EF  f6460a01             test byte ptr [bp + 0xa], 1
6:35F3  7409                 je 0x35fe
6:35F5  66ff7606             push dword ptr [bp + 6]
6:35F9  9ace17ea34           lcall 0x34ea, 0x17ce  ; operator_delete@s1:17CE
loc_35FE:
6:35FE  8b4606               mov ax, word ptr [bp + 6]
6:3601  8b5608               mov dx, word ptr [bp + 8]
6:3604  c9                   leave
6:3605  ca0600               retf 6
6:3608  db e2 35 0e 36 56 bb 16 36 8e 17 db 35 ec b5 1a 36
6:3618  db 1a b8 1e 36 1c bc 22 36 38 bd 26 36 90 bc 2a 36
6:3628  db 7e bc 2e 36 14 b5 32 36 2a be 36 36 16 bf 3a 36
6:3638  db 1a bf 3e 36 b0 35 42 36 9e be 46 36 22 bf 4a 36
6:3648  db f0 bb 4e 36 02 bc 52 36 a8 b5 56 36 ca b5 5a 36
6:3658  db e6 b4 5e 36 aa 35 62 36 6e b4 66 36 4a c6 6a 36
6:3668  db 22 c5 6e 36 d2 ce 9f 35

; ---------------- sub_s6:3670 FAR size=34 callers=1
6:3670  55                   push bp
6:3671  8bec                 mov bp, sp
6:3673  66ff7606             push dword ptr [bp + 6]
6:3677  90                   nop
6:3678  0e                   push cs
6:3679  e82a01               call 0x37a6  ; sub_s6:37A6
6:367C  c45e06               les bx, ptr [bp + 6]
6:367F  26c7073e37           mov word ptr es:[bx], 0x373e
6:3684  26c747020a36         mov word ptr es:[bx + 2], 0x360a  ; SEGMENT s6:0000
6:368A  8bc3                 mov ax, bx
6:368C  8cc2                 mov dx, es
6:368E  c9                   leave
6:368F  ca0400               retf 4

; ---------------- sub_s6:3692 FAR size=42 callers=1
6:3692  55                   push bp
6:3693  8bec                 mov bp, sp
6:3695  66ff760c             push dword ptr [bp + 0xc]
6:3699  66ff7608             push dword ptr [bp + 8]
6:369D  ff7606               push word ptr [bp + 6]
6:36A0  90                   nop
6:36A1  0e                   push cs
6:36A2  e87101               call 0x3816  ; sub_s6:3816
6:36A5  c45e06               les bx, ptr [bp + 6]
6:36A8  26c7073e37           mov word ptr es:[bx], 0x373e
6:36AD  26c747028836         mov word ptr es:[bx + 2], 0x3688  ; SEGMENT s6:0000
6:36B3  8bc3                 mov ax, bx
6:36B5  8cc2                 mov dx, es
6:36B7  c9                   leave
6:36B8  ca0a00               retf 0xa
6:36BB  db 00

; ---------------- sub_s6:36BC FAR size=92 callers=0
6:36BC  c8020000             enter 2, 0
6:36C0  c45e0a               les bx, ptr [bp + 0xa]
6:36C3  6626c70700000000     mov dword ptr es:[bx], 0
6:36CB  c45e06               les bx, ptr [bp + 6]
6:36CE  6626837f2800         cmp dword ptr es:[bx + 0x28], 0
6:36D4  743c                 je 0x3712
6:36D6  c746fe0400           mov word ptr [bp - 2], 4
6:36DB  eb04                 jmp 0x36e1
6:36DD  db 90
loc_36DE:
6:36DE  ff46fe               inc word ptr [bp - 2]
loc_36E1:
6:36E1  837efe1c             cmp word ptr [bp - 2], 0x1c
6:36E5  7f2b                 jg 0x3712
6:36E7  ff76fe               push word ptr [bp - 2]
6:36EA  c45e06               les bx, ptr [bp + 6]
6:36ED  6626ff7728           push dword ptr es:[bx + 0x28]
6:36F2  9ae6badd33           lcall 0x33dd, 0xbae6  ; SparseTable::get@s5:BAE6
6:36F7  c45e0a               les bx, ptr [bp + 0xa]
6:36FA  260107               add word ptr es:[bx], ax
6:36FD  26115702             adc word ptr es:[bx + 2], dx
6:3701  6626813ffa000000     cmp dword ptr es:[bx], 0xfa
6:3709  72d3                 jb 0x36de
6:370B  b80100               mov ax, 1
6:370E  c9                   leave
6:370F  ca0800               retf 8
loc_3712:
6:3712  33c0                 xor ax, ax
6:3714  c9                   leave
6:3715  ca0800               retf 8

; ---------------- sub_s6:3718 size=142 callers=0
6:3718  c8040000             enter 4, 0
6:371C  66ff7606             push dword ptr [bp + 6]
6:3720  90                   nop
6:3721  0e                   push cs
6:3722  e86901               call 0x388e  ; sub_s6:388E
6:3725  f6460a01             test byte ptr [bp + 0xa], 1
6:3729  7409                 je 0x3734
6:372B  66ff7606             push dword ptr [bp + 6]
6:372F  9ace17fc35           lcall 0x35fc, 0x17ce  ; operator_delete@s1:17CE
loc_3734:
6:3734  8b4606               mov ax, word ptr [bp + 6]
6:3737  8b5608               mov dx, word ptr [bp + 8]
6:373A  c9                   leave
6:373B  ca0600               retf 6
6:373E  db 18 37 44 37 56 bb 4c 37 8e 17 12 36 0e 3d 50 37
6:374E  db 92 3d 54 37 1c bc 58 37 38 bd 5c 37 d4 38 60 37
6:375E  db 7e bc 64 37 14 b5 68 37 2a be 6c 37 16 bf 70 37
6:376E  db 58 39 74 37 1e bf 78 37 9e be 7c 37 22 bf 80 37
6:377E  db bc 36 84 37 02 bc 88 37 a8 b5 8c 37 ca b5 90 37
6:378E  db e6 b4 94 37 ec b4 98 37 6e b4 9c 37 4a c6 a0 37
6:379E  db 22 c5 a4 37 d2 ce b1 36

; ---------------- sub_s6:37A6 FAR size=112 callers=2
6:37A6  c8040000             enter 4, 0
6:37AA  66ff7606             push dword ptr [bp + 6]
6:37AE  90                   nop
6:37AF  0e                   push cs
6:37B0  e8a17b               call 0xb354  ; Building::Building()@s6:B354
6:37B3  c45e06               les bx, ptr [bp + 6]
6:37B6  662bc0               sub eax, eax
6:37B9  6626894720           mov dword ptr es:[bx + 0x20], eax
6:37BE  6626894724           mov dword ptr es:[bx + 0x24], eax
6:37C3  6626894728           mov dword ptr es:[bx + 0x28], eax
6:37C8  26c7072c3e           mov word ptr es:[bx], 0x3e2c
6:37CD  26c747024037         mov word ptr es:[bx + 2], 0x3740  ; SEGMENT s6:0000
6:37D3  6a0a                 push 0xa
6:37D5  9a9c173237           lcall 0x3732, 0x179c  ; operator_new@s1:179C
6:37DA  83c402               add sp, 2
6:37DD  8956fe               mov word ptr [bp - 2], dx
6:37E0  0bd0                 or dx, ax
6:37E2  741c                 je 0x3800
6:37E4  666805000500         push 0x50005
6:37EA  ff76fe               push word ptr [bp - 2]
6:37ED  50                   push ax
6:37EE  9a3ebaf536           lcall 0x36f5, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
6:37F3  c45e06               les bx, ptr [bp + 6]
6:37F6  26894728             mov word ptr es:[bx + 0x28], ax
6:37FA  2689572a             mov word ptr es:[bx + 0x2a], dx
6:37FE  eb0c                 jmp 0x380c
loc_3800:
6:3800  c45e06               les bx, ptr [bp + 6]
6:3803  6626c7472800000000   mov dword ptr es:[bx + 0x28], 0
loc_380C:
6:380C  8b4606               mov ax, word ptr [bp + 6]
6:380F  8b5608               mov dx, word ptr [bp + 8]
6:3812  c9                   leave
6:3813  ca0400               retf 4

; ---------------- sub_s6:3816 FAR size=120 callers=2
6:3816  c8040000             enter 4, 0
6:381A  66ff760c             push dword ptr [bp + 0xc]
6:381E  66ff7608             push dword ptr [bp + 8]
6:3822  ff7606               push word ptr [bp + 6]
6:3825  90                   nop
6:3826  0e                   push cs
6:3827  e8747b               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:382A  c45e06               les bx, ptr [bp + 6]
6:382D  662bc0               sub eax, eax
6:3830  6626894720           mov dword ptr es:[bx + 0x20], eax
6:3835  6626894724           mov dword ptr es:[bx + 0x24], eax
6:383A  6626894728           mov dword ptr es:[bx + 0x28], eax
6:383F  26c7072c3e           mov word ptr es:[bx], 0x3e2c
6:3844  26c74702d137         mov word ptr es:[bx + 2], 0x37d1  ; SEGMENT s6:0000
6:384A  6a0a                 push 0xa
6:384C  9a9c17d837           lcall 0x37d8, 0x179c  ; operator_new@s1:179C
6:3851  83c402               add sp, 2
6:3854  8956fe               mov word ptr [bp - 2], dx
6:3857  0bd0                 or dx, ax
6:3859  741d                 je 0x3878
6:385B  666805000500         push 0x50005
6:3861  ff76fe               push word ptr [bp - 2]
6:3864  50                   push ax
6:3865  9a3ebaf137           lcall 0x37f1, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
6:386A  c45e06               les bx, ptr [bp + 6]
6:386D  26894728             mov word ptr es:[bx + 0x28], ax
6:3871  2689572a             mov word ptr es:[bx + 0x2a], dx
6:3875  eb0d                 jmp 0x3884
6:3877  db 90
loc_3878:
6:3878  c45e06               les bx, ptr [bp + 6]
6:387B  6626c7472800000000   mov dword ptr es:[bx + 0x28], 0
loc_3884:
6:3884  8b4606               mov ax, word ptr [bp + 6]
6:3887  8b5608               mov dx, word ptr [bp + 8]
6:388A  c9                   leave
6:388B  ca0a00               retf 0xa

; ---------------- sub_s6:388E FAR size=70 callers=2
6:388E  c8100000             enter 0x10, 0
6:3892  c45e06               les bx, ptr [bp + 6]
6:3895  26c7072c3e           mov word ptr es:[bx], 0x3e2c
6:389A  26c747024838         mov word ptr es:[bx + 2], 0x3848  ; SEGMENT s6:0000
6:38A0  66268b4728           mov eax, dword ptr es:[bx + 0x28]
6:38A5  268b572a             mov dx, word ptr es:[bx + 0x2a]
6:38A9  668946fc             mov dword ptr [bp - 4], eax
6:38AD  8bda                 mov bx, dx
6:38AF  0bd0                 or dx, ax
6:38B1  7413                 je 0x38c6
6:38B3  53                   push bx
6:38B4  50                   push ax
6:38B5  9a7eba6838           lcall 0x3868, 0xba7e  ; sub_s5:BA7E
6:38BA  66ff76fc             push dword ptr [bp - 4]
6:38BE  9ace174f38           lcall 0x384f, 0x17ce  ; operator_delete@s1:17CE
6:38C3  83c404               add sp, 4
loc_38C6:
6:38C6  66ff7606             push dword ptr [bp + 6]
6:38CA  90                   nop
6:38CB  0e                   push cs
6:38CC  e8497b               call 0xb418  ; sub_s6:B418
6:38CF  c9                   leave
6:38D0  ca0400               retf 4
6:38D3  db 00

; ---------------- sub_s6:38D4 FAR size=132 callers=0
6:38D4  c8020000             enter 2, 0
6:38D8  66ff7612             push dword ptr [bp + 0x12]
6:38DC  66ff760a             push dword ptr [bp + 0xa]
6:38E0  66ff7606             push dword ptr [bp + 6]
6:38E4  90                   nop
6:38E5  0e                   push cs
6:38E6  e8cd8e               call 0xffffc7b6  ; sub_s6:C7B6
6:38E9  3d0500               cmp ax, 5
6:38EC  7405                 je 0x38f3
6:38EE  3d0600               cmp ax, 6
6:38F1  755d                 jne 0x3950
loc_38F3:
6:38F3  66ff7612             push dword ptr [bp + 0x12]
6:38F7  66ff760e             push dword ptr [bp + 0xe]
6:38FB  66ff760a             push dword ptr [bp + 0xa]
6:38FF  c45e06               les bx, ptr [bp + 6]
6:3902  06                   push es
6:3903  53                   push bx
6:3904  26c41f               les bx, ptr es:[bx]
6:3907  26ff5f60             lcall es:[bx + 0x60]
6:390B  0bc0                 or ax, ax
6:390D  7432                 je 0x3941
6:390F  66ff7612             push dword ptr [bp + 0x12]
6:3913  66ff760e             push dword ptr [bp + 0xe]
6:3917  66ff760a             push dword ptr [bp + 0xa]
6:391B  66ff7606             push dword ptr [bp + 6]
6:391F  90                   nop
6:3920  0e                   push cs
6:3921  e81a89               call 0xffffc23e  ; sub_s6:C23E
6:3924  0bc0                 or ax, ax
6:3926  7419                 je 0x3941
6:3928  66ff7612             push dword ptr [bp + 0x12]
6:392C  66ff760e             push dword ptr [bp + 0xe]
6:3930  66ff760a             push dword ptr [bp + 0xa]
6:3934  66ff7606             push dword ptr [bp + 6]
6:3938  90                   nop
6:3939  0e                   push cs
6:393A  e8d789               call 0xffffc314  ; sub_s6:C314
6:393D  0bc0                 or ax, ax
6:393F  7507                 jne 0x3948
loc_3941:
6:3941  33c0                 xor ax, ax
6:3943  c9                   leave
6:3944  ca1000               retf 0x10
6:3947  db 90
loc_3948:
6:3948  b80100               mov ax, 1
6:394B  c9                   leave
6:394C  ca1000               retf 0x10
6:394F  db 90
loc_3950:
6:3950  c706ca50a806         mov word ptr [0x50ca], 0x6a8
6:3956  ebe9                 jmp 0x3941

; ---------------- Smelter::produce@s6:3958 FAR size=730 callers=0
6:3958  c8320000             enter 0x32, 0
6:395C  57                   push di
6:395D  56                   push si
6:395E  66ff7606             push dword ptr [bp + 6]
6:3962  90                   nop
6:3963  0e                   push cs
6:3964  e8277c               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:3967  8946fc               mov word ptr [bp - 4], ax
6:396A  8956fe               mov word ptr [bp - 2], dx
6:396D  c45efc               les bx, ptr [bp - 4]
6:3970  66268b4722           mov eax, dword ptr es:[bx + 0x22]
6:3975  268b5724             mov dx, word ptr es:[bx + 0x24]
6:3979  668946f8             mov dword ptr [bp - 8], eax
6:397D  8bc2                 mov ax, dx
6:397F  0b46f8               or ax, word ptr [bp - 8]
6:3982  0f84a602             je 0x3c2c
6:3986  833e4c5700           cmp word ptr [0x574c], 0
6:398B  743f                 je 0x39cc
6:398D  c45ef8               les bx, ptr [bp - 8]
6:3990  268b4704             mov ax, word ptr es:[bx + 4]
6:3994  8946e4               mov word ptr [bp - 0x1c], ax
6:3997  c746e60000           mov word ptr [bp - 0x1a], 0
6:399C  66c746e000000000     mov dword ptr [bp - 0x20], 0
6:39A4  eb04                 jmp 0x39aa
loc_39A6:
6:39A6  66ff46e0             inc dword ptr [bp - 0x20]
loc_39AA:
6:39AA  668b46e4             mov eax, dword ptr [bp - 0x1c]
6:39AE  663946e0             cmp dword ptr [bp - 0x20], eax
6:39B2  7318                 jae 0x39cc
6:39B4  ff76e0               push word ptr [bp - 0x20]
6:39B7  8d46da               lea ax, [bp - 0x26]
6:39BA  16                   push ss
6:39BB  50                   push ax
6:39BC  8d4ed6               lea cx, [bp - 0x2a]
6:39BF  16                   push ss
6:39C0  51                   push cx
6:39C1  66ff76f8             push dword ptr [bp - 8]
6:39C5  9a16bb203b           lcall 0x3b20, 0xbb16  ; sub_s5:BB16
6:39CA  ebda                 jmp 0x39a6
loc_39CC:
6:39CC  c45efc               les bx, ptr [bp - 4]
6:39CF  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:39D4  668946f4             mov dword ptr [bp - 0xc], eax
6:39D8  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:39DC  66268b07             mov eax, dword ptr es:[bx]
6:39E0  668946f0             mov dword ptr [bp - 0x10], eax
6:39E4  8a46f0               mov al, byte ptr [bp - 0x10]
6:39E7  250100               and ax, 1
6:39EA  8946ee               mov word ptr [bp - 0x12], ax
6:39ED  c746ec0400           mov word ptr [bp - 0x14], 4
6:39F2  e9d601               jmp 0x3bcb
6:39F5  db 90
loc_39F6:
6:39F6  668b46da             mov eax, dword ptr [bp - 0x26]
6:39FA  66d1e8               shr eax, 1
6:39FD  668946e4             mov dword ptr [bp - 0x1c], eax
6:3A01  660bc0               or eax, eax
6:3A04  750e                 jne 0x3a14
6:3A06  837eee00             cmp word ptr [bp - 0x12], 0
6:3A0A  7408                 je 0x3a14
6:3A0C  66c746e401000000     mov dword ptr [bp - 0x1c], 1
loc_3A14:
6:3A14  c746de1100           mov word ptr [bp - 0x22], 0x11
6:3A19  e98a01               jmp 0x3ba6
loc_3A1C:
6:3A1C  668b46da             mov eax, dword ptr [bp - 0x26]
6:3A20  66d1e8               shr eax, 1
6:3A23  668946e4             mov dword ptr [bp - 0x1c], eax
6:3A27  660bc0               or eax, eax
6:3A2A  750e                 jne 0x3a3a
6:3A2C  837eee00             cmp word ptr [bp - 0x12], 0
6:3A30  7408                 je 0x3a3a
6:3A32  66c746e401000000     mov dword ptr [bp - 0x1c], 1
loc_3A3A:
6:3A3A  c746de1200           mov word ptr [bp - 0x22], 0x12  ; 'version %d %d'
6:3A3F  e96401               jmp 0x3ba6
loc_3A42:
6:3A42  668b46da             mov eax, dword ptr [bp - 0x26]
6:3A46  66d1e8               shr eax, 1
6:3A49  668946e4             mov dword ptr [bp - 0x1c], eax
6:3A4D  660bc0               or eax, eax
6:3A50  750e                 jne 0x3a60
6:3A52  837eee00             cmp word ptr [bp - 0x12], 0
6:3A56  7408                 je 0x3a60
6:3A58  66c746e401000000     mov dword ptr [bp - 0x1c], 1
loc_3A60:
6:3A60  c746de1300           mov word ptr [bp - 0x22], 0x13
6:3A65  e93e01               jmp 0x3ba6
loc_3A68:
6:3A68  668b46da             mov eax, dword ptr [bp - 0x26]
6:3A6C  66d1e8               shr eax, 1
6:3A6F  668946e4             mov dword ptr [bp - 0x1c], eax
6:3A73  660bc0               or eax, eax
6:3A76  750e                 jne 0x3a86
6:3A78  837eee00             cmp word ptr [bp - 0x12], 0
6:3A7C  7408                 je 0x3a86
6:3A7E  66c746e401000000     mov dword ptr [bp - 0x1c], 1
loc_3A86:
6:3A86  c746de1400           mov word ptr [bp - 0x22], 0x14
6:3A8B  e91801               jmp 0x3ba6
loc_3A8E:
6:3A8E  668b46da             mov eax, dword ptr [bp - 0x26]
6:3A92  668946e4             mov dword ptr [bp - 0x1c], eax
6:3A96  c746de1a00           mov word ptr [bp - 0x22], 0x1a
6:3A9B  e90801               jmp 0x3ba6
loc_3A9E:
6:3A9E  668b46da             mov eax, dword ptr [bp - 0x26]
6:3AA2  668946e4             mov dword ptr [bp - 0x1c], eax
6:3AA6  c746de1b00           mov word ptr [bp - 0x22], 0x1b
6:3AAB  e9f800               jmp 0x3ba6
loc_3AAE:
6:3AAE  668b46da             mov eax, dword ptr [bp - 0x26]
6:3AB2  668946e4             mov dword ptr [bp - 0x1c], eax
6:3AB6  c746de1c00           mov word ptr [bp - 0x22], 0x1c
6:3ABB  e9e800               jmp 0x3ba6
loc_3ABE:
6:3ABE  668b46da             mov eax, dword ptr [bp - 0x26]
6:3AC2  668946e4             mov dword ptr [bp - 0x1c], eax
6:3AC6  c746de1700           mov word ptr [bp - 0x22], 0x17
6:3ACB  e9d800               jmp 0x3ba6
loc_3ACE:
6:3ACE  c746de1800           mov word ptr [bp - 0x22], 0x18
6:3AD3  668b46da             mov eax, dword ptr [bp - 0x26]
6:3AD7  668946e4             mov dword ptr [bp - 0x1c], eax
6:3ADB  c45e06               les bx, ptr [bp + 6]
6:3ADE  6626014720           add dword ptr es:[bx + 0x20], eax
6:3AE3  268b4720             mov ax, word ptr es:[bx + 0x20]
6:3AE7  268b5722             mov dx, word ptr es:[bx + 0x22]
6:3AEB  8bc8                 mov cx, ax
6:3AED  8bf2                 mov si, dx
6:3AEF  d1ea                 shr dx, 1
6:3AF1  d1d8                 rcr ax, 1
6:3AF3  8946ce               mov word ptr [bp - 0x32], ax
6:3AF6  8956d0               mov word ptr [bp - 0x30], dx
6:3AF9  03c0                 add ax, ax
6:3AFB  13d2                 adc dx, dx
6:3AFD  2bc8                 sub cx, ax
6:3AFF  1bf2                 sbb si, dx
6:3B01  26894f20             mov word ptr es:[bx + 0x20], cx
6:3B05  26897722             mov word ptr es:[bx + 0x22], si
6:3B09  66837ece00           cmp dword ptr [bp - 0x32], 0
6:3B0E  0f849400             je 0x3ba6
6:3B12  6a15                 push 0x15
loc_3B14:
6:3B14  66ff76ce             push dword ptr [bp - 0x32]
6:3B18  6626ff7728           push dword ptr es:[bx + 0x28]
6:3B1D  9a8abbc63b           lcall 0x3bc6, 0xbb8a  ; SparseTable::set@s5:BB8A
6:3B22  e98100               jmp 0x3ba6
6:3B25  db 90 90 90
loc_3B28:
6:3B28  c746de1900           mov word ptr [bp - 0x22], 0x19
6:3B2D  668b46da             mov eax, dword ptr [bp - 0x26]
6:3B31  668946e4             mov dword ptr [bp - 0x1c], eax
6:3B35  c45e06               les bx, ptr [bp + 6]
6:3B38  6626014724           add dword ptr es:[bx + 0x24], eax
6:3B3D  268b4724             mov ax, word ptr es:[bx + 0x24]
6:3B41  268b5726             mov dx, word ptr es:[bx + 0x26]
6:3B45  8bf0                 mov si, ax
6:3B47  8bfa                 mov di, dx
6:3B49  66b903000000         mov ecx, 3
6:3B4F  6633d2               xor edx, edx
6:3B52  66f7f1               div ecx
6:3B55  668946ce             mov dword ptr [bp - 0x32], eax
6:3B59  8b56d0               mov dx, word ptr [bp - 0x30]
6:3B5C  8bc8                 mov cx, ax
6:3B5E  8bda                 mov bx, dx
6:3B60  03c0                 add ax, ax
6:3B62  13d2                 adc dx, dx
6:3B64  03c1                 add ax, cx
6:3B66  13d3                 adc dx, bx
6:3B68  2bf0                 sub si, ax
6:3B6A  1bfa                 sbb di, dx
6:3B6C  c45e06               les bx, ptr [bp + 6]
6:3B6F  26897724             mov word ptr es:[bx + 0x24], si
6:3B73  26897f26             mov word ptr es:[bx + 0x26], di
6:3B77  66837ece00           cmp dword ptr [bp - 0x32], 0
6:3B7C  7428                 je 0x3ba6
6:3B7E  6a16                 push 0x16
6:3B80  eb92                 jmp 0x3b14
loc_3B82:
6:3B82  2d0400               sub ax, 4
6:3B85  3d0900               cmp ax, 9
6:3B88  771c                 ja 0x3ba6
6:3B8A  03c0                 add ax, ax
6:3B8C  93                   xchg bx, ax
6:3B8D  2effa7923b           jmp word ptr cs:[bx + 0x3b92]
switch_table_3B92:
    dw loc_39F6
    dw loc_3A1C
    dw loc_3A42
    dw loc_3A68
    dw loc_3A8E
    dw loc_3A9E
    dw loc_3AAE
    dw loc_3ABE
    dw loc_3ACE
    dw loc_3B28
loc_3BA6:
6:3BA6  8b46e6               mov ax, word ptr [bp - 0x1a]
6:3BA9  0b46e4               or ax, word ptr [bp - 0x1c]
6:3BAC  741a                 je 0x3bc8
6:3BAE  837ede00             cmp word ptr [bp - 0x22], 0
6:3BB2  7414                 je 0x3bc8
6:3BB4  ff76de               push word ptr [bp - 0x22]
6:3BB7  66ff76e4             push dword ptr [bp - 0x1c]
6:3BBB  c45e06               les bx, ptr [bp + 6]
6:3BBE  6626ff7728           push dword ptr es:[bx + 0x28]
6:3BC3  9a70bbdf3b           lcall 0x3bdf, 0xbb70  ; sub_s5:BB70
loc_3BC8:
6:3BC8  ff46ec               inc word ptr [bp - 0x14]
loc_3BCB:
6:3BCB  837eec0d             cmp word ptr [bp - 0x14], 0xd
6:3BCF  7f5b                 jg 0x3c2c
6:3BD1  8b46ec               mov ax, word ptr [bp - 0x14]
6:3BD4  8946d6               mov word ptr [bp - 0x2a], ax
6:3BD7  50                   push ax
6:3BD8  66ff76f8             push dword ptr [bp - 8]
6:3BDC  9ae6baf83b           lcall 0x3bf8, 0xbae6  ; SparseTable::get@s5:BAE6
6:3BE1  8946da               mov word ptr [bp - 0x26], ax
6:3BE4  8956dc               mov word ptr [bp - 0x24], dx
6:3BE7  0bd0                 or dx, ax
6:3BE9  74dd                 je 0x3bc8
6:3BEB  ff76d6               push word ptr [bp - 0x2a]
6:3BEE  666a00               push 0
6:3BF1  66ff76f8             push dword ptr [bp - 8]
6:3BF5  9a8abbb838           lcall 0x38b8, 0xbb8a  ; SparseTable::set@s5:BB8A
6:3BFA  ff76d6               push word ptr [bp - 0x2a]
6:3BFD  8b46da               mov ax, word ptr [bp - 0x26]
6:3C00  8b56dc               mov dx, word ptr [bp - 0x24]
6:3C03  f7d8                 neg ax
6:3C05  83d200               adc dx, 0
6:3C08  f7da                 neg dx
6:3C0A  8946e0               mov word ptr [bp - 0x20], ax
6:3C0D  8956e2               mov word ptr [bp - 0x1e], dx
6:3C10  52                   push dx
6:3C11  50                   push ax
6:3C12  66ff76f4             push dword ptr [bp - 0xc]
6:3C16  9a9456f824           lcall 0x24f8, 0x5694  ; sub_s8:5694
6:3C1B  662bc0               sub eax, eax
6:3C1E  668946e4             mov dword ptr [bp - 0x1c], eax
6:3C22  8946de               mov word ptr [bp - 0x22], ax
6:3C25  8b46ec               mov ax, word ptr [bp - 0x14]
6:3C28  e957ff               jmp 0x3b82
6:3C2B  db 90
loc_3C2C:
6:3C2C  5e                   pop si
6:3C2D  5f                   pop di
6:3C2E  c9                   leave
6:3C2F  ca0400               retf 4

; ---------------- sub_s6:3C32 FAR size=46 callers=1
6:3C32  c8040000             enter 4, 0
6:3C36  8d46fc               lea ax, [bp - 4]
6:3C39  16                   push ss
6:3C3A  50                   push ax
6:3C3B  c45e06               les bx, ptr [bp + 6]
6:3C3E  06                   push es
6:3C3F  53                   push bx
6:3C40  26c41f               les bx, ptr es:[bx]
6:3C43  26ff5f40             lcall es:[bx + 0x40]
6:3C47  0bc0                 or ax, ax
6:3C49  7407                 je 0x3c52
6:3C4B  33c0                 xor ax, ax
6:3C4D  99                   cdq
6:3C4E  c9                   leave
6:3C4F  ca0400               retf 4
loc_3C52:
6:3C52  b8e803               mov ax, 0x3e8
6:3C55  99                   cdq
6:3C56  2b46fc               sub ax, word ptr [bp - 4]
6:3C59  1b56fe               sbb dx, word ptr [bp - 2]
6:3C5C  c9                   leave
6:3C5D  ca0400               retf 4

; ---------------- sub_s6:3C60 size=174 callers=0
6:3C60  c80e0000             enter 0xe, 0
6:3C64  c45e0a               les bx, ptr [bp + 0xa]
6:3C67  6626c70700000000     mov dword ptr es:[bx], 0
6:3C6F  c45e06               les bx, ptr [bp + 6]
6:3C72  6626837f2800         cmp dword ptr es:[bx + 0x28], 0
6:3C78  743c                 je 0x3cb6
6:3C7A  c746fa0400           mov word ptr [bp - 6], 4
6:3C7F  eb04                 jmp 0x3c85
6:3C81  db 90
loc_3C82:
6:3C82  ff46fa               inc word ptr [bp - 6]
loc_3C85:
6:3C85  837efa1c             cmp word ptr [bp - 6], 0x1c
6:3C89  7f2b                 jg 0x3cb6
6:3C8B  ff76fa               push word ptr [bp - 6]
6:3C8E  c45e06               les bx, ptr [bp + 6]
6:3C91  6626ff7728           push dword ptr es:[bx + 0x28]
6:3C96  9ae6baef3c           lcall 0x3cef, 0xbae6  ; SparseTable::get@s5:BAE6
6:3C9B  c45e0a               les bx, ptr [bp + 0xa]
6:3C9E  260107               add word ptr es:[bx], ax
6:3CA1  26115702             adc word ptr es:[bx + 2], dx
6:3CA5  6626813fe8030000     cmp dword ptr es:[bx], 0x3e8
6:3CAD  72d3                 jb 0x3c82
loc_3CAF:
6:3CAF  b80100               mov ax, 1
6:3CB2  c9                   leave
6:3CB3  ca0800               retf 8
loc_3CB6:
6:3CB6  c45e06               les bx, ptr [bp + 6]
6:3CB9  26c45f28             les bx, ptr es:[bx + 0x28]
6:3CBD  268b4704             mov ax, word ptr es:[bx + 4]
6:3CC1  8946fe               mov word ptr [bp - 2], ax
6:3CC4  c746fc0000           mov word ptr [bp - 4], 0
6:3CC9  eb04                 jmp 0x3ccf
6:3CCB  db 90
loc_3CCC:
6:3CCC  ff46fc               inc word ptr [bp - 4]
loc_3CCF:
6:3CCF  8b46fe               mov ax, word ptr [bp - 2]
6:3CD2  3946fc               cmp word ptr [bp - 4], ax
6:3CD5  7331                 jae 0x3d08
6:3CD7  ff76fc               push word ptr [bp - 4]
6:3CDA  8d46f6               lea ax, [bp - 0xa]
6:3CDD  16                   push ss
6:3CDE  50                   push ax
6:3CDF  8d46f2               lea ax, [bp - 0xe]
6:3CE2  16                   push ss
6:3CE3  50                   push ax
6:3CE4  c45e06               les bx, ptr [bp + 6]
6:3CE7  6626ff7728           push dword ptr es:[bx + 0x28]
6:3CEC  9a16bbc839           lcall 0x39c8, 0xbb16  ; sub_s5:BB16
6:3CF1  668b46f2             mov eax, dword ptr [bp - 0xe]
6:3CF5  c45e0a               les bx, ptr [bp + 0xa]
6:3CF8  66260107             add dword ptr es:[bx], eax
6:3CFC  6626813fe8030000     cmp dword ptr es:[bx], 0x3e8
6:3D04  72c6                 jb 0x3ccc
6:3D06  eba7                 jmp 0x3caf
loc_3D08:
6:3D08  33c0                 xor ax, ax
6:3D0A  c9                   leave
6:3D0B  ca0800               retf 8

; ---------------- sub_s6:3D0E size=132 callers=0
6:3D0E  c8100000             enter 0x10, 0
6:3D12  66ff760a             push dword ptr [bp + 0xa]
6:3D16  66ff7606             push dword ptr [bp + 6]
6:3D1A  90                   nop
6:3D1B  0e                   push cs
6:3D1C  e8cd78               call 0xb5ec  ; sub_s6:B5EC
6:3D1F  0bc0                 or ax, ax
6:3D21  7507                 jne 0x3d2a
loc_3D23:
6:3D23  33c0                 xor ax, ax
6:3D25  c9                   leave
6:3D26  ca0800               retf 8
6:3D29  db 90
loc_3D2A:
6:3D2A  c45e06               les bx, ptr [bp + 6]
6:3D2D  66268b4720           mov eax, dword ptr es:[bx + 0x20]
6:3D32  668946f2             mov dword ptr [bp - 0xe], eax
6:3D36  666a04               push 4
6:3D39  8d46f2               lea ax, [bp - 0xe]
6:3D3C  16                   push ss
6:3D3D  50                   push ax
6:3D3E  66ff760a             push dword ptr [bp + 0xa]
6:3D42  9a1c7e663d           lcall 0x3d66, 0x7e1c  ; File_write@s2:7E1C
6:3D47  0bc0                 or ax, ax
6:3D49  7436                 je 0x3d81
6:3D4B  c45e06               les bx, ptr [bp + 6]
6:3D4E  66268b4724           mov eax, dword ptr es:[bx + 0x24]
6:3D53  668946fa             mov dword ptr [bp - 6], eax
6:3D57  666a04               push 4
6:3D5A  8d46fa               lea ax, [bp - 6]
6:3D5D  16                   push ss
6:3D5E  50                   push ax
6:3D5F  66ff760a             push dword ptr [bp + 0xa]
6:3D63  9a1c7e7b3d           lcall 0x3d7b, 0x7e1c  ; File_write@s2:7E1C
6:3D68  0bc0                 or ax, ax
6:3D6A  7415                 je 0x3d81
6:3D6C  c45e06               les bx, ptr [bp + 6]
6:3D6F  6626ff7728           push dword ptr es:[bx + 0x28]
6:3D74  66ff760a             push dword ptr [bp + 0xa]
6:3D78  9a227a892f           lcall 0x2f89, 0x7a22  ; sub_s2:7A22
6:3D7D  0bc0                 or ax, ax
6:3D7F  7509                 jne 0x3d8a
loc_3D81:
6:3D81  c7061003d006         mov word ptr [0x310], 0x6d0
6:3D87  eb9a                 jmp 0x3d23
6:3D89  db 90
loc_3D8A:
6:3D8A  b80100               mov ax, 1
6:3D8D  c9                   leave
6:3D8E  ca0800               retf 8
6:3D91  db 00

; ---------------- sub_s6:3D92 FAR size=116 callers=0
6:3D92  c8100000             enter 0x10, 0
6:3D96  66ff760a             push dword ptr [bp + 0xa]
6:3D9A  66ff7606             push dword ptr [bp + 6]
6:3D9E  90                   nop
6:3D9F  0e                   push cs
6:3DA0  e8777a               call 0xb81a  ; sub_s6:B81A
6:3DA3  0bc0                 or ax, ax
6:3DA5  7507                 jne 0x3dae
loc_3DA7:
6:3DA7  33c0                 xor ax, ax
6:3DA9  c9                   leave
6:3DAA  ca0800               retf 8
6:3DAD  db 90
loc_3DAE:
6:3DAE  666a04               push 4
6:3DB1  668b4606             mov eax, dword ptr [bp + 6]
6:3DB5  052000               add ax, 0x20
6:3DB8  6650                 push eax
6:3DBA  66ff760a             push dword ptr [bp + 0xa]
6:3DBE  9aee7dda3d           lcall 0x3dda, 0x7dee  ; File_read@s2:7DEE
6:3DC3  0bc0                 or ax, ax
6:3DC5  742e                 je 0x3df5
6:3DC7  666a04               push 4
6:3DCA  668b4606             mov eax, dword ptr [bp + 6]
6:3DCE  052400               add ax, 0x24
6:3DD1  6650                 push eax
6:3DD3  66ff760a             push dword ptr [bp + 0xa]
6:3DD7  9aee7def3d           lcall 0x3def, 0x7dee  ; File_read@s2:7DEE
6:3DDC  0bc0                 or ax, ax
6:3DDE  7415                 je 0x3df5
6:3DE0  c45e06               les bx, ptr [bp + 6]
6:3DE3  6626ff7728           push dword ptr es:[bx + 0x28]
6:3DE8  66ff760a             push dword ptr [bp + 0xa]
6:3DEC  9ad47a453d           lcall 0x3d45, 0x7ad4  ; sub_s2:7AD4
6:3DF1  0bc0                 or ax, ax
6:3DF3  7509                 jne 0x3dfe
loc_3DF5:
6:3DF5  c7061003d206         mov word ptr [0x310], 0x6d2
6:3DFB  ebaa                 jmp 0x3da7
6:3DFD  db 90
loc_3DFE:
6:3DFE  b80100               mov ax, 1
6:3E01  c9                   leave
6:3E02  ca0800               retf 8
6:3E05  db 00

; ---------------- sub_s6:3E06 FAR size=142 callers=0
6:3E06  55                   push bp
6:3E07  8bec                 mov bp, sp
6:3E09  66ff7606             push dword ptr [bp + 6]
6:3E0D  90                   nop
6:3E0E  0e                   push cs
6:3E0F  e87cfa               call 0x388e  ; sub_s6:388E
6:3E12  f6460a01             test byte ptr [bp + 0xa], 1
6:3E16  7409                 je 0x3e21
6:3E18  66ff7606             push dword ptr [bp + 6]
6:3E1C  9ace17c138           lcall 0x38c1, 0x17ce  ; operator_delete@s1:17CE
loc_3E21:
6:3E21  8b4606               mov ax, word ptr [bp + 6]
6:3E24  8b5608               mov dx, word ptr [bp + 8]
6:3E27  c9                   leave
6:3E28  ca0600               retf 6
6:3E2B  db 90 06 3e 32 3e 56 bb 3a 3e 8e 17 48 37 0e 3d 3e
6:3E3B  db 3e 92 3d 42 3e 1c bc 46 3e 38 bd 4a 3e d4 38 4e
6:3E4B  db 3e 7e bc 52 3e 14 b5 56 3e 2a be 5a 3e 16 bf 5e
6:3E5B  db 3e 58 39 62 3e 1e bf 66 3e 9e be 6a 3e 22 bf 6e
6:3E6B  db 3e 60 3c 72 3e 02 bc 76 3e a8 b5 7a 3e ca b5 7e
6:3E7B  db 3e e6 b4 82 3e ec b4 86 3e 6e b4 8a 3e 4a c6 8e
6:3E8B  db 3e 22 c5 92 3e d2 ce 9e 38

; ---------------- sub_s6:3E94 FAR size=52 callers=1
6:3E94  55                   push bp
6:3E95  8bec                 mov bp, sp
6:3E97  66ff7606             push dword ptr [bp + 6]
6:3E9B  90                   nop
6:3E9C  0e                   push cs
6:3E9D  e8b474               call 0xb354  ; Building::Building()@s6:B354
6:3EA0  c45e06               les bx, ptr [bp + 6]
6:3EA3  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:3EAC  26c7070440           mov word ptr es:[bx], 0x4004
6:3EB1  26c747022e3e         mov word ptr es:[bx + 2], 0x3e2e  ; SEGMENT s6:0000
6:3EB7  06                   push es
6:3EB8  53                   push bx
6:3EB9  90                   nop
6:3EBA  0e                   push cs
6:3EBB  e8e400               call 0x3fa2  ; sub_s6:3FA2
6:3EBE  8b4606               mov ax, word ptr [bp + 6]
6:3EC1  8b5608               mov dx, word ptr [bp + 8]
6:3EC4  c9                   leave
6:3EC5  ca0400               retf 4

; ---------------- sub_s6:3EC8 FAR size=60 callers=1
6:3EC8  55                   push bp
6:3EC9  8bec                 mov bp, sp
6:3ECB  66ff760c             push dword ptr [bp + 0xc]
6:3ECF  66ff7608             push dword ptr [bp + 8]
6:3ED3  ff7606               push word ptr [bp + 6]
6:3ED6  90                   nop
6:3ED7  0e                   push cs
6:3ED8  e8c374               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:3EDB  c45e06               les bx, ptr [bp + 6]
6:3EDE  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:3EE7  26c7070440           mov word ptr es:[bx], 0x4004
6:3EEC  26c74702b53e         mov word ptr es:[bx + 2], 0x3eb5  ; SEGMENT s6:0000
6:3EF2  06                   push es
6:3EF3  53                   push bx
6:3EF4  90                   nop
6:3EF5  0e                   push cs
6:3EF6  e8a900               call 0x3fa2  ; sub_s6:3FA2
6:3EF9  8b4606               mov ax, word ptr [bp + 6]
6:3EFC  8b5608               mov dx, word ptr [bp + 8]
6:3EFF  c9                   leave
6:3F00  ca0a00               retf 0xa
6:3F03  db 00

; ---------------- Spew::produce@s6:3F04 FAR size=158 callers=0
6:3F04  c80c0000             enter 0xc, 0
6:3F08  56                   push si
6:3F09  6a1f                 push 0x1f
6:3F0B  66ff7606             push dword ptr [bp + 6]
6:3F0F  90                   nop
6:3F10  0e                   push cs
6:3F11  e87a76               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:3F14  8946fc               mov word ptr [bp - 4], ax
6:3F17  8956fe               mov word ptr [bp - 2], dx
6:3F1A  52                   push dx
6:3F1B  50                   push ax
6:3F1C  9a287c363f           lcall 0x3f36, 0x7c28  ; sub_s7:7C28
6:3F21  8946f8               mov word ptr [bp - 8], ax
6:3F24  8956fa               mov word ptr [bp - 6], dx
6:3F27  666800001f00         push 0x1f0000
6:3F2D  6a00                 push 0
6:3F2F  66ff76fc             push dword ptr [bp - 4]
6:3F33  9a1c7d4f3f           lcall 0x3f4f, 0x7d1c  ; Tile::setBas(value,res)@s7:7D1C
6:3F38  c45e06               les bx, ptr [bp + 6]
6:3F3B  26837f0c22           cmp word ptr es:[bx + 0xc], 0x22
6:3F40  7514                 jne 0x3f56
6:3F42  6a21                 push 0x21
loc_3F44:
6:3F44  66ff76f8             push dword ptr [bp - 8]
6:3F48  66ff76fc             push dword ptr [bp - 4]
6:3F4C  9adc7d363e           lcall 0x3e36, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
6:3F51  5e                   pop si
6:3F52  c9                   leave
6:3F53  ca0400               retf 4
loc_3F56:
6:3F56  26837f0c23           cmp word ptr es:[bx + 0xc], 0x23
6:3F5B  7505                 jne 0x3f62
6:3F5D  b80a00               mov ax, 0xa
6:3F60  eb03                 jmp 0x3f65
loc_3F62:
6:3F62  b80500               mov ax, 5
loc_3F65:
6:3F65  33d2                 xor dx, dx
6:3F67  8946f4               mov word ptr [bp - 0xc], ax
6:3F6A  8956f6               mov word ptr [bp - 0xa], dx
6:3F6D  66268b4f20           mov ecx, dword ptr es:[bx + 0x20]
6:3F72  66014ef8             add dword ptr [bp - 8], ecx
6:3F76  52                   push dx
6:3F77  50                   push ax
6:3F78  668b46f8             mov eax, dword ptr [bp - 8]
6:3F7C  6659                 pop ecx
6:3F7E  6633d2               xor edx, edx
6:3F81  66f7f1               div ecx
6:3F84  668bc2               mov eax, edx
6:3F87  c45e06               les bx, ptr [bp + 6]
6:3F8A  6626894720           mov dword ptr es:[bx + 0x20], eax
6:3F8F  6a21                 push 0x21
6:3F91  668b46f8             mov eax, dword ptr [bp - 8]
6:3F95  6633d2               xor edx, edx
6:3F98  66f776f4             div dword ptr [bp - 0xc]
6:3F9C  660146f8             add dword ptr [bp - 8], eax
6:3FA0  eba2                 jmp 0x3f44

; ---------------- sub_s6:3FA2 FAR size=60 callers=2
6:3FA2  c8040000             enter 4, 0
6:3FA6  c45e06               les bx, ptr [bp + 6]
6:3FA9  26837f0c22           cmp word ptr es:[bx + 0xc], 0x22
6:3FAE  7429                 je 0x3fd9
6:3FB0  26837f0c23           cmp word ptr es:[bx + 0xc], 0x23
6:3FB5  7505                 jne 0x3fbc
6:3FB7  b80a00               mov ax, 0xa
6:3FBA  eb03                 jmp 0x3fbf
loc_3FBC:
6:3FBC  b80500               mov ax, 5
loc_3FBF:
6:3FBF  33d2                 xor dx, dx
6:3FC1  d1ea                 shr dx, 1
6:3FC3  d1d8                 rcr ax, 1
6:3FC5  50                   push ax
6:3FC6  6a00                 push 0
6:3FC8  9a2e61c13d           lcall 0x3dc1, 0x612e  ; sub_s2:612E
6:3FCD  99                   cdq
6:3FCE  c45e06               les bx, ptr [bp + 6]
6:3FD1  26894720             mov word ptr es:[bx + 0x20], ax
6:3FD5  26895722             mov word ptr es:[bx + 0x22], dx
loc_3FD9:
6:3FD9  c9                   leave
6:3FDA  ca0400               retf 4
6:3FDD  db 00

; ---------------- sub_s6:3FDE FAR size=142 callers=0
6:3FDE  c8040000             enter 4, 0
6:3FE2  66ff7606             push dword ptr [bp + 6]
6:3FE6  90                   nop
6:3FE7  0e                   push cs
6:3FE8  e82d74               call 0xb418  ; sub_s6:B418
6:3FEB  f6460a01             test byte ptr [bp + 0xa], 1
6:3FEF  7409                 je 0x3ffa
6:3FF1  66ff7606             push dword ptr [bp + 6]
6:3FF5  9ace171f3e           lcall 0x3e1f, 0x17ce  ; operator_delete@s1:17CE
loc_3FFA:
6:3FFA  8b4606               mov ax, word ptr [bp + 6]
6:3FFD  8b5608               mov dx, word ptr [bp + 8]
6:4000  c9                   leave
6:4001  ca0600               retf 6
6:4004  db de 3f 0a 40 56 bb 12 40 8e 17 1f 3f ec b5 16 40
6:4014  db 1a b8 1a 40 1c bc 1e 40 38 bd 22 40 90 bc 26 40
6:4024  db 7e bc 2a 40 14 b5 2e 40 2a be 32 40 16 bf 36 40
6:4034  db 04 3f 3a 40 1e bf 3e 40 9e be 42 40 22 bf 46 40
6:4044  db f0 bb 4a 40 02 bc 4e 40 a8 b5 52 40 ca b5 56 40
6:4054  db e6 b4 5a 40 ec b4 5e 40 6e b4 62 40 4a c6 66 40
6:4064  db 22 c5 6a 40 d2 ce f0 3e

; ---------------- sub_s6:406C FAR size=34 callers=1
6:406C  55                   push bp
6:406D  8bec                 mov bp, sp
6:406F  66ff7606             push dword ptr [bp + 6]
6:4073  90                   nop
6:4074  0e                   push cs
6:4075  e8dc72               call 0xb354  ; Building::Building()@s6:B354
6:4078  c45e06               les bx, ptr [bp + 6]
6:407B  26c707ec42           mov word ptr es:[bx], 0x42ec
6:4080  26c747020640         mov word ptr es:[bx + 2], 0x4006  ; SEGMENT s6:0000
6:4086  8bc3                 mov ax, bx
6:4088  8cc2                 mov dx, es
6:408A  c9                   leave
6:408B  ca0400               retf 4

; ---------------- sub_s6:408E FAR size=42 callers=1
6:408E  55                   push bp
6:408F  8bec                 mov bp, sp
6:4091  66ff760c             push dword ptr [bp + 0xc]
6:4095  66ff7608             push dword ptr [bp + 8]
6:4099  ff7606               push word ptr [bp + 6]
6:409C  90                   nop
6:409D  0e                   push cs
6:409E  e8fd72               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:40A1  c45e06               les bx, ptr [bp + 6]
6:40A4  26c707ec42           mov word ptr es:[bx], 0x42ec
6:40A9  26c747028440         mov word ptr es:[bx + 2], 0x4084  ; SEGMENT s6:0000
6:40AF  8bc3                 mov ax, bx
6:40B1  8cc2                 mov dx, es
6:40B3  c9                   leave
6:40B4  ca0a00               retf 0xa
6:40B7  db 00

; ---------------- sub_s6:40B8 FAR size=220 callers=0
6:40B8  c8340000             enter 0x34, 0
6:40BC  57                   push di
6:40BD  56                   push si
6:40BE  66ff7606             push dword ptr [bp + 6]
6:40C2  90                   nop
6:40C3  0e                   push cs
6:40C4  e8c774               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:40C7  8946fc               mov word ptr [bp - 4], ax
6:40CA  8956fe               mov word ptr [bp - 2], dx
6:40CD  050c00               add ax, 0xc
6:40D0  1e                   push ds
6:40D1  8d7ef6               lea di, [bp - 0xa]
6:40D4  8bf0                 mov si, ax
6:40D6  16                   push ss
6:40D7  07                   pop es
6:40D8  8eda                 mov ds, dx
6:40DA  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:40DC  a5                   movsw word ptr es:[di], word ptr [si]
6:40DD  1f                   pop ds
6:40DE  8d46f6               lea ax, [bp - 0xa]
6:40E1  8946e8               mov word ptr [bp - 0x18], ax
6:40E4  8b46fa               mov ax, word ptr [bp - 6]
6:40E7  8946f4               mov word ptr [bp - 0xc], ax
6:40EA  8d7eee               lea di, [bp - 0x12]
6:40ED  8d76f6               lea si, [bp - 0xa]
6:40F0  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:40F2  a5                   movsw word ptr es:[di], word ptr [si]
6:40F3  8d46ee               lea ax, [bp - 0x12]
6:40F6  8946e0               mov word ptr [bp - 0x20], ax
6:40F9  ff46f4               inc word ptr [bp - 0xc]
6:40FC  8b46f4               mov ax, word ptr [bp - 0xc]
6:40FF  8946f2               mov word ptr [bp - 0xe], ax
6:4102  8d46d6               lea ax, [bp - 0x2a]
6:4105  16                   push ss
6:4106  50                   push ax
6:4107  66ff7606             push dword ptr [bp + 6]
6:410B  90                   nop
6:410C  0e                   push cs
6:410D  e8147a               call 0xbb24  ; sub_s6:BB24
6:4110  52                   push dx
6:4111  50                   push ax
6:4112  8d46ee               lea ax, [bp - 0x12]
6:4115  16                   push ss
6:4116  50                   push ax
6:4117  66ff364057           push dword ptr [0x5740]
6:411C  9ace645b41           lcall 0x415b, 0x64ce  ; sub_s7:64CE
6:4121  8bd8                 mov bx, ax
6:4123  8ec2                 mov es, dx
6:4125  66268b07             mov eax, dword ptr es:[bx]
6:4129  268b5702             mov dx, word ptr es:[bx + 2]
6:412D  668946ea             mov dword ptr [bp - 0x16], eax
6:4131  668946e0             mov dword ptr [bp - 0x20], eax
6:4135  668946cc             mov dword ptr [bp - 0x34], eax
6:4139  8a46cf               mov al, byte ptr [bp - 0x31]
6:413C  2ae4                 sub ah, ah
6:413E  a8ff                 test al, 0xff
6:4140  7442                 je 0x4184
6:4142  52                   push dx
6:4143  ff76ea               push word ptr [bp - 0x16]
6:4146  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:414B  90                   nop
6:414C  0e                   push cs
6:414D  e89ca0               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:4150  8946cc               mov word ptr [bp - 0x34], ax
6:4153  8956ce               mov word ptr [bp - 0x32], dx
6:4156  52                   push dx
6:4157  50                   push ax
6:4158  9aa06f6c41           lcall 0x416c, 0x6fa0  ; sub_s7:6FA0
6:415D  8946d0               mov word ptr [bp - 0x30], ax
6:4160  3d6400               cmp ax, 0x64
6:4163  751f                 jne 0x4184
6:4165  66ff76cc             push dword ptr [bp - 0x34]
6:4169  9aa8730e40           lcall 0x400e, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:416E  8946dc               mov word ptr [bp - 0x24], ax
6:4171  8956de               mov word ptr [bp - 0x22], dx
6:4174  66ff760a             push dword ptr [bp + 0xa]
6:4178  52                   push dx
6:4179  c45edc               les bx, ptr [bp - 0x24]
6:417C  50                   push ax
6:417D  26c41f               les bx, ptr es:[bx]
6:4180  26ff5f58             lcall es:[bx + 0x58]
loc_4184:
6:4184  66ff7606             push dword ptr [bp + 6]
6:4188  90                   nop
6:4189  0e                   push cs
6:418A  e88773               call 0xb514  ; sub_s6:B514
6:418D  5e                   pop si
6:418E  5f                   pop di
6:418F  c9                   leave
6:4190  ca0800               retf 8
6:4193  db 00

; ---------------- sub_s6:4194 FAR size=86 callers=0
6:4194  c8140000             enter 0x14, 0
6:4198  66ff7606             push dword ptr [bp + 6]
6:419C  90                   nop
6:419D  0e                   push cs
6:419E  e8fd7c               call 0xbe9e  ; sub_s6:BE9E
6:41A1  66ff7606             push dword ptr [bp + 6]
6:41A5  90                   nop
6:41A6  0e                   push cs
6:41A7  e84873               call 0xb4f2  ; sub_s6:B4F2
6:41AA  8946fc               mov word ptr [bp - 4], ax
6:41AD  8956fe               mov word ptr [bp - 2], dx
6:41B0  c45efc               les bx, ptr [bp - 4]
6:41B3  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:41BD  7427                 je 0x41e6
6:41BF  c45e06               les bx, ptr [bp + 6]
6:41C2  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:41C7  751d                 jne 0x41e6
6:41C9  6a2b                 push 0x2b
6:41CB  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:41D0  9aba20e441           lcall 0x41e4, 0x20ba  ; sub_s3:20BA
6:41D5  6a0e                 push 0xe
6:41D7  c45efc               les bx, ptr [bp - 4]
6:41DA  6626ff7704           push dword ptr es:[bx + 4]
6:41DF  52                   push dx
6:41E0  50                   push ax
6:41E1  9a3a04cf32           lcall 0x32cf, 0x43a  ; sub_s3:043A
loc_41E6:
6:41E6  c9                   leave
6:41E7  ca0400               retf 4

; ---------------- sub_s6:41EA size=216 callers=0
6:41EA  c8340000             enter 0x34, 0
6:41EE  57                   push di
6:41EF  56                   push si
6:41F0  66ff7606             push dword ptr [bp + 6]
6:41F4  90                   nop
6:41F5  0e                   push cs
6:41F6  e81b73               call 0xb514  ; sub_s6:B514
6:41F9  66ff7606             push dword ptr [bp + 6]
6:41FD  90                   nop
6:41FE  0e                   push cs
6:41FF  e88c73               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4202  8946fc               mov word ptr [bp - 4], ax
6:4205  8956fe               mov word ptr [bp - 2], dx
6:4208  050c00               add ax, 0xc
6:420B  1e                   push ds
6:420C  8d7ef6               lea di, [bp - 0xa]
6:420F  8bf0                 mov si, ax
6:4211  16                   push ss
6:4212  07                   pop es
6:4213  8eda                 mov ds, dx
6:4215  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4217  a5                   movsw word ptr es:[di], word ptr [si]
6:4218  1f                   pop ds
6:4219  8d46f6               lea ax, [bp - 0xa]
6:421C  8946e8               mov word ptr [bp - 0x18], ax
6:421F  8b46fa               mov ax, word ptr [bp - 6]
6:4222  8946f4               mov word ptr [bp - 0xc], ax
6:4225  8d7eee               lea di, [bp - 0x12]
6:4228  8d76f6               lea si, [bp - 0xa]
6:422B  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:422D  a5                   movsw word ptr es:[di], word ptr [si]
6:422E  8d46ee               lea ax, [bp - 0x12]
6:4231  8946e0               mov word ptr [bp - 0x20], ax
6:4234  ff46f4               inc word ptr [bp - 0xc]
6:4237  8b46f4               mov ax, word ptr [bp - 0xc]
6:423A  8946f2               mov word ptr [bp - 0xe], ax
6:423D  8d46d6               lea ax, [bp - 0x2a]
6:4240  16                   push ss
6:4241  50                   push ax
6:4242  66ff7606             push dword ptr [bp + 6]
6:4246  90                   nop
6:4247  0e                   push cs
6:4248  e8d978               call 0xbb24  ; sub_s6:BB24
6:424B  52                   push dx
6:424C  50                   push ax
6:424D  8d46ee               lea ax, [bp - 0x12]
6:4250  16                   push ss
6:4251  50                   push ax
6:4252  66ff364057           push dword ptr [0x5740]
6:4257  9ace649642           lcall 0x4296, 0x64ce  ; sub_s7:64CE
6:425C  8bd8                 mov bx, ax
6:425E  8ec2                 mov es, dx
6:4260  66268b07             mov eax, dword ptr es:[bx]
6:4264  268b5702             mov dx, word ptr es:[bx + 2]
6:4268  668946ea             mov dword ptr [bp - 0x16], eax
6:426C  668946e0             mov dword ptr [bp - 0x20], eax
6:4270  668946cc             mov dword ptr [bp - 0x34], eax
6:4274  8a46cf               mov al, byte ptr [bp - 0x31]
6:4277  2ae4                 sub ah, ah
6:4279  a8ff                 test al, 0xff
6:427B  743e                 je 0x42bb
6:427D  52                   push dx
6:427E  ff76ea               push word ptr [bp - 0x16]
6:4281  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:4286  90                   nop
6:4287  0e                   push cs
6:4288  e8619f               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:428B  8946cc               mov word ptr [bp - 0x34], ax
6:428E  8956ce               mov word ptr [bp - 0x32], dx
6:4291  52                   push dx
6:4292  50                   push ax
6:4293  9aa06fa742           lcall 0x42a7, 0x6fa0  ; sub_s7:6FA0
6:4298  8946d0               mov word ptr [bp - 0x30], ax
6:429B  3d6400               cmp ax, 0x64
6:429E  751b                 jne 0x42bb
6:42A0  66ff76cc             push dword ptr [bp - 0x34]
6:42A4  9aa8731f41           lcall 0x411f, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:42A9  8946dc               mov word ptr [bp - 0x24], ax
6:42AC  8956de               mov word ptr [bp - 0x22], dx
6:42AF  52                   push dx
6:42B0  c45edc               les bx, ptr [bp - 0x24]
6:42B3  50                   push ax
6:42B4  26c41f               les bx, ptr es:[bx]
6:42B7  26ff5f24             lcall es:[bx + 0x24]
loc_42BB:
6:42BB  5e                   pop si
6:42BC  5f                   pop di
6:42BD  c9                   leave
6:42BE  ca0400               retf 4
6:42C1  db 00

; ---------------- sub_s6:42C2 FAR size=4 callers=0
6:42C2  ca0400               retf 4
6:42C5  db 00

; ---------------- sub_s6:42C6 FAR size=142 callers=0
6:42C6  c8040000             enter 4, 0
6:42CA  66ff7606             push dword ptr [bp + 6]
6:42CE  90                   nop
6:42CF  0e                   push cs
6:42D0  e84571               call 0xb418  ; sub_s6:B418
6:42D3  f6460a01             test byte ptr [bp + 0xa], 1
6:42D7  7409                 je 0x42e2
6:42D9  66ff7606             push dword ptr [bp + 6]
6:42DD  9ace17f83f           lcall 0x3ff8, 0x17ce  ; operator_delete@s1:17CE
loc_42E2:
6:42E2  8b4606               mov ax, word ptr [bp + 6]
6:42E5  8b5608               mov dx, word ptr [bp + 8]
6:42E8  c9                   leave
6:42E9  ca0600               retf 6
6:42EC  db c6 42 f2 42 56 bb fa 42 8e 17 5a 42 ec b5 fe 42
6:42FC  db 1a b8 02 43 1c bc 06 43 38 bd 0a 43 90 bc 0e 43
6:430C  db 7e bc 12 43 ea 41 16 43 2a be 1a 43 16 bf 1e 43
6:431C  db c2 42 22 43 1e bf 26 43 94 41 2a 43 22 bf 2e 43
6:432C  db f0 bb 32 43 02 bc 36 43 a8 b5 3a 43 ca b5 3e 43
6:433C  db e6 b4 42 43 ec b4 46 43 b8 40 4a 43 4a c6 4e 43
6:434C  db 22 c5 52 43 d2 ce ad 40

; ---------------- sub_s6:4354 FAR size=34 callers=1
6:4354  55                   push bp
6:4355  8bec                 mov bp, sp
6:4357  66ff7606             push dword ptr [bp + 6]
6:435B  90                   nop
6:435C  0e                   push cs
6:435D  e8f46f               call 0xb354  ; Building::Building()@s6:B354
6:4360  c45e06               les bx, ptr [bp + 6]
6:4363  26c7076a44           mov word ptr es:[bx], 0x446a
6:4368  26c74702ee42         mov word ptr es:[bx + 2], 0x42ee  ; SEGMENT s6:0000
6:436E  8bc3                 mov ax, bx
6:4370  8cc2                 mov dx, es
6:4372  c9                   leave
6:4373  ca0400               retf 4

; ---------------- sub_s6:4376 FAR size=42 callers=1
6:4376  55                   push bp
6:4377  8bec                 mov bp, sp
6:4379  66ff760c             push dword ptr [bp + 0xc]
6:437D  66ff7608             push dword ptr [bp + 8]
6:4381  ff7606               push word ptr [bp + 6]
6:4384  90                   nop
6:4385  0e                   push cs
6:4386  e81570               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:4389  c45e06               les bx, ptr [bp + 6]
6:438C  26c7076a44           mov word ptr es:[bx], 0x446a
6:4391  26c747026c43         mov word ptr es:[bx + 2], 0x436c  ; SEGMENT s6:0000
6:4397  8bc3                 mov ax, bx
6:4399  8cc2                 mov dx, es
6:439B  c9                   leave
6:439C  ca0a00               retf 0xa
6:439F  db 00

; ---------------- sub_s6:43A0 FAR size=34 callers=0
6:43A0  55                   push bp
6:43A1  8bec                 mov bp, sp
6:43A3  c45e06               les bx, ptr [bp + 6]
6:43A6  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:43AB  740d                 je 0x43ba
6:43AD  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:43B2  7406                 je 0x43ba
6:43B4  33c0                 xor ax, ax
6:43B6  c9                   leave
6:43B7  ca0400               retf 4
loc_43BA:
6:43BA  b80100               mov ax, 1
6:43BD  c9                   leave
6:43BE  ca0400               retf 4
6:43C1  db 00

; ---------------- sub_s6:43C2 FAR size=52 callers=0
6:43C2  c8040000             enter 4, 0
6:43C6  66ff7608             push dword ptr [bp + 8]
6:43CA  ff7606               push word ptr [bp + 6]
6:43CD  90                   nop
6:43CE  0e                   push cs
6:43CF  e86679               call 0xbd38  ; sub_s6:BD38
6:43D2  837e0a00             cmp word ptr [bp + 0xa], 0
6:43D6  751a                 jne 0x43f2
6:43D8  6a08                 push 8
6:43DA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:43DF  9aba20f043           lcall 0x43f0, 0x20ba  ; sub_s3:20BA
6:43E4  c45e06               les bx, ptr [bp + 6]
6:43E7  26ff770c             push word ptr es:[bx + 0xc]
6:43EB  52                   push dx
6:43EC  50                   push ax
6:43ED  9a8c98d341           lcall 0x41d3, 0x988c  ; sub_s3:988C
loc_43F2:
6:43F2  c9                   leave
6:43F3  ca0600               retf 6

; ---------------- SolarPowerReceiver::power@s6:43F6 size=78 callers=0
6:43F6  c80a0000             enter 0xa, 0
6:43FA  666809008300         push 0x830009
6:4400  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:4405  9aba200f44           lcall 0x440f, 0x20ba  ; sub_s3:20BA
6:440A  52                   push dx
6:440B  50                   push ax
6:440C  9ad065e243           lcall 0x43e2, 0x65d0  ; sub_s3:65D0
6:4411  0bc0                 or ax, ax
6:4413  7e2a                 jle 0x443f
6:4415  66ff7606             push dword ptr [bp + 6]
6:4419  90                   nop
6:441A  0e                   push cs
6:441B  e87071               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:441E  837e0a00             cmp word ptr [bp + 0xa], 0
6:4422  740c                 je 0x4430
6:4424  666800002300         push 0x230000
6:442A  68e803               push 0x3e8
6:442D  eb09                 jmp 0x4438
6:442F  db 90
loc_4430:
6:4430  666800002300         push 0x230000
6:4436  6a00                 push 0
loc_4438:
6:4438  52                   push dx
6:4439  50                   push ax
6:443A  9a1c7df642           lcall 0x42f6, 0x7d1c  ; Tile::setBas(value,res)@s7:7D1C
loc_443F:
6:443F  c9                   leave
6:4440  ca0600               retf 6
6:4443  db 00

; ---------------- sub_s6:4444 FAR size=142 callers=0
6:4444  c8040000             enter 4, 0
6:4448  66ff7606             push dword ptr [bp + 6]
6:444C  90                   nop
6:444D  0e                   push cs
6:444E  e8c76f               call 0xb418  ; sub_s6:B418
6:4451  f6460a01             test byte ptr [bp + 0xa], 1
6:4455  7409                 je 0x4460
6:4457  66ff7606             push dword ptr [bp + 6]
6:445B  9ace17e042           lcall 0x42e0, 0x17ce  ; operator_delete@s1:17CE
loc_4460:
6:4460  8b4606               mov ax, word ptr [bp + 6]
6:4463  8b5608               mov dx, word ptr [bp + 8]
6:4466  c9                   leave
6:4467  ca0600               retf 6
6:446A  db 44 44 70 44 56 bb 78 44 8e 17 3d 44 ec b5 7c 44
6:447A  db 1a b8 80 44 1c bc 84 44 c2 43 88 44 90 bc 8c 44
6:448A  db 7e bc 90 44 14 b5 94 44 2a be 98 44 16 bf 9c 44
6:449A  db 1a bf a0 44 f6 43 a4 44 9e be a8 44 22 bf ac 44
6:44AA  db f0 bb b0 44 02 bc b4 44 a8 b5 b8 44 ca b5 bc 44
6:44BA  db e6 b4 c0 44 a0 43 c4 44 6e b4 c8 44 4a c6 cc 44
6:44CA  db 22 c5 d0 44 d2 ce 95 43

; ---------------- sub_s6:44D2 FAR size=44 callers=1
6:44D2  55                   push bp
6:44D3  8bec                 mov bp, sp
6:44D5  66ff7606             push dword ptr [bp + 6]
6:44D9  90                   nop
6:44DA  0e                   push cs
6:44DB  e8766e               call 0xb354  ; Building::Building()@s6:B354
6:44DE  c45e06               les bx, ptr [bp + 6]
6:44E1  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:44EA  26c7073648           mov word ptr es:[bx], 0x4836
6:44EF  26c747026c44         mov word ptr es:[bx + 2], 0x446c  ; SEGMENT s6:0000
6:44F5  8bc3                 mov ax, bx
6:44F7  8cc2                 mov dx, es
6:44F9  c9                   leave
6:44FA  ca0400               retf 4
6:44FD  db 00

; ---------------- sub_s6:44FE FAR size=50 callers=1
6:44FE  55                   push bp
6:44FF  8bec                 mov bp, sp
6:4501  66ff760c             push dword ptr [bp + 0xc]
6:4505  66ff7608             push dword ptr [bp + 8]
6:4509  ff7606               push word ptr [bp + 6]
6:450C  90                   nop
6:450D  0e                   push cs
6:450E  e88d6e               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:4511  c45e06               les bx, ptr [bp + 6]
6:4514  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:451D  26c7073648           mov word ptr es:[bx], 0x4836
6:4522  26c74702f344         mov word ptr es:[bx + 2], 0x44f3  ; SEGMENT s6:0000
6:4528  8bc3                 mov ax, bx
6:452A  8cc2                 mov dx, es
6:452C  c9                   leave
6:452D  ca0a00               retf 0xa

; ---------------- sub_s6:4530 FAR size=62 callers=1
6:4530  c8080000             enter 8, 0
6:4534  56                   push si
6:4535  c45e06               les bx, ptr [bp + 6]
6:4538  26c7073648           mov word ptr es:[bx], 0x4836
6:453D  26c747022645         mov word ptr es:[bx + 2], 0x4526  ; SEGMENT s6:0000
6:4543  268b4720             mov ax, word ptr es:[bx + 0x20]
6:4547  268b5722             mov dx, word ptr es:[bx + 0x22]
6:454B  8bda                 mov bx, dx
6:454D  0bd0                 or dx, ax
6:454F  740e                 je 0x455f
6:4551  6a01                 push 1
6:4553  53                   push bx
6:4554  50                   push ax
6:4555  8ec3                 mov es, bx
6:4557  8bf0                 mov si, ax
6:4559  26c41c               les bx, ptr es:[si]
6:455C  26ff1f               lcall es:[bx]
loc_455F:
6:455F  66ff7606             push dword ptr [bp + 6]
6:4563  90                   nop
6:4564  0e                   push cs
6:4565  e8b06e               call 0xb418  ; sub_s6:B418
6:4568  5e                   pop si
6:4569  c9                   leave
6:456A  ca0400               retf 4
6:456D  db 00

; ---------------- sub_s6:456E FAR size=66 callers=0
6:456E  c8080000             enter 8, 0
6:4572  56                   push si
6:4573  66ff760a             push dword ptr [bp + 0xa]
6:4577  66ff7606             push dword ptr [bp + 6]
6:457B  90                   nop
6:457C  0e                   push cs
6:457D  e8ee6e               call 0xb46e  ; sub_s6:B46E
6:4580  c45e06               les bx, ptr [bp + 6]
6:4583  268b4720             mov ax, word ptr es:[bx + 0x20]
6:4587  268b5722             mov dx, word ptr es:[bx + 0x22]
6:458B  8bda                 mov bx, dx
6:458D  0bd0                 or dx, ax
6:458F  740e                 je 0x459f
6:4591  6a01                 push 1
6:4593  53                   push bx
6:4594  50                   push ax
6:4595  8ec3                 mov es, bx
6:4597  8bf0                 mov si, ax
6:4599  26c41c               les bx, ptr es:[si]
6:459C  26ff1f               lcall es:[bx]
loc_459F:
6:459F  c45e06               les bx, ptr [bp + 6]
6:45A2  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:45AB  5e                   pop si
6:45AC  c9                   leave
6:45AD  ca0800               retf 8

; ---------------- sub_s6:45B0 size=50 callers=0
6:45B0  c8040000             enter 4, 0
6:45B4  66ff7606             push dword ptr [bp + 6]
6:45B8  90                   nop
6:45B9  0e                   push cs
6:45BA  e8e178               call 0xbe9e  ; sub_s6:BE9E
6:45BD  c45e06               les bx, ptr [bp + 6]
6:45C0  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:45C5  7516                 jne 0x45dd
6:45C7  666800000400         push 0x40000
6:45CD  6a02                 push 2
6:45CF  06                   push es
6:45D0  53                   push bx
6:45D1  90                   nop
6:45D2  0e                   push cs
6:45D3  e8b86f               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:45D6  52                   push dx
6:45D7  50                   push ax
6:45D8  9a507c7444           lcall 0x4474, 0x7c50  ; sub_s7:7C50
loc_45DD:
6:45DD  c9                   leave
6:45DE  ca0400               retf 4
6:45E1  db 00

; ---------------- sub_s6:45E2 FAR size=28 callers=6
6:45E2  55                   push bp
6:45E3  8bec                 mov bp, sp
6:45E5  66ff7606             push dword ptr [bp + 6]
6:45E9  90                   nop
6:45EA  0e                   push cs
6:45EB  e89c01               call 0x478a  ; sub_s6:478A
6:45EE  8bc8                 mov cx, ax
6:45F0  8bda                 mov bx, dx
6:45F2  b8e803               mov ax, 0x3e8
6:45F5  99                   cdq
6:45F6  2bc1                 sub ax, cx
6:45F8  1bd3                 sbb dx, bx
6:45FA  c9                   leave
6:45FB  ca0400               retf 4

; ---------------- sub_s6:45FE FAR size=362 callers=1
6:45FE  c83e0000             enter 0x3e, 0
6:4602  66ff7606             push dword ptr [bp + 6]
6:4606  90                   nop
6:4607  0e                   push cs
6:4608  e8836f               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:460B  8946fc               mov word ptr [bp - 4], ax
6:460E  8956fe               mov word ptr [bp - 2], dx
6:4611  c45efc               les bx, ptr [bp - 4]
6:4614  66268b4722           mov eax, dword ptr es:[bx + 0x22]
6:4619  668946f8             mov dword ptr [bp - 8], eax
6:461D  c45e06               les bx, ptr [bp + 6]
6:4620  268b4720             mov ax, word ptr es:[bx + 0x20]
6:4624  268b5722             mov dx, word ptr es:[bx + 0x22]
6:4628  8bda                 mov bx, dx
6:462A  8946e0               mov word ptr [bp - 0x20], ax
6:462D  8956e2               mov word ptr [bp - 0x1e], dx
6:4630  8946e4               mov word ptr [bp - 0x1c], ax
6:4633  8956e6               mov word ptr [bp - 0x1a], dx
6:4636  0bd8                 or bx, ax
6:4638  740e                 je 0x4648
6:463A  6a01                 push 1
6:463C  52                   push dx
6:463D  50                   push ax
6:463E  8ec2                 mov es, dx
6:4640  8bd8                 mov bx, ax
6:4642  26c41f               les bx, ptr es:[bx]
6:4645  26ff1f               lcall es:[bx]
loc_4648:
6:4648  6a0c                 push 0xc
6:464A  9a9c17b346           lcall 0x46b3, 0x179c  ; operator_new@s1:179C
6:464F  83c402               add sp, 2
6:4652  8946e0               mov word ptr [bp - 0x20], ax
6:4655  8956e2               mov word ptr [bp - 0x1e], dx
6:4658  0bd0                 or dx, ax
6:465A  740c                 je 0x4668
6:465C  ff76e2               push word ptr [bp - 0x1e]
6:465F  50                   push ax
6:4660  9a4a57cb46           lcall 0x46cb, 0x574a  ; sub_s2:574A
6:4665  eb04                 jmp 0x466b
6:4667  db 90
loc_4668:
6:4668  33c0                 xor ax, ax
6:466A  99                   cdq
loc_466B:
6:466B  c45e06               les bx, ptr [bp + 6]
6:466E  26894720             mov word ptr es:[bx + 0x20], ax
6:4672  26895722             mov word ptr es:[bx + 0x22], dx
6:4676  66837ef800           cmp dword ptr [bp - 8], 0
6:467B  750f                 jne 0x468c
loc_467D:
6:467D  c45e06               les bx, ptr [bp + 6]
6:4680  268b4720             mov ax, word ptr es:[bx + 0x20]
6:4684  268b5722             mov dx, word ptr es:[bx + 0x22]
6:4688  c9                   leave
6:4689  ca0400               retf 4
loc_468C:
6:468C  c45ef8               les bx, ptr [bp - 8]
6:468F  268b4704             mov ax, word ptr es:[bx + 4]
6:4693  8946f4               mov word ptr [bp - 0xc], ax
6:4696  c746f60000           mov word ptr [bp - 0xa], 0
6:469B  66c746f000000000     mov dword ptr [bp - 0x10], 0
6:46A3  e98f00               jmp 0x4735
loc_46A6:
6:46A6  66a1a268             mov eax, dword ptr [0x68a2]
6:46AA  668946ca             mov dword ptr [bp - 0x36], eax
6:46AE  6650                 push eax
6:46B0  9afc075e44           lcall 0x445e, 0x7fc  ; sub_s1:07FC
6:46B5  8946e4               mov word ptr [bp - 0x1c], ax
6:46B8  8956e6               mov word ptr [bp - 0x1a], dx
6:46BB  0bd0                 or dx, ax
6:46BD  743d                 je 0x46fc
6:46BF  c45ee4               les bx, ptr [bp - 0x1c]
6:46C2  26c7079a38           mov word ptr es:[bx], 0x389a
6:46C7  26c74702cb3f         mov word ptr es:[bx + 2], 0x3fcb  ; SEGMENT s2:0000
6:46CD  33c0                 xor ax, ax
6:46CF  c45ee4               les bx, ptr [bp - 0x1c]
6:46D2  26894704             mov word ptr es:[bx + 4], ax
6:46D6  26894706             mov word ptr es:[bx + 6], ax
6:46DA  26894708             mov word ptr es:[bx + 8], ax
6:46DE  2689470a             mov word ptr es:[bx + 0xa], ax
6:46E2  2689470c             mov word ptr es:[bx + 0xc], ax
6:46E6  26c707ce56           mov word ptr es:[bx], 0x56ce
6:46EB  26c747020f19         mov word ptr es:[bx + 2], 0x190f  ; SEGMENT s4:0000
6:46F1  668b46e4             mov eax, dword ptr [bp - 0x1c]
6:46F5  668946d6             mov dword ptr [bp - 0x2a], eax
6:46F9  eb09                 jmp 0x4704
6:46FB  db 90
loc_46FC:
6:46FC  66c746d600000000     mov dword ptr [bp - 0x2a], 0
loc_4704:
6:4704  8b46e8               mov ax, word ptr [bp - 0x18]
6:4707  c45ed6               les bx, ptr [bp - 0x2a]
6:470A  26894704             mov word ptr es:[bx + 4], ax
6:470E  8b46da               mov ax, word ptr [bp - 0x26]
6:4711  2689470a             mov word ptr es:[bx + 0xa], ax
6:4715  8b46da               mov ax, word ptr [bp - 0x26]
6:4718  2689470c             mov word ptr es:[bx + 0xc], ax
6:471C  06                   push es
6:471D  53                   push bx
6:471E  c45e06               les bx, ptr [bp + 6]
6:4721  6626ff7720           push dword ptr es:[bx + 0x20]
6:4726  26c45f20             les bx, ptr es:[bx + 0x20]
6:472A  26c41f               les bx, ptr es:[bx]
6:472D  26ff5f08             lcall es:[bx + 8]
loc_4731:
6:4731  66ff46f0             inc dword ptr [bp - 0x10]
loc_4735:
6:4735  668b46f4             mov eax, dword ptr [bp - 0xc]
6:4739  663946f0             cmp dword ptr [bp - 0x10], eax
6:473D  0f833cff             jae 0x467d
6:4741  ff76f0               push word ptr [bp - 0x10]
6:4744  8d46e8               lea ax, [bp - 0x18]
6:4747  16                   push ss
6:4748  50                   push ax
6:4749  8d4eda               lea cx, [bp - 0x26]
6:474C  16                   push ss
6:474D  51                   push cx
6:474E  66ff76f8             push dword ptr [bp - 8]
6:4752  9a16bb993c           lcall 0x3c99, 0xbb16  ; sub_s5:BB16
6:4757  66837eda00           cmp dword ptr [bp - 0x26], 0
6:475C  74d3                 je 0x4731
6:475E  837ee800             cmp word ptr [bp - 0x18], 0
6:4762  0f8540ff             jne 0x46a6
6:4766  ebc9                 jmp 0x4731

; ---------------- sub_s6:4768 FAR size=34 callers=0
6:4768  55                   push bp
6:4769  8bec                 mov bp, sp
6:476B  66ff7606             push dword ptr [bp + 6]
6:476F  90                   nop
6:4770  0e                   push cs
6:4771  e81600               call 0x478a  ; sub_s6:478A
6:4774  0bd2                 or dx, dx
6:4776  7505                 jne 0x477d
6:4778  3de803               cmp ax, 0x3e8
6:477B  7207                 jb 0x4784
loc_477D:
6:477D  b80100               mov ax, 1
6:4780  c9                   leave
6:4781  ca0400               retf 4
loc_4784:
6:4784  33c0                 xor ax, ax
6:4786  c9                   leave
6:4787  ca0400               retf 4

; ---------------- sub_s6:478A FAR size=134 callers=2
6:478A  c81c0000             enter 0x1c, 0
6:478E  66ff7606             push dword ptr [bp + 6]
6:4792  90                   nop
6:4793  0e                   push cs
6:4794  e8f76d               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4797  8946fc               mov word ptr [bp - 4], ax
6:479A  8956fe               mov word ptr [bp - 2], dx
6:479D  c45efc               les bx, ptr [bp - 4]
6:47A0  66268b4722           mov eax, dword ptr es:[bx + 0x22]
6:47A5  268b5724             mov dx, word ptr es:[bx + 0x24]
6:47A9  668946f8             mov dword ptr [bp - 8], eax
6:47AD  66c746f400000000     mov dword ptr [bp - 0xc], 0
6:47B5  8bc2                 mov ax, dx
6:47B7  0b46f8               or ax, word ptr [bp - 8]
6:47BA  7508                 jne 0x47c4
6:47BC  33c0                 xor ax, ax
6:47BE  99                   cdq
6:47BF  c9                   leave
6:47C0  ca0400               retf 4
6:47C3  db 90
loc_47C4:
6:47C4  c45ef8               les bx, ptr [bp - 8]
6:47C7  268b4704             mov ax, word ptr es:[bx + 4]
6:47CB  8946f2               mov word ptr [bp - 0xe], ax
6:47CE  c746f00000           mov word ptr [bp - 0x10], 0
6:47D3  eb28                 jmp 0x47fd
6:47D5  db 90
loc_47D6:
6:47D6  ff76f0               push word ptr [bp - 0x10]
6:47D9  8d46e8               lea ax, [bp - 0x18]
6:47DC  16                   push ss
6:47DD  50                   push ax
6:47DE  8d4ee4               lea cx, [bp - 0x1c]
6:47E1  16                   push ss
6:47E2  51                   push cx
6:47E3  66ff76f8             push dword ptr [bp - 8]
6:47E7  9a16bb5547           lcall 0x4755, 0xbb16  ; sub_s5:BB16
6:47EC  837ee800             cmp word ptr [bp - 0x18], 0
6:47F0  7e08                 jle 0x47fa
6:47F2  668b46e4             mov eax, dword ptr [bp - 0x1c]
6:47F6  660146f4             add dword ptr [bp - 0xc], eax
loc_47FA:
6:47FA  ff46f0               inc word ptr [bp - 0x10]
loc_47FD:
6:47FD  8b46f2               mov ax, word ptr [bp - 0xe]
6:4800  3946f0               cmp word ptr [bp - 0x10], ax
6:4803  72d1                 jb 0x47d6
6:4805  8b46f4               mov ax, word ptr [bp - 0xc]
6:4808  8b56f6               mov dx, word ptr [bp - 0xa]
6:480B  c9                   leave
6:480C  ca0400               retf 4
6:480F  db 00

; ---------------- sub_s6:4810 FAR size=142 callers=0
6:4810  55                   push bp
6:4811  8bec                 mov bp, sp
6:4813  66ff7606             push dword ptr [bp + 6]
6:4817  90                   nop
6:4818  0e                   push cs
6:4819  e814fd               call 0x4530  ; sub_s6:4530
6:481C  f6460a01             test byte ptr [bp + 0xa], 1
6:4820  7409                 je 0x482b
6:4822  66ff7606             push dword ptr [bp + 6]
6:4826  9ace174d46           lcall 0x464d, 0x17ce  ; operator_delete@s1:17CE
loc_482B:
6:482B  8b4606               mov ax, word ptr [bp + 6]
6:482E  8b5608               mov dx, word ptr [bp + 8]
6:4831  c9                   leave
6:4832  ca0600               retf 6
6:4835  db 90 10 48 3c 48 56 bb 44 48 8e 17 db 45 ec b5 48
6:4845  db 48 1a b8 4c 48 1c bc 50 48 38 bd 54 48 90 bc 58
6:4855  db 48 7e bc 5c 48 14 b5 60 48 2a be 64 48 16 bf 68
6:4865  db 48 1a bf 6c 48 1e bf 70 48 b0 45 74 48 22 bf 78
6:4875  db 48 f0 bb 7c 48 68 47 80 48 a8 b5 84 48 ca b5 88
6:4885  db 48 e6 b4 8c 48 ec b4 90 48 6e 45 94 48 4a c6 98
6:4895  db 48 22 c5 9c 48 d2 ce 41 45

; ---------------- sub_s6:489E FAR size=34 callers=1
6:489E  55                   push bp
6:489F  8bec                 mov bp, sp
6:48A1  66ff7606             push dword ptr [bp + 6]
6:48A5  90                   nop
6:48A6  0e                   push cs
6:48A7  e8aa6a               call 0xb354  ; Building::Building()@s6:B354
6:48AA  c45e06               les bx, ptr [bp + 6]
6:48AD  26c7074249           mov word ptr es:[bx], 0x4942
6:48B2  26c747023848         mov word ptr es:[bx + 2], 0x4838  ; SEGMENT s6:0000
6:48B8  8bc3                 mov ax, bx
6:48BA  8cc2                 mov dx, es
6:48BC  c9                   leave
6:48BD  ca0400               retf 4

; ---------------- sub_s6:48C0 FAR size=58 callers=1
6:48C0  55                   push bp
6:48C1  8bec                 mov bp, sp
6:48C3  66ff760c             push dword ptr [bp + 0xc]
6:48C7  66ff7608             push dword ptr [bp + 8]
6:48CB  ff7606               push word ptr [bp + 6]
6:48CE  90                   nop
6:48CF  0e                   push cs
6:48D0  e8cb6a               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:48D3  c45e06               les bx, ptr [bp + 6]
6:48D6  26c7074249           mov word ptr es:[bx], 0x4942
6:48DB  26c74702b648         mov word ptr es:[bx + 2], 0x48b6  ; SEGMENT s6:0000
6:48E1  268b470c             mov ax, word ptr es:[bx + 0xc]
6:48E5  2689470e             mov word ptr es:[bx + 0xe], ax
6:48E9  268b470c             mov ax, word ptr es:[bx + 0xc]
6:48ED  26894710             mov word ptr es:[bx + 0x10], ax
6:48F1  8bc3                 mov ax, bx
6:48F3  8cc2                 mov dx, es
6:48F5  c9                   leave
6:48F6  ca0a00               retf 0xa
6:48F9  db 00

; ---------------- sub_s6:48FA FAR size=18 callers=0
6:48FA  55                   push bp
6:48FB  8bec                 mov bp, sp
6:48FD  6a00                 push 0
6:48FF  66ff7606             push dword ptr [bp + 6]
6:4903  90                   nop
6:4904  0e                   push cs
6:4905  e8a474               call 0xbdac  ; sub_s6:BDAC
6:4908  c9                   leave
6:4909  ca0400               retf 4

; ---------------- sub_s6:490C FAR size=4 callers=0
6:490C  ca0400               retf 4
6:490F  db 00

; ---------------- sub_s6:4910 FAR size=4 callers=0
6:4910  ca0400               retf 4
6:4913  db 00

; ---------------- sub_s6:4914 FAR size=4 callers=0
6:4914  ca0400               retf 4
6:4917  db 00

; ---------------- sub_s6:4918 FAR size=4 callers=0
6:4918  ca0400               retf 4
6:491B  db 00

; ---------------- sub_s6:491C FAR size=142 callers=0
6:491C  c8040000             enter 4, 0
6:4920  66ff7606             push dword ptr [bp + 6]
6:4924  90                   nop
6:4925  0e                   push cs
6:4926  e8ef6a               call 0xb418  ; sub_s6:B418
6:4929  f6460a01             test byte ptr [bp + 0xa], 1
6:492D  7409                 je 0x4938
6:492F  66ff7606             push dword ptr [bp + 6]
6:4933  9ace172948           lcall 0x4829, 0x17ce  ; operator_delete@s1:17CE
loc_4938:
6:4938  8b4606               mov ax, word ptr [bp + 6]
6:493B  8b5608               mov dx, word ptr [bp + 8]
6:493E  c9                   leave
6:493F  ca0600               retf 6
6:4942  db 1c 49 48 49 56 bb 50 49 8e 17 40 48 ec b5 54 49
6:4952  db 1a b8 58 49 1c bc 5c 49 38 bd 60 49 90 bc 64 49
6:4962  db fa 48 68 49 14 b5 6c 49 0c 49 70 49 10 49 74 49
6:4972  db 14 49 78 49 1e bf 7c 49 9e be 80 49 18 49 84 49
6:4982  db f0 bb 88 49 02 bc 8c 49 a8 b5 90 49 ca b5 94 49
6:4992  db e6 b4 98 49 ec b4 9c 49 6e b4 a0 49 4a c6 a4 49
6:49A2  db 22 c5 a8 49 d2 ce df 48

; ---------------- sub_s6:49AA FAR size=52 callers=1
6:49AA  55                   push bp
6:49AB  8bec                 mov bp, sp
6:49AD  66ff7606             push dword ptr [bp + 6]
6:49B1  90                   nop
6:49B2  0e                   push cs
6:49B3  e89e69               call 0xb354  ; Building::Building()@s6:B354
6:49B6  c45e06               les bx, ptr [bp + 6]
6:49B9  26c7071c4b           mov word ptr es:[bx], 0x4b1c
6:49BE  26c747024449         mov word ptr es:[bx + 2], 0x4944  ; SEGMENT s6:0000
6:49C4  666800000a00         push 0xa0000
6:49CA  8d4720               lea ax, [bx + 0x20]
6:49CD  06                   push es
6:49CE  50                   push ax
6:49CF  9a06493649           lcall 0x4936, 0x4906  ; sub_s1:4906
6:49D4  8b4606               mov ax, word ptr [bp + 6]
6:49D7  8b5608               mov dx, word ptr [bp + 8]
6:49DA  c9                   leave
6:49DB  ca0400               retf 4

; ---------------- sub_s6:49DE FAR size=60 callers=1
6:49DE  55                   push bp
6:49DF  8bec                 mov bp, sp
6:49E1  66ff760c             push dword ptr [bp + 0xc]
6:49E5  66ff7608             push dword ptr [bp + 8]
6:49E9  ff7606               push word ptr [bp + 6]
6:49EC  90                   nop
6:49ED  0e                   push cs
6:49EE  e8ad69               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:49F1  c45e06               les bx, ptr [bp + 6]
6:49F4  26c7071c4b           mov word ptr es:[bx], 0x4b1c
6:49F9  26c74702c249         mov word ptr es:[bx + 2], 0x49c2  ; SEGMENT s6:0000
6:49FF  666800000a00         push 0xa0000
6:4A05  8d4720               lea ax, [bx + 0x20]
6:4A08  06                   push es
6:4A09  50                   push ax
6:4A0A  9a0649d249           lcall 0x49d2, 0x4906  ; sub_s1:4906
6:4A0F  8b4606               mov ax, word ptr [bp + 6]
6:4A12  8b5608               mov dx, word ptr [bp + 8]
6:4A15  c9                   leave
6:4A16  ca0a00               retf 0xa
6:4A19  db 00

; ---------------- sub_s6:4A1A FAR size=64 callers=0
6:4A1A  55                   push bp
6:4A1B  8bec                 mov bp, sp
6:4A1D  66ff760a             push dword ptr [bp + 0xa]
6:4A21  66ff7606             push dword ptr [bp + 6]
6:4A25  90                   nop
6:4A26  0e                   push cs
6:4A27  e8c26b               call 0xb5ec  ; sub_s6:B5EC
6:4A2A  0bc0                 or ax, ax
6:4A2C  7427                 je 0x4a55
6:4A2E  666a0a               push 0xa
6:4A31  668b4606             mov eax, dword ptr [bp + 6]
6:4A35  052000               add ax, 0x20
6:4A38  6650                 push eax
6:4A3A  66ff760a             push dword ptr [bp + 0xa]
6:4A3E  9a1c7e6346           lcall 0x4663, 0x7e1c  ; File_write@s2:7E1C
6:4A43  0bc0                 or ax, ax
6:4A45  750b                 jne 0x4a52
6:4A47  c7061003d006         mov word ptr [0x310], 0x6d0
6:4A4D  c9                   leave
6:4A4E  ca0800               retf 8
6:4A51  db 90
loc_4A52:
6:4A52  b80100               mov ax, 1
loc_4A55:
6:4A55  c9                   leave
6:4A56  ca0800               retf 8
6:4A59  db 00

; ---------------- sub_s6:4A5A FAR size=64 callers=0
6:4A5A  55                   push bp
6:4A5B  8bec                 mov bp, sp
6:4A5D  66ff760a             push dword ptr [bp + 0xa]
6:4A61  66ff7606             push dword ptr [bp + 6]
6:4A65  90                   nop
6:4A66  0e                   push cs
6:4A67  e8b06d               call 0xb81a  ; sub_s6:B81A
6:4A6A  0bc0                 or ax, ax
6:4A6C  7427                 je 0x4a95
6:4A6E  666a0a               push 0xa
6:4A71  668b4606             mov eax, dword ptr [bp + 6]
6:4A75  052000               add ax, 0x20
6:4A78  6650                 push eax
6:4A7A  66ff760a             push dword ptr [bp + 0xa]
6:4A7E  9aee7d414a           lcall 0x4a41, 0x7dee  ; File_read@s2:7DEE
6:4A83  0bc0                 or ax, ax
6:4A85  750b                 jne 0x4a92
6:4A87  c7061003d206         mov word ptr [0x310], 0x6d2
6:4A8D  c9                   leave
6:4A8E  ca0800               retf 8
6:4A91  db 90
loc_4A92:
6:4A92  b80100               mov ax, 1
loc_4A95:
6:4A95  c9                   leave
6:4A96  ca0800               retf 8
6:4A99  db 00

; ---------------- sub_s6:4A9A FAR size=24 callers=1
6:4A9A  55                   push bp
6:4A9B  8bec                 mov bp, sp
6:4A9D  56                   push si
6:4A9E  c45e06               les bx, ptr [bp + 6]
6:4AA1  83c320               add bx, 0x20
6:4AA4  8b760a               mov si, word ptr [bp + 0xa]
6:4AA7  03f6                 add si, si
6:4AA9  268b00               mov ax, word ptr es:[bx + si]
6:4AAC  5e                   pop si
6:4AAD  c9                   leave
6:4AAE  ca0600               retf 6
6:4AB1  db 00

; ---------------- sub_s6:4AB2 FAR size=24 callers=1
6:4AB2  55                   push bp
6:4AB3  8bec                 mov bp, sp
6:4AB5  56                   push si
6:4AB6  8b460a               mov ax, word ptr [bp + 0xa]
6:4AB9  8b760c               mov si, word ptr [bp + 0xc]
6:4ABC  03f6                 add si, si
6:4ABE  c45e06               les bx, ptr [bp + 6]
6:4AC1  26894020             mov word ptr es:[bx + si + 0x20], ax
6:4AC5  5e                   pop si
6:4AC6  c9                   leave
6:4AC7  ca0800               retf 8

; ---------------- TerraForm::produce@s6:4ACA size=44 callers=0
6:4ACA  c8080000             enter 8, 0
6:4ACE  c45e06               les bx, ptr [bp + 6]
6:4AD1  26837f2000           cmp word ptr es:[bx + 0x20], 0
6:4AD6  741a                 je 0x4af2
6:4AD8  6a2f                 push 0x2f
6:4ADA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:4ADF  9aba20e94a           lcall 0x4ae9, 0x20ba  ; sub_s3:20BA
6:4AE4  52                   push dx
6:4AE5  50                   push ax
6:4AE6  9a3eed0844           lcall 0x4408, 0xed3e  ; sub_s3:ED3E
6:4AEB  52                   push dx
6:4AEC  50                   push ax
6:4AED  9a2c2a4c49           lcall 0x494c, 0x2a2c  ; sub_s7:2A2C
loc_4AF2:
6:4AF2  c9                   leave
6:4AF3  ca0400               retf 4

; ---------------- sub_s6:4AF6 size=142 callers=0
6:4AF6  c8040000             enter 4, 0
6:4AFA  66ff7606             push dword ptr [bp + 6]
6:4AFE  90                   nop
6:4AFF  0e                   push cs
6:4B00  e81569               call 0xb418  ; sub_s6:B418
6:4B03  f6460a01             test byte ptr [bp + 0xa], 1
6:4B07  7409                 je 0x4b12
6:4B09  66ff7606             push dword ptr [bp + 6]
6:4B0D  9ace170d4a           lcall 0x4a0d, 0x17ce  ; operator_delete@s1:17CE
loc_4B12:
6:4B12  8b4606               mov ax, word ptr [bp + 6]
6:4B15  8b5608               mov dx, word ptr [bp + 8]
6:4B18  c9                   leave
6:4B19  ca0600               retf 6
6:4B1C  db f6 4a 22 4b 56 bb 2a 4b 8e 17 f0 4a 1a 4a 2e 4b
6:4B2C  db 5a 4a 32 4b 1c bc 36 4b 38 bd 3a 4b 90 bc 3e 4b
6:4B3C  db 7e bc 42 4b 14 b5 46 4b 2a be 4a 4b 16 bf 4e 4b
6:4B4C  db ca 4a 52 4b 1e bf 56 4b 9e be 5a 4b 22 bf 5e 4b
6:4B5C  db f0 bb 62 4b 02 bc 66 4b a8 b5 6a 4b ca b5 6e 4b
6:4B6C  db e6 b4 72 4b ec b4 76 4b 6e b4 7a 4b 4a c6 7e 4b
6:4B7C  db 22 c5 82 4b d2 ce fd 49

; ---------------- sub_s6:4B84 FAR size=34 callers=1
6:4B84  55                   push bp
6:4B85  8bec                 mov bp, sp
6:4B87  66ff7606             push dword ptr [bp + 6]
6:4B8B  90                   nop
6:4B8C  0e                   push cs
6:4B8D  e8c467               call 0xb354  ; Building::Building()@s6:B354
6:4B90  c45e06               les bx, ptr [bp + 6]
6:4B93  26c7077050           mov word ptr es:[bx], 0x5070
6:4B98  26c747021e4b         mov word ptr es:[bx + 2], 0x4b1e  ; SEGMENT s6:0000
6:4B9E  8bc3                 mov ax, bx
6:4BA0  8cc2                 mov dx, es
6:4BA2  c9                   leave
6:4BA3  ca0400               retf 4

; ---------------- sub_s6:4BA6 FAR size=42 callers=1
6:4BA6  55                   push bp
6:4BA7  8bec                 mov bp, sp
6:4BA9  66ff760c             push dword ptr [bp + 0xc]
6:4BAD  66ff7608             push dword ptr [bp + 8]
6:4BB1  ff7606               push word ptr [bp + 6]
6:4BB4  90                   nop
6:4BB5  0e                   push cs
6:4BB6  e8e567               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:4BB9  c45e06               les bx, ptr [bp + 6]
6:4BBC  26c7077050           mov word ptr es:[bx], 0x5070
6:4BC1  26c747029c4b         mov word ptr es:[bx + 2], 0x4b9c  ; SEGMENT s6:0000
6:4BC7  8bc3                 mov ax, bx
6:4BC9  8cc2                 mov dx, es
6:4BCB  c9                   leave
6:4BCC  ca0a00               retf 0xa
6:4BCF  db 00

; ---------------- sub_s6:4BD0 FAR size=34 callers=0
6:4BD0  55                   push bp
6:4BD1  8bec                 mov bp, sp
6:4BD3  c45e06               les bx, ptr [bp + 6]
6:4BD6  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:4BDB  740d                 je 0x4bea
6:4BDD  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:4BE2  7406                 je 0x4bea
6:4BE4  33c0                 xor ax, ax
6:4BE6  c9                   leave
6:4BE7  ca0400               retf 4
loc_4BEA:
6:4BEA  b80100               mov ax, 1
6:4BED  c9                   leave
6:4BEE  ca0400               retf 4
6:4BF1  db 00

; ---------------- sub_s6:4BF2 FAR size=228 callers=0
6:4BF2  c8340000             enter 0x34, 0
6:4BF6  57                   push di
6:4BF7  56                   push si
6:4BF8  66ff7606             push dword ptr [bp + 6]
6:4BFC  90                   nop
6:4BFD  0e                   push cs
6:4BFE  e88d69               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4C01  8946fc               mov word ptr [bp - 4], ax
6:4C04  8956fe               mov word ptr [bp - 2], dx
6:4C07  050c00               add ax, 0xc
6:4C0A  1e                   push ds
6:4C0B  8d7ef6               lea di, [bp - 0xa]
6:4C0E  8bf0                 mov si, ax
6:4C10  16                   push ss
6:4C11  07                   pop es
6:4C12  8eda                 mov ds, dx
6:4C14  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4C16  a5                   movsw word ptr es:[di], word ptr [si]
6:4C17  1f                   pop ds
6:4C18  8d46f6               lea ax, [bp - 0xa]
6:4C1B  8946e8               mov word ptr [bp - 0x18], ax
6:4C1E  8b46fa               mov ax, word ptr [bp - 6]
6:4C21  8946f4               mov word ptr [bp - 0xc], ax
6:4C24  8d7eee               lea di, [bp - 0x12]
6:4C27  8d76f6               lea si, [bp - 0xa]
6:4C2A  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4C2C  a5                   movsw word ptr es:[di], word ptr [si]
6:4C2D  8d46ee               lea ax, [bp - 0x12]
6:4C30  8946e0               mov word ptr [bp - 0x20], ax
6:4C33  ff46f4               inc word ptr [bp - 0xc]
6:4C36  8b46f4               mov ax, word ptr [bp - 0xc]
6:4C39  8946f2               mov word ptr [bp - 0xe], ax
6:4C3C  8d46d6               lea ax, [bp - 0x2a]
6:4C3F  16                   push ss
6:4C40  50                   push ax
6:4C41  66ff7606             push dword ptr [bp + 6]
6:4C45  90                   nop
6:4C46  0e                   push cs
6:4C47  e8da6e               call 0xbb24  ; sub_s6:BB24
6:4C4A  52                   push dx
6:4C4B  50                   push ax
6:4C4C  8d46ee               lea ax, [bp - 0x12]
6:4C4F  16                   push ss
6:4C50  50                   push ax
6:4C51  66ff364057           push dword ptr [0x5740]
6:4C56  9ace64954c           lcall 0x4c95, 0x64ce  ; sub_s7:64CE
6:4C5B  8bd8                 mov bx, ax
6:4C5D  8ec2                 mov es, dx
6:4C5F  66268b07             mov eax, dword ptr es:[bx]
6:4C63  268b5702             mov dx, word ptr es:[bx + 2]
6:4C67  668946ea             mov dword ptr [bp - 0x16], eax
6:4C6B  668946e0             mov dword ptr [bp - 0x20], eax
6:4C6F  668946cc             mov dword ptr [bp - 0x34], eax
6:4C73  8a46cf               mov al, byte ptr [bp - 0x31]
6:4C76  2ae4                 sub ah, ah
6:4C78  a8ff                 test al, 0xff
6:4C7A  7447                 je 0x4cc3
6:4C7C  52                   push dx
6:4C7D  ff76ea               push word ptr [bp - 0x16]
6:4C80  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:4C85  90                   nop
6:4C86  0e                   push cs
6:4C87  e86295               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:4C8A  8946cc               mov word ptr [bp - 0x34], ax
6:4C8D  8956ce               mov word ptr [bp - 0x32], dx
6:4C90  52                   push dx
6:4C91  50                   push ax
6:4C92  9aa06fab4c           lcall 0x4cab, 0x6fa0  ; sub_s7:6FA0
6:4C97  8946d0               mov word ptr [bp - 0x30], ax
6:4C9A  3d6200               cmp ax, 0x62
6:4C9D  7405                 je 0x4ca4
6:4C9F  3d6300               cmp ax, 0x63
6:4CA2  751f                 jne 0x4cc3
loc_4CA4:
6:4CA4  66ff76cc             push dword ptr [bp - 0x34]
6:4CA8  9aa873264b           lcall 0x4b26, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:4CAD  8946dc               mov word ptr [bp - 0x24], ax
6:4CB0  8956de               mov word ptr [bp - 0x22], dx
6:4CB3  66ff760a             push dword ptr [bp + 0xa]
6:4CB7  52                   push dx
6:4CB8  c45edc               les bx, ptr [bp - 0x24]
6:4CBB  50                   push ax
6:4CBC  26c41f               les bx, ptr es:[bx]
6:4CBF  26ff5f58             lcall es:[bx + 0x58]
loc_4CC3:
6:4CC3  66ff760a             push dword ptr [bp + 0xa]
6:4CC7  66ff7606             push dword ptr [bp + 6]
6:4CCB  90                   nop
6:4CCC  0e                   push cs
6:4CCD  e89e67               call 0xb46e  ; sub_s6:B46E
6:4CD0  5e                   pop si
6:4CD1  5f                   pop di
6:4CD2  c9                   leave
6:4CD3  ca0800               retf 8

; ---------------- sub_s6:4CD6 size=220 callers=0
6:4CD6  c8340000             enter 0x34, 0
6:4CDA  57                   push di
6:4CDB  56                   push si
6:4CDC  66ff7606             push dword ptr [bp + 6]
6:4CE0  90                   nop
6:4CE1  0e                   push cs
6:4CE2  e82f68               call 0xb514  ; sub_s6:B514
6:4CE5  66ff7606             push dword ptr [bp + 6]
6:4CE9  90                   nop
6:4CEA  0e                   push cs
6:4CEB  e8a068               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4CEE  8946fc               mov word ptr [bp - 4], ax
6:4CF1  8956fe               mov word ptr [bp - 2], dx
6:4CF4  050c00               add ax, 0xc
6:4CF7  1e                   push ds
6:4CF8  8d7ef6               lea di, [bp - 0xa]
6:4CFB  8bf0                 mov si, ax
6:4CFD  16                   push ss
6:4CFE  07                   pop es
6:4CFF  8eda                 mov ds, dx
6:4D01  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4D03  a5                   movsw word ptr es:[di], word ptr [si]
6:4D04  1f                   pop ds
6:4D05  8d46f6               lea ax, [bp - 0xa]
6:4D08  8946e8               mov word ptr [bp - 0x18], ax
6:4D0B  8b46fa               mov ax, word ptr [bp - 6]
6:4D0E  8946f4               mov word ptr [bp - 0xc], ax
6:4D11  8d7eee               lea di, [bp - 0x12]
6:4D14  8d76f6               lea si, [bp - 0xa]
6:4D17  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4D19  a5                   movsw word ptr es:[di], word ptr [si]
6:4D1A  8d46ee               lea ax, [bp - 0x12]
6:4D1D  8946e0               mov word ptr [bp - 0x20], ax
6:4D20  ff46f4               inc word ptr [bp - 0xc]
6:4D23  8b46f4               mov ax, word ptr [bp - 0xc]
6:4D26  8946f2               mov word ptr [bp - 0xe], ax
6:4D29  8d46d6               lea ax, [bp - 0x2a]
6:4D2C  16                   push ss
6:4D2D  50                   push ax
6:4D2E  66ff7606             push dword ptr [bp + 6]
6:4D32  90                   nop
6:4D33  0e                   push cs
6:4D34  e8ed6d               call 0xbb24  ; sub_s6:BB24
6:4D37  52                   push dx
6:4D38  50                   push ax
6:4D39  8d46ee               lea ax, [bp - 0x12]
6:4D3C  16                   push ss
6:4D3D  50                   push ax
6:4D3E  66ff364057           push dword ptr [0x5740]
6:4D43  9ace64824d           lcall 0x4d82, 0x64ce  ; sub_s7:64CE
6:4D48  8bd8                 mov bx, ax
6:4D4A  8ec2                 mov es, dx
6:4D4C  66268b07             mov eax, dword ptr es:[bx]
6:4D50  268b5702             mov dx, word ptr es:[bx + 2]
6:4D54  668946ea             mov dword ptr [bp - 0x16], eax
6:4D58  668946e0             mov dword ptr [bp - 0x20], eax
6:4D5C  668946cc             mov dword ptr [bp - 0x34], eax
6:4D60  8a46cf               mov al, byte ptr [bp - 0x31]
6:4D63  2ae4                 sub ah, ah
6:4D65  a8ff                 test al, 0xff
6:4D67  7443                 je 0x4dac
6:4D69  52                   push dx
6:4D6A  ff76ea               push word ptr [bp - 0x16]
6:4D6D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:4D72  90                   nop
6:4D73  0e                   push cs
6:4D74  e87594               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:4D77  8946cc               mov word ptr [bp - 0x34], ax
6:4D7A  8956ce               mov word ptr [bp - 0x32], dx
6:4D7D  52                   push dx
6:4D7E  50                   push ax
6:4D7F  9aa06f984d           lcall 0x4d98, 0x6fa0  ; sub_s7:6FA0
6:4D84  8946d0               mov word ptr [bp - 0x30], ax
6:4D87  3d6200               cmp ax, 0x62
6:4D8A  7405                 je 0x4d91
6:4D8C  3d6300               cmp ax, 0x63
6:4D8F  751b                 jne 0x4dac
loc_4D91:
6:4D91  66ff76cc             push dword ptr [bp - 0x34]
6:4D95  9aa873594c           lcall 0x4c59, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:4D9A  8946dc               mov word ptr [bp - 0x24], ax
6:4D9D  8956de               mov word ptr [bp - 0x22], dx
6:4DA0  52                   push dx
6:4DA1  c45edc               les bx, ptr [bp - 0x24]
6:4DA4  50                   push ax
6:4DA5  26c41f               les bx, ptr es:[bx]
6:4DA8  26ff5f24             lcall es:[bx + 0x24]
loc_4DAC:
6:4DAC  5e                   pop si
6:4DAD  5f                   pop di
6:4DAE  c9                   leave
6:4DAF  ca0400               retf 4

; ---------------- sub_s6:4DB2 size=382 callers=0
6:4DB2  c8600100             enter 0x160, 0
6:4DB6  57                   push di
6:4DB7  56                   push si
6:4DB8  6a29                 push 0x29
6:4DBA  c45e06               les bx, ptr [bp + 6]
6:4DBD  26ff770c             push word ptr es:[bx + 0xc]
6:4DC1  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:4DC6  9aaec69d4e           lcall 0x4e9d, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:4DCB  0bc0                 or ax, ax
6:4DCD  0f845801             je 0x4f29
6:4DD1  66ff7608             push dword ptr [bp + 8]
6:4DD5  ff7606               push word ptr [bp + 6]
6:4DD8  90                   nop
6:4DD9  0e                   push cs
6:4DDA  e85b6f               call 0xbd38  ; sub_s6:BD38
6:4DDD  837e0a00             cmp word ptr [bp + 0xa], 0
6:4DE1  752c                 jne 0x4e0f
6:4DE3  c45e06               les bx, ptr [bp + 6]
6:4DE6  26837f0c13           cmp word ptr es:[bx + 0xc], 0x13
6:4DEB  7522                 jne 0x4e0f
6:4DED  6a08                 push 8
6:4DEF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:4DF4  9aba200d4e           lcall 0x4e0d, 0x20ba  ; sub_s3:20BA
6:4DF9  8986b0fe             mov word ptr [bp - 0x150], ax
6:4DFD  8996b2fe             mov word ptr [bp - 0x14e], dx
6:4E01  c45e06               les bx, ptr [bp + 6]
6:4E04  26ff770c             push word ptr es:[bx + 0xc]
6:4E08  52                   push dx
6:4E09  50                   push ax
6:4E0A  9a8c98194e           lcall 0x4e19, 0x988c  ; sub_s3:988C
loc_4E0F:
6:4E0F  6a2f                 push 0x2f
6:4E11  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:4E16  9aba20e24a           lcall 0x4ae2, 0x20ba  ; sub_s3:20BA
6:4E1B  8946fc               mov word ptr [bp - 4], ax
6:4E1E  8956fe               mov word ptr [bp - 2], dx
6:4E21  c45efc               les bx, ptr [bp - 4]
6:4E24  66268b4720           mov eax, dword ptr es:[bx + 0x20]
6:4E29  668946f8             mov dword ptr [bp - 8], eax
6:4E2D  8d46f6               lea ax, [bp - 0xa]
6:4E30  16                   push ss
6:4E31  50                   push ax
6:4E32  8d46f4               lea ax, [bp - 0xc]
6:4E35  16                   push ss
6:4E36  50                   push ax
6:4E37  66ff76f8             push dword ptr [bp - 8]
6:4E3B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:4E40  90                   nop
6:4E41  0e                   push cs
6:4E42  e8a793               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:4E45  8946f0               mov word ptr [bp - 0x10], ax
6:4E48  8956f2               mov word ptr [bp - 0xe], dx
6:4E4B  52                   push dx
6:4E4C  50                   push ax
6:4E4D  9a1c5bb44e           lcall 0x4eb4, 0x5b1c  ; sub_s7:5B1C
6:4E52  66ff7606             push dword ptr [bp + 6]
6:4E56  90                   nop
6:4E57  0e                   push cs
6:4E58  e83367               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4E5B  8946ec               mov word ptr [bp - 0x14], ax
6:4E5E  8956ee               mov word ptr [bp - 0x12], dx
6:4E61  050c00               add ax, 0xc
6:4E64  1e                   push ds
6:4E65  8d7ee6               lea di, [bp - 0x1a]
6:4E68  8bf0                 mov si, ax
6:4E6A  16                   push ss
6:4E6B  07                   pop es
6:4E6C  8eda                 mov ds, dx
6:4E6E  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4E70  a5                   movsw word ptr es:[di], word ptr [si]
6:4E71  1f                   pop ds
6:4E72  8d46e6               lea ax, [bp - 0x1a]
6:4E75  8986b0fe             mov word ptr [bp - 0x150], ax
6:4E79  16                   push ss
6:4E7A  50                   push ax
6:4E7B  6a01                 push 1
6:4E7D  66ff7606             push dword ptr [bp + 6]
6:4E81  90                   nop
6:4E82  0e                   push cs
6:4E83  e8687a               call 0xc8ee  ; sub_s6:C8EE
6:4E86  8d46e4               lea ax, [bp - 0x1c]
6:4E89  16                   push ss
6:4E8A  50                   push ax
6:4E8B  8d46e2               lea ax, [bp - 0x1e]
6:4E8E  16                   push ss
6:4E8F  50                   push ax
6:4E90  8d46e0               lea ax, [bp - 0x20]
6:4E93  16                   push ss
6:4E94  50                   push ax
6:4E95  8d4ee6               lea cx, [bp - 0x1a]
6:4E98  16                   push ss
6:4E99  51                   push cx
6:4E9A  9ab43e274f           lcall 0x4f27, 0x3eb4  ; sub_s2:3EB4
6:4E9F  8b46f4               mov ax, word ptr [bp - 0xc]
6:4EA2  3946e0               cmp word ptr [bp - 0x20], ax
6:4EA5  7e22                 jle 0x4ec9
6:4EA7  ff76f6               push word ptr [bp - 0xa]
6:4EAA  ff76e0               push word ptr [bp - 0x20]
6:4EAD  66ff76f0             push dword ptr [bp - 0x10]
6:4EB1  9a3e5bc74e           lcall 0x4ec7, 0x5b3e  ; sub_s7:5B3E
6:4EB6  8d46f6               lea ax, [bp - 0xa]
6:4EB9  16                   push ss
6:4EBA  50                   push ax
6:4EBB  8d46f4               lea ax, [bp - 0xc]
6:4EBE  16                   push ss
6:4EBF  50                   push ax
6:4EC0  66ff76f0             push dword ptr [bp - 0x10]
6:4EC4  9a1c5b0d4f           lcall 0x4f0d, 0x5b1c  ; sub_s7:5B1C
loc_4EC9:
6:4EC9  c45eec               les bx, ptr [bp - 0x14]
6:4ECC  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:4ED1  668946dc             mov dword ptr [bp - 0x24], eax
6:4ED5  c45edc               les bx, ptr [bp - 0x24]
6:4ED8  66268b4704           mov eax, dword ptr es:[bx + 4]
6:4EDD  668946d8             mov dword ptr [bp - 0x28], eax
6:4EE1  66ff76f8             push dword ptr [bp - 8]
6:4EE5  6650                 push eax
6:4EE7  8d4ee6               lea cx, [bp - 0x1a]
6:4EEA  16                   push ss
6:4EEB  51                   push cx
6:4EEC  666800006200         push 0x620000
6:4EF2  6a00                 push 0
6:4EF4  8d96b4fe             lea dx, [bp - 0x14c]
6:4EF8  16                   push ss
6:4EF9  52                   push dx
6:4EFA  90                   nop
6:4EFB  0e                   push cs
6:4EFC  e8f138               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:4EFF  8d86b4fe             lea ax, [bp - 0x14c]
6:4F03  16                   push ss
6:4F04  50                   push ax
6:4F05  66ff364857           push dword ptr [0x5748]  ; g_sim
6:4F0A  9a5a83464d           lcall 0x4d46, 0x835a  ; Sim::enqueue@s7:835A
6:4F0F  8d46e6               lea ax, [bp - 0x1a]
6:4F12  16                   push ss
6:4F13  50                   push ax
6:4F14  66ff7606             push dword ptr [bp + 6]
6:4F18  90                   nop
6:4F19  0e                   push cs
6:4F1A  e8b37d               call 0xccd0  ; sub_s6:CCD0
6:4F1D  c786b4fe9a38         mov word ptr [bp - 0x14c], 0x389a
6:4F23  c786b6fe814a         mov word ptr [bp - 0x14a], 0x4a81  ; SEGMENT s2:0000
loc_4F29:
6:4F29  5e                   pop si
6:4F2A  5f                   pop di
6:4F2B  c9                   leave
6:4F2C  ca0600               retf 6
6:4F2F  db 00

; ---------------- Tokamak::power@s6:4F30 FAR size=50 callers=0
6:4F30  c8040000             enter 4, 0
6:4F34  66ff7606             push dword ptr [bp + 6]
6:4F38  90                   nop
6:4F39  0e                   push cs
6:4F3A  e85166               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4F3D  837e0a00             cmp word ptr [bp + 0xa], 0
6:4F41  740b                 je 0x4f4e
6:4F43  666800002300         push 0x230000
6:4F49  68e803               push 0x3e8
6:4F4C  eb08                 jmp 0x4f56
loc_4F4E:
6:4F4E  666800002300         push 0x230000
6:4F54  6a00                 push 0
loc_4F56:
6:4F56  52                   push dx
6:4F57  50                   push ax
6:4F58  9a1c7d504e           lcall 0x4e50, 0x7d1c  ; Tile::setBas(value,res)@s7:7D1C
6:4F5D  c9                   leave
6:4F5E  ca0600               retf 6
6:4F61  db 00

; ---------------- sub_s6:4F62 FAR size=72 callers=1
6:4F62  c8160000             enter 0x16, 0
6:4F66  57                   push di
6:4F67  56                   push si
6:4F68  66ff7606             push dword ptr [bp + 6]
6:4F6C  90                   nop
6:4F6D  0e                   push cs
6:4F6E  e81d66               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4F71  8946fc               mov word ptr [bp - 4], ax
6:4F74  8956fe               mov word ptr [bp - 2], dx
6:4F77  050c00               add ax, 0xc
6:4F7A  1e                   push ds
6:4F7B  8d7ef6               lea di, [bp - 0xa]
6:4F7E  8bf0                 mov si, ax
6:4F80  16                   push ss
6:4F81  07                   pop es
6:4F82  8eda                 mov ds, dx
6:4F84  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4F86  a5                   movsw word ptr es:[di], word ptr [si]
6:4F87  1f                   pop ds
6:4F88  8d46f6               lea ax, [bp - 0xa]
6:4F8B  8946f2               mov word ptr [bp - 0xe], ax
6:4F8E  8b46fa               mov ax, word ptr [bp - 6]
6:4F91  8946f4               mov word ptr [bp - 0xc], ax
6:4F94  0bc0                 or ax, ax
6:4F96  750a                 jne 0x4fa2
6:4F98  b80100               mov ax, 1
6:4F9B  5e                   pop si
6:4F9C  5f                   pop di
6:4F9D  c9                   leave
6:4F9E  ca0400               retf 4
6:4FA1  db 90
loc_4FA2:
6:4FA2  33c0                 xor ax, ax
6:4FA4  5e                   pop si
6:4FA5  5f                   pop di
6:4FA6  c9                   leave
6:4FA7  ca0400               retf 4

; ---------------- sub_s6:4FAA FAR size=160 callers=1
6:4FAA  c8240000             enter 0x24, 0
6:4FAE  57                   push di
6:4FAF  56                   push si
6:4FB0  66ff7606             push dword ptr [bp + 6]
6:4FB4  90                   nop
6:4FB5  0e                   push cs
6:4FB6  e8a9ff               call 0x4f62  ; sub_s6:4F62
6:4FB9  0bc0                 or ax, ax
6:4FBB  740d                 je 0x4fca
6:4FBD  8b4606               mov ax, word ptr [bp + 6]
6:4FC0  8b5608               mov dx, word ptr [bp + 8]
6:4FC3  5e                   pop si
6:4FC4  5f                   pop di
6:4FC5  c9                   leave
6:4FC6  ca0400               retf 4
6:4FC9  db 90
loc_4FCA:
6:4FCA  66ff7606             push dword ptr [bp + 6]
6:4FCE  90                   nop
6:4FCF  0e                   push cs
6:4FD0  e8bb65               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:4FD3  8946fc               mov word ptr [bp - 4], ax
6:4FD6  8956fe               mov word ptr [bp - 2], dx
6:4FD9  050c00               add ax, 0xc
6:4FDC  1e                   push ds
6:4FDD  8d7ef6               lea di, [bp - 0xa]
6:4FE0  8bf0                 mov si, ax
6:4FE2  16                   push ss
6:4FE3  07                   pop es
6:4FE4  8eda                 mov ds, dx
6:4FE6  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:4FE8  a5                   movsw word ptr es:[di], word ptr [si]
6:4FE9  1f                   pop ds
6:4FEA  8d46f6               lea ax, [bp - 0xa]
6:4FED  8946e8               mov word ptr [bp - 0x18], ax
6:4FF0  c746fa0000           mov word ptr [bp - 6], 0
6:4FF5  66ff7606             push dword ptr [bp + 6]
6:4FF9  90                   nop
6:4FFA  0e                   push cs
6:4FFB  e8266b               call 0xbb24  ; sub_s6:BB24
6:4FFE  8946f2               mov word ptr [bp - 0xe], ax
6:5001  8956f4               mov word ptr [bp - 0xc], dx
6:5004  52                   push dx
6:5005  50                   push ax
6:5006  8d46f6               lea ax, [bp - 0xa]
6:5009  16                   push ss
6:500A  50                   push ax
6:500B  66ff364057           push dword ptr [0x5740]
6:5010  9a7e624150           lcall 0x5041, 0x627e  ; sub_s7:627E
6:5015  8946ee               mov word ptr [bp - 0x12], ax
6:5018  8956f0               mov word ptr [bp - 0x10], dx
6:501B  52                   push dx
6:501C  50                   push ax
6:501D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:5022  90                   nop
6:5023  0e                   push cs
6:5024  e8c591               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:5027  8946ea               mov word ptr [bp - 0x16], ax
6:502A  8956ec               mov word ptr [bp - 0x14], dx
6:502D  0bd0                 or dx, ax
6:502F  7509                 jne 0x503a
6:5031  33c0                 xor ax, ax
6:5033  99                   cdq
6:5034  5e                   pop si
6:5035  5f                   pop di
6:5036  c9                   leave
6:5037  ca0400               retf 4
loc_503A:
6:503A  ff76ec               push word ptr [bp - 0x14]
6:503D  50                   push ax
6:503E  9aa8735b4f           lcall 0x4f5b, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:5043  5e                   pop si
6:5044  5f                   pop di
6:5045  c9                   leave
6:5046  ca0400               retf 4
6:5049  db 00

; ---------------- sub_s6:504A FAR size=142 callers=0
6:504A  c8040000             enter 4, 0
6:504E  66ff7606             push dword ptr [bp + 6]
6:5052  90                   nop
6:5053  0e                   push cs
6:5054  e8c163               call 0xb418  ; sub_s6:B418
6:5057  f6460a01             test byte ptr [bp + 0xa], 1
6:505B  7409                 je 0x5066
6:505D  66ff7606             push dword ptr [bp + 6]
6:5061  9ace17104b           lcall 0x4b10, 0x17ce  ; operator_delete@s1:17CE
loc_5066:
6:5066  8b4606               mov ax, word ptr [bp + 6]
6:5069  8b5608               mov dx, word ptr [bp + 8]
6:506C  c9                   leave
6:506D  ca0600               retf 6
6:5070  db 4a 50 76 50 56 bb 7e 50 8e 17 13 50 ec b5 82 50
6:5080  db 1a b8 86 50 1c bc 8a 50 b2 4d 8e 50 90 bc 92 50
6:5090  db 7e bc 96 50 d6 4c 9a 50 2a be 9e 50 16 bf a2 50
6:50A0  db 1a bf a6 50 30 4f aa 50 9e be ae 50 22 bf b2 50
6:50B0  db f0 bb b6 50 02 bc ba 50 a8 b5 be 50 ca b5 c2 50
6:50C0  db e6 b4 c6 50 d0 4b ca 50 f2 4b ce 50 4a c6 d2 50
6:50D0  db 22 c5 d6 50 d2 ce c5 4b

; ---------------- sub_s6:50D8 FAR size=34 callers=1
6:50D8  55                   push bp
6:50D9  8bec                 mov bp, sp
6:50DB  66ff7606             push dword ptr [bp + 6]
6:50DF  90                   nop
6:50E0  0e                   push cs
6:50E1  e87062               call 0xb354  ; Building::Building()@s6:B354
6:50E4  c45e06               les bx, ptr [bp + 6]
6:50E7  26c7078052           mov word ptr es:[bx], 0x5280
6:50EC  26c747027250         mov word ptr es:[bx + 2], 0x5072  ; SEGMENT s6:0000
6:50F2  8bc3                 mov ax, bx
6:50F4  8cc2                 mov dx, es
6:50F6  c9                   leave
6:50F7  ca0400               retf 4

; ---------------- sub_s6:50FA FAR size=42 callers=1
6:50FA  55                   push bp
6:50FB  8bec                 mov bp, sp
6:50FD  66ff760c             push dword ptr [bp + 0xc]
6:5101  66ff7608             push dword ptr [bp + 8]
6:5105  ff7606               push word ptr [bp + 6]
6:5108  90                   nop
6:5109  0e                   push cs
6:510A  e89162               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:510D  c45e06               les bx, ptr [bp + 6]
6:5110  26c7078052           mov word ptr es:[bx], 0x5280
6:5115  26c74702f050         mov word ptr es:[bx + 2], 0x50f0  ; SEGMENT s6:0000 | 'SCPop'
6:511B  8bc3                 mov ax, bx
6:511D  8cc2                 mov dx, es
6:511F  c9                   leave
6:5120  ca0a00               retf 0xa
6:5123  db 00

; ---------------- sub_s6:5124 FAR size=4 callers=0
6:5124  ca0400               retf 4
6:5127  db 00

; ---------------- sub_s6:5128 FAR size=306 callers=0
6:5128  c8600100             enter 0x160, 0
6:512C  57                   push di
6:512D  56                   push si
6:512E  66ff7608             push dword ptr [bp + 8]
6:5132  ff7606               push word ptr [bp + 6]
6:5135  90                   nop
6:5136  0e                   push cs
6:5137  e8fe6b               call 0xbd38  ; sub_s6:BD38
6:513A  6a2f                 push 0x2f
6:513C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:5141  9aba20f74d           lcall 0x4df7, 0x20ba  ; sub_s3:20BA
6:5146  8946fc               mov word ptr [bp - 4], ax
6:5149  8956fe               mov word ptr [bp - 2], dx
6:514C  c45efc               les bx, ptr [bp - 4]
6:514F  66268b4720           mov eax, dword ptr es:[bx + 0x20]
6:5154  668946f8             mov dword ptr [bp - 8], eax
6:5158  8d46f6               lea ax, [bp - 0xa]
6:515B  16                   push ss
6:515C  50                   push ax
6:515D  8d46f4               lea ax, [bp - 0xc]
6:5160  16                   push ss
6:5161  50                   push ax
6:5162  66ff76f8             push dword ptr [bp - 8]
6:5166  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:516B  90                   nop
6:516C  0e                   push cs
6:516D  e87c90               call 0xffffe1ec  ; Db::resolveHandle@s6:E1EC
6:5170  8946f0               mov word ptr [bp - 0x10], ax
6:5173  8956f2               mov word ptr [bp - 0xe], dx
6:5176  52                   push dx
6:5177  50                   push ax
6:5178  9a1c5bdf51           lcall 0x51df, 0x5b1c  ; sub_s7:5B1C
6:517D  66ff7606             push dword ptr [bp + 6]
6:5181  90                   nop
6:5182  0e                   push cs
6:5183  e80864               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:5186  8946ec               mov word ptr [bp - 0x14], ax
6:5189  8956ee               mov word ptr [bp - 0x12], dx
6:518C  050c00               add ax, 0xc
6:518F  1e                   push ds
6:5190  8d7ee6               lea di, [bp - 0x1a]
6:5193  8bf0                 mov si, ax
6:5195  16                   push ss
6:5196  07                   pop es
6:5197  8eda                 mov ds, dx
6:5199  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:519B  a5                   movsw word ptr es:[di], word ptr [si]
6:519C  1f                   pop ds
6:519D  8d46e6               lea ax, [bp - 0x1a]
6:51A0  8986b0fe             mov word ptr [bp - 0x150], ax
6:51A4  16                   push ss
6:51A5  50                   push ax
6:51A6  6a01                 push 1
6:51A8  66ff7606             push dword ptr [bp + 6]
6:51AC  90                   nop
6:51AD  0e                   push cs
6:51AE  e83d77               call 0xc8ee  ; sub_s6:C8EE
6:51B1  8d46e4               lea ax, [bp - 0x1c]
6:51B4  16                   push ss
6:51B5  50                   push ax
6:51B6  8d46e2               lea ax, [bp - 0x1e]
6:51B9  16                   push ss
6:51BA  50                   push ax
6:51BB  8d46e0               lea ax, [bp - 0x20]
6:51BE  16                   push ss
6:51BF  50                   push ax
6:51C0  8d4ee6               lea cx, [bp - 0x1a]
6:51C3  16                   push ss
6:51C4  51                   push cx
6:51C5  9ab43e5252           lcall 0x5252, 0x3eb4  ; sub_s2:3EB4
6:51CA  8b46f4               mov ax, word ptr [bp - 0xc]
6:51CD  3946e0               cmp word ptr [bp - 0x20], ax
6:51D0  7e22                 jle 0x51f4
6:51D2  ff76f6               push word ptr [bp - 0xa]
6:51D5  ff76e0               push word ptr [bp - 0x20]
6:51D8  66ff76f0             push dword ptr [bp - 0x10]
6:51DC  9a3e5bf251           lcall 0x51f2, 0x5b3e  ; sub_s7:5B3E
6:51E1  8d46f6               lea ax, [bp - 0xa]
6:51E4  16                   push ss
6:51E5  50                   push ax
6:51E6  8d46f4               lea ax, [bp - 0xc]
6:51E9  16                   push ss
6:51EA  50                   push ax
6:51EB  66ff76f0             push dword ptr [bp - 0x10]
6:51EF  9a1c5b3852           lcall 0x5238, 0x5b1c  ; sub_s7:5B1C
loc_51F4:
6:51F4  c45eec               les bx, ptr [bp - 0x14]
6:51F7  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:51FC  668946dc             mov dword ptr [bp - 0x24], eax
6:5200  c45edc               les bx, ptr [bp - 0x24]
6:5203  66268b4704           mov eax, dword ptr es:[bx + 4]
6:5208  668946d8             mov dword ptr [bp - 0x28], eax
6:520C  66ff76f8             push dword ptr [bp - 8]
6:5210  6650                 push eax
6:5212  8d4ee6               lea cx, [bp - 0x1a]
6:5215  16                   push ss
6:5216  51                   push cx
6:5217  666800006f00         push 0x6f0000
6:521D  6a00                 push 0
6:521F  8d96b4fe             lea dx, [bp - 0x14c]
6:5223  16                   push ss
6:5224  52                   push dx
6:5225  90                   nop
6:5226  0e                   push cs
6:5227  e8c635               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:522A  8d86b4fe             lea ax, [bp - 0x14c]
6:522E  16                   push ss
6:522F  50                   push ax
6:5230  66ff364857           push dword ptr [0x5748]  ; g_sim
6:5235  9a5a837a50           lcall 0x507a, 0x835a  ; Sim::enqueue@s7:835A
6:523A  8d46e6               lea ax, [bp - 0x1a]
6:523D  16                   push ss
6:523E  50                   push ax
6:523F  66ff7606             push dword ptr [bp + 6]
6:5243  90                   nop
6:5244  0e                   push cs
6:5245  e8887a               call 0xccd0  ; sub_s6:CCD0
6:5248  c786b4fe9a38         mov word ptr [bp - 0x14c], 0x389a
6:524E  c786b6fec94d         mov word ptr [bp - 0x14a], 0x4dc9  ; SEGMENT s2:0000
6:5254  5e                   pop si
6:5255  5f                   pop di
6:5256  c9                   leave
6:5257  ca0600               retf 6

; ---------------- sub_s6:525A size=142 callers=0
6:525A  c8040000             enter 4, 0
6:525E  66ff7606             push dword ptr [bp + 6]
6:5262  90                   nop
6:5263  0e                   push cs
6:5264  e8b161               call 0xb418  ; sub_s6:B418
6:5267  f6460a01             test byte ptr [bp + 0xa], 1
6:526B  7409                 je 0x5276
6:526D  66ff7606             push dword ptr [bp + 6]
6:5271  9ace176450           lcall 0x5064, 0x17ce  ; operator_delete@s1:17CE
loc_5276:
6:5276  8b4606               mov ax, word ptr [bp + 6]
6:5279  8b5608               mov dx, word ptr [bp + 8]
6:527C  c9                   leave
6:527D  ca0600               retf 6
6:5280  db 5a 52 86 52 56 bb 8e 52 8e 17 7b 51 ec b5 92 52
6:5290  db 1a b8 96 52 1c bc 9a 52 28 51 9e 52 90 bc a2 52
6:52A0  db 7e bc a6 52 14 b5 aa 52 2a be ae 52 16 bf b2 52
6:52B0  db 24 51 b6 52 1e bf ba 52 9e be be 52 22 bf c2 52
6:52C0  db f0 bb c6 52 02 bc ca 52 a8 b5 ce 52 ca b5 d2 52
6:52D0  db e6 b4 d6 52 ec b4 da 52 6e b4 de 52 4a c6 e2 52
6:52E0  db 22 c5 e6 52 d2 ce 19 51

; ---------------- sub_s6:52E8 FAR size=34 callers=1
6:52E8  55                   push bp
6:52E9  8bec                 mov bp, sp
6:52EB  66ff7606             push dword ptr [bp + 6]
6:52EF  90                   nop
6:52F0  0e                   push cs
6:52F1  e86060               call 0xb354  ; Building::Building()@s6:B354
6:52F4  c45e06               les bx, ptr [bp + 6]
6:52F7  26c7075e53           mov word ptr es:[bx], 0x535e
6:52FC  26c747028252         mov word ptr es:[bx + 2], 0x5282  ; SEGMENT s6:0000
6:5302  8bc3                 mov ax, bx
6:5304  8cc2                 mov dx, es
6:5306  c9                   leave
6:5307  ca0400               retf 4

; ---------------- sub_s6:530A FAR size=42 callers=1
6:530A  55                   push bp
6:530B  8bec                 mov bp, sp
6:530D  66ff760c             push dword ptr [bp + 0xc]
6:5311  66ff7608             push dword ptr [bp + 8]
6:5315  ff7606               push word ptr [bp + 6]
6:5318  90                   nop
6:5319  0e                   push cs
6:531A  e88160               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:531D  c45e06               les bx, ptr [bp + 6]
6:5320  26c7075e53           mov word ptr es:[bx], 0x535e
6:5325  26c747020053         mov word ptr es:[bx + 2], 0x5300  ; SEGMENT s6:0000
6:532B  8bc3                 mov ax, bx
6:532D  8cc2                 mov dx, es
6:532F  c9                   leave
6:5330  ca0a00               retf 0xa
6:5333  db 00

; ---------------- sub_s6:5334 FAR size=4 callers=0
6:5334  ca0400               retf 4
6:5337  db 00

; ---------------- sub_s6:5338 FAR size=142 callers=0
6:5338  c8040000             enter 4, 0
6:533C  66ff7606             push dword ptr [bp + 6]
6:5340  90                   nop
6:5341  0e                   push cs
6:5342  e8d360               call 0xb418  ; sub_s6:B418
6:5345  f6460a01             test byte ptr [bp + 0xa], 1
6:5349  7409                 je 0x5354
6:534B  66ff7606             push dword ptr [bp + 6]
6:534F  9ace177452           lcall 0x5274, 0x17ce  ; operator_delete@s1:17CE
loc_5354:
6:5354  8b4606               mov ax, word ptr [bp + 6]
6:5357  8b5608               mov dx, word ptr [bp + 8]
6:535A  c9                   leave
6:535B  ca0600               retf 6
6:535E  db 38 53 64 53 56 bb 6c 53 8e 17 8a 52 ec b5 70 53
6:536E  db 1a b8 74 53 1c bc 78 53 38 bd 7c 53 90 bc 80 53
6:537E  db 7e bc 84 53 14 b5 88 53 2a be 8c 53 16 bf 90 53
6:538E  db 34 53 94 53 1e bf 98 53 9e be 9c 53 22 bf a0 53
6:539E  db f0 bb a4 53 02 bc a8 53 a8 b5 ac 53 ca b5 b0 53
6:53AE  db e6 b4 b4 53 ec b4 b8 53 6e b4 bc 53 4a c6 c0 53
6:53BE  db 22 c5 c4 53 d2 ce 29 53

; ---------------- sub_s6:53C6 FAR size=34 callers=1
6:53C6  55                   push bp
6:53C7  8bec                 mov bp, sp
6:53C9  66ff7606             push dword ptr [bp + 6]
6:53CD  90                   nop
6:53CE  0e                   push cs
6:53CF  e8825f               call 0xb354  ; Building::Building()@s6:B354
6:53D2  c45e06               les bx, ptr [bp + 6]
6:53D5  26c707bc54           mov word ptr es:[bx], 0x54bc
6:53DA  26c747026053         mov word ptr es:[bx + 2], 0x5360  ; SEGMENT s6:0000
6:53E0  8bc3                 mov ax, bx
6:53E2  8cc2                 mov dx, es
6:53E4  c9                   leave
6:53E5  ca0400               retf 4

; ---------------- sub_s6:53E8 FAR size=42 callers=1
6:53E8  55                   push bp
6:53E9  8bec                 mov bp, sp
6:53EB  66ff760c             push dword ptr [bp + 0xc]
6:53EF  66ff7608             push dword ptr [bp + 8]
6:53F3  ff7606               push word ptr [bp + 6]
6:53F6  90                   nop
6:53F7  0e                   push cs
6:53F8  e8a35f               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:53FB  c45e06               les bx, ptr [bp + 6]
6:53FE  26c707bc54           mov word ptr es:[bx], 0x54bc
6:5403  26c74702de53         mov word ptr es:[bx + 2], 0x53de  ; SEGMENT s6:0000
6:5409  8bc3                 mov ax, bx
6:540B  8cc2                 mov dx, es
6:540D  c9                   leave
6:540E  ca0a00               retf 0xa
6:5411  db 00

; ---------------- sub_s6:5412 FAR size=132 callers=0
6:5412  c80c0000             enter 0xc, 0
6:5416  c45e06               les bx, ptr [bp + 6]
6:5419  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:541E  7572                 jne 0x5492
6:5420  06                   push es
6:5421  53                   push bx
6:5422  90                   nop
6:5423  0e                   push cs
6:5424  e8cb60               call 0xb4f2  ; sub_s6:B4F2
6:5427  8946fc               mov word ptr [bp - 4], ax
6:542A  8956fe               mov word ptr [bp - 2], dx
6:542D  c45efc               les bx, ptr [bp - 4]
6:5430  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:543A  744b                 je 0x5487
6:543C  c45e06               les bx, ptr [bp + 6]
6:543F  6626817f1c02000008   cmp dword ptr es:[bx + 0x1c], 0x8000002
6:5448  7506                 jne 0x5450
6:544A  6a06                 push 6
6:544C  06                   push es
6:544D  53                   push bx
6:544E  eb3d                 jmp 0x548d
loc_5450:
6:5450  06                   push es
6:5451  53                   push bx
6:5452  26c41f               les bx, ptr es:[bx]
6:5455  26ff5f64             lcall es:[bx + 0x64]
6:5459  0bc0                 or ax, ax
6:545B  7435                 je 0x5492
6:545D  666a01               push 1
6:5460  66ff7606             push dword ptr [bp + 6]
6:5464  90                   nop
6:5465  0e                   push cs
6:5466  e8876c               call 0xc0f0  ; sub_s6:C0F0
6:5469  0bc0                 or ax, ax
6:546B  7505                 jne 0x5472
6:546D  6a06                 push 6
6:546F  eb18                 jmp 0x5489
6:5471  db 90
loc_5472:
6:5472  66ff7606             push dword ptr [bp + 6]
6:5476  90                   nop
6:5477  0e                   push cs
6:5478  e8d774               call 0xc952  ; sub_s6:C952
6:547B  666a01               push 1
6:547E  66ff7606             push dword ptr [bp + 6]
6:5482  90                   nop
6:5483  0e                   push cs
6:5484  e8836b               call 0xc00a  ; sub_s6:C00A
loc_5487:
6:5487  6a05                 push 5
loc_5489:
6:5489  66ff7606             push dword ptr [bp + 6]
loc_548D:
6:548D  90                   nop
6:548E  0e                   push cs
6:548F  e81a69               call 0xbdac  ; sub_s6:BDAC
loc_5492:
6:5492  c9                   leave
6:5493  ca0400               retf 4

; ---------------- sub_s6:5496 size=142 callers=0
6:5496  c8040000             enter 4, 0
6:549A  66ff7606             push dword ptr [bp + 6]
6:549E  90                   nop
6:549F  0e                   push cs
6:54A0  e8755f               call 0xb418  ; sub_s6:B418
6:54A3  f6460a01             test byte ptr [bp + 0xa], 1
6:54A7  7409                 je 0x54b2
6:54A9  66ff7606             push dword ptr [bp + 6]
6:54AD  9ace175253           lcall 0x5352, 0x17ce  ; operator_delete@s1:17CE
loc_54B2:
6:54B2  8b4606               mov ax, word ptr [bp + 6]
6:54B5  8b5608               mov dx, word ptr [bp + 8]
6:54B8  c9                   leave
6:54B9  ca0600               retf 6
6:54BC  db 96 54 c2 54 56 bb ca 54 8e 17 68 53 ec b5 ce 54
6:54CC  db 1a b8 d2 54 1c bc d6 54 38 bd da 54 90 bc de 54
6:54DC  db 7e bc e2 54 14 b5 e6 54 12 54 ea 54 16 bf ee 54
6:54EC  db 1a bf f2 54 1e bf f6 54 9e be fa 54 22 bf fe 54
6:54FC  db f0 bb 02 55 02 bc 06 55 a8 b5 0a 55 ca b5 0e 55
6:550C  db e6 b4 12 55 ec b4 16 55 6e b4 1a 55 4a c6 1e 55
6:551C  db 22 c5 22 55 d2 ce 07 54

; ---------------- sub_s6:5524 FAR size=34 callers=1
6:5524  55                   push bp
6:5525  8bec                 mov bp, sp
6:5527  66ff7606             push dword ptr [bp + 6]
6:552B  90                   nop
6:552C  0e                   push cs
6:552D  e838ab               call 0x68  ; sub_s6:0068
6:5530  c45e06               les bx, ptr [bp + 6]
6:5533  26c707c855           mov word ptr es:[bx], 0x55c8
6:5538  26c74702be54         mov word ptr es:[bx + 2], 0x54be  ; SEGMENT s6:0000
6:553E  8bc3                 mov ax, bx
6:5540  8cc2                 mov dx, es
6:5542  c9                   leave
6:5543  ca0400               retf 4

; ---------------- sub_s6:5546 FAR size=42 callers=1
6:5546  55                   push bp
6:5547  8bec                 mov bp, sp
6:5549  66ff760c             push dword ptr [bp + 0xc]
6:554D  66ff7608             push dword ptr [bp + 8]
6:5551  ff7606               push word ptr [bp + 6]
6:5554  90                   nop
6:5555  0e                   push cs
6:5556  e873ab               call 0xcc  ; sub_s6:00CC
6:5559  c45e06               les bx, ptr [bp + 6]
6:555C  26c707c855           mov word ptr es:[bx], 0x55c8
6:5561  26c747023c55         mov word ptr es:[bx + 2], 0x553c  ; SEGMENT s6:0000
6:5567  8bc3                 mov ax, bx
6:5569  8cc2                 mov dx, es
6:556B  c9                   leave
6:556C  ca0a00               retf 0xa
6:556F  db 00

; ---------------- sub_s6:5570 FAR size=50 callers=0
6:5570  c8040000             enter 4, 0
6:5574  66ff7606             push dword ptr [bp + 6]
6:5578  90                   nop
6:5579  0e                   push cs
6:557A  e8d3af               call 0x550  ; sub_s6:0550
6:557D  c45e06               les bx, ptr [bp + 6]
6:5580  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:5585  7516                 jne 0x559d
6:5587  666800000400         push 0x40000
6:558D  6a01                 push 1
6:558F  06                   push es
6:5590  53                   push bx
6:5591  90                   nop
6:5592  0e                   push cs
6:5593  e8f85f               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:5596  52                   push dx
6:5597  50                   push ax
6:5598  9a507cc654           lcall 0x54c6, 0x7c50  ; sub_s7:7C50
loc_559D:
6:559D  c9                   leave
6:559E  ca0400               retf 4
6:55A1  db 00

; ---------------- sub_s6:55A2 FAR size=142 callers=0
6:55A2  c8040000             enter 4, 0
6:55A6  66ff7606             push dword ptr [bp + 6]
6:55AA  90                   nop
6:55AB  0e                   push cs
6:55AC  e889ab               call 0x138  ; sub_s6:0138
6:55AF  f6460a01             test byte ptr [bp + 0xa], 1
6:55B3  7409                 je 0x55be
6:55B5  66ff7606             push dword ptr [bp + 6]
6:55B9  9ace17b054           lcall 0x54b0, 0x17ce  ; operator_delete@s1:17CE
loc_55BE:
6:55BE  8b4606               mov ax, word ptr [bp + 6]
6:55C1  8b5608               mov dx, word ptr [bp + 8]
6:55C4  c9                   leave
6:55C5  ca0600               retf 6
6:55C8  db a2 55 ce 55 56 bb d6 55 8e 17 9b 55 34 02 da 55
6:55D8  db 74 03 de 55 1c bc e2 55 38 bd e6 55 90 bc ea 55
6:55E8  db 7e bc ee 55 14 b5 f2 55 ec 01 f6 55 16 bf fa 55
6:55F8  db 82 05 fe 55 1e bf 02 56 70 55 06 56 22 bf 0a 56
6:5608  db ee 04 0e 56 02 bc 12 56 a8 b5 16 56 ca b5 1a 56
6:5618  db e6 b4 1e 56 ec b4 22 56 76 01 26 56 4a c6 2a 56
6:5628  db 22 c5 2e 56 d2 ce 65 55

; ---------------- sub_s6:5630 FAR size=34 callers=1
6:5630  55                   push bp
6:5631  8bec                 mov bp, sp
6:5633  66ff7606             push dword ptr [bp + 6]
6:5637  90                   nop
6:5638  0e                   push cs
6:5639  e8185d               call 0xb354  ; Building::Building()@s6:B354
6:563C  c45e06               les bx, ptr [bp + 6]
6:563F  26c707ac56           mov word ptr es:[bx], 0x56ac
6:5644  26c74702ca55         mov word ptr es:[bx + 2], 0x55ca  ; SEGMENT s6:0000
6:564A  8bc3                 mov ax, bx
6:564C  8cc2                 mov dx, es
6:564E  c9                   leave
6:564F  ca0400               retf 4

; ---------------- sub_s6:5652 FAR size=42 callers=1
6:5652  55                   push bp
6:5653  8bec                 mov bp, sp
6:5655  66ff760c             push dword ptr [bp + 0xc]
6:5659  66ff7608             push dword ptr [bp + 8]
6:565D  ff7606               push word ptr [bp + 6]
6:5660  90                   nop
6:5661  0e                   push cs
6:5662  e8395d               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:5665  c45e06               les bx, ptr [bp + 6]
6:5668  26c707ac56           mov word ptr es:[bx], 0x56ac
6:566D  26c747024856         mov word ptr es:[bx + 2], 0x5648  ; SEGMENT s6:0000
6:5673  8bc3                 mov ax, bx
6:5675  8cc2                 mov dx, es
6:5677  c9                   leave
6:5678  ca0a00               retf 0xa
6:567B  db 00

; ---------------- sub_s6:567C FAR size=6 callers=0
6:567C  33c0                 xor ax, ax
6:567E  ca1000               retf 0x10
6:5681  db 00

; ---------------- sub_s6:5682 FAR size=4 callers=0
6:5682  ca0600               retf 6
6:5685  db 00

; ---------------- sub_s6:5686 FAR size=142 callers=0
6:5686  c8040000             enter 4, 0
6:568A  66ff7606             push dword ptr [bp + 6]
6:568E  90                   nop
6:568F  0e                   push cs
6:5690  e8855d               call 0xb418  ; sub_s6:B418
6:5693  f6460a01             test byte ptr [bp + 0xa], 1
6:5697  7409                 je 0x56a2
6:5699  66ff7606             push dword ptr [bp + 6]
6:569D  9ace17bc55           lcall 0x55bc, 0x17ce  ; operator_delete@s1:17CE
loc_56A2:
6:56A2  8b4606               mov ax, word ptr [bp + 6]
6:56A5  8b5608               mov dx, word ptr [bp + 8]
6:56A8  c9                   leave
6:56A9  ca0600               retf 6
6:56AC  db 86 56 b2 56 56 bb ba 56 8e 17 d2 55 ec b5 be 56
6:56BC  db 1a b8 c2 56 1c bc c6 56 38 bd ca 56 7c 56 ce 56
6:56CC  db 7e bc d2 56 14 b5 d6 56 2a be da 56 16 bf de 56
6:56DC  db 1a bf e2 56 82 56 e6 56 9e be ea 56 22 bf ee 56
6:56EC  db f0 bb f2 56 02 bc f6 56 a8 b5 fa 56 ca b5 fe 56
6:56FC  db e6 b4 02 57 ec b4 06 57 6e b4 0a 57 4a c6 0e 57
6:570C  db 22 c5 12 57 d2 ce 71 56

; ---------------- sub_s6:5714 FAR size=4 callers=0
6:5714  ca0400               retf 4
6:5717  db 00

; ---------------- sub_s6:5718 FAR size=142 callers=0
6:5718  c8040000             enter 4, 0
6:571C  66ff7606             push dword ptr [bp + 6]
6:5720  90                   nop
6:5721  0e                   push cs
6:5722  e8f35c               call 0xb418  ; sub_s6:B418
6:5725  f6460a01             test byte ptr [bp + 0xa], 1
6:5729  7409                 je 0x5734
6:572B  66ff7606             push dword ptr [bp + 6]
6:572F  9ace17a056           lcall 0x56a0, 0x17ce  ; operator_delete@s1:17CE
loc_5734:
6:5734  8b4606               mov ax, word ptr [bp + 6]
6:5737  8b5608               mov dx, word ptr [bp + 8]
6:573A  c9                   leave
6:573B  ca0600               retf 6
6:573E  db 18 57 44 57 56 bb 4c 57 8e 17 b6 56 ec b5 50 57
6:574E  db 1a b8 54 57 1c bc 58 57 38 bd 5c 57 90 bc 60 57
6:575E  db 7e bc 64 57 14 b5 68 57 2a be 6c 57 16 bf 70 57
6:576E  db 14 57 74 57 1e bf 78 57 9e be 7c 57 22 bf 80 57
6:577E  db f0 bb 84 57 02 bc 88 57 a8 b5 8c 57 ca b5 90 57
6:578E  db e6 b4 94 57 ec b4 98 57 6e b4 9c 57 4a c6 a0 57
6:579E  db 22 c5 a4 57 d2 ce ae 56

; ---------------- sub_s6:57A6 FAR size=34 callers=1
6:57A6  55                   push bp
6:57A7  8bec                 mov bp, sp
6:57A9  66ff7606             push dword ptr [bp + 6]
6:57AD  90                   nop
6:57AE  0e                   push cs
6:57AF  e8a25b               call 0xb354  ; Building::Building()@s6:B354
6:57B2  c45e06               les bx, ptr [bp + 6]
6:57B5  26c7071c58           mov word ptr es:[bx], 0x581c
6:57BA  26c747024057         mov word ptr es:[bx + 2], 0x5740  ; SEGMENT s6:0000
6:57C0  8bc3                 mov ax, bx
6:57C2  8cc2                 mov dx, es
6:57C4  c9                   leave
6:57C5  ca0400               retf 4

; ---------------- sub_s6:57C8 FAR size=42 callers=1
6:57C8  55                   push bp
6:57C9  8bec                 mov bp, sp
6:57CB  66ff760c             push dword ptr [bp + 0xc]
6:57CF  66ff7608             push dword ptr [bp + 8]
6:57D3  ff7606               push word ptr [bp + 6]
6:57D6  90                   nop
6:57D7  0e                   push cs
6:57D8  e8c35b               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:57DB  c45e06               les bx, ptr [bp + 6]
6:57DE  26c7071c58           mov word ptr es:[bx], 0x581c
6:57E3  26c74702be57         mov word ptr es:[bx + 2], 0x57be  ; SEGMENT s6:0000
6:57E9  8bc3                 mov ax, bx
6:57EB  8cc2                 mov dx, es
6:57ED  c9                   leave
6:57EE  ca0a00               retf 0xa
6:57F1  db 00

; ---------------- sub_s6:57F2 FAR size=4 callers=0
6:57F2  ca0400               retf 4
6:57F5  db 00

; ---------------- sub_s6:57F6 FAR size=142 callers=0
6:57F6  c8040000             enter 4, 0
6:57FA  66ff7606             push dword ptr [bp + 6]
6:57FE  90                   nop
6:57FF  0e                   push cs
6:5800  e8155c               call 0xb418  ; sub_s6:B418
6:5803  f6460a01             test byte ptr [bp + 0xa], 1
6:5807  7409                 je 0x5812
6:5809  66ff7606             push dword ptr [bp + 6]
6:580D  9ace173257           lcall 0x5732, 0x17ce  ; operator_delete@s1:17CE
loc_5812:
6:5812  8b4606               mov ax, word ptr [bp + 6]
6:5815  8b5608               mov dx, word ptr [bp + 8]
6:5818  c9                   leave
6:5819  ca0600               retf 6
6:581C  db f6 57 22 58 56 bb 2a 58 8e 17 48 57 ec b5 2e 58
6:582C  db 1a b8 32 58 1c bc 36 58 38 bd 3a 58 90 bc 3e 58
6:583C  db 7e bc 42 58 14 b5 46 58 2a be 4a 58 16 bf 4e 58
6:584C  db f2 57 52 58 1e bf 56 58 9e be 5a 58 22 bf 5e 58
6:585C  db f0 bb 62 58 02 bc 66 58 a8 b5 6a 58 ca b5 6e 58
6:586C  db e6 b4 72 58 ec b4 76 58 6e b4 7a 58 4a c6 7e 58
6:587C  db 22 c5 82 58 d2 ce e7 57

; ---------------- sub_s6:5884 FAR size=34 callers=1
6:5884  55                   push bp
6:5885  8bec                 mov bp, sp
6:5887  66ff7606             push dword ptr [bp + 6]
6:588B  90                   nop
6:588C  0e                   push cs
6:588D  e8c45a               call 0xb354  ; Building::Building()@s6:B354
6:5890  c45e06               les bx, ptr [bp + 6]
6:5893  26c707fe58           mov word ptr es:[bx], 0x58fe
6:5898  26c747021e58         mov word ptr es:[bx + 2], 0x581e  ; SEGMENT s6:0000
6:589E  8bc3                 mov ax, bx
6:58A0  8cc2                 mov dx, es
6:58A2  c9                   leave
6:58A3  ca0400               retf 4

; ---------------- sub_s6:58A6 FAR size=42 callers=1
6:58A6  55                   push bp
6:58A7  8bec                 mov bp, sp
6:58A9  66ff760c             push dword ptr [bp + 0xc]
6:58AD  66ff7608             push dword ptr [bp + 8]
6:58B1  ff7606               push word ptr [bp + 6]
6:58B4  90                   nop
6:58B5  0e                   push cs
6:58B6  e8e55a               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:58B9  c45e06               les bx, ptr [bp + 6]
6:58BC  26c707fe58           mov word ptr es:[bx], 0x58fe
6:58C1  26c747029c58         mov word ptr es:[bx + 2], 0x589c  ; SEGMENT s6:0000
6:58C7  8bc3                 mov ax, bx
6:58C9  8cc2                 mov dx, es
6:58CB  c9                   leave
6:58CC  ca0a00               retf 0xa
6:58CF  db 00

; ---------------- sub_s6:58D0 FAR size=4 callers=0
6:58D0  ca0400               retf 4
6:58D3  db 00

; ---------------- sub_s6:58D4 FAR size=4 callers=0
6:58D4  ca0400               retf 4
6:58D7  db 00

; ---------------- sub_s6:58D8 FAR size=142 callers=0
6:58D8  c8040000             enter 4, 0
6:58DC  66ff7606             push dword ptr [bp + 6]
6:58E0  90                   nop
6:58E1  0e                   push cs
6:58E2  e8335b               call 0xb418  ; sub_s6:B418
6:58E5  f6460a01             test byte ptr [bp + 0xa], 1
6:58E9  7409                 je 0x58f4
6:58EB  66ff7606             push dword ptr [bp + 6]
6:58EF  9ace171058           lcall 0x5810, 0x17ce  ; operator_delete@s1:17CE
loc_58F4:
6:58F4  8b4606               mov ax, word ptr [bp + 6]
6:58F7  8b5608               mov dx, word ptr [bp + 8]
6:58FA  c9                   leave
6:58FB  ca0600               retf 6
6:58FE  db d8 58 04 59 56 bb 0c 59 8e 17 26 58 ec b5 10 59
6:590E  db 1a b8 14 59 1c bc 18 59 38 bd 1c 59 90 bc 20 59
6:591E  db 7e bc 24 59 14 b5 28 59 2a be 2c 59 d0 58 30 59
6:592E  db d4 58 34 59 1e bf 38 59 9e be 3c 59 22 bf 40 59
6:593E  db f0 bb 44 59 02 bc 48 59 a8 b5 4c 59 ca b5 50 59
6:594E  db e6 b4 54 59 ec b4 58 59 6e b4 5c 59 4a c6 60 59
6:595E  db 22 c5 64 59 d2 ce c5 58

; ---------------- sub_s6:5966 FAR size=34 callers=1
6:5966  55                   push bp
6:5967  8bec                 mov bp, sp
6:5969  66ff7606             push dword ptr [bp + 6]
6:596D  90                   nop
6:596E  0e                   push cs
6:596F  e8e259               call 0xb354  ; Building::Building()@s6:B354
6:5972  c45e06               les bx, ptr [bp + 6]
6:5975  26c707e059           mov word ptr es:[bx], 0x59e0
6:597A  26c747020059         mov word ptr es:[bx + 2], 0x5900  ; SEGMENT s6:0000
6:5980  8bc3                 mov ax, bx
6:5982  8cc2                 mov dx, es
6:5984  c9                   leave
6:5985  ca0400               retf 4

; ---------------- sub_s6:5988 FAR size=42 callers=1
6:5988  55                   push bp
6:5989  8bec                 mov bp, sp
6:598B  66ff760c             push dword ptr [bp + 0xc]
6:598F  66ff7608             push dword ptr [bp + 8]
6:5993  ff7606               push word ptr [bp + 6]
6:5996  90                   nop
6:5997  0e                   push cs
6:5998  e8035a               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:599B  c45e06               les bx, ptr [bp + 6]
6:599E  26c707e059           mov word ptr es:[bx], 0x59e0
6:59A3  26c747027e59         mov word ptr es:[bx + 2], 0x597e  ; SEGMENT s6:0000
6:59A9  8bc3                 mov ax, bx
6:59AB  8cc2                 mov dx, es
6:59AD  c9                   leave
6:59AE  ca0a00               retf 0xa
6:59B1  db 00

; ---------------- sub_s6:59B2 FAR size=4 callers=0
6:59B2  ca0400               retf 4
6:59B5  db 00

; ---------------- sub_s6:59B6 FAR size=4 callers=0
6:59B6  ca0400               retf 4
6:59B9  db 00

; ---------------- sub_s6:59BA FAR size=142 callers=0
6:59BA  c8040000             enter 4, 0
6:59BE  66ff7606             push dword ptr [bp + 6]
6:59C2  90                   nop
6:59C3  0e                   push cs
6:59C4  e8515a               call 0xb418  ; sub_s6:B418
6:59C7  f6460a01             test byte ptr [bp + 0xa], 1
6:59CB  7409                 je 0x59d6
6:59CD  66ff7606             push dword ptr [bp + 6]
6:59D1  9ace17f258           lcall 0x58f2, 0x17ce  ; operator_delete@s1:17CE
loc_59D6:
6:59D6  8b4606               mov ax, word ptr [bp + 6]
6:59D9  8b5608               mov dx, word ptr [bp + 8]
6:59DC  c9                   leave
6:59DD  ca0600               retf 6
6:59E0  db ba 59 e6 59 56 bb ee 59 8e 17 08 59 ec b5 f2 59
6:59F0  db 1a b8 f6 59 1c bc fa 59 38 bd fe 59 90 bc 02 5a
6:5A00  db 7e bc 06 5a 14 b5 0a 5a 2a be 0e 5a b2 59 12 5a
6:5A10  db b6 59 16 5a 1e bf 1a 5a 9e be 1e 5a 22 bf 22 5a
6:5A20  db f0 bb 26 5a 02 bc 2a 5a a8 b5 2e 5a ca b5 32 5a
6:5A30  db e6 b4 36 5a ec b4 3a 5a 6e b4 3e 5a 4a c6 42 5a
6:5A40  db 22 c5 46 5a d2 ce a7 59

; ---------------- sub_s6:5A48 FAR size=34 callers=1
6:5A48  55                   push bp
6:5A49  8bec                 mov bp, sp
6:5A4B  66ff7606             push dword ptr [bp + 6]
6:5A4F  90                   nop
6:5A50  0e                   push cs
6:5A51  e80059               call 0xb354  ; Building::Building()@s6:B354
6:5A54  c45e06               les bx, ptr [bp + 6]
6:5A57  26c707ec5b           mov word ptr es:[bx], 0x5bec  ; 'thisLo'
6:5A5C  26c74702e259         mov word ptr es:[bx + 2], 0x59e2  ; SEGMENT s6:0000
6:5A62  8bc3                 mov ax, bx
6:5A64  8cc2                 mov dx, es
6:5A66  c9                   leave
6:5A67  ca0400               retf 4

; ---------------- sub_s6:5A6A FAR size=42 callers=1
6:5A6A  55                   push bp
6:5A6B  8bec                 mov bp, sp
6:5A6D  66ff760c             push dword ptr [bp + 0xc]
6:5A71  66ff7608             push dword ptr [bp + 8]
6:5A75  ff7606               push word ptr [bp + 6]
6:5A78  90                   nop
6:5A79  0e                   push cs
6:5A7A  e82159               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:5A7D  c45e06               les bx, ptr [bp + 6]
6:5A80  26c707ec5b           mov word ptr es:[bx], 0x5bec  ; 'thisLo'
6:5A85  26c74702605a         mov word ptr es:[bx + 2], 0x5a60  ; SEGMENT s6:0000
6:5A8B  8bc3                 mov ax, bx
6:5A8D  8cc2                 mov dx, es
6:5A8F  c9                   leave
6:5A90  ca0a00               retf 0xa
6:5A93  db 00

; ---------------- sub_s6:5A94 FAR size=174 callers=1
6:5A94  c81c0000             enter 0x1c, 0
6:5A98  c45e0a               les bx, ptr [bp + 0xa]
6:5A9B  06                   push es
6:5A9C  53                   push bx
6:5A9D  26c41f               les bx, ptr es:[bx]
6:5AA0  26ff5f10             lcall es:[bx + 0x10]
6:5AA4  8946fc               mov word ptr [bp - 4], ax
6:5AA7  8956fe               mov word ptr [bp - 2], dx
6:5AAA  0bd0                 or dx, ax
6:5AAC  7508                 jne 0x5ab6
6:5AAE  b80100               mov ax, 1
6:5AB1  c9                   leave
6:5AB2  ca0800               retf 8
6:5AB5  db 90
loc_5AB6:
6:5AB6  c746fa0100           mov word ptr [bp - 6], 1
6:5ABB  8d46f8               lea ax, [bp - 8]
6:5ABE  16                   push ss
6:5ABF  50                   push ax
6:5AC0  9aaebce95a           lcall 0x5ae9, 0xbcae  ; sub_s7:BCAE
6:5AC5  66c746f400000000     mov dword ptr [bp - 0xc], 0
6:5ACD  eb05                 jmp 0x5ad4
6:5ACF  db 90
loc_5AD0:
6:5AD0  66ff46f4             inc dword ptr [bp - 0xc]
loc_5AD4:
6:5AD4  668b46fc             mov eax, dword ptr [bp - 4]
6:5AD8  663946f4             cmp dword ptr [bp - 0xc], eax
6:5ADC  735d                 jae 0x5b3b
6:5ADE  66ff76f4             push dword ptr [bp - 0xc]
6:5AE2  66ff760a             push dword ptr [bp + 0xa]
6:5AE6  9a581d065b           lcall 0x5b06, 0x1d58  ; sub_s7:1D58
6:5AEB  8946f0               mov word ptr [bp - 0x10], ax
6:5AEE  8956f2               mov word ptr [bp - 0xe], dx
6:5AF1  52                   push dx
6:5AF2  50                   push ax
6:5AF3  66ff7606             push dword ptr [bp + 6]
6:5AF7  90                   nop
6:5AF8  0e                   push cs
6:5AF9  e8925a               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:5AFC  52                   push dx
6:5AFD  50                   push ax
6:5AFE  8d46f8               lea ax, [bp - 8]
6:5B01  16                   push ss
6:5B02  50                   push ax
6:5B03  9a74bd175b           lcall 0x5b17, 0xbd74  ; sub_s7:BD74
6:5B08  8946ee               mov word ptr [bp - 0x12], ax
6:5B0B  3d0400               cmp ax, 4
6:5B0E  7fc0                 jg 0x5ad0
6:5B10  66ff76f0             push dword ptr [bp - 0x10]
6:5B14  9aa873ea59           lcall 0x59ea, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:5B19  8946ea               mov word ptr [bp - 0x16], ax
6:5B1C  8956ec               mov word ptr [bp - 0x14], dx
6:5B1F  c45eea               les bx, ptr [bp - 0x16]
6:5B22  268b4720             mov ax, word ptr es:[bx + 0x20]
6:5B26  8946e8               mov word ptr [bp - 0x18], ax
6:5B29  3d0200               cmp ax, 2
6:5B2C  7503                 jne 0x5b31
6:5B2E  8946fa               mov word ptr [bp - 6], ax
loc_5B31:
6:5B31  3d0100               cmp ax, 1
6:5B34  7505                 jne 0x5b3b
6:5B36  c746fa0300           mov word ptr [bp - 6], 3
loc_5B3B:
6:5B3B  8b46fa               mov ax, word ptr [bp - 6]
6:5B3E  c9                   leave
6:5B3F  ca0800               retf 8

; ---------------- sub_s6:5B42 size=132 callers=0
6:5B42  c80c0000             enter 0xc, 0
6:5B46  c45e06               les bx, ptr [bp + 6]
6:5B49  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:5B4E  7572                 jne 0x5bc2
6:5B50  06                   push es
6:5B51  53                   push bx
6:5B52  90                   nop
6:5B53  0e                   push cs
6:5B54  e89b59               call 0xb4f2  ; sub_s6:B4F2
6:5B57  8946fc               mov word ptr [bp - 4], ax
6:5B5A  8956fe               mov word ptr [bp - 2], dx
6:5B5D  c45efc               les bx, ptr [bp - 4]
6:5B60  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:5B6A  744b                 je 0x5bb7
6:5B6C  c45e06               les bx, ptr [bp + 6]
6:5B6F  6626817f1c02000008   cmp dword ptr es:[bx + 0x1c], 0x8000002
6:5B78  7506                 jne 0x5b80
6:5B7A  6a06                 push 6
6:5B7C  06                   push es
6:5B7D  53                   push bx
6:5B7E  eb3d                 jmp 0x5bbd
loc_5B80:
6:5B80  06                   push es
6:5B81  53                   push bx
6:5B82  26c41f               les bx, ptr es:[bx]
6:5B85  26ff5f64             lcall es:[bx + 0x64]
6:5B89  0bc0                 or ax, ax
6:5B8B  7435                 je 0x5bc2
6:5B8D  666a02               push 2
6:5B90  66ff7606             push dword ptr [bp + 6]
6:5B94  90                   nop
6:5B95  0e                   push cs
6:5B96  e85765               call 0xc0f0  ; sub_s6:C0F0
6:5B99  0bc0                 or ax, ax
6:5B9B  7505                 jne 0x5ba2
6:5B9D  6a06                 push 6
6:5B9F  eb18                 jmp 0x5bb9
6:5BA1  db 90
loc_5BA2:
6:5BA2  66ff7606             push dword ptr [bp + 6]
6:5BA6  90                   nop
6:5BA7  0e                   push cs
6:5BA8  e8a76d               call 0xc952  ; sub_s6:C952
6:5BAB  666a02               push 2
6:5BAE  66ff7606             push dword ptr [bp + 6]
6:5BB2  90                   nop
6:5BB3  0e                   push cs
6:5BB4  e85364               call 0xc00a  ; sub_s6:C00A
loc_5BB7:
6:5BB7  6a05                 push 5
loc_5BB9:
6:5BB9  66ff7606             push dword ptr [bp + 6]
loc_5BBD:
6:5BBD  90                   nop
6:5BBE  0e                   push cs
6:5BBF  e8ea61               call 0xbdac  ; sub_s6:BDAC
loc_5BC2:
6:5BC2  c9                   leave
6:5BC3  ca0400               retf 4

; ---------------- sub_s6:5BC6 size=142 callers=0
6:5BC6  c8040000             enter 4, 0
6:5BCA  66ff7606             push dword ptr [bp + 6]
6:5BCE  90                   nop
6:5BCF  0e                   push cs
6:5BD0  e84558               call 0xb418  ; sub_s6:B418
6:5BD3  f6460a01             test byte ptr [bp + 0xa], 1
6:5BD7  7409                 je 0x5be2
6:5BD9  66ff7606             push dword ptr [bp + 6]
6:5BDD  9ace17d459           lcall 0x59d4, 0x17ce  ; operator_delete@s1:17CE
loc_5BE2:
6:5BE2  8b4606               mov ax, word ptr [bp + 6]
6:5BE5  8b5608               mov dx, word ptr [bp + 8]
6:5BE8  c9                   leave
6:5BE9  ca0600               retf 6
6:5BEC  db c6 5b f2 5b 56 bb fa 5b 8e 17 c3 5a ec b5 fe 5b
6:5BFC  db 1a b8 02 5c 1c bc 06 5c 38 bd 0a 5c 90 bc 0e 5c
6:5C0C  db 7e bc 12 5c 14 b5 16 5c 42 5b 1a 5c 16 bf 1e 5c
6:5C1C  db 1a bf 22 5c 1e bf 26 5c 9e be 2a 5c 22 bf 2e 5c
6:5C2C  db f0 bb 32 5c 02 bc 36 5c a8 b5 3a 5c ca b5 3e 5c
6:5C3C  db e6 b4 42 5c ec b4 46 5c 6e b4 4a 5c 4a c6 4e 5c
6:5C4C  db 22 c5 52 5c d2 ce 89 5a

; ---------------- sub_s6:5C54 FAR size=34 callers=1
6:5C54  55                   push bp
6:5C55  8bec                 mov bp, sp
6:5C57  66ff7606             push dword ptr [bp + 6]
6:5C5B  90                   nop
6:5C5C  0e                   push cs
6:5C5D  e8f456               call 0xb354  ; Building::Building()@s6:B354
6:5C60  c45e06               les bx, ptr [bp + 6]
6:5C63  26c7078e5d           mov word ptr es:[bx], 0x5d8e
6:5C68  26c74702ee5b         mov word ptr es:[bx + 2], 0x5bee  ; SEGMENT s6:0000
6:5C6E  8bc3                 mov ax, bx
6:5C70  8cc2                 mov dx, es
6:5C72  c9                   leave
6:5C73  ca0400               retf 4

; ---------------- sub_s6:5C76 FAR size=42 callers=1
6:5C76  55                   push bp
6:5C77  8bec                 mov bp, sp
6:5C79  66ff760c             push dword ptr [bp + 0xc]
6:5C7D  66ff7608             push dword ptr [bp + 8]
6:5C81  ff7606               push word ptr [bp + 6]
6:5C84  90                   nop
6:5C85  0e                   push cs
6:5C86  e81557               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:5C89  c45e06               les bx, ptr [bp + 6]
6:5C8C  26c7078e5d           mov word ptr es:[bx], 0x5d8e
6:5C91  26c747026c5c         mov word ptr es:[bx + 2], 0x5c6c  ; SEGMENT s6:0000
6:5C97  8bc3                 mov ax, bx
6:5C99  8cc2                 mov dx, es
6:5C9B  c9                   leave
6:5C9C  ca0a00               retf 0xa
6:5C9F  db 00

; ---------------- sub_s6:5CA0 FAR size=110 callers=1
6:5CA0  c8440100             enter 0x144, 0
6:5CA4  66ff7606             push dword ptr [bp + 6]
6:5CA8  90                   nop
6:5CA9  0e                   push cs
6:5CAA  e8e158               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:5CAD  8946fc               mov word ptr [bp - 4], ax
6:5CB0  8956fe               mov word ptr [bp - 2], dx
6:5CB3  c45efc               les bx, ptr [bp - 4]
6:5CB6  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:5CBB  668946f8             mov dword ptr [bp - 8], eax
6:5CBF  66ff7606             push dword ptr [bp + 6]
6:5CC3  90                   nop
6:5CC4  0e                   push cs
6:5CC5  e85c5e               call 0xbb24  ; sub_s6:BB24
6:5CC8  52                   push dx
6:5CC9  50                   push ax
6:5CCA  c45ef8               les bx, ptr [bp - 8]
6:5CCD  6626ff7704           push dword ptr es:[bx + 4]
6:5CD2  668b46fc             mov eax, dword ptr [bp - 4]
6:5CD6  050c00               add ax, 0xc
6:5CD9  6650                 push eax
6:5CDB  666800006500         push 0x650000
6:5CE1  6a00                 push 0
6:5CE3  8d86d4fe             lea ax, [bp - 0x12c]
6:5CE7  16                   push ss
6:5CE8  50                   push ax
6:5CE9  90                   nop
6:5CEA  0e                   push cs
6:5CEB  e8022b               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:5CEE  8d86d4fe             lea ax, [bp - 0x12c]
6:5CF2  16                   push ss
6:5CF3  50                   push ax
6:5CF4  66ff364857           push dword ptr [0x5748]  ; g_sim
6:5CF9  9a5a83f65b           lcall 0x5bf6, 0x835a  ; Sim::enqueue@s7:835A
6:5CFE  c786d4fe9a38         mov word ptr [bp - 0x12c], 0x389a
6:5D04  c786d6fec851         mov word ptr [bp - 0x12a], 0x51c8  ; SEGMENT s2:0000
6:5D0A  c9                   leave
6:5D0B  ca0400               retf 4

; ---------------- UGResident::produce@s6:5D0E size=90 callers=0
6:5D0E  c82a0100             enter 0x12a, 0
6:5D12  66ff7606             push dword ptr [bp + 6]
6:5D16  90                   nop
6:5D17  0e                   push cs
6:5D18  e87358               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:5D1B  8946fc               mov word ptr [bp - 4], ax
6:5D1E  8956fe               mov word ptr [bp - 2], dx
6:5D21  c45efc               les bx, ptr [bp - 4]
6:5D24  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:5D29  668946f8             mov dword ptr [bp - 8], eax
6:5D2D  c45ef8               les bx, ptr [bp - 8]
6:5D30  66268b4704           mov eax, dword ptr es:[bx + 4]
6:5D35  668946f4             mov dword ptr [bp - 0xc], eax
6:5D39  6650                 push eax
6:5D3B  6a01                 push 1
6:5D3D  8d86e6fe             lea ax, [bp - 0x11a]
6:5D41  16                   push ss
6:5D42  50                   push ax
6:5D43  90                   nop
6:5D44  0e                   push cs
6:5D45  e8960b               call 0x68de  ; SCAddSpew@s6:68DE
6:5D48  8d86e6fe             lea ax, [bp - 0x11a]
6:5D4C  16                   push ss
6:5D4D  50                   push ax
6:5D4E  66ff364857           push dword ptr [0x5748]  ; g_sim
6:5D53  9a5a83fc5c           lcall 0x5cfc, 0x835a  ; Sim::enqueue@s7:835A
6:5D58  c786e6fe9a38         mov word ptr [bp - 0x11a], 0x389a
6:5D5E  c786e8fe085d         mov word ptr [bp - 0x118], 0x5d08  ; SEGMENT s2:0000
6:5D64  c9                   leave
6:5D65  ca0400               retf 4

; ---------------- sub_s6:5D68 size=142 callers=0
6:5D68  c8040000             enter 4, 0
6:5D6C  66ff7606             push dword ptr [bp + 6]
6:5D70  90                   nop
6:5D71  0e                   push cs
6:5D72  e8a356               call 0xb418  ; sub_s6:B418
6:5D75  f6460a01             test byte ptr [bp + 0xa], 1
6:5D79  7409                 je 0x5d84
6:5D7B  66ff7606             push dword ptr [bp + 6]
6:5D7F  9ace17e05b           lcall 0x5be0, 0x17ce  ; operator_delete@s1:17CE
loc_5D84:
6:5D84  8b4606               mov ax, word ptr [bp + 6]
6:5D87  8b5608               mov dx, word ptr [bp + 8]
6:5D8A  c9                   leave
6:5D8B  ca0600               retf 6
6:5D8E  db 68 5d 94 5d 56 bb 9c 5d 8e 17 56 5d ec b5 a0 5d
6:5D9E  db 1a b8 a4 5d 1c bc a8 5d 38 bd ac 5d 90 bc b0 5d
6:5DAE  db 7e bc b4 5d 14 b5 b8 5d 2a be bc 5d 16 bf c0 5d
6:5DBE  db 0e 5d c4 5d 1e bf c8 5d 9e be cc 5d 22 bf d0 5d
6:5DCE  db f0 bb d4 5d 02 bc d8 5d a8 b5 dc 5d ca b5 e0 5d
6:5DDE  db e6 b4 e4 5d ec b4 e8 5d 6e b4 ec 5d 4a c6 f0 5d
6:5DEE  db 22 c5 f4 5d d2 ce 95 5c

; ---------------- sub_s6:5DF6 FAR size=34 callers=1
6:5DF6  55                   push bp
6:5DF7  8bec                 mov bp, sp
6:5DF9  66ff7606             push dword ptr [bp + 6]
6:5DFD  90                   nop
6:5DFE  0e                   push cs
6:5DFF  e85255               call 0xb354  ; Building::Building()@s6:B354
6:5E02  c45e06               les bx, ptr [bp + 6]
6:5E05  26c707705e           mov word ptr es:[bx], 0x5e70
6:5E0A  26c74702905d         mov word ptr es:[bx + 2], 0x5d90  ; SEGMENT s6:0000
6:5E10  8bc3                 mov ax, bx
6:5E12  8cc2                 mov dx, es
6:5E14  c9                   leave
6:5E15  ca0400               retf 4

; ---------------- sub_s6:5E18 FAR size=42 callers=1
6:5E18  55                   push bp
6:5E19  8bec                 mov bp, sp
6:5E1B  66ff760c             push dword ptr [bp + 0xc]
6:5E1F  66ff7608             push dword ptr [bp + 8]
6:5E23  ff7606               push word ptr [bp + 6]
6:5E26  90                   nop
6:5E27  0e                   push cs
6:5E28  e87355               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:5E2B  c45e06               les bx, ptr [bp + 6]
6:5E2E  26c707705e           mov word ptr es:[bx], 0x5e70
6:5E33  26c747020e5e         mov word ptr es:[bx + 2], 0x5e0e  ; SEGMENT s6:0000
6:5E39  8bc3                 mov ax, bx
6:5E3B  8cc2                 mov dx, es
6:5E3D  c9                   leave
6:5E3E  ca0a00               retf 0xa
6:5E41  db 00

; ---------------- sub_s6:5E42 FAR size=4 callers=0
6:5E42  ca0400               retf 4
6:5E45  db 00

; ---------------- sub_s6:5E46 FAR size=4 callers=0
6:5E46  ca0400               retf 4
6:5E49  db 00

; ---------------- sub_s6:5E4A FAR size=142 callers=0
6:5E4A  c8040000             enter 4, 0
6:5E4E  66ff7606             push dword ptr [bp + 6]
6:5E52  90                   nop
6:5E53  0e                   push cs
6:5E54  e8c155               call 0xb418  ; sub_s6:B418
6:5E57  f6460a01             test byte ptr [bp + 0xa], 1
6:5E5B  7409                 je 0x5e66
6:5E5D  66ff7606             push dword ptr [bp + 6]
6:5E61  9ace17825d           lcall 0x5d82, 0x17ce  ; operator_delete@s1:17CE
loc_5E66:
6:5E66  8b4606               mov ax, word ptr [bp + 6]
6:5E69  8b5608               mov dx, word ptr [bp + 8]
6:5E6C  c9                   leave
6:5E6D  ca0600               retf 6
6:5E70  db 4a 5e 76 5e 56 bb 7e 5e 8e 17 98 5d ec b5 82 5e
6:5E80  db 1a b8 86 5e 1c bc 8a 5e 38 bd 8e 5e 90 bc 92 5e
6:5E90  db 7e bc 96 5e 14 b5 9a 5e 2a be 9e 5e 42 5e a2 5e
6:5EA0  db 46 5e a6 5e 1e bf aa 5e 9e be ae 5e 22 bf b2 5e
6:5EB0  db f0 bb b6 5e 02 bc ba 5e a8 b5 be 5e ca b5 c2 5e
6:5EC0  db e6 b4 c6 5e ec b4 ca 5e 6e b4 ce 5e 4a c6 d2 5e
6:5ED0  db 22 c5 d6 5e d2 ce 37 5e

; ---------------- sub_s6:5ED8 FAR size=40 callers=1
6:5ED8  55                   push bp
6:5ED9  8bec                 mov bp, sp
6:5EDB  66ff7606             push dword ptr [bp + 6]
6:5EDF  90                   nop
6:5EE0  0e                   push cs
6:5EE1  e87054               call 0xb354  ; Building::Building()@s6:B354
6:5EE4  c45e06               les bx, ptr [bp + 6]
6:5EE7  26c747200000         mov word ptr es:[bx + 0x20], 0
6:5EED  26c7075460           mov word ptr es:[bx], 0x6054
6:5EF2  26c74702725e         mov word ptr es:[bx + 2], 0x5e72  ; SEGMENT s6:0000
6:5EF8  8bc3                 mov ax, bx
6:5EFA  8cc2                 mov dx, es
6:5EFC  c9                   leave
6:5EFD  ca0400               retf 4

; ---------------- sub_s6:5F00 FAR size=48 callers=1
6:5F00  55                   push bp
6:5F01  8bec                 mov bp, sp
6:5F03  66ff760c             push dword ptr [bp + 0xc]
6:5F07  66ff7608             push dword ptr [bp + 8]
6:5F0B  ff7606               push word ptr [bp + 6]
6:5F0E  90                   nop
6:5F0F  0e                   push cs
6:5F10  e88b54               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:5F13  c45e06               les bx, ptr [bp + 6]
6:5F16  26c747200000         mov word ptr es:[bx + 0x20], 0
6:5F1C  26c7075460           mov word ptr es:[bx], 0x6054
6:5F21  26c74702f65e         mov word ptr es:[bx + 2], 0x5ef6  ; SEGMENT s6:0000
6:5F27  8bc3                 mov ax, bx
6:5F29  8cc2                 mov dx, es
6:5F2B  c9                   leave
6:5F2C  ca0a00               retf 0xa
6:5F2F  db 00

; ---------------- sub_s6:5F30 FAR size=82 callers=0
6:5F30  c8140000             enter 0x14, 0
6:5F34  66ff7606             push dword ptr [bp + 6]
6:5F38  90                   nop
6:5F39  0e                   push cs
6:5F3A  e8615f               call 0xbe9e  ; sub_s6:BE9E
6:5F3D  c45e06               les bx, ptr [bp + 6]
6:5F40  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:5F45  7537                 jne 0x5f7e
6:5F47  26c747206400         mov word ptr es:[bx + 0x20], 0x64
6:5F4D  06                   push es
6:5F4E  53                   push bx
6:5F4F  90                   nop
6:5F50  0e                   push cs
6:5F51  e83a56               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:5F54  8946fc               mov word ptr [bp - 4], ax
6:5F57  8956fe               mov word ptr [bp - 2], dx
6:5F5A  c45efc               les bx, ptr [bp - 4]
6:5F5D  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:5F62  6a61                 push 0x61
6:5F64  6650                 push eax
6:5F66  9ab03f193c           lcall 0x3c19, 0x3fb0  ; sub_s8:3FB0
6:5F6B  52                   push dx
6:5F6C  50                   push ax
6:5F6D  9ab2257a5e           lcall 0x5e7a, 0x25b2  ; sub_s7:25B2
6:5F72  0bc0                 or ax, ax
6:5F74  7408                 je 0x5f7e
6:5F76  c45e06               les bx, ptr [bp + 6]
6:5F79  2683472064           add word ptr es:[bx + 0x20], 0x64
loc_5F7E:
6:5F7E  c9                   leave
6:5F7F  ca0400               retf 4

; ---------------- sub_s6:5F82 size=70 callers=0
6:5F82  c80a0000             enter 0xa, 0
6:5F86  66ff760a             push dword ptr [bp + 0xa]
6:5F8A  66ff7606             push dword ptr [bp + 6]
6:5F8E  90                   nop
6:5F8F  0e                   push cs
6:5F90  e85956               call 0xb5ec  ; sub_s6:B5EC
6:5F93  0bc0                 or ax, ax
6:5F95  742c                 je 0x5fc3
6:5F97  c45e06               les bx, ptr [bp + 6]
6:5F9A  268b4720             mov ax, word ptr es:[bx + 0x20]
6:5F9E  8946f6               mov word ptr [bp - 0xa], ax
6:5FA1  666a02               push 2
6:5FA4  8d46f6               lea ax, [bp - 0xa]
6:5FA7  16                   push ss
6:5FA8  50                   push ax
6:5FA9  66ff760a             push dword ptr [bp + 0xa]
6:5FAD  9a1c7e625d           lcall 0x5d62, 0x7e1c  ; File_write@s2:7E1C
6:5FB2  0bc0                 or ax, ax
6:5FB4  750a                 jne 0x5fc0
6:5FB6  c7061003d006         mov word ptr [0x310], 0x6d0
6:5FBC  c9                   leave
6:5FBD  ca0800               retf 8
loc_5FC0:
6:5FC0  b80100               mov ax, 1
loc_5FC3:
6:5FC3  c9                   leave
6:5FC4  ca0800               retf 8
6:5FC7  db 00

; ---------------- sub_s6:5FC8 FAR size=64 callers=0
6:5FC8  c80e0000             enter 0xe, 0
6:5FCC  66ff760a             push dword ptr [bp + 0xa]
6:5FD0  66ff7606             push dword ptr [bp + 6]
6:5FD4  90                   nop
6:5FD5  0e                   push cs
6:5FD6  e84158               call 0xb81a  ; sub_s6:B81A
6:5FD9  0bc0                 or ax, ax
6:5FDB  7426                 je 0x6003
6:5FDD  666a02               push 2
6:5FE0  668b4606             mov eax, dword ptr [bp + 6]
6:5FE4  052000               add ax, 0x20
6:5FE7  6650                 push eax
6:5FE9  66ff760a             push dword ptr [bp + 0xa]
6:5FED  9aee7db05f           lcall 0x5fb0, 0x7dee  ; File_read@s2:7DEE
6:5FF2  0bc0                 or ax, ax
6:5FF4  750a                 jne 0x6000
6:5FF6  c7061003d206         mov word ptr [0x310], 0x6d2
6:5FFC  c9                   leave
6:5FFD  ca0800               retf 8
loc_6000:
6:6000  b80100               mov ax, 1
loc_6003:
6:6003  c9                   leave
6:6004  ca0800               retf 8
6:6007  db 00

; ---------------- sub_s6:6008 FAR size=38 callers=0
6:6008  55                   push bp
6:6009  8bec                 mov bp, sp
6:600B  66ff7606             push dword ptr [bp + 6]
6:600F  90                   nop
6:6010  0e                   push cs
6:6011  e8165e               call 0xbe2a  ; sub_s6:BE2A
6:6014  c45e06               les bx, ptr [bp + 6]
6:6017  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:601C  750b                 jne 0x6029
6:601E  26837f2000           cmp word ptr es:[bx + 0x20], 0
6:6023  7e04                 jle 0x6029
6:6025  26ff4f20             dec word ptr es:[bx + 0x20]
loc_6029:
6:6029  c9                   leave
6:602A  ca0400               retf 4
6:602D  db 00

; ---------------- sub_s6:602E FAR size=142 callers=0
6:602E  c8040000             enter 4, 0
6:6032  66ff7606             push dword ptr [bp + 6]
6:6036  90                   nop
6:6037  0e                   push cs
6:6038  e8dd53               call 0xb418  ; sub_s6:B418
6:603B  f6460a01             test byte ptr [bp + 0xa], 1
6:603F  7409                 je 0x604a
6:6041  66ff7606             push dword ptr [bp + 6]
6:6045  9ace17645e           lcall 0x5e64, 0x17ce  ; operator_delete@s1:17CE
loc_604A:
6:604A  8b4606               mov ax, word ptr [bp + 6]
6:604D  8b5608               mov dx, word ptr [bp + 8]
6:6050  c9                   leave
6:6051  ca0600               retf 6
6:6054  db 2e 60 5a 60 56 bb 62 60 8e 17 70 5f 82 5f 66 60
6:6064  db c8 5f 6a 60 1c bc 6e 60 38 bd 72 60 90 bc 76 60
6:6074  db 7e bc 7a 60 14 b5 7e 60 08 60 82 60 16 bf 86 60
6:6084  db 1a bf 8a 60 1e bf 8e 60 30 5f 92 60 22 bf 96 60
6:6094  db f0 bb 9a 60 02 bc 9e 60 a8 b5 a2 60 ca b5 a6 60
6:60A4  db e6 b4 aa 60 ec b4 ae 60 6e b4 b2 60 4a c6 b6 60
6:60B4  db 22 c5 ba 60 d2 ce 25 5f

; ---------------- sub_s6:60BC FAR size=98 callers=1
6:60BC  c8040000             enter 4, 0
6:60C0  66ff7606             push dword ptr [bp + 6]
6:60C4  90                   nop
6:60C5  0e                   push cs
6:60C6  e88b52               call 0xb354  ; Building::Building()@s6:B354
6:60C9  c45e06               les bx, ptr [bp + 6]
6:60CC  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:60D5  26c7077668           mov word ptr es:[bx], 0x6876
6:60DA  26c747025660         mov word ptr es:[bx + 2], 0x6056  ; SEGMENT s6:0000
6:60E0  6a0c                 push 0xc
6:60E2  9a9c174860           lcall 0x6048, 0x179c  ; operator_new@s1:179C
6:60E7  83c402               add sp, 2
6:60EA  8956fe               mov word ptr [bp - 2], dx
6:60ED  0bd0                 or dx, ax
6:60EF  7417                 je 0x6108
6:60F1  ff76fe               push word ptr [bp - 2]
6:60F4  50                   push ax
6:60F5  9a4a57f05f           lcall 0x5ff0, 0x574a  ; sub_s2:574A
6:60FA  c45e06               les bx, ptr [bp + 6]
6:60FD  26894720             mov word ptr es:[bx + 0x20], ax
6:6101  26895722             mov word ptr es:[bx + 0x22], dx
6:6105  eb0d                 jmp 0x6114
6:6107  db 90
loc_6108:
6:6108  c45e06               les bx, ptr [bp + 6]
6:610B  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
loc_6114:
6:6114  8b4606               mov ax, word ptr [bp + 6]
6:6117  8b5608               mov dx, word ptr [bp + 8]
6:611A  c9                   leave
6:611B  ca0400               retf 4

; ---------------- sub_s6:611E FAR size=104 callers=1
6:611E  c8040000             enter 4, 0
6:6122  66ff760c             push dword ptr [bp + 0xc]
6:6126  66ff7608             push dword ptr [bp + 8]
6:612A  ff7606               push word ptr [bp + 6]
6:612D  90                   nop
6:612E  0e                   push cs
6:612F  e86c52               call 0xb39e  ; Building::Building(type,owner)@s6:B39E
6:6132  c45e06               les bx, ptr [bp + 6]
6:6135  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
6:613E  26c7077668           mov word ptr es:[bx], 0x6876
6:6143  26c74702de60         mov word ptr es:[bx + 2], 0x60de  ; SEGMENT s6:0000
6:6149  6a0c                 push 0xc
6:614B  9a9c17e560           lcall 0x60e5, 0x179c  ; operator_new@s1:179C
6:6150  83c402               add sp, 2
6:6153  8956fe               mov word ptr [bp - 2], dx
6:6156  0bd0                 or dx, ax
6:6158  7416                 je 0x6170
6:615A  ff76fe               push word ptr [bp - 2]
6:615D  50                   push ax
6:615E  9a4a57f860           lcall 0x60f8, 0x574a  ; sub_s2:574A
6:6163  c45e06               les bx, ptr [bp + 6]
6:6166  26894720             mov word ptr es:[bx + 0x20], ax
6:616A  26895722             mov word ptr es:[bx + 0x22], dx
6:616E  eb0c                 jmp 0x617c
loc_6170:
6:6170  c45e06               les bx, ptr [bp + 6]
6:6173  6626c7472000000000   mov dword ptr es:[bx + 0x20], 0
loc_617C:
6:617C  8b4606               mov ax, word ptr [bp + 6]
6:617F  8b5608               mov dx, word ptr [bp + 8]
6:6182  c9                   leave
6:6183  ca0a00               retf 0xa

; ---------------- sub_s6:6186 FAR size=62 callers=1
6:6186  c8080000             enter 8, 0
6:618A  56                   push si
6:618B  c45e06               les bx, ptr [bp + 6]
6:618E  26c7077668           mov word ptr es:[bx], 0x6876
6:6193  26c747024761         mov word ptr es:[bx + 2], 0x6147  ; SEGMENT s6:0000
6:6199  268b4720             mov ax, word ptr es:[bx + 0x20]
6:619D  268b5722             mov dx, word ptr es:[bx + 0x22]
6:61A1  8bda                 mov bx, dx
6:61A3  0bd0                 or dx, ax
6:61A5  740e                 je 0x61b5
6:61A7  6a01                 push 1
6:61A9  53                   push bx
6:61AA  50                   push ax
6:61AB  8ec3                 mov es, bx
6:61AD  8bf0                 mov si, ax
6:61AF  26c41c               les bx, ptr es:[si]
6:61B2  26ff1f               lcall es:[bx]
loc_61B5:
6:61B5  66ff7606             push dword ptr [bp + 6]
6:61B9  90                   nop
6:61BA  0e                   push cs
6:61BB  e85a52               call 0xb418  ; sub_s6:B418
6:61BE  5e                   pop si
6:61BF  c9                   leave
6:61C0  ca0400               retf 4
6:61C3  db 00

; ---------------- sub_s6:61C4 FAR size=100 callers=0
6:61C4  c8080000             enter 8, 0
6:61C8  56                   push si
6:61C9  66ff760a             push dword ptr [bp + 0xa]
6:61CD  66ff7606             push dword ptr [bp + 6]
6:61D1  90                   nop
6:61D2  0e                   push cs
6:61D3  e89852               call 0xb46e  ; sub_s6:B46E
6:61D6  c45e06               les bx, ptr [bp + 6]
6:61D9  268b4720             mov ax, word ptr es:[bx + 0x20]
6:61DD  268b5722             mov dx, word ptr es:[bx + 0x22]
6:61E1  8956fa               mov word ptr [bp - 6], dx
6:61E4  8bda                 mov bx, dx
6:61E6  0bd0                 or dx, ax
6:61E8  740e                 je 0x61f8
6:61EA  6a01                 push 1
6:61EC  53                   push bx
6:61ED  50                   push ax
6:61EE  8ec3                 mov es, bx
6:61F0  8bf0                 mov si, ax
6:61F2  26c41c               les bx, ptr es:[si]
6:61F5  26ff1f               lcall es:[bx]
loc_61F8:
6:61F8  6a0c                 push 0xc
6:61FA  9a9c174e61           lcall 0x614e, 0x179c  ; operator_new@s1:179C
6:61FF  83c402               add sp, 2
6:6202  8956fa               mov word ptr [bp - 6], dx
6:6205  0bd0                 or dx, ax
6:6207  740b                 je 0x6214
6:6209  ff76fa               push word ptr [bp - 6]
6:620C  50                   push ax
6:620D  9a4a576161           lcall 0x6161, 0x574a  ; sub_s2:574A
6:6212  eb03                 jmp 0x6217
loc_6214:
6:6214  33c0                 xor ax, ax
6:6216  99                   cdq
loc_6217:
6:6217  c45e06               les bx, ptr [bp + 6]
6:621A  26894720             mov word ptr es:[bx + 0x20], ax
6:621E  26895722             mov word ptr es:[bx + 0x22], dx
6:6222  5e                   pop si
6:6223  c9                   leave
6:6224  ca0800               retf 8
6:6227  db 00

; ---------------- sub_s6:6228 FAR size=160 callers=3
6:6228  c8160000             enter 0x16, 0
6:622C  c45e06               les bx, ptr [bp + 6]
6:622F  6626ff7720           push dword ptr es:[bx + 0x20]
6:6234  8d46f8               lea ax, [bp - 8]
6:6237  16                   push ss
6:6238  50                   push ax
6:6239  9a84574e62           lcall 0x624e, 0x5784  ; ListIter::ListIter@s2:5784
6:623E  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_6246:
6:6246  8d46f8               lea ax, [bp - 8]
6:6249  16                   push ss
6:624A  50                   push ax
6:624B  9a125b1062           lcall 0x6210, 0x5b12  ; ListIter::next@s2:5B12
6:6250  8946f4               mov word ptr [bp - 0xc], ax
6:6253  8956f6               mov word ptr [bp - 0xa], dx
6:6256  0bd0                 or dx, ax
6:6258  746a                 je 0x62c4
6:625A  8b460e               mov ax, word ptr [bp + 0xe]
6:625D  c45ef4               les bx, ptr [bp - 0xc]
6:6260  26394706             cmp word ptr es:[bx + 6], ax
6:6264  75e0                 jne 0x6246
6:6266  268b470a             mov ax, word ptr es:[bx + 0xa]
6:626A  8bc8                 mov cx, ax
6:626C  2bd2                 sub dx, dx
6:626E  3b560c               cmp dx, word ptr [bp + 0xc]
6:6271  722b                 jb 0x629e
6:6273  7705                 ja 0x627a
6:6275  3b460a               cmp ax, word ptr [bp + 0xa]
6:6278  7624                 jbe 0x629e
loc_627A:
6:627A  268b470c             mov ax, word ptr es:[bx + 0xc]
6:627E  f7f1                 div cx
6:6280  8946ee               mov word ptr [bp - 0x12], ax
6:6283  8b460a               mov ax, word ptr [bp + 0xa]
6:6286  2bc8                 sub cx, ax
6:6288  26894f0a             mov word ptr es:[bx + 0xa], cx
6:628C  f766ee               mul word ptr [bp - 0x12]
6:628F  262b470c             sub ax, word ptr es:[bx + 0xc]
6:6293  f7d8                 neg ax
6:6295  2689470c             mov word ptr es:[bx + 0xc], ax
6:6299  c9                   leave
6:629A  ca0a00               retf 0xa
6:629D  db 90
loc_629E:
6:629E  29460a               sub word ptr [bp + 0xa], ax
6:62A1  19560c               sbb word ptr [bp + 0xc], dx
6:62A4  06                   push es
6:62A5  53                   push bx
6:62A6  c45e06               les bx, ptr [bp + 6]
6:62A9  6626ff7720           push dword ptr es:[bx + 0x20]
6:62AE  26c45f20             les bx, ptr es:[bx + 0x20]
6:62B2  26c41f               les bx, ptr es:[bx]
6:62B5  26ff5f0c             lcall es:[bx + 0xc]
6:62B9  66c746fc00000000     mov dword ptr [bp - 4], 0
6:62C1  eb83                 jmp 0x6246
6:62C3  db 90
loc_62C4:
6:62C4  c9                   leave
6:62C5  ca0a00               retf 0xa

; ---------------- sub_s6:62C8 FAR size=58 callers=4
6:62C8  c8040000             enter 4, 0
6:62CC  c45e06               les bx, ptr [bp + 6]
6:62CF  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:62D4  7516                 jne 0x62ec
6:62D6  06                   push es
6:62D7  53                   push bx
6:62D8  90                   nop
6:62D9  0e                   push cs
6:62DA  e8f704               call 0x67d4  ; sub_s6:67D4
6:62DD  8946fc               mov word ptr [bp - 4], ax
6:62E0  8956fe               mov word ptr [bp - 2], dx
6:62E3  0bd2                 or dx, dx
6:62E5  7505                 jne 0x62ec
6:62E7  3d6400               cmp ax, 0x64
6:62EA  7208                 jb 0x62f4
loc_62EC:
6:62EC  33c0                 xor ax, ax
6:62EE  99                   cdq
6:62EF  c9                   leave
6:62F0  ca0400               retf 4
6:62F3  db 90
loc_62F4:
6:62F4  b86400               mov ax, 0x64
6:62F7  99                   cdq
6:62F8  2b46fc               sub ax, word ptr [bp - 4]
6:62FB  1b56fe               sbb dx, word ptr [bp - 2]
6:62FE  c9                   leave
6:62FF  ca0400               retf 4

; ---------------- sub_s6:6302 FAR size=84 callers=3
6:6302  c8100000             enter 0x10, 0
6:6306  c45e06               les bx, ptr [bp + 6]
6:6309  6626ff7720           push dword ptr es:[bx + 0x20]
6:630E  8d46f8               lea ax, [bp - 8]
6:6311  16                   push ss
6:6312  50                   push ax
6:6313  9a84572863           lcall 0x6328, 0x5784  ; ListIter::ListIter@s2:5784
6:6318  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_6320:
6:6320  8d46f8               lea ax, [bp - 8]
6:6323  16                   push ss
6:6324  50                   push ax
6:6325  9a125b3c62           lcall 0x623c, 0x5b12  ; ListIter::next@s2:5B12
6:632A  8946f4               mov word ptr [bp - 0xc], ax
6:632D  8956f6               mov word ptr [bp - 0xa], dx
6:6330  0bd0                 or dx, ax
6:6332  7418                 je 0x634c
6:6334  c45ef4               les bx, ptr [bp - 0xc]
6:6337  26837f0800           cmp word ptr es:[bx + 8], 0
6:633C  74e2                 je 0x6320
6:633E  268b470a             mov ax, word ptr es:[bx + 0xa]
6:6342  2bd2                 sub dx, dx
6:6344  0146f0               add word ptr [bp - 0x10], ax
6:6347  1156f2               adc word ptr [bp - 0xe], dx
6:634A  ebd4                 jmp 0x6320
loc_634C:
6:634C  8b46f0               mov ax, word ptr [bp - 0x10]
6:634F  8b56f2               mov dx, word ptr [bp - 0xe]
6:6352  c9                   leave
6:6353  ca0400               retf 4

; ---------------- sub_s6:6356 FAR size=178 callers=3
6:6356  c8160000             enter 0x16, 0
6:635A  c45e06               les bx, ptr [bp + 6]
6:635D  6626ff7720           push dword ptr es:[bx + 0x20]
6:6362  8d46f8               lea ax, [bp - 8]
6:6365  16                   push ss
6:6366  50                   push ax
6:6367  9a84577c63           lcall 0x637c, 0x5784  ; ListIter::ListIter@s2:5784
6:636C  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_6374:
6:6374  8d46f8               lea ax, [bp - 8]
6:6377  16                   push ss
6:6378  50                   push ax
6:6379  9a125b1663           lcall 0x6316, 0x5b12  ; ListIter::next@s2:5B12
6:637E  8946f4               mov word ptr [bp - 0xc], ax
6:6381  8956f6               mov word ptr [bp - 0xa], dx
6:6384  0bd0                 or dx, ax
6:6386  747c                 je 0x6404
6:6388  c45ef4               les bx, ptr [bp - 0xc]
6:638B  26837f0800           cmp word ptr es:[bx + 8], 0
6:6390  74e2                 je 0x6374
6:6392  837e0a00             cmp word ptr [bp + 0xa], 0
6:6396  7409                 je 0x63a1
6:6398  8b460a               mov ax, word ptr [bp + 0xa]
6:639B  26394708             cmp word ptr es:[bx + 8], ax
6:639F  75d3                 jne 0x6374
loc_63A1:
6:63A1  26837f080f           cmp word ptr es:[bx + 8], 0xf
6:63A6  7506                 jne 0x63ae
6:63A8  837e0a0f             cmp word ptr [bp + 0xa], 0xf
6:63AC  75c6                 jne 0x6374
loc_63AE:
6:63AE  268b470a             mov ax, word ptr es:[bx + 0xa]
6:63B2  8bc8                 mov cx, ax
6:63B4  2bd2                 sub dx, dx
6:63B6  3b560e               cmp dx, word ptr [bp + 0xe]
6:63B9  7223                 jb 0x63de
6:63BB  7705                 ja 0x63c2
6:63BD  3b460c               cmp ax, word ptr [bp + 0xc]
6:63C0  761c                 jbe 0x63de
loc_63C2:
6:63C2  268b470c             mov ax, word ptr es:[bx + 0xc]
6:63C6  f7f1                 div cx
6:63C8  8946ee               mov word ptr [bp - 0x12], ax
6:63CB  8b460c               mov ax, word ptr [bp + 0xc]
6:63CE  2629470a             sub word ptr es:[bx + 0xa], ax
6:63D2  f766ee               mul word ptr [bp - 0x12]
6:63D5  2629470c             sub word ptr es:[bx + 0xc], ax
6:63D9  c9                   leave
6:63DA  ca0a00               retf 0xa
6:63DD  db 90
loc_63DE:
6:63DE  29460c               sub word ptr [bp + 0xc], ax
6:63E1  19560e               sbb word ptr [bp + 0xe], dx
6:63E4  06                   push es
6:63E5  53                   push bx
6:63E6  c45e06               les bx, ptr [bp + 6]
6:63E9  6626ff7720           push dword ptr es:[bx + 0x20]
6:63EE  26c45f20             les bx, ptr es:[bx + 0x20]
6:63F2  26c41f               les bx, ptr es:[bx]
6:63F5  26ff5f0c             lcall es:[bx + 0xc]
6:63F9  66c746fc00000000     mov dword ptr [bp - 4], 0
6:6401  e970ff               jmp 0x6374
loc_6404:
6:6404  c9                   leave
6:6405  ca0a00               retf 0xa

; ---------------- sub_s6:6408 FAR size=206 callers=4
6:6408  c8160000             enter 0x16, 0
6:640C  c45e06               les bx, ptr [bp + 6]
6:640F  6626ff7720           push dword ptr es:[bx + 0x20]
6:6414  8d46f8               lea ax, [bp - 8]
6:6417  16                   push ss
6:6418  50                   push ax
6:6419  9a84572b64           lcall 0x642b, 0x5784  ; ListIter::ListIter@s2:5784
6:641E  c746f20000           mov word ptr [bp - 0xe], 0
loc_6423:
6:6423  8d46f8               lea ax, [bp - 8]
6:6426  16                   push ss
6:6427  50                   push ax
6:6428  9a125b6a63           lcall 0x636a, 0x5b12  ; ListIter::next@s2:5B12
6:642D  8946f4               mov word ptr [bp - 0xc], ax
6:6430  8956f6               mov word ptr [bp - 0xa], dx
6:6433  0bd0                 or dx, ax
6:6435  745b                 je 0x6492
6:6437  c45e0a               les bx, ptr [bp + 0xa]
6:643A  268b4704             mov ax, word ptr es:[bx + 4]
6:643E  c45ef4               les bx, ptr [bp - 0xc]
6:6441  26394704             cmp word ptr es:[bx + 4], ax
6:6445  75dc                 jne 0x6423
6:6447  c45e0a               les bx, ptr [bp + 0xa]
6:644A  268b4706             mov ax, word ptr es:[bx + 6]
6:644E  c45ef4               les bx, ptr [bp - 0xc]
6:6451  26394706             cmp word ptr es:[bx + 6], ax
6:6455  75cc                 jne 0x6423
6:6457  c45e0a               les bx, ptr [bp + 0xa]
6:645A  268b4708             mov ax, word ptr es:[bx + 8]
6:645E  c45ef4               les bx, ptr [bp - 0xc]
6:6461  26394708             cmp word ptr es:[bx + 8], ax
6:6465  75bc                 jne 0x6423
6:6467  c746f20100           mov word ptr [bp - 0xe], 1
6:646C  268b470a             mov ax, word ptr es:[bx + 0xa]
6:6470  c45e0a               les bx, ptr [bp + 0xa]
6:6473  2603470a             add ax, word ptr es:[bx + 0xa]
6:6477  c45ef4               les bx, ptr [bp - 0xc]
6:647A  2689470a             mov word ptr es:[bx + 0xa], ax
6:647E  268b470c             mov ax, word ptr es:[bx + 0xc]
6:6482  c45e0a               les bx, ptr [bp + 0xa]
6:6485  2603470c             add ax, word ptr es:[bx + 0xc]
6:6489  c45ef4               les bx, ptr [bp - 0xc]
6:648C  2689470c             mov word ptr es:[bx + 0xc], ax
6:6490  eb91                 jmp 0x6423
loc_6492:
6:6492  837ef200             cmp word ptr [bp - 0xe], 0
6:6496  7422                 je 0x64ba
6:6498  668b460a             mov eax, dword ptr [bp + 0xa]
6:649C  668946ea             mov dword ptr [bp - 0x16], eax
6:64A0  668946ee             mov dword ptr [bp - 0x12], eax
6:64A4  660bc0               or eax, eax
6:64A7  7428                 je 0x64d1
6:64A9  6a01                 push 1
6:64AB  c45e0a               les bx, ptr [bp + 0xa]
6:64AE  06                   push es
6:64AF  50                   push ax
6:64B0  26c41f               les bx, ptr es:[bx]
6:64B3  26ff1f               lcall es:[bx]
6:64B6  c9                   leave
6:64B7  ca0800               retf 8
loc_64BA:
6:64BA  66ff760a             push dword ptr [bp + 0xa]
6:64BE  c45e06               les bx, ptr [bp + 6]
6:64C1  6626ff7720           push dword ptr es:[bx + 0x20]
6:64C6  26c45f20             les bx, ptr es:[bx + 0x20]
6:64CA  26c41f               les bx, ptr es:[bx]
6:64CD  26ff5f04             lcall es:[bx + 4]
loc_64D1:
6:64D1  c9                   leave
6:64D2  ca0800               retf 8
6:64D5  db 00

; ---------------- sub_s6:64D6 FAR size=268 callers=0
6:64D6  c8240000             enter 0x24, 0
6:64DA  66ff760a             push dword ptr [bp + 0xa]
6:64DE  66ff7606             push dword ptr [bp + 6]
6:64E2  90                   nop
6:64E3  0e                   push cs
6:64E4  e80551               call 0xb5ec  ; sub_s6:B5EC
6:64E7  0bc0                 or ax, ax
6:64E9  7507                 jne 0x64f2
loc_64EB:
6:64EB  33c0                 xor ax, ax
6:64ED  c9                   leave
6:64EE  ca0800               retf 8
6:64F1  db 90
loc_64F2:
6:64F2  c45e06               les bx, ptr [bp + 6]
6:64F5  6626ff7720           push dword ptr es:[bx + 0x20]
6:64FA  8d46f8               lea ax, [bp - 8]
6:64FD  16                   push ss
6:64FE  50                   push ax
6:64FF  9a84572465           lcall 0x6524, 0x5784  ; ListIter::ListIter@s2:5784
6:6504  c45e06               les bx, ptr [bp + 6]
6:6507  26c45f20             les bx, ptr es:[bx + 0x20]
6:650B  268b4708             mov ax, word ptr es:[bx + 8]
6:650F  8946f2               mov word ptr [bp - 0xe], ax
6:6512  8946e6               mov word ptr [bp - 0x1a], ax
6:6515  666a02               push 2
6:6518  8d46e6               lea ax, [bp - 0x1a]
loc_651B:
6:651B  16                   push ss
6:651C  50                   push ax
6:651D  66ff760a             push dword ptr [bp + 0xa]
6:6521  9a1c7e3a65           lcall 0x653a, 0x7e1c  ; File_write@s2:7E1C
6:6526  0bc0                 or ax, ax
6:6528  7508                 jne 0x6532
loc_652A:
6:652A  c7061003d006         mov word ptr [0x310], 0x6d0
6:6530  ebb9                 jmp 0x64eb
loc_6532:
6:6532  8d46f8               lea ax, [bp - 8]
6:6535  16                   push ss
6:6536  50                   push ax
6:6537  9a125b6165           lcall 0x6561, 0x5b12  ; ListIter::next@s2:5B12
6:653C  8946f4               mov word ptr [bp - 0xc], ax
6:653F  8956f6               mov word ptr [bp - 0xa], dx
6:6542  0bd0                 or dx, ax
6:6544  0f849200             je 0x65da
6:6548  c45ef4               les bx, ptr [bp - 0xc]
6:654B  268b4704             mov ax, word ptr es:[bx + 4]
6:654F  8946e4               mov word ptr [bp - 0x1c], ax
6:6552  666a02               push 2
6:6555  8d46e4               lea ax, [bp - 0x1c]
6:6558  16                   push ss
6:6559  50                   push ax
6:655A  66ff760a             push dword ptr [bp + 0xa]
6:655E  9a1c7e8065           lcall 0x6580, 0x7e1c  ; File_write@s2:7E1C
6:6563  0bc0                 or ax, ax
6:6565  74c3                 je 0x652a
6:6567  c45ef4               les bx, ptr [bp - 0xc]
6:656A  268b4706             mov ax, word ptr es:[bx + 6]
6:656E  8946e2               mov word ptr [bp - 0x1e], ax
6:6571  666a02               push 2
6:6574  8d46e2               lea ax, [bp - 0x1e]
6:6577  16                   push ss
6:6578  50                   push ax
6:6579  66ff760a             push dword ptr [bp + 0xa]
6:657D  9a1c7e9f65           lcall 0x659f, 0x7e1c  ; File_write@s2:7E1C
6:6582  0bc0                 or ax, ax
6:6584  74a4                 je 0x652a
6:6586  c45ef4               les bx, ptr [bp - 0xc]
6:6589  268b4708             mov ax, word ptr es:[bx + 8]
6:658D  8946e0               mov word ptr [bp - 0x20], ax
6:6590  666a02               push 2
6:6593  8d46e0               lea ax, [bp - 0x20]
6:6596  16                   push ss
6:6597  50                   push ax
6:6598  66ff760a             push dword ptr [bp + 0xa]
6:659C  9a1c7ebe65           lcall 0x65be, 0x7e1c  ; File_write@s2:7E1C
6:65A1  0bc0                 or ax, ax
6:65A3  7485                 je 0x652a
6:65A5  c45ef4               les bx, ptr [bp - 0xc]
6:65A8  268b470a             mov ax, word ptr es:[bx + 0xa]
6:65AC  8946de               mov word ptr [bp - 0x22], ax
6:65AF  666a02               push 2
6:65B2  8d46de               lea ax, [bp - 0x22]
6:65B5  16                   push ss
6:65B6  50                   push ax
6:65B7  66ff760a             push dword ptr [bp + 0xa]
6:65BB  9a1c7e1c64           lcall 0x641c, 0x7e1c  ; File_write@s2:7E1C
6:65C0  0bc0                 or ax, ax
6:65C2  0f8464ff             je 0x652a
6:65C6  c45ef4               les bx, ptr [bp - 0xc]
6:65C9  268b470c             mov ax, word ptr es:[bx + 0xc]
6:65CD  8946dc               mov word ptr [bp - 0x24], ax
6:65D0  666a02               push 2
6:65D3  8d46dc               lea ax, [bp - 0x24]
6:65D6  e942ff               jmp 0x651b
6:65D9  db 90
loc_65DA:
6:65DA  b80100               mov ax, 1
6:65DD  c9                   leave
6:65DE  ca0800               retf 8
6:65E1  db 00

; ---------------- sub_s6:65E2 FAR size=354 callers=0
6:65E2  c83c0000             enter 0x3c, 0
6:65E6  66ff760a             push dword ptr [bp + 0xa]
6:65EA  66ff7606             push dword ptr [bp + 6]
6:65EE  90                   nop
6:65EF  0e                   push cs
6:65F0  e82752               call 0xb81a  ; sub_s6:B81A
6:65F3  0bc0                 or ax, ax
6:65F5  7507                 jne 0x65fe
loc_65F7:
6:65F7  33c0                 xor ax, ax
6:65F9  c9                   leave
6:65FA  ca0800               retf 8
6:65FD  db 90
loc_65FE:
6:65FE  666a02               push 2
6:6601  8d46fe               lea ax, [bp - 2]
6:6604  16                   push ss
6:6605  50                   push ax
6:6606  66ff760a             push dword ptr [bp + 0xa]
6:660A  9aee7d3b66           lcall 0x663b, 0x7dee  ; File_read@s2:7DEE
6:660F  0bc0                 or ax, ax
6:6611  7509                 jne 0x661c
loc_6613:
6:6613  c7061003d206         mov word ptr [0x310], 0x6d2
6:6619  ebdc                 jmp 0x65f7
6:661B  db 90
loc_661C:
6:661C  c746fc0000           mov word ptr [bp - 4], 0
6:6621  e9b700               jmp 0x66db
loc_6624:
6:6624  66c746ee00000000     mov dword ptr [bp - 0x12], 0
loc_662C:
6:662C  666a02               push 2
6:662F  8d46f2               lea ax, [bp - 0xe]
6:6632  16                   push ss
6:6633  50                   push ax
6:6634  66ff760a             push dword ptr [bp + 0xa]
6:6638  9aee7d5066           lcall 0x6650, 0x7dee  ; File_read@s2:7DEE
6:663D  0bc0                 or ax, ax
6:663F  74d2                 je 0x6613
6:6641  666a02               push 2
6:6644  8d46f6               lea ax, [bp - 0xa]
6:6647  16                   push ss
6:6648  50                   push ax
6:6649  66ff760a             push dword ptr [bp + 0xa]
6:664D  9aee7d6566           lcall 0x6665, 0x7dee  ; File_read@s2:7DEE
6:6652  0bc0                 or ax, ax
6:6654  74bd                 je 0x6613
6:6656  666a02               push 2
6:6659  8d46ec               lea ax, [bp - 0x14]
6:665C  16                   push ss
6:665D  50                   push ax
6:665E  66ff760a             push dword ptr [bp + 0xa]
6:6662  9aee7d7e66           lcall 0x667e, 0x7dee  ; File_read@s2:7DEE
6:6667  0bc0                 or ax, ax
6:6669  74a8                 je 0x6613
6:666B  666a02               push 2
6:666E  668b46ee             mov eax, dword ptr [bp - 0x12]
6:6672  050a00               add ax, 0xa
6:6675  6650                 push eax
6:6677  66ff760a             push dword ptr [bp + 0xa]
6:667B  9aee7d9766           lcall 0x6697, 0x7dee  ; File_read@s2:7DEE
6:6680  0bc0                 or ax, ax
6:6682  748f                 je 0x6613
6:6684  666a02               push 2
6:6687  668b46ee             mov eax, dword ptr [bp - 0x12]
6:668B  050c00               add ax, 0xc
6:668E  6650                 push eax
6:6690  66ff760a             push dword ptr [bp + 0xa]
6:6694  9aee7db366           lcall 0x66b3, 0x7dee  ; File_read@s2:7DEE
6:6699  0bc0                 or ax, ax
6:669B  0f8474ff             je 0x6613
6:669F  8b46f2               mov ax, word ptr [bp - 0xe]
6:66A2  c45eee               les bx, ptr [bp - 0x12]
6:66A5  26894704             mov word ptr es:[bx + 4], ax
6:66A9  ff76f6               push word ptr [bp - 0xa]
6:66AC  66ff760a             push dword ptr [bp + 0xa]
6:66B0  9abc720a67           lcall 0x670a, 0x72bc  ; sub_s2:72BC
6:66B5  c45eee               les bx, ptr [bp - 0x12]
6:66B8  26894706             mov word ptr es:[bx + 6], ax
6:66BC  8b46ec               mov ax, word ptr [bp - 0x14]
6:66BF  26894708             mov word ptr es:[bx + 8], ax
6:66C3  06                   push es
6:66C4  53                   push bx
6:66C5  c45e06               les bx, ptr [bp + 6]
6:66C8  6626ff7720           push dword ptr es:[bx + 0x20]
6:66CD  26c45f20             les bx, ptr es:[bx + 0x20]
6:66D1  26c41f               les bx, ptr es:[bx]
6:66D4  26ff5f08             lcall es:[bx + 8]
6:66D8  ff46fc               inc word ptr [bp - 4]
loc_66DB:
6:66DB  8b46fe               mov ax, word ptr [bp - 2]
6:66DE  3946fc               cmp word ptr [bp - 4], ax
6:66E1  7359                 jae 0x673c
6:66E3  66a1a268             mov eax, dword ptr [0x68a2]
6:66E7  668946dc             mov dword ptr [bp - 0x24], eax
6:66EB  6650                 push eax
6:66ED  9afc07fd61           lcall 0x61fd, 0x7fc  ; sub_s1:07FC
6:66F2  8946e8               mov word ptr [bp - 0x18], ax
6:66F5  8956ea               mov word ptr [bp - 0x16], dx
6:66F8  0bd0                 or dx, ax
6:66FA  0f8426ff             je 0x6624
6:66FE  c45ee8               les bx, ptr [bp - 0x18]
6:6701  26c7079a38           mov word ptr es:[bx], 0x389a
6:6706  26c747020265         mov word ptr es:[bx + 2], 0x6502  ; SEGMENT s2:0000
6:670C  33c0                 xor ax, ax
6:670E  c45ee8               les bx, ptr [bp - 0x18]
6:6711  26894704             mov word ptr es:[bx + 4], ax
6:6715  26894706             mov word ptr es:[bx + 6], ax
6:6719  26894708             mov word ptr es:[bx + 8], ax
6:671D  2689470a             mov word ptr es:[bx + 0xa], ax
6:6721  2689470c             mov word ptr es:[bx + 0xc], ax
6:6725  26c707ce56           mov word ptr es:[bx], 0x56ce
6:672A  26c74702ef46         mov word ptr es:[bx + 2], 0x46ef  ; SEGMENT s4:0000
6:6730  668b46e8             mov eax, dword ptr [bp - 0x18]
6:6734  668946ee             mov dword ptr [bp - 0x12], eax
6:6738  e9f1fe               jmp 0x662c
6:673B  db 90
loc_673C:
6:673C  b80100               mov ax, 1
6:673F  c9                   leave
6:6740  ca0800               retf 8
6:6743  db 00

; ---------------- sub_s6:6744 FAR size=72 callers=5
6:6744  c80c0000             enter 0xc, 0
6:6748  c45e06               les bx, ptr [bp + 6]
6:674B  6626ff7720           push dword ptr es:[bx + 0x20]
6:6750  8d46f8               lea ax, [bp - 8]
6:6753  16                   push ss
6:6754  50                   push ax
6:6755  9a84576267           lcall 0x6762, 0x5784  ; ListIter::ListIter@s2:5784
loc_675A:
6:675A  8d46f8               lea ax, [bp - 8]
6:675D  16                   push ss
6:675E  50                   push ax
6:675F  9a125b0d66           lcall 0x660d, 0x5b12  ; ListIter::next@s2:5B12
6:6764  8946f4               mov word ptr [bp - 0xc], ax
6:6767  8956f6               mov word ptr [bp - 0xa], dx
6:676A  0bd0                 or dx, ax
6:676C  7416                 je 0x6784
6:676E  8b460a               mov ax, word ptr [bp + 0xa]
6:6771  c45ef4               les bx, ptr [bp - 0xc]
6:6774  26394706             cmp word ptr es:[bx + 6], ax
6:6778  75e0                 jne 0x675a
6:677A  268b470a             mov ax, word ptr es:[bx + 0xa]
6:677E  2bd2                 sub dx, dx
6:6780  c9                   leave
6:6781  ca0600               retf 6
loc_6784:
6:6784  33c0                 xor ax, ax
6:6786  99                   cdq
6:6787  c9                   leave
6:6788  ca0600               retf 6
6:678B  db 00

; ---------------- sub_s6:678C FAR size=72 callers=1
6:678C  c80c0000             enter 0xc, 0
6:6790  c45e06               les bx, ptr [bp + 6]
6:6793  6626ff7720           push dword ptr es:[bx + 0x20]
6:6798  8d46f8               lea ax, [bp - 8]
6:679B  16                   push ss
6:679C  50                   push ax
6:679D  9a8457aa67           lcall 0x67aa, 0x5784  ; ListIter::ListIter@s2:5784
loc_67A2:
6:67A2  8d46f8               lea ax, [bp - 8]
6:67A5  16                   push ss
6:67A6  50                   push ax
6:67A7  9a125b5867           lcall 0x6758, 0x5b12  ; ListIter::next@s2:5B12
6:67AC  8946f4               mov word ptr [bp - 0xc], ax
6:67AF  8956f6               mov word ptr [bp - 0xa], dx
6:67B2  0bd0                 or dx, ax
6:67B4  7416                 je 0x67cc
6:67B6  8b460a               mov ax, word ptr [bp + 0xa]
6:67B9  c45ef4               les bx, ptr [bp - 0xc]
6:67BC  26394708             cmp word ptr es:[bx + 8], ax
6:67C0  75e0                 jne 0x67a2
6:67C2  268b470a             mov ax, word ptr es:[bx + 0xa]
6:67C6  2bd2                 sub dx, dx
6:67C8  c9                   leave
6:67C9  ca0600               retf 6
loc_67CC:
6:67CC  33c0                 xor ax, ax
6:67CE  99                   cdq
6:67CF  c9                   leave
6:67D0  ca0600               retf 6
6:67D3  db 00

; ---------------- sub_s6:67D4 FAR size=78 callers=3
6:67D4  c8100000             enter 0x10, 0
6:67D8  c45e06               les bx, ptr [bp + 6]
6:67DB  6626ff7720           push dword ptr es:[bx + 0x20]
6:67E0  8d46f8               lea ax, [bp - 8]
6:67E3  16                   push ss
6:67E4  50                   push ax
6:67E5  9a8457fa67           lcall 0x67fa, 0x5784  ; ListIter::ListIter@s2:5784
6:67EA  66c746f000000000     mov dword ptr [bp - 0x10], 0
loc_67F2:
6:67F2  8d46f8               lea ax, [bp - 8]
6:67F5  16                   push ss
6:67F6  50                   push ax
6:67F7  9a125ba067           lcall 0x67a0, 0x5b12  ; ListIter::next@s2:5B12
6:67FC  8946f4               mov word ptr [bp - 0xc], ax
6:67FF  8956f6               mov word ptr [bp - 0xa], dx
6:6802  0bd0                 or dx, ax
6:6804  7412                 je 0x6818
6:6806  c45ef4               les bx, ptr [bp - 0xc]
6:6809  2bd2                 sub dx, dx
6:680B  268b470c             mov ax, word ptr es:[bx + 0xc]
6:680F  0146f0               add word ptr [bp - 0x10], ax
6:6812  1156f2               adc word ptr [bp - 0xe], dx
6:6815  ebdb                 jmp 0x67f2
6:6817  db 90
loc_6818:
6:6818  8b46f0               mov ax, word ptr [bp - 0x10]
6:681B  8b56f2               mov dx, word ptr [bp - 0xe]
6:681E  c9                   leave
6:681F  ca0400               retf 4

; ---------------- sub_s6:6822 FAR size=46 callers=0
6:6822  55                   push bp
6:6823  8bec                 mov bp, sp
6:6825  66ff7606             push dword ptr [bp + 6]
6:6829  90                   nop
6:682A  0e                   push cs
6:682B  e8a6ff               call 0x67d4  ; sub_s6:67D4
6:682E  c45e0a               les bx, ptr [bp + 0xa]
6:6831  268907               mov word ptr es:[bx], ax
6:6834  26895702             mov word ptr es:[bx + 2], dx
6:6838  0bd2                 or dx, dx
6:683A  7506                 jne 0x6842
6:683C  26833f64             cmp word ptr es:[bx], 0x64
6:6840  7208                 jb 0x684a
loc_6842:
6:6842  b80100               mov ax, 1
6:6845  c9                   leave
6:6846  ca0800               retf 8
6:6849  db 90
loc_684A:
6:684A  33c0                 xor ax, ax
6:684C  c9                   leave
6:684D  ca0800               retf 8

; ---------------- sub_s6:6850 FAR size=142 callers=0
6:6850  55                   push bp
6:6851  8bec                 mov bp, sp
6:6853  66ff7606             push dword ptr [bp + 6]
6:6857  90                   nop
6:6858  0e                   push cs
6:6859  e82af9               call 0x6186  ; sub_s6:6186
6:685C  f6460a01             test byte ptr [bp + 0xa], 1
6:6860  7409                 je 0x686b
6:6862  66ff7606             push dword ptr [bp + 6]
6:6866  9ace17f066           lcall 0x66f0, 0x17ce  ; operator_delete@s1:17CE
loc_686B:
6:686B  8b4606               mov ax, word ptr [bp + 6]
6:686E  8b5608               mov dx, word ptr [bp + 8]
6:6871  c9                   leave
6:6872  ca0600               retf 6
6:6875  db 90 50 68 7c 68 56 bb 84 68 8e 17 5e 60 d6 64 88
6:6885  db 68 e2 65 8c 68 1c bc 90 68 38 bd 94 68 90 bc 98
6:6895  db 68 7e bc 9c 68 14 b5 a0 68 2a be a4 68 16 bf a8
6:68A5  db 68 1a bf ac 68 1e bf b0 68 9e be b4 68 22 bf b8
6:68B5  db 68 22 68 bc 68 02 bc c0 68 a8 b5 c4 68 ca b5 c8
6:68C5  db 68 e6 b4 cc 68 ec b4 d0 68 c4 61 d4 68 4a c6 d8
6:68D5  db 68 22 c5 dc 68 d2 ce 97 61

; ---------------- SCAddSpew@s6:68DE FAR size=72 callers=3
6:68DE  55                   push bp
6:68DF  8bec                 mov bp, sp
6:68E1  68e803               push 0x3e8
6:68E4  66ff7606             push dword ptr [bp + 6]
6:68E8  90                   nop
6:68E9  0e                   push cs
6:68EA  e8ef68               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:68ED  668b460c             mov eax, dword ptr [bp + 0xc]
6:68F1  c45e06               les bx, ptr [bp + 6]
6:68F4  662689870801         mov dword ptr es:[bx + 0x108], eax
6:68FA  8b460a               mov ax, word ptr [bp + 0xa]
6:68FD  2689870c01           mov word ptr es:[bx + 0x10c], ax
6:6902  26c707e26a           mov word ptr es:[bx], 0x6ae2
6:6907  26c747027868         mov word ptr es:[bx + 2], 0x6878  ; SEGMENT s6:0000
6:690D  1e                   push ds
6:690E  68d24f               push 0x4fd2  ; 'SCAddSpew'
6:6911  8d4708               lea ax, [bx + 8]
6:6914  06                   push es
6:6915  50                   push ax
6:6916  9a3e3d6968           lcall 0x6869, 0x3d3e  ; _fstrcpy@s1:3D3E
6:691B  8b4606               mov ax, word ptr [bp + 6]
6:691E  8b5608               mov dx, word ptr [bp + 8]
6:6921  c9                   leave
6:6922  ca0a00               retf 0xa
6:6925  db 00

; ---------------- SCAddSpew::calcMe@s6:6926 FAR size=166 callers=0
6:6926  c8200000             enter 0x20, 0
6:692A  57                   push di
6:692B  56                   push si
6:692C  c45e06               les bx, ptr [bp + 6]
6:692F  6626ffb70801         push dword ptr es:[bx + 0x108]
6:6935  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:693A  90                   nop
6:693B  0e                   push cs
6:693C  e8ad78               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:693F  8946fc               mov word ptr [bp - 4], ax
6:6942  8956fe               mov word ptr [bp - 2], dx
6:6945  6a0a                 push 0xa
6:6947  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:694C  9afac6e867           lcall 0x67e8, 0xc6fa  ; sub_s2:C6FA
6:6951  52                   push dx
6:6952  50                   push ax
6:6953  66ff76fc             push dword ptr [bp - 4]
6:6957  9a6e4d695f           lcall 0x5f69, 0x4d6e  ; sub_s8:4D6E
6:695C  8946f4               mov word ptr [bp - 0xc], ax
6:695F  8956f6               mov word ptr [bp - 0xa], dx
6:6962  52                   push dx
6:6963  c45ef4               les bx, ptr [bp - 0xc]
6:6966  50                   push ax
6:6967  26c41f               les bx, ptr es:[bx]
6:696A  8bf3                 mov si, bx
6:696C  8cc7                 mov di, es
6:696E  26ff5f10             lcall es:[bx + 0x10]
6:6972  0bd0                 or dx, ax
6:6974  7436                 je 0x69ac
6:6976  666a00               push 0
6:6979  66ff76f4             push dword ptr [bp - 0xc]
6:697D  8ec7                 mov es, di
6:697F  26ff5c04             lcall es:[si + 4]
6:6983  52                   push dx
6:6984  50                   push ax
6:6985  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:698A  90                   nop
6:698B  0e                   push cs
6:698C  e85d78               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:698F  8946e8               mov word ptr [bp - 0x18], ax
6:6992  8956ea               mov word ptr [bp - 0x16], dx
6:6995  6a1f                 push 0x1f
6:6997  c45e06               les bx, ptr [bp + 6]
6:699A  66260fbf870c01       movsx eax, word ptr es:[bx + 0x10c]
6:69A1  6650                 push eax
6:69A3  66ff76e8             push dword ptr [bp - 0x18]
6:69A7  9adc7d8068           lcall 0x6880, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
loc_69AC:
6:69AC  668b46f4             mov eax, dword ptr [bp - 0xc]
6:69B0  660bc0               or eax, eax
6:69B3  740d                 je 0x69c2
6:69B5  6a01                 push 1
6:69B7  c45ef4               les bx, ptr [bp - 0xc]
6:69BA  06                   push es
6:69BB  50                   push ax
6:69BC  26c41f               les bx, ptr es:[bx]
6:69BF  26ff1f               lcall es:[bx]
loc_69C2:
6:69C2  b80100               mov ax, 1
6:69C5  5e                   pop si
6:69C6  5f                   pop di
6:69C7  c9                   leave
6:69C8  ca0400               retf 4
6:69CB  db 00

; ---------------- SCAddSpew::clone@s6:69CC FAR size=174 callers=0
6:69CC  c8200000             enter 0x20, 0
6:69D0  57                   push di
6:69D1  56                   push si
6:69D2  680e01               push 0x10e
6:69D5  9a9c171969           lcall 0x6919, 0x179c  ; operator_new@s1:179C
6:69DA  83c402               add sp, 2
6:69DD  8946f8               mov word ptr [bp - 8], ax
6:69E0  8956fa               mov word ptr [bp - 6], dx
6:69E3  0bd0                 or dx, ax
6:69E5  747f                 je 0x6a66
6:69E7  c45ef8               les bx, ptr [bp - 8]
6:69EA  26c7079a38           mov word ptr es:[bx], 0x389a
6:69EF  26c747024f69         mov word ptr es:[bx + 2], 0x694f  ; SEGMENT s2:0000
6:69F5  c45e06               les bx, ptr [bp + 6]
6:69F8  66268b4704           mov eax, dword ptr es:[bx + 4]
6:69FD  c45ef8               les bx, ptr [bp - 8]
6:6A00  6626894704           mov dword ptr es:[bx + 4], eax
6:6A05  8b4606               mov ax, word ptr [bp + 6]
6:6A08  8b5608               mov dx, word ptr [bp + 8]
6:6A0B  050800               add ax, 8
6:6A0E  1e                   push ds
6:6A0F  8d7f08               lea di, [bx + 8]
6:6A12  8bf0                 mov si, ax
6:6A14  8eda                 mov ds, dx
6:6A16  66b940000000         mov ecx, 0x40
6:6A1C  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:6A1F  1f                   pop ds
6:6A20  c45ef8               les bx, ptr [bp - 8]
6:6A23  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:6A28  26c74702596a         mov word ptr es:[bx + 2], 0x6a59  ; SEGMENT s6:0000
6:6A2E  c45e06               les bx, ptr [bp + 6]
6:6A31  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:6A37  c45ef8               les bx, ptr [bp - 8]
6:6A3A  662689870801         mov dword ptr es:[bx + 0x108], eax
6:6A40  c45e06               les bx, ptr [bp + 6]
6:6A43  268b870c01           mov ax, word ptr es:[bx + 0x10c]
6:6A48  c45ef8               les bx, ptr [bp - 8]
6:6A4B  2689870c01           mov word ptr es:[bx + 0x10c], ax
6:6A50  26c707e26a           mov word ptr es:[bx], 0x6ae2
6:6A55  26c747020b69         mov word ptr es:[bx + 2], 0x690b  ; SEGMENT s6:0000
6:6A5B  668b46f8             mov eax, dword ptr [bp - 8]
6:6A5F  668946fc             mov dword ptr [bp - 4], eax
6:6A63  eb09                 jmp 0x6a6e
6:6A65  db 90
loc_6A66:
6:6A66  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_6A6E:
6:6A6E  8b46fc               mov ax, word ptr [bp - 4]
6:6A71  8b56fe               mov dx, word ptr [bp - 2]
6:6A74  5e                   pop si
6:6A75  5f                   pop di
6:6A76  c9                   leave
6:6A77  ca0400               retf 4

; ---------------- SCAddSpew::dtor@s6:6A7A size=44 callers=0
6:6A7A  c80c0000             enter 0xc, 0
6:6A7E  c45e06               les bx, ptr [bp + 6]
6:6A81  26c7079a38           mov word ptr es:[bx], 0x389a
6:6A86  26c74702f369         mov word ptr es:[bx + 2], 0x69f3  ; SEGMENT s2:0000
6:6A8C  f6460a01             test byte ptr [bp + 0xa], 1
6:6A90  7409                 je 0x6a9b
6:6A92  66ff7606             push dword ptr [bp + 6]
6:6A96  9ace17d869           lcall 0x69d8, 0x17ce  ; operator_delete@s1:17CE
loc_6A9B:
6:6A9B  8b4606               mov ax, word ptr [bp + 6]
6:6A9E  8b5608               mov dx, word ptr [bp + 8]
6:6AA1  c9                   leave
6:6AA2  ca0600               retf 6
6:6AA5  db 00

; ---------------- sub_s6:6AA6 FAR size=76 callers=0
6:6AA6  c8080000             enter 8, 0
6:6AAA  c45e06               les bx, ptr [bp + 6]
6:6AAD  26c7079a38           mov word ptr es:[bx], 0x389a
6:6AB2  26c747028a6a         mov word ptr es:[bx + 2], 0x6a8a  ; SEGMENT s2:0000
6:6AB8  f6460a01             test byte ptr [bp + 0xa], 1
6:6ABC  7409                 je 0x6ac7
6:6ABE  66ff7606             push dword ptr [bp + 6]
6:6AC2  9ace17996a           lcall 0x6a99, 0x17ce  ; operator_delete@s1:17CE
loc_6AC7:
6:6AC7  8b4606               mov ax, word ptr [bp + 6]
6:6ACA  8b5608               mov dx, word ptr [bp + 8]
6:6ACD  c9                   leave
6:6ACE  ca0600               retf 6
6:6AD1  db 90 a6 6a d8 6a 22 d2 dc 6a 28 d2 2c 6a 1a 4f c5
6:6AE1  db 6a 7a 6a e8 6a 26 69 ec 6a 28 d2 f0 6a cc 69 d4
6:6AF1  db 6a

; ---------------- sub_s6:6AF2 FAR size=58 callers=3
6:6AF2  55                   push bp
6:6AF3  8bec                 mov bp, sp
6:6AF5  688713               push 0x1387
6:6AF8  66ff7606             push dword ptr [bp + 6]
6:6AFC  90                   nop
6:6AFD  0e                   push cs
6:6AFE  e8db66               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:6B01  668b460e             mov eax, dword ptr [bp + 0xe]
6:6B05  c45e06               les bx, ptr [bp + 6]
6:6B08  662689870801         mov dword ptr es:[bx + 0x108], eax
6:6B0E  668b460a             mov eax, dword ptr [bp + 0xa]
6:6B12  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:6B18  26c707506e           mov word ptr es:[bx], 0x6e50
6:6B1D  26c74702e46a         mov word ptr es:[bx + 2], 0x6ae4  ; SEGMENT s6:0000
6:6B23  8bc3                 mov ax, bx
6:6B25  8cc2                 mov dx, es
6:6B27  c9                   leave
6:6B28  ca0c00               retf 0xc
6:6B2B  db 00

; ---------------- sub_s6:6B2C FAR size=20 callers=1
6:6B2C  55                   push bp
6:6B2D  8bec                 mov bp, sp
6:6B2F  66ff7606             push dword ptr [bp + 6]
6:6B33  90                   nop
6:6B34  0e                   push cs
6:6B35  e80800               call 0x6b40  ; sub_s6:6B40
6:6B38  b80100               mov ax, 1
6:6B3B  c9                   leave
6:6B3C  ca0400               retf 4
6:6B3F  db 00

; ---------------- sub_s6:6B40 FAR size=484 callers=1
6:6B40  c8340000             enter 0x34, 0
6:6B44  57                   push di
6:6B45  56                   push si
6:6B46  8d46fe               lea ax, [bp - 2]
6:6B49  16                   push ss
6:6B4A  50                   push ax
6:6B4B  8d46fc               lea ax, [bp - 4]
6:6B4E  16                   push ss
6:6B4F  50                   push ax
6:6B50  66ff7606             push dword ptr [bp + 6]
6:6B54  90                   nop
6:6B55  0e                   push cs
6:6B56  e85102               call 0x6daa  ; sub_s6:6DAA
6:6B59  c45e06               les bx, ptr [bp + 6]
6:6B5C  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:6B62  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:6B67  90                   nop
6:6B68  0e                   push cs
6:6B69  e88076               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:6B6C  8946f8               mov word ptr [bp - 8], ax
6:6B6F  8956fa               mov word ptr [bp - 6], dx
6:6B72  52                   push dx
6:6B73  c45ef8               les bx, ptr [bp - 8]
6:6B76  50                   push ax
6:6B77  26c41f               les bx, ptr es:[bx]
6:6B7A  26ff5f24             lcall es:[bx + 0x24]
6:6B7E  66ff76f8             push dword ptr [bp - 8]
6:6B82  90                   nop
6:6B83  0e                   push cs
6:6B84  e8074a               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:6B87  8946f4               mov word ptr [bp - 0xc], ax
6:6B8A  8956f6               mov word ptr [bp - 0xa], dx
6:6B8D  66ff76f8             push dword ptr [bp - 8]
6:6B91  90                   nop
6:6B92  0e                   push cs
6:6B93  e88e4f               call 0xbb24  ; sub_s6:BB24
6:6B96  8946f0               mov word ptr [bp - 0x10], ax
6:6B99  8956f2               mov word ptr [bp - 0xe], dx
6:6B9C  8b46f4               mov ax, word ptr [bp - 0xc]
6:6B9F  8b56f6               mov dx, word ptr [bp - 0xa]
6:6BA2  050c00               add ax, 0xc
6:6BA5  1e                   push ds
6:6BA6  8d7eea               lea di, [bp - 0x16]
6:6BA9  8bf0                 mov si, ax
6:6BAB  16                   push ss
6:6BAC  07                   pop es
6:6BAD  8eda                 mov ds, dx
6:6BAF  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:6BB1  a5                   movsw word ptr es:[di], word ptr [si]
6:6BB2  1f                   pop ds
6:6BB3  8d46ea               lea ax, [bp - 0x16]
6:6BB6  8946da               mov word ptr [bp - 0x26], ax
6:6BB9  8b46ea               mov ax, word ptr [bp - 0x16]
6:6BBC  8946e8               mov word ptr [bp - 0x18], ax
6:6BBF  8b46ec               mov ax, word ptr [bp - 0x14]
6:6BC2  8946e6               mov word ptr [bp - 0x1a], ax
6:6BC5  8b46ee               mov ax, word ptr [bp - 0x12]
6:6BC8  8946e4               mov word ptr [bp - 0x1c], ax
6:6BCB  8b46e8               mov ax, word ptr [bp - 0x18]
6:6BCE  48                   dec ax
6:6BCF  7902                 jns 0x6bd3
6:6BD1  33c0                 xor ax, ax
loc_6BD3:
6:6BD3  8946e2               mov word ptr [bp - 0x1e], ax
6:6BD6  8b4ee8               mov cx, word ptr [bp - 0x18]
6:6BD9  41                   inc cx
6:6BDA  8b56fe               mov dx, word ptr [bp - 2]
6:6BDD  4a                   dec dx
6:6BDE  3bca                 cmp cx, dx
6:6BE0  7e02                 jle 0x6be4
6:6BE2  8bca                 mov cx, dx
loc_6BE4:
6:6BE4  894ee0               mov word ptr [bp - 0x20], cx
6:6BE7  8b4ee6               mov cx, word ptr [bp - 0x1a]
6:6BEA  49                   dec cx
6:6BEB  7902                 jns 0x6bef
6:6BED  33c9                 xor cx, cx
loc_6BEF:
6:6BEF  894ede               mov word ptr [bp - 0x22], cx
6:6BF2  8b5ee6               mov bx, word ptr [bp - 0x1a]
6:6BF5  43                   inc bx
6:6BF6  3bda                 cmp bx, dx
6:6BF8  7e02                 jle 0x6bfc
6:6BFA  8bda                 mov bx, dx
loc_6BFC:
6:6BFC  895edc               mov word ptr [bp - 0x24], bx
6:6BFF  50                   push ax
6:6C00  51                   push cx
6:6C01  ff76e4               push word ptr [bp - 0x1c]
6:6C04  8d46cc               lea ax, [bp - 0x34]
6:6C07  16                   push ss
6:6C08  50                   push ax
6:6C09  9a543e316c           lcall 0x6c31, 0x3e54  ; sub_s2:3E54
6:6C0E  66ff76f0             push dword ptr [bp - 0x10]
6:6C12  8d46cc               lea ax, [bp - 0x34]
6:6C15  16                   push ss
6:6C16  50                   push ax
6:6C17  66ff7606             push dword ptr [bp + 6]
6:6C1B  90                   nop
6:6C1C  0e                   push cs
6:6C1D  e80401               call 0x6d24  ; sub_s6:6D24
6:6C20  ff76e8               push word ptr [bp - 0x18]
6:6C23  ff76de               push word ptr [bp - 0x22]
6:6C26  ff76e4               push word ptr [bp - 0x1c]
6:6C29  8d46cc               lea ax, [bp - 0x34]
6:6C2C  16                   push ss
6:6C2D  50                   push ax
6:6C2E  9a543e546c           lcall 0x6c54, 0x3e54  ; sub_s2:3E54
6:6C33  66ff76f0             push dword ptr [bp - 0x10]
6:6C37  8d46cc               lea ax, [bp - 0x34]
6:6C3A  16                   push ss
6:6C3B  50                   push ax
6:6C3C  66ff7606             push dword ptr [bp + 6]
6:6C40  90                   nop
6:6C41  0e                   push cs
6:6C42  e8df00               call 0x6d24  ; sub_s6:6D24
6:6C45  66ff76de             push dword ptr [bp - 0x22]
6:6C49  ff76e4               push word ptr [bp - 0x1c]
6:6C4C  8d46cc               lea ax, [bp - 0x34]
6:6C4F  16                   push ss
6:6C50  50                   push ax
6:6C51  9a543e776c           lcall 0x6c77, 0x3e54  ; sub_s2:3E54
6:6C56  66ff76f0             push dword ptr [bp - 0x10]
6:6C5A  8d46cc               lea ax, [bp - 0x34]
6:6C5D  16                   push ss
6:6C5E  50                   push ax
6:6C5F  66ff7606             push dword ptr [bp + 6]
6:6C63  90                   nop
6:6C64  0e                   push cs
6:6C65  e8bc00               call 0x6d24  ; sub_s6:6D24
6:6C68  ff76e2               push word ptr [bp - 0x1e]
6:6C6B  66ff76e4             push dword ptr [bp - 0x1c]
6:6C6F  8d46cc               lea ax, [bp - 0x34]
6:6C72  16                   push ss
6:6C73  50                   push ax
6:6C74  9a543e9a6c           lcall 0x6c9a, 0x3e54  ; sub_s2:3E54
6:6C79  66ff76f0             push dword ptr [bp - 0x10]
6:6C7D  8d46cc               lea ax, [bp - 0x34]
6:6C80  16                   push ss
6:6C81  50                   push ax
6:6C82  66ff7606             push dword ptr [bp + 6]
6:6C86  90                   nop
6:6C87  0e                   push cs
6:6C88  e89900               call 0x6d24  ; sub_s6:6D24
6:6C8B  ff76e0               push word ptr [bp - 0x20]
6:6C8E  66ff76e4             push dword ptr [bp - 0x1c]
6:6C92  8d46cc               lea ax, [bp - 0x34]
6:6C95  16                   push ss
6:6C96  50                   push ax
6:6C97  9a543ebf6c           lcall 0x6cbf, 0x3e54  ; sub_s2:3E54
6:6C9C  66ff76f0             push dword ptr [bp - 0x10]
6:6CA0  8d46cc               lea ax, [bp - 0x34]
6:6CA3  16                   push ss
6:6CA4  50                   push ax
6:6CA5  66ff7606             push dword ptr [bp + 6]
6:6CA9  90                   nop
6:6CAA  0e                   push cs
6:6CAB  e87600               call 0x6d24  ; sub_s6:6D24
6:6CAE  ff76e2               push word ptr [bp - 0x1e]
6:6CB1  ff76dc               push word ptr [bp - 0x24]
6:6CB4  ff76e4               push word ptr [bp - 0x1c]
6:6CB7  8d46cc               lea ax, [bp - 0x34]
6:6CBA  16                   push ss
6:6CBB  50                   push ax
6:6CBC  9a543ee46c           lcall 0x6ce4, 0x3e54  ; sub_s2:3E54
6:6CC1  66ff76f0             push dword ptr [bp - 0x10]
6:6CC5  8d46cc               lea ax, [bp - 0x34]
6:6CC8  16                   push ss
6:6CC9  50                   push ax
6:6CCA  66ff7606             push dword ptr [bp + 6]
6:6CCE  90                   nop
6:6CCF  0e                   push cs
6:6CD0  e85100               call 0x6d24  ; sub_s6:6D24
6:6CD3  ff76e8               push word ptr [bp - 0x18]
6:6CD6  ff76dc               push word ptr [bp - 0x24]
6:6CD9  ff76e4               push word ptr [bp - 0x1c]
6:6CDC  8d46cc               lea ax, [bp - 0x34]
6:6CDF  16                   push ss
6:6CE0  50                   push ax
6:6CE1  9a543e096d           lcall 0x6d09, 0x3e54  ; sub_s2:3E54
6:6CE6  66ff76f0             push dword ptr [bp - 0x10]
6:6CEA  8d46cc               lea ax, [bp - 0x34]
6:6CED  16                   push ss
6:6CEE  50                   push ax
6:6CEF  66ff7606             push dword ptr [bp + 6]
6:6CF3  90                   nop
6:6CF4  0e                   push cs
6:6CF5  e82c00               call 0x6d24  ; sub_s6:6D24
6:6CF8  ff76e0               push word ptr [bp - 0x20]
6:6CFB  ff76dc               push word ptr [bp - 0x24]
6:6CFE  ff76e4               push word ptr [bp - 0x1c]
6:6D01  8d46cc               lea ax, [bp - 0x34]
6:6D04  16                   push ss
6:6D05  50                   push ax
6:6D06  9a543eb66a           lcall 0x6ab6, 0x3e54  ; sub_s2:3E54
6:6D0B  66ff76f0             push dword ptr [bp - 0x10]
6:6D0F  8d46cc               lea ax, [bp - 0x34]
6:6D12  16                   push ss
6:6D13  50                   push ax
6:6D14  66ff7606             push dword ptr [bp + 6]
6:6D18  90                   nop
6:6D19  0e                   push cs
6:6D1A  e80700               call 0x6d24  ; sub_s6:6D24
6:6D1D  5e                   pop si
6:6D1E  5f                   pop di
6:6D1F  c9                   leave
6:6D20  ca0400               retf 4
6:6D23  db 00

; ---------------- sub_s6:6D24 FAR size=134 callers=1
6:6D24  c81c0000             enter 0x1c, 0
6:6D28  8d46f8               lea ax, [bp - 8]
6:6D2B  16                   push ss
6:6D2C  50                   push ax
6:6D2D  66ff760e             push dword ptr [bp + 0xe]
6:6D31  66ff760a             push dword ptr [bp + 0xa]
6:6D35  66ff364057           push dword ptr [0x5740]
6:6D3A  9ace64796d           lcall 0x6d79, 0x64ce  ; sub_s7:64CE
6:6D3F  8bd8                 mov bx, ax
6:6D41  8ec2                 mov es, dx
6:6D43  66268b07             mov eax, dword ptr es:[bx]
6:6D47  268b5702             mov dx, word ptr es:[bx + 2]
6:6D4B  668946fc             mov dword ptr [bp - 4], eax
6:6D4F  668946ee             mov dword ptr [bp - 0x12], eax
6:6D53  668946e4             mov dword ptr [bp - 0x1c], eax
6:6D57  8a46e7               mov al, byte ptr [bp - 0x19]
6:6D5A  2ae4                 sub ah, ah
6:6D5C  a8ff                 test al, 0xff
6:6D5E  7445                 je 0x6da5
6:6D60  52                   push dx
6:6D61  ff76fc               push word ptr [bp - 4]
6:6D64  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:6D69  90                   nop
6:6D6A  0e                   push cs
6:6D6B  e87e74               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:6D6E  8946e4               mov word ptr [bp - 0x1c], ax
6:6D71  8956e6               mov word ptr [bp - 0x1a], dx
6:6D74  52                   push dx
6:6D75  50                   push ax
6:6D76  9aa873aa69           lcall 0x69aa, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:6D7B  8946e8               mov word ptr [bp - 0x18], ax
6:6D7E  8956ea               mov word ptr [bp - 0x16], dx
6:6D81  c45ee8               les bx, ptr [bp - 0x18]
6:6D84  268b470c             mov ax, word ptr es:[bx + 0xc]
6:6D88  48                   dec ax
6:6D89  7c11                 jl 0x6d9c
6:6D8B  700f                 jo 0x6d9c
6:6D8D  2d0800               sub ax, 8
6:6D90  7e13                 jle 0x6da5
6:6D92  2d6a00               sub ax, 0x6a
6:6D95  7c05                 jl 0x6d9c
6:6D97  2d0600               sub ax, 6
6:6D9A  7e09                 jle 0x6da5
loc_6D9C:
6:6D9C  52                   push dx
6:6D9D  53                   push bx
6:6D9E  26c41f               les bx, ptr es:[bx]
6:6DA1  26ff5f24             lcall es:[bx + 0x24]
loc_6DA5:
6:6DA5  c9                   leave
6:6DA6  ca0c00               retf 0xc
6:6DA9  db 00

; ---------------- sub_s6:6DAA FAR size=122 callers=1
6:6DAA  c81a0000             enter 0x1a, 0
6:6DAE  57                   push di
6:6DAF  56                   push si
6:6DB0  c45e06               les bx, ptr [bp + 6]
6:6DB3  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:6DB9  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:6DBE  90                   nop
6:6DBF  0e                   push cs
6:6DC0  e82974               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:6DC3  8946fc               mov word ptr [bp - 4], ax
6:6DC6  8956fe               mov word ptr [bp - 2], dx
6:6DC9  52                   push dx
6:6DCA  50                   push ax
6:6DCB  90                   nop
6:6DCC  0e                   push cs
6:6DCD  e82247               call 0xb4f2  ; sub_s6:B4F2
6:6DD0  8946f8               mov word ptr [bp - 8], ax
6:6DD3  8956fa               mov word ptr [bp - 6], dx
6:6DD6  c45ef8               les bx, ptr [bp - 8]
6:6DD9  66268b4708           mov eax, dword ptr es:[bx + 8]
6:6DDE  668946f4             mov dword ptr [bp - 0xc], eax
6:6DE2  6650                 push eax
6:6DE4  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:6DE9  90                   nop
6:6DEA  0e                   push cs
6:6DEB  e8fe73               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:6DEE  8946f0               mov word ptr [bp - 0x10], ax
6:6DF1  8956f2               mov word ptr [bp - 0xe], dx
6:6DF4  52                   push dx
6:6DF5  50                   push ax
6:6DF6  9a5c5b3d6d           lcall 0x6d3d, 0x5b5c  ; sub_s7:5B5C
6:6DFB  1e                   push ds
6:6DFC  8d7eea               lea di, [bp - 0x16]
6:6DFF  8bf0                 mov si, ax
6:6E01  16                   push ss
6:6E02  07                   pop es
6:6E03  8eda                 mov ds, dx
6:6E05  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:6E07  a5                   movsw word ptr es:[di], word ptr [si]
6:6E08  1f                   pop ds
6:6E09  8d46ea               lea ax, [bp - 0x16]
6:6E0C  8946e6               mov word ptr [bp - 0x1a], ax
6:6E0F  66ff760e             push dword ptr [bp + 0xe]
6:6E13  66ff760a             push dword ptr [bp + 0xa]
6:6E17  16                   push ss
6:6E18  50                   push ax
6:6E19  9a943e0c6c           lcall 0x6c0c, 0x3e94  ; sub_s2:3E94
6:6E1E  5e                   pop si
6:6E1F  5f                   pop di
6:6E20  c9                   leave
6:6E21  ca0c00               retf 0xc

; ---------------- sub_s6:6E24 size=60 callers=0
6:6E24  c80c0000             enter 0xc, 0
6:6E28  c45e06               les bx, ptr [bp + 6]
6:6E2B  26c7079a38           mov word ptr es:[bx], 0x389a
6:6E30  26c747021c6e         mov word ptr es:[bx + 2], 0x6e1c  ; SEGMENT s2:0000
6:6E36  f6460a01             test byte ptr [bp + 0xa], 1
6:6E3A  7409                 je 0x6e45
6:6E3C  66ff7606             push dword ptr [bp + 6]
6:6E40  9ace17e06a           lcall 0x6ae0, 0x17ce  ; operator_delete@s1:17CE
loc_6E45:
6:6E45  8b4606               mov ax, word ptr [bp + 6]
6:6E48  8b5608               mov dx, word ptr [bp + 8]
6:6E4B  c9                   leave
6:6E4C  ca0600               retf 6
6:6E4F  db 00 24 6e 56 6e 2c 6b 5a 6e 28 d2 21 6b 1a 4f 43
6:6E5F  db 6e

; ---------------- SCConstruct@s6:6E60 FAR size=54 callers=1
6:6E60  55                   push bp
6:6E61  8bec                 mov bp, sp
6:6E63  68c732               push 0x32c7
6:6E66  66ff7606             push dword ptr [bp + 6]
6:6E6A  90                   nop
6:6E6B  0e                   push cs
6:6E6C  e86d63               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:6E6F  c45e06               les bx, ptr [bp + 6]
6:6E72  26c707b06f           mov word ptr es:[bx], 0x6fb0
6:6E77  26c74702526e         mov word ptr es:[bx + 2], 0x6e52  ; SEGMENT s6:0000
6:6E7D  1e                   push ds
6:6E7E  68dc4f               push 0x4fdc  ; 'SCConstruct'
6:6E81  8d4708               lea ax, [bx + 8]
6:6E84  06                   push es
6:6E85  50                   push ax
6:6E86  9a3e3d5e6e           lcall 0x6e5e, 0x3d3e  ; _fstrcpy@s1:3D3E
6:6E8B  8b4606               mov ax, word ptr [bp + 6]
6:6E8E  8b5608               mov dx, word ptr [bp + 8]
6:6E91  c9                   leave
6:6E92  ca0400               retf 4
6:6E95  db 00

; ---------------- SCConstruct::calcMe@s6:6E96 FAR size=96 callers=0
6:6E96  c8220000             enter 0x22, 0
6:6E9A  666800000007         push 0x7000000
6:6EA0  6a01                 push 1
6:6EA2  8d46ee               lea ax, [bp - 0x12]
6:6EA5  16                   push ss
6:6EA6  50                   push ax
6:6EA7  90                   nop
6:6EA8  0e                   push cs
6:6EA9  e8a66d               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_6EAC:
6:6EAC  8d46ee               lea ax, [bp - 0x12]
6:6EAF  16                   push ss
6:6EB0  50                   push ax
6:6EB1  90                   nop
6:6EB2  0e                   push cs
6:6EB3  e83676               call 0xe4ec  ; DbIter::next@s6:E4EC
6:6EB6  8946ea               mov word ptr [bp - 0x16], ax
6:6EB9  8956ec               mov word ptr [bp - 0x14], dx
6:6EBC  0bd0                 or dx, ax
6:6EBE  7420                 je 0x6ee0
6:6EC0  c45eea               les bx, ptr [bp - 0x16]
6:6EC3  268b4712             mov ax, word ptr es:[bx + 0x12]
6:6EC7  8946e8               mov word ptr [bp - 0x18], ax
6:6ECA  48                   dec ax
6:6ECB  7cdf                 jl 0x6eac
6:6ECD  70dd                 jo 0x6eac
6:6ECF  2d0300               sub ax, 3
6:6ED2  7fd8                 jg 0x6eac
6:6ED4  06                   push es
6:6ED5  53                   push bx
6:6ED6  26c41f               les bx, ptr es:[bx]
6:6ED9  26ff5f38             lcall es:[bx + 0x38]
6:6EDD  ebcd                 jmp 0x6eac
6:6EDF  db 90
loc_6EE0:
6:6EE0  c746e20100           mov word ptr [bp - 0x1e], 1
6:6EE5  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:6EEA  c746f0346e           mov word ptr [bp - 0x10], 0x6e34  ; SEGMENT s2:0000
6:6EEF  8b46e2               mov ax, word ptr [bp - 0x1e]
6:6EF2  c9                   leave
6:6EF3  ca0400               retf 4

; ---------------- SCConstruct::clone@s6:6EF6 size=142 callers=0
6:6EF6  c8200000             enter 0x20, 0
6:6EFA  57                   push di
6:6EFB  56                   push si
6:6EFC  680801               push 0x108
6:6EFF  9a9c17896e           lcall 0x6e89, 0x179c  ; operator_new@s1:179C
6:6F04  83c402               add sp, 2
6:6F07  8946f8               mov word ptr [bp - 8], ax
6:6F0A  8956fa               mov word ptr [bp - 6], dx
6:6F0D  0bd0                 or dx, ax
6:6F0F  745f                 je 0x6f70
6:6F11  c45ef8               les bx, ptr [bp - 8]
6:6F14  26c7079a38           mov word ptr es:[bx], 0x389a
6:6F19  26c74702ed6e         mov word ptr es:[bx + 2], 0x6eed  ; SEGMENT s2:0000
6:6F1F  c45e06               les bx, ptr [bp + 6]
6:6F22  66268b4704           mov eax, dword ptr es:[bx + 4]
6:6F27  c45ef8               les bx, ptr [bp - 8]
6:6F2A  6626894704           mov dword ptr es:[bx + 4], eax
6:6F2F  8b4606               mov ax, word ptr [bp + 6]
6:6F32  8b5608               mov dx, word ptr [bp + 8]
6:6F35  050800               add ax, 8
6:6F38  1e                   push ds
6:6F39  8d7f08               lea di, [bx + 8]
6:6F3C  8bf0                 mov si, ax
6:6F3E  8eda                 mov ds, dx
6:6F40  66b940000000         mov ecx, 0x40
6:6F46  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:6F49  1f                   pop ds
6:6F4A  c45ef8               les bx, ptr [bp - 8]
6:6F4D  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:6F52  26c74702646f         mov word ptr es:[bx + 2], 0x6f64  ; SEGMENT s6:0000
6:6F58  c45ef8               les bx, ptr [bp - 8]
6:6F5B  26c707b06f           mov word ptr es:[bx], 0x6fb0
6:6F60  26c747027b6e         mov word ptr es:[bx + 2], 0x6e7b  ; SEGMENT s6:0000
6:6F66  668b46f8             mov eax, dword ptr [bp - 8]
6:6F6A  668946fc             mov dword ptr [bp - 4], eax
6:6F6E  eb08                 jmp 0x6f78
loc_6F70:
6:6F70  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_6F78:
6:6F78  8b46fc               mov ax, word ptr [bp - 4]
6:6F7B  8b56fe               mov dx, word ptr [bp - 2]
6:6F7E  5e                   pop si
6:6F7F  5f                   pop di
6:6F80  c9                   leave
6:6F81  ca0400               retf 4

; ---------------- SCConstruct::dtor@s6:6F84 size=60 callers=0
6:6F84  c80c0000             enter 0xc, 0
6:6F88  c45e06               les bx, ptr [bp + 6]
6:6F8B  26c7079a38           mov word ptr es:[bx], 0x389a
6:6F90  26c747021d6f         mov word ptr es:[bx + 2], 0x6f1d  ; SEGMENT s2:0000
6:6F96  f6460a01             test byte ptr [bp + 0xa], 1
6:6F9A  7409                 je 0x6fa5
6:6F9C  66ff7606             push dword ptr [bp + 6]
6:6FA0  9ace17026f           lcall 0x6f02, 0x17ce  ; operator_delete@s1:17CE
loc_6FA5:
6:6FA5  8b4606               mov ax, word ptr [bp + 6]
6:6FA8  8b5608               mov dx, word ptr [bp + 8]
6:6FAB  c9                   leave
6:6FAC  ca0600               retf 6
6:6FAF  db 00 84 6f b6 6f 96 6e ba 6f 28 d2 be 6f f6 6e 56
6:6FBF  db 6f

; ---------------- SCEndSim@s6:6FC0 FAR size=54 callers=1
6:6FC0  55                   push bp
6:6FC1  8bec                 mov bp, sp
6:6FC3  68e703               push 0x3e7
6:6FC6  66ff7606             push dword ptr [bp + 6]
6:6FCA  90                   nop
6:6FCB  0e                   push cs
6:6FCC  e80d62               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:6FCF  c45e06               les bx, ptr [bp + 6]
6:6FD2  26c7079e74           mov word ptr es:[bx], 0x749e
6:6FD7  26c74702b26f         mov word ptr es:[bx + 2], 0x6fb2  ; SEGMENT s6:0000
6:6FDD  1e                   push ds
6:6FDE  68ea4f               push 0x4fea  ; 'SCEndSim'
6:6FE1  8d4708               lea ax, [bx + 8]
6:6FE4  06                   push es
6:6FE5  50                   push ax
6:6FE6  9a3e3da36f           lcall 0x6fa3, 0x3d3e  ; _fstrcpy@s1:3D3E
6:6FEB  8b4606               mov ax, word ptr [bp + 6]
6:6FEE  8b5608               mov dx, word ptr [bp + 8]
6:6FF1  c9                   leave
6:6FF2  ca0400               retf 4
6:6FF5  db 00

; ---------------- SCEndSim::calcMe@s6:6FF6 FAR size=904 callers=0
6:6FF6  c8460000             enter 0x46, 0
6:6FFA  666800000004         push 0x4000000
6:7000  6a01                 push 1
6:7002  8d46ee               lea ax, [bp - 0x12]
6:7005  16                   push ss
6:7006  50                   push ax
6:7007  90                   nop
6:7008  0e                   push cs
6:7009  e8466c               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
6:700C  c746e80100           mov word ptr [bp - 0x18], 1
6:7011  c746e60000           mov word ptr [bp - 0x1a], 0
loc_7016:
6:7016  8d46ee               lea ax, [bp - 0x12]
6:7019  16                   push ss
6:701A  50                   push ax
6:701B  90                   nop
6:701C  0e                   push cs
6:701D  e8cc74               call 0xe4ec  ; DbIter::next@s6:E4EC
6:7020  8946ea               mov word ptr [bp - 0x16], ax
6:7023  8956ec               mov word ptr [bp - 0x14], dx
6:7026  0bd0                 or dx, ax
6:7028  743c                 je 0x7066
6:702A  c45eea               les bx, ptr [bp - 0x16]
6:702D  2683bffe0100         cmp word ptr es:[bx + 0x1fe], 0
6:7033  74e1                 je 0x7016
6:7035  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:703F  74d5                 je 0x7016
6:7041  c746e60100           mov word ptr [bp - 0x1a], 1
6:7046  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:704C  668946dc             mov dword ptr [bp - 0x24], eax
6:7050  6650                 push eax
6:7052  9ab838b771           lcall 0x71b7, 0x38b8  ; sub_s7:38B8
6:7057  0bd2                 or dx, dx
6:7059  7cbb                 jl 0x7016
6:705B  7f04                 jg 0x7061
6:705D  0bc0                 or ax, ax
6:705F  74b5                 je 0x7016
loc_7061:
6:7061  c746e80000           mov word ptr [bp - 0x18], 0
loc_7066:
6:7066  837efe00             cmp word ptr [bp - 2], 0
6:706A  7406                 je 0x7072
6:706C  b80100               mov ax, 1
6:706F  99                   cdq
6:7070  eb06                 jmp 0x7078
loc_7072:
6:7072  8b46fa               mov ax, word ptr [bp - 6]
6:7075  8b56fc               mov dx, word ptr [bp - 4]
loc_7078:
6:7078  8946f6               mov word ptr [bp - 0xa], ax
6:707B  8956f8               mov word ptr [bp - 8], dx
6:707E  c746e40000           mov word ptr [bp - 0x1c], 0
loc_7083:
6:7083  8d46ee               lea ax, [bp - 0x12]
6:7086  16                   push ss
6:7087  50                   push ax
6:7088  90                   nop
6:7089  0e                   push cs
6:708A  e85f74               call 0xe4ec  ; DbIter::next@s6:E4EC
6:708D  8946ea               mov word ptr [bp - 0x16], ax
6:7090  8956ec               mov word ptr [bp - 0x14], dx
6:7093  0bd0                 or dx, ax
6:7095  7417                 je 0x70ae
6:7097  c45eea               les bx, ptr [bp - 0x16]
6:709A  662681bf000201000008 cmp dword ptr es:[bx + 0x200], 0x8000001
6:70A4  75dd                 jne 0x7083
6:70A6  c746e40100           mov word ptr [bp - 0x1c], 1
6:70AB  ebd6                 jmp 0x7083
6:70AD  db 90
loc_70AE:
6:70AE  837ee400             cmp word ptr [bp - 0x1c], 0
6:70B2  0f85aa00             jne 0x7160
6:70B6  666801000004         push 0x4000001
6:70BC  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:70C1  90                   nop
6:70C2  0e                   push cs
6:70C3  e82671               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:70C6  8946ea               mov word ptr [bp - 0x16], ax
6:70C9  8956ec               mov word ptr [bp - 0x14], dx
6:70CC  0bd0                 or dx, ax
6:70CE  0f848e00             je 0x7160
6:70D2  c706e84f0100         mov word ptr [0x4fe8], 1
6:70D8  666800000100         push 0x10000
6:70DE  6a2b                 push 0x2b
6:70E0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:70E5  9aba20f570           lcall 0x70f5, 0x20ba  ; sub_s3:20BA
6:70EA  8946ce               mov word ptr [bp - 0x32], ax
6:70ED  8956d0               mov word ptr [bp - 0x30], dx
6:70F0  52                   push dx
6:70F1  50                   push ax
6:70F2  9a9e080471           lcall 0x7104, 0x89e  ; sub_s3:089E
6:70F7  666800000200         push 0x20000
6:70FD  66ff76ce             push dword ptr [bp - 0x32]
6:7101  9a9e081371           lcall 0x7113, 0x89e  ; sub_s3:089E
6:7106  666800000300         push 0x30000
6:710C  66ff76ce             push dword ptr [bp - 0x32]
6:7110  9a9e082271           lcall 0x7122, 0x89e  ; sub_s3:089E
6:7115  666800000400         push 0x40000
6:711B  66ff76ce             push dword ptr [bp - 0x32]
6:711F  9a9e083171           lcall 0x7131, 0x89e  ; sub_s3:089E
6:7124  666800000500         push 0x50000
6:712A  66ff76ce             push dword ptr [bp - 0x32]
6:712E  9a9e084071           lcall 0x7140, 0x89e  ; sub_s3:089E
6:7133  666800000700         push 0x70000
6:7139  66ff76ce             push dword ptr [bp - 0x32]
6:713D  9a9e084f71           lcall 0x714f, 0x89e  ; sub_s3:089E
6:7142  666800000800         push 0x80000
6:7148  66ff76ce             push dword ptr [bp - 0x32]
6:714C  9a9e085e71           lcall 0x715e, 0x89e  ; sub_s3:089E
6:7151  666800000a00         push 0xa0000
6:7157  66ff76ce             push dword ptr [bp - 0x32]
6:715B  9a9e088371           lcall 0x7183, 0x89e  ; sub_s3:089E
loc_7160:
6:7160  837ee600             cmp word ptr [bp - 0x1a], 0
6:7164  742c                 je 0x7192
6:7166  837ee800             cmp word ptr [bp - 0x18], 0
6:716A  7426                 je 0x7192
6:716C  666800000600         push 0x60000
6:7172  666a01               push 1
6:7175  666a00               push 0
6:7178  666a37               push 0x37
6:717B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7180  9aba20c472           lcall 0x72c4, 0x20ba  ; sub_s3:20BA
6:7185  8946ce               mov word ptr [bp - 0x32], ax
6:7188  8956d0               mov word ptr [bp - 0x30], dx
6:718B  52                   push dx
6:718C  50                   push ax
6:718D  9ae4a0d172           lcall 0x72d1, 0xa0e4  ; sub_s2:A0E4
loc_7192:
6:7192  666801000008         push 0x8000001
6:7198  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:719D  90                   nop
6:719E  0e                   push cs
6:719F  e84a70               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:71A2  8946e0               mov word ptr [bp - 0x20], ax
6:71A5  8956e2               mov word ptr [bp - 0x1e], dx
6:71A8  0bd0                 or dx, ax
6:71AA  0f842501             je 0x72d3
6:71AE  6a04                 push 4
6:71B0  ff76e2               push word ptr [bp - 0x1e]
6:71B3  50                   push ax
6:71B4  9a4222c871           lcall 0x71c8, 0x2242  ; sub_s7:2242
6:71B9  0bc0                 or ax, ax
6:71BB  0f851401             jne 0x72d3
6:71BF  6a2a                 push 0x2a
6:71C1  66ff76e0             push dword ptr [bp - 0x20]
6:71C5  9a4222d971           lcall 0x71d9, 0x2242  ; sub_s7:2242
6:71CA  0bc0                 or ax, ax
6:71CC  0f850301             jne 0x72d3
6:71D0  6a4b                 push 0x4b
6:71D2  66ff76e0             push dword ptr [bp - 0x20]
6:71D6  9a4222ea71           lcall 0x71ea, 0x2242  ; sub_s7:2242
6:71DB  0bc0                 or ax, ax
6:71DD  0f85f200             jne 0x72d3
6:71E1  6a54                 push 0x54
6:71E3  66ff76e0             push dword ptr [bp - 0x20]
6:71E7  9a4222fb71           lcall 0x71fb, 0x2242  ; sub_s7:2242
6:71EC  0bc0                 or ax, ax
6:71EE  0f85e100             jne 0x72d3
6:71F2  6a2c                 push 0x2c
6:71F4  66ff76e0             push dword ptr [bp - 0x20]
6:71F8  9a42220c72           lcall 0x720c, 0x2242  ; sub_s7:2242
6:71FD  0bc0                 or ax, ax
6:71FF  0f85d000             jne 0x72d3
6:7203  6a3c                 push 0x3c
6:7205  66ff76e0             push dword ptr [bp - 0x20]
6:7209  9a42221d72           lcall 0x721d, 0x2242  ; sub_s7:2242
6:720E  0bc0                 or ax, ax
6:7210  0f85bf00             jne 0x72d3
6:7214  6a3d                 push 0x3d
6:7216  66ff76e0             push dword ptr [bp - 0x20]
6:721A  9a4222f96d           lcall 0x6df9, 0x2242  ; sub_s7:2242
6:721F  0bc0                 or ax, ax
6:7221  0f85ae00             jne 0x72d3
6:7225  3946fe               cmp word ptr [bp - 2], ax
6:7228  7406                 je 0x7230
6:722A  b80100               mov ax, 1
6:722D  99                   cdq
6:722E  eb06                 jmp 0x7236
loc_7230:
6:7230  8b46fa               mov ax, word ptr [bp - 6]
6:7233  8b56fc               mov dx, word ptr [bp - 4]
loc_7236:
6:7236  8946f6               mov word ptr [bp - 0xa], ax
6:7239  8956f8               mov word ptr [bp - 8], dx
6:723C  33c0                 xor ax, ax
6:723E  8946ce               mov word ptr [bp - 0x32], ax
6:7241  8946d2               mov word ptr [bp - 0x2e], ax
loc_7244:
6:7244  8d46ee               lea ax, [bp - 0x12]
6:7247  16                   push ss
6:7248  50                   push ax
6:7249  90                   nop
6:724A  0e                   push cs
6:724B  e89e72               call 0xe4ec  ; DbIter::next@s6:E4EC
6:724E  8946ea               mov word ptr [bp - 0x16], ax
6:7251  8956ec               mov word ptr [bp - 0x14], dx
6:7254  0bd0                 or dx, ax
6:7256  747b                 je 0x72d3
6:7258  c45eea               les bx, ptr [bp - 0x16]
6:725B  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:7265  74dd                 je 0x7244
6:7267  837ece00             cmp word ptr [bp - 0x32], 0
6:726B  7516                 jne 0x7283
6:726D  06                   push es
6:726E  50                   push ax
6:726F  6a22                 push 0x22
6:7271  66ff7606             push dword ptr [bp + 6]
6:7275  90                   nop
6:7276  0e                   push cs
6:7277  e89201               call 0x740c  ; sub_s6:740C
6:727A  0bc0                 or ax, ax
6:727C  7405                 je 0x7283
6:727E  c746ce0100           mov word ptr [bp - 0x32], 1
loc_7283:
6:7283  837ed200             cmp word ptr [bp - 0x2e], 0
6:7287  7518                 jne 0x72a1
6:7289  66ff76ea             push dword ptr [bp - 0x16]
6:728D  6a24                 push 0x24
6:728F  66ff7606             push dword ptr [bp + 6]
6:7293  90                   nop
6:7294  0e                   push cs
6:7295  e87401               call 0x740c  ; sub_s6:740C
6:7298  0bc0                 or ax, ax
6:729A  7405                 je 0x72a1
6:729C  c746d20100           mov word ptr [bp - 0x2e], 1
loc_72A1:
6:72A1  837ece00             cmp word ptr [bp - 0x32], 0
6:72A5  749d                 je 0x7244
6:72A7  837ed200             cmp word ptr [bp - 0x2e], 0
6:72AB  7497                 je 0x7244
6:72AD  666800001400         push 0x140000
6:72B3  666a01               push 1
6:72B6  666a00               push 0
6:72B9  666a37               push 0x37
6:72BC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:72C1  9aba20f772           lcall 0x72f7, 0x20ba  ; sub_s3:20BA
6:72C6  8946dc               mov word ptr [bp - 0x24], ax
6:72C9  8956de               mov word ptr [bp - 0x22], dx
6:72CC  52                   push dx
6:72CD  50                   push ax
6:72CE  9ae4a00473           lcall 0x7304, 0xa0e4  ; sub_s2:A0E4
loc_72D3:
6:72D3  666801000004         push 0x4000001
6:72D9  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:72DE  90                   nop
6:72DF  0e                   push cs
6:72E0  e8096f               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:72E3  8946ea               mov word ptr [bp - 0x16], ax
6:72E6  8956ec               mov word ptr [bp - 0x14], dx
6:72E9  0bd0                 or dx, ax
6:72EB  747b                 je 0x7368
6:72ED  6a3b                 push 0x3b
6:72EF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:72F4  9aba201073           lcall 0x7310, 0x20ba  ; sub_s3:20BA
6:72F9  8946d2               mov word ptr [bp - 0x2e], ax
6:72FC  8956d4               mov word ptr [bp - 0x2c], dx
6:72FF  52                   push dx
6:7300  50                   push ax
6:7301  9a4adf6673           lcall 0x7366, 0xdf4a  ; sub_s2:DF4A
6:7306  6a3c                 push 0x3c
6:7308  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:730D  9aba204451           lcall 0x5144, 0x20ba  ; sub_s3:20BA
6:7312  8946d2               mov word ptr [bp - 0x2e], ax
6:7315  8956d4               mov word ptr [bp - 0x2c], dx
6:7318  52                   push dx
6:7319  50                   push ax
6:731A  9aa6342e67           lcall 0x672e, 0x34a6  ; sub_s4:34A6
6:731F  666800000004         push 0x4000000
6:7325  6a01                 push 1
6:7327  8d46bc               lea ax, [bp - 0x44]
6:732A  16                   push ss
6:732B  50                   push ax
6:732C  90                   nop
6:732D  0e                   push cs
6:732E  e82169               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_7331:
6:7331  8d46bc               lea ax, [bp - 0x44]
6:7334  16                   push ss
6:7335  50                   push ax
6:7336  90                   nop
6:7337  0e                   push cs
6:7338  e8b171               call 0xe4ec  ; DbIter::next@s6:E4EC
6:733B  8946ce               mov word ptr [bp - 0x32], ax
6:733E  8956d0               mov word ptr [bp - 0x30], dx
6:7341  0bd0                 or dx, ax
6:7343  7419                 je 0x735e
6:7345  c45ece               les bx, ptr [bp - 0x32]
6:7348  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:7352  74dd                 je 0x7331
6:7354  06                   push es
6:7355  50                   push ax
6:7356  9aa03b5a69           lcall 0x695a, 0x3ba0  ; sub_s8:3BA0
6:735B  ebd4                 jmp 0x7331
6:735D  db 90
loc_735E:
6:735E  c746bc9a38           mov word ptr [bp - 0x44], 0x389a
6:7363  c746be7573           mov word ptr [bp - 0x42], 0x7375  ; SEGMENT s2:0000
loc_7368:
6:7368  c746ba0100           mov word ptr [bp - 0x46], 1
6:736D  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:7372  c746f0946f           mov word ptr [bp - 0x10], 0x6f94  ; SEGMENT s2:0000
6:7377  8b46ba               mov ax, word ptr [bp - 0x46]
6:737A  c9                   leave
6:737B  ca0400               retf 4

; ---------------- SCEndSim::clone@s6:737E size=142 callers=0
6:737E  c8200000             enter 0x20, 0
6:7382  57                   push di
6:7383  56                   push si
6:7384  680801               push 0x108
6:7387  9a9c17e96f           lcall 0x6fe9, 0x179c  ; operator_new@s1:179C
6:738C  83c402               add sp, 2
6:738F  8946f8               mov word ptr [bp - 8], ax
6:7392  8956fa               mov word ptr [bp - 6], dx
6:7395  0bd0                 or dx, ax
6:7397  745f                 je 0x73f8
6:7399  c45ef8               les bx, ptr [bp - 8]
6:739C  26c7079a38           mov word ptr es:[bx], 0x389a
6:73A1  26c747029071         mov word ptr es:[bx + 2], 0x7190  ; SEGMENT s2:0000
6:73A7  c45e06               les bx, ptr [bp + 6]
6:73AA  66268b4704           mov eax, dword ptr es:[bx + 4]
6:73AF  c45ef8               les bx, ptr [bp - 8]
6:73B2  6626894704           mov dword ptr es:[bx + 4], eax
6:73B7  8b4606               mov ax, word ptr [bp + 6]
6:73BA  8b5608               mov dx, word ptr [bp + 8]
6:73BD  050800               add ax, 8
6:73C0  1e                   push ds
6:73C1  8d7f08               lea di, [bx + 8]
6:73C4  8bf0                 mov si, ax
6:73C6  8eda                 mov ds, dx
6:73C8  66b940000000         mov ecx, 0x40
6:73CE  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:73D1  1f                   pop ds
6:73D2  c45ef8               les bx, ptr [bp - 8]
6:73D5  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:73DA  26c74702ec73         mov word ptr es:[bx + 2], 0x73ec  ; SEGMENT s6:0000
6:73E0  c45ef8               les bx, ptr [bp - 8]
6:73E3  26c7079e74           mov word ptr es:[bx], 0x749e
6:73E8  26c74702db6f         mov word ptr es:[bx + 2], 0x6fdb  ; SEGMENT s6:0000
6:73EE  668b46f8             mov eax, dword ptr [bp - 8]
6:73F2  668946fc             mov dword ptr [bp - 4], eax
6:73F6  eb08                 jmp 0x7400
loc_73F8:
6:73F8  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_7400:
6:7400  8b46fc               mov ax, word ptr [bp - 4]
6:7403  8b56fe               mov dx, word ptr [bp - 2]
6:7406  5e                   pop si
6:7407  5f                   pop di
6:7408  c9                   leave
6:7409  ca0400               retf 4

; ---------------- sub_s6:740C FAR size=102 callers=1
6:740C  c8140000             enter 0x14, 0
6:7410  57                   push di
6:7411  56                   push si
6:7412  ff760a               push word ptr [bp + 0xa]
6:7415  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:741A  9afac6a573           lcall 0x73a5, 0xc6fa  ; sub_s2:C6FA
6:741F  52                   push dx
6:7420  50                   push ax
6:7421  66ff760c             push dword ptr [bp + 0xc]
6:7425  9a6e4d5973           lcall 0x7359, 0x4d6e  ; sub_s8:4D6E
6:742A  8946f8               mov word ptr [bp - 8], ax
6:742D  8956fa               mov word ptr [bp - 6], dx
6:7430  52                   push dx
6:7431  c45ef8               les bx, ptr [bp - 8]
6:7434  50                   push ax
6:7435  26c41f               les bx, ptr es:[bx]
6:7438  8bf3                 mov si, bx
6:743A  8cc7                 mov di, es
6:743C  26ff5f10             lcall es:[bx + 0x10]
6:7440  8946f4               mov word ptr [bp - 0xc], ax
6:7443  8956f6               mov word ptr [bp - 0xa], dx
6:7446  668b46f8             mov eax, dword ptr [bp - 8]
6:744A  660bc0               or eax, eax
6:744D  740b                 je 0x745a
6:744F  6a01                 push 1
6:7451  ff76fa               push word ptr [bp - 6]
6:7454  50                   push ax
6:7455  8ec7                 mov es, di
6:7457  26ff1c               lcall es:[si]
loc_745A:
6:745A  66837ef400           cmp dword ptr [bp - 0xc], 0
6:745F  7409                 je 0x746a
6:7461  b80100               mov ax, 1
6:7464  5e                   pop si
6:7465  5f                   pop di
6:7466  c9                   leave
6:7467  ca0a00               retf 0xa
loc_746A:
6:746A  33c0                 xor ax, ax
6:746C  5e                   pop si
6:746D  5f                   pop di
6:746E  c9                   leave
6:746F  ca0a00               retf 0xa

; ---------------- SCEndSim::dtor@s6:7472 size=60 callers=0
6:7472  c80c0000             enter 0xc, 0
6:7476  c45e06               les bx, ptr [bp + 6]
6:7479  26c7079a38           mov word ptr es:[bx], 0x389a
6:747E  26c747021d74         mov word ptr es:[bx + 2], 0x741d  ; SEGMENT s2:0000
6:7484  f6460a01             test byte ptr [bp + 0xa], 1
6:7488  7409                 je 0x7493
6:748A  66ff7606             push dword ptr [bp + 6]
6:748E  9ace178a73           lcall 0x738a, 0x17ce  ; operator_delete@s1:17CE
loc_7493:
6:7493  8b4606               mov ax, word ptr [bp + 6]
6:7496  8b5608               mov dx, word ptr [bp + 8]
6:7499  c9                   leave
6:749A  ca0600               retf 6
6:749D  db 00 72 74 a4 74 f6 6f a8 74 28 d2 ac 74 7e 73 de
6:74AD  db 73

; ---------------- SCEvent@s6:74AE FAR size=54 callers=1
6:74AE  55                   push bp
6:74AF  8bec                 mov bp, sp
6:74B1  688713               push 0x1387
6:74B4  66ff7606             push dword ptr [bp + 6]
6:74B8  90                   nop
6:74B9  0e                   push cs
6:74BA  e81f5d               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:74BD  c45e06               les bx, ptr [bp + 6]
6:74C0  26c7079a81           mov word ptr es:[bx], 0x819a
6:74C5  26c74702a074         mov word ptr es:[bx + 2], 0x74a0  ; SEGMENT s6:0000
6:74CB  1e                   push ds
6:74CC  68f44f               push 0x4ff4  ; 'SCEvent'
6:74CF  8d4708               lea ax, [bx + 8]
6:74D2  06                   push es
6:74D3  50                   push ax
6:74D4  9a3e3d9174           lcall 0x7491, 0x3d3e  ; _fstrcpy@s1:3D3E
6:74D9  8b4606               mov ax, word ptr [bp + 6]
6:74DC  8b5608               mov dx, word ptr [bp + 8]
6:74DF  c9                   leave
6:74E0  ca0400               retf 4
6:74E3  db 00

; ---------------- SCEvent::calcMe@s6:74E4 FAR size=74 callers=0
6:74E4  55                   push bp
6:74E5  8bec                 mov bp, sp
6:74E7  66ff7606             push dword ptr [bp + 6]
6:74EB  90                   nop
6:74EC  0e                   push cs
6:74ED  e8c60a               call 0x7fb6  ; sub_s6:7FB6
6:74F0  66ff7606             push dword ptr [bp + 6]
6:74F4  90                   nop
6:74F5  0e                   push cs
6:74F6  e85507               call 0x7c4e  ; sub_s6:7C4E
6:74F9  66ff7606             push dword ptr [bp + 6]
6:74FD  90                   nop
6:74FE  0e                   push cs
6:74FF  e8fa08               call 0x7dfc  ; sub_s6:7DFC
6:7502  66ff7606             push dword ptr [bp + 6]
6:7506  90                   nop
6:7507  0e                   push cs
6:7508  e8cf01               call 0x76da  ; sub_s6:76DA
6:750B  66ff7606             push dword ptr [bp + 6]
6:750F  90                   nop
6:7510  0e                   push cs
6:7511  e86a01               call 0x767e  ; sub_s6:767E
6:7514  66ff7606             push dword ptr [bp + 6]
6:7518  90                   nop
6:7519  0e                   push cs
6:751A  e89f00               call 0x75bc  ; sub_s6:75BC
6:751D  66ff7606             push dword ptr [bp + 6]
6:7521  90                   nop
6:7522  0e                   push cs
6:7523  e89203               call 0x78b8  ; sub_s6:78B8
6:7526  b80100               mov ax, 1
6:7529  c9                   leave
6:752A  ca0400               retf 4
6:752D  db 00

; ---------------- SCEvent::clone@s6:752E FAR size=142 callers=0
6:752E  c8200000             enter 0x20, 0
6:7532  57                   push di
6:7533  56                   push si
6:7534  680801               push 0x108
6:7537  9a9c17d774           lcall 0x74d7, 0x179c  ; operator_new@s1:179C
6:753C  83c402               add sp, 2
6:753F  8946f8               mov word ptr [bp - 8], ax
6:7542  8956fa               mov word ptr [bp - 6], dx
6:7545  0bd0                 or dx, ax
6:7547  745f                 je 0x75a8
6:7549  c45ef8               les bx, ptr [bp - 8]
6:754C  26c7079a38           mov word ptr es:[bx], 0x389a
6:7551  26c747028274         mov word ptr es:[bx + 2], 0x7482  ; SEGMENT s2:0000
6:7557  c45e06               les bx, ptr [bp + 6]
6:755A  66268b4704           mov eax, dword ptr es:[bx + 4]
6:755F  c45ef8               les bx, ptr [bp - 8]
6:7562  6626894704           mov dword ptr es:[bx + 4], eax
6:7567  8b4606               mov ax, word ptr [bp + 6]
6:756A  8b5608               mov dx, word ptr [bp + 8]
6:756D  050800               add ax, 8
6:7570  1e                   push ds
6:7571  8d7f08               lea di, [bx + 8]
6:7574  8bf0                 mov si, ax
6:7576  8eda                 mov ds, dx
6:7578  66b940000000         mov ecx, 0x40
6:757E  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:7581  1f                   pop ds
6:7582  c45ef8               les bx, ptr [bp - 8]
6:7585  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:758A  26c747029c75         mov word ptr es:[bx + 2], 0x759c  ; SEGMENT s6:0000
6:7590  c45ef8               les bx, ptr [bp - 8]
6:7593  26c7079a81           mov word ptr es:[bx], 0x819a
6:7598  26c74702c974         mov word ptr es:[bx + 2], 0x74c9  ; SEGMENT s6:0000
6:759E  668b46f8             mov eax, dword ptr [bp - 8]
6:75A2  668946fc             mov dword ptr [bp - 4], eax
6:75A6  eb08                 jmp 0x75b0
loc_75A8:
6:75A8  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_75B0:
6:75B0  8b46fc               mov ax, word ptr [bp - 4]
6:75B3  8b56fe               mov dx, word ptr [bp - 2]
6:75B6  5e                   pop si
6:75B7  5f                   pop di
6:75B8  c9                   leave
6:75B9  ca0400               retf 4

; ---------------- sub_s6:75BC FAR size=194 callers=1
6:75BC  c8220000             enter 0x22, 0
6:75C0  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:75C4  66268b07             mov eax, dword ptr es:[bx]
6:75C8  668946fc             mov dword ptr [bp - 4], eax
6:75CC  66b97b000000         mov ecx, 0x7b
6:75D2  6633d2               xor edx, edx
6:75D5  66f7f1               div ecx
6:75D8  668bc2               mov eax, edx
6:75DB  66c1ea10             shr edx, 0x10
6:75DF  0bd0                 or dx, ax
6:75E1  0f859500             jne 0x767a
6:75E5  66817efc96000000     cmp dword ptr [bp - 4], 0x96
6:75ED  0f828900             jb 0x767a
6:75F1  666800000004         push 0x4000000
6:75F7  6a01                 push 1
6:75F9  8d46ea               lea ax, [bp - 0x16]
6:75FC  16                   push ss
6:75FD  50                   push ax
6:75FE  90                   nop
6:75FF  0e                   push cs
6:7600  e84f66               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_7603:
6:7603  8d46ea               lea ax, [bp - 0x16]
6:7606  16                   push ss
6:7607  50                   push ax
6:7608  90                   nop
6:7609  0e                   push cs
6:760A  e8df6e               call 0xe4ec  ; DbIter::next@s6:E4EC
6:760D  8946e6               mov word ptr [bp - 0x1a], ax
6:7610  8956e8               mov word ptr [bp - 0x18], dx
6:7613  0bd0                 or dx, ax
6:7615  7421                 je 0x7638
6:7617  666801006400         push 0x640001
6:761D  9a2e617876           lcall 0x7678, 0x612e  ; sub_s2:612E
6:7622  83c404               add sp, 4
6:7625  8946e2               mov word ptr [bp - 0x1e], ax
6:7628  3d0500               cmp ax, 5
6:762B  7fd6                 jg 0x7603
6:762D  66ff76e6             push dword ptr [bp - 0x1a]
6:7631  9a2e366b76           lcall 0x766b, 0x362e  ; sub_s8:362E
6:7636  ebcb                 jmp 0x7603
loc_7638:
6:7638  837efa00             cmp word ptr [bp - 6], 0
6:763C  7406                 je 0x7644
6:763E  b80100               mov ax, 1
6:7641  99                   cdq
6:7642  eb06                 jmp 0x764a
loc_7644:
6:7644  8b46f6               mov ax, word ptr [bp - 0xa]
6:7647  8b56f8               mov dx, word ptr [bp - 8]
loc_764A:
6:764A  8946f2               mov word ptr [bp - 0xe], ax
6:764D  8956f4               mov word ptr [bp - 0xc], dx
loc_7650:
6:7650  8d46ea               lea ax, [bp - 0x16]
6:7653  16                   push ss
6:7654  50                   push ax
6:7655  90                   nop
6:7656  0e                   push cs
6:7657  e8926e               call 0xe4ec  ; DbIter::next@s6:E4EC
6:765A  8946e6               mov word ptr [bp - 0x1a], ax
6:765D  8956e8               mov word ptr [bp - 0x18], dx
6:7660  0bd0                 or dx, ax
6:7662  740c                 je 0x7670
6:7664  ff76e8               push word ptr [bp - 0x18]
6:7667  50                   push ax
6:7668  9a98362874           lcall 0x7428, 0x3698  ; sub_s8:3698
6:766D  ebe1                 jmp 0x7650
6:766F  db 90
loc_7670:
6:7670  c746ea9a38           mov word ptr [bp - 0x16], 0x389a
6:7675  c746ec5575           mov word ptr [bp - 0x14], 0x7555  ; SEGMENT s2:0000
loc_767A:
6:767A  c9                   leave
6:767B  ca0400               retf 4

; ---------------- sub_s6:767E FAR size=92 callers=1
6:767E  c8120000             enter 0x12, 0
6:7682  666801000008         push 0x8000001
6:7688  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:768D  90                   nop
6:768E  0e                   push cs
6:768F  e85a6b               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:7692  8946fc               mov word ptr [bp - 4], ax
6:7695  8956fe               mov word ptr [bp - 2], dx
6:7698  c45efc               les bx, ptr [bp - 4]
6:769B  2683bf520100         cmp word ptr es:[bx + 0x152], 0
6:76A1  7432                 je 0x76d5
6:76A3  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:76A7  66268b07             mov eax, dword ptr es:[bx]
6:76AB  66b964000000         mov ecx, 0x64
6:76B1  6633d2               xor edx, edx
6:76B4  66f7f1               div ecx
6:76B7  668bc2               mov eax, edx
6:76BA  66c1ea10             shr edx, 0x10
6:76BE  0bd0                 or dx, ax
6:76C0  7513                 jne 0x76d5
6:76C2  6a40                 push 0x40
6:76C4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:76C9  9aba20e870           lcall 0x70e8, 0x20ba  ; sub_s3:20BA
6:76CE  52                   push dx
6:76CF  50                   push ax
6:76D0  9a8ab72076           lcall 0x7620, 0xb78a  ; sub_s2:B78A
loc_76D5:
6:76D5  c9                   leave
6:76D6  ca0400               retf 4
6:76D9  db 00

; ---------------- sub_s6:76DA FAR size=104 callers=1
;   apis: USER.PostMessage
6:76DA  c8180000             enter 0x18, 0
6:76DE  6a2c                 push 0x2c
6:76E0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:76E5  9aba20cc76           lcall 0x76cc, 0x20ba  ; sub_s3:20BA
6:76EA  8946fc               mov word ptr [bp - 4], ax
6:76ED  8956fe               mov word ptr [bp - 2], dx
6:76F0  c45efc               les bx, ptr [bp - 4]
6:76F3  66268b470c           mov eax, dword ptr es:[bx + 0xc]
6:76F8  668946f8             mov dword ptr [bp - 8], eax
6:76FC  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:7700  66268b07             mov eax, dword ptr es:[bx]
6:7704  268b5702             mov dx, word ptr es:[bx + 2]
6:7708  668946f4             mov dword ptr [bp - 0xc], eax
6:770C  8b46fa               mov ax, word ptr [bp - 6]
6:770F  0b46f8               or ax, word ptr [bp - 8]
6:7712  742a                 je 0x773e
6:7714  668b46f8             mov eax, dword ptr [bp - 8]
6:7718  8b56fa               mov dx, word ptr [bp - 6]
6:771B  663946f4             cmp dword ptr [bp - 0xc], eax
6:771F  751d                 jne 0x773e
6:7721  ff369603             push word ptr [0x396]
6:7725  666806011101         push 0x1110106
6:772B  666a00               push 0
6:772E  9affff0000           lcall 0, 0xffff  ; USER.PostMessage
6:7733  c45efc               les bx, ptr [bp - 4]
6:7736  662bc0               sub eax, eax
6:7739  662689470c           mov dword ptr es:[bx + 0xc], eax
loc_773E:
6:773E  c9                   leave
6:773F  ca0400               retf 4

; ---------------- sub_s6:7742 FAR size=202 callers=3
6:7742  c8260000             enter 0x26, 0
6:7746  6a18                 push 0x18
6:7748  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:774D  9afac6d376           lcall 0x76d3, 0xc6fa  ; sub_s2:C6FA
6:7752  8946fc               mov word ptr [bp - 4], ax
6:7755  8956fe               mov word ptr [bp - 2], dx
6:7758  52                   push dx
6:7759  50                   push ax
6:775A  66ff760c             push dword ptr [bp + 0xc]
6:775E  90                   nop
6:775F  0e                   push cs
6:7760  e88f3d               call 0xb4f2  ; sub_s6:B4F2
6:7763  8946f8               mov word ptr [bp - 8], ax
6:7766  8956fa               mov word ptr [bp - 6], dx
6:7769  52                   push dx
6:776A  50                   push ax
6:776B  9a6e4d3476           lcall 0x7634, 0x4d6e  ; sub_s8:4D6E
6:7770  8946f4               mov word ptr [bp - 0xc], ax
6:7773  8956f6               mov word ptr [bp - 0xa], dx
6:7776  c746f20000           mov word ptr [bp - 0xe], 0
6:777B  52                   push dx
6:777C  c45ef4               les bx, ptr [bp - 0xc]
6:777F  50                   push ax
6:7780  26c41f               les bx, ptr es:[bx]
6:7783  26ff5f10             lcall es:[bx + 0x10]
6:7787  8946ee               mov word ptr [bp - 0x12], ax
6:778A  8956f0               mov word ptr [bp - 0x10], dx
6:778D  8d46ec               lea ax, [bp - 0x14]
6:7790  16                   push ss
6:7791  50                   push ax
6:7792  9aaebcbb77           lcall 0x77bb, 0xbcae  ; sub_s7:BCAE
6:7797  66c746e800000000     mov dword ptr [bp - 0x18], 0
6:779F  eb05                 jmp 0x77a6
6:77A1  db 90
loc_77A2:
6:77A2  66ff46e8             inc dword ptr [bp - 0x18]
loc_77A6:
6:77A6  668b46ee             mov eax, dword ptr [bp - 0x12]
6:77AA  663946e8             cmp dword ptr [bp - 0x18], eax
6:77AE  7337                 jae 0x77e7
6:77B0  66ff76e8             push dword ptr [bp - 0x18]
6:77B4  66ff76f4             push dword ptr [bp - 0xc]
6:77B8  9a581dd877           lcall 0x77d8, 0x1d58  ; sub_s7:1D58
6:77BD  8946e4               mov word ptr [bp - 0x1c], ax
6:77C0  8956e6               mov word ptr [bp - 0x1a], dx
6:77C3  52                   push dx
6:77C4  50                   push ax
6:77C5  66ff760c             push dword ptr [bp + 0xc]
6:77C9  90                   nop
6:77CA  0e                   push cs
6:77CB  e8c03d               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:77CE  52                   push dx
6:77CF  50                   push ax
6:77D0  8d46ec               lea ax, [bp - 0x14]
6:77D3  16                   push ss
6:77D4  50                   push ax
6:77D5  9a74bd5570           lcall 0x7055, 0xbd74  ; sub_s7:BD74
6:77DA  8946e2               mov word ptr [bp - 0x1e], ax
6:77DD  3b460a               cmp ax, word ptr [bp + 0xa]
6:77E0  7fc0                 jg 0x77a2
6:77E2  c746f20100           mov word ptr [bp - 0xe], 1
loc_77E7:
6:77E7  668b46f4             mov eax, dword ptr [bp - 0xc]
6:77EB  668946da             mov dword ptr [bp - 0x26], eax
6:77EF  668946de             mov dword ptr [bp - 0x22], eax
6:77F3  660bc0               or eax, eax
6:77F6  740d                 je 0x7805
6:77F8  6a01                 push 1
6:77FA  c45ef4               les bx, ptr [bp - 0xc]
6:77FD  06                   push es
6:77FE  50                   push ax
6:77FF  26c41f               les bx, ptr es:[bx]
6:7802  26ff1f               lcall es:[bx]
loc_7805:
6:7805  8b46f2               mov ax, word ptr [bp - 0xe]
6:7808  c9                   leave
6:7809  ca0a00               retf 0xa

; ---------------- sub_s6:780C FAR size=172 callers=1
6:780C  c8240000             enter 0x24, 0
6:7810  6a25                 push 0x25
6:7812  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:7817  9afac65077           lcall 0x7750, 0xc6fa  ; sub_s2:C6FA
6:781C  52                   push dx
6:781D  50                   push ax
6:781E  66ff760a             push dword ptr [bp + 0xa]
6:7822  9a784e6e77           lcall 0x776e, 0x4e78  ; sub_s8:4E78
6:7827  8946f8               mov word ptr [bp - 8], ax
6:782A  8956fa               mov word ptr [bp - 6], dx
6:782D  52                   push dx
6:782E  c45ef8               les bx, ptr [bp - 8]
6:7831  50                   push ax
6:7832  26c41f               les bx, ptr es:[bx]
6:7835  26ff5f10             lcall es:[bx + 0x10]
6:7839  8946f4               mov word ptr [bp - 0xc], ax
6:783C  8956f6               mov word ptr [bp - 0xa], dx
6:783F  0bd0                 or dx, ax
6:7841  7507                 jne 0x784a
6:7843  33c0                 xor ax, ax
6:7845  c9                   leave
6:7846  ca0800               retf 8
6:7849  db 90
loc_784A:
6:784A  66c746f000000000     mov dword ptr [bp - 0x10], 0
6:7852  eb04                 jmp 0x7858
loc_7854:
6:7854  66ff46f0             inc dword ptr [bp - 0x10]
loc_7858:
6:7858  668b46f4             mov eax, dword ptr [bp - 0xc]
6:785C  663946f0             cmp dword ptr [bp - 0x10], eax
6:7860  7338                 jae 0x789a
6:7862  66ff76f0             push dword ptr [bp - 0x10]
6:7866  c45ef8               les bx, ptr [bp - 8]
6:7869  06                   push es
6:786A  53                   push bx
6:786B  26c41f               les bx, ptr es:[bx]
6:786E  26ff5f04             lcall es:[bx + 4]
6:7872  52                   push dx
6:7873  50                   push ax
6:7874  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:7879  90                   nop
6:787A  0e                   push cs
6:787B  e86e69               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:787E  52                   push dx
6:787F  50                   push ax
6:7880  9aa8739577           lcall 0x7795, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:7885  8946e4               mov word ptr [bp - 0x1c], ax
6:7888  8956e6               mov word ptr [bp - 0x1a], dx
6:788B  52                   push dx
6:788C  c45ee4               les bx, ptr [bp - 0x1c]
6:788F  50                   push ax
6:7890  26c41f               les bx, ptr es:[bx]
6:7893  26ff5f24             lcall es:[bx + 0x24]
6:7897  ebbb                 jmp 0x7854
6:7899  db 90
loc_789A:
6:789A  668b46f8             mov eax, dword ptr [bp - 8]
6:789E  660bc0               or eax, eax
6:78A1  740d                 je 0x78b0
6:78A3  6a01                 push 1
6:78A5  c45ef8               les bx, ptr [bp - 8]
6:78A8  06                   push es
6:78A9  50                   push ax
6:78AA  26c41f               les bx, ptr es:[bx]
6:78AD  26ff1f               lcall es:[bx]
loc_78B0:
6:78B0  b80100               mov ax, 1
6:78B3  c9                   leave
6:78B4  ca0800               retf 8
6:78B7  db 00

; ---------------- sub_s6:78B8 FAR size=918 callers=1
6:78B8  c8560100             enter 0x156, 0
6:78BC  56                   push si
6:78BD  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:78C1  66268b07             mov eax, dword ptr es:[bx]
6:78C5  668946fc             mov dword ptr [bp - 4], eax
6:78C9  663d98000000         cmp eax, 0x98
6:78CF  7564                 jne 0x7935
6:78D1  666802000004         push 0x4000002
6:78D7  06                   push es
6:78D8  53                   push bx
6:78D9  90                   nop
6:78DA  0e                   push cs
6:78DB  e80e69               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:78DE  8946f2               mov word ptr [bp - 0xe], ax
6:78E1  8956f4               mov word ptr [bp - 0xc], dx
6:78E4  c45ef2               les bx, ptr [bp - 0xe]
6:78E7  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:78F1  7542                 jne 0x7935
6:78F3  8d46ea               lea ax, [bp - 0x16]
6:78F6  16                   push ss
6:78F7  50                   push ax
6:78F8  9a3ea41679           lcall 0x7916, 0xa43e  ; sub_s5:A43E
6:78FD  8d46e4               lea ax, [bp - 0x1c]
6:7900  16                   push ss
6:7901  50                   push ax
6:7902  9a383e8779           lcall 0x7987, 0x3e38  ; sub_s2:3E38
6:7907  6a7a                 push 0x7a
6:7909  8d46e4               lea ax, [bp - 0x1c]
6:790C  16                   push ss
6:790D  50                   push ax
6:790E  8d46ea               lea ax, [bp - 0x16]
6:7911  16                   push ss
6:7912  50                   push ax
6:7913  9a9aa43379           lcall 0x7933, 0xa49a  ; sub_s5:A49A
6:7918  6a01                 push 1
6:791A  66ff76f2             push dword ptr [bp - 0xe]
6:791E  9a544fd479           lcall 0x79d4, 0x4f54  ; sub_s8:4F54
6:7923  0bc0                 or ax, ax
6:7925  750e                 jne 0x7935
6:7927  6a35                 push 0x35  ; 'New failed in Op::Op->ResLibr'
6:7929  50                   push ax
6:792A  50                   push ax
6:792B  8d46ea               lea ax, [bp - 0x16]
6:792E  16                   push ss
6:792F  50                   push ax
6:7930  9a9aa44b79           lcall 0x794b, 0xa49a  ; sub_s5:A49A
loc_7935:
6:7935  66837efc0f           cmp dword ptr [bp - 4], 0xf
6:793A  722a                 jb 0x7966
6:793C  66837efc15           cmp dword ptr [bp - 4], 0x15
6:7941  7723                 ja 0x7966
6:7943  8d46e4               lea ax, [bp - 0x1c]
6:7946  16                   push ss
6:7947  50                   push ax
6:7948  9a3ea46479           lcall 0x7964, 0xa43e  ; sub_s5:A43E
6:794D  668b46fc             mov eax, dword ptr [bp - 4]
6:7951  662d0f000000         sub eax, 0xf
6:7957  668946ea             mov dword ptr [bp - 0x16], eax
6:795B  50                   push ax
6:795C  8d46e4               lea ax, [bp - 0x1c]
6:795F  16                   push ss
6:7960  50                   push ax
6:7961  9a4ca5ea47           lcall 0x47ea, 0xa54c  ; sub_s5:A54C
loc_7966:
6:7966  668b46fc             mov eax, dword ptr [bp - 4]
6:796A  66b97d000000         mov ecx, 0x7d
6:7970  6633d2               xor edx, edx
6:7973  66f7f1               div ecx
6:7976  668bc2               mov eax, edx
6:7979  660bc0               or eax, eax
6:797C  7562                 jne 0x79e0
6:797E  666801006400         push 0x640001
6:7984  9a2e61de79           lcall 0x79de, 0x612e  ; sub_s2:612E
6:7989  83c404               add sp, 4
6:798C  8946e4               mov word ptr [bp - 0x1c], ax
6:798F  3d1900               cmp ax, 0x19
6:7992  7f4c                 jg 0x79e0
6:7994  666800000004         push 0x4000000
6:799A  6a01                 push 1
6:799C  8d46d2               lea ax, [bp - 0x2e]
6:799F  16                   push ss
6:79A0  50                   push ax
6:79A1  90                   nop
6:79A2  0e                   push cs
6:79A3  e8ac62               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_79A6:
6:79A6  8d46d2               lea ax, [bp - 0x2e]
6:79A9  16                   push ss
6:79AA  50                   push ax
6:79AB  90                   nop
6:79AC  0e                   push cs
6:79AD  e83c6b               call 0xe4ec  ; DbIter::next@s6:E4EC
6:79B0  8946ea               mov word ptr [bp - 0x16], ax
6:79B3  8956ec               mov word ptr [bp - 0x14], dx
6:79B6  0bd0                 or dx, ax
6:79B8  741c                 je 0x79d6
6:79BA  c45eea               les bx, ptr [bp - 0x16]
6:79BD  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:79C7  74dd                 je 0x79a6
6:79C9  666801000400         push 0x40001
6:79CF  06                   push es
6:79D0  50                   push ax
6:79D1  9acc43067a           lcall 0x7a06, 0x43cc  ; sub_s8:43CC
loc_79D6:
6:79D6  c746d29a38           mov word ptr [bp - 0x2e], 0x389a
6:79DB  c746d4c37a           mov word ptr [bp - 0x2c], 0x7ac3  ; SEGMENT s2:0000
loc_79E0:
6:79E0  66837efc05           cmp dword ptr [bp - 4], 5
6:79E5  7521                 jne 0x7a08
6:79E7  1e                   push ds
6:79E8  68fc4f               push 0x4ffc  ; 'Rebel'
6:79EB  666802000004         push 0x4000002
6:79F1  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:79F6  90                   nop
6:79F7  0e                   push cs
6:79F8  e8f167               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:79FB  8946d2               mov word ptr [bp - 0x2e], ax
6:79FE  8956d4               mov word ptr [bp - 0x2c], dx
6:7A01  52                   push dx
6:7A02  50                   push ax
6:7A03  9a3c4d2578           lcall 0x7825, 0x4d3c  ; sub_s8:4D3C
loc_7A08:
6:7A08  66817efc2c010000     cmp dword ptr [bp - 4], 0x12c
6:7A10  7523                 jne 0x7a35
6:7A12  666800040f00         push 0xf0400
6:7A18  66682b000100         push 0x1002b
6:7A1E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7A23  9aba20337a           lcall 0x7a33, 0x20ba  ; sub_s3:20BA
6:7A28  8946d2               mov word ptr [bp - 0x2e], ax
6:7A2B  8956d4               mov word ptr [bp - 0x2c], dx
6:7A2E  52                   push dx
6:7A2F  50                   push ax
6:7A30  9a3a04487a           lcall 0x7a48, 0x43a  ; sub_s3:043A
loc_7A35:
6:7A35  66837efc3d           cmp dword ptr [bp - 4], 0x3d
6:7A3A  0f858700             jne 0x7ac5
6:7A3E  6a02                 push 2
6:7A40  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7A45  9aba20ac7a           lcall 0x7aac, 0x20ba  ; sub_s3:20BA
6:7A4A  8946d2               mov word ptr [bp - 0x2e], ax
6:7A4D  8956d4               mov word ptr [bp - 0x2c], dx
6:7A50  a1ae13               mov ax, word ptr [0x13ae]
6:7A53  8946e4               mov word ptr [bp - 0x1c], ax
6:7A56  3d0100               cmp ax, 1
6:7A59  746a                 je 0x7ac5
6:7A5B  666800000004         push 0x4000000
6:7A61  6a01                 push 1
6:7A63  8d46c0               lea ax, [bp - 0x40]
6:7A66  16                   push ss
6:7A67  50                   push ax
6:7A68  90                   nop
6:7A69  0e                   push cs
6:7A6A  e8e561               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_7A6D:
6:7A6D  8d46c0               lea ax, [bp - 0x40]
6:7A70  16                   push ss
6:7A71  50                   push ax
6:7A72  90                   nop
6:7A73  0e                   push cs
6:7A74  e8756a               call 0xe4ec  ; DbIter::next@s6:E4EC
6:7A77  8946ea               mov word ptr [bp - 0x16], ax
6:7A7A  8956ec               mov word ptr [bp - 0x14], dx
6:7A7D  0bd0                 or dx, ax
6:7A7F  7417                 je 0x7a98
6:7A81  c45eea               les bx, ptr [bp - 0x16]
6:7A84  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:7A8A  668946f2             mov dword ptr [bp - 0xe], eax
6:7A8E  6650                 push eax
6:7A90  9ada340a7c           lcall 0x7c0a, 0x34da  ; sub_s7:34DA
6:7A95  ebd6                 jmp 0x7a6d
6:7A97  db 90
loc_7A98:
6:7A98  666800041000         push 0x100400
6:7A9E  66682b000100         push 0x1002b
6:7AA4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7AA9  9aba20b97a           lcall 0x7ab9, 0x20ba  ; sub_s3:20BA
6:7AAE  8946ee               mov word ptr [bp - 0x12], ax
6:7AB1  8956f0               mov word ptr [bp - 0x10], dx
6:7AB4  52                   push dx
6:7AB5  50                   push ax
6:7AB6  9a3a04087b           lcall 0x7b08, 0x43a  ; sub_s3:043A
6:7ABB  c746c09a38           mov word ptr [bp - 0x40], 0x389a
6:7AC0  c746c2d57b           mov word ptr [bp - 0x3e], 0x7bd5  ; SEGMENT s2:0000
loc_7AC5:
6:7AC5  66817efc96000000     cmp dword ptr [bp - 4], 0x96
6:7ACD  7569                 jne 0x7b38
6:7ACF  666801000004         push 0x4000001
6:7AD5  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:7ADA  90                   nop
6:7ADB  0e                   push cs
6:7ADC  e80d67               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:7ADF  8946b8               mov word ptr [bp - 0x48], ax
6:7AE2  8956ba               mov word ptr [bp - 0x46], dx
6:7AE5  52                   push dx
6:7AE6  50                   push ax
6:7AE7  66ff7606             push dword ptr [bp + 6]
6:7AEB  90                   nop
6:7AEC  0e                   push cs
6:7AED  e81cfd               call 0x780c  ; sub_s6:780C
6:7AF0  0bc0                 or ax, ax
6:7AF2  7423                 je 0x7b17
6:7AF4  666800041d00         push 0x1d0400
6:7AFA  66682b000100         push 0x1002b
6:7B00  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7B05  9aba20157b           lcall 0x7b15, 0x20ba  ; sub_s3:20BA
6:7B0A  8946bc               mov word ptr [bp - 0x44], ax
6:7B0D  8956be               mov word ptr [bp - 0x42], dx
6:7B10  52                   push dx
6:7B11  50                   push ax
6:7B12  9a3a04427b           lcall 0x7b42, 0x43a  ; sub_s3:043A
loc_7B17:
6:7B17  666802000004         push 0x4000002
6:7B1D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:7B22  90                   nop
6:7B23  0e                   push cs
6:7B24  e8c566               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:7B27  8946b8               mov word ptr [bp - 0x48], ax
6:7B2A  8956ba               mov word ptr [bp - 0x46], dx
6:7B2D  52                   push dx
6:7B2E  50                   push ax
6:7B2F  66ff7606             push dword ptr [bp + 6]
6:7B33  90                   nop
6:7B34  0e                   push cs
6:7B35  e8d4fc               call 0x780c  ; sub_s6:780C
loc_7B38:
6:7B38  6a02                 push 2
6:7B3A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7B3F  9aba20617b           lcall 0x7b61, 0x20ba  ; sub_s3:20BA
6:7B44  8946f8               mov word ptr [bp - 8], ax
6:7B47  8956fa               mov word ptr [bp - 6], dx
6:7B4A  a1ae13               mov ax, word ptr [0x13ae]
6:7B4D  8946f6               mov word ptr [bp - 0xa], ax
6:7B50  3d0200               cmp ax, 2
6:7B53  0f8ef100             jle 0x7c48
6:7B57  6a2f                 push 0x2f
6:7B59  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7B5E  9aba209e7b           lcall 0x7b9e, 0x20ba  ; sub_s3:20BA
6:7B63  8946b8               mov word ptr [bp - 0x48], ax
6:7B66  8956ba               mov word ptr [bp - 0x46], dx
6:7B69  c746bc0100           mov word ptr [bp - 0x44], 1
6:7B6E  eb33                 jmp 0x7ba3
loc_7B70:
6:7B70  837ee432             cmp word ptr [bp - 0x1c], 0x32
loc_7B74:
6:7B74  7e72                 jle 0x7be8
6:7B76  c746d20000           mov word ptr [bp - 0x2e], 0
6:7B7B  eb6b                 jmp 0x7be8
6:7B7D  db 90
loc_7B7E:
6:7B7E  837ee419             cmp word ptr [bp - 0x1c], 0x19
6:7B82  ebf0                 jmp 0x7b74
loc_7B84:
6:7B84  6a07                 push 7
6:7B86  8b46ea               mov ax, word ptr [bp - 0x16]
6:7B89  056e00               add ax, 0x6e
6:7B8C  99                   cdq
loc_7B8D:
6:7B8D  0146c0               add word ptr [bp - 0x40], ax
6:7B90  1156c2               adc word ptr [bp - 0x3e], dx
6:7B93  66ff76c0             push dword ptr [bp - 0x40]
6:7B97  66ff76b8             push dword ptr [bp - 0x48]
6:7B9B  9af8ebe876           lcall 0x76e8, 0xebf8  ; sub_s3:EBF8
loc_7BA0:
6:7BA0  ff46bc               inc word ptr [bp - 0x44]
loc_7BA3:
6:7BA3  837ebc09             cmp word ptr [bp - 0x44], 9
6:7BA7  0f8d9d00             jge 0x7c48
6:7BAB  c45eb8               les bx, ptr [bp - 0x48]
6:7BAE  83c334               add bx, 0x34
6:7BB1  8b76bc               mov si, word ptr [bp - 0x44]
6:7BB4  c1e602               shl si, 2
6:7BB7  66268b00             mov eax, dword ptr es:[bx + si]
6:7BBB  668946c0             mov dword ptr [bp - 0x40], eax
6:7BBF  668b46fc             mov eax, dword ptr [bp - 4]
6:7BC3  663946c0             cmp dword ptr [bp - 0x40], eax
6:7BC7  75d7                 jne 0x7ba0
6:7BC9  6a64                 push 0x64
6:7BCB  b80100               mov ax, 1
6:7BCE  8946d2               mov word ptr [bp - 0x2e], ax
6:7BD1  50                   push ax
6:7BD2  9a2e61167c           lcall 0x7c16, 0x612e  ; sub_s2:612E
6:7BD7  83c404               add sp, 4
6:7BDA  8946e4               mov word ptr [bp - 0x1c], ax
6:7BDD  8b46bc               mov ax, word ptr [bp - 0x44]
6:7BE0  2d0700               sub ax, 7
6:7BE3  748b                 je 0x7b70
6:7BE5  48                   dec ax
6:7BE6  7496                 je 0x7b7e
loc_7BE8:
6:7BE8  837ed200             cmp word ptr [bp - 0x2e], 0
6:7BEC  742a                 je 0x7c18
6:7BEE  ff76bc               push word ptr [bp - 0x44]
6:7BF1  8d86aefe             lea ax, [bp - 0x152]
6:7BF5  16                   push ss
6:7BF6  50                   push ax
6:7BF7  90                   nop
6:7BF8  0e                   push cs
6:7BF9  e8ea14               call 0x90e6  ; sub_s6:90E6
6:7BFC  8d86aefe             lea ax, [bp - 0x152]
6:7C00  16                   push ss
6:7C01  50                   push ax
6:7C02  66ff364857           push dword ptr [0x5748]  ; g_sim
6:7C07  9a5a838378           lcall 0x7883, 0x835a  ; Sim::enqueue@s7:835A
6:7C0C  c786aefe9a38         mov word ptr [bp - 0x152], 0x389a
6:7C12  c786b0fe217c         mov word ptr [bp - 0x150], 0x7c21  ; SEGMENT s2:0000
loc_7C18:
6:7C18  666800000a00         push 0xa0000
6:7C1E  9a2e611a78           lcall 0x781a, 0x612e  ; sub_s2:612E
6:7C23  83c404               add sp, 4
6:7C26  8946ea               mov word ptr [bp - 0x16], ax
6:7C29  8b46bc               mov ax, word ptr [bp - 0x44]
6:7C2C  2d0700               sub ax, 7
6:7C2F  0f8451ff             je 0x7b84
6:7C33  48                   dec ax
6:7C34  0f8568ff             jne 0x7ba0
6:7C38  6a08                 push 8
6:7C3A  8b46ea               mov ax, word ptr [bp - 0x16]
6:7C3D  99                   cdq
6:7C3E  056400               add ax, 0x64
6:7C41  83d200               adc dx, 0
6:7C44  e946ff               jmp 0x7b8d
6:7C47  db 90
loc_7C48:
6:7C48  5e                   pop si
6:7C49  c9                   leave
6:7C4A  ca0400               retf 4
6:7C4D  db 00

; ---------------- sub_s6:7C4E FAR size=430 callers=1
6:7C4E  c8740100             enter 0x174, 0
6:7C52  6a02                 push 2
6:7C54  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7C59  9aba20267a           lcall 0x7a26, 0x20ba  ; sub_s3:20BA
6:7C5E  8946fc               mov word ptr [bp - 4], ax
6:7C61  8956fe               mov word ptr [bp - 2], dx
6:7C64  a1ae13               mov ax, word ptr [0x13ae]
6:7C67  8946fa               mov word ptr [bp - 6], ax
6:7C6A  3d0200               cmp ax, 2
6:7C6D  0f8e8701             jle 0x7df8
6:7C71  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:7C75  66268b07             mov eax, dword ptr es:[bx]
6:7C79  668946f6             mov dword ptr [bp - 0xa], eax
6:7C7D  8b56f8               mov dx, word ptr [bp - 8]
6:7C80  663d02000000         cmp eax, 2
6:7C86  0f866e01             jbe 0x7df8
6:7C8A  666a14               push 0x14
6:7C8D  2d0200               sub ax, 2
6:7C90  83da00               sbb dx, 0
6:7C93  8946f2               mov word ptr [bp - 0xe], ax
6:7C96  8956f4               mov word ptr [bp - 0xc], dx
6:7C99  52                   push dx
6:7C9A  50                   push ax
6:7C9B  6658                 pop eax
6:7C9D  6659                 pop ecx
6:7C9F  6633d2               xor edx, edx
6:7CA2  66f7f1               div ecx
6:7CA5  668bc2               mov eax, edx
6:7CA8  660bc0               or eax, eax
6:7CAB  0f854901             jne 0x7df8
6:7CAF  666800000004         push 0x4000000
6:7CB5  6a01                 push 1
6:7CB7  8d46e0               lea ax, [bp - 0x20]
6:7CBA  16                   push ss
6:7CBB  50                   push ax
6:7CBC  90                   nop
6:7CBD  0e                   push cs
6:7CBE  e8915f               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_7CC1:
6:7CC1  8d46e0               lea ax, [bp - 0x20]
6:7CC4  16                   push ss
6:7CC5  50                   push ax
6:7CC6  90                   nop
6:7CC7  0e                   push cs
6:7CC8  e82168               call 0xe4ec  ; DbIter::next@s6:E4EC
6:7CCB  8946dc               mov word ptr [bp - 0x24], ax
6:7CCE  8956de               mov word ptr [bp - 0x22], dx
6:7CD1  0bd0                 or dx, ax
6:7CD3  0f841701             je 0x7dee
6:7CD7  c45edc               les bx, ptr [bp - 0x24]
6:7CDA  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:7CE4  74db                 je 0x7cc1
6:7CE6  6a2a                 push 0x2a
6:7CE8  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:7CED  9afac6477d           lcall 0x7d47, 0xc6fa  ; sub_s2:C6FA
6:7CF2  8946d8               mov word ptr [bp - 0x28], ax
6:7CF5  8956da               mov word ptr [bp - 0x26], dx
6:7CF8  52                   push dx
6:7CF9  50                   push ax
6:7CFA  66ff76dc             push dword ptr [bp - 0x24]
6:7CFE  9a6e4d2179           lcall 0x7921, 0x4d6e  ; sub_s8:4D6E
6:7D03  8946d4               mov word ptr [bp - 0x2c], ax
6:7D06  8956d6               mov word ptr [bp - 0x2a], dx
6:7D09  52                   push dx
6:7D0A  c45ed4               les bx, ptr [bp - 0x2c]
6:7D0D  50                   push ax
6:7D0E  26c41f               les bx, ptr es:[bx]
6:7D11  26ff5f10             lcall es:[bx + 0x10]
6:7D15  8946d0               mov word ptr [bp - 0x30], ax
6:7D18  8956d2               mov word ptr [bp - 0x2e], dx
6:7D1B  837efa03             cmp word ptr [bp - 6], 3
6:7D1F  7507                 jne 0x7d28
6:7D21  c746ce0600           mov word ptr [bp - 0x32], 6
6:7D26  eb05                 jmp 0x7d2d
loc_7D28:
6:7D28  c746ce0c00           mov word ptr [bp - 0x32], 0xc
loc_7D2D:
6:7D2D  66c746ca00000000     mov dword ptr [bp - 0x36], 0
6:7D35  eb58                 jmp 0x7d8f
6:7D37  db 90
loc_7D38:
6:7D38  b81900               mov ax, 0x19
loc_7D3B:
6:7D3B  8946be               mov word ptr [bp - 0x42], ax
6:7D3E  666801006400         push 0x640001
6:7D44  9a2e61897d           lcall 0x7d89, 0x612e  ; sub_s2:612E
6:7D49  83c404               add sp, 4
6:7D4C  8946bc               mov word ptr [bp - 0x44], ax
6:7D4F  3b46be               cmp ax, word ptr [bp - 0x42]
6:7D52  7f37                 jg 0x7d8b
6:7D54  c45edc               les bx, ptr [bp - 0x24]
6:7D57  6626ff7704           push dword ptr es:[bx + 4]
6:7D5C  c45ec2               les bx, ptr [bp - 0x3e]
6:7D5F  6626ff7704           push dword ptr es:[bx + 4]
6:7D64  8d86acfe             lea ax, [bp - 0x154]
6:7D68  16                   push ss
6:7D69  50                   push ax
6:7D6A  90                   nop
6:7D6B  0e                   push cs
6:7D6C  e85112               call 0x8fc0  ; sub_s6:8FC0
6:7D6F  8d86acfe             lea ax, [bp - 0x154]
6:7D73  16                   push ss
6:7D74  50                   push ax
6:7D75  66ff364857           push dword ptr [0x5748]  ; g_sim
6:7D7A  9a5a83a47d           lcall 0x7da4, 0x835a  ; Sim::enqueue@s7:835A
6:7D7F  c786acfe9a38         mov word ptr [bp - 0x154], 0x389a
6:7D85  c786aefef67d         mov word ptr [bp - 0x152], 0x7df6  ; SEGMENT s2:0000
loc_7D8B:
6:7D8B  66ff46ca             inc dword ptr [bp - 0x36]
loc_7D8F:
6:7D8F  668b46d0             mov eax, dword ptr [bp - 0x30]
6:7D93  663946ca             cmp dword ptr [bp - 0x36], eax
6:7D97  732f                 jae 0x7dc8
6:7D99  66ff76ca             push dword ptr [bp - 0x36]
6:7D9D  66ff76d4             push dword ptr [bp - 0x2c]
6:7DA1  9a7c1d937a           lcall 0x7a93, 0x1d7c  ; sub_s7:1D7C
6:7DA6  8946c2               mov word ptr [bp - 0x3e], ax
6:7DA9  8956c4               mov word ptr [bp - 0x3c], dx
6:7DAC  52                   push dx
6:7DAD  50                   push ax
6:7DAE  6a04                 push 4
6:7DB0  66ff7606             push dword ptr [bp + 6]
6:7DB4  90                   nop
6:7DB5  0e                   push cs
6:7DB6  e889f9               call 0x7742  ; sub_s6:7742
6:7DB9  8946c0               mov word ptr [bp - 0x40], ax
6:7DBC  0bc0                 or ax, ax
6:7DBE  0f8476ff             je 0x7d38
6:7DC2  8b46ce               mov ax, word ptr [bp - 0x32]
6:7DC5  e973ff               jmp 0x7d3b
loc_7DC8:
6:7DC8  668b46d4             mov eax, dword ptr [bp - 0x2c]
6:7DCC  6689868cfe           mov dword ptr [bp - 0x174], eax
6:7DD1  66898690fe           mov dword ptr [bp - 0x170], eax
6:7DD6  660bc0               or eax, eax
6:7DD9  0f84e4fe             je 0x7cc1
6:7DDD  6a01                 push 1
6:7DDF  c45ed4               les bx, ptr [bp - 0x2c]
6:7DE2  06                   push es
6:7DE3  50                   push ax
6:7DE4  26c41f               les bx, ptr es:[bx]
6:7DE7  26ff1f               lcall es:[bx]
6:7DEA  e9d4fe               jmp 0x7cc1
6:7DED  db 90
loc_7DEE:
6:7DEE  c746e09a38           mov word ptr [bp - 0x20], 0x389a
6:7DF3  c746e20579           mov word ptr [bp - 0x1e], 0x7905  ; SEGMENT s2:0000
loc_7DF8:
6:7DF8  c9                   leave
6:7DF9  ca0400               retf 4

; ---------------- sub_s6:7DFC FAR size=442 callers=1
6:7DFC  c8760100             enter 0x176, 0
6:7E00  6a02                 push 2
6:7E02  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7E07  9aba20d47e           lcall 0x7ed4, 0x20ba  ; sub_s3:20BA
6:7E0C  8946fc               mov word ptr [bp - 4], ax
6:7E0F  8956fe               mov word ptr [bp - 2], dx
6:7E12  a1ae13               mov ax, word ptr [0x13ae]
6:7E15  8946fa               mov word ptr [bp - 6], ax
6:7E18  3d0200               cmp ax, 2
6:7E1B  0f8e9301             jle 0x7fb2
6:7E1F  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:7E23  66268b07             mov eax, dword ptr es:[bx]
6:7E27  668946f6             mov dword ptr [bp - 0xa], eax
6:7E2B  8b56f8               mov dx, word ptr [bp - 8]
6:7E2E  663d03000000         cmp eax, 3
6:7E34  0f867a01             jbe 0x7fb2
6:7E38  2d0300               sub ax, 3
6:7E3B  83da00               sbb dx, 0
6:7E3E  8946f2               mov word ptr [bp - 0xe], ax
6:7E41  8956f4               mov word ptr [bp - 0xc], dx
6:7E44  668b46f6             mov eax, dword ptr [bp - 0xa]
6:7E48  66b914000000         mov ecx, 0x14
6:7E4E  6633d2               xor edx, edx
6:7E51  66f7f1               div ecx
6:7E54  668bc2               mov eax, edx
6:7E57  660bc0               or eax, eax
6:7E5A  0f855401             jne 0x7fb2
6:7E5E  666800000004         push 0x4000000
6:7E64  6a01                 push 1
6:7E66  8d46e0               lea ax, [bp - 0x20]
6:7E69  16                   push ss
6:7E6A  50                   push ax
6:7E6B  90                   nop
6:7E6C  0e                   push cs
6:7E6D  e8e25d               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_7E70:
6:7E70  8d46e0               lea ax, [bp - 0x20]
6:7E73  16                   push ss
6:7E74  50                   push ax
6:7E75  90                   nop
6:7E76  0e                   push cs
6:7E77  e87266               call 0xe4ec  ; DbIter::next@s6:E4EC
6:7E7A  8946dc               mov word ptr [bp - 0x24], ax
6:7E7D  8956de               mov word ptr [bp - 0x22], dx
6:7E80  0bd0                 or dx, ax
6:7E82  0f842201             je 0x7fa8
6:7E86  c45edc               les bx, ptr [bp - 0x24]
6:7E89  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:7E93  74db                 je 0x7e70
6:7E95  6a29                 push 0x29
6:7E97  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:7E9C  9afac6247f           lcall 0x7f24, 0xc6fa  ; sub_s2:C6FA
6:7EA1  8946d8               mov word ptr [bp - 0x28], ax
6:7EA4  8956da               mov word ptr [bp - 0x26], dx
6:7EA7  52                   push dx
6:7EA8  50                   push ax
6:7EA9  66ff76dc             push dword ptr [bp - 0x24]
6:7EAD  9a6e4d017d           lcall 0x7d01, 0x4d6e  ; sub_s8:4D6E
6:7EB2  8946d4               mov word ptr [bp - 0x2c], ax
6:7EB5  8956d6               mov word ptr [bp - 0x2a], dx
6:7EB8  52                   push dx
6:7EB9  c45ed4               les bx, ptr [bp - 0x2c]
6:7EBC  50                   push ax
6:7EBD  26c41f               les bx, ptr es:[bx]
6:7EC0  26ff5f10             lcall es:[bx + 0x10]
6:7EC4  8946d0               mov word ptr [bp - 0x30], ax
6:7EC7  8956d2               mov word ptr [bp - 0x2e], dx
6:7ECA  6a02                 push 2
6:7ECC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:7ED1  9aba205c7c           lcall 0x7c5c, 0x20ba  ; sub_s3:20BA
6:7ED6  8946ca               mov word ptr [bp - 0x36], ax
6:7ED9  8956cc               mov word ptr [bp - 0x34], dx
6:7EDC  837efa03             cmp word ptr [bp - 6], 3
6:7EE0  7508                 jne 0x7eea
6:7EE2  c746ce0500           mov word ptr [bp - 0x32], 5
6:7EE7  eb06                 jmp 0x7eef
6:7EE9  db 90
loc_7EEA:
6:7EEA  c746ce1e00           mov word ptr [bp - 0x32], 0x1e
loc_7EEF:
6:7EEF  66c746c600000000     mov dword ptr [bp - 0x3a], 0
6:7EF7  eb05                 jmp 0x7efe
6:7EF9  db 90
loc_7EFA:
6:7EFA  66ff46c6             inc dword ptr [bp - 0x3a]
loc_7EFE:
6:7EFE  668b46d0             mov eax, dword ptr [bp - 0x30]
6:7F02  663946c6             cmp dword ptr [bp - 0x3a], eax
6:7F06  737a                 jae 0x7f82
6:7F08  66ff76c6             push dword ptr [bp - 0x3a]
6:7F0C  66ff76d4             push dword ptr [bp - 0x2c]
6:7F10  9a7c1d707f           lcall 0x7f70, 0x1d7c  ; sub_s7:1D7C
6:7F15  8946be               mov word ptr [bp - 0x42], ax
6:7F18  8956c0               mov word ptr [bp - 0x40], dx
6:7F1B  666801006400         push 0x640001
6:7F21  9a2e617c7f           lcall 0x7f7c, 0x612e  ; sub_s2:612E
6:7F26  83c404               add sp, 4
6:7F29  8946bc               mov word ptr [bp - 0x44], ax
6:7F2C  3b46ce               cmp ax, word ptr [bp - 0x32]
6:7F2F  7fc9                 jg 0x7efa
6:7F31  66ff76be             push dword ptr [bp - 0x42]
6:7F35  6a04                 push 4
6:7F37  66ff7606             push dword ptr [bp + 6]
6:7F3B  90                   nop
6:7F3C  0e                   push cs
6:7F3D  e802f8               call 0x7742  ; sub_s6:7742
6:7F40  8946ba               mov word ptr [bp - 0x46], ax
6:7F43  0bc0                 or ax, ax
6:7F45  75b3                 jne 0x7efa
6:7F47  c45edc               les bx, ptr [bp - 0x24]
6:7F4A  6626ff7704           push dword ptr es:[bx + 4]
6:7F4F  c45ebe               les bx, ptr [bp - 0x42]
6:7F52  6626ff7704           push dword ptr es:[bx + 4]
6:7F57  8d86aafe             lea ax, [bp - 0x156]
6:7F5B  16                   push ss
6:7F5C  50                   push ax
6:7F5D  90                   nop
6:7F5E  0e                   push cs
6:7F5F  e87c31               call 0xb0de  ; sub_s6:B0DE
6:7F62  8d86aafe             lea ax, [bp - 0x156]
6:7F66  16                   push ss
6:7F67  50                   push ax
6:7F68  66ff364857           push dword ptr [0x5748]  ; g_sim
6:7F6D  9a5a837d7d           lcall 0x7d7d, 0x835a  ; Sim::enqueue@s7:835A
6:7F72  c786aafe9a38         mov word ptr [bp - 0x156], 0x389a
6:7F78  c786acfeb07f         mov word ptr [bp - 0x154], 0x7fb0  ; SEGMENT s2:0000
6:7F7E  e979ff               jmp 0x7efa
6:7F81  db 90
loc_7F82:
6:7F82  668b46d4             mov eax, dword ptr [bp - 0x2c]
6:7F86  6689868afe           mov dword ptr [bp - 0x176], eax
6:7F8B  6689868efe           mov dword ptr [bp - 0x172], eax
6:7F90  660bc0               or eax, eax
6:7F93  0f84d9fe             je 0x7e70
6:7F97  6a01                 push 1
6:7F99  c45ed4               les bx, ptr [bp - 0x2c]
6:7F9C  06                   push es
6:7F9D  50                   push ax
6:7F9E  26c41f               les bx, ptr es:[bx]
6:7FA1  26ff1f               lcall es:[bx]
6:7FA4  e9c9fe               jmp 0x7e70
6:7FA7  db 90
loc_7FA8:
6:7FA8  c746e09a38           mov word ptr [bp - 0x20], 0x389a
6:7FAD  c746e2f07c           mov word ptr [bp - 0x1e], 0x7cf0  ; SEGMENT s2:0000
loc_7FB2:
6:7FB2  c9                   leave
6:7FB3  ca0400               retf 4

; ---------------- sub_s6:7FB6 FAR size=440 callers=1
6:7FB6  c8760100             enter 0x176, 0
6:7FBA  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:7FBE  66268b07             mov eax, dword ptr es:[bx]
6:7FC2  668946fc             mov dword ptr [bp - 4], eax
6:7FC6  8b56fe               mov dx, word ptr [bp - 2]
6:7FC9  663d0b000000         cmp eax, 0xb
6:7FCF  0f869701             jbe 0x816a
6:7FD3  2d0b00               sub ax, 0xb
6:7FD6  83da00               sbb dx, 0
6:7FD9  8946f8               mov word ptr [bp - 8], ax
6:7FDC  8956fa               mov word ptr [bp - 6], dx
6:7FDF  668b46fc             mov eax, dword ptr [bp - 4]
6:7FE3  66b932000000         mov ecx, 0x32
6:7FE9  6633d2               xor edx, edx
6:7FEC  66f7f1               div ecx
6:7FEF  668bc2               mov eax, edx
6:7FF2  660bc0               or eax, eax
6:7FF5  0f857101             jne 0x816a
6:7FF9  666800000004         push 0x4000000
6:7FFF  6a01                 push 1
6:8001  8d46e6               lea ax, [bp - 0x1a]
6:8004  16                   push ss
6:8005  50                   push ax
6:8006  90                   nop
6:8007  0e                   push cs
6:8008  e8475c               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_800B:
6:800B  8d46e6               lea ax, [bp - 0x1a]
6:800E  16                   push ss
6:800F  50                   push ax
6:8010  90                   nop
6:8011  0e                   push cs
6:8012  e8d764               call 0xe4ec  ; DbIter::next@s6:E4EC
6:8015  8946e2               mov word ptr [bp - 0x1e], ax
6:8018  8956e4               mov word ptr [bp - 0x1c], dx
6:801B  0bd0                 or dx, ax
6:801D  0f843f01             je 0x8160
6:8021  c45ee2               les bx, ptr [bp - 0x1e]
6:8024  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:802E  74db                 je 0x800b
6:8030  6a11                 push 0x11
6:8032  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:8037  9afac6a380           lcall 0x80a3, 0xc6fa  ; sub_s2:C6FA
6:803C  8946de               mov word ptr [bp - 0x22], ax
6:803F  8956e0               mov word ptr [bp - 0x20], dx
6:8042  52                   push dx
6:8043  50                   push ax
6:8044  66ff76e2             push dword ptr [bp - 0x1e]
6:8048  9a6e4db07e           lcall 0x7eb0, 0x4d6e  ; sub_s8:4D6E
6:804D  8946da               mov word ptr [bp - 0x26], ax
6:8050  8956dc               mov word ptr [bp - 0x24], dx
6:8053  52                   push dx
6:8054  c45eda               les bx, ptr [bp - 0x26]
6:8057  50                   push ax
6:8058  26c41f               les bx, ptr es:[bx]
6:805B  26ff5f10             lcall es:[bx + 0x10]
6:805F  8946d6               mov word ptr [bp - 0x2a], ax
6:8062  8956d8               mov word ptr [bp - 0x28], dx
6:8065  6a02                 push 2
6:8067  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:806C  9aba200a7e           lcall 0x7e0a, 0x20ba  ; sub_s3:20BA
6:8071  8946d2               mov word ptr [bp - 0x2e], ax
6:8074  8956d4               mov word ptr [bp - 0x2c], dx
6:8077  a1ae13               mov ax, word ptr [0x13ae]
6:807A  8946d0               mov word ptr [bp - 0x30], ax
6:807D  3d0200               cmp ax, 2
6:8080  7f08                 jg 0x808a
6:8082  c746ce0500           mov word ptr [bp - 0x32], 5
6:8087  eb06                 jmp 0x808f
6:8089  db 90
loc_808A:
6:808A  c746ce1400           mov word ptr [bp - 0x32], 0x14
loc_808F:
6:808F  66c746ca00000000     mov dword ptr [bp - 0x36], 0
6:8097  eb68                 jmp 0x8101
6:8099  db 90
loc_809A:
6:809A  666801006400         push 0x640001
6:80A0  9a2e61fb80           lcall 0x80fb, 0x612e  ; sub_s2:612E
6:80A5  83c404               add sp, 4
6:80A8  8946be               mov word ptr [bp - 0x42], ax
6:80AB  3b46ce               cmp ax, word ptr [bp - 0x32]
6:80AE  7f4d                 jg 0x80fd
6:80B0  66ff76c2             push dword ptr [bp - 0x3e]
6:80B4  6a04                 push 4
6:80B6  66ff7606             push dword ptr [bp + 6]
6:80BA  90                   nop
6:80BB  0e                   push cs
6:80BC  e883f6               call 0x7742  ; sub_s6:7742
6:80BF  8946ba               mov word ptr [bp - 0x46], ax
6:80C2  0bc0                 or ax, ax
6:80C4  7537                 jne 0x80fd
6:80C6  c45ee2               les bx, ptr [bp - 0x1e]
6:80C9  6626ff7704           push dword ptr es:[bx + 4]
6:80CE  c45ec2               les bx, ptr [bp - 0x3e]
6:80D1  6626ff7704           push dword ptr es:[bx + 4]
6:80D6  8d86aafe             lea ax, [bp - 0x156]
6:80DA  16                   push ss
6:80DB  50                   push ax
6:80DC  90                   nop
6:80DD  0e                   push cs
6:80DE  e8b705               call 0x8698  ; sub_s6:8698
6:80E1  8d86aafe             lea ax, [bp - 0x156]
6:80E5  16                   push ss
6:80E6  50                   push ax
6:80E7  66ff364857           push dword ptr [0x5748]  ; g_sim
6:80EC  9a5a831681           lcall 0x8116, 0x835a  ; Sim::enqueue@s7:835A
6:80F1  c786aafe9a38         mov word ptr [bp - 0x156], 0x389a
6:80F7  c786acfe6881         mov word ptr [bp - 0x154], 0x8168  ; SEGMENT s2:0000
loc_80FD:
6:80FD  66ff46ca             inc dword ptr [bp - 0x36]
loc_8101:
6:8101  668b46d6             mov eax, dword ptr [bp - 0x2a]
6:8105  663946ca             cmp dword ptr [bp - 0x36], eax
6:8109  732f                 jae 0x813a
6:810B  66ff76ca             push dword ptr [bp - 0x36]
6:810F  66ff76da             push dword ptr [bp - 0x26]
6:8113  9a7c1d137f           lcall 0x7f13, 0x1d7c  ; sub_s7:1D7C
6:8118  8946c2               mov word ptr [bp - 0x3e], ax
6:811B  8956c4               mov word ptr [bp - 0x3c], dx
6:811E  c45ec2               les bx, ptr [bp - 0x3e]
6:8121  268b4720             mov ax, word ptr es:[bx + 0x20]
6:8125  8946c0               mov word ptr [bp - 0x40], ax
6:8128  0bc0                 or ax, ax
6:812A  74d1                 je 0x80fd
6:812C  3d7000               cmp ax, 0x70
6:812F  74cc                 je 0x80fd
6:8131  3d7100               cmp ax, 0x71
6:8134  0f8562ff             jne 0x809a
6:8138  ebc3                 jmp 0x80fd
loc_813A:
6:813A  668b46da             mov eax, dword ptr [bp - 0x26]
6:813E  6689868afe           mov dword ptr [bp - 0x176], eax
6:8143  6689868efe           mov dword ptr [bp - 0x172], eax
6:8148  660bc0               or eax, eax
6:814B  0f84bcfe             je 0x800b
6:814F  6a01                 push 1
6:8151  c45eda               les bx, ptr [bp - 0x26]
6:8154  06                   push es
6:8155  50                   push ax
6:8156  26c41f               les bx, ptr es:[bx]
6:8159  26ff1f               lcall es:[bx]
6:815C  e9acfe               jmp 0x800b
6:815F  db 90
loc_8160:
6:8160  c746e69a38           mov word ptr [bp - 0x1a], 0x389a
6:8165  c746e89f7e           mov word ptr [bp - 0x18], 0x7e9f  ; SEGMENT s2:0000
loc_816A:
6:816A  c9                   leave
6:816B  ca0400               retf 4

; ---------------- SCEvent::dtor@s6:816E size=60 callers=0
6:816E  c80c0000             enter 0xc, 0
6:8172  c45e06               les bx, ptr [bp + 6]
6:8175  26c7079a38           mov word ptr es:[bx], 0x389a
6:817A  26c747023a80         mov word ptr es:[bx + 2], 0x803a  ; SEGMENT s2:0000
6:8180  f6460a01             test byte ptr [bp + 0xa], 1
6:8184  7409                 je 0x818f
6:8186  66ff7606             push dword ptr [bp + 6]
6:818A  9ace173a75           lcall 0x753a, 0x17ce  ; operator_delete@s1:17CE
loc_818F:
6:818F  8b4606               mov ax, word ptr [bp + 6]
6:8192  8b5608               mov dx, word ptr [bp + 8]
6:8195  c9                   leave
6:8196  ca0600               retf 6
6:8199  db 00 6e 81 a0 81 e4 74 a4 81 28 d2 a8 81 2e 75 8e
6:81A9  db 75

; ---------------- SCFactory@s6:81AA FAR size=54 callers=1
6:81AA  55                   push bp
6:81AB  8bec                 mov bp, sp
6:81AD  68571b               push 0x1b57
6:81B0  66ff7606             push dword ptr [bp + 6]
6:81B4  90                   nop
6:81B5  0e                   push cs
6:81B6  e82350               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:81B9  c45e06               les bx, ptr [bp + 6]
6:81BC  26c7076e83           mov word ptr es:[bx], 0x836e
6:81C1  26c747029c81         mov word ptr es:[bx + 2], 0x819c  ; SEGMENT s6:0000
6:81C7  1e                   push ds
6:81C8  680250               push 0x5002  ; 'SCFactory'
6:81CB  8d4708               lea ax, [bx + 8]
6:81CE  06                   push es
6:81CF  50                   push ax
6:81D0  9a3e3d8d81           lcall 0x818d, 0x3d3e  ; _fstrcpy@s1:3D3E
6:81D5  8b4606               mov ax, word ptr [bp + 6]
6:81D8  8b5608               mov dx, word ptr [bp + 8]
6:81DB  c9                   leave
6:81DC  ca0400               retf 4
6:81DF  db 00

; ---------------- SCFactory::calcMe@s6:81E0 FAR size=212 callers=0
6:81E0  c8220000             enter 0x22, 0
6:81E4  666800000007         push 0x7000000
6:81EA  6a01                 push 1
6:81EC  8d46ee               lea ax, [bp - 0x12]
6:81EF  16                   push ss
6:81F0  50                   push ax
6:81F1  90                   nop
6:81F2  0e                   push cs
6:81F3  e85c5a               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_81F6:
6:81F6  8d46ee               lea ax, [bp - 0x12]
6:81F9  16                   push ss
6:81FA  50                   push ax
6:81FB  90                   nop
6:81FC  0e                   push cs
6:81FD  e8ec62               call 0xe4ec  ; DbIter::next@s6:E4EC
6:8200  8946ea               mov word ptr [bp - 0x16], ax
6:8203  8956ec               mov word ptr [bp - 0x14], dx
6:8206  0bd0                 or dx, ax
6:8208  0f849200             je 0x829e
6:820C  c45eea               les bx, ptr [bp - 0x16]
6:820F  268b470c             mov ax, word ptr es:[bx + 0xc]
6:8213  3d3400               cmp ax, 0x34
6:8216  7f3e                 jg 0x8256
6:8218  3d3300               cmp ax, 0x33
6:821B  7dd9                 jge 0x81f6
6:821D  3d1500               cmp ax, 0x15
6:8220  7748                 ja 0x826a
6:8222  03c0                 add ax, ax
6:8224  93                   xchg bx, ax
6:8225  2effa72a82           jmp word ptr cs:[bx - 0x7dd6]
switch_table_822A:
    dw loc_81F6
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_81F6
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_81F6
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_826A
    dw loc_81F6
    dw loc_826A
    dw loc_81F6
    dw loc_81F6
    dw loc_81F6
    dw loc_81F6
loc_8256:
6:8256  3d6100               cmp ax, 0x61
6:8259  7f25                 jg 0x8280
6:825B  3d5d00               cmp ax, 0x5d
6:825E  7d96                 jge 0x81f6
6:8260  2d3700               sub ax, 0x37
6:8263  7491                 je 0x81f6
6:8265  2d1000               sub ax, 0x10
6:8268  748c                 je 0x81f6
loc_826A:
6:826A  c45eea               les bx, ptr [bp - 0x16]
6:826D  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:8272  7582                 jne 0x81f6
6:8274  06                   push es
6:8275  53                   push bx
6:8276  26c41f               les bx, ptr es:[bx]
6:8279  26ff5f30             lcall es:[bx + 0x30]
6:827D  e976ff               jmp 0x81f6
loc_8280:
6:8280  2d6a00               sub ax, 0x6a
6:8283  0f846fff             je 0x81f6
6:8287  2d0900               sub ax, 9
6:828A  7cde                 jl 0x826a
6:828C  48                   dec ax
6:828D  48                   dec ax
6:828E  0f8e64ff             jle 0x81f6
6:8292  48                   dec ax
6:8293  48                   dec ax
6:8294  7cd4                 jl 0x826a
6:8296  48                   dec ax
6:8297  48                   dec ax
6:8298  0f8e5aff             jle 0x81f6
6:829C  ebcc                 jmp 0x826a
loc_829E:
6:829E  c746de0100           mov word ptr [bp - 0x22], 1
6:82A3  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:82A8  c746f07e81           mov word ptr [bp - 0x10], 0x817e  ; SEGMENT s2:0000
6:82AD  8b46de               mov ax, word ptr [bp - 0x22]
6:82B0  c9                   leave
6:82B1  ca0400               retf 4

; ---------------- SCFactory::clone@s6:82B4 size=142 callers=0
6:82B4  c8200000             enter 0x20, 0
6:82B8  57                   push di
6:82B9  56                   push si
6:82BA  680801               push 0x108
6:82BD  9a9c17d381           lcall 0x81d3, 0x179c  ; operator_new@s1:179C
6:82C2  83c402               add sp, 2
6:82C5  8946f8               mov word ptr [bp - 8], ax
6:82C8  8956fa               mov word ptr [bp - 6], dx
6:82CB  0bd0                 or dx, ax
6:82CD  745f                 je 0x832e
6:82CF  c45ef8               les bx, ptr [bp - 8]
6:82D2  26c7079a38           mov word ptr es:[bx], 0x389a
6:82D7  26c74702ab82         mov word ptr es:[bx + 2], 0x82ab  ; SEGMENT s2:0000
6:82DD  c45e06               les bx, ptr [bp + 6]
6:82E0  66268b4704           mov eax, dword ptr es:[bx + 4]
6:82E5  c45ef8               les bx, ptr [bp - 8]
6:82E8  6626894704           mov dword ptr es:[bx + 4], eax
6:82ED  8b4606               mov ax, word ptr [bp + 6]
6:82F0  8b5608               mov dx, word ptr [bp + 8]
6:82F3  050800               add ax, 8
6:82F6  1e                   push ds
6:82F7  8d7f08               lea di, [bx + 8]
6:82FA  8bf0                 mov si, ax
6:82FC  8eda                 mov ds, dx
6:82FE  66b940000000         mov ecx, 0x40
6:8304  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:8307  1f                   pop ds
6:8308  c45ef8               les bx, ptr [bp - 8]
6:830B  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:8310  26c747022283         mov word ptr es:[bx + 2], 0x8322  ; SEGMENT s6:0000
6:8316  c45ef8               les bx, ptr [bp - 8]
6:8319  26c7076e83           mov word ptr es:[bx], 0x836e
6:831E  26c74702c581         mov word ptr es:[bx + 2], 0x81c5  ; SEGMENT s6:0000
6:8324  668b46f8             mov eax, dword ptr [bp - 8]
6:8328  668946fc             mov dword ptr [bp - 4], eax
6:832C  eb08                 jmp 0x8336
loc_832E:
6:832E  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_8336:
6:8336  8b46fc               mov ax, word ptr [bp - 4]
6:8339  8b56fe               mov dx, word ptr [bp - 2]
6:833C  5e                   pop si
6:833D  5f                   pop di
6:833E  c9                   leave
6:833F  ca0400               retf 4

; ---------------- SCFactory::dtor@s6:8342 size=60 callers=0
6:8342  c80c0000             enter 0xc, 0
6:8346  c45e06               les bx, ptr [bp + 6]
6:8349  26c7079a38           mov word ptr es:[bx], 0x389a
6:834E  26c74702db82         mov word ptr es:[bx + 2], 0x82db  ; SEGMENT s2:0000
6:8354  f6460a01             test byte ptr [bp + 0xa], 1
6:8358  7409                 je 0x8363
6:835A  66ff7606             push dword ptr [bp + 6]
6:835E  9ace17c082           lcall 0x82c0, 0x17ce  ; operator_delete@s1:17CE
loc_8363:
6:8363  8b4606               mov ax, word ptr [bp + 6]
6:8366  8b5608               mov dx, word ptr [bp + 8]
6:8369  c9                   leave
6:836A  ca0600               retf 6
6:836D  db 00 42 83 74 83 e0 81 78 83 28 d2 7c 83 b4 82 14
6:837D  db 83

; ---------------- SCFillResources@s6:837E FAR size=54 callers=1
6:837E  55                   push bp
6:837F  8bec                 mov bp, sp
6:8381  689f0f               push 0xf9f
6:8384  66ff7606             push dword ptr [bp + 6]
6:8388  90                   nop
6:8389  0e                   push cs
6:838A  e84f4e               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:838D  c45e06               les bx, ptr [bp + 6]
6:8390  26c707ba84           mov word ptr es:[bx], 0x84ba
6:8395  26c747027083         mov word ptr es:[bx + 2], 0x8370  ; SEGMENT s6:0000
6:839B  1e                   push ds
6:839C  680c50               push 0x500c  ; 'SCFillResources'
6:839F  8d4708               lea ax, [bx + 8]
6:83A2  06                   push es
6:83A3  50                   push ax
6:83A4  9a3e3d6183           lcall 0x8361, 0x3d3e  ; _fstrcpy@s1:3D3E
6:83A9  8b4606               mov ax, word ptr [bp + 6]
6:83AC  8b5608               mov dx, word ptr [bp + 8]
6:83AF  c9                   leave
6:83B0  ca0400               retf 4
6:83B3  db 00

; ---------------- SCFillResources::calcMe@s6:83B4 FAR size=76 callers=0
6:83B4  c8240000             enter 0x24, 0
6:83B8  666800000004         push 0x4000000
6:83BE  6a01                 push 1
6:83C0  8d46ee               lea ax, [bp - 0x12]
6:83C3  16                   push ss
6:83C4  50                   push ax
6:83C5  90                   nop
6:83C6  0e                   push cs
6:83C7  e88858               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_83CA:
6:83CA  8d46ee               lea ax, [bp - 0x12]
6:83CD  16                   push ss
6:83CE  50                   push ax
6:83CF  90                   nop
6:83D0  0e                   push cs
6:83D1  e81861               call 0xe4ec  ; DbIter::next@s6:E4EC
6:83D4  8946ea               mov word ptr [bp - 0x16], ax
6:83D7  8956ec               mov word ptr [bp - 0x14], dx
6:83DA  0bd0                 or dx, ax
6:83DC  740c                 je 0x83ea
6:83DE  c45eea               les bx, ptr [bp - 0x16]
6:83E1  26c78706020100       mov word ptr es:[bx + 0x206], 1
6:83E8  ebe0                 jmp 0x83ca
loc_83EA:
6:83EA  c746e00100           mov word ptr [bp - 0x20], 1
6:83EF  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:83F4  c746f05283           mov word ptr [bp - 0x10], 0x8352  ; SEGMENT s2:0000
6:83F9  8b46e0               mov ax, word ptr [bp - 0x20]
6:83FC  c9                   leave
6:83FD  ca0400               retf 4

; ---------------- SCFillResources::clone@s6:8400 size=142 callers=0
6:8400  c8200000             enter 0x20, 0
6:8404  57                   push di
6:8405  56                   push si
6:8406  680801               push 0x108
6:8409  9a9c17a783           lcall 0x83a7, 0x179c  ; operator_new@s1:179C
6:840E  83c402               add sp, 2
6:8411  8946f8               mov word ptr [bp - 8], ax
6:8414  8956fa               mov word ptr [bp - 6], dx
6:8417  0bd0                 or dx, ax
6:8419  745f                 je 0x847a
6:841B  c45ef8               les bx, ptr [bp - 8]
6:841E  26c7079a38           mov word ptr es:[bx], 0x389a
6:8423  26c74702f783         mov word ptr es:[bx + 2], 0x83f7  ; SEGMENT s2:0000
6:8429  c45e06               les bx, ptr [bp + 6]
6:842C  66268b4704           mov eax, dword ptr es:[bx + 4]
6:8431  c45ef8               les bx, ptr [bp - 8]
6:8434  6626894704           mov dword ptr es:[bx + 4], eax
6:8439  8b4606               mov ax, word ptr [bp + 6]
6:843C  8b5608               mov dx, word ptr [bp + 8]
6:843F  050800               add ax, 8
6:8442  1e                   push ds
6:8443  8d7f08               lea di, [bx + 8]
6:8446  8bf0                 mov si, ax
6:8448  8eda                 mov ds, dx
6:844A  66b940000000         mov ecx, 0x40
6:8450  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:8453  1f                   pop ds
6:8454  c45ef8               les bx, ptr [bp - 8]
6:8457  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:845C  26c747026e84         mov word ptr es:[bx + 2], 0x846e  ; SEGMENT s6:0000
6:8462  c45ef8               les bx, ptr [bp - 8]
6:8465  26c707ba84           mov word ptr es:[bx], 0x84ba
6:846A  26c747029983         mov word ptr es:[bx + 2], 0x8399  ; SEGMENT s6:0000
6:8470  668b46f8             mov eax, dword ptr [bp - 8]
6:8474  668946fc             mov dword ptr [bp - 4], eax
6:8478  eb08                 jmp 0x8482
loc_847A:
6:847A  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_8482:
6:8482  8b46fc               mov ax, word ptr [bp - 4]
6:8485  8b56fe               mov dx, word ptr [bp - 2]
6:8488  5e                   pop si
6:8489  5f                   pop di
6:848A  c9                   leave
6:848B  ca0400               retf 4

; ---------------- SCFillResources::dtor@s6:848E size=60 callers=0
6:848E  c80c0000             enter 0xc, 0
6:8492  c45e06               les bx, ptr [bp + 6]
6:8495  26c7079a38           mov word ptr es:[bx], 0x389a
6:849A  26c747022784         mov word ptr es:[bx + 2], 0x8427  ; SEGMENT s2:0000
6:84A0  f6460a01             test byte ptr [bp + 0xa], 1
6:84A4  7409                 je 0x84af
6:84A6  66ff7606             push dword ptr [bp + 6]
6:84AA  9ace170c84           lcall 0x840c, 0x17ce  ; operator_delete@s1:17CE
loc_84AF:
6:84AF  8b4606               mov ax, word ptr [bp + 6]
6:84B2  8b5608               mov dx, word ptr [bp + 8]
6:84B5  c9                   leave
6:84B6  ca0600               retf 6
6:84B9  db 00 8e 84 c0 84 b4 83 c4 84 28 d2 c8 84 00 84 60
6:84C9  db 84

; ---------------- SCForceMorale@s6:84CA FAR size=116 callers=1
6:84CA  c8040000             enter 4, 0
6:84CE  68e703               push 0x3e7
6:84D1  66ff7606             push dword ptr [bp + 6]
6:84D5  90                   nop
6:84D6  0e                   push cs
6:84D7  e8024d               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:84DA  8b4612               mov ax, word ptr [bp + 0x12]
6:84DD  c45e06               les bx, ptr [bp + 6]
6:84E0  2689870801           mov word ptr es:[bx + 0x108], ax
6:84E5  8b4610               mov ax, word ptr [bp + 0x10]
6:84E8  2689870a01           mov word ptr es:[bx + 0x10a], ax
6:84ED  8b460e               mov ax, word ptr [bp + 0xe]
6:84F0  2689870c01           mov word ptr es:[bx + 0x10c], ax
6:84F5  668b460a             mov eax, dword ptr [bp + 0xa]
6:84F9  662689870e01         mov dword ptr es:[bx + 0x10e], eax
6:84FF  26c7078886           mov word ptr es:[bx], 0x8688
6:8504  26c74702bc84         mov word ptr es:[bx + 2], 0x84bc  ; SEGMENT s6:0000
6:850A  2683bf080101         cmp word ptr es:[bx + 0x108], 1
6:8510  7506                 jne 0x8518
6:8512  b81c50               mov ax, 0x501c  ; 'max'
6:8515  eb04                 jmp 0x851b
6:8517  db 90
loc_8518:
6:8518  b82050               mov ax, 0x5020  ; 'min'
loc_851B:
6:851B  66ff760a             push dword ptr [bp + 0xa]
6:851F  1e                   push ds
6:8520  50                   push ax
6:8521  1e                   push ds
6:8522  682450               push 0x5024  ; 'SCForceMorale %s for colony %08lX'
6:8525  668b4606             mov eax, dword ptr [bp + 6]
6:8529  050800               add ax, 8
6:852C  6650                 push eax
6:852E  9a9c3fad84           lcall 0x84ad, 0x3f9c  ; _fsprintf@s1:3F9C
6:8533  8b4606               mov ax, word ptr [bp + 6]
6:8536  8b5608               mov dx, word ptr [bp + 8]
6:8539  c9                   leave
6:853A  ca0e00               retf 0xe
6:853D  db 00

; ---------------- SCForceMorale::calcMe@s6:853E FAR size=78 callers=0
6:853E  c8040000             enter 4, 0
6:8542  c45e06               les bx, ptr [bp + 6]
6:8545  2683bf080100         cmp word ptr es:[bx + 0x108], 0
6:854B  7507                 jne 0x8554
6:854D  33c0                 xor ax, ax
6:854F  c9                   leave
6:8550  ca0400               retf 4
6:8553  db 90
loc_8554:
6:8554  6626ffb70e01         push dword ptr es:[bx + 0x10e]
6:855A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:855F  90                   nop
6:8560  0e                   push cs
6:8561  e8885c               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8564  8946fc               mov word ptr [bp - 4], ax
6:8567  c45e06               les bx, ptr [bp + 6]
6:856A  2683bf080101         cmp word ptr es:[bx + 0x108], 1
6:8570  7506                 jne 0x8578
6:8572  b8e803               mov ax, 0x3e8
6:8575  eb03                 jmp 0x857a
6:8577  db 90
loc_8578:
6:8578  33c0                 xor ax, ax
loc_857A:
6:857A  50                   push ax
6:857B  52                   push dx
6:857C  ff76fc               push word ptr [bp - 4]
6:857F  9a0e4d4b80           lcall 0x804b, 0x4d0e  ; sub_s8:4D0E
6:8584  b80100               mov ax, 1
6:8587  c9                   leave
6:8588  ca0400               retf 4
6:858B  db 00

; ---------------- SCForceMorale::clone@s6:858C FAR size=208 callers=0
6:858C  c8200000             enter 0x20, 0
6:8590  57                   push di
6:8591  56                   push si
6:8592  681201               push 0x112
6:8595  9a9c173185           lcall 0x8531, 0x179c  ; operator_new@s1:179C
6:859A  83c402               add sp, 2
6:859D  8946f8               mov word ptr [bp - 8], ax
6:85A0  8956fa               mov word ptr [bp - 6], dx
6:85A3  0bd0                 or dx, ax
6:85A5  0f849f00             je 0x8648
6:85A9  c45ef8               les bx, ptr [bp - 8]
6:85AC  26c7079a38           mov word ptr es:[bx], 0x389a
6:85B1  26c747029e84         mov word ptr es:[bx + 2], 0x849e  ; SEGMENT s2:0000
6:85B7  c45e06               les bx, ptr [bp + 6]
6:85BA  66268b4704           mov eax, dword ptr es:[bx + 4]
6:85BF  c45ef8               les bx, ptr [bp - 8]
6:85C2  6626894704           mov dword ptr es:[bx + 4], eax
6:85C7  8b4606               mov ax, word ptr [bp + 6]
6:85CA  8b5608               mov dx, word ptr [bp + 8]
6:85CD  050800               add ax, 8
6:85D0  1e                   push ds
6:85D1  8d7f08               lea di, [bx + 8]
6:85D4  8bf0                 mov si, ax
6:85D6  8eda                 mov ds, dx
6:85D8  66b940000000         mov ecx, 0x40
6:85DE  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:85E1  1f                   pop ds
6:85E2  c45ef8               les bx, ptr [bp - 8]
6:85E5  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:85EA  26c747023b86         mov word ptr es:[bx + 2], 0x863b  ; SEGMENT s6:0000
6:85F0  c45e06               les bx, ptr [bp + 6]
6:85F3  268b870801           mov ax, word ptr es:[bx + 0x108]
6:85F8  c45ef8               les bx, ptr [bp - 8]
6:85FB  2689870801           mov word ptr es:[bx + 0x108], ax
6:8600  c45e06               les bx, ptr [bp + 6]
6:8603  268b870a01           mov ax, word ptr es:[bx + 0x10a]
6:8608  c45ef8               les bx, ptr [bp - 8]
6:860B  2689870a01           mov word ptr es:[bx + 0x10a], ax
6:8610  c45e06               les bx, ptr [bp + 6]
6:8613  268b870c01           mov ax, word ptr es:[bx + 0x10c]
6:8618  c45ef8               les bx, ptr [bp - 8]
6:861B  2689870c01           mov word ptr es:[bx + 0x10c], ax
6:8620  c45e06               les bx, ptr [bp + 6]
6:8623  66268b870e01         mov eax, dword ptr es:[bx + 0x10e]
6:8629  c45ef8               les bx, ptr [bp - 8]
6:862C  662689870e01         mov dword ptr es:[bx + 0x10e], eax
6:8632  26c7078886           mov word ptr es:[bx], 0x8688
6:8637  26c747020885         mov word ptr es:[bx + 2], 0x8508  ; SEGMENT s6:0000
6:863D  668b46f8             mov eax, dword ptr [bp - 8]
6:8641  668946fc             mov dword ptr [bp - 4], eax
6:8645  eb09                 jmp 0x8650
6:8647  db 90
loc_8648:
6:8648  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_8650:
6:8650  8b46fc               mov ax, word ptr [bp - 4]
6:8653  8b56fe               mov dx, word ptr [bp - 2]
6:8656  5e                   pop si
6:8657  5f                   pop di
6:8658  c9                   leave
6:8659  ca0400               retf 4

; ---------------- SCForceMorale::dtor@s6:865C size=60 callers=0
6:865C  c80c0000             enter 0xc, 0
6:8660  c45e06               les bx, ptr [bp + 6]
6:8663  26c7079a38           mov word ptr es:[bx], 0x389a
6:8668  26c74702b585         mov word ptr es:[bx + 2], 0x85b5  ; SEGMENT s2:0000
6:866E  f6460a01             test byte ptr [bp + 0xa], 1
6:8672  7409                 je 0x867d
6:8674  66ff7606             push dword ptr [bp + 6]
6:8678  9ace179885           lcall 0x8598, 0x17ce  ; operator_delete@s1:17CE
loc_867D:
6:867D  8b4606               mov ax, word ptr [bp + 6]
6:8680  8b5608               mov dx, word ptr [bp + 8]
6:8683  c9                   leave
6:8684  ca0600               retf 6
6:8687  db 00 5c 86 8e 86 3e 85 92 86 28 d2 96 86 8c 85 ee
6:8697  db 85

; ---------------- sub_s6:8698 FAR size=42 callers=1
6:8698  55                   push bp
6:8699  8bec                 mov bp, sp
6:869B  66ff760e             push dword ptr [bp + 0xe]
6:869F  66ff760a             push dword ptr [bp + 0xa]
6:86A3  66ff7606             push dword ptr [bp + 6]
6:86A7  90                   nop
6:86A8  0e                   push cs
6:86A9  e846e4               call 0x6af2  ; sub_s6:6AF2
6:86AC  c45e06               les bx, ptr [bp + 6]
6:86AF  26c707e087           mov word ptr es:[bx], 0x87e0
6:86B4  26c747028a86         mov word ptr es:[bx + 2], 0x868a  ; SEGMENT s6:0000
6:86BA  8bc3                 mov ax, bx
6:86BC  8cc2                 mov dx, es
6:86BE  c9                   leave
6:86BF  ca0c00               retf 0xc

; ---------------- sub_s6:86C2 size=50 callers=0
6:86C2  c8040000             enter 4, 0
6:86C6  666800001d00         push 0x1d0000
6:86CC  666a01               push 1
6:86CF  666a00               push 0
6:86D2  666a37               push 0x37
6:86D5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:86DA  9aba206f80           lcall 0x806f, 0x20ba  ; sub_s3:20BA
6:86DF  52                   push dx
6:86E0  50                   push ax
6:86E1  9ae4a06c86           lcall 0x866c, 0xa0e4  ; sub_s2:A0E4
6:86E6  66ff7606             push dword ptr [bp + 6]
6:86EA  90                   nop
6:86EB  0e                   push cs
6:86EC  e83de4               call 0x6b2c  ; sub_s6:6B2C
6:86EF  c9                   leave
6:86F0  ca0400               retf 4
6:86F3  db 00

; ---------------- sub_s6:86F4 FAR size=192 callers=0
6:86F4  c8280000             enter 0x28, 0
6:86F8  57                   push di
6:86F9  56                   push si
6:86FA  681001               push 0x110  ; 'New failed in Op::Op->Simulator'
6:86FD  9a9c177b86           lcall 0x867b, 0x179c  ; operator_new@s1:179C
6:8702  83c402               add sp, 2
6:8705  8946f8               mov word ptr [bp - 8], ax
6:8708  8956fa               mov word ptr [bp - 6], dx
6:870B  0bd0                 or dx, ax
6:870D  0f848f00             je 0x87a0
6:8711  c45ef8               les bx, ptr [bp - 8]
6:8714  26c7079a38           mov word ptr es:[bx], 0x389a
6:8719  26c74702e486         mov word ptr es:[bx + 2], 0x86e4  ; SEGMENT s2:0000
6:871F  c45e06               les bx, ptr [bp + 6]
6:8722  66268b4704           mov eax, dword ptr es:[bx + 4]
6:8727  c45ef8               les bx, ptr [bp - 8]
6:872A  6626894704           mov dword ptr es:[bx + 4], eax
6:872F  8b4606               mov ax, word ptr [bp + 6]
6:8732  8b5608               mov dx, word ptr [bp + 8]
6:8735  050800               add ax, 8
6:8738  1e                   push ds
6:8739  8d7f08               lea di, [bx + 8]
6:873C  8bf0                 mov si, ax
6:873E  8eda                 mov ds, dx
6:8740  66b940000000         mov ecx, 0x40
6:8746  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:8749  1f                   pop ds
6:874A  c45ef8               les bx, ptr [bp - 8]
6:874D  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:8752  26c747028587         mov word ptr es:[bx + 2], 0x8785  ; SEGMENT s6:0000
6:8758  c45e06               les bx, ptr [bp + 6]
6:875B  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:8761  c45ef8               les bx, ptr [bp - 8]
6:8764  662689870801         mov dword ptr es:[bx + 0x108], eax
6:876A  c45e06               les bx, ptr [bp + 6]
6:876D  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:8773  c45ef8               les bx, ptr [bp - 8]
6:8776  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:877C  26c707506e           mov word ptr es:[bx], 0x6e50
6:8781  26c747029387         mov word ptr es:[bx + 2], 0x8793  ; SEGMENT s6:0000
6:8787  c45ef8               les bx, ptr [bp - 8]
6:878A  26c707e087           mov word ptr es:[bx], 0x87e0
6:878F  26c74702b886         mov word ptr es:[bx + 2], 0x86b8  ; SEGMENT s6:0000
6:8795  668b46f8             mov eax, dword ptr [bp - 8]
6:8799  668946fc             mov dword ptr [bp - 4], eax
6:879D  eb09                 jmp 0x87a8
6:879F  db 90
loc_87A0:
6:87A0  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_87A8:
6:87A8  8b46fc               mov ax, word ptr [bp - 4]
6:87AB  8b56fe               mov dx, word ptr [bp - 2]
6:87AE  5e                   pop si
6:87AF  5f                   pop di
6:87B0  c9                   leave
6:87B1  ca0400               retf 4

; ---------------- sub_s6:87B4 size=60 callers=0
6:87B4  c8100000             enter 0x10, 0
6:87B8  c45e06               les bx, ptr [bp + 6]
6:87BB  26c7079a38           mov word ptr es:[bx], 0x389a
6:87C0  26c747021d87         mov word ptr es:[bx + 2], 0x871d  ; SEGMENT s2:0000
6:87C6  f6460a01             test byte ptr [bp + 0xa], 1
6:87CA  7409                 je 0x87d5
6:87CC  66ff7606             push dword ptr [bp + 6]
6:87D0  9ace170087           lcall 0x8700, 0x17ce  ; operator_delete@s1:17CE
loc_87D5:
6:87D5  8b4606               mov ax, word ptr [bp + 6]
6:87D8  8b5608               mov dx, word ptr [bp + 8]
6:87DB  c9                   leave
6:87DC  ca0600               retf 6
6:87DF  db 00 b4 87 e6 87 c2 86 ea 87 28 d2 ee 87 f4 86 56
6:87EF  db 87

; ---------------- SCInternalPutBldg@s6:87F0 FAR size=152 callers=20
6:87F0  55                   push bp
6:87F1  8bec                 mov bp, sp
6:87F3  57                   push di
6:87F4  56                   push si
6:87F5  68e803               push 0x3e8
6:87F8  66ff7606             push dword ptr [bp + 6]
6:87FC  90                   nop
6:87FD  0e                   push cs
6:87FE  e8db49               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:8801  668b4618             mov eax, dword ptr [bp + 0x18]
6:8805  8b561a               mov dx, word ptr [bp + 0x1a]
6:8808  c45e06               les bx, ptr [bp + 6]
6:880B  662689870801         mov dword ptr es:[bx + 0x108], eax
6:8811  668b4e14             mov ecx, dword ptr [bp + 0x14]
6:8815  6626898f0c01         mov dword ptr es:[bx + 0x10c], ecx
6:881B  6626c787100100000000 mov dword ptr es:[bx + 0x110], 0
6:8825  8b7610               mov si, word ptr [bp + 0x10]
6:8828  8b7e12               mov di, word ptr [bp + 0x12]
6:882B  1e                   push ds
6:882C  57                   push di
6:882D  8dbf1401             lea di, [bx + 0x114]
6:8831  1f                   pop ds
6:8832  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:8834  a5                   movsw word ptr es:[di], word ptr [si]
6:8835  1f                   pop ds
6:8836  8b4e0e               mov cx, word ptr [bp + 0xe]
6:8839  c45e06               les bx, ptr [bp + 6]
6:883C  26898f1a01           mov word ptr es:[bx + 0x11a], cx
6:8841  8b760c               mov si, word ptr [bp + 0xc]
6:8844  2689b71c01           mov word ptr es:[bx + 0x11c], si
6:8849  8b760a               mov si, word ptr [bp + 0xa]
6:884C  2689b71e01           mov word ptr es:[bx + 0x11e], si
6:8851  2bf6                 sub si, si
6:8853  2689b72201           mov word ptr es:[bx + 0x122], si
6:8858  2689b72001           mov word ptr es:[bx + 0x120], si
6:885D  26c7078e8d           mov word ptr es:[bx], 0x8d8e
6:8862  26c74702e287         mov word ptr es:[bx + 2], 0x87e2  ; SEGMENT s6:0000
6:8868  51                   push cx
6:8869  52                   push dx
6:886A  50                   push ax
6:886B  1e                   push ds
6:886C  684650               push 0x5046  ; 'SCInternalPutBldg site:0x%08lx. bldg:%u.'
6:886F  8d4708               lea ax, [bx + 8]
6:8872  06                   push es
6:8873  50                   push ax
6:8874  9a9c3fd387           lcall 0x87d3, 0x3f9c  ; _fsprintf@s1:3F9C
6:8879  83c40e               add sp, 0xe
6:887C  8b4606               mov ax, word ptr [bp + 6]
6:887F  8b5608               mov dx, word ptr [bp + 8]
6:8882  5e                   pop si
6:8883  5f                   pop di
6:8884  c9                   leave
6:8885  ca1600               retf 0x16

; ---------------- SCInternalPutBldg2@s6:8888 FAR size=152 callers=2
6:8888  55                   push bp
6:8889  8bec                 mov bp, sp
6:888B  57                   push di
6:888C  56                   push si
6:888D  68e803               push 0x3e8
6:8890  66ff7606             push dword ptr [bp + 6]
6:8894  90                   nop
6:8895  0e                   push cs
6:8896  e84349               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:8899  668b461a             mov eax, dword ptr [bp + 0x1a]
6:889D  8b561c               mov dx, word ptr [bp + 0x1c]
6:88A0  c45e06               les bx, ptr [bp + 6]
6:88A3  662689870801         mov dword ptr es:[bx + 0x108], eax
6:88A9  668b4e16             mov ecx, dword ptr [bp + 0x16]
6:88AD  6626898f0c01         mov dword ptr es:[bx + 0x10c], ecx
6:88B3  668b4e12             mov ecx, dword ptr [bp + 0x12]
6:88B7  6626898f1001         mov dword ptr es:[bx + 0x110], ecx
6:88BD  8b760e               mov si, word ptr [bp + 0xe]
6:88C0  8b7e10               mov di, word ptr [bp + 0x10]
6:88C3  1e                   push ds
6:88C4  57                   push di
6:88C5  8dbf1401             lea di, [bx + 0x114]
6:88C9  1f                   pop ds
6:88CA  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:88CC  a5                   movsw word ptr es:[di], word ptr [si]
6:88CD  1f                   pop ds
6:88CE  8b4e0c               mov cx, word ptr [bp + 0xc]
6:88D1  c45e06               les bx, ptr [bp + 6]
6:88D4  26898f1a01           mov word ptr es:[bx + 0x11a], cx
6:88D9  26c7871c010000       mov word ptr es:[bx + 0x11c], 0
6:88E0  8b760a               mov si, word ptr [bp + 0xa]
6:88E3  2689b71e01           mov word ptr es:[bx + 0x11e], si
6:88E8  2bf6                 sub si, si
6:88EA  2689b72201           mov word ptr es:[bx + 0x122], si
6:88EF  2689b72001           mov word ptr es:[bx + 0x120], si
6:88F4  26c7078e8d           mov word ptr es:[bx], 0x8d8e
6:88F9  26c747026688         mov word ptr es:[bx + 2], 0x8866  ; SEGMENT s6:0000
6:88FF  51                   push cx
6:8900  52                   push dx
6:8901  50                   push ax
6:8902  1e                   push ds
6:8903  686f50               push 0x506f  ; 'SCInternalPutBldg2 site:0x%08lx. bldg:%u.'
6:8906  8d4708               lea ax, [bx + 8]
6:8909  06                   push es
6:890A  50                   push ax
6:890B  9a9c3f7788           lcall 0x8877, 0x3f9c  ; _fsprintf@s1:3F9C
6:8910  83c40e               add sp, 0xe
6:8913  8b4606               mov ax, word ptr [bp + 6]
6:8916  8b5608               mov dx, word ptr [bp + 8]
6:8919  5e                   pop si
6:891A  5f                   pop di
6:891B  c9                   leave
6:891C  ca1800               retf 0x18
6:891F  db 00

; ---------------- sub_s6:8920 FAR size=806 callers=0
6:8920  c8540100             enter 0x154, 0
6:8924  57                   push di
6:8925  56                   push si
6:8926  8d46dc               lea ax, [bp - 0x24]
6:8929  16                   push ss
6:892A  50                   push ax
6:892B  c45e06               les bx, ptr [bp + 6]
6:892E  6626ffb70801         push dword ptr es:[bx + 0x108]
6:8934  8d871401             lea ax, [bx + 0x114]
6:8938  06                   push es
6:8939  50                   push ax
6:893A  66ff364057           push dword ptr [0x5740]
6:893F  8bf0                 mov si, ax
6:8941  8cc7                 mov di, es
6:8943  9ace64d889           lcall 0x89d8, 0x64ce  ; sub_s7:64CE
6:8948  8bd8                 mov bx, ax
6:894A  8ec2                 mov es, dx
6:894C  66268b07             mov eax, dword ptr es:[bx]
6:8950  668946fc             mov dword ptr [bp - 4], eax
6:8954  8d46fa               lea ax, [bp - 6]
6:8957  16                   push ss
6:8958  50                   push ax
6:8959  8d46f8               lea ax, [bp - 8]
6:895C  16                   push ss
6:895D  50                   push ax
6:895E  8d46f6               lea ax, [bp - 0xa]
6:8961  16                   push ss
6:8962  50                   push ax
6:8963  57                   push di
6:8964  56                   push si
6:8965  9ab43efb8a           lcall 0x8afb, 0x3eb4  ; sub_s2:3EB4
6:896A  668b46fc             mov eax, dword ptr [bp - 4]
6:896E  8b56fe               mov dx, word ptr [bp - 2]
6:8971  668946d4             mov dword ptr [bp - 0x2c], eax
6:8975  668946ca             mov dword ptr [bp - 0x36], eax
6:8979  8a46cd               mov al, byte ptr [bp - 0x33]
6:897C  2ae4                 sub ah, ah
6:897E  3d0100               cmp ax, 1
6:8981  1bc0                 sbb ax, ax
6:8983  40                   inc ax
6:8984  8946f4               mov word ptr [bp - 0xc], ax
6:8987  0bc0                 or ax, ax
6:8989  740d                 je 0x8998
6:898B  8b46fc               mov ax, word ptr [bp - 4]
6:898E  8946f0               mov word ptr [bp - 0x10], ax
6:8991  8956f2               mov word ptr [bp - 0xe], dx
6:8994  e92e01               jmp 0x8ac5
6:8997  db 90
loc_8998:
6:8998  c45e06               les bx, ptr [bp + 6]
6:899B  6626ffb70801         push dword ptr es:[bx + 0x108]
6:89A1  666800000005         push 0x5000000
6:89A7  8d871401             lea ax, [bx + 0x114]
6:89AB  06                   push es
6:89AC  50                   push ax
6:89AD  6a00                 push 0
6:89AF  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:89B4  8bf0                 mov si, ax
6:89B6  8cc7                 mov di, es
6:89B8  90                   nop
6:89B9  0e                   push cs
6:89BA  e8ef58               call 0xe2ac  ; sub_s6:E2AC
6:89BD  8946f0               mov word ptr [bp - 0x10], ax
6:89C0  8956f2               mov word ptr [bp - 0xe], dx
6:89C3  c45e06               les bx, ptr [bp + 6]
6:89C6  6626ffb70801         push dword ptr es:[bx + 0x108]
6:89CC  57                   push di
6:89CD  56                   push si
6:89CE  52                   push dx
6:89CF  50                   push ax
6:89D0  66ff364057           push dword ptr [0x5740]
6:89D5  9afe61e78a           lcall 0x8ae7, 0x61fe  ; sub_s7:61FE
6:89DA  66c746ca00000000     mov dword ptr [bp - 0x36], 0
6:89E2  c45e06               les bx, ptr [bp + 6]
6:89E5  2683bf1a010a         cmp word ptr es:[bx + 0x11a], 0xa
6:89EB  740a                 je 0x89f7
6:89ED  2683bf1a0137         cmp word ptr es:[bx + 0x11a], 0x37
6:89F3  0f85a000             jne 0x8a97
loc_89F7:
6:89F7  2683bf1a0137         cmp word ptr es:[bx + 0x11a], 0x37
6:89FD  750a                 jne 0x8a09
6:89FF  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:8A05  668946ca             mov dword ptr [bp - 0x36], eax
loc_8A09:
6:8A09  6626ffb70801         push dword ptr es:[bx + 0x108]
6:8A0F  666800000004         push 0x4000000
6:8A15  8d871401             lea ax, [bx + 0x114]
6:8A19  06                   push es
6:8A1A  50                   push ax
6:8A1B  6a00                 push 0
6:8A1D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8A22  90                   nop
6:8A23  0e                   push cs
6:8A24  e88558               call 0xe2ac  ; sub_s6:E2AC
6:8A27  c45e06               les bx, ptr [bp + 6]
6:8A2A  2689870c01           mov word ptr es:[bx + 0x10c], ax
6:8A2F  2689970e01           mov word ptr es:[bx + 0x10e], dx
6:8A34  6a2f                 push 0x2f
6:8A36  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:8A3B  9aba20dd86           lcall 0x86dd, 0x20ba  ; sub_s3:20BA
6:8A40  8946d4               mov word ptr [bp - 0x2c], ax
6:8A43  8956d6               mov word ptr [bp - 0x2a], dx
6:8A46  c45e06               les bx, ptr [bp + 6]
6:8A49  6626ffb70801         push dword ptr es:[bx + 0x108]
6:8A4F  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:8A55  52                   push dx
6:8A56  50                   push ax
6:8A57  9a96011d73           lcall 0x731d, 0x196  ; sub_s4:0196
6:8A5C  c45e06               les bx, ptr [bp + 6]
6:8A5F  662683bf100100       cmp dword ptr es:[bx + 0x110], 0
6:8A66  742f                 je 0x8a97
6:8A68  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:8A6E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8A73  90                   nop
6:8A74  0e                   push cs
6:8A75  e87457               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8A78  8946d8               mov word ptr [bp - 0x28], ax
6:8A7B  8956da               mov word ptr [bp - 0x26], dx
6:8A7E  c45e06               les bx, ptr [bp + 6]
6:8A81  66268b871001         mov eax, dword ptr es:[bx + 0x110]
6:8A87  668946be             mov dword ptr [bp - 0x42], eax
6:8A8B  c45ed8               les bx, ptr [bp - 0x28]
6:8A8E  662689870002         mov dword ptr es:[bx + 0x200], eax
6:8A94  c45e06               les bx, ptr [bp + 6]
loc_8A97:
6:8A97  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:8A9D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8AA2  90                   nop
6:8AA3  0e                   push cs
6:8AA4  e84557               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8AA7  8946ce               mov word ptr [bp - 0x32], ax
6:8AAA  8956d0               mov word ptr [bp - 0x30], dx
6:8AAD  0bd0                 or dx, ax
6:8AAF  7414                 je 0x8ac5
6:8AB1  6a00                 push 0
6:8AB3  66ff76f0             push dword ptr [bp - 0x10]
6:8AB7  6a00                 push 0
6:8AB9  c45ece               les bx, ptr [bp - 0x32]
6:8ABC  06                   push es
6:8ABD  50                   push ax
6:8ABE  26c41f               les bx, ptr es:[bx]
6:8AC1  26ff5f08             lcall es:[bx + 8]
loc_8AC5:
6:8AC5  66ff76f0             push dword ptr [bp - 0x10]
6:8AC9  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8ACE  90                   nop
6:8ACF  0e                   push cs
6:8AD0  e81957               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8AD3  8946ec               mov word ptr [bp - 0x14], ax
6:8AD6  8956ee               mov word ptr [bp - 0x12], dx
6:8AD9  c45e06               les bx, ptr [bp + 6]
6:8ADC  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:8AE2  52                   push dx
6:8AE3  50                   push ax
6:8AE4  9aee73658b           lcall 0x8b65, 0x73ee  ; sub_s7:73EE
6:8AE9  6a31                 push 0x31
6:8AEB  c45e06               les bx, ptr [bp + 6]
6:8AEE  26ffb71a01           push word ptr es:[bx + 0x11a]
6:8AF3  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:8AF8  9aaec6818b           lcall 0x8b81, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:8AFD  0bc0                 or ax, ax
6:8AFF  7540                 jne 0x8b41
6:8B01  c45e06               les bx, ptr [bp + 6]
6:8B04  2639871c01           cmp word ptr es:[bx + 0x11c], ax
6:8B09  7536                 jne 0x8b41
6:8B0B  8b46ec               mov ax, word ptr [bp - 0x14]
6:8B0E  8b56ee               mov dx, word ptr [bp - 0x12]
6:8B11  050c00               add ax, 0xc
6:8B14  1e                   push ds
6:8B15  8d7eb8               lea di, [bp - 0x48]
6:8B18  8bf0                 mov si, ax
6:8B1A  16                   push ss
6:8B1B  07                   pop es
6:8B1C  8eda                 mov ds, dx
6:8B1E  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:8B20  a5                   movsw word ptr es:[di], word ptr [si]
6:8B21  1f                   pop ds
6:8B22  8d46b8               lea ax, [bp - 0x48]
6:8B25  8946be               mov word ptr [bp - 0x42], ax
6:8B28  837ebc00             cmp word ptr [bp - 0x44], 0
6:8B2C  7e06                 jle 0x8b34
6:8B2E  b80600               mov ax, 6
6:8B31  eb04                 jmp 0x8b37
6:8B33  db 90
loc_8B34:
6:8B34  b80500               mov ax, 5
loc_8B37:
6:8B37  8946d2               mov word ptr [bp - 0x2e], ax
6:8B3A  c45eec               les bx, ptr [bp - 0x14]
6:8B3D  26894714             mov word ptr es:[bx + 0x14], ax
loc_8B41:
6:8B41  c45eec               les bx, ptr [bp - 0x14]
6:8B44  66268b4716           mov eax, dword ptr es:[bx + 0x16]
6:8B49  268b5718             mov dx, word ptr es:[bx + 0x18]
6:8B4D  668946e8             mov dword ptr [bp - 0x18], eax
6:8B51  8bc2                 mov ax, dx
6:8B53  0b46e8               or ax, word ptr [bp - 0x18]
6:8B56  742b                 je 0x8b83
6:8B58  52                   push dx
6:8B59  ff76e8               push word ptr [bp - 0x18]
6:8B5C  8d86acfe             lea ax, [bp - 0x154]
6:8B60  16                   push ss
6:8B61  50                   push ax
6:8B62  9afae4758b           lcall 0x8b75, 0xe4fa  ; SCKillBldg@s7:E4FA
6:8B67  8d86acfe             lea ax, [bp - 0x154]
6:8B6B  16                   push ss
6:8B6C  50                   push ax
6:8B6D  66ff364857           push dword ptr [0x5748]  ; g_sim
6:8B72  9a5a83c58b           lcall 0x8bc5, 0x835a  ; Sim::enqueue@s7:835A
6:8B77  c786acfe9a38         mov word ptr [bp - 0x154], 0x389a
6:8B7D  c786aefec487         mov word ptr [bp - 0x152], 0x87c4  ; SEGMENT s2:0000
loc_8B83:
6:8B83  66ff76f0             push dword ptr [bp - 0x10]
6:8B87  666800000007         push 0x7000000
6:8B8D  c45e06               les bx, ptr [bp + 6]
6:8B90  66260fbf871a01       movsx eax, word ptr es:[bx + 0x11a]
6:8B97  6650                 push eax
6:8B99  26ffb71e01           push word ptr es:[bx + 0x11e]
6:8B9E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8BA3  90                   nop
6:8BA4  0e                   push cs
6:8BA5  e83857               call 0xe2e0  ; sub_s6:E2E0
6:8BA8  8946e4               mov word ptr [bp - 0x1c], ax
6:8BAB  8956e6               mov word ptr [bp - 0x1a], dx
6:8BAE  0bd0                 or dx, ax
6:8BB0  7508                 jne 0x8bba
6:8BB2  33c0                 xor ax, ax
6:8BB4  5e                   pop si
6:8BB5  5f                   pop di
6:8BB6  c9                   leave
6:8BB7  ca0400               retf 4
loc_8BBA:
6:8BBA  ff76e6               push word ptr [bp - 0x1a]
6:8BBD  50                   push ax
6:8BBE  66ff76ec             push dword ptr [bp - 0x14]
6:8BC2  9a5a7eef80           lcall 0x80ef, 0x7e5a  ; Tile::setBuilding@s7:7E5A
6:8BC7  66ff76e4             push dword ptr [bp - 0x1c]
6:8BCB  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8BD0  90                   nop
6:8BD1  0e                   push cs
6:8BD2  e81756               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8BD5  8946e0               mov word ptr [bp - 0x20], ax
6:8BD8  8956e2               mov word ptr [bp - 0x1e], dx
6:8BDB  66ff76f0             push dword ptr [bp - 0x10]
6:8BDF  52                   push dx
6:8BE0  c45ee0               les bx, ptr [bp - 0x20]
6:8BE3  50                   push ax
6:8BE4  26c41f               les bx, ptr es:[bx]
6:8BE7  8bf3                 mov si, bx
6:8BE9  8cc7                 mov di, es
6:8BEB  26ff5f04             lcall es:[bx + 4]
6:8BEF  66ff76e0             push dword ptr [bp - 0x20]
6:8BF3  8ec7                 mov es, di
6:8BF5  26ff5c20             lcall es:[si + 0x20]
6:8BF9  6a01                 push 1
6:8BFB  66ff76e0             push dword ptr [bp - 0x20]
6:8BFF  8ec7                 mov es, di
6:8C01  26ff5c18             lcall es:[si + 0x18]
6:8C05  c45e06               les bx, ptr [bp + 6]
6:8C08  2683bf1a0137         cmp word ptr es:[bx + 0x11a], 0x37
6:8C0E  751f                 jne 0x8c2f
6:8C10  668b46e0             mov eax, dword ptr [bp - 0x20]
6:8C14  8b56e2               mov dx, word ptr [bp - 0x1e]
6:8C17  668986acfe           mov dword ptr [bp - 0x154], eax
6:8C1C  66268b8f0c01         mov ecx, dword ptr es:[bx + 0x10c]
6:8C22  66894ec2             mov dword ptr [bp - 0x3e], ecx
6:8C26  8bd8                 mov bx, ax
6:8C28  8ec2                 mov es, dx
6:8C2A  6626894f20           mov dword ptr es:[bx + 0x20], ecx
loc_8C2F:
6:8C2F  668b46e0             mov eax, dword ptr [bp - 0x20]
6:8C33  c45e06               les bx, ptr [bp + 6]
6:8C36  662689872001         mov dword ptr es:[bx + 0x120], eax
6:8C3C  b80100               mov ax, 1
6:8C3F  5e                   pop si
6:8C40  5f                   pop di
6:8C41  c9                   leave
6:8C42  ca0400               retf 4
6:8C45  db 00

; ---------------- sub_s6:8C46 FAR size=284 callers=0
6:8C46  c8200000             enter 0x20, 0
6:8C4A  57                   push di
6:8C4B  56                   push si
6:8C4C  682401               push 0x124
6:8C4F  9a9c170e89           lcall 0x890e, 0x179c  ; operator_new@s1:179C
6:8C54  83c402               add sp, 2
6:8C57  8946f8               mov word ptr [bp - 8], ax
6:8C5A  8956fa               mov word ptr [bp - 6], dx
6:8C5D  0bd0                 or dx, ax
6:8C5F  0f84eb00             je 0x8d4e
6:8C63  c45ef8               les bx, ptr [bp - 8]
6:8C66  26c7079a38           mov word ptr es:[bx], 0x389a
6:8C6B  26c747026889         mov word ptr es:[bx + 2], 0x8968  ; SEGMENT s2:0000
6:8C71  c45e06               les bx, ptr [bp + 6]
6:8C74  66268b4704           mov eax, dword ptr es:[bx + 4]
6:8C79  c45ef8               les bx, ptr [bp - 8]
6:8C7C  6626894704           mov dword ptr es:[bx + 4], eax
6:8C81  8b4606               mov ax, word ptr [bp + 6]
6:8C84  8b5608               mov dx, word ptr [bp + 8]
6:8C87  050800               add ax, 8
6:8C8A  1e                   push ds
6:8C8B  8d7f08               lea di, [bx + 8]
6:8C8E  8bf0                 mov si, ax
6:8C90  8eda                 mov ds, dx
6:8C92  66b940000000         mov ecx, 0x40
6:8C98  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:8C9B  1f                   pop ds
6:8C9C  c45ef8               les bx, ptr [bp - 8]
6:8C9F  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:8CA4  26c74702418d         mov word ptr es:[bx + 2], 0x8d41  ; SEGMENT s6:0000
6:8CAA  c45e06               les bx, ptr [bp + 6]
6:8CAD  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:8CB3  c45ef8               les bx, ptr [bp - 8]
6:8CB6  662689870801         mov dword ptr es:[bx + 0x108], eax
6:8CBC  c45e06               les bx, ptr [bp + 6]
6:8CBF  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:8CC5  c45ef8               les bx, ptr [bp - 8]
6:8CC8  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:8CCE  c45e06               les bx, ptr [bp + 6]
6:8CD1  66268b871001         mov eax, dword ptr es:[bx + 0x110]
6:8CD7  c45ef8               les bx, ptr [bp - 8]
6:8CDA  662689871001         mov dword ptr es:[bx + 0x110], eax
6:8CE0  8b4606               mov ax, word ptr [bp + 6]
6:8CE3  8b5608               mov dx, word ptr [bp + 8]
6:8CE6  051401               add ax, 0x114
6:8CE9  1e                   push ds
6:8CEA  8dbf1401             lea di, [bx + 0x114]
6:8CEE  8bf0                 mov si, ax
6:8CF0  8eda                 mov ds, dx
6:8CF2  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:8CF4  a5                   movsw word ptr es:[di], word ptr [si]
6:8CF5  1f                   pop ds
6:8CF6  c45e06               les bx, ptr [bp + 6]
6:8CF9  268b871a01           mov ax, word ptr es:[bx + 0x11a]
6:8CFE  c45ef8               les bx, ptr [bp - 8]
6:8D01  2689871a01           mov word ptr es:[bx + 0x11a], ax
6:8D06  c45e06               les bx, ptr [bp + 6]
6:8D09  268b871c01           mov ax, word ptr es:[bx + 0x11c]
6:8D0E  c45ef8               les bx, ptr [bp - 8]
6:8D11  2689871c01           mov word ptr es:[bx + 0x11c], ax
6:8D16  c45e06               les bx, ptr [bp + 6]
6:8D19  268b871e01           mov ax, word ptr es:[bx + 0x11e]
6:8D1E  c45ef8               les bx, ptr [bp - 8]
6:8D21  2689871e01           mov word ptr es:[bx + 0x11e], ax
6:8D26  c45e06               les bx, ptr [bp + 6]
6:8D29  66268b872001         mov eax, dword ptr es:[bx + 0x120]
6:8D2F  c45ef8               les bx, ptr [bp - 8]
6:8D32  662689872001         mov dword ptr es:[bx + 0x120], eax
6:8D38  26c7078e8d           mov word ptr es:[bx], 0x8d8e
6:8D3D  26c74702fd88         mov word ptr es:[bx + 2], 0x88fd  ; SEGMENT s6:0000
6:8D43  668b46f8             mov eax, dword ptr [bp - 8]
6:8D47  668946fc             mov dword ptr [bp - 4], eax
6:8D4B  eb09                 jmp 0x8d56
6:8D4D  db 90
loc_8D4E:
6:8D4E  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_8D56:
6:8D56  8b46fc               mov ax, word ptr [bp - 4]
6:8D59  8b56fe               mov dx, word ptr [bp - 2]
6:8D5C  5e                   pop si
6:8D5D  5f                   pop di
6:8D5E  c9                   leave
6:8D5F  ca0400               retf 4

; ---------------- sub_s6:8D62 size=60 callers=0
6:8D62  c80c0000             enter 0xc, 0
6:8D66  c45e06               les bx, ptr [bp + 6]
6:8D69  26c7079a38           mov word ptr es:[bx], 0x389a
6:8D6E  26c747026f8c         mov word ptr es:[bx + 2], 0x8c6f  ; SEGMENT s2:0000
6:8D74  f6460a01             test byte ptr [bp + 0xa], 1
6:8D78  7409                 je 0x8d83
6:8D7A  66ff7606             push dword ptr [bp + 6]
6:8D7E  9ace17528c           lcall 0x8c52, 0x17ce  ; operator_delete@s1:17CE
loc_8D83:
6:8D83  8b4606               mov ax, word ptr [bp + 6]
6:8D86  8b5608               mov dx, word ptr [bp + 8]
6:8D89  c9                   leave
6:8D8A  ca0600               retf 6
6:8D8D  db 00 62 8d 94 8d 22 d2 98 8d 20 89 9c 8d 46 8c a8
6:8D9D  db 8c

; ---------------- sub_s6:8D9E FAR size=78 callers=1
6:8D9E  55                   push bp
6:8D9F  8bec                 mov bp, sp
6:8DA1  68e803               push 0x3e8
6:8DA4  66ff7606             push dword ptr [bp + 6]
6:8DA8  90                   nop
6:8DA9  0e                   push cs
6:8DAA  e82f44               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:8DAD  668b4612             mov eax, dword ptr [bp + 0x12]
6:8DB1  c45e06               les bx, ptr [bp + 6]
6:8DB4  662689870801         mov dword ptr es:[bx + 0x108], eax
6:8DBA  668b460e             mov eax, dword ptr [bp + 0xe]
6:8DBE  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:8DC4  668b460a             mov eax, dword ptr [bp + 0xa]
6:8DC8  662689871001         mov dword ptr es:[bx + 0x110], eax
6:8DCE  6626c787140100000000 mov dword ptr es:[bx + 0x114], 0
6:8DD8  26c707b08f           mov word ptr es:[bx], 0x8fb0
6:8DDD  26c74702908d         mov word ptr es:[bx + 2], 0x8d90  ; SEGMENT s6:0000
6:8DE3  8bc3                 mov ax, bx
6:8DE5  8cc2                 mov dx, es
6:8DE7  c9                   leave
6:8DE8  ca1000               retf 0x10
6:8DEB  db 00

; ---------------- sub_s6:8DEC FAR size=50 callers=2
6:8DEC  c80c0000             enter 0xc, 0
6:8DF0  c45e06               les bx, ptr [bp + 6]
6:8DF3  26c707b08f           mov word ptr es:[bx], 0x8fb0
6:8DF8  26c74702e18d         mov word ptr es:[bx + 2], 0x8de1  ; SEGMENT s6:0000
6:8DFE  66268b871401         mov eax, dword ptr es:[bx + 0x114]
6:8E04  6650                 push eax
6:8E06  9ace17818d           lcall 0x8d81, 0x17ce  ; operator_delete@s1:17CE
6:8E0B  c45e06               les bx, ptr [bp + 6]
6:8E0E  26c7079a38           mov word ptr es:[bx], 0x389a
6:8E13  26c74702728d         mov word ptr es:[bx + 2], 0x8d72  ; SEGMENT s2:0000
6:8E19  c9                   leave
6:8E1A  ca0400               retf 4
6:8E1D  db 00

; ---------------- sub_s6:8E1E FAR size=62 callers=0
6:8E1E  c8100000             enter 0x10, 0
6:8E22  c45e06               les bx, ptr [bp + 6]
6:8E25  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:8E2B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8E30  90                   nop
6:8E31  0e                   push cs
6:8E32  e8b753               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8E35  8946fc               mov word ptr [bp - 4], ax
6:8E38  8956fe               mov word ptr [bp - 2], dx
6:8E3B  c45efc               les bx, ptr [bp - 4]
6:8E3E  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:8E44  c45e06               les bx, ptr [bp + 6]
6:8E47  6626ffb71401         push dword ptr es:[bx + 0x114]
6:8E4D  6650                 push eax
6:8E4F  9a5c354689           lcall 0x8946, 0x355c  ; sub_s7:355C
6:8E54  b80100               mov ax, 1
6:8E57  c9                   leave
6:8E58  ca0400               retf 4
6:8E5B  db 00

; ---------------- sub_s6:8E5C FAR size=74 callers=0
6:8E5C  c8100000             enter 0x10, 0
6:8E60  c45e06               les bx, ptr [bp + 6]
6:8E63  6626ffb70801         push dword ptr es:[bx + 0x108]
6:8E69  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:8E6E  90                   nop
6:8E6F  0e                   push cs
6:8E70  e87953               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:8E73  8946fc               mov word ptr [bp - 4], ax
6:8E76  8956fe               mov word ptr [bp - 2], dx
6:8E79  c45efc               les bx, ptr [bp - 4]
6:8E7C  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:8E82  c45e06               les bx, ptr [bp + 6]
6:8E85  6626ffb71001         push dword ptr es:[bx + 0x110]
6:8E8B  6650                 push eax
6:8E8D  9aa435528e           lcall 0x8e52, 0x35a4  ; sub_s7:35A4
6:8E92  c45e06               les bx, ptr [bp + 6]
6:8E95  2689871401           mov word ptr es:[bx + 0x114], ax
6:8E9A  2689971601           mov word ptr es:[bx + 0x116], dx
6:8E9F  b80100               mov ax, 1
6:8EA2  c9                   leave
6:8EA3  ca0400               retf 4

; ---------------- sub_s6:8EA6 size=228 callers=0
6:8EA6  c8200000             enter 0x20, 0
6:8EAA  57                   push di
6:8EAB  56                   push si
6:8EAC  681801               push 0x118
6:8EAF  9a9c17098e           lcall 0x8e09, 0x179c  ; operator_new@s1:179C
6:8EB4  83c402               add sp, 2
6:8EB7  8946f8               mov word ptr [bp - 8], ax
6:8EBA  8956fa               mov word ptr [bp - 6], dx
6:8EBD  0bd0                 or dx, ax
6:8EBF  0f84a500             je 0x8f68
6:8EC3  c45ef8               les bx, ptr [bp - 8]
6:8EC6  26c7079a38           mov word ptr es:[bx], 0x389a
6:8ECB  26c74702178e         mov word ptr es:[bx + 2], 0x8e17  ; SEGMENT s2:0000
6:8ED1  c45e06               les bx, ptr [bp + 6]
6:8ED4  66268b4704           mov eax, dword ptr es:[bx + 4]
6:8ED9  c45ef8               les bx, ptr [bp - 8]
6:8EDC  6626894704           mov dword ptr es:[bx + 4], eax
6:8EE1  8b4606               mov ax, word ptr [bp + 6]
6:8EE4  8b5608               mov dx, word ptr [bp + 8]
6:8EE7  050800               add ax, 8
6:8EEA  1e                   push ds
6:8EEB  8d7f08               lea di, [bx + 8]
6:8EEE  8bf0                 mov si, ax
6:8EF0  8eda                 mov ds, dx
6:8EF2  66b940000000         mov ecx, 0x40
6:8EF8  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:8EFB  1f                   pop ds
6:8EFC  c45ef8               les bx, ptr [bp - 8]
6:8EFF  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:8F04  26c747025b8f         mov word ptr es:[bx + 2], 0x8f5b  ; SEGMENT s6:0000
6:8F0A  c45e06               les bx, ptr [bp + 6]
6:8F0D  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:8F13  c45ef8               les bx, ptr [bp - 8]
6:8F16  662689870801         mov dword ptr es:[bx + 0x108], eax
6:8F1C  c45e06               les bx, ptr [bp + 6]
6:8F1F  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:8F25  c45ef8               les bx, ptr [bp - 8]
6:8F28  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:8F2E  c45e06               les bx, ptr [bp + 6]
6:8F31  66268b871001         mov eax, dword ptr es:[bx + 0x110]
6:8F37  c45ef8               les bx, ptr [bp - 8]
6:8F3A  662689871001         mov dword ptr es:[bx + 0x110], eax
6:8F40  c45e06               les bx, ptr [bp + 6]
6:8F43  66268b871401         mov eax, dword ptr es:[bx + 0x114]
6:8F49  c45ef8               les bx, ptr [bp - 8]
6:8F4C  662689871401         mov dword ptr es:[bx + 0x114], eax
6:8F52  26c707b08f           mov word ptr es:[bx], 0x8fb0
6:8F57  26c74702fc8d         mov word ptr es:[bx + 2], 0x8dfc  ; SEGMENT s6:0000
6:8F5D  668b46f8             mov eax, dword ptr [bp - 8]
6:8F61  668946fc             mov dword ptr [bp - 4], eax
6:8F65  eb09                 jmp 0x8f70
6:8F67  db 90
loc_8F68:
6:8F68  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_8F70:
6:8F70  c45e06               les bx, ptr [bp + 6]
6:8F73  6626c787140100000000 mov dword ptr es:[bx + 0x114], 0
6:8F7D  8b46fc               mov ax, word ptr [bp - 4]
6:8F80  8b56fe               mov dx, word ptr [bp - 2]
6:8F83  5e                   pop si
6:8F84  5f                   pop di
6:8F85  c9                   leave
6:8F86  ca0400               retf 4
6:8F89  db 00

; ---------------- sub_s6:8F8A FAR size=54 callers=0
6:8F8A  55                   push bp
6:8F8B  8bec                 mov bp, sp
6:8F8D  66ff7606             push dword ptr [bp + 6]
6:8F91  90                   nop
6:8F92  0e                   push cs
6:8F93  e856fe               call 0x8dec  ; sub_s6:8DEC
6:8F96  f6460a01             test byte ptr [bp + 0xa], 1
6:8F9A  7409                 je 0x8fa5
6:8F9C  66ff7606             push dword ptr [bp + 6]
6:8FA0  9ace17b28e           lcall 0x8eb2, 0x17ce  ; operator_delete@s1:17CE
loc_8FA5:
6:8FA5  8b4606               mov ax, word ptr [bp + 6]
6:8FA8  8b5608               mov dx, word ptr [bp + 8]
6:8FAB  c9                   leave
6:8FAC  ca0600               retf 6
6:8FAF  db 00 8a 8f b6 8f 1e 8e ba 8f 5c 8e be 8f a6 8e 08
6:8FBF  db 8f

; ---------------- sub_s6:8FC0 FAR size=42 callers=1
6:8FC0  55                   push bp
6:8FC1  8bec                 mov bp, sp
6:8FC3  66ff760e             push dword ptr [bp + 0xe]
6:8FC7  66ff760a             push dword ptr [bp + 0xa]
6:8FCB  66ff7606             push dword ptr [bp + 6]
6:8FCF  90                   nop
6:8FD0  0e                   push cs
6:8FD1  e81edb               call 0x6af2  ; sub_s6:6AF2
6:8FD4  c45e06               les bx, ptr [bp + 6]
6:8FD7  26c707d690           mov word ptr es:[bx], 0x90d6
6:8FDC  26c74702b28f         mov word ptr es:[bx + 2], 0x8fb2  ; SEGMENT s6:0000
6:8FE2  8bc3                 mov ax, bx
6:8FE4  8cc2                 mov dx, es
6:8FE6  c9                   leave
6:8FE7  ca0c00               retf 0xc

; ---------------- sub_s6:8FEA size=192 callers=0
6:8FEA  c8280000             enter 0x28, 0
6:8FEE  57                   push di
6:8FEF  56                   push si
6:8FF0  681001               push 0x110  ; 'New failed in Op::Op->Simulator'
6:8FF3  9a9c17a38f           lcall 0x8fa3, 0x179c  ; operator_new@s1:179C
6:8FF8  83c402               add sp, 2
6:8FFB  8946f8               mov word ptr [bp - 8], ax
6:8FFE  8956fa               mov word ptr [bp - 6], dx
6:9001  0bd0                 or dx, ax
6:9003  0f848f00             je 0x9096
6:9007  c45ef8               les bx, ptr [bp - 8]
6:900A  26c7079a38           mov word ptr es:[bx], 0x389a
6:900F  26c74702cf8e         mov word ptr es:[bx + 2], 0x8ecf  ; SEGMENT s2:0000
6:9015  c45e06               les bx, ptr [bp + 6]
6:9018  66268b4704           mov eax, dword ptr es:[bx + 4]
6:901D  c45ef8               les bx, ptr [bp - 8]
6:9020  6626894704           mov dword ptr es:[bx + 4], eax
6:9025  8b4606               mov ax, word ptr [bp + 6]
6:9028  8b5608               mov dx, word ptr [bp + 8]
6:902B  050800               add ax, 8
6:902E  1e                   push ds
6:902F  8d7f08               lea di, [bx + 8]
6:9032  8bf0                 mov si, ax
6:9034  8eda                 mov ds, dx
6:9036  66b940000000         mov ecx, 0x40
6:903C  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:903F  1f                   pop ds
6:9040  c45ef8               les bx, ptr [bp - 8]
6:9043  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:9048  26c747027b90         mov word ptr es:[bx + 2], 0x907b  ; SEGMENT s6:0000
6:904E  c45e06               les bx, ptr [bp + 6]
6:9051  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:9057  c45ef8               les bx, ptr [bp - 8]
6:905A  662689870801         mov dword ptr es:[bx + 0x108], eax
6:9060  c45e06               les bx, ptr [bp + 6]
6:9063  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:9069  c45ef8               les bx, ptr [bp - 8]
6:906C  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:9072  26c707506e           mov word ptr es:[bx], 0x6e50
6:9077  26c747028990         mov word ptr es:[bx + 2], 0x9089  ; SEGMENT s6:0000
6:907D  c45ef8               les bx, ptr [bp - 8]
6:9080  26c707d690           mov word ptr es:[bx], 0x90d6
6:9085  26c74702e08f         mov word ptr es:[bx + 2], 0x8fe0  ; SEGMENT s6:0000
6:908B  668b46f8             mov eax, dword ptr [bp - 8]
6:908F  668946fc             mov dword ptr [bp - 4], eax
6:9093  eb09                 jmp 0x909e
6:9095  db 90
loc_9096:
6:9096  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_909E:
6:909E  8b46fc               mov ax, word ptr [bp - 4]
6:90A1  8b56fe               mov dx, word ptr [bp - 2]
6:90A4  5e                   pop si
6:90A5  5f                   pop di
6:90A6  c9                   leave
6:90A7  ca0400               retf 4

; ---------------- sub_s6:90AA size=60 callers=0
6:90AA  c8100000             enter 0x10, 0
6:90AE  c45e06               les bx, ptr [bp + 6]
6:90B1  26c7079a38           mov word ptr es:[bx], 0x389a
6:90B6  26c747021390         mov word ptr es:[bx + 2], 0x9013  ; SEGMENT s2:0000
6:90BC  f6460a01             test byte ptr [bp + 0xa], 1
6:90C0  7409                 je 0x90cb
6:90C2  66ff7606             push dword ptr [bp + 6]
6:90C6  9ace17f68f           lcall 0x8ff6, 0x17ce  ; operator_delete@s1:17CE
loc_90CB:
6:90CB  8b4606               mov ax, word ptr [bp + 6]
6:90CE  8b5608               mov dx, word ptr [bp + 8]
6:90D1  c9                   leave
6:90D2  ca0600               retf 6
6:90D5  db 00 aa 90 dc 90 2c 6b e0 90 28 d2 e4 90 ea 8f 4c
6:90E5  db 90

; ---------------- sub_s6:90E6 FAR size=46 callers=1
6:90E6  55                   push bp
6:90E7  8bec                 mov bp, sp
6:90E9  688713               push 0x1387
6:90EC  66ff7606             push dword ptr [bp + 6]
6:90F0  90                   nop
6:90F1  0e                   push cs
6:90F2  e8e740               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:90F5  8b460a               mov ax, word ptr [bp + 0xa]
6:90F8  c45e06               les bx, ptr [bp + 6]
6:90FB  2689870801           mov word ptr es:[bx + 0x108], ax
6:9100  26c7072c93           mov word ptr es:[bx], 0x932c
6:9105  26c74702d890         mov word ptr es:[bx + 2], 0x90d8  ; SEGMENT s6:0000
6:910B  8bc3                 mov ax, bx
6:910D  8cc2                 mov dx, es
6:910F  c9                   leave
6:9110  ca0600               retf 6
6:9113  db 00

; ---------------- sub_s6:9114 FAR size=336 callers=0
6:9114  c8140000             enter 0x14, 0
6:9118  6a37                 push 0x37
6:911A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:911F  9aba209f91           lcall 0x919f, 0x20ba  ; sub_s3:20BA
6:9124  8946fc               mov word ptr [bp - 4], ax
6:9127  8956fe               mov word ptr [bp - 2], dx
6:912A  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:912E  66268b07             mov eax, dword ptr es:[bx]
6:9132  268b5702             mov dx, word ptr es:[bx + 2]
6:9136  668946f8             mov dword ptr [bp - 8], eax
6:913A  c45e06               les bx, ptr [bp + 6]
6:913D  268b870801           mov ax, word ptr es:[bx + 0x108]
6:9142  e9f900               jmp 0x923e
6:9145  db 90
loc_9146:
6:9146  6a16                 push 0x16
loc_9148:
6:9148  666a00               push 0
6:914B  666800000100         push 0x10000
6:9151  666a00               push 0
6:9154  66ff76fc             push dword ptr [bp - 4]
6:9158  9ae4a07d91           lcall 0x917d, 0xa0e4  ; sub_s2:A0E4
6:915D  e9fc00               jmp 0x925c
loc_9160:
6:9160  6a17                 push 0x17
6:9162  ebe4                 jmp 0x9148
loc_9164:
6:9164  6a18                 push 0x18
6:9166  ebe0                 jmp 0x9148
loc_9168:
6:9168  6a1b                 push 0x1b
6:916A  ebdc                 jmp 0x9148
loc_916C:
6:916C  6a1f                 push 0x1f
6:916E  ebd8                 jmp 0x9148
loc_9170:
6:9170  6a24                 push 0x24
6:9172  ebd4                 jmp 0x9148
loc_9174:
6:9174  666800001400         push 0x140000
6:917A  9a2e61b191           lcall 0x91b1, 0x612e  ; sub_s2:612E
6:917F  83c404               add sp, 4
6:9182  99                   cdq
6:9183  056e00               add ax, 0x6e
6:9186  83d200               adc dx, 0
6:9189  0146f8               add word ptr [bp - 8], ax
6:918C  1156fa               adc word ptr [bp - 6], dx
6:918F  6a07                 push 7
6:9191  66ff76f8             push dword ptr [bp - 8]
6:9195  6a2f                 push 0x2f
6:9197  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:919C  9aba20a691           lcall 0x91a6, 0x20ba  ; sub_s3:20BA
6:91A1  52                   push dx
6:91A2  50                   push ax
6:91A3  9af8eb0c92           lcall 0x920c, 0xebf8  ; sub_s3:EBF8
6:91A8  666801006400         push 0x640001
6:91AE  9a2e61e791           lcall 0x91e7, 0x612e  ; sub_s2:612E
6:91B3  83c404               add sp, 4
6:91B6  3d3200               cmp ax, 0x32
6:91B9  0f8f9f00             jg 0x925c
6:91BD  666800040100         push 0x10400
6:91C3  6a01                 push 1
6:91C5  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:91CA  90                   nop
6:91CB  0e                   push cs
6:91CC  e81d50               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:91CF  8946ec               mov word ptr [bp - 0x14], ax
6:91D2  52                   push dx
6:91D3  50                   push ax
6:91D4  9a00493692           lcall 0x9236, 0x4900  ; sub_s8:4900
6:91D9  6a2c                 push 0x2c
6:91DB  e96aff               jmp 0x9148
loc_91DE:
6:91DE  666800001400         push 0x140000
6:91E4  9a2e61ba90           lcall 0x90ba, 0x612e  ; sub_s2:612E
6:91E9  83c404               add sp, 4
6:91EC  8946ec               mov word ptr [bp - 0x14], ax
6:91EF  99                   cdq
6:91F0  056400               add ax, 0x64
6:91F3  83d200               adc dx, 0
6:91F6  0146f8               add word ptr [bp - 8], ax
6:91F9  1156fa               adc word ptr [bp - 6], dx
6:91FC  6a08                 push 8
6:91FE  66ff76f8             push dword ptr [bp - 8]
6:9202  6a2f                 push 0x2f
6:9204  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:9209  9aba201392           lcall 0x9213, 0x20ba  ; sub_s3:20BA
6:920E  52                   push dx
6:920F  50                   push ax
6:9210  9af8eb3e8a           lcall 0x8a3e, 0xebf8  ; sub_s3:EBF8
6:9215  837eec19             cmp word ptr [bp - 0x14], 0x19
6:9219  7f41                 jg 0x925c
6:921B  666801000200         push 0x20001
6:9221  666801000004         push 0x4000001
6:9227  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:922C  90                   nop
6:922D  0e                   push cs
6:922E  e8bb4f               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:9231  52                   push dx
6:9232  50                   push ax
6:9233  9acc438285           lcall 0x8582, 0x43cc  ; sub_s8:43CC
6:9238  6a2d                 push 0x2d
6:923A  e90bff               jmp 0x9148
6:923D  db 90
loc_923E:
6:923E  48                   dec ax
6:923F  3d0700               cmp ax, 7
6:9242  7718                 ja 0x925c
6:9244  03c0                 add ax, ax
6:9246  93                   xchg bx, ax
6:9247  2effa74c92           jmp word ptr cs:[bx - 0x6db4]
switch_table_924C:
    dw loc_9146
    dw loc_9160
    dw loc_9164
    dw loc_9168
    dw loc_916C
    dw loc_9170
    dw loc_9174
    dw loc_91DE
loc_925C:
6:925C  b80100               mov ax, 1
6:925F  c9                   leave
6:9260  ca0400               retf 4
6:9263  db 00

; ---------------- sub_s6:9264 FAR size=156 callers=0
6:9264  c8200000             enter 0x20, 0
6:9268  57                   push di
6:9269  56                   push si
6:926A  680a01               push 0x10a
6:926D  9a9c17c990           lcall 0x90c9, 0x179c  ; operator_new@s1:179C
6:9272  83c402               add sp, 2
6:9275  8946f8               mov word ptr [bp - 8], ax
6:9278  8956fa               mov word ptr [bp - 6], dx
6:927B  0bd0                 or dx, ax
6:927D  746d                 je 0x92ec
6:927F  c45ef8               les bx, ptr [bp - 8]
6:9282  26c7079a38           mov word ptr es:[bx], 0x389a
6:9287  26c747025b91         mov word ptr es:[bx + 2], 0x915b  ; SEGMENT s2:0000
6:928D  c45e06               les bx, ptr [bp + 6]
6:9290  66268b4704           mov eax, dword ptr es:[bx + 4]
6:9295  c45ef8               les bx, ptr [bp - 8]
6:9298  6626894704           mov dword ptr es:[bx + 4], eax
6:929D  8b4606               mov ax, word ptr [bp + 6]
6:92A0  8b5608               mov dx, word ptr [bp + 8]
6:92A3  050800               add ax, 8
6:92A6  1e                   push ds
6:92A7  8d7f08               lea di, [bx + 8]
6:92AA  8bf0                 mov si, ax
6:92AC  8eda                 mov ds, dx
6:92AE  66b940000000         mov ecx, 0x40
6:92B4  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:92B7  1f                   pop ds
6:92B8  c45ef8               les bx, ptr [bp - 8]
6:92BB  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:92C0  26c74702df92         mov word ptr es:[bx + 2], 0x92df  ; SEGMENT s6:0000
6:92C6  c45e06               les bx, ptr [bp + 6]
6:92C9  268b870801           mov ax, word ptr es:[bx + 0x108]
6:92CE  c45ef8               les bx, ptr [bp - 8]
6:92D1  2689870801           mov word ptr es:[bx + 0x108], ax
6:92D6  26c7072c93           mov word ptr es:[bx], 0x932c
6:92DB  26c747020991         mov word ptr es:[bx + 2], 0x9109  ; SEGMENT s6:0000
6:92E1  668b46f8             mov eax, dword ptr [bp - 8]
6:92E5  668946fc             mov dword ptr [bp - 4], eax
6:92E9  eb09                 jmp 0x92f4
6:92EB  db 90
loc_92EC:
6:92EC  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_92F4:
6:92F4  8b46fc               mov ax, word ptr [bp - 4]
6:92F7  8b56fe               mov dx, word ptr [bp - 2]
6:92FA  5e                   pop si
6:92FB  5f                   pop di
6:92FC  c9                   leave
6:92FD  ca0400               retf 4

; ---------------- sub_s6:9300 size=60 callers=0
6:9300  c80c0000             enter 0xc, 0
6:9304  c45e06               les bx, ptr [bp + 6]
6:9307  26c7079a38           mov word ptr es:[bx], 0x389a
6:930C  26c747028b92         mov word ptr es:[bx + 2], 0x928b  ; SEGMENT s2:0000
6:9312  f6460a01             test byte ptr [bp + 0xa], 1
6:9316  7409                 je 0x9321
6:9318  66ff7606             push dword ptr [bp + 6]
6:931C  9ace177092           lcall 0x9270, 0x17ce  ; operator_delete@s1:17CE
loc_9321:
6:9321  8b4606               mov ax, word ptr [bp + 6]
6:9324  8b5608               mov dx, word ptr [bp + 8]
6:9327  c9                   leave
6:9328  ca0600               retf 6
6:932B  db 00 00 93 32 93 14 91 36 93 28 d2 3a 93 64 92 c4
6:933B  db 92

; ---------------- SCPutBldg@s6:933C FAR size=152 callers=1
6:933C  55                   push bp
6:933D  8bec                 mov bp, sp
6:933F  57                   push di
6:9340  56                   push si
6:9341  68e803               push 0x3e8
6:9344  66ff7606             push dword ptr [bp + 6]
6:9348  90                   nop
6:9349  0e                   push cs
6:934A  e88f3e               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:934D  668b4618             mov eax, dword ptr [bp + 0x18]
6:9351  8b561a               mov dx, word ptr [bp + 0x1a]
6:9354  c45e06               les bx, ptr [bp + 6]
6:9357  662689870801         mov dword ptr es:[bx + 0x108], eax
6:935D  668b4e14             mov ecx, dword ptr [bp + 0x14]
6:9361  6626898f0c01         mov dword ptr es:[bx + 0x10c], ecx
6:9367  6626c787100100000000 mov dword ptr es:[bx + 0x110], 0
6:9371  8b7610               mov si, word ptr [bp + 0x10]
6:9374  8b7e12               mov di, word ptr [bp + 0x12]
6:9377  1e                   push ds
6:9378  57                   push di
6:9379  8dbf1401             lea di, [bx + 0x114]
6:937D  1f                   pop ds
6:937E  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:9380  a5                   movsw word ptr es:[di], word ptr [si]
6:9381  1f                   pop ds
6:9382  8b4e0e               mov cx, word ptr [bp + 0xe]
6:9385  c45e06               les bx, ptr [bp + 6]
6:9388  26898f1a01           mov word ptr es:[bx + 0x11a], cx
6:938D  8b760a               mov si, word ptr [bp + 0xa]
6:9390  2689b71c01           mov word ptr es:[bx + 0x11c], si
6:9395  2bf6                 sub si, si
6:9397  2689b72001           mov word ptr es:[bx + 0x120], si
6:939C  2689b71e01           mov word ptr es:[bx + 0x11e], si
6:93A1  8b760c               mov si, word ptr [bp + 0xc]
6:93A4  2689b72201           mov word ptr es:[bx + 0x122], si
6:93A9  26c7073499           mov word ptr es:[bx], 0x9934
6:93AE  26c747022e93         mov word ptr es:[bx + 2], 0x932e  ; SEGMENT s6:0000
6:93B4  51                   push cx
6:93B5  52                   push dx
6:93B6  50                   push ax
6:93B7  1e                   push ds
6:93B8  68ce50               push 0x50ce  ; 'SCPutBldg site:0x%08lx. bldg:%u.'
6:93BB  8d4708               lea ax, [bx + 8]
6:93BE  06                   push es
6:93BF  50                   push ax
6:93C0  9a9c3f1f93           lcall 0x931f, 0x3f9c  ; _fsprintf@s1:3F9C
6:93C5  83c40e               add sp, 0xe
6:93C8  8b4606               mov ax, word ptr [bp + 6]
6:93CB  8b5608               mov dx, word ptr [bp + 8]
6:93CE  5e                   pop si
6:93CF  5f                   pop di
6:93D0  c9                   leave
6:93D1  ca1600               retf 0x16

; ---------------- SCPutBldg::shouldRun@s6:93D4 size=272 callers=0
6:93D4  c81e0100             enter 0x11e, 0
6:93D8  33c0                 xor ax, ax
6:93DA  a3ca50               mov word ptr [0x50ca], ax
6:93DD  a3cc50               mov word ptr [0x50cc], ax
6:93E0  680005               push 0x500
6:93E3  50                   push ax
6:93E4  680007               push 0x700
6:93E7  50                   push ax
6:93E8  c45e06               les bx, ptr [bp + 6]
6:93EB  66260fbf871a01       movsx eax, word ptr es:[bx + 0x11a]
6:93F2  6650                 push eax
6:93F4  26ffb71c01           push word ptr es:[bx + 0x11c]
6:93F9  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:93FE  90                   nop
6:93FF  0e                   push cs
6:9400  e8dd4e               call 0xe2e0  ; sub_s6:E2E0
6:9403  8946fc               mov word ptr [bp - 4], ax
6:9406  8956fe               mov word ptr [bp - 2], dx
6:9409  52                   push dx
6:940A  50                   push ax
6:940B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9410  90                   nop
6:9411  0e                   push cs
6:9412  e8d74d               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:9415  c45e06               les bx, ptr [bp + 6]
6:9418  2689871e01           mov word ptr es:[bx + 0x11e], ax
6:941D  2689972001           mov word ptr es:[bx + 0x120], dx
6:9422  6626ffb70801         push dword ptr es:[bx + 0x108]
6:9428  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:942E  8d871401             lea ax, [bx + 0x114]
6:9432  06                   push es
6:9433  50                   push ax
6:9434  6626ffb71e01         push dword ptr es:[bx + 0x11e]
6:943A  26c49f1e01           les bx, ptr es:[bx + 0x11e]
6:943F  26c41f               les bx, ptr es:[bx]
6:9442  26ff5f1c             lcall es:[bx + 0x1c]
6:9446  0bc0                 or ax, ax
6:9448  7446                 je 0x9490
6:944A  66ff7606             push dword ptr [bp + 6]
6:944E  90                   nop
6:944F  0e                   push cs
6:9450  e8d101               call 0x9624  ; sub_s6:9624
6:9453  c45e06               les bx, ptr [bp + 6]
6:9456  6626ffb71e01         push dword ptr es:[bx + 0x11e]
6:945C  26c49f1e01           les bx, ptr es:[bx + 0x11e]
6:9461  26c41f               les bx, ptr es:[bx]
6:9464  26ff5f20             lcall es:[bx + 0x20]
6:9468  6a00                 push 0
6:946A  c45e06               les bx, ptr [bp + 6]
6:946D  6626ffb71e01         push dword ptr es:[bx + 0x11e]
6:9473  26c49f1e01           les bx, ptr es:[bx + 0x11e]
6:9478  26c41f               les bx, ptr es:[bx]
6:947B  26ff5f18             lcall es:[bx + 0x18]
6:947F  66ff7606             push dword ptr [bp + 6]
6:9483  90                   nop
6:9484  0e                   push cs
6:9485  e87801               call 0x9600  ; sub_s6:9600
6:9488  b80100               mov ax, 1
6:948B  c9                   leave
6:948C  ca0400               retf 4
6:948F  db 90
loc_9490:
6:9490  c45e06               les bx, ptr [bp + 6]
6:9493  6626c7871e0100000000 mov dword ptr es:[bx + 0x11e], 0
6:949D  66ff76fc             push dword ptr [bp - 4]
6:94A1  8d86f0fe             lea ax, [bp - 0x110]
6:94A5  16                   push ss
6:94A6  50                   push ax
6:94A7  9afae4ba94           lcall 0x94ba, 0xe4fa  ; SCKillBldg@s7:E4FA
6:94AC  8d86f0fe             lea ax, [bp - 0x110]
6:94B0  16                   push ss
6:94B1  50                   push ax
6:94B2  66ff364857           push dword ptr [0x5748]  ; g_sim
6:94B7  9a5a83908e           lcall 0x8e90, 0x835a  ; Sim::enqueue@s7:835A
6:94BC  833eca5000           cmp word ptr [0x50ca], 0
6:94C1  7506                 jne 0x94c9
6:94C3  c706ca50ad06         mov word ptr [0x50ca], 0x6ad
loc_94C9:
6:94C9  c786eefe0000         mov word ptr [bp - 0x112], 0
6:94CF  c786f0fe9a38         mov word ptr [bp - 0x110], 0x389a
6:94D5  c786f2fe1093         mov word ptr [bp - 0x10e], 0x9310  ; SEGMENT s2:0000
6:94DB  8b86eefe             mov ax, word ptr [bp - 0x112]
6:94DF  c9                   leave
6:94E0  ca0400               retf 4
6:94E3  db 00

; ---------------- SCPutBldg::clone@s6:94E4 FAR size=284 callers=0
6:94E4  c8200000             enter 0x20, 0
6:94E8  57                   push di
6:94E9  56                   push si
6:94EA  682401               push 0x124
6:94ED  9a9c17c393           lcall 0x93c3, 0x179c  ; operator_new@s1:179C
6:94F2  83c402               add sp, 2
6:94F5  8946f8               mov word ptr [bp - 8], ax
6:94F8  8956fa               mov word ptr [bp - 6], dx
6:94FB  0bd0                 or dx, ax
6:94FD  0f84eb00             je 0x95ec
6:9501  c45ef8               les bx, ptr [bp - 8]
6:9504  26c7079a38           mov word ptr es:[bx], 0x389a
6:9509  26c74702d994         mov word ptr es:[bx + 2], 0x94d9  ; SEGMENT s2:0000
6:950F  c45e06               les bx, ptr [bp + 6]
6:9512  66268b4704           mov eax, dword ptr es:[bx + 4]
6:9517  c45ef8               les bx, ptr [bp - 8]
6:951A  6626894704           mov dword ptr es:[bx + 4], eax
6:951F  8b4606               mov ax, word ptr [bp + 6]
6:9522  8b5608               mov dx, word ptr [bp + 8]
6:9525  050800               add ax, 8
6:9528  1e                   push ds
6:9529  8d7f08               lea di, [bx + 8]
6:952C  8bf0                 mov si, ax
6:952E  8eda                 mov ds, dx
6:9530  66b940000000         mov ecx, 0x40
6:9536  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:9539  1f                   pop ds
6:953A  c45ef8               les bx, ptr [bp - 8]
6:953D  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:9542  26c74702df95         mov word ptr es:[bx + 2], 0x95df  ; SEGMENT s6:0000
6:9548  c45e06               les bx, ptr [bp + 6]
6:954B  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:9551  c45ef8               les bx, ptr [bp - 8]
6:9554  662689870801         mov dword ptr es:[bx + 0x108], eax
6:955A  c45e06               les bx, ptr [bp + 6]
6:955D  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:9563  c45ef8               les bx, ptr [bp - 8]
6:9566  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:956C  c45e06               les bx, ptr [bp + 6]
6:956F  66268b871001         mov eax, dword ptr es:[bx + 0x110]
6:9575  c45ef8               les bx, ptr [bp - 8]
6:9578  662689871001         mov dword ptr es:[bx + 0x110], eax
6:957E  8b4606               mov ax, word ptr [bp + 6]
6:9581  8b5608               mov dx, word ptr [bp + 8]
6:9584  051401               add ax, 0x114
6:9587  1e                   push ds
6:9588  8dbf1401             lea di, [bx + 0x114]
6:958C  8bf0                 mov si, ax
6:958E  8eda                 mov ds, dx
6:9590  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:9592  a5                   movsw word ptr es:[di], word ptr [si]
6:9593  1f                   pop ds
6:9594  c45e06               les bx, ptr [bp + 6]
6:9597  268b871a01           mov ax, word ptr es:[bx + 0x11a]
6:959C  c45ef8               les bx, ptr [bp - 8]
6:959F  2689871a01           mov word ptr es:[bx + 0x11a], ax
6:95A4  c45e06               les bx, ptr [bp + 6]
6:95A7  268b871c01           mov ax, word ptr es:[bx + 0x11c]
6:95AC  c45ef8               les bx, ptr [bp - 8]
6:95AF  2689871c01           mov word ptr es:[bx + 0x11c], ax
6:95B4  c45e06               les bx, ptr [bp + 6]
6:95B7  66268b871e01         mov eax, dword ptr es:[bx + 0x11e]
6:95BD  c45ef8               les bx, ptr [bp - 8]
6:95C0  662689871e01         mov dword ptr es:[bx + 0x11e], eax
6:95C6  c45e06               les bx, ptr [bp + 6]
6:95C9  268b872201           mov ax, word ptr es:[bx + 0x122]
6:95CE  c45ef8               les bx, ptr [bp - 8]
6:95D1  2689872201           mov word ptr es:[bx + 0x122], ax
6:95D6  26c7073499           mov word ptr es:[bx], 0x9934
6:95DB  26c74702b293         mov word ptr es:[bx + 2], 0x93b2  ; SEGMENT s6:0000
6:95E1  668b46f8             mov eax, dword ptr [bp - 8]
6:95E5  668946fc             mov dword ptr [bp - 4], eax
6:95E9  eb09                 jmp 0x95f4
6:95EB  db 90
loc_95EC:
6:95EC  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_95F4:
6:95F4  8b46fc               mov ax, word ptr [bp - 4]
6:95F7  8b56fe               mov dx, word ptr [bp - 2]
6:95FA  5e                   pop si
6:95FB  5f                   pop di
6:95FC  c9                   leave
6:95FD  ca0400               retf 4

; ---------------- sub_s6:9600 FAR size=36 callers=1
6:9600  c8040000             enter 4, 0
6:9604  8d46fc               lea ax, [bp - 4]
6:9607  16                   push ss
6:9608  50                   push ax
6:9609  9a3ea41e96           lcall 0x961e, 0xa43e  ; sub_s5:A43E
6:960E  c45e06               les bx, ptr [bp + 6]
6:9611  26ffb71a01           push word ptr es:[bx + 0x11a]
6:9616  8d46fc               lea ax, [bp - 4]
6:9619  16                   push ss
6:961A  50                   push ax
6:961B  9a0ea8fb78           lcall 0x78fb, 0xa80e  ; sub_s5:A80E
6:9620  c9                   leave
6:9621  ca0400               retf 4

; ---------------- sub_s6:9624 FAR size=740 callers=1
6:9624  c84e0100             enter 0x14e, 0
6:9628  57                   push di
6:9629  56                   push si
6:962A  c45e06               les bx, ptr [bp + 6]
6:962D  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:9633  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9638  90                   nop
6:9639  0e                   push cs
6:963A  e8af4b               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:963D  c45e06               les bx, ptr [bp + 6]
6:9640  2689871001           mov word ptr es:[bx + 0x110], ax
6:9645  2689971201           mov word ptr es:[bx + 0x112], dx
6:964A  6a2f                 push 0x2f
6:964C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:9651  9aba20c297           lcall 0x97c2, 0x20ba  ; sub_s3:20BA
6:9656  8946fc               mov word ptr [bp - 4], ax
6:9659  8956fe               mov word ptr [bp - 2], dx
6:965C  8d46dc               lea ax, [bp - 0x24]
6:965F  16                   push ss
6:9660  50                   push ax
6:9661  c45e06               les bx, ptr [bp + 6]
6:9664  6626ffb70801         push dword ptr es:[bx + 0x108]
6:966A  8d871401             lea ax, [bx + 0x114]
6:966E  06                   push es
6:966F  50                   push ax
6:9670  66ff364057           push dword ptr [0x5740]
6:9675  9ace642697           lcall 0x9726, 0x64ce  ; sub_s7:64CE
6:967A  8bd8                 mov bx, ax
6:967C  8ec2                 mov es, dx
6:967E  66268b07             mov eax, dword ptr es:[bx]
6:9682  668946f8             mov dword ptr [bp - 8], eax
6:9686  668946d4             mov dword ptr [bp - 0x2c], eax
6:968A  668946ca             mov dword ptr [bp - 0x36], eax
6:968E  8a46cd               mov al, byte ptr [bp - 0x33]
6:9691  2ae4                 sub ah, ah
6:9693  3d0100               cmp ax, 1
6:9696  1bc0                 sbb ax, ax
6:9698  40                   inc ax
6:9699  8946f6               mov word ptr [bp - 0xa], ax
6:969C  8d46f4               lea ax, [bp - 0xc]
6:969F  16                   push ss
6:96A0  50                   push ax
6:96A1  8d46f2               lea ax, [bp - 0xe]
6:96A4  16                   push ss
6:96A5  50                   push ax
6:96A6  8d46f0               lea ax, [bp - 0x10]
6:96A9  16                   push ss
6:96AA  50                   push ax
6:96AB  668b4606             mov eax, dword ptr [bp + 6]
6:96AF  051401               add ax, 0x114
6:96B2  6650                 push eax
6:96B4  9ab43e3d98           lcall 0x983d, 0x3eb4  ; sub_s2:3EB4
6:96B9  837ef600             cmp word ptr [bp - 0xa], 0
6:96BD  7427                 je 0x96e6
6:96BF  668b46f8             mov eax, dword ptr [bp - 8]
6:96C3  8b56fa               mov dx, word ptr [bp - 6]
6:96C6  668946ec             mov dword ptr [bp - 0x14], eax
6:96CA  c45e06               les bx, ptr [bp + 6]
6:96CD  2683bf1a0175         cmp word ptr es:[bx + 0x11a], 0x75
6:96D3  0f853001             jne 0x9807
6:96D7  6a00                 push 0
6:96D9  52                   push dx
6:96DA  50                   push ax
6:96DB  6a00                 push 0
6:96DD  26ffb71201           push word ptr es:[bx + 0x112]
6:96E2  e91101               jmp 0x97f6
6:96E5  db 90
loc_96E6:
6:96E6  c45e06               les bx, ptr [bp + 6]
6:96E9  6626ffb70801         push dword ptr es:[bx + 0x108]
6:96EF  666800000005         push 0x5000000
6:96F5  8d871401             lea ax, [bx + 0x114]
6:96F9  06                   push es
6:96FA  50                   push ax
6:96FB  6a00                 push 0
6:96FD  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9702  8bf0                 mov si, ax
6:9704  8cc7                 mov di, es
6:9706  90                   nop
6:9707  0e                   push cs
6:9708  e8a14b               call 0xe2ac  ; sub_s6:E2AC
6:970B  8946ec               mov word ptr [bp - 0x14], ax
6:970E  8956ee               mov word ptr [bp - 0x12], dx
6:9711  c45e06               les bx, ptr [bp + 6]
6:9714  6626ffb70801         push dword ptr es:[bx + 0x108]
6:971A  57                   push di
6:971B  56                   push si
6:971C  52                   push dx
6:971D  50                   push ax
6:971E  66ff364057           push dword ptr [0x5740]
6:9723  9afe612998           lcall 0x9829, 0x61fe  ; sub_s7:61FE
6:9728  c45e06               les bx, ptr [bp + 6]
6:972B  2683bf1a010a         cmp word ptr es:[bx + 0x11a], 0xa
6:9731  740a                 je 0x973d
6:9733  2683bf1a0137         cmp word ptr es:[bx + 0x11a], 0x37
6:9739  0f858700             jne 0x97c4
loc_973D:
6:973D  2683bf1a0137         cmp word ptr es:[bx + 0x11a], 0x37
6:9743  7522                 jne 0x9767
6:9745  66268b871e01         mov eax, dword ptr es:[bx + 0x11e]
6:974B  268b972001           mov dx, word ptr es:[bx + 0x120]
6:9750  668946ca             mov dword ptr [bp - 0x36], eax
6:9754  66268b8f0c01         mov ecx, dword ptr es:[bx + 0x10c]
6:975A  66894ed8             mov dword ptr [bp - 0x28], ecx
6:975E  8bd8                 mov bx, ax
6:9760  8ec2                 mov es, dx
6:9762  6626894f20           mov dword ptr es:[bx + 0x20], ecx
loc_9767:
6:9767  c45e06               les bx, ptr [bp + 6]
6:976A  6626ffb70801         push dword ptr es:[bx + 0x108]
6:9770  666800000004         push 0x4000000
6:9776  8d871401             lea ax, [bx + 0x114]
6:977A  06                   push es
6:977B  50                   push ax
6:977C  6a00                 push 0
6:977E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9783  90                   nop
6:9784  0e                   push cs
6:9785  e8244b               call 0xe2ac  ; sub_s6:E2AC
6:9788  c45e06               les bx, ptr [bp + 6]
6:978B  2689870c01           mov word ptr es:[bx + 0x10c], ax
6:9790  2689970e01           mov word ptr es:[bx + 0x10e], dx
6:9795  6626ffb70801         push dword ptr es:[bx + 0x108]
6:979B  52                   push dx
6:979C  26ffb70c01           push word ptr es:[bx + 0x10c]
6:97A1  66ff76fc             push dword ptr [bp - 4]
6:97A5  9a96015a8a           lcall 0x8a5a, 0x196  ; sub_s4:0196
6:97AA  c45e06               les bx, ptr [bp + 6]
6:97AD  2683bf1a010a         cmp word ptr es:[bx + 0x11a], 0xa
6:97B3  750f                 jne 0x97c4
6:97B5  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:97BB  66ff76fc             push dword ptr [bp - 4]
6:97BF  9a22ed2291           lcall 0x9122, 0xed22  ; sub_s3:ED22
loc_97C4:
6:97C4  c45e06               les bx, ptr [bp + 6]
6:97C7  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:97CD  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:97D2  90                   nop
6:97D3  0e                   push cs
6:97D4  e8154a               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:97D7  c45e06               les bx, ptr [bp + 6]
6:97DA  2689871001           mov word ptr es:[bx + 0x110], ax
6:97DF  2689971201           mov word ptr es:[bx + 0x112], dx
6:97E4  8bc2                 mov ax, dx
6:97E6  260b871001           or ax, word ptr es:[bx + 0x110]
6:97EB  741a                 je 0x9807
6:97ED  6a00                 push 0
6:97EF  66ff76ec             push dword ptr [bp - 0x14]
6:97F3  6a00                 push 0
6:97F5  52                   push dx
loc_97F6:
6:97F6  26ffb71001           push word ptr es:[bx + 0x110]
6:97FB  26c49f1001           les bx, ptr es:[bx + 0x110]
6:9800  26c41f               les bx, ptr es:[bx]
6:9803  26ff5f08             lcall es:[bx + 8]
loc_9807:
6:9807  66ff76ec             push dword ptr [bp - 0x14]
6:980B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9810  90                   nop
6:9811  0e                   push cs
6:9812  e8d749               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:9815  8946e8               mov word ptr [bp - 0x18], ax
6:9818  8956ea               mov word ptr [bp - 0x16], dx
6:981B  c45e06               les bx, ptr [bp + 6]
6:981E  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:9824  52                   push dx
6:9825  50                   push ax
6:9826  9aee73b598           lcall 0x98b5, 0x73ee  ; sub_s7:73EE
6:982B  6a31                 push 0x31
6:982D  c45e06               les bx, ptr [bp + 6]
6:9830  26ffb71a01           push word ptr es:[bx + 0x11a]
6:9835  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:983A  9aaec6d198           lcall 0x98d1, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:983F  0bc0                 or ax, ax
6:9841  7540                 jne 0x9883
6:9843  c45e06               les bx, ptr [bp + 6]
6:9846  2639872201           cmp word ptr es:[bx + 0x122], ax
6:984B  7536                 jne 0x9883
6:984D  8b46e8               mov ax, word ptr [bp - 0x18]
6:9850  8b56ea               mov dx, word ptr [bp - 0x16]
6:9853  050c00               add ax, 0xc
6:9856  1e                   push ds
6:9857  8d7ec4               lea di, [bp - 0x3c]
6:985A  8bf0                 mov si, ax
6:985C  16                   push ss
6:985D  07                   pop es
6:985E  8eda                 mov ds, dx
6:9860  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:9862  a5                   movsw word ptr es:[di], word ptr [si]
6:9863  1f                   pop ds
6:9864  8d46c4               lea ax, [bp - 0x3c]
6:9867  8946ca               mov word ptr [bp - 0x36], ax
6:986A  837ec800             cmp word ptr [bp - 0x38], 0
6:986E  7e06                 jle 0x9876
6:9870  b80600               mov ax, 6
6:9873  eb04                 jmp 0x9879
6:9875  db 90
loc_9876:
6:9876  b80500               mov ax, 5
loc_9879:
6:9879  8946c2               mov word ptr [bp - 0x3e], ax
6:987C  c45ee8               les bx, ptr [bp - 0x18]
6:987F  26894714             mov word ptr es:[bx + 0x14], ax
loc_9883:
6:9883  c45ee8               les bx, ptr [bp - 0x18]
6:9886  66268b4716           mov eax, dword ptr es:[bx + 0x16]
6:988B  668946e4             mov dword ptr [bp - 0x1c], eax
6:988F  6650                 push eax
6:9891  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9896  90                   nop
6:9897  0e                   push cs
6:9898  e85149               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:989B  8946e0               mov word ptr [bp - 0x20], ax
6:989E  8956e2               mov word ptr [bp - 0x1e], dx
6:98A1  66837ee400           cmp dword ptr [bp - 0x1c], 0
6:98A6  742b                 je 0x98d3
6:98A8  66ff76e4             push dword ptr [bp - 0x1c]
6:98AC  8d86b6fe             lea ax, [bp - 0x14a]
6:98B0  16                   push ss
6:98B1  50                   push ax
6:98B2  9afae4c598           lcall 0x98c5, 0xe4fa  ; SCKillBldg@s7:E4FA
6:98B7  8d86b6fe             lea ax, [bp - 0x14a]
6:98BB  16                   push ss
6:98BC  50                   push ax
6:98BD  66ff364857           push dword ptr [0x5748]  ; g_sim
6:98C2  9a5a830099           lcall 0x9900, 0x835a  ; Sim::enqueue@s7:835A
6:98C7  c786b6fe9a38         mov word ptr [bp - 0x14a], 0x389a
6:98CD  c786b8fe0d95         mov word ptr [bp - 0x148], 0x950d  ; SEGMENT s2:0000
loc_98D3:
6:98D3  66ff76ec             push dword ptr [bp - 0x14]
6:98D7  c45e06               les bx, ptr [bp + 6]
6:98DA  6626ffb71e01         push dword ptr es:[bx + 0x11e]
6:98E0  26c49f1e01           les bx, ptr es:[bx + 0x11e]
6:98E5  26c41f               les bx, ptr es:[bx]
6:98E8  26ff5f04             lcall es:[bx + 4]
6:98EC  c45e06               les bx, ptr [bp + 6]
6:98EF  26c49f1e01           les bx, ptr es:[bx + 0x11e]
6:98F4  6626ff7704           push dword ptr es:[bx + 4]
6:98F9  66ff76e8             push dword ptr [bp - 0x18]
6:98FD  9a5a7eaa94           lcall 0x94aa, 0x7e5a  ; Tile::setBuilding@s7:7E5A
6:9902  5e                   pop si
6:9903  5f                   pop di
6:9904  c9                   leave
6:9905  ca0400               retf 4

; ---------------- SCPutBldg::dtor@s6:9908 size=60 callers=0
6:9908  c80c0000             enter 0xc, 0
6:990C  c45e06               les bx, ptr [bp + 6]
6:990F  26c7079a38           mov word ptr es:[bx], 0x389a
6:9914  26c74702b796         mov word ptr es:[bx + 2], 0x96b7  ; SEGMENT s2:0000
6:991A  f6460a01             test byte ptr [bp + 0xa], 1
6:991E  7409                 je 0x9929
6:9920  66ff7606             push dword ptr [bp + 6]
6:9924  9ace17f094           lcall 0x94f0, 0x17ce  ; operator_delete@s1:17CE
loc_9929:
6:9929  8b4606               mov ax, word ptr [bp + 6]
6:992C  8b5608               mov dx, word ptr [bp + 8]
6:992F  c9                   leave
6:9930  ca0600               retf 6
6:9933  db 00 08 99 3a 99 22 d2 3e 99 d4 93 42 99 e4 94 46
6:9943  db 95

; ---------------- sub_s6:9944 FAR size=78 callers=2
6:9944  55                   push bp
6:9945  8bec                 mov bp, sp
6:9947  688713               push 0x1387
6:994A  66ff7606             push dword ptr [bp + 6]
6:994E  90                   nop
6:994F  0e                   push cs
6:9950  e88938               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:9953  668b4612             mov eax, dword ptr [bp + 0x12]
6:9957  c45e06               les bx, ptr [bp + 6]
6:995A  662689870801         mov dword ptr es:[bx + 0x108], eax
6:9960  668b460e             mov eax, dword ptr [bp + 0xe]
6:9964  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:996A  668b460a             mov eax, dword ptr [bp + 0xa]
6:996E  662689871001         mov dword ptr es:[bx + 0x110], eax
6:9974  6626c787140100000000 mov dword ptr es:[bx + 0x114], 0
6:997E  26c707529c           mov word ptr es:[bx], 0x9c52
6:9983  26c747023699         mov word ptr es:[bx + 2], 0x9936  ; SEGMENT s6:0000
6:9989  8bc3                 mov ax, bx
6:998B  8cc2                 mov dx, es
6:998D  c9                   leave
6:998E  ca1000               retf 0x10
6:9991  db 00

; ---------------- sub_s6:9992 FAR size=50 callers=3
6:9992  c80c0000             enter 0xc, 0
6:9996  c45e06               les bx, ptr [bp + 6]
6:9999  26c707529c           mov word ptr es:[bx], 0x9c52
6:999E  26c747028799         mov word ptr es:[bx + 2], 0x9987  ; SEGMENT s6:0000
6:99A4  66268b871401         mov eax, dword ptr es:[bx + 0x114]
6:99AA  6650                 push eax
6:99AC  9ace172799           lcall 0x9927, 0x17ce  ; operator_delete@s1:17CE
6:99B1  c45e06               les bx, ptr [bp + 6]
6:99B4  26c7079a38           mov word ptr es:[bx], 0x389a
6:99B9  26c747021899         mov word ptr es:[bx + 2], 0x9918  ; SEGMENT s2:0000
6:99BF  c9                   leave
6:99C0  ca0400               retf 4
6:99C3  db 00

; ---------------- sub_s6:99C4 FAR size=62 callers=0
6:99C4  c8100000             enter 0x10, 0
6:99C8  c45e06               les bx, ptr [bp + 6]
6:99CB  6626ffb70c01         push dword ptr es:[bx + 0x10c]
6:99D1  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:99D6  90                   nop
6:99D7  0e                   push cs
6:99D8  e81148               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:99DB  8946fc               mov word ptr [bp - 4], ax
6:99DE  8956fe               mov word ptr [bp - 2], dx
6:99E1  c45efc               les bx, ptr [bp - 4]
6:99E4  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:99EA  c45e06               les bx, ptr [bp + 6]
6:99ED  6626ffb71401         push dword ptr es:[bx + 0x114]
6:99F3  6650                 push eax
6:99F5  9a5c357896           lcall 0x9678, 0x355c  ; sub_s7:355C
6:99FA  b80100               mov ax, 1
6:99FD  c9                   leave
6:99FE  ca0400               retf 4
6:9A01  db 00

; ---------------- sub_s6:9A02 FAR size=326 callers=0
6:9A02  c8360000             enter 0x36, 0
6:9A06  c45e06               les bx, ptr [bp + 6]
6:9A09  6626ffb70801         push dword ptr es:[bx + 0x108]
6:9A0F  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9A14  90                   nop
6:9A15  0e                   push cs
6:9A16  e8d347               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:9A19  8946fc               mov word ptr [bp - 4], ax
6:9A1C  8956fe               mov word ptr [bp - 2], dx
6:9A1F  c45efc               les bx, ptr [bp - 4]
6:9A22  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:9A28  668946f8             mov dword ptr [bp - 8], eax
6:9A2C  c45e06               les bx, ptr [bp + 6]
6:9A2F  6626ffb71001         push dword ptr es:[bx + 0x110]
6:9A35  6a00                 push 0
6:9A37  6650                 push eax
6:9A39  9a9436529a           lcall 0x9a52, 0x3694  ; sub_s7:3694
6:9A3E  c45e06               les bx, ptr [bp + 6]
6:9A41  2689871401           mov word ptr es:[bx + 0x114], ax
6:9A46  2689971601           mov word ptr es:[bx + 0x116], dx
6:9A4B  66ff76f8             push dword ptr [bp - 8]
6:9A4F  9ab838f899           lcall 0x99f8, 0x38b8  ; sub_s7:38B8
6:9A54  0bd0                 or dx, ax
6:9A56  0f85e600             jne 0x9b40
6:9A5A  c45efc               les bx, ptr [bp - 4]
6:9A5D  66268b870002         mov eax, dword ptr es:[bx + 0x200]
6:9A63  668946f0             mov dword ptr [bp - 0x10], eax
6:9A67  6a2b                 push 0x2b
6:9A69  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:9A6E  9aba20979a           lcall 0x9a97, 0x20ba  ; sub_s3:20BA
6:9A73  8946ec               mov word ptr [bp - 0x14], ax
6:9A76  8956ee               mov word ptr [bp - 0x12], dx
6:9A79  66817ef002000008     cmp dword ptr [bp - 0x10], 0x8000002
6:9A81  7405                 je 0x9a88
6:9A83  6a0b                 push 0xb
6:9A85  eb03                 jmp 0x9a8a
6:9A87  db 90
loc_9A88:
6:9A88  6a1f                 push 0x1f
loc_9A8A:
6:9A8A  c45efc               les bx, ptr [bp - 4]
6:9A8D  6626ff7704           push dword ptr es:[bx + 4]
6:9A92  52                   push dx
6:9A93  50                   push ax
6:9A94  9a3a04279b           lcall 0x9b27, 0x43a  ; sub_s3:043A
6:9A99  66817ef001000008     cmp dword ptr [bp - 0x10], 0x8000001
6:9AA1  7505                 jne 0x9aa8
6:9AA3  b80200               mov ax, 2
6:9AA6  eb03                 jmp 0x9aab
loc_9AA8:
6:9AA8  b80100               mov ax, 1
loc_9AAB:
6:9AAB  ba0008               mov dx, 0x800
6:9AAE  8946f0               mov word ptr [bp - 0x10], ax
6:9AB1  8956f2               mov word ptr [bp - 0xe], dx
6:9AB4  52                   push dx
6:9AB5  50                   push ax
6:9AB6  66ff76fc             push dword ptr [bp - 4]
6:9ABA  9a9e34d791           lcall 0x91d7, 0x349e  ; sub_s8:349E
6:9ABF  33c0                 xor ax, ax
6:9AC1  8946e4               mov word ptr [bp - 0x1c], ax
6:9AC4  8946e8               mov word ptr [bp - 0x18], ax
6:9AC7  680004               push 0x400
6:9ACA  50                   push ax
6:9ACB  6a01                 push 1
6:9ACD  8d46d2               lea ax, [bp - 0x2e]
6:9AD0  16                   push ss
6:9AD1  50                   push ax
6:9AD2  90                   nop
6:9AD3  0e                   push cs
6:9AD4  e87b41               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_9AD7:
6:9AD7  8d46d2               lea ax, [bp - 0x2e]
6:9ADA  16                   push ss
6:9ADB  50                   push ax
6:9ADC  90                   nop
6:9ADD  0e                   push cs
6:9ADE  e80b4a               call 0xe4ec  ; DbIter::next@s6:E4EC
6:9AE1  8946fc               mov word ptr [bp - 4], ax
6:9AE4  8956fe               mov word ptr [bp - 2], dx
6:9AE7  0bd0                 or dx, ax
6:9AE9  741f                 je 0x9b0a
6:9AEB  c45efc               les bx, ptr [bp - 4]
6:9AEE  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:9AF8  7508                 jne 0x9b02
6:9AFA  c746e80100           mov word ptr [bp - 0x18], 1
6:9AFF  ebd6                 jmp 0x9ad7
6:9B01  db 90
loc_9B02:
6:9B02  c746e40100           mov word ptr [bp - 0x1c], 1
6:9B07  ebce                 jmp 0x9ad7
6:9B09  db 90
loc_9B0A:
6:9B0A  837ee400             cmp word ptr [bp - 0x1c], 0
6:9B0E  7526                 jne 0x9b36
6:9B10  666800003c00         push 0x3c0000
6:9B16  666a01               push 1
6:9B19  666a00               push 0
6:9B1C  666a37               push 0x37
6:9B1F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:9B24  9aba205496           lcall 0x9654, 0x20ba  ; sub_s3:20BA
6:9B29  8946ca               mov word ptr [bp - 0x36], ax
6:9B2C  8956cc               mov word ptr [bp - 0x34], dx
6:9B2F  52                   push dx
6:9B30  50                   push ax
6:9B31  9ae4a03e9b           lcall 0x9b3e, 0xa0e4  ; sub_s2:A0E4
loc_9B36:
6:9B36  c746d29a38           mov word ptr [bp - 0x2e], 0x389a
6:9B3B  c746d4bd99           mov word ptr [bp - 0x2c], 0x99bd  ; SEGMENT s2:0000
loc_9B40:
6:9B40  b80100               mov ax, 1
6:9B43  c9                   leave
6:9B44  ca0400               retf 4
6:9B47  db 00

; ---------------- sub_s6:9B48 FAR size=228 callers=0
6:9B48  c8200000             enter 0x20, 0
6:9B4C  57                   push di
6:9B4D  56                   push si
6:9B4E  681801               push 0x118
6:9B51  9a9c17af99           lcall 0x99af, 0x179c  ; operator_new@s1:179C
6:9B56  83c402               add sp, 2
6:9B59  8946f8               mov word ptr [bp - 8], ax
6:9B5C  8956fa               mov word ptr [bp - 6], dx
6:9B5F  0bd0                 or dx, ax
6:9B61  0f84a500             je 0x9c0a
6:9B65  c45ef8               les bx, ptr [bp - 8]
6:9B68  26c7079a38           mov word ptr es:[bx], 0x389a
6:9B6D  26c74702349b         mov word ptr es:[bx + 2], 0x9b34  ; SEGMENT s2:0000
6:9B73  c45e06               les bx, ptr [bp + 6]
6:9B76  66268b4704           mov eax, dword ptr es:[bx + 4]
6:9B7B  c45ef8               les bx, ptr [bp - 8]
6:9B7E  6626894704           mov dword ptr es:[bx + 4], eax
6:9B83  8b4606               mov ax, word ptr [bp + 6]
6:9B86  8b5608               mov dx, word ptr [bp + 8]
6:9B89  050800               add ax, 8
6:9B8C  1e                   push ds
6:9B8D  8d7f08               lea di, [bx + 8]
6:9B90  8bf0                 mov si, ax
6:9B92  8eda                 mov ds, dx
6:9B94  66b940000000         mov ecx, 0x40
6:9B9A  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:9B9D  1f                   pop ds
6:9B9E  c45ef8               les bx, ptr [bp - 8]
6:9BA1  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:9BA6  26c74702fd9b         mov word ptr es:[bx + 2], 0x9bfd  ; SEGMENT s6:0000
6:9BAC  c45e06               les bx, ptr [bp + 6]
6:9BAF  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:9BB5  c45ef8               les bx, ptr [bp - 8]
6:9BB8  662689870801         mov dword ptr es:[bx + 0x108], eax
6:9BBE  c45e06               les bx, ptr [bp + 6]
6:9BC1  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:9BC7  c45ef8               les bx, ptr [bp - 8]
6:9BCA  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:9BD0  c45e06               les bx, ptr [bp + 6]
6:9BD3  66268b871001         mov eax, dword ptr es:[bx + 0x110]
6:9BD9  c45ef8               les bx, ptr [bp - 8]
6:9BDC  662689871001         mov dword ptr es:[bx + 0x110], eax
6:9BE2  c45e06               les bx, ptr [bp + 6]
6:9BE5  66268b871401         mov eax, dword ptr es:[bx + 0x114]
6:9BEB  c45ef8               les bx, ptr [bp - 8]
6:9BEE  662689871401         mov dword ptr es:[bx + 0x114], eax
6:9BF4  26c707529c           mov word ptr es:[bx], 0x9c52
6:9BF9  26c74702a299         mov word ptr es:[bx + 2], 0x99a2  ; SEGMENT s6:0000
6:9BFF  668b46f8             mov eax, dword ptr [bp - 8]
6:9C03  668946fc             mov dword ptr [bp - 4], eax
6:9C07  eb09                 jmp 0x9c12
6:9C09  db 90
loc_9C0A:
6:9C0A  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_9C12:
6:9C12  c45e06               les bx, ptr [bp + 6]
6:9C15  6626c787140100000000 mov dword ptr es:[bx + 0x114], 0
6:9C1F  8b46fc               mov ax, word ptr [bp - 4]
6:9C22  8b56fe               mov dx, word ptr [bp - 2]
6:9C25  5e                   pop si
6:9C26  5f                   pop di
6:9C27  c9                   leave
6:9C28  ca0400               retf 4
6:9C2B  db 00

; ---------------- sub_s6:9C2C FAR size=54 callers=0
6:9C2C  55                   push bp
6:9C2D  8bec                 mov bp, sp
6:9C2F  66ff7606             push dword ptr [bp + 6]
6:9C33  90                   nop
6:9C34  0e                   push cs
6:9C35  e85afd               call 0x9992  ; sub_s6:9992
6:9C38  f6460a01             test byte ptr [bp + 0xa], 1
6:9C3C  7409                 je 0x9c47
6:9C3E  66ff7606             push dword ptr [bp + 6]
6:9C42  9ace17549b           lcall 0x9b54, 0x17ce  ; operator_delete@s1:17CE
loc_9C47:
6:9C47  8b4606               mov ax, word ptr [bp + 6]
6:9C4A  8b5608               mov dx, word ptr [bp + 8]
6:9C4D  c9                   leave
6:9C4E  ca0600               retf 6
6:9C51  db 00 2c 9c 58 9c c4 99 5c 9c 02 9a 60 9c 48 9b aa
6:9C61  db 9b

; ---------------- SCStep::SCStep(type)@s6:9C62 FAR size=46 callers=1
6:9C62  55                   push bp
6:9C63  8bec                 mov bp, sp
6:9C65  66ff7608             push dword ptr [bp + 8]
6:9C69  ff7606               push word ptr [bp + 6]
6:9C6C  90                   nop
6:9C6D  0e                   push cs
6:9C6E  e86b35               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:9C71  8b460a               mov ax, word ptr [bp + 0xa]
6:9C74  c45e06               les bx, ptr [bp + 6]
6:9C77  2689870801           mov word ptr es:[bx + 0x108], ax
6:9C7C  26c707b69e           mov word ptr es:[bx], 0x9eb6
6:9C81  26c74702549c         mov word ptr es:[bx + 2], 0x9c54  ; SEGMENT s6:0000
6:9C87  8bc3                 mov ax, bx
6:9C89  8cc2                 mov dx, es
6:9C8B  c9                   leave
6:9C8C  ca0600               retf 6
6:9C8F  db 00

; ---------------- SCStep::makeByType@s6:9C90 FAR size=350 callers=0
6:9C90  c8200200             enter 0x220, 0
6:9C94  c45e06               les bx, ptr [bp + 6]
6:9C97  268b870801           mov ax, word ptr es:[bx + 0x108]
6:9C9C  e90b01               jmp 0x9daa
6:9C9F  db 90
loc_9CA0:
6:9CA0  8d86f8fe             lea ax, [bp - 0x108]
6:9CA4  16                   push ss
6:9CA5  50                   push ax
6:9CA6  90                   nop
6:9CA7  0e                   push cs
6:9CA8  e80b10               call 0xacb6  ; SCSetup@s6:ACB6
loc_9CAB:
6:9CAB  8d86f8fe             lea ax, [bp - 0x108]
6:9CAF  16                   push ss
6:9CB0  50                   push ax
6:9CB1  66ff364857           push dword ptr [0x5748]  ; g_sim
6:9CB6  9a5a830b9d           lcall 0x9d0b, 0x835a  ; Sim::enqueue@s7:835A
6:9CBB  c786f8fe9a38         mov word ptr [bp - 0x108], 0x389a
6:9CC1  c786fafe359d         mov word ptr [bp - 0x106], 0x9d35  ; SEGMENT s2:0000
6:9CC7  e91c01               jmp 0x9de6
loc_9CCA:
6:9CCA  8d86f8fe             lea ax, [bp - 0x108]
6:9CCE  16                   push ss
6:9CCF  50                   push ax
6:9CD0  9ad828199d           lcall 0x9d19, 0x28d8  ; SCRoboMove@s8:28D8
6:9CD5  ebd4                 jmp 0x9cab
6:9CD7  db 90
loc_9CD8:
6:9CD8  8d86f8fe             lea ax, [bp - 0x108]
6:9CDC  16                   push ss
6:9CDD  50                   push ax
6:9CDE  90                   nop
6:9CDF  0e                   push cs
6:9CE0  e8830b               call 0xa866  ; SCProdSched@s6:A866
6:9CE3  ebc6                 jmp 0x9cab
6:9CE5  db 90
loc_9CE6:
6:9CE6  8d86f8fe             lea ax, [bp - 0x108]
6:9CEA  16                   push ss
6:9CEB  50                   push ax
6:9CEC  90                   nop
6:9CED  0e                   push cs
6:9CEE  e86fd1               call 0x6e60  ; SCConstruct@s6:6E60
6:9CF1  ebb8                 jmp 0x9cab
6:9CF3  db 90
loc_9CF4:
6:9CF4  8d86f8fe             lea ax, [bp - 0x108]
6:9CF8  16                   push ss
6:9CF9  50                   push ax
6:9CFA  90                   nop
6:9CFB  0e                   push cs
6:9CFC  e8330e               call 0xab32  ; SCRchSched@s6:AB32
6:9CFF  ebaa                 jmp 0x9cab
6:9D01  db 90
loc_9D02:
6:9D02  8d86f8fe             lea ax, [bp - 0x108]
6:9D06  16                   push ss
6:9D07  50                   push ax
6:9D08  9a9ee0299d           lcall 0x9d29, 0xe09e  ; SCAiInput@s7:E09E
6:9D0D  eb9c                 jmp 0x9cab
6:9D0F  db 90
loc_9D10:
6:9D10  8d86e0fd             lea ax, [bp - 0x220]
6:9D14  16                   push ss
6:9D15  50                   push ax
6:9D16  9aa60bbd9a           lcall 0x9abd, 0xba6  ; SCMove@s8:0BA6
loc_9D1B:
6:9D1B  8d86e0fd             lea ax, [bp - 0x220]
6:9D1F  16                   push ss
6:9D20  50                   push ax
6:9D21  66ff364857           push dword ptr [0x5748]  ; g_sim
6:9D26  9a5a83519d           lcall 0x9d51, 0x835a  ; Sim::enqueue@s7:835A
6:9D2B  c786e0fd9a38         mov word ptr [bp - 0x220], 0x389a
6:9D31  c786e2fd719b         mov word ptr [bp - 0x21e], 0x9b71  ; SEGMENT s2:0000
6:9D37  e9ac00               jmp 0x9de6
loc_9D3A:
6:9D3A  8d86e0fd             lea ax, [bp - 0x220]
6:9D3E  16                   push ss
6:9D3F  50                   push ax
6:9D40  90                   nop
6:9D41  0e                   push cs
6:9D42  e88101               call 0x9ec6  ; SCPop@s6:9EC6
6:9D45  ebd4                 jmp 0x9d1b
6:9D47  db 90
loc_9D48:
6:9D48  8d86e0fd             lea ax, [bp - 0x220]
6:9D4C  16                   push ss
6:9D4D  50                   push ax
6:9D4E  9a50eb899d           lcall 0x9d89, 0xeb50  ; SCMines@s7:EB50
6:9D53  ebc6                 jmp 0x9d1b
6:9D55  db 90
loc_9D56:
6:9D56  8d86e0fd             lea ax, [bp - 0x220]
6:9D5A  16                   push ss
6:9D5B  50                   push ax
6:9D5C  90                   nop
6:9D5D  0e                   push cs
6:9D5E  e849e4               call 0x81aa  ; SCFactory@s6:81AA
6:9D61  ebb8                 jmp 0x9d1b
6:9D63  db 90
loc_9D64:
6:9D64  8d86e0fd             lea ax, [bp - 0x220]
6:9D68  16                   push ss
6:9D69  50                   push ax
6:9D6A  90                   nop
6:9D6B  0e                   push cs
6:9D6C  e84f0c               call 0xa9be  ; SCPower@s6:A9BE
6:9D6F  ebaa                 jmp 0x9d1b
6:9D71  db 90
loc_9D72:
6:9D72  8d86e0fd             lea ax, [bp - 0x220]
6:9D76  16                   push ss
6:9D77  50                   push ax
6:9D78  90                   nop
6:9D79  0e                   push cs
6:9D7A  e831d7               call 0x74ae  ; SCEvent@s6:74AE
6:9D7D  eb9c                 jmp 0x9d1b
6:9D7F  db 90
loc_9D80:
6:9D80  8d86e0fd             lea ax, [bp - 0x220]
6:9D84  16                   push ss
6:9D85  50                   push ax
6:9D86  9ac2ec3c9a           lcall 0x9a3c, 0xecc2  ; SCMorale@s7:ECC2
6:9D8B  eb8e                 jmp 0x9d1b
6:9D8D  db 90
loc_9D8E:
6:9D8E  8d86e0fd             lea ax, [bp - 0x220]
6:9D92  16                   push ss
6:9D93  50                   push ax
6:9D94  90                   nop
6:9D95  0e                   push cs
6:9D96  e86d09               call 0xa706  ; SCPrelimAlloc@s6:A706
6:9D99  e97fff               jmp 0x9d1b
loc_9D9C:
6:9D9C  8d86e0fd             lea ax, [bp - 0x220]
6:9DA0  16                   push ss
6:9DA1  50                   push ax
6:9DA2  90                   nop
6:9DA3  0e                   push cs
6:9DA4  e819d2               call 0x6fc0  ; SCEndSim@s6:6FC0
6:9DA7  e971ff               jmp 0x9d1b
loc_9DAA:
6:9DAA  2de803               sub ax, 0x3e8
6:9DAD  3d983a               cmp ax, 0x3a98
6:9DB0  7734                 ja 0x9de6
6:9DB2  bbe803               mov bx, 0x3e8
6:9DB5  33d2                 xor dx, dx
6:9DB7  f7f3                 div bx
6:9DB9  0bd2                 or dx, dx
6:9DBB  7529                 jne 0x9de6
6:9DBD  03c0                 add ax, ax
6:9DBF  93                   xchg bx, ax
6:9DC0  2effa7c69d           jmp word ptr cs:[bx - 0x623a]
6:9DC5  db 90
switch_table_9DC6:
    dw loc_9D9C
    dw loc_9DE6
    dw loc_9D8E
    dw loc_9D80
    dw loc_9D72
    dw loc_9D64
    dw loc_9D56
    dw loc_9D48
    dw loc_9D3A
    dw loc_9D10
    dw loc_9D02
    dw loc_9CF4
    dw loc_9CE6
    dw loc_9CD8
    dw loc_9CCA
    dw loc_9CA0
    dw loc_01B8
    dw loc_C900
    dw loc_04CA
    dw loc_0000

; ---------------- sub_s6:9DEE FAR size=156 callers=0
6:9DEE  c8200000             enter 0x20, 0
6:9DF2  57                   push di
6:9DF3  56                   push si
6:9DF4  680a01               push 0x10a
6:9DF7  9a9c17459c           lcall 0x9c45, 0x179c  ; operator_new@s1:179C
6:9DFC  83c402               add sp, 2
6:9DFF  8946f8               mov word ptr [bp - 8], ax
6:9E02  8956fa               mov word ptr [bp - 6], dx
6:9E05  0bd0                 or dx, ax
6:9E07  746d                 je 0x9e76
6:9E09  c45ef8               les bx, ptr [bp - 8]
6:9E0C  26c7079a38           mov word ptr es:[bx], 0x389a
6:9E11  26c74702c59c         mov word ptr es:[bx + 2], 0x9cc5  ; SEGMENT s2:0000
6:9E17  c45e06               les bx, ptr [bp + 6]
6:9E1A  66268b4704           mov eax, dword ptr es:[bx + 4]
6:9E1F  c45ef8               les bx, ptr [bp - 8]
6:9E22  6626894704           mov dword ptr es:[bx + 4], eax
6:9E27  8b4606               mov ax, word ptr [bp + 6]
6:9E2A  8b5608               mov dx, word ptr [bp + 8]
6:9E2D  050800               add ax, 8
6:9E30  1e                   push ds
6:9E31  8d7f08               lea di, [bx + 8]
6:9E34  8bf0                 mov si, ax
6:9E36  8eda                 mov ds, dx
6:9E38  66b940000000         mov ecx, 0x40
6:9E3E  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:9E41  1f                   pop ds
6:9E42  c45ef8               les bx, ptr [bp - 8]
6:9E45  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:9E4A  26c74702699e         mov word ptr es:[bx + 2], 0x9e69  ; SEGMENT s6:0000
6:9E50  c45e06               les bx, ptr [bp + 6]
6:9E53  268b870801           mov ax, word ptr es:[bx + 0x108]
6:9E58  c45ef8               les bx, ptr [bp - 8]
6:9E5B  2689870801           mov word ptr es:[bx + 0x108], ax
6:9E60  26c707b69e           mov word ptr es:[bx], 0x9eb6
6:9E65  26c74702859c         mov word ptr es:[bx + 2], 0x9c85  ; SEGMENT s6:0000
6:9E6B  668b46f8             mov eax, dword ptr [bp - 8]
6:9E6F  668946fc             mov dword ptr [bp - 4], eax
6:9E73  eb09                 jmp 0x9e7e
6:9E75  db 90
loc_9E76:
6:9E76  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_9E7E:
6:9E7E  8b46fc               mov ax, word ptr [bp - 4]
6:9E81  8b56fe               mov dx, word ptr [bp - 2]
6:9E84  5e                   pop si
6:9E85  5f                   pop di
6:9E86  c9                   leave
6:9E87  ca0400               retf 4

; ---------------- sub_s6:9E8A size=60 callers=0
6:9E8A  c80c0000             enter 0xc, 0
6:9E8E  c45e06               les bx, ptr [bp + 6]
6:9E91  26c7079a38           mov word ptr es:[bx], 0x389a
6:9E96  26c74702159e         mov word ptr es:[bx + 2], 0x9e15  ; SEGMENT s2:0000
6:9E9C  f6460a01             test byte ptr [bp + 0xa], 1
6:9EA0  7409                 je 0x9eab
6:9EA2  66ff7606             push dword ptr [bp + 6]
6:9EA6  9ace17fa9d           lcall 0x9dfa, 0x17ce  ; operator_delete@s1:17CE
loc_9EAB:
6:9EAB  8b4606               mov ax, word ptr [bp + 6]
6:9EAE  8b5608               mov dx, word ptr [bp + 8]
6:9EB1  c9                   leave
6:9EB2  ca0600               retf 6
6:9EB5  db 00 8a 9e bc 9e 90 9c c0 9e 28 d2 c4 9e ee 9d 4e
6:9EC5  db 9e

; ---------------- SCPop@s6:9EC6 FAR size=54 callers=1
6:9EC6  55                   push bp
6:9EC7  8bec                 mov bp, sp
6:9EC9  682723               push 0x2327
6:9ECC  66ff7606             push dword ptr [bp + 6]
6:9ED0  90                   nop
6:9ED1  0e                   push cs
6:9ED2  e80733               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:9ED5  c45e06               les bx, ptr [bp + 6]
6:9ED8  26c707f6a6           mov word ptr es:[bx], 0xa6f6
6:9EDD  26c74702b89e         mov word ptr es:[bx + 2], 0x9eb8  ; SEGMENT s6:0000
6:9EE3  1e                   push ds
6:9EE4  68f050               push 0x50f0  ; 'SCPop'
6:9EE7  8d4708               lea ax, [bx + 8]
6:9EEA  06                   push es
6:9EEB  50                   push ax
6:9EEC  9a3e3da99e           lcall 0x9ea9, 0x3d3e  ; _fstrcpy@s1:3D3E
6:9EF1  8b4606               mov ax, word ptr [bp + 6]
6:9EF4  8b5608               mov dx, word ptr [bp + 8]
6:9EF7  c9                   leave
6:9EF8  ca0400               retf 4
6:9EFB  db 00

; ---------------- SCPop::calcMe@s6:9EFC FAR size=510 callers=0
6:9EFC  c8380000             enter 0x38, 0
6:9F00  666801000004         push 0x4000001
6:9F06  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:9F0B  90                   nop
6:9F0C  0e                   push cs
6:9F0D  e8dc42               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:9F10  8946fc               mov word ptr [bp - 4], ax
6:9F13  8956fe               mov word ptr [bp - 2], dx
6:9F16  0bd0                 or dx, ax
6:9F18  7508                 jne 0x9f22
loc_9F1A:
6:9F1A  b80100               mov ax, 1
6:9F1D  c9                   leave
6:9F1E  ca0400               retf 4
6:9F21  db 90
loc_9F22:
6:9F22  666800000004         push 0x4000000
6:9F28  6a01                 push 1
6:9F2A  8d46ea               lea ax, [bp - 0x16]
6:9F2D  16                   push ss
6:9F2E  50                   push ax
6:9F2F  90                   nop
6:9F30  0e                   push cs
6:9F31  e81e3d               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_9F34:
6:9F34  8d46ea               lea ax, [bp - 0x16]
6:9F37  16                   push ss
6:9F38  50                   push ax
6:9F39  90                   nop
6:9F3A  0e                   push cs
6:9F3B  e8ae45               call 0xe4ec  ; DbIter::next@s6:E4EC
6:9F3E  8946fc               mov word ptr [bp - 4], ax
6:9F41  8956fe               mov word ptr [bp - 2], dx
6:9F44  0bd0                 or dx, ax
6:9F46  0f84ac00             je 0x9ff6
6:9F4A  c45efc               les bx, ptr [bp - 4]
6:9F4D  66268b870002         mov eax, dword ptr es:[bx + 0x200]
6:9F53  268b970202           mov dx, word ptr es:[bx + 0x202]
6:9F58  668946e6             mov dword ptr [bp - 0x1a], eax
6:9F5C  2683bffe0100         cmp word ptr es:[bx + 0x1fe], 0
6:9F62  74d0                 je 0x9f34
6:9F64  3d0200               cmp ax, 2
6:9F67  7506                 jne 0x9f6f
6:9F69  81fa0008             cmp dx, 0x800
6:9F6D  740b                 je 0x9f7a
loc_9F6F:
6:9F6F  06                   push es
6:9F70  53                   push bx
6:9F71  66ff7606             push dword ptr [bp + 6]
6:9F75  90                   nop
6:9F76  0e                   push cs
6:9F77  e83404               call 0xa3ae  ; sub_s6:A3AE
loc_9F7A:
6:9F7A  66ff76fc             push dword ptr [bp - 4]
6:9F7E  66ff7606             push dword ptr [bp + 6]
6:9F82  90                   nop
6:9F83  0e                   push cs
6:9F84  e80303               call 0xa28a  ; sub_s6:A28A
6:9F87  8946e2               mov word ptr [bp - 0x1e], ax
6:9F8A  8956e4               mov word ptr [bp - 0x1c], dx
6:9F8D  0bd2                 or dx, dx
6:9F8F  7f14                 jg 0x9fa5
6:9F91  7c05                 jl 0x9f98
6:9F93  3d6400               cmp ax, 0x64
6:9F96  730d                 jae 0x9fa5
loc_9F98:
6:9F98  66ff76fc             push dword ptr [bp - 4]
6:9F9C  66ff7606             push dword ptr [bp + 6]
6:9FA0  90                   nop
6:9FA1  0e                   push cs
6:9FA2  e84905               call 0xa4ee  ; sub_s6:A4EE
loc_9FA5:
6:9FA5  66817ee602000008     cmp dword ptr [bp - 0x1a], 0x8000002
6:9FAD  7485                 je 0x9f34
6:9FAF  66ff76fc             push dword ptr [bp - 4]
6:9FB3  9acc42d39c           lcall 0x9cd3, 0x42cc  ; sub_s8:42CC
6:9FB8  8946da               mov word ptr [bp - 0x26], ax
6:9FBB  8956dc               mov word ptr [bp - 0x24], dx
6:9FBE  0bd0                 or dx, ax
6:9FC0  0f8470ff             je 0x9f34
6:9FC4  6a37                 push 0x37
6:9FC6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:9FCB  9aba200aa0           lcall 0xa00a, 0x20ba  ; sub_s3:20BA
6:9FD0  8946d6               mov word ptr [bp - 0x2a], ax
6:9FD3  8956d8               mov word ptr [bp - 0x28], dx
6:9FD6  6a02                 push 2
6:9FD8  c45efc               les bx, ptr [bp - 4]
6:9FDB  6626ff7704           push dword ptr es:[bx + 4]
6:9FE0  26ffb70802           push word ptr es:[bx + 0x208]
6:9FE5  ff76da               push word ptr [bp - 0x26]
6:9FE8  666a00               push 0
6:9FEB  52                   push dx
6:9FEC  50                   push ax
6:9FED  9ae4a0fe9f           lcall 0x9ffe, 0xa0e4  ; sub_s2:A0E4
6:9FF2  e93fff               jmp 0x9f34
6:9FF5  db 90
loc_9FF6:
6:9FF6  c746ea9a38           mov word ptr [bp - 0x16], 0x389a
6:9FFB  c746ec79a0           mov word ptr [bp - 0x14], 0xa079  ; SEGMENT s2:0000
6:A000  6a08                 push 8
6:A002  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A007  9aba2031a0           lcall 0xa031, 0x20ba  ; sub_s3:20BA
6:A00C  8946c8               mov word ptr [bp - 0x38], ax
6:A00F  8956ca               mov word ptr [bp - 0x36], dx
6:A012  666801000004         push 0x4000001
6:A018  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:A01D  90                   nop
6:A01E  0e                   push cs
6:A01F  e8ca41               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:A022  8946fc               mov word ptr [bp - 4], ax
6:A025  8956fe               mov word ptr [bp - 2], dx
6:A028  6a3e                 push 0x3e
6:A02A  66ff76c8             push dword ptr [bp - 0x38]
6:A02E  9a729f43a0           lcall 0xa043, 0x9f72  ; sub_s3:9F72
6:A033  8946cc               mov word ptr [bp - 0x34], ax
6:A036  0bc0                 or ax, ax
6:A038  0f84defe             je 0x9f1a
6:A03C  66ff76c8             push dword ptr [bp - 0x38]
6:A040  9ad09656a0           lcall 0xa056, 0x96d0  ; sub_s3:96D0
6:A045  8946ce               mov word ptr [bp - 0x32], ax
6:A048  0bc0                 or ax, ax
6:A04A  7e56                 jle 0xa0a2
6:A04C  6a37                 push 0x37
6:A04E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A053  9aba2085a0           lcall 0xa085, 0x20ba  ; sub_s3:20BA
6:A058  8946d2               mov word ptr [bp - 0x2e], ax
6:A05B  8956d4               mov word ptr [bp - 0x2c], dx
6:A05E  666800040200         push 0x20400
6:A064  6a01                 push 1
6:A066  c45efc               les bx, ptr [bp - 4]
6:A069  26ffb70802           push word ptr es:[bx + 0x208]
6:A06E  ff76ce               push word ptr [bp - 0x32]
6:A071  666a00               push 0
6:A074  52                   push dx
6:A075  50                   push ax
6:A076  9ae4a0f4a0           lcall 0xa0f4, 0xa0e4  ; sub_s2:A0E4
6:A07B  6a2b                 push 0x2b
6:A07D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A082  9aba209ca0           lcall 0xa09c, 0x20ba  ; sub_s3:20BA
6:A087  8946d6               mov word ptr [bp - 0x2a], ax
6:A08A  8956d8               mov word ptr [bp - 0x28], dx
6:A08D  6a14                 push 0x14
6:A08F  c45efc               les bx, ptr [bp - 4]
6:A092  6626ff7704           push dword ptr es:[bx + 4]
6:A097  52                   push dx
6:A098  50                   push ax
6:A099  9a3a04d4a0           lcall 0xa0d4, 0x43a  ; sub_s3:043A
6:A09E  e979fe               jmp 0x9f1a
6:A0A1  db 90
loc_A0A2:
6:A0A2  0bc0                 or ax, ax
6:A0A4  0f8d72fe             jge 0x9f1a
6:A0A8  c45efc               les bx, ptr [bp - 4]
6:A0AB  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:A0B1  668946d2             mov dword ptr [bp - 0x2e], eax
6:A0B5  6650                 push eax
6:A0B7  9ab838b99c           lcall 0x9cb9, 0x38b8  ; sub_s7:38B8
6:A0BC  0bd2                 or dx, dx
6:A0BE  0f8f58fe             jg 0x9f1a
6:A0C2  7c06                 jl 0xa0ca
6:A0C4  0bc0                 or ax, ax
6:A0C6  0f8550fe             jne 0x9f1a
loc_A0CA:
6:A0CA  6a37                 push 0x37
6:A0CC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A0D1  9aba20719a           lcall 0x9a71, 0x20ba  ; sub_s3:20BA
6:A0D6  8946da               mov word ptr [bp - 0x26], ax
6:A0D9  8956dc               mov word ptr [bp - 0x24], dx
6:A0DC  6a06                 push 6
6:A0DE  c45efc               les bx, ptr [bp - 4]
6:A0E1  6626ff7704           push dword ptr es:[bx + 4]
6:A0E6  666800000100         push 0x10000
6:A0EC  666a00               push 0
6:A0EF  52                   push dx
6:A0F0  50                   push ax
6:A0F1  9ae4a09a9e           lcall 0x9e9a, 0xa0e4  ; sub_s2:A0E4
6:A0F6  e921fe               jmp 0x9f1a
6:A0F9  db 00

; ---------------- SCPop::clone@s6:A0FA FAR size=142 callers=0
6:A0FA  c8200000             enter 0x20, 0
6:A0FE  57                   push di
6:A0FF  56                   push si
6:A100  680801               push 0x108
6:A103  9a9c17ef9e           lcall 0x9eef, 0x179c  ; operator_new@s1:179C
6:A108  83c402               add sp, 2
6:A10B  8946f8               mov word ptr [bp - 8], ax
6:A10E  8956fa               mov word ptr [bp - 6], dx
6:A111  0bd0                 or dx, ax
6:A113  745f                 je 0xa174
6:A115  c45ef8               les bx, ptr [bp - 8]
6:A118  26c7079a38           mov word ptr es:[bx], 0x389a
6:A11D  26c74702f09f         mov word ptr es:[bx + 2], 0x9ff0  ; SEGMENT s2:0000
6:A123  c45e06               les bx, ptr [bp + 6]
6:A126  66268b4704           mov eax, dword ptr es:[bx + 4]
6:A12B  c45ef8               les bx, ptr [bp - 8]
6:A12E  6626894704           mov dword ptr es:[bx + 4], eax
6:A133  8b4606               mov ax, word ptr [bp + 6]
6:A136  8b5608               mov dx, word ptr [bp + 8]
6:A139  050800               add ax, 8
6:A13C  1e                   push ds
6:A13D  8d7f08               lea di, [bx + 8]
6:A140  8bf0                 mov si, ax
6:A142  8eda                 mov ds, dx
6:A144  66b940000000         mov ecx, 0x40
6:A14A  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:A14D  1f                   pop ds
6:A14E  c45ef8               les bx, ptr [bp - 8]
6:A151  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:A156  26c7470268a1         mov word ptr es:[bx + 2], 0xa168  ; SEGMENT s6:0000
6:A15C  c45ef8               les bx, ptr [bp - 8]
6:A15F  26c707f6a6           mov word ptr es:[bx], 0xa6f6
6:A164  26c74702e19e         mov word ptr es:[bx + 2], 0x9ee1  ; SEGMENT s6:0000
6:A16A  668b46f8             mov eax, dword ptr [bp - 8]
6:A16E  668946fc             mov dword ptr [bp - 4], eax
6:A172  eb08                 jmp 0xa17c
loc_A174:
6:A174  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_A17C:
6:A17C  8b46fc               mov ax, word ptr [bp - 4]
6:A17F  8b56fe               mov dx, word ptr [bp - 2]
6:A182  5e                   pop si
6:A183  5f                   pop di
6:A184  c9                   leave
6:A185  ca0400               retf 4

; ---------------- sub_s6:A188 FAR size=258 callers=1
6:A188  c8320000             enter 0x32, 0
6:A18C  57                   push di
6:A18D  56                   push si
6:A18E  c45e0e               les bx, ptr [bp + 0xe]
6:A191  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:A197  268b97f801           mov dx, word ptr es:[bx + 0x1f8]
6:A19C  668946fc             mov dword ptr [bp - 4], eax
6:A1A0  058c01               add ax, 0x18c
6:A1A3  668946f8             mov dword ptr [bp - 8], eax
6:A1A7  ff760c               push word ptr [bp + 0xc]
6:A1AA  52                   push dx
6:A1AB  ff76fc               push word ptr [bp - 4]
6:A1AE  9af2382da2           lcall 0xa22d, 0x38f2  ; sub_s7:38F2
6:A1B3  8946f4               mov word ptr [bp - 0xc], ax
6:A1B6  8956f6               mov word ptr [bp - 0xa], dx
6:A1B9  b86400               mov ax, 0x64
6:A1BC  99                   cdq
6:A1BD  f77e0a               idiv word ptr [bp + 0xa]
6:A1C0  89460a               mov word ptr [bp + 0xa], ax
6:A1C3  99                   cdq
6:A1C4  52                   push dx
6:A1C5  50                   push ax
6:A1C6  8b5e0c               mov bx, word ptr [bp + 0xc]
6:A1C9  c1e302               shl bx, 2
6:A1CC  c476f8               les si, ptr [bp - 8]
6:A1CF  66268b08             mov ecx, dword ptr es:[bx + si]
6:A1D3  66014ef4             add dword ptr [bp - 0xc], ecx
6:A1D7  668b4ef4             mov ecx, dword ptr [bp - 0xc]
6:A1DB  6651                 push ecx
6:A1DD  8946dc               mov word ptr [bp - 0x24], ax
6:A1E0  8956de               mov word ptr [bp - 0x22], dx
6:A1E3  8bfb                 mov di, bx
6:A1E5  6658                 pop eax
6:A1E7  6659                 pop ecx
6:A1E9  6699                 cdq
6:A1EB  66f7f9               idiv ecx
6:A1EE  668946f0             mov dword ptr [bp - 0x10], eax
6:A1F2  66f76edc             imul dword ptr [bp - 0x24]
6:A1F6  668bd0               mov edx, eax
6:A1F9  66c1ea10             shr edx, 0x10
6:A1FD  8b4ef4               mov cx, word ptr [bp - 0xc]
6:A200  8b5ef6               mov bx, word ptr [bp - 0xa]
6:A203  2bc8                 sub cx, ax
6:A205  1bda                 sbb bx, dx
6:A207  895ef6               mov word ptr [bp - 0xa], bx
6:A20A  c45ef8               les bx, ptr [bp - 8]
6:A20D  8b56f6               mov dx, word ptr [bp - 0xa]
6:A210  268909               mov word ptr es:[bx + di], cx
6:A213  26895102             mov word ptr es:[bx + di + 2], dx
6:A217  8b46f2               mov ax, word ptr [bp - 0xe]
6:A21A  0b46f0               or ax, word ptr [bp - 0x10]
6:A21D  7464                 je 0xa283
6:A21F  66ff76f0             push dword ptr [bp - 0x10]
6:A223  ff760c               push word ptr [bp + 0xc]
6:A226  66ff76fc             push dword ptr [bp - 4]
6:A22A  9a5a37baa0           lcall 0xa0ba, 0x375a  ; sub_s7:375A
6:A22F  c45e0e               les bx, ptr [bp + 0xe]
6:A232  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:A23C  7445                 je 0xa283
6:A23E  6a37                 push 0x37
6:A240  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A245  9aba2070a2           lcall 0xa270, 0x20ba  ; sub_s3:20BA
6:A24A  6a02                 push 2
6:A24C  c45e0e               les bx, ptr [bp + 0xe]
6:A24F  6626ff7704           push dword ptr es:[bx + 4]
6:A254  26ffb70802           push word ptr es:[bx + 0x208]
6:A259  ff76f0               push word ptr [bp - 0x10]
6:A25C  666a00               push 0
6:A25F  52                   push dx
6:A260  50                   push ax
6:A261  9ae4a021a1           lcall 0xa121, 0xa0e4  ; sub_s2:A0E4
6:A266  6a2b                 push 0x2b
6:A268  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A26D  9aba2081a2           lcall 0xa281, 0x20ba  ; sub_s3:20BA
6:A272  6a0d                 push 0xd
6:A274  c45e0e               les bx, ptr [bp + 0xe]
6:A277  6626ff7704           push dword ptr es:[bx + 4]
6:A27C  52                   push dx
6:A27D  50                   push ax
6:A27E  9a3a04ce9f           lcall 0x9fce, 0x43a  ; sub_s3:043A
loc_A283:
6:A283  5e                   pop si
6:A284  5f                   pop di
6:A285  c9                   leave
6:A286  ca0c00               retf 0xc
6:A289  db 00

; ---------------- sub_s6:A28A FAR size=292 callers=1
6:A28A  c82e0000             enter 0x2e, 0
6:A28E  6a0e                 push 0xe
6:A290  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:A295  9afac664a2           lcall 0xa264, 0xc6fa  ; sub_s2:C6FA
6:A29A  52                   push dx
6:A29B  50                   push ax
6:A29C  66ff760a             push dword ptr [bp + 0xa]
6:A2A0  9a6e4db69f           lcall 0x9fb6, 0x4d6e  ; sub_s8:4D6E
6:A2A5  8946f8               mov word ptr [bp - 8], ax
6:A2A8  8956fa               mov word ptr [bp - 6], dx
6:A2AB  c45e0a               les bx, ptr [bp + 0xa]
6:A2AE  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:A2B4  668946f4             mov dword ptr [bp - 0xc], eax
6:A2B8  c45ef8               les bx, ptr [bp - 8]
6:A2BB  06                   push es
6:A2BC  53                   push bx
6:A2BD  26c41f               les bx, ptr es:[bx]
6:A2C0  26ff5f10             lcall es:[bx + 0x10]
6:A2C4  8946f0               mov word ptr [bp - 0x10], ax
6:A2C7  8956f2               mov word ptr [bp - 0xe], dx
6:A2CA  66ff76f4             push dword ptr [bp - 0xc]
6:A2CE  9ab838b1a1           lcall 0xa1b1, 0x38b8  ; sub_s7:38B8
6:A2D3  8946ec               mov word ptr [bp - 0x14], ax
6:A2D6  66837ef000           cmp dword ptr [bp - 0x10], 0
6:A2DB  741b                 je 0xa2f8
6:A2DD  66ff76f0             push dword ptr [bp - 0x10]
6:A2E1  52                   push dx
6:A2E2  ff76ec               push word ptr [bp - 0x14]
6:A2E5  6658                 pop eax
6:A2E7  6659                 pop ecx
6:A2E9  6699                 cdq
6:A2EB  66f7f9               idiv ecx
6:A2EE  668bd0               mov edx, eax
6:A2F1  66c1ea10             shr edx, 0x10
6:A2F5  eb05                 jmp 0xa2fc
6:A2F7  db 90
loc_A2F8:
6:A2F8  b86400               mov ax, 0x64
6:A2FB  99                   cdq
loc_A2FC:
6:A2FC  8946e8               mov word ptr [bp - 0x18], ax
6:A2FF  8956ea               mov word ptr [bp - 0x16], dx
6:A302  668b46f8             mov eax, dword ptr [bp - 8]
6:A306  660bc0               or eax, eax
6:A309  740d                 je 0xa318
6:A30B  6a01                 push 1
6:A30D  c45ef8               les bx, ptr [bp - 8]
6:A310  06                   push es
6:A311  50                   push ax
6:A312  26c41f               les bx, ptr es:[bx]
6:A315  26ff1f               lcall es:[bx]
loc_A318:
6:A318  66837ee864           cmp dword ptr [bp - 0x18], 0x64
6:A31D  7c17                 jl 0xa336
6:A31F  c45e0a               les bx, ptr [bp + 0xa]
6:A322  26c7870a02ecff       mov word ptr es:[bx + 0x20a], 0xffec
loc_A329:
6:A329  c45e0a               les bx, ptr [bp + 0xa]
6:A32C  26c7870c020100       mov word ptr es:[bx + 0x20c], 1
6:A333  eb6f                 jmp 0xa3a4
6:A335  db 90
loc_A336:
6:A336  66837ee855           cmp dword ptr [bp - 0x18], 0x55
6:A33B  7c0d                 jl 0xa34a
6:A33D  c45e0a               les bx, ptr [bp + 0xa]
6:A340  26c7870a02f1ff       mov word ptr es:[bx + 0x20a], 0xfff1
6:A347  ebe0                 jmp 0xa329
6:A349  db 90
loc_A34A:
6:A34A  66837ee84b           cmp dword ptr [bp - 0x18], 0x4b
6:A34F  7c0d                 jl 0xa35e
6:A351  c45e0a               les bx, ptr [bp + 0xa]
6:A354  26c7870a02f6ff       mov word ptr es:[bx + 0x20a], 0xfff6
6:A35B  ebcc                 jmp 0xa329
6:A35D  db 90
loc_A35E:
6:A35E  66837ee832           cmp dword ptr [bp - 0x18], 0x32
6:A363  7c0d                 jl 0xa372
6:A365  c45e0a               les bx, ptr [bp + 0xa]
6:A368  26c7870a02fbff       mov word ptr es:[bx + 0x20a], 0xfffb
6:A36F  ebb8                 jmp 0xa329
6:A371  db 90
loc_A372:
6:A372  66837ee819           cmp dword ptr [bp - 0x18], 0x19
6:A377  7d17                 jge 0xa390
6:A379  c45e0a               les bx, ptr [bp + 0xa]
6:A37C  26c7870a020100       mov word ptr es:[bx + 0x20a], 1
6:A383  c45e0a               les bx, ptr [bp + 0xa]
6:A386  26c7870c02ffff       mov word ptr es:[bx + 0x20c], 0xffff
6:A38D  eb15                 jmp 0xa3a4
6:A38F  db 90
loc_A390:
6:A390  c45e0a               les bx, ptr [bp + 0xa]
6:A393  26c7870a020000       mov word ptr es:[bx + 0x20a], 0
6:A39A  c45e0a               les bx, ptr [bp + 0xa]
6:A39D  26c7870c020000       mov word ptr es:[bx + 0x20c], 0
loc_A3A4:
6:A3A4  8b46e8               mov ax, word ptr [bp - 0x18]
6:A3A7  8b56ea               mov dx, word ptr [bp - 0x16]
6:A3AA  c9                   leave
6:A3AB  ca0800               retf 8

; ---------------- sub_s6:A3AE FAR size=320 callers=1
6:A3AE  c8480100             enter 0x148, 0
6:A3B2  57                   push di
6:A3B3  56                   push si
6:A3B4  66ff760a             push dword ptr [bp + 0xa]
6:A3B8  9ab03f01a4           lcall 0xa401, 0x3fb0  ; sub_s8:3FB0
6:A3BD  8946fc               mov word ptr [bp - 4], ax
6:A3C0  8956fe               mov word ptr [bp - 2], dx
6:A3C3  c45e0a               les bx, ptr [bp + 0xa]
6:A3C6  2683bf040200         cmp word ptr es:[bx + 0x204], 0
6:A3CC  7410                 je 0xa3de
6:A3CE  688200               push 0x82
6:A3D1  52                   push dx
6:A3D2  50                   push ax
6:A3D3  9ab225f0a3           lcall 0xa3f0, 0x25b2  ; sub_s7:25B2
6:A3D8  0bc0                 or ax, ax
6:A3DA  0f850a01             jne 0xa4e8
loc_A3DE:
6:A3DE  c45e0a               les bx, ptr [bp + 0xa]
6:A3E1  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:A3E7  668946f8             mov dword ptr [bp - 8], eax
6:A3EB  6650                 push eax
6:A3ED  9ab83823a4           lcall 0xa423, 0x38b8  ; sub_s7:38B8
6:A3F2  8946f4               mov word ptr [bp - 0xc], ax
6:A3F5  8956f6               mov word ptr [bp - 0xa], dx
6:A3F8  6a1e                 push 0x1e
6:A3FA  66ff760a             push dword ptr [bp + 0xa]
6:A3FE  9a0a54e6a4           lcall 0xa4e6, 0x540a  ; sub_s8:540A
6:A403  8946f0               mov word ptr [bp - 0x10], ax
6:A406  8956f2               mov word ptr [bp - 0xe], dx
6:A409  0bd0                 or dx, ax
6:A40B  7545                 jne 0xa452
6:A40D  c45e0a               les bx, ptr [bp + 0xa]
6:A410  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:A41A  7436                 je 0xa452
6:A41C  66ff76f8             push dword ptr [bp - 8]
6:A420  9ab838aea4           lcall 0xa4ae, 0x38b8  ; sub_s7:38B8
6:A425  0bd2                 or dx, dx
6:A427  7c29                 jl 0xa452
6:A429  7f04                 jg 0xa42f
6:A42B  0bc0                 or ax, ax
6:A42D  7423                 je 0xa452
loc_A42F:
6:A42F  6a2b                 push 0x2b
6:A431  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A436  9aba2050a4           lcall 0xa450, 0x20ba  ; sub_s3:20BA
6:A43B  8946e2               mov word ptr [bp - 0x1e], ax
6:A43E  8956e4               mov word ptr [bp - 0x1c], dx
6:A441  6a11                 push 0x11
6:A443  c45e0a               les bx, ptr [bp + 0xa]
6:A446  6626ff7704           push dword ptr es:[bx + 4]
6:A44B  52                   push dx
6:A44C  50                   push ax
6:A44D  9a3a0448a2           lcall 0xa248, 0x43a  ; sub_s3:043A
loc_A452:
6:A452  668b46f4             mov eax, dword ptr [bp - 0xc]
6:A456  8b56f6               mov dx, word ptr [bp - 0xa]
6:A459  668946e8             mov dword ptr [bp - 0x18], eax
6:A45D  8b4ef0               mov cx, word ptr [bp - 0x10]
6:A460  8b5ef2               mov bx, word ptr [bp - 0xe]
6:A463  8bf1                 mov si, cx
6:A465  8bfb                 mov di, bx
6:A467  03c9                 add cx, cx
6:A469  13db                 adc bx, bx
6:A46B  03c9                 add cx, cx
6:A46D  13db                 adc bx, bx
6:A46F  03ce                 add cx, si
6:A471  13df                 adc bx, di
6:A473  03c9                 add cx, cx
6:A475  13db                 adc bx, bx
6:A477  894eec               mov word ptr [bp - 0x14], cx
6:A47A  895eee               mov word ptr [bp - 0x12], bx
6:A47D  3bda                 cmp bx, dx
6:A47F  7743                 ja 0xa4c4
6:A481  7204                 jb 0xa487
6:A483  3bc8                 cmp cx, ax
6:A485  733d                 jae 0xa4c4
loc_A487:
6:A487  c45e0a               les bx, ptr [bp + 0xa]
6:A48A  6626ff7704           push dword ptr es:[bx + 4]
6:A48F  ff76ee               push word ptr [bp - 0x12]
6:A492  51                   push cx
6:A493  52                   push dx
6:A494  50                   push ax
6:A495  8d86bcfe             lea ax, [bp - 0x144]
6:A499  16                   push ss
6:A49A  50                   push ax
6:A49B  90                   nop
6:A49C  0e                   push cs
6:A49D  e8c609               call 0xae66  ; SCStarve@s6:AE66
6:A4A0  8d86bcfe             lea ax, [bp - 0x144]
6:A4A4  16                   push ss
6:A4A5  50                   push ax
6:A4A6  66ff364857           push dword ptr [0x5748]  ; g_sim
6:A4AB  9a5a83d1a2           lcall 0xa2d1, 0x835a  ; Sim::enqueue@s7:835A
6:A4B0  668b46ec             mov eax, dword ptr [bp - 0x14]
6:A4B4  668946e8             mov dword ptr [bp - 0x18], eax
6:A4B8  c786bcfe9a38         mov word ptr [bp - 0x144], 0x389a
6:A4BE  c786befe98a2         mov word ptr [bp - 0x142], 0xa298  ; SEGMENT s2:0000
loc_A4C4:
6:A4C4  666800001e00         push 0x1e0000
6:A4CA  6a0a                 push 0xa
6:A4CC  668346e809           add dword ptr [bp - 0x18], 9
6:A4D1  668b46e8             mov eax, dword ptr [bp - 0x18]
6:A4D5  6659                 pop ecx
6:A4D7  6633d2               xor edx, edx
6:A4DA  66f7f1               div ecx
6:A4DD  6650                 push eax
6:A4DF  66ff760a             push dword ptr [bp + 0xa]
6:A4E3  9ab852a3a2           lcall 0xa2a3, 0x52b8  ; sub_s8:52B8
loc_A4E8:
6:A4E8  5e                   pop si
6:A4E9  5f                   pop di
6:A4EA  c9                   leave
6:A4EB  ca0800               retf 8

; ---------------- sub_s6:A4EE FAR size=304 callers=1
6:A4EE  c83c0000             enter 0x3c, 0
6:A4F2  56                   push si
6:A4F3  c45e0a               les bx, ptr [bp + 0xa]
6:A4F6  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:A4FC  668946fc             mov dword ptr [bp - 4], eax
6:A500  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:A504  66268b07             mov eax, dword ptr es:[bx]
6:A508  668946f8             mov dword ptr [bp - 8], eax
6:A50C  6a26                 push 0x26
6:A50E  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:A513  9afac6e7a5           lcall 0xa5e7, 0xc6fa  ; sub_s2:C6FA
6:A518  52                   push dx
6:A519  50                   push ax
6:A51A  66ff760a             push dword ptr [bp + 0xa]
6:A51E  9a6e4d98a5           lcall 0xa598, 0x4d6e  ; sub_s8:4D6E
6:A523  8946f0               mov word ptr [bp - 0x10], ax
6:A526  8956f2               mov word ptr [bp - 0xe], dx
6:A529  52                   push dx
6:A52A  c45ef0               les bx, ptr [bp - 0x10]
6:A52D  50                   push ax
6:A52E  26c41f               les bx, ptr es:[bx]
6:A531  26ff5f10             lcall es:[bx + 0x10]
6:A535  8956ee               mov word ptr [bp - 0x12], dx
6:A538  0bd0                 or dx, ax
6:A53A  740d                 je 0xa549
6:A53C  ff76ee               push word ptr [bp - 0x12]
6:A53F  50                   push ax
6:A540  66ff76fc             push dword ptr [bp - 4]
6:A544  9a48357ea5           lcall 0xa57e, 0x3548  ; sub_s7:3548
loc_A549:
6:A549  668b46f0             mov eax, dword ptr [bp - 0x10]
6:A54D  660bc0               or eax, eax
6:A550  740d                 je 0xa55f
6:A552  6a01                 push 1
6:A554  c45ef0               les bx, ptr [bp - 0x10]
6:A557  06                   push es
6:A558  50                   push ax
6:A559  26c41f               les bx, ptr es:[bx]
6:A55C  26ff1f               lcall es:[bx]
loc_A55F:
6:A55F  668b46f8             mov eax, dword ptr [bp - 8]
6:A563  66b90c000000         mov ecx, 0xc
6:A569  6633d2               xor edx, edx
6:A56C  66f7f1               div ecx
6:A56F  668bc2               mov eax, edx
6:A572  660bc0               or eax, eax
6:A575  751a                 jne 0xa591
6:A577  66ff76fc             push dword ptr [bp - 4]
6:A57B  9a7c38ada5           lcall 0xa5ad, 0x387c  ; sub_s7:387C
6:A580  66ff760a             push dword ptr [bp + 0xa]
6:A584  66ff76fc             push dword ptr [bp - 4]
6:A588  66ff7606             push dword ptr [bp + 6]
6:A58C  90                   nop
6:A58D  0e                   push cs
6:A58E  e88d00               call 0xa61e  ; sub_s6:A61E
loc_A591:
6:A591  66ff760a             push dword ptr [bp + 0xa]
6:A595  9ab03fbba3           lcall 0xa3bb, 0x3fb0  ; sub_s8:3FB0
6:A59A  c45e0a               les bx, ptr [bp + 0xa]
6:A59D  2683bf040200         cmp word ptr es:[bx + 0x204], 0
6:A5A3  740e                 je 0xa5b3
6:A5A5  688000               push 0x80
6:A5A8  52                   push dx
6:A5A9  50                   push ax
6:A5AA  9ab225d6a3           lcall 0xa3d6, 0x25b2  ; sub_s7:25B2
6:A5AF  0bc0                 or ax, ax
6:A5B1  7565                 jne 0xa618
loc_A5B3:
6:A5B3  668b46fc             mov eax, dword ptr [bp - 4]
6:A5B7  8b56fe               mov dx, word ptr [bp - 2]
6:A5BA  057401               add ax, 0x174
6:A5BD  668946e0             mov dword ptr [bp - 0x20], eax
6:A5C1  8b46fc               mov ax, word ptr [bp - 4]
6:A5C4  058001               add ax, 0x180
6:A5C7  668946d2             mov dword ptr [bp - 0x2e], eax
6:A5CB  c746d00100           mov word ptr [bp - 0x30], 1
loc_A5D0:
6:A5D0  8b5ed0               mov bx, word ptr [bp - 0x30]
6:A5D3  03db                 add bx, bx
6:A5D5  c476d2               les si, ptr [bp - 0x2e]
6:A5D8  26833800             cmp word ptr es:[bx + si], 0
6:A5DC  7431                 je 0xa60f
6:A5DE  666801006400         push 0x640001
6:A5E4  9a2e61c2a4           lcall 0xa4c2, 0x612e  ; sub_s2:612E
6:A5E9  83c404               add sp, 4
6:A5EC  8b5ed0               mov bx, word ptr [bp - 0x30]
6:A5EF  03db                 add bx, bx
6:A5F1  c476d2               les si, ptr [bp - 0x2e]
6:A5F4  263900               cmp word ptr es:[bx + si], ax
6:A5F7  7c16                 jl 0xa60f
6:A5F9  66ff760a             push dword ptr [bp + 0xa]
6:A5FD  ff76d0               push word ptr [bp - 0x30]
6:A600  c476e0               les si, ptr [bp - 0x20]
6:A603  26ff30               push word ptr es:[bx + si]
6:A606  66ff7606             push dword ptr [bp + 6]
6:A60A  90                   nop
6:A60B  0e                   push cs
6:A60C  e879fb               call 0xa188  ; sub_s6:A188
loc_A60F:
6:A60F  ff46d0               inc word ptr [bp - 0x30]
6:A612  837ed006             cmp word ptr [bp - 0x30], 6
6:A616  7cb8                 jl 0xa5d0
loc_A618:
6:A618  5e                   pop si
6:A619  c9                   leave
6:A61A  ca0800               retf 8
6:A61D  db 00

; ---------------- sub_s6:A61E FAR size=172 callers=1
6:A61E  c8220000             enter 0x22, 0
6:A622  66ff760a             push dword ptr [bp + 0xa]
6:A626  9ab83845a6           lcall 0xa645, 0x38b8  ; sub_s7:38B8
6:A62B  81faff3f             cmp dx, 0x3fff
6:A62F  7c0b                 jl 0xa63c
6:A631  0f8f9100             jg 0xa6c6
6:A635  3dffff               cmp ax, 0xffff
6:A638  0f838a00             jae 0xa6c6
loc_A63C:
6:A63C  6a03                 push 3
6:A63E  66ff760a             push dword ptr [bp + 0xa]
6:A642  9af23856a6           lcall 0xa656, 0x38f2  ; sub_s7:38F2
6:A647  8946f4               mov word ptr [bp - 0xc], ax
6:A64A  8956f6               mov word ptr [bp - 0xa], dx
6:A64D  6a04                 push 4
6:A64F  66ff760a             push dword ptr [bp + 0xa]
6:A653  9af238c4a6           lcall 0xa6c4, 0x38f2  ; sub_s7:38F2
6:A658  0146f4               add word ptr [bp - 0xc], ax
6:A65B  1156f6               adc word ptr [bp - 0xa], dx
6:A65E  c45e0a               les bx, ptr [bp + 0xa]
6:A661  268b87a801           mov ax, word ptr es:[bx + 0x1a8]
6:A666  8946f2               mov word ptr [bp - 0xe], ax
6:A669  0bc0                 or ax, ax
6:A66B  7505                 jne 0xa672
6:A66D  c746f20500           mov word ptr [bp - 0xe], 5
loc_A672:
6:A672  6a00                 push 0
6:A674  ff76f2               push word ptr [bp - 0xe]
6:A677  668b46f4             mov eax, dword ptr [bp - 0xc]
6:A67B  6659                 pop ecx
6:A67D  6699                 cdq
6:A67F  66f7f9               idiv ecx
6:A682  668946f4             mov dword ptr [bp - 0xc], eax
6:A686  8b56f6               mov dx, word ptr [bp - 0xa]
6:A689  0bd0                 or dx, ax
6:A68B  7439                 je 0xa6c6
6:A68D  c45e0e               les bx, ptr [bp + 0xe]
6:A690  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:A69A  742a                 je 0xa6c6
6:A69C  6a2b                 push 0x2b
6:A69E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:A6A3  9aba20b7a6           lcall 0xa6b7, 0x20ba  ; sub_s3:20BA
6:A6A8  6a0c                 push 0xc
6:A6AA  c45e0e               les bx, ptr [bp + 0xe]
6:A6AD  6626ff7704           push dword ptr es:[bx + 4]
6:A6B2  52                   push dx
6:A6B3  50                   push ax
6:A6B4  9a3a0439a4           lcall 0xa439, 0x43a  ; sub_s3:043A
6:A6B9  66ff76f4             push dword ptr [bp - 0xc]
6:A6BD  66ff760a             push dword ptr [bp + 0xa]
6:A6C1  9a343547a5           lcall 0xa547, 0x3534  ; sub_s7:3534
loc_A6C6:
6:A6C6  c9                   leave
6:A6C7  ca0c00               retf 0xc

; ---------------- SCPop::dtor@s6:A6CA size=60 callers=0
6:A6CA  c80c0000             enter 0xc, 0
6:A6CE  c45e06               les bx, ptr [bp + 6]
6:A6D1  26c7079a38           mov word ptr es:[bx], 0x389a
6:A6D6  26c7470216a5         mov word ptr es:[bx + 2], 0xa516  ; SEGMENT s2:0000
6:A6DC  f6460a01             test byte ptr [bp + 0xa], 1
6:A6E0  7409                 je 0xa6eb
6:A6E2  66ff7606             push dword ptr [bp + 6]
6:A6E6  9ace1706a1           lcall 0xa106, 0x17ce  ; operator_delete@s1:17CE
loc_A6EB:
6:A6EB  8b4606               mov ax, word ptr [bp + 6]
6:A6EE  8b5608               mov dx, word ptr [bp + 8]
6:A6F1  c9                   leave
6:A6F2  ca0600               retf 6
6:A6F5  db 00 ca a6 fc a6 fc 9e 00 a7 28 d2 04 a7 fa a0 5a
6:A705  db a1

; ---------------- SCPrelimAlloc@s6:A706 FAR size=54 callers=1
6:A706  55                   push bp
6:A707  8bec                 mov bp, sp
6:A709  68b70b               push 0xbb7
6:A70C  66ff7606             push dword ptr [bp + 6]
6:A710  90                   nop
6:A711  0e                   push cs
6:A712  e8c72a               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:A715  c45e06               les bx, ptr [bp + 6]
6:A718  26c70756a8           mov word ptr es:[bx], 0xa856
6:A71D  26c74702f8a6         mov word ptr es:[bx + 2], 0xa6f8  ; SEGMENT s6:0000
6:A723  1e                   push ds
6:A724  68f650               push 0x50f6  ; 'SCPrelimAlloc'
6:A727  8d4708               lea ax, [bx + 8]
6:A72A  06                   push es
6:A72B  50                   push ax
6:A72C  9a3e3de9a6           lcall 0xa6e9, 0x3d3e  ; _fstrcpy@s1:3D3E
6:A731  8b4606               mov ax, word ptr [bp + 6]
6:A734  8b5608               mov dx, word ptr [bp + 8]
6:A737  c9                   leave
6:A738  ca0400               retf 4
6:A73B  db 00

; ---------------- SCPrelimAlloc::calcMe@s6:A73C FAR size=96 callers=0
6:A73C  c8200000             enter 0x20, 0
6:A740  666800000004         push 0x4000000
6:A746  6a01                 push 1
6:A748  8d46ee               lea ax, [bp - 0x12]
6:A74B  16                   push ss
6:A74C  50                   push ax
6:A74D  90                   nop
6:A74E  0e                   push cs
6:A74F  e80035               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_A752:
6:A752  8d46ee               lea ax, [bp - 0x12]
6:A755  16                   push ss
6:A756  50                   push ax
6:A757  90                   nop
6:A758  0e                   push cs
6:A759  e8903d               call 0xe4ec  ; DbIter::next@s6:E4EC
6:A75C  8946ea               mov word ptr [bp - 0x16], ax
6:A75F  8956ec               mov word ptr [bp - 0x14], dx
6:A762  0bd0                 or dx, ax
6:A764  7420                 je 0xa786
6:A766  ff76ec               push word ptr [bp - 0x14]
6:A769  50                   push ax
6:A76A  9a645478a7           lcall 0xa778, 0x5464  ; Colony::sumTileLedgers?@s8:5464
6:A76F  6a00                 push 0
6:A771  66ff76ea             push dword ptr [bp - 0x16]
6:A775  9ad65681a7           lcall 0xa781, 0x56d6  ; Colony::step2?@s8:56D6
6:A77A  66ff76ea             push dword ptr [bp - 0x16]
6:A77E  9a8c5121a5           lcall 0xa521, 0x518c  ; Colony::step3?@s8:518C
6:A783  ebcd                 jmp 0xa752
6:A785  db 90
loc_A786:
6:A786  c746e80100           mov word ptr [bp - 0x18], 1
6:A78B  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:A790  c746f0daa6           mov word ptr [bp - 0x10], 0xa6da  ; SEGMENT s2:0000
6:A795  8b46e8               mov ax, word ptr [bp - 0x18]
6:A798  c9                   leave
6:A799  ca0400               retf 4

; ---------------- SCPrelimAlloc::clone@s6:A79C size=142 callers=0
6:A79C  c8200000             enter 0x20, 0
6:A7A0  57                   push di
6:A7A1  56                   push si
6:A7A2  680801               push 0x108
6:A7A5  9a9c172fa7           lcall 0xa72f, 0x179c  ; operator_new@s1:179C
6:A7AA  83c402               add sp, 2
6:A7AD  8946f8               mov word ptr [bp - 8], ax
6:A7B0  8956fa               mov word ptr [bp - 6], dx
6:A7B3  0bd0                 or dx, ax
6:A7B5  745f                 je 0xa816
6:A7B7  c45ef8               les bx, ptr [bp - 8]
6:A7BA  26c7079a38           mov word ptr es:[bx], 0x389a
6:A7BF  26c7470293a7         mov word ptr es:[bx + 2], 0xa793  ; SEGMENT s2:0000
6:A7C5  c45e06               les bx, ptr [bp + 6]
6:A7C8  66268b4704           mov eax, dword ptr es:[bx + 4]
6:A7CD  c45ef8               les bx, ptr [bp - 8]
6:A7D0  6626894704           mov dword ptr es:[bx + 4], eax
6:A7D5  8b4606               mov ax, word ptr [bp + 6]
6:A7D8  8b5608               mov dx, word ptr [bp + 8]
6:A7DB  050800               add ax, 8
6:A7DE  1e                   push ds
6:A7DF  8d7f08               lea di, [bx + 8]
6:A7E2  8bf0                 mov si, ax
6:A7E4  8eda                 mov ds, dx
6:A7E6  66b940000000         mov ecx, 0x40
6:A7EC  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:A7EF  1f                   pop ds
6:A7F0  c45ef8               les bx, ptr [bp - 8]
6:A7F3  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:A7F8  26c747020aa8         mov word ptr es:[bx + 2], 0xa80a  ; SEGMENT s6:0000
6:A7FE  c45ef8               les bx, ptr [bp - 8]
6:A801  26c70756a8           mov word ptr es:[bx], 0xa856
6:A806  26c7470221a7         mov word ptr es:[bx + 2], 0xa721  ; SEGMENT s6:0000
6:A80C  668b46f8             mov eax, dword ptr [bp - 8]
6:A810  668946fc             mov dword ptr [bp - 4], eax
6:A814  eb08                 jmp 0xa81e
loc_A816:
6:A816  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_A81E:
6:A81E  8b46fc               mov ax, word ptr [bp - 4]
6:A821  8b56fe               mov dx, word ptr [bp - 2]
6:A824  5e                   pop si
6:A825  5f                   pop di
6:A826  c9                   leave
6:A827  ca0400               retf 4

; ---------------- SCPrelimAlloc::dtor@s6:A82A size=60 callers=0
6:A82A  c80c0000             enter 0xc, 0
6:A82E  c45e06               les bx, ptr [bp + 6]
6:A831  26c7079a38           mov word ptr es:[bx], 0x389a
6:A836  26c74702c3a7         mov word ptr es:[bx + 2], 0xa7c3  ; SEGMENT s2:0000
6:A83C  f6460a01             test byte ptr [bp + 0xa], 1
6:A840  7409                 je 0xa84b
6:A842  66ff7606             push dword ptr [bp + 6]
6:A846  9ace17a8a7           lcall 0xa7a8, 0x17ce  ; operator_delete@s1:17CE
loc_A84B:
6:A84B  8b4606               mov ax, word ptr [bp + 6]
6:A84E  8b5608               mov dx, word ptr [bp + 8]
6:A851  c9                   leave
6:A852  ca0600               retf 6
6:A855  db 00 2a a8 5c a8 3c a7 60 a8 28 d2 64 a8 9c a7 fc
6:A865  db a7

; ---------------- SCProdSched@s6:A866 FAR size=54 callers=1
6:A866  55                   push bp
6:A867  8bec                 mov bp, sp
6:A869  68af36               push 0x36af
6:A86C  66ff7606             push dword ptr [bp + 6]
6:A870  90                   nop
6:A871  0e                   push cs
6:A872  e86729               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:A875  c45e06               les bx, ptr [bp + 6]
6:A878  26c707aea9           mov word ptr es:[bx], 0xa9ae
6:A87D  26c7470258a8         mov word ptr es:[bx + 2], 0xa858  ; SEGMENT s6:0000
6:A883  1e                   push ds
6:A884  680451               push 0x5104  ; 'SCProdSched'
6:A887  8d4708               lea ax, [bx + 8]
6:A88A  06                   push es
6:A88B  50                   push ax
6:A88C  9a3e3d49a8           lcall 0xa849, 0x3d3e  ; _fstrcpy@s1:3D3E
6:A891  8b4606               mov ax, word ptr [bp + 6]
6:A894  8b5608               mov dx, word ptr [bp + 8]
6:A897  c9                   leave
6:A898  ca0400               retf 4
6:A89B  db 00

; ---------------- SCProdSched::calcMe@s6:A89C FAR size=88 callers=0
6:A89C  c8200000             enter 0x20, 0
6:A8A0  666800000004         push 0x4000000
6:A8A6  6a01                 push 1
6:A8A8  8d46ee               lea ax, [bp - 0x12]
6:A8AB  16                   push ss
6:A8AC  50                   push ax
6:A8AD  90                   nop
6:A8AE  0e                   push cs
6:A8AF  e8a033               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_A8B2:
6:A8B2  8d46ee               lea ax, [bp - 0x12]
6:A8B5  16                   push ss
6:A8B6  50                   push ax
6:A8B7  90                   nop
6:A8B8  0e                   push cs
6:A8B9  e8303c               call 0xe4ec  ; DbIter::next@s6:E4EC
6:A8BC  8946ea               mov word ptr [bp - 0x16], ax
6:A8BF  8956ec               mov word ptr [bp - 0x14], dx
6:A8C2  0bd0                 or dx, ax
6:A8C4  7418                 je 0xa8de
6:A8C6  c45eea               les bx, ptr [bp - 0x16]
6:A8C9  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:A8D3  74dd                 je 0xa8b2
6:A8D5  06                   push es
6:A8D6  50                   push ax
6:A8D7  9aca3f6da7           lcall 0xa76d, 0x3fca  ; sub_s8:3FCA
6:A8DC  ebd4                 jmp 0xa8b2
loc_A8DE:
6:A8DE  c746e00100           mov word ptr [bp - 0x20], 1
6:A8E3  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:A8E8  c746f03aa8           mov word ptr [bp - 0x10], 0xa83a  ; SEGMENT s2:0000
6:A8ED  8b46e0               mov ax, word ptr [bp - 0x20]
6:A8F0  c9                   leave
6:A8F1  ca0400               retf 4

; ---------------- SCProdSched::clone@s6:A8F4 size=142 callers=0
6:A8F4  c8200000             enter 0x20, 0
6:A8F8  57                   push di
6:A8F9  56                   push si
6:A8FA  680801               push 0x108
6:A8FD  9a9c178fa8           lcall 0xa88f, 0x179c  ; operator_new@s1:179C
6:A902  83c402               add sp, 2
6:A905  8946f8               mov word ptr [bp - 8], ax
6:A908  8956fa               mov word ptr [bp - 6], dx
6:A90B  0bd0                 or dx, ax
6:A90D  745f                 je 0xa96e
6:A90F  c45ef8               les bx, ptr [bp - 8]
6:A912  26c7079a38           mov word ptr es:[bx], 0x389a
6:A917  26c74702eba8         mov word ptr es:[bx + 2], 0xa8eb  ; SEGMENT s2:0000
6:A91D  c45e06               les bx, ptr [bp + 6]
6:A920  66268b4704           mov eax, dword ptr es:[bx + 4]
6:A925  c45ef8               les bx, ptr [bp - 8]
6:A928  6626894704           mov dword ptr es:[bx + 4], eax
6:A92D  8b4606               mov ax, word ptr [bp + 6]
6:A930  8b5608               mov dx, word ptr [bp + 8]
6:A933  050800               add ax, 8
6:A936  1e                   push ds
6:A937  8d7f08               lea di, [bx + 8]
6:A93A  8bf0                 mov si, ax
6:A93C  8eda                 mov ds, dx
6:A93E  66b940000000         mov ecx, 0x40
6:A944  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:A947  1f                   pop ds
6:A948  c45ef8               les bx, ptr [bp - 8]
6:A94B  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:A950  26c7470262a9         mov word ptr es:[bx + 2], 0xa962  ; SEGMENT s6:0000
6:A956  c45ef8               les bx, ptr [bp - 8]
6:A959  26c707aea9           mov word ptr es:[bx], 0xa9ae
6:A95E  26c7470281a8         mov word ptr es:[bx + 2], 0xa881  ; SEGMENT s6:0000
6:A964  668b46f8             mov eax, dword ptr [bp - 8]
6:A968  668946fc             mov dword ptr [bp - 4], eax
6:A96C  eb08                 jmp 0xa976
loc_A96E:
6:A96E  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_A976:
6:A976  8b46fc               mov ax, word ptr [bp - 4]
6:A979  8b56fe               mov dx, word ptr [bp - 2]
6:A97C  5e                   pop si
6:A97D  5f                   pop di
6:A97E  c9                   leave
6:A97F  ca0400               retf 4

; ---------------- SCProdSched::dtor@s6:A982 size=60 callers=0
6:A982  c80c0000             enter 0xc, 0
6:A986  c45e06               les bx, ptr [bp + 6]
6:A989  26c7079a38           mov word ptr es:[bx], 0x389a
6:A98E  26c747021ba9         mov word ptr es:[bx + 2], 0xa91b  ; SEGMENT s2:0000
6:A994  f6460a01             test byte ptr [bp + 0xa], 1
6:A998  7409                 je 0xa9a3
6:A99A  66ff7606             push dword ptr [bp + 6]
6:A99E  9ace1700a9           lcall 0xa900, 0x17ce  ; operator_delete@s1:17CE
loc_A9A3:
6:A9A3  8b4606               mov ax, word ptr [bp + 6]
6:A9A6  8b5608               mov dx, word ptr [bp + 8]
6:A9A9  c9                   leave
6:A9AA  ca0600               retf 6
6:A9AD  db 00 82 a9 b4 a9 9c a8 b8 a9 28 d2 bc a9 f4 a8 54
6:A9BD  db a9

; ---------------- SCPower@s6:A9BE FAR size=54 callers=1
6:A9BE  55                   push bp
6:A9BF  8bec                 mov bp, sp
6:A9C1  686f17               push 0x176f
6:A9C4  66ff7606             push dword ptr [bp + 6]
6:A9C8  90                   nop
6:A9C9  0e                   push cs
6:A9CA  e80f28               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:A9CD  c45e06               les bx, ptr [bp + 6]
6:A9D0  26c70722ab           mov word ptr es:[bx], 0xab22
6:A9D5  26c74702b0a9         mov word ptr es:[bx + 2], 0xa9b0  ; SEGMENT s6:0000
6:A9DB  1e                   push ds
6:A9DC  681051               push 0x5110  ; 'SCPower'
6:A9DF  8d4708               lea ax, [bx + 8]
6:A9E2  06                   push es
6:A9E3  50                   push ax
6:A9E4  9a3e3da1a9           lcall 0xa9a1, 0x3d3e  ; _fstrcpy@s1:3D3E
6:A9E9  8b4606               mov ax, word ptr [bp + 6]
6:A9EC  8b5608               mov dx, word ptr [bp + 8]
6:A9EF  c9                   leave
6:A9F0  ca0400               retf 4
6:A9F3  db 00

; ---------------- SCPower::calcMe@s6:A9F4 FAR size=116 callers=0
6:A9F4  c8220000             enter 0x22, 0
6:A9F8  666800000007         push 0x7000000
6:A9FE  6a01                 push 1
6:AA00  8d46ee               lea ax, [bp - 0x12]
6:AA03  16                   push ss
6:AA04  50                   push ax
6:AA05  90                   nop
6:AA06  0e                   push cs
6:AA07  e84832               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_AA0A:
6:AA0A  8d46ee               lea ax, [bp - 0x12]
6:AA0D  16                   push ss
6:AA0E  50                   push ax
6:AA0F  90                   nop
6:AA10  0e                   push cs
6:AA11  e8d83a               call 0xe4ec  ; DbIter::next@s6:E4EC
6:AA14  8946ea               mov word ptr [bp - 0x16], ax
6:AA17  8956ec               mov word ptr [bp - 0x14], dx
6:AA1A  0bd0                 or dx, ax
6:AA1C  7434                 je 0xaa52
6:AA1E  6a0c                 push 0xc
6:AA20  c45eea               les bx, ptr [bp - 0x16]
6:AA23  26ff770c             push word ptr es:[bx + 0xc]
6:AA27  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:AA2C  9aaec65faa           lcall 0xaa5f, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:AA31  0bc0                 or ax, ax
6:AA33  74d5                 je 0xaa0a
6:AA35  c45eea               les bx, ptr [bp - 0x16]
6:AA38  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:AA3D  7505                 jne 0xaa44
6:AA3F  b80100               mov ax, 1
6:AA42  eb02                 jmp 0xaa46
loc_AA44:
6:AA44  33c0                 xor ax, ax
loc_AA46:
6:AA46  50                   push ax
6:AA47  06                   push es
6:AA48  53                   push bx
6:AA49  26c41f               les bx, ptr es:[bx]
6:AA4C  26ff5f34             lcall es:[bx + 0x34]
6:AA50  ebb8                 jmp 0xaa0a
loc_AA52:
6:AA52  c746de0100           mov word ptr [bp - 0x22], 1
6:AA57  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:AA5C  c746f092a9           mov word ptr [bp - 0x10], 0xa992  ; SEGMENT s2:0000
6:AA61  8b46de               mov ax, word ptr [bp - 0x22]
6:AA64  c9                   leave
6:AA65  ca0400               retf 4

; ---------------- SCPower::clone@s6:AA68 size=142 callers=0
6:AA68  c8200000             enter 0x20, 0
6:AA6C  57                   push di
6:AA6D  56                   push si
6:AA6E  680801               push 0x108
6:AA71  9a9c17e7a9           lcall 0xa9e7, 0x179c  ; operator_new@s1:179C
6:AA76  83c402               add sp, 2
6:AA79  8946f8               mov word ptr [bp - 8], ax
6:AA7C  8956fa               mov word ptr [bp - 6], dx
6:AA7F  0bd0                 or dx, ax
6:AA81  745f                 je 0xaae2
6:AA83  c45ef8               les bx, ptr [bp - 8]
6:AA86  26c7079a38           mov word ptr es:[bx], 0x389a
6:AA8B  26c747022faa         mov word ptr es:[bx + 2], 0xaa2f  ; SEGMENT s2:0000
6:AA91  c45e06               les bx, ptr [bp + 6]
6:AA94  66268b4704           mov eax, dword ptr es:[bx + 4]
6:AA99  c45ef8               les bx, ptr [bp - 8]
6:AA9C  6626894704           mov dword ptr es:[bx + 4], eax
6:AAA1  8b4606               mov ax, word ptr [bp + 6]
6:AAA4  8b5608               mov dx, word ptr [bp + 8]
6:AAA7  050800               add ax, 8
6:AAAA  1e                   push ds
6:AAAB  8d7f08               lea di, [bx + 8]
6:AAAE  8bf0                 mov si, ax
6:AAB0  8eda                 mov ds, dx
6:AAB2  66b940000000         mov ecx, 0x40
6:AAB8  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:AABB  1f                   pop ds
6:AABC  c45ef8               les bx, ptr [bp - 8]
6:AABF  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:AAC4  26c74702d6aa         mov word ptr es:[bx + 2], 0xaad6  ; SEGMENT s6:0000
6:AACA  c45ef8               les bx, ptr [bp - 8]
6:AACD  26c70722ab           mov word ptr es:[bx], 0xab22
6:AAD2  26c74702d9a9         mov word ptr es:[bx + 2], 0xa9d9  ; SEGMENT s6:0000
6:AAD8  668b46f8             mov eax, dword ptr [bp - 8]
6:AADC  668946fc             mov dword ptr [bp - 4], eax
6:AAE0  eb08                 jmp 0xaaea
loc_AAE2:
6:AAE2  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_AAEA:
6:AAEA  8b46fc               mov ax, word ptr [bp - 4]
6:AAED  8b56fe               mov dx, word ptr [bp - 2]
6:AAF0  5e                   pop si
6:AAF1  5f                   pop di
6:AAF2  c9                   leave
6:AAF3  ca0400               retf 4

; ---------------- SCPower::dtor@s6:AAF6 size=60 callers=0
6:AAF6  c80c0000             enter 0xc, 0
6:AAFA  c45e06               les bx, ptr [bp + 6]
6:AAFD  26c7079a38           mov word ptr es:[bx], 0x389a
6:AB02  26c747028faa         mov word ptr es:[bx + 2], 0xaa8f  ; SEGMENT s2:0000
6:AB08  f6460a01             test byte ptr [bp + 0xa], 1
6:AB0C  7409                 je 0xab17
6:AB0E  66ff7606             push dword ptr [bp + 6]
6:AB12  9ace1774aa           lcall 0xaa74, 0x17ce  ; operator_delete@s1:17CE
loc_AB17:
6:AB17  8b4606               mov ax, word ptr [bp + 6]
6:AB1A  8b5608               mov dx, word ptr [bp + 8]
6:AB1D  c9                   leave
6:AB1E  ca0600               retf 6
6:AB21  db 00 f6 aa 28 ab f4 a9 2c ab 28 d2 30 ab 68 aa c8
6:AB31  db aa

; ---------------- SCRchSched@s6:AB32 FAR size=54 callers=1
6:AB32  55                   push bp
6:AB33  8bec                 mov bp, sp
6:AB35  68df2e               push 0x2edf
6:AB38  66ff7606             push dword ptr [bp + 6]
6:AB3C  90                   nop
6:AB3D  0e                   push cs
6:AB3E  e89b26               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:AB41  c45e06               les bx, ptr [bp + 6]
6:AB44  26c707a6ac           mov word ptr es:[bx], 0xaca6
6:AB49  26c7470224ab         mov word ptr es:[bx + 2], 0xab24  ; SEGMENT s6:0000
6:AB4F  1e                   push ds
6:AB50  681851               push 0x5118  ; 'SCRchSched'
6:AB53  8d4708               lea ax, [bx + 8]
6:AB56  06                   push es
6:AB57  50                   push ax
6:AB58  9a3e3d15ab           lcall 0xab15, 0x3d3e  ; _fstrcpy@s1:3D3E
6:AB5D  8b4606               mov ax, word ptr [bp + 6]
6:AB60  8b5608               mov dx, word ptr [bp + 8]
6:AB63  c9                   leave
6:AB64  ca0400               retf 4
6:AB67  db 00

; ---------------- SCRchSched::calcMe@s6:AB68 FAR size=132 callers=0
6:AB68  c8220000             enter 0x22, 0
6:AB6C  666800000007         push 0x7000000
6:AB72  6a01                 push 1
6:AB74  8d46ee               lea ax, [bp - 0x12]
6:AB77  16                   push ss
6:AB78  50                   push ax
6:AB79  90                   nop
6:AB7A  0e                   push cs
6:AB7B  e8d430               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_AB7E:
6:AB7E  8d46ee               lea ax, [bp - 0x12]
6:AB81  16                   push ss
6:AB82  50                   push ax
6:AB83  90                   nop
6:AB84  0e                   push cs
6:AB85  e86439               call 0xe4ec  ; DbIter::next@s6:E4EC
6:AB88  8946ea               mov word ptr [bp - 0x16], ax
6:AB8B  8956ec               mov word ptr [bp - 0x14], dx
6:AB8E  0bd0                 or dx, ax
6:AB90  7444                 je 0xabd6
6:AB92  c45eea               les bx, ptr [bp - 0x16]
6:AB95  268b470c             mov ax, word ptr es:[bx + 0xc]
6:AB99  8946e8               mov word ptr [bp - 0x18], ax
6:AB9C  6a11                 push 0x11
6:AB9E  50                   push ax
6:AB9F  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:ABA4  9aaec6baab           lcall 0xabba, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:ABA9  0bc0                 or ax, ax
6:ABAB  7513                 jne 0xabc0
6:ABAD  6a12                 push 0x12  ; 'version %d %d'
6:ABAF  ff76e8               push word ptr [bp - 0x18]
6:ABB2  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:ABB7  9aaec6e3ab           lcall 0xabe3, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:ABBC  0bc0                 or ax, ax
6:ABBE  74be                 je 0xab7e
loc_ABC0:
6:ABC0  c45eea               les bx, ptr [bp - 0x16]
6:ABC3  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:ABC8  75b4                 jne 0xab7e
6:ABCA  06                   push es
6:ABCB  53                   push bx
6:ABCC  26c41f               les bx, ptr es:[bx]
6:ABCF  26ff5f30             lcall es:[bx + 0x30]
6:ABD3  eba9                 jmp 0xab7e
6:ABD5  db 90
loc_ABD6:
6:ABD6  c746de0100           mov word ptr [bp - 0x22], 1
6:ABDB  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:ABE0  c746f006ab           mov word ptr [bp - 0x10], 0xab06  ; SEGMENT s2:0000
6:ABE5  8b46de               mov ax, word ptr [bp - 0x22]
6:ABE8  c9                   leave
6:ABE9  ca0400               retf 4

; ---------------- SCRchSched::clone@s6:ABEC size=142 callers=0
6:ABEC  c8200000             enter 0x20, 0
6:ABF0  57                   push di
6:ABF1  56                   push si
6:ABF2  680801               push 0x108
6:ABF5  9a9c175bab           lcall 0xab5b, 0x179c  ; operator_new@s1:179C
6:ABFA  83c402               add sp, 2
6:ABFD  8946f8               mov word ptr [bp - 8], ax
6:AC00  8956fa               mov word ptr [bp - 6], dx
6:AC03  0bd0                 or dx, ax
6:AC05  745f                 je 0xac66
6:AC07  c45ef8               les bx, ptr [bp - 8]
6:AC0A  26c7079a38           mov word ptr es:[bx], 0x389a
6:AC0F  26c74702a7ab         mov word ptr es:[bx + 2], 0xaba7  ; SEGMENT s2:0000
6:AC15  c45e06               les bx, ptr [bp + 6]
6:AC18  66268b4704           mov eax, dword ptr es:[bx + 4]
6:AC1D  c45ef8               les bx, ptr [bp - 8]
6:AC20  6626894704           mov dword ptr es:[bx + 4], eax
6:AC25  8b4606               mov ax, word ptr [bp + 6]
6:AC28  8b5608               mov dx, word ptr [bp + 8]
6:AC2B  050800               add ax, 8
6:AC2E  1e                   push ds
6:AC2F  8d7f08               lea di, [bx + 8]
6:AC32  8bf0                 mov si, ax
6:AC34  8eda                 mov ds, dx
6:AC36  66b940000000         mov ecx, 0x40
6:AC3C  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:AC3F  1f                   pop ds
6:AC40  c45ef8               les bx, ptr [bp - 8]
6:AC43  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:AC48  26c747025aac         mov word ptr es:[bx + 2], 0xac5a  ; SEGMENT s6:0000
6:AC4E  c45ef8               les bx, ptr [bp - 8]
6:AC51  26c707a6ac           mov word ptr es:[bx], 0xaca6
6:AC56  26c747024dab         mov word ptr es:[bx + 2], 0xab4d  ; SEGMENT s6:0000
6:AC5C  668b46f8             mov eax, dword ptr [bp - 8]
6:AC60  668946fc             mov dword ptr [bp - 4], eax
6:AC64  eb08                 jmp 0xac6e
loc_AC66:
6:AC66  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_AC6E:
6:AC6E  8b46fc               mov ax, word ptr [bp - 4]
6:AC71  8b56fe               mov dx, word ptr [bp - 2]
6:AC74  5e                   pop si
6:AC75  5f                   pop di
6:AC76  c9                   leave
6:AC77  ca0400               retf 4

; ---------------- SCRchSched::dtor@s6:AC7A size=60 callers=0
6:AC7A  c80c0000             enter 0xc, 0
6:AC7E  c45e06               les bx, ptr [bp + 6]
6:AC81  26c7079a38           mov word ptr es:[bx], 0x389a
6:AC86  26c7470213ac         mov word ptr es:[bx + 2], 0xac13  ; SEGMENT s2:0000
6:AC8C  f6460a01             test byte ptr [bp + 0xa], 1
6:AC90  7409                 je 0xac9b
6:AC92  66ff7606             push dword ptr [bp + 6]
6:AC96  9ace17f8ab           lcall 0xabf8, 0x17ce  ; operator_delete@s1:17CE
loc_AC9B:
6:AC9B  8b4606               mov ax, word ptr [bp + 6]
6:AC9E  8b5608               mov dx, word ptr [bp + 8]
6:ACA1  c9                   leave
6:ACA2  ca0600               retf 6
6:ACA5  db 00 7a ac ac ac 68 ab b0 ac 28 d2 b4 ac ec ab 4c
6:ACB5  db ac

; ---------------- SCSetup@s6:ACB6 FAR size=54 callers=1
6:ACB6  55                   push bp
6:ACB7  8bec                 mov bp, sp
6:ACB9  687f3e               push 0x3e7f
6:ACBC  66ff7606             push dword ptr [bp + 6]
6:ACC0  90                   nop
6:ACC1  0e                   push cs
6:ACC2  e81725               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:ACC5  c45e06               les bx, ptr [bp + 6]
6:ACC8  26c70756ae           mov word ptr es:[bx], 0xae56
6:ACCD  26c74702a8ac         mov word ptr es:[bx + 2], 0xaca8  ; SEGMENT s6:0000
6:ACD3  1e                   push ds
6:ACD4  682451               push 0x5124  ; 'SCSetup'
6:ACD7  8d4708               lea ax, [bx + 8]
6:ACDA  06                   push es
6:ACDB  50                   push ax
6:ACDC  9a3e3d99ac           lcall 0xac99, 0x3d3e  ; _fstrcpy@s1:3D3E
6:ACE1  8b4606               mov ax, word ptr [bp + 6]
6:ACE4  8b5608               mov dx, word ptr [bp + 8]
6:ACE7  c9                   leave
6:ACE8  ca0400               retf 4
6:ACEB  db 00

; ---------------- SCSetup::calcMe@s6:ACEC FAR size=176 callers=0
6:ACEC  c8220000             enter 0x22, 0
6:ACF0  666800000004         push 0x4000000
6:ACF6  6a01                 push 1
6:ACF8  8d46ee               lea ax, [bp - 0x12]
6:ACFB  16                   push ss
6:ACFC  50                   push ax
6:ACFD  90                   nop
6:ACFE  0e                   push cs
6:ACFF  e8502f               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_AD02:
6:AD02  8d46ee               lea ax, [bp - 0x12]
6:AD05  16                   push ss
6:AD06  50                   push ax
6:AD07  90                   nop
6:AD08  0e                   push cs
6:AD09  e8e037               call 0xe4ec  ; DbIter::next@s6:E4EC
6:AD0C  8946ea               mov word ptr [bp - 0x16], ax
6:AD0F  8956ec               mov word ptr [bp - 0x14], dx
6:AD12  0bd0                 or dx, ax
6:AD14  7438                 je 0xad4e
6:AD16  c45eea               les bx, ptr [bp - 0x16]
6:AD19  6626ff7704           push dword ptr es:[bx + 4]
6:AD1E  1e                   push ds
6:AD1F  682c51               push 0x512c  ; 'SCSetup::calcMe clearing colony 0x%08lx.'
6:AD22  9a0a8485ad           lcall 0xad85, 0x840a  ; sub_s7:840A
6:AD27  83c408               add sp, 8
6:AD2A  c45eea               les bx, ptr [bp - 0x16]
6:AD2D  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:AD37  74c9                 je 0xad02
6:AD39  06                   push es
6:AD3A  53                   push bx
6:AD3B  9a645449ad           lcall 0xad49, 0x5464  ; Colony::sumTileLedgers?@s8:5464
6:AD40  6a01                 push 1
6:AD42  66ff76ea             push dword ptr [bp - 0x16]
6:AD46  9ad656daa8           lcall 0xa8da, 0x56d6  ; Colony::step2?@s8:56D6
6:AD4B  ebb5                 jmp 0xad02
6:AD4D  db 90
loc_AD4E:
6:AD4E  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:AD53  c746f092ad           mov word ptr [bp - 0x10], 0xad92  ; SEGMENT s2:0000
6:AD58  666800000008         push 0x8000000
6:AD5E  6a01                 push 1
6:AD60  8d46ee               lea ax, [bp - 0x12]
6:AD63  16                   push ss
6:AD64  50                   push ax
6:AD65  90                   nop
6:AD66  0e                   push cs
6:AD67  e8e82e               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_AD6A:
6:AD6A  8d46ee               lea ax, [bp - 0x12]
6:AD6D  16                   push ss
6:AD6E  50                   push ax
6:AD6F  90                   nop
6:AD70  0e                   push cs
6:AD71  e87837               call 0xe4ec  ; DbIter::next@s6:E4EC
6:AD74  8946de               mov word ptr [bp - 0x22], ax
6:AD77  8956e0               mov word ptr [bp - 0x20], dx
6:AD7A  0bd0                 or dx, ax
6:AD7C  740c                 je 0xad8a
6:AD7E  ff76e0               push word ptr [bp - 0x20]
6:AD81  50                   push ax
6:AD82  9a902629a6           lcall 0xa629, 0x2690  ; sub_s7:2690
6:AD87  ebe1                 jmp 0xad6a
6:AD89  db 90
loc_AD8A:
6:AD8A  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:AD8F  c746f08aac           mov word ptr [bp - 0x10], 0xac8a  ; SEGMENT s2:0000
6:AD94  b80100               mov ax, 1
6:AD97  c9                   leave
6:AD98  ca0400               retf 4
6:AD9B  db 00

; ---------------- SCSetup::clone@s6:AD9C FAR size=142 callers=0
6:AD9C  c8200000             enter 0x20, 0
6:ADA0  57                   push di
6:ADA1  56                   push si
6:ADA2  680801               push 0x108
6:ADA5  9a9c17dfac           lcall 0xacdf, 0x179c  ; operator_new@s1:179C
6:ADAA  83c402               add sp, 2
6:ADAD  8946f8               mov word ptr [bp - 8], ax
6:ADB0  8956fa               mov word ptr [bp - 6], dx
6:ADB3  0bd0                 or dx, ax
6:ADB5  745f                 je 0xae16
6:ADB7  c45ef8               les bx, ptr [bp - 8]
6:ADBA  26c7079a38           mov word ptr es:[bx], 0x389a
6:ADBF  26c7470256ad         mov word ptr es:[bx + 2], 0xad56  ; SEGMENT s2:0000
6:ADC5  c45e06               les bx, ptr [bp + 6]
6:ADC8  66268b4704           mov eax, dword ptr es:[bx + 4]
6:ADCD  c45ef8               les bx, ptr [bp - 8]
6:ADD0  6626894704           mov dword ptr es:[bx + 4], eax
6:ADD5  8b4606               mov ax, word ptr [bp + 6]
6:ADD8  8b5608               mov dx, word ptr [bp + 8]
6:ADDB  050800               add ax, 8
6:ADDE  1e                   push ds
6:ADDF  8d7f08               lea di, [bx + 8]
6:ADE2  8bf0                 mov si, ax
6:ADE4  8eda                 mov ds, dx
6:ADE6  66b940000000         mov ecx, 0x40
6:ADEC  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:ADEF  1f                   pop ds
6:ADF0  c45ef8               les bx, ptr [bp - 8]
6:ADF3  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:ADF8  26c747020aae         mov word ptr es:[bx + 2], 0xae0a  ; SEGMENT s6:0000
6:ADFE  c45ef8               les bx, ptr [bp - 8]
6:AE01  26c70756ae           mov word ptr es:[bx], 0xae56
6:AE06  26c74702d1ac         mov word ptr es:[bx + 2], 0xacd1  ; SEGMENT s6:0000
6:AE0C  668b46f8             mov eax, dword ptr [bp - 8]
6:AE10  668946fc             mov dword ptr [bp - 4], eax
6:AE14  eb08                 jmp 0xae1e
loc_AE16:
6:AE16  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_AE1E:
6:AE1E  8b46fc               mov ax, word ptr [bp - 4]
6:AE21  8b56fe               mov dx, word ptr [bp - 2]
6:AE24  5e                   pop si
6:AE25  5f                   pop di
6:AE26  c9                   leave
6:AE27  ca0400               retf 4

; ---------------- SCSetup::dtor@s6:AE2A size=60 callers=0
6:AE2A  c80c0000             enter 0xc, 0
6:AE2E  c45e06               les bx, ptr [bp + 6]
6:AE31  26c7079a38           mov word ptr es:[bx], 0x389a
6:AE36  26c74702c3ad         mov word ptr es:[bx + 2], 0xadc3  ; SEGMENT s2:0000
6:AE3C  f6460a01             test byte ptr [bp + 0xa], 1
6:AE40  7409                 je 0xae4b
6:AE42  66ff7606             push dword ptr [bp + 6]
6:AE46  9ace17a8ad           lcall 0xada8, 0x17ce  ; operator_delete@s1:17CE
loc_AE4B:
6:AE4B  8b4606               mov ax, word ptr [bp + 6]
6:AE4E  8b5608               mov dx, word ptr [bp + 8]
6:AE51  c9                   leave
6:AE52  ca0600               retf 6
6:AE55  db 00 2a ae 5c ae ec ac 60 ae 28 d2 64 ae 9c ad fc
6:AE65  db ad

; ---------------- SCStarve@s6:AE66 FAR size=90 callers=1
6:AE66  55                   push bp
6:AE67  8bec                 mov bp, sp
6:AE69  688713               push 0x1387
6:AE6C  66ff7606             push dword ptr [bp + 6]
6:AE70  90                   nop
6:AE71  0e                   push cs
6:AE72  e86723               call 0xd1dc  ; SCBase::SCBase@s6:D1DC
6:AE75  668b4612             mov eax, dword ptr [bp + 0x12]
6:AE79  c45e06               les bx, ptr [bp + 6]
6:AE7C  662689870801         mov dword ptr es:[bx + 0x108], eax
6:AE82  668b460e             mov eax, dword ptr [bp + 0xe]
6:AE86  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:AE8C  668b460a             mov eax, dword ptr [bp + 0xa]
6:AE90  662689871001         mov dword ptr es:[bx + 0x110], eax
6:AE96  26c78714010000       mov word ptr es:[bx + 0x114], 0
6:AE9D  26c707ceb0           mov word ptr es:[bx], 0xb0ce
6:AEA2  26c7470258ae         mov word ptr es:[bx + 2], 0xae58  ; SEGMENT s6:0000
6:AEA8  1e                   push ds
6:AEA9  685651               push 0x5156  ; 'SCStarve'
6:AEAC  8d4708               lea ax, [bx + 8]
6:AEAF  06                   push es
6:AEB0  50                   push ax
6:AEB1  9a3e3d49ae           lcall 0xae49, 0x3d3e  ; _fstrcpy@s1:3D3E
6:AEB6  8b4606               mov ax, word ptr [bp + 6]
6:AEB9  8b5608               mov dx, word ptr [bp + 8]
6:AEBC  c9                   leave
6:AEBD  ca1000               retf 0x10

; ---------------- SCStarve::calcMe@s6:AEC0 size=72 callers=0
6:AEC0  c8100000             enter 0x10, 0
6:AEC4  c45e06               les bx, ptr [bp + 6]
6:AEC7  6626ffb70801         push dword ptr es:[bx + 0x108]
6:AECD  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:AED2  90                   nop
6:AED3  0e                   push cs
6:AED4  e81533               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:AED7  8946fc               mov word ptr [bp - 4], ax
6:AEDA  8956fe               mov word ptr [bp - 2], dx
6:AEDD  c45efc               les bx, ptr [bp - 4]
6:AEE0  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
6:AEE6  668946f8             mov dword ptr [bp - 8], eax
6:AEEA  c45e06               les bx, ptr [bp + 6]
6:AEED  66260fbf871401       movsx eax, word ptr es:[bx + 0x114]
6:AEF4  6650                 push eax
6:AEF6  6a00                 push 0
6:AEF8  66ff76f8             push dword ptr [bp - 8]
6:AEFC  9a5a3725ad           lcall 0xad25, 0x375a  ; sub_s7:375A
6:AF01  b80100               mov ax, 1
6:AF04  c9                   leave
6:AF05  ca0400               retf 4

; ---------------- SCStarve::shouldRun@s6:AF08 size=198 callers=0
6:AF08  c8200000             enter 0x20, 0
6:AF0C  6a02                 push 2
6:AF0E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:AF13  9aba2062af           lcall 0xaf62, 0x20ba  ; sub_s3:20BA
6:AF18  a1ae13               mov ax, word ptr [0x13ae]
6:AF1B  48                   dec ax
6:AF1C  7c09                 jl 0xaf27
6:AF1E  7007                 jo 0xaf27
6:AF20  48                   dec ax
6:AF21  7e0b                 jle 0xaf2e
6:AF23  48                   dec ax
6:AF24  48                   dec ax
6:AF25  7411                 je 0xaf38
loc_AF27:
6:AF27  c746f80100           mov word ptr [bp - 8], 1
6:AF2C  eb0f                 jmp 0xaf3d
loc_AF2E:
6:AF2E  66c746f601000100     mov dword ptr [bp - 0xa], 0x10001
6:AF36  eb0a                 jmp 0xaf42
loc_AF38:
6:AF38  c746f80200           mov word ptr [bp - 8], 2
loc_AF3D:
6:AF3D  c746f60300           mov word ptr [bp - 0xa], 3
loc_AF42:
6:AF42  ff76f6               push word ptr [bp - 0xa]
6:AF45  ff76f8               push word ptr [bp - 8]
6:AF48  9a2e61a8af           lcall 0xafa8, 0x612e  ; sub_s2:612E
6:AF4D  83c404               add sp, 4
6:AF50  c45e06               les bx, ptr [bp + 6]
6:AF53  2689871401           mov word ptr es:[bx + 0x114], ax
6:AF58  6a37                 push 0x37
6:AF5A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:AF5F  9aba20b4af           lcall 0xafb4, 0x20ba  ; sub_s3:20BA
6:AF64  8946f2               mov word ptr [bp - 0xe], ax
6:AF67  8956f4               mov word ptr [bp - 0xc], dx
6:AF6A  c45e06               les bx, ptr [bp + 6]
6:AF6D  6626ffb70801         push dword ptr es:[bx + 0x108]
6:AF73  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:AF78  90                   nop
6:AF79  0e                   push cs
6:AF7A  e86f32               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:AF7D  8946ee               mov word ptr [bp - 0x12], ax
6:AF80  8956f0               mov word ptr [bp - 0x10], dx
6:AF83  6a02                 push 2
6:AF85  c45e06               les bx, ptr [bp + 6]
6:AF88  6626ffb70801         push dword ptr es:[bx + 0x108]
6:AF8E  c45eee               les bx, ptr [bp - 0x12]
6:AF91  26ffb70802           push word ptr es:[bx + 0x208]
6:AF96  c45e06               les bx, ptr [bp + 6]
6:AF99  26ffb71401           push word ptr es:[bx + 0x114]
6:AF9E  666a00               push 0
6:AFA1  66ff76f2             push dword ptr [bp - 0xe]
6:AFA5  9ae4a03aae           lcall 0xae3a, 0xa0e4  ; sub_s2:A0E4
6:AFAA  6a2b                 push 0x2b
6:AFAC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:AFB1  9aba20c5af           lcall 0xafc5, 0x20ba  ; sub_s3:20BA
6:AFB6  6a0d                 push 0xd
6:AFB8  c45eee               les bx, ptr [bp - 0x12]
6:AFBB  6626ff7704           push dword ptr es:[bx + 4]
6:AFC0  52                   push dx
6:AFC1  50                   push ax
6:AFC2  9a3a04a6a6           lcall 0xa6a6, 0x43a  ; sub_s3:043A
6:AFC7  b80100               mov ax, 1
6:AFCA  c9                   leave
6:AFCB  ca0400               retf 4

; ---------------- SCStarve::clone@s6:AFCE size=212 callers=0
6:AFCE  c8200000             enter 0x20, 0
6:AFD2  57                   push di
6:AFD3  56                   push si
6:AFD4  681601               push 0x116
6:AFD7  9a9c17b4ae           lcall 0xaeb4, 0x179c  ; operator_new@s1:179C
6:AFDC  83c402               add sp, 2
6:AFDF  8946f8               mov word ptr [bp - 8], ax
6:AFE2  8956fa               mov word ptr [bp - 6], dx
6:AFE5  0bd0                 or dx, ax
6:AFE7  0f84a300             je 0xb08e
6:AFEB  c45ef8               les bx, ptr [bp - 8]
6:AFEE  26c7079a38           mov word ptr es:[bx], 0x389a
6:AFF3  26c747024baf         mov word ptr es:[bx + 2], 0xaf4b  ; SEGMENT s2:0000
6:AFF9  c45e06               les bx, ptr [bp + 6]
6:AFFC  66268b4704           mov eax, dword ptr es:[bx + 4]
6:B001  c45ef8               les bx, ptr [bp - 8]
6:B004  6626894704           mov dword ptr es:[bx + 4], eax
6:B009  8b4606               mov ax, word ptr [bp + 6]
6:B00C  8b5608               mov dx, word ptr [bp + 8]
6:B00F  050800               add ax, 8
6:B012  1e                   push ds
6:B013  8d7f08               lea di, [bx + 8]
6:B016  8bf0                 mov si, ax
6:B018  8eda                 mov ds, dx
6:B01A  66b940000000         mov ecx, 0x40
6:B020  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:B023  1f                   pop ds
6:B024  c45ef8               les bx, ptr [bp - 8]
6:B027  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:B02C  26c7470281b0         mov word ptr es:[bx + 2], 0xb081  ; SEGMENT s6:0000
6:B032  c45e06               les bx, ptr [bp + 6]
6:B035  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:B03B  c45ef8               les bx, ptr [bp - 8]
6:B03E  662689870801         mov dword ptr es:[bx + 0x108], eax
6:B044  c45e06               les bx, ptr [bp + 6]
6:B047  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:B04D  c45ef8               les bx, ptr [bp - 8]
6:B050  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:B056  c45e06               les bx, ptr [bp + 6]
6:B059  66268b871001         mov eax, dword ptr es:[bx + 0x110]
6:B05F  c45ef8               les bx, ptr [bp - 8]
6:B062  662689871001         mov dword ptr es:[bx + 0x110], eax
6:B068  c45e06               les bx, ptr [bp + 6]
6:B06B  268b871401           mov ax, word ptr es:[bx + 0x114]
6:B070  c45ef8               les bx, ptr [bp - 8]
6:B073  2689871401           mov word ptr es:[bx + 0x114], ax
6:B078  26c707ceb0           mov word ptr es:[bx], 0xb0ce
6:B07D  26c74702a6ae         mov word ptr es:[bx + 2], 0xaea6  ; SEGMENT s6:0000
6:B083  668b46f8             mov eax, dword ptr [bp - 8]
6:B087  668946fc             mov dword ptr [bp - 4], eax
6:B08B  eb09                 jmp 0xb096
6:B08D  db 90
loc_B08E:
6:B08E  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_B096:
6:B096  8b46fc               mov ax, word ptr [bp - 4]
6:B099  8b56fe               mov dx, word ptr [bp - 2]
6:B09C  5e                   pop si
6:B09D  5f                   pop di
6:B09E  c9                   leave
6:B09F  ca0400               retf 4

; ---------------- SCStarve::dtor@s6:B0A2 size=60 callers=0
6:B0A2  c80c0000             enter 0xc, 0
6:B0A6  c45e06               les bx, ptr [bp + 6]
6:B0A9  26c7079a38           mov word ptr es:[bx], 0x389a
6:B0AE  26c74702f7af         mov word ptr es:[bx + 2], 0xaff7  ; SEGMENT s2:0000
6:B0B4  f6460a01             test byte ptr [bp + 0xa], 1
6:B0B8  7409                 je 0xb0c3
6:B0BA  66ff7606             push dword ptr [bp + 6]
6:B0BE  9ace17daaf           lcall 0xafda, 0x17ce  ; operator_delete@s1:17CE
loc_B0C3:
6:B0C3  8b4606               mov ax, word ptr [bp + 6]
6:B0C6  8b5608               mov dx, word ptr [bp + 8]
6:B0C9  c9                   leave
6:B0CA  ca0600               retf 6
6:B0CD  db 00 a2 b0 d4 b0 c0 ae d8 b0 08 af dc b0 ce af 30
6:B0DD  db b0

; ---------------- sub_s6:B0DE FAR size=42 callers=1
6:B0DE  55                   push bp
6:B0DF  8bec                 mov bp, sp
6:B0E1  66ff760e             push dword ptr [bp + 0xe]
6:B0E5  66ff760a             push dword ptr [bp + 0xa]
6:B0E9  66ff7606             push dword ptr [bp + 6]
6:B0ED  90                   nop
6:B0EE  0e                   push cs
6:B0EF  e800ba               call 0x6af2  ; sub_s6:6AF2
6:B0F2  c45e06               les bx, ptr [bp + 6]
6:B0F5  26c707f4b1           mov word ptr es:[bx], 0xb1f4
6:B0FA  26c74702d0b0         mov word ptr es:[bx + 2], 0xb0d0  ; SEGMENT s6:0000
6:B100  8bc3                 mov ax, bx
6:B102  8cc2                 mov dx, es
6:B104  c9                   leave
6:B105  ca0c00               retf 0xc

; ---------------- sub_s6:B108 size=192 callers=0
6:B108  c8280000             enter 0x28, 0
6:B10C  57                   push di
6:B10D  56                   push si
6:B10E  681001               push 0x110  ; 'New failed in Op::Op->Simulator'
6:B111  9a9c17c1b0           lcall 0xb0c1, 0x179c  ; operator_new@s1:179C
6:B116  83c402               add sp, 2
6:B119  8946f8               mov word ptr [bp - 8], ax
6:B11C  8956fa               mov word ptr [bp - 6], dx
6:B11F  0bd0                 or dx, ax
6:B121  0f848f00             je 0xb1b4
6:B125  c45ef8               les bx, ptr [bp - 8]
6:B128  26c7079a38           mov word ptr es:[bx], 0x389a
6:B12D  26c74702b2b0         mov word ptr es:[bx + 2], 0xb0b2  ; SEGMENT s2:0000
6:B133  c45e06               les bx, ptr [bp + 6]
6:B136  66268b4704           mov eax, dword ptr es:[bx + 4]
6:B13B  c45ef8               les bx, ptr [bp - 8]
6:B13E  6626894704           mov dword ptr es:[bx + 4], eax
6:B143  8b4606               mov ax, word ptr [bp + 6]
6:B146  8b5608               mov dx, word ptr [bp + 8]
6:B149  050800               add ax, 8
6:B14C  1e                   push ds
6:B14D  8d7f08               lea di, [bx + 8]
6:B150  8bf0                 mov si, ax
6:B152  8eda                 mov ds, dx
6:B154  66b940000000         mov ecx, 0x40
6:B15A  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:B15D  1f                   pop ds
6:B15E  c45ef8               les bx, ptr [bp - 8]
6:B161  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:B166  26c7470299b1         mov word ptr es:[bx + 2], 0xb199  ; SEGMENT s6:0000
6:B16C  c45e06               les bx, ptr [bp + 6]
6:B16F  66268b870801         mov eax, dword ptr es:[bx + 0x108]
6:B175  c45ef8               les bx, ptr [bp - 8]
6:B178  662689870801         mov dword ptr es:[bx + 0x108], eax
6:B17E  c45e06               les bx, ptr [bp + 6]
6:B181  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
6:B187  c45ef8               les bx, ptr [bp - 8]
6:B18A  662689870c01         mov dword ptr es:[bx + 0x10c], eax
6:B190  26c707506e           mov word ptr es:[bx], 0x6e50
6:B195  26c74702a7b1         mov word ptr es:[bx + 2], 0xb1a7  ; SEGMENT s6:0000
6:B19B  c45ef8               les bx, ptr [bp - 8]
6:B19E  26c707f4b1           mov word ptr es:[bx], 0xb1f4
6:B1A3  26c74702feb0         mov word ptr es:[bx + 2], 0xb0fe  ; SEGMENT s6:0000
6:B1A9  668b46f8             mov eax, dword ptr [bp - 8]
6:B1AD  668946fc             mov dword ptr [bp - 4], eax
6:B1B1  eb09                 jmp 0xb1bc
6:B1B3  db 90
loc_B1B4:
6:B1B4  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_B1BC:
6:B1BC  8b46fc               mov ax, word ptr [bp - 4]
6:B1BF  8b56fe               mov dx, word ptr [bp - 2]
6:B1C2  5e                   pop si
6:B1C3  5f                   pop di
6:B1C4  c9                   leave
6:B1C5  ca0400               retf 4

; ---------------- sub_s6:B1C8 size=60 callers=0
6:B1C8  c8100000             enter 0x10, 0
6:B1CC  c45e06               les bx, ptr [bp + 6]
6:B1CF  26c7079a38           mov word ptr es:[bx], 0x389a
6:B1D4  26c7470231b1         mov word ptr es:[bx + 2], 0xb131  ; SEGMENT s2:0000
6:B1DA  f6460a01             test byte ptr [bp + 0xa], 1
6:B1DE  7409                 je 0xb1e9
6:B1E0  66ff7606             push dword ptr [bp + 6]
6:B1E4  9ace1714b1           lcall 0xb114, 0x17ce  ; operator_delete@s1:17CE
loc_B1E9:
6:B1E9  8b4606               mov ax, word ptr [bp + 6]
6:B1EC  8b5608               mov dx, word ptr [bp + 8]
6:B1EF  c9                   leave
6:B1F0  ca0600               retf 6
6:B1F3  db 00 c8 b1 fa b1 2c 6b fe b1 28 d2 02 b2 08 b1 6a
6:B203  db b1

; ---------------- sub_s6:B204 FAR size=40 callers=1
6:B204  55                   push bp
6:B205  8bec                 mov bp, sp
6:B207  66ff7606             push dword ptr [bp + 6]
6:B20B  9a2816ffae           lcall 0xaeff, 0x1628  ; sub_s7:1628
6:B210  c45e06               les bx, ptr [bp + 6]
6:B213  26c7470c0000         mov word ptr es:[bx + 0xc], 0
6:B219  26c7073cb3           mov word ptr es:[bx], 0xb33c
6:B21E  26c74702f6b1         mov word ptr es:[bx + 2], 0xb1f6  ; SEGMENT s6:0000
6:B224  8bc3                 mov ax, bx
6:B226  8cc2                 mov dx, es
6:B228  c9                   leave
6:B229  ca0400               retf 4

; ---------------- sub_s6:B22C FAR size=52 callers=3
6:B22C  55                   push bp
6:B22D  8bec                 mov bp, sp
6:B22F  66ff760c             push dword ptr [bp + 0xc]
6:B233  666800000006         push 0x6000000
6:B239  66ff7606             push dword ptr [bp + 6]
6:B23D  9a5e160eb2           lcall 0xb20e, 0x165e  ; DbObj::DbObj(type,owner)@s7:165E
6:B242  8b460a               mov ax, word ptr [bp + 0xa]
6:B245  c45e06               les bx, ptr [bp + 6]
6:B248  2689470c             mov word ptr es:[bx + 0xc], ax
6:B24C  26c7073cb3           mov word ptr es:[bx], 0xb33c
6:B251  26c7470222b2         mov word ptr es:[bx + 2], 0xb222  ; SEGMENT s6:0000
6:B257  8bc3                 mov ax, bx
6:B259  8cc2                 mov dx, es
6:B25B  c9                   leave
6:B25C  ca0a00               retf 0xa
6:B25F  db 00

; ---------------- sub_s6:B260 FAR size=30 callers=3
6:B260  55                   push bp
6:B261  8bec                 mov bp, sp
6:B263  c45e06               les bx, ptr [bp + 6]
6:B266  26c7073cb3           mov word ptr es:[bx], 0xb33c
6:B26B  26c7470255b2         mov word ptr es:[bx + 2], 0xb255  ; SEGMENT s6:0000
6:B271  66ff7606             push dword ptr [bp + 6]
6:B275  9ab21640b2           lcall 0xb240, 0x16b2  ; sub_s7:16B2
6:B27A  c9                   leave
6:B27B  ca0400               retf 4

; ---------------- sub_s6:B27E FAR size=4 callers=0
6:B27E  ca0800               retf 8
6:B281  db 00

; ---------------- sub_s6:B282 FAR size=70 callers=0
6:B282  c80a0000             enter 0xa, 0
6:B286  66ff760a             push dword ptr [bp + 0xa]
6:B28A  66ff7606             push dword ptr [bp + 6]
6:B28E  9ad61678b2           lcall 0xb278, 0x16d6  ; sub_s7:16D6
6:B293  0bc0                 or ax, ax
6:B295  742c                 je 0xb2c3
6:B297  c45e06               les bx, ptr [bp + 6]
6:B29A  268b470c             mov ax, word ptr es:[bx + 0xc]
6:B29E  8946f6               mov word ptr [bp - 0xa], ax
6:B2A1  666a02               push 2
6:B2A4  8d46f6               lea ax, [bp - 0xa]
6:B2A7  16                   push ss
6:B2A8  50                   push ax
6:B2A9  66ff760a             push dword ptr [bp + 0xa]
6:B2AD  9a1c7ed8b1           lcall 0xb1d8, 0x7e1c  ; File_write@s2:7E1C
6:B2B2  0bc0                 or ax, ax
6:B2B4  750a                 jne 0xb2c0
6:B2B6  c7061003d006         mov word ptr [0x310], 0x6d0
6:B2BC  c9                   leave
6:B2BD  ca0800               retf 8
loc_B2C0:
6:B2C0  b80100               mov ax, 1
loc_B2C3:
6:B2C3  c9                   leave
6:B2C4  ca0800               retf 8
6:B2C7  db 00

; ---------------- sub_s6:B2C8 FAR size=78 callers=0
6:B2C8  c8100000             enter 0x10, 0
6:B2CC  66ff760a             push dword ptr [bp + 0xa]
6:B2D0  66ff7606             push dword ptr [bp + 6]
6:B2D4  9a301791b2           lcall 0xb291, 0x1730  ; sub_s7:1730
6:B2D9  0bc0                 or ax, ax
6:B2DB  7435                 je 0xb312
6:B2DD  666a02               push 2
6:B2E0  8d46fe               lea ax, [bp - 2]
6:B2E3  16                   push ss
6:B2E4  50                   push ax
6:B2E5  66ff760a             push dword ptr [bp + 0xa]
6:B2E9  9aee7d06b3           lcall 0xb306, 0x7dee  ; File_read@s2:7DEE
6:B2EE  0bc0                 or ax, ax
6:B2F0  750a                 jne 0xb2fc
6:B2F2  c7061003d206         mov word ptr [0x310], 0x6d2
6:B2F8  c9                   leave
6:B2F9  ca0800               retf 8
loc_B2FC:
6:B2FC  ff76fe               push word ptr [bp - 2]
6:B2FF  66ff760a             push dword ptr [bp + 0xa]
6:B303  9abc72b0b2           lcall 0xb2b0, 0x72bc  ; sub_s2:72BC
6:B308  c45e06               les bx, ptr [bp + 6]
6:B30B  2689470c             mov word ptr es:[bx + 0xc], ax
6:B30F  b80100               mov ax, 1
loc_B312:
6:B312  c9                   leave
6:B313  ca0800               retf 8

; ---------------- sub_s6:B316 FAR size=62 callers=0
6:B316  55                   push bp
6:B317  8bec                 mov bp, sp
6:B319  66ff7606             push dword ptr [bp + 6]
6:B31D  90                   nop
6:B31E  0e                   push cs
6:B31F  e83eff               call 0xb260  ; sub_s6:B260
6:B322  f6460a01             test byte ptr [bp + 0xa], 1
6:B326  7409                 je 0xb331
6:B328  66ff7606             push dword ptr [bp + 6]
6:B32C  9ace17e7b1           lcall 0xb1e7, 0x17ce  ; operator_delete@s1:17CE
loc_B331:
6:B331  8b4606               mov ax, word ptr [bp + 6]
6:B334  8b5608               mov dx, word ptr [bp + 8]
6:B337  c9                   leave
6:B338  ca0600               retf 6
6:B33B  db 90 16 b3 4a b3 7a 17 46 b3 8e 17 d7 b2 82 b2 4e
6:B34B  db b3 c8 b2 52 b3 7e b2 6f b2

; ---------------- Building::Building()@s6:B354 FAR size=74 callers=43
6:B354  55                   push bp
6:B355  8bec                 mov bp, sp
6:B357  66ff7606             push dword ptr [bp + 6]
6:B35B  9a281642b3           lcall 0xb342, 0x1628  ; sub_s7:1628
6:B360  6633c0               xor eax, eax
6:B363  c45e06               les bx, ptr [bp + 6]
6:B366  2689470c             mov word ptr es:[bx + 0xc], ax
6:B36A  2689470e             mov word ptr es:[bx + 0xe], ax
6:B36E  26894710             mov word ptr es:[bx + 0x10], ax
6:B372  26894712             mov word ptr es:[bx + 0x12], ax
6:B376  26894718             mov word ptr es:[bx + 0x18], ax
6:B37A  2689471a             mov word ptr es:[bx + 0x1a], ax
6:B37E  662689471c           mov dword ptr es:[bx + 0x1c], eax
6:B383  26c7076acf           mov word ptr es:[bx], 0xcf6a
6:B388  26c747023eb3         mov word ptr es:[bx + 2], 0xb33e  ; SEGMENT s6:0000
6:B38E  26894716             mov word ptr es:[bx + 0x16], ax
6:B392  26894714             mov word ptr es:[bx + 0x14], ax
6:B396  8bc3                 mov ax, bx
6:B398  8cc2                 mov dx, es
6:B39A  c9                   leave
6:B39B  ca0400               retf 4

; ---------------- Building::Building(type,owner)@s6:B39E FAR size=122 callers=43
6:B39E  55                   push bp
6:B39F  8bec                 mov bp, sp
6:B3A1  66ff760c             push dword ptr [bp + 0xc]
6:B3A5  666800000007         push 0x7000000
6:B3AB  66ff7606             push dword ptr [bp + 6]
6:B3AF  9a5e165eb3           lcall 0xb35e, 0x165e  ; DbObj::DbObj(type,owner)@s7:165E
6:B3B4  8b460a               mov ax, word ptr [bp + 0xa]
6:B3B7  c45e06               les bx, ptr [bp + 6]
6:B3BA  2689470c             mov word ptr es:[bx + 0xc], ax
6:B3BE  26c7470e4200         mov word ptr es:[bx + 0xe], 0x42
6:B3C4  6633c0               xor eax, eax
6:B3C7  26894710             mov word ptr es:[bx + 0x10], ax
6:B3CB  26894712             mov word ptr es:[bx + 0x12], ax
6:B3CF  26894718             mov word ptr es:[bx + 0x18], ax
6:B3D3  2689471a             mov word ptr es:[bx + 0x1a], ax
6:B3D7  662689471c           mov dword ptr es:[bx + 0x1c], eax
6:B3DC  26c7076acf           mov word ptr es:[bx], 0xcf6a
6:B3E1  26c747028cb3         mov word ptr es:[bx + 2], 0xb38c  ; SEGMENT s6:0000
6:B3E7  06                   push es
6:B3E8  53                   push bx
6:B3E9  90                   nop
6:B3EA  0e                   push cs
6:B3EB  e8880b               call 0xbf76  ; sub_s6:BF76
6:B3EE  c45e06               les bx, ptr [bp + 6]
6:B3F1  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
6:B3FA  26837f0c4f           cmp word ptr es:[bx + 0xc], 0x4f
6:B3FF  7c0d                 jl 0xb40e
6:B401  26837f0c6f           cmp word ptr es:[bx + 0xc], 0x6f
6:B406  7f06                 jg 0xb40e
6:B408  26c7470e6b00         mov word ptr es:[bx + 0xe], 0x6b
loc_B40E:
6:B40E  8b4606               mov ax, word ptr [bp + 6]
6:B411  8b5608               mov dx, word ptr [bp + 8]
6:B414  c9                   leave
6:B415  ca0a00               retf 0xa

; ---------------- sub_s6:B418 FAR size=86 callers=47
6:B418  c8080000             enter 8, 0
6:B41C  c45e06               les bx, ptr [bp + 6]
6:B41F  26c7076acf           mov word ptr es:[bx], 0xcf6a
6:B424  26c74702e5b3         mov word ptr es:[bx + 2], 0xb3e5  ; SEGMENT s6:0000
6:B42A  268b4712             mov ax, word ptr es:[bx + 0x12]
6:B42E  eb26                 jmp 0xb456
loc_B430:
6:B430  c45e06               les bx, ptr [bp + 6]
6:B433  66268b4f14           mov ecx, dword ptr es:[bx + 0x14]
6:B438  6651                 push ecx
6:B43A  9ace172fb3           lcall 0xb32f, 0x17ce  ; operator_delete@s1:17CE
6:B43F  83c404               add sp, 4
6:B442  eb1d                 jmp 0xb461
loc_B444:
6:B444  c45e06               les bx, ptr [bp + 6]
6:B447  268b4718             mov ax, word ptr es:[bx + 0x18]
6:B44B  2d0400               sub ax, 4
6:B44E  74e0                 je 0xb430
6:B450  48                   dec ax
6:B451  74dd                 je 0xb430
6:B453  eb0c                 jmp 0xb461
6:B455  db 90
loc_B456:
6:B456  2d0400               sub ax, 4
6:B459  74d5                 je 0xb430
6:B45B  48                   dec ax
6:B45C  74d2                 je 0xb430
6:B45E  48                   dec ax
6:B45F  74e3                 je 0xb444
loc_B461:
6:B461  66ff7606             push dword ptr [bp + 6]
6:B465  9ab216b2b3           lcall 0xb3b2, 0x16b2  ; sub_s7:16B2
6:B46A  c9                   leave
6:B46B  ca0400               retf 4

; ---------------- sub_s6:B46E FAR size=120 callers=8
6:B46E  c80e0000             enter 0xe, 0
6:B472  66ff7606             push dword ptr [bp + 6]
6:B476  90                   nop
6:B477  0e                   push cs
6:B478  e87700               call 0xb4f2  ; sub_s6:B4F2
6:B47B  8946fc               mov word ptr [bp - 4], ax
6:B47E  8956fe               mov word ptr [bp - 2], dx
6:B481  666a00               push 0
6:B484  66ff7606             push dword ptr [bp + 6]
6:B488  90                   nop
6:B489  0e                   push cs
6:B48A  e80101               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:B48D  8946f8               mov word ptr [bp - 8], ax
6:B490  8956fa               mov word ptr [bp - 6], dx
6:B493  52                   push dx
6:B494  50                   push ax
6:B495  9a806dafb4           lcall 0xb4af, 0x6d80  ; sub_s7:6D80
6:B49A  c45ef8               les bx, ptr [bp - 8]
6:B49D  268b4732             mov ax, word ptr es:[bx + 0x32]
6:B4A1  8946f6               mov word ptr [bp - 0xa], ax
6:B4A4  0bc0                 or ax, ax
6:B4A6  741b                 je 0xb4c3
6:B4A8  6a00                 push 0
6:B4AA  06                   push es
6:B4AB  53                   push bx
6:B4AC  9a4c6ccab4           lcall 0xb4ca, 0x6c4c  ; sub_s7:6C4C
6:B4B1  66ff76f8             push dword ptr [bp - 8]
6:B4B5  ff76f6               push word ptr [bp - 0xa]
6:B4B8  6a00                 push 0
6:B4BA  66ff76fc             push dword ptr [bp - 4]
6:B4BE  9a7e383ead           lcall 0xad3e, 0x387e  ; sub_s8:387E
loc_B4C3:
6:B4C3  66ff76f8             push dword ptr [bp - 8]
6:B4C7  9a967268b4           lcall 0xb468, 0x7296  ; sub_s7:7296
6:B4CC  c45e0a               les bx, ptr [bp + 0xa]
6:B4CF  66268b870002         mov eax, dword ptr es:[bx + 0x200]
6:B4D5  268b970202           mov dx, word ptr es:[bx + 0x202]
6:B4DA  c45e06               les bx, ptr [bp + 6]
6:B4DD  662689471c           mov dword ptr es:[bx + 0x1c], eax
6:B4E2  c9                   leave
6:B4E3  ca0800               retf 8

; ---------------- sub_s6:B4E6 FAR size=6 callers=0
6:B4E6  33c0                 xor ax, ax
6:B4E8  ca0400               retf 4
6:B4EB  db 00

; ---------------- sub_s6:B4EC FAR size=6 callers=0
6:B4EC  33c0                 xor ax, ax
6:B4EE  ca0400               retf 4
6:B4F1  db 00

; ---------------- sub_s6:B4F2 FAR size=34 callers=22
6:B4F2  c80c0000             enter 0xc, 0
6:B4F6  66ff7606             push dword ptr [bp + 6]
6:B4FA  90                   nop
6:B4FB  0e                   push cs
6:B4FC  e88f00               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:B4FF  8946fc               mov word ptr [bp - 4], ax
6:B502  8956fe               mov word ptr [bp - 2], dx
6:B505  c45efc               les bx, ptr [bp - 4]
6:B508  268b472e             mov ax, word ptr es:[bx + 0x2e]
6:B50C  268b5730             mov dx, word ptr es:[bx + 0x30]
6:B510  c9                   leave
6:B511  ca0400               retf 4

; ---------------- sub_s6:B514 FAR size=122 callers=5
6:B514  c80c0000             enter 0xc, 0
6:B518  c45e06               les bx, ptr [bp + 6]
6:B51B  268b4712             mov ax, word ptr es:[bx + 0x12]
6:B51F  eb25                 jmp 0xb546
6:B521  db 90
loc_B522:
6:B522  66268b4f14           mov ecx, dword ptr es:[bx + 0x14]
6:B527  6651                 push ecx
6:B529  9ace173db4           lcall 0xb43d, 0x17ce  ; operator_delete@s1:17CE
6:B52E  83c404               add sp, 4
6:B531  eb1e                 jmp 0xb551
6:B533  db 90
loc_B534:
6:B534  c45e06               les bx, ptr [bp + 6]
6:B537  268b4718             mov ax, word ptr es:[bx + 0x18]
6:B53B  2d0400               sub ax, 4
6:B53E  74e2                 je 0xb522
6:B540  48                   dec ax
6:B541  74df                 je 0xb522
6:B543  eb0c                 jmp 0xb551
6:B545  db 90
loc_B546:
6:B546  2d0400               sub ax, 4
6:B549  74d7                 je 0xb522
6:B54B  48                   dec ax
6:B54C  74d4                 je 0xb522
6:B54E  48                   dec ax
6:B54F  74e3                 je 0xb534
loc_B551:
6:B551  c45e06               les bx, ptr [bp + 6]
6:B554  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
6:B55D  26c747120700         mov word ptr es:[bx + 0x12], 7
6:B563  06                   push es
6:B564  53                   push bx
6:B565  90                   nop
6:B566  0e                   push cs
6:B567  e82400               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:B56A  8946fc               mov word ptr [bp - 4], ax
6:B56D  8956fe               mov word ptr [bp - 2], dx
6:B570  52                   push dx
6:B571  50                   push ax
6:B572  9a96727eb5           lcall 0xb57e, 0x7296  ; sub_s7:7296
6:B577  66ff76fc             push dword ptr [bp - 4]
6:B57B  9ad07287b5           lcall 0xb587, 0x72d0  ; sub_s7:72D0
6:B580  66ff76fc             push dword ptr [bp - 4]
6:B584  9a0a7398b4           lcall 0xb498, 0x730a  ; sub_s7:730A
6:B589  c9                   leave
6:B58A  ca0400               retf 4
6:B58D  db 00

; ---------------- DbObj::getOwner@s6:B58E FAR size=26 callers=106
6:B58E  55                   push bp
6:B58F  8bec                 mov bp, sp
6:B591  c45e06               les bx, ptr [bp + 6]
6:B594  6626ff7708           push dword ptr es:[bx + 8]
6:B599  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:B59E  90                   nop
6:B59F  0e                   push cs
6:B5A0  e8492c               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:B5A3  c9                   leave
6:B5A4  ca0400               retf 4
6:B5A7  db 00

; ---------------- sub_s6:B5A8 FAR size=34 callers=0
6:B5A8  55                   push bp
6:B5A9  8bec                 mov bp, sp
6:B5AB  c45e06               les bx, ptr [bp + 6]
6:B5AE  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:B5B3  7407                 je 0xb5bc
6:B5B5  33c0                 xor ax, ax
6:B5B7  c9                   leave
6:B5B8  ca0400               retf 4
6:B5BB  db 90
loc_B5BC:
6:B5BC  26c45f14             les bx, ptr es:[bx + 0x14]
6:B5C0  268b879400           mov ax, word ptr es:[bx + 0x94]
6:B5C5  c9                   leave
6:B5C6  ca0400               retf 4
6:B5C9  db 00

; ---------------- sub_s6:B5CA FAR size=34 callers=0
6:B5CA  55                   push bp
6:B5CB  8bec                 mov bp, sp
6:B5CD  c45e06               les bx, ptr [bp + 6]
6:B5D0  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:B5D5  7407                 je 0xb5de
6:B5D7  33c0                 xor ax, ax
6:B5D9  c9                   leave
6:B5DA  ca0400               retf 4
6:B5DD  db 90
loc_B5DE:
6:B5DE  26c45f14             les bx, ptr es:[bx + 0x14]
6:B5E2  268b879c00           mov ax, word ptr es:[bx + 0x9c]
6:B5E7  c9                   leave
6:B5E8  ca0400               retf 4
6:B5EB  db 00

; ---------------- sub_s6:B5EC FAR size=558 callers=12
6:B5EC  c82c0000             enter 0x2c, 0
6:B5F0  c45e06               les bx, ptr [bp + 6]
6:B5F3  268b470c             mov ax, word ptr es:[bx + 0xc]
6:B5F7  8946f4               mov word ptr [bp - 0xc], ax
6:B5FA  666a02               push 2
6:B5FD  8d46f4               lea ax, [bp - 0xc]
6:B600  16                   push ss
6:B601  50                   push ax
6:B602  66ff760a             push dword ptr [bp + 0xa]
6:B606  9a1c7e46b6           lcall 0xb646, 0x7e1c  ; File_write@s2:7E1C
6:B60B  0bc0                 or ax, ax
6:B60D  750d                 jne 0xb61c
loc_B60F:
6:B60F  c7061003d006         mov word ptr [0x310], 0x6d0
loc_B615:
6:B615  33c0                 xor ax, ax
6:B617  c9                   leave
6:B618  ca0800               retf 8
6:B61B  db 90
loc_B61C:
6:B61C  66ff760a             push dword ptr [bp + 0xa]
6:B620  66ff7606             push dword ptr [bp + 6]
6:B624  9ad61675b5           lcall 0xb575, 0x16d6  ; sub_s7:16D6
6:B629  0bc0                 or ax, ax
6:B62B  74e8                 je 0xb615
6:B62D  c45e06               les bx, ptr [bp + 6]
6:B630  268b470c             mov ax, word ptr es:[bx + 0xc]
6:B634  8946fa               mov word ptr [bp - 6], ax
6:B637  666a02               push 2
6:B63A  8d46fa               lea ax, [bp - 6]
6:B63D  16                   push ss
6:B63E  50                   push ax
6:B63F  66ff760a             push dword ptr [bp + 0xa]
6:B643  9a1c7e65b6           lcall 0xb665, 0x7e1c  ; File_write@s2:7E1C
6:B648  0bc0                 or ax, ax
6:B64A  74c3                 je 0xb60f
6:B64C  c45e06               les bx, ptr [bp + 6]
6:B64F  268b470e             mov ax, word ptr es:[bx + 0xe]
6:B653  8946fa               mov word ptr [bp - 6], ax
6:B656  666a02               push 2
6:B659  8d46fa               lea ax, [bp - 6]
6:B65C  16                   push ss
6:B65D  50                   push ax
6:B65E  66ff760a             push dword ptr [bp + 0xa]
6:B662  9a1c7e84b6           lcall 0xb684, 0x7e1c  ; File_write@s2:7E1C
6:B667  0bc0                 or ax, ax
6:B669  74a4                 je 0xb60f
6:B66B  c45e06               les bx, ptr [bp + 6]
6:B66E  268b4710             mov ax, word ptr es:[bx + 0x10]
6:B672  8946fa               mov word ptr [bp - 6], ax
6:B675  666a02               push 2
6:B678  8d46fa               lea ax, [bp - 6]
6:B67B  16                   push ss
6:B67C  50                   push ax
6:B67D  66ff760a             push dword ptr [bp + 0xa]
6:B681  9a1c7ea3b6           lcall 0xb6a3, 0x7e1c  ; File_write@s2:7E1C
6:B686  0bc0                 or ax, ax
6:B688  7485                 je 0xb60f
6:B68A  c45e06               les bx, ptr [bp + 6]
6:B68D  268b4712             mov ax, word ptr es:[bx + 0x12]
6:B691  8946fa               mov word ptr [bp - 6], ax
6:B694  666a02               push 2
6:B697  8d46fa               lea ax, [bp - 6]
6:B69A  16                   push ss
6:B69B  50                   push ax
6:B69C  66ff760a             push dword ptr [bp + 0xa]
6:B6A0  9a1c7ec4b6           lcall 0xb6c4, 0x7e1c  ; File_write@s2:7E1C
6:B6A5  0bc0                 or ax, ax
6:B6A7  0f8464ff             je 0xb60f
6:B6AB  c45e06               les bx, ptr [bp + 6]
6:B6AE  268b4718             mov ax, word ptr es:[bx + 0x18]
6:B6B2  8946fa               mov word ptr [bp - 6], ax
6:B6B5  666a02               push 2
6:B6B8  8d46fa               lea ax, [bp - 6]
6:B6BB  16                   push ss
6:B6BC  50                   push ax
6:B6BD  66ff760a             push dword ptr [bp + 0xa]
6:B6C1  9a1c7ee5b6           lcall 0xb6e5, 0x7e1c  ; File_write@s2:7E1C
6:B6C6  0bc0                 or ax, ax
6:B6C8  0f8443ff             je 0xb60f
6:B6CC  c45e06               les bx, ptr [bp + 6]
6:B6CF  268b471a             mov ax, word ptr es:[bx + 0x1a]
6:B6D3  8946fa               mov word ptr [bp - 6], ax
6:B6D6  666a02               push 2
6:B6D9  8d46fa               lea ax, [bp - 6]
6:B6DC  16                   push ss
6:B6DD  50                   push ax
6:B6DE  66ff760a             push dword ptr [bp + 0xa]
6:B6E2  9a1c7e43b7           lcall 0xb743, 0x7e1c  ; File_write@s2:7E1C
6:B6E7  0bc0                 or ax, ax
6:B6E9  0f8422ff             je 0xb60f
6:B6ED  c45e06               les bx, ptr [bp + 6]
6:B6F0  268b4712             mov ax, word ptr es:[bx + 0x12]
6:B6F4  8946fe               mov word ptr [bp - 2], ax
6:B6F7  3d0600               cmp ax, 6
6:B6FA  7507                 jne 0xb703
6:B6FC  268b4718             mov ax, word ptr es:[bx + 0x18]
6:B700  8946fe               mov word ptr [bp - 2], ax
loc_B703:
6:B703  48                   dec ax
6:B704  0f8c0a01             jl 0xb812
6:B708  0f800601             jo 0xb812
6:B70C  48                   dec ax
6:B70D  48                   dec ax
6:B70E  7e0a                 jle 0xb71a
6:B710  48                   dec ax
6:B711  740d                 je 0xb720
6:B713  48                   dec ax
6:B714  7458                 je 0xb76e
6:B716  e9f900               jmp 0xb812
6:B719  db 90
loc_B71A:
6:B71A  268b4714             mov ax, word ptr es:[bx + 0x14]
6:B71E  eb11                 jmp 0xb731
loc_B720:
6:B720  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
6:B726  7426                 je 0xb74e
6:B728  26c45f14             les bx, ptr es:[bx + 0x14]
6:B72C  268b879400           mov ax, word ptr es:[bx + 0x94]
loc_B731:
6:B731  8946fa               mov word ptr [bp - 6], ax
6:B734  666a02               push 2
6:B737  8d46fa               lea ax, [bp - 6]
6:B73A  16                   push ss
6:B73B  50                   push ax
6:B73C  66ff760a             push dword ptr [bp + 0xa]
6:B740  9a1c7e62b7           lcall 0xb762, 0x7e1c  ; File_write@s2:7E1C
6:B745  0bc0                 or ax, ax
6:B747  0f85c700             jne 0xb812
6:B74B  e9c1fe               jmp 0xb60f
loc_B74E:
6:B74E  c746fa0000           mov word ptr [bp - 6], 0
6:B753  666a02               push 2
6:B756  8d46fa               lea ax, [bp - 6]
6:B759  16                   push ss
6:B75A  50                   push ax
6:B75B  66ff760a             push dword ptr [bp + 0xa]
6:B75F  9a1c7e89b7           lcall 0xb789, 0x7e1c  ; File_write@s2:7E1C
6:B764  0bc0                 or ax, ax
6:B766  0f84a5fe             je 0xb60f
6:B76A  e9a500               jmp 0xb812
6:B76D  db 90
loc_B76E:
6:B76E  26c45f14             les bx, ptr es:[bx + 0x14]
6:B772  268b87a400           mov ax, word ptr es:[bx + 0xa4]
6:B777  8946fa               mov word ptr [bp - 6], ax
6:B77A  666a02               push 2
6:B77D  8d46fa               lea ax, [bp - 6]
6:B780  16                   push ss
6:B781  50                   push ax
6:B782  66ff760a             push dword ptr [bp + 0xa]
6:B786  9a1c7eafb7           lcall 0xb7af, 0x7e1c  ; File_write@s2:7E1C
6:B78B  0bc0                 or ax, ax
6:B78D  0f847efe             je 0xb60f
6:B791  c45e06               les bx, ptr [bp + 6]
6:B794  26c45f14             les bx, ptr es:[bx + 0x14]
6:B798  268b87a600           mov ax, word ptr es:[bx + 0xa6]
6:B79D  8946fa               mov word ptr [bp - 6], ax
6:B7A0  666a02               push 2
6:B7A3  8d46fa               lea ax, [bp - 6]
6:B7A6  16                   push ss
6:B7A7  50                   push ax
6:B7A8  66ff760a             push dword ptr [bp + 0xa]
6:B7AC  9a1c7ed5b7           lcall 0xb7d5, 0x7e1c  ; File_write@s2:7E1C
6:B7B1  0bc0                 or ax, ax
6:B7B3  0f8458fe             je 0xb60f
6:B7B7  c45e06               les bx, ptr [bp + 6]
6:B7BA  26c45f14             les bx, ptr es:[bx + 0x14]
6:B7BE  268b87a800           mov ax, word ptr es:[bx + 0xa8]
6:B7C3  8946fa               mov word ptr [bp - 6], ax
6:B7C6  666a02               push 2
6:B7C9  8d46fa               lea ax, [bp - 6]
6:B7CC  16                   push ss
6:B7CD  50                   push ax
6:B7CE  66ff760a             push dword ptr [bp + 0xa]
6:B7D2  9a1c7efbb7           lcall 0xb7fb, 0x7e1c  ; File_write@s2:7E1C
6:B7D7  0bc0                 or ax, ax
6:B7D9  0f8432fe             je 0xb60f
6:B7DD  c45e06               les bx, ptr [bp + 6]
6:B7E0  26c45f14             les bx, ptr es:[bx + 0x14]
6:B7E4  268b87aa00           mov ax, word ptr es:[bx + 0xaa]
6:B7E9  8946fa               mov word ptr [bp - 6], ax
6:B7EC  666a02               push 2
6:B7EF  8d46fa               lea ax, [bp - 6]
6:B7F2  16                   push ss
6:B7F3  50                   push ax
6:B7F4  66ff760a             push dword ptr [bp + 0xa]
6:B7F8  9a1c7eecb2           lcall 0xb2ec, 0x7e1c  ; File_write@s2:7E1C
6:B7FD  0bc0                 or ax, ax
6:B7FF  0f840cfe             je 0xb60f
6:B803  c45e06               les bx, ptr [bp + 6]
6:B806  26c45f14             les bx, ptr es:[bx + 0x14]
6:B80A  268b87ac00           mov ax, word ptr es:[bx + 0xac]
6:B80F  e91fff               jmp 0xb731
loc_B812:
6:B812  b80100               mov ax, 1
6:B815  c9                   leave
6:B816  ca0800               retf 8
6:B819  db 00

; ---------------- sub_s6:B81A FAR size=668 callers=12
6:B81A  c8380000             enter 0x38, 0
6:B81E  66ff760a             push dword ptr [bp + 0xa]
6:B822  66ff7606             push dword ptr [bp + 6]
6:B826  9a301727b6           lcall 0xb627, 0x1730  ; sub_s7:1730
6:B82B  0bc0                 or ax, ax
6:B82D  7507                 jne 0xb836
loc_B82F:
6:B82F  33c0                 xor ax, ax
6:B831  c9                   leave
6:B832  ca0800               retf 8
6:B835  db 90
loc_B836:
6:B836  666a02               push 2
6:B839  8d46fe               lea ax, [bp - 2]
6:B83C  16                   push ss
6:B83D  50                   push ax
6:B83E  66ff760a             push dword ptr [bp + 0xa]
6:B842  9aee7d5ab8           lcall 0xb85a, 0x7dee  ; File_read@s2:7DEE
6:B847  0bc0                 or ax, ax
6:B849  742a                 je 0xb875
6:B84B  666a02               push 2
6:B84E  8d46fc               lea ax, [bp - 4]
6:B851  16                   push ss
6:B852  50                   push ax
6:B853  66ff760a             push dword ptr [bp + 0xa]
6:B857  9aee7d6fb8           lcall 0xb86f, 0x7dee  ; File_read@s2:7DEE
6:B85C  0bc0                 or ax, ax
6:B85E  7415                 je 0xb875
6:B860  666a02               push 2
6:B863  8d46fa               lea ax, [bp - 6]
6:B866  16                   push ss
6:B867  50                   push ax
6:B868  66ff760a             push dword ptr [bp + 0xa]
6:B86C  9aee7d88b8           lcall 0xb888, 0x7dee  ; File_read@s2:7DEE
6:B871  0bc0                 or ax, ax
6:B873  7509                 jne 0xb87e
loc_B875:
6:B875  c7061003d206         mov word ptr [0x310], 0x6d2
6:B87B  ebb2                 jmp 0xb82f
6:B87D  db 90
loc_B87E:
6:B87E  ff76fe               push word ptr [bp - 2]
6:B881  66ff760a             push dword ptr [bp + 0xa]
6:B885  9aea739bb8           lcall 0xb89b, 0x73ea  ; sub_s2:73EA
6:B88A  c45e06               les bx, ptr [bp + 6]
6:B88D  2689470c             mov word ptr es:[bx + 0xc], ax
6:B891  ff76fc               push word ptr [bp - 4]
6:B894  66ff760a             push dword ptr [bp + 0xa]
6:B898  9aea73aeb8           lcall 0xb8ae, 0x73ea  ; sub_s2:73EA
6:B89D  c45e06               les bx, ptr [bp + 6]
6:B8A0  2689470e             mov word ptr es:[bx + 0xe], ax
6:B8A4  ff76fa               push word ptr [bp - 6]
6:B8A7  66ff760a             push dword ptr [bp + 0xa]
6:B8AB  9aea73c6b8           lcall 0xb8c6, 0x73ea  ; sub_s2:73EA
6:B8B0  c45e06               les bx, ptr [bp + 6]
6:B8B3  26894710             mov word ptr es:[bx + 0x10], ax
6:B8B7  666a02               push 2
6:B8BA  8d46fe               lea ax, [bp - 2]
6:B8BD  16                   push ss
6:B8BE  50                   push ax
6:B8BF  66ff760a             push dword ptr [bp + 0xa]
6:B8C3  9aee7ddbb8           lcall 0xb8db, 0x7dee  ; File_read@s2:7DEE
6:B8C8  0bc0                 or ax, ax
6:B8CA  74a9                 je 0xb875
6:B8CC  666a02               push 2
6:B8CF  8d46fc               lea ax, [bp - 4]
6:B8D2  16                   push ss
6:B8D3  50                   push ax
6:B8D4  66ff760a             push dword ptr [bp + 0xa]
6:B8D8  9aee7df4b8           lcall 0xb8f4, 0x7dee  ; File_read@s2:7DEE
6:B8DD  0bc0                 or ax, ax
6:B8DF  7494                 je 0xb875
6:B8E1  666a02               push 2
6:B8E4  668b4606             mov eax, dword ptr [bp + 6]
6:B8E8  051a00               add ax, 0x1a
6:B8EB  6650                 push eax
6:B8ED  66ff760a             push dword ptr [bp + 0xa]
6:B8F1  9aee7d71b9           lcall 0xb971, 0x7dee  ; File_read@s2:7DEE
6:B8F6  0bc0                 or ax, ax
6:B8F8  0f8479ff             je 0xb875
6:B8FC  8b46fe               mov ax, word ptr [bp - 2]
6:B8FF  c45e06               les bx, ptr [bp + 6]
6:B902  26894712             mov word ptr es:[bx + 0x12], ax
6:B906  8b46fc               mov ax, word ptr [bp - 4]
6:B909  26894718             mov word ptr es:[bx + 0x18], ax
6:B90D  268b4712             mov ax, word ptr es:[bx + 0x12]
6:B911  8946f8               mov word ptr [bp - 8], ax
6:B914  3d0600               cmp ax, 6
6:B917  0f857301             jne 0xba8e
6:B91B  268b4718             mov ax, word ptr es:[bx + 0x18]
6:B91F  8946f8               mov word ptr [bp - 8], ax
6:B922  e96901               jmp 0xba8e
6:B925  db 90
loc_B926:
6:B926  666a02               push 2
6:B929  8b4606               mov ax, word ptr [bp + 6]
6:B92C  8b5608               mov dx, word ptr [bp + 8]
6:B92F  051400               add ax, 0x14
6:B932  eb34                 jmp 0xb968
loc_B934:
6:B934  c45e06               les bx, ptr [bp + 6]
6:B937  26ff770c             push word ptr es:[bx + 0xc]
6:B93B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:B940  90                   nop
6:B941  0e                   push cs
6:B942  e87727               call 0xe0bc  ; sub_s6:E0BC
6:B945  c45e06               les bx, ptr [bp + 6]
6:B948  26894714             mov word ptr es:[bx + 0x14], ax
6:B94C  26895716             mov word ptr es:[bx + 0x16], dx
6:B950  8bc2                 mov ax, dx
6:B952  260b4714             or ax, word ptr es:[bx + 0x14]
6:B956  7424                 je 0xb97c
6:B958  268b4714             mov ax, word ptr es:[bx + 0x14]
6:B95C  059400               add ax, 0x94
6:B95F  8946f2               mov word ptr [bp - 0xe], ax
6:B962  8956f4               mov word ptr [bp - 0xc], dx
6:B965  666a02               push 2
loc_B968:
6:B968  52                   push dx
6:B969  50                   push ax
6:B96A  66ff760a             push dword ptr [bp + 0xa]
6:B96E  9aee7d8bb9           lcall 0xb98b, 0x7dee  ; File_read@s2:7DEE
6:B973  0bc0                 or ax, ax
6:B975  0f853501             jne 0xbaae
6:B979  e9f9fe               jmp 0xb875
loc_B97C:
6:B97C  666a02               push 2
6:B97F  8d46dc               lea ax, [bp - 0x24]
6:B982  16                   push ss
6:B983  50                   push ax
6:B984  66ff760a             push dword ptr [bp + 0xa]
6:B988  9aee7debb9           lcall 0xb9eb, 0x7dee  ; File_read@s2:7DEE
6:B98D  0bc0                 or ax, ax
6:B98F  0f84e2fe             je 0xb875
6:B993  e91801               jmp 0xbaae
loc_B996:
6:B996  c45e06               les bx, ptr [bp + 6]
6:B999  26ff770c             push word ptr es:[bx + 0xc]
6:B99D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:B9A2  90                   nop
6:B9A3  0e                   push cs
6:B9A4  e85927               call 0xe100  ; sub_s6:E100
6:B9A7  c45e06               les bx, ptr [bp + 6]
6:B9AA  26894714             mov word ptr es:[bx + 0x14], ax
6:B9AE  26895716             mov word ptr es:[bx + 0x16], dx
6:B9B2  e9f900               jmp 0xbaae
6:B9B5  db 90
loc_B9B6:
6:B9B6  c45e06               les bx, ptr [bp + 6]
6:B9B9  26ff770c             push word ptr es:[bx + 0xc]
6:B9BD  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:B9C2  90                   nop
6:B9C3  0e                   push cs
6:B9C4  e83927               call 0xe100  ; sub_s6:E100
6:B9C7  c45e06               les bx, ptr [bp + 6]
6:B9CA  26894714             mov word ptr es:[bx + 0x14], ax
6:B9CE  26895716             mov word ptr es:[bx + 0x16], dx
6:B9D2  268b4714             mov ax, word ptr es:[bx + 0x14]
6:B9D6  05a400               add ax, 0xa4
6:B9D9  8946f2               mov word ptr [bp - 0xe], ax
6:B9DC  8956f4               mov word ptr [bp - 0xc], dx
6:B9DF  666a02               push 2
6:B9E2  52                   push dx
6:B9E3  50                   push ax
6:B9E4  66ff760a             push dword ptr [bp + 0xa]
6:B9E8  9aee7d02ba           lcall 0xba02, 0x7dee  ; File_read@s2:7DEE
6:B9ED  0bc0                 or ax, ax
6:B9EF  0f8482fe             je 0xb875
6:B9F3  666a02               push 2
6:B9F6  8d46d8               lea ax, [bp - 0x28]
6:B9F9  16                   push ss
6:B9FA  50                   push ax
6:B9FB  66ff760a             push dword ptr [bp + 0xa]
6:B9FF  9aee7d25ba           lcall 0xba25, 0x7dee  ; File_read@s2:7DEE
6:BA04  0bc0                 or ax, ax
6:BA06  0f846bfe             je 0xb875
6:BA0A  c45e06               les bx, ptr [bp + 6]
6:BA0D  66268b4714           mov eax, dword ptr es:[bx + 0x14]
6:BA12  05a800               add ax, 0xa8
6:BA15  668946d0             mov dword ptr [bp - 0x30], eax
6:BA19  666a02               push 2
6:BA1C  6650                 push eax
6:BA1E  66ff760a             push dword ptr [bp + 0xa]
6:BA22  9aee7d48ba           lcall 0xba48, 0x7dee  ; File_read@s2:7DEE
6:BA27  0bc0                 or ax, ax
6:BA29  0f8448fe             je 0xb875
6:BA2D  c45e06               les bx, ptr [bp + 6]
6:BA30  66268b4714           mov eax, dword ptr es:[bx + 0x14]
6:BA35  05aa00               add ax, 0xaa
6:BA38  668946cc             mov dword ptr [bp - 0x34], eax
6:BA3C  666a02               push 2
6:BA3F  6650                 push eax
6:BA41  66ff760a             push dword ptr [bp + 0xa]
6:BA45  9aee7d6bba           lcall 0xba6b, 0x7dee  ; File_read@s2:7DEE
6:BA4A  0bc0                 or ax, ax
6:BA4C  0f8425fe             je 0xb875
6:BA50  c45e06               les bx, ptr [bp + 6]
6:BA53  66268b4714           mov eax, dword ptr es:[bx + 0x14]
6:BA58  05ac00               add ax, 0xac
6:BA5B  668946c8             mov dword ptr [bp - 0x38], eax
6:BA5F  666a02               push 2
6:BA62  6650                 push eax
6:BA64  66ff760a             push dword ptr [bp + 0xa]
6:BA68  9aee7d7dba           lcall 0xba7d, 0x7dee  ; File_read@s2:7DEE
6:BA6D  0bc0                 or ax, ax
6:BA6F  0f8402fe             je 0xb875
6:BA73  ff76d8               push word ptr [bp - 0x28]
6:BA76  66ff760a             push dword ptr [bp + 0xa]
6:BA7A  9abc7209b6           lcall 0xb609, 0x72bc  ; sub_s2:72BC
6:BA7F  c45e06               les bx, ptr [bp + 6]
6:BA82  26c45f14             les bx, ptr es:[bx + 0x14]
6:BA86  268987a600           mov word ptr es:[bx + 0xa6], ax
6:BA8B  eb21                 jmp 0xbaae
6:BA8D  db 90
loc_BA8E:
6:BA8E  48                   dec ax
6:BA8F  3d0800               cmp ax, 8
6:BA92  771a                 ja 0xbaae
6:BA94  03c0                 add ax, ax
6:BA96  93                   xchg bx, ax
6:BA97  2effa79cba           jmp word ptr cs:[bx - 0x4564]
switch_table_BA9C:
    dw loc_B926
    dw loc_B926
    dw loc_B926
    dw loc_B934
    dw loc_B9B6
    dw loc_BAAE
    dw loc_BAAE
    dw loc_BAAE
    dw loc_B996
loc_BAAE:
6:BAAE  b80100               mov ax, 1
6:BAB1  c9                   leave
6:BAB2  ca0800               retf 8
6:BAB5  db 00

; ---------------- sub_s6:BAB6 FAR size=30 callers=7
6:BAB6  c8040000             enter 4, 0
6:BABA  66ff7606             push dword ptr [bp + 6]
6:BABE  90                   nop
6:BABF  0e                   push cs
6:BAC0  e81100               call 0xbad4  ; sub_s6:BAD4
6:BAC3  52                   push dx
6:BAC4  50                   push ax
6:BAC5  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:BACA  90                   nop
6:BACB  0e                   push cs
6:BACC  e81d27               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:BACF  c9                   leave
6:BAD0  ca0400               retf 4
6:BAD3  db 00

; ---------------- sub_s6:BAD4 FAR size=34 callers=1
6:BAD4  c80c0000             enter 0xc, 0
6:BAD8  66ff7606             push dword ptr [bp + 6]
6:BADC  90                   nop
6:BADD  0e                   push cs
6:BADE  e81500               call 0xbaf6  ; sub_s6:BAF6
6:BAE1  8946fc               mov word ptr [bp - 4], ax
6:BAE4  8956fe               mov word ptr [bp - 2], dx
6:BAE7  c45efc               les bx, ptr [bp - 4]
6:BAEA  268b4708             mov ax, word ptr es:[bx + 8]
6:BAEE  268b570a             mov dx, word ptr es:[bx + 0xa]
6:BAF2  c9                   leave
6:BAF3  ca0400               retf 4

; ---------------- sub_s6:BAF6 FAR size=46 callers=2
6:BAF6  c8040000             enter 4, 0
6:BAFA  66ff7606             push dword ptr [bp + 6]
6:BAFE  90                   nop
6:BAFF  0e                   push cs
6:BB00  e82100               call 0xbb24  ; sub_s6:BB24
6:BB03  8956fe               mov word ptr [bp - 2], dx
6:BB06  0bd0                 or dx, ax
6:BB08  7508                 jne 0xbb12
6:BB0A  33c0                 xor ax, ax
6:BB0C  99                   cdq
6:BB0D  c9                   leave
6:BB0E  ca0400               retf 4
6:BB11  db 90
loc_BB12:
6:BB12  ff76fe               push word ptr [bp - 2]
6:BB15  50                   push ax
6:BB16  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:BB1B  90                   nop
6:BB1C  0e                   push cs
6:BB1D  e8cc26               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:BB20  c9                   leave
6:BB21  ca0400               retf 4

; ---------------- sub_s6:BB24 FAR size=50 callers=22
6:BB24  c80c0000             enter 0xc, 0
6:BB28  c45e06               les bx, ptr [bp + 6]
6:BB2B  6626837f0800         cmp dword ptr es:[bx + 8], 0
6:BB31  7507                 jne 0xbb3a
6:BB33  33c0                 xor ax, ax
6:BB35  99                   cdq
6:BB36  c9                   leave
6:BB37  ca0400               retf 4
loc_BB3A:
6:BB3A  06                   push es
6:BB3B  53                   push bx
6:BB3C  90                   nop
6:BB3D  0e                   push cs
6:BB3E  e84dfa               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:BB41  8946fc               mov word ptr [bp - 4], ax
6:BB44  8956fe               mov word ptr [bp - 2], dx
6:BB47  c45efc               les bx, ptr [bp - 4]
6:BB4A  268b4708             mov ax, word ptr es:[bx + 8]
6:BB4E  268b570a             mov dx, word ptr es:[bx + 0xa]
6:BB52  c9                   leave
6:BB53  ca0400               retf 4

; ---------------- sub_s6:BB56 FAR size=20 callers=0
6:BB56  55                   push bp
6:BB57  8bec                 mov bp, sp
6:BB59  66ff760a             push dword ptr [bp + 0xa]
6:BB5D  66ff7606             push dword ptr [bp + 6]
6:BB61  9a7a1729b8           lcall 0xb829, 0x177a  ; sub_s7:177A
6:BB66  c9                   leave
6:BB67  ca0800               retf 8

; ---------------- sub_s6:BB6A FAR size=44 callers=2
6:BB6A  55                   push bp
6:BB6B  8bec                 mov bp, sp
6:BB6D  c45e06               les bx, ptr [bp + 6]
6:BB70  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:BB75  7407                 je 0xbb7e
6:BB77  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:BB7C  7510                 jne 0xbb8e
loc_BB7E:
6:BB7E  268b4714             mov ax, word ptr es:[bx + 0x14]
6:BB82  268b5716             mov dx, word ptr es:[bx + 0x16]
6:BB86  05a400               add ax, 0xa4
6:BB89  c9                   leave
6:BB8A  ca0400               retf 4
6:BB8D  db 90
loc_BB8E:
6:BB8E  33c0                 xor ax, ax
6:BB90  99                   cdq
6:BB91  c9                   leave
6:BB92  ca0400               retf 4
6:BB95  db 00

; ---------------- sub_s6:BB96 FAR size=90 callers=2
6:BB96  55                   push bp
6:BB97  8bec                 mov bp, sp
6:BB99  57                   push di
6:BB9A  56                   push si
6:BB9B  c45e06               les bx, ptr [bp + 6]
6:BB9E  26837f1205           cmp word ptr es:[bx + 0x12], 5
6:BBA3  7407                 je 0xbbac
6:BBA5  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:BBAA  753d                 jne 0xbbe9
loc_BBAC:
6:BBAC  26c45f14             les bx, ptr es:[bx + 0x14]
6:BBB0  8b460a               mov ax, word ptr [bp + 0xa]
6:BBB3  8b560c               mov dx, word ptr [bp + 0xc]
6:BBB6  1e                   push ds
6:BBB7  8dbfa400             lea di, [bx + 0xa4]
6:BBBB  8bf0                 mov si, ax
6:BBBD  8eda                 mov ds, dx
6:BBBF  66b902000000         mov ecx, 2
6:BBC5  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:BBC8  a5                   movsw word ptr es:[di], word ptr [si]
6:BBC9  1f                   pop ds
6:BBCA  66ff7606             push dword ptr [bp + 6]
6:BBCE  90                   nop
6:BBCF  0e                   push cs
6:BBD0  e8510b               call 0xc724  ; sub_s6:C724
6:BBD3  c45e06               les bx, ptr [bp + 6]
6:BBD6  26c45f14             les bx, ptr es:[bx + 0x14]
6:BBDA  2683bfaa0000         cmp word ptr es:[bx + 0xaa], 0
6:BBE0  7507                 jne 0xbbe9
6:BBE2  26c787aa000100       mov word ptr es:[bx + 0xaa], 1
loc_BBE9:
6:BBE9  5e                   pop si
6:BBEA  5f                   pop di
6:BBEB  c9                   leave
6:BBEC  ca0800               retf 8
6:BBEF  db 00

; ---------------- sub_s6:BBF0 FAR size=18 callers=0
6:BBF0  55                   push bp
6:BBF1  8bec                 mov bp, sp
6:BBF3  c45e0a               les bx, ptr [bp + 0xa]
6:BBF6  662bc0               sub eax, eax
6:BBF9  66268907             mov dword ptr es:[bx], eax
6:BBFD  c9                   leave
6:BBFE  ca0800               retf 8
6:BC01  db 00

; ---------------- sub_s6:BC02 FAR size=26 callers=0
6:BC02  c8040000             enter 4, 0
6:BC06  8d46fc               lea ax, [bp - 4]
6:BC09  16                   push ss
6:BC0A  50                   push ax
6:BC0B  c45e06               les bx, ptr [bp + 6]
6:BC0E  06                   push es
6:BC0F  53                   push bx
6:BC10  26c41f               les bx, ptr es:[bx]
6:BC13  26ff5f40             lcall es:[bx + 0x40]
6:BC17  c9                   leave
6:BC18  ca0400               retf 4
6:BC1B  db 00

; ---------------- sub_s6:BC1C FAR size=46 callers=1
6:BC1C  55                   push bp
6:BC1D  8bec                 mov bp, sp
6:BC1F  c45e06               les bx, ptr [bp + 6]
6:BC22  26837f1204           cmp word ptr es:[bx + 0x12], 4
6:BC27  7509                 jne 0xbc32
6:BC29  268b470e             mov ax, word ptr es:[bx + 0xe]
6:BC2D  c9                   leave
6:BC2E  ca0400               retf 4
6:BC31  db 90
loc_BC32:
6:BC32  26837f1207           cmp word ptr es:[bx + 0x12], 7
6:BC37  7509                 jne 0xbc42
6:BC39  268b4710             mov ax, word ptr es:[bx + 0x10]
6:BC3D  c9                   leave
6:BC3E  ca0400               retf 4
6:BC41  db 90
loc_BC42:
6:BC42  268b470c             mov ax, word ptr es:[bx + 0xc]
6:BC46  c9                   leave
6:BC47  ca0400               retf 4

; ---------------- sub_s6:BC4A FAR size=52 callers=1
6:BC4A  c80e0000             enter 0xe, 0
6:BC4E  c45e06               les bx, ptr [bp + 6]
6:BC51  26ff770c             push word ptr es:[bx + 0xc]
6:BC55  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:BC5A  90                   nop
6:BC5B  0e                   push cs
6:BC5C  e85d24               call 0xe0bc  ; sub_s6:E0BC
6:BC5F  8946fc               mov word ptr [bp - 4], ax
6:BC62  8956fe               mov word ptr [bp - 2], dx
6:BC65  c45efc               les bx, ptr [bp - 4]
6:BC68  268b879600           mov ax, word ptr es:[bx + 0x96]
6:BC6D  8946fa               mov word ptr [bp - 6], ax
6:BC70  06                   push es
6:BC71  53                   push bx
6:BC72  9ace172cb5           lcall 0xb52c, 0x17ce  ; operator_delete@s1:17CE
6:BC77  8b46fa               mov ax, word ptr [bp - 6]
6:BC7A  c9                   leave
6:BC7B  ca0400               retf 4

; ---------------- sub_s6:BC7E FAR size=18 callers=0
6:BC7E  55                   push bp
6:BC7F  8bec                 mov bp, sp
6:BC81  6a04                 push 4
6:BC83  66ff7606             push dword ptr [bp + 6]
6:BC87  90                   nop
6:BC88  0e                   push cs
6:BC89  e82001               call 0xbdac  ; sub_s6:BDAC
6:BC8C  c9                   leave
6:BC8D  ca0400               retf 4

; ---------------- sub_s6:BC90 FAR size=168 callers=1
6:BC90  c8020000             enter 2, 0
6:BC94  57                   push di
6:BC95  56                   push si
6:BC96  66ff7612             push dword ptr [bp + 0x12]
6:BC9A  66ff760a             push dword ptr [bp + 0xa]
6:BC9E  66ff7606             push dword ptr [bp + 6]
6:BCA2  90                   nop
6:BCA3  0e                   push cs
6:BCA4  e80f0b               call 0xc7b6  ; sub_s6:C7B6
6:BCA7  3d0500               cmp ax, 5
6:BCAA  7405                 je 0xbcb1
6:BCAC  3d0600               cmp ax, 6
6:BCAF  757f                 jne 0xbd30
loc_BCB1:
6:BCB1  66ff7612             push dword ptr [bp + 0x12]
6:BCB5  66ff760e             push dword ptr [bp + 0xe]
6:BCB9  66ff760a             push dword ptr [bp + 0xa]
6:BCBD  c45e06               les bx, ptr [bp + 6]
6:BCC0  06                   push es
6:BCC1  53                   push bx
6:BCC2  26c41f               les bx, ptr es:[bx]
6:BCC5  8bf3                 mov si, bx
6:BCC7  8cc7                 mov di, es
6:BCC9  26ff5f60             lcall es:[bx + 0x60]
6:BCCD  0bc0                 or ax, ax
6:BCCF  744c                 je 0xbd1d
6:BCD1  66ff7612             push dword ptr [bp + 0x12]
6:BCD5  66ff760e             push dword ptr [bp + 0xe]
6:BCD9  66ff760a             push dword ptr [bp + 0xa]
6:BCDD  66ff7606             push dword ptr [bp + 6]
6:BCE1  8ec7                 mov es, di
6:BCE3  26ff5c5c             lcall es:[si + 0x5c]
6:BCE7  0bc0                 or ax, ax
6:BCE9  7432                 je 0xbd1d
6:BCEB  66ff7612             push dword ptr [bp + 0x12]
6:BCEF  66ff760e             push dword ptr [bp + 0xe]
6:BCF3  66ff760a             push dword ptr [bp + 0xa]
6:BCF7  66ff7606             push dword ptr [bp + 6]
6:BCFB  90                   nop
6:BCFC  0e                   push cs
6:BCFD  e83e05               call 0xc23e  ; sub_s6:C23E
6:BD00  0bc0                 or ax, ax
6:BD02  7419                 je 0xbd1d
6:BD04  66ff7612             push dword ptr [bp + 0x12]
6:BD08  66ff760e             push dword ptr [bp + 0xe]
6:BD0C  66ff760a             push dword ptr [bp + 0xa]
6:BD10  66ff7606             push dword ptr [bp + 6]
6:BD14  90                   nop
6:BD15  0e                   push cs
6:BD16  e8fb05               call 0xc314  ; sub_s6:C314
6:BD19  0bc0                 or ax, ax
6:BD1B  7509                 jne 0xbd26
loc_BD1D:
6:BD1D  33c0                 xor ax, ax
6:BD1F  5e                   pop si
6:BD20  5f                   pop di
6:BD21  c9                   leave
6:BD22  ca1000               retf 0x10
6:BD25  db 90
loc_BD26:
6:BD26  b80100               mov ax, 1
6:BD29  5e                   pop si
6:BD2A  5f                   pop di
6:BD2B  c9                   leave
6:BD2C  ca1000               retf 0x10
6:BD2F  db 90
loc_BD30:
6:BD30  c706ca50a806         mov word ptr [0x50ca], 0x6a8
6:BD36  ebe5                 jmp 0xbd1d

; ---------------- sub_s6:BD38 FAR size=116 callers=4
6:BD38  c81e0000             enter 0x1e, 0
6:BD3C  56                   push si
6:BD3D  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:BD41  66268b4752           mov eax, dword ptr es:[bx + 0x52]
6:BD46  c45e06               les bx, ptr [bp + 6]
6:BD49  26ff770c             push word ptr es:[bx + 0xc]
6:BD4D  6650                 push eax
6:BD4F  9abe4b64bb           lcall 0xbb64, 0x4bbe  ; sub_s7:4BBE
6:BD54  8946f8               mov word ptr [bp - 8], ax
6:BD57  8956fa               mov word ptr [bp - 6], dx
6:BD5A  66ff7606             push dword ptr [bp + 6]
6:BD5E  90                   nop
6:BD5F  0e                   push cs
6:BD60  e82bf8               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:BD63  8946f4               mov word ptr [bp - 0xc], ax
6:BD66  8956f6               mov word ptr [bp - 0xa], dx
6:BD69  c45ef4               les bx, ptr [bp - 0xc]
6:BD6C  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:BD71  668946f0             mov dword ptr [bp - 0x10], eax
6:BD75  c746ee1100           mov word ptr [bp - 0x12], 0x11
loc_BD7A:
6:BD7A  8b5eee               mov bx, word ptr [bp - 0x12]
6:BD7D  c1e302               shl bx, 2
6:BD80  c476f8               les si, ptr [bp - 8]
6:BD83  268b00               mov ax, word ptr es:[bx + si]
6:BD86  268b5002             mov dx, word ptr es:[bx + si + 2]
6:BD8A  8bda                 mov bx, dx
6:BD8C  0bd0                 or dx, ax
6:BD8E  740e                 je 0xbd9e
6:BD90  ff76ee               push word ptr [bp - 0x12]
6:BD93  53                   push bx
6:BD94  50                   push ax
6:BD95  66ff76f0             push dword ptr [bp - 0x10]
6:BD99  9a7057c1b4           lcall 0xb4c1, 0x5770  ; sub_s8:5770
loc_BD9E:
6:BD9E  ff46ee               inc word ptr [bp - 0x12]
6:BDA1  837eee25             cmp word ptr [bp - 0x12], 0x25
6:BDA5  7cd3                 jl 0xbd7a
6:BDA7  5e                   pop si
6:BDA8  c9                   leave
6:BDA9  ca0600               retf 6

; ---------------- sub_s6:BDAC FAR size=126 callers=19
6:BDAC  c8080000             enter 8, 0
6:BDB0  8b460a               mov ax, word ptr [bp + 0xa]
6:BDB3  c45e06               les bx, ptr [bp + 6]
6:BDB6  26394712             cmp word ptr es:[bx + 0x12], ax
6:BDBA  7469                 je 0xbe25
6:BDBC  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:BDC1  7519                 jne 0xbddc
6:BDC3  26394718             cmp word ptr es:[bx + 0x18], ax
6:BDC7  755c                 jne 0xbe25
6:BDC9  268b4718             mov ax, word ptr es:[bx + 0x18]
6:BDCD  26894712             mov word ptr es:[bx + 0x12], ax
6:BDD1  26c747180000         mov word ptr es:[bx + 0x18], 0
6:BDD7  c9                   leave
6:BDD8  ca0600               retf 6
6:BDDB  db 90
loc_BDDC:
6:BDDC  3d0600               cmp ax, 6
6:BDDF  7435                 je 0xbe16
6:BDE1  268b4712             mov ax, word ptr es:[bx + 0x12]
6:BDE5  2d0400               sub ax, 4
6:BDE8  7403                 je 0xbded
6:BDEA  48                   dec ax
6:BDEB  7512                 jne 0xbdff
loc_BDED:
6:BDED  c45e06               les bx, ptr [bp + 6]
6:BDF0  66268b4f14           mov ecx, dword ptr es:[bx + 0x14]
6:BDF5  6651                 push ecx
6:BDF7  9ace1775bc           lcall 0xbc75, 0x17ce  ; operator_delete@s1:17CE
6:BDFC  83c404               add sp, 4
loc_BDFF:
6:BDFF  8b460a               mov ax, word ptr [bp + 0xa]
6:BE02  c45e06               les bx, ptr [bp + 6]
6:BE05  26894712             mov word ptr es:[bx + 0x12], ax
6:BE09  06                   push es
6:BE0A  53                   push bx
6:BE0B  26c41f               les bx, ptr es:[bx]
6:BE0E  26ff5f3c             lcall es:[bx + 0x3c]
6:BE12  c9                   leave
6:BE13  ca0600               retf 6
loc_BE16:
6:BE16  268b4712             mov ax, word ptr es:[bx + 0x12]
6:BE1A  26894718             mov word ptr es:[bx + 0x18], ax
6:BE1E  8b460a               mov ax, word ptr [bp + 0xa]
6:BE21  26894712             mov word ptr es:[bx + 0x12], ax
loc_BE25:
6:BE25  c9                   leave
6:BE26  ca0600               retf 6
6:BE29  db 00

; ---------------- sub_s6:BE2A FAR size=116 callers=5
6:BE2A  c80c0000             enter 0xc, 0
6:BE2E  c45e06               les bx, ptr [bp + 6]
6:BE31  26837f1206           cmp word ptr es:[bx + 0x12], 6
6:BE36  7562                 jne 0xbe9a
6:BE38  06                   push es
6:BE39  53                   push bx
6:BE3A  90                   nop
6:BE3B  0e                   push cs
6:BE3C  e8b3f6               call 0xb4f2  ; sub_s6:B4F2
6:BE3F  8946fc               mov word ptr [bp - 4], ax
6:BE42  8956fe               mov word ptr [bp - 2], dx
6:BE45  c45efc               les bx, ptr [bp - 4]
6:BE48  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:BE52  743b                 je 0xbe8f
6:BE54  c45e06               les bx, ptr [bp + 6]
6:BE57  6626817f1c02000008   cmp dword ptr es:[bx + 0x1c], 0x8000002
6:BE60  7506                 jne 0xbe68
6:BE62  6a06                 push 6
6:BE64  06                   push es
6:BE65  53                   push bx
6:BE66  eb2d                 jmp 0xbe95
loc_BE68:
6:BE68  06                   push es
6:BE69  53                   push bx
6:BE6A  26c41f               les bx, ptr es:[bx]
6:BE6D  26ff5f64             lcall es:[bx + 0x64]
6:BE71  0bc0                 or ax, ax
6:BE73  7425                 je 0xbe9a
6:BE75  66ff7606             push dword ptr [bp + 6]
6:BE79  90                   nop
6:BE7A  0e                   push cs
6:BE7B  e8860c               call 0xcb04  ; sub_s6:CB04
6:BE7E  0bc0                 or ax, ax
6:BE80  7504                 jne 0xbe86
6:BE82  6a06                 push 6
6:BE84  eb0b                 jmp 0xbe91
loc_BE86:
6:BE86  66ff7606             push dword ptr [bp + 6]
6:BE8A  90                   nop
6:BE8B  0e                   push cs
6:BE8C  e8c30a               call 0xc952  ; sub_s6:C952
loc_BE8F:
6:BE8F  6a05                 push 5
loc_BE91:
6:BE91  66ff7606             push dword ptr [bp + 6]
loc_BE95:
6:BE95  90                   nop
6:BE96  0e                   push cs
6:BE97  e812ff               call 0xbdac  ; sub_s6:BDAC
loc_BE9A:
6:BE9A  c9                   leave
6:BE9B  ca0400               retf 4

; ---------------- sub_s6:BE9E FAR size=120 callers=12
6:BE9E  c80c0000             enter 0xc, 0
6:BEA2  c45e06               les bx, ptr [bp + 6]
6:BEA5  26837f1204           cmp word ptr es:[bx + 0x12], 4
6:BEAA  7566                 jne 0xbf12
6:BEAC  06                   push es
6:BEAD  53                   push bx
6:BEAE  90                   nop
6:BEAF  0e                   push cs
6:BEB0  e83ff6               call 0xb4f2  ; sub_s6:B4F2
6:BEB3  8946fc               mov word ptr [bp - 4], ax
6:BEB6  8956fe               mov word ptr [bp - 2], dx
6:BEB9  c45efc               les bx, ptr [bp - 4]
6:BEBC  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:BEC6  750e                 jne 0xbed6
6:BEC8  c45e06               les bx, ptr [bp + 6]
6:BECB  26c45f14             les bx, ptr es:[bx + 0x14]
6:BECF  26ff8f9400           dec word ptr es:[bx + 0x94]
6:BED4  eb22                 jmp 0xbef8
loc_BED6:
6:BED6  66ff7606             push dword ptr [bp + 6]
6:BEDA  90                   nop
6:BEDB  0e                   push cs
6:BEDC  e8250c               call 0xcb04  ; sub_s6:CB04
6:BEDF  0bc0                 or ax, ax
6:BEE1  742f                 je 0xbf12
6:BEE3  c45e06               les bx, ptr [bp + 6]
6:BEE6  26c45f14             les bx, ptr es:[bx + 0x14]
6:BEEA  26ff8f9400           dec word ptr es:[bx + 0x94]
6:BEEF  66ff7606             push dword ptr [bp + 6]
6:BEF3  90                   nop
6:BEF4  0e                   push cs
6:BEF5  e85a0a               call 0xc952  ; sub_s6:C952
loc_BEF8:
6:BEF8  c45e06               les bx, ptr [bp + 6]
6:BEFB  26c45f14             les bx, ptr es:[bx + 0x14]
6:BEFF  2683bf940000         cmp word ptr es:[bx + 0x94], 0
6:BF05  7f0b                 jg 0xbf12
6:BF07  6a05                 push 5
6:BF09  66ff7606             push dword ptr [bp + 6]
6:BF0D  90                   nop
6:BF0E  0e                   push cs
6:BF0F  e89afe               call 0xbdac  ; sub_s6:BDAC
loc_BF12:
6:BF12  c9                   leave
6:BF13  ca0400               retf 4

; ---------------- Building::mine_default@s6:BF16 FAR size=4 callers=0
6:BF16  ca0400               retf 4
6:BF19  db 00

; ---------------- Building::produce_default@s6:BF1A FAR size=4 callers=0
6:BF1A  ca0400               retf 4
6:BF1D  db 00

; ---------------- Building::power_default@s6:BF1E FAR size=4 callers=0
6:BF1E  ca0600               retf 6
6:BF21  db 00

; ---------------- sub_s6:BF22 FAR size=84 callers=2
6:BF22  55                   push bp
6:BF23  8bec                 mov bp, sp
6:BF25  c45e06               les bx, ptr [bp + 6]
6:BF28  268b4712             mov ax, word ptr es:[bx + 0x12]
6:BF2C  2d0400               sub ax, 4
6:BF2F  7409                 je 0xbf3a
6:BF31  48                   dec ax
6:BF32  7416                 je 0xbf4a
6:BF34  48                   dec ax
6:BF35  743a                 je 0xbf71
6:BF37  eb2f                 jmp 0xbf68
6:BF39  db 90
loc_BF3A:
6:BF3A  26ff770c             push word ptr es:[bx + 0xc]
6:BF3E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:BF43  90                   nop
6:BF44  0e                   push cs
6:BF45  e87421               call 0xe0bc  ; sub_s6:E0BC
6:BF48  eb0e                 jmp 0xbf58
loc_BF4A:
6:BF4A  26ff770c             push word ptr es:[bx + 0xc]
6:BF4E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:BF53  90                   nop
6:BF54  0e                   push cs
6:BF55  e8a821               call 0xe100  ; sub_s6:E100
loc_BF58:
6:BF58  c45e06               les bx, ptr [bp + 6]
6:BF5B  26894714             mov word ptr es:[bx + 0x14], ax
6:BF5F  26895716             mov word ptr es:[bx + 0x16], dx
6:BF63  c9                   leave
6:BF64  ca0400               retf 4
6:BF67  db 90
loc_BF68:
6:BF68  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
loc_BF71:
6:BF71  c9                   leave
6:BF72  ca0400               retf 4
6:BF75  db 00

; ---------------- sub_s6:BF76 FAR size=148 callers=1
6:BF76  c8020000             enter 2, 0
6:BF7A  666801000300         push 0x30001
6:BF80  9a2e619cbf           lcall 0xbf9c, 0x612e  ; sub_s2:612E
6:BF85  83c404               add sp, 4
6:BF88  8946fe               mov word ptr [bp - 2], ax
6:BF8B  6a28                 push 0x28
6:BF8D  c45e06               les bx, ptr [bp + 6]
6:BF90  26ff770c             push word ptr es:[bx + 0xc]
6:BF94  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:BF99  9aaec645b8           lcall 0xb845, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:BF9E  0bc0                 or ax, ax
6:BFA0  7432                 je 0xbfd4
6:BFA2  8b46fe               mov ax, word ptr [bp - 2]
6:BFA5  48                   dec ax
6:BFA6  7410                 je 0xbfb8
6:BFA8  48                   dec ax
6:BFA9  741b                 je 0xbfc6
6:BFAB  c45e06               les bx, ptr [bp + 6]
6:BFAE  26c747107200         mov word ptr es:[bx + 0x10], 0x72
6:BFB4  c9                   leave
6:BFB5  ca0400               retf 4
loc_BFB8:
6:BFB8  c45e06               les bx, ptr [bp + 6]
6:BFBB  26c747107000         mov word ptr es:[bx + 0x10], 0x70
6:BFC1  c9                   leave
6:BFC2  ca0400               retf 4
6:BFC5  db 90
loc_BFC6:
6:BFC6  c45e06               les bx, ptr [bp + 6]
6:BFC9  26c747107100         mov word ptr es:[bx + 0x10], 0x71
6:BFCF  c9                   leave
6:BFD0  ca0400               retf 4
6:BFD3  db 90
loc_BFD4:
6:BFD4  8b46fe               mov ax, word ptr [bp - 2]
6:BFD7  48                   dec ax
6:BFD8  7406                 je 0xbfe0
6:BFDA  48                   dec ax
6:BFDB  7411                 je 0xbfee
6:BFDD  eb1d                 jmp 0xbffc
6:BFDF  db 90
loc_BFE0:
6:BFE0  c45e06               les bx, ptr [bp + 6]
6:BFE3  26c747104800         mov word ptr es:[bx + 0x10], 0x48
6:BFE9  c9                   leave
6:BFEA  ca0400               retf 4
6:BFED  db 90
loc_BFEE:
6:BFEE  c45e06               les bx, ptr [bp + 6]
6:BFF1  26c747104900         mov word ptr es:[bx + 0x10], 0x49
6:BFF7  c9                   leave
6:BFF8  ca0400               retf 4
6:BFFB  db 90
loc_BFFC:
6:BFFC  c45e06               les bx, ptr [bp + 6]
6:BFFF  26c747104a00         mov word ptr es:[bx + 0x10], 0x4a
6:C005  c9                   leave
6:C006  ca0400               retf 4
6:C009  db 00

; ---------------- sub_s6:C00A FAR size=230 callers=2
6:C00A  c8340000             enter 0x34, 0
6:C00E  66ff7606             push dword ptr [bp + 6]
6:C012  90                   nop
6:C013  0e                   push cs
6:C014  e877f5               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:C017  8946fc               mov word ptr [bp - 4], ax
6:C01A  8956fe               mov word ptr [bp - 2], dx
6:C01D  c45efc               les bx, ptr [bp - 4]
6:C020  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:C025  668946f8             mov dword ptr [bp - 8], eax
6:C029  6a04                 push 4
6:C02B  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:C030  9afac683bf           lcall 0xbf83, 0xc6fa  ; sub_s2:C6FA
6:C035  52                   push dx
6:C036  50                   push ax
6:C037  66ff76f8             push dword ptr [bp - 8]
6:C03B  9a6e4d9cbd           lcall 0xbd9c, 0x4d6e  ; sub_s8:4D6E
6:C040  8946f0               mov word ptr [bp - 0x10], ax
6:C043  8956f2               mov word ptr [bp - 0xe], dx
6:C046  52                   push dx
6:C047  c45ef0               les bx, ptr [bp - 0x10]
6:C04A  50                   push ax
6:C04B  26c41f               les bx, ptr es:[bx]
6:C04E  26ff5f10             lcall es:[bx + 0x10]
6:C052  8946ec               mov word ptr [bp - 0x14], ax
6:C055  8956ee               mov word ptr [bp - 0x12], dx
6:C058  66c746e800000000     mov dword ptr [bp - 0x18], 0
6:C060  eb19                 jmp 0xc07b
loc_C062:
6:C062  52                   push dx
6:C063  50                   push ax
6:C064  6a00                 push 0
6:C066  66ff76d8             push dword ptr [bp - 0x28]
6:C06A  90                   nop
6:C06B  0e                   push cs
6:C06C  e8e7a2               call 0x6356  ; sub_s6:6356
6:C06F  668b46d4             mov eax, dword ptr [bp - 0x2c]
6:C073  6629460a             sub dword ptr [bp + 0xa], eax
6:C077  66ff46e8             inc dword ptr [bp - 0x18]
loc_C07B:
6:C07B  668b46ec             mov eax, dword ptr [bp - 0x14]
6:C07F  663946e8             cmp dword ptr [bp - 0x18], eax
6:C083  7351                 jae 0xc0d6
6:C085  66ff76e8             push dword ptr [bp - 0x18]
6:C089  c45ef0               les bx, ptr [bp - 0x10]
6:C08C  06                   push es
6:C08D  53                   push bx
6:C08E  26c41f               les bx, ptr es:[bx]
6:C091  26ff5f04             lcall es:[bx + 4]
6:C095  52                   push dx
6:C096  50                   push ax
6:C097  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C09C  90                   nop
6:C09D  0e                   push cs
6:C09E  e84b21               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C0A1  52                   push dx
6:C0A2  50                   push ax
6:C0A3  9aa87352bd           lcall 0xbd52, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:C0A8  8946d8               mov word ptr [bp - 0x28], ax
6:C0AB  8956da               mov word ptr [bp - 0x26], dx
6:C0AE  52                   push dx
6:C0AF  50                   push ax
6:C0B0  90                   nop
6:C0B1  0e                   push cs
6:C0B2  e84da2               call 0x6302  ; sub_s6:6302
6:C0B5  8946d4               mov word ptr [bp - 0x2c], ax
6:C0B8  8956d6               mov word ptr [bp - 0x2a], dx
6:C0BB  3b560c               cmp dx, word ptr [bp + 0xc]
6:C0BE  72a2                 jb 0xc062
6:C0C0  7705                 ja 0xc0c7
6:C0C2  3b460a               cmp ax, word ptr [bp + 0xa]
6:C0C5  729b                 jb 0xc062
loc_C0C7:
6:C0C7  66ff760a             push dword ptr [bp + 0xa]
6:C0CB  6a00                 push 0
6:C0CD  66ff76d8             push dword ptr [bp - 0x28]
6:C0D1  90                   nop
6:C0D2  0e                   push cs
6:C0D3  e880a2               call 0x6356  ; sub_s6:6356
loc_C0D6:
6:C0D6  668b46f0             mov eax, dword ptr [bp - 0x10]
6:C0DA  660bc0               or eax, eax
6:C0DD  740d                 je 0xc0ec
6:C0DF  6a01                 push 1
6:C0E1  c45ef0               les bx, ptr [bp - 0x10]
6:C0E4  06                   push es
6:C0E5  50                   push ax
6:C0E6  26c41f               les bx, ptr es:[bx]
6:C0E9  26ff1f               lcall es:[bx]
loc_C0EC:
6:C0EC  c9                   leave
6:C0ED  ca0800               retf 8

; ---------------- sub_s6:C0F0 FAR size=264 callers=2
6:C0F0  c83a0000             enter 0x3a, 0
6:C0F4  66ff7606             push dword ptr [bp + 6]
6:C0F8  90                   nop
6:C0F9  0e                   push cs
6:C0FA  e891f4               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:C0FD  8946fc               mov word ptr [bp - 4], ax
6:C100  8956fe               mov word ptr [bp - 2], dx
6:C103  c45efc               les bx, ptr [bp - 4]
6:C106  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:C10B  668946f8             mov dword ptr [bp - 8], eax
6:C10F  66ff7606             push dword ptr [bp + 6]
6:C113  90                   nop
6:C114  0e                   push cs
6:C115  e8ec09               call 0xcb04  ; sub_s6:CB04
6:C118  8946f6               mov word ptr [bp - 0xa], ax
6:C11B  c45ef8               les bx, ptr [bp - 8]
6:C11E  2683bf040200         cmp word ptr es:[bx + 0x204], 0
6:C124  7508                 jne 0xc12e
6:C126  2683bf060200         cmp word ptr es:[bx + 0x206], 0
6:C12C  7408                 je 0xc136
loc_C12E:
6:C12E  8b46f6               mov ax, word ptr [bp - 0xa]
6:C131  c9                   leave
6:C132  ca0800               retf 8
6:C135  db 90
loc_C136:
6:C136  6a04                 push 4
6:C138  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:C13D  9afac633c0           lcall 0xc033, 0xc6fa  ; sub_s2:C6FA
6:C142  52                   push dx
6:C143  50                   push ax
6:C144  66ff76f8             push dword ptr [bp - 8]
6:C148  9a6e4d3ec0           lcall 0xc03e, 0x4d6e  ; sub_s8:4D6E
6:C14D  8946ee               mov word ptr [bp - 0x12], ax
6:C150  8956f0               mov word ptr [bp - 0x10], dx
6:C153  52                   push dx
6:C154  c45eee               les bx, ptr [bp - 0x12]
6:C157  50                   push ax
6:C158  26c41f               les bx, ptr es:[bx]
6:C15B  26ff5f10             lcall es:[bx + 0x10]
6:C15F  8946ea               mov word ptr [bp - 0x16], ax
6:C162  8956ec               mov word ptr [bp - 0x14], dx
6:C165  66c746e600000000     mov dword ptr [bp - 0x1a], 0
6:C16D  eb0b                 jmp 0xc17a
6:C16F  db 90
loc_C170:
6:C170  29460a               sub word ptr [bp + 0xa], ax
6:C173  19560c               sbb word ptr [bp + 0xc], dx
6:C176  66ff46e6             inc dword ptr [bp - 0x1a]
loc_C17A:
6:C17A  668b46ea             mov eax, dword ptr [bp - 0x16]
6:C17E  663946e6             cmp dword ptr [bp - 0x1a], eax
6:C182  733e                 jae 0xc1c2
6:C184  66ff76e6             push dword ptr [bp - 0x1a]
6:C188  c45eee               les bx, ptr [bp - 0x12]
6:C18B  06                   push es
6:C18C  53                   push bx
6:C18D  26c41f               les bx, ptr es:[bx]
6:C190  26ff5f04             lcall es:[bx + 4]
6:C194  52                   push dx
6:C195  50                   push ax
6:C196  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C19B  90                   nop
6:C19C  0e                   push cs
6:C19D  e84c20               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C1A0  52                   push dx
6:C1A1  50                   push ax
6:C1A2  9aa873eec1           lcall 0xc1ee, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:C1A7  52                   push dx
6:C1A8  50                   push ax
6:C1A9  90                   nop
6:C1AA  0e                   push cs
6:C1AB  e854a1               call 0x6302  ; sub_s6:6302
6:C1AE  3b560c               cmp dx, word ptr [bp + 0xc]
6:C1B1  72bd                 jb 0xc170
6:C1B3  7705                 ja 0xc1ba
6:C1B5  3b460a               cmp ax, word ptr [bp + 0xa]
6:C1B8  72b6                 jb 0xc170
loc_C1BA:
6:C1BA  66c7460a00000000     mov dword ptr [bp + 0xa], 0
loc_C1C2:
6:C1C2  668b46ee             mov eax, dword ptr [bp - 0x12]
6:C1C6  660bc0               or eax, eax
6:C1C9  740d                 je 0xc1d8
6:C1CB  6a01                 push 1
6:C1CD  c45eee               les bx, ptr [bp - 0x12]
6:C1D0  06                   push es
6:C1D1  50                   push ax
6:C1D2  26c41f               les bx, ptr es:[bx]
6:C1D5  26ff1f               lcall es:[bx]
loc_C1D8:
6:C1D8  66837e0a00           cmp dword ptr [bp + 0xa], 0
6:C1DD  0f844dff             je 0xc12e
6:C1E1  6a1d                 push 0x1d
6:C1E3  66ff760a             push dword ptr [bp + 0xa]
6:C1E7  66ff76fc             push dword ptr [bp - 4]
6:C1EB  9a7c7da6c0           lcall 0xc0a6, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:C1F0  c746f60000           mov word ptr [bp - 0xa], 0
6:C1F5  e936ff               jmp 0xc12e

; ---------------- sub_s6:C1F8 FAR size=70 callers=2
6:C1F8  c80c0000             enter 0xc, 0
6:C1FC  57                   push di
6:C1FD  56                   push si
6:C1FE  66ff7606             push dword ptr [bp + 6]
6:C202  90                   nop
6:C203  0e                   push cs
6:C204  e8eff8               call 0xbaf6  ; sub_s6:BAF6
6:C207  8946fc               mov word ptr [bp - 4], ax
6:C20A  8956fe               mov word ptr [bp - 2], dx
6:C20D  52                   push dx
6:C20E  50                   push ax
6:C20F  9a5c5ba5c1           lcall 0xc1a5, 0x5b5c  ; sub_s7:5B5C
6:C214  1e                   push ds
6:C215  8d7ef6               lea di, [bp - 0xa]
6:C218  8bf0                 mov si, ax
6:C21A  16                   push ss
6:C21B  07                   pop es
6:C21C  8eda                 mov ds, dx
6:C21E  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:C220  a5                   movsw word ptr es:[di], word ptr [si]
6:C221  1f                   pop ds
6:C222  8d46f6               lea ax, [bp - 0xa]
6:C225  8946f4               mov word ptr [bp - 0xc], ax
6:C228  66ff760e             push dword ptr [bp + 0xe]
6:C22C  66ff760a             push dword ptr [bp + 0xa]
6:C230  16                   push ss
6:C231  50                   push ax
6:C232  9a943e40c1           lcall 0xc140, 0x3e94  ; sub_s2:3E94
6:C237  5e                   pop si
6:C238  5f                   pop di
6:C239  c9                   leave
6:C23A  ca0c00               retf 0xc
6:C23D  db 00

; ---------------- sub_s6:C23E FAR size=214 callers=5
6:C23E  c8240000             enter 0x24, 0
6:C242  66ff7612             push dword ptr [bp + 0x12]
6:C246  66ff760a             push dword ptr [bp + 0xa]
6:C24A  66ff364057           push dword ptr [0x5740]
6:C24F  9a7e6209c3           lcall 0xc309, 0x627e  ; sub_s7:627E
6:C254  8946fc               mov word ptr [bp - 4], ax
6:C257  8956fe               mov word ptr [bp - 2], dx
6:C25A  0bd0                 or dx, ax
6:C25C  7508                 jne 0xc266
loc_C25E:
6:C25E  b80100               mov ax, 1
6:C261  c9                   leave
6:C262  ca1000               retf 0x10
6:C265  db 90
loc_C266:
6:C266  ff76fe               push word ptr [bp - 2]
6:C269  50                   push ax
6:C26A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C26F  90                   nop
6:C270  0e                   push cs
6:C271  e8781f               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C274  8946f8               mov word ptr [bp - 8], ax
6:C277  8956fa               mov word ptr [bp - 6], dx
6:C27A  c45ef8               les bx, ptr [bp - 8]
6:C27D  66268b472a           mov eax, dword ptr es:[bx + 0x2a]
6:C282  668946f4             mov dword ptr [bp - 0xc], eax
6:C286  668b460e             mov eax, dword ptr [bp + 0xe]
6:C28A  663946f4             cmp dword ptr [bp - 0xc], eax
6:C28E  74ce                 je 0xc25e
6:C290  66ff76f4             push dword ptr [bp - 0xc]
6:C294  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C299  90                   nop
6:C29A  0e                   push cs
6:C29B  e84e1f               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C29E  8946f0               mov word ptr [bp - 0x10], ax
6:C2A1  8956f2               mov word ptr [bp - 0xe], dx
6:C2A4  66ff760e             push dword ptr [bp + 0xe]
6:C2A8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C2AD  90                   nop
6:C2AE  0e                   push cs
6:C2AF  e83a1f               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C2B2  8946ec               mov word ptr [bp - 0x14], ax
6:C2B5  8956ee               mov word ptr [bp - 0x12], dx
6:C2B8  66837ef000           cmp dword ptr [bp - 0x10], 0
6:C2BD  744f                 je 0xc30e
6:C2BF  8bc2                 mov ax, dx
6:C2C1  0b46ec               or ax, word ptr [bp - 0x14]
6:C2C4  7448                 je 0xc30e
6:C2C6  c45ef0               les bx, ptr [bp - 0x10]
6:C2C9  66268b870002         mov eax, dword ptr es:[bx + 0x200]
6:C2CF  c45eec               les bx, ptr [bp - 0x14]
6:C2D2  662639870002         cmp dword ptr es:[bx + 0x200], eax
6:C2D8  7534                 jne 0xc30e
6:C2DA  66ff76fc             push dword ptr [bp - 4]
6:C2DE  c45ef0               les bx, ptr [bp - 0x10]
6:C2E1  06                   push es
6:C2E2  53                   push bx
6:C2E3  26c41f               les bx, ptr es:[bx]
6:C2E6  26ff5f18             lcall es:[bx + 0x18]
6:C2EA  6a00                 push 0
6:C2EC  66ff76fc             push dword ptr [bp - 4]
6:C2F0  6a00                 push 0
6:C2F2  c45eec               les bx, ptr [bp - 0x14]
6:C2F5  06                   push es
6:C2F6  53                   push bx
6:C2F7  26c41f               les bx, ptr es:[bx]
6:C2FA  26ff5f08             lcall es:[bx + 8]
6:C2FE  66ff760e             push dword ptr [bp + 0xe]
6:C302  66ff76f8             push dword ptr [bp - 8]
6:C306  9aee7312c2           lcall 0xc212, 0x73ee  ; sub_s7:73EE
6:C30B  e950ff               jmp 0xc25e
loc_C30E:
6:C30E  33c0                 xor ax, ax
6:C310  c9                   leave
6:C311  ca1000               retf 0x10

; ---------------- sub_s6:C314 FAR size=150 callers=8
6:C314  c8140000             enter 0x14, 0
6:C318  57                   push di
6:C319  56                   push si
6:C31A  66ff7612             push dword ptr [bp + 0x12]
6:C31E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C323  90                   nop
6:C324  0e                   push cs
6:C325  e8c41e               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C328  8946fc               mov word ptr [bp - 4], ax
6:C32B  8956fe               mov word ptr [bp - 2], dx
6:C32E  52                   push dx
6:C32F  50                   push ax
6:C330  9a5c5b52c2           lcall 0xc252, 0x5b5c  ; sub_s7:5B5C
6:C335  1e                   push ds
6:C336  8d7ef6               lea di, [bp - 0xa]
6:C339  8bf0                 mov si, ax
6:C33B  16                   push ss
6:C33C  07                   pop es
6:C33D  8eda                 mov ds, dx
6:C33F  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:C341  a5                   movsw word ptr es:[di], word ptr [si]
6:C342  1f                   pop ds
6:C343  8d46f6               lea ax, [bp - 0xa]
6:C346  8946ec               mov word ptr [bp - 0x14], ax
6:C349  8d46f4               lea ax, [bp - 0xc]
6:C34C  16                   push ss
6:C34D  50                   push ax
6:C34E  8d4ef2               lea cx, [bp - 0xe]
6:C351  16                   push ss
6:C352  51                   push cx
6:C353  66ff760a             push dword ptr [bp + 0xa]
6:C357  9a943e6ec3           lcall 0xc36e, 0x3e94  ; sub_s2:3E94
6:C35C  8d46f0               lea ax, [bp - 0x10]
6:C35F  16                   push ss
6:C360  50                   push ax
6:C361  8d4eee               lea cx, [bp - 0x12]
6:C364  16                   push ss
6:C365  51                   push cx
6:C366  8d56f6               lea dx, [bp - 0xa]
6:C369  16                   push ss
6:C36A  52                   push dx
6:C36B  9a943e35c2           lcall 0xc235, 0x3e94  ; sub_s2:3E94
6:C370  ff4ef0               dec word ptr [bp - 0x10]
6:C373  ff4eee               dec word ptr [bp - 0x12]
6:C376  837ef401             cmp word ptr [bp - 0xc], 1
6:C37A  7e16                 jle 0xc392
6:C37C  837ef201             cmp word ptr [bp - 0xe], 1
6:C380  7e10                 jle 0xc392
6:C382  8b46f4               mov ax, word ptr [bp - 0xc]
6:C385  3946f0               cmp word ptr [bp - 0x10], ax
6:C388  7e08                 jle 0xc392
6:C38A  8b46f2               mov ax, word ptr [bp - 0xe]
6:C38D  3946ee               cmp word ptr [bp - 0x12], ax
6:C390  7f0e                 jg 0xc3a0
loc_C392:
6:C392  c706ca50b806         mov word ptr [0x50ca], 0x6b8
6:C398  33c0                 xor ax, ax
6:C39A  5e                   pop si
6:C39B  5f                   pop di
6:C39C  c9                   leave
6:C39D  ca1000               retf 0x10
loc_C3A0:
6:C3A0  b80100               mov ax, 1
6:C3A3  5e                   pop si
6:C3A4  5f                   pop di
6:C3A5  c9                   leave
6:C3A6  ca1000               retf 0x10
6:C3A9  db 00

; ---------------- sub_s6:C3AA FAR size=376 callers=3
6:C3AA  c8320000             enter 0x32, 0
6:C3AE  8d46fe               lea ax, [bp - 2]
6:C3B1  16                   push ss
6:C3B2  50                   push ax
6:C3B3  9aaebcfcc3           lcall 0xc3fc, 0xbcae  ; sub_s7:BCAE
6:C3B8  66ff760e             push dword ptr [bp + 0xe]
6:C3BC  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C3C1  90                   nop
6:C3C2  0e                   push cs
6:C3C3  e8261e               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C3C6  8946fa               mov word ptr [bp - 6], ax
6:C3C9  8956fc               mov word ptr [bp - 4], dx
6:C3CC  c45efa               les bx, ptr [bp - 6]
6:C3CF  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:C3D4  668946f6             mov dword ptr [bp - 0xa], eax
6:C3D8  66ff7612             push dword ptr [bp + 0x12]
6:C3DC  66ff760a             push dword ptr [bp + 0xa]
6:C3E0  6650                 push eax
6:C3E2  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C3E7  90                   nop
6:C3E8  0e                   push cs
6:C3E9  e8001e               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C3EC  8946f2               mov word ptr [bp - 0xe], ax
6:C3EF  8956f4               mov word ptr [bp - 0xc], dx
6:C3F2  52                   push dx
6:C3F3  50                   push ax
6:C3F4  8d46fe               lea ax, [bp - 2]
6:C3F7  16                   push ss
6:C3F8  50                   push ax
6:C3F9  9adebcafc4           lcall 0xc4af, 0xbcde  ; sub_s7:BCDE
6:C3FE  8946f0               mov word ptr [bp - 0x10], ax
6:C401  0bc0                 or ax, ax
6:C403  7d0d                 jge 0xc412
6:C405  c706ca50af06         mov word ptr [0x50ca], 0x6af
loc_C40B:
6:C40B  33c0                 xor ax, ax
6:C40D  c9                   leave
6:C40E  ca1000               retf 0x10
6:C411  db 90
loc_C412:
6:C412  3d1e00               cmp ax, 0x1e
6:C415  7e21                 jle 0xc438
6:C417  666809008700         push 0x870009
6:C41D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:C422  9aba2032c4           lcall 0xc432, 0x20ba  ; sub_s3:20BA
6:C427  8946ec               mov word ptr [bp - 0x14], ax
6:C42A  8956ee               mov word ptr [bp - 0x12], dx
6:C42D  52                   push dx
6:C42E  50                   push ax
6:C42F  9ad06516af           lcall 0xaf16, 0x65d0  ; sub_s3:65D0
6:C434  0bc0                 or ax, ax
6:C436  7408                 je 0xc440
loc_C438:
6:C438  b80100               mov ax, 1
6:C43B  c9                   leave
6:C43C  ca1000               retf 0x10
6:C43F  db 90
loc_C440:
6:C440  8b46f0               mov ax, word ptr [bp - 0x10]
6:C443  8946ea               mov word ptr [bp - 0x16], ax
6:C446  6a15                 push 0x15
6:C448  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:C44D  9afac65ac3           lcall 0xc35a, 0xc6fa  ; sub_s2:C6FA
6:C452  8946e6               mov word ptr [bp - 0x1a], ax
6:C455  8956e8               mov word ptr [bp - 0x18], dx
6:C458  52                   push dx
6:C459  50                   push ax
6:C45A  66ff76fa             push dword ptr [bp - 6]
6:C45E  9a6e4d4bc1           lcall 0xc14b, 0x4d6e  ; sub_s8:4D6E
6:C463  8946e2               mov word ptr [bp - 0x1e], ax
6:C466  8956e4               mov word ptr [bp - 0x1c], dx
6:C469  52                   push dx
6:C46A  c45ee2               les bx, ptr [bp - 0x1e]
6:C46D  50                   push ax
6:C46E  26c41f               les bx, ptr es:[bx]
6:C471  26ff5f10             lcall es:[bx + 0x10]
6:C475  8946de               mov word ptr [bp - 0x22], ax
6:C478  8956e0               mov word ptr [bp - 0x20], dx
6:C47B  66c746da00000000     mov dword ptr [bp - 0x26], 0
6:C483  eb0d                 jmp 0xc492
6:C485  db 90
loc_C486:
6:C486  3946ea               cmp word ptr [bp - 0x16], ax
6:C489  7e03                 jle 0xc48e
6:C48B  8946ea               mov word ptr [bp - 0x16], ax
loc_C48E:
6:C48E  66ff46da             inc dword ptr [bp - 0x26]
loc_C492:
6:C492  668b46de             mov eax, dword ptr [bp - 0x22]
6:C496  663946da             cmp dword ptr [bp - 0x26], eax
6:C49A  7356                 jae 0xc4f2
6:C49C  66ff7612             push dword ptr [bp + 0x12]
6:C4A0  66ff760a             push dword ptr [bp + 0xa]
6:C4A4  66ff76da             push dword ptr [bp - 0x26]
6:C4A8  66ff76e2             push dword ptr [bp - 0x1e]
6:C4AC  9a581dc1c4           lcall 0xc4c1, 0x1d58  ; sub_s7:1D58
6:C4B1  8946d6               mov word ptr [bp - 0x2a], ax
6:C4B4  8956d8               mov word ptr [bp - 0x28], dx
6:C4B7  52                   push dx
6:C4B8  50                   push ax
6:C4B9  8d46fe               lea ax, [bp - 2]
6:C4BC  16                   push ss
6:C4BD  50                   push ax
6:C4BE  9adebc33c3           lcall 0xc333, 0xbcde  ; sub_s7:BCDE
6:C4C3  8946f0               mov word ptr [bp - 0x10], ax
6:C4C6  0bc0                 or ax, ax
6:C4C8  7ebc                 jle 0xc486
6:C4CA  3d1e00               cmp ax, 0x1e
6:C4CD  7fb7                 jg 0xc486
6:C4CF  668b46e2             mov eax, dword ptr [bp - 0x1e]
6:C4D3  668946ce             mov dword ptr [bp - 0x32], eax
6:C4D7  668946d2             mov dword ptr [bp - 0x2e], eax
6:C4DB  660bc0               or eax, eax
6:C4DE  0f8456ff             je 0xc438
6:C4E2  6a01                 push 1
6:C4E4  c45ee2               les bx, ptr [bp - 0x1e]
6:C4E7  06                   push es
6:C4E8  50                   push ax
6:C4E9  26c41f               les bx, ptr es:[bx]
6:C4EC  26ff1f               lcall es:[bx]
6:C4EF  e946ff               jmp 0xc438
loc_C4F2:
6:C4F2  668b46e2             mov eax, dword ptr [bp - 0x1e]
6:C4F6  668946d2             mov dword ptr [bp - 0x2e], eax
6:C4FA  668946ce             mov dword ptr [bp - 0x32], eax
6:C4FE  660bc0               or eax, eax
6:C501  740d                 je 0xc510
6:C503  6a01                 push 1
6:C505  c45ee2               les bx, ptr [bp - 0x1e]
6:C508  06                   push es
6:C509  50                   push ax
6:C50A  26c41f               les bx, ptr es:[bx]
6:C50D  26ff1f               lcall es:[bx]
loc_C510:
6:C510  c706ca50b606         mov word ptr [0x50ca], 0x6b6
6:C516  8b46ea               mov ax, word ptr [bp - 0x16]
6:C519  2d1e00               sub ax, 0x1e
6:C51C  a3cc50               mov word ptr [0x50cc], ax
6:C51F  e9e9fe               jmp 0xc40b

; ---------------- sub_s6:C522 size=132 callers=0
6:C522  c8140000             enter 0x14, 0
6:C526  8d46fe               lea ax, [bp - 2]
6:C529  16                   push ss
6:C52A  50                   push ax
6:C52B  9aaebc74c5           lcall 0xc574, 0xbcae  ; sub_s7:BCAE
6:C530  66ff760e             push dword ptr [bp + 0xe]
6:C534  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C539  90                   nop
6:C53A  0e                   push cs
6:C53B  e8ae1c               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C53E  8946fa               mov word ptr [bp - 6], ax
6:C541  8956fc               mov word ptr [bp - 4], dx
6:C544  c45efa               les bx, ptr [bp - 6]
6:C547  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:C54C  668946f6             mov dword ptr [bp - 0xa], eax
6:C550  66ff7612             push dword ptr [bp + 0x12]
6:C554  66ff760a             push dword ptr [bp + 0xa]
6:C558  6650                 push eax
6:C55A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C55F  90                   nop
6:C560  0e                   push cs
6:C561  e8881c               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C564  8946f2               mov word ptr [bp - 0xe], ax
6:C567  8956f4               mov word ptr [bp - 0xc], dx
6:C56A  52                   push dx
6:C56B  50                   push ax
6:C56C  8d46fe               lea ax, [bp - 2]
6:C56F  16                   push ss
6:C570  50                   push ax
6:C571  9adebcb6c3           lcall 0xc3b6, 0xbcde  ; sub_s7:BCDE
6:C576  8946f0               mov word ptr [bp - 0x10], ax
6:C579  0bc0                 or ax, ax
6:C57B  7d0d                 jge 0xc58a
6:C57D  c706ca50af06         mov word ptr [0x50ca], 0x6af
loc_C583:
6:C583  33c0                 xor ax, ax
6:C585  c9                   leave
6:C586  ca1000               retf 0x10
6:C589  db 90
loc_C58A:
6:C58A  3d1e00               cmp ax, 0x1e
6:C58D  7e0f                 jle 0xc59e
6:C58F  c706ca50b606         mov word ptr [0x50ca], 0x6b6
6:C595  2d1e00               sub ax, 0x1e
6:C598  a3cc50               mov word ptr [0x50cc], ax
6:C59B  ebe6                 jmp 0xc583
6:C59D  db 90
loc_C59E:
6:C59E  b80100               mov ax, 1
6:C5A1  c9                   leave
6:C5A2  ca1000               retf 0x10
6:C5A5  db 00

; ---------------- sub_s6:C5A6 FAR size=164 callers=2
6:C5A6  c8160000             enter 0x16, 0
6:C5AA  66ff7610             push dword ptr [bp + 0x10]
6:C5AE  66ff760c             push dword ptr [bp + 0xc]
6:C5B2  66ff364057           push dword ptr [0x5740]
6:C5B7  9a7e620cc6           lcall 0xc60c, 0x627e  ; sub_s7:627E
6:C5BC  8956fe               mov word ptr [bp - 2], dx
6:C5BF  0bd0                 or dx, ax
6:C5C1  7507                 jne 0xc5ca
loc_C5C3:
6:C5C3  33c0                 xor ax, ax
6:C5C5  c9                   leave
6:C5C6  ca0e00               retf 0xe
6:C5C9  db 90
loc_C5CA:
6:C5CA  ff76fe               push word ptr [bp - 2]
6:C5CD  50                   push ax
6:C5CE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C5D3  90                   nop
6:C5D4  0e                   push cs
6:C5D5  e8141c               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C5D8  8946f8               mov word ptr [bp - 8], ax
6:C5DB  8956fa               mov word ptr [bp - 6], dx
6:C5DE  c45e0c               les bx, ptr [bp + 0xc]
6:C5E1  268b4704             mov ax, word ptr es:[bx + 4]
6:C5E5  c746f47a00           mov word ptr [bp - 0xc], 0x7a
6:C5EA  0bc0                 or ax, ax
6:C5EC  7e10                 jle 0xc5fe
6:C5EE  8b460a               mov ax, word ptr [bp + 0xa]
6:C5F1  2d7b00               sub ax, 0x7b
6:C5F4  744c                 je 0xc642
6:C5F6  48                   dec ax
6:C5F7  7441                 je 0xc63a
loc_C5F9:
6:C5F9  c746f47f00           mov word ptr [bp - 0xc], 0x7f
loc_C5FE:
6:C5FE  66837ef800           cmp dword ptr [bp - 8], 0
6:C603  74be                 je 0xc5c3
6:C605  66ff76f8             push dword ptr [bp - 8]
6:C609  9aa8732ec5           lcall 0xc52e, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:C60E  8946f0               mov word ptr [bp - 0x10], ax
6:C611  8956f2               mov word ptr [bp - 0xe], dx
6:C614  0bd0                 or dx, ax
6:C616  74ab                 je 0xc5c3
6:C618  c45ef0               les bx, ptr [bp - 0x10]
6:C61B  268b470c             mov ax, word ptr es:[bx + 0xc]
6:C61F  8946ee               mov word ptr [bp - 0x12], ax
6:C622  8b46f4               mov ax, word ptr [bp - 0xc]
6:C625  3946ee               cmp word ptr [bp - 0x12], ax
6:C628  7408                 je 0xc632
6:C62A  8b460a               mov ax, word ptr [bp + 0xa]
6:C62D  3946ee               cmp word ptr [bp - 0x12], ax
6:C630  7591                 jne 0xc5c3
loc_C632:
6:C632  b80100               mov ax, 1
6:C635  c9                   leave
6:C636  ca0e00               retf 0xe
6:C639  db 90
loc_C63A:
6:C63A  c7460a7d00           mov word ptr [bp + 0xa], 0x7d
6:C63F  ebb8                 jmp 0xc5f9
6:C641  db 90
loc_C642:
6:C642  c7460a7e00           mov word ptr [bp + 0xa], 0x7e
6:C647  ebb0                 jmp 0xc5f9
6:C649  db 00

; ---------------- sub_s6:C64A FAR size=218 callers=0
6:C64A  c8160000             enter 0x16, 0
6:C64E  57                   push di
6:C64F  56                   push si
6:C650  8b460a               mov ax, word ptr [bp + 0xa]
6:C653  8b560c               mov dx, word ptr [bp + 0xc]
6:C656  1e                   push ds
6:C657  8d7efa               lea di, [bp - 6]
6:C65A  8bf0                 mov si, ax
6:C65C  16                   push ss
6:C65D  07                   pop es
6:C65E  8eda                 mov ds, dx
6:C660  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:C662  a5                   movsw word ptr es:[di], word ptr [si]
6:C663  1f                   pop ds
6:C664  8d46fa               lea ax, [bp - 6]
6:C667  8946f2               mov word ptr [bp - 0xe], ax
6:C66A  8d46f8               lea ax, [bp - 8]
6:C66D  16                   push ss
6:C66E  50                   push ax
6:C66F  8d46f6               lea ax, [bp - 0xa]
6:C672  16                   push ss
6:C673  50                   push ax
6:C674  8d4ef4               lea cx, [bp - 0xc]
6:C677  16                   push ss
6:C678  51                   push cx
6:C679  8d4efa               lea cx, [bp - 6]
6:C67C  16                   push ss
6:C67D  51                   push cx
6:C67E  9ab43e50c4           lcall 0xc450, 0x3eb4  ; sub_s2:3EB4
6:C683  8b46f6               mov ax, word ptr [bp - 0xa]
6:C686  48                   dec ax
6:C687  8946ea               mov word ptr [bp - 0x16], ax
6:C68A  8946fc               mov word ptr [bp - 4], ax
6:C68D  66ff7612             push dword ptr [bp + 0x12]
6:C691  8d46fa               lea ax, [bp - 6]
6:C694  16                   push ss
6:C695  50                   push ax
6:C696  6a7b                 push 0x7b
6:C698  66ff7606             push dword ptr [bp + 6]
6:C69C  90                   nop
6:C69D  0e                   push cs
6:C69E  e805ff               call 0xc5a6  ; sub_s6:C5A6
6:C6A1  0bc0                 or ax, ax
6:C6A3  7409                 je 0xc6ae
loc_C6A5:
6:C6A5  b80100               mov ax, 1
6:C6A8  5e                   pop si
6:C6A9  5f                   pop di
6:C6AA  c9                   leave
6:C6AB  ca1000               retf 0x10
loc_C6AE:
6:C6AE  8b46f6               mov ax, word ptr [bp - 0xa]
6:C6B1  40                   inc ax
6:C6B2  8946f0               mov word ptr [bp - 0x10], ax
6:C6B5  8946fc               mov word ptr [bp - 4], ax
6:C6B8  66ff7612             push dword ptr [bp + 0x12]
6:C6BC  8d46fa               lea ax, [bp - 6]
6:C6BF  16                   push ss
6:C6C0  50                   push ax
6:C6C1  6a7b                 push 0x7b
6:C6C3  66ff7606             push dword ptr [bp + 6]
6:C6C7  90                   nop
6:C6C8  0e                   push cs
6:C6C9  e8dafe               call 0xc5a6  ; sub_s6:C5A6
6:C6CC  0bc0                 or ax, ax
6:C6CE  75d5                 jne 0xc6a5
6:C6D0  8b46f6               mov ax, word ptr [bp - 0xa]
6:C6D3  8946f0               mov word ptr [bp - 0x10], ax
6:C6D6  8946fc               mov word ptr [bp - 4], ax
6:C6D9  8b46f8               mov ax, word ptr [bp - 8]
6:C6DC  48                   dec ax
6:C6DD  8946f0               mov word ptr [bp - 0x10], ax
6:C6E0  8946fa               mov word ptr [bp - 6], ax
6:C6E3  66ff7612             push dword ptr [bp + 0x12]
6:C6E7  8d46fa               lea ax, [bp - 6]
6:C6EA  16                   push ss
6:C6EB  50                   push ax
6:C6EC  6a7c                 push 0x7c
6:C6EE  66ff7606             push dword ptr [bp + 6]
6:C6F2  90                   nop
6:C6F3  0e                   push cs
6:C6F4  e8affe               call 0xc5a6  ; sub_s6:C5A6
6:C6F7  0bc0                 or ax, ax
6:C6F9  75aa                 jne 0xc6a5
6:C6FB  8b46f8               mov ax, word ptr [bp - 8]
6:C6FE  40                   inc ax
6:C6FF  8946f0               mov word ptr [bp - 0x10], ax
6:C702  8946fa               mov word ptr [bp - 6], ax
6:C705  66ff7612             push dword ptr [bp + 0x12]
6:C709  8d46fa               lea ax, [bp - 6]
6:C70C  16                   push ss
6:C70D  50                   push ax
6:C70E  6a7c                 push 0x7c
6:C710  66ff7606             push dword ptr [bp + 6]
6:C714  90                   nop
6:C715  0e                   push cs
6:C716  e88dfe               call 0xc5a6  ; sub_s6:C5A6
6:C719  0bc0                 or ax, ax
6:C71B  7588                 jne 0xc6a5
6:C71D  5e                   pop si
6:C71E  5f                   pop di
6:C71F  c9                   leave
6:C720  ca1000               retf 0x10
6:C723  db 00

; ---------------- sub_s6:C724 FAR size=146 callers=1
6:C724  55                   push bp
6:C725  8bec                 mov bp, sp
6:C727  c45e06               les bx, ptr [bp + 6]
6:C72A  26c45f14             les bx, ptr es:[bx + 0x14]
6:C72E  2683bfac0000         cmp word ptr es:[bx + 0xac], 0
6:C734  757c                 jne 0xc7b2
6:C736  c45e06               les bx, ptr [bp + 6]
6:C739  26c45f14             les bx, ptr es:[bx + 0x14]
6:C73D  268b87a600           mov ax, word ptr es:[bx + 0xa6]
6:C742  3d0d00               cmp ax, 0xd
6:C745  743d                 je 0xc784
6:C747  7708                 ja 0xc751
6:C749  0ac0                 or al, al
6:C74B  7423                 je 0xc770
6:C74D  2c07                 sub al, 7
6:C74F  7411                 je 0xc762
loc_C751:
6:C751  c45e06               les bx, ptr [bp + 6]
6:C754  26c45f14             les bx, ptr es:[bx + 0x14]
6:C758  26c787ac000500       mov word ptr es:[bx + 0xac], 5
6:C75F  eb0f                 jmp 0xc770
6:C761  db 90
loc_C762:
6:C762  c45e06               les bx, ptr [bp + 6]
6:C765  26c45f14             les bx, ptr es:[bx + 0x14]
6:C769  26c787ac000a00       mov word ptr es:[bx + 0xac], 0xa
loc_C770:
6:C770  c45e06               les bx, ptr [bp + 6]
6:C773  26c45f14             les bx, ptr es:[bx + 0x14]
6:C777  2683bfac0000         cmp word ptr es:[bx + 0xac], 0
6:C77D  7415                 je 0xc794
6:C77F  c9                   leave
6:C780  ca0400               retf 4
6:C783  db 90
loc_C784:
6:C784  c45e06               les bx, ptr [bp + 6]
6:C787  26c45f14             les bx, ptr es:[bx + 0x14]
6:C78B  26c787ac000100       mov word ptr es:[bx + 0xac], 1
6:C792  ebdc                 jmp 0xc770
loc_C794:
6:C794  c45e06               les bx, ptr [bp + 6]
6:C797  26c45f14             les bx, ptr es:[bx + 0x14]
6:C79B  268b87a800           mov ax, word ptr es:[bx + 0xa8]
6:C7A0  0bc0                 or ax, ax
6:C7A2  740e                 je 0xc7b2
6:C7A4  c45e06               les bx, ptr [bp + 6]
6:C7A7  26c45f14             les bx, ptr es:[bx + 0x14]
6:C7AB  26c787ac000100       mov word ptr es:[bx + 0xac], 1
loc_C7B2:
6:C7B2  c9                   leave
6:C7B3  ca0400               retf 4

; ---------------- sub_s6:C7B6 FAR size=230 callers=13
6:C7B6  c81c0000             enter 0x1c, 0
6:C7BA  8d46f8               lea ax, [bp - 8]
6:C7BD  16                   push ss
6:C7BE  50                   push ax
6:C7BF  66ff760e             push dword ptr [bp + 0xe]
6:C7C3  66ff760a             push dword ptr [bp + 0xa]
6:C7C7  66ff364057           push dword ptr [0x5740]
6:C7CC  9ace640dc8           lcall 0xc80d, 0x64ce  ; sub_s7:64CE
6:C7D1  8bd8                 mov bx, ax
6:C7D3  8ec2                 mov es, dx
6:C7D5  66268b07             mov eax, dword ptr es:[bx]
6:C7D9  268b5702             mov dx, word ptr es:[bx + 2]
6:C7DD  668946fc             mov dword ptr [bp - 4], eax
6:C7E1  668946ee             mov dword ptr [bp - 0x12], eax
6:C7E5  668946e4             mov dword ptr [bp - 0x1c], eax
6:C7E9  8a46e7               mov al, byte ptr [bp - 0x19]
6:C7EC  2ae4                 sub ah, ah
6:C7EE  a8ff                 test al, 0xff
6:C7F0  0f849a00             je 0xc88e
6:C7F4  52                   push dx
6:C7F5  ff76fc               push word ptr [bp - 4]
6:C7F8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:C7FD  90                   nop
6:C7FE  0e                   push cs
6:C7FF  e8ea19               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:C802  8946e4               mov word ptr [bp - 0x1c], ax
6:C805  8956e6               mov word ptr [bp - 0x1a], dx
6:C808  52                   push dx
6:C809  50                   push ax
6:C80A  9aa873bac5           lcall 0xc5ba, 0x73a8  ; DbObj::resolveLink16@s7:73A8
6:C80F  8946e8               mov word ptr [bp - 0x18], ax
6:C812  8956ea               mov word ptr [bp - 0x16], dx
6:C815  0bd0                 or dx, ax
6:C817  7469                 je 0xc882
6:C819  c45ee8               les bx, ptr [bp - 0x18]
6:C81C  268b470c             mov ax, word ptr es:[bx + 0xc]
6:C820  8946ec               mov word ptr [bp - 0x14], ax
6:C823  eb3d                 jmp 0xc862
6:C825  db 90
loc_C826:
6:C826  b80100               mov ax, 1
6:C829  eb6d                 jmp 0xc898
6:C82B  db 90
loc_C82C:
6:C82C  b80200               mov ax, 2
6:C82F  eb67                 jmp 0xc898
6:C831  db 90
loc_C832:
6:C832  b80300               mov ax, 3
6:C835  eb61                 jmp 0xc898
6:C837  db 90
loc_C838:
6:C838  b80400               mov ax, 4
6:C83B  eb5b                 jmp 0xc898
6:C83D  db 90
loc_C83E:
6:C83E  b80500               mov ax, 5
6:C841  eb55                 jmp 0xc898
6:C843  db 90
loc_C844:
6:C844  b80700               mov ax, 7
6:C847  eb4f                 jmp 0xc898
6:C849  db 90
loc_C84A:
6:C84A  b80800               mov ax, 8
6:C84D  c9                   leave
6:C84E  ca0c00               retf 0xc
6:C851  db 90
loc_C852:
6:C852  b80900               mov ax, 9
6:C855  c9                   leave
6:C856  ca0c00               retf 0xc
6:C859  db 90
loc_C85A:
6:C85A  b80600               mov ax, 6
6:C85D  c9                   leave
6:C85E  ca0c00               retf 0xc
6:C861  db 90
loc_C862:
6:C862  48                   dec ax
6:C863  3d0800               cmp ax, 8
6:C866  772e                 ja 0xc896
6:C868  03c0                 add ax, ax
6:C86A  93                   xchg bx, ax
6:C86B  2effa770c8           jmp word ptr cs:[bx - 0x3790]
switch_table_C870:
    dw loc_C826
    dw loc_C82C
    dw loc_C832
    dw loc_C838
    dw loc_C83E
    dw loc_C844
    dw loc_C84A
    dw loc_C852
    dw loc_C85A
loc_C882:
6:C882  c45ee4               les bx, ptr [bp - 0x1c]
6:C885  268b4714             mov ax, word ptr es:[bx + 0x14]
6:C889  c9                   leave
6:C88A  ca0c00               retf 0xc
6:C88D  db 90
loc_C88E:
6:C88E  8b46fc               mov ax, word ptr [bp - 4]
6:C891  c9                   leave
6:C892  ca0c00               retf 0xc
6:C895  db 90
loc_C896:
6:C896  33c0                 xor ax, ax
loc_C898:
6:C898  c9                   leave
6:C899  ca0c00               retf 0xc

; ---------------- sub_s6:C89C FAR size=82 callers=2
6:C89C  c8140000             enter 0x14, 0
6:C8A0  66ff7606             push dword ptr [bp + 6]
6:C8A4  90                   nop
6:C8A5  0e                   push cs
6:C8A6  e8e5ec               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:C8A9  8946fc               mov word ptr [bp - 4], ax
6:C8AC  8956fe               mov word ptr [bp - 2], dx
6:C8AF  c45efc               les bx, ptr [bp - 4]
6:C8B2  66268b4708           mov eax, dword ptr es:[bx + 8]
6:C8B7  668946f8             mov dword ptr [bp - 8], eax
6:C8BB  8d46ec               lea ax, [bp - 0x14]
6:C8BE  16                   push ss
6:C8BF  50                   push ax
6:C8C0  66ff76f8             push dword ptr [bp - 8]
6:C8C4  66ff760a             push dword ptr [bp + 0xa]
6:C8C8  66ff364057           push dword ptr [0x5740]
6:C8CD  9ace64cfc7           lcall 0xc7cf, 0x64ce  ; sub_s7:64CE
6:C8D2  8bd8                 mov bx, ax
6:C8D4  8ec2                 mov es, dx
6:C8D6  66268b07             mov eax, dword ptr es:[bx]
6:C8DA  668946f4             mov dword ptr [bp - 0xc], eax
6:C8DE  c45e0e               les bx, ptr [bp + 0xe]
6:C8E1  66268907             mov dword ptr es:[bx], eax
6:C8E5  8bc3                 mov ax, bx
6:C8E7  8cc2                 mov dx, es
6:C8E9  c9                   leave
6:C8EA  ca0c00               retf 0xc
6:C8ED  db 00

; ---------------- sub_s6:C8EE FAR size=100 callers=6
6:C8EE  c8060000             enter 6, 0
6:C8F2  8d46fe               lea ax, [bp - 2]
6:C8F5  16                   push ss
6:C8F6  50                   push ax
6:C8F7  8d46fc               lea ax, [bp - 4]
6:C8FA  16                   push ss
6:C8FB  50                   push ax
6:C8FC  8d46fa               lea ax, [bp - 6]
6:C8FF  16                   push ss
loc_C900:
6:C900  50                   push ax
6:C901  66ff760c             push dword ptr [bp + 0xc]
6:C905  9ab43e4bc9           lcall 0xc94b, 0x3eb4  ; sub_s2:3EB4
6:C90A  8b460a               mov ax, word ptr [bp + 0xa]
6:C90D  eb1f                 jmp 0xc92e
6:C90F  db 90
loc_C910:
6:C910  ff46fa               inc word ptr [bp - 6]
6:C913  eb28                 jmp 0xc93d
6:C915  db 90
loc_C916:
6:C916  ff4efc               dec word ptr [bp - 4]
6:C919  eb22                 jmp 0xc93d
6:C91B  db 90
loc_C91C:
6:C91C  ff46fe               inc word ptr [bp - 2]
6:C91F  eb1c                 jmp 0xc93d
6:C921  db 90
loc_C922:
6:C922  ff46fc               inc word ptr [bp - 4]
6:C925  eb16                 jmp 0xc93d
6:C927  db 90
loc_C928:
6:C928  ff4efe               dec word ptr [bp - 2]
6:C92B  eb10                 jmp 0xc93d
6:C92D  db 90
loc_C92E:
6:C92E  48                   dec ax
6:C92F  74df                 je 0xc910
6:C931  48                   dec ax
6:C932  74e2                 je 0xc916
6:C934  48                   dec ax
6:C935  74eb                 je 0xc922
6:C937  48                   dec ax
6:C938  74e2                 je 0xc91c
6:C93A  48                   dec ax
6:C93B  74eb                 je 0xc928
loc_C93D:
6:C93D  66ff76fc             push dword ptr [bp - 4]
6:C941  ff76fa               push word ptr [bp - 6]
6:C944  66ff760c             push dword ptr [bp + 0xc]
6:C948  9a763e81c6           lcall 0xc681, 0x3e76  ; sub_s2:3E76
6:C94D  c9                   leave
6:C94E  ca0a00               retf 0xa
6:C951  db 00

; ---------------- sub_s6:C952 FAR size=434 callers=7
6:C952  c8260000             enter 0x26, 0
6:C956  57                   push di
6:C957  56                   push si
6:C958  c45e06               les bx, ptr [bp + 6]
6:C95B  66268b4714           mov eax, dword ptr es:[bx + 0x14]
6:C960  268b5716             mov dx, word ptr es:[bx + 0x16]
6:C964  668946fc             mov dword ptr [bp - 4], eax
6:C968  0bd0                 or dx, ax
6:C96A  0f849001             je 0xcafe
6:C96E  06                   push es
6:C96F  53                   push bx
6:C970  90                   nop
6:C971  0e                   push cs
6:C972  e819ec               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:C975  8946f8               mov word ptr [bp - 8], ax
6:C978  8956fa               mov word ptr [bp - 6], dx
6:C97B  c45ef8               les bx, ptr [bp - 8]
6:C97E  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:C983  268b5730             mov dx, word ptr es:[bx + 0x30]
6:C987  668946f4             mov dword ptr [bp - 0xc], eax
6:C98B  8bc2                 mov ax, dx
6:C98D  0b46f4               or ax, word ptr [bp - 0xc]
6:C990  0f846a01             je 0xcafe
6:C994  c45ef4               les bx, ptr [bp - 0xc]
6:C997  2683bf060200         cmp word ptr es:[bx + 0x206], 0
6:C99D  0f855d01             jne 0xcafe
6:C9A1  6a32                 push 0x32
6:C9A3  c45e06               les bx, ptr [bp + 6]
6:C9A6  26ff770c             push word ptr es:[bx + 0xc]
6:C9AA  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:C9AF  9aaec6f3c9           lcall 0xc9f3, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:C9B4  0bc0                 or ax, ax
6:C9B6  742a                 je 0xc9e2
6:C9B8  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:C9BC  66268b07             mov eax, dword ptr es:[bx]
6:C9C0  668946ea             mov dword ptr [bp - 0x16], eax
6:C9C4  66b90a000000         mov ecx, 0xa
6:C9CA  6633d2               xor edx, edx
6:C9CD  66f7f1               div ecx
6:C9D0  668bc2               mov eax, edx
6:C9D3  66c1ea10             shr edx, 0x10
6:C9D7  0bd0                 or dx, ax
6:C9D9  7543                 jne 0xca1e
6:C9DB  5e                   pop si
6:C9DC  5f                   pop di
6:C9DD  c9                   leave
6:C9DE  ca0400               retf 4
6:C9E1  db 90
loc_C9E2:
6:C9E2  6a33                 push 0x33
6:C9E4  c45e06               les bx, ptr [bp + 6]
6:C9E7  26ff770c             push word ptr es:[bx + 0xc]
6:C9EB  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
6:C9F0  9aaec608c9           lcall 0xc908, 0xc6ae  ; BldgGroups::contains@s2:C6AE
6:C9F5  0bc0                 or ax, ax
6:C9F7  7425                 je 0xca1e
6:C9F9  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:C9FD  66268b07             mov eax, dword ptr es:[bx]
6:CA01  668946e4             mov dword ptr [bp - 0x1c], eax
6:CA05  66b905000000         mov ecx, 5
6:CA0B  6633d2               xor edx, edx
6:CA0E  66f7f1               div ecx
6:CA11  668bc2               mov eax, edx
6:CA14  66c1ea10             shr edx, 0x10
6:CA18  0bd0                 or dx, ax
6:CA1A  0f84e000             je 0xcafe
loc_CA1E:
6:CA1E  c45ef4               les bx, ptr [bp - 0xc]
6:CA21  2683bf040200         cmp word ptr es:[bx + 0x204], 0
6:CA27  7455                 je 0xca7e
6:CA29  c45efc               les bx, ptr [bp - 4]
6:CA2C  268b878c00           mov ax, word ptr es:[bx + 0x8c]
6:CA31  268b978e00           mov dx, word ptr es:[bx + 0x8e]
6:CA36  8bda                 mov bx, dx
6:CA38  8946e4               mov word ptr [bp - 0x1c], ax
6:CA3B  8956e6               mov word ptr [bp - 0x1a], dx
6:CA3E  0bd0                 or dx, ax
6:CA40  740d                 je 0xca4f
6:CA42  6a23                 push 0x23
6:CA44  53                   push bx
6:CA45  50                   push ax
6:CA46  66ff76f4             push dword ptr [bp - 0xc]
6:CA4A  9ab85275ca           lcall 0xca75, 0x52b8  ; sub_s8:52B8
loc_CA4F:
6:CA4F  c45efc               les bx, ptr [bp - 4]
6:CA52  268b879000           mov ax, word ptr es:[bx + 0x90]
6:CA57  268b979200           mov dx, word ptr es:[bx + 0x92]
6:CA5C  8bda                 mov bx, dx
6:CA5E  8946e4               mov word ptr [bp - 0x1c], ax
6:CA61  8956e6               mov word ptr [bp - 0x1a], dx
6:CA64  0bd0                 or dx, ax
6:CA66  0f849400             je 0xcafe
6:CA6A  6a24                 push 0x24
6:CA6C  53                   push bx
6:CA6D  50                   push ax
6:CA6E  66ff76f4             push dword ptr [bp - 0xc]
6:CA72  9ab85290ca           lcall 0xca90, 0x52b8  ; sub_s8:52B8
6:CA77  5e                   pop si
6:CA78  5f                   pop di
6:CA79  c9                   leave
6:CA7A  ca0400               retf 4
6:CA7D  db 90
loc_CA7E:
6:CA7E  c746f20000           mov word ptr [bp - 0xe], 0
6:CA83  eb58                 jmp 0xcadd
6:CA85  db 90
loc_CA86:
6:CA86  ff76f2               push word ptr [bp - 0xe]
6:CA89  66ff76f4             push dword ptr [bp - 0xc]
6:CA8D  9a0a54baca           lcall 0xcaba, 0x540a  ; sub_s8:540A
6:CA92  8946ea               mov word ptr [bp - 0x16], ax
6:CA95  8956ec               mov word ptr [bp - 0x14], dx
6:CA98  668b46e4             mov eax, dword ptr [bp - 0x1c]
6:CA9C  8b56e6               mov dx, word ptr [bp - 0x1a]
6:CA9F  663946ea             cmp dword ptr [bp - 0x16], eax
6:CAA3  731d                 jae 0xcac2
6:CAA5  6a21                 push 0x21
6:CAA7  2b46ea               sub ax, word ptr [bp - 0x16]
6:CAAA  1b56ec               sbb dx, word ptr [bp - 0x14]
6:CAAD  52                   push dx
6:CAAE  50                   push ax
6:CAAF  66ff76f4             push dword ptr [bp - 0xc]
6:CAB3  8bf0                 mov si, ax
6:CAB5  8bfa                 mov di, dx
6:CAB7  9ab852d8ca           lcall 0xcad8, 0x52b8  ; sub_s8:52B8
6:CABC  2976e4               sub word ptr [bp - 0x1c], si
6:CABF  197ee6               sbb word ptr [bp - 0x1a], di
loc_CAC2:
6:CAC2  8b46e6               mov ax, word ptr [bp - 0x1a]
6:CAC5  0b46e4               or ax, word ptr [bp - 0x1c]
6:CAC8  7410                 je 0xcada
6:CACA  ff76f2               push word ptr [bp - 0xe]
6:CACD  66ff76e4             push dword ptr [bp - 0x1c]
6:CAD1  66ff76f4             push dword ptr [bp - 0xc]
6:CAD5  9ab85261c4           lcall 0xc461, 0x52b8  ; sub_s8:52B8
loc_CADA:
6:CADA  ff46f2               inc word ptr [bp - 0xe]
loc_CADD:
6:CADD  837ef225             cmp word ptr [bp - 0xe], 0x25
6:CAE1  7d1b                 jge 0xcafe
6:CAE3  8b5ef2               mov bx, word ptr [bp - 0xe]
6:CAE6  c1e302               shl bx, 2
6:CAE9  c476fc               les si, ptr [bp - 4]
6:CAEC  66268b00             mov eax, dword ptr es:[bx + si]
6:CAF0  268b5002             mov dx, word ptr es:[bx + si + 2]
6:CAF4  668946e4             mov dword ptr [bp - 0x1c], eax
6:CAF8  0bd0                 or dx, ax
6:CAFA  758a                 jne 0xca86
6:CAFC  ebdc                 jmp 0xcada
loc_CAFE:
6:CAFE  5e                   pop si
6:CAFF  5f                   pop di
6:CB00  c9                   leave
6:CB01  ca0400               retf 4

; ---------------- sub_s6:CB04 FAR size=460 callers=6
6:CB04  c8340000             enter 0x34, 0
6:CB08  56                   push si
6:CB09  c45e06               les bx, ptr [bp + 6]
6:CB0C  66268b4714           mov eax, dword ptr es:[bx + 0x14]
6:CB11  668946fc             mov dword ptr [bp - 4], eax
6:CB15  660bc0               or eax, eax
6:CB18  7508                 jne 0xcb22
loc_CB1A:
6:CB1A  33c0                 xor ax, ax
6:CB1C  5e                   pop si
6:CB1D  c9                   leave
6:CB1E  ca0400               retf 4
6:CB21  db 90
loc_CB22:
6:CB22  06                   push es
6:CB23  53                   push bx
6:CB24  90                   nop
6:CB25  0e                   push cs
6:CB26  e865ea               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:CB29  8946f8               mov word ptr [bp - 8], ax
6:CB2C  8956fa               mov word ptr [bp - 6], dx
6:CB2F  c45ef8               les bx, ptr [bp - 8]
6:CB32  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:CB37  268b5730             mov dx, word ptr es:[bx + 0x30]
6:CB3B  668946f4             mov dword ptr [bp - 0xc], eax
6:CB3F  8bc2                 mov ax, dx
6:CB41  0b46f4               or ax, word ptr [bp - 0xc]
6:CB44  74d4                 je 0xcb1a
6:CB46  c45ef4               les bx, ptr [bp - 0xc]
6:CB49  2683bf060200         cmp word ptr es:[bx + 0x206], 0
6:CB4F  7409                 je 0xcb5a
6:CB51  b80100               mov ax, 1
6:CB54  5e                   pop si
6:CB55  c9                   leave
6:CB56  ca0400               retf 4
6:CB59  db 90
loc_CB5A:
6:CB5A  2683bf040200         cmp word ptr es:[bx + 0x204], 0
6:CB60  0f84aa00             je 0xcc0e
6:CB64  c746e40100           mov word ptr [bp - 0x1c], 1
6:CB69  c45efc               les bx, ptr [bp - 4]
6:CB6C  66268b878c00         mov eax, dword ptr es:[bx + 0x8c]
6:CB72  668946dc             mov dword ptr [bp - 0x24], eax
6:CB76  6a23                 push 0x23
6:CB78  66ff76f4             push dword ptr [bp - 0xc]
6:CB7C  9a0a54dccb           lcall 0xcbdc, 0x540a  ; sub_s8:540A
6:CB81  3b56de               cmp dx, word ptr [bp - 0x22]
6:CB84  7740                 ja 0xcbc6
6:CB86  7205                 jb 0xcb8d
6:CB88  3b46dc               cmp ax, word ptr [bp - 0x24]
6:CB8B  7339                 jae 0xcbc6
loc_CB8D:
6:CB8D  6a23                 push 0x23
6:CB8F  8b4edc               mov cx, word ptr [bp - 0x24]
6:CB92  8b5ede               mov bx, word ptr [bp - 0x22]
6:CB95  2bc8                 sub cx, ax
6:CB97  1bda                 sbb bx, dx
6:CB99  53                   push bx
6:CB9A  51                   push cx
6:CB9B  66ff76f8             push dword ptr [bp - 8]
6:CB9F  9a7c7dffcb           lcall 0xcbff, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:CBA4  c746e40000           mov word ptr [bp - 0x1c], 0
6:CBA9  6a2b                 push 0x2b
6:CBAB  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:CBB0  9aba20c4cb           lcall 0xcbc4, 0x20ba  ; sub_s3:20BA
6:CBB5  6a12                 push 0x12  ; 'version %d %d'
6:CBB7  c45ef4               les bx, ptr [bp - 0xc]
6:CBBA  6626ff7704           push dword ptr es:[bx + 4]
6:CBBF  52                   push dx
6:CBC0  50                   push ax
6:CBC1  9a3a0455cc           lcall 0xcc55, 0x43a  ; sub_s3:043A
loc_CBC6:
6:CBC6  c45efc               les bx, ptr [bp - 4]
6:CBC9  66268b879000         mov eax, dword ptr es:[bx + 0x90]
6:CBCF  668946dc             mov dword ptr [bp - 0x24], eax
6:CBD3  6a24                 push 0x24
6:CBD5  66ff76f4             push dword ptr [bp - 0xc]
6:CBD9  9a0a5415cc           lcall 0xcc15, 0x540a  ; sub_s8:540A
6:CBDE  3b56de               cmp dx, word ptr [bp - 0x22]
6:CBE1  7723                 ja 0xcc06
6:CBE3  7205                 jb 0xcbea
6:CBE5  3b46dc               cmp ax, word ptr [bp - 0x24]
6:CBE8  731c                 jae 0xcc06
loc_CBEA:
6:CBEA  6a24                 push 0x24
6:CBEC  8b4edc               mov cx, word ptr [bp - 0x24]
6:CBEF  8b5ede               mov bx, word ptr [bp - 0x22]
6:CBF2  2bc8                 sub cx, ax
6:CBF4  1bda                 sbb bx, dx
6:CBF6  53                   push bx
6:CBF7  51                   push cx
6:CBF8  66ff76f8             push dword ptr [bp - 8]
6:CBFC  9a7c7d3ecc           lcall 0xcc3e, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:CC01  c746e40000           mov word ptr [bp - 0x1c], 0
loc_CC06:
6:CC06  8b46e4               mov ax, word ptr [bp - 0x1c]
6:CC09  5e                   pop si
6:CC0A  c9                   leave
6:CC0B  ca0400               retf 4
loc_CC0E:
6:CC0E  6a21                 push 0x21
6:CC10  52                   push dx
6:CC11  53                   push bx
6:CC12  9a0a548ccc           lcall 0xcc8c, 0x540a  ; sub_s8:540A
6:CC17  8946f0               mov word ptr [bp - 0x10], ax
6:CC1A  8956f2               mov word ptr [bp - 0xe], dx
6:CC1D  c746ee0100           mov word ptr [bp - 0x12], 1
6:CC22  c746ec1100           mov word ptr [bp - 0x14], 0x11
6:CC27  eb42                 jmp 0xcc6b
6:CC29  db 90
loc_CC2A:
6:CC2A  ff76ec               push word ptr [bp - 0x14]
6:CC2D  668b46cc             mov eax, dword ptr [bp - 0x34]
6:CC31  662b46d0             sub eax, dword ptr [bp - 0x30]
6:CC35  6650                 push eax
6:CC37  66ff76f8             push dword ptr [bp - 8]
6:CC3B  9a7c7dd0c8           lcall 0xc8d0, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:CC40  c746ee0000           mov word ptr [bp - 0x12], 0
6:CC45  837eec23             cmp word ptr [bp - 0x14], 0x23
6:CC49  751d                 jne 0xcc68
6:CC4B  6a2b                 push 0x2b
6:CC4D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:CC52  9aba2066cc           lcall 0xcc66, 0x20ba  ; sub_s3:20BA
6:CC57  6a12                 push 0x12  ; 'version %d %d'
6:CC59  c45ef4               les bx, ptr [bp - 0xc]
6:CC5C  6626ff7704           push dword ptr es:[bx + 4]
6:CC61  52                   push dx
6:CC62  50                   push ax
6:CC63  9a3a0425c4           lcall 0xc425, 0x43a  ; sub_s3:043A
loc_CC68:
6:CC68  ff46ec               inc word ptr [bp - 0x14]
loc_CC6B:
6:CC6B  837eec25             cmp word ptr [bp - 0x14], 0x25
6:CC6F  7d57                 jge 0xccc8
6:CC71  8b5eec               mov bx, word ptr [bp - 0x14]
6:CC74  c1e302               shl bx, 2
6:CC77  c476fc               les si, ptr [bp - 4]
6:CC7A  66268b00             mov eax, dword ptr es:[bx + si]
6:CC7E  668946cc             mov dword ptr [bp - 0x34], eax
6:CC82  ff76ec               push word ptr [bp - 0x14]
6:CC85  66ff76f4             push dword ptr [bp - 0xc]
6:CC89  9a0a544dca           lcall 0xca4d, 0x540a  ; sub_s8:540A
6:CC8E  8946d0               mov word ptr [bp - 0x30], ax
6:CC91  8956d2               mov word ptr [bp - 0x2e], dx
6:CC94  668b46cc             mov eax, dword ptr [bp - 0x34]
6:CC98  8b56ce               mov dx, word ptr [bp - 0x32]
6:CC9B  663946d0             cmp dword ptr [bp - 0x30], eax
6:CC9F  73c7                 jae 0xcc68
6:CCA1  837eec23             cmp word ptr [bp - 0x14], 0x23
6:CCA5  7483                 je 0xcc2a
6:CCA7  837eec24             cmp word ptr [bp - 0x14], 0x24
6:CCAB  0f847bff             je 0xcc2a
6:CCAF  3b56f2               cmp dx, word ptr [bp - 0xe]
6:CCB2  0f8774ff             ja 0xcc2a
6:CCB6  7207                 jb 0xccbf
6:CCB8  3b46f0               cmp ax, word ptr [bp - 0x10]
6:CCBB  0f876bff             ja 0xcc2a
loc_CCBF:
6:CCBF  2946f0               sub word ptr [bp - 0x10], ax
6:CCC2  1956f2               sbb word ptr [bp - 0xe], dx
6:CCC5  eba1                 jmp 0xcc68
6:CCC7  db 90
loc_CCC8:
6:CCC8  8b46ee               mov ax, word ptr [bp - 0x12]
6:CCCB  5e                   pop si
6:CCCC  c9                   leave
6:CCCD  ca0400               retf 4

; ---------------- sub_s6:CCD0 FAR size=514 callers=3
6:CCD0  c87e0100             enter 0x17e, 0
6:CCD4  8d46fe               lea ax, [bp - 2]
6:CCD7  16                   push ss
6:CCD8  50                   push ax
6:CCD9  8d46fc               lea ax, [bp - 4]
6:CCDC  16                   push ss
6:CCDD  50                   push ax
6:CCDE  8d46fa               lea ax, [bp - 6]
6:CCE1  16                   push ss
6:CCE2  50                   push ax
6:CCE3  66ff760a             push dword ptr [bp + 0xa]
6:CCE7  9ab43e79cd           lcall 0xcd79, 0x3eb4  ; sub_s2:3EB4
6:CCEC  66ff7606             push dword ptr [bp + 6]
6:CCF0  90                   nop
6:CCF1  0e                   push cs
6:CCF2  e899e8               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:CCF5  8946ee               mov word ptr [bp - 0x12], ax
6:CCF8  8956f0               mov word ptr [bp - 0x10], dx
6:CCFB  c45eee               les bx, ptr [bp - 0x12]
6:CCFE  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
6:CD03  668946ea             mov dword ptr [bp - 0x16], eax
6:CD07  c45eea               les bx, ptr [bp - 0x16]
6:CD0A  66268b4704           mov eax, dword ptr es:[bx + 4]
6:CD0F  668946e6             mov dword ptr [bp - 0x1a], eax
6:CD13  8d46e4               lea ax, [bp - 0x1c]
6:CD16  16                   push ss
6:CD17  50                   push ax
6:CD18  8d46e2               lea ax, [bp - 0x1e]
6:CD1B  16                   push ss
6:CD1C  50                   push ax
6:CD1D  66ff7606             push dword ptr [bp + 6]
6:CD21  90                   nop
6:CD22  0e                   push cs
6:CD23  e8d2f4               call 0xc1f8  ; sub_s6:C1F8
6:CD26  8b46fe               mov ax, word ptr [bp - 2]
6:CD29  48                   dec ax
6:CD2A  8946f8               mov word ptr [bp - 8], ax
6:CD2D  8b4efe               mov cx, word ptr [bp - 2]
6:CD30  41                   inc cx
6:CD31  894ef4               mov word ptr [bp - 0xc], cx
6:CD34  8b4efc               mov cx, word ptr [bp - 4]
6:CD37  49                   dec cx
6:CD38  894ef6               mov word ptr [bp - 0xa], cx
6:CD3B  8b4efc               mov cx, word ptr [bp - 4]
6:CD3E  41                   inc cx
6:CD3F  894ef2               mov word ptr [bp - 0xe], cx
6:CD42  0bc0                 or ax, ax
6:CD44  7d05                 jge 0xcd4b
6:CD46  c746f80000           mov word ptr [bp - 8], 0
loc_CD4B:
6:CD4B  8b46f4               mov ax, word ptr [bp - 0xc]
6:CD4E  3946e4               cmp word ptr [bp - 0x1c], ax
6:CD51  7f07                 jg 0xcd5a
6:CD53  8b46e4               mov ax, word ptr [bp - 0x1c]
6:CD56  48                   dec ax
6:CD57  8946f4               mov word ptr [bp - 0xc], ax
loc_CD5A:
6:CD5A  837ef600             cmp word ptr [bp - 0xa], 0
6:CD5E  7d05                 jge 0xcd65
6:CD60  c746f60000           mov word ptr [bp - 0xa], 0
loc_CD65:
6:CD65  394ee2               cmp word ptr [bp - 0x1e], cx
6:CD68  7f07                 jg 0xcd71
6:CD6A  8b46e2               mov ax, word ptr [bp - 0x1e]
6:CD6D  48                   dec ax
6:CD6E  8946f2               mov word ptr [bp - 0xe], ax
loc_CD71:
6:CD71  8d46d6               lea ax, [bp - 0x2a]
6:CD74  16                   push ss
6:CD75  50                   push ax
6:CD76  9a906c91cd           lcall 0xcd91, 0x6c90  ; sub_s2:6C90
6:CD7B  66ff76f6             push dword ptr [bp - 0xa]
6:CD7F  ff76fa               push word ptr [bp - 6]
6:CD82  66ff76f2             push dword ptr [bp - 0xe]
6:CD86  ff76fa               push word ptr [bp - 6]
6:CD89  8d46d6               lea ax, [bp - 0x2a]
6:CD8C  16                   push ss
6:CD8D  50                   push ax
6:CD8E  9aec6cf2cd           lcall 0xcdf2, 0x6cec  ; sub_s2:6CEC
6:CD93  6a2f                 push 0x2f
6:CD95  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:CD9A  9aba20b3cb           lcall 0xcbb3, 0x20ba  ; sub_s3:20BA
6:CD9F  8946d2               mov word ptr [bp - 0x2e], ax
6:CDA2  8956d4               mov word ptr [bp - 0x2c], dx
6:CDA5  c45ed2               les bx, ptr [bp - 0x2e]
6:CDA8  66268b4720           mov eax, dword ptr es:[bx + 0x20]
6:CDAD  668946ce             mov dword ptr [bp - 0x32], eax
6:CDB1  6650                 push eax
6:CDB3  8d46d6               lea ax, [bp - 0x2a]
6:CDB6  16                   push ss
6:CDB7  50                   push ax
6:CDB8  66ff364057           push dword ptr [0x5740]
6:CDBD  9a22651ece           lcall 0xce1e, 0x6522  ; sub_s7:6522
6:CDC2  8946ca               mov word ptr [bp - 0x36], ax
6:CDC5  8956cc               mov word ptr [bp - 0x34], dx
6:CDC8  0bd0                 or dx, ax
6:CDCA  0f840001             je 0xcece
6:CDCE  662bc0               sub eax, eax
6:CDD1  668946c6             mov dword ptr [bp - 0x3a], eax
6:CDD5  8946c4               mov word ptr [bp - 0x3c], ax
6:CDD8  8b46f6               mov ax, word ptr [bp - 0xa]
6:CDDB  8946c2               mov word ptr [bp - 0x3e], ax
6:CDDE  e9dc00               jmp 0xcebd
6:CDE1  db 90
loc_CDE2:
6:CDE2  ff76ba               push word ptr [bp - 0x46]
6:CDE5  ff76c2               push word ptr [bp - 0x3e]
6:CDE8  ff76fa               push word ptr [bp - 6]
6:CDEB  66ff760a             push dword ptr [bp + 0xa]
6:CDEF  9a763e2ace           lcall 0xce2a, 0x3e76  ; sub_s2:3E76
6:CDF4  66ff76ce             push dword ptr [bp - 0x32]
6:CDF8  66ff76e6             push dword ptr [bp - 0x1a]
6:CDFC  66ff760a             push dword ptr [bp + 0xa]
6:CE00  6a06                 push 6
loc_CE02:
6:CE02  666a00               push 0
6:CE05  8d868afe             lea ax, [bp - 0x176]
6:CE09  16                   push ss
6:CE0A  50                   push ax
6:CE0B  90                   nop
6:CE0C  0e                   push cs
6:CE0D  e8e0b9               call 0x87f0  ; SCInternalPutBldg@s6:87F0
6:CE10  8d868afe             lea ax, [bp - 0x176]
6:CE14  16                   push ss
6:CE15  50                   push ax
6:CE16  66ff364857           push dword ptr [0x5748]  ; g_sim
6:CE1B  9a5a83a2cb           lcall 0xcba2, 0x835a  ; Sim::enqueue@s7:835A
6:CE20  c7868afe9a38         mov word ptr [bp - 0x176], 0x389a
6:CE26  c7868cfe82ce         mov word ptr [bp - 0x174], 0xce82  ; SEGMENT s2:0000
loc_CE2C:
6:CE2C  ff46ba               inc word ptr [bp - 0x46]
loc_CE2F:
6:CE2F  8b46f4               mov ax, word ptr [bp - 0xc]
6:CE32  3946ba               cmp word ptr [bp - 0x46], ax
6:CE35  0f8f8100             jg 0xceba
6:CE39  8b46c4               mov ax, word ptr [bp - 0x3c]
6:CE3C  ff46c4               inc word ptr [bp - 0x3c]
6:CE3F  99                   cdq
6:CE40  52                   push dx
6:CE41  50                   push ax
6:CE42  c45eca               les bx, ptr [bp - 0x36]
6:CE45  06                   push es
6:CE46  53                   push bx
6:CE47  26c41f               les bx, ptr es:[bx]
6:CE4A  26ff5f04             lcall es:[bx + 4]
6:CE4E  8946c6               mov word ptr [bp - 0x3a], ax
6:CE51  8956c8               mov word ptr [bp - 0x38], dx
6:CE54  8a46c9               mov al, byte ptr [bp - 0x37]
6:CE57  2ae4                 sub ah, ah
6:CE59  a8ff                 test al, 0xff
6:CE5B  75cf                 jne 0xce2c
6:CE5D  8b46c6               mov ax, word ptr [bp - 0x3a]
6:CE60  8946ae               mov word ptr [bp - 0x52], ax
6:CE63  2d0700               sub ax, 7
6:CE66  0f8478ff             je 0xcde2
6:CE6A  48                   dec ax
6:CE6B  7405                 je 0xce72
6:CE6D  48                   dec ax
6:CE6E  7426                 je 0xce96
6:CE70  ebba                 jmp 0xce2c
loc_CE72:
6:CE72  ff76ba               push word ptr [bp - 0x46]
6:CE75  ff76c2               push word ptr [bp - 0x3e]
6:CE78  ff76fa               push word ptr [bp - 6]
6:CE7B  66ff760a             push dword ptr [bp + 0xa]
6:CE7F  9a763ea6ce           lcall 0xcea6, 0x3e76  ; sub_s2:3E76
6:CE84  66ff76ce             push dword ptr [bp - 0x32]
6:CE88  66ff76e6             push dword ptr [bp - 0x1a]
6:CE8C  66ff760a             push dword ptr [bp + 0xa]
6:CE90  6a07                 push 7
6:CE92  e96dff               jmp 0xce02
6:CE95  db 90
loc_CE96:
6:CE96  ff76ba               push word ptr [bp - 0x46]
6:CE99  ff76c2               push word ptr [bp - 0x3e]
6:CE9C  ff76fa               push word ptr [bp - 6]
6:CE9F  66ff760a             push dword ptr [bp + 0xa]
6:CEA3  9a763eb2c9           lcall 0xc9b2, 0x3e76  ; sub_s2:3E76
6:CEA8  66ff76ce             push dword ptr [bp - 0x32]
6:CEAC  66ff76e6             push dword ptr [bp - 0x1a]
6:CEB0  66ff760a             push dword ptr [bp + 0xa]
6:CEB4  6a08                 push 8
6:CEB6  e949ff               jmp 0xce02
6:CEB9  db 90
loc_CEBA:
6:CEBA  ff46c2               inc word ptr [bp - 0x3e]
loc_CEBD:
6:CEBD  8b46f2               mov ax, word ptr [bp - 0xe]
6:CEC0  3946c2               cmp word ptr [bp - 0x3e], ax
6:CEC3  7f09                 jg 0xcece
6:CEC5  8b46f8               mov ax, word ptr [bp - 8]
6:CEC8  8946ba               mov word ptr [bp - 0x46], ax
6:CECB  e961ff               jmp 0xce2f
loc_CECE:
6:CECE  c9                   leave
6:CECF  ca0800               retf 8

; ---------------- sub_s6:CED2 size=114 callers=0
6:CED2  c8060000             enter 6, 0
6:CED6  c746fe0000           mov word ptr [bp - 2], 0
6:CEDB  c45e06               les bx, ptr [bp + 6]
6:CEDE  26f6471a02           test byte ptr es:[bx + 0x1a], 2
6:CEE3  751b                 jne 0xcf00
6:CEE5  666800002300         push 0x230000
6:CEEB  6a01                 push 1
6:CEED  06                   push es
6:CEEE  53                   push bx
6:CEEF  90                   nop
6:CEF0  0e                   push cs
6:CEF1  e89ae6               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:CEF4  52                   push dx
6:CEF5  50                   push ax
6:CEF6  9a7c7d1ecf           lcall 0xcf1e, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:CEFB  c746fe0100           mov word ptr [bp - 2], 1
loc_CF00:
6:CF00  c45e06               les bx, ptr [bp + 6]
6:CF03  26f6471a01           test byte ptr es:[bx + 0x1a], 1
6:CF08  751b                 jne 0xcf25
6:CF0A  666800000e00         push 0xe0000
6:CF10  6a01                 push 1
6:CF12  06                   push es
6:CF13  53                   push bx
6:CF14  90                   nop
6:CF15  0e                   push cs
6:CF16  e875e6               call 0xb58e  ; DbObj::getOwner@s6:B58E
6:CF19  52                   push dx
6:CF1A  50                   push ax
6:CF1B  9a7c7dc0cd           lcall 0xcdc0, 0x7d7c  ; Tile::setAlloc(value,res)@s7:7D7C
6:CF20  c746fe0100           mov word ptr [bp - 2], 1
loc_CF25:
6:CF25  837efe00             cmp word ptr [bp - 2], 0
6:CF29  7411                 je 0xcf3c
6:CF2B  6a06                 push 6
6:CF2D  66ff7606             push dword ptr [bp + 6]
6:CF31  90                   nop
6:CF32  0e                   push cs
6:CF33  e876ee               call 0xbdac  ; sub_s6:BDAC
6:CF36  33c0                 xor ax, ax
6:CF38  c9                   leave
6:CF39  ca0400               retf 4
loc_CF3C:
6:CF3C  b80100               mov ax, 1
6:CF3F  c9                   leave
6:CF40  ca0400               retf 4
6:CF43  db 00

; ---------------- sub_s6:CF44 FAR size=142 callers=0
6:CF44  55                   push bp
6:CF45  8bec                 mov bp, sp
6:CF47  66ff7606             push dword ptr [bp + 6]
6:CF4B  90                   nop
6:CF4C  0e                   push cs
6:CF4D  e8c8e4               call 0xb418  ; sub_s6:B418
6:CF50  f6460a01             test byte ptr [bp + 0xa], 1
6:CF54  7409                 je 0xcf5f
6:CF56  66ff7606             push dword ptr [bp + 6]
6:CF5A  9ace17fabd           lcall 0xbdfa, 0x17ce  ; operator_delete@s1:17CE
loc_CF5F:
6:CF5F  8b4606               mov ax, word ptr [bp + 6]
6:CF62  8b5608               mov dx, word ptr [bp + 8]
6:CF65  c9                   leave
6:CF66  ca0600               retf 6
6:CF69  db 90 44 cf 70 cf 56 bb 78 cf 8e 17 f9 ce ec b5 7c
6:CF79  db cf 1a b8 80 cf 1c bc 84 cf 38 bd 88 cf 90 bc 8c
6:CF89  db cf 7e bc 90 cf 14 b5 94 cf 2a be 98 cf 16 bf 9c
6:CF99  db cf 1a bf a0 cf 1e bf a4 cf 9e be a8 cf 22 bf ac
6:CFA9  db cf f0 bb b0 cf 02 bc b4 cf a8 b5 b8 cf ca b5 bc
6:CFB9  db cf e6 b4 c0 cf ec b4 c4 cf 6e b4 c8 cf 4a c6 cc
6:CFC9  db cf 22 c5 d0 cf d2 ce 28 b4

; ---------------- sub_s6:CFD2 FAR size=32 callers=1
6:CFD2  55                   push bp
6:CFD3  8bec                 mov bp, sp
6:CFD5  668b460a             mov eax, dword ptr [bp + 0xa]
6:CFD9  c45e06               les bx, ptr [bp + 6]
6:CFDC  66268907             mov dword ptr es:[bx], eax
6:CFE0  6626c7470400000000   mov dword ptr es:[bx + 4], 0
6:CFE9  8bc3                 mov ax, bx
6:CFEB  8cc2                 mov dx, es
6:CFED  c9                   leave
6:CFEE  ca0800               retf 8
6:CFF1  db 00

; ---------------- sub_s6:CFF2 FAR size=40 callers=1
6:CFF2  c8080000             enter 8, 0
6:CFF6  c45e06               les bx, ptr [bp + 6]
6:CFF9  268b4704             mov ax, word ptr es:[bx + 4]
6:CFFD  268b5706             mov dx, word ptr es:[bx + 6]
6:D001  8bda                 mov bx, dx
6:D003  0bd8                 or bx, ax
6:D005  740e                 je 0xd015
6:D007  6a01                 push 1
6:D009  52                   push dx
6:D00A  50                   push ax
6:D00B  8ec2                 mov es, dx
6:D00D  8bd8                 mov bx, ax
6:D00F  26c41f               les bx, ptr es:[bx]
6:D012  26ff1f               lcall es:[bx]
loc_D015:
6:D015  c9                   leave
6:D016  ca0400               retf 4
6:D019  db 00

; ---------------- StepQueue::runAll@s6:D01A FAR size=94 callers=2
6:D01A  c8200000             enter 0x20, 0
6:D01E  57                   push di
6:D01F  56                   push si
6:D020  c45e06               les bx, ptr [bp + 6]
6:D023  26c41f               les bx, ptr es:[bx]
6:D026  66268b07             mov eax, dword ptr es:[bx]
6:D02A  668946fc             mov dword ptr [bp - 4], eax
6:D02E  c45efc               les bx, ptr [bp - 4]
6:D031  66268b07             mov eax, dword ptr es:[bx]
6:D035  668946f8             mov dword ptr [bp - 8], eax
loc_D039:
6:D039  66ff76f8             push dword ptr [bp - 8]
6:D03D  90                   nop
6:D03E  0e                   push cs
6:D03F  e8e606               call 0xd728  ; StepQueue::popHead@s6:D728
6:D042  8946f4               mov word ptr [bp - 0xc], ax
6:D045  8956f6               mov word ptr [bp - 0xa], dx
6:D048  0bd0                 or dx, ax
6:D04A  7426                 je 0xd072
6:D04C  c45ef4               les bx, ptr [bp - 0xc]
6:D04F  06                   push es
6:D050  50                   push ax
6:D051  26c41f               les bx, ptr es:[bx]
6:D054  8bf3                 mov si, bx
6:D056  8cc7                 mov di, es
6:D058  26ff5f04             lcall es:[bx + 4]
6:D05C  668b46f4             mov eax, dword ptr [bp - 0xc]
6:D060  660bc0               or eax, eax
6:D063  74d4                 je 0xd039
6:D065  6a01                 push 1
6:D067  ff76f6               push word ptr [bp - 0xa]
6:D06A  50                   push ax
6:D06B  8ec7                 mov es, di
6:D06D  26ff1c               lcall es:[si]
6:D070  ebc7                 jmp 0xd039
loc_D072:
6:D072  5e                   pop si
6:D073  5f                   pop di
6:D074  c9                   leave
6:D075  ca0400               retf 4

; ---------------- sub_s6:D078 FAR size=250 callers=1
6:D078  c8200000             enter 0x20, 0
6:D07C  c45e06               les bx, ptr [bp + 6]
6:D07F  268b4704             mov ax, word ptr es:[bx + 4]
6:D083  268b5706             mov dx, word ptr es:[bx + 6]
6:D087  8bda                 mov bx, dx
6:D089  8946f0               mov word ptr [bp - 0x10], ax
6:D08C  8956f2               mov word ptr [bp - 0xe], dx
6:D08F  8946f4               mov word ptr [bp - 0xc], ax
6:D092  8956f6               mov word ptr [bp - 0xa], dx
6:D095  0bd8                 or bx, ax
6:D097  740e                 je 0xd0a7
6:D099  6a01                 push 1
6:D09B  52                   push dx
6:D09C  50                   push ax
6:D09D  8ec2                 mov es, dx
6:D09F  8bd8                 mov bx, ax
6:D0A1  26c41f               les bx, ptr es:[bx]
6:D0A4  26ff1f               lcall es:[bx]
loc_D0A7:
6:D0A7  6a1c                 push 0x1c
6:D0A9  9a9c175dcf           lcall 0xcf5d, 0x179c  ; operator_new@s1:179C
6:D0AE  83c402               add sp, 2
6:D0B1  8946f0               mov word ptr [bp - 0x10], ax
6:D0B4  8956f2               mov word ptr [bp - 0xe], dx
6:D0B7  0bd0                 or dx, ax
6:D0B9  7411                 je 0xd0cc
6:D0BB  666a24               push 0x24
6:D0BE  666a06               push 6
6:D0C1  ff76f2               push word ptr [bp - 0xe]
6:D0C4  50                   push ax
6:D0C5  9a9e8e21d1           lcall 0xd121, 0x8e9e  ; sub_s2:8E9E
6:D0CA  eb03                 jmp 0xd0cf
loc_D0CC:
6:D0CC  33c0                 xor ax, ax
6:D0CE  99                   cdq
loc_D0CF:
6:D0CF  c45e06               les bx, ptr [bp + 6]
6:D0D2  26894704             mov word ptr es:[bx + 4], ax
6:D0D6  26895706             mov word ptr es:[bx + 6], dx
6:D0DA  66ff760a             push dword ptr [bp + 0xa]
6:D0DE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
6:D0E3  90                   nop
6:D0E4  0e                   push cs
6:D0E5  e80411               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:D0E8  8946fc               mov word ptr [bp - 4], ax
6:D0EB  8956fe               mov word ptr [bp - 2], dx
6:D0EE  0bd0                 or dx, ax
6:D0F0  7550                 jne 0xd142
6:D0F2  8d46ec               lea ax, [bp - 0x14]
6:D0F5  16                   push ss
6:D0F6  50                   push ax
6:D0F7  9af6dc0cd1           lcall 0xd10c, 0xdcf6  ; sub_s4:DCF6
6:D0FC  666800000a00         push 0xa0000
6:D102  6a00                 push 0
6:D104  8d46ec               lea ax, [bp - 0x14]
6:D107  16                   push ss
6:D108  50                   push ax
6:D109  9a1edda897           lcall 0x97a8, 0xdd1e  ; sub_s4:DD1E
6:D10E  8946e8               mov word ptr [bp - 0x18], ax
6:D111  8956ea               mov word ptr [bp - 0x16], dx
6:D114  52                   push dx
6:D115  50                   push ax
6:D116  c45e06               les bx, ptr [bp + 6]
6:D119  6626ff7704           push dword ptr es:[bx + 4]
6:D11E  9aaa8f3bd1           lcall 0xd13b, 0x8faa  ; sub_s2:8FAA
6:D123  c45e06               les bx, ptr [bp + 6]
6:D126  66268b4704           mov eax, dword ptr es:[bx + 4]
6:D12B  268b5706             mov dx, word ptr es:[bx + 6]
6:D12F  668946f4             mov dword ptr [bp - 0xc], eax
6:D133  c746ec9a38           mov word ptr [bp - 0x14], 0x389a
6:D138  c746eeeacc           mov word ptr [bp - 0x12], 0xccea  ; SEGMENT s2:0000
6:D13D  c9                   leave
6:D13E  ca0800               retf 8
6:D141  db 90
loc_D142:
6:D142  ff76fe               push word ptr [bp - 2]
6:D145  50                   push ax
6:D146  9a5e567fcb           lcall 0xcb7f, 0x565e  ; sub_s8:565E
6:D14B  8946f8               mov word ptr [bp - 8], ax
6:D14E  8956fa               mov word ptr [bp - 6], dx
6:D151  0bd0                 or dx, ax
6:D153  740d                 je 0xd162
6:D155  ff76fa               push word ptr [bp - 6]
6:D158  50                   push ax
6:D159  66ff7606             push dword ptr [bp + 6]
6:D15D  90                   nop
6:D15E  0e                   push cs
6:D15F  e81000               call 0xd172  ; sub_s6:D172
loc_D162:
6:D162  c45e06               les bx, ptr [bp + 6]
6:D165  268b4704             mov ax, word ptr es:[bx + 4]
6:D169  268b5706             mov dx, word ptr es:[bx + 6]
6:D16D  c9                   leave
6:D16E  ca0800               retf 8
6:D171  db 00

; ---------------- sub_s6:D172 FAR size=106 callers=1
6:D172  c8180000             enter 0x18, 0
6:D176  8d46fc               lea ax, [bp - 4]
6:D179  16                   push ss
6:D17A  50                   push ax
6:D17B  9af6dcb4d1           lcall 0xd1b4, 0xdcf6  ; sub_s4:DCF6
6:D180  66ff760a             push dword ptr [bp + 0xa]
6:D184  8d46f4               lea ax, [bp - 0xc]
6:D187  16                   push ss
6:D188  50                   push ax
6:D189  9a845796d1           lcall 0xd196, 0x5784  ; ListIter::ListIter@s2:5784
loc_D18E:
6:D18E  8d46f4               lea ax, [bp - 0xc]
6:D191  16                   push ss
6:D192  50                   push ax
6:D193  9a125bc9d1           lcall 0xd1c9, 0x5b12  ; ListIter::next@s2:5B12
6:D198  8946f0               mov word ptr [bp - 0x10], ax
6:D19B  8956f2               mov word ptr [bp - 0xe], dx
6:D19E  0bd0                 or dx, ax
6:D1A0  742c                 je 0xd1ce
6:D1A2  c45ef0               les bx, ptr [bp - 0x10]
6:D1A5  26ff7704             push word ptr es:[bx + 4]
6:D1A9  666a00               push 0
6:D1AC  8d46fc               lea ax, [bp - 4]
6:D1AF  16                   push ss
6:D1B0  50                   push ax
6:D1B1  9a1eddfad0           lcall 0xd0fa, 0xdd1e  ; sub_s4:DD1E
6:D1B6  8946ec               mov word ptr [bp - 0x14], ax
6:D1B9  8956ee               mov word ptr [bp - 0x12], dx
6:D1BC  52                   push dx
6:D1BD  50                   push ax
6:D1BE  c45e06               les bx, ptr [bp + 6]
6:D1C1  6626ff7704           push dword ptr es:[bx + 4]
6:D1C6  9aaa8fd6d1           lcall 0xd1d6, 0x8faa  ; sub_s2:8FAA
6:D1CB  ebc1                 jmp 0xd18e
6:D1CD  db 90
loc_D1CE:
6:D1CE  c746fc9a38           mov word ptr [bp - 4], 0x389a
6:D1D3  c746fec8d0           mov word ptr [bp - 2], 0xd0c8  ; SEGMENT s2:0000
6:D1D8  c9                   leave
6:D1D9  ca0800               retf 8

; ---------------- SCBase::SCBase@s6:D1DC FAR size=70 callers=35
6:D1DC  c8040000             enter 4, 0
6:D1E0  c45e06               les bx, ptr [bp + 6]
6:D1E3  26c7079a38           mov word ptr es:[bx], 0x389a
6:D1E8  26c747028cd1         mov word ptr es:[bx + 2], 0xd18c  ; SEGMENT s2:0000
6:D1EE  8b460a               mov ax, word ptr [bp + 0xa]
6:D1F1  c45e06               les bx, ptr [bp + 6]
6:D1F4  26894704             mov word ptr es:[bx + 4], ax
6:D1F8  26c747060000         mov word ptr es:[bx + 6], 0
6:D1FE  26c707d26a           mov word ptr es:[bx], 0x6ad2
6:D203  26c747026ccf         mov word ptr es:[bx + 2], 0xcf6c  ; SEGMENT s6:0000
6:D209  1e                   push ds
6:D20A  686051               push 0x5160  ; 'ctor'
6:D20D  8d4708               lea ax, [bx + 8]
6:D210  06                   push es
6:D211  50                   push ax
6:D212  9a9c3facd0           lcall 0xd0ac, 0x3f9c  ; _fsprintf@s1:3F9C
6:D217  8b4606               mov ax, word ptr [bp + 6]
6:D21A  8b5608               mov dx, word ptr [bp + 8]
6:D21D  c9                   leave
6:D21E  ca0600               retf 6
6:D221  db 00

; ---------------- SCBase::calcMe_default@s6:D222 FAR size=6 callers=0
6:D222  b80100               mov ax, 1
6:D225  ca0400               retf 4

; ---------------- SCBase::shouldRun_default@s6:D228 FAR size=6 callers=0
6:D228  b80100               mov ax, 1
6:D22B  ca0400               retf 4

; ---------------- sub_s6:D22E FAR size=84 callers=1
6:D22E  c8040000             enter 4, 0
6:D232  c45e06               les bx, ptr [bp + 6]
6:D235  6626c70700000000     mov dword ptr es:[bx], 0
6:D23D  668b460a             mov eax, dword ptr [bp + 0xa]
6:D241  6626894704           mov dword ptr es:[bx + 4], eax
6:D246  6a0c                 push 0xc
6:D248  9a9c1715d2           lcall 0xd215, 0x179c  ; operator_new@s1:179C
6:D24D  83c402               add sp, 2
6:D250  8956fe               mov word ptr [bp - 2], dx
6:D253  0bd0                 or dx, ax
6:D255  7415                 je 0xd26c
6:D257  ff76fe               push word ptr [bp - 2]
6:D25A  50                   push ax
6:D25B  90                   nop
6:D25C  0e                   push cs
6:D25D  e83c03               call 0xd59c  ; sub_s6:D59C
6:D260  c45e06               les bx, ptr [bp + 6]
6:D263  268907               mov word ptr es:[bx], ax
6:D266  26895702             mov word ptr es:[bx + 2], dx
6:D26A  eb0b                 jmp 0xd277
loc_D26C:
6:D26C  c45e06               les bx, ptr [bp + 6]
6:D26F  6626c70700000000     mov dword ptr es:[bx], 0
loc_D277:
6:D277  8b4606               mov ax, word ptr [bp + 6]
6:D27A  8b5608               mov dx, word ptr [bp + 8]
6:D27D  c9                   leave
6:D27E  ca0800               retf 8
6:D281  db 00

; ---------------- sub_s6:D282 FAR size=46 callers=1
6:D282  c8100000             enter 0x10, 0
6:D286  c45e06               les bx, ptr [bp + 6]
6:D289  268b07               mov ax, word ptr es:[bx]
6:D28C  268b5702             mov dx, word ptr es:[bx + 2]
6:D290  8bda                 mov bx, dx
6:D292  8946fc               mov word ptr [bp - 4], ax
6:D295  8956fe               mov word ptr [bp - 2], dx
6:D298  0bd8                 or bx, ax
6:D29A  7410                 je 0xd2ac
6:D29C  52                   push dx
6:D29D  50                   push ax
6:D29E  90                   nop
6:D29F  0e                   push cs
6:D2A0  e8b503               call 0xd658  ; sub_s6:D658
6:D2A3  66ff76fc             push dword ptr [bp - 4]
6:D2A7  9ace174bd2           lcall 0xd24b, 0x17ce  ; operator_delete@s1:17CE
loc_D2AC:
6:D2AC  c9                   leave
6:D2AD  ca0400               retf 4

; ---------------- Sim::enqueueTurnSteps@s6:D2B0 FAR size=636 callers=2
6:D2B0  c8160100             enter 0x116, 0
6:D2B4  68803e               push 0x3e80
6:D2B7  8d86f6fe             lea ax, [bp - 0x10a]
6:D2BB  16                   push ss
6:D2BC  50                   push ax
6:D2BD  90                   nop
6:D2BE  0e                   push cs
6:D2BF  e8a0c9               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D2C2  8d86f6fe             lea ax, [bp - 0x10a]
6:D2C6  16                   push ss
6:D2C7  50                   push ax
6:D2C8  66ff7606             push dword ptr [bp + 6]
6:D2CC  90                   nop
6:D2CD  0e                   push cs
6:D2CE  e89502               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D2D1  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D2D7  c786f8fe04d3         mov word ptr [bp - 0x108], 0xd304  ; SEGMENT s2:0000
6:D2DD  68983a               push 0x3a98
6:D2E0  8d86f6fe             lea ax, [bp - 0x10a]
6:D2E4  16                   push ss
6:D2E5  50                   push ax
6:D2E6  90                   nop
6:D2E7  0e                   push cs
6:D2E8  e877c9               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D2EB  8d86f6fe             lea ax, [bp - 0x10a]
6:D2EF  16                   push ss
6:D2F0  50                   push ax
6:D2F1  66ff7606             push dword ptr [bp + 6]
6:D2F5  90                   nop
6:D2F6  0e                   push cs
6:D2F7  e86c02               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D2FA  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D300  c786f8fe2dd3         mov word ptr [bp - 0x108], 0xd32d  ; SEGMENT s2:0000
6:D306  68b036               push 0x36b0
6:D309  8d86f6fe             lea ax, [bp - 0x10a]
6:D30D  16                   push ss
6:D30E  50                   push ax
6:D30F  90                   nop
6:D310  0e                   push cs
6:D311  e84ec9               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D314  8d86f6fe             lea ax, [bp - 0x10a]
6:D318  16                   push ss
6:D319  50                   push ax
6:D31A  66ff7606             push dword ptr [bp + 6]
6:D31E  90                   nop
6:D31F  0e                   push cs
6:D320  e84302               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D323  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D329  c786f8fe56d3         mov word ptr [bp - 0x108], 0xd356  ; SEGMENT s2:0000
6:D32F  68c832               push 0x32c8
6:D332  8d86f6fe             lea ax, [bp - 0x10a]
6:D336  16                   push ss
6:D337  50                   push ax
6:D338  90                   nop
6:D339  0e                   push cs
6:D33A  e825c9               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D33D  8d86f6fe             lea ax, [bp - 0x10a]
6:D341  16                   push ss
6:D342  50                   push ax
6:D343  66ff7606             push dword ptr [bp + 6]
6:D347  90                   nop
6:D348  0e                   push cs
6:D349  e81a02               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D34C  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D352  c786f8fe7fd3         mov word ptr [bp - 0x108], 0xd37f  ; SEGMENT s2:0000
6:D358  68e02e               push 0x2ee0
6:D35B  8d86f6fe             lea ax, [bp - 0x10a]
6:D35F  16                   push ss
6:D360  50                   push ax
6:D361  90                   nop
6:D362  0e                   push cs
6:D363  e8fcc8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D366  8d86f6fe             lea ax, [bp - 0x10a]
6:D36A  16                   push ss
6:D36B  50                   push ax
6:D36C  66ff7606             push dword ptr [bp + 6]
6:D370  90                   nop
6:D371  0e                   push cs
6:D372  e8f101               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D375  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D37B  c786f8fea8d3         mov word ptr [bp - 0x108], 0xd3a8  ; SEGMENT s2:0000
6:D381  68f82a               push 0x2af8
6:D384  8d86f6fe             lea ax, [bp - 0x10a]
6:D388  16                   push ss
6:D389  50                   push ax
6:D38A  90                   nop
6:D38B  0e                   push cs
6:D38C  e8d3c8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D38F  8d86f6fe             lea ax, [bp - 0x10a]
6:D393  16                   push ss
6:D394  50                   push ax
6:D395  66ff7606             push dword ptr [bp + 6]
6:D399  90                   nop
6:D39A  0e                   push cs
6:D39B  e8c801               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D39E  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D3A4  c786f8fed1d3         mov word ptr [bp - 0x108], 0xd3d1  ; SEGMENT s2:0000
6:D3AA  681027               push 0x2710
6:D3AD  8d86f6fe             lea ax, [bp - 0x10a]
6:D3B1  16                   push ss
6:D3B2  50                   push ax
6:D3B3  90                   nop
6:D3B4  0e                   push cs
6:D3B5  e8aac8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D3B8  8d86f6fe             lea ax, [bp - 0x10a]
6:D3BC  16                   push ss
6:D3BD  50                   push ax
6:D3BE  66ff7606             push dword ptr [bp + 6]
6:D3C2  90                   nop
6:D3C3  0e                   push cs
6:D3C4  e89f01               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D3C7  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D3CD  c786f8fefad3         mov word ptr [bp - 0x108], 0xd3fa  ; SEGMENT s2:0000
6:D3D3  682823               push 0x2328
6:D3D6  8d86f6fe             lea ax, [bp - 0x10a]
6:D3DA  16                   push ss
6:D3DB  50                   push ax
6:D3DC  90                   nop
6:D3DD  0e                   push cs
6:D3DE  e881c8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D3E1  8d86f6fe             lea ax, [bp - 0x10a]
6:D3E5  16                   push ss
6:D3E6  50                   push ax
6:D3E7  66ff7606             push dword ptr [bp + 6]
6:D3EB  90                   nop
6:D3EC  0e                   push cs
6:D3ED  e87601               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D3F0  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D3F6  c786f8fe23d4         mov word ptr [bp - 0x108], 0xd423  ; SEGMENT s2:0000
6:D3FC  68401f               push 0x1f40
6:D3FF  8d86f6fe             lea ax, [bp - 0x10a]
6:D403  16                   push ss
6:D404  50                   push ax
6:D405  90                   nop
6:D406  0e                   push cs
6:D407  e858c8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D40A  8d86f6fe             lea ax, [bp - 0x10a]
6:D40E  16                   push ss
6:D40F  50                   push ax
6:D410  66ff7606             push dword ptr [bp + 6]
6:D414  90                   nop
6:D415  0e                   push cs
6:D416  e84d01               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D419  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D41F  c786f8fe4cd4         mov word ptr [bp - 0x108], 0xd44c  ; SEGMENT s2:0000
6:D425  68581b               push 0x1b58
6:D428  8d86f6fe             lea ax, [bp - 0x10a]
6:D42C  16                   push ss
6:D42D  50                   push ax
6:D42E  90                   nop
6:D42F  0e                   push cs
6:D430  e82fc8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D433  8d86f6fe             lea ax, [bp - 0x10a]
6:D437  16                   push ss
6:D438  50                   push ax
6:D439  66ff7606             push dword ptr [bp + 6]
6:D43D  90                   nop
6:D43E  0e                   push cs
6:D43F  e82401               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D442  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D448  c786f8fe75d4         mov word ptr [bp - 0x108], 0xd475  ; SEGMENT s2:0000
6:D44E  687017               push 0x1770
6:D451  8d86f6fe             lea ax, [bp - 0x10a]
6:D455  16                   push ss
6:D456  50                   push ax
6:D457  90                   nop
6:D458  0e                   push cs
6:D459  e806c8               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D45C  8d86f6fe             lea ax, [bp - 0x10a]
6:D460  16                   push ss
6:D461  50                   push ax
6:D462  66ff7606             push dword ptr [bp + 6]
6:D466  90                   nop
6:D467  0e                   push cs
6:D468  e8fb00               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D46B  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D471  c786f8fe9ed4         mov word ptr [bp - 0x108], 0xd49e  ; SEGMENT s2:0000
6:D477  688813               push 0x1388
6:D47A  8d86f6fe             lea ax, [bp - 0x10a]
6:D47E  16                   push ss
6:D47F  50                   push ax
6:D480  90                   nop
6:D481  0e                   push cs
6:D482  e8ddc7               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D485  8d86f6fe             lea ax, [bp - 0x10a]
6:D489  16                   push ss
6:D48A  50                   push ax
6:D48B  66ff7606             push dword ptr [bp + 6]
6:D48F  90                   nop
6:D490  0e                   push cs
6:D491  e8d200               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D494  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D49A  c786f8fec7d4         mov word ptr [bp - 0x108], 0xd4c7  ; SEGMENT s2:0000
6:D4A0  68a00f               push 0xfa0
6:D4A3  8d86f6fe             lea ax, [bp - 0x10a]
6:D4A7  16                   push ss
6:D4A8  50                   push ax
6:D4A9  90                   nop
6:D4AA  0e                   push cs
6:D4AB  e8b4c7               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D4AE  8d86f6fe             lea ax, [bp - 0x10a]
6:D4B2  16                   push ss
6:D4B3  50                   push ax
6:D4B4  66ff7606             push dword ptr [bp + 6]
6:D4B8  90                   nop
6:D4B9  0e                   push cs
6:D4BA  e8a900               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D4BD  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D4C3  c786f8fef0d4         mov word ptr [bp - 0x108], 0xd4f0  ; SEGMENT s2:0000
6:D4C9  68b80b               push 0xbb8
6:D4CC  8d86f6fe             lea ax, [bp - 0x10a]
6:D4D0  16                   push ss
6:D4D1  50                   push ax
6:D4D2  90                   nop
6:D4D3  0e                   push cs
6:D4D4  e88bc7               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D4D7  8d86f6fe             lea ax, [bp - 0x10a]
6:D4DB  16                   push ss
6:D4DC  50                   push ax
6:D4DD  66ff7606             push dword ptr [bp + 6]
6:D4E1  90                   nop
6:D4E2  0e                   push cs
6:D4E3  e88000               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D4E6  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D4EC  c786f8fe19d5         mov word ptr [bp - 0x108], 0xd519  ; SEGMENT s2:0000
6:D4F2  68e803               push 0x3e8
6:D4F5  8d86f6fe             lea ax, [bp - 0x10a]
6:D4F9  16                   push ss
6:D4FA  50                   push ax
6:D4FB  90                   nop
6:D4FC  0e                   push cs
6:D4FD  e862c7               call 0x9c62  ; SCStep::SCStep(type)@s6:9C62
6:D500  8d86f6fe             lea ax, [bp - 0x10a]
6:D504  16                   push ss
6:D505  50                   push ax
6:D506  66ff7606             push dword ptr [bp + 6]
6:D50A  90                   nop
6:D50B  0e                   push cs
6:D50C  e85700               call 0xd566  ; StepQueue::enqueueIfShouldRun@s6:D566
6:D50F  c786f6fe9a38         mov word ptr [bp - 0x10a], 0x389a
6:D515  c786f8feecd1         mov word ptr [bp - 0x108], 0xd1ec  ; SEGMENT s2:0000
6:D51B  c45e06               les bx, ptr [bp + 6]
6:D51E  6626ff37             push dword ptr es:[bx]
6:D522  90                   nop
6:D523  0e                   push cs
6:D524  e88b01               call 0xd6b2  ; sub_s6:D6B2
6:D527  c9                   leave
6:D528  ca0400               retf 4
6:D52B  db 00

; ---------------- sub_s6:D52C FAR size=58 callers=2
6:D52C  55                   push bp
6:D52D  8bec                 mov bp, sp
6:D52F  c45e0e               les bx, ptr [bp + 0xe]
6:D532  06                   push es
6:D533  53                   push bx
6:D534  26c41f               les bx, ptr es:[bx]
6:D537  26ff5f08             lcall es:[bx + 8]
6:D53B  0bc0                 or ax, ax
6:D53D  7418                 je 0xd557
6:D53F  66ff760e             push dword ptr [bp + 0xe]
6:D543  66ff760a             push dword ptr [bp + 0xa]
6:D547  c45e06               les bx, ptr [bp + 6]
6:D54A  6626ff37             push dword ptr es:[bx]
6:D54E  90                   nop
6:D54F  0e                   push cs
6:D550  e82302               call 0xd776  ; sub_s6:D776
6:D553  0bc0                 or ax, ax
6:D555  7507                 jne 0xd55e
loc_D557:
6:D557  33c0                 xor ax, ax
6:D559  c9                   leave
6:D55A  ca0c00               retf 0xc
6:D55D  db 90
loc_D55E:
6:D55E  b80100               mov ax, 1
6:D561  c9                   leave
6:D562  ca0c00               retf 0xc
6:D565  db 00

; ---------------- StepQueue::enqueueIfShouldRun@s6:D566 FAR size=54 callers=3
6:D566  55                   push bp
6:D567  8bec                 mov bp, sp
6:D569  c45e0a               les bx, ptr [bp + 0xa]
6:D56C  06                   push es
6:D56D  53                   push bx
6:D56E  26c41f               les bx, ptr es:[bx]
6:D571  26ff5f08             lcall es:[bx + 8]
6:D575  0bc0                 or ax, ax
6:D577  7414                 je 0xd58d
6:D579  66ff760a             push dword ptr [bp + 0xa]
6:D57D  c45e06               les bx, ptr [bp + 6]
6:D580  6626ff37             push dword ptr es:[bx]
6:D584  90                   nop
6:D585  0e                   push cs
6:D586  e8b901               call 0xd742  ; StepQueue::insertClone@s6:D742
6:D589  0bc0                 or ax, ax
6:D58B  7507                 jne 0xd594
loc_D58D:
6:D58D  33c0                 xor ax, ax
6:D58F  c9                   leave
6:D590  ca0800               retf 8
6:D593  db 90
loc_D594:
6:D594  b80100               mov ax, 1
6:D597  c9                   leave
6:D598  ca0800               retf 8
6:D59B  db 00

; ---------------- sub_s6:D59C FAR size=188 callers=1
6:D59C  c80c0000             enter 0xc, 0
6:D5A0  c45e06               les bx, ptr [bp + 6]
6:D5A3  662bc0               sub eax, eax
6:D5A6  66268907             mov dword ptr es:[bx], eax
6:D5AA  6626894704           mov dword ptr es:[bx + 4], eax
6:D5AF  6626894708           mov dword ptr es:[bx + 8], eax
6:D5B4  c41e4857             les bx, ptr [0x5748]  ; g_sim
6:D5B8  66268b07             mov eax, dword ptr es:[bx]
6:D5BC  c45e06               les bx, ptr [bp + 6]
6:D5BF  66268907             mov dword ptr es:[bx], eax
6:D5C3  6a0c                 push 0xc
6:D5C5  9a9c170dd6           lcall 0xd60d, 0x179c  ; operator_new@s1:179C
6:D5CA  83c402               add sp, 2
6:D5CD  8946f4               mov word ptr [bp - 0xc], ax
6:D5D0  8956f6               mov word ptr [bp - 0xa], dx
6:D5D3  0bd0                 or dx, ax
6:D5D5  7425                 je 0xd5fc
6:D5D7  ff76f6               push word ptr [bp - 0xa]
6:D5DA  50                   push ax
6:D5DB  9a4a5723d6           lcall 0xd623, 0x574a  ; sub_s2:574A
6:D5E0  c45ef4               les bx, ptr [bp - 0xc]
6:D5E3  26c70704d8           mov word ptr es:[bx], 0xd804
6:D5E8  26c7470231d6         mov word ptr es:[bx + 2], 0xd631  ; SEGMENT s6:0000
6:D5EE  668b46f4             mov eax, dword ptr [bp - 0xc]
6:D5F2  c45e06               les bx, ptr [bp + 6]
6:D5F5  6626894704           mov dword ptr es:[bx + 4], eax
6:D5FA  eb0c                 jmp 0xd608
loc_D5FC:
6:D5FC  c45e06               les bx, ptr [bp + 6]
6:D5FF  6626c7470400000000   mov dword ptr es:[bx + 4], 0
loc_D608:
6:D608  6a0c                 push 0xc
6:D60A  9a9c17aad2           lcall 0xd2aa, 0x179c  ; operator_new@s1:179C
6:D60F  83c402               add sp, 2
6:D612  8946f4               mov word ptr [bp - 0xc], ax
6:D615  8956f6               mov word ptr [bp - 0xa], dx
6:D618  0bd0                 or dx, ax
6:D61A  7426                 je 0xd642
6:D61C  ff76f6               push word ptr [bp - 0xa]
6:D61F  50                   push ax
6:D620  9a4a57dbd2           lcall 0xd2db, 0x574a  ; sub_s2:574A
6:D625  c45ef4               les bx, ptr [bp - 0xc]
6:D628  26c70704d8           mov word ptr es:[bx], 0xd804
6:D62D  26c7470207d2         mov word ptr es:[bx + 2], 0xd207  ; SEGMENT s6:0000
6:D633  668b46f4             mov eax, dword ptr [bp - 0xc]
6:D637  c45e06               les bx, ptr [bp + 6]
6:D63A  6626894708           mov dword ptr es:[bx + 8], eax
6:D63F  eb0d                 jmp 0xd64e
6:D641  db 90
loc_D642:
6:D642  c45e06               les bx, ptr [bp + 6]
6:D645  6626c7470800000000   mov dword ptr es:[bx + 8], 0
loc_D64E:
6:D64E  8b4606               mov ax, word ptr [bp + 6]
6:D651  8b5608               mov dx, word ptr [bp + 8]
6:D654  c9                   leave
6:D655  ca0400               retf 4

; ---------------- sub_s6:D658 FAR size=70 callers=1
6:D658  c8080000             enter 8, 0
6:D65C  c45e06               les bx, ptr [bp + 6]
6:D65F  268b4704             mov ax, word ptr es:[bx + 4]
6:D663  268b5706             mov dx, word ptr es:[bx + 6]
6:D667  8bda                 mov bx, dx
6:D669  0bd8                 or bx, ax
6:D66B  740e                 je 0xd67b
6:D66D  6a01                 push 1
6:D66F  52                   push dx
6:D670  50                   push ax
6:D671  8ec2                 mov es, dx
6:D673  8bd8                 mov bx, ax
6:D675  26c41f               les bx, ptr es:[bx]
6:D678  26ff1f               lcall es:[bx]
loc_D67B:
6:D67B  c45e06               les bx, ptr [bp + 6]
6:D67E  268b4708             mov ax, word ptr es:[bx + 8]
6:D682  268b570a             mov dx, word ptr es:[bx + 0xa]
6:D686  8bda                 mov bx, dx
6:D688  0bd8                 or bx, ax
6:D68A  740e                 je 0xd69a
6:D68C  6a01                 push 1
6:D68E  52                   push dx
6:D68F  50                   push ax
6:D690  8ec2                 mov es, dx
6:D692  8bd8                 mov bx, ax
6:D694  26c41f               les bx, ptr es:[bx]
6:D697  26ff1f               lcall es:[bx]
loc_D69A:
6:D69A  c9                   leave
6:D69B  ca0400               retf 4

; ---------------- sub_s6:D69E FAR size=20 callers=1
6:D69E  c8060000             enter 6, 0
6:D6A2  c45e06               les bx, ptr [bp + 6]
6:D6A5  26c45f04             les bx, ptr es:[bx + 4]
6:D6A9  268b4708             mov ax, word ptr es:[bx + 8]
6:D6AD  c9                   leave
6:D6AE  ca0400               retf 4
6:D6B1  db 00

; ---------------- sub_s6:D6B2 FAR size=118 callers=1
6:D6B2  c81c0000             enter 0x1c, 0
6:D6B6  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:D6BA  66268b07             mov eax, dword ptr es:[bx]
6:D6BE  668946fc             mov dword ptr [bp - 4], eax
loc_D6C2:
6:D6C2  c45e06               les bx, ptr [bp + 6]
6:D6C5  6626ff7708           push dword ptr es:[bx + 8]
6:D6CA  9a60c80c96           lcall 0x960c, 0xc860  ; sub_s5:C860
6:D6CF  8946f8               mov word ptr [bp - 8], ax
6:D6D2  8956fa               mov word ptr [bp - 6], dx
6:D6D5  0bd0                 or dx, ax
6:D6D7  744b                 je 0xd724
6:D6D9  668b46fc             mov eax, dword ptr [bp - 4]
6:D6DD  c45ef8               les bx, ptr [bp - 8]
6:D6E0  662639470c           cmp dword ptr es:[bx + 0xc], eax
6:D6E5  773d                 ja 0xd724
6:D6E7  c45e06               les bx, ptr [bp + 6]
6:D6EA  6626ff7708           push dword ptr es:[bx + 8]
6:D6EF  26c45f08             les bx, ptr es:[bx + 8]
6:D6F3  26c41f               les bx, ptr es:[bx]
6:D6F6  26ff5f10             lcall es:[bx + 0x10]
6:D6FA  8946f4               mov word ptr [bp - 0xc], ax
6:D6FD  8956f6               mov word ptr [bp - 0xa], dx
6:D700  52                   push dx
6:D701  50                   push ax
6:D702  66ff7606             push dword ptr [bp + 6]
6:D706  90                   nop
6:D707  0e                   push cs
6:D708  e83700               call 0xd742  ; StepQueue::insertClone@s6:D742
6:D70B  668b46f4             mov eax, dword ptr [bp - 0xc]
6:D70F  660bc0               or eax, eax
6:D712  74ae                 je 0xd6c2
6:D714  6a01                 push 1
6:D716  c45ef4               les bx, ptr [bp - 0xc]
6:D719  06                   push es
6:D71A  50                   push ax
6:D71B  26c41f               les bx, ptr es:[bx]
6:D71E  26ff1f               lcall es:[bx]
6:D721  eb9f                 jmp 0xd6c2
6:D723  db 90
loc_D724:
6:D724  c9                   leave
6:D725  ca0400               retf 4

; ---------------- StepQueue::popHead@s6:D728 FAR size=26 callers=1
6:D728  55                   push bp
6:D729  8bec                 mov bp, sp
6:D72B  c45e06               les bx, ptr [bp + 6]
6:D72E  6626ff7704           push dword ptr es:[bx + 4]
6:D733  26c45f04             les bx, ptr es:[bx + 4]
6:D737  26c41f               les bx, ptr es:[bx]
6:D73A  26ff5f10             lcall es:[bx + 0x10]
6:D73E  c9                   leave
6:D73F  ca0400               retf 4

; ---------------- StepQueue::insertClone@s6:D742 FAR size=52 callers=2
6:D742  c80c0000             enter 0xc, 0
6:D746  c45e0a               les bx, ptr [bp + 0xa]
6:D749  06                   push es
6:D74A  53                   push bx
6:D74B  26c41f               les bx, ptr es:[bx]
6:D74E  26ff5f0c             lcall es:[bx + 0xc]
6:D752  8946fc               mov word ptr [bp - 4], ax
6:D755  8956fe               mov word ptr [bp - 2], dx
6:D758  52                   push dx
6:D759  c45efc               les bx, ptr [bp - 4]
6:D75C  50                   push ax
6:D75D  6626ff7704           push dword ptr es:[bx + 4]
6:D762  c45e06               les bx, ptr [bp + 6]
6:D765  6626ff7704           push dword ptr es:[bx + 4]
6:D76A  9a72c8cdd6           lcall 0xd6cd, 0xc872  ; KeyedList::insertDescending@s5:C872
6:D76F  b80100               mov ax, 1
6:D772  c9                   leave
6:D773  ca0800               retf 8

; ---------------- sub_s6:D776 FAR size=42 callers=1
6:D776  c8040000             enter 4, 0
6:D77A  c45e0e               les bx, ptr [bp + 0xe]
6:D77D  06                   push es
6:D77E  53                   push bx
6:D77F  26c41f               les bx, ptr es:[bx]
6:D782  26ff5f0c             lcall es:[bx + 0xc]
6:D786  52                   push dx
6:D787  50                   push ax
6:D788  66ff760a             push dword ptr [bp + 0xa]
6:D78C  c45e06               les bx, ptr [bp + 6]
6:D78F  6626ff7708           push dword ptr es:[bx + 8]
6:D794  9a72c86dd7           lcall 0xd76d, 0xc872  ; KeyedList::insertDescending@s5:C872
6:D799  b80100               mov ax, 1
6:D79C  c9                   leave
6:D79D  ca0c00               retf 0xc

; ---------------- sub_s6:D7A0 FAR size=26 callers=1
6:D7A0  55                   push bp
6:D7A1  8bec                 mov bp, sp
6:D7A3  6a08                 push 8
6:D7A5  66ff760a             push dword ptr [bp + 0xa]
6:D7A9  9aac7cded5           lcall 0xd5de, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:D7AE  0bc0                 or ax, ax
6:D7B0  7403                 je 0xd7b5
6:D7B2  b80100               mov ax, 1
loc_D7B5:
6:D7B5  c9                   leave
6:D7B6  ca0800               retf 8
6:D7B9  db 00

; ---------------- sub_s6:D7BA FAR size=36 callers=1
6:D7BA  55                   push bp
6:D7BB  8bec                 mov bp, sp
6:D7BD  6a08                 push 8
6:D7BF  66ff760a             push dword ptr [bp + 0xa]
6:D7C3  9afe7cacd7           lcall 0xd7ac, 0x7cfe  ; sub_s2:7CFE
6:D7C8  0bc0                 or ax, ax
6:D7CA  750a                 jne 0xd7d6
6:D7CC  c7061003d406         mov word ptr [0x310], 0x6d4
6:D7D2  c9                   leave
6:D7D3  ca0800               retf 8
loc_D7D6:
6:D7D6  b80100               mov ax, 1
6:D7D9  c9                   leave
6:D7DA  ca0800               retf 8
6:D7DD  db 00

; ---------------- sub_s6:D7DE FAR size=62 callers=0
6:D7DE  c8040000             enter 4, 0
6:D7E2  66ff7606             push dword ptr [bp + 6]
6:D7E6  9ac457c6d7           lcall 0xd7c6, 0x57c4  ; ListIter::~ListIter@s2:57C4
6:D7EB  f6460a01             test byte ptr [bp + 0xa], 1
6:D7EF  7409                 je 0xd7fa
6:D7F1  66ff7606             push dword ptr [bp + 6]
6:D7F5  9ace17c8d5           lcall 0xd5c8, 0x17ce  ; operator_delete@s1:17CE
loc_D7FA:
6:D7FA  8b4606               mov ax, word ptr [bp + 6]
6:D7FD  8b5608               mov dx, word ptr [bp + 8]
6:D800  c9                   leave
6:D801  ca0600               retf 6
6:D804  db de d7 ec d5 a6 58 0e d8 3c 59 12 d8 f4 59 16 d8
6:D814  db b8 5a 1a d8 30 58 e9 d7

; ---------------- sub_s6:D81C FAR size=670 callers=1
6:D81C  c8040000             enter 4, 0
6:D820  c45e06               les bx, ptr [bp + 6]
6:D823  6626c70700000000     mov dword ptr es:[bx], 0
6:D82B  668b460a             mov eax, dword ptr [bp + 0xa]
6:D82F  6626894704           mov dword ptr es:[bx + 4], eax
6:D834  6626c7475200000000   mov dword ptr es:[bx + 0x52], 0
6:D83D  891ee265             mov word ptr [0x65e2], bx  ; g_objectDb
6:D841  8c06e465             mov word ptr [0x65e4], es  ; g_objectDb+2
6:D845  26c7473236ec         mov word ptr es:[bx + 0x32], 0xec36
6:D84B  26c747345bd8         mov word ptr es:[bx + 0x34], 0xd85b  ; SEGMENT s6:0000
6:D851  26c74736acec         mov word ptr es:[bx + 0x36], 0xecac
6:D857  26c7473867d8         mov word ptr es:[bx + 0x38], 0xd867  ; SEGMENT s6:0000
6:D85D  26c7473a2ced         mov word ptr es:[bx + 0x3a], 0xed2c
6:D863  26c7473c73d8         mov word ptr es:[bx + 0x3c], 0xd873  ; SEGMENT s6:0000
6:D869  26c7473ec4ed         mov word ptr es:[bx + 0x3e], 0xedc4
6:D86F  26c747407fd8         mov word ptr es:[bx + 0x40], 0xd87f  ; SEGMENT s6:0000
6:D875  26c7474254ee         mov word ptr es:[bx + 0x42], 0xee54
6:D87B  26c747448bd8         mov word ptr es:[bx + 0x44], 0xd88b  ; SEGMENT s6:0000
6:D881  26c7474600ef         mov word ptr es:[bx + 0x46], 0xef00
6:D887  26c7474806d8         mov word ptr es:[bx + 0x48], 0xd806  ; SEGMENT s6:0000
6:D88D  26c7474ab010         mov word ptr es:[bx + 0x4a], 0x10b0
6:D893  26c7474ca3d8         mov word ptr es:[bx + 0x4c], 0xd8a3  ; SEGMENT s7:0000
6:D899  26c7474e2011         mov word ptr es:[bx + 0x4e], 0x1120
6:D89F  26c74750c1d8         mov word ptr es:[bx + 0x50], 0xd8c1  ; SEGMENT s7:0000
6:D8A5  6a08                 push 8
6:D8A7  9a9c17c9d8           lcall 0xd8c9, 0x179c  ; operator_new@s1:179C
6:D8AC  83c402               add sp, 2
6:D8AF  8956fe               mov word ptr [bp - 2], dx
6:D8B2  0bd0                 or dx, ax
6:D8B4  740d                 je 0xd8c3
6:D8B6  66ff7606             push dword ptr [bp + 6]
6:D8BA  ff76fe               push word ptr [bp - 2]
6:D8BD  50                   push ax
6:D8BE  9a5a61dcd8           lcall 0xd8dc, 0x615a  ; sub_s7:615A
loc_D8C3:
6:D8C3  686c05               push 0x56c
6:D8C6  9a9c17f3d8           lcall 0xd8f3, 0x179c  ; operator_new@s1:179C
6:D8CB  83c402               add sp, 2
6:D8CE  8956fe               mov word ptr [bp - 2], dx
6:D8D1  0bd0                 or dx, ax
6:D8D3  740b                 je 0xd8e0
6:D8D5  ff76fe               push word ptr [bp - 2]
6:D8D8  50                   push ax
6:D8D9  9abe443dd9           lcall 0xd93d, 0x44be  ; sub_s7:44BE
6:D8DE  eb03                 jmp 0xd8e3
loc_D8E0:
6:D8E0  33c0                 xor ax, ax
6:D8E2  99                   cdq
loc_D8E3:
6:D8E3  c45e06               les bx, ptr [bp + 6]
6:D8E6  26894752             mov word ptr es:[bx + 0x52], ax
6:D8EA  26895754             mov word ptr es:[bx + 0x54], dx
6:D8EE  6a04                 push 4
6:D8F0  9a9c171ad9           lcall 0xd91a, 0x179c  ; operator_new@s1:179C
6:D8F5  83c402               add sp, 2
6:D8F8  8956fe               mov word ptr [bp - 2], dx
6:D8FB  0bd0                 or dx, ax
6:D8FD  7409                 je 0xd908
6:D8FF  ff76fe               push word ptr [bp - 2]
6:D902  50                   push ax
6:D903  9ae0bd0ad8           lcall 0xd80a, 0xbde0  ; sub_s2:BDE0
loc_D908:
6:D908  666800002400         push 0x240000
6:D90E  668b4606             mov eax, dword ptr [bp + 6]
6:D912  050a00               add ax, 0xa
6:D915  6650                 push eax
6:D917  9a064924d9           lcall 0xd924, 0x4906  ; sub_s1:4906
6:D91C  83c408               add sp, 8
6:D91F  6a1c                 push 0x1c
6:D921  9a9c175dd9           lcall 0xd95d, 0x179c  ; operator_new@s1:179C
6:D926  83c402               add sp, 2
6:D929  8956fe               mov word ptr [bp - 2], dx
6:D92C  0bd0                 or dx, ax
6:D92E  741c                 je 0xd94c
6:D930  666a15               push 0x15
6:D933  666a05               push 5
6:D936  ff76fe               push word ptr [bp - 2]
6:D939  50                   push ax
6:D93A  9aaa1176d9           lcall 0xd976, 0x11aa  ; sub_s7:11AA
6:D93F  c45e06               les bx, ptr [bp + 6]
6:D942  2689470e             mov word ptr es:[bx + 0xe], ax
6:D946  26895710             mov word ptr es:[bx + 0x10], dx
6:D94A  eb0c                 jmp 0xd958
loc_D94C:
6:D94C  c45e06               les bx, ptr [bp + 6]
6:D94F  6626c7470e00000000   mov dword ptr es:[bx + 0xe], 0
loc_D958:
6:D958  6a1c                 push 0x1c
6:D95A  9a9c178dd9           lcall 0xd98d, 0x179c  ; operator_new@s1:179C
6:D95F  83c402               add sp, 2
6:D962  8956fe               mov word ptr [bp - 2], dx
6:D965  0bd0                 or dx, ax
6:D967  7411                 je 0xd97a
6:D969  666a0a               push 0xa
6:D96C  666a05               push 5
6:D96F  ff76fe               push word ptr [bp - 2]
6:D972  50                   push ax
6:D973  9aaa11a6d9           lcall 0xd9a6, 0x11aa  ; sub_s7:11AA
6:D978  eb03                 jmp 0xd97d
loc_D97A:
6:D97A  33c0                 xor ax, ax
6:D97C  99                   cdq
loc_D97D:
6:D97D  c45e06               les bx, ptr [bp + 6]
6:D980  26894712             mov word ptr es:[bx + 0x12], ax
6:D984  26895714             mov word ptr es:[bx + 0x14], dx
6:D988  6a1c                 push 0x1c
6:D98A  9a9c17bdd9           lcall 0xd9bd, 0x179c  ; operator_new@s1:179C
6:D98F  83c402               add sp, 2
6:D992  8956fe               mov word ptr [bp - 2], dx
6:D995  0bd0                 or dx, ax
6:D997  7411                 je 0xd9aa
6:D999  666a19               push 0x19
6:D99C  666a05               push 5
6:D99F  ff76fe               push word ptr [bp - 2]
6:D9A2  50                   push ax
6:D9A3  9aaa11d6d9           lcall 0xd9d6, 0x11aa  ; sub_s7:11AA
6:D9A8  eb03                 jmp 0xd9ad
loc_D9AA:
6:D9AA  33c0                 xor ax, ax
6:D9AC  99                   cdq
loc_D9AD:
6:D9AD  c45e06               les bx, ptr [bp + 6]
6:D9B0  26894716             mov word ptr es:[bx + 0x16], ax
6:D9B4  26895718             mov word ptr es:[bx + 0x18], dx
6:D9B8  6a1c                 push 0x1c
6:D9BA  9a9c17edd9           lcall 0xd9ed, 0x179c  ; operator_new@s1:179C
6:D9BF  83c402               add sp, 2
6:D9C2  8956fe               mov word ptr [bp - 2], dx
6:D9C5  0bd0                 or dx, ax
6:D9C7  7411                 je 0xd9da
6:D9C9  666a0a               push 0xa
6:D9CC  666a05               push 5
6:D9CF  ff76fe               push word ptr [bp - 2]
6:D9D2  50                   push ax
6:D9D3  9aaa1109da           lcall 0xda09, 0x11aa  ; sub_s7:11AA
6:D9D8  eb03                 jmp 0xd9dd
loc_D9DA:
6:D9DA  33c0                 xor ax, ax
6:D9DC  99                   cdq
loc_D9DD:
6:D9DD  c45e06               les bx, ptr [bp + 6]
6:D9E0  2689471a             mov word ptr es:[bx + 0x1a], ax
6:D9E4  2689571c             mov word ptr es:[bx + 0x1c], dx
6:D9E8  6a1c                 push 0x1c
6:D9EA  9a9c1721da           lcall 0xda21, 0x179c  ; operator_new@s1:179C
6:D9EF  83c402               add sp, 2
6:D9F2  8956fe               mov word ptr [bp - 2], dx
6:D9F5  0bd0                 or dx, ax
6:D9F7  7415                 je 0xda0e
6:D9F9  6668f4010000         push 0x1f4
6:D9FF  666a64               push 0x64
6:DA02  ff76fe               push word ptr [bp - 2]
6:DA05  50                   push ax
6:DA06  9aaa113ada           lcall 0xda3a, 0x11aa  ; sub_s7:11AA
6:DA0B  eb04                 jmp 0xda11
6:DA0D  db 90
loc_DA0E:
6:DA0E  33c0                 xor ax, ax
6:DA10  99                   cdq
loc_DA11:
6:DA11  c45e06               les bx, ptr [bp + 6]
6:DA14  2689471e             mov word ptr es:[bx + 0x1e], ax
6:DA18  26895720             mov word ptr es:[bx + 0x20], dx
6:DA1C  6a1c                 push 0x1c
6:DA1E  9a9c1751da           lcall 0xda51, 0x179c  ; operator_new@s1:179C
6:DA23  83c402               add sp, 2
6:DA26  8956fe               mov word ptr [bp - 2], dx
6:DA29  0bd0                 or dx, ax
6:DA2B  7411                 je 0xda3e
6:DA2D  666a64               push 0x64
6:DA30  666a19               push 0x19
6:DA33  ff76fe               push word ptr [bp - 2]
6:DA36  50                   push ax
6:DA37  9aaa116dda           lcall 0xda6d, 0x11aa  ; sub_s7:11AA
6:DA3C  eb03                 jmp 0xda41
loc_DA3E:
6:DA3E  33c0                 xor ax, ax
6:DA40  99                   cdq
loc_DA41:
6:DA41  c45e06               les bx, ptr [bp + 6]
6:DA44  26894722             mov word ptr es:[bx + 0x22], ax
6:DA48  26895724             mov word ptr es:[bx + 0x24], dx
6:DA4C  6a1c                 push 0x1c
6:DA4E  9a9c1785da           lcall 0xda85, 0x179c  ; operator_new@s1:179C
6:DA53  83c402               add sp, 2
6:DA56  8956fe               mov word ptr [bp - 2], dx
6:DA59  0bd0                 or dx, ax
6:DA5B  7415                 je 0xda72
6:DA5D  6668f4010000         push 0x1f4
6:DA63  666a64               push 0x64
6:DA66  ff76fe               push word ptr [bp - 2]
6:DA69  50                   push ax
6:DA6A  9aaa119eda           lcall 0xda9e, 0x11aa  ; sub_s7:11AA
6:DA6F  eb04                 jmp 0xda75
6:DA71  db 90
loc_DA72:
6:DA72  33c0                 xor ax, ax
6:DA74  99                   cdq
loc_DA75:
6:DA75  c45e06               les bx, ptr [bp + 6]
6:DA78  26894726             mov word ptr es:[bx + 0x26], ax
6:DA7C  26895728             mov word ptr es:[bx + 0x28], dx
6:DA80  6a1c                 push 0x1c
6:DA82  9a9c17f8d7           lcall 0xd7f8, 0x179c  ; operator_new@s1:179C
6:DA87  83c402               add sp, 2
6:DA8A  8956fe               mov word ptr [bp - 2], dx
6:DA8D  0bd0                 or dx, ax
6:DA8F  7411                 je 0xdaa2
6:DA91  666a02               push 2
6:DA94  666a05               push 5
6:DA97  ff76fe               push word ptr [bp - 2]
6:DA9A  50                   push ax
6:DA9B  9aaa1174cf           lcall 0xcf74, 0x11aa  ; sub_s7:11AA
6:DAA0  eb03                 jmp 0xdaa5
loc_DAA2:
6:DAA2  33c0                 xor ax, ax
6:DAA4  99                   cdq
loc_DAA5:
6:DAA5  c45e06               les bx, ptr [bp + 6]
6:DAA8  2689472a             mov word ptr es:[bx + 0x2a], ax
6:DAAC  2689572c             mov word ptr es:[bx + 0x2c], dx
6:DAB0  8b4606               mov ax, word ptr [bp + 6]
6:DAB3  8b5608               mov dx, word ptr [bp + 8]
6:DAB6  c9                   leave
6:DAB7  ca0800               retf 8

; ---------------- sub_s6:DABA FAR size=408 callers=1
6:DABA  c8140000             enter 0x14, 0
6:DABE  66a14057             mov eax, dword ptr [0x5740]
6:DAC2  668946f4             mov dword ptr [bp - 0xc], eax
6:DAC6  668946f8             mov dword ptr [bp - 8], eax
6:DACA  660bc0               or eax, eax
6:DACD  7416                 je 0xdae5
6:DACF  ff364257             push word ptr [0x5742]
6:DAD3  50                   push ax
6:DAD4  9ab06101db           lcall 0xdb01, 0x61b0  ; sub_s7:61B0
6:DAD9  66ff76f8             push dword ptr [bp - 8]
6:DADD  9ace170adb           lcall 0xdb0a, 0x17ce  ; operator_delete@s1:17CE
6:DAE2  83c404               add sp, 4
loc_DAE5:
6:DAE5  c45e06               les bx, ptr [bp + 6]
6:DAE8  268b4752             mov ax, word ptr es:[bx + 0x52]
6:DAEC  268b5754             mov dx, word ptr es:[bx + 0x54]
6:DAF0  8bda                 mov bx, dx
6:DAF2  8946f4               mov word ptr [bp - 0xc], ax
6:DAF5  8956f6               mov word ptr [bp - 0xa], dx
6:DAF8  0bd8                 or bx, ax
6:DAFA  7413                 je 0xdb0f
6:DAFC  52                   push dx
6:DAFD  50                   push ax
6:DAFE  9a384597d8           lcall 0xd897, 0x4538  ; sub_s7:4538
6:DB03  66ff76f4             push dword ptr [bp - 0xc]
6:DB07  9ace1751db           lcall 0xdb51, 0x17ce  ; operator_delete@s1:17CE
6:DB0C  83c404               add sp, 4
loc_DB0F:
6:DB0F  66a16651             mov eax, dword ptr [0x5166]
6:DB13  668946f4             mov dword ptr [bp - 0xc], eax
6:DB17  660bc0               or eax, eax
6:DB1A  740e                 je 0xdb2a
6:DB1C  6a01                 push 1
6:DB1E  c41e6651             les bx, ptr [0x5166]
6:DB22  06                   push es
6:DB23  50                   push ax
6:DB24  26c41f               les bx, ptr es:[bx]
6:DB27  26ff1f               lcall es:[bx]
loc_DB2A:
6:DB2A  66c706e26500000000   mov dword ptr [0x65e2], 0  ; g_objectDb
6:DB33  66a1e006             mov eax, dword ptr [0x6e0]  ; g_bldgGroups
6:DB37  668946f4             mov dword ptr [bp - 0xc], eax
6:DB3B  660bc0               or eax, eax
6:DB3E  7416                 je 0xdb56
6:DB40  ff36e206             push word ptr [0x6e2]  ; g_bldgGroups+2
6:DB44  50                   push ax
6:DB45  9a26c606d9           lcall 0xd906, 0xc626  ; sub_s2:C626
6:DB4A  66ff76f4             push dword ptr [bp - 0xc]
6:DB4E  9ace17aad8           lcall 0xd8aa, 0x17ce  ; operator_delete@s1:17CE
6:DB53  83c404               add sp, 4
loc_DB56:
6:DB56  c45e06               les bx, ptr [bp + 6]
6:DB59  268b470e             mov ax, word ptr es:[bx + 0xe]
6:DB5D  268b5710             mov dx, word ptr es:[bx + 0x10]
6:DB61  8bda                 mov bx, dx
6:DB63  0bd8                 or bx, ax
6:DB65  740e                 je 0xdb75
6:DB67  6a01                 push 1
6:DB69  52                   push dx
6:DB6A  50                   push ax
6:DB6B  8ec2                 mov es, dx
6:DB6D  8bd8                 mov bx, ax
6:DB6F  26c41f               les bx, ptr es:[bx]
6:DB72  26ff1f               lcall es:[bx]
loc_DB75:
6:DB75  c45e06               les bx, ptr [bp + 6]
6:DB78  268b4712             mov ax, word ptr es:[bx + 0x12]
6:DB7C  268b5714             mov dx, word ptr es:[bx + 0x14]
6:DB80  8bda                 mov bx, dx
6:DB82  0bd8                 or bx, ax
6:DB84  740e                 je 0xdb94
6:DB86  6a01                 push 1
6:DB88  52                   push dx
6:DB89  50                   push ax
6:DB8A  8ec2                 mov es, dx
6:DB8C  8bd8                 mov bx, ax
6:DB8E  26c41f               les bx, ptr es:[bx]
6:DB91  26ff1f               lcall es:[bx]
loc_DB94:
6:DB94  c45e06               les bx, ptr [bp + 6]
6:DB97  268b4716             mov ax, word ptr es:[bx + 0x16]
6:DB9B  268b5718             mov dx, word ptr es:[bx + 0x18]
6:DB9F  8bda                 mov bx, dx
6:DBA1  0bd8                 or bx, ax
6:DBA3  740e                 je 0xdbb3
6:DBA5  6a01                 push 1
6:DBA7  52                   push dx
6:DBA8  50                   push ax
6:DBA9  8ec2                 mov es, dx
6:DBAB  8bd8                 mov bx, ax
6:DBAD  26c41f               les bx, ptr es:[bx]
6:DBB0  26ff1f               lcall es:[bx]
loc_DBB3:
6:DBB3  c45e06               les bx, ptr [bp + 6]
6:DBB6  268b471a             mov ax, word ptr es:[bx + 0x1a]
6:DBBA  268b571c             mov dx, word ptr es:[bx + 0x1c]
6:DBBE  8bda                 mov bx, dx
6:DBC0  0bd8                 or bx, ax
6:DBC2  740e                 je 0xdbd2
6:DBC4  6a01                 push 1
6:DBC6  52                   push dx
6:DBC7  50                   push ax
6:DBC8  8ec2                 mov es, dx
6:DBCA  8bd8                 mov bx, ax
6:DBCC  26c41f               les bx, ptr es:[bx]
6:DBCF  26ff1f               lcall es:[bx]
loc_DBD2:
6:DBD2  c45e06               les bx, ptr [bp + 6]
6:DBD5  268b471e             mov ax, word ptr es:[bx + 0x1e]
6:DBD9  268b5720             mov dx, word ptr es:[bx + 0x20]
6:DBDD  8bda                 mov bx, dx
6:DBDF  0bd8                 or bx, ax
6:DBE1  740e                 je 0xdbf1
6:DBE3  6a01                 push 1
6:DBE5  52                   push dx
6:DBE6  50                   push ax
6:DBE7  8ec2                 mov es, dx
6:DBE9  8bd8                 mov bx, ax
6:DBEB  26c41f               les bx, ptr es:[bx]
6:DBEE  26ff1f               lcall es:[bx]
loc_DBF1:
6:DBF1  c45e06               les bx, ptr [bp + 6]
6:DBF4  268b4722             mov ax, word ptr es:[bx + 0x22]
6:DBF8  268b5724             mov dx, word ptr es:[bx + 0x24]
6:DBFC  8bda                 mov bx, dx
6:DBFE  0bd8                 or bx, ax
6:DC00  740e                 je 0xdc10
6:DC02  6a01                 push 1
6:DC04  52                   push dx
6:DC05  50                   push ax
6:DC06  8ec2                 mov es, dx
6:DC08  8bd8                 mov bx, ax
6:DC0A  26c41f               les bx, ptr es:[bx]
6:DC0D  26ff1f               lcall es:[bx]
loc_DC10:
6:DC10  c45e06               les bx, ptr [bp + 6]
6:DC13  268b4726             mov ax, word ptr es:[bx + 0x26]
6:DC17  268b5728             mov dx, word ptr es:[bx + 0x28]
6:DC1B  8bda                 mov bx, dx
6:DC1D  0bd8                 or bx, ax
6:DC1F  740e                 je 0xdc2f
6:DC21  6a01                 push 1
6:DC23  52                   push dx
6:DC24  50                   push ax
6:DC25  8ec2                 mov es, dx
6:DC27  8bd8                 mov bx, ax
6:DC29  26c41f               les bx, ptr es:[bx]
6:DC2C  26ff1f               lcall es:[bx]
loc_DC2F:
6:DC2F  c45e06               les bx, ptr [bp + 6]
6:DC32  268b472a             mov ax, word ptr es:[bx + 0x2a]
6:DC36  268b572c             mov dx, word ptr es:[bx + 0x2c]
6:DC3A  8bda                 mov bx, dx
6:DC3C  0bd8                 or bx, ax
6:DC3E  740e                 je 0xdc4e
6:DC40  6a01                 push 1
6:DC42  52                   push dx
6:DC43  50                   push ax
6:DC44  8ec2                 mov es, dx
6:DC46  8bd8                 mov bx, ax
6:DC48  26c41f               les bx, ptr es:[bx]
6:DC4B  26ff1f               lcall es:[bx]
loc_DC4E:
6:DC4E  c9                   leave
6:DC4F  ca0400               retf 4

; ---------------- DbIter::DbIter(typeMask)@s6:DC52 FAR size=144 callers=42
6:DC52  c80a0000             enter 0xa, 0
6:DC56  56                   push si
6:DC57  c45e06               les bx, ptr [bp + 6]
6:DC5A  26c7079a38           mov word ptr es:[bx], 0x389a
6:DC5F  26c7470248db         mov word ptr es:[bx + 2], 0xdb48  ; SEGMENT s2:0000
6:DC65  8a460f               mov al, byte ptr [bp + 0xf]
6:DC68  2ae4                 sub ah, ah
6:DC6A  8bf0                 mov si, ax
6:DC6C  81e6ff00             and si, 0xff
6:DC70  c1e602               shl si, 2
6:DC73  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
6:DC77  66268b400a           mov eax, dword ptr es:[bx + si + 0xa]
6:DC7C  c45e06               les bx, ptr [bp + 6]
6:DC7F  6626894704           mov dword ptr es:[bx + 4], eax
6:DC84  c45e06               les bx, ptr [bp + 6]
6:DC87  6626c7470801000000   mov dword ptr es:[bx + 8], 1
6:DC90  8b460a               mov ax, word ptr [bp + 0xa]
6:DC93  26894710             mov word ptr es:[bx + 0x10], ax
6:DC97  26c707a611           mov word ptr es:[bx], 0x11a6
6:DC9C  26c74702d7da         mov word ptr es:[bx + 2], 0xdad7  ; SEGMENT s7:0000
6:DCA2  c45e06               les bx, ptr [bp + 6]
6:DCA5  26c45f04             les bx, ptr es:[bx + 4]
6:DCA9  66268b470a           mov eax, dword ptr es:[bx + 0xa]
6:DCAE  c45e06               les bx, ptr [bp + 6]
6:DCB1  662689470c           mov dword ptr es:[bx + 0xc], eax
6:DCB6  837e0a00             cmp word ptr [bp + 0xa], 0
6:DCBA  740e                 je 0xdcca
6:DCBC  c45e06               les bx, ptr [bp + 6]
6:DCBF  6626c7470801000000   mov dword ptr es:[bx + 8], 1
6:DCC8  eb0d                 jmp 0xdcd7
loc_DCCA:
6:DCCA  c45e06               les bx, ptr [bp + 6]
6:DCCD  66268b470c           mov eax, dword ptr es:[bx + 0xc]
6:DCD2  6626894708           mov dword ptr es:[bx + 8], eax
loc_DCD7:
6:DCD7  8b4606               mov ax, word ptr [bp + 6]
6:DCDA  8b5608               mov dx, word ptr [bp + 8]
6:DCDD  5e                   pop si
6:DCDE  c9                   leave
6:DCDF  ca0a00               retf 0xa

; ---------------- sub_s6:DCE2 FAR size=528 callers=1
6:DCE2  c8280000             enter 0x28, 0
6:DCE6  6a0a                 push 0xa
6:DCE8  66ff760a             push dword ptr [bp + 0xa]
6:DCEC  9aac7c16dd           lcall 0xdd16, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DCF1  0bc0                 or ax, ax
6:DCF3  7507                 jne 0xdcfc
loc_DCF5:
6:DCF5  33c0                 xor ax, ax
6:DCF7  c9                   leave
6:DCF8  ca0800               retf 8
6:DCFB  db 90
loc_DCFC:
6:DCFC  c45e06               les bx, ptr [bp + 6]
6:DCFF  66268b07             mov eax, dword ptr es:[bx]
6:DD03  668946dc             mov dword ptr [bp - 0x24], eax
6:DD07  666a04               push 4
6:DD0A  8d46dc               lea ax, [bp - 0x24]
6:DD0D  16                   push ss
6:DD0E  50                   push ax
6:DD0F  66ff760a             push dword ptr [bp + 0xa]
6:DD13  9a1c7e35dd           lcall 0xdd35, 0x7e1c  ; File_write@s2:7E1C
6:DD18  0bc0                 or ax, ax
6:DD1A  74d9                 je 0xdcf5
6:DD1C  c45e06               les bx, ptr [bp + 6]
6:DD1F  268b4708             mov ax, word ptr es:[bx + 8]
6:DD23  8946e4               mov word ptr [bp - 0x1c], ax
6:DD26  666a02               push 2
6:DD29  8d46e4               lea ax, [bp - 0x1c]
6:DD2C  16                   push ss
6:DD2D  50                   push ax
6:DD2E  66ff760a             push dword ptr [bp + 0xa]
6:DD32  9a1c7e59dd           lcall 0xdd59, 0x7e1c  ; File_write@s2:7E1C
6:DD37  0bc0                 or ax, ax
6:DD39  74ba                 je 0xdcf5
6:DD3B  66ff760a             push dword ptr [bp + 0xa]
6:DD3F  c41e6651             les bx, ptr [0x5166]
6:DD43  06                   push es
6:DD44  53                   push bx
6:DD45  26c41f               les bx, ptr es:[bx]
6:DD48  26ff5f0c             lcall es:[bx + 0xc]
6:DD4C  0bc0                 or ax, ax
6:DD4E  74a5                 je 0xdcf5
6:DD50  6a0c                 push 0xc
6:DD52  66ff760a             push dword ptr [bp + 0xa]
6:DD56  9aac7c81dd           lcall 0xdd81, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DD5B  0bc0                 or ax, ax
6:DD5D  7496                 je 0xdcf5
6:DD5F  666800000001         push 0x1000000
6:DD65  66ff760a             push dword ptr [bp + 0xa]
6:DD69  66ff7606             push dword ptr [bp + 6]
6:DD6D  90                   nop
6:DD6E  0e                   push cs
6:DD6F  e8fa07               call 0xe56c  ; sub_s6:E56C
6:DD72  0bc0                 or ax, ax
6:DD74  0f847dff             je 0xdcf5
6:DD78  6a0d                 push 0xd
6:DD7A  66ff760a             push dword ptr [bp + 0xa]
6:DD7E  9aac7cabdd           lcall 0xddab, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DD83  0bc0                 or ax, ax
6:DD85  0f846cff             je 0xdcf5
6:DD89  666800000002         push 0x2000000
6:DD8F  66ff760a             push dword ptr [bp + 0xa]
6:DD93  66ff7606             push dword ptr [bp + 6]
6:DD97  90                   nop
6:DD98  0e                   push cs
6:DD99  e8d007               call 0xe56c  ; sub_s6:E56C
6:DD9C  0bc0                 or ax, ax
6:DD9E  0f8453ff             je 0xdcf5
6:DDA2  6a0e                 push 0xe
6:DDA4  66ff760a             push dword ptr [bp + 0xa]
6:DDA8  9aac7cd5dd           lcall 0xddd5, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DDAD  0bc0                 or ax, ax
6:DDAF  0f8442ff             je 0xdcf5
6:DDB3  666800000003         push 0x3000000
6:DDB9  66ff760a             push dword ptr [bp + 0xa]
6:DDBD  66ff7606             push dword ptr [bp + 6]
6:DDC1  90                   nop
6:DDC2  0e                   push cs
6:DDC3  e8a607               call 0xe56c  ; sub_s6:E56C
6:DDC6  0bc0                 or ax, ax
6:DDC8  0f8429ff             je 0xdcf5
6:DDCC  6a0f                 push 0xf
6:DDCE  66ff760a             push dword ptr [bp + 0xa]
6:DDD2  9aac7cffdd           lcall 0xddff, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DDD7  0bc0                 or ax, ax
6:DDD9  0f8418ff             je 0xdcf5
6:DDDD  666800000004         push 0x4000000
6:DDE3  66ff760a             push dword ptr [bp + 0xa]
6:DDE7  66ff7606             push dword ptr [bp + 6]
6:DDEB  90                   nop
6:DDEC  0e                   push cs
6:DDED  e87c07               call 0xe56c  ; sub_s6:E56C
6:DDF0  0bc0                 or ax, ax
6:DDF2  0f84fffe             je 0xdcf5
6:DDF6  6a10                 push 0x10
6:DDF8  66ff760a             push dword ptr [bp + 0xa]
6:DDFC  9aac7c29de           lcall 0xde29, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DE01  0bc0                 or ax, ax
6:DE03  0f84eefe             je 0xdcf5
6:DE07  666800000005         push 0x5000000
6:DE0D  66ff760a             push dword ptr [bp + 0xa]
6:DE11  66ff7606             push dword ptr [bp + 6]
6:DE15  90                   nop
6:DE16  0e                   push cs
6:DE17  e85207               call 0xe56c  ; sub_s6:E56C
6:DE1A  0bc0                 or ax, ax
6:DE1C  0f84d5fe             je 0xdcf5
6:DE20  6a11                 push 0x11
6:DE22  66ff760a             push dword ptr [bp + 0xa]
6:DE26  9aac7c53de           lcall 0xde53, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DE2B  0bc0                 or ax, ax
6:DE2D  0f84c4fe             je 0xdcf5
6:DE31  666800000006         push 0x6000000
6:DE37  66ff760a             push dword ptr [bp + 0xa]
6:DE3B  66ff7606             push dword ptr [bp + 6]
6:DE3F  90                   nop
6:DE40  0e                   push cs
6:DE41  e82807               call 0xe56c  ; sub_s6:E56C
6:DE44  0bc0                 or ax, ax
6:DE46  0f84abfe             je 0xdcf5
6:DE4A  6a12                 push 0x12  ; 'version %d %d'
6:DE4C  66ff760a             push dword ptr [bp + 0xa]
6:DE50  9aac7c7dde           lcall 0xde7d, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DE55  0bc0                 or ax, ax
6:DE57  0f849afe             je 0xdcf5
6:DE5B  666800000007         push 0x7000000
6:DE61  66ff760a             push dword ptr [bp + 0xa]
6:DE65  66ff7606             push dword ptr [bp + 6]
6:DE69  90                   nop
6:DE6A  0e                   push cs
6:DE6B  e8fe06               call 0xe56c  ; sub_s6:E56C
6:DE6E  0bc0                 or ax, ax
6:DE70  0f8481fe             je 0xdcf5
6:DE74  6a13                 push 0x13
6:DE76  66ff760a             push dword ptr [bp + 0xa]
6:DE7A  9aac7ce9de           lcall 0xdee9, 0x7cac  ; Save_writeChunkTag@s2:7CAC
6:DE7F  0bc0                 or ax, ax
6:DE81  0f8470fe             je 0xdcf5
6:DE85  666800000008         push 0x8000000
6:DE8B  66ff760a             push dword ptr [bp + 0xa]
6:DE8F  66ff7606             push dword ptr [bp + 6]
6:DE93  90                   nop
6:DE94  0e                   push cs
6:DE95  e8d406               call 0xe56c  ; sub_s6:E56C
6:DE98  0bc0                 or ax, ax
6:DE9A  0f8457fe             je 0xdcf5
6:DE9E  666800000004         push 0x4000000
6:DEA4  6a01                 push 1
6:DEA6  8d46ee               lea ax, [bp - 0x12]
6:DEA9  16                   push ss
6:DEAA  50                   push ax
6:DEAB  90                   nop
6:DEAC  0e                   push cs
6:DEAD  e8a2fd               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_DEB0:
6:DEB0  8d46ee               lea ax, [bp - 0x12]
6:DEB3  16                   push ss
6:DEB4  50                   push ax
6:DEB5  90                   nop
6:DEB6  0e                   push cs
6:DEB7  e83206               call 0xe4ec  ; DbIter::next@s6:E4EC
6:DEBA  8946ea               mov word ptr [bp - 0x16], ax
6:DEBD  8956ec               mov word ptr [bp - 0x14], dx
6:DEC0  0bd0                 or dx, ax
6:DEC2  7418                 je 0xdedc
6:DEC4  c45eea               les bx, ptr [bp - 0x16]
6:DEC7  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
6:DED1  74dd                 je 0xdeb0
6:DED3  06                   push es
6:DED4  50                   push ax
6:DED5  9aa03b49d1           lcall 0xd149, 0x3ba0  ; sub_s8:3BA0
6:DEDA  ebd4                 jmp 0xdeb0
loc_DEDC:
6:DEDC  c746d80100           mov word ptr [bp - 0x28], 1
6:DEE1  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:DEE6  c746f063dc           mov word ptr [bp - 0x10], 0xdc63  ; SEGMENT s2:0000
6:DEEB  8b46d8               mov ax, word ptr [bp - 0x28]
6:DEEE  c9                   leave
6:DEEF  ca0800               retf 8

; ---------------- sub_s6:DEF2 FAR size=430 callers=1
6:DEF2  c8100000             enter 0x10, 0
6:DEF6  6a0a                 push 0xa
6:DEF8  66ff760a             push dword ptr [bp + 0xa]
6:DEFC  9afe7c1adf           lcall 0xdf1a, 0x7cfe  ; sub_s2:7CFE
6:DF01  0bc0                 or ax, ax
6:DF03  7507                 jne 0xdf0c
loc_DF05:
6:DF05  33c0                 xor ax, ax
6:DF07  c9                   leave
6:DF08  ca0800               retf 8
6:DF0B  db 90
loc_DF0C:
6:DF0C  666a04               push 4
6:DF0F  66ff7606             push dword ptr [bp + 6]
6:DF13  66ff760a             push dword ptr [bp + 0xa]
6:DF17  9aee7d33df           lcall 0xdf33, 0x7dee  ; File_read@s2:7DEE
6:DF1C  0bc0                 or ax, ax
6:DF1E  74e5                 je 0xdf05
6:DF20  666a02               push 2
6:DF23  668b4606             mov eax, dword ptr [bp + 6]
6:DF27  050800               add ax, 8
6:DF2A  6650                 push eax
6:DF2C  66ff760a             push dword ptr [bp + 0xa]
6:DF30  9aee7d57df           lcall 0xdf57, 0x7dee  ; File_read@s2:7DEE
6:DF35  0bc0                 or ax, ax
6:DF37  74cc                 je 0xdf05
6:DF39  66ff760a             push dword ptr [bp + 0xa]
6:DF3D  c41e6651             les bx, ptr [0x5166]
6:DF41  06                   push es
6:DF42  53                   push bx
6:DF43  26c41f               les bx, ptr es:[bx]
6:DF46  26ff5f10             lcall es:[bx + 0x10]
6:DF4A  0bc0                 or ax, ax
6:DF4C  74b7                 je 0xdf05
6:DF4E  6a0c                 push 0xc
6:DF50  66ff760a             push dword ptr [bp + 0xa]
6:DF54  9afe7c7ddf           lcall 0xdf7d, 0x7cfe  ; sub_s2:7CFE
6:DF59  0bc0                 or ax, ax
6:DF5B  74a8                 je 0xdf05
6:DF5D  666800000001         push 0x1000000
6:DF63  66ff760a             push dword ptr [bp + 0xa]
6:DF67  66ff7606             push dword ptr [bp + 6]
6:DF6B  90                   nop
6:DF6C  0e                   push cs
6:DF6D  e8b806               call 0xe628  ; sub_s6:E628
6:DF70  0bc0                 or ax, ax
6:DF72  7491                 je 0xdf05
6:DF74  6a0d                 push 0xd
6:DF76  66ff760a             push dword ptr [bp + 0xa]
6:DF7A  9afe7ca5df           lcall 0xdfa5, 0x7cfe  ; sub_s2:7CFE
6:DF7F  0bc0                 or ax, ax
6:DF81  7482                 je 0xdf05
6:DF83  666800000002         push 0x2000000
6:DF89  66ff760a             push dword ptr [bp + 0xa]
6:DF8D  66ff7606             push dword ptr [bp + 6]
6:DF91  90                   nop
6:DF92  0e                   push cs
6:DF93  e89206               call 0xe628  ; sub_s6:E628
6:DF96  0bc0                 or ax, ax
6:DF98  0f8469ff             je 0xdf05
6:DF9C  6a0e                 push 0xe
6:DF9E  66ff760a             push dword ptr [bp + 0xa]
6:DFA2  9afe7ccfdf           lcall 0xdfcf, 0x7cfe  ; sub_s2:7CFE
6:DFA7  0bc0                 or ax, ax
6:DFA9  0f8458ff             je 0xdf05
6:DFAD  666800000003         push 0x3000000
6:DFB3  66ff760a             push dword ptr [bp + 0xa]
6:DFB7  66ff7606             push dword ptr [bp + 6]
6:DFBB  90                   nop
6:DFBC  0e                   push cs
6:DFBD  e86806               call 0xe628  ; sub_s6:E628
6:DFC0  0bc0                 or ax, ax
6:DFC2  0f843fff             je 0xdf05
6:DFC6  6a0f                 push 0xf
6:DFC8  66ff760a             push dword ptr [bp + 0xa]
6:DFCC  9afe7cf9df           lcall 0xdff9, 0x7cfe  ; sub_s2:7CFE
6:DFD1  0bc0                 or ax, ax
6:DFD3  0f842eff             je 0xdf05
6:DFD7  666800000004         push 0x4000000
6:DFDD  66ff760a             push dword ptr [bp + 0xa]
6:DFE1  66ff7606             push dword ptr [bp + 6]
6:DFE5  90                   nop
6:DFE6  0e                   push cs
6:DFE7  e83e06               call 0xe628  ; sub_s6:E628
6:DFEA  0bc0                 or ax, ax
6:DFEC  0f8415ff             je 0xdf05
6:DFF0  6a10                 push 0x10
6:DFF2  66ff760a             push dword ptr [bp + 0xa]
6:DFF6  9afe7c23e0           lcall 0xe023, 0x7cfe  ; sub_s2:7CFE
6:DFFB  0bc0                 or ax, ax
6:DFFD  0f8404ff             je 0xdf05
6:E001  666800000005         push 0x5000000
6:E007  66ff760a             push dword ptr [bp + 0xa]
6:E00B  66ff7606             push dword ptr [bp + 6]
6:E00F  90                   nop
6:E010  0e                   push cs
6:E011  e81406               call 0xe628  ; sub_s6:E628
6:E014  0bc0                 or ax, ax
6:E016  0f84ebfe             je 0xdf05
6:E01A  6a11                 push 0x11
6:E01C  66ff760a             push dword ptr [bp + 0xa]
6:E020  9afe7c4de0           lcall 0xe04d, 0x7cfe  ; sub_s2:7CFE
6:E025  0bc0                 or ax, ax
6:E027  0f84dafe             je 0xdf05
6:E02B  666800000006         push 0x6000000
6:E031  66ff760a             push dword ptr [bp + 0xa]
6:E035  66ff7606             push dword ptr [bp + 6]
6:E039  90                   nop
6:E03A  0e                   push cs
6:E03B  e8ea05               call 0xe628  ; sub_s6:E628
6:E03E  0bc0                 or ax, ax
6:E040  0f84c1fe             je 0xdf05
6:E044  6a12                 push 0x12  ; 'version %d %d'
6:E046  66ff760a             push dword ptr [bp + 0xa]
6:E04A  9afe7c77e0           lcall 0xe077, 0x7cfe  ; sub_s2:7CFE
6:E04F  0bc0                 or ax, ax
6:E051  0f84b0fe             je 0xdf05
6:E055  666800000007         push 0x7000000
6:E05B  66ff760a             push dword ptr [bp + 0xa]
6:E05F  66ff7606             push dword ptr [bp + 6]
6:E063  90                   nop
6:E064  0e                   push cs
6:E065  e8c005               call 0xe628  ; sub_s6:E628
6:E068  0bc0                 or ax, ax
6:E06A  0f8497fe             je 0xdf05
6:E06E  6a13                 push 0x13
6:E070  66ff760a             push dword ptr [bp + 0xa]
6:E074  9afe7cefdc           lcall 0xdcef, 0x7cfe  ; sub_s2:7CFE
6:E079  0bc0                 or ax, ax
6:E07B  0f8486fe             je 0xdf05
6:E07F  666800000008         push 0x8000000
6:E085  66ff760a             push dword ptr [bp + 0xa]
6:E089  66ff7606             push dword ptr [bp + 6]
6:E08D  90                   nop
6:E08E  0e                   push cs
6:E08F  e89605               call 0xe628  ; sub_s6:E628
6:E092  0bc0                 or ax, ax
6:E094  0f846dfe             je 0xdf05
6:E098  b80100               mov ax, 1
6:E09B  c9                   leave
6:E09C  ca0800               retf 8
6:E09F  db 00

; ---------------- sub_s6:E0A0 FAR size=28 callers=1
6:E0A0  c8040000             enter 4, 0
6:E0A4  66ff760a             push dword ptr [bp + 0xa]
6:E0A8  6a01                 push 1
6:E0AA  c45e06               les bx, ptr [bp + 6]
6:E0AD  6626ff7752           push dword ptr es:[bx + 0x52]
6:E0B2  9a8247a0dc           lcall 0xdca0, 0x4782  ; sub_s7:4782
6:E0B7  c9                   leave
6:E0B8  ca0800               retf 8
6:E0BB  db 00

; ---------------- sub_s6:E0BC FAR size=68 callers=3
6:E0BC  c8040000             enter 4, 0
6:E0C0  57                   push di
6:E0C1  56                   push si
6:E0C2  689800               push 0x98
6:E0C5  9a9c17e0da           lcall 0xdae0, 0x179c  ; operator_new@s1:179C
6:E0CA  83c402               add sp, 2
6:E0CD  8946fc               mov word ptr [bp - 4], ax
6:E0D0  8956fe               mov word ptr [bp - 2], dx
6:E0D3  ff760a               push word ptr [bp + 0xa]
6:E0D6  c45e06               les bx, ptr [bp + 6]
6:E0D9  6626ff7752           push dword ptr es:[bx + 0x52]
6:E0DE  9abe4bb5e0           lcall 0xe0b5, 0x4bbe  ; sub_s7:4BBE
6:E0E3  1e                   push ds
6:E0E4  8bf0                 mov si, ax
6:E0E6  8eda                 mov ds, dx
6:E0E8  c47efc               les di, ptr [bp - 4]
6:E0EB  66b926000000         mov ecx, 0x26
6:E0F1  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:E0F4  1f                   pop ds
6:E0F5  8b46fc               mov ax, word ptr [bp - 4]
6:E0F8  8cc2                 mov dx, es
6:E0FA  5e                   pop si
6:E0FB  5f                   pop di
6:E0FC  c9                   leave
6:E0FD  ca0600               retf 6

; ---------------- sub_s6:E100 FAR size=152 callers=2
6:E100  c81c0000             enter 0x1c, 0
6:E104  57                   push di
6:E105  56                   push si
6:E106  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
6:E10C  740a                 je 0xe118
6:E10E  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
6:E111  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
6:E115  eb06                 jmp 0xe11d
6:E117  db 90
loc_E118:
6:E118  9a0a162be1           lcall 0xe12b, 0x160a  ; SH_DefaultPool@s1:160A
loc_E11D:
6:E11D  52                   push dx
6:E11E  50                   push ax
6:E11F  666800000100         push 0x10000
6:E125  68ae00               push 0xae
6:E128  9a0817c8e0           lcall 0xe0c8, 0x1708  ; SH_MemAllocPtr@s1:1708
6:E12D  83c40a               add sp, 0xa
6:E130  8946f8               mov word ptr [bp - 8], ax
6:E133  8956fa               mov word ptr [bp - 6], dx
6:E136  0bd0                 or dx, ax
6:E138  7428                 je 0xe162
6:E13A  c45ef8               les bx, ptr [bp - 8]
6:E13D  6626c787a40000000000 mov dword ptr es:[bx + 0xa4], 0
6:E147  6626c787a80000000000 mov dword ptr es:[bx + 0xa8], 0
6:E151  26c787ac000000       mov word ptr es:[bx + 0xac], 0
6:E158  668b46f8             mov eax, dword ptr [bp - 8]
6:E15C  668946fc             mov dword ptr [bp - 4], eax
6:E160  eb08                 jmp 0xe16a
loc_E162:
6:E162  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_E16A:
6:E16A  ff760a               push word ptr [bp + 0xa]
6:E16D  c45e06               les bx, ptr [bp + 6]
6:E170  6626ff7752           push dword ptr es:[bx + 0x52]
6:E175  9a064ce1e0           lcall 0xe0e1, 0x4c06  ; sub_s7:4C06
6:E17A  1e                   push ds
6:E17B  8bf0                 mov si, ax
6:E17D  8eda                 mov ds, dx
6:E17F  c47efc               les di, ptr [bp - 4]
6:E182  66b92b000000         mov ecx, 0x2b
6:E188  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
6:E18B  a5                   movsw word ptr es:[di], word ptr [si]
6:E18C  1f                   pop ds
6:E18D  8b46fc               mov ax, word ptr [bp - 4]
6:E190  8cc2                 mov dx, es
6:E192  5e                   pop si
6:E193  5f                   pop di
6:E194  c9                   leave
6:E195  ca0600               retf 6

; ---------------- sub_s6:E198 FAR size=36 callers=1
6:E198  c8040000             enter 4, 0
6:E19C  66ff760e             push dword ptr [bp + 0xe]
6:E1A0  66ff760a             push dword ptr [bp + 0xa]
6:E1A4  66ff7612             push dword ptr [bp + 0x12]
6:E1A8  66ff7606             push dword ptr [bp + 6]
6:E1AC  90                   nop
6:E1AD  0e                   push cs
6:E1AE  e83b00               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:E1B1  52                   push dx
6:E1B2  50                   push ax
6:E1B3  9a1c5b78e1           lcall 0xe178, 0x5b1c  ; sub_s7:5B1C
6:E1B8  c9                   leave
6:E1B9  ca1000               retf 0x10

; ---------------- sub_s6:E1BC FAR size=48 callers=1
6:E1BC  c8120000             enter 0x12, 0
6:E1C0  56                   push si
6:E1C1  8a460d               mov al, byte ptr [bp + 0xd]
6:E1C4  2ae4                 sub ah, ah
6:E1C6  8bf0                 mov si, ax
6:E1C8  81e6ff00             and si, 0xff
6:E1CC  c1e602               shl si, 2
6:E1CF  c45e06               les bx, ptr [bp + 6]
6:E1D2  66268b400a           mov eax, dword ptr es:[bx + si + 0xa]
6:E1D7  668946fc             mov dword ptr [bp - 4], eax
6:E1DB  c45efc               les bx, ptr [bp - 4]
6:E1DE  268b470a             mov ax, word ptr es:[bx + 0xa]
6:E1E2  268b570c             mov dx, word ptr es:[bx + 0xc]
6:E1E6  5e                   pop si
6:E1E7  c9                   leave
6:E1E8  ca0800               retf 8
6:E1EB  db 00

; ---------------- Db::resolveHandle@s6:E1EC FAR size=86 callers=182
6:E1EC  c8120000             enter 0x12, 0
6:E1F0  56                   push si
6:E1F1  8a460d               mov al, byte ptr [bp + 0xd]
6:E1F4  2ae4                 sub ah, ah
6:E1F6  8946fe               mov word ptr [bp - 2], ax
6:E1F9  0bc0                 or ax, ax
6:E1FB  7507                 jne 0xe204
6:E1FD  99                   cdq
6:E1FE  5e                   pop si
6:E1FF  c9                   leave
6:E200  ca0800               retf 8
6:E203  db 90
loc_E204:
6:E204  8b460a               mov ax, word ptr [bp + 0xa]
6:E207  8b560c               mov dx, word ptr [bp + 0xc]
6:E20A  2af6                 sub dh, dh
6:E20C  8946fa               mov word ptr [bp - 6], ax
6:E20F  817efeff00           cmp word ptr [bp - 2], 0xff
6:E214  750c                 jne 0xe222
6:E216  a16651               mov ax, word ptr [0x5166]
6:E219  8b166851             mov dx, word ptr [0x5168]
6:E21D  5e                   pop si
6:E21E  c9                   leave
6:E21F  ca0800               retf 8
loc_E222:
6:E222  52                   push dx
6:E223  ff76fa               push word ptr [bp - 6]
6:E226  c45e06               les bx, ptr [bp + 6]
6:E229  83c30a               add bx, 0xa
6:E22C  8b76fe               mov si, word ptr [bp - 2]
6:E22F  c1e602               shl si, 2
6:E232  66268b00             mov eax, dword ptr es:[bx + si]
6:E236  6650                 push eax
6:E238  9a1213b6e1           lcall 0xe1b6, 0x1312  ; sub_s7:1312
6:E23D  5e                   pop si
6:E23E  c9                   leave
6:E23F  ca0800               retf 8

; ---------------- sub_s6:E242 FAR size=72 callers=2
;   apis: USER.SendMessage
6:E242  55                   push bp
6:E243  8bec                 mov bp, sp
6:E245  c45e06               les bx, ptr [bp + 6]
6:E248  66268b07             mov eax, dword ptr es:[bx]
6:E24C  66b964000000         mov ecx, 0x64
6:E252  6633d2               xor edx, edx
6:E255  66f7f1               div ecx
6:E258  668bc2               mov eax, edx
6:E25B  660bc0               or eax, eax
6:E25E  7512                 jne 0xe272
6:E260  ff369603             push word ptr [0x396]
6:E264  666800004100         push 0x410000
6:E26A  666a00               push 0
6:E26D  9affff0000           lcall 0, 0xffff  ; USER.SendMessage
loc_E272:
6:E272  c45e06               les bx, ptr [bp + 6]
6:E275  6626ff07             inc dword ptr es:[bx]
6:E279  837e0a00             cmp word ptr [bp + 0xa], 0
6:E27D  7407                 je 0xe286
6:E27F  06                   push es
6:E280  53                   push bx
6:E281  90                   nop
6:E282  0e                   push cs
6:E283  e80400               call 0xe28a  ; sub_s6:E28A
loc_E286:
6:E286  c9                   leave
6:E287  ca0600               retf 6

; ---------------- sub_s6:E28A FAR size=34 callers=1
6:E28A  6a2f                 push 0x2f
6:E28C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
6:E291  9aba209dcd           lcall 0xcd9d, 0x20ba  ; sub_s3:20BA
6:E296  6a05                 push 5
6:E298  050a00               add ax, 0xa
6:E29B  52                   push dx
6:E29C  50                   push ax
6:E29D  8ec2                 mov es, dx
6:E29F  8bd8                 mov bx, ax
6:E2A1  26c41f               les bx, ptr es:[bx]
6:E2A4  26ff5f04             lcall es:[bx + 4]
6:E2A8  ca0400               retf 4
6:E2AB  db 00

; ---------------- sub_s6:E2AC FAR size=52 callers=3
6:E2AC  c8120000             enter 0x12, 0
6:E2B0  56                   push si
6:E2B1  8a4613               mov al, byte ptr [bp + 0x13]
6:E2B4  2ae4                 sub ah, ah
6:E2B6  8bf0                 mov si, ax
6:E2B8  81e6ff00             and si, 0xff
6:E2BC  c1e602               shl si, 2
6:E2BF  c45e06               les bx, ptr [bp + 6]
6:E2C2  66268b402e           mov eax, dword ptr es:[bx + si + 0x2e]
6:E2C7  668946fc             mov dword ptr [bp - 4], eax
6:E2CB  66ff7614             push dword ptr [bp + 0x14]
6:E2CF  66ff760c             push dword ptr [bp + 0xc]
6:E2D3  ff760a               push word ptr [bp + 0xa]
6:E2D6  06                   push es
6:E2D7  53                   push bx
6:E2D8  ff5efc               lcall [bp - 4]
6:E2DB  5e                   pop si
6:E2DC  c9                   leave
6:E2DD  ca1200               retf 0x12

; ---------------- sub_s6:E2E0 FAR size=82 callers=10
6:E2E0  c80e0000             enter 0xe, 0
6:E2E4  56                   push si
6:E2E5  8a4613               mov al, byte ptr [bp + 0x13]
6:E2E8  2ae4                 sub ah, ah
6:E2EA  8946fe               mov word ptr [bp - 2], ax
6:E2ED  2bc0                 sub ax, ax
6:E2EF  817efeff00           cmp word ptr [bp - 2], 0xff
6:E2F4  750e                 jne 0xe304
6:E2F6  66ff7606             push dword ptr [bp + 6]
6:E2FA  90                   nop
6:E2FB  0e                   push cs
6:E2FC  e8ef08               call 0xebee  ; sub_s6:EBEE
6:E2FF  5e                   pop si
6:E300  c9                   leave
6:E301  ca1200               retf 0x12
loc_E304:
6:E304  66ff7614             push dword ptr [bp + 0x14]
6:E308  66ff760c             push dword ptr [bp + 0xc]
6:E30C  ff760a               push word ptr [bp + 0xa]
6:E30F  c45e06               les bx, ptr [bp + 6]
6:E312  06                   push es
6:E313  53                   push bx
6:E314  83c32e               add bx, 0x2e
6:E317  8b76fe               mov si, word ptr [bp - 2]
6:E31A  c1e602               shl si, 2
6:E31D  268b00               mov ax, word ptr es:[bx + si]
6:E320  268b5002             mov dx, word ptr es:[bx + si + 2]
6:E324  8956f8               mov word ptr [bp - 8], dx
6:E327  8946f6               mov word ptr [bp - 0xa], ax
6:E32A  ff5ef6               lcall [bp - 0xa]
6:E32D  5e                   pop si
6:E32E  c9                   leave
6:E32F  ca1200               retf 0x12

; ---------------- sub_s6:E332 FAR size=64 callers=3
6:E332  c8120000             enter 0x12, 0
6:E336  56                   push si
6:E337  8a460d               mov al, byte ptr [bp + 0xd]
6:E33A  2ae4                 sub ah, ah
6:E33C  3d0100               cmp ax, 1
6:E33F  7c2b                 jl 0xe36c
6:E341  3d0900               cmp ax, 9
6:E344  7f26                 jg 0xe36c
6:E346  c45e06               les bx, ptr [bp + 6]
6:E349  83c30a               add bx, 0xa
6:E34C  8bf0                 mov si, ax
6:E34E  c1e602               shl si, 2
6:E351  66268b00             mov eax, dword ptr es:[bx + si]
6:E355  668946fa             mov dword ptr [bp - 6], eax
6:E359  8b460a               mov ax, word ptr [bp + 0xa]
6:E35C  8b560c               mov dx, word ptr [bp + 0xc]
6:E35F  2af6                 sub dh, dh
6:E361  52                   push dx
6:E362  50                   push ax
6:E363  66ff76fa             push dword ptr [bp - 6]
6:E367  9af6133be2           lcall 0xe23b, 0x13f6  ; sub_s7:13F6
loc_E36C:
6:E36C  5e                   pop si
6:E36D  c9                   leave
6:E36E  ca0800               retf 8
6:E371  db 00

; ---------------- sub_s6:E372 FAR size=216 callers=2
6:E372  c82a0000             enter 0x2a, 0
6:E376  56                   push si
6:E377  8a460d               mov al, byte ptr [bp + 0xd]
6:E37A  2ae4                 sub ah, ah
6:E37C  3dff00               cmp ax, 0xff
6:E37F  0f84c100             je 0xe444
6:E383  c45e06               les bx, ptr [bp + 6]
6:E386  83c30a               add bx, 0xa
6:E389  8bf0                 mov si, ax
6:E38B  c1e602               shl si, 2
6:E38E  66268b00             mov eax, dword ptr es:[bx + si]
6:E392  668946fa             mov dword ptr [bp - 6], eax
6:E396  c45efa               les bx, ptr [bp - 6]
6:E399  66268b470a           mov eax, dword ptr es:[bx + 0xa]
6:E39E  668946f6             mov dword ptr [bp - 0xa], eax
6:E3A2  8b460a               mov ax, word ptr [bp + 0xa]
6:E3A5  8b560c               mov dx, word ptr [bp + 0xc]
6:E3A8  2af6                 sub dh, dh
6:E3AA  8946f2               mov word ptr [bp - 0xe], ax
6:E3AD  8956f4               mov word ptr [bp - 0xc], dx
6:E3B0  ff760c               push word ptr [bp + 0xc]
6:E3B3  50                   push ax
6:E3B4  66ff7606             push dword ptr [bp + 6]
6:E3B8  90                   nop
6:E3B9  0e                   push cs
6:E3BA  e82ffe               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:E3BD  8946ee               mov word ptr [bp - 0x12], ax
6:E3C0  8956f0               mov word ptr [bp - 0x10], dx
6:E3C3  c45eee               les bx, ptr [bp - 0x12]
6:E3C6  66268b4708           mov eax, dword ptr es:[bx + 8]
6:E3CB  6650                 push eax
6:E3CD  66ff7606             push dword ptr [bp + 6]
6:E3D1  90                   nop
6:E3D2  0e                   push cs
6:E3D3  e816fe               call 0xe1ec  ; Db::resolveHandle@s6:E1EC
6:E3D6  8946e6               mov word ptr [bp - 0x1a], ax
6:E3D9  8956e8               mov word ptr [bp - 0x18], dx
6:E3DC  66c746e201000000     mov dword ptr [bp - 0x1e], 1
6:E3E4  eb2d                 jmp 0xe413
loc_E3E6:
6:E3E6  c45eda               les bx, ptr [bp - 0x26]
6:E3E9  66268b4704           mov eax, dword ptr es:[bx + 4]
6:E3EE  668946de             mov dword ptr [bp - 0x22], eax
6:E3F2  66ff76e2             push dword ptr [bp - 0x1e]
6:E3F6  66ff76fa             push dword ptr [bp - 6]
6:E3FA  9af61335e4           lcall 0xe435, 0x13f6  ; sub_s7:13F6
6:E3FF  66ff76de             push dword ptr [bp - 0x22]
6:E403  c45ee6               les bx, ptr [bp - 0x1a]
6:E406  06                   push es
6:E407  53                   push bx
6:E408  26c41f               les bx, ptr es:[bx]
6:E40B  26ff5f18             lcall es:[bx + 0x18]
loc_E40F:
6:E40F  66ff46e2             inc dword ptr [bp - 0x1e]
loc_E413:
6:E413  668b46f6             mov eax, dword ptr [bp - 0xa]
6:E417  8b56f8               mov dx, word ptr [bp - 8]
6:E41A  663946e2             cmp dword ptr [bp - 0x1e], eax
6:E41E  7324                 jae 0xe444
6:E420  668b46f2             mov eax, dword ptr [bp - 0xe]
6:E424  663946e2             cmp dword ptr [bp - 0x1e], eax
6:E428  74e5                 je 0xe40f
6:E42A  66ff76e2             push dword ptr [bp - 0x1e]
6:E42E  66ff76fa             push dword ptr [bp - 6]
6:E432  9a12136ae3           lcall 0xe36a, 0x1312  ; sub_s7:1312
6:E437  8946da               mov word ptr [bp - 0x26], ax
6:E43A  8956dc               mov word ptr [bp - 0x24], dx
6:E43D  0bd0                 or dx, ax
6:E43F  75a5                 jne 0xe3e6
6:E441  ebcc                 jmp 0xe40f
6:E443  db 90
loc_E444:
6:E444  5e                   pop si
6:E445  c9                   leave
6:E446  ca0800               retf 8
6:E449  db 00

; ---------------- sub_s6:E44A FAR size=162 callers=1
6:E44A  c82c0000             enter 0x2c, 0
6:E44E  66ff760a             push dword ptr [bp + 0xa]
6:E452  66ff7606             push dword ptr [bp + 6]
6:E456  90                   nop
6:E457  0e                   push cs
6:E458  e817ff               call 0xe372  ; sub_s6:E372
6:E45B  c45e06               les bx, ptr [bp + 6]
6:E45E  66268b4726           mov eax, dword ptr es:[bx + 0x26]
6:E463  668946fc             mov dword ptr [bp - 4], eax
6:E467  66268b471e           mov eax, dword ptr es:[bx + 0x1e]
6:E46C  668946f8             mov dword ptr [bp - 8], eax
6:E470  c45ef8               les bx, ptr [bp - 8]
6:E473  66268b470a           mov eax, dword ptr es:[bx + 0xa]
6:E478  668946f4             mov dword ptr [bp - 0xc], eax
6:E47C  66c746f001000000     mov dword ptr [bp - 0x10], 1
6:E484  eb3c                 jmp 0xe4c2
loc_E486:
6:E486  c45eec               les bx, ptr [bp - 0x14]
6:E489  66268b4708           mov eax, dword ptr es:[bx + 8]
6:E48E  668946e8             mov dword ptr [bp - 0x18], eax
6:E492  668b460a             mov eax, dword ptr [bp + 0xa]
6:E496  663946e8             cmp dword ptr [bp - 0x18], eax
6:E49A  7422                 je 0xe4be
6:E49C  268b4716             mov ax, word ptr es:[bx + 0x16]
6:E4A0  268b5718             mov dx, word ptr es:[bx + 0x18]
6:E4A4  2af6                 sub dh, dh
6:E4A6  52                   push dx
6:E4A7  50                   push ax
6:E4A8  66ff76fc             push dword ptr [bp - 4]
6:E4AC  9af613bce4           lcall 0xe4bc, 0x13f6  ; sub_s7:13F6
6:E4B1  66ff76f0             push dword ptr [bp - 0x10]
6:E4B5  66ff76f8             push dword ptr [bp - 8]
6:E4B9  9af613dae4           lcall 0xe4da, 0x13f6  ; sub_s7:13F6
loc_E4BE:
6:E4BE  66ff46f0             inc dword ptr [bp - 0x10]
loc_E4C2:
6:E4C2  668b46f4             mov eax, dword ptr [bp - 0xc]
6:E4C6  8b56f6               mov dx, word ptr [bp - 0xa]
6:E4C9  663946f0             cmp dword ptr [bp - 0x10], eax
6:E4CD  7319                 jae 0xe4e8
6:E4CF  66ff76f0             push dword ptr [bp - 0x10]
6:E4D3  66ff76f8             push dword ptr [bp - 8]
6:E4D7  9a1213fde3           lcall 0xe3fd, 0x1312  ; sub_s7:1312
6:E4DC  8946ec               mov word ptr [bp - 0x14], ax
6:E4DF  8956ee               mov word ptr [bp - 0x12], dx
6:E4E2  0bd0                 or dx, ax
6:E4E4  75a0                 jne 0xe486
6:E4E6  ebd6                 jmp 0xe4be
loc_E4E8:
6:E4E8  c9                   leave
6:E4E9  ca0800               retf 8

; ---------------- DbIter::next@s6:E4EC FAR size=128 callers=42
6:E4EC  c8080000             enter 8, 0
6:E4F0  662bc0               sub eax, eax
6:E4F3  668946fc             mov dword ptr [bp - 4], eax
6:E4F7  c45e06               les bx, ptr [bp + 6]
6:E4FA  26394710             cmp word ptr es:[bx + 0x10], ax
6:E4FE  7438                 je 0xe538
loc_E500:
6:E500  c45e06               les bx, ptr [bp + 6]
6:E503  66268b470c           mov eax, dword ptr es:[bx + 0xc]
6:E508  6626394708           cmp dword ptr es:[bx + 8], eax
6:E50D  7752                 ja 0xe561
6:E50F  66268b4708           mov eax, dword ptr es:[bx + 8]
6:E514  668946f8             mov dword ptr [bp - 8], eax
6:E518  6626ff4708           inc dword ptr es:[bx + 8]
6:E51D  66ff76f8             push dword ptr [bp - 8]
6:E521  6626ff7704           push dword ptr es:[bx + 4]
6:E526  9a121355e5           lcall 0xe555, 0x1312  ; sub_s7:1312
6:E52B  8946fc               mov word ptr [bp - 4], ax
6:E52E  8956fe               mov word ptr [bp - 2], dx
6:E531  0bd0                 or dx, ax
6:E533  74cb                 je 0xe500
6:E535  eb2a                 jmp 0xe561
6:E537  db 90
loc_E538:
6:E538  c45e06               les bx, ptr [bp + 6]
6:E53B  6626837f0801         cmp dword ptr es:[bx + 8], 1
6:E541  721e                 jb 0xe561
6:E543  6626ff4f08           dec dword ptr es:[bx + 8]
6:E548  6626ff7708           push dword ptr es:[bx + 8]
6:E54D  6626ff7704           push dword ptr es:[bx + 4]
6:E552  9a1213afe4           lcall 0xe4af, 0x1312  ; sub_s7:1312
6:E557  8946fc               mov word ptr [bp - 4], ax
6:E55A  8956fe               mov word ptr [bp - 2], dx
6:E55D  0bd0                 or dx, ax
6:E55F  74d7                 je 0xe538
loc_E561:
6:E561  8b46fc               mov ax, word ptr [bp - 4]
6:E564  8b56fe               mov dx, word ptr [bp - 2]
6:E567  c9                   leave
6:E568  ca0400               retf 4
6:E56B  db 00

; ---------------- sub_s6:E56C FAR size=188 callers=1
6:E56C  c82a0000             enter 0x2a, 0
6:E570  66ff760e             push dword ptr [bp + 0xe]
6:E574  6a01                 push 1
6:E576  8d46ee               lea ax, [bp - 0x12]
6:E579  16                   push ss
6:E57A  50                   push ax
6:E57B  90                   nop
6:E57C  0e                   push cs
6:E57D  e8d2f6               call 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
6:E580  66c746ea00000000     mov dword ptr [bp - 0x16], 0
loc_E588:
6:E588  8d46ee               lea ax, [bp - 0x12]
6:E58B  16                   push ss
6:E58C  50                   push ax
6:E58D  90                   nop
6:E58E  0e                   push cs
6:E58F  e85aff               call 0xe4ec  ; DbIter::next@s6:E4EC
6:E592  8946e6               mov word ptr [bp - 0x1a], ax
6:E595  8956e8               mov word ptr [bp - 0x18], dx
6:E598  0bd0                 or dx, ax
6:E59A  7406                 je 0xe5a2
6:E59C  66ff46ea             inc dword ptr [bp - 0x16]
6:E5A0  ebe6                 jmp 0xe588
loc_E5A2:
6:E5A2  668b46ea             mov eax, dword ptr [bp - 0x16]
6:E5A6  668946d8             mov dword ptr [bp - 0x28], eax
6:E5AA  666a04               push 4
6:E5AD  8d46d8               lea ax, [bp - 0x28]
6:E5B0  16                   push ss
6:E5B1  50                   push ax
6:E5B2  66ff760a             push dword ptr [bp + 0xa]
6:E5B6  9a1c7ed0e5           lcall 0xe5d0, 0x7e1c  ; File_write@s2:7E1C
6:E5BB  0bc0                 or ax, ax
6:E5BD  751b                 jne 0xe5da
6:E5BF  c7061003d006         mov word ptr [0x310], 0x6d0
loc_E5C5:
6:E5C5  8946d6               mov word ptr [bp - 0x2a], ax
loc_E5C8:
6:E5C8  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
6:E5CD  c746f0ffde           mov word ptr [bp - 0x10], 0xdeff  ; SEGMENT s2:0000
6:E5D2  8b46d6               mov ax, word ptr [bp - 0x2a]
6:E5D5  c9                   leave
6:E5D6  ca0c00               retf 0xc
6:E5D9  db 90
loc_E5DA:
6:E5DA  837efe00             cmp word ptr [bp - 2], 0
6:E5DE  7406                 je 0xe5e6
6:E5E0  b80100               mov ax, 1
6:E5E3  99                   cdq
6:E5E4  eb06                 jmp 0xe5ec
loc_E5E6:
6:E5E6  8b46fa               mov ax, word ptr [bp - 6]
6:E5E9  8b56fc               mov dx, word ptr [bp - 4]
loc_E5EC:
6:E5EC  8946f6               mov word ptr [bp - 0xa], ax
6:E5EF  8956f8               mov word ptr [bp - 8], dx
loc_E5F2:
6:E5F2  8d46ee               lea ax, [bp - 0x12]
6:E5F5  16                   push ss
6:E5F6  50                   push ax
6:E5F7  90                   nop
6:E5F8  0e                   push cs
6:E5F9  e8f0fe               call 0xe4ec  ; DbIter::next@s6:E4EC
6:E5FC  8946e6               mov word ptr [bp - 0x1a], ax
6:E5FF  8956e8               mov word ptr [bp - 0x18], dx
6:E602  0bd0                 or dx, ax
6:E604  741a                 je 0xe620
6:E606  66ff760a             push dword ptr [bp + 0xa]
6:E60A  c45ee6               les bx, ptr [bp - 0x1a]
6:E60D  06                   push es
6:E60E  50                   push ax
6:E60F  26c41f               les bx, ptr es:[bx]
6:E612  26ff5f0c             lcall es:[bx + 0xc]
6:E616  8946d8               mov word ptr [bp - 0x28], ax
6:E619  0bc0                 or ax, ax
6:E61B  75d5                 jne 0xe5f2
6:E61D  eba6                 jmp 0xe5c5
6:E61F  db 90
loc_E620:
6:E620  c746d60100           mov word ptr [bp - 0x2a], 1
6:E625  eba1                 jmp 0xe5c8
6:E627  db 00

; ---------------- sub_s6:E628 FAR size=1478 callers=1
6:E628  c8340000             enter 0x34, 0
6:E62C  57                   push di
6:E62D  56                   push si
6:E62E  666a04               push 4
6:E631  8d46fc               lea ax, [bp - 4]
6:E634  16                   push ss
6:E635  50                   push ax
6:E636  66ff760a             push dword ptr [bp + 0xa]
6:E63A  9aee7db9e5           lcall 0xe5b9, 0x7dee  ; File_read@s2:7DEE
6:E63F  0bc0                 or ax, ax
6:E641  750d                 jne 0xe650
loc_E643:
6:E643  c7061003d206         mov word ptr [0x310], 0x6d2
6:E649  5e                   pop si
6:E64A  5f                   pop di
6:E64B  c9                   leave
6:E64C  ca0c00               retf 0xc
6:E64F  db 90
loc_E650:
6:E650  66c746f800000000     mov dword ptr [bp - 8], 0
6:E658  8b460e               mov ax, word ptr [bp + 0xe]
6:E65B  8b5610               mov dx, word ptr [bp + 0x10]
6:E65E  e95705               jmp 0xebb8
6:E661  db 90
loc_E662:
6:E662  66ff76fc             push dword ptr [bp - 4]
6:E666  c45e06               les bx, ptr [bp + 6]
6:E669  6626ff770e           push dword ptr es:[bx + 0xe]
6:E66E  9a5a14bee6           lcall 0xe6be, 0x145a  ; sub_s7:145A
6:E673  66c746e600000000     mov dword ptr [bp - 0x1a], 0
6:E67B  eb47                 jmp 0xe6c4
6:E67D  db 90
loc_E67E:
6:E67E  33c0                 xor ax, ax
6:E680  99                   cdq
loc_E681:
6:E681  8946ea               mov word ptr [bp - 0x16], ax
6:E684  8956ec               mov word ptr [bp - 0x14], dx
6:E687  66ff760a             push dword ptr [bp + 0xa]
6:E68B  52                   push dx
6:E68C  c45eea               les bx, ptr [bp - 0x16]
6:E68F  50                   push ax
6:E690  26c41f               les bx, ptr es:[bx]
6:E693  26ff5f10             lcall es:[bx + 0x10]
6:E697  0bc0                 or ax, ax
6:E699  0f844a05             je 0xebe7
6:E69D  c45eea               les bx, ptr [bp - 0x16]
6:E6A0  66268b4704           mov eax, dword ptr es:[bx + 4]
6:E6A5  268b5706             mov dx, word ptr es:[bx + 6]
6:E6A9  668946f4             mov dword ptr [bp - 0xc], eax
6:E6AD  2af6                 sub dh, dh
6:E6AF  52                   push dx
6:E6B0  50                   push ax
6:E6B1  06                   push es
6:E6B2  53                   push bx
6:E6B3  c45e06               les bx, ptr [bp + 6]
6:E6B6  6626ff770e           push dword ptr es:[bx + 0xe]
6:E6BB  9ab414e9e6           lcall 0xe6e9, 0x14b4  ; sub_s7:14B4
6:E6C0  66ff46e6             inc dword ptr [bp - 0x1a]
loc_E6C4:
6:E6C4  668b46fc             mov eax, dword ptr [bp - 4]
6:E6C8  663946e6             cmp dword ptr [bp - 0x1a], eax
6:E6CC  7320                 jae 0xe6ee
6:E6CE  6a14                 push 0x14
6:E6D0  9a9c176fe7           lcall 0xe76f, 0x179c  ; operator_new@s1:179C
6:E6D5  83c402               add sp, 2
6:E6D8  8946e2               mov word ptr [bp - 0x1e], ax
6:E6DB  8956e4               mov word ptr [bp - 0x1c], dx
6:E6DE  0bd0                 or dx, ax
6:E6E0  749c                 je 0xe67e
6:E6E2  ff76e4               push word ptr [bp - 0x1c]
6:E6E5  50                   push ax
6:E6E6  9a0a5df9e6           lcall 0xe6f9, 0x5d0a  ; sub_s7:5D0A
6:E6EB  eb94                 jmp 0xe681
6:E6ED  db 90
loc_E6EE:
6:E6EE  c45e06               les bx, ptr [bp + 6]
6:E6F1  6626ff770e           push dword ptr es:[bx + 0xe]
loc_E6F6:
6:E6F6  9a4c150de7           lcall 0xe70d, 0x154c  ; sub_s7:154C
6:E6FB  e9e604               jmp 0xebe4
loc_E6FE:
6:E6FE  66ff76fc             push dword ptr [bp - 4]
6:E702  c45e06               les bx, ptr [bp + 6]
6:E705  6626ff7712           push dword ptr es:[bx + 0x12]
6:E70A  9a5a145ae7           lcall 0xe75a, 0x145a  ; sub_s7:145A
6:E70F  66c746da00000000     mov dword ptr [bp - 0x26], 0
6:E717  eb47                 jmp 0xe760
6:E719  db 90
loc_E71A:
6:E71A  33c0                 xor ax, ax
6:E71C  99                   cdq
loc_E71D:
6:E71D  8946de               mov word ptr [bp - 0x22], ax
6:E720  8956e0               mov word ptr [bp - 0x20], dx
6:E723  66ff760a             push dword ptr [bp + 0xa]
6:E727  52                   push dx
6:E728  c45ede               les bx, ptr [bp - 0x22]
6:E72B  50                   push ax
6:E72C  26c41f               les bx, ptr es:[bx]
6:E72F  26ff5f10             lcall es:[bx + 0x10]
6:E733  0bc0                 or ax, ax
6:E735  0f84ae04             je 0xebe7
6:E739  c45ede               les bx, ptr [bp - 0x22]
6:E73C  66268b4704           mov eax, dword ptr es:[bx + 4]
6:E741  268b5706             mov dx, word ptr es:[bx + 6]
6:E745  668946f4             mov dword ptr [bp - 0xc], eax
6:E749  2af6                 sub dh, dh
6:E74B  52                   push dx
6:E74C  50                   push ax
6:E74D  06                   push es
6:E74E  53                   push bx
6:E74F  c45e06               les bx, ptr [bp + 6]
6:E752  6626ff7712           push dword ptr es:[bx + 0x12]
6:E757  9ab41485e7           lcall 0xe785, 0x14b4  ; sub_s7:14B4
6:E75C  66ff46da             inc dword ptr [bp - 0x26]
loc_E760:
6:E760  668b46fc             mov eax, dword ptr [bp - 4]
6:E764  663946da             cmp dword ptr [bp - 0x26], eax
6:E768  7320                 jae 0xe78a
6:E76A  6a1c                 push 0x1c
6:E76C  9a9c1726e8           lcall 0xe826, 0x179c  ; operator_new@s1:179C
6:E771  83c402               add sp, 2
6:E774  8946e2               mov word ptr [bp - 0x1e], ax
6:E777  8956e4               mov word ptr [bp - 0x1c], dx
6:E77A  0bd0                 or dx, ax
6:E77C  749c                 je 0xe71a
6:E77E  ff76e4               push word ptr [bp - 0x1c]
6:E781  50                   push ax
6:E782  9a5829a5e7           lcall 0xe7a5, 0x2958  ; sub_s7:2958
6:E787  eb94                 jmp 0xe71d
6:E789  db 90
loc_E78A:
6:E78A  c45e06               les bx, ptr [bp + 6]
6:E78D  6626ff7712           push dword ptr es:[bx + 0x12]
6:E792  e961ff               jmp 0xe6f6
6:E795  db 90
loc_E796:
6:E796  66ff76fc             push dword ptr [bp - 4]
6:E79A  c45e06               les bx, ptr [bp + 6]
6:E79D  6626ff7716           push dword ptr es:[bx + 0x16]
6:E7A2  9a5a14f6e7           lcall 0xe7f6, 0x145a  ; sub_s7:145A
6:E7A7  66c746da00000000     mov dword ptr [bp - 0x26], 0
6:E7AF  eb66                 jmp 0xe817
6:E7B1  db 90
loc_E7B2:
6:E7B2  33c0                 xor ax, ax
6:E7B4  99                   cdq
loc_E7B5:
6:E7B5  8946de               mov word ptr [bp - 0x22], ax
6:E7B8  8956e0               mov word ptr [bp - 0x20], dx
6:E7BB  66ff760a             push dword ptr [bp + 0xa]
6:E7BF  52                   push dx
6:E7C0  c45ede               les bx, ptr [bp - 0x22]
6:E7C3  50                   push ax
6:E7C4  26c41f               les bx, ptr es:[bx]
6:E7C7  26ff5f10             lcall es:[bx + 0x10]
6:E7CB  0bc0                 or ax, ax
6:E7CD  0f841604             je 0xebe7
6:E7D1  c45ede               les bx, ptr [bp - 0x22]
6:E7D4  66268b4704           mov eax, dword ptr es:[bx + 4]
6:E7D9  668946f4             mov dword ptr [bp - 0xc], eax
6:E7DD  66268b4710           mov eax, dword ptr es:[bx + 0x10]
6:E7E2  668946e6             mov dword ptr [bp - 0x1a], eax
6:E7E6  66ff76f4             push dword ptr [bp - 0xc]
6:E7EA  6650                 push eax
6:E7EC  6a00                 push 0
6:E7EE  66ff364057           push dword ptr [0x5740]
6:E7F3  9a226211e8           lcall 0xe811, 0x6222  ; sub_s7:6222
6:E7F8  8b46f4               mov ax, word ptr [bp - 0xc]
6:E7FB  8b56f6               mov dx, word ptr [bp - 0xa]
6:E7FE  2af6                 sub dh, dh
6:E800  52                   push dx
6:E801  50                   push ax
6:E802  66ff76de             push dword ptr [bp - 0x22]
6:E806  c45e06               les bx, ptr [bp + 6]
6:E809  6626ff7716           push dword ptr es:[bx + 0x16]
6:E80E  9ab4143ee8           lcall 0xe83e, 0x14b4  ; sub_s7:14B4
6:E813  66ff46da             inc dword ptr [bp - 0x26]
loc_E817:
6:E817  668b46fc             mov eax, dword ptr [bp - 4]
6:E81B  663946da             cmp dword ptr [bp - 0x26], eax
6:E81F  7323                 jae 0xe844
6:E821  6a1e                 push 0x1e
6:E823  9a9c17c2e8           lcall 0xe8c2, 0x179c  ; operator_new@s1:179C
6:E828  83c402               add sp, 2
6:E82B  8946e2               mov word ptr [bp - 0x1e], ax
6:E82E  8956e4               mov word ptr [bp - 0x1c], dx
6:E831  0bd0                 or dx, ax
6:E833  0f847bff             je 0xe7b2
6:E837  ff76e4               push word ptr [bp - 0x1c]
6:E83A  50                   push ax
6:E83B  9a0e565fe8           lcall 0xe85f, 0x560e  ; sub_s7:560E
6:E840  e972ff               jmp 0xe7b5
6:E843  db 90
loc_E844:
6:E844  c45e06               les bx, ptr [bp + 6]
6:E847  6626ff7716           push dword ptr es:[bx + 0x16]
6:E84C  e9a7fe               jmp 0xe6f6
6:E84F  db 90
loc_E850:
6:E850  66ff76fc             push dword ptr [bp - 4]
6:E854  c45e06               les bx, ptr [bp + 6]
6:E857  6626ff771a           push dword ptr es:[bx + 0x1a]
6:E85C  9a5a14ace8           lcall 0xe8ac, 0x145a  ; sub_s7:145A
6:E861  66c746d200000000     mov dword ptr [bp - 0x2e], 0
6:E869  eb47                 jmp 0xe8b2
6:E86B  db 90
loc_E86C:
6:E86C  33c0                 xor ax, ax
6:E86E  99                   cdq
loc_E86F:
6:E86F  8946d6               mov word ptr [bp - 0x2a], ax
6:E872  8956d8               mov word ptr [bp - 0x28], dx
6:E875  66ff760a             push dword ptr [bp + 0xa]
6:E879  52                   push dx
6:E87A  c45ed6               les bx, ptr [bp - 0x2a]
6:E87D  50                   push ax
6:E87E  26c41f               les bx, ptr es:[bx]
6:E881  26ff5f10             lcall es:[bx + 0x10]
6:E885  0bc0                 or ax, ax
6:E887  0f845c03             je 0xebe7
6:E88B  c45ed6               les bx, ptr [bp - 0x2a]
6:E88E  66268b4704           mov eax, dword ptr es:[bx + 4]
6:E893  268b5706             mov dx, word ptr es:[bx + 6]
6:E897  668946f4             mov dword ptr [bp - 0xc], eax
6:E89B  2af6                 sub dh, dh
6:E89D  52                   push dx
6:E89E  50                   push ax
6:E89F  06                   push es
6:E8A0  53                   push bx
6:E8A1  c45e06               les bx, ptr [bp + 6]
6:E8A4  6626ff771a           push dword ptr es:[bx + 0x1a]
6:E8A9  9ab414f7e8           lcall 0xe8f7, 0x14b4  ; sub_s7:14B4
6:E8AE  66ff46d2             inc dword ptr [bp - 0x2e]
loc_E8B2:
6:E8B2  668b46fc             mov eax, dword ptr [bp - 4]
6:E8B6  663946d2             cmp dword ptr [bp - 0x2e], eax
6:E8BA  7320                 jae 0xe8dc
6:E8BC  681e02               push 0x21e
6:E8BF  9a9c17ade9           lcall 0xe9ad, 0x179c  ; operator_new@s1:179C
6:E8C4  83c402               add sp, 2
6:E8C7  8946e2               mov word ptr [bp - 0x1e], ax
6:E8CA  8956e4               mov word ptr [bp - 0x1c], dx
6:E8CD  0bd0                 or dx, ax
6:E8CF  749b                 je 0xe86c
6:E8D1  ff76e4               push word ptr [bp - 0x1c]
6:E8D4  50                   push ax
6:E8D5  9aaa30d8de           lcall 0xded8, 0x30aa  ; sub_s8:30AA
6:E8DA  eb93                 jmp 0xe86f
loc_E8DC:
6:E8DC  c45e06               les bx, ptr [bp + 6]
6:E8DF  6626ff771a           push dword ptr es:[bx + 0x1a]
6:E8E4  e90ffe               jmp 0xe6f6
6:E8E7  db 90
loc_E8E8:
6:E8E8  66ff76fc             push dword ptr [bp - 4]
6:E8EC  c45e06               les bx, ptr [bp + 6]
6:E8EF  6626ff771e           push dword ptr es:[bx + 0x1e]
6:E8F4  9a5a1405e9           lcall 0xe905, 0x145a  ; sub_s7:145A
6:E8F9  66ff76fc             push dword ptr [bp - 4]
6:E8FD  66ff364057           push dword ptr [0x5740]
6:E902  9ade6675e9           lcall 0xe975, 0x66de  ; sub_s7:66DE
6:E907  66c746d200000000     mov dword ptr [bp - 0x2e], 0
6:E90F  e98400               jmp 0xe996
6:E912  db 90 90
loc_E914:
6:E914  33c0                 xor ax, ax
6:E916  99                   cdq
loc_E917:
6:E917  8946d6               mov word ptr [bp - 0x2a], ax
6:E91A  8956d8               mov word ptr [bp - 0x28], dx
6:E91D  66ff760a             push dword ptr [bp + 0xa]
6:E921  52                   push dx
6:E922  c45ed6               les bx, ptr [bp - 0x2a]
6:E925  50                   push ax
6:E926  26c41f               les bx, ptr es:[bx]
6:E929  26ff5f10             lcall es:[bx + 0x10]
6:E92D  0bc0                 or ax, ax
6:E92F  0f84b402             je 0xebe7
6:E933  c45ed6               les bx, ptr [bp - 0x2a]
6:E936  66268b4704           mov eax, dword ptr es:[bx + 4]
6:E93B  668946f4             mov dword ptr [bp - 0xc], eax
6:E93F  66268b4708           mov eax, dword ptr es:[bx + 8]
6:E944  668946da             mov dword ptr [bp - 0x26], eax
6:E948  8bc3                 mov ax, bx
6:E94A  8cc2                 mov dx, es
6:E94C  050c00               add ax, 0xc
6:E94F  1e                   push ds
6:E950  8d7ecc               lea di, [bp - 0x34]
6:E953  8bf0                 mov si, ax
6:E955  16                   push ss
6:E956  07                   pop es
6:E957  8eda                 mov ds, dx
6:E959  66a5                 movsd dword ptr es:[di], dword ptr [si]
6:E95B  a5                   movsw word ptr es:[di], word ptr [si]
6:E95C  1f                   pop ds
6:E95D  8d46cc               lea ax, [bp - 0x34]
6:E960  8946de               mov word ptr [bp - 0x22], ax
6:E963  66ff76da             push dword ptr [bp - 0x26]
6:E967  16                   push ss
6:E968  50                   push ax
6:E969  66ff76f4             push dword ptr [bp - 0xc]
6:E96D  66ff364057           push dword ptr [0x5740]
6:E972  9a1c6790e9           lcall 0xe990, 0x671c  ; sub_s7:671C
6:E977  8b46f4               mov ax, word ptr [bp - 0xc]
6:E97A  8b56f6               mov dx, word ptr [bp - 0xa]
6:E97D  2af6                 sub dh, dh
6:E97F  52                   push dx
6:E980  50                   push ax
6:E981  66ff76d6             push dword ptr [bp - 0x2a]
6:E985  c45e06               les bx, ptr [bp + 6]
6:E988  6626ff771e           push dword ptr es:[bx + 0x1e]
6:E98D  9ab414c2e9           lcall 0xe9c2, 0x14b4  ; sub_s7:14B4
6:E992  66ff46d2             inc dword ptr [bp - 0x2e]
loc_E996:
6:E996  668b46fc             mov eax, dword ptr [bp - 4]
6:E99A  663946d2             cmp dword ptr [bp - 0x2e], eax
6:E99E  7328                 jae 0xe9c8
6:E9A0  66a14457             mov eax, dword ptr [0x5744]
6:E9A4  668946ee             mov dword ptr [bp - 0x12], eax
6:E9A8  6650                 push eax
6:E9AA  9afc071be1           lcall 0xe11b, 0x7fc  ; sub_s1:07FC
6:E9AF  8946e2               mov word ptr [bp - 0x1e], ax
6:E9B2  8956e4               mov word ptr [bp - 0x1c], dx
6:E9B5  0bd0                 or dx, ax
6:E9B7  0f8459ff             je 0xe914
6:E9BB  ff76e4               push word ptr [bp - 0x1c]
6:E9BE  50                   push ax
6:E9BF  9acc67d3e9           lcall 0xe9d3, 0x67cc  ; sub_s7:67CC
6:E9C4  e950ff               jmp 0xe917
6:E9C7  db 90
loc_E9C8:
6:E9C8  c45e06               les bx, ptr [bp + 6]
6:E9CB  6626ff771e           push dword ptr es:[bx + 0x1e]
6:E9D0  9a4c1529e5           lcall 0xe529, 0x154c  ; sub_s7:154C
6:E9D5  66ff364057           push dword ptr [0x5740]
6:E9DA  9a4067f1e9           lcall 0xe9f1, 0x6740  ; sub_s7:6740
6:E9DF  e90202               jmp 0xebe4
loc_E9E2:
6:E9E2  66ff76fc             push dword ptr [bp - 4]
6:E9E6  c45e06               les bx, ptr [bp + 6]
6:E9E9  6626ff7722           push dword ptr es:[bx + 0x22]
6:E9EE  9a5a143eea           lcall 0xea3e, 0x145a  ; sub_s7:145A
6:E9F3  66c746cc00000000     mov dword ptr [bp - 0x34], 0
6:E9FB  eb47                 jmp 0xea44
6:E9FD  db 90
loc_E9FE:
6:E9FE  33c0                 xor ax, ax
6:EA00  99                   cdq
loc_EA01:
6:EA01  8946d2               mov word ptr [bp - 0x2e], ax
6:EA04  8956d4               mov word ptr [bp - 0x2c], dx
6:EA07  66ff760a             push dword ptr [bp + 0xa]
6:EA0B  52                   push dx
6:EA0C  c45ed2               les bx, ptr [bp - 0x2e]
6:EA0F  50                   push ax
6:EA10  26c41f               les bx, ptr es:[bx]
6:EA13  26ff5f10             lcall es:[bx + 0x10]
6:EA17  0bc0                 or ax, ax
6:EA19  0f84ca01             je 0xebe7
6:EA1D  c45ed2               les bx, ptr [bp - 0x2e]
6:EA20  66268b4704           mov eax, dword ptr es:[bx + 4]
6:EA25  268b5706             mov dx, word ptr es:[bx + 6]
6:EA29  668946f4             mov dword ptr [bp - 0xc], eax
6:EA2D  2af6                 sub dh, dh
6:EA2F  52                   push dx
6:EA30  50                   push ax
6:EA31  06                   push es
6:EA32  53                   push bx
6:EA33  c45e06               les bx, ptr [bp + 6]
6:EA36  6626ff7722           push dword ptr es:[bx + 0x22]
6:EA3B  9ab41489ea           lcall 0xea89, 0x14b4  ; sub_s7:14B4
6:EA40  66ff46cc             inc dword ptr [bp - 0x34]
loc_EA44:
6:EA44  668b46fc             mov eax, dword ptr [bp - 4]
6:EA48  663946cc             cmp dword ptr [bp - 0x34], eax
6:EA4C  7320                 jae 0xea6e
6:EA4E  6a0e                 push 0xe
6:EA50  9a9c1792eb           lcall 0xeb92, 0x179c  ; operator_new@s1:179C
6:EA55  83c402               add sp, 2
6:EA58  8946e2               mov word ptr [bp - 0x1e], ax
6:EA5B  8956e4               mov word ptr [bp - 0x1c], dx
6:EA5E  0bd0                 or dx, ax
6:EA60  749c                 je 0xe9fe
6:EA62  ff76e4               push word ptr [bp - 0x1c]
6:EA65  50                   push ax
6:EA66  90                   nop
6:EA67  0e                   push cs
6:EA68  e899c7               call 0xb204  ; sub_s6:B204
6:EA6B  eb94                 jmp 0xea01
6:EA6D  db 90
loc_EA6E:
6:EA6E  c45e06               les bx, ptr [bp + 6]
6:EA71  6626ff7722           push dword ptr es:[bx + 0x22]
6:EA76  e97dfc               jmp 0xe6f6
6:EA79  db 90
loc_EA7A:
6:EA7A  66ff76fc             push dword ptr [bp - 4]
6:EA7E  c45e06               les bx, ptr [bp + 6]
6:EA81  6626ff7726           push dword ptr es:[bx + 0x26]
6:EA86  9a5a14adea           lcall 0xeaad, 0x145a  ; sub_s7:145A
6:EA8B  66c746cc00000000     mov dword ptr [bp - 0x34], 0
6:EA93  eb5d                 jmp 0xeaf2
6:EA95  db 90
loc_EA96:
6:EA96  ff76d2               push word ptr [bp - 0x2e]
6:EA99  66ff760a             push dword ptr [bp + 0xa]
6:EA9D  9aea730beb           lcall 0xeb0b, 0x73ea  ; sub_s2:73EA
6:EAA2  8946d6               mov word ptr [bp - 0x2a], ax
6:EAA5  50                   push ax
6:EAA6  66ff7606             push dword ptr [bp + 6]
6:EAAA  9a0000ecea           lcall 0xeaec, 0  ; sub_s7:0000
6:EAAF  8946da               mov word ptr [bp - 0x26], ax
6:EAB2  8956dc               mov word ptr [bp - 0x24], dx
6:EAB5  66ff760a             push dword ptr [bp + 0xa]
6:EAB9  52                   push dx
6:EABA  c45eda               les bx, ptr [bp - 0x26]
6:EABD  50                   push ax
6:EABE  26c41f               les bx, ptr es:[bx]
6:EAC1  26ff5f10             lcall es:[bx + 0x10]
6:EAC5  0bc0                 or ax, ax
6:EAC7  0f841c01             je 0xebe7
6:EACB  c45eda               les bx, ptr [bp - 0x26]
6:EACE  66268b4704           mov eax, dword ptr es:[bx + 4]
6:EAD3  268b5706             mov dx, word ptr es:[bx + 6]
6:EAD7  668946f4             mov dword ptr [bp - 0xc], eax
6:EADB  2af6                 sub dh, dh
6:EADD  52                   push dx
6:EADE  50                   push ax
6:EADF  06                   push es
6:EAE0  53                   push bx
6:EAE1  c45e06               les bx, ptr [bp + 6]
6:EAE4  6626ff7726           push dword ptr es:[bx + 0x26]
6:EAE9  9ab4142feb           lcall 0xeb2f, 0x14b4  ; sub_s7:14B4
6:EAEE  66ff46cc             inc dword ptr [bp - 0x34]
loc_EAF2:
6:EAF2  668b46fc             mov eax, dword ptr [bp - 4]
6:EAF6  663946cc             cmp dword ptr [bp - 0x34], eax
6:EAFA  7318                 jae 0xeb14
6:EAFC  666a02               push 2
6:EAFF  8d46d2               lea ax, [bp - 0x2e]
6:EB02  16                   push ss
6:EB03  50                   push ax
6:EB04  66ff760a             push dword ptr [bp + 0xa]
6:EB08  9aee7d3de6           lcall 0xe63d, 0x7dee  ; File_read@s2:7DEE
6:EB0D  0bc0                 or ax, ax
6:EB0F  7585                 jne 0xea96
6:EB11  e92ffb               jmp 0xe643
loc_EB14:
6:EB14  c45e06               les bx, ptr [bp + 6]
6:EB17  6626ff7726           push dword ptr es:[bx + 0x26]
6:EB1C  e9d7fb               jmp 0xe6f6
6:EB1F  db 90
loc_EB20:
6:EB20  66ff76fc             push dword ptr [bp - 4]
6:EB24  c45e06               les bx, ptr [bp + 6]
6:EB27  6626ff772a           push dword ptr es:[bx + 0x2a]
6:EB2C  9a5a147ceb           lcall 0xeb7c, 0x145a  ; sub_s7:145A
6:EB31  66c746cc00000000     mov dword ptr [bp - 0x34], 0
6:EB39  eb47                 jmp 0xeb82
6:EB3B  db 90
loc_EB3C:
6:EB3C  33c0                 xor ax, ax
6:EB3E  99                   cdq
loc_EB3F:
6:EB3F  8946d2               mov word ptr [bp - 0x2e], ax
6:EB42  8956d4               mov word ptr [bp - 0x2c], dx
6:EB45  66ff760a             push dword ptr [bp + 0xa]
6:EB49  52                   push dx
6:EB4A  c45ed2               les bx, ptr [bp - 0x2e]
6:EB4D  50                   push ax
6:EB4E  26c41f               les bx, ptr es:[bx]
6:EB51  26ff5f10             lcall es:[bx + 0x10]
6:EB55  0bc0                 or ax, ax
6:EB57  0f848c00             je 0xebe7
6:EB5B  c45ed2               les bx, ptr [bp - 0x2e]
6:EB5E  66268b4704           mov eax, dword ptr es:[bx + 4]
6:EB63  268b5706             mov dx, word ptr es:[bx + 6]
6:EB67  668946f4             mov dword ptr [bp - 0xc], eax
6:EB6B  2af6                 sub dh, dh
6:EB6D  52                   push dx
6:EB6E  50                   push ax
6:EB6F  06                   push es
6:EB70  53                   push bx
6:EB71  c45e06               les bx, ptr [bp + 6]
6:EB74  6626ff772a           push dword ptr es:[bx + 0x2a]
6:EB79  9ab414a8eb           lcall 0xeba8, 0x14b4  ; sub_s7:14B4
6:EB7E  66ff46cc             inc dword ptr [bp - 0x34]
loc_EB82:
6:EB82  668b46fc             mov eax, dword ptr [bp - 4]
6:EB86  663946cc             cmp dword ptr [bp - 0x34], eax
6:EB8A  7320                 jae 0xebac
6:EB8C  68b203               push 0x3b2
6:EB8F  9a9c17d3e6           lcall 0xe6d3, 0x179c  ; operator_new@s1:179C
6:EB94  83c402               add sp, 2
6:EB97  8946e2               mov word ptr [bp - 0x1e], ax
6:EB9A  8956e4               mov word ptr [bp - 0x1c], dx
6:EB9D  0bd0                 or dx, ax
6:EB9F  749b                 je 0xeb3c
6:EBA1  ff76e4               push word ptr [bp - 0x1c]
6:EBA4  50                   push ax
6:EBA5  9a682071e6           lcall 0xe671, 0x2068  ; sub_s7:2068
6:EBAA  eb93                 jmp 0xeb3f
loc_EBAC:
6:EBAC  c45e06               les bx, ptr [bp + 6]
6:EBAF  6626ff772a           push dword ptr es:[bx + 0x2a]
6:EBB4  e93ffb               jmp 0xe6f6
6:EBB7  db 90
loc_EBB8:
6:EBB8  0bc0                 or ax, ax
6:EBBA  7528                 jne 0xebe4
6:EBBC  81ea0001             sub dx, 0x100
6:EBC0  f6c2ff               test dl, 0xff
6:EBC3  751f                 jne 0xebe4
6:EBC5  c1ea07               shr dx, 7
6:EBC8  83fa0e               cmp dx, 0xe
6:EBCB  7717                 ja 0xebe4
6:EBCD  8bda                 mov bx, dx
6:EBCF  2effa7d4eb           jmp word ptr cs:[bx - 0x142c]
switch_table_EBD4:
    dw loc_E662
    dw loc_E6FE
    dw loc_E796
    dw loc_E850
    dw loc_E8E8
    dw loc_E9E2
    dw loc_EA7A
    dw loc_EB20
    dw loc_01B8
    dw loc_5E00
    dw loc_C95F
    dw loc_0CCA
    dw loc_0000
    dw loc_18C8
    dw loc_0000
6:EBF2  6a14                 push 0x14
6:EBF4  9a9c1753ea           lcall 0xea53, 0x179c  ; operator_new@s1:179C
6:EBF9  83c402               add sp, 2
6:EBFC  8956f6               mov word ptr [bp - 0xa], dx
6:EBFF  0bd0                 or dx, ax
6:EC01  7409                 je 0xec0c
6:EC03  ff76f6               push word ptr [bp - 0xa]
6:EC06  50                   push ax
6:EC07  9a321a17ec           lcall 0xec17, 0x1a32  ; sub_s7:1A32
loc_EC0C:
6:EC0C  c45e06               les bx, ptr [bp + 6]
6:EC0F  6626ff7752           push dword ptr es:[bx + 0x52]
6:EC14  9a7445dde9           lcall 0xe9dd, 0x4574  ; sub_s7:4574
6:EC19  c41e6651             les bx, ptr [0x5166]
6:EC1D  26894710             mov word ptr es:[bx + 0x10], ax
6:EC21  26895712             mov word ptr es:[bx + 0x12], dx
6:EC25  c41e6651             les bx, ptr [0x5166]
6:EC29  268b4704             mov ax, word ptr es:[bx + 4]
6:EC2D  268b5706             mov dx, word ptr es:[bx + 6]
6:EC31  c9                   leave
6:EC32  ca0400               retf 4
6:EC35  db 00 c8 1c 00 00 6a 14 9a 9c 17 f7 eb 83 c4 02 89
6:EC45  db 56 f2 0b d0 74 0f 66 ff 76 10 ff 76 f2 50 9a 3c
6:EC55  db 5d 71 ec eb 03 33 c0 99 89 46 fc 89 56 fe ff 76
6:EC65  db 0c c4 5e 06 66 26 ff 77 52 9a 94 45 7c ec 52 50
6:EC75  db 66 ff 76 fc 9a e2 5f 9f ec c4 5e fc 66 26 8b 47
6:EC85  db 04 26 8b 57 06 66 89 46 f4 2a f6 52 50 06 53 c4
6:EC95  db 5e 06 66 26 ff 77 0e 9a 58 13 0a ec 8b 46 f4 8b
6:ECA5  db 56 f6 c9 ca 0e 00 00 c8 1c 00 00 6a 1c 9a 9c 17
6:ECB5  db 3f ec 83 c4 02 89 56 f2 0b d0 74 0f 66 ff 76 10
6:ECC5  db ff 76 f2 50 9a 9a 29 e8 ec eb 03 33 c0 99 89 46
6:ECD5  db fc 89 56 fe 8b 46 0c 50 c4 5e 06 66 26 ff 77 52
6:ECE5  db 9a 28 46 fd ec 8e c2 8b d8 8b 46 0c 26 89 07 52
6:ECF5  db 53 66 ff 76 fc 9a 06 30 20 ed c4 5e fc 66 26 8b
6:ED05  db 47 04 26 8b 57 06 66 89 46 f4 2a f6 52 50 06 53
6:ED15  db c4 5e 06 66 26 ff 77 12 9a 58 13 56 ec 8b 46 f4
6:ED25  db 8b 56 f6 c9 ca 0e 00

; ---------------- sub_s6:ED2C size=296 callers=0
6:ED2C  c81c0000             enter 0x1c, 0
6:ED30  6a1e                 push 0x1e
6:ED32  9a9c17b5ec           lcall 0xecb5, 0x179c  ; operator_new@s1:179C
6:ED37  83c402               add sp, 2
6:ED3A  8956f2               mov word ptr [bp - 0xe], dx
6:ED3D  0bd0                 or dx, ax
6:ED3F  740f                 je 0xed50
6:ED41  66ff7610             push dword ptr [bp + 0x10]
6:ED45  ff76f2               push word ptr [bp - 0xe]
6:ED48  50                   push ax
6:ED49  9a5a566ded           lcall 0xed6d, 0x565a  ; sub_s7:565A
6:ED4E  eb03                 jmp 0xed53
loc_ED50:
6:ED50  33c0                 xor ax, ax
6:ED52  99                   cdq
loc_ED53:
6:ED53  8946fc               mov word ptr [bp - 4], ax
6:ED56  8956fe               mov word ptr [bp - 2], dx
6:ED59  ff760c               push word ptr [bp + 0xc]
6:ED5C  666801000100         push 0x10001
6:ED62  c45e06               les bx, ptr [bp + 6]
6:ED65  6626ff7752           push dword ptr es:[bx + 0x52]
6:ED6A  9a82477eed           lcall 0xed7e, 0x4782  ; sub_s7:4782
6:ED6F  8946f8               mov word ptr [bp - 8], ax
6:ED72  8956fa               mov word ptr [bp - 6], dx
6:ED75  52                   push dx
6:ED76  50                   push ax
6:ED77  66ff76fc             push dword ptr [bp - 4]
6:ED7B  9a805a9ced           lcall 0xed9c, 0x5a80  ; sub_s7:5A80
6:ED80  c45efc               les bx, ptr [bp - 4]
6:ED83  66268b4704           mov eax, dword ptr es:[bx + 4]
6:ED88  668946f4             mov dword ptr [bp - 0xc], eax
6:ED8C  6650                 push eax
6:ED8E  66ff76f8             push dword ptr [bp - 8]
6:ED92  6a01                 push 1
6:ED94  66ff364057           push dword ptr [0x5740]
6:ED99  9a2262b7ed           lcall 0xedb7, 0x6222  ; sub_s7:6222
6:ED9E  8b46f4               mov ax, word ptr [bp - 0xc]
6:EDA1  8b56f6               mov dx, word ptr [bp - 0xa]
6:EDA4  2af6                 sub dh, dh
6:EDA6  52                   push dx
6:EDA7  50                   push ax
6:EDA8  66ff76fc             push dword ptr [bp - 4]
6:EDAC  c45e06               les bx, ptr [bp + 6]
6:EDAF  6626ff7716           push dword ptr es:[bx + 0x16]
6:EDB4  9a5813ccec           lcall 0xeccc, 0x1358  ; sub_s7:1358
6:EDB9  8b46f4               mov ax, word ptr [bp - 0xc]
6:EDBC  8b56f6               mov dx, word ptr [bp - 0xa]
6:EDBF  c9                   leave
6:EDC0  ca0e00               retf 0xe
6:EDC3  db 00 c8 28 00 00 8d 46 e8 16 50 66 ff 76 10 66 8b
6:EDD3  db 46 0c 66 89 46 fc 66 50 66 ff 36 40 57 9a ce 64
6:EDE3  db 48 ee 8b d8 8e c2 66 26 8b 07 66 89 46 f8 66 89
6:EDF3  db 46 f4 68 1e 02 9a 9c 17 35 ed 83 c4 02 89 46 e4
6:EE03  db 89 56 e6 0b d0 74 14 66 ff 76 10 66 ff 76 f4 ff
6:EE13  db 76 e6 50 9a 22 32 d8 e8 eb 04 90 33 c0 99 89 46
6:EE23  db f0 89 56 f2 c4 5e f0 66 26 8b 47 04 26 8b 57 06
6:EE33  db 66 89 46 ec 2a f6 52 50 06 53 c4 5e 06 66 26 ff
6:EE43  db 77 1a 9a 58 13 4c ed 8b 46 ec 8b 56 ee c9 ca 0e
6:EE53  db 00

; ---------------- sub_s6:EE54 size=172 callers=0
6:EE54  c8280000             enter 0x28, 0
6:EE58  8d46ec               lea ax, [bp - 0x14]
6:EE5B  16                   push ss
6:EE5C  50                   push ax
6:EE5D  66ff7610             push dword ptr [bp + 0x10]
6:EE61  668b460c             mov eax, dword ptr [bp + 0xc]
6:EE65  668946fc             mov dword ptr [bp - 4], eax
6:EE69  6650                 push eax
6:EE6B  66ff364057           push dword ptr [0x5740]
6:EE70  9ace64adee           lcall 0xeead, 0x64ce  ; sub_s7:64CE
6:EE75  8bd8                 mov bx, ax
6:EE77  8ec2                 mov es, dx
6:EE79  66268b07             mov eax, dword ptr es:[bx]
6:EE7D  668946f8             mov dword ptr [bp - 8], eax
6:EE81  66a14457             mov eax, dword ptr [0x5744]
6:EE85  668946dc             mov dword ptr [bp - 0x24], eax
6:EE89  6650                 push eax
6:EE8B  9afc07fbed           lcall 0xedfb, 0x7fc  ; sub_s1:07FC
6:EE90  8946e8               mov word ptr [bp - 0x18], ax
6:EE93  8956ea               mov word ptr [bp - 0x16], dx
6:EE96  0bd0                 or dx, ax
6:EE98  7418                 je 0xeeb2
6:EE9A  66ff7610             push dword ptr [bp + 0x10]
6:EE9E  66ff76f8             push dword ptr [bp - 8]
6:EEA2  66ff76fc             push dword ptr [bp - 4]
6:EEA6  ff76ea               push word ptr [bp - 0x16]
6:EEA9  50                   push ax
6:EEAA  9a4c68d9ee           lcall 0xeed9, 0x684c  ; sub_s7:684C
6:EEAF  eb04                 jmp 0xeeb5
6:EEB1  db 90
loc_EEB2:
6:EEB2  33c0                 xor ax, ax
6:EEB4  99                   cdq
loc_EEB5:
6:EEB5  8946f4               mov word ptr [bp - 0xc], ax
6:EEB8  8956f6               mov word ptr [bp - 0xa], dx
6:EEBB  c45ef4               les bx, ptr [bp - 0xc]
6:EEBE  66268b4704           mov eax, dword ptr es:[bx + 4]
6:EEC3  668946f0             mov dword ptr [bp - 0x10], eax
6:EEC7  66ff7610             push dword ptr [bp + 0x10]
6:EECB  66ff76fc             push dword ptr [bp - 4]
6:EECF  6650                 push eax
6:EED1  66ff364057           push dword ptr [0x5740]
6:EED6  9afe61f4ee           lcall 0xeef4, 0x61fe  ; sub_s7:61FE
6:EEDB  8b46f0               mov ax, word ptr [bp - 0x10]
6:EEDE  8b56f2               mov dx, word ptr [bp - 0xe]
6:EEE1  2af6                 sub dh, dh
6:EEE3  52                   push dx
6:EEE4  50                   push ax
6:EEE5  66ff76f4             push dword ptr [bp - 0xc]
6:EEE9  c45e06               les bx, ptr [bp + 6]
6:EEEC  6626ff771e           push dword ptr es:[bx + 0x1e]
6:EEF1  9a5813e3ed           lcall 0xede3, 0x1358  ; sub_s7:1358
6:EEF6  8b46f0               mov ax, word ptr [bp - 0x10]
6:EEF9  8b56f2               mov dx, word ptr [bp - 0xe]
6:EEFC  c9                   leave
6:EEFD  ca0e00               retf 0xe

; ---------------- sub_s6:EF00 size=190 callers=0
6:EF00  c81a0000             enter 0x1a, 0
6:EF04  66c746fc00000000     mov dword ptr [bp - 4], 0
6:EF0C  8b460c               mov ax, word ptr [bp + 0xc]
6:EF0F  8946fa               mov word ptr [bp - 6], ax
6:EF12  3d0400               cmp ax, 4
6:EF15  7523                 jne 0xef3a
6:EF17  6a16                 push 0x16
6:EF19  9a9c1745ef           lcall 0xef45, 0x179c  ; operator_new@s1:179C
6:EF1E  83c402               add sp, 2
6:EF21  8956f4               mov word ptr [bp - 0xc], dx
6:EF24  0bd0                 or dx, ax
6:EF26  7460                 je 0xef88
6:EF28  66ff7610             push dword ptr [bp + 0x10]
6:EF2C  ff760c               push word ptr [bp + 0xc]
6:EF2F  ff76f4               push word ptr [bp - 0xc]
6:EF32  50                   push ax
6:EF33  9a36b95fef           lcall 0xef5f, 0xb936  ; sub_s7:B936
6:EF38  eb51                 jmp 0xef8b
loc_EF3A:
6:EF3A  837efa0c             cmp word ptr [bp - 6], 0xc
6:EF3E  7524                 jne 0xef64
6:EF40  6a0e                 push 0xe
6:EF42  9a9c1769ef           lcall 0xef69, 0x179c  ; operator_new@s1:179C
6:EF47  83c402               add sp, 2
6:EF4A  8956f4               mov word ptr [bp - 0xc], dx
6:EF4D  0bd0                 or dx, ax
6:EF4F  7437                 je 0xef88
6:EF51  66ff7610             push dword ptr [bp + 0x10]
6:EF55  ff76fa               push word ptr [bp - 6]
6:EF58  ff76f4               push word ptr [bp - 0xc]
6:EF5B  50                   push ax
6:EF5C  9a24bcb2ef           lcall 0xefb2, 0xbc24  ; sub_s7:BC24
6:EF61  eb28                 jmp 0xef8b
6:EF63  db 90
loc_EF64:
6:EF64  6a0e                 push 0xe
6:EF66  9a9c178eee           lcall 0xee8e, 0x179c  ; operator_new@s1:179C
6:EF6B  83c402               add sp, 2
6:EF6E  8956f4               mov word ptr [bp - 0xc], dx
6:EF71  0bd0                 or dx, ax
6:EF73  7413                 je 0xef88
6:EF75  66ff7610             push dword ptr [bp + 0x10]
6:EF79  ff76fa               push word ptr [bp - 6]
6:EF7C  ff76f4               push word ptr [bp - 0xc]
6:EF7F  50                   push ax
6:EF80  90                   nop
6:EF81  0e                   push cs
6:EF82  e8a7c2               call 0xb22c  ; sub_s6:B22C
6:EF85  eb04                 jmp 0xef8b
6:EF87  db 90
loc_EF88:
6:EF88  33c0                 xor ax, ax
6:EF8A  99                   cdq
loc_EF8B:
6:EF8B  8946fc               mov word ptr [bp - 4], ax
6:EF8E  8956fe               mov word ptr [bp - 2], dx
6:EF91  c45efc               les bx, ptr [bp - 4]
6:EF94  66268b4704           mov eax, dword ptr es:[bx + 4]
6:EF99  268b5706             mov dx, word ptr es:[bx + 6]
6:EF9D  668946f6             mov dword ptr [bp - 0xa], eax
6:EFA1  2af6                 sub dh, dh
6:EFA3  52                   push dx
6:EFA4  50                   push ax
6:EFA5  06                   push es
6:EFA6  53                   push bx
6:EFA7  c45e06               les bx, ptr [bp + 6]
6:EFAA  6626ff7722           push dword ptr es:[bx + 0x22]
6:EFAF  9a581373ee           lcall 0xee73, 0x1358  ; sub_s7:1358
6:EFB4  8b46f6               mov ax, word ptr [bp - 0xa]
6:EFB7  8b56f8               mov dx, word ptr [bp - 8]
6:EFBA  c9                   leave
6:EFBB  ca0e00               retf 0xe
