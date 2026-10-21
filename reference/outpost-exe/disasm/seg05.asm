; OUTPOST.EXE segment 5 (CODE), 61370 bytes

; ---------------- sub_s5:0000 size=422 callers=0
;   apis: USER.BeginPaint, USER.EndPaint
5:0000  c8c20000             enter 0xc2, 0
5:0004  57                   push di
5:0005  56                   push si
5:0006  c45e06               les bx, ptr [bp + 6]
5:0009  26ff7704             push word ptr es:[bx + 4]
5:000D  8d46e0               lea ax, [bp - 0x20]
5:0010  16                   push ss
5:0011  50                   push ax
5:0012  9affff0000           lcall 0, 0xffff  ; USER.BeginPaint
5:0017  c45e06               les bx, ptr [bp + 6]
5:001A  26c45f14             les bx, ptr es:[bx + 0x14]
5:001E  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:0023  668946dc             mov dword ptr [bp - 0x24], eax
5:0027  8d46da               lea ax, [bp - 0x26]
5:002A  16                   push ss
5:002B  50                   push ax
5:002C  8d46d8               lea ax, [bp - 0x28]
5:002F  16                   push ss
5:0030  50                   push ax
5:0031  8b4606               mov ax, word ptr [bp + 6]
5:0034  8b5608               mov dx, word ptr [bp + 8]
5:0037  051800               add ax, 0x18
5:003A  52                   push dx
5:003B  50                   push ax
5:003C  8bf0                 mov si, ax
5:003E  8bfa                 mov di, dx
5:0040  9a943e5600           lcall 0x56, 0x3e94  ; sub_s2:3E94
5:0045  c45e06               les bx, ptr [bp + 6]
5:0048  6626ff7724           push dword ptr es:[bx + 0x24]
5:004D  57                   push di
5:004E  56                   push si
5:004F  66ff76dc             push dword ptr [bp - 0x24]
5:0053  9a8044c300           lcall 0xc3, 0x4480  ; sub_s2:4480
5:0058  662bc0               sub eax, eax
5:005B  668946d4             mov dword ptr [bp - 0x2c], eax
5:005F  8946d2               mov word ptr [bp - 0x2e], ax
5:0062  e9e400               jmp 0x149
5:0065  db 90
loc_0066:
5:0066  ff46ca               inc word ptr [bp - 0x36]
loc_0069:
5:0069  8b8650ff             mov ax, word ptr [bp - 0xb0]
5:006D  3946ca               cmp word ptr [bp - 0x36], ax
5:0070  0f8fd200             jg 0x146
5:0074  8b76ca               mov si, word ptr [bp - 0x36]
5:0077  8bc6                 mov ax, si
5:0079  03f6                 add si, si
5:007B  03f0                 add si, ax
5:007D  03f6                 add si, si
5:007F  8d8252ff             lea ax, [bp + si - 0xae]
5:0083  89864aff             mov word ptr [bp - 0xb6], ax
5:0087  8c964cff             mov word ptr [bp - 0xb4], ss
5:008B  8bd8                 mov bx, ax
5:008D  837f0400             cmp word ptr [bx + 4], 0
5:0091  74d3                 je 0x66
5:0093  ff7704               push word ptr [bx + 4]
5:0096  c47606               les si, ptr [bp + 6]
5:0099  6626ff7414           push dword ptr es:[si + 0x14]
5:009E  8bf0                 mov si, ax
5:00A0  9a982b0b01           lcall 0x10b, 0x2b98  ; sub_s3:2B98
5:00A5  8946d4               mov word ptr [bp - 0x2c], ax
5:00A8  8956d6               mov word ptr [bp - 0x2a], dx
5:00AB  8b04                 mov ax, word ptr [si]
5:00AD  0346da               add ax, word ptr [bp - 0x26]
5:00B0  50                   push ax
5:00B1  8b4402               mov ax, word ptr [si + 2]
5:00B4  0346d8               add ax, word ptr [bp - 0x28]
5:00B7  50                   push ax
5:00B8  6a00                 push 0
5:00BA  8d8644ff             lea ax, [bp - 0xbc]
5:00BE  16                   push ss
5:00BF  50                   push ax
5:00C0  9a543ed600           lcall 0xd6, 0x3e54  ; sub_s2:3E54
5:00C5  66ff76d4             push dword ptr [bp - 0x2c]
5:00C9  8d8644ff             lea ax, [bp - 0xbc]
5:00CD  16                   push ss
5:00CE  50                   push ax
5:00CF  66ff76dc             push dword ptr [bp - 0x24]
5:00D3  9a80443101           lcall 0x131, 0x4480  ; sub_s2:4480
5:00D8  eb8c                 jmp 0x66
loc_00DA:
5:00DA  8bb650ff             mov si, word ptr [bp - 0xb0]
5:00DE  8bc6                 mov ax, si
5:00E0  03f6                 add si, si
5:00E2  03f0                 add si, ax
5:00E4  03f6                 add si, si
5:00E6  8d9a52ff             lea bx, [bp + si - 0xae]
5:00EA  899e44ff             mov word ptr [bp - 0xbc], bx
5:00EE  8c9646ff             mov word ptr [bp - 0xba], ss
5:00F2  837f0400             cmp word ptr [bx + 4], 0
5:00F6  744e                 je 0x146
5:00F8  8e8646ff             mov es, word ptr [bp - 0xba]
5:00FC  26ff7704             push word ptr es:[bx + 4]
5:0100  c45e06               les bx, ptr [bp + 6]
5:0103  6626ff7714           push dword ptr es:[bx + 0x14]
5:0108  9a982b6301           lcall 0x163, 0x2b98  ; sub_s3:2B98
5:010D  8946d4               mov word ptr [bp - 0x2c], ax
5:0110  8956d6               mov word ptr [bp - 0x2a], dx
5:0113  c49e44ff             les bx, ptr [bp - 0xbc]
5:0117  268b07               mov ax, word ptr es:[bx]
5:011A  0346da               add ax, word ptr [bp - 0x26]
5:011D  50                   push ax
5:011E  268b4702             mov ax, word ptr es:[bx + 2]
5:0122  0346d8               add ax, word ptr [bp - 0x28]
5:0125  50                   push ax
5:0126  6a00                 push 0
5:0128  8d863eff             lea ax, [bp - 0xc2]
5:012C  16                   push ss
5:012D  50                   push ax
5:012E  9a543e4401           lcall 0x144, 0x3e54  ; sub_s2:3E54
5:0133  66ff76d4             push dword ptr [bp - 0x2c]
5:0137  8d863eff             lea ax, [bp - 0xc2]
5:013B  16                   push ss
5:013C  50                   push ax
5:013D  66ff76dc             push dword ptr [bp - 0x24]
5:0141  9a8044ffff           lcall 0xffff, 0x4480  ; sub_s2:4480
loc_0146:
5:0146  ff46d2               inc word ptr [bp - 0x2e]
loc_0149:
5:0149  837ed206             cmp word ptr [bp - 0x2e], 6
5:014D  7d27                 jge 0x176
5:014F  8d864eff             lea ax, [bp - 0xb2]
5:0153  16                   push ss
5:0154  50                   push ax
5:0155  ff76d2               push word ptr [bp - 0x2e]
5:0158  c45e06               les bx, ptr [bp + 6]
5:015B  6626ff7714           push dword ptr es:[bx + 0x14]
5:0160  9a782bffff           lcall 0xffff, 0x2b78  ; sub_s3:2B78
5:0165  83be4eff00           cmp word ptr [bp - 0xb2], 0
5:016A  0f856cff             jne 0xda
5:016E  c746ca0000           mov word ptr [bp - 0x36], 0
5:0173  e9f3fe               jmp 0x69
loc_0176:
5:0176  668b4606             mov eax, dword ptr [bp + 6]
5:017A  050a00               add ax, 0xa
5:017D  6650                 push eax
5:017F  666a00               push 0
5:0182  c45edc               les bx, ptr [bp - 0x24]
5:0185  06                   push es
5:0186  53                   push bx
5:0187  26c41f               les bx, ptr es:[bx]
5:018A  26ff5f04             lcall es:[bx + 4]
5:018E  c45e06               les bx, ptr [bp + 6]
5:0191  26ff7704             push word ptr es:[bx + 4]
5:0195  8d46e0               lea ax, [bp - 0x20]
5:0198  16                   push ss
5:0199  50                   push ax
5:019A  9affff0000           lcall 0, 0xffff  ; USER.EndPaint
5:019F  5e                   pop si
5:01A0  5f                   pop di
5:01A1  c9                   leave
5:01A2  ca0400               retf 4
5:01A5  db 00

; ---------------- sub_s5:01A6 FAR size=50 callers=0
5:01A6  55                   push bp
5:01A7  8bec                 mov bp, sp
5:01A9  66ff7606             push dword ptr [bp + 6]
5:01AD  9a98edffff           lcall 0xffff, 0xed98  ; sub_s4:ED98
5:01B2  f6460a01             test byte ptr [bp + 0xa], 1
5:01B6  7409                 je 0x1c1
5:01B8  66ff7606             push dword ptr [bp + 6]
5:01BC  9ace17ffff           lcall 0xffff, 0x17ce  ; operator_delete@s1:17CE
loc_01C1:
5:01C1  8b4606               mov ax, word ptr [bp + 6]
5:01C4  8b5608               mov dx, word ptr [bp + 8]
5:01C7  c9                   leave
5:01C8  ca0600               retf 6
5:01CB  db 90 a6 01 d6 01 d8 ed b0 01 00 00 ff ff

; ---------------- sub_s5:01D8 FAR size=84 callers=1
5:01D8  55                   push bp
5:01D9  8bec                 mov bp, sp
5:01DB  66ff7614             push dword ptr [bp + 0x14]
5:01DF  ff7612               push word ptr [bp + 0x12]
5:01E2  66ff7608             push dword ptr [bp + 8]
5:01E6  ff7606               push word ptr [bp + 6]
5:01E9  9ab2614300           lcall 0x43, 0x61b2  ; sub_s2:61B2
5:01EE  c45e06               les bx, ptr [bp + 6]
5:01F1  662bc0               sub eax, eax
5:01F4  66268987e200         mov dword ptr es:[bx + 0xe2], eax
5:01FA  66268987e600         mov dword ptr es:[bx + 0xe6], eax
5:0200  8b4610               mov ax, word ptr [bp + 0x10]
5:0203  268987ea00           mov word ptr es:[bx + 0xea], ax
5:0208  8b460e               mov ax, word ptr [bp + 0xe]
5:020B  268987ec00           mov word ptr es:[bx + 0xec], ax
5:0210  8b460c               mov ax, word ptr [bp + 0xc]
5:0213  268987ee00           mov word ptr es:[bx + 0xee], ax
5:0218  26c7075a04           mov word ptr es:[bx], 0x45a
5:021D  26c74702ce01         mov word ptr es:[bx + 2], 0x1ce  ; SEGMENT s5:0000
5:0223  8bc3                 mov ax, bx
5:0225  8cc2                 mov dx, es
5:0227  c9                   leave
5:0228  ca1200               retf 0x12
5:022B  db 00

; ---------------- sub_s5:022C FAR size=96 callers=3
5:022C  c81c0000             enter 0x1c, 0
5:0230  56                   push si
5:0231  c45e06               les bx, ptr [bp + 6]
5:0234  26c7075a04           mov word ptr es:[bx], 0x45a
5:0239  26c747022102         mov word ptr es:[bx + 2], 0x221  ; SEGMENT s5:0000
5:023F  268b87e600           mov ax, word ptr es:[bx + 0xe6]
5:0244  268b97e800           mov dx, word ptr es:[bx + 0xe8]
5:0249  8bda                 mov bx, dx
5:024B  0bd0                 or dx, ax
5:024D  740e                 je 0x25d
5:024F  6a01                 push 1
5:0251  53                   push bx
5:0252  50                   push ax
5:0253  8ec3                 mov es, bx
5:0255  8bf0                 mov si, ax
5:0257  26c41c               les bx, ptr es:[si]
5:025A  26ff1f               lcall es:[bx]
loc_025D:
5:025D  668b4606             mov eax, dword ptr [bp + 6]
5:0261  05d200               add ax, 0xd2
5:0264  6650                 push eax
5:0266  9ac4577702           lcall 0x277, 0x57c4  ; ListIter::~ListIter@s2:57C4
5:026B  c45e06               les bx, ptr [bp + 6]
5:026E  26c7070a38           mov word ptr es:[bx], 0x380a
5:0273  26c747028502         mov word ptr es:[bx + 2], 0x285  ; SEGMENT s2:0000
5:0279  c45e06               les bx, ptr [bp + 6]
5:027C  26c7079a38           mov word ptr es:[bx], 0x389a
5:0281  26c74702ec01         mov word ptr es:[bx + 2], 0x1ec  ; SEGMENT s2:0000
5:0287  5e                   pop si
5:0288  c9                   leave
5:0289  ca0400               retf 4

; ---------------- sub_s5:028C FAR size=34 callers=0
5:028C  55                   push bp
5:028D  8bec                 mov bp, sp
5:028F  c45e06               les bx, ptr [bp + 6]
5:0292  6626ffb7e200         push dword ptr es:[bx + 0xe2]
5:0298  9a9e3ca300           lcall 0xa3, 0x3c9e  ; sub_s3:3C9E
5:029D  66ff7608             push dword ptr [bp + 8]
5:02A1  ff7606               push word ptr [bp + 6]
5:02A4  9ac6686902           lcall 0x269, 0x68c6  ; sub_s2:68C6
5:02A9  c9                   leave
5:02AA  ca0600               retf 6
5:02AD  db 00

; ---------------- sub_s5:02AE FAR size=104 callers=0
5:02AE  c8080000             enter 8, 0
5:02B2  56                   push si
5:02B3  c45e06               les bx, ptr [bp + 6]
5:02B6  6626ffb7e200         push dword ptr es:[bx + 0xe2]
5:02BC  9ad03c0103           lcall 0x301, 0x3cd0  ; sub_s3:3CD0
5:02C1  66ff7606             push dword ptr [bp + 6]
5:02C5  9a8e62a702           lcall 0x2a7, 0x628e  ; sub_s2:628E
5:02CA  c45e06               les bx, ptr [bp + 6]
5:02CD  268b87e600           mov ax, word ptr es:[bx + 0xe6]
5:02D2  268b97e800           mov dx, word ptr es:[bx + 0xe8]
5:02D7  8bda                 mov bx, dx
5:02D9  0bd0                 or dx, ax
5:02DB  740e                 je 0x2eb
5:02DD  6a01                 push 1
5:02DF  53                   push bx
5:02E0  50                   push ax
5:02E1  8ec3                 mov es, bx
5:02E3  8bf0                 mov si, ax
5:02E5  26c41c               les bx, ptr es:[si]
5:02E8  26ff1f               lcall es:[bx]
loc_02EB:
5:02EB  c45e06               les bx, ptr [bp + 6]
5:02EE  6626c787e60000000000 mov dword ptr es:[bx + 0xe6], 0
5:02F8  6626ffb7e200         push dword ptr es:[bx + 0xe2]
5:02FE  9ada1d9b02           lcall 0x29b, 0x1dda  ; sub_s3:1DDA
5:0303  c45e06               les bx, ptr [bp + 6]
5:0306  6626c787e20000000000 mov dword ptr es:[bx + 0xe2], 0
5:0310  5e                   pop si
5:0311  c9                   leave
5:0312  ca0400               retf 4
5:0315  db 00

; ---------------- sub_s5:0316 FAR size=156 callers=0
5:0316  c80c0000             enter 0xc, 0
5:031A  66ff7606             push dword ptr [bp + 6]
5:031E  9a6097c802           lcall 0x2c8, 0x9760  ; sub_s2:9760
5:0323  6a01                 push 1
5:0325  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:032A  9aba206c03           lcall 0x36c, 0x20ba  ; sub_s3:20BA
5:032F  c45e06               les bx, ptr [bp + 6]
5:0332  268987e200           mov word ptr es:[bx + 0xe2], ax
5:0337  268997e400           mov word ptr es:[bx + 0xe4], dx
5:033C  268b87ea00           mov ax, word ptr es:[bx + 0xea]
5:0341  26c49fe200           les bx, ptr es:[bx + 0xe2]
5:0346  26894716             mov word ptr es:[bx + 0x16], ax
5:034A  c45e06               les bx, ptr [bp + 6]
5:034D  268b87ee00           mov ax, word ptr es:[bx + 0xee]
5:0352  26c49fe200           les bx, ptr es:[bx + 0xe2]
5:0357  26894712             mov word ptr es:[bx + 0x12], ax
5:035B  c45e06               les bx, ptr [bp + 6]
5:035E  26ffb7ec00           push word ptr es:[bx + 0xec]
5:0363  6626ffb7e200         push dword ptr es:[bx + 0xe2]
5:0369  9a523cbf02           lcall 0x2bf, 0x3c52  ; sub_s3:3C52
5:036E  6a12                 push 0x12  ; 'version %d %d'
5:0370  9a9c17bf01           lcall 0x1bf, 0x179c  ; operator_new@s1:179C
5:0375  83c402               add sp, 2
5:0378  8956f6               mov word ptr [bp - 0xa], dx
5:037B  0bd0                 or dx, ax
5:037D  7421                 je 0x3a0
5:037F  c45e06               les bx, ptr [bp + 6]
5:0382  26ff7708             push word ptr es:[bx + 8]
5:0386  ff76f6               push word ptr [bp - 0xa]
5:0389  50                   push ax
5:038A  90                   nop
5:038B  0e                   push cs
5:038C  e86701               call 0x4f6  ; sub_s5:04F6
5:038F  c45e06               les bx, ptr [bp + 6]
5:0392  268987e600           mov word ptr es:[bx + 0xe6], ax
5:0397  268997e800           mov word ptr es:[bx + 0xe8], dx
5:039C  c9                   leave
5:039D  ca0400               retf 4
loc_03A0:
5:03A0  c45e06               les bx, ptr [bp + 6]
5:03A3  6626c787e60000000000 mov dword ptr es:[bx + 0xe6], 0
5:03AD  c9                   leave
5:03AE  ca0400               retf 4
5:03B1  db 00

; ---------------- sub_s5:03B2 FAR size=36 callers=0
;   apis: USER.PostMessage
5:03B2  c8060000             enter 6, 0
5:03B6  ff369603             push word ptr [0x396]
5:03BA  681101               push 0x111
5:03BD  c45e06               les bx, ptr [bp + 6]
5:03C0  26c49fe200           les bx, ptr es:[bx + 0xe2]
5:03C5  26ff7716             push word ptr es:[bx + 0x16]
5:03C9  666a00               push 0
5:03CC  9affff0000           lcall 0, 0xffff  ; USER.PostMessage
5:03D1  c9                   leave
5:03D2  ca0a00               retf 0xa
5:03D5  db 00

; ---------------- sub_s5:03D6 FAR size=36 callers=0
;   apis: USER.PostMessage
5:03D6  c8060000             enter 6, 0
5:03DA  ff369603             push word ptr [0x396]
5:03DE  681101               push 0x111
5:03E1  c45e06               les bx, ptr [bp + 6]
5:03E4  26c49fe200           les bx, ptr es:[bx + 0xe2]
5:03E9  26ff7716             push word ptr es:[bx + 0x16]
5:03ED  666a00               push 0
5:03F0  9acd030000           lcall 0, 0x3cd  ; USER.PostMessage
5:03F5  c9                   leave
5:03F6  ca0a00               retf 0xa
5:03F9  db 00

; ---------------- sub_s5:03FA FAR size=36 callers=0
;   apis: USER.PostMessage
5:03FA  c8060000             enter 6, 0
5:03FE  ff369603             push word ptr [0x396]
5:0402  681101               push 0x111
5:0405  c45e06               les bx, ptr [bp + 6]
5:0408  26c49fe200           les bx, ptr es:[bx + 0xe2]
5:040D  26ff7716             push word ptr es:[bx + 0x16]
5:0411  666a00               push 0
5:0414  9af1030000           lcall 0, 0x3f1  ; USER.PostMessage
5:0419  c9                   leave
5:041A  ca0600               retf 6
5:041D  db 00

; ---------------- sub_s5:041E FAR size=22 callers=1
5:041E  55                   push bp
5:041F  8bec                 mov bp, sp
5:0421  c45e06               les bx, ptr [bp + 6]
5:0424  6626ffb7e600         push dword ptr es:[bx + 0xe6]
5:042A  90                   nop
5:042B  0e                   push cs
5:042C  e82f02               call 0x65e  ; sub_s5:065E
5:042F  c9                   leave
5:0430  ca0400               retf 4
5:0433  db 00

; ---------------- sub_s5:0434 FAR size=194 callers=0
5:0434  55                   push bp
5:0435  8bec                 mov bp, sp
5:0437  66ff7606             push dword ptr [bp + 6]
5:043B  90                   nop
5:043C  0e                   push cs
5:043D  e8ecfd               call 0x22c  ; sub_s5:022C
5:0440  f6460a01             test byte ptr [bp + 0xa], 1
5:0444  7409                 je 0x44f
5:0446  66ff7606             push dword ptr [bp + 6]
5:044A  9ace177303           lcall 0x373, 0x17ce  ; operator_delete@s1:17CE
loc_044F:
5:044F  8b4606               mov ax, word ptr [bp + 6]
5:0452  8b5608               mov dx, word ptr [bp + 8]
5:0455  c9                   leave
5:0456  ca0600               retf 6
5:0459  db 90 34 04 64 04 ea 68 6c 04 16 03 68 04 8c 02 90
5:0469  db 04 40 96 70 04 64 96 74 04 2c 37 78 04 f2 97 7c
5:0479  db 04 3c 37 80 04 40 37 84 04 44 37 88 04 48 37 8c
5:0489  db 04 4c 37 94 04 1e 04 b8 04 98 96 98 04 50 37 9c
5:0499  db 04 54 37 a0 04 60 9c a4 04 58 37 a8 04 24 63 ac
5:04A9  db 04 4e 9c b0 04 62 37 b4 04 4a 9c c0 04 b2 03 bc
5:04B9  db 04 d6 03 c4 04 4a 6a c8 04 fa 03 ec 04 02 6b cc
5:04C9  db 04 7a 37 d0 04 52 9c d4 04 56 9c d8 04 16 9c dc
5:04D9  db 04 30 9c e0 04 86 9c e4 04 c4 9c e8 04 e0 9c f0
5:04E9  db 04 ae 02 3d 02 28 63 f4 04 2c 63 21 03

; ---------------- sub_s5:04F6 FAR size=224 callers=1
5:04F6  c81c0000             enter 0x1c, 0
5:04FA  c45e06               les bx, ptr [bp + 6]
5:04FD  26c7079a38           mov word ptr es:[bx], 0x389a
5:0502  26c747021405         mov word ptr es:[bx + 2], 0x514  ; SEGMENT s2:0000
5:0508  c45e06               les bx, ptr [bp + 6]
5:050B  26c707a83a           mov word ptr es:[bx], 0x3aa8
5:0510  26c747022905         mov word ptr es:[bx + 2], 0x529  ; SEGMENT s2:0000
5:0516  8b460a               mov ax, word ptr [bp + 0xa]
5:0519  c45e06               les bx, ptr [bp + 6]
5:051C  26894704             mov word ptr es:[bx + 4], ax
5:0520  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:0525  26c74702ca05         mov word ptr es:[bx + 2], 0x5ca  ; SEGMENT s2:0000
5:052B  c45e06               les bx, ptr [bp + 6]
5:052E  662bc0               sub eax, eax
5:0531  6626894706           mov dword ptr es:[bx + 6], eax
5:0536  2689470a             mov word ptr es:[bx + 0xa], ax
5:053A  2689470c             mov word ptr es:[bx + 0xc], ax
5:053E  2689470e             mov word ptr es:[bx + 0xe], ax
5:0542  26894710             mov word ptr es:[bx + 0x10], ax
5:0546  26c7075a07           mov word ptr es:[bx], 0x75a
5:054B  26c747025c04         mov word ptr es:[bx + 2], 0x45c  ; SEGMENT s5:0000
5:0551  6a01                 push 1
5:0553  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:0558  9aba208605           lcall 0x586, 0x20ba  ; sub_s3:20BA
5:055D  c45e06               les bx, ptr [bp + 6]
5:0560  26894706             mov word ptr es:[bx + 6], ax
5:0564  26895708             mov word ptr es:[bx + 8], dx
5:0568  06                   push es
5:0569  53                   push bx
5:056A  6a00                 push 0
5:056C  52                   push dx
5:056D  26ff7706             push word ptr es:[bx + 6]
5:0571  26c45f06             les bx, ptr es:[bx + 6]
5:0575  26c41f               les bx, ptr es:[bx]
5:0578  26ff5f04             lcall es:[bx + 4]
5:057C  6a48                 push 0x48
5:057E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:0583  9aba202d03           lcall 0x32d, 0x20ba  ; sub_s3:20BA
5:0588  8ec2                 mov es, dx
5:058A  8bd8                 mov bx, ax
5:058C  8946fc               mov word ptr [bp - 4], ax
5:058F  8c46fe               mov word ptr [bp - 2], es
5:0592  268b470a             mov ax, word ptr es:[bx + 0xa]
5:0596  c45e06               les bx, ptr [bp + 6]
5:0599  2689470a             mov word ptr es:[bx + 0xa], ax
5:059D  c45efc               les bx, ptr [bp - 4]
5:05A0  268b470c             mov ax, word ptr es:[bx + 0xc]
5:05A4  c45e06               les bx, ptr [bp + 6]
5:05A7  2689470c             mov word ptr es:[bx + 0xc], ax
5:05AB  8b4606               mov ax, word ptr [bp + 6]
5:05AE  8b5608               mov dx, word ptr [bp + 8]
5:05B1  050e00               add ax, 0xe
5:05B4  52                   push dx
5:05B5  50                   push ax
5:05B6  8b4606               mov ax, word ptr [bp + 6]
5:05B9  051000               add ax, 0x10
5:05BC  52                   push dx
5:05BD  50                   push ax
5:05BE  668b46fc             mov eax, dword ptr [bp - 4]
5:05C2  050e00               add ax, 0xe
5:05C5  6650                 push eax
5:05C7  9a943e6004           lcall 0x460, 0x3e94  ; sub_s2:3E94
5:05CC  8b4606               mov ax, word ptr [bp + 6]
5:05CF  8b5608               mov dx, word ptr [bp + 8]
5:05D2  c9                   leave
5:05D3  ca0600               retf 6

; ---------------- sub_s5:05D6 FAR size=70 callers=1
5:05D6  c80c0000             enter 0xc, 0
5:05DA  c45e06               les bx, ptr [bp + 6]
5:05DD  26c7075a07           mov word ptr es:[bx], 0x75a
5:05E2  26c747024f05         mov word ptr es:[bx + 2], 0x54f  ; SEGMENT s5:0000
5:05E8  6626837f0600         cmp dword ptr es:[bx + 6], 0
5:05EE  740c                 je 0x5fc
5:05F0  06                   push es
5:05F1  53                   push bx
5:05F2  6626ff7706           push dword ptr es:[bx + 6]
5:05F7  9aa61e5b05           lcall 0x55b, 0x1ea6  ; sub_s3:1EA6
loc_05FC:
5:05FC  c45e06               les bx, ptr [bp + 6]
5:05FF  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:0604  26c747021606         mov word ptr es:[bx + 2], 0x616  ; SEGMENT s2:0000
5:060A  c45e06               les bx, ptr [bp + 6]
5:060D  26c7079a38           mov word ptr es:[bx], 0x389a
5:0612  26c747020605         mov word ptr es:[bx + 2], 0x506  ; SEGMENT s2:0000
5:0618  c9                   leave
5:0619  ca0400               retf 4

; ---------------- sub_s5:061C size=66 callers=0
;   apis: USER.PostMessage
5:061C  c8060000             enter 6, 0
5:0620  8b460a               mov ax, word ptr [bp + 0xa]
5:0623  eb2f                 jmp 0x654
5:0625  db 90
loc_0626:
5:0626  c45e06               les bx, ptr [bp + 6]
5:0629  662bc0               sub eax, eax
5:062C  6626894706           mov dword ptr es:[bx + 6], eax
5:0631  c9                   leave
5:0632  ca0600               retf 6
5:0635  db 90
loc_0636:
5:0636  ff369603             push word ptr [0x396]
5:063A  681101               push 0x111
5:063D  c45e06               les bx, ptr [bp + 6]
5:0640  26c45f06             les bx, ptr es:[bx + 6]
5:0644  26ff7716             push word ptr es:[bx + 0x16]
5:0648  666a00               push 0
5:064B  9a15040000           lcall 0, 0x415  ; USER.PostMessage
5:0650  c9                   leave
5:0651  ca0600               retf 6
loc_0654:
5:0654  48                   dec ax
5:0655  74cf                 je 0x626
5:0657  48                   dec ax
5:0658  74dc                 je 0x636
5:065A  c9                   leave
5:065B  ca0600               retf 6

; ---------------- sub_s5:065E FAR size=214 callers=1
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.FillRect, USER.SelectPalette
5:065E  c8360000             enter 0x36, 0
5:0662  57                   push di
5:0663  56                   push si
5:0664  c45e06               les bx, ptr [bp + 6]
5:0667  26ff7704             push word ptr es:[bx + 4]
5:066B  8d46e0               lea ax, [bp - 0x20]
5:066E  16                   push ss
5:066F  50                   push ax
5:0670  9a13000000           lcall 0, 0x13  ; USER.BeginPaint
5:0675  8946de               mov word ptr [bp - 0x22], ax
5:0678  c45e06               les bx, ptr [bp + 6]
5:067B  26817f0a8002         cmp word ptr es:[bx + 0xa], 0x280
5:0681  7e41                 jle 0x6c4
5:0683  66680b071002         push 0x210070b
5:0689  9affff0000           lcall 0, 0xffff  ; GDI.CreateSolidBrush
5:068E  8946d6               mov word ptr [bp - 0x2a], ax
5:0691  33c0                 xor ax, ax
5:0693  8946ce               mov word ptr [bp - 0x32], ax
5:0696  8946d0               mov word ptr [bp - 0x30], ax
5:0699  c45e06               les bx, ptr [bp + 6]
5:069C  268b470a             mov ax, word ptr es:[bx + 0xa]
5:06A0  48                   dec ax
5:06A1  8946d2               mov word ptr [bp - 0x2e], ax
5:06A4  268b470c             mov ax, word ptr es:[bx + 0xc]
5:06A8  48                   dec ax
5:06A9  8946d4               mov word ptr [bp - 0x2c], ax
5:06AC  ff76de               push word ptr [bp - 0x22]
5:06AF  8d46ce               lea ax, [bp - 0x32]
5:06B2  16                   push ss
5:06B3  50                   push ax
5:06B4  ff76d6               push word ptr [bp - 0x2a]
5:06B7  9affff0000           lcall 0, 0xffff  ; USER.FillRect
5:06BC  ff76d6               push word ptr [bp - 0x2a]
5:06BF  9a18070000           lcall 0, 0x718  ; GDI.DeleteObject
loc_06C4:
5:06C4  c45e06               les bx, ptr [bp + 6]
5:06C7  26c45f06             les bx, ptr es:[bx + 6]
5:06CB  66268b470e           mov eax, dword ptr es:[bx + 0xe]
5:06D0  668946da             mov dword ptr [bp - 0x26], eax
5:06D4  8d46de               lea ax, [bp - 0x22]
5:06D7  16                   push ss
5:06D8  50                   push ax
5:06D9  c45eda               les bx, ptr [bp - 0x26]
5:06DC  06                   push es
5:06DD  53                   push bx
5:06DE  26c41f               les bx, ptr es:[bx]
5:06E1  8bf3                 mov si, bx
5:06E3  8cc7                 mov di, es
5:06E5  26ff5f08             lcall es:[bx + 8]
5:06E9  8946d8               mov word ptr [bp - 0x28], ax
5:06EC  8d46de               lea ax, [bp - 0x22]
5:06EF  16                   push ss
5:06F0  50                   push ax
5:06F1  c45e06               les bx, ptr [bp + 6]
5:06F4  26ff770e             push word ptr es:[bx + 0xe]
5:06F8  26ff7710             push word ptr es:[bx + 0x10]
5:06FC  66ff76da             push dword ptr [bp - 0x26]
5:0700  8ec7                 mov es, di
5:0702  26ff5c04             lcall es:[si + 4]
5:0706  ff76de               push word ptr [bp - 0x22]
5:0709  ff76d8               push word ptr [bp - 0x28]
5:070C  6a00                 push 0
5:070E  9affff0000           lcall 0, 0xffff  ; USER.SelectPalette
5:0713  8946d8               mov word ptr [bp - 0x28], ax
5:0716  50                   push ax
5:0717  9affff0000           lcall 0, 0xffff  ; GDI.DeleteObject
5:071C  c45e06               les bx, ptr [bp + 6]
5:071F  26ff7704             push word ptr es:[bx + 4]
5:0723  8d46e0               lea ax, [bp - 0x20]
5:0726  16                   push ss
5:0727  50                   push ax
5:0728  9a9b010000           lcall 0, 0x19b  ; USER.EndPaint
5:072D  5e                   pop si
5:072E  5f                   pop di
5:072F  c9                   leave
5:0730  ca0400               retf 4
5:0733  db 00

; ---------------- sub_s5:0734 FAR size=46 callers=0
5:0734  55                   push bp
5:0735  8bec                 mov bp, sp
5:0737  66ff7606             push dword ptr [bp + 6]
5:073B  90                   nop
5:073C  0e                   push cs
5:073D  e896fe               call 0x5d6  ; sub_s5:05D6
5:0740  f6460a01             test byte ptr [bp + 0xa], 1
5:0744  7409                 je 0x74f
5:0746  66ff7606             push dword ptr [bp + 6]
5:074A  9ace174d04           lcall 0x44d, 0x17ce  ; operator_delete@s1:17CE
loc_074F:
5:074F  8b4606               mov ax, word ptr [bp + 6]
5:0752  8b5608               mov dx, word ptr [bp + 8]
5:0755  c9                   leave
5:0756  ca0600               retf 6
5:0759  db 90 34 07 60 07 1c 06 e6 05

; ---------------- sub_s5:0762 FAR size=72 callers=1
5:0762  55                   push bp
5:0763  8bec                 mov bp, sp
5:0765  66ff7618             push dword ptr [bp + 0x18]
5:0769  66ff7614             push dword ptr [bp + 0x14]
5:076D  ff7612               push word ptr [bp + 0x12]
5:0770  66ff760a             push dword ptr [bp + 0xa]
5:0774  66ff7606             push dword ptr [bp + 6]
5:0778  90                   nop
5:0779  0e                   push cs
5:077A  e85bfa               call 0x1d8  ; sub_s5:01D8
5:077D  c45e06               les bx, ptr [bp + 6]
5:0780  26c787f0000000       mov word ptr es:[bx + 0xf0], 0
5:0787  c45e0e               les bx, ptr [bp + 0xe]
5:078A  66268b07             mov eax, dword ptr es:[bx]
5:078E  c45e06               les bx, ptr [bp + 6]
5:0791  66268987f200         mov dword ptr es:[bx + 0xf2], eax
5:0797  26c7071a08           mov word ptr es:[bx], 0x81a
5:079C  26c747025c07         mov word ptr es:[bx + 2], 0x75c  ; SEGMENT s5:0000
5:07A2  8bc3                 mov ax, bx
5:07A4  8cc2                 mov dx, es
5:07A6  c9                   leave
5:07A7  ca1600               retf 0x16

; ---------------- sub_s5:07AA size=74 callers=0
5:07AA  c8140000             enter 0x14, 0
5:07AE  66ff7606             push dword ptr [bp + 6]
5:07B2  90                   nop
5:07B3  0e                   push cs
5:07B4  e867fc               call 0x41e  ; sub_s5:041E
5:07B7  c45e06               les bx, ptr [bp + 6]
5:07BA  2683bff00000         cmp word ptr es:[bx + 0xf0], 0
5:07C0  752e                 jne 0x7f0
5:07C2  26c787f0000100       mov word ptr es:[bx + 0xf0], 1
5:07C9  8d46ec               lea ax, [bp - 0x14]
5:07CC  16                   push ss
5:07CD  50                   push ax
5:07CE  9adc5be407           lcall 0x7e4, 0x5bdc  ; sub_s2:5BDC
5:07D3  668b4606             mov eax, dword ptr [bp + 6]
5:07D7  05f200               add ax, 0xf2
5:07DA  6650                 push eax
5:07DC  8d46ec               lea ax, [bp - 0x14]
5:07DF  16                   push ss
5:07E0  50                   push ax
5:07E1  9a9e5cee07           lcall 0x7ee, 0x5c9e  ; sub_s2:5C9E
5:07E6  8d46ec               lea ax, [bp - 0x14]
5:07E9  16                   push ss
5:07EA  50                   push ax
5:07EB  9a345c0806           lcall 0x608, 0x5c34  ; sub_s2:5C34
loc_07F0:
5:07F0  c9                   leave
5:07F1  ca0400               retf 4

; ---------------- sub_s5:07F4 size=194 callers=0
5:07F4  c8040000             enter 4, 0
5:07F8  66ff7606             push dword ptr [bp + 6]
5:07FC  90                   nop
5:07FD  0e                   push cs
5:07FE  e82bfa               call 0x22c  ; sub_s5:022C
5:0801  f6460a01             test byte ptr [bp + 0xa], 1
5:0805  7409                 je 0x810
5:0807  66ff7606             push dword ptr [bp + 6]
5:080B  9ace174d07           lcall 0x74d, 0x17ce  ; operator_delete@s1:17CE
loc_0810:
5:0810  8b4606               mov ax, word ptr [bp + 6]
5:0813  8b5608               mov dx, word ptr [bp + 8]
5:0816  c9                   leave
5:0817  ca0600               retf 6
5:081A  db f4 07 24 08 ea 68 2c 08 16 03 28 08 8c 02 50 08
5:082A  db 40 96 30 08 64 96 34 08 2c 37 38 08 f2 97 3c 08
5:083A  db 3c 37 40 08 40 37 44 08 44 37 48 08 48 37 4c 08
5:084A  db 4c 37 54 08 aa 07 78 08 98 96 58 08 50 37 5c 08
5:085A  db 54 37 60 08 60 9c 64 08 58 37 68 08 24 63 6c 08
5:086A  db 4e 9c 70 08 62 37 74 08 4a 9c 80 08 b2 03 7c 08
5:087A  db d6 03 84 08 4a 6a 88 08 fa 03 ac 08 02 6b 8c 08
5:088A  db 7a 37 90 08 52 9c 94 08 56 9c 98 08 16 9c 9c 08
5:089A  db 30 9c a0 08 86 9c a4 08 c4 9c a8 08 e0 9c b0 08
5:08AA  db ae 02 a0 07 28 63 b4 08 2c 63 d1 07

; ---------------- sub_s5:08B6 FAR size=72 callers=2
5:08B6  55                   push bp
5:08B7  8bec                 mov bp, sp
5:08B9  66ff760c             push dword ptr [bp + 0xc]
5:08BD  ff760a               push word ptr [bp + 0xa]
5:08C0  6a01                 push 1
5:08C2  66ff7606             push dword ptr [bp + 6]
5:08C6  9ab261f208           lcall 0x8f2, 0x61b2  ; sub_s2:61B2
5:08CB  c45e06               les bx, ptr [bp + 6]
5:08CE  662bc0               sub eax, eax
5:08D1  268987e600           mov word ptr es:[bx + 0xe6], ax
5:08D6  66268987e800         mov dword ptr es:[bx + 0xe8], eax
5:08DC  26c7070e0b           mov word ptr es:[bx], 0xb0e
5:08E1  26c747021c08         mov word ptr es:[bx + 2], 0x81c  ; SEGMENT s5:0000
5:08E7  68d401               push 0x1d4
5:08EA  66ff36a002           push dword ptr [0x2a0]
5:08EF  9a5c5c2008           lcall 0x820, 0x5c5c  ; sub_s2:5C5C
5:08F4  8b4606               mov ax, word ptr [bp + 6]
5:08F7  8b5608               mov dx, word ptr [bp + 8]
5:08FA  c9                   leave
5:08FB  ca0a00               retf 0xa

; ---------------- sub_s5:08FE FAR size=128 callers=1
;   apis: USER.IsWindow, USER.SendMessage
5:08FE  c8180000             enter 0x18, 0
5:0902  c45e06               les bx, ptr [bp + 6]
5:0905  26c7070e0b           mov word ptr es:[bx], 0xb0e
5:090A  26c74702e508         mov word ptr es:[bx + 2], 0x8e5  ; SEGMENT s5:0000
5:0910  662683bfe80000       cmp dword ptr es:[bx + 0xe8], 0
5:0917  7437                 je 0x950
5:0919  c45e06               les bx, ptr [bp + 6]
5:091C  26c49fe800           les bx, ptr es:[bx + 0xe8]
5:0921  268b4706             mov ax, word ptr es:[bx + 6]
5:0925  8946fe               mov word ptr [bp - 2], ax
5:0928  50                   push ax
5:0929  9affff0000           lcall 0, 0xffff  ; USER.IsWindow
5:092E  0bc0                 or ax, ax
5:0930  7411                 je 0x943
5:0932  ff76fe               push word ptr [bp - 2]
5:0935  666801001101         push 0x1110001
5:093B  666a00               push 0
5:093E  9affff0000           lcall 0, 0xffff  ; USER.SendMessage
loc_0943:
5:0943  c45e06               les bx, ptr [bp + 6]
5:0946  6626c787e80000000000 mov dword ptr es:[bx + 0xe8], 0
loc_0950:
5:0950  668b4606             mov eax, dword ptr [bp + 6]
5:0954  05d200               add ax, 0xd2
5:0957  6650                 push eax
5:0959  9ac4576a09           lcall 0x96a, 0x57c4  ; ListIter::~ListIter@s2:57C4
5:095E  c45e06               les bx, ptr [bp + 6]
5:0961  26c7070a38           mov word ptr es:[bx], 0x380a
5:0966  26c747027809         mov word ptr es:[bx + 2], 0x978  ; SEGMENT s2:0000
5:096C  c45e06               les bx, ptr [bp + 6]
5:096F  26c7079a38           mov word ptr es:[bx], 0x389a
5:0974  26c74702c908         mov word ptr es:[bx + 2], 0x8c9  ; SEGMENT s2:0000
5:097A  c9                   leave
5:097B  ca0400               retf 4

; ---------------- sub_s5:097E FAR size=60 callers=1
;   apis: USER.SendMessage
5:097E  c8080000             enter 8, 0
5:0982  c45e06               les bx, ptr [bp + 6]
5:0985  268b87ea00           mov ax, word ptr es:[bx + 0xea]
5:098A  260b87e800           or ax, word ptr es:[bx + 0xe8]
5:098F  7424                 je 0x9b5
5:0991  26c49fe800           les bx, ptr es:[bx + 0xe8]
5:0996  268b4706             mov ax, word ptr es:[bx + 6]
5:099A  50                   push ax
5:099B  666801001101         push 0x1110001
5:09A1  666a00               push 0
5:09A4  9a3f090000           lcall 0, 0x93f  ; USER.SendMessage
5:09A9  c45e06               les bx, ptr [bp + 6]
5:09AC  662bc0               sub eax, eax
5:09AF  66268987e800         mov dword ptr es:[bx + 0xe8], eax
loc_09B5:
5:09B5  c9                   leave
5:09B6  ca0400               retf 4
5:09B9  db 00

; ---------------- sub_s5:09BA FAR size=82 callers=0
5:09BA  c8040000             enter 4, 0
5:09BE  66ff7606             push dword ptr [bp + 6]
5:09C2  9a60975c09           lcall 0x95c, 0x9760  ; sub_s2:9760
5:09C7  6a0e                 push 0xe
5:09C9  9a9c170e08           lcall 0x80e, 0x179c  ; operator_new@s1:179C
5:09CE  83c402               add sp, 2
5:09D1  8956fe               mov word ptr [bp - 2], dx
5:09D4  0bd0                 or dx, ax
5:09D6  7422                 je 0x9fa
5:09D8  c45e06               les bx, ptr [bp + 6]
5:09DB  26ff7708             push word ptr es:[bx + 8]
5:09DF  ff76fe               push word ptr [bp - 2]
5:09E2  50                   push ax
5:09E3  90                   nop
5:09E4  0e                   push cs
5:09E5  e8c201               call 0xbaa  ; sub_s5:0BAA
5:09E8  c45e06               les bx, ptr [bp + 6]
5:09EB  268987e200           mov word ptr es:[bx + 0xe2], ax
5:09F0  268997e400           mov word ptr es:[bx + 0xe4], dx
5:09F5  c9                   leave
5:09F6  ca0400               retf 4
5:09F9  db 90
loc_09FA:
5:09FA  c45e06               les bx, ptr [bp + 6]
5:09FD  6626c787e20000000000 mov dword ptr es:[bx + 0xe2], 0
5:0A07  c9                   leave
5:0A08  ca0400               retf 4
5:0A0B  db 00

; ---------------- sub_s5:0A0C FAR size=70 callers=0
5:0A0C  c8080000             enter 8, 0
5:0A10  56                   push si
5:0A11  66ff7606             push dword ptr [bp + 6]
5:0A15  9a8e62c509           lcall 0x9c5, 0x628e  ; sub_s2:628E
5:0A1A  c45e06               les bx, ptr [bp + 6]
5:0A1D  268b87e200           mov ax, word ptr es:[bx + 0xe2]
5:0A22  268b97e400           mov dx, word ptr es:[bx + 0xe4]
5:0A27  8bda                 mov bx, dx
5:0A29  0bd0                 or dx, ax
5:0A2B  740e                 je 0xa3b
5:0A2D  6a01                 push 1
5:0A2F  53                   push bx
5:0A30  50                   push ax
5:0A31  8ec3                 mov es, bx
5:0A33  8bf0                 mov si, ax
5:0A35  26c41c               les bx, ptr es:[si]
5:0A38  26ff1f               lcall es:[bx]
loc_0A3B:
5:0A3B  c45e06               les bx, ptr [bp + 6]
5:0A3E  662bc0               sub eax, eax
5:0A41  66268987e200         mov dword ptr es:[bx + 0xe2], eax
5:0A47  268987e600           mov word ptr es:[bx + 0xe6], ax
5:0A4C  5e                   pop si
5:0A4D  c9                   leave
5:0A4E  ca0400               retf 4
5:0A51  db 00

; ---------------- sub_s5:0A52 FAR size=84 callers=0
5:0A52  c8080000             enter 8, 0
5:0A56  c45e06               les bx, ptr [bp + 6]
5:0A59  6626ffb7e200         push dword ptr es:[bx + 0xe2]
5:0A5F  90                   nop
5:0A60  0e                   push cs
5:0A61  e8da01               call 0xc3e  ; sub_s5:0C3E
5:0A64  c45e06               les bx, ptr [bp + 6]
5:0A67  2683bfe60000         cmp word ptr es:[bx + 0xe6], 0
5:0A6D  7532                 jne 0xaa1
5:0A6F  26c787e6000100       mov word ptr es:[bx + 0xe6], 1
5:0A76  c41e7c5b             les bx, ptr [0x5b7c]
5:0A7A  26c787ae009900       mov word ptr es:[bx + 0xae], 0x99
5:0A81  6a06                 push 6
5:0A83  c45e06               les bx, ptr [bp + 6]
5:0A86  26ff7708             push word ptr es:[bx + 8]
5:0A8A  66ff367c5b           push dword ptr [0x5b7c]
5:0A8F  9a40afffff           lcall 0xffff, 0xaf40  ; sub_s8:AF40
5:0A94  c45e06               les bx, ptr [bp + 6]
5:0A97  268987e800           mov word ptr es:[bx + 0xe8], ax
5:0A9C  268997ea00           mov word ptr es:[bx + 0xea], dx
loc_0AA1:
5:0AA1  c9                   leave
5:0AA2  ca0400               retf 4
5:0AA5  db 00

; ---------------- sub_s5:0AA6 FAR size=22 callers=0
5:0AA6  55                   push bp
5:0AA7  8bec                 mov bp, sp
5:0AA9  c45e06               les bx, ptr [bp + 6]
5:0AAC  6626ffb7e200         push dword ptr es:[bx + 0xe2]
5:0AB2  90                   nop
5:0AB3  0e                   push cs
5:0AB4  e81b02               call 0xcd2  ; sub_s5:0CD2
5:0AB7  c9                   leave
5:0AB8  ca0400               retf 4
5:0ABB  db 00

; ---------------- sub_s5:0ABC FAR size=44 callers=0
5:0ABC  c8080000             enter 8, 0
5:0AC0  c45e06               les bx, ptr [bp + 6]
5:0AC3  2683bfe60000         cmp word ptr es:[bx + 0xe6], 0
5:0AC9  7418                 je 0xae3
5:0ACB  ff760a               push word ptr [bp + 0xa]
5:0ACE  666a00               push 0
5:0AD1  6626ffb7e800         push dword ptr es:[bx + 0xe8]
5:0AD7  26c49fe800           les bx, ptr es:[bx + 0xe8]
5:0ADC  26c41f               les bx, ptr es:[bx]
5:0ADF  26ff5f10             lcall es:[bx + 0x10]
loc_0AE3:
5:0AE3  c9                   leave
5:0AE4  ca0600               retf 6
5:0AE7  db 00

; ---------------- sub_s5:0AE8 FAR size=194 callers=0
5:0AE8  55                   push bp
5:0AE9  8bec                 mov bp, sp
5:0AEB  66ff7606             push dword ptr [bp + 6]
5:0AEF  90                   nop
5:0AF0  0e                   push cs
5:0AF1  e80afe               call 0x8fe  ; sub_s5:08FE
5:0AF4  f6460a01             test byte ptr [bp + 0xa], 1
5:0AF8  7409                 je 0xb03
5:0AFA  66ff7606             push dword ptr [bp + 6]
5:0AFE  9ace17cc09           lcall 0x9cc, 0x17ce  ; operator_delete@s1:17CE
loc_0B03:
5:0B03  8b4606               mov ax, word ptr [bp + 6]
5:0B06  8b5608               mov dx, word ptr [bp + 8]
5:0B09  c9                   leave
5:0B0A  ca0600               retf 6
5:0B0D  db 90 e8 0a 18 0b ea 68 1c 0b ba 09 44 0b c6 68 20
5:0B1D  db 0b 40 96 24 0b 64 96 28 0b 2c 37 2c 0b f2 97 30
5:0B2D  db 0b 3c 37 34 0b 40 37 38 0b 44 37 3c 0b 48 37 40
5:0B3D  db 0b 4c 37 48 0b 52 0a 50 0b 98 96 4c 0b 50 37 54
5:0B4D  db 0b bc 0a 9c 0b 60 9c 58 0b 58 37 5c 0b 24 63 60
5:0B5D  db 0b 4e 9c 64 0b 62 37 68 0b 4a 9c 6c 0b 66 37 70
5:0B6D  db 0b 6a 37 74 0b 4a 6a 78 0b 2e 6b 7c 0b 02 6b 80
5:0B7D  db 0b 7a 37 84 0b 52 9c 88 0b 56 9c 8c 0b 16 9c 90
5:0B8D  db 0b 30 9c 94 0b 86 9c 98 0b c4 9c a4 0b a6 0a a0
5:0B9D  db 0b 0c 0a 0e 09 28 63 a8 0b 2c 63 18 0a

; ---------------- sub_s5:0BAA FAR size=148 callers=1
5:0BAA  c81c0000             enter 0x1c, 0
5:0BAE  c45e06               les bx, ptr [bp + 6]
5:0BB1  26c7079a38           mov word ptr es:[bx], 0x389a
5:0BB6  26c74702c80b         mov word ptr es:[bx + 2], 0xbc8  ; SEGMENT s2:0000
5:0BBC  c45e06               les bx, ptr [bp + 6]
5:0BBF  26c707a83a           mov word ptr es:[bx], 0x3aa8
5:0BC4  26c74702dd0b         mov word ptr es:[bx + 2], 0xbdd  ; SEGMENT s2:0000
5:0BCA  8b460a               mov ax, word ptr [bp + 0xa]
5:0BCD  c45e06               les bx, ptr [bp + 6]
5:0BD0  26894704             mov word ptr es:[bx + 4], ax
5:0BD4  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:0BD9  26c74702320c         mov word ptr es:[bx + 2], 0xc32  ; SEGMENT s2:0000
5:0BDF  c45e06               les bx, ptr [bp + 6]
5:0BE2  662bc0               sub eax, eax
5:0BE5  6626894706           mov dword ptr es:[bx + 6], eax
5:0BEA  2689470a             mov word ptr es:[bx + 0xa], ax
5:0BEE  2689470c             mov word ptr es:[bx + 0xc], ax
5:0BF2  26c707bc0d           mov word ptr es:[bx], 0xdbc
5:0BF7  26c74702100b         mov word ptr es:[bx + 2], 0xb10  ; SEGMENT s5:0000
5:0BFD  6a07                 push 7
5:0BFF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:0C04  9aba20280c           lcall 0xc28, 0x20ba  ; sub_s3:20BA
5:0C09  c45e06               les bx, ptr [bp + 6]
5:0C0C  26894706             mov word ptr es:[bx + 6], ax
5:0C10  26895708             mov word ptr es:[bx + 8], dx
5:0C14  8d470a               lea ax, [bx + 0xa]
5:0C17  06                   push es
5:0C18  50                   push ax
5:0C19  8d470c               lea ax, [bx + 0xc]
5:0C1C  06                   push es
5:0C1D  50                   push ax
5:0C1E  6a48                 push 0x48
5:0C20  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:0C25  9aba20fa05           lcall 0x5fa, 0x20ba  ; sub_s3:20BA
5:0C2A  050e00               add ax, 0xe
5:0C2D  52                   push dx
5:0C2E  50                   push ax
5:0C2F  9a943e140b           lcall 0xb14, 0x3e94  ; sub_s2:3E94
5:0C34  8b4606               mov ax, word ptr [bp + 6]
5:0C37  8b5608               mov dx, word ptr [bp + 8]
5:0C3A  c9                   leave
5:0C3B  ca0600               retf 6

; ---------------- sub_s5:0C3E FAR size=148 callers=1
;   apis: GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.SelectPalette
5:0C3E  c82e0000             enter 0x2e, 0
5:0C42  57                   push di
5:0C43  56                   push si
5:0C44  c45e06               les bx, ptr [bp + 6]
5:0C47  26ff7704             push word ptr es:[bx + 4]
5:0C4B  8d46e0               lea ax, [bp - 0x20]
5:0C4E  16                   push ss
5:0C4F  50                   push ax
5:0C50  9a71060000           lcall 0, 0x671  ; USER.BeginPaint
5:0C55  8946de               mov word ptr [bp - 0x22], ax
5:0C58  c45e06               les bx, ptr [bp + 6]
5:0C5B  26c45f06             les bx, ptr es:[bx + 6]
5:0C5F  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:0C64  268b570c             mov dx, word ptr es:[bx + 0xc]
5:0C68  668946da             mov dword ptr [bp - 0x26], eax
5:0C6C  8bc2                 mov ax, dx
5:0C6E  0b46da               or ax, word ptr [bp - 0x26]
5:0C71  7448                 je 0xcbb
5:0C73  8d46de               lea ax, [bp - 0x22]
5:0C76  16                   push ss
5:0C77  50                   push ax
5:0C78  c45eda               les bx, ptr [bp - 0x26]
5:0C7B  06                   push es
5:0C7C  53                   push bx
5:0C7D  26c41f               les bx, ptr es:[bx]
5:0C80  8bf3                 mov si, bx
5:0C82  8cc7                 mov di, es
5:0C84  26ff5f08             lcall es:[bx + 8]
5:0C88  8946d2               mov word ptr [bp - 0x2e], ax
5:0C8B  8d46de               lea ax, [bp - 0x22]
5:0C8E  16                   push ss
5:0C8F  50                   push ax
5:0C90  c45e06               les bx, ptr [bp + 6]
5:0C93  26ff770a             push word ptr es:[bx + 0xa]
5:0C97  26ff770c             push word ptr es:[bx + 0xc]
5:0C9B  66ff76da             push dword ptr [bp - 0x26]
5:0C9F  8ec7                 mov es, di
5:0CA1  26ff5c04             lcall es:[si + 4]
5:0CA5  ff76de               push word ptr [bp - 0x22]
5:0CA8  ff76d2               push word ptr [bp - 0x2e]
5:0CAB  6a00                 push 0
5:0CAD  9a0f070000           lcall 0, 0x70f  ; USER.SelectPalette
5:0CB2  8946d2               mov word ptr [bp - 0x2e], ax
5:0CB5  50                   push ax
5:0CB6  9ac0060000           lcall 0, 0x6c0  ; GDI.DeleteObject
loc_0CBB:
5:0CBB  c45e06               les bx, ptr [bp + 6]
5:0CBE  26ff7704             push word ptr es:[bx + 4]
5:0CC2  8d46e0               lea ax, [bp - 0x20]
5:0CC5  16                   push ss
5:0CC6  50                   push ax
5:0CC7  9a29070000           lcall 0, 0x729  ; USER.EndPaint
5:0CCC  5e                   pop si
5:0CCD  5f                   pop di
5:0CCE  c9                   leave
5:0CCF  ca0400               retf 4

; ---------------- sub_s5:0CD2 FAR size=176 callers=1
;   apis: GDI.DeleteObject, USER.GetDC, USER.InvalidateRect, USER.RealizePalette, USER.ReleaseDC, USER.SelectPalette
5:0CD2  c8180000             enter 0x18, 0
5:0CD6  c45e06               les bx, ptr [bp + 6]
5:0CD9  26c45f06             les bx, ptr es:[bx + 6]
5:0CDD  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:0CE2  268b570c             mov dx, word ptr es:[bx + 0xc]
5:0CE6  668946fc             mov dword ptr [bp - 4], eax
5:0CEA  8bc2                 mov ax, dx
5:0CEC  0b46fc               or ax, word ptr [bp - 4]
5:0CEF  7507                 jne 0xcf8
loc_0CF1:
5:0CF1  33c0                 xor ax, ax
5:0CF3  c9                   leave
5:0CF4  ca0400               retf 4
5:0CF7  db 90
loc_0CF8:
5:0CF8  52                   push dx
5:0CF9  c45efc               les bx, ptr [bp - 4]
5:0CFC  53                   push bx
5:0CFD  26c41f               les bx, ptr es:[bx]
5:0D00  26ff5f14             lcall es:[bx + 0x14]
5:0D04  8946f8               mov word ptr [bp - 8], ax
5:0D07  8956fa               mov word ptr [bp - 6], dx
5:0D0A  0bd0                 or dx, ax
5:0D0C  74e3                 je 0xcf1
5:0D0E  c45e06               les bx, ptr [bp + 6]
5:0D11  26ff7704             push word ptr es:[bx + 4]
5:0D15  9affff0000           lcall 0, 0xffff  ; USER.GetDC
5:0D1A  8946f6               mov word ptr [bp - 0xa], ax
5:0D1D  50                   push ax
5:0D1E  66ff76f8             push dword ptr [bp - 8]
5:0D22  9a384eba0b           lcall 0xbba, 0x4e38  ; CreateGamePalette_s2_4E38@s2:4E38
5:0D27  8946f4               mov word ptr [bp - 0xc], ax
5:0D2A  50                   push ax
5:0D2B  6a00                 push 0
5:0D2D  9a490d0000           lcall 0, 0xd49  ; USER.SelectPalette
5:0D32  8946f2               mov word ptr [bp - 0xe], ax
5:0D35  ff76f6               push word ptr [bp - 0xa]
5:0D38  9affff0000           lcall 0, 0xffff  ; USER.RealizePalette
5:0D3D  8946f0               mov word ptr [bp - 0x10], ax
5:0D40  ff76f6               push word ptr [bp - 0xa]
5:0D43  ff76f2               push word ptr [bp - 0xe]
5:0D46  6a01                 push 1
5:0D48  9aae0c0000           lcall 0, 0xcae  ; USER.SelectPalette
5:0D4D  ff76f4               push word ptr [bp - 0xc]
5:0D50  9ab70c0000           lcall 0, 0xcb7  ; GDI.DeleteObject
5:0D55  837ef000             cmp word ptr [bp - 0x10], 0
5:0D59  7e11                 jle 0xd6c
5:0D5B  c45e06               les bx, ptr [bp + 6]
5:0D5E  26ff7704             push word ptr es:[bx + 4]
5:0D62  666a00               push 0
5:0D65  6a01                 push 1
5:0D67  9affff0000           lcall 0, 0xffff  ; USER.InvalidateRect
loc_0D6C:
5:0D6C  c45e06               les bx, ptr [bp + 6]
5:0D6F  26ff7704             push word ptr es:[bx + 4]
5:0D73  ff76f6               push word ptr [bp - 0xa]
5:0D76  9affff0000           lcall 0, 0xffff  ; USER.ReleaseDC
5:0D7B  8b46f0               mov ax, word ptr [bp - 0x10]
5:0D7E  c9                   leave
5:0D7F  ca0400               retf 4

; ---------------- sub_s5:0D82 size=66 callers=0
5:0D82  c8100000             enter 0x10, 0
5:0D86  c45e06               les bx, ptr [bp + 6]
5:0D89  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:0D8E  26c74702a00d         mov word ptr es:[bx + 2], 0xda0  ; SEGMENT s2:0000
5:0D94  c45e06               les bx, ptr [bp + 6]
5:0D97  26c7079a38           mov word ptr es:[bx], 0x389a
5:0D9C  26c74702250d         mov word ptr es:[bx + 2], 0xd25  ; SEGMENT s2:0000
5:0DA2  f6460a01             test byte ptr [bp + 0xa], 1
5:0DA6  7409                 je 0xdb1
5:0DA8  66ff7606             push dword ptr [bp + 6]
5:0DAC  9ace17010b           lcall 0xb01, 0x17ce  ; operator_delete@s1:17CE
loc_0DB1:
5:0DB1  8b4606               mov ax, word ptr [bp + 6]
5:0DB4  8b5608               mov dx, word ptr [bp + 8]
5:0DB7  c9                   leave
5:0DB8  ca0600               retf 6
5:0DBB  db 90 82 0d fb 0b 10 3a 92 0d

; ---------------- sub_s5:0DC4 FAR size=104 callers=1
5:0DC4  55                   push bp
5:0DC5  8bec                 mov bp, sp
5:0DC7  66ff760c             push dword ptr [bp + 0xc]
5:0DCB  ff760a               push word ptr [bp + 0xa]
5:0DCE  1e                   push ds
5:0DCF  685642               push 0x4256  ; 'PCPOPMENU'
5:0DD2  66ff7606             push dword ptr [bp + 6]
5:0DD6  90                   nop
5:0DD7  0e                   push cs
5:0DD8  e8336b               call 0x790e  ; sub_s5:790E
5:0DDB  c45e06               les bx, ptr [bp + 6]
5:0DDE  662bc0               sub eax, eax
5:0DE1  66268987f200         mov dword ptr es:[bx + 0xf2], eax
5:0DE7  66268987f600         mov dword ptr es:[bx + 0xf6], eax
5:0DED  268987fa00           mov word ptr es:[bx + 0xfa], ax
5:0DF2  26c7078413           mov word ptr es:[bx], 0x1384
5:0DF7  26c74702be0d         mov word ptr es:[bx + 2], 0xdbe  ; SEGMENT s5:0000
5:0DFD  1e                   push ds
5:0DFE  686042               push 0x4260  ; 'VrMode'
5:0E01  8d475b               lea ax, [bx + 0x5b]
5:0E04  06                   push es
5:0E05  50                   push ax
5:0E06  9a3e3daf0d           lcall 0xdaf, 0x3d3e  ; _fstrcpy@s1:3D3E
5:0E0B  83c408               add sp, 8
5:0E0E  c45e06               les bx, ptr [bp + 6]
5:0E11  6626c787ac000000c044 mov dword ptr es:[bx + 0xac], 0x44c00000
5:0E1B  06                   push es
5:0E1C  53                   push bx
5:0E1D  90                   nop
5:0E1E  0e                   push cs
5:0E1F  e87e02               call 0x10a0  ; sub_s5:10A0
5:0E22  8b4606               mov ax, word ptr [bp + 6]
5:0E25  8b5608               mov dx, word ptr [bp + 8]
5:0E28  c9                   leave
5:0E29  ca0a00               retf 0xa

; ---------------- sub_s5:0E2C FAR size=26 callers=0
5:0E2C  55                   push bp
5:0E2D  8bec                 mov bp, sp
5:0E2F  66ff7606             push dword ptr [bp + 6]
5:0E33  90                   nop
5:0E34  0e                   push cs
5:0E35  e8186c               call 0x7a50  ; sub_s5:7A50
5:0E38  66ff7606             push dword ptr [bp + 6]
5:0E3C  90                   nop
5:0E3D  0e                   push cs
5:0E3E  e8f701               call 0x1038  ; sub_s5:1038
5:0E41  c9                   leave
5:0E42  ca0400               retf 4
5:0E45  db 00

; ---------------- sub_s5:0E46 FAR size=72 callers=0
;   apis: GDI.UnrealizeObject, USER.RealizePalette
5:0E46  c8140000             enter 0x14, 0
5:0E4A  837e0a00             cmp word ptr [bp + 0xa], 0
5:0E4E  7439                 je 0xe89
5:0E50  c45e06               les bx, ptr [bp + 6]
5:0E53  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:0E58  66268b4766           mov eax, dword ptr es:[bx + 0x66]
5:0E5D  268b5768             mov dx, word ptr es:[bx + 0x68]
5:0E61  668946fc             mov dword ptr [bp - 4], eax
5:0E65  52                   push dx
5:0E66  c45efc               les bx, ptr [bp - 4]
5:0E69  50                   push ax
5:0E6A  26c41f               les bx, ptr es:[bx]
5:0E6D  26ff5f18             lcall es:[bx + 0x18]
5:0E71  50                   push ax
5:0E72  9affff0000           lcall 0, 0xffff  ; GDI.UnrealizeObject
5:0E77  c45e06               les bx, ptr [bp + 6]
5:0E7A  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:0E7F  268b477c             mov ax, word ptr es:[bx + 0x7c]
5:0E83  50                   push ax
5:0E84  9a390d0000           lcall 0, 0xd39  ; USER.RealizePalette
loc_0E89:
5:0E89  c9                   leave
5:0E8A  ca0600               retf 6
5:0E8D  db 00

; ---------------- sub_s5:0E8E FAR size=54 callers=0
5:0E8E  55                   push bp
5:0E8F  8bec                 mov bp, sp
5:0E91  66ff760c             push dword ptr [bp + 0xc]
5:0E95  66ff7608             push dword ptr [bp + 8]
5:0E99  ff7606               push word ptr [bp + 6]
5:0E9C  90                   nop
5:0E9D  0e                   push cs
5:0E9E  e8f303               call 0x1294  ; sub_s5:1294
5:0EA1  0bc0                 or ax, ax
5:0EA3  751a                 jne 0xebf
5:0EA5  66ff760c             push dword ptr [bp + 0xc]
5:0EA9  ff760a               push word ptr [bp + 0xa]
5:0EAC  c45e06               les bx, ptr [bp + 6]
5:0EAF  6626ff7704           push dword ptr es:[bx + 4]
5:0EB4  26c45f04             les bx, ptr es:[bx + 4]
5:0EB8  26c41f               les bx, ptr es:[bx]
5:0EBB  26ff5f5c             lcall es:[bx + 0x5c]
loc_0EBF:
5:0EBF  c9                   leave
5:0EC0  ca0a00               retf 0xa
5:0EC3  db 00

; ---------------- sub_s5:0EC4 FAR size=316 callers=0
;   apis: USER.PostMessage, USER.WinHelp
5:0EC4  c80a0000             enter 0xa, 0
5:0EC8  8b460a               mov ax, word ptr [bp + 0xa]
5:0ECB  3dfb00               cmp ax, 0xfb
5:0ECE  745c                 je 0xf2c
5:0ED0  0f870c01             ja 0xfe0
5:0ED4  3df300               cmp ax, 0xf3
5:0ED7  0f84f100             je 0xfcc
5:0EDB  0f871d01             ja 0xffc
5:0EDF  2c6f                 sub al, 0x6f
5:0EE1  0f848d00             je 0xf72
5:0EE5  2c03                 sub al, 3
5:0EE7  740f                 je 0xef8
5:0EE9  2c7f                 sub al, 0x7f
5:0EEB  0f84d500             je 0xfc4
5:0EEF  fec8                 dec al
5:0EF1  0f84d300             je 0xfc8
5:0EF5  e90401               jmp 0xffc
loc_0EF8:
5:0EF8  668b4606             mov eax, dword ptr [bp + 6]
5:0EFC  050a00               add ax, 0xa
5:0EFF  6650                 push eax
5:0F01  6a30                 push 0x30
5:0F03  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:0F08  9aba20120f           lcall 0xf12, 0x20ba  ; sub_s3:20BA
5:0F0D  52                   push dx
5:0F0E  50                   push ax
5:0F0F  9a7037360f           lcall 0xf36, 0x3770  ; sub_s3:3770
5:0F14  6a03                 push 3
5:0F16  c45e06               les bx, ptr [bp + 6]
5:0F19  26ff7708             push word ptr es:[bx + 8]
5:0F1D  66ff367c5b           push dword ptr [0x5b7c]
5:0F22  9a40af920a           lcall 0xa92, 0xaf40  ; sub_s8:AF40
5:0F27  c9                   leave
5:0F28  ca0600               retf 6
5:0F2B  db 90
loc_0F2C:
5:0F2C  6a30                 push 0x30
5:0F2E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:0F33  9aba20430f           lcall 0xf43, 0x20ba  ; sub_s3:20BA
5:0F38  8946f6               mov word ptr [bp - 0xa], ax
5:0F3B  8956f8               mov word ptr [bp - 8], dx
5:0F3E  52                   push dx
5:0F3F  50                   push ax
5:0F40  9a5e375c0f           lcall 0xf5c, 0x375e  ; sub_s3:375E
5:0F45  52                   push dx
5:0F46  50                   push ax
5:0F47  6a01                 push 1
5:0F49  c45e06               les bx, ptr [bp + 6]
5:0F4C  06                   push es
5:0F4D  53                   push bx
5:0F4E  26c41f               les bx, ptr es:[bx]
5:0F51  26ff5f14             lcall es:[bx + 0x14]
5:0F55  66ff76f6             push dword ptr [bp - 0xa]
5:0F59  9a5e376c0f           lcall 0xf6c, 0x375e  ; sub_s3:375E
5:0F5E  52                   push dx
5:0F5F  50                   push ax
5:0F60  c45e06               les bx, ptr [bp + 6]
5:0F63  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:0F69  9a88477d0f           lcall 0xf7d, 0x4788  ; sub_s3:4788
5:0F6E  c9                   leave
5:0F6F  ca0600               retf 6
loc_0F72:
5:0F72  68f801               push 0x1f8
5:0F75  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:0F7A  9a0a83da0f           lcall 0xfda, 0x830a  ; sub_s3:830A
5:0F7F  c45e06               les bx, ptr [bp + 6]
5:0F82  26ff7708             push word ptr es:[bx + 8]
5:0F86  52                   push dx
5:0F87  50                   push ax
5:0F88  666800000100         push 0x10000
5:0F8E  6a28                 push 0x28
5:0F90  9affff0000           lcall 0, 0xffff  ; USER.WinHelp
5:0F95  c9                   leave
5:0F96  ca0600               retf 6
5:0F99  db 90
loc_0F9A:
5:0F9A  c45e06               les bx, ptr [bp + 6]
5:0F9D  26ff7708             push word ptr es:[bx + 8]
5:0FA1  666812f01201         push 0x112f012
5:0FA7  eb0e                 jmp 0xfb7
5:0FA9  db 90
loc_0FAA:
5:0FAA  c45e06               les bx, ptr [bp + 6]
5:0FAD  26ff7708             push word ptr es:[bx + 8]
5:0FB1  666820f01201         push 0x112f020
loc_0FB7:
5:0FB7  666a00               push 0
5:0FBA  9a4c060000           lcall 0, 0x64c  ; USER.PostMessage
5:0FBF  c9                   leave
5:0FC0  ca0600               retf 6
5:0FC3  db 90
loc_0FC4:
5:0FC4  6a01                 push 1
5:0FC6  eb06                 jmp 0xfce
loc_0FC8:
5:0FC8  6a02                 push 2
5:0FCA  eb02                 jmp 0xfce
loc_0FCC:
5:0FCC  6a03                 push 3
loc_0FCE:
5:0FCE  c45e06               les bx, ptr [bp + 6]
5:0FD1  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:0FD7  9a7446070c           lcall 0xc07, 0x4674  ; sub_s3:4674
5:0FDC  c9                   leave
5:0FDD  ca0600               retf 6
loc_0FE0:
5:0FE0  2d2901               sub ax, 0x129
5:0FE3  3d0500               cmp ax, 5
5:0FE6  7714                 ja 0xffc
5:0FE8  03c0                 add ax, ax
5:0FEA  93                   xchg bx, ax
5:0FEB  2effa7f00f           jmp word ptr cs:[bx + 0xff0]
switch_table_0FF0:
    dw loc_0FFC
    dw loc_0F9A
    dw loc_0FFC
    dw loc_0FAA
    dw loc_0FFC
    dw loc_0FFC
loc_0FFC:
5:0FFC  c9                   leave
5:0FFD  ca0600               retf 6

; ---------------- sub_s5:1000 FAR size=34 callers=0
;   apis: USER.EnableMenuItem
5:1000  55                   push bp
5:1001  8bec                 mov bp, sp
5:1003  8b460c               mov ax, word ptr [bp + 0xc]
5:1006  eb12                 jmp 0x101a
loc_1008:
5:1008  ff760e               push word ptr [bp + 0xe]
5:100B  666800040300         push 0x30400
5:1011  9affff0000           lcall 0, 0xffff  ; USER.EnableMenuItem
5:1016  c9                   leave
5:1017  ca0a00               retf 0xa
loc_101A:
5:101A  0bc0                 or ax, ax
5:101C  74ea                 je 0x1008
5:101E  c9                   leave
5:101F  ca0a00               retf 0xa

; ---------------- sub_s5:1022 FAR size=22 callers=0
5:1022  55                   push bp
5:1023  8bec                 mov bp, sp
5:1025  c45e06               les bx, ptr [bp + 6]
5:1028  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:102E  90                   nop
5:102F  0e                   push cs
5:1030  e8ab05               call 0x15de  ; sub_s5:15DE
5:1033  c9                   leave
5:1034  ca0400               retf 4
5:1037  db 00

; ---------------- sub_s5:1038 FAR size=104 callers=1
;   apis: USER.DestroyIcon
5:1038  c8080000             enter 8, 0
5:103C  56                   push si
5:103D  c45e06               les bx, ptr [bp + 6]
5:1040  26ffb7c200           push word ptr es:[bx + 0xc2]
5:1045  9affff0000           lcall 0, 0xffff  ; USER.DestroyIcon
5:104A  33c0                 xor ax, ax
5:104C  c45e06               les bx, ptr [bp + 6]
5:104F  268987c200           mov word ptr es:[bx + 0xc2], ax
5:1054  26894708             mov word ptr es:[bx + 8], ax
5:1058  268b87f600           mov ax, word ptr es:[bx + 0xf6]
5:105D  268b97f800           mov dx, word ptr es:[bx + 0xf8]
5:1062  8bda                 mov bx, dx
5:1064  0bd0                 or dx, ax
5:1066  740e                 je 0x1076
5:1068  6a01                 push 1
5:106A  53                   push bx
5:106B  50                   push ax
5:106C  8ec3                 mov es, bx
5:106E  8bf0                 mov si, ax
5:1070  26c41c               les bx, ptr es:[si]
5:1073  26ff1f               lcall es:[bx]
loc_1076:
5:1076  c45e06               les bx, ptr [bp + 6]
5:1079  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
5:1083  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1089  9ada1d0b0f           lcall 0xf0b, 0x1dda  ; sub_s3:1DDA
5:108E  c45e06               les bx, ptr [bp + 6]
5:1091  6626c787f20000000000 mov dword ptr es:[bx + 0xf2], 0
5:109B  5e                   pop si
5:109C  c9                   leave
5:109D  ca0400               retf 4

; ---------------- sub_s5:10A0 FAR size=500 callers=1
;   apis: USER.LoadIcon, USER.MoveWindow, USER.UpdateWindow
5:10A0  c8300000             enter 0x30, 0
5:10A4  57                   push di
5:10A5  56                   push si
5:10A6  66ff7606             push dword ptr [bp + 6]
5:10AA  9a6097e210           lcall 0x10e2, 0x9760  ; sub_s2:9760
5:10AF  6a42                 push 0x42
5:10B1  9a9c17e910           lcall 0x10e9, 0x179c  ; operator_new@s1:179C
5:10B6  83c402               add sp, 2
5:10B9  8956fa               mov word ptr [bp - 6], dx
5:10BC  0bd0                 or dx, ax
5:10BE  7424                 je 0x10e4
5:10C0  c45e06               les bx, ptr [bp + 6]
5:10C3  26ff7708             push word ptr es:[bx + 8]
5:10C7  66687400f100         push 0xf10074
5:10CD  666800007500         push 0x750000
5:10D3  66689b001f00         push 0x1f009b
5:10D9  6a00                 push 0
5:10DB  ff76fa               push word ptr [bp - 6]
5:10DE  50                   push ax
5:10DF  9ad63b1711           lcall 0x1117, 0x3bd6  ; sub_s2:3BD6
loc_10E4:
5:10E4  6a42                 push 0x42
5:10E6  9a9c171e11           lcall 0x111e, 0x179c  ; operator_new@s1:179C
5:10EB  83c402               add sp, 2
5:10EE  8956fa               mov word ptr [bp - 6], dx
5:10F1  0bd0                 or dx, ax
5:10F3  7424                 je 0x1119
5:10F5  c45e06               les bx, ptr [bp + 6]
5:10F8  26ff7708             push word ptr es:[bx + 8]
5:10FC  66687600f200         push 0xf20076
5:1102  666800007700         push 0x770000
5:1108  66689b003100         push 0x31009b
5:110E  6a00                 push 0
5:1110  ff76fa               push word ptr [bp - 6]
5:1113  50                   push ax
5:1114  9ad63b4c11           lcall 0x114c, 0x3bd6  ; sub_s2:3BD6
loc_1119:
5:1119  6a42                 push 0x42
5:111B  9a9c17a311           lcall 0x11a3, 0x179c  ; operator_new@s1:179C
5:1120  83c402               add sp, 2
5:1123  8956fa               mov word ptr [bp - 6], dx
5:1126  0bd0                 or dx, ax
5:1128  7424                 je 0x114e
5:112A  c45e06               les bx, ptr [bp + 6]
5:112D  26ff7708             push word ptr es:[bx + 8]
5:1131  66687800f300         push 0xf30078
5:1137  666800007900         push 0x790000
5:113D  66689b007700         push 0x77009b
5:1143  6a00                 push 0
5:1145  ff76fa               push word ptr [bp - 6]
5:1148  50                   push ax
5:1149  9ad63bc20d           lcall 0xdc2, 0x3bd6  ; sub_s2:3BD6
loc_114E:
5:114E  6a2d                 push 0x2d
5:1150  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:1155  9aba20f211           lcall 0x11f2, 0x20ba  ; sub_s3:20BA
5:115A  c45e06               les bx, ptr [bp + 6]
5:115D  268987f200           mov word ptr es:[bx + 0xf2], ax
5:1162  268997f400           mov word ptr es:[bx + 0xf4], dx
5:1167  268b87f200           mov ax, word ptr es:[bx + 0xf2]
5:116C  268987e000           mov word ptr es:[bx + 0xe0], ax
5:1171  268997e200           mov word ptr es:[bx + 0xe2], dx
5:1176  ff368c03             push word ptr [0x38c]
5:117A  1e                   push ds
5:117B  686742               push 0x4267  ; 'PLNTICON'
5:117E  9affff0000           lcall 0, 0xffff  ; USER.LoadIcon
5:1183  c45e06               les bx, ptr [bp + 6]
5:1186  268987c200           mov word ptr es:[bx + 0xc2], ax
5:118B  50                   push ax
5:118C  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1192  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:1197  26c41f               les bx, ptr es:[bx]
5:119A  26ff5f30             lcall es:[bx + 0x30]
5:119E  6a24                 push 0x24
5:11A0  9a9c17090e           lcall 0xe09, 0x179c  ; operator_new@s1:179C
5:11A5  83c402               add sp, 2
5:11A8  8956fa               mov word ptr [bp - 6], dx
5:11AB  0bd0                 or dx, ax
5:11AD  741d                 je 0x11cc
5:11AF  66ff7606             push dword ptr [bp + 6]
5:11B3  ff76fa               push word ptr [bp - 6]
5:11B6  50                   push ax
5:11B7  90                   nop
5:11B8  0e                   push cs
5:11B9  e85c02               call 0x1418  ; sub_s5:1418
5:11BC  c45e06               les bx, ptr [bp + 6]
5:11BF  268987f600           mov word ptr es:[bx + 0xf6], ax
5:11C4  268997f800           mov word ptr es:[bx + 0xf8], dx
5:11C9  eb0e                 jmp 0x11d9
5:11CB  db 90
loc_11CC:
5:11CC  c45e06               les bx, ptr [bp + 6]
5:11CF  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
loc_11D9:
5:11D9  c45e06               les bx, ptr [bp + 6]
5:11DC  66268b87f600         mov eax, dword ptr es:[bx + 0xf6]
5:11E2  66268987e800         mov dword ptr es:[bx + 0xe8], eax
5:11E8  6a2f                 push 0x2f
5:11EA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:11EF  9aba200912           lcall 0x1209, 0x20ba  ; sub_s3:20BA
5:11F4  52                   push dx
5:11F5  50                   push ax
5:11F6  9ab804d201           lcall 0x1d2, 0x4b8  ; sub_s4:04B8
5:11FB  52                   push dx
5:11FC  50                   push ax
5:11FD  c45e06               les bx, ptr [bp + 6]
5:1200  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1206  9ad6411712           lcall 0x1217, 0x41d6  ; sub_s3:41D6
5:120B  c45e06               les bx, ptr [bp + 6]
5:120E  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1214  9a1a454512           lcall 0x1245, 0x451a  ; sub_s3:451A
5:1219  52                   push dx
5:121A  50                   push ax
5:121B  6a00                 push 0
5:121D  c45e06               les bx, ptr [bp + 6]
5:1220  06                   push es
5:1221  53                   push bx
5:1222  26c41f               les bx, ptr es:[bx]
5:1225  8bf3                 mov si, bx
5:1227  8cc7                 mov di, es
5:1229  26ff5f14             lcall es:[bx + 0x14]
5:122D  6a01                 push 1
5:122F  66ff7606             push dword ptr [bp + 6]
5:1233  8ec7                 mov es, di
5:1235  26ff5c10             lcall es:[si + 0x10]
5:1239  c45e06               les bx, ptr [bp + 6]
5:123C  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1242  9a9e458c10           lcall 0x108c, 0x459e  ; sub_s3:459E
5:1247  c45e06               les bx, ptr [bp + 6]
5:124A  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1250  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:1255  26c41f               les bx, ptr es:[bx]
5:1258  26ff5f10             lcall es:[bx + 0x10]
5:125C  8bd8                 mov bx, ax
5:125E  8ec2                 mov es, dx
5:1260  268b4f04             mov cx, word ptr es:[bx + 4]
5:1264  268b4706             mov ax, word ptr es:[bx + 6]
5:1268  268b5702             mov dx, word ptr es:[bx + 2]
5:126C  268b37               mov si, word ptr es:[bx]
5:126F  c45e06               les bx, ptr [bp + 6]
5:1272  26ff7708             push word ptr es:[bx + 8]
5:1276  56                   push si
5:1277  52                   push dx
5:1278  51                   push cx
5:1279  50                   push ax
5:127A  6a01                 push 1
5:127C  9affff0000           lcall 0, 0xffff  ; USER.MoveWindow
5:1281  c45e06               les bx, ptr [bp + 6]
5:1284  26ff7708             push word ptr es:[bx + 8]
5:1288  9affff0000           lcall 0, 0xffff  ; USER.UpdateWindow
5:128D  5e                   pop si
5:128E  5f                   pop di
5:128F  c9                   leave
5:1290  ca0400               retf 4
5:1293  db 00

; ---------------- sub_s5:1294 FAR size=202 callers=1
;   apis: USER.LoadCursor, USER.SetCursor
5:1294  c81c0000             enter 0x1c, 0
5:1298  666801000004         push 0x4000001
5:129E  66ff364857           push dword ptr [0x5748]  ; g_sim
5:12A3  9a4483ffff           lcall 0xffff, 0x8344  ; sub_s7:8344
5:12A8  0bd0                 or dx, ax
5:12AA  7408                 je 0x12b4
loc_12AC:
5:12AC  b80100               mov ax, 1
5:12AF  c9                   leave
5:12B0  ca0a00               retf 0xa
5:12B3  db 90
loc_12B4:
5:12B4  8b460c               mov ax, word ptr [bp + 0xc]
5:12B7  8946fc               mov word ptr [bp - 4], ax
5:12BA  8b460a               mov ax, word ptr [bp + 0xa]
5:12BD  8946fe               mov word ptr [bp - 2], ax
5:12C0  c45e06               les bx, ptr [bp + 6]
5:12C3  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:12C9  9acc401413           lcall 0x1314, 0x40cc  ; sub_s3:40CC
5:12CE  8946f8               mov word ptr [bp - 8], ax
5:12D1  8956fa               mov word ptr [bp - 6], dx
5:12D4  c45e06               les bx, ptr [bp + 6]
5:12D7  66268b87f200         mov eax, dword ptr es:[bx + 0xf2]
5:12DD  057600               add ax, 0x76
5:12E0  668946f4             mov dword ptr [bp - 0xc], eax
5:12E4  8d46f2               lea ax, [bp - 0xe]
5:12E7  16                   push ss
5:12E8  50                   push ax
5:12E9  8d4ef0               lea cx, [bp - 0x10]
5:12EC  16                   push ss
5:12ED  51                   push cx
5:12EE  66ff76f4             push dword ptr [bp - 0xc]
5:12F2  9a943e5113           lcall 0x1351, 0x3e94  ; sub_s2:3E94
5:12F7  8b46f2               mov ax, word ptr [bp - 0xe]
5:12FA  2946fc               sub word ptr [bp - 4], ax
5:12FD  8b46f0               mov ax, word ptr [bp - 0x10]
5:1300  2946fe               sub word ptr [bp - 2], ax
5:1303  8d46fc               lea ax, [bp - 4]
5:1306  16                   push ss
5:1307  50                   push ax
5:1308  c45e06               les bx, ptr [bp + 6]
5:130B  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:1311  9af8405811           lcall 0x1158, 0x40f8  ; sub_s3:40F8
5:1316  8946ee               mov word ptr [bp - 0x12], ax
5:1319  40                   inc ax
5:131A  7490                 je 0x12ac
5:131C  666a00               push 0
5:131F  68027f               push 0x7f02
5:1322  9affff0000           lcall 0, 0xffff  ; USER.LoadCursor
5:1327  8946e6               mov word ptr [bp - 0x1a], ax
5:132A  50                   push ax
5:132B  9a57130000           lcall 0, 0x1357  ; USER.SetCursor
5:1330  8946e4               mov word ptr [bp - 0x1c], ax
5:1333  6a02                 push 2
5:1335  8b46ee               mov ax, word ptr [bp - 0x12]
5:1338  50                   push ax
5:1339  99                   cdq
5:133A  52                   push dx
5:133B  50                   push ax
5:133C  c45ef8               les bx, ptr [bp - 8]
5:133F  06                   push es
5:1340  53                   push bx
5:1341  26c41f               les bx, ptr es:[bx]
5:1344  26ff5f04             lcall es:[bx + 4]
5:1348  52                   push dx
5:1349  50                   push ax
5:134A  66ff7606             push dword ptr [bp + 6]
5:134E  9a0e3ead10           lcall 0x10ad, 0x3e0e  ; sub_s2:3E0E
5:1353  ff76e4               push word ptr [bp - 0x1c]
5:1356  9affff0000           lcall 0, 0xffff  ; USER.SetCursor
5:135B  e94eff               jmp 0x12ac

; ---------------- sub_s5:135E FAR size=186 callers=0
5:135E  c8040000             enter 4, 0
5:1362  66ff7606             push dword ptr [bp + 6]
5:1366  90                   nop
5:1367  0e                   push cs
5:1368  e8f165               call 0x795c  ; sub_s5:795C
5:136B  f6460a01             test byte ptr [bp + 0xa], 1
5:136F  7409                 je 0x137a
5:1371  66ff7606             push dword ptr [bp + 6]
5:1375  9ace17b410           lcall 0x10b4, 0x17ce  ; operator_delete@s1:17CE
loc_137A:
5:137A  8b4606               mov ax, word ptr [bp + 6]
5:137D  8b5608               mov dx, word ptr [bp + 8]
5:1380  c9                   leave
5:1381  ca0600               retf 6
5:1384  db 5e 13 8e 13 ea 68 92 13 a0 10 9a 13 c6 68 96 13
5:1394  db 40 96 9e 13 b4 79 ba 13 2c 37 a2 13 f2 97 a6 13
5:13A4  db 3c 37 aa 13 40 37 ae 13 44 37 b2 13 48 37 b6 13
5:13B4  db 4c 37 be 13 22 10 c2 13 98 96 ca 13 2c 0e c6 13
5:13C4  db c4 0e ce 13 60 9c d6 13 ae 79 d2 13 00 10 e2 13
5:13D4  db 4e 9c da 13 62 37 de 13 4a 9c ea 13 8e 0e e6 13
5:13E4  db d2 7a 02 14 4a 6a ee 13 2e 6b f2 13 02 6b f6 13
5:13F4  db 7a 37 fa 13 52 9c fe 13 56 9c 0a 14 e4 79 06 14
5:1404  db fc 79 16 14 86 9c 0e 14 c4 9c 12 14 e0 9c f5 12
5:1414  db 46 0e fb 0d

; ---------------- sub_s5:1418 FAR size=246 callers=1
;   apis: USER.GetDC
5:1418  c8220000             enter 0x22, 0
5:141C  66ff760a             push dword ptr [bp + 0xa]
5:1420  66ff7606             push dword ptr [bp + 6]
5:1424  90                   nop
5:1425  0e                   push cs
5:1426  e8f167               call 0x7c1a  ; sub_s5:7C1A
5:1429  c45e06               les bx, ptr [bp + 6]
5:142C  662bc0               sub eax, eax
5:142F  6626894714           mov dword ptr es:[bx + 0x14], eax
5:1434  6626894718           mov dword ptr es:[bx + 0x18], eax
5:1439  8d471e               lea ax, [bx + 0x1e]
5:143C  06                   push es
5:143D  50                   push ax
5:143E  9a383eef14           lcall 0x14ef, 0x3e38  ; sub_s2:3E38
5:1443  c45e06               les bx, ptr [bp + 6]
5:1446  26c7073017           mov word ptr es:[bx], 0x1730
5:144B  26c747028613         mov word ptr es:[bx + 2], 0x1386  ; SEGMENT s5:0000
5:1451  6a2d                 push 0x2d
5:1453  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:1458  9aba207214           lcall 0x1472, 0x20ba  ; sub_s3:20BA
5:145D  c45e06               les bx, ptr [bp + 6]
5:1460  26894714             mov word ptr es:[bx + 0x14], ax
5:1464  26895716             mov word ptr es:[bx + 0x16], dx
5:1468  6a29                 push 0x29
5:146A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:146F  9aba20cc12           lcall 0x12cc, 0x20ba  ; sub_s3:20BA
5:1474  8946fc               mov word ptr [bp - 4], ax
5:1477  8956fe               mov word ptr [bp - 2], dx
5:147A  66ff7606             push dword ptr [bp + 6]
5:147E  6a00                 push 0
5:1480  c45e06               les bx, ptr [bp + 6]
5:1483  6626ff7714           push dword ptr es:[bx + 0x14]
5:1488  26c45f14             les bx, ptr es:[bx + 0x14]
5:148C  26c41f               les bx, ptr es:[bx]
5:148F  26ff5f04             lcall es:[bx + 4]
5:1493  c45e06               les bx, ptr [bp + 6]
5:1496  26ff7704             push word ptr es:[bx + 4]
5:149A  9a160d0000           lcall 0, 0xd16  ; USER.GetDC
5:149F  8946fa               mov word ptr [bp - 6], ax
5:14A2  c45e06               les bx, ptr [bp + 6]
5:14A5  26c45f14             les bx, ptr es:[bx + 0x14]
5:14A9  2689477c             mov word ptr es:[bx + 0x7c], ax
5:14AD  c45e06               les bx, ptr [bp + 6]
5:14B0  26c45f14             les bx, ptr es:[bx + 0x14]
5:14B4  66268b4766           mov eax, dword ptr es:[bx + 0x66]
5:14B9  c45e06               les bx, ptr [bp + 6]
5:14BC  6626894718           mov dword ptr es:[bx + 0x18], eax
5:14C1  c45e06               les bx, ptr [bp + 6]
5:14C4  6626ff7718           push dword ptr es:[bx + 0x18]
5:14C9  26c45f18             les bx, ptr es:[bx + 0x18]
5:14CD  26c41f               les bx, ptr es:[bx]
5:14D0  26ff5f14             lcall es:[bx + 0x14]
5:14D4  8946f6               mov word ptr [bp - 0xa], ax
5:14D7  8956f8               mov word ptr [bp - 8], dx
5:14DA  c45efc               les bx, ptr [bp - 4]
5:14DD  66268b470e           mov eax, dword ptr es:[bx + 0xe]
5:14E2  668946f2             mov dword ptr [bp - 0xe], eax
5:14E6  6650                 push eax
5:14E8  66ff76f6             push dword ptr [bp - 0xa]
5:14EC  9a844dfd14           lcall 0x14fd, 0x4d84  ; sub_s2:4D84
5:14F1  8d46fa               lea ax, [bp - 6]
5:14F4  16                   push ss
5:14F5  50                   push ax
5:14F6  66ff76f2             push dword ptr [bp - 0xe]
5:14FA  9a084e8a13           lcall 0x138a, 0x4e08  ; sub_s2:4E08
5:14FF  c45e06               les bx, ptr [bp + 6]
5:1502  2689471c             mov word ptr es:[bx + 0x1c], ax
5:1506  8bc3                 mov ax, bx
5:1508  8cc2                 mov dx, es
5:150A  c9                   leave
5:150B  ca0800               retf 8

; ---------------- sub_s5:150E FAR size=110 callers=1
;   apis: GDI.DeleteObject, USER.SelectPalette
5:150E  c8140000             enter 0x14, 0
5:1512  c45e06               les bx, ptr [bp + 6]
5:1515  26c7073017           mov word ptr es:[bx], 0x1730
5:151A  26c747024f14         mov word ptr es:[bx + 2], 0x144f  ; SEGMENT s5:0000
5:1520  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
5:1526  740c                 je 0x1534
5:1528  06                   push es
5:1529  53                   push bx
5:152A  6626ff7714           push dword ptr es:[bx + 0x14]
5:152F  9aa61e5b14           lcall 0x145b, 0x1ea6  ; sub_s3:1EA6
loc_1534:
5:1534  c45e06               les bx, ptr [bp + 6]
5:1537  26c45f14             les bx, ptr es:[bx + 0x14]
5:153B  268b477c             mov ax, word ptr es:[bx + 0x7c]
5:153F  50                   push ax
5:1540  c45e06               les bx, ptr [bp + 6]
5:1543  26ff771c             push word ptr es:[bx + 0x1c]
5:1547  6a00                 push 0
5:1549  9a2e0d0000           lcall 0, 0xd2e  ; USER.SelectPalette
5:154E  c45e06               les bx, ptr [bp + 6]
5:1551  2689471c             mov word ptr es:[bx + 0x1c], ax
5:1555  50                   push ax
5:1556  9a510d0000           lcall 0, 0xd51  ; GDI.DeleteObject
5:155B  c45e06               les bx, ptr [bp + 6]
5:155E  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:1563  26c747027515         mov word ptr es:[bx + 2], 0x1575  ; SEGMENT s2:0000
5:1569  c45e06               les bx, ptr [bp + 6]
5:156C  26c7079a38           mov word ptr es:[bx], 0x389a
5:1571  26c747024114         mov word ptr es:[bx + 2], 0x1441  ; SEGMENT s2:0000
5:1577  c9                   leave
5:1578  ca0400               retf 4
5:157B  db 00

; ---------------- sub_s5:157C FAR size=98 callers=0
;   apis: USER.GetClientRect, USER.InvalidateRect, USER.IsIconic
5:157C  c8080000             enter 8, 0
5:1580  8b460a               mov ax, word ptr [bp + 0xa]
5:1583  eb4f                 jmp 0x15d4
5:1585  db 90
loc_1586:
5:1586  c45e06               les bx, ptr [bp + 6]
5:1589  26ff7704             push word ptr es:[bx + 4]
5:158D  9affff0000           lcall 0, 0xffff  ; USER.IsIconic
5:1592  0bc0                 or ax, ax
5:1594  7544                 jne 0x15da
5:1596  c45e06               les bx, ptr [bp + 6]
5:1599  26ff7704             push word ptr es:[bx + 4]
5:159D  8d46f8               lea ax, [bp - 8]
5:15A0  16                   push ss
5:15A1  50                   push ax
5:15A2  9affff0000           lcall 0, 0xffff  ; USER.GetClientRect
5:15A7  c746fe9a00           mov word ptr [bp - 2], 0x9a
5:15AC  c45e06               les bx, ptr [bp + 6]
5:15AF  26ff7704             push word ptr es:[bx + 4]
5:15B3  8d46f8               lea ax, [bp - 8]
5:15B6  16                   push ss
5:15B7  50                   push ax
5:15B8  6a00                 push 0
5:15BA  9a680d0000           lcall 0, 0xd68  ; USER.InvalidateRect
5:15BF  c9                   leave
5:15C0  ca0600               retf 6
5:15C3  db 90
loc_15C4:
5:15C4  c45e06               les bx, ptr [bp + 6]
5:15C7  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:15D0  c9                   leave
5:15D1  ca0600               retf 6
loc_15D4:
5:15D4  48                   dec ax
5:15D5  74ed                 je 0x15c4
5:15D7  48                   dec ax
5:15D8  74ac                 je 0x1586
loc_15DA:
5:15DA  c9                   leave
5:15DB  ca0600               retf 6

; ---------------- sub_s5:15DE FAR size=150 callers=1
;   apis: USER.BeginPaint, USER.EndPaint, USER.IsIconic
5:15DE  c82e0000             enter 0x2e, 0
5:15E2  c45e06               les bx, ptr [bp + 6]
5:15E5  26ff7704             push word ptr es:[bx + 4]
5:15E9  8d46e0               lea ax, [bp - 0x20]
5:15EC  16                   push ss
5:15ED  50                   push ax
5:15EE  9a510c0000           lcall 0, 0xc51  ; USER.BeginPaint
5:15F3  8946de               mov word ptr [bp - 0x22], ax
5:15F6  c45e06               les bx, ptr [bp + 6]
5:15F9  26ff7704             push word ptr es:[bx + 4]
5:15FD  9a8e150000           lcall 0, 0x158e  ; USER.IsIconic
5:1602  0bc0                 or ax, ax
5:1604  740c                 je 0x1612
5:1606  66ff7606             push dword ptr [bp + 6]
5:160A  90                   nop
5:160B  0e                   push cs
5:160C  e86500               call 0x1674  ; sub_s5:1674
5:160F  eb4e                 jmp 0x165f
5:1611  db 90
loc_1612:
5:1612  c45e06               les bx, ptr [bp + 6]
5:1615  6626ff7714           push dword ptr es:[bx + 0x14]
5:161A  9a4a453215           lcall 0x1532, 0x454a  ; sub_s3:454A
5:161F  8946da               mov word ptr [bp - 0x26], ax
5:1622  8956dc               mov word ptr [bp - 0x24], dx
5:1625  0bd0                 or dx, ax
5:1627  741b                 je 0x1644
5:1629  ff76dc               push word ptr [bp - 0x24]
5:162C  50                   push ax
5:162D  c45e06               les bx, ptr [bp + 6]
5:1630  66268b4714           mov eax, dword ptr es:[bx + 0x14]
5:1635  057600               add ax, 0x76
5:1638  6650                 push eax
5:163A  6626ff7718           push dword ptr es:[bx + 0x18]
5:163F  9a80446715           lcall 0x1567, 0x4480  ; sub_s2:4480
loc_1644:
5:1644  8d46de               lea ax, [bp - 0x22]
5:1647  16                   push ss
5:1648  50                   push ax
5:1649  666a00               push 0
5:164C  c45e06               les bx, ptr [bp + 6]
5:164F  6626ff7718           push dword ptr es:[bx + 0x18]
5:1654  26c45f18             les bx, ptr es:[bx + 0x18]
5:1658  26c41f               les bx, ptr es:[bx]
5:165B  26ff5f04             lcall es:[bx + 4]
loc_165F:
5:165F  c45e06               les bx, ptr [bp + 6]
5:1662  26ff7704             push word ptr es:[bx + 4]
5:1666  8d46e0               lea ax, [bp - 0x20]
5:1669  16                   push ss
5:166A  50                   push ax
5:166B  9ac80c0000           lcall 0, 0xcc8  ; USER.EndPaint
5:1670  c9                   leave
5:1671  ca0400               retf 4

; ---------------- sub_s5:1674 FAR size=150 callers=1
;   apis: GDI.GetStockObject, USER.DrawIcon, USER.FillRect, USER.GetClientRect
5:1674  c8200000             enter 0x20, 0
5:1678  833e100000           cmp word ptr [0x10], 0
5:167D  0f858400             jne 0x1705
5:1681  c45e06               les bx, ptr [bp + 6]
5:1684  6626ff7714           push dword ptr es:[bx + 0x14]
5:1689  26c45f14             les bx, ptr es:[bx + 0x14]
5:168D  26c41f               les bx, ptr es:[bx]
5:1690  26ff5f2c             lcall es:[bx + 0x2c]
5:1694  8946fe               mov word ptr [bp - 2], ax
5:1697  0bc0                 or ax, ax
5:1699  746a                 je 0x1705
5:169B  6a04                 push 4
5:169D  9affff0000           lcall 0, 0xffff  ; GDI.GetStockObject
5:16A2  8946fc               mov word ptr [bp - 4], ax
5:16A5  c45e06               les bx, ptr [bp + 6]
5:16A8  26ff7704             push word ptr es:[bx + 4]
5:16AC  8d46f4               lea ax, [bp - 0xc]
5:16AF  16                   push ss
5:16B0  50                   push ax
5:16B1  9aa3150000           lcall 0, 0x15a3  ; USER.GetClientRect
5:16B6  33c0                 xor ax, ax
5:16B8  8946e8               mov word ptr [bp - 0x18], ax
5:16BB  8946ea               mov word ptr [bp - 0x16], ax
5:16BE  8b46f8               mov ax, word ptr [bp - 8]
5:16C1  2b46f4               sub ax, word ptr [bp - 0xc]
5:16C4  48                   dec ax
5:16C5  8946f2               mov word ptr [bp - 0xe], ax
5:16C8  8946ec               mov word ptr [bp - 0x14], ax
5:16CB  8b46fa               mov ax, word ptr [bp - 6]
5:16CE  2b46f6               sub ax, word ptr [bp - 0xa]
5:16D1  48                   dec ax
5:16D2  8946f0               mov word ptr [bp - 0x10], ax
5:16D5  8946ee               mov word ptr [bp - 0x12], ax
5:16D8  c45e06               les bx, ptr [bp + 6]
5:16DB  26c45f14             les bx, ptr es:[bx + 0x14]
5:16DF  268b477c             mov ax, word ptr es:[bx + 0x7c]
5:16E3  8946e6               mov word ptr [bp - 0x1a], ax
5:16E6  50                   push ax
5:16E7  8d46e8               lea ax, [bp - 0x18]
5:16EA  16                   push ss
5:16EB  50                   push ax
5:16EC  ff76fc               push word ptr [bp - 4]
5:16EF  9ab8060000           lcall 0, 0x6b8  ; USER.FillRect
5:16F4  ff76e6               push word ptr [bp - 0x1a]
5:16F7  666802000200         push 0x20002
5:16FD  ff76fe               push word ptr [bp - 2]
5:1700  9affff0000           lcall 0, 0xffff  ; USER.DrawIcon
loc_1705:
5:1705  c9                   leave
5:1706  ca0400               retf 4
5:1709  db 00

; ---------------- sub_s5:170A FAR size=46 callers=0
5:170A  55                   push bp
5:170B  8bec                 mov bp, sp
5:170D  66ff7606             push dword ptr [bp + 6]
5:1711  90                   nop
5:1712  0e                   push cs
5:1713  e8f8fd               call 0x150e  ; sub_s5:150E
5:1716  f6460a01             test byte ptr [bp + 0xa], 1
5:171A  7409                 je 0x1725
5:171C  66ff7606             push dword ptr [bp + 6]
5:1720  9ace177813           lcall 0x1378, 0x17ce  ; operator_delete@s1:17CE
loc_1725:
5:1725  8b4606               mov ax, word ptr [bp + 6]
5:1728  8b5608               mov dx, word ptr [bp + 8]
5:172B  c9                   leave
5:172C  ca0600               retf 6
5:172F  db 90 0a 17 36 17 7c 15 1e 15

; ---------------- sub_s5:1738 FAR size=72 callers=1
5:1738  c8060000             enter 6, 0
5:173C  c45e0c               les bx, ptr [bp + 0xc]
5:173F  26ff7708             push word ptr es:[bx + 8]
5:1743  66680000cd0f         push 0xfcd0000
5:1749  666a01               push 1
5:174C  66ff7606             push dword ptr [bp + 6]
5:1750  9a2877ffff           lcall 0xffff, 0x7728  ; sub_s9:7728
5:1755  c45e06               les bx, ptr [bp + 6]
5:1758  662bc0               sub eax, eax
5:175B  662689878e00         mov dword ptr es:[bx + 0x8e], eax
5:1761  662689879200         mov dword ptr es:[bx + 0x92], eax
5:1767  2689879600           mov word ptr es:[bx + 0x96], ax
5:176C  26c7077a1e           mov word ptr es:[bx], 0x1e7a
5:1771  26c747023217         mov word ptr es:[bx + 2], 0x1732  ; SEGMENT s5:0000
5:1777  8bc3                 mov ax, bx
5:1779  8cc2                 mov dx, es
5:177B  c9                   leave
5:177C  ca0a00               retf 0xa
5:177F  db 00

; ---------------- sub_s5:1780 FAR size=28 callers=0
5:1780  55                   push bp
5:1781  8bec                 mov bp, sp
5:1783  c45e06               les bx, ptr [bp + 6]
5:1786  06                   push es
5:1787  53                   push bx
5:1788  26c41f               les bx, ptr es:[bx]
5:178B  26ff5f6c             lcall es:[bx + 0x6c]
5:178F  66ff7606             push dword ptr [bp + 6]
5:1793  9a12825317           lcall 0x1753, 0x8212  ; sub_s9:8212
5:1798  c9                   leave
5:1799  ca0400               retf 4

; ---------------- sub_s5:179C size=972 callers=0
;   apis: KERNEL.FreeProcInstance, KERNEL.MakeProcInstance, USER.EnumChildWindows, USER.GetClientRect, USER.GetDlgItem, USER.GetSystemMetrics, USER.GetWindowRect, USER.MoveWindow, USER.SetWindowPos, USER.SetWindowText
5:179C  c8760100             enter 0x176, 0
5:17A0  66ff7606             push dword ptr [bp + 6]
5:17A4  9ae2789617           lcall 0x1796, 0x78e2  ; sub_s9:78E2
5:17A9  666809008900         push 0x890009
5:17AF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:17B4  9aba20c417           lcall 0x17c4, 0x20ba  ; sub_s3:20BA
5:17B9  8946fc               mov word ptr [bp - 4], ax
5:17BC  8956fe               mov word ptr [bp - 2], dx
5:17BF  52                   push dx
5:17C0  50                   push ax
5:17C1  9ad065da17           lcall 0x17da, 0x65d0  ; sub_s3:65D0
5:17C6  3d0100               cmp ax, 1
5:17C9  1bc0                 sbb ax, ax
5:17CB  f7d8                 neg ax
5:17CD  8946fa               mov word ptr [bp - 6], ax
5:17D0  688600               push 0x86
5:17D3  66ff76fc             push dword ptr [bp - 4]
5:17D7  9ad065ef17           lcall 0x17ef, 0x65d0  ; sub_s3:65D0
5:17DC  0bc0                 or ax, ax
5:17DE  7405                 je 0x17e5
5:17E0  c746fa0000           mov word ptr [bp - 6], 0
loc_17E5:
5:17E5  6a39                 push 0x39
5:17E7  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:17EC  9aba206f18           lcall 0x186f, 0x20ba  ; sub_s3:20BA
5:17F1  c45e06               les bx, ptr [bp + 6]
5:17F4  2689878e00           mov word ptr es:[bx + 0x8e], ax
5:17F9  2689979000           mov word ptr es:[bx + 0x90], dx
5:17FE  ff76fa               push word ptr [bp - 6]
5:1801  52                   push dx
5:1802  26ffb78e00           push word ptr es:[bx + 0x8e]
5:1807  26c49f8e00           les bx, ptr es:[bx + 0x8e]
5:180C  26c41f               les bx, ptr es:[bx]
5:180F  26ff5f10             lcall es:[bx + 0x10]
5:1813  6a12                 push 0x12  ; 'version %d %d'
5:1815  9a9c171819           lcall 0x1918, 0x179c  ; operator_new@s1:179C
5:181A  83c402               add sp, 2
5:181D  8946b4               mov word ptr [bp - 0x4c], ax
5:1820  8956b6               mov word ptr [bp - 0x4a], dx
5:1823  0bd0                 or dx, ax
5:1825  7421                 je 0x1848
5:1827  c45e06               les bx, ptr [bp + 6]
5:182A  26ff7706             push word ptr es:[bx + 6]
5:182E  06                   push es
5:182F  53                   push bx
5:1830  ff76b6               push word ptr [bp - 0x4a]
5:1833  50                   push ax
5:1834  90                   nop
5:1835  0e                   push cs
5:1836  e8b106               call 0x1eea  ; sub_s5:1EEA
5:1839  c45e06               les bx, ptr [bp + 6]
5:183C  2689879200           mov word ptr es:[bx + 0x92], ax
5:1841  2689979400           mov word ptr es:[bx + 0x94], dx
5:1846  eb0d                 jmp 0x1855
loc_1848:
5:1848  c45e06               les bx, ptr [bp + 6]
5:184B  6626c787920000000000 mov dword ptr es:[bx + 0x92], 0
loc_1855:
5:1855  c45e06               les bx, ptr [bp + 6]
5:1858  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
5:185E  050a00               add ax, 0xa
5:1861  668946f6             mov dword ptr [bp - 0xa], eax
5:1865  6a48                 push 0x48
5:1867  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:186C  9aba203b19           lcall 0x193b, 0x20ba  ; sub_s3:20BA
5:1871  8946f2               mov word ptr [bp - 0xe], ax
5:1874  8956f4               mov word ptr [bp - 0xc], dx
5:1877  c45e06               les bx, ptr [bp + 6]
5:187A  26ff7706             push word ptr es:[bx + 6]
5:187E  8d46e6               lea ax, [bp - 0x1a]
5:1881  16                   push ss
5:1882  50                   push ax
5:1883  9ab2160000           lcall 0, 0x16b2  ; USER.GetClientRect
5:1888  6a04                 push 4
5:188A  9aef190000           lcall 0, 0x19ef  ; USER.GetSystemMetrics
5:188F  0346ec               add ax, word ptr [bp - 0x14]
5:1892  c45ef6               les bx, ptr [bp - 0xa]
5:1895  26894706             mov word ptr es:[bx + 6], ax
5:1899  c45ef2               les bx, ptr [bp - 0xe]
5:189C  268b470a             mov ax, word ptr es:[bx + 0xa]
5:18A0  8946f0               mov word ptr [bp - 0x10], ax
5:18A3  268b470c             mov ax, word ptr es:[bx + 0xc]
5:18A7  8946ee               mov word ptr [bp - 0x12], ax
5:18AA  c45ef6               les bx, ptr [bp - 0xa]
5:18AD  262b4706             sub ax, word ptr es:[bx + 6]
5:18B1  99                   cdq
5:18B2  2bc2                 sub ax, dx
5:18B4  d1f8                 sar ax, 1
5:18B6  26894702             mov word ptr es:[bx + 2], ax
5:18BA  8b46f0               mov ax, word ptr [bp - 0x10]
5:18BD  262b4704             sub ax, word ptr es:[bx + 4]
5:18C1  99                   cdq
5:18C2  2bc2                 sub ax, dx
5:18C4  d1f8                 sar ax, 1
5:18C6  268907               mov word ptr es:[bx], ax
5:18C9  666800000001         push 0x1000000
5:18CF  6a01                 push 1
5:18D1  8d46d4               lea ax, [bp - 0x2c]
5:18D4  16                   push ss
5:18D5  50                   push ax
5:18D6  9a52dce818           lcall 0x18e8, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
5:18DB  c746ca0000           mov word ptr [bp - 0x36], 0
loc_18E0:
5:18E0  8d46d4               lea ax, [bp - 0x2c]
5:18E3  16                   push ss
5:18E4  50                   push ax
5:18E5  9aece4ffff           lcall 0xffff, 0xe4ec  ; DbIter::next@s6:E4EC
5:18EA  8946d0               mov word ptr [bp - 0x30], ax
5:18ED  8956d2               mov word ptr [bp - 0x2e], dx
5:18F0  0bd0                 or dx, ax
5:18F2  742c                 je 0x1920
5:18F4  c45ed0               les bx, ptr [bp - 0x30]
5:18F7  66268b4710           mov eax, dword ptr es:[bx + 0x10]
5:18FC  668946cc             mov dword ptr [bp - 0x34], eax
5:1900  660bc0               or eax, eax
5:1903  74db                 je 0x18e0
5:1905  c45ecc               les bx, ptr [bp - 0x34]
5:1908  6626ff37             push dword ptr es:[bx]
5:190C  668b4606             mov eax, dword ptr [bp + 6]
5:1910  051000               add ax, 0x10
5:1913  6650                 push eax
5:1915  9aea3c2317           lcall 0x1723, 0x3cea  ; sub_s1:3CEA
5:191A  83c408               add sp, 8
5:191D  ebc1                 jmp 0x18e0
5:191F  db 90
loc_1920:
5:1920  66ff7606             push dword ptr [bp + 6]
5:1924  90                   nop
5:1925  0e                   push cs
5:1926  e87f04               call 0x1da8  ; sub_s5:1DA8
5:1929  c45e06               les bx, ptr [bp + 6]
5:192C  2689879600           mov word ptr es:[bx + 0x96], ax
5:1931  688600               push 0x86
5:1934  66ff76fc             push dword ptr [bp - 4]
5:1938  9ad0658819           lcall 0x1988, 0x65d0  ; sub_s3:65D0
5:193D  0bc0                 or ax, ax
5:193F  740d                 je 0x194e
5:1941  c45e06               les bx, ptr [bp + 6]
5:1944  2683bf960000         cmp word ptr es:[bx + 0x96], 0
5:194A  0f84c000             je 0x1a0e
loc_194E:
5:194E  c45e06               les bx, ptr [bp + 6]
5:1951  26c49f8e00           les bx, ptr es:[bx + 0x8e]
5:1956  26c7472c0000         mov word ptr es:[bx + 0x2c], 0
5:195C  c45e06               les bx, ptr [bp + 6]
5:195F  26ff7706             push word ptr es:[bx + 6]
5:1963  687501               push 0x175
5:1966  9a611a0000           lcall 0, 0x1a61  ; USER.GetDlgItem
5:196B  89469c               mov word ptr [bp - 0x64], ax
5:196E  837efa00             cmp word ptr [bp - 6], 0
5:1972  7424                 je 0x1998
5:1974  682d07               push 0x72d
5:1977  8d868afe             lea ax, [bp - 0x176]
5:197B  16                   push ss
5:197C  50                   push ax
5:197D  680001               push 0x100
5:1980  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:1985  9ae084ce1a           lcall 0x1ace, 0x84e0  ; sub_s3:84E0
5:198A  ff769c               push word ptr [bp - 0x64]
5:198D  8d868afe             lea ax, [bp - 0x176]
5:1991  16                   push ss
5:1992  50                   push ax
5:1993  9ae71a0000           lcall 0, 0x1ae7  ; USER.SetWindowText
loc_1998:
5:1998  68271a               push 0x1a27  ; SEGMENT s5:0000
5:199B  681e1e               push 0x1e1e
5:199E  ff368c03             push word ptr [0x38c]
5:19A2  9a311a0000           lcall 0, 0x1a31  ; KERNEL.MakeProcInstance
5:19A7  8946c6               mov word ptr [bp - 0x3a], ax
5:19AA  8956c8               mov word ptr [bp - 0x38], dx
5:19AD  ff769c               push word ptr [bp - 0x64]
5:19B0  8d4694               lea ax, [bp - 0x6c]
5:19B3  16                   push ss
5:19B4  50                   push ax
5:19B5  9a6f1a0000           lcall 0, 0x1a6f  ; USER.GetWindowRect
5:19BA  668b4694             mov eax, dword ptr [bp - 0x6c]
5:19BE  6689468c             mov dword ptr [bp - 0x74], eax
5:19C2  668b4698             mov eax, dword ptr [bp - 0x68]
5:19C6  8b569a               mov dx, word ptr [bp - 0x66]
5:19C9  66894690             mov dword ptr [bp - 0x70], eax
5:19CD  2b4694               sub ax, word ptr [bp - 0x6c]
5:19D0  8946a0               mov word ptr [bp - 0x60], ax
5:19D3  8bca                 mov cx, dx
5:19D5  2b4e96               sub cx, word ptr [bp - 0x6a]
5:19D8  894ea4               mov word ptr [bp - 0x5c], cx
5:19DB  c45ef6               les bx, ptr [bp - 0xa]
5:19DE  262b4704             sub ax, word ptr es:[bx + 4]
5:19E2  f7d8                 neg ax
5:19E4  99                   cdq
5:19E5  2bc2                 sub ax, dx
5:19E7  d1f8                 sar ax, 1
5:19E9  89468c               mov word ptr [bp - 0x74], ax
5:19EC  6a04                 push 4
5:19EE  9aa81a0000           lcall 0, 0x1aa8  ; USER.GetSystemMetrics
5:19F3  29468e               sub word ptr [bp - 0x72], ax
5:19F6  ff769c               push word ptr [bp - 0x64]
5:19F9  ff768c               push word ptr [bp - 0x74]
5:19FC  ff768e               push word ptr [bp - 0x72]
5:19FF  ff76a0               push word ptr [bp - 0x60]
5:1A02  ff76a4               push word ptr [bp - 0x5c]
5:1A05  6a00                 push 0
5:1A07  9a341b0000           lcall 0, 0x1b34  ; USER.MoveWindow
5:1A0C  eb2d                 jmp 0x1a3b
loc_1A0E:
5:1A0E  666801009d00         push 0x9d0001
5:1A14  66ff36a002           push dword ptr [0x2a0]
5:1A19  9a7c5c4216           lcall 0x1642, 0x5c7c  ; sub_s2:5C7C
5:1A1E  c45e06               les bx, ptr [bp + 6]
5:1A21  2689878c00           mov word ptr es:[bx + 0x8c], ax
5:1A26  687517               push 0x1775  ; SEGMENT s5:0000
5:1A29  68ea1d               push 0x1dea
5:1A2C  ff368c03             push word ptr [0x38c]
5:1A30  9affff0000           lcall 0, 0xffff  ; KERNEL.MakeProcInstance
5:1A35  8946c6               mov word ptr [bp - 0x3a], ax
5:1A38  8956c8               mov word ptr [bp - 0x38], dx
loc_1A3B:
5:1A3B  c45e06               les bx, ptr [bp + 6]
5:1A3E  26ff7706             push word ptr es:[bx + 6]
5:1A42  66ff76c6             push dword ptr [bp - 0x3a]
5:1A46  666a00               push 0
5:1A49  9affff0000           lcall 0, 0xffff  ; USER.EnumChildWindows
5:1A4E  66ff76c6             push dword ptr [bp - 0x3a]
5:1A52  9affff0000           lcall 0, 0xffff  ; KERNEL.FreeProcInstance
5:1A57  c45e06               les bx, ptr [bp + 6]
5:1A5A  26ff7706             push word ptr es:[bx + 6]
5:1A5E  6a01                 push 1
5:1A60  9adb1a0000           lcall 0, 0x1adb  ; USER.GetDlgItem
5:1A65  8946bc               mov word ptr [bp - 0x44], ax
5:1A68  50                   push ax
5:1A69  8d4ee6               lea cx, [bp - 0x1a]
5:1A6C  16                   push ss
5:1A6D  51                   push cx
5:1A6E  9affff0000           lcall 0, 0xffff  ; USER.GetWindowRect
5:1A73  668b46e6             mov eax, dword ptr [bp - 0x1a]
5:1A77  668946be             mov dword ptr [bp - 0x42], eax
5:1A7B  668b46ea             mov eax, dword ptr [bp - 0x16]
5:1A7F  8b56ec               mov dx, word ptr [bp - 0x14]
5:1A82  668946c2             mov dword ptr [bp - 0x3e], eax
5:1A86  2b46e6               sub ax, word ptr [bp - 0x1a]
5:1A89  8946ba               mov word ptr [bp - 0x46], ax
5:1A8C  8bca                 mov cx, dx
5:1A8E  2b4ee8               sub cx, word ptr [bp - 0x18]
5:1A91  894eb8               mov word ptr [bp - 0x48], cx
5:1A94  c45ef6               les bx, ptr [bp - 0xa]
5:1A97  262b4704             sub ax, word ptr es:[bx + 4]
5:1A9B  f7d8                 neg ax
5:1A9D  99                   cdq
5:1A9E  2bc2                 sub ax, dx
5:1AA0  d1f8                 sar ax, 1
5:1AA2  8946be               mov word ptr [bp - 0x42], ax
5:1AA5  6a04                 push 4
5:1AA7  9affff0000           lcall 0, 0xffff  ; USER.GetSystemMetrics
5:1AAC  2946c0               sub word ptr [bp - 0x40], ax
5:1AAF  c45e06               les bx, ptr [bp + 6]
5:1AB2  2683bf960000         cmp word ptr es:[bx + 0x96], 0
5:1AB8  7440                 je 0x1afa
5:1ABA  682f07               push 0x72f
5:1ABD  8d868afe             lea ax, [bp - 0x176]
5:1AC1  16                   push ss
5:1AC2  50                   push ax
5:1AC3  680001               push 0x100
5:1AC6  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:1ACB  9ae084141b           lcall 0x1b14, 0x84e0  ; sub_s3:84E0
5:1AD0  c45e06               les bx, ptr [bp + 6]
5:1AD3  26ff7706             push word ptr es:[bx + 6]
5:1AD7  687501               push 0x175
5:1ADA  9affff0000           lcall 0, 0xffff  ; USER.GetDlgItem
5:1ADF  50                   push ax
5:1AE0  8d868afe             lea ax, [bp - 0x176]
5:1AE4  16                   push ss
5:1AE5  50                   push ax
5:1AE6  9a201b0000           lcall 0, 0x1b20  ; USER.SetWindowText
5:1AEB  68fe03               push 0x3fe
5:1AEE  8d868afe             lea ax, [bp - 0x176]
5:1AF2  16                   push ss
5:1AF3  50                   push ax
5:1AF4  68ff03               push 0x3ff
5:1AF7  eb13                 jmp 0x1b0c
5:1AF9  db 90
loc_1AFA:
5:1AFA  837efa00             cmp word ptr [bp - 6], 0
5:1AFE  7424                 je 0x1b24
5:1B00  682e07               push 0x72e
5:1B03  8d868afe             lea ax, [bp - 0x176]
5:1B07  16                   push ss
5:1B08  50                   push ax
5:1B09  680001               push 0x100
loc_1B0C:
5:1B0C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:1B11  9ae0841d16           lcall 0x161d, 0x84e0  ; sub_s3:84E0
5:1B16  ff76bc               push word ptr [bp - 0x44]
5:1B19  8d868afe             lea ax, [bp - 0x176]
5:1B1D  16                   push ss
5:1B1E  50                   push ax
5:1B1F  9affff0000           lcall 0, 0xffff  ; USER.SetWindowText
loc_1B24:
5:1B24  ff76bc               push word ptr [bp - 0x44]
5:1B27  ff76be               push word ptr [bp - 0x42]
5:1B2A  ff76c0               push word ptr [bp - 0x40]
5:1B2D  66ff76b8             push dword ptr [bp - 0x48]
5:1B31  6a00                 push 0
5:1B33  9a7d120000           lcall 0, 0x127d  ; USER.MoveWindow
5:1B38  c45e06               les bx, ptr [bp + 6]
5:1B3B  26ff7706             push word ptr es:[bx + 6]
5:1B3F  6a00                 push 0
5:1B41  c45ef6               les bx, ptr [bp - 0xa]
5:1B44  26ff37               push word ptr es:[bx]
5:1B47  26ff7702             push word ptr es:[bx + 2]
5:1B4B  26ff7704             push word ptr es:[bx + 4]
5:1B4F  26ff7706             push word ptr es:[bx + 6]
5:1B53  6a44                 push 0x44
5:1B55  9affff0000           lcall 0, 0xffff  ; USER.SetWindowPos
5:1B5A  c746d49a38           mov word ptr [bp - 0x2c], 0x389a
5:1B5F  c746d61c1a           mov word ptr [bp - 0x2a], 0x1a1c  ; SEGMENT s2:0000
5:1B64  c9                   leave
5:1B65  ca0400               retf 4

; ---------------- sub_s5:1B68 size=78 callers=0
5:1B68  c8080000             enter 8, 0
5:1B6C  c45e06               les bx, ptr [bp + 6]
5:1B6F  268b879200           mov ax, word ptr es:[bx + 0x92]
5:1B74  268b979400           mov dx, word ptr es:[bx + 0x94]
5:1B79  8bda                 mov bx, dx
5:1B7B  0bd8                 or bx, ax
5:1B7D  740e                 je 0x1b8d
5:1B7F  6a01                 push 1
5:1B81  52                   push dx
5:1B82  50                   push ax
5:1B83  8ec2                 mov es, dx
5:1B85  8bd8                 mov bx, ax
5:1B87  26c41f               les bx, ptr es:[bx]
5:1B8A  26ff1f               lcall es:[bx]
loc_1B8D:
5:1B8D  c45e06               les bx, ptr [bp + 6]
5:1B90  6626c787920000000000 mov dword ptr es:[bx + 0x92], 0
5:1B9A  6626ffb78e00         push dword ptr es:[bx + 0x8e]
5:1BA0  9a484fb717           lcall 0x17b7, 0x4f48  ; sub_s3:4F48
5:1BA5  c45e06               les bx, ptr [bp + 6]
5:1BA8  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
5:1BB2  c9                   leave
5:1BB3  ca0400               retf 4

; ---------------- sub_s5:1BB6 FAR size=30 callers=0
5:1BB6  55                   push bp
5:1BB7  8bec                 mov bp, sp
5:1BB9  c45e06               les bx, ptr [bp + 6]
5:1BBC  6626ffb79200         push dword ptr es:[bx + 0x92]
5:1BC2  26c49f9200           les bx, ptr es:[bx + 0x92]
5:1BC7  26c41f               les bx, ptr es:[bx]
5:1BCA  26ff5f08             lcall es:[bx + 8]
5:1BCE  33c0                 xor ax, ax
5:1BD0  c9                   leave
5:1BD1  ca0400               retf 4

; ---------------- sub_s5:1BD4 size=208 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem
5:1BD4  c80e0000             enter 0xe, 0
5:1BD8  c746fc0000           mov word ptr [bp - 4], 0
5:1BDD  66ff760c             push dword ptr [bp + 0xc]
5:1BE1  66ff7608             push dword ptr [bp + 8]
5:1BE5  ff7606               push word ptr [bp + 6]
5:1BE8  90                   nop
5:1BE9  0e                   push cs
5:1BEA  e8a101               call 0x1d8e  ; sub_s5:1D8E
5:1BED  0bc0                 or ax, ax
5:1BEF  7460                 je 0x1c51
5:1BF1  3d0100               cmp ax, 1
5:1BF4  7e56                 jle 0x1c4c
5:1BF6  c45e06               les bx, ptr [bp + 6]
5:1BF9  26ff7706             push word ptr es:[bx + 6]
5:1BFD  6a01                 push 1
5:1BFF  9a67190000           lcall 0, 0x1967  ; USER.GetDlgItem
5:1C04  8946fa               mov word ptr [bp - 6], ax
5:1C07  c45e06               les bx, ptr [bp + 6]
5:1C0A  6626ffb78e00         push dword ptr es:[bx + 0x8e]
5:1C10  9a8c4e2b1c           lcall 0x1c2b, 0x4e8c  ; sub_s3:4E8C
5:1C15  ff76fa               push word ptr [bp - 6]
5:1C18  6a01                 push 1
5:1C1A  9a451c0000           lcall 0, 0x1c45  ; USER.EnableWindow
5:1C1F  c45e06               les bx, ptr [bp + 6]
5:1C22  6626ffb78e00         push dword ptr es:[bx + 0x8e]
5:1C28  9af04da31b           lcall 0x1ba3, 0x4df0  ; sub_s3:4DF0
5:1C2D  0bc0                 or ax, ax
5:1C2F  7520                 jne 0x1c51
5:1C31  c746fc0100           mov word ptr [bp - 4], 1
5:1C36  c45e06               les bx, ptr [bp + 6]
5:1C39  2639879600           cmp word ptr es:[bx + 0x96], ax
5:1C3E  7511                 jne 0x1c51
5:1C40  ff76fa               push word ptr [bp - 6]
5:1C43  50                   push ax
5:1C44  9affff0000           lcall 0, 0xffff  ; USER.EnableWindow
5:1C49  eb06                 jmp 0x1c51
5:1C4B  db 90
loc_1C4C:
5:1C4C  c746fc0100           mov word ptr [bp - 4], 1
loc_1C51:
5:1C51  837efc00             cmp word ptr [bp - 4], 0
5:1C55  7448                 je 0x1c9f
5:1C57  68b400               push 0xb4
5:1C5A  9a9c171818           lcall 0x1818, 0x179c  ; operator_new@s1:179C
5:1C5F  83c402               add sp, 2
5:1C62  8956f4               mov word ptr [bp - 0xc], dx
5:1C65  0bd0                 or dx, ax
5:1C67  7421                 je 0x1c8a
5:1C69  66687b052a06         push 0x62a057b
5:1C6F  666830000200         push 0x20030
5:1C75  c45e06               les bx, ptr [bp + 6]
5:1C78  26ff7706             push word ptr es:[bx + 6]
5:1C7C  ff76f4               push word ptr [bp - 0xc]
5:1C7F  50                   push ax
5:1C80  9a2085a717           lcall 0x17a7, 0x8520  ; sub_s9:8520
5:1C85  83c40e               add sp, 0xe
5:1C88  eb03                 jmp 0x1c8d
loc_1C8A:
5:1C8A  33c0                 xor ax, ax
5:1C8C  99                   cdq
loc_1C8D:
5:1C8D  8946f6               mov word ptr [bp - 0xa], ax
5:1C90  8956f8               mov word ptr [bp - 8], dx
5:1C93  52                   push dx
5:1C94  c45ef6               les bx, ptr [bp - 0xa]
5:1C97  50                   push ax
5:1C98  26c41f               les bx, ptr es:[bx]
5:1C9B  26ff5f74             lcall es:[bx + 0x74]
loc_1C9F:
5:1C9F  c9                   leave
5:1CA0  ca0a00               retf 0xa
5:1CA3  db 00

; ---------------- sub_s5:1CA4 FAR size=134 callers=1
;   apis: USER.PostMessage
5:1CA4  c80c0000             enter 0xc, 0
5:1CA8  c45e06               les bx, ptr [bp + 6]
5:1CAB  2683bf960000         cmp word ptr es:[bx + 0x96], 0
5:1CB1  7407                 je 0x1cba
loc_1CB3:
5:1CB3  b80100               mov ax, 1
5:1CB6  c9                   leave
5:1CB7  ca0400               retf 4
loc_1CBA:
5:1CBA  6626ffb78e00         push dword ptr es:[bx + 0x8e]
5:1CC0  9af04d131c           lcall 0x1c13, 0x4df0  ; sub_s3:4DF0
5:1CC5  0bc0                 or ax, ax
5:1CC7  7415                 je 0x1cde
5:1CC9  ff369603             push word ptr [0x396]
5:1CCD  6668de001101         push 0x11100de
5:1CD3  666a00               push 0
5:1CD6  9abb0f0000           lcall 0, 0xfbb  ; USER.PostMessage
5:1CDB  ebd6                 jmp 0x1cb3
5:1CDD  db 90
loc_1CDE:
5:1CDE  68b400               push 0xb4
5:1CE1  9a9c175d1c           lcall 0x1c5d, 0x179c  ; operator_new@s1:179C
5:1CE6  83c402               add sp, 2
5:1CE9  8956f6               mov word ptr [bp - 0xa], dx
5:1CEC  0bd0                 or dx, ax
5:1CEE  741e                 je 0x1d0e
5:1CF0  66687b052a06         push 0x62a057b
5:1CF6  666830000200         push 0x20030
5:1CFC  ff369603             push word ptr [0x396]
5:1D00  ff76f6               push word ptr [bp - 0xa]
5:1D03  50                   push ax
5:1D04  9a2085831c           lcall 0x1c83, 0x8520  ; sub_s9:8520
5:1D09  83c40e               add sp, 0xe
5:1D0C  eb03                 jmp 0x1d11
loc_1D0E:
5:1D0E  33c0                 xor ax, ax
5:1D10  99                   cdq
loc_1D11:
5:1D11  8946f8               mov word ptr [bp - 8], ax
5:1D14  8956fa               mov word ptr [bp - 6], dx
5:1D17  52                   push dx
5:1D18  c45ef8               les bx, ptr [bp - 8]
5:1D1B  50                   push ax
5:1D1C  26c41f               les bx, ptr es:[bx]
5:1D1F  26ff5f74             lcall es:[bx + 0x74]
5:1D23  33c0                 xor ax, ax
5:1D25  c9                   leave
5:1D26  ca0400               retf 4
5:1D29  db 00

; ---------------- sub_s5:1D2A FAR size=32 callers=1
;   apis: USER.GetDlgItem, USER.SetWindowText
5:1D2A  55                   push bp
5:1D2B  8bec                 mov bp, sp
5:1D2D  c45e06               les bx, ptr [bp + 6]
5:1D30  26ff7706             push word ptr es:[bx + 6]
5:1D34  ff760e               push word ptr [bp + 0xe]
5:1D37  9a001c0000           lcall 0, 0x1c00  ; USER.GetDlgItem
5:1D3C  50                   push ax
5:1D3D  66ff760a             push dword ptr [bp + 0xa]
5:1D41  9a94190000           lcall 0, 0x1994  ; USER.SetWindowText
5:1D46  c9                   leave
5:1D47  ca0a00               retf 0xa

; ---------------- sub_s5:1D4A FAR size=68 callers=0
;   apis: USER.DestroyWindow, USER.PostMessage
5:1D4A  55                   push bp
5:1D4B  8bec                 mov bp, sp
5:1D4D  837e0a00             cmp word ptr [bp + 0xa], 0
5:1D51  7436                 je 0x1d89
5:1D53  66ff7606             push dword ptr [bp + 6]
5:1D57  90                   nop
5:1D58  0e                   push cs
5:1D59  e848ff               call 0x1ca4  ; sub_s5:1CA4
5:1D5C  0bc0                 or ax, ax
5:1D5E  7429                 je 0x1d89
5:1D60  c45e06               les bx, ptr [bp + 6]
5:1D63  2683bf960000         cmp word ptr es:[bx + 0x96], 0
5:1D69  7412                 je 0x1d7d
5:1D6B  ff369603             push word ptr [0x396]
5:1D6F  6668ee001101         push 0x11100ee
5:1D75  666a00               push 0
5:1D78  9ad71c0000           lcall 0, 0x1cd7  ; USER.PostMessage
loc_1D7D:
5:1D7D  c45e06               les bx, ptr [bp + 6]
5:1D80  26ff7706             push word ptr es:[bx + 6]
5:1D84  9affff0000           lcall 0, 0xffff  ; USER.DestroyWindow
loc_1D89:
5:1D89  c9                   leave
5:1D8A  ca0600               retf 6
5:1D8D  db 00

; ---------------- sub_s5:1D8E FAR size=26 callers=1
5:1D8E  55                   push bp
5:1D8F  8bec                 mov bp, sp
5:1D91  66ff760a             push dword ptr [bp + 0xa]
5:1D95  c45e06               les bx, ptr [bp + 6]
5:1D98  6626ffb78e00         push dword ptr es:[bx + 0x8e]
5:1D9E  9a084ec31c           lcall 0x1cc3, 0x4e08  ; sub_s3:4E08
5:1DA3  c9                   leave
5:1DA4  ca0a00               retf 0xa
5:1DA7  db 00

; ---------------- sub_s5:1DA8 FAR size=172 callers=1
5:1DA8  c8080000             enter 8, 0
5:1DAC  c45e06               les bx, ptr [bp + 6]
5:1DAF  26c49f8e00           les bx, ptr es:[bx + 0x8e]
5:1DB4  26837f3001           cmp word ptr es:[bx + 0x30], 1
5:1DB9  7507                 jne 0x1dc2
loc_1DBB:
5:1DBB  b80100               mov ax, 1
5:1DBE  c9                   leave
5:1DBF  ca0400               retf 4
loc_1DC2:
5:1DC2  c45e06               les bx, ptr [bp + 6]
5:1DC5  26c49f8e00           les bx, ptr es:[bx + 0x8e]
5:1DCA  26837f3002           cmp word ptr es:[bx + 0x30], 2
5:1DCF  7f12                 jg 0x1de3
5:1DD1  c45e06               les bx, ptr [bp + 6]
5:1DD4  6626ffb78e00         push dword ptr es:[bx + 0x8e]
5:1DDA  9af04da11d           lcall 0x1da1, 0x4df0  ; sub_s3:4DF0
5:1DDF  0bc0                 or ax, ax
5:1DE1  74d8                 je 0x1dbb
loc_1DE3:
5:1DE3  33c0                 xor ax, ax
5:1DE5  c9                   leave
5:1DE6  ca0400               retf 4
5:1DE9  db 00 55 8b ec ff 76 0a 9a 2a 09 00 00 0b c0 74 1d
5:1DF9  db ff 76 0a 6a f4 9a ff ff 00 00 3d 75 01 75 0e ff
5:1E09  db 76 0a 9a 85 1d 00 00 33 c0 c9 ca 06 00 b8 01 00
5:1E19  db c9 ca 06 00 00 c8 02 00 00 ff 76 0a 9a f1 1d 00
5:1E29  db 00 0b c0 74 1f ff 76 0a 6a f4 9a ff 1d 00 00 89
5:1E39  db 46 fe 48 74 0f 81 7e fe 75 01 74 08 ff 76 0a 9a
5:1E49  db 0c 1e 00 00 b8 01 00 c9 ca 06 00

; ---------------- sub_s5:1E54 size=150 callers=0
5:1E54  c8040000             enter 4, 0
5:1E58  66ff7606             push dword ptr [bp + 6]
5:1E5C  9a2c78071d           lcall 0x1d07, 0x782c  ; sub_s9:782C
5:1E61  f6460a01             test byte ptr [bp + 0xa], 1
5:1E65  7409                 je 0x1e70
5:1E67  66ff7606             push dword ptr [bp + 6]
5:1E6B  9ace17e41c           lcall 0x1ce4, 0x17ce  ; operator_delete@s1:17CE
loc_1E70:
5:1E70  8b4606               mov ax, word ptr [bp + 6]
5:1E73  8b5608               mov dx, word ptr [bp + 8]
5:1E76  c9                   leave
5:1E77  ca0600               retf 6
5:1E7A  db 54 1e 84 1e 10 3a 62 1b 9c 17 90 1e c0 79 8c 1e
5:1E8A  db 3c 7b 94 1e 4a 1d a0 1e 56 7f 98 1e b2 7b 9c 1e
5:1E9A  db 1c 7f a4 1e 80 17 c0 1e 86 7f a8 1e 0c 80 ac 1e
5:1EAA  db 54 80 b0 1e 5e 7e b4 1e 58 81 b8 1e b6 81 bc 1e
5:1EBA  db fe 81 c4 1e d4 1b dc 1e 4a 82 c8 1e 66 82 cc 1e
5:1ECA  db de 78 e4 1e ee 60 d4 1e f4 60 d8 1e fa 60 e0 1e
5:1EDA  db b6 1b e8 1e fe 60 f9 11 7e 80 5f 1e 68 1b 99 19

; ---------------- sub_s5:1EEA FAR size=138 callers=1
5:1EEA  c8100000             enter 0x10, 0
5:1EEE  c45e06               les bx, ptr [bp + 6]
5:1EF1  26c7079a38           mov word ptr es:[bx], 0x389a
5:1EF6  26c74702081f         mov word ptr es:[bx + 2], 0x1f08  ; SEGMENT s2:0000
5:1EFC  c45e06               les bx, ptr [bp + 6]
5:1EFF  26c707a83a           mov word ptr es:[bx], 0x3aa8
5:1F04  26c747021d1f         mov word ptr es:[bx + 2], 0x1f1d  ; SEGMENT s2:0000
5:1F0A  8b460e               mov ax, word ptr [bp + 0xe]
5:1F0D  c45e06               les bx, ptr [bp + 6]
5:1F10  26894704             mov word ptr es:[bx + 4], ax
5:1F14  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:1F19  26c74702801e         mov word ptr es:[bx + 2], 0x1e80  ; SEGMENT s2:0000
5:1F1F  c45e06               les bx, ptr [bp + 6]
5:1F22  6626c7470600000000   mov dword ptr es:[bx + 6], 0
5:1F2B  668b460a             mov eax, dword ptr [bp + 0xa]
5:1F2F  662689470a           mov dword ptr es:[bx + 0xa], eax
5:1F34  26c7071825           mov word ptr es:[bx], 0x2518
5:1F39  26c747027c1e         mov word ptr es:[bx + 2], 0x1e7c  ; SEGMENT s5:0000
5:1F3F  6a39                 push 0x39
5:1F41  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:1F46  9aba20dd1d           lcall 0x1ddd, 0x20ba  ; sub_s3:20BA
5:1F4B  c45e06               les bx, ptr [bp + 6]
5:1F4E  26894706             mov word ptr es:[bx + 6], ax
5:1F52  26895708             mov word ptr es:[bx + 8], dx
5:1F56  06                   push es
5:1F57  53                   push bx
5:1F58  6a00                 push 0
5:1F5A  52                   push dx
5:1F5B  26ff7706             push word ptr es:[bx + 6]
5:1F5F  26c45f06             les bx, ptr es:[bx + 6]
5:1F63  26c41f               les bx, ptr es:[bx]
5:1F66  26ff5f04             lcall es:[bx + 4]
5:1F6A  8b4606               mov ax, word ptr [bp + 6]
5:1F6D  8b5608               mov dx, word ptr [bp + 8]
5:1F70  c9                   leave
5:1F71  ca0a00               retf 0xa

; ---------------- sub_s5:1F74 FAR size=62 callers=1
5:1F74  c80c0000             enter 0xc, 0
5:1F78  c45e06               les bx, ptr [bp + 6]
5:1F7B  26c7071825           mov word ptr es:[bx], 0x2518
5:1F80  26c747023d1f         mov word ptr es:[bx + 2], 0x1f3d  ; SEGMENT s5:0000
5:1F86  06                   push es
5:1F87  53                   push bx
5:1F88  6626ff7706           push dword ptr es:[bx + 6]
5:1F8D  9aa61e491f           lcall 0x1f49, 0x1ea6  ; sub_s3:1EA6
5:1F92  c45e06               les bx, ptr [bp + 6]
5:1F95  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:1F9A  26c74702ac1f         mov word ptr es:[bx + 2], 0x1fac  ; SEGMENT s2:0000
5:1FA0  c45e06               les bx, ptr [bp + 6]
5:1FA3  26c7079a38           mov word ptr es:[bx], 0x389a
5:1FA8  26c74702fa1e         mov word ptr es:[bx + 2], 0x1efa  ; SEGMENT s2:0000
5:1FAE  c9                   leave
5:1FAF  ca0400               retf 4

; ---------------- sub_s5:1FB2 size=110 callers=0
;   apis: USER.GetWindowRect, USER.InvalidateRect
5:1FB2  c8140000             enter 0x14, 0
5:1FB6  8b460a               mov ax, word ptr [bp + 0xa]
5:1FB9  eb59                 jmp 0x2014
5:1FBB  db 90
loc_1FBC:
5:1FBC  c45e06               les bx, ptr [bp + 6]
5:1FBF  6626c7470600000000   mov dword ptr es:[bx + 6], 0
5:1FC8  c9                   leave
5:1FC9  ca0600               retf 6
loc_1FCC:
5:1FCC  c45e06               les bx, ptr [bp + 6]
5:1FCF  26ff7704             push word ptr es:[bx + 4]
5:1FD3  8d46f4               lea ax, [bp - 0xc]
5:1FD6  16                   push ss
5:1FD7  50                   push ax
5:1FD8  9ab6190000           lcall 0, 0x19b6  ; USER.GetWindowRect
5:1FDD  c746ec0000           mov word ptr [bp - 0x14], 0
5:1FE2  b84600               mov ax, 0x46
5:1FE5  8946fc               mov word ptr [bp - 4], ax
5:1FE8  8946ee               mov word ptr [bp - 0x12], ax
5:1FEB  8b46f8               mov ax, word ptr [bp - 8]
5:1FEE  2b46f4               sub ax, word ptr [bp - 0xc]
5:1FF1  8946f0               mov word ptr [bp - 0x10], ax
5:1FF4  b85f00               mov ax, 0x5f
5:1FF7  8946fe               mov word ptr [bp - 2], ax
5:1FFA  8946f2               mov word ptr [bp - 0xe], ax
5:1FFD  c45e06               les bx, ptr [bp + 6]
5:2000  26ff7704             push word ptr es:[bx + 4]
5:2004  8d46ec               lea ax, [bp - 0x14]
5:2007  16                   push ss
5:2008  50                   push ax
5:2009  6a00                 push 0
5:200B  9abb150000           lcall 0, 0x15bb  ; USER.InvalidateRect
5:2010  c9                   leave
5:2011  ca0600               retf 6
loc_2014:
5:2014  48                   dec ax
5:2015  74a5                 je 0x1fbc
5:2017  2d0c00               sub ax, 0xc
5:201A  74b0                 je 0x1fcc
5:201C  c9                   leave
5:201D  ca0600               retf 6

; ---------------- sub_s5:2020 size=614 callers=0
;   apis: GDI.CreatePen, GDI.CreateSolidBrush, GDI.DeleteObject, GDI.SelectObject, USER.BeginPaint, USER.EndPaint, USER.SelectPalette
5:2020  c84a0000             enter 0x4a, 0
5:2024  57                   push di
5:2025  56                   push si
5:2026  c45e06               les bx, ptr [bp + 6]
5:2029  26ff7704             push word ptr es:[bx + 4]
5:202D  8d46e0               lea ax, [bp - 0x20]
5:2030  16                   push ss
5:2031  50                   push ax
5:2032  9aef150000           lcall 0, 0x15ef  ; USER.BeginPaint
5:2037  8946de               mov word ptr [bp - 0x22], ax
5:203A  c45e06               les bx, ptr [bp + 6]
5:203D  6626ff7706           push dword ptr es:[bx + 6]
5:2042  9a2c4c1c21           lcall 0x211c, 0x4c2c  ; sub_s3:4C2C
5:2047  8946da               mov word ptr [bp - 0x26], ax
5:204A  8956dc               mov word ptr [bp - 0x24], dx
5:204D  8d46de               lea ax, [bp - 0x22]
5:2050  16                   push ss
5:2051  50                   push ax
5:2052  c45eda               les bx, ptr [bp - 0x26]
5:2055  06                   push es
5:2056  53                   push bx
5:2057  26c41f               les bx, ptr es:[bx]
5:205A  26ff5f08             lcall es:[bx + 8]
5:205E  c45e06               les bx, ptr [bp + 6]
5:2061  26894710             mov word ptr es:[bx + 0x10], ax
5:2065  c45e06               les bx, ptr [bp + 6]
5:2068  26c45f06             les bx, ptr es:[bx + 6]
5:206C  268b4730             mov ax, word ptr es:[bx + 0x30]
5:2070  8946d8               mov word ptr [bp - 0x28], ax
5:2073  c45e06               les bx, ptr [bp + 6]
5:2076  26c45f06             les bx, ptr es:[bx + 6]
5:207A  26c45f12             les bx, ptr es:[bx + 0x12]
5:207E  66268b07             mov eax, dword ptr es:[bx]
5:2082  668946d4             mov dword ptr [bp - 0x2c], eax
5:2086  c746d21400           mov word ptr [bp - 0x2e], 0x14
5:208B  c746d00000           mov word ptr [bp - 0x30], 0
5:2090  8d46ca               lea ax, [bp - 0x36]
5:2093  16                   push ss
5:2094  50                   push ax
5:2095  9a383eb420           lcall 0x20b4, 0x3e38  ; sub_s2:3E38
5:209A  c746c80000           mov word ptr [bp - 0x38], 0
5:209F  e99500               jmp 0x2137
loc_20A2:
5:20A2  8b5ec8               mov bx, word ptr [bp - 0x38]
5:20A5  c1e302               shl bx, 2
5:20A8  c476d4               les si, ptr [bp - 0x2c]
5:20AB  6626ff30             push dword ptr es:[bx + si]
5:20AF  8bfb                 mov di, bx
5:20B1  9a7247e020           lcall 0x20e0, 0x4772  ; sub_s2:4772
5:20B6  8946bc               mov word ptr [bp - 0x44], ax
5:20B9  8956be               mov word ptr [bp - 0x42], dx
5:20BC  8ec2                 mov es, dx
5:20BE  8bd8                 mov bx, ax
5:20C0  26ff7708             push word ptr es:[bx + 8]
5:20C4  8d46d0               lea ax, [bp - 0x30]
5:20C7  16                   push ss
5:20C8  50                   push ax
5:20C9  66ff7606             push dword ptr [bp + 6]
5:20CD  90                   nop
5:20CE  0e                   push cs
5:20CF  e8b401               call 0x2286  ; sub_s5:2286
5:20D2  66ff76d0             push dword ptr [bp - 0x30]
5:20D6  6a00                 push 0
5:20D8  8d46ca               lea ax, [bp - 0x36]
5:20DB  16                   push ss
5:20DC  50                   push ax
5:20DD  9a763ef520           lcall 0x20f5, 0x3e76  ; sub_s2:3E76
5:20E2  c45ed4               les bx, ptr [bp - 0x2c]
5:20E5  6626ff31             push dword ptr es:[bx + di]
5:20E9  8d46ca               lea ax, [bp - 0x36]
5:20EC  16                   push ss
5:20ED  50                   push ax
5:20EE  66ff76da             push dword ptr [bp - 0x26]
5:20F2  9a80449e1f           lcall 0x1f9e, 0x4480  ; sub_s2:4480
5:20F7  ff76c8               push word ptr [bp - 0x38]
5:20FA  66ff76d0             push dword ptr [bp - 0x30]
5:20FE  c45ebc               les bx, ptr [bp - 0x44]
5:2101  268b4704             mov ax, word ptr es:[bx + 4]
5:2105  0346d2               add ax, word ptr [bp - 0x2e]
5:2108  50                   push ax
5:2109  268b4708             mov ax, word ptr es:[bx + 8]
5:210D  0346d0               add ax, word ptr [bp - 0x30]
5:2110  50                   push ax
5:2111  c45e06               les bx, ptr [bp + 6]
5:2114  6626ff7706           push dword ptr es:[bx + 6]
5:2119  9a5c4da321           lcall 0x21a3, 0x4d5c  ; sub_s3:4D5C
5:211E  c45ebc               les bx, ptr [bp - 0x44]
5:2121  837ec801             cmp word ptr [bp - 0x38], 1
5:2125  1bc0                 sbb ax, ax
5:2127  250500               and ax, 5
5:212A  051400               add ax, 0x14
5:212D  26034704             add ax, word ptr es:[bx + 4]
5:2131  0146d2               add word ptr [bp - 0x2e], ax
5:2134  ff46c8               inc word ptr [bp - 0x38]
loc_2137:
5:2137  8b46d8               mov ax, word ptr [bp - 0x28]
5:213A  3946c8               cmp word ptr [bp - 0x38], ax
5:213D  0f8c61ff             jl 0x20a2
5:2141  8d46de               lea ax, [bp - 0x22]
5:2144  16                   push ss
5:2145  50                   push ax
5:2146  666a00               push 0
5:2149  c45eda               les bx, ptr [bp - 0x26]
5:214C  06                   push es
5:214D  53                   push bx
5:214E  26c41f               les bx, ptr es:[bx]
5:2151  26ff5f04             lcall es:[bx + 4]
5:2155  666a01               push 1
5:2158  666825000001         push 0x1000025
5:215E  9ae3210000           lcall 0, 0x21e3  ; GDI.CreatePen
5:2163  8946c6               mov word ptr [bp - 0x3a], ax
5:2166  ff76de               push word ptr [bp - 0x22]
5:2169  50                   push ax
5:216A  9a85210000           lcall 0, 0x2185  ; GDI.SelectObject
5:216F  8946c4               mov word ptr [bp - 0x3c], ax
5:2172  666825000001         push 0x1000025
5:2178  9ad2210000           lcall 0, 0x21d2  ; GDI.CreateSolidBrush
5:217D  8946c2               mov word ptr [bp - 0x3e], ax
5:2180  ff76de               push word ptr [bp - 0x22]
5:2183  50                   push ax
5:2184  9ab0210000           lcall 0, 0x21b0  ; GDI.SelectObject
5:2189  8946c0               mov word ptr [bp - 0x40], ax
5:218C  ff76de               push word ptr [bp - 0x22]
5:218F  66ff7606             push dword ptr [bp + 6]
5:2193  90                   nop
5:2194  0e                   push cs
5:2195  e80401               call 0x229c  ; sub_s5:229C
5:2198  c45e06               les bx, ptr [bp + 6]
5:219B  6626ff7706           push dword ptr es:[bx + 6]
5:21A0  9af04d0e22           lcall 0x220e, 0x4df0  ; sub_s3:4DF0
5:21A5  0bc0                 or ax, ax
5:21A7  7557                 jne 0x2200
5:21A9  ff76de               push word ptr [bp - 0x22]
5:21AC  ff76c4               push word ptr [bp - 0x3c]
5:21AF  9ac1210000           lcall 0, 0x21c1  ; GDI.SelectObject
5:21B4  50                   push ax
5:21B5  9ac7210000           lcall 0, 0x21c7  ; GDI.DeleteObject
5:21BA  ff76de               push word ptr [bp - 0x22]
5:21BD  ff76c0               push word ptr [bp - 0x40]
5:21C0  9af1210000           lcall 0, 0x21f1  ; GDI.SelectObject
5:21C5  50                   push ax
5:21C6  9a48220000           lcall 0, 0x2248  ; GDI.DeleteObject
5:21CB  6668ff000000         push 0xff
5:21D1  9a8a060000           lcall 0, 0x68a  ; GDI.CreateSolidBrush
5:21D6  8946c2               mov word ptr [bp - 0x3e], ax
5:21D9  666a01               push 1
5:21DC  6668ff000000         push 0xff
5:21E2  9affff0000           lcall 0, 0xffff  ; GDI.CreatePen
5:21E7  8946c6               mov word ptr [bp - 0x3a], ax
5:21EA  ff76de               push word ptr [bp - 0x22]
5:21ED  ff76c2               push word ptr [bp - 0x3e]
5:21F0  9afc210000           lcall 0, 0x21fc  ; GDI.SelectObject
5:21F5  ff76de               push word ptr [bp - 0x22]
5:21F8  ff76c6               push word ptr [bp - 0x3a]
5:21FB  9a53220000           lcall 0, 0x2253  ; GDI.SelectObject
loc_2200:
5:2200  ff76de               push word ptr [bp - 0x22]
5:2203  c45e06               les bx, ptr [bp + 6]
5:2206  6626ff7706           push dword ptr es:[bx + 6]
5:220B  9ac84d901f           lcall 0x1f90, 0x4dc8  ; sub_s3:4DC8
5:2210  52                   push dx
5:2211  50                   push ax
5:2212  66ff7606             push dword ptr [bp + 6]
5:2216  90                   nop
5:2217  0e                   push cs
5:2218  e88101               call 0x239c  ; sub_s5:239C
5:221B  c45e06               les bx, ptr [bp + 6]
5:221E  26c45f06             les bx, ptr es:[bx + 6]
5:2222  26837f2c00           cmp word ptr es:[bx + 0x2c], 0
5:2227  740c                 je 0x2235
5:2229  ff76de               push word ptr [bp - 0x22]
5:222C  66ff7606             push dword ptr [bp + 6]
5:2230  90                   nop
5:2231  0e                   push cs
5:2232  e85302               call 0x2488  ; sub_s5:2488
loc_2235:
5:2235  ff76de               push word ptr [bp - 0x22]
5:2238  c45e06               les bx, ptr [bp + 6]
5:223B  26ff7710             push word ptr es:[bx + 0x10]
5:223F  6a00                 push 0
5:2241  9a4a150000           lcall 0, 0x154a  ; USER.SelectPalette
5:2246  50                   push ax
5:2247  9a59220000           lcall 0, 0x2259  ; GDI.DeleteObject
5:224C  ff76de               push word ptr [bp - 0x22]
5:224F  ff76c4               push word ptr [bp - 0x3c]
5:2252  9a64220000           lcall 0, 0x2264  ; GDI.SelectObject
5:2257  50                   push ax
5:2258  9a6a220000           lcall 0, 0x226a  ; GDI.DeleteObject
5:225D  ff76de               push word ptr [bp - 0x22]
5:2260  ff76c0               push word ptr [bp - 0x40]
5:2263  9affff0000           lcall 0, 0xffff  ; GDI.SelectObject
5:2268  50                   push ax
5:2269  9a57150000           lcall 0, 0x1557  ; GDI.DeleteObject
5:226E  c45e06               les bx, ptr [bp + 6]
5:2271  26ff7704             push word ptr es:[bx + 4]
5:2275  8d46e0               lea ax, [bp - 0x20]
5:2278  16                   push ss
5:2279  50                   push ax
5:227A  9a6c160000           lcall 0, 0x166c  ; USER.EndPaint
5:227F  5e                   pop si
5:2280  5f                   pop di
5:2281  c9                   leave
5:2282  ca0400               retf 4
5:2285  db 00

; ---------------- sub_s5:2286 FAR size=22 callers=1
5:2286  55                   push bp
5:2287  8bec                 mov bp, sp
5:2289  b86400               mov ax, 0x64
5:228C  2b460e               sub ax, word ptr [bp + 0xe]
5:228F  d1f8                 sar ax, 1
5:2291  c45e0a               les bx, ptr [bp + 0xa]
5:2294  268907               mov word ptr es:[bx], ax
5:2297  c9                   leave
5:2298  ca0a00               retf 0xa
5:229B  db 00

; ---------------- sub_s5:229C FAR size=256 callers=1
;   apis: GDI.LineTo, GDI.MoveTo
5:229C  c8100000             enter 0x10, 0
5:22A0  56                   push si
5:22A1  c45e06               les bx, ptr [bp + 6]
5:22A4  26c45f06             les bx, ptr es:[bx + 6]
5:22A8  268b4730             mov ax, word ptr es:[bx + 0x30]
5:22AC  8946fe               mov word ptr [bp - 2], ax
5:22AF  c45e06               les bx, ptr [bp + 6]
5:22B2  26c45f06             les bx, ptr es:[bx + 6]
5:22B6  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
5:22BB  668946fa             mov dword ptr [bp - 6], eax
5:22BF  ff760a               push word ptr [bp + 0xa]
5:22C2  c45efa               les bx, ptr [bp - 6]
5:22C5  26ff37               push word ptr es:[bx]
5:22C8  6a05                 push 5
5:22CA  9a0f230000           lcall 0, 0x230f  ; GDI.MoveTo
5:22CF  ff760a               push word ptr [bp + 0xa]
5:22D2  8b76fe               mov si, word ptr [bp - 2]
5:22D5  c1e603               shl si, 3
5:22D8  c45efa               les bx, ptr [bp - 6]
5:22DB  26ff70fc             push word ptr es:[bx + si - 4]
5:22DF  6a05                 push 5
5:22E1  9a1c230000           lcall 0, 0x231c  ; GDI.LineTo
5:22E6  c746f80000           mov word ptr [bp - 8], 0
5:22EB  eb36                 jmp 0x2323
5:22ED  db 90
loc_22EE:
5:22EE  8b5ef8               mov bx, word ptr [bp - 8]
5:22F1  c1e303               shl bx, 3
5:22F4  c476fa               les si, ptr [bp - 6]
5:22F7  03de                 add bx, si
5:22F9  268b4704             mov ax, word ptr es:[bx + 4]
5:22FD  262b07               sub ax, word ptr es:[bx]
5:2300  d1f8                 sar ax, 1
5:2302  260307               add ax, word ptr es:[bx]
5:2305  8946f4               mov word ptr [bp - 0xc], ax
5:2308  ff760a               push word ptr [bp + 0xa]
5:230B  50                   push ax
5:230C  6a05                 push 5
5:230E  9a37230000           lcall 0, 0x2337  ; GDI.MoveTo
5:2313  ff760a               push word ptr [bp + 0xa]
5:2316  ff76f4               push word ptr [bp - 0xc]
5:2319  6a0a                 push 0xa
5:231B  9a4e230000           lcall 0, 0x234e  ; GDI.LineTo
5:2320  ff46f8               inc word ptr [bp - 8]
loc_2323:
5:2323  8b46fe               mov ax, word ptr [bp - 2]
5:2326  3946f8               cmp word ptr [bp - 8], ax
5:2329  7cc3                 jl 0x22ee
5:232B  ff760a               push word ptr [bp + 0xa]
5:232E  c45efa               les bx, ptr [bp - 6]
5:2331  26ff37               push word ptr es:[bx]
5:2334  6a5f                 push 0x5f
5:2336  9a7b230000           lcall 0, 0x237b  ; GDI.MoveTo
5:233B  ff760a               push word ptr [bp + 0xa]
5:233E  8b76fe               mov si, word ptr [bp - 2]
5:2341  c1e603               shl si, 3
5:2344  c45efa               les bx, ptr [bp - 6]
5:2347  26ff70fc             push word ptr es:[bx + si - 4]
5:234B  6a5f                 push 0x5f
5:234D  9a88230000           lcall 0, 0x2388  ; GDI.LineTo
5:2352  c746f80000           mov word ptr [bp - 8], 0
5:2357  eb36                 jmp 0x238f
5:2359  db 90
loc_235A:
5:235A  8b5ef8               mov bx, word ptr [bp - 8]
5:235D  c1e303               shl bx, 3
5:2360  c476fa               les si, ptr [bp - 6]
5:2363  03de                 add bx, si
5:2365  268b4704             mov ax, word ptr es:[bx + 4]
5:2369  262b07               sub ax, word ptr es:[bx]
5:236C  d1f8                 sar ax, 1
5:236E  260307               add ax, word ptr es:[bx]
5:2371  8946f4               mov word ptr [bp - 0xc], ax
5:2374  ff760a               push word ptr [bp + 0xa]
5:2377  50                   push ax
5:2378  6a5f                 push 0x5f
5:237A  9affff0000           lcall 0, 0xffff  ; GDI.MoveTo
5:237F  ff760a               push word ptr [bp + 0xa]
5:2382  ff76f4               push word ptr [bp - 0xc]
5:2385  6a5a                 push 0x5a
5:2387  9affff0000           lcall 0, 0xffff  ; GDI.LineTo
5:238C  ff46f8               inc word ptr [bp - 8]
loc_238F:
5:238F  8b46fe               mov ax, word ptr [bp - 2]
5:2392  3946f8               cmp word ptr [bp - 8], ax
5:2395  7cc3                 jl 0x235a
5:2397  5e                   pop si
5:2398  c9                   leave
5:2399  ca0600               retf 6

; ---------------- sub_s5:239C FAR size=86 callers=1
5:239C  c80c0000             enter 0xc, 0
5:23A0  66837e0a00           cmp dword ptr [bp + 0xa], 0
5:23A5  7447                 je 0x23ee
5:23A7  c45e0a               les bx, ptr [bp + 0xa]
5:23AA  268b4704             mov ax, word ptr es:[bx + 4]
5:23AE  262b07               sub ax, word ptr es:[bx]
5:23B1  d1f8                 sar ax, 1
5:23B3  260307               add ax, word ptr es:[bx]
5:23B6  8946fe               mov word ptr [bp - 2], ax
5:23B9  50                   push ax
5:23BA  666800005700         push 0x570000
5:23C0  8d46f8               lea ax, [bp - 8]
5:23C3  16                   push ss
5:23C4  50                   push ax
5:23C5  9a543e9820           lcall 0x2098, 0x3e54  ; sub_s2:3E54
5:23CA  ff760e               push word ptr [bp + 0xe]
5:23CD  8d46f8               lea ax, [bp - 8]
5:23D0  16                   push ss
5:23D1  50                   push ax
5:23D2  66ff7606             push dword ptr [bp + 6]
5:23D6  90                   nop
5:23D7  0e                   push cs
5:23D8  e81700               call 0x23f2  ; sub_s5:23F2
5:23DB  8946f4               mov word ptr [bp - 0xc], ax
5:23DE  8956f6               mov word ptr [bp - 0xa], dx
5:23E1  52                   push dx
5:23E2  50                   push ax
5:23E3  6a03                 push 3
5:23E5  66ff7606             push dword ptr [bp + 6]
5:23E9  90                   nop
5:23EA  0e                   push cs
5:23EB  e88600               call 0x2474  ; sub_s5:2474
loc_23EE:
5:23EE  c9                   leave
5:23EF  ca0a00               retf 0xa

; ---------------- sub_s5:23F2 FAR size=130 callers=1
5:23F2  c8100000             enter 0x10, 0
5:23F6  57                   push di
5:23F7  56                   push si
5:23F8  8d46fe               lea ax, [bp - 2]
5:23FB  16                   push ss
5:23FC  50                   push ax
5:23FD  8d46fc               lea ax, [bp - 4]
5:2400  16                   push ss
5:2401  50                   push ax
5:2402  66ff760a             push dword ptr [bp + 0xa]
5:2406  9a943ec823           lcall 0x23c8, 0x3e94  ; sub_s2:3E94
5:240B  c746f87042           mov word ptr [bp - 8], 0x4270
5:2410  8c5efa               mov word ptr [bp - 6], ds
5:2413  c746f60300           mov word ptr [bp - 0xa], 3
5:2418  6a0c                 push 0xc
5:241A  9a9c176e1e           lcall 0x1e6e, 0x179c  ; operator_new@s1:179C
5:241F  83c402               add sp, 2
5:2422  8946f2               mov word ptr [bp - 0xe], ax
5:2425  8956f4               mov word ptr [bp - 0xc], dx
5:2428  c746f00000           mov word ptr [bp - 0x10], 0
5:242D  eb31                 jmp 0x2460
5:242F  db 90
loc_2430:
5:2430  8b5ef0               mov bx, word ptr [bp - 0x10]
5:2433  c1e302               shl bx, 2
5:2436  c476f8               les si, ptr [bp - 8]
5:2439  268b00               mov ax, word ptr es:[bx + si]
5:243C  0346fe               add ax, word ptr [bp - 2]
5:243F  c47ef2               les di, ptr [bp - 0xe]
5:2442  268901               mov word ptr es:[bx + di], ax
5:2445  8bc3                 mov ax, bx
5:2447  035ef8               add bx, word ptr [bp - 8]
5:244A  8e46fa               mov es, word ptr [bp - 6]
5:244D  268b4f02             mov cx, word ptr es:[bx + 2]
5:2451  034efc               add cx, word ptr [bp - 4]
5:2454  c45ef2               les bx, ptr [bp - 0xe]
5:2457  03d8                 add bx, ax
5:2459  26894f02             mov word ptr es:[bx + 2], cx
5:245D  ff46f0               inc word ptr [bp - 0x10]
loc_2460:
5:2460  8b46f6               mov ax, word ptr [bp - 0xa]
5:2463  3946f0               cmp word ptr [bp - 0x10], ax
5:2466  7cc8                 jl 0x2430
5:2468  8b46f2               mov ax, word ptr [bp - 0xe]
5:246B  8b56f4               mov dx, word ptr [bp - 0xc]
5:246E  5e                   pop si
5:246F  5f                   pop di
5:2470  c9                   leave
5:2471  ca0800               retf 8

; ---------------- sub_s5:2474 FAR size=20 callers=1
;   apis: GDI.Polygon
5:2474  55                   push bp
5:2475  8bec                 mov bp, sp
5:2477  66ff760e             push dword ptr [bp + 0xe]
5:247B  66ff760a             push dword ptr [bp + 0xa]
5:247F  9affff0000           lcall 0, 0xffff  ; GDI.Polygon
5:2484  c9                   leave
5:2485  ca0c00               retf 0xc

; ---------------- sub_s5:2488 FAR size=106 callers=1
5:2488  c80c0000             enter 0xc, 0
5:248C  c45e06               les bx, ptr [bp + 6]
5:248F  6626ff7706           push dword ptr es:[bx + 6]
5:2494  9a9e4ec724           lcall 0x24c7, 0x4e9e  ; sub_s3:4E9E
5:2499  8956fe               mov word ptr [bp - 2], dx
5:249C  0bd0                 or dx, ax
5:249E  744e                 je 0x24ee
5:24A0  8b56fe               mov dx, word ptr [bp - 2]
5:24A3  8946f8               mov word ptr [bp - 8], ax
5:24A6  8956fa               mov word ptr [bp - 6], dx
5:24A9  c746f60000           mov word ptr [bp - 0xa], 0
5:24AE  eb03                 jmp 0x24b3
loc_24B0:
5:24B0  ff46f6               inc word ptr [bp - 0xa]
loc_24B3:
5:24B3  837ef609             cmp word ptr [bp - 0xa], 9
5:24B7  7d35                 jge 0x24ee
5:24B9  ff76f6               push word ptr [bp - 0xa]
5:24BC  c45e06               les bx, ptr [bp + 6]
5:24BF  6626ff7706           push dword ptr es:[bx + 6]
5:24C4  9a204f4520           lcall 0x2045, 0x4f20  ; sub_s3:4F20
5:24C9  50                   push ax
5:24CA  66ff76f8             push dword ptr [bp - 8]
5:24CE  c45e06               les bx, ptr [bp + 6]
5:24D1  6626ff770a           push dword ptr es:[bx + 0xa]
5:24D6  90                   nop
5:24D7  0e                   push cs
5:24D8  e84ff8               call 0x1d2a  ; sub_s5:1D2A
5:24DB  66ff76f8             push dword ptr [bp - 8]
5:24DF  9aa43d1d24           lcall 0x241d, 0x3da4  ; sub_s1:3DA4
5:24E4  83c404               add sp, 4
5:24E7  40                   inc ax
5:24E8  0146f8               add word ptr [bp - 8], ax
5:24EB  ebc3                 jmp 0x24b0
5:24ED  db 90
loc_24EE:
5:24EE  c9                   leave
5:24EF  ca0600               retf 6

; ---------------- sub_s5:24F2 FAR size=50 callers=0
5:24F2  55                   push bp
5:24F3  8bec                 mov bp, sp
5:24F5  66ff7606             push dword ptr [bp + 6]
5:24F9  90                   nop
5:24FA  0e                   push cs
5:24FB  e876fa               call 0x1f74  ; sub_s5:1F74
5:24FE  f6460a01             test byte ptr [bp + 0xa], 1
5:2502  7409                 je 0x250d
5:2504  66ff7606             push dword ptr [bp + 6]
5:2508  9ace17e224           lcall 0x24e2, 0x17ce  ; operator_delete@s1:17CE
loc_250D:
5:250D  8b4606               mov ax, word ptr [bp + 6]
5:2510  8b5608               mov dx, word ptr [bp + 8]
5:2513  c9                   leave
5:2514  ca0600               retf 6
5:2517  db 90 f2 24 1e 25 b2 1f 22 25 20 20 84 1f

; ---------------- sub_s5:2524 FAR size=112 callers=1
5:2524  55                   push bp
5:2525  8bec                 mov bp, sp
5:2527  66ff760c             push dword ptr [bp + 0xc]
5:252B  ff760a               push word ptr [bp + 0xa]
5:252E  6a07                 push 7
5:2530  66ff7606             push dword ptr [bp + 6]
5:2534  90                   nop
5:2535  0e                   push cs
5:2536  e8415a               call 0x7f7a  ; sub_s5:7F7A
5:2539  c45e06               les bx, ptr [bp + 6]
5:253C  662bc0               sub eax, eax
5:253F  66268987ee00         mov dword ptr es:[bx + 0xee], eax
5:2545  66268987f200         mov dword ptr es:[bx + 0xf2], eax
5:254B  26c7070c27           mov word ptr es:[bx], 0x270c  ; 'fem36.wav'
5:2550  26c747026225         mov word ptr es:[bx + 2], 0x2562  ; SEGMENT s5:0000
5:2556  26c787e200a827       mov word ptr es:[bx + 0xe2], 0x27a8
5:255D  26c787e4001a25       mov word ptr es:[bx + 0xe4], 0x251a  ; SEGMENT s5:0000
5:2564  6a2a                 push 0x2a
5:2566  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:256B  9aba209724           lcall 0x2497, 0x20ba  ; sub_s3:20BA
5:2570  c45e06               les bx, ptr [bp + 6]
5:2573  268987f200           mov word ptr es:[bx + 0xf2], ax
5:2578  268997f400           mov word ptr es:[bx + 0xf4], dx
5:257D  268b87f200           mov ax, word ptr es:[bx + 0xf2]
5:2582  268987e600           mov word ptr es:[bx + 0xe6], ax
5:2587  268997e800           mov word ptr es:[bx + 0xe8], dx
5:258C  8bc3                 mov ax, bx
5:258E  8cc2                 mov dx, es
5:2590  c9                   leave
5:2591  ca0a00               retf 0xa

; ---------------- sub_s5:2594 FAR size=44 callers=1
5:2594  55                   push bp
5:2595  8bec                 mov bp, sp
5:2597  c45e06               les bx, ptr [bp + 6]
5:259A  26c7070c27           mov word ptr es:[bx], 0x270c  ; 'fem36.wav'
5:259F  26c74702b125         mov word ptr es:[bx + 2], 0x25b1  ; SEGMENT s5:0000
5:25A5  26c787e200a827       mov word ptr es:[bx + 0xe2], 0x27a8
5:25AC  26c787e4005425       mov word ptr es:[bx + 0xe4], 0x2554  ; SEGMENT s5:0000
5:25B3  66ff7606             push dword ptr [bp + 6]
5:25B7  90                   nop
5:25B8  0e                   push cs
5:25B9  e8d25a               call 0x808e  ; sub_s5:808E
5:25BC  c9                   leave
5:25BD  ca0400               retf 4

; ---------------- sub_s5:25C0 size=130 callers=0
5:25C0  c8080000             enter 8, 0
5:25C4  c45e06               les bx, ptr [bp + 6]
5:25C7  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
5:25CE  7412                 je 0x25e2
5:25D0  6626ffb7ee00         push dword ptr es:[bx + 0xee]
5:25D6  26c49fee00           les bx, ptr es:[bx + 0xee]
5:25DB  26c41f               les bx, ptr es:[bx]
5:25DE  26ff5f08             lcall es:[bx + 8]
loc_25E2:
5:25E2  c45e06               les bx, ptr [bp + 6]
5:25E5  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
5:25EB  7551                 jne 0x263e
5:25ED  26c787ea000100       mov word ptr es:[bx + 0xea], 1
5:25F4  689800               push 0x98
5:25F7  9a9c170b25           lcall 0x250b, 0x179c  ; operator_new@s1:179C
5:25FC  83c402               add sp, 2
5:25FF  8946f8               mov word ptr [bp - 8], ax
5:2602  8956fa               mov word ptr [bp - 6], dx
5:2605  0bd0                 or dx, ax
5:2607  7421                 je 0x262a
5:2609  c45e06               les bx, ptr [bp + 6]
5:260C  26ff87cc00           inc word ptr es:[bx + 0xcc]
5:2611  06                   push es
5:2612  53                   push bx
5:2613  26ffb7cc00           push word ptr es:[bx + 0xcc]
5:2618  66ff76f8             push dword ptr [bp - 8]
5:261C  90                   nop
5:261D  0e                   push cs
5:261E  e817f1               call 0x1738  ; sub_s5:1738
5:2621  8946fc               mov word ptr [bp - 4], ax
5:2624  8956fe               mov word ptr [bp - 2], dx
5:2627  eb09                 jmp 0x2632
5:2629  db 90
loc_262A:
5:262A  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_2632:
5:2632  c45efc               les bx, ptr [bp - 4]
5:2635  06                   push es
5:2636  53                   push bx
5:2637  26c41f               les bx, ptr es:[bx]
5:263A  26ff5f08             lcall es:[bx + 8]
loc_263E:
5:263E  c9                   leave
5:263F  ca0400               retf 4

; ---------------- sub_s5:2642 size=100 callers=0
5:2642  c8040000             enter 4, 0
5:2646  66ff7606             push dword ptr [bp + 6]
5:264A  9a60970924           lcall 0x2409, 0x9760  ; sub_s2:9760
5:264F  c45e06               les bx, ptr [bp + 6]
5:2652  26ff7708             push word ptr es:[bx + 8]
5:2656  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:265C  9ab04dd01e           lcall 0x1ed0, 0x4db0  ; sub_s4:4DB0
5:2661  6a18                 push 0x18
5:2663  9a9c17fa25           lcall 0x25fa, 0x179c  ; operator_new@s1:179C
5:2668  83c402               add sp, 2
5:266B  8956fe               mov word ptr [bp - 2], dx
5:266E  0bd0                 or dx, ax
5:2670  7422                 je 0x2694
5:2672  c45e06               les bx, ptr [bp + 6]
5:2675  26ff7708             push word ptr es:[bx + 8]
5:2679  ff76fe               push word ptr [bp - 2]
5:267C  50                   push ax
5:267D  90                   nop
5:267E  0e                   push cs
5:267F  e82e01               call 0x27b0  ; sub_s5:27B0
5:2682  c45e06               les bx, ptr [bp + 6]
5:2685  268987ee00           mov word ptr es:[bx + 0xee], ax
5:268A  268997f000           mov word ptr es:[bx + 0xf0], dx
5:268F  c9                   leave
5:2690  ca0400               retf 4
5:2693  db 90
loc_2694:
5:2694  c45e06               les bx, ptr [bp + 6]
5:2697  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
5:26A1  c9                   leave
5:26A2  ca0400               retf 4
5:26A5  db 00

; ---------------- sub_s5:26A6 FAR size=50 callers=0
5:26A6  c8080000             enter 8, 0
5:26AA  c45e06               les bx, ptr [bp + 6]
5:26AD  268b87ee00           mov ax, word ptr es:[bx + 0xee]
5:26B2  268b97f000           mov dx, word ptr es:[bx + 0xf0]
5:26B7  8bda                 mov bx, dx
5:26B9  0bd8                 or bx, ax
5:26BB  740e                 je 0x26cb
5:26BD  6a01                 push 1
5:26BF  52                   push dx
5:26C0  50                   push ax
5:26C1  8ec2                 mov es, dx
5:26C3  8bd8                 mov bx, ax
5:26C5  26c41f               les bx, ptr es:[bx]
5:26C8  26ff1f               lcall es:[bx]
loc_26CB:
5:26CB  66ff7606             push dword ptr [bp + 6]
5:26CF  9a8e624d26           lcall 0x264d, 0x628e  ; sub_s2:628E
5:26D4  c9                   leave
5:26D5  ca0400               retf 4

; ---------------- sub_s5:26D8 FAR size=14 callers=0
5:26D8  8bdc                 mov bx, sp
5:26DA  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
5:26E0  e90300               jmp 0x26e6
5:26E3  db 90 90 00

; ---------------- sub_s5:26E6 FAR size=202 callers=0
5:26E6  55                   push bp
5:26E7  8bec                 mov bp, sp
5:26E9  66ff7606             push dword ptr [bp + 6]
5:26ED  90                   nop
5:26EE  0e                   push cs
5:26EF  e8a2fe               call 0x2594  ; sub_s5:2594
5:26F2  f6460a01             test byte ptr [bp + 0xa], 1
5:26F6  7409                 je 0x2701
5:26F8  66ff7606             push dword ptr [bp + 6]
5:26FC  9ace176626           lcall 0x2666, 0x17ce  ; operator_delete@s1:17CE
loc_2701:
5:2701  8b4606               mov ax, word ptr [bp + 6]
5:2704  8b5608               mov dx, word ptr [bp + 8]
5:2707  c9                   leave
5:2708  ca0600               retf 6
5:270B  db 90 e6 26 16 27 ea 68 1a 27 42 26 42 27 c6 68 1e
5:271B  db 27 40 96 22 27 64 96 26 27 2c 37 2a 27 f2 97 2e
5:272B  db 27 3c 37 32 27 40 37 36 27 44 37 3a 27 48 37 3e
5:273B  db 27 4c 37 46 27 c0 25 4a 27 98 96 4e 27 50 82 6e
5:274B  db 27 54 37 52 27 60 9c 56 27 58 37 5a 27 24 63 5e
5:275B  db 27 4e 9c 62 27 62 37 66 27 4a 9c 6a 27 66 37 72
5:276B  db 27 06 81 9a 27 4a 6a 76 27 2e 6b 7a 27 02 6b 7e
5:277B  db 27 7a 37 82 27 52 9c 86 27 56 9c 8a 27 16 9c 8e
5:278B  db 27 30 9c 92 27 86 9c 96 27 c4 9c a2 27 c0 81 9e
5:279B  db 27 a6 26 a6 27 28 63 d2 26 28 81 a3 25 d8 26 0e
5:27AB  db 27 10 3a 12 27

; ---------------- sub_s5:27B0 FAR size=136 callers=1
5:27B0  c80c0000             enter 0xc, 0
5:27B4  66ff7608             push dword ptr [bp + 8]
5:27B8  ff7606               push word ptr [bp + 6]
5:27BB  90                   nop
5:27BC  0e                   push cs
5:27BD  e85c6a               call 0x921c  ; sub_s5:921C
5:27C0  c45e06               les bx, ptr [bp + 6]
5:27C3  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:27CC  26c7078e28           mov word ptr es:[bx], 0x288e
5:27D1  26c74702aa27         mov word ptr es:[bx + 2], 0x27aa  ; SEGMENT s5:0000
5:27D7  6a2a                 push 0x2a
5:27D9  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:27DE  9aba206e25           lcall 0x256e, 0x20ba  ; sub_s3:20BA
5:27E3  c45e06               les bx, ptr [bp + 6]
5:27E6  26894714             mov word ptr es:[bx + 0x14], ax
5:27EA  26895716             mov word ptr es:[bx + 0x16], dx
5:27EE  268b4714             mov ax, word ptr es:[bx + 0x14]
5:27F2  26894706             mov word ptr es:[bx + 6], ax
5:27F6  26895708             mov word ptr es:[bx + 8], dx
5:27FA  c45e06               les bx, ptr [bp + 6]
5:27FD  26c45f14             les bx, ptr es:[bx + 0x14]
5:2801  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:2806  668946fc             mov dword ptr [bp - 4], eax
5:280A  668b4606             mov eax, dword ptr [bp + 6]
5:280E  050a00               add ax, 0xa
5:2811  6650                 push eax
5:2813  c45efc               les bx, ptr [bp - 4]
5:2816  06                   push es
5:2817  53                   push bx
5:2818  26c41f               les bx, ptr es:[bx]
5:281B  26ff5f08             lcall es:[bx + 8]
5:281F  c45e06               les bx, ptr [bp + 6]
5:2822  26894712             mov word ptr es:[bx + 0x12], ax
5:2826  06                   push es
5:2827  53                   push bx
5:2828  90                   nop
5:2829  0e                   push cs
5:282A  e8376b               call 0x9364  ; sub_s5:9364
5:282D  8b4606               mov ax, word ptr [bp + 6]
5:2830  8b5608               mov dx, word ptr [bp + 8]
5:2833  c9                   leave
5:2834  ca0600               retf 6
5:2837  db 00

; ---------------- sub_s5:2838 FAR size=48 callers=1
5:2838  55                   push bp
5:2839  8bec                 mov bp, sp
5:283B  c45e06               les bx, ptr [bp + 6]
5:283E  26c7078e28           mov word ptr es:[bx], 0x288e
5:2843  26c74702d527         mov word ptr es:[bx + 2], 0x27d5  ; SEGMENT s5:0000
5:2849  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
5:284F  740a                 je 0x285b
5:2851  6626ff7714           push dword ptr es:[bx + 0x14]
5:2856  9ada1de127           lcall 0x27e1, 0x1dda  ; sub_s3:1DDA
loc_285B:
5:285B  66ff7606             push dword ptr [bp + 6]
5:285F  90                   nop
5:2860  0e                   push cs
5:2861  e8606a               call 0x92c4  ; sub_s5:92C4
5:2864  c9                   leave
5:2865  ca0400               retf 4

; ---------------- sub_s5:2868 FAR size=50 callers=0
5:2868  55                   push bp
5:2869  8bec                 mov bp, sp
5:286B  66ff7606             push dword ptr [bp + 6]
5:286F  90                   nop
5:2870  0e                   push cs
5:2871  e8c4ff               call 0x2838  ; sub_s5:2838
5:2874  f6460a01             test byte ptr [bp + 0xa], 1
5:2878  7409                 je 0x2883
5:287A  66ff7606             push dword ptr [bp + 6]
5:287E  9ace17ff26           lcall 0x26ff, 0x17ce  ; operator_delete@s1:17CE
loc_2883:
5:2883  8b4606               mov ax, word ptr [bp + 6]
5:2886  8b5608               mov dx, word ptr [bp + 8]
5:2889  c9                   leave
5:288A  ca0600               retf 6
5:288D  db 90 68 28 98 28 10 3a ae 27 12 93 47 28

; ---------------- sub_s5:289A FAR size=98 callers=1
5:289A  55                   push bp
5:289B  8bec                 mov bp, sp
5:289D  66ff760c             push dword ptr [bp + 0xc]
5:28A1  ff760a               push word ptr [bp + 0xa]
5:28A4  1e                   push ds
5:28A5  687c42               push 0x427c  ; 'SCPOPMENU'
5:28A8  66ff7606             push dword ptr [bp + 6]
5:28AC  90                   nop
5:28AD  0e                   push cs
5:28AE  e85d50               call 0x790e  ; sub_s5:790E
5:28B1  c45e06               les bx, ptr [bp + 6]
5:28B4  662bc0               sub eax, eax
5:28B7  66268987f200         mov dword ptr es:[bx + 0xf2], eax
5:28BD  66268987f600         mov dword ptr es:[bx + 0xf6], eax
5:28C3  268987fa00           mov word ptr es:[bx + 0xfa], ax
5:28C8  268987fc00           mov word ptr es:[bx + 0xfc], ax
5:28CD  26c7074a2e           mov word ptr es:[bx], 0x2e4a
5:28D2  26c747029028         mov word ptr es:[bx + 2], 0x2890  ; SEGMENT s5:0000
5:28D8  1e                   push ds
5:28D9  688642               push 0x4286  ; 'VrMode'
5:28DC  8d475b               lea ax, [bx + 0x5b]
5:28DF  06                   push es
5:28E0  50                   push ax
5:28E1  9a3e3d8128           lcall 0x2881, 0x3d3e  ; _fstrcpy@s1:3D3E
5:28E6  c45e06               les bx, ptr [bp + 6]
5:28E9  6626c787ac000000c044 mov dword ptr es:[bx + 0xac], 0x44c00000
5:28F3  8bc3                 mov ax, bx
5:28F5  8cc2                 mov dx, es
5:28F7  c9                   leave
5:28F8  ca0a00               retf 0xa
5:28FB  db 00

; ---------------- sub_s5:28FC FAR size=30 callers=1
5:28FC  55                   push bp
5:28FD  8bec                 mov bp, sp
5:28FF  c45e06               les bx, ptr [bp + 6]
5:2902  26c7074a2e           mov word ptr es:[bx], 0x2e4a
5:2907  26c74702d628         mov word ptr es:[bx + 2], 0x28d6  ; SEGMENT s5:0000
5:290D  66ff7606             push dword ptr [bp + 6]
5:2911  90                   nop
5:2912  0e                   push cs
5:2913  e84650               call 0x795c  ; sub_s5:795C
5:2916  c9                   leave
5:2917  ca0400               retf 4

; ---------------- sub_s5:291A FAR size=28 callers=1
;   apis: USER.PostMessage
5:291A  55                   push bp
5:291B  8bec                 mov bp, sp
5:291D  c45e06               les bx, ptr [bp + 6]
5:2920  26ff7708             push word ptr es:[bx + 8]
5:2924  666800001000         push 0x100000
5:292A  666a00               push 0
5:292D  9a791d0000           lcall 0, 0x1d79  ; USER.PostMessage
5:2932  c9                   leave
5:2933  ca0400               retf 4

; ---------------- sub_s5:2936 FAR size=20 callers=0
5:2936  55                   push bp
5:2937  8bec                 mov bp, sp
5:2939  66ff7608             push dword ptr [bp + 8]
5:293D  ff7606               push word ptr [bp + 6]
5:2940  90                   nop
5:2941  0e                   push cs
5:2942  e86950               call 0x79ae  ; sub_s5:79AE
5:2945  c9                   leave
5:2946  ca0600               retf 6
5:2949  db 00

; ---------------- sub_s5:294A FAR size=72 callers=1
5:294A  55                   push bp
5:294B  8bec                 mov bp, sp
5:294D  8b460e               mov ax, word ptr [bp + 0xe]
5:2950  c45e06               les bx, ptr [bp + 6]
5:2953  268987fc00           mov word ptr es:[bx + 0xfc], ax
5:2958  50                   push ax
5:2959  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:295E  9aba205928           lcall 0x2859, 0x20ba  ; sub_s3:20BA
5:2963  c45e06               les bx, ptr [bp + 6]
5:2966  268987f200           mov word ptr es:[bx + 0xf2], ax
5:296B  268997f400           mov word ptr es:[bx + 0xf4], dx
5:2970  268b87f200           mov ax, word ptr es:[bx + 0xf2]
5:2975  268987e000           mov word ptr es:[bx + 0xe0], ax
5:297A  268997e200           mov word ptr es:[bx + 0xe2], dx
5:297F  66ff760a             push dword ptr [bp + 0xa]
5:2983  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2989  9a02095f26           lcall 0x265f, 0x902  ; sub_s4:0902
5:298E  c9                   leave
5:298F  ca0a00               retf 0xa

; ---------------- sub_s5:2992 size=70 callers=0
;   apis: GDI.UnrealizeObject, USER.GetDC, USER.RealizePalette
5:2992  c8080000             enter 8, 0
5:2996  837e0a00             cmp word ptr [bp + 0xa], 0
5:299A  7438                 je 0x29d4
5:299C  c45e06               les bx, ptr [bp + 6]
5:299F  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:29A5  9a500a8c29           lcall 0x298c, 0xa50  ; sub_s4:0A50
5:29AA  8946fc               mov word ptr [bp - 4], ax
5:29AD  8956fe               mov word ptr [bp - 2], dx
5:29B0  52                   push dx
5:29B1  c45efc               les bx, ptr [bp - 4]
5:29B4  50                   push ax
5:29B5  26c41f               les bx, ptr es:[bx]
5:29B8  26ff5f18             lcall es:[bx + 0x18]
5:29BC  50                   push ax
5:29BD  9a730e0000           lcall 0, 0xe73  ; GDI.UnrealizeObject
5:29C2  c45e06               les bx, ptr [bp + 6]
5:29C5  26ff7708             push word ptr es:[bx + 8]
5:29C9  9a9b140000           lcall 0, 0x149b  ; USER.GetDC
5:29CE  50                   push ax
5:29CF  9a850e0000           lcall 0, 0xe85  ; USER.RealizePalette
loc_29D4:
5:29D4  c9                   leave
5:29D5  ca0600               retf 6

; ---------------- sub_s5:29D8 size=110 callers=0
;   apis: USER.SendMessage
5:29D8  c8080000             enter 8, 0
5:29DC  66ff760c             push dword ptr [bp + 0xc]
5:29E0  66ff7608             push dword ptr [bp + 8]
5:29E4  ff7606               push word ptr [bp + 6]
5:29E7  90                   nop
5:29E8  0e                   push cs
5:29E9  e81050               call 0x79fc  ; sub_s5:79FC
5:29EC  8946fc               mov word ptr [bp - 4], ax
5:29EF  8956fe               mov word ptr [bp - 2], dx
5:29F2  6a29                 push 0x29
5:29F4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:29F9  9aba206129           lcall 0x2961, 0x20ba  ; sub_s3:20BA
5:29FE  837e0e00             cmp word ptr [bp + 0xe], 0
5:2A02  7426                 je 0x2a2a
5:2A04  c45e06               les bx, ptr [bp + 6]
5:2A07  26ffb7fc00           push word ptr es:[bx + 0xfc]
5:2A0C  6a00                 push 0
5:2A0E  52                   push dx
5:2A0F  50                   push ax
5:2A10  9a0e27392a           lcall 0x2a39, 0x270e  ; sub_s4:270E
5:2A15  ff369603             push word ptr [0x396]
5:2A19  666869001101         push 0x1110069
5:2A1F  666a00               push 0
5:2A22  9aa5090000           lcall 0, 0x9a5  ; USER.SendMessage
5:2A27  eb12                 jmp 0x2a3b
5:2A29  db 90
loc_2A2A:
5:2A2A  c45e06               les bx, ptr [bp + 6]
5:2A2D  26ffb7fc00           push word ptr es:[bx + 0xfc]
5:2A32  6a01                 push 1
5:2A34  52                   push dx
5:2A35  50                   push ax
5:2A36  9a0e27a829           lcall 0x29a8, 0x270e  ; sub_s4:270E
loc_2A3B:
5:2A3B  8b46fc               mov ax, word ptr [bp - 4]
5:2A3E  8b56fe               mov dx, word ptr [bp - 2]
5:2A41  c9                   leave
5:2A42  ca0a00               retf 0xa
5:2A45  db 00

; ---------------- sub_s5:2A46 FAR size=36 callers=0
5:2A46  55                   push bp
5:2A47  8bec                 mov bp, sp
5:2A49  6a01                 push 1
5:2A4B  c45e06               les bx, ptr [bp + 6]
5:2A4E  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2A54  9ae80a132a           lcall 0x2a13, 0xae8  ; sub_s4:0AE8
5:2A59  66ff7608             push dword ptr [bp + 8]
5:2A5D  ff7606               push word ptr [bp + 6]
5:2A60  9ac6689428           lcall 0x2894, 0x68c6  ; sub_s2:68C6
5:2A65  c9                   leave
5:2A66  ca0600               retf 6
5:2A69  db 00

; ---------------- sub_s5:2A6A FAR size=42 callers=0
5:2A6A  55                   push bp
5:2A6B  8bec                 mov bp, sp
5:2A6D  66ff7606             push dword ptr [bp + 6]
5:2A71  90                   nop
5:2A72  0e                   push cs
5:2A73  e8da4f               call 0x7a50  ; sub_s5:7A50
5:2A76  6a00                 push 0
5:2A78  c45e06               les bx, ptr [bp + 6]
5:2A7B  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2A81  9ae80a572a           lcall 0x2a57, 0xae8  ; sub_s4:0AE8
5:2A86  66ff7606             push dword ptr [bp + 6]
5:2A8A  90                   nop
5:2A8B  0e                   push cs
5:2A8C  e8f901               call 0x2c88  ; sub_s5:2C88
5:2A8F  c9                   leave
5:2A90  ca0400               retf 4
5:2A93  db 00

; ---------------- sub_s5:2A94 FAR size=26 callers=2
5:2A94  55                   push bp
5:2A95  8bec                 mov bp, sp
5:2A97  66ff760a             push dword ptr [bp + 0xa]
5:2A9B  c45e06               les bx, ptr [bp + 6]
5:2A9E  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2AA4  9a6216842a           lcall 0x2a84, 0x1662  ; sub_s4:1662
5:2AA9  c9                   leave
5:2AAA  ca0800               retf 8
5:2AAD  db 00

; ---------------- sub_s5:2AAE FAR size=54 callers=0
;   apis: USER.BringWindowToTop
5:2AAE  c8040000             enter 4, 0
5:2AB2  666a00               push 0
5:2AB5  66ff7606             push dword ptr [bp + 6]
5:2AB9  66ff7606             push dword ptr [bp + 6]
5:2ABD  9a0e3e632a           lcall 0x2a63, 0x3e0e  ; sub_s2:3E0E
5:2AC2  c45e06               les bx, ptr [bp + 6]
5:2AC5  26ff7708             push word ptr es:[bx + 8]
5:2AC9  9affff0000           lcall 0, 0xffff  ; USER.BringWindowToTop
5:2ACE  66ff760a             push dword ptr [bp + 0xa]
5:2AD2  c45e06               les bx, ptr [bp + 6]
5:2AD5  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2ADB  9a9e16a72a           lcall 0x2aa7, 0x169e  ; sub_s4:169E
5:2AE0  c9                   leave
5:2AE1  ca0a00               retf 0xa

; ---------------- sub_s5:2AE4 size=326 callers=0
;   apis: USER.InvalidateRect, USER.PostMessage, USER.WinHelp
5:2AE4  c80a0000             enter 0xa, 0
5:2AE8  8b460a               mov ax, word ptr [bp + 0xa]
5:2AEB  3d2901               cmp ax, 0x129
5:2AEE  0f843301             je 0x2c25
5:2AF2  0f871e01             ja 0x2c14
5:2AF6  3dfb00               cmp ax, 0xfb
5:2AF9  7471                 je 0x2b6c
5:2AFB  0f872601             ja 0x2c25
5:2AFF  2c6f                 sub al, 0x6f
5:2B01  0f84ad00             je 0x2bb2
5:2B05  2c03                 sub al, 3
5:2B07  742f                 je 0x2b38
5:2B09  2c03                 sub al, 3
5:2B0B  0f851601             jne 0x2c25
5:2B0F  c45e06               les bx, ptr [bp + 6]
5:2B12  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2B18  9a760aac2b           lcall 0x2bac, 0xa76  ; sub_s4:0A76
5:2B1D  c45e06               les bx, ptr [bp + 6]
5:2B20  26c49ff600           les bx, ptr es:[bx + 0xf6]
5:2B25  26ff7704             push word ptr es:[bx + 4]
5:2B29  666a00               push 0
5:2B2C  6a00                 push 0
5:2B2E  9a0c200000           lcall 0, 0x200c  ; USER.InvalidateRect
5:2B33  c9                   leave
5:2B34  ca0600               retf 6
5:2B37  db 90
loc_2B38:
5:2B38  668b4606             mov eax, dword ptr [bp + 6]
5:2B3C  050a00               add ax, 0xa
5:2B3F  6650                 push eax
5:2B41  6a30                 push 0x30
5:2B43  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:2B48  9aba20522b           lcall 0x2b52, 0x20ba  ; sub_s3:20BA
5:2B4D  52                   push dx
5:2B4E  50                   push ax
5:2B4F  9a7037762b           lcall 0x2b76, 0x3770  ; sub_s3:3770
5:2B54  6a03                 push 3
5:2B56  c45e06               les bx, ptr [bp + 6]
5:2B59  26ff7708             push word ptr es:[bx + 8]
5:2B5D  66ff367c5b           push dword ptr [0x5b7c]
5:2B62  9a40af250f           lcall 0xf25, 0xaf40  ; sub_s8:AF40
5:2B67  c9                   leave
5:2B68  ca0600               retf 6
5:2B6B  db 90
loc_2B6C:
5:2B6C  6a30                 push 0x30
5:2B6E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:2B73  9aba20832b           lcall 0x2b83, 0x20ba  ; sub_s3:20BA
5:2B78  8946f6               mov word ptr [bp - 0xa], ax
5:2B7B  8956f8               mov word ptr [bp - 8], dx
5:2B7E  52                   push dx
5:2B7F  50                   push ax
5:2B80  9a5e379c2b           lcall 0x2b9c, 0x375e  ; sub_s3:375E
5:2B85  52                   push dx
5:2B86  50                   push ax
5:2B87  6a01                 push 1
5:2B89  c45e06               les bx, ptr [bp + 6]
5:2B8C  06                   push es
5:2B8D  53                   push bx
5:2B8E  26c41f               les bx, ptr es:[bx]
5:2B91  26ff5f14             lcall es:[bx + 0x14]
5:2B95  66ff76f6             push dword ptr [bp - 0xa]
5:2B99  9a5e37bd2b           lcall 0x2bbd, 0x375e  ; sub_s3:375E
5:2B9E  52                   push dx
5:2B9F  50                   push ax
5:2BA0  c45e06               les bx, ptr [bp + 6]
5:2BA3  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2BA9  9a1c18de2a           lcall 0x2ade, 0x181c  ; sub_s4:181C
5:2BAE  c9                   leave
5:2BAF  ca0600               retf 6
loc_2BB2:
5:2BB2  68f801               push 0x1f8
5:2BB5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:2BBA  9a0a83fc29           lcall 0x29fc, 0x830a  ; sub_s3:830A
5:2BBF  c45e06               les bx, ptr [bp + 6]
5:2BC2  26ff7708             push word ptr es:[bx + 8]
5:2BC6  52                   push dx
5:2BC7  50                   push ax
5:2BC8  666800000100         push 0x10000
5:2BCE  6a2a                 push 0x2a
5:2BD0  9a910f0000           lcall 0, 0xf91  ; USER.WinHelp
5:2BD5  c9                   leave
5:2BD6  ca0600               retf 6
5:2BD9  db 90
loc_2BDA:
5:2BDA  c45e06               les bx, ptr [bp + 6]
5:2BDD  26ff7708             push word ptr es:[bx + 8]
5:2BE1  666812f01201         push 0x112f012
5:2BE7  eb1e                 jmp 0x2c07
5:2BE9  db 90
loc_2BEA:
5:2BEA  c45e06               les bx, ptr [bp + 6]
5:2BED  26ff7708             push word ptr es:[bx + 8]
5:2BF1  666820f01201         push 0x112f020
5:2BF7  eb0e                 jmp 0x2c07
5:2BF9  db 90
loc_2BFA:
5:2BFA  c45e06               les bx, ptr [bp + 6]
5:2BFD  26ff7708             push word ptr es:[bx + 8]
5:2C01  666860f01201         push 0x112f060
loc_2C07:
5:2C07  666a00               push 0
5:2C0A  9a2e290000           lcall 0, 0x292e  ; USER.PostMessage
5:2C0F  c9                   leave
5:2C10  ca0600               retf 6
5:2C13  db 90
loc_2C14:
5:2C14  2d2a01               sub ax, 0x12a
5:2C17  74c1                 je 0x2bda
5:2C19  48                   dec ax
5:2C1A  7409                 je 0x2c25
5:2C1C  48                   dec ax
5:2C1D  74cb                 je 0x2bea
5:2C1F  48                   dec ax
5:2C20  7403                 je 0x2c25
5:2C22  48                   dec ax
5:2C23  74d5                 je 0x2bfa
loc_2C25:
5:2C25  c9                   leave
5:2C26  ca0600               retf 6
5:2C29  db 00

; ---------------- sub_s5:2C2A FAR size=72 callers=0
;   apis: USER.EnableMenuItem
5:2C2A  c8060000             enter 6, 0
5:2C2E  8b460c               mov ax, word ptr [bp + 0xc]
5:2C31  eb35                 jmp 0x2c68
5:2C33  db 90
loc_2C34:
5:2C34  ff760e               push word ptr [bp + 0xe]
5:2C37  666800040300         push 0x30400
5:2C3D  9a532c0000           lcall 0, 0x2c53  ; USER.EnableMenuItem
5:2C42  833e603901           cmp word ptr [0x3960], 1
5:2C47  7e13                 jle 0x2c5c
5:2C49  ff760e               push word ptr [bp + 0xe]
5:2C4C  666800040500         push 0x50400
loc_2C52:
5:2C52  9a12100000           lcall 0, 0x1012  ; USER.EnableMenuItem
5:2C57  c9                   leave
5:2C58  ca0a00               retf 0xa
5:2C5B  db 90
loc_2C5C:
5:2C5C  ff760e               push word ptr [bp + 0xe]
5:2C5F  666801040500         push 0x50401
5:2C65  ebeb                 jmp 0x2c52
5:2C67  db 90
loc_2C68:
5:2C68  0bc0                 or ax, ax
5:2C6A  74c8                 je 0x2c34
5:2C6C  48                   dec ax
5:2C6D  c9                   leave
5:2C6E  ca0a00               retf 0xa
5:2C71  db 00

; ---------------- sub_s5:2C72 FAR size=22 callers=0
5:2C72  55                   push bp
5:2C73  8bec                 mov bp, sp
5:2C75  c45e06               les bx, ptr [bp + 6]
5:2C78  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:2C7E  90                   nop
5:2C7F  0e                   push cs
5:2C80  e83b04               call 0x30be  ; sub_s5:30BE
5:2C83  c9                   leave
5:2C84  ca0400               retf 4
5:2C87  db 00

; ---------------- sub_s5:2C88 FAR size=104 callers=1
;   apis: USER.DestroyIcon
5:2C88  c8080000             enter 8, 0
5:2C8C  56                   push si
5:2C8D  c45e06               les bx, ptr [bp + 6]
5:2C90  26ffb7c200           push word ptr es:[bx + 0xc2]
5:2C95  9a46100000           lcall 0, 0x1046  ; USER.DestroyIcon
5:2C9A  33c0                 xor ax, ax
5:2C9C  c45e06               les bx, ptr [bp + 6]
5:2C9F  268987c200           mov word ptr es:[bx + 0xc2], ax
5:2CA4  26894708             mov word ptr es:[bx + 8], ax
5:2CA8  268b87f600           mov ax, word ptr es:[bx + 0xf6]
5:2CAD  268b97f800           mov dx, word ptr es:[bx + 0xf8]
5:2CB2  8bda                 mov bx, dx
5:2CB4  0bd0                 or dx, ax
5:2CB6  740e                 je 0x2cc6
5:2CB8  6a01                 push 1
5:2CBA  53                   push bx
5:2CBB  50                   push ax
5:2CBC  8ec3                 mov es, bx
5:2CBE  8bf0                 mov si, ax
5:2CC0  26c41c               les bx, ptr es:[si]
5:2CC3  26ff1f               lcall es:[bx]
loc_2CC6:
5:2CC6  c45e06               les bx, ptr [bp + 6]
5:2CC9  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
5:2CD3  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2CD9  9ada1d4b2b           lcall 0x2b4b, 0x1dda  ; sub_s3:1DDA
5:2CDE  c45e06               les bx, ptr [bp + 6]
5:2CE1  6626c787f20000000000 mov dword ptr es:[bx + 0xf2], 0
5:2CEB  5e                   pop si
5:2CEC  c9                   leave
5:2CED  ca0400               retf 4

; ---------------- sub_s5:2CF0 size=308 callers=0
;   apis: USER.LoadIcon, USER.MoveWindow, USER.UpdateWindow
5:2CF0  c82c0000             enter 0x2c, 0
5:2CF4  56                   push si
5:2CF5  66ff7606             push dword ptr [bp + 6]
5:2CF9  9a6097112e           lcall 0x2e11, 0x9760  ; sub_s2:9760
5:2CFE  c45e06               les bx, ptr [bp + 6]
5:2D01  26ffb7fc00           push word ptr es:[bx + 0xfc]
5:2D06  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:2D0B  9aba20dc2c           lcall 0x2cdc, 0x20ba  ; sub_s3:20BA
5:2D10  c45e06               les bx, ptr [bp + 6]
5:2D13  268987f200           mov word ptr es:[bx + 0xf2], ax
5:2D18  268997f400           mov word ptr es:[bx + 0xf4], dx
5:2D1D  268b87f200           mov ax, word ptr es:[bx + 0xf2]
5:2D22  268987e000           mov word ptr es:[bx + 0xe0], ax
5:2D27  268997e200           mov word ptr es:[bx + 0xe2], dx
5:2D2C  ff368c03             push word ptr [0x38c]
5:2D30  1e                   push ds
5:2D31  688d42               push 0x428d  ; 'SITEICON'
5:2D34  9a7f110000           lcall 0, 0x117f  ; USER.LoadIcon
5:2D39  c45e06               les bx, ptr [bp + 6]
5:2D3C  268987c200           mov word ptr es:[bx + 0xc2], ax
5:2D41  50                   push ax
5:2D42  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2D48  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:2D4D  26c41f               les bx, ptr es:[bx]
5:2D50  26ff5f30             lcall es:[bx + 0x30]
5:2D54  6a22                 push 0x22
5:2D56  9a9c17e428           lcall 0x28e4, 0x179c  ; operator_new@s1:179C
5:2D5B  83c402               add sp, 2
5:2D5E  8956fe               mov word ptr [bp - 2], dx
5:2D61  0bd0                 or dx, ax
5:2D63  741d                 je 0x2d82
5:2D65  66ff7606             push dword ptr [bp + 6]
5:2D69  ff76fe               push word ptr [bp - 2]
5:2D6C  50                   push ax
5:2D6D  90                   nop
5:2D6E  0e                   push cs
5:2D6F  e86c01               call 0x2ede  ; sub_s5:2EDE
5:2D72  c45e06               les bx, ptr [bp + 6]
5:2D75  268987f600           mov word ptr es:[bx + 0xf6], ax
5:2D7A  268997f800           mov word ptr es:[bx + 0xf8], dx
5:2D7F  eb0e                 jmp 0x2d8f
5:2D81  db 90
loc_2D82:
5:2D82  c45e06               les bx, ptr [bp + 6]
5:2D85  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
loc_2D8F:
5:2D8F  c45e06               les bx, ptr [bp + 6]
5:2D92  66268b87f600         mov eax, dword ptr es:[bx + 0xf6]
5:2D98  66268987e800         mov dword ptr es:[bx + 0xe8], eax
5:2D9E  06                   push es
5:2D9F  53                   push bx
5:2DA0  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2DA6  9ac00ab72d           lcall 0x2db7, 0xac0  ; sub_s4:0AC0
5:2DAB  c45e06               les bx, ptr [bp + 6]
5:2DAE  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2DB4  9a080b1b2b           lcall 0x2b1b, 0xb08  ; sub_s4:0B08
5:2DB9  52                   push dx
5:2DBA  50                   push ax
5:2DBB  6a00                 push 0
5:2DBD  c45e06               les bx, ptr [bp + 6]
5:2DC0  06                   push es
5:2DC1  53                   push bx
5:2DC2  26c41f               les bx, ptr es:[bx]
5:2DC5  26ff5f14             lcall es:[bx + 0x14]
5:2DC9  c45e06               les bx, ptr [bp + 6]
5:2DCC  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:2DD2  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:2DD7  26c41f               les bx, ptr es:[bx]
5:2DDA  26ff5f10             lcall es:[bx + 0x10]
5:2DDE  8bd8                 mov bx, ax
5:2DE0  8ec2                 mov es, dx
5:2DE2  268b4f04             mov cx, word ptr es:[bx + 4]
5:2DE6  268b4706             mov ax, word ptr es:[bx + 6]
5:2DEA  268b5702             mov dx, word ptr es:[bx + 2]
5:2DEE  268b37               mov si, word ptr es:[bx]
5:2DF1  c45e06               les bx, ptr [bp + 6]
5:2DF4  26ff7708             push word ptr es:[bx + 8]
5:2DF8  56                   push si
5:2DF9  52                   push dx
5:2DFA  51                   push cx
5:2DFB  50                   push ax
5:2DFC  6a01                 push 1
5:2DFE  9a081a0000           lcall 0, 0x1a08  ; USER.MoveWindow
5:2E03  666a00               push 0
5:2E06  66ff7606             push dword ptr [bp + 6]
5:2E0A  66ff7606             push dword ptr [bp + 6]
5:2E0E  9a0e3ec02a           lcall 0x2ac0, 0x3e0e  ; sub_s2:3E0E
5:2E13  c45e06               les bx, ptr [bp + 6]
5:2E16  26ff7708             push word ptr es:[bx + 8]
5:2E1A  9a89120000           lcall 0, 0x1289  ; USER.UpdateWindow
5:2E1F  5e                   pop si
5:2E20  c9                   leave
5:2E21  ca0400               retf 4

; ---------------- sub_s5:2E24 FAR size=186 callers=0
5:2E24  55                   push bp
5:2E25  8bec                 mov bp, sp
5:2E27  66ff7606             push dword ptr [bp + 6]
5:2E2B  90                   nop
5:2E2C  0e                   push cs
5:2E2D  e8ccfa               call 0x28fc  ; sub_s5:28FC
5:2E30  f6460a01             test byte ptr [bp + 0xa], 1
5:2E34  7409                 je 0x2e3f
5:2E36  66ff7606             push dword ptr [bp + 6]
5:2E3A  9ace17592d           lcall 0x2d59, 0x17ce  ; operator_delete@s1:17CE
loc_2E3F:
5:2E3F  8b4606               mov ax, word ptr [bp + 6]
5:2E42  8b5608               mov dx, word ptr [bp + 8]
5:2E45  c9                   leave
5:2E46  ca0600               retf 6
5:2E49  db 90 24 2e 54 2e ea 68 5c 2e f0 2c 58 2e 46 2a 60
5:2E59  db 2e 40 96 64 2e b4 79 80 2e 2c 37 68 2e f2 97 6c
5:2E69  db 2e 3c 37 70 2e 40 37 74 2e 44 37 78 2e 48 37 7c
5:2E79  db 2e 4c 37 84 2e 72 2c 88 2e 98 96 90 2e 6a 2a 8c
5:2E89  db 2e e4 2a 94 2e 60 9c 9c 2e 36 29 98 2e 2a 2c a8
5:2E99  db 2e 4e 9c a0 2e 62 37 a4 2e 4a 9c b0 2e ae 2a ac
5:2EA9  db 2e d2 7a c8 2e 4a 6a b4 2e 2e 6b b8 2e 02 6b bc
5:2EB9  db 2e 7a 37 c0 2e 52 9c c4 2e 56 9c d0 2e e4 79 cc
5:2EC9  db 2e d8 29 dc 2e 86 9c d4 2e c4 9c d8 2e e0 9c fc
5:2ED9  db 2c 92 29 0b 29

; ---------------- sub_s5:2EDE FAR size=268 callers=1
;   apis: GDI.CreateDC, GDI.CreatePen, GDI.GetStockObject, GDI.SelectObject
5:2EDE  c8140000             enter 0x14, 0
5:2EE2  66ff760a             push dword ptr [bp + 0xa]
5:2EE6  66ff7606             push dword ptr [bp + 6]
5:2EEA  90                   nop
5:2EEB  0e                   push cs
5:2EEC  e82b4d               call 0x7c1a  ; sub_s5:7C1A
5:2EEF  c45e06               les bx, ptr [bp + 6]
5:2EF2  662bc0               sub eax, eax
5:2EF5  6626894714           mov dword ptr es:[bx + 0x14], eax
5:2EFA  26894718             mov word ptr es:[bx + 0x18], ax
5:2EFE  2689471a             mov word ptr es:[bx + 0x1a], ax
5:2F02  2689471c             mov word ptr es:[bx + 0x1c], ax
5:2F06  2689471e             mov word ptr es:[bx + 0x1e], ax
5:2F0A  26894720             mov word ptr es:[bx + 0x20], ax
5:2F0E  26c7073c36           mov word ptr es:[bx], 0x363c
5:2F13  26c747024c2e         mov word ptr es:[bx + 2], 0x2e4c  ; SEGMENT s5:0000
5:2F19  c45e0a               les bx, ptr [bp + 0xa]
5:2F1C  26ffb7fc00           push word ptr es:[bx + 0xfc]
5:2F21  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:2F26  9aba200e2d           lcall 0x2d0e, 0x20ba  ; sub_s3:20BA
5:2F2B  c45e06               les bx, ptr [bp + 6]
5:2F2E  26894714             mov word ptr es:[bx + 0x14], ax
5:2F32  26895716             mov word ptr es:[bx + 0x16], dx
5:2F36  66ff7606             push dword ptr [bp + 6]
5:2F3A  6a00                 push 0
5:2F3C  c45e06               les bx, ptr [bp + 6]
5:2F3F  6626ff7714           push dword ptr es:[bx + 0x14]
5:2F44  26c45f14             les bx, ptr es:[bx + 0x14]
5:2F48  26c41f               les bx, ptr es:[bx]
5:2F4B  26ff5f04             lcall es:[bx + 4]
5:2F4F  1e                   push ds
5:2F50  68c242               push 0x42c2  ; 'dib'
5:2F53  666a00               push 0
5:2F56  666a00               push 0
5:2F59  c45e06               les bx, ptr [bp + 6]
5:2F5C  6626ff7714           push dword ptr es:[bx + 0x14]
5:2F61  9a500aa92d           lcall 0x2da9, 0xa50  ; sub_s4:0A50
5:2F66  8946fc               mov word ptr [bp - 4], ax
5:2F69  8956fe               mov word ptr [bp - 2], dx
5:2F6C  52                   push dx
5:2F6D  50                   push ax
5:2F6E  9a7247502e           lcall 0x2e50, 0x4772  ; sub_s2:4772
5:2F73  52                   push dx
5:2F74  50                   push ax
5:2F75  9affff0000           lcall 0, 0xffff  ; GDI.CreateDC
5:2F7A  c45e06               les bx, ptr [bp + 6]
5:2F7D  26894718             mov word ptr es:[bx + 0x18], ax
5:2F81  8d4718               lea ax, [bx + 0x18]
5:2F84  06                   push es
5:2F85  50                   push ax
5:2F86  c45efc               les bx, ptr [bp - 4]
5:2F89  06                   push es
5:2F8A  53                   push bx
5:2F8B  26c41f               les bx, ptr es:[bx]
5:2F8E  26ff5f08             lcall es:[bx + 8]
5:2F92  c45e06               les bx, ptr [bp + 6]
5:2F95  26894720             mov word ptr es:[bx + 0x20], ax
5:2F99  c45e06               les bx, ptr [bp + 6]
5:2F9C  26c45f14             les bx, ptr es:[bx + 0x14]
5:2FA0  66268b4764           mov eax, dword ptr es:[bx + 0x64]
5:2FA5  666a01               push 1
5:2FA8  6650                 push eax
5:2FAA  9a5f210000           lcall 0, 0x215f  ; GDI.CreatePen
5:2FAF  c45e06               les bx, ptr [bp + 6]
5:2FB2  2689471a             mov word ptr es:[bx + 0x1a], ax
5:2FB6  26ff7718             push word ptr es:[bx + 0x18]
5:2FBA  50                   push ax
5:2FBB  9ad72f0000           lcall 0, 0x2fd7  ; GDI.SelectObject
5:2FC0  c45e06               les bx, ptr [bp + 6]
5:2FC3  2689471c             mov word ptr es:[bx + 0x1c], ax
5:2FC7  6a05                 push 5
5:2FC9  9a9e160000           lcall 0, 0x169e  ; GDI.GetStockObject
5:2FCE  c45e06               les bx, ptr [bp + 6]
5:2FD1  26ff7718             push word ptr es:[bx + 0x18]
5:2FD5  50                   push ax
5:2FD6  9a6b210000           lcall 0, 0x216b  ; GDI.SelectObject
5:2FDB  c45e06               les bx, ptr [bp + 6]
5:2FDE  2689471e             mov word ptr es:[bx + 0x1e], ax
5:2FE2  8bc3                 mov ax, bx
5:2FE4  8cc2                 mov dx, es
5:2FE6  c9                   leave
5:2FE7  ca0800               retf 8

; ---------------- sub_s5:2FEA FAR size=150 callers=1
;   apis: GDI.DeleteDC, GDI.DeleteObject, GDI.SelectObject, USER.SelectPalette
5:2FEA  c8100000             enter 0x10, 0
5:2FEE  c45e06               les bx, ptr [bp + 6]
5:2FF1  26c7073c36           mov word ptr es:[bx], 0x363c
5:2FF6  26c74702172f         mov word ptr es:[bx + 2], 0x2f17  ; SEGMENT s5:0000
5:2FFC  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
5:3002  740c                 je 0x3010
5:3004  06                   push es
5:3005  53                   push bx
5:3006  6626ff7714           push dword ptr es:[bx + 0x14]
5:300B  9aa61e292f           lcall 0x2f29, 0x1ea6  ; sub_s3:1EA6
loc_3010:
5:3010  c45e06               les bx, ptr [bp + 6]
5:3013  26ff7718             push word ptr es:[bx + 0x18]
5:3017  26ff771c             push word ptr es:[bx + 0x1c]
5:301B  9a2c300000           lcall 0, 0x302c  ; GDI.SelectObject
5:3020  c45e06               les bx, ptr [bp + 6]
5:3023  26ff7718             push word ptr es:[bx + 0x18]
5:3027  26ff771e             push word ptr es:[bx + 0x1e]
5:302B  9abc2f0000           lcall 0, 0x2fbc  ; GDI.SelectObject
5:3030  c45e06               les bx, ptr [bp + 6]
5:3033  26ff771a             push word ptr es:[bx + 0x1a]
5:3037  9a50300000           lcall 0, 0x3050  ; GDI.DeleteObject
5:303C  c45e06               les bx, ptr [bp + 6]
5:303F  26ff7718             push word ptr es:[bx + 0x18]
5:3043  26ff7720             push word ptr es:[bx + 0x20]
5:3047  6a00                 push 0
5:3049  9a42220000           lcall 0, 0x2242  ; USER.SelectPalette
5:304E  50                   push ax
5:304F  9ab6210000           lcall 0, 0x21b6  ; GDI.DeleteObject
5:3054  c45e06               les bx, ptr [bp + 6]
5:3057  26ff7718             push word ptr es:[bx + 0x18]
5:305B  9affff0000           lcall 0, 0xffff  ; GDI.DeleteDC
5:3060  c45e06               les bx, ptr [bp + 6]
5:3063  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:3068  26c747027a30         mov word ptr es:[bx + 2], 0x307a  ; SEGMENT s2:0000
5:306E  c45e06               les bx, ptr [bp + 6]
5:3071  26c7079a38           mov word ptr es:[bx], 0x389a
5:3076  26c74702712f         mov word ptr es:[bx + 2], 0x2f71  ; SEGMENT s2:0000
5:307C  c9                   leave
5:307D  ca0400               retf 4

; ---------------- sub_s5:3080 FAR size=62 callers=0
;   apis: USER.InvalidateRect
5:3080  55                   push bp
5:3081  8bec                 mov bp, sp
5:3083  8b460a               mov ax, word ptr [bp + 0xa]
5:3086  eb26                 jmp 0x30ae
loc_3088:
5:3088  c45e06               les bx, ptr [bp + 6]
5:308B  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:3094  c9                   leave
5:3095  ca0600               retf 6
loc_3098:
5:3098  c45e06               les bx, ptr [bp + 6]
5:309B  26ff7704             push word ptr es:[bx + 4]
5:309F  666a00               push 0
5:30A2  6a00                 push 0
5:30A4  9a2f2b0000           lcall 0, 0x2b2f  ; USER.InvalidateRect
5:30A9  c9                   leave
5:30AA  ca0600               retf 6
5:30AD  db 90
loc_30AE:
5:30AE  48                   dec ax
5:30AF  74d7                 je 0x3088
5:30B1  2d0300               sub ax, 3
5:30B4  74e2                 je 0x3098
5:30B6  48                   dec ax
5:30B7  48                   dec ax
5:30B8  74de                 je 0x3098
5:30BA  c9                   leave
5:30BB  ca0600               retf 6

; ---------------- sub_s5:30BE FAR size=336 callers=1
;   apis: GDI.GetStockObject, USER.BeginPaint, USER.DrawIcon, USER.EndPaint, USER.FillRect, USER.GetClientRect, USER.IsIconic
5:30BE  c83a0000             enter 0x3a, 0
5:30C2  c45e06               les bx, ptr [bp + 6]
5:30C5  26ff7704             push word ptr es:[bx + 4]
5:30C9  8d46e0               lea ax, [bp - 0x20]
5:30CC  16                   push ss
5:30CD  50                   push ax
5:30CE  9a33200000           lcall 0, 0x2033  ; USER.BeginPaint
5:30D3  8946de               mov word ptr [bp - 0x22], ax
5:30D6  c45e06               les bx, ptr [bp + 6]
5:30D9  26ff7704             push word ptr es:[bx + 4]
5:30DD  9afe150000           lcall 0, 0x15fe  ; USER.IsIconic
5:30E2  0bc0                 or ax, ax
5:30E4  0f848600             je 0x316e
5:30E8  833e100000           cmp word ptr [0x10], 0
5:30ED  0f850801             jne 0x31f9
5:30F1  c45e06               les bx, ptr [bp + 6]
5:30F4  6626ff7714           push dword ptr es:[bx + 0x14]
5:30F9  26c45f14             les bx, ptr es:[bx + 0x14]
5:30FD  26c41f               les bx, ptr es:[bx]
5:3100  26ff5f2c             lcall es:[bx + 0x2c]
5:3104  8946dc               mov word ptr [bp - 0x24], ax
5:3107  0bc0                 or ax, ax
5:3109  0f84ec00             je 0x31f9
5:310D  6a04                 push 4
5:310F  9aca2f0000           lcall 0, 0x2fca  ; GDI.GetStockObject
5:3114  8946da               mov word ptr [bp - 0x26], ax
5:3117  c45e06               les bx, ptr [bp + 6]
5:311A  26ff7704             push word ptr es:[bx + 4]
5:311E  8d46d2               lea ax, [bp - 0x2e]
5:3121  16                   push ss
5:3122  50                   push ax
5:3123  9a84180000           lcall 0, 0x1884  ; USER.GetClientRect
5:3128  33c0                 xor ax, ax
5:312A  8946c6               mov word ptr [bp - 0x3a], ax
5:312D  8946c8               mov word ptr [bp - 0x38], ax
5:3130  8b46d6               mov ax, word ptr [bp - 0x2a]
5:3133  2b46d2               sub ax, word ptr [bp - 0x2e]
5:3136  48                   dec ax
5:3137  8946d0               mov word ptr [bp - 0x30], ax
5:313A  8946ca               mov word ptr [bp - 0x36], ax
5:313D  8b46d8               mov ax, word ptr [bp - 0x28]
5:3140  2b46d4               sub ax, word ptr [bp - 0x2c]
5:3143  48                   dec ax
5:3144  8946ce               mov word ptr [bp - 0x32], ax
5:3147  8946cc               mov word ptr [bp - 0x34], ax
5:314A  ff76de               push word ptr [bp - 0x22]
5:314D  8d46c6               lea ax, [bp - 0x3a]
5:3150  16                   push ss
5:3151  50                   push ax
5:3152  ff76da               push word ptr [bp - 0x26]
5:3155  9af0160000           lcall 0, 0x16f0  ; USER.FillRect
5:315A  ff76de               push word ptr [bp - 0x22]
5:315D  666802000200         push 0x20002
5:3163  ff76dc               push word ptr [bp - 0x24]
5:3166  9a01170000           lcall 0, 0x1701  ; USER.DrawIcon
5:316B  e98b00               jmp 0x31f9
loc_316E:
5:316E  c45e06               les bx, ptr [bp + 6]
5:3171  6626ff7714           push dword ptr es:[bx + 0x14]
5:3176  9a500a642f           lcall 0x2f64, 0xa50  ; sub_s4:0A50
5:317B  8946c6               mov word ptr [bp - 0x3a], ax
5:317E  8956c8               mov word ptr [bp - 0x38], dx
5:3181  8d46de               lea ax, [bp - 0x22]
5:3184  16                   push ss
5:3185  50                   push ax
5:3186  c45ec6               les bx, ptr [bp - 0x3a]
5:3189  06                   push es
5:318A  53                   push bx
5:318B  26c41f               les bx, ptr es:[bx]
5:318E  26ff5f08             lcall es:[bx + 8]
5:3192  c45e06               les bx, ptr [bp + 6]
5:3195  26c45f14             les bx, ptr es:[bx + 0x14]
5:3199  2683bf840001         cmp word ptr es:[bx + 0x84], 1
5:319F  750c                 jne 0x31ad
5:31A1  ff76de               push word ptr [bp - 0x22]
5:31A4  66ff7606             push dword ptr [bp + 6]
5:31A8  90                   nop
5:31A9  0e                   push cs
5:31AA  e86100               call 0x320e  ; sub_s5:320E
loc_31AD:
5:31AD  8d46de               lea ax, [bp - 0x22]
5:31B0  16                   push ss
5:31B1  50                   push ax
5:31B2  666a00               push 0
5:31B5  c45ec6               les bx, ptr [bp - 0x3a]
5:31B8  06                   push es
5:31B9  53                   push bx
5:31BA  26c41f               les bx, ptr es:[bx]
5:31BD  26ff5f04             lcall es:[bx + 4]
5:31C1  c45e06               les bx, ptr [bp + 6]
5:31C4  26c45f14             les bx, ptr es:[bx + 0x14]
5:31C8  2683bf840001         cmp word ptr es:[bx + 0x84], 1
5:31CE  740c                 je 0x31dc
5:31D0  ff76de               push word ptr [bp - 0x22]
5:31D3  66ff7606             push dword ptr [bp + 6]
5:31D7  90                   nop
5:31D8  0e                   push cs
5:31D9  e83200               call 0x320e  ; sub_s5:320E
loc_31DC:
5:31DC  ff76de               push word ptr [bp - 0x22]
5:31DF  66ff7606             push dword ptr [bp + 6]
5:31E3  90                   nop
5:31E4  0e                   push cs
5:31E5  e8a002               call 0x3488  ; sub_s5:3488
5:31E8  8d46de               lea ax, [bp - 0x22]
5:31EB  16                   push ss
5:31EC  50                   push ax
5:31ED  c45ec6               les bx, ptr [bp - 0x3a]
5:31F0  06                   push es
5:31F1  53                   push bx
5:31F2  26c41f               les bx, ptr es:[bx]
5:31F5  26ff5f0c             lcall es:[bx + 0xc]
loc_31F9:
5:31F9  c45e06               les bx, ptr [bp + 6]
5:31FC  26ff7704             push word ptr es:[bx + 4]
5:3200  8d46e0               lea ax, [bp - 0x20]
5:3203  16                   push ss
5:3204  50                   push ax
5:3205  9a7b220000           lcall 0, 0x227b  ; USER.EndPaint
5:320A  c9                   leave
5:320B  ca0400               retf 4

; ---------------- sub_s5:320E FAR size=434 callers=1
;   apis: GDI.CreateDC, GDI.DeleteDC, GDI.DeleteObject, USER.SelectPalette
5:320E  c82a0000             enter 0x2a, 0
5:3212  8b460a               mov ax, word ptr [bp + 0xa]
5:3215  8946fe               mov word ptr [bp - 2], ax
5:3218  c45e06               les bx, ptr [bp + 6]
5:321B  26c45f14             les bx, ptr es:[bx + 0x14]
5:321F  2683bf840001         cmp word ptr es:[bx + 0x84], 1
5:3225  7549                 jne 0x3270
5:3227  c45e06               les bx, ptr [bp + 6]
5:322A  26c45f14             les bx, ptr es:[bx + 0x14]
5:322E  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:3233  268b5726             mov dx, word ptr es:[bx + 0x26]
5:3237  668946f0             mov dword ptr [bp - 0x10], eax
5:323B  1e                   push ds
5:323C  68c642               push 0x42c6  ; 'dib'
5:323F  666a00               push 0
5:3242  666a00               push 0
5:3245  52                   push dx
5:3246  50                   push ax
5:3247  9a72476c30           lcall 0x306c, 0x4772  ; sub_s2:4772
5:324C  8946ec               mov word ptr [bp - 0x14], ax
5:324F  8956ee               mov word ptr [bp - 0x12], dx
5:3252  52                   push dx
5:3253  50                   push ax
5:3254  9a762f0000           lcall 0, 0x2f76  ; GDI.CreateDC
5:3259  8946fe               mov word ptr [bp - 2], ax
5:325C  8d46fe               lea ax, [bp - 2]
5:325F  16                   push ss
5:3260  50                   push ax
5:3261  c45ef0               les bx, ptr [bp - 0x10]
5:3264  06                   push es
5:3265  53                   push bx
5:3266  26c41f               les bx, ptr es:[bx]
5:3269  26ff5f08             lcall es:[bx + 8]
5:326D  8946fc               mov word ptr [bp - 4], ax
loc_3270:
5:3270  8d46f8               lea ax, [bp - 8]
5:3273  16                   push ss
5:3274  50                   push ax
5:3275  8d46f6               lea ax, [bp - 0xa]
5:3278  16                   push ss
5:3279  50                   push ax
5:327A  c45e06               les bx, ptr [bp + 6]
5:327D  6626ff7714           push dword ptr es:[bx + 0x14]
5:3282  9a9a0dbd32           lcall 0x32bd, 0xd9a  ; sub_s4:0D9A
5:3287  ff76fe               push word ptr [bp - 2]
5:328A  6a01                 push 1
5:328C  66ff76f8             push dword ptr [bp - 8]
5:3290  ff76f6               push word ptr [bp - 0xa]
5:3293  c45e06               les bx, ptr [bp + 6]
5:3296  26c45f14             les bx, ptr es:[bx + 0x14]
5:329A  6626ff776c           push dword ptr es:[bx + 0x6c]
5:329F  66ff7606             push dword ptr [bp + 6]
5:32A3  90                   nop
5:32A4  0e                   push cs
5:32A5  e81801               call 0x33c0  ; sub_s5:33C0
5:32A8  8d46f8               lea ax, [bp - 8]
5:32AB  16                   push ss
5:32AC  50                   push ax
5:32AD  8d46f6               lea ax, [bp - 0xa]
5:32B0  16                   push ss
5:32B1  50                   push ax
5:32B2  c45e06               les bx, ptr [bp + 6]
5:32B5  6626ff7714           push dword ptr es:[bx + 0x14]
5:32BA  9a5410f532           lcall 0x32f5, 0x1054  ; sub_s4:1054
5:32BF  ff76fe               push word ptr [bp - 2]
5:32C2  6a02                 push 2
5:32C4  66ff76f8             push dword ptr [bp - 8]
5:32C8  ff76f6               push word ptr [bp - 0xa]
5:32CB  c45e06               les bx, ptr [bp + 6]
5:32CE  26c45f14             les bx, ptr es:[bx + 0x14]
5:32D2  6626ff7774           push dword ptr es:[bx + 0x74]
5:32D7  66ff7606             push dword ptr [bp + 6]
5:32DB  90                   nop
5:32DC  0e                   push cs
5:32DD  e8e000               call 0x33c0  ; sub_s5:33C0
5:32E0  8d46f8               lea ax, [bp - 8]
5:32E3  16                   push ss
5:32E4  50                   push ax
5:32E5  8d46f6               lea ax, [bp - 0xa]
5:32E8  16                   push ss
5:32E9  50                   push ax
5:32EA  c45e06               les bx, ptr [bp + 6]
5:32ED  6626ff7714           push dword ptr es:[bx + 0x14]
5:32F2  9a20132d33           lcall 0x332d, 0x1320  ; sub_s4:1320
5:32F7  ff76fe               push word ptr [bp - 2]
5:32FA  6a01                 push 1
5:32FC  66ff76f8             push dword ptr [bp - 8]
5:3300  ff76f6               push word ptr [bp - 0xa]
5:3303  c45e06               les bx, ptr [bp + 6]
5:3306  26c45f14             les bx, ptr es:[bx + 0x14]
5:330A  6626ff7768           push dword ptr es:[bx + 0x68]
5:330F  66ff7606             push dword ptr [bp + 6]
5:3313  90                   nop
5:3314  0e                   push cs
5:3315  e8a800               call 0x33c0  ; sub_s5:33C0
5:3318  8d46f8               lea ax, [bp - 8]
5:331B  16                   push ss
5:331C  50                   push ax
5:331D  8d46f6               lea ax, [bp - 0xa]
5:3320  16                   push ss
5:3321  50                   push ax
5:3322  c45e06               les bx, ptr [bp + 6]
5:3325  6626ff7714           push dword ptr es:[bx + 0x14]
5:332A  9af6156b33           lcall 0x336b, 0x15f6  ; sub_s4:15F6
5:332F  837ef600             cmp word ptr [bp - 0xa], 0
5:3333  7421                 je 0x3356
5:3335  ff76fe               push word ptr [bp - 2]
5:3338  6a01                 push 1
5:333A  66ff76f8             push dword ptr [bp - 8]
5:333E  ff76f6               push word ptr [bp - 0xa]
5:3341  c45e06               les bx, ptr [bp + 6]
5:3344  26c45f14             les bx, ptr es:[bx + 0x14]
5:3348  6626ff7770           push dword ptr es:[bx + 0x70]
5:334D  66ff7606             push dword ptr [bp + 6]
5:3351  90                   nop
5:3352  0e                   push cs
5:3353  e86a00               call 0x33c0  ; sub_s5:33C0
loc_3356:
5:3356  8d46f8               lea ax, [bp - 8]
5:3359  16                   push ss
5:335A  50                   push ax
5:335B  8d46f6               lea ax, [bp - 0xa]
5:335E  16                   push ss
5:335F  50                   push ax
5:3360  c45e06               les bx, ptr [bp + 6]
5:3363  6626ff7714           push dword ptr es:[bx + 0x14]
5:3368  9a8c107931           lcall 0x3179, 0x108c  ; sub_s4:108C
5:336D  837ef600             cmp word ptr [bp - 0xa], 0
5:3371  7421                 je 0x3394
5:3373  ff76fe               push word ptr [bp - 2]
5:3376  6a00                 push 0
5:3378  66ff76f8             push dword ptr [bp - 8]
5:337C  ff76f6               push word ptr [bp - 0xa]
5:337F  c45e06               les bx, ptr [bp + 6]
5:3382  26c45f14             les bx, ptr es:[bx + 0x14]
5:3386  6626ff7778           push dword ptr es:[bx + 0x78]
5:338B  66ff7606             push dword ptr [bp + 6]
5:338F  90                   nop
5:3390  0e                   push cs
5:3391  e82c00               call 0x33c0  ; sub_s5:33C0
loc_3394:
5:3394  c45e06               les bx, ptr [bp + 6]
5:3397  26c45f14             les bx, ptr es:[bx + 0x14]
5:339B  2683bf840001         cmp word ptr es:[bx + 0x84], 1
5:33A1  7519                 jne 0x33bc
5:33A3  66ff76fc             push dword ptr [bp - 4]
5:33A7  6a00                 push 0
5:33A9  9a4a300000           lcall 0, 0x304a  ; USER.SelectPalette
5:33AE  50                   push ax
5:33AF  9a38300000           lcall 0, 0x3038  ; GDI.DeleteObject
5:33B4  ff76fe               push word ptr [bp - 2]
5:33B7  9a5c300000           lcall 0, 0x305c  ; GDI.DeleteDC
loc_33BC:
5:33BC  c9                   leave
5:33BD  ca0600               retf 6

; ---------------- sub_s5:33C0 FAR size=200 callers=1
;   apis: GDI.CreatePen, GDI.CreateSolidBrush, GDI.DeleteObject, GDI.SelectObject
5:33C0  c81a0000             enter 0x1a, 0
5:33C4  837e0e00             cmp word ptr [bp + 0xe], 0
5:33C8  0f84b800             je 0x3484
5:33CC  ff7616               push word ptr [bp + 0x16]
5:33CF  666a01               push 1
5:33D2  66ff760a             push dword ptr [bp + 0xa]
5:33D6  9aab2f0000           lcall 0, 0x2fab  ; GDI.CreatePen
5:33DB  8946fe               mov word ptr [bp - 2], ax
5:33DE  50                   push ax
5:33DF  9af5330000           lcall 0, 0x33f5  ; GDI.SelectObject
5:33E4  8946fc               mov word ptr [bp - 4], ax
5:33E7  ff7616               push word ptr [bp + 0x16]
5:33EA  66ff760a             push dword ptr [bp + 0xa]
5:33EE  9a79210000           lcall 0, 0x2179  ; GDI.CreateSolidBrush
5:33F3  50                   push ax
5:33F4  9a67340000           lcall 0, 0x3467  ; GDI.SelectObject
5:33F9  8946f8               mov word ptr [bp - 8], ax
5:33FC  668b4610             mov eax, dword ptr [bp + 0x10]
5:3400  668946f4             mov dword ptr [bp - 0xc], eax
5:3404  662bc0               sub eax, eax
5:3407  668946f0             mov dword ptr [bp - 0x10], eax
5:340B  8946ee               mov word ptr [bp - 0x12], ax
5:340E  eb22                 jmp 0x3432
loc_3410:
5:3410  b80300               mov ax, 3
loc_3413:
5:3413  50                   push ax
5:3414  66ff7606             push dword ptr [bp + 6]
5:3418  90                   nop
5:3419  0e                   push cs
5:341A  e8e501               call 0x3602  ; sub_s5:3602
5:341D  668b46f0             mov eax, dword ptr [bp - 0x10]
5:3421  6650                 push eax
5:3423  9ace173d2e           lcall 0x2e3d, 0x17ce  ; operator_delete@s1:17CE
5:3428  83c404               add sp, 4
5:342B  ff46ee               inc word ptr [bp - 0x12]
5:342E  8346f406             add word ptr [bp - 0xc], 6
loc_3432:
5:3432  8b460e               mov ax, word ptr [bp + 0xe]
5:3435  3946ee               cmp word ptr [bp - 0x12], ax
5:3438  7d26                 jge 0x3460
5:343A  ff7616               push word ptr [bp + 0x16]
5:343D  66ff76f4             push dword ptr [bp - 0xc]
5:3441  ff7614               push word ptr [bp + 0x14]
5:3444  66ff7606             push dword ptr [bp + 6]
5:3448  90                   nop
5:3449  0e                   push cs
5:344A  e8f300               call 0x3540  ; sub_s5:3540
5:344D  8946f0               mov word ptr [bp - 0x10], ax
5:3450  8956f2               mov word ptr [bp - 0xe], dx
5:3453  52                   push dx
5:3454  50                   push ax
5:3455  837e1400             cmp word ptr [bp + 0x14], 0
5:3459  7eb5                 jle 0x3410
5:345B  b80400               mov ax, 4
5:345E  ebb3                 jmp 0x3413
loc_3460:
5:3460  ff7616               push word ptr [bp + 0x16]
5:3463  ff76f8               push word ptr [bp - 8]
5:3466  9a78340000           lcall 0, 0x3478  ; GDI.SelectObject
5:346B  50                   push ax
5:346C  9a80340000           lcall 0, 0x3480  ; GDI.DeleteObject
5:3471  ff7616               push word ptr [bp + 0x16]
5:3474  ff76fc               push word ptr [bp - 4]
5:3477  9a1c300000           lcall 0, 0x301c  ; GDI.SelectObject
5:347C  ff76fe               push word ptr [bp - 2]
5:347F  9ab0330000           lcall 0, 0x33b0  ; GDI.DeleteObject
loc_3484:
5:3484  c9                   leave
5:3485  ca1200               retf 0x12

; ---------------- sub_s5:3488 FAR size=184 callers=1
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.GetStockObject, GDI.Rectangle, GDI.SelectObject
5:3488  c81c0000             enter 0x1c, 0
5:348C  c45e06               les bx, ptr [bp + 6]
5:348F  66268b4714           mov eax, dword ptr es:[bx + 0x14]
5:3494  053600               add ax, 0x36
5:3497  668946fc             mov dword ptr [bp - 4], eax
5:349B  8d46fa               lea ax, [bp - 6]
5:349E  16                   push ss
5:349F  50                   push ax
5:34A0  8d4ef8               lea cx, [bp - 8]
5:34A3  16                   push ss
5:34A4  51                   push cx
5:34A5  66ff76fc             push dword ptr [bp - 4]
5:34A9  9a943e4a32           lcall 0x324a, 0x3e94  ; sub_s2:3E94
5:34AE  836efa03             sub word ptr [bp - 6], 3
5:34B2  7905                 jns 0x34b9
5:34B4  c746fa0000           mov word ptr [bp - 6], 0
loc_34B9:
5:34B9  836ef803             sub word ptr [bp - 8], 3
5:34BD  7905                 jns 0x34c4
5:34BF  c746f80000           mov word ptr [bp - 8], 0
loc_34C4:
5:34C4  c45e06               les bx, ptr [bp + 6]
5:34C7  26c45f14             les bx, ptr es:[bx + 0x14]
5:34CB  66268b4764           mov eax, dword ptr es:[bx + 0x64]
5:34D0  668946f4             mov dword ptr [bp - 0xc], eax
5:34D4  ff760a               push word ptr [bp + 0xa]
5:34D7  666a01               push 1
5:34DA  6650                 push eax
5:34DC  9ad7330000           lcall 0, 0x33d7  ; GDI.CreatePen
5:34E1  8946f2               mov word ptr [bp - 0xe], ax
5:34E4  50                   push ax
5:34E5  9afc340000           lcall 0, 0x34fc  ; GDI.SelectObject
5:34EA  8946f0               mov word ptr [bp - 0x10], ax
5:34ED  ff760a               push word ptr [bp + 0xa]
5:34F0  6a05                 push 5
5:34F2  9a10310000           lcall 0, 0x3110  ; GDI.GetStockObject
5:34F7  8946ee               mov word ptr [bp - 0x12], ax
5:34FA  50                   push ax
5:34FB  9a24350000           lcall 0, 0x3524  ; GDI.SelectObject
5:3500  8946ec               mov word ptr [bp - 0x14], ax
5:3503  ff760a               push word ptr [bp + 0xa]
5:3506  66ff76f8             push dword ptr [bp - 8]
5:350A  8b46fa               mov ax, word ptr [bp - 6]
5:350D  050600               add ax, 6
5:3510  50                   push ax
5:3511  8b46f8               mov ax, word ptr [bp - 8]
5:3514  050600               add ax, 6
5:3517  50                   push ax
5:3518  9affff0000           lcall 0, 0xffff  ; GDI.Rectangle
5:351D  ff760a               push word ptr [bp + 0xa]
5:3520  ff76f0               push word ptr [bp - 0x10]
5:3523  9a2f350000           lcall 0, 0x352f  ; GDI.SelectObject
5:3528  ff760a               push word ptr [bp + 0xa]
5:352B  ff76ec               push word ptr [bp - 0x14]
5:352E  9ae0330000           lcall 0, 0x33e0  ; GDI.SelectObject
5:3533  ff76f2               push word ptr [bp - 0xe]
5:3536  9a6d340000           lcall 0, 0x346d  ; GDI.DeleteObject
5:353B  c9                   leave
5:353C  ca0600               retf 6
5:353F  db 00

; ---------------- sub_s5:3540 FAR size=194 callers=1
5:3540  c8100000             enter 0x10, 0
5:3544  57                   push di
5:3545  56                   push si
5:3546  8d46fe               lea ax, [bp - 2]
5:3549  16                   push ss
5:354A  50                   push ax
5:354B  8d46fc               lea ax, [bp - 4]
5:354E  16                   push ss
5:354F  50                   push ax
5:3550  66ff760c             push dword ptr [bp + 0xc]
5:3554  9a943eac34           lcall 0x34ac, 0x3e94  ; sub_s2:3E94
5:3559  662bc0               sub eax, eax
5:355C  668946f8             mov dword ptr [bp - 8], eax
5:3560  8946f6               mov word ptr [bp - 0xa], ax
5:3563  8b460a               mov ax, word ptr [bp + 0xa]
5:3566  0bc0                 or ax, ax
5:3568  743a                 je 0x35a4
5:356A  48                   dec ax
5:356B  740d                 je 0x357a
5:356D  48                   dec ax
5:356E  7440                 je 0x35b0
5:3570  33c0                 xor ax, ax
5:3572  99                   cdq
5:3573  5e                   pop si
5:3574  5f                   pop di
5:3575  c9                   leave
5:3576  ca0a00               retf 0xa
5:3579  db 90
loc_357A:
5:357A  c746f60400           mov word ptr [bp - 0xa], 4
5:357F  c746f89642           mov word ptr [bp - 8], 0x4296
loc_3584:
5:3584  8c5efa               mov word ptr [bp - 6], ds
5:3587  8b46f6               mov ax, word ptr [bp - 0xa]
5:358A  c1e002               shl ax, 2
5:358D  50                   push ax
5:358E  9a9c172634           lcall 0x3426, 0x179c  ; operator_new@s1:179C
5:3593  83c402               add sp, 2
5:3596  8946f2               mov word ptr [bp - 0xe], ax
5:3599  8956f4               mov word ptr [bp - 0xc], dx
5:359C  c746f00000           mov word ptr [bp - 0x10], 0
5:35A1  eb1c                 jmp 0x35bf
5:35A3  db 90
loc_35A4:
5:35A4  c746f60300           mov word ptr [bp - 0xa], 3
5:35A9  c746f8a642           mov word ptr [bp - 8], 0x42a6
5:35AE  ebd4                 jmp 0x3584
loc_35B0:
5:35B0  c746f60400           mov word ptr [bp - 0xa], 4
5:35B5  c746f8b242           mov word ptr [bp - 8], 0x42b2
5:35BA  ebc8                 jmp 0x3584
loc_35BC:
5:35BC  ff46f0               inc word ptr [bp - 0x10]
loc_35BF:
5:35BF  8b46f6               mov ax, word ptr [bp - 0xa]
5:35C2  3946f0               cmp word ptr [bp - 0x10], ax
5:35C5  7d2f                 jge 0x35f6
5:35C7  8b5ef0               mov bx, word ptr [bp - 0x10]
5:35CA  c1e302               shl bx, 2
5:35CD  c476f8               les si, ptr [bp - 8]
5:35D0  268b00               mov ax, word ptr es:[bx + si]
5:35D3  0346fe               add ax, word ptr [bp - 2]
5:35D6  c47ef2               les di, ptr [bp - 0xe]
5:35D9  268901               mov word ptr es:[bx + di], ax
5:35DC  8bc3                 mov ax, bx
5:35DE  035ef8               add bx, word ptr [bp - 8]
5:35E1  8e46fa               mov es, word ptr [bp - 6]
5:35E4  268b4f02             mov cx, word ptr es:[bx + 2]
5:35E8  034efc               add cx, word ptr [bp - 4]
5:35EB  c45ef2               les bx, ptr [bp - 0xe]
5:35EE  03d8                 add bx, ax
5:35F0  26894f02             mov word ptr es:[bx + 2], cx
5:35F4  ebc6                 jmp 0x35bc
loc_35F6:
5:35F6  8b46f2               mov ax, word ptr [bp - 0xe]
5:35F9  8b56f4               mov dx, word ptr [bp - 0xc]
5:35FC  5e                   pop si
5:35FD  5f                   pop di
5:35FE  c9                   leave
5:35FF  ca0a00               retf 0xa

; ---------------- sub_s5:3602 FAR size=20 callers=1
;   apis: GDI.Polygon
5:3602  55                   push bp
5:3603  8bec                 mov bp, sp
5:3605  66ff760e             push dword ptr [bp + 0xe]
5:3609  66ff760a             push dword ptr [bp + 0xa]
5:360D  9a80240000           lcall 0, 0x2480  ; GDI.Polygon
5:3612  c9                   leave
5:3613  ca0c00               retf 0xc

; ---------------- sub_s5:3616 FAR size=46 callers=0
5:3616  55                   push bp
5:3617  8bec                 mov bp, sp
5:3619  66ff7606             push dword ptr [bp + 6]
5:361D  90                   nop
5:361E  0e                   push cs
5:361F  e8c8f9               call 0x2fea  ; sub_s5:2FEA
5:3622  f6460a01             test byte ptr [bp + 0xa], 1
5:3626  7409                 je 0x3631
5:3628  66ff7606             push dword ptr [bp + 6]
5:362C  9ace179135           lcall 0x3591, 0x17ce  ; operator_delete@s1:17CE
loc_3631:
5:3631  8b4606               mov ax, word ptr [bp + 6]
5:3634  8b5608               mov dx, word ptr [bp + 8]
5:3637  c9                   leave
5:3638  ca0600               retf 6
5:363B  db 90 16 36 42 36 80 30 fa 2f

; ---------------- sub_s5:3644 FAR size=178 callers=2
5:3644  c8080000             enter 8, 0
5:3648  66ff760c             push dword ptr [bp + 0xc]
5:364C  ff760a               push word ptr [bp + 0xa]
5:364F  666a00               push 0
5:3652  66ff7606             push dword ptr [bp + 6]
5:3656  90                   nop
5:3657  0e                   push cs
5:3658  e8b342               call 0x790e  ; sub_s5:790E
5:365B  c45e06               les bx, ptr [bp + 6]
5:365E  26c787f2009a38       mov word ptr es:[bx + 0xf2], 0x389a
5:3665  26c787f4007b36       mov word ptr es:[bx + 0xf4], 0x367b  ; SEGMENT s2:0000
5:366C  c45e06               les bx, ptr [bp + 6]
5:366F  26c787f200a83a       mov word ptr es:[bx + 0xf2], 0x3aa8
5:3676  26c787f4005735       mov word ptr es:[bx + 0xf4], 0x3557  ; SEGMENT s2:0000
5:367D  c45e06               les bx, ptr [bp + 6]
5:3680  662bc0               sub eax, eax
5:3683  2689870001           mov word ptr es:[bx + 0x100], ax
5:3688  662689870a01         mov dword ptr es:[bx + 0x10a], eax
5:368E  662689870e01         mov dword ptr es:[bx + 0x10e], eax
5:3694  26c707083d           mov word ptr es:[bx], 0x3d08
5:3699  26c74702ab36         mov word ptr es:[bx + 2], 0x36ab  ; SEGMENT s5:0000
5:369F  26c787f2009c3d       mov word ptr es:[bx + 0xf2], 0x3d9c
5:36A6  26c787f4003e36       mov word ptr es:[bx + 0xf4], 0x363e  ; SEGMENT s5:0000
5:36AD  68e905               push 0x5e9
5:36B0  8d470a               lea ax, [bx + 0xa]
5:36B3  06                   push es
5:36B4  50                   push ax
5:36B5  68ff03               push 0x3ff
5:36B8  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:36BD  9ae0840e30           lcall 0x300e, 0x84e0  ; sub_s3:84E0
5:36C2  1e                   push ds
5:36C3  68ca42               push 0x42ca  ; 'VrMode'
5:36C6  668b4606             mov eax, dword ptr [bp + 6]
5:36CA  055b00               add ax, 0x5b
5:36CD  6650                 push eax
5:36CF  9a3e3d2f36           lcall 0x362f, 0x3d3e  ; _fstrcpy@s1:3D3E
5:36D4  83c408               add sp, 8
5:36D7  c45e06               les bx, ptr [bp + 6]
5:36DA  6626c787ac000000c044 mov dword ptr es:[bx + 0xac], 0x44c00000
5:36E4  06                   push es
5:36E5  53                   push bx
5:36E6  90                   nop
5:36E7  0e                   push cs
5:36E8  e8bf01               call 0x38aa  ; sub_s5:38AA
5:36EB  8b4606               mov ax, word ptr [bp + 6]
5:36EE  8b5608               mov dx, word ptr [bp + 8]
5:36F1  c9                   leave
5:36F2  ca0a00               retf 0xa
5:36F5  db 00

; ---------------- sub_s5:36F6 FAR size=418 callers=0
;   apis: USER.GetDlgItem, USER.GetWindowText, USER.InvalidateRect, USER.SetDlgItemText, USER.SetFocus
5:36F6  c81a0400             enter 0x41a, 0
5:36FA  8b460a               mov ax, word ptr [bp + 0xa]
5:36FD  e98801               jmp 0x3888
loc_3700:
5:3700  c45e06               les bx, ptr [bp + 6]
5:3703  662bc0               sub eax, eax
5:3706  6626894708           mov dword ptr es:[bx + 8], eax
5:370B  c9                   leave
5:370C  ca0600               retf 6
5:370F  db 90
loc_3710:
5:3710  6aff                 push -1
5:3712  c45e06               les bx, ptr [bp + 6]
5:3715  6626ff7708           push dword ptr es:[bx + 8]
5:371A  9a781e1938           lcall 0x3819, 0x1e78  ; sub_s4:1E78
5:371F  8946fc               mov word ptr [bp - 4], ax
5:3722  8956fe               mov word ptr [bp - 2], dx
5:3725  c45e06               les bx, ptr [bp + 6]
5:3728  26c45f18             les bx, ptr es:[bx + 0x18]
5:372C  26ff7706             push word ptr es:[bx + 6]
5:3730  8d86fcfb             lea ax, [bp - 0x404]
5:3734  16                   push ss
5:3735  50                   push ax
5:3736  68ff03               push 0x3ff
5:3739  9affff0000           lcall 0, 0xffff  ; USER.GetWindowText
5:373E  6a3a                 push 0x3a
5:3740  8d86fcfb             lea ax, [bp - 0x404]
5:3744  16                   push ss
5:3745  50                   push ax
5:3746  9a2c47d236           lcall 0x36d2, 0x472c  ; sub_s1:472C
5:374B  83c406               add sp, 6
5:374E  8986f8fb             mov word ptr [bp - 0x408], ax
5:3752  8996fafb             mov word ptr [bp - 0x406], dx
5:3756  8386f8fb02           add word ptr [bp - 0x408], 2
5:375B  c49ef8fb             les bx, ptr [bp - 0x408]
5:375F  26c60700             mov byte ptr es:[bx], 0
5:3763  c45efc               les bx, ptr [bp - 4]
5:3766  26ff37               push word ptr es:[bx]
5:3769  8d86fcfb             lea ax, [bp - 0x404]
5:376D  16                   push ss
5:376E  50                   push ax
5:376F  68ff03               push 0x3ff
5:3772  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:3777  9ae0844238           lcall 0x3842, 0x84e0  ; sub_s3:84E0
5:377C  8d86fcfb             lea ax, [bp - 0x404]
5:3780  16                   push ss
5:3781  50                   push ax
5:3782  c45e06               les bx, ptr [bp + 6]
5:3785  6626ff7718           push dword ptr es:[bx + 0x18]
5:378A  26c45f18             les bx, ptr es:[bx + 0x18]
5:378E  26c41f               les bx, ptr es:[bx]
5:3791  26ff5f18             lcall es:[bx + 0x18]
5:3795  c45e06               les bx, ptr [bp + 6]
5:3798  26c45f08             les bx, ptr es:[bx + 8]
5:379C  268b474a             mov ax, word ptr es:[bx + 0x4a]
5:37A0  8986f6fb             mov word ptr [bp - 0x40a], ax
5:37A4  c45e06               les bx, ptr [bp + 6]
5:37A7  26c45f18             les bx, ptr es:[bx + 0x18]
5:37AB  268b4706             mov ax, word ptr es:[bx + 6]
5:37AF  8986f4fb             mov word ptr [bp - 0x40c], ax
5:37B3  50                   push ax
5:37B4  680f01               push 0x10f
5:37B7  c45efc               les bx, ptr [bp - 4]
5:37BA  6626ff7702           push dword ptr es:[bx + 2]
5:37BF  9ad4370000           lcall 0, 0x37d4  ; USER.SetDlgItemText
5:37C4  ffb6f4fb             push word ptr [bp - 0x40c]
5:37C8  681001               push 0x110  ; 'New failed in Op::Op->Simulator'
5:37CB  c45efc               les bx, ptr [bp - 4]
5:37CE  6626ff770a           push dword ptr es:[bx + 0xa]
5:37D3  9ae8370000           lcall 0, 0x37e8  ; USER.SetDlgItemText
5:37D8  ffb6f4fb             push word ptr [bp - 0x40c]
5:37DC  681201               push 0x112
5:37DF  c45efc               les bx, ptr [bp - 4]
5:37E2  6626ff7712           push dword ptr es:[bx + 0x12]
5:37E7  9afc370000           lcall 0, 0x37fc  ; USER.SetDlgItemText
5:37EC  ffb6f4fb             push word ptr [bp - 0x40c]
5:37F0  681301               push 0x113
5:37F3  c45efc               les bx, ptr [bp - 4]
5:37F6  6626ff770e           push dword ptr es:[bx + 0xe]
5:37FB  9a47380000           lcall 0, 0x3847  ; USER.SetDlgItemText
5:3800  83bef6fb00           cmp word ptr [bp - 0x40a], 0
5:3805  7429                 je 0x3830
5:3807  c45efc               les bx, ptr [bp - 4]
5:380A  26ff771a             push word ptr es:[bx + 0x1a]
5:380E  c45e06               les bx, ptr [bp + 6]
5:3811  6626ff7708           push dword ptr es:[bx + 8]
5:3816  9a1a1f8532           lcall 0x3285, 0x1f1a  ; sub_s4:1F1A
5:381B  0bc0                 or ax, ax
5:381D  7411                 je 0x3830
5:381F  ffb6f4fb             push word ptr [bp - 0x40c]
5:3823  681101               push 0x111
5:3826  c45efc               les bx, ptr [bp - 4]
5:3829  6626ff7716           push dword ptr es:[bx + 0x16]
5:382E  eb16                 jmp 0x3846
loc_3830:
5:3830  ffb6f4fb             push word ptr [bp - 0x40c]
5:3834  6668d9051101         push 0x11105d9
5:383A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:383F  9a7e84c036           lcall 0x36c0, 0x847e  ; LoadStringRes@s3:847E
5:3844  52                   push dx
5:3845  50                   push ax
loc_3846:
5:3846  9affff0000           lcall 0, 0xffff  ; USER.SetDlgItemText
5:384B  c45e06               les bx, ptr [bp + 6]
5:384E  6626837f1c00         cmp dword ptr es:[bx + 0x1c], 0
5:3854  741e                 je 0x3874
5:3856  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:385A  26ff7706             push word ptr es:[bx + 6]
5:385E  c45efc               les bx, ptr [bp - 4]
5:3861  26ff771a             push word ptr es:[bx + 0x1a]
5:3865  9a381d0000           lcall 0, 0x1d38  ; USER.GetDlgItem
5:386A  50                   push ax
5:386B  9affff0000           lcall 0, 0xffff  ; USER.SetFocus
5:3870  c9                   leave
5:3871  ca0600               retf 6
loc_3874:
5:3874  26ffb716ff           push word ptr es:[bx - 0xea]
5:3879  666a00               push 0
5:387C  6a00                 push 0
5:387E  9aa5300000           lcall 0, 0x30a5  ; USER.InvalidateRect
5:3883  c9                   leave
5:3884  ca0600               retf 6
5:3887  db 90
loc_3888:
5:3888  48                   dec ax
5:3889  0f8473fe             je 0x3700
5:388D  2d0c00               sub ax, 0xc
5:3890  0f847cfe             je 0x3710
5:3894  c9                   leave
5:3895  ca0600               retf 6

; ---------------- sub_s5:3898 size=18 callers=0
5:3898  c8040000             enter 4, 0
5:389C  66ff7606             push dword ptr [bp + 6]
5:38A0  90                   nop
5:38A1  0e                   push cs
5:38A2  e89902               call 0x3b3e  ; sub_s5:3B3E
5:38A5  c9                   leave
5:38A6  ca0400               retf 4
5:38A9  db 00

; ---------------- sub_s5:38AA FAR size=660 callers=1
;   apis: USER.GetWindowRect, USER.MoveWindow, USER.SetWindowPos
5:38AA  c8400000             enter 0x40, 0
5:38AE  56                   push si
5:38AF  66ff7606             push dword ptr [bp + 6]
5:38B3  9a6097a439           lcall 0x39a4, 0x9760  ; sub_s2:9760
5:38B8  6a06                 push 6
5:38BA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:38BF  9aba207a37           lcall 0x377a, 0x20ba  ; sub_s3:20BA
5:38C4  c45e06               les bx, ptr [bp + 6]
5:38C7  268987fa00           mov word ptr es:[bx + 0xfa], ax
5:38CC  268997fc00           mov word ptr es:[bx + 0xfc], dx
5:38D1  268b87fa00           mov ax, word ptr es:[bx + 0xfa]
5:38D6  268987e000           mov word ptr es:[bx + 0xe0], ax
5:38DB  268997e200           mov word ptr es:[bx + 0xe2], dx
5:38E0  8cc0                 mov ax, es
5:38E2  0bc3                 or ax, bx
5:38E4  740c                 je 0x38f2
5:38E6  8b4606               mov ax, word ptr [bp + 6]
5:38E9  8b5608               mov dx, word ptr [bp + 8]
5:38EC  05f200               add ax, 0xf2
5:38EF  eb04                 jmp 0x38f5
5:38F1  db 90
loc_38F2:
5:38F2  33c0                 xor ax, ax
5:38F4  99                   cdq
loc_38F5:
5:38F5  8946ec               mov word ptr [bp - 0x14], ax
5:38F8  8956ee               mov word ptr [bp - 0x12], dx
5:38FB  52                   push dx
5:38FC  50                   push ax
5:38FD  6a00                 push 0
5:38FF  c45e06               les bx, ptr [bp + 6]
5:3902  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:3908  26c49ffa00           les bx, ptr es:[bx + 0xfa]
5:390D  26c41f               les bx, ptr es:[bx]
5:3910  26ff5f04             lcall es:[bx + 4]
5:3914  c45e06               les bx, ptr [bp + 6]
5:3917  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:391D  9a8e1a1d37           lcall 0x371d, 0x1a8e  ; sub_s4:1A8E
5:3922  6a20                 push 0x20  ; 'New failed in Op::Op'
5:3924  9a9c177339           lcall 0x3973, 0x179c  ; operator_new@s1:179C
5:3929  83c402               add sp, 2
5:392C  8946e8               mov word ptr [bp - 0x18], ax
5:392F  8956ea               mov word ptr [bp - 0x16], dx
5:3932  0bd0                 or dx, ax
5:3934  741c                 je 0x3952
5:3936  66ff7606             push dword ptr [bp + 6]
5:393A  ff76ea               push word ptr [bp - 0x16]
5:393D  50                   push ax
5:393E  90                   nop
5:393F  0e                   push cs
5:3940  e86104               call 0x3da4  ; sub_s5:3DA4
5:3943  c45e06               les bx, ptr [bp + 6]
5:3946  268987f600           mov word ptr es:[bx + 0xf6], ax
5:394B  268997f800           mov word ptr es:[bx + 0xf8], dx
5:3950  eb0d                 jmp 0x395f
loc_3952:
5:3952  c45e06               les bx, ptr [bp + 6]
5:3955  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
loc_395F:
5:395F  c45e06               les bx, ptr [bp + 6]
5:3962  66268b87f600         mov eax, dword ptr es:[bx + 0xf6]
5:3968  66268987e800         mov dword ptr es:[bx + 0xe8], eax
5:396E  6a42                 push 0x42
5:3970  9a9c17c839           lcall 0x39c8, 0x179c  ; operator_new@s1:179C
5:3975  83c402               add sp, 2
5:3978  8946e8               mov word ptr [bp - 0x18], ax
5:397B  8956ea               mov word ptr [bp - 0x16], dx
5:397E  0bd0                 or dx, ax
5:3980  7434                 je 0x39b6
5:3982  c45e06               les bx, ptr [bp + 6]
5:3985  26ff7708             push word ptr es:[bx + 8]
5:3989  6668ac01f400         push 0xf401ac
5:398F  66680000ad01         push 0x1ad0000
5:3995  6668f1000000         push 0xf1
5:399B  6a00                 push 0
5:399D  ff76ea               push word ptr [bp - 0x16]
5:39A0  50                   push ax
5:39A1  9ad63bf939           lcall 0x39f9, 0x3bd6  ; sub_s2:3BD6
5:39A6  c45e06               les bx, ptr [bp + 6]
5:39A9  2689870201           mov word ptr es:[bx + 0x102], ax
5:39AE  2689970401           mov word ptr es:[bx + 0x104], dx
5:39B3  eb0e                 jmp 0x39c3
5:39B5  db 90
loc_39B6:
5:39B6  c45e06               les bx, ptr [bp + 6]
5:39B9  6626c787020100000000 mov dword ptr es:[bx + 0x102], 0
loc_39C3:
5:39C3  6a42                 push 0x42
5:39C5  9a9c17693a           lcall 0x3a69, 0x179c  ; operator_new@s1:179C
5:39CA  83c402               add sp, 2
5:39CD  8946e8               mov word ptr [bp - 0x18], ax
5:39D0  8956ea               mov word ptr [bp - 0x16], dx
5:39D3  0bd0                 or dx, ax
5:39D5  7433                 je 0x3a0a
5:39D7  c45e06               les bx, ptr [bp + 6]
5:39DA  26ff7708             push word ptr es:[bx + 8]
5:39DE  6668ae01f500         push 0xf501ae
5:39E4  66680000af01         push 0x1af0000
5:39EA  6668f100f500         push 0xf500f1
5:39F0  6a00                 push 0
5:39F2  ff76ea               push word ptr [bp - 0x16]
5:39F5  50                   push ax
5:39F6  9ad63b6a36           lcall 0x366a, 0x3bd6  ; sub_s2:3BD6
5:39FB  c45e06               les bx, ptr [bp + 6]
5:39FE  2689870601           mov word ptr es:[bx + 0x106], ax
5:3A03  2689970801           mov word ptr es:[bx + 0x108], dx
5:3A08  eb0d                 jmp 0x3a17
loc_3A0A:
5:3A0A  c45e06               les bx, ptr [bp + 6]
5:3A0D  6626c787060100000000 mov dword ptr es:[bx + 0x106], 0
loc_3A17:
5:3A17  c45e06               les bx, ptr [bp + 6]
5:3A1A  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:3A20  26c49ffa00           les bx, ptr es:[bx + 0xfa]
5:3A25  26c41f               les bx, ptr es:[bx]
5:3A28  26ff5f10             lcall es:[bx + 0x10]
5:3A2C  8ec2                 mov es, dx
5:3A2E  8bd8                 mov bx, ax
5:3A30  8946da               mov word ptr [bp - 0x26], ax
5:3A33  8c46dc               mov word ptr [bp - 0x24], es
5:3A36  268b4706             mov ax, word ptr es:[bx + 6]
5:3A3A  8946c2               mov word ptr [bp - 0x3e], ax
5:3A3D  268b4f04             mov cx, word ptr es:[bx + 4]
5:3A41  894ec4               mov word ptr [bp - 0x3c], cx
5:3A44  268b5702             mov dx, word ptr es:[bx + 2]
5:3A48  8956c6               mov word ptr [bp - 0x3a], dx
5:3A4B  268b37               mov si, word ptr es:[bx]
5:3A4E  8976c8               mov word ptr [bp - 0x38], si
5:3A51  c45e06               les bx, ptr [bp + 6]
5:3A54  26ff7708             push word ptr es:[bx + 8]
5:3A58  56                   push si
5:3A59  52                   push dx
5:3A5A  51                   push cx
5:3A5B  50                   push ax
5:3A5C  6a01                 push 1
5:3A5E  9aff2d0000           lcall 0, 0x2dff  ; USER.MoveWindow
5:3A63  688e00               push 0x8e
5:3A66  9a9c174937           lcall 0x3749, 0x179c  ; operator_new@s1:179C
5:3A6B  83c402               add sp, 2
5:3A6E  8946e8               mov word ptr [bp - 0x18], ax
5:3A71  8956ea               mov word ptr [bp - 0x16], dx
5:3A74  0bd0                 or dx, ax
5:3A76  7428                 je 0x3aa0
5:3A78  c45e06               les bx, ptr [bp + 6]
5:3A7B  26ff7708             push word ptr es:[bx + 8]
5:3A7F  66680000c00f         push 0xfc00000
5:3A85  666a01               push 1
5:3A88  ff76ea               push word ptr [bp - 0x16]
5:3A8B  50                   push ax
5:3A8C  9a2877881e           lcall 0x1e88, 0x7728  ; sub_s9:7728
5:3A91  c45e06               les bx, ptr [bp + 6]
5:3A94  2689870a01           mov word ptr es:[bx + 0x10a], ax
5:3A99  2689970c01           mov word ptr es:[bx + 0x10c], dx
5:3A9E  eb0d                 jmp 0x3aad
loc_3AA0:
5:3AA0  c45e06               les bx, ptr [bp + 6]
5:3AA3  6626c7870a0100000000 mov dword ptr es:[bx + 0x10a], 0
loc_3AAD:
5:3AAD  c45e06               les bx, ptr [bp + 6]
5:3AB0  26c49f0a01           les bx, ptr es:[bx + 0x10a]
5:3AB5  26c747740100         mov word ptr es:[bx + 0x74], 1
5:3ABB  c45e06               les bx, ptr [bp + 6]
5:3ABE  6626ffb70a01         push dword ptr es:[bx + 0x10a]
5:3AC4  26c49f0a01           les bx, ptr es:[bx + 0x10a]
5:3AC9  26c41f               les bx, ptr es:[bx]
5:3ACC  26ff5f08             lcall es:[bx + 8]
5:3AD0  c45e06               les bx, ptr [bp + 6]
5:3AD3  268b870c01           mov ax, word ptr es:[bx + 0x10c]
5:3AD8  260b870a01           or ax, word ptr es:[bx + 0x10a]
5:3ADD  745a                 je 0x3b39
5:3ADF  26c49f0a01           les bx, ptr es:[bx + 0x10a]
5:3AE4  268b4706             mov ax, word ptr es:[bx + 6]
5:3AE8  8946c0               mov word ptr [bp - 0x40], ax
5:3AEB  c45e06               les bx, ptr [bp + 6]
5:3AEE  26ff7708             push word ptr es:[bx + 8]
5:3AF2  8d46f8               lea ax, [bp - 8]
5:3AF5  16                   push ss
5:3AF6  50                   push ax
5:3AF7  9a053b0000           lcall 0, 0x3b05  ; USER.GetWindowRect
5:3AFC  ff76c0               push word ptr [bp - 0x40]
5:3AFF  8d46f0               lea ax, [bp - 0x10]
5:3B02  16                   push ss
5:3B03  50                   push ax
5:3B04  9ad91f0000           lcall 0, 0x1fd9  ; USER.GetWindowRect
5:3B09  8b46f2               mov ax, word ptr [bp - 0xe]
5:3B0C  2946f6               sub word ptr [bp - 0xa], ax
5:3B0F  8b46fc               mov ax, word ptr [bp - 4]
5:3B12  2b46f8               sub ax, word ptr [bp - 8]
5:3B15  8946f4               mov word ptr [bp - 0xc], ax
5:3B18  8b4ef8               mov cx, word ptr [bp - 8]
5:3B1B  894ef0               mov word ptr [bp - 0x10], cx
5:3B1E  ff76c0               push word ptr [bp - 0x40]
5:3B21  6a00                 push 0
5:3B23  51                   push cx
5:3B24  8b4efe               mov cx, word ptr [bp - 2]
5:3B27  83c103               add cx, 3
5:3B2A  894ef2               mov word ptr [bp - 0xe], cx
5:3B2D  51                   push cx
5:3B2E  50                   push ax
5:3B2F  ff76f6               push word ptr [bp - 0xa]
5:3B32  6a44                 push 0x44
5:3B34  9a561b0000           lcall 0, 0x1b56  ; USER.SetWindowPos
loc_3B39:
5:3B39  5e                   pop si
5:3B3A  c9                   leave
5:3B3B  ca0400               retf 4

; ---------------- sub_s5:3B3E FAR size=152 callers=1
;   apis: USER.DestroyWindow
5:3B3E  c80e0000             enter 0xe, 0
5:3B42  c45e06               les bx, ptr [bp + 6]
5:3B45  6626c7870e0100000000 mov dword ptr es:[bx + 0x10e], 0
5:3B4F  662683bf0a0100       cmp dword ptr es:[bx + 0x10a], 0
5:3B56  7411                 je 0x3b69
5:3B58  c45e06               les bx, ptr [bp + 6]
5:3B5B  26c49f0a01           les bx, ptr es:[bx + 0x10a]
5:3B60  26ff7706             push word ptr es:[bx + 6]
5:3B64  9a491e0000           lcall 0, 0x1e49  ; USER.DestroyWindow
loc_3B69:
5:3B69  c45e06               les bx, ptr [bp + 6]
5:3B6C  268b87f600           mov ax, word ptr es:[bx + 0xf6]
5:3B71  268b97f800           mov dx, word ptr es:[bx + 0xf8]
5:3B76  8bda                 mov bx, dx
5:3B78  0bd8                 or bx, ax
5:3B7A  740e                 je 0x3b8a
5:3B7C  6a01                 push 1
5:3B7E  52                   push dx
5:3B7F  50                   push ax
5:3B80  8ec2                 mov es, dx
5:3B82  8bd8                 mov bx, ax
5:3B84  26c41f               les bx, ptr es:[bx]
5:3B87  26ff1f               lcall es:[bx]
loc_3B8A:
5:3B8A  c45e06               les bx, ptr [bp + 6]
5:3B8D  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
5:3B97  662683bffa0000       cmp dword ptr es:[bx + 0xfa], 0
5:3B9E  7425                 je 0x3bc5
5:3BA0  8cc0                 mov ax, es
5:3BA2  0bc3                 or ax, bx
5:3BA4  740c                 je 0x3bb2
5:3BA6  8b4606               mov ax, word ptr [bp + 6]
5:3BA9  8b5608               mov dx, word ptr [bp + 8]
5:3BAC  05f200               add ax, 0xf2
5:3BAF  eb04                 jmp 0x3bb5
5:3BB1  db 90
loc_3BB2:
5:3BB2  33c0                 xor ax, ax
5:3BB4  99                   cdq
loc_3BB5:
5:3BB5  52                   push dx
5:3BB6  50                   push ax
5:3BB7  c45e06               les bx, ptr [bp + 6]
5:3BBA  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:3BC0  9aa61ec238           lcall 0x38c2, 0x1ea6  ; sub_s3:1EA6
loc_3BC5:
5:3BC5  c45e06               les bx, ptr [bp + 6]
5:3BC8  662bc0               sub eax, eax
5:3BCB  66268987fa00         mov dword ptr es:[bx + 0xfa], eax
5:3BD1  c9                   leave
5:3BD2  ca0400               retf 4
5:3BD5  db 00

; ---------------- sub_s5:3BD6 FAR size=92 callers=0
5:3BD6  c80a0000             enter 0xa, 0
5:3BDA  c45e06               les bx, ptr [bp + 6]
5:3BDD  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:3BE3  90                   nop
5:3BE4  0e                   push cs
5:3BE5  e8b803               call 0x3fa0  ; sub_s5:3FA0
5:3BE8  c45e06               les bx, ptr [bp + 6]
5:3BEB  2683bf000100         cmp word ptr es:[bx + 0x100], 0
5:3BF1  753b                 jne 0x3c2e
5:3BF3  26c78700010100       mov word ptr es:[bx + 0x100], 1
5:3BFA  c45e06               les bx, ptr [bp + 6]
5:3BFD  26c49ffa00           les bx, ptr es:[bx + 0xfa]
5:3C02  26837f5600           cmp word ptr es:[bx + 0x56], 0
5:3C07  7505                 jne 0x3c0e
5:3C09  6a05                 push 5
5:3C0B  eb03                 jmp 0x3c10
5:3C0D  db 90
loc_3C0E:
5:3C0E  6a08                 push 8
loc_3C10:
5:3C10  c45e06               les bx, ptr [bp + 6]
5:3C13  26ff7708             push word ptr es:[bx + 8]
5:3C17  66ff367c5b           push dword ptr [0x5b7c]
5:3C1C  9a40af652b           lcall 0x2b65, 0xaf40  ; sub_s8:AF40
5:3C21  c45e06               les bx, ptr [bp + 6]
5:3C24  2689870e01           mov word ptr es:[bx + 0x10e], ax
5:3C29  2689971001           mov word ptr es:[bx + 0x110], dx
loc_3C2E:
5:3C2E  c9                   leave
5:3C2F  ca0400               retf 4

; ---------------- sub_s5:3C32 FAR size=66 callers=1
5:3C32  55                   push bp
5:3C33  8bec                 mov bp, sp
5:3C35  8b460a               mov ax, word ptr [bp + 0xa]
5:3C38  3df500               cmp ax, 0xf5
5:3C3B  7413                 je 0x3c50
5:3C3D  7725                 ja 0x3c64
5:3C3F  2c01                 sub al, 1
5:3C41  7221                 jb 0x3c64
5:3C43  2c01                 sub al, 1
5:3C45  7629                 jbe 0x3c70
5:3C47  2cf2                 sub al, 0xf2
5:3C49  7519                 jne 0x3c64
5:3C4B  6a00                 push 0
5:3C4D  eb03                 jmp 0x3c52
5:3C4F  db 90
loc_3C50:
5:3C50  6a01                 push 1
loc_3C52:
5:3C52  c45e06               les bx, ptr [bp + 6]
5:3C55  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:3C5B  9a021b2039           lcall 0x3920, 0x1b02  ; sub_s4:1B02
5:3C60  c9                   leave
5:3C61  ca0600               retf 6
loc_3C64:
5:3C64  66ff7608             push dword ptr [bp + 8]
5:3C68  ff7606               push word ptr [bp + 6]
5:3C6B  90                   nop
5:3C6C  0e                   push cs
5:3C6D  e8c2ff               call 0x3c32  ; sub_s5:3C32
loc_3C70:
5:3C70  c9                   leave
5:3C71  ca0600               retf 6

; ---------------- sub_s5:3C74 FAR size=24 callers=0
5:3C74  55                   push bp
5:3C75  8bec                 mov bp, sp
5:3C77  66ff760c             push dword ptr [bp + 0xc]
5:3C7B  66ff7608             push dword ptr [bp + 8]
5:3C7F  ff7606               push word ptr [bp + 6]
5:3C82  90                   nop
5:3C83  0e                   push cs
5:3C84  e80500               call 0x3c8c  ; sub_s5:3C8C
5:3C87  c9                   leave
5:3C88  ca0a00               retf 0xa
5:3C8B  db 00

; ---------------- sub_s5:3C8C FAR size=26 callers=1
5:3C8C  55                   push bp
5:3C8D  8bec                 mov bp, sp
5:3C8F  66ff760a             push dword ptr [bp + 0xa]
5:3C93  c45e06               les bx, ptr [bp + 6]
5:3C96  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:3C9C  9ada1b5e3c           lcall 0x3c5e, 0x1bda  ; sub_s4:1BDA
5:3CA1  c9                   leave
5:3CA2  ca0a00               retf 0xa
5:3CA5  db 00

; ---------------- sub_s5:3CA6 FAR size=14 callers=0
5:3CA6  8bdc                 mov bx, sp
5:3CA8  36816f04f200         sub word ptr ss:[bx + 4], 0xf2
5:3CAE  e90700               jmp 0x3cb8
5:3CB1  db 90 90 00

; ---------------- sub_s5:3CB4 FAR size=4 callers=0
5:3CB4  ca0600               retf 6
5:3CB7  db 00

; ---------------- sub_s5:3CB8 FAR size=236 callers=0
5:3CB8  c8100000             enter 0x10, 0
5:3CBC  66837e0600           cmp dword ptr [bp + 6], 0
5:3CC1  740b                 je 0x3cce
5:3CC3  8b4606               mov ax, word ptr [bp + 6]
5:3CC6  8b5608               mov dx, word ptr [bp + 8]
5:3CC9  05f200               add ax, 0xf2
5:3CCC  eb03                 jmp 0x3cd1
loc_3CCE:
5:3CCE  33c0                 xor ax, ax
5:3CD0  99                   cdq
loc_3CD1:
5:3CD1  8946f8               mov word ptr [bp - 8], ax
5:3CD4  8956fa               mov word ptr [bp - 6], dx
5:3CD7  c45ef8               les bx, ptr [bp - 8]
5:3CDA  26c7079a38           mov word ptr es:[bx], 0x389a
5:3CDF  26c74702b638         mov word ptr es:[bx + 2], 0x38b6  ; SEGMENT s2:0000
5:3CE5  66ff7606             push dword ptr [bp + 6]
5:3CE9  90                   nop
5:3CEA  0e                   push cs
5:3CEB  e86e3c               call 0x795c  ; sub_s5:795C
5:3CEE  f6460a01             test byte ptr [bp + 0xa], 1
5:3CF2  7409                 je 0x3cfd
5:3CF4  66ff7606             push dword ptr [bp + 6]
5:3CF8  9ace172739           lcall 0x3927, 0x17ce  ; operator_delete@s1:17CE
loc_3CFD:
5:3CFD  8b4606               mov ax, word ptr [bp + 6]
5:3D00  8b5608               mov dx, word ptr [bp + 8]
5:3D03  c9                   leave
5:3D04  ca0600               retf 6
5:3D07  db 90 b8 3c 12 3d ea 68 16 3d aa 38 1e 3d c6 68 1a
5:3D17  db 3d 40 96 22 3d b4 79 3e 3d 2c 37 26 3d f2 97 2a
5:3D27  db 3d 3c 37 2e 3d 40 37 32 3d 44 37 36 3d 48 37 3a
5:3D37  db 3d 4c 37 42 3d d6 3b 46 3d 98 96 4e 3d 98 38 4a
5:3D47  db 3d 32 3c 52 3d 60 9c 56 3d ae 79 66 3d 5e 37 5a
5:3D57  db 3d 4e 9c 5e 3d 62 37 62 3d 4a 9c 6e 3d 74 3c 6a
5:3D67  db 3d d2 7a 86 3d 4a 6a 72 3d 2e 6b 76 3d 02 6b 7a
5:3D77  db 3d 7a 37 7e 3d 52 9c 82 3d 56 9c 8e 3d e4 79 8a
5:3D87  db 3d fc 79 9a 3d 86 9c 92 3d c4 9c 96 3d e0 9c e3
5:3D97  db 3c b4 3c 9d 36 a6 3c a2 3d f6 36 0a 3d

; ---------------- sub_s5:3DA4 FAR size=224 callers=1
;   apis: GDI.GetStockObject, GDI.SelectObject, GDI.SetMapMode, USER.GetDC
5:3DA4  c8140000             enter 0x14, 0
5:3DA8  66ff760a             push dword ptr [bp + 0xa]
5:3DAC  66ff7606             push dword ptr [bp + 6]
5:3DB0  90                   nop
5:3DB1  0e                   push cs
5:3DB2  e8653e               call 0x7c1a  ; sub_s5:7C1A
5:3DB5  c45e06               les bx, ptr [bp + 6]
5:3DB8  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:3DC1  26c7078a40           mov word ptr es:[bx], 0x408a
5:3DC6  26c747029e3d         mov word ptr es:[bx + 2], 0x3d9e  ; SEGMENT s5:0000
5:3DCC  6a06                 push 6
5:3DCE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:3DD3  9aba20c33b           lcall 0x3bc3, 0x20ba  ; sub_s3:20BA
5:3DD8  c45e06               les bx, ptr [bp + 6]
5:3DDB  26894714             mov word ptr es:[bx + 0x14], ax
5:3DDF  26895716             mov word ptr es:[bx + 0x16], dx
5:3DE3  06                   push es
5:3DE4  53                   push bx
5:3DE5  6a00                 push 0
5:3DE7  52                   push dx
5:3DE8  26ff7714             push word ptr es:[bx + 0x14]
5:3DEC  26c45f14             les bx, ptr es:[bx + 0x14]
5:3DF0  26c41f               les bx, ptr es:[bx]
5:3DF3  26ff5f04             lcall es:[bx + 4]
5:3DF7  c45e06               les bx, ptr [bp + 6]
5:3DFA  26ff7704             push word ptr es:[bx + 4]
5:3DFE  9aca290000           lcall 0, 0x29ca  ; USER.GetDC
5:3E03  8946fe               mov word ptr [bp - 2], ax
5:3E06  50                   push ax
5:3E07  6a01                 push 1
5:3E09  9affff0000           lcall 0, 0xffff  ; GDI.SetMapMode
5:3E0E  c45e06               les bx, ptr [bp + 6]
5:3E11  2689471e             mov word ptr es:[bx + 0x1e], ax
5:3E15  ff76fe               push word ptr [bp - 2]
5:3E18  6a00                 push 0
5:3E1A  9a323e0000           lcall 0, 0x3e32  ; GDI.GetStockObject
5:3E1F  50                   push ax
5:3E20  9a383e0000           lcall 0, 0x3e38  ; GDI.SelectObject
5:3E25  c45e06               les bx, ptr [bp + 6]
5:3E28  26894718             mov word ptr es:[bx + 0x18], ax
5:3E2C  ff76fe               push word ptr [bp - 2]
5:3E2F  6a06                 push 6
5:3E31  9af3340000           lcall 0, 0x34f3  ; GDI.GetStockObject
5:3E36  50                   push ax
5:3E37  9ae6340000           lcall 0, 0x34e6  ; GDI.SelectObject
5:3E3C  c45e06               les bx, ptr [bp + 6]
5:3E3F  2689471a             mov word ptr es:[bx + 0x1a], ax
5:3E43  c45e06               les bx, ptr [bp + 6]
5:3E46  26c45f14             les bx, ptr es:[bx + 0x14]
5:3E4A  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:3E4F  668946fa             mov dword ptr [bp - 6], eax
5:3E53  8d46fe               lea ax, [bp - 2]
5:3E56  16                   push ss
5:3E57  50                   push ax
5:3E58  c45efa               les bx, ptr [bp - 6]
5:3E5B  06                   push es
5:3E5C  53                   push bx
5:3E5D  26c41f               les bx, ptr es:[bx]
5:3E60  26ff5f08             lcall es:[bx + 8]
5:3E64  c45e06               les bx, ptr [bp + 6]
5:3E67  2689471c             mov word ptr es:[bx + 0x1c], ax
5:3E6B  8b46fe               mov ax, word ptr [bp - 2]
5:3E6E  8946ec               mov word ptr [bp - 0x14], ax
5:3E71  26c45f14             les bx, ptr es:[bx + 0x14]
5:3E75  2689474c             mov word ptr es:[bx + 0x4c], ax
5:3E79  8b4606               mov ax, word ptr [bp + 6]
5:3E7C  8b5608               mov dx, word ptr [bp + 8]
5:3E7F  c9                   leave
5:3E80  ca0800               retf 8
5:3E83  db 00

; ---------------- sub_s5:3E84 FAR size=142 callers=1
;   apis: GDI.DeleteObject, GDI.SelectObject, GDI.SetMapMode, USER.SelectPalette
5:3E84  c8140000             enter 0x14, 0
5:3E88  c45e06               les bx, ptr [bp + 6]
5:3E8B  26c7078a40           mov word ptr es:[bx], 0x408a
5:3E90  26c74702ca3d         mov word ptr es:[bx + 2], 0x3dca  ; SEGMENT s5:0000
5:3E96  06                   push es
5:3E97  53                   push bx
5:3E98  6626ff7714           push dword ptr es:[bx + 0x14]
5:3E9D  9aa61ed63d           lcall 0x3dd6, 0x1ea6  ; sub_s3:1EA6
5:3EA2  c45e06               les bx, ptr [bp + 6]
5:3EA5  26c45f14             les bx, ptr es:[bx + 0x14]
5:3EA9  268b474c             mov ax, word ptr es:[bx + 0x4c]
5:3EAD  8946fe               mov word ptr [bp - 2], ax
5:3EB0  50                   push ax
5:3EB1  c45e06               les bx, ptr [bp + 6]
5:3EB4  26ff7718             push word ptr es:[bx + 0x18]
5:3EB8  9ac83e0000           lcall 0, 0x3ec8  ; GDI.SelectObject
5:3EBD  ff76fe               push word ptr [bp - 2]
5:3EC0  c45e06               les bx, ptr [bp + 6]
5:3EC3  26ff771a             push word ptr es:[bx + 0x1a]
5:3EC7  9a213e0000           lcall 0, 0x3e21  ; GDI.SelectObject
5:3ECC  ff76fe               push word ptr [bp - 2]
5:3ECF  c45e06               les bx, ptr [bp + 6]
5:3ED2  26ff771c             push word ptr es:[bx + 0x1c]
5:3ED6  6a00                 push 0
5:3ED8  9aaa330000           lcall 0, 0x33aa  ; USER.SelectPalette
5:3EDD  50                   push ax
5:3EDE  9a37350000           lcall 0, 0x3537  ; GDI.DeleteObject
5:3EE3  ff76fe               push word ptr [bp - 2]
5:3EE6  c45e06               les bx, ptr [bp + 6]
5:3EE9  26ff771e             push word ptr es:[bx + 0x1e]
5:3EED  9a0a3e0000           lcall 0, 0x3e0a  ; GDI.SetMapMode
5:3EF2  c45e06               les bx, ptr [bp + 6]
5:3EF5  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:3EFA  26c747020c3f         mov word ptr es:[bx + 2], 0x3f0c  ; SEGMENT s2:0000
5:3F00  c45e06               les bx, ptr [bp + 6]
5:3F03  26c7079a38           mov word ptr es:[bx], 0x389a
5:3F08  26c747020e3d         mov word ptr es:[bx + 2], 0x3d0e  ; SEGMENT s2:0000
5:3F0E  c9                   leave
5:3F0F  ca0400               retf 4

; ---------------- sub_s5:3F12 size=142 callers=0
;   apis: USER.InvalidateRect, USER.ValidateRect
5:3F12  c8080000             enter 8, 0
5:3F16  8b460a               mov ax, word ptr [bp + 0xa]
5:3F19  48                   dec ax
5:3F1A  740a                 je 0x3f26
5:3F1C  2d0c00               sub ax, 0xc
5:3F1F  7415                 je 0x3f36
5:3F21  c9                   leave
5:3F22  ca0600               retf 6
5:3F25  db 90
loc_3F26:
5:3F26  c45e06               les bx, ptr [bp + 6]
5:3F29  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:3F32  c9                   leave
5:3F33  ca0600               retf 6
loc_3F36:
5:3F36  66c746f80e000800     mov dword ptr [bp - 8], 0x8000e
5:3F3E  66c746fc16011001     mov dword ptr [bp - 4], 0x1100116
5:3F46  c45e06               les bx, ptr [bp + 6]
5:3F49  26ff7704             push word ptr es:[bx + 4]
5:3F4D  8d46f8               lea ax, [bp - 8]
5:3F50  16                   push ss
5:3F51  50                   push ax
5:3F52  6a00                 push 0
5:3F54  9a7f380000           lcall 0, 0x387f  ; USER.InvalidateRect
5:3F59  66c746f80000f100     mov dword ptr [bp - 8], 0xf10000
5:3F61  66c746fc30002201     mov dword ptr [bp - 4], 0x1220030
5:3F69  c45e06               les bx, ptr [bp + 6]
5:3F6C  26ff7704             push word ptr es:[bx + 4]
5:3F70  8d46f8               lea ax, [bp - 8]
5:3F73  16                   push ss
5:3F74  50                   push ax
5:3F75  9a973f0000           lcall 0, 0x3f97  ; USER.ValidateRect
5:3F7A  66c746f8f500f100     mov dword ptr [bp - 8], 0xf100f5
5:3F82  66c746fc27012201     mov dword ptr [bp - 4], 0x1220127
5:3F8A  c45e06               les bx, ptr [bp + 6]
5:3F8D  26ff7704             push word ptr es:[bx + 4]
5:3F91  8d46f8               lea ax, [bp - 8]
5:3F94  16                   push ss
5:3F95  50                   push ax
5:3F96  9affff0000           lcall 0, 0xffff  ; USER.ValidateRect
5:3F9B  c9                   leave
5:3F9C  ca0600               retf 6
5:3F9F  db 00

; ---------------- sub_s5:3FA0 FAR size=196 callers=1
;   apis: USER.BeginPaint, USER.EndPaint
5:3FA0  c8500000             enter 0x50, 0
5:3FA4  c45e06               les bx, ptr [bp + 6]
5:3FA7  26ff7704             push word ptr es:[bx + 4]
5:3FAB  8d46e0               lea ax, [bp - 0x20]
5:3FAE  16                   push ss
5:3FAF  50                   push ax
5:3FB0  9acf300000           lcall 0, 0x30cf  ; USER.BeginPaint
5:3FB5  c45e06               les bx, ptr [bp + 6]
5:3FB8  26c45f14             les bx, ptr es:[bx + 0x14]
5:3FBC  268b474c             mov ax, word ptr es:[bx + 0x4c]
5:3FC0  8946de               mov word ptr [bp - 0x22], ax
5:3FC3  c45e06               les bx, ptr [bp + 6]
5:3FC6  26c45f14             les bx, ptr es:[bx + 0x14]
5:3FCA  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:3FCF  668946da             mov dword ptr [bp - 0x26], eax
5:3FD3  8d46de               lea ax, [bp - 0x22]
5:3FD6  16                   push ss
5:3FD7  50                   push ax
5:3FD8  666a00               push 0
5:3FDB  c45eda               les bx, ptr [bp - 0x26]
5:3FDE  06                   push es
5:3FDF  53                   push bx
5:3FE0  26c41f               les bx, ptr es:[bx]
5:3FE3  26ff5f04             lcall es:[bx + 4]
5:3FE7  c45e06               les bx, ptr [bp + 6]
5:3FEA  26c45f14             les bx, ptr es:[bx + 0x14]
5:3FEE  268b4744             mov ax, word ptr es:[bx + 0x44]
5:3FF2  8946d4               mov word ptr [bp - 0x2c], ax
5:3FF5  c45e06               les bx, ptr [bp + 6]
5:3FF8  26c45f14             les bx, ptr es:[bx + 0x14]
5:3FFC  66268b4740           mov eax, dword ptr es:[bx + 0x40]
5:4001  668946d6             mov dword ptr [bp - 0x2a], eax
5:4005  8d46d2               lea ax, [bp - 0x2e]
5:4008  16                   push ss
5:4009  50                   push ax
5:400A  8d46d0               lea ax, [bp - 0x30]
5:400D  16                   push ss
5:400E  50                   push ax
5:400F  c45e06               les bx, ptr [bp + 6]
5:4012  66268b4714           mov eax, dword ptr es:[bx + 0x14]
5:4017  053a00               add ax, 0x3a
5:401A  6650                 push eax
5:401C  9a943efe3e           lcall 0x3efe, 0x3e94  ; sub_s2:3E94
5:4021  668b46d6             mov eax, dword ptr [bp - 0x2a]
5:4025  668946cc             mov dword ptr [bp - 0x34], eax
5:4029  c746ca0000           mov word ptr [bp - 0x36], 0
5:402E  eb17                 jmp 0x4047
loc_4030:
5:4030  ff76de               push word ptr [bp - 0x22]
5:4033  66ff76d0             push dword ptr [bp - 0x30]
5:4037  66ff76cc             push dword ptr [bp - 0x34]
5:403B  90                   nop
5:403C  0e                   push cs
5:403D  e88e00               call 0x40ce  ; sub_s5:40CE
5:4040  ff46ca               inc word ptr [bp - 0x36]
5:4043  8346cc18             add word ptr [bp - 0x34], 0x18
loc_4047:
5:4047  8b46d4               mov ax, word ptr [bp - 0x2c]
5:404A  3946ca               cmp word ptr [bp - 0x36], ax
5:404D  7ce1                 jl 0x4030
5:404F  c45e06               les bx, ptr [bp + 6]
5:4052  26ff7704             push word ptr es:[bx + 4]
5:4056  8d46e0               lea ax, [bp - 0x20]
5:4059  16                   push ss
5:405A  50                   push ax
5:405B  9a06320000           lcall 0, 0x3206  ; USER.EndPaint
5:4060  c9                   leave
5:4061  ca0400               retf 4

; ---------------- sub_s5:4064 FAR size=106 callers=0
5:4064  55                   push bp
5:4065  8bec                 mov bp, sp
5:4067  66ff7606             push dword ptr [bp + 6]
5:406B  90                   nop
5:406C  0e                   push cs
5:406D  e814fe               call 0x3e84  ; sub_s5:3E84
5:4070  f6460a01             test byte ptr [bp + 0xa], 1
5:4074  7409                 je 0x407f
5:4076  66ff7606             push dword ptr [bp + 6]
5:407A  9ace17fb3c           lcall 0x3cfb, 0x17ce  ; operator_delete@s1:17CE
loc_407F:
5:407F  8b4606               mov ax, word ptr [bp + 6]
5:4082  8b5608               mov dx, word ptr [bp + 8]
5:4085  c9                   leave
5:4086  ca0600               retf 6
5:4089  db 90 64 40 90 40 12 3f 94 3e 55 8b ec 66 ff 76 06
5:4099  db 9a 38 3e c1 40 33 c0 c4 5e 06 26 89 47 06 26 89
5:40A9  db 47 08 26 c7 47 0a 01 00 26 89 47 0c 26 89 47 0e
5:40B9  db 8d 47 10 06 50 9a 38 3e 1f 40 8b 46 06 8b 56 08
5:40C9  db c9 ca 04 00 00

; ---------------- sub_s5:40CE FAR size=250 callers=1
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.Ellipse, GDI.GetStockObject, GDI.Rectangle, GDI.SelectObject
5:40CE  c80c0000             enter 0xc, 0
5:40D2  56                   push si
5:40D3  8d4efe               lea cx, [bp - 2]
5:40D6  16                   push ss
5:40D7  51                   push cx
5:40D8  8d56fc               lea dx, [bp - 4]
5:40DB  16                   push ss
5:40DC  52                   push dx
5:40DD  8b5e06               mov bx, word ptr [bp + 6]
5:40E0  8b7608               mov si, word ptr [bp + 8]
5:40E3  83c310               add bx, 0x10
5:40E6  56                   push si
5:40E7  53                   push bx
5:40E8  9a943efe40           lcall 0x40fe, 0x3e94  ; sub_s2:3E94
5:40ED  8d46fe               lea ax, [bp - 2]
5:40F0  16                   push ss
5:40F1  50                   push ax
5:40F2  8d4efc               lea cx, [bp - 4]
5:40F5  16                   push ss
5:40F6  51                   push cx
5:40F7  66ff7606             push dword ptr [bp + 6]
5:40FB  9a943e9c40           lcall 0x409c, 0x3e94  ; sub_s2:3E94
5:4100  ff760e               push word ptr [bp + 0xe]
5:4103  8b46fe               mov ax, word ptr [bp - 2]
5:4106  c45e06               les bx, ptr [bp + 6]
5:4109  262b470a             sub ax, word ptr es:[bx + 0xa]
5:410D  03460c               add ax, word ptr [bp + 0xc]
5:4110  50                   push ax
5:4111  8b46fc               mov ax, word ptr [bp - 4]
5:4114  262b470a             sub ax, word ptr es:[bx + 0xa]
5:4118  03460a               add ax, word ptr [bp + 0xa]
5:411B  50                   push ax
5:411C  268b470a             mov ax, word ptr es:[bx + 0xa]
5:4120  8bc8                 mov cx, ax
5:4122  0346fe               add ax, word ptr [bp - 2]
5:4125  03460c               add ax, word ptr [bp + 0xc]
5:4128  50                   push ax
5:4129  034efc               add cx, word ptr [bp - 4]
5:412C  034e0a               add cx, word ptr [bp + 0xa]
5:412F  51                   push cx
5:4130  9affff0000           lcall 0, 0xffff  ; GDI.Ellipse
5:4135  c45e06               les bx, ptr [bp + 6]
5:4138  26f6470e01           test byte ptr es:[bx + 0xe], 1
5:413D  0f848100             je 0x41c2
5:4141  ff760e               push word ptr [bp + 0xe]
5:4144  6a05                 push 5
5:4146  9aa2410000           lcall 0, 0x41a2  ; GDI.GetStockObject
5:414B  50                   push ax
5:414C  9a64410000           lcall 0, 0x4164  ; GDI.SelectObject
5:4151  ff760e               push word ptr [bp + 0xe]
5:4154  666a01               push 1
5:4157  6668f9000001         push 0x10000f9
5:415D  9add340000           lcall 0, 0x34dd  ; GDI.CreatePen
5:4162  50                   push ax
5:4163  9aa8410000           lcall 0, 0x41a8  ; GDI.SelectObject
5:4168  8b46fe               mov ax, word ptr [bp - 2]
5:416B  03460c               add ax, word ptr [bp + 0xc]
5:416E  8bc8                 mov cx, ax
5:4170  2d0500               sub ax, 5
5:4173  8946f4               mov word ptr [bp - 0xc], ax
5:4176  8b56fc               mov dx, word ptr [bp - 4]
5:4179  03560a               add dx, word ptr [bp + 0xa]
5:417C  8bda                 mov bx, dx
5:417E  83ea05               sub dx, 5
5:4181  8956f6               mov word ptr [bp - 0xa], dx
5:4184  83c105               add cx, 5
5:4187  894ef8               mov word ptr [bp - 8], cx
5:418A  83c305               add bx, 5
5:418D  895efa               mov word ptr [bp - 6], bx
5:4190  ff760e               push word ptr [bp + 0xe]
5:4193  50                   push ax
5:4194  52                   push dx
5:4195  51                   push cx
5:4196  53                   push bx
5:4197  9a19350000           lcall 0, 0x3519  ; GDI.Rectangle
5:419C  ff760e               push word ptr [bp + 0xe]
5:419F  6a00                 push 0
5:41A1  9ab2410000           lcall 0, 0x41b2  ; GDI.GetStockObject
5:41A6  50                   push ax
5:41A7  9ab8410000           lcall 0, 0x41b8  ; GDI.SelectObject
5:41AC  ff760e               push word ptr [bp + 0xe]
5:41AF  6a06                 push 6
5:41B1  9a1b3e0000           lcall 0, 0x3e1b  ; GDI.GetStockObject
5:41B6  50                   push ax
5:41B7  9ab93e0000           lcall 0, 0x3eb9  ; GDI.SelectObject
5:41BC  50                   push ax
5:41BD  9adf3e0000           lcall 0, 0x3edf  ; GDI.DeleteObject
loc_41C2:
5:41C2  5e                   pop si
5:41C3  c9                   leave
5:41C4  ca0a00               retf 0xa
5:41C7  db 90

; ---------------- sub_s5:41C8 FAR size=300 callers=1
;   apis: USER.LoadAccelerators, USER.LoadCursor
5:41C8  c8040000             enter 4, 0
5:41CC  66ff760c             push dword ptr [bp + 0xc]
5:41D0  ff760a               push word ptr [bp + 0xa]
5:41D3  6a08                 push 8
5:41D5  66ff7606             push dword ptr [bp + 6]
5:41D9  90                   nop
5:41DA  0e                   push cs
5:41DB  e89c3d               call 0x7f7a  ; sub_s5:7F7A
5:41DE  33c0                 xor ax, ax
5:41E0  c45e06               les bx, ptr [bp + 6]
5:41E3  268987ee00           mov word ptr es:[bx + 0xee], ax
5:41E8  268987f000           mov word ptr es:[bx + 0xf0], ax
5:41ED  268987f200           mov word ptr es:[bx + 0xf2], ax
5:41F2  26c787f4000100       mov word ptr es:[bx + 0xf4], 1
5:41F9  662bc9               sub ecx, ecx
5:41FC  6626898ff600         mov dword ptr es:[bx + 0xf6], ecx
5:4202  6626898ffa00         mov dword ptr es:[bx + 0xfa], ecx
5:4208  6626898ffe00         mov dword ptr es:[bx + 0xfe], ecx
5:420E  6626898f0201         mov dword ptr es:[bx + 0x102], ecx
5:4214  2689870601           mov word ptr es:[bx + 0x106], ax
5:4219  2689870a01           mov word ptr es:[bx + 0x10a], ax
5:421E  2689870801           mov word ptr es:[bx + 0x108], ax
5:4223  2689870c01           mov word ptr es:[bx + 0x10c], ax
5:4228  2689871001           mov word ptr es:[bx + 0x110], ax
5:422D  2689870e01           mov word ptr es:[bx + 0x10e], ax
5:4232  2689871201           mov word ptr es:[bx + 0x112], ax
5:4237  2689871401           mov word ptr es:[bx + 0x114], ax
5:423C  2689871601           mov word ptr es:[bx + 0x116], ax
5:4241  26c7073c62           mov word ptr es:[bx], 0x623c
5:4246  26c747025842         mov word ptr es:[bx + 2], 0x4258  ; SEGMENT s5:0000
5:424C  26c787e200d862       mov word ptr es:[bx + 0xe2], 0x62d8
5:4253  26c787e4008c40       mov word ptr es:[bx + 0xe4], 0x408c  ; SEGMENT s5:0000
5:425A  ff368c03             push word ptr [0x38c]
5:425E  50                   push ax
5:425F  689e01               push 0x19e
5:4262  9a7a420000           lcall 0, 0x427a  ; USER.LoadCursor
5:4267  c45e06               les bx, ptr [bp + 6]
5:426A  268987f000           mov word ptr es:[bx + 0xf0], ax
5:426F  ff368c03             push word ptr [0x38c]
5:4273  66689f010000         push 0x19f
5:4279  9a23130000           lcall 0, 0x1323  ; USER.LoadCursor
5:427E  c45e06               les bx, ptr [bp + 6]
5:4281  268987f200           mov word ptr es:[bx + 0xf2], ax
5:4286  ff368c03             push word ptr [0x38c]
5:428A  1e                   push ds
5:428B  68e843               push 0x43e8  ; 'OpAccel'
5:428E  9affff0000           lcall 0, 0xffff  ; USER.LoadAccelerators
5:4293  a39803               mov word ptr [0x398], ax
5:4296  6a29                 push 0x29
5:4298  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:429D  9aba20a03e           lcall 0x3ea0, 0x20ba  ; sub_s3:20BA
5:42A2  c45e06               les bx, ptr [bp + 6]
5:42A5  268987fa00           mov word ptr es:[bx + 0xfa], ax
5:42AA  268997fc00           mov word ptr es:[bx + 0xfc], dx
5:42AF  8cc0                 mov ax, es
5:42B1  0bc3                 or ax, bx
5:42B3  740b                 je 0x42c0
5:42B5  8b4606               mov ax, word ptr [bp + 6]
5:42B8  8b5608               mov dx, word ptr [bp + 8]
5:42BB  05e200               add ax, 0xe2
5:42BE  eb03                 jmp 0x42c3
loc_42C0:
5:42C0  33c0                 xor ax, ax
5:42C2  99                   cdq
loc_42C3:
5:42C3  52                   push dx
5:42C4  50                   push ax
5:42C5  6a00                 push 0
5:42C7  c45e06               les bx, ptr [bp + 6]
5:42CA  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:42D0  26c49ffa00           les bx, ptr es:[bx + 0xfa]
5:42D5  26c41f               les bx, ptr es:[bx]
5:42D8  26ff5f04             lcall es:[bx + 4]
5:42DC  c45e06               les bx, ptr [bp + 6]
5:42DF  66268b87fa00         mov eax, dword ptr es:[bx + 0xfa]
5:42E5  66268987e600         mov dword ptr es:[bx + 0xe6], eax
5:42EB  8bc3                 mov ax, bx
5:42ED  8cc2                 mov dx, es
5:42EF  c9                   leave
5:42F0  ca0a00               retf 0xa
5:42F3  db 00

; ---------------- sub_s5:42F4 FAR size=88 callers=1
;   apis: USER.DestroyCursor, USER.DestroyMenu
5:42F4  55                   push bp
5:42F5  8bec                 mov bp, sp
5:42F7  c45e06               les bx, ptr [bp + 6]
5:42FA  26c7073c62           mov word ptr es:[bx], 0x623c
5:42FF  26c747021143         mov word ptr es:[bx + 2], 0x4311  ; SEGMENT s5:0000
5:4305  26c787e200d862       mov word ptr es:[bx + 0xe2], 0x62d8
5:430C  26c787e4004a42       mov word ptr es:[bx + 0xe4], 0x424a  ; SEGMENT s5:0000
5:4313  2683bf060100         cmp word ptr es:[bx + 0x106], 0
5:4319  740a                 je 0x4325
5:431B  26ffb70601           push word ptr es:[bx + 0x106]
5:4320  9affff0000           lcall 0, 0xffff  ; USER.DestroyMenu
loc_4325:
5:4325  c45e06               les bx, ptr [bp + 6]
5:4328  26ffb7f000           push word ptr es:[bx + 0xf0]
5:432D  9a3b430000           lcall 0, 0x433b  ; USER.DestroyCursor
5:4332  c45e06               les bx, ptr [bp + 6]
5:4335  26ffb7f200           push word ptr es:[bx + 0xf2]
5:433A  9affff0000           lcall 0, 0xffff  ; USER.DestroyCursor
5:433F  66ff7606             push dword ptr [bp + 6]
5:4343  90                   nop
5:4344  0e                   push cs
5:4345  e8463d               call 0x808e  ; sub_s5:808E
5:4348  c9                   leave
5:4349  ca0400               retf 4

; ---------------- sub_s5:434C FAR size=72 callers=0
5:434C  55                   push bp
5:434D  8bec                 mov bp, sp
5:434F  8b4610               mov ax, word ptr [bp + 0x10]
5:4352  48                   dec ax
5:4353  7419                 je 0x436e
5:4355  48                   dec ax
5:4356  7526                 jne 0x437e
5:4358  6a02                 push 2
5:435A  66ff760c             push dword ptr [bp + 0xc]
5:435E  66ff7608             push dword ptr [bp + 8]
5:4362  ff7606               push word ptr [bp + 6]
5:4365  90                   nop
5:4366  0e                   push cs
5:4367  e80410               call 0x536e  ; sub_s5:536E
5:436A  c9                   leave
5:436B  ca0c00               retf 0xc
loc_436E:
5:436E  ff760e               push word ptr [bp + 0xe]
5:4371  66ff7606             push dword ptr [bp + 6]
5:4375  90                   nop
5:4376  0e                   push cs
5:4377  e80a1e               call 0x6184  ; sub_s5:6184
5:437A  c9                   leave
5:437B  ca0c00               retf 0xc
loc_437E:
5:437E  66ff760e             push dword ptr [bp + 0xe]
5:4382  66ff760a             push dword ptr [bp + 0xa]
5:4386  66ff7606             push dword ptr [bp + 6]
5:438A  9aea68eb40           lcall 0x40eb, 0x68ea  ; sub_s2:68EA
5:438F  c9                   leave
5:4390  ca0c00               retf 0xc
5:4393  db 00

; ---------------- sub_s5:4394 FAR size=98 callers=0
;   apis: USER.PostMessage
5:4394  c8080000             enter 8, 0
5:4398  8b460a               mov ax, word ptr [bp + 0xa]
5:439B  eb45                 jmp 0x43e2
5:439D  db 90
loc_439E:
5:439E  c45e06               les bx, ptr [bp + 6]
5:43A1  6626c7471800000000   mov dword ptr es:[bx + 0x18], 0
5:43AA  c9                   leave
5:43AB  ca0600               retf 6
loc_43AE:
5:43AE  c45e06               les bx, ptr [bp + 6]
5:43B1  268b8726ff           mov ax, word ptr es:[bx - 0xda]
5:43B6  26c45f2c             les bx, ptr es:[bx + 0x2c]
5:43BA  2689470e             mov word ptr es:[bx + 0xe], ax
5:43BE  c9                   leave
5:43BF  ca0600               retf 6
loc_43C2:
5:43C2  c45e06               les bx, ptr [bp + 6]
5:43C5  26837f3400           cmp word ptr es:[bx + 0x34], 0
5:43CA  7425                 je 0x43f1
5:43CC  ff369603             push word ptr [0x396]
5:43D0  6668f6001101         push 0x11100f6
5:43D6  666a00               push 0
5:43D9  9a0b2c0000           lcall 0, 0x2c0b  ; USER.PostMessage
5:43DE  c9                   leave
5:43DF  ca0600               retf 6
loc_43E2:
5:43E2  3d1000               cmp ax, 0x10
5:43E5  74db                 je 0x43c2
5:43E7  7708                 ja 0x43f1
5:43E9  fec8                 dec al
5:43EB  74b1                 je 0x439e
5:43ED  2c0a                 sub al, 0xa
5:43EF  74bd                 je 0x43ae
loc_43F1:
5:43F1  c9                   leave
5:43F2  ca0600               retf 6
5:43F5  db 00

; ---------------- sub_s5:43F6 FAR size=186 callers=0
5:43F6  c8080000             enter 8, 0
5:43FA  66ff7606             push dword ptr [bp + 6]
5:43FE  9a60978d43           lcall 0x438d, 0x9760  ; sub_s2:9760
5:4403  c45e06               les bx, ptr [bp + 6]
5:4406  26ff7708             push word ptr es:[bx + 8]
5:440A  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:4410  9ab04d9f3c           lcall 0x3c9f, 0x4db0  ; sub_s4:4DB0
5:4415  6a32                 push 0x32
5:4417  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:441C  9aba20a042           lcall 0x42a0, 0x20ba  ; sub_s3:20BA
5:4421  c45e06               les bx, ptr [bp + 6]
5:4424  2689870e01           mov word ptr es:[bx + 0x10e], ax
5:4429  2689971001           mov word ptr es:[bx + 0x110], dx
5:442E  8cc0                 mov ax, es
5:4430  0bc3                 or ax, bx
5:4432  740c                 je 0x4440
5:4434  8b4606               mov ax, word ptr [bp + 6]
5:4437  8b5608               mov dx, word ptr [bp + 8]
5:443A  05e200               add ax, 0xe2
5:443D  eb04                 jmp 0x4443
5:443F  db 90
loc_4440:
5:4440  33c0                 xor ax, ax
5:4442  99                   cdq
loc_4443:
5:4443  52                   push dx
5:4444  50                   push ax
5:4445  6a0b                 push 0xb
5:4447  c45e06               les bx, ptr [bp + 6]
5:444A  6626ffb70e01         push dword ptr es:[bx + 0x10e]
5:4450  26c49f0e01           les bx, ptr es:[bx + 0x10e]
5:4455  26c41f               les bx, ptr es:[bx]
5:4458  26ff5f04             lcall es:[bx + 4]
5:445C  6a30                 push 0x30
5:445E  9a9c177d40           lcall 0x407d, 0x179c  ; operator_new@s1:179C
5:4463  83c402               add sp, 2
5:4466  8956fa               mov word ptr [bp - 6], dx
5:4469  0bd0                 or dx, ax
5:446B  741f                 je 0x448c
5:446D  c45e06               les bx, ptr [bp + 6]
5:4470  26ff7708             push word ptr es:[bx + 8]
5:4474  ff76fa               push word ptr [bp - 6]
5:4477  50                   push ax
5:4478  90                   nop
5:4479  0e                   push cs
5:447A  e8631e               call 0x62e0  ; sub_s5:62E0
5:447D  c45e06               les bx, ptr [bp + 6]
5:4480  268987f600           mov word ptr es:[bx + 0xf6], ax
5:4485  268997f800           mov word ptr es:[bx + 0xf8], dx
5:448A  eb0d                 jmp 0x4499
loc_448C:
5:448C  c45e06               les bx, ptr [bp + 6]
5:448F  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
loc_4499:
5:4499  6668ffff0300         push 0x3ffff
5:449F  666a00               push 0
5:44A2  66ff7606             push dword ptr [bp + 6]
5:44A6  90                   nop
5:44A7  0e                   push cs
5:44A8  e8c30e               call 0x536e  ; sub_s5:536E
5:44AB  c9                   leave
5:44AC  ca0400               retf 4
5:44AF  db 00

; ---------------- sub_s5:44B0 FAR size=60 callers=0
5:44B0  55                   push bp
5:44B1  8bec                 mov bp, sp
5:44B3  c45e06               les bx, ptr [bp + 6]
5:44B6  662683bff60000       cmp dword ptr es:[bx + 0xf6], 0
5:44BD  7428                 je 0x44e7
5:44BF  6a01                 push 1
5:44C1  06                   push es
5:44C2  53                   push bx
5:44C3  26c41f               les bx, ptr es:[bx]
5:44C6  26ff9f9800           lcall es:[bx + 0x98]
5:44CB  c45e06               les bx, ptr [bp + 6]
5:44CE  26c78712010000       mov word ptr es:[bx + 0x112], 0
5:44D5  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:44DB  26c49ff600           les bx, ptr es:[bx + 0xf6]
5:44E0  26c41f               les bx, ptr es:[bx]
5:44E3  26ff5f08             lcall es:[bx + 8]
loc_44E7:
5:44E7  c9                   leave
5:44E8  ca0400               retf 4
5:44EB  db 00

; ---------------- sub_s5:44EC FAR size=1104 callers=0
;   apis: USER.CheckMenuItem, USER.DeleteMenu, USER.EnableMenuItem, USER.GetMenuState, USER.GetSubMenu, USER.InsertMenu, USER.ModifyMenu
5:44EC  c8360100             enter 0x136, 0
5:44F0  c45e06               les bx, ptr [bp + 6]
5:44F3  2683bf060100         cmp word ptr es:[bx + 0x106], 0
5:44F9  0f84a102             je 0x479e
5:44FD  8b460e               mov ax, word ptr [bp + 0xe]
5:4500  2639870601           cmp word ptr es:[bx + 0x106], ax
5:4505  0f854d01             jne 0x4656
5:4509  6a03                 push 3
5:450B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4510  9aba207a45           lcall 0x457a, 0x20ba  ; sub_s3:20BA
5:4515  8946fc               mov word ptr [bp - 4], ax
5:4518  8956fe               mov word ptr [bp - 2], dx
5:451B  c45e06               les bx, ptr [bp + 6]
5:451E  26c49f0801           les bx, ptr es:[bx + 0x108]
5:4523  268b472e             mov ax, word ptr es:[bx + 0x2e]
5:4527  8946fa               mov word ptr [bp - 6], ax
5:452A  c45e06               les bx, ptr [bp + 6]
5:452D  26c49f0801           les bx, ptr es:[bx + 0x108]
5:4532  66268b4742           mov eax, dword ptr es:[bx + 0x42]
5:4537  268b5744             mov dx, word ptr es:[bx + 0x44]
5:453B  668986f6fe           mov dword ptr [bp - 0x10a], eax
5:4540  668986e4fe           mov dword ptr [bp - 0x11c], eax
5:4545  668986dafe           mov dword ptr [bp - 0x126], eax
5:454A  8a86ddfe             mov al, byte ptr [bp - 0x123]
5:454E  2ae4                 sub ah, ah
5:4550  a8ff                 test al, 0xff
5:4552  742a                 je 0x457e
5:4554  52                   push dx
5:4555  ffb6f6fe             push word ptr [bp - 0x10a]
5:4559  66ff364857           push dword ptr [0x5748]  ; g_sim
5:455E  9a4483b346           lcall 0x46b3, 0x8344  ; sub_s7:8344
5:4563  8986dafe             mov word ptr [bp - 0x126], ax
5:4567  8996dcfe             mov word ptr [bp - 0x124], dx
5:456B  52                   push dx
5:456C  50                   push ax
5:456D  8d86fafe             lea ax, [bp - 0x106]
5:4571  16                   push ss
5:4572  50                   push ax
5:4573  66ff76fc             push dword ptr [bp - 4]
5:4577  9ac2c30146           lcall 0x4601, 0xc3c2  ; sub_s3:C3C2
5:457C  eb1b                 jmp 0x4599
loc_457E:
5:457E  ff76fa               push word ptr [bp - 6]
5:4581  90                   nop
5:4582  0e                   push cs
5:4583  e8fa77               call 0xbd80  ; sub_s5:BD80
5:4586  83c402               add sp, 2
5:4589  52                   push dx
5:458A  50                   push ax
5:458B  8d86fafe             lea ax, [bp - 0x106]
5:458F  16                   push ss
5:4590  50                   push ax
5:4591  9a3e3d6144           lcall 0x4461, 0x3d3e  ; _fstrcpy@s1:3D3E
5:4596  83c408               add sp, 8
loc_4599:
5:4599  c45e06               les bx, ptr [bp + 6]
5:459C  26ffb70601           push word ptr es:[bx + 0x106]
5:45A1  666800007600         push 0x760000
5:45A7  6a76                 push 0x76
5:45A9  8d86fafe             lea ax, [bp - 0x106]
5:45AD  16                   push ss
5:45AE  50                   push ax
5:45AF  9affff0000           lcall 0, 0xffff  ; USER.ModifyMenu
5:45B4  8986f4fe             mov word ptr [bp - 0x10c], ax
5:45B8  c45e06               les bx, ptr [bp + 6]
5:45BB  26ffb70601           push word ptr es:[bx + 0x106]
5:45C0  666800003c01         push 0x13c0000
5:45C6  9affff0000           lcall 0, 0xffff  ; USER.GetMenuState
5:45CB  3dffff               cmp ax, 0xffff
5:45CE  7413                 je 0x45e3
5:45D0  c45e06               les bx, ptr [bp + 6]
5:45D3  26ffb70601           push word ptr es:[bx + 0x106]
5:45D8  666800003c01         push 0x13c0000
5:45DE  9affff0000           lcall 0, 0xffff  ; USER.DeleteMenu
loc_45E3:
5:45E3  6a20                 push 0x20  ; 'New failed in Op::Op'
5:45E5  ff76fa               push word ptr [bp - 6]
5:45E8  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
5:45ED  9aaec65347           lcall 0x4753, 0xc6ae  ; BldgGroups::contains@s2:C6AE
5:45F2  0bc0                 or ax, ax
5:45F4  742d                 je 0x4623
5:45F6  684b07               push 0x74b
5:45F9  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:45FE  9a7e846c48           lcall 0x486c, 0x847e  ; LoadStringRes@s3:847E
5:4603  8986dafe             mov word ptr [bp - 0x126], ax
5:4607  8996dcfe             mov word ptr [bp - 0x124], dx
5:460B  c45e06               les bx, ptr [bp + 6]
5:460E  26ffb70601           push word ptr es:[bx + 0x106]
5:4613  66680004ffff         push 0xffff0400
5:4619  683c01               push 0x13c
5:461C  52                   push dx
5:461D  50                   push ax
5:461E  9affff0000           lcall 0, 0xffff  ; USER.InsertMenu
loc_4623:
5:4623  8b5efa               mov bx, word ptr [bp - 6]
5:4626  03db                 add bx, bx
5:4628  83bfd24200           cmp word ptr [bx + 0x42d2], 0
5:462D  7511                 jne 0x4640
5:462F  c45e06               les bx, ptr [bp + 6]
5:4632  26ffb70601           push word ptr es:[bx + 0x106]
5:4637  666801007700         push 0x770001
5:463D  eb0d                 jmp 0x464c
5:463F  db 90
loc_4640:
5:4640  c45e06               les bx, ptr [bp + 6]
5:4643  26ffb70601           push word ptr es:[bx + 0x106]
5:4648  6a77                 push 0x77
loc_464A:
5:464A  6a00                 push 0
loc_464C:
5:464C  9a75460000           lcall 0, 0x4675  ; USER.EnableMenuItem
5:4651  c9                   leave
5:4652  ca0a00               retf 0xa
5:4655  db 90
loc_4656:
5:4656  26ffb70601           push word ptr es:[bx + 0x106]
5:465B  6a01                 push 1
5:465D  9affff0000           lcall 0, 0xffff  ; USER.GetSubMenu
5:4662  8986dafe             mov word ptr [bp - 0x126], ax
5:4666  3b460e               cmp ax, word ptr [bp + 0xe]
5:4669  0f853101             jne 0x479e
5:466D  50                   push ax
5:466E  666801000002         push 0x2000001
5:4674  9a84460000           lcall 0, 0x4684  ; USER.EnableMenuItem
5:4679  ffb6dafe             push word ptr [bp - 0x126]
5:467D  666801000102         push 0x2010001
5:4683  9a93460000           lcall 0, 0x4693  ; USER.EnableMenuItem
5:4688  ffb6dafe             push word ptr [bp - 0x126]
5:468C  666801000202         push 0x2020001
5:4692  9a64470000           lcall 0, 0x4764  ; USER.EnableMenuItem
5:4697  c45e06               les bx, ptr [bp + 6]
5:469A  26c49f0801           les bx, ptr es:[bx + 0x108]
5:469F  66268b4742           mov eax, dword ptr es:[bx + 0x42]
5:46A4  668986defe           mov dword ptr [bp - 0x122], eax
5:46A9  6650                 push eax
5:46AB  66ff364857           push dword ptr [0x5748]  ; g_sim
5:46B0  9a4483f646           lcall 0x46f6, 0x8344  ; sub_s7:8344
5:46B5  8986e4fe             mov word ptr [bp - 0x11c], ax
5:46B9  8996e6fe             mov word ptr [bp - 0x11a], dx
5:46BD  0bd0                 or dx, ax
5:46BF  0f847502             je 0x4938
5:46C3  c49ee4fe             les bx, ptr [bp - 0x11c]
5:46C7  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:46CC  268b5730             mov dx, word ptr es:[bx + 0x30]
5:46D0  668986ecfe           mov dword ptr [bp - 0x114], eax
5:46D5  8bc2                 mov ax, dx
5:46D7  0b86ecfe             or ax, word ptr [bp - 0x114]
5:46DB  0f845902             je 0x4938
5:46DF  c49eecfe             les bx, ptr [bp - 0x114]
5:46E3  66268b870002         mov eax, dword ptr es:[bx + 0x200]
5:46E9  668986f6fe           mov dword ptr [bp - 0x10a], eax
5:46EE  66ffb6e4fe           push dword ptr [bp - 0x11c]
5:46F3  9aa8734247           lcall 0x4742, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:46F8  8986fafe             mov word ptr [bp - 0x106], ax
5:46FC  8996fcfe             mov word ptr [bp - 0x104], dx
5:4700  c49efafe             les bx, ptr [bp - 0x106]
5:4704  66268b471c           mov eax, dword ptr es:[bx + 0x1c]
5:4709  268b571e             mov dx, word ptr es:[bx + 0x1e]
5:470D  668946fc             mov dword ptr [bp - 4], eax
5:4711  8bc2                 mov ax, dx
5:4713  0b46fc               or ax, word ptr [bp - 4]
5:4716  740b                 je 0x4723
5:4718  8b46fc               mov ax, word ptr [bp - 4]
5:471B  8986f6fe             mov word ptr [bp - 0x10a], ax
5:471F  8996f8fe             mov word ptr [bp - 0x108], dx
loc_4723:
5:4723  8b86f6fe             mov ax, word ptr [bp - 0x10a]
5:4727  8b96f8fe             mov dx, word ptr [bp - 0x108]
5:472B  2af6                 sub dh, dh
5:472D  3d0100               cmp ax, 1
5:4730  0f850402             jne 0x4938
5:4734  0bd2                 or dx, dx
5:4736  0f85fe01             jne 0x4938
5:473A  66ffb6e4fe           push dword ptr [bp - 0x11c]
5:473F  9aa06f8b47           lcall 0x478b, 0x6fa0  ; sub_s7:6FA0
5:4744  8986cefe             mov word ptr [bp - 0x132], ax
5:4748  6a3f                 push 0x3f
5:474A  50                   push ax
5:474B  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
5:4750  9aaec60144           lcall 0x4401, 0xc6ae  ; BldgGroups::contains@s2:C6AE
5:4755  0bc0                 or ax, ax
5:4757  740f                 je 0x4768
5:4759  ffb6dafe             push word ptr [bp - 0x126]
5:475D  666800000102         push 0x2010000
5:4763  9a7f470000           lcall 0, 0x477f  ; USER.EnableMenuItem
loc_4768:
5:4768  c49ee4fe             les bx, ptr [bp - 0x11c]
5:476C  6626837f3600         cmp dword ptr es:[bx + 0x36], 0
5:4772  740f                 je 0x4783
5:4774  ffb6dafe             push word ptr [bp - 0x126]
5:4778  666800000202         push 0x2020000
5:477E  9ac0470000           lcall 0, 0x47c0  ; USER.EnableMenuItem
loc_4783:
5:4783  66ffb6e4fe           push dword ptr [bp - 0x11c]
5:4788  9acc69a612           lcall 0x12a6, 0x69cc  ; sub_s7:69CC
5:478D  0bc0                 or ax, ax
5:478F  0f84a501             je 0x4938
5:4793  ffb6dafe             push word ptr [bp - 0x126]
5:4797  680002               push 0x200
5:479A  e9adfe               jmp 0x464a
5:479D  db 90
loc_479E:
5:479E  8b460c               mov ax, word ptr [bp + 0xc]
5:47A1  e98201               jmp 0x4926
loc_47A4:
5:47A4  c45e06               les bx, ptr [bp + 6]
5:47A7  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:47AD  9a04251344           lcall 0x4413, 0x2504  ; sub_s4:2504
5:47B2  0bc0                 or ax, ax
5:47B4  741a                 je 0x47d0
5:47B6  ff760e               push word ptr [bp + 0xe]
5:47B9  666800040000         push 0x400
5:47BF  9ada470000           lcall 0, 0x47da  ; USER.EnableMenuItem
5:47C4  ff760e               push word ptr [bp + 0xe]
5:47C7  6a01                 push 1
loc_47C9:
5:47C9  680004               push 0x400
5:47CC  e97dfe               jmp 0x464c
5:47CF  db 90
loc_47D0:
5:47D0  ff760e               push word ptr [bp + 0xe]
5:47D3  666801040000         push 0x401
5:47D9  9a08480000           lcall 0, 0x4808  ; USER.EnableMenuItem
5:47DE  ff760e               push word ptr [bp + 0xe]
5:47E1  6a01                 push 1
loc_47E3:
5:47E3  680104               push 0x401
5:47E6  e963fe               jmp 0x464c
5:47E9  db 90
loc_47EA:
5:47EA  6a02                 push 2
5:47EC  c45e06               les bx, ptr [bp + 6]
5:47EF  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:47F5  90                   nop
5:47F6  0e                   push cs
5:47F7  e8da1c               call 0x64d4  ; sub_s5:64D4
5:47FA  0bc0                 or ax, ax
5:47FC  741a                 je 0x4818
5:47FE  ff760e               push word ptr [bp + 0xe]
5:4801  666800040000         push 0x400
5:4807  9a22480000           lcall 0, 0x4822  ; USER.EnableMenuItem
5:480C  ff760e               push word ptr [bp + 0xe]
5:480F  666800040100         push 0x10400
5:4815  eb18                 jmp 0x482f
5:4817  db 90
loc_4818:
5:4818  ff760e               push word ptr [bp + 0xe]
5:481B  666801040000         push 0x401
5:4821  9a30480000           lcall 0, 0x4830  ; USER.EnableMenuItem
5:4826  ff760e               push word ptr [bp + 0xe]
5:4829  666801040100         push 0x10401
loc_482F:
5:482F  9a3e2c0000           lcall 0, 0x2c3e  ; USER.EnableMenuItem
5:4834  833e100000           cmp word ptr [0x10], 0
5:4839  7515                 jne 0x4850
5:483B  c45e06               les bx, ptr [bp + 6]
5:483E  662683bf020100       cmp dword ptr es:[bx + 0x102], 0
5:4845  7409                 je 0x4850
5:4847  ff760e               push word ptr [bp + 0xe]
5:484A  6a05                 push 5
5:484C  e97aff               jmp 0x47c9
5:484F  db 90
loc_4850:
5:4850  ff760e               push word ptr [bp + 0xe]
5:4853  6a05                 push 5
5:4855  eb8c                 jmp 0x47e3
5:4857  db 90
loc_4858:
5:4858  33c0                 xor ax, ax
5:485A  8986cafe             mov word ptr [bp - 0x136], ax
5:485E  8986cefe             mov word ptr [bp - 0x132], ax
5:4862  6a2f                 push 0x2f
5:4864  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4869  9aba201f44           lcall 0x441f, 0x20ba  ; sub_s3:20BA
5:486E  8986d2fe             mov word ptr [bp - 0x12e], ax
5:4872  8996d4fe             mov word ptr [bp - 0x12c], dx
5:4876  c49ed2fe             les bx, ptr [bp - 0x12e]
5:487A  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:487F  268b5722             mov dx, word ptr es:[bx + 0x22]
5:4883  668986d6fe           mov dword ptr [bp - 0x12a], eax
5:4888  8bc2                 mov ax, dx
5:488A  0b86d6fe             or ax, word ptr [bp - 0x12a]
5:488E  7427                 je 0x48b7
5:4890  52                   push dx
5:4891  ffb6d6fe             push word ptr [bp - 0x12a]
5:4895  8d86cafe             lea ax, [bp - 0x136]
5:4899  16                   push ss
5:489A  50                   push ax
5:489B  8d86cefe             lea ax, [bp - 0x132]
5:489F  16                   push ss
5:48A0  50                   push ax
5:48A1  66ff364857           push dword ptr [0x5748]  ; g_sim
5:48A6  9a08836145           lcall 0x4561, 0x8308  ; sub_s7:8308
5:48AB  c49ed2fe             les bx, ptr [bp - 0x12e]
5:48AF  268b471e             mov ax, word ptr es:[bx + 0x1e]
5:48B3  8986cafe             mov word ptr [bp - 0x136], ax
loc_48B7:
5:48B7  c786dafe0000         mov word ptr [bp - 0x126], 0
loc_48BD:
5:48BD  ff760e               push word ptr [bp + 0xe]
5:48C0  ffb6dafe             push word ptr [bp - 0x126]
5:48C4  680004               push 0x400
5:48C7  9af1480000           lcall 0, 0x48f1  ; USER.CheckMenuItem
5:48CC  ff760e               push word ptr [bp + 0xe]
5:48CF  ffb6dafe             push word ptr [bp - 0x126]
5:48D3  680104               push 0x401
5:48D6  9a17490000           lcall 0, 0x4917  ; USER.EnableMenuItem
5:48DB  ff86dafe             inc word ptr [bp - 0x126]
5:48DF  83bedafe05           cmp word ptr [bp - 0x126], 5
5:48E4  7cd7                 jl 0x48bd
5:48E6  ff760e               push word ptr [bp + 0xe]
5:48E9  ffb6cafe             push word ptr [bp - 0x136]
5:48ED  680804               push 0x408
5:48F0  9affff0000           lcall 0, 0xffff  ; USER.CheckMenuItem
5:48F5  c786dafe0000         mov word ptr [bp - 0x126], 0
5:48FB  eb05                 jmp 0x4902
5:48FD  db 90
loc_48FE:
5:48FE  ff86dafe             inc word ptr [bp - 0x126]
loc_4902:
5:4902  8b86cefe             mov ax, word ptr [bp - 0x132]
5:4906  3986dafe             cmp word ptr [bp - 0x126], ax
5:490A  7f2c                 jg 0x4938
5:490C  ff760e               push word ptr [bp + 0xe]
5:490F  ffb6dafe             push word ptr [bp - 0x126]
5:4913  680004               push 0x400
5:4916  9a4d460000           lcall 0, 0x464d  ; USER.EnableMenuItem
5:491B  ebe1                 jmp 0x48fe
5:491D  db 90
loc_491E:
5:491E  ff760e               push word ptr [bp + 0xe]
5:4921  6a02                 push 2
5:4923  e9a3fe               jmp 0x47c9
loc_4926:
5:4926  48                   dec ax
5:4927  0f8479fe             je 0x47a4
5:492B  48                   dec ax
5:492C  0f84bafe             je 0x47ea
5:4930  48                   dec ax
5:4931  0f8423ff             je 0x4858
5:4935  48                   dec ax
5:4936  74e6                 je 0x491e
loc_4938:
5:4938  c9                   leave
5:4939  ca0a00               retf 0xa

; ---------------- sub_s5:493C size=2186 callers=0
;   apis: USER.SendMessage, USER.SetCapture, USER.SetCursor, USER.WinHelp
5:493C  c8540300             enter 0x354, 0
5:4940  8b460a               mov ax, word ptr [bp + 0xa]
5:4943  e98007               jmp 0x50c6
loc_4946:
5:4946  c45e06               les bx, ptr [bp + 6]
5:4949  2683bff40001         cmp word ptr es:[bx + 0xf4], 1
5:494F  0f856e08             jne 0x51c1
5:4953  26ffb7f200           push word ptr es:[bx + 0xf2]
5:4958  9a2c130000           lcall 0, 0x132c  ; USER.SetCursor
5:495D  c45e06               les bx, ptr [bp + 6]
5:4960  268987ee00           mov word ptr es:[bx + 0xee], ax
5:4965  26c787f4000300       mov word ptr es:[bx + 0xf4], 3
5:496C  26ff7708             push word ptr es:[bx + 8]
5:4970  9affff0000           lcall 0, 0xffff  ; USER.SetCapture
5:4975  c9                   leave
5:4976  ca0600               retf 6
5:4979  db 90
loc_497A:
5:497A  c45e06               les bx, ptr [bp + 6]
5:497D  26c49f0801           les bx, ptr es:[bx + 0x108]
5:4982  66268b4742           mov eax, dword ptr es:[bx + 0x42]
5:4987  268b5744             mov dx, word ptr es:[bx + 0x44]
5:498B  668946fc             mov dword ptr [bp - 4], eax
5:498F  8a46ff               mov al, byte ptr [bp - 1]
5:4992  2ae4                 sub ah, ah
5:4994  3c05                 cmp al, 5
5:4996  0f852708             jne 0x51c1
5:499A  52                   push dx
5:499B  ff76fc               push word ptr [bp - 4]
5:499E  66ff364857           push dword ptr [0x5748]  ; g_sim
5:49A3  9a4483f849           lcall 0x49f8, 0x8344  ; sub_s7:8344
5:49A8  8946ec               mov word ptr [bp - 0x14], ax
5:49AB  8956ee               mov word ptr [bp - 0x12], dx
5:49AE  a3685a               mov word ptr [0x5a68], ax
5:49B1  89166a5a             mov word ptr [0x5a6a], dx
5:49B5  6a27                 push 0x27
loc_49B7:
5:49B7  c45e06               les bx, ptr [bp + 6]
5:49BA  26ff7708             push word ptr es:[bx + 8]
5:49BE  66ff367c5b           push dword ptr [0x5b7c]
5:49C3  9a40af214b           lcall 0x4b21, 0xaf40  ; sub_s8:AF40
5:49C8  c9                   leave
5:49C9  ca0600               retf 6
loc_49CC:
5:49CC  c45e06               les bx, ptr [bp + 6]
5:49CF  26c49f0801           les bx, ptr es:[bx + 0x108]
5:49D4  66268b4742           mov eax, dword ptr es:[bx + 0x42]
5:49D9  268b5744             mov dx, word ptr es:[bx + 0x44]
5:49DD  668946e8             mov dword ptr [bp - 0x18], eax
5:49E1  8a46eb               mov al, byte ptr [bp - 0x15]
5:49E4  2ae4                 sub ah, ah
5:49E6  3c05                 cmp al, 5
5:49E8  0f85d507             jne 0x51c1
5:49EC  52                   push dx
5:49ED  ff76e8               push word ptr [bp - 0x18]
5:49F0  66ff364857           push dword ptr [0x5748]  ; g_sim
5:49F5  9a4483384a           lcall 0x4a38, 0x8344  ; sub_s7:8344
5:49FA  8946f4               mov word ptr [bp - 0xc], ax
5:49FD  8956f6               mov word ptr [bp - 0xa], dx
5:4A00  a30c5f               mov word ptr [0x5f0c], ax
5:4A03  89160e5f             mov word ptr [0x5f0e], dx
5:4A07  6a25                 push 0x25
5:4A09  ebac                 jmp 0x49b7
5:4A0B  db 90
loc_4A0C:
5:4A0C  c45e06               les bx, ptr [bp + 6]
5:4A0F  26c49f0801           les bx, ptr es:[bx + 0x108]
5:4A14  66268b4742           mov eax, dword ptr es:[bx + 0x42]
5:4A19  268b5744             mov dx, word ptr es:[bx + 0x44]
5:4A1D  668946e8             mov dword ptr [bp - 0x18], eax
5:4A21  8a46eb               mov al, byte ptr [bp - 0x15]
5:4A24  2ae4                 sub ah, ah
5:4A26  3c05                 cmp al, 5
5:4A28  0f859507             jne 0x51c1
5:4A2C  52                   push dx
5:4A2D  ff76e8               push word ptr [bp - 0x18]
5:4A30  66ff364857           push dword ptr [0x5748]  ; g_sim
5:4A35  9a44837a4b           lcall 0x4b7a, 0x8344  ; sub_s7:8344
5:4A3A  8946f4               mov word ptr [bp - 0xc], ax
5:4A3D  8956f6               mov word ptr [bp - 0xa], dx
5:4A40  a3165f               mov word ptr [0x5f16], ax
5:4A43  8916185f             mov word ptr [0x5f18], dx
5:4A47  6a26                 push 0x26
5:4A49  e96bff               jmp 0x49b7
loc_4A4C:
5:4A4C  c45e06               les bx, ptr [bp + 6]
5:4A4F  268b870a01           mov ax, word ptr es:[bx + 0x10a]
5:4A54  260b870801           or ax, word ptr es:[bx + 0x108]
5:4A59  0f846407             je 0x51c1
5:4A5D  26c49f0801           les bx, ptr es:[bx + 0x108]
5:4A62  268b5f2e             mov bx, word ptr es:[bx + 0x2e]
5:4A66  03db                 add bx, bx
5:4A68  8b87d242             mov ax, word ptr [bx + 0x42d2]
5:4A6C  8946e8               mov word ptr [bp - 0x18], ax
5:4A6F  0bc0                 or ax, ax
5:4A71  0f844c07             je 0x51c1
5:4A75  68f801               push 0x1f8
5:4A78  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:4A7D  9a0a83ae4a           lcall 0x4aae, 0x830a  ; sub_s3:830A
5:4A82  8946f0               mov word ptr [bp - 0x10], ax
5:4A85  8956f2               mov word ptr [bp - 0xe], dx
5:4A88  c45e06               les bx, ptr [bp + 6]
5:4A8B  26ff7708             push word ptr es:[bx + 8]
5:4A8F  52                   push dx
5:4A90  50                   push ax
5:4A91  6a01                 push 1
5:4A93  660fbf46e8           movsx eax, word ptr [bp - 0x18]
5:4A98  6650                 push eax
5:4A9A  9ad12b0000           lcall 0, 0x2bd1  ; USER.WinHelp
5:4A9F  c9                   leave
5:4AA0  ca0600               retf 6
5:4AA3  db 90
loc_4AA4:
5:4AA4  6a2f                 push 0x2f
5:4AA6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4AAB  9aba202d4b           lcall 0x4b2d, 0x20ba  ; sub_s3:20BA
5:4AB0  8946e8               mov word ptr [bp - 0x18], ax
5:4AB3  8956ea               mov word ptr [bp - 0x16], dx
5:4AB6  c45ee8               les bx, ptr [bp - 0x18]
5:4AB9  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:4ABE  268b5726             mov dx, word ptr es:[bx + 0x26]
5:4AC2  668946ec             mov dword ptr [bp - 0x14], eax
5:4AC6  8bc2                 mov ax, dx
5:4AC8  0b46ec               or ax, word ptr [bp - 0x14]
5:4ACB  7543                 jne 0x4b10
5:4ACD  68b400               push 0xb4
5:4AD0  9a9c17924b           lcall 0x4b92, 0x179c  ; operator_new@s1:179C
5:4AD5  83c402               add sp, 2
5:4AD8  8946e0               mov word ptr [bp - 0x20], ax
5:4ADB  8956e2               mov word ptr [bp - 0x1e], dx
5:4ADE  0bd0                 or dx, ax
5:4AE0  741e                 je 0x4b00
5:4AE2  66687b053007         push 0x730057b
5:4AE8  666830000200         push 0x20030
5:4AEE  ff369603             push word ptr [0x396]
5:4AF2  ff76e2               push word ptr [bp - 0x1e]
5:4AF5  50                   push ax
5:4AF6  9a2085b84b           lcall 0x4bb8, 0x8520  ; sub_s9:8520
5:4AFB  83c40e               add sp, 0xe
5:4AFE  eb03                 jmp 0x4b03
loc_4B00:
5:4B00  33c0                 xor ax, ax
5:4B02  99                   cdq
loc_4B03:
5:4B03  8946e4               mov word ptr [bp - 0x1c], ax
5:4B06  8956e6               mov word ptr [bp - 0x1a], dx
5:4B09  52                   push dx
5:4B0A  c45ee4               les bx, ptr [bp - 0x1c]
5:4B0D  e94f01               jmp 0x4c5f
loc_4B10:
5:4B10  6a0e                 push 0xe
5:4B12  c45e06               les bx, ptr [bp + 6]
5:4B15  26ff7708             push word ptr es:[bx + 8]
5:4B19  66ff367c5b           push dword ptr [0x5b7c]
5:4B1E  9a40af7d4c           lcall 0x4c7d, 0xaf40  ; sub_s8:AF40
5:4B23  6a43                 push 0x43
5:4B25  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4B2A  9aba20fa4b           lcall 0x4bfa, 0x20ba  ; sub_s3:20BA
5:4B2F  8946f0               mov word ptr [bp - 0x10], ax
5:4B32  8956f2               mov word ptr [bp - 0xe], dx
5:4B35  c45ef0               les bx, ptr [bp - 0x10]
5:4B38  268b470a             mov ax, word ptr es:[bx + 0xa]
5:4B3C  8946f4               mov word ptr [bp - 0xc], ax
5:4B3F  268b470c             mov ax, word ptr es:[bx + 0xc]
5:4B43  8946f8               mov word ptr [bp - 8], ax
5:4B46  268b470e             mov ax, word ptr es:[bx + 0xe]
5:4B4A  8946fc               mov word ptr [bp - 4], ax
5:4B4D  26837f1000           cmp word ptr es:[bx + 0x10], 0
5:4B52  0f856b06             jne 0x51c1
5:4B56  ff76f4               push word ptr [bp - 0xc]
5:4B59  ff76f8               push word ptr [bp - 8]
5:4B5C  50                   push ax
5:4B5D  66ff76ec             push dword ptr [bp - 0x14]
5:4B61  8d86c6fe             lea ax, [bp - 0x13a]
5:4B65  16                   push ss
5:4B66  50                   push ax
5:4B67  9aca84ea4b           lcall 0x4bea, 0x84ca  ; SCForceMorale@s6:84CA
loc_4B6C:
5:4B6C  8d86c6fe             lea ax, [bp - 0x13a]
5:4B70  16                   push ss
5:4B71  50                   push ax
5:4B72  66ff364857           push dword ptr [0x5748]  ; g_sim
5:4B77  9a5a83ae4c           lcall 0x4cae, 0x835a  ; Sim::enqueue@s7:835A
5:4B7C  c786c6fe9a38         mov word ptr [bp - 0x13a], 0x389a
5:4B82  c786c8feca4c         mov word ptr [bp - 0x138], 0x4cca  ; SEGMENT s2:0000
5:4B88  c9                   leave
5:4B89  ca0600               retf 6
loc_4B8C:
5:4B8C  68b400               push 0xb4
5:4B8F  9a9c17244c           lcall 0x4c24, 0x179c  ; operator_new@s1:179C
5:4B94  83c402               add sp, 2
5:4B97  8946e0               mov word ptr [bp - 0x20], ax
5:4B9A  8956e2               mov word ptr [bp - 0x1e], dx
5:4B9D  0bd0                 or dx, ax
5:4B9F  741f                 je 0x4bc0
5:4BA1  66687b052b06         push 0x62b057b
5:4BA7  666831000200         push 0x20031
5:4BAD  ff369603             push word ptr [0x396]
5:4BB1  ff76e2               push word ptr [bp - 0x1e]
5:4BB4  50                   push ax
5:4BB5  9a20854a4c           lcall 0x4c4a, 0x8520  ; sub_s9:8520
5:4BBA  83c40e               add sp, 0xe
5:4BBD  eb04                 jmp 0x4bc3
5:4BBF  db 90
loc_4BC0:
5:4BC0  33c0                 xor ax, ax
5:4BC2  99                   cdq
loc_4BC3:
5:4BC3  8986befe             mov word ptr [bp - 0x142], ax
5:4BC7  8996c0fe             mov word ptr [bp - 0x140], dx
5:4BCB  52                   push dx
5:4BCC  c49ebefe             les bx, ptr [bp - 0x142]
5:4BD0  50                   push ax
5:4BD1  26c41f               les bx, ptr es:[bx]
5:4BD4  26ff5f74             lcall es:[bx + 0x74]
5:4BD8  8986c2fe             mov word ptr [bp - 0x13e], ax
5:4BDC  48                   dec ax
5:4BDD  0f85e005             jne 0x51c1
5:4BE1  8d86c6fe             lea ax, [bp - 0x13a]
5:4BE5  16                   push ss
5:4BE6  50                   push ax
5:4BE7  9a7e83d918           lcall 0x18d9, 0x837e  ; SCFillResources@s6:837E
5:4BEC  e97dff               jmp 0x4b6c
5:4BEF  db 90
loc_4BF0:
5:4BF0  6a2f                 push 0x2f
5:4BF2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4BF7  9aba20894c           lcall 0x4c89, 0x20ba  ; sub_s3:20BA
5:4BFC  8986befe             mov word ptr [bp - 0x142], ax
5:4C00  8996c0fe             mov word ptr [bp - 0x140], dx
5:4C04  c49ebefe             les bx, ptr [bp - 0x142]
5:4C08  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:4C0D  268b5726             mov dx, word ptr es:[bx + 0x26]
5:4C11  668986c2fe           mov dword ptr [bp - 0x13e], eax
5:4C16  8bc2                 mov ax, dx
5:4C18  0b86c2fe             or ax, word ptr [bp - 0x13e]
5:4C1C  754e                 jne 0x4c6c
5:4C1E  68b400               push 0xb4
5:4C21  9a9c179445           lcall 0x4594, 0x179c  ; operator_new@s1:179C
5:4C26  83c402               add sp, 2
5:4C29  8946e0               mov word ptr [bp - 0x20], ax
5:4C2C  8956e2               mov word ptr [bp - 0x1e], dx
5:4C2F  0bd0                 or dx, ax
5:4C31  741f                 je 0x4c52
5:4C33  66687b053007         push 0x730057b
5:4C39  666830000200         push 0x20030
5:4C3F  ff369603             push word ptr [0x396]
5:4C43  ff76e2               push word ptr [bp - 0x1e]
5:4C46  50                   push ax
5:4C47  9a20858f3a           lcall 0x3a8f, 0x8520  ; sub_s9:8520
5:4C4C  83c40e               add sp, 0xe
5:4C4F  eb04                 jmp 0x4c55
5:4C51  db 90
loc_4C52:
5:4C52  33c0                 xor ax, ax
5:4C54  99                   cdq
loc_4C55:
5:4C55  8946dc               mov word ptr [bp - 0x24], ax
5:4C58  8956de               mov word ptr [bp - 0x22], dx
5:4C5B  52                   push dx
5:4C5C  c45edc               les bx, ptr [bp - 0x24]
loc_4C5F:
5:4C5F  50                   push ax
5:4C60  26c41f               les bx, ptr es:[bx]
5:4C63  26ff5f74             lcall es:[bx + 0x74]
5:4C67  c9                   leave
5:4C68  ca0600               retf 6
5:4C6B  db 90
loc_4C6C:
5:4C6C  6a0f                 push 0xf
5:4C6E  c45e06               les bx, ptr [bp + 6]
5:4C71  26ff7708             push word ptr es:[bx + 8]
5:4C75  66ff367c5b           push dword ptr [0x5b7c]
5:4C7A  9a40af1f3c           lcall 0x3c1f, 0xaf40  ; sub_s8:AF40
5:4C7F  6a42                 push 0x42
5:4C81  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4C86  9aba20de4c           lcall 0x4cde, 0x20ba  ; sub_s3:20BA
5:4C8B  8986c6fe             mov word ptr [bp - 0x13a], ax
5:4C8F  8996c8fe             mov word ptr [bp - 0x138], dx
5:4C93  c49ec6fe             les bx, ptr [bp - 0x13a]
5:4C97  268b470a             mov ax, word ptr es:[bx + 0xa]
5:4C9B  8946d8               mov word ptr [bp - 0x28], ax
5:4C9E  0bc0                 or ax, ax
5:4CA0  0f841d05             je 0x51c1
5:4CA4  50                   push ax
5:4CA5  8d86b4fd             lea ax, [bp - 0x24c]
5:4CA9  16                   push ss
5:4CAA  50                   push ax
5:4CAB  9a3ee6be4c           lcall 0x4cbe, 0xe63e  ; SCKillColony@s7:E63E
5:4CB0  8d86b4fd             lea ax, [bp - 0x24c]
5:4CB4  16                   push ss
5:4CB5  50                   push ax
5:4CB6  66ff364857           push dword ptr [0x5748]  ; g_sim
5:4CBB  9a5a83a948           lcall 0x48a9, 0x835a  ; Sim::enqueue@s7:835A
5:4CC0  c786b4fd9a38         mov word ptr [bp - 0x24c], 0x389a
5:4CC6  c786b6fdf045         mov word ptr [bp - 0x24a], 0x45f0  ; SEGMENT s2:0000
5:4CCC  e9f204               jmp 0x51c1
5:4CCF  db 90
loc_4CD0:
5:4CD0  666803002200         push 0x220003
5:4CD6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4CDB  9aba201345           lcall 0x4513, 0x20ba  ; sub_s3:20BA
5:4CE0  8986b4fd             mov word ptr [bp - 0x24c], ax
5:4CE4  8996b6fd             mov word ptr [bp - 0x24a], dx
5:4CE8  52                   push dx
5:4CE9  50                   push ax
5:4CEA  9a66af074e           lcall 0x4e07, 0xaf66  ; sub_s3:AF66
5:4CEF  8986befe             mov word ptr [bp - 0x142], ax
5:4CF3  0bc0                 or ax, ax
5:4CF5  0f848b00             je 0x4d84
5:4CF9  68b400               push 0xb4
5:4CFC  9a9c178a4d           lcall 0x4d8a, 0x179c  ; operator_new@s1:179C
5:4D01  83c402               add sp, 2
5:4D04  8946e0               mov word ptr [bp - 0x20], ax
5:4D07  8956e2               mov word ptr [bp - 0x1e], dx
5:4D0A  0bd0                 or dx, ax
5:4D0C  741e                 je 0x4d2c
5:4D0E  66687b052c06         push 0x62c057b
5:4D14  666831000200         push 0x20031
5:4D1A  ff369603             push word ptr [0x396]
5:4D1E  ff76e2               push word ptr [bp - 0x1e]
5:4D21  50                   push ax
5:4D22  9a2085b04d           lcall 0x4db0, 0x8520  ; sub_s9:8520
5:4D27  83c40e               add sp, 0xe
5:4D2A  eb03                 jmp 0x4d2f
loc_4D2C:
5:4D2C  33c0                 xor ax, ax
5:4D2E  99                   cdq
loc_4D2F:
5:4D2F  8986c2fe             mov word ptr [bp - 0x13e], ax
5:4D33  8996c4fe             mov word ptr [bp - 0x13c], dx
5:4D37  52                   push dx
5:4D38  c49ec2fe             les bx, ptr [bp - 0x13e]
5:4D3C  50                   push ax
5:4D3D  26c41f               les bx, ptr es:[bx]
5:4D40  26ff5f74             lcall es:[bx + 0x74]
5:4D44  8986c6fe             mov word ptr [bp - 0x13a], ax
5:4D48  48                   dec ax
5:4D49  0f857404             jne 0x51c1
5:4D4D  8d86acfc             lea ax, [bp - 0x354]
5:4D51  16                   push ss
5:4D52  50                   push ax
5:4D53  9a9ae7664d           lcall 0x4d66, 0xe79a  ; SCKillRebelColony@s7:E79A
5:4D58  8d86acfc             lea ax, [bp - 0x354]
5:4D5C  16                   push ss
5:4D5D  50                   push ax
5:4D5E  66ff364857           push dword ptr [0x5748]  ; g_sim
5:4D63  9a5a83a649           lcall 0x49a6, 0x835a  ; Sim::enqueue@s7:835A
5:4D68  68e601               push 0x1e6
5:4D6B  66ff36a002           push dword ptr [0x2a0]
5:4D70  9a5c5c7f4d           lcall 0x4d7f, 0x5c5c  ; sub_s2:5C5C
5:4D75  c786acfc9a38         mov word ptr [bp - 0x354], 0x389a
5:4D7B  c786aefc864b         mov word ptr [bp - 0x352], 0x4b86  ; SEGMENT s2:0000
5:4D81  e93d04               jmp 0x51c1
loc_4D84:
5:4D84  68b400               push 0xb4
5:4D87  9a9c17d34a           lcall 0x4ad3, 0x179c  ; operator_new@s1:179C
5:4D8C  83c402               add sp, 2
5:4D8F  8946e0               mov word ptr [bp - 0x20], ax
5:4D92  8956e2               mov word ptr [bp - 0x1e], dx
5:4D95  0bd0                 or dx, ax
5:4D97  741f                 je 0x4db8
5:4D99  66687b053107         push 0x731057b
5:4D9F  666830000200         push 0x20030
5:4DA5  ff369603             push word ptr [0x396]
5:4DA9  ff76e2               push word ptr [bp - 0x1e]
5:4DAC  50                   push ax
5:4DAD  9a2085f94a           lcall 0x4af9, 0x8520  ; sub_s9:8520
5:4DB2  83c40e               add sp, 0xe
5:4DB5  eb04                 jmp 0x4dbb
5:4DB7  db 90
loc_4DB8:
5:4DB8  33c0                 xor ax, ax
5:4DBA  99                   cdq
loc_4DBB:
5:4DBB  8986acfc             mov word ptr [bp - 0x354], ax
5:4DBF  8996aefc             mov word ptr [bp - 0x352], dx
5:4DC3  52                   push dx
5:4DC4  c49eacfc             les bx, ptr [bp - 0x354]
5:4DC8  e994fe               jmp 0x4c5f
5:4DCB  db 90
loc_4DCC:
5:4DCC  66ff7606             push dword ptr [bp + 6]
5:4DD0  90                   nop
5:4DD1  0e                   push cs
5:4DD2  e8db07               call 0x55b0  ; sub_s5:55B0
5:4DD5  e9e903               jmp 0x51c1
loc_4DD8:
5:4DD8  c45e06               les bx, ptr [bp + 6]
5:4DDB  2683bf160100         cmp word ptr es:[bx + 0x116], 0
5:4DE1  7430                 je 0x4e13
5:4DE3  8cc0                 mov ax, es
5:4DE5  0bc3                 or ax, bx
5:4DE7  7409                 je 0x4df2
5:4DE9  8bc3                 mov ax, bx
5:4DEB  8cc2                 mov dx, es
5:4DED  05e200               add ax, 0xe2
5:4DF0  eb03                 jmp 0x4df5
loc_4DF2:
5:4DF2  33c0                 xor ax, ax
5:4DF4  99                   cdq
loc_4DF5:
5:4DF5  8986acfc             mov word ptr [bp - 0x354], ax
5:4DF9  8996aefc             mov word ptr [bp - 0x352], dx
5:4DFD  52                   push dx
5:4DFE  50                   push ax
5:4DFF  66ff36a002           push dword ptr [0x2a0]
5:4E04  9aa61e634e           lcall 0x4e63, 0x1ea6  ; sub_s3:1EA6
5:4E09  c45e06               les bx, ptr [bp + 6]
5:4E0C  26c78716010000       mov word ptr es:[bx + 0x116], 0
loc_4E13:
5:4E13  6a12                 push 0x12  ; 'version %d %d'
5:4E15  e99ffb               jmp 0x49b7
loc_4E18:
5:4E18  6a00                 push 0
5:4E1A  eb0e                 jmp 0x4e2a
loc_4E1C:
5:4E1C  6a01                 push 1
5:4E1E  eb0a                 jmp 0x4e2a
loc_4E20:
5:4E20  6a02                 push 2
5:4E22  eb06                 jmp 0x4e2a
loc_4E24:
5:4E24  6a03                 push 3
5:4E26  eb02                 jmp 0x4e2a
loc_4E28:
5:4E28  6a04                 push 4
loc_4E2A:
5:4E2A  66ff7606             push dword ptr [bp + 6]
5:4E2E  90                   nop
5:4E2F  0e                   push cs
5:4E30  e83109               call 0x5764  ; sub_s5:5764
5:4E33  e98b03               jmp 0x51c1
loc_4E36:
5:4E36  6668ffff0100         push 0x1ffff
5:4E3C  666a00               push 0
5:4E3F  66ff7606             push dword ptr [bp + 6]
5:4E43  90                   nop
5:4E44  0e                   push cs
5:4E45  e82605               call 0x536e  ; sub_s5:536E
5:4E48  e97603               jmp 0x51c1
5:4E4B  db 90
loc_4E4C:
5:4E4C  666a00               push 0
5:4E4F  666800000900         push 0x90000
5:4E55  6a00                 push 0
5:4E57  c45e06               les bx, ptr [bp + 6]
5:4E5A  6626ffb70e01         push dword ptr es:[bx + 0x10e]
5:4E60  9a0073de4f           lcall 0x4fde, 0x7300  ; sub_s3:7300
5:4E65  e95903               jmp 0x51c1
loc_4E68:
5:4E68  8d86b4fd             lea ax, [bp - 0x24c]
5:4E6C  16                   push ss
5:4E6D  50                   push ax
5:4E6E  8d8ebefe             lea cx, [bp - 0x142]
5:4E72  16                   push ss
5:4E73  51                   push cx
5:4E74  66ff7606             push dword ptr [bp + 6]
5:4E78  90                   nop
5:4E79  0e                   push cs
5:4E7A  e84713               call 0x61c4  ; sub_s5:61C4
5:4E7D  8b86b4fd             mov ax, word ptr [bp - 0x24c]
5:4E81  056a00               add ax, 0x6a
loc_4E84:
5:4E84  8986c2fe             mov word ptr [bp - 0x13e], ax
5:4E88  3d6d00               cmp ax, 0x6d
5:4E8B  0f8f3203             jg 0x51c1
5:4E8F  3d6900               cmp ax, 0x69
5:4E92  0f8c2b03             jl 0x51c1
5:4E96  50                   push ax
5:4E97  c45e06               les bx, ptr [bp + 6]
5:4E9A  06                   push es
5:4E9B  53                   push bx
5:4E9C  26c41f               les bx, ptr es:[bx]
5:4E9F  26ff5f40             lcall es:[bx + 0x40]
5:4EA3  e91b03               jmp 0x51c1
loc_4EA6:
5:4EA6  8d86b4fd             lea ax, [bp - 0x24c]
5:4EAA  16                   push ss
5:4EAB  50                   push ax
5:4EAC  8d8ebefe             lea cx, [bp - 0x142]
5:4EB0  16                   push ss
5:4EB1  51                   push cx
5:4EB2  66ff7606             push dword ptr [bp + 6]
5:4EB6  90                   nop
5:4EB7  0e                   push cs
5:4EB8  e80913               call 0x61c4  ; sub_s5:61C4
5:4EBB  8b86b4fd             mov ax, word ptr [bp - 0x24c]
5:4EBF  056800               add ax, 0x68
5:4EC2  ebc0                 jmp 0x4e84
loc_4EC4:
5:4EC4  6a02                 push 2
5:4EC6  c45e06               les bx, ptr [bp + 6]
5:4EC9  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4ECF  90                   nop
5:4ED0  0e                   push cs
5:4ED1  e80016               call 0x64d4  ; sub_s5:64D4
5:4ED4  0bc0                 or ax, ax
5:4ED6  0f84e702             je 0x51c1
5:4EDA  6a07                 push 7
5:4EDC  e9d8fa               jmp 0x49b7
5:4EDF  db 90
loc_4EE0:
5:4EE0  6a03                 push 3
5:4EE2  c45e06               les bx, ptr [bp + 6]
5:4EE5  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4EEB  90                   nop
5:4EEC  0e                   push cs
5:4EED  e8e415               call 0x64d4  ; sub_s5:64D4
5:4EF0  0bc0                 or ax, ax
5:4EF2  0f84cb02             je 0x51c1
5:4EF6  6aff                 push -1
loc_4EF8:
5:4EF8  6a00                 push 0
loc_4EFA:
5:4EFA  c45e06               les bx, ptr [bp + 6]
5:4EFD  6626ffb7ce00         push dword ptr es:[bx + 0xce]
5:4F03  90                   nop
5:4F04  0e                   push cs
5:4F05  e88cdb               call 0x2a94  ; sub_s5:2A94
5:4F08  e9b602               jmp 0x51c1
5:4F0B  db 90
loc_4F0C:
5:4F0C  6a03                 push 3
5:4F0E  c45e06               les bx, ptr [bp + 6]
5:4F11  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4F17  90                   nop
5:4F18  0e                   push cs
5:4F19  e8b815               call 0x64d4  ; sub_s5:64D4
5:4F1C  0bc0                 or ax, ax
5:4F1E  0f849f02             je 0x51c1
5:4F22  6668ffff0000         push 0xffff
5:4F28  ebd0                 jmp 0x4efa
loc_4F2A:
5:4F2A  6a03                 push 3
5:4F2C  c45e06               les bx, ptr [bp + 6]
5:4F2F  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4F35  90                   nop
5:4F36  0e                   push cs
5:4F37  e89a15               call 0x64d4  ; sub_s5:64D4
5:4F3A  0bc0                 or ax, ax
5:4F3C  0f848102             je 0x51c1
5:4F40  6a01                 push 1
5:4F42  ebb4                 jmp 0x4ef8
loc_4F44:
5:4F44  6a03                 push 3
5:4F46  c45e06               les bx, ptr [bp + 6]
5:4F49  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4F4F  90                   nop
5:4F50  0e                   push cs
5:4F51  e88015               call 0x64d4  ; sub_s5:64D4
5:4F54  0bc0                 or ax, ax
5:4F56  0f846702             je 0x51c1
5:4F5A  666a01               push 1
5:4F5D  eb9b                 jmp 0x4efa
5:4F5F  db 90
loc_4F60:
5:4F60  6a03                 push 3
5:4F62  c45e06               les bx, ptr [bp + 6]
5:4F65  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4F6B  90                   nop
5:4F6C  0e                   push cs
5:4F6D  e86415               call 0x64d4  ; sub_s5:64D4
5:4F70  0bc0                 or ax, ax
5:4F72  0f844b02             je 0x51c1
5:4F76  6afb                 push -5
5:4F78  e97dff               jmp 0x4ef8
5:4F7B  db 90
loc_4F7C:
5:4F7C  6a03                 push 3
5:4F7E  c45e06               les bx, ptr [bp + 6]
5:4F81  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4F87  90                   nop
5:4F88  0e                   push cs
5:4F89  e84815               call 0x64d4  ; sub_s5:64D4
5:4F8C  0bc0                 or ax, ax
5:4F8E  0f842f02             je 0x51c1
5:4F92  6668fbff0000         push 0xfffb
5:4F98  e95fff               jmp 0x4efa
5:4F9B  db 90
loc_4F9C:
5:4F9C  6a03                 push 3
5:4F9E  c45e06               les bx, ptr [bp + 6]
5:4FA1  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4FA7  90                   nop
5:4FA8  0e                   push cs
5:4FA9  e82815               call 0x64d4  ; sub_s5:64D4
5:4FAC  0bc0                 or ax, ax
5:4FAE  0f840f02             je 0x51c1
5:4FB2  6a05                 push 5
5:4FB4  e941ff               jmp 0x4ef8
5:4FB7  db 90
loc_4FB8:
5:4FB8  6a03                 push 3
5:4FBA  c45e06               les bx, ptr [bp + 6]
5:4FBD  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:4FC3  90                   nop
5:4FC4  0e                   push cs
5:4FC5  e80c15               call 0x64d4  ; sub_s5:64D4
5:4FC8  0bc0                 or ax, ax
5:4FCA  0f84f301             je 0x51c1
5:4FCE  666a05               push 5
5:4FD1  e926ff               jmp 0x4efa
loc_4FD4:
5:4FD4  6a45                 push 0x45
5:4FD6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:4FDB  9aba20f44f           lcall 0x4ff4, 0x20ba  ; sub_s3:20BA
5:4FE0  8986b4fd             mov word ptr [bp - 0x24c], ax
5:4FE4  8996b6fd             mov word ptr [bp - 0x24a], dx
5:4FE8  c45e06               les bx, ptr [bp + 6]
5:4FEB  26ff7708             push word ptr es:[bx + 8]
5:4FEF  52                   push dx
5:4FF0  50                   push ax
5:4FF1  9abe013e50           lcall 0x503e, 0x1be  ; sub_s3:01BE
5:4FF6  e9c801               jmp 0x51c1
5:4FF9  db 90
loc_4FFA:
5:4FFA  6a02                 push 2
5:4FFC  c45e06               les bx, ptr [bp + 6]
5:4FFF  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5005  90                   nop
5:5006  0e                   push cs
5:5007  e8ca14               call 0x64d4  ; sub_s5:64D4
5:500A  0bc0                 or ax, ax
5:500C  0f84b101             je 0x51c1
5:5010  6a1a                 push 0x1a
5:5012  e9a2f9               jmp 0x49b7
5:5015  db 90
loc_5016:
5:5016  c45e06               les bx, ptr [bp + 6]
5:5019  26c49f0201           les bx, ptr es:[bx + 0x102]
5:501E  26ff7708             push word ptr es:[bx + 8]
5:5022  666872001101         push 0x1110072
5:5028  666a00               push 0
5:502B  9a232a0000           lcall 0, 0x2a23  ; USER.SendMessage
5:5030  e98e01               jmp 0x51c1
5:5033  db 90
loc_5034:
5:5034  6a03                 push 3
5:5036  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:503B  9aba204d50           lcall 0x504d, 0x20ba  ; sub_s3:20BA
5:5040  8986befe             mov word ptr [bp - 0x142], ax
5:5044  8996c0fe             mov word ptr [bp - 0x140], dx
5:5048  52                   push dx
5:5049  50                   push ax
5:504A  9a34c26c50           lcall 0x506c, 0xc234  ; sub_s3:C234
5:504F  8986c2fe             mov word ptr [bp - 0x13e], ax
5:5053  8996c4fe             mov word ptr [bp - 0x13c], dx
5:5057  0bd0                 or dx, ax
5:5059  0f846401             je 0x51c1
5:505D  ffb6c4fe             push word ptr [bp - 0x13c]
5:5061  50                   push ax
5:5062  6a30                 push 0x30
5:5064  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5069  9aba207b50           lcall 0x507b, 0x20ba  ; sub_s3:20BA
5:506E  8986c6fe             mov word ptr [bp - 0x13a], ax
5:5072  8996c8fe             mov word ptr [bp - 0x138], dx
5:5076  52                   push dx
5:5077  50                   push ax
5:5078  9a70378c50           lcall 0x508c, 0x3770  ; sub_s3:3770
5:507D  6a03                 push 3
5:507F  e935f9               jmp 0x49b7
loc_5082:
5:5082  6a03                 push 3
5:5084  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5089  9aba20804a           lcall 0x4a80, 0x20ba  ; sub_s3:20BA
5:508E  8986befe             mov word ptr [bp - 0x142], ax
5:5092  8996c0fe             mov word ptr [bp - 0x140], dx
5:5096  6a30                 push 0x30
5:5098  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:509D  9aba20af50           lcall 0x50af, 0x20ba  ; sub_s3:20BA
5:50A2  8986c2fe             mov word ptr [bp - 0x13e], ax
5:50A6  8996c4fe             mov word ptr [bp - 0x13c], dx
5:50AA  52                   push dx
5:50AB  50                   push ax
5:50AC  9a5e37bb50           lcall 0x50bb, 0x375e  ; sub_s3:375E
5:50B1  52                   push dx
5:50B2  50                   push ax
5:50B3  66ffb6befe           push dword ptr [bp - 0x142]
5:50B8  9a5ec2ed4c           lcall 0x4ced, 0xc25e  ; sub_s3:C25E
5:50BD  e90101               jmp 0x51c1
loc_50C0:
5:50C0  6a13                 push 0x13
5:50C2  e9f2f8               jmp 0x49b7
5:50C5  db 90
loc_50C6:
5:50C6  3de900               cmp ax, 0xe9
5:50C9  0f84f400             je 0x51c1
5:50CD  7733                 ja 0x5102
5:50CF  2d6900               sub ax, 0x69
5:50D2  3d0f00               cmp ax, 0xf
5:50D5  0f87e800             ja 0x51c1
5:50D9  03c0                 add ax, ax
5:50DB  93                   xchg bx, ax
5:50DC  2effa7e250           jmp word ptr cs:[bx + 0x50e2]
5:50E1  db 90
switch_table_50E2:
    dw loc_4E18
    dw loc_4E1C
    dw loc_4E20
    dw loc_4E24
    dw loc_4E28
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_4A4C
    dw loc_4FD4
loc_5102:
5:5102  3d3201               cmp ax, 0x132
5:5105  0f84d7fd             je 0x4ee0
5:5109  776b                 ja 0x5176
5:510B  3d0201               cmp ax, 0x102
5:510E  0f847afa             je 0x4b8c
5:5112  7736                 ja 0x514a
5:5114  2df000               sub ax, 0xf0
5:5117  3d1100               cmp ax, 0x11
5:511A  0f87a300             ja 0x51c1
5:511E  03c0                 add ax, ax
5:5120  93                   xchg bx, ax
5:5121  2effa72651           jmp word ptr cs:[bx + 0x5126]
switch_table_5126:
    dw loc_4E36
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_4DD8
    dw loc_4E4C
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_5082
    dw loc_4DCC
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_51C1
    dw loc_4AA4
loc_514A:
5:514A  3d0601               cmp ax, 0x106
5:514D  0f846fff             je 0x50c0
5:5151  770f                 ja 0x5162
5:5153  2d0301               sub ax, 0x103
5:5156  0f8496fa             je 0x4bf0
5:515A  48                   dec ax
5:515B  0f8471fb             je 0x4cd0
5:515F  eb60                 jmp 0x51c1
5:5161  db 90
loc_5162:
5:5162  2d2f01               sub ax, 0x12f
5:5165  0f84fffc             je 0x4e68
5:5169  48                   dec ax
5:516A  0f8438fd             je 0x4ea6
5:516E  48                   dec ax
5:516F  0f8451fd             je 0x4ec4
5:5173  eb4c                 jmp 0x51c1
5:5175  db 90
loc_5176:
5:5176  3dc801               cmp ax, 0x1c8
5:5179  0f8499fe             je 0x5016
5:517D  7725                 ja 0x51a4
5:517F  2d3301               sub ax, 0x133
5:5182  3d0900               cmp ax, 9
5:5185  773a                 ja 0x51c1
5:5187  03c0                 add ax, ax
5:5189  93                   xchg bx, ax
5:518A  2effa79051           jmp word ptr cs:[bx + 0x5190]
5:518F  db 90
switch_table_5190:
    dw loc_4F0C
    dw loc_4F2A
    dw loc_4F44
    dw loc_4F60
    dw loc_4F7C
    dw loc_4F9C
    dw loc_4FB8
    dw loc_51C1
    dw loc_51C1
    dw loc_4FFA
loc_51A4:
5:51A4  2dca01               sub ax, 0x1ca
5:51A7  0f8489fe             je 0x5034
5:51AB  2d3600               sub ax, 0x36
5:51AE  0f841af8             je 0x49cc
5:51B2  48                   dec ax
5:51B3  0f8455f8             je 0x4a0c
5:51B7  48                   dec ax
5:51B8  0f84bef7             je 0x497a
5:51BC  48                   dec ax
5:51BD  0f8485f7             je 0x4946
loc_51C1:
5:51C1  c9                   leave
5:51C2  ca0600               retf 6
5:51C5  db 00

; ---------------- sub_s5:51C6 FAR size=104 callers=0
5:51C6  55                   push bp
5:51C7  8bec                 mov bp, sp
5:51C9  c45e06               les bx, ptr [bp + 6]
5:51CC  268b87f400           mov ax, word ptr es:[bx + 0xf4]
5:51D1  48                   dec ax
5:51D2  48                   dec ax
5:51D3  7405                 je 0x51da
5:51D5  48                   dec ax
5:51D6  7414                 je 0x51ec
5:51D8  eb24                 jmp 0x51fe
loc_51DA:
5:51DA  66ff760c             push dword ptr [bp + 0xc]
5:51DE  ff760a               push word ptr [bp + 0xa]
5:51E1  06                   push es
5:51E2  53                   push bx
5:51E3  90                   nop
5:51E4  0e                   push cs
5:51E5  e88e0c               call 0x5e76  ; sub_s5:5E76
5:51E8  c9                   leave
5:51E9  ca0a00               retf 0xa
loc_51EC:
5:51EC  66ff760c             push dword ptr [bp + 0xc]
5:51F0  ff760a               push word ptr [bp + 0xa]
5:51F3  06                   push es
5:51F4  53                   push bx
5:51F5  90                   nop
5:51F6  0e                   push cs
5:51F7  e8ee0b               call 0x5de8  ; sub_s5:5DE8
5:51FA  c9                   leave
5:51FB  ca0a00               retf 0xa
loc_51FE:
5:51FE  66ff760c             push dword ptr [bp + 0xc]
5:5202  ff760a               push word ptr [bp + 0xa]
5:5205  06                   push es
5:5206  53                   push bx
5:5207  90                   nop
5:5208  0e                   push cs
5:5209  e8c206               call 0x58ce  ; sub_s5:58CE
5:520C  0bc0                 or ax, ax
5:520E  751a                 jne 0x522a
5:5210  66ff760c             push dword ptr [bp + 0xc]
5:5214  ff760a               push word ptr [bp + 0xa]
5:5217  c45e06               les bx, ptr [bp + 6]
5:521A  6626ff7704           push dword ptr es:[bx + 4]
5:521F  26c45f04             les bx, ptr es:[bx + 4]
5:5223  26c41f               les bx, ptr es:[bx]
5:5226  26ff5f5c             lcall es:[bx + 0x5c]
loc_522A:
5:522A  c9                   leave
5:522B  ca0a00               retf 0xa

; ---------------- sub_s5:522E size=176 callers=0
;   apis: USER.ReleaseCapture, USER.SetCursor
5:522E  c8040000             enter 4, 0
5:5232  c45e06               les bx, ptr [bp + 6]
5:5235  268b87f400           mov ax, word ptr es:[bx + 0xf4]
5:523A  48                   dec ax
5:523B  48                   dec ax
5:523C  7444                 je 0x5282
5:523E  48                   dec ax
5:523F  756d                 jne 0x52ae
5:5241  26ffb7ee00           push word ptr es:[bx + 0xee]
5:5246  9a88520000           lcall 0, 0x5288  ; USER.SetCursor
5:524B  c45e06               les bx, ptr [bp + 6]
5:524E  26c787ee000000       mov word ptr es:[bx + 0xee], 0
5:5255  26c787f4000100       mov word ptr es:[bx + 0xf4], 1
5:525C  26c7870c010000       mov word ptr es:[bx + 0x10c], 0
5:5263  9aa5520000           lcall 0, 0x52a5  ; USER.ReleaseCapture
5:5268  666a00               push 0
5:526B  6a47                 push 0x47
5:526D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5272  9aba20a050           lcall 0x50a0, 0x20ba  ; sub_s3:20BA
5:5277  52                   push dx
5:5278  50                   push ax
5:5279  9ae657b047           lcall 0x47b0, 0x57e6  ; sub_s4:57E6
5:527E  c9                   leave
5:527F  ca0a00               retf 0xa
loc_5282:
5:5282  26ffb7ee00           push word ptr es:[bx + 0xee]
5:5287  9a59490000           lcall 0, 0x4959  ; USER.SetCursor
5:528C  c45e06               les bx, ptr [bp + 6]
5:528F  26c787ee000000       mov word ptr es:[bx + 0xee], 0
5:5296  26c787f4000100       mov word ptr es:[bx + 0xf4], 1
5:529D  26c7870c010000       mov word ptr es:[bx + 0x10c], 0
5:52A4  9affff0000           lcall 0, 0xffff  ; USER.ReleaseCapture
5:52A9  c9                   leave
5:52AA  ca0a00               retf 0xa
5:52AD  db 90
loc_52AE:
5:52AE  66ff760c             push dword ptr [bp + 0xc]
5:52B2  ff760a               push word ptr [bp + 0xa]
5:52B5  06                   push es
5:52B6  53                   push bx
5:52B7  90                   nop
5:52B8  0e                   push cs
5:52B9  e83609               call 0x5bf2  ; sub_s5:5BF2
5:52BC  0bc0                 or ax, ax
5:52BE  751a                 jne 0x52da
5:52C0  66ff760c             push dword ptr [bp + 0xc]
5:52C4  ff760a               push word ptr [bp + 0xa]
5:52C7  c45e06               les bx, ptr [bp + 6]
5:52CA  6626ff7704           push dword ptr es:[bx + 4]
5:52CF  26c45f04             les bx, ptr es:[bx + 4]
5:52D3  26c41f               les bx, ptr es:[bx]
5:52D6  26ff5f60             lcall es:[bx + 0x60]
loc_52DA:
5:52DA  c9                   leave
5:52DB  ca0a00               retf 0xa

; ---------------- sub_s5:52DE size=144 callers=0
5:52DE  c80c0000             enter 0xc, 0
5:52E2  c45e06               les bx, ptr [bp + 6]
5:52E5  268b87f600           mov ax, word ptr es:[bx + 0xf6]
5:52EA  268b97f800           mov dx, word ptr es:[bx + 0xf8]
5:52EF  8bda                 mov bx, dx
5:52F1  0bd8                 or bx, ax
5:52F3  740e                 je 0x5303
5:52F5  6a01                 push 1
5:52F7  52                   push dx
5:52F8  50                   push ax
5:52F9  8ec2                 mov es, dx
5:52FB  8bd8                 mov bx, ax
5:52FD  26c41f               les bx, ptr es:[bx]
5:5300  26ff1f               lcall es:[bx]
loc_5303:
5:5303  c45e06               les bx, ptr [bp + 6]
5:5306  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
5:5310  662683bffa0000       cmp dword ptr es:[bx + 0xfa], 0
5:5317  7424                 je 0x533d
5:5319  8cc0                 mov ax, es
5:531B  0bc3                 or ax, bx
5:531D  740b                 je 0x532a
5:531F  8b4606               mov ax, word ptr [bp + 6]
5:5322  8b5608               mov dx, word ptr [bp + 8]
5:5325  05e200               add ax, 0xe2
5:5328  eb03                 jmp 0x532d
loc_532A:
5:532A  33c0                 xor ax, ax
5:532C  99                   cdq
loc_532D:
5:532D  52                   push dx
5:532E  50                   push ax
5:532F  c45e06               les bx, ptr [bp + 6]
5:5332  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:5338  9aa61e5b53           lcall 0x535b, 0x1ea6  ; sub_s3:1EA6
loc_533D:
5:533D  66ff7606             push dword ptr [bp + 6]
5:5341  9a8e62734d           lcall 0x4d73, 0x628e  ; sub_s2:628E
5:5346  c45e06               les bx, ptr [bp + 6]
5:5349  662683bffa0000       cmp dword ptr es:[bx + 0xfa], 0
5:5350  740b                 je 0x535d
5:5352  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:5358  9ada1d7552           lcall 0x5275, 0x1dda  ; sub_s3:1DDA
loc_535D:
5:535D  c45e06               les bx, ptr [bp + 6]
5:5360  6626c787fa0000000000 mov dword ptr es:[bx + 0xfa], 0
5:536A  c9                   leave
5:536B  ca0400               retf 4

; ---------------- sub_s5:536E FAR size=578 callers=3
;   apis: USER.BringWindowToTop
5:536E  c8180000             enter 0x18, 0
5:5372  57                   push di
5:5373  56                   push si
5:5374  8b4610               mov ax, word ptr [bp + 0x10]
5:5377  e92002               jmp 0x559a
loc_537A:
5:537A  c45e06               les bx, ptr [bp + 6]
5:537D  662683bffe0000       cmp dword ptr es:[bx + 0xfe], 0
5:5384  0f852102             jne 0x55a9
5:5388  68fc00               push 0xfc
5:538B  9a9c174454           lcall 0x5444, 0x179c  ; operator_new@s1:179C
5:5390  83c402               add sp, 2
5:5393  8946fc               mov word ptr [bp - 4], ax
5:5396  8956fe               mov word ptr [bp - 2], dx
5:5399  0bd0                 or dx, ax
5:539B  7427                 je 0x53c4
5:539D  c45e06               les bx, ptr [bp + 6]
5:53A0  26ff87cc00           inc word ptr es:[bx + 0xcc]
5:53A5  06                   push es
5:53A6  53                   push bx
5:53A7  26ffb7cc00           push word ptr es:[bx + 0xcc]
5:53AC  66ff76fc             push dword ptr [bp - 4]
5:53B0  90                   nop
5:53B1  0e                   push cs
5:53B2  e81914               call 0x67ce  ; sub_s5:67CE
5:53B5  c45e06               les bx, ptr [bp + 6]
5:53B8  268987fe00           mov word ptr es:[bx + 0xfe], ax
5:53BD  2689970001           mov word ptr es:[bx + 0x100], dx
5:53C2  eb0d                 jmp 0x53d1
loc_53C4:
5:53C4  c45e06               les bx, ptr [bp + 6]
5:53C7  6626c787fe0000000000 mov dword ptr es:[bx + 0xfe], 0
loc_53D1:
5:53D1  c45e06               les bx, ptr [bp + 6]
5:53D4  6626ffb7fe00         push dword ptr es:[bx + 0xfe]
5:53DA  6a00                 push 0
5:53DC  06                   push es
5:53DD  53                   push bx
5:53DE  9a78699454           lcall 0x5494, 0x6978  ; sub_s2:6978
5:53E3  6a05                 push 5
5:53E5  c45e06               les bx, ptr [bp + 6]
5:53E8  6626ffb7fe00         push dword ptr es:[bx + 0xfe]
5:53EE  26c49ffe00           les bx, ptr es:[bx + 0xfe]
loc_53F3:
5:53F3  26c41f               les bx, ptr es:[bx]
5:53F6  26ff5f0c             lcall es:[bx + 0xc]
5:53FA  5e                   pop si
5:53FB  5f                   pop di
5:53FC  c9                   leave
5:53FD  ca0c00               retf 0xc
loc_5400:
5:5400  8b460e               mov ax, word ptr [bp + 0xe]
5:5403  050c00               add ax, 0xc
5:5406  8946fa               mov word ptr [bp - 6], ax
5:5409  50                   push ax
5:540A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:540F  9aba20fc54           lcall 0x54fc, 0x20ba  ; sub_s3:20BA
5:5414  8946f6               mov word ptr [bp - 0xa], ax
5:5417  8956f8               mov word ptr [bp - 8], dx
5:541A  52                   push dx
5:541B  50                   push ax
5:541C  9afa0abb54           lcall 0x54bb, 0xafa  ; sub_s4:0AFA
5:5421  0bc0                 or ax, ax
5:5423  0f858d00             jne 0x54b4
5:5427  c45e06               les bx, ptr [bp + 6]
5:542A  26ff87cc00           inc word ptr es:[bx + 0xcc]
5:542F  268b87cc00           mov ax, word ptr es:[bx + 0xcc]
5:5434  8946ec               mov word ptr [bp - 0x14], ax
5:5437  ff76fa               push word ptr [bp - 6]
5:543A  66ff760a             push dword ptr [bp + 0xa]
5:543E  68fe00               push 0xfe
5:5441  9a9c173255           lcall 0x5532, 0x179c  ; operator_new@s1:179C
5:5446  83c402               add sp, 2
5:5449  8946fc               mov word ptr [bp - 4], ax
5:544C  8956fe               mov word ptr [bp - 2], dx
5:544F  0bd0                 or dx, ax
5:5451  7413                 je 0x5466
5:5453  66ff7606             push dword ptr [bp + 6]
5:5457  ff76ec               push word ptr [bp - 0x14]
5:545A  ff76fe               push word ptr [bp - 2]
5:545D  50                   push ax
5:545E  90                   nop
5:545F  0e                   push cs
5:5460  e837d4               call 0x289a  ; sub_s5:289A
5:5463  eb04                 jmp 0x5469
5:5465  db 90
loc_5466:
5:5466  33c0                 xor ax, ax
5:5468  99                   cdq
loc_5469:
5:5469  8946f2               mov word ptr [bp - 0xe], ax
5:546C  8956f4               mov word ptr [bp - 0xc], dx
5:546F  52                   push dx
5:5470  50                   push ax
5:5471  90                   nop
5:5472  0e                   push cs
5:5473  e8d4d4               call 0x294a  ; sub_s5:294A
5:5476  c45ef2               les bx, ptr [bp - 0xe]
5:5479  06                   push es
5:547A  53                   push bx
5:547B  26c41f               les bx, ptr es:[bx]
5:547E  8bf3                 mov si, bx
5:5480  8cc7                 mov di, es
5:5482  26ff5f08             lcall es:[bx + 8]
5:5486  666a00               push 0
5:5489  66ff76f2             push dword ptr [bp - 0xe]
5:548D  66ff76f2             push dword ptr [bp - 0xe]
5:5491  9a0e3ea454           lcall 0x54a4, 0x3e0e  ; sub_s2:3E0E
5:5496  66ff76f2             push dword ptr [bp - 0xe]
5:549A  ff76ec               push word ptr [bp - 0x14]
5:549D  66ff7606             push dword ptr [bp + 6]
5:54A1  9a7869cd54           lcall 0x54cd, 0x6978  ; sub_s2:6978
5:54A6  6a01                 push 1
5:54A8  66ff76f2             push dword ptr [bp - 0xe]
5:54AC  8ec7                 mov es, di
5:54AE  26ff5c0c             lcall es:[si + 0xc]
5:54B2  eb1b                 jmp 0x54cf
loc_54B4:
5:54B4  66ff76f6             push dword ptr [bp - 0xa]
5:54B8  9ad40ad954           lcall 0x54d9, 0xad4  ; sub_s4:0AD4
5:54BD  8946f2               mov word ptr [bp - 0xe], ax
5:54C0  8956f4               mov word ptr [bp - 0xc], dx
5:54C3  666a00               push 0
5:54C6  52                   push dx
5:54C7  50                   push ax
5:54C8  52                   push dx
5:54C9  50                   push ax
5:54CA  9a0e3e8555           lcall 0x5585, 0x3e0e  ; sub_s2:3E0E
loc_54CF:
5:54CF  666a00               push 0
5:54D2  66ff76f6             push dword ptr [bp - 0xa]
5:54D6  9a62167c52           lcall 0x527c, 0x1662  ; sub_s4:1662
5:54DB  c45e06               les bx, ptr [bp + 6]
5:54DE  26c49fce00           les bx, ptr es:[bx + 0xce]
5:54E3  26ff7708             push word ptr es:[bx + 8]
5:54E7  9aca2a0000           lcall 0, 0x2aca  ; USER.BringWindowToTop
5:54EC  666801000400         push 0x40001
5:54F2  6a2b                 push 0x2b
5:54F4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:54F9  9aba200955           lcall 0x5509, 0x20ba  ; sub_s3:20BA
5:54FE  8946ee               mov word ptr [bp - 0x12], ax
5:5501  8956f0               mov word ptr [bp - 0x10], dx
5:5504  52                   push dx
5:5505  50                   push ax
5:5506  9a9e081855           lcall 0x5518, 0x89e  ; sub_s3:089E
5:550B  666801000300         push 0x30001
5:5511  66ff76ee             push dword ptr [bp - 0x12]
5:5515  9a9e083b53           lcall 0x533b, 0x89e  ; sub_s3:089E
5:551A  5e                   pop si
5:551B  5f                   pop di
5:551C  c9                   leave
5:551D  ca0c00               retf 0xc
loc_5520:
5:5520  c45e06               les bx, ptr [bp + 6]
5:5523  662683bf020100       cmp dword ptr es:[bx + 0x102], 0
5:552A  757d                 jne 0x55a9
5:552C  68fc00               push 0xfc
5:552F  9a9c17ff4c           lcall 0x4cff, 0x179c  ; operator_new@s1:179C
5:5534  83c402               add sp, 2
5:5537  8946fc               mov word ptr [bp - 4], ax
5:553A  8956fe               mov word ptr [bp - 2], dx
5:553D  0bd0                 or dx, ax
5:553F  7427                 je 0x5568
5:5541  c45e06               les bx, ptr [bp + 6]
5:5544  26ff87cc00           inc word ptr es:[bx + 0xcc]
5:5549  06                   push es
5:554A  53                   push bx
5:554B  26ffb7cc00           push word ptr es:[bx + 0xcc]
5:5550  66ff76fc             push dword ptr [bp - 4]
5:5554  90                   nop
5:5555  0e                   push cs
5:5556  e86bb8               call 0xdc4  ; sub_s5:0DC4
5:5559  c45e06               les bx, ptr [bp + 6]
5:555C  2689870201           mov word ptr es:[bx + 0x102], ax
5:5561  2689970401           mov word ptr es:[bx + 0x104], dx
5:5566  eb0d                 jmp 0x5575
loc_5568:
5:5568  c45e06               les bx, ptr [bp + 6]
5:556B  6626c787020100000000 mov dword ptr es:[bx + 0x102], 0
loc_5575:
5:5575  c45e06               les bx, ptr [bp + 6]
5:5578  6626ffb70201         push dword ptr es:[bx + 0x102]
5:557E  6a00                 push 0
5:5580  06                   push es
5:5581  53                   push bx
5:5582  9a78694453           lcall 0x5344, 0x6978  ; sub_s2:6978
5:5587  6a05                 push 5
5:5589  c45e06               les bx, ptr [bp + 6]
5:558C  6626ffb70201         push dword ptr es:[bx + 0x102]
5:5592  26c49f0201           les bx, ptr es:[bx + 0x102]
5:5597  e959fe               jmp 0x53f3
loc_559A:
5:559A  48                   dec ax
5:559B  0f84dbfd             je 0x537a
5:559F  48                   dec ax
5:55A0  0f845cfe             je 0x5400
5:55A4  48                   dec ax
5:55A5  0f8477ff             je 0x5520
loc_55A9:
5:55A9  5e                   pop si
5:55AA  5f                   pop di
5:55AB  c9                   leave
5:55AC  ca0c00               retf 0xc
5:55AF  db 00

; ---------------- sub_s5:55B0 FAR size=436 callers=1
;   apis: USER.PostMessage, USER.SendMessage
5:55B0  c8260100             enter 0x126, 0
5:55B4  6a02                 push 2
5:55B6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:55BB  9aba20da55           lcall 0x55da, 0x20ba  ; sub_s3:20BA
5:55C0  8946fc               mov word ptr [bp - 4], ax
5:55C3  8956fe               mov word ptr [bp - 2], dx
5:55C6  c45efc               les bx, ptr [bp - 4]
5:55C9  268b4720             mov ax, word ptr es:[bx + 0x20]
5:55CD  8946fa               mov word ptr [bp - 6], ax
5:55D0  6a37                 push 0x37
5:55D2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:55D7  9aba20f655           lcall 0x55f6, 0x20ba  ; sub_s3:20BA
5:55DC  8946f6               mov word ptr [bp - 0xa], ax
5:55DF  8956f8               mov word ptr [bp - 8], dx
5:55E2  689c05               push 0x59c
5:55E5  8d86f6fe             lea ax, [bp - 0x10a]
5:55E9  16                   push ss
5:55EA  50                   push ax
5:55EB  680001               push 0x100
5:55EE  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:55F3  9ae0841557           lcall 0x5715, 0x84e0  ; sub_s3:84E0
5:55F8  8d86f0fe             lea ax, [bp - 0x110]
5:55FC  16                   push ss
5:55FD  50                   push ax
5:55FE  9a36941c56           lcall 0x561c, 0x9436  ; sub_s2:9436
5:5603  8d86f4fe             lea ax, [bp - 0x10c]
5:5607  16                   push ss
5:5608  50                   push ax
5:5609  8d86f0fe             lea ax, [bp - 0x110]
5:560D  16                   push ss
5:560E  50                   push ax
5:560F  8d86eefe             lea ax, [bp - 0x112]
5:5613  16                   push ss
5:5614  50                   push ax
5:5615  66ff76f6             push dword ptr [bp - 0xa]
5:5619  9af4a8e153           lcall 0x53e1, 0xa8f4  ; sub_s2:A8F4
5:561E  8986eafe             mov word ptr [bp - 0x116], ax
5:5622  8996ecfe             mov word ptr [bp - 0x114], dx
5:5626  0bd0                 or dx, ax
5:5628  0f849800             je 0x56c4
5:562C  c49eeafe             les bx, ptr [bp - 0x116]
5:5630  26803f00             cmp byte ptr es:[bx], 0
5:5634  0f848c00             je 0x56c4
5:5638  68b400               push 0xb4
5:563B  9a9c178e53           lcall 0x538e, 0x179c  ; operator_new@s1:179C
5:5640  83c402               add sp, 2
5:5643  8986e2fe             mov word ptr [bp - 0x11e], ax
5:5647  8996e4fe             mov word ptr [bp - 0x11c], dx
5:564B  0bd0                 or dx, ax
5:564D  7421                 je 0x5670
5:564F  c45e06               les bx, ptr [bp + 6]
5:5652  26ff7708             push word ptr es:[bx + 8]
5:5656  66ffb6eafe           push dword ptr [bp - 0x116]
5:565B  8d86f6fe             lea ax, [bp - 0x10a]
5:565F  16                   push ss
5:5660  50                   push ax
5:5661  6a00                 push 0
5:5663  66ffb6e2fe           push dword ptr [bp - 0x11e]
5:5668  9a7884254d           lcall 0x4d25, 0x8478  ; sub_s9:8478
5:566D  eb04                 jmp 0x5673
5:566F  db 90
loc_5670:
5:5670  33c0                 xor ax, ax
5:5672  99                   cdq
loc_5673:
5:5673  8986e6fe             mov word ptr [bp - 0x11a], ax
5:5677  8996e8fe             mov word ptr [bp - 0x118], dx
5:567B  83bef2fe00           cmp word ptr [bp - 0x10e], 0
5:5680  7416                 je 0x5698
5:5682  8d86f0fe             lea ax, [bp - 0x110]
5:5686  16                   push ss
5:5687  50                   push ax
5:5688  c49ee6fe             les bx, ptr [bp - 0x11a]
5:568C  06                   push es
5:568D  53                   push bx
5:568E  26c41f               les bx, ptr es:[bx]
5:5691  26ff5f6c             lcall es:[bx + 0x6c]
5:5695  eb0e                 jmp 0x56a5
5:5697  db 90
loc_5698:
5:5698  52                   push dx
5:5699  c49ee6fe             les bx, ptr [bp - 0x11a]
5:569D  53                   push bx
5:569E  26c41f               les bx, ptr es:[bx]
5:56A1  26ff5f74             lcall es:[bx + 0x74]
loc_56A5:
5:56A5  837efa00             cmp word ptr [bp - 6], 0
5:56A9  7407                 je 0x56b2
5:56AB  83beeefe00           cmp word ptr [bp - 0x112], 0
5:56B0  7512                 jne 0x56c4
loc_56B2:
5:56B2  ff369603             push word ptr [0x396]
5:56B6  6668fc001101         push 0x11100fc
5:56BC  666a00               push 0
5:56BF  9a07570000           lcall 0, 0x5707  ; USER.PostMessage
loc_56C4:
5:56C4  837efa00             cmp word ptr [bp - 6], 0
5:56C8  7428                 je 0x56f2
5:56CA  83beeefe00           cmp word ptr [bp - 0x112], 0
5:56CF  7421                 je 0x56f2
5:56D1  ff369603             push word ptr [0x396]
5:56D5  681101               push 0x111
5:56D8  ffb6eefe             push word ptr [bp - 0x112]
5:56DC  666a00               push 0
5:56DF  9a2c500000           lcall 0, 0x502c  ; USER.SendMessage
5:56E4  c45e06               les bx, ptr [bp + 6]
5:56E7  26c78712010100       mov word ptr es:[bx + 0x112], 1
5:56EE  c9                   leave
5:56EF  ca0400               retf 4
loc_56F2:
5:56F2  83bef4fe06           cmp word ptr [bp - 0x10c], 6
5:56F7  7530                 jne 0x5729
5:56F9  ff369603             push word ptr [0x396]
5:56FD  6668b0001101         push 0x11100b0
5:5703  666a00               push 0
5:5706  9a3e570000           lcall 0, 0x573e  ; USER.PostMessage
5:570B  6a02                 push 2
5:570D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5712  9aba204c57           lcall 0x574c, 0x20ba  ; sub_s3:20BA
5:5717  8ec2                 mov es, dx
5:5719  8bd8                 mov bx, ax
5:571B  8986dcfe             mov word ptr [bp - 0x124], ax
5:571F  8c86defe             mov word ptr [bp - 0x122], es
5:5723  26c747200100         mov word ptr es:[bx + 0x20], 1
loc_5729:
5:5729  83bef4fe15           cmp word ptr [bp - 0x10c], 0x15
5:572E  7530                 jne 0x5760
5:5730  ff369603             push word ptr [0x396]
5:5734  666897001101         push 0x1110097  ; 'New failed in Op::Op->Simulator'
5:573A  666a00               push 0
5:573D  9ada430000           lcall 0, 0x43da  ; USER.PostMessage
5:5742  6a02                 push 2
5:5744  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5749  9aba201254           lcall 0x5412, 0x20ba  ; sub_s3:20BA
5:574E  8ec2                 mov es, dx
5:5750  8bd8                 mov bx, ax
5:5752  8986dcfe             mov word ptr [bp - 0x124], ax
5:5756  8c86defe             mov word ptr [bp - 0x122], es
5:575A  26c747200100         mov word ptr es:[bx + 0x20], 1
loc_5760:
5:5760  c9                   leave
5:5761  ca0400               retf 4

; ---------------- sub_s5:5764 FAR size=242 callers=1
;   apis: USER.LoadCursor, USER.PostMessage, USER.ReleaseCapture, USER.SetCursor
5:5764  c8180000             enter 0x18, 0
5:5768  6a2f                 push 0x2f
5:576A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:576F  9aba20be55           lcall 0x55be, 0x20ba  ; sub_s3:20BA
5:5774  8946fc               mov word ptr [bp - 4], ax
5:5777  8956fe               mov word ptr [bp - 2], dx
5:577A  c45efc               les bx, ptr [bp - 4]
5:577D  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:5782  268b5722             mov dx, word ptr es:[bx + 0x22]
5:5786  668946f8             mov dword ptr [bp - 8], eax
5:578A  8bc2                 mov ax, dx
5:578C  0b46f8               or ax, word ptr [bp - 8]
5:578F  0f84be00             je 0x5851
5:5793  52                   push dx
5:5794  ff76f8               push word ptr [bp - 8]
5:5797  8d46f6               lea ax, [bp - 0xa]
5:579A  16                   push ss
5:579B  50                   push ax
5:579C  8d46f4               lea ax, [bp - 0xc]
5:579F  16                   push ss
5:57A0  50                   push ax
5:57A1  66ff364857           push dword ptr [0x5748]  ; g_sim
5:57A6  9a0883564d           lcall 0x4d56, 0x8308  ; sub_s7:8308
5:57AB  8b460a               mov ax, word ptr [bp + 0xa]
5:57AE  3946f4               cmp word ptr [bp - 0xc], ax
5:57B1  0f8c9c00             jl 0x5851
5:57B5  c45e06               les bx, ptr [bp + 6]
5:57B8  2683bff40001         cmp word ptr es:[bx + 0xf4], 1
5:57BE  7427                 je 0x57e7
5:57C0  26ffb7ee00           push word ptr es:[bx + 0xee]
5:57C5  9af7570000           lcall 0, 0x57f7  ; USER.SetCursor
5:57CA  c45e06               les bx, ptr [bp + 6]
5:57CD  26c787ee000000       mov word ptr es:[bx + 0xee], 0
5:57D4  26c787f4000100       mov word ptr es:[bx + 0xf4], 1
5:57DB  26c7870c010000       mov word ptr es:[bx + 0x10c], 0
5:57E2  9a64520000           lcall 0, 0x5264  ; USER.ReleaseCapture
loc_57E7:
5:57E7  666a00               push 0
5:57EA  68027f               push 0x7f02
5:57ED  9a63420000           lcall 0, 0x4263  ; USER.LoadCursor
5:57F2  8946f2               mov word ptr [bp - 0xe], ax
5:57F5  50                   push ax
5:57F6  9a4d580000           lcall 0, 0x584d  ; USER.SetCursor
5:57FB  8946f0               mov word ptr [bp - 0x10], ax
5:57FE  ff760a               push word ptr [bp + 0xa]
5:5801  66ff76fc             push dword ptr [bp - 4]
5:5805  9a7c011f54           lcall 0x541f, 0x17c  ; sub_s4:017C
5:580A  c45e06               les bx, ptr [bp + 6]
5:580D  26c49ff600           les bx, ptr es:[bx + 0xf6]
5:5812  26c747100100         mov word ptr es:[bx + 0x10], 1
5:5818  c45e06               les bx, ptr [bp + 6]
5:581B  662683bffe0000       cmp dword ptr es:[bx + 0xfe], 0
5:5822  7425                 je 0x5849
5:5824  6626ffb7fe00         push dword ptr es:[bx + 0xfe]
5:582A  90                   nop
5:582B  0e                   push cs
5:582C  e8af10               call 0x68de  ; sub_s5:68DE
5:582F  c45e06               les bx, ptr [bp + 6]
5:5832  26c49ffe00           les bx, ptr es:[bx + 0xfe]
5:5837  26ff7708             push word ptr es:[bx + 8]
5:583B  6668eb001101         push 0x11100eb
5:5841  666a00               push 0
5:5844  9ac0560000           lcall 0, 0x56c0  ; USER.PostMessage
loc_5849:
5:5849  ff76f0               push word ptr [bp - 0x10]
5:584C  9a47520000           lcall 0, 0x5247  ; USER.SetCursor
loc_5851:
5:5851  c9                   leave
5:5852  ca0600               retf 6
5:5855  db 00

; ---------------- sub_s5:5856 FAR size=120 callers=4
;   apis: USER.PtInRect
5:5856  c81c0000             enter 0x1c, 0
5:585A  c45e06               les bx, ptr [bp + 6]
5:585D  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:5863  9a62280858           lcall 0x5808, 0x2862  ; sub_s4:2862
5:5868  8946fc               mov word ptr [bp - 4], ax
5:586B  8956fe               mov word ptr [bp - 2], dx
5:586E  0bd0                 or dx, ax
5:5870  7508                 jne 0x587a
loc_5872:
5:5872  33c0                 xor ax, ax
5:5874  99                   cdq
5:5875  c9                   leave
5:5876  ca0800               retf 8
5:5879  db 90
loc_587A:
5:587A  66c746f800000000     mov dword ptr [bp - 8], 0
5:5882  eb04                 jmp 0x5888
loc_5884:
5:5884  66ff46f8             inc dword ptr [bp - 8]
loc_5888:
5:5888  668b46f8             mov eax, dword ptr [bp - 8]
5:588C  8b56fa               mov dx, word ptr [bp - 6]
5:588F  c45efc               les bx, ptr [bp - 4]
5:5892  662639470a           cmp dword ptr es:[bx + 0xa], eax
5:5897  76d9                 jbe 0x5872
5:5899  52                   push dx
5:589A  50                   push ax
5:589B  06                   push es
5:589C  53                   push bx
5:589D  9ac48f0156           lcall 0x5601, 0x8fc4  ; sub_s2:8FC4
5:58A2  8946f0               mov word ptr [bp - 0x10], ax
5:58A5  8956f2               mov word ptr [bp - 0xe], dx
5:58A8  0bd0                 or dx, ax
5:58AA  74d8                 je 0x5884
5:58AC  8b56f2               mov dx, word ptr [bp - 0xe]
5:58AF  051400               add ax, 0x14
5:58B2  52                   push dx
5:58B3  50                   push ax
5:58B4  c45e0a               les bx, ptr [bp + 0xa]
5:58B7  6626ff37             push dword ptr es:[bx]
5:58BB  9affff0000           lcall 0, 0xffff  ; USER.PtInRect
5:58C0  0bc0                 or ax, ax
5:58C2  74c0                 je 0x5884
5:58C4  8b46f0               mov ax, word ptr [bp - 0x10]
5:58C7  8b56f2               mov dx, word ptr [bp - 0xe]
5:58CA  c9                   leave
5:58CB  ca0800               retf 8

; ---------------- sub_s5:58CE FAR size=804 callers=1
;   apis: USER.PostMessage, USER.PtInRect
5:58CE  c8320000             enter 0x32, 0
5:58D2  8b460c               mov ax, word ptr [bp + 0xc]
5:58D5  8946fc               mov word ptr [bp - 4], ax
5:58D8  8b460a               mov ax, word ptr [bp + 0xa]
5:58DB  8946fe               mov word ptr [bp - 2], ax
5:58DE  8a460e               mov al, byte ptr [bp + 0xe]
5:58E1  250800               and ax, 8
5:58E4  8946fa               mov word ptr [bp - 6], ax
5:58E7  8a460e               mov al, byte ptr [bp + 0xe]
5:58EA  250400               and ax, 4
5:58ED  8946f8               mov word ptr [bp - 8], ax
5:58F0  6a02                 push 2
5:58F2  c45e06               les bx, ptr [bp + 6]
5:58F5  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:58FB  90                   nop
5:58FC  0e                   push cs
5:58FD  e8d40b               call 0x64d4  ; sub_s5:64D4
5:5900  0bc0                 or ax, ax
5:5902  743e                 je 0x5942
5:5904  6a02                 push 2
5:5906  c45e06               les bx, ptr [bp + 6]
5:5909  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:590F  90                   nop
5:5910  0e                   push cs
5:5911  e8840b               call 0x6498  ; sub_s5:6498
5:5914  8946f4               mov word ptr [bp - 0xc], ax
5:5917  8956f6               mov word ptr [bp - 0xa], dx
5:591A  52                   push dx
5:591B  50                   push ax
5:591C  66ff76fc             push dword ptr [bp - 4]
5:5920  9a75590000           lcall 0, 0x5975  ; USER.PtInRect
5:5925  0bc0                 or ax, ax
5:5927  7419                 je 0x5942
5:5929  ff369603             push word ptr [0x396]
5:592D  666868001101         push 0x1110068
loc_5933:
5:5933  666a00               push 0
loc_5936:
5:5936  9a45580000           lcall 0, 0x5845  ; USER.PostMessage
loc_593B:
5:593B  b80100               mov ax, 1
5:593E  c9                   leave
5:593F  ca0a00               retf 0xa
loc_5942:
5:5942  6a04                 push 4
5:5944  c45e06               les bx, ptr [bp + 6]
5:5947  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:594D  90                   nop
5:594E  0e                   push cs
5:594F  e8820b               call 0x64d4  ; sub_s5:64D4
5:5952  0bc0                 or ax, ax
5:5954  0f84be00             je 0x5a16
5:5958  6a04                 push 4
5:595A  c45e06               les bx, ptr [bp + 6]
5:595D  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5963  90                   nop
5:5964  0e                   push cs
5:5965  e8300b               call 0x6498  ; sub_s5:6498
5:5968  8946f4               mov word ptr [bp - 0xc], ax
5:596B  8956f6               mov word ptr [bp - 0xa], dx
5:596E  52                   push dx
5:596F  50                   push ax
5:5970  66ff76fc             push dword ptr [bp - 4]
5:5974  9aba5a0000           lcall 0, 0x5aba  ; USER.PtInRect
5:5979  0bc0                 or ax, ax
5:597B  0f849700             je 0x5a16
5:597F  6a02                 push 2
5:5981  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5986  9aba209e5b           lcall 0x5b9e, 0x20ba  ; sub_s3:20BA
5:598B  8946f0               mov word ptr [bp - 0x10], ax
5:598E  8956f2               mov word ptr [bp - 0xe], dx
5:5991  c45ef0               les bx, ptr [bp - 0x10]
5:5994  26837f7200           cmp word ptr es:[bx + 0x72], 0
5:5999  746d                 je 0x5a08
5:599B  c45e06               les bx, ptr [bp + 6]
5:599E  26c78716010100       mov word ptr es:[bx + 0x116], 1
5:59A5  8cc0                 mov ax, es
5:59A7  0bc3                 or ax, bx
5:59A9  740b                 je 0x59b6
5:59AB  8b4606               mov ax, word ptr [bp + 6]
5:59AE  8b5608               mov dx, word ptr [bp + 8]
5:59B1  05e200               add ax, 0xe2
5:59B4  eb03                 jmp 0x59b9
loc_59B6:
5:59B6  33c0                 xor ax, ax
5:59B8  99                   cdq
loc_59B9:
5:59B9  8946e4               mov word ptr [bp - 0x1c], ax
5:59BC  8956e6               mov word ptr [bp - 0x1a], dx
5:59BF  52                   push dx
5:59C0  50                   push ax
5:59C1  6a10                 push 0x10
5:59C3  c41ea002             les bx, ptr [0x2a0]
5:59C7  06                   push es
5:59C8  53                   push bx
5:59C9  26c41f               les bx, ptr es:[bx]
5:59CC  26ff5f04             lcall es:[bx + 4]
5:59D0  666801008600         push 0x860001
5:59D6  8d46ea               lea ax, [bp - 0x16]
5:59D9  16                   push ss
5:59DA  50                   push ax
5:59DB  9a1a94ed59           lcall 0x59ed, 0x941a  ; sub_s2:941A
5:59E0  8d46ea               lea ax, [bp - 0x16]
5:59E3  16                   push ss
5:59E4  50                   push ax
5:59E5  66ff36a002           push dword ptr [0x2a0]
5:59EA  9a9e5c7e5b           lcall 0x5b7e, 0x5c9e  ; sub_s2:5C9E
5:59EF  8946e8               mov word ptr [bp - 0x18], ax
5:59F2  0bc0                 or ax, ax
5:59F4  0f8543ff             jne 0x593b
5:59F8  ff369603             push word ptr [0x396]
5:59FC  6668f6001101         push 0x11100f6
5:5A02  50                   push ax
5:5A03  50                   push ax
5:5A04  e92fff               jmp 0x5936
5:5A07  db 90
loc_5A08:
5:5A08  ff369603             push word ptr [0x396]
5:5A0C  6668f6001101         push 0x11100f6
5:5A12  e91eff               jmp 0x5933
5:5A15  db 90
loc_5A16:
5:5A16  6a01                 push 1
5:5A18  c45e06               les bx, ptr [bp + 6]
5:5A1B  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5A21  90                   nop
5:5A22  0e                   push cs
5:5A23  e8ae0a               call 0x64d4  ; sub_s5:64D4
5:5A26  0bc0                 or ax, ax
5:5A28  0f84b400             je 0x5ae0
5:5A2C  6a01                 push 1
5:5A2E  c45e06               les bx, ptr [bp + 6]
5:5A31  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5A37  90                   nop
5:5A38  0e                   push cs
5:5A39  e85c0a               call 0x6498  ; sub_s5:6498
5:5A3C  8946e4               mov word ptr [bp - 0x1c], ax
5:5A3F  8956e6               mov word ptr [bp - 0x1a], dx
5:5A42  c746e80000           mov word ptr [bp - 0x18], 0
5:5A47  eb58                 jmp 0x5aa1
5:5A49  db 90
loc_5A4A:
5:5A4A  837ef801             cmp word ptr [bp - 8], 1
5:5A4E  1bc0                 sbb ax, ax
5:5A50  250400               and ax, 4
5:5A53  05fbff               add ax, 0xfffb
loc_5A56:
5:5A56  8946ee               mov word ptr [bp - 0x12], ax
loc_5A59:
5:5A59  ff76ea               push word ptr [bp - 0x16]
5:5A5C  ff76ee               push word ptr [bp - 0x12]
5:5A5F  c45e06               les bx, ptr [bp + 6]
5:5A62  6626ffb7ce00         push dword ptr es:[bx + 0xce]
5:5A68  90                   nop
5:5A69  0e                   push cs
5:5A6A  e827d0               call 0x2a94  ; sub_s5:2A94
5:5A6D  e9cbfe               jmp 0x593b
loc_5A70:
5:5A70  837ef801             cmp word ptr [bp - 8], 1
5:5A74  1bc0                 sbb ax, ax
5:5A76  24fc                 and al, 0xfc
5:5A78  050500               add ax, 5
5:5A7B  ebd9                 jmp 0x5a56
5:5A7D  db 90
loc_5A7E:
5:5A7E  837ef801             cmp word ptr [bp - 8], 1
5:5A82  1bc0                 sbb ax, ax
5:5A84  250400               and ax, 4
5:5A87  05fbff               add ax, 0xfffb
loc_5A8A:
5:5A8A  8946ea               mov word ptr [bp - 0x16], ax
5:5A8D  ebca                 jmp 0x5a59
5:5A8F  db 90
loc_5A90:
5:5A90  837ef801             cmp word ptr [bp - 8], 1
5:5A94  1bc0                 sbb ax, ax
5:5A96  24fc                 and al, 0xfc
5:5A98  050500               add ax, 5
5:5A9B  ebed                 jmp 0x5a8a
5:5A9D  db 90
loc_5A9E:
5:5A9E  ff46e8               inc word ptr [bp - 0x18]
loc_5AA1:
5:5AA1  837ee804             cmp word ptr [bp - 0x18], 4
5:5AA5  7d39                 jge 0x5ae0
5:5AA7  8b46e8               mov ax, word ptr [bp - 0x18]
5:5AAA  c1e003               shl ax, 3
5:5AAD  0346e4               add ax, word ptr [bp - 0x1c]
5:5AB0  8b56e6               mov dx, word ptr [bp - 0x1a]
5:5AB3  52                   push dx
5:5AB4  50                   push ax
5:5AB5  66ff76fc             push dword ptr [bp - 4]
5:5AB9  9abc580000           lcall 0, 0x58bc  ; USER.PtInRect
5:5ABE  0bc0                 or ax, ax
5:5AC0  74dc                 je 0x5a9e
5:5AC2  33c0                 xor ax, ax
5:5AC4  8946ea               mov word ptr [bp - 0x16], ax
5:5AC7  8946ee               mov word ptr [bp - 0x12], ax
5:5ACA  8b46e8               mov ax, word ptr [bp - 0x18]
5:5ACD  0bc0                 or ax, ax
5:5ACF  0f8477ff             je 0x5a4a
5:5AD3  48                   dec ax
5:5AD4  749a                 je 0x5a70
5:5AD6  48                   dec ax
5:5AD7  74a5                 je 0x5a7e
5:5AD9  48                   dec ax
5:5ADA  74b4                 je 0x5a90
5:5ADC  e97aff               jmp 0x5a59
5:5ADF  db 90
loc_5AE0:
5:5AE0  6a03                 push 3
5:5AE2  c45e06               les bx, ptr [bp + 6]
5:5AE5  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5AEB  90                   nop
5:5AEC  0e                   push cs
5:5AED  e8e409               call 0x64d4  ; sub_s5:64D4
5:5AF0  0bc0                 or ax, ax
5:5AF2  0f84f600             je 0x5bec
5:5AF6  8d46fc               lea ax, [bp - 4]
5:5AF9  16                   push ss
5:5AFA  50                   push ax
5:5AFB  66ff7606             push dword ptr [bp + 6]
5:5AFF  90                   nop
5:5B00  0e                   push cs
5:5B01  e852fd               call 0x5856  ; sub_s5:5856
5:5B04  8946e4               mov word ptr [bp - 0x1c], ax
5:5B07  8956e6               mov word ptr [bp - 0x1a], dx
5:5B0A  0bd0                 or dx, ax
5:5B0C  0f84dc00             je 0x5bec
5:5B10  c45ee4               les bx, ptr [bp - 0x1c]
5:5B13  268b472e             mov ax, word ptr es:[bx + 0x2e]
5:5B17  8946e8               mov word ptr [bp - 0x18], ax
5:5B1A  c746ea0000           mov word ptr [bp - 0x16], 0
5:5B1F  837efa00             cmp word ptr [bp - 6], 0
5:5B23  740d                 je 0x5b32
5:5B25  837ef800             cmp word ptr [bp - 8], 0
5:5B29  7407                 je 0x5b32
loc_5B2B:
5:5B2B  c746ea0200           mov word ptr [bp - 0x16], 2
5:5B30  eb0b                 jmp 0x5b3d
loc_5B32:
5:5B32  837ef800             cmp word ptr [bp - 8], 0
5:5B36  75f3                 jne 0x5b2b
5:5B38  c746ea0100           mov word ptr [bp - 0x16], 1
loc_5B3D:
5:5B3D  c45ee4               les bx, ptr [bp - 0x1c]
5:5B40  268b470c             mov ax, word ptr es:[bx + 0xc]
5:5B44  8946ee               mov word ptr [bp - 0x12], ax
5:5B47  268b470e             mov ax, word ptr es:[bx + 0xe]
5:5B4B  8946f0               mov word ptr [bp - 0x10], ax
5:5B4E  837ee80b             cmp word ptr [bp - 0x18], 0xb
5:5B52  7406                 je 0x5b5a
5:5B54  837ee837             cmp word ptr [bp - 0x18], 0x37
5:5B58  7562                 jne 0x5bbc
loc_5B5A:
5:5B5A  c45e06               les bx, ptr [bp + 6]
5:5B5D  26c49ffa00           les bx, ptr es:[bx + 0xfa]
5:5B62  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:5B67  268b5722             mov dx, word ptr es:[bx + 0x22]
5:5B6B  668946d4             mov dword ptr [bp - 0x2c], eax
5:5B6F  8bc2                 mov ax, dx
5:5B71  0b46d4               or ax, word ptr [bp - 0x2c]
5:5B74  7446                 je 0x5bbc
5:5B76  8d46ce               lea ax, [bp - 0x32]
5:5B79  16                   push ss
5:5B7A  50                   push ax
5:5B7B  9a383ea058           lcall 0x58a0, 0x3e38  ; sub_s2:3E38
5:5B80  ff76ee               push word ptr [bp - 0x12]
5:5B83  ff76f0               push word ptr [bp - 0x10]
5:5B86  8d46ce               lea ax, [bp - 0x32]
5:5B89  16                   push ss
5:5B8A  50                   push ax
5:5B8B  66ff76d4             push dword ptr [bp - 0x2c]
5:5B8F  9a1c16d15b           lcall 0x5bd1, 0x161c  ; sub_s4:161C
5:5B94  6a2f                 push 0x2f
5:5B96  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5B9B  9aba20ba5b           lcall 0x5bba, 0x20ba  ; sub_s3:20BA
5:5BA0  8946dc               mov word ptr [bp - 0x24], ax
5:5BA3  8956de               mov word ptr [bp - 0x22], dx
5:5BA6  c45ed4               les bx, ptr [bp - 0x2c]
5:5BA9  6626ff773c           push dword ptr es:[bx + 0x3c]
5:5BAE  8d46ce               lea ax, [bp - 0x32]
5:5BB1  16                   push ss
5:5BB2  50                   push ax
5:5BB3  66ff76dc             push dword ptr [bp - 0x24]
5:5BB7  9ac6ec7257           lcall 0x5772, 0xecc6  ; sub_s3:ECC6
loc_5BBC:
5:5BBC  ff76ee               push word ptr [bp - 0x12]
5:5BBF  ff76f0               push word ptr [bp - 0x10]
5:5BC2  ff76ea               push word ptr [bp - 0x16]
5:5BC5  c45e06               les bx, ptr [bp + 6]
5:5BC8  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:5BCE  9ad2256658           lcall 0x5866, 0x25d2  ; sub_s4:25D2
5:5BD3  0bc0                 or ax, ax
5:5BD5  0f8562fd             jne 0x593b
5:5BD9  66ff76e4             push dword ptr [bp - 0x1c]
5:5BDD  66ff7606             push dword ptr [bp + 6]
5:5BE1  90                   nop
5:5BE2  0e                   push cs
5:5BE3  e87001               call 0x5d56  ; sub_s5:5D56
5:5BE6  0bc0                 or ax, ax
5:5BE8  0f854ffd             jne 0x593b
loc_5BEC:
5:5BEC  33c0                 xor ax, ax
5:5BEE  c9                   leave
5:5BEF  ca0a00               retf 0xa

; ---------------- sub_s5:5BF2 FAR size=356 callers=1
;   apis: USER.ClientToScreen, USER.GetSubMenu, USER.LoadMenu, USER.PostMessage, USER.PtInRect, USER.TrackPopupMenu
5:5BF2  c8120000             enter 0x12, 0
5:5BF6  8b460c               mov ax, word ptr [bp + 0xc]
5:5BF9  8946fc               mov word ptr [bp - 4], ax
5:5BFC  8b460a               mov ax, word ptr [bp + 0xa]
5:5BFF  8946fe               mov word ptr [bp - 2], ax
5:5C02  6a02                 push 2
5:5C04  c45e06               les bx, ptr [bp + 6]
5:5C07  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5C0D  90                   nop
5:5C0E  0e                   push cs
5:5C0F  e8c208               call 0x64d4  ; sub_s5:64D4
5:5C12  0bc0                 or ax, ax
5:5C14  743e                 je 0x5c54
5:5C16  6a02                 push 2
5:5C18  c45e06               les bx, ptr [bp + 6]
5:5C1B  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5C21  90                   nop
5:5C22  0e                   push cs
5:5C23  e87208               call 0x6498  ; sub_s5:6498
5:5C26  8946f8               mov word ptr [bp - 8], ax
5:5C29  8956fa               mov word ptr [bp - 6], dx
5:5C2C  52                   push dx
5:5C2D  50                   push ax
5:5C2E  66ff76fc             push dword ptr [bp - 4]
5:5C32  9a21590000           lcall 0, 0x5921  ; USER.PtInRect
5:5C37  0bc0                 or ax, ax
5:5C39  7419                 je 0x5c54
5:5C3B  ff369603             push word ptr [0x396]
5:5C3F  666831011101         push 0x1110131
5:5C45  666a00               push 0
5:5C48  9a37590000           lcall 0, 0x5937  ; USER.PostMessage
loc_5C4D:
5:5C4D  b80100               mov ax, 1
5:5C50  c9                   leave
5:5C51  ca0a00               retf 0xa
loc_5C54:
5:5C54  6a03                 push 3
5:5C56  c45e06               les bx, ptr [bp + 6]
5:5C59  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:5C5F  90                   nop
5:5C60  0e                   push cs
5:5C61  e87008               call 0x64d4  ; sub_s5:64D4
5:5C64  0bc0                 or ax, ax
5:5C66  0f84e600             je 0x5d50
5:5C6A  8d46fc               lea ax, [bp - 4]
5:5C6D  16                   push ss
5:5C6E  50                   push ax
5:5C6F  66ff7606             push dword ptr [bp + 6]
5:5C73  90                   nop
5:5C74  0e                   push cs
5:5C75  e8defb               call 0x5856  ; sub_s5:5856
5:5C78  c45e06               les bx, ptr [bp + 6]
5:5C7B  2689870801           mov word ptr es:[bx + 0x108], ax
5:5C80  2689970a01           mov word ptr es:[bx + 0x10a], dx
5:5C85  8bc2                 mov ax, dx
5:5C87  260b870801           or ax, word ptr es:[bx + 0x108]
5:5C8C  0f84c000             je 0x5d50
5:5C90  2683bf060100         cmp word ptr es:[bx + 0x106], 0
5:5C96  7534                 jne 0x5ccc
5:5C98  ff368c03             push word ptr [0x38c]
5:5C9C  1e                   push ds
5:5C9D  68f043               push 0x43f0  ; 'TILEMENU'
5:5CA0  9affff0000           lcall 0, 0xffff  ; USER.LoadMenu
5:5CA5  c45e06               les bx, ptr [bp + 6]
5:5CA8  2689870601           mov word ptr es:[bx + 0x106], ax
5:5CAD  0bc0                 or ax, ax
5:5CAF  749c                 je 0x5c4d
5:5CB1  c45e06               les bx, ptr [bp + 6]
5:5CB4  26ffb70601           push word ptr es:[bx + 0x106]
5:5CB9  6a00                 push 0
5:5CBB  9a5e460000           lcall 0, 0x465e  ; USER.GetSubMenu
5:5CC0  c45e06               les bx, ptr [bp + 6]
5:5CC3  2689870601           mov word ptr es:[bx + 0x106], ax
5:5CC8  0bc0                 or ax, ax
5:5CCA  7481                 je 0x5c4d
loc_5CCC:
5:5CCC  c45e06               les bx, ptr [bp + 6]
5:5CCF  26c49f0801           les bx, ptr es:[bx + 0x108]
5:5CD4  268b472e             mov ax, word ptr es:[bx + 0x2e]
5:5CD8  8946f8               mov word ptr [bp - 8], ax
5:5CDB  c746f60000           mov word ptr [bp - 0xa], 0
5:5CE0  3d4200               cmp ax, 0x42
5:5CE3  7507                 jne 0x5cec
5:5CE5  c746f6c900           mov word ptr [bp - 0xa], 0xc9
5:5CEA  eb10                 jmp 0x5cfc
loc_5CEC:
5:5CEC  8bd8                 mov bx, ax
5:5CEE  03d8                 add bx, ax
5:5CF0  83bfd24200           cmp word ptr [bx + 0x42d2], 0
5:5CF5  7505                 jne 0x5cfc
5:5CF7  c746f6c800           mov word ptr [bp - 0xa], 0xc8
loc_5CFC:
5:5CFC  837ef600             cmp word ptr [bp - 0xa], 0
5:5D00  740f                 je 0x5d11
5:5D02  ff76f6               push word ptr [bp - 0xa]
5:5D05  6a01                 push 1
5:5D07  66ff36a002           push dword ptr [0x2a0]
5:5D0C  9a7c5cde59           lcall 0x59de, 0x5c7c  ; sub_s2:5C7C
loc_5D11:
5:5D11  8b460c               mov ax, word ptr [bp + 0xc]
5:5D14  8946f2               mov word ptr [bp - 0xe], ax
5:5D17  8b460a               mov ax, word ptr [bp + 0xa]
5:5D1A  8946f4               mov word ptr [bp - 0xc], ax
5:5D1D  c45e06               les bx, ptr [bp + 6]
5:5D20  26ff7708             push word ptr es:[bx + 8]
5:5D24  8d46f2               lea ax, [bp - 0xe]
5:5D27  16                   push ss
5:5D28  50                   push ax
5:5D29  9affff0000           lcall 0, 0xffff  ; USER.ClientToScreen
5:5D2E  c45e06               les bx, ptr [bp + 6]
5:5D31  26ffb70601           push word ptr es:[bx + 0x106]
5:5D36  6a00                 push 0
5:5D38  ff76f2               push word ptr [bp - 0xe]
5:5D3B  ff76f4               push word ptr [bp - 0xc]
5:5D3E  6a00                 push 0
5:5D40  26ff7708             push word ptr es:[bx + 8]
5:5D44  666a00               push 0
5:5D47  9affff0000           lcall 0, 0xffff  ; USER.TrackPopupMenu
5:5D4C  e9fefe               jmp 0x5c4d
5:5D4F  db 90
loc_5D50:
5:5D50  33c0                 xor ax, ax
5:5D52  c9                   leave
5:5D53  ca0a00               retf 0xa

; ---------------- sub_s5:5D56 FAR size=146 callers=1
5:5D56  c8160000             enter 0x16, 0
5:5D5A  c45e0a               les bx, ptr [bp + 0xa]
5:5D5D  268b472e             mov ax, word ptr es:[bx + 0x2e]
5:5D61  8946fc               mov word ptr [bp - 4], ax
5:5D64  2d4700               sub ax, 0x47
5:5D67  7407                 je 0x5d70
5:5D69  2d2300               sub ax, 0x23
5:5D6C  744e                 je 0x5dbc
5:5D6E  eb6c                 jmp 0x5ddc
loc_5D70:
5:5D70  8d46f8               lea ax, [bp - 8]
5:5D73  16                   push ss
5:5D74  50                   push ax
5:5D75  8d4ef6               lea cx, [bp - 0xa]
5:5D78  16                   push ss
5:5D79  51                   push cx
5:5D7A  66ff7606             push dword ptr [bp + 6]
5:5D7E  90                   nop
5:5D7F  0e                   push cs
5:5D80  e84104               call 0x61c4  ; sub_s5:61C4
5:5D83  837ef800             cmp word ptr [bp - 8], 0
5:5D87  7511                 jne 0x5d9a
5:5D89  6a6a                 push 0x6a
loc_5D8B:
5:5D8B  c45e06               les bx, ptr [bp + 6]
5:5D8E  06                   push es
5:5D8F  53                   push bx
5:5D90  26c41f               les bx, ptr es:[bx]
5:5D93  26ff5f40             lcall es:[bx + 0x40]
5:5D97  eb1c                 jmp 0x5db5
5:5D99  db 90
loc_5D9A:
5:5D9A  8b46f8               mov ax, word ptr [bp - 8]
5:5D9D  3946f6               cmp word ptr [bp - 0xa], ax
5:5DA0  7e13                 jle 0x5db5
loc_5DA2:
5:5DA2  6a09                 push 9
5:5DA4  c45e06               les bx, ptr [bp + 6]
5:5DA7  26ff7708             push word ptr es:[bx + 8]
5:5DAB  66ff367c5b           push dword ptr [0x5b7c]
5:5DB0  9a40afc649           lcall 0x49c6, 0xaf40  ; sub_s8:AF40
loc_5DB5:
5:5DB5  c746fe0100           mov word ptr [bp - 2], 1
5:5DBA  eb25                 jmp 0x5de1
loc_5DBC:
5:5DBC  8d46f0               lea ax, [bp - 0x10]
5:5DBF  16                   push ss
5:5DC0  50                   push ax
5:5DC1  8d4ef4               lea cx, [bp - 0xc]
5:5DC4  16                   push ss
5:5DC5  51                   push cx
5:5DC6  66ff7606             push dword ptr [bp + 6]
5:5DCA  90                   nop
5:5DCB  0e                   push cs
5:5DCC  e8f503               call 0x61c4  ; sub_s5:61C4
5:5DCF  8b46f0               mov ax, word ptr [bp - 0x10]
5:5DD2  3946f4               cmp word ptr [bp - 0xc], ax
5:5DD5  7fcb                 jg 0x5da2
5:5DD7  683001               push 0x130  ; 'New failed in Op::Op->Simulator'
5:5DDA  ebaf                 jmp 0x5d8b
loc_5DDC:
5:5DDC  c746fe0000           mov word ptr [bp - 2], 0
loc_5DE1:
5:5DE1  8b46fe               mov ax, word ptr [bp - 2]
5:5DE4  c9                   leave
5:5DE5  ca0800               retf 8

; ---------------- sub_s5:5DE8 FAR size=142 callers=1
;   apis: USER.ReleaseCapture, USER.SetCursor
5:5DE8  c81c0000             enter 0x1c, 0
5:5DEC  9ae3570000           lcall 0, 0x57e3  ; USER.ReleaseCapture
5:5DF1  c45e06               les bx, ptr [bp + 6]
5:5DF4  26ffb7ee00           push word ptr es:[bx + 0xee]
5:5DF9  9ac6570000           lcall 0, 0x57c6  ; USER.SetCursor
5:5DFE  c45e06               les bx, ptr [bp + 6]
5:5E01  26c787ee000000       mov word ptr es:[bx + 0xee], 0
5:5E08  26c787f4000100       mov word ptr es:[bx + 0xf4], 1
5:5E0F  8b460c               mov ax, word ptr [bp + 0xc]
5:5E12  8946fc               mov word ptr [bp - 4], ax
5:5E15  8b460a               mov ax, word ptr [bp + 0xa]
5:5E18  8946fe               mov word ptr [bp - 2], ax
5:5E1B  6a47                 push 0x47
5:5E1D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:5E22  9aba208959           lcall 0x5989, 0x20ba  ; sub_s3:20BA
5:5E27  8946f8               mov word ptr [bp - 8], ax
5:5E2A  8956fa               mov word ptr [bp - 6], dx
5:5E2D  8d46fc               lea ax, [bp - 4]
5:5E30  16                   push ss
5:5E31  50                   push ax
5:5E32  66ff7606             push dword ptr [bp + 6]
5:5E36  90                   nop
5:5E37  0e                   push cs
5:5E38  e81bfa               call 0x5856  ; sub_s5:5856
5:5E3B  8946f4               mov word ptr [bp - 0xc], ax
5:5E3E  8956f6               mov word ptr [bp - 0xa], dx
5:5E41  0bd0                 or dx, ax
5:5E43  742b                 je 0x5e70
5:5E45  c45ef4               les bx, ptr [bp - 0xc]
5:5E48  66268b4742           mov eax, dword ptr es:[bx + 0x42]
5:5E4D  268b5744             mov dx, word ptr es:[bx + 0x44]
5:5E51  668946f0             mov dword ptr [bp - 0x10], eax
5:5E55  8a46f3               mov al, byte ptr [bp - 0xd]
5:5E58  2ae4                 sub ah, ah
5:5E5A  3c05                 cmp al, 5
5:5E5C  7512                 jne 0x5e70
5:5E5E  52                   push dx
5:5E5F  ff76f0               push word ptr [bp - 0x10]
loc_5E62:
5:5E62  66ff76f8             push dword ptr [bp - 8]
5:5E66  9ae657925b           lcall 0x5b92, 0x57e6  ; sub_s4:57E6
5:5E6B  c9                   leave
5:5E6C  ca0a00               retf 0xa
5:5E6F  db 90
loc_5E70:
5:5E70  666a00               push 0
5:5E73  ebed                 jmp 0x5e62
5:5E75  db 00

; ---------------- sub_s5:5E76 FAR size=782 callers=1
;   apis: USER.ReleaseCapture, USER.SetCursor
5:5E76  c8a80200             enter 0x2a8, 0
5:5E7A  9aed5d0000           lcall 0, 0x5ded  ; USER.ReleaseCapture
5:5E7F  c45e06               les bx, ptr [bp + 6]
5:5E82  26ffb7ee00           push word ptr es:[bx + 0xee]
5:5E87  9afa5d0000           lcall 0, 0x5dfa  ; USER.SetCursor
5:5E8C  c45e06               les bx, ptr [bp + 6]
5:5E8F  26c787ee000000       mov word ptr es:[bx + 0xee], 0
5:5E96  26c787f4000100       mov word ptr es:[bx + 0xf4], 1
5:5E9D  8b460c               mov ax, word ptr [bp + 0xc]
5:5EA0  8946fc               mov word ptr [bp - 4], ax
5:5EA3  8b460a               mov ax, word ptr [bp + 0xa]
5:5EA6  8946fe               mov word ptr [bp - 2], ax
5:5EA9  8d46fc               lea ax, [bp - 4]
5:5EAC  16                   push ss
5:5EAD  50                   push ax
5:5EAE  06                   push es
5:5EAF  53                   push bx
5:5EB0  90                   nop
5:5EB1  0e                   push cs
5:5EB2  e8a1f9               call 0x5856  ; sub_s5:5856
5:5EB5  8946f8               mov word ptr [bp - 8], ax
5:5EB8  8956fa               mov word ptr [bp - 6], dx
5:5EBB  0bd0                 or dx, ax
5:5EBD  0f84b502             je 0x6176
5:5EC1  c45ef8               les bx, ptr [bp - 8]
5:5EC4  268b470c             mov ax, word ptr es:[bx + 0xc]
5:5EC8  8946f6               mov word ptr [bp - 0xa], ax
5:5ECB  268b470e             mov ax, word ptr es:[bx + 0xe]
5:5ECF  8946f4               mov word ptr [bp - 0xc], ax
5:5ED2  c45e06               les bx, ptr [bp + 6]
5:5ED5  26ffb70c01           push word ptr es:[bx + 0x10c]
5:5EDA  ff76f6               push word ptr [bp - 0xa]
5:5EDD  50                   push ax
5:5EDE  33c0                 xor ax, ax
5:5EE0  8946f2               mov word ptr [bp - 0xe], ax
5:5EE3  50                   push ax
5:5EE4  6626ffb7fa00         push dword ptr es:[bx + 0xfa]
5:5EEA  9a8025695e           lcall 0x5e69, 0x2580  ; sub_s4:2580
5:5EEF  8946f0               mov word ptr [bp - 0x10], ax
5:5EF2  3db206               cmp ax, 0x6b2
5:5EF5  0f847d02             je 0x6176
5:5EF9  3db806               cmp ax, 0x6b8
5:5EFC  7542                 jne 0x5f40
5:5EFE  68b400               push 0xb4
5:5F01  9a9c174b5f           lcall 0x5f4b, 0x179c  ; operator_new@s1:179C
5:5F06  83c402               add sp, 2
5:5F09  8946d8               mov word ptr [bp - 0x28], ax
5:5F0C  8956da               mov word ptr [bp - 0x26], dx
5:5F0F  0bd0                 or dx, ax
5:5F11  741f                 je 0x5f32
5:5F13  6668b806ad06         push 0x6ad06b8
5:5F19  666840000200         push 0x20040
5:5F1F  ff369603             push word ptr [0x396]
5:5F23  ff76da               push word ptr [bp - 0x26]
5:5F26  50                   push ax
5:5F27  9a2085705f           lcall 0x5f70, 0x8520  ; sub_s9:8520
5:5F2C  83c40e               add sp, 0xe
5:5F2F  eb04                 jmp 0x5f35
5:5F31  db 90
loc_5F32:
5:5F32  33c0                 xor ax, ax
5:5F34  99                   cdq
loc_5F35:
5:5F35  8946dc               mov word ptr [bp - 0x24], ax
5:5F38  8956de               mov word ptr [bp - 0x22], dx
5:5F3B  68a500               push 0xa5
5:5F3E  eb44                 jmp 0x5f84
loc_5F40:
5:5F40  3db406               cmp ax, 0x6b4
5:5F43  7557                 jne 0x5f9c
5:5F45  68b400               push 0xb4
5:5F48  9a9c17e25f           lcall 0x5fe2, 0x179c  ; operator_new@s1:179C
5:5F4D  83c402               add sp, 2
5:5F50  8946d8               mov word ptr [bp - 0x28], ax
5:5F53  8956da               mov word ptr [bp - 0x26], dx
5:5F56  0bd0                 or dx, ax
5:5F58  741e                 je 0x5f78
5:5F5A  ff76f0               push word ptr [bp - 0x10]
5:5F5D  666802007b05         push 0x57b0002
5:5F63  6a40                 push 0x40
5:5F65  ff369603             push word ptr [0x396]
5:5F69  ff76da               push word ptr [bp - 0x26]
5:5F6C  50                   push ax
5:5F6D  9a20851560           lcall 0x6015, 0x8520  ; sub_s9:8520
5:5F72  83c40e               add sp, 0xe
5:5F75  eb04                 jmp 0x5f7b
5:5F77  db 90
loc_5F78:
5:5F78  33c0                 xor ax, ax
5:5F7A  99                   cdq
loc_5F7B:
5:5F7B  8946dc               mov word ptr [bp - 0x24], ax
5:5F7E  8956de               mov word ptr [bp - 0x22], dx
5:5F81  68ab00               push 0xab
loc_5F84:
5:5F84  6a01                 push 1
5:5F86  8d46e0               lea ax, [bp - 0x20]
5:5F89  16                   push ss
5:5F8A  50                   push ax
5:5F8B  9a1a946161           lcall 0x6161, 0x941a  ; sub_s2:941A
5:5F90  8d46e0               lea ax, [bp - 0x20]
5:5F93  16                   push ss
5:5F94  50                   push ax
5:5F95  c45edc               les bx, ptr [bp - 0x24]
5:5F98  e9d201               jmp 0x616d
5:5F9B  db 90
loc_5F9C:
5:5F9C  3db606               cmp ax, 0x6b6
5:5F9F  0f858f00             jne 0x6032
5:5FA3  687b05               push 0x57b
5:5FA6  8d8658ff             lea ax, [bp - 0xa8]
5:5FAA  16                   push ss
5:5FAB  50                   push ax
5:5FAC  68ff03               push 0x3ff
5:5FAF  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:5FB4  9ae084cd5f           lcall 0x5fcd, 0x84e0  ; sub_s3:84E0
5:5FB9  68b606               push 0x6b6
5:5FBC  8d8658fe             lea ax, [bp - 0x1a8]
5:5FC0  16                   push ss
5:5FC1  50                   push ax
5:5FC2  68ff03               push 0x3ff
5:5FC5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:5FCA  9ae0845660           lcall 0x6056, 0x84e0  ; sub_s3:84E0
5:5FCF  ff36cc50             push word ptr [0x50cc]
5:5FD3  8d8658fe             lea ax, [bp - 0x1a8]
5:5FD7  16                   push ss
5:5FD8  50                   push ax
5:5FD9  8d8658fd             lea ax, [bp - 0x2a8]
5:5FDD  16                   push ss
5:5FDE  50                   push ax
5:5FDF  9a9c3fed5f           lcall 0x5fed, 0x3f9c  ; _fsprintf@s1:3F9C
5:5FE4  83c40a               add sp, 0xa
5:5FE7  68b400               push 0xb4
5:5FEA  9a9c17cd60           lcall 0x60cd, 0x179c  ; operator_new@s1:179C
5:5FEF  83c402               add sp, 2
5:5FF2  8946d8               mov word ptr [bp - 0x28], ax
5:5FF5  8956da               mov word ptr [bp - 0x26], dx
5:5FF8  0bd0                 or dx, ax
5:5FFA  741e                 je 0x601a
5:5FFC  ff369603             push word ptr [0x396]
5:6000  8d8658fd             lea ax, [bp - 0x2a8]
5:6004  16                   push ss
5:6005  50                   push ax
5:6006  8d8658ff             lea ax, [bp - 0xa8]
5:600A  16                   push ss
5:600B  50                   push ax
5:600C  6a40                 push 0x40
5:600E  66ff76d8             push dword ptr [bp - 0x28]
5:6012  9a7884f260           lcall 0x60f2, 0x8478  ; sub_s9:8478
5:6017  eb04                 jmp 0x601d
5:6019  db 90
loc_601A:
5:601A  33c0                 xor ax, ax
5:601C  99                   cdq
loc_601D:
5:601D  8946dc               mov word ptr [bp - 0x24], ax
5:6020  8956de               mov word ptr [bp - 0x22], dx
5:6023  52                   push dx
5:6024  c45edc               les bx, ptr [bp - 0x24]
loc_6027:
5:6027  50                   push ax
5:6028  26c41f               les bx, ptr es:[bx]
5:602B  26ff5f74             lcall es:[bx + 0x74]
5:602F  e94401               jmp 0x6176
loc_6032:
5:6032  3da706               cmp ax, 0x6a7
5:6035  0f838900             jae 0x60c2
5:6039  c45e06               les bx, ptr [bp + 6]
5:603C  2683bf0c0178         cmp word ptr es:[bx + 0x10c], 0x78
5:6042  7408                 je 0x604c
5:6044  2683bf0c0174         cmp word ptr es:[bx + 0x10c], 0x74
5:604A  7521                 jne 0x606d
loc_604C:
5:604C  6a05                 push 5
5:604E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:6053  9aba209a60           lcall 0x609a, 0x20ba  ; sub_s3:20BA
5:6058  898658fd             mov word ptr [bp - 0x2a8], ax
5:605C  89965afd             mov word ptr [bp - 0x2a6], dx
5:6060  c49e58fd             les bx, ptr [bp - 0x2a8]
5:6064  26837f0a00           cmp word ptr es:[bx + 0xa], 0
5:6069  0f841301             je 0x6180
loc_606D:
5:606D  c45e06               les bx, ptr [bp + 6]
5:6070  2683bf0c016c         cmp word ptr es:[bx + 0x10c], 0x6c
5:6076  7418                 je 0x6090
5:6078  2683bf0c016d         cmp word ptr es:[bx + 0x10c], 0x6d
5:607E  7410                 je 0x6090
5:6080  2683bf0c0131         cmp word ptr es:[bx + 0x10c], 0x31
5:6086  7408                 je 0x6090
5:6088  2683bf0c0132         cmp word ptr es:[bx + 0x10c], 0x32
5:608E  7521                 jne 0x60b1
loc_6090:
5:6090  6a3a                 push 0x3a
5:6092  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:6097  9aba20255e           lcall 0x5e25, 0x20ba  ; sub_s3:20BA
5:609C  898658fd             mov word ptr [bp - 0x2a8], ax
5:60A0  89965afd             mov word ptr [bp - 0x2a6], dx
5:60A4  c49e58fd             les bx, ptr [bp - 0x2a8]
5:60A8  26837f0a00           cmp word ptr es:[bx + 0xa], 0
5:60AD  0f84cf00             je 0x6180
loc_60B1:
5:60B1  c45e06               les bx, ptr [bp + 6]
5:60B4  6626ffb7fe00         push dword ptr es:[bx + 0xfe]
5:60BA  90                   nop
5:60BB  0e                   push cs
5:60BC  e81f08               call 0x68de  ; sub_s5:68DE
5:60BF  e9b400               jmp 0x6176
loc_60C2:
5:60C2  3db106               cmp ax, 0x6b1
5:60C5  7647                 jbe 0x610e
5:60C7  68b400               push 0xb4
5:60CA  9a9c171461           lcall 0x6114, 0x179c  ; operator_new@s1:179C
5:60CF  83c402               add sp, 2
5:60D2  8946d8               mov word ptr [bp - 0x28], ax
5:60D5  8956da               mov word ptr [bp - 0x26], dx
5:60D8  0bd0                 or dx, ax
5:60DA  741e                 je 0x60fa
5:60DC  ff76f0               push word ptr [bp - 0x10]
5:60DF  666802007b05         push 0x57b0002
5:60E5  6a40                 push 0x40
5:60E7  ff369603             push word ptr [0x396]
5:60EB  ff76da               push word ptr [bp - 0x26]
5:60EE  50                   push ax
5:60EF  9a20853961           lcall 0x6139, 0x8520  ; sub_s9:8520
5:60F4  83c40e               add sp, 0xe
5:60F7  eb04                 jmp 0x60fd
5:60F9  db 90
loc_60FA:
5:60FA  33c0                 xor ax, ax
5:60FC  99                   cdq
loc_60FD:
5:60FD  898658fd             mov word ptr [bp - 0x2a8], ax
5:6101  89965afd             mov word ptr [bp - 0x2a6], dx
5:6105  52                   push dx
5:6106  c49e58fd             les bx, ptr [bp - 0x2a8]
5:610A  e91aff               jmp 0x6027
5:610D  db 90
loc_610E:
5:610E  68b400               push 0xb4
5:6111  9a9c173e56           lcall 0x563e, 0x179c  ; operator_new@s1:179C
5:6116  83c402               add sp, 2
5:6119  8946d8               mov word ptr [bp - 0x28], ax
5:611C  8956da               mov word ptr [bp - 0x26], dx
5:611F  0bd0                 or dx, ax
5:6121  741d                 je 0x6140
5:6123  ff76f0               push word ptr [bp - 0x10]
5:6126  666802007b05         push 0x57b0002
5:612C  6a40                 push 0x40
5:612E  ff369603             push word ptr [0x396]
5:6132  ff76da               push word ptr [bp - 0x26]
5:6135  50                   push ax
5:6136  9a20856b56           lcall 0x566b, 0x8520  ; sub_s9:8520
5:613B  83c40e               add sp, 0xe
5:613E  eb03                 jmp 0x6143
loc_6140:
5:6140  33c0                 xor ax, ax
5:6142  99                   cdq
loc_6143:
5:6143  898658fd             mov word ptr [bp - 0x2a8], ax
5:6147  89965afd             mov word ptr [bp - 0x2a6], dx
5:614B  8b46f0               mov ax, word ptr [bp - 0x10]
5:614E  2d0806               sub ax, 0x608
5:6151  898658fe             mov word ptr [bp - 0x1a8], ax
5:6155  50                   push ax
5:6156  6a01                 push 1
5:6158  8d8658ff             lea ax, [bp - 0xa8]
5:615C  16                   push ss
5:615D  50                   push ax
5:615E  9a1a940f5d           lcall 0x5d0f, 0x941a  ; sub_s2:941A
5:6163  8d8658ff             lea ax, [bp - 0xa8]
5:6167  16                   push ss
5:6168  50                   push ax
5:6169  c49e58fd             les bx, ptr [bp - 0x2a8]
loc_616D:
5:616D  06                   push es
5:616E  53                   push bx
5:616F  26c41f               les bx, ptr es:[bx]
5:6172  26ff5f6c             lcall es:[bx + 0x6c]
loc_6176:
5:6176  c45e06               les bx, ptr [bp + 6]
5:6179  26c7870c010000       mov word ptr es:[bx + 0x10c], 0
loc_6180:
5:6180  c9                   leave
5:6181  ca0a00               retf 0xa

; ---------------- sub_s5:6184 FAR size=64 callers=1
;   apis: USER.SetCapture, USER.SetCursor
5:6184  55                   push bp
5:6185  8bec                 mov bp, sp
5:6187  c45e06               les bx, ptr [bp + 6]
5:618A  2683bff40001         cmp word ptr es:[bx + 0xf4], 1
5:6190  752d                 jne 0x61bf
5:6192  26ffb7f000           push word ptr es:[bx + 0xf0]
5:6197  9a885e0000           lcall 0, 0x5e88  ; USER.SetCursor
5:619C  c45e06               les bx, ptr [bp + 6]
5:619F  268987ee00           mov word ptr es:[bx + 0xee], ax
5:61A4  8b460a               mov ax, word ptr [bp + 0xa]
5:61A7  2689870c01           mov word ptr es:[bx + 0x10c], ax
5:61AC  26ff7708             push word ptr es:[bx + 8]
5:61B0  9a71490000           lcall 0, 0x4971  ; USER.SetCapture
5:61B5  c45e06               les bx, ptr [bp + 6]
5:61B8  26c787f4000200       mov word ptr es:[bx + 0xf4], 2
loc_61BF:
5:61BF  c9                   leave
5:61C0  ca0600               retf 6
5:61C3  db 00

; ---------------- sub_s5:61C4 FAR size=68 callers=2
5:61C4  c80c0000             enter 0xc, 0
5:61C8  6a2f                 push 0x2f
5:61CA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:61CF  9aba20b75f           lcall 0x5fb7, 0x20ba  ; sub_s3:20BA
5:61D4  8946fc               mov word ptr [bp - 4], ax
5:61D7  8956fe               mov word ptr [bp - 2], dx
5:61DA  c45efc               les bx, ptr [bp - 4]
5:61DD  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:61E2  6650                 push eax
5:61E4  66ff760e             push dword ptr [bp + 0xe]
5:61E8  66ff760a             push dword ptr [bp + 0xa]
5:61EC  66ff364857           push dword ptr [0x5748]  ; g_sim
5:61F1  9a0883a957           lcall 0x57a9, 0x8308  ; sub_s7:8308
5:61F6  c45efc               les bx, ptr [bp - 4]
5:61F9  268b471e             mov ax, word ptr es:[bx + 0x1e]
5:61FD  c45e0e               les bx, ptr [bp + 0xe]
5:6200  268907               mov word ptr es:[bx], ax
5:6203  c9                   leave
5:6204  ca0c00               retf 0xc
5:6207  db 00

; ---------------- sub_s5:6208 FAR size=14 callers=0
5:6208  8bdc                 mov bx, sp
5:620A  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
5:6210  e90300               jmp 0x6216
5:6213  db 90 90 00

; ---------------- sub_s5:6216 FAR size=202 callers=0
5:6216  55                   push bp
5:6217  8bec                 mov bp, sp
5:6219  66ff7606             push dword ptr [bp + 6]
5:621D  90                   nop
5:621E  0e                   push cs
5:621F  e8d2e0               call 0x42f4  ; sub_s5:42F4
5:6222  f6460a01             test byte ptr [bp + 0xa], 1
5:6226  7409                 je 0x6231
5:6228  66ff7606             push dword ptr [bp + 6]
5:622C  9ace17045f           lcall 0x5f04, 0x17ce  ; operator_delete@s1:17CE
loc_6231:
5:6231  8b4606               mov ax, word ptr [bp + 6]
5:6234  8b5608               mov dx, word ptr [bp + 8]
5:6237  c9                   leave
5:6238  ca0600               retf 6
5:623B  db 90 16 62 42 62 4c 43 46 62 f6 43 72 62 c6 68 4e
5:624B  db 62 40 96 52 62 64 96 56 62 2c 37 5a 62 f2 97 5e
5:625B  db 62 3c 37 62 62 40 37 66 62 44 37 6a 62 48 37 6e
5:626B  db 62 4c 37 76 62 b0 44 7a 62 98 96 82 62 50 82 7e
5:627B  db 62 3c 49 8a 62 60 9c 86 62 58 37 8e 62 ec 44 9a
5:628B  db 62 4e 9c 92 62 62 37 96 62 4a 9c a2 62 c6 51 9e
5:629B  db 62 2e 52 ca 62 4a 6a a6 62 2e 6b aa 62 02 6b ae
5:62AB  db 62 7a 37 b2 62 52 9c b6 62 56 9c ba 62 16 9c be
5:62BB  db 62 30 9c c2 62 86 9c c6 62 c4 9c d2 62 c0 81 ce
5:62CB  db 62 de 52 d6 62 28 63 8e 5f 28 81 03 43 08 62 de
5:62DB  db 62 94 43 3e 62

; ---------------- sub_s5:62E0 FAR size=390 callers=1
5:62E0  c8100000             enter 0x10, 0
5:62E4  66ff7608             push dword ptr [bp + 8]
5:62E8  ff7606               push word ptr [bp + 6]
5:62EB  90                   nop
5:62EC  0e                   push cs
5:62ED  e82c2f               call 0x921c  ; sub_s5:921C
5:62F0  c45e06               les bx, ptr [bp + 6]
5:62F3  662bc0               sub eax, eax
5:62F6  6626894714           mov dword ptr es:[bx + 0x14], eax
5:62FB  662689472c           mov dword ptr es:[bx + 0x2c], eax
5:6300  26c707c267           mov word ptr es:[bx], 0x67c2
5:6305  26c74702da62         mov word ptr es:[bx + 2], 0x62da  ; SEGMENT s5:0000
5:630B  6a14                 push 0x14
5:630D  50                   push ax
5:630E  8d4718               lea ax, [bx + 0x18]
5:6311  06                   push es
5:6312  50                   push ax
5:6313  9a06492063           lcall 0x6320, 0x4906  ; sub_s1:4906
5:6318  83c408               add sp, 8
5:631B  6a3c                 push 0x3c
5:631D  9a9c175363           lcall 0x6353, 0x179c  ; operator_new@s1:179C
5:6322  83c402               add sp, 2
5:6325  8956fa               mov word ptr [bp - 6], dx
5:6328  0bd0                 or dx, ax
5:632A  7416                 je 0x6342
5:632C  ff76fa               push word ptr [bp - 6]
5:632F  50                   push ax
5:6330  90                   nop
5:6331  0e                   push cs
5:6332  e88d24               call 0x87c2  ; sub_s5:87C2
5:6335  c45e06               les bx, ptr [bp + 6]
5:6338  2689471c             mov word ptr es:[bx + 0x1c], ax
5:633C  2689571e             mov word ptr es:[bx + 0x1e], dx
5:6340  eb0c                 jmp 0x634e
loc_6342:
5:6342  c45e06               les bx, ptr [bp + 6]
5:6345  6626c7471c00000000   mov dword ptr es:[bx + 0x1c], 0
loc_634E:
5:634E  6a26                 push 0x26
5:6350  9a9c177e63           lcall 0x637e, 0x179c  ; operator_new@s1:179C
5:6355  83c402               add sp, 2
5:6358  8956fa               mov word ptr [bp - 6], dx
5:635B  0bd0                 or dx, ax
5:635D  740b                 je 0x636a
5:635F  ff76fa               push word ptr [bp - 6]
5:6362  50                   push ax
5:6363  90                   nop
5:6364  0e                   push cs
5:6365  e83427               call 0x8a9c  ; sub_s5:8A9C
5:6368  eb03                 jmp 0x636d
loc_636A:
5:636A  33c0                 xor ax, ax
5:636C  99                   cdq
loc_636D:
5:636D  c45e06               les bx, ptr [bp + 6]
5:6370  26894720             mov word ptr es:[bx + 0x20], ax
5:6374  26895722             mov word ptr es:[bx + 0x22], dx
5:6378  68be00               push 0xbe
5:637B  9a9c17a963           lcall 0x63a9, 0x179c  ; operator_new@s1:179C
5:6380  83c402               add sp, 2
5:6383  8956fa               mov word ptr [bp - 6], dx
5:6386  0bd0                 or dx, ax
5:6388  740c                 je 0x6396
5:638A  ff76fa               push word ptr [bp - 6]
5:638D  50                   push ax
5:638E  90                   nop
5:638F  0e                   push cs
5:6390  e8172b               call 0x8eaa  ; sub_s5:8EAA
5:6393  eb04                 jmp 0x6399
5:6395  db 90
loc_6396:
5:6396  33c0                 xor ax, ax
5:6398  99                   cdq
loc_6399:
5:6399  c45e06               les bx, ptr [bp + 6]
5:639C  26894724             mov word ptr es:[bx + 0x24], ax
5:63A0  26895726             mov word ptr es:[bx + 0x26], dx
5:63A4  6a20                 push 0x20  ; 'New failed in Op::Op'
5:63A6  9a9c172f62           lcall 0x622f, 0x179c  ; operator_new@s1:179C
5:63AB  83c402               add sp, 2
5:63AE  8956fa               mov word ptr [bp - 6], dx
5:63B1  0bd0                 or dx, ax
5:63B3  740b                 je 0x63c0
5:63B5  ff76fa               push word ptr [bp - 6]
5:63B8  50                   push ax
5:63B9  90                   nop
5:63BA  0e                   push cs
5:63BB  e8a21f               call 0x8360  ; sub_s5:8360
5:63BE  eb03                 jmp 0x63c3
loc_63C0:
5:63C0  33c0                 xor ax, ax
5:63C2  99                   cdq
loc_63C3:
5:63C3  c45e06               les bx, ptr [bp + 6]
5:63C6  26894728             mov word ptr es:[bx + 0x28], ax
5:63CA  2689572a             mov word ptr es:[bx + 0x2a], dx
5:63CE  666801000400         push 0x40001
5:63D4  66ff7606             push dword ptr [bp + 6]
5:63D8  90                   nop
5:63D9  0e                   push cs
5:63DA  e86903               call 0x6746  ; sub_s5:6746
5:63DD  6a29                 push 0x29
5:63DF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:63E4  9aba205164           lcall 0x6451, 0x20ba  ; sub_s3:20BA
5:63E9  c45e06               les bx, ptr [bp + 6]
5:63EC  26894714             mov word ptr es:[bx + 0x14], ax
5:63F0  26895716             mov word ptr es:[bx + 0x16], dx
5:63F4  06                   push es
5:63F5  53                   push bx
5:63F6  6a00                 push 0
5:63F8  52                   push dx
5:63F9  26ff7714             push word ptr es:[bx + 0x14]
5:63FD  26c45f14             les bx, ptr es:[bx + 0x14]
5:6401  26c41f               les bx, ptr es:[bx]
5:6404  26ff5f04             lcall es:[bx + 4]
5:6408  c45e06               les bx, ptr [bp + 6]
5:640B  66268b4714           mov eax, dword ptr es:[bx + 0x14]
5:6410  6626894706           mov dword ptr es:[bx + 6], eax
5:6415  c45e06               les bx, ptr [bp + 6]
5:6418  26c45f14             les bx, ptr es:[bx + 0x14]
5:641C  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:6421  668946fc             mov dword ptr [bp - 4], eax
5:6425  668b4606             mov eax, dword ptr [bp + 6]
5:6429  050a00               add ax, 0xa
5:642C  6650                 push eax
5:642E  c45efc               les bx, ptr [bp - 4]
5:6431  06                   push es
5:6432  53                   push bx
5:6433  26c41f               les bx, ptr es:[bx]
5:6436  26ff5f08             lcall es:[bx + 8]
5:643A  c45e06               les bx, ptr [bp + 6]
5:643D  26894712             mov word ptr es:[bx + 0x12], ax
5:6441  26c747100100         mov word ptr es:[bx + 0x10], 1
5:6447  6a02                 push 2
5:6449  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:644E  9aba20d261           lcall 0x61d2, 0x20ba  ; sub_s3:20BA
5:6453  c45e06               les bx, ptr [bp + 6]
5:6456  2689472c             mov word ptr es:[bx + 0x2c], ax
5:645A  2689572e             mov word ptr es:[bx + 0x2e], dx
5:645E  8bc3                 mov ax, bx
5:6460  8cc2                 mov dx, es
5:6462  c9                   leave
5:6463  ca0600               retf 6

; ---------------- sub_s5:6466 FAR size=50 callers=1
5:6466  55                   push bp
5:6467  8bec                 mov bp, sp
5:6469  c45e06               les bx, ptr [bp + 6]
5:646C  26c707c267           mov word ptr es:[bx], 0x67c2
5:6471  26c747020963         mov word ptr es:[bx + 2], 0x6309  ; SEGMENT s5:0000
5:6477  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
5:647D  740c                 je 0x648b
5:647F  06                   push es
5:6480  53                   push bx
5:6481  6626ff7714           push dword ptr es:[bx + 0x14]
5:6486  9aa61ee763           lcall 0x63e7, 0x1ea6  ; sub_s3:1EA6
loc_648B:
5:648B  66ff7606             push dword ptr [bp + 6]
5:648F  90                   nop
5:6490  0e                   push cs
5:6491  e8302e               call 0x92c4  ; sub_s5:92C4
5:6494  c9                   leave
5:6495  ca0400               retf 4

; ---------------- sub_s5:6498 FAR size=60 callers=2
5:6498  c8080000             enter 8, 0
5:649C  56                   push si
5:649D  c45e06               les bx, ptr [bp + 6]
5:64A0  83c318               add bx, 0x18
5:64A3  8b760a               mov si, word ptr [bp + 0xa]
5:64A6  c1e602               shl si, 2
5:64A9  6626833800           cmp dword ptr es:[bx + si], 0
5:64AE  741c                 je 0x64cc
5:64B0  8b5e06               mov bx, word ptr [bp + 6]
5:64B3  83c318               add bx, 0x18
5:64B6  8b760a               mov si, word ptr [bp + 0xa]
5:64B9  c1e602               shl si, 2
5:64BC  26c418               les bx, ptr es:[bx + si]
5:64BF  268b4708             mov ax, word ptr es:[bx + 8]
5:64C3  268b570a             mov dx, word ptr es:[bx + 0xa]
5:64C7  5e                   pop si
5:64C8  c9                   leave
5:64C9  ca0600               retf 6
loc_64CC:
5:64CC  33c0                 xor ax, ax
5:64CE  99                   cdq
5:64CF  5e                   pop si
5:64D0  c9                   leave
5:64D1  ca0600               retf 6

; ---------------- sub_s5:64D4 FAR size=56 callers=5
5:64D4  c8060000             enter 6, 0
5:64D8  56                   push si
5:64D9  c45e06               les bx, ptr [bp + 6]
5:64DC  83c318               add bx, 0x18
5:64DF  8b760a               mov si, word ptr [bp + 0xa]
5:64E2  c1e602               shl si, 2
5:64E5  6626833800           cmp dword ptr es:[bx + si], 0
5:64EA  7418                 je 0x6504
5:64EC  8b5e06               mov bx, word ptr [bp + 6]
5:64EF  83c318               add bx, 0x18
5:64F2  8b760a               mov si, word ptr [bp + 0xa]
5:64F5  c1e602               shl si, 2
5:64F8  26c418               les bx, ptr es:[bx + si]
5:64FB  268b4704             mov ax, word ptr es:[bx + 4]
5:64FF  5e                   pop si
5:6500  c9                   leave
5:6501  ca0600               retf 6
loc_6504:
5:6504  33c0                 xor ax, ax
5:6506  5e                   pop si
5:6507  c9                   leave
5:6508  ca0600               retf 6
5:650B  db 00

; ---------------- sub_s5:650C FAR size=192 callers=0
;   apis: USER.BeginPaint, USER.EndPaint
5:650C  c8300000             enter 0x30, 0
5:6510  56                   push si
5:6511  c45e06               les bx, ptr [bp + 6]
5:6514  26c45f14             les bx, ptr es:[bx + 0x14]
5:6518  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:651D  668946fc             mov dword ptr [bp - 4], eax
5:6521  c45e06               les bx, ptr [bp + 6]
5:6524  26837f1000           cmp word ptr es:[bx + 0x10], 0
5:6529  750b                 jne 0x6536
5:652B  26c45f14             les bx, ptr es:[bx + 0x14]
5:652F  26837f2400           cmp word ptr es:[bx + 0x24], 0
5:6534  7424                 je 0x655a
loc_6536:
5:6536  66ff7606             push dword ptr [bp + 6]
5:653A  90                   nop
5:653B  0e                   push cs
5:653C  e8252e               call 0x9364  ; sub_s5:9364
5:653F  c45e06               les bx, ptr [bp + 6]
5:6542  6626837f2400         cmp dword ptr es:[bx + 0x24], 0
5:6548  7410                 je 0x655a
5:654A  6626ff7724           push dword ptr es:[bx + 0x24]
5:654F  26c45f24             les bx, ptr es:[bx + 0x24]
5:6553  26c41f               les bx, ptr es:[bx]
5:6556  26ff5f14             lcall es:[bx + 0x14]
loc_655A:
5:655A  c746fa0000           mov word ptr [bp - 6], 0
loc_655F:
5:655F  c45e06               les bx, ptr [bp + 6]
5:6562  83c318               add bx, 0x18
5:6565  8b76fa               mov si, word ptr [bp - 6]
5:6568  c1e602               shl si, 2
5:656B  6626833800           cmp dword ptr es:[bx + si], 0
5:6570  7412                 je 0x6584
5:6572  66ff76fc             push dword ptr [bp - 4]
5:6576  6626ff30             push dword ptr es:[bx + si]
5:657A  26c418               les bx, ptr es:[bx + si]
5:657D  26c41f               les bx, ptr es:[bx]
5:6580  26ff5f08             lcall es:[bx + 8]
loc_6584:
5:6584  ff46fa               inc word ptr [bp - 6]
5:6587  837efa05             cmp word ptr [bp - 6], 5
5:658B  7cd2                 jl 0x655f
5:658D  c45e06               les bx, ptr [bp + 6]
5:6590  26ff7704             push word ptr es:[bx + 4]
5:6594  8d46da               lea ax, [bp - 0x26]
5:6597  16                   push ss
5:6598  50                   push ax
5:6599  9ab13f0000           lcall 0, 0x3fb1  ; USER.BeginPaint
5:659E  668b4606             mov eax, dword ptr [bp + 6]
5:65A2  050a00               add ax, 0xa
5:65A5  6650                 push eax
5:65A7  666a00               push 0
5:65AA  c45efc               les bx, ptr [bp - 4]
5:65AD  06                   push es
5:65AE  53                   push bx
5:65AF  26c41f               les bx, ptr es:[bx]
5:65B2  26ff5f04             lcall es:[bx + 4]
5:65B6  c45e06               les bx, ptr [bp + 6]
5:65B9  26ff7704             push word ptr es:[bx + 4]
5:65BD  8d46da               lea ax, [bp - 0x26]
5:65C0  16                   push ss
5:65C1  50                   push ax
5:65C2  9a5c400000           lcall 0, 0x405c  ; USER.EndPaint
5:65C7  5e                   pop si
5:65C8  c9                   leave
5:65C9  ca0400               retf 4

; ---------------- sub_s5:65CC size=378 callers=0
;   apis: USER.InvalidateRect, USER.IsIconic, USER.SendMessage
5:65CC  c8100000             enter 0x10, 0
5:65D0  56                   push si
5:65D1  8b460a               mov ax, word ptr [bp + 0xa]
5:65D4  e95301               jmp 0x672a
5:65D7  db 90
loc_65D8:
5:65D8  c45e06               les bx, ptr [bp + 6]
5:65DB  662bc0               sub eax, eax
5:65DE  6626894714           mov dword ptr es:[bx + 0x14], eax
5:65E3  5e                   pop si
5:65E4  c9                   leave
5:65E5  ca0600               retf 6
loc_65E8:
5:65E8  c746fe0000           mov word ptr [bp - 2], 0
5:65ED  eb04                 jmp 0x65f3
5:65EF  db 90
loc_65F0:
5:65F0  ff46fe               inc word ptr [bp - 2]
loc_65F3:
5:65F3  837efe05             cmp word ptr [bp - 2], 5
5:65F7  0f8d4601             jge 0x6741
5:65FB  c45e06               les bx, ptr [bp + 6]
5:65FE  83c318               add bx, 0x18
5:6601  8b76fe               mov si, word ptr [bp - 2]
5:6604  c1e602               shl si, 2
5:6607  268b4002             mov ax, word ptr es:[bx + si + 2]
5:660B  260b00               or ax, word ptr es:[bx + si]
5:660E  74e0                 je 0x65f0
5:6610  6626ff30             push dword ptr es:[bx + si]
5:6614  26c418               les bx, ptr es:[bx + si]
5:6617  26c41f               les bx, ptr es:[bx]
5:661A  26ff5f04             lcall es:[bx + 4]
5:661E  ebd0                 jmp 0x65f0
loc_6620:
5:6620  ff369603             push word ptr [0x396]
5:6624  9a37660000           lcall 0, 0x6637  ; USER.IsIconic
5:6629  0bc0                 or ax, ax
5:662B  0f851201             jne 0x6741
5:662F  c45e06               les bx, ptr [bp + 6]
5:6632  26ff7704             push word ptr es:[bx + 4]
5:6636  9ade300000           lcall 0, 0x30de  ; USER.IsIconic
5:663B  0bc0                 or ax, ax
5:663D  0f850001             jne 0x6741
5:6641  c45e06               les bx, ptr [bp + 6]
5:6644  26c45f14             les bx, ptr es:[bx + 0x14]
5:6648  26394724             cmp word ptr es:[bx + 0x24], ax
5:664C  0f84f100             je 0x6741
5:6650  c45e06               les bx, ptr [bp + 6]
5:6653  26ff7704             push word ptr es:[bx + 4]
5:6657  50                   push ax
5:6658  50                   push ax
5:6659  50                   push ax
5:665A  9a553f0000           lcall 0, 0x3f55  ; USER.InvalidateRect
5:665F  6a02                 push 2
5:6661  66ff7606             push dword ptr [bp + 6]
5:6665  90                   nop
5:6666  0e                   push cs
5:6667  e86afe               call 0x64d4  ; sub_s5:64D4
5:666A  0bc0                 or ax, ax
5:666C  750f                 jne 0x667d
5:666E  666801000200         push 0x20001
5:6674  66ff7606             push dword ptr [bp + 6]
5:6678  90                   nop
5:6679  0e                   push cs
5:667A  e8c900               call 0x6746  ; sub_s5:6746
loc_667D:
5:667D  6a03                 push 3
5:667F  66ff7606             push dword ptr [bp + 6]
5:6683  90                   nop
5:6684  0e                   push cs
5:6685  e84cfe               call 0x64d4  ; sub_s5:64D4
5:6688  0bc0                 or ax, ax
5:668A  750f                 jne 0x669b
5:668C  666801000300         push 0x30001
5:6692  66ff7606             push dword ptr [bp + 6]
5:6696  90                   nop
5:6697  0e                   push cs
5:6698  e8ab00               call 0x6746  ; sub_s5:6746
loc_669B:
5:669B  c45e06               les bx, ptr [bp + 6]
5:669E  6626ff7714           push dword ptr es:[bx + 0x14]
5:66A3  9a5e25ed5e           lcall 0x5eed, 0x255e  ; sub_s4:255E
5:66A8  0bc0                 or ax, ax
5:66AA  7516                 jne 0x66c2
5:66AC  c45e06               les bx, ptr [bp + 6]
5:66AF  26ff7704             push word ptr es:[bx + 4]
5:66B3  666869001101         push 0x1110069
5:66B9  50                   push ax
5:66BA  50                   push ax
5:66BB  9af1660000           lcall 0, 0x66f1  ; USER.SendMessage
5:66C0  eb1e                 jmp 0x66e0
loc_66C2:
5:66C2  6a01                 push 1
5:66C4  66ff7606             push dword ptr [bp + 6]
5:66C8  90                   nop
5:66C9  0e                   push cs
5:66CA  e807fe               call 0x64d4  ; sub_s5:64D4
5:66CD  0bc0                 or ax, ax
5:66CF  750f                 jne 0x66e0
5:66D1  666801000100         push 0x10001
5:66D7  66ff7606             push dword ptr [bp + 6]
5:66DB  90                   nop
5:66DC  0e                   push cs
5:66DD  e86600               call 0x6746  ; sub_s5:6746
loc_66E0:
5:66E0  c45e06               les bx, ptr [bp + 6]
5:66E3  26ff7704             push word ptr es:[bx + 4]
5:66E7  6668f0001101         push 0x11100f0
5:66ED  666a00               push 0
5:66F0  9a21670000           lcall 0, 0x6721  ; USER.SendMessage
5:66F5  c45e06               les bx, ptr [bp + 6]
5:66F8  26c45f2c             les bx, ptr es:[bx + 0x2c]
5:66FC  26837f7a00           cmp word ptr es:[bx + 0x7a], 0
5:6701  743e                 je 0x6741
5:6703  c45e06               les bx, ptr [bp + 6]
5:6706  26c45f2c             les bx, ptr es:[bx + 0x2c]
5:670A  26c7477a0000         mov word ptr es:[bx + 0x7a], 0
5:6710  c45e06               les bx, ptr [bp + 6]
5:6713  26ff7704             push word ptr es:[bx + 4]
5:6717  666831011101         push 0x1110131
5:671D  666a00               push 0
5:6720  9ae0560000           lcall 0, 0x56e0  ; USER.SendMessage
5:6725  5e                   pop si
5:6726  c9                   leave
5:6727  ca0600               retf 6
loc_672A:
5:672A  48                   dec ax
5:672B  0f84a9fe             je 0x65d8
5:672F  48                   dec ax
5:6730  0f84b4fe             je 0x65e8
5:6734  48                   dec ax
5:6735  48                   dec ax
5:6736  7c09                 jl 0x6741
5:6738  7007                 jo 0x6741
5:673A  2d0300               sub ax, 3
5:673D  0f8edffe             jle 0x6620
loc_6741:
5:6741  5e                   pop si
5:6742  c9                   leave
5:6743  ca0600               retf 6

; ---------------- sub_s5:6746 FAR size=86 callers=2
5:6746  c8080000             enter 8, 0
5:674A  56                   push si
5:674B  837e0c00             cmp word ptr [bp + 0xc], 0
5:674F  7446                 je 0x6797
5:6751  c45e06               les bx, ptr [bp + 6]
5:6754  83c318               add bx, 0x18
5:6757  8b760c               mov si, word ptr [bp + 0xc]
5:675A  c1e602               shl si, 2
5:675D  6626833800           cmp dword ptr es:[bx + si], 0
5:6762  7433                 je 0x6797
5:6764  8b460a               mov ax, word ptr [bp + 0xa]
5:6767  26c418               les bx, ptr es:[bx + si]
5:676A  26894704             mov word ptr es:[bx + 4], ax
5:676E  c45e06               les bx, ptr [bp + 6]
5:6771  26c747100100         mov word ptr es:[bx + 0x10], 1
5:6777  837e0a00             cmp word ptr [bp + 0xa], 0
5:677B  751a                 jne 0x6797
5:677D  c45e06               les bx, ptr [bp + 6]
5:6780  83c318               add bx, 0x18
5:6783  8b760c               mov si, word ptr [bp + 0xc]
5:6786  c1e602               shl si, 2
5:6789  6626ff30             push dword ptr es:[bx + si]
5:678D  26c418               les bx, ptr es:[bx + si]
5:6790  26c41f               les bx, ptr es:[bx]
5:6793  26ff5f14             lcall es:[bx + 0x14]
loc_6797:
5:6797  5e                   pop si
5:6798  c9                   leave
5:6799  ca0800               retf 8

; ---------------- sub_s5:679C FAR size=50 callers=0
5:679C  55                   push bp
5:679D  8bec                 mov bp, sp
5:679F  66ff7606             push dword ptr [bp + 6]
5:67A3  90                   nop
5:67A4  0e                   push cs
5:67A5  e8befc               call 0x6466  ; sub_s5:6466
5:67A8  f6460a01             test byte ptr [bp + 0xa], 1
5:67AC  7409                 je 0x67b7
5:67AE  66ff7606             push dword ptr [bp + 6]
5:67B2  9ace171663           lcall 0x6316, 0x17ce  ; operator_delete@s1:17CE
loc_67B7:
5:67B7  8b4606               mov ax, word ptr [bp + 6]
5:67BA  8b5608               mov dx, word ptr [bp + 8]
5:67BD  c9                   leave
5:67BE  ca0600               retf 6
5:67C1  db 90 9c 67 c8 67 cc 65 cc 67 0c 65 75 64

; ---------------- sub_s5:67CE FAR size=174 callers=1
;   apis: GDI.GetStockObject, USER.LoadCursor
5:67CE  c8060000             enter 6, 0
5:67D2  66ff760c             push dword ptr [bp + 0xc]
5:67D6  ff760a               push word ptr [bp + 0xa]
5:67D9  1e                   push ds
5:67DA  68fa43               push 0x43fa  ; 'TPPOPMENU'
5:67DD  66ff7606             push dword ptr [bp + 6]
5:67E1  90                   nop
5:67E2  0e                   push cs
5:67E3  e82811               call 0x790e  ; sub_s5:790E
5:67E6  c45e06               les bx, ptr [bp + 6]
5:67E9  662bc0               sub eax, eax
5:67EC  66268987f200         mov dword ptr es:[bx + 0xf2], eax
5:67F2  66268987f600         mov dword ptr es:[bx + 0xf6], eax
5:67F8  26c707e670           mov word ptr es:[bx], 0x70e6
5:67FD  26c74702c467         mov word ptr es:[bx + 2], 0x67c4  ; SEGMENT s5:0000
5:6803  1e                   push ds
5:6804  680444               push 0x4404  ; 'VrMode2'
5:6807  8d475b               lea ax, [bx + 0x5b]
5:680A  06                   push es
5:680B  50                   push ax
5:680C  9a3e3db567           lcall 0x67b5, 0x3d3e  ; _fstrcpy@s1:3D3E
5:6811  83c408               add sp, 8
5:6814  6a05                 push 5
5:6816  9a47410000           lcall 0, 0x4147  ; GDI.GetStockObject
5:681B  c45e06               les bx, ptr [bp + 6]
5:681E  268987c600           mov word ptr es:[bx + 0xc6], ax
5:6823  666a00               push 0
5:6826  68007f               push 0x7f00
5:6829  9aee570000           lcall 0, 0x57ee  ; USER.LoadCursor
5:682E  c45e06               les bx, ptr [bp + 6]
5:6831  268987c400           mov word ptr es:[bx + 0xc4], ax
5:6836  6626c787ac000000c044 mov dword ptr es:[bx + 0xac], 0x44c00000
5:6840  26c787c8002020       mov word ptr es:[bx + 0xc8], 0x2020
5:6847  c45e0c               les bx, ptr [bp + 0xc]
5:684A  268b4708             mov ax, word ptr es:[bx + 8]
5:684E  c45e06               les bx, ptr [bp + 6]
5:6851  268987bc00           mov word ptr es:[bx + 0xbc], ax
5:6856  8b460a               mov ax, word ptr [bp + 0xa]
5:6859  c45e06               les bx, ptr [bp + 6]
5:685C  268987ca00           mov word ptr es:[bx + 0xca], ax
5:6861  06                   push es
5:6862  53                   push bx
5:6863  9ad2964a62           lcall 0x624a, 0x96d2  ; RegisterWindowClass@s2:96D2
5:6868  66ff7606             push dword ptr [bp + 6]
5:686C  90                   nop
5:686D  0e                   push cs
5:686E  e8c903               call 0x6c3a  ; sub_s5:6C3A
5:6871  8b4606               mov ax, word ptr [bp + 6]
5:6874  8b5608               mov dx, word ptr [bp + 8]
5:6877  c9                   leave
5:6878  ca0a00               retf 0xa
5:687B  db 00

; ---------------- sub_s5:687C FAR size=26 callers=0
5:687C  55                   push bp
5:687D  8bec                 mov bp, sp
5:687F  66ff7606             push dword ptr [bp + 6]
5:6883  90                   nop
5:6884  0e                   push cs
5:6885  e8c811               call 0x7a50  ; sub_s5:7A50
5:6888  66ff7606             push dword ptr [bp + 6]
5:688C  90                   nop
5:688D  0e                   push cs
5:688E  e84103               call 0x6bd2  ; sub_s5:6BD2
5:6891  c9                   leave
5:6892  ca0400               retf 4
5:6895  db 00

; ---------------- sub_s5:6896 FAR size=72 callers=0
;   apis: GDI.UnrealizeObject, USER.RealizePalette
5:6896  c8140000             enter 0x14, 0
5:689A  837e0a00             cmp word ptr [bp + 0xa], 0
5:689E  743a                 je 0x68da
5:68A0  c45e06               les bx, ptr [bp + 6]
5:68A3  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:68A8  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:68AD  268b5726             mov dx, word ptr es:[bx + 0x26]
5:68B1  668946fc             mov dword ptr [bp - 4], eax
5:68B5  52                   push dx
5:68B6  c45efc               les bx, ptr [bp - 4]
5:68B9  50                   push ax
5:68BA  26c41f               les bx, ptr es:[bx]
5:68BD  26ff5f18             lcall es:[bx + 0x18]
5:68C1  50                   push ax
5:68C2  9abe290000           lcall 0, 0x29be  ; GDI.UnrealizeObject
5:68C7  c45e06               les bx, ptr [bp + 6]
5:68CA  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:68CF  268b877801           mov ax, word ptr es:[bx + 0x178]
5:68D4  50                   push ax
5:68D5  9ad0290000           lcall 0, 0x29d0  ; USER.RealizePalette
loc_68DA:
5:68DA  c9                   leave
5:68DB  ca0600               retf 6

; ---------------- sub_s5:68DE FAR size=30 callers=2
5:68DE  55                   push bp
5:68DF  8bec                 mov bp, sp
5:68E1  c45e06               les bx, ptr [bp + 6]
5:68E4  662683bff60000       cmp dword ptr es:[bx + 0xf6], 0
5:68EB  740b                 je 0x68f8
5:68ED  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:68F3  90                   nop
5:68F4  0e                   push cs
5:68F5  e8620a               call 0x735a  ; sub_s5:735A
loc_68F8:
5:68F8  c9                   leave
5:68F9  ca0400               retf 4

; ---------------- sub_s5:68FC size=80 callers=0
;   apis: USER.PtInRect
5:68FC  c80c0000             enter 0xc, 0
5:6900  8b460c               mov ax, word ptr [bp + 0xc]
5:6903  8946fc               mov word ptr [bp - 4], ax
5:6906  8b460a               mov ax, word ptr [bp + 0xa]
5:6909  8946fe               mov word ptr [bp - 2], ax
5:690C  c45e06               les bx, ptr [bp + 6]
5:690F  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6915  9ad031a666           lcall 0x66a6, 0x31d0  ; sub_s4:31D0
5:691A  0bc0                 or ax, ax
5:691C  742a                 je 0x6948
5:691E  c45e06               les bx, ptr [bp + 6]
5:6921  66268b87f200         mov eax, dword ptr es:[bx + 0xf2]
5:6927  056c01               add ax, 0x16c
5:692A  6650                 push eax
5:692C  66ff76fc             push dword ptr [bp - 4]
5:6930  9a335c0000           lcall 0, 0x5c33  ; USER.PtInRect
5:6935  0bc0                 or ax, ax
5:6937  740f                 je 0x6948
5:6939  68ef00               push 0xef
5:693C  c45e06               les bx, ptr [bp + 6]
5:693F  06                   push es
5:6940  53                   push bx
5:6941  26c41f               les bx, ptr es:[bx]
5:6944  26ff5f40             lcall es:[bx + 0x40]
loc_6948:
5:6948  c9                   leave
5:6949  ca0a00               retf 0xa

; ---------------- sub_s5:694C size=410 callers=0
;   apis: USER.DestroyWindow, USER.GetDlgItem, USER.PostMessage, USER.WinHelp
5:694C  c8040000             enter 4, 0
5:6950  8b460a               mov ax, word ptr [bp + 0xa]
5:6953  3d2b01               cmp ax, 0x12b
5:6956  0f848801             je 0x6ae2
5:695A  0f875e01             ja 0x6abc
5:695E  2d6f00               sub ax, 0x6f
5:6961  741b                 je 0x697e
5:6963  2d7c00               sub ax, 0x7c
5:6966  0f841c01             je 0x6a86
5:696A  2d0400               sub ax, 4
5:696D  0f842b01             je 0x6a9c
5:6971  2d3a00               sub ax, 0x3a
5:6974  0f846a01             je 0x6ae2
5:6978  48                   dec ax
5:6979  742b                 je 0x69a6
5:697B  e96401               jmp 0x6ae2
loc_697E:
5:697E  68f801               push 0x1f8
5:6981  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:6986  9a0a838964           lcall 0x6489, 0x830a  ; sub_s3:830A
5:698B  c45e06               les bx, ptr [bp + 6]
5:698E  26ff7708             push word ptr es:[bx + 8]
5:6992  52                   push dx
5:6993  50                   push ax
5:6994  666800000100         push 0x10000
5:699A  6a29                 push 0x29
5:699C  9a9b4a0000           lcall 0, 0x4a9b  ; USER.WinHelp
5:69A1  c9                   leave
5:69A2  ca0600               retf 6
5:69A5  db 90
loc_69A6:
5:69A6  c45e06               les bx, ptr [bp + 6]
5:69A9  26ff7708             push word ptr es:[bx + 8]
5:69AD  666812f01201         push 0x112f012
5:69B3  eb0e                 jmp 0x69c3
5:69B5  db 90
loc_69B6:
5:69B6  c45e06               les bx, ptr [bp + 6]
5:69B9  26ff7708             push word ptr es:[bx + 8]
5:69BD  666820f01201         push 0x112f020
loc_69C3:
5:69C3  666a00               push 0
5:69C6  9a495c0000           lcall 0, 0x5c49  ; USER.PostMessage
5:69CB  c9                   leave
5:69CC  ca0600               retf 6
5:69CF  db 90
loc_69D0:
5:69D0  c45e06               les bx, ptr [bp + 6]
5:69D3  26ff7708             push word ptr es:[bx + 8]
5:69D7  689717               push 0x1797
5:69DA  9a296a0000           lcall 0, 0x6a29  ; USER.GetDlgItem
5:69DF  0bc0                 or ax, ax
5:69E1  7406                 je 0x69e9
5:69E3  50                   push ax
5:69E4  9a336a0000           lcall 0, 0x6a33  ; USER.DestroyWindow
loc_69E9:
5:69E9  c45e06               les bx, ptr [bp + 6]
5:69EC  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:69F2  9ad031096a           lcall 0x6a09, 0x31d0  ; sub_s4:31D0
5:69F7  0bc0                 or ax, ax
5:69F9  0f84e500             je 0x6ae2
5:69FD  c45e06               les bx, ptr [bp + 6]
5:6A00  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6A06  9a9a2d436a           lcall 0x6a43, 0x2d9a  ; sub_s4:2D9A
loc_6A0B:
5:6A0B  c45e06               les bx, ptr [bp + 6]
5:6A0E  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:6A14  90                   nop
5:6A15  0e                   push cs
5:6A16  e84109               call 0x735a  ; sub_s5:735A
5:6A19  c9                   leave
5:6A1A  ca0600               retf 6
5:6A1D  db 90
loc_6A1E:
5:6A1E  c45e06               les bx, ptr [bp + 6]
5:6A21  26ff7708             push word ptr es:[bx + 8]
5:6A25  689717               push 0x1797
5:6A28  9a676a0000           lcall 0, 0x6a67  ; USER.GetDlgItem
5:6A2D  0bc0                 or ax, ax
5:6A2F  7406                 je 0x6a37
5:6A31  50                   push ax
5:6A32  9a7e6a0000           lcall 0, 0x6a7e  ; USER.DestroyWindow
loc_6A37:
5:6A37  c45e06               les bx, ptr [bp + 6]
5:6A3A  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6A40  9ad031576a           lcall 0x6a57, 0x31d0  ; sub_s4:31D0
5:6A45  0bc0                 or ax, ax
5:6A47  0f849700             je 0x6ae2
5:6A4B  c45e06               les bx, ptr [bp + 6]
5:6A4E  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6A54  9ade2daa6a           lcall 0x6aaa, 0x2dde  ; sub_s4:2DDE
5:6A59  ebb0                 jmp 0x6a0b
5:6A5B  db 90
loc_6A5C:
5:6A5C  c45e06               les bx, ptr [bp + 6]
5:6A5F  26ff7708             push word ptr es:[bx + 8]
5:6A63  689717               push 0x1797
5:6A66  9a916a0000           lcall 0, 0x6a91  ; USER.GetDlgItem
5:6A6B  0bc0                 or ax, ax
5:6A6D  750d                 jne 0x6a7c
loc_6A6F:
5:6A6F  66ff7606             push dword ptr [bp + 6]
5:6A73  90                   nop
5:6A74  0e                   push cs
5:6A75  e82004               call 0x6e98  ; sub_s5:6E98
5:6A78  c9                   leave
5:6A79  ca0600               retf 6
loc_6A7C:
5:6A7C  50                   push ax
5:6A7D  9a653b0000           lcall 0, 0x3b65  ; USER.DestroyWindow
5:6A82  c9                   leave
5:6A83  ca0600               retf 6
loc_6A86:
5:6A86  c45e06               les bx, ptr [bp + 6]
5:6A89  26ff7708             push word ptr es:[bx + 8]
5:6A8D  689717               push 0x1797
5:6A90  9a66380000           lcall 0, 0x3866  ; USER.GetDlgItem
5:6A95  0bc0                 or ax, ax
5:6A97  7449                 je 0x6ae2
5:6A99  ebd4                 jmp 0x6a6f
5:6A9B  db 90
loc_6A9C:
5:6A9C  6a01                 push 1
5:6A9E  c45e06               les bx, ptr [bp + 6]
5:6AA1  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6AA7  9a282e1869           lcall 0x6918, 0x2e28  ; sub_s4:2E28
5:6AAC  50                   push ax
5:6AAD  666a00               push 0
5:6AB0  66ff7606             push dword ptr [bp + 6]
5:6AB4  9a0e3e6668           lcall 0x6866, 0x3e0e  ; sub_s2:3E0E
5:6AB9  eb27                 jmp 0x6ae2
5:6ABB  db 90
loc_6ABC:
5:6ABC  3db80b               cmp ax, 0xbb8
5:6ABF  0f840dff             je 0x69d0
5:6AC3  7711                 ja 0x6ad6
5:6AC5  2d2c01               sub ax, 0x12c
5:6AC8  0f84eafe             je 0x69b6
5:6ACC  2d0100               sub ax, 1
5:6ACF  7211                 jb 0x6ae2
5:6AD1  2d0100               sub ax, 1
5:6AD4  eb0c                 jmp 0x6ae2
loc_6AD6:
5:6AD6  2db90b               sub ax, 0xbb9
5:6AD9  0f8441ff             je 0x6a1e
5:6ADD  48                   dec ax
5:6ADE  0f847aff             je 0x6a5c
loc_6AE2:
5:6AE2  c9                   leave
5:6AE3  ca0600               retf 6

; ---------------- sub_s5:6AE6 size=180 callers=0
;   apis: USER.DestroyWindow, USER.GetDlgItem, USER.SendMessage
5:6AE6  c8560000             enter 0x56, 0
5:6AEA  8b460e               mov ax, word ptr [bp + 0xe]
5:6AED  2d9717               sub ax, 0x1797
5:6AF0  0f85a100             jne 0x6b95
5:6AF4  c45e06               les bx, ptr [bp + 6]
5:6AF7  26ff7708             push word ptr es:[bx + 8]
5:6AFB  ff760e               push word ptr [bp + 0xe]
5:6AFE  9adb690000           lcall 0, 0x69db  ; USER.GetDlgItem
5:6B03  8946fe               mov word ptr [bp - 2], ax
5:6B06  0bc0                 or ax, ax
5:6B08  0f848900             je 0x6b95
5:6B0C  8b460c               mov ax, word ptr [bp + 0xc]
5:6B0F  48                   dec ax
5:6B10  48                   dec ax
5:6B11  7407                 je 0x6b1a
5:6B13  48                   dec ax
5:6B14  7477                 je 0x6b8d
5:6B16  c9                   leave
5:6B17  ca0a00               retf 0xa
loc_6B1A:
5:6B1A  ff76fe               push word ptr [bp - 2]
5:6B1D  666800000904         push 0x4090000
5:6B23  666a00               push 0
5:6B26  9a476b0000           lcall 0, 0x6b47  ; USER.SendMessage
5:6B2B  8946fa               mov word ptr [bp - 6], ax
5:6B2E  8956fc               mov word ptr [bp - 4], dx
5:6B31  3dffff               cmp ax, 0xffff
5:6B34  7504                 jne 0x6b3a
5:6B36  3bd0                 cmp dx, ax
5:6B38  7453                 je 0x6b8d
loc_6B3A:
5:6B3A  ff76fe               push word ptr [bp - 2]
5:6B3D  680a04               push 0x40a
5:6B40  50                   push ax
5:6B41  8d46aa               lea ax, [bp - 0x56]
5:6B44  16                   push ss
5:6B45  50                   push ax
5:6B46  9abc660000           lcall 0, 0x66bc  ; USER.SendMessage
5:6B4B  8d46aa               lea ax, [bp - 0x56]
5:6B4E  16                   push ss
5:6B4F  50                   push ax
5:6B50  c45e06               les bx, ptr [bp + 6]
5:6B53  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6B59  9aca306a6b           lcall 0x6b6a, 0x30ca  ; sub_s4:30CA
5:6B5E  c45e06               les bx, ptr [bp + 6]
5:6B61  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6B67  9ae82ff569           lcall 0x69f5, 0x2fe8  ; sub_s4:2FE8
5:6B6C  0bc0                 or ax, ax
5:6B6E  741d                 je 0x6b8d
5:6B70  c45e06               les bx, ptr [bp + 6]
5:6B73  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:6B79  90                   nop
5:6B7A  0e                   push cs
5:6B7B  e8dc07               call 0x735a  ; sub_s5:735A
5:6B7E  68ef00               push 0xef
5:6B81  c45e06               les bx, ptr [bp + 6]
5:6B84  06                   push es
5:6B85  53                   push bx
5:6B86  26c41f               les bx, ptr es:[bx]
5:6B89  26ff5f40             lcall es:[bx + 0x40]
loc_6B8D:
5:6B8D  ff76fe               push word ptr [bp - 2]
5:6B90  9ae5690000           lcall 0, 0x69e5  ; USER.DestroyWindow
loc_6B95:
5:6B95  c9                   leave
5:6B96  ca0a00               retf 0xa
5:6B99  db 00

; ---------------- sub_s5:6B9A FAR size=34 callers=0
;   apis: USER.EnableMenuItem
5:6B9A  55                   push bp
5:6B9B  8bec                 mov bp, sp
5:6B9D  8b460c               mov ax, word ptr [bp + 0xc]
5:6BA0  eb12                 jmp 0x6bb4
loc_6BA2:
5:6BA2  ff760e               push word ptr [bp + 0xe]
5:6BA5  666800040000         push 0x400
5:6BAB  9ad7480000           lcall 0, 0x48d7  ; USER.EnableMenuItem
5:6BB0  c9                   leave
5:6BB1  ca0a00               retf 0xa
loc_6BB4:
5:6BB4  0bc0                 or ax, ax
5:6BB6  74ea                 je 0x6ba2
5:6BB8  c9                   leave
5:6BB9  ca0a00               retf 0xa

; ---------------- sub_s5:6BBC FAR size=22 callers=0
5:6BBC  55                   push bp
5:6BBD  8bec                 mov bp, sp
5:6BBF  c45e06               les bx, ptr [bp + 6]
5:6BC2  6626ffb7f600         push dword ptr es:[bx + 0xf6]
5:6BC8  90                   nop
5:6BC9  0e                   push cs
5:6BCA  e8ad07               call 0x737a  ; sub_s5:737A
5:6BCD  c9                   leave
5:6BCE  ca0400               retf 4
5:6BD1  db 00

; ---------------- sub_s5:6BD2 FAR size=104 callers=1
;   apis: USER.DestroyIcon
5:6BD2  c8080000             enter 8, 0
5:6BD6  56                   push si
5:6BD7  c45e06               les bx, ptr [bp + 6]
5:6BDA  26ffb7c200           push word ptr es:[bx + 0xc2]
5:6BDF  9a962c0000           lcall 0, 0x2c96  ; USER.DestroyIcon
5:6BE4  33c0                 xor ax, ax
5:6BE6  c45e06               les bx, ptr [bp + 6]
5:6BE9  268987c200           mov word ptr es:[bx + 0xc2], ax
5:6BEE  26894708             mov word ptr es:[bx + 8], ax
5:6BF2  268b87f600           mov ax, word ptr es:[bx + 0xf6]
5:6BF7  268b97f800           mov dx, word ptr es:[bx + 0xf8]
5:6BFC  8bda                 mov bx, dx
5:6BFE  0bd0                 or dx, ax
5:6C00  740e                 je 0x6c10
5:6C02  6a01                 push 1
5:6C04  53                   push bx
5:6C05  50                   push ax
5:6C06  8ec3                 mov es, bx
5:6C08  8bf0                 mov si, ax
5:6C0A  26c41c               les bx, ptr es:[si]
5:6C0D  26ff1f               lcall es:[bx]
loc_6C10:
5:6C10  c45e06               les bx, ptr [bp + 6]
5:6C13  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
5:6C1D  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6C23  9ada1d8969           lcall 0x6989, 0x1dda  ; sub_s3:1DDA
5:6C28  c45e06               les bx, ptr [bp + 6]
5:6C2B  6626c787f20000000000 mov dword ptr es:[bx + 0xf2], 0
5:6C35  5e                   pop si
5:6C36  c9                   leave
5:6C37  ca0400               retf 4

; ---------------- sub_s5:6C3A FAR size=536 callers=1
;   apis: USER.LoadIcon, USER.MoveWindow, USER.UpdateWindow
5:6C3A  c8300000             enter 0x30, 0
5:6C3E  57                   push di
5:6C3F  56                   push si
5:6C40  66ff7606             push dword ptr [bp + 6]
5:6C44  9a6097e86c           lcall 0x6ce8, 0x9760  ; sub_s2:9760
5:6C49  6a04                 push 4
5:6C4B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:6C50  9aba20266c           lcall 0x6c26, 0x20ba  ; sub_s3:20BA
5:6C55  c45e06               les bx, ptr [bp + 6]
5:6C58  268987f200           mov word ptr es:[bx + 0xf2], ax
5:6C5D  268997f400           mov word ptr es:[bx + 0xf4], dx
5:6C62  268b87f200           mov ax, word ptr es:[bx + 0xf2]
5:6C67  268987e000           mov word ptr es:[bx + 0xe0], ax
5:6C6C  268997e200           mov word ptr es:[bx + 0xe2], dx
5:6C71  ff368c03             push word ptr [0x38c]
5:6C75  1e                   push ds
5:6C76  680c44               push 0x440c  ; 'TILEICON'
5:6C79  9a352d0000           lcall 0, 0x2d35  ; USER.LoadIcon
5:6C7E  c45e06               les bx, ptr [bp + 6]
5:6C81  268987c200           mov word ptr es:[bx + 0xc2], ax
5:6C86  50                   push ax
5:6C87  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6C8D  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:6C92  26c41f               les bx, ptr es:[bx]
5:6C95  26ff5f30             lcall es:[bx + 0x30]
5:6C99  68b80b               push 0xbb8
5:6C9C  8d46fe               lea ax, [bp - 2]
5:6C9F  16                   push ss
5:6CA0  50                   push ax
5:6CA1  8d4efc               lea cx, [bp - 4]
5:6CA4  16                   push ss
5:6CA5  51                   push cx
5:6CA6  c45e06               les bx, ptr [bp + 6]
5:6CA9  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6CAF  9a222d036d           lcall 0x6d03, 0x2d22  ; sub_s4:2D22
5:6CB4  6a42                 push 0x42
5:6CB6  9a9c170a6d           lcall 0x6d0a, 0x179c  ; operator_new@s1:179C
5:6CBB  83c402               add sp, 2
5:6CBE  8946f8               mov word ptr [bp - 8], ax
5:6CC1  8956fa               mov word ptr [bp - 6], dx
5:6CC4  0bd0                 or dx, ax
5:6CC6  7422                 je 0x6cea
5:6CC8  c45e06               les bx, ptr [bp + 6]
5:6CCB  26ff7708             push word ptr es:[bx + 8]
5:6CCF  66687c00b80b         push 0xbb8007c
5:6CD5  666800007d00         push 0x7d0000
5:6CDB  66ff76fc             push dword ptr [bp - 4]
5:6CDF  6a00                 push 0
5:6CE1  ff76fa               push word ptr [bp - 6]
5:6CE4  50                   push ax
5:6CE5  9ad63b396d           lcall 0x6d39, 0x3bd6  ; sub_s2:3BD6
loc_6CEA:
5:6CEA  68b90b               push 0xbb9
5:6CED  8d46fe               lea ax, [bp - 2]
5:6CF0  16                   push ss
5:6CF1  50                   push ax
5:6CF2  8d4efc               lea cx, [bp - 4]
5:6CF5  16                   push ss
5:6CF6  51                   push cx
5:6CF7  c45e06               les bx, ptr [bp + 6]
5:6CFA  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6D00  9a222d546d           lcall 0x6d54, 0x2d22  ; sub_s4:2D22
5:6D05  6a42                 push 0x42
5:6D07  9a9c175b6d           lcall 0x6d5b, 0x179c  ; operator_new@s1:179C
5:6D0C  83c402               add sp, 2
5:6D0F  8946f8               mov word ptr [bp - 8], ax
5:6D12  8956fa               mov word ptr [bp - 6], dx
5:6D15  0bd0                 or dx, ax
5:6D17  7422                 je 0x6d3b
5:6D19  c45e06               les bx, ptr [bp + 6]
5:6D1C  26ff7708             push word ptr es:[bx + 8]
5:6D20  66687e00b90b         push 0xbb9007e
5:6D26  666800007f00         push 0x7f0000
5:6D2C  66ff76fc             push dword ptr [bp - 4]
5:6D30  6a00                 push 0
5:6D32  ff76fa               push word ptr [bp - 6]
5:6D35  50                   push ax
5:6D36  9ad63b8a6d           lcall 0x6d8a, 0x3bd6  ; sub_s2:3BD6
loc_6D3B:
5:6D3B  68ba0b               push 0xbba
5:6D3E  8d46fe               lea ax, [bp - 2]
5:6D41  16                   push ss
5:6D42  50                   push ax
5:6D43  8d4efc               lea cx, [bp - 4]
5:6D46  16                   push ss
5:6D47  51                   push cx
5:6D48  c45e06               les bx, ptr [bp + 6]
5:6D4B  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6D51  9a222d5c6b           lcall 0x6b5c, 0x2d22  ; sub_s4:2D22
5:6D56  6a42                 push 0x42
5:6D58  9a9c17916d           lcall 0x6d91, 0x179c  ; operator_new@s1:179C
5:6D5D  83c402               add sp, 2
5:6D60  8946f8               mov word ptr [bp - 8], ax
5:6D63  8956fa               mov word ptr [bp - 6], dx
5:6D66  0bd0                 or dx, ax
5:6D68  7422                 je 0x6d8c
5:6D6A  c45e06               les bx, ptr [bp + 6]
5:6D6D  26ff7708             push word ptr es:[bx + 8]
5:6D71  6668b001ba0b         push 0xbba01b0
5:6D77  6668b201b101         push 0x1b101b2
5:6D7D  66ff76fc             push dword ptr [bp - 4]
5:6D81  6a00                 push 0
5:6D83  ff76fa               push word ptr [bp - 6]
5:6D86  50                   push ax
5:6D87  9ad63bb76a           lcall 0x6ab7, 0x3bd6  ; sub_s2:3BD6
loc_6D8C:
5:6D8C  6a22                 push 0x22
5:6D8E  9a9c170f68           lcall 0x680f, 0x179c  ; operator_new@s1:179C
5:6D93  83c402               add sp, 2
5:6D96  8946f8               mov word ptr [bp - 8], ax
5:6D99  8956fa               mov word ptr [bp - 6], dx
5:6D9C  0bd0                 or dx, ax
5:6D9E  741c                 je 0x6dbc
5:6DA0  66ff7606             push dword ptr [bp + 6]
5:6DA4  ff76fa               push word ptr [bp - 6]
5:6DA7  50                   push ax
5:6DA8  90                   nop
5:6DA9  0e                   push cs
5:6DAA  e8d103               call 0x717e  ; sub_s5:717E
5:6DAD  c45e06               les bx, ptr [bp + 6]
5:6DB0  268987f600           mov word ptr es:[bx + 0xf6], ax
5:6DB5  268997f800           mov word ptr es:[bx + 0xf8], dx
5:6DBA  eb0d                 jmp 0x6dc9
loc_6DBC:
5:6DBC  c45e06               les bx, ptr [bp + 6]
5:6DBF  6626c787f60000000000 mov dword ptr es:[bx + 0xf6], 0
loc_6DC9:
5:6DC9  c45e06               les bx, ptr [bp + 6]
5:6DCC  66268b87f600         mov eax, dword ptr es:[bx + 0xf6]
5:6DD2  66268987e800         mov dword ptr es:[bx + 0xe8], eax
5:6DD8  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6DDE  26c49ff200           les bx, ptr es:[bx + 0xf2]
5:6DE3  26c41f               les bx, ptr es:[bx]
5:6DE6  26ff5f10             lcall es:[bx + 0x10]
5:6DEA  8ec2                 mov es, dx
5:6DEC  8bd8                 mov bx, ax
5:6DEE  8946ea               mov word ptr [bp - 0x16], ax
5:6DF1  8c46ec               mov word ptr [bp - 0x14], es
5:6DF4  268b4706             mov ax, word ptr es:[bx + 6]
5:6DF8  8946d2               mov word ptr [bp - 0x2e], ax
5:6DFB  268b4f04             mov cx, word ptr es:[bx + 4]
5:6DFF  894ed4               mov word ptr [bp - 0x2c], cx
5:6E02  268b5702             mov dx, word ptr es:[bx + 2]
5:6E06  8956d6               mov word ptr [bp - 0x2a], dx
5:6E09  268b37               mov si, word ptr es:[bx]
5:6E0C  8976d8               mov word ptr [bp - 0x28], si
5:6E0F  c45e06               les bx, ptr [bp + 6]
5:6E12  26ff7708             push word ptr es:[bx + 8]
5:6E16  56                   push si
5:6E17  52                   push dx
5:6E18  51                   push cx
5:6E19  50                   push ax
5:6E1A  6a01                 push 1
5:6E1C  9a5f3a0000           lcall 0, 0x3a5f  ; USER.MoveWindow
5:6E21  6a00                 push 0
5:6E23  c45e06               les bx, ptr [bp + 6]
5:6E26  06                   push es
5:6E27  53                   push bx
5:6E28  26c41f               les bx, ptr es:[bx]
5:6E2B  8bf3                 mov si, bx
5:6E2D  8cc7                 mov di, es
5:6E2F  26ff9f9400           lcall es:[bx + 0x94]
5:6E34  6a01                 push 1
5:6E36  66ff7606             push dword ptr [bp + 6]
5:6E3A  8ec7                 mov es, di
5:6E3C  26ff5c10             lcall es:[si + 0x10]
5:6E40  c45e06               les bx, ptr [bp + 6]
5:6E43  26ff7708             push word ptr es:[bx + 8]
5:6E47  9a1b2e0000           lcall 0, 0x2e1b  ; USER.UpdateWindow
5:6E4C  5e                   pop si
5:6E4D  5f                   pop di
5:6E4E  c9                   leave
5:6E4F  ca0400               retf 4

; ---------------- sub_s5:6E52 size=70 callers=0
5:6E52  c8080000             enter 8, 0
5:6E56  c45e06               les bx, ptr [bp + 6]
5:6E59  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6E5F  9a5e2e746e           lcall 0x6e74, 0x2e5e  ; sub_s4:2E5E
5:6E64  0bd0                 or dx, ax
5:6E66  7410                 je 0x6e78
5:6E68  c45e06               les bx, ptr [bp + 6]
5:6E6B  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6E71  9a842db26c           lcall 0x6cb2, 0x2d84  ; sub_s4:2D84
5:6E76  eb0d                 jmp 0x6e85
loc_6E78:
5:6E78  68a105               push 0x5a1
5:6E7B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:6E80  9a7e84536c           lcall 0x6c53, 0x847e  ; LoadStringRes@s3:847E
loc_6E85:
5:6E85  52                   push dx
5:6E86  50                   push ax
5:6E87  66ff7608             push dword ptr [bp + 8]
5:6E8B  ff7606               push word ptr [bp + 6]
5:6E8E  90                   nop
5:6E8F  0e                   push cs
5:6E90  e8210b               call 0x79b4  ; sub_s5:79B4
5:6E93  c9                   leave
5:6E94  ca0600               retf 6
5:6E97  db 00

; ---------------- sub_s5:6E98 FAR size=472 callers=1
;   apis: USER.CreateWindow, USER.DestroyWindow, USER.GetClientRect, USER.GetDlgItem, USER.SendMessage, USER.SetFocus, USER.ShowWindow
5:6E98  c8220000             enter 0x22, 0
5:6E9C  56                   push si
5:6E9D  c45e06               les bx, ptr [bp + 6]
5:6EA0  26ff7708             push word ptr es:[bx + 8]
5:6EA4  8d46f8               lea ax, [bp - 8]
5:6EA7  16                   push ss
5:6EA8  50                   push ax
5:6EA9  9a24310000           lcall 0, 0x3124  ; USER.GetClientRect
5:6EAE  66c746f400000000     mov dword ptr [bp - 0xc], 0
5:6EB6  c45e06               les bx, ptr [bp + 6]
5:6EB9  26ff7708             push word ptr es:[bx + 8]
5:6EBD  689717               push 0x1797
5:6EC0  9aff6a0000           lcall 0, 0x6aff  ; USER.GetDlgItem
5:6EC5  8946f2               mov word ptr [bp - 0xe], ax
5:6EC8  0bc0                 or ax, ax
5:6ECA  7406                 je 0x6ed2
5:6ECC  50                   push ax
5:6ECD  9a916b0000           lcall 0, 0x6b91  ; USER.DestroyWindow
loc_6ED2:
5:6ED2  8d46f4               lea ax, [bp - 0xc]
5:6ED5  16                   push ss
5:6ED6  50                   push ax
5:6ED7  c45e06               les bx, ptr [bp + 6]
5:6EDA  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6EE0  9afc30446f           lcall 0x6f44, 0x30fc  ; sub_s4:30FC
5:6EE5  8b46f6               mov ax, word ptr [bp - 0xa]
5:6EE8  0b46f4               or ax, word ptr [bp - 0xc]
5:6EEB  0f847c01             je 0x706b
5:6EEF  1e                   push ds
5:6EF0  681644               push 0x4416  ; 'listbox'
5:6EF3  1e                   push ds
5:6EF4  681544               push 0x4415
5:6EF7  66680301a040         push 0x40a00103
5:6EFD  666a00               push 0
5:6F00  ff76fc               push word ptr [bp - 4]
5:6F03  8b46fe               mov ax, word ptr [bp - 2]
5:6F06  2d1900               sub ax, 0x19
5:6F09  50                   push ax
5:6F0A  c45e06               les bx, ptr [bp + 6]
5:6F0D  26ff7708             push word ptr es:[bx + 8]
5:6F11  689717               push 0x1797
5:6F14  ff368c03             push word ptr [0x38c]
5:6F18  66ff76f4             push dword ptr [bp - 0xc]
5:6F1C  9affff0000           lcall 0, 0xffff  ; USER.CreateWindow
5:6F21  8946f2               mov word ptr [bp - 0xe], ax
5:6F24  0bc0                 or ax, ax
5:6F26  7530                 jne 0x6f58
5:6F28  668b46f4             mov eax, dword ptr [bp - 0xc]
5:6F2C  8b56f6               mov dx, word ptr [bp - 0xa]
5:6F2F  668946e6             mov dword ptr [bp - 0x1a], eax
5:6F33  668946ea             mov dword ptr [bp - 0x16], eax
5:6F37  0bd0                 or dx, ax
5:6F39  0f842e01             je 0x706b
5:6F3D  ff76f6               push word ptr [bp - 0xa]
5:6F40  50                   push ax
5:6F41  9afa2afb6f           lcall 0x6ffb, 0x2afa  ; sub_s4:2AFA
5:6F46  66ff76ea             push dword ptr [bp - 0x16]
5:6F4A  9ace175470           lcall 0x7054, 0x17ce  ; operator_delete@s1:17CE
5:6F4F  83c404               add sp, 4
5:6F52  5e                   pop si
5:6F53  c9                   leave
5:6F54  ca0400               retf 4
5:6F57  db 90
loc_6F58:
5:6F58  50                   push ax
5:6F59  666800000b00         push 0xb0000
5:6F5F  666a00               push 0
5:6F62  9aa56f0000           lcall 0, 0x6fa5  ; USER.SendMessage
5:6F67  c45ef4               les bx, ptr [bp - 0xc]
5:6F6A  26837f0400           cmp word ptr es:[bx + 4], 0
5:6F6F  7441                 je 0x6fb2
5:6F71  c746de0000           mov word ptr [bp - 0x22], 0
5:6F76  eb03                 jmp 0x6f7b
loc_6F78:
5:6F78  ff46de               inc word ptr [bp - 0x22]
loc_6F7B:
5:6F7B  8b46de               mov ax, word ptr [bp - 0x22]
5:6F7E  c45ef4               les bx, ptr [bp - 0xc]
5:6F81  26394704             cmp word ptr es:[bx + 4], ax
5:6F85  7e4e                 jle 0x6fd5
5:6F87  ff76f2               push word ptr [bp - 0xe]
5:6F8A  666800000104         push 0x4010000
5:6F90  8bf0                 mov si, ax
5:6F92  03f0                 add si, ax
5:6F94  26c41f               les bx, ptr es:[bx]
5:6F97  26ff30               push word ptr es:[bx + si]
5:6F9A  90                   nop
5:6F9B  0e                   push cs
5:6F9C  e8e14d               call 0xbd80  ; sub_s5:BD80
5:6F9F  83c402               add sp, 2
5:6FA2  52                   push dx
5:6FA3  50                   push ax
5:6FA4  9acb6f0000           lcall 0, 0x6fcb  ; USER.SendMessage
5:6FA9  8946ee               mov word ptr [bp - 0x12], ax
5:6FAC  8956f0               mov word ptr [bp - 0x10], dx
5:6FAF  ebc7                 jmp 0x6f78
5:6FB1  db 90
loc_6FB2:
5:6FB2  ff76f2               push word ptr [bp - 0xe]
5:6FB5  666800000104         push 0x4010000
5:6FBB  683105               push 0x531
5:6FBE  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:6FC3  9a7e84836e           lcall 0x6e83, 0x847e  ; LoadStringRes@s3:847E
5:6FC8  52                   push dx
5:6FC9  50                   push ax
5:6FCA  9ae26f0000           lcall 0, 0x6fe2  ; USER.SendMessage
5:6FCF  8946ee               mov word ptr [bp - 0x12], ax
5:6FD2  8956f0               mov word ptr [bp - 0x10], dx
loc_6FD5:
5:6FD5  ff76f2               push word ptr [bp - 0xe]
5:6FD8  666801000b00         push 0xb0001
5:6FDE  666a00               push 0
5:6FE1  9a00700000           lcall 0, 0x7000  ; USER.SendMessage
5:6FE6  ff76f2               push word ptr [bp - 0xe]
5:6FE9  6668ffff0d04         push 0x40dffff
5:6FEF  c45e06               les bx, ptr [bp + 6]
5:6FF2  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:6FF8  9a842d4b70           lcall 0x704b, 0x2d84  ; sub_s4:2D84
5:6FFD  52                   push dx
5:6FFE  50                   push ax
5:6FFF  9a20700000           lcall 0, 0x7020  ; USER.SendMessage
5:7004  8946ee               mov word ptr [bp - 0x12], ax
5:7007  8956f0               mov word ptr [bp - 0x10], dx
5:700A  3dffff               cmp ax, 0xffff
5:700D  7504                 jne 0x7013
5:700F  3bd0                 cmp dx, ax
5:7011  7420                 je 0x7033
loc_7013:
5:7013  ff76f2               push word ptr [bp - 0xe]
5:7016  680704               push 0x407
5:7019  50                   push ax
5:701A  666a00               push 0
5:701D  8bf0                 mov si, ax
5:701F  9a2f700000           lcall 0, 0x702f  ; USER.SendMessage
5:7024  ff76f2               push word ptr [bp - 0xe]
5:7027  681804               push 0x418
5:702A  56                   push si
5:702B  666a00               push 0
5:702E  9a276b0000           lcall 0, 0x6b27  ; USER.SendMessage
loc_7033:
5:7033  668b46f4             mov eax, dword ptr [bp - 0xc]
5:7037  668946ea             mov dword ptr [bp - 0x16], eax
5:703B  668946e6             mov dword ptr [bp - 0x1a], eax
5:703F  660bc0               or eax, eax
5:7042  7415                 je 0x7059
5:7044  ff76f6               push word ptr [bp - 0xa]
5:7047  50                   push ax
5:7048  9afa2a626e           lcall 0x6e62, 0x2afa  ; sub_s4:2AFA
5:704D  66ff76e6             push dword ptr [bp - 0x1a]
5:7051  9ace17b96c           lcall 0x6cb9, 0x17ce  ; operator_delete@s1:17CE
5:7056  83c404               add sp, 4
loc_7059:
5:7059  ff76f2               push word ptr [bp - 0xe]
5:705C  6a01                 push 1
5:705E  9affff0000           lcall 0, 0xffff  ; USER.ShowWindow
5:7063  ff76f2               push word ptr [bp - 0xe]
5:7066  9a6c380000           lcall 0, 0x386c  ; USER.SetFocus
loc_706B:
5:706B  5e                   pop si
5:706C  c9                   leave
5:706D  ca0400               retf 4

; ---------------- sub_s5:7070 size=80 callers=0
;   apis: GDI.GetStockObject, GDI.SetBkColor, GDI.SetTextColor
5:7070  c8020000             enter 2, 0
5:7074  6a04                 push 4
5:7076  9a17680000           lcall 0, 0x6817  ; GDI.GetStockObject
5:707B  8946fe               mov word ptr [bp - 2], ax
5:707E  66833e1e4400         cmp dword ptr [0x441e], 0
5:7084  7509                 jne 0x708f
5:7086  66c7061e4402000001   mov dword ptr [0x441e], 0x1000002
loc_708F:
5:708F  8b460c               mov ax, word ptr [bp + 0xc]
5:7092  2d0600               sub ax, 6
5:7095  7607                 jbe 0x709e
5:7097  33c0                 xor ax, ax
5:7099  c9                   leave
5:709A  ca0a00               retf 0xa
5:709D  db 90
loc_709E:
5:709E  ff760e               push word ptr [bp + 0xe]
5:70A1  66ff361e44           push dword ptr [0x441e]
5:70A6  9affff0000           lcall 0, 0xffff  ; GDI.SetTextColor
5:70AB  ff760e               push word ptr [bp + 0xe]
5:70AE  666800000001         push 0x1000000
5:70B4  9affff0000           lcall 0, 0xffff  ; GDI.SetBkColor
5:70B9  8b46fe               mov ax, word ptr [bp - 2]
5:70BC  c9                   leave
5:70BD  ca0a00               retf 0xa

; ---------------- sub_s5:70C0 size=190 callers=0
5:70C0  c8040000             enter 4, 0
5:70C4  66ff7606             push dword ptr [bp + 6]
5:70C8  90                   nop
5:70C9  0e                   push cs
5:70CA  e88f08               call 0x795c  ; sub_s5:795C
5:70CD  f6460a01             test byte ptr [bp + 0xa], 1
5:70D1  7409                 je 0x70dc
5:70D3  66ff7606             push dword ptr [bp + 6]
5:70D7  9ace174d6f           lcall 0x6f4d, 0x17ce  ; operator_delete@s1:17CE
loc_70DC:
5:70DC  8b4606               mov ax, word ptr [bp + 6]
5:70DF  8b5608               mov dx, word ptr [bp + 8]
5:70E2  c9                   leave
5:70E3  ca0600               retf 6
5:70E6  db c0 70 f0 70 ea 68 f4 70 3a 6c fc 70 c6 68 f8 70
5:70F6  db 40 96 00 71 b4 79 1c 71 2c 37 04 71 f2 97 08 71
5:7106  db 3c 37 0c 71 40 37 10 71 44 37 14 71 48 37 18 71
5:7116  db 4c 37 20 71 bc 6b 24 71 98 96 38 71 7c 68 28 71
5:7126  db 4c 69 2c 71 e6 6a 30 71 ae 79 34 71 9a 6b 44 71
5:7136  db 4e 9c 3c 71 62 37 40 71 4a 9c 4c 71 fc 68 48 71
5:7146  db d2 7a 60 71 4a 6a 50 71 2e 6b 54 71 02 6b 58 71
5:7156  db 7a 37 5c 71 52 9c 6c 71 70 70 64 71 e4 79 68 71
5:7166  db fc 79 78 71 86 9c 70 71 c4 9c 74 71 e0 9c 47 6c
5:7176  db 96 68 7c 71 52 6e 01 68

; ---------------- sub_s5:717E FAR size=242 callers=1
;   apis: USER.GetDC
5:717E  c8220000             enter 0x22, 0
5:7182  66ff760a             push dword ptr [bp + 0xa]
5:7186  66ff7606             push dword ptr [bp + 6]
5:718A  90                   nop
5:718B  0e                   push cs
5:718C  e88b0a               call 0x7c1a  ; sub_s5:7C1A
5:718F  c45e06               les bx, ptr [bp + 6]
5:7192  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:719B  668b460a             mov eax, dword ptr [bp + 0xa]
5:719F  6626894718           mov dword ptr es:[bx + 0x18], eax
5:71A4  662bc0               sub eax, eax
5:71A7  662689471c           mov dword ptr es:[bx + 0x1c], eax
5:71AC  26894720             mov word ptr es:[bx + 0x20], ax
5:71B0  26c7074c75           mov word ptr es:[bx], 0x754c
5:71B5  26c74702e870         mov word ptr es:[bx + 2], 0x70e8  ; SEGMENT s5:0000
5:71BB  6a04                 push 4
5:71BD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:71C2  9aba203472           lcall 0x7234, 0x20ba  ; sub_s3:20BA
5:71C7  c45e06               les bx, ptr [bp + 6]
5:71CA  2689471c             mov word ptr es:[bx + 0x1c], ax
5:71CE  2689571e             mov word ptr es:[bx + 0x1e], dx
5:71D2  06                   push es
5:71D3  53                   push bx
5:71D4  6a00                 push 0
5:71D6  52                   push dx
5:71D7  26ff771c             push word ptr es:[bx + 0x1c]
5:71DB  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:71DF  26c41f               les bx, ptr es:[bx]
5:71E2  26ff5f04             lcall es:[bx + 4]
5:71E6  c45e06               les bx, ptr [bp + 6]
5:71E9  26ff7704             push word ptr es:[bx + 4]
5:71ED  9aff3d0000           lcall 0, 0x3dff  ; USER.GetDC
5:71F2  8946fe               mov word ptr [bp - 2], ax
5:71F5  8946e6               mov word ptr [bp - 0x1a], ax
5:71F8  c45e06               les bx, ptr [bp + 6]
5:71FB  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:71FF  2689877801           mov word ptr es:[bx + 0x178], ax
5:7204  c45e06               les bx, ptr [bp + 6]
5:7207  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:720B  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:7210  268b5726             mov dx, word ptr es:[bx + 0x26]
5:7214  668946fa             mov dword ptr [bp - 6], eax
5:7218  52                   push dx
5:7219  c45efa               les bx, ptr [bp - 6]
5:721C  50                   push ax
5:721D  26c41f               les bx, ptr es:[bx]
5:7220  26ff5f14             lcall es:[bx + 0x14]
5:7224  8946f6               mov word ptr [bp - 0xa], ax
5:7227  8956f8               mov word ptr [bp - 8], dx
5:722A  6a29                 push 0x29
5:722C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:7231  9aba20c66f           lcall 0x6fc6, 0x20ba  ; sub_s3:20BA
5:7236  8946f2               mov word ptr [bp - 0xe], ax
5:7239  8956f4               mov word ptr [bp - 0xc], dx
5:723C  c45ef2               les bx, ptr [bp - 0xe]
5:723F  66268b470e           mov eax, dword ptr es:[bx + 0xe]
5:7244  668946ee             mov dword ptr [bp - 0x12], eax
5:7248  6650                 push eax
5:724A  66ff76f6             push dword ptr [bp - 0xa]
5:724E  9a844d5f72           lcall 0x725f, 0x4d84  ; sub_s2:4D84
5:7253  8d46fe               lea ax, [bp - 2]
5:7256  16                   push ss
5:7257  50                   push ax
5:7258  66ff76ee             push dword ptr [bp - 0x12]
5:725C  9a084eec70           lcall 0x70ec, 0x4e08  ; sub_s2:4E08
5:7261  c45e06               les bx, ptr [bp + 6]
5:7264  26894720             mov word ptr es:[bx + 0x20], ax
5:7268  8bc3                 mov ax, bx
5:726A  8cc2                 mov dx, es
5:726C  c9                   leave
5:726D  ca0800               retf 8

; ---------------- sub_s5:7270 FAR size=152 callers=1
;   apis: GDI.DeleteObject, USER.SelectPalette
5:7270  c8200000             enter 0x20, 0
5:7274  c45e06               les bx, ptr [bp + 6]
5:7277  26c7074c75           mov word ptr es:[bx], 0x754c
5:727C  26c74702b971         mov word ptr es:[bx + 2], 0x71b9  ; SEGMENT s5:0000
5:7282  6626837f1c00         cmp dword ptr es:[bx + 0x1c], 0
5:7288  740c                 je 0x7296
5:728A  06                   push es
5:728B  53                   push bx
5:728C  6626ff771c           push dword ptr es:[bx + 0x1c]
5:7291  9aa61ec571           lcall 0x71c5, 0x1ea6  ; sub_s3:1EA6
loc_7296:
5:7296  c45e06               les bx, ptr [bp + 6]
5:7299  268b4714             mov ax, word ptr es:[bx + 0x14]
5:729D  268b5716             mov dx, word ptr es:[bx + 0x16]
5:72A1  8bda                 mov bx, dx
5:72A3  8946fa               mov word ptr [bp - 6], ax
5:72A6  8956fc               mov word ptr [bp - 4], dx
5:72A9  0bd8                 or bx, ax
5:72AB  7413                 je 0x72c0
5:72AD  52                   push dx
5:72AE  50                   push ax
5:72AF  9a1851f472           lcall 0x72f4, 0x5118  ; sub_s2:5118
5:72B4  66ff76fa             push dword ptr [bp - 6]
5:72B8  9ace17da70           lcall 0x70da, 0x17ce  ; operator_delete@s1:17CE
5:72BD  83c404               add sp, 4
loc_72C0:
5:72C0  c45e06               les bx, ptr [bp + 6]
5:72C3  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:72C7  268b877801           mov ax, word ptr es:[bx + 0x178]
5:72CC  50                   push ax
5:72CD  c45e06               les bx, ptr [bp + 6]
5:72D0  26ff7720             push word ptr es:[bx + 0x20]
5:72D4  6a00                 push 0
5:72D6  9ad93e0000           lcall 0, 0x3ed9  ; USER.SelectPalette
5:72DB  c45e06               les bx, ptr [bp + 6]
5:72DE  26894720             mov word ptr es:[bx + 0x20], ax
5:72E2  50                   push ax
5:72E3  9abe410000           lcall 0, 0x41be  ; GDI.DeleteObject
5:72E8  c45e06               les bx, ptr [bp + 6]
5:72EB  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:72F0  26c747020273         mov word ptr es:[bx + 2], 0x7302  ; SEGMENT s2:0000
5:72F6  c45e06               les bx, ptr [bp + 6]
5:72F9  26c7079a38           mov word ptr es:[bx], 0x389a
5:72FE  26c747025172         mov word ptr es:[bx + 2], 0x7251  ; SEGMENT s2:0000
5:7304  c9                   leave
5:7305  ca0400               retf 4

; ---------------- sub_s5:7308 FAR size=82 callers=0
;   apis: USER.PostMessage
5:7308  55                   push bp
5:7309  8bec                 mov bp, sp
5:730B  8b460a               mov ax, word ptr [bp + 0xa]
5:730E  eb32                 jmp 0x7342
loc_7310:
5:7310  c45e06               les bx, ptr [bp + 6]
5:7313  26ff7704             push word ptr es:[bx + 4]
5:7317  6668eb001101         push 0x11100eb
5:731D  666a00               push 0
5:7320  9ac7690000           lcall 0, 0x69c7  ; USER.PostMessage
5:7325  66ff7606             push dword ptr [bp + 6]
5:7329  90                   nop
5:732A  0e                   push cs
5:732B  e82c00               call 0x735a  ; sub_s5:735A
5:732E  c9                   leave
5:732F  ca0600               retf 6
loc_7332:
5:7332  c45e06               les bx, ptr [bp + 6]
5:7335  6626c7471c00000000   mov dword ptr es:[bx + 0x1c], 0
5:733E  c9                   leave
5:733F  ca0600               retf 6
loc_7342:
5:7342  3d1200               cmp ax, 0x12
5:7345  74c9                 je 0x7310
5:7347  770c                 ja 0x7355
5:7349  fec8                 dec al
5:734B  74e5                 je 0x7332
5:734D  2c04                 sub al, 4
5:734F  7c04                 jl 0x7355
5:7351  fec8                 dec al
5:7353  7ebb                 jle 0x7310
loc_7355:
5:7355  c9                   leave
5:7356  ca0600               retf 6
5:7359  db 00

; ---------------- sub_s5:735A FAR size=32 callers=4
;   apis: USER.InvalidateRect
5:735A  c8080000             enter 8, 0
5:735E  c45e06               les bx, ptr [bp + 6]
5:7361  26ff7704             push word ptr es:[bx + 4]
5:7365  66268b471c           mov eax, dword ptr es:[bx + 0x1c]
5:736A  056c01               add ax, 0x16c
5:736D  6650                 push eax
5:736F  6a00                 push 0
5:7371  9a5b660000           lcall 0, 0x665b  ; USER.InvalidateRect
5:7376  c9                   leave
5:7377  ca0400               retf 4

; ---------------- sub_s5:737A FAR size=428 callers=1
;   apis: GDI.GetStockObject, USER.BeginPaint, USER.DrawIcon, USER.EndPaint, USER.FillRect, USER.GetClientRect, USER.GetDlgItem, USER.IsIconic, USER.ShowWindow
5:737A  c8540000             enter 0x54, 0
5:737E  c45e06               les bx, ptr [bp + 6]
5:7381  26ff7704             push word ptr es:[bx + 4]
5:7385  8d46e0               lea ax, [bp - 0x20]
5:7388  16                   push ss
5:7389  50                   push ax
5:738A  9a9a650000           lcall 0, 0x659a  ; USER.BeginPaint
5:738F  8946de               mov word ptr [bp - 0x22], ax
5:7392  c45e06               les bx, ptr [bp + 6]
5:7395  26ff7704             push word ptr es:[bx + 4]
5:7399  9a25660000           lcall 0, 0x6625  ; USER.IsIconic
5:739E  0bc0                 or ax, ax
5:73A0  0f848600             je 0x742a
5:73A4  833e100000           cmp word ptr [0x10], 0
5:73A9  0f856301             jne 0x7510
5:73AD  c45e06               les bx, ptr [bp + 6]
5:73B0  6626ff771c           push dword ptr es:[bx + 0x1c]
5:73B5  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:73B9  26c41f               les bx, ptr es:[bx]
5:73BC  26ff5f2c             lcall es:[bx + 0x2c]
5:73C0  8946dc               mov word ptr [bp - 0x24], ax
5:73C3  0bc0                 or ax, ax
5:73C5  0f844701             je 0x7510
5:73C9  6a04                 push 4
5:73CB  9a77700000           lcall 0, 0x7077  ; GDI.GetStockObject
5:73D0  8946da               mov word ptr [bp - 0x26], ax
5:73D3  c45e06               les bx, ptr [bp + 6]
5:73D6  26ff7704             push word ptr es:[bx + 4]
5:73DA  8d46d2               lea ax, [bp - 0x2e]
5:73DD  16                   push ss
5:73DE  50                   push ax
5:73DF  9aaa6e0000           lcall 0, 0x6eaa  ; USER.GetClientRect
5:73E4  33c0                 xor ax, ax
5:73E6  8946c6               mov word ptr [bp - 0x3a], ax
5:73E9  8946c8               mov word ptr [bp - 0x38], ax
5:73EC  8b46d6               mov ax, word ptr [bp - 0x2a]
5:73EF  2b46d2               sub ax, word ptr [bp - 0x2e]
5:73F2  48                   dec ax
5:73F3  8946d0               mov word ptr [bp - 0x30], ax
5:73F6  8946ca               mov word ptr [bp - 0x36], ax
5:73F9  8b46d8               mov ax, word ptr [bp - 0x28]
5:73FC  2b46d4               sub ax, word ptr [bp - 0x2c]
5:73FF  48                   dec ax
5:7400  8946ce               mov word ptr [bp - 0x32], ax
5:7403  8946cc               mov word ptr [bp - 0x34], ax
5:7406  ff76de               push word ptr [bp - 0x22]
5:7409  8d46c6               lea ax, [bp - 0x3a]
5:740C  16                   push ss
5:740D  50                   push ax
5:740E  ff76da               push word ptr [bp - 0x26]
5:7411  9a56310000           lcall 0, 0x3156  ; USER.FillRect
5:7416  ff76de               push word ptr [bp - 0x22]
5:7419  666802000200         push 0x20002
5:741F  ff76dc               push word ptr [bp - 0x24]
5:7422  9a67310000           lcall 0, 0x3167  ; USER.DrawIcon
5:7427  e9e600               jmp 0x7510
loc_742A:
5:742A  c45e06               les bx, ptr [bp + 6]
5:742D  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:7431  66268b4724           mov eax, dword ptr es:[bx + 0x24]
5:7436  668946c6             mov dword ptr [bp - 0x3a], eax
5:743A  c45e06               les bx, ptr [bp + 6]
5:743D  6626ff771c           push dword ptr es:[bx + 0x1c]
5:7442  9a5e2ee36e           lcall 0x6ee3, 0x2e5e  ; sub_s4:2E5E
5:7447  8946d2               mov word ptr [bp - 0x2e], ax
5:744A  8956d4               mov word ptr [bp - 0x2c], dx
5:744D  666835000c00         push 0xc0035  ; 'New failed in Op::Op->ResLibr'
5:7453  6a00                 push 0
5:7455  8d46c0               lea ax, [bp - 0x40]
5:7458  16                   push ss
5:7459  50                   push ax
5:745A  9a543e7274           lcall 0x7472, 0x3e54  ; sub_s2:3E54
5:745F  c45e06               les bx, ptr [bp + 6]
5:7462  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
5:7468  740a                 je 0x7474
5:746A  6626ff7714           push dword ptr es:[bx + 0x14]
5:746F  9a36529d74           lcall 0x749d, 0x5236  ; sub_s2:5236
loc_7474:
5:7474  66837ed200           cmp dword ptr [bp - 0x2e], 0
5:7479  744d                 je 0x74c8
5:747B  c45e06               les bx, ptr [bp + 6]
5:747E  268b4714             mov ax, word ptr es:[bx + 0x14]
5:7482  268b5716             mov dx, word ptr es:[bx + 0x16]
5:7486  8bda                 mov bx, dx
5:7488  8946b0               mov word ptr [bp - 0x50], ax
5:748B  8956b2               mov word ptr [bp - 0x4e], dx
5:748E  8946b4               mov word ptr [bp - 0x4c], ax
5:7491  8956b6               mov word ptr [bp - 0x4a], dx
5:7494  0bd8                 or bx, ax
5:7496  7413                 je 0x74ab
5:7498  52                   push dx
5:7499  50                   push ax
5:749A  9a1851bb74           lcall 0x74bb, 0x5118  ; sub_s2:5118
5:749F  66ff76b4             push dword ptr [bp - 0x4c]
5:74A3  9ace17bb72           lcall 0x72bb, 0x17ce  ; operator_delete@s1:17CE
5:74A8  83c404               add sp, 4
loc_74AB:
5:74AB  66ff76c6             push dword ptr [bp - 0x3a]
5:74AF  8d46c0               lea ax, [bp - 0x40]
5:74B2  16                   push ss
5:74B3  50                   push ax
5:74B4  66ff76d2             push dword ptr [bp - 0x2e]
5:74B8  9ae48cb272           lcall 0x72b2, 0x8ce4  ; sub_s2:8CE4
5:74BD  c45e06               les bx, ptr [bp + 6]
5:74C0  26894714             mov word ptr es:[bx + 0x14], ax
5:74C4  26895716             mov word ptr es:[bx + 0x16], dx
loc_74C8:
5:74C8  8d46de               lea ax, [bp - 0x22]
5:74CB  16                   push ss
5:74CC  50                   push ax
5:74CD  666a00               push 0
5:74D0  c45ec6               les bx, ptr [bp - 0x3a]
5:74D3  06                   push es
5:74D4  53                   push bx
5:74D5  26c41f               les bx, ptr es:[bx]
5:74D8  26ff5f04             lcall es:[bx + 4]
5:74DC  6a01                 push 1
5:74DE  c45e06               les bx, ptr [bp + 6]
5:74E1  6626ff7718           push dword ptr es:[bx + 0x18]
5:74E6  26c45f18             les bx, ptr es:[bx + 0x18]
5:74EA  26c41f               les bx, ptr es:[bx]
5:74ED  26ff9f9400           lcall es:[bx + 0x94]
5:74F2  c45e06               les bx, ptr [bp + 6]
5:74F5  26ff7704             push word ptr es:[bx + 4]
5:74F9  689717               push 0x1797
5:74FC  9ac16e0000           lcall 0, 0x6ec1  ; USER.GetDlgItem
5:7501  8946ce               mov word ptr [bp - 0x32], ax
5:7504  0bc0                 or ax, ax
5:7506  7408                 je 0x7510
5:7508  50                   push ax
5:7509  6a01                 push 1
5:750B  9a5f700000           lcall 0, 0x705f  ; USER.ShowWindow
loc_7510:
5:7510  c45e06               les bx, ptr [bp + 6]
5:7513  26ff7704             push word ptr es:[bx + 4]
5:7517  8d46e0               lea ax, [bp - 0x20]
5:751A  16                   push ss
5:751B  50                   push ax
5:751C  9ac3650000           lcall 0, 0x65c3  ; USER.EndPaint
5:7521  c9                   leave
5:7522  ca0400               retf 4
5:7525  db 00

; ---------------- sub_s5:7526 FAR size=46 callers=0
5:7526  55                   push bp
5:7527  8bec                 mov bp, sp
5:7529  66ff7606             push dword ptr [bp + 6]
5:752D  90                   nop
5:752E  0e                   push cs
5:752F  e83efd               call 0x7270  ; sub_s5:7270
5:7532  f6460a01             test byte ptr [bp + 0xa], 1
5:7536  7409                 je 0x7541
5:7538  66ff7606             push dword ptr [bp + 6]
5:753C  9ace17a674           lcall 0x74a6, 0x17ce  ; operator_delete@s1:17CE
loc_7541:
5:7541  8b4606               mov ax, word ptr [bp + 6]
5:7544  8b5608               mov dx, word ptr [bp + 8]
5:7547  c9                   leave
5:7548  ca0600               retf 6
5:754B  db 90 26 75 52 75 08 73 80 72

; ---------------- sub_s5:7554 FAR size=112 callers=1
5:7554  55                   push bp
5:7555  8bec                 mov bp, sp
5:7557  66ff760c             push dword ptr [bp + 0xc]
5:755B  ff760a               push word ptr [bp + 0xa]
5:755E  6a05                 push 5
5:7560  66ff7606             push dword ptr [bp + 6]
5:7564  90                   nop
5:7565  0e                   push cs
5:7566  e8110a               call 0x7f7a  ; sub_s5:7F7A
5:7569  c45e06               les bx, ptr [bp + 6]
5:756C  662bc0               sub eax, eax
5:756F  66268987ee00         mov dword ptr es:[bx + 0xee], eax
5:7575  66268987f200         mov dword ptr es:[bx + 0xf2], eax
5:757B  26c7078077           mov word ptr es:[bx], 0x7780
5:7580  26c747029275         mov word ptr es:[bx + 2], 0x7592  ; SEGMENT s5:0000
5:7586  26c787e2001c78       mov word ptr es:[bx + 0xe2], 0x781c
5:758D  26c787e4004e75       mov word ptr es:[bx + 0xe4], 0x754e  ; SEGMENT s5:0000
5:7594  6a25                 push 0x25
5:7596  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:759B  9aba209472           lcall 0x7294, 0x20ba  ; sub_s3:20BA
5:75A0  c45e06               les bx, ptr [bp + 6]
5:75A3  268987f200           mov word ptr es:[bx + 0xf2], ax
5:75A8  268997f400           mov word ptr es:[bx + 0xf4], dx
5:75AD  268b87f200           mov ax, word ptr es:[bx + 0xf2]
5:75B2  268987e600           mov word ptr es:[bx + 0xe6], ax
5:75B7  268997e800           mov word ptr es:[bx + 0xe8], dx
5:75BC  8bc3                 mov ax, bx
5:75BE  8cc2                 mov dx, es
5:75C0  c9                   leave
5:75C1  ca0a00               retf 0xa

; ---------------- sub_s5:75C4 FAR size=44 callers=1
5:75C4  55                   push bp
5:75C5  8bec                 mov bp, sp
5:75C7  c45e06               les bx, ptr [bp + 6]
5:75CA  26c7078077           mov word ptr es:[bx], 0x7780
5:75CF  26c74702e175         mov word ptr es:[bx + 2], 0x75e1  ; SEGMENT s5:0000
5:75D5  26c787e2001c78       mov word ptr es:[bx + 0xe2], 0x781c
5:75DC  26c787e4008475       mov word ptr es:[bx + 0xe4], 0x7584  ; SEGMENT s5:0000
5:75E3  66ff7606             push dword ptr [bp + 6]
5:75E7  90                   nop
5:75E8  0e                   push cs
5:75E9  e8a20a               call 0x808e  ; sub_s5:808E
5:75EC  c9                   leave
5:75ED  ca0400               retf 4

; ---------------- sub_s5:75F0 size=186 callers=0
5:75F0  c80c0000             enter 0xc, 0
5:75F4  c45e06               les bx, ptr [bp + 6]
5:75F7  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
5:75FE  7412                 je 0x7612
5:7600  6626ffb7ee00         push dword ptr es:[bx + 0xee]
5:7606  26c49fee00           les bx, ptr es:[bx + 0xee]
5:760B  26c41f               les bx, ptr es:[bx]
5:760E  26ff5f08             lcall es:[bx + 8]
loc_7612:
5:7612  c45e06               les bx, ptr [bp + 6]
5:7615  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
5:761B  0f858700             jne 0x76a6
5:761F  689100               push 0x91
5:7622  b80100               mov ax, 1
5:7625  268987ea00           mov word ptr es:[bx + 0xea], ax
5:762A  50                   push ax
5:762B  8d4efc               lea cx, [bp - 4]
5:762E  16                   push ss
5:762F  51                   push cx
5:7630  9a1a944276           lcall 0x7642, 0x941a  ; sub_s2:941A
5:7635  8d46fc               lea ax, [bp - 4]
5:7638  16                   push ss
5:7639  50                   push ax
5:763A  66ff36a002           push dword ptr [0x2a0]
5:763F  9a9e5c9676           lcall 0x7696, 0x5c9e  ; sub_s2:5C9E
5:7644  c45e06               les bx, ptr [bp + 6]
5:7647  268987ec00           mov word ptr es:[bx + 0xec], ax
5:764C  681201               push 0x112
5:764F  9a9c173f75           lcall 0x753f, 0x179c  ; operator_new@s1:179C
5:7654  83c402               add sp, 2
5:7657  8946f4               mov word ptr [bp - 0xc], ax
5:765A  8956f6               mov word ptr [bp - 0xa], dx
5:765D  0bd0                 or dx, ax
5:765F  7421                 je 0x7682
5:7661  c45e06               les bx, ptr [bp + 6]
5:7664  26ff87cc00           inc word ptr es:[bx + 0xcc]
5:7669  06                   push es
5:766A  53                   push bx
5:766B  26ffb7cc00           push word ptr es:[bx + 0xcc]
5:7670  66ff76f4             push dword ptr [bp - 0xc]
5:7674  90                   nop
5:7675  0e                   push cs
5:7676  e8cbbf               call 0x3644  ; sub_s5:3644
5:7679  8946f8               mov word ptr [bp - 8], ax
5:767C  8956fa               mov word ptr [bp - 6], dx
5:767F  eb08                 jmp 0x7689
5:7681  db 90
loc_7682:
5:7682  662bc0               sub eax, eax
5:7685  668946f8             mov dword ptr [bp - 8], eax
loc_7689:
5:7689  ff76fa               push word ptr [bp - 6]
5:768C  50                   push ax
5:768D  6a00                 push 0
5:768F  66ff7606             push dword ptr [bp + 6]
5:7693  9a78695d74           lcall 0x745d, 0x6978  ; sub_s2:6978
5:7698  6a05                 push 5
5:769A  c45ef8               les bx, ptr [bp - 8]
5:769D  06                   push es
5:769E  53                   push bx
5:769F  26c41f               les bx, ptr es:[bx]
5:76A2  26ff5f0c             lcall es:[bx + 0xc]
loc_76A6:
5:76A6  c9                   leave
5:76A7  ca0400               retf 4

; ---------------- sub_s5:76AA size=100 callers=0
5:76AA  c8040000             enter 4, 0
5:76AE  66ff7606             push dword ptr [bp + 6]
5:76B2  9a60973376           lcall 0x7633, 0x9760  ; sub_s2:9760
5:76B7  c45e06               les bx, ptr [bp + 6]
5:76BA  26ff7708             push word ptr es:[bx + 8]
5:76BE  6626ffb7f200         push dword ptr es:[bx + 0xf2]
5:76C4  9ab04d4574           lcall 0x7445, 0x4db0  ; sub_s4:4DB0
5:76C9  6a18                 push 0x18
5:76CB  9a9c175276           lcall 0x7652, 0x179c  ; operator_new@s1:179C
5:76D0  83c402               add sp, 2
5:76D3  8956fe               mov word ptr [bp - 2], dx
5:76D6  0bd0                 or dx, ax
5:76D8  7422                 je 0x76fc
5:76DA  c45e06               les bx, ptr [bp + 6]
5:76DD  26ff7708             push word ptr es:[bx + 8]
5:76E1  ff76fe               push word ptr [bp - 2]
5:76E4  50                   push ax
5:76E5  90                   nop
5:76E6  0e                   push cs
5:76E7  e83a01               call 0x7824  ; sub_s5:7824
5:76EA  c45e06               les bx, ptr [bp + 6]
5:76ED  268987ee00           mov word ptr es:[bx + 0xee], ax
5:76F2  268997f000           mov word ptr es:[bx + 0xf0], dx
5:76F7  c9                   leave
5:76F8  ca0400               retf 4
5:76FB  db 90
loc_76FC:
5:76FC  c45e06               les bx, ptr [bp + 6]
5:76FF  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
5:7709  c9                   leave
5:770A  ca0400               retf 4
5:770D  db 00

; ---------------- sub_s5:770E FAR size=62 callers=0
5:770E  c8080000             enter 8, 0
5:7712  c45e06               les bx, ptr [bp + 6]
5:7715  268b87ee00           mov ax, word ptr es:[bx + 0xee]
5:771A  268b97f000           mov dx, word ptr es:[bx + 0xf0]
5:771F  8bda                 mov bx, dx
5:7721  0bd8                 or bx, ax
5:7723  740e                 je 0x7733
5:7725  6a01                 push 1
5:7727  52                   push dx
5:7728  50                   push ax
5:7729  8ec2                 mov es, dx
5:772B  8bd8                 mov bx, ax
5:772D  26c41f               les bx, ptr es:[bx]
5:7730  26ff1f               lcall es:[bx]
loc_7733:
5:7733  c45e06               les bx, ptr [bp + 6]
5:7736  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
5:7740  06                   push es
5:7741  53                   push bx
5:7742  9a8e62b576           lcall 0x76b5, 0x628e  ; sub_s2:628E
5:7747  c9                   leave
5:7748  ca0400               retf 4
5:774B  db 00

; ---------------- sub_s5:774C FAR size=14 callers=0
5:774C  8bdc                 mov bx, sp
5:774E  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
5:7754  e90300               jmp 0x775a
5:7757  db 90 90 00

; ---------------- sub_s5:775A FAR size=202 callers=0
5:775A  55                   push bp
5:775B  8bec                 mov bp, sp
5:775D  66ff7606             push dword ptr [bp + 6]
5:7761  90                   nop
5:7762  0e                   push cs
5:7763  e85efe               call 0x75c4  ; sub_s5:75C4
5:7766  f6460a01             test byte ptr [bp + 0xa], 1
5:776A  7409                 je 0x7775
5:776C  66ff7606             push dword ptr [bp + 6]
5:7770  9ace17ce76           lcall 0x76ce, 0x17ce  ; operator_delete@s1:17CE
loc_7775:
5:7775  8b4606               mov ax, word ptr [bp + 6]
5:7778  8b5608               mov dx, word ptr [bp + 8]
5:777B  c9                   leave
5:777C  ca0600               retf 6
5:777F  db 90 5a 77 8a 77 ea 68 8e 77 aa 76 b6 77 c6 68 92
5:778F  db 77 40 96 96 77 64 96 9a 77 2c 37 9e 77 f2 97 a2
5:779F  db 77 3c 37 a6 77 40 37 aa 77 44 37 ae 77 48 37 b2
5:77AF  db 77 4c 37 ba 77 f0 75 be 77 98 96 c2 77 50 82 e2
5:77BF  db 77 54 37 c6 77 60 9c ca 77 58 37 ce 77 24 63 d2
5:77CF  db 77 4e 9c d6 77 62 37 da 77 4a 9c de 77 66 37 e6
5:77DF  db 77 06 81 0e 78 4a 6a ea 77 2e 6b ee 77 02 6b f2
5:77EF  db 77 7a 37 f6 77 52 9c fa 77 56 9c fe 77 16 9c 02
5:77FF  db 78 30 9c 06 78 86 9c 0a 78 c4 9c 16 78 c0 81 12
5:780F  db 78 0e 77 1a 78 28 63 45 77 28 81 d3 75 4c 77 82
5:781F  db 77 10 3a 86 77

; ---------------- sub_s5:7824 FAR size=136 callers=1
5:7824  c80c0000             enter 0xc, 0
5:7828  66ff7608             push dword ptr [bp + 8]
5:782C  ff7606               push word ptr [bp + 6]
5:782F  90                   nop
5:7830  0e                   push cs
5:7831  e8e819               call 0x921c  ; sub_s5:921C
5:7834  c45e06               les bx, ptr [bp + 6]
5:7837  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
5:7840  26c7070279           mov word ptr es:[bx], 0x7902
5:7845  26c747021e78         mov word ptr es:[bx + 2], 0x781e  ; SEGMENT s5:0000
5:784B  6a25                 push 0x25
5:784D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:7852  9aba209e75           lcall 0x759e, 0x20ba  ; sub_s3:20BA
5:7857  c45e06               les bx, ptr [bp + 6]
5:785A  26894714             mov word ptr es:[bx + 0x14], ax
5:785E  26895716             mov word ptr es:[bx + 0x16], dx
5:7862  268b4714             mov ax, word ptr es:[bx + 0x14]
5:7866  26894706             mov word ptr es:[bx + 6], ax
5:786A  26895708             mov word ptr es:[bx + 8], dx
5:786E  c45e06               les bx, ptr [bp + 6]
5:7871  26c45f14             les bx, ptr es:[bx + 0x14]
5:7875  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:787A  668946fc             mov dword ptr [bp - 4], eax
5:787E  668b4606             mov eax, dword ptr [bp + 6]
5:7882  050a00               add ax, 0xa
5:7885  6650                 push eax
5:7887  c45efc               les bx, ptr [bp - 4]
5:788A  06                   push es
5:788B  53                   push bx
5:788C  26c41f               les bx, ptr es:[bx]
5:788F  26ff5f08             lcall es:[bx + 8]
5:7893  c45e06               les bx, ptr [bp + 6]
5:7896  26894712             mov word ptr es:[bx + 0x12], ax
5:789A  06                   push es
5:789B  53                   push bx
5:789C  90                   nop
5:789D  0e                   push cs
5:789E  e8c31a               call 0x9364  ; sub_s5:9364
5:78A1  8b4606               mov ax, word ptr [bp + 6]
5:78A4  8b5608               mov dx, word ptr [bp + 8]
5:78A7  c9                   leave
5:78A8  ca0600               retf 6
5:78AB  db 00

; ---------------- sub_s5:78AC FAR size=48 callers=1
5:78AC  55                   push bp
5:78AD  8bec                 mov bp, sp
5:78AF  c45e06               les bx, ptr [bp + 6]
5:78B2  26c7070279           mov word ptr es:[bx], 0x7902
5:78B7  26c747024978         mov word ptr es:[bx + 2], 0x7849  ; SEGMENT s5:0000
5:78BD  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
5:78C3  740a                 je 0x78cf
5:78C5  6626ff7714           push dword ptr es:[bx + 0x14]
5:78CA  9ada1d5578           lcall 0x7855, 0x1dda  ; sub_s3:1DDA
loc_78CF:
5:78CF  66ff7606             push dword ptr [bp + 6]
5:78D3  90                   nop
5:78D4  0e                   push cs
5:78D5  e8ec19               call 0x92c4  ; sub_s5:92C4
5:78D8  c9                   leave
5:78D9  ca0400               retf 4

; ---------------- sub_s5:78DC FAR size=50 callers=0
5:78DC  55                   push bp
5:78DD  8bec                 mov bp, sp
5:78DF  66ff7606             push dword ptr [bp + 6]
5:78E3  90                   nop
5:78E4  0e                   push cs
5:78E5  e8c4ff               call 0x78ac  ; sub_s5:78AC
5:78E8  f6460a01             test byte ptr [bp + 0xa], 1
5:78EC  7409                 je 0x78f7
5:78EE  66ff7606             push dword ptr [bp + 6]
5:78F2  9ace177377           lcall 0x7773, 0x17ce  ; operator_delete@s1:17CE
loc_78F7:
5:78F7  8b4606               mov ax, word ptr [bp + 6]
5:78FA  8b5608               mov dx, word ptr [bp + 8]
5:78FD  c9                   leave
5:78FE  ca0600               retf 6
5:7901  db 90 dc 78 0c 79 10 3a 22 78 12 93 bb 78

; ---------------- sub_s5:790E FAR size=78 callers=4
5:790E  55                   push bp
5:790F  8bec                 mov bp, sp
5:7911  66ff7610             push dword ptr [bp + 0x10]
5:7915  ff760e               push word ptr [bp + 0xe]
5:7918  66ff7606             push dword ptr [bp + 6]
5:791C  9a627f0879           lcall 0x7908, 0x7f62  ; sub_s2:7F62
5:7921  c45e06               les bx, ptr [bp + 6]
5:7924  662bc0               sub eax, eax
5:7927  66268987e000         mov dword ptr es:[bx + 0xe0], eax
5:792D  66268987e400         mov dword ptr es:[bx + 0xe4], eax
5:7933  66268987e800         mov dword ptr es:[bx + 0xe8], eax
5:7939  268987ec00           mov word ptr es:[bx + 0xec], ax
5:793E  668b460a             mov eax, dword ptr [bp + 0xa]
5:7942  66268987ee00         mov dword ptr es:[bx + 0xee], eax
5:7948  26c707867b           mov word ptr es:[bx], 0x7b86
5:794D  26c747020479         mov word ptr es:[bx + 2], 0x7904  ; SEGMENT s5:0000
5:7953  8bc3                 mov ax, bx
5:7955  8cc2                 mov dx, es
5:7957  c9                   leave
5:7958  ca0e00               retf 0xe
5:795B  db 00

; ---------------- sub_s5:795C FAR size=82 callers=5
;   apis: USER.DestroyMenu
5:795C  c8140000             enter 0x14, 0
5:7960  c45e06               les bx, ptr [bp + 6]
5:7963  26c707867b           mov word ptr es:[bx], 0x7b86
5:7968  26c747025179         mov word ptr es:[bx + 2], 0x7951  ; SEGMENT s5:0000
5:796E  2683bfec0000         cmp word ptr es:[bx + 0xec], 0
5:7974  740a                 je 0x7980
5:7976  26ffb7ec00           push word ptr es:[bx + 0xec]
5:797B  9a21430000           lcall 0, 0x4321  ; USER.DestroyMenu
loc_7980:
5:7980  668b4606             mov eax, dword ptr [bp + 6]
5:7984  05d200               add ax, 0xd2
5:7987  6650                 push eax
5:7989  9ac4579a79           lcall 0x799a, 0x57c4  ; ListIter::~ListIter@s2:57C4
5:798E  c45e06               les bx, ptr [bp + 6]
5:7991  26c7070a38           mov word ptr es:[bx], 0x380a
5:7996  26c74702a879         mov word ptr es:[bx + 2], 0x79a8  ; SEGMENT s2:0000
5:799C  c45e06               les bx, ptr [bp + 6]
5:799F  26c7079a38           mov word ptr es:[bx], 0x389a
5:79A4  26c747021f79         mov word ptr es:[bx + 2], 0x791f  ; SEGMENT s2:0000
5:79AA  c9                   leave
5:79AB  ca0400               retf 4

; ---------------- sub_s5:79AE FAR size=6 callers=1
5:79AE  b80100               mov ax, 1
5:79B1  ca0600               retf 6

; ---------------- sub_s5:79B4 FAR size=48 callers=1
5:79B4  55                   push bp
5:79B5  8bec                 mov bp, sp
5:79B7  66ff760c             push dword ptr [bp + 0xc]
5:79BB  668b4606             mov eax, dword ptr [bp + 6]
5:79BF  050a00               add ax, 0xa
5:79C2  6650                 push eax
5:79C4  9a3e3df578           lcall 0x78f5, 0x3d3e  ; _fstrcpy@s1:3D3E
5:79C9  8be5                 mov sp, bp
5:79CB  837e0a00             cmp word ptr [bp + 0xa], 0
5:79CF  740e                 je 0x79df
5:79D1  c45e06               les bx, ptr [bp + 6]
5:79D4  6626ffb7e800         push dword ptr es:[bx + 0xe8]
5:79DA  90                   nop
5:79DB  0e                   push cs
5:79DC  e8e902               call 0x7cc8  ; sub_s5:7CC8
loc_79DF:
5:79DF  c9                   leave
5:79E0  ca0a00               retf 0xa
5:79E3  db 00

; ---------------- sub_s5:79E4 FAR size=24 callers=0
5:79E4  55                   push bp
5:79E5  8bec                 mov bp, sp
5:79E7  c45e06               les bx, ptr [bp + 6]
5:79EA  6626ffb7e800         push dword ptr es:[bx + 0xe8]
5:79F0  90                   nop
5:79F1  0e                   push cs
5:79F2  e8d302               call 0x7cc8  ; sub_s5:7CC8
5:79F5  33c0                 xor ax, ax
5:79F7  99                   cdq
5:79F8  c9                   leave
5:79F9  ca0a00               retf 0xa

; ---------------- sub_s5:79FC FAR size=84 callers=1
;   apis: USER.PostMessage
5:79FC  c8020000             enter 2, 0
5:7A00  c45e06               les bx, ptr [bp + 6]
5:7A03  6626ffb7e000         push dword ptr es:[bx + 0xe0]
5:7A09  26c49fe000           les bx, ptr es:[bx + 0xe0]
5:7A0E  26c41f               les bx, ptr es:[bx]
5:7A11  26ff5f24             lcall es:[bx + 0x24]
5:7A15  8b4e0e               mov cx, word ptr [bp + 0xe]
5:7A18  3bc1                 cmp ax, cx
5:7A1A  742d                 je 0x7a49
5:7A1C  c45e06               les bx, ptr [bp + 6]
5:7A1F  26ff7708             push word ptr es:[bx + 8]
5:7A23  666800008500         push 0x850000
5:7A29  666a00               push 0
5:7A2C  9a21730000           lcall 0, 0x7321  ; USER.PostMessage
5:7A31  ff760e               push word ptr [bp + 0xe]
5:7A34  c45e06               les bx, ptr [bp + 6]
5:7A37  6626ffb7e000         push dword ptr es:[bx + 0xe0]
5:7A3D  26c49fe000           les bx, ptr es:[bx + 0xe0]
5:7A42  26c41f               les bx, ptr es:[bx]
5:7A45  26ff5f28             lcall es:[bx + 0x28]
loc_7A49:
5:7A49  33c0                 xor ax, ax
5:7A4B  99                   cdq
5:7A4C  c9                   leave
5:7A4D  ca0a00               retf 0xa

; ---------------- sub_s5:7A50 FAR size=130 callers=3
;   apis: USER.GetSystemMetrics, USER.GetWindowRect, USER.IsIconic
5:7A50  c80c0000             enter 0xc, 0
5:7A54  33c0                 xor ax, ax
5:7A56  8946f8               mov word ptr [bp - 8], ax
5:7A59  8946fa               mov word ptr [bp - 6], ax
5:7A5C  8946fc               mov word ptr [bp - 4], ax
5:7A5F  8946fe               mov word ptr [bp - 2], ax
5:7A62  c45e06               les bx, ptr [bp + 6]
5:7A65  26ff7708             push word ptr es:[bx + 8]
5:7A69  9a9a730000           lcall 0, 0x739a  ; USER.IsIconic
5:7A6E  0bc0                 or ax, ax
5:7A70  7541                 jne 0x7ab3
5:7A72  c45e06               les bx, ptr [bp + 6]
5:7A75  26ff7708             push word ptr es:[bx + 8]
5:7A79  8d46f8               lea ax, [bp - 8]
5:7A7C  16                   push ss
5:7A7D  50                   push ax
5:7A7E  9af83a0000           lcall 0, 0x3af8  ; USER.GetWindowRect
5:7A83  8b46f8               mov ax, word ptr [bp - 8]
5:7A86  2946fc               sub word ptr [bp - 4], ax
5:7A89  8b46fa               mov ax, word ptr [bp - 6]
5:7A8C  2946fe               sub word ptr [bp - 2], ax
5:7A8F  6a05                 push 5
5:7A91  9a9e7a0000           lcall 0, 0x7a9e  ; USER.GetSystemMetrics
5:7A96  03c0                 add ax, ax
5:7A98  8946f6               mov word ptr [bp - 0xa], ax
5:7A9B  6a06                 push 6
5:7A9D  9a8b180000           lcall 0, 0x188b  ; USER.GetSystemMetrics
5:7AA2  03c0                 add ax, ax
5:7AA4  8946f4               mov word ptr [bp - 0xc], ax
5:7AA7  8b46f6               mov ax, word ptr [bp - 0xa]
5:7AAA  0146f8               add word ptr [bp - 8], ax
5:7AAD  8b46f4               mov ax, word ptr [bp - 0xc]
5:7AB0  0146fa               add word ptr [bp - 6], ax
loc_7AB3:
5:7AB3  8d46f8               lea ax, [bp - 8]
5:7AB6  16                   push ss
5:7AB7  50                   push ax
5:7AB8  c45e06               les bx, ptr [bp + 6]
5:7ABB  6626ffb7e000         push dword ptr es:[bx + 0xe0]
5:7AC1  26c49fe000           les bx, ptr es:[bx + 0xe0]
5:7AC6  26c41f               les bx, ptr es:[bx]
5:7AC9  26ff5f14             lcall es:[bx + 0x14]
5:7ACD  c9                   leave
5:7ACE  ca0400               retf 4
5:7AD1  db 00

; ---------------- sub_s5:7AD2 FAR size=142 callers=0
;   apis: USER.ClientToScreen, USER.GetSubMenu, USER.LoadMenu, USER.TrackPopupMenu
5:7AD2  c8040000             enter 4, 0
5:7AD6  c45e06               les bx, ptr [bp + 6]
5:7AD9  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
5:7AE0  743e                 je 0x7b20
5:7AE2  2683bfec0000         cmp word ptr es:[bx + 0xec], 0
5:7AE8  7536                 jne 0x7b20
5:7AEA  ff368c03             push word ptr [0x38c]
5:7AEE  6626ffb7ee00         push dword ptr es:[bx + 0xee]
5:7AF4  9aa15c0000           lcall 0, 0x5ca1  ; USER.LoadMenu
5:7AF9  c45e06               les bx, ptr [bp + 6]
5:7AFC  268987ec00           mov word ptr es:[bx + 0xec], ax
5:7B01  0bc0                 or ax, ax
5:7B03  7456                 je 0x7b5b
5:7B05  c45e06               les bx, ptr [bp + 6]
5:7B08  26ffb7ec00           push word ptr es:[bx + 0xec]
5:7B0D  6a00                 push 0
5:7B0F  9abc5c0000           lcall 0, 0x5cbc  ; USER.GetSubMenu
5:7B14  c45e06               les bx, ptr [bp + 6]
5:7B17  268987ec00           mov word ptr es:[bx + 0xec], ax
5:7B1C  0bc0                 or ax, ax
5:7B1E  743b                 je 0x7b5b
loc_7B20:
5:7B20  8b460c               mov ax, word ptr [bp + 0xc]
5:7B23  8946fc               mov word ptr [bp - 4], ax
5:7B26  8b460a               mov ax, word ptr [bp + 0xa]
5:7B29  8946fe               mov word ptr [bp - 2], ax
5:7B2C  c45e06               les bx, ptr [bp + 6]
5:7B2F  26ff7708             push word ptr es:[bx + 8]
5:7B33  8d46fc               lea ax, [bp - 4]
5:7B36  16                   push ss
5:7B37  50                   push ax
5:7B38  9a2a5d0000           lcall 0, 0x5d2a  ; USER.ClientToScreen
5:7B3D  c45e06               les bx, ptr [bp + 6]
5:7B40  26ffb7ec00           push word ptr es:[bx + 0xec]
5:7B45  6a00                 push 0
5:7B47  ff76fc               push word ptr [bp - 4]
5:7B4A  ff76fe               push word ptr [bp - 2]
5:7B4D  6a00                 push 0
5:7B4F  26ff7708             push word ptr es:[bx + 8]
5:7B53  666a00               push 0
5:7B56  9a485d0000           lcall 0, 0x5d48  ; USER.TrackPopupMenu
loc_7B5B:
5:7B5B  c9                   leave
5:7B5C  ca0a00               retf 0xa
5:7B5F  db 00

; ---------------- sub_s5:7B60 FAR size=186 callers=0
5:7B60  55                   push bp
5:7B61  8bec                 mov bp, sp
5:7B63  66ff7606             push dword ptr [bp + 6]
5:7B67  90                   nop
5:7B68  0e                   push cs
5:7B69  e8f0fd               call 0x795c  ; sub_s5:795C
5:7B6C  f6460a01             test byte ptr [bp + 0xa], 1
5:7B70  7409                 je 0x7b7b
5:7B72  66ff7606             push dword ptr [bp + 6]
5:7B76  9ace17c779           lcall 0x79c7, 0x17ce  ; operator_delete@s1:17CE
loc_7B7B:
5:7B7B  8b4606               mov ax, word ptr [bp + 6]
5:7B7E  8b5608               mov dx, word ptr [bp + 8]
5:7B81  c9                   leave
5:7B82  ca0600               retf 6
5:7B85  db 90 60 7b 9c 7b ea 68 90 7b 60 97 94 7b c6 68 98
5:7B95  db 7b 40 96 a0 7b b4 79 c4 7b 2c 37 a4 7b f2 97 a8
5:7BA5  db 7b 3c 37 ac 7b 40 37 b0 7b 44 37 b4 7b 48 37 b8
5:7BB5  db 7b 4c 37 bc 7b c8 97 c0 7b 98 96 c8 7b 50 7a d0
5:7BC5  db 7b 54 37 cc 7b 60 9c d4 7b ae 79 e8 7b 5e 37 d8
5:7BD5  db 7b 4e 9c dc 7b 62 37 e0 7b 4a 9c e4 7b 66 37 ec
5:7BE5  db 7b d2 7a 04 7c 4a 6a f0 7b 2e 6b f4 7b 02 6b f8
5:7BF5  db 7b 7a 37 fc 7b 52 9c 00 7c 56 9c 0c 7c e4 79 08
5:7C05  db 7c fc 79 18 7c 86 9c 10 7c c4 9c 14 7c e0 9c 8c
5:7C15  db 79 b4 3c 6c 79

; ---------------- sub_s5:7C1A FAR size=174 callers=4
;   apis: USER.GetSystemMetrics
5:7C1A  c81a0000             enter 0x1a, 0
5:7C1E  c45e0a               les bx, ptr [bp + 0xa]
5:7C21  268b4708             mov ax, word ptr es:[bx + 8]
5:7C25  8946f2               mov word ptr [bp - 0xe], ax
5:7C28  c45e06               les bx, ptr [bp + 6]
5:7C2B  26c7079a38           mov word ptr es:[bx], 0x389a
5:7C30  26c74702427c         mov word ptr es:[bx + 2], 0x7c42  ; SEGMENT s2:0000
5:7C36  c45e06               les bx, ptr [bp + 6]
5:7C39  26c707a83a           mov word ptr es:[bx], 0x3aa8
5:7C3E  26c74702577c         mov word ptr es:[bx + 2], 0x7c57  ; SEGMENT s2:0000
5:7C44  8b46f2               mov ax, word ptr [bp - 0xe]
5:7C47  c45e06               les bx, ptr [bp + 6]
5:7C4A  26894704             mov word ptr es:[bx + 4], ax
5:7C4E  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:7C53  26c747028c7b         mov word ptr es:[bx + 2], 0x7b8c  ; SEGMENT s2:0000
5:7C59  668b460a             mov eax, dword ptr [bp + 0xa]
5:7C5D  c45e06               les bx, ptr [bp + 6]
5:7C60  6626894706           mov dword ptr es:[bx + 6], eax
5:7C65  662bc0               sub eax, eax
5:7C68  662689470a           mov dword ptr es:[bx + 0xa], eax
5:7C6D  2689470e             mov word ptr es:[bx + 0xe], ax
5:7C71  26894710             mov word ptr es:[bx + 0x10], ax
5:7C75  26894712             mov word ptr es:[bx + 0x12], ax
5:7C79  26c707727f           mov word ptr es:[bx], 0x7f72
5:7C7E  26c74702887b         mov word ptr es:[bx + 2], 0x7b88  ; SEGMENT s5:0000
5:7C84  c45e0a               les bx, ptr [bp + 0xa]
5:7C87  66268b87e400         mov eax, dword ptr es:[bx + 0xe4]
5:7C8D  c45e06               les bx, ptr [bp + 6]
5:7C90  662689470a           mov dword ptr es:[bx + 0xa], eax
5:7C95  6a04                 push 4
5:7C97  9aa67c0000           lcall 0, 0x7ca6  ; USER.GetSystemMetrics
5:7C9C  c45e06               les bx, ptr [bp + 6]
5:7C9F  2689470e             mov word ptr es:[bx + 0xe], ax
5:7CA3  6a05                 push 5
5:7CA5  9ab47c0000           lcall 0, 0x7cb4  ; USER.GetSystemMetrics
5:7CAA  c45e06               les bx, ptr [bp + 6]
5:7CAD  26894710             mov word ptr es:[bx + 0x10], ax
5:7CB1  6a06                 push 6
5:7CB3  9a927a0000           lcall 0, 0x7a92  ; USER.GetSystemMetrics
5:7CB8  c45e06               les bx, ptr [bp + 6]
5:7CBB  26894712             mov word ptr es:[bx + 0x12], ax
5:7CBF  8bc3                 mov ax, bx
5:7CC1  8cc2                 mov dx, es
5:7CC3  c9                   leave
5:7CC4  ca0800               retf 8
5:7CC7  db 00

; ---------------- sub_s5:7CC8 FAR size=624 callers=2
;   apis: GDI.CreatePen, GDI.DeleteObject, GDI.GetStockObject, GDI.GetTextExtent, GDI.LineTo, GDI.MoveTo, GDI.SelectObject, GDI.SetBkColor, GDI.SetTextColor, GDI.TextOut, KERNEL.lstrlen, USER.FillRect, USER.GetWindowDC, USER.GetWindowRect, USER.IsIconic, USER.ReleaseDC, USER.SelectPalette
5:7CC8  c8420000             enter 0x42, 0
5:7CCC  c45e06               les bx, ptr [bp + 6]
5:7CCF  26ff7704             push word ptr es:[bx + 4]
5:7CD3  9a6a7a0000           lcall 0, 0x7a6a  ; USER.IsIconic
5:7CD8  8946fe               mov word ptr [bp - 2], ax
5:7CDB  0bc0                 or ax, ax
5:7CDD  7409                 je 0x7ce8
5:7CDF  833e100000           cmp word ptr [0x10], 0
5:7CE4  0f844c02             je 0x7f34
loc_7CE8:
5:7CE8  c45e06               les bx, ptr [bp + 6]
5:7CEB  26ff7704             push word ptr es:[bx + 4]
5:7CEF  9affff0000           lcall 0, 0xffff  ; USER.GetWindowDC
5:7CF4  8946fc               mov word ptr [bp - 4], ax
5:7CF7  c41e3042             les bx, ptr [0x4230]
5:7CFB  66268b470e           mov eax, dword ptr es:[bx + 0xe]
5:7D00  668946f8             mov dword ptr [bp - 8], eax
5:7D04  8d46fc               lea ax, [bp - 4]
5:7D07  16                   push ss
5:7D08  50                   push ax
5:7D09  66ff76f8             push dword ptr [bp - 8]
5:7D0D  9a084e347c           lcall 0x7c34, 0x4e08  ; sub_s2:4E08
5:7D12  8946f6               mov word ptr [bp - 0xa], ax
5:7D15  c45e06               les bx, ptr [bp + 6]
5:7D18  26ff7704             push word ptr es:[bx + 4]
5:7D1C  8d46ee               lea ax, [bp - 0x12]
5:7D1F  16                   push ss
5:7D20  50                   push ax
5:7D21  9a7f7a0000           lcall 0, 0x7a7f  ; USER.GetWindowRect
5:7D26  8b46f2               mov ax, word ptr [bp - 0xe]
5:7D29  2b46ee               sub ax, word ptr [bp - 0x12]
5:7D2C  48                   dec ax
5:7D2D  8946ec               mov word ptr [bp - 0x14], ax
5:7D30  8b4ef4               mov cx, word ptr [bp - 0xc]
5:7D33  2b4ef0               sub cx, word ptr [bp - 0x10]
5:7D36  49                   dec cx
5:7D37  894eea               mov word ptr [bp - 0x16], cx
5:7D3A  c45e06               les bx, ptr [bp + 6]
5:7D3D  268b5710             mov dx, word ptr es:[bx + 0x10]
5:7D41  8956e2               mov word ptr [bp - 0x1e], dx
5:7D44  268b5712             mov dx, word ptr es:[bx + 0x12]
5:7D48  8956e4               mov word ptr [bp - 0x1c], dx
5:7D4B  8946e6               mov word ptr [bp - 0x1a], ax
5:7D4E  894ec6               mov word ptr [bp - 0x3a], cx
5:7D51  837efe00             cmp word ptr [bp - 2], 0
5:7D55  7405                 je 0x7d5c
5:7D57  8bc1                 mov ax, cx
5:7D59  eb09                 jmp 0x7d64
5:7D5B  db 90
loc_7D5C:
5:7D5C  268b470e             mov ax, word ptr es:[bx + 0xe]
5:7D60  262b4712             sub ax, word ptr es:[bx + 0x12]
loc_7D64:
5:7D64  8946e8               mov word ptr [bp - 0x18], ax
5:7D67  ff76fc               push word ptr [bp - 4]
5:7D6A  8d46e2               lea ax, [bp - 0x1e]
5:7D6D  16                   push ss
5:7D6E  50                   push ax
5:7D6F  6a04                 push 4
5:7D71  9acc730000           lcall 0, 0x73cc  ; GDI.GetStockObject
5:7D76  50                   push ax
5:7D77  9a12740000           lcall 0, 0x7412  ; USER.FillRect
5:7D7C  c45e06               les bx, ptr [bp + 6]
5:7D7F  26c45f06             les bx, ptr es:[bx + 6]
5:7D83  66268b87e000         mov eax, dword ptr es:[bx + 0xe0]
5:7D89  268b97e200           mov dx, word ptr es:[bx + 0xe2]
5:7D8E  668946de             mov dword ptr [bp - 0x22], eax
5:7D92  666a00               push 0
5:7D95  52                   push dx
5:7D96  c45ede               les bx, ptr [bp - 0x22]
5:7D99  50                   push ax
5:7D9A  26c41f               les bx, ptr es:[bx]
5:7D9D  26ff5f24             lcall es:[bx + 0x24]
5:7DA1  3d0100               cmp ax, 1
5:7DA4  1bc0                 sbb ax, ax
5:7DA6  251e00               and ax, 0x1e
5:7DA9  052500               add ax, 0x25
5:7DAC  8946dc               mov word ptr [bp - 0x24], ax
5:7DAF  680001               push 0x100
5:7DB2  50                   push ax
5:7DB3  9a5e410000           lcall 0, 0x415e  ; GDI.CreatePen
5:7DB8  8946da               mov word ptr [bp - 0x26], ax
5:7DBB  ff76fc               push word ptr [bp - 4]
5:7DBE  50                   push ax
5:7DBF  9a197f0000           lcall 0, 0x7f19  ; GDI.SelectObject
5:7DC4  8946d8               mov word ptr [bp - 0x28], ax
5:7DC7  ff76fc               push word ptr [bp - 4]
5:7DCA  666a00               push 0
5:7DCD  9a1e7e0000           lcall 0, 0x7e1e  ; GDI.MoveTo
5:7DD2  ff76fc               push word ptr [bp - 4]
5:7DD5  ff76ec               push word ptr [bp - 0x14]
5:7DD8  6a00                 push 0
5:7DDA  9ae77d0000           lcall 0, 0x7de7  ; GDI.LineTo
5:7DDF  ff76fc               push word ptr [bp - 4]
5:7DE2  66ff76ea             push dword ptr [bp - 0x16]
5:7DE6  9af47d0000           lcall 0, 0x7df4  ; GDI.LineTo
5:7DEB  ff76fc               push word ptr [bp - 4]
5:7DEE  6a00                 push 0
5:7DF0  ff76ea               push word ptr [bp - 0x16]
5:7DF3  9aff7d0000           lcall 0, 0x7dff  ; GDI.LineTo
5:7DF8  ff76fc               push word ptr [bp - 4]
5:7DFB  666a00               push 0
5:7DFE  9a2c7e0000           lcall 0, 0x7e2c  ; GDI.LineTo
5:7E03  837efe00             cmp word ptr [bp - 2], 0
5:7E07  7527                 jne 0x7e30
5:7E09  c45e06               les bx, ptr [bp + 6]
5:7E0C  268b470e             mov ax, word ptr es:[bx + 0xe]
5:7E10  262b4712             sub ax, word ptr es:[bx + 0x12]
5:7E14  8946c6               mov word ptr [bp - 0x3a], ax
5:7E17  ff76fc               push word ptr [bp - 4]
5:7E1A  6a00                 push 0
5:7E1C  50                   push ax
5:7E1D  9acb220000           lcall 0, 0x22cb  ; GDI.MoveTo
5:7E22  ff76fc               push word ptr [bp - 4]
5:7E25  ff76ec               push word ptr [bp - 0x14]
5:7E28  ff76c6               push word ptr [bp - 0x3a]
5:7E2B  9ae2220000           lcall 0, 0x22e2  ; GDI.LineTo
loc_7E30:
5:7E30  c45e06               les bx, ptr [bp + 6]
5:7E33  6626ff7706           push dword ptr es:[bx + 6]
5:7E38  26c45f06             les bx, ptr es:[bx + 6]
5:7E3C  26c41f               les bx, ptr es:[bx]
5:7E3F  26ff5f18             lcall es:[bx + 0x18]
5:7E43  8ec2                 mov es, dx
5:7E45  8bd8                 mov bx, ax
5:7E47  8946d4               mov word ptr [bp - 0x2c], ax
5:7E4A  8c46d6               mov word ptr [bp - 0x2a], es
5:7E4D  26803f00             cmp byte ptr es:[bx], 0
5:7E51  0f84a700             je 0x7efc
5:7E55  ff76fc               push word ptr [bp - 4]
5:7E58  666a00               push 0
5:7E5B  9ab5700000           lcall 0, 0x70b5  ; GDI.SetBkColor
5:7E60  ff76fc               push word ptr [bp - 4]
5:7E63  680001               push 0x100
5:7E66  ff76dc               push word ptr [bp - 0x24]
5:7E69  9aa7700000           lcall 0, 0x70a7  ; GDI.SetTextColor
5:7E6E  66ff76d4             push dword ptr [bp - 0x2c]
5:7E72  9affff0000           lcall 0, 0xffff  ; KERNEL.lstrlen
5:7E77  8946c6               mov word ptr [bp - 0x3a], ax
5:7E7A  ff76fc               push word ptr [bp - 4]
5:7E7D  66ff76d4             push dword ptr [bp - 0x2c]
5:7E81  50                   push ax
5:7E82  9affff0000           lcall 0, 0xffff  ; GDI.GetTextExtent
5:7E87  8946cc               mov word ptr [bp - 0x34], ax
5:7E8A  8956ce               mov word ptr [bp - 0x32], dx
5:7E8D  8946c4               mov word ptr [bp - 0x3c], ax
5:7E90  8bc2                 mov ax, dx
5:7E92  8956c2               mov word ptr [bp - 0x3e], dx
5:7E95  837efe00             cmp word ptr [bp - 2], 0
5:7E99  741b                 je 0x7eb6
5:7E9B  99                   cdq
5:7E9C  2bc2                 sub ax, dx
5:7E9E  d1f8                 sar ax, 1
5:7EA0  8bc8                 mov cx, ax
5:7EA2  8b46ea               mov ax, word ptr [bp - 0x16]
5:7EA5  99                   cdq
5:7EA6  2bc2                 sub ax, dx
5:7EA8  d1f8                 sar ax, 1
5:7EAA  2bc1                 sub ax, cx
5:7EAC  8946c0               mov word ptr [bp - 0x40], ax
5:7EAF  c746be0200           mov word ptr [bp - 0x42], 2
5:7EB4  eb31                 jmp 0x7ee7
loc_7EB6:
5:7EB6  8b46c2               mov ax, word ptr [bp - 0x3e]
5:7EB9  99                   cdq
5:7EBA  2bc2                 sub ax, dx
5:7EBC  d1f8                 sar ax, 1
5:7EBE  8bc8                 mov cx, ax
5:7EC0  8b46e8               mov ax, word ptr [bp - 0x18]
5:7EC3  2b46e4               sub ax, word ptr [bp - 0x1c]
5:7EC6  99                   cdq
5:7EC7  2bc2                 sub ax, dx
5:7EC9  d1f8                 sar ax, 1
5:7ECB  2bc1                 sub ax, cx
5:7ECD  8946c0               mov word ptr [bp - 0x40], ax
5:7ED0  8b46c4               mov ax, word ptr [bp - 0x3c]
5:7ED3  99                   cdq
5:7ED4  2bc2                 sub ax, dx
5:7ED6  d1f8                 sar ax, 1
5:7ED8  8bc8                 mov cx, ax
5:7EDA  8b46ec               mov ax, word ptr [bp - 0x14]
5:7EDD  99                   cdq
5:7EDE  2bc2                 sub ax, dx
5:7EE0  d1f8                 sar ax, 1
5:7EE2  2bc1                 sub ax, cx
5:7EE4  8946be               mov word ptr [bp - 0x42], ax
loc_7EE7:
5:7EE7  ff76fc               push word ptr [bp - 4]
5:7EEA  ff76be               push word ptr [bp - 0x42]
5:7EED  ff76c0               push word ptr [bp - 0x40]
5:7EF0  66ff76d4             push dword ptr [bp - 0x2c]
5:7EF4  ff76c6               push word ptr [bp - 0x3a]
5:7EF7  9affff0000           lcall 0, 0xffff  ; GDI.TextOut
loc_7EFC:
5:7EFC  ff76fc               push word ptr [bp - 4]
5:7EFF  ff76f6               push word ptr [bp - 0xa]
5:7F02  6a00                 push 0
5:7F04  9ad7720000           lcall 0, 0x72d7  ; USER.SelectPalette
5:7F09  8946f6               mov word ptr [bp - 0xa], ax
5:7F0C  50                   push ax
5:7F0D  9a217f0000           lcall 0, 0x7f21  ; GDI.DeleteObject
5:7F12  ff76fc               push word ptr [bp - 4]
5:7F15  ff76d8               push word ptr [bp - 0x28]
5:7F18  9a4d410000           lcall 0, 0x414d  ; GDI.SelectObject
5:7F1D  ff76da               push word ptr [bp - 0x26]
5:7F20  9ae4720000           lcall 0, 0x72e4  ; GDI.DeleteObject
5:7F25  c45e06               les bx, ptr [bp + 6]
5:7F28  26ff7704             push word ptr es:[bx + 4]
5:7F2C  ff76fc               push word ptr [bp - 4]
5:7F2F  9a770d0000           lcall 0, 0xd77  ; USER.ReleaseDC
loc_7F34:
5:7F34  c9                   leave
5:7F35  ca0400               retf 4

; ---------------- sub_s5:7F38 size=66 callers=0
5:7F38  c8100000             enter 0x10, 0
5:7F3C  c45e06               les bx, ptr [bp + 6]
5:7F3F  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:7F44  26c74702567f         mov word ptr es:[bx + 2], 0x7f56  ; SEGMENT s2:0000
5:7F4A  c45e06               les bx, ptr [bp + 6]
5:7F4D  26c7079a38           mov word ptr es:[bx], 0x389a
5:7F52  26c74702107d         mov word ptr es:[bx + 2], 0x7d10  ; SEGMENT s2:0000
5:7F58  f6460a01             test byte ptr [bp + 0xa], 1
5:7F5C  7409                 je 0x7f67
5:7F5E  66ff7606             push dword ptr [bp + 6]
5:7F62  9ace17797b           lcall 0x7b79, 0x17ce  ; operator_delete@s1:17CE
loc_7F67:
5:7F67  8b4606               mov ax, word ptr [bp + 6]
5:7F6A  8b5608               mov dx, word ptr [bp + 8]
5:7F6D  c9                   leave
5:7F6E  ca0600               retf 6
5:7F71  db 90 38 7f 82 7c 10 3a 48 7f

; ---------------- sub_s5:7F7A FAR size=276 callers=8
;   apis: GDI.GetStockObject, USER.LoadCursor
5:7F7A  c81a0000             enter 0x1a, 0
5:7F7E  66ff760e             push dword ptr [bp + 0xe]
5:7F82  66ff760a             push dword ptr [bp + 0xa]
5:7F86  66ff7606             push dword ptr [bp + 6]
5:7F8A  9ab2619e7f           lcall 0x7f9e, 0x61b2  ; sub_s2:61B2
5:7F8F  c45e06               les bx, ptr [bp + 6]
5:7F92  26c787e2009a38       mov word ptr es:[bx + 0xe2], 0x389a
5:7F99  26c787e400af7f       mov word ptr es:[bx + 0xe4], 0x7faf  ; SEGMENT s2:0000
5:7FA0  c45e06               les bx, ptr [bp + 6]
5:7FA3  26c787e200a83a       mov word ptr es:[bx + 0xe2], 0x3aa8
5:7FAA  26c787e4008280       mov word ptr es:[bx + 0xe4], 0x8082  ; SEGMENT s2:0000
5:7FB1  c45e06               les bx, ptr [bp + 6]
5:7FB4  662bc0               sub eax, eax
5:7FB7  66268987e600         mov dword ptr es:[bx + 0xe6], eax
5:7FBD  268987ea00           mov word ptr es:[bx + 0xea], ax
5:7FC2  268987ec00           mov word ptr es:[bx + 0xec], ax
5:7FC7  26c707bc82           mov word ptr es:[bx], 0x82bc
5:7FCC  26c74702de7f         mov word ptr es:[bx + 2], 0x7fde  ; SEGMENT s5:0000
5:7FD2  26c787e2005883       mov word ptr es:[bx + 0xe2], 0x8358
5:7FD9  26c787e400747f       mov word ptr es:[bx + 0xe4], 0x7f74  ; SEGMENT s5:0000
5:7FE0  1e                   push ds
5:7FE1  682244               push 0x4422  ; 'VrMode'
5:7FE4  8d475b               lea ax, [bx + 0x5b]
5:7FE7  06                   push es
5:7FE8  50                   push ax
5:7FE9  9a3e3d657f           lcall 0x7f65, 0x3d3e  ; _fstrcpy@s1:3D3E
5:7FEE  83c408               add sp, 8
5:7FF1  6a05                 push 5
5:7FF3  9a727d0000           lcall 0, 0x7d72  ; GDI.GetStockObject
5:7FF8  c45e06               les bx, ptr [bp + 6]
5:7FFB  268987c600           mov word ptr es:[bx + 0xc6], ax
5:8000  666a00               push 0
5:8003  68007f               push 0x7f00
5:8006  9a2a680000           lcall 0, 0x682a  ; USER.LoadCursor
5:800B  c45e06               les bx, ptr [bp + 6]
5:800E  268987c400           mov word ptr es:[bx + 0xc4], ax
5:8013  26c787c8002820       mov word ptr es:[bx + 0xc8], 0x2028
5:801A  6626c787ac0000000047 mov dword ptr es:[bx + 0xac], 0x47000000
5:8024  c45e0e               les bx, ptr [bp + 0xe]
5:8027  268b4708             mov ax, word ptr es:[bx + 8]
5:802B  c45e06               les bx, ptr [bp + 6]
5:802E  268987bc00           mov word ptr es:[bx + 0xbc], ax
5:8033  6a48                 push 0x48
5:8035  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:803A  9aba20cd78           lcall 0x78cd, 0x20ba  ; sub_s3:20BA
5:803F  8946fc               mov word ptr [bp - 4], ax
5:8042  8956fe               mov word ptr [bp - 2], dx
5:8045  33c0                 xor ax, ax
5:8047  c45e06               les bx, ptr [bp + 6]
5:804A  268987b400           mov word ptr es:[bx + 0xb4], ax
5:804F  268987b600           mov word ptr es:[bx + 0xb6], ax
5:8054  c45efc               les bx, ptr [bp - 4]
5:8057  268b470a             mov ax, word ptr es:[bx + 0xa]
5:805B  c45e06               les bx, ptr [bp + 6]
5:805E  268987b800           mov word ptr es:[bx + 0xb8], ax
5:8063  c45efc               les bx, ptr [bp - 4]
5:8066  268b470c             mov ax, word ptr es:[bx + 0xc]
5:806A  c45e06               les bx, ptr [bp + 6]
5:806D  268987ba00           mov word ptr es:[bx + 0xba], ax
5:8072  8b460c               mov ax, word ptr [bp + 0xc]
5:8075  c45e06               les bx, ptr [bp + 6]
5:8078  268987ca00           mov word ptr es:[bx + 0xca], ax
5:807D  06                   push es
5:807E  53                   push bx
5:807F  9ad296787f           lcall 0x7f78, 0x96d2  ; RegisterWindowClass@s2:96D2
5:8084  8b4606               mov ax, word ptr [bp + 6]
5:8087  8b5608               mov dx, word ptr [bp + 8]
5:808A  c9                   leave
5:808B  ca0c00               retf 0xc

; ---------------- sub_s5:808E FAR size=120 callers=9
5:808E  c8140000             enter 0x14, 0
5:8092  c45e06               les bx, ptr [bp + 6]
5:8095  26c707bc82           mov word ptr es:[bx], 0x82bc
5:809A  26c74702ac80         mov word ptr es:[bx + 2], 0x80ac  ; SEGMENT s5:0000
5:80A0  26c787e2005883       mov word ptr es:[bx + 0xe2], 0x8358
5:80A7  26c787e400d07f       mov word ptr es:[bx + 0xe4], 0x7fd0  ; SEGMENT s5:0000
5:80AE  66837e0600           cmp dword ptr [bp + 6], 0
5:80B3  740b                 je 0x80c0
5:80B5  8b4606               mov ax, word ptr [bp + 6]
5:80B8  8b5608               mov dx, word ptr [bp + 8]
5:80BB  05e200               add ax, 0xe2
5:80BE  eb03                 jmp 0x80c3
loc_80C0:
5:80C0  33c0                 xor ax, ax
5:80C2  99                   cdq
loc_80C3:
5:80C3  8946fc               mov word ptr [bp - 4], ax
5:80C6  8956fe               mov word ptr [bp - 2], dx
5:80C9  c45efc               les bx, ptr [bp - 4]
5:80CC  26c7079a38           mov word ptr es:[bx], 0x389a
5:80D1  26c74702e380         mov word ptr es:[bx + 2], 0x80e3  ; SEGMENT s2:0000
5:80D7  668b4606             mov eax, dword ptr [bp + 6]
5:80DB  05d200               add ax, 0xd2
5:80DE  6650                 push eax
5:80E0  9ac457f180           lcall 0x80f1, 0x57c4  ; ListIter::~ListIter@s2:57C4
5:80E5  c45e06               les bx, ptr [bp + 6]
5:80E8  26c7070a38           mov word ptr es:[bx], 0x380a
5:80ED  26c74702ff80         mov word ptr es:[bx + 2], 0x80ff  ; SEGMENT s2:0000
5:80F3  c45e06               les bx, ptr [bp + 6]
5:80F6  26c7079a38           mov word ptr es:[bx], 0x389a
5:80FB  26c747028d7f         mov word ptr es:[bx + 2], 0x7f8d  ; SEGMENT s2:0000
5:8101  c9                   leave
5:8102  ca0400               retf 4
5:8105  db 00

; ---------------- sub_s5:8106 FAR size=34 callers=0
5:8106  55                   push bp
5:8107  8bec                 mov bp, sp
5:8109  66ff760c             push dword ptr [bp + 0xc]
5:810D  ff760a               push word ptr [bp + 0xa]
5:8110  c45e06               les bx, ptr [bp + 6]
5:8113  6626ff7704           push dword ptr es:[bx + 4]
5:8118  26c45f04             les bx, ptr es:[bx + 4]
5:811C  26c41f               les bx, ptr es:[bx]
5:811F  26ff5f60             lcall es:[bx + 0x60]
5:8123  c9                   leave
5:8124  ca0a00               retf 0xa
5:8127  db 00

; ---------------- sub_s5:8128 FAR size=152 callers=0
;   apis: GDI.UnrealizeObject, USER.RealizePalette
5:8128  c8200000             enter 0x20, 0
5:812C  837e0a00             cmp word ptr [bp + 0xa], 0
5:8130  0f848800             je 0x81bc
5:8134  c45e06               les bx, ptr [bp + 6]
5:8137  26c49fe600           les bx, ptr es:[bx + 0xe6]
5:813C  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:8141  268b570c             mov dx, word ptr es:[bx + 0xc]
5:8145  668946fc             mov dword ptr [bp - 4], eax
5:8149  52                   push dx
5:814A  c45efc               les bx, ptr [bp - 4]
5:814D  50                   push ax
5:814E  26c41f               les bx, ptr es:[bx]
5:8151  26ff5f18             lcall es:[bx + 0x18]
5:8155  8946fa               mov word ptr [bp - 6], ax
5:8158  50                   push ax
5:8159  9ac3680000           lcall 0, 0x68c3  ; GDI.UnrealizeObject
5:815E  c45e06               les bx, ptr [bp + 6]
5:8161  26c49fe600           les bx, ptr es:[bx + 0xe6]
5:8166  268b4714             mov ax, word ptr es:[bx + 0x14]
5:816A  8946f8               mov word ptr [bp - 8], ax
5:816D  50                   push ax
5:816E  9ad6680000           lcall 0, 0x68d6  ; USER.RealizePalette
5:8173  668b4606             mov eax, dword ptr [bp + 6]
5:8177  05d200               add ax, 0xd2
5:817A  6650                 push eax
5:817C  8d46f0               lea ax, [bp - 0x10]
5:817F  16                   push ss
5:8180  50                   push ax
5:8181  9aa4578e81           lcall 0x818e, 0x57a4  ; sub_s2:57A4
loc_8186:
5:8186  8d46f0               lea ax, [bp - 0x10]
5:8189  16                   push ss
5:818A  50                   push ax
5:818B  9a125bd580           lcall 0x80d5, 0x5b12  ; ListIter::next@s2:5B12
5:8190  8946ec               mov word ptr [bp - 0x14], ax
5:8193  8956ee               mov word ptr [bp - 0x12], dx
5:8196  0bd0                 or dx, ax
5:8198  7422                 je 0x81bc
5:819A  c45eec               les bx, ptr [bp - 0x14]
5:819D  66268b4704           mov eax, dword ptr es:[bx + 4]
5:81A2  268b5706             mov dx, word ptr es:[bx + 6]
5:81A6  668946e0             mov dword ptr [bp - 0x20], eax
5:81AA  6a01                 push 1
5:81AC  52                   push dx
5:81AD  50                   push ax
5:81AE  8ec2                 mov es, dx
5:81B0  8bd8                 mov bx, ax
5:81B2  26c41f               les bx, ptr es:[bx]
5:81B5  26ff9f9000           lcall es:[bx + 0x90]
5:81BA  ebca                 jmp 0x8186
loc_81BC:
5:81BC  c9                   leave
5:81BD  ca0600               retf 6

; ---------------- sub_s5:81C0 size=144 callers=0
;   apis: GDI.DeleteObject, USER.GetDC, USER.InvalidateRect, USER.RealizePalette, USER.SelectPalette
5:81C0  c8140000             enter 0x14, 0
5:81C4  c41e3042             les bx, ptr [0x4230]
5:81C8  66268b470e           mov eax, dword ptr es:[bx + 0xe]
5:81CD  268b5710             mov dx, word ptr es:[bx + 0x10]
5:81D1  668946fc             mov dword ptr [bp - 4], eax
5:81D5  8bc2                 mov ax, dx
5:81D7  0b46fc               or ax, word ptr [bp - 4]
5:81DA  7506                 jne 0x81e2
5:81DC  33c0                 xor ax, ax
5:81DE  c9                   leave
5:81DF  ca0400               retf 4
loc_81E2:
5:81E2  c45e06               les bx, ptr [bp + 6]
5:81E5  26ff7708             push word ptr es:[bx + 8]
5:81E9  9aee710000           lcall 0, 0x71ee  ; USER.GetDC
5:81EE  8946fa               mov word ptr [bp - 6], ax
5:81F1  50                   push ax
5:81F2  66ff76fc             push dword ptr [bp - 4]
5:81F6  9a384e8481           lcall 0x8184, 0x4e38  ; CreateGamePalette_s2_4E38@s2:4E38
5:81FB  8946f8               mov word ptr [bp - 8], ax
5:81FE  50                   push ax
5:81FF  6a00                 push 0
5:8201  9a1d820000           lcall 0, 0x821d  ; USER.SelectPalette
5:8206  8946f6               mov word ptr [bp - 0xa], ax
5:8209  ff76fa               push word ptr [bp - 6]
5:820C  9a25820000           lcall 0, 0x8225  ; USER.RealizePalette
5:8211  8946f4               mov word ptr [bp - 0xc], ax
5:8214  ff76fa               push word ptr [bp - 6]
5:8217  ff76f6               push word ptr [bp - 0xa]
5:821A  6a01                 push 1
5:821C  9a057f0000           lcall 0, 0x7f05  ; USER.SelectPalette
5:8221  ff76fa               push word ptr [bp - 6]
5:8224  9a6f810000           lcall 0, 0x816f  ; USER.RealizePalette
5:8229  ff76f8               push word ptr [bp - 8]
5:822C  9a0e7f0000           lcall 0, 0x7f0e  ; GDI.DeleteObject
5:8231  837ef400             cmp word ptr [bp - 0xc], 0
5:8235  7e11                 jle 0x8248
5:8237  c45e06               les bx, ptr [bp + 6]
5:823A  26ff7708             push word ptr es:[bx + 8]
5:823E  666a00               push 0
5:8241  6a01                 push 1
5:8243  9a72730000           lcall 0, 0x7372  ; USER.InvalidateRect
loc_8248:
5:8248  8b46f4               mov ax, word ptr [bp - 0xc]
5:824B  c9                   leave
5:824C  ca0400               retf 4
5:824F  db 00

; ---------------- sub_s5:8250 FAR size=56 callers=0
;   apis: USER.DestroyWindow, USER.IsWindow
5:8250  c8040000             enter 4, 0
5:8254  c45e06               les bx, ptr [bp + 6]
5:8257  2683bfec0000         cmp word ptr es:[bx + 0xec], 0
5:825D  7425                 je 0x8284
5:825F  26ffb7ec00           push word ptr es:[bx + 0xec]
5:8264  9a261e0000           lcall 0, 0x1e26  ; USER.IsWindow
5:8269  0bc0                 or ax, ax
5:826B  7417                 je 0x8284
5:826D  c45e06               les bx, ptr [bp + 6]
5:8270  26ffb7ec00           push word ptr es:[bx + 0xec]
5:8275  9ace6e0000           lcall 0, 0x6ece  ; USER.DestroyWindow
5:827A  c45e06               les bx, ptr [bp + 6]
5:827D  26c787ec000000       mov word ptr es:[bx + 0xec], 0
loc_8284:
5:8284  c9                   leave
5:8285  ca0400               retf 4

; ---------------- sub_s5:8288 FAR size=14 callers=0
5:8288  8bdc                 mov bx, sp
5:828A  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
5:8290  e90300               jmp 0x8296
5:8293  db 90 90 00

; ---------------- sub_s5:8296 FAR size=202 callers=0
5:8296  55                   push bp
5:8297  8bec                 mov bp, sp
5:8299  66ff7606             push dword ptr [bp + 6]
5:829D  90                   nop
5:829E  0e                   push cs
5:829F  e8ecfd               call 0x808e  ; sub_s5:808E
5:82A2  f6460a01             test byte ptr [bp + 0xa], 1
5:82A6  7409                 je 0x82b1
5:82A8  66ff7606             push dword ptr [bp + 6]
5:82AC  9ace17ec7f           lcall 0x7fec, 0x17ce  ; operator_delete@s1:17CE
loc_82B1:
5:82B1  8b4606               mov ax, word ptr [bp + 6]
5:82B4  8b5608               mov dx, word ptr [bp + 8]
5:82B7  c9                   leave
5:82B8  ca0600               retf 6
5:82BB  db 90 96 82 fa 82 ea 68 c6 82 60 97 ca 82 c6 68 ce
5:82CB  db 82 40 96 d2 82 64 96 d6 82 2c 37 da 82 f2 97 de
5:82DB  db 82 3c 37 e2 82 40 37 e6 82 44 37 ea 82 48 37 ee
5:82EB  db 82 4c 37 f2 82 c0 62 f6 82 98 96 fe 82 50 82 1e
5:82FB  db 83 54 37 02 83 60 9c 06 83 58 37 0a 83 24 63 0e
5:830B  db 83 4e 9c 12 83 62 37 16 83 4a 9c 1a 83 66 37 22
5:831B  db 83 06 81 4a 83 4a 6a 26 83 2e 6b 2a 83 02 6b 2e
5:832B  db 83 7a 37 32 83 52 9c 36 83 56 9c 3a 83 16 9c 3e
5:833B  db 83 30 9c 42 83 86 9c 46 83 c4 9c 4e 83 c0 81 56
5:834B  db 83 8e 62 52 83 28 63 f9 81 28 81 9e 80 88 82 be
5:835B  db 82 10 3a c2 82

; ---------------- sub_s5:8360 FAR size=152 callers=1
5:8360  c80c0000             enter 0xc, 0
5:8364  57                   push di
5:8365  56                   push si
5:8366  6a01                 push 1
5:8368  66ff7606             push dword ptr [bp + 6]
5:836C  90                   nop
5:836D  0e                   push cs
5:836E  e80901               call 0x847a  ; sub_s5:847A
5:8371  8b4606               mov ax, word ptr [bp + 6]
5:8374  8b5608               mov dx, word ptr [bp + 8]
5:8377  051600               add ax, 0x16
5:837A  52                   push dx
5:837B  50                   push ax
5:837C  8bf0                 mov si, ax
5:837E  8bfa                 mov di, dx
5:8380  9a383e5e83           lcall 0x835e, 0x3e38  ; sub_s2:3E38
5:8385  c45e06               les bx, ptr [bp + 6]
5:8388  6626c7471c00000000   mov dword ptr es:[bx + 0x1c], 0
5:8391  26c7076284           mov word ptr es:[bx], 0x8462
5:8396  26c747025a83         mov word ptr es:[bx + 2], 0x835a  ; SEGMENT s5:0000
5:839C  6a29                 push 0x29
5:839E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:83A3  9aba203d80           lcall 0x803d, 0x20ba  ; sub_s3:20BA
5:83A8  c45e06               les bx, ptr [bp + 6]
5:83AB  2689471c             mov word ptr es:[bx + 0x1c], ax
5:83AF  2689571e             mov word ptr es:[bx + 0x1e], dx
5:83B3  57                   push di
5:83B4  56                   push si
5:83B5  52                   push dx
5:83B6  26ff771c             push word ptr es:[bx + 0x1c]
5:83BA  9af826c776           lcall 0x76c7, 0x26f8  ; sub_s4:26F8
5:83BF  c45e06               les bx, ptr [bp + 6]
5:83C2  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:83C6  66268b472a           mov eax, dword ptr es:[bx + 0x2a]
5:83CB  668946fc             mov dword ptr [bp - 4], eax
5:83CF  668b4606             mov eax, dword ptr [bp + 6]
5:83D3  051600               add ax, 0x16
5:83D6  6650                 push eax
5:83D8  66ff76fc             push dword ptr [bp - 4]
5:83DC  c45e06               les bx, ptr [bp + 6]
5:83DF  6626ff7708           push dword ptr es:[bx + 8]
5:83E4  06                   push es
5:83E5  53                   push bx
5:83E6  90                   nop
5:83E7  0e                   push cs
5:83E8  e82703               call 0x8712  ; sub_s5:8712
5:83EB  8b4606               mov ax, word ptr [bp + 6]
5:83EE  8b5608               mov dx, word ptr [bp + 8]
5:83F1  5e                   pop si
5:83F2  5f                   pop di
5:83F3  c9                   leave
5:83F4  ca0400               retf 4
5:83F7  db 00

; ---------------- sub_s5:83F8 FAR size=64 callers=0
5:83F8  c8140000             enter 0x14, 0
5:83FC  c45e06               les bx, ptr [bp + 6]
5:83FF  26837f0400           cmp word ptr es:[bx + 4], 0
5:8404  742d                 je 0x8433
5:8406  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:840A  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:840F  668946fc             mov dword ptr [bp - 4], eax
5:8413  c45e06               les bx, ptr [bp + 6]
5:8416  26c45f1c             les bx, ptr es:[bx + 0x1c]
5:841A  66268b472a           mov eax, dword ptr es:[bx + 0x2a]
5:841F  6650                 push eax
5:8421  668b4606             mov eax, dword ptr [bp + 6]
5:8425  051600               add ax, 0x16
5:8428  6650                 push eax
5:842A  66ff76fc             push dword ptr [bp - 4]
5:842E  9a80448383           lcall 0x8383, 0x4480  ; sub_s2:4480
loc_8433:
5:8433  c9                   leave
5:8434  ca0800               retf 8
5:8437  db 00

; ---------------- sub_s5:8438 FAR size=4 callers=0
5:8438  ca0400               retf 4
5:843B  db 00

; ---------------- sub_s5:843C FAR size=62 callers=0
5:843C  c8040000             enter 4, 0
5:8440  66ff7606             push dword ptr [bp + 6]
5:8444  90                   nop
5:8445  0e                   push cs
5:8446  e80d01               call 0x8556  ; sub_s5:8556
5:8449  f6460a01             test byte ptr [bp + 0xa], 1
5:844D  7409                 je 0x8458
5:844F  66ff7606             push dword ptr [bp + 6]
5:8453  9ace17af82           lcall 0x82af, 0x17ce  ; operator_delete@s1:17CE
loc_8458:
5:8458  8b4606               mov ax, word ptr [bp + 6]
5:845B  8b5608               mov dx, word ptr [bp + 8]
5:845E  c9                   leave
5:845F  ca0600               retf 6
5:8462  db 3c 84 68 84 38 84 6c 84 f8 83 70 84 d8 86 74 84
5:8472  db 5a 86 78 84 f6 85 9a 83

; ---------------- sub_s5:847A FAR size=220 callers=4
5:847A  c8100000             enter 0x10, 0
5:847E  57                   push di
5:847F  56                   push si
5:8480  c45e06               les bx, ptr [bp + 6]
5:8483  26c7079a38           mov word ptr es:[bx], 0x389a
5:8488  26c74702b784         mov word ptr es:[bx + 2], 0x84b7  ; SEGMENT s2:0000
5:848E  c45e06               les bx, ptr [bp + 6]
5:8491  26c747040000         mov word ptr es:[bx + 4], 0
5:8497  8b460a               mov ax, word ptr [bp + 0xa]
5:849A  26894706             mov word ptr es:[bx + 6], ax
5:849E  662bc0               sub eax, eax
5:84A1  6626894708           mov dword ptr es:[bx + 8], eax
5:84A6  662689470c           mov dword ptr es:[bx + 0xc], eax
5:84AB  8d4710               lea ax, [bx + 0x10]
5:84AE  06                   push es
5:84AF  50                   push ax
5:84B0  8bf0                 mov si, ax
5:84B2  8cc7                 mov di, es
5:84B4  9a383edd84           lcall 0x84dd, 0x3e38  ; sub_s2:3E38
5:84B9  c45e06               les bx, ptr [bp + 6]
5:84BC  26c707aa87           mov word ptr es:[bx], 0x87aa
5:84C1  26c747026484         mov word ptr es:[bx + 2], 0x8464  ; SEGMENT s5:0000
5:84C7  6a48                 push 0x48
5:84C9  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:84CE  9aba20a683           lcall 0x83a6, 0x20ba  ; sub_s3:20BA
5:84D3  050e00               add ax, 0xe
5:84D6  52                   push dx
5:84D7  50                   push ax
5:84D8  57                   push di
5:84D9  56                   push si
5:84DA  9a623f3184           lcall 0x8431, 0x3f62  ; sub_s2:3F62
5:84DF  c45e06               les bx, ptr [bp + 6]
5:84E2  268b4706             mov ax, word ptr es:[bx + 6]
5:84E6  c1e003               shl ax, 3
5:84E9  50                   push ax
5:84EA  9a9c170885           lcall 0x8508, 0x179c  ; operator_new@s1:179C
5:84EF  83c402               add sp, 2
5:84F2  c45e06               les bx, ptr [bp + 6]
5:84F5  26894708             mov word ptr es:[bx + 8], ax
5:84F9  2689570a             mov word ptr es:[bx + 0xa], dx
5:84FD  268b4706             mov ax, word ptr es:[bx + 6]
5:8501  c1e002               shl ax, 2
5:8504  50                   push ax
5:8505  9a9c172a85           lcall 0x852a, 0x179c  ; operator_new@s1:179C
5:850A  83c402               add sp, 2
5:850D  c45e06               les bx, ptr [bp + 6]
5:8510  2689470c             mov word ptr es:[bx + 0xc], ax
5:8514  2689570e             mov word ptr es:[bx + 0xe], dx
5:8518  268b4706             mov ax, word ptr es:[bx + 6]
5:851C  c1e003               shl ax, 3
5:851F  50                   push ax
5:8520  6a00                 push 0
5:8522  6626ff7708           push dword ptr es:[bx + 8]
5:8527  9a06494485           lcall 0x8544, 0x4906  ; sub_s1:4906
5:852C  83c408               add sp, 8
5:852F  c45e06               les bx, ptr [bp + 6]
5:8532  268b4706             mov ax, word ptr es:[bx + 6]
5:8536  c1e002               shl ax, 2
5:8539  50                   push ax
5:853A  6a00                 push 0
5:853C  6626ff770c           push dword ptr es:[bx + 0xc]
5:8541  9a06495684           lcall 0x8456, 0x4906  ; sub_s1:4906
5:8546  83c408               add sp, 8
5:8549  8b4606               mov ax, word ptr [bp + 6]
5:854C  8b5608               mov dx, word ptr [bp + 8]
5:854F  5e                   pop si
5:8550  5f                   pop di
5:8551  c9                   leave
5:8552  ca0600               retf 6
5:8555  db 00

; ---------------- sub_s5:8556 FAR size=160 callers=5
5:8556  c8140000             enter 0x14, 0
5:855A  56                   push si
5:855B  c45e06               les bx, ptr [bp + 6]
5:855E  26c707aa87           mov word ptr es:[bx], 0x87aa
5:8563  26c74702c584         mov word ptr es:[bx + 2], 0x84c5  ; SEGMENT s5:0000
5:8569  66268b4708           mov eax, dword ptr es:[bx + 8]
5:856E  668946fc             mov dword ptr [bp - 4], eax
5:8572  6650                 push eax
5:8574  9ace17c085           lcall 0x85c0, 0x17ce  ; operator_delete@s1:17CE
5:8579  83c404               add sp, 4
5:857C  c45e06               les bx, ptr [bp + 6]
5:857F  268b470e             mov ax, word ptr es:[bx + 0xe]
5:8583  260b470c             or ax, word ptr es:[bx + 0xc]
5:8587  745a                 je 0x85e3
5:8589  c746f60000           mov word ptr [bp - 0xa], 0
5:858E  eb38                 jmp 0x85c8
loc_8590:
5:8590  8bf0                 mov si, ax
5:8592  c1e602               shl si, 2
5:8595  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8599  6626833800           cmp dword ptr es:[bx + si], 0
5:859E  7425                 je 0x85c5
5:85A0  66268b00             mov eax, dword ptr es:[bx + si]
5:85A4  268b5002             mov dx, word ptr es:[bx + si + 2]
5:85A8  668946fc             mov dword ptr [bp - 4], eax
5:85AC  8bda                 mov bx, dx
5:85AE  0bd0                 or dx, ax
5:85B0  7413                 je 0x85c5
5:85B2  53                   push bx
5:85B3  50                   push ax
5:85B4  9a1851ef85           lcall 0x85ef, 0x5118  ; sub_s2:5118
5:85B9  66ff76fc             push dword ptr [bp - 4]
5:85BD  9ace17de85           lcall 0x85de, 0x17ce  ; operator_delete@s1:17CE
5:85C2  83c404               add sp, 4
loc_85C5:
5:85C5  ff46f6               inc word ptr [bp - 0xa]
loc_85C8:
5:85C8  8b46f6               mov ax, word ptr [bp - 0xa]
5:85CB  c45e06               les bx, ptr [bp + 6]
5:85CE  26394706             cmp word ptr es:[bx + 6], ax
5:85D2  7fbc                 jg 0x8590
5:85D4  66268b4f0c           mov ecx, dword ptr es:[bx + 0xc]
5:85D9  6651                 push ecx
5:85DB  9ace17ed84           lcall 0x84ed, 0x17ce  ; operator_delete@s1:17CE
5:85E0  83c404               add sp, 4
loc_85E3:
5:85E3  c45e06               les bx, ptr [bp + 6]
5:85E6  26c7079a38           mov word ptr es:[bx], 0x389a
5:85EB  26c747028c84         mov word ptr es:[bx + 2], 0x848c  ; SEGMENT s2:0000
5:85F1  5e                   pop si
5:85F2  c9                   leave
5:85F3  ca0400               retf 4

; ---------------- sub_s5:85F6 size=100 callers=0
5:85F6  c8120000             enter 0x12, 0
5:85FA  56                   push si
5:85FB  c746fe0000           mov word ptr [bp - 2], 0
5:8600  eb46                 jmp 0x8648
loc_8602:
5:8602  8bf0                 mov si, ax
5:8604  c1e602               shl si, 2
5:8607  26c45f0c             les bx, ptr es:[bx + 0xc]
5:860B  66268b00             mov eax, dword ptr es:[bx + si]
5:860F  268b5002             mov dx, word ptr es:[bx + si + 2]
5:8613  668946fa             mov dword ptr [bp - 6], eax
5:8617  8bda                 mov bx, dx
5:8619  0bd0                 or dx, ax
5:861B  7413                 je 0x8630
5:861D  53                   push bx
5:861E  50                   push ax
5:861F  9a1851b785           lcall 0x85b7, 0x5118  ; sub_s2:5118
5:8624  66ff76fa             push dword ptr [bp - 6]
5:8628  9ace177785           lcall 0x8577, 0x17ce  ; operator_delete@s1:17CE
5:862D  83c404               add sp, 4
loc_8630:
5:8630  c45e06               les bx, ptr [bp + 6]
5:8633  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8637  8b76fe               mov si, word ptr [bp - 2]
5:863A  c1e602               shl si, 2
5:863D  6626c70000000000     mov dword ptr es:[bx + si], 0
5:8645  ff46fe               inc word ptr [bp - 2]
loc_8648:
5:8648  8b46fe               mov ax, word ptr [bp - 2]
5:864B  c45e06               les bx, ptr [bp + 6]
5:864E  26394706             cmp word ptr es:[bx + 6], ax
5:8652  7fae                 jg 0x8602
5:8654  5e                   pop si
5:8655  c9                   leave
5:8656  ca0400               retf 4
5:8659  db 00

; ---------------- sub_s5:865A FAR size=126 callers=0
5:865A  c8120000             enter 0x12, 0
5:865E  56                   push si
5:865F  c746fe0000           mov word ptr [bp - 2], 0
5:8664  eb18                 jmp 0x867e
loc_8666:
5:8666  c45e06               les bx, ptr [bp + 6]
5:8669  26c45f0c             les bx, ptr es:[bx + 0xc]
5:866D  8b76fe               mov si, word ptr [bp - 2]
5:8670  c1e602               shl si, 2
5:8673  6626c70000000000     mov dword ptr es:[bx + si], 0
loc_867B:
5:867B  ff46fe               inc word ptr [bp - 2]
loc_867E:
5:867E  8b46fe               mov ax, word ptr [bp - 2]
5:8681  c45e06               les bx, ptr [bp + 6]
5:8684  26394706             cmp word ptr es:[bx + 6], ax
5:8688  7e48                 jle 0x86d2
5:868A  8bf0                 mov si, ax
5:868C  c1e602               shl si, 2
5:868F  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8693  6626833800           cmp dword ptr es:[bx + si], 0
5:8698  74e1                 je 0x867b
5:869A  6626ff30             push dword ptr es:[bx + si]
5:869E  9a3652c186           lcall 0x86c1, 0x5236  ; sub_s2:5236
5:86A3  c45e06               les bx, ptr [bp + 6]
5:86A6  26c45f0c             les bx, ptr es:[bx + 0xc]
5:86AA  66268b00             mov eax, dword ptr es:[bx + si]
5:86AE  268b5002             mov dx, word ptr es:[bx + si + 2]
5:86B2  668946fa             mov dword ptr [bp - 6], eax
5:86B6  8bda                 mov bx, dx
5:86B8  0bd0                 or dx, ax
5:86BA  74aa                 je 0x8666
5:86BC  53                   push bx
5:86BD  50                   push ax
5:86BE  9a18512286           lcall 0x8622, 0x5118  ; sub_s2:5118
5:86C3  66ff76fa             push dword ptr [bp - 6]
5:86C7  9ace172b86           lcall 0x862b, 0x17ce  ; operator_delete@s1:17CE
5:86CC  83c404               add sp, 4
5:86CF  eb95                 jmp 0x8666
5:86D1  db 90
loc_86D2:
5:86D2  5e                   pop si
5:86D3  c9                   leave
5:86D4  ca0400               retf 4
5:86D7  db 00

; ---------------- sub_s5:86D8 FAR size=58 callers=0
5:86D8  c8020000             enter 2, 0
5:86DC  56                   push si
5:86DD  c746fe0000           mov word ptr [bp - 2], 0
5:86E2  eb1c                 jmp 0x8700
loc_86E4:
5:86E4  8bf0                 mov si, ax
5:86E6  c1e602               shl si, 2
5:86E9  26c45f0c             les bx, ptr es:[bx + 0xc]
5:86ED  6626833800           cmp dword ptr es:[bx + si], 0
5:86F2  7409                 je 0x86fd
5:86F4  6626ff30             push dword ptr es:[bx + si]
5:86F8  9a3652a186           lcall 0x86a1, 0x5236  ; sub_s2:5236
loc_86FD:
5:86FD  ff46fe               inc word ptr [bp - 2]
loc_8700:
5:8700  8b46fe               mov ax, word ptr [bp - 2]
5:8703  c45e06               les bx, ptr [bp + 6]
5:8706  26394706             cmp word ptr es:[bx + 6], ax
5:870A  7fd8                 jg 0x86e4
5:870C  5e                   pop si
5:870D  c9                   leave
5:870E  ca0400               retf 4
5:8711  db 00

; ---------------- sub_s5:8712 FAR size=110 callers=4
5:8712  c8040000             enter 4, 0
5:8716  57                   push di
5:8717  56                   push si
5:8718  668b4606             mov eax, dword ptr [bp + 6]
5:871C  051000               add ax, 0x10
5:871F  6650                 push eax
5:8721  66ff7612             push dword ptr [bp + 0x12]
5:8725  9a323f3187           lcall 0x8731, 0x3f32  ; sub_s2:3F32
5:872A  66ff760e             push dword ptr [bp + 0xe]
5:872E  9a72475387           lcall 0x8753, 0x4772  ; sub_s2:4772
5:8733  8946fc               mov word ptr [bp - 4], ax
5:8736  8956fe               mov word ptr [bp - 2], dx
5:8739  ff760c               push word ptr [bp + 0xc]
5:873C  8b460a               mov ax, word ptr [bp + 0xa]
5:873F  50                   push ax
5:8740  8b560c               mov dx, word ptr [bp + 0xc]
5:8743  050200               add ax, 2
5:8746  52                   push dx
5:8747  50                   push ax
5:8748  66ff7612             push dword ptr [bp + 0x12]
5:874C  8bf0                 mov si, ax
5:874E  8bfa                 mov di, dx
5:8750  9a943efb86           lcall 0x86fb, 0x3e94  ; sub_s2:3E94
5:8755  c45efc               les bx, ptr [bp - 4]
5:8758  268b4704             mov ax, word ptr es:[bx + 4]
5:875C  c45e0a               les bx, ptr [bp + 0xa]
5:875F  260307               add ax, word ptr es:[bx]
5:8762  26894704             mov word ptr es:[bx + 4], ax
5:8766  c45efc               les bx, ptr [bp - 4]
5:8769  268b4708             mov ax, word ptr es:[bx + 8]
5:876D  8ec7                 mov es, di
5:876F  260304               add ax, word ptr es:[si]
5:8772  c45e0a               les bx, ptr [bp + 0xa]
5:8775  26894706             mov word ptr es:[bx + 6], ax
5:8779  5e                   pop si
5:877A  5f                   pop di
5:877B  c9                   leave
5:877C  ca1000               retf 0x10
5:877F  db 00

; ---------------- sub_s5:8780 FAR size=4 callers=0
5:8780  ca0800               retf 8
5:8783  db 00

; ---------------- sub_s5:8784 FAR size=62 callers=0
5:8784  55                   push bp
5:8785  8bec                 mov bp, sp
5:8787  66ff7606             push dword ptr [bp + 6]
5:878B  90                   nop
5:878C  0e                   push cs
5:878D  e8c6fd               call 0x8556  ; sub_s5:8556
5:8790  f6460a01             test byte ptr [bp + 0xa], 1
5:8794  7409                 je 0x879f
5:8796  66ff7606             push dword ptr [bp + 6]
5:879A  9ace17ca86           lcall 0x86ca, 0x17ce  ; operator_delete@s1:17CE
loc_879F:
5:879F  8b4606               mov ax, word ptr [bp + 6]
5:87A2  8b5608               mov dx, word ptr [bp + 8]
5:87A5  c9                   leave
5:87A6  ca0600               retf 6
5:87A9  db 90 84 87 b0 87 38 84 b4 87 80 87 b8 87 d8 86 bc
5:87B9  db 87 5a 86 c0 87 f6 85 67 85

; ---------------- sub_s5:87C2 FAR size=326 callers=1
5:87C2  c8240000             enter 0x24, 0
5:87C6  56                   push si
5:87C7  6a04                 push 4
5:87C9  66ff7606             push dword ptr [bp + 6]
5:87CD  90                   nop
5:87CE  0e                   push cs
5:87CF  e8a8fc               call 0x847a  ; sub_s5:847A
5:87D2  c746fe0400           mov word ptr [bp - 2], 4
5:87D7  668b4606             mov eax, dword ptr [bp + 6]
5:87DB  051600               add ax, 0x16
5:87DE  668946fa             mov dword ptr [bp - 6], eax
loc_87E2:
5:87E2  66ff76fa             push dword ptr [bp - 6]
5:87E6  9a383e0888           lcall 0x8808, 0x3e38  ; sub_s2:3E38
5:87EB  8346fa06             add word ptr [bp - 6], 6
5:87EF  ff4efe               dec word ptr [bp - 2]
5:87F2  75ee                 jne 0x87e2
5:87F4  c45e06               les bx, ptr [bp + 6]
5:87F7  6626c7472e00000000   mov dword ptr es:[bx + 0x2e], 0
5:8800  8d4732               lea ax, [bx + 0x32]
5:8803  06                   push es
5:8804  50                   push ax
5:8805  9a383e2887           lcall 0x8728, 0x3e38  ; sub_s2:3E38
5:880A  c45e06               les bx, ptr [bp + 6]
5:880D  6626c7473800000000   mov dword ptr es:[bx + 0x38], 0
5:8816  26c707848a           mov word ptr es:[bx], 0x8a84
5:881B  26c74702ac87         mov word ptr es:[bx + 2], 0x87ac  ; SEGMENT s5:0000
5:8821  6a29                 push 0x29
5:8823  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:8828  9aba20d184           lcall 0x84d1, 0x20ba  ; sub_s3:20BA
5:882D  c45e06               les bx, ptr [bp + 6]
5:8830  2689472e             mov word ptr es:[bx + 0x2e], ax
5:8834  26895730             mov word ptr es:[bx + 0x30], dx
5:8838  c746f80000           mov word ptr [bp - 8], 0
loc_883D:
5:883D  8b46f8               mov ax, word ptr [bp - 8]
5:8840  8bc8                 mov cx, ax
5:8842  03c0                 add ax, ax
5:8844  03c1                 add ax, cx
5:8846  03c0                 add ax, ax
5:8848  034606               add ax, word ptr [bp + 6]
5:884B  8b5608               mov dx, word ptr [bp + 8]
5:884E  051600               add ax, 0x16
5:8851  52                   push dx
5:8852  50                   push ax
5:8853  51                   push cx
5:8854  c45e06               les bx, ptr [bp + 6]
5:8857  6626ff772e           push dword ptr es:[bx + 0x2e]
5:885C  9ad826c988           lcall 0x88c9, 0x26d8  ; sub_s4:26D8
5:8861  c45e06               les bx, ptr [bp + 6]
5:8864  26c45f2e             les bx, ptr es:[bx + 0x2e]
5:8868  83c32e               add bx, 0x2e
5:886B  8b76f8               mov si, word ptr [bp - 8]
5:886E  c1e602               shl si, 2
5:8871  66268b00             mov eax, dword ptr es:[bx + si]
5:8875  668946ec             mov dword ptr [bp - 0x14], eax
5:8879  8b46f8               mov ax, word ptr [bp - 8]
5:887C  8bc8                 mov cx, ax
5:887E  03c0                 add ax, ax
5:8880  03c1                 add ax, cx
5:8882  03c0                 add ax, ax
5:8884  034606               add ax, word ptr [bp + 6]
5:8887  8b5608               mov dx, word ptr [bp + 8]
5:888A  051600               add ax, 0x16
5:888D  52                   push dx
5:888E  50                   push ax
5:888F  66ff76ec             push dword ptr [bp - 0x14]
5:8893  c45e06               les bx, ptr [bp + 6]
5:8896  268b4708             mov ax, word ptr es:[bx + 8]
5:889A  268b570a             mov dx, word ptr es:[bx + 0xa]
5:889E  c1e103               shl cx, 3
5:88A1  03c1                 add ax, cx
5:88A3  52                   push dx
5:88A4  50                   push ax
5:88A5  06                   push es
5:88A6  53                   push bx
5:88A7  90                   nop
5:88A8  0e                   push cs
5:88A9  e866fe               call 0x8712  ; sub_s5:8712
5:88AC  ff46f8               inc word ptr [bp - 8]
5:88AF  837ef804             cmp word ptr [bp - 8], 4
5:88B3  7c88                 jl 0x883d
5:88B5  668b4606             mov eax, dword ptr [bp + 6]
5:88B9  053200               add ax, 0x32
5:88BC  6650                 push eax
5:88BE  c45e06               les bx, ptr [bp + 6]
5:88C1  6626ff772e           push dword ptr es:[bx + 0x2e]
5:88C6  9a4825bd83           lcall 0x83bd, 0x2548  ; sub_s4:2548
5:88CB  c45e06               les bx, ptr [bp + 6]
5:88CE  26c45f2e             les bx, ptr es:[bx + 0x2e]
5:88D2  66268b476e           mov eax, dword ptr es:[bx + 0x6e]
5:88D7  c45e06               les bx, ptr [bp + 6]
5:88DA  6626894738           mov dword ptr es:[bx + 0x38], eax
5:88DF  668b4606             mov eax, dword ptr [bp + 6]
5:88E3  053200               add ax, 0x32
5:88E6  6650                 push eax
5:88E8  c45e06               les bx, ptr [bp + 6]
5:88EB  6626ff7738           push dword ptr es:[bx + 0x38]
5:88F0  8d46f0               lea ax, [bp - 0x10]
5:88F3  16                   push ss
5:88F4  50                   push ax
5:88F5  06                   push es
5:88F6  53                   push bx
5:88F7  90                   nop
5:88F8  0e                   push cs
5:88F9  e816fe               call 0x8712  ; sub_s5:8712
5:88FC  8b4606               mov ax, word ptr [bp + 6]
5:88FF  8b5608               mov dx, word ptr [bp + 8]
5:8902  5e                   pop si
5:8903  c9                   leave
5:8904  ca0400               retf 4
5:8907  db 00

; ---------------- sub_s5:8908 FAR size=342 callers=0
5:8908  c81a0000             enter 0x1a, 0
5:890C  56                   push si
5:890D  c746fe0000           mov word ptr [bp - 2], 0
5:8912  e98600               jmp 0x899b
5:8915  db 90
loc_8916:
5:8916  c45e06               les bx, ptr [bp + 6]
5:8919  26c45f0c             les bx, ptr es:[bx + 0xc]
5:891D  8b76fe               mov si, word ptr [bp - 2]
5:8920  c1e602               shl si, 2
5:8923  6626c70000000000     mov dword ptr es:[bx + si], 0
loc_892B:
5:892B  c45e06               les bx, ptr [bp + 6]
5:892E  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8932  8b76fe               mov si, word ptr [bp - 2]
5:8935  c1e602               shl si, 2
5:8938  6626ff30             push dword ptr es:[bx + si]
5:893C  9a34515589           lcall 0x8955, 0x5134  ; sub_s2:5134
loc_8941:
5:8941  c45e06               les bx, ptr [bp + 6]
5:8944  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8948  8b76fe               mov si, word ptr [bp - 2]
5:894B  c1e602               shl si, 2
5:894E  6626ff30             push dword ptr es:[bx + si]
5:8952  9a36527889           lcall 0x8978, 0x5236  ; sub_s2:5236
5:8957  66ff76fa             push dword ptr [bp - 6]
5:895B  8b46fe               mov ax, word ptr [bp - 2]
5:895E  8bc8                 mov cx, ax
5:8960  03c0                 add ax, ax
5:8962  03c1                 add ax, cx
5:8964  03c0                 add ax, ax
5:8966  034606               add ax, word ptr [bp + 6]
5:8969  8b5608               mov dx, word ptr [bp + 8]
5:896C  051600               add ax, 0x16
5:896F  52                   push dx
5:8970  50                   push ax
5:8971  66ff760a             push dword ptr [bp + 0xa]
5:8975  9a80449689           lcall 0x8996, 0x4480  ; sub_s2:4480
5:897A  eb1c                 jmp 0x8998
loc_897C:
5:897C  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8980  8b76fe               mov si, word ptr [bp - 2]
5:8983  c1e602               shl si, 2
5:8986  268b4002             mov ax, word ptr es:[bx + si + 2]
5:898A  260b00               or ax, word ptr es:[bx + si]
5:898D  7409                 je 0x8998
5:898F  6626ff30             push dword ptr es:[bx + si]
5:8993  9a3652c789           lcall 0x89c7, 0x5236  ; sub_s2:5236
loc_8998:
5:8998  ff46fe               inc word ptr [bp - 2]
loc_899B:
5:899B  837efe04             cmp word ptr [bp - 2], 4
5:899F  0f8d9900             jge 0x8a3c
5:89A3  c45e06               les bx, ptr [bp + 6]
5:89A6  26837f0400           cmp word ptr es:[bx + 4], 0
5:89AB  74cf                 je 0x897c
5:89AD  26c45f2e             les bx, ptr es:[bx + 0x2e]
5:89B1  83c32e               add bx, 0x2e
5:89B4  8b76fe               mov si, word ptr [bp - 2]
5:89B7  c1e602               shl si, 2
5:89BA  66268b00             mov eax, dword ptr es:[bx + si]
5:89BE  668946fa             mov dword ptr [bp - 6], eax
5:89C2  6650                 push eax
5:89C4  9a7247298a           lcall 0x8a29, 0x4772  ; sub_s2:4772
5:89C9  8946f6               mov word ptr [bp - 0xa], ax
5:89CC  8956f8               mov word ptr [bp - 8], dx
5:89CF  c45e06               les bx, ptr [bp + 6]
5:89D2  26c45f0c             les bx, ptr es:[bx + 0xc]
5:89D6  8b76fe               mov si, word ptr [bp - 2]
5:89D9  c1e602               shl si, 2
5:89DC  6626833800           cmp dword ptr es:[bx + si], 0
5:89E1  0f855cff             jne 0x8941
5:89E5  6a14                 push 0x14
5:89E7  9a9c179d87           lcall 0x879d, 0x179c  ; operator_new@s1:179C
5:89EC  83c402               add sp, 2
5:89EF  8946e6               mov word ptr [bp - 0x1a], ax
5:89F2  8956e8               mov word ptr [bp - 0x18], dx
5:89F5  0bd0                 or dx, ax
5:89F7  0f841bff             je 0x8916
5:89FB  66ff760a             push dword ptr [bp + 0xa]
5:89FF  8b46fe               mov ax, word ptr [bp - 2]
5:8A02  8bc8                 mov cx, ax
5:8A04  03c0                 add ax, ax
5:8A06  03c1                 add ax, cx
5:8A08  03c0                 add ax, ax
5:8A0A  034606               add ax, word ptr [bp + 6]
5:8A0D  8b5608               mov dx, word ptr [bp + 8]
5:8A10  051600               add ax, 0x16
5:8A13  52                   push dx
5:8A14  50                   push ax
5:8A15  c45ef6               les bx, ptr [bp - 0xa]
5:8A18  6626ff7704           push dword ptr es:[bx + 4]
5:8A1D  6626ff7708           push dword ptr es:[bx + 8]
5:8A22  66ff76e6             push dword ptr [bp - 0x1a]
5:8A26  9ac250578a           lcall 0x8a57, 0x50c2  ; sub_s2:50C2
5:8A2B  c45e06               les bx, ptr [bp + 6]
5:8A2E  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8A32  268900               mov word ptr es:[bx + si], ax
5:8A35  26895002             mov word ptr es:[bx + si + 2], dx
5:8A39  e9effe               jmp 0x892b
loc_8A3C:
5:8A3C  c45e06               les bx, ptr [bp + 6]
5:8A3F  26837f0400           cmp word ptr es:[bx + 4], 0
5:8A44  7413                 je 0x8a59
5:8A46  6626ff7738           push dword ptr es:[bx + 0x38]
5:8A4B  8d4732               lea ax, [bx + 0x32]
5:8A4E  06                   push es
5:8A4F  50                   push ax
5:8A50  66ff760a             push dword ptr [bp + 0xa]
5:8A54  9a8044e987           lcall 0x87e9, 0x4480  ; sub_s2:4480
loc_8A59:
5:8A59  5e                   pop si
5:8A5A  c9                   leave
5:8A5B  ca0800               retf 8

; ---------------- sub_s5:8A5E size=62 callers=0
5:8A5E  c8040000             enter 4, 0
5:8A62  66ff7606             push dword ptr [bp + 6]
5:8A66  90                   nop
5:8A67  0e                   push cs
5:8A68  e8ebfa               call 0x8556  ; sub_s5:8556
5:8A6B  f6460a01             test byte ptr [bp + 0xa], 1
5:8A6F  7409                 je 0x8a7a
5:8A71  66ff7606             push dword ptr [bp + 6]
5:8A75  9ace17ea89           lcall 0x89ea, 0x17ce  ; operator_delete@s1:17CE
loc_8A7A:
5:8A7A  8b4606               mov ax, word ptr [bp + 6]
5:8A7D  8b5608               mov dx, word ptr [bp + 8]
5:8A80  c9                   leave
5:8A81  ca0600               retf 6
5:8A84  db 5e 8a 8a 8a 38 84 8e 8a 08 89 92 8a d8 86 96 8a
5:8A94  db 5a 86 9a 8a f6 85 1f 88

; ---------------- sub_s5:8A9C FAR size=274 callers=1
5:8A9C  c84a0000             enter 0x4a, 0
5:8AA0  57                   push di
5:8AA1  56                   push si
5:8AA2  6a02                 push 2
5:8AA4  66ff7606             push dword ptr [bp + 6]
5:8AA8  90                   nop
5:8AA9  0e                   push cs
5:8AAA  e8cdf9               call 0x847a  ; sub_s5:847A
5:8AAD  8b4606               mov ax, word ptr [bp + 6]
5:8AB0  8b5608               mov dx, word ptr [bp + 8]
5:8AB3  051600               add ax, 0x16
5:8AB6  52                   push dx
5:8AB7  50                   push ax
5:8AB8  8bf0                 mov si, ax
5:8ABA  8bfa                 mov di, dx
5:8ABC  9a383ed58a           lcall 0x8ad5, 0x3e38  ; sub_s2:3E38
5:8AC1  8b4606               mov ax, word ptr [bp + 6]
5:8AC4  8b5608               mov dx, word ptr [bp + 8]
5:8AC7  051c00               add ax, 0x1c
5:8ACA  52                   push dx
5:8ACB  50                   push ax
5:8ACC  8946b6               mov word ptr [bp - 0x4a], ax
5:8ACF  8956b8               mov word ptr [bp - 0x48], dx
5:8AD2  9a383e608b           lcall 0x8b60, 0x3e38  ; sub_s2:3E38
5:8AD7  c45e06               les bx, ptr [bp + 6]
5:8ADA  6626c7472200000000   mov dword ptr es:[bx + 0x22], 0
5:8AE3  26c707928e           mov word ptr es:[bx], 0x8e92
5:8AE8  26c74702868a         mov word ptr es:[bx + 2], 0x8a86  ; SEGMENT s5:0000
5:8AEE  6a29                 push 0x29
5:8AF0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:8AF5  9aba20528b           lcall 0x8b52, 0x20ba  ; sub_s3:20BA
5:8AFA  c45e06               les bx, ptr [bp + 6]
5:8AFD  26894722             mov word ptr es:[bx + 0x22], ax
5:8B01  26895724             mov word ptr es:[bx + 0x24], dx
5:8B05  57                   push di
5:8B06  56                   push si
5:8B07  52                   push dx
5:8B08  26ff7722             push word ptr es:[bx + 0x22]
5:8B0C  9a78261c8b           lcall 0x8b1c, 0x2678  ; sub_s4:2678
5:8B11  c45e06               les bx, ptr [bp + 6]
5:8B14  6626ff7722           push dword ptr es:[bx + 0x22]
5:8B19  9a8e26468b           lcall 0x8b46, 0x268e  ; sub_s4:268E
5:8B1E  8946fc               mov word ptr [bp - 4], ax
5:8B21  8956fe               mov word ptr [bp - 2], dx
5:8B24  57                   push di
5:8B25  56                   push si
5:8B26  52                   push dx
5:8B27  50                   push ax
5:8B28  c45e06               les bx, ptr [bp + 6]
5:8B2B  6626ff7708           push dword ptr es:[bx + 8]
5:8B30  06                   push es
5:8B31  53                   push bx
5:8B32  90                   nop
5:8B33  0e                   push cs
5:8B34  e8dbfb               call 0x8712  ; sub_s5:8712
5:8B37  66ff76b6             push dword ptr [bp - 0x4a]
5:8B3B  c45e06               les bx, ptr [bp + 6]
5:8B3E  6626ff7722           push dword ptr es:[bx + 0x22]
5:8B43  9ac2265f88           lcall 0x885f, 0x26c2  ; sub_s4:26C2
5:8B48  6a02                 push 2
5:8B4A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:8B4F  9a0a832b88           lcall 0x882b, 0x830a  ; sub_s3:830A
5:8B54  52                   push dx
5:8B55  50                   push ax
5:8B56  6a01                 push 1
5:8B58  8d46d8               lea ax, [bp - 0x28]
5:8B5B  16                   push ss
5:8B5C  50                   push ax
5:8B5D  9afe486f8b           lcall 0x8b6f, 0x48fe  ; sub_s2:48FE
5:8B62  8d46d8               lea ax, [bp - 0x28]
5:8B65  16                   push ss
5:8B66  50                   push ax
5:8B67  8d46ba               lea ax, [bp - 0x46]
5:8B6A  16                   push ss
5:8B6B  50                   push ax
5:8B6C  9a923f968b           lcall 0x8b96, 0x3f92  ; sub_s2:3F92
5:8B71  66ff76b6             push dword ptr [bp - 0x4a]
5:8B75  8d46ba               lea ax, [bp - 0x46]
5:8B78  16                   push ss
5:8B79  50                   push ax
5:8B7A  c45e06               les bx, ptr [bp + 6]
5:8B7D  66268b4708           mov eax, dword ptr es:[bx + 8]
5:8B82  050800               add ax, 8
5:8B85  6650                 push eax
5:8B87  06                   push es
5:8B88  53                   push bx
5:8B89  90                   nop
5:8B8A  0e                   push cs
5:8B8B  e884fb               call 0x8712  ; sub_s5:8712
5:8B8E  8d46ba               lea ax, [bp - 0x46]
5:8B91  16                   push ss
5:8B92  50                   push ax
5:8B93  9abc41a08b           lcall 0x8ba0, 0x41bc  ; sub_s2:41BC
5:8B98  8d46d8               lea ax, [bp - 0x28]
5:8B9B  16                   push ss
5:8B9C  50                   push ax
5:8B9D  9a6c493f89           lcall 0x893f, 0x496c  ; sub_s2:496C
5:8BA2  8b4606               mov ax, word ptr [bp + 6]
5:8BA5  8b5608               mov dx, word ptr [bp + 8]
5:8BA8  5e                   pop si
5:8BA9  5f                   pop di
5:8BAA  c9                   leave
5:8BAB  ca0400               retf 4

; ---------------- sub_s5:8BAE FAR size=30 callers=1
5:8BAE  55                   push bp
5:8BAF  8bec                 mov bp, sp
5:8BB1  c45e06               les bx, ptr [bp + 6]
5:8BB4  26c707928e           mov word ptr es:[bx], 0x8e92
5:8BB9  26c74702ec8a         mov word ptr es:[bx + 2], 0x8aec  ; SEGMENT s5:0000
5:8BBF  66ff7606             push dword ptr [bp + 6]
5:8BC3  90                   nop
5:8BC4  0e                   push cs
5:8BC5  e88ef9               call 0x8556  ; sub_s5:8556
5:8BC8  c9                   leave
5:8BC9  ca0400               retf 4

; ---------------- sub_s5:8BCC size=452 callers=0
5:8BCC  c85a0000             enter 0x5a, 0
5:8BD0  c45e06               les bx, ptr [bp + 6]
5:8BD3  26837f0400           cmp word ptr es:[bx + 4], 0
5:8BD8  0f84b001             je 0x8d8c
5:8BDC  26c45f22             les bx, ptr es:[bx + 0x22]
5:8BE0  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:8BE5  668946fc             mov dword ptr [bp - 4], eax
5:8BE9  c45e06               les bx, ptr [bp + 6]
5:8BEC  6626ff7722           push dword ptr es:[bx + 0x22]
5:8BF1  9a8e260f8b           lcall 0x8b0f, 0x268e  ; sub_s4:268E
5:8BF6  8946f8               mov word ptr [bp - 8], ax
5:8BF9  8956fa               mov word ptr [bp - 6], dx
5:8BFC  c45e06               les bx, ptr [bp + 6]
5:8BFF  26c45f22             les bx, ptr es:[bx + 0x22]
5:8C03  268b4716             mov ax, word ptr es:[bx + 0x16]
5:8C07  8946f6               mov word ptr [bp - 0xa], ax
5:8C0A  c45e06               les bx, ptr [bp + 6]
5:8C0D  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8C11  6626833f00           cmp dword ptr es:[bx], 0
5:8C16  0f852b01             jne 0x8d45
5:8C1A  52                   push dx
5:8C1B  ff76f8               push word ptr [bp - 8]
5:8C1E  9a72475e8c           lcall 0x8c5e, 0x4772  ; sub_s2:4772
5:8C23  8946ee               mov word ptr [bp - 0x12], ax
5:8C26  8956f0               mov word ptr [bp - 0x10], dx
5:8C29  6a14                 push 0x14
5:8C2B  9a9c17cd8c           lcall 0x8ccd, 0x179c  ; operator_new@s1:179C
5:8C30  83c402               add sp, 2
5:8C33  8946a6               mov word ptr [bp - 0x5a], ax
5:8C36  8956a8               mov word ptr [bp - 0x58], dx
5:8C39  0bd0                 or dx, ax
5:8C3B  7433                 je 0x8c70
5:8C3D  66ff76fc             push dword ptr [bp - 4]
5:8C41  668b4606             mov eax, dword ptr [bp + 6]
5:8C45  051600               add ax, 0x16
5:8C48  6650                 push eax
5:8C4A  c45eee               les bx, ptr [bp - 0x12]
5:8C4D  6626ff7704           push dword ptr es:[bx + 4]
5:8C52  6626ff7708           push dword ptr es:[bx + 8]
5:8C57  66ff76a6             push dword ptr [bp - 0x5a]
5:8C5B  9ac2508d8c           lcall 0x8c8d, 0x50c2  ; sub_s2:50C2
5:8C60  c45e06               les bx, ptr [bp + 6]
5:8C63  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8C67  268907               mov word ptr es:[bx], ax
5:8C6A  26895702             mov word ptr es:[bx + 2], dx
5:8C6E  eb0f                 jmp 0x8c7f
loc_8C70:
5:8C70  c45e06               les bx, ptr [bp + 6]
5:8C73  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8C77  6626c70700000000     mov dword ptr es:[bx], 0
loc_8C7F:
5:8C7F  c45e06               les bx, ptr [bp + 6]
5:8C82  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8C86  6626ff37             push dword ptr es:[bx]
5:8C8A  9a3451a78c           lcall 0x8ca7, 0x5134  ; sub_s2:5134
5:8C8F  6a02                 push 2
5:8C91  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:8C96  9a0a83f88a           lcall 0x8af8, 0x830a  ; sub_s3:830A
5:8C9B  52                   push dx
5:8C9C  50                   push ax
5:8C9D  6a01                 push 1
5:8C9F  8d46c8               lea ax, [bp - 0x38]
5:8CA2  16                   push ss
5:8CA3  50                   push ax
5:8CA4  9afe48b68c           lcall 0x8cb6, 0x48fe  ; sub_s2:48FE
5:8CA9  8d46c8               lea ax, [bp - 0x38]
5:8CAC  16                   push ss
5:8CAD  50                   push ax
5:8CAE  8d46aa               lea ax, [bp - 0x56]
5:8CB1  16                   push ss
5:8CB2  50                   push ax
5:8CB3  9a923fc08c           lcall 0x8cc0, 0x3f92  ; sub_s2:3F92
5:8CB8  8d46aa               lea ax, [bp - 0x56]
5:8CBB  16                   push ss
5:8CBC  50                   push ax
5:8CBD  9a7247fd8c           lcall 0x8cfd, 0x4772  ; sub_s2:4772
5:8CC2  8946ee               mov word ptr [bp - 0x12], ax
5:8CC5  8956f0               mov word ptr [bp - 0x10], dx
5:8CC8  6a14                 push 0x14
5:8CCA  9a9c17788a           lcall 0x8a78, 0x179c  ; operator_new@s1:179C
5:8CCF  83c402               add sp, 2
5:8CD2  8946a6               mov word ptr [bp - 0x5a], ax
5:8CD5  8956a8               mov word ptr [bp - 0x58], dx
5:8CD8  0bd0                 or dx, ax
5:8CDA  7434                 je 0x8d10
5:8CDC  66ff76fc             push dword ptr [bp - 4]
5:8CE0  668b4606             mov eax, dword ptr [bp + 6]
5:8CE4  051600               add ax, 0x16
5:8CE7  6650                 push eax
5:8CE9  c45eee               les bx, ptr [bp - 0x12]
5:8CEC  6626ff7704           push dword ptr es:[bx + 4]
5:8CF1  6626ff7708           push dword ptr es:[bx + 8]
5:8CF6  66ff76a6             push dword ptr [bp - 0x5a]
5:8CFA  9ac2502f8d           lcall 0x8d2f, 0x50c2  ; sub_s2:50C2
5:8CFF  c45e06               les bx, ptr [bp + 6]
5:8D02  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8D06  26894704             mov word ptr es:[bx + 4], ax
5:8D0A  26895706             mov word ptr es:[bx + 6], dx
5:8D0E  eb10                 jmp 0x8d20
loc_8D10:
5:8D10  c45e06               les bx, ptr [bp + 6]
5:8D13  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8D17  6626c7470400000000   mov dword ptr es:[bx + 4], 0
loc_8D20:
5:8D20  c45e06               les bx, ptr [bp + 6]
5:8D23  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8D27  6626ff7704           push dword ptr es:[bx + 4]
5:8D2C  9a3451398d           lcall 0x8d39, 0x5134  ; sub_s2:5134
5:8D31  8d46aa               lea ax, [bp - 0x56]
5:8D34  16                   push ss
5:8D35  50                   push ax
5:8D36  9abc41438d           lcall 0x8d43, 0x41bc  ; sub_s2:41BC
5:8D3B  8d46c8               lea ax, [bp - 0x38]
5:8D3E  16                   push ss
5:8D3F  50                   push ax
5:8D40  9a6c49548d           lcall 0x8d54, 0x496c  ; sub_s2:496C
loc_8D45:
5:8D45  c45e06               les bx, ptr [bp + 6]
5:8D48  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8D4C  6626ff7704           push dword ptr es:[bx + 4]
5:8D51  9a3652648d           lcall 0x8d64, 0x5236  ; sub_s2:5236
5:8D56  c45e06               les bx, ptr [bp + 6]
5:8D59  26c45f0c             les bx, ptr es:[bx + 0xc]
5:8D5D  6626ff37             push dword ptr es:[bx]
5:8D61  9a36527a8d           lcall 0x8d7a, 0x5236  ; sub_s2:5236
5:8D66  66ff76f8             push dword ptr [bp - 8]
5:8D6A  668b4606             mov eax, dword ptr [bp + 6]
5:8D6E  051600               add ax, 0x16
5:8D71  6650                 push eax
5:8D73  66ff76fc             push dword ptr [bp - 4]
5:8D77  9a8044bf8a           lcall 0x8abf, 0x4480  ; sub_s2:4480
5:8D7C  66ff76fc             push dword ptr [bp - 4]
5:8D80  ff76f6               push word ptr [bp - 0xa]
5:8D83  66ff7606             push dword ptr [bp + 6]
5:8D87  90                   nop
5:8D88  0e                   push cs
5:8D89  e80400               call 0x8d90  ; sub_s5:8D90
loc_8D8C:
5:8D8C  c9                   leave
5:8D8D  ca0800               retf 8

; ---------------- sub_s5:8D90 FAR size=220 callers=1
;   apis: USER.InvalidateRect
5:8D90  c85e0000             enter 0x5e, 0
5:8D94  c45e06               les bx, ptr [bp + 6]
5:8D97  6626ff7722           push dword ptr es:[bx + 0x22]
5:8D9C  9a6a26b28d           lcall 0x8db2, 0x266a  ; sub_s4:266A
5:8DA1  0bc0                 or ax, ax
5:8DA3  0f84c000             je 0x8e67
5:8DA7  c45e06               les bx, ptr [bp + 6]
5:8DAA  6626ff7722           push dword ptr es:[bx + 0x22]
5:8DAF  9a5c26f48b           lcall 0x8bf4, 0x265c  ; sub_s4:265C
5:8DB4  8946fc               mov word ptr [bp - 4], ax
5:8DB7  8956fe               mov word ptr [bp - 2], dx
5:8DBA  0bd0                 or dx, ax
5:8DBC  0f84a700             je 0x8e67
5:8DC0  ff76fe               push word ptr [bp - 2]
5:8DC3  50                   push ax
5:8DC4  1e                   push ds
5:8DC5  682a44               push 0x442a  ; '%03ld'
5:8DC8  8d46f2               lea ax, [bp - 0xe]
5:8DCB  16                   push ss
5:8DCC  50                   push ax
5:8DCD  9a9c3f2e8c           lcall 0x8c2e, 0x3f9c  ; _fsprintf@s1:3F9C
5:8DD2  83c40c               add sp, 0xc
5:8DD5  8d46f2               lea ax, [bp - 0xe]
5:8DD8  16                   push ss
5:8DD9  50                   push ax
5:8DDA  6a25                 push 0x25
5:8DDC  c45e06               les bx, ptr [bp + 6]
5:8DDF  26c45f22             les bx, ptr es:[bx + 0x22]
5:8DE3  6626ff770e           push dword ptr es:[bx + 0xe]
5:8DE8  8d46ca               lea ax, [bp - 0x36]
5:8DEB  16                   push ss
5:8DEC  50                   push ax
5:8DED  9a204f078e           lcall 0x8e07, 0x4f20  ; sub_s2:4F20
5:8DF2  8d46ca               lea ax, [bp - 0x36]
5:8DF5  16                   push ss
5:8DF6  50                   push ax
5:8DF7  668b4606             mov eax, dword ptr [bp + 6]
5:8DFB  051c00               add ax, 0x1c
5:8DFE  6650                 push eax
5:8E00  66ff760c             push dword ptr [bp + 0xc]
5:8E04  9a8044118e           lcall 0x8e11, 0x4480  ; sub_s2:4480
5:8E09  8d46ca               lea ax, [bp - 0x36]
5:8E0C  16                   push ss
5:8E0D  50                   push ax
5:8E0E  9a72472f8e           lcall 0x8e2f, 0x4772  ; sub_s2:4772
5:8E13  8946c6               mov word ptr [bp - 0x3a], ax
5:8E16  8956c8               mov word ptr [bp - 0x38], dx
5:8E19  8d46c4               lea ax, [bp - 0x3c]
5:8E1C  16                   push ss
5:8E1D  50                   push ax
5:8E1E  8d4ec2               lea cx, [bp - 0x3e]
5:8E21  16                   push ss
5:8E22  51                   push cx
5:8E23  668b5606             mov edx, dword ptr [bp + 6]
5:8E27  83c21c               add dx, 0x1c
5:8E2A  6652                 push edx
5:8E2C  9a943e658e           lcall 0x8e65, 0x3e94  ; sub_s2:3E94
5:8E31  8b46c4               mov ax, word ptr [bp - 0x3c]
5:8E34  8946ba               mov word ptr [bp - 0x46], ax
5:8E37  8b4ec2               mov cx, word ptr [bp - 0x3e]
5:8E3A  894ebc               mov word ptr [bp - 0x44], cx
5:8E3D  c45ec6               les bx, ptr [bp - 0x3a]
5:8E40  26034704             add ax, word ptr es:[bx + 4]
5:8E44  8946be               mov word ptr [bp - 0x42], ax
5:8E47  26034f08             add cx, word ptr es:[bx + 8]
5:8E4B  894ec0               mov word ptr [bp - 0x40], cx
5:8E4E  ff760a               push word ptr [bp + 0xa]
5:8E51  8d46ba               lea ax, [bp - 0x46]
5:8E54  16                   push ss
5:8E55  50                   push ax
5:8E56  6a00                 push 0
5:8E58  9a44820000           lcall 0, 0x8244  ; USER.InvalidateRect
5:8E5D  8d46ca               lea ax, [bp - 0x36]
5:8E60  16                   push ss
5:8E61  50                   push ax
5:8E62  9abc41218c           lcall 0x8c21, 0x41bc  ; sub_s2:41BC
loc_8E67:
5:8E67  c9                   leave
5:8E68  ca0a00               retf 0xa
5:8E6B  db 00

; ---------------- sub_s5:8E6C FAR size=62 callers=0
5:8E6C  55                   push bp
5:8E6D  8bec                 mov bp, sp
5:8E6F  66ff7606             push dword ptr [bp + 6]
5:8E73  90                   nop
5:8E74  0e                   push cs
5:8E75  e836fd               call 0x8bae  ; sub_s5:8BAE
5:8E78  f6460a01             test byte ptr [bp + 0xa], 1
5:8E7C  7409                 je 0x8e87
5:8E7E  66ff7606             push dword ptr [bp + 6]
5:8E82  9ace17d08d           lcall 0x8dd0, 0x17ce  ; operator_delete@s1:17CE
loc_8E87:
5:8E87  8b4606               mov ax, word ptr [bp + 6]
5:8E8A  8b5608               mov dx, word ptr [bp + 8]
5:8E8D  c9                   leave
5:8E8E  ca0600               retf 6
5:8E91  db 90 6c 8e 98 8e 38 84 9c 8e cc 8b a0 8e d8 86 a4
5:8EA1  db 8e 5a 86 a8 8e f6 85 bd 8b

; ---------------- sub_s5:8EAA FAR size=202 callers=1
5:8EAA  c8080000             enter 8, 0
5:8EAE  57                   push di
5:8EAF  56                   push si
5:8EB0  6a25                 push 0x25
5:8EB2  66ff7606             push dword ptr [bp + 6]
5:8EB6  90                   nop
5:8EB7  0e                   push cs
5:8EB8  e8bff5               call 0x847a  ; sub_s5:847A
5:8EBB  c45e06               les bx, ptr [bp + 6]
5:8EBE  662bc0               sub eax, eax
5:8EC1  6626894716           mov dword ptr es:[bx + 0x16], eax
5:8EC6  66268987aa00         mov dword ptr es:[bx + 0xaa], eax
5:8ECC  8d87ae00             lea ax, [bx + 0xae]
5:8ED0  06                   push es
5:8ED1  50                   push ax
5:8ED2  8bf0                 mov si, ax
5:8ED4  8cc7                 mov di, es
5:8ED6  9a383ef08d           lcall 0x8df0, 0x3e38  ; sub_s2:3E38
5:8EDB  c45e06               les bx, ptr [bp + 6]
5:8EDE  662bc0               sub eax, eax
5:8EE1  66268987b400         mov dword ptr es:[bx + 0xb4], eax
5:8EE7  26c787b800ffff       mov word ptr es:[bx + 0xb8], 0xffff
5:8EEE  66268987ba00         mov dword ptr es:[bx + 0xba], eax
5:8EF4  26c7070492           mov word ptr es:[bx], 0x9204
5:8EF9  26c74702948e         mov word ptr es:[bx + 2], 0x8e94  ; SEGMENT s5:0000
5:8EFF  6a29                 push 0x29
5:8F01  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:8F06  9aba202d8f           lcall 0x8f2d, 0x20ba  ; sub_s3:20BA
5:8F0B  c45e06               les bx, ptr [bp + 6]
5:8F0E  26894716             mov word ptr es:[bx + 0x16], ax
5:8F12  26895718             mov word ptr es:[bx + 0x18], dx
5:8F16  57                   push di
5:8F17  56                   push si
5:8F18  52                   push dx
5:8F19  26ff7716             push word ptr es:[bx + 0x16]
5:8F1D  9a46269f8d           lcall 0x8d9f, 0x2646  ; sub_s4:2646
5:8F22  68ce01               push 0x1ce
5:8F25  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:8F2A  9a0a835a8f           lcall 0x8f5a, 0x830a  ; sub_s3:830A
5:8F2F  c45e06               les bx, ptr [bp + 6]
5:8F32  268987b400           mov word ptr es:[bx + 0xb4], ax
5:8F37  268997b600           mov word ptr es:[bx + 0xb6], dx
5:8F3C  57                   push di
5:8F3D  56                   push si
5:8F3E  52                   push dx
5:8F3F  26ffb7b400           push word ptr es:[bx + 0xb4]
5:8F44  8d46f8               lea ax, [bp - 8]
5:8F47  16                   push ss
5:8F48  50                   push ax
5:8F49  06                   push es
5:8F4A  53                   push bx
5:8F4B  90                   nop
5:8F4C  0e                   push cs
5:8F4D  e8c2f7               call 0x8712  ; sub_s5:8712
5:8F50  6a02                 push 2
5:8F52  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:8F57  9aba20998c           lcall 0x8c99, 0x20ba  ; sub_s3:20BA
5:8F5C  c45e06               les bx, ptr [bp + 6]
5:8F5F  268987ba00           mov word ptr es:[bx + 0xba], ax
5:8F64  268997bc00           mov word ptr es:[bx + 0xbc], dx
5:8F69  8bc3                 mov ax, bx
5:8F6B  8cc2                 mov dx, es
5:8F6D  5e                   pop si
5:8F6E  5f                   pop di
5:8F6F  c9                   leave
5:8F70  ca0400               retf 4
5:8F73  db 00

; ---------------- sub_s5:8F74 FAR size=64 callers=1
5:8F74  c8080000             enter 8, 0
5:8F78  56                   push si
5:8F79  c45e06               les bx, ptr [bp + 6]
5:8F7C  26c7070492           mov word ptr es:[bx], 0x9204
5:8F81  26c74702fd8e         mov word ptr es:[bx + 2], 0x8efd  ; SEGMENT s5:0000
5:8F87  268b87b400           mov ax, word ptr es:[bx + 0xb4]
5:8F8C  268b97b600           mov dx, word ptr es:[bx + 0xb6]
5:8F91  8bda                 mov bx, dx
5:8F93  0bd0                 or dx, ax
5:8F95  740e                 je 0x8fa5
5:8F97  6a01                 push 1
5:8F99  53                   push bx
5:8F9A  50                   push ax
5:8F9B  8ec3                 mov es, bx
5:8F9D  8bf0                 mov si, ax
5:8F9F  26c41c               les bx, ptr es:[si]
5:8FA2  26ff1f               lcall es:[bx]
loc_8FA5:
5:8FA5  66ff7606             push dword ptr [bp + 6]
5:8FA9  90                   nop
5:8FAA  0e                   push cs
5:8FAB  e8a8f5               call 0x8556  ; sub_s5:8556
5:8FAE  5e                   pop si
5:8FAF  c9                   leave
5:8FB0  ca0400               retf 4
5:8FB3  db 00

; ---------------- sub_s5:8FB4 FAR size=180 callers=0
;   apis: USER.InvalidateRect
5:8FB4  c81c0000             enter 0x1c, 0
5:8FB8  c45e06               les bx, ptr [bp + 6]
5:8FBB  26c49fba00           les bx, ptr es:[bx + 0xba]
5:8FC0  26837f1e00           cmp word ptr es:[bx + 0x1e], 0
5:8FC5  0f849b00             je 0x9064
5:8FC9  c45e06               les bx, ptr [bp + 6]
5:8FCC  6626ff7716           push dword ptr es:[bx + 0x16]
5:8FD1  9a6228208f           lcall 0x8f20, 0x2862  ; sub_s4:2862
5:8FD6  c45e06               les bx, ptr [bp + 6]
5:8FD9  268987aa00           mov word ptr es:[bx + 0xaa], ax
5:8FDE  268997ac00           mov word ptr es:[bx + 0xac], dx
5:8FE3  8bc2                 mov ax, dx
5:8FE5  260b87aa00           or ax, word ptr es:[bx + 0xaa]
5:8FEA  7478                 je 0x9064
5:8FEC  c45e06               les bx, ptr [bp + 6]
5:8FEF  26c45f16             les bx, ptr es:[bx + 0x16]
5:8FF3  268b4716             mov ax, word ptr es:[bx + 0x16]
5:8FF7  8946fe               mov word ptr [bp - 2], ax
5:8FFA  c45e06               les bx, ptr [bp + 6]
5:8FFD  26c49faa00           les bx, ptr es:[bx + 0xaa]
5:9002  268b470a             mov ax, word ptr es:[bx + 0xa]
5:9006  8946fc               mov word ptr [bp - 4], ax
5:9009  c746fa0000           mov word ptr [bp - 6], 0
5:900E  eb0d                 jmp 0x901d
loc_9010:
5:9010  c45ef4               les bx, ptr [bp - 0xc]
5:9013  26837f2e09           cmp word ptr es:[bx + 0x2e], 9
5:9018  7f2c                 jg 0x9046
loc_901A:
5:901A  ff46fa               inc word ptr [bp - 6]
loc_901D:
5:901D  8b46fc               mov ax, word ptr [bp - 4]
5:9020  3946fa               cmp word ptr [bp - 6], ax
5:9023  7d3f                 jge 0x9064
5:9025  660fbf46fa           movsx eax, word ptr [bp - 6]
5:902A  6650                 push eax
5:902C  c45e06               les bx, ptr [bp + 6]
5:902F  6626ffb7aa00         push dword ptr es:[bx + 0xaa]
5:9035  9ac48f4b90           lcall 0x904b, 0x8fc4  ; sub_s2:8FC4
5:903A  8946f4               mov word ptr [bp - 0xc], ax
5:903D  8956f6               mov word ptr [bp - 0xa], dx
5:9040  0bd0                 or dx, ax
5:9042  75cc                 jne 0x9010
5:9044  ebd4                 jmp 0x901a
loc_9046:
5:9046  06                   push es
5:9047  50                   push ax
5:9048  9a208bd98e           lcall 0x8ed9, 0x8b20  ; sub_s2:8B20
5:904D  8956ec               mov word ptr [bp - 0x14], dx
5:9050  0bd0                 or dx, ax
5:9052  74c6                 je 0x901a
5:9054  ff76fe               push word ptr [bp - 2]
5:9057  ff76ec               push word ptr [bp - 0x14]
5:905A  50                   push ax
5:905B  6a00                 push 0
5:905D  9a598e0000           lcall 0, 0x8e59  ; USER.InvalidateRect
5:9062  ebb6                 jmp 0x901a
loc_9064:
5:9064  c9                   leave
5:9065  ca0400               retf 4

; ---------------- sub_s5:9068 size=242 callers=0
5:9068  c8140000             enter 0x14, 0
5:906C  56                   push si
5:906D  c45e06               les bx, ptr [bp + 6]
5:9070  26c45f16             les bx, ptr es:[bx + 0x16]
5:9074  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:9079  668946fc             mov dword ptr [bp - 4], eax
5:907D  c45e06               les bx, ptr [bp + 6]
5:9080  6626ff7716           push dword ptr es:[bx + 0x16]
5:9085  9a0c28a890           lcall 0x90a8, 0x280c  ; sub_s4:280C
5:908A  c45e06               les bx, ptr [bp + 6]
5:908D  268987aa00           mov word ptr es:[bx + 0xaa], ax
5:9092  268997ac00           mov word ptr es:[bx + 0xac], dx
5:9097  8bc2                 mov ax, dx
5:9099  260b87aa00           or ax, word ptr es:[bx + 0xaa]
5:909E  7517                 jne 0x90b7
5:90A0  6626ff7716           push dword ptr es:[bx + 0x16]
5:90A5  9a6228d48f           lcall 0x8fd4, 0x2862  ; sub_s4:2862
5:90AA  c45e06               les bx, ptr [bp + 6]
5:90AD  268987aa00           mov word ptr es:[bx + 0xaa], ax
5:90B2  268997ac00           mov word ptr es:[bx + 0xac], dx
loc_90B7:
5:90B7  c45e06               les bx, ptr [bp + 6]
5:90BA  268b87ac00           mov ax, word ptr es:[bx + 0xac]
5:90BF  260b87aa00           or ax, word ptr es:[bx + 0xaa]
5:90C4  0f848c00             je 0x9154
5:90C8  06                   push es
5:90C9  53                   push bx
5:90CA  90                   nop
5:90CB  0e                   push cs
5:90CC  e88b00               call 0x915a  ; sub_s5:915A
5:90CF  c45e06               les bx, ptr [bp + 6]
5:90D2  6626ffb7b400         push dword ptr es:[bx + 0xb4]
5:90D8  8d87ae00             lea ax, [bx + 0xae]
5:90DC  06                   push es
5:90DD  50                   push ax
5:90DE  66ff76fc             push dword ptr [bp - 4]
5:90E2  9a80442891           lcall 0x9128, 0x4480  ; sub_s2:4480
5:90E7  c45e06               les bx, ptr [bp + 6]
5:90EA  06                   push es
5:90EB  53                   push bx
5:90EC  26c41f               les bx, ptr es:[bx]
5:90EF  26ff5f10             lcall es:[bx + 0x10]
5:90F3  c45e06               les bx, ptr [bp + 6]
5:90F6  26c49faa00           les bx, ptr es:[bx + 0xaa]
5:90FB  268b470a             mov ax, word ptr es:[bx + 0xa]
5:90FF  8946fa               mov word ptr [bp - 6], ax
5:9102  c746f80000           mov word ptr [bp - 8], 0
5:9107  eb04                 jmp 0x910d
5:9109  db 90
loc_910A:
5:910A  ff46f8               inc word ptr [bp - 8]
loc_910D:
5:910D  8b46fa               mov ax, word ptr [bp - 6]
5:9110  3946f8               cmp word ptr [bp - 8], ax
5:9113  7d3f                 jge 0x9154
5:9115  660fbf46f8           movsx eax, word ptr [bp - 8]
5:911A  6650                 push eax
5:911C  c45e06               les bx, ptr [bp + 6]
5:911F  6626ffb7aa00         push dword ptr es:[bx + 0xaa]
5:9125  9ac48f3c91           lcall 0x913c, 0x8fc4  ; sub_s2:8FC4
5:912A  8956f2               mov word ptr [bp - 0xe], dx
5:912D  0bd0                 or dx, ax
5:912F  74d9                 je 0x910a
5:9131  66ff76fc             push dword ptr [bp - 4]
5:9135  ff76f2               push word ptr [bp - 0xe]
5:9138  50                   push ax
5:9139  9a4e8c3890           lcall 0x9038, 0x8c4e  ; sub_s2:8C4E
5:913E  c45e06               les bx, ptr [bp + 6]
5:9141  26c45f0c             les bx, ptr es:[bx + 0xc]
5:9145  8b76f8               mov si, word ptr [bp - 8]
5:9148  c1e602               shl si, 2
5:914B  268900               mov word ptr es:[bx + si], ax
5:914E  26895002             mov word ptr es:[bx + si + 2], dx
5:9152  ebb6                 jmp 0x910a
loc_9154:
5:9154  5e                   pop si
5:9155  c9                   leave
5:9156  ca0800               retf 8
5:9159  db 00

; ---------------- sub_s5:915A FAR size=132 callers=1
5:915A  c80a0000             enter 0xa, 0
5:915E  6a2f                 push 0x2f
5:9160  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:9165  9aba20c391           lcall 0x91c3, 0x20ba  ; sub_s3:20BA
5:916A  8946fc               mov word ptr [bp - 4], ax
5:916D  8956fe               mov word ptr [bp - 2], dx
5:9170  c45efc               les bx, ptr [bp - 4]
5:9173  268b471e             mov ax, word ptr es:[bx + 0x1e]
5:9177  8946fa               mov word ptr [bp - 6], ax
5:917A  c45e06               les bx, ptr [bp + 6]
5:917D  263987b800           cmp word ptr es:[bx + 0xb8], ax
5:9182  7456                 je 0x91da
5:9184  c746f6ce01           mov word ptr [bp - 0xa], 0x1ce
5:9189  eb21                 jmp 0x91ac
5:918B  db 90
loc_918C:
5:918C  c746f6cf01           mov word ptr [bp - 0xa], 0x1cf
5:9191  eb25                 jmp 0x91b8
5:9193  db 90
loc_9194:
5:9194  c746f6d001           mov word ptr [bp - 0xa], 0x1d0
5:9199  eb1d                 jmp 0x91b8
5:919B  db 90
loc_919C:
5:919C  c746f6d101           mov word ptr [bp - 0xa], 0x1d1
5:91A1  eb15                 jmp 0x91b8
5:91A3  db 90
loc_91A4:
5:91A4  c746f6d201           mov word ptr [bp - 0xa], 0x1d2
5:91A9  eb0d                 jmp 0x91b8
5:91AB  db 90
loc_91AC:
5:91AC  48                   dec ax
5:91AD  74dd                 je 0x918c
5:91AF  48                   dec ax
5:91B0  74e2                 je 0x9194
5:91B2  48                   dec ax
5:91B3  74e7                 je 0x919c
5:91B5  48                   dec ax
5:91B6  74ec                 je 0x91a4
loc_91B8:
5:91B8  ff76f6               push word ptr [bp - 0xa]
5:91BB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:91C0  9a0a83098f           lcall 0x8f09, 0x830a  ; sub_s3:830A
5:91C5  c45e06               les bx, ptr [bp + 6]
5:91C8  268987b400           mov word ptr es:[bx + 0xb4], ax
5:91CD  268997b600           mov word ptr es:[bx + 0xb6], dx
5:91D2  8b46fa               mov ax, word ptr [bp - 6]
5:91D5  268987b800           mov word ptr es:[bx + 0xb8], ax
loc_91DA:
5:91DA  c9                   leave
5:91DB  ca0400               retf 4

; ---------------- sub_s5:91DE FAR size=62 callers=0
5:91DE  55                   push bp
5:91DF  8bec                 mov bp, sp
5:91E1  66ff7606             push dword ptr [bp + 6]
5:91E5  90                   nop
5:91E6  0e                   push cs
5:91E7  e88afd               call 0x8f74  ; sub_s5:8F74
5:91EA  f6460a01             test byte ptr [bp + 0xa], 1
5:91EE  7409                 je 0x91f9
5:91F0  66ff7606             push dword ptr [bp + 6]
5:91F4  9ace17858e           lcall 0x8e85, 0x17ce  ; operator_delete@s1:17CE
loc_91F9:
5:91F9  8b4606               mov ax, word ptr [bp + 6]
5:91FC  8b5608               mov dx, word ptr [bp + 8]
5:91FF  c9                   leave
5:9200  ca0600               retf 6
5:9203  db 90 de 91 0a 92 b4 8f 0e 92 68 90 12 92 d8 86 16
5:9213  db 92 5a 86 1a 92 f6 85 85 8f

; ---------------- sub_s5:921C FAR size=168 callers=8
;   apis: USER.GetDC
5:921C  c81c0000             enter 0x1c, 0
5:9220  c45e06               les bx, ptr [bp + 6]
5:9223  26c7079a38           mov word ptr es:[bx], 0x389a
5:9228  26c747023a92         mov word ptr es:[bx + 2], 0x923a  ; SEGMENT s2:0000
5:922E  c45e06               les bx, ptr [bp + 6]
5:9231  26c707a83a           mov word ptr es:[bx], 0x3aa8
5:9236  26c747024f92         mov word ptr es:[bx + 2], 0x924f  ; SEGMENT s2:0000
5:923C  8b460a               mov ax, word ptr [bp + 0xa]
5:923F  c45e06               les bx, ptr [bp + 6]
5:9242  26894704             mov word ptr es:[bx + 4], ax
5:9246  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:924B  26c74702e590         mov word ptr es:[bx + 2], 0x90e5  ; SEGMENT s2:0000
5:9251  c45e06               les bx, ptr [bp + 6]
5:9254  662bc0               sub eax, eax
5:9257  6626894706           mov dword ptr es:[bx + 6], eax
5:925C  2689470a             mov word ptr es:[bx + 0xa], ax
5:9260  2689470c             mov word ptr es:[bx + 0xc], ax
5:9264  2689470e             mov word ptr es:[bx + 0xe], ax
5:9268  26894710             mov word ptr es:[bx + 0x10], ax
5:926C  26894712             mov word ptr es:[bx + 0x12], ax
5:9270  26c707c896           mov word ptr es:[bx], 0x96c8
5:9275  26c747020692         mov word ptr es:[bx + 2], 0x9206  ; SEGMENT s5:0000
5:927B  26ff7704             push word ptr es:[bx + 4]
5:927F  9aea810000           lcall 0, 0x81ea  ; USER.GetDC
5:9284  c45e06               les bx, ptr [bp + 6]
5:9287  2689470a             mov word ptr es:[bx + 0xa], ax
5:928B  6a48                 push 0x48
5:928D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:9292  9aba206891           lcall 0x9168, 0x20ba  ; sub_s3:20BA
5:9297  8946fc               mov word ptr [bp - 4], ax
5:929A  8956fe               mov word ptr [bp - 2], dx
5:929D  8bd8                 mov bx, ax
5:929F  8ec2                 mov es, dx
5:92A1  268b470a             mov ax, word ptr es:[bx + 0xa]
5:92A5  c45e06               les bx, ptr [bp + 6]
5:92A8  2689470c             mov word ptr es:[bx + 0xc], ax
5:92AC  c45efc               les bx, ptr [bp - 4]
5:92AF  268b470c             mov ax, word ptr es:[bx + 0xc]
5:92B3  c45e06               les bx, ptr [bp + 6]
5:92B6  2689470e             mov word ptr es:[bx + 0xe], ax
5:92BA  8b4606               mov ax, word ptr [bp + 6]
5:92BD  8b5608               mov dx, word ptr [bp + 8]
5:92C0  c9                   leave
5:92C1  ca0600               retf 6

; ---------------- sub_s5:92C4 FAR size=78 callers=9
;   apis: GDI.DeleteObject, USER.SelectPalette
5:92C4  c80c0000             enter 0xc, 0
5:92C8  c45e06               les bx, ptr [bp + 6]
5:92CB  26c707c896           mov word ptr es:[bx], 0x96c8
5:92D0  26c747027992         mov word ptr es:[bx + 2], 0x9279  ; SEGMENT s5:0000
5:92D6  26837f1200           cmp word ptr es:[bx + 0x12], 0
5:92DB  7415                 je 0x92f2
5:92DD  26ff770a             push word ptr es:[bx + 0xa]
5:92E1  26ff7712             push word ptr es:[bx + 0x12]
5:92E5  6a00                 push 0
5:92E7  9a02820000           lcall 0, 0x8202  ; USER.SelectPalette
5:92EC  50                   push ax
5:92ED  9a2d820000           lcall 0, 0x822d  ; GDI.DeleteObject
loc_92F2:
5:92F2  c45e06               les bx, ptr [bp + 6]
5:92F5  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
5:92FA  26c747020c93         mov word ptr es:[bx + 2], 0x930c  ; SEGMENT s2:0000
5:9300  c45e06               les bx, ptr [bp + 6]
5:9303  26c7079a38           mov word ptr es:[bx], 0x389a
5:9308  26c747022c92         mov word ptr es:[bx + 2], 0x922c  ; SEGMENT s2:0000
5:930E  c9                   leave
5:930F  ca0400               retf 4

; ---------------- sub_s5:9312 size=82 callers=0
;   apis: USER.BeginPaint, USER.EndPaint
5:9312  c82c0000             enter 0x2c, 0
5:9316  c45e06               les bx, ptr [bp + 6]
5:9319  26ff7704             push word ptr es:[bx + 4]
5:931D  8d46e0               lea ax, [bp - 0x20]
5:9320  16                   push ss
5:9321  50                   push ax
5:9322  9a8b730000           lcall 0, 0x738b  ; USER.BeginPaint
5:9327  c45e06               les bx, ptr [bp + 6]
5:932A  26c45f06             les bx, ptr es:[bx + 6]
5:932E  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:9333  668946dc             mov dword ptr [bp - 0x24], eax
5:9337  668b4606             mov eax, dword ptr [bp + 6]
5:933B  050a00               add ax, 0xa
5:933E  6650                 push eax
5:9340  666a00               push 0
5:9343  c45edc               les bx, ptr [bp - 0x24]
5:9346  06                   push es
5:9347  53                   push bx
5:9348  26c41f               les bx, ptr es:[bx]
5:934B  26ff5f04             lcall es:[bx + 4]
5:934F  c45e06               les bx, ptr [bp + 6]
5:9352  26ff7704             push word ptr es:[bx + 4]
5:9356  8d46e0               lea ax, [bp - 0x20]
5:9359  16                   push ss
5:935A  50                   push ax
5:935B  9a1d750000           lcall 0, 0x751d  ; USER.EndPaint
5:9360  c9                   leave
5:9361  ca0400               retf 4

; ---------------- sub_s5:9364 FAR size=830 callers=8
;   apis: GDI.CreatePen, GDI.CreateSolidBrush, GDI.DeleteObject, GDI.LineTo, GDI.MoveToEx, GDI.SelectObject, USER.FillRect, USER.GetClientRect
5:9364  c85e0000             enter 0x5e, 0
5:9368  57                   push di
5:9369  56                   push si
5:936A  c45e06               les bx, ptr [bp + 6]
5:936D  26ff7704             push word ptr es:[bx + 4]
5:9371  8d46f8               lea ax, [bp - 8]
5:9374  16                   push ss
5:9375  50                   push ax
5:9376  9ae0730000           lcall 0, 0x73e0  ; USER.GetClientRect
5:937B  668b46f8             mov eax, dword ptr [bp - 8]
5:937F  668946f0             mov dword ptr [bp - 0x10], eax
5:9383  668b46fc             mov eax, dword ptr [bp - 4]
5:9387  668946f4             mov dword ptr [bp - 0xc], eax
5:938B  a11642               mov ax, word ptr [0x4216]
5:938E  8946ee               mov word ptr [bp - 0x12], ax
5:9391  a12c42               mov ax, word ptr [0x422c]
5:9394  8946ec               mov word ptr [bp - 0x14], ax
5:9397  66a11242             mov eax, dword ptr [0x4212]
5:939B  668946e8             mov dword ptr [bp - 0x18], eax
5:939F  66a11842             mov eax, dword ptr [0x4218]
5:93A3  668946e4             mov dword ptr [bp - 0x1c], eax
5:93A7  66a11c42             mov eax, dword ptr [0x421c]
5:93AB  668946e0             mov dword ptr [bp - 0x20], eax
5:93AF  66a12042             mov eax, dword ptr [0x4220]
5:93B3  668946dc             mov dword ptr [bp - 0x24], eax
5:93B7  66a12442             mov eax, dword ptr [0x4224]
5:93BB  668946d8             mov dword ptr [bp - 0x28], eax
5:93BF  66a12842             mov eax, dword ptr [0x4228]
5:93C3  668946d4             mov dword ptr [bp - 0x2c], eax
5:93C7  c45e06               les bx, ptr [bp + 6]
5:93CA  26c45f06             les bx, ptr es:[bx + 6]
5:93CE  268b4712             mov ax, word ptr es:[bx + 0x12]
5:93D2  8946d2               mov word ptr [bp - 0x2e], ax
5:93D5  c746c80900           mov word ptr [bp - 0x38], 9
loc_93DA:
5:93DA  ff76d2               push word ptr [bp - 0x2e]
5:93DD  666a00               push 0
5:93E0  8b5ec8               mov bx, word ptr [bp - 0x38]
5:93E3  c1e302               shl bx, 2
5:93E6  c476e0               les si, ptr [bp - 0x20]
5:93E9  6626ff30             push dword ptr es:[bx + si]
5:93ED  9ab0950000           lcall 0, 0x95b0  ; GDI.CreatePen
5:93F2  8946d0               mov word ptr [bp - 0x30], ax
5:93F5  50                   push ax
5:93F6  9a67940000           lcall 0, 0x9467  ; GDI.SelectObject
5:93FB  8946ce               mov word ptr [bp - 0x32], ax
5:93FE  ff76d2               push word ptr [bp - 0x2e]
5:9401  ff76f8               push word ptr [bp - 8]
5:9404  8b5ec8               mov bx, word ptr [bp - 0x38]
5:9407  03db                 add bx, bx
5:9409  c476e8               les si, ptr [bp - 0x18]
5:940C  26ff30               push word ptr es:[bx + si]
5:940F  8d46ca               lea ax, [bp - 0x36]
5:9412  16                   push ss
5:9413  50                   push ax
5:9414  8bfb                 mov di, bx
5:9416  9a48940000           lcall 0, 0x9448  ; GDI.MoveToEx
5:941B  ff76d2               push word ptr [bp - 0x2e]
5:941E  ff76fc               push word ptr [bp - 4]
5:9421  c45ee8               les bx, ptr [bp - 0x18]
5:9424  26ff31               push word ptr es:[bx + di]
5:9427  9a59940000           lcall 0, 0x9459  ; GDI.LineTo
5:942C  ff76d2               push word ptr [bp - 0x2e]
5:942F  ff76f8               push word ptr [bp - 8]
5:9432  8b5eee               mov bx, word ptr [bp - 0x12]
5:9435  2b5ec8               sub bx, word ptr [bp - 0x38]
5:9438  03db                 add bx, bx
5:943A  c476e8               les si, ptr [bp - 0x18]
5:943D  26ff30               push word ptr es:[bx + si]
5:9440  8d46ca               lea ax, [bp - 0x36]
5:9443  16                   push ss
5:9444  50                   push ax
5:9445  8bfb                 mov di, bx
5:9447  9af5950000           lcall 0, 0x95f5  ; GDI.MoveToEx
5:944C  ff76d2               push word ptr [bp - 0x2e]
5:944F  ff76fc               push word ptr [bp - 4]
5:9452  c45ee8               les bx, ptr [bp - 0x18]
5:9455  26ff31               push word ptr es:[bx + di]
5:9458  9a18960000           lcall 0, 0x9618  ; GDI.LineTo
5:945D  8946c0               mov word ptr [bp - 0x40], ax
5:9460  ff76d2               push word ptr [bp - 0x2e]
5:9463  ff76ce               push word ptr [bp - 0x32]
5:9466  9ab9950000           lcall 0, 0x95b9  ; GDI.SelectObject
5:946B  ff76d0               push word ptr [bp - 0x30]
5:946E  9ab5940000           lcall 0, 0x94b5  ; GDI.DeleteObject
5:9473  ff4ec8               dec word ptr [bp - 0x38]
5:9476  837ec8ff             cmp word ptr [bp - 0x38], -1
5:947A  0f8f5cff             jg 0x93da
5:947E  666800000002         push 0x2000000
5:9484  9ad5940000           lcall 0, 0x94d5  ; GDI.CreateSolidBrush
5:9489  8946c6               mov word ptr [bp - 0x3a], ax
5:948C  c45ee8               les bx, ptr [bp - 0x18]
5:948F  268b4712             mov ax, word ptr es:[bx + 0x12]
5:9493  40                   inc ax
5:9494  8946fa               mov word ptr [bp - 6], ax
5:9497  268b4714             mov ax, word ptr es:[bx + 0x14]
5:949B  8946f6               mov word ptr [bp - 0xa], ax
5:949E  8946fe               mov word ptr [bp - 2], ax
5:94A1  ff76d2               push word ptr [bp - 0x2e]
5:94A4  8d46f8               lea ax, [bp - 8]
5:94A7  16                   push ss
5:94A8  50                   push ax
5:94A9  ff76c6               push word ptr [bp - 0x3a]
5:94AC  9a11950000           lcall 0, 0x9511  ; USER.FillRect
5:94B1  ff76c6               push word ptr [bp - 0x3a]
5:94B4  9a29950000           lcall 0, 0x9529  ; GDI.DeleteObject
5:94B9  c746c80100           mov word ptr [bp - 0x38], 1
5:94BE  c746c40800           mov word ptr [bp - 0x3c], 8
5:94C3  eb6e                 jmp 0x9533
5:94C5  db 90
loc_94C6:
5:94C6  8b76c4               mov si, word ptr [bp - 0x3c]
5:94C9  c1e602               shl si, 2
5:94CC  c45ee4               les bx, ptr [bp - 0x1c]
5:94CF  6626ff7004           push dword ptr es:[bx + si + 4]
5:94D4  9a41950000           lcall 0, 0x9541  ; GDI.CreateSolidBrush
5:94D9  8946c6               mov word ptr [bp - 0x3a], ax
5:94DC  8b46fa               mov ax, word ptr [bp - 6]
5:94DF  48                   dec ax
5:94E0  8946fe               mov word ptr [bp - 2], ax
5:94E3  8b46f6               mov ax, word ptr [bp - 0xa]
5:94E6  40                   inc ax
5:94E7  8946f2               mov word ptr [bp - 0xe], ax
5:94EA  8b5ec4               mov bx, word ptr [bp - 0x3c]
5:94ED  03db                 add bx, bx
5:94EF  c476e8               les si, ptr [bp - 0x18]
5:94F2  268b00               mov ax, word ptr es:[bx + si]
5:94F5  40                   inc ax
5:94F6  8946fa               mov word ptr [bp - 6], ax
5:94F9  8b5ec8               mov bx, word ptr [bp - 0x38]
5:94FC  03db                 add bx, bx
5:94FE  268b4014             mov ax, word ptr es:[bx + si + 0x14]
5:9502  8946f6               mov word ptr [bp - 0xa], ax
5:9505  ff76d2               push word ptr [bp - 0x2e]
5:9508  8d46f8               lea ax, [bp - 8]
5:950B  16                   push ss
5:950C  50                   push ax
5:950D  ff76c6               push word ptr [bp - 0x3a]
5:9510  9a21950000           lcall 0, 0x9521  ; USER.FillRect
5:9515  ff76d2               push word ptr [bp - 0x2e]
5:9518  8d46f0               lea ax, [bp - 0x10]
5:951B  16                   push ss
5:951C  50                   push ax
5:951D  ff76c6               push word ptr [bp - 0x3a]
5:9520  9a7b950000           lcall 0, 0x957b  ; USER.FillRect
5:9525  ff76c6               push word ptr [bp - 0x3a]
5:9528  9a93950000           lcall 0, 0x9593  ; GDI.DeleteObject
5:952D  ff46c8               inc word ptr [bp - 0x38]
5:9530  ff4ec4               dec word ptr [bp - 0x3c]
loc_9533:
5:9533  837ec80a             cmp word ptr [bp - 0x38], 0xa
5:9537  7c8d                 jl 0x94c6
5:9539  c45ee4               les bx, ptr [bp - 0x1c]
5:953C  6626ff37             push dword ptr es:[bx]
5:9540  9aef330000           lcall 0, 0x33ef  ; GDI.CreateSolidBrush
5:9545  8946c6               mov word ptr [bp - 0x3a], ax
5:9548  c746fa0000           mov word ptr [bp - 6], 0
5:954D  c45ee8               les bx, ptr [bp - 0x18]
5:9550  268b07               mov ax, word ptr es:[bx]
5:9553  8946fe               mov word ptr [bp - 2], ax
5:9556  8b5eee               mov bx, word ptr [bp - 0x12]
5:9559  03db                 add bx, bx
5:955B  8b76e8               mov si, word ptr [bp - 0x18]
5:955E  268b00               mov ax, word ptr es:[bx + si]
5:9561  40                   inc ax
5:9562  8946f2               mov word ptr [bp - 0xe], ax
5:9565  c45e06               les bx, ptr [bp + 6]
5:9568  268b470e             mov ax, word ptr es:[bx + 0xe]
5:956C  8946f6               mov word ptr [bp - 0xa], ax
5:956F  ff76d2               push word ptr [bp - 0x2e]
5:9572  8d46f8               lea ax, [bp - 8]
5:9575  16                   push ss
5:9576  50                   push ax
5:9577  ff76c6               push word ptr [bp - 0x3a]
5:957A  9a8b950000           lcall 0, 0x958b  ; USER.FillRect
5:957F  ff76d2               push word ptr [bp - 0x2e]
5:9582  8d46f0               lea ax, [bp - 0x10]
5:9585  16                   push ss
5:9586  50                   push ax
5:9587  ff76c6               push word ptr [bp - 0x3a]
5:958A  9a787d0000           lcall 0, 0x7d78  ; USER.FillRect
5:958F  ff76c6               push word ptr [bp - 0x3a]
5:9592  9a84960000           lcall 0, 0x9684  ; GDI.DeleteObject
5:9597  c746c80300           mov word ptr [bp - 0x38], 3
loc_959C:
5:959C  ff76d2               push word ptr [bp - 0x2e]
5:959F  666a00               push 0
5:95A2  8b5ec8               mov bx, word ptr [bp - 0x38]
5:95A5  c1e302               shl bx, 2
5:95A8  c476dc               les si, ptr [bp - 0x24]
5:95AB  6626ff30             push dword ptr es:[bx + si]
5:95AF  9ab47d0000           lcall 0, 0x7db4  ; GDI.CreatePen
5:95B4  8946d0               mov word ptr [bp - 0x30], ax
5:95B7  50                   push ax
5:95B8  9a7c960000           lcall 0, 0x967c  ; GDI.SelectObject
5:95BD  8946ce               mov word ptr [bp - 0x32], ax
5:95C0  8b5ec8               mov bx, word ptr [bp - 0x38]
5:95C3  03db                 add bx, bx
5:95C5  c476d8               les si, ptr [bp - 0x28]
5:95C8  268b00               mov ax, word ptr es:[bx + si]
5:95CB  0346f8               add ax, word ptr [bp - 8]
5:95CE  8946c0               mov word ptr [bp - 0x40], ax
5:95D1  ff76d2               push word ptr [bp - 0x2e]
5:95D4  50                   push ax
5:95D5  c47ed4               les di, ptr [bp - 0x2c]
5:95D8  8d01                 lea ax, [bx + di]
5:95DA  268b19               mov bx, word ptr es:[bx + di]
5:95DD  03db                 add bx, bx
5:95DF  8cc1                 mov cx, es
5:95E1  c476e8               les si, ptr [bp - 0x18]
5:95E4  268b10               mov dx, word ptr es:[bx + si]
5:95E7  8956a4               mov word ptr [bp - 0x5c], dx
5:95EA  52                   push dx
5:95EB  8d56ca               lea dx, [bp - 0x36]
5:95EE  16                   push ss
5:95EF  52                   push dx
5:95F0  8bf8                 mov di, ax
5:95F2  8bf1                 mov si, cx
5:95F4  9a4f960000           lcall 0, 0x964f  ; GDI.MoveToEx
5:95F9  ff76d2               push word ptr [bp - 0x2e]
5:95FC  ff76c0               push word ptr [bp - 0x40]
5:95FF  8ec6                 mov es, si
5:9601  8b5eee               mov bx, word ptr [bp - 0x12]
5:9604  262b1d               sub bx, word ptr es:[di]
5:9607  03db                 add bx, bx
5:9609  8bc6                 mov ax, si
5:960B  c476e8               les si, ptr [bp - 0x18]
5:960E  268b08               mov cx, word ptr es:[bx + si]
5:9611  894ea4               mov word ptr [bp - 0x5c], cx
5:9614  51                   push cx
5:9615  8bf0                 mov si, ax
5:9617  9a6e960000           lcall 0, 0x966e  ; GDI.LineTo
5:961C  8b5eec               mov bx, word ptr [bp - 0x14]
5:961F  2b5ec8               sub bx, word ptr [bp - 0x38]
5:9622  03db                 add bx, bx
5:9624  8bc6                 mov ax, si
5:9626  c476d8               les si, ptr [bp - 0x28]
5:9629  268b08               mov cx, word ptr es:[bx + si]
5:962C  034ef8               add cx, word ptr [bp - 8]
5:962F  894ec0               mov word ptr [bp - 0x40], cx
5:9632  ff76d2               push word ptr [bp - 0x2e]
5:9635  51                   push cx
5:9636  8ec0                 mov es, ax
5:9638  268b1d               mov bx, word ptr es:[di]
5:963B  03db                 add bx, bx
5:963D  c476e8               les si, ptr [bp - 0x18]
5:9640  268b08               mov cx, word ptr es:[bx + si]
5:9643  894ea4               mov word ptr [bp - 0x5c], cx
5:9646  51                   push cx
5:9647  8d4eca               lea cx, [bp - 0x36]
5:964A  16                   push ss
5:964B  51                   push cx
5:964C  8bf0                 mov si, ax
5:964E  9affff0000           lcall 0, 0xffff  ; GDI.MoveToEx
5:9653  ff76d2               push word ptr [bp - 0x2e]
5:9656  ff76c0               push word ptr [bp - 0x40]
5:9659  8ec6                 mov es, si
5:965B  8b5eee               mov bx, word ptr [bp - 0x12]
5:965E  262b1d               sub bx, word ptr es:[di]
5:9661  03db                 add bx, bx
5:9663  c476e8               les si, ptr [bp - 0x18]
5:9666  268b00               mov ax, word ptr es:[bx + si]
5:9669  8946a4               mov word ptr [bp - 0x5c], ax
5:966C  50                   push ax
5:966D  9adb7d0000           lcall 0, 0x7ddb  ; GDI.LineTo
5:9672  8946a2               mov word ptr [bp - 0x5e], ax
5:9675  ff76d2               push word ptr [bp - 0x2e]
5:9678  ff76ce               push word ptr [bp - 0x32]
5:967B  9ac07d0000           lcall 0, 0x7dc0  ; GDI.SelectObject
5:9680  ff76d0               push word ptr [bp - 0x30]
5:9683  9aee920000           lcall 0, 0x92ee  ; GDI.DeleteObject
5:9688  ff4ec8               dec word ptr [bp - 0x38]
5:968B  837ec8ff             cmp word ptr [bp - 0x38], -1
5:968F  0f8f09ff             jg 0x959c
5:9693  c45e06               les bx, ptr [bp + 6]
5:9696  26c747100000         mov word ptr es:[bx + 0x10], 0
5:969C  5e                   pop si
5:969D  5f                   pop di
5:969E  c9                   leave
5:969F  ca0400               retf 4

; ---------------- sub_s5:96A2 FAR size=3484 callers=0
5:96A2  55                   push bp
5:96A3  8bec                 mov bp, sp
5:96A5  66ff7606             push dword ptr [bp + 6]
5:96A9  90                   nop
5:96AA  0e                   push cs
5:96AB  e816fc               call 0x92c4  ; sub_s5:92C4
5:96AE  f6460a01             test byte ptr [bp + 0xa], 1
5:96B2  7409                 je 0x96bd
5:96B4  66ff7606             push dword ptr [bp + 6]
5:96B8  9ace17f791           lcall 0x91f7, 0x17ce  ; operator_delete@s1:17CE
loc_96BD:
5:96BD  8b4606               mov ax, word ptr [bp + 6]
5:96C0  8b5608               mov dx, word ptr [bp + 8]
5:96C3  c9                   leave
5:96C4  ca0600               retf 6
5:96C7  db 90 a2 96 d2 96 10 3a fe 92 12 93 d4 92 57 56 66
5:96D7  db 2b c0 66 a3 14 45 66 a3 1a 45 b8 30 44 a3 20 45
5:96E7  db 8c 1e 22 45 a3 26 45 8c 1e 28 45 8b 0e 34 44 89
5:96F7  db 0e 24 45 89 0e 2a 45 a3 2c 45 8c 1e 2e 45 89 0e
5:9707  db 30 45 a3 32 45 8c 1e 34 45 89 0e 36 45 66 2b c0
5:9717  db 66 a3 38 45 66 a3 3e 45 b8 36 44 a3 44 45 8c 1e
5:9727  db 46 45 a3 4a 45 8c 1e 4c 45 8b 0e 3a 44 89 0e 48
5:9737  db 45 89 0e 4e 45 a3 50 45 8c 1e 52 45 89 0e 54 45
5:9747  db 8b 16 62 44 89 16 12 45 89 16 5a 45 bb 54 44 89
5:9757  db 1e 56 45 8c 1e 58 45 89 1e 5c 45 8c 1e 5e 45 89
5:9767  db 16 60 45 89 1e 62 45 8c 1e 64 45 89 16 66 45 2b
5:9777  db f6 89 36 6a 45 89 36 68 45 be 3c 44 89 36 6e 45
5:9787  db 8c 1e 70 45 89 36 74 45 8c 1e 76 45 8b 3e 46 44
5:9797  db 89 3e 72 45 89 3e 78 45 89 36 7a 45 8c 1e 7c 45
5:97A7  db 89 3e 7e 45 89 36 80 45 8c 1e 82 45 89 3e 84 45
5:97B7  db 89 36 86 45 8c 1e 88 45 89 3e 8a 45 89 36 8c 45
5:97C7  db 8c 1e 8e 45 89 3e 90 45 89 1e 92 45 8c 1e 94 45
5:97D7  db 89 16 96 45 89 1e 98 45 8c 1e 9a 45 89 16 9c 45
5:97E7  db a3 9e 45 8c 1e a0 45 89 0e a2 45 a3 a4 45 8c 1e
5:97F7  db a6 45 89 0e a8 45 66 2b c0 66 a3 aa 45 66 a3 b0
5:9807  db 45 66 a3 b6 45 89 36 bc 45 8c 1e be 45 89 3e c0
5:9817  db 45 89 36 c2 45 8c 1e c4 45 89 3e c6 45 66 a3 c8
5:9827  db 45 66 a3 ce 45 66 a3 d4 45 66 a3 da 45 89 36 e0
5:9837  db 45 8c 1e e2 45 89 3e e4 45 89 36 e6 45 8c 1e e8
5:9847  db 45 89 3e ea 45 66 a3 ec 45 66 a3 f2 45 66 a3 f8
5:9857  db 45 89 36 fe 45 8c 1e 00 46 89 3e 02 46 89 36 04
5:9867  db 46 8c 1e 06 46 89 3e 08 46 66 a3 0a 46 66 a3 10
5:9877  db 46 b8 ff ff a3 1e 45 a3 ae 45 a3 b4 45 a3 ba 45
5:9887  db a3 cc 45 a3 d2 45 a3 f6 45 a3 fc 45 a3 0e 46 a3
5:9897  db 14 46 66 2b c0 66 a3 16 46 66 a3 1c 46 66 a3 22
5:98A7  db 46 66 a3 28 46 66 a3 2e 46 66 a3 34 46 a3 18 45
5:98B7  db a3 3c 45 a3 42 45 a3 6c 45 a3 d8 45 a3 de 45 a3
5:98C7  db f0 45 a3 1a 46 a3 20 46 a3 26 46 a3 2c 46 a3 32
5:98D7  db 46 a3 38 46 66 a3 3a 46 66 a3 40 46 66 a3 46 46
5:98E7  db 66 a3 4c 46 66 a3 52 46 66 a3 58 46 b8 48 44 a3
5:98F7  db 5e 46 8c 1e 60 46 a3 64 46 8c 1e 66 46 8b 0e 52
5:9907  db 44 89 0e 62 46 89 0e 68 46 a3 6a 46 8c 1e 6c 46
5:9917  db 89 0e 6e 46 8b d3 89 1e 70 46 8c 1e 72 46 89 1e
5:9927  db 76 46 8c 1e 78 46 8b 1e 62 44 89 1e 74 46 89 1e
5:9937  db 7a 46 89 16 7c 46 8c 1e 7e 46 89 1e 80 46 89 16
5:9947  db 82 46 8c 1e 84 46 89 1e 86 46 89 16 88 46 8c 1e
5:9957  db 8a 46 89 1e 8c 46 a3 8e 46 8c 1e 90 46 89 0e 92
5:9967  db 46 a3 94 46 8c 1e 96 46 89 0e 98 46 a3 9a 46 8c
5:9977  db 1e 9c 46 89 0e 9e 46 a3 a0 46 8c 1e a2 46 89 0e
5:9987  db a4 46 89 16 a6 46 8c 1e a8 46 89 1e aa 46 89 16
5:9997  db ac 46 8c 1e ae 46 89 1e b0 46 89 16 b2 46 8c 1e
5:99A7  db b4 46 89 1e b6 46 89 16 b8 46 8c 1e ba 46 89 1e
5:99B7  db bc 46 89 16 be 46 8c 1e c0 46 89 1e c2 46 2b f6
5:99C7  db 89 36 c6 46 89 36 c4 46 89 36 cc 46 89 36 ca 46
5:99D7  db 89 36 d2 46 89 36 d0 46 89 36 d8 46 89 36 d6 46
5:99E7  db 89 36 de 46 89 36 dc 46 89 16 e2 46 8c 1e e4 46
5:99F7  db 89 1e e6 46 a3 e8 46 8c 1e ea 46 89 0e ec 46 a3
5:9A07  db ee 46 8c 1e f0 46 89 0e f2 46 66 2b d2 66 89 16
5:9A17  db f4 46 66 89 16 fa 46 ba ff ff 89 16 f8 46 89 16
5:9A27  db fe 46 66 2b d2 66 89 16 00 47 66 89 16 06 47 a3
5:9A37  db 0c 47 8c 1e 0e 47 89 0e 10 47 a3 12 47 8c 1e 14
5:9A47  db 47 89 0e 16 47 66 2b c0 66 a3 18 47 66 a3 1e 47
5:9A57  db 66 a3 24 47 66 a3 2a 47 66 a3 30 47 66 a3 36 47
5:9A67  db 66 a3 3c 47 66 a3 42 47 66 a3 48 47 66 a3 4e 47
5:9A77  db 66 a3 54 47 66 a3 5a 47 66 a3 60 47 a3 3e 46 a3
5:9A87  db 44 46 a3 4a 46 a3 50 46 a3 56 46 a3 5c 46 a3 c8
5:9A97  db 46 a3 ce 46 a3 d4 46 a3 da 46 a3 e0 46 a3 04 47
5:9AA7  db a3 0a 47 a3 1c 47 a3 22 47 a3 28 47 a3 2e 47 a3
5:9AB7  db 34 47 a3 3a 47 a3 40 47 a3 46 47 a3 4c 47 a3 52
5:9AC7  db 47 a3 58 47 a3 5e 47 a3 64 47 66 a3 66 47 66 a3
5:9AD7  db 6c 47 66 a3 72 47 66 a3 78 47 66 a3 7e 47 66 a3
5:9AE7  db 84 47 66 a3 8a 47 66 a3 90 47 66 a3 96 47 66 a3
5:9AF7  db 9c 47 66 a3 a2 47 66 a3 a8 47 66 a3 ae 47 66 a3
5:9B07  db b4 47 a3 6a 47 a3 70 47 a3 76 47 a3 7c 47 a3 82
5:9B17  db 47 a3 88 47 a3 8e 47 a3 94 47 a3 9a 47 a3 a0 47
5:9B27  db a3 a6 47 a3 ac 47 a3 b2 47 a3 b8 47 b9 1b 00 bf
5:9B37  db ba 47 1e 07 f3 ab 66 2b c9 66 89 0e 50 48 66 89
5:9B47  db 0e 56 48 8b 0e 68 44 89 0e 4e 48 89 0e 60 48 ba
5:9B57  db 64 44 89 16 5c 48 8c 1e 5e 48 89 16 62 48 8c 1e
5:9B67  db 64 48 89 0e 66 48 89 16 68 48 8c 1e 6a 48 89 0e
5:9B77  db 6c 48 89 16 6e 48 8c 1e 70 48 89 0e 72 48 66 2b
5:9B87  db c9 66 89 0e 74 48 66 89 0e 7a 48 b9 36 44 89 0e
5:9B97  db 80 48 8c 1e 82 48 89 0e 86 48 8c 1e 88 48 8b 16
5:9BA7  db 3a 44 89 16 84 48 89 16 8a 48 89 0e 8c 48 8c 1e
5:9BB7  db 8e 48 89 16 90 48 bb 82 44 89 1e 92 48 8c 1e 94
5:9BC7  db 48 89 1e 98 48 8c 1e 9a 48 8b 36 86 44 89 36 96
5:9BD7  db 48 89 36 9c 48 89 1e 9e 48 8c 1e a0 48 89 36 a2
5:9BE7  db 48 2b db 89 1e a6 48 89 1e a4 48 bb 88 44 89 1e
5:9BF7  db aa 48 8c 1e ac 48 89 1e b0 48 8c 1e b2 48 8b 36
5:9C07  db 8c 44 89 36 ae 48 89 36 b4 48 89 1e b6 48 8c 1e
5:9C17  db b8 48 89 36 ba 48 bf 6a 44 89 3e bc 48 8c 1e be
5:9C27  db 48 89 3e c2 48 8c 1e c4 48 a1 6e 44 a3 c0 48 a3
5:9C37  db c6 48 89 3e c8 48 8c 1e ca 48 a3 cc 48 b8 7a 44
5:9C47  db a3 ce 48 8c 1e d0 48 a3 d4 48 8c 1e d6 48 8b 3e
5:9C57  db 80 44 89 3e d2 48 89 3e d8 48 89 0e da 48 8c 1e
5:9C67  db dc 48 89 16 de 48 89 0e e0 48 8c 1e e2 48 89 16
5:9C77  db e4 48 a3 e6 48 8c 1e e8 48 89 3e ea 48 66 2b c9
5:9C87  db 66 89 0e ec 48 66 89 0e f2 48 a3 f8 48 8c 1e fa
5:9C97  db 48 89 3e fc 48 a3 fe 48 8c 1e 00 49 89 3e 02 49
5:9CA7  db 66 2b c0 66 a3 04 49 66 a3 0a 49 b8 ff ff a3 5a
5:9CB7  db 48 a3 f0 48 a3 f6 48 a3 08 49 a3 0e 49 66 2b c0
5:9CC7  db 66 a3 10 49 66 a3 16 49 a3 54 48 a3 78 48 a3 7e
5:9CD7  db 48 a3 a8 48 a3 14 49 a3 1a 49 89 1e 1c 49 8c 1e
5:9CE7  db 1e 49 89 36 20 49 89 1e 22 49 8c 1e 24 49 89 36
5:9CF7  db 26 49 66 a3 28 49 66 a3 2e 49 66 a3 34 49 b8 6a
5:9D07  db 44 a3 3a 49 8c 1e 3c 49 a3 40 49 8c 1e 42 49 a1
5:9D17  db 6e 44 a3 3e 49 a3 44 49 66 2b c0 66 a3 46 49 66
5:9D27  db a3 4c 49 66 a3 52 49 66 a3 58 49 66 a3 5e 49 66
5:9D37  db a3 64 49 66 a3 6a 49 66 a3 70 49 66 a3 76 49 66
5:9D47  db a3 7c 49 66 a3 82 49 66 a3 88 49 66 a3 8e 49 66
5:9D57  db a3 94 49 b8 48 44 a3 9a 49 8c 1e 9c 49 a3 a0 49
5:9D67  db 8c 1e a2 49 8b 0e 52 44 89 0e 9e 49 89 0e a4 49
5:9D77  db a3 a6 49 8c 1e a8 49 89 0e aa 49 ba 70 44 89 16
5:9D87  db ac 49 8c 1e ae 49 89 16 b2 49 8c 1e b4 49 8b 1e
5:9D97  db 78 44 89 1e b0 49 89 1e b6 49 89 16 b8 49 8c 1e
5:9DA7  db ba 49 89 1e bc 49 89 16 be 49 8c 1e c0 49 89 1e
5:9DB7  db c2 49 89 16 c4 49 8c 1e c6 49 89 1e c8 49 a3 ca
5:9DC7  db 49 8c 1e cc 49 89 0e ce 49 a3 d0 49 8c 1e d2 49
5:9DD7  db 89 0e d4 49 a3 d6 49 8c 1e d8 49 89 0e da 49 a3
5:9DE7  db dc 49 8c 1e de 49 89 0e e0 49 be 82 44 89 36 e2
5:9DF7  db 49 8c 1e e4 49 89 36 e8 49 8c 1e ea 49 8b 36 86
5:9E07  db 44 89 36 e6 49 89 36 ec 49 89 16 ee 49 8c 1e f0
5:9E17  db 49 89 1e f2 49 89 16 f4 49 8c 1e f6 49 89 1e f8
5:9E27  db 49 89 16 fa 49 8c 1e fc 49 89 1e fe 49 2b f6 89
5:9E37  db 36 02 4a 89 36 00 4a 89 36 08 4a 89 36 06 4a 89
5:9E47  db 36 0e 4a 89 36 0c 4a 89 36 14 4a 89 36 12 4a 89
5:9E57  db 36 1a 4a 89 36 18 4a 89 16 1e 4a 8c 1e 20 4a 89
5:9E67  db 1e 22 4a a3 24 4a 8c 1e 26 4a 89 0e 28 4a a3 2a
5:9E77  db 4a 8c 1e 2c 4a 89 0e 2e 4a 66 2b d2 66 89 16 30
5:9E87  db 4a 66 89 16 36 4a ba ff ff 89 16 2c 49 89 16 32
5:9E97  db 49 89 16 38 49 89 16 4a 49 89 16 50 49 89 16 34
5:9EA7  db 4a 89 16 3a 4a 66 2b d2 66 89 16 3c 4a 66 89 16
5:9EB7  db 42 4a 89 16 56 49 89 16 5c 49 89 16 62 49 89 16
5:9EC7  db 68 49 89 16 6e 49 89 16 74 49 89 16 7a 49 89 16
5:9ED7  db 80 49 89 16 86 49 89 16 8c 49 89 16 92 49 89 16
5:9EE7  db 98 49 89 16 04 4a 89 16 0a 4a 89 16 10 4a 89 16
5:9EF7  db 16 4a 89 16 1c 4a 89 16 40 4a 89 16 46 4a a3 48
5:9F07  db 4a 8c 1e 4a 4a 89 0e 4c 4a a3 4e 4a 8c 1e 50 4a
5:9F17  db 89 0e 52 4a 66 2b c0 66 a3 54 4a 66 a3 5a 4a 66
5:9F27  db a3 60 4a 66 a3 66 4a 66 a3 6c 4a 66 a3 72 4a 66
5:9F37  db a3 78 4a 66 a3 7e 4a 66 a3 84 4a 66 a3 8a 4a 66
5:9F47  db a3 90 4a 66 a3 96 4a 66 a3 9c 4a 66 a3 a2 4a 66
5:9F57  db a3 a8 4a 66 a3 ae 4a 66 a3 b4 4a 66 a3 ba 4a 66
5:9F67  db a3 c0 4a 66 a3 c6 4a 66 a3 cc 4a 66 a3 d2 4a 66
5:9F77  db a3 d8 4a 66 a3 de 4a 66 a3 e4 4a 66 a3 ea 4a 66
5:9F87  db a3 f0 4a a3 58 4a a3 5e 4a a3 64 4a a3 6a 4a a3
5:9F97  db 70 4a a3 76 4a a3 7c 4a a3 82 4a a3 88 4a a3 8e
5:9FA7  db 4a a3 94 4a a3 9a 4a a3 a0 4a a3 a6 4a a3 ac 4a
5:9FB7  db a3 b2 4a a3 b8 4a a3 be 4a a3 c4 4a a3 ca 4a a3
5:9FC7  db d0 4a a3 d6 4a a3 dc 4a a3 e2 4a a3 e8 4a a3 ee
5:9FD7  db 4a a3 f4 4a b9 1b 00 bf f6 4a f3 ab 8b 0e 34 44
5:9FE7  db 89 0e 9c 4b 66 2b c9 66 89 0e 9e 4b 66 89 0e a4
5:9FF7  db 4b 66 89 0e aa 4b b9 ff ff 89 0e a2 4b 89 0e a8
5:A007  db 4b 89 0e ae 4b 66 2b c9 66 89 0e b0 4b 66 89 0e
5:A017  db b6 4b b9 8e 44 89 0e bc 4b 8c 1e be 4b 89 0e c2
5:A027  db 4b 8c 1e c4 4b 8b 16 94 44 89 16 c0 4b 89 16 c6
5:A037  db 4b 89 0e c8 4b 8c 1e ca 4b 89 16 cc 4b bb 82 44
5:A047  db 89 1e ce 4b 8c 1e d0 4b 89 1e d4 4b 8c 1e d6 4b
5:A057  db 8b 36 86 44 89 36 d2 4b 89 36 d8 4b 89 1e da 4b
5:A067  db 8c 1e dc 4b 89 36 de 4b 2b db 89 1e e2 4b 89 1e
5:A077  db e0 4b a3 b4 4b a3 ba 4b a3 e4 4b b8 ac 44 a3 e6
5:A087  db 4b 8c 1e e8 4b a3 ec 4b 8c 1e ee 4b 8b 1e b2 44
5:A097  db 89 1e ea 4b 89 1e f0 4b a3 f2 4b 8c 1e f4 4b 89
5:A0A7  db 1e f6 4b be 6a 44 89 36 f8 4b 8c 1e fa 4b 89 36
5:A0B7  db fe 4b 8c 1e 00 4c 8b 3e 6e 44 89 3e fc 4b 89 3e
5:A0C7  db 02 4c 89 36 04 4c 8c 1e 06 4c 89 3e 08 4c 89 0e
5:A0D7  db 0a 4c 8c 1e 0c 4c 89 16 0e 4c 89 0e 10 4c 8c 1e
5:A0E7  db 12 4c 89 16 14 4c a3 16 4c 8c 1e 18 4c 89 1e 1a
5:A0F7  db 4c 89 0e 22 4c 8c 1e 24 4c 89 16 26 4c 66 2b c0
5:A107  db 66 a3 28 4c 66 a3 2e 4c 66 a3 34 4c 66 a3 3a 4c
5:A117  db 66 a3 40 4c 66 a3 46 4c 66 a3 4c 4c 66 a3 52 4c
5:A127  db b8 ac 44 a3 1c 4c 8c 1e 1e 4c a3 58 4c 8c 1e 5a
5:A137  db 4c 89 1e 20 4c 89 1e 5c 4c a3 5e 4c 8c 1e 60 4c
5:A147  db 89 1e 62 4c 66 2b c0 66 a3 64 4c 66 a3 6a 4c 66
5:A157  db a3 70 4c 89 36 76 4c 8c 1e 78 4c 89 36 7c 4c 8c
5:A167  db 1e 7e 4c 89 3e 7a 4c 89 3e 80 4c 66 a3 82 4c 66
5:A177  db a3 88 4c b8 ff ff a3 2c 4c a3 32 4c a3 38 4c a3
5:A187  db 3e 4c a3 44 4c a3 4a 4c a3 68 4c a3 6e 4c a3 74
5:A197  db 4c a3 86 4c a3 8c 4c 66 2b c0 66 a3 8e 4c 66 a3
5:A1A7  db 94 4c 66 a3 9a 4c 66 a3 a0 4c 66 a3 a6 4c 66 a3
5:A1B7  db ac 4c 66 a3 b2 4c 66 a3 b8 4c 66 a3 be 4c 66 a3
5:A1C7  db c4 4c 66 a3 ca 4c 66 a3 d0 4c b8 96 44 a3 d6 4c
5:A1D7  db 8c 1e d8 4c a3 dc 4c 8c 1e de 4c 8b 0e a2 44 89
5:A1E7  db 0e da 4c 89 0e e0 4c a3 e2 4c 8c 1e e4 4c 89 0e
5:A1F7  db e6 4c a3 e8 4c 8c 1e ea 4c 89 0e ec 4c a3 ee 4c
5:A207  db 8c 1e f0 4c 89 0e f2 4c ba a4 44 89 16 f4 4c 8c
5:A217  db 1e f6 4c 89 16 fa 4c 8c 1e fc 4c 8b 1e aa 44 89
5:A227  db 1e f8 4c 89 1e fe 4c 89 16 00 4d 8c 1e 02 4d 89
5:A237  db 1e 04 4d a3 06 4d 8c 1e 08 4d 89 0e 0a 4d a3 0c
5:A247  db 4d 8c 1e 0e 4d 89 0e 10 4d a3 12 4d 8c 1e 14 4d
5:A257  db 89 0e 16 4d a3 18 4d 8c 1e 1a 4d 89 0e 1c 4d b8
5:A267  db 82 44 a3 1e 4d 8c 1e 20 4d a3 24 4d 8c 1e 26 4d
5:A277  db a1 86 44 a3 22 4d a3 28 4d 89 16 2a 4d 8c 1e 2c
5:A287  db 4d 89 1e 2e 4d 89 16 30 4d 8c 1e 32 4d 89 1e 34
5:A297  db 4d 89 16 36 4d 8c 1e 38 4d 89 1e 3a 4d 66 2b c0
5:A2A7  db 66 a3 3c 4d 66 a3 42 4d a3 50 4c a3 56 4c a3 92
5:A2B7  db 4c a3 98 4c a3 9e 4c a3 a4 4c a3 aa 4c a3 b0 4c
5:A2C7  db a3 b6 4c a3 bc 4c a3 c2 4c a3 c8 4c a3 ce 4c a3
5:A2D7  db d4 4c a3 40 4d a3 46 4d 66 a3 48 4d 66 a3 4e 4d
5:A2E7  db 66 a3 54 4d 89 16 5a 4d 8c 1e 5c 4d 89 1e 5e 4d
5:A2F7  db b8 96 44 a3 60 4d 8c 1e 62 4d a3 66 4d 8c 1e 68
5:A307  db 4d 89 0e 64 4d 89 0e 6a 4d 66 2b d2 66 89 16 6c
5:A317  db 4d 66 89 16 72 4d ba ff ff 89 16 70 4d 89 16 76
5:A327  db 4d 66 2b d2 66 89 16 78 4d 66 89 16 7e 4d a3 84
5:A337  db 4d 8c 1e 86 4d 89 0e 88 4d a3 8a 4d 8c 1e 8c 4d
5:A347  db 89 0e 8e 4d 66 2b c0 66 a3 90 4d 66 a3 96 4d 66
5:A357  db a3 9c 4d 66 a3 a2 4d 66 a3 a8 4d 66 a3 ae 4d 66
5:A367  db a3 b4 4d 66 a3 ba 4d 66 a3 c0 4d 66 a3 c6 4d 66
5:A377  db a3 cc 4d 66 a3 d2 4d 66 a3 d8 4d 66 a3 de 4d 66
5:A387  db a3 e4 4d 66 a3 ea 4d 66 a3 f0 4d 66 a3 f6 4d 66
5:A397  db a3 fc 4d 66 a3 02 4e 66 a3 08 4e 66 a3 0e 4e 66
5:A3A7  db a3 14 4e 66 a3 1a 4e 66 a3 20 4e 66 a3 26 4e 66
5:A3B7  db a3 2c 4e a3 4c 4d a3 52 4d a3 58 4d a3 7c 4d a3
5:A3C7  db 82 4d a3 94 4d a3 9a 4d a3 a0 4d a3 a6 4d a3 ac
5:A3D7  db 4d a3 b2 4d a3 b8 4d a3 be 4d a3 c4 4d a3 ca 4d
5:A3E7  db a3 d0 4d a3 d6 4d a3 dc 4d a3 e2 4d a3 e8 4d a3
5:A3F7  db ee 4d a3 f4 4d a3 fa 4d a3 00 4e a3 06 4e a3 0c
5:A407  db 4e a3 12 4e a3 18 4e a3 1e 4e a3 24 4e a3 2a 4e
5:A417  db a3 30 4e b9 1b 00 bf 32 4e f3 ab 5e 5f cb 00 68
5:A427  db 32 a4 68 30 42 9a 38 3e 3a a4 68 ff ff 68 36 42
5:A437  db 9a 38 3e ce 96 cb 00

; ---------------- sub_s5:A43E FAR size=92 callers=8
5:A43E  c80a0000             enter 0xa, 0
5:A442  c45e06               les bx, ptr [bp + 6]
5:A445  26c70736ba           mov word ptr es:[bx], 0xba36
5:A44A  26c74702ca96         mov word ptr es:[bx + 2], 0x96ca  ; SEGMENT s5:0000
5:A450  66833e744e00         cmp dword ptr [0x4e74], 0
5:A456  7538                 jne 0xa490
5:A458  6a02                 push 2
5:A45A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:A45F  9aba209592           lcall 0x9295, 0x20ba  ; sub_s3:20BA
5:A464  a1ae13               mov ax, word ptr [0x13ae]
5:A467  48                   dec ax
5:A468  7c09                 jl 0xa473
5:A46A  7007                 jo 0xa473
5:A46C  48                   dec ax
5:A46D  7e0d                 jle 0xa47c
5:A46F  48                   dec ax
5:A470  48                   dec ax
5:A471  7415                 je 0xa488
loc_A473:
5:A473  c706744ef047         mov word ptr [0x4e74], 0x47f0
5:A479  eb07                 jmp 0xa482
5:A47B  db 90
loc_A47C:
5:A47C  c706744eb444         mov word ptr [0x4e74], 0x44b4
loc_A482:
5:A482  8c1e764e             mov word ptr [0x4e76], ds
5:A486  eb08                 jmp 0xa490
loc_A488:
5:A488  c706744e2c4b         mov word ptr [0x4e74], 0x4b2c
5:A48E  ebf2                 jmp 0xa482
loc_A490:
5:A490  8b4606               mov ax, word ptr [bp + 6]
5:A493  8b5608               mov dx, word ptr [bp + 8]
5:A496  c9                   leave
5:A497  ca0400               retf 4

; ---------------- sub_s5:A49A FAR size=178 callers=2
5:A49A  c8440100             enter 0x144, 0
5:A49E  6a2f                 push 0x2f
5:A4A0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:A4A5  9aba2062a4           lcall 0xa462, 0x20ba  ; sub_s3:20BA
5:A4AA  8946fc               mov word ptr [bp - 4], ax
5:A4AD  8956fe               mov word ptr [bp - 2], dx
5:A4B0  c45efc               les bx, ptr [bp - 4]
5:A4B3  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:A4B8  668946f8             mov dword ptr [bp - 8], eax
5:A4BC  6650                 push eax
5:A4BE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A4C3  9aece115a5           lcall 0xa515, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A4C8  8946f4               mov word ptr [bp - 0xc], ax
5:A4CB  8956f6               mov word ptr [bp - 0xa], dx
5:A4CE  66837e0a00           cmp dword ptr [bp + 0xa], 0
5:A4D3  7463                 je 0xa538
5:A4D5  c45e0a               les bx, ptr [bp + 0xa]
5:A4D8  26837f0400           cmp word ptr es:[bx + 4], 0
5:A4DD  7509                 jne 0xa4e8
5:A4DF  68e9a4               push 0xa4e9  ; SEGMENT s10:0000
5:A4E2  683042               push 0x4230
5:A4E5  eb07                 jmp 0xa4ee
5:A4E7  db 90
loc_A4E8:
5:A4E8  6827a4               push 0xa427  ; SEGMENT s10:0000
5:A4EB  683642               push 0x4236
loc_A4EE:
5:A4EE  06                   push es
5:A4EF  53                   push bx
5:A4F0  9a323f31a5           lcall 0xa531, 0x3f32  ; sub_s2:3F32
5:A4F5  66ff76f8             push dword ptr [bp - 8]
5:A4F9  c41e704e             les bx, ptr [0x4e70]
5:A4FD  6626ff7704           push dword ptr es:[bx + 4]
5:A502  66ff760a             push dword ptr [bp + 0xa]
5:A506  ff760e               push word ptr [bp + 0xe]
5:A509  666a00               push 0
5:A50C  8d86ccfe             lea ax, [bp - 0x134]
5:A510  16                   push ss
5:A511  50                   push ax
5:A512  9af0876a4b           lcall 0x4b6a, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:A517  8d86ccfe             lea ax, [bp - 0x134]
5:A51B  16                   push ss
5:A51C  50                   push ax
5:A51D  66ff364857           push dword ptr [0x5748]  ; g_sim
5:A522  9a5a83f461           lcall 0x61f4, 0x835a  ; Sim::enqueue@s7:835A
5:A527  c786ccfe9a38         mov word ptr [bp - 0x134], 0x389a
5:A52D  c786cefe2fa4         mov word ptr [bp - 0x132], 0xa42f  ; SEGMENT s2:0000
5:A533  c9                   leave
5:A534  ca0a00               retf 0xa
5:A537  db 90
loc_A538:
5:A538  52                   push dx
5:A539  ff76f4               push word ptr [bp - 0xc]
5:A53C  ff760e               push word ptr [bp + 0xe]
5:A53F  66ff7606             push dword ptr [bp + 6]
5:A543  90                   nop
5:A544  0e                   push cs
5:A545  e87806               call 0xabc0  ; sub_s5:ABC0
5:A548  c9                   leave
5:A549  ca0a00               retf 0xa

; ---------------- sub_s5:A54C FAR size=248 callers=1
5:A54C  c84a0100             enter 0x14a, 0
5:A550  57                   push di
5:A551  56                   push si
5:A552  6a2f                 push 0x2f
5:A554  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:A559  9aba20a8a4           lcall 0xa4a8, 0x20ba  ; sub_s3:20BA
5:A55E  8946fc               mov word ptr [bp - 4], ax
5:A561  8956fe               mov word ptr [bp - 2], dx
5:A564  c45efc               les bx, ptr [bp - 4]
5:A567  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:A56C  668946f8             mov dword ptr [bp - 8], eax
5:A570  6650                 push eax
5:A572  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A577  9aece120a6           lcall 0xa620, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A57C  8946f4               mov word ptr [bp - 0xc], ax
5:A57F  8956f6               mov word ptr [bp - 0xa], dx
5:A582  b8e0a4               mov ax, 0xa4e0  ; SEGMENT s10:0000
5:A585  1e                   push ds
5:A586  8d7eee               lea di, [bp - 0x12]
5:A589  be3042               mov si, 0x4230
5:A58C  16                   push ss
5:A58D  07                   pop es
5:A58E  8ed8                 mov ds, ax
5:A590  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:A592  a5                   movsw word ptr es:[di], word ptr [si]
5:A593  1f                   pop ds
5:A594  8d46ee               lea ax, [bp - 0x12]
5:A597  8946e6               mov word ptr [bp - 0x1a], ax
5:A59A  8d46ec               lea ax, [bp - 0x14]
5:A59D  16                   push ss
5:A59E  50                   push ax
5:A59F  8d4eea               lea cx, [bp - 0x16]
5:A5A2  16                   push ss
5:A5A3  51                   push cx
5:A5A4  8d56ee               lea dx, [bp - 0x12]
5:A5A7  16                   push ss
5:A5A8  52                   push dx
5:A5A9  9a943ed1a5           lcall 0xa5d1, 0x3e94  ; sub_s2:3E94
5:A5AE  837e0a00             cmp word ptr [bp + 0xa], 0
5:A5B2  7c36                 jl 0xa5ea
5:A5B4  837e0a05             cmp word ptr [bp + 0xa], 5
5:A5B8  7f30                 jg 0xa5ea
5:A5BA  ff76ec               push word ptr [bp - 0x14]
5:A5BD  8b46ea               mov ax, word ptr [bp - 0x16]
5:A5C0  2b460a               sub ax, word ptr [bp + 0xa]
5:A5C3  2d0300               sub ax, 3
5:A5C6  50                   push ax
5:A5C7  6a00                 push 0
5:A5C9  8d46ee               lea ax, [bp - 0x12]
5:A5CC  16                   push ss
5:A5CD  50                   push ax
5:A5CE  9a763efea5           lcall 0xa5fe, 0x3e76  ; sub_s2:3E76
5:A5D3  66ff76f8             push dword ptr [bp - 8]
5:A5D7  c41e704e             les bx, ptr [0x4e70]
5:A5DB  6626ff7704           push dword ptr es:[bx + 4]
5:A5E0  8d46ee               lea ax, [bp - 0x12]
5:A5E3  16                   push ss
5:A5E4  50                   push ax
5:A5E5  6a7b                 push 0x7b
5:A5E7  eb2b                 jmp 0xa614
5:A5E9  db 90
loc_A5EA:
5:A5EA  ff76ec               push word ptr [bp - 0x14]
5:A5ED  8b46ea               mov ax, word ptr [bp - 0x16]
5:A5F0  2d0900               sub ax, 9
5:A5F3  50                   push ax
5:A5F4  6a00                 push 0
5:A5F6  8d46ee               lea ax, [bp - 0x12]
5:A5F9  16                   push ss
5:A5FA  50                   push ax
5:A5FB  9a763e3ca6           lcall 0xa63c, 0x3e76  ; sub_s2:3E76
5:A600  66ff76f8             push dword ptr [bp - 8]
5:A604  c41e704e             les bx, ptr [0x4e70]
5:A608  6626ff7704           push dword ptr es:[bx + 4]
5:A60D  8d46ee               lea ax, [bp - 0x12]
5:A610  16                   push ss
5:A611  50                   push ax
5:A612  6a14                 push 0x14
loc_A614:
5:A614  666a00               push 0
5:A617  8d86c2fe             lea ax, [bp - 0x13e]
5:A61B  16                   push ss
5:A61C  50                   push ax
5:A61D  9af087c6a4           lcall 0xa4c6, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:A622  8d86c2fe             lea ax, [bp - 0x13e]
5:A626  16                   push ss
5:A627  50                   push ax
5:A628  66ff364857           push dword ptr [0x5748]  ; g_sim
5:A62D  9a5a8325a5           lcall 0xa525, 0x835a  ; Sim::enqueue@s7:835A
5:A632  c786c2fe9a38         mov word ptr [bp - 0x13e], 0x389a
5:A638  c786c4fef3a4         mov word ptr [bp - 0x13c], 0xa4f3  ; SEGMENT s2:0000
5:A63E  5e                   pop si
5:A63F  5f                   pop di
5:A640  c9                   leave
5:A641  ca0600               retf 6

; ---------------- sub_s5:A644 FAR size=26 callers=1
5:A644  55                   push bp
5:A645  8bec                 mov bp, sp
5:A647  6a0b                 push 0xb
5:A649  66ff760a             push dword ptr [bp + 0xa]
5:A64D  9aac7caca5           lcall 0xa5ac, 0x7cac  ; Save_writeChunkTag@s2:7CAC
5:A652  0bc0                 or ax, ax
5:A654  7403                 je 0xa659
5:A656  b80100               mov ax, 1
loc_A659:
5:A659  c9                   leave
5:A65A  ca0800               retf 8
5:A65D  db 00

; ---------------- sub_s5:A65E FAR size=144 callers=1
5:A65E  c8220000             enter 0x22, 0
5:A662  6a0b                 push 0xb
5:A664  66ff760a             push dword ptr [bp + 0xa]
5:A668  9afe7c8ea6           lcall 0xa68e, 0x7cfe  ; sub_s2:7CFE
5:A66D  0bc0                 or ax, ax
5:A66F  7507                 jne 0xa678
loc_A671:
5:A671  33c0                 xor ax, ax
5:A673  c9                   leave
5:A674  ca0800               retf 8
5:A677  db 90
loc_A678:
5:A678  833e120302           cmp word ptr [0x312], 2
5:A67D  7d5d                 jge 0xa6dc
5:A67F  666a02               push 2
5:A682  8d46fe               lea ax, [bp - 2]
5:A685  16                   push ss
5:A686  50                   push ax
5:A687  66ff760a             push dword ptr [bp + 0xa]
5:A68B  9aee7da3a6           lcall 0xa6a3, 0x7dee  ; File_read@s2:7DEE
5:A690  0bc0                 or ax, ax
5:A692  743f                 je 0xa6d3
5:A694  666a02               push 2
5:A697  8d46fa               lea ax, [bp - 6]
5:A69A  16                   push ss
5:A69B  50                   push ax
5:A69C  66ff760a             push dword ptr [bp + 0xa]
5:A6A0  9aee7db8a6           lcall 0xa6b8, 0x7dee  ; File_read@s2:7DEE
5:A6A5  0bc0                 or ax, ax
5:A6A7  742a                 je 0xa6d3
5:A6A9  666a02               push 2
5:A6AC  8d46fc               lea ax, [bp - 4]
5:A6AF  16                   push ss
5:A6B0  50                   push ax
5:A6B1  66ff760a             push dword ptr [bp + 0xa]
5:A6B5  9aee7dcda6           lcall 0xa6cd, 0x7dee  ; File_read@s2:7DEE
5:A6BA  0bc0                 or ax, ax
5:A6BC  7415                 je 0xa6d3
5:A6BE  666a02               push 2
5:A6C1  8d46f8               lea ax, [bp - 8]
5:A6C4  16                   push ss
5:A6C5  50                   push ax
5:A6C6  66ff760a             push dword ptr [bp + 0xa]
5:A6CA  9aee7d50a6           lcall 0xa650, 0x7dee  ; File_read@s2:7DEE
5:A6CF  0bc0                 or ax, ax
5:A6D1  7509                 jne 0xa6dc
loc_A6D3:
5:A6D3  c7061003d206         mov word ptr [0x310], 0x6d2
5:A6D9  eb96                 jmp 0xa671
5:A6DB  db 90
loc_A6DC:
5:A6DC  6a00                 push 0
5:A6DE  66ff7606             push dword ptr [bp + 6]
5:A6E2  90                   nop
5:A6E3  0e                   push cs
5:A6E4  e89712               call 0xb97e  ; sub_s5:B97E
5:A6E7  b80100               mov ax, 1
5:A6EA  c9                   leave
5:A6EB  ca0800               retf 8

; ---------------- sub_s5:A6EE FAR size=288 callers=2
5:A6EE  c85e0100             enter 0x15e, 0
5:A6F2  666802000004         push 0x4000002
5:A6F8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A6FD  9aece145a7           lcall 0xa745, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A702  8946fc               mov word ptr [bp - 4], ax
5:A705  8956fe               mov word ptr [bp - 2], dx
5:A708  0bd0                 or dx, ax
5:A70A  7411                 je 0xa71d
5:A70C  c45efc               les bx, ptr [bp - 4]
5:A70F  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:A719  0f85ec00             jne 0xa809
loc_A71D:
5:A71D  6a2f                 push 0x2f
5:A71F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:A724  9aba205ca5           lcall 0xa55c, 0x20ba  ; sub_s3:20BA
5:A729  8946f8               mov word ptr [bp - 8], ax
5:A72C  8956fa               mov word ptr [bp - 6], dx
5:A72F  c45ef8               les bx, ptr [bp - 8]
5:A732  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:A737  668946f4             mov dword ptr [bp - 0xc], eax
5:A73B  6650                 push eax
5:A73D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A742  9aece1b9a7           lcall 0xa7b9, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A747  8946f0               mov word ptr [bp - 0x10], ax
5:A74A  8956f2               mov word ptr [bp - 0xe], dx
5:A74D  8d46ea               lea ax, [bp - 0x16]
5:A750  16                   push ss
5:A751  50                   push ax
5:A752  9a383e64a7           lcall 0xa764, 0x3e38  ; sub_s2:3E38
5:A757  6a28                 push 0x28
5:A759  ff760a               push word ptr [bp + 0xa]
5:A75C  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
5:A761  9aaec607a8           lcall 0xa807, 0xc6ae  ; BldgGroups::contains@s2:C6AE
5:A766  8946e8               mov word ptr [bp - 0x18], ax
5:A769  0bc0                 or ax, ax
5:A76B  7413                 je 0xa780
5:A76D  c746ee0100           mov word ptr [bp - 0x12], 1
5:A772  66ff76f0             push dword ptr [bp - 0x10]
5:A776  8d46ea               lea ax, [bp - 0x16]
5:A779  16                   push ss
5:A77A  50                   push ax
5:A77B  6a01                 push 1
5:A77D  eb0c                 jmp 0xa78b
5:A77F  db 90
loc_A780:
5:A780  66ff76f0             push dword ptr [bp - 0x10]
5:A784  8d46ea               lea ax, [bp - 0x16]
5:A787  16                   push ss
5:A788  50                   push ax
5:A789  6a00                 push 0
loc_A78B:
5:A78B  66ff7606             push dword ptr [bp + 6]
5:A78F  90                   nop
5:A790  0e                   push cs
5:A791  e8460b               call 0xb2da  ; sub_s5:B2DA
5:A794  c45ef0               les bx, ptr [bp - 0x10]
5:A797  6626ff7704           push dword ptr es:[bx + 4]
5:A79C  c41e704e             les bx, ptr [0x4e70]
5:A7A0  6626ff7704           push dword ptr es:[bx + 4]
5:A7A5  8d46ea               lea ax, [bp - 0x16]
5:A7A8  16                   push ss
5:A7A9  50                   push ax
5:A7AA  ff760a               push word ptr [bp + 0xa]
5:A7AD  666a00               push 0
5:A7B0  8d86c4fe             lea ax, [bp - 0x13c]
5:A7B4  16                   push ss
5:A7B5  50                   push ax
5:A7B6  9af0877aa5           lcall 0xa57a, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:A7BB  8d86c4fe             lea ax, [bp - 0x13c]
5:A7BF  16                   push ss
5:A7C0  50                   push ax
5:A7C1  66ff364857           push dword ptr [0x5748]  ; g_sim
5:A7C6  9a5a8330a6           lcall 0xa630, 0x835a  ; Sim::enqueue@s7:835A
5:A7CB  837ee800             cmp word ptr [bp - 0x18], 0
5:A7CF  7416                 je 0xa7e7
5:A7D1  c45ef0               les bx, ptr [bp - 0x10]
5:A7D4  6626ff7704           push dword ptr es:[bx + 4]
5:A7D9  8d46ea               lea ax, [bp - 0x16]
5:A7DC  16                   push ss
5:A7DD  50                   push ax
5:A7DE  66ff7606             push dword ptr [bp + 6]
5:A7E2  90                   nop
5:A7E3  0e                   push cs
5:A7E4  e8a905               call 0xad90  ; sub_s5:AD90
loc_A7E7:
5:A7E7  668b46e4             mov eax, dword ptr [bp - 0x1c]
5:A7EB  668986c0fe           mov dword ptr [bp - 0x140], eax
5:A7F0  c49ec0fe             les bx, ptr [bp - 0x140]
5:A7F4  6626c7471c01000008   mov dword ptr es:[bx + 0x1c], 0x8000001
5:A7FD  c786c4fe9a38         mov word ptr [bp - 0x13c], 0x389a
5:A803  c786c6fe6ba6         mov word ptr [bp - 0x13a], 0xa66b  ; SEGMENT s2:0000
loc_A809:
5:A809  c9                   leave
5:A80A  ca0600               retf 6
5:A80D  db 00

; ---------------- sub_s5:A80E FAR size=144 callers=1
5:A80E  c81a0000             enter 0x1a, 0
5:A812  666802000004         push 0x4000002
5:A818  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A81D  9aece15fa8           lcall 0xa85f, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A822  8946fc               mov word ptr [bp - 4], ax
5:A825  8956fe               mov word ptr [bp - 2], dx
5:A828  0bd0                 or dx, ax
5:A82A  740f                 je 0xa83b
5:A82C  c45efc               les bx, ptr [bp - 4]
5:A82F  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:A839  755f                 jne 0xa89a
loc_A83B:
5:A83B  6a2f                 push 0x2f
5:A83D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:A842  9aba2027a7           lcall 0xa727, 0x20ba  ; sub_s3:20BA
5:A847  8946f8               mov word ptr [bp - 8], ax
5:A84A  8956fa               mov word ptr [bp - 6], dx
5:A84D  c45ef8               les bx, ptr [bp - 8]
5:A850  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:A855  6650                 push eax
5:A857  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A85C  9aece100a7           lcall 0xa700, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A861  8946f0               mov word ptr [bp - 0x10], ax
5:A864  8956f2               mov word ptr [bp - 0xe], dx
5:A867  837e0a0a             cmp word ptr [bp + 0xa], 0xa
5:A86B  750f                 jne 0xa87c
5:A86D  52                   push dx
5:A86E  50                   push ax
5:A86F  66ff7606             push dword ptr [bp + 6]
5:A873  90                   nop
5:A874  0e                   push cs
5:A875  e8fa0f               call 0xb872  ; sub_s5:B872
5:A878  c9                   leave
5:A879  ca0600               retf 6
loc_A87C:
5:A87C  66ff7608             push dword ptr [bp + 8]
5:A880  ff7606               push word ptr [bp + 6]
5:A883  90                   nop
5:A884  0e                   push cs
5:A885  e82208               call 0xb0aa  ; sub_s5:B0AA
5:A888  0bc0                 or ax, ax
5:A88A  740e                 je 0xa89a
5:A88C  66ff76f0             push dword ptr [bp - 0x10]
5:A890  50                   push ax
5:A891  66ff7606             push dword ptr [bp + 6]
5:A895  90                   nop
5:A896  0e                   push cs
5:A897  e82603               call 0xabc0  ; sub_s5:ABC0
loc_A89A:
5:A89A  c9                   leave
5:A89B  ca0600               retf 6

; ---------------- sub_s5:A89E FAR size=802 callers=1
5:A89E  c8100600             enter 0x610, 0
5:A8A2  57                   push di
5:A8A3  56                   push si
5:A8A4  6a2f                 push 0x2f
5:A8A6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:A8AB  9aba2063aa           lcall 0xaa63, 0x20ba  ; sub_s3:20BA
5:A8B0  8946fc               mov word ptr [bp - 4], ax
5:A8B3  8956fe               mov word ptr [bp - 2], dx
5:A8B6  c45efc               les bx, ptr [bp - 4]
5:A8B9  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:A8BE  668946f8             mov dword ptr [bp - 8], eax
5:A8C2  6650                 push eax
5:A8C4  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:A8C9  9aece13da9           lcall 0xa93d, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:A8CE  8946f4               mov word ptr [bp - 0xc], ax
5:A8D1  8956f6               mov word ptr [bp - 0xa], dx
5:A8D4  8b460a               mov ax, word ptr [bp + 0xa]
5:A8D7  8b560c               mov dx, word ptr [bp + 0xc]
5:A8DA  1e                   push ds
5:A8DB  8d7eee               lea di, [bp - 0x12]
5:A8DE  8bf0                 mov si, ax
5:A8E0  16                   push ss
5:A8E1  07                   pop es
5:A8E2  8eda                 mov ds, dx
5:A8E4  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:A8E6  a5                   movsw word ptr es:[di], word ptr [si]
5:A8E7  1f                   pop ds
5:A8E8  8d46ee               lea ax, [bp - 0x12]
5:A8EB  898640fb             mov word ptr [bp - 0x4c0], ax
5:A8EF  8d46ec               lea ax, [bp - 0x14]
5:A8F2  16                   push ss
5:A8F3  50                   push ax
5:A8F4  8d4eea               lea cx, [bp - 0x16]
5:A8F7  16                   push ss
5:A8F8  51                   push cx
5:A8F9  8d56ee               lea dx, [bp - 0x12]
5:A8FC  16                   push ss
5:A8FD  52                   push dx
5:A8FE  9a943e17a9           lcall 0xa917, 0x3e94  ; sub_s2:3E94
5:A903  8b46ec               mov ax, word ptr [bp - 0x14]
5:A906  050200               add ax, 2
5:A909  50                   push ax
5:A90A  ff76ea               push word ptr [bp - 0x16]
5:A90D  6a00                 push 0
5:A90F  8d46ee               lea ax, [bp - 0x12]
5:A912  16                   push ss
5:A913  50                   push ax
5:A914  9a763e63a9           lcall 0xa963, 0x3e76  ; sub_s2:3E76
5:A919  66ff76f8             push dword ptr [bp - 8]
5:A91D  666802000004         push 0x4000002
5:A923  666802000008         push 0x8000002
5:A929  8d46ee               lea ax, [bp - 0x12]
5:A92C  16                   push ss
5:A92D  50                   push ax
5:A92E  666800007a00         push 0x7a0000
5:A934  8d86c6fe             lea ax, [bp - 0x13a]
5:A938  16                   push ss
5:A939  50                   push ax
5:A93A  9a888889a9           lcall 0xa989, 0x8888  ; SCInternalPutBldg2@s6:8888
5:A93F  8d86c6fe             lea ax, [bp - 0x13a]
5:A943  16                   push ss
5:A944  50                   push ax
5:A945  66ff364857           push dword ptr [0x5748]  ; g_sim
5:A94A  9a5a8399a9           lcall 0xa999, 0x835a  ; Sim::enqueue@s7:835A
5:A94F  ff76ec               push word ptr [bp - 0x14]
5:A952  8b46ea               mov ax, word ptr [bp - 0x16]
5:A955  2d0200               sub ax, 2
5:A958  50                   push ax
5:A959  6a00                 push 0
5:A95B  8d46ee               lea ax, [bp - 0x12]
5:A95E  16                   push ss
5:A95F  50                   push ax
5:A960  9a763eafa9           lcall 0xa9af, 0x3e76  ; sub_s2:3E76
5:A965  66ff76f8             push dword ptr [bp - 8]
5:A969  666802000004         push 0x4000002
5:A96F  666802000008         push 0x8000002
5:A975  8d46ee               lea ax, [bp - 0x12]
5:A978  16                   push ss
5:A979  50                   push ax
5:A97A  666800004700         push 0x470000
5:A980  8d86a2fd             lea ax, [bp - 0x25e]
5:A984  16                   push ss
5:A985  50                   push ax
5:A986  9a8888d5a9           lcall 0xa9d5, 0x8888  ; SCInternalPutBldg2@s6:8888
5:A98B  8d86a2fd             lea ax, [bp - 0x25e]
5:A98F  16                   push ss
5:A990  50                   push ax
5:A991  66ff364857           push dword ptr [0x5748]  ; g_sim
5:A996  9a5a83e5a9           lcall 0xa9e5, 0x835a  ; Sim::enqueue@s7:835A
5:A99B  ff76ec               push word ptr [bp - 0x14]
5:A99E  8b46ea               mov ax, word ptr [bp - 0x16]
5:A9A1  2d0200               sub ax, 2
5:A9A4  50                   push ax
5:A9A5  6a01                 push 1
5:A9A7  8d46ee               lea ax, [bp - 0x12]
5:A9AA  16                   push ss
5:A9AB  50                   push ax
5:A9AC  9a763e0faa           lcall 0xaa0f, 0x3e76  ; sub_s2:3E76
5:A9B1  66ff76f8             push dword ptr [bp - 8]
5:A9B5  666802000004         push 0x4000002
5:A9BB  666802000008         push 0x8000002
5:A9C1  8d46ee               lea ax, [bp - 0x12]
5:A9C4  16                   push ss
5:A9C5  50                   push ax
5:A9C6  666800006a00         push 0x6a0000
5:A9CC  8d867efc             lea ax, [bp - 0x382]
5:A9D0  16                   push ss
5:A9D1  50                   push ax
5:A9D2  9a888835aa           lcall 0xaa35, 0x8888  ; SCInternalPutBldg2@s6:8888
5:A9D7  8d867efc             lea ax, [bp - 0x382]
5:A9DB  16                   push ss
5:A9DC  50                   push ax
5:A9DD  66ff364857           push dword ptr [0x5748]  ; g_sim
5:A9E2  9a5a8345aa           lcall 0xaa45, 0x835a  ; Sim::enqueue@s7:835A
5:A9E7  66ff76f8             push dword ptr [bp - 8]
5:A9EB  8d46ee               lea ax, [bp - 0x12]
5:A9EE  16                   push ss
5:A9EF  50                   push ax
5:A9F0  66ff7606             push dword ptr [bp + 6]
5:A9F4  90                   nop
5:A9F5  0e                   push cs
5:A9F6  e89703               call 0xad90  ; sub_s5:AD90
5:A9F9  8b46ec               mov ax, word ptr [bp - 0x14]
5:A9FC  40                   inc ax
5:A9FD  50                   push ax
5:A9FE  8b46ea               mov ax, word ptr [bp - 0x16]
5:AA01  2d0200               sub ax, 2
5:AA04  50                   push ax
5:AA05  6a01                 push 1
5:AA07  8d46ee               lea ax, [bp - 0x12]
5:AA0A  16                   push ss
5:AA0B  50                   push ax
5:AA0C  9a763e86aa           lcall 0xaa86, 0x3e76  ; sub_s2:3E76
5:AA11  66ff76f8             push dword ptr [bp - 8]
5:AA15  666802000004         push 0x4000002
5:AA1B  666802000008         push 0x8000002
5:AA21  8d46ee               lea ax, [bp - 0x12]
5:AA24  16                   push ss
5:AA25  50                   push ax
5:AA26  666800007f00         push 0x7f0000
5:AA2C  8d865afb             lea ax, [bp - 0x4a6]
5:AA30  16                   push ss
5:AA31  50                   push ax
5:AA32  9a88881bab           lcall 0xab1b, 0x8888  ; SCInternalPutBldg2@s6:8888
5:AA37  8d865afb             lea ax, [bp - 0x4a6]
5:AA3B  16                   push ss
5:AA3C  50                   push ax
5:AA3D  66ff364857           push dword ptr [0x5748]  ; g_sim
5:AA42  9a5a832bab           lcall 0xab2b, 0x835a  ; Sim::enqueue@s7:835A
5:AA47  66ff76f8             push dword ptr [bp - 8]
5:AA4B  8d46ee               lea ax, [bp - 0x12]
5:AA4E  16                   push ss
5:AA4F  50                   push ax
5:AA50  66ff7606             push dword ptr [bp + 6]
5:AA54  90                   nop
5:AA55  0e                   push cs
5:AA56  e83703               call 0xad90  ; sub_s5:AD90
5:AA59  6a08                 push 8
5:AA5B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:AA60  9aba2088ab           lcall 0xab88, 0x20ba  ; sub_s3:20BA
5:AA65  898656fb             mov word ptr [bp - 0x4aa], ax
5:AA69  899658fb             mov word ptr [bp - 0x4a8], dx
5:AA6D  c49e56fb             les bx, ptr [bp - 0x4aa]
5:AA71  66268b4712           mov eax, dword ptr es:[bx + 0x12]
5:AA76  66898652fb           mov dword ptr [bp - 0x4ae], eax
5:AA7B  6650                 push eax
5:AA7D  8d864afb             lea ax, [bp - 0x4b6]
5:AA81  16                   push ss
5:AA82  50                   push ax
5:AA83  9a845797aa           lcall 0xaa97, 0x5784  ; ListIter::ListIter@s2:5784
5:AA88  c78644fb0000         mov word ptr [bp - 0x4bc], 0
loc_AA8E:
5:AA8E  8d864afb             lea ax, [bp - 0x4b6]
5:AA92  16                   push ss
5:AA93  50                   push ax
5:AA94  9a125b3fab           lcall 0xab3f, 0x5b12  ; ListIter::next@s2:5B12
5:AA99  898646fb             mov word ptr [bp - 0x4ba], ax
5:AA9D  899648fb             mov word ptr [bp - 0x4b8], dx
5:AAA1  0bd0                 or dx, ax
5:AAA3  0f84d900             je 0xab80
5:AAA7  c49e46fb             les bx, ptr [bp - 0x4ba]
5:AAAB  26837f043e           cmp word ptr es:[bx + 4], 0x3e
5:AAB0  7407                 je 0xaab9
5:AAB2  26837f0441           cmp word ptr es:[bx + 4], 0x41
5:AAB7  75d5                 jne 0xaa8e
loc_AAB9:
5:AAB9  c49e46fb             les bx, ptr [bp - 0x4ba]
5:AABD  26837f0600           cmp word ptr es:[bx + 6], 0
5:AAC2  7eca                 jle 0xaa8e
5:AAC4  8b8644fb             mov ax, word ptr [bp - 0x4bc]
5:AAC8  ff8644fb             inc word ptr [bp - 0x4bc]
5:AACC  0bc0                 or ax, ax
5:AACE  7474                 je 0xab44
5:AAD0  48                   dec ax
5:AAD1  0f848b00             je 0xab60
5:AAD5  48                   dec ax
5:AAD6  0f848e00             je 0xab68
5:AADA  48                   dec ax
5:AADB  0f849900             je 0xab78
5:AADF  66ff76f4             push dword ptr [bp - 0xc]
5:AAE3  8d46ee               lea ax, [bp - 0x12]
5:AAE6  16                   push ss
5:AAE7  50                   push ax
5:AAE8  6a00                 push 0
5:AAEA  66ff7606             push dword ptr [bp + 6]
5:AAEE  90                   nop
5:AAEF  0e                   push cs
5:AAF0  e8e707               call 0xb2da  ; sub_s5:B2DA
loc_AAF3:
5:AAF3  66ff76f8             push dword ptr [bp - 8]
5:AAF7  666802000004         push 0x4000002
5:AAFD  666802000008         push 0x8000002
5:AB03  8d46ee               lea ax, [bp - 0x12]
5:AB06  16                   push ss
5:AB07  50                   push ax
5:AB08  c49e46fb             les bx, ptr [bp - 0x4ba]
5:AB0C  26ff7704             push word ptr es:[bx + 4]
5:AB10  6a00                 push 0
5:AB12  8d8614fa             lea ax, [bp - 0x5ec]
5:AB16  16                   push ss
5:AB17  50                   push ax
5:AB18  9a888820a8           lcall 0xa820, 0x8888  ; SCInternalPutBldg2@s6:8888
5:AB1D  8d8614fa             lea ax, [bp - 0x5ec]
5:AB21  16                   push ss
5:AB22  50                   push ax
5:AB23  66ff364857           push dword ptr [0x5748]  ; g_sim
5:AB28  9a5a83c9a7           lcall 0xa7c9, 0x835a  ; Sim::enqueue@s7:835A
5:AB2D  c49e46fb             les bx, ptr [bp - 0x4ba]
5:AB31  26ff4f06             dec word ptr es:[bx + 6]
5:AB35  c78614fa9a38         mov word ptr [bp - 0x5ec], 0x389a
5:AB3B  c78616fa5cab         mov word ptr [bp - 0x5ea], 0xab5c  ; SEGMENT s2:0000
5:AB41  e975ff               jmp 0xaab9
loc_AB44:
5:AB44  8b46ec               mov ax, word ptr [bp - 0x14]
5:AB47  2d0200               sub ax, 2
loc_AB4A:
5:AB4A  50                   push ax
5:AB4B  8b46ea               mov ax, word ptr [bp - 0x16]
5:AB4E  2d0200               sub ax, 2
loc_AB51:
5:AB51  50                   push ax
5:AB52  6a00                 push 0
5:AB54  8d46ee               lea ax, [bp - 0x12]
5:AB57  16                   push ss
5:AB58  50                   push ax
5:AB59  9a763e94ab           lcall 0xab94, 0x3e76  ; sub_s2:3E76
5:AB5E  eb93                 jmp 0xaaf3
loc_AB60:
5:AB60  8b46ec               mov ax, word ptr [bp - 0x14]
5:AB63  050200               add ax, 2
5:AB66  ebe2                 jmp 0xab4a
loc_AB68:
5:AB68  8b46ec               mov ax, word ptr [bp - 0x14]
5:AB6B  050200               add ax, 2
loc_AB6E:
5:AB6E  50                   push ax
5:AB6F  8b46ea               mov ax, word ptr [bp - 0x16]
5:AB72  050200               add ax, 2
5:AB75  ebda                 jmp 0xab51
5:AB77  db 90
loc_AB78:
5:AB78  8b46ec               mov ax, word ptr [bp - 0x14]
5:AB7B  2d0200               sub ax, 2
5:AB7E  ebee                 jmp 0xab6e
loc_AB80:
5:AB80  66ffb656fb           push dword ptr [bp - 0x4aa]
5:AB85  9a749645a8           lcall 0xa845, 0x9674  ; sub_s3:9674
5:AB8A  c7865afb9a38         mov word ptr [bp - 0x4a6], 0x389a
5:AB90  c7865cfba0ab         mov word ptr [bp - 0x4a4], 0xaba0  ; SEGMENT s2:0000
5:AB96  c7867efc9a38         mov word ptr [bp - 0x382], 0x389a
5:AB9C  c78680fcacab         mov word ptr [bp - 0x380], 0xabac  ; SEGMENT s2:0000
5:ABA2  c786a2fd9a38         mov word ptr [bp - 0x25e], 0x389a
5:ABA8  c786a4fdb8ab         mov word ptr [bp - 0x25c], 0xabb8  ; SEGMENT s2:0000
5:ABAE  c786c6fe9a38         mov word ptr [bp - 0x13a], 0x389a
5:ABB4  c786c8fe55a7         mov word ptr [bp - 0x138], 0xa755  ; SEGMENT s2:0000
5:ABBA  5e                   pop si
5:ABBB  5f                   pop di
5:ABBC  c9                   leave
5:ABBD  ca0800               retf 8

; ---------------- sub_s5:ABC0 FAR size=174 callers=2
5:ABC0  c8440100             enter 0x144, 0
5:ABC4  8d46fa               lea ax, [bp - 6]
5:ABC7  16                   push ss
5:ABC8  50                   push ax
5:ABC9  9a383edbab           lcall 0xabdb, 0x3e38  ; sub_s2:3E38
5:ABCE  6a28                 push 0x28
5:ABD0  ff760a               push word ptr [bp + 0xa]
5:ABD3  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
5:ABD8  9aaec667ac           lcall 0xac67, 0xc6ae  ; BldgGroups::contains@s2:C6AE
5:ABDD  8946f8               mov word ptr [bp - 8], ax
5:ABE0  0bc0                 or ax, ax
5:ABE2  7412                 je 0xabf6
5:ABE4  c746fe0100           mov word ptr [bp - 2], 1
5:ABE9  66ff760c             push dword ptr [bp + 0xc]
5:ABED  8d46fa               lea ax, [bp - 6]
5:ABF0  16                   push ss
5:ABF1  50                   push ax
5:ABF2  6a01                 push 1
5:ABF4  eb0b                 jmp 0xac01
loc_ABF6:
5:ABF6  66ff760c             push dword ptr [bp + 0xc]
5:ABFA  8d46fa               lea ax, [bp - 6]
5:ABFD  16                   push ss
5:ABFE  50                   push ax
5:ABFF  6a00                 push 0
loc_AC01:
5:AC01  66ff7606             push dword ptr [bp + 6]
5:AC05  90                   nop
5:AC06  0e                   push cs
5:AC07  e8d006               call 0xb2da  ; sub_s5:B2DA
5:AC0A  c45e0c               les bx, ptr [bp + 0xc]
5:AC0D  6626ff7704           push dword ptr es:[bx + 4]
5:AC12  c41e704e             les bx, ptr [0x4e70]
5:AC16  6626ff7704           push dword ptr es:[bx + 4]
5:AC1B  8d46fa               lea ax, [bp - 6]
5:AC1E  16                   push ss
5:AC1F  50                   push ax
5:AC20  ff760a               push word ptr [bp + 0xa]
5:AC23  666a00               push 0
5:AC26  8d86d4fe             lea ax, [bp - 0x12c]
5:AC2A  16                   push ss
5:AC2B  50                   push ax
5:AC2C  9af087cca8           lcall 0xa8cc, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:AC31  8d86d4fe             lea ax, [bp - 0x12c]
5:AC35  16                   push ss
5:AC36  50                   push ax
5:AC37  66ff364857           push dword ptr [0x5748]  ; g_sim
5:AC3C  9a5a834da9           lcall 0xa94d, 0x835a  ; Sim::enqueue@s7:835A
5:AC41  837ef800             cmp word ptr [bp - 8], 0
5:AC45  7416                 je 0xac5d
5:AC47  c45e0c               les bx, ptr [bp + 0xc]
5:AC4A  6626ff7704           push dword ptr es:[bx + 4]
5:AC4F  8d46fa               lea ax, [bp - 6]
5:AC52  16                   push ss
5:AC53  50                   push ax
5:AC54  66ff7606             push dword ptr [bp + 6]
5:AC58  90                   nop
5:AC59  0e                   push cs
5:AC5A  e83301               call 0xad90  ; sub_s5:AD90
loc_AC5D:
5:AC5D  c786d4fe9a38         mov word ptr [bp - 0x12c], 0x389a
5:AC63  c786d6fe01a9         mov word ptr [bp - 0x12a], 0xa901  ; SEGMENT s2:0000
5:AC69  c9                   leave
5:AC6A  ca0a00               retf 0xa
5:AC6D  db 00

; ---------------- sub_s5:AC6E FAR size=290 callers=1
5:AC6E  c8500100             enter 0x150, 0
5:AC72  837e0a00             cmp word ptr [bp + 0xa], 0
5:AC76  7518                 jne 0xac90
5:AC78  8d46fe               lea ax, [bp - 2]
5:AC7B  16                   push ss
5:AC7C  50                   push ax
5:AC7D  8d46fc               lea ax, [bp - 4]
5:AC80  16                   push ss
5:AC81  50                   push ax
5:AC82  8d46fa               lea ax, [bp - 6]
5:AC85  16                   push ss
5:AC86  50                   push ax
5:AC87  68a0ac               push 0xaca0  ; SEGMENT s10:0000
5:AC8A  683042               push 0x4230
5:AC8D  eb16                 jmp 0xaca5
5:AC8F  db 90
loc_AC90:
5:AC90  8d46fe               lea ax, [bp - 2]
5:AC93  16                   push ss
5:AC94  50                   push ax
5:AC95  8d46fc               lea ax, [bp - 4]
5:AC98  16                   push ss
5:AC99  50                   push ax
5:AC9A  8d46fa               lea ax, [bp - 6]
5:AC9D  16                   push ss
5:AC9E  50                   push ax
5:AC9F  6883a5               push 0xa583  ; SEGMENT s10:0000
5:ACA2  683642               push 0x4236
loc_ACA5:
5:ACA5  9ab43ee1ac           lcall 0xace1, 0x3eb4  ; sub_s2:3EB4
5:ACAA  8b460e               mov ax, word ptr [bp + 0xe]
5:ACAD  eb19                 jmp 0xacc8
5:ACAF  db 90
loc_ACB0:
5:ACB0  8b460c               mov ax, word ptr [bp + 0xc]
5:ACB3  0146fe               add word ptr [bp - 2], ax
5:ACB6  eb1a                 jmp 0xacd2
loc_ACB8:
5:ACB8  8b460c               mov ax, word ptr [bp + 0xc]
5:ACBB  0146fc               add word ptr [bp - 4], ax
5:ACBE  eb12                 jmp 0xacd2
loc_ACC0:
5:ACC0  8b460c               mov ax, word ptr [bp + 0xc]
5:ACC3  2946fe               sub word ptr [bp - 2], ax
5:ACC6  eb0a                 jmp 0xacd2
loc_ACC8:
5:ACC8  0bc0                 or ax, ax
5:ACCA  74e4                 je 0xacb0
5:ACCC  48                   dec ax
5:ACCD  74e9                 je 0xacb8
5:ACCF  48                   dec ax
5:ACD0  74ee                 je 0xacc0
loc_ACD2:
5:ACD2  66ff76fc             push dword ptr [bp - 4]
5:ACD6  ff76fa               push word ptr [bp - 6]
5:ACD9  8d46f4               lea ax, [bp - 0xc]
5:ACDC  16                   push ss
5:ACDD  50                   push ax
5:ACDE  9a543e89ad           lcall 0xad89, 0x3e54  ; sub_s2:3E54
5:ACE3  6a2f                 push 0x2f
5:ACE5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:ACEA  9aba20aea8           lcall 0xa8ae, 0x20ba  ; sub_s3:20BA
5:ACEF  8946f0               mov word ptr [bp - 0x10], ax
5:ACF2  8956f2               mov word ptr [bp - 0xe], dx
5:ACF5  c45ef0               les bx, ptr [bp - 0x10]
5:ACF8  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:ACFD  668946ec             mov dword ptr [bp - 0x14], eax
5:AD01  6650                 push eax
5:AD03  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:AD08  9aece16dad           lcall 0xad6d, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:AD0D  8946e8               mov word ptr [bp - 0x18], ax
5:AD10  8956ea               mov word ptr [bp - 0x16], dx
5:AD13  c45ee8               les bx, ptr [bp - 0x18]
5:AD16  6626ff7704           push dword ptr es:[bx + 4]
5:AD1B  8d46f4               lea ax, [bp - 0xc]
5:AD1E  16                   push ss
5:AD1F  50                   push ax
5:AD20  66ff7606             push dword ptr [bp + 6]
5:AD24  90                   nop
5:AD25  0e                   push cs
5:AD26  e88504               call 0xb1ae  ; sub_s5:B1AE
5:AD29  0bc0                 or ax, ax
5:AD2B  745e                 je 0xad8b
5:AD2D  66ff76e8             push dword ptr [bp - 0x18]
5:AD31  8d46f4               lea ax, [bp - 0xc]
5:AD34  16                   push ss
5:AD35  50                   push ax
5:AD36  66ff7606             push dword ptr [bp + 6]
5:AD3A  90                   nop
5:AD3B  0e                   push cs
5:AD3C  e80105               call 0xb240  ; sub_s5:B240
5:AD3F  0bc0                 or ax, ax
5:AD41  7448                 je 0xad8b
5:AD43  66ff76ec             push dword ptr [bp - 0x14]
5:AD47  c41e704e             les bx, ptr [0x4e70]
5:AD4B  6626ff7704           push dword ptr es:[bx + 4]
5:AD50  8d46f4               lea ax, [bp - 0xc]
5:AD53  16                   push ss
5:AD54  50                   push ax
5:AD55  837e0a01             cmp word ptr [bp + 0xa], 1
5:AD59  1bc0                 sbb ax, ax
5:AD5B  24fb                 and al, 0xfb
5:AD5D  057f00               add ax, 0x7f
5:AD60  50                   push ax
5:AD61  666a00               push 0
5:AD64  8d86bcfe             lea ax, [bp - 0x144]
5:AD68  16                   push ss
5:AD69  50                   push ax
5:AD6A  9af0872fac           lcall 0xac2f, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:AD6F  8d86bcfe             lea ax, [bp - 0x144]
5:AD73  16                   push ss
5:AD74  50                   push ax
5:AD75  66ff364857           push dword ptr [0x5748]  ; g_sim
5:AD7A  9a5a833fac           lcall 0xac3f, 0x835a  ; Sim::enqueue@s7:835A
5:AD7F  c786bcfe9a38         mov word ptr [bp - 0x144], 0x389a
5:AD85  c786befeccab         mov word ptr [bp - 0x142], 0xabcc  ; SEGMENT s2:0000
loc_AD8B:
5:AD8B  c9                   leave
5:AD8C  ca0a00               retf 0xa
5:AD8F  db 00

; ---------------- sub_s5:AD90 FAR size=564 callers=3
5:AD90  c8840100             enter 0x184, 0
5:AD94  57                   push di
5:AD95  56                   push si
5:AD96  8d46fe               lea ax, [bp - 2]
5:AD99  16                   push ss
5:AD9A  50                   push ax
5:AD9B  8d46fc               lea ax, [bp - 4]
5:AD9E  16                   push ss
5:AD9F  50                   push ax
5:ADA0  8d46fa               lea ax, [bp - 6]
5:ADA3  16                   push ss
5:ADA4  50                   push ax
5:ADA5  66ff760a             push dword ptr [bp + 0xa]
5:ADA9  9ab43e31ae           lcall 0xae31, 0x3eb4  ; sub_s2:3EB4
5:ADAE  66ff760e             push dword ptr [bp + 0xe]
5:ADB2  66ff760a             push dword ptr [bp + 0xa]
5:ADB6  66ff364057           push dword ptr [0x5740]
5:ADBB  9a7e6209ae           lcall 0xae09, 0x627e  ; sub_s7:627E
5:ADC0  8946ee               mov word ptr [bp - 0x12], ax
5:ADC3  8956f0               mov word ptr [bp - 0x10], dx
5:ADC6  52                   push dx
5:ADC7  50                   push ax
5:ADC8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:ADCD  9aece1fcad           lcall 0xadfc, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:ADD2  8946ea               mov word ptr [bp - 0x16], ax
5:ADD5  8956ec               mov word ptr [bp - 0x14], dx
5:ADD8  c45eea               les bx, ptr [bp - 0x16]
5:ADDB  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:ADE0  668946e6             mov dword ptr [bp - 0x1a], eax
5:ADE4  c45ee6               les bx, ptr [bp - 0x1a]
5:ADE7  66268b4704           mov eax, dword ptr es:[bx + 4]
5:ADEC  668946e2             mov dword ptr [bp - 0x1e], eax
5:ADF0  66ff760e             push dword ptr [bp + 0xe]
5:ADF4  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:ADF9  9aece1feae           lcall 0xaefe, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:ADFE  8946da               mov word ptr [bp - 0x26], ax
5:AE01  8956dc               mov word ptr [bp - 0x24], dx
5:AE04  52                   push dx
5:AE05  50                   push ax
5:AE06  9a5c5bb1ae           lcall 0xaeb1, 0x5b5c  ; sub_s7:5B5C
5:AE0B  1e                   push ds
5:AE0C  8d7ed4               lea di, [bp - 0x2c]
5:AE0F  8bf0                 mov si, ax
5:AE11  16                   push ss
5:AE12  07                   pop es
5:AE13  8eda                 mov ds, dx
5:AE15  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:AE17  a5                   movsw word ptr es:[di], word ptr [si]
5:AE18  1f                   pop ds
5:AE19  8d46d4               lea ax, [bp - 0x2c]
5:AE1C  8946b4               mov word ptr [bp - 0x4c], ax
5:AE1F  8d46e0               lea ax, [bp - 0x20]
5:AE22  16                   push ss
5:AE23  50                   push ax
5:AE24  8d46de               lea ax, [bp - 0x22]
5:AE27  16                   push ss
5:AE28  50                   push ax
5:AE29  8d46d4               lea ax, [bp - 0x2c]
5:AE2C  16                   push ss
5:AE2D  50                   push ax
5:AE2E  9a943e86ae           lcall 0xae86, 0x3e94  ; sub_s2:3E94
5:AE33  8b46fe               mov ax, word ptr [bp - 2]
5:AE36  48                   dec ax
5:AE37  8946f8               mov word ptr [bp - 8], ax
5:AE3A  8b4efe               mov cx, word ptr [bp - 2]
5:AE3D  41                   inc cx
5:AE3E  894ef4               mov word ptr [bp - 0xc], cx
5:AE41  8b4efc               mov cx, word ptr [bp - 4]
5:AE44  49                   dec cx
5:AE45  894ef6               mov word ptr [bp - 0xa], cx
5:AE48  8b4efc               mov cx, word ptr [bp - 4]
5:AE4B  41                   inc cx
5:AE4C  894ef2               mov word ptr [bp - 0xe], cx
5:AE4F  0bc0                 or ax, ax
5:AE51  7d05                 jge 0xae58
5:AE53  c746f80000           mov word ptr [bp - 8], 0
loc_AE58:
5:AE58  8b46f4               mov ax, word ptr [bp - 0xc]
5:AE5B  3946e0               cmp word ptr [bp - 0x20], ax
5:AE5E  7f07                 jg 0xae67
5:AE60  8b46e0               mov ax, word ptr [bp - 0x20]
5:AE63  48                   dec ax
5:AE64  8946f4               mov word ptr [bp - 0xc], ax
loc_AE67:
5:AE67  837ef600             cmp word ptr [bp - 0xa], 0
5:AE6B  7d05                 jge 0xae72
5:AE6D  c746f60000           mov word ptr [bp - 0xa], 0
loc_AE72:
5:AE72  394ede               cmp word ptr [bp - 0x22], cx
5:AE75  7f07                 jg 0xae7e
5:AE77  8b46de               mov ax, word ptr [bp - 0x22]
5:AE7A  48                   dec ax
5:AE7B  8946f2               mov word ptr [bp - 0xe], ax
loc_AE7E:
5:AE7E  8d46c8               lea ax, [bp - 0x38]
5:AE81  16                   push ss
5:AE82  50                   push ax
5:AE83  9a906c9eae           lcall 0xae9e, 0x6c90  ; sub_s2:6C90
5:AE88  66ff76f6             push dword ptr [bp - 0xa]
5:AE8C  ff76fa               push word ptr [bp - 6]
5:AE8F  66ff76f2             push dword ptr [bp - 0xe]
5:AE93  ff76fa               push word ptr [bp - 6]
5:AE96  8d46c8               lea ax, [bp - 0x38]
5:AE99  16                   push ss
5:AE9A  50                   push ax
5:AE9B  9aec6ce2ae           lcall 0xaee2, 0x6cec  ; sub_s2:6CEC
5:AEA0  66ff760e             push dword ptr [bp + 0xe]
5:AEA4  8d46c8               lea ax, [bp - 0x38]
5:AEA7  16                   push ss
5:AEA8  50                   push ax
5:AEA9  66ff364057           push dword ptr [0x5740]
5:AEAE  9a22650eaf           lcall 0xaf0e, 0x6522  ; sub_s7:6522
5:AEB3  8946c4               mov word ptr [bp - 0x3c], ax
5:AEB6  8956c6               mov word ptr [bp - 0x3a], dx
5:AEB9  0bd0                 or dx, ax
5:AEBB  0f84ff00             je 0xafbe
5:AEBF  662bc0               sub eax, eax
5:AEC2  668946c0             mov dword ptr [bp - 0x40], eax
5:AEC6  8946be               mov word ptr [bp - 0x42], ax
5:AEC9  8b46f6               mov ax, word ptr [bp - 0xa]
5:AECC  8946bc               mov word ptr [bp - 0x44], ax
5:AECF  e9db00               jmp 0xafad
loc_AED2:
5:AED2  ff76b4               push word ptr [bp - 0x4c]
5:AED5  ff76bc               push word ptr [bp - 0x44]
5:AED8  ff76fa               push word ptr [bp - 6]
5:AEDB  66ff760a             push dword ptr [bp + 0xa]
5:AEDF  9a763e1aaf           lcall 0xaf1a, 0x3e76  ; sub_s2:3E76
5:AEE4  66ff760e             push dword ptr [bp + 0xe]
5:AEE8  66ff76e2             push dword ptr [bp - 0x1e]
5:AEEC  66ff760a             push dword ptr [bp + 0xa]
5:AEF0  6a06                 push 6
loc_AEF2:
5:AEF2  666a00               push 0
5:AEF5  8d8684fe             lea ax, [bp - 0x17c]
5:AEF9  16                   push ss
5:AEFA  50                   push ax
5:AEFB  9af0870bad           lcall 0xad0b, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:AF00  8d8684fe             lea ax, [bp - 0x17c]
5:AF04  16                   push ss
5:AF05  50                   push ax
5:AF06  66ff364857           push dword ptr [0x5748]  ; g_sim
5:AF0B  9a5a837dad           lcall 0xad7d, 0x835a  ; Sim::enqueue@s7:835A
5:AF10  c78684fe9a38         mov word ptr [bp - 0x17c], 0x389a
5:AF16  c78686fe72af         mov word ptr [bp - 0x17a], 0xaf72  ; SEGMENT s2:0000
loc_AF1C:
5:AF1C  ff46b4               inc word ptr [bp - 0x4c]
loc_AF1F:
5:AF1F  8b46f4               mov ax, word ptr [bp - 0xc]
5:AF22  3946b4               cmp word ptr [bp - 0x4c], ax
5:AF25  0f8f8100             jg 0xafaa
5:AF29  8b46be               mov ax, word ptr [bp - 0x42]
5:AF2C  ff46be               inc word ptr [bp - 0x42]
5:AF2F  99                   cdq
5:AF30  52                   push dx
5:AF31  50                   push ax
5:AF32  c45ec4               les bx, ptr [bp - 0x3c]
5:AF35  06                   push es
5:AF36  53                   push bx
5:AF37  26c41f               les bx, ptr es:[bx]
5:AF3A  26ff5f04             lcall es:[bx + 4]
5:AF3E  8946c0               mov word ptr [bp - 0x40], ax
5:AF41  8956c2               mov word ptr [bp - 0x3e], dx
5:AF44  8a46c3               mov al, byte ptr [bp - 0x3d]
5:AF47  2ae4                 sub ah, ah
5:AF49  a8ff                 test al, 0xff
5:AF4B  75cf                 jne 0xaf1c
5:AF4D  8b46c0               mov ax, word ptr [bp - 0x40]
5:AF50  8946a8               mov word ptr [bp - 0x58], ax
5:AF53  2d0700               sub ax, 7
5:AF56  0f8478ff             je 0xaed2
5:AF5A  48                   dec ax
5:AF5B  7405                 je 0xaf62
5:AF5D  48                   dec ax
5:AF5E  7426                 je 0xaf86
5:AF60  ebba                 jmp 0xaf1c
loc_AF62:
5:AF62  ff76b4               push word ptr [bp - 0x4c]
5:AF65  ff76bc               push word ptr [bp - 0x44]
5:AF68  ff76fa               push word ptr [bp - 6]
5:AF6B  66ff760a             push dword ptr [bp + 0xa]
5:AF6F  9a763e96af           lcall 0xaf96, 0x3e76  ; sub_s2:3E76
5:AF74  66ff760e             push dword ptr [bp + 0xe]
5:AF78  66ff76e2             push dword ptr [bp - 0x1e]
5:AF7C  66ff760a             push dword ptr [bp + 0xa]
5:AF80  6a07                 push 7
5:AF82  e96dff               jmp 0xaef2
5:AF85  db 90
loc_AF86:
5:AF86  ff76b4               push word ptr [bp - 0x4c]
5:AF89  ff76bc               push word ptr [bp - 0x44]
5:AF8C  ff76fa               push word ptr [bp - 6]
5:AF8F  66ff760a             push dword ptr [bp + 0xa]
5:AF93  9a763ea8ac           lcall 0xaca8, 0x3e76  ; sub_s2:3E76
5:AF98  66ff760e             push dword ptr [bp + 0xe]
5:AF9C  66ff76e2             push dword ptr [bp - 0x1e]
5:AFA0  66ff760a             push dword ptr [bp + 0xa]
5:AFA4  6a08                 push 8
5:AFA6  e949ff               jmp 0xaef2
5:AFA9  db 90
loc_AFAA:
5:AFAA  ff46bc               inc word ptr [bp - 0x44]
loc_AFAD:
5:AFAD  8b46f2               mov ax, word ptr [bp - 0xe]
5:AFB0  3946bc               cmp word ptr [bp - 0x44], ax
5:AFB3  7f09                 jg 0xafbe
5:AFB5  8b46f8               mov ax, word ptr [bp - 8]
5:AFB8  8946b4               mov word ptr [bp - 0x4c], ax
5:AFBB  e961ff               jmp 0xaf1f
loc_AFBE:
5:AFBE  5e                   pop si
5:AFBF  5f                   pop di
5:AFC0  c9                   leave
5:AFC1  ca0c00               retf 0xc

; ---------------- sub_s5:AFC4 FAR size=230 callers=1
5:AFC4  c81c0000             enter 0x1c, 0
5:AFC8  8d46f8               lea ax, [bp - 8]
5:AFCB  16                   push ss
5:AFCC  50                   push ax
5:AFCD  66ff760e             push dword ptr [bp + 0xe]
5:AFD1  66ff760a             push dword ptr [bp + 0xa]
5:AFD5  66ff364057           push dword ptr [0x5740]
5:AFDA  9ace641bb0           lcall 0xb01b, 0x64ce  ; sub_s7:64CE
5:AFDF  8bd8                 mov bx, ax
5:AFE1  8ec2                 mov es, dx
5:AFE3  66268b07             mov eax, dword ptr es:[bx]
5:AFE7  268b5702             mov dx, word ptr es:[bx + 2]
5:AFEB  668946fc             mov dword ptr [bp - 4], eax
5:AFEF  668946ee             mov dword ptr [bp - 0x12], eax
5:AFF3  668946e4             mov dword ptr [bp - 0x1c], eax
5:AFF7  8a46e7               mov al, byte ptr [bp - 0x19]
5:AFFA  2ae4                 sub ah, ah
5:AFFC  a8ff                 test al, 0xff
5:AFFE  0f849a00             je 0xb09c
5:B002  52                   push dx
5:B003  ff76fc               push word ptr [bp - 4]
5:B006  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B00B  9aece1d0ad           lcall 0xadd0, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B010  8946e4               mov word ptr [bp - 0x1c], ax
5:B013  8956e6               mov word ptr [bp - 0x1a], dx
5:B016  52                   push dx
5:B017  50                   push ax
5:B018  9aa873bead           lcall 0xadbe, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:B01D  8946e8               mov word ptr [bp - 0x18], ax
5:B020  8956ea               mov word ptr [bp - 0x16], dx
5:B023  0bd0                 or dx, ax
5:B025  7469                 je 0xb090
5:B027  c45ee8               les bx, ptr [bp - 0x18]
5:B02A  268b470c             mov ax, word ptr es:[bx + 0xc]
5:B02E  8946ec               mov word ptr [bp - 0x14], ax
5:B031  eb3d                 jmp 0xb070
5:B033  db 90
loc_B034:
5:B034  b80100               mov ax, 1
5:B037  eb6d                 jmp 0xb0a6
5:B039  db 90
loc_B03A:
5:B03A  b80200               mov ax, 2
5:B03D  eb67                 jmp 0xb0a6
5:B03F  db 90
loc_B040:
5:B040  b80300               mov ax, 3
5:B043  eb61                 jmp 0xb0a6
5:B045  db 90
loc_B046:
5:B046  b80400               mov ax, 4
5:B049  eb5b                 jmp 0xb0a6
5:B04B  db 90
loc_B04C:
5:B04C  b80500               mov ax, 5
5:B04F  eb55                 jmp 0xb0a6
5:B051  db 90
loc_B052:
5:B052  b80700               mov ax, 7
5:B055  eb4f                 jmp 0xb0a6
5:B057  db 90
loc_B058:
5:B058  b80800               mov ax, 8
5:B05B  c9                   leave
5:B05C  ca0c00               retf 0xc
5:B05F  db 90
loc_B060:
5:B060  b80900               mov ax, 9
5:B063  c9                   leave
5:B064  ca0c00               retf 0xc
5:B067  db 90
loc_B068:
5:B068  b80600               mov ax, 6
5:B06B  c9                   leave
5:B06C  ca0c00               retf 0xc
5:B06F  db 90
loc_B070:
5:B070  48                   dec ax
5:B071  3d0800               cmp ax, 8
5:B074  772e                 ja 0xb0a4
5:B076  03c0                 add ax, ax
5:B078  93                   xchg bx, ax
5:B079  2effa77eb0           jmp word ptr cs:[bx - 0x4f82]
switch_table_B07E:
    dw loc_B034
    dw loc_B03A
    dw loc_B040
    dw loc_B046
    dw loc_B04C
    dw loc_B052
    dw loc_B058
    dw loc_B060
    dw loc_B068
loc_B090:
5:B090  c45ee4               les bx, ptr [bp - 0x1c]
5:B093  268b4714             mov ax, word ptr es:[bx + 0x14]
5:B097  c9                   leave
5:B098  ca0c00               retf 0xc
5:B09B  db 90
loc_B09C:
5:B09C  8b46fc               mov ax, word ptr [bp - 4]
5:B09F  c9                   leave
5:B0A0  ca0c00               retf 0xc
5:B0A3  db 90
loc_B0A4:
5:B0A4  33c0                 xor ax, ax
loc_B0A6:
5:B0A6  c9                   leave
5:B0A7  ca0c00               retf 0xc

; ---------------- sub_s5:B0AA FAR size=260 callers=1
5:B0AA  c8200000             enter 0x20, 0
5:B0AE  56                   push si
5:B0AF  8b760a               mov si, word ptr [bp + 0xa]
5:B0B2  8bc6                 mov ax, si
5:B0B4  03f6                 add si, si
5:B0B6  03f0                 add si, ax
5:B0B8  03f6                 add si, si
5:B0BA  c41e744e             les bx, ptr [0x4e74]
5:B0BE  2683780400           cmp word ptr es:[bx + si + 4], 0
5:B0C3  7507                 jne 0xb0cc
5:B0C5  33c0                 xor ax, ax
5:B0C7  5e                   pop si
5:B0C8  c9                   leave
5:B0C9  ca0600               retf 6
loc_B0CC:
5:B0CC  8bf0                 mov si, ax
5:B0CE  03f0                 add si, ax
5:B0D0  03f0                 add si, ax
5:B0D2  03f6                 add si, si
5:B0D4  26837804ff           cmp word ptr es:[bx + si + 4], -1
5:B0D9  0f84cc00             je 0xb1a9
5:B0DD  833e784e00           cmp word ptr [0x4e78], 0
5:B0E2  0f859600             jne 0xb17c
5:B0E6  666802000004         push 0x4000002
5:B0EC  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B0F1  9aece10eb0           lcall 0xb00e, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B0F6  8946fa               mov word ptr [bp - 6], ax
5:B0F9  8956fc               mov word ptr [bp - 4], dx
5:B0FC  c45efa               les bx, ptr [bp - 6]
5:B0FF  66268b470c           mov eax, dword ptr es:[bx + 0xc]
5:B104  268b570e             mov dx, word ptr es:[bx + 0xe]
5:B108  668946f6             mov dword ptr [bp - 0xa], eax
5:B10C  52                   push dx
5:B10D  c45ef6               les bx, ptr [bp - 0xa]
5:B110  50                   push ax
5:B111  26c41f               les bx, ptr es:[bx]
5:B114  26ff5f10             lcall es:[bx + 0x10]
5:B118  8946f2               mov word ptr [bp - 0xe], ax
5:B11B  8956f4               mov word ptr [bp - 0xc], dx
5:B11E  66c746ee00000000     mov dword ptr [bp - 0x12], 0
5:B126  eb30                 jmp 0xb158
loc_B128:
5:B128  c45ee6               les bx, ptr [bp - 0x1a]
5:B12B  268b470c             mov ax, word ptr es:[bx + 0xc]
5:B12F  3d2a00               cmp ax, 0x2a
5:B132  7405                 je 0xb139
5:B134  3d2b00               cmp ax, 0x2b
5:B137  751b                 jne 0xb154
loc_B139:
5:B139  c706784e0100         mov word ptr [0x4e78], 1
loc_B13F:
5:B13F  833e784e00           cmp word ptr [0x4e78], 0
5:B144  7536                 jne 0xb17c
5:B146  c706784e0100         mov word ptr [0x4e78], 1
5:B14C  b82a00               mov ax, 0x2a
5:B14F  5e                   pop si
5:B150  c9                   leave
5:B151  ca0600               retf 6
loc_B154:
5:B154  66ff46ee             inc dword ptr [bp - 0x12]
loc_B158:
5:B158  668b46f2             mov eax, dword ptr [bp - 0xe]
5:B15C  663946ee             cmp dword ptr [bp - 0x12], eax
5:B160  73dd                 jae 0xb13f
5:B162  66ff76ee             push dword ptr [bp - 0x12]
5:B166  66ff76f6             push dword ptr [bp - 0xa]
5:B16A  9a7c1dddaf           lcall 0xafdd, 0x1d7c  ; sub_s7:1D7C
5:B16F  8946e6               mov word ptr [bp - 0x1a], ax
5:B172  8956e8               mov word ptr [bp - 0x18], dx
5:B175  0bd0                 or dx, ax
5:B177  75af                 jne 0xb128
5:B179  ebd9                 jmp 0xb154
5:B17B  db 90
loc_B17C:
5:B17C  8b760a               mov si, word ptr [bp + 0xa]
5:B17F  8bc6                 mov ax, si
5:B181  03f6                 add si, si
5:B183  03f0                 add si, ax
5:B185  03f6                 add si, si
5:B187  c41e744e             les bx, ptr [0x4e74]
5:B18B  268b4004             mov ax, word ptr es:[bx + si + 4]
5:B18F  48                   dec ax
5:B190  50                   push ax
5:B191  6a00                 push 0
5:B193  9a2e61acad           lcall 0xadac, 0x612e  ; sub_s2:612E
5:B198  83c404               add sp, 4
5:B19B  c41e744e             les bx, ptr [0x4e74]
5:B19F  26c418               les bx, ptr es:[bx + si]
5:B1A2  8bf0                 mov si, ax
5:B1A4  03f0                 add si, ax
5:B1A6  268b00               mov ax, word ptr es:[bx + si]
loc_B1A9:
5:B1A9  5e                   pop si
5:B1AA  c9                   leave
5:B1AB  ca0600               retf 6

; ---------------- sub_s5:B1AE FAR size=146 callers=3
5:B1AE  c8140000             enter 0x14, 0
5:B1B2  57                   push di
5:B1B3  56                   push si
5:B1B4  66ff760e             push dword ptr [bp + 0xe]
5:B1B8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B1BD  9aece1f4b0           lcall 0xb0f4, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B1C2  8946fc               mov word ptr [bp - 4], ax
5:B1C5  8956fe               mov word ptr [bp - 2], dx
5:B1C8  52                   push dx
5:B1C9  50                   push ax
5:B1CA  9a5c5b6db1           lcall 0xb16d, 0x5b5c  ; sub_s7:5B5C
5:B1CF  1e                   push ds
5:B1D0  8d7ef6               lea di, [bp - 0xa]
5:B1D3  8bf0                 mov si, ax
5:B1D5  16                   push ss
5:B1D6  07                   pop es
5:B1D7  8eda                 mov ds, dx
5:B1D9  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:B1DB  a5                   movsw word ptr es:[di], word ptr [si]
5:B1DC  1f                   pop ds
5:B1DD  8d46f6               lea ax, [bp - 0xa]
5:B1E0  8946ec               mov word ptr [bp - 0x14], ax
5:B1E3  8d46f4               lea ax, [bp - 0xc]
5:B1E6  16                   push ss
5:B1E7  50                   push ax
5:B1E8  8d4ef2               lea cx, [bp - 0xe]
5:B1EB  16                   push ss
5:B1EC  51                   push cx
5:B1ED  66ff760a             push dword ptr [bp + 0xa]
5:B1F1  9a943e08b2           lcall 0xb208, 0x3e94  ; sub_s2:3E94
5:B1F6  8d46f0               lea ax, [bp - 0x10]
5:B1F9  16                   push ss
5:B1FA  50                   push ax
5:B1FB  8d4eee               lea cx, [bp - 0x12]
5:B1FE  16                   push ss
5:B1FF  51                   push cx
5:B200  8d56f6               lea dx, [bp - 0xa]
5:B203  16                   push ss
5:B204  52                   push dx
5:B205  9a943e96b1           lcall 0xb196, 0x3e94  ; sub_s2:3E94
5:B20A  836ef00b             sub word ptr [bp - 0x10], 0xb
5:B20E  836eee0b             sub word ptr [bp - 0x12], 0xb
5:B212  837ef40b             cmp word ptr [bp - 0xc], 0xb
5:B216  7e16                 jle 0xb22e
5:B218  837ef20b             cmp word ptr [bp - 0xe], 0xb
5:B21C  7e10                 jle 0xb22e
5:B21E  8b46f4               mov ax, word ptr [bp - 0xc]
5:B221  3946f0               cmp word ptr [bp - 0x10], ax
5:B224  7e08                 jle 0xb22e
5:B226  8b46f2               mov ax, word ptr [bp - 0xe]
5:B229  3946ee               cmp word ptr [bp - 0x12], ax
5:B22C  7f08                 jg 0xb236
loc_B22E:
5:B22E  33c0                 xor ax, ax
5:B230  5e                   pop si
5:B231  5f                   pop di
5:B232  c9                   leave
5:B233  ca0c00               retf 0xc
loc_B236:
5:B236  b80100               mov ax, 1
5:B239  5e                   pop si
5:B23A  5f                   pop di
5:B23B  c9                   leave
5:B23C  ca0c00               retf 0xc
5:B23F  db 00

; ---------------- sub_s5:B240 FAR size=154 callers=3
5:B240  c8240000             enter 0x24, 0
5:B244  8d46f8               lea ax, [bp - 8]
5:B247  16                   push ss
5:B248  50                   push ax
5:B249  c45e0e               les bx, ptr [bp + 0xe]
5:B24C  6626ff7704           push dword ptr es:[bx + 4]
5:B251  66ff760a             push dword ptr [bp + 0xa]
5:B255  66ff364057           push dword ptr [0x5740]
5:B25A  9ace6499b2           lcall 0xb299, 0x64ce  ; sub_s7:64CE
5:B25F  8bd8                 mov bx, ax
5:B261  8ec2                 mov es, dx
5:B263  66268b07             mov eax, dword ptr es:[bx]
5:B267  268b5702             mov dx, word ptr es:[bx + 2]
5:B26B  668946fc             mov dword ptr [bp - 4], eax
5:B26F  668946ea             mov dword ptr [bp - 0x16], eax
5:B273  668946e0             mov dword ptr [bp - 0x20], eax
5:B277  8a46e3               mov al, byte ptr [bp - 0x1d]
5:B27A  2ae4                 sub ah, ah
5:B27C  a8ff                 test al, 0xff
5:B27E  743a                 je 0xb2ba
5:B280  52                   push dx
5:B281  ff76fc               push word ptr [bp - 4]
5:B284  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B289  9aece1c0b1           lcall 0xb1c0, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B28E  8946e0               mov word ptr [bp - 0x20], ax
5:B291  8956e2               mov word ptr [bp - 0x1e], dx
5:B294  52                   push dx
5:B295  50                   push ax
5:B296  9aa873cdb1           lcall 0xb1cd, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:B29B  8946e4               mov word ptr [bp - 0x1c], ax
5:B29E  8956e6               mov word ptr [bp - 0x1a], dx
5:B2A1  0bd0                 or dx, ax
5:B2A3  7415                 je 0xb2ba
5:B2A5  c45ee4               les bx, ptr [bp - 0x1c]
5:B2A8  268b470c             mov ax, word ptr es:[bx + 0xc]
5:B2AC  8946e8               mov word ptr [bp - 0x18], ax
5:B2AF  3d0900               cmp ax, 9
5:B2B2  7e06                 jle 0xb2ba
loc_B2B4:
5:B2B4  33c0                 xor ax, ax
5:B2B6  c9                   leave
5:B2B7  ca0c00               retf 0xc
loc_B2BA:
5:B2BA  c45e0e               les bx, ptr [bp + 0xe]
5:B2BD  6626ff7704           push dword ptr es:[bx + 4]
5:B2C2  66ff760a             push dword ptr [bp + 0xa]
5:B2C6  66ff7606             push dword ptr [bp + 6]
5:B2CA  90                   nop
5:B2CB  0e                   push cs
5:B2CC  e8dffe               call 0xb1ae  ; sub_s5:B1AE
5:B2CF  0bc0                 or ax, ax
5:B2D1  74e1                 je 0xb2b4
5:B2D3  b80100               mov ax, 1
5:B2D6  c9                   leave
5:B2D7  ca0c00               retf 0xc

; ---------------- sub_s5:B2DA FAR size=424 callers=3
5:B2DA  c8260000             enter 0x26, 0
5:B2DE  837e0a00             cmp word ptr [bp + 0xa], 0
5:B2E2  7506                 jne 0xb2ea
5:B2E4  b86a4e               mov ax, 0x4e6a
5:B2E7  eb04                 jmp 0xb2ed
5:B2E9  db 90
loc_B2EA:
5:B2EA  b86e4e               mov ax, 0x4e6e
loc_B2ED:
5:B2ED  8946f6               mov word ptr [bp - 0xa], ax
5:B2F0  8c5ef8               mov word ptr [bp - 8], ds
5:B2F3  837e0a00             cmp word ptr [bp + 0xa], 0
5:B2F7  7505                 jne 0xb2fe
5:B2F9  b8684e               mov ax, 0x4e68
5:B2FC  eb03                 jmp 0xb301
loc_B2FE:
5:B2FE  b86c4e               mov ax, 0x4e6c
loc_B301:
5:B301  8946ee               mov word ptr [bp - 0x12], ax
5:B304  8c5ef0               mov word ptr [bp - 0x10], ds
5:B307  8946f2               mov word ptr [bp - 0xe], ax
5:B30A  8c5ef4               mov word ptr [bp - 0xc], ds
loc_B30D:
5:B30D  837e0a00             cmp word ptr [bp + 0xa], 0
5:B311  7517                 jne 0xb32a
5:B313  8d46fe               lea ax, [bp - 2]
5:B316  16                   push ss
5:B317  50                   push ax
5:B318  8d46fc               lea ax, [bp - 4]
5:B31B  16                   push ss
5:B31C  50                   push ax
5:B31D  8d46fa               lea ax, [bp - 6]
5:B320  16                   push ss
5:B321  50                   push ax
5:B322  683ab3               push 0xb33a  ; SEGMENT s10:0000
5:B325  683042               push 0x4230
5:B328  eb15                 jmp 0xb33f
loc_B32A:
5:B32A  8d46fe               lea ax, [bp - 2]
5:B32D  16                   push ss
5:B32E  50                   push ax
5:B32F  8d46fc               lea ax, [bp - 4]
5:B332  16                   push ss
5:B333  50                   push ax
5:B334  8d46fa               lea ax, [bp - 6]
5:B337  16                   push ss
5:B338  50                   push ax
5:B339  6888ac               push 0xac88  ; SEGMENT s10:0000
5:B33C  683642               push 0x4236
loc_B33F:
5:B33F  9ab43e69b3           lcall 0xb369, 0x3eb4  ; sub_s2:3EB4
5:B344  c45ef6               les bx, ptr [bp - 0xa]
5:B347  268b07               mov ax, word ptr es:[bx]
5:B34A  0bc0                 or ax, ax
5:B34C  0f84de00             je 0xb42e
5:B350  48                   dec ax
5:B351  0f84e900             je 0xb43e
5:B355  48                   dec ax
5:B356  0f84f400             je 0xb44e
loc_B35A:
5:B35A  66ff76fc             push dword ptr [bp - 4]
5:B35E  ff76fa               push word ptr [bp - 6]
5:B361  8d46e8               lea ax, [bp - 0x18]
5:B364  16                   push ss
5:B365  50                   push ax
5:B366  9a543ec2b3           lcall 0xb3c2, 0x3e54  ; sub_s2:3E54
5:B36B  c45e10               les bx, ptr [bp + 0x10]
5:B36E  6626ff7704           push dword ptr es:[bx + 4]
5:B373  8d46e8               lea ax, [bp - 0x18]
5:B376  16                   push ss
5:B377  50                   push ax
5:B378  66ff7606             push dword ptr [bp + 6]
5:B37C  90                   nop
5:B37D  0e                   push cs
5:B37E  e82dfe               call 0xb1ae  ; sub_s5:B1AE
5:B381  0bc0                 or ax, ax
5:B383  7418                 je 0xb39d
5:B385  66ff7610             push dword ptr [bp + 0x10]
5:B389  8d46e8               lea ax, [bp - 0x18]
5:B38C  16                   push ss
5:B38D  50                   push ax
5:B38E  66ff7606             push dword ptr [bp + 6]
5:B392  90                   nop
5:B393  0e                   push cs
5:B394  e8a9fe               call 0xb240  ; sub_s5:B240
5:B397  0bc0                 or ax, ax
5:B399  0f85d100             jne 0xb46e
loc_B39D:
5:B39D  c45ef6               les bx, ptr [bp - 0xa]
5:B3A0  268b07               mov ax, word ptr es:[bx]
5:B3A3  0bc0                 or ax, ax
5:B3A5  0f84b500             je 0xb45e
5:B3A9  48                   dec ax
5:B3AA  0f84b800             je 0xb466
5:B3AE  48                   dec ax
5:B3AF  0f84ab00             je 0xb45e
loc_B3B3:
5:B3B3  66ff76fc             push dword ptr [bp - 4]
5:B3B7  ff76fa               push word ptr [bp - 6]
5:B3BA  8d46e8               lea ax, [bp - 0x18]
5:B3BD  16                   push ss
5:B3BE  50                   push ax
5:B3BF  9a763e7cb4           lcall 0xb47c, 0x3e76  ; sub_s2:3E76
5:B3C4  c45e10               les bx, ptr [bp + 0x10]
5:B3C7  6626ff7704           push dword ptr es:[bx + 4]
5:B3CC  8d46e8               lea ax, [bp - 0x18]
5:B3CF  16                   push ss
5:B3D0  50                   push ax
5:B3D1  66ff7606             push dword ptr [bp + 6]
5:B3D5  90                   nop
5:B3D6  0e                   push cs
5:B3D7  e8d4fd               call 0xb1ae  ; sub_s5:B1AE
5:B3DA  0bc0                 or ax, ax
5:B3DC  7416                 je 0xb3f4
5:B3DE  66ff7610             push dword ptr [bp + 0x10]
5:B3E2  8d46e8               lea ax, [bp - 0x18]
5:B3E5  16                   push ss
5:B3E6  50                   push ax
5:B3E7  66ff7606             push dword ptr [bp + 6]
5:B3EB  90                   nop
5:B3EC  0e                   push cs
5:B3ED  e850fe               call 0xb240  ; sub_s5:B240
5:B3F0  0bc0                 or ax, ax
5:B3F2  757a                 jne 0xb46e
loc_B3F4:
5:B3F4  c45ef6               les bx, ptr [bp - 0xa]
5:B3F7  268b07               mov ax, word ptr es:[bx]
5:B3FA  40                   inc ax
5:B3FB  8946e6               mov word ptr [bp - 0x1a], ax
5:B3FE  3d0200               cmp ax, 2
5:B401  7e0b                 jle 0xb40e
5:B403  c746e60000           mov word ptr [bp - 0x1a], 0
5:B408  c45ef2               les bx, ptr [bp - 0xe]
5:B40B  26ff07               inc word ptr es:[bx]
loc_B40E:
5:B40E  8b46e6               mov ax, word ptr [bp - 0x1a]
5:B411  c45ef6               les bx, ptr [bp - 0xa]
5:B414  268907               mov word ptr es:[bx], ax
5:B417  50                   push ax
5:B418  c45ef2               les bx, ptr [bp - 0xe]
5:B41B  26ff37               push word ptr es:[bx]
5:B41E  66ff7608             push dword ptr [bp + 8]
5:B422  ff7606               push word ptr [bp + 6]
5:B425  90                   nop
5:B426  0e                   push cs
5:B427  e844f8               call 0xac6e  ; sub_s5:AC6E
5:B42A  e9e0fe               jmp 0xb30d
5:B42D  db 90
loc_B42E:
5:B42E  c45ef2               les bx, ptr [bp - 0xe]
5:B431  268b07               mov ax, word ptr es:[bx]
5:B434  0146fe               add word ptr [bp - 2], ax
5:B437  ff4efc               dec word ptr [bp - 4]
5:B43A  e91dff               jmp 0xb35a
5:B43D  db 90
loc_B43E:
5:B43E  ff4efe               dec word ptr [bp - 2]
5:B441  c45ef2               les bx, ptr [bp - 0xe]
5:B444  268b07               mov ax, word ptr es:[bx]
5:B447  0146fc               add word ptr [bp - 4], ax
5:B44A  e90dff               jmp 0xb35a
5:B44D  db 90
loc_B44E:
5:B44E  ff4efc               dec word ptr [bp - 4]
5:B451  c45ef2               les bx, ptr [bp - 0xe]
5:B454  268b07               mov ax, word ptr es:[bx]
5:B457  2946fe               sub word ptr [bp - 2], ax
5:B45A  e9fdfe               jmp 0xb35a
5:B45D  db 90
loc_B45E:
5:B45E  8346fc02             add word ptr [bp - 4], 2
5:B462  e94eff               jmp 0xb3b3
5:B465  db 90
loc_B466:
5:B466  8346fe02             add word ptr [bp - 2], 2
5:B46A  e946ff               jmp 0xb3b3
5:B46D  db 90
loc_B46E:
5:B46E  66ff76fc             push dword ptr [bp - 4]
5:B472  ff76fa               push word ptr [bp - 6]
5:B475  66ff760c             push dword ptr [bp + 0xc]
5:B479  9a763ef4b1           lcall 0xb1f4, 0x3e76  ; sub_s2:3E76
5:B47E  c9                   leave
5:B47F  ca0e00               retf 0xe

; ---------------- sub_s5:B482 FAR size=1008 callers=1
5:B482  c8400000             enter 0x40, 0
5:B486  57                   push di
5:B487  56                   push si
5:B488  8d46fe               lea ax, [bp - 2]
5:B48B  16                   push ss
5:B48C  50                   push ax
5:B48D  9aaebce8b4           lcall 0xb4e8, 0xbcae  ; sub_s7:BCAE
5:B492  666800000004         push 0x4000000
5:B498  6a01                 push 1
5:B49A  8d46ec               lea ax, [bp - 0x14]
5:B49D  16                   push ss
5:B49E  50                   push ax
5:B49F  9a52dcacb4           lcall 0xb4ac, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_B4A4:
5:B4A4  8d46ec               lea ax, [bp - 0x14]
5:B4A7  16                   push ss
5:B4A8  50                   push ax
5:B4A9  9aece4d6b4           lcall 0xb4d6, 0xe4ec  ; DbIter::next@s6:E4EC
5:B4AE  8946e8               mov word ptr [bp - 0x18], ax
5:B4B1  8956ea               mov word ptr [bp - 0x16], dx
5:B4B4  0bd0                 or dx, ax
5:B4B6  7456                 je 0xb50e
5:B4B8  c45ee8               les bx, ptr [bp - 0x18]
5:B4BB  66268b4710           mov eax, dword ptr es:[bx + 0x10]
5:B4C0  668946d0             mov dword ptr [bp - 0x30], eax
5:B4C4  66ff760e             push dword ptr [bp + 0xe]
5:B4C8  66ff760a             push dword ptr [bp + 0xa]
5:B4CC  6650                 push eax
5:B4CE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B4D3  9aece18cb2           lcall 0xb28c, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B4D8  8946cc               mov word ptr [bp - 0x34], ax
5:B4DB  8956ce               mov word ptr [bp - 0x32], dx
5:B4DE  52                   push dx
5:B4DF  50                   push ax
5:B4E0  8d46fe               lea ax, [bp - 2]
5:B4E3  16                   push ss
5:B4E4  50                   push ax
5:B4E5  9abcbc5db2           lcall 0xb25d, 0xbcbc  ; sub_s7:BCBC
5:B4EA  8946ca               mov word ptr [bp - 0x36], ax
5:B4ED  0bc0                 or ax, ax
5:B4EF  7c05                 jl 0xb4f6
5:B4F1  3d6400               cmp ax, 0x64
5:B4F4  7fae                 jg 0xb4a4
loc_B4F6:
5:B4F6  c746c40000           mov word ptr [bp - 0x3c], 0
loc_B4FB:
5:B4FB  c746ec9a38           mov word ptr [bp - 0x14], 0x389a
5:B500  c746ee62b5           mov word ptr [bp - 0x12], 0xb562  ; SEGMENT s2:0000
5:B505  8b46c4               mov ax, word ptr [bp - 0x3c]
5:B508  5e                   pop si
5:B509  5f                   pop di
5:B50A  c9                   leave
5:B50B  ca0c00               retf 0xc
loc_B50E:
5:B50E  66ff760e             push dword ptr [bp + 0xe]
5:B512  66ff760a             push dword ptr [bp + 0xa]
5:B516  66ff7606             push dword ptr [bp + 6]
5:B51A  90                   nop
5:B51B  0e                   push cs
5:B51C  e821fd               call 0xb240  ; sub_s5:B240
5:B51F  0bc0                 or ax, ax
5:B521  0f843f03             je 0xb864
5:B525  c45e0e               les bx, ptr [bp + 0xe]
5:B528  66268b4704           mov eax, dword ptr es:[bx + 4]
5:B52D  668946e4             mov dword ptr [bp - 0x1c], eax
5:B531  8b460a               mov ax, word ptr [bp + 0xa]
5:B534  8b560c               mov dx, word ptr [bp + 0xc]
5:B537  1e                   push ds
5:B538  8d7ede               lea di, [bp - 0x22]
5:B53B  8bf0                 mov si, ax
5:B53D  16                   push ss
5:B53E  07                   pop es
5:B53F  8eda                 mov ds, dx
5:B541  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:B543  a5                   movsw word ptr es:[di], word ptr [si]
5:B544  1f                   pop ds
5:B545  8d46de               lea ax, [bp - 0x22]
5:B548  8946c0               mov word ptr [bp - 0x40], ax
5:B54B  8d46dc               lea ax, [bp - 0x24]
5:B54E  16                   push ss
5:B54F  50                   push ax
5:B550  8d4eda               lea cx, [bp - 0x26]
5:B553  16                   push ss
5:B554  51                   push cx
5:B555  8d56d8               lea dx, [bp - 0x28]
5:B558  16                   push ss
5:B559  52                   push dx
5:B55A  8d5ede               lea bx, [bp - 0x22]
5:B55D  16                   push ss
5:B55E  53                   push bx
5:B55F  9ab43e79b5           lcall 0xb579, 0x3eb4  ; sub_s2:3EB4
5:B564  8b46dc               mov ax, word ptr [bp - 0x24]
5:B567  48                   dec ax
5:B568  50                   push ax
5:B569  8b46da               mov ax, word ptr [bp - 0x26]
5:B56C  48                   dec ax
5:B56D  50                   push ax
5:B56E  ff76d8               push word ptr [bp - 0x28]
5:B571  8d46de               lea ax, [bp - 0x22]
5:B574  16                   push ss
5:B575  50                   push ax
5:B576  9a763ea7b5           lcall 0xb5a7, 0x3e76  ; sub_s2:3E76
5:B57B  66ff76e4             push dword ptr [bp - 0x1c]
5:B57F  8d46de               lea ax, [bp - 0x22]
5:B582  16                   push ss
5:B583  50                   push ax
5:B584  66ff7606             push dword ptr [bp + 6]
5:B588  90                   nop
5:B589  0e                   push cs
5:B58A  e837fa               call 0xafc4  ; sub_s5:AFC4
5:B58D  8946d6               mov word ptr [bp - 0x2a], ax
5:B590  0bc0                 or ax, ax
5:B592  0f84ce02             je 0xb864
5:B596  8b46dc               mov ax, word ptr [bp - 0x24]
5:B599  48                   dec ax
5:B59A  50                   push ax
5:B59B  66ff76d8             push dword ptr [bp - 0x28]
5:B59F  8d46de               lea ax, [bp - 0x22]
5:B5A2  16                   push ss
5:B5A3  50                   push ax
5:B5A4  9a763ed9b5           lcall 0xb5d9, 0x3e76  ; sub_s2:3E76
5:B5A9  66ff76e4             push dword ptr [bp - 0x1c]
5:B5AD  8d46de               lea ax, [bp - 0x22]
5:B5B0  16                   push ss
5:B5B1  50                   push ax
5:B5B2  66ff7606             push dword ptr [bp + 6]
5:B5B6  90                   nop
5:B5B7  0e                   push cs
5:B5B8  e809fa               call 0xafc4  ; sub_s5:AFC4
5:B5BB  8946d6               mov word ptr [bp - 0x2a], ax
5:B5BE  0bc0                 or ax, ax
5:B5C0  0f84a002             je 0xb864
5:B5C4  8b46dc               mov ax, word ptr [bp - 0x24]
5:B5C7  48                   dec ax
5:B5C8  50                   push ax
5:B5C9  8b46da               mov ax, word ptr [bp - 0x26]
5:B5CC  40                   inc ax
5:B5CD  50                   push ax
5:B5CE  ff76d8               push word ptr [bp - 0x28]
5:B5D1  8d46de               lea ax, [bp - 0x22]
5:B5D4  16                   push ss
5:B5D5  50                   push ax
5:B5D6  9a763e09b6           lcall 0xb609, 0x3e76  ; sub_s2:3E76
5:B5DB  66ff76e4             push dword ptr [bp - 0x1c]
5:B5DF  8d46de               lea ax, [bp - 0x22]
5:B5E2  16                   push ss
5:B5E3  50                   push ax
5:B5E4  66ff7606             push dword ptr [bp + 6]
5:B5E8  90                   nop
5:B5E9  0e                   push cs
5:B5EA  e8d7f9               call 0xafc4  ; sub_s5:AFC4
5:B5ED  8946d6               mov word ptr [bp - 0x2a], ax
5:B5F0  0bc0                 or ax, ax
5:B5F2  0f846e02             je 0xb864
5:B5F6  ff76dc               push word ptr [bp - 0x24]
5:B5F9  8b46da               mov ax, word ptr [bp - 0x26]
5:B5FC  48                   dec ax
5:B5FD  50                   push ax
5:B5FE  ff76d8               push word ptr [bp - 0x28]
5:B601  8d46de               lea ax, [bp - 0x22]
5:B604  16                   push ss
5:B605  50                   push ax
5:B606  9a763e39b6           lcall 0xb639, 0x3e76  ; sub_s2:3E76
5:B60B  66ff76e4             push dword ptr [bp - 0x1c]
5:B60F  8d46de               lea ax, [bp - 0x22]
5:B612  16                   push ss
5:B613  50                   push ax
5:B614  66ff7606             push dword ptr [bp + 6]
5:B618  90                   nop
5:B619  0e                   push cs
5:B61A  e8a7f9               call 0xafc4  ; sub_s5:AFC4
5:B61D  8946d6               mov word ptr [bp - 0x2a], ax
5:B620  0bc0                 or ax, ax
5:B622  0f843e02             je 0xb864
5:B626  ff76dc               push word ptr [bp - 0x24]
5:B629  8b46da               mov ax, word ptr [bp - 0x26]
5:B62C  40                   inc ax
5:B62D  50                   push ax
5:B62E  ff76d8               push word ptr [bp - 0x28]
5:B631  8d46de               lea ax, [bp - 0x22]
5:B634  16                   push ss
5:B635  50                   push ax
5:B636  9a763e6bb6           lcall 0xb66b, 0x3e76  ; sub_s2:3E76
5:B63B  66ff76e4             push dword ptr [bp - 0x1c]
5:B63F  8d46de               lea ax, [bp - 0x22]
5:B642  16                   push ss
5:B643  50                   push ax
5:B644  66ff7606             push dword ptr [bp + 6]
5:B648  90                   nop
5:B649  0e                   push cs
5:B64A  e877f9               call 0xafc4  ; sub_s5:AFC4
5:B64D  8946d6               mov word ptr [bp - 0x2a], ax
5:B650  0bc0                 or ax, ax
5:B652  0f840e02             je 0xb864
5:B656  8b46dc               mov ax, word ptr [bp - 0x24]
5:B659  40                   inc ax
5:B65A  50                   push ax
5:B65B  8b46da               mov ax, word ptr [bp - 0x26]
5:B65E  40                   inc ax
5:B65F  50                   push ax
5:B660  ff76d8               push word ptr [bp - 0x28]
5:B663  8d46de               lea ax, [bp - 0x22]
5:B666  16                   push ss
5:B667  50                   push ax
5:B668  9a763e99b6           lcall 0xb699, 0x3e76  ; sub_s2:3E76
5:B66D  66ff76e4             push dword ptr [bp - 0x1c]
5:B671  8d46de               lea ax, [bp - 0x22]
5:B674  16                   push ss
5:B675  50                   push ax
5:B676  66ff7606             push dword ptr [bp + 6]
5:B67A  90                   nop
5:B67B  0e                   push cs
5:B67C  e845f9               call 0xafc4  ; sub_s5:AFC4
5:B67F  8946d6               mov word ptr [bp - 0x2a], ax
5:B682  0bc0                 or ax, ax
5:B684  0f84dc01             je 0xb864
5:B688  8b46dc               mov ax, word ptr [bp - 0x24]
5:B68B  40                   inc ax
5:B68C  50                   push ax
5:B68D  66ff76d8             push dword ptr [bp - 0x28]
5:B691  8d46de               lea ax, [bp - 0x22]
5:B694  16                   push ss
5:B695  50                   push ax
5:B696  9a763ecbb6           lcall 0xb6cb, 0x3e76  ; sub_s2:3E76
5:B69B  66ff76e4             push dword ptr [bp - 0x1c]
5:B69F  8d46de               lea ax, [bp - 0x22]
5:B6A2  16                   push ss
5:B6A3  50                   push ax
5:B6A4  66ff7606             push dword ptr [bp + 6]
5:B6A8  90                   nop
5:B6A9  0e                   push cs
5:B6AA  e817f9               call 0xafc4  ; sub_s5:AFC4
5:B6AD  8946d6               mov word ptr [bp - 0x2a], ax
5:B6B0  0bc0                 or ax, ax
5:B6B2  0f84ae01             je 0xb864
5:B6B6  8b46dc               mov ax, word ptr [bp - 0x24]
5:B6B9  40                   inc ax
5:B6BA  50                   push ax
5:B6BB  8b46da               mov ax, word ptr [bp - 0x26]
5:B6BE  48                   dec ax
5:B6BF  50                   push ax
5:B6C0  ff76d8               push word ptr [bp - 0x28]
5:B6C3  8d46de               lea ax, [bp - 0x22]
5:B6C6  16                   push ss
5:B6C7  50                   push ax
5:B6C8  9a763e01b7           lcall 0xb701, 0x3e76  ; sub_s2:3E76
5:B6CD  66ff76e4             push dword ptr [bp - 0x1c]
5:B6D1  8d46de               lea ax, [bp - 0x22]
5:B6D4  16                   push ss
5:B6D5  50                   push ax
5:B6D6  66ff7606             push dword ptr [bp + 6]
5:B6DA  90                   nop
5:B6DB  0e                   push cs
5:B6DC  e8e5f8               call 0xafc4  ; sub_s5:AFC4
5:B6DF  8946d6               mov word ptr [bp - 0x2a], ax
5:B6E2  0bc0                 or ax, ax
5:B6E4  0f847c01             je 0xb864
5:B6E8  8b46dc               mov ax, word ptr [bp - 0x24]
5:B6EB  2d0200               sub ax, 2
5:B6EE  50                   push ax
5:B6EF  8b46da               mov ax, word ptr [bp - 0x26]
5:B6F2  2d0200               sub ax, 2
5:B6F5  50                   push ax
5:B6F6  ff76d8               push word ptr [bp - 0x28]
5:B6F9  8d46de               lea ax, [bp - 0x22]
5:B6FC  16                   push ss
5:B6FD  50                   push ax
5:B6FE  9a763e37b7           lcall 0xb737, 0x3e76  ; sub_s2:3E76
5:B703  66ff76e4             push dword ptr [bp - 0x1c]
5:B707  8d46de               lea ax, [bp - 0x22]
5:B70A  16                   push ss
5:B70B  50                   push ax
5:B70C  66ff7606             push dword ptr [bp + 6]
5:B710  90                   nop
5:B711  0e                   push cs
5:B712  e8aff8               call 0xafc4  ; sub_s5:AFC4
5:B715  8946d6               mov word ptr [bp - 0x2a], ax
5:B718  0bc0                 or ax, ax
5:B71A  0f844601             je 0xb864
5:B71E  8b46dc               mov ax, word ptr [bp - 0x24]
5:B721  2d0200               sub ax, 2
5:B724  50                   push ax
5:B725  8b46da               mov ax, word ptr [bp - 0x26]
5:B728  050200               add ax, 2
5:B72B  50                   push ax
5:B72C  ff76d8               push word ptr [bp - 0x28]
5:B72F  8d46de               lea ax, [bp - 0x22]
5:B732  16                   push ss
5:B733  50                   push ax
5:B734  9a763e6db7           lcall 0xb76d, 0x3e76  ; sub_s2:3E76
5:B739  66ff76e4             push dword ptr [bp - 0x1c]
5:B73D  8d46de               lea ax, [bp - 0x22]
5:B740  16                   push ss
5:B741  50                   push ax
5:B742  66ff7606             push dword ptr [bp + 6]
5:B746  90                   nop
5:B747  0e                   push cs
5:B748  e879f8               call 0xafc4  ; sub_s5:AFC4
5:B74B  8946d6               mov word ptr [bp - 0x2a], ax
5:B74E  0bc0                 or ax, ax
5:B750  0f841001             je 0xb864
5:B754  8b46dc               mov ax, word ptr [bp - 0x24]
5:B757  050200               add ax, 2
5:B75A  50                   push ax
5:B75B  8b46da               mov ax, word ptr [bp - 0x26]
5:B75E  2d0200               sub ax, 2
5:B761  50                   push ax
5:B762  ff76d8               push word ptr [bp - 0x28]
5:B765  8d46de               lea ax, [bp - 0x22]
5:B768  16                   push ss
5:B769  50                   push ax
5:B76A  9a763ea3b7           lcall 0xb7a3, 0x3e76  ; sub_s2:3E76
5:B76F  66ff76e4             push dword ptr [bp - 0x1c]
5:B773  8d46de               lea ax, [bp - 0x22]
5:B776  16                   push ss
5:B777  50                   push ax
5:B778  66ff7606             push dword ptr [bp + 6]
5:B77C  90                   nop
5:B77D  0e                   push cs
5:B77E  e843f8               call 0xafc4  ; sub_s5:AFC4
5:B781  8946d6               mov word ptr [bp - 0x2a], ax
5:B784  0bc0                 or ax, ax
5:B786  0f84da00             je 0xb864
5:B78A  8b46dc               mov ax, word ptr [bp - 0x24]
5:B78D  050200               add ax, 2
5:B790  50                   push ax
5:B791  8b46da               mov ax, word ptr [bp - 0x26]
5:B794  050200               add ax, 2
5:B797  50                   push ax
5:B798  ff76d8               push word ptr [bp - 0x28]
5:B79B  8d46de               lea ax, [bp - 0x22]
5:B79E  16                   push ss
5:B79F  50                   push ax
5:B7A0  9a763ed7b7           lcall 0xb7d7, 0x3e76  ; sub_s2:3E76
5:B7A5  66ff76e4             push dword ptr [bp - 0x1c]
5:B7A9  8d46de               lea ax, [bp - 0x22]
5:B7AC  16                   push ss
5:B7AD  50                   push ax
5:B7AE  66ff7606             push dword ptr [bp + 6]
5:B7B2  90                   nop
5:B7B3  0e                   push cs
5:B7B4  e80df8               call 0xafc4  ; sub_s5:AFC4
5:B7B7  8946d6               mov word ptr [bp - 0x2a], ax
5:B7BA  0bc0                 or ax, ax
5:B7BC  0f84a400             je 0xb864
5:B7C0  8b46dc               mov ax, word ptr [bp - 0x24]
5:B7C3  050200               add ax, 2
5:B7C6  50                   push ax
5:B7C7  8b46da               mov ax, word ptr [bp - 0x26]
5:B7CA  48                   dec ax
5:B7CB  50                   push ax
5:B7CC  ff76d8               push word ptr [bp - 0x28]
5:B7CF  8d46de               lea ax, [bp - 0x22]
5:B7D2  16                   push ss
5:B7D3  50                   push ax
5:B7D4  9a763e09b8           lcall 0xb809, 0x3e76  ; sub_s2:3E76
5:B7D9  66ff76e4             push dword ptr [bp - 0x1c]
5:B7DD  8d46de               lea ax, [bp - 0x22]
5:B7E0  16                   push ss
5:B7E1  50                   push ax
5:B7E2  66ff7606             push dword ptr [bp + 6]
5:B7E6  90                   nop
5:B7E7  0e                   push cs
5:B7E8  e8d9f7               call 0xafc4  ; sub_s5:AFC4
5:B7EB  8946d6               mov word ptr [bp - 0x2a], ax
5:B7EE  0bc0                 or ax, ax
5:B7F0  7472                 je 0xb864
5:B7F2  8b46dc               mov ax, word ptr [bp - 0x24]
5:B7F5  050300               add ax, 3
5:B7F8  50                   push ax
5:B7F9  8b46da               mov ax, word ptr [bp - 0x26]
5:B7FC  48                   dec ax
5:B7FD  50                   push ax
5:B7FE  ff76d8               push word ptr [bp - 0x28]
5:B801  8d46de               lea ax, [bp - 0x22]
5:B804  16                   push ss
5:B805  50                   push ax
5:B806  9a763e42b3           lcall 0xb342, 0x3e76  ; sub_s2:3E76
5:B80B  66ff76e4             push dword ptr [bp - 0x1c]
5:B80F  8d46de               lea ax, [bp - 0x22]
5:B812  16                   push ss
5:B813  50                   push ax
5:B814  66ff7606             push dword ptr [bp + 6]
5:B818  90                   nop
5:B819  0e                   push cs
5:B81A  e8a7f7               call 0xafc4  ; sub_s5:AFC4
5:B81D  8946d6               mov word ptr [bp - 0x2a], ax
5:B820  0bc0                 or ax, ax
5:B822  7440                 je 0xb864
5:B824  c746d40300           mov word ptr [bp - 0x2c], 3
5:B829  eb04                 jmp 0xb82f
5:B82B  db 90
loc_B82C:
5:B82C  ff46d4               inc word ptr [bp - 0x2c]
loc_B82F:
5:B82F  837ed40a             cmp word ptr [bp - 0x2c], 0xa
5:B833  7d35                 jge 0xb86a
5:B835  ff76dc               push word ptr [bp - 0x24]
5:B838  8b46da               mov ax, word ptr [bp - 0x26]
5:B83B  2b46d4               sub ax, word ptr [bp - 0x2c]
5:B83E  50                   push ax
5:B83F  6a00                 push 0
5:B841  8d46de               lea ax, [bp - 0x22]
5:B844  16                   push ss
5:B845  50                   push ax
5:B846  9a763e03b5           lcall 0xb503, 0x3e76  ; sub_s2:3E76
5:B84B  66ff76e4             push dword ptr [bp - 0x1c]
5:B84F  8d46de               lea ax, [bp - 0x22]
5:B852  16                   push ss
5:B853  50                   push ax
5:B854  66ff7606             push dword ptr [bp + 6]
5:B858  90                   nop
5:B859  0e                   push cs
5:B85A  e867f7               call 0xafc4  ; sub_s5:AFC4
5:B85D  8946d6               mov word ptr [bp - 0x2a], ax
5:B860  0bc0                 or ax, ax
5:B862  75c8                 jne 0xb82c
loc_B864:
5:B864  8946c4               mov word ptr [bp - 0x3c], ax
5:B867  e991fc               jmp 0xb4fb
loc_B86A:
5:B86A  c746c40100           mov word ptr [bp - 0x3c], 1
5:B86F  e989fc               jmp 0xb4fb

; ---------------- sub_s5:B872 FAR size=268 callers=1
5:B872  c8480100             enter 0x148, 0
5:B876  57                   push di
5:B877  56                   push si
5:B878  66ff760a             push dword ptr [bp + 0xa]
5:B87C  9a5c5b5fb9           lcall 0xb95f, 0x5b5c  ; sub_s7:5B5C
5:B881  1e                   push ds
5:B882  8d7efa               lea di, [bp - 6]
5:B885  8bf0                 mov si, ax
5:B887  16                   push ss
5:B888  07                   pop es
5:B889  8eda                 mov ds, dx
5:B88B  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:B88D  a5                   movsw word ptr es:[di], word ptr [si]
5:B88E  1f                   pop ds
5:B88F  8d46fa               lea ax, [bp - 6]
5:B892  8986cafe             mov word ptr [bp - 0x136], ax
5:B896  8d46f8               lea ax, [bp - 8]
5:B899  16                   push ss
5:B89A  50                   push ax
5:B89B  8d4ef6               lea cx, [bp - 0xa]
5:B89E  16                   push ss
5:B89F  51                   push cx
5:B8A0  8d56fa               lea dx, [bp - 6]
5:B8A3  16                   push ss
5:B8A4  52                   push dx
5:B8A5  9a943eb6b8           lcall 0xb8b6, 0x3e94  ; sub_s2:3E94
5:B8AA  8b46f8               mov ax, word ptr [bp - 8]
5:B8AD  2d0a00               sub ax, 0xa
5:B8B0  50                   push ax
5:B8B1  6a0a                 push 0xa
5:B8B3  9a2e61c8b8           lcall 0xb8c8, 0x612e  ; sub_s2:612E
5:B8B8  83c404               add sp, 4
5:B8BB  50                   push ax
5:B8BC  8b46f6               mov ax, word ptr [bp - 0xa]
5:B8BF  2d0a00               sub ax, 0xa
5:B8C2  50                   push ax
5:B8C3  6a0a                 push 0xa
5:B8C5  9a2e61d8b8           lcall 0xb8d8, 0x612e  ; sub_s2:612E
5:B8CA  83c404               add sp, 4
5:B8CD  50                   push ax
5:B8CE  6a00                 push 0
5:B8D0  8d46f0               lea ax, [bp - 0x10]
5:B8D3  16                   push ss
5:B8D4  50                   push ax
5:B8D5  9a543ee8b8           lcall 0xb8e8, 0x3e54  ; sub_s2:3E54
5:B8DA  eb38                 jmp 0xb914
loc_B8DC:
5:B8DC  8b46f8               mov ax, word ptr [bp - 8]
5:B8DF  2d0a00               sub ax, 0xa
5:B8E2  50                   push ax
5:B8E3  6a0a                 push 0xa
5:B8E5  9a2e61feb8           lcall 0xb8fe, 0x612e  ; sub_s2:612E
5:B8EA  83c404               add sp, 4
5:B8ED  8986cafe             mov word ptr [bp - 0x136], ax
5:B8F1  50                   push ax
5:B8F2  8b46f6               mov ax, word ptr [bp - 0xa]
5:B8F5  2d0a00               sub ax, 0xa
5:B8F8  50                   push ax
5:B8F9  6a0a                 push 0xa
5:B8FB  9a2e6112b9           lcall 0xb912, 0x612e  ; sub_s2:612E
5:B900  83c404               add sp, 4
5:B903  8986c8fe             mov word ptr [bp - 0x138], ax
5:B907  50                   push ax
5:B908  6a00                 push 0
5:B90A  8d46f0               lea ax, [bp - 0x10]
5:B90D  16                   push ss
5:B90E  50                   push ax
5:B90F  9a763e76b9           lcall 0xb976, 0x3e76  ; sub_s2:3E76
loc_B914:
5:B914  66ff760a             push dword ptr [bp + 0xa]
5:B918  8d46f0               lea ax, [bp - 0x10]
5:B91B  16                   push ss
5:B91C  50                   push ax
5:B91D  66ff7606             push dword ptr [bp + 6]
5:B921  90                   nop
5:B922  0e                   push cs
5:B923  e85cfb               call 0xb482  ; sub_s5:B482
5:B926  0bc0                 or ax, ax
5:B928  74b2                 je 0xb8dc
5:B92A  c45e0a               les bx, ptr [bp + 0xa]
5:B92D  6626ff7704           push dword ptr es:[bx + 4]
5:B932  666a00               push 0
5:B935  666802000008         push 0x8000002
5:B93B  8d46f0               lea ax, [bp - 0x10]
5:B93E  16                   push ss
5:B93F  50                   push ax
5:B940  666800000a00         push 0xa0000
5:B946  8d86ccfe             lea ax, [bp - 0x134]
5:B94A  16                   push ss
5:B94B  50                   push ax
5:B94C  9a8888a2b4           lcall 0xb4a2, 0x8888  ; SCInternalPutBldg2@s6:8888
5:B951  8d86ccfe             lea ax, [bp - 0x134]
5:B955  16                   push ss
5:B956  50                   push ax
5:B957  66ff364857           push dword ptr [0x5748]  ; g_sim
5:B95C  9a5a8390b4           lcall 0xb490, 0x835a  ; Sim::enqueue@s7:835A
5:B961  6a01                 push 1
5:B963  66ff7606             push dword ptr [bp + 6]
5:B967  90                   nop
5:B968  0e                   push cs
5:B969  e81200               call 0xb97e  ; sub_s5:B97E
5:B96C  c786ccfe9a38         mov word ptr [bp - 0x134], 0x389a
5:B972  c786cefe49b8         mov word ptr [bp - 0x132], 0xb849  ; SEGMENT s2:0000
5:B978  5e                   pop si
5:B979  5f                   pop di
5:B97A  c9                   leave
5:B97B  ca0800               retf 8

; ---------------- sub_s5:B97E FAR size=192 callers=2
5:B97E  c8140000             enter 0x14, 0
5:B982  666802000004         push 0x4000002
5:B988  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B98D  9aece1b0b9           lcall 0xb9b0, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B992  a3704e               mov word ptr [0x4e70], ax
5:B995  8916724e             mov word ptr [0x4e72], dx
5:B999  c41e704e             les bx, ptr [0x4e70]
5:B99D  66268b4710           mov eax, dword ptr es:[bx + 0x10]
5:B9A2  668946fc             mov dword ptr [bp - 4], eax
5:B9A6  6650                 push eax
5:B9A8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:B9AD  9aece14fb9           lcall 0xb94f, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:B9B2  8946f8               mov word ptr [bp - 8], ax
5:B9B5  8956fa               mov word ptr [bp - 6], dx
5:B9B8  050c00               add ax, 0xc
5:B9BB  52                   push dx
5:B9BC  50                   push ax
5:B9BD  68d3b9               push 0xb9d3  ; SEGMENT s10:0000
5:B9C0  683042               push 0x4230
5:B9C3  9a623fdbb9           lcall 0xb9db, 0x3f62  ; sub_s2:3F62
5:B9C8  8d4ef6               lea cx, [bp - 0xa]
5:B9CB  16                   push ss
5:B9CC  51                   push cx
5:B9CD  8d56f4               lea dx, [bp - 0xc]
5:B9D0  16                   push ss
5:B9D1  52                   push dx
5:B9D2  68f0b9               push 0xb9f0  ; SEGMENT s10:0000
5:B9D5  683042               push 0x4230
5:B9D8  9a943ef8b9           lcall 0xb9f8, 0x3e94  ; sub_s2:3E94
5:B9DD  837e0a00             cmp word ptr [bp + 0xa], 0
5:B9E1  752c                 jne 0xba0f
5:B9E3  8b46f6               mov ax, word ptr [bp - 0xa]
5:B9E6  48                   dec ax
5:B9E7  50                   push ax
5:B9E8  8b46f4               mov ax, word ptr [bp - 0xc]
5:B9EB  40                   inc ax
5:B9EC  50                   push ax
5:B9ED  6a00                 push 0
5:B9EF  6805ba               push 0xba05  ; SEGMENT s10:0000
5:B9F2  683042               push 0x4230
5:B9F5  9a763e0dba           lcall 0xba0d, 0x3e76  ; sub_s2:3E76
5:B9FA  8d46f6               lea ax, [bp - 0xa]
5:B9FD  16                   push ss
5:B9FE  50                   push ax
5:B9FF  8d46f4               lea ax, [bp - 0xc]
5:BA02  16                   push ss
5:BA03  50                   push ax
5:BA04  681cba               push 0xba1c  ; SEGMENT s10:0000
5:BA07  683042               push 0x4230
5:BA0A  9a943e24ba           lcall 0xba24, 0x3e94  ; sub_s2:3E94
loc_BA0F:
5:BA0F  ff76f6               push word ptr [bp - 0xa]
5:BA12  8b46f4               mov ax, word ptr [bp - 0xc]
5:BA15  2d0200               sub ax, 2
5:BA18  50                   push ax
5:BA19  6a01                 push 1
5:BA1B  6823b3               push 0xb323  ; SEGMENT s10:0000
5:BA1E  683642               push 0x4236
5:BA21  9a763ea8b8           lcall 0xb8a8, 0x3e76  ; sub_s2:3E76
5:BA26  c9                   leave
5:BA27  ca0600               retf 6
5:BA2A  db 90 0e e8 a5 dc 90 0e e8 f2 e9 cb 00 44 a6 3c ba
5:BA3A  db 5e a6 4e a4

; ---------------- SparseTable::SparseTable@s5:BA3E FAR size=64 callers=10
5:BA3E  55                   push bp
5:BA3F  8bec                 mov bp, sp
5:BA41  c45e06               les bx, ptr [bp + 6]
5:BA44  662bc0               sub eax, eax
5:BA47  66268907             mov dword ptr es:[bx], eax
5:BA4B  26894704             mov word ptr es:[bx + 4], ax
5:BA4F  8b460c               mov ax, word ptr [bp + 0xc]
5:BA52  26894706             mov word ptr es:[bx + 6], ax
5:BA56  8b460a               mov ax, word ptr [bp + 0xa]
5:BA59  26894708             mov word ptr es:[bx + 8], ax
5:BA5D  26837f0601           cmp word ptr es:[bx + 6], 1
5:BA62  7306                 jae 0xba6a
5:BA64  26c747060500         mov word ptr es:[bx + 6], 5
loc_BA6A:
5:BA6A  66ff7606             push dword ptr [bp + 6]
5:BA6E  90                   nop
5:BA6F  0e                   push cs
5:BA70  e85102               call 0xbcc4  ; sub_s5:BCC4
5:BA73  8b4606               mov ax, word ptr [bp + 6]
5:BA76  8b5608               mov dx, word ptr [bp + 8]
5:BA79  c9                   leave
5:BA7A  ca0800               retf 8
5:BA7D  db 00

; ---------------- sub_s5:BA7E FAR size=22 callers=11
5:BA7E  c8080000             enter 8, 0
5:BA82  c45e06               les bx, ptr [bp + 6]
5:BA85  66268b0f             mov ecx, dword ptr es:[bx]
5:BA89  6651                 push ecx
5:BA8B  9ace17bb96           lcall 0x96bb, 0x17ce  ; operator_delete@s1:17CE
5:BA90  c9                   leave
5:BA91  ca0400               retf 4

; ---------------- sub_s5:BA94 FAR size=82 callers=6
5:BA94  c8060000             enter 6, 0
5:BA98  56                   push si
5:BA99  c45e06               les bx, ptr [bp + 6]
5:BA9C  6626833f00           cmp dword ptr es:[bx], 0
5:BAA1  7509                 jne 0xbaac
5:BAA3  33c0                 xor ax, ax
5:BAA5  99                   cdq
5:BAA6  5e                   pop si
5:BAA7  c9                   leave
5:BAA8  ca0400               retf 4
5:BAAB  db 90
loc_BAAC:
5:BAAC  662bc0               sub eax, eax
5:BAAF  668946fc             mov dword ptr [bp - 4], eax
5:BAB3  8946fa               mov word ptr [bp - 6], ax
5:BAB6  eb16                 jmp 0xbace
loc_BAB8:
5:BAB8  8bf0                 mov si, ax
5:BABA  03f0                 add si, ax
5:BABC  03f0                 add si, ax
5:BABE  03f6                 add si, si
5:BAC0  26c41f               les bx, ptr es:[bx]
5:BAC3  66268b00             mov eax, dword ptr es:[bx + si]
5:BAC7  660146fc             add dword ptr [bp - 4], eax
5:BACB  ff46fa               inc word ptr [bp - 6]
loc_BACE:
5:BACE  8b46fa               mov ax, word ptr [bp - 6]
5:BAD1  c45e06               les bx, ptr [bp + 6]
5:BAD4  26394704             cmp word ptr es:[bx + 4], ax
5:BAD8  77de                 ja 0xbab8
5:BADA  8b46fc               mov ax, word ptr [bp - 4]
5:BADD  8b56fe               mov dx, word ptr [bp - 2]
5:BAE0  5e                   pop si
5:BAE1  c9                   leave
5:BAE2  ca0400               retf 4
5:BAE5  db 00

; ---------------- SparseTable::get@s5:BAE6 FAR size=48 callers=9
5:BAE6  c8040000             enter 4, 0
5:BAEA  66ff7608             push dword ptr [bp + 8]
5:BAEE  ff7606               push word ptr [bp + 6]
5:BAF1  90                   nop
5:BAF2  0e                   push cs
5:BAF3  e89c01               call 0xbc92  ; SparseTable::find@s5:BC92
5:BAF6  8946fc               mov word ptr [bp - 4], ax
5:BAF9  8956fe               mov word ptr [bp - 2], dx
5:BAFC  0bd0                 or dx, ax
5:BAFE  740e                 je 0xbb0e
5:BB00  c45efc               les bx, ptr [bp - 4]
5:BB03  268b07               mov ax, word ptr es:[bx]
5:BB06  268b5702             mov dx, word ptr es:[bx + 2]
5:BB0A  c9                   leave
5:BB0B  ca0600               retf 6
loc_BB0E:
5:BB0E  33c0                 xor ax, ax
5:BB10  99                   cdq
5:BB11  c9                   leave
5:BB12  ca0600               retf 6
5:BB15  db 00

; ---------------- sub_s5:BB16 FAR size=90 callers=13
5:BB16  55                   push bp
5:BB17  8bec                 mov bp, sp
5:BB19  56                   push si
5:BB1A  8b4612               mov ax, word ptr [bp + 0x12]
5:BB1D  c45e06               les bx, ptr [bp + 6]
5:BB20  26394704             cmp word ptr es:[bx + 4], ax
5:BB24  7318                 jae 0xbb3e
5:BB26  c45e0e               les bx, ptr [bp + 0xe]
5:BB29  26c7070000           mov word ptr es:[bx], 0
5:BB2E  c45e0a               les bx, ptr [bp + 0xa]
5:BB31  6626c70700000000     mov dword ptr es:[bx], 0
5:BB39  5e                   pop si
5:BB3A  c9                   leave
5:BB3B  ca0e00               retf 0xe
loc_BB3E:
5:BB3E  8bd8                 mov bx, ax
5:BB40  03d8                 add bx, ax
5:BB42  03d8                 add bx, ax
5:BB44  03db                 add bx, bx
5:BB46  8b7606               mov si, word ptr [bp + 6]
5:BB49  26c434               les si, ptr es:[si]
5:BB4C  268b4004             mov ax, word ptr es:[bx + si + 4]
5:BB50  c4760e               les si, ptr [bp + 0xe]
5:BB53  268904               mov word ptr es:[si], ax
5:BB56  c47606               les si, ptr [bp + 6]
5:BB59  8bc3                 mov ax, bx
5:BB5B  26c41c               les bx, ptr es:[si]
5:BB5E  8bf0                 mov si, ax
5:BB60  66268b00             mov eax, dword ptr es:[bx + si]
5:BB64  c45e0a               les bx, ptr [bp + 0xa]
5:BB67  66268907             mov dword ptr es:[bx], eax
5:BB6B  5e                   pop si
5:BB6C  c9                   leave
5:BB6D  ca0e00               retf 0xe

; ---------------- sub_s5:BB70 FAR size=26 callers=3
5:BB70  55                   push bp
5:BB71  8bec                 mov bp, sp
5:BB73  66ff760c             push dword ptr [bp + 0xc]
5:BB77  ff760a               push word ptr [bp + 0xa]
5:BB7A  6a01                 push 1
5:BB7C  66ff7606             push dword ptr [bp + 6]
5:BB80  90                   nop
5:BB81  0e                   push cs
5:BB82  e81f00               call 0xbba4  ; SparseTable::write(mode0=set,1=add)@s5:BBA4
5:BB85  c9                   leave
5:BB86  ca0a00               retf 0xa
5:BB89  db 00

; ---------------- SparseTable::set@s5:BB8A FAR size=26 callers=9
5:BB8A  55                   push bp
5:BB8B  8bec                 mov bp, sp
5:BB8D  66ff760c             push dword ptr [bp + 0xc]
5:BB91  ff760a               push word ptr [bp + 0xa]
5:BB94  6a00                 push 0
5:BB96  66ff7606             push dword ptr [bp + 6]
5:BB9A  90                   nop
5:BB9B  0e                   push cs
5:BB9C  e80500               call 0xbba4  ; SparseTable::write(mode0=set,1=add)@s5:BBA4
5:BB9F  c9                   leave
5:BBA0  ca0a00               retf 0xa
5:BBA3  db 00

; ---------------- SparseTable::write(mode0=set,1=add)@s5:BBA4 FAR size=206 callers=2
5:BBA4  c8040000             enter 4, 0
5:BBA8  ff7610               push word ptr [bp + 0x10]
5:BBAB  66ff7606             push dword ptr [bp + 6]
5:BBAF  90                   nop
5:BBB0  0e                   push cs
5:BBB1  e8de00               call 0xbc92  ; SparseTable::find@s5:BC92
5:BBB4  8946fc               mov word ptr [bp - 4], ax
5:BBB7  8956fe               mov word ptr [bp - 2], dx
5:BBBA  0bd0                 or dx, ax
5:BBBC  7430                 je 0xbbee
5:BBBE  837e0a00             cmp word ptr [bp + 0xa], 0
5:BBC2  7412                 je 0xbbd6
5:BBC4  c45efc               les bx, ptr [bp - 4]
5:BBC7  268b07               mov ax, word ptr es:[bx]
5:BBCA  268b5702             mov dx, word ptr es:[bx + 2]
5:BBCE  03460c               add ax, word ptr [bp + 0xc]
5:BBD1  13560e               adc dx, word ptr [bp + 0xe]
5:BBD4  eb09                 jmp 0xbbdf
loc_BBD6:
5:BBD6  8b460c               mov ax, word ptr [bp + 0xc]
5:BBD9  8b560e               mov dx, word ptr [bp + 0xe]
5:BBDC  c45efc               les bx, ptr [bp - 4]
loc_BBDF:
5:BBDF  268907               mov word ptr es:[bx], ax
5:BBE2  26895702             mov word ptr es:[bx + 2], dx
loc_BBE6:
5:BBE6  b80100               mov ax, 1
5:BBE9  c9                   leave
5:BBEA  ca0c00               retf 0xc
5:BBED  db 90
loc_BBEE:
5:BBEE  6a00                 push 0
5:BBF0  66ff7606             push dword ptr [bp + 6]
5:BBF4  90                   nop
5:BBF5  0e                   push cs
5:BBF6  e89900               call 0xbc92  ; SparseTable::find@s5:BC92
5:BBF9  8946fc               mov word ptr [bp - 4], ax
5:BBFC  8956fe               mov word ptr [bp - 2], dx
5:BBFF  0bd0                 or dx, ax
5:BC01  742b                 je 0xbc2e
5:BC03  8b4610               mov ax, word ptr [bp + 0x10]
5:BC06  c45efc               les bx, ptr [bp - 4]
5:BC09  26894704             mov word ptr es:[bx + 4], ax
5:BC0D  837e0a00             cmp word ptr [bp + 0xa], 0
5:BC11  7549                 jne 0xbc5c
loc_BC13:
5:BC13  8b460c               mov ax, word ptr [bp + 0xc]
5:BC16  8b560e               mov dx, word ptr [bp + 0xe]
5:BC19  c45efc               les bx, ptr [bp - 4]
loc_BC1C:
5:BC1C  268907               mov word ptr es:[bx], ax
5:BC1F  26895702             mov word ptr es:[bx + 2], dx
5:BC23  66ff7606             push dword ptr [bp + 6]
5:BC27  90                   nop
5:BC28  0e                   push cs
5:BC29  e84600               call 0xbc72  ; sub_s5:BC72
5:BC2C  ebb8                 jmp 0xbbe6
loc_BC2E:
5:BC2E  66ff7606             push dword ptr [bp + 6]
5:BC32  90                   nop
5:BC33  0e                   push cs
5:BC34  e88d00               call 0xbcc4  ; sub_s5:BCC4
5:BC37  6a00                 push 0
5:BC39  66ff7606             push dword ptr [bp + 6]
5:BC3D  90                   nop
5:BC3E  0e                   push cs
5:BC3F  e85000               call 0xbc92  ; SparseTable::find@s5:BC92
5:BC42  8946fc               mov word ptr [bp - 4], ax
5:BC45  8956fe               mov word ptr [bp - 2], dx
5:BC48  0bd0                 or dx, ax
5:BC4A  7420                 je 0xbc6c
5:BC4C  8b4610               mov ax, word ptr [bp + 0x10]
5:BC4F  c45efc               les bx, ptr [bp - 4]
5:BC52  26894704             mov word ptr es:[bx + 4], ax
5:BC56  837e0a00             cmp word ptr [bp + 0xa], 0
5:BC5A  74b7                 je 0xbc13
loc_BC5C:
5:BC5C  268b07               mov ax, word ptr es:[bx]
5:BC5F  268b5702             mov dx, word ptr es:[bx + 2]
5:BC63  03460c               add ax, word ptr [bp + 0xc]
5:BC66  13560e               adc dx, word ptr [bp + 0xe]
5:BC69  ebb1                 jmp 0xbc1c
5:BC6B  db 90
loc_BC6C:
5:BC6C  33c0                 xor ax, ax
5:BC6E  c9                   leave
5:BC6F  ca0c00               retf 0xc

; ---------------- sub_s5:BC72 FAR size=32 callers=2
5:BC72  55                   push bp
5:BC73  8bec                 mov bp, sp
5:BC75  6838ba               push 0xba38  ; SEGMENT s5:0000
5:BC78  686cbd               push 0xbd6c
5:BC7B  6a06                 push 6
5:BC7D  c45e06               les bx, ptr [bp + 6]
5:BC80  6626ff7702           push dword ptr es:[bx + 2]
5:BC85  26ff37               push word ptr es:[bx]
5:BC88  9aea4a8eba           lcall 0xba8e, 0x4aea  ; sub_s1:4AEA
5:BC8D  c9                   leave
5:BC8E  ca0400               retf 4
5:BC91  db 00

; ---------------- SparseTable::find@s5:BC92 FAR size=50 callers=2
5:BC92  c80a0000             enter 0xa, 0
5:BC96  8b460a               mov ax, word ptr [bp + 0xa]
5:BC99  8946fa               mov word ptr [bp - 6], ax
5:BC9C  6876bc               push 0xbc76  ; SEGMENT s5:0000
5:BC9F  686cbd               push 0xbd6c
5:BCA2  6a06                 push 6
5:BCA4  c45e06               les bx, ptr [bp + 6]
5:BCA7  6626ff7702           push dword ptr es:[bx + 2]
5:BCAC  26ff37               push word ptr es:[bx]
5:BCAF  8d46f6               lea ax, [bp - 0xa]
5:BCB2  16                   push ss
5:BCB3  50                   push ax
5:BCB4  9ac6498bbc           lcall 0xbc8b, 0x49c6  ; sub_s1:49C6
5:BCB9  8946fc               mov word ptr [bp - 4], ax
5:BCBC  8956fe               mov word ptr [bp - 2], dx
5:BCBF  c9                   leave
5:BCC0  ca0600               retf 6
5:BCC3  db 00

; ---------------- sub_s5:BCC4 FAR size=188 callers=2
5:BCC4  c8180000             enter 0x18, 0
5:BCC8  c45e06               les bx, ptr [bp + 6]
5:BCCB  26837f0400           cmp word ptr es:[bx + 4], 0
5:BCD0  740e                 je 0xbce0
5:BCD2  2bd2                 sub dx, dx
5:BCD4  268b4704             mov ax, word ptr es:[bx + 4]
5:BCD8  26034708             add ax, word ptr es:[bx + 8]
5:BCDC  13d2                 adc dx, dx
5:BCDE  eb06                 jmp 0xbce6
loc_BCE0:
5:BCE0  2bd2                 sub dx, dx
5:BCE2  268b4706             mov ax, word ptr es:[bx + 6]
loc_BCE6:
5:BCE6  0bd2                 or dx, dx
5:BCE8  7c02                 jl 0xbcec
5:BCEA  7f7b                 jg 0xbd67
loc_BCEC:
5:BCEC  8946fa               mov word ptr [bp - 6], ax
5:BCEF  6626833f00           cmp dword ptr es:[bx], 0
5:BCF4  741a                 je 0xbd10
5:BCF6  6626ff37             push dword ptr es:[bx]
5:BCFA  8bc8                 mov cx, ax
5:BCFC  03c0                 add ax, ax
5:BCFE  03c1                 add ax, cx
5:BD00  03c0                 add ax, ax
5:BD02  2bd2                 sub dx, dx
5:BD04  52                   push dx
5:BD05  50                   push ax
5:BD06  6a01                 push 1
5:BD08  9ad40e25bd           lcall 0xbd25, 0xed4  ; sub_s1:0ED4
5:BD0D  eb32                 jmp 0xbd41
5:BD0F  db 90
loc_BD10:
5:BD10  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
5:BD16  740a                 je 0xbd22
5:BD18  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
5:BD1B  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
5:BD1F  eb06                 jmp 0xbd27
5:BD21  db 90
loc_BD22:
5:BD22  9a0a163cbd           lcall 0xbd3c, 0x160a  ; SH_DefaultPool@s1:160A
loc_BD27:
5:BD27  52                   push dx
5:BD28  50                   push ax
5:BD29  6a01                 push 1
5:BD2B  8b46fa               mov ax, word ptr [bp - 6]
5:BD2E  8bc8                 mov cx, ax
5:BD30  03c0                 add ax, ax
5:BD32  03c1                 add ax, cx
5:BD34  03c0                 add ax, ax
5:BD36  6a00                 push 0
5:BD38  50                   push ax
5:BD39  9a0817b7bc           lcall 0xbcb7, 0x1708  ; SH_MemAllocPtr@s1:1708
5:BD3E  83c40a               add sp, 0xa
loc_BD41:
5:BD41  8946f6               mov word ptr [bp - 0xa], ax
5:BD44  8956f8               mov word ptr [bp - 8], dx
5:BD47  8bc2                 mov ax, dx
5:BD49  0b46f6               or ax, word ptr [bp - 0xa]
5:BD4C  7419                 je 0xbd67
5:BD4E  8b46fa               mov ax, word ptr [bp - 6]
5:BD51  c45e06               les bx, ptr [bp + 6]
5:BD54  26894704             mov word ptr es:[bx + 4], ax
5:BD58  668b46f6             mov eax, dword ptr [bp - 0xa]
5:BD5C  66268907             mov dword ptr es:[bx], eax
5:BD60  06                   push es
5:BD61  53                   push bx
5:BD62  90                   nop
5:BD63  0e                   push cs
5:BD64  e80bff               call 0xbc72  ; sub_s5:BC72
loc_BD67:
5:BD67  c9                   leave
5:BD68  ca0400               retf 4
5:BD6B  db 00 c8 08 00 00 c4 5e 06 26 8b 47 04 c4 5e 0a 26
5:BD7B  db 2b 47 04 c9 cb

; ---------------- sub_s5:BD80 FAR size=842 callers=10
5:BD80  c8040000             enter 4, 0
5:BD84  8b4606               mov ax, word ptr [bp + 6]
5:BD87  e91802               jmp 0xbfa2
loc_BD8A:
5:BD8A  682804               push 0x428
5:BD8D  eb0a                 jmp 0xbd99
5:BD8F  db 90
loc_BD90:
5:BD90  682604               push 0x426
5:BD93  eb04                 jmp 0xbd99
5:BD95  db 90
loc_BD96:
5:BD96  682704               push 0x427
loc_BD99:
5:BD99  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:BD9E  9a7e84edac           lcall 0xaced, 0x847e  ; LoadStringRes@s3:847E
5:BDA3  8946fc               mov word ptr [bp - 4], ax
5:BDA6  8956fe               mov word ptr [bp - 2], dx
5:BDA9  e91603               jmp 0xc0c2
loc_BDAC:
5:BDAC  682904               push 0x429
5:BDAF  ebe8                 jmp 0xbd99
5:BDB1  db 90
loc_BDB2:
5:BDB2  682504               push 0x425
5:BDB5  ebe2                 jmp 0xbd99
5:BDB7  db 90
loc_BDB8:
5:BDB8  68f605               push 0x5f6
5:BDBB  ebdc                 jmp 0xbd99
5:BDBD  db 90
loc_BDBE:
5:BDBE  68f705               push 0x5f7
5:BDC1  ebd6                 jmp 0xbd99
5:BDC3  db 90
loc_BDC4:
5:BDC4  680204               push 0x402
5:BDC7  ebd0                 jmp 0xbd99
5:BDC9  db 90
loc_BDCA:
5:BDCA  680304               push 0x403
5:BDCD  ebca                 jmp 0xbd99
5:BDCF  db 90
loc_BDD0:
5:BDD0  68f805               push 0x5f8
5:BDD3  ebc4                 jmp 0xbd99
5:BDD5  db 90
loc_BDD6:
5:BDD6  680404               push 0x404
5:BDD9  ebbe                 jmp 0xbd99
5:BDDB  db 90
loc_BDDC:
5:BDDC  680504               push 0x405
5:BDDF  ebb8                 jmp 0xbd99
5:BDE1  db 90
loc_BDE2:
5:BDE2  680604               push 0x406
5:BDE5  ebb2                 jmp 0xbd99
5:BDE7  db 90
loc_BDE8:
5:BDE8  68f905               push 0x5f9
5:BDEB  ebac                 jmp 0xbd99
5:BDED  db 90
loc_BDEE:
5:BDEE  68fa05               push 0x5fa
5:BDF1  eba6                 jmp 0xbd99
5:BDF3  db 90
loc_BDF4:
5:BDF4  68fb05               push 0x5fb
5:BDF7  eba0                 jmp 0xbd99
5:BDF9  db 90
loc_BDFA:
5:BDFA  680804               push 0x408
5:BDFD  eb9a                 jmp 0xbd99
5:BDFF  db 90
loc_BE00:
5:BE00  680904               push 0x409
5:BE03  eb94                 jmp 0xbd99
5:BE05  db 90
loc_BE06:
5:BE06  682c04               push 0x42c
5:BE09  eb8e                 jmp 0xbd99
5:BE0B  db 90
loc_BE0C:
5:BE0C  680a04               push 0x40a
5:BE0F  eb88                 jmp 0xbd99
5:BE11  db 90
loc_BE12:
5:BE12  680b04               push 0x40b
5:BE15  eb82                 jmp 0xbd99
5:BE17  db 90
loc_BE18:
5:BE18  680c04               push 0x40c
5:BE1B  e97bff               jmp 0xbd99
loc_BE1E:
5:BE1E  680d04               push 0x40d
5:BE21  e975ff               jmp 0xbd99
loc_BE24:
5:BE24  680e04               push 0x40e
5:BE27  e96fff               jmp 0xbd99
loc_BE2A:
5:BE2A  680f04               push 0x40f
5:BE2D  e969ff               jmp 0xbd99
loc_BE30:
5:BE30  681004               push 0x410
5:BE33  e963ff               jmp 0xbd99
loc_BE36:
5:BE36  681104               push 0x411
5:BE39  e95dff               jmp 0xbd99
loc_BE3C:
5:BE3C  681c04               push 0x41c
5:BE3F  e957ff               jmp 0xbd99
loc_BE42:
5:BE42  681604               push 0x416
5:BE45  e951ff               jmp 0xbd99
loc_BE48:
5:BE48  682a04               push 0x42a
5:BE4B  e94bff               jmp 0xbd99
loc_BE4E:
5:BE4E  681804               push 0x418
5:BE51  e945ff               jmp 0xbd99
loc_BE54:
5:BE54  68fc05               push 0x5fc
5:BE57  e93fff               jmp 0xbd99
loc_BE5A:
5:BE5A  681904               push 0x419
5:BE5D  e939ff               jmp 0xbd99
loc_BE60:
5:BE60  68fd05               push 0x5fd
5:BE63  e933ff               jmp 0xbd99
loc_BE66:
5:BE66  68fe05               push 0x5fe
5:BE69  e92dff               jmp 0xbd99
loc_BE6C:
5:BE6C  68ff05               push 0x5ff
5:BE6F  e927ff               jmp 0xbd99
loc_BE72:
5:BE72  680006               push 0x600
5:BE75  e921ff               jmp 0xbd99
loc_BE78:
5:BE78  680106               push 0x601
5:BE7B  e91bff               jmp 0xbd99
loc_BE7E:
5:BE7E  680206               push 0x602
5:BE81  e915ff               jmp 0xbd99
loc_BE84:
5:BE84  c746fc7a4e           mov word ptr [bp - 4], 0x4e7a  ; 'bidLRoadConst'
loc_BE89:
5:BE89  8c5efe               mov word ptr [bp - 2], ds
5:BE8C  e93302               jmp 0xc0c2
5:BE8F  db 90
loc_BE90:
5:BE90  c746fc884e           mov word ptr [bp - 4], 0x4e88  ; 'bidRRoadConst'
5:BE95  ebf2                 jmp 0xbe89
5:BE97  db 90
loc_BE98:
5:BE98  c746fc964e           mov word ptr [bp - 4], 0x4e96  ; 'bidXRoadConst'
5:BE9D  ebea                 jmp 0xbe89
5:BE9F  db 90
loc_BEA0:
5:BEA0  682b04               push 0x42b
5:BEA3  e9f3fe               jmp 0xbd99
loc_BEA6:
5:BEA6  682d04               push 0x42d
5:BEA9  e9edfe               jmp 0xbd99
loc_BEAC:
5:BEAC  680406               push 0x604
5:BEAF  e9e7fe               jmp 0xbd99
loc_BEB2:
5:BEB2  680506               push 0x605
5:BEB5  e9e1fe               jmp 0xbd99
loc_BEB8:
5:BEB8  680606               push 0x606
5:BEBB  e9dbfe               jmp 0xbd99
loc_BEBE:
5:BEBE  681a04               push 0x41a
5:BEC1  e9d5fe               jmp 0xbd99
loc_BEC4:
5:BEC4  681b04               push 0x41b
5:BEC7  e9cffe               jmp 0xbd99
loc_BECA:
5:BECA  681d04               push 0x41d
5:BECD  e9c9fe               jmp 0xbd99
loc_BED0:
5:BED0  681e04               push 0x41e
5:BED3  e9c3fe               jmp 0xbd99
loc_BED6:
5:BED6  681f04               push 0x41f
5:BED9  e9bdfe               jmp 0xbd99
loc_BEDC:
5:BEDC  682104               push 0x421
5:BEDF  e9b7fe               jmp 0xbd99
loc_BEE2:
5:BEE2  682004               push 0x420
5:BEE5  e9b1fe               jmp 0xbd99
loc_BEE8:
5:BEE8  680706               push 0x607
5:BEEB  e9abfe               jmp 0xbd99
loc_BEEE:
5:BEEE  680806               push 0x608
5:BEF1  e9a5fe               jmp 0xbd99
loc_BEF4:
5:BEF4  680906               push 0x609
5:BEF7  e99ffe               jmp 0xbd99
loc_BEFA:
5:BEFA  682204               push 0x422
5:BEFD  e999fe               jmp 0xbd99
loc_BF00:
5:BF00  682304               push 0x423
5:BF03  e993fe               jmp 0xbd99
loc_BF06:
5:BF06  680a06               push 0x60a
5:BF09  e98dfe               jmp 0xbd99
loc_BF0C:
5:BF0C  680b06               push 0x60b
5:BF0F  e987fe               jmp 0xbd99
loc_BF12:
5:BF12  680c06               push 0x60c
5:BF15  e981fe               jmp 0xbd99
loc_BF18:
5:BF18  680d06               push 0x60d
5:BF1B  e97bfe               jmp 0xbd99
loc_BF1E:
5:BF1E  680306               push 0x603
5:BF21  e975fe               jmp 0xbd99
loc_BF24:
5:BF24  681504               push 0x415
5:BF27  e96ffe               jmp 0xbd99
loc_BF2A:
5:BF2A  681204               push 0x412
5:BF2D  e969fe               jmp 0xbd99
loc_BF30:
5:BF30  681304               push 0x413
5:BF33  e963fe               jmp 0xbd99
loc_BF36:
5:BF36  681404               push 0x414
5:BF39  e95dfe               jmp 0xbd99
loc_BF3C:
5:BF3C  680e06               push 0x60e
5:BF3F  e957fe               jmp 0xbd99
loc_BF42:
5:BF42  680f06               push 0x60f
5:BF45  e951fe               jmp 0xbd99
loc_BF48:
5:BF48  681006               push 0x610
5:BF4B  e94bfe               jmp 0xbd99
loc_BF4E:
5:BF4E  681106               push 0x611
5:BF51  e945fe               jmp 0xbd99
loc_BF54:
5:BF54  681206               push 0x612
5:BF57  e93ffe               jmp 0xbd99
loc_BF5A:
5:BF5A  681306               push 0x613
5:BF5D  e939fe               jmp 0xbd99
loc_BF60:
5:BF60  681406               push 0x614
5:BF63  e933fe               jmp 0xbd99
loc_BF66:
5:BF66  681506               push 0x615
5:BF69  e92dfe               jmp 0xbd99
loc_BF6C:
5:BF6C  681606               push 0x616
5:BF6F  e927fe               jmp 0xbd99
loc_BF72:
5:BF72  681706               push 0x617
5:BF75  e921fe               jmp 0xbd99
loc_BF78:
5:BF78  681806               push 0x618
5:BF7B  e91bfe               jmp 0xbd99
loc_BF7E:
5:BF7E  681906               push 0x619
5:BF81  e915fe               jmp 0xbd99
loc_BF84:
5:BF84  681a06               push 0x61a
5:BF87  e90ffe               jmp 0xbd99
loc_BF8A:
5:BF8A  681b06               push 0x61b
5:BF8D  e909fe               jmp 0xbd99
loc_BF90:
5:BF90  681c06               push 0x61c
5:BF93  e903fe               jmp 0xbd99
loc_BF96:
5:BF96  681d06               push 0x61d
5:BF99  e9fdfd               jmp 0xbd99
loc_BF9C:
5:BF9C  682404               push 0x424
5:BF9F  e9f7fd               jmp 0xbd99
loc_BFA2:
5:BFA2  48                   dec ax
5:BFA3  3d8800               cmp ax, 0x88
5:BFA6  77f4                 ja 0xbf9c
5:BFA8  03c0                 add ax, ax
5:BFAA  93                   xchg bx, ax
5:BFAB  2effa7b0bf           jmp word ptr cs:[bx - 0x4050]
switch_table_BFB0:
    dw loc_BD96
    dw loc_BD8A
    dw loc_BDAC
    dw loc_BDB2
    dw loc_BD90
    dw loc_BD96
    dw loc_BDAC
    dw loc_BDB2
    dw loc_BD90
    dw loc_BDC4
    dw loc_BE4E
    dw loc_BE48
    dw loc_BDBE
    dw loc_BDB8
    dw loc_BDCA
    dw loc_BDD0
    dw loc_BDD6
    dw loc_BDDC
    dw loc_BDE2
    dw loc_BDE2
    dw loc_BDE2
    dw loc_BDE8
    dw loc_BDEE
    dw loc_BDF4
    dw loc_BDE8
    dw loc_BDEE
    dw loc_BDFA
    dw loc_BDFA
    dw loc_BDFA
    dw loc_BE00
    dw loc_BE00
    dw loc_BE00
    dw loc_BE06
    dw loc_BE0C
    dw loc_BE0C
    dw loc_BE0C
    dw loc_BE12
    dw loc_BE12
    dw loc_BE12
    dw loc_BE18
    dw loc_BE18
    dw loc_BE1E
    dw loc_BE1E
    dw loc_BE24
    dw loc_BE2A
    dw loc_BE2A
    dw loc_BE30
    dw loc_BE30
    dw loc_BE36
    dw loc_BE36
    dw loc_BE42
    dw loc_BE42
    dw loc_BE48
    dw loc_BE48
    dw loc_BE4E
    dw loc_BE54
    dw loc_BE54
    dw loc_BE5A
    dw loc_BE5A
    dw loc_BE60
    dw loc_BE60
    dw loc_BE66
    dw loc_BE6C
    dw loc_BE72
    dw loc_BE78
    dw loc_BE7E
    dw loc_BE84
    dw loc_BE90
    dw loc_BE98
    dw loc_BE7E
    dw loc_BEA0
    dw loc_BF1E
    dw loc_BF1E
    dw loc_BF1E
    dw loc_BEA6
    dw loc_BEAC
    dw loc_BEB2
    dw loc_BEB8
    dw loc_BEBE
    dw loc_BEBE
    dw loc_BEBE
    dw loc_BEC4
    dw loc_BEC4
    dw loc_BECA
    dw loc_BECA
    dw loc_BECA
    dw loc_BED0
    dw loc_BED0
    dw loc_BED0
    dw loc_BED6
    dw loc_BEDC
    dw loc_BEDC
    dw loc_BEE2
    dw loc_BEE2
    dw loc_BEE2
    dw loc_BEE8
    dw loc_BEE8
    dw loc_BEEE
    dw loc_BEEE
    dw loc_BEF4
    dw loc_BEFA
    dw loc_BF00
    dw loc_BF00
    dw loc_BF06
    dw loc_BF06
    dw loc_BF0C
    dw loc_BE7E
    dw loc_BE3C
    dw loc_BE3C
    dw loc_BF12
    dw loc_BF18
    dw loc_BF1E
    dw loc_BF1E
    dw loc_BF1E
    dw loc_BF24
    dw loc_BF2A
    dw loc_BF30
    dw loc_BF36
    dw loc_BF24
    dw loc_BF2A
    dw loc_BF2A
    dw loc_BF3C
    dw loc_BF42
    dw loc_BF48
    dw loc_BF4E
    dw loc_BF54
    dw loc_BF5A
    dw loc_BF60
    dw loc_BF66
    dw loc_BF6C
    dw loc_BF72
    dw loc_BF78
    dw loc_BF7E
    dw loc_BF84
    dw loc_BF8A
    dw loc_BF90
    dw loc_BF96
loc_C0C2:
5:C0C2  8b46fc               mov ax, word ptr [bp - 4]
5:C0C5  8b56fe               mov dx, word ptr [bp - 2]
5:C0C8  c9                   leave
5:C0C9  cb                   retf

; ---------------- sub_s5:C0CA FAR size=14 callers=2
5:C0CA  55                   push bp
5:C0CB  8bec                 mov bp, sp
5:C0CD  ff7606               push word ptr [bp + 6]
5:C0D0  90                   nop
5:C0D1  0e                   push cs
5:C0D2  e80300               call 0xc0d8  ; ResourceName@s5:C0D8
5:C0D5  c9                   leave
5:C0D6  cb                   retf
5:C0D7  db 00

; ---------------- ResourceName@s5:C0D8 FAR size=330 callers=10
5:C0D8  c8040000             enter 4, 0
5:C0DC  8b4606               mov ax, word ptr [bp + 6]
5:C0DF  e9e200               jmp 0xc1c4
loc_C0E2:
5:C0E2  68b705               push 0x5b7
loc_C0E5:
5:C0E5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:C0EA  9a7e84a1bd           lcall 0xbda1, 0x847e  ; LoadStringRes@s3:847E
5:C0EF  8946fc               mov word ptr [bp - 4], ax
5:C0F2  8956fe               mov word ptr [bp - 2], dx
5:C0F5  e92201               jmp 0xc21a
loc_C0F8:
5:C0F8  68b805               push 0x5b8
5:C0FB  ebe8                 jmp 0xc0e5
5:C0FD  db 90
loc_C0FE:
5:C0FE  68b905               push 0x5b9
5:C101  ebe2                 jmp 0xc0e5
5:C103  db 90
loc_C104:
5:C104  68ba05               push 0x5ba
5:C107  ebdc                 jmp 0xc0e5
5:C109  db 90
loc_C10A:
5:C10A  68bb05               push 0x5bb
5:C10D  ebd6                 jmp 0xc0e5
5:C10F  db 90
loc_C110:
5:C110  68bc05               push 0x5bc
5:C113  ebd0                 jmp 0xc0e5
5:C115  db 90
loc_C116:
5:C116  68bd05               push 0x5bd
5:C119  ebca                 jmp 0xc0e5
5:C11B  db 90
loc_C11C:
5:C11C  68be05               push 0x5be
5:C11F  ebc4                 jmp 0xc0e5
5:C121  db 90
loc_C122:
5:C122  68bf05               push 0x5bf
5:C125  ebbe                 jmp 0xc0e5
5:C127  db 90
loc_C128:
5:C128  68c005               push 0x5c0
5:C12B  ebb8                 jmp 0xc0e5
5:C12D  db 90
loc_C12E:
5:C12E  68c105               push 0x5c1
5:C131  ebb2                 jmp 0xc0e5
5:C133  db 90
loc_C134:
5:C134  68c205               push 0x5c2
5:C137  ebac                 jmp 0xc0e5
5:C139  db 90
loc_C13A:
5:C13A  68c305               push 0x5c3
5:C13D  eba6                 jmp 0xc0e5
5:C13F  db 90
loc_C140:
5:C140  68c405               push 0x5c4
5:C143  eba0                 jmp 0xc0e5
5:C145  db 90
loc_C146:
5:C146  68c505               push 0x5c5
5:C149  eb9a                 jmp 0xc0e5
5:C14B  db 90
loc_C14C:
5:C14C  68c605               push 0x5c6
5:C14F  eb94                 jmp 0xc0e5
5:C151  db 90
loc_C152:
5:C152  68c705               push 0x5c7
5:C155  eb8e                 jmp 0xc0e5
5:C157  db 90
loc_C158:
5:C158  68c805               push 0x5c8
5:C15B  eb88                 jmp 0xc0e5
5:C15D  db 90
loc_C15E:
5:C15E  68c905               push 0x5c9
5:C161  eb82                 jmp 0xc0e5
5:C163  db 90
loc_C164:
5:C164  68ca05               push 0x5ca
5:C167  e97bff               jmp 0xc0e5
loc_C16A:
5:C16A  68cb05               push 0x5cb
5:C16D  e975ff               jmp 0xc0e5
loc_C170:
5:C170  68cc05               push 0x5cc
5:C173  e96fff               jmp 0xc0e5
loc_C176:
5:C176  68cd05               push 0x5cd
5:C179  e969ff               jmp 0xc0e5
loc_C17C:
5:C17C  68ce05               push 0x5ce
5:C17F  e963ff               jmp 0xc0e5
loc_C182:
5:C182  68cf05               push 0x5cf
5:C185  e95dff               jmp 0xc0e5
loc_C188:
5:C188  68d005               push 0x5d0
5:C18B  e957ff               jmp 0xc0e5
loc_C18E:
5:C18E  68d105               push 0x5d1
5:C191  e951ff               jmp 0xc0e5
loc_C194:
5:C194  68d205               push 0x5d2
5:C197  e94bff               jmp 0xc0e5
loc_C19A:
5:C19A  68d305               push 0x5d3
5:C19D  e945ff               jmp 0xc0e5
loc_C1A0:
5:C1A0  68d405               push 0x5d4
5:C1A3  e93fff               jmp 0xc0e5
loc_C1A6:
5:C1A6  68d505               push 0x5d5
5:C1A9  e939ff               jmp 0xc0e5
loc_C1AC:
5:C1AC  68d605               push 0x5d6
5:C1AF  e933ff               jmp 0xc0e5
loc_C1B2:
5:C1B2  68d705               push 0x5d7
5:C1B5  e92dff               jmp 0xc0e5
loc_C1B8:
5:C1B8  68e505               push 0x5e5
5:C1BB  e927ff               jmp 0xc0e5
loc_C1BE:
5:C1BE  68d905               push 0x5d9
5:C1C1  e921ff               jmp 0xc0e5
loc_C1C4:
5:C1C4  48                   dec ax
5:C1C5  3d2300               cmp ax, 0x23
5:C1C8  77f4                 ja 0xc1be
5:C1CA  03c0                 add ax, ax
5:C1CC  93                   xchg bx, ax
5:C1CD  2effa7d2c1           jmp word ptr cs:[bx - 0x3e2e]
switch_table_C1D2:
    dw loc_C0E2
    dw loc_C0F8
    dw loc_C0FE
    dw loc_C104
    dw loc_C10A
    dw loc_C110
    dw loc_C116
    dw loc_C11C
    dw loc_C122
    dw loc_C128
    dw loc_C12E
    dw loc_C134
    dw loc_C13A
    dw loc_C140
    dw loc_C146
    dw loc_C14C
    dw loc_C152
    dw loc_C158
    dw loc_C15E
    dw loc_C164
    dw loc_C16A
    dw loc_C170
    dw loc_C176
    dw loc_C17C
    dw loc_C182
    dw loc_C188
    dw loc_C18E
    dw loc_C194
    dw loc_C19A
    dw loc_C1A0
    dw loc_C1A6
    dw loc_C1BE
    dw loc_C1AC
    dw loc_C1BE
    dw loc_C1B2
    dw loc_C1B8
loc_C21A:
5:C21A  8b46fc               mov ax, word ptr [bp - 4]
5:C21D  8b56fe               mov dx, word ptr [bp - 2]
5:C220  c9                   leave
5:C221  cb                   retf

; ---------------- sub_s5:C222 FAR size=214 callers=9
5:C222  c8040000             enter 4, 0
5:C226  8b4606               mov ax, word ptr [bp + 6]
5:C229  e98e00               jmp 0xc2ba
loc_C22C:
5:C22C  687f05               push 0x57f
loc_C22F:
5:C22F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:C234  9a7e84edc0           lcall 0xc0ed, 0x847e  ; LoadStringRes@s3:847E
5:C239  8946fc               mov word ptr [bp - 4], ax
5:C23C  8956fe               mov word ptr [bp - 2], dx
5:C23F  e9ae00               jmp 0xc2f0
loc_C242:
5:C242  688005               push 0x580
5:C245  ebe8                 jmp 0xc22f
5:C247  db 90
loc_C248:
5:C248  688105               push 0x581
5:C24B  ebe2                 jmp 0xc22f
5:C24D  db 90
loc_C24E:
5:C24E  68e705               push 0x5e7
5:C251  ebdc                 jmp 0xc22f
5:C253  db 90
loc_C254:
5:C254  687e05               push 0x57e
5:C257  ebd6                 jmp 0xc22f
5:C259  db 90
loc_C25A:
5:C25A  688205               push 0x582
5:C25D  ebd0                 jmp 0xc22f
5:C25F  db 90
loc_C260:
5:C260  68e803               push 0x3e8
5:C263  ebca                 jmp 0xc22f
5:C265  db 90
loc_C266:
5:C266  68e903               push 0x3e9
5:C269  ebc4                 jmp 0xc22f
5:C26B  db 90
loc_C26C:
5:C26C  68ea03               push 0x3ea
5:C26F  ebbe                 jmp 0xc22f
5:C271  db 90
loc_C272:
5:C272  68eb03               push 0x3eb
5:C275  ebb8                 jmp 0xc22f
5:C277  db 90
loc_C278:
5:C278  68ec03               push 0x3ec
5:C27B  ebb2                 jmp 0xc22f
5:C27D  db 90
loc_C27E:
5:C27E  68ed03               push 0x3ed
5:C281  ebac                 jmp 0xc22f
5:C283  db 90
loc_C284:
5:C284  68ee03               push 0x3ee
5:C287  eba6                 jmp 0xc22f
5:C289  db 90
loc_C28A:
5:C28A  68ef03               push 0x3ef
5:C28D  eba0                 jmp 0xc22f
5:C28F  db 90
loc_C290:
5:C290  68f003               push 0x3f0
5:C293  eb9a                 jmp 0xc22f
5:C295  db 90
loc_C296:
5:C296  68f103               push 0x3f1
5:C299  eb94                 jmp 0xc22f
5:C29B  db 90
loc_C29C:
5:C29C  68f203               push 0x3f2
5:C29F  eb8e                 jmp 0xc22f
5:C2A1  db 90
loc_C2A2:
5:C2A2  68f403               push 0x3f4
5:C2A5  eb88                 jmp 0xc22f
5:C2A7  db 90
loc_C2A8:
5:C2A8  68f503               push 0x3f5
5:C2AB  eb82                 jmp 0xc22f
5:C2AD  db 90
loc_C2AE:
5:C2AE  683205               push 0x532
5:C2B1  e97bff               jmp 0xc22f
loc_C2B4:
5:C2B4  68d905               push 0x5d9
5:C2B7  e975ff               jmp 0xc22f
loc_C2BA:
5:C2BA  48                   dec ax
5:C2BB  3d1300               cmp ax, 0x13
5:C2BE  77f4                 ja 0xc2b4
5:C2C0  03c0                 add ax, ax
5:C2C2  93                   xchg bx, ax
5:C2C3  2effa7c8c2           jmp word ptr cs:[bx - 0x3d38]
switch_table_C2C8:
    dw loc_C22C
    dw loc_C242
    dw loc_C248
    dw loc_C24E
    dw loc_C254
    dw loc_C25A
    dw loc_C260
    dw loc_C266
    dw loc_C26C
    dw loc_C272
    dw loc_C278
    dw loc_C27E
    dw loc_C284
    dw loc_C28A
    dw loc_C290
    dw loc_C296
    dw loc_C29C
    dw loc_C2A2
    dw loc_C2A8
    dw loc_C2AE
loc_C2F0:
5:C2F0  8b46fc               mov ax, word ptr [bp - 4]
5:C2F3  8b56fe               mov dx, word ptr [bp - 2]
5:C2F6  c9                   leave
5:C2F7  cb                   retf

; ---------------- sub_s5:C2F8 FAR size=182 callers=5
5:C2F8  c8040000             enter 4, 0
5:C2FC  8b4606               mov ax, word ptr [bp + 6]
5:C2FF  eb77                 jmp 0xc378
5:C301  db 90
loc_C302:
5:C302  688305               push 0x583
loc_C305:
5:C305  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
5:C30A  9a7e8437c2           lcall 0xc237, 0x847e  ; LoadStringRes@s3:847E
5:C30F  8946fc               mov word ptr [bp - 4], ax
5:C312  8956fe               mov word ptr [bp - 2], dx
5:C315  e98e00               jmp 0xc3a6
loc_C318:
5:C318  688405               push 0x584
5:C31B  ebe8                 jmp 0xc305
5:C31D  db 90
loc_C31E:
5:C31E  688505               push 0x585
5:C321  ebe2                 jmp 0xc305
5:C323  db 90
loc_C324:
5:C324  688605               push 0x586
5:C327  ebdc                 jmp 0xc305
5:C329  db 90
loc_C32A:
5:C32A  688705               push 0x587
5:C32D  ebd6                 jmp 0xc305
5:C32F  db 90
loc_C330:
5:C330  688805               push 0x588
5:C333  ebd0                 jmp 0xc305
5:C335  db 90
loc_C336:
5:C336  688905               push 0x589
5:C339  ebca                 jmp 0xc305
5:C33B  db 90
loc_C33C:
5:C33C  688a05               push 0x58a
5:C33F  ebc4                 jmp 0xc305
5:C341  db 90
loc_C342:
5:C342  688b05               push 0x58b
5:C345  ebbe                 jmp 0xc305
5:C347  db 90
loc_C348:
5:C348  688c05               push 0x58c
5:C34B  ebb8                 jmp 0xc305
5:C34D  db 90
loc_C34E:
5:C34E  688d05               push 0x58d
5:C351  ebb2                 jmp 0xc305
5:C353  db 90
loc_C354:
5:C354  688e05               push 0x58e
5:C357  ebac                 jmp 0xc305
5:C359  db 90
loc_C35A:
5:C35A  688f05               push 0x58f
5:C35D  eba6                 jmp 0xc305
5:C35F  db 90
loc_C360:
5:C360  68f803               push 0x3f8
5:C363  eba0                 jmp 0xc305
5:C365  db 90
loc_C366:
5:C366  68f903               push 0x3f9
5:C369  eb9a                 jmp 0xc305
5:C36B  db 90
loc_C36C:
5:C36C  683205               push 0x532
5:C36F  eb94                 jmp 0xc305
5:C371  db 90
loc_C372:
5:C372  68d905               push 0x5d9
5:C375  eb8e                 jmp 0xc305
5:C377  db 90
loc_C378:
5:C378  48                   dec ax
5:C379  3d0f00               cmp ax, 0xf
5:C37C  77f4                 ja 0xc372
5:C37E  03c0                 add ax, ax
5:C380  93                   xchg bx, ax
5:C381  2effa786c3           jmp word ptr cs:[bx - 0x3c7a]
switch_table_C386:
    dw loc_C302
    dw loc_C318
    dw loc_C31E
    dw loc_C324
    dw loc_C32A
    dw loc_C330
    dw loc_C336
    dw loc_C33C
    dw loc_C342
    dw loc_C348
    dw loc_C34E
    dw loc_C354
    dw loc_C35A
    dw loc_C360
    dw loc_C366
    dw loc_C36C
loc_C3A6:
5:C3A6  8b46fc               mov ax, word ptr [bp - 4]
5:C3A9  8b56fe               mov dx, word ptr [bp - 2]
5:C3AC  c9                   leave
5:C3AD  cb                   retf

; ---------------- sub_s5:C3AE FAR size=6 callers=2
5:C3AE  b80100               mov ax, 1
5:C3B1  99                   cdq
5:C3B2  cb                   retf
5:C3B3  db 00

; ---------------- sub_s5:C3B4 FAR size=122 callers=7
5:C3B4  c8040000             enter 4, 0
5:C3B8  66c746fc01000000     mov dword ptr [bp - 4], 1
5:C3C0  8b4606               mov ax, word ptr [bp + 6]
5:C3C3  eb2d                 jmp 0xc3f2
5:C3C5  db 90
loc_C3C6:
5:C3C6  c746fc0600           mov word ptr [bp - 4], 6
loc_C3CB:
5:C3CB  c746fe0000           mov word ptr [bp - 2], 0
5:C3D0  eb54                 jmp 0xc426
loc_C3D2:
5:C3D2  c746fc0300           mov word ptr [bp - 4], 3
5:C3D7  ebf2                 jmp 0xc3cb
5:C3D9  db 90
loc_C3DA:
5:C3DA  c746fc0200           mov word ptr [bp - 4], 2
5:C3DF  ebea                 jmp 0xc3cb
5:C3E1  db 90
loc_C3E2:
5:C3E2  c746fc0100           mov word ptr [bp - 4], 1
5:C3E7  ebe2                 jmp 0xc3cb
5:C3E9  db 90
loc_C3EA:
5:C3EA  c746fc0a00           mov word ptr [bp - 4], 0xa
5:C3EF  ebda                 jmp 0xc3cb
5:C3F1  db 90
loc_C3F2:
5:C3F2  48                   dec ax
5:C3F3  3d1200               cmp ax, 0x12
5:C3F6  772e                 ja 0xc426
5:C3F8  03c0                 add ax, ax
5:C3FA  93                   xchg bx, ax
5:C3FB  2effa700c4           jmp word ptr cs:[bx - 0x3c00]
switch_table_C400:
    dw loc_C3D2
    dw loc_C3D2
    dw loc_C3D2
    dw loc_C3C6
    dw loc_C3D2
    dw loc_C3EA
    dw loc_C3DA
    dw loc_C3D2
    dw loc_C3D2
    dw loc_C3D2
    dw loc_C3D2
    dw loc_C3D2
    dw loc_C3E2
    dw loc_C3E2
    dw loc_C3EA
    dw loc_C3EA
    dw loc_C3EA
    dw loc_C3EA
    dw loc_C3EA
loc_C426:
5:C426  8b46fc               mov ax, word ptr [bp - 4]
5:C429  8b56fe               mov dx, word ptr [bp - 2]
5:C42C  c9                   leave
5:C42D  cb                   retf

; ---------------- sub_s5:C42E FAR size=22 callers=7
5:C42E  55                   push bp
5:C42F  8bec                 mov bp, sp
5:C431  837e060f             cmp word ptr [bp + 6], 0xf
5:C435  7507                 jne 0xc43e
5:C437  b80100               mov ax, 1
loc_C43A:
5:C43A  33d2                 xor dx, dx
5:C43C  c9                   leave
5:C43D  cb                   retf
loc_C43E:
5:C43E  b80300               mov ax, 3
5:C441  ebf7                 jmp 0xc43a
5:C443  db 90

; ---------------- sub_s5:C444 FAR size=54 callers=3
5:C444  55                   push bp
5:C445  8bec                 mov bp, sp
5:C447  66ff760e             push dword ptr [bp + 0xe]
5:C44B  66ff760a             push dword ptr [bp + 0xa]
5:C44F  66ff7606             push dword ptr [bp + 6]
5:C453  9ad81c7fb8           lcall 0xb87f, 0x1cd8  ; sub_s7:1CD8
5:C458  c45e06               les bx, ptr [bp + 6]
5:C45B  662bc0               sub eax, eax
5:C45E  6626894718           mov dword ptr es:[bx + 0x18], eax
5:C463  2689471c             mov word ptr es:[bx + 0x1c], ax
5:C467  26c70734c8           mov word ptr es:[bx], 0xc834
5:C46C  26c747029dbc         mov word ptr es:[bx + 2], 0xbc9d  ; SEGMENT s5:0000
5:C472  8bc3                 mov ax, bx
5:C474  8cc2                 mov dx, es
5:C476  c9                   leave
5:C477  ca0c00               retf 0xc

; ---------------- sub_s5:C47A FAR size=46 callers=1
5:C47A  c8080000             enter 8, 0
5:C47E  c45e06               les bx, ptr [bp + 6]
5:C481  26c70734c8           mov word ptr es:[bx], 0xc834
5:C486  26c7470270c4         mov word ptr es:[bx + 2], 0xc470  ; SEGMENT s5:0000
5:C48C  66268b4718           mov eax, dword ptr es:[bx + 0x18]
5:C491  6650                 push eax
5:C493  9ace170bbd           lcall 0xbd0b, 0x17ce  ; operator_delete@s1:17CE
5:C498  83c404               add sp, 4
5:C49B  66ff7606             push dword ptr [bp + 6]
5:C49F  9a281d56c4           lcall 0xc456, 0x1d28  ; sub_s7:1D28
5:C4A4  c9                   leave
5:C4A5  ca0400               retf 4

; ---------------- sub_s5:C4A8 FAR size=76 callers=1
5:C4A8  c8040000             enter 4, 0
5:C4AC  c45e06               les bx, ptr [bp + 6]
5:C4AF  26837f1c00           cmp word ptr es:[bx + 0x1c], 0
5:C4B4  7407                 je 0xc4bd
5:C4B6  06                   push es
5:C4B7  53                   push bx
5:C4B8  90                   nop
5:C4B9  0e                   push cs
5:C4BA  e8e701               call 0xc6a4  ; sub_s5:C6A4
loc_C4BD:
5:C4BD  8b4612               mov ax, word ptr [bp + 0x12]
5:C4C0  8bc8                 mov cx, ax
5:C4C2  03c0                 add ax, ax
5:C4C4  03c1                 add ax, cx
5:C4C6  03c0                 add ax, ax
5:C4C8  c45e06               les bx, ptr [bp + 6]
5:C4CB  26c45f18             les bx, ptr es:[bx + 0x18]
5:C4CF  03d8                 add bx, ax
5:C4D1  895efc               mov word ptr [bp - 4], bx
5:C4D4  8c46fe               mov word ptr [bp - 2], es
5:C4D7  66268b07             mov eax, dword ptr es:[bx]
5:C4DB  c45e0e               les bx, ptr [bp + 0xe]
5:C4DE  66268907             mov dword ptr es:[bx], eax
5:C4E2  c45efc               les bx, ptr [bp - 4]
5:C4E5  268b4704             mov ax, word ptr es:[bx + 4]
5:C4E9  c45e0a               les bx, ptr [bp + 0xa]
5:C4EC  268907               mov word ptr es:[bx], ax
5:C4EF  c9                   leave
5:C4F0  ca1000               retf 0x10
5:C4F3  db 00

; ---------------- sub_s5:C4F4 FAR size=68 callers=1
5:C4F4  c80a0000             enter 0xa, 0
5:C4F8  66ff760e             push dword ptr [bp + 0xe]
5:C4FC  66ff7606             push dword ptr [bp + 6]
5:C500  90                   nop
5:C501  0e                   push cs
5:C502  e8d901               call 0xc6de  ; sub_s5:C6DE
5:C505  8946fc               mov word ptr [bp - 4], ax
5:C508  8956fe               mov word ptr [bp - 2], dx
5:C50B  0bd0                 or dx, ax
5:C50D  7424                 je 0xc533
5:C50F  66ff760e             push dword ptr [bp + 0xe]
5:C513  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:C518  9aece190b9           lcall 0xb990, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:C51D  52                   push dx
5:C51E  50                   push ax
5:C51F  9aa06fa2c4           lcall 0xc4a2, 0x6fa0  ; sub_s7:6FA0
5:C524  8bd8                 mov bx, ax
5:C526  03d8                 add bx, ax
5:C528  8b87a44e             mov ax, word ptr [bx + 0x4ea4]
5:C52C  c45efc               les bx, ptr [bp - 4]
5:C52F  26894704             mov word ptr es:[bx + 4], ax
loc_C533:
5:C533  c9                   leave
5:C534  ca0c00               retf 0xc
5:C537  db 00

; ---------------- sub_s5:C538 FAR size=18 callers=0
5:C538  55                   push bp
5:C539  8bec                 mov bp, sp
5:C53B  c45e06               les bx, ptr [bp + 6]
5:C53E  268b4710             mov ax, word ptr es:[bx + 0x10]
5:C542  268b5712             mov dx, word ptr es:[bx + 0x12]
5:C546  c9                   leave
5:C547  ca0400               retf 4

; ---------------- sub_s5:C54A size=100 callers=0
5:C54A  c8080000             enter 8, 0
5:C54E  56                   push si
5:C54F  c45e06               les bx, ptr [bp + 6]
5:C552  26837f1c00           cmp word ptr es:[bx + 0x1c], 0
5:C557  7407                 je 0xc560
5:C559  06                   push es
5:C55A  53                   push bx
5:C55B  90                   nop
5:C55C  0e                   push cs
5:C55D  e84401               call 0xc6a4  ; sub_s5:C6A4
loc_C560:
5:C560  66c746fc00000000     mov dword ptr [bp - 4], 0
5:C568  c45e06               les bx, ptr [bp + 6]
5:C56B  6626837f1800         cmp dword ptr es:[bx + 0x18], 0
5:C571  742f                 je 0xc5a2
5:C573  668b460a             mov eax, dword ptr [bp + 0xa]
5:C577  6626394710           cmp dword ptr es:[bx + 0x10], eax
5:C57C  7624                 jbe 0xc5a2
5:C57E  8bc8                 mov cx, ax
5:C580  03c0                 add ax, ax
5:C582  03c1                 add ax, cx
5:C584  03c0                 add ax, ax
5:C586  268b4f18             mov cx, word ptr es:[bx + 0x18]
5:C58A  268b571a             mov dx, word ptr es:[bx + 0x1a]
5:C58E  03c8                 add cx, ax
5:C590  8bd9                 mov bx, cx
5:C592  8bf2                 mov si, dx
5:C594  0bd1                 or dx, cx
5:C596  740a                 je 0xc5a2
5:C598  8ec6                 mov es, si
5:C59A  66268b07             mov eax, dword ptr es:[bx]
5:C59E  668946fc             mov dword ptr [bp - 4], eax
loc_C5A2:
5:C5A2  8b46fc               mov ax, word ptr [bp - 4]
5:C5A5  8b56fe               mov dx, word ptr [bp - 2]
5:C5A8  5e                   pop si
5:C5A9  c9                   leave
5:C5AA  ca0800               retf 8
5:C5AD  db 00

; ---------------- sub_s5:C5AE FAR size=6 callers=0
5:C5AE  33c0                 xor ax, ax
5:C5B0  ca0c00               retf 0xc
5:C5B3  db 00

; ---------------- sub_s5:C5B4 FAR size=140 callers=0
5:C5B4  c80a0000             enter 0xa, 0
5:C5B8  56                   push si
5:C5B9  66ff760a             push dword ptr [bp + 0xa]
5:C5BD  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:C5C2  9aece11bc5           lcall 0xc51b, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:C5C7  52                   push dx
5:C5C8  50                   push ax
5:C5C9  9aa06f22c5           lcall 0xc522, 0x6fa0  ; sub_s7:6FA0
5:C5CE  8946fa               mov word ptr [bp - 6], ax
5:C5D1  666a00               push 0
5:C5D4  66ff7606             push dword ptr [bp + 6]
5:C5D8  90                   nop
5:C5D9  0e                   push cs
5:C5DA  e80101               call 0xc6de  ; sub_s5:C6DE
5:C5DD  8946f6               mov word ptr [bp - 0xa], ax
5:C5E0  8956f8               mov word ptr [bp - 8], dx
5:C5E3  0bd0                 or dx, ax
5:C5E5  742f                 je 0xc616
loc_C5E7:
5:C5E7  c45e06               les bx, ptr [bp + 6]
5:C5EA  26c7471c0100         mov word ptr es:[bx + 0x1c], 1
5:C5F0  6626ff4708           inc dword ptr es:[bx + 8]
5:C5F5  668b460a             mov eax, dword ptr [bp + 0xa]
5:C5F9  c45ef6               les bx, ptr [bp - 0xa]
5:C5FC  66268907             mov dword ptr es:[bx], eax
5:C600  8b76fa               mov si, word ptr [bp - 6]
5:C603  03f6                 add si, si
5:C605  8b84a44e             mov ax, word ptr [si + 0x4ea4]
5:C609  26894704             mov word ptr es:[bx + 4], ax
5:C60D  b80100               mov ax, 1
5:C610  5e                   pop si
5:C611  c9                   leave
5:C612  ca0800               retf 8
5:C615  db 90
loc_C616:
5:C616  c45e06               les bx, ptr [bp + 6]
5:C619  06                   push es
5:C61A  53                   push bx
5:C61B  26c41f               les bx, ptr es:[bx]
5:C61E  26ff5f20             lcall es:[bx + 0x20]
5:C622  666a00               push 0
5:C625  66ff7606             push dword ptr [bp + 6]
5:C629  90                   nop
5:C62A  0e                   push cs
5:C62B  e8b000               call 0xc6de  ; sub_s5:C6DE
5:C62E  8946f6               mov word ptr [bp - 0xa], ax
5:C631  8956f8               mov word ptr [bp - 8], dx
5:C634  0bd0                 or dx, ax
5:C636  75af                 jne 0xc5e7
5:C638  33c0                 xor ax, ax
5:C63A  5e                   pop si
5:C63B  c9                   leave
5:C63C  ca0800               retf 8
5:C63F  db 00

; ---------------- sub_s5:C640 FAR size=4 callers=0
5:C640  ca0400               retf 4
5:C643  db 00

; ---------------- sub_s5:C644 FAR size=80 callers=0
5:C644  c8040000             enter 4, 0
5:C648  c45e06               les bx, ptr [bp + 6]
5:C64B  6626837f1800         cmp dword ptr es:[bx + 0x18], 0
5:C651  7509                 jne 0xc65c
5:C653  06                   push es
5:C654  53                   push bx
5:C655  26c41f               les bx, ptr es:[bx]
5:C658  26ff5f20             lcall es:[bx + 0x20]
loc_C65C:
5:C65C  c45e06               les bx, ptr [bp + 6]
5:C65F  268b4708             mov ax, word ptr es:[bx + 8]
5:C663  8bc8                 mov cx, ax
5:C665  03c0                 add ax, ax
5:C667  03c1                 add ax, cx
5:C669  03c0                 add ax, ax
5:C66B  26034718             add ax, word ptr es:[bx + 0x18]
5:C66F  268b571a             mov dx, word ptr es:[bx + 0x1a]
5:C673  8946fc               mov word ptr [bp - 4], ax
5:C676  8956fe               mov word ptr [bp - 2], dx
5:C679  6626ff4708           inc dword ptr es:[bx + 8]
5:C67E  668b460c             mov eax, dword ptr [bp + 0xc]
5:C682  c45efc               les bx, ptr [bp - 4]
5:C685  66268907             mov dword ptr es:[bx], eax
5:C689  8b460a               mov ax, word ptr [bp + 0xa]
5:C68C  26894704             mov word ptr es:[bx + 4], ax
5:C690  c9                   leave
5:C691  ca0a00               retf 0xa

; ---------------- sub_s5:C694 FAR size=16 callers=0
5:C694  55                   push bp
5:C695  8bec                 mov bp, sp
5:C697  66ff7606             push dword ptr [bp + 6]
5:C69B  90                   nop
5:C69C  0e                   push cs
5:C69D  e80400               call 0xc6a4  ; sub_s5:C6A4
5:C6A0  c9                   leave
5:C6A1  ca0400               retf 4

; ---------------- sub_s5:C6A4 FAR size=58 callers=4
5:C6A4  55                   push bp
5:C6A5  8bec                 mov bp, sp
5:C6A7  c45e06               les bx, ptr [bp + 6]
5:C6AA  6626837f1800         cmp dword ptr es:[bx + 0x18], 0
5:C6B0  7427                 je 0xc6d9
5:C6B2  6626837f0800         cmp dword ptr es:[bx + 8], 0
5:C6B8  741f                 je 0xc6d9
5:C6BA  688ac4               push 0xc48a  ; SEGMENT s5:0000
5:C6BD  68fac7               push 0xc7fa
5:C6C0  6a06                 push 6
5:C6C2  26ff7710             push word ptr es:[bx + 0x10]
5:C6C6  6626ff7718           push dword ptr es:[bx + 0x18]
5:C6CB  9aea4a96c4           lcall 0xc496, 0x4aea  ; sub_s1:4AEA
5:C6D0  c45e06               les bx, ptr [bp + 6]
5:C6D3  26c7471c0000         mov word ptr es:[bx + 0x1c], 0
loc_C6D9:
5:C6D9  c9                   leave
5:C6DA  ca0400               retf 4
5:C6DD  db 00

; ---------------- sub_s5:C6DE FAR size=92 callers=2
5:C6DE  c8040000             enter 4, 0
5:C6E2  56                   push si
5:C6E3  c45e06               les bx, ptr [bp + 6]
5:C6E6  26837f1c00           cmp word ptr es:[bx + 0x1c], 0
5:C6EB  7407                 je 0xc6f4
5:C6ED  06                   push es
5:C6EE  53                   push bx
5:C6EF  90                   nop
5:C6F0  0e                   push cs
5:C6F1  e8b0ff               call 0xc6a4  ; sub_s5:C6A4
loc_C6F4:
5:C6F4  66c746fc00000000     mov dword ptr [bp - 4], 0
5:C6FC  eb04                 jmp 0xc702
loc_C6FE:
5:C6FE  66ff46fc             inc dword ptr [bp - 4]
loc_C702:
5:C702  668b46fc             mov eax, dword ptr [bp - 4]
5:C706  c45e06               les bx, ptr [bp + 6]
5:C709  6626394710           cmp dword ptr es:[bx + 0x10], eax
5:C70E  7622                 jbe 0xc732
5:C710  8bf0                 mov si, ax
5:C712  03f0                 add si, ax
5:C714  03f0                 add si, ax
5:C716  03f6                 add si, si
5:C718  26c45f18             les bx, ptr es:[bx + 0x18]
5:C71C  668b460a             mov eax, dword ptr [bp + 0xa]
5:C720  66263900             cmp dword ptr es:[bx + si], eax
5:C724  75d8                 jne 0xc6fe
5:C726  8bc3                 mov ax, bx
5:C728  8cc2                 mov dx, es
5:C72A  03c6                 add ax, si
5:C72C  5e                   pop si
5:C72D  c9                   leave
5:C72E  ca0800               retf 8
5:C731  db 90
loc_C732:
5:C732  33c0                 xor ax, ax
5:C734  99                   cdq
5:C735  5e                   pop si
5:C736  c9                   leave
5:C737  ca0800               retf 8

; ---------------- sub_s5:C73A size=212 callers=0
5:C73A  c8160000             enter 0x16, 0
5:C73E  c45e06               les bx, ptr [bp + 6]
5:C741  6626837f1000         cmp dword ptr es:[bx + 0x10], 0
5:C747  7413                 je 0xc75c
5:C749  268b4710             mov ax, word ptr es:[bx + 0x10]
5:C74D  268b5712             mov dx, word ptr es:[bx + 0x12]
5:C751  26034714             add ax, word ptr es:[bx + 0x14]
5:C755  26135716             adc dx, word ptr es:[bx + 0x16]
5:C759  eb09                 jmp 0xc764
5:C75B  db 90
loc_C75C:
5:C75C  268b470c             mov ax, word ptr es:[bx + 0xc]
5:C760  268b570e             mov dx, word ptr es:[bx + 0xe]
loc_C764:
5:C764  8946fc               mov word ptr [bp - 4], ax
5:C767  8956fe               mov word ptr [bp - 2], dx
5:C76A  6626837f1800         cmp dword ptr es:[bx + 0x18], 0
5:C770  7424                 je 0xc796
5:C772  6626ff7718           push dword ptr es:[bx + 0x18]
5:C777  8b46fc               mov ax, word ptr [bp - 4]
5:C77A  8bc8                 mov cx, ax
5:C77C  8bda                 mov bx, dx
5:C77E  03c0                 add ax, ax
5:C780  13d2                 adc dx, dx
5:C782  03c1                 add ax, cx
5:C784  13d3                 adc dx, bx
5:C786  03c0                 add ax, ax
5:C788  13d2                 adc dx, dx
5:C78A  52                   push dx
5:C78B  50                   push ax
5:C78C  6a01                 push 1
5:C78E  9ad40eabc7           lcall 0xc7ab, 0xed4  ; sub_s1:0ED4
5:C793  eb32                 jmp 0xc7c7
5:C795  db 90
loc_C796:
5:C796  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
5:C79C  740a                 je 0xc7a8
5:C79E  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
5:C7A1  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
5:C7A5  eb06                 jmp 0xc7ad
5:C7A7  db 90
loc_C7A8:
5:C7A8  9a0a16c2c7           lcall 0xc7c2, 0x160a  ; SH_DefaultPool@s1:160A
loc_C7AD:
5:C7AD  52                   push dx
5:C7AE  50                   push ax
5:C7AF  6a01                 push 1
5:C7B1  8b46fc               mov ax, word ptr [bp - 4]
5:C7B4  8bc8                 mov cx, ax
5:C7B6  03c0                 add ax, ax
5:C7B8  03c1                 add ax, cx
5:C7BA  03c0                 add ax, ax
5:C7BC  6a00                 push 0
5:C7BE  50                   push ax
5:C7BF  9a0817cec6           lcall 0xc6ce, 0x1708  ; SH_MemAllocPtr@s1:1708
5:C7C4  83c40a               add sp, 0xa
loc_C7C7:
5:C7C7  8946f8               mov word ptr [bp - 8], ax
5:C7CA  8956fa               mov word ptr [bp - 6], dx
5:C7CD  8bc2                 mov ax, dx
5:C7CF  0b46f8               or ax, word ptr [bp - 8]
5:C7D2  7418                 je 0xc7ec
5:C7D4  668b46fc             mov eax, dword ptr [bp - 4]
5:C7D8  c45e06               les bx, ptr [bp + 6]
5:C7DB  6626894710           mov dword ptr es:[bx + 0x10], eax
5:C7E0  668b46f8             mov eax, dword ptr [bp - 8]
5:C7E4  8b56fa               mov dx, word ptr [bp - 6]
5:C7E7  6626894718           mov dword ptr es:[bx + 0x18], eax
loc_C7EC:
5:C7EC  c45e06               les bx, ptr [bp + 6]
5:C7EF  26c7471c0100         mov word ptr es:[bx + 0x1c], 1
5:C7F5  c9                   leave
5:C7F6  ca0400               retf 4
5:C7F9  db 00 c8 08 00 00 c4 5e 06 26 8b 47 04 c4 5e 0a 26
5:C809  db 2b 47 04 c9 cb

; ---------------- sub_s5:C80E FAR size=82 callers=0
5:C80E  55                   push bp
5:C80F  8bec                 mov bp, sp
5:C811  66ff7606             push dword ptr [bp + 6]
5:C815  90                   nop
5:C816  0e                   push cs
5:C817  e860fc               call 0xc47a  ; sub_s5:C47A
5:C81A  f6460a01             test byte ptr [bp + 0xa], 1
5:C81E  7409                 je 0xc829
5:C820  66ff7606             push dword ptr [bp + 6]
5:C824  9ace1791c7           lcall 0xc791, 0x17ce  ; operator_delete@s1:17CE
loc_C829:
5:C829  8b4606               mov ax, word ptr [bp + 6]
5:C82C  8b5608               mov dx, word ptr [bp + 8]
5:C82F  c9                   leave
5:C830  ca0600               retf 6
5:C833  db 90 0e c8 3a c8 4a c5 3e c8 ae c5 42 c8 b4 c5 46
5:C843  db c8 38 c5 52 c8 ee 1e 4e c8 16 1f cc c5 94 c6 56
5:C853  db c8 3a c7 5a c8 40 c6 5e c8 44 c6 bb c6

; ---------------- sub_s5:C860 FAR size=18 callers=1
5:C860  55                   push bp
5:C861  8bec                 mov bp, sp
5:C863  c45e06               les bx, ptr [bp + 6]
5:C866  268b4704             mov ax, word ptr es:[bx + 4]
5:C86A  268b5706             mov dx, word ptr es:[bx + 6]
5:C86E  c9                   leave
5:C86F  ca0400               retf 4

; ---------------- KeyedList::insertDescending@s5:C872 FAR size=328 callers=2
5:C872  c8280000             enter 0x28, 0
5:C876  56                   push si
5:C877  66a1b84f             mov eax, dword ptr [0x4fb8]
5:C87B  6650                 push eax
5:C87D  9afc0727c8           lcall 0xc827, 0x7fc  ; sub_s1:07FC
5:C882  8946f0               mov word ptr [bp - 0x10], ax
5:C885  8956f2               mov word ptr [bp - 0xe], dx
5:C888  0bd0                 or dx, ax
5:C88A  744a                 je 0xc8d6
5:C88C  c45ef0               les bx, ptr [bp - 0x10]
5:C88F  26c7079a38           mov word ptr es:[bx], 0x389a
5:C894  26c74702b3c8         mov word ptr es:[bx + 2], 0xc8b3  ; SEGMENT s2:0000
5:C89A  c45ef0               les bx, ptr [bp - 0x10]
5:C89D  662bc0               sub eax, eax
5:C8A0  6626894704           mov dword ptr es:[bx + 4], eax
5:C8A5  6626894708           mov dword ptr es:[bx + 8], eax
5:C8AA  26c707c05b           mov word ptr es:[bx], 0x5bc0  ; '%s %s!'
5:C8AF  26c74702c6b9         mov word ptr es:[bx + 2], 0xb9c6  ; SEGMENT s2:0000
5:C8B5  c45ef0               les bx, ptr [bp - 0x10]
5:C8B8  2689470e             mov word ptr es:[bx + 0xe], ax
5:C8BC  2689470c             mov word ptr es:[bx + 0xc], ax
5:C8C0  26c707e6c9           mov word ptr es:[bx], 0xc9e6
5:C8C5  26c7470236c8         mov word ptr es:[bx + 2], 0xc836  ; SEGMENT s5:0000
5:C8CB  668b46f0             mov eax, dword ptr [bp - 0x10]
5:C8CF  668946fc             mov dword ptr [bp - 4], eax
5:C8D3  eb09                 jmp 0xc8de
5:C8D5  db 90
loc_C8D6:
5:C8D6  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_C8DE:
5:C8DE  66837efc00           cmp dword ptr [bp - 4], 0
5:C8E3  7507                 jne 0xc8ec
5:C8E5  33c0                 xor ax, ax
5:C8E7  5e                   pop si
5:C8E8  c9                   leave
5:C8E9  ca0c00               retf 0xc
loc_C8EC:
5:C8EC  668b460e             mov eax, dword ptr [bp + 0xe]
5:C8F0  c45efc               les bx, ptr [bp - 4]
5:C8F3  6626894708           mov dword ptr es:[bx + 8], eax
5:C8F8  668b460a             mov eax, dword ptr [bp + 0xa]
5:C8FC  8b560c               mov dx, word ptr [bp + 0xc]
5:C8FF  662689470c           mov dword ptr es:[bx + 0xc], eax
5:C904  c45e06               les bx, ptr [bp + 6]
5:C907  66268b4f04           mov ecx, dword ptr es:[bx + 4]
5:C90C  268b7706             mov si, word ptr es:[bx + 6]
5:C910  66894ef4             mov dword ptr [bp - 0xc], ecx
5:C914  26837f0800           cmp word ptr es:[bx + 8], 0
5:C919  7412                 je 0xc92d
5:C91B  8ec6                 mov es, si
5:C91D  8bd9                 mov bx, cx
5:C91F  2639570e             cmp word ptr es:[bx + 0xe], dx
5:C923  7723                 ja 0xc948
5:C925  7206                 jb 0xc92d
5:C927  2639470c             cmp word ptr es:[bx + 0xc], ax
5:C92B  771b                 ja 0xc948
loc_C92D:
5:C92D  c45e06               les bx, ptr [bp + 6]
5:C930  66268b4704           mov eax, dword ptr es:[bx + 4]
5:C935  c45efc               les bx, ptr [bp - 4]
5:C938  6626894704           mov dword ptr es:[bx + 4], eax
5:C93D  c45e06               les bx, ptr [bp + 6]
5:C940  8b46fc               mov ax, word ptr [bp - 4]
5:C943  8b56fe               mov dx, word ptr [bp - 2]
5:C946  eb5b                 jmp 0xc9a3
loc_C948:
5:C948  c746d80000           mov word ptr [bp - 0x28], 0
loc_C94D:
5:C94D  66837ef400           cmp dword ptr [bp - 0xc], 0
5:C952  7440                 je 0xc994
5:C954  668b460a             mov eax, dword ptr [bp + 0xa]
5:C958  c45ef4               les bx, ptr [bp - 0xc]
5:C95B  662639470c           cmp dword ptr es:[bx + 0xc], eax
5:C960  7720                 ja 0xc982
5:C962  c746d80100           mov word ptr [bp - 0x28], 1
5:C967  c45efc               les bx, ptr [bp - 4]
5:C96A  668b46f4             mov eax, dword ptr [bp - 0xc]
5:C96E  6626894704           mov dword ptr es:[bx + 4], eax
5:C973  c45ef8               les bx, ptr [bp - 8]
5:C976  668b46fc             mov eax, dword ptr [bp - 4]
5:C97A  6626894704           mov dword ptr es:[bx + 4], eax
5:C97F  eb13                 jmp 0xc994
5:C981  db 90
loc_C982:
5:C982  895ef8               mov word ptr [bp - 8], bx
5:C985  8c46fa               mov word ptr [bp - 6], es
5:C988  66268b4704           mov eax, dword ptr es:[bx + 4]
5:C98D  668946f4             mov dword ptr [bp - 0xc], eax
5:C991  ebba                 jmp 0xc94d
5:C993  db 90
loc_C994:
5:C994  837ed800             cmp word ptr [bp - 0x28], 0
5:C998  7511                 jne 0xc9ab
5:C99A  8b46fc               mov ax, word ptr [bp - 4]
5:C99D  8b56fe               mov dx, word ptr [bp - 2]
5:C9A0  c45ef8               les bx, ptr [bp - 8]
loc_C9A3:
5:C9A3  26894704             mov word ptr es:[bx + 4], ax
5:C9A7  26895706             mov word ptr es:[bx + 6], dx
loc_C9AB:
5:C9AB  c45e06               les bx, ptr [bp + 6]
5:C9AE  b80100               mov ax, 1
5:C9B1  26ff4708             inc word ptr es:[bx + 8]
5:C9B5  5e                   pop si
5:C9B6  c9                   leave
5:C9B7  ca0c00               retf 0xc

; ---------------- sub_s5:C9BA size=48 callers=0
5:C9BA  c80c0000             enter 0xc, 0
5:C9BE  c45e06               les bx, ptr [bp + 6]
5:C9C1  26c7079a38           mov word ptr es:[bx], 0x389a
5:C9C6  26c7470298c8         mov word ptr es:[bx + 2], 0xc898  ; SEGMENT s2:0000
5:C9CC  f6460a01             test byte ptr [bp + 0xa], 1
5:C9D0  7409                 je 0xc9db
5:C9D2  66ff7606             push dword ptr [bp + 6]
5:C9D6  9a3a0980c8           lcall 0xc880, 0x93a  ; sub_s1:093A
loc_C9DB:
5:C9DB  8b4606               mov ax, word ptr [bp + 6]
5:C9DE  8b5608               mov dx, word ptr [bp + 8]
5:C9E1  c9                   leave
5:C9E2  ca0600               retf 6
5:C9E5  db 90 ba c9 c9 c8

; ---------------- sub_s5:C9EA FAR size=34 callers=1
5:C9EA  55                   push bp
5:C9EB  8bec                 mov bp, sp
5:C9ED  66ff7606             push dword ptr [bp + 6]
5:C9F1  9a5409c5c5           lcall 0xc5c5, 0x954  ; sub_s6:0954
5:C9F6  c45e06               les bx, ptr [bp + 6]
5:C9F9  26c7077ccc           mov word ptr es:[bx], 0xcc7c
5:C9FE  26c74702e8c9         mov word ptr es:[bx + 2], 0xc9e8  ; SEGMENT s5:0000
5:CA04  8bc3                 mov ax, bx
5:CA06  8cc2                 mov dx, es
5:CA08  c9                   leave
5:CA09  ca0400               retf 4

; ---------------- sub_s5:CA0C FAR size=42 callers=1
5:CA0C  55                   push bp
5:CA0D  8bec                 mov bp, sp
5:CA0F  66ff760c             push dword ptr [bp + 0xc]
5:CA13  66ff7608             push dword ptr [bp + 8]
5:CA17  ff7606               push word ptr [bp + 6]
5:CA1A  9a8209f4c9           lcall 0xc9f4, 0x982  ; sub_s6:0982
5:CA1F  c45e06               les bx, ptr [bp + 6]
5:CA22  26c7077ccc           mov word ptr es:[bx], 0xcc7c
5:CA27  26c7470202ca         mov word ptr es:[bx + 2], 0xca02  ; SEGMENT s5:0000
5:CA2D  8bc3                 mov ax, bx
5:CA2F  8cc2                 mov dx, es
5:CA31  c9                   leave
5:CA32  ca0a00               retf 0xa
5:CA35  db 00

; ---------------- sub_s5:CA36 FAR size=76 callers=0
5:CA36  c8100000             enter 0x10, 0
5:CA3A  66ff7608             push dword ptr [bp + 8]
5:CA3E  ff7606               push word ptr [bp + 6]
5:CA41  9ab8094dca           lcall 0xca4d, 0x9b8  ; sub_s6:09B8
5:CA46  66ff7606             push dword ptr [bp + 6]
5:CA4A  9af2b41dca           lcall 0xca1d, 0xb4f2  ; sub_s6:B4F2
5:CA4F  8946fc               mov word ptr [bp - 4], ax
5:CA52  8956fe               mov word ptr [bp - 2], dx
5:CA55  c45efc               les bx, ptr [bp - 4]
5:CA58  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:CA62  741a                 je 0xca7e
5:CA64  6a08                 push 8
5:CA66  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CA6B  9aba207cca           lcall 0xca7c, 0x20ba  ; sub_s3:20BA
5:CA70  c45e06               les bx, ptr [bp + 6]
5:CA73  26ff770c             push word ptr es:[bx + 0xc]
5:CA77  52                   push dx
5:CA78  50                   push ax
5:CA79  9a8c980dc3           lcall 0xc30d, 0x988c  ; sub_s3:988C
loc_CA7E:
5:CA7E  c9                   leave
5:CA7F  ca0600               retf 6

; ---------------- sub_s5:CA82 size=64 callers=0
5:CA82  c80c0000             enter 0xc, 0
5:CA86  66ff7606             push dword ptr [bp + 6]
5:CA8A  9a9ebe96ca           lcall 0xca96, 0xbe9e  ; sub_s6:BE9E
5:CA8F  66ff7606             push dword ptr [bp + 6]
5:CA93  9af2b444ca           lcall 0xca44, 0xb4f2  ; sub_s6:B4F2
5:CA98  8946fc               mov word ptr [bp - 4], ax
5:CA9B  8956fe               mov word ptr [bp - 2], dx
5:CA9E  c45efc               les bx, ptr [bp - 4]
5:CAA1  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:CAAB  7411                 je 0xcabe
5:CAAD  c45e06               les bx, ptr [bp + 6]
5:CAB0  26837f1205           cmp word ptr es:[bx + 0x12], 5
5:CAB5  7507                 jne 0xcabe
5:CAB7  06                   push es
5:CAB8  53                   push bx
5:CAB9  90                   nop
5:CABA  0e                   push cs
5:CABB  e80400               call 0xcac2  ; sub_s5:CAC2
loc_CABE:
5:CABE  c9                   leave
5:CABF  ca0400               retf 4

; ---------------- sub_s5:CAC2 FAR size=404 callers=1
5:CAC2  c8340000             enter 0x34, 0
5:CAC6  6a02                 push 2
5:CAC8  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CACD  9aba20f2ca           lcall 0xcaf2, 0x20ba  ; sub_s3:20BA
5:CAD2  8946fc               mov word ptr [bp - 4], ax
5:CAD5  8956fe               mov word ptr [bp - 2], dx
5:CAD8  a1ae13               mov ax, word ptr [0x13ae]
5:CADB  8946fa               mov word ptr [bp - 6], ax
5:CADE  3d0100               cmp ax, 1
5:CAE1  7505                 jne 0xcae8
5:CAE3  c746fa0200           mov word ptr [bp - 6], 2
loc_CAE8:
5:CAE8  6a08                 push 8
5:CAEA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CAEF  9aba206eca           lcall 0xca6e, 0x20ba  ; sub_s3:20BA
5:CAF4  8946f6               mov word ptr [bp - 0xa], ax
5:CAF7  8956f8               mov word ptr [bp - 8], dx
5:CAFA  c45ef6               les bx, ptr [bp - 0xa]
5:CAFD  66268b470a           mov eax, dword ptr es:[bx + 0xa]
5:CB02  668946f2             mov dword ptr [bp - 0xe], eax
5:CB06  66268b470e           mov eax, dword ptr es:[bx + 0xe]
5:CB0B  668946ee             mov dword ptr [bp - 0x12], eax
5:CB0F  66ff76f2             push dword ptr [bp - 0xe]
5:CB13  8d46e6               lea ax, [bp - 0x1a]
5:CB16  16                   push ss
5:CB17  50                   push ax
5:CB18  9a845725cb           lcall 0xcb25, 0x5784  ; ListIter::ListIter@s2:5784
loc_CB1D:
5:CB1D  8d46e6               lea ax, [bp - 0x1a]
5:CB20  16                   push ss
5:CB21  50                   push ax
5:CB22  9a125bcac9           lcall 0xc9ca, 0x5b12  ; ListIter::next@s2:5B12
5:CB27  8946e2               mov word ptr [bp - 0x1e], ax
5:CB2A  8956e4               mov word ptr [bp - 0x1c], dx
5:CB2D  0bd0                 or dx, ax
5:CB2F  0f841f01             je 0xcc52
5:CB33  c45ee2               les bx, ptr [bp - 0x1e]
5:CB36  268b4704             mov ax, word ptr es:[bx + 4]
5:CB3A  2d1200               sub ax, 0x12
5:CB3D  7cde                 jl 0xcb1d
5:CB3F  70dc                 jo 0xcb1d
5:CB41  48                   dec ax
5:CB42  0f8e8e00             jle 0xcbd4
5:CB46  2d6e00               sub ax, 0x6e
5:CB49  75d2                 jne 0xcb1d
5:CB4B  c746de0000           mov word ptr [bp - 0x22], 0
5:CB50  8b46fa               mov ax, word ptr [bp - 6]
5:CB53  48                   dec ax
5:CB54  48                   dec ax
5:CB55  7449                 je 0xcba0
5:CB57  48                   dec ax
5:CB58  745c                 je 0xcbb6
5:CB5A  48                   dec ax
5:CB5B  7467                 je 0xcbc4
loc_CB5D:
5:CB5D  66ff7606             push dword ptr [bp + 6]
5:CB61  9a8eb58dca           lcall 0xca8d, 0xb58e  ; DbObj::getOwner@s6:B58E
5:CB66  8946d2               mov word ptr [bp - 0x2e], ax
5:CB69  8956d4               mov word ptr [bp - 0x2c], dx
5:CB6C  6a1e                 push 0x1e
5:CB6E  c45ee2               les bx, ptr [bp - 0x1e]
5:CB71  268b4706             mov ax, word ptr es:[bx + 6]
5:CB75  2b46de               sub ax, word ptr [bp - 0x22]
5:CB78  99                   cdq
5:CB79  52                   push dx
5:CB7A  50                   push ax
5:CB7B  66ff76d2             push dword ptr [bp - 0x2e]
5:CB7F  9adc7d4ac8           lcall 0xc84a, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
5:CB84  66ff76e2             push dword ptr [bp - 0x1e]
5:CB88  c45ef2               les bx, ptr [bp - 0xe]
5:CB8B  06                   push es
5:CB8C  53                   push bx
5:CB8D  26c41f               les bx, ptr es:[bx]
5:CB90  26ff5f0c             lcall es:[bx + 0xc]
5:CB94  66c746ea00000000     mov dword ptr [bp - 0x16], 0
5:CB9C  e97eff               jmp 0xcb1d
5:CB9F  db 90
loc_CBA0:
5:CBA0  c45ee2               les bx, ptr [bp - 0x1e]
5:CBA3  268b4706             mov ax, word ptr es:[bx + 6]
loc_CBA7:
5:CBA7  99                   cdq
5:CBA8  83e203               and dx, 3
5:CBAB  03c2                 add ax, dx
5:CBAD  c1f802               sar ax, 2
loc_CBB0:
5:CBB0  8946de               mov word ptr [bp - 0x22], ax
5:CBB3  eba8                 jmp 0xcb5d
5:CBB5  db 90
loc_CBB6:
5:CBB6  c45ee2               les bx, ptr [bp - 0x1e]
5:CBB9  268b4706             mov ax, word ptr es:[bx + 6]
5:CBBD  99                   cdq
5:CBBE  2bc2                 sub ax, dx
5:CBC0  d1f8                 sar ax, 1
5:CBC2  ebec                 jmp 0xcbb0
loc_CBC4:
5:CBC4  c45ee2               les bx, ptr [bp - 0x1e]
5:CBC7  268b4706             mov ax, word ptr es:[bx + 6]
5:CBCB  8bc8                 mov cx, ax
5:CBCD  03c0                 add ax, ax
5:CBCF  03c1                 add ax, cx
5:CBD1  ebd4                 jmp 0xcba7
5:CBD3  db 90
loc_CBD4:
5:CBD4  c746ce0000           mov word ptr [bp - 0x32], 0
5:CBD9  8b46fa               mov ax, word ptr [bp - 6]
5:CBDC  2d0300               sub ax, 3
5:CBDF  7447                 je 0xcc28
5:CBE1  48                   dec ax
5:CBE2  7456                 je 0xcc3a
loc_CBE4:
5:CBE4  8b46ce               mov ax, word ptr [bp - 0x32]
5:CBE7  26294706             sub word ptr es:[bx + 6], ax
5:CBEB  c45ef2               les bx, ptr [bp - 0xe]
5:CBEE  26c7470a0000         mov word ptr es:[bx + 0xa], 0
5:CBF4  66ff76e2             push dword ptr [bp - 0x1e]
5:CBF8  c45ef2               les bx, ptr [bp - 0xe]
5:CBFB  06                   push es
5:CBFC  53                   push bx
5:CBFD  26c41f               les bx, ptr es:[bx]
5:CC00  26ff5f0c             lcall es:[bx + 0xc]
5:CC04  c45ef2               les bx, ptr [bp - 0xe]
5:CC07  662bc0               sub eax, eax
5:CC0A  26c7470a0100         mov word ptr es:[bx + 0xa], 1
5:CC10  668946ea             mov dword ptr [bp - 0x16], eax
5:CC14  66ff76e2             push dword ptr [bp - 0x1e]
5:CC18  c45eee               les bx, ptr [bp - 0x12]
5:CC1B  06                   push es
5:CC1C  53                   push bx
5:CC1D  26c41f               les bx, ptr es:[bx]
5:CC20  26ff5f04             lcall es:[bx + 4]
5:CC24  e9f6fe               jmp 0xcb1d
5:CC27  db 90
loc_CC28:
5:CC28  c45ee2               les bx, ptr [bp - 0x1e]
5:CC2B  268b4706             mov ax, word ptr es:[bx + 6]
5:CC2F  99                   cdq
5:CC30  2bc2                 sub ax, dx
5:CC32  d1f8                 sar ax, 1
loc_CC34:
5:CC34  8946ce               mov word ptr [bp - 0x32], ax
5:CC37  ebab                 jmp 0xcbe4
5:CC39  db 90
loc_CC3A:
5:CC3A  c45ee2               les bx, ptr [bp - 0x1e]
5:CC3D  268b4706             mov ax, word ptr es:[bx + 6]
5:CC41  8bc8                 mov cx, ax
5:CC43  03c0                 add ax, ax
5:CC45  03c1                 add ax, cx
5:CC47  99                   cdq
5:CC48  83e203               and dx, 3
5:CC4B  03c2                 add ax, dx
5:CC4D  c1f802               sar ax, 2
5:CC50  ebe2                 jmp 0xcc34
loc_CC52:
5:CC52  c9                   leave
5:CC53  ca0400               retf 4

; ---------------- sub_s5:CC56 size=142 callers=0
5:CC56  c8080000             enter 8, 0
5:CC5A  66ff7606             push dword ptr [bp + 6]
5:CC5E  9a18b464cb           lcall 0xcb64, 0xb418  ; sub_s6:B418
5:CC63  f6460a01             test byte ptr [bp + 0xa], 1
5:CC67  7409                 je 0xcc72
5:CC69  66ff7606             push dword ptr [bp + 6]
5:CC6D  9ace17d9c9           lcall 0xc9d9, 0x17ce  ; operator_delete@s1:17CE
loc_CC72:
5:CC72  8b4606               mov ax, word ptr [bp + 6]
5:CC75  8b5608               mov dx, word ptr [bp + 8]
5:CC78  c9                   leave
5:CC79  ca0600               retf 6
5:CC7C  db 56 cc 96 cc 56 bb 8a cc 8e 17 82 cb ec b5 8e cc
5:CC8C  db 1a b8 92 cc 1c bc 9a cc 36 ca b6 cc d4 09 9e cc
5:CC9C  db 7e bc a2 cc 14 b5 a6 cc 2a be aa cc 16 bf ae cc
5:CCAC  db 1a bf b2 cc 1e bf ba cc 82 ca 2b ca 22 bf be cc
5:CCBC  db f0 bb c2 cc 02 bc c6 cc a8 b5 ca cc ca b5 ce cc
5:CCCC  db e6 b4 d2 cc ec b4 d6 cc 6e b4 da cc 4a c6 de cc
5:CCDC  db 22 c5 e2 cc d2 ce 61 cc

; ---------------- sub_s5:CCE4 FAR size=34 callers=1
5:CCE4  55                   push bp
5:CCE5  8bec                 mov bp, sp
5:CCE7  66ff7606             push dword ptr [bp + 6]
5:CCEB  9a54b382cc           lcall 0xcc82, 0xb354  ; Building::Building()@s6:B354
5:CCF0  c45e06               les bx, ptr [bp + 6]
5:CCF3  26c7077ecd           mov word ptr es:[bx], 0xcd7e
5:CCF8  26c747027ecc         mov word ptr es:[bx + 2], 0xcc7e  ; SEGMENT s5:0000
5:CCFE  8bc3                 mov ax, bx
5:CD00  8cc2                 mov dx, es
5:CD02  c9                   leave
5:CD03  ca0400               retf 4

; ---------------- sub_s5:CD06 FAR size=42 callers=1
5:CD06  55                   push bp
5:CD07  8bec                 mov bp, sp
5:CD09  66ff760c             push dword ptr [bp + 0xc]
5:CD0D  66ff7608             push dword ptr [bp + 8]
5:CD11  ff7606               push word ptr [bp + 6]
5:CD14  9a9eb3eecc           lcall 0xccee, 0xb39e  ; Building::Building(type,owner)@s6:B39E
5:CD19  c45e06               les bx, ptr [bp + 6]
5:CD1C  26c7077ecd           mov word ptr es:[bx], 0xcd7e
5:CD21  26c74702fccc         mov word ptr es:[bx + 2], 0xccfc  ; SEGMENT s5:0000
5:CD27  8bc3                 mov ax, bx
5:CD29  8cc2                 mov dx, es
5:CD2B  c9                   leave
5:CD2C  ca0a00               retf 0xa
5:CD2F  db 00

; ---------------- sub_s5:CD30 FAR size=40 callers=0
5:CD30  55                   push bp
5:CD31  8bec                 mov bp, sp
5:CD33  c45e06               les bx, ptr [bp + 6]
5:CD36  26837f1206           cmp word ptr es:[bx + 0x12], 6
5:CD3B  740d                 je 0xcd4a
5:CD3D  26837f1205           cmp word ptr es:[bx + 0x12], 5
5:CD42  7406                 je 0xcd4a
loc_CD44:
5:CD44  33c0                 xor ax, ax
5:CD46  c9                   leave
5:CD47  ca0400               retf 4
loc_CD4A:
5:CD4A  26f6471a02           test byte ptr es:[bx + 0x1a], 2
5:CD4F  74f3                 je 0xcd44
5:CD51  b80100               mov ax, 1
5:CD54  c9                   leave
5:CD55  ca0400               retf 4

; ---------------- sub_s5:CD58 size=142 callers=0
5:CD58  c8040000             enter 4, 0
5:CD5C  66ff7606             push dword ptr [bp + 6]
5:CD60  9a18b417cd           lcall 0xcd17, 0xb418  ; sub_s6:B418
5:CD65  f6460a01             test byte ptr [bp + 0xa], 1
5:CD69  7409                 je 0xcd74
5:CD6B  66ff7606             push dword ptr [bp + 6]
5:CD6F  9ace1770cc           lcall 0xcc70, 0x17ce  ; operator_delete@s1:17CE
loc_CD74:
5:CD74  8b4606               mov ax, word ptr [bp + 6]
5:CD77  8b5608               mov dx, word ptr [bp + 8]
5:CD7A  c9                   leave
5:CD7B  ca0600               retf 6
5:CD7E  db 58 cd d0 cd 56 bb 8c cd 8e 17 86 cc ec b5 90 cd
5:CD8E  db 1a b8 94 cd 1c bc 98 cd 38 bd 9c cd 90 bc a0 cd
5:CD9E  db 7e bc a4 cd 14 b5 a8 cd 2a be ac cd 16 bf b0 cd
5:CDAE  db 1a bf b4 cd 1e bf b8 cd 9e be bc cd 22 bf c0 cd
5:CDBE  db f0 bb c4 cd 02 bc c8 cd a8 b5 cc cd ca b5 d4 cd
5:CDCE  db 30 cd 25 cd ec b4 d8 cd 6e b4 dc cd 4a c6 e0 cd
5:CDDE  db 22 c5 e4 cd d2 ce 63 cd

; ---------------- sub_s5:CDE6 FAR size=34 callers=1
5:CDE6  55                   push bp
5:CDE7  8bec                 mov bp, sp
5:CDE9  66ff7606             push dword ptr [bp + 6]
5:CDED  9a540984cd           lcall 0xcd84, 0x954  ; sub_s6:0954
5:CDF2  c45e06               les bx, ptr [bp + 6]
5:CDF5  26c70704d0           mov word ptr es:[bx], 0xd004
5:CDFA  26c7470280cd         mov word ptr es:[bx + 2], 0xcd80  ; SEGMENT s5:0000
5:CE00  8bc3                 mov ax, bx
5:CE02  8cc2                 mov dx, es
5:CE04  c9                   leave
5:CE05  ca0400               retf 4

; ---------------- sub_s5:CE08 FAR size=42 callers=1
5:CE08  55                   push bp
5:CE09  8bec                 mov bp, sp
5:CE0B  66ff760c             push dword ptr [bp + 0xc]
5:CE0F  66ff7608             push dword ptr [bp + 8]
5:CE13  ff7606               push word ptr [bp + 6]
5:CE16  9a8209f0cd           lcall 0xcdf0, 0x982  ; sub_s6:0982
5:CE1B  c45e06               les bx, ptr [bp + 6]
5:CE1E  26c70704d0           mov word ptr es:[bx], 0xd004
5:CE23  26c74702fecd         mov word ptr es:[bx + 2], 0xcdfe  ; SEGMENT s5:0000
5:CE29  8bc3                 mov ax, bx
5:CE2B  8cc2                 mov dx, es
5:CE2D  c9                   leave
5:CE2E  ca0a00               retf 0xa
5:CE31  db 00

; ---------------- sub_s5:CE32 FAR size=108 callers=0
5:CE32  c8140000             enter 0x14, 0
5:CE36  66ff7608             push dword ptr [bp + 8]
5:CE3A  ff7606               push word ptr [bp + 6]
5:CE3D  9ab80949ce           lcall 0xce49, 0x9b8  ; sub_s6:09B8
5:CE42  66ff7606             push dword ptr [bp + 6]
5:CE46  9af2b419ce           lcall 0xce19, 0xb4f2  ; sub_s6:B4F2
5:CE4B  8946fc               mov word ptr [bp - 4], ax
5:CE4E  8956fe               mov word ptr [bp - 2], dx
5:CE51  c45efc               les bx, ptr [bp - 4]
5:CE54  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:CE5E  743a                 je 0xce9a
5:CE60  6a08                 push 8
5:CE62  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CE67  9aba2078ce           lcall 0xce78, 0x20ba  ; sub_s3:20BA
5:CE6C  c45e06               les bx, ptr [bp + 6]
5:CE6F  26ff770c             push word ptr es:[bx + 0xc]
5:CE73  52                   push dx
5:CE74  50                   push ax
5:CE75  9a8c9891ce           lcall 0xce91, 0x988c  ; sub_s3:988C
5:CE7A  666800000900         push 0x90000
5:CE80  666a01               push 1
5:CE83  666a00               push 0
5:CE86  666a37               push 0x37
5:CE89  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CE8E  9aba20d0ca           lcall 0xcad0, 0x20ba  ; sub_s3:20BA
5:CE93  52                   push dx
5:CE94  50                   push ax
5:CE95  9ae4a01bcb           lcall 0xcb1b, 0xa0e4  ; sub_s2:A0E4
loc_CE9A:
5:CE9A  c9                   leave
5:CE9B  ca0600               retf 6

; ---------------- sub_s5:CE9E size=94 callers=0
5:CE9E  c8140000             enter 0x14, 0
5:CEA2  66ff7606             push dword ptr [bp + 6]
5:CEA6  9a9ebec3ce           lcall 0xcec3, 0xbe9e  ; sub_s6:BE9E
5:CEAB  c45e06               les bx, ptr [bp + 6]
5:CEAE  26837f1205           cmp word ptr es:[bx + 0x12], 5
5:CEB3  7542                 jne 0xcef7
5:CEB5  06                   push es
5:CEB6  53                   push bx
5:CEB7  90                   nop
5:CEB8  0e                   push cs
5:CEB9  e84000               call 0xcefc  ; sub_s5:CEFC
5:CEBC  66ff7606             push dword ptr [bp + 6]
5:CEC0  9af2b440ce           lcall 0xce40, 0xb4f2  ; sub_s6:B4F2
5:CEC5  8946fc               mov word ptr [bp - 4], ax
5:CEC8  8956fe               mov word ptr [bp - 2], dx
5:CECB  c45efc               les bx, ptr [bp - 4]
5:CECE  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:CED8  741d                 je 0xcef7
5:CEDA  6a2b                 push 0x2b
5:CEDC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CEE1  9aba20f5ce           lcall 0xcef5, 0x20ba  ; sub_s3:20BA
5:CEE6  6a05                 push 5
5:CEE8  c45efc               les bx, ptr [bp - 4]
5:CEEB  6626ff7704           push dword ptr es:[bx + 4]
5:CEF0  52                   push dx
5:CEF1  50                   push ax
5:CEF2  9a3a046ace           lcall 0xce6a, 0x43a  ; sub_s3:043A
loc_CEF7:
5:CEF7  c9                   leave
5:CEF8  ca0400               retf 4
5:CEFB  db 00

; ---------------- sub_s5:CEFC FAR size=112 callers=1
5:CEFC  c8120000             enter 0x12, 0
5:CF00  66ff7606             push dword ptr [bp + 6]
5:CF04  9af2b4a9ce           lcall 0xcea9, 0xb4f2  ; sub_s6:B4F2
5:CF09  8946fc               mov word ptr [bp - 4], ax
5:CF0C  8956fe               mov word ptr [bp - 2], dx
5:CF0F  c45efc               les bx, ptr [bp - 4]
5:CF12  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:CF1C  7512                 jne 0xcf30
5:CF1E  52                   push dx
5:CF1F  50                   push ax
5:CF20  6a32                 push 0x32
loc_CF22:
5:CF22  66ff7606             push dword ptr [bp + 6]
5:CF26  90                   nop
5:CF27  0e                   push cs
5:CF28  e84100               call 0xcf6c  ; sub_s5:CF6C
5:CF2B  c9                   leave
5:CF2C  ca0400               retf 4
5:CF2F  db 90
loc_CF30:
5:CF30  6a08                 push 8
5:CF32  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:CF37  9aba2047cf           lcall 0xcf47, 0x20ba  ; sub_s3:20BA
5:CF3C  8946f8               mov word ptr [bp - 8], ax
5:CF3F  8956fa               mov word ptr [bp - 6], dx
5:CF42  52                   push dx
5:CF43  50                   push ax
5:CF44  9ac29660cf           lcall 0xcf60, 0x96c2  ; sub_s3:96C2
5:CF49  8946f6               mov word ptr [bp - 0xa], ax
5:CF4C  3d3200               cmp ax, 0x32
5:CF4F  7e05                 jle 0xcf56
5:CF51  c746f63200           mov word ptr [bp - 0xa], 0x32
loc_CF56:
5:CF56  ff76f6               push word ptr [bp - 0xa]
5:CF59  66ff76f8             push dword ptr [bp - 8]
5:CF5D  9aa896e4ce           lcall 0xcee4, 0x96a8  ; sub_s3:96A8
5:CF62  66ff76fc             push dword ptr [bp - 4]
5:CF66  ff76f6               push word ptr [bp - 0xa]
5:CF69  ebb7                 jmp 0xcf22
5:CF6B  db 00

; ---------------- sub_s5:CF6C FAR size=114 callers=1
5:CF6C  c8180000             enter 0x18, 0
5:CF70  56                   push si
5:CF71  c45e0c               les bx, ptr [bp + 0xc]
5:CF74  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
5:CF7A  050400               add ax, 4
5:CF7D  668946f8             mov dword ptr [bp - 8], eax
5:CF81  8b460a               mov ax, word ptr [bp + 0xa]
5:CF84  b90500               mov cx, 5
5:CF87  99                   cdq
5:CF88  f7f9                 idiv cx
5:CF8A  8bd8                 mov bx, ax
5:CF8C  8bd0                 mov dx, ax
5:CF8E  c1e002               shl ax, 2
5:CF91  03c2                 add ax, dx
5:CF93  2b460a               sub ax, word ptr [bp + 0xa]
5:CF96  f7d8                 neg ax
5:CF98  03c3                 add ax, bx
5:CF9A  99                   cdq
5:CF9B  c476f8               les si, ptr [bp - 8]
5:CF9E  2601444c             add word ptr es:[si + 0x4c], ax
5:CFA2  2611544e             adc word ptr es:[si + 0x4e], dx
5:CFA6  8bc3                 mov ax, bx
5:CFA8  99                   cdq
5:CFA9  26014474             add word ptr es:[si + 0x74], ax
5:CFAD  26115476             adc word ptr es:[si + 0x76], dx
5:CFB1  2601849c00           add word ptr es:[si + 0x9c], ax
5:CFB6  2611949e00           adc word ptr es:[si + 0x9e], dx
5:CFBB  260184c400           add word ptr es:[si + 0xc4], ax
5:CFC0  261194c600           adc word ptr es:[si + 0xc6], dx
5:CFC5  260184ec00           add word ptr es:[si + 0xec], ax
5:CFCA  261194ee00           adc word ptr es:[si + 0xee], dx
5:CFCF  c45e0c               les bx, ptr [bp + 0xc]
5:CFD2  26c787fe010100       mov word ptr es:[bx + 0x1fe], 1
5:CFD9  5e                   pop si
5:CFDA  c9                   leave
5:CFDB  ca0a00               retf 0xa

; ---------------- sub_s5:CFDE size=142 callers=0
5:CFDE  c8080000             enter 8, 0
5:CFE2  66ff7606             push dword ptr [bp + 6]
5:CFE6  9a18b407cf           lcall 0xcf07, 0xb418  ; sub_s6:B418
5:CFEB  f6460a01             test byte ptr [bp + 0xa], 1
5:CFEF  7409                 je 0xcffa
5:CFF1  66ff7606             push dword ptr [bp + 6]
5:CFF5  9ace1772cd           lcall 0xcd72, 0x17ce  ; operator_delete@s1:17CE
loc_CFFA:
5:CFFA  8b4606               mov ax, word ptr [bp + 6]
5:CFFD  8b5608               mov dx, word ptr [bp + 8]
5:D000  c9                   leave
5:D001  ca0600               retf 6
5:D004  db de cf 1e d0 56 bb 12 d0 8e 17 88 cd ec b5 16 d0
5:D014  db 1a b8 1a d0 1c bc 22 d0 32 ce 3e d0 d4 09 26 d0
5:D024  db 7e bc 2a d0 14 b5 2e d0 2a be 32 d0 16 bf 36 d0
5:D034  db 1a bf 3a d0 1e bf 42 d0 9e ce 27 ce 22 bf 46 d0
5:D044  db f0 bb 4a d0 02 bc 4e d0 a8 b5 52 d0 ca b5 56 d0
5:D054  db e6 b4 5a d0 ec b4 5e d0 6e b4 62 d0 4a c6 66 d0
5:D064  db 22 c5 6a d0 d2 ce e9 cf

; ---------------- sub_s5:D06C FAR size=34 callers=1
5:D06C  55                   push bp
5:D06D  8bec                 mov bp, sp
5:D06F  66ff7606             push dword ptr [bp + 6]
5:D073  9a54b30ad0           lcall 0xd00a, 0xb354  ; Building::Building()@s6:B354
5:D078  c45e06               les bx, ptr [bp + 6]
5:D07B  26c70714d3           mov word ptr es:[bx], 0xd314
5:D080  26c7470206d0         mov word ptr es:[bx + 2], 0xd006  ; SEGMENT s5:0000
5:D086  8bc3                 mov ax, bx
5:D088  8cc2                 mov dx, es
5:D08A  c9                   leave
5:D08B  ca0400               retf 4

; ---------------- sub_s5:D08E FAR size=42 callers=1
5:D08E  55                   push bp
5:D08F  8bec                 mov bp, sp
5:D091  66ff760c             push dword ptr [bp + 0xc]
5:D095  66ff7608             push dword ptr [bp + 8]
5:D099  ff7606               push word ptr [bp + 6]
5:D09C  9a9eb376d0           lcall 0xd076, 0xb39e  ; Building::Building(type,owner)@s6:B39E
5:D0A1  c45e06               les bx, ptr [bp + 6]
5:D0A4  26c70714d3           mov word ptr es:[bx], 0xd314
5:D0A9  26c7470284d0         mov word ptr es:[bx + 2], 0xd084  ; SEGMENT s5:0000
5:D0AF  8bc3                 mov ax, bx
5:D0B1  8cc2                 mov dx, es
5:D0B3  c9                   leave
5:D0B4  ca0a00               retf 0xa
5:D0B7  db 00

; ---------------- sub_s5:D0B8 FAR size=96 callers=0
5:D0B8  c80c0000             enter 0xc, 0
5:D0BC  c45e06               les bx, ptr [bp + 6]
5:D0BF  26837f1206           cmp word ptr es:[bx + 0x12], 6
5:D0C4  754e                 jne 0xd114
5:D0C6  06                   push es
5:D0C7  53                   push bx
5:D0C8  9af2b4e9d0           lcall 0xd0e9, 0xb4f2  ; sub_s6:B4F2
5:D0CD  8946fc               mov word ptr [bp - 4], ax
5:D0D0  8956fe               mov word ptr [bp - 2], dx
5:D0D3  c45efc               les bx, ptr [bp - 4]
5:D0D6  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
5:D0E0  7427                 je 0xd109
5:D0E2  66ff7606             push dword ptr [bp + 6]
5:D0E6  9a04cb07d1           lcall 0xd107, 0xcb04  ; sub_s6:CB04
5:D0EB  0bc0                 or ax, ax
5:D0ED  740d                 je 0xd0fc
5:D0EF  66ff7606             push dword ptr [bp + 6]
5:D0F3  90                   nop
5:D0F4  0e                   push cs
5:D0F5  e89c00               call 0xd194  ; sub_s5:D194
5:D0F8  0bc0                 or ax, ax
5:D0FA  7504                 jne 0xd100
loc_D0FC:
5:D0FC  6a06                 push 6
5:D0FE  eb0b                 jmp 0xd10b
loc_D100:
5:D100  66ff7606             push dword ptr [bp + 6]
5:D104  9a52c912d1           lcall 0xd112, 0xc952  ; sub_s6:C952
loc_D109:
5:D109  6a05                 push 5
loc_D10B:
5:D10B  66ff7606             push dword ptr [bp + 6]
5:D10F  9aacbd9fd0           lcall 0xd09f, 0xbdac  ; sub_s6:BDAC
loc_D114:
5:D114  c9                   leave
5:D115  ca0400               retf 4

; ---------------- sub_s5:D118 size=124 callers=0
5:D118  c8020000             enter 2, 0
5:D11C  66ff7612             push dword ptr [bp + 0x12]
5:D120  66ff760a             push dword ptr [bp + 0xa]
5:D124  66ff7606             push dword ptr [bp + 6]
5:D128  9ab6c745d1           lcall 0xd145, 0xc7b6  ; sub_s6:C7B6
5:D12D  3d0500               cmp ax, 5
5:D130  755a                 jne 0xd18c
5:D132  66ff7612             push dword ptr [bp + 0x12]
5:D136  66ff760e             push dword ptr [bp + 0xe]
5:D13A  66ff760a             push dword ptr [bp + 0xa]
5:D13E  66ff7606             push dword ptr [bp + 6]
5:D142  9a3ec25ed1           lcall 0xd15e, 0xc23e  ; sub_s6:C23E
5:D147  0bc0                 or ax, ax
5:D149  7432                 je 0xd17d
5:D14B  66ff7612             push dword ptr [bp + 0x12]
5:D14F  66ff760e             push dword ptr [bp + 0xe]
5:D153  66ff760a             push dword ptr [bp + 0xa]
5:D157  66ff7606             push dword ptr [bp + 6]
5:D15B  9aaac377d1           lcall 0xd177, 0xc3aa  ; sub_s6:C3AA
5:D160  0bc0                 or ax, ax
5:D162  7419                 je 0xd17d
5:D164  66ff7612             push dword ptr [bp + 0x12]
5:D168  66ff760e             push dword ptr [bp + 0xe]
5:D16C  66ff760a             push dword ptr [bp + 0xa]
5:D170  66ff7606             push dword ptr [bp + 6]
5:D174  9a14c3cbd0           lcall 0xd0cb, 0xc314  ; sub_s6:C314
5:D179  0bc0                 or ax, ax
5:D17B  7507                 jne 0xd184
loc_D17D:
5:D17D  33c0                 xor ax, ax
5:D17F  c9                   leave
5:D180  ca1000               retf 0x10
5:D183  db 90
loc_D184:
5:D184  b80100               mov ax, 1
5:D187  c9                   leave
5:D188  ca1000               retf 0x10
5:D18B  db 90
loc_D18C:
5:D18C  c706ca50a806         mov word ptr [0x50ca], 0x6a8
5:D192  ebe9                 jmp 0xd17d

; ---------------- sub_s5:D194 FAR size=346 callers=1
5:D194  c8340000             enter 0x34, 0
5:D198  8d46fe               lea ax, [bp - 2]
5:D19B  16                   push ss
5:D19C  50                   push ax
5:D19D  9aaebcecd1           lcall 0xd1ec, 0xbcae  ; sub_s7:BCAE
5:D1A2  66ff7606             push dword ptr [bp + 6]
5:D1A6  9af2b4c7d1           lcall 0xd1c7, 0xb4f2  ; sub_s6:B4F2
5:D1AB  8946fa               mov word ptr [bp - 6], ax
5:D1AE  8956fc               mov word ptr [bp - 4], dx
5:D1B1  c45efa               les bx, ptr [bp - 6]
5:D1B4  66268b4710           mov eax, dword ptr es:[bx + 0x10]
5:D1B9  668946f6             mov dword ptr [bp - 0xa], eax
5:D1BD  6650                 push eax
5:D1BF  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:D1C4  9aece1d6d1           lcall 0xd1d6, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:D1C9  8946f2               mov word ptr [bp - 0xe], ax
5:D1CC  8956f4               mov word ptr [bp - 0xc], dx
5:D1CF  66ff7606             push dword ptr [bp + 6]
5:D1D3  9a8eb52bd1           lcall 0xd12b, 0xb58e  ; DbObj::getOwner@s6:B58E
5:D1D8  8946ee               mov word ptr [bp - 0x12], ax
5:D1DB  8956f0               mov word ptr [bp - 0x10], dx
5:D1DE  52                   push dx
5:D1DF  50                   push ax
5:D1E0  66ff76f2             push dword ptr [bp - 0xe]
5:D1E4  8d46fe               lea ax, [bp - 2]
5:D1E7  16                   push ss
5:D1E8  50                   push ax
5:D1E9  9a74bd87d2           lcall 0xd287, 0xbd74  ; sub_s7:BD74
5:D1EE  8946ec               mov word ptr [bp - 0x14], ax
5:D1F1  0bc0                 or ax, ax
5:D1F3  7d07                 jge 0xd1fc
loc_D1F5:
5:D1F5  33c0                 xor ax, ax
5:D1F7  c9                   leave
5:D1F8  ca0400               retf 4
5:D1FB  db 90
loc_D1FC:
5:D1FC  3d1e00               cmp ax, 0x1e
5:D1FF  7e21                 jle 0xd222
5:D201  666809008700         push 0x870009
5:D207  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:D20C  9aba201cd2           lcall 0xd21c, 0x20ba  ; sub_s3:20BA
5:D211  8946e8               mov word ptr [bp - 0x18], ax
5:D214  8956ea               mov word ptr [bp - 0x16], dx
5:D217  52                   push dx
5:D218  50                   push ax
5:D219  9ad0653acf           lcall 0xcf3a, 0x65d0  ; sub_s3:65D0
5:D21E  0bc0                 or ax, ax
5:D220  7408                 je 0xd22a
loc_D222:
5:D222  b80100               mov ax, 1
5:D225  c9                   leave
5:D226  ca0400               retf 4
5:D229  db 90
loc_D22A:
5:D22A  6a15                 push 0x15
5:D22C  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
5:D231  9afac698ce           lcall 0xce98, 0xc6fa  ; sub_s2:C6FA
5:D236  8946e4               mov word ptr [bp - 0x1c], ax
5:D239  8956e6               mov word ptr [bp - 0x1a], dx
5:D23C  52                   push dx
5:D23D  50                   push ax
5:D23E  66ff76fa             push dword ptr [bp - 6]
5:D242  9a784eb35d           lcall 0x5db3, 0x4e78  ; sub_s8:4E78
5:D247  8946e0               mov word ptr [bp - 0x20], ax
5:D24A  8956e2               mov word ptr [bp - 0x1e], dx
5:D24D  52                   push dx
5:D24E  c45ee0               les bx, ptr [bp - 0x20]
5:D251  50                   push ax
5:D252  26c41f               les bx, ptr es:[bx]
5:D255  26ff5f10             lcall es:[bx + 0x10]
5:D259  8946dc               mov word ptr [bp - 0x24], ax
5:D25C  8956de               mov word ptr [bp - 0x22], dx
5:D25F  66c746d800000000     mov dword ptr [bp - 0x28], 0
5:D267  eb05                 jmp 0xd26e
5:D269  db 90
loc_D26A:
5:D26A  66ff46d8             inc dword ptr [bp - 0x28]
loc_D26E:
5:D26E  668b46dc             mov eax, dword ptr [bp - 0x24]
5:D272  663946d8             cmp dword ptr [bp - 0x28], eax
5:D276  7352                 jae 0xd2ca
5:D278  66ff76ee             push dword ptr [bp - 0x12]
5:D27C  66ff76d8             push dword ptr [bp - 0x28]
5:D280  66ff76e0             push dword ptr [bp - 0x20]
5:D284  9a581d99d2           lcall 0xd299, 0x1d58  ; sub_s7:1D58
5:D289  8946d4               mov word ptr [bp - 0x2c], ax
5:D28C  8956d6               mov word ptr [bp - 0x2a], dx
5:D28F  52                   push dx
5:D290  50                   push ax
5:D291  8d46fe               lea ax, [bp - 2]
5:D294  16                   push ss
5:D295  50                   push ax
5:D296  9a74bd0ed0           lcall 0xd00e, 0xbd74  ; sub_s7:BD74
5:D29B  8946ec               mov word ptr [bp - 0x14], ax
5:D29E  0bc0                 or ax, ax
5:D2A0  7ec8                 jle 0xd26a
5:D2A2  3d1e00               cmp ax, 0x1e
5:D2A5  7fc3                 jg 0xd26a
5:D2A7  668b46e0             mov eax, dword ptr [bp - 0x20]
5:D2AB  668946cc             mov dword ptr [bp - 0x34], eax
5:D2AF  668946d0             mov dword ptr [bp - 0x30], eax
5:D2B3  660bc0               or eax, eax
5:D2B6  0f8468ff             je 0xd222
5:D2BA  6a01                 push 1
5:D2BC  c45ee0               les bx, ptr [bp - 0x20]
5:D2BF  06                   push es
5:D2C0  50                   push ax
5:D2C1  26c41f               les bx, ptr es:[bx]
5:D2C4  26ff1f               lcall es:[bx]
5:D2C7  e958ff               jmp 0xd222
loc_D2CA:
5:D2CA  668b46e0             mov eax, dword ptr [bp - 0x20]
5:D2CE  668946d0             mov dword ptr [bp - 0x30], eax
5:D2D2  668946cc             mov dword ptr [bp - 0x34], eax
5:D2D6  660bc0               or eax, eax
5:D2D9  0f8418ff             je 0xd1f5
5:D2DD  6a01                 push 1
5:D2DF  c45ee0               les bx, ptr [bp - 0x20]
5:D2E2  06                   push es
5:D2E3  50                   push ax
5:D2E4  26c41f               les bx, ptr es:[bx]
5:D2E7  26ff1f               lcall es:[bx]
5:D2EA  e908ff               jmp 0xd1f5
5:D2ED  db 00

; ---------------- sub_s5:D2EE FAR size=142 callers=0
5:D2EE  c8040000             enter 4, 0
5:D2F2  66ff7606             push dword ptr [bp + 6]
5:D2F6  9a18b4a9d1           lcall 0xd1a9, 0xb418  ; sub_s6:B418
5:D2FB  f6460a01             test byte ptr [bp + 0xa], 1
5:D2FF  7409                 je 0xd30a
5:D301  66ff7606             push dword ptr [bp + 6]
5:D305  9ace17f8cf           lcall 0xcff8, 0x17ce  ; operator_delete@s1:17CE
loc_D30A:
5:D30A  8b4606               mov ax, word ptr [bp + 6]
5:D30D  8b5608               mov dx, word ptr [bp + 8]
5:D310  c9                   leave
5:D311  ca0600               retf 6
5:D314  db ee d2 32 d3 56 bb 22 d3 8e 17 a0 d1 ec b5 26 d3
5:D324  db 1a b8 2a d3 1c bc 2e d3 38 bd 36 d3 18 d1 3e d3
5:D334  db 7e bc 3a d3 14 b5 42 d3 b8 d0 ad d0 16 bf 46 d3
5:D344  db 1a bf 4a d3 1e bf 4e d3 9e be 52 d3 22 bf 56 d3
5:D354  db f0 bb 5a d3 02 bc 5e d3 a8 b5 62 d3 ca b5 66 d3
5:D364  db e6 b4 6a d3 ec b4 6e d3 6e b4 72 d3 4a c6 76 d3
5:D374  db 22 c5 7a d3 d2 ce f9 d2

; ---------------- sub_s5:D37C FAR size=40 callers=1
5:D37C  55                   push bp
5:D37D  8bec                 mov bp, sp
5:D37F  66ff7606             push dword ptr [bp + 6]
5:D383  9a54b31ad3           lcall 0xd31a, 0xb354  ; Building::Building()@s6:B354
5:D388  c45e06               les bx, ptr [bp + 6]
5:D38B  26c747200000         mov word ptr es:[bx + 0x20], 0
5:D391  26c7073ed5           mov word ptr es:[bx], 0xd53e
5:D396  26c7470216d3         mov word ptr es:[bx + 2], 0xd316  ; SEGMENT s5:0000
5:D39C  8bc3                 mov ax, bx
5:D39E  8cc2                 mov dx, es
5:D3A0  c9                   leave
5:D3A1  ca0400               retf 4

; ---------------- sub_s5:D3A4 FAR size=48 callers=1
5:D3A4  55                   push bp
5:D3A5  8bec                 mov bp, sp
5:D3A7  66ff760e             push dword ptr [bp + 0xe]
5:D3AB  ff760c               push word ptr [bp + 0xc]
5:D3AE  66ff7606             push dword ptr [bp + 6]
5:D3B2  9a9eb386d3           lcall 0xd386, 0xb39e  ; Building::Building(type,owner)@s6:B39E
5:D3B7  8b460a               mov ax, word ptr [bp + 0xa]
5:D3BA  c45e06               les bx, ptr [bp + 6]
5:D3BD  26894720             mov word ptr es:[bx + 0x20], ax
5:D3C1  26c7073ed5           mov word ptr es:[bx], 0xd53e
5:D3C6  26c747029ad3         mov word ptr es:[bx + 2], 0xd39a  ; SEGMENT s5:0000
5:D3CC  8bc3                 mov ax, bx
5:D3CE  8cc2                 mov dx, es
5:D3D0  c9                   leave
5:D3D1  ca0c00               retf 0xc

; ---------------- sub_s5:D3D4 size=70 callers=0
5:D3D4  c80a0000             enter 0xa, 0
5:D3D8  66ff760a             push dword ptr [bp + 0xa]
5:D3DC  66ff7606             push dword ptr [bp + 6]
5:D3E0  9aecb5b5d3           lcall 0xd3b5, 0xb5ec  ; sub_s6:B5EC
5:D3E5  0bc0                 or ax, ax
5:D3E7  742c                 je 0xd415
5:D3E9  c45e06               les bx, ptr [bp + 6]
5:D3EC  268b4720             mov ax, word ptr es:[bx + 0x20]
5:D3F0  8946f6               mov word ptr [bp - 0xa], ax
5:D3F3  666a02               push 2
5:D3F6  8d46f6               lea ax, [bp - 0xa]
5:D3F9  16                   push ss
5:D3FA  50                   push ax
5:D3FB  66ff760a             push dword ptr [bp + 0xa]
5:D3FF  9a1c7e34d2           lcall 0xd234, 0x7e1c  ; File_write@s2:7E1C
5:D404  0bc0                 or ax, ax
5:D406  750a                 jne 0xd412
5:D408  c7061003d006         mov word ptr [0x310], 0x6d0
5:D40E  c9                   leave
5:D40F  ca0800               retf 8
loc_D412:
5:D412  b80100               mov ax, 1
loc_D415:
5:D415  c9                   leave
5:D416  ca0800               retf 8
5:D419  db 00

; ---------------- sub_s5:D41A FAR size=70 callers=0
5:D41A  c8100000             enter 0x10, 0
5:D41E  66ff760a             push dword ptr [bp + 0xa]
5:D422  66ff7606             push dword ptr [bp + 6]
5:D426  9a1ab8e3d3           lcall 0xd3e3, 0xb81a  ; sub_s6:B81A
5:D42B  0bc0                 or ax, ax
5:D42D  742c                 je 0xd45b
5:D42F  666a02               push 2
5:D432  8d46fe               lea ax, [bp - 2]
5:D435  16                   push ss
5:D436  50                   push ax
5:D437  66ff760a             push dword ptr [bp + 0xa]
5:D43B  9aee7d02d4           lcall 0xd402, 0x7dee  ; File_read@s2:7DEE
5:D440  0bc0                 or ax, ax
5:D442  750a                 jne 0xd44e
5:D444  c7061003d206         mov word ptr [0x310], 0x6d2
5:D44A  c9                   leave
5:D44B  ca0800               retf 8
loc_D44E:
5:D44E  8b46fe               mov ax, word ptr [bp - 2]
5:D451  c45e06               les bx, ptr [bp + 6]
5:D454  26894720             mov word ptr es:[bx + 0x20], ax
5:D458  b80100               mov ax, 1
loc_D45B:
5:D45B  c9                   leave
5:D45C  ca0800               retf 8
5:D45F  db 00

; ---------------- sub_s5:D460 FAR size=106 callers=0
5:D460  c8160000             enter 0x16, 0
5:D464  66ff7612             push dword ptr [bp + 0x12]
5:D468  66ff760e             push dword ptr [bp + 0xe]
5:D46C  66ff760a             push dword ptr [bp + 0xa]
5:D470  66ff7606             push dword ptr [bp + 6]
5:D474  9a90bc29d4           lcall 0xd429, 0xbc90  ; sub_s6:BC90
5:D479  0bc0                 or ax, ax
5:D47B  7449                 je 0xd4c6
5:D47D  6a11                 push 0x11
5:D47F  c41e3042             les bx, ptr [0x4230]
5:D483  26ff7716             push word ptr es:[bx + 0x16]
5:D487  66ff367c5b           push dword ptr [0x5b7c]
5:D48C  9a40af45d2           lcall 0xd245, 0xaf40  ; sub_s8:AF40
5:D491  c706805b0100         mov word ptr [0x5b80], 1
5:D497  1e                   push ds
5:D498  68805b               push 0x5b80
5:D49B  9a10953ed4           lcall 0xd43e, 0x9510  ; MessageLoop@s2:9510
5:D4A0  83c404               add sp, 4
5:D4A3  6a3a                 push 0x3a
5:D4A5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:D4AA  9aba200fd2           lcall 0xd20f, 0x20ba  ; sub_s3:20BA
5:D4AF  8946f8               mov word ptr [bp - 8], ax
5:D4B2  8956fa               mov word ptr [bp - 6], dx
5:D4B5  c45ef8               les bx, ptr [bp - 8]
5:D4B8  268b470a             mov ax, word ptr es:[bx + 0xa]
5:D4BC  c45e06               les bx, ptr [bp + 6]
5:D4BF  26894720             mov word ptr es:[bx + 0x20], ax
5:D4C3  b80100               mov ax, 1
loc_D4C6:
5:D4C6  c9                   leave
5:D4C7  ca1000               retf 0x10

; ---------------- sub_s5:D4CA size=78 callers=0
5:D4CA  c8140000             enter 0x14, 0
5:D4CE  c45e06               les bx, ptr [bp + 6]
5:D4D1  26837f2002           cmp word ptr es:[bx + 0x20], 2
5:D4D6  7508                 jne 0xd4e0
5:D4D8  b80100               mov ax, 1
5:D4DB  c9                   leave
5:D4DC  ca0400               retf 4
5:D4DF  db 90
loc_D4E0:
5:D4E0  06                   push es
5:D4E1  53                   push bx
5:D4E2  9a8eb577d4           lcall 0xd477, 0xb58e  ; DbObj::getOwner@s6:B58E
5:D4E7  8946fc               mov word ptr [bp - 4], ax
5:D4EA  8956fe               mov word ptr [bp - 2], dx
5:D4ED  c45efc               les bx, ptr [bp - 4]
5:D4F0  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:D4F5  6a63                 push 0x63
5:D4F7  6650                 push eax
5:D4F9  9ab03f8fd4           lcall 0xd48f, 0x3fb0  ; sub_s8:3FB0
5:D4FE  52                   push dx
5:D4FF  50                   push ax
5:D500  9ab2251ed3           lcall 0xd31e, 0x25b2  ; sub_s7:25B2
5:D505  0bc0                 or ax, ax
5:D507  7407                 je 0xd510
5:D509  33c0                 xor ax, ax
5:D50B  c9                   leave
5:D50C  ca0400               retf 4
5:D50F  db 90
loc_D510:
5:D510  b8ffff               mov ax, 0xffff
5:D513  c9                   leave
5:D514  ca0400               retf 4
5:D517  db 00

; ---------------- sub_s5:D518 FAR size=142 callers=0
5:D518  c8040000             enter 4, 0
5:D51C  66ff7606             push dword ptr [bp + 6]
5:D520  9a18b4e5d4           lcall 0xd4e5, 0xb418  ; sub_s6:B418
5:D525  f6460a01             test byte ptr [bp + 0xa], 1
5:D529  7409                 je 0xd534
5:D52B  66ff7606             push dword ptr [bp + 6]
5:D52F  9ace1708d3           lcall 0xd308, 0x17ce  ; operator_delete@s1:17CE
loc_D534:
5:D534  8b4606               mov ax, word ptr [bp + 6]
5:D537  8b5608               mov dx, word ptr [bp + 8]
5:D53A  c9                   leave
5:D53B  ca0600               retf 6
5:D53E  db 18 d5 4c d5 56 bb 54 d5 8e 17 03 d5 d4 d3 50 d5
5:D54E  db 1a d4 5c d5 1c bc 58 d5 38 bd 60 d5 60 d4 88 d5
5:D55E  db 7e bc 64 d5 14 b5 68 d5 2a be 6c d5 16 bf 70 d5
5:D56E  db 1a bf 74 d5 1e bf 78 d5 9e be 7c d5 22 bf 80 d5
5:D57E  db f0 bb 84 d5 02 bc 8c d5 ca d4 ca d3 ca b5 90 d5
5:D58E  db e6 b4 94 d5 ec b4 98 d5 6e b4 9c d5 4a c6 a0 d5
5:D59E  db 22 c5 a4 d5 d2 ce 23 d5

; ---------------- sub_s5:D5A6 FAR size=34 callers=1
5:D5A6  55                   push bp
5:D5A7  8bec                 mov bp, sp
5:D5A9  66ff7606             push dword ptr [bp + 6]
5:D5AD  9a54b344d5           lcall 0xd544, 0xb354  ; Building::Building()@s6:B354
5:D5B2  c45e06               les bx, ptr [bp + 6]
5:D5B5  26c707fed7           mov word ptr es:[bx], 0xd7fe
5:D5BA  26c7470240d5         mov word ptr es:[bx + 2], 0xd540  ; SEGMENT s5:0000
5:D5C0  8bc3                 mov ax, bx
5:D5C2  8cc2                 mov dx, es
5:D5C4  c9                   leave
5:D5C5  ca0400               retf 4

; ---------------- sub_s5:D5C8 FAR size=42 callers=1
5:D5C8  55                   push bp
5:D5C9  8bec                 mov bp, sp
5:D5CB  66ff760c             push dword ptr [bp + 0xc]
5:D5CF  66ff7608             push dword ptr [bp + 8]
5:D5D3  ff7606               push word ptr [bp + 6]
5:D5D6  9a9eb3b0d5           lcall 0xd5b0, 0xb39e  ; Building::Building(type,owner)@s6:B39E
5:D5DB  c45e06               les bx, ptr [bp + 6]
5:D5DE  26c707fed7           mov word ptr es:[bx], 0xd7fe
5:D5E3  26c74702bed5         mov word ptr es:[bx + 2], 0xd5be  ; SEGMENT s5:0000
5:D5E9  8bc3                 mov ax, bx
5:D5EB  8cc2                 mov dx, es
5:D5ED  c9                   leave
5:D5EE  ca0a00               retf 0xa
5:D5F1  db 00

; ---------------- sub_s5:D5F2 FAR size=244 callers=0
5:D5F2  c8380000             enter 0x38, 0
5:D5F6  57                   push di
5:D5F7  56                   push si
5:D5F8  66ff7606             push dword ptr [bp + 6]
5:D5FC  9a8eb52bd6           lcall 0xd62b, 0xb58e  ; DbObj::getOwner@s6:B58E
5:D601  8946fc               mov word ptr [bp - 4], ax
5:D604  8956fe               mov word ptr [bp - 2], dx
5:D607  050c00               add ax, 0xc
5:D60A  1e                   push ds
5:D60B  8d7ef6               lea di, [bp - 0xa]
5:D60E  8bf0                 mov si, ax
5:D610  16                   push ss
5:D611  07                   pop es
5:D612  8eda                 mov ds, dx
5:D614  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:D616  a5                   movsw word ptr es:[di], word ptr [si]
5:D617  1f                   pop ds
5:D618  8d46f6               lea ax, [bp - 0xa]
5:D61B  8946e6               mov word ptr [bp - 0x1a], ax
5:D61E  8b46fa               mov ax, word ptr [bp - 6]
5:D621  8946f4               mov word ptr [bp - 0xc], ax
5:D624  66ff7606             push dword ptr [bp + 6]
5:D628  9ab6ba6dd6           lcall 0xd66d, 0xbab6  ; sub_s6:BAB6
5:D62D  8946f0               mov word ptr [bp - 0x10], ax
5:D630  8956f2               mov word ptr [bp - 0xe], dx
5:D633  52                   push dx
5:D634  50                   push ax
5:D635  9aac2f7ed6           lcall 0xd67e, 0x2fac  ; sub_s7:2FAC
5:D63A  8946ee               mov word ptr [bp - 0x12], ax
5:D63D  8d7ee8               lea di, [bp - 0x18]
5:D640  8d76f6               lea si, [bp - 0xa]
5:D643  8cd0                 mov ax, ss
5:D645  8ec0                 mov es, ax
5:D647  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:D649  a5                   movsw word ptr es:[di], word ptr [si]
5:D64A  8d46e8               lea ax, [bp - 0x18]
5:D64D  8946de               mov word ptr [bp - 0x22], ax
5:D650  8b46ee               mov ax, word ptr [bp - 0x12]
5:D653  ff46f4               inc word ptr [bp - 0xc]
5:D656  3946f4               cmp word ptr [bp - 0xc], ax
5:D659  7d77                 jge 0xd6d2
5:D65B  8b46f4               mov ax, word ptr [bp - 0xc]
5:D65E  8946ec               mov word ptr [bp - 0x14], ax
5:D661  8d46d0               lea ax, [bp - 0x30]
5:D664  16                   push ss
5:D665  50                   push ax
5:D666  66ff7606             push dword ptr [bp + 6]
5:D66A  9a24bbadd6           lcall 0xd6ad, 0xbb24  ; sub_s6:BB24
5:D66F  52                   push dx
5:D670  50                   push ax
5:D671  8d46e8               lea ax, [bp - 0x18]
5:D674  16                   push ss
5:D675  50                   push ax
5:D676  66ff364057           push dword ptr [0x5740]
5:D67B  9ace64bad6           lcall 0xd6ba, 0x64ce  ; sub_s7:64CE
5:D680  8bd8                 mov bx, ax
5:D682  8ec2                 mov es, dx
5:D684  66268b07             mov eax, dword ptr es:[bx]
5:D688  268b5702             mov dx, word ptr es:[bx + 2]
5:D68C  668946da             mov dword ptr [bp - 0x26], eax
5:D690  668946de             mov dword ptr [bp - 0x22], eax
5:D694  668946c8             mov dword ptr [bp - 0x38], eax
5:D698  8a46cb               mov al, byte ptr [bp - 0x35]
5:D69B  2ae4                 sub ah, ah
5:D69D  a8ff                 test al, 0xff
5:D69F  7431                 je 0xd6d2
5:D6A1  52                   push dx
5:D6A2  ff76da               push word ptr [bp - 0x26]
5:D6A5  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:D6AA  9aece1ddd6           lcall 0xd6dd, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:D6AF  8946c8               mov word ptr [bp - 0x38], ax
5:D6B2  8956ca               mov word ptr [bp - 0x36], dx
5:D6B5  52                   push dx
5:D6B6  50                   push ax
5:D6B7  9aa87348d5           lcall 0xd548, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:D6BC  8946cc               mov word ptr [bp - 0x34], ax
5:D6BF  8956ce               mov word ptr [bp - 0x32], dx
5:D6C2  66ff760a             push dword ptr [bp + 0xa]
5:D6C6  52                   push dx
5:D6C7  c45ecc               les bx, ptr [bp - 0x34]
5:D6CA  50                   push ax
5:D6CB  26c41f               les bx, ptr es:[bx]
5:D6CE  26ff5f58             lcall es:[bx + 0x58]
loc_D6D2:
5:D6D2  66ff760a             push dword ptr [bp + 0xa]
5:D6D6  66ff7606             push dword ptr [bp + 6]
5:D6DA  9a6eb4d9d5           lcall 0xd5d9, 0xb46e  ; sub_s6:B46E
5:D6DF  5e                   pop si
5:D6E0  5f                   pop di
5:D6E1  c9                   leave
5:D6E2  ca0800               retf 8
5:D6E5  db 00

; ---------------- sub_s5:D6E6 FAR size=242 callers=0
5:D6E6  c8380000             enter 0x38, 0
5:D6EA  57                   push di
5:D6EB  56                   push si
5:D6EC  66ff7606             push dword ptr [bp + 6]
5:D6F0  9a14b5fcd6           lcall 0xd6fc, 0xb514  ; sub_s6:B514
5:D6F5  66ff7606             push dword ptr [bp + 6]
5:D6F9  9a8eb528d7           lcall 0xd728, 0xb58e  ; DbObj::getOwner@s6:B58E
5:D6FE  8946fc               mov word ptr [bp - 4], ax
5:D701  8956fe               mov word ptr [bp - 2], dx
5:D704  050c00               add ax, 0xc
5:D707  1e                   push ds
5:D708  8d7ef6               lea di, [bp - 0xa]
5:D70B  8bf0                 mov si, ax
5:D70D  16                   push ss
5:D70E  07                   pop es
5:D70F  8eda                 mov ds, dx
5:D711  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:D713  a5                   movsw word ptr es:[di], word ptr [si]
5:D714  1f                   pop ds
5:D715  8d46f6               lea ax, [bp - 0xa]
5:D718  8946e6               mov word ptr [bp - 0x1a], ax
5:D71B  8b46fa               mov ax, word ptr [bp - 6]
5:D71E  8946f4               mov word ptr [bp - 0xc], ax
5:D721  66ff7606             push dword ptr [bp + 6]
5:D725  9ab6ba6ad7           lcall 0xd76a, 0xbab6  ; sub_s6:BAB6
5:D72A  8946f0               mov word ptr [bp - 0x10], ax
5:D72D  8956f2               mov word ptr [bp - 0xe], dx
5:D730  52                   push dx
5:D731  50                   push ax
5:D732  9aac2f7bd7           lcall 0xd77b, 0x2fac  ; sub_s7:2FAC
5:D737  8946ee               mov word ptr [bp - 0x12], ax
5:D73A  8d7ee8               lea di, [bp - 0x18]
5:D73D  8d76f6               lea si, [bp - 0xa]
5:D740  8cd0                 mov ax, ss
5:D742  8ec0                 mov es, ax
5:D744  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:D746  a5                   movsw word ptr es:[di], word ptr [si]
5:D747  8d46e8               lea ax, [bp - 0x18]
5:D74A  8946de               mov word ptr [bp - 0x22], ax
5:D74D  8b46ee               mov ax, word ptr [bp - 0x12]
5:D750  ff46f4               inc word ptr [bp - 0xc]
5:D753  3946f4               cmp word ptr [bp - 0xc], ax
5:D756  7d7a                 jge 0xd7d2
5:D758  8b46f4               mov ax, word ptr [bp - 0xc]
5:D75B  8946ec               mov word ptr [bp - 0x14], ax
5:D75E  8d46d0               lea ax, [bp - 0x30]
5:D761  16                   push ss
5:D762  50                   push ax
5:D763  66ff7606             push dword ptr [bp + 6]
5:D767  9a24bbaad7           lcall 0xd7aa, 0xbb24  ; sub_s6:BB24
5:D76C  52                   push dx
5:D76D  50                   push ax
5:D76E  8d46e8               lea ax, [bp - 0x18]
5:D771  16                   push ss
5:D772  50                   push ax
5:D773  66ff364057           push dword ptr [0x5740]
5:D778  9ace64b7d7           lcall 0xd7b7, 0x64ce  ; sub_s7:64CE
5:D77D  8bd8                 mov bx, ax
5:D77F  8ec2                 mov es, dx
5:D781  66268b07             mov eax, dword ptr es:[bx]
5:D785  268b5702             mov dx, word ptr es:[bx + 2]
5:D789  668946da             mov dword ptr [bp - 0x26], eax
5:D78D  668946de             mov dword ptr [bp - 0x22], eax
5:D791  668946c8             mov dword ptr [bp - 0x38], eax
5:D795  8a46cb               mov al, byte ptr [bp - 0x35]
5:D798  2ae4                 sub ah, ah
5:D79A  a8ff                 test al, 0xff
5:D79C  7434                 je 0xd7d2
5:D79E  52                   push dx
5:D79F  ff76da               push word ptr [bp - 0x26]
5:D7A2  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:D7A7  9aece1ffd5           lcall 0xd5ff, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:D7AC  8946c8               mov word ptr [bp - 0x38], ax
5:D7AF  8956ca               mov word ptr [bp - 0x36], dx
5:D7B2  52                   push dx
5:D7B3  50                   push ax
5:D7B4  9aa87338d6           lcall 0xd638, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:D7B9  8946cc               mov word ptr [bp - 0x34], ax
5:D7BC  8956ce               mov word ptr [bp - 0x32], dx
5:D7BF  c45ecc               les bx, ptr [bp - 0x34]
5:D7C2  26837f0c6a           cmp word ptr es:[bx + 0xc], 0x6a
5:D7C7  7509                 jne 0xd7d2
5:D7C9  52                   push dx
5:D7CA  50                   push ax
5:D7CB  26c41f               les bx, ptr es:[bx]
5:D7CE  26ff5f24             lcall es:[bx + 0x24]
loc_D7D2:
5:D7D2  5e                   pop si
5:D7D3  5f                   pop di
5:D7D4  c9                   leave
5:D7D5  ca0400               retf 4

; ---------------- sub_s5:D7D8 size=142 callers=0
5:D7D8  c8040000             enter 4, 0
5:D7DC  66ff7606             push dword ptr [bp + 6]
5:D7E0  9a18b4f3d6           lcall 0xd6f3, 0xb418  ; sub_s6:B418
5:D7E5  f6460a01             test byte ptr [bp + 0xa], 1
5:D7E9  7409                 je 0xd7f4
5:D7EB  66ff7606             push dword ptr [bp + 6]
5:D7EF  9ace1732d5           lcall 0xd532, 0x17ce  ; operator_delete@s1:17CE
loc_D7F4:
5:D7F4  8b4606               mov ax, word ptr [bp + 6]
5:D7F7  8b5608               mov dx, word ptr [bp + 8]
5:D7FA  c9                   leave
5:D7FB  ca0600               retf 6
5:D7FE  db d8 d7 24 d8 56 bb 0c d8 8e 17 35 d7 ec b5 10 d8
5:D80E  db 1a b8 14 d8 1c bc 18 d8 38 bd 1c d8 90 bc 20 d8
5:D81E  db 7e bc 28 d8 e6 d6 58 d8 2a be 2c d8 16 bf 30 d8
5:D82E  db 1a bf 34 d8 1e bf 38 d8 9e be 3c d8 22 bf 40 d8
5:D83E  db f0 bb 44 d8 02 bc 48 d8 a8 b5 4c d8 ca b5 50 d8
5:D84E  db e6 b4 54 d8 ec b4 5c d8 f2 d5 e7 d5 4a c6 60 d8
5:D85E  db 22 c5 64 d8 d2 ce e3 d7

; ---------------- sub_s5:D866 FAR size=34 callers=1
5:D866  55                   push bp
5:D867  8bec                 mov bp, sp
5:D869  66ff7606             push dword ptr [bp + 6]
5:D86D  9a54b304d8           lcall 0xd804, 0xb354  ; Building::Building()@s6:B354
5:D872  c45e06               les bx, ptr [bp + 6]
5:D875  26c707ecd8           mov word ptr es:[bx], 0xd8ec
5:D87A  26c7470200d8         mov word ptr es:[bx + 2], 0xd800  ; SEGMENT s5:0000
5:D880  8bc3                 mov ax, bx
5:D882  8cc2                 mov dx, es
5:D884  c9                   leave
5:D885  ca0400               retf 4

; ---------------- sub_s5:D888 FAR size=42 callers=1
5:D888  55                   push bp
5:D889  8bec                 mov bp, sp
5:D88B  66ff760c             push dword ptr [bp + 0xc]
5:D88F  66ff7608             push dword ptr [bp + 8]
5:D893  ff7606               push word ptr [bp + 6]
5:D896  9a9eb370d8           lcall 0xd870, 0xb39e  ; Building::Building(type,owner)@s6:B39E
5:D89B  c45e06               les bx, ptr [bp + 6]
5:D89E  26c707ecd8           mov word ptr es:[bx], 0xd8ec
5:D8A3  26c747027ed8         mov word ptr es:[bx + 2], 0xd87e  ; SEGMENT s5:0000
5:D8A9  8bc3                 mov ax, bx
5:D8AB  8cc2                 mov dx, es
5:D8AD  c9                   leave
5:D8AE  ca0a00               retf 0xa
5:D8B1  db 00

; ---------------- sub_s5:D8B2 FAR size=4 callers=0
5:D8B2  ca0400               retf 4
5:D8B5  db 00

; ---------------- sub_s5:D8B6 FAR size=4 callers=0
5:D8B6  ca0400               retf 4
5:D8B9  db 00

; ---------------- sub_s5:D8BA FAR size=4 callers=0
5:D8BA  ca0600               retf 6
5:D8BD  db 00

; ---------------- sub_s5:D8BE FAR size=4 callers=0
5:D8BE  ca0400               retf 4
5:D8C1  db 00

; ---------------- sub_s5:D8C2 FAR size=4 callers=0
5:D8C2  ca0400               retf 4
5:D8C5  db 00

; ---------------- sub_s5:D8C6 FAR size=142 callers=0
5:D8C6  c8040000             enter 4, 0
5:D8CA  66ff7606             push dword ptr [bp + 6]
5:D8CE  9a18b499d8           lcall 0xd899, 0xb418  ; sub_s6:B418
5:D8D3  f6460a01             test byte ptr [bp + 0xa], 1
5:D8D7  7409                 je 0xd8e2
5:D8D9  66ff7606             push dword ptr [bp + 6]
5:D8DD  9ace17f2d7           lcall 0xd7f2, 0x17ce  ; operator_delete@s1:17CE
loc_D8E2:
5:D8E2  8b4606               mov ax, word ptr [bp + 6]
5:D8E5  8b5608               mov dx, word ptr [bp + 8]
5:D8E8  c9                   leave
5:D8E9  ca0600               retf 6
5:D8EC  db c6 d8 1a d9 56 bb fa d8 8e 17 08 d8 ec b5 fe d8
5:D8FC  db 1a b8 02 d9 1c bc 06 d9 38 bd 0a d9 90 bc 0e d9
5:D90C  db 7e bc 12 d9 14 b5 16 d9 2a be 2e d9 b2 d8 1e d9
5:D91C  db b6 d8 22 d9 ba d8 26 d9 be d8 2a d9 c2 d8 a7 d8
5:D92C  db f0 bb 32 d9 02 bc 36 d9 a8 b5 3a d9 ca b5 3e d9
5:D93C  db e6 b4 42 d9 ec b4 46 d9 6e b4 4a d9 4a c6 4e d9
5:D94C  db 22 c5 52 d9 d2 ce d1 d8

; ---------------- sub_s5:D954 FAR size=74 callers=1
5:D954  55                   push bp
5:D955  8bec                 mov bp, sp
5:D957  66ff7606             push dword ptr [bp + 6]
5:D95B  9a96dcf6d8           lcall 0xd8f6, 0xdc96  ; sub_s7:DC96
5:D960  6633c0               xor eax, eax
5:D963  c45e06               les bx, ptr [bp + 6]
5:D966  26894724             mov word ptr es:[bx + 0x24], ax
5:D96A  26894726             mov word ptr es:[bx + 0x26], ax
5:D96E  6626894728           mov dword ptr es:[bx + 0x28], eax
5:D973  26c70792e7           mov word ptr es:[bx], 0xe792
5:D978  26c74702eed8         mov word ptr es:[bx + 2], 0xd8ee  ; SEGMENT s5:0000
5:D97E  6a2f                 push 0x2f
5:D980  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:D985  9aba20add4           lcall 0xd4ad, 0x20ba  ; sub_s3:20BA
5:D98A  c45e06               les bx, ptr [bp + 6]
5:D98D  26894728             mov word ptr es:[bx + 0x28], ax
5:D991  2689572a             mov word ptr es:[bx + 0x2a], dx
5:D995  8bc3                 mov ax, bx
5:D997  8cc2                 mov dx, es
5:D999  c9                   leave
5:D99A  ca0400               retf 4
5:D99D  db 00

; ---------------- sub_s5:D99E FAR size=92 callers=1
5:D99E  55                   push bp
5:D99F  8bec                 mov bp, sp
5:D9A1  66ff760e             push dword ptr [bp + 0xe]
5:D9A5  ff760c               push word ptr [bp + 0xc]
5:D9A8  66ff7606             push dword ptr [bp + 6]
5:D9AC  9ac2dc5ed9           lcall 0xd95e, 0xdcc2  ; sub_s7:DCC2
5:D9B1  8b460a               mov ax, word ptr [bp + 0xa]
5:D9B4  c45e06               les bx, ptr [bp + 6]
5:D9B7  26894724             mov word ptr es:[bx + 0x24], ax
5:D9BB  26c747260000         mov word ptr es:[bx + 0x26], 0
5:D9C1  6626c7472800000000   mov dword ptr es:[bx + 0x28], 0
5:D9CA  26c70792e7           mov word ptr es:[bx], 0xe792
5:D9CF  26c747027cd9         mov word ptr es:[bx + 2], 0xd97c  ; SEGMENT s5:0000
5:D9D5  6a2f                 push 0x2f
5:D9D7  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:D9DC  9aba2088d9           lcall 0xd988, 0x20ba  ; sub_s3:20BA
5:D9E1  c45e06               les bx, ptr [bp + 6]
5:D9E4  26894728             mov word ptr es:[bx + 0x28], ax
5:D9E8  2689572a             mov word ptr es:[bx + 0x2a], dx
5:D9EC  26c747104900         mov word ptr es:[bx + 0x10], 0x49
5:D9F2  8bc3                 mov ax, bx
5:D9F4  8cc2                 mov dx, es
5:D9F6  c9                   leave
5:D9F7  ca0c00               retf 0xc

; ---------------- sub_s5:D9FA size=66 callers=0
5:D9FA  c8100000             enter 0x10, 0
5:D9FE  c45e06               les bx, ptr [bp + 6]
5:DA01  26837f0c79           cmp word ptr es:[bx + 0xc], 0x79
5:DA06  7430                 je 0xda38
5:DA08  ff760a               push word ptr [bp + 0xa]
5:DA0B  06                   push es
5:DA0C  53                   push bx
5:DA0D  9a0cdfafd9           lcall 0xd9af, 0xdf0c  ; sub_s7:DF0C
5:DA12  66ff7606             push dword ptr [bp + 6]
5:DA16  9a8eb5f2d8           lcall 0xd8f2, 0xb58e  ; DbObj::getOwner@s6:B58E
5:DA1B  8946fc               mov word ptr [bp - 4], ax
5:DA1E  8956fe               mov word ptr [bp - 2], dx
5:DA21  c45efc               les bx, ptr [bp - 4]
5:DA24  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:DA29  666800000200         push 0x20000
5:DA2F  6a01                 push 1
5:DA31  6650                 push eax
5:DA33  9adc57fcd4           lcall 0xd4fc, 0x57dc  ; sub_s8:57DC
loc_DA38:
5:DA38  c9                   leave
5:DA39  ca0600               retf 6

; ---------------- sub_s5:DA3C FAR size=18 callers=0
5:DA3C  55                   push bp
5:DA3D  8bec                 mov bp, sp
5:DA3F  6a02                 push 2
5:DA41  66ff7606             push dword ptr [bp + 6]
5:DA45  9aacbd19da           lcall 0xda19, 0xbdac  ; sub_s6:BDAC
5:DA4A  c9                   leave
5:DA4B  ca0400               retf 4

; ---------------- sub_s5:DA4E size=312 callers=0
5:DA4E  c8220000             enter 0x22, 0
5:DA52  8d46f4               lea ax, [bp - 0xc]
5:DA55  16                   push ss
5:DA56  50                   push ax
5:DA57  66ff7612             push dword ptr [bp + 0x12]
5:DA5B  66ff760a             push dword ptr [bp + 0xa]
5:DA5F  66ff364057           push dword ptr [0x5740]
5:DA64  9ace64a3da           lcall 0xdaa3, 0x64ce  ; sub_s7:64CE
5:DA69  8bd8                 mov bx, ax
5:DA6B  8ec2                 mov es, dx
5:DA6D  66268b07             mov eax, dword ptr es:[bx]
5:DA71  268b5702             mov dx, word ptr es:[bx + 2]
5:DA75  668946fc             mov dword ptr [bp - 4], eax
5:DA79  668946ea             mov dword ptr [bp - 0x16], eax
5:DA7D  668946e0             mov dword ptr [bp - 0x20], eax
5:DA81  8a46e3               mov al, byte ptr [bp - 0x1d]
5:DA84  2ae4                 sub ah, ah
5:DA86  a8ff                 test al, 0xff
5:DA88  7438                 je 0xdac2
5:DA8A  52                   push dx
5:DA8B  ff76fc               push word ptr [bp - 4]
5:DA8E  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:DA93  9aece1d1da           lcall 0xdad1, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:DA98  8946e0               mov word ptr [bp - 0x20], ax
5:DA9B  8956e2               mov word ptr [bp - 0x1e], dx
5:DA9E  52                   push dx
5:DA9F  50                   push ax
5:DAA0  9aa87310da           lcall 0xda10, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:DAA5  8946e4               mov word ptr [bp - 0x1c], ax
5:DAA8  8956e6               mov word ptr [bp - 0x1a], dx
5:DAAB  c45ee4               les bx, ptr [bp - 0x1c]
5:DAAE  26837f0c10           cmp word ptr es:[bx + 0xc], 0x10
5:DAB3  750d                 jne 0xdac2
5:DAB5  c706ca50a906         mov word ptr [0x50ca], 0x6a9
loc_DABB:
5:DABB  33c0                 xor ax, ax
5:DABD  c9                   leave
5:DABE  ca1000               retf 0x10
5:DAC1  db 90
loc_DAC2:
5:DAC2  66ff7612             push dword ptr [bp + 0x12]
5:DAC6  66ff760a             push dword ptr [bp + 0xa]
5:DACA  66ff7606             push dword ptr [bp + 6]
5:DACE  9ab6c705db           lcall 0xdb05, 0xc7b6  ; sub_s6:C7B6
5:DAD3  8946fa               mov word ptr [bp - 6], ax
5:DAD6  66ff7612             push dword ptr [bp + 0x12]
5:DADA  66ff760e             push dword ptr [bp + 0xe]
5:DADE  66ff760a             push dword ptr [bp + 0xa]
5:DAE2  c45e06               les bx, ptr [bp + 6]
5:DAE5  06                   push es
5:DAE6  53                   push bx
5:DAE7  26c41f               les bx, ptr es:[bx]
5:DAEA  26ff5f60             lcall es:[bx + 0x60]
5:DAEE  0bc0                 or ax, ax
5:DAF0  74c9                 je 0xdabb
5:DAF2  66ff7612             push dword ptr [bp + 0x12]
5:DAF6  66ff760e             push dword ptr [bp + 0xe]
5:DAFA  66ff760a             push dword ptr [bp + 0xa]
5:DAFE  66ff7606             push dword ptr [bp + 6]
5:DB02  9a3ec21edb           lcall 0xdb1e, 0xc23e  ; sub_s6:C23E
5:DB07  0bc0                 or ax, ax
5:DB09  74b0                 je 0xdabb
5:DB0B  66ff7612             push dword ptr [bp + 0x12]
5:DB0F  66ff760e             push dword ptr [bp + 0xe]
5:DB13  66ff760a             push dword ptr [bp + 0xa]
5:DB17  66ff7606             push dword ptr [bp + 6]
5:DB1B  9a14c348da           lcall 0xda48, 0xc314  ; sub_s6:C314
5:DB20  0bc0                 or ax, ax
5:DB22  7497                 je 0xdabb
5:DB24  c45e0a               les bx, ptr [bp + 0xa]
5:DB27  26837f0400           cmp word ptr es:[bx + 4], 0
5:DB2C  7522                 jne 0xdb50
5:DB2E  837efa04             cmp word ptr [bp - 6], 4
5:DB32  741c                 je 0xdb50
5:DB34  66ff7612             push dword ptr [bp + 0x12]
5:DB38  66ff760e             push dword ptr [bp + 0xe]
5:DB3C  06                   push es
5:DB3D  53                   push bx
5:DB3E  c45e06               les bx, ptr [bp + 6]
5:DB41  06                   push es
5:DB42  53                   push bx
5:DB43  26c41f               les bx, ptr es:[bx]
5:DB46  26ff5f5c             lcall es:[bx + 0x5c]
5:DB4A  0bc0                 or ax, ax
5:DB4C  0f846bff             je 0xdabb
loc_DB50:
5:DB50  c45e0a               les bx, ptr [bp + 0xa]
5:DB53  268b4704             mov ax, word ptr es:[bx + 4]
5:DB57  8946f8               mov word ptr [bp - 8], ax
5:DB5A  0bc0                 or ax, ax
5:DB5C  7514                 jne 0xdb72
5:DB5E  66ff7612             push dword ptr [bp + 0x12]
5:DB62  06                   push es
5:DB63  53                   push bx
5:DB64  66ff7606             push dword ptr [bp + 6]
5:DB68  90                   nop
5:DB69  0e                   push cs
5:DB6A  e83f03               call 0xdeac  ; sub_s5:DEAC
5:DB6D  c9                   leave
5:DB6E  ca1000               retf 0x10
5:DB71  db 90
loc_DB72:
5:DB72  66ff7612             push dword ptr [bp + 0x12]
5:DB76  06                   push es
5:DB77  53                   push bx
5:DB78  66ff7606             push dword ptr [bp + 6]
5:DB7C  90                   nop
5:DB7D  0e                   push cs
5:DB7E  e88f03               call 0xdf10  ; sub_s5:DF10
5:DB81  c9                   leave
5:DB82  ca1000               retf 0x10
5:DB85  db 00

; ---------------- sub_s5:DB86 FAR size=150 callers=0
5:DB86  c8160000             enter 0x16, 0
5:DB8A  8d46fe               lea ax, [bp - 2]
5:DB8D  16                   push ss
5:DB8E  50                   push ax
5:DB8F  9aaebcd8db           lcall 0xdbd8, 0xbcae  ; sub_s7:BCAE
5:DB94  66ff760e             push dword ptr [bp + 0xe]
5:DB98  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:DB9D  9aece1c6db           lcall 0xdbc6, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:DBA2  8946fa               mov word ptr [bp - 6], ax
5:DBA5  8956fc               mov word ptr [bp - 4], dx
5:DBA8  c45efa               les bx, ptr [bp - 6]
5:DBAB  66268b4710           mov eax, dword ptr es:[bx + 0x10]
5:DBB0  668946f6             mov dword ptr [bp - 0xa], eax
5:DBB4  66ff7612             push dword ptr [bp + 0x12]
5:DBB8  66ff760a             push dword ptr [bp + 0xa]
5:DBBC  6650                 push eax
5:DBBE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:DBC3  9aece196da           lcall 0xda96, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:DBC8  8946f2               mov word ptr [bp - 0xe], ax
5:DBCB  8956f4               mov word ptr [bp - 0xc], dx
5:DBCE  52                   push dx
5:DBCF  50                   push ax
5:DBD0  8d46fe               lea ax, [bp - 2]
5:DBD3  16                   push ss
5:DBD4  50                   push ax
5:DBD5  9adebc67da           lcall 0xda67, 0xbcde  ; sub_s7:BCDE
5:DBDA  8946f0               mov word ptr [bp - 0x10], ax
5:DBDD  0bc0                 or ax, ax
5:DBDF  7d0d                 jge 0xdbee
5:DBE1  c706ca50af06         mov word ptr [0x50ca], 0x6af
loc_DBE7:
5:DBE7  33c0                 xor ax, ax
5:DBE9  c9                   leave
5:DBEA  ca1000               retf 0x10
5:DBED  db 90
loc_DBEE:
5:DBEE  c45e0a               les bx, ptr [bp + 0xa]
5:DBF1  268b4704             mov ax, word ptr es:[bx + 4]
5:DBF5  8946ee               mov word ptr [bp - 0x12], ax
5:DBF8  837ef01e             cmp word ptr [bp - 0x10], 0x1e
5:DBFC  7e16                 jle 0xdc14
5:DBFE  0bc0                 or ax, ax
5:DC00  7e12                 jle 0xdc14
5:DC02  c706ca50b606         mov word ptr [0x50ca], 0x6b6
5:DC08  8b46f0               mov ax, word ptr [bp - 0x10]
5:DC0B  2d1e00               sub ax, 0x1e
5:DC0E  a3cc50               mov word ptr [0x50cc], ax
5:DC11  ebd4                 jmp 0xdbe7
5:DC13  db 90
loc_DC14:
5:DC14  b80100               mov ax, 1
5:DC17  c9                   leave
5:DC18  ca1000               retf 0x10
5:DC1B  db 00

; ---------------- sub_s5:DC1C FAR size=140 callers=1
5:DC1C  c81c0000             enter 0x1c, 0
5:DC20  8d46f8               lea ax, [bp - 8]
5:DC23  16                   push ss
5:DC24  50                   push ax
5:DC25  66ff7606             push dword ptr [bp + 6]
5:DC29  9a24bb6bdc           lcall 0xdc6b, 0xbb24  ; sub_s6:BB24
5:DC2E  52                   push dx
5:DC2F  50                   push ax
5:DC30  66ff760a             push dword ptr [bp + 0xa]
5:DC34  66ff364057           push dword ptr [0x5740]
5:DC39  9ace6478dc           lcall 0xdc78, 0x64ce  ; sub_s7:64CE
5:DC3E  8bd8                 mov bx, ax
5:DC40  8ec2                 mov es, dx
5:DC42  66268b07             mov eax, dword ptr es:[bx]
5:DC46  268b5702             mov dx, word ptr es:[bx + 2]
5:DC4A  668946fc             mov dword ptr [bp - 4], eax
5:DC4E  668946ee             mov dword ptr [bp - 0x12], eax
5:DC52  668946e4             mov dword ptr [bp - 0x1c], eax
5:DC56  8a46e7               mov al, byte ptr [bp - 0x19]
5:DC59  2ae4                 sub ah, ah
5:DC5B  a8ff                 test al, 0xff
5:DC5D  7445                 je 0xdca4
5:DC5F  52                   push dx
5:DC60  ff76fc               push word ptr [bp - 4]
5:DC63  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:DC68  9aece1a0db           lcall 0xdba0, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:DC6D  8946e4               mov word ptr [bp - 0x1c], ax
5:DC70  8956e6               mov word ptr [bp - 0x1a], dx
5:DC73  52                   push dx
5:DC74  50                   push ax
5:DC75  9aa87392db           lcall 0xdb92, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:DC7A  8946e8               mov word ptr [bp - 0x18], ax
5:DC7D  8956ea               mov word ptr [bp - 0x16], dx
5:DC80  c45ee8               les bx, ptr [bp - 0x18]
5:DC83  268b470c             mov ax, word ptr es:[bx + 0xc]
5:DC87  48                   dec ax
5:DC88  7c11                 jl 0xdc9b
5:DC8A  700f                 jo 0xdc9b
5:DC8C  2d0800               sub ax, 8
5:DC8F  7e13                 jle 0xdca4
5:DC91  2d6a00               sub ax, 0x6a
5:DC94  7c05                 jl 0xdc9b
5:DC96  2d0600               sub ax, 6
5:DC99  7e09                 jle 0xdca4
loc_DC9B:
5:DC9B  52                   push dx
5:DC9C  53                   push bx
5:DC9D  26c41f               les bx, ptr es:[bx]
5:DCA0  26ff5f24             lcall es:[bx + 0x24]
loc_DCA4:
5:DCA4  c9                   leave
5:DCA5  ca0800               retf 8

; ---------------- sub_s5:DCA8 FAR size=394 callers=1
5:DCA8  c82c0000             enter 0x2c, 0
5:DCAC  57                   push di
5:DCAD  56                   push si
5:DCAE  8d46fe               lea ax, [bp - 2]
5:DCB1  16                   push ss
5:DCB2  50                   push ax
5:DCB3  8d46fc               lea ax, [bp - 4]
5:DCB6  16                   push ss
5:DCB7  50                   push ax
5:DCB8  66ff7606             push dword ptr [bp + 6]
5:DCBC  9af8c1c8dc           lcall 0xdcc8, 0xc1f8  ; sub_s6:C1F8
5:DCC1  66ff7606             push dword ptr [bp + 6]
5:DCC5  9a8eb52cdc           lcall 0xdc2c, 0xb58e  ; DbObj::getOwner@s6:B58E
5:DCCA  8946f8               mov word ptr [bp - 8], ax
5:DCCD  8956fa               mov word ptr [bp - 6], dx
5:DCD0  050c00               add ax, 0xc
5:DCD3  1e                   push ds
5:DCD4  8d7ef2               lea di, [bp - 0xe]
5:DCD7  8bf0                 mov si, ax
5:DCD9  16                   push ss
5:DCDA  07                   pop es
5:DCDB  8eda                 mov ds, dx
5:DCDD  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:DCDF  a5                   movsw word ptr es:[di], word ptr [si]
5:DCE0  1f                   pop ds
5:DCE1  8d46f2               lea ax, [bp - 0xe]
5:DCE4  8946e2               mov word ptr [bp - 0x1e], ax
5:DCE7  8b46f2               mov ax, word ptr [bp - 0xe]
5:DCEA  8946f0               mov word ptr [bp - 0x10], ax
5:DCED  8b46f4               mov ax, word ptr [bp - 0xc]
5:DCF0  8946ee               mov word ptr [bp - 0x12], ax
5:DCF3  8b46f6               mov ax, word ptr [bp - 0xa]
5:DCF6  8946ec               mov word ptr [bp - 0x14], ax
5:DCF9  8b46f0               mov ax, word ptr [bp - 0x10]
5:DCFC  48                   dec ax
5:DCFD  7902                 jns 0xdd01
5:DCFF  33c0                 xor ax, ax
loc_DD01:
5:DD01  8946ea               mov word ptr [bp - 0x16], ax
5:DD04  8b4ef0               mov cx, word ptr [bp - 0x10]
5:DD07  41                   inc cx
5:DD08  8b56fe               mov dx, word ptr [bp - 2]
5:DD0B  4a                   dec dx
5:DD0C  3bca                 cmp cx, dx
5:DD0E  7e02                 jle 0xdd12
5:DD10  8bca                 mov cx, dx
loc_DD12:
5:DD12  894ee8               mov word ptr [bp - 0x18], cx
5:DD15  8b4eee               mov cx, word ptr [bp - 0x12]
5:DD18  49                   dec cx
5:DD19  7902                 jns 0xdd1d
5:DD1B  33c9                 xor cx, cx
loc_DD1D:
5:DD1D  894ee6               mov word ptr [bp - 0x1a], cx
5:DD20  8b5eee               mov bx, word ptr [bp - 0x12]
5:DD23  43                   inc bx
5:DD24  3bda                 cmp bx, dx
5:DD26  7e02                 jle 0xdd2a
5:DD28  8bda                 mov bx, dx
loc_DD2A:
5:DD2A  895ee4               mov word ptr [bp - 0x1c], bx
5:DD2D  50                   push ax
5:DD2E  51                   push cx
5:DD2F  ff76ec               push word ptr [bp - 0x14]
5:DD32  8d46d4               lea ax, [bp - 0x2c]
5:DD35  16                   push ss
5:DD36  50                   push ax
5:DD37  9a543e5bdd           lcall 0xdd5b, 0x3e54  ; sub_s2:3E54
5:DD3C  8d46d4               lea ax, [bp - 0x2c]
5:DD3F  16                   push ss
5:DD40  50                   push ax
5:DD41  66ff7606             push dword ptr [bp + 6]
5:DD45  90                   nop
5:DD46  0e                   push cs
5:DD47  e8d2fe               call 0xdc1c  ; sub_s5:DC1C
5:DD4A  ff76f0               push word ptr [bp - 0x10]
5:DD4D  ff76e6               push word ptr [bp - 0x1a]
5:DD50  ff76ec               push word ptr [bp - 0x14]
5:DD53  8d46d4               lea ax, [bp - 0x2c]
5:DD56  16                   push ss
5:DD57  50                   push ax
5:DD58  9a543e7add           lcall 0xdd7a, 0x3e54  ; sub_s2:3E54
5:DD5D  8d46d4               lea ax, [bp - 0x2c]
5:DD60  16                   push ss
5:DD61  50                   push ax
5:DD62  66ff7606             push dword ptr [bp + 6]
5:DD66  90                   nop
5:DD67  0e                   push cs
5:DD68  e8b1fe               call 0xdc1c  ; sub_s5:DC1C
5:DD6B  66ff76e6             push dword ptr [bp - 0x1a]
5:DD6F  ff76ec               push word ptr [bp - 0x14]
5:DD72  8d46d4               lea ax, [bp - 0x2c]
5:DD75  16                   push ss
5:DD76  50                   push ax
5:DD77  9a543e99dd           lcall 0xdd99, 0x3e54  ; sub_s2:3E54
5:DD7C  8d46d4               lea ax, [bp - 0x2c]
5:DD7F  16                   push ss
5:DD80  50                   push ax
5:DD81  66ff7606             push dword ptr [bp + 6]
5:DD85  90                   nop
5:DD86  0e                   push cs
5:DD87  e892fe               call 0xdc1c  ; sub_s5:DC1C
5:DD8A  ff76ea               push word ptr [bp - 0x16]
5:DD8D  66ff76ec             push dword ptr [bp - 0x14]
5:DD91  8d46d4               lea ax, [bp - 0x2c]
5:DD94  16                   push ss
5:DD95  50                   push ax
5:DD96  9a543eb8dd           lcall 0xddb8, 0x3e54  ; sub_s2:3E54
5:DD9B  8d46d4               lea ax, [bp - 0x2c]
5:DD9E  16                   push ss
5:DD9F  50                   push ax
5:DDA0  66ff7606             push dword ptr [bp + 6]
5:DDA4  90                   nop
5:DDA5  0e                   push cs
5:DDA6  e873fe               call 0xdc1c  ; sub_s5:DC1C
5:DDA9  ff76e8               push word ptr [bp - 0x18]
5:DDAC  66ff76ec             push dword ptr [bp - 0x14]
5:DDB0  8d46d4               lea ax, [bp - 0x2c]
5:DDB3  16                   push ss
5:DDB4  50                   push ax
5:DDB5  9a543ed9dd           lcall 0xddd9, 0x3e54  ; sub_s2:3E54
5:DDBA  8d46d4               lea ax, [bp - 0x2c]
5:DDBD  16                   push ss
5:DDBE  50                   push ax
5:DDBF  66ff7606             push dword ptr [bp + 6]
5:DDC3  90                   nop
5:DDC4  0e                   push cs
5:DDC5  e854fe               call 0xdc1c  ; sub_s5:DC1C
5:DDC8  ff76ea               push word ptr [bp - 0x16]
5:DDCB  ff76e4               push word ptr [bp - 0x1c]
5:DDCE  ff76ec               push word ptr [bp - 0x14]
5:DDD1  8d46d4               lea ax, [bp - 0x2c]
5:DDD4  16                   push ss
5:DDD5  50                   push ax
5:DDD6  9a543efadd           lcall 0xddfa, 0x3e54  ; sub_s2:3E54
5:DDDB  8d46d4               lea ax, [bp - 0x2c]
5:DDDE  16                   push ss
5:DDDF  50                   push ax
5:DDE0  66ff7606             push dword ptr [bp + 6]
5:DDE4  90                   nop
5:DDE5  0e                   push cs
5:DDE6  e833fe               call 0xdc1c  ; sub_s5:DC1C
5:DDE9  ff76f0               push word ptr [bp - 0x10]
5:DDEC  ff76e4               push word ptr [bp - 0x1c]
5:DDEF  ff76ec               push word ptr [bp - 0x14]
5:DDF2  8d46d4               lea ax, [bp - 0x2c]
5:DDF5  16                   push ss
5:DDF6  50                   push ax
5:DDF7  9a543e1bde           lcall 0xde1b, 0x3e54  ; sub_s2:3E54
5:DDFC  8d46d4               lea ax, [bp - 0x2c]
5:DDFF  16                   push ss
5:DE00  50                   push ax
5:DE01  66ff7606             push dword ptr [bp + 6]
5:DE05  90                   nop
5:DE06  0e                   push cs
5:DE07  e812fe               call 0xdc1c  ; sub_s5:DC1C
5:DE0A  ff76e8               push word ptr [bp - 0x18]
5:DE0D  ff76e4               push word ptr [bp - 0x1c]
5:DE10  ff76ec               push word ptr [bp - 0x14]
5:DE13  8d46d4               lea ax, [bp - 0x2c]
5:DE16  16                   push ss
5:DE17  50                   push ax
5:DE18  9a543e9ed4           lcall 0xd49e, 0x3e54  ; sub_s2:3E54
5:DE1D  8d46d4               lea ax, [bp - 0x2c]
5:DE20  16                   push ss
5:DE21  50                   push ax
5:DE22  66ff7606             push dword ptr [bp + 6]
5:DE26  90                   nop
5:DE27  0e                   push cs
5:DE28  e8f1fd               call 0xdc1c  ; sub_s5:DC1C
5:DE2B  5e                   pop si
5:DE2C  5f                   pop di
5:DE2D  c9                   leave
5:DE2E  ca0400               retf 4
5:DE31  db 00

; ---------------- sub_s5:DE32 FAR size=122 callers=2
5:DE32  c80e0000             enter 0xe, 0
5:DE36  6a05                 push 5
5:DE38  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:DE3D  9aba20dfd9           lcall 0xd9df, 0x20ba  ; sub_s3:20BA
5:DE42  8ec2                 mov es, dx
5:DE44  8bd8                 mov bx, ax
5:DE46  8946fc               mov word ptr [bp - 4], ax
5:DE49  8c46fe               mov word ptr [bp - 2], es
5:DE4C  8b460a               mov ax, word ptr [bp + 0xa]
5:DE4F  26894712             mov word ptr es:[bx + 0x12], ax
5:DE53  6a04                 push 4
5:DE55  66ff367c5b           push dword ptr [0x5b7c]
5:DE5A  9a2eb775de           lcall 0xde75, 0xb72e  ; sub_s8:B72E
5:DE5F  0bc0                 or ax, ax
5:DE61  7514                 jne 0xde77
5:DE63  6a04                 push 4
5:DE65  c41e3042             les bx, ptr [0x4230]
5:DE69  26ff7716             push word ptr es:[bx + 0x16]
5:DE6D  66ff367c5b           push dword ptr [0x5b7c]
5:DE72  9a40af36da           lcall 0xda36, 0xaf40  ; sub_s8:AF40
loc_DE77:
5:DE77  c706805b0100         mov word ptr [0x5b80], 1
5:DE7D  1e                   push ds
5:DE7E  68805b               push 0x5b80
5:DE81  9a10953add           lcall 0xdd3a, 0x9510  ; MessageLoop@s2:9510
5:DE86  83c404               add sp, 4
5:DE89  c45efc               les bx, ptr [bp - 4]
5:DE8C  268b470a             mov ax, word ptr es:[bx + 0xa]
5:DE90  c45e06               les bx, ptr [bp + 6]
5:DE93  26894724             mov word ptr es:[bx + 0x24], ax
5:DE97  c45e06               les bx, ptr [bp + 6]
5:DE9A  26837f2400           cmp word ptr es:[bx + 0x24], 0
5:DE9F  7506                 jne 0xdea7
5:DEA1  c706ca50b206         mov word ptr [0x50ca], 0x6b2
loc_DEA7:
5:DEA7  c9                   leave
5:DEA8  ca0600               retf 6
5:DEAB  db 00

; ---------------- sub_s5:DEAC FAR size=100 callers=1
5:DEAC  c8040000             enter 4, 0
5:DEB0  c746fe0000           mov word ptr [bp - 2], 0
5:DEB5  66ff760e             push dword ptr [bp + 0xe]
5:DEB9  66ff760a             push dword ptr [bp + 0xa]
5:DEBD  66ff7606             push dword ptr [bp + 6]
5:DEC1  9ab6c7bfdc           lcall 0xdcbf, 0xc7b6  ; sub_s6:C7B6
5:DEC6  8946fc               mov word ptr [bp - 4], ax
5:DEC9  48                   dec ax
5:DECA  7c3c                 jl 0xdf08
5:DECC  703a                 jo 0xdf08
5:DECE  48                   dec ax
5:DECF  48                   dec ax
5:DED0  7e06                 jle 0xded8
5:DED2  48                   dec ax
5:DED3  7413                 je 0xdee8
5:DED5  48                   dec ax
5:DED6  7530                 jne 0xdf08
loc_DED8:
5:DED8  b80100               mov ax, 1
5:DEDB  c45e06               les bx, ptr [bp + 6]
5:DEDE  26894724             mov word ptr es:[bx + 0x24], ax
loc_DEE2:
5:DEE2  8946fe               mov word ptr [bp - 2], ax
5:DEE5  eb21                 jmp 0xdf08
5:DEE7  db 90
loc_DEE8:
5:DEE8  ff76fc               push word ptr [bp - 4]
5:DEEB  66ff7606             push dword ptr [bp + 6]
5:DEEF  90                   nop
5:DEF0  0e                   push cs
5:DEF1  e83eff               call 0xde32  ; sub_s5:DE32
5:DEF4  c45e06               les bx, ptr [bp + 6]
5:DEF7  26837f2406           cmp word ptr es:[bx + 0x24], 6
5:DEFC  7506                 jne 0xdf04
5:DEFE  b80100               mov ax, 1
5:DF01  ebdf                 jmp 0xdee2
5:DF03  db 90
loc_DF04:
5:DF04  33c0                 xor ax, ax
5:DF06  ebda                 jmp 0xdee2
loc_DF08:
5:DF08  8b46fe               mov ax, word ptr [bp - 2]
5:DF0B  c9                   leave
5:DF0C  ca0c00               retf 0xc
5:DF0F  db 00

; ---------------- sub_s5:DF10 FAR size=308 callers=1
5:DF10  c8200000             enter 0x20, 0
5:DF14  c746fe0000           mov word ptr [bp - 2], 0
5:DF19  66ff760e             push dword ptr [bp + 0xe]
5:DF1D  66ff760a             push dword ptr [bp + 0xa]
5:DF21  66ff7606             push dword ptr [bp + 6]
5:DF25  9ab6c78cdf           lcall 0xdf8c, 0xc7b6  ; sub_s6:C7B6
5:DF2A  8946fc               mov word ptr [bp - 4], ax
5:DF2D  0bc0                 or ax, ax
5:DF2F  7415                 je 0xdf46
5:DF31  2d0600               sub ax, 6
5:DF34  0f8c0401             jl 0xe03c
5:DF38  0f800001             jo 0xe03c
5:DF3C  2d0300               sub ax, 3
5:DF3F  0f8e9500             jle 0xdfd8
5:DF43  e9f600               jmp 0xe03c
loc_DF46:
5:DF46  8d46f4               lea ax, [bp - 0xc]
5:DF49  16                   push ss
5:DF4A  50                   push ax
5:DF4B  66ff760e             push dword ptr [bp + 0xe]
5:DF4F  66ff760a             push dword ptr [bp + 0xa]
5:DF53  66ff364057           push dword ptr [0x5740]
5:DF58  9ace6499df           lcall 0xdf99, 0x64ce  ; sub_s7:64CE
5:DF5D  8bd8                 mov bx, ax
5:DF5F  8ec2                 mov es, dx
5:DF61  66268b07             mov eax, dword ptr es:[bx]
5:DF65  268b5702             mov dx, word ptr es:[bx + 2]
5:DF69  668946f8             mov dword ptr [bp - 8], eax
5:DF6D  668946ea             mov dword ptr [bp - 0x16], eax
5:DF71  668946e0             mov dword ptr [bp - 0x20], eax
5:DF75  8a46e3               mov al, byte ptr [bp - 0x1d]
5:DF78  2ae4                 sub ah, ah
5:DF7A  a8ff                 test al, 0xff
5:DF7C  0f84bc00             je 0xe03c
5:DF80  52                   push dx
5:DF81  ff76f8               push word ptr [bp - 8]
5:DF84  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:DF89  9aece1c4de           lcall 0xdec4, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:DF8E  8946e0               mov word ptr [bp - 0x20], ax
5:DF91  8956e2               mov word ptr [bp - 0x1e], dx
5:DF94  52                   push dx
5:DF95  50                   push ax
5:DF96  9aa8733cdc           lcall 0xdc3c, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:DF9B  8946e4               mov word ptr [bp - 0x1c], ax
5:DF9E  8956e6               mov word ptr [bp - 0x1a], dx
5:DFA1  c45ee4               les bx, ptr [bp - 0x1c]
5:DFA4  26837f0c6a           cmp word ptr es:[bx + 0xc], 0x6a
5:DFA9  0f858f00             jne 0xe03c
5:DFAD  66ff7606             push dword ptr [bp + 6]
5:DFB1  90                   nop
5:DFB2  0e                   push cs
5:DFB3  e88e00               call 0xe044  ; sub_s5:E044
5:DFB6  0bc0                 or ax, ax
5:DFB8  740e                 je 0xdfc8
5:DFBA  c706ca50ac06         mov word ptr [0x50ca], 0x6ac
loc_DFC0:
5:DFC0  c746fe0000           mov word ptr [bp - 2], 0
5:DFC5  eb75                 jmp 0xe03c
5:DFC7  db 90
loc_DFC8:
5:DFC8  b80100               mov ax, 1
5:DFCB  c45e06               les bx, ptr [bp + 6]
5:DFCE  26894724             mov word ptr es:[bx + 0x24], ax
5:DFD2  8946fe               mov word ptr [bp - 2], ax
5:DFD5  eb65                 jmp 0xe03c
5:DFD7  db 90
loc_DFD8:
5:DFD8  ff76fc               push word ptr [bp - 4]
5:DFDB  66ff7606             push dword ptr [bp + 6]
5:DFDF  90                   nop
5:DFE0  0e                   push cs
5:DFE1  e84efe               call 0xde32  ; sub_s5:DE32
5:DFE4  c45e06               les bx, ptr [bp + 6]
5:DFE7  268b4724             mov ax, word ptr es:[bx + 0x24]
5:DFEB  eb33                 jmp 0xe020
5:DFED  db 90
loc_DFEE:
5:DFEE  66ff7606             push dword ptr [bp + 6]
5:DFF2  90                   nop
5:DFF3  0e                   push cs
5:DFF4  e84d00               call 0xe044  ; sub_s5:E044
5:DFF7  0bc0                 or ax, ax
5:DFF9  7441                 je 0xe03c
5:DFFB  c706ca50ac06         mov word ptr [0x50ca], 0x6ac
5:E001  eb39                 jmp 0xe03c
5:E003  db 90
loc_E004:
5:E004  66ff760e             push dword ptr [bp + 0xe]
5:E008  66ff760a             push dword ptr [bp + 0xa]
5:E00C  66ff7606             push dword ptr [bp + 6]
5:E010  90                   nop
5:E011  0e                   push cs
5:E012  e83d06               call 0xe652  ; sub_s5:E652
5:E015  0bc0                 or ax, ax
5:E017  7423                 je 0xe03c
loc_E019:
5:E019  c746fe0100           mov word ptr [bp - 2], 1
5:E01E  eb1c                 jmp 0xe03c
loc_E020:
5:E020  3d0600               cmp ax, 6
5:E023  7717                 ja 0xe03c
5:E025  03c0                 add ax, ax
5:E027  93                   xchg bx, ax
5:E028  2effa72ee0           jmp word ptr cs:[bx - 0x1fd2]
5:E02D  db 90
switch_table_E02E:
    dw loc_DFC0
    dw loc_DFEE
    dw loc_E004
    dw loc_E004
    dw loc_E004
    dw loc_E004
    dw loc_E019
loc_E03C:
5:E03C  8b46fe               mov ax, word ptr [bp - 2]
5:E03F  c9                   leave
5:E040  ca0c00               retf 0xc
5:E043  db 00

; ---------------- sub_s5:E044 FAR size=74 callers=1
5:E044  c8100000             enter 0x10, 0
5:E048  c45e06               les bx, ptr [bp + 6]
5:E04B  6626ff7728           push dword ptr es:[bx + 0x28]
5:E050  9ab8048890           lcall 0x9088, 0x4b8  ; sub_s4:04B8
5:E055  52                   push dx
5:E056  50                   push ax
5:E057  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:E05C  9aece128df           lcall 0xdf28, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:E061  52                   push dx
5:E062  50                   push ax
5:E063  9aac2f5bdf           lcall 0xdf5b, 0x2fac  ; sub_s7:2FAC
5:E068  8946f6               mov word ptr [bp - 0xa], ax
5:E06B  c45e06               les bx, ptr [bp + 6]
5:E06E  26c45f28             les bx, ptr es:[bx + 0x28]
5:E072  268b471e             mov ax, word ptr es:[bx + 0x1e]
5:E076  8946f4               mov word ptr [bp - 0xc], ax
5:E079  8b46f6               mov ax, word ptr [bp - 0xa]
5:E07C  3946f4               cmp word ptr [bp - 0xc], ax
5:E07F  7c07                 jl 0xe088
5:E081  b80100               mov ax, 1
5:E084  c9                   leave
5:E085  ca0400               retf 4
loc_E088:
5:E088  33c0                 xor ax, ax
5:E08A  c9                   leave
5:E08B  ca0400               retf 4

; ---------------- sub_s5:E08E FAR size=518 callers=1
5:E08E  c85e0100             enter 0x15e, 0
5:E092  57                   push di
5:E093  56                   push si
5:E094  c45e06               les bx, ptr [bp + 6]
5:E097  268b470c             mov ax, word ptr es:[bx + 0xc]
5:E09B  2d7400               sub ax, 0x74
5:E09E  0f849c00             je 0xe13e
5:E0A2  2d0400               sub ax, 4
5:E0A5  0f84b900             je 0xe162
5:E0A9  48                   dec ax
5:E0AA  0f84a600             je 0xe154
loc_E0AE:
5:E0AE  6a47                 push 0x47
loc_E0B0:
5:E0B0  66ff7606             push dword ptr [bp + 6]
5:E0B4  90                   nop
5:E0B5  0e                   push cs
5:E0B6  e8e302               call 0xe39c  ; sub_s5:E39C
loc_E0B9:
5:E0B9  66ff7606             push dword ptr [bp + 6]
5:E0BD  9a8eb5cbe1           lcall 0xe1cb, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E0C2  8946fc               mov word ptr [bp - 4], ax
5:E0C5  8956fe               mov word ptr [bp - 2], dx
5:E0C8  c45efc               les bx, ptr [bp - 4]
5:E0CB  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:E0D0  268b5730             mov dx, word ptr es:[bx + 0x30]
5:E0D4  668946f8             mov dword ptr [bp - 8], eax
5:E0D8  c45e06               les bx, ptr [bp + 6]
5:E0DB  26837f0c79           cmp word ptr es:[bx + 0xc], 0x79
5:E0E0  740f                 je 0xe0f1
5:E0E2  666800000200         push 0x20000
5:E0E8  6a01                 push 1
5:E0EA  52                   push dx
5:E0EB  50                   push ax
5:E0EC  9a045808e1           lcall 0xe108, 0x5804  ; sub_s8:5804
loc_E0F1:
5:E0F1  c45e06               les bx, ptr [bp + 6]
5:E0F4  26837f2406           cmp word ptr es:[bx + 0x24], 6
5:E0F9  750f                 jne 0xe10a
5:E0FB  666801000200         push 0x20001
5:E101  66ff76f8             push dword ptr [bp - 8]
5:E105  9acc435dde           lcall 0xde5d, 0x43cc  ; sub_s8:43CC
loc_E10A:
5:E10A  8b46fc               mov ax, word ptr [bp - 4]
5:E10D  8b56fe               mov dx, word ptr [bp - 2]
5:E110  050c00               add ax, 0xc
5:E113  1e                   push ds
5:E114  8d7ef2               lea di, [bp - 0xe]
5:E117  8bf0                 mov si, ax
5:E119  16                   push ss
5:E11A  07                   pop es
5:E11B  8eda                 mov ds, dx
5:E11D  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:E11F  a5                   movsw word ptr es:[di], word ptr [si]
5:E120  1f                   pop ds
5:E121  8d46f2               lea ax, [bp - 0xe]
5:E124  8946d8               mov word ptr [bp - 0x28], ax
5:E127  c45e06               les bx, ptr [bp + 6]
5:E12A  26837f2406           cmp word ptr es:[bx + 0x24], 6
5:E12F  7577                 jne 0xe1a8
5:E131  837ef600             cmp word ptr [bp - 0xa], 0
5:E135  7571                 jne 0xe1a8
5:E137  5e                   pop si
5:E138  5f                   pop di
5:E139  c9                   leave
5:E13A  ca0400               retf 4
5:E13D  db 90
loc_E13E:
5:E13E  268b4724             mov ax, word ptr es:[bx + 0x24]
5:E142  48                   dec ax
5:E143  0f8467ff             je 0xe0ae
5:E147  2d0500               sub ax, 5
5:E14A  0f856bff             jne 0xe0b9
5:E14E  6a01                 push 1
5:E150  e95dff               jmp 0xe0b0
5:E153  db 90
loc_E154:
5:E154  06                   push es
5:E155  53                   push bx
5:E156  90                   nop
5:E157  0e                   push cs
5:E158  e83f03               call 0xe49a  ; sub_s5:E49A
5:E15B  5e                   pop si
5:E15C  5f                   pop di
5:E15D  c9                   leave
5:E15E  ca0400               retf 4
5:E161  db 90
loc_E162:
5:E162  268b4724             mov ax, word ptr es:[bx + 0x24]
5:E166  48                   dec ax
5:E167  7415                 je 0xe17e
5:E169  48                   dec ax
5:E16A  0f8c4bff             jl 0xe0b9
5:E16E  0f8047ff             jo 0xe0b9
5:E172  2d0300               sub ax, 3
5:E175  7e25                 jle 0xe19c
5:E177  48                   dec ax
5:E178  740a                 je 0xe184
5:E17A  e93cff               jmp 0xe0b9
5:E17D  db 90
loc_E17E:
5:E17E  6a6a                 push 0x6a
5:E180  e92dff               jmp 0xe0b0
5:E183  db 90
loc_E184:
5:E184  6a06                 push 6
5:E186  66ff7606             push dword ptr [bp + 6]
5:E18A  90                   nop
5:E18B  0e                   push cs
5:E18C  e80d02               call 0xe39c  ; sub_s5:E39C
5:E18F  66ff7606             push dword ptr [bp + 6]
5:E193  90                   nop
5:E194  0e                   push cs
5:E195  e810fb               call 0xdca8  ; sub_s5:DCA8
5:E198  e91eff               jmp 0xe0b9
5:E19B  db 90
loc_E19C:
5:E19C  66ff7606             push dword ptr [bp + 6]
5:E1A0  90                   nop
5:E1A1  0e                   push cs
5:E1A2  e8f502               call 0xe49a  ; sub_s5:E49A
5:E1A5  e911ff               jmp 0xe0b9
loc_E1A8:
5:E1A8  26c45f28             les bx, ptr es:[bx + 0x28]
5:E1AC  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:E1B1  668946ee             mov dword ptr [bp - 0x12], eax
5:E1B5  8d4eec               lea cx, [bp - 0x14]
5:E1B8  16                   push ss
5:E1B9  51                   push cx
5:E1BA  8d56ea               lea dx, [bp - 0x16]
5:E1BD  16                   push ss
5:E1BE  52                   push dx
5:E1BF  66ff76ee             push dword ptr [bp - 0x12]
5:E1C3  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:E1C8  9aece1ebe1           lcall 0xe1eb, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:E1CD  8946e6               mov word ptr [bp - 0x1a], ax
5:E1D0  8956e8               mov word ptr [bp - 0x18], dx
5:E1D3  52                   push dx
5:E1D4  50                   push ax
5:E1D5  9a1c5b25e2           lcall 0xe225, 0x5b1c  ; sub_s7:5B1C
5:E1DA  8d46f2               lea ax, [bp - 0xe]
5:E1DD  16                   push ss
5:E1DE  50                   push ax
5:E1DF  c45e06               les bx, ptr [bp + 6]
5:E1E2  26ff7724             push word ptr es:[bx + 0x24]
5:E1E6  06                   push es
5:E1E7  53                   push bx
5:E1E8  9aeec862e2           lcall 0xe262, 0xc8ee  ; sub_s6:C8EE
5:E1ED  8d46e4               lea ax, [bp - 0x1c]
5:E1F0  16                   push ss
5:E1F1  50                   push ax
5:E1F2  8d46e2               lea ax, [bp - 0x1e]
5:E1F5  16                   push ss
5:E1F6  50                   push ax
5:E1F7  8d46e0               lea ax, [bp - 0x20]
5:E1FA  16                   push ss
5:E1FB  50                   push ax
5:E1FC  8d4ef2               lea cx, [bp - 0xe]
5:E1FF  16                   push ss
5:E200  51                   push cx
5:E201  9ab43e7ee2           lcall 0xe27e, 0x3eb4  ; sub_s2:3EB4
5:E206  c45e06               les bx, ptr [bp + 6]
5:E209  26837f2401           cmp word ptr es:[bx + 0x24], 1
5:E20E  7570                 jne 0xe280
5:E210  8b46ea               mov ax, word ptr [bp - 0x16]
5:E213  3946e0               cmp word ptr [bp - 0x20], ax
5:E216  7e22                 jle 0xe23a
5:E218  ff76ec               push word ptr [bp - 0x14]
5:E21B  ff76e0               push word ptr [bp - 0x20]
5:E21E  66ff76e6             push dword ptr [bp - 0x1a]
5:E222  9a3e5b38e2           lcall 0xe238, 0x5b3e  ; sub_s7:5B3E
5:E227  8d46ec               lea ax, [bp - 0x14]
5:E22A  16                   push ss
5:E22B  50                   push ax
5:E22C  8d46ea               lea ax, [bp - 0x16]
5:E22F  16                   push ss
5:E230  50                   push ax
5:E231  66ff76e6             push dword ptr [bp - 0x1a]
5:E235  9a1c5b72e2           lcall 0xe272, 0x5b1c  ; sub_s7:5B1C
loc_E23A:
5:E23A  c45ef8               les bx, ptr [bp - 8]
5:E23D  66268b4704           mov eax, dword ptr es:[bx + 4]
5:E242  668946d0             mov dword ptr [bp - 0x30], eax
5:E246  66ff76ee             push dword ptr [bp - 0x12]
5:E24A  6650                 push eax
5:E24C  8d46f2               lea ax, [bp - 0xe]
5:E24F  16                   push ss
5:E250  50                   push ax
5:E251  666800006a00         push 0x6a0000
5:E257  6a00                 push 0
5:E259  8d86aafe             lea ax, [bp - 0x156]
5:E25D  16                   push ss
5:E25E  50                   push ax
5:E25F  9af0878ce2           lcall 0xe28c, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:E264  8d86aafe             lea ax, [bp - 0x156]
5:E268  16                   push ss
5:E269  50                   push ax
5:E26A  66ff364857           push dword ptr [0x5748]  ; g_sim
5:E26F  9a5a8366e0           lcall 0xe066, 0x835a  ; Sim::enqueue@s7:835A
5:E274  c786aafe9a38         mov word ptr [bp - 0x156], 0x389a
5:E27A  c786acfe84de         mov word ptr [bp - 0x154], 0xde84  ; SEGMENT s2:0000
loc_E280:
5:E280  8d46f2               lea ax, [bp - 0xe]
5:E283  16                   push ss
5:E284  50                   push ax
5:E285  66ff7606             push dword ptr [bp + 6]
5:E289  9ad0cc5fe0           lcall 0xe05f, 0xccd0  ; sub_s6:CCD0
5:E28E  5e                   pop si
5:E28F  5f                   pop di
5:E290  c9                   leave
5:E291  ca0400               retf 4

; ---------------- sub_s5:E294 FAR size=264 callers=1
5:E294  c85c0100             enter 0x15c, 0
5:E298  57                   push di
5:E299  56                   push si
5:E29A  c45e06               les bx, ptr [bp + 6]
5:E29D  26837f2402           cmp word ptr es:[bx + 0x24], 2
5:E2A2  0f8ce700             jl 0xe38d
5:E2A6  26837f2405           cmp word ptr es:[bx + 0x24], 5
5:E2AB  0f8fde00             jg 0xe38d
5:E2AF  26c45f28             les bx, ptr es:[bx + 0x28]
5:E2B3  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:E2B8  668946fc             mov dword ptr [bp - 4], eax
5:E2BC  66ff7606             push dword ptr [bp + 6]
5:E2C0  9a8eb5f1e2           lcall 0xe2f1, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E2C5  8946f8               mov word ptr [bp - 8], ax
5:E2C8  8956fa               mov word ptr [bp - 6], dx
5:E2CB  050c00               add ax, 0xc
5:E2CE  1e                   push ds
5:E2CF  8d7ef2               lea di, [bp - 0xe]
5:E2D2  8bf0                 mov si, ax
5:E2D4  16                   push ss
5:E2D5  07                   pop es
5:E2D6  8eda                 mov ds, dx
5:E2D8  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:E2DA  a5                   movsw word ptr es:[di], word ptr [si]
5:E2DB  1f                   pop ds
5:E2DC  8d46f2               lea ax, [bp - 0xe]
5:E2DF  8986befe             mov word ptr [bp - 0x142], ax
5:E2E3  16                   push ss
5:E2E4  50                   push ax
5:E2E5  c45e06               les bx, ptr [bp + 6]
5:E2E8  26ff7724             push word ptr es:[bx + 0x24]
5:E2EC  06                   push es
5:E2ED  53                   push bx
5:E2EE  9aeec805e3           lcall 0xe305, 0xc8ee  ; sub_s6:C8EE
5:E2F3  8d86b2fe             lea ax, [bp - 0x14e]
5:E2F7  16                   push ss
5:E2F8  50                   push ax
5:E2F9  8d46f2               lea ax, [bp - 0xe]
5:E2FC  16                   push ss
5:E2FD  50                   push ax
5:E2FE  66ff7606             push dword ptr [bp + 6]
5:E302  9a9cc86fe3           lcall 0xe36f, 0xc89c  ; sub_s6:C89C
5:E307  8bd8                 mov bx, ax
5:E309  8ec2                 mov es, dx
5:E30B  66268b07             mov eax, dword ptr es:[bx]
5:E30F  668946ee             mov dword ptr [bp - 0x12], eax
5:E313  668986aefe           mov dword ptr [bp - 0x152], eax
5:E318  668986a4fe           mov dword ptr [bp - 0x15c], eax
5:E31D  8a86a7fe             mov al, byte ptr [bp - 0x159]
5:E321  2ae4                 sub ah, ah
5:E323  a8ff                 test al, 0xff
5:E325  750f                 jne 0xe336
5:E327  837eee09             cmp word ptr [bp - 0x12], 9
5:E32B  7509                 jne 0xe336
5:E32D  c45e06               les bx, ptr [bp + 6]
5:E330  26c747140100         mov word ptr es:[bx + 0x14], 1
loc_E336:
5:E336  c45ef8               les bx, ptr [bp - 8]
5:E339  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:E33E  668946ea             mov dword ptr [bp - 0x16], eax
5:E342  c45eea               les bx, ptr [bp - 0x16]
5:E345  66268b4704           mov eax, dword ptr es:[bx + 4]
5:E34A  668946e6             mov dword ptr [bp - 0x1a], eax
5:E34E  66ff76fc             push dword ptr [bp - 4]
5:E352  6650                 push eax
5:E354  8d46f2               lea ax, [bp - 0xe]
5:E357  16                   push ss
5:E358  50                   push ax
5:E359  6a79                 push 0x79
5:E35B  c45e06               les bx, ptr [bp + 6]
5:E35E  268b4714             mov ax, word ptr es:[bx + 0x14]
5:E362  40                   inc ax
5:E363  50                   push ax
5:E364  6a00                 push 0
5:E366  8d86c2fe             lea ax, [bp - 0x13e]
5:E36A  16                   push ss
5:E36B  50                   push ax
5:E36C  9af087c0e0           lcall 0xe0c0, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:E371  8d86c2fe             lea ax, [bp - 0x13e]
5:E375  16                   push ss
5:E376  50                   push ax
5:E377  66ff364857           push dword ptr [0x5748]  ; g_sim
5:E37C  9a5a83d8e1           lcall 0xe1d8, 0x835a  ; Sim::enqueue@s7:835A
5:E381  c786c2fe9a38         mov word ptr [bp - 0x13e], 0x389a
5:E387  c786c4fe04e2         mov word ptr [bp - 0x13c], 0xe204  ; SEGMENT s2:0000
loc_E38D:
5:E38D  c45e06               les bx, ptr [bp + 6]
5:E390  26c747260100         mov word ptr es:[bx + 0x26], 1
5:E396  5e                   pop si
5:E397  5f                   pop di
5:E398  c9                   leave
5:E399  ca0400               retf 4

; ---------------- sub_s5:E39C FAR size=176 callers=2
5:E39C  c8540100             enter 0x154, 0
5:E3A0  57                   push di
5:E3A1  56                   push si
5:E3A2  66ff7606             push dword ptr [bp + 6]
5:E3A6  9a8eb527e4           lcall 0xe427, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E3AB  8946fc               mov word ptr [bp - 4], ax
5:E3AE  8956fe               mov word ptr [bp - 2], dx
5:E3B1  050c00               add ax, 0xc
5:E3B4  1e                   push ds
5:E3B5  8d7ef6               lea di, [bp - 0xa]
5:E3B8  8bf0                 mov si, ax
5:E3BA  16                   push ss
5:E3BB  07                   pop es
5:E3BC  8eda                 mov ds, dx
5:E3BE  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:E3C0  a5                   movsw word ptr es:[di], word ptr [si]
5:E3C1  1f                   pop ds
5:E3C2  8d46f6               lea ax, [bp - 0xa]
5:E3C5  8986c4fe             mov word ptr [bp - 0x13c], ax
5:E3C9  837efa00             cmp word ptr [bp - 6], 0
5:E3CD  7e05                 jle 0xe3d4
5:E3CF  b80600               mov ax, 6
5:E3D2  eb03                 jmp 0xe3d7
loc_E3D4:
5:E3D4  b80500               mov ax, 5
loc_E3D7:
5:E3D7  8986b4fe             mov word ptr [bp - 0x14c], ax
5:E3DB  c45efc               les bx, ptr [bp - 4]
5:E3DE  26894714             mov word ptr es:[bx + 0x14], ax
5:E3E2  c45e06               les bx, ptr [bp + 6]
5:E3E5  26c45f28             les bx, ptr es:[bx + 0x28]
5:E3E9  66268b4720           mov eax, dword ptr es:[bx + 0x20]
5:E3EE  668946f2             mov dword ptr [bp - 0xe], eax
5:E3F2  c45efc               les bx, ptr [bp - 4]
5:E3F5  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:E3FA  668946ee             mov dword ptr [bp - 0x12], eax
5:E3FE  c45eee               les bx, ptr [bp - 0x12]
5:E401  66268b4704           mov eax, dword ptr es:[bx + 4]
5:E406  668946ea             mov dword ptr [bp - 0x16], eax
5:E40A  66ff76f2             push dword ptr [bp - 0xe]
5:E40E  6650                 push eax
5:E410  8d46f6               lea ax, [bp - 0xa]
5:E413  16                   push ss
5:E414  50                   push ax
5:E415  ff760a               push word ptr [bp + 0xa]
5:E418  666800000100         push 0x10000
5:E41E  8d86c6fe             lea ax, [bp - 0x13a]
5:E422  16                   push ss
5:E423  50                   push ax
5:E424  9af087c3e2           lcall 0xe2c3, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:E429  8d86c6fe             lea ax, [bp - 0x13a]
5:E42D  16                   push ss
5:E42E  50                   push ax
5:E42F  66ff364857           push dword ptr [0x5748]  ; g_sim
5:E434  9a5a837fe3           lcall 0xe37f, 0x835a  ; Sim::enqueue@s7:835A
5:E439  c786c6fe9a38         mov word ptr [bp - 0x13a], 0x389a
5:E43F  c786c8fe8be3         mov word ptr [bp - 0x138], 0xe38b  ; SEGMENT s2:0000
5:E445  5e                   pop si
5:E446  5f                   pop di
5:E447  c9                   leave
5:E448  ca0600               retf 6
5:E44B  db 00

; ---------------- sub_s5:E44C FAR size=78 callers=0
5:E44C  55                   push bp
5:E44D  8bec                 mov bp, sp
5:E44F  c45e06               les bx, ptr [bp + 6]
5:E452  26837f1202           cmp word ptr es:[bx + 0x12], 2
5:E457  753c                 jne 0xe495
5:E459  26ff4f14             dec word ptr es:[bx + 0x14]
5:E45D  26837f2600           cmp word ptr es:[bx + 0x26], 0
5:E462  750e                 jne 0xe472
5:E464  26837f0c78           cmp word ptr es:[bx + 0xc], 0x78
5:E469  7507                 jne 0xe472
5:E46B  06                   push es
5:E46C  53                   push bx
5:E46D  90                   nop
5:E46E  0e                   push cs
5:E46F  e822fe               call 0xe294  ; sub_s5:E294
loc_E472:
5:E472  c45e06               les bx, ptr [bp + 6]
5:E475  26837f1400           cmp word ptr es:[bx + 0x14], 0
5:E47A  750c                 jne 0xe488
5:E47C  06                   push es
5:E47D  53                   push bx
5:E47E  90                   nop
5:E47F  0e                   push cs
5:E480  e80bfc               call 0xe08e  ; sub_s5:E08E
5:E483  c9                   leave
5:E484  ca0400               retf 4
5:E487  db 90
loc_E488:
5:E488  26837f2406           cmp word ptr es:[bx + 0x24], 6
5:E48D  7506                 jne 0xe495
5:E48F  26c7470e4900         mov word ptr es:[bx + 0xe], 0x49
loc_E495:
5:E495  c9                   leave
5:E496  ca0400               retf 4
5:E499  db 00

; ---------------- sub_s5:E49A FAR size=96 callers=1
5:E49A  c80c0000             enter 0xc, 0
5:E49E  66ff7606             push dword ptr [bp + 6]
5:E4A2  9a8eb5a9e3           lcall 0xe3a9, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E4A7  8946fc               mov word ptr [bp - 4], ax
5:E4AA  8956fe               mov word ptr [bp - 2], dx
5:E4AD  c45efc               les bx, ptr [bp - 4]
5:E4B0  268b4714             mov ax, word ptr es:[bx + 0x14]
5:E4B4  c746f80000           mov word ptr [bp - 8], 0
5:E4B9  eb21                 jmp 0xe4dc
5:E4BB  db 90
loc_E4BC:
5:E4BC  c746f80600           mov word ptr [bp - 8], 6
5:E4C1  eb27                 jmp 0xe4ea
5:E4C3  db 90
loc_E4C4:
5:E4C4  c746f80700           mov word ptr [bp - 8], 7
5:E4C9  eb1f                 jmp 0xe4ea
5:E4CB  db 90
loc_E4CC:
5:E4CC  c746f80800           mov word ptr [bp - 8], 8
5:E4D1  eb17                 jmp 0xe4ea
5:E4D3  db 90
loc_E4D4:
5:E4D4  c746f80900           mov word ptr [bp - 8], 9
5:E4D9  eb0f                 jmp 0xe4ea
5:E4DB  db 90
loc_E4DC:
5:E4DC  2d0600               sub ax, 6
5:E4DF  74f3                 je 0xe4d4
5:E4E1  48                   dec ax
5:E4E2  74d8                 je 0xe4bc
5:E4E4  48                   dec ax
5:E4E5  74dd                 je 0xe4c4
5:E4E7  48                   dec ax
5:E4E8  74e2                 je 0xe4cc
loc_E4EA:
5:E4EA  ff76f8               push word ptr [bp - 8]
5:E4ED  66ff7606             push dword ptr [bp + 6]
5:E4F1  90                   nop
5:E4F2  0e                   push cs
5:E4F3  e8a6fe               call 0xe39c  ; sub_s5:E39C
5:E4F6  c9                   leave
5:E4F7  ca0400               retf 4

; ---------------- sub_s5:E4FA FAR size=94 callers=1
5:E4FA  c80c0000             enter 0xc, 0
5:E4FE  8b460a               mov ax, word ptr [bp + 0xa]
5:E501  eb2f                 jmp 0xe532
5:E503  db 90
loc_E504:
5:E504  c746fe0400           mov word ptr [bp - 2], 4
5:E509  eb45                 jmp 0xe550
5:E50B  db 90
loc_E50C:
5:E50C  c746fe0500           mov word ptr [bp - 2], 5
5:E511  eb3d                 jmp 0xe550
5:E513  db 90
loc_E514:
5:E514  66ff7606             push dword ptr [bp + 6]
5:E518  9a8eb5a5e4           lcall 0xe4a5, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E51D  8946fa               mov word ptr [bp - 6], ax
5:E520  8956fc               mov word ptr [bp - 4], dx
5:E523  c45efa               les bx, ptr [bp - 6]
5:E526  268b4714             mov ax, word ptr es:[bx + 0x14]
5:E52A  050200               add ax, 2
5:E52D  8946fe               mov word ptr [bp - 2], ax
5:E530  eb1e                 jmp 0xe550
loc_E532:
5:E532  48                   dec ax
5:E533  48                   dec ax
5:E534  3d0600               cmp ax, 6
5:E537  77db                 ja 0xe514
5:E539  03c0                 add ax, ax
5:E53B  93                   xchg bx, ax
5:E53C  2effa742e5           jmp word ptr cs:[bx - 0x1abe]
5:E541  db 90
switch_table_E542:
    dw loc_E504
    dw loc_E50C
    dw loc_E514
    dw loc_E504
    dw loc_E504
    dw loc_E504
    dw loc_E50C
loc_E550:
5:E550  8b46fe               mov ax, word ptr [bp - 2]
5:E553  c9                   leave
5:E554  ca0600               retf 6
5:E557  db 00

; ---------------- sub_s5:E558 FAR size=250 callers=0
5:E558  c82e0000             enter 0x2e, 0
5:E55C  57                   push di
5:E55D  56                   push si
5:E55E  c45e06               les bx, ptr [bp + 6]
5:E561  26837f0c79           cmp word ptr es:[bx + 0xc], 0x79
5:E566  750e                 jne 0xe576
5:E568  268b4724             mov ax, word ptr es:[bx + 0x24]
5:E56C  26894714             mov word ptr es:[bx + 0x14], ax
5:E570  26c747240000         mov word ptr es:[bx + 0x24], 0
loc_E576:
5:E576  c45e06               les bx, ptr [bp + 6]
5:E579  26837f2406           cmp word ptr es:[bx + 0x24], 6
5:E57E  750c                 jne 0xe58c
5:E580  26c747140100         mov word ptr es:[bx + 0x14], 1
5:E586  5e                   pop si
5:E587  5f                   pop di
5:E588  c9                   leave
5:E589  ca0400               retf 4
loc_E58C:
5:E58C  06                   push es
5:E58D  53                   push bx
5:E58E  9a8eb5dbe5           lcall 0xe5db, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E593  8946fc               mov word ptr [bp - 4], ax
5:E596  8956fe               mov word ptr [bp - 2], dx
5:E599  c45efc               les bx, ptr [bp - 4]
5:E59C  268b4714             mov ax, word ptr es:[bx + 0x14]
5:E5A0  8946fa               mov word ptr [bp - 6], ax
5:E5A3  50                   push ax
5:E5A4  66ff7606             push dword ptr [bp + 6]
5:E5A8  90                   nop
5:E5A9  0e                   push cs
5:E5AA  e84dff               call 0xe4fa  ; sub_s5:E4FA
5:E5AD  8946f8               mov word ptr [bp - 8], ax
5:E5B0  8b46fc               mov ax, word ptr [bp - 4]
5:E5B3  8b56fe               mov dx, word ptr [bp - 2]
5:E5B6  050c00               add ax, 0xc
5:E5B9  1e                   push ds
5:E5BA  8d7ef2               lea di, [bp - 0xe]
5:E5BD  8bf0                 mov si, ax
5:E5BF  16                   push ss
5:E5C0  07                   pop es
5:E5C1  8eda                 mov ds, dx
5:E5C3  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:E5C5  a5                   movsw word ptr es:[di], word ptr [si]
5:E5C6  1f                   pop ds
5:E5C7  8d46f2               lea ax, [bp - 0xe]
5:E5CA  8946ea               mov word ptr [bp - 0x16], ax
5:E5CD  16                   push ss
5:E5CE  50                   push ax
5:E5CF  c45e06               les bx, ptr [bp + 6]
5:E5D2  26ff7724             push word ptr es:[bx + 0x24]
5:E5D6  06                   push es
5:E5D7  53                   push bx
5:E5D8  9aeec8eee5           lcall 0xe5ee, 0xc8ee  ; sub_s6:C8EE
5:E5DD  8d46de               lea ax, [bp - 0x22]
5:E5E0  16                   push ss
5:E5E1  50                   push ax
5:E5E2  8d46f2               lea ax, [bp - 0xe]
5:E5E5  16                   push ss
5:E5E6  50                   push ax
5:E5E7  66ff7606             push dword ptr [bp + 6]
5:E5EB  9a9cc81de6           lcall 0xe61d, 0xc89c  ; sub_s6:C89C
5:E5F0  8bd8                 mov bx, ax
5:E5F2  8ec2                 mov es, dx
5:E5F4  66268b07             mov eax, dword ptr es:[bx]
5:E5F8  268b5702             mov dx, word ptr es:[bx + 2]
5:E5FC  668946ee             mov dword ptr [bp - 0x12], eax
5:E600  668946ea             mov dword ptr [bp - 0x16], eax
5:E604  668946d2             mov dword ptr [bp - 0x2e], eax
5:E608  8a46d5               mov al, byte ptr [bp - 0x2b]
5:E60B  2ae4                 sub ah, ah
5:E60D  a8ff                 test al, 0xff
5:E60F  741d                 je 0xe62e
5:E611  52                   push dx
5:E612  ff76ee               push word ptr [bp - 0x12]
5:E615  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:E61A  9aece11be5           lcall 0xe51b, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:E61F  8946d2               mov word ptr [bp - 0x2e], ax
5:E622  8956d4               mov word ptr [bp - 0x2c], dx
5:E625  c45ed2               les bx, ptr [bp - 0x2e]
5:E628  268b4714             mov ax, word ptr es:[bx + 0x14]
5:E62C  eb03                 jmp 0xe631
loc_E62E:
5:E62E  8b46ee               mov ax, word ptr [bp - 0x12]
loc_E631:
5:E631  8946fa               mov word ptr [bp - 6], ax
5:E634  50                   push ax
5:E635  66ff7606             push dword ptr [bp + 6]
5:E639  90                   nop
5:E63A  0e                   push cs
5:E63B  e8bcfe               call 0xe4fa  ; sub_s5:E4FA
5:E63E  0146f8               add word ptr [bp - 8], ax
5:E641  8b46f8               mov ax, word ptr [bp - 8]
5:E644  c45e06               les bx, ptr [bp + 6]
5:E647  26894714             mov word ptr es:[bx + 0x14], ax
5:E64B  5e                   pop si
5:E64C  5f                   pop di
5:E64D  c9                   leave
5:E64E  ca0400               retf 4
5:E651  db 00

; ---------------- sub_s5:E652 FAR size=82 callers=1
5:E652  c80a0000             enter 0xa, 0
5:E656  57                   push di
5:E657  56                   push si
5:E658  8b460a               mov ax, word ptr [bp + 0xa]
5:E65B  8b560c               mov dx, word ptr [bp + 0xc]
5:E65E  1e                   push ds
5:E65F  8d7efa               lea di, [bp - 6]
5:E662  8bf0                 mov si, ax
5:E664  16                   push ss
5:E665  07                   pop es
5:E666  8eda                 mov ds, dx
5:E668  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:E66A  a5                   movsw word ptr es:[di], word ptr [si]
5:E66B  1f                   pop ds
5:E66C  8d46fa               lea ax, [bp - 6]
5:E66F  8946f6               mov word ptr [bp - 0xa], ax
5:E672  16                   push ss
5:E673  50                   push ax
5:E674  c45e06               les bx, ptr [bp + 6]
5:E677  26ff7724             push word ptr es:[bx + 0x24]
5:E67B  06                   push es
5:E67C  53                   push bx
5:E67D  9aeec892e6           lcall 0xe692, 0xc8ee  ; sub_s6:C8EE
5:E682  66ff760e             push dword ptr [bp + 0xe]
5:E686  8d46fa               lea ax, [bp - 6]
5:E689  16                   push ss
5:E68A  50                   push ax
5:E68B  66ff7606             push dword ptr [bp + 6]
5:E68F  9ab6c791e5           lcall 0xe591, 0xc7b6  ; sub_s6:C7B6
5:E694  8946f8               mov word ptr [bp - 8], ax
5:E697  0bc0                 or ax, ax
5:E699  7403                 je 0xe69e
5:E69B  b80100               mov ax, 1
loc_E69E:
5:E69E  5e                   pop si
5:E69F  5f                   pop di
5:E6A0  c9                   leave
5:E6A1  ca0c00               retf 0xc

; ---------------- sub_s5:E6A4 size=106 callers=0
5:E6A4  c80c0000             enter 0xc, 0
5:E6A8  66ff760a             push dword ptr [bp + 0xa]
5:E6AC  66ff7606             push dword ptr [bp + 6]
5:E6B0  9a7cde37e4           lcall 0xe437, 0xde7c  ; sub_s7:DE7C
5:E6B5  0bc0                 or ax, ax
5:E6B7  7507                 jne 0xe6c0
loc_E6B9:
5:E6B9  33c0                 xor ax, ax
5:E6BB  c9                   leave
5:E6BC  ca0800               retf 8
5:E6BF  db 90
loc_E6C0:
5:E6C0  c45e06               les bx, ptr [bp + 6]
5:E6C3  268b4724             mov ax, word ptr es:[bx + 0x24]
5:E6C7  8946f6               mov word ptr [bp - 0xa], ax
5:E6CA  666a02               push 2
5:E6CD  8d46f6               lea ax, [bp - 0xa]
5:E6D0  16                   push ss
5:E6D1  50                   push ax
5:E6D2  66ff760a             push dword ptr [bp + 0xa]
5:E6D6  9a1c7ef8e6           lcall 0xe6f8, 0x7e1c  ; File_write@s2:7E1C
5:E6DB  0bc0                 or ax, ax
5:E6DD  741f                 je 0xe6fe
5:E6DF  c45e06               les bx, ptr [bp + 6]
5:E6E2  268b4726             mov ax, word ptr es:[bx + 0x26]
5:E6E6  8946fc               mov word ptr [bp - 4], ax
5:E6E9  666a02               push 2
5:E6EC  8d46fc               lea ax, [bp - 4]
5:E6EF  16                   push ss
5:E6F0  50                   push ax
5:E6F1  66ff760a             push dword ptr [bp + 0xa]
5:E6F5  9a1c7e43e4           lcall 0xe443, 0x7e1c  ; File_write@s2:7E1C
5:E6FA  0bc0                 or ax, ax
5:E6FC  7508                 jne 0xe706
loc_E6FE:
5:E6FE  c7061003d006         mov word ptr [0x310], 0x6d0
5:E704  ebb3                 jmp 0xe6b9
loc_E706:
5:E706  b80100               mov ax, 1
5:E709  c9                   leave
5:E70A  ca0800               retf 8
5:E70D  db 00

; ---------------- sub_s5:E70E FAR size=94 callers=0
5:E70E  c8100000             enter 0x10, 0
5:E712  66ff760a             push dword ptr [bp + 0xa]
5:E716  66ff7606             push dword ptr [bp + 6]
5:E71A  9ac4deb3e6           lcall 0xe6b3, 0xdec4  ; sub_s7:DEC4
5:E71F  0bc0                 or ax, ax
5:E721  7507                 jne 0xe72a
loc_E723:
5:E723  33c0                 xor ax, ax
5:E725  c9                   leave
5:E726  ca0800               retf 8
5:E729  db 90
loc_E72A:
5:E72A  666a02               push 2
5:E72D  668b4606             mov eax, dword ptr [bp + 6]
5:E731  052400               add ax, 0x24
5:E734  6650                 push eax
5:E736  66ff760a             push dword ptr [bp + 0xa]
5:E73A  9aee7d56e7           lcall 0xe756, 0x7dee  ; File_read@s2:7DEE
5:E73F  0bc0                 or ax, ax
5:E741  7419                 je 0xe75c
5:E743  666a02               push 2
5:E746  668b4606             mov eax, dword ptr [bp + 6]
5:E74A  052600               add ax, 0x26
5:E74D  6650                 push eax
5:E74F  66ff760a             push dword ptr [bp + 0xa]
5:E753  9aee7dd9e6           lcall 0xe6d9, 0x7dee  ; File_read@s2:7DEE
5:E758  0bc0                 or ax, ax
5:E75A  7508                 jne 0xe764
loc_E75C:
5:E75C  c7061003d206         mov word ptr [0x310], 0x6d2
5:E762  ebbf                 jmp 0xe723
loc_E764:
5:E764  b80100               mov ax, 1
5:E767  c9                   leave
5:E768  ca0800               retf 8
5:E76B  db 00

; ---------------- sub_s5:E76C FAR size=142 callers=0
5:E76C  c8040000             enter 4, 0
5:E770  66ff7606             push dword ptr [bp + 6]
5:E774  9af4dc1de7           lcall 0xe71d, 0xdcf4  ; sub_s7:DCF4
5:E779  f6460a01             test byte ptr [bp + 0xa], 1
5:E77D  7409                 je 0xe788
5:E77F  66ff7606             push dword ptr [bp + 6]
5:E783  9ace17e0d8           lcall 0xd8e0, 0x17ce  ; operator_delete@s1:17CE
loc_E788:
5:E788  8b4606               mov ax, word ptr [bp + 6]
5:E78B  8b5608               mov dx, word ptr [bp + 8]
5:E78E  c9                   leave
5:E78F  ca0600               retf 6
5:E792  db 6c e7 a0 e7 56 bb a8 e7 8e 17 77 e7 a4 e6 a4 e7
5:E7A2  db 0e e7 ac e7 1c bc b8 e7 fa d9 b0 e7 4e da b4 e7
5:E7B2  db 3c da cc e7 14 b5 bc e7 2a be c0 e7 16 bf c4 e7
5:E7C2  db 1a bf c8 e7 1e bf d4 e7 4c e4 d0 e7 58 e5 f4 e7
5:E7D2  db f0 bb d8 e7 02 bc dc e7 a8 b5 e0 e7 ca b5 e4 e7
5:E7E2  db e6 b4 e8 e7 ec b4 ec e7 6e b4 f0 e7 4a c6 f8 e7
5:E7F2  db 86 db d3 d9 d2 ce 80 e6

; ---------------- sub_s5:E7FA FAR size=34 callers=1
5:E7FA  55                   push bp
5:E7FB  8bec                 mov bp, sp
5:E7FD  66ff7606             push dword ptr [bp + 6]
5:E801  9a54b398e7           lcall 0xe798, 0xb354  ; Building::Building()@s6:B354
5:E806  c45e06               les bx, ptr [bp + 6]
5:E809  26c7078ee8           mov word ptr es:[bx], 0xe88e
5:E80E  26c7470294e7         mov word ptr es:[bx + 2], 0xe794  ; SEGMENT s5:0000
5:E814  8bc3                 mov ax, bx
5:E816  8cc2                 mov dx, es
5:E818  c9                   leave
5:E819  ca0400               retf 4

; ---------------- sub_s5:E81C FAR size=42 callers=1
5:E81C  55                   push bp
5:E81D  8bec                 mov bp, sp
5:E81F  66ff760c             push dword ptr [bp + 0xc]
5:E823  66ff7608             push dword ptr [bp + 8]
5:E827  ff7606               push word ptr [bp + 6]
5:E82A  9a9eb304e8           lcall 0xe804, 0xb39e  ; Building::Building(type,owner)@s6:B39E
5:E82F  c45e06               les bx, ptr [bp + 6]
5:E832  26c7078ee8           mov word ptr es:[bx], 0xe88e
5:E837  26c7470212e8         mov word ptr es:[bx + 2], 0xe812  ; SEGMENT s5:0000
5:E83D  8bc3                 mov ax, bx
5:E83F  8cc2                 mov dx, es
5:E841  c9                   leave
5:E842  ca0a00               retf 0xa
5:E845  db 00

; ---------------- sub_s5:E846 FAR size=30 callers=1
5:E846  55                   push bp
5:E847  8bec                 mov bp, sp
5:E849  c45e06               les bx, ptr [bp + 6]
5:E84C  26c7078ee8           mov word ptr es:[bx], 0xe88e
5:E851  26c747023be8         mov word ptr es:[bx + 2], 0xe83b  ; SEGMENT s5:0000
5:E857  66ff7606             push dword ptr [bp + 6]
5:E85B  9a18b42de8           lcall 0xe82d, 0xb418  ; sub_s6:B418
5:E860  c9                   leave
5:E861  ca0400               retf 4

; ---------------- sub_s5:E864 FAR size=4 callers=0
5:E864  ca0400               retf 4
5:E867  db 00

; ---------------- sub_s5:E868 FAR size=142 callers=0
5:E868  55                   push bp
5:E869  8bec                 mov bp, sp
5:E86B  66ff7606             push dword ptr [bp + 6]
5:E86F  90                   nop
5:E870  0e                   push cs
5:E871  e8d2ff               call 0xe846  ; sub_s5:E846
5:E874  f6460a01             test byte ptr [bp + 0xa], 1
5:E878  7409                 je 0xe883
5:E87A  66ff7606             push dword ptr [bp + 6]
5:E87E  9ace1786e7           lcall 0xe786, 0x17ce  ; operator_delete@s1:17CE
loc_E883:
5:E883  8b4606               mov ax, word ptr [bp + 6]
5:E886  8b5608               mov dx, word ptr [bp + 8]
5:E889  c9                   leave
5:E88A  ca0600               retf 6
5:E88D  db 90 68 e8 c0 e8 56 bb 9c e8 8e 17 9c e7 ec b5 a0
5:E89D  db e8 1a b8 a4 e8 1c bc a8 e8 38 bd ac e8 90 bc b0
5:E8AD  db e8 7e bc b4 e8 14 b5 b8 e8 2a be bc e8 16 bf c4
5:E8BD  db e8 64 e8 55 e8 1e bf c8 e8 9e be cc e8 22 bf d0
5:E8CD  db e8 f0 bb d4 e8 02 bc d8 e8 a8 b5 dc e8 ca b5 e0
5:E8DD  db e8 e6 b4 e4 e8 ec b4 e8 e8 6e b4 ec e8 4a c6 f0
5:E8ED  db e8 22 c5 f4 e8 d2 ce 5e e8

; ---------------- sub_s5:E8F6 FAR size=40 callers=1
5:E8F6  55                   push bp
5:E8F7  8bec                 mov bp, sp
5:E8F9  66ff7606             push dword ptr [bp + 6]
5:E8FD  9a96dc98e8           lcall 0xe898, 0xdc96  ; sub_s7:DC96
5:E902  c45e06               les bx, ptr [bp + 6]
5:E905  26c747240000         mov word ptr es:[bx + 0x24], 0
5:E90B  26c707f6ee           mov word ptr es:[bx], 0xeef6
5:E910  26c7470290e8         mov word ptr es:[bx + 2], 0xe890  ; SEGMENT s5:0000
5:E916  8bc3                 mov ax, bx
5:E918  8cc2                 mov dx, es
5:E91A  c9                   leave
5:E91B  ca0400               retf 4

; ---------------- sub_s5:E91E FAR size=48 callers=1
5:E91E  55                   push bp
5:E91F  8bec                 mov bp, sp
5:E921  66ff760c             push dword ptr [bp + 0xc]
5:E925  66ff7608             push dword ptr [bp + 8]
5:E929  ff7606               push word ptr [bp + 6]
5:E92C  9ac2dc00e9           lcall 0xe900, 0xdcc2  ; sub_s7:DCC2
5:E931  c45e06               les bx, ptr [bp + 6]
5:E934  26c747240000         mov word ptr es:[bx + 0x24], 0
5:E93A  26c707f6ee           mov word ptr es:[bx], 0xeef6
5:E93F  26c7470214e9         mov word ptr es:[bx + 2], 0xe914  ; SEGMENT s5:0000
5:E945  8bc3                 mov ax, bx
5:E947  8cc2                 mov dx, es
5:E949  c9                   leave
5:E94A  ca0a00               retf 0xa
5:E94D  db 00

; ---------------- sub_s5:E94E FAR size=70 callers=0
5:E94E  c80a0000             enter 0xa, 0
5:E952  66ff760a             push dword ptr [bp + 0xa]
5:E956  66ff7606             push dword ptr [bp + 6]
5:E95A  9a7cde2fe9           lcall 0xe92f, 0xde7c  ; sub_s7:DE7C
5:E95F  0bc0                 or ax, ax
5:E961  742c                 je 0xe98f
5:E963  c45e06               les bx, ptr [bp + 6]
5:E966  268b4724             mov ax, word ptr es:[bx + 0x24]
5:E96A  8946f6               mov word ptr [bp - 0xa], ax
5:E96D  666a02               push 2
5:E970  8d46f6               lea ax, [bp - 0xa]
5:E973  16                   push ss
5:E974  50                   push ax
5:E975  66ff760a             push dword ptr [bp + 0xa]
5:E979  9a1c7e3de7           lcall 0xe73d, 0x7e1c  ; File_write@s2:7E1C
5:E97E  0bc0                 or ax, ax
5:E980  750a                 jne 0xe98c
5:E982  c7061003d006         mov word ptr [0x310], 0x6d0
5:E988  c9                   leave
5:E989  ca0800               retf 8
loc_E98C:
5:E98C  b80100               mov ax, 1
loc_E98F:
5:E98F  c9                   leave
5:E990  ca0800               retf 8
5:E993  db 00

; ---------------- sub_s5:E994 FAR size=64 callers=0
5:E994  c80e0000             enter 0xe, 0
5:E998  66ff760a             push dword ptr [bp + 0xa]
5:E99C  66ff7606             push dword ptr [bp + 6]
5:E9A0  9ac4de5de9           lcall 0xe95d, 0xdec4  ; sub_s7:DEC4
5:E9A5  0bc0                 or ax, ax
5:E9A7  7426                 je 0xe9cf
5:E9A9  666a02               push 2
5:E9AC  668b4606             mov eax, dword ptr [bp + 6]
5:E9B0  052400               add ax, 0x24
5:E9B3  6650                 push eax
5:E9B5  66ff760a             push dword ptr [bp + 0xa]
5:E9B9  9aee7d7ce9           lcall 0xe97c, 0x7dee  ; File_read@s2:7DEE
5:E9BE  0bc0                 or ax, ax
5:E9C0  750a                 jne 0xe9cc
5:E9C2  c7061003d206         mov word ptr [0x310], 0x6d2
5:E9C8  c9                   leave
5:E9C9  ca0800               retf 8
loc_E9CC:
5:E9CC  b80100               mov ax, 1
loc_E9CF:
5:E9CF  c9                   leave
5:E9D0  ca0800               retf 8
5:E9D3  db 00

; ---------------- sub_s5:E9D4 FAR size=58 callers=0
5:E9D4  c8100000             enter 0x10, 0
5:E9D8  66ff7608             push dword ptr [bp + 8]
5:E9DC  ff7606               push word ptr [bp + 6]
5:E9DF  9a0cdfa3e9           lcall 0xe9a3, 0xdf0c  ; sub_s7:DF0C
5:E9E4  66ff7606             push dword ptr [bp + 6]
5:E9E8  9a8eb594e8           lcall 0xe894, 0xb58e  ; DbObj::getOwner@s6:B58E
5:E9ED  8946fc               mov word ptr [bp - 4], ax
5:E9F0  8956fe               mov word ptr [bp - 2], dx
5:E9F3  c45efc               les bx, ptr [bp - 4]
5:E9F6  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:E9FB  666800000100         push 0x10000
5:EA01  6a01                 push 1
5:EA03  6650                 push eax
5:EA05  9adc57efe0           lcall 0xe0ef, 0x57dc  ; sub_s8:57DC
5:EA0A  c9                   leave
5:EA0B  ca0600               retf 6

; ---------------- sub_s5:EA0E FAR size=18 callers=0
5:EA0E  55                   push bp
5:EA0F  8bec                 mov bp, sp
5:EA11  6a01                 push 1
5:EA13  66ff7606             push dword ptr [bp + 6]
5:EA17  9aacbdebe9           lcall 0xe9eb, 0xbdac  ; sub_s6:BDAC
5:EA1C  c9                   leave
5:EA1D  ca0400               retf 4

; ---------------- sub_s5:EA20 size=656 callers=0
5:EA20  c8440100             enter 0x144, 0
5:EA24  66ff7612             push dword ptr [bp + 0x12]
5:EA28  66ff760e             push dword ptr [bp + 0xe]
5:EA2C  66ff760a             push dword ptr [bp + 0xa]
5:EA30  66ff7606             push dword ptr [bp + 6]
5:EA34  9aaac350ea           lcall 0xea50, 0xc3aa  ; sub_s6:C3AA
5:EA39  0bc0                 or ax, ax
5:EA3B  7432                 je 0xea6f
5:EA3D  66ff7612             push dword ptr [bp + 0x12]
5:EA41  66ff760e             push dword ptr [bp + 0xe]
5:EA45  66ff760a             push dword ptr [bp + 0xa]
5:EA49  66ff7606             push dword ptr [bp + 6]
5:EA4D  9a3ec269ea           lcall 0xea69, 0xc23e  ; sub_s6:C23E
5:EA52  0bc0                 or ax, ax
5:EA54  7419                 je 0xea6f
5:EA56  66ff7612             push dword ptr [bp + 0x12]
5:EA5A  66ff760e             push dword ptr [bp + 0xe]
5:EA5E  66ff760a             push dword ptr [bp + 0xa]
5:EA62  66ff7606             push dword ptr [bp + 6]
5:EA66  9a14c385ea           lcall 0xea85, 0xc314  ; sub_s6:C314
5:EA6B  0bc0                 or ax, ax
5:EA6D  7507                 jne 0xea76
loc_EA6F:
5:EA6F  33c0                 xor ax, ax
5:EA71  c9                   leave
5:EA72  ca1000               retf 0x10
5:EA75  db 90
loc_EA76:
5:EA76  66ff7612             push dword ptr [bp + 0x12]
5:EA7A  66ff760a             push dword ptr [bp + 0xa]
5:EA7E  66ff7606             push dword ptr [bp + 6]
5:EA82  9ab6c7f0ea           lcall 0xeaf0, 0xc7b6  ; sub_s6:C7B6
5:EA87  8946fe               mov word ptr [bp - 2], ax
5:EA8A  3d0500               cmp ax, 5
5:EA8D  740f                 je 0xea9e
5:EA8F  3d0400               cmp ax, 4
5:EA92  740a                 je 0xea9e
5:EA94  3d0600               cmp ax, 6
5:EA97  7405                 je 0xea9e
5:EA99  3d0900               cmp ax, 9
5:EA9C  7508                 jne 0xeaa6
loc_EA9E:
5:EA9E  c706ca50a806         mov word ptr [0x50ca], 0x6a8
5:EAA4  ebc9                 jmp 0xea6f
loc_EAA6:
5:EAA6  0bc0                 or ax, ax
5:EAA8  0f85fd01             jne 0xeca9
5:EAAC  8d46f0               lea ax, [bp - 0x10]
5:EAAF  16                   push ss
5:EAB0  50                   push ax
5:EAB1  66ff7612             push dword ptr [bp + 0x12]
5:EAB5  66ff760a             push dword ptr [bp + 0xa]
5:EAB9  66ff364057           push dword ptr [0x5740]
5:EABE  9ace6423eb           lcall 0xeb23, 0x64ce  ; sub_s7:64CE
5:EAC3  8bd8                 mov bx, ax
5:EAC5  8ec2                 mov es, dx
5:EAC7  66268b07             mov eax, dword ptr es:[bx]
5:EACB  268b5702             mov dx, word ptr es:[bx + 2]
5:EACF  668946fa             mov dword ptr [bp - 6], eax
5:EAD3  668946e6             mov dword ptr [bp - 0x1a], eax
5:EAD7  668946dc             mov dword ptr [bp - 0x24], eax
5:EADB  8a46df               mov al, byte ptr [bp - 0x21]
5:EADE  2ae4                 sub ah, ah
5:EAE0  a8ff                 test al, 0xff
5:EAE2  746a                 je 0xeb4e
5:EAE4  52                   push dx
5:EAE5  ff76fa               push word ptr [bp - 6]
5:EAE8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:EAED  9aece11aec           lcall 0xec1a, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:EAF2  8946dc               mov word ptr [bp - 0x24], ax
5:EAF5  8956de               mov word ptr [bp - 0x22], dx
5:EAF8  c45edc               les bx, ptr [bp - 0x24]
5:EAFB  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:EB00  668946e0             mov dword ptr [bp - 0x20], eax
5:EB04  668b460e             mov eax, dword ptr [bp + 0xe]
5:EB08  c45ee0               les bx, ptr [bp - 0x20]
5:EB0B  6626394704           cmp dword ptr es:[bx + 4], eax
5:EB10  740a                 je 0xeb1c
5:EB12  c706ca50b706         mov word ptr [0x50ca], 0x6b7
5:EB18  e954ff               jmp 0xea6f
5:EB1B  db 90
loc_EB1C:
5:EB1C  66ff76dc             push dword ptr [bp - 0x24]
5:EB20  9aa87327ec           lcall 0xec27, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:EB25  8946e6               mov word ptr [bp - 0x1a], ax
5:EB28  8956e8               mov word ptr [bp - 0x18], dx
5:EB2B  c45ee6               les bx, ptr [bp - 0x1a]
5:EB2E  268b470c             mov ax, word ptr es:[bx + 0xc]
5:EB32  3d4100               cmp ax, 0x41
5:EB35  744b                 je 0xeb82
5:EB37  7f6d                 jg 0xeba6
5:EB39  3d3e00               cmp ax, 0x3e
5:EB3C  7444                 je 0xeb82
5:EB3E  770e                 ja 0xeb4e
5:EB40  2c0b                 sub al, 0xb
5:EB42  744e                 je 0xeb92
5:EB44  2c05                 sub al, 5
5:EB46  0f8425ff             je 0xea6f
5:EB4A  2c27                 sub al, 0x27
5:EB4C  7444                 je 0xeb92
loc_EB4E:
5:EB4E  68b400               push 0xb4
5:EB51  9a9c1781e8           lcall 0xe881, 0x179c  ; operator_new@s1:179C
5:EB56  83c402               add sp, 2
5:EB59  8946c8               mov word ptr [bp - 0x38], ax
5:EB5C  8956ca               mov word ptr [bp - 0x36], dx
5:EB5F  0bd0                 or dx, ax
5:EB61  746b                 je 0xebce
5:EB63  66687b05e805         push 0x5e8057b
5:EB69  666824000200         push 0x20024
5:EB6F  ff369603             push word ptr [0x396]
5:EB73  ff76ca               push word ptr [bp - 0x36]
5:EB76  50                   push ax
5:EB77  9a20852a5f           lcall 0x5f2a, 0x8520  ; sub_s9:8520
5:EB7C  83c40e               add sp, 0xe
5:EB7F  eb50                 jmp 0xebd1
5:EB81  db 90
loc_EB82:
5:EB82  26837f1204           cmp word ptr es:[bx + 0x12], 4
5:EB87  75c5                 jne 0xeb4e
loc_EB89:
5:EB89  c706ca50b106         mov word ptr [0x50ca], 0x6b1
5:EB8F  e9ddfe               jmp 0xea6f
loc_EB92:
5:EB92  c706ca50b406         mov word ptr [0x50ca], 0x6b4
5:EB98  e9d4fe               jmp 0xea6f
5:EB9B  db 90
loc_EB9C:
5:EB9C  c706ca50b006         mov word ptr [0x50ca], 0x6b0
5:EBA2  e9cafe               jmp 0xea6f
5:EBA5  db 90
loc_EBA6:
5:EBA6  3d6b00               cmp ax, 0x6b
5:EBA9  74de                 je 0xeb89
5:EBAB  7f0d                 jg 0xebba
5:EBAD  2d4200               sub ax, 0x42
5:EBB0  74d7                 je 0xeb89
5:EBB2  2d0900               sub ax, 9
5:EBB5  74d2                 je 0xeb89
5:EBB7  eb95                 jmp 0xeb4e
5:EBB9  db 90
loc_EBBA:
5:EBBA  2d6e00               sub ax, 0x6e
5:EBBD  0f84aefe             je 0xea6f
5:EBC1  2d0500               sub ax, 5
5:EBC4  7c88                 jl 0xeb4e
5:EBC6  2d0600               sub ax, 6
5:EBC9  7ed1                 jle 0xeb9c
5:EBCB  eb81                 jmp 0xeb4e
5:EBCD  db 90
loc_EBCE:
5:EBCE  33c0                 xor ax, ax
5:EBD0  99                   cdq
loc_EBD1:
5:EBD1  8946f6               mov word ptr [bp - 0xa], ax
5:EBD4  8956f8               mov word ptr [bp - 8], dx
5:EBD7  52                   push dx
5:EBD8  c45ef6               les bx, ptr [bp - 0xa]
5:EBDB  50                   push ax
5:EBDC  26c41f               les bx, ptr es:[bx]
5:EBDF  26ff5f74             lcall es:[bx + 0x74]
5:EBE3  8946f4               mov word ptr [bp - 0xc], ax
5:EBE6  3d0700               cmp ax, 7
5:EBE9  7509                 jne 0xebf4
5:EBEB  c706ca500100         mov word ptr [0x50ca], 1
5:EBF1  e97bfe               jmp 0xea6f
loc_EBF4:
5:EBF4  668b46fa             mov eax, dword ptr [bp - 6]
5:EBF8  8b56fc               mov dx, word ptr [bp - 4]
5:EBFB  668946d4             mov dword ptr [bp - 0x2c], eax
5:EBFF  668946e0             mov dword ptr [bp - 0x20], eax
5:EC03  8a46e3               mov al, byte ptr [bp - 0x1d]
5:EC06  2ae4                 sub ah, ah
5:EC08  a8ff                 test al, 0xff
5:EC0A  0f849b00             je 0xeca9
5:EC0E  52                   push dx
5:EC0F  ff76fa               push word ptr [bp - 6]
5:EC12  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:EC17  9aece171ec           lcall 0xec71, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:EC1C  8946d0               mov word ptr [bp - 0x30], ax
5:EC1F  8956d2               mov word ptr [bp - 0x2e], dx
5:EC22  52                   push dx
5:EC23  50                   push ax
5:EC24  9a967230ec           lcall 0xec30, 0x7296  ; sub_s7:7296
5:EC29  66ff76d0             push dword ptr [bp - 0x30]
5:EC2D  9a0a7356ec           lcall 0xec56, 0x730a  ; sub_s7:730A
5:EC32  6a2f                 push 0x2f
5:EC34  66ff36d00e           push dword ptr [0xed0]  ; g_registry
5:EC39  9aba204dec           lcall 0xec4d, 0x20ba  ; sub_s3:20BA
5:EC3E  8946d4               mov word ptr [bp - 0x2c], ax
5:EC41  8956d6               mov word ptr [bp - 0x2a], dx
5:EC44  66ff76d0             push dword ptr [bp - 0x30]
5:EC48  52                   push dx
5:EC49  50                   push ax
5:EC4A  9a68ec40de           lcall 0xde40, 0xec68  ; sub_s3:EC68
5:EC4F  66ff76d0             push dword ptr [bp - 0x30]
5:EC53  9aa8738bec           lcall 0xec8b, 0x73a8  ; DbObj::resolveLink16@s7:73A8
5:EC58  8946d8               mov word ptr [bp - 0x28], ax
5:EC5B  8956da               mov word ptr [bp - 0x26], dx
5:EC5E  52                   push dx
5:EC5F  c45ed8               les bx, ptr [bp - 0x28]
5:EC62  50                   push ax
5:EC63  26c41f               les bx, ptr es:[bx]
5:EC66  26ff5f24             lcall es:[bx + 0x24]
5:EC6A  66ff76d8             push dword ptr [bp - 0x28]
5:EC6E  9a4abc1aea           lcall 0xea1a, 0xbc4a  ; sub_s6:BC4A
5:EC73  c45e06               les bx, ptr [bp + 6]
5:EC76  26894724             mov word ptr es:[bx + 0x24], ax
5:EC7A  c45ed0               les bx, ptr [bp - 0x30]
5:EC7D  6626ff7716           push dword ptr es:[bx + 0x16]
5:EC82  8d86bcfe             lea ax, [bp - 0x144]
5:EC86  16                   push ss
5:EC87  50                   push ax
5:EC88  9afae49bec           lcall 0xec9b, 0xe4fa  ; SCKillBldg@s7:E4FA
5:EC8D  8d86bcfe             lea ax, [bp - 0x144]
5:EC91  16                   push ss
5:EC92  50                   push ax
5:EC93  66ff364857           push dword ptr [0x5748]  ; g_sim
5:EC98  9a5a83e2e9           lcall 0xe9e2, 0x835a  ; Sim::enqueue@s7:835A
5:EC9D  c786bcfe9a38         mov word ptr [bp - 0x144], 0x389a
5:ECA3  c786befebce9         mov word ptr [bp - 0x142], 0xe9bc  ; SEGMENT s2:0000
loc_ECA9:
5:ECA9  b80100               mov ax, 1
5:ECAC  c9                   leave
5:ECAD  ca1000               retf 0x10

; ---------------- sub_s5:ECB0 size=140 callers=0
5:ECB0  c8100000             enter 0x10, 0
5:ECB4  c45e06               les bx, ptr [bp + 6]
5:ECB7  6626ff7708           push dword ptr es:[bx + 8]
5:ECBC  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
5:ECC1  9aece135ed           lcall 0xed35, 0xe1ec  ; Db::resolveHandle@s6:E1EC
5:ECC6  8946fc               mov word ptr [bp - 4], ax
5:ECC9  8956fe               mov word ptr [bp - 2], dx
5:ECCC  c45e06               les bx, ptr [bp + 6]
5:ECCF  26837f1201           cmp word ptr es:[bx + 0x12], 1
5:ECD4  755a                 jne 0xed30
5:ECD6  c45efc               les bx, ptr [bp - 4]
5:ECD9  268b4714             mov ax, word ptr es:[bx + 0x14]
5:ECDD  eb25                 jmp 0xed04
5:ECDF  db 90
loc_ECE0:
5:ECE0  c746fa0100           mov word ptr [bp - 6], 1
5:ECE5  eb3b                 jmp 0xed22
5:ECE7  db 90
loc_ECE8:
5:ECE8  c746fa0200           mov word ptr [bp - 6], 2
5:ECED  eb33                 jmp 0xed22
5:ECEF  db 90
loc_ECF0:
5:ECF0  c746fa0300           mov word ptr [bp - 6], 3
5:ECF5  eb2b                 jmp 0xed22
5:ECF7  db 90
loc_ECF8:
5:ECF8  c45efc               les bx, ptr [bp - 4]
5:ECFB  268b4714             mov ax, word ptr es:[bx + 0x14]
5:ECFF  8946fa               mov word ptr [bp - 6], ax
5:ED02  eb1e                 jmp 0xed22
loc_ED04:
5:ED04  48                   dec ax
5:ED05  48                   dec ax
5:ED06  3d0600               cmp ax, 6
5:ED09  77ed                 ja 0xecf8
5:ED0B  03c0                 add ax, ax
5:ED0D  93                   xchg bx, ax
5:ED0E  2effa714ed           jmp word ptr cs:[bx - 0x12ec]
5:ED13  db 90
switch_table_ED14:
    dw loc_ECE8
    dw loc_ECF0
    dw loc_ECF8
    dw loc_ECE0
    dw loc_ECE0
    dw loc_ECE8
    dw loc_ECF0
loc_ED22:
5:ED22  8b46fa               mov ax, word ptr [bp - 6]
5:ED25  c45e06               les bx, ptr [bp + 6]
5:ED28  26894714             mov word ptr es:[bx + 0x14], ax
5:ED2C  c9                   leave
5:ED2D  ca0400               retf 4
loc_ED30:
5:ED30  06                   push es
5:ED31  53                   push bx
5:ED32  9a22bf37ea           lcall 0xea37, 0xbf22  ; sub_s6:BF22
5:ED37  c9                   leave
5:ED38  ca0400               retf 4
5:ED3B  db 00

; ---------------- sub_s5:ED3C FAR size=254 callers=0
5:ED3C  c8420100             enter 0x142, 0
5:ED40  57                   push di
5:ED41  56                   push si
5:ED42  c45e06               les bx, ptr [bp + 6]
5:ED45  26ff4f14             dec word ptr es:[bx + 0x14]
5:ED49  0f85e700             jne 0xee34
5:ED4D  26c747120000         mov word ptr es:[bx + 0x12], 0
5:ED53  06                   push es
5:ED54  53                   push bx
5:ED55  9a8eb5cbed           lcall 0xedcb, 0xb58e  ; DbObj::getOwner@s6:B58E
5:ED5A  8946fc               mov word ptr [bp - 4], ax
5:ED5D  8956fe               mov word ptr [bp - 2], dx
5:ED60  050c00               add ax, 0xc
5:ED63  1e                   push ds
5:ED64  8d7ef6               lea di, [bp - 0xa]
5:ED67  8bf0                 mov si, ax
5:ED69  16                   push ss
5:ED6A  07                   pop es
5:ED6B  8eda                 mov ds, dx
5:ED6D  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:ED6F  a5                   movsw word ptr es:[di], word ptr [si]
5:ED70  1f                   pop ds
5:ED71  8d46f6               lea ax, [bp - 0xa]
5:ED74  8946e4               mov word ptr [bp - 0x1c], ax
5:ED77  8d46f4               lea ax, [bp - 0xc]
5:ED7A  16                   push ss
5:ED7B  50                   push ax
5:ED7C  8d46f2               lea ax, [bp - 0xe]
5:ED7F  16                   push ss
5:ED80  50                   push ax
5:ED81  8d46f0               lea ax, [bp - 0x10]
5:ED84  16                   push ss
5:ED85  50                   push ax
5:ED86  8d46f6               lea ax, [bp - 0xa]
5:ED89  16                   push ss
5:ED8A  50                   push ax
5:ED8B  9ab43e32ee           lcall 0xee32, 0x3eb4  ; sub_s2:3EB4
5:ED90  837ef000             cmp word ptr [bp - 0x10], 0
5:ED94  7e06                 jle 0xed9c
5:ED96  b80600               mov ax, 6
5:ED99  eb04                 jmp 0xed9f
5:ED9B  db 90
loc_ED9C:
5:ED9C  b80500               mov ax, 5
loc_ED9F:
5:ED9F  8946e4               mov word ptr [bp - 0x1c], ax
5:EDA2  c45efc               les bx, ptr [bp - 4]
5:EDA5  26894714             mov word ptr es:[bx + 0x14], ax
5:EDA9  837ef001             cmp word ptr [bp - 0x10], 1
5:EDAD  7c05                 jl 0xedb4
5:EDAF  b80900               mov ax, 9
5:EDB2  eb03                 jmp 0xedb7
loc_EDB4:
5:EDB4  b80500               mov ax, 5
loc_EDB7:
5:EDB7  8946ee               mov word ptr [bp - 0x12], ax
5:EDBA  50                   push ax
5:EDBB  66ff7606             push dword ptr [bp + 6]
5:EDBF  90                   nop
5:EDC0  0e                   push cs
5:EDC1  e87600               call 0xee3a  ; sub_s5:EE3A
5:EDC4  66ff7606             push dword ptr [bp + 6]
5:EDC8  9a8eb516ee           lcall 0xee16, 0xb58e  ; DbObj::getOwner@s6:B58E
5:EDCD  8946ea               mov word ptr [bp - 0x16], ax
5:EDD0  8956ec               mov word ptr [bp - 0x14], dx
5:EDD3  c45eea               les bx, ptr [bp - 0x16]
5:EDD6  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:EDDB  668946e6             mov dword ptr [bp - 0x1a], eax
5:EDDF  666800000100         push 0x10000
5:EDE5  6a01                 push 1
5:EDE7  6650                 push eax
5:EDE9  9a045808ea           lcall 0xea08, 0x5804  ; sub_s8:5804
5:EDEE  c45e06               les bx, ptr [bp + 6]
5:EDF1  26837f2400           cmp word ptr es:[bx + 0x24], 0
5:EDF6  7e3c                 jle 0xee34
5:EDF8  c45ee6               les bx, ptr [bp - 0x1a]
5:EDFB  66268b4704           mov eax, dword ptr es:[bx + 4]
5:EE00  668946dc             mov dword ptr [bp - 0x24], eax
5:EE04  6650                 push eax
5:EE06  c45e06               les bx, ptr [bp + 6]
5:EE09  26ff7724             push word ptr es:[bx + 0x24]
5:EE0D  8d86cafe             lea ax, [bp - 0x136]
5:EE11  16                   push ss
5:EE12  50                   push ax
5:EE13  9ade68c4ec           lcall 0xecc4, 0x68de  ; SCAddSpew@s6:68DE
5:EE18  8d86cafe             lea ax, [bp - 0x136]
5:EE1C  16                   push ss
5:EE1D  50                   push ax
5:EE1E  66ff364857           push dword ptr [0x5748]  ; g_sim
5:EE23  9a5a83c1ea           lcall 0xeac1, 0x835a  ; Sim::enqueue@s7:835A
5:EE28  c786cafe9a38         mov word ptr [bp - 0x136], 0x389a
5:EE2E  c786ccfea7ec         mov word ptr [bp - 0x134], 0xeca7  ; SEGMENT s2:0000
loc_EE34:
5:EE34  5e                   pop si
5:EE35  5f                   pop di
5:EE36  c9                   leave
5:EE37  ca0400               retf 4

; ---------------- sub_s5:EE3A FAR size=150 callers=1
5:EE3A  c8500100             enter 0x150, 0
5:EE3E  57                   push di
5:EE3F  56                   push si
5:EE40  66ff7606             push dword ptr [bp + 6]
5:EE44  9a8eb56eee           lcall 0xee6e, 0xb58e  ; DbObj::getOwner@s6:B58E
5:EE49  8946fc               mov word ptr [bp - 4], ax
5:EE4C  8956fe               mov word ptr [bp - 2], dx
5:EE4F  050c00               add ax, 0xc
5:EE52  1e                   push ds
5:EE53  8d7ef6               lea di, [bp - 0xa]
5:EE56  8bf0                 mov si, ax
5:EE58  16                   push ss
5:EE59  07                   pop es
5:EE5A  8eda                 mov ds, dx
5:EE5C  66a5                 movsd dword ptr es:[di], dword ptr [si]
5:EE5E  a5                   movsw word ptr es:[di], word ptr [si]
5:EE5F  1f                   pop ds
5:EE60  8d46f6               lea ax, [bp - 0xa]
5:EE63  8986c4fe             mov word ptr [bp - 0x13c], ax
5:EE67  66ff7606             push dword ptr [bp + 6]
5:EE6B  9a24bbabee           lcall 0xeeab, 0xbb24  ; sub_s6:BB24
5:EE70  8946f2               mov word ptr [bp - 0xe], ax
5:EE73  8956f4               mov word ptr [bp - 0xc], dx
5:EE76  c45efc               les bx, ptr [bp - 4]
5:EE79  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
5:EE7E  668946ee             mov dword ptr [bp - 0x12], eax
5:EE82  c45eee               les bx, ptr [bp - 0x12]
5:EE85  66268b4704           mov eax, dword ptr es:[bx + 4]
5:EE8A  668946ea             mov dword ptr [bp - 0x16], eax
5:EE8E  66ff76f2             push dword ptr [bp - 0xe]
5:EE92  6650                 push eax
5:EE94  8d46f6               lea ax, [bp - 0xa]
5:EE97  16                   push ss
5:EE98  50                   push ax
5:EE99  ff760a               push word ptr [bp + 0xa]
5:EE9C  666800000100         push 0x10000
5:EEA2  8d86c6fe             lea ax, [bp - 0x13a]
5:EEA6  16                   push ss
5:EEA7  50                   push ax
5:EEA8  9af08758ed           lcall 0xed58, 0x87f0  ; SCInternalPutBldg@s6:87F0
5:EEAD  8d86c6fe             lea ax, [bp - 0x13a]
5:EEB1  16                   push ss
5:EEB2  50                   push ax
5:EEB3  66ff364857           push dword ptr [0x5748]  ; g_sim
5:EEB8  9a5a8326ee           lcall 0xee26, 0x835a  ; Sim::enqueue@s7:835A
5:EEBD  c786c6fe9a38         mov word ptr [bp - 0x13a], 0x389a
5:EEC3  c786c8fe8eed         mov word ptr [bp - 0x138], 0xed8e  ; SEGMENT s2:0000
5:EEC9  5e                   pop si
5:EECA  5f                   pop di
5:EECB  c9                   leave
5:EECC  ca0600               retf 6
5:EECF  db 00

; ---------------- sub_s5:EED0 FAR size=172 callers=0
5:EED0  c8040000             enter 4, 0
5:EED4  66ff7606             push dword ptr [bp + 6]
5:EED8  9af4dcbbee           lcall 0xeebb, 0xdcf4  ; sub_s7:DCF4
5:EEDD  f6460a01             test byte ptr [bp + 0xa], 1
5:EEE1  7409                 je 0xeeec
5:EEE3  66ff7606             push dword ptr [bp + 6]
5:EEE7  9ace1754eb           lcall 0xeb54, 0x17ce  ; operator_delete@s1:17CE
loc_EEEC:
5:EEEC  8b4606               mov ax, word ptr [bp + 6]
5:EEEF  8b5608               mov dx, word ptr [bp + 8]
5:EEF2  c9                   leave
5:EEF3  ca0600               retf 6
5:EEF6  db d0 ee 04 ef 56 bb 0c ef 8e 17 db ee 4e e9 08 ef
5:EF06  db 94 e9 10 ef 1c bc 1c ef d4 e9 14 ef 20 ea 18 ef
5:EF16  db 0e ea 30 ef 14 b5 20 ef 2a be 24 ef 16 bf 28 ef
5:EF26  db 1a bf 2c ef 1e bf 38 ef 3c ed 34 ef b0 ec 43 e9
5:EF36  db f0 bb 3c ef 02 bc 40 ef a8 b5 44 ef ca b5 48 ef
5:EF46  db e6 b4 4c ef ec b4 50 ef 6e b4 54 ef 4a c6 58 ef
5:EF56  db 22 c5 5c ef d2 ce 47 ee 55 8b ec c4 5e 06 26 c7
5:EF66  db 07 00 00 26 c7 47 02 76 ef 66 ff 76 06 9a 18 b4
5:EF76  db fc ee c9 ca 04 00

; ---------------- sub_s5:EF7C FAR size=4 callers=0
5:EF7C  ca0400               retf 4
5:EF7F  db 00

; ---------------- sub_s5:EF80 FAR size=4 callers=0
5:EF80  ca0400               retf 4
5:EF83  db 00

; ---------------- sub_s5:EF84 FAR size=4 callers=0
5:EF84  ca0400               retf 4
5:EF87  db 00

; ---------------- sub_s5:EF88 FAR size=4 callers=0
5:EF88  ca0600               retf 6
5:EF8B  db 00

; ---------------- sub_s5:EF8C FAR size=4 callers=0
5:EF8C  ca0400               retf 4
5:EF8F  db 00

; ---------------- sub_s5:EF90 FAR size=42 callers=0
5:EF90  ca0400               retf 4
5:EF93  db 00 55 8b ec 66 ff 76 06 90 0e e8 be ff f6 46 0a
5:EFA3  db 01 74 09 66 ff 76 06 9a ce 17 ea ee 8b 46 06 8b
5:EFB3  db 56 08 c9 ca 06 00 90
