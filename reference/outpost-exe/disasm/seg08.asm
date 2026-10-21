; OUTPOST.EXE segment 8 (CODE), 61329 bytes

; ---------------- SCMorale::clone@s8:0000 size=142 callers=0
8:0000  c8200000             enter 0x20, 0
8:0004  57                   push di
8:0005  56                   push si
8:0006  680801               push 0x108
8:0009  9a9c17ffff           lcall 0xffff, 0x179c  ; operator_new@s1:179C
8:000E  83c402               add sp, 2
8:0011  8946f8               mov word ptr [bp - 8], ax
8:0014  8956fa               mov word ptr [bp - 6], dx
8:0017  0bd0                 or dx, ax
8:0019  745f                 je 0x7a
8:001B  c45ef8               les bx, ptr [bp - 8]
8:001E  26c7079a38           mov word ptr es:[bx], 0x389a
8:0023  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT s2:0000
8:0029  c45e06               les bx, ptr [bp + 6]
8:002C  66268b4704           mov eax, dword ptr es:[bx + 4]
8:0031  c45ef8               les bx, ptr [bp - 8]
8:0034  6626894704           mov dword ptr es:[bx + 4], eax
8:0039  8b4606               mov ax, word ptr [bp + 6]
8:003C  8b5608               mov dx, word ptr [bp + 8]
8:003F  050800               add ax, 8
8:0042  1e                   push ds
8:0043  8d7f08               lea di, [bx + 8]
8:0046  8bf0                 mov si, ax
8:0048  8eda                 mov ds, dx
8:004A  66b940000000         mov ecx, 0x40
8:0050  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
8:0053  1f                   pop ds
8:0054  c45ef8               les bx, ptr [bp - 8]
8:0057  26c707d26a           mov word ptr es:[bx], 0x6ad2
8:005C  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT s6:0000
8:0062  c45ef8               les bx, ptr [bp - 8]
8:0065  26c707960b           mov word ptr es:[bx], 0xb96
8:006A  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT s8:0000
8:0070  668b46f8             mov eax, dword ptr [bp - 8]
8:0074  668946fc             mov dword ptr [bp - 4], eax
8:0078  eb08                 jmp 0x82
loc_007A:
8:007A  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_0082:
8:0082  8b46fc               mov ax, word ptr [bp - 4]
8:0085  8b56fe               mov dx, word ptr [bp - 2]
8:0088  5e                   pop si
8:0089  5f                   pop di
8:008A  c9                   leave
8:008B  ca0400               retf 4

; ---------------- sub_s8:008E FAR size=306 callers=1
8:008E  c82a0000             enter 0x2a, 0
8:0092  c45e0a               les bx, ptr [bp + 0xa]
8:0095  6626817f0401000004   cmp dword ptr es:[bx + 4], 0x4000001
8:009E  7406                 je 0xa6
8:00A0  33c0                 xor ax, ax
8:00A2  c9                   leave
8:00A3  ca0800               retf 8
loc_00A6:
8:00A6  6a2c                 push 0x2c
8:00A8  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:00AD  9aba204b01           lcall 0x14b, 0x20ba  ; sub_s3:20BA
8:00B2  8946fc               mov word ptr [bp - 4], ax
8:00B5  8956fe               mov word ptr [bp - 2], dx
8:00B8  666801006400         push 0x640001
8:00BE  9a2e616801           lcall 0x168, 0x612e  ; sub_s2:612E
8:00C3  83c404               add sp, 4
8:00C6  8946f8               mov word ptr [bp - 8], ax
8:00C9  c746f60000           mov word ptr [bp - 0xa], 0
8:00CE  c45efc               les bx, ptr [bp - 4]
8:00D1  268b470a             mov ax, word ptr es:[bx + 0xa]
8:00D5  48                   dec ax
8:00D6  740e                 je 0xe6
8:00D8  48                   dec ax
8:00D9  7410                 je 0xeb
8:00DB  48                   dec ax
8:00DC  7414                 je 0xf2
8:00DE  48                   dec ax
8:00DF  7437                 je 0x118
8:00E1  48                   dec ax
8:00E2  741a                 je 0xfe
8:00E4  eb50                 jmp 0x136
loc_00E6:
8:00E6  c746f61500           mov word ptr [bp - 0xa], 0x15
loc_00EB:
8:00EB  c746faffff           mov word ptr [bp - 6], 0xffff
8:00F0  eb49                 jmp 0x13b
loc_00F2:
8:00F2  c746f61600           mov word ptr [bp - 0xa], 0x16
8:00F7  c746fa0100           mov word ptr [bp - 6], 1
8:00FC  eb3d                 jmp 0x13b
loc_00FE:
8:00FE  837ef832             cmp word ptr [bp - 8], 0x32
8:0102  7d08                 jge 0x10c
8:0104  c746fa0200           mov word ptr [bp - 6], 2
8:0109  eb06                 jmp 0x111
8:010B  db 90
loc_010C:
8:010C  c746fafeff           mov word ptr [bp - 6], 0xfffe
loc_0111:
8:0111  c746f61900           mov word ptr [bp - 0xa], 0x19
8:0116  eb23                 jmp 0x13b
loc_0118:
8:0118  837ef832             cmp word ptr [bp - 8], 0x32
8:011C  7d0c                 jge 0x12a
8:011E  c746fa0200           mov word ptr [bp - 6], 2
8:0123  c746f61700           mov word ptr [bp - 0xa], 0x17
8:0128  eb11                 jmp 0x13b
loc_012A:
8:012A  c746fafeff           mov word ptr [bp - 6], 0xfffe
8:012F  c746f61800           mov word ptr [bp - 0xa], 0x18
8:0134  eb05                 jmp 0x13b
loc_0136:
8:0136  c746fa0000           mov word ptr [bp - 6], 0
loc_013B:
8:013B  837ef600             cmp word ptr [bp - 0xa], 0
8:013F  741e                 je 0x15f
8:0141  6a2b                 push 0x2b
8:0143  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:0148  9aba205d01           lcall 0x15d, 0x20ba  ; sub_s3:20BA
8:014D  ff76f6               push word ptr [bp - 0xa]
8:0150  c45e0a               les bx, ptr [bp + 0xa]
8:0153  6626ff7704           push dword ptr es:[bx + 4]
8:0158  52                   push dx
8:0159  50                   push ax
8:015A  9a3a04ffff           lcall 0xffff, 0x43a  ; sub_s3:043A
loc_015F:
8:015F  6a00                 push 0
8:0161  66ff76fc             push dword ptr [bp - 4]
8:0165  9a74eb9f01           lcall 0x19f, 0xeb74  ; sub_s2:EB74
8:016A  c45efc               les bx, ptr [bp - 4]
8:016D  268b470c             mov ax, word ptr es:[bx + 0xc]
8:0171  268b570e             mov dx, word ptr es:[bx + 0xe]
8:0175  8946f2               mov word ptr [bp - 0xe], ax
8:0178  8bc2                 mov ax, dx
8:017A  0b46f2               or ax, word ptr [bp - 0xe]
8:017D  753a                 jne 0x1b9
8:017F  c45e0a               les bx, ptr [bp + 0xa]
8:0182  26817f18c800         cmp word ptr es:[bx + 0x18], 0xc8
8:0188  7f2f                 jg 0x1b9
8:018A  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:018E  66268b07             mov eax, dword ptr es:[bx]
8:0192  668946e0             mov dword ptr [bp - 0x20], eax
8:0196  666800000800         push 0x80000
8:019C  9a2e612700           lcall 0x27, 0x612e  ; sub_s2:612E
8:01A1  99                   cdq
8:01A2  0346e0               add ax, word ptr [bp - 0x20]
8:01A5  1356e2               adc dx, word ptr [bp - 0x1e]
8:01A8  051e00               add ax, 0x1e
8:01AB  83d200               adc dx, 0
8:01AE  c45efc               les bx, ptr [bp - 4]
8:01B1  2689470c             mov word ptr es:[bx + 0xc], ax
8:01B5  2689570e             mov word ptr es:[bx + 0xe], dx
loc_01B9:
8:01B9  8b46fa               mov ax, word ptr [bp - 6]
8:01BC  c9                   leave
8:01BD  ca0800               retf 8

; ---------------- sub_s8:01C0 FAR size=384 callers=1
8:01C0  c85a0000             enter 0x5a, 0
8:01C4  57                   push di
8:01C5  56                   push si
8:01C6  c746fe0000           mov word ptr [bp - 2], 0
8:01CB  6a29                 push 0x29
8:01CD  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:01D2  9afac6ac02           lcall 0x2ac, 0xc6fa  ; sub_s2:C6FA
8:01D7  8946fa               mov word ptr [bp - 6], ax
8:01DA  8956fc               mov word ptr [bp - 4], dx
8:01DD  52                   push dx
8:01DE  50                   push ax
8:01DF  66ff760a             push dword ptr [bp + 0xa]
8:01E3  90                   nop
8:01E4  0e                   push cs
8:01E5  e8904c               call 0x4e78  ; sub_s8:4E78
8:01E8  8946f6               mov word ptr [bp - 0xa], ax
8:01EB  8956f8               mov word ptr [bp - 8], dx
8:01EE  8d46f4               lea ax, [bp - 0xc]
8:01F1  16                   push ss
8:01F2  50                   push ax
8:01F3  9aaebc7902           lcall 0x279, 0xbcae  ; sub_s7:BCAE
8:01F8  c45ef6               les bx, ptr [bp - 0xa]
8:01FB  06                   push es
8:01FC  53                   push bx
8:01FD  26c41f               les bx, ptr es:[bx]
8:0200  26ff5f10             lcall es:[bx + 0x10]
8:0204  8946f0               mov word ptr [bp - 0x10], ax
8:0207  8956f2               mov word ptr [bp - 0xe], dx
8:020A  c45e0a               les bx, ptr [bp + 0xa]
8:020D  66268b470c           mov eax, dword ptr es:[bx + 0xc]
8:0212  268b570e             mov dx, word ptr es:[bx + 0xe]
8:0216  668946ec             mov dword ptr [bp - 0x14], eax
8:021A  52                   push dx
8:021B  c45eec               les bx, ptr [bp - 0x14]
8:021E  50                   push ax
8:021F  26c41f               les bx, ptr es:[bx]
8:0222  26ff5f10             lcall es:[bx + 0x10]
8:0226  8946e8               mov word ptr [bp - 0x18], ax
8:0229  8956ea               mov word ptr [bp - 0x16], dx
8:022C  66c746e400000000     mov dword ptr [bp - 0x1c], 0
8:0234  e99c00               jmp 0x2d3
8:0237  db 90
loc_0238:
8:0238  8b56c8               mov dx, word ptr [bp - 0x38]
8:023B  050c00               add ax, 0xc
8:023E  1e                   push ds
8:023F  8d7ec0               lea di, [bp - 0x40]
8:0242  8bf0                 mov si, ax
8:0244  16                   push ss
8:0245  07                   pop es
8:0246  8eda                 mov ds, dx
8:0248  66a5                 movsd dword ptr es:[di], dword ptr [si]
8:024A  a5                   movsw word ptr es:[di], word ptr [si]
8:024B  1f                   pop ds
8:024C  8d46c0               lea ax, [bp - 0x40]
8:024F  8946b6               mov word ptr [bp - 0x4a], ax
8:0252  8b46c4               mov ax, word ptr [bp - 0x3c]
8:0255  8946ce               mov word ptr [bp - 0x32], ax
8:0258  8b46d4               mov ax, word ptr [bp - 0x2c]
8:025B  3946ce               cmp word ptr [bp - 0x32], ax
8:025E  7428                 je 0x288
loc_0260:
8:0260  66ff46d0             inc dword ptr [bp - 0x30]
loc_0264:
8:0264  668b46e8             mov eax, dword ptr [bp - 0x18]
8:0268  663946d0             cmp dword ptr [bp - 0x30], eax
8:026C  7361                 jae 0x2cf
8:026E  66ff76d0             push dword ptr [bp - 0x30]
8:0272  66ff76ec             push dword ptr [bp - 0x14]
8:0276  9a581d8f02           lcall 0x28f, 0x1d58  ; sub_s7:1D58
8:027B  8946c6               mov word ptr [bp - 0x3a], ax
8:027E  8956c8               mov word ptr [bp - 0x38], dx
8:0281  0bd0                 or dx, ax
8:0283  75b3                 jne 0x238
8:0285  ebd9                 jmp 0x260
8:0287  db 90
loc_0288:
8:0288  66ff76c6             push dword ptr [bp - 0x3a]
8:028C  9aa873c202           lcall 0x2c2, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:0291  8946bc               mov word ptr [bp - 0x44], ax
8:0294  8956be               mov word ptr [bp - 0x42], dx
8:0297  c45ebc               les bx, ptr [bp - 0x44]
8:029A  268b470c             mov ax, word ptr es:[bx + 0xc]
8:029E  8946ba               mov word ptr [bp - 0x46], ax
8:02A1  6a30                 push 0x30
8:02A3  50                   push ax
8:02A4  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:02A9  9aaec6c100           lcall 0xc1, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:02AE  0bc0                 or ax, ax
8:02B0  75ae                 jne 0x260
8:02B2  66ff76dc             push dword ptr [bp - 0x24]
8:02B6  66ff76c6             push dword ptr [bp - 0x3a]
8:02BA  8d46f4               lea ax, [bp - 0xc]
8:02BD  16                   push ss
8:02BE  50                   push ax
8:02BF  9a74bde802           lcall 0x2e8, 0xbd74  ; sub_s7:BD74
8:02C4  8946b8               mov word ptr [bp - 0x48], ax
8:02C7  3d0500               cmp ax, 5
8:02CA  7f94                 jg 0x260
8:02CC  ff46fe               inc word ptr [bp - 2]
loc_02CF:
8:02CF  66ff46e4             inc dword ptr [bp - 0x1c]
loc_02D3:
8:02D3  668b46f0             mov eax, dword ptr [bp - 0x10]
8:02D7  663946e4             cmp dword ptr [bp - 0x1c], eax
8:02DB  733b                 jae 0x318
8:02DD  66ff76e4             push dword ptr [bp - 0x1c]
8:02E1  66ff76f6             push dword ptr [bp - 0xa]
8:02E5  9a581dffff           lcall 0xffff, 0x1d58  ; sub_s7:1D58
8:02EA  8946dc               mov word ptr [bp - 0x24], ax
8:02ED  8956de               mov word ptr [bp - 0x22], dx
8:02F0  050c00               add ax, 0xc
8:02F3  1e                   push ds
8:02F4  8d7ed6               lea di, [bp - 0x2a]
8:02F7  8bf0                 mov si, ax
8:02F9  16                   push ss
8:02FA  07                   pop es
8:02FB  8eda                 mov ds, dx
8:02FD  66a5                 movsd dword ptr es:[di], dword ptr [si]
8:02FF  a5                   movsw word ptr es:[di], word ptr [si]
8:0300  1f                   pop ds
8:0301  8d46d6               lea ax, [bp - 0x2a]
8:0304  8946ce               mov word ptr [bp - 0x32], ax
8:0307  8b46da               mov ax, word ptr [bp - 0x26]
8:030A  8946d4               mov word ptr [bp - 0x2c], ax
8:030D  66c746d000000000     mov dword ptr [bp - 0x30], 0
8:0315  e94cff               jmp 0x264
loc_0318:
8:0318  668b46f6             mov eax, dword ptr [bp - 0xa]
8:031C  668946a6             mov dword ptr [bp - 0x5a], eax
8:0320  668946aa             mov dword ptr [bp - 0x56], eax
8:0324  660bc0               or eax, eax
8:0327  740d                 je 0x336
8:0329  6a01                 push 1
8:032B  c45ef6               les bx, ptr [bp - 0xa]
8:032E  06                   push es
8:032F  50                   push ax
8:0330  26c41f               les bx, ptr es:[bx]
8:0333  26ff1f               lcall es:[bx]
loc_0336:
8:0336  8b46fe               mov ax, word ptr [bp - 2]
8:0339  5e                   pop si
8:033A  5f                   pop di
8:033B  c9                   leave
8:033C  ca0800               retf 8
8:033F  db 00

; ---------------- sub_s8:0340 FAR size=664 callers=1
8:0340  c8440100             enter 0x144, 0
8:0344  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:0348  66268b07             mov eax, dword ptr es:[bx]
8:034C  668946fc             mov dword ptr [bp - 4], eax
8:0350  662bc0               sub eax, eax
8:0353  668946f8             mov dword ptr [bp - 8], eax
8:0357  8946f6               mov word ptr [bp - 0xa], ax
8:035A  8d46f4               lea ax, [bp - 0xc]
8:035D  16                   push ss
8:035E  50                   push ax
8:035F  8d46f0               lea ax, [bp - 0x10]
8:0362  16                   push ss
8:0363  50                   push ax
8:0364  66ff760c             push dword ptr [bp + 0xc]
8:0368  90                   nop
8:0369  0e                   push cs
8:036A  e87d49               call 0x4cea  ; sub_s8:4CEA
8:036D  c45e0c               les bx, ptr [bp + 0xc]
8:0370  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
8:0376  668946ec             mov dword ptr [bp - 0x14], eax
8:037A  6650                 push eax
8:037C  9ab838c605           lcall 0x5c6, 0x38b8  ; sub_s7:38B8
8:0381  8946e8               mov word ptr [bp - 0x18], ax
8:0384  8956ea               mov word ptr [bp - 0x16], dx
8:0387  837e0a00             cmp word ptr [bp + 0xa], 0
8:038B  7523                 jne 0x3b0
8:038D  837ef408             cmp word ptr [bp - 0xc], 8
8:0391  0f844401             je 0x4d9
8:0395  666a04               push 4
8:0398  52                   push dx
8:0399  50                   push ax
8:039A  6658                 pop eax
8:039C  6659                 pop ecx
8:039E  6699                 cdq
8:03A0  66f7f9               idiv ecx
8:03A3  668946f8             mov dword ptr [bp - 8], eax
8:03A7  c746f60800           mov word ptr [bp - 0xa], 8
8:03AC  e99c01               jmp 0x54b
8:03AF  db 90
loc_03B0:
8:03B0  837e0a0a             cmp word ptr [bp + 0xa], 0xa
8:03B4  7f22                 jg 0x3d8
8:03B6  837ef407             cmp word ptr [bp - 0xc], 7
8:03BA  0f841b01             je 0x4d9
8:03BE  666a0a               push 0xa
8:03C1  52                   push dx
8:03C2  50                   push ax
8:03C3  6658                 pop eax
8:03C5  6659                 pop ecx
8:03C7  6699                 cdq
8:03C9  66f7f9               idiv ecx
8:03CC  668946f8             mov dword ptr [bp - 8], eax
8:03D0  c746f60700           mov word ptr [bp - 0xa], 7
8:03D5  e97301               jmp 0x54b
loc_03D8:
8:03D8  837e0a19             cmp word ptr [bp + 0xa], 0x19
8:03DC  7f22                 jg 0x400
8:03DE  837ef406             cmp word ptr [bp - 0xc], 6
8:03E2  0f84f300             je 0x4d9
8:03E6  666a14               push 0x14
8:03E9  52                   push dx
8:03EA  50                   push ax
8:03EB  6658                 pop eax
8:03ED  6659                 pop ecx
8:03EF  6699                 cdq
8:03F1  66f7f9               idiv ecx
8:03F4  668946f8             mov dword ptr [bp - 8], eax
8:03F8  c746f60600           mov word ptr [bp - 0xa], 6
8:03FD  e94b01               jmp 0x54b
loc_0400:
8:0400  837e0a32             cmp word ptr [bp + 0xa], 0x32
8:0404  7f22                 jg 0x428
8:0406  837ef405             cmp word ptr [bp - 0xc], 5
8:040A  0f84cb00             je 0x4d9
8:040E  666a64               push 0x64
8:0411  52                   push dx
8:0412  50                   push ax
8:0413  6658                 pop eax
8:0415  6659                 pop ecx
8:0417  6699                 cdq
8:0419  66f7f9               idiv ecx
8:041C  668946f8             mov dword ptr [bp - 8], eax
8:0420  c746f60500           mov word ptr [bp - 0xa], 5
8:0425  e92301               jmp 0x54b
loc_0428:
8:0428  837e0a4b             cmp word ptr [bp + 0xa], 0x4b
8:042C  7f3e                 jg 0x46c
8:042E  668b46fc             mov eax, dword ptr [bp - 4]
8:0432  66b903000000         mov ecx, 3
8:0438  6633d2               xor edx, edx
8:043B  66f7f1               div ecx
8:043E  668bc2               mov eax, edx
8:0441  660bc0               or eax, eax
8:0444  0f850301             jne 0x54b
8:0448  837ef404             cmp word ptr [bp - 0xc], 4
8:044C  0f848300             je 0x4d3
8:0450  668b46e8             mov eax, dword ptr [bp - 0x18]
8:0454  66b964000000         mov ecx, 0x64
8:045A  6699                 cdq
8:045C  66f7f9               idiv ecx
8:045F  668946f8             mov dword ptr [bp - 8], eax
8:0463  c746f60400           mov word ptr [bp - 0xa], 4
8:0468  e9e000               jmp 0x54b
8:046B  db 90
loc_046C:
8:046C  837e0a64             cmp word ptr [bp + 0xa], 0x64
8:0470  7f3c                 jg 0x4ae
8:0472  668b46fc             mov eax, dword ptr [bp - 4]
8:0476  66b905000000         mov ecx, 5
8:047C  6633d2               xor edx, edx
8:047F  66f7f1               div ecx
8:0482  668bc2               mov eax, edx
8:0485  660bc0               or eax, eax
8:0488  0f85bf00             jne 0x54b
8:048C  837ef403             cmp word ptr [bp - 0xc], 3
8:0490  7441                 je 0x4d3
8:0492  668b46e8             mov eax, dword ptr [bp - 0x18]
8:0496  66b964000000         mov ecx, 0x64
8:049C  6699                 cdq
8:049E  66f7f9               idiv ecx
8:04A1  668946f8             mov dword ptr [bp - 8], eax
8:04A5  c746f60300           mov word ptr [bp - 0xa], 3
8:04AA  e99e00               jmp 0x54b
8:04AD  db 90
loc_04AE:
8:04AE  817e0a9600           cmp word ptr [bp + 0xa], 0x96
8:04B3  7f59                 jg 0x50e
8:04B5  668b46fc             mov eax, dword ptr [bp - 4]
8:04B9  66b90a000000         mov ecx, 0xa
8:04BF  6633d2               xor edx, edx
8:04C2  66f7f1               div ecx
8:04C5  668bc2               mov eax, edx
8:04C8  660bc0               or eax, eax
8:04CB  757e                 jne 0x54b
8:04CD  837ef402             cmp word ptr [bp - 0xc], 2
8:04D1  7521                 jne 0x4f4
loc_04D3:
8:04D3  8b46e8               mov ax, word ptr [bp - 0x18]
8:04D6  8b56ea               mov dx, word ptr [bp - 0x16]
loc_04D9:
8:04D9  3b56f2               cmp dx, word ptr [bp - 0xe]
8:04DC  7c0d                 jl 0x4eb
8:04DE  7f05                 jg 0x4e5
8:04E0  3b46f0               cmp ax, word ptr [bp - 0x10]
8:04E3  7606                 jbe 0x4eb
loc_04E5:
8:04E5  8b46f0               mov ax, word ptr [bp - 0x10]
8:04E8  8b56f2               mov dx, word ptr [bp - 0xe]
loc_04EB:
8:04EB  8946f8               mov word ptr [bp - 8], ax
8:04EE  8956fa               mov word ptr [bp - 6], dx
8:04F1  eb58                 jmp 0x54b
8:04F3  db 90
loc_04F4:
8:04F4  668b46e8             mov eax, dword ptr [bp - 0x18]
8:04F8  66b964000000         mov ecx, 0x64
8:04FE  6699                 cdq
8:0500  66f7f9               idiv ecx
8:0503  668946f8             mov dword ptr [bp - 8], eax
8:0507  c746f60200           mov word ptr [bp - 0xa], 2
8:050C  eb3d                 jmp 0x54b
loc_050E:
8:050E  817e0ac800           cmp word ptr [bp + 0xa], 0xc8
8:0513  7f36                 jg 0x54b
8:0515  668b46fc             mov eax, dword ptr [bp - 4]
8:0519  66b914000000         mov ecx, 0x14
8:051F  6633d2               xor edx, edx
8:0522  66f7f1               div ecx
8:0525  668bc2               mov eax, edx
8:0528  660bc0               or eax, eax
8:052B  751e                 jne 0x54b
8:052D  837ef401             cmp word ptr [bp - 0xc], 1
8:0531  74a0                 je 0x4d3
8:0533  668b46e8             mov eax, dword ptr [bp - 0x18]
8:0537  66b964000000         mov ecx, 0x64
8:053D  6699                 cdq
8:053F  66f7f9               idiv ecx
8:0542  668946f8             mov dword ptr [bp - 8], eax
8:0546  c746f60100           mov word ptr [bp - 0xa], 1
loc_054B:
8:054B  837ef600             cmp word ptr [bp - 0xa], 0
8:054F  7426                 je 0x577
8:0551  66837ee800           cmp dword ptr [bp - 0x18], 0
8:0556  740f                 je 0x567
8:0558  66837ef800           cmp dword ptr [bp - 8], 0
8:055D  7508                 jne 0x567
8:055F  66c746f801000000     mov dword ptr [bp - 8], 1
loc_0567:
8:0567  ff76f6               push word ptr [bp - 0xa]
8:056A  66ff76f8             push dword ptr [bp - 8]
8:056E  66ff760c             push dword ptr [bp + 0xc]
8:0572  90                   nop
8:0573  0e                   push cs
8:0574  e85947               call 0x4cd0  ; sub_s8:4CD0
loc_0577:
8:0577  8b46fa               mov ax, word ptr [bp - 6]
8:057A  0b46f8               or ax, word ptr [bp - 8]
8:057D  7454                 je 0x5d3
8:057F  c45e0c               les bx, ptr [bp + 0xc]
8:0582  662681bf000201000008 cmp dword ptr es:[bx + 0x200], 0x8000001
8:058C  7508                 jne 0x596
8:058E  c746e40200           mov word ptr [bp - 0x1c], 2
8:0593  eb06                 jmp 0x59b
8:0595  db 90
loc_0596:
8:0596  c746e40100           mov word ptr [bp - 0x1c], 1
loc_059B:
8:059B  c746e60004           mov word ptr [bp - 0x1a], 0x400
8:05A0  6626ff7704           push dword ptr es:[bx + 4]
8:05A5  66ff76e4             push dword ptr [bp - 0x1c]
8:05A9  66ff76f8             push dword ptr [bp - 8]
8:05AD  8d86c8fe             lea ax, [bp - 0x138]
8:05B1  16                   push ss
8:05B2  50                   push ax
8:05B3  9a4499d105           lcall 0x5d1, 0x9944  ; sub_s6:9944
8:05B8  8d86c8fe             lea ax, [bp - 0x138]
8:05BC  16                   push ss
8:05BD  50                   push ax
8:05BE  66ff364857           push dword ptr [0x5748]  ; g_sim
8:05C3  9a5a83f601           lcall 0x1f6, 0x835a  ; Sim::enqueue@s7:835A
8:05C8  8d86c8fe             lea ax, [bp - 0x138]
8:05CC  16                   push ss
8:05CD  50                   push ax
8:05CE  9a92996000           lcall 0x60, 0x9992  ; sub_s6:9992
loc_05D3:
8:05D3  c9                   leave
8:05D4  ca0a00               retf 0xa
8:05D7  db 00

; ---------------- sub_s8:05D8 FAR size=764 callers=1
8:05D8  c8560100             enter 0x156, 0
8:05DC  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:05E0  66268b07             mov eax, dword ptr es:[bx]
8:05E4  668946fc             mov dword ptr [bp - 4], eax
8:05E8  662bc0               sub eax, eax
8:05EB  668946f8             mov dword ptr [bp - 8], eax
8:05EF  8946f6               mov word ptr [bp - 0xa], ax
8:05F2  8d46f4               lea ax, [bp - 0xc]
8:05F5  16                   push ss
8:05F6  50                   push ax
8:05F7  8d46f0               lea ax, [bp - 0x10]
8:05FA  16                   push ss
8:05FB  50                   push ax
8:05FC  66ff760c             push dword ptr [bp + 0xc]
8:0600  90                   nop
8:0601  0e                   push cs
8:0602  e8e546               call 0x4cea  ; sub_s8:4CEA
8:0605  662bc0               sub eax, eax
8:0608  668946ec             mov dword ptr [bp - 0x14], eax
8:060C  668946e8             mov dword ptr [bp - 0x18], eax
8:0610  668946e4             mov dword ptr [bp - 0x1c], eax
8:0614  680004               push 0x400
8:0617  50                   push ax
8:0618  6a01                 push 1
8:061A  8d46ce               lea ax, [bp - 0x32]
8:061D  16                   push ss
8:061E  50                   push ax
8:061F  9a52dc2c06           lcall 0x62c, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_0624:
8:0624  8d46ce               lea ax, [bp - 0x32]
8:0627  16                   push ss
8:0628  50                   push ax
8:0629  9aece4b308           lcall 0x8b3, 0xe4ec  ; DbIter::next@s6:E4EC
8:062E  8946e0               mov word ptr [bp - 0x20], ax
8:0631  8956e2               mov word ptr [bp - 0x1e], dx
8:0634  0bd0                 or dx, ax
8:0636  7430                 je 0x668
8:0638  c45ee0               les bx, ptr [bp - 0x20]
8:063B  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
8:0645  75dd                 jne 0x624
8:0647  8946ec               mov word ptr [bp - 0x14], ax
8:064A  8c46ee               mov word ptr [bp - 0x12], es
8:064D  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
8:0653  668946e8             mov dword ptr [bp - 0x18], eax
8:0657  6650                 push eax
8:0659  9ab838c308           lcall 0x8c3, 0x38b8  ; sub_s7:38B8
8:065E  8946e4               mov word ptr [bp - 0x1c], ax
8:0661  8956e6               mov word ptr [bp - 0x1a], dx
8:0664  0bd0                 or dx, ax
8:0666  74bc                 je 0x624
loc_0668:
8:0668  c746ce9a38           mov word ptr [bp - 0x32], 0x389a
8:066D  c746d0d501           mov word ptr [bp - 0x30], 0x1d5  ; SEGMENT s2:0000
8:0672  8b46ee               mov ax, word ptr [bp - 0x12]
8:0675  0b46ec               or ax, word ptr [bp - 0x14]
8:0678  0f845402             je 0x8d0
8:067C  817e0ae803           cmp word ptr [bp + 0xa], 0x3e8
8:0681  7523                 jne 0x6a6
8:0683  837ef410             cmp word ptr [bp - 0xc], 0x10
8:0687  0f844401             je 0x7cf
8:068B  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:068F  66b904000000         mov ecx, 4
8:0695  6699                 cdq
8:0697  66f7f9               idiv ecx
8:069A  668946f8             mov dword ptr [bp - 8], eax
8:069E  c746f61000           mov word ptr [bp - 0xa], 0x10
8:06A3  e99b01               jmp 0x841
loc_06A6:
8:06A6  817e0ade03           cmp word ptr [bp + 0xa], 0x3de
8:06AB  7c23                 jl 0x6d0
8:06AD  837ef40f             cmp word ptr [bp - 0xc], 0xf
8:06B1  0f841a01             je 0x7cf
8:06B5  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:06B9  66b90a000000         mov ecx, 0xa
8:06BF  6699                 cdq
8:06C1  66f7f9               idiv ecx
8:06C4  668946f8             mov dword ptr [bp - 8], eax
8:06C8  c746f60f00           mov word ptr [bp - 0xa], 0xf
8:06CD  e97101               jmp 0x841
loc_06D0:
8:06D0  817e0acf03           cmp word ptr [bp + 0xa], 0x3cf
8:06D5  7c23                 jl 0x6fa
8:06D7  837ef40e             cmp word ptr [bp - 0xc], 0xe
8:06DB  0f84f000             je 0x7cf
8:06DF  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:06E3  66b914000000         mov ecx, 0x14
8:06E9  6699                 cdq
8:06EB  66f7f9               idiv ecx
8:06EE  668946f8             mov dword ptr [bp - 8], eax
8:06F2  c746f60e00           mov word ptr [bp - 0xa], 0xe
8:06F7  e94701               jmp 0x841
loc_06FA:
8:06FA  817e0ab603           cmp word ptr [bp + 0xa], 0x3b6
8:06FF  7c23                 jl 0x724
8:0701  837ef40d             cmp word ptr [bp - 0xc], 0xd
8:0705  0f84c600             je 0x7cf
8:0709  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:070D  66b964000000         mov ecx, 0x64
8:0713  6699                 cdq
8:0715  66f7f9               idiv ecx
8:0718  668946f8             mov dword ptr [bp - 8], eax
8:071C  c746f60d00           mov word ptr [bp - 0xa], 0xd
8:0721  e91d01               jmp 0x841
loc_0724:
8:0724  817e0a9d03           cmp word ptr [bp + 0xa], 0x39d
8:0729  7c3d                 jl 0x768
8:072B  668b46fc             mov eax, dword ptr [bp - 4]
8:072F  66b903000000         mov ecx, 3
8:0735  6633d2               xor edx, edx
8:0738  66f7f1               div ecx
8:073B  668bc2               mov eax, edx
8:073E  660bc0               or eax, eax
8:0741  0f85fc00             jne 0x841
8:0745  837ef40c             cmp word ptr [bp - 0xc], 0xc
8:0749  0f848200             je 0x7cf
8:074D  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:0751  66b964000000         mov ecx, 0x64
8:0757  6699                 cdq
8:0759  66f7f9               idiv ecx
8:075C  668946f8             mov dword ptr [bp - 8], eax
8:0760  c746f60c00           mov word ptr [bp - 0xa], 0xc
8:0765  e9d900               jmp 0x841
loc_0768:
8:0768  817e0a8403           cmp word ptr [bp + 0xa], 0x384
8:076D  7c3b                 jl 0x7aa
8:076F  668b46fc             mov eax, dword ptr [bp - 4]
8:0773  66b905000000         mov ecx, 5
8:0779  6633d2               xor edx, edx
8:077C  66f7f1               div ecx
8:077F  668bc2               mov eax, edx
8:0782  660bc0               or eax, eax
8:0785  0f85b800             jne 0x841
8:0789  837ef40b             cmp word ptr [bp - 0xc], 0xb
8:078D  7440                 je 0x7cf
8:078F  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:0793  66b964000000         mov ecx, 0x64
8:0799  6699                 cdq
8:079B  66f7f9               idiv ecx
8:079E  668946f8             mov dword ptr [bp - 8], eax
8:07A2  c746f60b00           mov word ptr [bp - 0xa], 0xb
8:07A7  e99700               jmp 0x841
loc_07AA:
8:07AA  817e0a5203           cmp word ptr [bp + 0xa], 0x352
8:07AF  7c53                 jl 0x804
8:07B1  668b46fc             mov eax, dword ptr [bp - 4]
8:07B5  66b90a000000         mov ecx, 0xa
8:07BB  6633d2               xor edx, edx
8:07BE  66f7f1               div ecx
8:07C1  668bc2               mov eax, edx
8:07C4  660bc0               or eax, eax
8:07C7  7578                 jne 0x841
8:07C9  837ef40a             cmp word ptr [bp - 0xc], 0xa
8:07CD  751b                 jne 0x7ea
loc_07CF:
8:07CF  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:07D3  8b56e6               mov dx, word ptr [bp - 0x1a]
8:07D6  663b46f0             cmp eax, dword ptr [bp - 0x10]
8:07DA  7e06                 jle 0x7e2
8:07DC  8b46f0               mov ax, word ptr [bp - 0x10]
8:07DF  8b56f2               mov dx, word ptr [bp - 0xe]
loc_07E2:
8:07E2  8946f8               mov word ptr [bp - 8], ax
8:07E5  8956fa               mov word ptr [bp - 6], dx
8:07E8  eb57                 jmp 0x841
loc_07EA:
8:07EA  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:07EE  66b964000000         mov ecx, 0x64
8:07F4  6699                 cdq
8:07F6  66f7f9               idiv ecx
8:07F9  668946f8             mov dword ptr [bp - 8], eax
8:07FD  c746f60a00           mov word ptr [bp - 0xa], 0xa
8:0802  eb3d                 jmp 0x841
loc_0804:
8:0804  817e0a2003           cmp word ptr [bp + 0xa], 0x320
8:0809  7c36                 jl 0x841
8:080B  668b46fc             mov eax, dword ptr [bp - 4]
8:080F  66b914000000         mov ecx, 0x14
8:0815  6633d2               xor edx, edx
8:0818  66f7f1               div ecx
8:081B  668bc2               mov eax, edx
8:081E  660bc0               or eax, eax
8:0821  751e                 jne 0x841
8:0823  837ef409             cmp word ptr [bp - 0xc], 9
8:0827  74a6                 je 0x7cf
8:0829  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:082D  66b964000000         mov ecx, 0x64
8:0833  6699                 cdq
8:0835  66f7f9               idiv ecx
8:0838  668946f8             mov dword ptr [bp - 8], eax
8:083C  c746f60900           mov word ptr [bp - 0xa], 9
loc_0841:
8:0841  837ef600             cmp word ptr [bp - 0xa], 0
8:0845  7426                 je 0x86d
8:0847  66837ee400           cmp dword ptr [bp - 0x1c], 0
8:084C  740f                 je 0x85d
8:084E  66837ef800           cmp dword ptr [bp - 8], 0
8:0853  7508                 jne 0x85d
8:0855  66c746f801000000     mov dword ptr [bp - 8], 1
loc_085D:
8:085D  ff76f6               push word ptr [bp - 0xa]
8:0860  66ff76f8             push dword ptr [bp - 8]
8:0864  66ff760c             push dword ptr [bp + 0xc]
8:0868  90                   nop
8:0869  0e                   push cs
8:086A  e86344               call 0x4cd0  ; sub_s8:4CD0
loc_086D:
8:086D  8b46fa               mov ax, word ptr [bp - 6]
8:0870  0b46f8               or ax, word ptr [bp - 8]
8:0873  745b                 je 0x8d0
8:0875  c45e0c               les bx, ptr [bp + 0xc]
8:0878  662681bf000201000008 cmp dword ptr es:[bx + 0x200], 0x8000001
8:0882  750e                 jne 0x892
8:0884  c45eec               les bx, ptr [bp - 0x14]
8:0887  66268b4704           mov eax, dword ptr es:[bx + 4]
8:088C  668946c2             mov dword ptr [bp - 0x3e], eax
8:0890  eb08                 jmp 0x89a
loc_0892:
8:0892  66c746c201000004     mov dword ptr [bp - 0x3e], 0x4000001
loc_089A:
8:089A  66ff76c2             push dword ptr [bp - 0x3e]
8:089E  c45e0c               les bx, ptr [bp + 0xc]
8:08A1  6626ff7704           push dword ptr es:[bx + 4]
8:08A6  66ff76f8             push dword ptr [bp - 8]
8:08AA  8d86aafe             lea ax, [bp - 0x156]
8:08AE  16                   push ss
8:08AF  50                   push ax
8:08B0  9a4499ce08           lcall 0x8ce, 0x9944  ; sub_s6:9944
8:08B5  8d86aafe             lea ax, [bp - 0x156]
8:08B9  16                   push ss
8:08BA  50                   push ax
8:08BB  66ff364857           push dword ptr [0x5748]  ; g_sim
8:08C0  9a5a837f03           lcall 0x37f, 0x835a  ; Sim::enqueue@s7:835A
8:08C5  8d86aafe             lea ax, [bp - 0x156]
8:08C9  16                   push ss
8:08CA  50                   push ax
8:08CB  9a9299b605           lcall 0x5b6, 0x9992  ; sub_s6:9992
loc_08D0:
8:08D0  c9                   leave
8:08D1  ca0a00               retf 0xa

; ---------------- sub_s8:08D4 FAR size=138 callers=1
8:08D4  c8200000             enter 0x20, 0
8:08D8  c746fe0000           mov word ptr [bp - 2], 0
8:08DD  666800000004         push 0x4000000
8:08E3  6a01                 push 1
8:08E5  8d46ec               lea ax, [bp - 0x14]
8:08E8  16                   push ss
8:08E9  50                   push ax
8:08EA  9a52dcf708           lcall 0x8f7, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_08EF:
8:08EF  8d46ec               lea ax, [bp - 0x14]
8:08F2  16                   push ss
8:08F3  50                   push ax
8:08F4  9aece42206           lcall 0x622, 0xe4ec  ; DbIter::next@s6:E4EC
8:08F9  8946e8               mov word ptr [bp - 0x18], ax
8:08FC  8956ea               mov word ptr [bp - 0x16], dx
8:08FF  0bd0                 or dx, ax
8:0901  7414                 je 0x917
8:0903  c45ee8               les bx, ptr [bp - 0x18]
8:0906  662681bf000202000008 cmp dword ptr es:[bx + 0x200], 0x8000002
8:0910  75dd                 jne 0x8ef
8:0912  c746fe0100           mov word ptr [bp - 2], 1
loc_0917:
8:0917  c746ec9a38           mov word ptr [bp - 0x14], 0x389a
8:091C  c746ee7006           mov word ptr [bp - 0x12], 0x670  ; SEGMENT s2:0000
8:0921  837efe00             cmp word ptr [bp - 2], 0
8:0925  7432                 je 0x959
8:0927  817e0ac800           cmp word ptr [bp + 0xa], 0xc8
8:092C  7f14                 jg 0x942
8:092E  66ff760c             push dword ptr [bp + 0xc]
8:0932  66ff7608             push dword ptr [bp + 8]
8:0936  ff7606               push word ptr [bp + 6]
8:0939  90                   nop
8:093A  0e                   push cs
8:093B  e802fa               call 0x340  ; sub_s8:0340
8:093E  c9                   leave
8:093F  ca0a00               retf 0xa
loc_0942:
8:0942  817e0a2003           cmp word ptr [bp + 0xa], 0x320
8:0947  7c10                 jl 0x959
8:0949  66ff760c             push dword ptr [bp + 0xc]
8:094D  66ff7608             push dword ptr [bp + 8]
8:0951  ff7606               push word ptr [bp + 6]
8:0954  90                   nop
8:0955  0e                   push cs
8:0956  e87ffc               call 0x5d8  ; sub_s8:05D8
loc_0959:
8:0959  c9                   leave
8:095A  ca0a00               retf 0xa
8:095D  db 00

; ---------------- sub_s8:095E FAR size=524 callers=1
8:095E  c8460000             enter 0x46, 0
8:0962  6a37                 push 0x37
8:0964  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:0969  9aba20b000           lcall 0xb0, 0x20ba  ; sub_s3:20BA
8:096E  8946fc               mov word ptr [bp - 4], ax
8:0971  8956fe               mov word ptr [bp - 2], dx
8:0974  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:0978  66268b07             mov eax, dword ptr es:[bx]
8:097C  668946f8             mov dword ptr [bp - 8], eax
8:0980  66b90a000000         mov ecx, 0xa
8:0986  6633d2               xor edx, edx
8:0989  66f7f1               div ecx
8:098C  668bc2               mov eax, edx
8:098F  660bc0               or eax, eax
8:0992  752f                 jne 0x9c3
8:0994  817e0ac800           cmp word ptr [bp + 0xa], 0xc8
8:0999  7f05                 jg 0x9a0
8:099B  6a3f                 push 0x3f
8:099D  eb0a                 jmp 0x9a9
8:099F  db 90
loc_09A0:
8:09A0  817e0a2003           cmp word ptr [bp + 0xa], 0x320
8:09A5  7c1c                 jl 0x9c3
8:09A7  6a3e                 push 0x3e
loc_09A9:
8:09A9  c45e0c               les bx, ptr [bp + 0xc]
8:09AC  6626ff7704           push dword ptr es:[bx + 4]
8:09B1  666800000100         push 0x10000
8:09B7  666a00               push 0
8:09BA  66ff76fc             push dword ptr [bp - 4]
8:09BE  9ae4a02e0a           lcall 0xa2e, 0xa0e4  ; sub_s2:A0E4
loc_09C3:
8:09C3  c45e0c               les bx, ptr [bp + 0xc]
8:09C6  268b4722             mov ax, word ptr es:[bx + 0x22]
8:09CA  8946f6               mov word ptr [bp - 0xa], ax
8:09CD  c746f40000           mov word ptr [bp - 0xc], 0
8:09D2  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:09D6  66268b07             mov eax, dword ptr es:[bx]
8:09DA  268b5702             mov dx, word ptr es:[bx + 2]
8:09DE  668946f0             mov dword ptr [bp - 0x10], eax
8:09E2  837ef64b             cmp word ptr [bp - 0xa], 0x4b
8:09E6  7c06                 jl 0x9ee
8:09E8  666a05               push 5
8:09EB  eb16                 jmp 0xa03
8:09ED  db 90
loc_09EE:
8:09EE  837ef63c             cmp word ptr [bp - 0xa], 0x3c
8:09F2  7c06                 jl 0x9fa
8:09F4  666a0f               push 0xf
8:09F7  eb0a                 jmp 0xa03
8:09F9  db 90
loc_09FA:
8:09FA  837ef632             cmp word ptr [bp - 0xa], 0x32
8:09FE  7c1c                 jl 0xa1c
8:0A00  666a1e               push 0x1e
loc_0A03:
8:0A03  52                   push dx
8:0A04  50                   push ax
8:0A05  6658                 pop eax
8:0A07  6659                 pop ecx
8:0A09  6633d2               xor edx, edx
8:0A0C  66f7f1               div ecx
8:0A0F  668bc2               mov eax, edx
8:0A12  660bc0               or eax, eax
8:0A15  7505                 jne 0xa1c
8:0A17  c746f40100           mov word ptr [bp - 0xc], 1
loc_0A1C:
8:0A1C  837ef400             cmp word ptr [bp - 0xc], 0
8:0A20  0f844201             je 0xb66
8:0A24  6a0f                 push 0xf
8:0A26  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:0A2B  9afac64b0a           lcall 0xa4b, 0xc6fa  ; sub_s2:C6FA
8:0A30  52                   push dx
8:0A31  50                   push ax
8:0A32  66ff760c             push dword ptr [bp + 0xc]
8:0A36  90                   nop
8:0A37  0e                   push cs
8:0A38  e83d44               call 0x4e78  ; sub_s8:4E78
8:0A3B  8946ec               mov word ptr [bp - 0x14], ax
8:0A3E  8956ee               mov word ptr [bp - 0x12], dx
8:0A41  6a1a                 push 0x1a
8:0A43  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:0A48  9afac61f09           lcall 0x91f, 0xc6fa  ; sub_s2:C6FA
8:0A4D  8946e8               mov word ptr [bp - 0x18], ax
8:0A50  8956ea               mov word ptr [bp - 0x16], dx
8:0A53  52                   push dx
8:0A54  50                   push ax
8:0A55  66ff760c             push dword ptr [bp + 0xc]
8:0A59  90                   nop
8:0A5A  0e                   push cs
8:0A5B  e81043               call 0x4d6e  ; sub_s8:4D6E
8:0A5E  8946e4               mov word ptr [bp - 0x1c], ax
8:0A61  8956e6               mov word ptr [bp - 0x1a], dx
8:0A64  c45eec               les bx, ptr [bp - 0x14]
8:0A67  06                   push es
8:0A68  53                   push bx
8:0A69  26c41f               les bx, ptr es:[bx]
8:0A6C  26ff5f10             lcall es:[bx + 0x10]
8:0A70  8946e0               mov word ptr [bp - 0x20], ax
8:0A73  8956e2               mov word ptr [bp - 0x1e], dx
8:0A76  c45ee4               les bx, ptr [bp - 0x1c]
8:0A79  06                   push es
8:0A7A  53                   push bx
8:0A7B  26c41f               les bx, ptr es:[bx]
8:0A7E  26ff5f10             lcall es:[bx + 0x10]
8:0A82  8946dc               mov word ptr [bp - 0x24], ax
8:0A85  8956de               mov word ptr [bp - 0x22], dx
8:0A88  8d46da               lea ax, [bp - 0x26]
8:0A8B  16                   push ss
8:0A8C  50                   push ax
8:0A8D  9aaebcb50a           lcall 0xab5, 0xbcae  ; sub_s7:BCAE
8:0A92  66c746cc00000000     mov dword ptr [bp - 0x34], 0
8:0A9A  eb60                 jmp 0xafc
loc_0A9C:
8:0A9C  66ff46c8             inc dword ptr [bp - 0x38]
loc_0AA0:
8:0AA0  668b46dc             mov eax, dword ptr [bp - 0x24]
8:0AA4  663946c8             cmp dword ptr [bp - 0x38], eax
8:0AA8  7330                 jae 0xada
8:0AAA  66ff76c8             push dword ptr [bp - 0x38]
8:0AAE  66ff76e4             push dword ptr [bp - 0x1c]
8:0AB2  9a581dcb0a           lcall 0xacb, 0x1d58  ; sub_s7:1D58
8:0AB7  8946d2               mov word ptr [bp - 0x2e], ax
8:0ABA  8956d4               mov word ptr [bp - 0x2c], dx
8:0ABD  52                   push dx
8:0ABE  50                   push ax
8:0ABF  66ff76d6             push dword ptr [bp - 0x2a]
8:0AC3  8d46da               lea ax, [bp - 0x26]
8:0AC6  16                   push ss
8:0AC7  50                   push ax
8:0AC8  9a74bde10a           lcall 0xae1, 0xbd74  ; sub_s7:BD74
8:0ACD  8946c2               mov word ptr [bp - 0x3e], ax
8:0AD0  3d0500               cmp ax, 5
8:0AD3  7fc7                 jg 0xa9c
8:0AD5  c746d00100           mov word ptr [bp - 0x30], 1
loc_0ADA:
8:0ADA  66ff76d6             push dword ptr [bp - 0x2a]
8:0ADE  9aa873110b           lcall 0xb11, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:0AE3  8946c4               mov word ptr [bp - 0x3c], ax
8:0AE6  8956c6               mov word ptr [bp - 0x3a], dx
8:0AE9  837ed000             cmp word ptr [bp - 0x30], 0
8:0AED  7509                 jne 0xaf8
8:0AEF  52                   push dx
8:0AF0  50                   push ax
8:0AF1  9aa05ced08           lcall 0x8ed, 0x5ca0  ; sub_s6:5CA0
8:0AF6  eb32                 jmp 0xb2a
loc_0AF8:
8:0AF8  66ff46cc             inc dword ptr [bp - 0x34]
loc_0AFC:
8:0AFC  668b46e0             mov eax, dword ptr [bp - 0x20]
8:0B00  663946cc             cmp dword ptr [bp - 0x34], eax
8:0B04  7324                 jae 0xb2a
8:0B06  66ff76cc             push dword ptr [bp - 0x34]
8:0B0A  66ff76ec             push dword ptr [bp - 0x14]
8:0B0E  9a581d5c06           lcall 0x65c, 0x1d58  ; sub_s7:1D58
8:0B13  8946d6               mov word ptr [bp - 0x2a], ax
8:0B16  8956d8               mov word ptr [bp - 0x28], dx
8:0B19  c746d00000           mov word ptr [bp - 0x30], 0
8:0B1E  66c746c800000000     mov dword ptr [bp - 0x38], 0
8:0B26  e977ff               jmp 0xaa0
8:0B29  db 90
loc_0B2A:
8:0B2A  668b46ec             mov eax, dword ptr [bp - 0x14]
8:0B2E  668946ba             mov dword ptr [bp - 0x46], eax
8:0B32  668946be             mov dword ptr [bp - 0x42], eax
8:0B36  660bc0               or eax, eax
8:0B39  740d                 je 0xb48
8:0B3B  6a01                 push 1
8:0B3D  c45eec               les bx, ptr [bp - 0x14]
8:0B40  06                   push es
8:0B41  50                   push ax
8:0B42  26c41f               les bx, ptr es:[bx]
8:0B45  26ff1f               lcall es:[bx]
loc_0B48:
8:0B48  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:0B4C  668946be             mov dword ptr [bp - 0x42], eax
8:0B50  668946ba             mov dword ptr [bp - 0x46], eax
8:0B54  660bc0               or eax, eax
8:0B57  740d                 je 0xb66
8:0B59  6a01                 push 1
8:0B5B  c45ee4               les bx, ptr [bp - 0x1c]
8:0B5E  06                   push es
8:0B5F  50                   push ax
8:0B60  26c41f               les bx, ptr es:[bx]
8:0B63  26ff1f               lcall es:[bx]
loc_0B66:
8:0B66  c9                   leave
8:0B67  ca0a00               retf 0xa

; ---------------- SCMorale::dtor@s8:0B6A size=60 callers=0
8:0B6A  c80c0000             enter 0xc, 0
8:0B6E  c45e06               les bx, ptr [bp + 6]
8:0B71  26c7079a38           mov word ptr es:[bx], 0x389a
8:0B76  26c74702c109         mov word ptr es:[bx + 2], 0x9c1  ; SEGMENT s2:0000
8:0B7C  f6460a01             test byte ptr [bp + 0xa], 1
8:0B80  7409                 je 0xb8b
8:0B82  66ff7606             push dword ptr [bp + 6]
8:0B86  9ace170c00           lcall 0xc, 0x17ce  ; operator_delete@s1:17CE
loc_0B8B:
8:0B8B  8b4606               mov ax, word ptr [bp + 6]
8:0B8E  8b5608               mov dx, word ptr [bp + 8]
8:0B91  c9                   leave
8:0B92  ca0600               retf 6
8:0B95  db 00 6a 0b a4 0b f8 ec 90 0a 28 d2 f4 0a 00 00 6e
8:0BA5  db 00

; ---------------- SCMove@s8:0BA6 FAR size=90 callers=1
8:0BA6  55                   push bp
8:0BA7  8bec                 mov bp, sp
8:0BA9  680f27               push 0x270f
8:0BAC  66ff7606             push dword ptr [bp + 6]
8:0BB0  9adcd1a00b           lcall 0xba0, 0xd1dc  ; SCBase::SCBase@s6:D1DC
8:0BB5  c45e06               les bx, ptr [bp + 6]
8:0BB8  6626c787080100000000 mov dword ptr es:[bx + 0x108], 0
8:0BC2  26c7072e1c           mov word ptr es:[bx], 0x1c2e  ; '198.flc'
8:0BC7  26c74702980b         mov word ptr es:[bx + 2], 0xb98  ; SEGMENT s8:0000
8:0BCD  1e                   push ds
8:0BCE  68d859               push 0x59d8  ; 'SCMove'
8:0BD1  8d4708               lea ax, [bx + 8]
8:0BD4  06                   push es
8:0BD5  50                   push ax
8:0BD6  9a3e3d890b           lcall 0xb89, 0x3d3e  ; _fstrcpy@s1:3D3E
8:0BDB  83c408               add sp, 8
8:0BDE  6a02                 push 2
8:0BE0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:0BE5  9aba206c09           lcall 0x96c, 0x20ba  ; sub_s3:20BA
8:0BEA  c45e06               les bx, ptr [bp + 6]
8:0BED  2689870801           mov word ptr es:[bx + 0x108], ax
8:0BF2  2689970a01           mov word ptr es:[bx + 0x10a], dx
8:0BF7  8bc3                 mov ax, bx
8:0BF9  8cc2                 mov dx, es
8:0BFB  c9                   leave
8:0BFC  ca0400               retf 4
8:0BFF  db 00

; ---------------- SCMove::calcMe@s8:0C00 FAR size=240 callers=0
8:0C00  c82e0000             enter 0x2e, 0
8:0C04  666800000004         push 0x4000000
8:0C0A  6a01                 push 1
8:0C0C  8d46ee               lea ax, [bp - 0x12]
8:0C0F  16                   push ss
8:0C10  50                   push ax
8:0C11  9a52dc1e0c           lcall 0xc1e, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
loc_0C16:
8:0C16  8d46ee               lea ax, [bp - 0x12]
8:0C19  16                   push ss
8:0C1A  50                   push ax
8:0C1B  9aece4b30b           lcall 0xbb3, 0xe4ec  ; DbIter::next@s6:E4EC
8:0C20  8946ea               mov word ptr [bp - 0x16], ax
8:0C23  8956ec               mov word ptr [bp - 0x14], dx
8:0C26  0bd0                 or dx, ax
8:0C28  0f84ae00             je 0xcda
8:0C2C  ff76ec               push word ptr [bp - 0x14]
8:0C2F  50                   push ax
8:0C30  66ff7606             push dword ptr [bp + 6]
8:0C34  90                   nop
8:0C35  0e                   push cs
8:0C36  e83f02               call 0xe78  ; sub_s8:0E78
8:0C39  66ff76ea             push dword ptr [bp - 0x16]
8:0C3D  66ff7606             push dword ptr [bp + 6]
8:0C41  90                   nop
8:0C42  0e                   push cs
8:0C43  e8da05               call 0x1220  ; sub_s8:1220
8:0C46  6a01                 push 1
8:0C48  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:0C4D  9afac6e70c           lcall 0xce7, 0xc6fa  ; sub_s2:C6FA
8:0C52  8946e6               mov word ptr [bp - 0x1a], ax
8:0C55  8956e8               mov word ptr [bp - 0x18], dx
8:0C58  52                   push dx
8:0C59  50                   push ax
8:0C5A  66ff76ea             push dword ptr [bp - 0x16]
8:0C5E  90                   nop
8:0C5F  0e                   push cs
8:0C60  e80b41               call 0x4d6e  ; sub_s8:4D6E
8:0C63  8946e2               mov word ptr [bp - 0x1e], ax
8:0C66  8956e4               mov word ptr [bp - 0x1c], dx
8:0C69  52                   push dx
8:0C6A  c45ee2               les bx, ptr [bp - 0x1e]
8:0C6D  50                   push ax
8:0C6E  26c41f               les bx, ptr es:[bx]
8:0C71  26ff5f10             lcall es:[bx + 0x10]
8:0C75  0bd0                 or dx, ax
8:0C77  7432                 je 0xcab
8:0C79  c45e06               les bx, ptr [bp + 6]
8:0C7C  26c49f0801           les bx, ptr es:[bx + 0x108]
8:0C81  2683bf820000         cmp word ptr es:[bx + 0x82], 0
8:0C87  7411                 je 0xc9a
8:0C89  66ff76ea             push dword ptr [bp - 0x16]
8:0C8D  66ff76e2             push dword ptr [bp - 0x1e]
8:0C91  66ff7606             push dword ptr [bp + 6]
8:0C95  90                   nop
8:0C96  0e                   push cs
8:0C97  e8060d               call 0x19a0  ; sub_s8:19A0
loc_0C9A:
8:0C9A  66ff76ea             push dword ptr [bp - 0x16]
8:0C9E  66ff76e2             push dword ptr [bp - 0x1e]
8:0CA2  66ff7606             push dword ptr [bp + 6]
8:0CA6  90                   nop
8:0CA7  0e                   push cs
8:0CA8  e8950c               call 0x1940  ; sub_s8:1940
loc_0CAB:
8:0CAB  668b46e2             mov eax, dword ptr [bp - 0x1e]
8:0CAF  668946d4             mov dword ptr [bp - 0x2c], eax
8:0CB3  668946d8             mov dword ptr [bp - 0x28], eax
8:0CB7  660bc0               or eax, eax
8:0CBA  740d                 je 0xcc9
8:0CBC  6a01                 push 1
8:0CBE  c45ee2               les bx, ptr [bp - 0x1e]
8:0CC1  06                   push es
8:0CC2  50                   push ax
8:0CC3  26c41f               les bx, ptr es:[bx]
8:0CC6  26ff1f               lcall es:[bx]
loc_0CC9:
8:0CC9  66ff76ea             push dword ptr [bp - 0x16]
8:0CCD  66ff7606             push dword ptr [bp + 6]
8:0CD1  90                   nop
8:0CD2  0e                   push cs
8:0CD3  e8680f               call 0x1c3e  ; sub_s8:1C3E
8:0CD6  e93dff               jmp 0xc16
8:0CD9  db 90
loc_0CDA:
8:0CDA  c746d20100           mov word ptr [bp - 0x2e], 1
8:0CDF  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
8:0CE4  c746f07a0b           mov word ptr [bp - 0x10], 0xb7a  ; SEGMENT s2:0000
8:0CE9  8b46d2               mov ax, word ptr [bp - 0x2e]
8:0CEC  c9                   leave
8:0CED  ca0400               retf 4

; ---------------- SCMove::clone@s8:0CF0 size=158 callers=0
8:0CF0  c8200000             enter 0x20, 0
8:0CF4  57                   push di
8:0CF5  56                   push si
8:0CF6  680c01               push 0x10c
8:0CF9  9a9c17d90b           lcall 0xbd9, 0x179c  ; operator_new@s1:179C
8:0CFE  83c402               add sp, 2
8:0D01  8946f8               mov word ptr [bp - 8], ax
8:0D04  8956fa               mov word ptr [bp - 6], dx
8:0D07  0bd0                 or dx, ax
8:0D09  746f                 je 0xd7a
8:0D0B  c45ef8               les bx, ptr [bp - 8]
8:0D0E  26c7079a38           mov word ptr es:[bx], 0x389a
8:0D13  26c74702500c         mov word ptr es:[bx + 2], 0xc50  ; SEGMENT s2:0000
8:0D19  c45e06               les bx, ptr [bp + 6]
8:0D1C  66268b4704           mov eax, dword ptr es:[bx + 4]
8:0D21  c45ef8               les bx, ptr [bp - 8]
8:0D24  6626894704           mov dword ptr es:[bx + 4], eax
8:0D29  8b4606               mov ax, word ptr [bp + 6]
8:0D2C  8b5608               mov dx, word ptr [bp + 8]
8:0D2F  050800               add ax, 8
8:0D32  1e                   push ds
8:0D33  8d7f08               lea di, [bx + 8]
8:0D36  8bf0                 mov si, ax
8:0D38  8eda                 mov ds, dx
8:0D3A  66b940000000         mov ecx, 0x40
8:0D40  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
8:0D43  1f                   pop ds
8:0D44  c45ef8               les bx, ptr [bp - 8]
8:0D47  26c707d26a           mov word ptr es:[bx], 0x6ad2
8:0D4C  26c74702140c         mov word ptr es:[bx + 2], 0xc14  ; SEGMENT s6:0000
8:0D52  c45e06               les bx, ptr [bp + 6]
8:0D55  66268b870801         mov eax, dword ptr es:[bx + 0x108]
8:0D5B  c45ef8               les bx, ptr [bp - 8]
8:0D5E  662689870801         mov dword ptr es:[bx + 0x108], eax
8:0D64  26c7072e1c           mov word ptr es:[bx], 0x1c2e  ; '198.flc'
8:0D69  26c74702cb0b         mov word ptr es:[bx + 2], 0xbcb  ; SEGMENT s8:0000
8:0D6F  668b46f8             mov eax, dword ptr [bp - 8]
8:0D73  668946fc             mov dword ptr [bp - 4], eax
8:0D77  eb09                 jmp 0xd82
8:0D79  db 90
loc_0D7A:
8:0D7A  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_0D82:
8:0D82  8b46fc               mov ax, word ptr [bp - 4]
8:0D85  8b56fe               mov dx, word ptr [bp - 2]
8:0D88  5e                   pop si
8:0D89  5f                   pop di
8:0D8A  c9                   leave
8:0D8B  ca0400               retf 4

; ---------------- sub_s8:0D8E FAR size=114 callers=1
8:0D8E  c80c0000             enter 0xc, 0
8:0D92  66ff760e             push dword ptr [bp + 0xe]
8:0D96  9aa8d0a80d           lcall 0xda8, 0xd0a8  ; sub_s7:D0A8
8:0D9B  8946fe               mov word ptr [bp - 2], ax
8:0D9E  8946fc               mov word ptr [bp - 4], ax
8:0DA1  66ff760e             push dword ptr [bp + 0xe]
8:0DA5  9a44d1e20d           lcall 0xde2, 0xd144  ; sub_s7:D144
8:0DAA  99                   cdq
8:0DAB  8946f8               mov word ptr [bp - 8], ax
8:0DAE  8956fa               mov word ptr [bp - 6], dx
8:0DB1  0bd0                 or dx, ax
8:0DB3  7447                 je 0xdfc
loc_0DB5:
8:0DB5  ff76fe               push word ptr [bp - 2]
8:0DB8  66ff760a             push dword ptr [bp + 0xa]
8:0DBC  9a4467d20d           lcall 0xdd2, 0x6744  ; sub_s6:6744
8:0DC1  0bd0                 or dx, ax
8:0DC3  741f                 je 0xde4
8:0DC5  ff76fe               push word ptr [bp - 2]
8:0DC8  666a01               push 1
8:0DCB  66ff760a             push dword ptr [bp + 0xa]
8:0DCF  9a2862500d           lcall 0xd50, 0x6228  ; sub_s6:6228
8:0DD4  66ff4ef8             dec dword ptr [bp - 8]
8:0DD8  ff76fe               push word ptr [bp - 2]
8:0DDB  66ff760e             push dword ptr [bp + 0xe]
8:0DDF  9a80d1f20d           lcall 0xdf2, 0xd180  ; sub_s7:D180
loc_0DE4:
8:0DE4  66837ef800           cmp dword ptr [bp - 8], 0
8:0DE9  7411                 je 0xdfc
8:0DEB  66ff760e             push dword ptr [bp + 0xe]
8:0DEF  9aa8d09c0b           lcall 0xb9c, 0xd0a8  ; sub_s7:D0A8
8:0DF4  8946fe               mov word ptr [bp - 2], ax
8:0DF7  3b46fc               cmp ax, word ptr [bp - 4]
8:0DFA  75b9                 jne 0xdb5
loc_0DFC:
8:0DFC  c9                   leave
8:0DFD  ca0c00               retf 0xc

; ---------------- sub_s8:0E00 FAR size=120 callers=1
8:0E00  c8140000             enter 0x14, 0
8:0E04  c45e0a               les bx, ptr [bp + 0xa]
8:0E07  06                   push es
8:0E08  53                   push bx
8:0E09  26c41f               les bx, ptr es:[bx]
8:0E0C  26ff5f10             lcall es:[bx + 0x10]
8:0E10  8946fc               mov word ptr [bp - 4], ax
8:0E13  8956fe               mov word ptr [bp - 2], dx
8:0E16  66c746f800000000     mov dword ptr [bp - 8], 0
8:0E1E  eb04                 jmp 0xe24
loc_0E20:
8:0E20  66ff46f8             inc dword ptr [bp - 8]
loc_0E24:
8:0E24  668b46fc             mov eax, dword ptr [bp - 4]
8:0E28  663946f8             cmp dword ptr [bp - 8], eax
8:0E2C  7346                 jae 0xe74
8:0E2E  66ff76f8             push dword ptr [bp - 8]
8:0E32  c45e0a               les bx, ptr [bp + 0xa]
8:0E35  06                   push es
8:0E36  53                   push bx
8:0E37  26c41f               les bx, ptr es:[bx]
8:0E3A  26ff5f04             lcall es:[bx + 4]
8:0E3E  8956f6               mov word ptr [bp - 0xa], dx
8:0E41  0bd0                 or dx, ax
8:0E43  74db                 je 0xe20
8:0E45  ff76f6               push word ptr [bp - 0xa]
8:0E48  50                   push ax
8:0E49  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:0E4E  9aece1bf0d           lcall 0xdbf, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:0E53  52                   push dx
8:0E54  50                   push ax
8:0E55  9aa873990d           lcall 0xd99, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:0E5A  8956ee               mov word ptr [bp - 0x12], dx
8:0E5D  0bd0                 or dx, ax
8:0E5F  74bf                 je 0xe20
8:0E61  66ff760e             push dword ptr [bp + 0xe]
8:0E65  ff76ee               push word ptr [bp - 0x12]
8:0E68  50                   push ax
8:0E69  66ff7606             push dword ptr [bp + 6]
8:0E6D  90                   nop
8:0E6E  0e                   push cs
8:0E6F  e81cff               call 0xd8e  ; sub_s8:0D8E
8:0E72  ebac                 jmp 0xe20
loc_0E74:
8:0E74  c9                   leave
8:0E75  ca0c00               retf 0xc

; ---------------- sub_s8:0E78 FAR size=276 callers=1
8:0E78  c8280000             enter 0x28, 0
8:0E7C  57                   push di
8:0E7D  56                   push si
8:0E7E  6a04                 push 4
8:0E80  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:0E85  9afac6d60e           lcall 0xed6, 0xc6fa  ; sub_s2:C6FA
8:0E8A  52                   push dx
8:0E8B  50                   push ax
8:0E8C  66ff760a             push dword ptr [bp + 0xa]
8:0E90  90                   nop
8:0E91  0e                   push cs
8:0E92  e8d93e               call 0x4d6e  ; sub_s8:4D6E
8:0E95  8946f8               mov word ptr [bp - 8], ax
8:0E98  8956fa               mov word ptr [bp - 6], dx
8:0E9B  52                   push dx
8:0E9C  c45ef8               les bx, ptr [bp - 8]
8:0E9F  50                   push ax
8:0EA0  26c41f               les bx, ptr es:[bx]
8:0EA3  8bf3                 mov si, bx
8:0EA5  8cc7                 mov di, es
8:0EA7  26ff5f10             lcall es:[bx + 0x10]
8:0EAB  0bd0                 or dx, ax
8:0EAD  751d                 jne 0xecc
8:0EAF  668b46f8             mov eax, dword ptr [bp - 8]
8:0EB3  660bc0               or eax, eax
8:0EB6  0f84cc00             je 0xf86
8:0EBA  6a01                 push 1
8:0EBC  ff76fa               push word ptr [bp - 6]
8:0EBF  50                   push ax
8:0EC0  8ec7                 mov es, di
8:0EC2  26ff1c               lcall es:[si]
8:0EC5  5e                   pop si
8:0EC6  5f                   pop di
8:0EC7  c9                   leave
8:0EC8  ca0800               retf 8
8:0ECB  db 90
loc_0ECC:
8:0ECC  6a1e                 push 0x1e
8:0ECE  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:0ED3  9afac6170d           lcall 0xd17, 0xc6fa  ; sub_s2:C6FA
8:0ED8  52                   push dx
8:0ED9  50                   push ax
8:0EDA  66ff760a             push dword ptr [bp + 0xa]
8:0EDE  90                   nop
8:0EDF  0e                   push cs
8:0EE0  e88b3e               call 0x4d6e  ; sub_s8:4D6E
8:0EE3  8946f4               mov word ptr [bp - 0xc], ax
8:0EE6  8956f6               mov word ptr [bp - 0xa], dx
8:0EE9  52                   push dx
8:0EEA  c45ef4               les bx, ptr [bp - 0xc]
8:0EED  50                   push ax
8:0EEE  26c41f               les bx, ptr es:[bx]
8:0EF1  26ff5f10             lcall es:[bx + 0x10]
8:0EF5  8946f0               mov word ptr [bp - 0x10], ax
8:0EF8  8956f2               mov word ptr [bp - 0xe], dx
8:0EFB  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:0F03  eb05                 jmp 0xf0a
8:0F05  db 90
loc_0F06:
8:0F06  66ff46ec             inc dword ptr [bp - 0x14]
loc_0F0A:
8:0F0A  668b46f0             mov eax, dword ptr [bp - 0x10]
8:0F0E  663946ec             cmp dword ptr [bp - 0x14], eax
8:0F12  7346                 jae 0xf5a
8:0F14  66ff76ec             push dword ptr [bp - 0x14]
8:0F18  c45ef4               les bx, ptr [bp - 0xc]
8:0F1B  06                   push es
8:0F1C  53                   push bx
8:0F1D  26c41f               les bx, ptr es:[bx]
8:0F20  26ff5f04             lcall es:[bx + 4]
8:0F24  8956e2               mov word ptr [bp - 0x1e], dx
8:0F27  0bd0                 or dx, ax
8:0F29  74db                 je 0xf06
8:0F2B  ff76e2               push word ptr [bp - 0x1e]
8:0F2E  50                   push ax
8:0F2F  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:0F34  9aece1510e           lcall 0xe51, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:0F39  52                   push dx
8:0F3A  50                   push ax
8:0F3B  9aa873580e           lcall 0xe58, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:0F40  8956da               mov word ptr [bp - 0x26], dx
8:0F43  0bd0                 or dx, ax
8:0F45  74bf                 je 0xf06
8:0F47  ff76da               push word ptr [bp - 0x26]
8:0F4A  50                   push ax
8:0F4B  66ff76f8             push dword ptr [bp - 8]
8:0F4F  66ff7606             push dword ptr [bp + 6]
8:0F53  90                   nop
8:0F54  0e                   push cs
8:0F55  e8a8fe               call 0xe00  ; sub_s8:0E00
8:0F58  ebac                 jmp 0xf06
loc_0F5A:
8:0F5A  668b46f8             mov eax, dword ptr [bp - 8]
8:0F5E  660bc0               or eax, eax
8:0F61  740d                 je 0xf70
8:0F63  6a01                 push 1
8:0F65  c45ef8               les bx, ptr [bp - 8]
8:0F68  06                   push es
8:0F69  50                   push ax
8:0F6A  26c41f               les bx, ptr es:[bx]
8:0F6D  26ff1f               lcall es:[bx]
loc_0F70:
8:0F70  668b46f4             mov eax, dword ptr [bp - 0xc]
8:0F74  660bc0               or eax, eax
8:0F77  740d                 je 0xf86
8:0F79  6a01                 push 1
8:0F7B  c45ef4               les bx, ptr [bp - 0xc]
8:0F7E  06                   push es
8:0F7F  50                   push ax
8:0F80  26c41f               les bx, ptr es:[bx]
8:0F83  26ff1f               lcall es:[bx]
loc_0F86:
8:0F86  5e                   pop si
8:0F87  5f                   pop di
8:0F88  c9                   leave
8:0F89  ca0800               retf 8

; ---------------- sub_s8:0F8C FAR size=548 callers=1
8:0F8C  c8660000             enter 0x66, 0
8:0F90  66c746fc64000000     mov dword ptr [bp - 4], 0x64
8:0F98  c746fa0000           mov word ptr [bp - 6], 0
8:0F9D  c45e0a               les bx, ptr [bp + 0xa]
8:0FA0  06                   push es
8:0FA1  53                   push bx
8:0FA2  26c41f               les bx, ptr es:[bx]
8:0FA5  26ff5f10             lcall es:[bx + 0x10]
8:0FA9  8946f6               mov word ptr [bp - 0xa], ax
8:0FAC  8956f8               mov word ptr [bp - 8], dx
8:0FAF  66c746f200000000     mov dword ptr [bp - 0xe], 0
8:0FB7  e98e00               jmp 0x1048
loc_0FBA:
8:0FBA  66ff76e6             push dword ptr [bp - 0x1a]
8:0FBE  9ac8627a10           lcall 0x107a, 0x62c8  ; sub_s6:62C8
8:0FC3  8946de               mov word ptr [bp - 0x22], ax
8:0FC6  8956e0               mov word ptr [bp - 0x20], dx
8:0FC9  c746fa0100           mov word ptr [bp - 6], 1
8:0FCE  c45e0e               les bx, ptr [bp + 0xe]
8:0FD1  66268b4722           mov eax, dword ptr es:[bx + 0x22]
8:0FD6  668946da             mov dword ptr [bp - 0x26], eax
8:0FDA  6650                 push eax
8:0FDC  8d46d2               lea ax, [bp - 0x2e]
8:0FDF  16                   push ss
8:0FE0  50                   push ax
8:0FE1  9a8457ee0f           lcall 0xfee, 0x5784  ; ListIter::ListIter@s2:5784
loc_0FE6:
8:0FE6  8d46d2               lea ax, [bp - 0x2e]
8:0FE9  16                   push ss
8:0FEA  50                   push ax
8:0FEB  9a125b3c11           lcall 0x113c, 0x5b12  ; ListIter::next@s2:5B12
8:0FF0  8946ce               mov word ptr [bp - 0x32], ax
8:0FF3  8956d0               mov word ptr [bp - 0x30], dx
8:0FF6  0bd0                 or dx, ax
8:0FF8  744a                 je 0x1044
8:0FFA  c45ece               les bx, ptr [bp - 0x32]
8:0FFD  268b4704             mov ax, word ptr es:[bx + 4]
8:1001  8946c6               mov word ptr [bp - 0x3a], ax
8:1004  268b4706             mov ax, word ptr es:[bx + 6]
8:1008  8946c4               mov word ptr [bp - 0x3c], ax
8:100B  268b4708             mov ax, word ptr es:[bx + 8]
8:100F  8946c2               mov word ptr [bp - 0x3e], ax
8:1012  268b470c             mov ax, word ptr es:[bx + 0xc]
8:1016  8946c0               mov word ptr [bp - 0x40], ax
8:1019  268b4f0a             mov cx, word ptr es:[bx + 0xa]
8:101D  894ebe               mov word ptr [bp - 0x42], cx
8:1020  2bd2                 sub dx, dx
8:1022  f7f1                 div cx
8:1024  8946bc               mov word ptr [bp - 0x44], ax
8:1027  668b46de             mov eax, dword ptr [bp - 0x22]
8:102B  8b56e0               mov dx, word ptr [bp - 0x20]
8:102E  663b46fc             cmp eax, dword ptr [bp - 4]
8:1032  7606                 jbe 0x103a
8:1034  8b46fc               mov ax, word ptr [bp - 4]
8:1037  8b56fe               mov dx, word ptr [bp - 2]
loc_103A:
8:103A  8946b8               mov word ptr [bp - 0x48], ax
8:103D  8956ba               mov word ptr [bp - 0x46], dx
8:1040  0bd0                 or dx, ax
8:1042  7578                 jne 0x10bc
loc_1044:
8:1044  66ff46f2             inc dword ptr [bp - 0xe]
loc_1048:
8:1048  668b46f6             mov eax, dword ptr [bp - 0xa]
8:104C  663946f2             cmp dword ptr [bp - 0xe], eax
8:1050  0f835401             jae 0x11a8
8:1054  66ff76f2             push dword ptr [bp - 0xe]
8:1058  c45e0a               les bx, ptr [bp + 0xa]
8:105B  06                   push es
8:105C  53                   push bx
8:105D  26c41f               les bx, ptr es:[bx]
8:1060  26ff5f04             lcall es:[bx + 4]
8:1064  8946ee               mov word ptr [bp - 0x12], ax
8:1067  8956f0               mov word ptr [bp - 0x10], dx
8:106A  0bd0                 or dx, ax
8:106C  74d6                 je 0x1044
8:106E  ff76f0               push word ptr [bp - 0x10]
8:1071  50                   push ax
8:1072  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:1077  9aece1a311           lcall 0x11a3, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:107C  8946ea               mov word ptr [bp - 0x16], ax
8:107F  8956ec               mov word ptr [bp - 0x14], dx
8:1082  52                   push dx
8:1083  50                   push ax
8:1084  9aa8733e0f           lcall 0xf3e, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:1089  8946e6               mov word ptr [bp - 0x1a], ax
8:108C  8956e8               mov word ptr [bp - 0x18], dx
8:108F  8d46e2               lea ax, [bp - 0x1e]
8:1092  16                   push ss
8:1093  50                   push ax
8:1094  c45ee6               les bx, ptr [bp - 0x1a]
8:1097  06                   push es
8:1098  53                   push bx
8:1099  26c41f               les bx, ptr es:[bx]
8:109C  26ff5f40             lcall es:[bx + 0x40]
8:10A0  0bc0                 or ax, ax
8:10A2  0f8414ff             je 0xfba
8:10A6  66ff76f2             push dword ptr [bp - 0xe]
8:10AA  666a00               push 0
8:10AD  c45e0a               les bx, ptr [bp + 0xa]
8:10B0  06                   push es
8:10B1  53                   push bx
8:10B2  26c41f               les bx, ptr es:[bx]
8:10B5  26ff5f08             lcall es:[bx + 8]
8:10B9  eb89                 jmp 0x1044
8:10BB  db 90
loc_10BC:
8:10BC  6a00                 push 0
8:10BE  66ff76ba             push dword ptr [bp - 0x46]
8:10C2  50                   push ax
8:10C3  6658                 pop eax
8:10C5  6659                 pop ecx
8:10C7  6633d2               xor edx, edx
8:10CA  66f7f1               div ecx
8:10CD  668bd0               mov edx, eax
8:10D0  66c1ea10             shr edx, 0x10
8:10D4  8946b6               mov word ptr [bp - 0x4a], ax
8:10D7  0bc0                 or ax, ax
8:10D9  0f8467ff             je 0x1044
8:10DD  8b46be               mov ax, word ptr [bp - 0x42]
8:10E0  3946b6               cmp word ptr [bp - 0x4a], ax
8:10E3  7221                 jb 0x1106
8:10E5  66ff76ce             push dword ptr [bp - 0x32]
8:10E9  c45eda               les bx, ptr [bp - 0x26]
8:10EC  06                   push es
8:10ED  53                   push bx
8:10EE  26c41f               les bx, ptr es:[bx]
8:10F1  26ff5f0c             lcall es:[bx + 0xc]
8:10F5  66c746d600000000     mov dword ptr [bp - 0x2a], 0
8:10FD  8b46be               mov ax, word ptr [bp - 0x42]
8:1100  8946b6               mov word ptr [bp - 0x4a], ax
8:1103  eb12                 jmp 0x1117
8:1105  db 90
loc_1106:
8:1106  8b46b8               mov ax, word ptr [bp - 0x48]
8:1109  c45ece               les bx, ptr [bp - 0x32]
8:110C  2629470c             sub word ptr es:[bx + 0xc], ax
8:1110  8b46b6               mov ax, word ptr [bp - 0x4a]
8:1113  2629470a             sub word ptr es:[bx + 0xa], ax
loc_1117:
8:1117  66a1a268             mov eax, dword ptr [0x68a2]
8:111B  668946a2             mov dword ptr [bp - 0x5e], eax
8:111F  6650                 push eax
8:1121  9afc07fc0c           lcall 0xcfc, 0x7fc  ; sub_s1:07FC
8:1126  8946aa               mov word ptr [bp - 0x56], ax
8:1129  8956ac               mov word ptr [bp - 0x54], dx
8:112C  0bd0                 or dx, ax
8:112E  743c                 je 0x116c
8:1130  c45eaa               les bx, ptr [bp - 0x56]
8:1133  26c7079a38           mov word ptr es:[bx], 0x389a
8:1138  26c74702880e         mov word ptr es:[bx + 2], 0xe88  ; SEGMENT s2:0000
8:113E  33c0                 xor ax, ax
8:1140  c45eaa               les bx, ptr [bp - 0x56]
8:1143  26894704             mov word ptr es:[bx + 4], ax
8:1147  26894706             mov word ptr es:[bx + 6], ax
8:114B  26894708             mov word ptr es:[bx + 8], ax
8:114F  2689470a             mov word ptr es:[bx + 0xa], ax
8:1153  2689470c             mov word ptr es:[bx + 0xc], ax
8:1157  26c707ce56           mov word ptr es:[bx], 0x56ce
8:115C  26c74702ffff         mov word ptr es:[bx + 2], 0xffff  ; SEGMENT s4:0000
8:1162  668b46aa             mov eax, dword ptr [bp - 0x56]
8:1166  668946b2             mov dword ptr [bp - 0x4e], eax
8:116A  eb08                 jmp 0x1174
loc_116C:
8:116C  66c746b200000000     mov dword ptr [bp - 0x4e], 0
loc_1174:
8:1174  8b46b6               mov ax, word ptr [bp - 0x4a]
8:1177  c45eb2               les bx, ptr [bp - 0x4e]
8:117A  2689470a             mov word ptr es:[bx + 0xa], ax
8:117E  f766bc               mul word ptr [bp - 0x44]
8:1181  2689470c             mov word ptr es:[bx + 0xc], ax
8:1185  8b46c6               mov ax, word ptr [bp - 0x3a]
8:1188  26894704             mov word ptr es:[bx + 4], ax
8:118C  8b46c4               mov ax, word ptr [bp - 0x3c]
8:118F  26894706             mov word ptr es:[bx + 6], ax
8:1193  8b46c2               mov ax, word ptr [bp - 0x3e]
8:1196  26894708             mov word ptr es:[bx + 8], ax
8:119A  06                   push es
8:119B  53                   push bx
8:119C  66ff76e6             push dword ptr [bp - 0x1a]
8:11A0  9a0864370f           lcall 0xf37, 0x6408  ; sub_s6:6408
8:11A5  e93efe               jmp 0xfe6
loc_11A8:
8:11A8  8b46fa               mov ax, word ptr [bp - 6]
8:11AB  c9                   leave
8:11AC  ca0c00               retf 0xc
8:11AF  db 00

; ---------------- sub_s8:11B0 FAR size=112 callers=1
8:11B0  c8140000             enter 0x14, 0
8:11B4  c45e0e               les bx, ptr [bp + 0xe]
8:11B7  06                   push es
8:11B8  53                   push bx
8:11B9  26c41f               les bx, ptr es:[bx]
8:11BC  26ff5f10             lcall es:[bx + 0x10]
8:11C0  8946fc               mov word ptr [bp - 4], ax
8:11C3  8956fe               mov word ptr [bp - 2], dx
8:11C6  66c746f800000000     mov dword ptr [bp - 8], 0
8:11CE  eb04                 jmp 0x11d4
loc_11D0:
8:11D0  66ff46f8             inc dword ptr [bp - 8]
loc_11D4:
8:11D4  668b46fc             mov eax, dword ptr [bp - 4]
8:11D8  663946f8             cmp dword ptr [bp - 8], eax
8:11DC  733a                 jae 0x1218
8:11DE  66ff76f8             push dword ptr [bp - 8]
8:11E2  c45e0e               les bx, ptr [bp + 0xe]
8:11E5  06                   push es
8:11E6  53                   push bx
8:11E7  26c41f               les bx, ptr es:[bx]
8:11EA  26ff5f04             lcall es:[bx + 4]
8:11EE  52                   push dx
8:11EF  50                   push ax
8:11F0  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:11F5  9aece1c10f           lcall 0xfc1, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:11FA  52                   push dx
8:11FB  50                   push ax
8:11FC  9aa8738710           lcall 0x1087, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:1201  52                   push dx
8:1202  50                   push ax
8:1203  66ff760a             push dword ptr [bp + 0xa]
8:1207  66ff7606             push dword ptr [bp + 6]
8:120B  90                   nop
8:120C  0e                   push cs
8:120D  e87cfd               call 0xf8c  ; sub_s8:0F8C
8:1210  0bc0                 or ax, ax
8:1212  75bc                 jne 0x11d0
8:1214  c9                   leave
8:1215  ca0c00               retf 0xc
loc_1218:
8:1218  b80100               mov ax, 1
8:121B  c9                   leave
8:121C  ca0c00               retf 0xc
8:121F  db 00

; ---------------- sub_s8:1220 FAR size=298 callers=1
8:1220  c8140000             enter 0x14, 0
8:1224  57                   push di
8:1225  56                   push si
8:1226  6a04                 push 4
8:1228  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:122D  9afac66312           lcall 0x1263, 0xc6fa  ; sub_s2:C6FA
8:1232  52                   push dx
8:1233  50                   push ax
8:1234  66ff760a             push dword ptr [bp + 0xa]
8:1238  90                   nop
8:1239  0e                   push cs
8:123A  e8313b               call 0x4d6e  ; sub_s8:4D6E
8:123D  8946f8               mov word ptr [bp - 8], ax
8:1240  8956fa               mov word ptr [bp - 6], dx
8:1243  52                   push dx
8:1244  c45ef8               les bx, ptr [bp - 8]
8:1247  50                   push ax
8:1248  26c41f               les bx, ptr es:[bx]
8:124B  26ff5f10             lcall es:[bx + 0x10]
8:124F  0bd2                 or dx, dx
8:1251  7506                 jne 0x1259
8:1253  0bc0                 or ax, ax
8:1255  0f84d500             je 0x132e
loc_1259:
8:1259  6a05                 push 5
8:125B  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:1260  9afac6e012           lcall 0x12e0, 0xc6fa  ; sub_s2:C6FA
8:1265  52                   push dx
8:1266  50                   push ax
8:1267  66ff760a             push dword ptr [bp + 0xa]
8:126B  90                   nop
8:126C  0e                   push cs
8:126D  e8fe3a               call 0x4d6e  ; sub_s8:4D6E
8:1270  8946f4               mov word ptr [bp - 0xc], ax
8:1273  8956f6               mov word ptr [bp - 0xa], dx
8:1276  52                   push dx
8:1277  c45ef4               les bx, ptr [bp - 0xc]
8:127A  50                   push ax
8:127B  26c41f               les bx, ptr es:[bx]
8:127E  8bf3                 mov si, bx
8:1280  8cc7                 mov di, es
8:1282  26ff5f10             lcall es:[bx + 0x10]
8:1286  0bd2                 or dx, dx
8:1288  7504                 jne 0x128e
8:128A  0bc0                 or ax, ax
8:128C  7432                 je 0x12c0
loc_128E:
8:128E  66ff76f4             push dword ptr [bp - 0xc]
8:1292  66ff76f8             push dword ptr [bp - 8]
8:1296  66ff7606             push dword ptr [bp + 6]
8:129A  90                   nop
8:129B  0e                   push cs
8:129C  e811ff               call 0x11b0  ; sub_s8:11B0
8:129F  0bc0                 or ax, ax
8:12A1  751d                 jne 0x12c0
8:12A3  668b46f4             mov eax, dword ptr [bp - 0xc]
8:12A7  660bc0               or eax, eax
8:12AA  0f849600             je 0x1344
8:12AE  6a01                 push 1
8:12B0  ff76f6               push word ptr [bp - 0xa]
8:12B3  50                   push ax
8:12B4  8ec7                 mov es, di
8:12B6  26ff1c               lcall es:[si]
8:12B9  5e                   pop si
8:12BA  5f                   pop di
8:12BB  c9                   leave
8:12BC  ca0800               retf 8
8:12BF  db 90
loc_12C0:
8:12C0  668b46f4             mov eax, dword ptr [bp - 0xc]
8:12C4  660bc0               or eax, eax
8:12C7  740d                 je 0x12d6
8:12C9  6a01                 push 1
8:12CB  c45ef4               les bx, ptr [bp - 0xc]
8:12CE  06                   push es
8:12CF  50                   push ax
8:12D0  26c41f               les bx, ptr es:[bx]
8:12D3  26ff1f               lcall es:[bx]
loc_12D6:
8:12D6  6a06                 push 6
8:12D8  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:12DD  9afac6e40f           lcall 0xfe4, 0xc6fa  ; sub_s2:C6FA
8:12E2  52                   push dx
8:12E3  50                   push ax
8:12E4  66ff760a             push dword ptr [bp + 0xa]
8:12E8  90                   nop
8:12E9  0e                   push cs
8:12EA  e8813a               call 0x4d6e  ; sub_s8:4D6E
8:12ED  8946f4               mov word ptr [bp - 0xc], ax
8:12F0  8956f6               mov word ptr [bp - 0xa], dx
8:12F3  52                   push dx
8:12F4  c45ef4               les bx, ptr [bp - 0xc]
8:12F7  50                   push ax
8:12F8  26c41f               les bx, ptr es:[bx]
8:12FB  26ff5f10             lcall es:[bx + 0x10]
8:12FF  0bd2                 or dx, dx
8:1301  7504                 jne 0x1307
8:1303  0bc0                 or ax, ax
8:1305  7411                 je 0x1318
loc_1307:
8:1307  66ff76f4             push dword ptr [bp - 0xc]
8:130B  66ff76f8             push dword ptr [bp - 8]
8:130F  66ff7606             push dword ptr [bp + 6]
8:1313  90                   nop
8:1314  0e                   push cs
8:1315  e898fe               call 0x11b0  ; sub_s8:11B0
loc_1318:
8:1318  668b46f4             mov eax, dword ptr [bp - 0xc]
8:131C  660bc0               or eax, eax
8:131F  740d                 je 0x132e
8:1321  6a01                 push 1
8:1323  c45ef4               les bx, ptr [bp - 0xc]
8:1326  06                   push es
8:1327  50                   push ax
8:1328  26c41f               les bx, ptr es:[bx]
8:132B  26ff1f               lcall es:[bx]
loc_132E:
8:132E  668b46f8             mov eax, dword ptr [bp - 8]
8:1332  660bc0               or eax, eax
8:1335  740d                 je 0x1344
8:1337  6a01                 push 1
8:1339  c45ef8               les bx, ptr [bp - 8]
8:133C  06                   push es
8:133D  50                   push ax
8:133E  26c41f               les bx, ptr es:[bx]
8:1341  26ff1f               lcall es:[bx]
loc_1344:
8:1344  5e                   pop si
8:1345  5f                   pop di
8:1346  c9                   leave
8:1347  ca0800               retf 8

; ---------------- sub_s8:134A FAR size=144 callers=1
8:134A  c8180000             enter 0x18, 0
8:134E  c45e12               les bx, ptr [bp + 0x12]
8:1351  06                   push es
8:1352  53                   push bx
8:1353  26c41f               les bx, ptr es:[bx]
8:1356  26ff5f10             lcall es:[bx + 0x10]
8:135A  8946fc               mov word ptr [bp - 4], ax
8:135D  8956fe               mov word ptr [bp - 2], dx
8:1360  c45e0a               les bx, ptr [bp + 0xa]
8:1363  662bc0               sub eax, eax
8:1366  66268907             mov dword ptr es:[bx], eax
8:136A  668946f8             mov dword ptr [bp - 8], eax
loc_136E:
8:136E  668b46fc             mov eax, dword ptr [bp - 4]
8:1372  c45e0e               les bx, ptr [bp + 0xe]
8:1375  66263907             cmp dword ptr es:[bx], eax
8:1379  7355                 jae 0x13d0
8:137B  66268b07             mov eax, dword ptr es:[bx]
8:137F  668946e8             mov dword ptr [bp - 0x18], eax
8:1383  6626ff07             inc dword ptr es:[bx]
8:1387  66ff76e8             push dword ptr [bp - 0x18]
8:138B  c45e12               les bx, ptr [bp + 0x12]
8:138E  06                   push es
8:138F  53                   push bx
8:1390  26c41f               les bx, ptr es:[bx]
8:1393  26ff5f04             lcall es:[bx + 4]
8:1397  52                   push dx
8:1398  50                   push ax
8:1399  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:139E  9aece1b513           lcall 0x13b5, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:13A3  52                   push dx
8:13A4  50                   push ax
8:13A5  9aa873ff11           lcall 0x11ff, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:13AA  8946ec               mov word ptr [bp - 0x14], ax
8:13AD  8956ee               mov word ptr [bp - 0x12], dx
8:13B0  52                   push dx
8:13B1  50                   push ax
8:13B2  9ae245f811           lcall 0x11f8, 0x45e2  ; sub_s6:45E2
8:13B7  c45e0a               les bx, ptr [bp + 0xa]
8:13BA  268907               mov word ptr es:[bx], ax
8:13BD  26895702             mov word ptr es:[bx + 2], dx
8:13C1  8bc2                 mov ax, dx
8:13C3  260b07               or ax, word ptr es:[bx]
8:13C6  74a6                 je 0x136e
8:13C8  668b46ec             mov eax, dword ptr [bp - 0x14]
8:13CC  668946f8             mov dword ptr [bp - 8], eax
loc_13D0:
8:13D0  8b46f8               mov ax, word ptr [bp - 8]
8:13D3  8b56fa               mov dx, word ptr [bp - 6]
8:13D6  c9                   leave
8:13D7  ca1000               retf 0x10

; ---------------- sub_s8:13DA FAR size=168 callers=1
8:13DA  c8180000             enter 0x18, 0
8:13DE  c45e12               les bx, ptr [bp + 0x12]
8:13E1  06                   push es
8:13E2  53                   push bx
8:13E3  26c41f               les bx, ptr es:[bx]
8:13E6  26ff5f10             lcall es:[bx + 0x10]
8:13EA  8946fc               mov word ptr [bp - 4], ax
8:13ED  8956fe               mov word ptr [bp - 2], dx
8:13F0  c45e0a               les bx, ptr [bp + 0xa]
8:13F3  662bc0               sub eax, eax
8:13F6  66268907             mov dword ptr es:[bx], eax
8:13FA  668946f8             mov dword ptr [bp - 8], eax
loc_13FE:
8:13FE  668b46fc             mov eax, dword ptr [bp - 4]
8:1402  c45e0e               les bx, ptr [bp + 0xe]
8:1405  66263907             cmp dword ptr es:[bx], eax
8:1409  736c                 jae 0x1477
8:140B  66268b07             mov eax, dword ptr es:[bx]
8:140F  668946e8             mov dword ptr [bp - 0x18], eax
8:1413  6626ff07             inc dword ptr es:[bx]
8:1417  66ff76e8             push dword ptr [bp - 0x18]
8:141B  c45e12               les bx, ptr [bp + 0x12]
8:141E  06                   push es
8:141F  53                   push bx
8:1420  26c41f               les bx, ptr es:[bx]
8:1423  26ff5f04             lcall es:[bx + 4]
8:1427  52                   push dx
8:1428  50                   push ax
8:1429  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:142E  9aece15c14           lcall 0x145c, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:1433  8956f2               mov word ptr [bp - 0xe], dx
8:1436  0bd0                 or dx, ax
8:1438  7508                 jne 0x1442
loc_143A:
8:143A  33c0                 xor ax, ax
8:143C  99                   cdq
8:143D  c9                   leave
8:143E  ca1000               retf 0x10
8:1441  db 90
loc_1442:
8:1442  ff76f2               push word ptr [bp - 0xe]
8:1445  50                   push ax
8:1446  9aa873a813           lcall 0x13a8, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:144B  8946ec               mov word ptr [bp - 0x14], ax
8:144E  8956ee               mov word ptr [bp - 0x12], dx
8:1451  0bd0                 or dx, ax
8:1453  74e5                 je 0x143a
8:1455  ff76ee               push word ptr [bp - 0x12]
8:1458  50                   push ax
8:1459  9a323ca113           lcall 0x13a1, 0x3c32  ; sub_s6:3C32
8:145E  c45e0a               les bx, ptr [bp + 0xa]
8:1461  268907               mov word ptr es:[bx], ax
8:1464  26895702             mov word ptr es:[bx + 2], dx
8:1468  8bc2                 mov ax, dx
8:146A  260b07               or ax, word ptr es:[bx]
8:146D  748f                 je 0x13fe
8:146F  668b46ec             mov eax, dword ptr [bp - 0x14]
8:1473  668946f8             mov dword ptr [bp - 8], eax
loc_1477:
8:1477  8b46f8               mov ax, word ptr [bp - 8]
8:147A  8b56fa               mov dx, word ptr [bp - 6]
8:147D  c9                   leave
8:147E  ca1000               retf 0x10
8:1481  db 00

; ---------------- sub_s8:1482 FAR size=624 callers=1
8:1482  c84c0000             enter 0x4c, 0
8:1486  662bc0               sub eax, eax
8:1489  668946fc             mov dword ptr [bp - 4], eax
8:148D  668946f8             mov dword ptr [bp - 8], eax
8:1491  66ff760e             push dword ptr [bp + 0xe]
8:1495  8d46fc               lea ax, [bp - 4]
8:1498  16                   push ss
8:1499  50                   push ax
8:149A  8d46f8               lea ax, [bp - 8]
8:149D  16                   push ss
8:149E  50                   push ax
8:149F  66ff7606             push dword ptr [bp + 6]
8:14A3  90                   nop
8:14A4  0e                   push cs
8:14A5  e8a2fe               call 0x134a  ; sub_s8:134A
8:14A8  8946f4               mov word ptr [bp - 0xc], ax
8:14AB  8956f6               mov word ptr [bp - 0xa], dx
8:14AE  c45e0a               les bx, ptr [bp + 0xa]
8:14B1  06                   push es
8:14B2  53                   push bx
8:14B3  26c41f               les bx, ptr es:[bx]
8:14B6  26ff5f10             lcall es:[bx + 0x10]
8:14BA  8946f0               mov word ptr [bp - 0x10], ax
8:14BD  8956f2               mov word ptr [bp - 0xe], dx
8:14C0  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:14C8  e93c01               jmp 0x1607
8:14CB  db 90
loc_14CC:
8:14CC  668b46bc             mov eax, dword ptr [bp - 0x44]
8:14D0  8b56be               mov dx, word ptr [bp - 0x42]
8:14D3  663b46e0             cmp eax, dword ptr [bp - 0x20]
8:14D7  7606                 jbe 0x14df
8:14D9  8b46e0               mov ax, word ptr [bp - 0x20]
8:14DC  8b56e2               mov dx, word ptr [bp - 0x1e]
loc_14DF:
8:14DF  3b56fa               cmp dx, word ptr [bp - 6]
8:14E2  720d                 jb 0x14f1
8:14E4  7705                 ja 0x14eb
8:14E6  3b46f8               cmp ax, word ptr [bp - 8]
8:14E9  7606                 jbe 0x14f1
loc_14EB:
8:14EB  8b46f8               mov ax, word ptr [bp - 8]
8:14EE  8b56fa               mov dx, word ptr [bp - 6]
loc_14F1:
8:14F1  8946b8               mov word ptr [bp - 0x48], ax
8:14F4  8956ba               mov word ptr [bp - 0x46], dx
8:14F7  2946e0               sub word ptr [bp - 0x20], ax
8:14FA  1956e2               sbb word ptr [bp - 0x1e], dx
8:14FD  2946f8               sub word ptr [bp - 8], ax
8:1500  1956fa               sbb word ptr [bp - 6], dx
8:1503  66837ecc00           cmp dword ptr [bp - 0x34], 0
8:1508  752f                 jne 0x1539
8:150A  6a0a                 push 0xa
8:150C  9a9c172411           lcall 0x1124, 0x179c  ; operator_new@s1:179C
8:1511  83c402               add sp, 2
8:1514  8946b4               mov word ptr [bp - 0x4c], ax
8:1517  8956b6               mov word ptr [bp - 0x4a], dx
8:151A  0bd0                 or dx, ax
8:151C  7412                 je 0x1530
8:151E  666805000500         push 0x50005
8:1524  ff76b6               push word ptr [bp - 0x4a]
8:1527  50                   push ax
8:1528  9a3eba4715           lcall 0x1547, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
8:152D  eb04                 jmp 0x1533
8:152F  db 90
loc_1530:
8:1530  33c0                 xor ax, ax
8:1532  99                   cdq
loc_1533:
8:1533  8946cc               mov word ptr [bp - 0x34], ax
8:1536  8956ce               mov word ptr [bp - 0x32], dx
loc_1539:
8:1539  ff76c0               push word ptr [bp - 0x40]
8:153C  66ff76b8             push dword ptr [bp - 0x48]
8:1540  66ff76cc             push dword ptr [bp - 0x34]
8:1544  9a8abb5d15           lcall 0x155d, 0xbb8a  ; SparseTable::set@s5:BB8A
8:1549  ff76c0               push word ptr [bp - 0x40]
8:154C  668b46bc             mov eax, dword ptr [bp - 0x44]
8:1550  662b46b8             sub eax, dword ptr [bp - 0x48]
8:1554  6650                 push eax
8:1556  66ff76d0             push dword ptr [bp - 0x30]
8:155A  9a8abbd516           lcall 0x16d5, 0xbb8a  ; SparseTable::set@s5:BB8A
8:155F  66837ef800           cmp dword ptr [bp - 8], 0
8:1564  756d                 jne 0x15d3
8:1566  66ff76cc             push dword ptr [bp - 0x34]
8:156A  66ff76f4             push dword ptr [bp - 0xc]
8:156E  66ff7606             push dword ptr [bp + 6]
8:1572  90                   nop
8:1573  0e                   push cs
8:1574  e8c305               call 0x1b3a  ; sub_s8:1B3A
8:1577  66c746cc00000000     mov dword ptr [bp - 0x34], 0
8:157F  66ff760e             push dword ptr [bp + 0xe]
8:1583  8d46fc               lea ax, [bp - 4]
8:1586  16                   push ss
8:1587  50                   push ax
8:1588  8d46f8               lea ax, [bp - 8]
8:158B  16                   push ss
8:158C  50                   push ax
8:158D  66ff7606             push dword ptr [bp + 6]
8:1591  90                   nop
8:1592  0e                   push cs
8:1593  e8b4fd               call 0x134a  ; sub_s8:134A
8:1596  8946f4               mov word ptr [bp - 0xc], ax
8:1599  8956f6               mov word ptr [bp - 0xa], dx
8:159C  0bd0                 or dx, ax
8:159E  7433                 je 0x15d3
8:15A0  666a64               push 0x64
8:15A3  ff76f6               push word ptr [bp - 0xa]
8:15A6  50                   push ax
8:15A7  9a8eb52716           lcall 0x1627, 0xb58e  ; DbObj::getOwner@s6:B58E
8:15AC  8946e8               mov word ptr [bp - 0x18], ax
8:15AF  8956ea               mov word ptr [bp - 0x16], dx
8:15B2  52                   push dx
8:15B3  50                   push ax
8:15B4  66ff7606             push dword ptr [bp + 6]
8:15B8  90                   nop
8:15B9  0e                   push cs
8:15BA  e87304               call 0x1a30  ; sub_s8:1A30
8:15BD  8946e4               mov word ptr [bp - 0x1c], ax
8:15C0  8956e6               mov word ptr [bp - 0x1a], dx
8:15C3  52                   push dx
8:15C4  50                   push ax
8:15C5  6658                 pop eax
8:15C7  6659                 pop ecx
8:15C9  66f7e1               mul ecx
8:15CC  66d1e8               shr eax, 1
8:15CF  668946e0             mov dword ptr [bp - 0x20], eax
loc_15D3:
8:15D3  66837ee000           cmp dword ptr [bp - 0x20], 0
8:15D8  7409                 je 0x15e3
8:15DA  66837ef800           cmp dword ptr [bp - 8], 0
8:15DF  0f85d100             jne 0x16b4
loc_15E3:
8:15E3  66837ecc00           cmp dword ptr [bp - 0x34], 0
8:15E8  7419                 je 0x1603
8:15EA  66ff76cc             push dword ptr [bp - 0x34]
8:15EE  66ff76f4             push dword ptr [bp - 0xc]
8:15F2  66ff7606             push dword ptr [bp + 6]
8:15F6  90                   nop
8:15F7  0e                   push cs
8:15F8  e83f05               call 0x1b3a  ; sub_s8:1B3A
8:15FB  66c746cc00000000     mov dword ptr [bp - 0x34], 0
loc_1603:
8:1603  66ff46ec             inc dword ptr [bp - 0x14]
loc_1607:
8:1607  668b46f0             mov eax, dword ptr [bp - 0x10]
8:160B  8b56f2               mov dx, word ptr [bp - 0xe]
8:160E  663946ec             cmp dword ptr [bp - 0x14], eax
8:1612  0f83d800             jae 0x16ee
8:1616  8b46f6               mov ax, word ptr [bp - 0xa]
8:1619  0b46f4               or ax, word ptr [bp - 0xc]
8:161C  0f84ce00             je 0x16ee
8:1620  66ff76f4             push dword ptr [bp - 0xc]
8:1624  9a8eb57916           lcall 0x1679, 0xb58e  ; DbObj::getOwner@s6:B58E
8:1629  8946e8               mov word ptr [bp - 0x18], ax
8:162C  8956ea               mov word ptr [bp - 0x16], dx
8:162F  52                   push dx
8:1630  50                   push ax
8:1631  66ff7606             push dword ptr [bp + 6]
8:1635  90                   nop
8:1636  0e                   push cs
8:1637  e8f603               call 0x1a30  ; sub_s8:1A30
8:163A  8946e4               mov word ptr [bp - 0x1c], ax
8:163D  8956e6               mov word ptr [bp - 0x1a], dx
8:1640  0bd0                 or dx, ax
8:1642  74bf                 je 0x1603
8:1644  666a64               push 0x64
8:1647  ff76e6               push word ptr [bp - 0x1a]
8:164A  50                   push ax
8:164B  6658                 pop eax
8:164D  6659                 pop ecx
8:164F  66f7e1               mul ecx
8:1652  66d1e8               shr eax, 1
8:1655  668946e0             mov dword ptr [bp - 0x20], eax
8:1659  66ff76ec             push dword ptr [bp - 0x14]
8:165D  c45e0a               les bx, ptr [bp + 0xa]
8:1660  06                   push es
8:1661  53                   push bx
8:1662  26c41f               les bx, ptr es:[bx]
8:1665  26ff5f04             lcall es:[bx + 4]
8:1669  8946dc               mov word ptr [bp - 0x24], ax
8:166C  8956de               mov word ptr [bp - 0x22], dx
8:166F  52                   push dx
8:1670  50                   push ax
8:1671  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:1676  9aece13114           lcall 0x1431, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:167B  8946d8               mov word ptr [bp - 0x28], ax
8:167E  8956da               mov word ptr [bp - 0x26], dx
8:1681  52                   push dx
8:1682  50                   push ax
8:1683  9aa8734914           lcall 0x1449, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:1688  8946d4               mov word ptr [bp - 0x2c], ax
8:168B  8956d6               mov word ptr [bp - 0x2a], dx
8:168E  c45ed4               les bx, ptr [bp - 0x2c]
8:1691  66268b4728           mov eax, dword ptr es:[bx + 0x28]
8:1696  668946d0             mov dword ptr [bp - 0x30], eax
8:169A  66c746cc00000000     mov dword ptr [bp - 0x34], 0
8:16A2  c45ed0               les bx, ptr [bp - 0x30]
8:16A5  268b4704             mov ax, word ptr es:[bx + 4]
8:16A9  8946ca               mov word ptr [bp - 0x36], ax
8:16AC  c746c80000           mov word ptr [bp - 0x38], 0
8:16B1  eb04                 jmp 0x16b7
8:16B3  db 90
loc_16B4:
8:16B4  ff46c8               inc word ptr [bp - 0x38]
loc_16B7:
8:16B7  8b46ca               mov ax, word ptr [bp - 0x36]
8:16BA  3946c8               cmp word ptr [bp - 0x38], ax
8:16BD  0f8322ff             jae 0x15e3
8:16C1  ff76c8               push word ptr [bp - 0x38]
8:16C4  8d46c0               lea ax, [bp - 0x40]
8:16C7  16                   push ss
8:16C8  50                   push ax
8:16C9  8d4ebc               lea cx, [bp - 0x44]
8:16CC  16                   push ss
8:16CD  51                   push cx
8:16CE  66ff76d0             push dword ptr [bp - 0x30]
8:16D2  9a16bbffff           lcall 0xffff, 0xbb16  ; sub_s5:BB16
8:16D7  66837ebc00           cmp dword ptr [bp - 0x44], 0
8:16DC  74d6                 je 0x16b4
8:16DE  837ec00d             cmp word ptr [bp - 0x40], 0xd
8:16E2  7ed0                 jle 0x16b4
8:16E4  837ec01c             cmp word ptr [bp - 0x40], 0x1c
8:16E8  0f8ee0fd             jle 0x14cc
8:16EC  ebc6                 jmp 0x16b4
loc_16EE:
8:16EE  c9                   leave
8:16EF  ca1000               retf 0x10

; ---------------- sub_s8:16F2 FAR size=590 callers=1
8:16F2  c8460000             enter 0x46, 0
8:16F6  662bc0               sub eax, eax
8:16F9  668946fc             mov dword ptr [bp - 4], eax
8:16FD  668946f8             mov dword ptr [bp - 8], eax
8:1701  66ff760e             push dword ptr [bp + 0xe]
8:1705  8d46fc               lea ax, [bp - 4]
8:1708  16                   push ss
8:1709  50                   push ax
8:170A  8d46f8               lea ax, [bp - 8]
8:170D  16                   push ss
8:170E  50                   push ax
8:170F  66ff7606             push dword ptr [bp + 6]
8:1713  90                   nop
8:1714  0e                   push cs
8:1715  e8c2fc               call 0x13da  ; sub_s8:13DA
8:1718  8946f4               mov word ptr [bp - 0xc], ax
8:171B  8956f6               mov word ptr [bp - 0xa], dx
8:171E  0bd0                 or dx, ax
8:1720  0f841802             je 0x193c
8:1724  c45e0a               les bx, ptr [bp + 0xa]
8:1727  06                   push es
8:1728  53                   push bx
8:1729  26c41f               les bx, ptr es:[bx]
8:172C  26ff5f10             lcall es:[bx + 0x10]
8:1730  8946f0               mov word ptr [bp - 0x10], ax
8:1733  8956f2               mov word ptr [bp - 0xe], dx
8:1736  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:173E  e9ad00               jmp 0x17ee
8:1741  db 90
loc_1742:
8:1742  33c0                 xor ax, ax
8:1744  99                   cdq
loc_1745:
8:1745  8946d0               mov word ptr [bp - 0x30], ax
8:1748  8956d2               mov word ptr [bp - 0x2e], dx
loc_174B:
8:174B  ff76ce               push word ptr [bp - 0x32]
8:174E  66ff76be             push dword ptr [bp - 0x42]
8:1752  66ff76d0             push dword ptr [bp - 0x30]
8:1756  9a8abb6f17           lcall 0x176f, 0xbb8a  ; SparseTable::set@s5:BB8A
8:175B  ff76ce               push word ptr [bp - 0x32]
8:175E  668b46c2             mov eax, dword ptr [bp - 0x3e]
8:1762  662b46be             sub eax, dword ptr [bp - 0x42]
8:1766  6650                 push eax
8:1768  66ff76d4             push dword ptr [bp - 0x2c]
8:176C  9a8abb9d18           lcall 0x189d, 0xbb8a  ; SparseTable::set@s5:BB8A
8:1771  8b46ce               mov ax, word ptr [bp - 0x32]
8:1774  8946ca               mov word ptr [bp - 0x36], ax
8:1777  66837ef800           cmp dword ptr [bp - 8], 0
8:177C  753c                 jne 0x17ba
8:177E  66ff76d0             push dword ptr [bp - 0x30]
8:1782  66ff76f4             push dword ptr [bp - 0xc]
8:1786  66ff7606             push dword ptr [bp + 6]
8:178A  90                   nop
8:178B  0e                   push cs
8:178C  e83703               call 0x1ac6  ; sub_s8:1AC6
8:178F  66c746d000000000     mov dword ptr [bp - 0x30], 0
8:1797  66ff760e             push dword ptr [bp + 0xe]
8:179B  8d46fc               lea ax, [bp - 4]
8:179E  16                   push ss
8:179F  50                   push ax
8:17A0  8d46f8               lea ax, [bp - 8]
8:17A3  16                   push ss
8:17A4  50                   push ax
8:17A5  66ff7606             push dword ptr [bp + 6]
8:17A9  90                   nop
8:17AA  0e                   push cs
8:17AB  e82cfc               call 0x13da  ; sub_s8:13DA
8:17AE  8946f4               mov word ptr [bp - 0xc], ax
8:17B1  8956f6               mov word ptr [bp - 0xa], dx
8:17B4  0bd0                 or dx, ax
8:17B6  0f848201             je 0x193c
loc_17BA:
8:17BA  66837ed800           cmp dword ptr [bp - 0x28], 0
8:17BF  7409                 je 0x17ca
8:17C1  66837ef800           cmp dword ptr [bp - 8], 0
8:17C6  0f854c01             jne 0x1916
loc_17CA:
8:17CA  66837ed000           cmp dword ptr [bp - 0x30], 0
8:17CF  7419                 je 0x17ea
8:17D1  66ff76d0             push dword ptr [bp - 0x30]
8:17D5  66ff76f4             push dword ptr [bp - 0xc]
8:17D9  66ff7606             push dword ptr [bp + 6]
8:17DD  90                   nop
8:17DE  0e                   push cs
8:17DF  e8e402               call 0x1ac6  ; sub_s8:1AC6
8:17E2  66c746d000000000     mov dword ptr [bp - 0x30], 0
loc_17EA:
8:17EA  66ff46ec             inc dword ptr [bp - 0x14]
loc_17EE:
8:17EE  668b46f0             mov eax, dword ptr [bp - 0x10]
8:17F2  8b56f2               mov dx, word ptr [bp - 0xe]
8:17F5  663946ec             cmp dword ptr [bp - 0x14], eax
8:17F9  0f833f01             jae 0x193c
8:17FD  66ff76ec             push dword ptr [bp - 0x14]
8:1801  c45e0a               les bx, ptr [bp + 0xa]
8:1804  06                   push es
8:1805  53                   push bx
8:1806  26c41f               les bx, ptr es:[bx]
8:1809  26ff5f04             lcall es:[bx + 4]
8:180D  8946e8               mov word ptr [bp - 0x18], ax
8:1810  8956ea               mov word ptr [bp - 0x16], dx
8:1813  52                   push dx
8:1814  50                   push ax
8:1815  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:181A  9aece18618           lcall 0x1886, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:181F  8946e4               mov word ptr [bp - 0x1c], ax
8:1822  8956e6               mov word ptr [bp - 0x1a], dx
8:1825  52                   push dx
8:1826  50                   push ax
8:1827  9aa8738616           lcall 0x1686, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:182C  8946e0               mov word ptr [bp - 0x20], ax
8:182F  8956e2               mov word ptr [bp - 0x1e], dx
8:1832  66ff76e4             push dword ptr [bp - 0x1c]
8:1836  66ff7606             push dword ptr [bp + 6]
8:183A  90                   nop
8:183B  0e                   push cs
8:183C  e8f101               call 0x1a30  ; sub_s8:1A30
8:183F  8946dc               mov word ptr [bp - 0x24], ax
8:1842  8956de               mov word ptr [bp - 0x22], dx
8:1845  0bd0                 or dx, ax
8:1847  74a1                 je 0x17ea
8:1849  666a64               push 0x64
8:184C  ff76de               push word ptr [bp - 0x22]
8:184F  50                   push ax
8:1850  6658                 pop eax
8:1852  6659                 pop ecx
8:1854  66f7e1               mul ecx
8:1857  66d1e8               shr eax, 1
8:185A  668946d8             mov dword ptr [bp - 0x28], eax
8:185E  c45ee4               les bx, ptr [bp - 0x1c]
8:1861  66268b4722           mov eax, dword ptr es:[bx + 0x22]
8:1866  268b5724             mov dx, word ptr es:[bx + 0x24]
8:186A  668946d4             mov dword ptr [bp - 0x2c], eax
8:186E  8bc2                 mov ax, dx
8:1870  0b46d4               or ax, word ptr [bp - 0x2c]
8:1873  0f8473ff             je 0x17ea
8:1877  66c746d000000000     mov dword ptr [bp - 0x30], 0
8:187F  66ff76e0             push dword ptr [bp - 0x20]
8:1883  9a800d1d19           lcall 0x191d, 0xd80  ; sub_s6:0D80
8:1888  8946ce               mov word ptr [bp - 0x32], ax
8:188B  8946cc               mov word ptr [bp - 0x34], ax
8:188E  c746ca0000           mov word ptr [bp - 0x36], 0
loc_1893:
8:1893  ff76ce               push word ptr [bp - 0x32]
8:1896  66ff76d4             push dword ptr [bp - 0x2c]
8:189A  9ae6ba1019           lcall 0x1910, 0xbae6  ; SparseTable::get@s5:BAE6
8:189F  8946c2               mov word ptr [bp - 0x3e], ax
8:18A2  8956c4               mov word ptr [bp - 0x3c], dx
8:18A5  0bd0                 or dx, ax
8:18A7  0f840fff             je 0x17ba
8:18AB  8b56c4               mov dx, word ptr [bp - 0x3c]
8:18AE  3b56da               cmp dx, word ptr [bp - 0x26]
8:18B1  720d                 jb 0x18c0
8:18B3  7705                 ja 0x18ba
8:18B5  3b46d8               cmp ax, word ptr [bp - 0x28]
8:18B8  7606                 jbe 0x18c0
loc_18BA:
8:18BA  8b46d8               mov ax, word ptr [bp - 0x28]
8:18BD  8b56da               mov dx, word ptr [bp - 0x26]
loc_18C0:
8:18C0  3b56fa               cmp dx, word ptr [bp - 6]
8:18C3  720d                 jb 0x18d2
8:18C5  7705                 ja 0x18cc
8:18C7  3b46f8               cmp ax, word ptr [bp - 8]
8:18CA  7606                 jbe 0x18d2
loc_18CC:
8:18CC  8b46f8               mov ax, word ptr [bp - 8]
8:18CF  8b56fa               mov dx, word ptr [bp - 6]
loc_18D2:
8:18D2  8946be               mov word ptr [bp - 0x42], ax
8:18D5  8956c0               mov word ptr [bp - 0x40], dx
8:18D8  2946d8               sub word ptr [bp - 0x28], ax
8:18DB  1956da               sbb word ptr [bp - 0x26], dx
8:18DE  2946f8               sub word ptr [bp - 8], ax
8:18E1  1956fa               sbb word ptr [bp - 6], dx
8:18E4  66837ed000           cmp dword ptr [bp - 0x30], 0
8:18E9  0f855efe             jne 0x174b
8:18ED  6a0a                 push 0xa
8:18EF  9a9c170f15           lcall 0x150f, 0x179c  ; operator_new@s1:179C
8:18F4  83c402               add sp, 2
8:18F7  8946ba               mov word ptr [bp - 0x46], ax
8:18FA  8956bc               mov word ptr [bp - 0x44], dx
8:18FD  0bd0                 or dx, ax
8:18FF  0f843ffe             je 0x1742
8:1903  666805000500         push 0x50005
8:1909  ff76bc               push word ptr [bp - 0x44]
8:190C  50                   push ax
8:190D  9a3eba2b15           lcall 0x152b, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
8:1912  e930fe               jmp 0x1745
8:1915  db 90
loc_1916:
8:1916  66ff76e0             push dword ptr [bp - 0x20]
8:191A  9a800daa15           lcall 0x15aa, 0xd80  ; sub_s6:0D80
8:191F  8946ce               mov word ptr [bp - 0x32], ax
8:1922  3b46ca               cmp ax, word ptr [bp - 0x36]
8:1925  0f84a1fe             je 0x17ca
8:1929  837eca00             cmp word ptr [bp - 0x36], 0
8:192D  0f8562ff             jne 0x1893
8:1931  3b46cc               cmp ax, word ptr [bp - 0x34]
8:1934  0f855bff             jne 0x1893
8:1938  e98ffe               jmp 0x17ca
8:193B  db 90
loc_193C:
8:193C  c9                   leave
8:193D  ca1000               retf 0x10

; ---------------- sub_s8:1940 FAR size=96 callers=1
8:1940  c8140000             enter 0x14, 0
8:1944  6a03                 push 3
8:1946  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:194B  9afac63012           lcall 0x1230, 0xc6fa  ; sub_s2:C6FA
8:1950  52                   push dx
8:1951  50                   push ax
8:1952  66ff760e             push dword ptr [bp + 0xe]
8:1956  90                   nop
8:1957  0e                   push cs
8:1958  e81334               call 0x4d6e  ; sub_s8:4D6E
8:195B  8946f8               mov word ptr [bp - 8], ax
8:195E  8956fa               mov word ptr [bp - 6], dx
8:1961  52                   push dx
8:1962  c45ef8               les bx, ptr [bp - 8]
8:1965  50                   push ax
8:1966  26c41f               les bx, ptr es:[bx]
8:1969  26ff5f10             lcall es:[bx + 0x10]
8:196D  0bd0                 or dx, ax
8:196F  7415                 je 0x1986
8:1971  66ff760e             push dword ptr [bp + 0xe]
8:1975  66ff76f8             push dword ptr [bp - 8]
8:1979  66ff760a             push dword ptr [bp + 0xa]
8:197D  66ff7606             push dword ptr [bp + 6]
8:1981  90                   nop
8:1982  0e                   push cs
8:1983  e8fcfa               call 0x1482  ; sub_s8:1482
loc_1986:
8:1986  668b46f8             mov eax, dword ptr [bp - 8]
8:198A  660bc0               or eax, eax
8:198D  740d                 je 0x199c
8:198F  6a01                 push 1
8:1991  c45ef8               les bx, ptr [bp - 8]
8:1994  06                   push es
8:1995  50                   push ax
8:1996  26c41f               les bx, ptr es:[bx]
8:1999  26ff1f               lcall es:[bx]
loc_199C:
8:199C  c9                   leave
8:199D  ca0c00               retf 0xc

; ---------------- sub_s8:19A0 FAR size=144 callers=1
8:19A0  c8140000             enter 0x14, 0
8:19A4  57                   push di
8:19A5  56                   push si
8:19A6  6a02                 push 2
8:19A8  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:19AD  9afac64e19           lcall 0x194e, 0xc6fa  ; sub_s2:C6FA
8:19B2  52                   push dx
8:19B3  50                   push ax
8:19B4  66ff760e             push dword ptr [bp + 0xe]
8:19B8  90                   nop
8:19B9  0e                   push cs
8:19BA  e8b133               call 0x4d6e  ; sub_s8:4D6E
8:19BD  8946f8               mov word ptr [bp - 8], ax
8:19C0  8956fa               mov word ptr [bp - 6], dx
8:19C3  52                   push dx
8:19C4  c45ef8               les bx, ptr [bp - 8]
8:19C7  50                   push ax
8:19C8  26c41f               les bx, ptr es:[bx]
8:19CB  8bf3                 mov si, bx
8:19CD  8cc7                 mov di, es
8:19CF  26ff5f10             lcall es:[bx + 0x10]
8:19D3  0bd0                 or dx, ax
8:19D5  7527                 jne 0x19fe
8:19D7  1e                   push ds
8:19D8  68df59               push 0x59df  ; 'mineToSmelter->no mines'
8:19DB  9a0a842a18           lcall 0x182a, 0x840a  ; sub_s7:840A
8:19E0  83c404               add sp, 4
8:19E3  668b46f8             mov eax, dword ptr [bp - 8]
8:19E7  660bc0               or eax, eax
8:19EA  743d                 je 0x1a29
8:19EC  6a01                 push 1
8:19EE  ff76fa               push word ptr [bp - 6]
8:19F1  50                   push ax
8:19F2  8ec7                 mov es, di
8:19F4  26ff1c               lcall es:[si]
8:19F7  5e                   pop si
8:19F8  5f                   pop di
8:19F9  c9                   leave
8:19FA  ca0c00               retf 0xc
8:19FD  db 90
loc_19FE:
8:19FE  66ff760e             push dword ptr [bp + 0xe]
8:1A02  66ff760a             push dword ptr [bp + 0xa]
8:1A06  66ff76f8             push dword ptr [bp - 8]
8:1A0A  66ff7606             push dword ptr [bp + 6]
8:1A0E  90                   nop
8:1A0F  0e                   push cs
8:1A10  e8dffc               call 0x16f2  ; sub_s8:16F2
8:1A13  668b46f8             mov eax, dword ptr [bp - 8]
8:1A17  660bc0               or eax, eax
8:1A1A  740d                 je 0x1a29
8:1A1C  6a01                 push 1
8:1A1E  c45ef8               les bx, ptr [bp - 8]
8:1A21  06                   push es
8:1A22  50                   push ax
8:1A23  26c41f               les bx, ptr es:[bx]
8:1A26  26ff1f               lcall es:[bx]
loc_1A29:
8:1A29  5e                   pop si
8:1A2A  5f                   pop di
8:1A2B  c9                   leave
8:1A2C  ca0c00               retf 0xc
8:1A2F  db 00

; ---------------- sub_s8:1A30 FAR size=150 callers=2
8:1A30  c8220000             enter 0x22, 0
8:1A34  c45e0a               les bx, ptr [bp + 0xa]
8:1A37  66268b471e           mov eax, dword ptr es:[bx + 0x1e]
8:1A3C  268b5720             mov dx, word ptr es:[bx + 0x20]
8:1A40  668946fc             mov dword ptr [bp - 4], eax
8:1A44  8bc2                 mov ax, dx
8:1A46  0b46fc               or ax, word ptr [bp - 4]
8:1A49  7507                 jne 0x1a52
8:1A4B  33c0                 xor ax, ax
8:1A4D  99                   cdq
8:1A4E  c9                   leave
8:1A4F  ca0800               retf 8
loc_1A52:
8:1A52  52                   push dx
8:1A53  c45efc               les bx, ptr [bp - 4]
8:1A56  53                   push bx
8:1A57  26c41f               les bx, ptr es:[bx]
8:1A5A  26ff5f10             lcall es:[bx + 0x10]
8:1A5E  8946f8               mov word ptr [bp - 8], ax
8:1A61  8956fa               mov word ptr [bp - 6], dx
8:1A64  662bc0               sub eax, eax
8:1A67  668946f4             mov dword ptr [bp - 0xc], eax
8:1A6B  668946f0             mov dword ptr [bp - 0x10], eax
8:1A6F  eb05                 jmp 0x1a76
8:1A71  db 90
loc_1A72:
8:1A72  66ff46f0             inc dword ptr [bp - 0x10]
loc_1A76:
8:1A76  668b46f8             mov eax, dword ptr [bp - 8]
8:1A7A  663946f0             cmp dword ptr [bp - 0x10], eax
8:1A7E  733c                 jae 0x1abc
8:1A80  66ff76f0             push dword ptr [bp - 0x10]
8:1A84  c45efc               les bx, ptr [bp - 4]
8:1A87  06                   push es
8:1A88  53                   push bx
8:1A89  26c41f               les bx, ptr es:[bx]
8:1A8C  26ff5f04             lcall es:[bx + 4]
8:1A90  8956ea               mov word ptr [bp - 0x16], dx
8:1A93  0bd0                 or dx, ax
8:1A95  74db                 je 0x1a72
8:1A97  ff76ea               push word ptr [bp - 0x16]
8:1A9A  50                   push ax
8:1A9B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:1AA0  9aece11d18           lcall 0x181d, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:1AA5  8946e4               mov word ptr [bp - 0x1c], ax
8:1AA8  8956e6               mov word ptr [bp - 0x1a], dx
8:1AAB  c45ee4               les bx, ptr [bp - 0x1c]
8:1AAE  26837f0c04           cmp word ptr es:[bx + 0xc], 4
8:1AB3  75bd                 jne 0x1a72
8:1AB5  66ff46f4             inc dword ptr [bp - 0xc]
8:1AB9  ebb7                 jmp 0x1a72
8:1ABB  db 90
loc_1ABC:
8:1ABC  8b46f4               mov ax, word ptr [bp - 0xc]
8:1ABF  8b56f6               mov dx, word ptr [bp - 0xa]
8:1AC2  c9                   leave
8:1AC3  ca0800               retf 8

; ---------------- sub_s8:1AC6 FAR size=116 callers=1
8:1AC6  c8340100             enter 0x134, 0
8:1ACA  66ff760a             push dword ptr [bp + 0xa]
8:1ACE  9a8eb5281b           lcall 0x1b28, 0xb58e  ; DbObj::getOwner@s6:B58E
8:1AD3  8946fc               mov word ptr [bp - 4], ax
8:1AD6  8956fe               mov word ptr [bp - 2], dx
8:1AD9  c45efc               les bx, ptr [bp - 4]
8:1ADC  6626ff7704           push dword ptr es:[bx + 4]
8:1AE1  c45e0a               les bx, ptr [bp + 0xa]
8:1AE4  26ff770c             push word ptr es:[bx + 0xc]
8:1AE8  66ff760e             push dword ptr [bp + 0xe]
8:1AEC  8d86eafe             lea ax, [bp - 0x116]
8:1AF0  16                   push ss
8:1AF1  50                   push ax
8:1AF2  9aa0e8de19           lcall 0x19de, 0xe8a0  ; SCMoveBas@s7:E8A0
8:1AF7  c41e4857             les bx, ptr [0x5748]  ; g_sim
8:1AFB  66268b07             mov eax, dword ptr es:[bx]
8:1AFF  668986e6fe           mov dword ptr [bp - 0x11a], eax
8:1B04  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:1B08  66268b07             mov eax, dword ptr es:[bx]
8:1B0C  668986e2fe           mov dword ptr [bp - 0x11e], eax
8:1B11  8d86eafe             lea ax, [bp - 0x116]
8:1B15  16                   push ss
8:1B16  50                   push ax
8:1B17  668b86e2fe           mov eax, dword ptr [bp - 0x11e]
8:1B1C  6640                 inc eax
8:1B1E  6650                 push eax
8:1B20  66ffb6e6fe           push dword ptr [bp - 0x11a]
8:1B25  9a2cd5a31a           lcall 0x1aa3, 0xd52c  ; sub_s6:D52C
8:1B2A  c786eafe9a38         mov word ptr [bp - 0x116], 0x389a
8:1B30  c786ecfeb019         mov word ptr [bp - 0x114], 0x19b0  ; SEGMENT s2:0000
8:1B36  c9                   leave
8:1B37  ca0c00               retf 0xc

; ---------------- sub_s8:1B3A FAR size=200 callers=1
8:1B3A  c8220000             enter 0x22, 0
8:1B3E  66ff760a             push dword ptr [bp + 0xa]
8:1B42  9a8eb55a1b           lcall 0x1b5a, 0xb58e  ; DbObj::getOwner@s6:B58E
8:1B47  8946fc               mov word ptr [bp - 4], ax
8:1B4A  8956fe               mov word ptr [bp - 2], dx
8:1B4D  668b460a             mov eax, dword ptr [bp + 0xa]
8:1B51  668946f8             mov dword ptr [bp - 8], eax
8:1B55  6650                 push eax
8:1B57  9ae245d11a           lcall 0x1ad1, 0x45e2  ; sub_s6:45E2
8:1B5C  8946f4               mov word ptr [bp - 0xc], ax
8:1B5F  8956f6               mov word ptr [bp - 0xa], dx
8:1B62  c45e0e               les bx, ptr [bp + 0xe]
8:1B65  268b4704             mov ax, word ptr es:[bx + 4]
8:1B69  8946f2               mov word ptr [bp - 0xe], ax
8:1B6C  c746f00000           mov word ptr [bp - 0x10], 0
8:1B71  eb21                 jmp 0x1b94
8:1B73  db 90
loc_1B74:
8:1B74  ff76ec               push word ptr [bp - 0x14]
8:1B77  52                   push dx
8:1B78  50                   push ax
8:1B79  66ff76fc             push dword ptr [bp - 4]
8:1B7D  9adc7dd31b           lcall 0x1bd3, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
8:1B82  66c746f400000000     mov dword ptr [bp - 0xc], 0
loc_1B8A:
8:1B8A  66837ef400           cmp dword ptr [bp - 0xc], 0
8:1B8F  7447                 je 0x1bd8
8:1B91  ff46f0               inc word ptr [bp - 0x10]
loc_1B94:
8:1B94  8b46f2               mov ax, word ptr [bp - 0xe]
8:1B97  3946f0               cmp word ptr [bp - 0x10], ax
8:1B9A  733c                 jae 0x1bd8
8:1B9C  ff76f0               push word ptr [bp - 0x10]
8:1B9F  8d46ec               lea ax, [bp - 0x14]
8:1BA2  16                   push ss
8:1BA3  50                   push ax
8:1BA4  8d4ee8               lea cx, [bp - 0x18]
8:1BA7  16                   push ss
8:1BA8  51                   push cx
8:1BA9  66ff760e             push dword ptr [bp + 0xe]
8:1BAD  9a16bbf21b           lcall 0x1bf2, 0xbb16  ; sub_s5:BB16
8:1BB2  668b46f4             mov eax, dword ptr [bp - 0xc]
8:1BB6  8b56f6               mov dx, word ptr [bp - 0xa]
8:1BB9  663946e8             cmp dword ptr [bp - 0x18], eax
8:1BBD  77b5                 ja 0x1b74
8:1BBF  668b46e8             mov eax, dword ptr [bp - 0x18]
8:1BC3  662946f4             sub dword ptr [bp - 0xc], eax
8:1BC7  ff76ec               push word ptr [bp - 0x14]
8:1BCA  6650                 push eax
8:1BCC  66ff76fc             push dword ptr [bp - 4]
8:1BD0  9adc7df51a           lcall 0x1af5, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
8:1BD5  ebb3                 jmp 0x1b8a
8:1BD7  db 90
loc_1BD8:
8:1BD8  668b460e             mov eax, dword ptr [bp + 0xe]
8:1BDC  8b5610               mov dx, word ptr [bp + 0x10]
8:1BDF  668946e0             mov dword ptr [bp - 0x20], eax
8:1BE3  668946e4             mov dword ptr [bp - 0x1c], eax
8:1BE7  0bd0                 or dx, ax
8:1BE9  7412                 je 0x1bfd
8:1BEB  ff7610               push word ptr [bp + 0x10]
8:1BEE  50                   push ax
8:1BEF  9a7eba5917           lcall 0x1759, 0xba7e  ; sub_s5:BA7E
8:1BF4  66ff760e             push dword ptr [bp + 0xe]
8:1BF8  9ace17f218           lcall 0x18f2, 0x17ce  ; operator_delete@s1:17CE
loc_1BFD:
8:1BFD  c9                   leave
8:1BFE  ca0c00               retf 0xc
8:1C01  db 00

; ---------------- SCMove::dtor@s8:1C02 FAR size=60 callers=0
8:1C02  c80c0000             enter 0xc, 0
8:1C06  c45e06               les bx, ptr [bp + 6]
8:1C09  26c7079a38           mov word ptr es:[bx], 0x389a
8:1C0E  26c74702341b         mov word ptr es:[bx + 2], 0x1b34  ; SEGMENT s2:0000
8:1C14  f6460a01             test byte ptr [bp + 0xa], 1
8:1C18  7409                 je 0x1c23
8:1C1A  66ff7606             push dword ptr [bp + 6]
8:1C1E  9ace17fb1b           lcall 0x1bfb, 0x17ce  ; operator_delete@s1:17CE
loc_1C23:
8:1C23  8b4606               mov ax, word ptr [bp + 6]
8:1C26  8b5608               mov dx, word ptr [bp + 8]
8:1C29  c9                   leave
8:1C2A  ca0600               retf 6
8:1C2D  db 00 02 1c 34 1c 00 0c 3c 1c 28 d2 45 1b f0 0c 6d
8:1C3D  db 0d

; ---------------- sub_s8:1C3E FAR size=298 callers=1
8:1C3E  c8280000             enter 0x28, 0
8:1C42  c45e0a               les bx, ptr [bp + 0xa]
8:1C45  66268b470c           mov eax, dword ptr es:[bx + 0xc]
8:1C4A  268b570e             mov dx, word ptr es:[bx + 0xe]
8:1C4E  668946fc             mov dword ptr [bp - 4], eax
8:1C52  52                   push dx
8:1C53  c45efc               les bx, ptr [bp - 4]
8:1C56  50                   push ax
8:1C57  26c41f               les bx, ptr es:[bx]
8:1C5A  26ff5f10             lcall es:[bx + 0x10]
8:1C5E  8946f8               mov word ptr [bp - 8], ax
8:1C61  8956fa               mov word ptr [bp - 6], dx
8:1C64  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:1C6C  eb0c                 jmp 0x1c7a
loc_1C6E:
8:1C6E  6626837f3600         cmp dword ptr es:[bx + 0x36], 0
8:1C74  7548                 jne 0x1cbe
loc_1C76:
8:1C76  66ff46f4             inc dword ptr [bp - 0xc]
loc_1C7A:
8:1C7A  668b46f8             mov eax, dword ptr [bp - 8]
8:1C7E  663946f4             cmp dword ptr [bp - 0xc], eax
8:1C82  0f83de00             jae 0x1d64
8:1C86  66ff76f4             push dword ptr [bp - 0xc]
8:1C8A  c45efc               les bx, ptr [bp - 4]
8:1C8D  06                   push es
8:1C8E  53                   push bx
8:1C8F  26c41f               les bx, ptr es:[bx]
8:1C92  26ff5f04             lcall es:[bx + 4]
8:1C96  8956ee               mov word ptr [bp - 0x12], dx
8:1C99  0bd0                 or dx, ax
8:1C9B  74d9                 je 0x1c76
8:1C9D  ff76ee               push word ptr [bp - 0x12]
8:1CA0  50                   push ax
8:1CA1  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:1CA6  9aece1381c           lcall 0x1c38, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:1CAB  8946e8               mov word ptr [bp - 0x18], ax
8:1CAE  8956ea               mov word ptr [bp - 0x16], dx
8:1CB1  c45ee8               les bx, ptr [bp - 0x18]
8:1CB4  268b4734             mov ax, word ptr es:[bx + 0x34]
8:1CB8  0bc0                 or ax, ax
8:1CBA  75b2                 jne 0x1c6e
8:1CBC  ebb8                 jmp 0x1c76
loc_1CBE:
8:1CBE  52                   push dx
8:1CBF  53                   push bx
8:1CC0  66ff7606             push dword ptr [bp + 6]
8:1CC4  90                   nop
8:1CC5  0e                   push cs
8:1CC6  e85103               call 0x201a  ; sub_s8:201A
8:1CC9  0bc0                 or ax, ax
8:1CCB  75a9                 jne 0x1c76
8:1CCD  66ff76e8             push dword ptr [bp - 0x18]
8:1CD1  9aa873801b           lcall 0x1b80, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:1CD6  8946de               mov word ptr [bp - 0x22], ax
8:1CD9  8956e0               mov word ptr [bp - 0x20], dx
8:1CDC  c45ede               les bx, ptr [bp - 0x22]
8:1CDF  268b470c             mov ax, word ptr es:[bx + 0xc]
8:1CE3  8946dc               mov word ptr [bp - 0x24], ax
8:1CE6  6a01                 push 1
8:1CE8  50                   push ax
8:1CE9  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:1CEE  9aaec6151d           lcall 0x1d15, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:1CF3  0bc0                 or ax, ax
8:1CF5  7411                 je 0x1d08
8:1CF7  66ff76e8             push dword ptr [bp - 0x18]
8:1CFB  66ff7606             push dword ptr [bp + 6]
8:1CFF  90                   nop
8:1D00  0e                   push cs
8:1D01  e8e407               call 0x24e8  ; sub_s8:24E8
8:1D04  e96fff               jmp 0x1c76
8:1D07  db 90
loc_1D08:
8:1D08  6a02                 push 2
8:1D0A  ff76dc               push word ptr [bp - 0x24]
8:1D0D  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:1D12  9aaec6391d           lcall 0x1d39, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:1D17  0bc0                 or ax, ax
8:1D19  7411                 je 0x1d2c
8:1D1B  66ff76e8             push dword ptr [bp - 0x18]
8:1D1F  66ff7606             push dword ptr [bp + 6]
8:1D23  90                   nop
8:1D24  0e                   push cs
8:1D25  e8c609               call 0x26ee  ; sub_s8:26EE
8:1D28  e94bff               jmp 0x1c76
8:1D2B  db 90
loc_1D2C:
8:1D2C  6a05                 push 5
8:1D2E  ff76dc               push word ptr [bp - 0x24]
8:1D31  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:1D36  9aaec64c1d           lcall 0x1d4c, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:1D3B  0bc0                 or ax, ax
8:1D3D  7515                 jne 0x1d54
8:1D3F  6a06                 push 6
8:1D41  ff76dc               push word ptr [bp - 0x24]
8:1D44  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:1D49  9aaec6121c           lcall 0x1c12, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:1D4E  0bc0                 or ax, ax
8:1D50  0f8422ff             je 0x1c76
loc_1D54:
8:1D54  66ff76e8             push dword ptr [bp - 0x18]
8:1D58  66ff7606             push dword ptr [bp + 6]
8:1D5C  90                   nop
8:1D5D  0e                   push cs
8:1D5E  e8a505               call 0x2306  ; sub_s8:2306
8:1D61  e912ff               jmp 0x1c76
loc_1D64:
8:1D64  c9                   leave
8:1D65  ca0800               retf 8

; ---------------- sub_s8:1D68 size=690 callers=0
8:1D68  c8680000             enter 0x68, 0
8:1D6C  66c746fc64000000     mov dword ptr [bp - 4], 0x64
8:1D74  c746fa0000           mov word ptr [bp - 6], 0
8:1D79  c45e0a               les bx, ptr [bp + 0xa]
8:1D7C  06                   push es
8:1D7D  53                   push bx
8:1D7E  26c41f               les bx, ptr es:[bx]
8:1D81  26ff5f10             lcall es:[bx + 0x10]
8:1D85  8946f6               mov word ptr [bp - 0xa], ax
8:1D88  8956f8               mov word ptr [bp - 8], dx
8:1D8B  66c746f200000000     mov dword ptr [bp - 0xe], 0
8:1D93  e9b500               jmp 0x1e4b
loc_1D96:
8:1D96  66ff76e6             push dword ptr [bp - 0x1a]
8:1D9A  9ac8627d1e           lcall 0x1e7d, 0x62c8  ; sub_s6:62C8
8:1D9F  8946de               mov word ptr [bp - 0x22], ax
8:1DA2  8956e0               mov word ptr [bp - 0x20], dx
8:1DA5  c746fa0100           mov word ptr [bp - 6], 1
8:1DAA  c45e0e               les bx, ptr [bp + 0xe]
8:1DAD  66268b4722           mov eax, dword ptr es:[bx + 0x22]
8:1DB2  668946da             mov dword ptr [bp - 0x26], eax
8:1DB6  6650                 push eax
8:1DB8  8d46d2               lea ax, [bp - 0x2e]
8:1DBB  16                   push ss
8:1DBC  50                   push ax
8:1DBD  9a8457ca1d           lcall 0x1dca, 0x5784  ; ListIter::ListIter@s2:5784
loc_1DC2:
8:1DC2  8d46d2               lea ax, [bp - 0x2e]
8:1DC5  16                   push ss
8:1DC6  50                   push ax
8:1DC7  9a125b361f           lcall 0x1f36, 0x5b12  ; ListIter::next@s2:5B12
8:1DCC  8946ce               mov word ptr [bp - 0x32], ax
8:1DCF  8956d0               mov word ptr [bp - 0x30], dx
8:1DD2  0bd0                 or dx, ax
8:1DD4  7471                 je 0x1e47
8:1DD6  c45ece               les bx, ptr [bp - 0x32]
8:1DD9  268b4704             mov ax, word ptr es:[bx + 4]
8:1DDD  8946c6               mov word ptr [bp - 0x3a], ax
8:1DE0  268b4706             mov ax, word ptr es:[bx + 6]
8:1DE4  8946c4               mov word ptr [bp - 0x3c], ax
8:1DE7  268b4f08             mov cx, word ptr es:[bx + 8]
8:1DEB  894ec2               mov word ptr [bp - 0x3e], cx
8:1DEE  268b4f0c             mov cx, word ptr es:[bx + 0xc]
8:1DF2  894ec0               mov word ptr [bp - 0x40], cx
8:1DF5  268b570a             mov dx, word ptr es:[bx + 0xa]
8:1DF9  8956be               mov word ptr [bp - 0x42], dx
8:1DFC  8bd8                 mov bx, ax
8:1DFE  8bc1                 mov ax, cx
8:1E00  8bca                 mov cx, dx
8:1E02  2bd2                 sub dx, dx
8:1E04  f7f1                 div cx
8:1E06  8946bc               mov word ptr [bp - 0x44], ax
8:1E09  c746ba0000           mov word ptr [bp - 0x46], 0
8:1E0E  8bc3                 mov ax, bx
8:1E10  48                   dec ax
8:1E11  7c11                 jl 0x1e24
8:1E13  700f                 jo 0x1e24
8:1E15  2d0400               sub ax, 4
8:1E18  7e05                 jle 0x1e1f
8:1E1A  2d0300               sub ax, 3
8:1E1D  7505                 jne 0x1e24
loc_1E1F:
8:1E1F  c746ba0100           mov word ptr [bp - 0x46], 1
loc_1E24:
8:1E24  837eba00             cmp word ptr [bp - 0x46], 0
8:1E28  7498                 je 0x1dc2
8:1E2A  668b46de             mov eax, dword ptr [bp - 0x22]
8:1E2E  8b56e0               mov dx, word ptr [bp - 0x20]
8:1E31  663b46fc             cmp eax, dword ptr [bp - 4]
8:1E35  7606                 jbe 0x1e3d
8:1E37  8b46fc               mov ax, word ptr [bp - 4]
8:1E3A  8b56fe               mov dx, word ptr [bp - 2]
loc_1E3D:
8:1E3D  8946b6               mov word ptr [bp - 0x4a], ax
8:1E40  8956b8               mov word ptr [bp - 0x48], dx
8:1E43  0bd0                 or dx, ax
8:1E45  7577                 jne 0x1ebe
loc_1E47:
8:1E47  66ff46f2             inc dword ptr [bp - 0xe]
loc_1E4B:
8:1E4B  668b46f6             mov eax, dword ptr [bp - 0xa]
8:1E4F  663946f2             cmp dword ptr [bp - 0xe], eax
8:1E53  0f834b01             jae 0x1fa2
8:1E57  66ff76f2             push dword ptr [bp - 0xe]
8:1E5B  c45e0a               les bx, ptr [bp + 0xa]
8:1E5E  06                   push es
8:1E5F  53                   push bx
8:1E60  26c41f               les bx, ptr es:[bx]
8:1E63  26ff5f04             lcall es:[bx + 4]
8:1E67  8946ee               mov word ptr [bp - 0x12], ax
8:1E6A  8956f0               mov word ptr [bp - 0x10], dx
8:1E6D  0bd0                 or dx, ax
8:1E6F  74d6                 je 0x1e47
8:1E71  ff76f0               push word ptr [bp - 0x10]
8:1E74  50                   push ax
8:1E75  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:1E7A  9aece19d1f           lcall 0x1f9d, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:1E7F  8946ea               mov word ptr [bp - 0x16], ax
8:1E82  8956ec               mov word ptr [bp - 0x14], dx
8:1E85  52                   push dx
8:1E86  50                   push ax
8:1E87  9aa873d41c           lcall 0x1cd4, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:1E8C  8946e6               mov word ptr [bp - 0x1a], ax
8:1E8F  8956e8               mov word ptr [bp - 0x18], dx
8:1E92  8d46e2               lea ax, [bp - 0x1e]
8:1E95  16                   push ss
8:1E96  50                   push ax
8:1E97  c45ee6               les bx, ptr [bp - 0x1a]
8:1E9A  06                   push es
8:1E9B  53                   push bx
8:1E9C  26c41f               les bx, ptr es:[bx]
8:1E9F  26ff5f40             lcall es:[bx + 0x40]
8:1EA3  0bc0                 or ax, ax
8:1EA5  0f84edfe             je 0x1d96
8:1EA9  66ff76f2             push dword ptr [bp - 0xe]
8:1EAD  666a00               push 0
8:1EB0  c45e0a               les bx, ptr [bp + 0xa]
8:1EB3  06                   push es
8:1EB4  53                   push bx
8:1EB5  26c41f               les bx, ptr es:[bx]
8:1EB8  26ff5f08             lcall es:[bx + 8]
8:1EBC  eb89                 jmp 0x1e47
loc_1EBE:
8:1EBE  6a00                 push 0
8:1EC0  ff76bc               push word ptr [bp - 0x44]
8:1EC3  ff76b8               push word ptr [bp - 0x48]
8:1EC6  50                   push ax
8:1EC7  6658                 pop eax
8:1EC9  6659                 pop ecx
8:1ECB  6633d2               xor edx, edx
8:1ECE  66f7f1               div ecx
8:1ED1  668bd0               mov edx, eax
8:1ED4  66c1ea10             shr edx, 0x10
8:1ED8  8946b4               mov word ptr [bp - 0x4c], ax
8:1EDB  3b46be               cmp ax, word ptr [bp - 0x42]
8:1EDE  7220                 jb 0x1f00
8:1EE0  66ff76ce             push dword ptr [bp - 0x32]
8:1EE4  c45eda               les bx, ptr [bp - 0x26]
8:1EE7  06                   push es
8:1EE8  53                   push bx
8:1EE9  26c41f               les bx, ptr es:[bx]
8:1EEC  26ff5f0c             lcall es:[bx + 0xc]
8:1EF0  66c746d600000000     mov dword ptr [bp - 0x2a], 0
8:1EF8  8b46be               mov ax, word ptr [bp - 0x42]
8:1EFB  8946b4               mov word ptr [bp - 0x4c], ax
8:1EFE  eb11                 jmp 0x1f11
loc_1F00:
8:1F00  8b46b6               mov ax, word ptr [bp - 0x4a]
8:1F03  c45ece               les bx, ptr [bp - 0x32]
8:1F06  2629470c             sub word ptr es:[bx + 0xc], ax
8:1F0A  8b46b4               mov ax, word ptr [bp - 0x4c]
8:1F0D  2629470a             sub word ptr es:[bx + 0xa], ax
loc_1F11:
8:1F11  66a1a268             mov eax, dword ptr [0x68a2]
8:1F15  668946a0             mov dword ptr [bp - 0x60], eax
8:1F19  6650                 push eax
8:1F1B  9afc07211c           lcall 0x1c21, 0x7fc  ; sub_s1:07FC
8:1F20  8946a8               mov word ptr [bp - 0x58], ax
8:1F23  8956aa               mov word ptr [bp - 0x56], dx
8:1F26  0bd0                 or dx, ax
8:1F28  743c                 je 0x1f66
8:1F2A  c45ea8               les bx, ptr [bp - 0x58]
8:1F2D  26c7079a38           mov word ptr es:[bx], 0x389a
8:1F32  26c74702f11c         mov word ptr es:[bx + 2], 0x1cf1  ; SEGMENT s2:0000
8:1F38  33c0                 xor ax, ax
8:1F3A  c45ea8               les bx, ptr [bp - 0x58]
8:1F3D  26894704             mov word ptr es:[bx + 4], ax
8:1F41  26894706             mov word ptr es:[bx + 6], ax
8:1F45  26894708             mov word ptr es:[bx + 8], ax
8:1F49  2689470a             mov word ptr es:[bx + 0xa], ax
8:1F4D  2689470c             mov word ptr es:[bx + 0xc], ax
8:1F51  26c707ce56           mov word ptr es:[bx], 0x56ce
8:1F56  26c747026011         mov word ptr es:[bx + 2], 0x1160  ; SEGMENT s4:0000
8:1F5C  668b46a8             mov eax, dword ptr [bp - 0x58]
8:1F60  668946b0             mov dword ptr [bp - 0x50], eax
8:1F64  eb08                 jmp 0x1f6e
loc_1F66:
8:1F66  66c746b000000000     mov dword ptr [bp - 0x50], 0
loc_1F6E:
8:1F6E  8b46b4               mov ax, word ptr [bp - 0x4c]
8:1F71  c45eb0               les bx, ptr [bp - 0x50]
8:1F74  2689470a             mov word ptr es:[bx + 0xa], ax
8:1F78  f766bc               mul word ptr [bp - 0x44]
8:1F7B  2689470c             mov word ptr es:[bx + 0xc], ax
8:1F7F  8b46c6               mov ax, word ptr [bp - 0x3a]
8:1F82  26894704             mov word ptr es:[bx + 4], ax
8:1F86  8b46c4               mov ax, word ptr [bp - 0x3c]
8:1F89  26894706             mov word ptr es:[bx + 6], ax
8:1F8D  8b46c2               mov ax, word ptr [bp - 0x3e]
8:1F90  26894708             mov word ptr es:[bx + 8], ax
8:1F94  06                   push es
8:1F95  53                   push bx
8:1F96  66ff76e6             push dword ptr [bp - 0x1a]
8:1F9A  9a0864a91c           lcall 0x1ca9, 0x6408  ; sub_s6:6408
8:1F9F  e920fe               jmp 0x1dc2
loc_1FA2:
8:1FA2  8b46fa               mov ax, word ptr [bp - 6]
8:1FA5  c9                   leave
8:1FA6  ca0c00               retf 0xc
8:1FA9  db 00 c8 14 00 00 c4 5e 0e 06 53 26 c4 1f 26 ff 5f
8:1FB9  db 10 89 46 fc 89 56 fe 66 c7 46 f8 00 00 00 00 eb
8:1FC9  db 04 66 ff 46 f8 66 8b 46 fc 66 39 46 f8 73 3a 66
8:1FD9  db ff 76 f8 c4 5e 0e 06 53 26 c4 1f 26 ff 5f 04 52
8:1FE9  db 50 66 ff 36 e2 65 9a ec e1 9d 1d 52 50 9a a8 73
8:1FF9  db 8a 1e 52 50 66 ff 76 0a 66 ff 76 06 90 0e e8 5e
8:2009  db fd 0b c0 75 bc c9 ca 0c 00 b8 01 00 c9 ca 0c 00
8:2019  db 00

; ---------------- sub_s8:201A FAR size=748 callers=1
8:201A  c8320000             enter 0x32, 0
8:201E  57                   push di
8:201F  56                   push si
8:2020  66ff760a             push dword ptr [bp + 0xa]
8:2024  9a166b2721           lcall 0x2127, 0x6b16  ; sub_s7:6B16
8:2029  8946fc               mov word ptr [bp - 4], ax
8:202C  8956fe               mov word ptr [bp - 2], dx
8:202F  0bd0                 or dx, ax
8:2031  7509                 jne 0x203c
8:2033  33c0                 xor ax, ax
8:2035  5e                   pop si
8:2036  5f                   pop di
8:2037  c9                   leave
8:2038  ca0800               retf 8
8:203B  db 90
loc_203C:
8:203C  c45e0a               les bx, ptr [bp + 0xa]
8:203F  268b4734             mov ax, word ptr es:[bx + 0x34]
8:2043  8946fa               mov word ptr [bp - 6], ax
8:2046  b86400               mov ax, 0x64
8:2049  f76efa               imul word ptr [bp - 6]
8:204C  8946f4               mov word ptr [bp - 0xc], ax
8:204F  8956f6               mov word ptr [bp - 0xa], dx
8:2052  33c9                 xor cx, cx
8:2054  894ef8               mov word ptr [bp - 8], cx
8:2057  894ef2               mov word ptr [bp - 0xe], cx
8:205A  2bdb                 sub bx, bx
8:205C  895ef0               mov word ptr [bp - 0x10], bx
8:205F  895eee               mov word ptr [bp - 0x12], bx
8:2062  c45efc               les bx, ptr [bp - 4]
8:2065  26394f04             cmp word ptr es:[bx + 4], cx
8:2069  0f84e300             je 0x2150
8:206D  268b770a             mov si, word ptr es:[bx + 0xa]
8:2071  2bff                 sub di, di
8:2073  3bfa                 cmp di, dx
8:2075  7c0a                 jl 0x2081
8:2077  7f04                 jg 0x207d
8:2079  3bf0                 cmp si, ax
8:207B  7604                 jbe 0x2081
loc_207D:
8:207D  8bfa                 mov di, dx
8:207F  8bf0                 mov si, ax
loc_2081:
8:2081  8976ea               mov word ptr [bp - 0x16], si
8:2084  897eec               mov word ptr [bp - 0x14], di
8:2087  2629770a             sub word ptr es:[bx + 0xa], si
8:208B  51                   push cx
8:208C  6a64                 push 0x64
8:208E  668b46ea             mov eax, dword ptr [bp - 0x16]
8:2092  6659                 pop ecx
8:2094  6699                 cdq
8:2096  66f7f9               idiv ecx
8:2099  668bd0               mov edx, eax
8:209C  66c1ea10             shr edx, 0x10
8:20A0  8946f8               mov word ptr [bp - 8], ax
8:20A3  8bf0                 mov si, ax
8:20A5  668b46ea             mov eax, dword ptr [bp - 0x16]
8:20A9  66b964000000         mov ecx, 0x64
8:20AF  6699                 cdq
8:20B1  66f7f9               idiv ecx
8:20B4  668bc2               mov eax, edx
8:20B7  660bc0               or eax, eax
8:20BA  7406                 je 0x20c2
8:20BC  8d4401               lea ax, [si + 1]
8:20BF  8946f8               mov word ptr [bp - 8], ax
loc_20C2:
8:20C2  6a2a                 push 0x2a
8:20C4  9a9c17f021           lcall 0x21f0, 0x179c  ; operator_new@s1:179C
8:20C9  83c402               add sp, 2
8:20CC  8956e8               mov word ptr [bp - 0x18], dx
8:20CF  0bd0                 or dx, ax
8:20D1  7427                 je 0x20fa
8:20D3  c45e0a               les bx, ptr [bp + 0xa]
8:20D6  6626ff7704           push dword ptr es:[bx + 4]
8:20DB  ff76f8               push word ptr [bp - 8]
8:20DE  c45efc               les bx, ptr [bp - 4]
8:20E1  26ff7704             push word ptr es:[bx + 4]
8:20E5  66ff76ea             push dword ptr [bp - 0x16]
8:20E9  ff76e8               push word ptr [bp - 0x18]
8:20EC  50                   push ax
8:20ED  90                   nop
8:20EE  0e                   push cs
8:20EF  e89e44               call 0x6590  ; sub_s8:6590
loc_20F2:
8:20F2  8946ee               mov word ptr [bp - 0x12], ax
8:20F5  8956f0               mov word ptr [bp - 0x10], dx
8:20F8  eb08                 jmp 0x2102
loc_20FA:
8:20FA  66c746ee00000000     mov dword ptr [bp - 0x12], 0
loc_2102:
8:2102  66837eee00           cmp dword ptr [bp - 0x12], 0
8:2107  7425                 je 0x212e
8:2109  66ff76ee             push dword ptr [bp - 0x12]
8:210D  66ff36645a           push dword ptr [0x5a64]
8:2112  90                   nop
8:2113  0e                   push cs
8:2114  e84359               call 0x7a5a  ; sub_s8:7A5A
8:2117  8b46f8               mov ax, word ptr [bp - 8]
8:211A  2946fa               sub word ptr [bp - 6], ax
8:211D  ff76fa               push word ptr [bp - 6]
8:2120  66ff760a             push dword ptr [bp + 0xa]
8:2124  9a4c6cfb22           lcall 0x22fb, 0x6c4c  ; sub_s7:6C4C
8:2129  c746f20100           mov word ptr [bp - 0xe], 1
loc_212E:
8:212E  c45efc               les bx, ptr [bp - 4]
8:2131  26837f0a00           cmp word ptr es:[bx + 0xa], 0
8:2136  0f85b601             jne 0x22f0
8:213A  8cc0                 mov ax, es
8:213C  0bc3                 or ax, bx
8:213E  0f84bb01             je 0x22fd
8:2142  6a01                 push 1
8:2144  06                   push es
8:2145  53                   push bx
8:2146  26c41f               les bx, ptr es:[bx]
8:2149  26ff1f               lcall es:[bx]
8:214C  e9ae01               jmp 0x22fd
8:214F  db 90
loc_2150:
8:2150  26394f06             cmp word ptr es:[bx + 6], cx
8:2154  0f84c800             je 0x2220
8:2158  26ff7706             push word ptr es:[bx + 6]
8:215C  9ab4c32f22           lcall 0x222f, 0xc3b4  ; sub_s5:C3B4
8:2161  83c402               add sp, 2
8:2164  8946de               mov word ptr [bp - 0x22], ax
8:2167  c746e00000           mov word ptr [bp - 0x20], 0
8:216C  ff76e0               push word ptr [bp - 0x20]
8:216F  50                   push ax
8:2170  c45efc               les bx, ptr [bp - 4]
8:2173  6a00                 push 0
8:2175  26ff770a             push word ptr es:[bx + 0xa]
8:2179  6658                 pop eax
8:217B  6659                 pop ecx
8:217D  66f7e9               imul ecx
8:2180  668bd0               mov edx, eax
8:2183  66c1ea10             shr edx, 0x10
8:2187  663b46f4             cmp eax, dword ptr [bp - 0xc]
8:218B  7e06                 jle 0x2193
8:218D  8b46f4               mov ax, word ptr [bp - 0xc]
8:2190  8b56f6               mov dx, word ptr [bp - 0xa]
loc_2193:
8:2193  8946ea               mov word ptr [bp - 0x16], ax
8:2196  8956ec               mov word ptr [bp - 0x14], dx
8:2199  66ff76de             push dword ptr [bp - 0x22]
8:219D  52                   push dx
8:219E  50                   push ax
8:219F  6658                 pop eax
8:21A1  6659                 pop ecx
8:21A3  6699                 cdq
8:21A5  66f7f9               idiv ecx
8:21A8  668946da             mov dword ptr [bp - 0x26], eax
8:21AC  c45efc               les bx, ptr [bp - 4]
8:21AF  2629470a             sub word ptr es:[bx + 0xa], ax
8:21B3  66b964000000         mov ecx, 0x64
8:21B9  668b46ea             mov eax, dword ptr [bp - 0x16]
8:21BD  6699                 cdq
8:21BF  66f7f9               idiv ecx
8:21C2  668bd0               mov edx, eax
8:21C5  66c1ea10             shr edx, 0x10
8:21C9  8946f8               mov word ptr [bp - 8], ax
8:21CC  8bf0                 mov si, ax
8:21CE  668b46ea             mov eax, dword ptr [bp - 0x16]
8:21D2  66b964000000         mov ecx, 0x64
8:21D8  6699                 cdq
8:21DA  66f7f9               idiv ecx
8:21DD  668bc2               mov eax, edx
8:21E0  660bc0               or eax, eax
8:21E3  7406                 je 0x21eb
8:21E5  8d4401               lea ax, [si + 1]
8:21E8  8946f8               mov word ptr [bp - 8], ax
loc_21EB:
8:21EB  6a2a                 push 0x2a
8:21ED  9a9c17c022           lcall 0x22c0, 0x179c  ; operator_new@s1:179C
8:21F2  83c402               add sp, 2
8:21F5  8956e8               mov word ptr [bp - 0x18], dx
8:21F8  0bd0                 or dx, ax
8:21FA  0f84fcfe             je 0x20fa
8:21FE  c45e0a               les bx, ptr [bp + 0xa]
8:2201  6626ff7704           push dword ptr es:[bx + 4]
8:2206  ff76f8               push word ptr [bp - 8]
8:2209  c45efc               les bx, ptr [bp - 4]
8:220C  26ff7706             push word ptr es:[bx + 6]
8:2210  66ff76da             push dword ptr [bp - 0x26]
8:2214  ff76e8               push word ptr [bp - 0x18]
8:2217  50                   push ax
8:2218  90                   nop
8:2219  0e                   push cs
8:221A  e83f45               call 0x675c  ; sub_s8:675C
8:221D  e9d2fe               jmp 0x20f2
loc_2220:
8:2220  26394f08             cmp word ptr es:[bx + 8], cx
8:2224  0f84dafe             je 0x2102
8:2228  26ff7708             push word ptr es:[bx + 8]
8:222C  9a2ec4b01b           lcall 0x1bb0, 0xc42e  ; sub_s5:C42E
8:2231  83c402               add sp, 2
8:2234  8946d2               mov word ptr [bp - 0x2e], ax
8:2237  c746d40000           mov word ptr [bp - 0x2c], 0
8:223C  ff76d4               push word ptr [bp - 0x2c]
8:223F  50                   push ax
8:2240  c45efc               les bx, ptr [bp - 4]
8:2243  6a00                 push 0
8:2245  26ff770a             push word ptr es:[bx + 0xa]
8:2249  6658                 pop eax
8:224B  6659                 pop ecx
8:224D  66f7e9               imul ecx
8:2250  668bd0               mov edx, eax
8:2253  66c1ea10             shr edx, 0x10
8:2257  663b46f4             cmp eax, dword ptr [bp - 0xc]
8:225B  7e06                 jle 0x2263
8:225D  8b46f4               mov ax, word ptr [bp - 0xc]
8:2260  8b56f6               mov dx, word ptr [bp - 0xa]
loc_2263:
8:2263  8946da               mov word ptr [bp - 0x26], ax
8:2266  8956dc               mov word ptr [bp - 0x24], dx
8:2269  66ff76d2             push dword ptr [bp - 0x2e]
8:226D  52                   push dx
8:226E  50                   push ax
8:226F  6658                 pop eax
8:2271  6659                 pop ecx
8:2273  6699                 cdq
8:2275  66f7f9               idiv ecx
8:2278  668946de             mov dword ptr [bp - 0x22], eax
8:227C  c45efc               les bx, ptr [bp - 4]
8:227F  2629470a             sub word ptr es:[bx + 0xa], ax
8:2283  66b964000000         mov ecx, 0x64
8:2289  668b46da             mov eax, dword ptr [bp - 0x26]
8:228D  6699                 cdq
8:228F  66f7f9               idiv ecx
8:2292  668bd0               mov edx, eax
8:2295  66c1ea10             shr edx, 0x10
8:2299  8946f8               mov word ptr [bp - 8], ax
8:229C  8bf0                 mov si, ax
8:229E  668b46da             mov eax, dword ptr [bp - 0x26]
8:22A2  66b964000000         mov ecx, 0x64
8:22A8  6699                 cdq
8:22AA  66f7f9               idiv ecx
8:22AD  668bc2               mov eax, edx
8:22B0  660bc0               or eax, eax
8:22B3  7406                 je 0x22bb
8:22B5  8d4401               lea ax, [si + 1]
8:22B8  8946f8               mov word ptr [bp - 8], ax
loc_22BB:
8:22BB  6a2a                 push 0x2a
8:22BD  9a9c171e1f           lcall 0x1f1e, 0x179c  ; operator_new@s1:179C
8:22C2  83c402               add sp, 2
8:22C5  8956e8               mov word ptr [bp - 0x18], dx
8:22C8  0bd0                 or dx, ax
8:22CA  0f842cfe             je 0x20fa
8:22CE  c45e0a               les bx, ptr [bp + 0xa]
8:22D1  6626ff7704           push dword ptr es:[bx + 4]
8:22D6  ff76f8               push word ptr [bp - 8]
8:22D9  c45efc               les bx, ptr [bp - 4]
8:22DC  26ff7708             push word ptr es:[bx + 8]
8:22E0  66ff76de             push dword ptr [bp - 0x22]
8:22E4  ff76e8               push word ptr [bp - 0x18]
8:22E7  50                   push ax
8:22E8  90                   nop
8:22E9  0e                   push cs
8:22EA  e84b45               call 0x6838  ; sub_s8:6838
8:22ED  e902fe               jmp 0x20f2
loc_22F0:
8:22F0  06                   push es
8:22F1  53                   push bx
8:22F2  6a00                 push 0
8:22F4  66ff760a             push dword ptr [bp + 0xa]
8:22F8  9a666cf91f           lcall 0x1ff9, 0x6c66  ; sub_s7:6C66
loc_22FD:
8:22FD  8b46f2               mov ax, word ptr [bp - 0xe]
8:2300  5e                   pop si
8:2301  5f                   pop di
8:2302  c9                   leave
8:2303  ca0800               retf 8

; ---------------- sub_s8:2306 FAR size=482 callers=1
8:2306  c8380000             enter 0x38, 0
8:230A  66ff760a             push dword ptr [bp + 0xa]
8:230E  9aa873e224           lcall 0x24e2, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:2313  8946fc               mov word ptr [bp - 4], ax
8:2316  8956fe               mov word ptr [bp - 2], dx
8:2319  c45e0a               les bx, ptr [bp + 0xa]
8:231C  268b4734             mov ax, word ptr es:[bx + 0x34]
8:2320  8946fa               mov word ptr [bp - 6], ax
8:2323  66c746f664000000     mov dword ptr [bp - 0xa], 0x64
8:232B  c45efc               les bx, ptr [bp - 4]
8:232E  66268b4722           mov eax, dword ptr es:[bx + 0x22]
8:2333  668946f2             mov dword ptr [bp - 0xe], eax
loc_2337:
8:2337  c45ef2               les bx, ptr [bp - 0xe]
8:233A  06                   push es
8:233B  53                   push bx
8:233C  26c41f               les bx, ptr es:[bx]
8:233F  26ff5f10             lcall es:[bx + 0x10]
8:2343  8946ee               mov word ptr [bp - 0x12], ax
8:2346  8956f0               mov word ptr [bp - 0x10], dx
8:2349  0bd0                 or dx, ax
8:234B  0f848901             je 0x24d8
8:234F  c45eee               les bx, ptr [bp - 0x12]
8:2352  26837f0a00           cmp word ptr es:[bx + 0xa], 0
8:2357  0f846101             je 0x24bc
8:235B  662bc0               sub eax, eax
8:235E  668946ea             mov dword ptr [bp - 0x16], eax
8:2362  8946e4               mov word ptr [bp - 0x1c], ax
8:2365  26394706             cmp word ptr es:[bx + 6], ax
8:2369  740b                 je 0x2376
8:236B  26ff7706             push word ptr es:[bx + 6]
8:236F  9ab4c38323           lcall 0x2383, 0xc3b4  ; sub_s5:C3B4
8:2374  eb0f                 jmp 0x2385
loc_2376:
8:2376  26394708             cmp word ptr es:[bx + 8], ax
8:237A  7421                 je 0x239d
8:237C  26ff7708             push word ptr es:[bx + 8]
8:2380  9a2ec45f21           lcall 0x215f, 0xc42e  ; sub_s5:C42E
loc_2385:
8:2385  83c402               add sp, 2
8:2388  8946e4               mov word ptr [bp - 0x1c], ax
8:238B  c45eee               les bx, ptr [bp - 0x12]
8:238E  268b470a             mov ax, word ptr es:[bx + 0xa]
8:2392  f766e4               mul word ptr [bp - 0x1c]
8:2395  8946ea               mov word ptr [bp - 0x16], ax
8:2398  c746ec0000           mov word ptr [bp - 0x14], 0
loc_239D:
8:239D  668b46ea             mov eax, dword ptr [bp - 0x16]
8:23A1  8b56ec               mov dx, word ptr [bp - 0x14]
8:23A4  663b46f6             cmp eax, dword ptr [bp - 0xa]
8:23A8  7606                 jbe 0x23b0
8:23AA  8b46f6               mov ax, word ptr [bp - 0xa]
8:23AD  8b56f8               mov dx, word ptr [bp - 8]
loc_23B0:
8:23B0  8946e0               mov word ptr [bp - 0x20], ax
8:23B3  8956e2               mov word ptr [bp - 0x1e], dx
8:23B6  6a00                 push 0
8:23B8  ff76e4               push word ptr [bp - 0x1c]
8:23BB  52                   push dx
8:23BC  50                   push ax
8:23BD  6658                 pop eax
8:23BF  6659                 pop ecx
8:23C1  6633d2               xor edx, edx
8:23C4  66f7f1               div ecx
8:23C7  668946dc             mov dword ptr [bp - 0x24], eax
8:23CB  c45eee               les bx, ptr [bp - 0x12]
8:23CE  2629470a             sub word ptr es:[bx + 0xa], ax
8:23D2  745a                 je 0x242e
8:23D4  06                   push es
8:23D5  53                   push bx
8:23D6  c45ef2               les bx, ptr [bp - 0xe]
8:23D9  06                   push es
8:23DA  53                   push bx
8:23DB  26c41f               les bx, ptr es:[bx]
8:23DE  26ff5f08             lcall es:[bx + 8]
loc_23E2:
8:23E2  668b46e0             mov eax, dword ptr [bp - 0x20]
8:23E6  662946f6             sub dword ptr [bp - 0xa], eax
8:23EA  662bc0               sub eax, eax
8:23ED  668946d8             mov dword ptr [bp - 0x28], eax
8:23F1  c45eee               les bx, ptr [bp - 0x12]
8:23F4  26394706             cmp word ptr es:[bx + 6], ax
8:23F8  0f848200             je 0x247e
8:23FC  6a2a                 push 0x2a
8:23FE  9a9c178924           lcall 0x2489, 0x179c  ; operator_new@s1:179C
8:2403  83c402               add sp, 2
8:2406  8956d2               mov word ptr [bp - 0x2e], dx
8:2409  0bd0                 or dx, ax
8:240B  7441                 je 0x244e
8:240D  c45e0a               les bx, ptr [bp + 0xa]
8:2410  6626ff7704           push dword ptr es:[bx + 4]
8:2415  6a01                 push 1
8:2417  c45eee               les bx, ptr [bp - 0x12]
8:241A  26ff7706             push word ptr es:[bx + 6]
8:241E  66ff76dc             push dword ptr [bp - 0x24]
8:2422  ff76d2               push word ptr [bp - 0x2e]
8:2425  50                   push ax
8:2426  90                   nop
8:2427  0e                   push cs
8:2428  e83143               call 0x675c  ; sub_s8:675C
8:242B  e98500               jmp 0x24b3
loc_242E:
8:242E  8b46ee               mov ax, word ptr [bp - 0x12]
8:2431  8b56f0               mov dx, word ptr [bp - 0x10]
8:2434  8956d2               mov word ptr [bp - 0x2e], dx
8:2437  8956d6               mov word ptr [bp - 0x2a], dx
8:243A  0bd0                 or dx, ax
8:243C  74a4                 je 0x23e2
8:243E  6a01                 push 1
8:2440  c45eee               les bx, ptr [bp - 0x12]
8:2443  06                   push es
8:2444  50                   push ax
8:2445  26c41f               les bx, ptr es:[bx]
8:2448  26ff1f               lcall es:[bx]
8:244B  eb95                 jmp 0x23e2
8:244D  db 90
loc_244E:
8:244E  66c746d800000000     mov dword ptr [bp - 0x28], 0
loc_2456:
8:2456  66837ed800           cmp dword ptr [bp - 0x28], 0
8:245B  0f84d8fe             je 0x2337
8:245F  66ff76d8             push dword ptr [bp - 0x28]
8:2463  66ff36645a           push dword ptr [0x5a64]
8:2468  90                   nop
8:2469  0e                   push cs
8:246A  e8ed55               call 0x7a5a  ; sub_s8:7A5A
8:246D  ff4efa               dec word ptr [bp - 6]
8:2470  7466                 je 0x24d8
8:2472  66c746f664000000     mov dword ptr [bp - 0xa], 0x64
8:247A  e9bafe               jmp 0x2337
8:247D  db 90
loc_247E:
8:247E  26394708             cmp word ptr es:[bx + 8], ax
8:2482  74d2                 je 0x2456
8:2484  6a2a                 push 0x2a
8:2486  9a9c17c720           lcall 0x20c7, 0x179c  ; operator_new@s1:179C
8:248B  83c402               add sp, 2
8:248E  8956d6               mov word ptr [bp - 0x2a], dx
8:2491  0bd0                 or dx, ax
8:2493  74b9                 je 0x244e
8:2495  c45e0a               les bx, ptr [bp + 0xa]
8:2498  6626ff7704           push dword ptr es:[bx + 4]
8:249D  6a01                 push 1
8:249F  c45eee               les bx, ptr [bp - 0x12]
8:24A2  26ff7708             push word ptr es:[bx + 8]
8:24A6  66ff76dc             push dword ptr [bp - 0x24]
8:24AA  ff76d6               push word ptr [bp - 0x2a]
8:24AD  50                   push ax
8:24AE  90                   nop
8:24AF  0e                   push cs
8:24B0  e88543               call 0x6838  ; sub_s8:6838
loc_24B3:
8:24B3  8946d8               mov word ptr [bp - 0x28], ax
8:24B6  8956da               mov word ptr [bp - 0x26], dx
8:24B9  eb9b                 jmp 0x2456
8:24BB  db 90
loc_24BC:
8:24BC  8cc2                 mov dx, es
8:24BE  8c46d6               mov word ptr [bp - 0x2a], es
8:24C1  8c46d2               mov word ptr [bp - 0x2e], es
8:24C4  0bd0                 or dx, ax
8:24C6  0f846dfe             je 0x2337
8:24CA  6a01                 push 1
8:24CC  06                   push es
8:24CD  50                   push ax
8:24CE  26c41f               les bx, ptr es:[bx]
8:24D1  26ff1f               lcall es:[bx]
8:24D4  e960fe               jmp 0x2337
8:24D7  db 90
loc_24D8:
8:24D8  ff76fa               push word ptr [bp - 6]
8:24DB  66ff760a             push dword ptr [bp + 0xa]
8:24DF  9a4c6c2720           lcall 0x2027, 0x6c4c  ; sub_s7:6C4C
8:24E4  c9                   leave
8:24E5  ca0800               retf 8

; ---------------- sub_s8:24E8 FAR size=518 callers=1
8:24E8  c83c0000             enter 0x3c, 0
8:24EC  66ff760a             push dword ptr [bp + 0xa]
8:24F0  9aa873e726           lcall 0x26e7, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:24F5  8946fc               mov word ptr [bp - 4], ax
8:24F8  8956fe               mov word ptr [bp - 2], dx
8:24FB  c45e0a               les bx, ptr [bp + 0xa]
8:24FE  268b4734             mov ax, word ptr es:[bx + 0x34]
8:2502  8946fa               mov word ptr [bp - 6], ax
8:2505  c45efc               les bx, ptr [bp - 4]
8:2508  66268b4728           mov eax, dword ptr es:[bx + 0x28]
8:250D  668946f6             mov dword ptr [bp - 0xa], eax
8:2511  66c746f264000000     mov dword ptr [bp - 0xe], 0x64
8:2519  c45ef6               les bx, ptr [bp - 0xa]
8:251C  268b4704             mov ax, word ptr es:[bx + 4]
8:2520  8946f0               mov word ptr [bp - 0x10], ax
8:2523  6a0a                 push 0xa
8:2525  9a9c177225           lcall 0x2572, 0x179c  ; operator_new@s1:179C
8:252A  83c402               add sp, 2
8:252D  8946d4               mov word ptr [bp - 0x2c], ax
8:2530  8956d6               mov word ptr [bp - 0x2a], dx
8:2533  0bd0                 or dx, ax
8:2535  7411                 je 0x2548
8:2537  666805000500         push 0x50005
8:253D  ff76d6               push word ptr [bp - 0x2a]
8:2540  50                   push ax
8:2541  9a3eba8e25           lcall 0x258e, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
8:2546  eb03                 jmp 0x254b
loc_2548:
8:2548  33c0                 xor ax, ax
8:254A  99                   cdq
loc_254B:
8:254B  8946e6               mov word ptr [bp - 0x1a], ax
8:254E  8956e8               mov word ptr [bp - 0x18], dx
8:2551  c746e40000           mov word ptr [bp - 0x1c], 0
8:2556  eb55                 jmp 0x25ad
loc_2558:
8:2558  662bc0               sub eax, eax
8:255B  668946d0             mov dword ptr [bp - 0x30], eax
loc_255F:
8:255F  ff76d2               push word ptr [bp - 0x2e]
8:2562  50                   push ax
8:2563  66ff36645a           push dword ptr [0x5a64]
8:2568  90                   nop
8:2569  0e                   push cs
8:256A  e8ed54               call 0x7a5a  ; sub_s8:7A5A
8:256D  6a0a                 push 0xa
8:256F  9a9c172726           lcall 0x2627, 0x179c  ; operator_new@s1:179C
8:2574  83c402               add sp, 2
8:2577  8946d4               mov word ptr [bp - 0x2c], ax
8:257A  8956d6               mov word ptr [bp - 0x2a], dx
8:257D  0bd0                 or dx, ax
8:257F  7411                 je 0x2592
8:2581  666805000500         push 0x50005
8:2587  ff76d6               push word ptr [bp - 0x2a]
8:258A  50                   push ax
8:258B  9a3ebacb25           lcall 0x25cb, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
8:2590  eb03                 jmp 0x2595
loc_2592:
8:2592  33c0                 xor ax, ax
8:2594  99                   cdq
loc_2595:
8:2595  8946e6               mov word ptr [bp - 0x1a], ax
8:2598  8956e8               mov word ptr [bp - 0x18], dx
8:259B  ff4efa               dec word ptr [bp - 6]
8:259E  0f84b600             je 0x2658
8:25A2  66c746f264000000     mov dword ptr [bp - 0xe], 0x64
loc_25AA:
8:25AA  ff46e4               inc word ptr [bp - 0x1c]
loc_25AD:
8:25AD  8b46f0               mov ax, word ptr [bp - 0x10]
8:25B0  3946e4               cmp word ptr [bp - 0x1c], ax
8:25B3  0f83a100             jae 0x2658
8:25B7  ff76e4               push word ptr [bp - 0x1c]
8:25BA  8d46ee               lea ax, [bp - 0x12]
8:25BD  16                   push ss
8:25BE  50                   push ax
8:25BF  8d4eea               lea cx, [bp - 0x16]
8:25C2  16                   push ss
8:25C3  51                   push cx
8:25C4  66ff76f6             push dword ptr [bp - 0xa]
8:25C8  9a16bb0126           lcall 0x2601, 0xbb16  ; sub_s5:BB16
8:25CD  66837eea00           cmp dword ptr [bp - 0x16], 0
8:25D2  74d6                 je 0x25aa
8:25D4  ff76ee               push word ptr [bp - 0x12]
8:25D7  668b46ea             mov eax, dword ptr [bp - 0x16]
8:25DB  8b56ec               mov dx, word ptr [bp - 0x14]
8:25DE  663b46f2             cmp eax, dword ptr [bp - 0xe]
8:25E2  7606                 jbe 0x25ea
8:25E4  8b46f2               mov ax, word ptr [bp - 0xe]
8:25E7  8b56f4               mov dx, word ptr [bp - 0xc]
loc_25EA:
8:25EA  8946dc               mov word ptr [bp - 0x24], ax
8:25ED  8956de               mov word ptr [bp - 0x22], dx
8:25F0  2946ea               sub word ptr [bp - 0x16], ax
8:25F3  1956ec               sbb word ptr [bp - 0x14], dx
8:25F6  66ff76ea             push dword ptr [bp - 0x16]
8:25FA  66ff76f6             push dword ptr [bp - 0xa]
8:25FE  9a8abb1126           lcall 0x2611, 0xbb8a  ; SparseTable::set@s5:BB8A
8:2603  ff76ee               push word ptr [bp - 0x12]
8:2606  66ff76dc             push dword ptr [bp - 0x24]
8:260A  66ff76e6             push dword ptr [bp - 0x1a]
8:260E  9a70bb5f26           lcall 0x265f, 0xbb70  ; sub_s5:BB70
8:2613  668b46dc             mov eax, dword ptr [bp - 0x24]
8:2617  662946f2             sub dword ptr [bp - 0xe], eax
8:261B  66837ef200           cmp dword ptr [bp - 0xe], 0
8:2620  7588                 jne 0x25aa
8:2622  6a2a                 push 0x2a
8:2624  9a9c178c26           lcall 0x268c, 0x179c  ; operator_new@s1:179C
8:2629  83c402               add sp, 2
8:262C  8946d4               mov word ptr [bp - 0x2c], ax
8:262F  8956d6               mov word ptr [bp - 0x2a], dx
8:2632  0bd0                 or dx, ax
8:2634  0f8420ff             je 0x2558
8:2638  c45e0a               les bx, ptr [bp + 0xa]
8:263B  6626ff7704           push dword ptr es:[bx + 4]
8:2640  6a01                 push 1
8:2642  66ff76e6             push dword ptr [bp - 0x1a]
8:2646  ff76d6               push word ptr [bp - 0x2a]
8:2649  50                   push ax
8:264A  90                   nop
8:264B  0e                   push cs
8:264C  e81f40               call 0x666e  ; sub_s8:666E
8:264F  8946d0               mov word ptr [bp - 0x30], ax
8:2652  8956d2               mov word ptr [bp - 0x2e], dx
8:2655  e907ff               jmp 0x255f
loc_2658:
8:2658  66ff76e6             push dword ptr [bp - 0x1a]
8:265C  9a94ba8326           lcall 0x2683, 0xba94  ; sub_s5:BA94
8:2661  8946e0               mov word ptr [bp - 0x20], ax
8:2664  8956e2               mov word ptr [bp - 0x1e], dx
8:2667  0bd0                 or dx, ax
8:2669  7529                 jne 0x2694
8:266B  668b46e6             mov eax, dword ptr [bp - 0x1a]
8:266F  668946c4             mov dword ptr [bp - 0x3c], eax
8:2673  668946d4             mov dword ptr [bp - 0x2c], eax
8:2677  660bc0               or eax, eax
8:267A  7461                 je 0x26dd
8:267C  ff76e8               push word ptr [bp - 0x18]
8:267F  50                   push ax
8:2680  9a7eba7223           lcall 0x2372, 0xba7e  ; sub_s5:BA7E
8:2685  66ff76e6             push dword ptr [bp - 0x1a]
8:2689  9ace179926           lcall 0x2699, 0x17ce  ; operator_delete@s1:17CE
8:268E  83c404               add sp, 4
8:2691  eb4a                 jmp 0x26dd
8:2693  db 90
loc_2694:
8:2694  6a2a                 push 0x2a
8:2696  9a9c170124           lcall 0x2401, 0x179c  ; operator_new@s1:179C
8:269B  83c402               add sp, 2
8:269E  8946c4               mov word ptr [bp - 0x3c], ax
8:26A1  8956c6               mov word ptr [bp - 0x3a], dx
8:26A4  0bd0                 or dx, ax
8:26A6  7420                 je 0x26c8
8:26A8  c45e0a               les bx, ptr [bp + 0xa]
8:26AB  6626ff7704           push dword ptr es:[bx + 4]
8:26B0  6a01                 push 1
8:26B2  66ff76e6             push dword ptr [bp - 0x1a]
8:26B6  ff76c6               push word ptr [bp - 0x3a]
8:26B9  50                   push ax
8:26BA  90                   nop
8:26BB  0e                   push cs
8:26BC  e8af3f               call 0x666e  ; sub_s8:666E
8:26BF  8946c8               mov word ptr [bp - 0x38], ax
8:26C2  8956ca               mov word ptr [bp - 0x36], dx
8:26C5  eb08                 jmp 0x26cf
8:26C7  db 90
loc_26C8:
8:26C8  662bc0               sub eax, eax
8:26CB  668946c8             mov dword ptr [bp - 0x38], eax
loc_26CF:
8:26CF  ff76ca               push word ptr [bp - 0x36]
8:26D2  50                   push ax
8:26D3  66ff36645a           push dword ptr [0x5a64]
8:26D8  90                   nop
8:26D9  0e                   push cs
8:26DA  e87d53               call 0x7a5a  ; sub_s8:7A5A
loc_26DD:
8:26DD  ff76fa               push word ptr [bp - 6]
8:26E0  66ff760a             push dword ptr [bp + 0xa]
8:26E4  9a4c6c1123           lcall 0x2311, 0x6c4c  ; sub_s7:6C4C
8:26E9  c9                   leave
8:26EA  ca0800               retf 8
8:26ED  db 00

; ---------------- sub_s8:26EE FAR size=490 callers=1
8:26EE  c8320000             enter 0x32, 0
8:26F2  66ff760a             push dword ptr [bp + 0xa]
8:26F6  9aa8735727           lcall 0x2757, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:26FB  8946fc               mov word ptr [bp - 4], ax
8:26FE  8956fe               mov word ptr [bp - 2], dx
8:2701  c45e0a               les bx, ptr [bp + 0xa]
8:2704  268b4734             mov ax, word ptr es:[bx + 0x34]
8:2708  8946fa               mov word ptr [bp - 6], ax
8:270B  52                   push dx
8:270C  ff76fc               push word ptr [bp - 4]
8:270F  9a800d3d28           lcall 0x283d, 0xd80  ; sub_s6:0D80
8:2714  8946f8               mov word ptr [bp - 8], ax
8:2717  8946f6               mov word ptr [bp - 0xa], ax
8:271A  66c746f264000000     mov dword ptr [bp - 0xe], 0x64
8:2722  6a0a                 push 0xa
8:2724  9a9c17c227           lcall 0x27c2, 0x179c  ; operator_new@s1:179C
8:2729  83c402               add sp, 2
8:272C  8956e4               mov word ptr [bp - 0x1c], dx
8:272F  0bd0                 or dx, ax
8:2731  7411                 je 0x2744
8:2733  666805000500         push 0x50005
8:2739  ff76e4               push word ptr [bp - 0x1c]
8:273C  50                   push ax
8:273D  9a3ebaac27           lcall 0x27ac, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
8:2742  eb03                 jmp 0x2747
loc_2744:
8:2744  33c0                 xor ax, ax
8:2746  99                   cdq
loc_2747:
8:2747  8946ee               mov word ptr [bp - 0x12], ax
8:274A  8956f0               mov word ptr [bp - 0x10], dx
loc_274D:
8:274D  ff76f8               push word ptr [bp - 8]
8:2750  66ff760a             push dword ptr [bp + 0xa]
8:2754  9a287c9c27           lcall 0x279c, 0x7c28  ; sub_s7:7C28
8:2759  8946e6               mov word ptr [bp - 0x1a], ax
8:275C  8956e8               mov word ptr [bp - 0x18], dx
8:275F  0bd0                 or dx, ax
8:2761  0f84d100             je 0x2836
8:2765  ff76f8               push word ptr [bp - 8]
8:2768  8b56e8               mov dx, word ptr [bp - 0x18]
8:276B  3b56f4               cmp dx, word ptr [bp - 0xc]
8:276E  720d                 jb 0x277d
8:2770  7705                 ja 0x2777
8:2772  3b46f2               cmp ax, word ptr [bp - 0xe]
8:2775  7606                 jbe 0x277d
loc_2777:
8:2777  8b46f2               mov ax, word ptr [bp - 0xe]
8:277A  8b56f4               mov dx, word ptr [bp - 0xc]
loc_277D:
8:277D  8946de               mov word ptr [bp - 0x22], ax
8:2780  8956e0               mov word ptr [bp - 0x20], dx
8:2783  8b4ee6               mov cx, word ptr [bp - 0x1a]
8:2786  8b5ee8               mov bx, word ptr [bp - 0x18]
8:2789  2bc8                 sub cx, ax
8:278B  1bda                 sbb bx, dx
8:278D  894ee6               mov word ptr [bp - 0x1a], cx
8:2790  895ee8               mov word ptr [bp - 0x18], bx
8:2793  53                   push bx
8:2794  51                   push cx
8:2795  66ff760a             push dword ptr [bp + 0xa]
8:2799  9a1c7dd128           lcall 0x28d1, 0x7d1c  ; Tile::setBas(value,res)@s7:7D1C
8:279E  ff76f8               push word ptr [bp - 8]
8:27A1  66ff76de             push dword ptr [bp - 0x22]
8:27A5  66ff76ee             push dword ptr [bp - 0x12]
8:27A9  9a70bb1b28           lcall 0x281b, 0xbb70  ; sub_s5:BB70
8:27AE  668b46de             mov eax, dword ptr [bp - 0x22]
8:27B2  662946f2             sub dword ptr [bp - 0xe], eax
8:27B6  66837ef200           cmp dword ptr [bp - 0xe], 0
8:27BB  7579                 jne 0x2836
8:27BD  6a2a                 push 0x2a
8:27BF  9a9c170228           lcall 0x2802, 0x179c  ; operator_new@s1:179C
8:27C4  83c402               add sp, 2
8:27C7  8956e4               mov word ptr [bp - 0x1c], dx
8:27CA  0bd0                 or dx, ax
8:27CC  741c                 je 0x27ea
8:27CE  c45e0a               les bx, ptr [bp + 0xa]
8:27D1  6626ff7704           push dword ptr es:[bx + 4]
8:27D6  6a01                 push 1
8:27D8  66ff76ee             push dword ptr [bp - 0x12]
8:27DC  ff76e4               push word ptr [bp - 0x1c]
8:27DF  50                   push ax
8:27E0  90                   nop
8:27E1  0e                   push cs
8:27E2  e8893e               call 0x666e  ; sub_s8:666E
8:27E5  8956dc               mov word ptr [bp - 0x24], dx
8:27E8  eb05                 jmp 0x27ef
loc_27EA:
8:27EA  2bc0                 sub ax, ax
8:27EC  8946dc               mov word ptr [bp - 0x24], ax
loc_27EF:
8:27EF  ff76dc               push word ptr [bp - 0x24]
8:27F2  50                   push ax
8:27F3  66ff36645a           push dword ptr [0x5a64]
8:27F8  90                   nop
8:27F9  0e                   push cs
8:27FA  e85d52               call 0x7a5a  ; sub_s8:7A5A
8:27FD  6a0a                 push 0xa
8:27FF  9a9c177f28           lcall 0x287f, 0x179c  ; operator_new@s1:179C
8:2804  83c402               add sp, 2
8:2807  8956e4               mov word ptr [bp - 0x1c], dx
8:280A  0bd0                 or dx, ax
8:280C  7412                 je 0x2820
8:280E  666805000500         push 0x50005
8:2814  ff76e4               push word ptr [bp - 0x1c]
8:2817  50                   push ax
8:2818  9a3eba5928           lcall 0x2859, 0xba3e  ; SparseTable::SparseTable@s5:BA3E
8:281D  eb04                 jmp 0x2823
8:281F  db 90
loc_2820:
8:2820  33c0                 xor ax, ax
8:2822  99                   cdq
loc_2823:
8:2823  8946ee               mov word ptr [bp - 0x12], ax
8:2826  8956f0               mov word ptr [bp - 0x10], dx
8:2829  ff4efa               dec word ptr [bp - 6]
8:282C  7424                 je 0x2852
8:282E  66c746f264000000     mov dword ptr [bp - 0xe], 0x64
loc_2836:
8:2836  66ff76fc             push dword ptr [bp - 4]
8:283A  9a800df21f           lcall 0x1ff2, 0xd80  ; sub_s6:0D80
8:283F  8946f8               mov word ptr [bp - 8], ax
8:2842  837ef600             cmp word ptr [bp - 0xa], 0
8:2846  7503                 jne 0x284b
8:2848  8946f6               mov word ptr [bp - 0xa], ax
loc_284B:
8:284B  3946f6               cmp word ptr [bp - 0xa], ax
8:284E  0f85fbfe             jne 0x274d
loc_2852:
8:2852  66ff76ee             push dword ptr [bp - 0x12]
8:2856  9a94ba7628           lcall 0x2876, 0xba94  ; sub_s5:BA94
8:285B  0bd0                 or dx, ax
8:285D  7527                 jne 0x2886
8:285F  8b46ee               mov ax, word ptr [bp - 0x12]
8:2862  8b56f0               mov dx, word ptr [bp - 0x10]
8:2865  8956d0               mov word ptr [bp - 0x30], dx
8:2868  8956e4               mov word ptr [bp - 0x1c], dx
8:286B  0bd0                 or dx, ax
8:286D  7458                 je 0x28c7
8:286F  ff76f0               push word ptr [bp - 0x10]
8:2872  50                   push ax
8:2873  9a7eba4425           lcall 0x2544, 0xba7e  ; sub_s5:BA7E
8:2878  66ff76ee             push dword ptr [bp - 0x12]
8:287C  9ace178b28           lcall 0x288b, 0x17ce  ; operator_delete@s1:17CE
8:2881  83c404               add sp, 4
8:2884  eb41                 jmp 0x28c7
loc_2886:
8:2886  6a2a                 push 0x2a
8:2888  9a9c172825           lcall 0x2528, 0x179c  ; operator_new@s1:179C
8:288D  83c402               add sp, 2
8:2890  8956d0               mov word ptr [bp - 0x30], dx
8:2893  0bd0                 or dx, ax
8:2895  741d                 je 0x28b4
8:2897  c45e0a               les bx, ptr [bp + 0xa]
8:289A  6626ff7704           push dword ptr es:[bx + 4]
8:289F  6a01                 push 1
8:28A1  66ff76ee             push dword ptr [bp - 0x12]
8:28A5  ff76d0               push word ptr [bp - 0x30]
8:28A8  50                   push ax
8:28A9  90                   nop
8:28AA  0e                   push cs
8:28AB  e8c03d               call 0x666e  ; sub_s8:666E
8:28AE  8956d4               mov word ptr [bp - 0x2c], dx
8:28B1  eb06                 jmp 0x28b9
8:28B3  db 90
loc_28B4:
8:28B4  2bc0                 sub ax, ax
8:28B6  8946d4               mov word ptr [bp - 0x2c], ax
loc_28B9:
8:28B9  ff76d4               push word ptr [bp - 0x2c]
8:28BC  50                   push ax
8:28BD  66ff36645a           push dword ptr [0x5a64]
8:28C2  90                   nop
8:28C3  0e                   push cs
8:28C4  e89351               call 0x7a5a  ; sub_s8:7A5A
loc_28C7:
8:28C7  ff76fa               push word ptr [bp - 6]
8:28CA  66ff760a             push dword ptr [bp + 0xa]
8:28CE  9a4c6cf324           lcall 0x24f3, 0x6c4c  ; sub_s7:6C4C
8:28D3  c9                   leave
8:28D4  ca0800               retf 8
8:28D7  db 00

; ---------------- SCRoboMove@s8:28D8 FAR size=54 callers=1
8:28D8  55                   push bp
8:28D9  8bec                 mov bp, sp
8:28DB  68973a               push 0x3a97
8:28DE  66ff7606             push dword ptr [bp + 6]
8:28E2  9adcd11227           lcall 0x2712, 0xd1dc  ; SCBase::SCBase@s6:D1DC
8:28E7  c45e06               les bx, ptr [bp + 6]
8:28EA  26c707fe29           mov word ptr es:[bx], 0x29fe
8:28EF  26c74702301c         mov word ptr es:[bx + 2], 0x1c30  ; SEGMENT s8:0000
8:28F5  1e                   push ds
8:28F6  68f859               push 0x59f8  ; 'SCRoboMove'
8:28F9  8d4708               lea ax, [bx + 8]
8:28FC  06                   push es
8:28FD  50                   push ax
8:28FE  9a3e3d2727           lcall 0x2727, 0x3d3e  ; _fstrcpy@s1:3D3E
8:2903  8b4606               mov ax, word ptr [bp + 6]
8:2906  8b5608               mov dx, word ptr [bp + 8]
8:2909  c9                   leave
8:290A  ca0400               retf 4
8:290D  db 00

; ---------------- SCRoboMove::calcMe@s8:290E FAR size=54 callers=0
8:290E  c8040000             enter 4, 0
8:2912  666801000004         push 0x4000001
8:2918  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:291D  9aece1e528           lcall 0x28e5, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:2922  8956fe               mov word ptr [bp - 2], dx
8:2925  0bd0                 or dx, ax
8:2927  7409                 je 0x2932
8:2929  ff76fe               push word ptr [bp - 2]
8:292C  50                   push ax
8:292D  90                   nop
8:292E  0e                   push cs
8:292F  e8e61f               call 0x4918  ; sub_s8:4918
loc_2932:
8:2932  66ff36645a           push dword ptr [0x5a64]
8:2937  90                   nop
8:2938  0e                   push cs
8:2939  e83a51               call 0x7a76  ; sub_s8:7A76
8:293C  b80100               mov ax, 1
8:293F  c9                   leave
8:2940  ca0400               retf 4
8:2943  db 00

; ---------------- SCRoboMove::clone@s8:2944 FAR size=142 callers=0
8:2944  c8200000             enter 0x20, 0
8:2948  57                   push di
8:2949  56                   push si
8:294A  680801               push 0x108
8:294D  9a9c170129           lcall 0x2901, 0x179c  ; operator_new@s1:179C
8:2952  83c402               add sp, 2
8:2955  8946f8               mov word ptr [bp - 8], ax
8:2958  8956fa               mov word ptr [bp - 6], dx
8:295B  0bd0                 or dx, ax
8:295D  745f                 je 0x29be
8:295F  c45ef8               les bx, ptr [bp - 8]
8:2962  26c7079a38           mov word ptr es:[bx], 0x389a
8:2967  26c74702c01d         mov word ptr es:[bx + 2], 0x1dc0  ; SEGMENT s2:0000
8:296D  c45e06               les bx, ptr [bp + 6]
8:2970  66268b4704           mov eax, dword ptr es:[bx + 4]
8:2975  c45ef8               les bx, ptr [bp - 8]
8:2978  6626894704           mov dword ptr es:[bx + 4], eax
8:297D  8b4606               mov ax, word ptr [bp + 6]
8:2980  8b5608               mov dx, word ptr [bp + 8]
8:2983  050800               add ax, 8
8:2986  1e                   push ds
8:2987  8d7f08               lea di, [bx + 8]
8:298A  8bf0                 mov si, ax
8:298C  8eda                 mov ds, dx
8:298E  66b940000000         mov ecx, 0x40
8:2994  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
8:2997  1f                   pop ds
8:2998  c45ef8               les bx, ptr [bp - 8]
8:299B  26c707d26a           mov word ptr es:[bx], 0x6ad2
8:29A0  26c747022029         mov word ptr es:[bx + 2], 0x2920  ; SEGMENT s6:0000
8:29A6  c45ef8               les bx, ptr [bp - 8]
8:29A9  26c707fe29           mov word ptr es:[bx], 0x29fe
8:29AE  26c74702f328         mov word ptr es:[bx + 2], 0x28f3  ; SEGMENT s8:0000
8:29B4  668b46f8             mov eax, dword ptr [bp - 8]
8:29B8  668946fc             mov dword ptr [bp - 4], eax
8:29BC  eb08                 jmp 0x29c6
loc_29BE:
8:29BE  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_29C6:
8:29C6  8b46fc               mov ax, word ptr [bp - 4]
8:29C9  8b56fe               mov dx, word ptr [bp - 2]
8:29CC  5e                   pop si
8:29CD  5f                   pop di
8:29CE  c9                   leave
8:29CF  ca0400               retf 4

; ---------------- SCRoboMove::dtor@s8:29D2 size=60 callers=0
8:29D2  c80c0000             enter 0xc, 0
8:29D6  c45e06               les bx, ptr [bp + 6]
8:29D9  26c7079a38           mov word ptr es:[bx], 0x389a
8:29DE  26c747026b29         mov word ptr es:[bx + 2], 0x296b  ; SEGMENT s2:0000
8:29E4  f6460a01             test byte ptr [bp + 0xa], 1
8:29E8  7409                 je 0x29f3
8:29EA  66ff7606             push dword ptr [bp + 6]
8:29EE  9ace175029           lcall 0x2950, 0x17ce  ; operator_delete@s1:17CE
loc_29F3:
8:29F3  8b4606               mov ax, word ptr [bp + 6]
8:29F6  8b5608               mov dx, word ptr [bp + 8]
8:29F9  c9                   leave
8:29FA  ca0600               retf 6
8:29FD  db 00 d2 29 04 2a 0e 29 0c 2a 28 d2 a4 29 44 29 b2
8:2A0D  db 29

; ---------------- sub_s8:2A0E FAR size=78 callers=1
8:2A0E  55                   push bp
8:2A0F  8bec                 mov bp, sp
8:2A11  68f72a               push 0x2af7  ; 'fem133.wav'
8:2A14  66ff7606             push dword ptr [bp + 6]
8:2A18  9adcd1082a           lcall 0x2a08, 0xd1dc  ; SCBase::SCBase@s6:D1DC
8:2A1D  668b4616             mov eax, dword ptr [bp + 0x16]
8:2A21  c45e06               les bx, ptr [bp + 6]
8:2A24  662689870801         mov dword ptr es:[bx + 0x108], eax
8:2A2A  668b4612             mov eax, dword ptr [bp + 0x12]
8:2A2E  662689870c01         mov dword ptr es:[bx + 0x10c], eax
8:2A34  668b460e             mov eax, dword ptr [bp + 0xe]
8:2A38  662689871001         mov dword ptr es:[bx + 0x110], eax
8:2A3E  668b460a             mov eax, dword ptr [bp + 0xa]
8:2A42  662689871401         mov dword ptr es:[bx + 0x114], eax
8:2A48  26c7079a30           mov word ptr es:[bx], 0x309a
8:2A4D  26c74702002a         mov word ptr es:[bx + 2], 0x2a00  ; SEGMENT s8:0000
8:2A53  8bc3                 mov ax, bx
8:2A55  8cc2                 mov dx, es
8:2A57  c9                   leave
8:2A58  ca1400               retf 0x14
8:2A5B  db 00

; ---------------- sub_s8:2A5C FAR size=102 callers=2
8:2A5C  c8100000             enter 0x10, 0
8:2A60  56                   push si
8:2A61  c45e06               les bx, ptr [bp + 6]
8:2A64  26c7079a30           mov word ptr es:[bx], 0x309a
8:2A69  26c74702512a         mov word ptr es:[bx + 2], 0x2a51  ; SEGMENT s8:0000
8:2A6F  268b871401           mov ax, word ptr es:[bx + 0x114]
8:2A74  268b971601           mov dx, word ptr es:[bx + 0x116]
8:2A79  8bda                 mov bx, dx
8:2A7B  0bd0                 or dx, ax
8:2A7D  740e                 je 0x2a8d
8:2A7F  6a01                 push 1
8:2A81  53                   push bx
8:2A82  50                   push ax
8:2A83  8ec3                 mov es, bx
8:2A85  8bf0                 mov si, ax
8:2A87  26c41c               les bx, ptr es:[si]
8:2A8A  26ff1f               lcall es:[bx]
loc_2A8D:
8:2A8D  c45e06               les bx, ptr [bp + 6]
8:2A90  268b871001           mov ax, word ptr es:[bx + 0x110]
8:2A95  268b971201           mov dx, word ptr es:[bx + 0x112]
8:2A9A  8bda                 mov bx, dx
8:2A9C  0bd8                 or bx, ax
8:2A9E  740e                 je 0x2aae
8:2AA0  6a01                 push 1
8:2AA2  52                   push dx
8:2AA3  50                   push ax
8:2AA4  8ec2                 mov es, dx
8:2AA6  8bd8                 mov bx, ax
8:2AA8  26c41f               les bx, ptr es:[bx]
8:2AAB  26ff1f               lcall es:[bx]
loc_2AAE:
8:2AAE  c45e06               les bx, ptr [bp + 6]
8:2AB1  26c7079a38           mov word ptr es:[bx], 0x389a
8:2AB6  26c74702e229         mov word ptr es:[bx + 2], 0x29e2  ; SEGMENT s2:0000
8:2ABC  5e                   pop si
8:2ABD  c9                   leave
8:2ABE  ca0400               retf 4
8:2AC1  db 00

; ---------------- sub_s8:2AC2 FAR size=108 callers=0
8:2AC2  c8080000             enter 8, 0
8:2AC6  c45e06               les bx, ptr [bp + 6]
8:2AC9  6626ffb70801         push dword ptr es:[bx + 0x108]
8:2ACF  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:2AD4  9aece1f02a           lcall 0x2af0, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:2AD9  8946fc               mov word ptr [bp - 4], ax
8:2ADC  8956fe               mov word ptr [bp - 2], dx
8:2ADF  c45e06               les bx, ptr [bp + 6]
8:2AE2  6626ffb70c01         push dword ptr es:[bx + 0x10c]
8:2AE8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:2AED  9aece11b2a           lcall 0x2a1b, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:2AF2  8946f8               mov word ptr [bp - 8], ax
8:2AF5  8956fa               mov word ptr [bp - 6], dx
8:2AF8  66ff76fc             push dword ptr [bp - 4]
8:2AFC  52                   push dx
8:2AFD  50                   push ax
8:2AFE  c45e06               les bx, ptr [bp + 6]
8:2B01  6626ffb71001         push dword ptr es:[bx + 0x110]
8:2B07  06                   push es
8:2B08  53                   push bx
8:2B09  90                   nop
8:2B0A  0e                   push cs
8:2B0B  e87401               call 0x2c82  ; sub_s8:2C82
8:2B0E  66ff76f8             push dword ptr [bp - 8]
8:2B12  66ff76fc             push dword ptr [bp - 4]
8:2B16  c45e06               les bx, ptr [bp + 6]
8:2B19  6626ffb71401         push dword ptr es:[bx + 0x114]
8:2B1F  06                   push es
8:2B20  53                   push bx
8:2B21  90                   nop
8:2B22  0e                   push cs
8:2B23  e85c01               call 0x2c82  ; sub_s8:2C82
8:2B26  b80100               mov ax, 1
8:2B29  c9                   leave
8:2B2A  ca0400               retf 4
8:2B2D  db 00

; ---------------- sub_s8:2B2E FAR size=108 callers=0
8:2B2E  c8080000             enter 8, 0
8:2B32  c45e06               les bx, ptr [bp + 6]
8:2B35  6626ffb70801         push dword ptr es:[bx + 0x108]
8:2B3B  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:2B40  9aece15c2b           lcall 0x2b5c, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:2B45  8946fc               mov word ptr [bp - 4], ax
8:2B48  8956fe               mov word ptr [bp - 2], dx
8:2B4B  c45e06               les bx, ptr [bp + 6]
8:2B4E  6626ffb70c01         push dword ptr es:[bx + 0x10c]
8:2B54  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:2B59  9aece1d72a           lcall 0x2ad7, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:2B5E  8946f8               mov word ptr [bp - 8], ax
8:2B61  8956fa               mov word ptr [bp - 6], dx
8:2B64  66ff76fc             push dword ptr [bp - 4]
8:2B68  52                   push dx
8:2B69  50                   push ax
8:2B6A  c45e06               les bx, ptr [bp + 6]
8:2B6D  6626ffb71001         push dword ptr es:[bx + 0x110]
8:2B73  06                   push es
8:2B74  53                   push bx
8:2B75  90                   nop
8:2B76  0e                   push cs
8:2B77  e81804               call 0x2f92  ; sub_s8:2F92
8:2B7A  66ff76f8             push dword ptr [bp - 8]
8:2B7E  66ff76fc             push dword ptr [bp - 4]
8:2B82  c45e06               les bx, ptr [bp + 6]
8:2B85  6626ffb71401         push dword ptr es:[bx + 0x114]
8:2B8B  06                   push es
8:2B8C  53                   push bx
8:2B8D  90                   nop
8:2B8E  0e                   push cs
8:2B8F  e80004               call 0x2f92  ; sub_s8:2F92
8:2B92  b80100               mov ax, 1
8:2B95  c9                   leave
8:2B96  ca0400               retf 4
8:2B99  db 00

; ---------------- sub_s8:2B9A FAR size=232 callers=0
8:2B9A  c8200000             enter 0x20, 0
8:2B9E  57                   push di
8:2B9F  56                   push si
8:2BA0  681801               push 0x118
8:2BA3  9a9c17f129           lcall 0x29f1, 0x179c  ; operator_new@s1:179C
8:2BA8  83c402               add sp, 2
8:2BAB  8946f8               mov word ptr [bp - 8], ax
8:2BAE  8956fa               mov word ptr [bp - 6], dx
8:2BB1  0bd0                 or dx, ax
8:2BB3  0f84a500             je 0x2c5c
8:2BB7  c45ef8               les bx, ptr [bp - 8]
8:2BBA  26c7079a38           mov word ptr es:[bx], 0x389a
8:2BBF  26c74702ba2a         mov word ptr es:[bx + 2], 0x2aba  ; SEGMENT s2:0000
8:2BC5  c45e06               les bx, ptr [bp + 6]
8:2BC8  66268b4704           mov eax, dword ptr es:[bx + 4]
8:2BCD  c45ef8               les bx, ptr [bp - 8]
8:2BD0  6626894704           mov dword ptr es:[bx + 4], eax
8:2BD5  8b4606               mov ax, word ptr [bp + 6]
8:2BD8  8b5608               mov dx, word ptr [bp + 8]
8:2BDB  050800               add ax, 8
8:2BDE  1e                   push ds
8:2BDF  8d7f08               lea di, [bx + 8]
8:2BE2  8bf0                 mov si, ax
8:2BE4  8eda                 mov ds, dx
8:2BE6  66b940000000         mov ecx, 0x40
8:2BEC  f366a5               rep movsd dword ptr es:[di], dword ptr [si]
8:2BEF  1f                   pop ds
8:2BF0  c45ef8               les bx, ptr [bp - 8]
8:2BF3  26c707d26a           mov word ptr es:[bx], 0x6ad2
8:2BF8  26c74702432b         mov word ptr es:[bx + 2], 0x2b43  ; SEGMENT s6:0000
8:2BFE  c45e06               les bx, ptr [bp + 6]
8:2C01  66268b870801         mov eax, dword ptr es:[bx + 0x108]
8:2C07  c45ef8               les bx, ptr [bp - 8]
8:2C0A  662689870801         mov dword ptr es:[bx + 0x108], eax
8:2C10  c45e06               les bx, ptr [bp + 6]
8:2C13  66268b870c01         mov eax, dword ptr es:[bx + 0x10c]
8:2C19  c45ef8               les bx, ptr [bp - 8]
8:2C1C  662689870c01         mov dword ptr es:[bx + 0x10c], eax
8:2C22  c45e06               les bx, ptr [bp + 6]
8:2C25  66268b871001         mov eax, dword ptr es:[bx + 0x110]
8:2C2B  c45ef8               les bx, ptr [bp - 8]
8:2C2E  662689871001         mov dword ptr es:[bx + 0x110], eax
8:2C34  c45e06               les bx, ptr [bp + 6]
8:2C37  66268b871401         mov eax, dword ptr es:[bx + 0x114]
8:2C3D  c45ef8               les bx, ptr [bp - 8]
8:2C40  662689871401         mov dword ptr es:[bx + 0x114], eax
8:2C46  26c7079a30           mov word ptr es:[bx], 0x309a
8:2C4B  26c747026d2a         mov word ptr es:[bx + 2], 0x2a6d  ; SEGMENT s8:0000
8:2C51  668b46f8             mov eax, dword ptr [bp - 8]
8:2C55  668946fc             mov dword ptr [bp - 4], eax
8:2C59  eb09                 jmp 0x2c64
8:2C5B  db 90
loc_2C5C:
8:2C5C  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_2C64:
8:2C64  c45e06               les bx, ptr [bp + 6]
8:2C67  662bc0               sub eax, eax
8:2C6A  662689871401         mov dword ptr es:[bx + 0x114], eax
8:2C70  662689871001         mov dword ptr es:[bx + 0x110], eax
8:2C76  8b46fc               mov ax, word ptr [bp - 4]
8:2C79  8b56fe               mov dx, word ptr [bp - 2]
8:2C7C  5e                   pop si
8:2C7D  5f                   pop di
8:2C7E  c9                   leave
8:2C7F  ca0400               retf 4

; ---------------- sub_s8:2C82 FAR size=784 callers=1
8:2C82  c8300000             enter 0x30, 0
8:2C86  c45e12               les bx, ptr [bp + 0x12]
8:2C89  66268b870002         mov eax, dword ptr es:[bx + 0x200]
8:2C8F  668946fc             mov dword ptr [bp - 4], eax
8:2C93  c45e0e               les bx, ptr [bp + 0xe]
8:2C96  66268b870002         mov eax, dword ptr es:[bx + 0x200]
8:2C9C  268b970202           mov dx, word ptr es:[bx + 0x202]
8:2CA1  668946f8             mov dword ptr [bp - 8], eax
8:2CA5  c45e0a               les bx, ptr [bp + 0xa]
8:2CA8  268b470c             mov ax, word ptr es:[bx + 0xc]
8:2CAC  e9bf02               jmp 0x2f6e
8:2CAF  db 90
loc_2CB0:
8:2CB0  c45e0a               les bx, ptr [bp + 0xa]
8:2CB3  895ef4               mov word ptr [bp - 0xc], bx
8:2CB6  8c46f6               mov word ptr [bp - 0xa], es
8:2CB9  26ff770e             push word ptr es:[bx + 0xe]
8:2CBD  6626ff7708           push dword ptr es:[bx + 8]
8:2CC2  66ff7612             push dword ptr [bp + 0x12]
8:2CC6  90                   nop
8:2CC7  0e                   push cs
8:2CC8  e8ed25               call 0x52b8  ; sub_s8:52B8
8:2CCB  c9                   leave
8:2CCC  ca1000               retf 0x10
8:2CCF  db 90
loc_2CD0:
8:2CD0  668b460a             mov eax, dword ptr [bp + 0xa]
8:2CD4  8b560c               mov dx, word ptr [bp + 0xc]
8:2CD7  668946f4             mov dword ptr [bp - 0xc], eax
8:2CDB  8bd8                 mov bx, ax
8:2CDD  8ec2                 mov es, dx
8:2CDF  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
8:2CE5  7417                 je 0x2cfe
8:2CE7  6626ff770e           push dword ptr es:[bx + 0xe]
8:2CEC  66ff760e             push dword ptr [bp + 0xe]
8:2CF0  66ff7612             push dword ptr [bp + 0x12]
8:2CF4  90                   nop
8:2CF5  0e                   push cs
8:2CF6  e80312               call 0x3efc  ; sub_s8:3EFC
8:2CF9  c9                   leave
8:2CFA  ca1000               retf 0x10
8:2CFD  db 90
loc_2CFE:
8:2CFE  8d46f0               lea ax, [bp - 0x10]
8:2D01  16                   push ss
8:2D02  50                   push ax
8:2D03  9a3ea4332d           lcall 0x2d33, 0xa43e  ; sub_s5:A43E
8:2D08  c45ef4               les bx, ptr [bp - 0xc]
8:2D0B  66268b4708           mov eax, dword ptr es:[bx + 8]
8:2D10  668946ec             mov dword ptr [bp - 0x14], eax
loc_2D14:
8:2D14  8b46ec               mov ax, word ptr [bp - 0x14]
8:2D17  8b56ee               mov dx, word ptr [bp - 0x12]
8:2D1A  66ff4eec             dec dword ptr [bp - 0x14]
8:2D1E  0bd0                 or dx, ax
8:2D20  0f846902             je 0x2f8d
8:2D24  c45ef4               les bx, ptr [bp - 0xc]
8:2D27  26ff7712             push word ptr es:[bx + 0x12]
8:2D2B  8d46f0               lea ax, [bp - 0x10]
8:2D2E  16                   push ss
8:2D2F  50                   push ax
8:2D30  9aeea64027           lcall 0x2740, 0xa6ee  ; sub_s5:A6EE
8:2D35  ebdd                 jmp 0x2d14
8:2D37  db 90
loc_2D38:
8:2D38  c45e0a               les bx, ptr [bp + 0xa]
8:2D3B  895ee8               mov word ptr [bp - 0x18], bx
8:2D3E  8c46ea               mov word ptr [bp - 0x16], es
8:2D41  6626ff770e           push dword ptr es:[bx + 0xe]
8:2D46  66ff760e             push dword ptr [bp + 0xe]
8:2D4A  66ff7612             push dword ptr [bp + 0x12]
8:2D4E  90                   nop
8:2D4F  0e                   push cs
8:2D50  e8e511               call 0x3f38  ; sub_s8:3F38
8:2D53  c9                   leave
8:2D54  ca1000               retf 0x10
8:2D57  db 90
loc_2D58:
8:2D58  668b460a             mov eax, dword ptr [bp + 0xa]
8:2D5C  668946e8             mov dword ptr [bp - 0x18], eax
8:2D60  8b46fc               mov ax, word ptr [bp - 4]
8:2D63  8b56fe               mov dx, word ptr [bp - 2]
8:2D66  2af6                 sub dh, dh
8:2D68  3d0100               cmp ax, 1
8:2D6B  7533                 jne 0x2da0
8:2D6D  0bd2                 or dx, dx
8:2D6F  752f                 jne 0x2da0
8:2D71  c45e12               les bx, ptr [bp + 0x12]
8:2D74  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
8:2D7A  668946f0             mov dword ptr [bp - 0x10], eax
8:2D7E  c45ee8               les bx, ptr [bp - 0x18]
8:2D81  6626ff7708           push dword ptr es:[bx + 8]
8:2D86  26ff770e             push word ptr es:[bx + 0xe]
8:2D8A  6650                 push eax
8:2D8C  9a9436372f           lcall 0x2f37, 0x3694  ; sub_s7:3694
8:2D91  c45ee8               les bx, ptr [bp - 0x18]
8:2D94  26894710             mov word ptr es:[bx + 0x10], ax
8:2D98  26895712             mov word ptr es:[bx + 0x12], dx
8:2D9C  e9ee01               jmp 0x2f8d
8:2D9F  db 90
loc_2DA0:
8:2DA0  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
8:2DA6  740a                 je 0x2db2
8:2DA8  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
8:2DAB  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
8:2DAF  eb06                 jmp 0x2db7
8:2DB1  db 90
loc_2DB2:
8:2DB2  9a0a16cb2d           lcall 0x2dcb, 0x160a  ; SH_DefaultPool@s1:160A
loc_2DB7:
8:2DB7  8946dc               mov word ptr [bp - 0x24], ax
8:2DBA  8956de               mov word ptr [bp - 0x22], dx
8:2DBD  52                   push dx
8:2DBE  50                   push ax
8:2DBF  666800000100         push 0x10000
8:2DC5  686c01               push 0x16c
8:2DC8  9a0817a62b           lcall 0x2ba6, 0x1708  ; SH_MemAllocPtr@s1:1708
8:2DCD  83c40a               add sp, 0xa
8:2DD0  c45ee8               les bx, ptr [bp - 0x18]
8:2DD3  26894710             mov word ptr es:[bx + 0x10], ax
8:2DD7  26895712             mov word ptr es:[bx + 0x12], dx
8:2DDB  c45ee8               les bx, ptr [bp - 0x18]
8:2DDE  268b470e             mov ax, word ptr es:[bx + 0xe]
8:2DE2  2d0300               sub ax, 3
8:2DE5  7419                 je 0x2e00
8:2DE7  48                   dec ax
8:2DE8  742c                 je 0x2e16
8:2DEA  66268b4708           mov eax, dword ptr es:[bx + 8]
8:2DEF  268b570a             mov dx, word ptr es:[bx + 0xa]
8:2DF3  26c45f10             les bx, ptr es:[bx + 0x10]
8:2DF7  6626894728           mov dword ptr es:[bx + 0x28], eax
8:2DFC  c9                   leave
8:2DFD  ca1000               retf 0x10
loc_2E00:
8:2E00  66268b4708           mov eax, dword ptr es:[bx + 8]
8:2E05  268b570a             mov dx, word ptr es:[bx + 0xa]
8:2E09  26c45f10             les bx, ptr es:[bx + 0x10]
8:2E0D  6626894764           mov dword ptr es:[bx + 0x64], eax
8:2E12  e97801               jmp 0x2f8d
8:2E15  db 90
loc_2E16:
8:2E16  66268b4708           mov eax, dword ptr es:[bx + 8]
8:2E1B  268b570a             mov dx, word ptr es:[bx + 0xa]
8:2E1F  26c45f10             les bx, ptr es:[bx + 0x10]
8:2E23  66268987dc00         mov dword ptr es:[bx + 0xdc], eax
8:2E29  c9                   leave
8:2E2A  ca1000               retf 0x10
8:2E2D  db 90
loc_2E2E:
8:2E2E  668b460a             mov eax, dword ptr [bp + 0xa]
8:2E32  8b560c               mov dx, word ptr [bp + 0xc]
8:2E35  668946dc             mov dword ptr [bp - 0x24], eax
8:2E39  8ec2                 mov es, dx
8:2E3B  8bd8                 mov bx, ax
8:2E3D  26837f0e0c           cmp word ptr es:[bx + 0xe], 0xc
8:2E42  7414                 je 0x2e58
8:2E44  26ff770e             push word ptr es:[bx + 0xe]
8:2E48  26ff7708             push word ptr es:[bx + 8]
8:2E4C  66ff7612             push dword ptr [bp + 0x12]
8:2E50  90                   nop
8:2E51  0e                   push cs
8:2E52  e87715               call 0x43cc  ; sub_s8:43CC
8:2E55  e93501               jmp 0x2f8d
loc_2E58:
8:2E58  8b46fc               mov ax, word ptr [bp - 4]
8:2E5B  8b56fe               mov dx, word ptr [bp - 2]
8:2E5E  2af6                 sub dh, dh
8:2E60  3d0100               cmp ax, 1
8:2E63  0f852601             jne 0x2f8d
8:2E67  0bd2                 or dx, dx
8:2E69  0f852001             jne 0x2f8d
8:2E6D  c45e12               les bx, ptr [bp + 0x12]
8:2E70  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
8:2E76  668946e8             mov dword ptr [bp - 0x18], eax
8:2E7A  c45edc               les bx, ptr [bp - 0x24]
8:2E7D  268b4708             mov ax, word ptr es:[bx + 8]
8:2E81  268b570a             mov dx, word ptr es:[bx + 0xa]
8:2E85  f7d8                 neg ax
8:2E87  83d200               adc dx, 0
8:2E8A  f7da                 neg dx
8:2E8C  8946d8               mov word ptr [bp - 0x28], ax
8:2E8F  8956da               mov word ptr [bp - 0x26], dx
8:2E92  c45ee8               les bx, ptr [bp - 0x18]
8:2E95  2601877001           add word ptr es:[bx + 0x170], ax
8:2E9A  2611977201           adc word ptr es:[bx + 0x172], dx
8:2E9F  e9eb00               jmp 0x2f8d
loc_2EA2:
8:2EA2  c45e0a               les bx, ptr [bp + 0xa]
8:2EA5  895ed8               mov word ptr [bp - 0x28], bx
8:2EA8  8c46da               mov word ptr [bp - 0x26], es
8:2EAB  6626ff770e           push dword ptr es:[bx + 0xe]
8:2EB0  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:2EB5  9aece1fc2b           lcall 0x2bfc, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:2EBA  8946dc               mov word ptr [bp - 0x24], ax
8:2EBD  8956de               mov word ptr [bp - 0x22], dx
8:2EC0  c45e0e               les bx, ptr [bp + 0xe]
8:2EC3  6626ffb70002         push dword ptr es:[bx + 0x200]
8:2EC9  52                   push dx
8:2ECA  50                   push ax
8:2ECB  90                   nop
8:2ECC  0e                   push cs
8:2ECD  e8ce05               call 0x349e  ; sub_s8:349E
8:2ED0  685802               push 0x258
8:2ED3  66ff76dc             push dword ptr [bp - 0x24]
8:2ED7  90                   nop
8:2ED8  0e                   push cs
8:2ED9  e8321e               call 0x4d0e  ; sub_s8:4D0E
8:2EDC  685802               push 0x258
8:2EDF  66ff76dc             push dword ptr [bp - 0x24]
8:2EE3  90                   nop
8:2EE4  0e                   push cs
8:2EE5  e8261e               call 0x4d0e  ; sub_s8:4D0E
8:2EE8  6a3b                 push 0x3b
8:2EEA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:2EEF  9aba20192f           lcall 0x2f19, 0x20ba  ; sub_s3:20BA
8:2EF4  8946e4               mov word ptr [bp - 0x1c], ax
8:2EF7  8956e6               mov word ptr [bp - 0x1a], dx
8:2EFA  666801000004         push 0x4000001
8:2F00  c45ed8               les bx, ptr [bp - 0x28]
8:2F03  6626ff770e           push dword ptr es:[bx + 0xe]
8:2F08  52                   push dx
8:2F09  50                   push ax
8:2F0A  9a58dec32b           lcall 0x2bc3, 0xde58  ; sub_s2:DE58
8:2F0F  6a2f                 push 0x2f
8:2F11  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:2F16  9aba20522f           lcall 0x2f52, 0x20ba  ; sub_s3:20BA
8:2F1B  8946e8               mov word ptr [bp - 0x18], ax
8:2F1E  8956ea               mov word ptr [bp - 0x16], dx
8:2F21  c45ee8               les bx, ptr [bp - 0x18]
8:2F24  66268b4720           mov eax, dword ptr es:[bx + 0x20]
8:2F29  668946ec             mov dword ptr [bp - 0x14], eax
8:2F2D  6650                 push eax
8:2F2F  66ff364857           push dword ptr [0x5748]  ; g_sim
8:2F34  9a4483442f           lcall 0x2f44, 0x8344  ; sub_s7:8344
8:2F39  8946f0               mov word ptr [bp - 0x10], ax
8:2F3C  8956f2               mov word ptr [bp - 0xe], dx
8:2F3F  52                   push dx
8:2F40  50                   push ax
8:2F41  9a005bf926           lcall 0x26f9, 0x5b00  ; sub_s7:5B00
8:2F46  8946e0               mov word ptr [bp - 0x20], ax
8:2F49  50                   push ax
8:2F4A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:2F4F  9aba20e80b           lcall 0xbe8, 0x20ba  ; sub_s3:20BA
8:2F54  8946f4               mov word ptr [bp - 0xc], ax
8:2F57  8956f6               mov word ptr [bp - 0xa], dx
8:2F5A  6a06                 push 6
8:2F5C  052000               add ax, 0x20
8:2F5F  52                   push dx
8:2F60  50                   push ax
8:2F61  8ec2                 mov es, dx
8:2F63  8bd8                 mov bx, ax
8:2F65  26c41f               les bx, ptr es:[bx]
8:2F68  26ff5f04             lcall es:[bx + 4]
8:2F6C  eb1f                 jmp 0x2f8d
loc_2F6E:
8:2F6E  48                   dec ax
8:2F6F  0f843dfd             je 0x2cb0
8:2F73  48                   dec ax
8:2F74  0f8458fd             je 0x2cd0
8:2F78  48                   dec ax
8:2F79  0f84bbfd             je 0x2d38
8:2F7D  48                   dec ax
8:2F7E  0f84d6fd             je 0x2d58
8:2F82  48                   dec ax
8:2F83  0f84a7fe             je 0x2e2e
8:2F87  48                   dec ax
8:2F88  48                   dec ax
8:2F89  0f8415ff             je 0x2ea2
loc_2F8D:
8:2F8D  c9                   leave
8:2F8E  ca1000               retf 0x10
8:2F91  db 00

; ---------------- sub_s8:2F92 FAR size=226 callers=1
8:2F92  c8240000             enter 0x24, 0
8:2F96  c45e0e               les bx, ptr [bp + 0xe]
8:2F99  66268b870002         mov eax, dword ptr es:[bx + 0x200]
8:2F9F  268b970202           mov dx, word ptr es:[bx + 0x202]
8:2FA4  668946f8             mov dword ptr [bp - 8], eax
8:2FA8  c45e0a               les bx, ptr [bp + 0xa]
8:2FAB  268b470c             mov ax, word ptr es:[bx + 0xc]
8:2FAF  e9ae00               jmp 0x3060
loc_2FB2:
8:2FB2  c45e0a               les bx, ptr [bp + 0xa]
8:2FB5  895ef4               mov word ptr [bp - 0xc], bx
8:2FB8  8c46f6               mov word ptr [bp - 0xa], es
8:2FBB  26ff770e             push word ptr es:[bx + 0xe]
8:2FBF  6626ff7708           push dword ptr es:[bx + 8]
8:2FC4  66ff760e             push dword ptr [bp + 0xe]
8:2FC8  90                   nop
8:2FC9  0e                   push cs
8:2FCA  e8f30c               call 0x3cc0  ; sub_s8:3CC0
8:2FCD  c9                   leave
8:2FCE  ca1000               retf 0x10
8:2FD1  db 90
loc_2FD2:
8:2FD2  668b460a             mov eax, dword ptr [bp + 0xa]
8:2FD6  668946f4             mov dword ptr [bp - 0xc], eax
8:2FDA  c45e0e               les bx, ptr [bp + 0xe]
8:2FDD  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
8:2FE3  668946f0             mov dword ptr [bp - 0x10], eax
8:2FE7  c45ef4               les bx, ptr [bp - 0xc]
8:2FEA  6626ff7710           push dword ptr es:[bx + 0x10]
8:2FEF  6650                 push eax
8:2FF1  9a5c358f2d           lcall 0x2d8f, 0x355c  ; sub_s7:355C
8:2FF6  c9                   leave
8:2FF7  ca1000               retf 0x10
loc_2FFA:
8:2FFA  668b460a             mov eax, dword ptr [bp + 0xa]
8:2FFE  8b560c               mov dx, word ptr [bp + 0xc]
8:3001  668946e8             mov dword ptr [bp - 0x18], eax
8:3005  8ec2                 mov es, dx
8:3007  8bd8                 mov bx, ax
8:3009  26837f0e0c           cmp word ptr es:[bx + 0xe], 0xc
8:300E  7416                 je 0x3026
8:3010  26ff770e             push word ptr es:[bx + 0xe]
8:3014  6626ff7708           push dword ptr es:[bx + 8]
8:3019  66ff760e             push dword ptr [bp + 0xe]
8:301D  90                   nop
8:301E  0e                   push cs
8:301F  e87627               call 0x5798  ; sub_s8:5798
8:3022  c9                   leave
8:3023  ca1000               retf 0x10
loc_3026:
8:3026  8b46f8               mov ax, word ptr [bp - 8]
8:3029  8b56fa               mov dx, word ptr [bp - 6]
8:302C  2af6                 sub dh, dh
8:302E  3d0100               cmp ax, 1
8:3031  753c                 jne 0x306f
8:3033  0bd2                 or dx, dx
8:3035  7538                 jne 0x306f
8:3037  c45e0e               les bx, ptr [bp + 0xe]
8:303A  66268b87f601         mov eax, dword ptr es:[bx + 0x1f6]
8:3040  668946f0             mov dword ptr [bp - 0x10], eax
8:3044  c45ee8               les bx, ptr [bp - 0x18]
8:3047  268b4708             mov ax, word ptr es:[bx + 8]
8:304B  268b570a             mov dx, word ptr es:[bx + 0xa]
8:304F  c45ef0               les bx, ptr [bp - 0x10]
8:3052  2601877001           add word ptr es:[bx + 0x170], ax
8:3057  2611977201           adc word ptr es:[bx + 0x172], dx
8:305C  c9                   leave
8:305D  ca1000               retf 0x10
loc_3060:
8:3060  48                   dec ax
8:3061  0f844dff             je 0x2fb2
8:3065  2d0300               sub ax, 3
8:3068  0f8466ff             je 0x2fd2
8:306C  48                   dec ax
8:306D  748b                 je 0x2ffa
loc_306F:
8:306F  c9                   leave
8:3070  ca1000               retf 0x10
8:3073  db 00

; ---------------- sub_s8:3074 FAR size=54 callers=0
8:3074  55                   push bp
8:3075  8bec                 mov bp, sp
8:3077  66ff7606             push dword ptr [bp + 6]
8:307B  90                   nop
8:307C  0e                   push cs
8:307D  e8dcf9               call 0x2a5c  ; sub_s8:2A5C
8:3080  f6460a01             test byte ptr [bp + 0xa], 1
8:3084  7409                 je 0x308f
8:3086  66ff7606             push dword ptr [bp + 6]
8:308A  9ace17b52d           lcall 0x2db5, 0x17ce  ; operator_delete@s1:17CE
loc_308F:
8:308F  8b4606               mov ax, word ptr [bp + 6]
8:3092  8b5608               mov dx, word ptr [bp + 8]
8:3095  c9                   leave
8:3096  ca0600               retf 6
8:3099  db 00 74 30 a0 30 2e 2b a4 30 c2 2a a8 30 9a 2b 4f
8:30A9  db 2c

; ---------------- sub_s8:30AA FAR size=376 callers=1
8:30AA  c8040000             enter 4, 0
8:30AE  666a00               push 0
8:30B1  666a00               push 0
8:30B4  66ff7606             push dword ptr [bp + 6]
8:30B8  9ace17c731           lcall 0x31c7, 0x17ce  ; sub_s7:17CE
8:30BD  c45e06               les bx, ptr [bp + 6]
8:30C0  662bc0               sub eax, eax
8:30C3  6626894710           mov dword ptr es:[bx + 0x10], eax
8:30C8  6626894714           mov dword ptr es:[bx + 0x14], eax
8:30CD  b85802               mov ax, 0x258
8:30D0  26894718             mov word ptr es:[bx + 0x18], ax
8:30D4  2689471a             mov word ptr es:[bx + 0x1a], ax
8:30D8  26c7471c0000         mov word ptr es:[bx + 0x1c], 0
8:30DE  662bc0               sub eax, eax
8:30E1  662689471e           mov dword ptr es:[bx + 0x1e], eax
8:30E6  26894722             mov word ptr es:[bx + 0x22], ax
8:30EA  26c747243200         mov word ptr es:[bx + 0x24], 0x32
8:30F0  66268987f601         mov dword ptr es:[bx + 0x1f6], eax
8:30F6  66268987fa01         mov dword ptr es:[bx + 0x1fa], eax
8:30FC  268987fe01           mov word ptr es:[bx + 0x1fe], ax
8:3101  6626c787000201000008 mov dword ptr es:[bx + 0x200], 0x8000001
8:310B  2689870402           mov word ptr es:[bx + 0x204], ax
8:3110  2689870602           mov word ptr es:[bx + 0x206], ax
8:3115  26c78708020100       mov word ptr es:[bx + 0x208], 1
8:311C  2689870a02           mov word ptr es:[bx + 0x20a], ax
8:3121  2689870c02           mov word ptr es:[bx + 0x20c], ax
8:3126  2689870e02           mov word ptr es:[bx + 0x20e], ax
8:312B  662bc9               sub ecx, ecx
8:312E  6626898f1002         mov dword ptr es:[bx + 0x210], ecx
8:3134  2689871402           mov word ptr es:[bx + 0x214], ax
8:3139  6626898f1602         mov dword ptr es:[bx + 0x216], ecx
8:313F  6626898f1a02         mov dword ptr es:[bx + 0x21a], ecx
8:3145  26c7070465           mov word ptr es:[bx], 0x6504
8:314A  26c747029c30         mov word ptr es:[bx + 2], 0x309c  ; SEGMENT s8:0000
8:3150  689400               push 0x94
8:3153  50                   push ax
8:3154  8d4f26               lea cx, [bx + 0x26]
8:3157  06                   push es
8:3158  51                   push cx
8:3159  9a06497331           lcall 0x3173, 0x4906  ; sub_s1:4906
8:315E  83c408               add sp, 8
8:3161  666800009400         push 0x940000
8:3167  668b4606             mov eax, dword ptr [bp + 6]
8:316B  05ba00               add ax, 0xba
8:316E  6650                 push eax
8:3170  9a06498a31           lcall 0x318a, 0x4906  ; sub_s1:4906
8:3175  83c408               add sp, 8
8:3178  666800005400         push 0x540000
8:317E  668b4606             mov eax, dword ptr [bp + 6]
8:3182  054e01               add ax, 0x14e
8:3185  6650                 push eax
8:3187  9a0649a131           lcall 0x31a1, 0x4906  ; sub_s1:4906
8:318C  83c408               add sp, 8
8:318F  666800005400         push 0x540000
8:3195  668b4606             mov eax, dword ptr [bp + 6]
8:3199  05a201               add ax, 0x1a2
8:319C  6650                 push eax
8:319E  9a0649ac31           lcall 0x31ac, 0x4906  ; sub_s1:4906
8:31A3  83c408               add sp, 8
8:31A6  68b001               push 0x1b0
8:31A9  9a9c17ea31           lcall 0x31ea, 0x179c  ; operator_new@s1:179C
8:31AE  83c402               add sp, 2
8:31B1  8956fe               mov word ptr [bp - 2], dx
8:31B4  0bd0                 or dx, ax
8:31B6  7420                 je 0x31d8
8:31B8  c45e06               les bx, ptr [bp + 6]
8:31BB  6626ff7704           push dword ptr es:[bx + 4]
8:31C0  ff76fe               push word ptr [bp - 2]
8:31C3  50                   push ax
8:31C4  9a4c31f42f           lcall 0x2ff4, 0x314c  ; sub_s7:314C
8:31C9  c45e06               les bx, ptr [bp + 6]
8:31CC  268987f601           mov word ptr es:[bx + 0x1f6], ax
8:31D1  268997f801           mov word ptr es:[bx + 0x1f8], dx
8:31D6  eb0d                 jmp 0x31e5
loc_31D8:
8:31D8  c45e06               les bx, ptr [bp + 6]
8:31DB  6626c787f60100000000 mov dword ptr es:[bx + 0x1f6], 0
loc_31E5:
8:31E5  6a1e                 push 0x1e
8:31E7  9a9c178d30           lcall 0x308d, 0x179c  ; operator_new@s1:179C
8:31EC  83c402               add sp, 2
8:31EF  8956fe               mov word ptr [bp - 2], dx
8:31F2  0bd0                 or dx, ax
8:31F4  7414                 je 0x320a
8:31F6  6668c8000000         push 0xc8
8:31FC  666a64               push 0x64
8:31FF  ff76fe               push word ptr [bp - 2]
8:3202  50                   push ax
8:3203  9a44c4062d           lcall 0x2d06, 0xc444  ; sub_s5:C444
8:3208  eb03                 jmp 0x320d
loc_320A:
8:320A  33c0                 xor ax, ax
8:320C  99                   cdq
loc_320D:
8:320D  c45e06               les bx, ptr [bp + 6]
8:3210  2689470c             mov word ptr es:[bx + 0xc], ax
8:3214  2689570e             mov word ptr es:[bx + 0xe], dx
8:3218  8b4606               mov ax, word ptr [bp + 6]
8:321B  8b5608               mov dx, word ptr [bp + 8]
8:321E  c9                   leave
8:321F  ca0400               retf 4

; ---------------- sub_s8:3222 FAR size=470 callers=0
8:3222  c8240000             enter 0x24, 0
8:3226  66ff760e             push dword ptr [bp + 0xe]
8:322A  666800000004         push 0x4000000
8:3230  666a00               push 0
8:3233  666a00               push 0
8:3236  66ff7606             push dword ptr [bp + 6]
8:323A  9a3c185133           lcall 0x3351, 0x183c  ; sub_s7:183C
8:323F  668b460a             mov eax, dword ptr [bp + 0xa]
8:3243  c45e06               les bx, ptr [bp + 6]
8:3246  6626894710           mov dword ptr es:[bx + 0x10], eax
8:324B  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
8:3254  b85802               mov ax, 0x258
8:3257  26894718             mov word ptr es:[bx + 0x18], ax
8:325B  2689471a             mov word ptr es:[bx + 0x1a], ax
8:325F  26c7471c0000         mov word ptr es:[bx + 0x1c], 0
8:3265  662bc0               sub eax, eax
8:3268  662689471e           mov dword ptr es:[bx + 0x1e], eax
8:326D  26894722             mov word ptr es:[bx + 0x22], ax
8:3271  26c747243200         mov word ptr es:[bx + 0x24], 0x32
8:3277  66268987f601         mov dword ptr es:[bx + 0x1f6], eax
8:327D  66268987fa01         mov dword ptr es:[bx + 0x1fa], eax
8:3283  268987fe01           mov word ptr es:[bx + 0x1fe], ax
8:3288  6626c787000201000008 mov dword ptr es:[bx + 0x200], 0x8000001
8:3292  2689870402           mov word ptr es:[bx + 0x204], ax
8:3297  2689870602           mov word ptr es:[bx + 0x206], ax
8:329C  26c78708020100       mov word ptr es:[bx + 0x208], 1
8:32A3  2689870a02           mov word ptr es:[bx + 0x20a], ax
8:32A8  2689870c02           mov word ptr es:[bx + 0x20c], ax
8:32AD  2689870e02           mov word ptr es:[bx + 0x20e], ax
8:32B2  662bc9               sub ecx, ecx
8:32B5  6626898f1002         mov dword ptr es:[bx + 0x210], ecx
8:32BB  2689871402           mov word ptr es:[bx + 0x214], ax
8:32C0  6626898f1602         mov dword ptr es:[bx + 0x216], ecx
8:32C6  6626898f1a02         mov dword ptr es:[bx + 0x21a], ecx
8:32CC  26c7070465           mov word ptr es:[bx], 0x6504
8:32D1  26c747024e31         mov word ptr es:[bx + 2], 0x314e  ; SEGMENT s8:0000
8:32D7  689400               push 0x94
8:32DA  50                   push ax
8:32DB  8d4f26               lea cx, [bx + 0x26]
8:32DE  06                   push es
8:32DF  51                   push cx
8:32E0  9a0649fa32           lcall 0x32fa, 0x4906  ; sub_s1:4906
8:32E5  83c408               add sp, 8
8:32E8  666800009400         push 0x940000
8:32EE  668b4606             mov eax, dword ptr [bp + 6]
8:32F2  05ba00               add ax, 0xba
8:32F5  6650                 push eax
8:32F7  9a06491133           lcall 0x3311, 0x4906  ; sub_s1:4906
8:32FC  83c408               add sp, 8
8:32FF  666800005400         push 0x540000
8:3305  668b4606             mov eax, dword ptr [bp + 6]
8:3309  054e01               add ax, 0x14e
8:330C  6650                 push eax
8:330E  9a06492833           lcall 0x3328, 0x4906  ; sub_s1:4906
8:3313  83c408               add sp, 8
8:3316  666800005400         push 0x540000
8:331C  668b4606             mov eax, dword ptr [bp + 6]
8:3320  05a201               add ax, 0x1a2
8:3323  6650                 push eax
8:3325  9a06493333           lcall 0x3333, 0x4906  ; sub_s1:4906
8:332A  83c408               add sp, 8
8:332D  68b001               push 0x1b0
8:3330  9a9c178f33           lcall 0x338f, 0x179c  ; operator_new@s1:179C
8:3335  83c402               add sp, 2
8:3338  8946e8               mov word ptr [bp - 0x18], ax
8:333B  8956ea               mov word ptr [bp - 0x16], dx
8:333E  0bd0                 or dx, ax
8:3340  7420                 je 0x3362
8:3342  c45e06               les bx, ptr [bp + 6]
8:3345  6626ff7704           push dword ptr es:[bx + 4]
8:334A  ff76ea               push word ptr [bp - 0x16]
8:334D  50                   push ax
8:334E  9a4c31bb30           lcall 0x30bb, 0x314c  ; sub_s7:314C
8:3353  c45e06               les bx, ptr [bp + 6]
8:3356  268987f601           mov word ptr es:[bx + 0x1f6], ax
8:335B  268997f801           mov word ptr es:[bx + 0x1f8], dx
8:3360  eb0d                 jmp 0x336f
loc_3362:
8:3362  c45e06               les bx, ptr [bp + 6]
8:3365  6626c787f60100000000 mov dword ptr es:[bx + 0x1f6], 0
loc_336F:
8:336F  c45e06               les bx, ptr [bp + 6]
8:3372  66268b4704           mov eax, dword ptr es:[bx + 4]
8:3377  268b5706             mov dx, word ptr es:[bx + 6]
8:337B  668946dc             mov dword ptr [bp - 0x24], eax
8:337F  2af6                 sub dh, dh
8:3381  52                   push dx
8:3382  50                   push ax
8:3383  1e                   push ds
8:3384  681a5a               push 0x5a1a  ; '%5lu'
8:3387  8d46ec               lea ax, [bp - 0x14]
8:338A  16                   push ss
8:338B  50                   push ax
8:338C  9a9c3fb333           lcall 0x33b3, 0x3f9c  ; _fsprintf@s1:3F9C
8:3391  83c40c               add sp, 0xc
8:3394  8d46ec               lea ax, [bp - 0x14]
8:3397  16                   push ss
8:3398  50                   push ax
8:3399  9ae8600d2f           lcall 0x2f0d, 0x60e8  ; sub_s2:60E8
8:339E  83c404               add sp, 4
8:33A1  c45e06               les bx, ptr [bp + 6]
8:33A4  268987fa01           mov word ptr es:[bx + 0x1fa], ax
8:33A9  268997fc01           mov word ptr es:[bx + 0x1fc], dx
8:33AE  6a1e                 push 0x1e
8:33B0  9a9c175c31           lcall 0x315c, 0x179c  ; operator_new@s1:179C
8:33B5  83c402               add sp, 2
8:33B8  8946e8               mov word ptr [bp - 0x18], ax
8:33BB  8956ea               mov word ptr [bp - 0x16], dx
8:33BE  0bd0                 or dx, ax
8:33C0  7420                 je 0x33e2
8:33C2  6668c8000000         push 0xc8
8:33C8  666a64               push 0x64
8:33CB  ff76ea               push word ptr [bp - 0x16]
8:33CE  50                   push ax
8:33CF  9a44c40632           lcall 0x3206, 0xc444  ; sub_s5:C444
8:33D4  c45e06               les bx, ptr [bp + 6]
8:33D7  2689470c             mov word ptr es:[bx + 0xc], ax
8:33DB  2689570e             mov word ptr es:[bx + 0xe], dx
8:33DF  eb0d                 jmp 0x33ee
8:33E1  db 90
loc_33E2:
8:33E2  c45e06               les bx, ptr [bp + 6]
8:33E5  6626c7470c00000000   mov dword ptr es:[bx + 0xc], 0
loc_33EE:
8:33EE  8b4606               mov ax, word ptr [bp + 6]
8:33F1  8b5608               mov dx, word ptr [bp + 8]
8:33F4  c9                   leave
8:33F5  ca0c00               retf 0xc

; ---------------- sub_s8:33F8 FAR size=166 callers=1
8:33F8  c8100000             enter 0x10, 0
8:33FC  56                   push si
8:33FD  c45e06               les bx, ptr [bp + 6]
8:3400  26c7070465           mov word ptr es:[bx], 0x6504
8:3405  26c74702d532         mov word ptr es:[bx + 2], 0x32d5  ; SEGMENT s8:0000
8:340B  268b4714             mov ax, word ptr es:[bx + 0x14]
8:340F  268b5716             mov dx, word ptr es:[bx + 0x16]
8:3413  8bda                 mov bx, dx
8:3415  0bd0                 or dx, ax
8:3417  740e                 je 0x3427
8:3419  6a01                 push 1
8:341B  53                   push bx
8:341C  50                   push ax
8:341D  8ec3                 mov es, bx
8:341F  8bf0                 mov si, ax
8:3421  26c41c               les bx, ptr es:[si]
8:3424  26ff1f               lcall es:[bx]
loc_3427:
8:3427  c45e06               les bx, ptr [bp + 6]
8:342A  268b87f601           mov ax, word ptr es:[bx + 0x1f6]
8:342F  268b97f801           mov dx, word ptr es:[bx + 0x1f8]
8:3434  8bda                 mov bx, dx
8:3436  0bd8                 or bx, ax
8:3438  740e                 je 0x3448
8:343A  6a01                 push 1
8:343C  52                   push dx
8:343D  50                   push ax
8:343E  8ec2                 mov es, dx
8:3440  8bd8                 mov bx, ax
8:3442  26c41f               les bx, ptr es:[bx]
8:3445  26ff1f               lcall es:[bx]
loc_3448:
8:3448  c45e06               les bx, ptr [bp + 6]
8:344B  66268b87fa01         mov eax, dword ptr es:[bx + 0x1fa]
8:3451  6650                 push eax
8:3453  9ace178a34           lcall 0x348a, 0x17ce  ; operator_delete@s1:17CE
8:3458  83c404               add sp, 4
8:345B  c45e06               les bx, ptr [bp + 6]
8:345E  268b871002           mov ax, word ptr es:[bx + 0x210]
8:3463  268b971202           mov dx, word ptr es:[bx + 0x212]
8:3468  8bda                 mov bx, dx
8:346A  0bd0                 or dx, ax
8:346C  740e                 je 0x347c
8:346E  6a01                 push 1
8:3470  53                   push bx
8:3471  50                   push ax
8:3472  8ec3                 mov es, bx
8:3474  8bf0                 mov si, ax
8:3476  26c41c               les bx, ptr es:[si]
8:3479  26ff1f               lcall es:[bx]
loc_347C:
8:347C  c45e06               les bx, ptr [bp + 6]
8:347F  66268b8f1a02         mov ecx, dword ptr es:[bx + 0x21a]
8:3485  6651                 push ecx
8:3487  9ace17e332           lcall 0x32e3, 0x17ce  ; operator_delete@s1:17CE
8:348C  83c404               add sp, 4
8:348F  66ff7606             push dword ptr [bp + 6]
8:3493  9ab2183d32           lcall 0x323d, 0x18b2  ; sub_s7:18B2
8:3498  5e                   pop si
8:3499  c9                   leave
8:349A  ca0400               retf 4
8:349D  db 00

; ---------------- sub_s8:349E FAR size=172 callers=2
8:349E  c8180000             enter 0x18, 0
8:34A2  668b460a             mov eax, dword ptr [bp + 0xa]
8:34A6  c45e06               les bx, ptr [bp + 6]
8:34A9  662689870002         mov dword ptr es:[bx + 0x200], eax
8:34AF  685802               push 0x258
8:34B2  66ff7606             push dword ptr [bp + 6]
8:34B6  90                   nop
8:34B7  0e                   push cs
8:34B8  e85318               call 0x4d0e  ; sub_s8:4D0E
8:34BB  685802               push 0x258
8:34BE  66ff7606             push dword ptr [bp + 6]
8:34C2  90                   nop
8:34C3  0e                   push cs
8:34C4  e84718               call 0x4d0e  ; sub_s8:4D0E
8:34C7  c45e06               les bx, ptr [bp + 6]
8:34CA  26c78704020000       mov word ptr es:[bx + 0x204], 0
8:34D1  c45e06               les bx, ptr [bp + 6]
8:34D4  26c78706020000       mov word ptr es:[bx + 0x206], 0
8:34DB  c45e06               les bx, ptr [bp + 6]
8:34DE  6626ff770c           push dword ptr es:[bx + 0xc]
8:34E3  26c45f0c             les bx, ptr es:[bx + 0xc]
8:34E7  26c41f               les bx, ptr es:[bx]
8:34EA  26ff5f10             lcall es:[bx + 0x10]
8:34EE  8946fc               mov word ptr [bp - 4], ax
8:34F1  8956fe               mov word ptr [bp - 2], dx
8:34F4  66c746f800000000     mov dword ptr [bp - 8], 0
8:34FC  eb04                 jmp 0x3502
loc_34FE:
8:34FE  66ff46f8             inc dword ptr [bp - 8]
loc_3502:
8:3502  668b46fc             mov eax, dword ptr [bp - 4]
8:3506  663946f8             cmp dword ptr [bp - 8], eax
8:350A  733a                 jae 0x3546
8:350C  66ff76f8             push dword ptr [bp - 8]
8:3510  c45e06               les bx, ptr [bp + 6]
8:3513  6626ff770c           push dword ptr es:[bx + 0xc]
8:3518  9a7c1d9634           lcall 0x3496, 0x1d7c  ; sub_s7:1D7C
8:351D  8946ec               mov word ptr [bp - 0x14], ax
8:3520  8956ee               mov word ptr [bp - 0x12], dx
8:3523  0bd0                 or dx, ax
8:3525  74d7                 je 0x34fe
8:3527  66ff7606             push dword ptr [bp + 6]
8:352B  c45eec               les bx, ptr [bp - 0x14]
8:352E  06                   push es
8:352F  50                   push ax
8:3530  26c41f               les bx, ptr es:[bx]
8:3533  26ff5f58             lcall es:[bx + 0x58]
8:3537  c45eec               les bx, ptr [bp - 0x14]
8:353A  6626c7471c00000000   mov dword ptr es:[bx + 0x1c], 0
8:3543  ebb9                 jmp 0x34fe
8:3545  db 90
loc_3546:
8:3546  c9                   leave
8:3547  ca0800               retf 8

; ---------------- sub_s8:354A FAR size=94 callers=1
8:354A  c8040000             enter 4, 0
8:354E  c45e06               les bx, ptr [bp + 6]
8:3551  662683bf1a0200       cmp dword ptr es:[bx + 0x21a], 0
8:3558  753b                 jne 0x3595
8:355A  6a0a                 push 0xa
8:355C  9a9c175634           lcall 0x3456, 0x179c  ; operator_new@s1:179C
8:3561  83c402               add sp, 2
8:3564  8956fe               mov word ptr [bp - 2], dx
8:3567  0bd0                 or dx, ax
8:3569  741d                 je 0x3588
8:356B  66ff7606             push dword ptr [bp + 6]
8:356F  ff76fe               push word ptr [bp - 2]
8:3572  50                   push ax
8:3573  9acc9ea135           lcall 0x35a1, 0x9ecc  ; sub_s7:9ECC
8:3578  c45e06               les bx, ptr [bp + 6]
8:357B  2689871a02           mov word ptr es:[bx + 0x21a], ax
8:3580  2689971c02           mov word ptr es:[bx + 0x21c], dx
8:3585  eb0e                 jmp 0x3595
8:3587  db 90
loc_3588:
8:3588  c45e06               les bx, ptr [bp + 6]
8:358B  6626c7871a0200000000 mov dword ptr es:[bx + 0x21a], 0
loc_3595:
8:3595  c45e06               les bx, ptr [bp + 6]
8:3598  6626ffb71a02         push dword ptr es:[bx + 0x21a]
8:359E  9af29e1b35           lcall 0x351b, 0x9ef2  ; sub_s7:9EF2
8:35A3  c9                   leave
8:35A4  ca0400               retf 4
8:35A7  db 00

; ---------------- sub_s8:35A8 FAR size=96 callers=1
8:35A8  c8040000             enter 4, 0
8:35AC  c45e06               les bx, ptr [bp + 6]
8:35AF  662683bf1a0200       cmp dword ptr es:[bx + 0x21a], 0
8:35B6  753b                 jne 0x35f3
8:35B8  6a0a                 push 0xa
8:35BA  9a9c175f35           lcall 0x355f, 0x179c  ; operator_new@s1:179C
8:35BF  83c402               add sp, 2
8:35C2  8956fe               mov word ptr [bp - 2], dx
8:35C5  0bd0                 or dx, ax
8:35C7  741d                 je 0x35e6
8:35C9  66ff7606             push dword ptr [bp + 6]
8:35CD  ff76fe               push word ptr [bp - 2]
8:35D0  50                   push ax
8:35D1  9acc9e0236           lcall 0x3602, 0x9ecc  ; sub_s7:9ECC
8:35D6  c45e06               les bx, ptr [bp + 6]
8:35D9  2689871a02           mov word ptr es:[bx + 0x21a], ax
8:35DE  2689971c02           mov word ptr es:[bx + 0x21c], dx
8:35E3  eb0e                 jmp 0x35f3
8:35E5  db 90
loc_35E6:
8:35E6  c45e06               les bx, ptr [bp + 6]
8:35E9  6626c7871a0200000000 mov dword ptr es:[bx + 0x21a], 0
loc_35F3:
8:35F3  ff760a               push word ptr [bp + 0xa]
8:35F6  c45e06               les bx, ptr [bp + 6]
8:35F9  6626ffb71a02         push dword ptr es:[bx + 0x21a]
8:35FF  9a409f7635           lcall 0x3576, 0x9f40  ; sub_s7:9F40
8:3604  c9                   leave
8:3605  ca0600               retf 6

; ---------------- sub_s8:3608 FAR size=38 callers=2
8:3608  c8080000             enter 8, 0
8:360C  c45e06               les bx, ptr [bp + 6]
8:360F  66268b871a02         mov eax, dword ptr es:[bx + 0x21a]
8:3615  6650                 push eax
8:3617  9ace17bd35           lcall 0x35bd, 0x17ce  ; operator_delete@s1:17CE
8:361C  c45e06               les bx, ptr [bp + 6]
8:361F  6626c7871a0200000000 mov dword ptr es:[bx + 0x21a], 0
8:3629  c9                   leave
8:362A  ca0400               retf 4
8:362D  db 00

; ---------------- sub_s8:362E FAR size=106 callers=1
8:362E  c8040000             enter 4, 0
8:3632  c45e06               les bx, ptr [bp + 6]
8:3635  2683bf140200         cmp word ptr es:[bx + 0x214], 0
8:363B  7556                 jne 0x3693
8:363D  6a1f                 push 0x1f
8:363F  06                   push es
8:3640  53                   push bx
8:3641  90                   nop
8:3642  0e                   push cs
8:3643  e80e19               call 0x4f54  ; sub_s8:4F54
8:3646  0bc0                 or ax, ax
8:3648  740c                 je 0x3656
8:364A  c45e06               les bx, ptr [bp + 6]
8:364D  26c78714022800       mov word ptr es:[bx + 0x214], 0x28
8:3654  eb0a                 jmp 0x3660
loc_3656:
8:3656  c45e06               les bx, ptr [bp + 6]
8:3659  26c78714021400       mov word ptr es:[bx + 0x214], 0x14
loc_3660:
8:3660  6a37                 push 0x37
8:3662  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:3667  9aba20f22e           lcall 0x2ef2, 0x20ba  ; sub_s3:20BA
8:366C  6a38                 push 0x38
8:366E  c45e06               les bx, ptr [bp + 6]
8:3671  6626ff7704           push dword ptr es:[bx + 4]
8:3676  666800000100         push 0x10000
8:367C  666a00               push 0
8:367F  52                   push dx
8:3680  50                   push ax
8:3681  9ae4a09c33           lcall 0x339c, 0xa0e4  ; sub_s2:A0E4
8:3686  c45e06               les bx, ptr [bp + 6]
8:3689  6626c787160200000000 mov dword ptr es:[bx + 0x216], 0
loc_3693:
8:3693  c9                   leave
8:3694  ca0400               retf 4
8:3697  db 00

; ---------------- sub_s8:3698 FAR size=486 callers=1
8:3698  c81e0000             enter 0x1e, 0
8:369C  c45e06               les bx, ptr [bp + 6]
8:369F  2683bf140200         cmp word ptr es:[bx + 0x214], 0
8:36A5  0f84d101             je 0x387a
8:36A9  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:36AF  9ab838ed37           lcall 0x37ed, 0x38b8  ; sub_s7:38B8
8:36B4  8946fc               mov word ptr [bp - 4], ax
8:36B7  8956fe               mov word ptr [bp - 2], dx
8:36BA  c45e06               les bx, ptr [bp + 6]
8:36BD  66268b871602         mov eax, dword ptr es:[bx + 0x216]
8:36C3  662946fc             sub dword ptr [bp - 4], eax
8:36C7  66837efc00           cmp dword ptr [bp - 4], 0
8:36CC  7f0a                 jg 0x36d8
loc_36CE:
8:36CE  26ff8f1402           dec word ptr es:[bx + 0x214]
8:36D3  c9                   leave
8:36D4  ca0400               retf 4
8:36D7  db 90
loc_36D8:
8:36D8  668b46fc             mov eax, dword ptr [bp - 4]
8:36DC  660503000000         add eax, 3
8:36E2  66b905000000         mov ecx, 5
8:36E8  6699                 cdq
8:36EA  66f7f9               idiv ecx
8:36ED  668946f8             mov dword ptr [bp - 8], eax
8:36F1  c45e06               les bx, ptr [bp + 6]
8:36F4  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:36FA  7412                 je 0x370e
8:36FC  6626ff770c           push dword ptr es:[bx + 0xc]
8:3701  26c45f0c             les bx, ptr es:[bx + 0xc]
8:3705  26c41f               les bx, ptr es:[bx]
8:3708  26ff5f10             lcall es:[bx + 0x10]
8:370C  eb03                 jmp 0x3711
loc_370E:
8:370E  33c0                 xor ax, ax
8:3710  99                   cdq
loc_3711:
8:3711  8946f4               mov word ptr [bp - 0xc], ax
8:3714  8956f6               mov word ptr [bp - 0xa], dx
8:3717  66c746f000000000     mov dword ptr [bp - 0x10], 0
8:371F  e92e01               jmp 0x3850
loc_3722:
8:3722  c45eec               les bx, ptr [bp - 0x14]
8:3725  268b470c             mov ax, word ptr es:[bx + 0xc]
8:3729  6a04                 push 4
8:372B  50                   push ax
8:372C  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:3731  9aaec68436           lcall 0x3684, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:3736  0bc0                 or ax, ax
8:3738  0f849e00             je 0x37da
8:373C  6a0f                 push 0xf
8:373E  668b46ec             mov eax, dword ptr [bp - 0x14]
8:3742  668946e6             mov dword ptr [bp - 0x1a], eax
8:3746  6650                 push eax
8:3748  9a8c677137           lcall 0x3771, 0x678c  ; sub_s6:678C
8:374D  8946e2               mov word ptr [bp - 0x1e], ax
8:3750  8956e4               mov word ptr [bp - 0x1c], dx
8:3753  0bd0                 or dx, ax
8:3755  0f848100             je 0x37da
8:3759  668b46f8             mov eax, dword ptr [bp - 8]
8:375D  8b56fa               mov dx, word ptr [bp - 6]
8:3760  663946e2             cmp dword ptr [bp - 0x1e], eax
8:3764  7e3a                 jle 0x37a0
8:3766  52                   push dx
8:3767  50                   push ax
8:3768  6a0f                 push 0xf
8:376A  66ff76ec             push dword ptr [bp - 0x14]
8:376E  9a5663ad37           lcall 0x37ad, 0x6356  ; sub_s6:6356
8:3773  8b46f8               mov ax, word ptr [bp - 8]
8:3776  8b56fa               mov dx, word ptr [bp - 6]
8:3779  8bc8                 mov cx, ax
8:377B  8bda                 mov bx, dx
8:377D  03c0                 add ax, ax
8:377F  13d2                 adc dx, dx
8:3781  03c0                 add ax, ax
8:3783  13d2                 adc dx, dx
8:3785  03c1                 add ax, cx
8:3787  13d3                 adc dx, bx
8:3789  c45e06               les bx, ptr [bp + 6]
8:378C  2601871602           add word ptr es:[bx + 0x216], ax
8:3791  2611971802           adc word ptr es:[bx + 0x218], dx
8:3796  66c746f800000000     mov dword ptr [bp - 8], 0
8:379E  eb3a                 jmp 0x37da
loc_37A0:
8:37A0  66ff76e2             push dword ptr [bp - 0x1e]
8:37A4  6a0f                 push 0xf
8:37A6  66ff76e6             push dword ptr [bp - 0x1a]
8:37AA  9a5663b82e           lcall 0x2eb8, 0x6356  ; sub_s6:6356
8:37AF  8b46e2               mov ax, word ptr [bp - 0x1e]
8:37B2  8b56e4               mov dx, word ptr [bp - 0x1c]
8:37B5  8bc8                 mov cx, ax
8:37B7  8bda                 mov bx, dx
8:37B9  03c0                 add ax, ax
8:37BB  13d2                 adc dx, dx
8:37BD  03c0                 add ax, ax
8:37BF  13d2                 adc dx, dx
8:37C1  03c1                 add ax, cx
8:37C3  13d3                 adc dx, bx
8:37C5  c45e06               les bx, ptr [bp + 6]
8:37C8  2601871602           add word ptr es:[bx + 0x216], ax
8:37CD  2611971802           adc word ptr es:[bx + 0x218], dx
8:37D2  668b46e2             mov eax, dword ptr [bp - 0x1e]
8:37D6  662946f8             sub dword ptr [bp - 8], eax
loc_37DA:
8:37DA  66837ef800           cmp dword ptr [bp - 8], 0
8:37DF  756b                 jne 0x384c
loc_37E1:
8:37E1  c45e06               les bx, ptr [bp + 6]
8:37E4  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:37EA  9ab8384438           lcall 0x3844, 0x38b8  ; sub_s7:38B8
8:37EF  8946fc               mov word ptr [bp - 4], ax
8:37F2  8956fe               mov word ptr [bp - 2], dx
8:37F5  c45e06               les bx, ptr [bp + 6]
8:37F8  66268b871602         mov eax, dword ptr es:[bx + 0x216]
8:37FE  662946fc             sub dword ptr [bp - 4], eax
8:3802  8b46fe               mov ax, word ptr [bp - 2]
8:3805  0b46fc               or ax, word ptr [bp - 4]
8:3808  743c                 je 0x3846
8:380A  66260fbf871402       movsx eax, word ptr es:[bx + 0x214]
8:3811  6650                 push eax
8:3813  668b46fc             mov eax, dword ptr [bp - 4]
8:3817  6659                 pop ecx
8:3819  6699                 cdq
8:381B  66f7f9               idiv ecx
8:381E  668946e2             mov dword ptr [bp - 0x1e], eax
8:3822  663d00000000         cmp eax, 0
8:3828  7f08                 jg 0x3832
8:382A  66c746e201000000     mov dword ptr [bp - 0x1e], 1
loc_3832:
8:3832  66ff76e2             push dword ptr [bp - 0x1e]
8:3836  6a00                 push 0
8:3838  c45e06               les bx, ptr [bp + 6]
8:383B  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:3841  9a5a376938           lcall 0x3869, 0x375a  ; sub_s7:375A
loc_3846:
8:3846  c45e06               les bx, ptr [bp + 6]
8:3849  e982fe               jmp 0x36ce
loc_384C:
8:384C  66ff46f0             inc dword ptr [bp - 0x10]
loc_3850:
8:3850  668b46f4             mov eax, dword ptr [bp - 0xc]
8:3854  663946f0             cmp dword ptr [bp - 0x10], eax
8:3858  7387                 jae 0x37e1
8:385A  66ff76f0             push dword ptr [bp - 0x10]
8:385E  c45e06               les bx, ptr [bp + 6]
8:3861  6626ff770c           push dword ptr es:[bx + 0xc]
8:3866  9a7c1dd435           lcall 0x35d4, 0x1d7c  ; sub_s7:1D7C
8:386B  8946ec               mov word ptr [bp - 0x14], ax
8:386E  8956ee               mov word ptr [bp - 0x12], dx
8:3871  0bd0                 or dx, ax
8:3873  0f85abfe             jne 0x3722
8:3877  ebd3                 jmp 0x384c
8:3879  db 90
loc_387A:
8:387A  c9                   leave
8:387B  ca0400               retf 4

; ---------------- sub_s8:387E FAR size=552 callers=2
8:387E  c8140000             enter 0x14, 0
8:3882  8b460c               mov ax, word ptr [bp + 0xc]
8:3885  39460a               cmp word ptr [bp + 0xa], ax
8:3888  0f841502             je 0x3aa1
8:388C  0f8d0c01             jge 0x399c
8:3890  2b460a               sub ax, word ptr [bp + 0xa]
8:3893  8946f6               mov word ptr [bp - 0xa], ax
8:3896  c45e06               les bx, ptr [bp + 6]
8:3899  662683bf100200       cmp dword ptr es:[bx + 0x210], 0
8:38A0  740f                 je 0x38b1
8:38A2  26c49f1002           les bx, ptr es:[bx + 0x210]
8:38A7  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
8:38AD  0f858300             jne 0x3934
loc_38B1:
8:38B1  c45e06               les bx, ptr [bp + 6]
8:38B4  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:38BA  7412                 je 0x38ce
8:38BC  6626ff770c           push dword ptr es:[bx + 0xc]
8:38C1  26c45f0c             les bx, ptr es:[bx + 0xc]
8:38C5  26c41f               les bx, ptr es:[bx]
8:38C8  26ff5f10             lcall es:[bx + 0x10]
8:38CC  eb03                 jmp 0x38d1
loc_38CE:
8:38CE  33c0                 xor ax, ax
8:38D0  99                   cdq
loc_38D1:
8:38D1  8946fc               mov word ptr [bp - 4], ax
8:38D4  8956fe               mov word ptr [bp - 2], dx
8:38D7  66c746f800000000     mov dword ptr [bp - 8], 0
8:38DF  eb05                 jmp 0x38e6
8:38E1  db 90
loc_38E2:
8:38E2  66ff46f8             inc dword ptr [bp - 8]
loc_38E6:
8:38E6  668b46fc             mov eax, dword ptr [bp - 4]
8:38EA  663946f8             cmp dword ptr [bp - 8], eax
8:38EE  0f83af01             jae 0x3aa1
8:38F2  66ff76f8             push dword ptr [bp - 8]
8:38F6  c45e06               les bx, ptr [bp + 6]
8:38F9  6626ff770c           push dword ptr es:[bx + 0xc]
8:38FE  9a581d1439           lcall 0x3914, 0x1d58  ; sub_s7:1D58
8:3903  8946ee               mov word ptr [bp - 0x12], ax
8:3906  8956f0               mov word ptr [bp - 0x10], dx
8:3909  0bd0                 or dx, ax
8:390B  74d5                 je 0x38e2
8:390D  ff76f0               push word ptr [bp - 0x10]
8:3910  50                   push ax
8:3911  9aa06f2e39           lcall 0x392e, 0x6fa0  ; sub_s7:6FA0
8:3916  8946ec               mov word ptr [bp - 0x14], ax
8:3919  3d0b00               cmp ax, 0xb
8:391C  75c4                 jne 0x38e2
8:391E  6a04                 push 4
8:3920  660fbf46f6           movsx eax, word ptr [bp - 0xa]
8:3925  6650                 push eax
8:3927  66ff76ee             push dword ptr [bp - 0x12]
8:392B  9a507c7039           lcall 0x3970, 0x7c50  ; sub_s7:7C50
8:3930  c9                   leave
8:3931  ca0c00               retf 0xc
loc_3934:
8:3934  c45e06               les bx, ptr [bp + 6]
8:3937  26c49f1002           les bx, ptr es:[bx + 0x210]
8:393C  66268b470a           mov eax, dword ptr es:[bx + 0xa]
8:3941  668946fc             mov dword ptr [bp - 4], eax
8:3945  66c746f800000000     mov dword ptr [bp - 8], 0
8:394D  eb05                 jmp 0x3954
8:394F  db 90
loc_3950:
8:3950  66ff46f8             inc dword ptr [bp - 8]
loc_3954:
8:3954  668b46fc             mov eax, dword ptr [bp - 4]
8:3958  663946f8             cmp dword ptr [bp - 8], eax
8:395C  0f834101             jae 0x3aa1
8:3960  66ff76f8             push dword ptr [bp - 8]
8:3964  c45e06               les bx, ptr [bp + 6]
8:3967  6626ffb71002         push dword ptr es:[bx + 0x210]
8:396D  9a12138939           lcall 0x3989, 0x1312  ; sub_s7:1312
8:3972  8956f0               mov word ptr [bp - 0x10], dx
8:3975  0bd0                 or dx, ax
8:3977  74d7                 je 0x3950
8:3979  6a04                 push 4
8:397B  66ff760e             push dword ptr [bp + 0xe]
8:397F  ff76f6               push word ptr [bp - 0xa]
8:3982  ff76f0               push word ptr [bp - 0x10]
8:3985  50                   push ax
8:3986  9a44cc113a           lcall 0x3a11, 0xcc44  ; sub_s7:CC44
8:398B  8946ec               mov word ptr [bp - 0x14], ax
8:398E  0bc0                 or ax, ax
8:3990  74be                 je 0x3950
8:3992  2946f6               sub word ptr [bp - 0xa], ax
8:3995  75b9                 jne 0x3950
8:3997  c9                   leave
8:3998  ca0c00               retf 0xc
8:399B  db 90
loc_399C:
8:399C  8b460a               mov ax, word ptr [bp + 0xa]
8:399F  2b460c               sub ax, word ptr [bp + 0xc]
8:39A2  8946ec               mov word ptr [bp - 0x14], ax
8:39A5  c45e06               les bx, ptr [bp + 6]
8:39A8  662683bf100200       cmp dword ptr es:[bx + 0x210], 0
8:39AF  740f                 je 0x39c0
8:39B1  26c49f1002           les bx, ptr es:[bx + 0x210]
8:39B6  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
8:39BC  0f858400             jne 0x3a44
loc_39C0:
8:39C0  c45e06               les bx, ptr [bp + 6]
8:39C3  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:39C9  7413                 je 0x39de
8:39CB  6626ff770c           push dword ptr es:[bx + 0xc]
8:39D0  26c45f0c             les bx, ptr es:[bx + 0xc]
8:39D4  26c41f               les bx, ptr es:[bx]
8:39D7  26ff5f10             lcall es:[bx + 0x10]
8:39DB  eb04                 jmp 0x39e1
8:39DD  db 90
loc_39DE:
8:39DE  33c0                 xor ax, ax
8:39E0  99                   cdq
loc_39E1:
8:39E1  8946fc               mov word ptr [bp - 4], ax
8:39E4  8956fe               mov word ptr [bp - 2], dx
8:39E7  66c746f800000000     mov dword ptr [bp - 8], 0
8:39EF  eb05                 jmp 0x39f6
8:39F1  db 90
loc_39F2:
8:39F2  66ff46f8             inc dword ptr [bp - 8]
loc_39F6:
8:39F6  668b46fc             mov eax, dword ptr [bp - 4]
8:39FA  663946f8             cmp dword ptr [bp - 8], eax
8:39FE  0f839f00             jae 0x3aa1
8:3A02  66ff76f8             push dword ptr [bp - 8]
8:3A06  c45e06               les bx, ptr [bp + 6]
8:3A09  6626ff770c           push dword ptr es:[bx + 0xc]
8:3A0E  9a581d243a           lcall 0x3a24, 0x1d58  ; sub_s7:1D58
8:3A13  8946f2               mov word ptr [bp - 0xe], ax
8:3A16  8956f4               mov word ptr [bp - 0xc], dx
8:3A19  0bd0                 or dx, ax
8:3A1B  74d5                 je 0x39f2
8:3A1D  ff76f4               push word ptr [bp - 0xc]
8:3A20  50                   push ax
8:3A21  9aa06f3e3a           lcall 0x3a3e, 0x6fa0  ; sub_s7:6FA0
8:3A26  8946f6               mov word ptr [bp - 0xa], ax
8:3A29  3d0b00               cmp ax, 0xb
8:3A2C  75c4                 jne 0x39f2
8:3A2E  6a04                 push 4
8:3A30  660fbf46ec           movsx eax, word ptr [bp - 0x14]
8:3A35  6650                 push eax
8:3A37  66ff76f2             push dword ptr [bp - 0xe]
8:3A3B  9a9c6e7e3a           lcall 0x3a7e, 0x6e9c  ; sub_s7:6E9C
8:3A40  c9                   leave
8:3A41  ca0c00               retf 0xc
loc_3A44:
8:3A44  c45e06               les bx, ptr [bp + 6]
8:3A47  26c49f1002           les bx, ptr es:[bx + 0x210]
8:3A4C  66268b470a           mov eax, dword ptr es:[bx + 0xa]
8:3A51  668946fc             mov dword ptr [bp - 4], eax
8:3A55  66c746f800000000     mov dword ptr [bp - 8], 0
8:3A5D  eb05                 jmp 0x3a64
8:3A5F  db 90
loc_3A60:
8:3A60  66ff46f8             inc dword ptr [bp - 8]
loc_3A64:
8:3A64  668b46fc             mov eax, dword ptr [bp - 4]
8:3A68  663946f8             cmp dword ptr [bp - 8], eax
8:3A6C  7333                 jae 0x3aa1
8:3A6E  66ff76f8             push dword ptr [bp - 8]
8:3A72  c45e06               les bx, ptr [bp + 6]
8:3A75  6626ffb71002         push dword ptr es:[bx + 0x210]
8:3A7B  9a1213973a           lcall 0x3a97, 0x1312  ; sub_s7:1312
8:3A80  8956f4               mov word ptr [bp - 0xc], dx
8:3A83  0bd0                 or dx, ax
8:3A85  74d9                 je 0x3a60
8:3A87  6a04                 push 4
8:3A89  66ff760e             push dword ptr [bp + 0xe]
8:3A8D  ff76ec               push word ptr [bp - 0x14]
8:3A90  ff76f4               push word ptr [bp - 0xc]
8:3A93  50                   push ax
8:3A94  9a72ceb236           lcall 0x36b2, 0xce72  ; sub_s7:CE72
8:3A99  8946f6               mov word ptr [bp - 0xa], ax
8:3A9C  2946ec               sub word ptr [bp - 0x14], ax
8:3A9F  75bf                 jne 0x3a60
loc_3AA1:
8:3AA1  c9                   leave
8:3AA2  ca0c00               retf 0xc
8:3AA5  db 00

; ---------------- sub_s8:3AA6 FAR size=250 callers=1
8:3AA6  c8140000             enter 0x14, 0
8:3AAA  c746fe0000           mov word ptr [bp - 2], 0
8:3AAF  c45e06               les bx, ptr [bp + 6]
8:3AB2  662683bf100200       cmp dword ptr es:[bx + 0x210], 0
8:3AB9  740d                 je 0x3ac8
8:3ABB  26c49f1002           les bx, ptr es:[bx + 0x210]
8:3AC0  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
8:3AC6  757c                 jne 0x3b44
loc_3AC8:
8:3AC8  c45e06               les bx, ptr [bp + 6]
8:3ACB  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:3AD1  7413                 je 0x3ae6
8:3AD3  6626ff770c           push dword ptr es:[bx + 0xc]
8:3AD8  26c45f0c             les bx, ptr es:[bx + 0xc]
8:3ADC  26c41f               les bx, ptr es:[bx]
8:3ADF  26ff5f10             lcall es:[bx + 0x10]
8:3AE3  eb04                 jmp 0x3ae9
8:3AE5  db 90
loc_3AE6:
8:3AE6  33c0                 xor ax, ax
8:3AE8  99                   cdq
loc_3AE9:
8:3AE9  8946fa               mov word ptr [bp - 6], ax
8:3AEC  8956fc               mov word ptr [bp - 4], dx
8:3AEF  66c746f600000000     mov dword ptr [bp - 0xa], 0
8:3AF7  eb05                 jmp 0x3afe
8:3AF9  db 90
loc_3AFA:
8:3AFA  66ff46f6             inc dword ptr [bp - 0xa]
loc_3AFE:
8:3AFE  668b46fa             mov eax, dword ptr [bp - 6]
8:3B02  663946f6             cmp dword ptr [bp - 0xa], eax
8:3B06  0f838e00             jae 0x3b98
8:3B0A  66ff76f6             push dword ptr [bp - 0xa]
8:3B0E  c45e06               les bx, ptr [bp + 6]
8:3B11  6626ff770c           push dword ptr es:[bx + 0xc]
8:3B16  9a581d2c3b           lcall 0x3b2c, 0x1d58  ; sub_s7:1D58
8:3B1B  8946ee               mov word ptr [bp - 0x12], ax
8:3B1E  8956f0               mov word ptr [bp - 0x10], dx
8:3B21  0bd0                 or dx, ax
8:3B23  74d5                 je 0x3afa
8:3B25  ff76f0               push word ptr [bp - 0x10]
8:3B28  50                   push ax
8:3B29  9aa06f3c3b           lcall 0x3b3c, 0x6fa0  ; sub_s7:6FA0
8:3B2E  3d0b00               cmp ax, 0xb
8:3B31  75c7                 jne 0x3afa
8:3B33  6a04                 push 4
8:3B35  66ff76ee             push dword ptr [bp - 0x12]
8:3B39  9a866b7e3b           lcall 0x3b7e, 0x6b86  ; sub_s7:6B86
8:3B3E  8946fe               mov word ptr [bp - 2], ax
8:3B41  eb55                 jmp 0x3b98
8:3B43  db 90
loc_3B44:
8:3B44  c45e06               les bx, ptr [bp + 6]
8:3B47  26c49f1002           les bx, ptr es:[bx + 0x210]
8:3B4C  66268b470a           mov eax, dword ptr es:[bx + 0xa]
8:3B51  668946fa             mov dword ptr [bp - 6], eax
8:3B55  66c746f600000000     mov dword ptr [bp - 0xa], 0
8:3B5D  eb05                 jmp 0x3b64
8:3B5F  db 90
loc_3B60:
8:3B60  66ff46f6             inc dword ptr [bp - 0xa]
loc_3B64:
8:3B64  668b46fa             mov eax, dword ptr [bp - 6]
8:3B68  663946f6             cmp dword ptr [bp - 0xa], eax
8:3B6C  732a                 jae 0x3b98
8:3B6E  66ff76f6             push dword ptr [bp - 0xa]
8:3B72  c45e06               les bx, ptr [bp + 6]
8:3B75  6626ffb71002         push dword ptr es:[bx + 0x210]
8:3B7B  9a1213903b           lcall 0x3b90, 0x1312  ; sub_s7:1312
8:3B80  8956f0               mov word ptr [bp - 0x10], dx
8:3B83  0bd0                 or dx, ax
8:3B85  74d9                 je 0x3b60
8:3B87  6a04                 push 4
8:3B89  ff76f0               push word ptr [bp - 0x10]
8:3B8C  50                   push ax
8:3B8D  9a2ece0139           lcall 0x3901, 0xce2e  ; sub_s7:CE2E
8:3B92  0146fe               add word ptr [bp - 2], ax
8:3B95  ebc9                 jmp 0x3b60
8:3B97  db 90
loc_3B98:
8:3B98  8b46fe               mov ax, word ptr [bp - 2]
8:3B9B  c9                   leave
8:3B9C  ca0400               retf 4
8:3B9F  db 00

; ---------------- sub_s8:3BA0 FAR size=288 callers=2
8:3BA0  c8220000             enter 0x22, 0
8:3BA4  56                   push si
8:3BA5  c45e06               les bx, ptr [bp + 6]
8:3BA8  268b871002           mov ax, word ptr es:[bx + 0x210]
8:3BAD  268b971202           mov dx, word ptr es:[bx + 0x212]
8:3BB2  8bda                 mov bx, dx
8:3BB4  8946e6               mov word ptr [bp - 0x1a], ax
8:3BB7  8956e8               mov word ptr [bp - 0x18], dx
8:3BBA  0bd8                 or bx, ax
8:3BBC  740e                 je 0x3bcc
8:3BBE  6a01                 push 1
8:3BC0  52                   push dx
8:3BC1  50                   push ax
8:3BC2  8ec2                 mov es, dx
8:3BC4  8bd8                 mov bx, ax
8:3BC6  26c41f               les bx, ptr es:[bx]
8:3BC9  26ff1f               lcall es:[bx]
loc_3BCC:
8:3BCC  6a1e                 push 0x1e
8:3BCE  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:3BD3  9afac63437           lcall 0x3734, 0xc6fa  ; sub_s2:C6FA
8:3BD8  52                   push dx
8:3BD9  50                   push ax
8:3BDA  66ff7606             push dword ptr [bp + 6]
8:3BDE  90                   nop
8:3BDF  0e                   push cs
8:3BE0  e88b11               call 0x4d6e  ; sub_s8:4D6E
8:3BE3  8946f8               mov word ptr [bp - 8], ax
8:3BE6  8956fa               mov word ptr [bp - 6], dx
8:3BE9  52                   push dx
8:3BEA  c45ef8               les bx, ptr [bp - 8]
8:3BED  50                   push ax
8:3BEE  26c41f               les bx, ptr es:[bx]
8:3BF1  26ff5f10             lcall es:[bx + 0x10]
8:3BF5  8946f4               mov word ptr [bp - 0xc], ax
8:3BF8  8956f6               mov word ptr [bp - 0xa], dx
8:3BFB  0bd2                 or dx, dx
8:3BFD  750a                 jne 0x3c09
8:3BFF  7205                 jb 0x3c06
8:3C01  3d0500               cmp ax, 5
8:3C04  7303                 jae 0x3c09
loc_3C06:
8:3C06  b80500               mov ax, 5
loc_3C09:
8:3C09  40                   inc ax
8:3C0A  6a1c                 push 0x1c
8:3C0C  8bf0                 mov si, ax
8:3C0E  9a9c171a36           lcall 0x361a, 0x179c  ; operator_new@s1:179C
8:3C13  83c402               add sp, 2
8:3C16  8946e6               mov word ptr [bp - 0x1a], ax
8:3C19  8956e8               mov word ptr [bp - 0x18], dx
8:3C1C  0bd0                 or dx, ax
8:3C1E  7420                 je 0x3c40
8:3C20  8bc6                 mov ax, si
8:3C22  99                   cdq
8:3C23  52                   push dx
8:3C24  56                   push si
8:3C25  666a05               push 5
8:3C28  66ff76e6             push dword ptr [bp - 0x1a]
8:3C2C  9aaa117b3c           lcall 0x3c7b, 0x11aa  ; sub_s7:11AA
8:3C31  c45e06               les bx, ptr [bp + 6]
8:3C34  2689871002           mov word ptr es:[bx + 0x210], ax
8:3C39  2689971202           mov word ptr es:[bx + 0x212], dx
8:3C3E  eb0d                 jmp 0x3c4d
loc_3C40:
8:3C40  c45e06               les bx, ptr [bp + 6]
8:3C43  6626c787100200000000 mov dword ptr es:[bx + 0x210], 0
loc_3C4D:
8:3C4D  c45e06               les bx, ptr [bp + 6]
8:3C50  26c49f1002           les bx, ptr es:[bx + 0x210]
8:3C55  662bc0               sub eax, eax
8:3C58  2689471a             mov word ptr es:[bx + 0x1a], ax
8:3C5C  668946ee             mov dword ptr [bp - 0x12], eax
8:3C60  eb04                 jmp 0x3c66
loc_3C62:
8:3C62  66ff46ee             inc dword ptr [bp - 0x12]
loc_3C66:
8:3C66  668b46f4             mov eax, dword ptr [bp - 0xc]
8:3C6A  663946ee             cmp dword ptr [bp - 0x12], eax
8:3C6E  7334                 jae 0x3ca4
8:3C70  66ff76ee             push dword ptr [bp - 0x12]
8:3C74  66ff76f8             push dword ptr [bp - 8]
8:3C78  9a7c1d9f3c           lcall 0x3c9f, 0x1d7c  ; sub_s7:1D7C
8:3C7D  8946e0               mov word ptr [bp - 0x20], ax
8:3C80  8956e2               mov word ptr [bp - 0x1e], dx
8:3C83  0bd0                 or dx, ax
8:3C85  74db                 je 0x3c62
8:3C87  668b46ee             mov eax, dword ptr [bp - 0x12]
8:3C8B  6640                 inc eax
8:3C8D  6650                 push eax
8:3C8F  66ff76e0             push dword ptr [bp - 0x20]
8:3C93  c45e06               les bx, ptr [bp + 6]
8:3C96  6626ffb71002         push dword ptr es:[bx + 0x210]
8:3C9C  9a5813193b           lcall 0x3b19, 0x1358  ; sub_s7:1358
8:3CA1  ebbf                 jmp 0x3c62
8:3CA3  db 90
loc_3CA4:
8:3CA4  668b46f8             mov eax, dword ptr [bp - 8]
8:3CA8  660bc0               or eax, eax
8:3CAB  740d                 je 0x3cba
8:3CAD  6a01                 push 1
8:3CAF  c45ef8               les bx, ptr [bp - 8]
8:3CB2  06                   push es
8:3CB3  50                   push ax
8:3CB4  26c41f               les bx, ptr es:[bx]
8:3CB7  26ff1f               lcall es:[bx]
loc_3CBA:
8:3CBA  5e                   pop si
8:3CBB  c9                   leave
8:3CBC  ca0400               retf 4
8:3CBF  db 00

; ---------------- sub_s8:3CC0 FAR size=572 callers=1
8:3CC0  c8240000             enter 0x24, 0
8:3CC4  8b460e               mov ax, word ptr [bp + 0xe]
8:3CC7  2d1e00               sub ax, 0x1e
8:3CCA  7448                 je 0x3d14
8:3CCC  2d0300               sub ax, 3
8:3CCF  0f841701             je 0x3dea
8:3CD3  6a03                 push 3
8:3CD5  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:3CDA  9afac61e3d           lcall 0x3d1e, 0xc6fa  ; sub_s2:C6FA
8:3CDF  8946e4               mov word ptr [bp - 0x1c], ax
8:3CE2  8956e6               mov word ptr [bp - 0x1a], dx
8:3CE5  52                   push dx
8:3CE6  50                   push ax
8:3CE7  66ff7606             push dword ptr [bp + 6]
8:3CEB  90                   nop
8:3CEC  0e                   push cs
8:3CED  e88811               call 0x4e78  ; sub_s8:4E78
8:3CF0  8946e8               mov word ptr [bp - 0x18], ax
8:3CF3  8956ea               mov word ptr [bp - 0x16], dx
8:3CF6  52                   push dx
8:3CF7  c45ee8               les bx, ptr [bp - 0x18]
8:3CFA  50                   push ax
8:3CFB  26c41f               les bx, ptr es:[bx]
8:3CFE  26ff5f10             lcall es:[bx + 0x10]
8:3D02  8946ec               mov word ptr [bp - 0x14], ax
8:3D05  8956ee               mov word ptr [bp - 0x12], dx
8:3D08  66c746f000000000     mov dword ptr [bp - 0x10], 0
8:3D10  e98901               jmp 0x3e9c
8:3D13  db 90
loc_3D14:
8:3D14  6a27                 push 0x27
8:3D16  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:3D1B  9afac6f43d           lcall 0x3df4, 0xc6fa  ; sub_s2:C6FA
8:3D20  8946fc               mov word ptr [bp - 4], ax
8:3D23  8956fe               mov word ptr [bp - 2], dx
8:3D26  52                   push dx
8:3D27  50                   push ax
8:3D28  66ff7606             push dword ptr [bp + 6]
8:3D2C  90                   nop
8:3D2D  0e                   push cs
8:3D2E  e84711               call 0x4e78  ; sub_s8:4E78
8:3D31  8946f8               mov word ptr [bp - 8], ax
8:3D34  8956fa               mov word ptr [bp - 6], dx
8:3D37  52                   push dx
8:3D38  c45ef8               les bx, ptr [bp - 8]
8:3D3B  50                   push ax
8:3D3C  26c41f               les bx, ptr es:[bx]
8:3D3F  26ff5f10             lcall es:[bx + 0x10]
8:3D43  8946f4               mov word ptr [bp - 0xc], ax
8:3D46  8956f6               mov word ptr [bp - 0xa], dx
8:3D49  66c746f000000000     mov dword ptr [bp - 0x10], 0
8:3D51  eb1d                 jmp 0x3d70
8:3D53  db 90
loc_3D54:
8:3D54  ff760e               push word ptr [bp + 0xe]
8:3D57  66ff76e8             push dword ptr [bp - 0x18]
8:3D5B  66ff76e4             push dword ptr [bp - 0x1c]
8:3D5F  9adc7d853d           lcall 0x3d85, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
8:3D64  668b46e8             mov eax, dword ptr [bp - 0x18]
8:3D68  6629460a             sub dword ptr [bp + 0xa], eax
loc_3D6C:
8:3D6C  66ff46f0             inc dword ptr [bp - 0x10]
loc_3D70:
8:3D70  668b46f4             mov eax, dword ptr [bp - 0xc]
8:3D74  663946f0             cmp dword ptr [bp - 0x10], eax
8:3D78  7354                 jae 0x3dce
8:3D7A  66ff76f0             push dword ptr [bp - 0x10]
8:3D7E  66ff76f8             push dword ptr [bp - 8]
8:3D82  9a7c1d983d           lcall 0x3d98, 0x1d7c  ; sub_s7:1D7C
8:3D87  8946ec               mov word ptr [bp - 0x14], ax
8:3D8A  8956ee               mov word ptr [bp - 0x12], dx
8:3D8D  0bd0                 or dx, ax
8:3D8F  74db                 je 0x3d6c
8:3D91  ff76ee               push word ptr [bp - 0x12]
8:3D94  50                   push ax
8:3D95  9ab8bfcc3d           lcall 0x3dcc, 0xbfb8  ; sub_s7:BFB8
8:3D9A  8946e8               mov word ptr [bp - 0x18], ax
8:3D9D  8956ea               mov word ptr [bp - 0x16], dx
8:3DA0  0bd0                 or dx, ax
8:3DA2  74c8                 je 0x3d6c
8:3DA4  66ff76ec             push dword ptr [bp - 0x14]
8:3DA8  9a8eb55d3e           lcall 0x3e5d, 0xb58e  ; DbObj::getOwner@s6:B58E
8:3DAD  8946e4               mov word ptr [bp - 0x1c], ax
8:3DB0  8956e6               mov word ptr [bp - 0x1a], dx
8:3DB3  668b460a             mov eax, dword ptr [bp + 0xa]
8:3DB7  8b560c               mov dx, word ptr [bp + 0xc]
8:3DBA  663946e8             cmp dword ptr [bp - 0x18], eax
8:3DBE  7294                 jb 0x3d54
8:3DC0  ff760e               push word ptr [bp + 0xe]
8:3DC3  52                   push dx
8:3DC4  50                   push ax
8:3DC5  66ff76e4             push dword ptr [bp - 0x1c]
8:3DC9  9adc7d433e           lcall 0x3e43, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
loc_3DCE:
8:3DCE  668b46f8             mov eax, dword ptr [bp - 8]
8:3DD2  660bc0               or eax, eax
8:3DD5  0f841f01             je 0x3ef8
8:3DD9  6a01                 push 1
8:3DDB  c45ef8               les bx, ptr [bp - 8]
loc_3DDE:
8:3DDE  06                   push es
8:3DDF  50                   push ax
8:3DE0  26c41f               les bx, ptr es:[bx]
8:3DE3  26ff1f               lcall es:[bx]
8:3DE6  c9                   leave
8:3DE7  ca0a00               retf 0xa
loc_3DEA:
8:3DEA  6a0a                 push 0xa
8:3DEC  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:3DF1  9afac6d63b           lcall 0x3bd6, 0xc6fa  ; sub_s2:C6FA
8:3DF6  8946e4               mov word ptr [bp - 0x1c], ax
8:3DF9  8956e6               mov word ptr [bp - 0x1a], dx
8:3DFC  52                   push dx
8:3DFD  50                   push ax
8:3DFE  66ff7606             push dword ptr [bp + 6]
8:3E02  90                   nop
8:3E03  0e                   push cs
8:3E04  e87110               call 0x4e78  ; sub_s8:4E78
8:3E07  8946e8               mov word ptr [bp - 0x18], ax
8:3E0A  8956ea               mov word ptr [bp - 0x16], dx
8:3E0D  52                   push dx
8:3E0E  c45ee8               les bx, ptr [bp - 0x18]
8:3E11  50                   push ax
8:3E12  26c41f               les bx, ptr es:[bx]
8:3E15  26ff5f10             lcall es:[bx + 0x10]
8:3E19  8946ec               mov word ptr [bp - 0x14], ax
8:3E1C  8956ee               mov word ptr [bp - 0x12], dx
8:3E1F  66c746f000000000     mov dword ptr [bp - 0x10], 0
8:3E27  eb05                 jmp 0x3e2e
8:3E29  db 90
loc_3E2A:
8:3E2A  66ff46f0             inc dword ptr [bp - 0x10]
loc_3E2E:
8:3E2E  668b46ec             mov eax, dword ptr [bp - 0x14]
8:3E32  663946f0             cmp dword ptr [bp - 0x10], eax
8:3E36  7334                 jae 0x3e6c
8:3E38  66ff76f0             push dword ptr [bp - 0x10]
8:3E3C  66ff76e8             push dword ptr [bp - 0x18]
8:3E40  9a7c1d6a3e           lcall 0x3e6a, 0x1d7c  ; sub_s7:1D7C
8:3E45  8946f4               mov word ptr [bp - 0xc], ax
8:3E48  8956f6               mov word ptr [bp - 0xa], dx
8:3E4B  0bd0                 or dx, ax
8:3E4D  74db                 je 0x3e2a
8:3E4F  66ff760c             push dword ptr [bp + 0xc]
8:3E53  ff760a               push word ptr [bp + 0xa]
8:3E56  ff76f6               push word ptr [bp - 0xa]
8:3E59  50                   push ax
8:3E5A  9a8eb5c43e           lcall 0x3ec4, 0xb58e  ; DbObj::getOwner@s6:B58E
8:3E5F  8946f8               mov word ptr [bp - 8], ax
8:3E62  8956fa               mov word ptr [bp - 6], dx
8:3E65  52                   push dx
8:3E66  50                   push ax
loc_3E67:
8:3E67  9adc7d8e3e           lcall 0x3e8e, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
loc_3E6C:
8:3E6C  668b46e8             mov eax, dword ptr [bp - 0x18]
8:3E70  660bc0               or eax, eax
8:3E73  0f848100             je 0x3ef8
8:3E77  6a01                 push 1
8:3E79  c45ee8               les bx, ptr [bp - 0x18]
8:3E7C  e95fff               jmp 0x3dde
8:3E7F  db 90
loc_3E80:
8:3E80  ff760e               push word ptr [bp + 0xe]
8:3E83  66ff76f8             push dword ptr [bp - 8]
8:3E87  66ff76fc             push dword ptr [bp - 4]
8:3E8B  9adc7db13e           lcall 0x3eb1, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
8:3E90  668b46f8             mov eax, dword ptr [bp - 8]
8:3E94  6629460a             sub dword ptr [bp + 0xa], eax
loc_3E98:
8:3E98  66ff46f0             inc dword ptr [bp - 0x10]
loc_3E9C:
8:3E9C  668b46ec             mov eax, dword ptr [bp - 0x14]
8:3EA0  663946f0             cmp dword ptr [bp - 0x10], eax
8:3EA4  73c6                 jae 0x3e6c
8:3EA6  66ff76f0             push dword ptr [bp - 0x10]
8:3EAA  66ff76e8             push dword ptr [bp - 0x18]
8:3EAE  9a7c1d2f3c           lcall 0x3c2f, 0x1d7c  ; sub_s7:1D7C
8:3EB3  8946f4               mov word ptr [bp - 0xc], ax
8:3EB6  8956f6               mov word ptr [bp - 0xa], dx
8:3EB9  0bd0                 or dx, ax
8:3EBB  74db                 je 0x3e98
8:3EBD  ff76f6               push word ptr [bp - 0xa]
8:3EC0  50                   push ax
8:3EC1  9ae245d73e           lcall 0x3ed7, 0x45e2  ; sub_s6:45E2
8:3EC6  8946f8               mov word ptr [bp - 8], ax
8:3EC9  8956fa               mov word ptr [bp - 6], dx
8:3ECC  0bd0                 or dx, ax
8:3ECE  74c8                 je 0x3e98
8:3ED0  66ff76f4             push dword ptr [bp - 0xc]
8:3ED4  9a8eb54b37           lcall 0x374b, 0xb58e  ; DbObj::getOwner@s6:B58E
8:3ED9  8946fc               mov word ptr [bp - 4], ax
8:3EDC  8956fe               mov word ptr [bp - 2], dx
8:3EDF  668b460a             mov eax, dword ptr [bp + 0xa]
8:3EE3  8b560c               mov dx, word ptr [bp + 0xc]
8:3EE6  663946f8             cmp dword ptr [bp - 8], eax
8:3EEA  7294                 jb 0x3e80
8:3EEC  ff760e               push word ptr [bp + 0xe]
8:3EEF  52                   push dx
8:3EF0  50                   push ax
8:3EF1  66ff76fc             push dword ptr [bp - 4]
8:3EF5  e96fff               jmp 0x3e67
loc_3EF8:
8:3EF8  c9                   leave
8:3EF9  ca0a00               retf 0xa

; ---------------- sub_s8:3EFC FAR size=60 callers=1
8:3EFC  c8180000             enter 0x18, 0
8:3F00  66ff760e             push dword ptr [bp + 0xe]
8:3F04  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:3F09  9aece1ab3d           lcall 0x3dab, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:3F0E  8946fc               mov word ptr [bp - 4], ax
8:3F11  8956fe               mov word ptr [bp - 2], dx
8:3F14  c45e0a               les bx, ptr [bp + 0xa]
8:3F17  66268b4704           mov eax, dword ptr es:[bx + 4]
8:3F1C  c45efc               les bx, ptr [bp - 4]
8:3F1F  662689471c           mov dword ptr es:[bx + 0x1c], eax
8:3F24  66ff760a             push dword ptr [bp + 0xa]
8:3F28  c45efc               les bx, ptr [bp - 4]
8:3F2B  06                   push es
8:3F2C  53                   push bx
8:3F2D  26c41f               les bx, ptr es:[bx]
8:3F30  26ff5f58             lcall es:[bx + 0x58]
8:3F34  c9                   leave
8:3F35  ca0c00               retf 0xc

; ---------------- sub_s8:3F38 FAR size=120 callers=1
8:3F38  c8140000             enter 0x14, 0
8:3F3C  66ff760e             push dword ptr [bp + 0xe]
8:3F40  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:3F45  9aece1553f           lcall 0x3f55, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:3F4A  8946fc               mov word ptr [bp - 4], ax
8:3F4D  8956fe               mov word ptr [bp - 2], dx
8:3F50  52                   push dx
8:3F51  50                   push ax
8:3F52  9a8eb50c3f           lcall 0x3f0c, 0xb58e  ; DbObj::getOwner@s6:B58E
8:3F57  8946f8               mov word ptr [bp - 8], ax
8:3F5A  8956fa               mov word ptr [bp - 6], dx
8:3F5D  c45ef8               les bx, ptr [bp - 8]
8:3F60  66268b4704           mov eax, dword ptr es:[bx + 4]
8:3F65  668946f4             mov dword ptr [bp - 0xc], eax
8:3F69  6650                 push eax
8:3F6B  c45e06               les bx, ptr [bp + 6]
8:3F6E  06                   push es
8:3F6F  53                   push bx
8:3F70  26c41f               les bx, ptr es:[bx]
8:3F73  26ff5f18             lcall es:[bx + 0x18]
8:3F77  6a00                 push 0
8:3F79  66ff76f4             push dword ptr [bp - 0xc]
8:3F7D  6a00                 push 0
8:3F7F  c45e0a               les bx, ptr [bp + 0xa]
8:3F82  06                   push es
8:3F83  53                   push bx
8:3F84  26c41f               les bx, ptr es:[bx]
8:3F87  26ff5f08             lcall es:[bx + 8]
8:3F8B  c45e0a               les bx, ptr [bp + 0xa]
8:3F8E  6626ff7704           push dword ptr es:[bx + 4]
8:3F93  66ff76f8             push dword ptr [bp - 8]
8:3F97  9aee73623d           lcall 0x3d62, 0x73ee  ; sub_s7:73EE
8:3F9C  66ff760a             push dword ptr [bp + 0xa]
8:3FA0  c45efc               les bx, ptr [bp - 4]
8:3FA3  06                   push es
8:3FA4  53                   push bx
8:3FA5  26c41f               les bx, ptr es:[bx]
8:3FA8  26ff5f58             lcall es:[bx + 0x58]
8:3FAC  c9                   leave
8:3FAD  ca0c00               retf 0xc

; ---------------- sub_s8:3FB0 FAR size=26 callers=5
8:3FB0  55                   push bp
8:3FB1  8bec                 mov bp, sp
8:3FB3  c45e06               les bx, ptr [bp + 6]
8:3FB6  6626ffb70002         push dword ptr es:[bx + 0x200]
8:3FBC  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:3FC1  9aece1483f           lcall 0x3f48, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:3FC6  c9                   leave
8:3FC7  ca0400               retf 4

; ---------------- sub_s8:3FCA FAR size=770 callers=1
8:3FCA  c8380000             enter 0x38, 0
8:3FCE  56                   push si
8:3FCF  c45e06               les bx, ptr [bp + 6]
8:3FD2  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:3FD8  7412                 je 0x3fec
8:3FDA  6626ff770c           push dword ptr es:[bx + 0xc]
8:3FDF  26c45f0c             les bx, ptr es:[bx + 0xc]
8:3FE3  26c41f               les bx, ptr es:[bx]
8:3FE6  26ff5f10             lcall es:[bx + 0x10]
8:3FEA  eb03                 jmp 0x3fef
loc_3FEC:
8:3FEC  33c0                 xor ax, ax
8:3FEE  99                   cdq
loc_3FEF:
8:3FEF  8946fc               mov word ptr [bp - 4], ax
8:3FF2  8956fe               mov word ptr [bp - 2], dx
8:3FF5  0bd0                 or dx, ax
8:3FF7  0f84cb02             je 0x42c6
8:3FFB  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
8:4001  7409                 je 0x400c
8:4003  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
8:4006  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
8:400A  eb05                 jmp 0x4011
loc_400C:
8:400C  9a0a162740           lcall 0x4027, 0x160a  ; SH_DefaultPool@s1:160A
loc_4011:
8:4011  8946d0               mov word ptr [bp - 0x30], ax
8:4014  8956d2               mov word ptr [bp - 0x2e], dx
8:4017  52                   push dx
8:4018  50                   push ax
8:4019  6a01                 push 1
8:401B  8b46fc               mov ax, word ptr [bp - 4]
8:401E  c1e002               shl ax, 2
8:4021  6a00                 push 0
8:4023  50                   push ax
8:4024  9a08174740           lcall 0x4047, 0x1708  ; SH_MemAllocPtr@s1:1708
8:4029  83c40a               add sp, 0xa
8:402C  8946f8               mov word ptr [bp - 8], ax
8:402F  8956fa               mov word ptr [bp - 6], dx
8:4032  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
8:4038  740a                 je 0x4044
8:403A  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
8:403D  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
8:4041  eb06                 jmp 0x4049
8:4043  db 90
loc_4044:
8:4044  9a0a165f40           lcall 0x405f, 0x160a  ; SH_DefaultPool@s1:160A
loc_4049:
8:4049  8946cc               mov word ptr [bp - 0x34], ax
8:404C  8956ce               mov word ptr [bp - 0x32], dx
8:404F  52                   push dx
8:4050  50                   push ax
8:4051  6a01                 push 1
8:4053  8b46fc               mov ax, word ptr [bp - 4]
8:4056  c1e002               shl ax, 2
8:4059  6a00                 push 0
8:405B  50                   push ax
8:405C  9a0817ab42           lcall 0x42ab, 0x1708  ; SH_MemAllocPtr@s1:1708
8:4061  83c40a               add sp, 0xa
8:4064  8946f4               mov word ptr [bp - 0xc], ax
8:4067  8956f6               mov word ptr [bp - 0xa], dx
8:406A  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:4072  eb04                 jmp 0x4078
loc_4074:
8:4074  66ff46ec             inc dword ptr [bp - 0x14]
loc_4078:
8:4078  668b46fc             mov eax, dword ptr [bp - 4]
8:407C  663946ec             cmp dword ptr [bp - 0x14], eax
8:4080  7356                 jae 0x40d8
8:4082  66ff76ec             push dword ptr [bp - 0x14]
8:4086  c45e06               les bx, ptr [bp + 6]
8:4089  6626ff770c           push dword ptr es:[bx + 0xc]
8:408E  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4092  26c41f               les bx, ptr es:[bx]
8:4095  26ff5f04             lcall es:[bx + 4]
8:4099  8946f0               mov word ptr [bp - 0x10], ax
8:409C  8956f2               mov word ptr [bp - 0xe], dx
8:409F  0bd0                 or dx, ax
8:40A1  74d1                 je 0x4074
8:40A3  ff76f2               push word ptr [bp - 0xe]
8:40A6  50                   push ax
8:40A7  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:40AC  9aece13441           lcall 0x4134, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:40B1  8b5eec               mov bx, word ptr [bp - 0x14]
8:40B4  c1e302               shl bx, 2
8:40B7  c476f8               les si, ptr [bp - 8]
8:40BA  268900               mov word ptr es:[bx + si], ax
8:40BD  26895002             mov word ptr es:[bx + si + 2], dx
8:40C1  52                   push dx
8:40C2  26ff30               push word ptr es:[bx + si]
8:40C5  8bf3                 mov si, bx
8:40C7  9aa873ee41           lcall 0x41ee, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:40CC  c45ef4               les bx, ptr [bp - 0xc]
8:40CF  268900               mov word ptr es:[bx + si], ax
8:40D2  26895002             mov word ptr es:[bx + si + 2], dx
8:40D6  eb9c                 jmp 0x4074
loc_40D8:
8:40D8  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:40E0  eb04                 jmp 0x40e6
loc_40E2:
8:40E2  66ff46ec             inc dword ptr [bp - 0x14]
loc_40E6:
8:40E6  668b46fc             mov eax, dword ptr [bp - 4]
8:40EA  663946ec             cmp dword ptr [bp - 0x14], eax
8:40EE  7348                 jae 0x4138
8:40F0  8b5eec               mov bx, word ptr [bp - 0x14]
8:40F3  c1e302               shl bx, 2
8:40F6  c476f4               les si, ptr [bp - 0xc]
8:40F9  6626833800           cmp dword ptr es:[bx + si], 0
8:40FE  74e2                 je 0x40e2
8:4100  8b5eec               mov bx, word ptr [bp - 0x14]
8:4103  c1e302               shl bx, 2
8:4106  26c418               les bx, ptr es:[bx + si]
8:4109  26c7471a0000         mov word ptr es:[bx + 0x1a], 0
8:410F  8b5eec               mov bx, word ptr [bp - 0x14]
8:4112  c1e302               shl bx, 2
8:4115  c476f4               les si, ptr [bp - 0xc]
8:4118  26c418               les bx, ptr es:[bx + si]
8:411B  26837f1205           cmp word ptr es:[bx + 0x12], 5
8:4120  75c0                 jne 0x40e2
8:4122  6a06                 push 6
8:4124  8b5eec               mov bx, word ptr [bp - 0x14]
8:4127  c1e302               shl bx, 2
8:412A  8e46f6               mov es, word ptr [bp - 0xa]
8:412D  6626ff30             push dword ptr es:[bx + si]
8:4131  9aacbde141           lcall 0x41e1, 0xbdac  ; sub_s6:BDAC
8:4136  ebaa                 jmp 0x40e2
loc_4138:
8:4138  c45e06               les bx, ptr [bp + 6]
8:413B  26c78704020000       mov word ptr es:[bx + 0x204], 0
8:4142  6a02                 push 2
8:4144  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:4149  9aba206a36           lcall 0x366a, 0x20ba  ; sub_s3:20BA
8:414E  8946e8               mov word ptr [bp - 0x18], ax
8:4151  8956ea               mov word ptr [bp - 0x16], dx
8:4154  a1ae13               mov ax, word ptr [0x13ae]
8:4157  8946e6               mov word ptr [bp - 0x1a], ax
8:415A  3d0100               cmp ax, 1
8:415D  7508                 jne 0x4167
8:415F  c45e06               les bx, ptr [bp + 6]
8:4162  2689870402           mov word ptr es:[bx + 0x204], ax
loc_4167:
8:4167  66ff76f8             push dword ptr [bp - 8]
8:416B  66ff76f4             push dword ptr [bp - 0xc]
8:416F  66ff76fc             push dword ptr [bp - 4]
8:4173  66ff7606             push dword ptr [bp + 6]
8:4177  90                   nop
8:4178  0e                   push cs
8:4179  e81a19               call 0x5a96  ; sub_s8:5A96
8:417C  666800000200         push 0x20000
8:4182  66ff76f8             push dword ptr [bp - 8]
8:4186  66ff76f4             push dword ptr [bp - 0xc]
8:418A  66ff76fc             push dword ptr [bp - 4]
8:418E  66ff7606             push dword ptr [bp + 6]
8:4192  90                   nop
8:4193  0e                   push cs
8:4194  e82f1b               call 0x5cc6  ; sub_s8:5CC6
8:4197  66ff76f8             push dword ptr [bp - 8]
8:419B  66ff76f4             push dword ptr [bp - 0xc]
8:419F  66ff76fc             push dword ptr [bp - 4]
8:41A3  66ff7606             push dword ptr [bp + 6]
8:41A7  90                   nop
8:41A8  0e                   push cs
8:41A9  e89019               call 0x5b3c  ; sub_s8:5B3C
8:41AC  666800000100         push 0x10000
8:41B2  66ff76f8             push dword ptr [bp - 8]
8:41B6  66ff76f4             push dword ptr [bp - 0xc]
8:41BA  66ff76fc             push dword ptr [bp - 4]
8:41BE  66ff7606             push dword ptr [bp + 6]
8:41C2  90                   nop
8:41C3  0e                   push cs
8:41C4  e8ff1a               call 0x5cc6  ; sub_s8:5CC6
8:41C7  8d46e0               lea ax, [bp - 0x20]
8:41CA  16                   push ss
8:41CB  50                   push ax
8:41CC  8d46de               lea ax, [bp - 0x22]
8:41CF  16                   push ss
8:41D0  50                   push ax
8:41D1  c45e06               les bx, ptr [bp + 6]
8:41D4  6626ff7708           push dword ptr es:[bx + 8]
8:41D9  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:41DE  9aece1c43f           lcall 0x3fc4, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:41E3  8946e2               mov word ptr [bp - 0x1e], ax
8:41E6  8956e4               mov word ptr [bp - 0x1c], dx
8:41E9  52                   push dx
8:41EA  50                   push ax
8:41EB  9a1c5b9a3f           lcall 0x3f9a, 0x5b1c  ; sub_s7:5B1C
8:41F0  c746dc0100           mov word ptr [bp - 0x24], 1
8:41F5  eb36                 jmp 0x422d
8:41F7  db 90
loc_41F8:
8:41F8  ff76dc               push word ptr [bp - 0x24]
8:41FB  66ff76f8             push dword ptr [bp - 8]
8:41FF  66ff76f4             push dword ptr [bp - 0xc]
8:4203  66ff76fc             push dword ptr [bp - 4]
8:4207  66ff7606             push dword ptr [bp + 6]
8:420B  90                   nop
8:420C  0e                   push cs
8:420D  e8d616               call 0x58e6  ; sub_s8:58E6
8:4210  6a03                 push 3
8:4212  ff76dc               push word ptr [bp - 0x24]
8:4215  66ff76f8             push dword ptr [bp - 8]
8:4219  66ff76f4             push dword ptr [bp - 0xc]
8:421D  66ff76fc             push dword ptr [bp - 4]
8:4221  66ff7606             push dword ptr [bp + 6]
8:4225  90                   nop
8:4226  0e                   push cs
8:4227  e89c1a               call 0x5cc6  ; sub_s8:5CC6
8:422A  ff46dc               inc word ptr [bp - 0x24]
loc_422D:
8:422D  8b46de               mov ax, word ptr [bp - 0x22]
8:4230  3946dc               cmp word ptr [bp - 0x24], ax
8:4233  7ec3                 jle 0x41f8
8:4235  66ff76f8             push dword ptr [bp - 8]
8:4239  66ff76f4             push dword ptr [bp - 0xc]
8:423D  66ff76fc             push dword ptr [bp - 4]
8:4241  66ff7606             push dword ptr [bp + 6]
8:4245  90                   nop
8:4246  0e                   push cs
8:4247  e8cc17               call 0x5a16  ; sub_s8:5A16
8:424A  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:4252  eb14                 jmp 0x4268
loc_4254:
8:4254  8b5eec               mov bx, word ptr [bp - 0x14]
8:4257  c1e302               shl bx, 2
8:425A  26c418               les bx, ptr es:[bx + si]
8:425D  26837f1205           cmp word ptr es:[bx + 0x12], 5
8:4262  7520                 jne 0x4284
loc_4264:
8:4264  66ff46ec             inc dword ptr [bp - 0x14]
loc_4268:
8:4268  668b46fc             mov eax, dword ptr [bp - 4]
8:426C  663946ec             cmp dword ptr [bp - 0x14], eax
8:4270  732c                 jae 0x429e
8:4272  8b5eec               mov bx, word ptr [bp - 0x14]
8:4275  c1e302               shl bx, 2
8:4278  c476f4               les si, ptr [bp - 0xc]
8:427B  6626833800           cmp dword ptr es:[bx + si], 0
8:4280  75d2                 jne 0x4254
8:4282  ebe0                 jmp 0x4264
loc_4284:
8:4284  8b5eec               mov bx, word ptr [bp - 0x14]
8:4287  c1e302               shl bx, 2
8:428A  8e46f6               mov es, word ptr [bp - 0xa]
8:428D  6626ff30             push dword ptr es:[bx + si]
8:4291  26c418               les bx, ptr es:[bx + si]
8:4294  26c41f               les bx, ptr es:[bx]
8:4297  26ff5f28             lcall es:[bx + 0x28]
8:429B  ebc7                 jmp 0x4264
8:429D  db 90
loc_429E:
8:429E  668b46f8             mov eax, dword ptr [bp - 8]
8:42A2  668946cc             mov dword ptr [bp - 0x34], eax
8:42A6  6650                 push eax
8:42A8  9ace17c142           lcall 0x42c1, 0x17ce  ; operator_delete@s1:17CE
8:42AD  83c404               add sp, 4
8:42B0  668b46f4             mov eax, dword ptr [bp - 0xc]
8:42B4  668946c8             mov dword ptr [bp - 0x38], eax
8:42B8  668946d0             mov dword ptr [bp - 0x30], eax
8:42BC  6650                 push eax
8:42BE  9ace17113c           lcall 0x3c11, 0x17ce  ; operator_delete@s1:17CE
8:42C3  83c404               add sp, 4
loc_42C6:
8:42C6  5e                   pop si
8:42C7  c9                   leave
8:42C8  ca0400               retf 4
8:42CB  db 00

; ---------------- sub_s8:42CC FAR size=256 callers=1
8:42CC  c8220000             enter 0x22, 0
8:42D0  c45e06               les bx, ptr [bp + 6]
8:42D3  662683bff60100       cmp dword ptr es:[bx + 0x1f6], 0
8:42DA  7508                 jne 0x42e4
8:42DC  33c0                 xor ax, ax
8:42DE  99                   cdq
8:42DF  c9                   leave
8:42E0  ca0400               retf 4
8:42E3  db 90
loc_42E4:
8:42E4  6a2d                 push 0x2d
8:42E6  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:42EB  9afac6dd3c           lcall 0x3cdd, 0xc6fa  ; sub_s2:C6FA
8:42F0  52                   push dx
8:42F1  50                   push ax
8:42F2  66ff7606             push dword ptr [bp + 6]
8:42F6  90                   nop
8:42F7  0e                   push cs
8:42F8  e8730a               call 0x4d6e  ; sub_s8:4D6E
8:42FB  8946f8               mov word ptr [bp - 8], ax
8:42FE  8956fa               mov word ptr [bp - 6], dx
8:4301  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:4309  52                   push dx
8:430A  c45ef8               les bx, ptr [bp - 8]
8:430D  53                   push bx
8:430E  26c41f               les bx, ptr es:[bx]
8:4311  26ff5f10             lcall es:[bx + 0x10]
8:4315  8946f0               mov word ptr [bp - 0x10], ax
8:4318  8956f2               mov word ptr [bp - 0xe], dx
8:431B  c746ee0000           mov word ptr [bp - 0x12], 0
8:4320  66c746ea00000000     mov dword ptr [bp - 0x16], 0
8:4328  eb04                 jmp 0x432e
loc_432A:
8:432A  66ff46ea             inc dword ptr [bp - 0x16]
loc_432E:
8:432E  668b46f0             mov eax, dword ptr [bp - 0x10]
8:4332  663946ea             cmp dword ptr [bp - 0x16], eax
8:4336  732e                 jae 0x4366
8:4338  66ff76ea             push dword ptr [bp - 0x16]
8:433C  66ff76f8             push dword ptr [bp - 8]
8:4340  9a7c1d7843           lcall 0x4378, 0x1d7c  ; sub_s7:1D7C
8:4345  8946e6               mov word ptr [bp - 0x1a], ax
8:4348  8956e8               mov word ptr [bp - 0x18], dx
8:434B  0bd0                 or dx, ax
8:434D  74db                 je 0x432a
8:434F  c45ee6               les bx, ptr [bp - 0x1a]
8:4352  06                   push es
8:4353  50                   push ax
8:4354  26c41f               les bx, ptr es:[bx]
8:4357  26ff5f50             lcall es:[bx + 0x50]
8:435B  0bc0                 or ax, ax
8:435D  74cb                 je 0x432a
8:435F  c746ee0100           mov word ptr [bp - 0x12], 1
8:4364  ebc4                 jmp 0x432a
loc_4366:
8:4366  837eee00             cmp word ptr [bp - 0x12], 0
8:436A  752e                 jne 0x439a
8:436C  c45e06               les bx, ptr [bp + 6]
8:436F  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:4375  9ab8389043           lcall 0x4390, 0x38b8  ; sub_s7:38B8
8:437A  8946e6               mov word ptr [bp - 0x1a], ax
8:437D  8956e8               mov word ptr [bp - 0x18], dx
8:4380  0bd0                 or dx, ax
8:4382  7428                 je 0x43ac
8:4384  c45e06               les bx, ptr [bp + 6]
8:4387  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:438D  9a6a32ca40           lcall 0x40ca, 0x326a  ; sub_s7:326A
8:4392  8946f4               mov word ptr [bp - 0xc], ax
8:4395  8956f6               mov word ptr [bp - 0xa], dx
8:4398  eb12                 jmp 0x43ac
loc_439A:
8:439A  c45e06               les bx, ptr [bp + 6]
8:439D  26c49ff601           les bx, ptr es:[bx + 0x1f6]
8:43A2  6626c787aa0100000000 mov dword ptr es:[bx + 0x1aa], 0
loc_43AC:
8:43AC  668b46f8             mov eax, dword ptr [bp - 8]
8:43B0  660bc0               or eax, eax
8:43B3  740d                 je 0x43c2
8:43B5  6a01                 push 1
8:43B7  c45ef8               les bx, ptr [bp - 8]
8:43BA  06                   push es
8:43BB  50                   push ax
8:43BC  26c41f               les bx, ptr es:[bx]
8:43BF  26ff1f               lcall es:[bx]
loc_43C2:
8:43C2  8b46f4               mov ax, word ptr [bp - 0xc]
8:43C5  8b56f6               mov dx, word ptr [bp - 0xa]
8:43C8  c9                   leave
8:43C9  ca0400               retf 4

; ---------------- sub_s8:43CC FAR size=268 callers=4
8:43CC  c8200000             enter 0x20, 0
8:43D0  57                   push di
8:43D1  56                   push si
8:43D2  837e0c05             cmp word ptr [bp + 0xc], 5
8:43D6  7512                 jne 0x43ea
8:43D8  66ff7608             push dword ptr [bp + 8]
8:43DC  ff7606               push word ptr [bp + 6]
8:43DF  90                   nop
8:43E0  0e                   push cs
8:43E1  e81c05               call 0x4900  ; sub_s8:4900
8:43E4  5e                   pop si
8:43E5  5f                   pop di
8:43E6  c9                   leave
8:43E7  ca0800               retf 8
loc_43EA:
8:43EA  ff760c               push word ptr [bp + 0xc]
8:43ED  66ff7606             push dword ptr [bp + 6]
8:43F1  90                   nop
8:43F2  0e                   push cs
8:43F3  e8c40f               call 0x53ba  ; sub_s8:53BA
8:43F6  0bd2                 or dx, dx
8:43F8  7507                 jne 0x4401
8:43FA  3d0100               cmp ax, 1
8:43FD  0f82d100             jb 0x44d2
loc_4401:
8:4401  8b760c               mov si, word ptr [bp + 0xc]
8:4404  c1e602               shl si, 2
8:4407  c45e06               les bx, ptr [bp + 6]
8:440A  268b804e01           mov ax, word ptr es:[bx + si + 0x14e]
8:440F  268b905001           mov dx, word ptr es:[bx + si + 0x150]
8:4414  8bc8                 mov cx, ax
8:4416  8b460a               mov ax, word ptr [bp + 0xa]
8:4419  8bfa                 mov di, dx
8:441B  99                   cdq
8:441C  2bc8                 sub cx, ax
8:441E  1bfa                 sbb di, dx
8:4420  2689884e01           mov word ptr es:[bx + si + 0x14e], cx
8:4425  2689b85001           mov word ptr es:[bx + si + 0x150], di
8:442A  0bff                 or di, di
8:442C  7d0a                 jge 0x4438
8:442E  6626c7804e0100000000 mov dword ptr es:[bx + si + 0x14e], 0
loc_4438:
8:4438  6a1e                 push 0x1e
8:443A  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:443F  9afac6ee42           lcall 0x42ee, 0xc6fa  ; sub_s2:C6FA
8:4444  52                   push dx
8:4445  50                   push ax
8:4446  66ff7606             push dword ptr [bp + 6]
8:444A  90                   nop
8:444B  0e                   push cs
8:444C  e8290a               call 0x4e78  ; sub_s8:4E78
8:444F  8946f4               mov word ptr [bp - 0xc], ax
8:4452  8956f6               mov word ptr [bp - 0xa], dx
8:4455  52                   push dx
8:4456  c45ef4               les bx, ptr [bp - 0xc]
8:4459  50                   push ax
8:445A  26c41f               les bx, ptr es:[bx]
8:445D  26ff5f10             lcall es:[bx + 0x10]
8:4461  8946f0               mov word ptr [bp - 0x10], ax
8:4464  8956f2               mov word ptr [bp - 0xe], dx
8:4467  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:446F  eb41                 jmp 0x44b2
8:4471  db 90
loc_4472:
8:4472  ff760c               push word ptr [bp + 0xc]
8:4475  66ff76e8             push dword ptr [bp - 0x18]
8:4479  9a78cfc744           lcall 0x44c7, 0xcf78  ; sub_s7:CF78
8:447E  0bc0                 or ax, ax
8:4480  7409                 je 0x448b
8:4482  ff4e0a               dec word ptr [bp + 0xa]
loc_4485:
8:4485  837e0a00             cmp word ptr [bp + 0xa], 0
8:4489  75e7                 jne 0x4472
loc_448B:
8:448B  837e0a00             cmp word ptr [bp + 0xa], 0
8:448F  751d                 jne 0x44ae
loc_4491:
8:4491  668b46f4             mov eax, dword ptr [bp - 0xc]
8:4495  660bc0               or eax, eax
8:4498  7438                 je 0x44d2
8:449A  6a01                 push 1
8:449C  c45ef4               les bx, ptr [bp - 0xc]
8:449F  06                   push es
8:44A0  50                   push ax
8:44A1  26c41f               les bx, ptr es:[bx]
8:44A4  26ff1f               lcall es:[bx]
8:44A7  5e                   pop si
8:44A8  5f                   pop di
8:44A9  c9                   leave
8:44AA  ca0800               retf 8
8:44AD  db 90
loc_44AE:
8:44AE  66ff46ec             inc dword ptr [bp - 0x14]
loc_44B2:
8:44B2  668b46f0             mov eax, dword ptr [bp - 0x10]
8:44B6  663946ec             cmp dword ptr [bp - 0x14], eax
8:44BA  73d5                 jae 0x4491
8:44BC  66ff76ec             push dword ptr [bp - 0x14]
8:44C0  66ff76f4             push dword ptr [bp - 0xc]
8:44C4  9a7c1d4343           lcall 0x4343, 0x1d7c  ; sub_s7:1D7C
8:44C9  8946e8               mov word ptr [bp - 0x18], ax
8:44CC  8956ea               mov word ptr [bp - 0x16], dx
8:44CF  ebb4                 jmp 0x4485
8:44D1  db 90
loc_44D2:
8:44D2  5e                   pop si
8:44D3  5f                   pop di
8:44D4  c9                   leave
8:44D5  ca0800               retf 8

; ---------------- sub_s8:44D8 FAR size=268 callers=1
8:44D8  c8200000             enter 0x20, 0
8:44DC  57                   push di
8:44DD  56                   push si
8:44DE  837e0c05             cmp word ptr [bp + 0xc], 5
8:44E2  7512                 jne 0x44f6
8:44E4  66ff7608             push dword ptr [bp + 8]
8:44E8  ff7606               push word ptr [bp + 6]
8:44EB  90                   nop
8:44EC  0e                   push cs
8:44ED  e81004               call 0x4900  ; sub_s8:4900
8:44F0  5e                   pop si
8:44F1  5f                   pop di
8:44F2  c9                   leave
8:44F3  ca0800               retf 8
loc_44F6:
8:44F6  ff760c               push word ptr [bp + 0xc]
8:44F9  66ff7606             push dword ptr [bp + 6]
8:44FD  90                   nop
8:44FE  0e                   push cs
8:44FF  e8b80e               call 0x53ba  ; sub_s8:53BA
8:4502  0bd2                 or dx, dx
8:4504  7507                 jne 0x450d
8:4506  3d0100               cmp ax, 1
8:4509  0f82d100             jb 0x45de
loc_450D:
8:450D  8b760c               mov si, word ptr [bp + 0xc]
8:4510  c1e602               shl si, 2
8:4513  c45e06               les bx, ptr [bp + 6]
8:4516  268b804e01           mov ax, word ptr es:[bx + si + 0x14e]
8:451B  268b905001           mov dx, word ptr es:[bx + si + 0x150]
8:4520  8bc8                 mov cx, ax
8:4522  8b460a               mov ax, word ptr [bp + 0xa]
8:4525  8bfa                 mov di, dx
8:4527  99                   cdq
8:4528  2bc8                 sub cx, ax
8:452A  1bfa                 sbb di, dx
8:452C  2689884e01           mov word ptr es:[bx + si + 0x14e], cx
8:4531  2689b85001           mov word ptr es:[bx + si + 0x150], di
8:4536  0bff                 or di, di
8:4538  7d0a                 jge 0x4544
8:453A  6626c7804e0100000000 mov dword ptr es:[bx + si + 0x14e], 0
loc_4544:
8:4544  6a1e                 push 0x1e
8:4546  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:454B  9afac64244           lcall 0x4442, 0xc6fa  ; sub_s2:C6FA
8:4550  52                   push dx
8:4551  50                   push ax
8:4552  66ff7606             push dword ptr [bp + 6]
8:4556  90                   nop
8:4557  0e                   push cs
8:4558  e81d09               call 0x4e78  ; sub_s8:4E78
8:455B  8946f4               mov word ptr [bp - 0xc], ax
8:455E  8956f6               mov word ptr [bp - 0xa], dx
8:4561  52                   push dx
8:4562  c45ef4               les bx, ptr [bp - 0xc]
8:4565  50                   push ax
8:4566  26c41f               les bx, ptr es:[bx]
8:4569  26ff5f10             lcall es:[bx + 0x10]
8:456D  8946f0               mov word ptr [bp - 0x10], ax
8:4570  8956f2               mov word ptr [bp - 0xe], dx
8:4573  66c746ec00000000     mov dword ptr [bp - 0x14], 0
8:457B  eb41                 jmp 0x45be
8:457D  db 90
loc_457E:
8:457E  ff760c               push word ptr [bp + 0xc]
8:4581  66ff76e8             push dword ptr [bp - 0x18]
8:4585  9a0cd0d345           lcall 0x45d3, 0xd00c  ; sub_s7:D00C
8:458A  0bc0                 or ax, ax
8:458C  7409                 je 0x4597
8:458E  ff4e0a               dec word ptr [bp + 0xa]
loc_4591:
8:4591  837e0a00             cmp word ptr [bp + 0xa], 0
8:4595  75e7                 jne 0x457e
loc_4597:
8:4597  837e0a00             cmp word ptr [bp + 0xa], 0
8:459B  751d                 jne 0x45ba
loc_459D:
8:459D  668b46f4             mov eax, dword ptr [bp - 0xc]
8:45A1  660bc0               or eax, eax
8:45A4  7438                 je 0x45de
8:45A6  6a01                 push 1
8:45A8  c45ef4               les bx, ptr [bp - 0xc]
8:45AB  06                   push es
8:45AC  50                   push ax
8:45AD  26c41f               les bx, ptr es:[bx]
8:45B0  26ff1f               lcall es:[bx]
8:45B3  5e                   pop si
8:45B4  5f                   pop di
8:45B5  c9                   leave
8:45B6  ca0800               retf 8
8:45B9  db 90
loc_45BA:
8:45BA  66ff46ec             inc dword ptr [bp - 0x14]
loc_45BE:
8:45BE  668b46f0             mov eax, dword ptr [bp - 0x10]
8:45C2  663946ec             cmp dword ptr [bp - 0x14], eax
8:45C6  73d5                 jae 0x459d
8:45C8  66ff76ec             push dword ptr [bp - 0x14]
8:45CC  66ff76f4             push dword ptr [bp - 0xc]
8:45D0  9a7c1d7c44           lcall 0x447c, 0x1d7c  ; sub_s7:1D7C
8:45D5  8946e8               mov word ptr [bp - 0x18], ax
8:45D8  8956ea               mov word ptr [bp - 0x16], dx
8:45DB  ebb4                 jmp 0x4591
8:45DD  db 90
loc_45DE:
8:45DE  5e                   pop si
8:45DF  5f                   pop di
8:45E0  c9                   leave
8:45E1  ca0800               retf 8

; ---------------- sub_s8:45E4 FAR size=380 callers=1
8:45E4  c8220000             enter 0x22, 0
8:45E8  57                   push di
8:45E9  56                   push si
8:45EA  6a02                 push 2
8:45EC  c45e06               les bx, ptr [bp + 6]
8:45EF  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:45F5  9af2380c46           lcall 0x460c, 0x38f2  ; sub_s7:38F2
8:45FA  6a01                 push 1
8:45FC  c45e06               les bx, ptr [bp + 6]
8:45FF  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:4605  8bf0                 mov si, ax
8:4607  8bfa                 mov di, dx
8:4609  9af2382646           lcall 0x4626, 0x38f2  ; sub_s7:38F2
8:460E  2bf0                 sub si, ax
8:4610  1bfa                 sbb di, dx
8:4612  8976fc               mov word ptr [bp - 4], si
8:4615  897efe               mov word ptr [bp - 2], di
8:4618  6a04                 push 4
8:461A  c45e06               les bx, ptr [bp + 6]
8:461D  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:4623  9af2383a46           lcall 0x463a, 0x38f2  ; sub_s7:38F2
8:4628  6a03                 push 3
8:462A  c45e06               les bx, ptr [bp + 6]
8:462D  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:4633  8bf0                 mov si, ax
8:4635  8bfa                 mov di, dx
8:4637  9af2385747           lcall 0x4757, 0x38f2  ; sub_s7:38F2
8:463C  2bf0                 sub si, ax
8:463E  1bfa                 sbb di, dx
8:4640  c45e06               les bx, ptr [bp + 6]
8:4643  268b4724             mov ax, word ptr es:[bx + 0x24]
8:4647  99                   cdq
8:4648  03c6                 add ax, si
8:464A  13d7                 adc dx, di
8:464C  0346fc               add ax, word ptr [bp - 4]
8:464F  1356fe               adc dx, word ptr [bp - 2]
8:4652  0bd2                 or dx, dx
8:4654  7c0c                 jl 0x4662
8:4656  7f04                 jg 0x465c
8:4658  0bc0                 or ax, ax
8:465A  7406                 je 0x4662
loc_465C:
8:465C  b80100               mov ax, 1
8:465F  eb04                 jmp 0x4665
8:4661  db 90
loc_4662:
8:4662  b8ffff               mov ax, 0xffff
loc_4665:
8:4665  26014724             add word ptr es:[bx + 0x24], ax
8:4669  6a16                 push 0x16
8:466B  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:4670  9afac64e45           lcall 0x454e, 0xc6fa  ; sub_s2:C6FA
8:4675  52                   push dx
8:4676  50                   push ax
8:4677  66ff7606             push dword ptr [bp + 6]
8:467B  90                   nop
8:467C  0e                   push cs
8:467D  e8ee06               call 0x4d6e  ; sub_s8:4D6E
8:4680  8946ec               mov word ptr [bp - 0x14], ax
8:4683  8956ee               mov word ptr [bp - 0x12], dx
8:4686  52                   push dx
8:4687  c45eec               les bx, ptr [bp - 0x14]
8:468A  50                   push ax
8:468B  26c41f               les bx, ptr es:[bx]
8:468E  8bf3                 mov si, bx
8:4690  8cc7                 mov di, es
8:4692  26ff5f10             lcall es:[bx + 0x10]
8:4696  8946ea               mov word ptr [bp - 0x16], ax
8:4699  668b46ec             mov eax, dword ptr [bp - 0x14]
8:469D  660bc0               or eax, eax
8:46A0  740b                 je 0x46ad
8:46A2  6a01                 push 1
8:46A4  ff76ee               push word ptr [bp - 0x12]
8:46A7  50                   push ax
8:46A8  8ec7                 mov es, di
8:46AA  26ff1c               lcall es:[si]
loc_46AD:
8:46AD  8b46ea               mov ax, word ptr [bp - 0x16]
8:46B0  03c0                 add ax, ax
8:46B2  c45e06               les bx, ptr [bp + 6]
8:46B5  26014724             add word ptr es:[bx + 0x24], ax
8:46B9  268b4724             mov ax, word ptr es:[bx + 0x24]
8:46BD  3d6400               cmp ax, 0x64
8:46C0  7e03                 jle 0x46c5
8:46C2  b86400               mov ax, 0x64
loc_46C5:
8:46C5  26894724             mov word ptr es:[bx + 0x24], ax
8:46C9  0bc0                 or ax, ax
8:46CB  7d02                 jge 0x46cf
8:46CD  33c0                 xor ax, ax
loc_46CF:
8:46CF  26894724             mov word ptr es:[bx + 0x24], ax
8:46D3  b90a00               mov cx, 0xa
8:46D6  99                   cdq
8:46D7  f7f9                 idiv cx
8:46D9  c746e61000           mov word ptr [bp - 0x1a], 0x10
8:46DE  3bc1                 cmp ax, cx
8:46E0  7f08                 jg 0x46ea
8:46E2  c746e61400           mov word ptr [bp - 0x1a], 0x14
8:46E7  eb5f                 jmp 0x4748
8:46E9  db 90
loc_46EA:
8:46EA  3d1400               cmp ax, 0x14
8:46ED  7f07                 jg 0x46f6
8:46EF  c746e61300           mov word ptr [bp - 0x1a], 0x13
8:46F4  eb52                 jmp 0x4748
loc_46F6:
8:46F6  3d1e00               cmp ax, 0x1e
8:46F9  7f07                 jg 0x4702
8:46FB  c746e61200           mov word ptr [bp - 0x1a], 0x12  ; 'version %d %d'
8:4700  eb46                 jmp 0x4748
loc_4702:
8:4702  3d2800               cmp ax, 0x28
8:4705  7f07                 jg 0x470e
8:4707  c746e61100           mov word ptr [bp - 0x1a], 0x11
8:470C  eb3a                 jmp 0x4748
loc_470E:
8:470E  3d3200               cmp ax, 0x32
8:4711  7f07                 jg 0x471a
8:4713  c746e61000           mov word ptr [bp - 0x1a], 0x10
8:4718  eb2e                 jmp 0x4748
loc_471A:
8:471A  3d3c00               cmp ax, 0x3c
8:471D  7f07                 jg 0x4726
8:471F  c746e60f00           mov word ptr [bp - 0x1a], 0xf
8:4724  eb22                 jmp 0x4748
loc_4726:
8:4726  3d4600               cmp ax, 0x46
8:4729  7f07                 jg 0x4732
8:472B  c746e60e00           mov word ptr [bp - 0x1a], 0xe
8:4730  eb16                 jmp 0x4748
loc_4732:
8:4732  3d5000               cmp ax, 0x50
8:4735  7f07                 jg 0x473e
8:4737  c746e60d00           mov word ptr [bp - 0x1a], 0xd
8:473C  eb0a                 jmp 0x4748
loc_473E:
8:473E  3d5a00               cmp ax, 0x5a
8:4741  7f05                 jg 0x4748
8:4743  c746e60c00           mov word ptr [bp - 0x1a], 0xc
loc_4748:
8:4748  ff76e6               push word ptr [bp - 0x1a]
8:474B  c45e06               les bx, ptr [bp + 6]
8:474E  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:4754  9a58328845           lcall 0x4588, 0x3258  ; sub_s7:3258
8:4759  5e                   pop si
8:475A  5f                   pop di
8:475B  c9                   leave
8:475C  ca0400               retf 4
8:475F  db 00

; ---------------- sub_s8:4760 FAR size=384 callers=1
8:4760  c82c0000             enter 0x2c, 0
8:4764  c45e06               les bx, ptr [bp + 6]
8:4767  268b870c02           mov ax, word ptr es:[bx + 0x20c]
8:476C  26014722             add word ptr es:[bx + 0x22], ax
8:4770  6a26                 push 0x26
8:4772  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:4777  9afac69747           lcall 0x4797, 0xc6fa  ; sub_s2:C6FA
8:477C  52                   push dx
8:477D  50                   push ax
8:477E  66ff7606             push dword ptr [bp + 6]
8:4782  90                   nop
8:4783  0e                   push cs
8:4784  e8e705               call 0x4d6e  ; sub_s8:4D6E
8:4787  8946f8               mov word ptr [bp - 8], ax
8:478A  8956fa               mov word ptr [bp - 6], dx
8:478D  6a1a                 push 0x1a
8:478F  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:4794  9afac67346           lcall 0x4673, 0xc6fa  ; sub_s2:C6FA
8:4799  52                   push dx
8:479A  50                   push ax
8:479B  66ff7606             push dword ptr [bp + 6]
8:479F  90                   nop
8:47A0  0e                   push cs
8:47A1  e8ca05               call 0x4d6e  ; sub_s8:4D6E
8:47A4  8946f4               mov word ptr [bp - 0xc], ax
8:47A7  8956f6               mov word ptr [bp - 0xa], dx
8:47AA  52                   push dx
8:47AB  c45ef4               les bx, ptr [bp - 0xc]
8:47AE  50                   push ax
8:47AF  26c41f               les bx, ptr es:[bx]
8:47B2  26ff5f10             lcall es:[bx + 0x10]
8:47B6  0bd0                 or dx, ax
8:47B8  7578                 jne 0x4832
8:47BA  c45ef8               les bx, ptr [bp - 8]
8:47BD  06                   push es
8:47BE  53                   push bx
8:47BF  26c41f               les bx, ptr es:[bx]
8:47C2  26ff5f10             lcall es:[bx + 0x10]
8:47C6  c45e06               les bx, ptr [bp + 6]
8:47C9  26014722             add word ptr es:[bx + 0x22], ax
loc_47CD:
8:47CD  668b46f8             mov eax, dword ptr [bp - 8]
8:47D1  660bc0               or eax, eax
8:47D4  740d                 je 0x47e3
8:47D6  6a01                 push 1
8:47D8  c45ef8               les bx, ptr [bp - 8]
8:47DB  06                   push es
8:47DC  50                   push ax
8:47DD  26c41f               les bx, ptr es:[bx]
8:47E0  26ff1f               lcall es:[bx]
loc_47E3:
8:47E3  668b46f4             mov eax, dword ptr [bp - 0xc]
8:47E7  660bc0               or eax, eax
8:47EA  740d                 je 0x47f9
8:47EC  6a01                 push 1
8:47EE  c45ef4               les bx, ptr [bp - 0xc]
8:47F1  06                   push es
8:47F2  50                   push ax
8:47F3  26c41f               les bx, ptr es:[bx]
8:47F6  26ff1f               lcall es:[bx]
loc_47F9:
8:47F9  66ff7606             push dword ptr [bp + 6]
8:47FD  90                   nop
8:47FE  0e                   push cs
8:47FF  e8e2fd               call 0x45e4  ; sub_s8:45E4
8:4802  c45e06               les bx, ptr [bp + 6]
8:4805  26837f2432           cmp word ptr es:[bx + 0x24], 0x32
8:480A  7e04                 jle 0x4810
8:480C  26ff4f22             dec word ptr es:[bx + 0x22]
loc_4810:
8:4810  c45e06               les bx, ptr [bp + 6]
8:4813  26837f2432           cmp word ptr es:[bx + 0x24], 0x32
8:4818  7d04                 jge 0x481e
8:481A  26ff4722             inc word ptr es:[bx + 0x22]
loc_481E:
8:481E  c45e06               les bx, ptr [bp + 6]
8:4821  26817f18fa00         cmp word ptr es:[bx + 0x18], 0xfa
8:4827  7d6d                 jge 0x4896
8:4829  2683472202           add word ptr es:[bx + 0x22], 2
8:482E  e98e00               jmp 0x48bf
8:4831  db 90
loc_4832:
8:4832  c45ef8               les bx, ptr [bp - 8]
8:4835  06                   push es
8:4836  53                   push bx
8:4837  26c41f               les bx, ptr es:[bx]
8:483A  26ff5f10             lcall es:[bx + 0x10]
8:483E  8946ec               mov word ptr [bp - 0x14], ax
8:4841  8956ee               mov word ptr [bp - 0x12], dx
8:4844  66c746e800000000     mov dword ptr [bp - 0x18], 0
8:484C  eb1b                 jmp 0x4869
loc_484E:
8:484E  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:4852  268b07               mov ax, word ptr es:[bx]
8:4855  8946e0               mov word ptr [bp - 0x20], ax
8:4858  f646e001             test byte ptr [bp - 0x20], 1
8:485C  7507                 jne 0x4865
loc_485E:
8:485E  c45e06               les bx, ptr [bp + 6]
8:4861  26ff4722             inc word ptr es:[bx + 0x22]
loc_4865:
8:4865  66ff46e8             inc dword ptr [bp - 0x18]
loc_4869:
8:4869  668b46ec             mov eax, dword ptr [bp - 0x14]
8:486D  663946e8             cmp dword ptr [bp - 0x18], eax
8:4871  0f8358ff             jae 0x47cd
8:4875  66ff76f4             push dword ptr [bp - 0xc]
8:4879  66ff76e8             push dword ptr [bp - 0x18]
8:487D  66ff76f8             push dword ptr [bp - 8]
8:4881  9a7c1df845           lcall 0x45f8, 0x1d7c  ; sub_s7:1D7C
8:4886  52                   push dx
8:4887  50                   push ax
8:4888  9a945aaf40           lcall 0x40af, 0x5a94  ; sub_s6:5A94
8:488D  48                   dec ax
8:488E  48                   dec ax
8:488F  74bd                 je 0x484e
8:4891  48                   dec ax
8:4892  74d1                 je 0x4865
8:4894  ebc8                 jmp 0x485e
loc_4896:
8:4896  26817f18c201         cmp word ptr es:[bx + 0x18], 0x1c2
8:489C  7d06                 jge 0x48a4
8:489E  26ff4722             inc word ptr es:[bx + 0x22]
8:48A2  eb1b                 jmp 0x48bf
loc_48A4:
8:48A4  26817f182602         cmp word ptr es:[bx + 0x18], 0x226
8:48AA  7c13                 jl 0x48bf
8:48AC  26817f18ee02         cmp word ptr es:[bx + 0x18], 0x2ee
8:48B2  7d06                 jge 0x48ba
8:48B4  26ff4f22             dec word ptr es:[bx + 0x22]
8:48B8  eb05                 jmp 0x48bf
loc_48BA:
8:48BA  26836f2202           sub word ptr es:[bx + 0x22], 2
loc_48BF:
8:48BF  c45e06               les bx, ptr [bp + 6]
8:48C2  268b4722             mov ax, word ptr es:[bx + 0x22]
8:48C6  3d6400               cmp ax, 0x64
8:48C9  7e03                 jle 0x48ce
8:48CB  b86400               mov ax, 0x64
loc_48CE:
8:48CE  26894722             mov word ptr es:[bx + 0x22], ax
8:48D2  0bc0                 or ax, ax
8:48D4  7d02                 jge 0x48d8
8:48D6  33c0                 xor ax, ax
loc_48D8:
8:48D8  26894722             mov word ptr es:[bx + 0x22], ax
8:48DC  c9                   leave
8:48DD  ca0400               retf 4

; ---------------- sub_s8:48E0 FAR size=32 callers=1
8:48E0  c8020000             enter 2, 0
8:48E4  c45e06               les bx, ptr [bp + 6]
8:48E7  268b870e02           mov ax, word ptr es:[bx + 0x20e]
8:48EC  03460a               add ax, word ptr [bp + 0xa]
8:48EF  3d0a00               cmp ax, 0xa
8:48F2  7e03                 jle 0x48f7
8:48F4  b80a00               mov ax, 0xa
loc_48F7:
8:48F7  2689870e02           mov word ptr es:[bx + 0x20e], ax
8:48FC  c9                   leave
8:48FD  ca0600               retf 6

; ---------------- sub_s8:4900 FAR size=24 callers=6
8:4900  55                   push bp
8:4901  8bec                 mov bp, sp
8:4903  c45e06               les bx, ptr [bp + 6]
8:4906  26ff8f0e02           dec word ptr es:[bx + 0x20e]
8:490B  7907                 jns 0x4914
8:490D  26c7870e020000       mov word ptr es:[bx + 0x20e], 0
loc_4914:
8:4914  c9                   leave
8:4915  ca0600               retf 6

; ---------------- sub_s8:4918 FAR size=520 callers=1
8:4918  c85c0100             enter 0x15c, 0
8:491C  57                   push di
8:491D  56                   push si
8:491E  c45e06               les bx, ptr [bp + 6]
8:4921  6626817f0401000004   cmp dword ptr es:[bx + 4], 0x4000001
8:492A  0f85eb01             jne 0x4b19
8:492E  6626ff7708           push dword ptr es:[bx + 8]
8:4933  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:4938  9aece1a54a           lcall 0x4aa5, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:493D  8946fc               mov word ptr [bp - 4], ax
8:4940  8956fe               mov word ptr [bp - 2], dx
8:4943  c45efc               les bx, ptr [bp - 4]
8:4946  66268b4710           mov eax, dword ptr es:[bx + 0x10]
8:494B  268b5712             mov dx, word ptr es:[bx + 0x12]
8:494F  668946f8             mov dword ptr [bp - 8], eax
8:4953  c45ef8               les bx, ptr [bp - 8]
8:4956  26837f1c00           cmp word ptr es:[bx + 0x1c], 0
8:495B  0f84ba01             je 0x4b19
8:495F  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:4967  c45e06               les bx, ptr [bp + 6]
8:496A  268b870e02           mov ax, word ptr es:[bx + 0x20e]
8:496F  eb55                 jmp 0x49c6
8:4971  db 90
loc_4972:
8:4972  c746f40c00           mov word ptr [bp - 0xc], 0xc
8:4977  eb46                 jmp 0x49bf
8:4979  db 90
loc_497A:
8:497A  c746f40e00           mov word ptr [bp - 0xc], 0xe
8:497F  eb3e                 jmp 0x49bf
8:4981  db 90
loc_4982:
8:4982  c746f41000           mov word ptr [bp - 0xc], 0x10
8:4987  eb36                 jmp 0x49bf
8:4989  db 90
loc_498A:
8:498A  c746f41200           mov word ptr [bp - 0xc], 0x12  ; 'version %d %d'
8:498F  eb2e                 jmp 0x49bf
8:4991  db 90
loc_4992:
8:4992  c746f41400           mov word ptr [bp - 0xc], 0x14
8:4997  eb26                 jmp 0x49bf
8:4999  db 90
loc_499A:
8:499A  c746f41600           mov word ptr [bp - 0xc], 0x16
8:499F  eb1e                 jmp 0x49bf
8:49A1  db 90
loc_49A2:
8:49A2  c746f41800           mov word ptr [bp - 0xc], 0x18
8:49A7  eb16                 jmp 0x49bf
8:49A9  db 90
loc_49AA:
8:49AA  c746f41a00           mov word ptr [bp - 0xc], 0x1a
8:49AF  eb0e                 jmp 0x49bf
8:49B1  db 90
loc_49B2:
8:49B2  c746f41c00           mov word ptr [bp - 0xc], 0x1c
8:49B7  eb06                 jmp 0x49bf
8:49B9  db 90
loc_49BA:
8:49BA  c746f41e00           mov word ptr [bp - 0xc], 0x1e
loc_49BF:
8:49BF  c746f60000           mov word ptr [bp - 0xa], 0
8:49C4  eb22                 jmp 0x49e8
loc_49C6:
8:49C6  48                   dec ax
8:49C7  3d0900               cmp ax, 9
8:49CA  771c                 ja 0x49e8
8:49CC  03c0                 add ax, ax
8:49CE  93                   xchg bx, ax
8:49CF  2effa7d449           jmp word ptr cs:[bx + 0x49d4]
switch_table_49D4:
    dw loc_49BA
    dw loc_49B2
    dw loc_49AA
    dw loc_49A2
    dw loc_499A
    dw loc_4992
    dw loc_498A
    dw loc_4982
    dw loc_497A
    dw loc_4972
loc_49E8:
8:49E8  c41ee265             les bx, ptr [0x65e2]  ; g_objectDb
8:49EC  66268b07             mov eax, dword ptr es:[bx]
8:49F0  268b5702             mov dx, word ptr es:[bx + 2]
8:49F4  668946f0             mov dword ptr [bp - 0x10], eax
8:49F8  8b46f6               mov ax, word ptr [bp - 0xa]
8:49FB  0b46f4               or ax, word ptr [bp - 0xc]
8:49FE  0f841701             je 0x4b19
8:4A02  66ff76f4             push dword ptr [bp - 0xc]
8:4A06  52                   push dx
8:4A07  ff76f0               push word ptr [bp - 0x10]
8:4A0A  6658                 pop eax
8:4A0C  6659                 pop ecx
8:4A0E  6633d2               xor edx, edx
8:4A11  66f7f1               div ecx
8:4A14  668bc2               mov eax, edx
8:4A17  66c1ea10             shr edx, 0x10
8:4A1B  0bd0                 or dx, ax
8:4A1D  0f85f800             jne 0x4b19
8:4A21  c45ef8               les bx, ptr [bp - 8]
8:4A24  26ff4f1c             dec word ptr es:[bx + 0x1c]
8:4A28  26ff471a             inc word ptr es:[bx + 0x1a]
8:4A2C  268b471a             mov ax, word ptr es:[bx + 0x1a]
8:4A30  8bc8                 mov cx, ax
8:4A32  03c0                 add ax, ax
8:4A34  03c1                 add ax, cx
8:4A36  03c0                 add ax, ax
8:4A38  26034716             add ax, word ptr es:[bx + 0x16]
8:4A3C  268b5718             mov dx, word ptr es:[bx + 0x18]
8:4A40  2d0600               sub ax, 6
8:4A43  1e                   push ds
8:4A44  8d7ee2               lea di, [bp - 0x1e]
8:4A47  8bf0                 mov si, ax
8:4A49  16                   push ss
8:4A4A  07                   pop es
8:4A4B  8eda                 mov ds, dx
8:4A4D  66a5                 movsd dword ptr es:[di], dword ptr [si]
8:4A4F  a5                   movsw word ptr es:[di], word ptr [si]
8:4A50  1f                   pop ds
8:4A51  8d46e2               lea ax, [bp - 0x1e]
8:4A54  8986bcfe             mov word ptr [bp - 0x144], ax
8:4A58  8d86b8fe             lea ax, [bp - 0x148]
8:4A5C  16                   push ss
8:4A5D  50                   push ax
8:4A5E  c45e06               les bx, ptr [bp + 6]
8:4A61  6626ff7708           push dword ptr es:[bx + 8]
8:4A66  8d46e2               lea ax, [bp - 0x1e]
8:4A69  16                   push ss
8:4A6A  50                   push ax
8:4A6B  66ff364057           push dword ptr [0x5740]
8:4A70  9ace64b44a           lcall 0x4ab4, 0x64ce  ; sub_s7:64CE
8:4A75  8bd8                 mov bx, ax
8:4A77  8ec2                 mov es, dx
8:4A79  66268b07             mov eax, dword ptr es:[bx]
8:4A7D  268b5702             mov dx, word ptr es:[bx + 2]
8:4A81  668946e8             mov dword ptr [bp - 0x18], eax
8:4A85  668986aefe           mov dword ptr [bp - 0x152], eax
8:4A8A  668986a4fe           mov dword ptr [bp - 0x15c], eax
8:4A8F  8a86a7fe             mov al, byte ptr [bp - 0x159]
8:4A93  2ae4                 sub ah, ah
8:4A95  a8ff                 test al, 0xff
8:4A97  743f                 je 0x4ad8
8:4A99  52                   push dx
8:4A9A  ff76e8               push word ptr [bp - 0x18]
8:4A9D  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:4AA2  9aece1fb4a           lcall 0x4afb, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:4AA7  8986a4fe             mov word ptr [bp - 0x15c], ax
8:4AAB  8996a6fe             mov word ptr [bp - 0x15a], dx
8:4AAF  52                   push dx
8:4AB0  50                   push ax
8:4AB1  9aa8730b4b           lcall 0x4b0b, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:4AB6  8986a8fe             mov word ptr [bp - 0x158], ax
8:4ABA  8996aafe             mov word ptr [bp - 0x156], dx
8:4ABE  0bd0                 or dx, ax
8:4AC0  7416                 je 0x4ad8
8:4AC2  c49ea8fe             les bx, ptr [bp - 0x158]
8:4AC6  268b470c             mov ax, word ptr es:[bx + 0xc]
8:4ACA  8986acfe             mov word ptr [bp - 0x154], ax
8:4ACE  48                   dec ax
8:4ACF  7c48                 jl 0x4b19
8:4AD1  7046                 jo 0x4b19
8:4AD3  2d0800               sub ax, 8
8:4AD6  7f41                 jg 0x4b19
loc_4AD8:
8:4AD8  c45e06               les bx, ptr [bp + 6]
8:4ADB  6626ff7708           push dword ptr es:[bx + 8]
8:4AE0  6626ff7704           push dword ptr es:[bx + 4]
8:4AE5  8d46e2               lea ax, [bp - 0x1e]
8:4AE8  16                   push ss
8:4AE9  50                   push ax
8:4AEA  666800001000         push 0x100000
8:4AF0  6a00                 push 0
8:4AF2  8d86befe             lea ax, [bp - 0x142]
8:4AF6  16                   push ss
8:4AF7  50                   push ax
8:4AF8  9af0878b48           lcall 0x488b, 0x87f0  ; SCInternalPutBldg@s6:87F0
8:4AFD  8d86befe             lea ax, [bp - 0x142]
8:4B01  16                   push ss
8:4B02  50                   push ax
8:4B03  66ff364857           push dword ptr [0x5748]  ; g_sim
8:4B08  9a5a838448           lcall 0x4884, 0x835a  ; Sim::enqueue@s7:835A
8:4B0D  c786befe9a38         mov word ptr [bp - 0x142], 0x389a
8:4B13  c786c0fe7a47         mov word ptr [bp - 0x140], 0x477a  ; SEGMENT s2:0000
loc_4B19:
8:4B19  5e                   pop si
8:4B1A  5f                   pop di
8:4B1B  c9                   leave
8:4B1C  ca0400               retf 4
8:4B1F  db 00

; ---------------- sub_s8:4B20 FAR size=32 callers=1
8:4B20  c8040000             enter 4, 0
8:4B24  66ff760e             push dword ptr [bp + 0xe]
8:4B28  66ff760a             push dword ptr [bp + 0xa]
8:4B2C  c45e06               les bx, ptr [bp + 6]
8:4B2F  66268b470c           mov eax, dword ptr es:[bx + 0xc]
8:4B34  6650                 push eax
8:4B36  9af4c4d233           lcall 0x33d2, 0xc4f4  ; sub_s5:C4F4
8:4B3B  c9                   leave
8:4B3C  ca0c00               retf 0xc
8:4B3F  db 00

; ---------------- sub_s8:4B40 FAR size=218 callers=1
8:4B40  c82a0000             enter 0x2a, 0
8:4B44  66c746fc00000000     mov dword ptr [bp - 4], 0
8:4B4C  c45e06               les bx, ptr [bp + 6]
8:4B4F  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:4B55  7413                 je 0x4b6a
8:4B57  6626ff770c           push dword ptr es:[bx + 0xc]
8:4B5C  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4B60  26c41f               les bx, ptr es:[bx]
8:4B63  26ff5f10             lcall es:[bx + 0x10]
8:4B67  eb04                 jmp 0x4b6d
8:4B69  db 90
loc_4B6A:
8:4B6A  33c0                 xor ax, ax
8:4B6C  99                   cdq
loc_4B6D:
8:4B6D  8946f8               mov word ptr [bp - 8], ax
8:4B70  8956fa               mov word ptr [bp - 6], dx
8:4B73  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:4B7B  eb26                 jmp 0x4ba3
8:4B7D  db 90
loc_4B7E:
8:4B7E  8d4714               lea ax, [bx + 0x14]
8:4B81  8946de               mov word ptr [bp - 0x22], ax
8:4B84  8956e0               mov word ptr [bp - 0x20], dx
8:4B87  c45ede               les bx, ptr [bp - 0x22]
loc_4B8A:
8:4B8A  26c41f               les bx, ptr es:[bx]
8:4B8D  66268b878c00         mov eax, dword ptr es:[bx + 0x8c]
8:4B93  668946e4             mov dword ptr [bp - 0x1c], eax
loc_4B97:
8:4B97  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:4B9B  660146fc             add dword ptr [bp - 4], eax
loc_4B9F:
8:4B9F  66ff46f4             inc dword ptr [bp - 0xc]
loc_4BA3:
8:4BA3  668b46f8             mov eax, dword ptr [bp - 8]
8:4BA7  663946f4             cmp dword ptr [bp - 0xc], eax
8:4BAB  7363                 jae 0x4c10
8:4BAD  66ff76f4             push dword ptr [bp - 0xc]
8:4BB1  c45e06               les bx, ptr [bp + 6]
8:4BB4  6626ff770c           push dword ptr es:[bx + 0xc]
8:4BB9  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4BBD  26c41f               les bx, ptr es:[bx]
8:4BC0  26ff5f04             lcall es:[bx + 4]
8:4BC4  8956f2               mov word ptr [bp - 0xe], dx
8:4BC7  0bd0                 or dx, ax
8:4BC9  74d4                 je 0x4b9f
8:4BCB  ff76f2               push word ptr [bp - 0xe]
8:4BCE  50                   push ax
8:4BCF  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:4BD4  9aece13b49           lcall 0x493b, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:4BD9  52                   push dx
8:4BDA  50                   push ax
8:4BDB  9aa873734a           lcall 0x4a73, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:4BE0  8946e8               mov word ptr [bp - 0x18], ax
8:4BE3  8956ea               mov word ptr [bp - 0x16], dx
8:4BE6  c45ee8               les bx, ptr [bp - 0x18]
8:4BE9  268b4712             mov ax, word ptr es:[bx + 0x12]
8:4BED  2d0400               sub ax, 4
8:4BF0  748c                 je 0x4b7e
8:4BF2  48                   dec ax
8:4BF3  740b                 je 0x4c00
8:4BF5  66c746e400000000     mov dword ptr [bp - 0x1c], 0
8:4BFD  eb98                 jmp 0x4b97
8:4BFF  db 90
loc_4C00:
8:4C00  8d4714               lea ax, [bx + 0x14]
8:4C03  8946d6               mov word ptr [bp - 0x2a], ax
8:4C06  8956d8               mov word ptr [bp - 0x28], dx
8:4C09  c45ed6               les bx, ptr [bp - 0x2a]
8:4C0C  e97bff               jmp 0x4b8a
8:4C0F  db 90
loc_4C10:
8:4C10  8b46fc               mov ax, word ptr [bp - 4]
8:4C13  8b56fe               mov dx, word ptr [bp - 2]
8:4C16  c9                   leave
8:4C17  ca0400               retf 4

; ---------------- sub_s8:4C1A FAR size=160 callers=1
8:4C1A  c8160000             enter 0x16, 0
8:4C1E  66c746fc00000000     mov dword ptr [bp - 4], 0
8:4C26  c45e06               les bx, ptr [bp + 6]
8:4C29  6626ff770c           push dword ptr es:[bx + 0xc]
8:4C2E  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4C32  26c41f               les bx, ptr es:[bx]
8:4C35  26ff5f10             lcall es:[bx + 0x10]
8:4C39  8946f8               mov word ptr [bp - 8], ax
8:4C3C  8956fa               mov word ptr [bp - 6], dx
8:4C3F  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:4C47  eb05                 jmp 0x4c4e
8:4C49  db 90
loc_4C4A:
8:4C4A  66ff46f4             inc dword ptr [bp - 0xc]
loc_4C4E:
8:4C4E  668b46f8             mov eax, dword ptr [bp - 8]
8:4C52  663946f4             cmp dword ptr [bp - 0xc], eax
8:4C56  734a                 jae 0x4ca2
8:4C58  66ff76f4             push dword ptr [bp - 0xc]
8:4C5C  c45e06               les bx, ptr [bp + 6]
8:4C5F  6626ff770c           push dword ptr es:[bx + 0xc]
8:4C64  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4C68  26c41f               les bx, ptr es:[bx]
8:4C6B  26ff5f04             lcall es:[bx + 4]
8:4C6F  8956f2               mov word ptr [bp - 0xe], dx
8:4C72  0bd0                 or dx, ax
8:4C74  74d4                 je 0x4c4a
8:4C76  ff76f2               push word ptr [bp - 0xe]
8:4C79  50                   push ax
8:4C7A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:4C7F  9aece1d74b           lcall 0x4bd7, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:4C84  52                   push dx
8:4C85  50                   push ax
8:4C86  9aa06fde4b           lcall 0x4bde, 0x6fa0  ; sub_s7:6FA0
8:4C8B  6a0e                 push 0xe
8:4C8D  50                   push ax
8:4C8E  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:4C93  9aaec6174b           lcall 0x4b17, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:4C98  0bc0                 or ax, ax
8:4C9A  74ae                 je 0x4c4a
8:4C9C  66ff46fc             inc dword ptr [bp - 4]
8:4CA0  eba8                 jmp 0x4c4a
loc_4CA2:
8:4CA2  668b46fc             mov eax, dword ptr [bp - 4]
8:4CA6  66b919000000         mov ecx, 0x19
8:4CAC  66f7e1               mul ecx
8:4CAF  668bd0               mov edx, eax
8:4CB2  66c1ea10             shr edx, 0x10
8:4CB6  c9                   leave
8:4CB7  ca0400               retf 4

; ---------------- sub_s8:4CBA FAR size=22 callers=1
8:4CBA  55                   push bp
8:4CBB  8bec                 mov bp, sp
8:4CBD  c45e06               les bx, ptr [bp + 6]
8:4CC0  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:4CC6  9ab838894c           lcall 0x4c89, 0x38b8  ; sub_s7:38B8
8:4CCB  c9                   leave
8:4CCC  ca0400               retf 4
8:4CCF  db 00

; ---------------- sub_s8:4CD0 FAR size=26 callers=2
8:4CD0  55                   push bp
8:4CD1  8bec                 mov bp, sp
8:4CD3  8b460e               mov ax, word ptr [bp + 0xe]
8:4CD6  c45e06               les bx, ptr [bp + 6]
8:4CD9  2689471c             mov word ptr es:[bx + 0x1c], ax
8:4CDD  668b460a             mov eax, dword ptr [bp + 0xa]
8:4CE1  662689471e           mov dword ptr es:[bx + 0x1e], eax
8:4CE6  c9                   leave
8:4CE7  ca0a00               retf 0xa

; ---------------- sub_s8:4CEA FAR size=36 callers=2
8:4CEA  55                   push bp
8:4CEB  8bec                 mov bp, sp
8:4CED  c45e06               les bx, ptr [bp + 6]
8:4CF0  268b471c             mov ax, word ptr es:[bx + 0x1c]
8:4CF4  c45e0e               les bx, ptr [bp + 0xe]
8:4CF7  268907               mov word ptr es:[bx], ax
8:4CFA  c45e06               les bx, ptr [bp + 6]
8:4CFD  66268b471e           mov eax, dword ptr es:[bx + 0x1e]
8:4D02  c45e0a               les bx, ptr [bp + 0xa]
8:4D05  66268907             mov dword ptr es:[bx], eax
8:4D09  c9                   leave
8:4D0A  ca0c00               retf 0xc
8:4D0D  db 00

; ---------------- sub_s8:4D0E FAR size=26 callers=5
8:4D0E  55                   push bp
8:4D0F  8bec                 mov bp, sp
8:4D11  c45e06               les bx, ptr [bp + 6]
8:4D14  268b4718             mov ax, word ptr es:[bx + 0x18]
8:4D18  2689471a             mov word ptr es:[bx + 0x1a], ax
8:4D1C  8b460a               mov ax, word ptr [bp + 0xa]
8:4D1F  26894718             mov word ptr es:[bx + 0x18], ax
8:4D23  c9                   leave
8:4D24  ca0600               retf 6
8:4D27  db 00

; ---------------- sub_s8:4D28 FAR size=20 callers=12
8:4D28  55                   push bp
8:4D29  8bec                 mov bp, sp
8:4D2B  c45e06               les bx, ptr [bp + 6]
8:4D2E  268b87fa01           mov ax, word ptr es:[bx + 0x1fa]
8:4D33  268b97fc01           mov dx, word ptr es:[bx + 0x1fc]
8:4D38  c9                   leave
8:4D39  ca0400               retf 4

; ---------------- sub_s8:4D3C FAR size=50 callers=2
8:4D3C  c8080000             enter 8, 0
8:4D40  c45e06               les bx, ptr [bp + 6]
8:4D43  66268b87fa01         mov eax, dword ptr es:[bx + 0x1fa]
8:4D49  6650                 push eax
8:4D4B  9ace170f40           lcall 0x400f, 0x17ce  ; operator_delete@s1:17CE
8:4D50  83c404               add sp, 4
8:4D53  66ff760a             push dword ptr [bp + 0xa]
8:4D57  9ae860964c           lcall 0x4c96, 0x60e8  ; sub_s2:60E8
8:4D5C  c45e06               les bx, ptr [bp + 6]
8:4D5F  268987fa01           mov word ptr es:[bx + 0x1fa], ax
8:4D64  268997fc01           mov word ptr es:[bx + 0x1fc], dx
8:4D69  c9                   leave
8:4D6A  ca0800               retf 8
8:4D6D  db 00

; ---------------- sub_s8:4D6E FAR size=266 callers=25
8:4D6E  c8260000             enter 0x26, 0
8:4D72  56                   push si
8:4D73  6a18                 push 0x18
8:4D75  9a9c174e4d           lcall 0x4d4e, 0x179c  ; operator_new@s1:179C
8:4D7A  83c402               add sp, 2
8:4D7D  8956f2               mov word ptr [bp - 0xe], dx
8:4D80  0bd0                 or dx, ax
8:4D82  7412                 je 0x4d96
8:4D84  666a05               push 5
8:4D87  666a05               push 5
8:4D8A  ff76f2               push word ptr [bp - 0xe]
8:4D8D  50                   push ax
8:4D8E  9ad81cf54d           lcall 0x4df5, 0x1cd8  ; sub_s7:1CD8
8:4D93  eb04                 jmp 0x4d99
8:4D95  db 90
loc_4D96:
8:4D96  33c0                 xor ax, ax
8:4D98  99                   cdq
loc_4D99:
8:4D99  8946fc               mov word ptr [bp - 4], ax
8:4D9C  8956fe               mov word ptr [bp - 2], dx
8:4D9F  c45e06               les bx, ptr [bp + 6]
8:4DA2  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:4DA8  7412                 je 0x4dbc
8:4DAA  6626ff770c           push dword ptr es:[bx + 0xc]
8:4DAF  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4DB3  26c41f               les bx, ptr es:[bx]
8:4DB6  26ff5f10             lcall es:[bx + 0x10]
8:4DBA  eb03                 jmp 0x4dbf
loc_4DBC:
8:4DBC  33c0                 xor ax, ax
8:4DBE  99                   cdq
loc_4DBF:
8:4DBF  8946f8               mov word ptr [bp - 8], ax
8:4DC2  8956fa               mov word ptr [bp - 6], dx
8:4DC5  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:4DCD  eb4c                 jmp 0x4e1b
8:4DCF  db 90
loc_4DD0:
8:4DD0  ff46e4               inc word ptr [bp - 0x1c]
loc_4DD3:
8:4DD3  8b46e4               mov ax, word ptr [bp - 0x1c]
8:4DD6  c45e0a               les bx, ptr [bp + 0xa]
8:4DD9  26394704             cmp word ptr es:[bx + 4], ax
8:4DDD  7e38                 jle 0x4e17
8:4DDF  8bf0                 mov si, ax
8:4DE1  03f0                 add si, ax
8:4DE3  26c41f               les bx, ptr es:[bx]
8:4DE6  8b46e6               mov ax, word ptr [bp - 0x1a]
8:4DE9  263900               cmp word ptr es:[bx + si], ax
8:4DEC  75e2                 jne 0x4dd0
8:4DEE  66ff76e8             push dword ptr [bp - 0x18]
8:4DF2  9aa8735f4e           lcall 0x4e5f, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:4DF7  8946e0               mov word ptr [bp - 0x20], ax
8:4DFA  8956e2               mov word ptr [bp - 0x1e], dx
8:4DFD  c45ee0               les bx, ptr [bp - 0x20]
8:4E00  26837f1205           cmp word ptr es:[bx + 0x12], 5
8:4E05  7510                 jne 0x4e17
8:4E07  66ff76ec             push dword ptr [bp - 0x14]
8:4E0B  c45efc               les bx, ptr [bp - 4]
8:4E0E  06                   push es
8:4E0F  53                   push bx
8:4E10  26c41f               les bx, ptr es:[bx]
8:4E13  26ff5f0c             lcall es:[bx + 0xc]
loc_4E17:
8:4E17  66ff46f4             inc dword ptr [bp - 0xc]
loc_4E1B:
8:4E1B  668b46f8             mov eax, dword ptr [bp - 8]
8:4E1F  663946f4             cmp dword ptr [bp - 0xc], eax
8:4E23  7347                 jae 0x4e6c
8:4E25  66ff76f4             push dword ptr [bp - 0xc]
8:4E29  c45e06               les bx, ptr [bp + 6]
8:4E2C  6626ff770c           push dword ptr es:[bx + 0xc]
8:4E31  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4E35  26c41f               les bx, ptr es:[bx]
8:4E38  26ff5f04             lcall es:[bx + 4]
8:4E3C  8946ec               mov word ptr [bp - 0x14], ax
8:4E3F  8956ee               mov word ptr [bp - 0x12], dx
8:4E42  0bd0                 or dx, ax
8:4E44  74d1                 je 0x4e17
8:4E46  ff76ee               push word ptr [bp - 0x12]
8:4E49  50                   push ax
8:4E4A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:4E4F  9aece1824c           lcall 0x4c82, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:4E54  8946e8               mov word ptr [bp - 0x18], ax
8:4E57  8956ea               mov word ptr [bp - 0x16], dx
8:4E5A  52                   push dx
8:4E5B  50                   push ax
8:4E5C  9aa06fc94c           lcall 0x4cc9, 0x6fa0  ; sub_s7:6FA0
8:4E61  8946e6               mov word ptr [bp - 0x1a], ax
8:4E64  c746e40000           mov word ptr [bp - 0x1c], 0
8:4E69  e967ff               jmp 0x4dd3
loc_4E6C:
8:4E6C  8b46fc               mov ax, word ptr [bp - 4]
8:4E6F  8b56fe               mov dx, word ptr [bp - 2]
8:4E72  5e                   pop si
8:4E73  c9                   leave
8:4E74  ca0800               retf 8
8:4E77  db 00

; ---------------- sub_s8:4E78 FAR size=220 callers=16
8:4E78  c8200000             enter 0x20, 0
8:4E7C  56                   push si
8:4E7D  6a18                 push 0x18
8:4E7F  9a9c17784d           lcall 0x4d78, 0x179c  ; operator_new@s1:179C
8:4E84  83c402               add sp, 2
8:4E87  8956f2               mov word ptr [bp - 0xe], dx
8:4E8A  0bd0                 or dx, ax
8:4E8C  7412                 je 0x4ea0
8:4E8E  666a05               push 5
8:4E91  666a05               push 5
8:4E94  ff76f2               push word ptr [bp - 0xe]
8:4E97  50                   push ax
8:4E98  9ad81c294f           lcall 0x4f29, 0x1cd8  ; sub_s7:1CD8
8:4E9D  eb04                 jmp 0x4ea3
8:4E9F  db 90
loc_4EA0:
8:4EA0  33c0                 xor ax, ax
8:4EA2  99                   cdq
loc_4EA3:
8:4EA3  8946fc               mov word ptr [bp - 4], ax
8:4EA6  8956fe               mov word ptr [bp - 2], dx
8:4EA9  c45e06               les bx, ptr [bp + 6]
8:4EAC  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:4EB2  7412                 je 0x4ec6
8:4EB4  6626ff770c           push dword ptr es:[bx + 0xc]
8:4EB9  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4EBD  26c41f               les bx, ptr es:[bx]
8:4EC0  26ff5f10             lcall es:[bx + 0x10]
8:4EC4  eb03                 jmp 0x4ec9
loc_4EC6:
8:4EC6  33c0                 xor ax, ax
8:4EC8  99                   cdq
loc_4EC9:
8:4EC9  8946f8               mov word ptr [bp - 8], ax
8:4ECC  8956fa               mov word ptr [bp - 6], dx
8:4ECF  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:4ED7  eb37                 jmp 0x4f10
8:4ED9  db 90
loc_4EDA:
8:4EDA  ff46e8               inc word ptr [bp - 0x18]
loc_4EDD:
8:4EDD  8b46e8               mov ax, word ptr [bp - 0x18]
8:4EE0  c45e0a               les bx, ptr [bp + 0xa]
8:4EE3  26394704             cmp word ptr es:[bx + 4], ax
8:4EE7  7e23                 jle 0x4f0c
8:4EE9  8bf0                 mov si, ax
8:4EEB  03f0                 add si, ax
8:4EED  26c41f               les bx, ptr es:[bx]
8:4EF0  8b46ea               mov ax, word ptr [bp - 0x16]
8:4EF3  263900               cmp word ptr es:[bx + si], ax
8:4EF6  75e2                 jne 0x4eda
8:4EF8  c45eec               les bx, ptr [bp - 0x14]
8:4EFB  6626ff7704           push dword ptr es:[bx + 4]
8:4F00  c45efc               les bx, ptr [bp - 4]
8:4F03  06                   push es
8:4F04  53                   push bx
8:4F05  26c41f               les bx, ptr es:[bx]
8:4F08  26ff5f0c             lcall es:[bx + 0xc]
loc_4F0C:
8:4F0C  66ff46f4             inc dword ptr [bp - 0xc]
loc_4F10:
8:4F10  668b46f8             mov eax, dword ptr [bp - 8]
8:4F14  663946f4             cmp dword ptr [bp - 0xc], eax
8:4F18  732e                 jae 0x4f48
8:4F1A  66ff76f4             push dword ptr [bp - 0xc]
8:4F1E  c45e06               les bx, ptr [bp + 6]
8:4F21  6626ff770c           push dword ptr es:[bx + 0xc]
8:4F26  9a581d3c4f           lcall 0x4f3c, 0x1d58  ; sub_s7:1D58
8:4F2B  8946ec               mov word ptr [bp - 0x14], ax
8:4F2E  8956ee               mov word ptr [bp - 0x12], dx
8:4F31  0bd0                 or dx, ax
8:4F33  74d7                 je 0x4f0c
8:4F35  ff76ee               push word ptr [bp - 0x12]
8:4F38  50                   push ax
8:4F39  9aa06f914d           lcall 0x4d91, 0x6fa0  ; sub_s7:6FA0
8:4F3E  8946ea               mov word ptr [bp - 0x16], ax
8:4F41  c746e80000           mov word ptr [bp - 0x18], 0
8:4F46  eb95                 jmp 0x4edd
loc_4F48:
8:4F48  8b46fc               mov ax, word ptr [bp - 4]
8:4F4B  8b56fe               mov dx, word ptr [bp - 2]
8:4F4E  5e                   pop si
8:4F4F  c9                   leave
8:4F50  ca0800               retf 8
8:4F53  db 00

; ---------------- sub_s8:4F54 FAR size=132 callers=2
8:4F54  c80e0000             enter 0xe, 0
8:4F58  c45e06               les bx, ptr [bp + 6]
8:4F5B  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:4F61  7413                 je 0x4f76
8:4F63  6626ff770c           push dword ptr es:[bx + 0xc]
8:4F68  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4F6C  26c41f               les bx, ptr es:[bx]
8:4F6F  26ff5f10             lcall es:[bx + 0x10]
8:4F73  eb04                 jmp 0x4f79
8:4F75  db 90
loc_4F76:
8:4F76  33c0                 xor ax, ax
8:4F78  99                   cdq
loc_4F79:
8:4F79  8946fc               mov word ptr [bp - 4], ax
8:4F7C  8956fe               mov word ptr [bp - 2], dx
8:4F7F  66c746f800000000     mov dword ptr [bp - 8], 0
8:4F87  eb05                 jmp 0x4f8e
8:4F89  db 90
loc_4F8A:
8:4F8A  66ff46f8             inc dword ptr [bp - 8]
loc_4F8E:
8:4F8E  668b46fc             mov eax, dword ptr [bp - 4]
8:4F92  663946f8             cmp dword ptr [bp - 8], eax
8:4F96  733a                 jae 0x4fd2
8:4F98  66ff76f8             push dword ptr [bp - 8]
8:4F9C  c45e06               les bx, ptr [bp + 6]
8:4F9F  6626ff770c           push dword ptr es:[bx + 0xc]
8:4FA4  9a581db74f           lcall 0x4fb7, 0x1d58  ; sub_s7:1D58
8:4FA9  8956f6               mov word ptr [bp - 0xa], dx
8:4FAC  0bd0                 or dx, ax
8:4FAE  74da                 je 0x4f8a
8:4FB0  ff76f6               push word ptr [bp - 0xa]
8:4FB3  50                   push ax
8:4FB4  9aa06f9b4e           lcall 0x4e9b, 0x6fa0  ; sub_s7:6FA0
8:4FB9  ff760a               push word ptr [bp + 0xa]
8:4FBC  50                   push ax
8:4FBD  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:4FC2  9aaec65a4d           lcall 0x4d5a, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:4FC7  0bc0                 or ax, ax
8:4FC9  74bf                 je 0x4f8a
8:4FCB  b80100               mov ax, 1
8:4FCE  c9                   leave
8:4FCF  ca0600               retf 6
loc_4FD2:
8:4FD2  33c0                 xor ax, ax
8:4FD4  c9                   leave
8:4FD5  ca0600               retf 6

; ---------------- sub_s8:4FD8 FAR size=120 callers=1
8:4FD8  c80c0000             enter 0xc, 0
8:4FDC  c45e06               les bx, ptr [bp + 6]
8:4FDF  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:4FE5  7413                 je 0x4ffa
8:4FE7  6626ff770c           push dword ptr es:[bx + 0xc]
8:4FEC  26c45f0c             les bx, ptr es:[bx + 0xc]
8:4FF0  26c41f               les bx, ptr es:[bx]
8:4FF3  26ff5f10             lcall es:[bx + 0x10]
8:4FF7  eb04                 jmp 0x4ffd
8:4FF9  db 90
loc_4FFA:
8:4FFA  33c0                 xor ax, ax
8:4FFC  99                   cdq
loc_4FFD:
8:4FFD  8946fc               mov word ptr [bp - 4], ax
8:5000  8956fe               mov word ptr [bp - 2], dx
8:5003  66c746f800000000     mov dword ptr [bp - 8], 0
8:500B  eb05                 jmp 0x5012
8:500D  db 90
loc_500E:
8:500E  66ff46f8             inc dword ptr [bp - 8]
loc_5012:
8:5012  668b46fc             mov eax, dword ptr [bp - 4]
8:5016  663946f8             cmp dword ptr [bp - 8], eax
8:501A  732e                 jae 0x504a
8:501C  66ff76f8             push dword ptr [bp - 8]
8:5020  c45e06               les bx, ptr [bp + 6]
8:5023  6626ff770c           push dword ptr es:[bx + 0xc]
8:5028  9a581d3b50           lcall 0x503b, 0x1d58  ; sub_s7:1D58
8:502D  8956f6               mov word ptr [bp - 0xa], dx
8:5030  0bd0                 or dx, ax
8:5032  74da                 je 0x500e
8:5034  ff76f6               push word ptr [bp - 0xa]
8:5037  50                   push ax
8:5038  9aa06fa74f           lcall 0x4fa7, 0x6fa0  ; sub_s7:6FA0
8:503D  3b460a               cmp ax, word ptr [bp + 0xa]
8:5040  75cc                 jne 0x500e
8:5042  b80100               mov ax, 1
8:5045  c9                   leave
8:5046  ca0600               retf 6
8:5049  db 90
loc_504A:
8:504A  33c0                 xor ax, ax
8:504C  c9                   leave
8:504D  ca0600               retf 6

; ---------------- sub_s8:5050 FAR size=144 callers=1
8:5050  c8120000             enter 0x12, 0
8:5054  66c746fc00000000     mov dword ptr [bp - 4], 0
8:505C  c45e06               les bx, ptr [bp + 6]
8:505F  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:5065  7413                 je 0x507a
8:5067  6626ff770c           push dword ptr es:[bx + 0xc]
8:506C  26c45f0c             les bx, ptr es:[bx + 0xc]
8:5070  26c41f               les bx, ptr es:[bx]
8:5073  26ff5f10             lcall es:[bx + 0x10]
8:5077  eb04                 jmp 0x507d
8:5079  db 90
loc_507A:
8:507A  33c0                 xor ax, ax
8:507C  99                   cdq
loc_507D:
8:507D  8946f8               mov word ptr [bp - 8], ax
8:5080  8956fa               mov word ptr [bp - 6], dx
8:5083  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:508B  eb05                 jmp 0x5092
8:508D  db 90
loc_508E:
8:508E  66ff46f4             inc dword ptr [bp - 0xc]
loc_5092:
8:5092  668b46f8             mov eax, dword ptr [bp - 8]
8:5096  663946f4             cmp dword ptr [bp - 0xc], eax
8:509A  733a                 jae 0x50d6
8:509C  66ff76f4             push dword ptr [bp - 0xc]
8:50A0  c45e06               les bx, ptr [bp + 6]
8:50A3  6626ff770c           push dword ptr es:[bx + 0xc]
8:50A8  9a581dbb50           lcall 0x50bb, 0x1d58  ; sub_s7:1D58
8:50AD  8956f2               mov word ptr [bp - 0xe], dx
8:50B0  0bd0                 or dx, ax
8:50B2  74da                 je 0x508e
8:50B4  ff76f2               push word ptr [bp - 0xe]
8:50B7  50                   push ax
8:50B8  9aa06f2b50           lcall 0x502b, 0x6fa0  ; sub_s7:6FA0
8:50BD  ff760a               push word ptr [bp + 0xa]
8:50C0  50                   push ax
8:50C1  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:50C6  9aaec6c54f           lcall 0x4fc5, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:50CB  0bc0                 or ax, ax
8:50CD  74bf                 je 0x508e
8:50CF  66ff46fc             inc dword ptr [bp - 4]
8:50D3  ebb9                 jmp 0x508e
8:50D5  db 90
loc_50D6:
8:50D6  8b46fc               mov ax, word ptr [bp - 4]
8:50D9  8b56fe               mov dx, word ptr [bp - 2]
8:50DC  c9                   leave
8:50DD  ca0600               retf 6

; ---------------- sub_s8:50E0 FAR size=172 callers=1
8:50E0  c81c0000             enter 0x1c, 0
8:50E4  66c746fc00000000     mov dword ptr [bp - 4], 0
8:50EC  c45e06               les bx, ptr [bp + 6]
8:50EF  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:50F5  7413                 je 0x510a
8:50F7  6626ff770c           push dword ptr es:[bx + 0xc]
8:50FC  26c45f0c             les bx, ptr es:[bx + 0xc]
8:5100  26c41f               les bx, ptr es:[bx]
8:5103  26ff5f10             lcall es:[bx + 0x10]
8:5107  eb04                 jmp 0x510d
8:5109  db 90
loc_510A:
8:510A  33c0                 xor ax, ax
8:510C  99                   cdq
loc_510D:
8:510D  8946f8               mov word ptr [bp - 8], ax
8:5110  8956fa               mov word ptr [bp - 6], dx
8:5113  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:511B  eb05                 jmp 0x5122
8:511D  db 90
loc_511E:
8:511E  66ff46f4             inc dword ptr [bp - 0xc]
loc_5122:
8:5122  668b46f8             mov eax, dword ptr [bp - 8]
8:5126  663946f4             cmp dword ptr [bp - 0xc], eax
8:512A  7356                 jae 0x5182
8:512C  66ff76f4             push dword ptr [bp - 0xc]
8:5130  c45e06               les bx, ptr [bp + 6]
8:5133  6626ff770c           push dword ptr es:[bx + 0xc]
8:5138  9a581d4e51           lcall 0x514e, 0x1d58  ; sub_s7:1D58
8:513D  8946f0               mov word ptr [bp - 0x10], ax
8:5140  8956f2               mov word ptr [bp - 0xe], dx
8:5143  0bd0                 or dx, ax
8:5145  74d7                 je 0x511e
8:5147  ff76f2               push word ptr [bp - 0xe]
8:514A  50                   push ax
8:514B  9aa06f6951           lcall 0x5169, 0x6fa0  ; sub_s7:6FA0
8:5150  ff760a               push word ptr [bp + 0xa]
8:5153  50                   push ax
8:5154  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:5159  9aaec6c950           lcall 0x50c9, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:515E  0bc0                 or ax, ax
8:5160  74bc                 je 0x511e
8:5162  66ff76f0             push dword ptr [bp - 0x10]
8:5166  9aa873ab50           lcall 0x50ab, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:516B  8946ea               mov word ptr [bp - 0x16], ax
8:516E  8956ec               mov word ptr [bp - 0x14], dx
8:5171  c45eea               les bx, ptr [bp - 0x16]
8:5174  26837f1205           cmp word ptr es:[bx + 0x12], 5
8:5179  75a3                 jne 0x511e
8:517B  66ff46fc             inc dword ptr [bp - 4]
8:517F  eb9d                 jmp 0x511e
8:5181  db 90
loc_5182:
8:5182  8b46fc               mov ax, word ptr [bp - 4]
8:5185  8b56fe               mov dx, word ptr [bp - 2]
8:5188  c9                   leave
8:5189  ca0600               retf 6

; ---------------- Colony::step3?@s8:518C FAR size=300 callers=1
8:518C  c8340000             enter 0x34, 0
8:5190  56                   push si
8:5191  c45e06               les bx, ptr [bp + 6]
8:5194  2683bf060200         cmp word ptr es:[bx + 0x206], 0
8:519A  0f851401             jne 0x52b2
8:519E  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:51A4  7412                 je 0x51b8
8:51A6  6626ff770c           push dword ptr es:[bx + 0xc]
8:51AB  26c45f0c             les bx, ptr es:[bx + 0xc]
8:51AF  26c41f               les bx, ptr es:[bx]
8:51B2  26ff5f10             lcall es:[bx + 0x10]
8:51B6  eb03                 jmp 0x51bb
loc_51B8:
8:51B8  33c0                 xor ax, ax
8:51BA  99                   cdq
loc_51BB:
8:51BB  8946fc               mov word ptr [bp - 4], ax
8:51BE  8956fe               mov word ptr [bp - 2], dx
8:51C1  66c746f800000000     mov dword ptr [bp - 8], 0
8:51C9  eb1d                 jmp 0x51e8
8:51CB  db 90
loc_51CC:
8:51CC  837eea05             cmp word ptr [bp - 0x16], 5
8:51D0  750b                 jne 0x51dd
loc_51D2:
8:51D2  c45ee6               les bx, ptr [bp - 0x1a]
8:51D5  66268b07             mov eax, dword ptr es:[bx]
8:51D9  668946e2             mov dword ptr [bp - 0x1e], eax
loc_51DD:
8:51DD  66837ee200           cmp dword ptr [bp - 0x1e], 0
8:51E2  7572                 jne 0x5256
loc_51E4:
8:51E4  66ff46f8             inc dword ptr [bp - 8]
loc_51E8:
8:51E8  668b46fc             mov eax, dword ptr [bp - 4]
8:51EC  8b56fe               mov dx, word ptr [bp - 2]
8:51EF  663946f8             cmp dword ptr [bp - 8], eax
8:51F3  0f83bb00             jae 0x52b2
8:51F7  66ff76f8             push dword ptr [bp - 8]
8:51FB  c45e06               les bx, ptr [bp + 6]
8:51FE  6626ff770c           push dword ptr es:[bx + 0xc]
8:5203  26c45f0c             les bx, ptr es:[bx + 0xc]
8:5207  26c41f               les bx, ptr es:[bx]
8:520A  26ff5f04             lcall es:[bx + 4]
8:520E  8956f6               mov word ptr [bp - 0xa], dx
8:5211  0bd0                 or dx, ax
8:5213  74cf                 je 0x51e4
8:5215  ff76f6               push word ptr [bp - 0xa]
8:5218  50                   push ax
8:5219  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:521E  9aece1524e           lcall 0x4e52, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:5223  52                   push dx
8:5224  50                   push ax
8:5225  9aa8733b51           lcall 0x513b, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:522A  8946ec               mov word ptr [bp - 0x14], ax
8:522D  8956ee               mov word ptr [bp - 0x12], dx
8:5230  c45eec               les bx, ptr [bp - 0x14]
8:5233  268b4712             mov ax, word ptr es:[bx + 0x12]
8:5237  8946ea               mov word ptr [bp - 0x16], ax
8:523A  8d4714               lea ax, [bx + 0x14]
8:523D  8946e6               mov word ptr [bp - 0x1a], ax
8:5240  8956e8               mov word ptr [bp - 0x18], dx
8:5243  66c746e200000000     mov dword ptr [bp - 0x1e], 0
8:524B  837eea04             cmp word ptr [bp - 0x16], 4
8:524F  0f8579ff             jne 0x51cc
8:5253  e97cff               jmp 0x51d2
loc_5256:
8:5256  c746e01100           mov word ptr [bp - 0x20], 0x11
8:525B  eb34                 jmp 0x5291
8:525D  db 90
loc_525E:
8:525E  ff76e0               push word ptr [bp - 0x20]
8:5261  06                   push es
8:5262  53                   push bx
8:5263  90                   nop
8:5264  0e                   push cs
8:5265  e8a201               call 0x540a  ; sub_s8:540A
8:5268  8b5ee0               mov bx, word ptr [bp - 0x20]
8:526B  c1e302               shl bx, 2
8:526E  c476e2               les si, ptr [bp - 0x1e]
8:5271  26395002             cmp word ptr es:[bx + si + 2], dx
8:5275  7717                 ja 0x528e
8:5277  7205                 jb 0x527e
8:5279  263900               cmp word ptr es:[bx + si], ax
8:527C  7710                 ja 0x528e
loc_527E:
8:527E  ff76e0               push word ptr [bp - 0x20]
8:5281  6626ff30             push dword ptr es:[bx + si]
8:5285  66ff7606             push dword ptr [bp + 6]
8:5289  90                   nop
8:528A  0e                   push cs
8:528B  e8e204               call 0x5770  ; sub_s8:5770
loc_528E:
8:528E  ff46e0               inc word ptr [bp - 0x20]
loc_5291:
8:5291  837ee025             cmp word ptr [bp - 0x20], 0x25
8:5295  0f8d4bff             jge 0x51e4
8:5299  c45e06               les bx, ptr [bp + 6]
8:529C  2683bf040200         cmp word ptr es:[bx + 0x204], 0
8:52A2  74ba                 je 0x525e
8:52A4  837ee023             cmp word ptr [bp - 0x20], 0x23
8:52A8  74b4                 je 0x525e
8:52AA  837ee024             cmp word ptr [bp - 0x20], 0x24
8:52AE  75de                 jne 0x528e
8:52B0  ebac                 jmp 0x525e
loc_52B2:
8:52B2  5e                   pop si
8:52B3  c9                   leave
8:52B4  ca0400               retf 4
8:52B7  db 00

; ---------------- sub_s8:52B8 FAR size=258 callers=4
8:52B8  c8180000             enter 0x18, 0
8:52BC  ff760e               push word ptr [bp + 0xe]
8:52BF  8b460a               mov ax, word ptr [bp + 0xa]
8:52C2  8b560c               mov dx, word ptr [bp + 0xc]
8:52C5  f7d8                 neg ax
8:52C7  83d200               adc dx, 0
8:52CA  f7da                 neg dx
8:52CC  52                   push dx
8:52CD  50                   push ax
8:52CE  66ff7606             push dword ptr [bp + 6]
8:52D2  90                   nop
8:52D3  0e                   push cs
8:52D4  e8bd03               call 0x5694  ; sub_s8:5694
8:52D7  837e0e24             cmp word ptr [bp + 0xe], 0x24
8:52DB  0f84d700             je 0x53b6
8:52DF  c45e06               les bx, ptr [bp + 6]
8:52E2  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:52E8  7412                 je 0x52fc
8:52EA  6626ff770c           push dword ptr es:[bx + 0xc]
8:52EF  26c45f0c             les bx, ptr es:[bx + 0xc]
8:52F3  26c41f               les bx, ptr es:[bx]
8:52F6  26ff5f10             lcall es:[bx + 0x10]
8:52FA  eb03                 jmp 0x52ff
loc_52FC:
8:52FC  33c0                 xor ax, ax
8:52FE  99                   cdq
loc_52FF:
8:52FF  8946f8               mov word ptr [bp - 8], ax
8:5302  8956fa               mov word ptr [bp - 6], dx
8:5305  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:530D  eb2c                 jmp 0x533b
8:530F  db 90
loc_5310:
8:5310  668b46e8             mov eax, dword ptr [bp - 0x18]
8:5314  6629460a             sub dword ptr [bp + 0xa], eax
8:5318  66c746e800000000     mov dword ptr [bp - 0x18], 0
loc_5320:
8:5320  ff760e               push word ptr [bp + 0xe]
8:5323  66ff76e8             push dword ptr [bp - 0x18]
8:5327  66ff76ec             push dword ptr [bp - 0x14]
8:532B  9a1c7d7f53           lcall 0x537f, 0x7d1c  ; Tile::setBas(value,res)@s7:7D1C
8:5330  66837e0a00           cmp dword ptr [bp + 0xa], 0
8:5335  747f                 je 0x53b6
loc_5337:
8:5337  66ff46f4             inc dword ptr [bp - 0xc]
loc_533B:
8:533B  668b46f8             mov eax, dword ptr [bp - 8]
8:533F  663946f4             cmp dword ptr [bp - 0xc], eax
8:5343  7371                 jae 0x53b6
8:5345  66ff76f4             push dword ptr [bp - 0xc]
8:5349  c45e06               les bx, ptr [bp + 6]
8:534C  6626ff770c           push dword ptr es:[bx + 0xc]
8:5351  26c45f0c             les bx, ptr es:[bx + 0xc]
8:5355  26c41f               les bx, ptr es:[bx]
8:5358  26ff5f04             lcall es:[bx + 4]
8:535C  8956f2               mov word ptr [bp - 0xe], dx
8:535F  0bd0                 or dx, ax
8:5361  74d4                 je 0x5337
8:5363  ff760e               push word ptr [bp + 0xe]
8:5366  ff76f2               push word ptr [bp - 0xe]
8:5369  50                   push ax
8:536A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:536F  9aece12152           lcall 0x5221, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:5374  8946ec               mov word ptr [bp - 0x14], ax
8:5377  8956ee               mov word ptr [bp - 0x12], dx
8:537A  52                   push dx
8:537B  50                   push ax
8:537C  9a287c2852           lcall 0x5228, 0x7c28  ; sub_s7:7C28
8:5381  8946e8               mov word ptr [bp - 0x18], ax
8:5384  8956ea               mov word ptr [bp - 0x16], dx
8:5387  0bd0                 or dx, ax
8:5389  74ac                 je 0x5337
8:538B  668b460a             mov eax, dword ptr [bp + 0xa]
8:538F  8b560c               mov dx, word ptr [bp + 0xc]
8:5392  663946e8             cmp dword ptr [bp - 0x18], eax
8:5396  0f8276ff             jb 0x5310
8:539A  8b4ee8               mov cx, word ptr [bp - 0x18]
8:539D  8b5eea               mov bx, word ptr [bp - 0x16]
8:53A0  2bc8                 sub cx, ax
8:53A2  1bda                 sbb bx, dx
8:53A4  894ee8               mov word ptr [bp - 0x18], cx
8:53A7  895eea               mov word ptr [bp - 0x16], bx
8:53AA  66c7460a00000000     mov dword ptr [bp + 0xa], 0
8:53B2  e96bff               jmp 0x5320
8:53B5  db 90
loc_53B6:
8:53B6  c9                   leave
8:53B7  ca0a00               retf 0xa

; ---------------- sub_s8:53BA FAR size=80 callers=7
8:53BA  c8100000             enter 0x10, 0
8:53BE  56                   push si
8:53BF  c45e06               les bx, ptr [bp + 6]
8:53C2  81c34e01             add bx, 0x14e
8:53C6  8b760a               mov si, word ptr [bp + 0xa]
8:53C9  c1e602               shl si, 2
8:53CC  66268b00             mov eax, dword ptr es:[bx + si]
8:53D0  668946fc             mov dword ptr [bp - 4], eax
8:53D4  8b5e06               mov bx, word ptr [bp + 6]
8:53D7  81c3a201             add bx, 0x1a2
8:53DB  8b760a               mov si, word ptr [bp + 0xa]
8:53DE  c1e602               shl si, 2
8:53E1  66268b00             mov eax, dword ptr es:[bx + si]
8:53E5  668946f8             mov dword ptr [bp - 8], eax
8:53E9  668b46fc             mov eax, dword ptr [bp - 4]
8:53ED  8b56fe               mov dx, word ptr [bp - 2]
8:53F0  663946f8             cmp dword ptr [bp - 8], eax
8:53F4  730c                 jae 0x5402
8:53F6  2b46f8               sub ax, word ptr [bp - 8]
8:53F9  1b56fa               sbb dx, word ptr [bp - 6]
8:53FC  5e                   pop si
8:53FD  c9                   leave
8:53FE  ca0600               retf 6
8:5401  db 90
loc_5402:
8:5402  33c0                 xor ax, ax
8:5404  99                   cdq
8:5405  5e                   pop si
8:5406  c9                   leave
8:5407  ca0600               retf 6

; ---------------- sub_s8:540A FAR size=90 callers=9
8:540A  c8140000             enter 0x14, 0
8:540E  56                   push si
8:540F  c45e06               les bx, ptr [bp + 6]
8:5412  83c326               add bx, 0x26
8:5415  8b760a               mov si, word ptr [bp + 0xa]
8:5418  c1e602               shl si, 2
8:541B  66268b00             mov eax, dword ptr es:[bx + si]
8:541F  668946fc             mov dword ptr [bp - 4], eax
8:5423  8b5e06               mov bx, word ptr [bp + 6]
8:5426  81c3ba00             add bx, 0xba
8:542A  8b760a               mov si, word ptr [bp + 0xa]
8:542D  c1e602               shl si, 2
8:5430  66268b00             mov eax, dword ptr es:[bx + si]
8:5434  668946f8             mov dword ptr [bp - 8], eax
8:5438  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:5440  668b46fc             mov eax, dword ptr [bp - 4]
8:5444  8b56fe               mov dx, word ptr [bp - 2]
8:5447  663946f8             cmp dword ptr [bp - 8], eax
8:544B  730c                 jae 0x5459
8:544D  2b46f8               sub ax, word ptr [bp - 8]
8:5450  1b56fa               sbb dx, word ptr [bp - 6]
8:5453  8946f4               mov word ptr [bp - 0xc], ax
8:5456  8956f6               mov word ptr [bp - 0xa], dx
loc_5459:
8:5459  8b46f4               mov ax, word ptr [bp - 0xc]
8:545C  8b56f6               mov dx, word ptr [bp - 0xa]
8:545F  5e                   pop si
8:5460  c9                   leave
8:5461  ca0600               retf 6

; ---------------- Colony::sumTileLedgers?@s8:5464 FAR size=506 callers=2
8:5464  c83a0000             enter 0x3a, 0
8:5468  56                   push si
8:5469  66ff7606             push dword ptr [bp + 6]
8:546D  90                   nop
8:546E  0e                   push cs
8:546F  e84802               call 0x56ba  ; sub_s8:56BA
8:5472  66ff7606             push dword ptr [bp + 6]
8:5476  90                   nop
8:5477  0e                   push cs
8:5478  e84503               call 0x57c0  ; sub_s8:57C0
8:547B  c45e06               les bx, ptr [bp + 6]
8:547E  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:5484  7412                 je 0x5498
8:5486  6626ff770c           push dword ptr es:[bx + 0xc]
8:548B  26c45f0c             les bx, ptr es:[bx + 0xc]
8:548F  26c41f               les bx, ptr es:[bx]
8:5492  26ff5f10             lcall es:[bx + 0x10]
8:5496  eb03                 jmp 0x549b
loc_5498:
8:5498  33c0                 xor ax, ax
8:549A  99                   cdq
loc_549B:
8:549B  8946f8               mov word ptr [bp - 8], ax
8:549E  8956fa               mov word ptr [bp - 6], dx
8:54A1  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:54A9  e9dc00               jmp 0x5588
loc_54AC:
8:54AC  c746e60000           mov word ptr [bp - 0x1a], 0
loc_54B1:
8:54B1  c746e40000           mov word ptr [bp - 0x1c], 0
8:54B6  eb30                 jmp 0x54e8
loc_54B8:
8:54B8  ff76e4               push word ptr [bp - 0x1c]
8:54BB  8d46d8               lea ax, [bp - 0x28]
8:54BE  16                   push ss
8:54BF  50                   push ax
8:54C0  8d4ed4               lea cx, [bp - 0x2c]
8:54C3  16                   push ss
8:54C4  51                   push cx
8:54C5  66ff76e8             push dword ptr [bp - 0x18]
8:54C9  9a16bb394b           lcall 0x4b39, 0xbb16  ; sub_s5:BB16
8:54CE  66837ed400           cmp dword ptr [bp - 0x2c], 0
8:54D3  7410                 je 0x54e5
8:54D5  66ff76d6             push dword ptr [bp - 0x2a]
8:54D9  ff76d4               push word ptr [bp - 0x2c]
8:54DC  66ff7606             push dword ptr [bp + 6]
8:54E0  90                   nop
8:54E1  0e                   push cs
8:54E2  e8af01               call 0x5694  ; sub_s8:5694
loc_54E5:
8:54E5  ff46e4               inc word ptr [bp - 0x1c]
loc_54E8:
8:54E8  8b46e6               mov ax, word ptr [bp - 0x1a]
8:54EB  3946e4               cmp word ptr [bp - 0x1c], ax
8:54EE  72c8                 jb 0x54b8
8:54F0  c45eec               les bx, ptr [bp - 0x14]
8:54F3  66268b471e           mov eax, dword ptr es:[bx + 0x1e]
8:54F8  268b5720             mov dx, word ptr es:[bx + 0x20]
8:54FC  668946e0             mov dword ptr [bp - 0x20], eax
8:5500  8bc2                 mov ax, dx
8:5502  0b46e0               or ax, word ptr [bp - 0x20]
8:5505  740f                 je 0x5516
8:5507  52                   push dx
8:5508  c45ee0               les bx, ptr [bp - 0x20]
8:550B  53                   push bx
8:550C  26c41f               les bx, ptr es:[bx]
8:550F  26ff5f10             lcall es:[bx + 0x10]
8:5513  eb03                 jmp 0x5518
8:5515  db 90
loc_5516:
8:5516  33c0                 xor ax, ax
loc_5518:
8:5518  8946e6               mov word ptr [bp - 0x1a], ax
8:551B  c746e40000           mov word ptr [bp - 0x1c], 0
8:5520  eb03                 jmp 0x5525
loc_5522:
8:5522  ff46e4               inc word ptr [bp - 0x1c]
loc_5525:
8:5525  8b46e6               mov ax, word ptr [bp - 0x1a]
8:5528  3946e4               cmp word ptr [bp - 0x1c], ax
8:552B  7357                 jae 0x5584
8:552D  6a00                 push 0
8:552F  ff76e4               push word ptr [bp - 0x1c]
8:5532  c45ee0               les bx, ptr [bp - 0x20]
8:5535  06                   push es
8:5536  53                   push bx
8:5537  26c41f               les bx, ptr es:[bx]
8:553A  26ff5f04             lcall es:[bx + 4]
8:553E  8946d8               mov word ptr [bp - 0x28], ax
8:5541  8956da               mov word ptr [bp - 0x26], dx
8:5544  0bd0                 or dx, ax
8:5546  74da                 je 0x5522
8:5548  ff76da               push word ptr [bp - 0x26]
8:554B  50                   push ax
8:554C  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:5551  9aece1bf55           lcall 0x55bf, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:5556  8946d0               mov word ptr [bp - 0x30], ax
8:5559  8956d2               mov word ptr [bp - 0x2e], dx
8:555C  c45ed0               les bx, ptr [bp - 0x30]
8:555F  268b470c             mov ax, word ptr es:[bx + 0xc]
8:5563  8946ce               mov word ptr [bp - 0x32], ax
8:5566  c45e06               les bx, ptr [bp + 6]
8:5569  81c34e01             add bx, 0x14e
8:556D  8bf0                 mov si, ax
8:556F  c1e602               shl si, 2
8:5572  66268b00             mov eax, dword ptr es:[bx + si]
8:5576  6640                 inc eax
8:5578  8b5e06               mov bx, word ptr [bp + 6]
8:557B  662689804e01         mov dword ptr es:[bx + si + 0x14e], eax
8:5581  eb9f                 jmp 0x5522
8:5583  db 90
loc_5584:
8:5584  66ff46f4             inc dword ptr [bp - 0xc]
loc_5588:
8:5588  668b46f8             mov eax, dword ptr [bp - 8]
8:558C  663946f4             cmp dword ptr [bp - 0xc], eax
8:5590  735c                 jae 0x55ee
8:5592  66ff76f4             push dword ptr [bp - 0xc]
8:5596  c45e06               les bx, ptr [bp + 6]
8:5599  6626ff770c           push dword ptr es:[bx + 0xc]
8:559E  26c45f0c             les bx, ptr es:[bx + 0xc]
8:55A2  26c41f               les bx, ptr es:[bx]
8:55A5  26ff5f04             lcall es:[bx + 4]
8:55A9  8946f0               mov word ptr [bp - 0x10], ax
8:55AC  8956f2               mov word ptr [bp - 0xe], dx
8:55AF  0bd0                 or dx, ax
8:55B1  74d1                 je 0x5584
8:55B3  ff76f2               push word ptr [bp - 0xe]
8:55B6  50                   push ax
8:55B7  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:55BC  9aece17253           lcall 0x5372, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:55C1  8946ec               mov word ptr [bp - 0x14], ax
8:55C4  8956ee               mov word ptr [bp - 0x12], dx
8:55C7  c45eec               les bx, ptr [bp - 0x14]
8:55CA  66268b4722           mov eax, dword ptr es:[bx + 0x22]
8:55CF  268b5724             mov dx, word ptr es:[bx + 0x24]
8:55D3  668946e8             mov dword ptr [bp - 0x18], eax
8:55D7  8bc2                 mov ax, dx
8:55D9  0b46e8               or ax, word ptr [bp - 0x18]
8:55DC  0f84ccfe             je 0x54ac
8:55E0  c45ee8               les bx, ptr [bp - 0x18]
8:55E3  268b4704             mov ax, word ptr es:[bx + 4]
8:55E7  8946e6               mov word ptr [bp - 0x1a], ax
8:55EA  e9c4fe               jmp 0x54b1
8:55ED  db 90
loc_55EE:
8:55EE  6a03                 push 3
8:55F0  c45e06               les bx, ptr [bp + 6]
8:55F3  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:55F9  9af2381256           lcall 0x5612, 0x38f2  ; sub_s7:38F2
8:55FE  8946fc               mov word ptr [bp - 4], ax
8:5601  8956fe               mov word ptr [bp - 2], dx
8:5604  6a04                 push 4
8:5606  c45e06               les bx, ptr [bp + 6]
8:5609  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:560F  9af2382f56           lcall 0x562f, 0x38f2  ; sub_s7:38F2
8:5614  0146fc               add word ptr [bp - 4], ax
8:5617  1156fe               adc word ptr [bp - 2], dx
8:561A  66837efc00           cmp dword ptr [bp - 4], 0
8:561F  7516                 jne 0x5637
8:5621  6a02                 push 2
8:5623  c45e06               les bx, ptr [bp + 6]
8:5626  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:562C  9af2382e53           lcall 0x532e, 0x38f2  ; sub_s7:38F2
8:5631  8946fc               mov word ptr [bp - 4], ax
8:5634  8956fe               mov word ptr [bp - 2], dx
loc_5637:
8:5637  c45e06               les bx, ptr [bp + 6]
8:563A  26c49ff601           les bx, ptr es:[bx + 0x1f6]
8:563F  66268b877001         mov eax, dword ptr es:[bx + 0x170]
8:5645  660146fc             add dword ptr [bp - 4], eax
8:5649  6a24                 push 0x24
8:564B  66ff76fc             push dword ptr [bp - 4]
8:564F  66ff7606             push dword ptr [bp + 6]
8:5653  90                   nop
8:5654  0e                   push cs
8:5655  e83c00               call 0x5694  ; sub_s8:5694
8:5658  5e                   pop si
8:5659  c9                   leave
8:565A  ca0400               retf 4
8:565D  db 00

; ---------------- sub_s8:565E FAR size=54 callers=1
8:565E  c8060000             enter 6, 0
8:5662  c45e06               les bx, ptr [bp + 6]
8:5665  6626ff7704           push dword ptr es:[bx + 4]
8:566A  8d46fe               lea ax, [bp - 2]
8:566D  16                   push ss
8:566E  50                   push ax
8:566F  9a3c8efc55           lcall 0x55fc, 0x8e3c  ; sub_s7:8E3C
8:5674  8946fa               mov word ptr [bp - 6], ax
8:5677  8956fc               mov word ptr [bp - 4], dx
8:567A  52                   push dx
8:567B  50                   push ax
8:567C  66ff7606             push dword ptr [bp + 6]
8:5680  90                   nop
8:5681  0e                   push cs
8:5682  e8a701               call 0x582c  ; sub_s8:582C
8:5685  c45e06               les bx, ptr [bp + 6]
8:5688  268b4714             mov ax, word ptr es:[bx + 0x14]
8:568C  268b5716             mov dx, word ptr es:[bx + 0x16]
8:5690  c9                   leave
8:5691  ca0400               retf 4

; ---------------- sub_s8:5694 FAR size=38 callers=4
8:5694  c8040000             enter 4, 0
8:5698  56                   push si
8:5699  c45e06               les bx, ptr [bp + 6]
8:569C  83c326               add bx, 0x26
8:569F  8b760e               mov si, word ptr [bp + 0xe]
8:56A2  c1e602               shl si, 2
8:56A5  66268b00             mov eax, dword ptr es:[bx + si]
8:56A9  6603460a             add eax, dword ptr [bp + 0xa]
8:56AD  8b5e06               mov bx, word ptr [bp + 6]
8:56B0  6626894026           mov dword ptr es:[bx + si + 0x26], eax
8:56B5  5e                   pop si
8:56B6  c9                   leave
8:56B7  ca0a00               retf 0xa

; ---------------- sub_s8:56BA FAR size=28 callers=1
8:56BA  55                   push bp
8:56BB  8bec                 mov bp, sp
8:56BD  666800009400         push 0x940000
8:56C3  668b4606             mov eax, dword ptr [bp + 6]
8:56C7  052600               add ax, 0x26
8:56CA  6650                 push eax
8:56CC  9a0649824e           lcall 0x4e82, 0x4906  ; sub_s1:4906
8:56D1  c9                   leave
8:56D2  ca0400               retf 4
8:56D5  db 00

; ---------------- Colony::step2?@s8:56D6 FAR size=154 callers=2
8:56D6  c8100000             enter 0x10, 0
8:56DA  666800009400         push 0x940000
8:56E0  668b4606             mov eax, dword ptr [bp + 6]
8:56E4  05ba00               add ax, 0xba
8:56E7  6650                 push eax
8:56E9  9a0649cf56           lcall 0x56cf, 0x4906  ; sub_s1:4906
8:56EE  83c408               add sp, 8
8:56F1  837e0a00             cmp word ptr [bp + 0xa], 0
8:56F5  7475                 je 0x576c
8:56F7  c45e06               les bx, ptr [bp + 6]
8:56FA  6626837f0c00         cmp dword ptr es:[bx + 0xc], 0
8:5700  7412                 je 0x5714
8:5702  6626ff770c           push dword ptr es:[bx + 0xc]
8:5707  26c45f0c             les bx, ptr es:[bx + 0xc]
8:570B  26c41f               les bx, ptr es:[bx]
8:570E  26ff5f10             lcall es:[bx + 0x10]
8:5712  eb03                 jmp 0x5717
loc_5714:
8:5714  33c0                 xor ax, ax
8:5716  99                   cdq
loc_5717:
8:5717  8946fc               mov word ptr [bp - 4], ax
8:571A  8956fe               mov word ptr [bp - 2], dx
8:571D  66c746f800000000     mov dword ptr [bp - 8], 0
8:5725  eb05                 jmp 0x572c
8:5727  db 90
loc_5728:
8:5728  66ff46f8             inc dword ptr [bp - 8]
loc_572C:
8:572C  668b46fc             mov eax, dword ptr [bp - 4]
8:5730  663946f8             cmp dword ptr [bp - 8], eax
8:5734  7336                 jae 0x576c
8:5736  66ff76f8             push dword ptr [bp - 8]
8:573A  c45e06               les bx, ptr [bp + 6]
8:573D  6626ff770c           push dword ptr es:[bx + 0xc]
8:5742  26c45f0c             les bx, ptr es:[bx + 0xc]
8:5746  26c41f               les bx, ptr es:[bx]
8:5749  26ff5f04             lcall es:[bx + 4]
8:574D  8956f6               mov word ptr [bp - 0xa], dx
8:5750  0bd0                 or dx, ax
8:5752  74d4                 je 0x5728
8:5754  ff76f6               push word ptr [bp - 0xa]
8:5757  50                   push ax
8:5758  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:575D  9aece15455           lcall 0x5554, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:5762  52                   push dx
8:5763  50                   push ax
8:5764  9ad0727256           lcall 0x5672, 0x72d0  ; sub_s7:72D0
8:5769  ebbd                 jmp 0x5728
8:576B  db 90
loc_576C:
8:576C  c9                   leave
8:576D  ca0600               retf 6

; ---------------- sub_s8:5770 FAR size=40 callers=2
8:5770  55                   push bp
8:5771  8bec                 mov bp, sp
8:5773  56                   push si
8:5774  c45e06               les bx, ptr [bp + 6]
8:5777  81c3ba00             add bx, 0xba
8:577B  8b760e               mov si, word ptr [bp + 0xe]
8:577E  c1e602               shl si, 2
8:5781  66268b00             mov eax, dword ptr es:[bx + si]
8:5785  6603460a             add eax, dword ptr [bp + 0xa]
8:5789  8b5e06               mov bx, word ptr [bp + 6]
8:578C  66268980ba00         mov dword ptr es:[bx + si + 0xba], eax
8:5792  5e                   pop si
8:5793  c9                   leave
8:5794  ca0a00               retf 0xa
8:5797  db 00

; ---------------- sub_s8:5798 FAR size=40 callers=1
8:5798  55                   push bp
8:5799  8bec                 mov bp, sp
8:579B  56                   push si
8:579C  c45e06               les bx, ptr [bp + 6]
8:579F  81c34e01             add bx, 0x14e
8:57A3  8b760e               mov si, word ptr [bp + 0xe]
8:57A6  c1e602               shl si, 2
8:57A9  66268b00             mov eax, dword ptr es:[bx + si]
8:57AD  6603460a             add eax, dword ptr [bp + 0xa]
8:57B1  8b5e06               mov bx, word ptr [bp + 6]
8:57B4  662689804e01         mov dword ptr es:[bx + si + 0x14e], eax
8:57BA  5e                   pop si
8:57BB  c9                   leave
8:57BC  ca0a00               retf 0xa
8:57BF  db 00

; ---------------- sub_s8:57C0 FAR size=28 callers=1
8:57C0  55                   push bp
8:57C1  8bec                 mov bp, sp
8:57C3  666800005400         push 0x540000
8:57C9  668b4606             mov eax, dword ptr [bp + 6]
8:57CD  054e01               add ax, 0x14e
8:57D0  6650                 push eax
8:57D2  9a0649ec56           lcall 0x56ec, 0x4906  ; sub_s1:4906
8:57D7  c9                   leave
8:57D8  ca0400               retf 4
8:57DB  db 00

; ---------------- sub_s8:57DC FAR size=40 callers=3
8:57DC  55                   push bp
8:57DD  8bec                 mov bp, sp
8:57DF  56                   push si
8:57E0  c45e06               les bx, ptr [bp + 6]
8:57E3  81c3a201             add bx, 0x1a2
8:57E7  8b760e               mov si, word ptr [bp + 0xe]
8:57EA  c1e602               shl si, 2
8:57ED  66268b00             mov eax, dword ptr es:[bx + si]
8:57F1  6603460a             add eax, dword ptr [bp + 0xa]
8:57F5  8b5e06               mov bx, word ptr [bp + 6]
8:57F8  66268980a201         mov dword ptr es:[bx + si + 0x1a2], eax
8:57FE  5e                   pop si
8:57FF  c9                   leave
8:5800  ca0a00               retf 0xa
8:5803  db 00

; ---------------- sub_s8:5804 FAR size=40 callers=3
8:5804  55                   push bp
8:5805  8bec                 mov bp, sp
8:5807  56                   push si
8:5808  c45e06               les bx, ptr [bp + 6]
8:580B  81c3a201             add bx, 0x1a2
8:580F  8b760e               mov si, word ptr [bp + 0xe]
8:5812  c1e602               shl si, 2
8:5815  66268b00             mov eax, dword ptr es:[bx + si]
8:5819  662b460a             sub eax, dword ptr [bp + 0xa]
8:581D  8b5e06               mov bx, word ptr [bp + 6]
8:5820  66268980a201         mov dword ptr es:[bx + si + 0x1a2], eax
8:5826  5e                   pop si
8:5827  c9                   leave
8:5828  ca0a00               retf 0xa
8:582B  db 00

; ---------------- sub_s8:582C FAR size=52 callers=1
8:582C  c8080000             enter 8, 0
8:5830  c45e06               les bx, ptr [bp + 6]
8:5833  268b4714             mov ax, word ptr es:[bx + 0x14]
8:5837  268b5716             mov dx, word ptr es:[bx + 0x16]
8:583B  8bda                 mov bx, dx
8:583D  0bd8                 or bx, ax
8:583F  740e                 je 0x584f
8:5841  6a01                 push 1
8:5843  52                   push dx
8:5844  50                   push ax
8:5845  8ec2                 mov es, dx
8:5847  8bd8                 mov bx, ax
8:5849  26c41f               les bx, ptr es:[bx]
8:584C  26ff1f               lcall es:[bx]
loc_584F:
8:584F  668b460a             mov eax, dword ptr [bp + 0xa]
8:5853  c45e06               les bx, ptr [bp + 6]
8:5856  6626894714           mov dword ptr es:[bx + 0x14], eax
8:585B  c9                   leave
8:585C  ca0800               retf 8
8:585F  db 00

; ---------------- sub_s8:5860 FAR size=134 callers=0
8:5860  c80c0000             enter 0xc, 0
8:5864  8b4610               mov ax, word ptr [bp + 0x10]
8:5867  0bc0                 or ax, ax
8:5869  755a                 jne 0x58c5
8:586B  668b460c             mov eax, dword ptr [bp + 0xc]
8:586F  668946fc             mov dword ptr [bp - 4], eax
8:5873  c45e06               les bx, ptr [bp + 6]
8:5876  6626ff770c           push dword ptr es:[bx + 0xc]
8:587B  26c45f0c             les bx, ptr es:[bx + 0xc]
8:587F  26c41f               les bx, ptr es:[bx]
8:5882  26ff5f10             lcall es:[bx + 0x10]
8:5886  8946f8               mov word ptr [bp - 8], ax
8:5889  8956fa               mov word ptr [bp - 6], dx
8:588C  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:5894  eb04                 jmp 0x589a
loc_5896:
8:5896  66ff46f4             inc dword ptr [bp - 0xc]
loc_589A:
8:589A  668b46f8             mov eax, dword ptr [bp - 8]
8:589E  663946f4             cmp dword ptr [bp - 0xc], eax
8:58A2  7328                 jae 0x58cc
8:58A4  66ff76f4             push dword ptr [bp - 0xc]
8:58A8  c45e06               les bx, ptr [bp + 6]
8:58AB  6626ff770c           push dword ptr es:[bx + 0xc]
8:58B0  26c45f0c             les bx, ptr es:[bx + 0xc]
8:58B4  26c41f               les bx, ptr es:[bx]
8:58B7  26ff5f04             lcall es:[bx + 4]
8:58BB  3b46fc               cmp ax, word ptr [bp - 4]
8:58BE  75d6                 jne 0x5896
8:58C0  3b56fe               cmp dx, word ptr [bp - 2]
8:58C3  75d1                 jne 0x5896
loc_58C5:
8:58C5  33c0                 xor ax, ax
8:58C7  99                   cdq
8:58C8  c9                   leave
8:58C9  ca0c00               retf 0xc
loc_58CC:
8:58CC  66ff76fc             push dword ptr [bp - 4]
8:58D0  c45e06               les bx, ptr [bp + 6]
8:58D3  6626ff770c           push dword ptr es:[bx + 0xc]
8:58D8  26c45f0c             les bx, ptr es:[bx + 0xc]
8:58DC  26c41f               les bx, ptr es:[bx]
8:58DF  26ff5f0c             lcall es:[bx + 0xc]
8:58E3  ebe0                 jmp 0x58c5
8:58E5  db 00

; ---------------- sub_s8:58E6 FAR size=304 callers=1
8:58E6  c8300000             enter 0x30, 0
8:58EA  57                   push di
8:58EB  56                   push si
8:58EC  66c746fc00000000     mov dword ptr [bp - 4], 0
8:58F4  eb56                 jmp 0x594c
loc_58F6:
8:58F6  6a2e                 push 0x2e
8:58F8  8b5efc               mov bx, word ptr [bp - 4]
8:58FB  c1e302               shl bx, 2
8:58FE  26c418               les bx, ptr es:[bx + si]
8:5901  26ff770c             push word ptr es:[bx + 0xc]
8:5905  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:590A  9aaec65c51           lcall 0x515c, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:590F  0bc0                 or ax, ax
8:5911  7435                 je 0x5948
8:5913  8b5efc               mov bx, word ptr [bp - 4]
8:5916  c1e302               shl bx, 2
8:5919  c47612               les si, ptr [bp + 0x12]
8:591C  268b00               mov ax, word ptr es:[bx + si]
8:591F  268b5002             mov dx, word ptr es:[bx + si + 2]
8:5923  050c00               add ax, 0xc
8:5926  1e                   push ds
8:5927  8d7ef0               lea di, [bp - 0x10]
8:592A  8bf0                 mov si, ax
8:592C  16                   push ss
8:592D  07                   pop es
8:592E  8eda                 mov ds, dx
8:5930  66a5                 movsd dword ptr es:[di], dword ptr [si]
8:5932  a5                   movsw word ptr es:[di], word ptr [si]
8:5933  1f                   pop ds
8:5934  8d46f0               lea ax, [bp - 0x10]
8:5937  8946dc               mov word ptr [bp - 0x24], ax
8:593A  8b46f4               mov ax, word ptr [bp - 0xc]
8:593D  8946f6               mov word ptr [bp - 0xa], ax
8:5940  8b4616               mov ax, word ptr [bp + 0x16]
8:5943  3946f6               cmp word ptr [bp - 0xa], ax
8:5946  7426                 je 0x596e
loc_5948:
8:5948  66ff46fc             inc dword ptr [bp - 4]
loc_594C:
8:594C  668b460a             mov eax, dword ptr [bp + 0xa]
8:5950  8b560c               mov dx, word ptr [bp + 0xc]
8:5953  663946fc             cmp dword ptr [bp - 4], eax
8:5957  0f83b500             jae 0x5a10
8:595B  8b5efc               mov bx, word ptr [bp - 4]
8:595E  c1e302               shl bx, 2
8:5961  c4760e               les si, ptr [bp + 0xe]
8:5964  6626833800           cmp dword ptr es:[bx + si], 0
8:5969  758b                 jne 0x58f6
8:596B  ebdb                 jmp 0x5948
8:596D  db 90
loc_596E:
8:596E  8b46f6               mov ax, word ptr [bp - 0xa]
8:5971  48                   dec ax
8:5972  8946f4               mov word ptr [bp - 0xc], ax
8:5975  8b5efc               mov bx, word ptr [bp - 4]
8:5978  c1e302               shl bx, 2
8:597B  c4760e               les si, ptr [bp + 0xe]
8:597E  6626ff30             push dword ptr es:[bx + si]
8:5982  9a24bbae59           lcall 0x59ae, 0xbb24  ; sub_s6:BB24
8:5987  8946ec               mov word ptr [bp - 0x14], ax
8:598A  8956ee               mov word ptr [bp - 0x12], dx
8:598D  52                   push dx
8:598E  50                   push ax
8:598F  8d46f0               lea ax, [bp - 0x10]
8:5992  16                   push ss
8:5993  50                   push ax
8:5994  66ff364057           push dword ptr [0x5740]
8:5999  9a7e62c159           lcall 0x59c1, 0x627e  ; sub_s7:627E
8:599E  8946e8               mov word ptr [bp - 0x18], ax
8:59A1  8956ea               mov word ptr [bp - 0x16], dx
8:59A4  52                   push dx
8:59A5  50                   push ax
8:59A6  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:59AB  9aece16057           lcall 0x5760, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:59B0  8946e4               mov word ptr [bp - 0x1c], ax
8:59B3  8956e6               mov word ptr [bp - 0x1a], dx
8:59B6  0bd0                 or dx, ax
8:59B8  748e                 je 0x5948
8:59BA  ff76e6               push word ptr [bp - 0x1a]
8:59BD  50                   push ax
8:59BE  9aa8736757           lcall 0x5767, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:59C3  8946e0               mov word ptr [bp - 0x20], ax
8:59C6  8956e2               mov word ptr [bp - 0x1e], dx
8:59C9  c45ee0               les bx, ptr [bp - 0x20]
8:59CC  268b471a             mov ax, word ptr es:[bx + 0x1a]
8:59D0  8946de               mov word ptr [bp - 0x22], ax
8:59D3  f646de02             test byte ptr [bp - 0x22], 2
8:59D7  0f846dff             je 0x5948
8:59DB  f646de01             test byte ptr [bp - 0x22], 1
8:59DF  0f8465ff             je 0x5948
8:59E3  8b5efc               mov bx, word ptr [bp - 4]
8:59E6  c1e302               shl bx, 2
8:59E9  c4760e               les si, ptr [bp + 0xe]
8:59EC  26c418               les bx, ptr es:[bx + si]
8:59EF  26c7471a0300         mov word ptr es:[bx + 0x1a], 3
8:59F5  8b5efc               mov bx, word ptr [bp - 4]
8:59F8  c1e302               shl bx, 2
8:59FB  c4760e               les si, ptr [bp + 0xe]
8:59FE  6626ff30             push dword ptr es:[bx + si]
8:5A02  26c418               les bx, ptr es:[bx + si]
8:5A05  26c41f               les bx, ptr es:[bx]
8:5A08  26ff5f28             lcall es:[bx + 0x28]
8:5A0C  e939ff               jmp 0x5948
8:5A0F  db 90
loc_5A10:
8:5A10  5e                   pop si
8:5A11  5f                   pop di
8:5A12  c9                   leave
8:5A13  ca1200               retf 0x12

; ---------------- sub_s8:5A16 FAR size=128 callers=1
8:5A16  c8100000             enter 0x10, 0
8:5A1A  56                   push si
8:5A1B  66c746fc00000000     mov dword ptr [bp - 4], 0
8:5A23  eb4b                 jmp 0x5a70
8:5A25  db 90
loc_5A26:
8:5A26  6a2f                 push 0x2f
8:5A28  8b5efc               mov bx, word ptr [bp - 4]
8:5A2B  c1e302               shl bx, 2
8:5A2E  26c418               les bx, ptr es:[bx + si]
8:5A31  26ff770c             push word ptr es:[bx + 0xc]
8:5A35  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:5A3A  9aaec60d59           lcall 0x590d, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:5A3F  0bc0                 or ax, ax
8:5A41  7429                 je 0x5a6c
8:5A43  8b5efc               mov bx, word ptr [bp - 4]
8:5A46  c1e302               shl bx, 2
8:5A49  c4760e               les si, ptr [bp + 0xe]
8:5A4C  26c418               les bx, ptr es:[bx + si]
8:5A4F  26c7471a0300         mov word ptr es:[bx + 0x1a], 3
8:5A55  8b5efc               mov bx, word ptr [bp - 4]
8:5A58  c1e302               shl bx, 2
8:5A5B  c4760e               les si, ptr [bp + 0xe]
8:5A5E  6626ff30             push dword ptr es:[bx + si]
8:5A62  26c418               les bx, ptr es:[bx + si]
8:5A65  26c41f               les bx, ptr es:[bx]
8:5A68  26ff5f28             lcall es:[bx + 0x28]
loc_5A6C:
8:5A6C  66ff46fc             inc dword ptr [bp - 4]
loc_5A70:
8:5A70  668b460a             mov eax, dword ptr [bp + 0xa]
8:5A74  8b560c               mov dx, word ptr [bp + 0xc]
8:5A77  663946fc             cmp dword ptr [bp - 4], eax
8:5A7B  7313                 jae 0x5a90
8:5A7D  8b5efc               mov bx, word ptr [bp - 4]
8:5A80  c1e302               shl bx, 2
8:5A83  c4760e               les si, ptr [bp + 0xe]
8:5A86  6626833800           cmp dword ptr es:[bx + si], 0
8:5A8B  7599                 jne 0x5a26
8:5A8D  ebdd                 jmp 0x5a6c
8:5A8F  db 90
loc_5A90:
8:5A90  5e                   pop si
8:5A91  c9                   leave
8:5A92  ca1000               retf 0x10
8:5A95  db 00

; ---------------- sub_s8:5A96 FAR size=166 callers=1
8:5A96  c8100000             enter 0x10, 0
8:5A9A  57                   push di
8:5A9B  56                   push si
8:5A9C  66c746fc00000000     mov dword ptr [bp - 4], 0
8:5AA4  eb6f                 jmp 0x5b15
loc_5AA6:
8:5AA6  6a2c                 push 0x2c
8:5AA8  8b5efc               mov bx, word ptr [bp - 4]
8:5AAB  c1e302               shl bx, 2
8:5AAE  26c418               les bx, ptr es:[bx + si]
8:5AB1  26ff770c             push word ptr es:[bx + 0xc]
8:5AB5  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:5ABA  9aaec63d5a           lcall 0x5a3d, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:5ABF  0bc0                 or ax, ax
8:5AC1  744e                 je 0x5b11
8:5AC3  8b5efc               mov bx, word ptr [bp - 4]
8:5AC6  c1e302               shl bx, 2
8:5AC9  c4760e               les si, ptr [bp + 0xe]
8:5ACC  6626ff30             push dword ptr es:[bx + si]
8:5AD0  26c430               les si, ptr es:[bx + si]
8:5AD3  26c434               les si, ptr es:[si]
8:5AD6  8bfb                 mov di, bx
8:5AD8  26ff5c54             lcall es:[si + 0x54]
8:5ADC  0bc0                 or ax, ax
8:5ADE  7431                 je 0x5b11
8:5AE0  c45e0e               les bx, ptr [bp + 0xe]
8:5AE3  26c419               les bx, ptr es:[bx + di]
8:5AE6  26c7471a0300         mov word ptr es:[bx + 0x1a], 3
8:5AEC  8b5efc               mov bx, word ptr [bp - 4]
8:5AEF  c1e302               shl bx, 2
8:5AF2  c4760e               les si, ptr [bp + 0xe]
8:5AF5  6626ff30             push dword ptr es:[bx + si]
8:5AF9  26c430               les si, ptr es:[bx + si]
8:5AFC  26c434               les si, ptr es:[si]
8:5AFF  8bfb                 mov di, bx
8:5B01  26ff5c28             lcall es:[si + 0x28]
8:5B05  c45e0e               les bx, ptr [bp + 0xe]
8:5B08  26c419               les bx, ptr es:[bx + di]
8:5B0B  26c7471a0200         mov word ptr es:[bx + 0x1a], 2
loc_5B11:
8:5B11  66ff46fc             inc dword ptr [bp - 4]
loc_5B15:
8:5B15  668b460a             mov eax, dword ptr [bp + 0xa]
8:5B19  8b560c               mov dx, word ptr [bp + 0xc]
8:5B1C  663946fc             cmp dword ptr [bp - 4], eax
8:5B20  7314                 jae 0x5b36
8:5B22  8b5efc               mov bx, word ptr [bp - 4]
8:5B25  c1e302               shl bx, 2
8:5B28  c4760e               les si, ptr [bp + 0xe]
8:5B2B  6626833800           cmp dword ptr es:[bx + si], 0
8:5B30  0f8572ff             jne 0x5aa6
8:5B34  ebdb                 jmp 0x5b11
loc_5B36:
8:5B36  5e                   pop si
8:5B37  5f                   pop di
8:5B38  c9                   leave
8:5B39  ca1000               retf 0x10

; ---------------- sub_s8:5B3C FAR size=172 callers=1
8:5B3C  c8140000             enter 0x14, 0
8:5B40  56                   push si
8:5B41  66c746fc00000000     mov dword ptr [bp - 4], 0
8:5B49  eb76                 jmp 0x5bc1
8:5B4B  db 90
loc_5B4C:
8:5B4C  6a2d                 push 0x2d
8:5B4E  8b5efc               mov bx, word ptr [bp - 4]
8:5B51  c1e302               shl bx, 2
8:5B54  26c418               les bx, ptr es:[bx + si]
8:5B57  26ff770c             push word ptr es:[bx + 0xc]
8:5B5B  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:5B60  9aaec6bd5a           lcall 0x5abd, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:5B65  0bc0                 or ax, ax
8:5B67  7454                 je 0x5bbd
8:5B69  8b5efc               mov bx, word ptr [bp - 4]
8:5B6C  c1e302               shl bx, 2
8:5B6F  c4760e               les si, ptr [bp + 0xe]
8:5B72  6626ff30             push dword ptr es:[bx + si]
8:5B76  26c418               les bx, ptr es:[bx + si]
8:5B79  26c41f               les bx, ptr es:[bx]
8:5B7C  26ff5f50             lcall es:[bx + 0x50]
8:5B80  0bc0                 or ax, ax
8:5B82  7439                 je 0x5bbd
8:5B84  8b5efc               mov bx, word ptr [bp - 4]
8:5B87  c1e302               shl bx, 2
8:5B8A  c4760e               les si, ptr [bp + 0xe]
8:5B8D  26c418               les bx, ptr es:[bx + si]
8:5B90  268b471a             mov ax, word ptr es:[bx + 0x1a]
8:5B94  8b5efc               mov bx, word ptr [bp - 4]
8:5B97  c1e302               shl bx, 2
8:5B9A  8e4610               mov es, word ptr [bp + 0x10]
8:5B9D  26c418               les bx, ptr es:[bx + si]
8:5BA0  0c01                 or al, 1
8:5BA2  2689471a             mov word ptr es:[bx + 0x1a], ax
8:5BA6  8b5efc               mov bx, word ptr [bp - 4]
8:5BA9  c1e302               shl bx, 2
8:5BAC  c4760e               les si, ptr [bp + 0xe]
8:5BAF  6626ff30             push dword ptr es:[bx + si]
8:5BB3  26c418               les bx, ptr es:[bx + si]
8:5BB6  26c41f               les bx, ptr es:[bx]
8:5BB9  26ff5f28             lcall es:[bx + 0x28]
loc_5BBD:
8:5BBD  66ff46fc             inc dword ptr [bp - 4]
loc_5BC1:
8:5BC1  668b460a             mov eax, dword ptr [bp + 0xa]
8:5BC5  8b560c               mov dx, word ptr [bp + 0xc]
8:5BC8  663946fc             cmp dword ptr [bp - 4], eax
8:5BCC  7314                 jae 0x5be2
8:5BCE  8b5efc               mov bx, word ptr [bp - 4]
8:5BD1  c1e302               shl bx, 2
8:5BD4  c4760e               les si, ptr [bp + 0xe]
8:5BD7  6626833800           cmp dword ptr es:[bx + si], 0
8:5BDC  0f856cff             jne 0x5b4c
8:5BE0  ebdb                 jmp 0x5bbd
loc_5BE2:
8:5BE2  5e                   pop si
8:5BE3  c9                   leave
8:5BE4  ca1000               retf 0x10
8:5BE7  db 00

; ---------------- sub_s8:5BE8 FAR size=222 callers=1
8:5BE8  c8260000             enter 0x26, 0
8:5BEC  c45e06               les bx, ptr [bp + 6]
8:5BEF  6626ff7708           push dword ptr es:[bx + 8]
8:5BF4  66ff760e             push dword ptr [bp + 0xe]
8:5BF8  66ff364057           push dword ptr [0x5740]
8:5BFD  9a7e624b5c           lcall 0x5c4b, 0x627e  ; sub_s7:627E
8:5C02  8956fe               mov word ptr [bp - 2], dx
8:5C05  0bd0                 or dx, ax
8:5C07  7507                 jne 0x5c10
loc_5C09:
8:5C09  33c0                 xor ax, ax
8:5C0B  c9                   leave
8:5C0C  ca0c00               retf 0xc
8:5C0F  db 90
loc_5C10:
8:5C10  ff76fe               push word ptr [bp - 2]
8:5C13  50                   push ax
8:5C14  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:5C19  9aece18559           lcall 0x5985, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:5C1E  8946f8               mov word ptr [bp - 8], ax
8:5C21  8956fa               mov word ptr [bp - 6], dx
8:5C24  c45e0e               les bx, ptr [bp + 0xe]
8:5C27  268b4704             mov ax, word ptr es:[bx + 4]
8:5C2B  c746f47a00           mov word ptr [bp - 0xc], 0x7a
8:5C30  0bc0                 or ax, ax
8:5C32  7e10                 jle 0x5c44
8:5C34  8b460c               mov ax, word ptr [bp + 0xc]
8:5C37  2d7b00               sub ax, 0x7b
8:5C3A  742e                 je 0x5c6a
8:5C3C  48                   dec ax
8:5C3D  7423                 je 0x5c62
loc_5C3F:
8:5C3F  c746f47f00           mov word ptr [bp - 0xc], 0x7f
loc_5C44:
8:5C44  66ff76f8             push dword ptr [bp - 8]
8:5C48  9aa8739c59           lcall 0x599c, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:5C4D  8946f0               mov word ptr [bp - 0x10], ax
8:5C50  8956f2               mov word ptr [bp - 0xe], dx
8:5C53  c45ef0               les bx, ptr [bp - 0x10]
8:5C56  8b460a               mov ax, word ptr [bp + 0xa]
8:5C59  2685471a             test word ptr es:[bx + 0x1a], ax
8:5C5D  7413                 je 0x5c72
8:5C5F  eba8                 jmp 0x5c09
8:5C61  db 90
loc_5C62:
8:5C62  c7460c7d00           mov word ptr [bp + 0xc], 0x7d
8:5C67  ebd6                 jmp 0x5c3f
8:5C69  db 90
loc_5C6A:
8:5C6A  c7460c7e00           mov word ptr [bp + 0xc], 0x7e
8:5C6F  ebce                 jmp 0x5c3f
8:5C71  db 90
loc_5C72:
8:5C72  268b470c             mov ax, word ptr es:[bx + 0xc]
8:5C76  8946ee               mov word ptr [bp - 0x12], ax
8:5C79  8b46f4               mov ax, word ptr [bp - 0xc]
8:5C7C  3946ee               cmp word ptr [bp - 0x12], ax
8:5C7F  741d                 je 0x5c9e
8:5C81  8b460c               mov ax, word ptr [bp + 0xc]
8:5C84  3946ee               cmp word ptr [bp - 0x12], ax
8:5C87  7415                 je 0x5c9e
8:5C89  6a2b                 push 0x2b
8:5C8B  ff76ee               push word ptr [bp - 0x12]
8:5C8E  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:5C93  9aaec6635b           lcall 0x5b63, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:5C98  0bc0                 or ax, ax
8:5C9A  0f846bff             je 0x5c09
loc_5C9E:
8:5C9E  c45ef0               les bx, ptr [bp - 0x10]
8:5CA1  26837f1207           cmp word ptr es:[bx + 0x12], 7
8:5CA6  0f845fff             je 0x5c09
8:5CAA  268b471a             mov ax, word ptr es:[bx + 0x1a]
8:5CAE  8946e4               mov word ptr [bp - 0x1c], ax
8:5CB1  8b460a               mov ax, word ptr [bp + 0xa]
8:5CB4  0946e4               or word ptr [bp - 0x1c], ax
8:5CB7  8b46e4               mov ax, word ptr [bp - 0x1c]
8:5CBA  2689471a             mov word ptr es:[bx + 0x1a], ax
8:5CBE  b80100               mov ax, 1
8:5CC1  c9                   leave
8:5CC2  ca0c00               retf 0xc
8:5CC5  db 00

; ---------------- sub_s8:5CC6 FAR size=336 callers=1
8:5CC6  c8240000             enter 0x24, 0
8:5CCA  56                   push si
8:5CCB  8d46f8               lea ax, [bp - 8]
8:5CCE  16                   push ss
8:5CCF  50                   push ax
8:5CD0  9a383efb5c           lcall 0x5cfb, 0x3e38  ; sub_s2:3E38
loc_5CD5:
8:5CD5  c746fe0000           mov word ptr [bp - 2], 0
8:5CDA  66c746f400000000     mov dword ptr [bp - 0xc], 0
8:5CE2  eb3e                 jmp 0x5d22
loc_5CE4:
8:5CE4  8b5ef4               mov bx, word ptr [bp - 0xc]
8:5CE7  c1e302               shl bx, 2
8:5CEA  66268b00             mov eax, dword ptr es:[bx + si]
8:5CEE  050c00               add ax, 0xc
8:5CF1  6650                 push eax
8:5CF3  8d46f8               lea ax, [bp - 8]
8:5CF6  16                   push ss
8:5CF7  50                   push ax
8:5CF8  9a623f145d           lcall 0x5d14, 0x3f62  ; sub_s2:3F62
8:5CFD  8d46f2               lea ax, [bp - 0xe]
8:5D00  16                   push ss
8:5D01  50                   push ax
8:5D02  8d46f0               lea ax, [bp - 0x10]
8:5D05  16                   push ss
8:5D06  50                   push ax
8:5D07  8d46ee               lea ax, [bp - 0x12]
8:5D0A  16                   push ss
8:5D0B  50                   push ax
8:5D0C  8d4ef8               lea cx, [bp - 8]
8:5D0F  16                   push ss
8:5D10  51                   push cx
8:5D11  9ab43e965c           lcall 0x5c96, 0x3eb4  ; sub_s2:3EB4
8:5D16  8b4616               mov ax, word ptr [bp + 0x16]
8:5D19  3946ee               cmp word ptr [bp - 0x12], ax
8:5D1C  7422                 je 0x5d40
loc_5D1E:
8:5D1E  66ff46f4             inc dword ptr [bp - 0xc]
loc_5D22:
8:5D22  668b460a             mov eax, dword ptr [bp + 0xa]
8:5D26  663946f4             cmp dword ptr [bp - 0xc], eax
8:5D2A  0f83da00             jae 0x5e08
8:5D2E  8b5ef4               mov bx, word ptr [bp - 0xc]
8:5D31  c1e302               shl bx, 2
8:5D34  c47612               les si, ptr [bp + 0x12]
8:5D37  6626833800           cmp dword ptr es:[bx + si], 0
8:5D3C  75a6                 jne 0x5ce4
8:5D3E  ebde                 jmp 0x5d1e
loc_5D40:
8:5D40  8b5ef4               mov bx, word ptr [bp - 0xc]
8:5D43  c1e302               shl bx, 2
8:5D46  c4760e               les si, ptr [bp + 0xe]
8:5D49  6626833800           cmp dword ptr es:[bx + si], 0
8:5D4E  74ce                 je 0x5d1e
8:5D50  8b5ef4               mov bx, word ptr [bp - 0xc]
8:5D53  c1e302               shl bx, 2
8:5D56  26c418               les bx, ptr es:[bx + si]
8:5D59  8b4618               mov ax, word ptr [bp + 0x18]
8:5D5C  2685471a             test word ptr es:[bx + 0x1a], ax
8:5D60  74bc                 je 0x5d1e
8:5D62  8b46f0               mov ax, word ptr [bp - 0x10]
8:5D65  48                   dec ax
8:5D66  8946dc               mov word ptr [bp - 0x24], ax
8:5D69  8946fa               mov word ptr [bp - 6], ax
8:5D6C  8d46f8               lea ax, [bp - 8]
8:5D6F  16                   push ss
8:5D70  50                   push ax
8:5D71  6a7b                 push 0x7b
8:5D73  ff7618               push word ptr [bp + 0x18]
8:5D76  66ff7606             push dword ptr [bp + 6]
8:5D7A  90                   nop
8:5D7B  0e                   push cs
8:5D7C  e869fe               call 0x5be8  ; sub_s8:5BE8
8:5D7F  0bc0                 or ax, ax
8:5D81  7405                 je 0x5d88
8:5D83  c746fe0100           mov word ptr [bp - 2], 1
loc_5D88:
8:5D88  8b46f0               mov ax, word ptr [bp - 0x10]
8:5D8B  40                   inc ax
8:5D8C  8946e2               mov word ptr [bp - 0x1e], ax
8:5D8F  8946fa               mov word ptr [bp - 6], ax
8:5D92  8d46f8               lea ax, [bp - 8]
8:5D95  16                   push ss
8:5D96  50                   push ax
8:5D97  6a7b                 push 0x7b
8:5D99  ff7618               push word ptr [bp + 0x18]
8:5D9C  66ff7606             push dword ptr [bp + 6]
8:5DA0  90                   nop
8:5DA1  0e                   push cs
8:5DA2  e843fe               call 0x5be8  ; sub_s8:5BE8
8:5DA5  0bc0                 or ax, ax
8:5DA7  7405                 je 0x5dae
8:5DA9  c746fe0100           mov word ptr [bp - 2], 1
loc_5DAE:
8:5DAE  8b46f0               mov ax, word ptr [bp - 0x10]
8:5DB1  8946e2               mov word ptr [bp - 0x1e], ax
8:5DB4  8946fa               mov word ptr [bp - 6], ax
8:5DB7  8b46f2               mov ax, word ptr [bp - 0xe]
8:5DBA  48                   dec ax
8:5DBB  8946e2               mov word ptr [bp - 0x1e], ax
8:5DBE  8946f8               mov word ptr [bp - 8], ax
8:5DC1  8d46f8               lea ax, [bp - 8]
8:5DC4  16                   push ss
8:5DC5  50                   push ax
8:5DC6  6a7c                 push 0x7c
8:5DC8  ff7618               push word ptr [bp + 0x18]
8:5DCB  66ff7606             push dword ptr [bp + 6]
8:5DCF  90                   nop
8:5DD0  0e                   push cs
8:5DD1  e814fe               call 0x5be8  ; sub_s8:5BE8
8:5DD4  0bc0                 or ax, ax
8:5DD6  7405                 je 0x5ddd
8:5DD8  c746fe0100           mov word ptr [bp - 2], 1
loc_5DDD:
8:5DDD  8b46f2               mov ax, word ptr [bp - 0xe]
8:5DE0  40                   inc ax
8:5DE1  8946e2               mov word ptr [bp - 0x1e], ax
8:5DE4  8946f8               mov word ptr [bp - 8], ax
8:5DE7  8d46f8               lea ax, [bp - 8]
8:5DEA  16                   push ss
8:5DEB  50                   push ax
8:5DEC  6a7c                 push 0x7c
8:5DEE  ff7618               push word ptr [bp + 0x18]
8:5DF1  66ff7606             push dword ptr [bp + 6]
8:5DF5  90                   nop
8:5DF6  0e                   push cs
8:5DF7  e8eefd               call 0x5be8  ; sub_s8:5BE8
8:5DFA  0bc0                 or ax, ax
8:5DFC  0f841eff             je 0x5d1e
8:5E00  c746fe0100           mov word ptr [bp - 2], 1
8:5E05  e916ff               jmp 0x5d1e
loc_5E08:
8:5E08  837efe00             cmp word ptr [bp - 2], 0
8:5E0C  0f85c5fe             jne 0x5cd5
8:5E10  5e                   pop si
8:5E11  c9                   leave
8:5E12  ca1400               retf 0x14
8:5E15  db 00

; ---------------- sub_s8:5E16 FAR size=770 callers=0
8:5E16  c8320000             enter 0x32, 0
8:5E1A  66ff760a             push dword ptr [bp + 0xa]
8:5E1E  66ff7606             push dword ptr [bp + 6]
8:5E22  9ad6169f5f           lcall 0x5f9f, 0x16d6  ; sub_s7:16D6
8:5E27  0bc0                 or ax, ax
8:5E29  7507                 jne 0x5e32
loc_5E2B:
8:5E2B  33c0                 xor ax, ax
8:5E2D  c9                   leave
8:5E2E  ca0800               retf 8
8:5E31  db 90
loc_5E32:
8:5E32  c45e06               les bx, ptr [bp + 6]
8:5E35  66268b470c           mov eax, dword ptr es:[bx + 0xc]
8:5E3A  668946fc             mov dword ptr [bp - 4], eax
8:5E3E  6650                 push eax
8:5E40  66ff760a             push dword ptr [bp + 0xa]
8:5E44  9a9878715e           lcall 0x5e71, 0x7898  ; sub_s2:7898
8:5E49  0bc0                 or ax, ax
8:5E4B  7509                 jne 0x5e56
loc_5E4D:
8:5E4D  c7061003d006         mov word ptr [0x310], 0x6d0
8:5E53  ebd6                 jmp 0x5e2b
8:5E55  db 90
loc_5E56:
8:5E56  c45e06               les bx, ptr [bp + 6]
8:5E59  66268b4710           mov eax, dword ptr es:[bx + 0x10]
8:5E5E  668946ee             mov dword ptr [bp - 0x12], eax
8:5E62  666a04               push 4
8:5E65  8d46ee               lea ax, [bp - 0x12]
8:5E68  16                   push ss
8:5E69  50                   push ax
8:5E6A  66ff760a             push dword ptr [bp + 0xa]
8:5E6E  9a1c7e905e           lcall 0x5e90, 0x7e1c  ; File_write@s2:7E1C
8:5E73  0bc0                 or ax, ax
8:5E75  74d6                 je 0x5e4d
8:5E77  c45e06               les bx, ptr [bp + 6]
8:5E7A  268b4718             mov ax, word ptr es:[bx + 0x18]
8:5E7E  8946f6               mov word ptr [bp - 0xa], ax
8:5E81  666a02               push 2
8:5E84  8d46f6               lea ax, [bp - 0xa]
8:5E87  16                   push ss
8:5E88  50                   push ax
8:5E89  66ff760a             push dword ptr [bp + 0xa]
8:5E8D  9a1c7eaf5e           lcall 0x5eaf, 0x7e1c  ; File_write@s2:7E1C
8:5E92  0bc0                 or ax, ax
8:5E94  74b7                 je 0x5e4d
8:5E96  c45e06               les bx, ptr [bp + 6]
8:5E99  268b471a             mov ax, word ptr es:[bx + 0x1a]
8:5E9D  8946f6               mov word ptr [bp - 0xa], ax
8:5EA0  666a02               push 2
8:5EA3  8d46f6               lea ax, [bp - 0xa]
8:5EA6  16                   push ss
8:5EA7  50                   push ax
8:5EA8  66ff760a             push dword ptr [bp + 0xa]
8:5EAC  9a1c7ece5e           lcall 0x5ece, 0x7e1c  ; File_write@s2:7E1C
8:5EB1  0bc0                 or ax, ax
8:5EB3  7498                 je 0x5e4d
8:5EB5  c45e06               les bx, ptr [bp + 6]
8:5EB8  268b471c             mov ax, word ptr es:[bx + 0x1c]
8:5EBC  8946f6               mov word ptr [bp - 0xa], ax
8:5EBF  666a02               push 2
8:5EC2  8d46f6               lea ax, [bp - 0xa]
8:5EC5  16                   push ss
8:5EC6  50                   push ax
8:5EC7  66ff760a             push dword ptr [bp + 0xa]
8:5ECB  9a1c7ef15e           lcall 0x5ef1, 0x7e1c  ; File_write@s2:7E1C
8:5ED0  0bc0                 or ax, ax
8:5ED2  0f8477ff             je 0x5e4d
8:5ED6  c45e06               les bx, ptr [bp + 6]
8:5ED9  66268b471e           mov eax, dword ptr es:[bx + 0x1e]
8:5EDE  668946f6             mov dword ptr [bp - 0xa], eax
8:5EE2  666a04               push 4
8:5EE5  8d46f6               lea ax, [bp - 0xa]
8:5EE8  16                   push ss
8:5EE9  50                   push ax
8:5EEA  66ff760a             push dword ptr [bp + 0xa]
8:5EEE  9a1c7e125f           lcall 0x5f12, 0x7e1c  ; File_write@s2:7E1C
8:5EF3  0bc0                 or ax, ax
8:5EF5  0f8454ff             je 0x5e4d
8:5EF9  c45e06               les bx, ptr [bp + 6]
8:5EFC  268b4722             mov ax, word ptr es:[bx + 0x22]
8:5F00  8946f6               mov word ptr [bp - 0xa], ax
8:5F03  666a02               push 2
8:5F06  8d46f6               lea ax, [bp - 0xa]
8:5F09  16                   push ss
8:5F0A  50                   push ax
8:5F0B  66ff760a             push dword ptr [bp + 0xa]
8:5F0F  9a1c7e335f           lcall 0x5f33, 0x7e1c  ; File_write@s2:7E1C
8:5F14  0bc0                 or ax, ax
8:5F16  0f8433ff             je 0x5e4d
8:5F1A  c45e06               les bx, ptr [bp + 6]
8:5F1D  268b4724             mov ax, word ptr es:[bx + 0x24]
8:5F21  8946f6               mov word ptr [bp - 0xa], ax
8:5F24  666a02               push 2
8:5F27  8d46f6               lea ax, [bp - 0xa]
8:5F2A  16                   push ss
8:5F2B  50                   push ax
8:5F2C  66ff760a             push dword ptr [bp + 0xa]
8:5F30  9a1c7e515f           lcall 0x5f51, 0x7e1c  ; File_write@s2:7E1C
8:5F35  0bc0                 or ax, ax
8:5F37  0f8412ff             je 0x5e4d
8:5F3B  666894000000         push 0x94
8:5F41  668b4606             mov eax, dword ptr [bp + 6]
8:5F45  052600               add ax, 0x26
8:5F48  6650                 push eax
8:5F4A  66ff760a             push dword ptr [bp + 0xa]
8:5F4E  9a1c7e6c5f           lcall 0x5f6c, 0x7e1c  ; File_write@s2:7E1C
8:5F53  0bc0                 or ax, ax
8:5F55  0f84f4fe             je 0x5e4d
8:5F59  666a54               push 0x54
8:5F5C  668b4606             mov eax, dword ptr [bp + 6]
8:5F60  054e01               add ax, 0x14e
8:5F63  6650                 push eax
8:5F65  66ff760a             push dword ptr [bp + 0xa]
8:5F69  9a1c7e875f           lcall 0x5f87, 0x7e1c  ; File_write@s2:7E1C
8:5F6E  0bc0                 or ax, ax
8:5F70  0f84d9fe             je 0x5e4d
8:5F74  666a54               push 0x54
8:5F77  668b4606             mov eax, dword ptr [bp + 6]
8:5F7B  05a201               add ax, 0x1a2
8:5F7E  6650                 push eax
8:5F80  66ff760a             push dword ptr [bp + 0xa]
8:5F84  9a1c7eb15f           lcall 0x5fb1, 0x7e1c  ; File_write@s2:7E1C
8:5F89  0bc0                 or ax, ax
8:5F8B  0f84befe             je 0x5e4d
8:5F8F  66ff760a             push dword ptr [bp + 0xa]
8:5F93  c45e06               les bx, ptr [bp + 6]
8:5F96  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:5F9C  9ae432005c           lcall 0x5c00, 0x32e4  ; sub_s7:32E4
8:5FA1  c45e06               les bx, ptr [bp + 6]
8:5FA4  6626ffb7fa01         push dword ptr es:[bx + 0x1fa]
8:5FAA  66ff760a             push dword ptr [bp + 0xa]
8:5FAE  9a2a7cd35f           lcall 0x5fd3, 0x7c2a  ; sub_s2:7C2A
8:5FB3  0bc0                 or ax, ax
8:5FB5  0f8494fe             je 0x5e4d
8:5FB9  c45e06               les bx, ptr [bp + 6]
8:5FBC  268b87fe01           mov ax, word ptr es:[bx + 0x1fe]
8:5FC1  8946f6               mov word ptr [bp - 0xa], ax
8:5FC4  666a02               push 2
8:5FC7  8d46f6               lea ax, [bp - 0xa]
8:5FCA  16                   push ss
8:5FCB  50                   push ax
8:5FCC  66ff760a             push dword ptr [bp + 0xa]
8:5FD0  9a1c7ef75f           lcall 0x5ff7, 0x7e1c  ; File_write@s2:7E1C
8:5FD5  0bc0                 or ax, ax
8:5FD7  0f8472fe             je 0x5e4d
8:5FDB  c45e06               les bx, ptr [bp + 6]
8:5FDE  66268b870002         mov eax, dword ptr es:[bx + 0x200]
8:5FE4  668946f6             mov dword ptr [bp - 0xa], eax
8:5FE8  666a04               push 4
8:5FEB  8d46f6               lea ax, [bp - 0xa]
8:5FEE  16                   push ss
8:5FEF  50                   push ax
8:5FF0  66ff760a             push dword ptr [bp + 0xa]
8:5FF4  9a1c7e1960           lcall 0x6019, 0x7e1c  ; File_write@s2:7E1C
8:5FF9  0bc0                 or ax, ax
8:5FFB  0f844efe             je 0x5e4d
8:5FFF  c45e06               les bx, ptr [bp + 6]
8:6002  268b870402           mov ax, word ptr es:[bx + 0x204]
8:6007  8946f6               mov word ptr [bp - 0xa], ax
8:600A  666a02               push 2
8:600D  8d46f6               lea ax, [bp - 0xa]
8:6010  16                   push ss
8:6011  50                   push ax
8:6012  66ff760a             push dword ptr [bp + 0xa]
8:6016  9a1c7e3b60           lcall 0x603b, 0x7e1c  ; File_write@s2:7E1C
8:601B  0bc0                 or ax, ax
8:601D  0f842cfe             je 0x5e4d
8:6021  c45e06               les bx, ptr [bp + 6]
8:6024  268b870602           mov ax, word ptr es:[bx + 0x206]
8:6029  8946f6               mov word ptr [bp - 0xa], ax
8:602C  666a02               push 2
8:602F  8d46f6               lea ax, [bp - 0xa]
8:6032  16                   push ss
8:6033  50                   push ax
8:6034  66ff760a             push dword ptr [bp + 0xa]
8:6038  9a1c7e5d60           lcall 0x605d, 0x7e1c  ; File_write@s2:7E1C
8:603D  0bc0                 or ax, ax
8:603F  0f840afe             je 0x5e4d
8:6043  c45e06               les bx, ptr [bp + 6]
8:6046  268b870802           mov ax, word ptr es:[bx + 0x208]
8:604B  8946f6               mov word ptr [bp - 0xa], ax
8:604E  666a02               push 2
8:6051  8d46f6               lea ax, [bp - 0xa]
8:6054  16                   push ss
8:6055  50                   push ax
8:6056  66ff760a             push dword ptr [bp + 0xa]
8:605A  9a1c7e7f60           lcall 0x607f, 0x7e1c  ; File_write@s2:7E1C
8:605F  0bc0                 or ax, ax
8:6061  0f84e8fd             je 0x5e4d
8:6065  c45e06               les bx, ptr [bp + 6]
8:6068  268b870a02           mov ax, word ptr es:[bx + 0x20a]
8:606D  8946f6               mov word ptr [bp - 0xa], ax
8:6070  666a02               push 2
8:6073  8d46f6               lea ax, [bp - 0xa]
8:6076  16                   push ss
8:6077  50                   push ax
8:6078  66ff760a             push dword ptr [bp + 0xa]
8:607C  9a1c7ea160           lcall 0x60a1, 0x7e1c  ; File_write@s2:7E1C
8:6081  0bc0                 or ax, ax
8:6083  0f84c6fd             je 0x5e4d
8:6087  c45e06               les bx, ptr [bp + 6]
8:608A  268b870c02           mov ax, word ptr es:[bx + 0x20c]
8:608F  8946f6               mov word ptr [bp - 0xa], ax
8:6092  666a02               push 2
8:6095  8d46f6               lea ax, [bp - 0xa]
8:6098  16                   push ss
8:6099  50                   push ax
8:609A  66ff760a             push dword ptr [bp + 0xa]
8:609E  9a1c7ec360           lcall 0x60c3, 0x7e1c  ; File_write@s2:7E1C
8:60A3  0bc0                 or ax, ax
8:60A5  0f84a4fd             je 0x5e4d
8:60A9  c45e06               les bx, ptr [bp + 6]
8:60AC  268b870e02           mov ax, word ptr es:[bx + 0x20e]
8:60B1  8946f6               mov word ptr [bp - 0xa], ax
8:60B4  666a02               push 2
8:60B7  8d46f6               lea ax, [bp - 0xa]
8:60BA  16                   push ss
8:60BB  50                   push ax
8:60BC  66ff760a             push dword ptr [bp + 0xa]
8:60C0  9a1c7ee560           lcall 0x60e5, 0x7e1c  ; File_write@s2:7E1C
8:60C5  0bc0                 or ax, ax
8:60C7  0f8482fd             je 0x5e4d
8:60CB  c45e06               les bx, ptr [bp + 6]
8:60CE  268b871402           mov ax, word ptr es:[bx + 0x214]
8:60D3  8946f6               mov word ptr [bp - 0xa], ax
8:60D6  666a02               push 2
8:60D9  8d46f6               lea ax, [bp - 0xa]
8:60DC  16                   push ss
8:60DD  50                   push ax
8:60DE  66ff760a             push dword ptr [bp + 0xa]
8:60E2  9a1c7e0961           lcall 0x6109, 0x7e1c  ; File_write@s2:7E1C
8:60E7  0bc0                 or ax, ax
8:60E9  0f8460fd             je 0x5e4d
8:60ED  c45e06               les bx, ptr [bp + 6]
8:60F0  66268b871602         mov eax, dword ptr es:[bx + 0x216]
8:60F6  668946f6             mov dword ptr [bp - 0xa], eax
8:60FA  666a04               push 4
8:60FD  8d46f6               lea ax, [bp - 0xa]
8:6100  16                   push ss
8:6101  50                   push ax
8:6102  66ff760a             push dword ptr [bp + 0xa]
8:6106  9a1c7ed35c           lcall 0x5cd3, 0x7e1c  ; File_write@s2:7E1C
8:610B  0bc0                 or ax, ax
8:610D  0f843cfd             je 0x5e4d
8:6111  b80100               mov ax, 1
8:6114  c9                   leave
8:6115  ca0800               retf 8

; ---------------- sub_s8:6118 size=966 callers=0
8:6118  c83c0400             enter 0x43c, 0
8:611C  56                   push si
8:611D  66ff760a             push dword ptr [bp + 0xa]
8:6121  66ff7606             push dword ptr [bp + 6]
8:6125  9a30175a63           lcall 0x635a, 0x1730  ; sub_s7:1730
8:612A  0bc0                 or ax, ax
8:612C  7508                 jne 0x6136
loc_612E:
8:612E  33c0                 xor ax, ax
8:6130  5e                   pop si
8:6131  c9                   leave
8:6132  ca0800               retf 8
8:6135  db 90
loc_6136:
8:6136  66c746fc00000000     mov dword ptr [bp - 4], 0
8:613E  8d46fc               lea ax, [bp - 4]
8:6141  16                   push ss
8:6142  50                   push ax
8:6143  66ff760a             push dword ptr [bp + 0xa]
8:6147  9a48757761           lcall 0x6177, 0x7548  ; sub_s2:7548
8:614C  0bc0                 or ax, ax
8:614E  7508                 jne 0x6158
loc_6150:
8:6150  c7061003d206         mov word ptr [0x310], 0x6d2
8:6156  ebd6                 jmp 0x612e
loc_6158:
8:6158  668b46fc             mov eax, dword ptr [bp - 4]
8:615C  c45e06               les bx, ptr [bp + 6]
8:615F  662689470c           mov dword ptr es:[bx + 0xc], eax
8:6164  666a04               push 4
8:6167  668b4606             mov eax, dword ptr [bp + 6]
8:616B  051000               add ax, 0x10
8:616E  6650                 push eax
8:6170  66ff760a             push dword ptr [bp + 0xa]
8:6174  9aee7d9061           lcall 0x6190, 0x7dee  ; File_read@s2:7DEE
8:6179  0bc0                 or ax, ax
8:617B  74d3                 je 0x6150
8:617D  666a02               push 2
8:6180  668b4606             mov eax, dword ptr [bp + 6]
8:6184  051800               add ax, 0x18
8:6187  6650                 push eax
8:6189  66ff760a             push dword ptr [bp + 0xa]
8:618D  9aee7da961           lcall 0x61a9, 0x7dee  ; File_read@s2:7DEE
8:6192  0bc0                 or ax, ax
8:6194  74ba                 je 0x6150
8:6196  666a02               push 2
8:6199  668b4606             mov eax, dword ptr [bp + 6]
8:619D  051a00               add ax, 0x1a
8:61A0  6650                 push eax
8:61A2  66ff760a             push dword ptr [bp + 0xa]
8:61A6  9aee7dbe61           lcall 0x61be, 0x7dee  ; File_read@s2:7DEE
8:61AB  0bc0                 or ax, ax
8:61AD  74a1                 je 0x6150
8:61AF  666a02               push 2
8:61B2  8d46fa               lea ax, [bp - 6]
8:61B5  16                   push ss
8:61B6  50                   push ax
8:61B7  66ff760a             push dword ptr [bp + 0xa]
8:61BB  9aee7dd761           lcall 0x61d7, 0x7dee  ; File_read@s2:7DEE
8:61C0  0bc0                 or ax, ax
8:61C2  748c                 je 0x6150
8:61C4  666a04               push 4
8:61C7  668b4606             mov eax, dword ptr [bp + 6]
8:61CB  051e00               add ax, 0x1e
8:61CE  6650                 push eax
8:61D0  66ff760a             push dword ptr [bp + 0xa]
8:61D4  9aee7df261           lcall 0x61f2, 0x7dee  ; File_read@s2:7DEE
8:61D9  0bc0                 or ax, ax
8:61DB  0f8471ff             je 0x6150
8:61DF  666a02               push 2
8:61E2  668b4606             mov eax, dword ptr [bp + 6]
8:61E6  052200               add ax, 0x22
8:61E9  6650                 push eax
8:61EB  66ff760a             push dword ptr [bp + 0xa]
8:61EF  9aee7d1762           lcall 0x6217, 0x7dee  ; File_read@s2:7DEE
8:61F4  0bc0                 or ax, ax
8:61F6  0f8456ff             je 0x6150
8:61FA  8b46fa               mov ax, word ptr [bp - 6]
8:61FD  c45e06               les bx, ptr [bp + 6]
8:6200  2689471c             mov word ptr es:[bx + 0x1c], ax
8:6204  666a02               push 2
8:6207  668b4606             mov eax, dword ptr [bp + 6]
8:620B  052400               add ax, 0x24
8:620E  6650                 push eax
8:6210  66ff760a             push dword ptr [bp + 0xa]
8:6214  9aee7d3562           lcall 0x6235, 0x7dee  ; File_read@s2:7DEE
8:6219  0bc0                 or ax, ax
8:621B  0f8431ff             je 0x6150
8:621F  666894000000         push 0x94
8:6225  668b4606             mov eax, dword ptr [bp + 6]
8:6229  052600               add ax, 0x26
8:622C  6650                 push eax
8:622E  66ff760a             push dword ptr [bp + 0xa]
8:6232  9aee7d6462           lcall 0x6264, 0x7dee  ; File_read@s2:7DEE
8:6237  0bc0                 or ax, ax
8:6239  0f8413ff             je 0x6150
8:623D  833e120302           cmp word ptr [0x312], 2
8:6242  0f8d1c02             jge 0x6462
8:6246  666a54               push 0x54
8:6249  6a54                 push 0x54
8:624B  9a9c178462           lcall 0x6284, 0x179c  ; operator_new@s1:179C
8:6250  83c402               add sp, 2
8:6253  8986ecfb             mov word ptr [bp - 0x414], ax
8:6257  8996eefb             mov word ptr [bp - 0x412], dx
8:625B  52                   push dx
8:625C  50                   push ax
8:625D  66ff760a             push dword ptr [bp + 0xa]
8:6261  9aee7d9d62           lcall 0x629d, 0x7dee  ; File_read@s2:7DEE
8:6266  0bc0                 or ax, ax
8:6268  7522                 jne 0x628c
loc_626A:
8:626A  c7061003d206         mov word ptr [0x310], 0x6d2
8:6270  668b86ecfb           mov eax, dword ptr [bp - 0x414]
8:6275  668986dcfb           mov dword ptr [bp - 0x424], eax
8:627A  668986f4fb           mov dword ptr [bp - 0x40c], eax
8:627F  6650                 push eax
8:6281  9ace174563           lcall 0x6345, 0x17ce  ; operator_delete@s1:17CE
8:6286  83c404               add sp, 4
8:6289  e9a2fe               jmp 0x612e
loc_628C:
8:628C  c786f0fb0000         mov word ptr [bp - 0x410], 0
loc_6292:
8:6292  ffb6f0fb             push word ptr [bp - 0x410]
8:6296  66ff760a             push dword ptr [bp + 0xa]
8:629A  9abc72e362           lcall 0x62e3, 0x72bc  ; sub_s2:72BC
8:629F  8986f4fb             mov word ptr [bp - 0x40c], ax
8:62A3  8b9ef0fb             mov bx, word ptr [bp - 0x410]
8:62A7  c1e302               shl bx, 2
8:62AA  c4b6ecfb             les si, ptr [bp - 0x414]
8:62AE  268b00               mov ax, word ptr es:[bx + si]
8:62B1  268b5002             mov dx, word ptr es:[bx + si + 2]
8:62B5  8bb6f4fb             mov si, word ptr [bp - 0x40c]
8:62B9  c1e602               shl si, 2
8:62BC  c45e06               les bx, ptr [bp + 6]
8:62BF  2689804e01           mov word ptr es:[bx + si + 0x14e], ax
8:62C4  2689905001           mov word ptr es:[bx + si + 0x150], dx
8:62C9  ff86f0fb             inc word ptr [bp - 0x410]
8:62CD  83bef0fb15           cmp word ptr [bp - 0x410], 0x15
8:62D2  7cbe                 jl 0x6292
8:62D4  666a54               push 0x54
8:62D7  66ffb6ecfb           push dword ptr [bp - 0x414]
8:62DC  66ff760a             push dword ptr [bp + 0xa]
8:62E0  9aee7dfa62           lcall 0x62fa, 0x7dee  ; File_read@s2:7DEE
8:62E5  0bc0                 or ax, ax
8:62E7  7481                 je 0x626a
8:62E9  c786f0fb0000         mov word ptr [bp - 0x410], 0
loc_62EF:
8:62EF  ffb6f0fb             push word ptr [bp - 0x410]
8:62F3  66ff760a             push dword ptr [bp + 0xa]
8:62F7  9abc726963           lcall 0x6369, 0x72bc  ; sub_s2:72BC
8:62FC  8986f4fb             mov word ptr [bp - 0x40c], ax
8:6300  8b9ef0fb             mov bx, word ptr [bp - 0x410]
8:6304  c1e302               shl bx, 2
8:6307  c4b6ecfb             les si, ptr [bp - 0x414]
8:630B  268b00               mov ax, word ptr es:[bx + si]
8:630E  268b5002             mov dx, word ptr es:[bx + si + 2]
8:6312  8bb6f4fb             mov si, word ptr [bp - 0x40c]
8:6316  c1e602               shl si, 2
8:6319  c45e06               les bx, ptr [bp + 6]
8:631C  268980a201           mov word ptr es:[bx + si + 0x1a2], ax
8:6321  268990a401           mov word ptr es:[bx + si + 0x1a4], dx
8:6326  ff86f0fb             inc word ptr [bp - 0x410]
8:632A  83bef0fb15           cmp word ptr [bp - 0x410], 0x15
8:632F  7cbe                 jl 0x62ef
8:6331  668b86ecfb           mov eax, dword ptr [bp - 0x414]
8:6336  668986dcfb           mov dword ptr [bp - 0x424], eax
8:633B  668986f4fb           mov dword ptr [bp - 0x40c], eax
8:6340  6650                 push eax
8:6342  9ace17d557           lcall 0x57d5, 0x17ce  ; operator_delete@s1:17CE
8:6347  83c404               add sp, 4
loc_634A:
8:634A  66ff760a             push dword ptr [bp + 0xa]
8:634E  c45e06               les bx, ptr [bp + 6]
8:6351  6626ffb7f601         push dword ptr es:[bx + 0x1f6]
8:6357  9af033255e           lcall 0x5e25, 0x33f0  ; sub_s7:33F0
8:635C  8d86fafb             lea ax, [bp - 0x406]
8:6360  16                   push ss
8:6361  50                   push ax
8:6362  66ff760a             push dword ptr [bp + 0xa]
8:6366  9a6e7c7a63           lcall 0x637a, 0x7c6e  ; sub_s2:7C6E
8:636B  0bc0                 or ax, ax
8:636D  0f84dffd             je 0x6150
8:6371  8d86fafb             lea ax, [bp - 0x406]
8:6375  16                   push ss
8:6376  50                   push ax
8:6377  9ae8609f63           lcall 0x639f, 0x60e8  ; sub_s2:60E8
8:637C  83c404               add sp, 4
8:637F  c45e06               les bx, ptr [bp + 6]
8:6382  268987fa01           mov word ptr es:[bx + 0x1fa], ax
8:6387  268997fc01           mov word ptr es:[bx + 0x1fc], dx
8:638C  666a02               push 2
8:638F  668b4606             mov eax, dword ptr [bp + 6]
8:6393  05fe01               add ax, 0x1fe
8:6396  6650                 push eax
8:6398  66ff760a             push dword ptr [bp + 0xa]
8:639C  9aee7dba63           lcall 0x63ba, 0x7dee  ; File_read@s2:7DEE
8:63A1  0bc0                 or ax, ax
8:63A3  0f84b100             je 0x6458
8:63A7  666a04               push 4
8:63AA  668b4606             mov eax, dword ptr [bp + 6]
8:63AE  80c402               add ah, 2
8:63B1  6650                 push eax
8:63B3  66ff760a             push dword ptr [bp + 0xa]
8:63B7  9aee7dd563           lcall 0x63d5, 0x7dee  ; File_read@s2:7DEE
8:63BC  0bc0                 or ax, ax
8:63BE  0f849600             je 0x6458
8:63C2  666a02               push 2
8:63C5  668b4606             mov eax, dword ptr [bp + 6]
8:63C9  050402               add ax, 0x204
8:63CC  6650                 push eax
8:63CE  66ff760a             push dword ptr [bp + 0xa]
8:63D2  9aee7dee63           lcall 0x63ee, 0x7dee  ; File_read@s2:7DEE
8:63D7  0bc0                 or ax, ax
8:63D9  747d                 je 0x6458
8:63DB  666a02               push 2
8:63DE  668b4606             mov eax, dword ptr [bp + 6]
8:63E2  050602               add ax, 0x206
8:63E5  6650                 push eax
8:63E7  66ff760a             push dword ptr [bp + 0xa]
8:63EB  9aee7d0764           lcall 0x6407, 0x7dee  ; File_read@s2:7DEE
8:63F0  0bc0                 or ax, ax
8:63F2  7464                 je 0x6458
8:63F4  666a02               push 2
8:63F7  668b4606             mov eax, dword ptr [bp + 6]
8:63FB  050802               add ax, 0x208
8:63FE  6650                 push eax
8:6400  66ff760a             push dword ptr [bp + 0xa]
8:6404  9aee7d2064           lcall 0x6420, 0x7dee  ; File_read@s2:7DEE
8:6409  0bc0                 or ax, ax
8:640B  744b                 je 0x6458
8:640D  666a02               push 2
8:6410  668b4606             mov eax, dword ptr [bp + 6]
8:6414  050a02               add ax, 0x20a
8:6417  6650                 push eax
8:6419  66ff760a             push dword ptr [bp + 0xa]
8:641D  9aee7d3964           lcall 0x6439, 0x7dee  ; File_read@s2:7DEE
8:6422  0bc0                 or ax, ax
8:6424  7432                 je 0x6458
8:6426  666a02               push 2
8:6429  668b4606             mov eax, dword ptr [bp + 6]
8:642D  050c02               add ax, 0x20c
8:6430  6650                 push eax
8:6432  66ff760a             push dword ptr [bp + 0xa]
8:6436  9aee7d5264           lcall 0x6452, 0x7dee  ; File_read@s2:7DEE
8:643B  0bc0                 or ax, ax
8:643D  7419                 je 0x6458
8:643F  666a02               push 2
8:6442  668b4606             mov eax, dword ptr [bp + 6]
8:6446  050e02               add ax, 0x20e
8:6449  6650                 push eax
8:644B  66ff760a             push dword ptr [bp + 0xa]
8:644F  9aee7d7564           lcall 0x6475, 0x7dee  ; File_read@s2:7DEE
8:6454  0bc0                 or ax, ax
8:6456  7544                 jne 0x649c
loc_6458:
8:6458  c7061003d006         mov word ptr [0x310], 0x6d0
8:645E  e9cdfc               jmp 0x612e
8:6461  db 90
loc_6462:
8:6462  666a54               push 0x54
8:6465  668b4606             mov eax, dword ptr [bp + 6]
8:6469  054e01               add ax, 0x14e
8:646C  6650                 push eax
8:646E  66ff760a             push dword ptr [bp + 0xa]
8:6472  9aee7d9064           lcall 0x6490, 0x7dee  ; File_read@s2:7DEE
8:6477  0bc0                 or ax, ax
8:6479  0f84d3fc             je 0x6150
8:647D  666a54               push 0x54
8:6480  668b4606             mov eax, dword ptr [bp + 6]
8:6484  05a201               add ax, 0x1a2
8:6487  6650                 push eax
8:6489  66ff760a             push dword ptr [bp + 0xa]
8:648D  9aee7db664           lcall 0x64b6, 0x7dee  ; File_read@s2:7DEE
8:6492  0bc0                 or ax, ax
8:6494  0f85b2fe             jne 0x634a
8:6498  e9b5fc               jmp 0x6150
8:649B  db 90
loc_649C:
8:649C  833e120302           cmp word ptr [0x312], 2
8:64A1  7c32                 jl 0x64d5
8:64A3  666a02               push 2
8:64A6  668b4606             mov eax, dword ptr [bp + 6]
8:64AA  051402               add ax, 0x214
8:64AD  6650                 push eax
8:64AF  66ff760a             push dword ptr [bp + 0xa]
8:64B3  9aee7d475e           lcall 0x5e47, 0x7dee  ; File_read@s2:7DEE
8:64B8  0bc0                 or ax, ax
8:64BA  749c                 je 0x6458
8:64BC  666a04               push 4
8:64BF  668b4606             mov eax, dword ptr [bp + 6]
8:64C3  051602               add ax, 0x216
8:64C6  6650                 push eax
8:64C8  66ff760a             push dword ptr [bp + 0xa]
8:64CC  9aee7d4a61           lcall 0x614a, 0x7dee  ; File_read@s2:7DEE
8:64D1  0bc0                 or ax, ax
8:64D3  7483                 je 0x6458
loc_64D5:
8:64D5  b80100               mov ax, 1
8:64D8  5e                   pop si
8:64D9  c9                   leave
8:64DA  ca0800               retf 8
8:64DD  db 00

; ---------------- sub_s8:64DE FAR size=66 callers=0
8:64DE  55                   push bp
8:64DF  8bec                 mov bp, sp
8:64E1  66ff7606             push dword ptr [bp + 6]
8:64E5  90                   nop
8:64E6  0e                   push cs
8:64E7  e80ecf               call 0x33f8  ; sub_s8:33F8
8:64EA  f6460a01             test byte ptr [bp + 0xa], 1
8:64EE  7409                 je 0x64f9
8:64F0  66ff7606             push dword ptr [bp + 6]
8:64F4  9ace174e62           lcall 0x624e, 0x17ce  ; operator_delete@s1:17CE
loc_64F9:
8:64F9  8b4606               mov ax, word ptr [bp + 6]
8:64FC  8b5608               mov dx, word ptr [bp + 8]
8:64FF  c9                   leave
8:6500  ca0600               retf 6
8:6503  db 90 de 64 0e 65 7a 17 1a 65 60 58 12 65 16 5e 16
8:6513  db 65 18 61 09 34 72 19 1e 65 f0 18 28 61

; ---------------- sub_s8:6520 FAR size=112 callers=3
8:6520  c8040000             enter 4, 0
8:6524  c45e06               les bx, ptr [bp + 6]
8:6527  26c7079a38           mov word ptr es:[bx], 0x389a
8:652C  26c747026465         mov word ptr es:[bx + 2], 0x6564  ; SEGMENT s2:0000
8:6532  c45e06               les bx, ptr [bp + 6]
8:6535  662bc0               sub eax, eax
8:6538  6626894704           mov dword ptr es:[bx + 4], eax
8:653D  6626894708           mov dword ptr es:[bx + 8], eax
8:6542  2689470c             mov word ptr es:[bx + 0xc], ax
8:6546  662689470e           mov dword ptr es:[bx + 0xe], eax
8:654B  26894712             mov word ptr es:[bx + 0x12], ax
8:654F  26894714             mov word ptr es:[bx + 0x14], ax
8:6553  6626c7471600000000   mov dword ptr es:[bx + 0x16], 0
8:655C  8d4f1a               lea cx, [bx + 0x1a]
8:655F  06                   push es
8:6560  51                   push cx
8:6561  9a383ecf64           lcall 0x64cf, 0x3e38  ; sub_s2:3E38
8:6566  c45e06               les bx, ptr [bp + 6]
8:6569  662bc0               sub eax, eax
8:656C  6626894720           mov dword ptr es:[bx + 0x20], eax
8:6571  26894724             mov word ptr es:[bx + 0x24], ax
8:6575  26894726             mov word ptr es:[bx + 0x26], ax
8:6579  26894728             mov word ptr es:[bx + 0x28], ax
8:657D  26c707de78           mov word ptr es:[bx], 0x78de
8:6582  26c747020665         mov word ptr es:[bx + 2], 0x6506  ; SEGMENT s8:0000
8:6588  8bc3                 mov ax, bx
8:658A  8cc2                 mov dx, es
8:658C  c9                   leave
8:658D  ca0400               retf 4

; ---------------- sub_s8:6590 FAR size=222 callers=1
8:6590  c80c0000             enter 0xc, 0
8:6594  57                   push di
8:6595  56                   push si
8:6596  c45e06               les bx, ptr [bp + 6]
8:6599  26c7079a38           mov word ptr es:[bx], 0x389a
8:659E  26c74702e665         mov word ptr es:[bx + 2], 0x65e6  ; SEGMENT s2:0000
8:65A4  c45e06               les bx, ptr [bp + 6]
8:65A7  6626c7470400000000   mov dword ptr es:[bx + 4], 0
8:65B0  668b4612             mov eax, dword ptr [bp + 0x12]
8:65B4  6626894708           mov dword ptr es:[bx + 8], eax
8:65B9  8b4e0e               mov cx, word ptr [bp + 0xe]
8:65BC  26894f0c             mov word ptr es:[bx + 0xc], cx
8:65C0  662bc9               sub ecx, ecx
8:65C3  6626894f0e           mov dword ptr es:[bx + 0xe], ecx
8:65C8  26894f12             mov word ptr es:[bx + 0x12], cx
8:65CC  26894f14             mov word ptr es:[bx + 0x14], cx
8:65D0  8b760a               mov si, word ptr [bp + 0xa]
8:65D3  8b7e0c               mov di, word ptr [bp + 0xc]
8:65D6  26897716             mov word ptr es:[bx + 0x16], si
8:65DA  26897f18             mov word ptr es:[bx + 0x18], di
8:65DE  8d771a               lea si, [bx + 0x1a]
8:65E1  06                   push es
8:65E2  56                   push si
8:65E3  9a383e4a66           lcall 0x664a, 0x3e38  ; sub_s2:3E38
8:65E8  c45e06               les bx, ptr [bp + 6]
8:65EB  662bc0               sub eax, eax
8:65EE  6626894720           mov dword ptr es:[bx + 0x20], eax
8:65F3  26894724             mov word ptr es:[bx + 0x24], ax
8:65F7  8b4610               mov ax, word ptr [bp + 0x10]
8:65FA  26894726             mov word ptr es:[bx + 0x26], ax
8:65FE  26c747280000         mov word ptr es:[bx + 0x28], 0
8:6604  26c707de78           mov word ptr es:[bx], 0x78de
8:6609  26c747028665         mov word ptr es:[bx + 2], 0x6586  ; SEGMENT s8:0000
8:660F  66ff7612             push dword ptr [bp + 0x12]
8:6613  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:6618  9aece11c5c           lcall 0x5c1c, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:661D  8946fc               mov word ptr [bp - 4], ax
8:6620  8956fe               mov word ptr [bp - 2], dx
8:6623  52                   push dx
8:6624  50                   push ax
8:6625  9a4e6d0a65           lcall 0x650a, 0x6d4e  ; sub_s7:6D4E
8:662A  c45e06               les bx, ptr [bp + 6]
8:662D  26894704             mov word ptr es:[bx + 4], ax
8:6631  26895706             mov word ptr es:[bx + 6], dx
8:6635  668b46fc             mov eax, dword ptr [bp - 4]
8:6639  050c00               add ax, 0xc
8:663C  6650                 push eax
8:663E  668b4606             mov eax, dword ptr [bp + 6]
8:6642  051a00               add ax, 0x1a
8:6645  6650                 push eax
8:6647  9a623f3065           lcall 0x6530, 0x3f62  ; sub_s2:3F62
8:664C  c45e06               les bx, ptr [bp + 6]
8:664F  6626ff7704           push dword ptr es:[bx + 4]
8:6654  9aba8f4c41           lcall 0x414c, 0x8fba  ; sub_s3:8FBA
8:6659  c45e06               les bx, ptr [bp + 6]
8:665C  26894720             mov word ptr es:[bx + 0x20], ax
8:6660  26895722             mov word ptr es:[bx + 0x22], dx
8:6664  8bc3                 mov ax, bx
8:6666  8cc2                 mov dx, es
8:6668  5e                   pop si
8:6669  5f                   pop di
8:666A  c9                   leave
8:666B  ca1000               retf 0x10

; ---------------- sub_s8:666E FAR size=238 callers=2
8:666E  c80c0000             enter 0xc, 0
8:6672  56                   push si
8:6673  c45e06               les bx, ptr [bp + 6]
8:6676  26c7079a38           mov word ptr es:[bx], 0x389a
8:667B  26c74702c166         mov word ptr es:[bx + 2], 0x66c1  ; SEGMENT s2:0000
8:6681  c45e06               les bx, ptr [bp + 6]
8:6684  6626c7470400000000   mov dword ptr es:[bx + 4], 0
8:668D  668b4610             mov eax, dword ptr [bp + 0x10]
8:6691  6626894708           mov dword ptr es:[bx + 8], eax
8:6696  26c7470c0000         mov word ptr es:[bx + 0xc], 0
8:669C  668b4e0a             mov ecx, dword ptr [bp + 0xa]
8:66A0  6626894f0e           mov dword ptr es:[bx + 0xe], ecx
8:66A5  33c9                 xor cx, cx
8:66A7  26894f12             mov word ptr es:[bx + 0x12], cx
8:66AB  26894f14             mov word ptr es:[bx + 0x14], cx
8:66AF  2bf6                 sub si, si
8:66B1  26897718             mov word ptr es:[bx + 0x18], si
8:66B5  26897716             mov word ptr es:[bx + 0x16], si
8:66B9  8d771a               lea si, [bx + 0x1a]
8:66BC  06                   push es
8:66BD  56                   push si
8:66BE  9a383e2567           lcall 0x6725, 0x3e38  ; sub_s2:3E38
8:66C3  c45e06               les bx, ptr [bp + 6]
8:66C6  662bc0               sub eax, eax
8:66C9  6626894720           mov dword ptr es:[bx + 0x20], eax
8:66CE  26894724             mov word ptr es:[bx + 0x24], ax
8:66D2  8b460e               mov ax, word ptr [bp + 0xe]
8:66D5  26894726             mov word ptr es:[bx + 0x26], ax
8:66D9  26c747280000         mov word ptr es:[bx + 0x28], 0
8:66DF  26c707de78           mov word ptr es:[bx], 0x78de
8:66E4  26c747020d66         mov word ptr es:[bx + 2], 0x660d  ; SEGMENT s8:0000
8:66EA  66ff7610             push dword ptr [bp + 0x10]
8:66EE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:66F3  9aece11b66           lcall 0x661b, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:66F8  8946fc               mov word ptr [bp - 4], ax
8:66FB  8956fe               mov word ptr [bp - 2], dx
8:66FE  52                   push dx
8:66FF  50                   push ax
8:6700  9a4e6d2866           lcall 0x6628, 0x6d4e  ; sub_s7:6D4E
8:6705  c45e06               les bx, ptr [bp + 6]
8:6708  26894704             mov word ptr es:[bx + 4], ax
8:670C  26895706             mov word ptr es:[bx + 6], dx
8:6710  668b46fc             mov eax, dword ptr [bp - 4]
8:6714  050c00               add ax, 0xc
8:6717  6650                 push eax
8:6719  668b4606             mov eax, dword ptr [bp + 6]
8:671D  051a00               add ax, 0x1a
8:6720  6650                 push eax
8:6722  9a623fa265           lcall 0x65a2, 0x3f62  ; sub_s2:3F62
8:6727  c45e06               les bx, ptr [bp + 6]
8:672A  6626ff7704           push dword ptr es:[bx + 4]
8:672F  9aba8f5766           lcall 0x6657, 0x8fba  ; sub_s3:8FBA
8:6734  c45e06               les bx, ptr [bp + 6]
8:6737  26894720             mov word ptr es:[bx + 0x20], ax
8:673B  26895722             mov word ptr es:[bx + 0x22], dx
8:673F  66ff760a             push dword ptr [bp + 0xa]
8:6743  9a94bacc54           lcall 0x54cc, 0xba94  ; sub_s5:BA94
8:6748  c45e06               les bx, ptr [bp + 6]
8:674B  26894716             mov word ptr es:[bx + 0x16], ax
8:674F  26895718             mov word ptr es:[bx + 0x18], dx
8:6753  8bc3                 mov ax, bx
8:6755  8cc2                 mov dx, es
8:6757  5e                   pop si
8:6758  c9                   leave
8:6759  ca0e00               retf 0xe

; ---------------- sub_s8:675C FAR size=220 callers=2
8:675C  c80c0000             enter 0xc, 0
8:6760  56                   push si
8:6761  c45e06               les bx, ptr [bp + 6]
8:6764  26c7079a38           mov word ptr es:[bx], 0x389a
8:6769  26c74702b167         mov word ptr es:[bx + 2], 0x67b1  ; SEGMENT s2:0000
8:676F  c45e06               les bx, ptr [bp + 6]
8:6772  6626c7470400000000   mov dword ptr es:[bx + 4], 0
8:677B  668b4612             mov eax, dword ptr [bp + 0x12]
8:677F  6626894708           mov dword ptr es:[bx + 8], eax
8:6784  26c7470c0000         mov word ptr es:[bx + 0xc], 0
8:678A  6626c7470e00000000   mov dword ptr es:[bx + 0xe], 0
8:6793  8b4e0e               mov cx, word ptr [bp + 0xe]
8:6796  26894f12             mov word ptr es:[bx + 0x12], cx
8:679A  26c747140000         mov word ptr es:[bx + 0x14], 0
8:67A0  668b4e0a             mov ecx, dword ptr [bp + 0xa]
8:67A4  6626894f16           mov dword ptr es:[bx + 0x16], ecx
8:67A9  8d4f1a               lea cx, [bx + 0x1a]
8:67AC  06                   push es
8:67AD  51                   push cx
8:67AE  9a383e1568           lcall 0x6815, 0x3e38  ; sub_s2:3E38
8:67B3  c45e06               les bx, ptr [bp + 6]
8:67B6  662bc0               sub eax, eax
8:67B9  6626894720           mov dword ptr es:[bx + 0x20], eax
8:67BE  26894724             mov word ptr es:[bx + 0x24], ax
8:67C2  8b4610               mov ax, word ptr [bp + 0x10]
8:67C5  26894726             mov word ptr es:[bx + 0x26], ax
8:67C9  26c747280000         mov word ptr es:[bx + 0x28], 0
8:67CF  26c707de78           mov word ptr es:[bx], 0x78de
8:67D4  26c74702e866         mov word ptr es:[bx + 2], 0x66e8  ; SEGMENT s8:0000
8:67DA  66ff7612             push dword ptr [bp + 0x12]
8:67DE  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:67E3  9aece1f666           lcall 0x66f6, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:67E8  8946fc               mov word ptr [bp - 4], ax
8:67EB  8956fe               mov word ptr [bp - 2], dx
8:67EE  52                   push dx
8:67EF  50                   push ax
8:67F0  9a4e6d0367           lcall 0x6703, 0x6d4e  ; sub_s7:6D4E
8:67F5  c45e06               les bx, ptr [bp + 6]
8:67F8  26894704             mov word ptr es:[bx + 4], ax
8:67FC  26895706             mov word ptr es:[bx + 6], dx
8:6800  668b46fc             mov eax, dword ptr [bp - 4]
8:6804  050c00               add ax, 0xc
8:6807  6650                 push eax
8:6809  668b4606             mov eax, dword ptr [bp + 6]
8:680D  051a00               add ax, 0x1a
8:6810  6650                 push eax
8:6812  9a623f7f66           lcall 0x667f, 0x3f62  ; sub_s2:3F62
8:6817  c45e06               les bx, ptr [bp + 6]
8:681A  6626ff7704           push dword ptr es:[bx + 4]
8:681F  9aba8f3267           lcall 0x6732, 0x8fba  ; sub_s3:8FBA
8:6824  c45e06               les bx, ptr [bp + 6]
8:6827  26894720             mov word ptr es:[bx + 0x20], ax
8:682B  26895722             mov word ptr es:[bx + 0x22], dx
8:682F  8bc3                 mov ax, bx
8:6831  8cc2                 mov dx, es
8:6833  5e                   pop si
8:6834  c9                   leave
8:6835  ca1000               retf 0x10

; ---------------- sub_s8:6838 FAR size=218 callers=2
8:6838  c80c0000             enter 0xc, 0
8:683C  56                   push si
8:683D  c45e06               les bx, ptr [bp + 6]
8:6840  26c7079a38           mov word ptr es:[bx], 0x389a
8:6845  26c747028a68         mov word ptr es:[bx + 2], 0x688a  ; SEGMENT s2:0000
8:684B  c45e06               les bx, ptr [bp + 6]
8:684E  6626c7470400000000   mov dword ptr es:[bx + 4], 0
8:6857  668b4612             mov eax, dword ptr [bp + 0x12]
8:685B  6626894708           mov dword ptr es:[bx + 8], eax
8:6860  26c7470c0000         mov word ptr es:[bx + 0xc], 0
8:6866  662bc9               sub ecx, ecx
8:6869  6626894f0e           mov dword ptr es:[bx + 0xe], ecx
8:686E  26894f12             mov word ptr es:[bx + 0x12], cx
8:6872  8b4e0e               mov cx, word ptr [bp + 0xe]
8:6875  26894f14             mov word ptr es:[bx + 0x14], cx
8:6879  668b4e0a             mov ecx, dword ptr [bp + 0xa]
8:687D  6626894f16           mov dword ptr es:[bx + 0x16], ecx
8:6882  8d4f1a               lea cx, [bx + 0x1a]
8:6885  06                   push es
8:6886  51                   push cx
8:6887  9a383eee68           lcall 0x68ee, 0x3e38  ; sub_s2:3E38
8:688C  c45e06               les bx, ptr [bp + 6]
8:688F  662bc0               sub eax, eax
8:6892  6626894720           mov dword ptr es:[bx + 0x20], eax
8:6897  26894724             mov word ptr es:[bx + 0x24], ax
8:689B  8b4610               mov ax, word ptr [bp + 0x10]
8:689E  26894726             mov word ptr es:[bx + 0x26], ax
8:68A2  26c747280000         mov word ptr es:[bx + 0x28], 0
8:68A8  26c707de78           mov word ptr es:[bx], 0x78de
8:68AD  26c74702d867         mov word ptr es:[bx + 2], 0x67d8  ; SEGMENT s8:0000
8:68B3  66ff7612             push dword ptr [bp + 0x12]
8:68B7  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:68BC  9aece1e667           lcall 0x67e6, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:68C1  8946fc               mov word ptr [bp - 4], ax
8:68C4  8956fe               mov word ptr [bp - 2], dx
8:68C7  52                   push dx
8:68C8  50                   push ax
8:68C9  9a4e6df367           lcall 0x67f3, 0x6d4e  ; sub_s7:6D4E
8:68CE  c45e06               les bx, ptr [bp + 6]
8:68D1  26894704             mov word ptr es:[bx + 4], ax
8:68D5  26895706             mov word ptr es:[bx + 6], dx
8:68D9  668b46fc             mov eax, dword ptr [bp - 4]
8:68DD  050c00               add ax, 0xc
8:68E0  6650                 push eax
8:68E2  668b4606             mov eax, dword ptr [bp + 6]
8:68E6  051a00               add ax, 0x1a
8:68E9  6650                 push eax
8:68EB  9a623f6d67           lcall 0x676d, 0x3f62  ; sub_s2:3F62
8:68F0  c45e06               les bx, ptr [bp + 6]
8:68F3  6626ff7704           push dword ptr es:[bx + 4]
8:68F8  9aba8f2268           lcall 0x6822, 0x8fba  ; sub_s3:8FBA
8:68FD  c45e06               les bx, ptr [bp + 6]
8:6900  26894720             mov word ptr es:[bx + 0x20], ax
8:6904  26895722             mov word ptr es:[bx + 0x22], dx
8:6908  8bc3                 mov ax, bx
8:690A  8cc2                 mov dx, es
8:690C  5e                   pop si
8:690D  c9                   leave
8:690E  ca1000               retf 0x10
8:6911  db 00

; ---------------- sub_s8:6912 FAR size=114 callers=1
8:6912  c8100000             enter 0x10, 0
8:6916  56                   push si
8:6917  c45e06               les bx, ptr [bp + 6]
8:691A  26c707de78           mov word ptr es:[bx], 0x78de
8:691F  26c74702b168         mov word ptr es:[bx + 2], 0x68b1  ; SEGMENT s8:0000
8:6925  66268b4704           mov eax, dword ptr es:[bx + 4]
8:692A  268b5706             mov dx, word ptr es:[bx + 6]
8:692E  668946f8             mov dword ptr [bp - 8], eax
8:6932  8bda                 mov bx, dx
8:6934  0bd0                 or dx, ax
8:6936  740e                 je 0x6946
8:6938  6a01                 push 1
8:693A  53                   push bx
8:693B  50                   push ax
8:693C  8ec3                 mov es, bx
8:693E  8bf0                 mov si, ax
8:6940  26c41c               les bx, ptr es:[si]
8:6943  26ff1f               lcall es:[bx]
loc_6946:
8:6946  c45e06               les bx, ptr [bp + 6]
8:6949  268b470e             mov ax, word ptr es:[bx + 0xe]
8:694D  268b5710             mov dx, word ptr es:[bx + 0x10]
8:6951  8bda                 mov bx, dx
8:6953  8946f8               mov word ptr [bp - 8], ax
8:6956  8956fa               mov word ptr [bp - 6], dx
8:6959  0bd8                 or bx, ax
8:695B  7413                 je 0x6970
8:695D  52                   push dx
8:695E  50                   push ax
8:695F  9a7eba4667           lcall 0x6746, 0xba7e  ; sub_s5:BA7E
8:6964  66ff76f8             push dword ptr [bp - 8]
8:6968  9ace17f764           lcall 0x64f7, 0x17ce  ; operator_delete@s1:17CE
8:696D  83c404               add sp, 4
loc_6970:
8:6970  c45e06               les bx, ptr [bp + 6]
8:6973  26c7079a38           mov word ptr es:[bx], 0x389a
8:6978  26c747024968         mov word ptr es:[bx + 2], 0x6849  ; SEGMENT s2:0000
8:697E  5e                   pop si
8:697F  c9                   leave
8:6980  ca0400               retf 4
8:6983  db 00

; ---------------- sub_s8:6984 FAR size=122 callers=1
8:6984  55                   push bp
8:6985  8bec                 mov bp, sp
8:6987  c45e06               les bx, ptr [bp + 6]
8:698A  26837f0c00           cmp word ptr es:[bx + 0xc], 0
8:698F  740f                 je 0x69a0
8:6991  26ff770c             push word ptr es:[bx + 0xc]
8:6995  9aaec3b069           lcall 0x69b0, 0xc3ae  ; sub_s5:C3AE
8:699A  8be5                 mov sp, bp
8:699C  c9                   leave
8:699D  ca0400               retf 4
loc_69A0:
8:69A0  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
8:69A6  740e                 je 0x69b6
8:69A8  6626ff770e           push dword ptr es:[bx + 0xe]
8:69AD  9a94bac469           lcall 0x69c4, 0xba94  ; sub_s5:BA94
8:69B2  c9                   leave
8:69B3  ca0400               retf 4
loc_69B6:
8:69B6  26837f1200           cmp word ptr es:[bx + 0x12], 0
8:69BB  7427                 je 0x69e4
8:69BD  26ff7712             push word ptr es:[bx + 0x12]
8:69C1  9ab4c3f269           lcall 0x69f2, 0xc3b4  ; sub_s5:C3B4
loc_69C6:
8:69C6  83c402               add sp, 2
8:69C9  52                   push dx
8:69CA  50                   push ax
8:69CB  c45e06               les bx, ptr [bp + 6]
8:69CE  66268b4716           mov eax, dword ptr es:[bx + 0x16]
8:69D3  6659                 pop ecx
8:69D5  66f7e1               mul ecx
8:69D8  668bd0               mov edx, eax
8:69DB  66c1ea10             shr edx, 0x10
8:69DF  c9                   leave
8:69E0  ca0400               retf 4
8:69E3  db 90
loc_69E4:
8:69E4  26837f1400           cmp word ptr es:[bx + 0x14], 0
8:69E9  740b                 je 0x69f6
8:69EB  26ff7714             push word ptr es:[bx + 0x14]
8:69EF  9a2ec46269           lcall 0x6962, 0xc42e  ; sub_s5:C42E
8:69F4  ebd0                 jmp 0x69c6
loc_69F6:
8:69F6  33c0                 xor ax, ax
8:69F8  99                   cdq
8:69F9  c9                   leave
8:69FA  ca0400               retf 4
8:69FD  db 00

; ---------------- sub_s8:69FE FAR size=16 callers=1
8:69FE  55                   push bp
8:69FF  8bec                 mov bp, sp
8:6A01  c45e06               les bx, ptr [bp + 6]
8:6A04  26c747280000         mov word ptr es:[bx + 0x28], 0
8:6A0A  c9                   leave
8:6A0B  ca0400               retf 4

; ---------------- sub_s8:6A0E FAR size=302 callers=1
8:6A0E  c81e0000             enter 0x1e, 0
8:6A12  c45e06               les bx, ptr [bp + 6]
8:6A15  26837f2800           cmp word ptr es:[bx + 0x28], 0
8:6A1A  0f851a01             jne 0x6b38
8:6A1E  6626ff7720           push dword ptr es:[bx + 0x20]
8:6A23  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:6A28  9aece1896a           lcall 0x6a89, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:6A2D  8946fc               mov word ptr [bp - 4], ax
8:6A30  8956fe               mov word ptr [bp - 2], dx
8:6A33  c45e06               les bx, ptr [bp + 6]
8:6A36  268347243c           add word ptr es:[bx + 0x24], 0x3c
8:6A3B  8d46f6               lea ax, [bp - 0xa]
8:6A3E  16                   push ss
8:6A3F  50                   push ax
8:6A40  9a383ec46a           lcall 0x6ac4, 0x3e38  ; sub_s2:3E38
loc_6A45:
8:6A45  66ff76fc             push dword ptr [bp - 4]
8:6A49  8d46f6               lea ax, [bp - 0xa]
8:6A4C  16                   push ss
8:6A4D  50                   push ax
8:6A4E  8d46f2               lea ax, [bp - 0xe]
8:6A51  16                   push ss
8:6A52  50                   push ax
8:6A53  66ff7606             push dword ptr [bp + 6]
8:6A57  90                   nop
8:6A58  0e                   push cs
8:6A59  e8c802               call 0x6d24  ; sub_s8:6D24
8:6A5C  0bc0                 or ax, ax
8:6A5E  0f85a600             jne 0x6b08
8:6A62  c45e06               les bx, ptr [bp + 6]
8:6A65  6626ff7704           push dword ptr es:[bx + 4]
8:6A6A  9aba8ffb68           lcall 0x68fb, 0x8fba  ; sub_s3:8FBA
8:6A6F  8946ec               mov word ptr [bp - 0x14], ax
8:6A72  8956ee               mov word ptr [bp - 0x12], dx
8:6A75  0bd0                 or dx, ax
8:6A77  7527                 jne 0x6aa0
8:6A79  c45e06               les bx, ptr [bp + 6]
8:6A7C  6626ff7720           push dword ptr es:[bx + 0x20]
8:6A81  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:6A86  9aece1006b           lcall 0x6b00, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:6A8B  8946e2               mov word ptr [bp - 0x1e], ax
8:6A8E  8956e4               mov word ptr [bp - 0x1c], dx
8:6A91  52                   push dx
8:6A92  50                   push ax
8:6A93  66ff7606             push dword ptr [bp + 6]
8:6A97  90                   nop
8:6A98  0e                   push cs
8:6A99  e8ba08               call 0x7356  ; sub_s8:7356
8:6A9C  c9                   leave
8:6A9D  ca0400               retf 4
loc_6AA0:
8:6AA0  66ff76fc             push dword ptr [bp - 4]
8:6AA4  9aa873cc68           lcall 0x68cc, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:6AA9  8946e8               mov word ptr [bp - 0x18], ax
8:6AAC  8956ea               mov word ptr [bp - 0x16], dx
8:6AAF  c45ee8               les bx, ptr [bp - 0x18]
8:6AB2  268b470c             mov ax, word ptr es:[bx + 0xc]
8:6AB6  8946e6               mov word ptr [bp - 0x1a], ax
8:6AB9  6a40                 push 0x40
8:6ABB  50                   push ax
8:6ABC  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:6AC1  9aaec6336b           lcall 0x6b33, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:6AC6  0bc0                 or ax, ax
8:6AC8  741a                 je 0x6ae4
8:6ACA  c45e06               les bx, ptr [bp + 6]
8:6ACD  26c747280100         mov word ptr es:[bx + 0x28], 1
8:6AD3  668b46ec             mov eax, dword ptr [bp - 0x14]
8:6AD7  8b56ee               mov dx, word ptr [bp - 0x12]
8:6ADA  6626894720           mov dword ptr es:[bx + 0x20], eax
8:6ADF  c9                   leave
8:6AE0  ca0400               retf 4
8:6AE3  db 90
loc_6AE4:
8:6AE4  668b46ec             mov eax, dword ptr [bp - 0x14]
8:6AE8  8b56ee               mov dx, word ptr [bp - 0x12]
8:6AEB  c45e06               les bx, ptr [bp + 6]
8:6AEE  6626894720           mov dword ptr es:[bx + 0x20], eax
8:6AF3  52                   push dx
8:6AF4  26ff7720             push word ptr es:[bx + 0x20]
8:6AF8  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:6AFD  9aece1bf68           lcall 0x68bf, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:6B02  8946fc               mov word ptr [bp - 4], ax
8:6B05  8956fe               mov word ptr [bp - 2], dx
loc_6B08:
8:6B08  8d46f2               lea ax, [bp - 0xe]
8:6B0B  16                   push ss
8:6B0C  50                   push ax
8:6B0D  66ff7606             push dword ptr [bp + 6]
8:6B11  90                   nop
8:6B12  0e                   push cs
8:6B13  e80403               call 0x6e1a  ; sub_s8:6E1A
8:6B16  8946f0               mov word ptr [bp - 0x10], ax
8:6B19  c45e06               les bx, ptr [bp + 6]
8:6B1C  26394724             cmp word ptr es:[bx + 0x24], ax
8:6B20  7c16                 jl 0x6b38
8:6B22  26294724             sub word ptr es:[bx + 0x24], ax
8:6B26  8d46f6               lea ax, [bp - 0xa]
8:6B29  16                   push ss
8:6B2A  50                   push ax
8:6B2B  8d471a               lea ax, [bx + 0x1a]
8:6B2E  06                   push es
8:6B2F  50                   push ax
8:6B30  9a623f7c69           lcall 0x697c, 0x3f62  ; sub_s2:3F62
8:6B35  e90dff               jmp 0x6a45
loc_6B38:
8:6B38  c9                   leave
8:6B39  ca0400               retf 4

; ---------------- sub_s8:6B3C FAR size=76 callers=1
8:6B3C  55                   push bp
8:6B3D  8bec                 mov bp, sp
8:6B3F  c45e06               les bx, ptr [bp + 6]
8:6B42  26837f0c00           cmp word ptr es:[bx + 0xc], 0
8:6B47  7527                 jne 0x6b70
8:6B49  26837f1200           cmp word ptr es:[bx + 0x12], 0
8:6B4E  7520                 jne 0x6b70
8:6B50  26837f1400           cmp word ptr es:[bx + 0x14], 0
8:6B55  7519                 jne 0x6b70
8:6B57  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
8:6B5D  7511                 jne 0x6b70
8:6B5F  6626837f1600         cmp dword ptr es:[bx + 0x16], 0
8:6B65  7409                 je 0x6b70
8:6B67  6626c7471600000000   mov dword ptr es:[bx + 0x16], 0
loc_6B70:
8:6B70  c45e06               les bx, ptr [bp + 6]
8:6B73  6626837f1600         cmp dword ptr es:[bx + 0x16], 0
8:6B79  7507                 jne 0x6b82
8:6B7B  b80100               mov ax, 1
8:6B7E  c9                   leave
8:6B7F  ca0400               retf 4
loc_6B82:
8:6B82  33c0                 xor ax, ax
8:6B84  c9                   leave
8:6B85  ca0400               retf 4

; ---------------- sub_s8:6B88 FAR size=76 callers=3
8:6B88  c8100000             enter 0x10, 0
8:6B8C  6a2f                 push 0x2f
8:6B8E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:6B93  9aba206d6a           lcall 0x6a6d, 0x20ba  ; sub_s3:20BA
8:6B98  8946fc               mov word ptr [bp - 4], ax
8:6B9B  8956fe               mov word ptr [bp - 2], dx
8:6B9E  c45efc               les bx, ptr [bp - 4]
8:6BA1  66268b4720           mov eax, dword ptr es:[bx + 0x20]
8:6BA6  668946f8             mov dword ptr [bp - 8], eax
8:6BAA  8d46f0               lea ax, [bp - 0x10]
8:6BAD  16                   push ss
8:6BAE  50                   push ax
8:6BAF  66ff76f8             push dword ptr [bp - 8]
8:6BB3  66ff760a             push dword ptr [bp + 0xa]
8:6BB7  66ff364057           push dword ptr [0x5740]
8:6BBC  9ace64a76a           lcall 0x6aa7, 0x64ce  ; sub_s7:64CE
8:6BC1  8bd8                 mov bx, ax
8:6BC3  8ec2                 mov es, dx
8:6BC5  66268b07             mov eax, dword ptr es:[bx]
8:6BC9  c45e0e               les bx, ptr [bp + 0xe]
8:6BCC  66268907             mov dword ptr es:[bx], eax
8:6BD0  c9                   leave
8:6BD1  ca0c00               retf 0xc

; ---------------- sub_s8:6BD4 FAR size=72 callers=1
8:6BD4  c80c0000             enter 0xc, 0
8:6BD8  668b4606             mov eax, dword ptr [bp + 6]
8:6BDC  051a00               add ax, 0x1a
8:6BDF  6650                 push eax
8:6BE1  66ff760a             push dword ptr [bp + 0xa]
8:6BE5  9a623f436a           lcall 0x6a43, 0x3f62  ; sub_s2:3F62
8:6BEA  c45e0a               les bx, ptr [bp + 0xa]
8:6BED  268b07               mov ax, word ptr es:[bx]
8:6BF0  8946fe               mov word ptr [bp - 2], ax
8:6BF3  837e1200             cmp word ptr [bp + 0x12], 0
8:6BF7  7d05                 jge 0x6bfe
8:6BF9  ff4efe               dec word ptr [bp - 2]
8:6BFC  eb03                 jmp 0x6c01
loc_6BFE:
8:6BFE  ff46fe               inc word ptr [bp - 2]
loc_6C01:
8:6C01  8b46fe               mov ax, word ptr [bp - 2]
8:6C04  268907               mov word ptr es:[bx], ax
8:6C07  66ff760e             push dword ptr [bp + 0xe]
8:6C0B  66ff760a             push dword ptr [bp + 0xa]
8:6C0F  66ff7606             push dword ptr [bp + 6]
8:6C13  90                   nop
8:6C14  0e                   push cs
8:6C15  e870ff               call 0x6b88  ; sub_s8:6B88
8:6C18  c9                   leave
8:6C19  ca0e00               retf 0xe

; ---------------- sub_s8:6C1C FAR size=76 callers=1
8:6C1C  c80c0000             enter 0xc, 0
8:6C20  668b4606             mov eax, dword ptr [bp + 6]
8:6C24  051a00               add ax, 0x1a
8:6C27  6650                 push eax
8:6C29  66ff760a             push dword ptr [bp + 0xa]
8:6C2D  9a623fe86b           lcall 0x6be8, 0x3f62  ; sub_s2:3F62
8:6C32  c45e0a               les bx, ptr [bp + 0xa]
8:6C35  268b4702             mov ax, word ptr es:[bx + 2]
8:6C39  8946fe               mov word ptr [bp - 2], ax
8:6C3C  837e1200             cmp word ptr [bp + 0x12], 0
8:6C40  7d06                 jge 0x6c48
8:6C42  ff4efe               dec word ptr [bp - 2]
8:6C45  eb04                 jmp 0x6c4b
8:6C47  db 90
loc_6C48:
8:6C48  ff46fe               inc word ptr [bp - 2]
loc_6C4B:
8:6C4B  8b46fe               mov ax, word ptr [bp - 2]
8:6C4E  26894702             mov word ptr es:[bx + 2], ax
8:6C52  66ff760e             push dword ptr [bp + 0xe]
8:6C56  66ff760a             push dword ptr [bp + 0xa]
8:6C5A  66ff7606             push dword ptr [bp + 6]
8:6C5E  90                   nop
8:6C5F  0e                   push cs
8:6C60  e825ff               call 0x6b88  ; sub_s8:6B88
8:6C63  c9                   leave
8:6C64  ca0e00               retf 0xe
8:6C67  db 00

; ---------------- sub_s8:6C68 FAR size=188 callers=1
8:6C68  c8260000             enter 0x26, 0
8:6C6C  c746fe0000           mov word ptr [bp - 2], 0
8:6C71  668b4606             mov eax, dword ptr [bp + 6]
8:6C75  051a00               add ax, 0x1a
8:6C78  6650                 push eax
8:6C7A  66ff760a             push dword ptr [bp + 0xa]
8:6C7E  9a623f306c           lcall 0x6c30, 0x3f62  ; sub_s2:3F62
8:6C83  6a2f                 push 0x2f
8:6C85  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:6C8A  9aba20966b           lcall 0x6b96, 0x20ba  ; sub_s3:20BA
8:6C8F  8946fa               mov word ptr [bp - 6], ax
8:6C92  8956fc               mov word ptr [bp - 4], dx
8:6C95  c45efa               les bx, ptr [bp - 6]
8:6C98  66268b4720           mov eax, dword ptr es:[bx + 0x20]
8:6C9D  6650                 push eax
8:6C9F  668b4606             mov eax, dword ptr [bp + 6]
8:6CA3  051a00               add ax, 0x1a
8:6CA6  6650                 push eax
8:6CA8  66ff364057           push dword ptr [0x5740]
8:6CAD  9a7e62cc6c           lcall 0x6ccc, 0x627e  ; sub_s7:627E
8:6CB2  8956f4               mov word ptr [bp - 0xc], dx
8:6CB5  0bd0                 or dx, ax
8:6CB7  7464                 je 0x6d1d
8:6CB9  ff76f4               push word ptr [bp - 0xc]
8:6CBC  50                   push ax
8:6CBD  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:6CC2  9aece12b6a           lcall 0x6a2b, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:6CC7  52                   push dx
8:6CC8  50                   push ax
8:6CC9  9aa873bf6b           lcall 0x6bbf, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:6CCE  8946ea               mov word ptr [bp - 0x16], ax
8:6CD1  8956ec               mov word ptr [bp - 0x14], dx
8:6CD4  c45eea               les bx, ptr [bp - 0x16]
8:6CD7  268b470c             mov ax, word ptr es:[bx + 0xc]
8:6CDB  3d4700               cmp ax, 0x47
8:6CDE  7405                 je 0x6ce5
8:6CE0  3d6a00               cmp ax, 0x6a
8:6CE3  7538                 jne 0x6d1d
loc_6CE5:
8:6CE5  c45e06               les bx, ptr [bp + 6]
8:6CE8  268b471e             mov ax, word ptr es:[bx + 0x1e]
8:6CEC  8946e4               mov word ptr [bp - 0x1c], ax
8:6CEF  837e1200             cmp word ptr [bp + 0x12], 0
8:6CF3  7d05                 jge 0x6cfa
8:6CF5  ff4ee4               dec word ptr [bp - 0x1c]
8:6CF8  eb03                 jmp 0x6cfd
loc_6CFA:
8:6CFA  ff46e4               inc word ptr [bp - 0x1c]
loc_6CFD:
8:6CFD  8b46e4               mov ax, word ptr [bp - 0x1c]
8:6D00  c45e0a               les bx, ptr [bp + 0xa]
8:6D03  26894704             mov word ptr es:[bx + 4], ax
8:6D07  66ff760e             push dword ptr [bp + 0xe]
8:6D0B  66ff760a             push dword ptr [bp + 0xa]
8:6D0F  66ff7606             push dword ptr [bp + 6]
8:6D13  90                   nop
8:6D14  0e                   push cs
8:6D15  e870fe               call 0x6b88  ; sub_s8:6B88
8:6D18  c746fe0100           mov word ptr [bp - 2], 1
loc_6D1D:
8:6D1D  8b46fe               mov ax, word ptr [bp - 2]
8:6D20  c9                   leave
8:6D21  ca0e00               retf 0xe

; ---------------- sub_s8:6D24 FAR size=246 callers=1
8:6D24  c8220000             enter 0x22, 0
8:6D28  57                   push di
8:6D29  56                   push si
8:6D2A  c45e0a               les bx, ptr [bp + 0xa]
8:6D2D  6626c70700000000     mov dword ptr es:[bx], 0
8:6D35  8b4612               mov ax, word ptr [bp + 0x12]
8:6D38  8b5614               mov dx, word ptr [bp + 0x14]
8:6D3B  050c00               add ax, 0xc
8:6D3E  1e                   push ds
8:6D3F  8d7efa               lea di, [bp - 6]
8:6D42  8bf0                 mov si, ax
8:6D44  16                   push ss
8:6D45  07                   pop es
8:6D46  8eda                 mov ds, dx
8:6D48  66a5                 movsd dword ptr es:[di], dword ptr [si]
8:6D4A  a5                   movsw word ptr es:[di], word ptr [si]
8:6D4B  1f                   pop ds
8:6D4C  8d46fa               lea ax, [bp - 6]
8:6D4F  8946e6               mov word ptr [bp - 0x1a], ax
8:6D52  8d46f8               lea ax, [bp - 8]
8:6D55  16                   push ss
8:6D56  50                   push ax
8:6D57  8d4ef6               lea cx, [bp - 0xa]
8:6D5A  16                   push ss
8:6D5B  51                   push cx
8:6D5C  8d56f4               lea dx, [bp - 0xc]
8:6D5F  16                   push ss
8:6D60  52                   push dx
8:6D61  8d5efa               lea bx, [bp - 6]
8:6D64  16                   push ss
8:6D65  53                   push bx
8:6D66  9ab43e886d           lcall 0x6d88, 0x3eb4  ; sub_s2:3EB4
8:6D6B  8d46f2               lea ax, [bp - 0xe]
8:6D6E  16                   push ss
8:6D6F  50                   push ax
8:6D70  8d4ef0               lea cx, [bp - 0x10]
8:6D73  16                   push ss
8:6D74  51                   push cx
8:6D75  8d56ee               lea dx, [bp - 0x12]
8:6D78  16                   push ss
8:6D79  52                   push dx
8:6D7A  8b5e06               mov bx, word ptr [bp + 6]
8:6D7D  8b7608               mov si, word ptr [bp + 8]
8:6D80  83c31a               add bx, 0x1a
8:6D83  56                   push si
8:6D84  53                   push bx
8:6D85  9ab43e816c           lcall 0x6c81, 0x3eb4  ; sub_s2:3EB4
8:6D8A  8b46f6               mov ax, word ptr [bp - 0xa]
8:6D8D  2b46f0               sub ax, word ptr [bp - 0x10]
8:6D90  8946ea               mov word ptr [bp - 0x16], ax
8:6D93  8b4ef4               mov cx, word ptr [bp - 0xc]
8:6D96  2b4eee               sub cx, word ptr [bp - 0x12]
8:6D99  894ee8               mov word ptr [bp - 0x18], cx
8:6D9C  8b56f8               mov dx, word ptr [bp - 8]
8:6D9F  2b56f2               sub dx, word ptr [bp - 0xe]
8:6DA2  8956ec               mov word ptr [bp - 0x14], dx
8:6DA5  0bd2                 or dx, dx
8:6DA7  7508                 jne 0x6db1
8:6DA9  0bc0                 or ax, ax
8:6DAB  7504                 jne 0x6db1
8:6DAD  0bc9                 or cx, cx
8:6DAF  7462                 je 0x6e13
loc_6DB1:
8:6DB1  0bc0                 or ax, ax
8:6DB3  7504                 jne 0x6db9
8:6DB5  3bd0                 cmp dx, ax
8:6DB7  7545                 jne 0x6dfe
loc_6DB9:
8:6DB9  0bd2                 or dx, dx
8:6DBB  7519                 jne 0x6dd6
8:6DBD  3bc2                 cmp ax, dx
8:6DBF  7415                 je 0x6dd6
8:6DC1  50                   push ax
8:6DC2  66ff760a             push dword ptr [bp + 0xa]
8:6DC6  66ff760e             push dword ptr [bp + 0xe]
8:6DCA  66ff7606             push dword ptr [bp + 6]
8:6DCE  90                   nop
8:6DCF  0e                   push cs
8:6DD0  e849fe               call 0x6c1c  ; sub_s8:6C1C
8:6DD3  eb3b                 jmp 0x6e10
8:6DD5  db 90
loc_6DD6:
8:6DD6  0bd2                 or dx, dx
8:6DD8  7524                 jne 0x6dfe
8:6DDA  3bc2                 cmp ax, dx
8:6DDC  7520                 jne 0x6dfe
8:6DDE  3bca                 cmp cx, dx
8:6DE0  741c                 je 0x6dfe
8:6DE2  51                   push cx
8:6DE3  66ff760a             push dword ptr [bp + 0xa]
8:6DE7  66ff760e             push dword ptr [bp + 0xe]
8:6DEB  66ff7606             push dword ptr [bp + 6]
8:6DEF  90                   nop
8:6DF0  0e                   push cs
8:6DF1  e874fe               call 0x6c68  ; sub_s8:6C68
8:6DF4  0bc0                 or ax, ax
8:6DF6  7518                 jne 0x6e10
8:6DF8  5e                   pop si
8:6DF9  5f                   pop di
8:6DFA  c9                   leave
8:6DFB  ca1000               retf 0x10
loc_6DFE:
8:6DFE  52                   push dx
8:6DFF  66ff760a             push dword ptr [bp + 0xa]
8:6E03  66ff760e             push dword ptr [bp + 0xe]
8:6E07  66ff7606             push dword ptr [bp + 6]
8:6E0B  90                   nop
8:6E0C  0e                   push cs
8:6E0D  e8c4fd               call 0x6bd4  ; sub_s8:6BD4
loc_6E10:
8:6E10  b80100               mov ax, 1
loc_6E13:
8:6E13  5e                   pop si
8:6E14  5f                   pop di
8:6E15  c9                   leave
8:6E16  ca1000               retf 0x10
8:6E19  db 00

; ---------------- sub_s8:6E1A FAR size=320 callers=1
8:6E1A  c8160000             enter 0x16, 0
8:6E1E  c746fe0000           mov word ptr [bp - 2], 0
8:6E23  c45e0a               les bx, ptr [bp + 0xa]
8:6E26  6626833f00           cmp dword ptr es:[bx], 0
8:6E2B  750d                 jne 0x6e3a
8:6E2D  26833f00             cmp word ptr es:[bx], 0
8:6E31  7507                 jne 0x6e3a
8:6E33  b80100               mov ax, 1
8:6E36  e91c01               jmp 0x6f55
8:6E39  db 90
loc_6E3A:
8:6E3A  268b07               mov ax, word ptr es:[bx]
8:6E3D  268b5702             mov dx, word ptr es:[bx + 2]
8:6E41  8956ec               mov word ptr [bp - 0x14], dx
8:6E44  8a46ed               mov al, byte ptr [bp - 0x13]
8:6E47  2ae4                 sub ah, ah
8:6E49  a8ff                 test al, 0xff
8:6E4B  7509                 jne 0x6e56
8:6E4D  268b07               mov ax, word ptr es:[bx]
8:6E50  8946fe               mov word ptr [bp - 2], ax
8:6E53  eb26                 jmp 0x6e7b
8:6E55  db 90
loc_6E56:
8:6E56  6626ff37             push dword ptr es:[bx]
8:6E5A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:6E5F  9aece1c56c           lcall 0x6cc5, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:6E64  52                   push dx
8:6E65  50                   push ax
8:6E66  9aa06fb06c           lcall 0x6cb0, 0x6fa0  ; sub_s7:6FA0
8:6E6B  8946ee               mov word ptr [bp - 0x12], ax
8:6E6E  3d0900               cmp ax, 9
8:6E71  7f4f                 jg 0x6ec2
8:6E73  eb2d                 jmp 0x6ea2
8:6E75  db 90
loc_6E76:
8:6E76  c746fe0500           mov word ptr [bp - 2], 5
loc_6E7B:
8:6E7B  8b46fe               mov ax, word ptr [bp - 2]
8:6E7E  e9ad00               jmp 0x6f2e
8:6E81  db 90
loc_6E82:
8:6E82  c746fe0100           mov word ptr [bp - 2], 1
8:6E87  ebf2                 jmp 0x6e7b
8:6E89  db 90
loc_6E8A:
8:6E8A  c746fe0200           mov word ptr [bp - 2], 2
8:6E8F  ebea                 jmp 0x6e7b
8:6E91  db 90
loc_6E92:
8:6E92  c746fe0300           mov word ptr [bp - 2], 3
8:6E97  ebe2                 jmp 0x6e7b
8:6E99  db 90
loc_6E9A:
8:6E9A  c746fe0400           mov word ptr [bp - 2], 4
8:6E9F  ebda                 jmp 0x6e7b
8:6EA1  db 90
loc_6EA2:
8:6EA2  48                   dec ax
8:6EA3  3d0800               cmp ax, 8
8:6EA6  77d3                 ja 0x6e7b
8:6EA8  03c0                 add ax, ax
8:6EAA  93                   xchg bx, ax
8:6EAB  2effa7b06e           jmp word ptr cs:[bx + 0x6eb0]
switch_table_6EB0:
    dw loc_6E82
    dw loc_6E8A
    dw loc_6E92
    dw loc_6E9A
    dw loc_6E76
    dw loc_6E8A
    dw loc_6E92
    dw loc_6E9A
    dw loc_6E76
loc_6EC2:
8:6EC2  6a41                 push 0x41
8:6EC4  50                   push ax
8:6EC5  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:6ECA  9aaec6e76e           lcall 0x6ee7, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:6ECF  0bc0                 or ax, ax
8:6ED1  7407                 je 0x6eda
8:6ED3  c746fe0a00           mov word ptr [bp - 2], 0xa
8:6ED8  eba1                 jmp 0x6e7b
loc_6EDA:
8:6EDA  6a42                 push 0x42
8:6EDC  ff76ee               push word ptr [bp - 0x12]
8:6EDF  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:6EE4  9aaec6696d           lcall 0x6d69, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:6EE9  0bc0                 or ax, ax
8:6EEB  7506                 jne 0x6ef3
8:6EED  837eee3f             cmp word ptr [bp - 0x12], 0x3f
8:6EF1  7583                 jne 0x6e76
loc_6EF3:
8:6EF3  c746fe0b00           mov word ptr [bp - 2], 0xb
8:6EF8  eb81                 jmp 0x6e7b
loc_6EFA:
8:6EFA  b80a00               mov ax, 0xa
8:6EFD  eb56                 jmp 0x6f55
8:6EFF  db 90
loc_6F00:
8:6F00  b80c00               mov ax, 0xc
8:6F03  eb50                 jmp 0x6f55
8:6F05  db 90
loc_6F06:
8:6F06  b80f00               mov ax, 0xf
8:6F09  c9                   leave
8:6F0A  ca0800               retf 8
8:6F0D  db 90
loc_6F0E:
8:6F0E  b81400               mov ax, 0x14
8:6F11  c9                   leave
8:6F12  ca0800               retf 8
8:6F15  db 90
loc_6F16:
8:6F16  b83c00               mov ax, 0x3c
8:6F19  c9                   leave
8:6F1A  ca0800               retf 8
8:6F1D  db 90
loc_6F1E:
8:6F1E  b87800               mov ax, 0x78
8:6F21  c9                   leave
8:6F22  ca0800               retf 8
8:6F25  db 90
loc_6F26:
8:6F26  b8f000               mov ax, 0xf0
8:6F29  c9                   leave
8:6F2A  ca0800               retf 8
8:6F2D  db 90
loc_6F2E:
8:6F2E  48                   dec ax
8:6F2F  3d0a00               cmp ax, 0xa
8:6F32  771e                 ja 0x6f52
8:6F34  03c0                 add ax, ax
8:6F36  93                   xchg bx, ax
8:6F37  2effa73c6f           jmp word ptr cs:[bx + 0x6f3c]
switch_table_6F3C:
    dw loc_6F0E
    dw loc_6F16
    dw loc_6F1E
    dw loc_6F26
    dw loc_6F06
    dw loc_6F06
    dw loc_6F16
    dw loc_6F1E
    dw loc_6F26
    dw loc_6F00
    dw loc_6EFA
loc_6F52:
8:6F52  b8ffff               mov ax, 0xffff
loc_6F55:
8:6F55  c9                   leave
8:6F56  ca0800               retf 8
8:6F59  db 00

; ---------------- sub_s8:6F5A FAR size=322 callers=1
8:6F5A  c81e0000             enter 0x1e, 0
8:6F5E  c45e06               les bx, ptr [bp + 6]
8:6F61  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
8:6F67  7453                 je 0x6fbc
8:6F69  26c45f0e             les bx, ptr es:[bx + 0xe]
8:6F6D  268b4704             mov ax, word ptr es:[bx + 4]
8:6F71  8946fe               mov word ptr [bp - 2], ax
8:6F74  c746f60000           mov word ptr [bp - 0xa], 0
8:6F79  eb04                 jmp 0x6f7f
8:6F7B  db 90
loc_6F7C:
8:6F7C  ff46f6               inc word ptr [bp - 0xa]
loc_6F7F:
8:6F7F  8b46fe               mov ax, word ptr [bp - 2]
8:6F82  3946f6               cmp word ptr [bp - 0xa], ax
8:6F85  0f830e01             jae 0x7097
8:6F89  ff76f6               push word ptr [bp - 0xa]
8:6F8C  8d46fc               lea ax, [bp - 4]
8:6F8F  16                   push ss
8:6F90  50                   push ax
8:6F91  8d4ef8               lea cx, [bp - 8]
8:6F94  16                   push ss
8:6F95  51                   push cx
8:6F96  c45e06               les bx, ptr [bp + 6]
8:6F99  6626ff770e           push dword ptr es:[bx + 0xe]
8:6F9E  9a16bb7c70           lcall 0x707c, 0xbb16  ; sub_s5:BB16
8:6FA3  66837ef800           cmp dword ptr [bp - 8], 0
8:6FA8  74d2                 je 0x6f7c
8:6FAA  66ff76fa             push dword ptr [bp - 6]
8:6FAE  ff76f8               push word ptr [bp - 8]
8:6FB1  66ff760a             push dword ptr [bp + 0xa]
8:6FB5  9adc7dd36f           lcall 0x6fd3, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
8:6FBA  ebc0                 jmp 0x6f7c
loc_6FBC:
8:6FBC  26837f0c00           cmp word ptr es:[bx + 0xc], 0
8:6FC1  7417                 je 0x6fda
8:6FC3  26ff770c             push word ptr es:[bx + 0xc]
8:6FC7  6626ff7716           push dword ptr es:[bx + 0x16]
8:6FCC  66ff760a             push dword ptr [bp + 0xa]
8:6FD0  9adc7df16f           lcall 0x6ff1, 0x7ddc  ; Tile::addBas(value,res)@s7:7DDC
8:6FD5  c9                   leave
8:6FD6  ca0800               retf 8
8:6FD9  db 90
loc_6FDA:
8:6FDA  26837f1200           cmp word ptr es:[bx + 0x12], 0
8:6FDF  7417                 je 0x6ff8
8:6FE1  26ff7712             push word ptr es:[bx + 0x12]
8:6FE5  6626ff7716           push dword ptr es:[bx + 0x16]
8:6FEA  66ff760a             push dword ptr [bp + 0xa]
8:6FEE  9a507c9570           lcall 0x7095, 0x7c50  ; sub_s7:7C50
8:6FF3  c9                   leave
8:6FF4  ca0800               retf 8
8:6FF7  db 90
loc_6FF8:
8:6FF8  66a1a268             mov eax, dword ptr [0x68a2]
8:6FFC  668946ea             mov dword ptr [bp - 0x16], eax
8:7000  6650                 push eax
8:7002  9afc076b69           lcall 0x696b, 0x7fc  ; sub_s1:07FC
8:7007  8946ee               mov word ptr [bp - 0x12], ax
8:700A  8956f0               mov word ptr [bp - 0x10], dx
8:700D  0bd0                 or dx, ax
8:700F  743d                 je 0x704e
8:7011  c45eee               les bx, ptr [bp - 0x12]
8:7014  26c7079a38           mov word ptr es:[bx], 0x389a
8:7019  26c74702cd6e         mov word ptr es:[bx + 2], 0x6ecd  ; SEGMENT s2:0000
8:701F  33c0                 xor ax, ax
8:7021  c45eee               les bx, ptr [bp - 0x12]
8:7024  26894704             mov word ptr es:[bx + 4], ax
8:7028  26894706             mov word ptr es:[bx + 6], ax
8:702C  26894708             mov word ptr es:[bx + 8], ax
8:7030  2689470a             mov word ptr es:[bx + 0xa], ax
8:7034  2689470c             mov word ptr es:[bx + 0xc], ax
8:7038  26c707ce56           mov word ptr es:[bx], 0x56ce
8:703D  26c747025a1f         mov word ptr es:[bx + 2], 0x1f5a  ; SEGMENT s4:0000
8:7043  668b46ee             mov eax, dword ptr [bp - 0x12]
8:7047  668946f2             mov dword ptr [bp - 0xe], eax
8:704B  eb09                 jmp 0x7056
8:704D  db 90
loc_704E:
8:704E  66c746f200000000     mov dword ptr [bp - 0xe], 0
loc_7056:
8:7056  c45e06               les bx, ptr [bp + 6]
8:7059  268b4714             mov ax, word ptr es:[bx + 0x14]
8:705D  c45ef2               les bx, ptr [bp - 0xe]
8:7060  26894708             mov word ptr es:[bx + 8], ax
8:7064  c45e06               les bx, ptr [bp + 6]
8:7067  268b4716             mov ax, word ptr es:[bx + 0x16]
8:706B  c45ef2               les bx, ptr [bp - 0xe]
8:706E  2689470a             mov word ptr es:[bx + 0xa], ax
8:7072  c45e06               les bx, ptr [bp + 6]
8:7075  26ff7714             push word ptr es:[bx + 0x14]
8:7079  9a2ec49869           lcall 0x6998, 0xc42e  ; sub_s5:C42E
8:707E  83c402               add sp, 2
8:7081  c45ef2               les bx, ptr [bp - 0xe]
8:7084  26f7670a             mul word ptr es:[bx + 0xa]
8:7088  2689470c             mov word ptr es:[bx + 0xc], ax
8:708C  06                   push es
8:708D  53                   push bx
8:708E  66ff760a             push dword ptr [bp + 0xa]
8:7092  9a2c6a696e           lcall 0x6e69, 0x6a2c  ; sub_s7:6A2C
loc_7097:
8:7097  c9                   leave
8:7098  ca0800               retf 8
8:709B  db 00

; ---------------- sub_s8:709C FAR size=698 callers=1
8:709C  c8260000             enter 0x26, 0
8:70A0  c45e06               les bx, ptr [bp + 6]
8:70A3  268b4710             mov ax, word ptr es:[bx + 0x10]
8:70A7  260b470e             or ax, word ptr es:[bx + 0xe]
8:70AB  0f84d300             je 0x7182
8:70AF  26c45f0e             les bx, ptr es:[bx + 0xe]
8:70B3  268b4704             mov ax, word ptr es:[bx + 4]
8:70B7  8946fe               mov word ptr [bp - 2], ax
8:70BA  c746f60000           mov word ptr [bp - 0xa], 0
8:70BF  eb3e                 jmp 0x70ff
8:70C1  db 90
loc_70C2:
8:70C2  66c746f200000000     mov dword ptr [bp - 0xe], 0
loc_70CA:
8:70CA  8b46fc               mov ax, word ptr [bp - 4]
8:70CD  c45ef2               les bx, ptr [bp - 0xe]
8:70D0  26894704             mov word ptr es:[bx + 4], ax
8:70D4  8b46f8               mov ax, word ptr [bp - 8]
8:70D7  2689470a             mov word ptr es:[bx + 0xa], ax
8:70DB  ff76fc               push word ptr [bp - 4]
8:70DE  9aaec32171           lcall 0x7121, 0xc3ae  ; sub_s5:C3AE
8:70E3  83c402               add sp, 2
8:70E6  c45ef2               les bx, ptr [bp - 0xe]
8:70E9  26f7670a             mul word ptr es:[bx + 0xa]
8:70ED  2689470c             mov word ptr es:[bx + 0xc], ax
8:70F1  06                   push es
8:70F2  53                   push bx
8:70F3  66ff760a             push dword ptr [bp + 0xa]
8:70F7  9a2c6a1f72           lcall 0x721f, 0x6a2c  ; sub_s7:6A2C
loc_70FC:
8:70FC  ff46f6               inc word ptr [bp - 0xa]
loc_70FF:
8:70FF  8b46fe               mov ax, word ptr [bp - 2]
8:7102  3946f6               cmp word ptr [bp - 0xa], ax
8:7105  0f834802             jae 0x7351
8:7109  ff76f6               push word ptr [bp - 0xa]
8:710C  8d46fc               lea ax, [bp - 4]
8:710F  16                   push ss
8:7110  50                   push ax
8:7111  8d46f8               lea ax, [bp - 8]
8:7114  16                   push ss
8:7115  50                   push ax
8:7116  c45e06               les bx, ptr [bp + 6]
8:7119  6626ff770e           push dword ptr es:[bx + 0xe]
8:711E  9a16bba472           lcall 0x72a4, 0xbb16  ; sub_s5:BB16
8:7123  66837ef800           cmp dword ptr [bp - 8], 0
8:7128  74d2                 je 0x70fc
8:712A  66a1a268             mov eax, dword ptr [0x68a2]
8:712E  668946e2             mov dword ptr [bp - 0x1e], eax
8:7132  6650                 push eax
8:7134  9afc079671           lcall 0x7196, 0x7fc  ; sub_s1:07FC
8:7139  8946ee               mov word ptr [bp - 0x12], ax
8:713C  8956f0               mov word ptr [bp - 0x10], dx
8:713F  0bd0                 or dx, ax
8:7141  0f847dff             je 0x70c2
8:7145  c45eee               les bx, ptr [bp - 0x12]
8:7148  26c7079a38           mov word ptr es:[bx], 0x389a
8:714D  26c74702ae71         mov word ptr es:[bx + 2], 0x71ae  ; SEGMENT s2:0000
8:7153  33c0                 xor ax, ax
8:7155  c45eee               les bx, ptr [bp - 0x12]
8:7158  26894704             mov word ptr es:[bx + 4], ax
8:715C  26894706             mov word ptr es:[bx + 6], ax
8:7160  26894708             mov word ptr es:[bx + 8], ax
8:7164  2689470a             mov word ptr es:[bx + 0xa], ax
8:7168  2689470c             mov word ptr es:[bx + 0xc], ax
8:716C  26c707ce56           mov word ptr es:[bx], 0x56ce
8:7171  26c74702d271         mov word ptr es:[bx + 2], 0x71d2  ; SEGMENT s4:0000
8:7177  668b46ee             mov eax, dword ptr [bp - 0x12]
8:717B  668946f2             mov dword ptr [bp - 0xe], eax
8:717F  e948ff               jmp 0x70ca
loc_7182:
8:7182  26837f0c00           cmp word ptr es:[bx + 0xc], 0
8:7187  747d                 je 0x7206
8:7189  66a1a268             mov eax, dword ptr [0x68a2]
8:718D  668946ea             mov dword ptr [bp - 0x16], eax
8:7191  6650                 push eax
8:7193  9afc072e72           lcall 0x722e, 0x7fc  ; sub_s1:07FC
8:7198  8946ee               mov word ptr [bp - 0x12], ax
8:719B  8956f0               mov word ptr [bp - 0x10], dx
8:719E  0bd0                 or dx, ax
8:71A0  743c                 je 0x71de
8:71A2  c45eee               les bx, ptr [bp - 0x12]
8:71A5  26c7079a38           mov word ptr es:[bx], 0x389a
8:71AA  26c747024672         mov word ptr es:[bx + 2], 0x7246  ; SEGMENT s2:0000
8:71B0  33c0                 xor ax, ax
8:71B2  c45eee               les bx, ptr [bp - 0x12]
8:71B5  26894704             mov word ptr es:[bx + 4], ax
8:71B9  26894706             mov word ptr es:[bx + 6], ax
8:71BD  26894708             mov word ptr es:[bx + 8], ax
8:71C1  2689470a             mov word ptr es:[bx + 0xa], ax
8:71C5  2689470c             mov word ptr es:[bx + 0xc], ax
8:71C9  26c707ce56           mov word ptr es:[bx], 0x56ce
8:71CE  26c747026a72         mov word ptr es:[bx + 2], 0x726a  ; SEGMENT s4:0000
8:71D4  668b46ee             mov eax, dword ptr [bp - 0x12]
8:71D8  668946da             mov dword ptr [bp - 0x26], eax
8:71DC  eb08                 jmp 0x71e6
loc_71DE:
8:71DE  66c746da00000000     mov dword ptr [bp - 0x26], 0
loc_71E6:
8:71E6  c45e06               les bx, ptr [bp + 6]
8:71E9  268b470c             mov ax, word ptr es:[bx + 0xc]
8:71ED  c45eda               les bx, ptr [bp - 0x26]
8:71F0  26894704             mov word ptr es:[bx + 4], ax
8:71F4  c45e06               les bx, ptr [bp + 6]
8:71F7  268b4716             mov ax, word ptr es:[bx + 0x16]
8:71FB  c45eda               les bx, ptr [bp - 0x26]
8:71FE  2689470a             mov word ptr es:[bx + 0xa], ax
8:7202  e93d01               jmp 0x7342
8:7205  db 90
loc_7206:
8:7206  26837f1200           cmp word ptr es:[bx + 0x12], 0
8:720B  0f849b00             je 0x72aa
8:720F  26ff7712             push word ptr es:[bx + 0x12]
8:7213  6626ff7716           push dword ptr es:[bx + 0x16]
8:7218  66ff760a             push dword ptr [bp + 0xa]
8:721C  9a507c4f73           lcall 0x734f, 0x7c50  ; sub_s7:7C50
8:7221  66a1a268             mov eax, dword ptr [0x68a2]
8:7225  668946ea             mov dword ptr [bp - 0x16], eax
8:7229  6650                 push eax
8:722B  9afc07c072           lcall 0x72c0, 0x7fc  ; sub_s1:07FC
8:7230  8946ee               mov word ptr [bp - 0x12], ax
8:7233  8956f0               mov word ptr [bp - 0x10], dx
8:7236  0bd0                 or dx, ax
8:7238  743c                 je 0x7276
8:723A  c45eee               les bx, ptr [bp - 0x12]
8:723D  26c7079a38           mov word ptr es:[bx], 0x389a
8:7242  26c74702d872         mov word ptr es:[bx + 2], 0x72d8  ; SEGMENT s2:0000
8:7248  33c0                 xor ax, ax
8:724A  c45eee               les bx, ptr [bp - 0x12]
8:724D  26894704             mov word ptr es:[bx + 4], ax
8:7251  26894706             mov word ptr es:[bx + 6], ax
8:7255  26894708             mov word ptr es:[bx + 8], ax
8:7259  2689470a             mov word ptr es:[bx + 0xa], ax
8:725D  2689470c             mov word ptr es:[bx + 0xc], ax
8:7261  26c707ce56           mov word ptr es:[bx], 0x56ce
8:7266  26c74702fc72         mov word ptr es:[bx + 2], 0x72fc  ; SEGMENT s4:0000
8:726C  668b46ee             mov eax, dword ptr [bp - 0x12]
8:7270  668946da             mov dword ptr [bp - 0x26], eax
8:7274  eb08                 jmp 0x727e
loc_7276:
8:7276  66c746da00000000     mov dword ptr [bp - 0x26], 0
loc_727E:
8:727E  c45e06               les bx, ptr [bp + 6]
8:7281  268b4712             mov ax, word ptr es:[bx + 0x12]
8:7285  c45eda               les bx, ptr [bp - 0x26]
8:7288  26894706             mov word ptr es:[bx + 6], ax
8:728C  c45e06               les bx, ptr [bp + 6]
8:728F  268b4716             mov ax, word ptr es:[bx + 0x16]
8:7293  c45eda               les bx, ptr [bp - 0x26]
8:7296  2689470a             mov word ptr es:[bx + 0xa], ax
8:729A  c45e06               les bx, ptr [bp + 6]
8:729D  26ff7712             push word ptr es:[bx + 0x12]
8:72A1  9ab4c33673           lcall 0x7336, 0xc3b4  ; sub_s5:C3B4
8:72A6  e98f00               jmp 0x7338
8:72A9  db 90
loc_72AA:
8:72AA  26837f1400           cmp word ptr es:[bx + 0x14], 0
8:72AF  0f849e00             je 0x7351
8:72B3  66a1a268             mov eax, dword ptr [0x68a2]
8:72B7  668946ea             mov dword ptr [bp - 0x16], eax
8:72BB  6650                 push eax
8:72BD  9afc070570           lcall 0x7005, 0x7fc  ; sub_s1:07FC
8:72C2  8946ee               mov word ptr [bp - 0x12], ax
8:72C5  8956f0               mov word ptr [bp - 0x10], dx
8:72C8  0bd0                 or dx, ax
8:72CA  743c                 je 0x7308
8:72CC  c45eee               les bx, ptr [bp - 0x12]
8:72CF  26c7079a38           mov word ptr es:[bx], 0x389a
8:72D4  26c747021d70         mov word ptr es:[bx + 2], 0x701d  ; SEGMENT s2:0000
8:72DA  33c0                 xor ax, ax
8:72DC  c45eee               les bx, ptr [bp - 0x12]
8:72DF  26894704             mov word ptr es:[bx + 4], ax
8:72E3  26894706             mov word ptr es:[bx + 6], ax
8:72E7  26894708             mov word ptr es:[bx + 8], ax
8:72EB  2689470a             mov word ptr es:[bx + 0xa], ax
8:72EF  2689470c             mov word ptr es:[bx + 0xc], ax
8:72F3  26c707ce56           mov word ptr es:[bx], 0x56ce
8:72F8  26c747024170         mov word ptr es:[bx + 2], 0x7041  ; SEGMENT s4:0000
8:72FE  668b46ee             mov eax, dword ptr [bp - 0x12]
8:7302  668946da             mov dword ptr [bp - 0x26], eax
8:7306  eb08                 jmp 0x7310
loc_7308:
8:7308  66c746da00000000     mov dword ptr [bp - 0x26], 0
loc_7310:
8:7310  c45e06               les bx, ptr [bp + 6]
8:7313  268b4714             mov ax, word ptr es:[bx + 0x14]
8:7317  c45eda               les bx, ptr [bp - 0x26]
8:731A  26894708             mov word ptr es:[bx + 8], ax
8:731E  c45e06               les bx, ptr [bp + 6]
8:7321  268b4716             mov ax, word ptr es:[bx + 0x16]
8:7325  c45eda               les bx, ptr [bp - 0x26]
8:7328  2689470a             mov word ptr es:[bx + 0xa], ax
8:732C  c45e06               les bx, ptr [bp + 6]
8:732F  26ff7714             push word ptr es:[bx + 0x14]
8:7333  9a2ec4a16f           lcall 0x6fa1, 0xc42e  ; sub_s5:C42E
loc_7338:
8:7338  83c402               add sp, 2
8:733B  c45eda               les bx, ptr [bp - 0x26]
8:733E  26f7670a             mul word ptr es:[bx + 0xa]
loc_7342:
8:7342  2689470c             mov word ptr es:[bx + 0xc], ax
8:7346  06                   push es
8:7347  53                   push bx
8:7348  66ff760a             push dword ptr [bp + 0xa]
8:734C  9a2c6ab86f           lcall 0x6fb8, 0x6a2c  ; sub_s7:6A2C
loc_7351:
8:7351  c9                   leave
8:7352  ca0800               retf 8
8:7355  db 00

; ---------------- sub_s8:7356 FAR size=628 callers=1
8:7356  c8380000             enter 0x38, 0
8:735A  66ff760a             push dword ptr [bp + 0xa]
8:735E  9aa8737f75           lcall 0x757f, 0x73a8  ; DbObj::resolveLink16@s7:73A8
8:7363  8946fc               mov word ptr [bp - 4], ax
8:7366  8956fe               mov word ptr [bp - 2], dx
8:7369  6a04                 push 4
8:736B  c45efc               les bx, ptr [bp - 4]
8:736E  26ff770c             push word ptr es:[bx + 0xc]
8:7372  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:7377  9aaec6d073           lcall 0x73d0, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:737C  0bc0                 or ax, ax
8:737E  0f846c01             je 0x74ee
8:7382  668b46fc             mov eax, dword ptr [bp - 4]
8:7386  668946f0             mov dword ptr [bp - 0x10], eax
8:738A  6650                 push eax
8:738C  9ac862db74           lcall 0x74db, 0x62c8  ; sub_s6:62C8
8:7391  c45e06               les bx, ptr [bp + 6]
8:7394  26395718             cmp word ptr es:[bx + 0x18], dx
8:7398  0f874401             ja 0x74e0
8:739C  7208                 jb 0x73a6
8:739E  26394716             cmp word ptr es:[bx + 0x16], ax
8:73A2  0f873a01             ja 0x74e0
loc_73A6:
8:73A6  26837f1200           cmp word ptr es:[bx + 0x12], 0
8:73AB  0f848b00             je 0x743a
8:73AF  66a1a268             mov eax, dword ptr [0x68a2]
8:73B3  6650                 push eax
8:73B5  9afc074c74           lcall 0x744c, 0x7fc  ; sub_s1:07FC
8:73BA  8946e4               mov word ptr [bp - 0x1c], ax
8:73BD  8956e6               mov word ptr [bp - 0x1a], dx
8:73C0  0bd0                 or dx, ax
8:73C2  743c                 je 0x7400
8:73C4  c45ee4               les bx, ptr [bp - 0x1c]
8:73C7  26c7079a38           mov word ptr es:[bx], 0x389a
8:73CC  26c747026474         mov word ptr es:[bx + 2], 0x7464  ; SEGMENT s2:0000
8:73D2  33c0                 xor ax, ax
8:73D4  c45ee4               les bx, ptr [bp - 0x1c]
8:73D7  26894704             mov word ptr es:[bx + 4], ax
8:73DB  26894706             mov word ptr es:[bx + 6], ax
8:73DF  26894708             mov word ptr es:[bx + 8], ax
8:73E3  2689470a             mov word ptr es:[bx + 0xa], ax
8:73E7  2689470c             mov word ptr es:[bx + 0xc], ax
8:73EB  26c707ce56           mov word ptr es:[bx], 0x56ce
8:73F0  26c747028874         mov word ptr es:[bx + 2], 0x7488  ; SEGMENT s4:0000
8:73F6  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:73FA  668946e8             mov dword ptr [bp - 0x18], eax
8:73FE  eb08                 jmp 0x7408
loc_7400:
8:7400  66c746e800000000     mov dword ptr [bp - 0x18], 0
loc_7408:
8:7408  c45e06               les bx, ptr [bp + 6]
8:740B  268b4712             mov ax, word ptr es:[bx + 0x12]
8:740F  c45ee8               les bx, ptr [bp - 0x18]
8:7412  26894706             mov word ptr es:[bx + 6], ax
8:7416  c45e06               les bx, ptr [bp + 6]
8:7419  268b4716             mov ax, word ptr es:[bx + 0x16]
8:741D  c45ee8               les bx, ptr [bp - 0x18]
8:7420  2689470a             mov word ptr es:[bx + 0xa], ax
8:7424  c45e06               les bx, ptr [bp + 6]
8:7427  26ff7712             push word ptr es:[bx + 0x12]
8:742B  9ab4c3c274           lcall 0x74c2, 0xc3b4  ; sub_s5:C3B4
8:7430  83c402               add sp, 2
8:7433  c45ee8               les bx, ptr [bp - 0x18]
8:7436  e99100               jmp 0x74ca
8:7439  db 90
loc_743A:
8:743A  26837f1400           cmp word ptr es:[bx + 0x14], 0
8:743F  0f849d00             je 0x74e0
8:7443  66a1a268             mov eax, dword ptr [0x68a2]
8:7447  6650                 push eax
8:7449  9afc07b975           lcall 0x75b9, 0x7fc  ; sub_s1:07FC
8:744E  8946e4               mov word ptr [bp - 0x1c], ax
8:7451  8956e6               mov word ptr [bp - 0x1a], dx
8:7454  0bd0                 or dx, ax
8:7456  743c                 je 0x7494
8:7458  c45ee4               les bx, ptr [bp - 0x1c]
8:745B  26c7079a38           mov word ptr es:[bx], 0x389a
8:7460  26c74702ff74         mov word ptr es:[bx + 2], 0x74ff  ; SEGMENT s2:0000
8:7466  33c0                 xor ax, ax
8:7468  c45ee4               les bx, ptr [bp - 0x1c]
8:746B  26894704             mov word ptr es:[bx + 4], ax
8:746F  26894706             mov word ptr es:[bx + 6], ax
8:7473  26894708             mov word ptr es:[bx + 8], ax
8:7477  2689470a             mov word ptr es:[bx + 0xa], ax
8:747B  2689470c             mov word ptr es:[bx + 0xc], ax
8:747F  26c707ce56           mov word ptr es:[bx], 0x56ce
8:7484  26c747027571         mov word ptr es:[bx + 2], 0x7175  ; SEGMENT s4:0000
8:748A  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:748E  668946d0             mov dword ptr [bp - 0x30], eax
8:7492  eb08                 jmp 0x749c
loc_7494:
8:7494  66c746d000000000     mov dword ptr [bp - 0x30], 0
loc_749C:
8:749C  c45e06               les bx, ptr [bp + 6]
8:749F  268b4714             mov ax, word ptr es:[bx + 0x14]
8:74A3  c45ed0               les bx, ptr [bp - 0x30]
8:74A6  26894708             mov word ptr es:[bx + 8], ax
8:74AA  c45e06               les bx, ptr [bp + 6]
8:74AD  268b4716             mov ax, word ptr es:[bx + 0x16]
8:74B1  c45ed0               les bx, ptr [bp - 0x30]
8:74B4  2689470a             mov word ptr es:[bx + 0xa], ax
8:74B8  c45e06               les bx, ptr [bp + 6]
8:74BB  26ff7714             push word ptr es:[bx + 0x14]
8:74BF  9a2ec4b075           lcall 0x75b0, 0xc42e  ; sub_s5:C42E
8:74C4  83c402               add sp, 2
8:74C7  c45ed0               les bx, ptr [bp - 0x30]
loc_74CA:
8:74CA  26f7670a             mul word ptr es:[bx + 0xa]
8:74CE  2689470c             mov word ptr es:[bx + 0xc], ax
8:74D2  06                   push es
8:74D3  53                   push bx
8:74D4  66ff76f0             push dword ptr [bp - 0x10]
8:74D8  9a08642075           lcall 0x7520, 0x6408  ; sub_s6:6408
8:74DD  eb6a                 jmp 0x7549
8:74DF  db 90
loc_74E0:
8:74E0  66ff760a             push dword ptr [bp + 0xa]
8:74E4  06                   push es
8:74E5  53                   push bx
8:74E6  90                   nop
8:74E7  0e                   push cs
8:74E8  e8b1fb               call 0x709c  ; sub_s8:709C
8:74EB  eb5c                 jmp 0x7549
8:74ED  db 90
loc_74EE:
8:74EE  6a03                 push 3
8:74F0  c45efc               les bx, ptr [bp - 4]
8:74F3  26ff770c             push word ptr es:[bx + 0xc]
8:74F7  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:74FC  9aaec65171           lcall 0x7151, 0xc6ae  ; BldgGroups::contains@s2:C6AE
8:7501  0bc0                 or ax, ax
8:7503  7437                 je 0x753c
8:7505  c45e06               les bx, ptr [bp + 6]
8:7508  26837f0c00           cmp word ptr es:[bx + 0xc], 0
8:750D  7508                 jne 0x7517
8:750F  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
8:7515  74c9                 je 0x74e0
loc_7517:
8:7517  668b46fc             mov eax, dword ptr [bp - 4]
8:751B  6650                 push eax
8:751D  9ae2455975           lcall 0x7559, 0x45e2  ; sub_s6:45E2
8:7522  c45e06               les bx, ptr [bp + 6]
8:7525  26395718             cmp word ptr es:[bx + 0x18], dx
8:7529  77b5                 ja 0x74e0
8:752B  7206                 jb 0x7533
8:752D  26394716             cmp word ptr es:[bx + 0x16], ax
8:7531  77ad                 ja 0x74e0
loc_7533:
8:7533  66ff760a             push dword ptr [bp + 0xa]
8:7537  06                   push es
8:7538  53                   push bx
8:7539  eb09                 jmp 0x7544
8:753B  db 90
loc_753C:
8:753C  66ff760a             push dword ptr [bp + 0xa]
8:7540  66ff7606             push dword ptr [bp + 6]
loc_7544:
8:7544  90                   nop
8:7545  0e                   push cs
8:7546  e811fa               call 0x6f5a  ; sub_s8:6F5A
loc_7549:
8:7549  c45e06               les bx, ptr [bp + 6]
8:754C  6626ff7708           push dword ptr es:[bx + 8]
8:7551  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:7556  9aece1626e           lcall 0x6e62, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:755B  8946f8               mov word ptr [bp - 8], ax
8:755E  8956fa               mov word ptr [bp - 6], dx
8:7561  c45ef8               les bx, ptr [bp - 8]
8:7564  268b4734             mov ax, word ptr es:[bx + 0x34]
8:7568  8946f6               mov word ptr [bp - 0xa], ax
8:756B  c45e06               les bx, ptr [bp + 6]
8:756E  268b4726             mov ax, word ptr es:[bx + 0x26]
8:7572  0146f6               add word ptr [bp - 0xa], ax
8:7575  ff76f6               push word ptr [bp - 0xa]
8:7578  52                   push dx
8:7579  ff76f8               push word ptr [bp - 8]
8:757C  9a4c6cfa70           lcall 0x70fa, 0x6c4c  ; sub_s7:6C4C
8:7581  6633c0               xor eax, eax
8:7584  c45e06               les bx, ptr [bp + 6]
8:7587  2689470c             mov word ptr es:[bx + 0xc], ax
8:758B  26894712             mov word ptr es:[bx + 0x12], ax
8:758F  26894714             mov word ptr es:[bx + 0x14], ax
8:7593  6626894716           mov dword ptr es:[bx + 0x16], eax
8:7598  66268b470e           mov eax, dword ptr es:[bx + 0xe]
8:759D  268b5710             mov dx, word ptr es:[bx + 0x10]
8:75A1  668946e4             mov dword ptr [bp - 0x1c], eax
8:75A5  8bda                 mov bx, dx
8:75A7  0bd0                 or dx, ax
8:75A9  7410                 je 0x75bb
8:75AB  53                   push bx
8:75AC  50                   push ax
8:75AD  9a7ebae170           lcall 0x70e1, 0xba7e  ; sub_s5:BA7E
8:75B2  66ff76e4             push dword ptr [bp - 0x1c]
8:75B6  9ace173771           lcall 0x7137, 0x17ce  ; operator_delete@s1:17CE
loc_75BB:
8:75BB  c45e06               les bx, ptr [bp + 6]
8:75BE  662bc0               sub eax, eax
8:75C1  662689470e           mov dword ptr es:[bx + 0xe], eax
8:75C6  c9                   leave
8:75C7  ca0800               retf 8

; ---------------- sub_s8:75CA FAR size=388 callers=3
8:75CA  c81e0000             enter 0x1e, 0
8:75CE  c45e06               les bx, ptr [bp + 6]
8:75D1  6626ff7704           push dword ptr es:[bx + 4]
8:75D6  66ff760a             push dword ptr [bp + 0xa]
8:75DA  9af0790076           lcall 0x7600, 0x79f0  ; sub_s2:79F0
8:75DF  0bc0                 or ax, ax
8:75E1  0f845401             je 0x7739
8:75E5  c45e06               les bx, ptr [bp + 6]
8:75E8  66268b4708           mov eax, dword ptr es:[bx + 8]
8:75ED  668946f2             mov dword ptr [bp - 0xe], eax
8:75F1  666a04               push 4
8:75F4  8d46f2               lea ax, [bp - 0xe]
8:75F7  16                   push ss
8:75F8  50                   push ax
8:75F9  66ff760a             push dword ptr [bp + 0xa]
8:75FD  9a1c7e1776           lcall 0x7617, 0x7e1c  ; File_write@s2:7E1C
8:7602  0bc0                 or ax, ax
8:7604  0f843101             je 0x7739
8:7608  c45e06               les bx, ptr [bp + 6]
8:760B  6626ff770e           push dword ptr es:[bx + 0xe]
8:7610  66ff760a             push dword ptr [bp + 0xa]
8:7614  9a227a3876           lcall 0x7638, 0x7a22  ; sub_s2:7A22
8:7619  0bc0                 or ax, ax
8:761B  0f841a01             je 0x7739
8:761F  c45e06               les bx, ptr [bp + 6]
8:7622  268b470c             mov ax, word ptr es:[bx + 0xc]
8:7626  8946fa               mov word ptr [bp - 6], ax
8:7629  666a02               push 2
8:762C  8d46fa               lea ax, [bp - 6]
8:762F  16                   push ss
8:7630  50                   push ax
8:7631  66ff760a             push dword ptr [bp + 0xa]
8:7635  9a1c7e5976           lcall 0x7659, 0x7e1c  ; File_write@s2:7E1C
8:763A  0bc0                 or ax, ax
8:763C  0f84f900             je 0x7739
8:7640  c45e06               les bx, ptr [bp + 6]
8:7643  268b4712             mov ax, word ptr es:[bx + 0x12]
8:7647  8946fa               mov word ptr [bp - 6], ax
8:764A  666a02               push 2
8:764D  8d46fa               lea ax, [bp - 6]
8:7650  16                   push ss
8:7651  50                   push ax
8:7652  66ff760a             push dword ptr [bp + 0xa]
8:7656  9a1c7e7a76           lcall 0x767a, 0x7e1c  ; File_write@s2:7E1C
8:765B  0bc0                 or ax, ax
8:765D  0f84d800             je 0x7739
8:7661  c45e06               les bx, ptr [bp + 6]
8:7664  268b4714             mov ax, word ptr es:[bx + 0x14]
8:7668  8946fa               mov word ptr [bp - 6], ax
8:766B  666a02               push 2
8:766E  8d46fa               lea ax, [bp - 6]
8:7671  16                   push ss
8:7672  50                   push ax
8:7673  66ff760a             push dword ptr [bp + 0xa]
8:7677  9a1c7e9d76           lcall 0x769d, 0x7e1c  ; File_write@s2:7E1C
8:767C  0bc0                 or ax, ax
8:767E  0f84b700             je 0x7739
8:7682  c45e06               les bx, ptr [bp + 6]
8:7685  66268b4716           mov eax, dword ptr es:[bx + 0x16]
8:768A  668946fa             mov dword ptr [bp - 6], eax
8:768E  666a04               push 4
8:7691  8d46fa               lea ax, [bp - 6]
8:7694  16                   push ss
8:7695  50                   push ax
8:7696  66ff760a             push dword ptr [bp + 0xa]
8:769A  9a1c7eb576           lcall 0x76b5, 0x7e1c  ; File_write@s2:7E1C
8:769F  0bc0                 or ax, ax
8:76A1  0f849400             je 0x7739
8:76A5  668b4606             mov eax, dword ptr [bp + 6]
8:76A9  051a00               add ax, 0x1a
8:76AC  6650                 push eax
8:76AE  66ff760a             push dword ptr [bp + 0xa]
8:76B2  9a4c7bd676           lcall 0x76d6, 0x7b4c  ; sub_s2:7B4C
8:76B7  0bc0                 or ax, ax
8:76B9  747e                 je 0x7739
8:76BB  c45e06               les bx, ptr [bp + 6]
8:76BE  66268b4720           mov eax, dword ptr es:[bx + 0x20]
8:76C3  668946fa             mov dword ptr [bp - 6], eax
8:76C7  666a04               push 4
8:76CA  8d46fa               lea ax, [bp - 6]
8:76CD  16                   push ss
8:76CE  50                   push ax
8:76CF  66ff760a             push dword ptr [bp + 0xa]
8:76D3  9a1c7ef576           lcall 0x76f5, 0x7e1c  ; File_write@s2:7E1C
8:76D8  0bc0                 or ax, ax
8:76DA  745d                 je 0x7739
8:76DC  c45e06               les bx, ptr [bp + 6]
8:76DF  268b4724             mov ax, word ptr es:[bx + 0x24]
8:76E3  8946fa               mov word ptr [bp - 6], ax
8:76E6  666a02               push 2
8:76E9  8d46fa               lea ax, [bp - 6]
8:76EC  16                   push ss
8:76ED  50                   push ax
8:76EE  66ff760a             push dword ptr [bp + 0xa]
8:76F2  9a1c7e1477           lcall 0x7714, 0x7e1c  ; File_write@s2:7E1C
8:76F7  0bc0                 or ax, ax
8:76F9  743e                 je 0x7739
8:76FB  c45e06               les bx, ptr [bp + 6]
8:76FE  268b4726             mov ax, word ptr es:[bx + 0x26]
8:7702  8946fa               mov word ptr [bp - 6], ax
8:7705  666a02               push 2
8:7708  8d46fa               lea ax, [bp - 6]
8:770B  16                   push ss
8:770C  50                   push ax
8:770D  66ff760a             push dword ptr [bp + 0xa]
8:7711  9a1c7e3377           lcall 0x7733, 0x7e1c  ; File_write@s2:7E1C
8:7716  0bc0                 or ax, ax
8:7718  741f                 je 0x7739
8:771A  c45e06               les bx, ptr [bp + 6]
8:771D  268b4728             mov ax, word ptr es:[bx + 0x28]
8:7721  8946fa               mov word ptr [bp - 6], ax
8:7724  666a02               push 2
8:7727  8d46fa               lea ax, [bp - 6]
8:772A  16                   push ss
8:772B  50                   push ax
8:772C  66ff760a             push dword ptr [bp + 0xa]
8:7730  9a1c7e7a73           lcall 0x737a, 0x7e1c  ; File_write@s2:7E1C
8:7735  0bc0                 or ax, ax
8:7737  750d                 jne 0x7746
loc_7739:
8:7739  c7061003d006         mov word ptr [0x310], 0x6d0
8:773F  33c0                 xor ax, ax
8:7741  c9                   leave
8:7742  ca0800               retf 8
8:7745  db 90
loc_7746:
8:7746  b80100               mov ax, 1
8:7749  c9                   leave
8:774A  ca0800               retf 8
8:774D  db 00

; ---------------- sub_s8:774E FAR size=362 callers=3
8:774E  c8240000             enter 0x24, 0
8:7752  833e120302           cmp word ptr [0x312], 2
8:7757  7d07                 jge 0x7760
loc_7759:
8:7759  b80100               mov ax, 1
8:775C  c9                   leave
8:775D  ca0800               retf 8
loc_7760:
8:7760  668b4606             mov eax, dword ptr [bp + 6]
8:7764  050400               add ax, 4
8:7767  6650                 push eax
8:7769  66ff760a             push dword ptr [bp + 0xa]
8:776D  9a6e768b77           lcall 0x778b, 0x766e  ; sub_s2:766E
8:7772  0bc0                 or ax, ax
8:7774  0f840b01             je 0x7883
8:7778  666a04               push 4
8:777B  668b4606             mov eax, dword ptr [bp + 6]
8:777F  050800               add ax, 8
8:7782  6650                 push eax
8:7784  66ff760a             push dword ptr [bp + 0xa]
8:7788  9aee7da377           lcall 0x77a3, 0x7dee  ; File_read@s2:7DEE
8:778D  0bc0                 or ax, ax
8:778F  0f84f000             je 0x7883
8:7793  668b4606             mov eax, dword ptr [bp + 6]
8:7797  050e00               add ax, 0xe
8:779A  6650                 push eax
8:779C  66ff760a             push dword ptr [bp + 0xa]
8:77A0  9acc77ba77           lcall 0x77ba, 0x77cc  ; sub_s2:77CC
8:77A5  0bc0                 or ax, ax
8:77A7  0f84d800             je 0x7883
8:77AB  666a02               push 2
8:77AE  8d46fe               lea ax, [bp - 2]
8:77B1  16                   push ss
8:77B2  50                   push ax
8:77B3  66ff760a             push dword ptr [bp + 0xa]
8:77B7  9aee7dd177           lcall 0x77d1, 0x7dee  ; File_read@s2:7DEE
8:77BC  0bc0                 or ax, ax
8:77BE  0f84c100             je 0x7883
8:77C2  666a02               push 2
8:77C5  8d46fc               lea ax, [bp - 4]
8:77C8  16                   push ss
8:77C9  50                   push ax
8:77CA  66ff760a             push dword ptr [bp + 0xa]
8:77CE  9aee7de877           lcall 0x77e8, 0x7dee  ; File_read@s2:7DEE
8:77D3  0bc0                 or ax, ax
8:77D5  0f84aa00             je 0x7883
8:77D9  666a02               push 2
8:77DC  8d46fa               lea ax, [bp - 6]
8:77DF  16                   push ss
8:77E0  50                   push ax
8:77E1  66ff760a             push dword ptr [bp + 0xa]
8:77E5  9aee7d0378           lcall 0x7803, 0x7dee  ; File_read@s2:7DEE
8:77EA  0bc0                 or ax, ax
8:77EC  0f849300             je 0x7883
8:77F0  666a04               push 4
8:77F3  668b4606             mov eax, dword ptr [bp + 6]
8:77F7  051600               add ax, 0x16
8:77FA  6650                 push eax
8:77FC  66ff760a             push dword ptr [bp + 0xa]
8:7800  9aee7d1978           lcall 0x7819, 0x7dee  ; File_read@s2:7DEE
8:7805  0bc0                 or ax, ax
8:7807  747a                 je 0x7883
8:7809  668b4606             mov eax, dword ptr [bp + 6]
8:780D  051a00               add ax, 0x1a
8:7810  6650                 push eax
8:7812  66ff760a             push dword ptr [bp + 0xa]
8:7816  9ac87b3278           lcall 0x7832, 0x7bc8  ; sub_s2:7BC8
8:781B  0bc0                 or ax, ax
8:781D  7464                 je 0x7883
8:781F  666a04               push 4
8:7822  668b4606             mov eax, dword ptr [bp + 6]
8:7826  052000               add ax, 0x20
8:7829  6650                 push eax
8:782B  66ff760a             push dword ptr [bp + 0xa]
8:782F  9aee7d4b78           lcall 0x784b, 0x7dee  ; File_read@s2:7DEE
8:7834  0bc0                 or ax, ax
8:7836  744b                 je 0x7883
8:7838  666a02               push 2
8:783B  668b4606             mov eax, dword ptr [bp + 6]
8:783F  052400               add ax, 0x24
8:7842  6650                 push eax
8:7844  66ff760a             push dword ptr [bp + 0xa]
8:7848  9aee7d6478           lcall 0x7864, 0x7dee  ; File_read@s2:7DEE
8:784D  0bc0                 or ax, ax
8:784F  7432                 je 0x7883
8:7851  666a02               push 2
8:7854  668b4606             mov eax, dword ptr [bp + 6]
8:7858  052600               add ax, 0x26
8:785B  6650                 push eax
8:785D  66ff760a             push dword ptr [bp + 0xa]
8:7861  9aee7d7d78           lcall 0x787d, 0x7dee  ; File_read@s2:7DEE
8:7866  0bc0                 or ax, ax
8:7868  7419                 je 0x7883
8:786A  666a02               push 2
8:786D  668b4606             mov eax, dword ptr [bp + 6]
8:7871  052800               add ax, 0x28
8:7874  6650                 push eax
8:7876  66ff760a             push dword ptr [bp + 0xa]
8:787A  9aee7da478           lcall 0x78a4, 0x7dee  ; File_read@s2:7DEE
8:787F  0bc0                 or ax, ax
8:7881  750d                 jne 0x7890
loc_7883:
8:7883  c7061003d206         mov word ptr [0x310], 0x6d2
8:7889  33c0                 xor ax, ax
8:788B  c9                   leave
8:788C  ca0800               retf 8
8:788F  db 90
loc_7890:
8:7890  8b46fe               mov ax, word ptr [bp - 2]
8:7893  c45e06               les bx, ptr [bp + 6]
8:7896  2689470c             mov word ptr es:[bx + 0xc], ax
8:789A  ff76fc               push word ptr [bp - 4]
8:789D  66ff760a             push dword ptr [bp + 0xa]
8:78A1  9abc72dd75           lcall 0x75dd, 0x72bc  ; sub_s2:72BC
8:78A6  c45e06               les bx, ptr [bp + 6]
8:78A9  26894712             mov word ptr es:[bx + 0x12], ax
8:78AD  8b46fa               mov ax, word ptr [bp - 6]
8:78B0  26894714             mov word ptr es:[bx + 0x14], ax
8:78B4  e9a2fe               jmp 0x7759
8:78B7  db 00

; ---------------- sub_s8:78B8 FAR size=42 callers=0
8:78B8  55                   push bp
8:78B9  8bec                 mov bp, sp
8:78BB  66ff7606             push dword ptr [bp + 6]
8:78BF  90                   nop
8:78C0  0e                   push cs
8:78C1  e84ef0               call 0x6912  ; sub_s8:6912
8:78C4  f6460a01             test byte ptr [bp + 0xa], 1
8:78C8  7409                 je 0x78d3
8:78CA  66ff7606             push dword ptr [bp + 6]
8:78CE  9ace17b873           lcall 0x73b8, 0x17ce  ; operator_delete@s1:17CE
loc_78D3:
8:78D3  8b4606               mov ax, word ptr [bp + 6]
8:78D6  8b5608               mov dx, word ptr [bp + 8]
8:78D9  c9                   leave
8:78DA  ca0600               retf 6
8:78DD  db 90 b8 78 23 69

; ---------------- sub_s8:78E2 FAR size=130 callers=1
8:78E2  c8040000             enter 4, 0
8:78E6  c45e06               les bx, ptr [bp + 6]
8:78E9  662bc0               sub eax, eax
8:78EC  66268907             mov dword ptr es:[bx], eax
8:78F0  6626894704           mov dword ptr es:[bx + 4], eax
8:78F5  891e645a             mov word ptr [0x5a64], bx
8:78F9  8c06665a             mov word ptr [0x5a66], es
8:78FD  6a0c                 push 0xc
8:78FF  9a9c173479           lcall 0x7934, 0x179c  ; operator_new@s1:179C
8:7904  83c402               add sp, 2
8:7907  8956fe               mov word ptr [bp - 2], dx
8:790A  0bd0                 or dx, ax
8:790C  7416                 je 0x7924
8:790E  ff76fe               push word ptr [bp - 2]
8:7911  50                   push ax
8:7912  9a4a574779           lcall 0x7947, 0x574a  ; sub_s2:574A
8:7917  c45e06               les bx, ptr [bp + 6]
8:791A  268907               mov word ptr es:[bx], ax
8:791D  26895702             mov word ptr es:[bx + 2], dx
8:7921  eb0c                 jmp 0x792f
8:7923  db 90
loc_7924:
8:7924  c45e06               les bx, ptr [bp + 6]
8:7927  6626c70700000000     mov dword ptr es:[bx], 0
loc_792F:
8:792F  6a0c                 push 0xc
8:7931  9a9c17d178           lcall 0x78d1, 0x179c  ; operator_new@s1:179C
8:7936  83c402               add sp, 2
8:7939  8956fe               mov word ptr [bp - 2], dx
8:793C  0bd0                 or dx, ax
8:793E  740c                 je 0x794c
8:7940  ff76fe               push word ptr [bp - 2]
8:7943  50                   push ax
8:7944  9a4a577077           lcall 0x7770, 0x574a  ; sub_s2:574A
8:7949  eb04                 jmp 0x794f
8:794B  db 90
loc_794C:
8:794C  33c0                 xor ax, ax
8:794E  99                   cdq
loc_794F:
8:794F  c45e06               les bx, ptr [bp + 6]
8:7952  26894704             mov word ptr es:[bx + 4], ax
8:7956  26895706             mov word ptr es:[bx + 6], dx
8:795A  8b4606               mov ax, word ptr [bp + 6]
8:795D  8b5608               mov dx, word ptr [bp + 8]
8:7960  c9                   leave
8:7961  ca0400               retf 4

; ---------------- sub_s8:7964 FAR size=78 callers=1
8:7964  c8080000             enter 8, 0
8:7968  66c706645a00000000   mov dword ptr [0x5a64], 0
8:7971  c45e06               les bx, ptr [bp + 6]
8:7974  268b07               mov ax, word ptr es:[bx]
8:7977  268b5702             mov dx, word ptr es:[bx + 2]
8:797B  8bda                 mov bx, dx
8:797D  0bd8                 or bx, ax
8:797F  740e                 je 0x798f
8:7981  6a01                 push 1
8:7983  52                   push dx
8:7984  50                   push ax
8:7985  8ec2                 mov es, dx
8:7987  8bd8                 mov bx, ax
8:7989  26c41f               les bx, ptr es:[bx]
8:798C  26ff1f               lcall es:[bx]
loc_798F:
8:798F  c45e06               les bx, ptr [bp + 6]
8:7992  268b4704             mov ax, word ptr es:[bx + 4]
8:7996  268b5706             mov dx, word ptr es:[bx + 6]
8:799A  8bda                 mov bx, dx
8:799C  0bd8                 or bx, ax
8:799E  740e                 je 0x79ae
8:79A0  6a01                 push 1
8:79A2  52                   push dx
8:79A3  50                   push ax
8:79A4  8ec2                 mov es, dx
8:79A6  8bd8                 mov bx, ax
8:79A8  26c41f               les bx, ptr es:[bx]
8:79AB  26ff1f               lcall es:[bx]
loc_79AE:
8:79AE  c9                   leave
8:79AF  ca0400               retf 4

; ---------------- sub_s8:79B2 FAR size=64 callers=1
8:79B2  c8080000             enter 8, 0
8:79B6  6a14                 push 0x14
8:79B8  9a9c170279           lcall 0x7902, 0x179c  ; operator_new@s1:179C
8:79BD  83c402               add sp, 2
8:79C0  8956fa               mov word ptr [bp - 6], dx
8:79C3  0bd0                 or dx, ax
8:79C5  740f                 je 0x79d6
8:79C7  66ff760a             push dword ptr [bp + 0xa]
8:79CB  ff76fa               push word ptr [bp - 6]
8:79CE  50                   push ax
8:79CF  9afaae6173           lcall 0x7361, 0xaefa  ; sub_s7:AEFA
8:79D4  eb03                 jmp 0x79d9
loc_79D6:
8:79D6  33c0                 xor ax, ax
8:79D8  99                   cdq
loc_79D9:
8:79D9  52                   push dx
8:79DA  50                   push ax
8:79DB  c45e06               les bx, ptr [bp + 6]
8:79DE  6626ff7704           push dword ptr es:[bx + 4]
8:79E3  26c45f04             les bx, ptr es:[bx + 4]
8:79E7  26c41f               les bx, ptr es:[bx]
8:79EA  26ff5f04             lcall es:[bx + 4]
8:79EE  c9                   leave
8:79EF  ca0800               retf 8

; ---------------- sub_s8:79F2 FAR size=104 callers=1
8:79F2  c81a0000             enter 0x1a, 0
8:79F6  c45e0a               les bx, ptr [bp + 0xa]
8:79F9  66268b4704           mov eax, dword ptr es:[bx + 4]
8:79FE  668946fc             mov dword ptr [bp - 4], eax
8:7A02  c45e06               les bx, ptr [bp + 6]
8:7A05  6626ff7704           push dword ptr es:[bx + 4]
8:7A0A  8d46f4               lea ax, [bp - 0xc]
8:7A0D  16                   push ss
8:7A0E  50                   push ax
8:7A0F  9a8457217a           lcall 0x7a21, 0x5784  ; ListIter::ListIter@s2:5784
8:7A14  c746ee0000           mov word ptr [bp - 0x12], 0
loc_7A19:
8:7A19  8d46f4               lea ax, [bp - 0xc]
8:7A1C  16                   push ss
8:7A1D  50                   push ax
8:7A1E  9a125b1579           lcall 0x7915, 0x5b12  ; ListIter::next@s2:5B12
8:7A23  8946f0               mov word ptr [bp - 0x10], ax
8:7A26  8956f2               mov word ptr [bp - 0xe], dx
8:7A29  0bd0                 or dx, ax
8:7A2B  7428                 je 0x7a55
8:7A2D  668b46fc             mov eax, dword ptr [bp - 4]
8:7A31  c45ef0               les bx, ptr [bp - 0x10]
8:7A34  6626394704           cmp dword ptr es:[bx + 4], eax
8:7A39  75de                 jne 0x7a19
8:7A3B  06                   push es
8:7A3C  53                   push bx
8:7A3D  c45e06               les bx, ptr [bp + 6]
8:7A40  6626ff7704           push dword ptr es:[bx + 4]
8:7A45  26c45f04             les bx, ptr es:[bx + 4]
8:7A49  26c41f               les bx, ptr es:[bx]
8:7A4C  26ff5f0c             lcall es:[bx + 0xc]
8:7A50  c746ee0100           mov word ptr [bp - 0x12], 1
loc_7A55:
8:7A55  c9                   leave
8:7A56  ca0800               retf 8
8:7A59  db 00

; ---------------- sub_s8:7A5A FAR size=28 callers=4
8:7A5A  55                   push bp
8:7A5B  8bec                 mov bp, sp
8:7A5D  66ff760a             push dword ptr [bp + 0xa]
8:7A61  c45e06               les bx, ptr [bp + 6]
8:7A64  6626ff37             push dword ptr es:[bx]
8:7A68  26c41f               les bx, ptr es:[bx]
8:7A6B  26c41f               les bx, ptr es:[bx]
8:7A6E  26ff5f04             lcall es:[bx + 4]
8:7A72  c9                   leave
8:7A73  ca0800               retf 8

; ---------------- sub_s8:7A76 FAR size=170 callers=1
8:7A76  c8100000             enter 0x10, 0
8:7A7A  c45e06               les bx, ptr [bp + 6]
8:7A7D  6626ff37             push dword ptr es:[bx]
8:7A81  8d46f8               lea ax, [bp - 8]
8:7A84  16                   push ss
8:7A85  50                   push ax
8:7A86  9a8457937a           lcall 0x7a93, 0x5784  ; ListIter::ListIter@s2:5784
loc_7A8B:
8:7A8B  8d46f8               lea ax, [bp - 8]
8:7A8E  16                   push ss
8:7A8F  50                   push ax
8:7A90  9a125bba7a           lcall 0x7aba, 0x5b12  ; ListIter::next@s2:5B12
8:7A95  8946f4               mov word ptr [bp - 0xc], ax
8:7A98  8956f6               mov word ptr [bp - 0xa], dx
8:7A9B  0bd0                 or dx, ax
8:7A9D  740b                 je 0x7aaa
8:7A9F  ff76f6               push word ptr [bp - 0xa]
8:7AA2  50                   push ax
8:7AA3  90                   nop
8:7AA4  0e                   push cs
8:7AA5  e866ef               call 0x6a0e  ; sub_s8:6A0E
8:7AA8  ebe1                 jmp 0x7a8b
loc_7AAA:
8:7AAA  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_7AB2:
8:7AB2  8d46f8               lea ax, [bp - 8]
8:7AB5  16                   push ss
8:7AB6  50                   push ax
8:7AB7  9a125bfa7a           lcall 0x7afa, 0x5b12  ; ListIter::next@s2:5B12
8:7ABC  8946f4               mov word ptr [bp - 0xc], ax
8:7ABF  8956f6               mov word ptr [bp - 0xa], dx
8:7AC2  0bd0                 or dx, ax
8:7AC4  7424                 je 0x7aea
8:7AC6  ff76f6               push word ptr [bp - 0xa]
8:7AC9  50                   push ax
8:7ACA  90                   nop
8:7ACB  0e                   push cs
8:7ACC  e86df0               call 0x6b3c  ; sub_s8:6B3C
8:7ACF  0bc0                 or ax, ax
8:7AD1  74df                 je 0x7ab2
8:7AD3  66ff76f4             push dword ptr [bp - 0xc]
8:7AD7  c45e06               les bx, ptr [bp + 6]
8:7ADA  6626ff37             push dword ptr es:[bx]
8:7ADE  26c41f               les bx, ptr es:[bx]
8:7AE1  26c41f               les bx, ptr es:[bx]
8:7AE4  26ff5f0c             lcall es:[bx + 0xc]
8:7AE8  ebc0                 jmp 0x7aaa
loc_7AEA:
8:7AEA  c45e06               les bx, ptr [bp + 6]
8:7AED  6626ff7704           push dword ptr es:[bx + 4]
8:7AF2  8d46f8               lea ax, [bp - 8]
8:7AF5  16                   push ss
8:7AF6  50                   push ax
8:7AF7  9a8457047b           lcall 0x7b04, 0x5784  ; ListIter::ListIter@s2:5784
loc_7AFC:
8:7AFC  8d46f8               lea ax, [bp - 8]
8:7AFF  16                   push ss
8:7B00  50                   push ax
8:7B01  9a125b127a           lcall 0x7a12, 0x5b12  ; ListIter::next@s2:5B12
8:7B06  8946f0               mov word ptr [bp - 0x10], ax
8:7B09  8956f2               mov word ptr [bp - 0xe], dx
8:7B0C  0bd0                 or dx, ax
8:7B0E  740c                 je 0x7b1c
8:7B10  ff76f2               push word ptr [bp - 0xe]
8:7B13  50                   push ax
8:7B14  9afcafd279           lcall 0x79d2, 0xaffc  ; sub_s7:AFFC
8:7B19  ebe1                 jmp 0x7afc
8:7B1B  db 90
loc_7B1C:
8:7B1C  c9                   leave
8:7B1D  ca0400               retf 4

; ---------------- sub_s8:7B20 FAR size=226 callers=1
8:7B20  c81a0000             enter 0x1a, 0
8:7B24  6a17                 push 0x17
8:7B26  66ff760a             push dword ptr [bp + 0xa]
8:7B2A  9aac7c597b           lcall 0x7b59, 0x7cac  ; Save_writeChunkTag@s2:7CAC
8:7B2F  0bc0                 or ax, ax
8:7B31  7507                 jne 0x7b3a
loc_7B33:
8:7B33  33c0                 xor ax, ax
8:7B35  c9                   leave
8:7B36  ca0800               retf 8
8:7B39  db 90
loc_7B3A:
8:7B3A  c45e06               les bx, ptr [bp + 6]
8:7B3D  26c41f               les bx, ptr es:[bx]
8:7B40  268b4708             mov ax, word ptr es:[bx + 8]
8:7B44  8946fe               mov word ptr [bp - 2], ax
8:7B47  8946e6               mov word ptr [bp - 0x1a], ax
8:7B4A  666a02               push 2
8:7B4D  8d46e6               lea ax, [bp - 0x1a]
8:7B50  16                   push ss
8:7B51  50                   push ax
8:7B52  66ff760a             push dword ptr [bp + 0xa]
8:7B56  9a1c7e6e7b           lcall 0x7b6e, 0x7e1c  ; File_write@s2:7E1C
8:7B5B  0bc0                 or ax, ax
8:7B5D  74d4                 je 0x7b33
8:7B5F  c45e06               les bx, ptr [bp + 6]
8:7B62  6626ff37             push dword ptr es:[bx]
8:7B66  8d46f6               lea ax, [bp - 0xa]
8:7B69  16                   push ss
8:7B6A  50                   push ax
8:7B6B  9a8457787b           lcall 0x7b78, 0x5784  ; ListIter::ListIter@s2:5784
loc_7B70:
8:7B70  8d46f6               lea ax, [bp - 0xa]
8:7B73  16                   push ss
8:7B74  50                   push ax
8:7B75  9a125bb87b           lcall 0x7bb8, 0x5b12  ; ListIter::next@s2:5B12
8:7B7A  8946f2               mov word ptr [bp - 0xe], ax
8:7B7D  8956f4               mov word ptr [bp - 0xc], dx
8:7B80  0bd0                 or dx, ax
8:7B82  7414                 je 0x7b98
8:7B84  66ff760a             push dword ptr [bp + 0xa]
8:7B88  ff76f4               push word ptr [bp - 0xc]
8:7B8B  50                   push ax
8:7B8C  90                   nop
8:7B8D  0e                   push cs
8:7B8E  e839fa               call 0x75ca  ; sub_s8:75CA
8:7B91  0bc0                 or ax, ax
8:7B93  75db                 jne 0x7b70
8:7B95  eb9c                 jmp 0x7b33
8:7B97  db 90
loc_7B98:
8:7B98  c45e06               les bx, ptr [bp + 6]
8:7B9B  26c45f04             les bx, ptr es:[bx + 4]
8:7B9F  268b4708             mov ax, word ptr es:[bx + 8]
8:7BA3  8946e6               mov word ptr [bp - 0x1a], ax
8:7BA6  8946fe               mov word ptr [bp - 2], ax
8:7BA9  666a02               push 2
8:7BAC  8d46fe               lea ax, [bp - 2]
8:7BAF  16                   push ss
8:7BB0  50                   push ax
8:7BB1  66ff760a             push dword ptr [bp + 0xa]
8:7BB5  9a1c7ed07b           lcall 0x7bd0, 0x7e1c  ; File_write@s2:7E1C
8:7BBA  0bc0                 or ax, ax
8:7BBC  0f8473ff             je 0x7b33
8:7BC0  c45e06               les bx, ptr [bp + 6]
8:7BC3  6626ff7704           push dword ptr es:[bx + 4]
8:7BC8  8d46f6               lea ax, [bp - 0xa]
8:7BCB  16                   push ss
8:7BCC  50                   push ax
8:7BCD  9a8457da7b           lcall 0x7bda, 0x5784  ; ListIter::ListIter@s2:5784
loc_7BD2:
8:7BD2  8d46f6               lea ax, [bp - 0xa]
8:7BD5  16                   push ss
8:7BD6  50                   push ax
8:7BD7  9a125b897a           lcall 0x7a89, 0x5b12  ; ListIter::next@s2:5B12
8:7BDC  8946e8               mov word ptr [bp - 0x18], ax
8:7BDF  8956ea               mov word ptr [bp - 0x16], dx
8:7BE2  0bd0                 or dx, ax
8:7BE4  7414                 je 0x7bfa
8:7BE6  66ff760a             push dword ptr [bp + 0xa]
8:7BEA  ff76ea               push word ptr [bp - 0x16]
8:7BED  50                   push ax
8:7BEE  9a68b7177b           lcall 0x7b17, 0xb768  ; sub_s7:B768
8:7BF3  0bc0                 or ax, ax
8:7BF5  75db                 jne 0x7bd2
8:7BF7  e939ff               jmp 0x7b33
loc_7BFA:
8:7BFA  b80100               mov ax, 1
8:7BFD  c9                   leave
8:7BFE  ca0800               retf 8
8:7C01  db 00

; ---------------- sub_s8:7C02 FAR size=270 callers=1
8:7C02  c81c0000             enter 0x1c, 0
8:7C06  833e120302           cmp word ptr [0x312], 2
8:7C0B  7d07                 jge 0x7c14
loc_7C0D:
8:7C0D  b80100               mov ax, 1
8:7C10  c9                   leave
8:7C11  ca0800               retf 8
loc_7C14:
8:7C14  6a17                 push 0x17
8:7C16  66ff760a             push dword ptr [bp + 0xa]
8:7C1A  9afe7c397c           lcall 0x7c39, 0x7cfe  ; sub_s2:7CFE
8:7C1F  0bc0                 or ax, ax
8:7C21  7507                 jne 0x7c2a
loc_7C23:
8:7C23  33c0                 xor ax, ax
8:7C25  c9                   leave
8:7C26  ca0800               retf 8
8:7C29  db 90
loc_7C2A:
8:7C2A  666a02               push 2
8:7C2D  8d46fe               lea ax, [bp - 2]
8:7C30  16                   push ss
8:7C31  50                   push ax
8:7C32  66ff760a             push dword ptr [bp + 0xa]
8:7C36  9aee7da87c           lcall 0x7ca8, 0x7dee  ; File_read@s2:7DEE
8:7C3B  0bc0                 or ax, ax
8:7C3D  74e4                 je 0x7c23
8:7C3F  eb4e                 jmp 0x7c8f
8:7C41  db 90
loc_7C42:
8:7C42  66ff760a             push dword ptr [bp + 0xa]
8:7C46  6a2a                 push 0x2a
8:7C48  9a9c17c57c           lcall 0x7cc5, 0x179c  ; operator_new@s1:179C
8:7C4D  83c402               add sp, 2
8:7C50  8946ec               mov word ptr [bp - 0x14], ax
8:7C53  8956ee               mov word ptr [bp - 0x12], dx
8:7C56  0bd0                 or dx, ax
8:7C58  740c                 je 0x7c66
8:7C5A  ff76ee               push word ptr [bp - 0x12]
8:7C5D  50                   push ax
8:7C5E  90                   nop
8:7C5F  0e                   push cs
8:7C60  e8bde8               call 0x6520  ; sub_s8:6520
8:7C63  eb04                 jmp 0x7c69
8:7C65  db 90
loc_7C66:
8:7C66  33c0                 xor ax, ax
8:7C68  99                   cdq
loc_7C69:
8:7C69  8946f4               mov word ptr [bp - 0xc], ax
8:7C6C  8956f6               mov word ptr [bp - 0xa], dx
8:7C6F  52                   push dx
8:7C70  50                   push ax
8:7C71  90                   nop
8:7C72  0e                   push cs
8:7C73  e8d8fa               call 0x774e  ; sub_s8:774E
8:7C76  0bc0                 or ax, ax
8:7C78  74a9                 je 0x7c23
8:7C7A  66ff76f4             push dword ptr [bp - 0xc]
8:7C7E  c45e06               les bx, ptr [bp + 6]
8:7C81  6626ff37             push dword ptr es:[bx]
8:7C85  26c41f               les bx, ptr es:[bx]
8:7C88  26c41f               les bx, ptr es:[bx]
8:7C8B  26ff5f04             lcall es:[bx + 4]
loc_7C8F:
8:7C8F  8b46fe               mov ax, word ptr [bp - 2]
8:7C92  ff4efe               dec word ptr [bp - 2]
8:7C95  0bc0                 or ax, ax
8:7C97  75a9                 jne 0x7c42
8:7C99  50                   push ax
8:7C9A  6a02                 push 2
8:7C9C  8d46f0               lea ax, [bp - 0x10]
8:7C9F  16                   push ss
8:7CA0  50                   push ax
8:7CA1  66ff760a             push dword ptr [bp + 0xa]
8:7CA5  9aee7d2d7b           lcall 0x7b2d, 0x7dee  ; File_read@s2:7DEE
8:7CAA  0bc0                 or ax, ax
8:7CAC  0f8473ff             je 0x7c23
loc_7CB0:
8:7CB0  8b46f0               mov ax, word ptr [bp - 0x10]
8:7CB3  ff4ef0               dec word ptr [bp - 0x10]
8:7CB6  0bc0                 or ax, ax
8:7CB8  0f8451ff             je 0x7c0d
8:7CBC  66ff760a             push dword ptr [bp + 0xa]
8:7CC0  6a14                 push 0x14
8:7CC2  9a9c17bb79           lcall 0x79bb, 0x179c  ; operator_new@s1:179C
8:7CC7  83c402               add sp, 2
8:7CCA  8946ec               mov word ptr [bp - 0x14], ax
8:7CCD  8956ee               mov word ptr [bp - 0x12], dx
8:7CD0  0bd0                 or dx, ax
8:7CD2  740c                 je 0x7ce0
8:7CD4  ff76ee               push word ptr [bp - 0x12]
8:7CD7  50                   push ax
8:7CD8  9a6caeee7c           lcall 0x7cee, 0xae6c  ; sub_s7:AE6C
8:7CDD  eb04                 jmp 0x7ce3
8:7CDF  db 90
loc_7CE0:
8:7CE0  33c0                 xor ax, ax
8:7CE2  99                   cdq
loc_7CE3:
8:7CE3  8946e8               mov word ptr [bp - 0x18], ax
8:7CE6  8956ea               mov word ptr [bp - 0x16], dx
8:7CE9  52                   push dx
8:7CEA  50                   push ax
8:7CEB  9a36b8f17b           lcall 0x7bf1, 0xb836  ; sub_s7:B836
8:7CF0  0bc0                 or ax, ax
8:7CF2  0f842dff             je 0x7c23
8:7CF6  66ff76e8             push dword ptr [bp - 0x18]
8:7CFA  c45e06               les bx, ptr [bp + 6]
8:7CFD  6626ff7704           push dword ptr es:[bx + 4]
8:7D02  26c45f04             les bx, ptr es:[bx + 4]
8:7D06  26c41f               les bx, ptr es:[bx]
8:7D09  26ff5f04             lcall es:[bx + 4]
8:7D0D  eba1                 jmp 0x7cb0
8:7D0F  db 90

; ---------------- sub_s8:7D10 FAR size=76 callers=1
8:7D10  55                   push bp
8:7D11  8bec                 mov bp, sp
8:7D13  ff760a               push word ptr [bp + 0xa]
8:7D16  685318               push 0x1853
8:7D19  66ff7606             push dword ptr [bp + 6]
8:7D1D  9a82b0ffff           lcall 0xffff, 0xb082  ; sub_s9:B082
8:7D22  c45e06               les bx, ptr [bp + 6]
8:7D25  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
8:7D2F  26c7077688           mov word ptr es:[bx], 0x8876
8:7D34  26c74702e078         mov word ptr es:[bx + 2], 0x78e0  ; SEGMENT s8:0000
8:7D3A  6a40                 push 0x40
8:7D3C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:7D41  9aba208d6c           lcall 0x6c8d, 0x20ba  ; sub_s3:20BA
8:7D46  c45e06               les bx, ptr [bp + 6]
8:7D49  2689879400           mov word ptr es:[bx + 0x94], ax
8:7D4E  2689979600           mov word ptr es:[bx + 0x96], dx
8:7D53  8bc3                 mov ax, bx
8:7D55  8cc2                 mov dx, es
8:7D57  c9                   leave
8:7D58  ca0600               retf 6
8:7D5B  db 00

; ---------------- sub_s8:7D5C FAR size=44 callers=1
8:7D5C  55                   push bp
8:7D5D  8bec                 mov bp, sp
8:7D5F  c45e06               les bx, ptr [bp + 6]
8:7D62  26c7077688           mov word ptr es:[bx], 0x8876
8:7D67  26c74702387d         mov word ptr es:[bx + 2], 0x7d38  ; SEGMENT s8:0000
8:7D6D  26ff7706             push word ptr es:[bx + 6]
8:7D71  66ff367c5b           push dword ptr [0x5b7c]
8:7D76  90                   nop
8:7D77  0e                   push cs
8:7D78  e86539               call 0xb6e0  ; sub_s8:B6E0
8:7D7B  66ff7606             push dword ptr [bp + 6]
8:7D7F  9af8b0207d           lcall 0x7d20, 0xb0f8  ; sub_s9:B0F8
8:7D84  c9                   leave
8:7D85  ca0400               retf 4

; ---------------- sub_s8:7D88 FAR size=36 callers=0
;   apis: USER.DestroyWindow
8:7D88  55                   push bp
8:7D89  8bec                 mov bp, sp
8:7D8B  ff760a               push word ptr [bp + 0xa]
8:7D8E  c45e06               les bx, ptr [bp + 6]
8:7D91  6626ffb79400         push dword ptr es:[bx + 0x94]
8:7D97  9a44b51d7c           lcall 0x7c1d, 0xb544  ; sub_s2:B544
8:7D9C  c45e06               les bx, ptr [bp + 6]
8:7D9F  26ff7706             push word ptr es:[bx + 6]
8:7DA3  9affff0000           lcall 0, 0xffff  ; USER.DestroyWindow
8:7DA8  c9                   leave
8:7DA9  ca0600               retf 6

; ---------------- sub_s8:7DAC FAR size=26 callers=0
8:7DAC  55                   push bp
8:7DAD  8bec                 mov bp, sp
8:7DAF  66ff7606             push dword ptr [bp + 6]
8:7DB3  9ade78827d           lcall 0x7d82, 0x78de  ; sub_s9:78DE
8:7DB8  66ff7606             push dword ptr [bp + 6]
8:7DBC  90                   nop
8:7DBD  0e                   push cs
8:7DBE  e88906               call 0x844a  ; sub_s8:844A
8:7DC1  c9                   leave
8:7DC2  ca0400               retf 4
8:7DC5  db 00

; ---------------- sub_s8:7DC6 FAR size=230 callers=0
8:7DC6  c8040000             enter 4, 0
8:7DCA  c746fe0000           mov word ptr [bp - 2], 0
8:7DCF  8b460e               mov ax, word ptr [bp + 0xe]
8:7DD2  3d5418               cmp ax, 0x1854
8:7DD5  7443                 je 0x7e1a
8:7DD7  0f878d00             ja 0x7e68
8:7DDB  2deb00               sub ax, 0xeb
8:7DDE  7470                 je 0x7e50
8:7DE0  2d1000               sub ax, 0x10
8:7DE3  7409                 je 0x7dee
8:7DE5  2d4617               sub ax, 0x1746
8:7DE8  7472                 je 0x7e5c
8:7DEA  e98a00               jmp 0x7e77
8:7DED  db 90
loc_7DEE:
8:7DEE  66ff7606             push dword ptr [bp + 6]
8:7DF2  90                   nop
8:7DF3  0e                   push cs
8:7DF4  e8b500               call 0x7eac  ; sub_s8:7EAC
8:7DF7  e99200               jmp 0x7e8c
loc_7DFA:
8:7DFA  66ff7606             push dword ptr [bp + 6]
8:7DFE  90                   nop
8:7DFF  0e                   push cs
8:7E00  e8ab01               call 0x7fae  ; sub_s8:7FAE
loc_7E03:
8:7E03  c746fe0100           mov word ptr [bp - 2], 1
8:7E08  e98100               jmp 0x7e8c
8:7E0B  db 90 90 90
loc_7E0E:
8:7E0E  66ff7606             push dword ptr [bp + 6]
8:7E12  90                   nop
8:7E13  0e                   push cs
8:7E14  e80302               call 0x801a  ; sub_s8:801A
8:7E17  ebea                 jmp 0x7e03
8:7E19  db 90
loc_7E1A:
8:7E1A  8b460c               mov ax, word ptr [bp + 0xc]
8:7E1D  48                   dec ax
8:7E1E  756c                 jne 0x7e8c
8:7E20  66ff7606             push dword ptr [bp + 6]
8:7E24  90                   nop
8:7E25  0e                   push cs
8:7E26  e8ef07               call 0x8618  ; sub_s8:8618
8:7E29  ebd8                 jmp 0x7e03
8:7E2B  db 90
loc_7E2C:
8:7E2C  8b460c               mov ax, word ptr [bp + 0xc]
8:7E2F  48                   dec ax
8:7E30  755a                 jne 0x7e8c
8:7E32  66ff7606             push dword ptr [bp + 6]
8:7E36  90                   nop
8:7E37  0e                   push cs
8:7E38  e87709               call 0x87b2  ; sub_s8:87B2
8:7E3B  ebc6                 jmp 0x7e03
8:7E3D  db 90
loc_7E3E:
8:7E3E  8b460c               mov ax, word ptr [bp + 0xc]
8:7E41  48                   dec ax
8:7E42  7548                 jne 0x7e8c
8:7E44  66ff7606             push dword ptr [bp + 6]
8:7E48  90                   nop
8:7E49  0e                   push cs
8:7E4A  e8c309               call 0x8810  ; sub_s8:8810
8:7E4D  ebb4                 jmp 0x7e03
8:7E4F  db 90
loc_7E50:
8:7E50  66ff7606             push dword ptr [bp + 6]
8:7E54  90                   nop
8:7E55  0e                   push cs
8:7E56  e8f105               call 0x844a  ; sub_s8:844A
8:7E59  eb31                 jmp 0x7e8c
8:7E5B  db 90
loc_7E5C:
8:7E5C  66ff7606             push dword ptr [bp + 6]
8:7E60  90                   nop
8:7E61  0e                   push cs
8:7E62  e85903               call 0x81be  ; sub_s8:81BE
8:7E65  eb25                 jmp 0x7e8c
8:7E67  db 90
loc_7E68:
8:7E68  2d5518               sub ax, 0x1855
8:7E6B  74bf                 je 0x7e2c
8:7E6D  48                   dec ax
8:7E6E  74ce                 je 0x7e3e
8:7E70  48                   dec ax
8:7E71  48                   dec ax
8:7E72  7486                 je 0x7dfa
8:7E74  48                   dec ax
8:7E75  7497                 je 0x7e0e
loc_7E77:
8:7E77  66ff760c             push dword ptr [bp + 0xc]
8:7E7B  66ff7608             push dword ptr [bp + 8]
8:7E7F  ff7606               push word ptr [bp + 6]
8:7E82  9a4ab5b67d           lcall 0x7db6, 0xb54a  ; sub_s9:B54A
8:7E87  c9                   leave
8:7E88  ca0a00               retf 0xa
8:7E8B  db 90
loc_7E8C:
8:7E8C  837efe00             cmp word ptr [bp - 2], 0
8:7E90  7412                 je 0x7ea4
8:7E92  66ff7606             push dword ptr [bp + 6]
8:7E96  90                   nop
8:7E97  0e                   push cs
8:7E98  e8bd04               call 0x8358  ; sub_s8:8358
8:7E9B  66ff7606             push dword ptr [bp + 6]
8:7E9F  90                   nop
8:7EA0  0e                   push cs
8:7EA1  e8c601               call 0x806a  ; sub_s8:806A
loc_7EA4:
8:7EA4  b80100               mov ax, 1
8:7EA7  99                   cdq
8:7EA8  c9                   leave
8:7EA9  ca0a00               retf 0xa

; ---------------- sub_s8:7EAC FAR size=258 callers=1
;   apis: USER.SendDlgItemMessage
8:7EAC  c80c0000             enter 0xc, 0
8:7EB0  6a30                 push 0x30
8:7EB2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:7EB7  9aba20c17e           lcall 0x7ec1, 0x20ba  ; sub_s3:20BA
8:7EBC  52                   push dx
8:7EBD  50                   push ax
8:7EBE  9a5e37447d           lcall 0x7d44, 0x375e  ; sub_s3:375E
8:7EC3  8946f8               mov word ptr [bp - 8], ax
8:7EC6  8956fa               mov word ptr [bp - 6], dx
8:7EC9  52                   push dx
8:7ECA  50                   push ax
8:7ECB  c45e06               les bx, ptr [bp + 6]
8:7ECE  6626ffb79400         push dword ptr es:[bx + 0x94]
8:7ED4  9aa6b19a7d           lcall 0x7d9a, 0xb1a6  ; sub_s2:B1A6
8:7ED9  c45e06               les bx, ptr [bp + 6]
8:7EDC  26ff7706             push word ptr es:[bx + 6]
8:7EE0  66680b005418         push 0x1854000b
8:7EE6  666a00               push 0
8:7EE9  6a00                 push 0
8:7EEB  9a037f0000           lcall 0, 0x7f03  ; USER.SendDlgItemMessage
8:7EF0  c45e06               les bx, ptr [bp + 6]
8:7EF3  26ff7706             push word ptr es:[bx + 6]
8:7EF7  666809045418         push 0x18540409
8:7EFD  666a00               push 0
8:7F00  6a00                 push 0
8:7F02  9a227f0000           lcall 0, 0x7f22  ; USER.SendDlgItemMessage
8:7F07  3dffff               cmp ax, 0xffff
8:7F0A  7504                 jne 0x7f10
8:7F0C  3bd0                 cmp dx, ax
8:7F0E  747f                 je 0x7f8f
loc_7F10:
8:7F10  c45e06               les bx, ptr [bp + 6]
8:7F13  26ff7706             push word ptr es:[bx + 6]
8:7F17  666803045418         push 0x18540403
8:7F1D  50                   push ax
8:7F1E  666a00               push 0
8:7F21  9a3a7f0000           lcall 0, 0x7f3a  ; USER.SendDlgItemMessage
8:7F26  c45e06               les bx, ptr [bp + 6]
8:7F29  26ff7706             push word ptr es:[bx + 6]
8:7F2D  666801045418         push 0x18540401
8:7F33  6a00                 push 0
8:7F35  66ff76f8             push dword ptr [bp - 8]
8:7F39  9a547f0000           lcall 0, 0x7f54  ; USER.SendDlgItemMessage
8:7F3E  c45e06               les bx, ptr [bp + 6]
8:7F41  26ff7706             push word ptr es:[bx + 6]
8:7F45  666807045418         push 0x18540407
8:7F4B  66680000ffff         push 0xffff0000
8:7F51  6a00                 push 0
8:7F53  9a6b7f0000           lcall 0, 0x7f6b  ; USER.SendDlgItemMessage
8:7F58  c45e06               les bx, ptr [bp + 6]
8:7F5B  26ff7706             push word ptr es:[bx + 6]
8:7F5F  666805045518         push 0x18550405
8:7F65  666a00               push 0
8:7F68  6a00                 push 0
8:7F6A  9a827f0000           lcall 0, 0x7f82  ; USER.SendDlgItemMessage
8:7F6F  c45e06               les bx, ptr [bp + 6]
8:7F72  26ff7706             push word ptr es:[bx + 6]
8:7F76  666805045618         push 0x18560405
8:7F7C  666a00               push 0
8:7F7F  6a00                 push 0
8:7F81  9aa57f0000           lcall 0, 0x7fa5  ; USER.SendDlgItemMessage
8:7F86  66ff7606             push dword ptr [bp + 6]
8:7F8A  90                   nop
8:7F8B  0e                   push cs
8:7F8C  e8db00               call 0x806a  ; sub_s8:806A
loc_7F8F:
8:7F8F  c45e06               les bx, ptr [bp + 6]
8:7F92  26ff7706             push word ptr es:[bx + 6]
8:7F96  66680b005418         push 0x1854000b
8:7F9C  666800000100         push 0x10000
8:7FA2  6a00                 push 0
8:7FA4  9affff0000           lcall 0, 0xffff  ; USER.SendDlgItemMessage
8:7FA9  c9                   leave
8:7FAA  ca0400               retf 4
8:7FAD  db 00

; ---------------- sub_s8:7FAE FAR size=108 callers=1
;   apis: USER.SendDlgItemMessage
8:7FAE  55                   push bp
8:7FAF  8bec                 mov bp, sp
8:7FB1  c45e06               les bx, ptr [bp + 6]
8:7FB4  6626ffb79400         push dword ptr es:[bx + 0x94]
8:7FBA  9a46b10280           lcall 0x8002, 0xb146  ; sub_s2:B146
8:7FBF  c45e06               les bx, ptr [bp + 6]
8:7FC2  26ff7706             push word ptr es:[bx + 6]
8:7FC6  666807045518         push 0x18550407
8:7FCC  66680000ffff         push 0xffff0000
8:7FD2  6a00                 push 0
8:7FD4  9aef7f0000           lcall 0, 0x7fef  ; USER.SendDlgItemMessage
8:7FD9  c45e06               les bx, ptr [bp + 6]
8:7FDC  26ff7706             push word ptr es:[bx + 6]
8:7FE0  666807045618         push 0x18560407
8:7FE6  66680000ffff         push 0xffff0000
8:7FEC  6a00                 push 0
8:7FEE  9aec7e0000           lcall 0, 0x7eec  ; USER.SendDlgItemMessage
8:7FF3  666a00               push 0
8:7FF6  c45e06               les bx, ptr [bp + 6]
8:7FF9  6626ffb79400         push dword ptr es:[bx + 0x94]
8:7FFF  9a1ab61380           lcall 0x8013, 0xb61a  ; sub_s2:B61A
8:8004  666a00               push 0
8:8007  c45e06               les bx, ptr [bp + 6]
8:800A  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8010  9a3ab6d77e           lcall 0x7ed7, 0xb63a  ; sub_s2:B63A
8:8015  c9                   leave
8:8016  ca0400               retf 4
8:8019  db 00

; ---------------- sub_s8:801A FAR size=80 callers=1
8:801A  c80e0000             enter 0xe, 0
8:801E  6a30                 push 0x30
8:8020  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:8025  9aba205080           lcall 0x8050, 0x20ba  ; sub_s3:20BA
8:802A  8946fc               mov word ptr [bp - 4], ax
8:802D  8956fe               mov word ptr [bp - 2], dx
8:8030  c45e06               les bx, ptr [bp + 6]
8:8033  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8039  9a40b3bd7f           lcall 0x7fbd, 0xb340  ; sub_s2:B340
8:803E  8956fa               mov word ptr [bp - 6], dx
8:8041  0bd0                 or dx, ax
8:8043  7420                 je 0x8065
8:8045  ff76fa               push word ptr [bp - 6]
8:8048  50                   push ax
8:8049  66ff76fc             push dword ptr [bp - 4]
8:804D  9a7037ba7e           lcall 0x7eba, 0x3770  ; sub_s3:3770
8:8052  6a03                 push 3
8:8054  c45e06               les bx, ptr [bp + 6]
8:8057  26ff7706             push word ptr es:[bx + 6]
8:805B  66ff367c5b           push dword ptr [0x5b7c]
8:8060  90                   nop
8:8061  0e                   push cs
8:8062  e8db2e               call 0xaf40  ; sub_s8:AF40
loc_8065:
8:8065  c9                   leave
8:8066  ca0400               retf 4
8:8069  db 00

; ---------------- sub_s8:806A FAR size=250 callers=2
;   apis: USER.EnableWindow, USER.GetDlgItem
8:806A  c8100000             enter 0x10, 0
8:806E  c45e06               les bx, ptr [bp + 6]
8:8071  26ff7706             push word ptr es:[bx + 6]
8:8075  6a01                 push 1
8:8077  9a8f800000           lcall 0, 0x808f  ; USER.GetDlgItem
8:807C  50                   push ax
8:807D  6a00                 push 0
8:807F  9a97800000           lcall 0, 0x8097  ; USER.EnableWindow
8:8084  c45e06               les bx, ptr [bp + 6]
8:8087  26ff7706             push word ptr es:[bx + 6]
8:808B  685818               push 0x1858
8:808E  9aa6800000           lcall 0, 0x80a6  ; USER.GetDlgItem
8:8093  50                   push ax
8:8094  6a00                 push 0
8:8096  9aae800000           lcall 0, 0x80ae  ; USER.EnableWindow
8:809B  c45e06               les bx, ptr [bp + 6]
8:809E  26ff7706             push word ptr es:[bx + 6]
8:80A2  685918               push 0x1859  ; '650.bmp'
8:80A5  9a1e810000           lcall 0, 0x811e  ; USER.GetDlgItem
8:80AA  50                   push ax
8:80AB  6a00                 push 0
8:80AD  9a26810000           lcall 0, 0x8126  ; USER.EnableWindow
8:80B2  c45e06               les bx, ptr [bp + 6]
8:80B5  6626ffb79400         push dword ptr es:[bx + 0x94]
8:80BB  9a20b8d280           lcall 0x80d2, 0xb820  ; sub_s2:B820
8:80C0  0bd0                 or dx, ax
8:80C2  0f849900             je 0x815f
8:80C6  c45e06               les bx, ptr [bp + 6]
8:80C9  6626ffb79400         push dword ptr es:[bx + 0x94]
8:80CF  9a40b3e680           lcall 0x80e6, 0xb340  ; sub_s2:B340
8:80D4  8946f8               mov word ptr [bp - 8], ax
8:80D7  8956fa               mov word ptr [bp - 6], dx
8:80DA  c45e06               les bx, ptr [bp + 6]
8:80DD  6626ffb79400         push dword ptr es:[bx + 0x94]
8:80E3  9a66b3fa80           lcall 0x80fa, 0xb366  ; sub_s2:B366
8:80E8  8946f4               mov word ptr [bp - 0xc], ax
8:80EB  8956f6               mov word ptr [bp - 0xa], dx
8:80EE  c45e06               les bx, ptr [bp + 6]
8:80F1  6626ffb79400         push dword ptr es:[bx + 0x94]
8:80F7  9a7ab43c80           lcall 0x803c, 0xb47a  ; sub_s2:B47A
8:80FC  8946f0               mov word ptr [bp - 0x10], ax
8:80FF  66837ef800           cmp dword ptr [bp - 8], 0
8:8104  743b                 je 0x8141
8:8106  66837ef400           cmp dword ptr [bp - 0xc], 0
8:810B  7434                 je 0x8141
8:810D  8bc2                 mov ax, dx
8:810F  0b46f0               or ax, word ptr [bp - 0x10]
8:8112  742d                 je 0x8141
8:8114  c45e06               les bx, ptr [bp + 6]
8:8117  26ff7706             push word ptr es:[bx + 6]
8:811B  6a01                 push 1
8:811D  9a35810000           lcall 0, 0x8135  ; USER.GetDlgItem
8:8122  50                   push ax
8:8123  6a01                 push 1
8:8125  9a3d810000           lcall 0, 0x813d  ; USER.EnableWindow
8:812A  c45e06               les bx, ptr [bp + 6]
8:812D  26ff7706             push word ptr es:[bx + 6]
8:8131  685818               push 0x1858
8:8134  9a53810000           lcall 0, 0x8153  ; USER.GetDlgItem
8:8139  50                   push ax
8:813A  6a01                 push 1
8:813C  9a5b810000           lcall 0, 0x815b  ; USER.EnableWindow
loc_8141:
8:8141  66837ef800           cmp dword ptr [bp - 8], 0
8:8146  7417                 je 0x815f
8:8148  c45e06               les bx, ptr [bp + 6]
8:814B  26ff7706             push word ptr es:[bx + 6]
8:814F  685918               push 0x1859  ; '650.bmp'
8:8152  9affff0000           lcall 0, 0xffff  ; USER.GetDlgItem
8:8157  50                   push ax
8:8158  6a01                 push 1
8:815A  9affff0000           lcall 0, 0xffff  ; USER.EnableWindow
loc_815F:
8:815F  c9                   leave
8:8160  ca0400               retf 4
8:8163  db 00

; ---------------- sub_s8:8164 FAR size=90 callers=4
;   apis: USER.SendDlgItemMessage
8:8164  c8040000             enter 4, 0
8:8168  c45e0a               les bx, ptr [bp + 0xa]
8:816B  26c60700             mov byte ptr es:[bx], 0
8:816F  c45e06               les bx, ptr [bp + 6]
8:8172  26ff7706             push word ptr es:[bx + 6]
8:8176  ff760e               push word ptr [bp + 0xe]
8:8179  666800000904         push 0x4090000
8:817F  666a00               push 0
8:8182  9aa3810000           lcall 0, 0x81a3  ; USER.SendDlgItemMessage
8:8187  3dffff               cmp ax, 0xffff
8:818A  7504                 jne 0x8190
8:818C  3bd0                 cmp dx, ax
8:818E  7428                 je 0x81b8
loc_8190:
8:8190  c45e06               les bx, ptr [bp + 6]
8:8193  26ff7706             push word ptr es:[bx + 6]
8:8197  ff760e               push word ptr [bp + 0xe]
8:819A  680a04               push 0x40a
8:819D  50                   push ax
8:819E  66ff760a             push dword ptr [bp + 0xa]
8:81A2  9ad57f0000           lcall 0, 0x7fd5  ; USER.SendDlgItemMessage
8:81A7  3dffff               cmp ax, 0xffff
8:81AA  7504                 jne 0x81b0
8:81AC  3bd0                 cmp dx, ax
8:81AE  7408                 je 0x81b8
loc_81B0:
8:81B0  b80100               mov ax, 1
8:81B3  c9                   leave
8:81B4  ca0a00               retf 0xa
8:81B7  db 90
loc_81B8:
8:81B8  33c0                 xor ax, ax
8:81BA  c9                   leave
8:81BB  ca0a00               retf 0xa

; ---------------- sub_s8:81BE FAR size=410 callers=1
;   apis: USER.MessageBox
8:81BE  c8100200             enter 0x210, 0
8:81C2  680010               push 0x1000
8:81C5  9a9c172482           lcall 0x8224, 0x179c  ; operator_new@s1:179C
8:81CA  83c402               add sp, 2
8:81CD  8986f8fd             mov word ptr [bp - 0x208], ax
8:81D1  8996fafd             mov word ptr [bp - 0x206], dx
8:81D5  687b05               push 0x57b
8:81D8  8d86fcfd             lea ax, [bp - 0x204]
8:81DC  16                   push ss
8:81DD  50                   push ax
8:81DE  68ff03               push 0x3ff
8:81E1  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:81E6  9ae084fe81           lcall 0x81fe, 0x84e0  ; sub_s3:84E0
8:81EB  680b08               push 0x80b
8:81EE  66ffb6f8fd           push dword ptr [bp - 0x208]
8:81F3  68ff03               push 0x3ff
8:81F6  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:81FB  9ae0841482           lcall 0x8214, 0x84e0  ; sub_s3:84E0
8:8200  680c08               push 0x80c
8:8203  8d86fefe             lea ax, [bp - 0x102]
8:8207  16                   push ss
8:8208  50                   push ax
8:8209  68ff03               push 0x3ff
8:820C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8211  9ae0843d82           lcall 0x823d, 0x84e0  ; sub_s3:84E0
8:8216  8d86fefe             lea ax, [bp - 0x102]
8:821A  16                   push ss
8:821B  50                   push ax
8:821C  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8221  9aea3c4d82           lcall 0x824d, 0x3cea  ; sub_s1:3CEA
8:8226  83c408               add sp, 8
8:8229  680d08               push 0x80d
8:822C  8d86fefe             lea ax, [bp - 0x102]
8:8230  16                   push ss
8:8231  50                   push ax
8:8232  68ff03               push 0x3ff
8:8235  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:823A  9ae0846682           lcall 0x8266, 0x84e0  ; sub_s3:84E0
8:823F  8d86fefe             lea ax, [bp - 0x102]
8:8243  16                   push ss
8:8244  50                   push ax
8:8245  66ffb6f8fd           push dword ptr [bp - 0x208]
8:824A  9aea3c7682           lcall 0x8276, 0x3cea  ; sub_s1:3CEA
8:824F  83c408               add sp, 8
8:8252  680e08               push 0x80e
8:8255  8d86fefe             lea ax, [bp - 0x102]
8:8259  16                   push ss
8:825A  50                   push ax
8:825B  68ff03               push 0x3ff
8:825E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8263  9ae0848f82           lcall 0x828f, 0x84e0  ; sub_s3:84E0
8:8268  8d86fefe             lea ax, [bp - 0x102]
8:826C  16                   push ss
8:826D  50                   push ax
8:826E  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8273  9aea3c9f82           lcall 0x829f, 0x3cea  ; sub_s1:3CEA
8:8278  83c408               add sp, 8
8:827B  680f08               push 0x80f
8:827E  8d86fefe             lea ax, [bp - 0x102]
8:8282  16                   push ss
8:8283  50                   push ax
8:8284  68ff03               push 0x3ff
8:8287  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:828C  9ae084d082           lcall 0x82d0, 0x84e0  ; sub_s3:84E0
8:8291  8d86fefe             lea ax, [bp - 0x102]
8:8295  16                   push ss
8:8296  50                   push ax
8:8297  66ffb6f8fd           push dword ptr [bp - 0x208]
8:829C  9aea3cf682           lcall 0x82f6, 0x3cea  ; sub_s1:3CEA
8:82A1  83c408               add sp, 8
8:82A4  c45e06               les bx, ptr [bp + 6]
8:82A7  26ff7706             push word ptr es:[bx + 6]
8:82AB  66ffb6f8fd           push dword ptr [bp - 0x208]
8:82B0  8d86fcfd             lea ax, [bp - 0x204]
8:82B4  16                   push ss
8:82B5  50                   push ax
8:82B6  6a00                 push 0
8:82B8  9a39830000           lcall 0, 0x8339  ; USER.MessageBox
8:82BD  681008               push 0x810
8:82C0  66ffb6f8fd           push dword ptr [bp - 0x208]
8:82C5  68ff03               push 0x3ff
8:82C8  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:82CD  9ae084e682           lcall 0x82e6, 0x84e0  ; sub_s3:84E0
8:82D2  681108               push 0x811
8:82D5  8d86fefe             lea ax, [bp - 0x102]
8:82D9  16                   push ss
8:82DA  50                   push ax
8:82DB  68ff03               push 0x3ff
8:82DE  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:82E3  9ae0840f83           lcall 0x830f, 0x84e0  ; sub_s3:84E0
8:82E8  8d86fefe             lea ax, [bp - 0x102]
8:82EC  16                   push ss
8:82ED  50                   push ax
8:82EE  66ffb6f8fd           push dword ptr [bp - 0x208]
8:82F3  9aea3c1f83           lcall 0x831f, 0x3cea  ; sub_s1:3CEA
8:82F8  83c408               add sp, 8
8:82FB  681208               push 0x812
8:82FE  8d86fefe             lea ax, [bp - 0x102]
8:8302  16                   push ss
8:8303  50                   push ax
8:8304  68ff03               push 0x3ff
8:8307  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:830C  9ae0842880           lcall 0x8028, 0x84e0  ; sub_s3:84E0
8:8311  8d86fefe             lea ax, [bp - 0x102]
8:8315  16                   push ss
8:8316  50                   push ax
8:8317  66ffb6f8fd           push dword ptr [bp - 0x208]
8:831C  9aea3c5183           lcall 0x8351, 0x3cea  ; sub_s1:3CEA
8:8321  83c408               add sp, 8
8:8324  c45e06               les bx, ptr [bp + 6]
8:8327  26ff7706             push word ptr es:[bx + 6]
8:832B  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8330  8d86fcfd             lea ax, [bp - 0x204]
8:8334  16                   push ss
8:8335  50                   push ax
8:8336  6a00                 push 0
8:8338  9affff0000           lcall 0, 0xffff  ; USER.MessageBox
8:833D  668b86f8fd           mov eax, dword ptr [bp - 0x208]
8:8342  668986f4fd           mov dword ptr [bp - 0x20c], eax
8:8347  668986f0fd           mov dword ptr [bp - 0x210], eax
8:834C  6650                 push eax
8:834E  9ace174b7c           lcall 0x7c4b, 0x17ce  ; operator_delete@s1:17CE
8:8353  c9                   leave
8:8354  ca0400               retf 4
8:8357  db 00

; ---------------- sub_s8:8358 FAR size=168 callers=2
;   apis: USER.GetDlgItem, USER.SetWindowText
8:8358  c8080300             enter 0x308, 0
8:835C  c45e06               les bx, ptr [bp + 6]
8:835F  26ff7706             push word ptr es:[bx + 6]
8:8363  685718               push 0x1857
8:8366  9a78800000           lcall 0, 0x8078  ; USER.GetDlgItem
8:836B  8946fe               mov word ptr [bp - 2], ax
8:836E  c45e06               les bx, ptr [bp + 6]
8:8371  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8377  9a20b8dc83           lcall 0x83dc, 0xb820  ; sub_s2:B820
8:837C  8946fa               mov word ptr [bp - 6], ax
8:837F  8956fc               mov word ptr [bp - 4], dx
8:8382  0bd0                 or dx, ax
8:8384  7528                 jne 0x83ae
8:8386  684904               push 0x449
8:8389  8d86f8fc             lea ax, [bp - 0x308]
8:838D  16                   push ss
8:838E  50                   push ax
8:838F  680001               push 0x100
8:8392  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8397  9ae084f483           lcall 0x83f4, 0x84e0  ; sub_s3:84E0
8:839C  ff76fe               push word ptr [bp - 2]
8:839F  8d86f8fc             lea ax, [bp - 0x308]
loc_83A3:
8:83A3  16                   push ss
8:83A4  50                   push ax
8:83A5  9affff0000           lcall 0, 0xffff  ; USER.SetWindowText
8:83AA  c9                   leave
8:83AB  ca0400               retf 4
loc_83AE:
8:83AE  685418               push 0x1854
8:83B1  8d86fafe             lea ax, [bp - 0x106]
8:83B5  16                   push ss
8:83B6  50                   push ax
8:83B7  66ff7606             push dword ptr [bp + 6]
8:83BB  90                   nop
8:83BC  0e                   push cs
8:83BD  e8a4fd               call 0x8164  ; sub_s8:8164
8:83C0  0bc0                 or ax, ax
8:83C2  741c                 je 0x83e0
8:83C4  8d86fafe             lea ax, [bp - 0x106]
8:83C8  16                   push ss
8:83C9  50                   push ax
8:83CA  8d86fafd             lea ax, [bp - 0x206]
8:83CE  16                   push ss
8:83CF  50                   push ax
8:83D0  c45e06               les bx, ptr [bp + 6]
8:83D3  6626ffb79400         push dword ptr es:[bx + 0x94]
8:83D9  9a5ab6be80           lcall 0x80be, 0xb65a  ; sub_s2:B65A
8:83DE  eb16                 jmp 0x83f6
loc_83E0:
8:83E0  684704               push 0x447
8:83E3  8d86fafd             lea ax, [bp - 0x206]
8:83E7  16                   push ss
8:83E8  50                   push ax
8:83E9  680001               push 0x100
8:83EC  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:83F1  9ae084e981           lcall 0x81e9, 0x84e0  ; sub_s3:84E0
loc_83F6:
8:83F6  ff76fe               push word ptr [bp - 2]
8:83F9  8d86fafd             lea ax, [bp - 0x206]
8:83FD  eba4                 jmp 0x83a3
8:83FF  db 00

; ---------------- sub_s8:8400 FAR size=74 callers=2
;   apis: USER.SendDlgItemMessage
8:8400  c80c0000             enter 0xc, 0
8:8404  66ff760a             push dword ptr [bp + 0xa]
8:8408  8d46f8               lea ax, [bp - 8]
8:840B  16                   push ss
8:840C  50                   push ax
8:840D  9a84571a84           lcall 0x841a, 0x5784  ; ListIter::ListIter@s2:5784
loc_8412:
8:8412  8d46f8               lea ax, [bp - 8]
8:8415  16                   push ss
8:8416  50                   push ax
8:8417  9a125b7a83           lcall 0x837a, 0x5b12  ; ListIter::next@s2:5B12
8:841C  8946f4               mov word ptr [bp - 0xc], ax
8:841F  8956f6               mov word ptr [bp - 0xa], dx
8:8422  0bd0                 or dx, ax
8:8424  7420                 je 0x8446
8:8426  c45e06               les bx, ptr [bp + 6]
8:8429  26ff7706             push word ptr es:[bx + 6]
8:842D  ff760e               push word ptr [bp + 0xe]
8:8430  666800000104         push 0x4010000
8:8436  c45ef4               les bx, ptr [bp - 0xc]
8:8439  6626ff7704           push dword ptr es:[bx + 4]
8:843E  9a83810000           lcall 0, 0x8183  ; USER.SendDlgItemMessage
8:8443  ebcd                 jmp 0x8412
8:8445  db 90
loc_8446:
8:8446  c9                   leave
8:8447  ca0a00               retf 0xa

; ---------------- sub_s8:844A FAR size=462 callers=2
;   apis: USER.GetDlgItem, USER.SendDlgItemMessage, USER.SetWindowText
8:844A  c8080100             enter 0x108, 0
8:844E  c45e06               les bx, ptr [bp + 6]
8:8451  26ff7706             push word ptr es:[bx + 6]
8:8455  66680b005418         push 0x1854000b
8:845B  666a00               push 0
8:845E  6a00                 push 0
8:8460  9a78840000           lcall 0, 0x8478  ; USER.SendDlgItemMessage
8:8465  c45e06               les bx, ptr [bp + 6]
8:8468  26ff7706             push word ptr es:[bx + 6]
8:846C  66680b005518         push 0x1855000b
8:8472  666a00               push 0
8:8475  6a00                 push 0
8:8477  9a8f840000           lcall 0, 0x848f  ; USER.SendDlgItemMessage
8:847C  c45e06               les bx, ptr [bp + 6]
8:847F  26ff7706             push word ptr es:[bx + 6]
8:8483  66680b005618         push 0x1856000b
8:8489  666a00               push 0
8:848C  6a00                 push 0
8:848E  9aa6840000           lcall 0, 0x84a6  ; USER.SendDlgItemMessage
8:8493  c45e06               les bx, ptr [bp + 6]
8:8496  26ff7706             push word ptr es:[bx + 6]
8:849A  666805045418         push 0x18540405
8:84A0  666a00               push 0
8:84A3  6a00                 push 0
8:84A5  9abd840000           lcall 0, 0x84bd  ; USER.SendDlgItemMessage
8:84AA  c45e06               les bx, ptr [bp + 6]
8:84AD  26ff7706             push word ptr es:[bx + 6]
8:84B1  666805045518         push 0x18550405
8:84B7  666a00               push 0
8:84BA  6a00                 push 0
8:84BC  9ad4840000           lcall 0, 0x84d4  ; USER.SendDlgItemMessage
8:84C1  c45e06               les bx, ptr [bp + 6]
8:84C4  26ff7706             push word ptr es:[bx + 6]
8:84C8  666805045618         push 0x18560405
8:84CE  666a00               push 0
8:84D1  6a00                 push 0
8:84D3  9a1e850000           lcall 0, 0x851e  ; USER.SendDlgItemMessage
8:84D8  c45e06               les bx, ptr [bp + 6]
8:84DB  6626ffb79400         push dword ptr es:[bx + 0x94]
8:84E1  9a20b81084           lcall 0x8410, 0xb820  ; sub_s2:B820
8:84E6  8946fc               mov word ptr [bp - 4], ax
8:84E9  8956fe               mov word ptr [bp - 2], dx
8:84EC  0bd0                 or dx, ax
8:84EE  0f85ba00             jne 0x85ac
8:84F2  684804               push 0x448
8:84F5  8d86fafe             lea ax, [bp - 0x106]
8:84F9  16                   push ss
8:84FA  50                   push ax
8:84FB  680001               push 0x100
8:84FE  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8503  9ae0849785           lcall 0x8597, 0x84e0  ; sub_s3:84E0
8:8508  c45e06               les bx, ptr [bp + 6]
8:850B  26ff7706             push word ptr es:[bx + 6]
8:850F  666801045418         push 0x18540401
8:8515  6a00                 push 0
8:8517  8d86fafe             lea ax, [bp - 0x106]
8:851B  16                   push ss
8:851C  50                   push ax
8:851D  9a38850000           lcall 0, 0x8538  ; USER.SendDlgItemMessage
8:8522  c45e06               les bx, ptr [bp + 6]
8:8525  26ff7706             push word ptr es:[bx + 6]
8:8529  66680b005418         push 0x1854000b
8:852F  666800000100         push 0x10000
8:8535  6a00                 push 0
8:8537  9a52850000           lcall 0, 0x8552  ; USER.SendDlgItemMessage
8:853C  c45e06               les bx, ptr [bp + 6]
8:853F  26ff7706             push word ptr es:[bx + 6]
8:8543  66680b005518         push 0x1855000b
8:8549  666800000100         push 0x10000
8:854F  6a00                 push 0
8:8551  9a6c850000           lcall 0, 0x856c  ; USER.SendDlgItemMessage
8:8556  c45e06               les bx, ptr [bp + 6]
8:8559  26ff7706             push word ptr es:[bx + 6]
8:855D  66680b005618         push 0x1856000b
8:8563  666800000100         push 0x10000
8:8569  6a00                 push 0
8:856B  9adb850000           lcall 0, 0x85db  ; USER.SendDlgItemMessage
8:8570  c45e06               les bx, ptr [bp + 6]
8:8573  26ff7706             push word ptr es:[bx + 6]
8:8577  685718               push 0x1857
8:857A  9a67830000           lcall 0, 0x8367  ; USER.GetDlgItem
8:857F  8986f8fe             mov word ptr [bp - 0x108], ax
8:8583  684904               push 0x449
8:8586  8d86fafe             lea ax, [bp - 0x106]
8:858A  16                   push ss
8:858B  50                   push ax
8:858C  680001               push 0x100
8:858F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8594  9ae0849a83           lcall 0x839a, 0x84e0  ; sub_s3:84E0
8:8599  ffb6f8fe             push word ptr [bp - 0x108]
8:859D  8d86fafe             lea ax, [bp - 0x106]
8:85A1  16                   push ss
8:85A2  50                   push ax
8:85A3  9aa6830000           lcall 0, 0x83a6  ; USER.SetWindowText
8:85A8  c9                   leave
8:85A9  ca0400               retf 4
loc_85AC:
8:85AC  685418               push 0x1854
8:85AF  ff76fe               push word ptr [bp - 2]
8:85B2  50                   push ax
8:85B3  66ff7606             push dword ptr [bp + 6]
8:85B7  90                   nop
8:85B8  0e                   push cs
8:85B9  e844fe               call 0x8400  ; sub_s8:8400
8:85BC  66ff7606             push dword ptr [bp + 6]
8:85C0  90                   nop
8:85C1  0e                   push cs
8:85C2  e893fd               call 0x8358  ; sub_s8:8358
8:85C5  c45e06               les bx, ptr [bp + 6]
8:85C8  26ff7706             push word ptr es:[bx + 6]
8:85CC  66680b005418         push 0x1854000b
8:85D2  666800000100         push 0x10000
8:85D8  6a00                 push 0
8:85DA  9af5850000           lcall 0, 0x85f5  ; USER.SendDlgItemMessage
8:85DF  c45e06               les bx, ptr [bp + 6]
8:85E2  26ff7706             push word ptr es:[bx + 6]
8:85E6  66680b005518         push 0x1855000b
8:85EC  666800000100         push 0x10000
8:85F2  6a00                 push 0
8:85F4  9a0f860000           lcall 0, 0x860f  ; USER.SendDlgItemMessage
8:85F9  c45e06               les bx, ptr [bp + 6]
8:85FC  26ff7706             push word ptr es:[bx + 6]
8:8600  66680b005618         push 0x1856000b
8:8606  666800000100         push 0x10000
8:860C  6a00                 push 0
8:860E  9a3f840000           lcall 0, 0x843f  ; USER.SendDlgItemMessage
8:8613  c9                   leave
8:8614  ca0400               retf 4
8:8617  db 00

; ---------------- sub_s8:8618 FAR size=410 callers=1
;   apis: USER.SendDlgItemMessage
8:8618  c8100100             enter 0x110, 0
8:861C  c45e06               les bx, ptr [bp + 6]
8:861F  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8625  9a20b8bc86           lcall 0x86bc, 0xb820  ; sub_s2:B820
8:862A  8946fc               mov word ptr [bp - 4], ax
8:862D  8956fe               mov word ptr [bp - 2], dx
8:8630  0bd0                 or dx, ax
8:8632  0f847801             je 0x87ae
8:8636  685418               push 0x1854
8:8639  8d86fcfe             lea ax, [bp - 0x104]
8:863D  16                   push ss
8:863E  50                   push ax
8:863F  66ff7606             push dword ptr [bp + 6]
8:8643  90                   nop
8:8644  0e                   push cs
8:8645  e81cfb               call 0x8164  ; sub_s8:8164
8:8648  0bc0                 or ax, ax
8:864A  0f846001             je 0x87ae
8:864E  c45e06               les bx, ptr [bp + 6]
8:8651  26ff7706             push word ptr es:[bx + 6]
8:8655  66680b005518         push 0x1855000b
8:865B  666a00               push 0
8:865E  6a00                 push 0
8:8660  9a78860000           lcall 0, 0x8678  ; USER.SendDlgItemMessage
8:8665  c45e06               les bx, ptr [bp + 6]
8:8668  26ff7706             push word ptr es:[bx + 6]
8:866C  66680b005618         push 0x1856000b
8:8672  666a00               push 0
8:8675  6a00                 push 0
8:8677  9a8f860000           lcall 0, 0x868f  ; USER.SendDlgItemMessage
8:867C  c45e06               les bx, ptr [bp + 6]
8:867F  26ff7706             push word ptr es:[bx + 6]
8:8683  666805045518         push 0x18550405
8:8689  666a00               push 0
8:868C  6a00                 push 0
8:868E  9aa6860000           lcall 0, 0x86a6  ; USER.SendDlgItemMessage
8:8693  c45e06               les bx, ptr [bp + 6]
8:8696  26ff7706             push word ptr es:[bx + 6]
8:869A  666805045618         push 0x18560405
8:86A0  666a00               push 0
8:86A3  6a00                 push 0
8:86A5  9a18870000           lcall 0, 0x8718  ; USER.SendDlgItemMessage
8:86AA  8d86fcfe             lea ax, [bp - 0x104]
8:86AE  16                   push ss
8:86AF  50                   push ax
8:86B0  c45e06               les bx, ptr [bp + 6]
8:86B3  6626ffb79400         push dword ptr es:[bx + 0x94]
8:86B9  9aa0b4ca86           lcall 0x86ca, 0xb4a0  ; sub_s2:B4A0
8:86BE  c45e06               les bx, ptr [bp + 6]
8:86C1  6626ffb79400         push dword ptr es:[bx + 0x94]
8:86C7  9a00b2f586           lcall 0x86f5, 0xb200  ; sub_s2:B200
8:86CC  8986f8fe             mov word ptr [bp - 0x108], ax
8:86D0  8996fafe             mov word ptr [bp - 0x106], dx
8:86D4  0bd0                 or dx, ax
8:86D6  7444                 je 0x871c
8:86D8  685518               push 0x1855
8:86DB  ffb6fafe             push word ptr [bp - 0x106]
8:86DF  50                   push ax
8:86E0  66ff7606             push dword ptr [bp + 6]
8:86E4  90                   nop
8:86E5  0e                   push cs
8:86E6  e817fd               call 0x8400  ; sub_s8:8400
8:86E9  c45e06               les bx, ptr [bp + 6]
8:86EC  6626ffb79400         push dword ptr es:[bx + 0x94]
8:86F2  9a66b32887           lcall 0x8728, 0xb366  ; sub_s2:B366
8:86F7  8986f0fe             mov word ptr [bp - 0x110], ax
8:86FB  8996f2fe             mov word ptr [bp - 0x10e], dx
8:86FF  0bd0                 or dx, ax
8:8701  7419                 je 0x871c
8:8703  c45e06               les bx, ptr [bp + 6]
8:8706  26ff7706             push word ptr es:[bx + 6]
8:870A  66680d045518         push 0x1855040d
8:8710  6aff                 push -1
8:8712  ffb6f2fe             push word ptr [bp - 0x10e]
8:8716  50                   push ax
8:8717  9a76870000           lcall 0, 0x8776  ; USER.SendDlgItemMessage
loc_871C:
8:871C  c45e06               les bx, ptr [bp + 6]
8:871F  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8725  9a8cb35387           lcall 0x8753, 0xb38c  ; sub_s2:B38C
8:872A  8986f4fe             mov word ptr [bp - 0x10c], ax
8:872E  8996f6fe             mov word ptr [bp - 0x10a], dx
8:8732  0bd0                 or dx, ax
8:8734  7444                 je 0x877a
8:8736  685618               push 0x1856
8:8739  ffb6f6fe             push word ptr [bp - 0x10a]
8:873D  50                   push ax
8:873E  66ff7606             push dword ptr [bp + 6]
8:8742  90                   nop
8:8743  0e                   push cs
8:8744  e8b9fc               call 0x8400  ; sub_s8:8400
8:8747  c45e06               les bx, ptr [bp + 6]
8:874A  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8750  9a7ab4e484           lcall 0x84e4, 0xb47a  ; sub_s2:B47A
8:8755  8986f0fe             mov word ptr [bp - 0x110], ax
8:8759  8996f2fe             mov word ptr [bp - 0x10e], dx
8:875D  0bd0                 or dx, ax
8:875F  7419                 je 0x877a
8:8761  c45e06               les bx, ptr [bp + 6]
8:8764  26ff7706             push word ptr es:[bx + 6]
8:8768  66680d045618         push 0x1856040d
8:876E  6aff                 push -1
8:8770  ffb6f2fe             push word ptr [bp - 0x10e]
8:8774  50                   push ax
8:8775  9a90870000           lcall 0, 0x8790  ; USER.SendDlgItemMessage
loc_877A:
8:877A  c45e06               les bx, ptr [bp + 6]
8:877D  26ff7706             push word ptr es:[bx + 6]
8:8781  66680b005518         push 0x1855000b
8:8787  666800000100         push 0x10000
8:878D  6a00                 push 0
8:878F  9aaa870000           lcall 0, 0x87aa  ; USER.SendDlgItemMessage
8:8794  c45e06               les bx, ptr [bp + 6]
8:8797  26ff7706             push word ptr es:[bx + 6]
8:879B  66680b005618         push 0x1856000b
8:87A1  666800000100         push 0x10000
8:87A7  6a00                 push 0
8:87A9  9a61840000           lcall 0, 0x8461  ; USER.SendDlgItemMessage
loc_87AE:
8:87AE  c9                   leave
8:87AF  ca0400               retf 4

; ---------------- sub_s8:87B2 FAR size=94 callers=1
;   apis: USER.SendDlgItemMessage
8:87B2  c8040100             enter 0x104, 0
8:87B6  685518               push 0x1855
8:87B9  8d8600ff             lea ax, [bp - 0x100]
8:87BD  16                   push ss
8:87BE  50                   push ax
8:87BF  66ff7606             push dword ptr [bp + 6]
8:87C3  90                   nop
8:87C4  0e                   push cs
8:87C5  e89cf9               call 0x8164  ; sub_s8:8164
8:87C8  0bc0                 or ax, ax
8:87CA  7440                 je 0x880c
8:87CC  8d8600ff             lea ax, [bp - 0x100]
8:87D0  16                   push ss
8:87D1  50                   push ax
8:87D2  c45e06               les bx, ptr [bp + 6]
8:87D5  6626ffb79400         push dword ptr es:[bx + 0x94]
8:87DB  9a1ab6ec87           lcall 0x87ec, 0xb61a  ; sub_s2:B61A
8:87E0  c45e06               les bx, ptr [bp + 6]
8:87E3  6626ffb79400         push dword ptr es:[bx + 0x94]
8:87E9  9af0b12886           lcall 0x8628, 0xb1f0  ; sub_s2:B1F0
8:87EE  8986fcfe             mov word ptr [bp - 0x104], ax
8:87F2  8996fefe             mov word ptr [bp - 0x102], dx
8:87F6  c45e06               les bx, ptr [bp + 6]
8:87F9  26ff7706             push word ptr es:[bx + 6]
8:87FD  66680d045618         push 0x1856040d
8:8803  6aff                 push -1
8:8805  52                   push dx
8:8806  50                   push ax
8:8807  9a61860000           lcall 0, 0x8661  ; USER.SendDlgItemMessage
loc_880C:
8:880C  c9                   leave
8:880D  ca0400               retf 4

; ---------------- sub_s8:8810 FAR size=50 callers=1
8:8810  c8000100             enter 0x100, 0
8:8814  685618               push 0x1856
8:8817  8d8600ff             lea ax, [bp - 0x100]
8:881B  16                   push ss
8:881C  50                   push ax
8:881D  66ff7606             push dword ptr [bp + 6]
8:8821  90                   nop
8:8822  0e                   push cs
8:8823  e83ef9               call 0x8164  ; sub_s8:8164
8:8826  0bc0                 or ax, ax
8:8828  7414                 je 0x883e
8:882A  8d8600ff             lea ax, [bp - 0x100]
8:882E  16                   push ss
8:882F  50                   push ax
8:8830  c45e06               les bx, ptr [bp + 6]
8:8833  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8839  9a3ab6de87           lcall 0x87de, 0xb63a  ; sub_s2:B63A
loc_883E:
8:883E  c9                   leave
8:883F  ca0400               retf 4

; ---------------- sub_s8:8842 FAR size=6 callers=0
8:8842  33c0                 xor ax, ax
8:8844  ca0400               retf 4
8:8847  db 00

; ---------------- sub_s8:8848 FAR size=4 callers=0
8:8848  ca0400               retf 4
8:884B  db 00

; ---------------- sub_s8:884C FAR size=4 callers=0
8:884C  ca0400               retf 4
8:884F  db 00

; ---------------- sub_s8:8850 FAR size=162 callers=0
8:8850  55                   push bp
8:8851  8bec                 mov bp, sp
8:8853  66ff7606             push dword ptr [bp + 6]
8:8857  90                   nop
8:8858  0e                   push cs
8:8859  e800f5               call 0x7d5c  ; sub_s8:7D5C
8:885C  f6460a01             test byte ptr [bp + 0xa], 1
8:8860  7409                 je 0x886b
8:8862  66ff7606             push dword ptr [bp + 6]
8:8866  9ace17c881           lcall 0x81c8, 0x17ce  ; operator_delete@s1:17CE
loc_886B:
8:886B  8b4606               mov ax, word ptr [bp + 6]
8:886E  8b5608               mov dx, word ptr [bp + 8]
8:8871  c9                   leave
8:8872  ca0600               retf 6
8:8875  db 90 50 88 88 88 10 3a 3c 88 30 b2 84 88 16 b3 90
8:8885  db 88 c6 7d 8c 88 88 7d 9c 88 56 7f 94 88 b2 7b 98
8:8895  db 88 1c 7f a0 88 48 88 c8 88 86 7f a4 88 0c 80 a8
8:88A5  db 88 54 80 ac 88 72 b3 b0 88 58 81 b4 88 b6 81 b8
8:88B5  db 88 fe 81 c0 88 ea 60 cc 88 4a 82 c4 88 66 82 d4
8:88C5  db 88 ac 7d d8 88 ee 60 d0 88 f4 60 dc 88 c8 b4 e0
8:88D5  db 88 42 88 f0 88 fe 60 f4 73 7e 80 e4 88 3c b4 e8
8:88E5  db 88 5e b4 ec 88 7c b1 85 7e 4c 88 6b 7d

; ---------------- sub_s8:88F2 FAR size=72 callers=1
8:88F2  55                   push bp
8:88F3  8bec                 mov bp, sp
8:88F5  ff760a               push word ptr [bp + 0xa]
8:88F8  684c18               push 0x184c
8:88FB  66ff7606             push dword ptr [bp + 6]
8:88FF  9a82b08088           lcall 0x8880, 0xb082  ; sub_s9:B082
8:8904  66a1685a             mov eax, dword ptr [0x5a68]
8:8908  c45e06               les bx, ptr [bp + 6]
8:890B  662689879400         mov dword ptr es:[bx + 0x94], eax
8:8911  33c0                 xor ax, ax
8:8913  2689879800           mov word ptr es:[bx + 0x98], ax
8:8918  2689879a00           mov word ptr es:[bx + 0x9a], ax
8:891D  2689879c00           mov word ptr es:[bx + 0x9c], ax
8:8922  2689879e00           mov word ptr es:[bx + 0x9e], ax
8:8927  26c7072e8c           mov word ptr es:[bx], 0x8c2e
8:892C  26c747027888         mov word ptr es:[bx + 2], 0x8878  ; SEGMENT s8:0000
8:8932  8bc3                 mov ax, bx
8:8934  8cc2                 mov dx, es
8:8936  c9                   leave
8:8937  ca0600               retf 6

; ---------------- sub_s8:893A FAR size=44 callers=1
8:893A  55                   push bp
8:893B  8bec                 mov bp, sp
8:893D  c45e06               les bx, ptr [bp + 6]
8:8940  26c7072e8c           mov word ptr es:[bx], 0x8c2e
8:8945  26c747023089         mov word ptr es:[bx + 2], 0x8930  ; SEGMENT s8:0000
8:894B  26ff7706             push word ptr es:[bx + 6]
8:894F  66ff367c5b           push dword ptr [0x5b7c]
8:8954  90                   nop
8:8955  0e                   push cs
8:8956  e8872d               call 0xb6e0  ; sub_s8:B6E0
8:8959  66ff7606             push dword ptr [bp + 6]
8:895D  9af8b00289           lcall 0x8902, 0xb0f8  ; sub_s9:B0F8
8:8962  c9                   leave
8:8963  ca0400               retf 4

; ---------------- sub_s8:8966 size=130 callers=0
;   apis: USER.SetDlgItemInt
8:8966  c8020000             enter 2, 0
8:896A  c746fe0000           mov word ptr [bp - 2], 0
8:896F  8b460e               mov ax, word ptr [bp + 0xe]
8:8972  eb34                 jmp 0x89a8
loc_8974:
8:8974  c45e06               les bx, ptr [bp + 6]
8:8977  2683bf980000         cmp word ptr es:[bx + 0x98], 0
8:897D  7e30                 jle 0x89af
8:897F  26ff879a00           inc word ptr es:[bx + 0x9a]
8:8984  26ff8f9800           dec word ptr es:[bx + 0x98]
loc_8989:
8:8989  c746fe0100           mov word ptr [bp - 2], 1
8:898E  eb1f                 jmp 0x89af
loc_8990:
8:8990  c45e06               les bx, ptr [bp + 6]
8:8993  2683bf9a0000         cmp word ptr es:[bx + 0x9a], 0
8:8999  7e14                 jle 0x89af
8:899B  26ff8f9a00           dec word ptr es:[bx + 0x9a]
8:89A0  26ff879800           inc word ptr es:[bx + 0x98]
8:89A5  ebe2                 jmp 0x8989
8:89A7  db 90
loc_89A8:
8:89A8  0bc0                 or ax, ax
8:89AA  74c8                 je 0x8974
8:89AC  48                   dec ax
8:89AD  74e1                 je 0x8990
loc_89AF:
8:89AF  837efe00             cmp word ptr [bp - 2], 0
8:89B3  742c                 je 0x89e1
8:89B5  c45e06               les bx, ptr [bp + 6]
8:89B8  26ff7706             push word ptr es:[bx + 6]
8:89BC  684d18               push 0x184d
8:89BF  26ffb79a00           push word ptr es:[bx + 0x9a]
8:89C4  6a00                 push 0
8:89C6  9add890000           lcall 0, 0x89dd  ; USER.SetDlgItemInt
8:89CB  c45e06               les bx, ptr [bp + 6]
8:89CE  26ff7706             push word ptr es:[bx + 6]
8:89D2  684f18               push 0x184f
8:89D5  26ffb79800           push word ptr es:[bx + 0x98]
8:89DA  6a00                 push 0
8:89DC  9affff0000           lcall 0, 0xffff  ; USER.SetDlgItemInt
loc_89E1:
8:89E1  33c0                 xor ax, ax
8:89E3  c9                   leave
8:89E4  ca0a00               retf 0xa
8:89E7  db 00

; ---------------- sub_s8:89E8 FAR size=16 callers=0
8:89E8  55                   push bp
8:89E9  8bec                 mov bp, sp
8:89EB  66ff7606             push dword ptr [bp + 6]
8:89EF  90                   nop
8:89F0  0e                   push cs
8:89F1  e86401               call 0x8b58  ; sub_s8:8B58
8:89F4  c9                   leave
8:89F5  ca0400               retf 4

; ---------------- sub_s8:89F8 FAR size=66 callers=0
8:89F8  55                   push bp
8:89F9  8bec                 mov bp, sp
8:89FB  8b460e               mov ax, word ptr [bp + 0xe]
8:89FE  2deb00               sub ax, 0xeb
8:8A01  7419                 je 0x8a1c
8:8A03  2d5617               sub ax, 0x1756
8:8A06  7420                 je 0x8a28
8:8A08  66ff760c             push dword ptr [bp + 0xc]
8:8A0C  66ff7608             push dword ptr [bp + 8]
8:8A10  ff7606               push word ptr [bp + 6]
8:8A13  9a4ab56089           lcall 0x8960, 0xb54a  ; sub_s9:B54A
8:8A18  c9                   leave
8:8A19  ca0a00               retf 0xa
loc_8A1C:
8:8A1C  66ff7606             push dword ptr [bp + 6]
8:8A20  90                   nop
8:8A21  0e                   push cs
8:8A22  e83301               call 0x8b58  ; sub_s8:8B58
8:8A25  eb0a                 jmp 0x8a31
8:8A27  db 90
loc_8A28:
8:8A28  66ff7606             push dword ptr [bp + 6]
8:8A2C  90                   nop
8:8A2D  0e                   push cs
8:8A2E  e80900               call 0x8a3a  ; sub_s8:8A3A
loc_8A31:
8:8A31  b80100               mov ax, 1
8:8A34  99                   cdq
8:8A35  c9                   leave
8:8A36  ca0a00               retf 0xa
8:8A39  db 00

; ---------------- sub_s8:8A3A FAR size=196 callers=1
;   apis: USER.MessageBox
8:8A3A  c8100200             enter 0x210, 0
8:8A3E  680010               push 0x1000
8:8A41  9a9c17878a           lcall 0x8a87, 0x179c  ; operator_new@s1:179C
8:8A46  83c402               add sp, 2
8:8A49  8986fafe             mov word ptr [bp - 0x106], ax
8:8A4D  8996fcfe             mov word ptr [bp - 0x104], dx
8:8A51  68e607               push 0x7e6
8:8A54  52                   push dx
8:8A55  50                   push ax
8:8A56  68ff03               push 0x3ff
8:8A59  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8A5E  9ae084778a           lcall 0x8a77, 0x84e0  ; sub_s3:84E0
8:8A63  68e707               push 0x7e7
8:8A66  8d86fefe             lea ax, [bp - 0x102]
8:8A6A  16                   push ss
8:8A6B  50                   push ax
8:8A6C  68ff03               push 0x3ff
8:8A6F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8A74  9ae084a08a           lcall 0x8aa0, 0x84e0  ; sub_s3:84E0
8:8A79  8d86fefe             lea ax, [bp - 0x102]
8:8A7D  16                   push ss
8:8A7E  50                   push ax
8:8A7F  66ffb6fafe           push dword ptr [bp - 0x106]
8:8A84  9aea3cb08a           lcall 0x8ab0, 0x3cea  ; sub_s1:3CEA
8:8A89  83c408               add sp, 8
8:8A8C  68e807               push 0x7e8
8:8A8F  8d86fefe             lea ax, [bp - 0x102]
8:8A93  16                   push ss
8:8A94  50                   push ax
8:8A95  68ff03               push 0x3ff
8:8A98  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8A9D  9ae084c98a           lcall 0x8ac9, 0x84e0  ; sub_s3:84E0
8:8AA2  8d86fefe             lea ax, [bp - 0x102]
8:8AA6  16                   push ss
8:8AA7  50                   push ax
8:8AA8  66ffb6fafe           push dword ptr [bp - 0x106]
8:8AAD  9aea3cf88a           lcall 0x8af8, 0x3cea  ; sub_s1:3CEA
8:8AB2  83c408               add sp, 8
8:8AB5  687b05               push 0x57b
8:8AB8  8d86f8fd             lea ax, [bp - 0x208]
8:8ABC  16                   push ss
8:8ABD  50                   push ax
8:8ABE  680101               push 0x101
8:8AC1  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8AC6  9ae0840685           lcall 0x8506, 0x84e0  ; sub_s3:84E0
8:8ACB  c45e06               les bx, ptr [bp + 6]
8:8ACE  26ff7706             push word ptr es:[bx + 6]
8:8AD2  66ffb6fafe           push dword ptr [bp - 0x106]
8:8AD7  8d86f8fd             lea ax, [bp - 0x208]
8:8ADB  16                   push ss
8:8ADC  50                   push ax
8:8ADD  6a00                 push 0
8:8ADF  9ab9820000           lcall 0, 0x82b9  ; USER.MessageBox
8:8AE4  668b86fafe           mov eax, dword ptr [bp - 0x106]
8:8AE9  668986f4fd           mov dword ptr [bp - 0x20c], eax
8:8AEE  668986f0fd           mov dword ptr [bp - 0x210], eax
8:8AF3  6650                 push eax
8:8AF5  9ace176988           lcall 0x8869, 0x17ce  ; operator_delete@s1:17CE
8:8AFA  c9                   leave
8:8AFB  ca0400               retf 4

; ---------------- sub_s8:8AFE size=90 callers=0
;   apis: USER.GetDlgItemInt
8:8AFE  c8100000             enter 0x10, 0
8:8B02  c45e06               les bx, ptr [bp + 6]
8:8B05  26ff7706             push word ptr es:[bx + 6]
8:8B09  684d18               push 0x184d
8:8B0C  8d46fe               lea ax, [bp - 2]
8:8B0F  16                   push ss
8:8B10  50                   push ax
8:8B11  6a00                 push 0
8:8B13  9affff0000           lcall 0, 0xffff  ; USER.GetDlgItemInt
8:8B18  8946fc               mov word ptr [bp - 4], ax
8:8B1B  50                   push ax
8:8B1C  c45e06               les bx, ptr [bp + 6]
8:8B1F  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8B25  9a1a6cdb7c           lcall 0x7cdb, 0x6c1a  ; sub_s7:6C1A
8:8B2A  c45e06               les bx, ptr [bp + 6]
8:8B2D  26c49f9400           les bx, ptr es:[bx + 0x94]
8:8B32  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
8:8B37  668946f8             mov dword ptr [bp - 8], eax
8:8B3B  c45e06               les bx, ptr [bp + 6]
8:8B3E  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8B44  26ffb79c00           push word ptr es:[bx + 0x9c]
8:8B49  ff76fc               push word ptr [bp - 4]
8:8B4C  6650                 push eax
8:8B4E  90                   nop
8:8B4F  0e                   push cs
8:8B50  e82bad               call 0x387e  ; sub_s8:387E
8:8B53  c9                   leave
8:8B54  ca0400               retf 4
8:8B57  db 00

; ---------------- sub_s8:8B58 FAR size=176 callers=2
;   apis: USER.SendDlgItemMessage, USER.SetDlgItemInt
8:8B58  c8100100             enter 0x110, 0
8:8B5C  6a03                 push 3
8:8B5E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:8B63  9aba20848b           lcall 0x8b84, 0x20ba  ; sub_s3:20BA
8:8B68  8946fc               mov word ptr [bp - 4], ax
8:8B6B  8956fe               mov word ptr [bp - 2], dx
8:8B6E  c45e06               les bx, ptr [bp + 6]
8:8B71  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8B77  8d86fcfe             lea ax, [bp - 0x104]
8:8B7B  16                   push ss
8:8B7C  50                   push ax
8:8B7D  66ff76fc             push dword ptr [bp - 4]
8:8B81  9ac2c3618a           lcall 0x8a61, 0xc3c2  ; sub_s3:C3C2
8:8B86  c45e06               les bx, ptr [bp + 6]
8:8B89  26ff7706             push word ptr es:[bx + 6]
8:8B8D  66680c004618         push 0x1846000c
8:8B93  6a00                 push 0
8:8B95  8d86fcfe             lea ax, [bp - 0x104]
8:8B99  16                   push ss
8:8B9A  50                   push ax
8:8B9B  9a08880000           lcall 0, 0x8808  ; USER.SendDlgItemMessage
8:8BA0  c45e06               les bx, ptr [bp + 6]
8:8BA3  26c49f9400           les bx, ptr es:[bx + 0x94]
8:8BA8  268b4732             mov ax, word ptr es:[bx + 0x32]
8:8BAC  c45e06               les bx, ptr [bp + 6]
8:8BAF  2689879c00           mov word ptr es:[bx + 0x9c], ax
8:8BB4  c45e06               les bx, ptr [bp + 6]
8:8BB7  268b879c00           mov ax, word ptr es:[bx + 0x9c]
8:8BBC  2689879a00           mov word ptr es:[bx + 0x9a], ax
8:8BC1  26ff7706             push word ptr es:[bx + 6]
8:8BC5  684d18               push 0x184d
8:8BC8  26ffb79c00           push word ptr es:[bx + 0x9c]
8:8BCD  6a00                 push 0
8:8BCF  9a008c0000           lcall 0, 0x8c00  ; USER.SetDlgItemInt
8:8BD4  c45e06               les bx, ptr [bp + 6]
8:8BD7  26c49f9400           les bx, ptr es:[bx + 0x94]
8:8BDC  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
8:8BE1  668986f8fe           mov dword ptr [bp - 0x108], eax
8:8BE6  6650                 push eax
8:8BE8  90                   nop
8:8BE9  0e                   push cs
8:8BEA  e8b9ae               call 0x3aa6  ; sub_s8:3AA6
8:8BED  c45e06               les bx, ptr [bp + 6]
8:8BF0  2689879800           mov word ptr es:[bx + 0x98], ax
8:8BF5  26ff7706             push word ptr es:[bx + 6]
8:8BF9  684f18               push 0x184f
8:8BFC  50                   push ax
8:8BFD  6a00                 push 0
8:8BFF  9ac7890000           lcall 0, 0x89c7  ; USER.SetDlgItemInt
8:8C04  c9                   leave
8:8C05  ca0400               retf 4

; ---------------- sub_s8:8C08 FAR size=162 callers=0
8:8C08  55                   push bp
8:8C09  8bec                 mov bp, sp
8:8C0B  66ff7606             push dword ptr [bp + 6]
8:8C0F  90                   nop
8:8C10  0e                   push cs
8:8C11  e826fd               call 0x893a  ; sub_s8:893A
8:8C14  f6460a01             test byte ptr [bp + 0xa], 1
8:8C18  7409                 je 0x8c23
8:8C1A  66ff7606             push dword ptr [bp + 6]
8:8C1E  9ace17448a           lcall 0x8a44, 0x17ce  ; operator_delete@s1:17CE
loc_8C23:
8:8C23  8b4606               mov ax, word ptr [bp + 6]
8:8C26  8b5608               mov dx, word ptr [bp + 8]
8:8C29  c9                   leave
8:8C2A  ca0600               retf 6
8:8C2D  db 90 08 8c 40 8c 10 3a 7c 88 30 b2 3c 8c 16 b3 44
8:8C3D  db 8c f8 89 54 8c 26 b7 48 8c 56 7f 4c 8c b2 7b 50
8:8C4D  db 8c 1c 7f 58 8c 48 88 80 8c 86 7f 5c 8c 0c 80 60
8:8C5D  db 8c 54 80 64 8c 72 b3 68 8c 58 81 6c 8c b6 81 70
8:8C6D  db 8c fe 81 78 8c ea 60 88 8c 4a 82 7c 8c 66 82 8c
8:8C7D  db 8c e8 89 84 8c 66 89 90 8c f4 60 94 8c c8 b4 98
8:8C8D  db 8c 42 88 a8 8c fe 60 bc 88 7e 80 9c 8c 3c b4 a0
8:8C9D  db 8c 5e b4 a4 8c 7c b1 16 8a fe 8a 49 89

; ---------------- sub_s8:8CAA FAR size=76 callers=1
8:8CAA  55                   push bp
8:8CAB  8bec                 mov bp, sp
8:8CAD  ff760a               push word ptr [bp + 0xa]
8:8CB0  685a18               push 0x185a
8:8CB3  66ff7606             push dword ptr [bp + 6]
8:8CB7  9a82b0388c           lcall 0x8c38, 0xb082  ; sub_s9:B082
8:8CBC  c45e06               les bx, ptr [bp + 6]
8:8CBF  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
8:8CC9  26c707c890           mov word ptr es:[bx], 0x90c8
8:8CCE  26c74702308c         mov word ptr es:[bx + 2], 0x8c30  ; SEGMENT s8:0000
8:8CD4  6a3f                 push 0x3f
8:8CD6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:8CDB  9aba20668b           lcall 0x8b66, 0x20ba  ; sub_s3:20BA
8:8CE0  c45e06               les bx, ptr [bp + 6]
8:8CE3  2689879400           mov word ptr es:[bx + 0x94], ax
8:8CE8  2689979600           mov word ptr es:[bx + 0x96], dx
8:8CED  8bc3                 mov ax, bx
8:8CEF  8cc2                 mov dx, es
8:8CF1  c9                   leave
8:8CF2  ca0600               retf 6
8:8CF5  db 00

; ---------------- sub_s8:8CF6 FAR size=44 callers=1
8:8CF6  55                   push bp
8:8CF7  8bec                 mov bp, sp
8:8CF9  c45e06               les bx, ptr [bp + 6]
8:8CFC  26c707c890           mov word ptr es:[bx], 0x90c8
8:8D01  26c74702d28c         mov word ptr es:[bx + 2], 0x8cd2  ; SEGMENT s8:0000
8:8D07  26ff7706             push word ptr es:[bx + 6]
8:8D0B  66ff367c5b           push dword ptr [0x5b7c]
8:8D10  90                   nop
8:8D11  0e                   push cs
8:8D12  e8cb29               call 0xb6e0  ; sub_s8:B6E0
8:8D15  66ff7606             push dword ptr [bp + 6]
8:8D19  9af8b0ba8c           lcall 0x8cba, 0xb0f8  ; sub_s9:B0F8
8:8D1E  c9                   leave
8:8D1F  ca0400               retf 4

; ---------------- sub_s8:8D22 size=92 callers=0
;   apis: USER.SendDlgItemMessage
8:8D22  c8040100             enter 0x104, 0
8:8D26  c45e06               les bx, ptr [bp + 6]
8:8D29  26ff7706             push word ptr es:[bx + 6]
8:8D2D  666809045b18         push 0x185b0409
8:8D33  666a00               push 0
8:8D36  6a00                 push 0
8:8D38  9a628d0000           lcall 0, 0x8d62  ; USER.SendDlgItemMessage
8:8D3D  99                   cdq
8:8D3E  8946fc               mov word ptr [bp - 4], ax
8:8D41  8956fe               mov word ptr [bp - 2], dx
8:8D44  3dffff               cmp ax, 0xffff
8:8D47  7504                 jne 0x8d4d
8:8D49  3bd0                 cmp dx, ax
8:8D4B  742d                 je 0x8d7a
loc_8D4D:
8:8D4D  c45e06               les bx, ptr [bp + 6]
8:8D50  26ff7706             push word ptr es:[bx + 6]
8:8D54  66680a045b18         push 0x185b040a
8:8D5A  50                   push ax
8:8D5B  8d86fcfe             lea ax, [bp - 0x104]
8:8D5F  16                   push ss
8:8D60  50                   push ax
8:8D61  9a9c8b0000           lcall 0, 0x8b9c  ; USER.SendDlgItemMessage
8:8D66  8d86fcfe             lea ax, [bp - 0x104]
8:8D6A  16                   push ss
8:8D6B  50                   push ax
8:8D6C  c45e06               les bx, ptr [bp + 6]
8:8D6F  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8D75  9a9ac7348c           lcall 0x8c34, 0xc79a  ; sub_s2:C79A
loc_8D7A:
8:8D7A  c9                   leave
8:8D7B  ca0400               retf 4

; ---------------- sub_s8:8D7E FAR size=26 callers=0
8:8D7E  55                   push bp
8:8D7F  8bec                 mov bp, sp
8:8D81  66ff7606             push dword ptr [bp + 6]
8:8D85  9ade781c8d           lcall 0x8d1c, 0x78de  ; sub_s9:78DE
8:8D8A  66ff7606             push dword ptr [bp + 6]
8:8D8E  90                   nop
8:8D8F  0e                   push cs
8:8D90  e8e101               call 0x8f74  ; sub_s8:8F74
8:8D93  c9                   leave
8:8D94  ca0400               retf 4
8:8D97  db 00

; ---------------- sub_s8:8D98 FAR size=66 callers=0
8:8D98  55                   push bp
8:8D99  8bec                 mov bp, sp
8:8D9B  8b460e               mov ax, word ptr [bp + 0xe]
8:8D9E  2deb00               sub ax, 0xeb
8:8DA1  7419                 je 0x8dbc
8:8DA3  2d5617               sub ax, 0x1756
8:8DA6  7420                 je 0x8dc8
8:8DA8  66ff760c             push dword ptr [bp + 0xc]
8:8DAC  66ff7608             push dword ptr [bp + 8]
8:8DB0  ff7606               push word ptr [bp + 6]
8:8DB3  9a4ab5888d           lcall 0x8d88, 0xb54a  ; sub_s9:B54A
8:8DB8  c9                   leave
8:8DB9  ca0a00               retf 0xa
loc_8DBC:
8:8DBC  66ff7606             push dword ptr [bp + 6]
8:8DC0  90                   nop
8:8DC1  0e                   push cs
8:8DC2  e8af01               call 0x8f74  ; sub_s8:8F74
8:8DC5  eb0a                 jmp 0x8dd1
8:8DC7  db 90
loc_8DC8:
8:8DC8  66ff7606             push dword ptr [bp + 6]
8:8DCC  90                   nop
8:8DCD  0e                   push cs
8:8DCE  e80900               call 0x8dda  ; sub_s8:8DDA
loc_8DD1:
8:8DD1  b80100               mov ax, 1
8:8DD4  99                   cdq
8:8DD5  c9                   leave
8:8DD6  ca0a00               retf 0xa
8:8DD9  db 00

; ---------------- sub_s8:8DDA FAR size=410 callers=1
;   apis: USER.MessageBox
8:8DDA  c8100200             enter 0x210, 0
8:8DDE  680010               push 0x1000
8:8DE1  9a9c17408e           lcall 0x8e40, 0x179c  ; operator_new@s1:179C
8:8DE6  83c402               add sp, 2
8:8DE9  8986f8fd             mov word ptr [bp - 0x208], ax
8:8DED  8996fafd             mov word ptr [bp - 0x206], dx
8:8DF1  687b05               push 0x57b
8:8DF4  8d86fcfd             lea ax, [bp - 0x204]
8:8DF8  16                   push ss
8:8DF9  50                   push ax
8:8DFA  680001               push 0x100
8:8DFD  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8E02  9ae0841a8e           lcall 0x8e1a, 0x84e0  ; sub_s3:84E0
8:8E07  680308               push 0x803
8:8E0A  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8E0F  68ff03               push 0x3ff
8:8E12  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8E17  9ae084308e           lcall 0x8e30, 0x84e0  ; sub_s3:84E0
8:8E1C  680408               push 0x804
8:8E1F  8d86fefe             lea ax, [bp - 0x102]
8:8E23  16                   push ss
8:8E24  50                   push ax
8:8E25  68ff03               push 0x3ff
8:8E28  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8E2D  9ae084598e           lcall 0x8e59, 0x84e0  ; sub_s3:84E0
8:8E32  8d86fefe             lea ax, [bp - 0x102]
8:8E36  16                   push ss
8:8E37  50                   push ax
8:8E38  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8E3D  9aea3c698e           lcall 0x8e69, 0x3cea  ; sub_s1:3CEA
8:8E42  83c408               add sp, 8
8:8E45  680508               push 0x805
8:8E48  8d86fefe             lea ax, [bp - 0x102]
8:8E4C  16                   push ss
8:8E4D  50                   push ax
8:8E4E  68ff03               push 0x3ff
8:8E51  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8E56  9ae084828e           lcall 0x8e82, 0x84e0  ; sub_s3:84E0
8:8E5B  8d86fefe             lea ax, [bp - 0x102]
8:8E5F  16                   push ss
8:8E60  50                   push ax
8:8E61  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8E66  9aea3c928e           lcall 0x8e92, 0x3cea  ; sub_s1:3CEA
8:8E6B  83c408               add sp, 8
8:8E6E  680608               push 0x806
8:8E71  8d86fefe             lea ax, [bp - 0x102]
8:8E75  16                   push ss
8:8E76  50                   push ax
8:8E77  68ff03               push 0x3ff
8:8E7A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8E7F  9ae084ab8e           lcall 0x8eab, 0x84e0  ; sub_s3:84E0
8:8E84  8d86fefe             lea ax, [bp - 0x102]
8:8E88  16                   push ss
8:8E89  50                   push ax
8:8E8A  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8E8F  9aea3cbb8e           lcall 0x8ebb, 0x3cea  ; sub_s1:3CEA
8:8E94  83c408               add sp, 8
8:8E97  680708               push 0x807
8:8E9A  8d86fefe             lea ax, [bp - 0x102]
8:8E9E  16                   push ss
8:8E9F  50                   push ax
8:8EA0  68ff03               push 0x3ff
8:8EA3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8EA8  9ae084d48e           lcall 0x8ed4, 0x84e0  ; sub_s3:84E0
8:8EAD  8d86fefe             lea ax, [bp - 0x102]
8:8EB1  16                   push ss
8:8EB2  50                   push ax
8:8EB3  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8EB8  9aea3ce48e           lcall 0x8ee4, 0x3cea  ; sub_s1:3CEA
8:8EBD  83c408               add sp, 8
8:8EC0  680808               push 0x808
8:8EC3  8d86fefe             lea ax, [bp - 0x102]
8:8EC7  16                   push ss
8:8EC8  50                   push ax
8:8EC9  68ff03               push 0x3ff
8:8ECC  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8ED1  9ae084158f           lcall 0x8f15, 0x84e0  ; sub_s3:84E0
8:8ED6  8d86fefe             lea ax, [bp - 0x102]
8:8EDA  16                   push ss
8:8EDB  50                   push ax
8:8EDC  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8EE1  9aea3c3b8f           lcall 0x8f3b, 0x3cea  ; sub_s1:3CEA
8:8EE6  83c408               add sp, 8
8:8EE9  c45e06               les bx, ptr [bp + 6]
8:8EEC  26ff7706             push word ptr es:[bx + 6]
8:8EF0  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8EF5  8d86fcfd             lea ax, [bp - 0x204]
8:8EF9  16                   push ss
8:8EFA  50                   push ax
8:8EFB  6a00                 push 0
8:8EFD  9a558f0000           lcall 0, 0x8f55  ; USER.MessageBox
8:8F02  680908               push 0x809
8:8F05  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8F0A  68ff03               push 0x3ff
8:8F0D  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8F12  9ae0842b8f           lcall 0x8f2b, 0x84e0  ; sub_s3:84E0
8:8F17  680a08               push 0x80a
8:8F1A  8d86fefe             lea ax, [bp - 0x102]
8:8F1E  16                   push ss
8:8F1F  50                   push ax
8:8F20  68ff03               push 0x3ff
8:8F23  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8F28  9ae084de8c           lcall 0x8cde, 0x84e0  ; sub_s3:84E0
8:8F2D  8d86fefe             lea ax, [bp - 0x102]
8:8F31  16                   push ss
8:8F32  50                   push ax
8:8F33  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8F38  9aea3c6d8f           lcall 0x8f6d, 0x3cea  ; sub_s1:3CEA
8:8F3D  83c408               add sp, 8
8:8F40  c45e06               les bx, ptr [bp + 6]
8:8F43  26ff7706             push word ptr es:[bx + 6]
8:8F47  66ffb6f8fd           push dword ptr [bp - 0x208]
8:8F4C  8d86fcfd             lea ax, [bp - 0x204]
8:8F50  16                   push ss
8:8F51  50                   push ax
8:8F52  6a00                 push 0
8:8F54  9ae08a0000           lcall 0, 0x8ae0  ; USER.MessageBox
8:8F59  668b86f8fd           mov eax, dword ptr [bp - 0x208]
8:8F5E  668986f4fd           mov dword ptr [bp - 0x20c], eax
8:8F63  668986f0fd           mov dword ptr [bp - 0x210], eax
8:8F68  6650                 push eax
8:8F6A  9ace17218c           lcall 0x8c21, 0x17ce  ; operator_delete@s1:17CE
8:8F6F  c9                   leave
8:8F70  ca0400               retf 4
8:8F73  db 00

; ---------------- sub_s8:8F74 FAR size=302 callers=2
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SendDlgItemMessage, USER._wsprintf
8:8F74  c80e0500             enter 0x50e, 0
8:8F78  c45e06               les bx, ptr [bp + 6]
8:8F7B  26ff7706             push word ptr es:[bx + 6]
8:8F7F  66680b005b18         push 0x185b000b
8:8F85  666a00               push 0
8:8F88  6a00                 push 0
8:8F8A  9aa28f0000           lcall 0, 0x8fa2  ; USER.SendDlgItemMessage
8:8F8F  c45e06               les bx, ptr [bp + 6]
8:8F92  26ff7706             push word ptr es:[bx + 6]
8:8F96  666805045b18         push 0x185b0405
8:8F9C  666a00               push 0
8:8F9F  6a00                 push 0
8:8FA1  9ae48f0000           lcall 0, 0x8fe4  ; USER.SendDlgItemMessage
8:8FA6  c45e06               les bx, ptr [bp + 6]
8:8FA9  6626ffb79400         push dword ptr es:[bx + 0x94]
8:8FAF  9a3ac80890           lcall 0x9008, 0xc83a  ; sub_s2:C83A
8:8FB4  0bc0                 or ax, ax
8:8FB6  7444                 je 0x8ffc
8:8FB8  685204               push 0x452
8:8FBB  8d86fefb             lea ax, [bp - 0x402]
8:8FBF  16                   push ss
8:8FC0  50                   push ax
8:8FC1  68ff03               push 0x3ff
8:8FC4  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:8FC9  9ae084058e           lcall 0x8e05, 0x84e0  ; sub_s3:84E0
8:8FCE  c45e06               les bx, ptr [bp + 6]
8:8FD1  26ff7706             push word ptr es:[bx + 6]
8:8FD5  666801045b18         push 0x185b0401
8:8FDB  6a00                 push 0
8:8FDD  8d86fefb             lea ax, [bp - 0x402]
8:8FE1  16                   push ss
8:8FE2  50                   push ax
8:8FE3  9a67900000           lcall 0, 0x9067  ; USER.SendDlgItemMessage
8:8FE8  c45e06               les bx, ptr [bp + 6]
8:8FEB  26ff7706             push word ptr es:[bx + 6]
8:8FEF  6a01                 push 1
8:8FF1  9a78900000           lcall 0, 0x9078  ; USER.GetDlgItem
8:8FF6  50                   push ax
8:8FF7  6a00                 push 0
8:8FF9  e98300               jmp 0x907f
loc_8FFC:
8:8FFC  c45e06               les bx, ptr [bp + 6]
8:8FFF  6626ffb79400         push dword ptr es:[bx + 0x94]
8:9005  9a5ec81d90           lcall 0x901d, 0xc85e  ; sub_s2:C85E
8:900A  8986fefb             mov word ptr [bp - 0x402], ax
8:900E  899600fc             mov word ptr [bp - 0x400], dx
8:9012  52                   push dx
8:9013  50                   push ax
8:9014  8d86f6fb             lea ax, [bp - 0x40a]
8:9018  16                   push ss
8:9019  50                   push ax
8:901A  9a84572890           lcall 0x9028, 0x5784  ; ListIter::ListIter@s2:5784
loc_901F:
8:901F  8d86f6fb             lea ax, [bp - 0x40a]
8:9023  16                   push ss
8:9024  50                   push ax
8:9025  9a125b788d           lcall 0x8d78, 0x5b12  ; ListIter::next@s2:5B12
8:902A  8986f2fa             mov word ptr [bp - 0x50e], ax
8:902E  8996f4fa             mov word ptr [bp - 0x50c], dx
8:9032  0bd0                 or dx, ax
8:9034  7438                 je 0x906e
8:9036  c49ef2fa             les bx, ptr [bp - 0x50e]
8:903A  6626ff7704           push dword ptr es:[bx + 4]
8:903F  1e                   push ds
8:9040  686c5a               push 0x5a6c
8:9043  8d86f6fa             lea ax, [bp - 0x50a]
8:9047  16                   push ss
8:9048  50                   push ax
8:9049  9affff0000           lcall 0, 0xffff  ; USER._wsprintf
8:904E  83c40c               add sp, 0xc
8:9051  c45e06               les bx, ptr [bp + 6]
8:9054  26ff7706             push word ptr es:[bx + 6]
8:9058  666801045b18         push 0x185b0401
8:905E  6a00                 push 0
8:9060  8d86f6fa             lea ax, [bp - 0x50a]
8:9064  16                   push ss
8:9065  50                   push ax
8:9066  9a9a900000           lcall 0, 0x909a  ; USER.SendDlgItemMessage
8:906B  ebb2                 jmp 0x901f
8:906D  db 90
loc_906E:
8:906E  c45e06               les bx, ptr [bp + 6]
8:9071  26ff7706             push word ptr es:[bx + 6]
8:9075  6a01                 push 1
8:9077  9a7b850000           lcall 0, 0x857b  ; USER.GetDlgItem
8:907C  50                   push ax
8:907D  6a01                 push 1
loc_907F:
8:907F  9a80800000           lcall 0, 0x8080  ; USER.EnableWindow
8:9084  c45e06               les bx, ptr [bp + 6]
8:9087  26ff7706             push word ptr es:[bx + 6]
8:908B  66680b005b18         push 0x185b000b
8:9091  666800000100         push 0x10000
8:9097  6a00                 push 0
8:9099  9a398d0000           lcall 0, 0x8d39  ; USER.SendDlgItemMessage
8:909E  c9                   leave
8:909F  ca0400               retf 4

; ---------------- sub_s8:90A2 FAR size=162 callers=0
8:90A2  55                   push bp
8:90A3  8bec                 mov bp, sp
8:90A5  66ff7606             push dword ptr [bp + 6]
8:90A9  90                   nop
8:90AA  0e                   push cs
8:90AB  e848fc               call 0x8cf6  ; sub_s8:8CF6
8:90AE  f6460a01             test byte ptr [bp + 0xa], 1
8:90B2  7409                 je 0x90bd
8:90B4  66ff7606             push dword ptr [bp + 6]
8:90B8  9ace17e48d           lcall 0x8de4, 0x17ce  ; operator_delete@s1:17CE
loc_90BD:
8:90BD  8b4606               mov ax, word ptr [bp + 6]
8:90C0  8b5608               mov dx, word ptr [bp + 8]
8:90C3  c9                   leave
8:90C4  ca0600               retf 6
8:90C7  db 90 a2 90 da 90 10 3a b2 8f 30 b2 d6 90 16 b3 de
8:90D7  db 90 98 8d ee 90 26 b7 e2 90 56 7f e6 90 b2 7b ea
8:90E7  db 90 1c 7f f2 90 48 88 1a 91 86 7f f6 90 0c 80 fa
8:90F7  db 90 54 80 fe 90 72 b3 02 91 58 81 06 91 b6 81 0a
8:9107  db 91 fe 81 12 91 ea 60 1e 91 4a 82 16 91 66 82 26
8:9117  db 91 7e 8d 2a 91 ee 60 22 91 f4 60 2e 91 c8 b4 32
8:9127  db 91 42 88 42 91 fe 60 74 8c 7e 80 36 91 3c b4 3a
8:9137  db 91 5e b4 3e 91 7c b1 b6 8d 22 8d 05 8d

; ---------------- sub_s8:9144 FAR size=312 callers=1
8:9144  c8060000             enter 6, 0
8:9148  57                   push di
8:9149  56                   push si
8:914A  ff760a               push word ptr [bp + 0xa]
8:914D  68aa0f               push 0xfaa
8:9150  66ff7606             push dword ptr [bp + 6]
8:9154  9a82b0b591           lcall 0x91b5, 0xb082  ; sub_s9:B082
8:9159  6633c0               xor eax, eax
8:915C  c45e06               les bx, ptr [bp + 6]
8:915F  2689879400           mov word ptr es:[bx + 0x94], ax
8:9164  2689879600           mov word ptr es:[bx + 0x96], ax
8:9169  662689879800         mov dword ptr es:[bx + 0x98], eax
8:916F  26c707a299           mov word ptr es:[bx], 0x99a2
8:9174  26c74702ca90         mov word ptr es:[bx + 2], 0x90ca  ; SEGMENT s8:0000
8:917A  26c7878a002700       mov word ptr es:[bx + 0x8a], 0x27
8:9181  6a28                 push 0x28
8:9183  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:9188  9aba20cc8f           lcall 0x8fcc, 0x20ba  ; sub_s3:20BA
8:918D  c45e06               les bx, ptr [bp + 6]
8:9190  2689879800           mov word ptr es:[bx + 0x98], ax
8:9195  2689979a00           mov word ptr es:[bx + 0x9a], dx
8:919A  6a18                 push 0x18
8:919C  9a9c17fe91           lcall 0x91fe, 0x179c  ; operator_new@s1:179C
8:91A1  83c402               add sp, 2
8:91A4  8946fa               mov word ptr [bp - 6], ax
8:91A7  8956fc               mov word ptr [bp - 4], dx
8:91AA  0bd0                 or dx, ax
8:91AC  7418                 je 0x91c6
8:91AE  ff76fc               push word ptr [bp - 4]
8:91B1  50                   push ax
8:91B2  9a98a51f92           lcall 0x921f, 0xa598  ; sub_s9:A598
8:91B7  c45e06               les bx, ptr [bp + 6]
8:91BA  2689879000           mov word ptr es:[bx + 0x90], ax
8:91BF  2689979200           mov word ptr es:[bx + 0x92], dx
8:91C4  eb0d                 jmp 0x91d3
loc_91C6:
8:91C6  c45e06               les bx, ptr [bp + 6]
8:91C9  6626c787900000000000 mov dword ptr es:[bx + 0x90], 0
loc_91D3:
8:91D3  c45e06               les bx, ptr [bp + 6]
8:91D6  26c49f9000           les bx, ptr es:[bx + 0x90]
8:91DB  26c7071100           mov word ptr es:[bx], 0x11
8:91E0  c45e06               les bx, ptr [bp + 6]
8:91E3  26c49f9000           les bx, ptr es:[bx + 0x90]
8:91E8  268b07               mov ax, word ptr es:[bx]
8:91EB  8946fe               mov word ptr [bp - 2], ax
8:91EE  8bc8                 mov cx, ax
8:91F0  c1e002               shl ax, 2
8:91F3  03c1                 add ax, cx
8:91F5  03c0                 add ax, ax
8:91F7  050200               add ax, 2
8:91FA  50                   push ax
8:91FB  9a9c172b92           lcall 0x922b, 0x179c  ; operator_new@s1:179C
8:9200  83c402               add sp, 2
8:9203  8946fa               mov word ptr [bp - 6], ax
8:9206  8956fc               mov word ptr [bp - 4], dx
8:9209  0bd0                 or dx, ax
8:920B  7433                 je 0x9240
8:920D  8b46fe               mov ax, word ptr [bp - 2]
8:9210  c45efa               les bx, ptr [bp - 6]
8:9213  268907               mov word ptr es:[bx], ax
8:9216  8d4f02               lea cx, [bx + 2]
8:9219  06                   push es
8:921A  51                   push cx
8:921B  6a0a                 push 0xa
8:921D  50                   push ax
8:921E  68d290               push 0x90d2  ; SEGMENT s9:0000
8:9221  6864a5               push 0xa564
8:9224  8bf1                 mov si, cx
8:9226  8cc7                 mov di, es
8:9228  9a8655bb90           lcall 0x90bb, 0x5586  ; sub_s1:5586
8:922D  c45e06               les bx, ptr [bp + 6]
8:9230  26c49f9000           les bx, ptr es:[bx + 0x90]
8:9235  26897702             mov word ptr es:[bx + 2], si
8:9239  26897f04             mov word ptr es:[bx + 4], di
8:923D  eb12                 jmp 0x9251
8:923F  db 90
loc_9240:
8:9240  c45e06               les bx, ptr [bp + 6]
8:9243  26c49f9000           les bx, ptr es:[bx + 0x90]
8:9248  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_9251:
8:9251  c45e06               les bx, ptr [bp + 6]
8:9254  26c49f9000           les bx, ptr es:[bx + 0x90]
8:9259  26c7470a1800         mov word ptr es:[bx + 0xa], 0x18
8:925F  c45e06               les bx, ptr [bp + 6]
8:9262  268b470a             mov ax, word ptr es:[bx + 0xa]
8:9266  26c49f9000           les bx, ptr es:[bx + 0x90]
8:926B  26894712             mov word ptr es:[bx + 0x12], ax
8:926F  8b4606               mov ax, word ptr [bp + 6]
8:9272  8b5608               mov dx, word ptr [bp + 8]
8:9275  5e                   pop si
8:9276  5f                   pop di
8:9277  c9                   leave
8:9278  ca0600               retf 6
8:927B  db 00

; ---------------- sub_s8:927C FAR size=24 callers=0
8:927C  55                   push bp
8:927D  8bec                 mov bp, sp
8:927F  1e                   push ds
8:9280  68425b               push 0x5b42
8:9283  c45e06               les bx, ptr [bp + 6]
8:9286  06                   push es
8:9287  53                   push bx
8:9288  26c41f               les bx, ptr es:[bx]
8:928B  26ff5f74             lcall es:[bx + 0x74]
8:928F  c9                   leave
8:9290  ca0400               retf 4
8:9293  db 00

; ---------------- sub_s8:9294 FAR size=98 callers=0
;   apis: USER.GetDlgItemInt
8:9294  c8040000             enter 4, 0
8:9298  66ff7606             push dword ptr [bp + 6]
8:929C  9a30b25791           lcall 0x9157, 0xb230  ; sub_s9:B230
8:92A1  c45e06               les bx, ptr [bp + 6]
8:92A4  26ff7706             push word ptr es:[bx + 6]
8:92A8  68a90f               push 0xfa9
8:92AB  8d46fe               lea ax, [bp - 2]
8:92AE  16                   push ss
8:92AF  50                   push ax
8:92B0  6a01                 push 1
8:92B2  9ace920000           lcall 0, 0x92ce  ; USER.GetDlgItemInt
8:92B7  c45e06               les bx, ptr [bp + 6]
8:92BA  2689879400           mov word ptr es:[bx + 0x94], ax
8:92BF  26ff7706             push word ptr es:[bx + 6]
8:92C3  68a80f               push 0xfa8
8:92C6  8d46fc               lea ax, [bp - 4]
8:92C9  16                   push ss
8:92CA  50                   push ax
8:92CB  6a01                 push 1
8:92CD  9a148b0000           lcall 0, 0x8b14  ; USER.GetDlgItemInt
8:92D2  c45e06               les bx, ptr [bp + 6]
8:92D5  2689879600           mov word ptr es:[bx + 0x96], ax
8:92DA  06                   push es
8:92DB  53                   push bx
8:92DC  90                   nop
8:92DD  0e                   push cs
8:92DE  e8d305               call 0x98b4  ; sub_s8:98B4
8:92E1  666801009500         push 0x950001
8:92E7  66ff36a002           push dword ptr [0x2a0]
8:92EC  9a7c5cce90           lcall 0x90ce, 0x5c7c  ; sub_s2:5C7C
8:92F1  c9                   leave
8:92F2  ca0400               retf 4
8:92F5  db 00

; ---------------- sub_s8:92F6 FAR size=484 callers=0
;   apis: USER.GetDlgItemInt
8:92F6  c81a0000             enter 0x1a, 0
8:92FA  57                   push di
8:92FB  56                   push si
8:92FC  8b460e               mov ax, word ptr [bp + 0xe]
8:92FF  2deb00               sub ax, 0xeb
8:9302  740a                 je 0x930e
8:9304  2d0e00               sub ax, 0xe
8:9307  0f846101             je 0x946c
8:930B  e9b601               jmp 0x94c4
loc_930E:
8:930E  6a03                 push 3
8:9310  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:9315  9aba203594           lcall 0x9435, 0x20ba  ; sub_s3:20BA
8:931A  8946fc               mov word ptr [bp - 4], ax
8:931D  8956fe               mov word ptr [bp - 2], dx
8:9320  c45e06               les bx, ptr [bp + 6]
8:9323  66268b879000         mov eax, dword ptr es:[bx + 0x90]
8:9329  668946f8             mov dword ptr [bp - 8], eax
8:932D  660bc0               or eax, eax
8:9330  750a                 jne 0x933c
loc_9332:
8:9332  33c0                 xor ax, ax
loc_9334:
8:9334  33d2                 xor dx, dx
8:9336  5e                   pop si
8:9337  5f                   pop di
8:9338  c9                   leave
8:9339  ca0a00               retf 0xa
loc_933C:
8:933C  6a18                 push 0x18
8:933E  9a9c179793           lcall 0x9397, 0x179c  ; operator_new@s1:179C
8:9343  83c402               add sp, 2
8:9346  8946f2               mov word ptr [bp - 0xe], ax
8:9349  8956f4               mov word ptr [bp - 0xc], dx
8:934C  0bd0                 or dx, ax
8:934E  740c                 je 0x935c
8:9350  ff76f4               push word ptr [bp - 0xc]
8:9353  50                   push ax
8:9354  9a98a5b893           lcall 0x93b8, 0xa598  ; sub_s9:A598
8:9359  eb04                 jmp 0x935f
8:935B  db 90
loc_935C:
8:935C  33c0                 xor ax, ax
8:935E  99                   cdq
loc_935F:
8:935F  c45e06               les bx, ptr [bp + 6]
8:9362  2689879000           mov word ptr es:[bx + 0x90], ax
8:9367  2689979200           mov word ptr es:[bx + 0x92], dx
8:936C  c45e06               les bx, ptr [bp + 6]
8:936F  26c49f9000           les bx, ptr es:[bx + 0x90]
8:9374  26c7071100           mov word ptr es:[bx], 0x11
8:9379  c45e06               les bx, ptr [bp + 6]
8:937C  26c49f9000           les bx, ptr es:[bx + 0x90]
8:9381  268b07               mov ax, word ptr es:[bx]
8:9384  8946f6               mov word ptr [bp - 0xa], ax
8:9387  8bc8                 mov cx, ax
8:9389  c1e002               shl ax, 2
8:938C  03c1                 add ax, cx
8:938E  03c0                 add ax, ax
8:9390  050200               add ax, 2
8:9393  50                   push ax
8:9394  9a9c17c493           lcall 0x93c4, 0x179c  ; operator_new@s1:179C
8:9399  83c402               add sp, 2
8:939C  8946f2               mov word ptr [bp - 0xe], ax
8:939F  8956f4               mov word ptr [bp - 0xc], dx
8:93A2  0bd0                 or dx, ax
8:93A4  7432                 je 0x93d8
8:93A6  8b46f6               mov ax, word ptr [bp - 0xa]
8:93A9  c45ef2               les bx, ptr [bp - 0xe]
8:93AC  268907               mov word ptr es:[bx], ax
8:93AF  8d4f02               lea cx, [bx + 2]
8:93B2  06                   push es
8:93B3  51                   push cx
8:93B4  6a0a                 push 0xa
8:93B6  50                   push ax
8:93B7  684f94               push 0x944f  ; SEGMENT s9:0000
8:93BA  6864a5               push 0xa564
8:93BD  8bf1                 mov si, cx
8:93BF  8cc7                 mov di, es
8:93C1  9a86555894           lcall 0x9458, 0x5586  ; sub_s1:5586
8:93C6  c45e06               les bx, ptr [bp + 6]
8:93C9  26c49f9000           les bx, ptr es:[bx + 0x90]
8:93CE  26897702             mov word ptr es:[bx + 2], si
8:93D2  26897f04             mov word ptr es:[bx + 4], di
8:93D6  eb11                 jmp 0x93e9
loc_93D8:
8:93D8  c45e06               les bx, ptr [bp + 6]
8:93DB  26c49f9000           les bx, ptr es:[bx + 0x90]
8:93E0  6626c7470200000000   mov dword ptr es:[bx + 2], 0
loc_93E9:
8:93E9  c45ef8               les bx, ptr [bp - 8]
8:93EC  66268b4706           mov eax, dword ptr es:[bx + 6]
8:93F1  c45e06               les bx, ptr [bp + 6]
8:93F4  26c49f9000           les bx, ptr es:[bx + 0x90]
8:93F9  6626894706           mov dword ptr es:[bx + 6], eax
8:93FE  c45ef8               les bx, ptr [bp - 8]
8:9401  268b470a             mov ax, word ptr es:[bx + 0xa]
8:9405  c45e06               les bx, ptr [bp + 6]
8:9408  26c49f9000           les bx, ptr es:[bx + 0x90]
8:940D  2689470a             mov word ptr es:[bx + 0xa], ax
8:9411  c45e06               les bx, ptr [bp + 6]
8:9414  268b470a             mov ax, word ptr es:[bx + 0xa]
8:9418  26c49f9000           les bx, ptr es:[bx + 0x90]
8:941D  26894712             mov word ptr es:[bx + 0x12], ax
8:9421  c45e06               les bx, ptr [bp + 6]
8:9424  6626ffb79000         push dword ptr es:[bx + 0x90]
8:942A  1e                   push ds
8:942B  68425b               push 0x5b42
8:942E  66ff76fc             push dword ptr [bp - 4]
8:9432  9a0ca5bc94           lcall 0x94bc, 0xa50c  ; sub_s3:A50C
8:9437  668b46f8             mov eax, dword ptr [bp - 8]
8:943B  668946ee             mov dword ptr [bp - 0x12], eax
8:943F  668946f2             mov dword ptr [bp - 0xe], eax
8:9443  660bc0               or eax, eax
8:9446  7415                 je 0x945d
8:9448  ff76fa               push word ptr [bp - 6]
8:944B  50                   push ax
8:944C  9ad0a5d294           lcall 0x94d2, 0xa5d0  ; sub_s9:A5D0
8:9451  66ff76f8             push dword ptr [bp - 8]
8:9455  9ace179f91           lcall 0x919f, 0x17ce  ; operator_delete@s1:17CE
8:945A  83c404               add sp, 4
loc_945D:
8:945D  c45e06               les bx, ptr [bp + 6]
8:9460  06                   push es
8:9461  53                   push bx
8:9462  26c41f               les bx, ptr es:[bx]
8:9465  26ff5f70             lcall es:[bx + 0x70]
8:9469  e9c6fe               jmp 0x9332
loc_946C:
8:946C  66ff7608             push dword ptr [bp + 8]
8:9470  ff7606               push word ptr [bp + 6]
8:9473  90                   nop
8:9474  0e                   push cs
8:9475  e8c204               call 0x993a  ; sub_s8:993A
8:9478  8946e6               mov word ptr [bp - 0x1a], ax
8:947B  0bc0                 or ax, ax
8:947D  7c3f                 jl 0x94be
8:947F  c45e06               les bx, ptr [bp + 6]
8:9482  26ff7706             push word ptr es:[bx + 6]
8:9486  8bf0                 mov si, ax
8:9488  03f0                 add si, ax
8:948A  03f0                 add si, ax
8:948C  03f6                 add si, si
8:948E  03f0                 add si, ax
8:9490  03f6                 add si, si
8:9492  ffb4725a             push word ptr [si + 0x5a72]
8:9496  8d46e8               lea ax, [bp - 0x18]
8:9499  16                   push ss
8:949A  50                   push ax
8:949B  6a01                 push 1
8:949D  9ab3920000           lcall 0, 0x92b3  ; USER.GetDlgItemInt
8:94A2  8946ec               mov word ptr [bp - 0x14], ax
8:94A5  837ee800             cmp word ptr [bp - 0x18], 0
8:94A9  7413                 je 0x94be
8:94AB  ffb4725a             push word ptr [si + 0x5a72]
8:94AF  50                   push ax
8:94B0  c45e06               les bx, ptr [bp + 6]
8:94B3  6626ffb79800         push dword ptr es:[bx + 0x98]
8:94B9  9a322a8b91           lcall 0x918b, 0x2a32  ; sub_s3:2A32
loc_94BE:
8:94BE  b80100               mov ax, 1
8:94C1  e970fe               jmp 0x9334
loc_94C4:
8:94C4  66ff760c             push dword ptr [bp + 0xc]
8:94C8  66ff7608             push dword ptr [bp + 8]
8:94CC  ff7606               push word ptr [bp + 6]
8:94CF  9a4ab59f92           lcall 0x929f, 0xb54a  ; sub_s9:B54A
8:94D4  5e                   pop si
8:94D5  5f                   pop di
8:94D6  c9                   leave
8:94D7  ca0a00               retf 0xa

; ---------------- sub_s8:94DA size=290 callers=0
;   apis: USER.GetDlgItem, USER.GetDlgItemInt, USER.SetDlgItemInt, USER.SetFocus
8:94DA  c80a0000             enter 0xa, 0
8:94DE  56                   push si
8:94DF  c746fe0100           mov word ptr [bp - 2], 1
8:94E4  66ff7608             push dword ptr [bp + 8]
8:94E8  ff7606               push word ptr [bp + 6]
8:94EB  90                   nop
8:94EC  0e                   push cs
8:94ED  e84a04               call 0x993a  ; sub_s8:993A
8:94F0  8946fa               mov word ptr [bp - 6], ax
8:94F3  0bc0                 or ax, ax
8:94F5  7c2c                 jl 0x9523
8:94F7  c45e06               les bx, ptr [bp + 6]
8:94FA  26ff7706             push word ptr es:[bx + 6]
8:94FE  8bd8                 mov bx, ax
8:9500  03d8                 add bx, ax
8:9502  03d8                 add bx, ax
8:9504  03db                 add bx, bx
8:9506  03d8                 add bx, ax
8:9508  03db                 add bx, bx
8:950A  ffb7725a             push word ptr [bx + 0x5a72]
8:950E  8d46f6               lea ax, [bp - 0xa]
8:9511  16                   push ss
8:9512  50                   push ax
8:9513  6a01                 push 1
8:9515  9a9e940000           lcall 0, 0x949e  ; USER.GetDlgItemInt
8:951A  8946fc               mov word ptr [bp - 4], ax
8:951D  837ef600             cmp word ptr [bp - 0xa], 0
8:9521  7509                 jne 0x952c
loc_9523:
8:9523  b80100               mov ax, 1
8:9526  5e                   pop si
8:9527  c9                   leave
8:9528  ca0a00               retf 0xa
8:952B  db 90
loc_952C:
8:952C  837e0e00             cmp word ptr [bp + 0xe], 0
8:9530  7506                 jne 0x9538
8:9532  ff46fc               inc word ptr [bp - 4]
8:9535  eb09                 jmp 0x9540
8:9537  db 90
loc_9538:
8:9538  c746feffff           mov word ptr [bp - 2], 0xffff
8:953D  ff4efc               dec word ptr [bp - 4]
loc_9540:
8:9540  c746f80100           mov word ptr [bp - 8], 1
8:9545  8b46fc               mov ax, word ptr [bp - 4]
8:9548  8b5efa               mov bx, word ptr [bp - 6]
8:954B  8bcb                 mov cx, bx
8:954D  03db                 add bx, bx
8:954F  03d9                 add bx, cx
8:9551  03db                 add bx, bx
8:9553  03d9                 add bx, cx
8:9555  03db                 add bx, bx
8:9557  39877a5a             cmp word ptr [bx + 0x5a7a], ax
8:955B  7d05                 jge 0x9562
8:955D  c746f80000           mov word ptr [bp - 8], 0
loc_9562:
8:9562  8bd9                 mov bx, cx
8:9564  03db                 add bx, bx
8:9566  03d9                 add bx, cx
8:9568  03db                 add bx, bx
8:956A  03d9                 add bx, cx
8:956C  03db                 add bx, bx
8:956E  3987785a             cmp word ptr [bx + 0x5a78], ax
8:9572  7e05                 jle 0x9579
8:9574  c746f80000           mov word ptr [bp - 8], 0
loc_9579:
8:9579  c45e06               les bx, ptr [bp + 6]
8:957C  26ff7706             push word ptr es:[bx + 6]
8:9580  8bf1                 mov si, cx
8:9582  03f1                 add si, cx
8:9584  03f1                 add si, cx
8:9586  03f6                 add si, si
8:9588  03f1                 add si, cx
8:958A  03f6                 add si, si
8:958C  ffb4725a             push word ptr [si + 0x5a72]
8:9590  9af28f0000           lcall 0, 0x8ff2  ; USER.GetDlgItem
8:9595  50                   push ax
8:9596  9affff0000           lcall 0, 0xffff  ; USER.SetFocus
8:959B  837ef800             cmp word ptr [bp - 8], 0
8:959F  7482                 je 0x9523
8:95A1  ff76fa               push word ptr [bp - 6]
8:95A4  ff76fe               push word ptr [bp - 2]
8:95A7  6a01                 push 1
8:95A9  66ff7606             push dword ptr [bp + 6]
8:95AD  90                   nop
8:95AE  0e                   push cs
8:95AF  e86e02               call 0x9820  ; sub_s8:9820
8:95B2  0bc0                 or ax, ax
8:95B4  0f846bff             je 0x9523
8:95B8  c45e06               les bx, ptr [bp + 6]
8:95BB  26ff7706             push word ptr es:[bx + 6]
8:95BF  ffb4725a             push word ptr [si + 0x5a72]
8:95C3  ff76fc               push word ptr [bp - 4]
8:95C6  6a01                 push 1
8:95C8  9adf950000           lcall 0, 0x95df  ; USER.SetDlgItemInt
8:95CD  c45e06               les bx, ptr [bp + 6]
8:95D0  26ff7706             push word ptr es:[bx + 6]
8:95D4  68a90f               push 0xfa9
8:95D7  26ffb79400           push word ptr es:[bx + 0x94]
8:95DC  6a01                 push 1
8:95DE  9af5950000           lcall 0, 0x95f5  ; USER.SetDlgItemInt
8:95E3  c45e06               les bx, ptr [bp + 6]
8:95E6  26ff7706             push word ptr es:[bx + 6]
8:95EA  68a80f               push 0xfa8
8:95ED  26ffb79600           push word ptr es:[bx + 0x96]
8:95F2  6a01                 push 1
8:95F4  9ad08b0000           lcall 0, 0x8bd0  ; USER.SetDlgItemInt
8:95F9  e927ff               jmp 0x9523

; ---------------- sub_s8:95FC size=382 callers=0
;   apis: USER.GetDlgItemInt, USER.PostMessage
8:95FC  c8240000             enter 0x24, 0
8:9600  56                   push si
8:9601  6a08                 push 8
8:9603  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:9608  9aba201d96           lcall 0x961d, 0x20ba  ; sub_s3:20BA
8:960D  8946fc               mov word ptr [bp - 4], ax
8:9610  8956fe               mov word ptr [bp - 2], dx
8:9613  6a09                 push 9
8:9615  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:961A  9aba20d396           lcall 0x96d3, 0x20ba  ; sub_s3:20BA
8:961F  8946f8               mov word ptr [bp - 8], ax
8:9622  8956fa               mov word ptr [bp - 6], dx
8:9625  6a0c                 push 0xc
8:9627  9a9c171e97           lcall 0x971e, 0x179c  ; operator_new@s1:179C
8:962C  83c402               add sp, 2
8:962F  8946ea               mov word ptr [bp - 0x16], ax
8:9632  8956ec               mov word ptr [bp - 0x14], dx
8:9635  0bd0                 or dx, ax
8:9637  740b                 je 0x9644
8:9639  ff76ec               push word ptr [bp - 0x14]
8:963C  50                   push ax
8:963D  9a4a573b97           lcall 0x973b, 0x574a  ; sub_s2:574A
8:9642  eb03                 jmp 0x9647
loc_9644:
8:9644  33c0                 xor ax, ax
8:9646  99                   cdq
loc_9647:
8:9647  8946f4               mov word ptr [bp - 0xc], ax
8:964A  8956f6               mov word ptr [bp - 0xa], dx
8:964D  c746f00f00           mov word ptr [bp - 0x10], 0xf
8:9652  c746ee0000           mov word ptr [bp - 0x12], 0
8:9657  eb7f                 jmp 0x96d8
8:9659  db 90
loc_965A:
8:965A  66c746e400000000     mov dword ptr [bp - 0x1c], 0
loc_9662:
8:9662  8b46e8               mov ax, word ptr [bp - 0x18]
8:9665  c45ee4               les bx, ptr [bp - 0x1c]
8:9668  26894706             mov word ptr es:[bx + 6], ax
8:966C  8b76ee               mov si, word ptr [bp - 0x12]
8:966F  8bc6                 mov ax, si
8:9671  03f6                 add si, si
8:9673  03f0                 add si, ax
8:9675  03f6                 add si, si
8:9677  03f0                 add si, ax
8:9679  03f6                 add si, si
8:967B  8b847c5a             mov ax, word ptr [si + 0x5a7c]
8:967F  26894704             mov word ptr es:[bx + 4], ax
8:9683  06                   push es
8:9684  53                   push bx
8:9685  c45ef4               les bx, ptr [bp - 0xc]
8:9688  06                   push es
8:9689  53                   push bx
8:968A  26c41f               les bx, ptr es:[bx]
8:968D  26ff5f04             lcall es:[bx + 4]
8:9691  eb42                 jmp 0x96d5
8:9693  db 90
loc_9694:
8:9694  8b5eee               mov bx, word ptr [bp - 0x12]
8:9697  8bc3                 mov ax, bx
8:9699  03db                 add bx, bx
8:969B  03d8                 add bx, ax
8:969D  03db                 add bx, bx
8:969F  03d8                 add bx, ax
8:96A1  03db                 add bx, bx
8:96A3  81bf7c5a8900         cmp word ptr [bx + 0x5a7c], 0x89
8:96A9  740b                 je 0x96b6
8:96AB  ffb77c5a             push word ptr [bx + 0x5a7c]
8:96AF  ff76e8               push word ptr [bp - 0x18]
8:96B2  6a00                 push 0
8:96B4  eb16                 jmp 0x96cc
loc_96B6:
8:96B6  8bd8                 mov bx, ax
8:96B8  03db                 add bx, bx
8:96BA  03d8                 add bx, ax
8:96BC  03db                 add bx, bx
8:96BE  03d8                 add bx, ax
8:96C0  03db                 add bx, bx
8:96C2  ffb77c5a             push word ptr [bx + 0x5a7c]
8:96C6  ff76e8               push word ptr [bp - 0x18]
8:96C9  ff76e8               push word ptr [bp - 0x18]
loc_96CC:
8:96CC  66ff76f8             push dword ptr [bp - 8]
8:96D0  9a66654997           lcall 0x9749, 0x6566  ; sub_s3:6566
loc_96D5:
8:96D5  ff46ee               inc word ptr [bp - 0x12]
loc_96D8:
8:96D8  8b46f0               mov ax, word ptr [bp - 0x10]
8:96DB  3946ee               cmp word ptr [bp - 0x12], ax
8:96DE  7d76                 jge 0x9756
8:96E0  c45e06               les bx, ptr [bp + 6]
8:96E3  26ff7706             push word ptr es:[bx + 6]
8:96E7  8b5eee               mov bx, word ptr [bp - 0x12]
8:96EA  8bc3                 mov ax, bx
8:96EC  03db                 add bx, bx
8:96EE  03d8                 add bx, ax
8:96F0  03db                 add bx, bx
8:96F2  03d8                 add bx, ax
8:96F4  03db                 add bx, bx
8:96F6  ffb7725a             push word ptr [bx + 0x5a72]
8:96FA  8d46f2               lea ax, [bp - 0xe]
8:96FD  16                   push ss
8:96FE  50                   push ax
8:96FF  6a01                 push 1
8:9701  8bf3                 mov si, bx
8:9703  9a16950000           lcall 0, 0x9516  ; USER.GetDlgItemInt
8:9708  8946e8               mov word ptr [bp - 0x18], ax
8:970B  0bc0                 or ax, ax
8:970D  74c6                 je 0x96d5
8:970F  81bc7c5a8300         cmp word ptr [si + 0x5a7c], 0x83
8:9715  0f8d7bff             jge 0x9694
8:9719  6a08                 push 8
8:971B  9a9c174193           lcall 0x9341, 0x179c  ; operator_new@s1:179C
8:9720  83c402               add sp, 2
8:9723  8946ea               mov word ptr [bp - 0x16], ax
8:9726  8956ec               mov word ptr [bp - 0x14], dx
8:9729  0bd0                 or dx, ax
8:972B  0f842bff             je 0x965a
8:972F  c45eea               les bx, ptr [bp - 0x16]
8:9732  26c7079a38           mov word ptr es:[bx], 0x389a
8:9737  26c74702ef92         mov word ptr es:[bx + 2], 0x92ef  ; SEGMENT s2:0000
8:973D  c45eea               les bx, ptr [bp - 0x16]
8:9740  26c707c4a1           mov word ptr es:[bx], 0xa1c4
8:9745  26c747021893         mov word ptr es:[bx + 2], 0x9318  ; SEGMENT s3:0000
8:974B  668b46ea             mov eax, dword ptr [bp - 0x16]
8:974F  668946e4             mov dword ptr [bp - 0x1c], eax
8:9753  e90cff               jmp 0x9662
loc_9756:
8:9756  668b46f4             mov eax, dword ptr [bp - 0xc]
8:975A  c45efc               les bx, ptr [bp - 4]
8:975D  662689470a           mov dword ptr es:[bx + 0xa], eax
8:9762  ff369603             push word ptr [0x396]
8:9766  6668ed001101         push 0x11100ed
8:976C  666a00               push 0
8:976F  9affff0000           lcall 0, 0xffff  ; USER.PostMessage
8:9774  5e                   pop si
8:9775  c9                   leave
8:9776  ca0400               retf 4
8:9779  db 00

; ---------------- sub_s8:977A FAR size=166 callers=0
;   apis: USER.GetDlgItemInt
8:977A  c8120000             enter 0x12, 0
8:977E  c746fa0000           mov word ptr [bp - 6], 0
8:9783  c45e06               les bx, ptr [bp + 6]
8:9786  26ff7706             push word ptr es:[bx + 6]
8:978A  68a80f               push 0xfa8
8:978D  8d46fe               lea ax, [bp - 2]
8:9790  16                   push ss
8:9791  50                   push ax
8:9792  6a01                 push 1
8:9794  9a04970000           lcall 0, 0x9704  ; USER.GetDlgItemInt
8:9799  8946fc               mov word ptr [bp - 4], ax
8:979C  0bc0                 or ax, ax
8:979E  7463                 je 0x9803
8:97A0  68b400               push 0xb4
8:97A3  9a9c172a96           lcall 0x962a, 0x179c  ; operator_new@s1:179C
8:97A8  83c402               add sp, 2
8:97AB  8946ee               mov word ptr [bp - 0x12], ax
8:97AE  8956f0               mov word ptr [bp - 0x10], dx
8:97B1  0bd0                 or dx, ax
8:97B3  7421                 je 0x97d6
8:97B5  6668db05da05         push 0x5da05db
8:97BB  666841000200         push 0x20041
8:97C1  c45e06               les bx, ptr [bp + 6]
8:97C4  26ff7706             push word ptr es:[bx + 6]
8:97C8  ff76f0               push word ptr [bp - 0x10]
8:97CB  50                   push ax
8:97CC  9a20851998           lcall 0x9819, 0x8520  ; sub_s9:8520
8:97D1  83c40e               add sp, 0xe
8:97D4  eb03                 jmp 0x97d9
loc_97D6:
8:97D6  33c0                 xor ax, ax
8:97D8  99                   cdq
loc_97D9:
8:97D9  8946f6               mov word ptr [bp - 0xa], ax
8:97DC  8956f8               mov word ptr [bp - 8], dx
8:97DF  66680100c300         push 0xc30001
8:97E5  8d46f2               lea ax, [bp - 0xe]
8:97E8  16                   push ss
8:97E9  50                   push ax
8:97EA  9a1a944096           lcall 0x9640, 0x941a  ; sub_s2:941A
8:97EF  8d46f2               lea ax, [bp - 0xe]
8:97F2  16                   push ss
8:97F3  50                   push ax
8:97F4  c45ef6               les bx, ptr [bp - 0xa]
8:97F7  06                   push es
8:97F8  53                   push bx
8:97F9  26c41f               les bx, ptr es:[bx]
8:97FC  26ff5f6c             lcall es:[bx + 0x6c]
8:9800  8946fa               mov word ptr [bp - 6], ax
loc_9803:
8:9803  837efa01             cmp word ptr [bp - 6], 1
8:9807  7406                 je 0x980f
8:9809  837efc00             cmp word ptr [bp - 4], 0
8:980D  750c                 jne 0x981b
loc_980F:
8:980F  66ff7608             push dword ptr [bp + 8]
8:9813  ff7606               push word ptr [bp + 6]
8:9816  9a26b75793           lcall 0x9357, 0xb726  ; sub_s9:B726
loc_981B:
8:981B  c9                   leave
8:981C  ca0600               retf 6
8:981F  db 00

; ---------------- sub_s8:9820 FAR size=148 callers=2
;   apis: USER.GetDlgItemInt
8:9820  c80c0000             enter 0xc, 0
8:9824  56                   push si
8:9825  c45e06               les bx, ptr [bp + 6]
8:9828  26ff7706             push word ptr es:[bx + 6]
8:982C  8b760e               mov si, word ptr [bp + 0xe]
8:982F  8bc6                 mov ax, si
8:9831  03f6                 add si, si
8:9833  03f0                 add si, ax
8:9835  03f6                 add si, si
8:9837  03f0                 add si, ax
8:9839  03f6                 add si, si
8:983B  ffb4745a             push word ptr [si + 0x5a74]
8:983F  8d46fe               lea ax, [bp - 2]
8:9842  16                   push ss
8:9843  50                   push ax
8:9844  6a01                 push 1
8:9846  9a6c980000           lcall 0, 0x986c  ; USER.GetDlgItemInt
8:984B  8946fa               mov word ptr [bp - 6], ax
8:984E  f76e0a               imul word ptr [bp + 0xa]
8:9851  f76e0c               imul word ptr [bp + 0xc]
8:9854  8946f6               mov word ptr [bp - 0xa], ax
8:9857  c45e06               les bx, ptr [bp + 6]
8:985A  26ff7706             push word ptr es:[bx + 6]
8:985E  ffb4765a             push word ptr [si + 0x5a76]
8:9862  8d4efc               lea cx, [bp - 4]
8:9865  16                   push ss
8:9866  51                   push cx
8:9867  6a01                 push 1
8:9869  8bf0                 mov si, ax
8:986B  9a95970000           lcall 0, 0x9795  ; USER.GetDlgItemInt
8:9870  8946f8               mov word ptr [bp - 8], ax
8:9873  f76e0a               imul word ptr [bp + 0xa]
8:9876  f76e0c               imul word ptr [bp + 0xc]
8:9879  8946f4               mov word ptr [bp - 0xc], ax
8:987C  c45e06               les bx, ptr [bp + 6]
8:987F  262bb79400           sub si, word ptr es:[bx + 0x94]
8:9884  f7de                 neg si
8:9886  0bf6                 or si, si
8:9888  7d08                 jge 0x9892
loc_988A:
8:988A  33c0                 xor ax, ax
8:988C  5e                   pop si
8:988D  c9                   leave
8:988E  ca0a00               retf 0xa
8:9891  db 90
loc_9892:
8:9892  268b879600           mov ax, word ptr es:[bx + 0x96]
8:9897  2b46f4               sub ax, word ptr [bp - 0xc]
8:989A  78ee                 js 0x988a
8:989C  8b46f6               mov ax, word ptr [bp - 0xa]
8:989F  2629879400           sub word ptr es:[bx + 0x94], ax
8:98A4  8b46f4               mov ax, word ptr [bp - 0xc]
8:98A7  2629879600           sub word ptr es:[bx + 0x96], ax
8:98AC  b80100               mov ax, 1
8:98AF  5e                   pop si
8:98B0  c9                   leave
8:98B1  ca0a00               retf 0xa

; ---------------- sub_s8:98B4 FAR size=134 callers=1
;   apis: USER.GetDlgItemInt, USER.SetDlgItemInt
8:98B4  c8060000             enter 6, 0
8:98B8  56                   push si
8:98B9  c746fc0f00           mov word ptr [bp - 4], 0xf
8:98BE  33c0                 xor ax, ax
8:98C0  8946fe               mov word ptr [bp - 2], ax
8:98C3  8946fa               mov word ptr [bp - 6], ax
8:98C6  eb38                 jmp 0x9900
loc_98C8:
8:98C8  ff76fa               push word ptr [bp - 6]
8:98CB  6a01                 push 1
8:98CD  c45e06               les bx, ptr [bp + 6]
8:98D0  26ff7706             push word ptr es:[bx + 6]
8:98D4  8b76fa               mov si, word ptr [bp - 6]
8:98D7  8bc6                 mov ax, si
8:98D9  03f6                 add si, si
8:98DB  03f0                 add si, ax
8:98DD  03f6                 add si, si
8:98DF  03f0                 add si, ax
8:98E1  03f6                 add si, si
8:98E3  ffb4725a             push word ptr [si + 0x5a72]
8:98E7  8d46fe               lea ax, [bp - 2]
8:98EA  16                   push ss
8:98EB  50                   push ax
8:98EC  6a01                 push 1
8:98EE  9a47980000           lcall 0, 0x9847  ; USER.GetDlgItemInt
8:98F3  50                   push ax
8:98F4  66ff7606             push dword ptr [bp + 6]
8:98F8  90                   nop
8:98F9  0e                   push cs
8:98FA  e823ff               call 0x9820  ; sub_s8:9820
8:98FD  ff46fa               inc word ptr [bp - 6]
loc_9900:
8:9900  8b46fc               mov ax, word ptr [bp - 4]
8:9903  3946fa               cmp word ptr [bp - 6], ax
8:9906  7cc0                 jl 0x98c8
8:9908  c45e06               les bx, ptr [bp + 6]
8:990B  26ff7706             push word ptr es:[bx + 6]
8:990F  68a90f               push 0xfa9
8:9912  26ffb79400           push word ptr es:[bx + 0x94]
8:9917  6a01                 push 1
8:9919  9a30990000           lcall 0, 0x9930  ; USER.SetDlgItemInt
8:991E  c45e06               les bx, ptr [bp + 6]
8:9921  26ff7706             push word ptr es:[bx + 6]
8:9925  68a80f               push 0xfa8
8:9928  26ffb79600           push word ptr es:[bx + 0x96]
8:992D  6a01                 push 1
8:992F  9ac9950000           lcall 0, 0x95c9  ; USER.SetDlgItemInt
8:9934  5e                   pop si
8:9935  c9                   leave
8:9936  ca0400               retf 4
8:9939  db 00

; ---------------- sub_s8:993A FAR size=66 callers=2
8:993A  c8040000             enter 4, 0
8:993E  c746fe0f00           mov word ptr [bp - 2], 0xf
8:9943  c746fc0000           mov word ptr [bp - 4], 0
8:9948  eb03                 jmp 0x994d
loc_994A:
8:994A  ff46fc               inc word ptr [bp - 4]
loc_994D:
8:994D  8b46fe               mov ax, word ptr [bp - 2]
8:9950  3946fc               cmp word ptr [bp - 4], ax
8:9953  7d1f                 jge 0x9974
8:9955  8b460a               mov ax, word ptr [bp + 0xa]
8:9958  8b5efc               mov bx, word ptr [bp - 4]
8:995B  8bcb                 mov cx, bx
8:995D  03db                 add bx, bx
8:995F  03d9                 add bx, cx
8:9961  03db                 add bx, bx
8:9963  03d9                 add bx, cx
8:9965  03db                 add bx, bx
8:9967  3987705a             cmp word ptr [bx + 0x5a70], ax
8:996B  75dd                 jne 0x994a
8:996D  8bc1                 mov ax, cx
8:996F  c9                   leave
8:9970  ca0600               retf 6
8:9973  db 90
loc_9974:
8:9974  b8ffff               mov ax, 0xffff
8:9977  c9                   leave
8:9978  ca0600               retf 6
8:997B  db 00

; ---------------- sub_s8:997C FAR size=162 callers=0
8:997C  c8040000             enter 4, 0
8:9980  66ff7606             push dword ptr [bp + 6]
8:9984  9af8b0cf97           lcall 0x97cf, 0xb0f8  ; sub_s9:B0F8
8:9989  f6460a01             test byte ptr [bp + 0xa], 1
8:998D  7409                 je 0x9998
8:998F  66ff7606             push dword ptr [bp + 6]
8:9993  9ace17a697           lcall 0x97a6, 0x17ce  ; operator_delete@s1:17CE
loc_9998:
8:9998  8b4606               mov ax, word ptr [bp + 6]
8:999B  8b5608               mov dx, word ptr [bp + 8]
8:999E  c9                   leave
8:999F  ca0600               retf 6
8:99A2  db 7c 99 ac 99 10 3a ed 97 94 92 b4 99 16 b3 bc 99
8:99B2  db f6 92 b8 99 7a 97 c8 99 56 7f c0 99 b2 7b c4 99
8:99C2  db 1c 7f cc 99 48 88 f4 99 86 7f d0 99 0c 80 d4 99
8:99D2  db 54 80 d8 99 72 b3 dc 99 58 81 e0 99 b6 81 e4 99
8:99E2  db fe 81 ec 99 ea 60 fc 99 4a 82 f0 99 66 82 00 9a
8:99F2  db 7c 92 f8 99 da 94 04 9a f4 60 08 9a c8 b4 0c 9a
8:9A02  db 42 88 1c 9a fe 60 0e 91 7e 80 10 9a 3c b4 14 9a
8:9A12  db 5e b4 18 9a 7c b1 87 99 fc 95 78 91

; ---------------- sub_s8:9A1E FAR size=42 callers=1
8:9A1E  55                   push bp
8:9A1F  8bec                 mov bp, sp
8:9A21  66ff760c             push dword ptr [bp + 0xc]
8:9A25  66ff7608             push dword ptr [bp + 8]
8:9A29  ff7606               push word ptr [bp + 6]
8:9A2C  9a40b0b099           lcall 0x99b0, 0xb040  ; sub_s9:B040
8:9A31  c45e06               les bx, ptr [bp + 6]
8:9A34  26c707f69a           mov word ptr es:[bx], 0x9af6
8:9A39  26c74702a499         mov word ptr es:[bx + 2], 0x99a4  ; SEGMENT s8:0000
8:9A3F  8bc3                 mov ax, bx
8:9A41  8cc2                 mov dx, es
8:9A43  c9                   leave
8:9A44  ca0a00               retf 0xa
8:9A47  db 00

; ---------------- sub_s8:9A48 FAR size=30 callers=1
8:9A48  55                   push bp
8:9A49  8bec                 mov bp, sp
8:9A4B  c45e06               les bx, ptr [bp + 6]
8:9A4E  26c707f69a           mov word ptr es:[bx], 0x9af6
8:9A53  26c747023d9a         mov word ptr es:[bx + 2], 0x9a3d  ; SEGMENT s8:0000
8:9A59  66ff7606             push dword ptr [bp + 6]
8:9A5D  9af8b02f9a           lcall 0x9a2f, 0xb0f8  ; sub_s9:B0F8
8:9A62  c9                   leave
8:9A63  ca0400               retf 4

; ---------------- sub_s8:9A66 size=106 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SetWindowPos
8:9A66  c8080000             enter 8, 0
8:9A6A  8b460e               mov ax, word ptr [bp + 0xe]
8:9A6D  2df800               sub ax, 0xf8
8:9A70  7442                 je 0x9ab4
8:9A72  2de116               sub ax, 0x16e1
8:9A75  7415                 je 0x9a8c
8:9A77  66ff760c             push dword ptr [bp + 0xc]
8:9A7B  66ff7608             push dword ptr [bp + 8]
8:9A7F  ff7606               push word ptr [bp + 6]
8:9A82  9a4ab5609a           lcall 0x9a60, 0xb54a  ; sub_s9:B54A
8:9A87  c9                   leave
8:9A88  ca0a00               retf 0xa
8:9A8B  db 90
loc_9A8C:
8:9A8C  c45e06               les bx, ptr [bp + 6]
8:9A8F  26ff7706             push word ptr es:[bx + 6]
8:9A93  666a00               push 0
8:9A96  66682c010000         push 0x12c
8:9A9C  66680600a001         push 0x1a00006
8:9AA2  9affff0000           lcall 0, 0xffff  ; USER.SetWindowPos
8:9AA7  8b460a               mov ax, word ptr [bp + 0xa]
8:9AAA  50                   push ax
8:9AAB  6a00                 push 0
loc_9AAD:
8:9AAD  9a80900000           lcall 0, 0x9080  ; USER.EnableWindow
8:9AB2  eb14                 jmp 0x9ac8
loc_9AB4:
8:9AB4  c45e06               les bx, ptr [bp + 6]
8:9AB7  26ff7706             push word ptr es:[bx + 6]
8:9ABB  68d917               push 0x17d9
8:9ABE  9a91950000           lcall 0, 0x9591  ; USER.GetDlgItem
8:9AC3  50                   push ax
8:9AC4  6a01                 push 1
8:9AC6  ebe5                 jmp 0x9aad
loc_9AC8:
8:9AC8  b80100               mov ax, 1
8:9ACB  99                   cdq
8:9ACC  c9                   leave
8:9ACD  ca0a00               retf 0xa

; ---------------- sub_s8:9AD0 FAR size=162 callers=0
8:9AD0  55                   push bp
8:9AD1  8bec                 mov bp, sp
8:9AD3  66ff7606             push dword ptr [bp + 6]
8:9AD7  90                   nop
8:9AD8  0e                   push cs
8:9AD9  e86cff               call 0x9a48  ; sub_s8:9A48
8:9ADC  f6460a01             test byte ptr [bp + 0xa], 1
8:9AE0  7409                 je 0x9aeb
8:9AE2  66ff7606             push dword ptr [bp + 6]
8:9AE6  9ace179699           lcall 0x9996, 0x17ce  ; operator_delete@s1:17CE
loc_9AEB:
8:9AEB  8b4606               mov ax, word ptr [bp + 6]
8:9AEE  8b5608               mov dx, word ptr [bp + 8]
8:9AF1  c9                   leave
8:9AF2  ca0600               retf 6
8:9AF5  db 90 d0 9a 08 9b 10 3a a8 99 30 b2 04 9b 16 b3 0c
8:9B05  db 9b 66 9a 1c 9b 26 b7 10 9b 56 7f 14 9b b2 7b 18
8:9B15  db 9b 1c 7f 20 9b 48 88 58 9b 86 7f 24 9b 0c 80 28
8:9B25  db 9b 54 80 2c 9b 72 b3 30 9b 58 81 34 9b b6 81 38
8:9B35  db 9b fe 81 40 9b ea 60 4c 9b 4a 82 44 9b 66 82 48
8:9B45  db 9b de 78 54 9b ee 60 50 9b f4 60 5c 9b c8 b4 60
8:9B55  db 9b 42 88 70 9b fe 60 e8 99 7e 80 64 9b 3c b4 68
8:9B65  db 9b 5e b4 6c 9b 7c b1 85 9a 4c 88 57 9a

; ---------------- sub_s8:9B72 FAR size=86 callers=2
8:9B72  c8020000             enter 2, 0
8:9B76  56                   push si
8:9B77  66ff760c             push dword ptr [bp + 0xc]
8:9B7B  66ff7608             push dword ptr [bp + 8]
8:9B7F  ff7606               push word ptr [bp + 6]
8:9B82  9a40b0009b           lcall 0x9b00, 0xb040  ; sub_s9:B040
8:9B87  c45e06               les bx, ptr [bp + 6]
8:9B8A  26c78728010000       mov word ptr es:[bx + 0x128], 0
8:9B91  26c707fa9e           mov word ptr es:[bx], 0x9efa
8:9B96  26c74702f89a         mov word ptr es:[bx + 2], 0x9af8  ; SEGMENT s8:0000
8:9B9C  c746fe0000           mov word ptr [bp - 2], 0
8:9BA1  8e4608               mov es, word ptr [bp + 8]
loc_9BA4:
8:9BA4  8b76fe               mov si, word ptr [bp - 2]
8:9BA7  03f6                 add si, si
8:9BA9  8b5e06               mov bx, word ptr [bp + 6]
8:9BAC  26c78094000000       mov word ptr es:[bx + si + 0x94], 0
8:9BB3  ff46fe               inc word ptr [bp - 2]
8:9BB6  837efe4a             cmp word ptr [bp - 2], 0x4a
8:9BBA  7ce8                 jl 0x9ba4
8:9BBC  8b4606               mov ax, word ptr [bp + 6]
8:9BBF  8b5608               mov dx, word ptr [bp + 8]
8:9BC2  5e                   pop si
8:9BC3  c9                   leave
8:9BC4  ca0a00               retf 0xa
8:9BC7  db 00

; ---------------- sub_s8:9BC8 FAR size=292 callers=0
;   apis: GDI.GetDeviceCaps, USER.GetDC, USER.GetDlgItem, USER.GetSystemMetrics, USER.GetWindowRect, USER.ReleaseDC, USER.SetWindowPos
8:9BC8  c83a0000             enter 0x3a, 0
8:9BCC  57                   push di
8:9BCD  56                   push si
8:9BCE  66ff7606             push dword ptr [bp + 6]
8:9BD2  9ae278859b           lcall 0x9b85, 0x78e2  ; sub_s9:78E2
8:9BD7  833ef85e05           cmp word ptr [0x5ef8], 5
8:9BDC  7506                 jne 0x9be4
8:9BDE  c706f85e0000         mov word ptr [0x5ef8], 0
loc_9BE4:
8:9BE4  8d46fe               lea ax, [bp - 2]
8:9BE7  16                   push ss
8:9BE8  50                   push ax
8:9BE9  8d46fc               lea ax, [bp - 4]
8:9BEC  16                   push ss
8:9BED  50                   push ax
8:9BEE  6a48                 push 0x48
8:9BF0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:9BF5  9aba20909c           lcall 0x9c90, 0x20ba  ; sub_s3:20BA
8:9BFA  8946f8               mov word ptr [bp - 8], ax
8:9BFD  8956fa               mov word ptr [bp - 6], dx
8:9C00  050e00               add ax, 0xe
8:9C03  52                   push dx
8:9C04  50                   push ax
8:9C05  9a943efc9a           lcall 0x9afc, 0x3e94  ; sub_s2:3E94
8:9C0A  6a04                 push 4
8:9C0C  9affff0000           lcall 0, 0xffff  ; USER.GetSystemMetrics
8:9C11  f72ef85e             imul word ptr [0x5ef8]
8:9C15  050a00               add ax, 0xa
8:9C18  8946f6               mov word ptr [bp - 0xa], ax
8:9C1B  ff06f85e             inc word ptr [0x5ef8]
8:9C1F  0346fc               add ax, word ptr [bp - 4]
8:9C22  8946f4               mov word ptr [bp - 0xc], ax
8:9C25  8b46fe               mov ax, word ptr [bp - 2]
8:9C28  0146f6               add word ptr [bp - 0xa], ax
8:9C2B  c45e06               les bx, ptr [bp + 6]
8:9C2E  26ff7706             push word ptr es:[bx + 6]
8:9C32  8d46ec               lea ax, [bp - 0x14]
8:9C35  16                   push ss
8:9C36  50                   push ax
8:9C37  9affff0000           lcall 0, 0xffff  ; USER.GetWindowRect
8:9C3C  6a00                 push 0
8:9C3E  9affff0000           lcall 0, 0xffff  ; USER.GetDC
8:9C43  8946ea               mov word ptr [bp - 0x16], ax
8:9C46  50                   push ax
8:9C47  6a0a                 push 0xa
8:9C49  9affff0000           lcall 0, 0xffff  ; GDI.GetDeviceCaps
8:9C4E  8946e8               mov word ptr [bp - 0x18], ax
8:9C51  6a00                 push 0
8:9C53  ff76ea               push word ptr [bp - 0x16]
8:9C56  9affff0000           lcall 0, 0xffff  ; USER.ReleaseDC
8:9C5B  8b46f2               mov ax, word ptr [bp - 0xe]
8:9C5E  3946e8               cmp word ptr [bp - 0x18], ax
8:9C61  7d0c                 jge 0x9c6f
8:9C63  2b46e8               sub ax, word ptr [bp - 0x18]
8:9C66  f7d8                 neg ax
8:9C68  0346ee               add ax, word ptr [bp - 0x12]
8:9C6B  40                   inc ax
8:9C6C  8946f4               mov word ptr [bp - 0xc], ax
loc_9C6F:
8:9C6F  c45e06               les bx, ptr [bp + 6]
8:9C72  26ff7706             push word ptr es:[bx + 6]
8:9C76  6a00                 push 0
8:9C78  66ff76f4             push dword ptr [bp - 0xc]
8:9C7C  666a00               push 0
8:9C7F  6a01                 push 1
8:9C81  9aa39a0000           lcall 0, 0x9aa3  ; USER.SetWindowPos
8:9C86  6a03                 push 3
8:9C88  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:9C8D  9aba200b96           lcall 0x960b, 0x20ba  ; sub_s3:20BA
8:9C92  8946e4               mov word ptr [bp - 0x1c], ax
8:9C95  8956e6               mov word ptr [bp - 0x1a], dx
8:9C98  05a400               add ax, 0xa4
8:9C9B  8946e0               mov word ptr [bp - 0x20], ax
8:9C9E  8956e2               mov word ptr [bp - 0x1e], dx
8:9CA1  c746de0000           mov word ptr [bp - 0x22], 0
8:9CA6  eb24                 jmp 0x9ccc
loc_9CA8:
8:9CA8  c47606               les si, ptr [bp + 6]
8:9CAB  26ff7406             push word ptr es:[si + 6]
8:9CAF  c47ee0               les di, ptr [bp - 0x20]
8:9CB2  26ff31               push word ptr es:[bx + di]
8:9CB5  8bf3                 mov si, bx
8:9CB7  9abf9a0000           lcall 0, 0x9abf  ; USER.GetDlgItem
8:9CBC  c45e06               les bx, ptr [bp + 6]
8:9CBF  2689809400           mov word ptr es:[bx + si + 0x94], ax
8:9CC4  ff46de               inc word ptr [bp - 0x22]
8:9CC7  26ff872801           inc word ptr es:[bx + 0x128]
loc_9CCC:
8:9CCC  8b5ede               mov bx, word ptr [bp - 0x22]
8:9CCF  03db                 add bx, bx
8:9CD1  c476e0               les si, ptr [bp - 0x20]
8:9CD4  26833800             cmp word ptr es:[bx + si], 0
8:9CD8  75ce                 jne 0x9ca8
8:9CDA  c45e06               les bx, ptr [bp + 6]
8:9CDD  06                   push es
8:9CDE  53                   push bx
8:9CDF  26c41f               les bx, ptr es:[bx]
8:9CE2  26ff5f6c             lcall es:[bx + 0x6c]
8:9CE6  5e                   pop si
8:9CE7  5f                   pop di
8:9CE8  c9                   leave
8:9CE9  ca0400               retf 4

; ---------------- sub_s8:9CEC size=224 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SetWindowPos
8:9CEC  c8120000             enter 0x12, 0
8:9CF0  57                   push di
8:9CF1  56                   push si
8:9CF2  8b460e               mov ax, word ptr [bp + 0xe]
8:9CF5  2deb00               sub ax, 0xeb
8:9CF8  7422                 je 0x9d1c
8:9CFA  2d0d00               sub ax, 0xd
8:9CFD  0f84ad00             je 0x9dae
8:9D01  2de016               sub ax, 0x16e0
8:9D04  7474                 je 0x9d7a
8:9D06  66ff760c             push dword ptr [bp + 0xc]
8:9D0A  66ff7608             push dword ptr [bp + 8]
8:9D0E  ff7606               push word ptr [bp + 6]
8:9D11  9a4ab52a9d           lcall 0x9d2a, 0xb54a  ; sub_s9:B54A
8:9D16  5e                   pop si
8:9D17  5f                   pop di
8:9D18  c9                   leave
8:9D19  ca0a00               retf 0xa
loc_9D1C:
8:9D1C  68eb00               push 0xeb
8:9D1F  66ff760a             push dword ptr [bp + 0xa]
8:9D23  66ff7606             push dword ptr [bp + 6]
8:9D27  9a4ab5d59b           lcall 0x9bd5, 0xb54a  ; sub_s9:B54A
8:9D2C  6a03                 push 3
8:9D2E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:9D33  9aba20f89b           lcall 0x9bf8, 0x20ba  ; sub_s3:20BA
8:9D38  05a400               add ax, 0xa4
8:9D3B  8946f8               mov word ptr [bp - 8], ax
8:9D3E  8956fa               mov word ptr [bp - 6], dx
8:9D41  c746f60000           mov word ptr [bp - 0xa], 0
loc_9D46:
8:9D46  8b5ef6               mov bx, word ptr [bp - 0xa]
8:9D49  03db                 add bx, bx
8:9D4B  c476f8               les si, ptr [bp - 8]
8:9D4E  26833800             cmp word ptr es:[bx + si], 0
8:9D52  746e                 je 0x9dc2
8:9D54  c47606               les si, ptr [bp + 6]
8:9D57  26ff7406             push word ptr es:[si + 6]
8:9D5B  c47ef8               les di, ptr [bp - 8]
8:9D5E  26ff31               push word ptr es:[bx + di]
8:9D61  8bf3                 mov si, bx
8:9D63  9aa09d0000           lcall 0, 0x9da0  ; USER.GetDlgItem
8:9D68  c45e06               les bx, ptr [bp + 6]
8:9D6B  2689809400           mov word ptr es:[bx + si + 0x94], ax
8:9D70  ff46f6               inc word ptr [bp - 0xa]
8:9D73  26ff872801           inc word ptr es:[bx + 0x128]
8:9D78  ebcc                 jmp 0x9d46
loc_9D7A:
8:9D7A  c45e06               les bx, ptr [bp + 6]
8:9D7D  26ff7706             push word ptr es:[bx + 6]
8:9D81  666a00               push 0
8:9D84  666837020000         push 0x237
8:9D8A  66680600ed00         push 0xed0006
8:9D90  9a829c0000           lcall 0, 0x9c82  ; USER.SetWindowPos
8:9D95  c45e06               les bx, ptr [bp + 6]
8:9D98  26ff7706             push word ptr es:[bx + 6]
8:9D9C  68d817               push 0x17d8
8:9D9F  9ab99d0000           lcall 0, 0x9db9  ; USER.GetDlgItem
8:9DA4  50                   push ax
8:9DA5  6a00                 push 0
loc_9DA7:
8:9DA7  9aae9a0000           lcall 0, 0x9aae  ; USER.EnableWindow
8:9DAC  eb14                 jmp 0x9dc2
loc_9DAE:
8:9DAE  c45e06               les bx, ptr [bp + 6]
8:9DB1  26ff7706             push word ptr es:[bx + 6]
8:9DB5  68d817               push 0x17d8
8:9DB8  9ab89c0000           lcall 0, 0x9cb8  ; USER.GetDlgItem
8:9DBD  50                   push ax
8:9DBE  6a01                 push 1
8:9DC0  ebe5                 jmp 0x9da7
loc_9DC2:
8:9DC2  b80100               mov ax, 1
8:9DC5  99                   cdq
8:9DC6  5e                   pop si
8:9DC7  5f                   pop di
8:9DC8  c9                   leave
8:9DC9  ca0a00               retf 0xa

; ---------------- sub_s8:9DCC size=264 callers=0
;   apis: GDI.CreateSolidBrush, GDI.SetBkColor, GDI.SetTextColor
8:9DCC  c8100000             enter 0x10, 0
8:9DD0  56                   push si
8:9DD1  c45e06               les bx, ptr [bp + 6]
8:9DD4  2683bf8e0000         cmp word ptr es:[bx + 0x8e], 0
8:9DDA  7510                 jne 0x9dec
8:9DDC  666a00               push 0
8:9DDF  9affff0000           lcall 0, 0xffff  ; GDI.CreateSolidBrush
8:9DE4  c45e06               les bx, ptr [bp + 6]
8:9DE7  2689878e00           mov word ptr es:[bx + 0x8e], ax
loc_9DEC:
8:9DEC  66833e645b00         cmp dword ptr [0x5b64], 0
8:9DF2  754f                 jne 0x9e43
8:9DF4  c41e3042             les bx, ptr [0x4230]
8:9DF8  66268b470e           mov eax, dword ptr es:[bx + 0xe]
8:9DFD  6650                 push eax
8:9DFF  9a724d089c           lcall 0x9c08, 0x4d72  ; sub_s2:4D72
8:9E04  8946f8               mov word ptr [bp - 8], ax
8:9E07  8956fa               mov word ptr [bp - 6], dx
8:9E0A  c45ef8               les bx, ptr [bp - 8]
8:9E0D  2ac0                 sub al, al
8:9E0F  268aa79500           mov ah, byte ptr es:[bx + 0x95]
8:9E14  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
8:9E19  2aed                 sub ch, ch
8:9E1B  0bc1                 or ax, cx
8:9E1D  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
8:9E22  a3645b               mov word ptr [0x5b64], ax
8:9E25  890e665b             mov word ptr [0x5b66], cx
8:9E29  268aa7e503           mov ah, byte ptr es:[bx + 0x3e5]
8:9E2E  2ac0                 sub al, al
8:9E30  268a8fe603           mov cl, byte ptr es:[bx + 0x3e6]
8:9E35  0bc1                 or ax, cx
8:9E37  268a8fe403           mov cl, byte ptr es:[bx + 0x3e4]
8:9E3C  a3685b               mov word ptr [0x5b68], ax
8:9E3F  890e6a5b             mov word ptr [0x5b6a], cx
loc_9E43:
8:9E43  8b460c               mov ax, word ptr [bp + 0xc]
8:9E46  2d0500               sub ax, 5
8:9E49  760b                 jbe 0x9e56
8:9E4B  48                   dec ax
8:9E4C  7426                 je 0x9e74
8:9E4E  33c0                 xor ax, ax
8:9E50  99                   cdq
8:9E51  5e                   pop si
8:9E52  c9                   leave
8:9E53  ca0a00               retf 0xa
loc_9E56:
8:9E56  ff760e               push word ptr [bp + 0xe]
8:9E59  66ff36645b           push dword ptr [0x5b64]
loc_9E5E:
8:9E5E  9affff0000           lcall 0, 0xffff  ; GDI.SetTextColor
8:9E63  ff760e               push word ptr [bp + 0xe]
8:9E66  666800000001         push 0x1000000
8:9E6C  9affff0000           lcall 0, 0xffff  ; GDI.SetBkColor
8:9E71  eb51                 jmp 0x9ec4
8:9E73  db 90
loc_9E74:
8:9E74  c746f00000           mov word ptr [bp - 0x10], 0
8:9E79  c746f40000           mov word ptr [bp - 0xc], 0
8:9E7E  eb03                 jmp 0x9e83
loc_9E80:
8:9E80  ff46f4               inc word ptr [bp - 0xc]
loc_9E83:
8:9E83  8b46f4               mov ax, word ptr [bp - 0xc]
8:9E86  c45e06               les bx, ptr [bp + 6]
8:9E89  2639872801           cmp word ptr es:[bx + 0x128], ax
8:9E8E  7615                 jbe 0x9ea5
8:9E90  8bf0                 mov si, ax
8:9E92  03f0                 add si, ax
8:9E94  81c39400             add bx, 0x94
8:9E98  8b460a               mov ax, word ptr [bp + 0xa]
8:9E9B  263900               cmp word ptr es:[bx + si], ax
8:9E9E  75e0                 jne 0x9e80
8:9EA0  c746f00100           mov word ptr [bp - 0x10], 1
loc_9EA5:
8:9EA5  ff760e               push word ptr [bp + 0xe]
8:9EA8  837ef000             cmp word ptr [bp - 0x10], 0
8:9EAC  740a                 je 0x9eb8
8:9EAE  a1685b               mov ax, word ptr [0x5b68]
8:9EB1  8b166a5b             mov dx, word ptr [0x5b6a]
8:9EB5  eb08                 jmp 0x9ebf
8:9EB7  db 90
loc_9EB8:
8:9EB8  a1645b               mov ax, word ptr [0x5b64]
8:9EBB  8b16665b             mov dx, word ptr [0x5b66]
loc_9EBF:
8:9EBF  52                   push dx
8:9EC0  50                   push ax
8:9EC1  eb9b                 jmp 0x9e5e
8:9EC3  db 90
loc_9EC4:
8:9EC4  c45e06               les bx, ptr [bp + 6]
8:9EC7  8cda                 mov dx, ds
8:9EC9  268b878e00           mov ax, word ptr es:[bx + 0x8e]
8:9ECE  5e                   pop si
8:9ECF  c9                   leave
8:9ED0  ca0a00               retf 0xa
8:9ED3  db 00

; ---------------- sub_s8:9ED4 FAR size=162 callers=0
8:9ED4  c8040000             enter 4, 0
8:9ED8  66ff7606             push dword ptr [bp + 6]
8:9EDC  9af8b0149d           lcall 0x9d14, 0xb0f8  ; sub_s9:B0F8
8:9EE1  f6460a01             test byte ptr [bp + 0xa], 1
8:9EE5  7409                 je 0x9ef0
8:9EE7  66ff7606             push dword ptr [bp + 6]
8:9EEB  9ace17e99a           lcall 0x9ae9, 0x17ce  ; operator_delete@s1:17CE
loc_9EF0:
8:9EF0  8b4606               mov ax, word ptr [bp + 6]
8:9EF3  8b5608               mov dx, word ptr [bp + 8]
8:9EF6  c9                   leave
8:9EF7  ca0600               retf 6
8:9EFA  db d4 9e 04 9f 10 3a 02 9e c8 9b 0c 9f 16 b3 10 9f
8:9F0A  db ec 9c 20 9f 26 b7 14 9f 56 7f 18 9f b2 7b 1c 9f
8:9F1A  db 1c 7f 24 9f 48 88 30 9f 86 7f 28 9f 0c 80 2c 9f
8:9F2A  db 54 80 34 9f cc 9d 5c 9f 58 81 38 9f b6 81 3c 9f
8:9F3A  db fe 81 44 9f ea 60 50 9f 4a 82 48 9f 66 82 4c 9f
8:9F4A  db de 78 58 9f ee 60 54 9f f4 60 60 9f c8 b4 64 9f
8:9F5A  db 42 88 74 9f fe 60 3c 9b 7e 80 68 9f 3c b4 6c 9f
8:9F6A  db 5e b4 70 9f 7c b1 df 9e 4c 88 9a 9b

; ---------------- sub_s8:9F76 FAR size=46 callers=1
8:9F76  55                   push bp
8:9F77  8bec                 mov bp, sp
8:9F79  ff7612               push word ptr [bp + 0x12]
8:9F7C  68ba0f               push 0xfba
8:9F7F  66ff760a             push dword ptr [bp + 0xa]
8:9F83  6a01                 push 1
8:9F85  66ff7606             push dword ptr [bp + 6]
8:9F89  9a2877089f           lcall 0x9f08, 0x7728  ; sub_s9:7728
8:9F8E  c45e06               les bx, ptr [bp + 6]
8:9F91  26c707b6a0           mov word ptr es:[bx], 0xa0b6
8:9F96  26c74702fc9e         mov word ptr es:[bx + 2], 0x9efc  ; SEGMENT s8:0000
8:9F9C  8bc3                 mov ax, bx
8:9F9E  8cc2                 mov dx, es
8:9FA0  c9                   leave
8:9FA1  ca0e00               retf 0xe

; ---------------- sub_s8:9FA4 FAR size=44 callers=1
8:9FA4  55                   push bp
8:9FA5  8bec                 mov bp, sp
8:9FA7  c45e06               les bx, ptr [bp + 6]
8:9FAA  26c707b6a0           mov word ptr es:[bx], 0xa0b6
8:9FAF  26c747029a9f         mov word ptr es:[bx + 2], 0x9f9a  ; SEGMENT s8:0000
8:9FB5  26ff7706             push word ptr es:[bx + 6]
8:9FB9  66ff367c5b           push dword ptr [0x5b7c]
8:9FBE  90                   nop
8:9FBF  0e                   push cs
8:9FC0  e81d17               call 0xb6e0  ; sub_s8:B6E0
8:9FC3  66ff7606             push dword ptr [bp + 6]
8:9FC7  9a2c788c9f           lcall 0x9f8c, 0x782c  ; sub_s9:782C
8:9FCC  c9                   leave
8:9FCD  ca0400               retf 4

; ---------------- sub_s8:9FD0 FAR size=42 callers=0
;   apis: USER.ShowWindow
8:9FD0  55                   push bp
8:9FD1  8bec                 mov bp, sp
8:9FD3  66ff7606             push dword ptr [bp + 6]
8:9FD7  9ae278e69f           lcall 0x9fe6, 0x78e2  ; sub_s9:78E2
8:9FDC  666aff               push -1
8:9FDF  66ff7606             push dword ptr [bp + 6]
8:9FE3  9a6c82ca9f           lcall 0x9fca, 0x826c  ; sub_s9:826C
8:9FE8  c45e06               les bx, ptr [bp + 6]
8:9FEB  26ff7706             push word ptr es:[bx + 6]
8:9FEF  6a05                 push 5
8:9FF1  9affff0000           lcall 0, 0xffff  ; USER.ShowWindow
8:9FF6  c9                   leave
8:9FF7  ca0400               retf 4

; ---------------- sub_s8:9FFA size=120 callers=0
;   apis: USER.GetDC, USER.ReleaseDC
8:9FFA  c8060000             enter 6, 0
8:9FFE  57                   push di
8:9FFF  56                   push si
8:A000  c45e06               les bx, ptr [bp + 6]
8:A003  26ff7706             push word ptr es:[bx + 6]
8:A007  9a3f9c0000           lcall 0, 0x9c3f  ; USER.GetDC
8:A00C  8946fe               mov word ptr [bp - 2], ax
8:A00F  6a03                 push 3
8:A011  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:A016  9a0a83369d           lcall 0x9d36, 0x830a  ; sub_s3:830A
8:A01B  8946fa               mov word ptr [bp - 6], ax
8:A01E  8956fc               mov word ptr [bp - 4], dx
8:A021  8d46fe               lea ax, [bp - 2]
8:A024  16                   push ss
8:A025  50                   push ax
8:A026  c45efa               les bx, ptr [bp - 6]
8:A029  06                   push es
8:A02A  53                   push bx
8:A02B  26c41f               les bx, ptr es:[bx]
8:A02E  8bf3                 mov si, bx
8:A030  8cc7                 mov di, es
8:A032  26ff5f08             lcall es:[bx + 8]
8:A036  8d46fe               lea ax, [bp - 2]
8:A039  16                   push ss
8:A03A  50                   push ax
8:A03B  666805000500         push 0x50005
8:A041  66ff76fa             push dword ptr [bp - 6]
8:A045  8ec7                 mov es, di
8:A047  26ff5c04             lcall es:[si + 4]
8:A04B  8d46fe               lea ax, [bp - 2]
8:A04E  16                   push ss
8:A04F  50                   push ax
8:A050  66ff76fa             push dword ptr [bp - 6]
8:A054  8ec7                 mov es, di
8:A056  26ff5c0c             lcall es:[si + 0xc]
8:A05A  c45e06               les bx, ptr [bp + 6]
8:A05D  26ff7706             push word ptr es:[bx + 6]
8:A061  ff76fe               push word ptr [bp - 2]
8:A064  9a579c0000           lcall 0, 0x9c57  ; USER.ReleaseDC
8:A069  33c0                 xor ax, ax
8:A06B  5e                   pop si
8:A06C  5f                   pop di
8:A06D  c9                   leave
8:A06E  ca0400               retf 4
8:A071  db 00

; ---------------- sub_s8:A072 FAR size=26 callers=0
;   apis: USER.DestroyWindow
8:A072  55                   push bp
8:A073  8bec                 mov bp, sp
8:A075  837e0a00             cmp word ptr [bp + 0xa], 0
8:A079  740c                 je 0xa087
8:A07B  c45e06               les bx, ptr [bp + 6]
8:A07E  26ff7706             push word ptr es:[bx + 6]
8:A082  9aa47d0000           lcall 0, 0x7da4  ; USER.DestroyWindow
loc_A087:
8:A087  c9                   leave
8:A088  ca0600               retf 6
8:A08B  db 00

; ---------------- sub_s8:A08C FAR size=4 callers=0
8:A08C  ca0400               retf 4
8:A08F  db 00

; ---------------- sub_s8:A090 FAR size=146 callers=0
8:A090  55                   push bp
8:A091  8bec                 mov bp, sp
8:A093  66ff7606             push dword ptr [bp + 6]
8:A097  90                   nop
8:A098  0e                   push cs
8:A099  e808ff               call 0x9fa4  ; sub_s8:9FA4
8:A09C  f6460a01             test byte ptr [bp + 0xa], 1
8:A0A0  7409                 je 0xa0ab
8:A0A2  66ff7606             push dword ptr [bp + 6]
8:A0A6  9ace17ee9e           lcall 0x9eee, 0x17ce  ; operator_delete@s1:17CE
loc_A0AB:
8:A0AB  8b4606               mov ax, word ptr [bp + 6]
8:A0AE  8b5608               mov dx, word ptr [bp + 8]
8:A0B1  c9                   leave
8:A0B2  ca0600               retf 6
8:A0B5  db 90 90 a0 c0 a0 10 3a 00 9f d0 9f cc a0 c0 79 c8
8:A0C5  db a0 3c 7b d0 a0 72 a0 dc a0 56 7f d4 a0 b2 7b d8
8:A0D5  db a0 1c 7f e0 a0 8c a0 18 a1 86 7f e4 a0 0c 80 e8
8:A0E5  db a0 54 80 ec a0 5e 7e f0 a0 58 81 f4 a0 b6 81 f8
8:A0F5  db a0 fe 81 00 a1 ea 60 0c a1 4a 82 04 a1 66 82 08
8:A105  db a1 de 78 20 a1 ee 60 10 a1 f4 60 14 a1 fa 60 1c
8:A115  db a1 fa 9f b3 9f fe 60 40 9f 7e 80 da 9f

; ---------------- sub_s8:A122 FAR size=52 callers=4
8:A122  55                   push bp
8:A123  8bec                 mov bp, sp
8:A125  66ff7610             push dword ptr [bp + 0x10]
8:A129  66ff760c             push dword ptr [bp + 0xc]
8:A12D  66ff7608             push dword ptr [bp + 8]
8:A131  ff7606               push word ptr [bp + 6]
8:A134  9a2877c4a0           lcall 0xa0c4, 0x7728  ; sub_s9:7728
8:A139  c45e06               les bx, ptr [bp + 6]
8:A13C  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
8:A143  26c707d0a2           mov word ptr es:[bx], 0xa2d0
8:A148  26c74702b8a0         mov word ptr es:[bx + 2], 0xa0b8  ; SEGMENT s8:0000
8:A14E  8bc3                 mov ax, bx
8:A150  8cc2                 mov dx, es
8:A152  c9                   leave
8:A153  ca0e00               retf 0xe

; ---------------- sub_s8:A156 FAR size=30 callers=5
8:A156  55                   push bp
8:A157  8bec                 mov bp, sp
8:A159  c45e06               les bx, ptr [bp + 6]
8:A15C  26c707d0a2           mov word ptr es:[bx], 0xa2d0
8:A161  26c747024ca1         mov word ptr es:[bx + 2], 0xa14c  ; SEGMENT s8:0000
8:A167  66ff7606             push dword ptr [bp + 6]
8:A16B  9a2c7837a1           lcall 0xa137, 0x782c  ; sub_s9:782C
8:A170  c9                   leave
8:A171  ca0400               retf 4

; ---------------- sub_s8:A174 FAR size=24 callers=0
8:A174  55                   push bp
8:A175  8bec                 mov bp, sp
8:A177  837e0a01             cmp word ptr [bp + 0xa], 1
8:A17B  750a                 jne 0xa187
8:A17D  c45e06               les bx, ptr [bp + 6]
8:A180  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
loc_A187:
8:A187  c9                   leave
8:A188  ca0600               retf 6
8:A18B  db 00

; ---------------- sub_s8:A18C FAR size=280 callers=4
;   apis: USER.GetSystemMetrics, USER.GetWindowRect
8:A18C  c84a0000             enter 0x4a, 0
8:A190  6a27                 push 0x27
8:A192  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:A197  9aba20dea1           lcall 0xa1de, 0x20ba  ; sub_s3:20BA
8:A19C  8946fc               mov word ptr [bp - 4], ax
8:A19F  8956fe               mov word ptr [bp - 2], dx
8:A1A2  8d46f6               lea ax, [bp - 0xa]
8:A1A5  16                   push ss
8:A1A6  50                   push ax
8:A1A7  9a383ebda1           lcall 0xa1bd, 0x3e38  ; sub_s2:3E38
8:A1AC  668b46fc             mov eax, dword ptr [bp - 4]
8:A1B0  055200               add ax, 0x52
8:A1B3  6650                 push eax
8:A1B5  8d46f6               lea ax, [bp - 0xa]
8:A1B8  16                   push ss
8:A1B9  50                   push ax
8:A1BA  9a623fd1a1           lcall 0xa1d1, 0x3f62  ; sub_s2:3F62
8:A1BF  8d46f4               lea ax, [bp - 0xc]
8:A1C2  16                   push ss
8:A1C3  50                   push ax
8:A1C4  8d46f2               lea ax, [bp - 0xe]
8:A1C7  16                   push ss
8:A1C8  50                   push ax
8:A1C9  8d46f6               lea ax, [bp - 0xa]
8:A1CC  16                   push ss
8:A1CD  50                   push ax
8:A1CE  9a943eeba1           lcall 0xa1eb, 0x3e94  ; sub_s2:3E94
8:A1D3  68c001               push 0x1c0
8:A1D6  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:A1DB  9a0a8307a2           lcall 0xa207, 0x830a  ; sub_s3:830A
8:A1E0  8946ee               mov word ptr [bp - 0x12], ax
8:A1E3  8956f0               mov word ptr [bp - 0x10], dx
8:A1E6  52                   push dx
8:A1E7  50                   push ax
8:A1E8  9a724717a2           lcall 0xa217, 0x4772  ; sub_s2:4772
8:A1ED  8946ea               mov word ptr [bp - 0x16], ax
8:A1F0  8956ec               mov word ptr [bp - 0x14], dx
8:A1F3  8d46e8               lea ax, [bp - 0x18]
8:A1F6  16                   push ss
8:A1F7  50                   push ax
8:A1F8  8d46e6               lea ax, [bp - 0x1a]
8:A1FB  16                   push ss
8:A1FC  50                   push ax
8:A1FD  6a48                 push 0x48
8:A1FF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:A204  9aba2019a0           lcall 0xa019, 0x20ba  ; sub_s3:20BA
8:A209  8946de               mov word ptr [bp - 0x22], ax
8:A20C  8956e0               mov word ptr [bp - 0x20], dx
8:A20F  050e00               add ax, 0xe
8:A212  52                   push dx
8:A213  50                   push ax
8:A214  9a943ebca0           lcall 0xa0bc, 0x3e94  ; sub_s2:3E94
8:A219  c45ede               les bx, ptr [bp - 0x22]
8:A21C  268b470a             mov ax, word ptr es:[bx + 0xa]
8:A220  8946e4               mov word ptr [bp - 0x1c], ax
8:A223  268b470c             mov ax, word ptr es:[bx + 0xc]
8:A227  8946e2               mov word ptr [bp - 0x1e], ax
8:A22A  8bc8                 mov cx, ax
8:A22C  c1e002               shl ax, 2
8:A22F  03c1                 add ax, cx
8:A231  03c0                 add ax, ax
8:A233  b95802               mov cx, 0x258
8:A236  99                   cdq
8:A237  f7f9                 idiv cx
8:A239  c45eea               les bx, ptr [bp - 0x16]
8:A23C  26034708             add ax, word ptr es:[bx + 8]
8:A240  0346e6               add ax, word ptr [bp - 0x1a]
8:A243  0146f2               add word ptr [bp - 0xe], ax
8:A246  c45e06               les bx, ptr [bp + 6]
8:A249  26ff7706             push word ptr es:[bx + 6]
8:A24D  8d46d6               lea ax, [bp - 0x2a]
8:A250  16                   push ss
8:A251  50                   push ax
8:A252  9a389c0000           lcall 0, 0x9c38  ; USER.GetWindowRect
8:A257  8b46da               mov ax, word ptr [bp - 0x26]
8:A25A  2b46d6               sub ax, word ptr [bp - 0x2a]
8:A25D  8946d4               mov word ptr [bp - 0x2c], ax
8:A260  6a00                 push 0
8:A262  9a0d9c0000           lcall 0, 0x9c0d  ; USER.GetSystemMetrics
8:A267  8946d2               mov word ptr [bp - 0x2e], ax
8:A26A  2b46d4               sub ax, word ptr [bp - 0x2c]
8:A26D  99                   cdq
8:A26E  2bc2                 sub ax, dx
8:A270  d1f8                 sar ax, 1
8:A272  8946f4               mov word ptr [bp - 0xc], ax
8:A275  50                   push ax
8:A276  ff76f2               push word ptr [bp - 0xe]
8:A279  66ff7606             push dword ptr [bp + 6]
8:A27D  9a6c826ea1           lcall 0xa16e, 0x826c  ; sub_s9:826C
8:A282  668b46ee             mov eax, dword ptr [bp - 0x12]
8:A286  668946b6             mov dword ptr [bp - 0x4a], eax
8:A28A  668946ba             mov dword ptr [bp - 0x46], eax
8:A28E  660bc0               or eax, eax
8:A291  740d                 je 0xa2a0
8:A293  6a01                 push 1
8:A295  c45eee               les bx, ptr [bp - 0x12]
8:A298  06                   push es
8:A299  50                   push ax
8:A29A  26c41f               les bx, ptr es:[bx]
8:A29D  26ff1f               lcall es:[bx]
loc_A2A0:
8:A2A0  c9                   leave
8:A2A1  ca0400               retf 4

; ---------------- sub_s8:A2A4 FAR size=6 callers=0
8:A2A4  33c0                 xor ax, ax
8:A2A6  ca0400               retf 4
8:A2A9  db 00

; ---------------- sub_s8:A2AA FAR size=146 callers=0
8:A2AA  55                   push bp
8:A2AB  8bec                 mov bp, sp
8:A2AD  66ff7606             push dword ptr [bp + 6]
8:A2B1  90                   nop
8:A2B2  0e                   push cs
8:A2B3  e8a0fe               call 0xa156  ; sub_s8:A156
8:A2B6  f6460a01             test byte ptr [bp + 0xa], 1
8:A2BA  7409                 je 0xa2c5
8:A2BC  66ff7606             push dword ptr [bp + 6]
8:A2C0  9ace17a9a0           lcall 0xa0a9, 0x17ce  ; operator_delete@s1:17CE
loc_A2C5:
8:A2C5  8b4606               mov ax, word ptr [bp + 6]
8:A2C8  8b5608               mov dx, word ptr [bp + 8]
8:A2CB  c9                   leave
8:A2CC  ca0600               retf 6
8:A2CF  db 90 aa a2 d6 a2 74 a1 32 a3 e2 78 de a2 c0 79 e2
8:A2DF  db a2 3c 7b e6 a2 98 7b ea a2 56 7f ee a2 b2 7b f2
8:A2EF  db a2 1c 7f f6 a2 12 82 fa a2 86 7f fe a2 0c 80 02
8:A2FF  db a3 54 80 06 a3 5e 7e 0a a3 58 81 0e a3 b6 81 12
8:A30F  db a3 fe 81 1a a3 ea 60 26 a3 4a 82 1e a3 66 82 22
8:A31F  db a3 de 78 3a a3 ee 60 2a a3 f4 60 2e a3 fa 60 36
8:A32F  db a3 a4 a2 65 a1 fe 60 fc a0 7e 80 80 a2

; ---------------- sub_s8:A33C FAR size=46 callers=1
8:A33C  55                   push bp
8:A33D  8bec                 mov bp, sp
8:A33F  ff760a               push word ptr [bp + 0xa]
8:A342  66680000c70f         push 0xfc70000
8:A348  666a01               push 1
8:A34B  66ff7606             push dword ptr [bp + 6]
8:A34F  90                   nop
8:A350  0e                   push cs
8:A351  e8cefd               call 0xa122  ; sub_s8:A122
8:A354  c45e06               les bx, ptr [bp + 6]
8:A357  26c70728a4           mov word ptr es:[bx], 0xa428
8:A35C  26c74702d2a2         mov word ptr es:[bx + 2], 0xa2d2  ; SEGMENT s8:0000
8:A362  8bc3                 mov ax, bx
8:A364  8cc2                 mov dx, es
8:A366  c9                   leave
8:A367  ca0600               retf 6

; ---------------- sub_s8:A36A FAR size=44 callers=1
8:A36A  55                   push bp
8:A36B  8bec                 mov bp, sp
8:A36D  c45e06               les bx, ptr [bp + 6]
8:A370  26c70728a4           mov word ptr es:[bx], 0xa428
8:A375  26c7470260a3         mov word ptr es:[bx + 2], 0xa360  ; SEGMENT s8:0000
8:A37B  26ff7706             push word ptr es:[bx + 6]
8:A37F  66ff367c5b           push dword ptr [0x5b7c]
8:A384  90                   nop
8:A385  0e                   push cs
8:A386  e85713               call 0xb6e0  ; sub_s8:B6E0
8:A389  66ff7606             push dword ptr [bp + 6]
8:A38D  90                   nop
8:A38E  0e                   push cs
8:A38F  e8c4fd               call 0xa156  ; sub_s8:A156
8:A392  c9                   leave
8:A393  ca0400               retf 4

; ---------------- sub_s8:A396 FAR size=60 callers=0
;   apis: USER.ShowWindow
8:A396  55                   push bp
8:A397  8bec                 mov bp, sp
8:A399  66ff7606             push dword ptr [bp + 6]
8:A39D  9ae278daa2           lcall 0xa2da, 0x78e2  ; sub_s9:78E2
8:A3A2  66ff7606             push dword ptr [bp + 6]
8:A3A6  90                   nop
8:A3A7  0e                   push cs
8:A3A8  e8e1fd               call 0xa18c  ; sub_s8:A18C
8:A3AB  666801000100         push 0x10001
8:A3B1  66ff36a002           push dword ptr [0x2a0]
8:A3B6  9a7c5caaa1           lcall 0xa1aa, 0x5c7c  ; sub_s2:5C7C
8:A3BB  c45e06               les bx, ptr [bp + 6]
8:A3BE  2689878c00           mov word ptr es:[bx + 0x8c], ax
8:A3C3  26ff7706             push word ptr es:[bx + 6]
8:A3C7  6a05                 push 5
8:A3C9  9af29f0000           lcall 0, 0x9ff2  ; USER.ShowWindow
8:A3CE  c9                   leave
8:A3CF  ca0400               retf 4

; ---------------- sub_s8:A3D2 FAR size=48 callers=0
;   apis: USER.GetWindowWord, USER.PostMessage
8:A3D2  55                   push bp
8:A3D3  8bec                 mov bp, sp
8:A3D5  c45e06               les bx, ptr [bp + 6]
8:A3D8  26ff7706             push word ptr es:[bx + 6]
8:A3DC  6af8                 push -8
8:A3DE  9affff0000           lcall 0, 0xffff  ; USER.GetWindowWord
8:A3E3  50                   push ax
8:A3E4  666805011101         push 0x1110105
8:A3EA  666a00               push 0
8:A3ED  9a70970000           lcall 0, 0x9770  ; USER.PostMessage
8:A3F2  6a01                 push 1
8:A3F4  66ff7606             push dword ptr [bp + 6]
8:A3F8  9a987ba0a3           lcall 0xa3a0, 0x7b98  ; sub_s9:7B98
8:A3FD  c9                   leave
8:A3FE  ca0600               retf 6
8:A401  db 00

; ---------------- sub_s8:A402 FAR size=146 callers=0
8:A402  55                   push bp
8:A403  8bec                 mov bp, sp
8:A405  66ff7606             push dword ptr [bp + 6]
8:A409  90                   nop
8:A40A  0e                   push cs
8:A40B  e85cff               call 0xa36a  ; sub_s8:A36A
8:A40E  f6460a01             test byte ptr [bp + 0xa], 1
8:A412  7409                 je 0xa41d
8:A414  66ff7606             push dword ptr [bp + 6]
8:A418  9ace17c3a2           lcall 0xa2c3, 0x17ce  ; operator_delete@s1:17CE
loc_A41D:
8:A41D  8b4606               mov ax, word ptr [bp + 6]
8:A420  8b5608               mov dx, word ptr [bp + 8]
8:A423  c9                   leave
8:A424  ca0600               retf 6
8:A427  db 90 02 a4 2e a4 74 a1 32 a4 96 a3 3e a4 c0 79 3a
8:A437  db a4 3c 7b 42 a4 d2 a3 8a a4 56 7f 46 a4 b2 7b 4a
8:A447  db a4 1c 7f 4e a4 12 82 52 a4 86 7f 56 a4 0c 80 5a
8:A457  db a4 54 80 5e a4 5e 7e 62 a4 58 81 66 a4 b6 81 6a
8:A467  db a4 fe 81 72 a4 ea 60 7e a4 4a 82 76 a4 66 82 7a
8:A477  db a4 de 78 92 a4 ee 60 82 a4 f4 60 86 a4 fa 60 8e
8:A487  db a4 a4 a2 79 a3 fe 60 16 a3 7e 80 fb a3

; ---------------- sub_s8:A494 FAR size=46 callers=1
8:A494  55                   push bp
8:A495  8bec                 mov bp, sp
8:A497  ff760a               push word ptr [bp + 0xa]
8:A49A  66680000c80f         push 0xfc80000
8:A4A0  666a01               push 1
8:A4A3  66ff7606             push dword ptr [bp + 6]
8:A4A7  90                   nop
8:A4A8  0e                   push cs
8:A4A9  e876fc               call 0xa122  ; sub_s8:A122
8:A4AC  c45e06               les bx, ptr [bp + 6]
8:A4AF  26c7072ea6           mov word ptr es:[bx], 0xa62e
8:A4B4  26c747022aa4         mov word ptr es:[bx + 2], 0xa42a  ; SEGMENT s8:0000
8:A4BA  8bc3                 mov ax, bx
8:A4BC  8cc2                 mov dx, es
8:A4BE  c9                   leave
8:A4BF  ca0600               retf 6

; ---------------- sub_s8:A4C2 FAR size=44 callers=1
8:A4C2  55                   push bp
8:A4C3  8bec                 mov bp, sp
8:A4C5  c45e06               les bx, ptr [bp + 6]
8:A4C8  26c7072ea6           mov word ptr es:[bx], 0xa62e
8:A4CD  26c74702b8a4         mov word ptr es:[bx + 2], 0xa4b8  ; SEGMENT s8:0000
8:A4D3  26ff7706             push word ptr es:[bx + 6]
8:A4D7  66ff367c5b           push dword ptr [0x5b7c]
8:A4DC  90                   nop
8:A4DD  0e                   push cs
8:A4DE  e8ff11               call 0xb6e0  ; sub_s8:B6E0
8:A4E1  66ff7606             push dword ptr [bp + 6]
8:A4E5  90                   nop
8:A4E6  0e                   push cs
8:A4E7  e86cfc               call 0xa156  ; sub_s8:A156
8:A4EA  c9                   leave
8:A4EB  ca0400               retf 4

; ---------------- sub_s8:A4EE size=150 callers=0
;   apis: USER.GetDlgItem, USER.SendMessage, USER.SetFocus, USER.SetWindowText, USER.ShowWindow
8:A4EE  c8120000             enter 0x12, 0
8:A4F2  66ff7606             push dword ptr [bp + 6]
8:A4F6  9ae27836a4           lcall 0xa436, 0x78e2  ; sub_s9:78E2
8:A4FB  666801000200         push 0x20001
8:A501  66ff36a002           push dword ptr [0x2a0]
8:A506  9a7c5cb9a3           lcall 0xa3b9, 0x5c7c  ; sub_s2:5C7C
8:A50B  c45e06               les bx, ptr [bp + 6]
8:A50E  2689878c00           mov word ptr es:[bx + 0x8c], ax
8:A513  6a02                 push 2
8:A515  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:A51A  9aba209aa1           lcall 0xa19a, 0x20ba  ; sub_s3:20BA
8:A51F  8946fc               mov word ptr [bp - 4], ax
8:A522  8956fe               mov word ptr [bp - 2], dx
8:A525  c45efc               les bx, ptr [bp - 4]
8:A528  66268b476c           mov eax, dword ptr es:[bx + 0x6c]
8:A52D  668946f8             mov dword ptr [bp - 8], eax
8:A531  c45e06               les bx, ptr [bp + 6]
8:A534  26ff7706             push word ptr es:[bx + 6]
8:A538  681401               push 0x114
8:A53B  9a649d0000           lcall 0, 0x9d64  ; USER.GetDlgItem
8:A540  8946f6               mov word ptr [bp - 0xa], ax
8:A543  50                   push ax
8:A544  66ff76f8             push dword ptr [bp - 8]
8:A548  9aa4850000           lcall 0, 0x85a4  ; USER.SetWindowText
8:A54D  ff76f6               push word ptr [bp - 0xa]
8:A550  9a97950000           lcall 0, 0x9597  ; USER.SetFocus
8:A555  ff76f6               push word ptr [bp - 0xa]
8:A558  666800000104         push 0x4010000
8:A55E  66680000ffff         push 0xffff0000
8:A564  9affff0000           lcall 0, 0xffff  ; USER.SendMessage
8:A569  66ff7606             push dword ptr [bp + 6]
8:A56D  90                   nop
8:A56E  0e                   push cs
8:A56F  e81afc               call 0xa18c  ; sub_s8:A18C
8:A572  c45e06               les bx, ptr [bp + 6]
8:A575  26ff7706             push word ptr es:[bx + 6]
8:A579  6a05                 push 5
8:A57B  9acaa30000           lcall 0, 0xa3ca  ; USER.ShowWindow
8:A580  c9                   leave
8:A581  ca0400               retf 4

; ---------------- sub_s8:A584 size=132 callers=0
;   apis: USER.GetDlgItem, USER.GetWindowText, USER.GetWindowWord, USER.PostMessage
8:A584  c8560000             enter 0x56, 0
8:A588  837e0a00             cmp word ptr [bp + 0xa], 0
8:A58C  7476                 je 0xa604
8:A58E  c45e06               les bx, ptr [bp + 6]
8:A591  26ff7706             push word ptr es:[bx + 6]
8:A595  681401               push 0x114
8:A598  9a3ca50000           lcall 0, 0xa53c  ; USER.GetDlgItem
8:A59D  50                   push ax
8:A59E  8d46b0               lea ax, [bp - 0x50]
8:A5A1  16                   push ss
8:A5A2  50                   push ax
8:A5A3  6a50                 push 0x50
8:A5A5  9affff0000           lcall 0, 0xffff  ; USER.GetWindowText
8:A5AA  8d46b0               lea ax, [bp - 0x50]
8:A5AD  16                   push ss
8:A5AE  50                   push ax
8:A5AF  9aa43d1ba4           lcall 0xa41b, 0x3da4  ; sub_s1:3DA4
8:A5B4  83c404               add sp, 4
8:A5B7  8946ae               mov word ptr [bp - 0x52], ax
8:A5BA  0bc0                 or ax, ax
8:A5BC  7446                 je 0xa604
8:A5BE  8d46b0               lea ax, [bp - 0x50]
8:A5C1  16                   push ss
8:A5C2  50                   push ax
8:A5C3  6a02                 push 2
8:A5C5  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:A5CA  9aba20daa5           lcall 0xa5da, 0x20ba  ; sub_s3:20BA
8:A5CF  8946aa               mov word ptr [bp - 0x56], ax
8:A5D2  8956ac               mov word ptr [bp - 0x54], dx
8:A5D5  52                   push dx
8:A5D6  50                   push ax
8:A5D7  9a06601da5           lcall 0xa51d, 0x6006  ; sub_s3:6006
8:A5DC  c45e06               les bx, ptr [bp + 6]
8:A5DF  26ff7706             push word ptr es:[bx + 6]
8:A5E3  6af8                 push -8
8:A5E5  9adfa30000           lcall 0, 0xa3df  ; USER.GetWindowWord
8:A5EA  50                   push ax
8:A5EB  666805011101         push 0x1110105
8:A5F1  666a00               push 0
8:A5F4  9aeea30000           lcall 0, 0xa3ee  ; USER.PostMessage
8:A5F9  6a01                 push 1
8:A5FB  66ff7606             push dword ptr [bp + 6]
8:A5FF  9a987bf9a4           lcall 0xa4f9, 0x7b98  ; sub_s9:7B98
loc_A604:
8:A604  c9                   leave
8:A605  ca0600               retf 6

; ---------------- sub_s8:A608 FAR size=146 callers=0
8:A608  55                   push bp
8:A609  8bec                 mov bp, sp
8:A60B  66ff7606             push dword ptr [bp + 6]
8:A60F  90                   nop
8:A610  0e                   push cs
8:A611  e8aefe               call 0xa4c2  ; sub_s8:A4C2
8:A614  f6460a01             test byte ptr [bp + 0xa], 1
8:A618  7409                 je 0xa623
8:A61A  66ff7606             push dword ptr [bp + 6]
8:A61E  9ace17b2a5           lcall 0xa5b2, 0x17ce  ; operator_delete@s1:17CE
loc_A623:
8:A623  8b4606               mov ax, word ptr [bp + 6]
8:A626  8b5608               mov dx, word ptr [bp + 8]
8:A629  c9                   leave
8:A62A  ca0600               retf 6
8:A62D  db 90 08 a6 34 a6 74 a1 38 a6 ee a4 44 a6 c0 79 40
8:A63D  db a6 3c 7b 48 a6 84 a5 90 a6 56 7f 4c a6 b2 7b 50
8:A64D  db a6 1c 7f 54 a6 12 82 58 a6 86 7f 5c a6 0c 80 60
8:A65D  db a6 54 80 64 a6 5e 7e 68 a6 58 81 6c a6 b6 81 70
8:A66D  db a6 fe 81 78 a6 ea 60 84 a6 4a 82 7c a6 66 82 80
8:A67D  db a6 de 78 98 a6 ee 60 88 a6 f4 60 8c a6 fa 60 94
8:A68D  db a6 a4 a2 d1 a4 fe 60 6e a4 7e 80 02 a6

; ---------------- sub_s8:A69A FAR size=46 callers=1
8:A69A  55                   push bp
8:A69B  8bec                 mov bp, sp
8:A69D  ff760a               push word ptr [bp + 0xa]
8:A6A0  66680000c90f         push 0xfc90000
8:A6A6  666a01               push 1
8:A6A9  66ff7606             push dword ptr [bp + 6]
8:A6AD  90                   nop
8:A6AE  0e                   push cs
8:A6AF  e870fa               call 0xa122  ; sub_s8:A122
8:A6B2  c45e06               les bx, ptr [bp + 6]
8:A6B5  26c70732a8           mov word ptr es:[bx], 0xa832
8:A6BA  26c7470230a6         mov word ptr es:[bx + 2], 0xa630  ; SEGMENT s8:0000
8:A6C0  8bc3                 mov ax, bx
8:A6C2  8cc2                 mov dx, es
8:A6C4  c9                   leave
8:A6C5  ca0600               retf 6

; ---------------- sub_s8:A6C8 FAR size=44 callers=1
8:A6C8  55                   push bp
8:A6C9  8bec                 mov bp, sp
8:A6CB  c45e06               les bx, ptr [bp + 6]
8:A6CE  26c70732a8           mov word ptr es:[bx], 0xa832
8:A6D3  26c74702bea6         mov word ptr es:[bx + 2], 0xa6be  ; SEGMENT s8:0000
8:A6D9  26ff7706             push word ptr es:[bx + 6]
8:A6DD  66ff367c5b           push dword ptr [0x5b7c]
8:A6E2  90                   nop
8:A6E3  0e                   push cs
8:A6E4  e8f90f               call 0xb6e0  ; sub_s8:B6E0
8:A6E7  66ff7606             push dword ptr [bp + 6]
8:A6EB  90                   nop
8:A6EC  0e                   push cs
8:A6ED  e866fa               call 0xa156  ; sub_s8:A156
8:A6F0  c9                   leave
8:A6F1  ca0400               retf 4

; ---------------- sub_s8:A6F4 size=148 callers=0
;   apis: USER.GetDlgItem, USER.SendMessage, USER.SetFocus, USER.SetWindowText, USER.ShowWindow
8:A6F4  c8120000             enter 0x12, 0
8:A6F8  66ff7606             push dword ptr [bp + 6]
8:A6FC  9ae2783ca6           lcall 0xa63c, 0x78e2  ; sub_s9:78E2
8:A701  6a02                 push 2
8:A703  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:A708  9aba20cda5           lcall 0xa5cd, 0x20ba  ; sub_s3:20BA
8:A70D  8946fc               mov word ptr [bp - 4], ax
8:A710  8956fe               mov word ptr [bp - 2], dx
8:A713  c45efc               les bx, ptr [bp - 4]
8:A716  66268b4768           mov eax, dword ptr es:[bx + 0x68]
8:A71B  668946f8             mov dword ptr [bp - 8], eax
8:A71F  c45e06               les bx, ptr [bp + 6]
8:A722  26ff7706             push word ptr es:[bx + 6]
8:A726  681501               push 0x115
8:A729  9a99a50000           lcall 0, 0xa599  ; USER.GetDlgItem
8:A72E  8946f6               mov word ptr [bp - 0xa], ax
8:A731  50                   push ax
8:A732  66ff76f8             push dword ptr [bp - 8]
8:A736  9a49a50000           lcall 0, 0xa549  ; USER.SetWindowText
8:A73B  ff76f6               push word ptr [bp - 0xa]
8:A73E  9a51a50000           lcall 0, 0xa551  ; USER.SetFocus
8:A743  ff76f6               push word ptr [bp - 0xa]
8:A746  666800000104         push 0x4010000
8:A74C  66680000ffff         push 0xffff0000
8:A752  9a65a50000           lcall 0, 0xa565  ; USER.SendMessage
8:A757  66ff7606             push dword ptr [bp + 6]
8:A75B  90                   nop
8:A75C  0e                   push cs
8:A75D  e82cfa               call 0xa18c  ; sub_s8:A18C
8:A760  666801000300         push 0x30001
8:A766  66ff36a002           push dword ptr [0x2a0]
8:A76B  9a7c5c09a5           lcall 0xa509, 0x5c7c  ; sub_s2:5C7C
8:A770  c45e06               les bx, ptr [bp + 6]
8:A773  2689878c00           mov word ptr es:[bx + 0x8c], ax
8:A778  26ff7706             push word ptr es:[bx + 6]
8:A77C  6a05                 push 5
8:A77E  9a7ca50000           lcall 0, 0xa57c  ; USER.ShowWindow
8:A783  c9                   leave
8:A784  ca0400               retf 4
8:A787  db 00

; ---------------- sub_s8:A788 FAR size=132 callers=0
;   apis: USER.GetDlgItem, USER.GetWindowText, USER.GetWindowWord, USER.PostMessage
8:A788  c8560000             enter 0x56, 0
8:A78C  837e0a00             cmp word ptr [bp + 0xa], 0
8:A790  7476                 je 0xa808
8:A792  c45e06               les bx, ptr [bp + 6]
8:A795  26ff7706             push word ptr es:[bx + 6]
8:A799  681501               push 0x115
8:A79C  9a2aa70000           lcall 0, 0xa72a  ; USER.GetDlgItem
8:A7A1  50                   push ax
8:A7A2  8d46b0               lea ax, [bp - 0x50]
8:A7A5  16                   push ss
8:A7A6  50                   push ax
8:A7A7  6a50                 push 0x50
8:A7A9  9aa6a50000           lcall 0, 0xa5a6  ; USER.GetWindowText
8:A7AE  8d46b0               lea ax, [bp - 0x50]
8:A7B1  16                   push ss
8:A7B2  50                   push ax
8:A7B3  9aa43d21a6           lcall 0xa621, 0x3da4  ; sub_s1:3DA4
8:A7B8  83c404               add sp, 4
8:A7BB  8946ae               mov word ptr [bp - 0x52], ax
8:A7BE  0bc0                 or ax, ax
8:A7C0  7446                 je 0xa808
8:A7C2  8d46b0               lea ax, [bp - 0x50]
8:A7C5  16                   push ss
8:A7C6  50                   push ax
8:A7C7  6a02                 push 2
8:A7C9  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:A7CE  9aba20dea7           lcall 0xa7de, 0x20ba  ; sub_s3:20BA
8:A7D3  8946aa               mov word ptr [bp - 0x56], ax
8:A7D6  8956ac               mov word ptr [bp - 0x54], dx
8:A7D9  52                   push dx
8:A7DA  50                   push ax
8:A7DB  9ad85f0ba7           lcall 0xa70b, 0x5fd8  ; sub_s3:5FD8
8:A7E0  c45e06               les bx, ptr [bp + 6]
8:A7E3  26ff7706             push word ptr es:[bx + 6]
8:A7E7  6af8                 push -8
8:A7E9  9ae6a50000           lcall 0, 0xa5e6  ; USER.GetWindowWord
8:A7EE  50                   push ax
8:A7EF  666805011101         push 0x1110105
8:A7F5  666a00               push 0
8:A7F8  9af5a50000           lcall 0, 0xa5f5  ; USER.PostMessage
8:A7FD  6a01                 push 1
8:A7FF  66ff7606             push dword ptr [bp + 6]
8:A803  9a987bffa6           lcall 0xa6ff, 0x7b98  ; sub_s9:7B98
loc_A808:
8:A808  c9                   leave
8:A809  ca0600               retf 6

; ---------------- sub_s8:A80C FAR size=146 callers=0
8:A80C  55                   push bp
8:A80D  8bec                 mov bp, sp
8:A80F  66ff7606             push dword ptr [bp + 6]
8:A813  90                   nop
8:A814  0e                   push cs
8:A815  e8b0fe               call 0xa6c8  ; sub_s8:A6C8
8:A818  f6460a01             test byte ptr [bp + 0xa], 1
8:A81C  7409                 je 0xa827
8:A81E  66ff7606             push dword ptr [bp + 6]
8:A822  9ace17b6a7           lcall 0xa7b6, 0x17ce  ; operator_delete@s1:17CE
loc_A827:
8:A827  8b4606               mov ax, word ptr [bp + 6]
8:A82A  8b5608               mov dx, word ptr [bp + 8]
8:A82D  c9                   leave
8:A82E  ca0600               retf 6
8:A831  db 90 0c a8 38 a8 74 a1 3c a8 f4 a6 48 a8 c0 79 44
8:A841  db a8 3c 7b 4c a8 88 a7 94 a8 56 7f 50 a8 b2 7b 54
8:A851  db a8 1c 7f 58 a8 12 82 5c a8 86 7f 60 a8 0c 80 64
8:A861  db a8 54 80 68 a8 5e 7e 6c a8 58 81 70 a8 b6 81 74
8:A871  db a8 fe 81 7c a8 ea 60 88 a8 4a 82 80 a8 66 82 84
8:A881  db a8 de 78 9c a8 ee 60 8c a8 f4 60 90 a8 fa 60 98
8:A891  db a8 a4 a2 d7 a6 fe 60 74 a6 7e 80 06 a8

; ---------------- sub_s8:A89E FAR size=46 callers=1
8:A89E  55                   push bp
8:A89F  8bec                 mov bp, sp
8:A8A1  ff760a               push word ptr [bp + 0xa]
8:A8A4  66680000ca0f         push 0xfca0000
8:A8AA  666a01               push 1
8:A8AD  66ff7606             push dword ptr [bp + 6]
8:A8B1  90                   nop
8:A8B2  0e                   push cs
8:A8B3  e86cf8               call 0xa122  ; sub_s8:A122
8:A8B6  c45e06               les bx, ptr [bp + 6]
8:A8B9  26c70716ab           mov word ptr es:[bx], 0xab16
8:A8BE  26c7470234a8         mov word ptr es:[bx + 2], 0xa834  ; SEGMENT s8:0000
8:A8C4  8bc3                 mov ax, bx
8:A8C6  8cc2                 mov dx, es
8:A8C8  c9                   leave
8:A8C9  ca0600               retf 6

; ---------------- sub_s8:A8CC FAR size=44 callers=1
8:A8CC  55                   push bp
8:A8CD  8bec                 mov bp, sp
8:A8CF  c45e06               les bx, ptr [bp + 6]
8:A8D2  26c70716ab           mov word ptr es:[bx], 0xab16
8:A8D7  26c74702c2a8         mov word ptr es:[bx + 2], 0xa8c2  ; SEGMENT s8:0000
8:A8DD  26ff7706             push word ptr es:[bx + 6]
8:A8E1  66ff367c5b           push dword ptr [0x5b7c]
8:A8E6  90                   nop
8:A8E7  0e                   push cs
8:A8E8  e8f50d               call 0xb6e0  ; sub_s8:B6E0
8:A8EB  66ff7606             push dword ptr [bp + 6]
8:A8EF  90                   nop
8:A8F0  0e                   push cs
8:A8F1  e862f8               call 0xa156  ; sub_s8:A156
8:A8F4  c9                   leave
8:A8F5  ca0400               retf 4

; ---------------- sub_s8:A8F8 FAR size=122 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SendDlgItemMessage
8:A8F8  55                   push bp
8:A8F9  8bec                 mov bp, sp
8:A8FB  8b460e               mov ax, word ptr [bp + 0xe]
8:A8FE  2d1601               sub ax, 0x116
8:A901  741f                 je 0xa922
8:A903  2d0100               sub ax, 1
8:A906  7205                 jb 0xa90d
8:A908  2d0200               sub ax, 2
8:A90B  7649                 jbe 0xa956
loc_A90D:
8:A90D  66ff760c             push dword ptr [bp + 0xc]
8:A911  66ff7608             push dword ptr [bp + 8]
8:A915  ff7606               push word ptr [bp + 6]
8:A918  9a3c7b40a8           lcall 0xa840, 0x7b3c  ; sub_s9:7B3C
8:A91D  c9                   leave
8:A91E  ca0a00               retf 0xa
8:A921  db 90
loc_A922:
8:A922  c45e06               les bx, ptr [bp + 6]
8:A925  26ff7706             push word ptr es:[bx + 6]
8:A929  666801041a01         push 0x11a0401
8:A92F  666800000100         push 0x10000
8:A935  6a00                 push 0
8:A937  9a8b8f0000           lcall 0, 0x8f8b  ; USER.SendDlgItemMessage
8:A93C  c45e06               les bx, ptr [bp + 6]
8:A93F  26ff7706             push word ptr es:[bx + 6]
8:A943  681a01               push 0x11a
8:A946  9a61a90000           lcall 0, 0xa961  ; USER.GetDlgItem
8:A94B  50                   push ax
8:A94C  6a00                 push 0
loc_A94E:
8:A94E  9aa89d0000           lcall 0, 0x9da8  ; USER.EnableWindow
8:A953  eb15                 jmp 0xa96a
8:A955  db 90
loc_A956:
8:A956  c45e06               les bx, ptr [bp + 6]
8:A959  26ff7706             push word ptr es:[bx + 6]
8:A95D  681a01               push 0x11a
8:A960  9a9da70000           lcall 0, 0xa79d  ; USER.GetDlgItem
8:A965  50                   push ax
8:A966  6a01                 push 1
8:A968  ebe4                 jmp 0xa94e
loc_A96A:
8:A96A  b80100               mov ax, 1
8:A96D  99                   cdq
8:A96E  c9                   leave
8:A96F  ca0a00               retf 0xa

; ---------------- sub_s8:A972 FAR size=136 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.SendDlgItemMessage, USER.ShowWindow
8:A972  55                   push bp
8:A973  8bec                 mov bp, sp
8:A975  66ff7606             push dword ptr [bp + 6]
8:A979  9ae2781ba9           lcall 0xa91b, 0x78e2  ; sub_s9:78E2
8:A97E  c45e06               les bx, ptr [bp + 6]
8:A981  26ff7706             push word ptr es:[bx + 6]
8:A985  666801041601         push 0x1160401
8:A98B  666800000100         push 0x10000
8:A991  6a00                 push 0
8:A993  9aaea90000           lcall 0, 0xa9ae  ; USER.SendDlgItemMessage
8:A998  c45e06               les bx, ptr [bp + 6]
8:A99B  26ff7706             push word ptr es:[bx + 6]
8:A99F  666801041a01         push 0x11a0401
8:A9A5  666800000100         push 0x10000
8:A9AB  6a00                 push 0
8:A9AD  9a38a90000           lcall 0, 0xa938  ; USER.SendDlgItemMessage
8:A9B2  c45e06               les bx, ptr [bp + 6]
8:A9B5  26ff7706             push word ptr es:[bx + 6]
8:A9B9  681a01               push 0x11a
8:A9BC  9a47a90000           lcall 0, 0xa947  ; USER.GetDlgItem
8:A9C1  50                   push ax
8:A9C2  6a00                 push 0
8:A9C4  9a4fa90000           lcall 0, 0xa94f  ; USER.EnableWindow
8:A9C9  666801000400         push 0x40001
8:A9CF  66ff36a002           push dword ptr [0x2a0]
8:A9D4  9a7c5c6ea7           lcall 0xa76e, 0x5c7c  ; sub_s2:5C7C
8:A9D9  c45e06               les bx, ptr [bp + 6]
8:A9DC  2689878c00           mov word ptr es:[bx + 0x8c], ax
8:A9E1  06                   push es
8:A9E2  53                   push bx
8:A9E3  90                   nop
8:A9E4  0e                   push cs
8:A9E5  e8a4f7               call 0xa18c  ; sub_s8:A18C
8:A9E8  c45e06               les bx, ptr [bp + 6]
8:A9EB  26ff7706             push word ptr es:[bx + 6]
8:A9EF  6a05                 push 5
8:A9F1  9a7fa70000           lcall 0, 0xa77f  ; USER.ShowWindow
8:A9F6  c9                   leave
8:A9F7  ca0400               retf 4

; ---------------- sub_s8:A9FA size=246 callers=0
;   apis: USER.GetWindowWord, USER.PostMessage, USER.SendDlgItemMessage
8:A9FA  c80e0000             enter 0xe, 0
8:A9FE  837e0a00             cmp word ptr [bp + 0xa], 0
8:AA02  0f84e600             je 0xaaec
8:AA06  6a02                 push 2
8:AA08  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:AA0D  9aba20d1a7           lcall 0xa7d1, 0x20ba  ; sub_s3:20BA
8:AA12  8946fc               mov word ptr [bp - 4], ax
8:AA15  8956fe               mov word ptr [bp - 2], dx
8:AA18  c45e06               les bx, ptr [bp + 6]
8:AA1B  26ff7706             push word ptr es:[bx + 6]
8:AA1F  666800041601         push 0x1160400
8:AA25  666a00               push 0
8:AA28  6a00                 push 0
8:AA2A  9a4faa0000           lcall 0, 0xaa4f  ; USER.SendDlgItemMessage
8:AA2F  0bd0                 or dx, ax
8:AA31  7409                 je 0xaa3c
8:AA33  c706ae130100         mov word ptr [0x13ae], 1
8:AA39  eb6a                 jmp 0xaaa5
8:AA3B  db 90
loc_AA3C:
8:AA3C  c45e06               les bx, ptr [bp + 6]
8:AA3F  26ff7706             push word ptr es:[bx + 6]
8:AA43  666800041701         push 0x1170400
8:AA49  666a00               push 0
8:AA4C  6a00                 push 0
8:AA4E  9a73aa0000           lcall 0, 0xaa73  ; USER.SendDlgItemMessage
8:AA53  0bd0                 or dx, ax
8:AA55  7409                 je 0xaa60
8:AA57  c706ae130200         mov word ptr [0x13ae], 2
8:AA5D  eb46                 jmp 0xaaa5
8:AA5F  db 90
loc_AA60:
8:AA60  c45e06               les bx, ptr [bp + 6]
8:AA63  26ff7706             push word ptr es:[bx + 6]
8:AA67  666800041801         push 0x1180400
8:AA6D  666a00               push 0
8:AA70  6a00                 push 0
8:AA72  9a97aa0000           lcall 0, 0xaa97  ; USER.SendDlgItemMessage
8:AA77  0bd0                 or dx, ax
8:AA79  7409                 je 0xaa84
8:AA7B  c706ae130300         mov word ptr [0x13ae], 3
8:AA81  eb22                 jmp 0xaaa5
8:AA83  db 90
loc_AA84:
8:AA84  c45e06               les bx, ptr [bp + 6]
8:AA87  26ff7706             push word ptr es:[bx + 6]
8:AA8B  666800041901         push 0x1190400
8:AA91  666a00               push 0
8:AA94  6a00                 push 0
8:AA96  9ab8aa0000           lcall 0, 0xaab8  ; USER.SendDlgItemMessage
8:AA9B  0bd0                 or dx, ax
8:AA9D  7406                 je 0xaaa5
8:AA9F  c706ae130400         mov word ptr [0x13ae], 4
loc_AAA5:
8:AAA5  c45e06               les bx, ptr [bp + 6]
8:AAA8  26ff7706             push word ptr es:[bx + 6]
8:AAAC  666800041a01         push 0x11a0400
8:AAB2  666a00               push 0
8:AAB5  6a00                 push 0
8:AAB7  9a94a90000           lcall 0, 0xa994  ; USER.SendDlgItemMessage
8:AABC  c45efc               les bx, ptr [bp - 4]
8:AABF  2689878200           mov word ptr es:[bx + 0x82], ax
8:AAC4  c45e06               les bx, ptr [bp + 6]
8:AAC7  26ff7706             push word ptr es:[bx + 6]
8:AACB  6af8                 push -8
8:AACD  9aeaa70000           lcall 0, 0xa7ea  ; USER.GetWindowWord
8:AAD2  50                   push ax
8:AAD3  666805011101         push 0x1110105
8:AAD9  666a00               push 0
8:AADC  9af9a70000           lcall 0, 0xa7f9  ; USER.PostMessage
8:AAE1  6a01                 push 1
8:AAE3  66ff7606             push dword ptr [bp + 6]
8:AAE7  9a987b7ca9           lcall 0xa97c, 0x7b98  ; sub_s9:7B98
loc_AAEC:
8:AAEC  c9                   leave
8:AAED  ca0600               retf 6

; ---------------- sub_s8:AAF0 FAR size=146 callers=0
8:AAF0  55                   push bp
8:AAF1  8bec                 mov bp, sp
8:AAF3  66ff7606             push dword ptr [bp + 6]
8:AAF7  90                   nop
8:AAF8  0e                   push cs
8:AAF9  e8d0fd               call 0xa8cc  ; sub_s8:A8CC
8:AAFC  f6460a01             test byte ptr [bp + 0xa], 1
8:AB00  7409                 je 0xab0b
8:AB02  66ff7606             push dword ptr [bp + 6]
8:AB06  9ace1725a8           lcall 0xa825, 0x17ce  ; operator_delete@s1:17CE
loc_AB0B:
8:AB0B  8b4606               mov ax, word ptr [bp + 6]
8:AB0E  8b5608               mov dx, word ptr [bp + 8]
8:AB11  c9                   leave
8:AB12  ca0600               retf 6
8:AB15  db 90 f0 aa 1c ab 74 a1 20 ab 72 a9 28 ab c0 79 30
8:AB25  db ab f8 a8 2c ab fa a9 78 ab 56 7f 34 ab b2 7b 38
8:AB35  db ab 1c 7f 3c ab 12 82 40 ab 86 7f 44 ab 0c 80 48
8:AB45  db ab 54 80 4c ab 5e 7e 50 ab 58 81 54 ab b6 81 58
8:AB55  db ab fe 81 60 ab ea 60 6c ab 4a 82 64 ab 66 82 68
8:AB65  db ab de 78 80 ab ee 60 70 ab f4 60 74 ab fa 60 7c
8:AB75  db ab a4 a2 db a8 fe 60 78 a8 7e 80 ea aa

; ---------------- sub_s8:AB82 FAR size=46 callers=1
8:AB82  55                   push bp
8:AB83  8bec                 mov bp, sp
8:AB85  ff760a               push word ptr [bp + 0xa]
8:AB88  66680000d30f         push 0xfd30000
8:AB8E  666a01               push 1
8:AB91  66ff7606             push dword ptr [bp + 6]
8:AB95  9a287724ab           lcall 0xab24, 0x7728  ; sub_s9:7728
8:AB9A  c45e06               les bx, ptr [bp + 6]
8:AB9D  26c70772ad           mov word ptr es:[bx], 0xad72
8:ABA2  26c7470218ab         mov word ptr es:[bx + 2], 0xab18  ; SEGMENT s8:0000
8:ABA8  8bc3                 mov ax, bx
8:ABAA  8cc2                 mov dx, es
8:ABAC  c9                   leave
8:ABAD  ca0600               retf 6

; ---------------- sub_s8:ABB0 FAR size=44 callers=1
8:ABB0  55                   push bp
8:ABB1  8bec                 mov bp, sp
8:ABB3  c45e06               les bx, ptr [bp + 6]
8:ABB6  26c70772ad           mov word ptr es:[bx], 0xad72
8:ABBB  26c74702a6ab         mov word ptr es:[bx + 2], 0xaba6  ; SEGMENT s8:0000
8:ABC1  26ff7706             push word ptr es:[bx + 6]
8:ABC5  66ff367c5b           push dword ptr [0x5b7c]
8:ABCA  90                   nop
8:ABCB  0e                   push cs
8:ABCC  e8110b               call 0xb6e0  ; sub_s8:B6E0
8:ABCF  66ff7606             push dword ptr [bp + 6]
8:ABD3  9a2c7898ab           lcall 0xab98, 0x782c  ; sub_s9:782C
8:ABD8  c9                   leave
8:ABD9  ca0400               retf 4

; ---------------- sub_s8:ABDC FAR size=92 callers=1
;   apis: USER.GetDlgItem, USER.GetWindowRect, USER.SetWindowPos
8:ABDC  c8100000             enter 0x10, 0
8:ABE0  c45e06               les bx, ptr [bp + 6]
8:ABE3  26ff7706             push word ptr es:[bx + 6]
8:ABE7  8d46f8               lea ax, [bp - 8]
8:ABEA  16                   push ss
8:ABEB  50                   push ax
8:ABEC  9a07ac0000           lcall 0, 0xac07  ; USER.GetWindowRect
8:ABF1  c45e06               les bx, ptr [bp + 6]
8:ABF4  26ff7706             push word ptr es:[bx + 6]
8:ABF8  68d70f               push 0xfd7
8:ABFB  9abda90000           lcall 0, 0xa9bd  ; USER.GetDlgItem
8:AC00  50                   push ax
8:AC01  8d46f0               lea ax, [bp - 0x10]
8:AC04  16                   push ss
8:AC05  50                   push ax
8:AC06  9a53a20000           lcall 0, 0xa253  ; USER.GetWindowRect
8:AC0B  8b46f8               mov ax, word ptr [bp - 8]
8:AC0E  2946fc               sub word ptr [bp - 4], ax
8:AC11  8b46f2               mov ax, word ptr [bp - 0xe]
8:AC14  2b46fa               sub ax, word ptr [bp - 6]
8:AC17  2d0200               sub ax, 2
8:AC1A  8946fe               mov word ptr [bp - 2], ax
8:AC1D  c45e06               les bx, ptr [bp + 6]
8:AC20  26ff7706             push word ptr es:[bx + 6]
8:AC24  666a00               push 0
8:AC27  6a00                 push 0
8:AC29  ff76fc               push word ptr [bp - 4]
8:AC2C  50                   push ax
8:AC2D  6a06                 push 6
8:AC2F  9a919d0000           lcall 0, 0x9d91  ; USER.SetWindowPos
8:AC34  c9                   leave
8:AC35  ca0400               retf 4

; ---------------- sub_s8:AC38 size=276 callers=0
;   apis: GDI.GetStockObject, GDI.SetBkColor, GDI.SetTextColor, USER.GetDlgCtrlID
8:AC38  c8120000             enter 0x12, 0
8:AC3C  6a04                 push 4
8:AC3E  9affff0000           lcall 0, 0xffff  ; GDI.GetStockObject
8:AC43  8946fe               mov word ptr [bp - 2], ax
8:AC46  66833e785b00         cmp dword ptr [0x5b78], 0
8:AC4C  0f858300             jne 0xacd3
8:AC50  c41e3042             les bx, ptr [0x4230]
8:AC54  66268b470e           mov eax, dword ptr es:[bx + 0xe]
8:AC59  6650                 push eax
8:AC5B  9a724dd7a9           lcall 0xa9d7, 0x4d72  ; sub_s2:4D72
8:AC60  8946f6               mov word ptr [bp - 0xa], ax
8:AC63  8956f8               mov word ptr [bp - 8], dx
8:AC66  c45ef6               les bx, ptr [bp - 0xa]
8:AC69  2ac0                 sub al, al
8:AC6B  268aa7ed03           mov ah, byte ptr es:[bx + 0x3ed]
8:AC70  268a8fee03           mov cl, byte ptr es:[bx + 0x3ee]
8:AC75  2aed                 sub ch, ch
8:AC77  0bc1                 or ax, cx
8:AC79  268a8fec03           mov cl, byte ptr es:[bx + 0x3ec]
8:AC7E  a36c5b               mov word ptr [0x5b6c], ax
8:AC81  890e6e5b             mov word ptr [0x5b6e], cx
8:AC85  268aa7e503           mov ah, byte ptr es:[bx + 0x3e5]
8:AC8A  2ac0                 sub al, al
8:AC8C  268a8fe603           mov cl, byte ptr es:[bx + 0x3e6]
8:AC91  0bc1                 or ax, cx
8:AC93  268a8fe403           mov cl, byte ptr es:[bx + 0x3e4]
8:AC98  a3705b               mov word ptr [0x5b70], ax
8:AC9B  890e725b             mov word ptr [0x5b72], cx
8:AC9F  268aa7f903           mov ah, byte ptr es:[bx + 0x3f9]
8:ACA4  2ac0                 sub al, al
8:ACA6  268a8ffa03           mov cl, byte ptr es:[bx + 0x3fa]
8:ACAB  0bc1                 or ax, cx
8:ACAD  268a8ff803           mov cl, byte ptr es:[bx + 0x3f8]
8:ACB2  a3745b               mov word ptr [0x5b74], ax
8:ACB5  890e765b             mov word ptr [0x5b76], cx
8:ACB9  268aa79500           mov ah, byte ptr es:[bx + 0x95]
8:ACBE  2ac0                 sub al, al
8:ACC0  268a8f9600           mov cl, byte ptr es:[bx + 0x96]
8:ACC5  0bc1                 or ax, cx
8:ACC7  268a8f9400           mov cl, byte ptr es:[bx + 0x94]
8:ACCC  a3785b               mov word ptr [0x5b78], ax
8:ACCF  890e7a5b             mov word ptr [0x5b7a], cx
loc_ACD3:
8:ACD3  8b460c               mov ax, word ptr [bp + 0xc]
8:ACD6  2d0300               sub ax, 3
8:ACD9  7615                 jbe 0xacf0
8:ACDB  48                   dec ax
8:ACDC  7428                 je 0xad06
8:ACDE  2d0100               sub ax, 1
8:ACE1  7205                 jb 0xace8
8:ACE3  2d0100               sub ax, 1
8:ACE6  7608                 jbe 0xacf0
loc_ACE8:
8:ACE8  33c0                 xor ax, ax
8:ACEA  99                   cdq
8:ACEB  c9                   leave
8:ACEC  ca0a00               retf 0xa
8:ACEF  db 90
loc_ACF0:
8:ACF0  ff760a               push word ptr [bp + 0xa]
8:ACF3  9affff0000           lcall 0, 0xffff  ; USER.GetDlgCtrlID
8:ACF8  2dd40f               sub ax, 0xfd4
8:ACFB  7431                 je 0xad2e
8:ACFD  48                   dec ax
8:ACFE  7406                 je 0xad06
8:AD00  48                   dec ax
8:AD01  7421                 je 0xad24
8:AD03  48                   dec ax
8:AD04  7432                 je 0xad38
loc_AD06:
8:AD06  ff760e               push word ptr [bp + 0xe]
8:AD09  66ff36785b           push dword ptr [0x5b78]
loc_AD0E:
8:AD0E  9a5f9e0000           lcall 0, 0x9e5f  ; GDI.SetTextColor
8:AD13  ff760e               push word ptr [bp + 0xe]
8:AD16  666800000001         push 0x1000000
8:AD1C  9a6d9e0000           lcall 0, 0x9e6d  ; GDI.SetBkColor
8:AD21  eb1f                 jmp 0xad42
8:AD23  db 90
loc_AD24:
8:AD24  ff760e               push word ptr [bp + 0xe]
8:AD27  66ff366c5b           push dword ptr [0x5b6c]
8:AD2C  ebe0                 jmp 0xad0e
loc_AD2E:
8:AD2E  ff760e               push word ptr [bp + 0xe]
8:AD31  66ff36705b           push dword ptr [0x5b70]
8:AD36  ebd6                 jmp 0xad0e
loc_AD38:
8:AD38  ff760e               push word ptr [bp + 0xe]
8:AD3B  66ff36745b           push dword ptr [0x5b74]
8:AD40  ebcc                 jmp 0xad0e
loc_AD42:
8:AD42  8b46fe               mov ax, word ptr [bp - 2]
8:AD45  8cda                 mov dx, ds
8:AD47  c9                   leave
8:AD48  ca0a00               retf 0xa
8:AD4B  db 00

; ---------------- sub_s8:AD4C FAR size=146 callers=0
8:AD4C  55                   push bp
8:AD4D  8bec                 mov bp, sp
8:AD4F  66ff7606             push dword ptr [bp + 6]
8:AD53  90                   nop
8:AD54  0e                   push cs
8:AD55  e858fe               call 0xabb0  ; sub_s8:ABB0
8:AD58  f6460a01             test byte ptr [bp + 0xa], 1
8:AD5C  7409                 je 0xad67
8:AD5E  66ff7606             push dword ptr [bp + 6]
8:AD62  9ace1709ab           lcall 0xab09, 0x17ce  ; operator_delete@s1:17CE
loc_AD67:
8:AD67  8b4606               mov ax, word ptr [bp + 6]
8:AD6A  8b5608               mov dx, word ptr [bp + 8]
8:AD6D  c9                   leave
8:AD6E  ca0600               retf 6
8:AD71  db 90 4c ad a8 ad 10 3a 5e ac e2 78 80 ad c0 79 84
8:AD81  db ad 3c 7b 88 ad 98 7b 8c ad 56 7f 90 ad b2 7b 94
8:AD91  db ad 1c 7f 98 ad 12 82 9c ad 86 7f a0 ad 0c 80 a4
8:ADA1  db ad 54 80 ac ad 38 ac d4 ad 58 81 b0 ad b6 81 b4
8:ADB1  db ad fe 81 bc ad ea 60 c8 ad 4a 82 c0 ad 66 82 c4
8:ADC1  db ad de 78 dc ad ee 60 cc ad f4 60 d0 ad fa 60 d8
8:ADD1  db ad a4 a2 bf ab fe 60 5c ab 7e 80 d6 ab

; ---------------- sub_s8:ADDE FAR size=42 callers=1
8:ADDE  55                   push bp
8:ADDF  8bec                 mov bp, sp
8:ADE1  66ff760c             push dword ptr [bp + 0xc]
8:ADE5  66ff7608             push dword ptr [bp + 8]
8:ADE9  ff7606               push word ptr [bp + 6]
8:ADEC  90                   nop
8:ADED  0e                   push cs
8:ADEE  e881ed               call 0x9b72  ; sub_s8:9B72
8:ADF1  c45e06               les bx, ptr [bp + 6]
8:ADF4  26c7074eae           mov word ptr es:[bx], 0xae4e
8:ADF9  26c7470274ad         mov word ptr es:[bx + 2], 0xad74  ; SEGMENT s8:0000
8:ADFF  8bc3                 mov ax, bx
8:AE01  8cc2                 mov dx, es
8:AE03  c9                   leave
8:AE04  ca0a00               retf 0xa
8:AE07  db 00

; ---------------- sub_s8:AE08 FAR size=32 callers=1
8:AE08  c8040000             enter 4, 0
8:AE0C  c45e06               les bx, ptr [bp + 6]
8:AE0F  26c7074eae           mov word ptr es:[bx], 0xae4e
8:AE14  26c74702fdad         mov word ptr es:[bx + 2], 0xadfd  ; SEGMENT s8:0000
8:AE1A  66ff7606             push dword ptr [bp + 6]
8:AE1E  9af8b07cad           lcall 0xad7c, 0xb0f8  ; sub_s9:B0F8
8:AE23  c9                   leave
8:AE24  ca0400               retf 4
8:AE27  db 00

; ---------------- sub_s8:AE28 FAR size=162 callers=0
8:AE28  55                   push bp
8:AE29  8bec                 mov bp, sp
8:AE2B  66ff7606             push dword ptr [bp + 6]
8:AE2F  90                   nop
8:AE30  0e                   push cs
8:AE31  e8d4ff               call 0xae08  ; sub_s8:AE08
8:AE34  f6460a01             test byte ptr [bp + 0xa], 1
8:AE38  7409                 je 0xae43
8:AE3A  66ff7606             push dword ptr [bp + 6]
8:AE3E  9ace1765ad           lcall 0xad65, 0x17ce  ; operator_delete@s1:17CE
loc_AE43:
8:AE43  8b4606               mov ax, word ptr [bp + 6]
8:AE46  8b5608               mov dx, word ptr [bp + 8]
8:AE49  c9                   leave
8:AE4A  ca0600               retf 6
8:AE4D  db 90 28 ae 58 ae 10 3a 78 ad c8 9b 60 ae 16 b3 64
8:AE5D  db ae ec 9c 74 ae 26 b7 68 ae 56 7f 6c ae b2 7b 70
8:AE6D  db ae 1c 7f 78 ae 48 88 84 ae 86 7f 7c ae 0c 80 80
8:AE7D  db ae 54 80 88 ae cc 9d b0 ae 58 81 8c ae b6 81 90
8:AE8D  db ae fe 81 98 ae ea 60 a4 ae 4a 82 9c ae 66 82 a0
8:AE9D  db ae de 78 ac ae ee 60 a8 ae f4 60 b4 ae c8 b4 b8
8:AEAD  db ae 42 88 c8 ae fe 60 b8 ad 7e 80 bc ae 3c b4 c0
8:AEBD  db ae 5e b4 c4 ae 7c b1 21 ae 4c 88 18 ae

; ---------------- sub_s8:AECA FAR size=106 callers=1
8:AECA  c8bc0000             enter 0xbc, 0
8:AECE  33c0                 xor ax, ax
8:AED0  c45e06               les bx, ptr [bp + 6]
8:AED3  268987ac00           mov word ptr es:[bx + 0xac], ax
8:AED8  268987ae00           mov word ptr es:[bx + 0xae], ax
8:AEDD  66833e7c5b00         cmp dword ptr [0x5b7c], 0
8:AEE3  7508                 jne 0xaeed
8:AEE5  891e7c5b             mov word ptr [0x5b7c], bx
8:AEE9  8c067e5b             mov word ptr [0x5b7e], es
loc_AEED:
8:AEED  66680000ac00         push 0xac0000
8:AEF3  66ff7606             push dword ptr [bp + 6]
8:AEF7  9a064941ae           lcall 0xae41, 0x4906  ; sub_s1:4906
8:AEFC  83c408               add sp, 8
8:AEFF  8d46a6               lea ax, [bp - 0x5a]
8:AF02  16                   push ss
8:AF03  50                   push ax
8:AF04  9aee801eaf           lcall 0xaf1e, 0x80ee  ; sub_s2:80EE
8:AF09  8d864cff             lea ax, [bp - 0xb4]
8:AF0D  16                   push ss
8:AF0E  50                   push ax
8:AF0F  9a54985cae           lcall 0xae5c, 0x9854  ; sub_s9:9854
8:AF14  c7864cff9a38         mov word ptr [bp - 0xb4], 0x389a
8:AF1A  c7864eff28af         mov word ptr [bp - 0xb2], 0xaf28  ; SEGMENT s2:0000
8:AF20  8d46a6               lea ax, [bp - 0x5a]
8:AF23  16                   push ss
8:AF24  50                   push ax
8:AF25  9a688154ae           lcall 0xae54, 0x8168  ; sub_s2:8168
8:AF2A  8b4606               mov ax, word ptr [bp + 6]
8:AF2D  8b5608               mov dx, word ptr [bp + 8]
8:AF30  c9                   leave
8:AF31  ca0400               retf 4

; ---------------- sub_s8:AF34 FAR size=12 callers=1
8:AF34  66c7067c5b00000000   mov dword ptr [0x5b7c], 0
8:AF3D  ca0400               retf 4

; ---------------- sub_s8:AF40 FAR size=1780 callers=29
8:AF40  c80e0000             enter 0xe, 0
8:AF44  56                   push si
8:AF45  ff760c               push word ptr [bp + 0xc]
8:AF48  66ff7606             push dword ptr [bp + 6]
8:AF4C  90                   nop
8:AF4D  0e                   push cs
8:AF4E  e8dd07               call 0xb72e  ; sub_s8:B72E
8:AF51  0bc0                 or ax, ax
8:AF53  0f85c806             jne 0xb61f
8:AF57  a3825b               mov word ptr [0x5b82], ax
8:AF5A  8b460c               mov ax, word ptr [bp + 0xc]
8:AF5D  e91806               jmp 0xb578
loc_AF60:
8:AF60  689800               push 0x98
8:AF63  9a9c1786af           lcall 0xaf86, 0x179c  ; operator_new@s1:179C
8:AF68  83c402               add sp, 2
8:AF6B  8956fa               mov word ptr [bp - 6], dx
8:AF6E  0bd0                 or dx, ax
8:AF70  742e                 je 0xafa0
8:AF72  ff760a               push word ptr [bp + 0xa]
8:AF75  ff76fa               push word ptr [bp - 6]
8:AF78  50                   push ax
8:AF79  90                   nop
8:AF7A  0e                   push cs
8:AF7B  e892cd               call 0x7d10  ; sub_s8:7D10
8:AF7E  eb23                 jmp 0xafa3
loc_AF80:
8:AF80  689800               push 0x98
8:AF83  9a9c17bcaf           lcall 0xafbc, 0x179c  ; operator_new@s1:179C
8:AF88  83c402               add sp, 2
8:AF8B  8956fa               mov word ptr [bp - 6], dx
8:AF8E  0bd0                 or dx, ax
8:AF90  740e                 je 0xafa0
8:AF92  ff760a               push word ptr [bp + 0xa]
8:AF95  ff76fa               push word ptr [bp - 6]
8:AF98  50                   push ax
8:AF99  90                   nop
8:AF9A  0e                   push cs
8:AF9B  e80cdd               call 0x8caa  ; sub_s8:8CAA
8:AF9E  eb03                 jmp 0xafa3
loc_AFA0:
8:AFA0  33c0                 xor ax, ax
8:AFA2  99                   cdq
loc_AFA3:
8:AFA3  8b5e0c               mov bx, word ptr [bp + 0xc]
8:AFA6  c1e302               shl bx, 2
8:AFA9  c47606               les si, ptr [bp + 6]
8:AFAC  268900               mov word ptr es:[bx + si], ax
8:AFAF  26895002             mov word ptr es:[bx + si + 2], dx
8:AFB3  e92406               jmp 0xb5da
loc_AFB6:
8:AFB6  689600               push 0x96
8:AFB9  9a9c17dcaf           lcall 0xafdc, 0x179c  ; operator_new@s1:179C
8:AFBE  83c402               add sp, 2
8:AFC1  8956fa               mov word ptr [bp - 6], dx
8:AFC4  0bd0                 or dx, ax
8:AFC6  74d8                 je 0xafa0
8:AFC8  ff760a               push word ptr [bp + 0xa]
8:AFCB  ff76fa               push word ptr [bp - 6]
8:AFCE  50                   push ax
8:AFCF  9a0264f2af           lcall 0xaff2, 0x6402  ; sub_s9:6402
8:AFD4  ebcd                 jmp 0xafa3
loc_AFD6:
8:AFD6  689c00               push 0x9c
8:AFD9  9a9c17fcaf           lcall 0xaffc, 0x179c  ; operator_new@s1:179C
8:AFDE  83c402               add sp, 2
8:AFE1  8956fa               mov word ptr [bp - 6], dx
8:AFE4  0bd0                 or dx, ax
8:AFE6  74b8                 je 0xafa0
8:AFE8  ff760a               push word ptr [bp + 0xa]
8:AFEB  ff76fa               push word ptr [bp - 6]
8:AFEE  50                   push ax
8:AFEF  9a84ac34b0           lcall 0xb034, 0xac84  ; sub_s9:AC84
8:AFF4  ebad                 jmp 0xafa3
loc_AFF6:
8:AFF6  68a000               push 0xa0
8:AFF9  9a9c171cb0           lcall 0xb01c, 0x179c  ; operator_new@s1:179C
8:AFFE  83c402               add sp, 2
8:B001  8956fa               mov word ptr [bp - 6], dx
8:B004  0bd0                 or dx, ax
8:B006  7498                 je 0xafa0
8:B008  ff760a               push word ptr [bp + 0xa]
8:B00B  ff76fa               push word ptr [bp - 6]
8:B00E  50                   push ax
8:B00F  90                   nop
8:B010  0e                   push cs
8:B011  e8ded8               call 0x88f2  ; sub_s8:88F2
8:B014  eb8d                 jmp 0xafa3
loc_B016:
8:B016  68a000               push 0xa0
8:B019  9a9c1740b0           lcall 0xb040, 0x179c  ; operator_new@s1:179C
8:B01E  83c402               add sp, 2
8:B021  8956fa               mov word ptr [bp - 6], dx
8:B024  0bd0                 or dx, ax
8:B026  0f8476ff             je 0xafa0
8:B02A  ff760a               push word ptr [bp + 0xa]
8:B02D  ff76fa               push word ptr [bp - 6]
8:B030  50                   push ax
8:B031  9a16ca58b0           lcall 0xb058, 0xca16  ; sub_s9:CA16
8:B036  e96aff               jmp 0xafa3
8:B039  db 90
loc_B03A:
8:B03A  68a200               push 0xa2
8:B03D  9a9c1764b0           lcall 0xb064, 0x179c  ; operator_new@s1:179C
8:B042  83c402               add sp, 2
8:B045  8956fa               mov word ptr [bp - 6], dx
8:B048  0bd0                 or dx, ax
8:B04A  0f8452ff             je 0xafa0
8:B04E  ff760a               push word ptr [bp + 0xa]
8:B051  ff76fa               push word ptr [bp - 6]
8:B054  50                   push ax
8:B055  9af8d0d6b0           lcall 0xb0d6, 0xd0f8  ; sub_s9:D0F8
8:B05A  e946ff               jmp 0xafa3
8:B05D  db 90
loc_B05E:
8:B05E  689e02               push 0x29e
8:B061  9a9c178eb0           lcall 0xb08e, 0x179c  ; operator_new@s1:179C
8:B066  83c402               add sp, 2
8:B069  8956fa               mov word ptr [bp - 6], dx
8:B06C  0bd0                 or dx, ax
8:B06E  0f842eff             je 0xafa0
8:B072  ff760a               push word ptr [bp + 0xa]
8:B075  666a00               push 0
8:B078  666a00               push 0
8:B07B  ff76fa               push word ptr [bp - 6]
8:B07E  50                   push ax
8:B07F  90                   nop
8:B080  0e                   push cs
8:B081  e8580d               call 0xbddc  ; sub_s8:BDDC
8:B084  e91cff               jmp 0xafa3
8:B087  db 90
loc_B088:
8:B088  689a00               push 0x9a
8:B08B  9a9c17b8b0           lcall 0xb0b8, 0x179c  ; operator_new@s1:179C
8:B090  83c402               add sp, 2
8:B093  8956fa               mov word ptr [bp - 6], dx
8:B096  0bd0                 or dx, ax
8:B098  0f8404ff             je 0xafa0
8:B09C  ff760a               push word ptr [bp + 0xa]
8:B09F  666a00               push 0
8:B0A2  666a00               push 0
8:B0A5  ff76fa               push word ptr [bp - 6]
8:B0A8  50                   push ax
8:B0A9  90                   nop
8:B0AA  0e                   push cs
8:B0AB  e8f413               call 0xc4a2  ; sub_s8:C4A2
8:B0AE  e9f2fe               jmp 0xafa3
8:B0B1  db 90
loc_B0B2:
8:B0B2  689a02               push 0x29a
8:B0B5  9a9c17e2b0           lcall 0xb0e2, 0x179c  ; operator_new@s1:179C
8:B0BA  83c402               add sp, 2
8:B0BD  8956fa               mov word ptr [bp - 6], dx
8:B0C0  0bd0                 or dx, ax
8:B0C2  0f84dafe             je 0xafa0
8:B0C6  ff760a               push word ptr [bp + 0xa]
8:B0C9  666a00               push 0
8:B0CC  666a00               push 0
8:B0CF  ff76fa               push word ptr [bp - 6]
8:B0D2  50                   push ax
8:B0D3  9aa22e00b1           lcall 0xb100, 0x2ea2  ; sub_s9:2EA2
8:B0D8  e9c8fe               jmp 0xafa3
8:B0DB  db 90
loc_B0DC:
8:B0DC  68a600               push 0xa6
8:B0DF  9a9c170cb1           lcall 0xb10c, 0x179c  ; operator_new@s1:179C
8:B0E4  83c402               add sp, 2
8:B0E7  8956fa               mov word ptr [bp - 6], dx
8:B0EA  0bd0                 or dx, ax
8:B0EC  0f84b0fe             je 0xafa0
8:B0F0  ff760a               push word ptr [bp + 0xa]
8:B0F3  666a00               push 0
8:B0F6  666a00               push 0
8:B0F9  ff76fa               push word ptr [bp - 6]
8:B0FC  50                   push ax
8:B0FD  9a66392ab1           lcall 0xb12a, 0x3966  ; sub_s9:3966
8:B102  e99efe               jmp 0xafa3
8:B105  db 90
loc_B106:
8:B106  689a00               push 0x9a
8:B109  9a9c1736b1           lcall 0xb136, 0x179c  ; operator_new@s1:179C
8:B10E  83c402               add sp, 2
8:B111  8956fa               mov word ptr [bp - 6], dx
8:B114  0bd0                 or dx, ax
8:B116  0f8486fe             je 0xafa0
8:B11A  ff760a               push word ptr [bp + 0xa]
8:B11D  666a00               push 0
8:B120  666a00               push 0
8:B123  ff76fa               push word ptr [bp - 6]
8:B126  50                   push ax
8:B127  9aa23454b1           lcall 0xb154, 0x34a2  ; sub_s9:34A2
8:B12C  e974fe               jmp 0xafa3
8:B12F  db 90
loc_B130:
8:B130  689200               push 0x92
8:B133  9a9c1760b1           lcall 0xb160, 0x179c  ; operator_new@s1:179C
8:B138  83c402               add sp, 2
8:B13B  8956fa               mov word ptr [bp - 6], dx
8:B13E  0bd0                 or dx, ax
8:B140  0f845cfe             je 0xafa0
8:B144  ff760a               push word ptr [bp + 0xa]
8:B147  666a00               push 0
8:B14A  666a00               push 0
8:B14D  ff76fa               push word ptr [bp - 6]
8:B150  50                   push ax
8:B151  9ae806a8b1           lcall 0xb1a8, 0x6e8  ; sub_s9:06E8
8:B156  e94afe               jmp 0xafa3
8:B159  db 90
loc_B15A:
8:B15A  688e00               push 0x8e
8:B15D  9a9c178ab1           lcall 0xb18a, 0x179c  ; operator_new@s1:179C
8:B162  83c402               add sp, 2
8:B165  8956fa               mov word ptr [bp - 6], dx
8:B168  0bd0                 or dx, ax
8:B16A  0f8432fe             je 0xafa0
8:B16E  ff760a               push word ptr [bp + 0xa]
8:B171  666a00               push 0
8:B174  666a00               push 0
8:B177  ff76fa               push word ptr [bp - 6]
8:B17A  50                   push ax
8:B17B  90                   nop
8:B17C  0e                   push cs
8:B17D  e8f6ed               call 0x9f76  ; sub_s8:9F76
8:B180  e920fe               jmp 0xafa3
8:B183  db 90
loc_B184:
8:B184  689600               push 0x96
8:B187  9a9c17b4b1           lcall 0xb1b4, 0x179c  ; operator_new@s1:179C
8:B18C  83c402               add sp, 2
8:B18F  8956fa               mov word ptr [bp - 6], dx
8:B192  0bd0                 or dx, ax
8:B194  0f8408fe             je 0xafa0
8:B198  ff760a               push word ptr [bp + 0xa]
8:B19B  666a00               push 0
8:B19E  666a00               push 0
8:B1A1  ff76fa               push word ptr [bp - 6]
8:B1A4  50                   push ax
8:B1A5  9a1c1826b2           lcall 0xb226, 0x181c  ; sub_s9:181C
8:B1AA  e9f6fd               jmp 0xafa3
8:B1AD  db 90
loc_B1AE:
8:B1AE  689200               push 0x92
8:B1B1  9a9c17deb1           lcall 0xb1de, 0x179c  ; operator_new@s1:179C
8:B1B6  83c402               add sp, 2
8:B1B9  8956fa               mov word ptr [bp - 6], dx
8:B1BC  0bd0                 or dx, ax
8:B1BE  0f84defd             je 0xafa0
8:B1C2  ff760a               push word ptr [bp + 0xa]
8:B1C5  666a00               push 0
8:B1C8  666a00               push 0
8:B1CB  ff76fa               push word ptr [bp - 6]
8:B1CE  50                   push ax
8:B1CF  90                   nop
8:B1D0  0e                   push cs
8:B1D1  e8c637               call 0xe99a  ; sub_s8:E99A
8:B1D4  e9ccfd               jmp 0xafa3
8:B1D7  db 90
loc_B1D8:
8:B1D8  689200               push 0x92
8:B1DB  9a9c1708b2           lcall 0xb208, 0x179c  ; operator_new@s1:179C
8:B1E0  83c402               add sp, 2
8:B1E3  8956fa               mov word ptr [bp - 6], dx
8:B1E6  0bd0                 or dx, ax
8:B1E8  0f84b4fd             je 0xafa0
8:B1EC  ff760a               push word ptr [bp + 0xa]
8:B1EF  666a00               push 0
8:B1F2  666a00               push 0
8:B1F5  ff76fa               push word ptr [bp - 6]
8:B1F8  50                   push ax
8:B1F9  90                   nop
8:B1FA  0e                   push cs
8:B1FB  e8ba15               call 0xc7b8  ; sub_s8:C7B8
8:B1FE  e9a2fd               jmp 0xafa3
8:B201  db 90
loc_B202:
8:B202  689600               push 0x96
8:B205  9a9c1732b2           lcall 0xb232, 0x179c  ; operator_new@s1:179C
8:B20A  83c402               add sp, 2
8:B20D  8956fa               mov word ptr [bp - 6], dx
8:B210  0bd0                 or dx, ax
8:B212  0f848afd             je 0xafa0
8:B216  ff760a               push word ptr [bp + 0xa]
8:B219  666a00               push 0
8:B21C  666a00               push 0
8:B21F  ff76fa               push word ptr [bp - 6]
8:B222  50                   push ax
8:B223  9aea2350b2           lcall 0xb250, 0x23ea  ; sub_s9:23EA
8:B228  e978fd               jmp 0xafa3
8:B22B  db 90
loc_B22C:
8:B22C  689c00               push 0x9c
8:B22F  9a9c175cb2           lcall 0xb25c, 0x179c  ; operator_new@s1:179C
8:B234  83c402               add sp, 2
8:B237  8956fa               mov word ptr [bp - 6], dx
8:B23A  0bd0                 or dx, ax
8:B23C  0f8460fd             je 0xafa0
8:B240  ff760a               push word ptr [bp + 0xa]
8:B243  666a00               push 0
8:B246  666a00               push 0
8:B249  ff76fa               push word ptr [bp - 6]
8:B24C  50                   push ax
8:B24D  9a684012af           lcall 0xaf12, 0x4068  ; sub_s9:4068
8:B252  e94efd               jmp 0xafa3
8:B255  db 90
loc_B256:
8:B256  689a00               push 0x9a
8:B259  9a9c1786b2           lcall 0xb286, 0x179c  ; operator_new@s1:179C
8:B25E  83c402               add sp, 2
8:B261  8956fa               mov word ptr [bp - 6], dx
8:B264  0bd0                 or dx, ax
8:B266  0f8436fd             je 0xafa0
8:B26A  ff760a               push word ptr [bp + 0xa]
8:B26D  666a00               push 0
8:B270  666a00               push 0
8:B273  ff76fa               push word ptr [bp - 6]
8:B276  50                   push ax
8:B277  90                   nop
8:B278  0e                   push cs
8:B279  e8f604               call 0xb772  ; sub_s8:B772
8:B27C  e924fd               jmp 0xafa3
8:B27F  db 90
loc_B280:
8:B280  688e00               push 0x8e
8:B283  9a9c17b0b2           lcall 0xb2b0, 0x179c  ; operator_new@s1:179C
8:B288  83c402               add sp, 2
8:B28B  8956fa               mov word ptr [bp - 6], dx
8:B28E  0bd0                 or dx, ax
8:B290  0f840cfd             je 0xafa0
8:B294  ff760a               push word ptr [bp + 0xa]
8:B297  666a00               push 0
8:B29A  666a00               push 0
8:B29D  ff76fa               push word ptr [bp - 6]
8:B2A0  50                   push ax
8:B2A1  90                   nop
8:B2A2  0e                   push cs
8:B2A3  e89a2e               call 0xe140  ; sub_s8:E140
8:B2A6  e9fafc               jmp 0xafa3
8:B2A9  db 90
loc_B2AA:
8:B2AA  689000               push 0x90
8:B2AD  9a9c17d4b2           lcall 0xb2d4, 0x179c  ; operator_new@s1:179C
8:B2B2  83c402               add sp, 2
8:B2B5  8956fa               mov word ptr [bp - 6], dx
8:B2B8  0bd0                 or dx, ax
8:B2BA  0f84e2fc             je 0xafa0
8:B2BE  ff760a               push word ptr [bp + 0xa]
8:B2C1  ff76fa               push word ptr [bp - 6]
8:B2C4  50                   push ax
8:B2C5  90                   nop
8:B2C6  0e                   push cs
8:B2C7  e872f0               call 0xa33c  ; sub_s8:A33C
8:B2CA  e9d6fc               jmp 0xafa3
8:B2CD  db 90
loc_B2CE:
8:B2CE  689000               push 0x90
8:B2D1  9a9c17faae           lcall 0xaefa, 0x179c  ; operator_new@s1:179C
8:B2D6  83c402               add sp, 2
8:B2D9  8956fa               mov word ptr [bp - 6], dx
8:B2DC  0bd0                 or dx, ax
8:B2DE  0f84befc             je 0xafa0
8:B2E2  ff760a               push word ptr [bp + 0xa]
8:B2E5  ff76fa               push word ptr [bp - 6]
8:B2E8  50                   push ax
8:B2E9  90                   nop
8:B2EA  0e                   push cs
8:B2EB  e8a6f1               call 0xa494  ; sub_s8:A494
8:B2EE  e9b2fc               jmp 0xafa3
8:B2F1  db 90
loc_B2F2:
8:B2F2  689000               push 0x90
8:B2F5  9a9c171cb3           lcall 0xb31c, 0x179c  ; operator_new@s1:179C
8:B2FA  83c402               add sp, 2
8:B2FD  8956fa               mov word ptr [bp - 6], dx
8:B300  0bd0                 or dx, ax
8:B302  0f849afc             je 0xafa0
8:B306  ff760a               push word ptr [bp + 0xa]
8:B309  ff76fa               push word ptr [bp - 6]
8:B30C  50                   push ax
8:B30D  90                   nop
8:B30E  0e                   push cs
8:B30F  e888f3               call 0xa69a  ; sub_s8:A69A
8:B312  e98efc               jmp 0xafa3
8:B315  db 90
loc_B316:
8:B316  689000               push 0x90
8:B319  9a9c1740b3           lcall 0xb340, 0x179c  ; operator_new@s1:179C
8:B31E  83c402               add sp, 2
8:B321  8956fa               mov word ptr [bp - 6], dx
8:B324  0bd0                 or dx, ax
8:B326  0f8476fc             je 0xafa0
8:B32A  ff760a               push word ptr [bp + 0xa]
8:B32D  ff76fa               push word ptr [bp - 6]
8:B330  50                   push ax
8:B331  90                   nop
8:B332  0e                   push cs
8:B333  e868f5               call 0xa89e  ; sub_s8:A89E
8:B336  e96afc               jmp 0xafa3
8:B339  db 90
loc_B33A:
8:B33A  689400               push 0x94
8:B33D  9a9c176ab3           lcall 0xb36a, 0x179c  ; operator_new@s1:179C
8:B342  83c402               add sp, 2
8:B345  8956fa               mov word ptr [bp - 6], dx
8:B348  0bd0                 or dx, ax
8:B34A  0f8452fc             je 0xafa0
8:B34E  ff760a               push word ptr [bp + 0xa]
8:B351  666a00               push 0
8:B354  666a00               push 0
8:B357  ff76fa               push word ptr [bp - 6]
8:B35A  50                   push ax
8:B35B  90                   nop
8:B35C  0e                   push cs
8:B35D  e83a33               call 0xe69a  ; sub_s8:E69A
8:B360  e940fc               jmp 0xafa3
8:B363  db 90
loc_B364:
8:B364  689400               push 0x94
8:B367  9a9c1794b3           lcall 0xb394, 0x179c  ; operator_new@s1:179C
8:B36C  83c402               add sp, 2
8:B36F  8956fa               mov word ptr [bp - 6], dx
8:B372  0bd0                 or dx, ax
8:B374  0f8428fc             je 0xafa0
8:B378  ff760a               push word ptr [bp + 0xa]
8:B37B  666a00               push 0
8:B37E  666a00               push 0
8:B381  ff76fa               push word ptr [bp - 6]
8:B384  50                   push ax
8:B385  90                   nop
8:B386  0e                   push cs
8:B387  e87c19               call 0xcd06  ; sub_s8:CD06
8:B38A  e916fc               jmp 0xafa3
8:B38D  db 90
loc_B38E:
8:B38E  689200               push 0x92
8:B391  9a9c17beb3           lcall 0xb3be, 0x179c  ; operator_new@s1:179C
8:B396  83c402               add sp, 2
8:B399  8956fa               mov word ptr [bp - 6], dx
8:B39C  0bd0                 or dx, ax
8:B39E  0f84fefb             je 0xafa0
8:B3A2  ff760a               push word ptr [bp + 0xa]
8:B3A5  666a00               push 0
8:B3A8  666a00               push 0
8:B3AB  ff76fa               push word ptr [bp - 6]
8:B3AE  50                   push ax
8:B3AF  9afc0bdbb3           lcall 0xb3db, 0xbfc  ; sub_s9:0BFC
8:B3B4  e9ecfb               jmp 0xafa3
8:B3B7  db 90
loc_B3B8:
8:B3B8  689a00               push 0x9a
8:B3BB  9a9c17e6b3           lcall 0xb3e6, 0x179c  ; operator_new@s1:179C
8:B3C0  83c402               add sp, 2
8:B3C3  8956fa               mov word ptr [bp - 6], dx
8:B3C6  0bd0                 or dx, ax
8:B3C8  0f84d4fb             je 0xafa0
8:B3CC  ff760a               push word ptr [bp + 0xa]
8:B3CF  666a00               push 0
8:B3D2  6a00                 push 0
8:B3D4  ff76fa               push word ptr [bp - 6]
8:B3D7  50                   push ax
8:B3D8  9a1c0e46b4           lcall 0xb446, 0xe1c  ; sub_s9:0E1C
8:B3DD  e9c3fb               jmp 0xafa3
loc_B3E0:
8:B3E0  689a00               push 0x9a
8:B3E3  9a9c170ab4           lcall 0xb40a, 0x179c  ; operator_new@s1:179C
8:B3E8  83c402               add sp, 2
8:B3EB  8956fa               mov word ptr [bp - 6], dx
8:B3EE  0bd0                 or dx, ax
8:B3F0  0f84acfb             je 0xafa0
8:B3F4  ff760a               push word ptr [bp + 0xa]
8:B3F7  ff76fa               push word ptr [bp - 6]
8:B3FA  50                   push ax
8:B3FB  90                   nop
8:B3FC  0e                   push cs
8:B3FD  e85623               call 0xd756  ; sub_s8:D756
8:B400  e9a0fb               jmp 0xafa3
8:B403  db 90
loc_B404:
8:B404  689200               push 0x92
8:B407  9a9c172eb4           lcall 0xb42e, 0x179c  ; operator_new@s1:179C
8:B40C  83c402               add sp, 2
8:B40F  8956fa               mov word ptr [bp - 6], dx
8:B412  0bd0                 or dx, ax
8:B414  0f8488fb             je 0xafa0
8:B418  ff760a               push word ptr [bp + 0xa]
8:B41B  ff76fa               push word ptr [bp - 6]
8:B41E  50                   push ax
8:B41F  90                   nop
8:B420  0e                   push cs
8:B421  e8b416               call 0xcad8  ; sub_s8:CAD8
8:B424  e97cfb               jmp 0xafa3
8:B427  db 90
loc_B428:
8:B428  68aa00               push 0xaa
8:B42B  9a9c1752b4           lcall 0xb452, 0x179c  ; operator_new@s1:179C
8:B430  83c402               add sp, 2
8:B433  8956fa               mov word ptr [bp - 6], dx
8:B436  0bd0                 or dx, ax
8:B438  0f8464fb             je 0xafa0
8:B43C  ff760a               push word ptr [bp + 0xa]
8:B43F  ff76fa               push word ptr [bp - 6]
8:B442  50                   push ax
8:B443  9a5a1fdcb4           lcall 0xb4dc, 0x1f5a  ; sub_s9:1F5A
8:B448  e958fb               jmp 0xafa3
8:B44B  db 90
loc_B44C:
8:B44C  688e00               push 0x8e
8:B44F  9a9c1776b4           lcall 0xb476, 0x179c  ; operator_new@s1:179C
8:B454  83c402               add sp, 2
8:B457  8956fa               mov word ptr [bp - 6], dx
8:B45A  0bd0                 or dx, ax
8:B45C  0f8440fb             je 0xafa0
8:B460  ff760a               push word ptr [bp + 0xa]
8:B463  ff76fa               push word ptr [bp - 6]
8:B466  50                   push ax
8:B467  90                   nop
8:B468  0e                   push cs
8:B469  e8d61d               call 0xd242  ; sub_s8:D242
8:B46C  e934fb               jmp 0xafa3
8:B46F  db 90
loc_B470:
8:B470  689a00               push 0x9a
8:B473  9a9c179ab4           lcall 0xb49a, 0x179c  ; operator_new@s1:179C
8:B478  83c402               add sp, 2
8:B47B  8956fa               mov word ptr [bp - 6], dx
8:B47E  0bd0                 or dx, ax
8:B480  0f841cfb             je 0xafa0
8:B484  ff760a               push word ptr [bp + 0xa]
8:B487  ff76fa               push word ptr [bp - 6]
8:B48A  50                   push ax
8:B48B  90                   nop
8:B48C  0e                   push cs
8:B48D  e84a3a               call 0xeeda  ; sub_s8:EEDA
8:B490  e910fb               jmp 0xafa3
8:B493  db 90
loc_B494:
8:B494  689600               push 0x96
8:B497  9a9c17beb4           lcall 0xb4be, 0x179c  ; operator_new@s1:179C
8:B49C  83c402               add sp, 2
8:B49F  8956fa               mov word ptr [bp - 6], dx
8:B4A2  0bd0                 or dx, ax
8:B4A4  0f84f8fa             je 0xafa0
8:B4A8  ff760a               push word ptr [bp + 0xa]
8:B4AB  ff76fa               push word ptr [bp - 6]
8:B4AE  50                   push ax
8:B4AF  9a265e94ae           lcall 0xae94, 0x5e26  ; sub_s4:5E26
8:B4B4  e9ecfa               jmp 0xafa3
8:B4B7  db 90
loc_B4B8:
8:B4B8  689600               push 0x96
8:B4BB  9a9c17e8b4           lcall 0xb4e8, 0x179c  ; operator_new@s1:179C
8:B4C0  83c402               add sp, 2
8:B4C3  8956fa               mov word ptr [bp - 6], dx
8:B4C6  0bd0                 or dx, ax
8:B4C8  0f84d4fa             je 0xafa0
8:B4CC  ff760a               push word ptr [bp + 0xa]
8:B4CF  666a00               push 0
8:B4D2  666a00               push 0
8:B4D5  ff76fa               push word ptr [bp - 6]
8:B4D8  50                   push ax
8:B4D9  9ab41c06b5           lcall 0xb506, 0x1cb4  ; sub_s9:1CB4
8:B4DE  e9c2fa               jmp 0xafa3
8:B4E1  db 90
loc_B4E2:
8:B4E2  689200               push 0x92
8:B4E5  9a9c1712b5           lcall 0xb512, 0x179c  ; operator_new@s1:179C
8:B4EA  83c402               add sp, 2
8:B4ED  8956fa               mov word ptr [bp - 6], dx
8:B4F0  0bd0                 or dx, ax
8:B4F2  0f84aafa             je 0xafa0
8:B4F6  ff760a               push word ptr [bp + 0xa]
8:B4F9  666a00               push 0
8:B4FC  666a00               push 0
8:B4FF  ff76fa               push word ptr [bp - 6]
8:B502  50                   push ax
8:B503  9a3e12d2af           lcall 0xafd2, 0x123e  ; sub_s9:123E
8:B508  e998fa               jmp 0xafa3
8:B50B  db 90
loc_B50C:
8:B50C  688e00               push 0x8e
8:B50F  9a9c1736b5           lcall 0xb536, 0x179c  ; operator_new@s1:179C
8:B514  83c402               add sp, 2
8:B517  8956fa               mov word ptr [bp - 6], dx
8:B51A  0bd0                 or dx, ax
8:B51C  0f8480fa             je 0xafa0
8:B520  ff760a               push word ptr [bp + 0xa]
8:B523  ff76fa               push word ptr [bp - 6]
8:B526  50                   push ax
8:B527  90                   nop
8:B528  0e                   push cs
8:B529  e856f6               call 0xab82  ; sub_s8:AB82
8:B52C  e974fa               jmp 0xafa3
8:B52F  db 90
loc_B530:
8:B530  689200               push 0x92
8:B533  9a9c175ab5           lcall 0xb55a, 0x179c  ; operator_new@s1:179C
8:B538  83c402               add sp, 2
8:B53B  8956fa               mov word ptr [bp - 6], dx
8:B53E  0bd0                 or dx, ax
8:B540  0f845cfa             je 0xafa0
8:B544  ff760a               push word ptr [bp + 0xa]
8:B547  ff76fa               push word ptr [bp - 6]
8:B54A  50                   push ax
8:B54B  90                   nop
8:B54C  0e                   push cs
8:B54D  e8802d               call 0xe2d0  ; sub_s8:E2D0
8:B550  e950fa               jmp 0xafa3
8:B553  db 90
loc_B554:
8:B554  689200               push 0x92
8:B557  9a9c1766af           lcall 0xaf66, 0x179c  ; operator_new@s1:179C
8:B55C  83c402               add sp, 2
8:B55F  8956fa               mov word ptr [bp - 6], dx
8:B562  0bd0                 or dx, ax
8:B564  0f8438fa             je 0xafa0
8:B568  ff760a               push word ptr [bp + 0xa]
8:B56B  ff76fa               push word ptr [bp - 6]
8:B56E  50                   push ax
8:B56F  90                   nop
8:B570  0e                   push cs
8:B571  e82a36               call 0xeb9e  ; sub_s8:EB9E
8:B574  e92cfa               jmp 0xafa3
8:B577  db 90
loc_B578:
8:B578  48                   dec ax
8:B579  3d2900               cmp ax, 0x29
8:B57C  775c                 ja 0xb5da
8:B57E  03c0                 add ax, ax
8:B580  93                   xchg bx, ax
8:B581  2effa786b5           jmp word ptr cs:[bx - 0x4a7a]
switch_table_B586:
    dw loc_B15A
    dw loc_B184
    dw loc_B1AE
    dw loc_B1D8
    dw loc_B202
    dw loc_B130
    dw loc_B22C
    dw loc_B256
    dw loc_B280
    dw loc_B2AA
    dw loc_B2CE
    dw loc_B2F2
    dw loc_B316
    dw loc_B33A
    dw loc_B364
    dw loc_B38E
    dw loc_B3B8
    dw loc_B3E0
    dw loc_B404
    dw loc_B428
    dw loc_B44C
    dw loc_B470
    dw loc_B494
    dw loc_B5DA
    dw loc_B4B8
    dw loc_B4E2
    dw loc_B50C
    dw loc_B530
    dw loc_B554
    dw loc_B05E
    dw loc_B088
    dw loc_B0B2
    dw loc_B0DC
    dw loc_B106
    dw loc_AFD6
    dw loc_B5DA
    dw loc_B016
    dw loc_B03A
    dw loc_AFF6
    dw loc_AFB6
    dw loc_AF60
    dw loc_AF80
loc_B5DA:
8:B5DA  8b5e0c               mov bx, word ptr [bp + 0xc]
8:B5DD  c1e302               shl bx, 2
8:B5E0  c47606               les si, ptr [bp + 6]
8:B5E3  6626833800           cmp dword ptr es:[bx + si], 0
8:B5E8  7435                 je 0xb61f
8:B5EA  2683bcae0000         cmp word ptr es:[si + 0xae], 0
8:B5F0  740c                 je 0xb5fe
8:B5F2  268b84ae00           mov ax, word ptr es:[si + 0xae]
8:B5F7  26c418               les bx, ptr es:[bx + si]
8:B5FA  2689476e             mov word ptr es:[bx + 0x6e], ax
loc_B5FE:
8:B5FE  c45e06               les bx, ptr [bp + 6]
8:B601  26c787ae000000       mov word ptr es:[bx + 0xae], 0
8:B608  8b5e0c               mov bx, word ptr [bp + 0xc]
8:B60B  c1e302               shl bx, 2
8:B60E  c47606               les si, ptr [bp + 6]
8:B611  6626ff30             push dword ptr es:[bx + si]
8:B615  26c418               les bx, ptr es:[bx + si]
8:B618  26c41f               les bx, ptr es:[bx]
8:B61B  26ff5f08             lcall es:[bx + 8]
loc_B61F:
8:B61F  8b5e0c               mov bx, word ptr [bp + 0xc]
8:B622  c1e302               shl bx, 2
8:B625  c47606               les si, ptr [bp + 6]
8:B628  268b00               mov ax, word ptr es:[bx + si]
8:B62B  268b5002             mov dx, word ptr es:[bx + si + 2]
8:B62F  5e                   pop si
8:B630  c9                   leave
8:B631  ca0800               retf 8

; ---------------- sub_s8:B634 FAR size=86 callers=1
;   apis: USER.ShowWindow
8:B634  c8080000             enter 8, 0
8:B638  56                   push si
8:B639  c45e06               les bx, ptr [bp + 6]
8:B63C  2683bfac0000         cmp word ptr es:[bx + 0xac], 0
8:B642  7540                 jne 0xb684
8:B644  26c787ac000100       mov word ptr es:[bx + 0xac], 1
8:B64B  c746fe0100           mov word ptr [bp - 2], 1
8:B650  eb03                 jmp 0xb655
loc_B652:
8:B652  ff46fe               inc word ptr [bp - 2]
loc_B655:
8:B655  837efe2b             cmp word ptr [bp - 2], 0x2b
8:B659  7329                 jae 0xb684
8:B65B  8b5efe               mov bx, word ptr [bp - 2]
8:B65E  c1e302               shl bx, 2
8:B661  c47606               les si, ptr [bp + 6]
8:B664  268b4002             mov ax, word ptr es:[bx + si + 2]
8:B668  260b00               or ax, word ptr es:[bx + si]
8:B66B  74e5                 je 0xb652
8:B66D  8b5efe               mov bx, word ptr [bp - 2]
8:B670  c1e302               shl bx, 2
8:B673  26c418               les bx, ptr es:[bx + si]
8:B676  26ff7706             push word ptr es:[bx + 6]
8:B67A  6a00                 push 0
8:B67C  9af2a90000           lcall 0, 0xa9f2  ; USER.ShowWindow
8:B681  ebcf                 jmp 0xb652
8:B683  db 90
loc_B684:
8:B684  5e                   pop si
8:B685  c9                   leave
8:B686  ca0400               retf 4
8:B689  db 00

; ---------------- sub_s8:B68A FAR size=86 callers=1
;   apis: USER.ShowWindow
8:B68A  c8080000             enter 8, 0
8:B68E  56                   push si
8:B68F  c45e06               les bx, ptr [bp + 6]
8:B692  2683bfac0000         cmp word ptr es:[bx + 0xac], 0
8:B698  7440                 je 0xb6da
8:B69A  26c787ac000000       mov word ptr es:[bx + 0xac], 0
8:B6A1  c746fe0100           mov word ptr [bp - 2], 1
8:B6A6  eb03                 jmp 0xb6ab
loc_B6A8:
8:B6A8  ff46fe               inc word ptr [bp - 2]
loc_B6AB:
8:B6AB  837efe2b             cmp word ptr [bp - 2], 0x2b
8:B6AF  7329                 jae 0xb6da
8:B6B1  8b5efe               mov bx, word ptr [bp - 2]
8:B6B4  c1e302               shl bx, 2
8:B6B7  c47606               les si, ptr [bp + 6]
8:B6BA  268b4002             mov ax, word ptr es:[bx + si + 2]
8:B6BE  260b00               or ax, word ptr es:[bx + si]
8:B6C1  74e5                 je 0xb6a8
8:B6C3  8b5efe               mov bx, word ptr [bp - 2]
8:B6C6  c1e302               shl bx, 2
8:B6C9  26c418               les bx, ptr es:[bx + si]
8:B6CC  26ff7706             push word ptr es:[bx + 6]
8:B6D0  6a01                 push 1
8:B6D2  9a7db60000           lcall 0, 0xb67d  ; USER.ShowWindow
8:B6D7  ebcf                 jmp 0xb6a8
8:B6D9  db 90
loc_B6DA:
8:B6DA  5e                   pop si
8:B6DB  c9                   leave
8:B6DC  ca0400               retf 4
8:B6DF  db 00

; ---------------- sub_s8:B6E0 FAR size=78 callers=39
8:B6E0  c8080000             enter 8, 0
8:B6E4  56                   push si
8:B6E5  c746fe0100           mov word ptr [bp - 2], 1
8:B6EA  eb03                 jmp 0xb6ef
loc_B6EC:
8:B6EC  ff46fe               inc word ptr [bp - 2]
loc_B6EF:
8:B6EF  837efe2b             cmp word ptr [bp - 2], 0x2b
8:B6F3  7334                 jae 0xb729
8:B6F5  8b5efe               mov bx, word ptr [bp - 2]
8:B6F8  c1e302               shl bx, 2
8:B6FB  c47606               les si, ptr [bp + 6]
8:B6FE  268b4002             mov ax, word ptr es:[bx + si + 2]
8:B702  260b00               or ax, word ptr es:[bx + si]
8:B705  74e5                 je 0xb6ec
8:B707  8b5efe               mov bx, word ptr [bp - 2]
8:B70A  c1e302               shl bx, 2
8:B70D  26c418               les bx, ptr es:[bx + si]
8:B710  8b460a               mov ax, word ptr [bp + 0xa]
8:B713  26394706             cmp word ptr es:[bx + 6], ax
8:B717  75d3                 jne 0xb6ec
8:B719  8b5efe               mov bx, word ptr [bp - 2]
8:B71C  c1e302               shl bx, 2
8:B71F  8e4608               mov es, word ptr [bp + 8]
8:B722  662bc0               sub eax, eax
8:B725  66268900             mov dword ptr es:[bx + si], eax
loc_B729:
8:B729  5e                   pop si
8:B72A  c9                   leave
8:B72B  ca0600               retf 6

; ---------------- sub_s8:B72E FAR size=68 callers=2
;   apis: USER.BringWindowToTop, USER.SetFocus
8:B72E  c8080000             enter 8, 0
8:B732  56                   push si
8:B733  8b5e0a               mov bx, word ptr [bp + 0xa]
8:B736  c1e302               shl bx, 2
8:B739  c47606               les si, ptr [bp + 6]
8:B73C  6626833800           cmp dword ptr es:[bx + si], 0
8:B741  7427                 je 0xb76a
8:B743  8b5e0a               mov bx, word ptr [bp + 0xa]
8:B746  c1e302               shl bx, 2
8:B749  26c418               les bx, ptr es:[bx + si]
8:B74C  268b4706             mov ax, word ptr es:[bx + 6]
8:B750  8946fe               mov word ptr [bp - 2], ax
8:B753  50                   push ax
8:B754  9a3fa70000           lcall 0, 0xa73f  ; USER.SetFocus
8:B759  ff76fe               push word ptr [bp - 2]
8:B75C  9affff0000           lcall 0, 0xffff  ; USER.BringWindowToTop
8:B761  b80100               mov ax, 1
8:B764  5e                   pop si
8:B765  c9                   leave
8:B766  ca0600               retf 6
8:B769  db 90
loc_B76A:
8:B76A  33c0                 xor ax, ax
8:B76C  5e                   pop si
8:B76D  c9                   leave
8:B76E  ca0600               retf 6
8:B771  db 00

; ---------------- sub_s8:B772 FAR size=126 callers=1
8:B772  55                   push bp
8:B773  8bec                 mov bp, sp
8:B775  ff7612               push word ptr [bp + 0x12]
8:B778  66680000bf0f         push 0xfbf0000
8:B77E  66689a000000         push 0x9a
8:B784  66ff7606             push dword ptr [bp + 6]
8:B788  9a2877b2b3           lcall 0xb3b2, 0x7728  ; sub_s9:7728
8:B78D  c45e06               les bx, ptr [bp + 6]
8:B790  662bc0               sub eax, eax
8:B793  662689878e00         mov dword ptr es:[bx + 0x8e], eax
8:B799  662689879200         mov dword ptr es:[bx + 0x92], eax
8:B79F  26c78796000100       mov word ptr es:[bx + 0x96], 1
8:B7A6  2689879800           mov word ptr es:[bx + 0x98], ax
8:B7AB  26c70770bd           mov word ptr es:[bx], 0xbd70
8:B7B0  26c7470250ae         mov word ptr es:[bx + 2], 0xae50  ; SEGMENT s8:0000
8:B7B6  6a36                 push 0x36
8:B7B8  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:B7BD  9aba20d9b7           lcall 0xb7d9, 0x20ba  ; sub_s3:20BA
8:B7C2  c45e06               les bx, ptr [bp + 6]
8:B7C5  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:B7CA  2689979000           mov word ptr es:[bx + 0x90], dx
8:B7CF  6a06                 push 6
8:B7D1  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:B7D6  9aba2010aa           lcall 0xaa10, 0x20ba  ; sub_s3:20BA
8:B7DB  c45e06               les bx, ptr [bp + 6]
8:B7DE  2689879200           mov word ptr es:[bx + 0x92], ax
8:B7E3  2689979400           mov word ptr es:[bx + 0x94], dx
8:B7E8  8bc3                 mov ax, bx
8:B7EA  8cc2                 mov dx, es
8:B7EC  c9                   leave
8:B7ED  ca0e00               retf 0xe

; ---------------- sub_s8:B7F0 FAR size=44 callers=1
8:B7F0  55                   push bp
8:B7F1  8bec                 mov bp, sp
8:B7F3  c45e06               les bx, ptr [bp + 6]
8:B7F6  26c70770bd           mov word ptr es:[bx], 0xbd70
8:B7FB  26c74702b4b7         mov word ptr es:[bx + 2], 0xb7b4  ; SEGMENT s8:0000
8:B801  26ff7706             push word ptr es:[bx + 6]
8:B805  66ff367c5b           push dword ptr [0x5b7c]
8:B80A  90                   nop
8:B80B  0e                   push cs
8:B80C  e8d1fe               call 0xb6e0  ; sub_s8:B6E0
8:B80F  66ff7606             push dword ptr [bp + 6]
8:B813  9a2c788bb7           lcall 0xb78b, 0x782c  ; sub_s9:782C
8:B818  c9                   leave
8:B819  ca0400               retf 4

; ---------------- sub_s8:B81C size=262 callers=0
;   apis: USER.CheckDlgButton, USER.EnableWindow, USER.GetDlgItem, USER.SetFocus, USER.ShowWindow
8:B81C  c8160000             enter 0x16, 0
8:B820  56                   push si
8:B821  66ff7606             push dword ptr [bp + 6]
8:B825  9ae278e1b8           lcall 0xb8e1, 0x78e2  ; sub_s9:78E2
8:B82A  6a06                 push 6
8:B82C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:B831  9aba20c0b7           lcall 0xb7c0, 0x20ba  ; sub_s3:20BA
8:B836  c45e06               les bx, ptr [bp + 6]
8:B839  2689879200           mov word ptr es:[bx + 0x92], ax
8:B83E  2689979400           mov word ptr es:[bx + 0x94], dx
8:B843  c45e06               les bx, ptr [bp + 6]
8:B846  66268b879200         mov eax, dword ptr es:[bx + 0x92]
8:B84C  054e00               add ax, 0x4e
8:B84F  668946fc             mov dword ptr [bp - 4], eax
8:B853  26c49f9200           les bx, ptr es:[bx + 0x92]
8:B858  c746f80000           mov word ptr [bp - 8], 0
8:B85D  c746f6a001           mov word ptr [bp - 0xa], 0x1a0
8:B862  eb12                 jmp 0xb876
loc_B864:
8:B864  c45e06               les bx, ptr [bp + 6]
8:B867  26ff7706             push word ptr es:[bx + 6]
8:B86B  50                   push ax
8:B86C  6a02                 push 2
8:B86E  9affff0000           lcall 0, 0xffff  ; USER.CheckDlgButton
loc_B873:
8:B873  ff46f6               inc word ptr [bp - 0xa]
loc_B876:
8:B876  817ef6b401           cmp word ptr [bp - 0xa], 0x1b4
8:B87B  7f15                 jg 0xb892
8:B87D  8b5ef8               mov bx, word ptr [bp - 8]
8:B880  03db                 add bx, bx
8:B882  c476fc               les si, ptr [bp - 4]
8:B885  8b46f6               mov ax, word ptr [bp - 0xa]
8:B888  263900               cmp word ptr es:[bx + si], ax
8:B88B  75d7                 jne 0xb864
8:B88D  ff46f8               inc word ptr [bp - 8]
8:B890  ebe1                 jmp 0xb873
loc_B892:
8:B892  c45e06               les bx, ptr [bp + 6]
8:B895  26ff7706             push word ptr es:[bx + 6]
8:B899  68b10f               push 0xfb1
8:B89C  9a13b90000           lcall 0, 0xb913  ; USER.GetDlgItem
8:B8A1  50                   push ax
8:B8A2  6a00                 push 0
8:B8A4  9ac5a90000           lcall 0, 0xa9c5  ; USER.EnableWindow
8:B8A9  c45e06               les bx, ptr [bp + 6]
8:B8AC  6626ffb79200         push dword ptr es:[bx + 0x92]
8:B8B2  26c49f9200           les bx, ptr es:[bx + 0x92]
8:B8B7  26c41f               les bx, ptr es:[bx]
8:B8BA  26ff5f10             lcall es:[bx + 0x10]
8:B8BE  8946f2               mov word ptr [bp - 0xe], ax
8:B8C1  8956f4               mov word ptr [bp - 0xc], dx
8:B8C4  c45ef2               les bx, ptr [bp - 0xe]
8:B8C7  268b4704             mov ax, word ptr es:[bx + 4]
8:B8CB  260307               add ax, word ptr es:[bx]
8:B8CE  050300               add ax, 3
8:B8D1  50                   push ax
8:B8D2  268b4702             mov ax, word ptr es:[bx + 2]
8:B8D6  2d0200               sub ax, 2
8:B8D9  50                   push ax
8:B8DA  66ff7606             push dword ptr [bp + 6]
8:B8DE  9a6c8216b8           lcall 0xb816, 0x826c  ; sub_s9:826C
8:B8E3  c45e06               les bx, ptr [bp + 6]
8:B8E6  26ff7706             push word ptr es:[bx + 6]
8:B8EA  6a05                 push 5
8:B8EC  9ad3b60000           lcall 0, 0xb6d3  ; USER.ShowWindow
8:B8F1  c45efc               les bx, ptr [bp - 4]
8:B8F4  26ff37               push word ptr es:[bx]
8:B8F7  c45e06               les bx, ptr [bp + 6]
8:B8FA  6626ffb79200         push dword ptr es:[bx + 0x92]
8:B900  9a9a1cb2b4           lcall 0xb4b2, 0x1c9a  ; sub_s4:1C9A
8:B905  c45e06               les bx, ptr [bp + 6]
8:B908  26ff7706             push word ptr es:[bx + 6]
8:B90C  c45efc               les bx, ptr [bp - 4]
8:B90F  26ff37               push word ptr es:[bx]
8:B912  9afcab0000           lcall 0, 0xabfc  ; USER.GetDlgItem
8:B917  50                   push ax
8:B918  9a55b70000           lcall 0, 0xb755  ; USER.SetFocus
8:B91D  5e                   pop si
8:B91E  c9                   leave
8:B91F  ca0400               retf 4

; ---------------- sub_s8:B922 size=782 callers=0
;   apis: USER.CheckDlgButton, USER.EnableWindow, USER.GetDlgItem, USER.IsDlgButtonChecked, USER.IsWindowEnabled, USER.PostMessage, USER.SendMessage, USER._wsprintf
8:B922  c86e0400             enter 0x46e, 0
8:B926  66c746fc00000000     mov dword ptr [bp - 4], 0
8:B92E  8b460e               mov ax, word ptr [bp + 0xe]
8:B931  3db401               cmp ax, 0x1b4
8:B934  0f87dc02             ja 0xbc14
8:B938  3da001               cmp ax, 0x1a0
8:B93B  7311                 jae 0xb94e
8:B93D  48                   dec ax
8:B93E  48                   dec ax
8:B93F  0f85dd02             jne 0xbc20
loc_B943:
8:B943  66c746fc01000000     mov dword ptr [bp - 4], 1
8:B94B  e9d802               jmp 0xbc26
loc_B94E:
8:B94E  c45e06               les bx, ptr [bp + 6]
8:B951  26ff7706             push word ptr es:[bx + 6]
8:B955  50                   push ax
8:B956  9abbb90000           lcall 0, 0xb9bb  ; USER.GetDlgItem
8:B95B  8946fa               mov word ptr [bp - 6], ax
8:B95E  50                   push ax
8:B95F  666800000004         push 0x4000000
8:B965  666a00               push 0
8:B968  9a92b90000           lcall 0, 0xb992  ; USER.SendMessage
8:B96D  8946f8               mov word ptr [bp - 8], ax
8:B970  3d0200               cmp ax, 2
8:B973  750b                 jne 0xb980
8:B975  66c746fc00000000     mov dword ptr [bp - 4], 0
8:B97D  e9a602               jmp 0xbc26
loc_B980:
8:B980  ff76fa               push word ptr [bp - 6]
8:B983  680104               push 0x401
8:B986  3d0100               cmp ax, 1
8:B989  1bc0                 sbb ax, ax
8:B98B  f7d8                 neg ax
8:B98D  50                   push ax
8:B98E  666a00               push 0
8:B991  9a53a70000           lcall 0, 0xa753  ; USER.SendMessage
8:B996  c45e06               les bx, ptr [bp + 6]
8:B999  26ff7706             push word ptr es:[bx + 6]
8:B99D  ff760e               push word ptr [bp + 0xe]
8:B9A0  9af4bb0000           lcall 0, 0xbbf4  ; USER.IsDlgButtonChecked
8:B9A5  0bc0                 or ax, ax
8:B9A7  0f84ab00             je 0xba56
8:B9AB  c45e06               les bx, ptr [bp + 6]
8:B9AE  26ff8f9600           dec word ptr es:[bx + 0x96]
8:B9B3  26ff7706             push word ptr es:[bx + 6]
8:B9B7  68b10f               push 0xfb1
8:B9BA  9ad4b90000           lcall 0, 0xb9d4  ; USER.GetDlgItem
8:B9BF  50                   push ax
8:B9C0  9affff0000           lcall 0, 0xffff  ; USER.IsWindowEnabled
8:B9C5  0bc0                 or ax, ax
8:B9C7  7517                 jne 0xb9e0
8:B9C9  c45e06               les bx, ptr [bp + 6]
8:B9CC  26ff7706             push word ptr es:[bx + 6]
8:B9D0  68b10f               push 0xfb1
8:B9D3  9a70ba0000           lcall 0, 0xba70  ; USER.GetDlgItem
8:B9D8  50                   push ax
8:B9D9  6a01                 push 1
8:B9DB  9a78ba0000           lcall 0, 0xba78  ; USER.EnableWindow
loc_B9E0:
8:B9E0  c45e06               les bx, ptr [bp + 6]
8:B9E3  2683bf960000         cmp word ptr es:[bx + 0x96], 0
8:B9E9  7d1a                 jge 0xba05
8:B9EB  26ff7706             push word ptr es:[bx + 6]
8:B9EF  26ffb79800           push word ptr es:[bx + 0x98]
8:B9F4  6a00                 push 0
8:B9F6  9a6fb80000           lcall 0, 0xb86f  ; USER.CheckDlgButton
8:B9FB  c45e06               les bx, ptr [bp + 6]
8:B9FE  26c78796000000       mov word ptr es:[bx + 0x96], 0
loc_BA05:
8:BA05  8b460e               mov ax, word ptr [bp + 0xe]
8:BA08  c45e06               les bx, ptr [bp + 6]
8:BA0B  2689879800           mov word ptr es:[bx + 0x98], ax
8:BA10  50                   push ax
8:BA11  6626ffb79200         push dword ptr es:[bx + 0x92]
8:BA17  9a9a1c2aba           lcall 0xba2a, 0x1c9a  ; sub_s4:1C9A
8:BA1C  6aff                 push -1
8:BA1E  c45e06               les bx, ptr [bp + 6]
8:BA21  6626ffb79200         push dword ptr es:[bx + 0x92]
8:BA27  9a781ee1ba           lcall 0xbae1, 0x1e78  ; sub_s4:1E78
8:BA2C  8946f4               mov word ptr [bp - 0xc], ax
8:BA2F  8956f6               mov word ptr [bp - 0xa], dx
8:BA32  0bd0                 or dx, ax
8:BA34  740a                 je 0xba40
8:BA36  c45ef4               les bx, ptr [bp - 0xc]
8:BA39  268b471c             mov ax, word ptr es:[bx + 0x1c]
8:BA3D  eb03                 jmp 0xba42
8:BA3F  db 90
loc_BA40:
8:BA40  33c0                 xor ax, ax
loc_BA42:
8:BA42  8946f2               mov word ptr [bp - 0xe], ax
8:BA45  50                   push ax
8:BA46  6a01                 push 1
8:BA48  66ff36a002           push dword ptr [0x2a0]
8:BA4D  9a7c5cb9ba           lcall 0xbab9, 0x5c7c  ; sub_s2:5C7C
8:BA52  e9eefe               jmp 0xb943
8:BA55  db 90
loc_BA56:
8:BA56  c45e06               les bx, ptr [bp + 6]
8:BA59  26ff879600           inc word ptr es:[bx + 0x96]
8:BA5E  2683bf960001         cmp word ptr es:[bx + 0x96], 1
8:BA64  0f85dbfe             jne 0xb943
8:BA68  26ff7706             push word ptr es:[bx + 6]
8:BA6C  68b10f               push 0xfb1
8:BA6F  9a9db80000           lcall 0, 0xb89d  ; USER.GetDlgItem
8:BA74  50                   push ax
8:BA75  6a00                 push 0
8:BA77  9aa5b80000           lcall 0, 0xb8a5  ; USER.EnableWindow
8:BA7C  e9c4fe               jmp 0xb943
8:BA7F  db 90
loc_BA80:
8:BA80  6a02                 push 2
8:BA82  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:BA87  9aba20fcba           lcall 0xbafc, 0x20ba  ; sub_s3:20BA
8:BA8C  8946f4               mov word ptr [bp - 0xc], ax
8:BA8F  8956f6               mov word ptr [bp - 0xa], dx
8:BA92  a1ae13               mov ax, word ptr [0x13ae]
8:BA95  8946f2               mov word ptr [bp - 0xe], ax
8:BA98  3d0100               cmp ax, 1
8:BA9B  7505                 jne 0xbaa2
8:BA9D  c746f20200           mov word ptr [bp - 0xe], 2
loc_BAA2:
8:BAA2  8b5ef2               mov bx, word ptr [bp - 0xe]
8:BAA5  8bc3                 mov ax, bx
8:BAA7  03db                 add bx, bx
8:BAA9  03d8                 add bx, ax
8:BAAB  c1e302               shl bx, 2
8:BAAE  8b87845b             mov ax, word ptr [bx + 0x5b84]
8:BAB2  48                   dec ax
8:BAB3  50                   push ax
8:BAB4  6a00                 push 0
8:BAB6  9a2e6199bb           lcall 0xbb99, 0x612e  ; sub_s2:612E
8:BABB  83c404               add sp, 4
8:BABE  8946f8               mov word ptr [bp - 8], ax
8:BAC1  8b5ef2               mov bx, word ptr [bp - 0xe]
8:BAC4  8bc3                 mov ax, bx
8:BAC6  03db                 add bx, bx
8:BAC8  03d8                 add bx, ax
8:BACA  03db                 add bx, bx
8:BACC  035ef8               add bx, word ptr [bp - 8]
8:BACF  03db                 add bx, bx
8:BAD1  ffb7865b             push word ptr [bx + 0x5b86]
8:BAD5  c45e06               les bx, ptr [bp + 6]
8:BAD8  6626ffb79200         push dword ptr es:[bx + 0x92]
8:BADE  9a781e03b9           lcall 0xb903, 0x1e78  ; sub_s4:1E78
8:BAE3  8946ee               mov word ptr [bp - 0x12], ax
8:BAE6  8956f0               mov word ptr [bp - 0x10], dx
8:BAE9  68f105               push 0x5f1
8:BAEC  8d869efb             lea ax, [bp - 0x462]
8:BAF0  16                   push ss
8:BAF1  50                   push ax
8:BAF2  6a50                 push 0x50
8:BAF4  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:BAF9  9ae0840cbb           lcall 0xbb0c, 0x84e0  ; sub_s3:84E0
8:BAFE  c45eee               les bx, ptr [bp - 0x12]
8:BB01  26ff37               push word ptr es:[bx]
8:BB04  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:BB09  9a7e8454bb           lcall 0xbb54, 0x847e  ; LoadStringRes@s3:847E
8:BB0E  52                   push dx
8:BB0F  50                   push ax
8:BB10  8d869efb             lea ax, [bp - 0x462]
8:BB14  16                   push ss
8:BB15  50                   push ax
8:BB16  1e                   push ds
8:BB17  68c05b               push 0x5bc0  ; '%s %s!'
8:BB1A  8d86eefb             lea ax, [bp - 0x412]
8:BB1E  16                   push ss
8:BB1F  50                   push ax
8:BB20  9a4a900000           lcall 0, 0x904a  ; USER._wsprintf
8:BB25  83c410               add sp, 0x10
8:BB28  68b400               push 0xb4
8:BB2B  9a9c17f8b2           lcall 0xb2f8, 0x179c  ; operator_new@s1:179C
8:BB30  83c402               add sp, 2
8:BB33  898692fb             mov word ptr [bp - 0x46e], ax
8:BB37  899694fb             mov word ptr [bp - 0x46c], dx
8:BB3B  0bd0                 or dx, ax
8:BB3D  7427                 je 0xbb66
8:BB3F  ff369603             push word ptr [0x396]
8:BB43  8d86eefb             lea ax, [bp - 0x412]
8:BB47  16                   push ss
8:BB48  50                   push ax
8:BB49  687b05               push 0x57b
8:BB4C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:BB51  9a7e8434b8           lcall 0xb834, 0x847e  ; LoadStringRes@s3:847E
8:BB56  52                   push dx
8:BB57  50                   push ax
8:BB58  6a41                 push 0x41
8:BB5A  66ffb692fb           push dword ptr [bp - 0x46e]
8:BB5F  9a7884cabb           lcall 0xbbca, 0x8478  ; sub_s9:8478
8:BB64  eb03                 jmp 0xbb69
loc_BB66:
8:BB66  33c0                 xor ax, ax
8:BB68  99                   cdq
loc_BB69:
8:BB69  89869afb             mov word ptr [bp - 0x466], ax
8:BB6D  89969cfb             mov word ptr [bp - 0x464], dx
8:BB71  52                   push dx
8:BB72  c49e9afb             les bx, ptr [bp - 0x466]
8:BB76  50                   push ax
8:BB77  26c41f               les bx, ptr es:[bx]
8:BB7A  26ff5f74             lcall es:[bx + 0x74]
8:BB7E  8946fa               mov word ptr [bp - 6], ax
8:BB81  48                   dec ax
8:BB82  0f85a000             jne 0xbc26
8:BB86  c45eee               les bx, ptr [bp - 0x12]
8:BB89  26ff771a             push word ptr es:[bx + 0x1a]
8:BB8D  c45e06               les bx, ptr [bp + 6]
8:BB90  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:BB96  9a18d80bbc           lcall 0xbc0b, 0xd818  ; sub_s2:D818
8:BB9B  c45eee               les bx, ptr [bp - 0x12]
8:BB9E  26ff771a             push word ptr es:[bx + 0x1a]
loc_BBA2:
8:BBA2  66ff7606             push dword ptr [bp + 6]
8:BBA6  90                   nop
8:BBA7  0e                   push cs
8:BBA8  e88500               call 0xbc30  ; sub_s8:BC30
loc_BBAB:
8:BBAB  ff369603             push word ptr [0x396]
8:BBAF  6668ce001101         push 0x11100ce
8:BBB5  666a00               push 0
8:BBB8  9addaa0000           lcall 0, 0xaadd  ; USER.PostMessage
8:BBBD  6a01                 push 1
loc_BBBF:
8:BBBF  66ff760a             push dword ptr [bp + 0xa]
8:BBC3  66ff7606             push dword ptr [bp + 6]
8:BBC7  9a3c7b28b8           lcall 0xb828, 0x7b3c  ; sub_s9:7B3C
8:BBCC  8946fc               mov word ptr [bp - 4], ax
8:BBCF  8956fe               mov word ptr [bp - 2], dx
8:BBD2  eb52                 jmp 0xbc26
loc_BBD4:
8:BBD4  c78696fba001         mov word ptr [bp - 0x46a], 0x1a0
8:BBDA  eb04                 jmp 0xbbe0
loc_BBDC:
8:BBDC  ff8696fb             inc word ptr [bp - 0x46a]
loc_BBE0:
8:BBE0  81be96fbb401         cmp word ptr [bp - 0x46a], 0x1b4
8:BBE6  77c3                 ja 0xbbab
8:BBE8  c45e06               les bx, ptr [bp + 6]
8:BBEB  26ff7706             push word ptr es:[bx + 6]
8:BBEF  ffb696fb             push word ptr [bp - 0x46a]
8:BBF3  9affff0000           lcall 0, 0xffff  ; USER.IsDlgButtonChecked
8:BBF8  48                   dec ax
8:BBF9  75e1                 jne 0xbbdc
8:BBFB  ffb696fb             push word ptr [bp - 0x46a]
8:BBFF  c45e06               les bx, ptr [bp + 6]
8:BC02  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:BC08  9a18d807af           lcall 0xaf07, 0xd818  ; sub_s2:D818
8:BC0D  ffb696fb             push word ptr [bp - 0x46a]
8:BC11  eb8f                 jmp 0xbba2
8:BC13  db 90
loc_BC14:
8:BC14  2db10f               sub ax, 0xfb1
8:BC17  74bb                 je 0xbbd4
8:BC19  2d0d00               sub ax, 0xd
8:BC1C  0f8460fe             je 0xba80
loc_BC20:
8:BC20  ff760e               push word ptr [bp + 0xe]
8:BC23  eb9a                 jmp 0xbbbf
8:BC25  db 90
loc_BC26:
8:BC26  8b46fc               mov ax, word ptr [bp - 4]
8:BC29  8b56fe               mov dx, word ptr [bp - 2]
8:BC2C  c9                   leave
8:BC2D  ca0a00               retf 0xa

; ---------------- sub_s8:BC30 FAR size=120 callers=1
;   apis: USER.LoadCursor, USER.SetCursor
8:BC30  c81e0100             enter 0x11e, 0
8:BC34  666a00               push 0
8:BC37  68027f               push 0x7f02
8:BC3A  9affff0000           lcall 0, 0xffff  ; USER.LoadCursor
8:BC3F  8946fe               mov word ptr [bp - 2], ax
8:BC42  50                   push ax
8:BC43  9aa0bc0000           lcall 0, 0xbca0  ; USER.SetCursor
8:BC48  8946fc               mov word ptr [bp - 4], ax
8:BC4B  c45e06               les bx, ptr [bp + 6]
8:BC4E  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:BC53  66260fbf470e         movsx eax, word ptr es:[bx + 0xe]
8:BC59  660500000001         add eax, 0x1000000
8:BC5F  6650                 push eax
8:BC61  8d86f0fe             lea ax, [bp - 0x110]
8:BC65  16                   push ss
8:BC66  50                   push ax
8:BC67  9a2e537abc           lcall 0xbc7a, 0x532e  ; SCSelect@s7:532E
8:BC6C  8d86f0fe             lea ax, [bp - 0x110]
8:BC70  16                   push ss
8:BC71  50                   push ax
8:BC72  66ff364857           push dword ptr [0x5748]  ; g_sim
8:BC77  9a5a8384bc           lcall 0xbc84, 0x835a  ; Sim::enqueue@s7:835A
8:BC7C  66ff364857           push dword ptr [0x5748]  ; g_sim
8:BC81  9a8e839abc           lcall 0xbc9a, 0x838e  ; sub_s7:838E
8:BC86  c786f0fe9a38         mov word ptr [bp - 0x110], 0x389a
8:BC8C  c786f2fe50ba         mov word ptr [bp - 0x10e], 0xba50  ; SEGMENT s2:0000
8:BC92  66ff364857           push dword ptr [0x5748]  ; g_sim
8:BC97  9a3483288b           lcall 0x8b28, 0x8334  ; sub_s7:8334
8:BC9C  ff76fc               push word ptr [bp - 4]
8:BC9F  9affff0000           lcall 0, 0xffff  ; USER.SetCursor
8:BCA4  c9                   leave
8:BCA5  ca0600               retf 6

; ---------------- sub_s8:BCA8 size=162 callers=0
8:BCA8  c8180000             enter 0x18, 0
8:BCAC  56                   push si
8:BCAD  c45e06               les bx, ptr [bp + 6]
8:BCB0  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:BCB5  66268b470a           mov eax, dword ptr es:[bx + 0xa]
8:BCBA  268b570c             mov dx, word ptr es:[bx + 0xc]
8:BCBE  668946fc             mov dword ptr [bp - 4], eax
8:BCC2  52                   push dx
8:BCC3  c45efc               les bx, ptr [bp - 4]
8:BCC6  50                   push ax
8:BCC7  26c41f               les bx, ptr es:[bx]
8:BCCA  26ff5f14             lcall es:[bx + 0x14]
8:BCCE  8946f8               mov word ptr [bp - 8], ax
8:BCD1  8956fa               mov word ptr [bp - 6], dx
8:BCD4  c45e06               les bx, ptr [bp + 6]
8:BCD7  6626837f7000         cmp dword ptr es:[bx + 0x70], 0
8:BCDD  741f                 je 0xbcfe
8:BCDF  268b4770             mov ax, word ptr es:[bx + 0x70]
8:BCE3  268b5772             mov dx, word ptr es:[bx + 0x72]
8:BCE7  8956ea               mov word ptr [bp - 0x16], dx
8:BCEA  8bda                 mov bx, dx
8:BCEC  0bd0                 or dx, ax
8:BCEE  740e                 je 0xbcfe
8:BCF0  6a01                 push 1
8:BCF2  53                   push bx
8:BCF3  50                   push ax
8:BCF4  8ec3                 mov es, bx
8:BCF6  8bf0                 mov si, ax
8:BCF8  26c41c               les bx, ptr es:[si]
8:BCFB  26ff1f               lcall es:[bx]
loc_BCFE:
8:BCFE  6a14                 push 0x14
8:BD00  9a9c172ebb           lcall 0xbb2e, 0x179c  ; operator_new@s1:179C
8:BD05  83c402               add sp, 2
8:BD08  8956ea               mov word ptr [bp - 0x16], dx
8:BD0B  0bd0                 or dx, ax
8:BD0D  740b                 je 0xbd1a
8:BD0F  ff76ea               push word ptr [bp - 0x16]
8:BD12  50                   push ax
8:BD13  9a584c37bd           lcall 0xbd37, 0x4c58  ; sub_s2:4C58
8:BD18  eb03                 jmp 0xbd1d
loc_BD1A:
8:BD1A  33c0                 xor ax, ax
8:BD1C  99                   cdq
loc_BD1D:
8:BD1D  c45e06               les bx, ptr [bp + 6]
8:BD20  26894770             mov word ptr es:[bx + 0x70], ax
8:BD24  26895772             mov word ptr es:[bx + 0x72], dx
8:BD28  66ff76f8             push dword ptr [bp - 8]
8:BD2C  c45e06               les bx, ptr [bp + 6]
8:BD2F  6626ff7770           push dword ptr es:[bx + 0x70]
8:BD34  9a844d90bc           lcall 0xbc90, 0x4d84  ; sub_s2:4D84
8:BD39  c45e06               les bx, ptr [bp + 6]
8:BD3C  268b4770             mov ax, word ptr es:[bx + 0x70]
8:BD40  268b5772             mov dx, word ptr es:[bx + 0x72]
8:BD44  5e                   pop si
8:BD45  c9                   leave
8:BD46  ca0600               retf 6
8:BD49  db 00

; ---------------- sub_s8:BD4A FAR size=146 callers=0
8:BD4A  55                   push bp
8:BD4B  8bec                 mov bp, sp
8:BD4D  66ff7606             push dword ptr [bp + 6]
8:BD51  90                   nop
8:BD52  0e                   push cs
8:BD53  e89afa               call 0xb7f0  ; sub_s8:B7F0
8:BD56  f6460a01             test byte ptr [bp + 0xa], 1
8:BD5A  7409                 je 0xbd65
8:BD5C  66ff7606             push dword ptr [bp + 6]
8:BD60  9ace1703bd           lcall 0xbd03, 0x17ce  ; operator_delete@s1:17CE
loc_BD65:
8:BD65  8b4606               mov ax, word ptr [bp + 6]
8:BD68  8b5608               mov dx, word ptr [bp + 8]
8:BD6B  c9                   leave
8:BD6C  ca0600               retf 6
8:BD6F  db 90 4a bd 7a bd 10 3a 16 bd 1c b8 82 bd c0 79 86
8:BD7F  db bd 22 b9 d2 bd 98 7b 8a bd 56 7f 8e bd b2 7b 92
8:BD8F  db bd 1c 7f 96 bd 12 82 9a bd 86 7f 9e bd 0c 80 a2
8:BD9F  db bd 54 80 a6 bd 5e 7e aa bd 58 81 ae bd b6 81 b2
8:BDAF  db bd fe 81 ba bd ea 60 c6 bd 4a 82 be bd 66 82 c2
8:BDBF  db bd de 78 62 bb ee 60 ca bd f4 60 ce bd fa 60 d6
8:BDCF  db bd a4 a2 da bd fe 60 1a ba a8 bc ff b7

; ---------------- sub_s8:BDDC FAR size=110 callers=1
8:BDDC  55                   push bp
8:BDDD  8bec                 mov bp, sp
8:BDDF  ff7612               push word ptr [bp + 0x12]
8:BDE2  687601               push 0x176
8:BDE5  66ff760a             push dword ptr [bp + 0xa]
8:BDE9  6a01                 push 1
8:BDEB  66ff7606             push dword ptr [bp + 6]
8:BDEF  9a28777ebd           lcall 0xbd7e, 0x7728  ; sub_s9:7728
8:BDF4  c45e06               les bx, ptr [bp + 6]
8:BDF7  662bc0               sub eax, eax
8:BDFA  662689878e00         mov dword ptr es:[bx + 0x8e], eax
8:BE00  2689879200           mov word ptr es:[bx + 0x92], ax
8:BE05  2689879400           mov word ptr es:[bx + 0x94], ax
8:BE0A  2689879600           mov word ptr es:[bx + 0x96], ax
8:BE0F  2689879800           mov word ptr es:[bx + 0x98], ax
8:BE14  2689879a00           mov word ptr es:[bx + 0x9a], ax
8:BE19  2689879c00           mov word ptr es:[bx + 0x9c], ax
8:BE1E  26c70736c4           mov word ptr es:[bx], 0xc436
8:BE23  26c7470272bd         mov word ptr es:[bx + 2], 0xbd72  ; SEGMENT s8:0000
8:BE29  6a3b                 push 0x3b
8:BE2B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:BE30  9aba208aba           lcall 0xba8a, 0x20ba  ; sub_s3:20BA
8:BE35  c45e06               les bx, ptr [bp + 6]
8:BE38  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:BE3D  2689979000           mov word ptr es:[bx + 0x90], dx
8:BE42  8bc3                 mov ax, bx
8:BE44  8cc2                 mov dx, es
8:BE46  c9                   leave
8:BE47  ca0e00               retf 0xe

; ---------------- sub_s8:BE4A FAR size=44 callers=1
8:BE4A  55                   push bp
8:BE4B  8bec                 mov bp, sp
8:BE4D  c45e06               les bx, ptr [bp + 6]
8:BE50  26c70736c4           mov word ptr es:[bx], 0xc436
8:BE55  26c7470227be         mov word ptr es:[bx + 2], 0xbe27  ; SEGMENT s8:0000
8:BE5B  26ff7706             push word ptr es:[bx + 6]
8:BE5F  66ff367c5b           push dword ptr [0x5b7c]
8:BE64  90                   nop
8:BE65  0e                   push cs
8:BE66  e877f8               call 0xb6e0  ; sub_s8:B6E0
8:BE69  66ff7606             push dword ptr [bp + 6]
8:BE6D  9a2c78f2bd           lcall 0xbdf2, 0x782c  ; sub_s9:782C
8:BE72  c9                   leave
8:BE73  ca0400               retf 4

; ---------------- sub_s8:BE76 size=46 callers=0
8:BE76  c8040000             enter 4, 0
8:BE7A  837e0a00             cmp word ptr [bp + 0xa], 0
8:BE7E  7514                 jne 0xbe94
8:BE80  666a2b               push 0x2b
8:BE83  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:BE88  9aba2092be           lcall 0xbe92, 0x20ba  ; sub_s3:20BA
8:BE8D  52                   push dx
8:BE8E  50                   push ax
8:BE8F  9a8e0333be           lcall 0xbe33, 0x38e  ; sub_s3:038E
loc_BE94:
8:BE94  66ff7608             push dword ptr [bp + 8]
8:BE98  ff7606               push word ptr [bp + 6]
8:BE9B  9a987b70be           lcall 0xbe70, 0x7b98  ; sub_s9:7B98
8:BEA0  c9                   leave
8:BEA1  ca0600               retf 6

; ---------------- sub_s8:BEA4 size=416 callers=0
;   apis: USER.GetDlgItem, USER.GetWindowText, USER.SendMessage, USER.SetWindowText, USER._wsprintf
8:BEA4  c82c0100             enter 0x12c, 0
8:BEA8  6a02                 push 2
8:BEAA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:BEAF  9aba2051bf           lcall 0xbf51, 0x20ba  ; sub_s3:20BA
8:BEB4  8946fc               mov word ptr [bp - 4], ax
8:BEB7  8956fe               mov word ptr [bp - 2], dx
8:BEBA  c45efc               les bx, ptr [bp - 4]
8:BEBD  66268b4768           mov eax, dword ptr es:[bx + 0x68]
8:BEC2  668946f8             mov dword ptr [bp - 8], eax
8:BEC6  c45e06               les bx, ptr [bp + 6]
8:BEC9  26ff7706             push word ptr es:[bx + 6]
8:BECD  8d8676ff             lea ax, [bp - 0x8a]
8:BED1  16                   push ss
8:BED2  50                   push ax
8:BED3  688000               push 0x80
8:BED6  9aaaa70000           lcall 0, 0xa7aa  ; USER.GetWindowText
8:BEDB  66ff76f8             push dword ptr [bp - 8]
8:BEDF  8d8676ff             lea ax, [bp - 0x8a]
8:BEE3  16                   push ss
8:BEE4  50                   push ax
8:BEE5  8d86f4fe             lea ax, [bp - 0x10c]
8:BEE9  16                   push ss
8:BEEA  50                   push ax
8:BEEB  9a21bb0000           lcall 0, 0xbb21  ; USER._wsprintf
8:BEF0  83c40c               add sp, 0xc
8:BEF3  c45e06               les bx, ptr [bp + 6]
8:BEF6  26ff7706             push word ptr es:[bx + 6]
8:BEFA  8d86f4fe             lea ax, [bp - 0x10c]
8:BEFE  16                   push ss
8:BEFF  50                   push ax
8:BF00  9a37a70000           lcall 0, 0xa737  ; USER.SetWindowText
8:BF05  c45e06               les bx, ptr [bp + 6]
8:BF08  26ff7706             push word ptr es:[bx + 6]
8:BF0C  687901               push 0x179
8:BF0F  9aa1bf0000           lcall 0, 0xbfa1  ; USER.GetDlgItem
8:BF14  c45e06               les bx, ptr [bp + 6]
8:BF17  2689879200           mov word ptr es:[bx + 0x92], ax
8:BF1C  8d86f0fe             lea ax, [bp - 0x110]
8:BF20  16                   push ss
8:BF21  50                   push ax
8:BF22  8d8eecfe             lea cx, [bp - 0x114]
8:BF26  16                   push ss
8:BF27  51                   push cx
8:BF28  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:BF2E  9aece377bf           lcall 0xbf77, 0xe3ec  ; sub_s2:E3EC
8:BF33  c45e06               les bx, ptr [bp + 6]
8:BF36  26ffb79200           push word ptr es:[bx + 0x92]
8:BF3B  66ffb6f0fe           push dword ptr [bp - 0x110]
8:BF40  06                   push es
8:BF41  53                   push bx
8:BF42  90                   nop
8:BF43  0e                   push cs
8:BF44  e82d04               call 0xc374  ; sub_s8:C374
8:BF47  6a2f                 push 0x2f
8:BF49  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:BF4E  9aba20c5bf           lcall 0xbfc5, 0x20ba  ; sub_s3:20BA
8:BF53  8986e8fe             mov word ptr [bp - 0x118], ax
8:BF57  8996eafe             mov word ptr [bp - 0x116], dx
8:BF5B  c49ee8fe             les bx, ptr [bp - 0x118]
8:BF5F  66268b4724           mov eax, dword ptr es:[bx + 0x24]
8:BF64  668986e4fe           mov dword ptr [bp - 0x11c], eax
8:BF69  6650                 push eax
8:BF6B  c45e06               les bx, ptr [bp + 6]
8:BF6E  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:BF74  9a86e576bd           lcall 0xbd76, 0xe586  ; sub_s2:E586
8:BF79  8986e0fe             mov word ptr [bp - 0x120], ax
8:BF7D  8996e2fe             mov word ptr [bp - 0x11e], dx
8:BF81  c45e06               les bx, ptr [bp + 6]
8:BF84  26ffb79200           push word ptr es:[bx + 0x92]
8:BF89  6668ffff0d04         push 0x40dffff
8:BF8F  52                   push dx
8:BF90  50                   push ax
8:BF91  9ae0bf0000           lcall 0, 0xbfe0  ; USER.SendMessage
8:BF96  c45e06               les bx, ptr [bp + 6]
8:BF99  26ff7706             push word ptr es:[bx + 6]
8:BF9D  687a01               push 0x17a
8:BFA0  9a0cc00000           lcall 0, 0xc00c  ; USER.GetDlgItem
8:BFA5  c45e06               les bx, ptr [bp + 6]
8:BFA8  2689879400           mov word ptr es:[bx + 0x94], ax
8:BFAD  50                   push ax
8:BFAE  66ffb6ecfe           push dword ptr [bp - 0x114]
8:BFB3  06                   push es
8:BFB4  53                   push bx
8:BFB5  90                   nop
8:BFB6  0e                   push cs
8:BFB7  e8ba03               call 0xc374  ; sub_s8:C374
8:BFBA  683105               push 0x531
8:BFBD  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:BFC2  9a7e848bbe           lcall 0xbe8b, 0x847e  ; LoadStringRes@s3:847E
8:BFC7  8986dcfe             mov word ptr [bp - 0x124], ax
8:BFCB  8996defe             mov word ptr [bp - 0x122], dx
8:BFCF  c45e06               les bx, ptr [bp + 6]
8:BFD2  26ffb79400           push word ptr es:[bx + 0x94]
8:BFD7  666800000304         push 0x4030000
8:BFDD  52                   push dx
8:BFDE  50                   push ax
8:BFDF  9afdbf0000           lcall 0, 0xbffd  ; USER.SendMessage
8:BFE4  c45e06               les bx, ptr [bp + 6]
8:BFE7  2689879c00           mov word ptr es:[bx + 0x9c], ax
8:BFEC  26ffb79400           push word ptr es:[bx + 0x94]
8:BFF1  6668ffff0d04         push 0x40dffff
8:BFF7  66ffb6dcfe           push dword ptr [bp - 0x124]
8:BFFC  9a69b90000           lcall 0, 0xb969  ; USER.SendMessage
8:C001  c45e06               les bx, ptr [bp + 6]
8:C004  26ff7706             push word ptr es:[bx + 6]
8:C008  687801               push 0x178
8:C00B  9a20c00000           lcall 0, 0xc020  ; USER.GetDlgItem
8:C010  c45e06               les bx, ptr [bp + 6]
8:C013  2689879600           mov word ptr es:[bx + 0x96], ax
8:C018  26ff7706             push word ptr es:[bx + 6]
8:C01C  687701               push 0x177
8:C01F  9a34c00000           lcall 0, 0xc034  ; USER.GetDlgItem
8:C024  c45e06               les bx, ptr [bp + 6]
8:C027  2689879800           mov word ptr es:[bx + 0x98], ax
8:C02C  26ff7706             push word ptr es:[bx + 6]
8:C030  688401               push 0x184
8:C033  9a57b90000           lcall 0, 0xb957  ; USER.GetDlgItem
8:C038  c45e06               les bx, ptr [bp + 6]
8:C03B  2689879a00           mov word ptr es:[bx + 0x9a], ax
8:C040  c9                   leave
8:C041  ca0400               retf 4

; ---------------- sub_s8:C044 FAR size=54 callers=0
;   apis: USER.SetFocus, USER.ShowWindow
8:C044  55                   push bp
8:C045  8bec                 mov bp, sp
8:C047  66ff7606             push dword ptr [bp + 6]
8:C04B  9ae2785ac0           lcall 0xc05a, 0x78e2  ; sub_s9:78E2
8:C050  666aff               push -1
8:C053  66ff7606             push dword ptr [bp + 6]
8:C057  9a6c829ebe           lcall 0xbe9e, 0x826c  ; sub_s9:826C
8:C05C  c45e06               les bx, ptr [bp + 6]
8:C05F  26ff7706             push word ptr es:[bx + 6]
8:C063  6a05                 push 5
8:C065  9aedb80000           lcall 0, 0xb8ed  ; USER.ShowWindow
8:C06A  c45e06               les bx, ptr [bp + 6]
8:C06D  26ff7706             push word ptr es:[bx + 6]
8:C071  9a19b90000           lcall 0, 0xb919  ; USER.SetFocus
8:C076  c9                   leave
8:C077  ca0400               retf 4

; ---------------- sub_s8:C07A size=430 callers=0
;   apis: USER.MessageBox, USER.PostMessage
8:C07A  c80a0700             enter 0x70a, 0
8:C07E  57                   push di
8:C07F  56                   push si
8:C080  66ff7606             push dword ptr [bp + 6]
8:C084  90                   nop
8:C085  0e                   push cs
8:C086  e89f01               call 0xc228  ; sub_s8:C228
8:C089  683105               push 0x531
8:C08C  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C091  9a7e8462c1           lcall 0xc162, 0x847e  ; LoadStringRes@s3:847E
8:C096  8946fc               mov word ptr [bp - 4], ax
8:C099  8956fe               mov word ptr [bp - 2], dx
8:C09C  8b460e               mov ax, word ptr [bp + 0xe]
8:C09F  2d7701               sub ax, 0x177
8:C0A2  0f84f200             je 0xc198
8:C0A6  48                   dec ax
8:C0A7  7435                 je 0xc0de
8:C0A9  2d0100               sub ax, 1
8:C0AC  7205                 jb 0xc0b3
8:C0AE  2d0100               sub ax, 1
8:C0B1  7617                 jbe 0xc0ca
loc_C0B3:
8:C0B3  66ff760c             push dword ptr [bp + 0xc]
8:C0B7  66ff7608             push dword ptr [bp + 8]
8:C0BB  ff7606               push word ptr [bp + 6]
8:C0BE  9a3c7b4ec0           lcall 0xc04e, 0x7b3c  ; sub_s9:7B3C
8:C0C3  5e                   pop si
8:C0C4  5f                   pop di
8:C0C5  c9                   leave
8:C0C6  ca0a00               retf 0xa
8:C0C9  db 90
loc_C0CA:
8:C0CA  66ff760c             push dword ptr [bp + 0xc]
8:C0CE  66ff7608             push dword ptr [bp + 8]
8:C0D2  ff7606               push word ptr [bp + 6]
8:C0D5  90                   nop
8:C0D6  0e                   push cs
8:C0D7  e84002               call 0xc31a  ; sub_s8:C31A
8:C0DA  e94401               jmp 0xc221
8:C0DD  db 90
loc_C0DE:
8:C0DE  8b4606               mov ax, word ptr [bp + 6]
8:C0E1  8b5608               mov dx, word ptr [bp + 8]
8:C0E4  059e00               add ax, 0x9e
8:C0E7  52                   push dx
8:C0E8  50                   push ax
8:C0E9  8b4e06               mov cx, word ptr [bp + 6]
8:C0EC  81c19e01             add cx, 0x19e
8:C0F0  52                   push dx
8:C0F1  51                   push cx
8:C0F2  c47606               les si, ptr [bp + 6]
8:C0F5  6626ffb48e00         push dword ptr es:[si + 0x8e]
8:C0FB  8bf1                 mov si, cx
8:C0FD  8946f8               mov word ptr [bp - 8], ax
8:C100  8956fa               mov word ptr [bp - 6], dx
8:C103  8bfa                 mov di, dx
8:C105  9a0ce120c1           lcall 0xc120, 0xe10c  ; sub_s2:E10C
8:C10A  0bc0                 or ax, ax
8:C10C  7440                 je 0xc14e
8:C10E  66ff76f8             push dword ptr [bp - 8]
8:C112  57                   push di
8:C113  56                   push si
8:C114  c45e06               les bx, ptr [bp + 6]
8:C117  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:C11D  9a1ce0bdc1           lcall 0xc1bd, 0xe01c  ; sub_s2:E01C
8:C122  6a1f                 push 0x1f
8:C124  c45e06               les bx, ptr [bp + 6]
8:C127  26ff7708             push word ptr es:[bx + 8]
8:C12B  66ff367c5b           push dword ptr [0x5b7c]
8:C130  90                   nop
8:C131  0e                   push cs
8:C132  e80bee               call 0xaf40  ; sub_s8:AF40
loc_C135:
8:C135  c45e06               les bx, ptr [bp + 6]
8:C138  26ff7706             push word ptr es:[bx + 6]
8:C13C  666802001101         push 0x1110002
8:C142  666a00               push 0
8:C145  9ab9bb0000           lcall 0, 0xbbb9  ; USER.PostMessage
8:C14A  e9d100               jmp 0xc21e
8:C14D  db 90
loc_C14E:
8:C14E  685004               push 0x450
8:C151  8d86f6fb             lea ax, [bp - 0x40a]
8:C155  16                   push ss
8:C156  50                   push ax
8:C157  68ff03               push 0x3ff
8:C15A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C15F  9ae08478c1           lcall 0xc178, 0x84e0  ; sub_s3:84E0
8:C164  687b05               push 0x57b
8:C167  8d86f6fa             lea ax, [bp - 0x50a]
8:C16B  16                   push ss
8:C16C  50                   push ax
8:C16D  68ff03               push 0x3ff
8:C170  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C175  9ae084d3c1           lcall 0xc1d3, 0x84e0  ; sub_s3:84E0
8:C17A  c45e06               les bx, ptr [bp + 6]
8:C17D  26ff7706             push word ptr es:[bx + 6]
8:C181  8d86f6fb             lea ax, [bp - 0x40a]
8:C185  16                   push ss
8:C186  50                   push ax
8:C187  8d86f6fa             lea ax, [bp - 0x50a]
8:C18B  16                   push ss
8:C18C  50                   push ax
8:C18D  6a30                 push 0x30
8:C18F  9a17c20000           lcall 0, 0xc217  ; USER.MessageBox
8:C194  e98700               jmp 0xc21e
8:C197  db 90
loc_C198:
8:C198  8b4606               mov ax, word ptr [bp + 6]
8:C19B  8b5608               mov dx, word ptr [bp + 8]
8:C19E  059e00               add ax, 0x9e
8:C1A1  52                   push dx
8:C1A2  50                   push ax
8:C1A3  8b4606               mov ax, word ptr [bp + 6]
8:C1A6  059e01               add ax, 0x19e
8:C1A9  52                   push dx
8:C1AA  50                   push ax
8:C1AB  6a02                 push 2
8:C1AD  c45e06               les bx, ptr [bp + 6]
8:C1B0  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:C1B6  8bf0                 mov si, ax
8:C1B8  8bfa                 mov di, dx
8:C1BA  9a5ee031bf           lcall 0xbf31, 0xe05e  ; sub_s2:E05E
8:C1BF  685104               push 0x451
8:C1C2  8d86f6fb             lea ax, [bp - 0x40a]
8:C1C6  16                   push ss
8:C1C7  50                   push ax
8:C1C8  680002               push 0x200
8:C1CB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C1D0  9ae084ffc1           lcall 0xc1ff, 0x84e0  ; sub_s3:84E0
8:C1D5  57                   push di
8:C1D6  56                   push si
8:C1D7  8d86f6fb             lea ax, [bp - 0x40a]
8:C1DB  16                   push ss
8:C1DC  50                   push ax
8:C1DD  8d86f6f8             lea ax, [bp - 0x70a]
8:C1E1  16                   push ss
8:C1E2  50                   push ax
8:C1E3  9a9c3f63bd           lcall 0xbd63, 0x3f9c  ; _fsprintf@s1:3F9C
8:C1E8  83c40c               add sp, 0xc
8:C1EB  687b05               push 0x57b
8:C1EE  8d86f6fa             lea ax, [bp - 0x50a]
8:C1F2  16                   push ss
8:C1F3  50                   push ax
8:C1F4  680001               push 0x100
8:C1F7  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C1FC  9ae084b2be           lcall 0xbeb2, 0x84e0  ; sub_s3:84E0
8:C201  c45e06               les bx, ptr [bp + 6]
8:C204  26ff7706             push word ptr es:[bx + 6]
8:C208  8d86f6f8             lea ax, [bp - 0x70a]
8:C20C  16                   push ss
8:C20D  50                   push ax
8:C20E  8d86f6fa             lea ax, [bp - 0x50a]
8:C212  16                   push ss
8:C213  50                   push ax
8:C214  6a30                 push 0x30
8:C216  9afe8e0000           lcall 0, 0x8efe  ; USER.MessageBox
8:C21B  e917ff               jmp 0xc135
loc_C21E:
8:C21E  b80100               mov ax, 1
loc_C221:
8:C221  99                   cdq
8:C222  5e                   pop si
8:C223  5f                   pop di
8:C224  c9                   leave
8:C225  ca0a00               retf 0xa

; ---------------- sub_s8:C228 FAR size=108 callers=1
;   apis: USER.SendMessage
8:C228  c8080000             enter 8, 0
8:C22C  c45e06               les bx, ptr [bp + 6]
8:C22F  26ffb79200           push word ptr es:[bx + 0x92]
8:C234  666800000704         push 0x4070000
8:C23A  666a00               push 0
8:C23D  9a57c20000           lcall 0, 0xc257  ; USER.SendMessage
8:C242  8946fc               mov word ptr [bp - 4], ax
8:C245  c45e06               les bx, ptr [bp + 6]
8:C248  26ffb79400           push word ptr es:[bx + 0x94]
8:C24D  666800000704         push 0x4070000
8:C253  666a00               push 0
8:C256  9a73c20000           lcall 0, 0xc273  ; USER.SendMessage
8:C25B  8946f8               mov word ptr [bp - 8], ax
8:C25E  c45e06               les bx, ptr [bp + 6]
8:C261  26ffb79200           push word ptr es:[bx + 0x92]
8:C266  680804               push 0x408
8:C269  ff76fc               push word ptr [bp - 4]
8:C26C  8d879e00             lea ax, [bx + 0x9e]
8:C270  06                   push es
8:C271  50                   push ax
8:C272  9a8cc20000           lcall 0, 0xc28c  ; USER.SendMessage
8:C277  c45e06               les bx, ptr [bp + 6]
8:C27A  26ffb79400           push word ptr es:[bx + 0x94]
8:C27F  680804               push 0x408
8:C282  ff76f8               push word ptr [bp - 8]
8:C285  8d879e01             lea ax, [bx + 0x19e]
8:C289  06                   push es
8:C28A  50                   push ax
8:C28B  9a92bf0000           lcall 0, 0xbf92  ; USER.SendMessage
8:C290  c9                   leave
8:C291  ca0400               retf 4

; ---------------- sub_s8:C294 FAR size=134 callers=1
;   apis: USER.EnableWindow, USER.SetWindowText
8:C294  c80a0000             enter 0xa, 0
8:C298  57                   push di
8:C299  56                   push si
8:C29A  8b4606               mov ax, word ptr [bp + 6]
8:C29D  8b5608               mov dx, word ptr [bp + 8]
8:C2A0  059e00               add ax, 0x9e
8:C2A3  52                   push dx
8:C2A4  50                   push ax
8:C2A5  8b4e06               mov cx, word ptr [bp + 6]
8:C2A8  81c19e01             add cx, 0x19e
8:C2AC  52                   push dx
8:C2AD  51                   push cx
8:C2AE  c47606               les si, ptr [bp + 6]
8:C2B1  6626ffb48e00         push dword ptr es:[si + 0x8e]
8:C2B7  8bf1                 mov si, cx
8:C2B9  8946f6               mov word ptr [bp - 0xa], ax
8:C2BC  8956f8               mov word ptr [bp - 8], dx
8:C2BF  8bfa                 mov di, dx
8:C2C1  9a20e3e7c2           lcall 0xc2e7, 0xe320  ; sub_s2:E320
8:C2C6  c45e06               les bx, ptr [bp + 6]
8:C2C9  26ffb79a00           push word ptr es:[bx + 0x9a]
8:C2CE  52                   push dx
8:C2CF  50                   push ax
8:C2D0  9a01bf0000           lcall 0, 0xbf01  ; USER.SetWindowText
8:C2D5  66ff76f6             push dword ptr [bp - 0xa]
8:C2D9  57                   push di
8:C2DA  56                   push si
8:C2DB  c45e06               les bx, ptr [bp + 6]
8:C2DE  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:C2E4  9aa4e208c1           lcall 0xc108, 0xe2a4  ; sub_s2:E2A4
8:C2E9  8946fa               mov word ptr [bp - 6], ax
8:C2EC  c45e06               les bx, ptr [bp + 6]
8:C2EF  26ffb79600           push word ptr es:[bx + 0x96]
8:C2F4  8a46fa               mov al, byte ptr [bp - 6]
8:C2F7  250100               and ax, 1
8:C2FA  50                   push ax
8:C2FB  9a10c30000           lcall 0, 0xc310  ; USER.EnableWindow
8:C300  c45e06               les bx, ptr [bp + 6]
8:C303  26ffb79800           push word ptr es:[bx + 0x98]
8:C308  8a46fa               mov al, byte ptr [bp - 6]
8:C30B  250200               and ax, 2
8:C30E  50                   push ax
8:C30F  9adcb90000           lcall 0, 0xb9dc  ; USER.EnableWindow
8:C314  5e                   pop si
8:C315  5f                   pop di
8:C316  c9                   leave
8:C317  ca0400               retf 4

; ---------------- sub_s8:C31A FAR size=90 callers=1
;   apis: USER.GetWindowRect, USER.SetWindowPos
8:C31A  c80c0000             enter 0xc, 0
8:C31E  8b460c               mov ax, word ptr [bp + 0xc]
8:C321  8946fe               mov word ptr [bp - 2], ax
8:C324  8b4e0a               mov cx, word ptr [bp + 0xa]
8:C327  894efc               mov word ptr [bp - 4], cx
8:C32A  48                   dec ax
8:C32B  7437                 je 0xc364
8:C32D  2d0600               sub ax, 6
8:C330  7406                 je 0xc338
8:C332  33c0                 xor ax, ax
8:C334  c9                   leave
8:C335  ca0a00               retf 0xa
loc_C338:
8:C338  ff76fc               push word ptr [bp - 4]
8:C33B  8d46f4               lea ax, [bp - 0xc]
8:C33E  16                   push ss
8:C33F  50                   push ax
8:C340  9aedab0000           lcall 0, 0xabed  ; USER.GetWindowRect
8:C345  ff76fc               push word ptr [bp - 4]
8:C348  666a00               push 0
8:C34B  6a00                 push 0
8:C34D  8b46f4               mov ax, word ptr [bp - 0xc]
8:C350  2946f8               sub word ptr [bp - 8], ax
8:C353  ff76f8               push word ptr [bp - 8]
8:C356  666802005000         push 0x500002
8:C35C  9a30ac0000           lcall 0, 0xac30  ; USER.SetWindowPos
8:C361  eb0a                 jmp 0xc36d
8:C363  db 90
loc_C364:
8:C364  66ff7606             push dword ptr [bp + 6]
8:C368  90                   nop
8:C369  0e                   push cs
8:C36A  e827ff               call 0xc294  ; sub_s8:C294
loc_C36D:
8:C36D  b80100               mov ax, 1
8:C370  c9                   leave
8:C371  ca0a00               retf 0xa

; ---------------- sub_s8:C374 FAR size=156 callers=1
;   apis: USER.SendMessage
8:C374  c8200000             enter 0x20, 0
8:C378  ff760e               push word ptr [bp + 0xe]
8:C37B  666800000b04         push 0x40b0000
8:C381  666a00               push 0
8:C384  9ae6c30000           lcall 0, 0xc3e6  ; USER.SendMessage
8:C389  c45e0a               les bx, ptr [bp + 0xa]
8:C38C  06                   push es
8:C38D  53                   push bx
8:C38E  26c41f               les bx, ptr es:[bx]
8:C391  26ff5f10             lcall es:[bx + 0x10]
8:C395  8946fc               mov word ptr [bp - 4], ax
8:C398  8956fe               mov word ptr [bp - 2], dx
8:C39B  66c746f800000000     mov dword ptr [bp - 8], 0
8:C3A3  eb05                 jmp 0xc3aa
8:C3A5  db 90
loc_C3A6:
8:C3A6  66ff46f8             inc dword ptr [bp - 8]
loc_C3AA:
8:C3AA  668b46fc             mov eax, dword ptr [bp - 4]
8:C3AE  663946f8             cmp dword ptr [bp - 8], eax
8:C3B2  7358                 jae 0xc40c
8:C3B4  66ff76f8             push dword ptr [bp - 8]
8:C3B8  c45e0a               les bx, ptr [bp + 0xa]
8:C3BB  06                   push es
8:C3BC  53                   push bx
8:C3BD  26c41f               les bx, ptr es:[bx]
8:C3C0  26ff5f04             lcall es:[bx + 4]
8:C3C4  52                   push dx
8:C3C5  50                   push ax
8:C3C6  c45e06               les bx, ptr [bp + 6]
8:C3C9  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:C3CF  9a86e5c4c2           lcall 0xc2c4, 0xe586  ; sub_s2:E586
8:C3D4  8946f0               mov word ptr [bp - 0x10], ax
8:C3D7  8956f2               mov word ptr [bp - 0xe], dx
8:C3DA  ff760e               push word ptr [bp + 0xe]
8:C3DD  666800000304         push 0x4030000
8:C3E3  52                   push dx
8:C3E4  50                   push ax
8:C3E5  9a3ec20000           lcall 0, 0xc23e  ; USER.SendMessage
8:C3EA  8946e8               mov word ptr [bp - 0x18], ax
8:C3ED  8956ea               mov word ptr [bp - 0x16], dx
8:C3F0  668b46f0             mov eax, dword ptr [bp - 0x10]
8:C3F4  6650                 push eax
8:C3F6  9ace17e6c1           lcall 0xc1e6, 0x17ce  ; operator_delete@s1:17CE
8:C3FB  83c404               add sp, 4
8:C3FE  66837ee8ff           cmp dword ptr [bp - 0x18], -1
8:C403  7407                 je 0xc40c
8:C405  66837ee8fe           cmp dword ptr [bp - 0x18], -2
8:C40A  759a                 jne 0xc3a6
loc_C40C:
8:C40C  c9                   leave
8:C40D  ca0a00               retf 0xa

; ---------------- sub_s8:C410 FAR size=146 callers=0
8:C410  55                   push bp
8:C411  8bec                 mov bp, sp
8:C413  66ff7606             push dword ptr [bp + 6]
8:C417  90                   nop
8:C418  0e                   push cs
8:C419  e82efa               call 0xbe4a  ; sub_s8:BE4A
8:C41C  f6460a01             test byte ptr [bp + 0xa], 1
8:C420  7409                 je 0xc42b
8:C422  66ff7606             push dword ptr [bp + 6]
8:C426  9ace17f9c3           lcall 0xc3f9, 0x17ce  ; operator_delete@s1:17CE
loc_C42B:
8:C42B  8b4606               mov ax, word ptr [bp + 6]
8:C42E  8b5608               mov dx, word ptr [bp + 8]
8:C431  c9                   leave
8:C432  ca0600               retf 6
8:C435  db 90 10 c4 40 c4 10 3a d2 c3 44 c0 48 c4 c0 79 50
8:C445  db c4 7a c0 4c c4 76 be 88 c4 56 7f 54 c4 b2 7b 58
8:C455  db c4 1c 7f 5c c4 12 82 60 c4 86 7f 64 c4 0c 80 68
8:C465  db c4 54 80 6c c4 5e 7e 70 c4 58 81 74 c4 b6 81 78
8:C475  db c4 fe 81 80 c4 ea 60 8c c4 4a 82 84 c4 66 82 a0
8:C485  db c4 a4 be 98 c4 ee 60 90 c4 f4 60 94 c4 fa 60 9c
8:C495  db c4 a4 a2 59 be fe 60 b6 bd 7e 80 c1 c0

; ---------------- sub_s8:C4A2 FAR size=92 callers=1
8:C4A2  55                   push bp
8:C4A3  8bec                 mov bp, sp
8:C4A5  ff7612               push word ptr [bp + 0x12]
8:C4A8  687c01               push 0x17c
8:C4AB  66ff760a             push dword ptr [bp + 0xa]
8:C4AF  6a01                 push 1
8:C4B1  66ff7606             push dword ptr [bp + 6]
8:C4B5  9a287744c4           lcall 0xc444, 0x7728  ; sub_s9:7728
8:C4BA  c45e06               les bx, ptr [bp + 6]
8:C4BD  662bc0               sub eax, eax
8:C4C0  662689878e00         mov dword ptr es:[bx + 0x8e], eax
8:C4C6  662689879200         mov dword ptr es:[bx + 0x92], eax
8:C4CC  662689879600         mov dword ptr es:[bx + 0x96], eax
8:C4D2  26c7074cc7           mov word ptr es:[bx], 0xc74c
8:C4D7  26c7470238c4         mov word ptr es:[bx + 2], 0xc438  ; SEGMENT s8:0000
8:C4DD  6a3b                 push 0x3b
8:C4DF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:C4E4  9aba2094c0           lcall 0xc094, 0x20ba  ; sub_s3:20BA
8:C4E9  c45e06               les bx, ptr [bp + 6]
8:C4EC  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:C4F1  2689979000           mov word ptr es:[bx + 0x90], dx
8:C4F6  8bc3                 mov ax, bx
8:C4F8  8cc2                 mov dx, es
8:C4FA  c9                   leave
8:C4FB  ca0e00               retf 0xe

; ---------------- sub_s8:C4FE FAR size=44 callers=1
8:C4FE  55                   push bp
8:C4FF  8bec                 mov bp, sp
8:C501  c45e06               les bx, ptr [bp + 6]
8:C504  26c7074cc7           mov word ptr es:[bx], 0xc74c
8:C509  26c74702dbc4         mov word ptr es:[bx + 2], 0xc4db  ; SEGMENT s8:0000
8:C50F  26ff7706             push word ptr es:[bx + 6]
8:C513  66ff367c5b           push dword ptr [0x5b7c]
8:C518  90                   nop
8:C519  0e                   push cs
8:C51A  e8c3f1               call 0xb6e0  ; sub_s8:B6E0
8:C51D  66ff7606             push dword ptr [bp + 6]
8:C521  9a2c78b8c4           lcall 0xc4b8, 0x782c  ; sub_s9:782C
8:C526  c9                   leave
8:C527  ca0400               retf 4

; ---------------- sub_s8:C52A size=46 callers=0
8:C52A  c8040000             enter 4, 0
8:C52E  837e0a00             cmp word ptr [bp + 0xa], 0
8:C532  7514                 jne 0xc548
8:C534  666a2b               push 0x2b
8:C537  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:C53C  9aba2046c5           lcall 0xc546, 0x20ba  ; sub_s3:20BA
8:C541  52                   push dx
8:C542  50                   push ax
8:C543  9a8e03e7c4           lcall 0xc4e7, 0x38e  ; sub_s3:038E
loc_C548:
8:C548  66ff7608             push dword ptr [bp + 8]
8:C54C  ff7606               push word ptr [bp + 6]
8:C54F  9a987b24c5           lcall 0xc524, 0x7b98  ; sub_s9:7B98
8:C554  c9                   leave
8:C555  ca0600               retf 6

; ---------------- sub_s8:C558 FAR size=54 callers=0
;   apis: USER.SetFocus, USER.ShowWindow
8:C558  55                   push bp
8:C559  8bec                 mov bp, sp
8:C55B  66ff7606             push dword ptr [bp + 6]
8:C55F  9ae2786ec5           lcall 0xc56e, 0x78e2  ; sub_s9:78E2
8:C564  666aff               push -1
8:C567  66ff7606             push dword ptr [bp + 6]
8:C56B  9a6c8252c5           lcall 0xc552, 0x826c  ; sub_s9:826C
8:C570  c45e06               les bx, ptr [bp + 6]
8:C573  26ff7706             push word ptr es:[bx + 6]
8:C577  6a05                 push 5
8:C579  9a66c00000           lcall 0, 0xc066  ; USER.ShowWindow
8:C57E  c45e06               les bx, ptr [bp + 6]
8:C581  26ff7706             push word ptr es:[bx + 6]
8:C585  9a72c00000           lcall 0, 0xc072  ; USER.SetFocus
8:C58A  c9                   leave
8:C58B  ca0400               retf 4

; ---------------- sub_s8:C58E size=228 callers=0
;   apis: USER.GetWindowText, USER.SetDlgItemText, USER.SetWindowText, USER._wsprintf
8:C58E  c8140800             enter 0x814, 0
8:C592  57                   push di
8:C593  56                   push si
8:C594  6a02                 push 2
8:C596  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:C59B  9aba2033c6           lcall 0xc633, 0x20ba  ; sub_s3:20BA
8:C5A0  8946fc               mov word ptr [bp - 4], ax
8:C5A3  8956fe               mov word ptr [bp - 2], dx
8:C5A6  c45efc               les bx, ptr [bp - 4]
8:C5A9  66268b4768           mov eax, dword ptr es:[bx + 0x68]
8:C5AE  668946f8             mov dword ptr [bp - 8], eax
8:C5B2  c45e06               les bx, ptr [bp + 6]
8:C5B5  26ff7706             push word ptr es:[bx + 6]
8:C5B9  8d86f6fb             lea ax, [bp - 0x40a]
8:C5BD  16                   push ss
8:C5BE  50                   push ax
8:C5BF  688000               push 0x80
8:C5C2  9ad7be0000           lcall 0, 0xbed7  ; USER.GetWindowText
8:C5C7  66ff76f8             push dword ptr [bp - 8]
8:C5CB  8d86f6fb             lea ax, [bp - 0x40a]
8:C5CF  16                   push ss
8:C5D0  50                   push ax
8:C5D1  8d86f4f7             lea ax, [bp - 0x80c]
8:C5D5  16                   push ss
8:C5D6  50                   push ax
8:C5D7  9a50c60000           lcall 0, 0xc650  ; USER._wsprintf
8:C5DC  83c40c               add sp, 0xc
8:C5DF  c45e06               les bx, ptr [bp + 6]
8:C5E2  26ff7706             push word ptr es:[bx + 6]
8:C5E6  8d86f4f7             lea ax, [bp - 0x80c]
8:C5EA  16                   push ss
8:C5EB  50                   push ax
8:C5EC  9ad1c20000           lcall 0, 0xc2d1  ; USER.SetWindowText
8:C5F1  8b4606               mov ax, word ptr [bp + 6]
8:C5F4  8b5608               mov dx, word ptr [bp + 8]
8:C5F7  059600               add ax, 0x96
8:C5FA  52                   push dx
8:C5FB  50                   push ax
8:C5FC  8b4e06               mov cx, word ptr [bp + 6]
8:C5FF  81c19200             add cx, 0x92
8:C603  52                   push dx
8:C604  51                   push cx
8:C605  c47606               les si, ptr [bp + 6]
8:C608  6626ffb48e00         push dword ptr es:[si + 0x8e]
8:C60E  8bf1                 mov si, cx
8:C610  8986ecf7             mov word ptr [bp - 0x814], ax
8:C614  8996eef7             mov word ptr [bp - 0x812], dx
8:C618  8bfa                 mov di, dx
8:C61A  9a38e03cc4           lcall 0xc43c, 0xe038  ; sub_s2:E038
8:C61F  68d607               push 0x7d6
8:C622  8d86f4f7             lea ax, [bp - 0x80c]
8:C626  16                   push ss
8:C627  50                   push ax
8:C628  680004               push 0x400
8:C62B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C630  9ae0843fc5           lcall 0xc53f, 0x84e0  ; sub_s3:84E0
8:C635  8ec7                 mov es, di
8:C637  6626ff34             push dword ptr es:[si]
8:C63B  c49eecf7             les bx, ptr [bp - 0x814]
8:C63F  6626ff37             push dword ptr es:[bx]
8:C643  8d86f4f7             lea ax, [bp - 0x80c]
8:C647  16                   push ss
8:C648  50                   push ax
8:C649  8d86f6fb             lea ax, [bp - 0x40a]
8:C64D  16                   push ss
8:C64E  50                   push ax
8:C64F  9aecbe0000           lcall 0, 0xbeec  ; USER._wsprintf
8:C654  83c410               add sp, 0x10
8:C657  c45e06               les bx, ptr [bp + 6]
8:C65A  26ff7706             push word ptr es:[bx + 6]
8:C65E  687f01               push 0x17f
8:C661  8d86f6fb             lea ax, [bp - 0x40a]
8:C665  16                   push ss
8:C666  50                   push ax
8:C667  9affff0000           lcall 0, 0xffff  ; USER.SetDlgItemText
8:C66C  5e                   pop si
8:C66D  5f                   pop di
8:C66E  c9                   leave
8:C66F  ca0400               retf 4

; ---------------- sub_s8:C672 size=180 callers=0
;   apis: USER.MessageBox, USER.PostMessage
8:C672  c8020400             enter 0x402, 0
8:C676  8b460e               mov ax, word ptr [bp + 0xe]
8:C679  2d7d01               sub ax, 0x17d
8:C67C  7418                 je 0xc696
8:C67E  48                   dec ax
8:C67F  745d                 je 0xc6de
8:C681  66ff760c             push dword ptr [bp + 0xc]
8:C685  66ff7608             push dword ptr [bp + 8]
8:C689  ff7606               push word ptr [bp + 6]
8:C68C  9a3c7b62c5           lcall 0xc562, 0x7b3c  ; sub_s9:7B3C
8:C691  c9                   leave
8:C692  ca0a00               retf 0xa
8:C695  db 90
loc_C696:
8:C696  685304               push 0x453
8:C699  8d86fefb             lea ax, [bp - 0x402]
8:C69D  16                   push ss
8:C69E  50                   push ax
8:C69F  68ff03               push 0x3ff
8:C6A2  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C6A7  9ae084f2c6           lcall 0xc6f2, 0x84e0  ; sub_s3:84E0
8:C6AC  c45e06               les bx, ptr [bp + 6]
8:C6AF  26ff7706             push word ptr es:[bx + 6]
8:C6B3  8d86fefb             lea ax, [bp - 0x402]
8:C6B7  16                   push ss
8:C6B8  50                   push ax
8:C6B9  6626ffb79200         push dword ptr es:[bx + 0x92]
8:C6BF  6a30                 push 0x30
8:C6C1  9a0ac70000           lcall 0, 0xc70a  ; USER.MessageBox
loc_C6C6:
8:C6C6  c45e06               les bx, ptr [bp + 6]
8:C6C9  26ff7706             push word ptr es:[bx + 6]
8:C6CD  666802001101         push 0x1110002
8:C6D3  666a00               push 0
8:C6D6  9a46c10000           lcall 0, 0xc146  ; USER.PostMessage
8:C6DB  eb41                 jmp 0xc71e
8:C6DD  db 90
loc_C6DE:
8:C6DE  685404               push 0x454
8:C6E1  8d86fefb             lea ax, [bp - 0x402]
8:C6E5  16                   push ss
8:C6E6  50                   push ax
8:C6E7  68ff03               push 0x3ff
8:C6EA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:C6EF  9ae0849ec5           lcall 0xc59e, 0x84e0  ; sub_s3:84E0
8:C6F4  c45e06               les bx, ptr [bp + 6]
8:C6F7  26ff7706             push word ptr es:[bx + 6]
8:C6FB  8d86fefb             lea ax, [bp - 0x402]
8:C6FF  16                   push ss
8:C700  50                   push ax
8:C701  6626ffb79200         push dword ptr es:[bx + 0x92]
8:C707  6a30                 push 0x30
8:C709  9a90c10000           lcall 0, 0xc190  ; USER.MessageBox
8:C70E  c45e06               les bx, ptr [bp + 6]
8:C711  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:C717  9a64e11dc6           lcall 0xc61d, 0xe164  ; sub_s2:E164
8:C71C  eba8                 jmp 0xc6c6
loc_C71E:
8:C71E  b80100               mov ax, 1
8:C721  99                   cdq
8:C722  c9                   leave
8:C723  ca0a00               retf 0xa

; ---------------- sub_s8:C726 FAR size=146 callers=0
8:C726  55                   push bp
8:C727  8bec                 mov bp, sp
8:C729  66ff7606             push dword ptr [bp + 6]
8:C72D  90                   nop
8:C72E  0e                   push cs
8:C72F  e8ccfd               call 0xc4fe  ; sub_s8:C4FE
8:C732  f6460a01             test byte ptr [bp + 0xa], 1
8:C736  7409                 je 0xc741
8:C738  66ff7606             push dword ptr [bp + 6]
8:C73C  9ace1729c4           lcall 0xc429, 0x17ce  ; operator_delete@s1:17CE
loc_C741:
8:C741  8b4606               mov ax, word ptr [bp + 6]
8:C744  8b5608               mov dx, word ptr [bp + 8]
8:C747  c9                   leave
8:C748  ca0600               retf 6
8:C74B  db 90 26 c7 56 c7 10 3a 1a c7 58 c5 5e c7 c0 79 66
8:C75B  db c7 72 c6 62 c7 2a c5 9e c7 56 7f 6a c7 b2 7b 6e
8:C76B  db c7 1c 7f 72 c7 12 82 76 c7 86 7f 7a c7 0c 80 7e
8:C77B  db c7 54 80 82 c7 5e 7e 86 c7 58 81 8a c7 b6 81 8e
8:C78B  db c7 fe 81 96 c7 ea 60 a2 c7 4a 82 9a c7 66 82 b6
8:C79B  db c7 8e c5 ae c7 ee 60 a6 c7 f4 60 aa c7 fa 60 b2
8:C7AB  db c7 a4 a2 0d c5 fe 60 7c c4 7e 80 8f c6

; ---------------- sub_s8:C7B8 FAR size=82 callers=1
8:C7B8  55                   push bp
8:C7B9  8bec                 mov bp, sp
8:C7BB  ff7612               push word ptr [bp + 0x12]
8:C7BE  68b80f               push 0xfb8
8:C7C1  66ff760a             push dword ptr [bp + 0xa]
8:C7C5  6a01                 push 1
8:C7C7  66ff7606             push dword ptr [bp + 6]
8:C7CB  9a28775ac7           lcall 0xc75a, 0x7728  ; sub_s9:7728
8:C7D0  c45e06               les bx, ptr [bp + 6]
8:C7D3  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
8:C7DD  26c7076cca           mov word ptr es:[bx], 0xca6c
8:C7E2  26c747024ec7         mov word ptr es:[bx + 2], 0xc74e  ; SEGMENT s8:0000
8:C7E8  6a05                 push 5
8:C7EA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:C7EF  9aba20aac6           lcall 0xc6aa, 0x20ba  ; sub_s3:20BA
8:C7F4  c45e06               les bx, ptr [bp + 6]
8:C7F7  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:C7FC  2689979000           mov word ptr es:[bx + 0x90], dx
8:C801  8bc3                 mov ax, bx
8:C803  8cc2                 mov dx, es
8:C805  c9                   leave
8:C806  ca0e00               retf 0xe
8:C809  db 00

; ---------------- sub_s8:C80A FAR size=44 callers=1
8:C80A  55                   push bp
8:C80B  8bec                 mov bp, sp
8:C80D  c45e06               les bx, ptr [bp + 6]
8:C810  26c7076cca           mov word ptr es:[bx], 0xca6c
8:C815  26c74702e6c7         mov word ptr es:[bx + 2], 0xc7e6  ; SEGMENT s8:0000
8:C81B  26ff7706             push word ptr es:[bx + 6]
8:C81F  66ff367c5b           push dword ptr [0x5b7c]
8:C824  90                   nop
8:C825  0e                   push cs
8:C826  e8b7ee               call 0xb6e0  ; sub_s8:B6E0
8:C829  66ff7606             push dword ptr [bp + 6]
8:C82D  9a2c78cec7           lcall 0xc7ce, 0x782c  ; sub_s9:782C
8:C832  c9                   leave
8:C833  ca0400               retf 4

; ---------------- sub_s8:C836 size=102 callers=0
;   apis: USER.DestroyWindow
8:C836  c80c0000             enter 0xc, 0
8:C83A  817e0ece0f           cmp word ptr [bp + 0xe], 0xfce
8:C83F  7547                 jne 0xc888
8:C841  66680100ac00         push 0xac0001
8:C847  8d46fc               lea ax, [bp - 4]
8:C84A  16                   push ss
8:C84B  50                   push ax
8:C84C  9a1a945ec8           lcall 0xc85e, 0x941a  ; sub_s2:941A
8:C851  8d46fc               lea ax, [bp - 4]
8:C854  16                   push ss
8:C855  50                   push ax
8:C856  66ff36a002           push dword ptr [0x2a0]
8:C85B  9a9e5c52c7           lcall 0xc752, 0x5c9e  ; sub_s2:5C9E
8:C860  c45e06               les bx, ptr [bp + 6]
8:C863  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C868  26c7470a0600         mov word ptr es:[bx + 0xa], 6
8:C86E  c45e06               les bx, ptr [bp + 6]
8:C871  26ff7706             push word ptr es:[bx + 6]
8:C875  9a83a00000           lcall 0, 0xa083  ; USER.DestroyWindow
8:C87A  c706805b0000         mov word ptr [0x5b80], 0
8:C880  b80100               mov ax, 1
8:C883  99                   cdq
8:C884  c9                   leave
8:C885  ca0a00               retf 0xa
loc_C888:
8:C888  66ff760c             push dword ptr [bp + 0xc]
8:C88C  66ff7608             push dword ptr [bp + 8]
8:C890  ff7606               push word ptr [bp + 6]
8:C893  9a3c7b30c8           lcall 0xc830, 0x7b3c  ; sub_s9:7B3C
8:C898  c9                   leave
8:C899  ca0a00               retf 0xa

; ---------------- sub_s8:C89C size=194 callers=0
;   apis: USER.CheckRadioButton, USER.EnableWindow, USER.GetDlgItem, USER.ShowWindow
8:C89C  c80a0000             enter 0xa, 0
8:C8A0  66ff7606             push dword ptr [bp + 6]
8:C8A4  9ae27849c9           lcall 0xc949, 0x78e2  ; sub_s9:78E2
8:C8A9  c45e06               les bx, ptr [bp + 6]
8:C8AC  26ff7706             push word ptr es:[bx + 6]
8:C8B0  6668ad0fac0f         push 0xfac0fad
8:C8B6  68ac0f               push 0xfac
8:C8B9  9affff0000           lcall 0, 0xffff  ; USER.CheckRadioButton
8:C8BE  c45e06               les bx, ptr [bp + 6]
8:C8C1  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C8C6  26c7470a0100         mov word ptr es:[bx + 0xa], 1
8:C8CC  c45e06               les bx, ptr [bp + 6]
8:C8CF  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C8D4  268b4712             mov ax, word ptr es:[bx + 0x12]
8:C8D8  eb50                 jmp 0xc92a
loc_C8DA:
8:C8DA  c45e06               les bx, ptr [bp + 6]
8:C8DD  26ff7706             push word ptr es:[bx + 6]
8:C8E1  68ce0f               push 0xfce
8:C8E4  9affc80000           lcall 0, 0xc8ff  ; USER.GetDlgItem
8:C8E9  0bc0                 or ax, ax
8:C8EB  7408                 je 0xc8f5
8:C8ED  50                   push ax
8:C8EE  6a01                 push 1
8:C8F0  9a0bc90000           lcall 0, 0xc90b  ; USER.EnableWindow
loc_C8F5:
8:C8F5  c45e06               les bx, ptr [bp + 6]
8:C8F8  26ff7706             push word ptr es:[bx + 6]
8:C8FC  6a01                 push 1
8:C8FE  9a1dc90000           lcall 0, 0xc91d  ; USER.GetDlgItem
8:C903  0bc0                 or ax, ax
8:C905  7435                 je 0xc93c
8:C907  50                   push ax
8:C908  6a00                 push 0
loc_C90A:
8:C90A  9afcc20000           lcall 0, 0xc2fc  ; USER.EnableWindow
8:C90F  eb2b                 jmp 0xc93c
8:C911  db 90
loc_C912:
8:C912  c45e06               les bx, ptr [bp + 6]
8:C915  26ff7706             push word ptr es:[bx + 6]
8:C919  68ce0f               push 0xfce
8:C91C  9a10bf0000           lcall 0, 0xbf10  ; USER.GetDlgItem
8:C921  0bc0                 or ax, ax
8:C923  7417                 je 0xc93c
8:C925  50                   push ax
8:C926  6a01                 push 1
8:C928  ebe0                 jmp 0xc90a
loc_C92A:
8:C92A  2d0400               sub ax, 4
8:C92D  74ab                 je 0xc8da
8:C92F  48                   dec ax
8:C930  48                   dec ax
8:C931  7c09                 jl 0xc93c
8:C933  7007                 jo 0xc93c
8:C935  48                   dec ax
8:C936  48                   dec ax
8:C937  7ed9                 jle 0xc912
8:C939  48                   dec ax
8:C93A  749e                 je 0xc8da
loc_C93C:
8:C93C  6668c8000000         push 0xc8
8:C942  66ff7606             push dword ptr [bp + 6]
8:C946  9a6c8296c8           lcall 0xc896, 0x826c  ; sub_s9:826C
8:C94B  c45e06               les bx, ptr [bp + 6]
8:C94E  26ff7706             push word ptr es:[bx + 6]
8:C952  6a05                 push 5
8:C954  9a7ac50000           lcall 0, 0xc57a  ; USER.ShowWindow
8:C959  c9                   leave
8:C95A  ca0400               retf 4
8:C95D  db 00

; ---------------- sub_s8:C95E FAR size=228 callers=0
;   apis: USER.DestroyWindow, USER.IsDlgButtonChecked
8:C95E  c8080000             enter 8, 0
8:C962  837e0a00             cmp word ptr [bp + 0xa], 0
8:C966  0f84b400             je 0xca1e
8:C96A  c45e06               les bx, ptr [bp + 6]
8:C96D  26ff7706             push word ptr es:[bx + 6]
8:C971  68ac0f               push 0xfac
8:C974  9a99c90000           lcall 0, 0xc999  ; USER.IsDlgButtonChecked
8:C979  0bc0                 or ax, ax
8:C97B  7411                 je 0xc98e
8:C97D  c45e06               les bx, ptr [bp + 6]
8:C980  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C985  26c7470a0100         mov word ptr es:[bx + 0xa], 1
8:C98B  e99e00               jmp 0xca2c
loc_C98E:
8:C98E  c45e06               les bx, ptr [bp + 6]
8:C991  26ff7706             push word ptr es:[bx + 6]
8:C995  68ad0f               push 0xfad
8:C998  9abdc90000           lcall 0, 0xc9bd  ; USER.IsDlgButtonChecked
8:C99D  0bc0                 or ax, ax
8:C99F  7411                 je 0xc9b2
8:C9A1  c45e06               les bx, ptr [bp + 6]
8:C9A4  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C9A9  26c7470a0200         mov word ptr es:[bx + 0xa], 2
8:C9AF  eb7b                 jmp 0xca2c
8:C9B1  db 90
loc_C9B2:
8:C9B2  c45e06               les bx, ptr [bp + 6]
8:C9B5  26ff7706             push word ptr es:[bx + 6]
8:C9B9  68ae0f               push 0xfae
8:C9BC  9ae1c90000           lcall 0, 0xc9e1  ; USER.IsDlgButtonChecked
8:C9C1  0bc0                 or ax, ax
8:C9C3  7411                 je 0xc9d6
8:C9C5  c45e06               les bx, ptr [bp + 6]
8:C9C8  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C9CD  26c7470a0300         mov word ptr es:[bx + 0xa], 3
8:C9D3  eb57                 jmp 0xca2c
8:C9D5  db 90
loc_C9D6:
8:C9D6  c45e06               les bx, ptr [bp + 6]
8:C9D9  26ff7706             push word ptr es:[bx + 6]
8:C9DD  68af0f               push 0xfaf
8:C9E0  9a05ca0000           lcall 0, 0xca05  ; USER.IsDlgButtonChecked
8:C9E5  0bc0                 or ax, ax
8:C9E7  7411                 je 0xc9fa
8:C9E9  c45e06               les bx, ptr [bp + 6]
8:C9EC  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:C9F1  26c7470a0400         mov word ptr es:[bx + 0xa], 4
8:C9F7  eb33                 jmp 0xca2c
8:C9F9  db 90
loc_C9FA:
8:C9FA  c45e06               les bx, ptr [bp + 6]
8:C9FD  26ff7706             push word ptr es:[bx + 6]
8:CA01  68b00f               push 0xfb0
8:CA04  9aa1b90000           lcall 0, 0xb9a1  ; USER.IsDlgButtonChecked
8:CA09  0bc0                 or ax, ax
8:CA0B  741f                 je 0xca2c
8:CA0D  c45e06               les bx, ptr [bp + 6]
8:CA10  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CA15  26c7470a0500         mov word ptr es:[bx + 0xa], 5
8:CA1B  eb0f                 jmp 0xca2c
8:CA1D  db 90
loc_CA1E:
8:CA1E  c45e06               les bx, ptr [bp + 6]
8:CA21  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CA26  26c7470a0000         mov word ptr es:[bx + 0xa], 0
loc_CA2C:
8:CA2C  c45e06               les bx, ptr [bp + 6]
8:CA2F  26ff7706             push word ptr es:[bx + 6]
8:CA33  9a76c80000           lcall 0, 0xc876  ; USER.DestroyWindow
8:CA38  c706805b0000         mov word ptr [0x5b80], 0
8:CA3E  c9                   leave
8:CA3F  ca0600               retf 6

; ---------------- sub_s8:CA42 FAR size=4 callers=0
8:CA42  ca0400               retf 4
8:CA45  db 00

; ---------------- sub_s8:CA46 FAR size=146 callers=0
8:CA46  55                   push bp
8:CA47  8bec                 mov bp, sp
8:CA49  66ff7606             push dword ptr [bp + 6]
8:CA4D  90                   nop
8:CA4E  0e                   push cs
8:CA4F  e8b8fd               call 0xc80a  ; sub_s8:C80A
8:CA52  f6460a01             test byte ptr [bp + 0xa], 1
8:CA56  7409                 je 0xca61
8:CA58  66ff7606             push dword ptr [bp + 6]
8:CA5C  9ace173fc7           lcall 0xc73f, 0x17ce  ; operator_delete@s1:17CE
loc_CA61:
8:CA61  8b4606               mov ax, word ptr [bp + 6]
8:CA64  8b5608               mov dx, word ptr [bp + 8]
8:CA67  c9                   leave
8:CA68  ca0600               retf 6
8:CA6B  db 90 46 ca 76 ca 10 3a 4f c8 9c c8 7e ca c0 79 86
8:CA7B  db ca 36 c8 82 ca 5e c9 92 ca 56 7f 8a ca b2 7b 8e
8:CA8B  db ca 1c 7f 96 ca 42 ca ce ca 86 7f 9a ca 0c 80 9e
8:CA9B  db ca 54 80 a2 ca 5e 7e a6 ca 58 81 aa ca b6 81 ae
8:CAAB  db ca fe 81 b6 ca ea 60 c2 ca 4a 82 ba ca 66 82 be
8:CABB  db ca de 78 d6 ca ee 60 c6 ca f4 60 ca ca fa 60 d2
8:CACB  db ca a4 a2 19 c8 fe 60 92 c7 7e 80 a7 c8

; ---------------- sub_s8:CAD8 FAR size=88 callers=1
8:CAD8  55                   push bp
8:CAD9  8bec                 mov bp, sp
8:CADB  ff760a               push word ptr [bp + 0xa]
8:CADE  66680000cb01         push 0x1cb0000
8:CAE4  666a01               push 1
8:CAE7  66ff7606             push dword ptr [bp + 6]
8:CAEB  9a28777aca           lcall 0xca7a, 0x7728  ; sub_s9:7728
8:CAF0  c45e06               les bx, ptr [bp + 6]
8:CAF3  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
8:CAFD  26c7079acc           mov word ptr es:[bx], 0xcc9a
8:CB02  26c747026eca         mov word ptr es:[bx + 2], 0xca6e  ; SEGMENT s8:0000
8:CB08  6a2c                 push 0x2c
8:CB0A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:CB0F  9aba20f2c7           lcall 0xc7f2, 0x20ba  ; sub_s3:20BA
8:CB14  c45e06               les bx, ptr [bp + 6]
8:CB17  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:CB1C  2689979000           mov word ptr es:[bx + 0x90], dx
8:CB21  26c747740000         mov word ptr es:[bx + 0x74], 0
8:CB27  8bc3                 mov ax, bx
8:CB29  8cc2                 mov dx, es
8:CB2B  c9                   leave
8:CB2C  ca0600               retf 6
8:CB2F  db 00

; ---------------- sub_s8:CB30 FAR size=44 callers=1
8:CB30  55                   push bp
8:CB31  8bec                 mov bp, sp
8:CB33  c45e06               les bx, ptr [bp + 6]
8:CB36  26c7079acc           mov word ptr es:[bx], 0xcc9a
8:CB3B  26c7470206cb         mov word ptr es:[bx + 2], 0xcb06  ; SEGMENT s8:0000
8:CB41  26ff7706             push word ptr es:[bx + 6]
8:CB45  66ff367c5b           push dword ptr [0x5b7c]
8:CB4A  90                   nop
8:CB4B  0e                   push cs
8:CB4C  e891eb               call 0xb6e0  ; sub_s8:B6E0
8:CB4F  66ff7606             push dword ptr [bp + 6]
8:CB53  9a2c78eeca           lcall 0xcaee, 0x782c  ; sub_s9:782C
8:CB58  c9                   leave
8:CB59  ca0400               retf 4

; ---------------- sub_s8:CB5C size=164 callers=0
;   apis: USER.ShowWindow
8:CB5C  c80c0000             enter 0xc, 0
8:CB60  66ff7606             push dword ptr [bp + 6]
8:CB64  9ae27856cb           lcall 0xcb56, 0x78e2  ; sub_s9:78E2
8:CB69  c45e06               les bx, ptr [bp + 6]
8:CB6C  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:CB72  9a6eeb91cb           lcall 0xcb91, 0xeb6e  ; sub_s2:EB6E
8:CB77  8946fe               mov word ptr [bp - 2], ax
8:CB7A  c746f80000           mov word ptr [bp - 8], 0
8:CB7F  eb55                 jmp 0xcbd6
8:CB81  db 90
loc_CB82:
8:CB82  ff76f8               push word ptr [bp - 8]
8:CB85  c45e06               les bx, ptr [bp + 6]
8:CB88  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:CB8E  9a5cebd1cb           lcall 0xcbd1, 0xeb5c  ; sub_s2:EB5C
8:CB93  8946fa               mov word ptr [bp - 6], ax
8:CB96  8956fc               mov word ptr [bp - 4], dx
8:CB99  6a42                 push 0x42
8:CB9B  9a9c175fca           lcall 0xca5f, 0x179c  ; operator_new@s1:179C
8:CBA0  83c402               add sp, 2
8:CBA3  8956f6               mov word ptr [bp - 0xa], dx
8:CBA6  0bd0                 or dx, ax
8:CBA8  7429                 je 0xcbd3
8:CBAA  c45e06               les bx, ptr [bp + 6]
8:CBAD  26ff7706             push word ptr es:[bx + 6]
8:CBB1  c45efa               les bx, ptr [bp - 6]
8:CBB4  26ff7704             push word ptr es:[bx + 4]
8:CBB8  66680001ff00         push 0xff0100
8:CBBE  680101               push 0x101
8:CBC1  26ff37               push word ptr es:[bx]
8:CBC4  26ff7702             push word ptr es:[bx + 2]
8:CBC8  6a00                 push 0
8:CBCA  ff76f6               push word ptr [bp - 0xa]
8:CBCD  50                   push ax
8:CBCE  9ad63beccb           lcall 0xcbec, 0x3bd6  ; sub_s2:3BD6
loc_CBD3:
8:CBD3  ff46f8               inc word ptr [bp - 8]
loc_CBD6:
8:CBD6  8b46fe               mov ax, word ptr [bp - 2]
8:CBD9  3946f8               cmp word ptr [bp - 8], ax
8:CBDC  7ca4                 jl 0xcb82
8:CBDE  666801000900         push 0x90001
8:CBE4  66ff36a002           push dword ptr [0x2a0]
8:CBE9  9a7c5c72ca           lcall 0xca72, 0x5c7c  ; sub_s2:5C7C
8:CBEE  c45e06               les bx, ptr [bp + 6]
8:CBF1  26ff7706             push word ptr es:[bx + 6]
8:CBF5  6a05                 push 5
8:CBF7  9a55c90000           lcall 0, 0xc955  ; USER.ShowWindow
8:CBFC  c9                   leave
8:CBFD  ca0400               retf 4

; ---------------- sub_s8:CC00 size=116 callers=0
;   apis: USER.DestroyWindow
8:CC00  c8020000             enter 2, 0
8:CC04  8b460e               mov ax, word ptr [bp + 0xe]
8:CC07  2dcd01               sub ax, 0x1cd
8:CC0A  7420                 je 0xcc2c
8:CC0C  48                   dec ax
8:CC0D  742f                 je 0xcc3e
8:CC0F  48                   dec ax
8:CC10  7430                 je 0xcc42
8:CC12  48                   dec ax
8:CC13  7431                 je 0xcc46
8:CC15  48                   dec ax
8:CC16  7432                 je 0xcc4a
8:CC18  66ff760c             push dword ptr [bp + 0xc]
8:CC1C  66ff7608             push dword ptr [bp + 8]
8:CC20  ff7606               push word ptr [bp + 6]
8:CC23  9a3c7b67cb           lcall 0xcb67, 0x7b3c  ; sub_s9:7B3C
8:CC28  c9                   leave
8:CC29  ca0a00               retf 0xa
loc_CC2C:
8:CC2C  6a01                 push 1
loc_CC2E:
8:CC2E  c45e06               les bx, ptr [bp + 6]
8:CC31  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:CC37  9a74eb5dcc           lcall 0xcc5d, 0xeb74  ; sub_s2:EB74
8:CC3C  eb10                 jmp 0xcc4e
loc_CC3E:
8:CC3E  6a02                 push 2
8:CC40  ebec                 jmp 0xcc2e
loc_CC42:
8:CC42  6a03                 push 3
8:CC44  ebe8                 jmp 0xcc2e
loc_CC46:
8:CC46  6a04                 push 4
8:CC48  ebe4                 jmp 0xcc2e
loc_CC4A:
8:CC4A  6a05                 push 5
8:CC4C  ebe0                 jmp 0xcc2e
loc_CC4E:
8:CC4E  0bc0                 or ax, ax
8:CC50  7419                 je 0xcc6b
8:CC52  50                   push ax
8:CC53  6a01                 push 1
8:CC55  66ff36a002           push dword ptr [0x2a0]
8:CC5A  9a7c5c75cb           lcall 0xcb75, 0x5c7c  ; sub_s2:5C7C
8:CC5F  c45e06               les bx, ptr [bp + 6]
8:CC62  26ff7706             push word ptr es:[bx + 6]
8:CC66  9a34ca0000           lcall 0, 0xca34  ; USER.DestroyWindow
loc_CC6B:
8:CC6B  b80100               mov ax, 1
8:CC6E  99                   cdq
8:CC6F  c9                   leave
8:CC70  ca0a00               retf 0xa
8:CC73  db 00

; ---------------- sub_s8:CC74 FAR size=146 callers=0
8:CC74  55                   push bp
8:CC75  8bec                 mov bp, sp
8:CC77  66ff7606             push dword ptr [bp + 6]
8:CC7B  90                   nop
8:CC7C  0e                   push cs
8:CC7D  e8b0fe               call 0xcb30  ; sub_s8:CB30
8:CC80  f6460a01             test byte ptr [bp + 0xa], 1
8:CC84  7409                 je 0xcc8f
8:CC86  66ff7606             push dword ptr [bp + 6]
8:CC8A  9ace179ecb           lcall 0xcb9e, 0x17ce  ; operator_delete@s1:17CE
loc_CC8F:
8:CC8F  8b4606               mov ax, word ptr [bp + 6]
8:CC92  8b5608               mov dx, word ptr [bp + 8]
8:CC95  c9                   leave
8:CC96  ca0600               retf 6
8:CC99  db 90 74 cc a4 cc 10 3a 3a cc 5c cb ac cc c0 79 b0
8:CCA9  db cc 00 cc fc cc 98 7b b4 cc 56 7f b8 cc b2 7b bc
8:CCB9  db cc 1c 7f c0 cc 12 82 c4 cc 86 7f c8 cc 0c 80 cc
8:CCC9  db cc 54 80 d0 cc 5e 7e d4 cc 58 81 d8 cc b6 81 dc
8:CCD9  db cc fe 81 e4 cc ea 60 f0 cc 4a 82 e8 cc 66 82 ec
8:CCE9  db cc de 78 04 cd ee 60 f4 cc f4 60 f8 cc fa 60 00
8:CCF9  db cd a4 a2 3f cb fe 60 b2 ca 7e 80 26 cc

; ---------------- sub_s8:CD06 FAR size=86 callers=1
8:CD06  55                   push bp
8:CD07  8bec                 mov bp, sp
8:CD09  ff7612               push word ptr [bp + 0x12]
8:CD0C  68cc0f               push 0xfcc
8:CD0F  66ff760a             push dword ptr [bp + 0xa]
8:CD13  6a01                 push 1
8:CD15  66ff7606             push dword ptr [bp + 6]
8:CD19  9a2877a8cc           lcall 0xcca8, 0x7728  ; sub_s9:7728
8:CD1E  c45e06               les bx, ptr [bp + 6]
8:CD21  662bc0               sub eax, eax
8:CD24  662689878e00         mov dword ptr es:[bx + 0x8e], eax
8:CD2A  2689879200           mov word ptr es:[bx + 0x92], ax
8:CD2F  26c70700cf           mov word ptr es:[bx], 0xcf00
8:CD34  26c747029ccc         mov word ptr es:[bx + 2], 0xcc9c  ; SEGMENT s8:0000
8:CD3A  6a42                 push 0x42
8:CD3C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:CD41  9aba2012cb           lcall 0xcb12, 0x20ba  ; sub_s3:20BA
8:CD46  c45e06               les bx, ptr [bp + 6]
8:CD49  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:CD4E  2689979000           mov word ptr es:[bx + 0x90], dx
8:CD53  8bc3                 mov ax, bx
8:CD55  8cc2                 mov dx, es
8:CD57  c9                   leave
8:CD58  ca0e00               retf 0xe
8:CD5B  db 00

; ---------------- sub_s8:CD5C FAR size=44 callers=1
8:CD5C  55                   push bp
8:CD5D  8bec                 mov bp, sp
8:CD5F  c45e06               les bx, ptr [bp + 6]
8:CD62  26c70700cf           mov word ptr es:[bx], 0xcf00
8:CD67  26c7470238cd         mov word ptr es:[bx + 2], 0xcd38  ; SEGMENT s8:0000
8:CD6D  26ff7706             push word ptr es:[bx + 6]
8:CD71  66ff367c5b           push dword ptr [0x5b7c]
8:CD76  90                   nop
8:CD77  0e                   push cs
8:CD78  e865e9               call 0xb6e0  ; sub_s8:B6E0
8:CD7B  66ff7606             push dword ptr [bp + 6]
8:CD7F  9a2c781ccd           lcall 0xcd1c, 0x782c  ; sub_s9:782C
8:CD84  c9                   leave
8:CD85  ca0400               retf 4

; ---------------- sub_s8:CD88 FAR size=78 callers=0
;   apis: USER.DestroyWindow, USER.ShowWindow
8:CD88  55                   push bp
8:CD89  8bec                 mov bp, sp
8:CD8B  66ff7606             push dword ptr [bp + 6]
8:CD8F  9ae2789ecd           lcall 0xcd9e, 0x78e2  ; sub_s9:78E2
8:CD94  666aff               push -1
8:CD97  66ff7606             push dword ptr [bp + 6]
8:CD9B  9a6c8282cd           lcall 0xcd82, 0x826c  ; sub_s9:826C
8:CDA0  c45e06               les bx, ptr [bp + 6]
8:CDA3  26ff7706             push word ptr es:[bx + 6]
8:CDA7  6a05                 push 5
8:CDA9  9af8cb0000           lcall 0, 0xcbf8  ; USER.ShowWindow
8:CDAE  c45e06               les bx, ptr [bp + 6]
8:CDB1  26c78792000100       mov word ptr es:[bx + 0x92], 1
8:CDB8  8d879200             lea ax, [bx + 0x92]
8:CDBC  06                   push es
8:CDBD  50                   push ax
8:CDBE  9a1095a0cc           lcall 0xcca0, 0x9510  ; MessageLoop@s2:9510
8:CDC3  83c404               add sp, 4
8:CDC6  c45e06               les bx, ptr [bp + 6]
8:CDC9  26ff7706             push word ptr es:[bx + 6]
8:CDCD  9a67cc0000           lcall 0, 0xcc67  ; USER.DestroyWindow
8:CDD2  c9                   leave
8:CDD3  ca0400               retf 4

; ---------------- sub_s8:CDD6 size=256 callers=0
;   apis: USER.IsDlgButtonChecked
8:CDD6  c8080000             enter 8, 0
8:CDDA  837e0a00             cmp word ptr [bp + 0xa], 0
8:CDDE  0f84d800             je 0xceba
8:CDE2  c45e06               les bx, ptr [bp + 6]
8:CDE5  26ff7706             push word ptr es:[bx + 6]
8:CDE9  682e18               push 0x182e
8:CDEC  9a11ce0000           lcall 0, 0xce11  ; USER.IsDlgButtonChecked
8:CDF1  0bc0                 or ax, ax
8:CDF3  7411                 je 0xce06
8:CDF5  c45e06               les bx, ptr [bp + 6]
8:CDF8  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CDFD  26c7470a0100         mov word ptr es:[bx + 0xa], 1
8:CE03  e9c200               jmp 0xcec8
loc_CE06:
8:CE06  c45e06               les bx, ptr [bp + 6]
8:CE09  26ff7706             push word ptr es:[bx + 6]
8:CE0D  682f18               push 0x182f
8:CE10  9a35ce0000           lcall 0, 0xce35  ; USER.IsDlgButtonChecked
8:CE15  0bc0                 or ax, ax
8:CE17  7411                 je 0xce2a
8:CE19  c45e06               les bx, ptr [bp + 6]
8:CE1C  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CE21  26c7470a0200         mov word ptr es:[bx + 0xa], 2
8:CE27  e99e00               jmp 0xcec8
loc_CE2A:
8:CE2A  c45e06               les bx, ptr [bp + 6]
8:CE2D  26ff7706             push word ptr es:[bx + 6]
8:CE31  682918               push 0x1829
8:CE34  9a59ce0000           lcall 0, 0xce59  ; USER.IsDlgButtonChecked
8:CE39  0bc0                 or ax, ax
8:CE3B  7411                 je 0xce4e
8:CE3D  c45e06               les bx, ptr [bp + 6]
8:CE40  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CE45  26c7470a0300         mov word ptr es:[bx + 0xa], 3
8:CE4B  eb7b                 jmp 0xcec8
8:CE4D  db 90
loc_CE4E:
8:CE4E  c45e06               les bx, ptr [bp + 6]
8:CE51  26ff7706             push word ptr es:[bx + 6]
8:CE55  682a18               push 0x182a
8:CE58  9a7dce0000           lcall 0, 0xce7d  ; USER.IsDlgButtonChecked
8:CE5D  0bc0                 or ax, ax
8:CE5F  7411                 je 0xce72
8:CE61  c45e06               les bx, ptr [bp + 6]
8:CE64  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CE69  26c7470a0400         mov word ptr es:[bx + 0xa], 4
8:CE6F  eb57                 jmp 0xcec8
8:CE71  db 90
loc_CE72:
8:CE72  c45e06               les bx, ptr [bp + 6]
8:CE75  26ff7706             push word ptr es:[bx + 6]
8:CE79  682c18               push 0x182c
8:CE7C  9aa1ce0000           lcall 0, 0xcea1  ; USER.IsDlgButtonChecked
8:CE81  0bc0                 or ax, ax
8:CE83  7411                 je 0xce96
8:CE85  c45e06               les bx, ptr [bp + 6]
8:CE88  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CE8D  26c7470a0600         mov word ptr es:[bx + 0xa], 6
8:CE93  eb33                 jmp 0xcec8
8:CE95  db 90
loc_CE96:
8:CE96  c45e06               les bx, ptr [bp + 6]
8:CE99  26ff7706             push word ptr es:[bx + 6]
8:CE9D  682d18               push 0x182d
8:CEA0  9a75c90000           lcall 0, 0xc975  ; USER.IsDlgButtonChecked
8:CEA5  0bc0                 or ax, ax
8:CEA7  741f                 je 0xcec8
8:CEA9  c45e06               les bx, ptr [bp + 6]
8:CEAC  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CEB1  26c7470a0700         mov word ptr es:[bx + 0xa], 7
8:CEB7  eb0f                 jmp 0xcec8
8:CEB9  db 90
loc_CEBA:
8:CEBA  c45e06               les bx, ptr [bp + 6]
8:CEBD  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:CEC2  26c7470a0000         mov word ptr es:[bx + 0xa], 0
loc_CEC8:
8:CEC8  c45e06               les bx, ptr [bp + 6]
8:CECB  26c78792000000       mov word ptr es:[bx + 0x92], 0
8:CED2  c9                   leave
8:CED3  ca0600               retf 6

; ---------------- sub_s8:CED6 FAR size=4 callers=0
8:CED6  ca0400               retf 4
8:CED9  db 00

; ---------------- sub_s8:CEDA FAR size=146 callers=0
8:CEDA  55                   push bp
8:CEDB  8bec                 mov bp, sp
8:CEDD  66ff7606             push dword ptr [bp + 6]
8:CEE1  90                   nop
8:CEE2  0e                   push cs
8:CEE3  e876fe               call 0xcd5c  ; sub_s8:CD5C
8:CEE6  f6460a01             test byte ptr [bp + 0xa], 1
8:CEEA  7409                 je 0xcef5
8:CEEC  66ff7606             push dword ptr [bp + 6]
8:CEF0  9ace178dcc           lcall 0xcc8d, 0x17ce  ; operator_delete@s1:17CE
loc_CEF5:
8:CEF5  8b4606               mov ax, word ptr [bp + 6]
8:CEF8  8b5608               mov dx, word ptr [bp + 8]
8:CEFB  c9                   leave
8:CEFC  ca0600               retf 6
8:CEFF  db 90 da ce 0a cf 10 3a c1 cd 88 cd 16 cf c0 79 12
8:CF0F  db cf 3c 7b 1a cf d6 cd 26 cf 56 7f 1e cf b2 7b 22
8:CF1F  db cf 1c 7f 2a cf d6 ce 62 cf 86 7f 2e cf 0c 80 32
8:CF2F  db cf 54 80 36 cf 5e 7e 3a cf 58 81 3e cf b6 81 42
8:CF3F  db cf fe 81 4a cf ea 60 56 cf 4a 82 4e cf 66 82 52
8:CF4F  db cf de 78 6a cf ee 60 5a cf f4 60 5e cf fa 60 66
8:CF5F  db cf a4 a2 6b cd fe 60 e0 cc 7e 80 92 cd

; ---------------- sub_s8:CF6C FAR size=110 callers=1
;   apis: KERNEL.MakeProcInstance
8:CF6C  c8040000             enter 4, 0
8:CF70  c45e06               les bx, ptr [bp + 6]
8:CF73  26c7079a38           mov word ptr es:[bx], 0x389a
8:CF78  26c7470206cf         mov word ptr es:[bx + 2], 0xcf06  ; SEGMENT s2:0000
8:CF7E  c45e06               les bx, ptr [bp + 6]
8:CF81  662bc0               sub eax, eax
8:CF84  6626894704           mov dword ptr es:[bx + 4], eax
8:CF89  26894708             mov word ptr es:[bx + 8], ax
8:CF8D  26c7073ed2           mov word ptr es:[bx], 0xd23e
8:CF92  26c74702a1cf         mov word ptr es:[bx + 2], 0xcfa1  ; SEGMENT s8:0000
8:CF98  891ec85b             mov word ptr [0x5bc8], bx
8:CF9C  8c06ca5b             mov word ptr [0x5bca], es
8:CFA0  68bbcf               push 0xcfbb  ; SEGMENT s8:0000
8:CFA3  6816d1               push 0xd116
8:CFA6  ff368c03             push word ptr [0x38c]
8:CFAA  9ac5cf0000           lcall 0, 0xcfc5  ; KERNEL.MakeProcInstance
8:CFAF  c45e06               les bx, ptr [bp + 6]
8:CFB2  26894704             mov word ptr es:[bx + 4], ax
8:CFB6  26895706             mov word ptr es:[bx + 6], dx
8:CFBA  6802cf               push 0xcf02  ; SEGMENT s8:0000
8:CFBD  681ed0               push 0xd01e
8:CFC0  ff368c03             push word ptr [0x38c]
8:CFC4  9affff0000           lcall 0, 0xffff  ; KERNEL.MakeProcInstance
8:CFC9  a3cc5b               mov word ptr [0x5bcc], ax
8:CFCC  8916ce5b             mov word ptr [0x5bce], dx
8:CFD0  8b4606               mov ax, word ptr [bp + 6]
8:CFD3  8b5608               mov dx, word ptr [bp + 8]
8:CFD6  c9                   leave
8:CFD7  ca0400               retf 4

; ---------------- sub_s8:CFDA FAR size=574 callers=1
;   apis: KERNEL.FreeProcInstance
8:CFDA  c8040000             enter 4, 0
8:CFDE  c45e06               les bx, ptr [bp + 6]
8:CFE1  26c7073ed2           mov word ptr es:[bx], 0xd23e
8:CFE6  26c7470296cf         mov word ptr es:[bx + 2], 0xcf96  ; SEGMENT s8:0000
8:CFEC  6626ff7704           push dword ptr es:[bx + 4]
8:CFF1  9afccf0000           lcall 0, 0xcffc  ; KERNEL.FreeProcInstance
8:CFF6  66ff36cc5b           push dword ptr [0x5bcc]
8:CFFB  9affff0000           lcall 0, 0xffff  ; KERNEL.FreeProcInstance
8:D000  c45e06               les bx, ptr [bp + 6]
8:D003  6626c7470400000000   mov dword ptr es:[bx + 4], 0
8:D00C  c45e06               les bx, ptr [bp + 6]
8:D00F  26c7079a38           mov word ptr es:[bx], 0x389a
8:D014  26c747027ccf         mov word ptr es:[bx + 2], 0xcf7c  ; SEGMENT s2:0000
8:D01A  c9                   leave
8:D01B  ca0400               retf 4
8:D01E  db 8c d0 c8 0e 00 00 57 56 1e 8e d8 ff 76 0e 1e 68
8:D02E  db d7 5b 9a 3f d0 00 00 ff 76 0e 1e 68 d0 5b 8b f0
8:D03E  db 9a 51 d0 00 00 89 46 fc 89 76 fe ff 76 0e 1e 68
8:D04E  db e5 5b 9a 63 d0 00 00 2b c9 ff 76 0e 1e 68 de 5b
8:D05E  db 8b f1 8b f8 9a ff ff 00 00 0b f0 89 76 f8 89 7e
8:D06E  db fa 0b fe 74 7b 66 c7 46 f4 00 00 00 00 8b 46 0c
8:D07E  db 2d 19 00 74 0d 2d 6d 00 74 30 2d 8c 00 74 3d eb
8:D08E  db 1a 90 66 ff 76 08 ff 76 06 c4 5e f8 06 53 26 c4
8:D09E  db 1f 26 ff 5f 34 89 46 f4 89 56 f6 66 83 7e f4 00
8:D0AE  db 74 3e 8b 46 f4 8b 56 f6 eb 57 ff 76 0a c4 5e f8
8:D0BE  db 06 53 26 c4 1f 26 ff 5f 20 eb 45 90 8b 46 0a 24
8:D0CE  db f0 3d 40 f1 75 d5 ff 36 96 03 68 12 01 50 66 6a
8:D0DE  db 00 9a 85 c3 00 00 3d 01 00 1b c0 f7 d8 eb 21 90
8:D0EE  db 66 83 7e fc 00 74 17 66 ff 76 fc 66 ff 76 0c 66
8:D0FE  db ff 76 08 ff 76 06 9a ff ff 00 00 eb 04 90 33 c0
8:D10E  db 99 1f 5e 5f c9 ca 0a 00 8c d0 c8 16 00 00 57 56
8:D11E  db 1e 8e d8 ff 76 0e 1e 68 f3 5b 9a 37 d1 00 00 ff
8:D12E  db 76 0e 1e 68 ec 5b 8b f0 9a d7 d1 00 00 89 46 fc
8:D13E  db 89 76 fe 8b 46 0c 3d 30 00 0f 84 a9 00 77 08 2c
8:D14E  db 02 74 4b 2c 04 74 21 8b c6 0b 46 fc 0f 84 ac 00
8:D15E  db 66 ff 76 0a 66 ff 76 06 56 c4 5e fc 53 26 c4 1f
8:D16E  db 26 ff 5f 0c e9 9c 00 90 83 7e 0a 01 74 06 83 7e
8:D17E  db 0a 02 75 0e 8b 46 0e c4 1e c8 5b 26 89 47 08 eb
8:D18E  db 7f 90 c4 1e c8 5b 26 c7 47 08 00 00 eb 72 8b c6
8:D19E  db 0b 46 fc 74 2c 66 ff 76 0a 66 ff 76 06 56 c4 5e
8:D1AE  db fc 53 26 c4 1f 8b f3 8c c7 26 ff 5f 0c 66 8b 46
8:D1BE  db fc 66 0b c0 74 0b 6a 01 ff 76 fe 50 8e c7 26 ff
8:D1CE  db 1c ff 76 0e 1e 68 fa 5b 9a 31 d0 00 00 0b c0 74
8:D1DE  db 2f 50 9a ff ff 00 00 ff 76 0e 1e 68 00 5c 9a ff
8:D1EE  db ff 00 00 eb 1b 90 83 7e 0a 00 74 10 ff 76 0e 1e
8:D1FE  db 68 06 5c 8b 46 0a 50 9a ff ff 00 00 33 c0 eb 03
8:D20E  db b8 01 00 1f 5e 5f c9 ca 0a 00

; ---------------- sub_s8:D218 FAR size=42 callers=0
8:D218  55                   push bp
8:D219  8bec                 mov bp, sp
8:D21B  66ff7606             push dword ptr [bp + 6]
8:D21F  90                   nop
8:D220  0e                   push cs
8:D221  e8b6fd               call 0xcfda  ; sub_s8:CFDA
8:D224  f6460a01             test byte ptr [bp + 0xa], 1
8:D228  7409                 je 0xd233
8:D22A  66ff7606             push dword ptr [bp + 6]
8:D22E  9ace17f3ce           lcall 0xcef3, 0x17ce  ; operator_delete@s1:17CE
loc_D233:
8:D233  8b4606               mov ax, word ptr [bp + 6]
8:D236  8b5608               mov dx, word ptr [bp + 8]
8:D239  c9                   leave
8:D23A  ca0600               retf 6
8:D23D  db 90 18 d2 ea cf

; ---------------- sub_s8:D242 FAR size=52 callers=1
8:D242  55                   push bp
8:D243  8bec                 mov bp, sp
8:D245  ff760a               push word ptr [bp + 0xa]
8:D248  666800003e01         push 0x13e0000
8:D24E  666a01               push 1
8:D251  66ff7606             push dword ptr [bp + 6]
8:D255  9a28770ecf           lcall 0xcf0e, 0x7728  ; sub_s9:7728
8:D25A  c45e06               les bx, ptr [bp + 6]
8:D25D  26c707ead6           mov word ptr es:[bx], 0xd6ea
8:D262  26c7470240d2         mov word ptr es:[bx + 2], 0xd240  ; SEGMENT s8:0000
8:D268  26c747740100         mov word ptr es:[bx + 0x74], 1
8:D26E  8bc3                 mov ax, bx
8:D270  8cc2                 mov dx, es
8:D272  c9                   leave
8:D273  ca0600               retf 6

; ---------------- sub_s8:D276 FAR size=44 callers=1
8:D276  55                   push bp
8:D277  8bec                 mov bp, sp
8:D279  c45e06               les bx, ptr [bp + 6]
8:D27C  26c707ead6           mov word ptr es:[bx], 0xd6ea
8:D281  26c7470266d2         mov word ptr es:[bx + 2], 0xd266  ; SEGMENT s8:0000
8:D287  26ff7706             push word ptr es:[bx + 6]
8:D28B  66ff367c5b           push dword ptr [0x5b7c]
8:D290  90                   nop
8:D291  0e                   push cs
8:D292  e84be4               call 0xb6e0  ; sub_s8:B6E0
8:D295  66ff7606             push dword ptr [bp + 6]
8:D299  9a2c7858d2           lcall 0xd258, 0x782c  ; sub_s9:782C
8:D29E  c9                   leave
8:D29F  ca0400               retf 4

; ---------------- sub_s8:D2A2 size=350 callers=0
;   apis: USER.EnableWindow, USER.GetDlgItem, USER.MapDialogRect, USER.SendDlgItemMessage, USER.ShowWindow
8:D2A2  c8200000             enter 0x20, 0
8:D2A6  57                   push di
8:D2A7  56                   push si
8:D2A8  66ff7606             push dword ptr [bp + 6]
8:D2AC  9ae278d2d3           lcall 0xd3d2, 0x78e2  ; sub_s9:78E2
8:D2B1  c746fe0700           mov word ptr [bp - 2], 7
8:D2B6  c746f80000           mov word ptr [bp - 8], 0
8:D2BB  eb2e                 jmp 0xd2eb
8:D2BD  db 90
loc_D2BE:
8:D2BE  33c0                 xor ax, ax
8:D2C0  99                   cdq
loc_D2C1:
8:D2C1  8946fa               mov word ptr [bp - 6], ax
8:D2C4  8956fc               mov word ptr [bp - 4], dx
8:D2C7  8b5ef8               mov bx, word ptr [bp - 8]
8:D2CA  8bc3                 mov ax, bx
8:D2CC  03db                 add bx, bx
8:D2CE  03d8                 add bx, ax
8:D2D0  c1e302               shl bx, 2
8:D2D3  83bf125c00           cmp word ptr [bx + 0x5c12], 0
8:D2D8  750e                 jne 0xd2e8
8:D2DA  c45efa               les bx, ptr [bp - 6]
8:D2DD  26ff7718             push word ptr es:[bx + 0x18]
8:D2E1  6a00                 push 0
8:D2E3  9aa0d30000           lcall 0, 0xd3a0  ; USER.EnableWindow
loc_D2E8:
8:D2E8  ff46f8               inc word ptr [bp - 8]
loc_D2EB:
8:D2EB  8b46fe               mov ax, word ptr [bp - 2]
8:D2EE  3946f8               cmp word ptr [bp - 8], ax
8:D2F1  7d79                 jge 0xd36c
8:D2F3  8b5ef8               mov bx, word ptr [bp - 8]
8:D2F6  8bc3                 mov ax, bx
8:D2F8  03db                 add bx, bx
8:D2FA  03d8                 add bx, ax
8:D2FC  c1e302               shl bx, 2
8:D2FF  8b870c5c             mov ax, word ptr [bx + 0x5c0c]
8:D303  8946ec               mov word ptr [bp - 0x14], ax
8:D306  8b870e5c             mov ax, word ptr [bx + 0x5c0e]
8:D30A  8946ee               mov word ptr [bp - 0x12], ax
8:D30D  b80100               mov ax, 1
8:D310  8946f0               mov word ptr [bp - 0x10], ax
8:D313  8946f2               mov word ptr [bp - 0xe], ax
8:D316  c47606               les si, ptr [bp + 6]
8:D319  26ff7406             push word ptr es:[si + 6]
8:D31D  8d46ec               lea ax, [bp - 0x14]
8:D320  16                   push ss
8:D321  50                   push ax
8:D322  8bfb                 mov di, bx
8:D324  9affff0000           lcall 0, 0xffff  ; USER.MapDialogRect
8:D329  6a42                 push 0x42
8:D32B  9a9c1731d2           lcall 0xd231, 0x179c  ; operator_new@s1:179C
8:D330  83c402               add sp, 2
8:D333  8946e8               mov word ptr [bp - 0x18], ax
8:D336  8956ea               mov word ptr [bp - 0x16], dx
8:D339  897ee0               mov word ptr [bp - 0x20], di
8:D33C  0bd0                 or dx, ax
8:D33E  0f847cff             je 0xd2be
8:D342  c45e06               les bx, ptr [bp + 6]
8:D345  26ff7706             push word ptr es:[bx + 6]
8:D349  8bdf                 mov bx, di
8:D34B  ffb7105c             push word ptr [bx + 0x5c10]
8:D34F  666803010201         push 0x1020103
8:D355  680401               push 0x104
8:D358  ff76ec               push word ptr [bp - 0x14]
8:D35B  ff76ee               push word ptr [bp - 0x12]
8:D35E  6a01                 push 1
8:D360  ff76ea               push word ptr [bp - 0x16]
8:D363  50                   push ax
8:D364  9ad63bf0d3           lcall 0xd3f0, 0x3bd6  ; sub_s2:3BD6
8:D369  e955ff               jmp 0xd2c1
loc_D36C:
8:D36C  666809008600         push 0x860009
8:D372  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:D377  9aba2087d3           lcall 0xd387, 0x20ba  ; sub_s3:20BA
8:D37C  8946f4               mov word ptr [bp - 0xc], ax
8:D37F  8956f6               mov word ptr [bp - 0xa], dx
8:D382  52                   push dx
8:D383  50                   push ax
8:D384  9a9a65bfd3           lcall 0xd3bf, 0x659a  ; sub_s3:659A
8:D389  0bc0                 or ax, ax
8:D38B  753b                 jne 0xd3c8
8:D38D  c45e06               les bx, ptr [bp + 6]
8:D390  26ff7706             push word ptr es:[bx + 6]
8:D394  684a01               push 0x14a
8:D397  9ae5c80000           lcall 0, 0xc8e5  ; USER.GetDlgItem
8:D39C  50                   push ax
8:D39D  6a00                 push 0
8:D39F  9af1c80000           lcall 0, 0xc8f1  ; USER.EnableWindow
8:D3A4  c45e06               les bx, ptr [bp + 6]
8:D3A7  26ff7706             push word ptr es:[bx + 6]
8:D3AB  66680c004401         push 0x144000c
8:D3B1  666831050000         push 0x531
8:D3B7  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:D3BC  9a7e8444cd           lcall 0xcd44, 0x847e  ; LoadStringRes@s3:847E
8:D3C1  52                   push dx
8:D3C2  50                   push ax
8:D3C3  9a2baa0000           lcall 0, 0xaa2b  ; USER.SendDlgItemMessage
loc_D3C8:
8:D3C8  666aff               push -1
8:D3CB  66ff7606             push dword ptr [bp + 6]
8:D3CF  9a6c829cd2           lcall 0xd29c, 0x826c  ; sub_s9:826C
8:D3D4  c45e06               les bx, ptr [bp + 6]
8:D3D7  26ff7706             push word ptr es:[bx + 6]
8:D3DB  6a05                 push 5
8:D3DD  9aaacd0000           lcall 0, 0xcdaa  ; USER.ShowWindow
8:D3E2  666801009a00         push 0x9a0001
8:D3E8  66ff36a002           push dword ptr [0x2a0]
8:D3ED  9a7c5c18d0           lcall 0xd018, 0x5c7c  ; sub_s2:5C7C
8:D3F2  c45e06               les bx, ptr [bp + 6]
8:D3F5  2689878c00           mov word ptr es:[bx + 0x8c], ax
8:D3FA  5e                   pop si
8:D3FB  5f                   pop di
8:D3FC  c9                   leave
8:D3FD  ca0400               retf 4

; ---------------- sub_s8:D400 size=708 callers=0
;   apis: USER.DestroyWindow, USER.EnableWindow, USER.GetDlgItem, USER.IsWindow, USER.PostMessage, USER.SendDlgItemMessage
8:D400  c8180000             enter 0x18, 0
8:D404  6633c0               xor eax, eax
8:D407  668946fc             mov dword ptr [bp - 4], eax
8:D40B  8946fa               mov word ptr [bp - 6], ax
8:D40E  8b460e               mov ax, word ptr [bp + 0xe]
8:D411  e93202               jmp 0xd646
loc_D414:
8:D414  c45e06               les bx, ptr [bp + 6]
8:D417  26ff7706             push word ptr es:[bx + 6]
8:D41B  684501               push 0x145
8:D41E  9a5dd40000           lcall 0, 0xd45d  ; USER.GetDlgItem
8:D423  50                   push ax
8:D424  6a01                 push 1
8:D426  9a65d40000           lcall 0, 0xd465  ; USER.EnableWindow
8:D42B  c45e06               les bx, ptr [bp + 6]
8:D42E  26ff7706             push word ptr es:[bx + 6]
8:D432  66680c004001         push 0x140000c
8:D438  666849060000         push 0x649
8:D43E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:D443  9a7e84d5d4           lcall 0xd4d5, 0x847e  ; LoadStringRes@s3:847E
8:D448  52                   push dx
8:D449  50                   push ax
8:D44A  9a1bd50000           lcall 0, 0xd51b  ; USER.SendDlgItemMessage
8:D44F  e91202               jmp 0xd664
loc_D452:
8:D452  c45e06               les bx, ptr [bp + 6]
8:D455  26ff7706             push word ptr es:[bx + 6]
8:D459  684701               push 0x147
8:D45C  9a77d40000           lcall 0, 0xd477  ; USER.GetDlgItem
8:D461  50                   push ax
8:D462  6a01                 push 1
8:D464  9a7fd40000           lcall 0, 0xd47f  ; USER.EnableWindow
8:D469  e9f801               jmp 0xd664
loc_D46C:
8:D46C  c45e06               les bx, ptr [bp + 6]
8:D46F  26ff7706             push word ptr es:[bx + 6]
8:D473  684601               push 0x146
8:D476  9aefd40000           lcall 0, 0xd4ef  ; USER.GetDlgItem
8:D47B  50                   push ax
8:D47C  6a01                 push 1
8:D47E  9af7d40000           lcall 0, 0xd4f7  ; USER.EnableWindow
8:D483  c746fe3f01           mov word ptr [bp - 2], 0x13f
8:D488  c746fc4706           mov word ptr [bp - 4], 0x647
8:D48D  68f101               push 0x1f1
loc_D490:
8:D490  66ff36a002           push dword ptr [0x2a0]
8:D495  9a5c5cb6d4           lcall 0xd4b6, 0x5c5c  ; sub_s2:5C5C
8:D49A  e9c701               jmp 0xd664
8:D49D  db 90
loc_D49E:
8:D49E  c746fe4001           mov word ptr [bp - 2], 0x140
8:D4A3  c746fc4806           mov word ptr [bp - 4], 0x648
8:D4A8  66680100c400         push 0xc40001
8:D4AE  8d46f6               lea ax, [bp - 0xa]
8:D4B1  16                   push ss
8:D4B2  50                   push ax
8:D4B3  9a1a94c5d4           lcall 0xd4c5, 0x941a  ; sub_s2:941A
8:D4B8  8d46f6               lea ax, [bp - 0xa]
8:D4BB  16                   push ss
8:D4BC  50                   push ax
8:D4BD  66ff36a002           push dword ptr [0x2a0]
8:D4C2  9a9e5c67d3           lcall 0xd367, 0x5c9e  ; sub_s2:5C9E
8:D4C7  666809008600         push 0x860009
8:D4CD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:D4D2  9aba20e2d4           lcall 0xd4e2, 0x20ba  ; sub_s3:20BA
8:D4D7  8946f2               mov word ptr [bp - 0xe], ax
8:D4DA  8956f4               mov word ptr [bp - 0xc], dx
8:D4DD  52                   push dx
8:D4DE  50                   push ax
8:D4DF  9a046616d5           lcall 0xd516, 0x6604  ; sub_s3:6604
8:D4E4  c45e06               les bx, ptr [bp + 6]
8:D4E7  26ff7706             push word ptr es:[bx + 6]
8:D4EB  684501               push 0x145
8:D4EE  9a2ad50000           lcall 0, 0xd52a  ; USER.GetDlgItem
8:D4F3  50                   push ax
8:D4F4  6a00                 push 0
8:D4F6  9a32d50000           lcall 0, 0xd532  ; USER.EnableWindow
8:D4FB  c45e06               les bx, ptr [bp + 6]
8:D4FE  26ff7706             push word ptr es:[bx + 6]
8:D502  66680c003f01         push 0x13f000c
8:D508  666849060000         push 0x649
8:D50E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:D513  9a7e8440d5           lcall 0xd540, 0x847e  ; LoadStringRes@s3:847E
8:D518  52                   push dx
8:D519  50                   push ax
8:D51A  9a7dd50000           lcall 0, 0xd57d  ; USER.SendDlgItemMessage
8:D51F  c45e06               les bx, ptr [bp + 6]
8:D522  26ff7706             push word ptr es:[bx + 6]
8:D526  684601               push 0x146
8:D529  9a51d50000           lcall 0, 0xd551  ; USER.GetDlgItem
8:D52E  50                   push ax
8:D52F  6a00                 push 0
8:D531  9a59d50000           lcall 0, 0xd559  ; USER.EnableWindow
8:D536  688600               push 0x86
8:D539  66ff76f2             push dword ptr [bp - 0xe]
8:D53D  9a9a6578d5           lcall 0xd578, 0x659a  ; sub_s3:659A
8:D542  0bc0                 or ax, ax
8:D544  753b                 jne 0xd581
8:D546  c45e06               les bx, ptr [bp + 6]
8:D549  26ff7706             push word ptr es:[bx + 6]
8:D54D  684a01               push 0x14a
8:D550  9ac3d50000           lcall 0, 0xd5c3  ; USER.GetDlgItem
8:D555  50                   push ax
8:D556  6a00                 push 0
8:D558  9acbd50000           lcall 0, 0xd5cb  ; USER.EnableWindow
8:D55D  c45e06               les bx, ptr [bp + 6]
8:D560  26ff7706             push word ptr es:[bx + 6]
8:D564  66680c004401         push 0x144000c
8:D56A  666831050000         push 0x531
8:D570  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:D575  9a7e848bd5           lcall 0xd58b, 0x847e  ; LoadStringRes@s3:847E
8:D57A  52                   push dx
8:D57B  50                   push ax
8:D57C  9aa0d60000           lcall 0, 0xd6a0  ; USER.SendDlgItemMessage
loc_D581:
8:D581  6a02                 push 2
8:D583  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:D588  9aba209bd6           lcall 0xd69b, 0x20ba  ; sub_s3:20BA
8:D58D  8946ee               mov word ptr [bp - 0x12], ax
8:D590  8956f0               mov word ptr [bp - 0x10], dx
8:D593  c45eee               les bx, ptr [bp - 0x12]
8:D596  268b4720             mov ax, word ptr es:[bx + 0x20]
8:D59A  8946ec               mov word ptr [bp - 0x14], ax
8:D59D  0bc0                 or ax, ax
8:D59F  0f84c100             je 0xd664
8:D5A3  ff369603             push word ptr [0x396]
8:D5A7  6668af001101         push 0x11100af
8:D5AD  666a00               push 0
8:D5B0  9a20d60000           lcall 0, 0xd620  ; USER.PostMessage
8:D5B5  e9ac00               jmp 0xd664
loc_D5B8:
8:D5B8  c45e06               les bx, ptr [bp + 6]
8:D5BB  26ff7706             push word ptr es:[bx + 6]
8:D5BF  684801               push 0x148
8:D5C2  9aebd50000           lcall 0, 0xd5eb  ; USER.GetDlgItem
8:D5C7  50                   push ax
8:D5C8  6a01                 push 1
8:D5CA  9af3d50000           lcall 0, 0xd5f3  ; USER.EnableWindow
8:D5CF  c746fe4101           mov word ptr [bp - 2], 0x141
8:D5D4  c746fc4706           mov word ptr [bp - 4], 0x647
8:D5D9  68f501               push 0x1f5
8:D5DC  e9b1fe               jmp 0xd490
8:D5DF  db 90
loc_D5E0:
8:D5E0  c45e06               les bx, ptr [bp + 6]
8:D5E3  26ff7706             push word ptr es:[bx + 6]
8:D5E7  684901               push 0x149
8:D5EA  9a98d30000           lcall 0, 0xd398  ; USER.GetDlgItem
8:D5EF  50                   push ax
8:D5F0  6a01                 push 1
8:D5F2  9ae4d20000           lcall 0, 0xd2e4  ; USER.EnableWindow
8:D5F7  c746fe4201           mov word ptr [bp - 2], 0x142
8:D5FC  c746fc4706           mov word ptr [bp - 4], 0x647
8:D601  68f201               push 0x1f2
8:D604  e989fe               jmp 0xd490
8:D607  db 90
loc_D608:
8:D608  c746fe4301           mov word ptr [bp - 2], 0x143
8:D60D  c746fc4806           mov word ptr [bp - 4], 0x648
8:D612  ff369603             push word ptr [0x396]
8:D616  6668b8001101         push 0x11100b8
8:D61C  666a00               push 0
8:D61F  9ab8d60000           lcall 0, 0xd6b8  ; USER.PostMessage
8:D624  c45e06               les bx, ptr [bp + 6]
8:D627  26ff7706             push word ptr es:[bx + 6]
8:D62B  9acecd0000           lcall 0, 0xcdce  ; USER.DestroyWindow
8:D630  eb32                 jmp 0xd664
loc_D632:
8:D632  66ff760c             push dword ptr [bp + 0xc]
8:D636  66ff7608             push dword ptr [bp + 8]
8:D63A  ff7606               push word ptr [bp + 6]
8:D63D  9a3c7bafd2           lcall 0xd2af, 0x7b3c  ; sub_s9:7B3C
8:D642  c9                   leave
8:D643  ca0a00               retf 0xa
loc_D646:
8:D646  2d4501               sub ax, 0x145
8:D649  3d0600               cmp ax, 6
8:D64C  77e4                 ja 0xd632
8:D64E  03c0                 add ax, ax
8:D650  93                   xchg bx, ax
8:D651  2effa756d6           jmp word ptr cs:[bx - 0x29aa]
switch_table_D656:
    dw loc_D46C
    dw loc_D49E
    dw loc_D5B8
    dw loc_D5E0
    dw loc_D608
    dw loc_D414
    dw loc_D452
loc_D664:
8:D664  837efe00             cmp word ptr [bp - 2], 0
8:D668  743a                 je 0xd6a4
8:D66A  837efc00             cmp word ptr [bp - 4], 0
8:D66E  7434                 je 0xd6a4
8:D670  c45e06               les bx, ptr [bp + 6]
8:D673  26ff7706             push word ptr es:[bx + 6]
8:D677  9affff0000           lcall 0, 0xffff  ; USER.IsWindow
8:D67C  0bc0                 or ax, ax
8:D67E  7424                 je 0xd6a4
8:D680  c45e06               les bx, ptr [bp + 6]
8:D683  26ff7706             push word ptr es:[bx + 6]
8:D687  ff76fe               push word ptr [bp - 2]
8:D68A  666800000c00         push 0xc0000
8:D690  ff76fc               push word ptr [bp - 4]
8:D693  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:D698  9a7e847ad3           lcall 0xd37a, 0x847e  ; LoadStringRes@s3:847E
8:D69D  52                   push dx
8:D69E  50                   push ax
8:D69F  9ac4d30000           lcall 0, 0xd3c4  ; USER.SendDlgItemMessage
loc_D6A4:
8:D6A4  837efa00             cmp word ptr [bp - 6], 0
8:D6A8  7412                 je 0xd6bc
8:D6AA  ff369603             push word ptr [0x396]
8:D6AE  681101               push 0x111
8:D6B1  ff76fa               push word ptr [bp - 6]
8:D6B4  666a00               push 0
8:D6B7  9ad7c60000           lcall 0, 0xc6d7  ; USER.PostMessage
loc_D6BC:
8:D6BC  33c0                 xor ax, ax
8:D6BE  99                   cdq
8:D6BF  c9                   leave
8:D6C0  ca0a00               retf 0xa
8:D6C3  db 00

; ---------------- sub_s8:D6C4 FAR size=146 callers=0
8:D6C4  55                   push bp
8:D6C5  8bec                 mov bp, sp
8:D6C7  66ff7606             push dword ptr [bp + 6]
8:D6CB  90                   nop
8:D6CC  0e                   push cs
8:D6CD  e8a6fb               call 0xd276  ; sub_s8:D276
8:D6D0  f6460a01             test byte ptr [bp + 0xa], 1
8:D6D4  7409                 je 0xd6df
8:D6D6  66ff7606             push dword ptr [bp + 6]
8:D6DA  9ace172ed3           lcall 0xd32e, 0x17ce  ; operator_delete@s1:17CE
loc_D6DF:
8:D6DF  8b4606               mov ax, word ptr [bp + 6]
8:D6E2  8b5608               mov dx, word ptr [bp + 8]
8:D6E5  c9                   leave
8:D6E6  ca0600               retf 6
8:D6E9  db 90 c4 d6 f4 d6 10 3a 98 d4 a2 d2 fc d6 c0 79 00
8:D6F9  db d7 00 d4 4c d7 98 7b 04 d7 56 7f 08 d7 b2 7b 0c
8:D709  db d7 1c 7f 10 d7 12 82 14 d7 86 7f 18 d7 0c 80 1c
8:D719  db d7 54 80 20 d7 5e 7e 24 d7 58 81 28 d7 b6 81 2c
8:D729  db d7 fe 81 34 d7 ea 60 40 d7 4a 82 38 d7 66 82 3c
8:D739  db d7 de 78 54 d7 ee 60 44 d7 f4 60 48 d7 fa 60 50
8:D749  db d7 a4 a2 85 d2 fe 60 46 cf 7e 80 40 d6

; ---------------- sub_s8:D756 FAR size=122 callers=1
8:D756  55                   push bp
8:D757  8bec                 mov bp, sp
8:D759  ff760a               push word ptr [bp + 0xa]
8:D75C  666800001b01         push 0x11b0000
8:D762  666a01               push 1
8:D765  66ff7606             push dword ptr [bp + 6]
8:D769  9a2877f8d6           lcall 0xd6f8, 0x7728  ; sub_s9:7728
8:D76E  33c0                 xor ax, ax
8:D770  c45e06               les bx, ptr [bp + 6]
8:D773  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:D778  2689879000           mov word ptr es:[bx + 0x90], ax
8:D77D  662bc9               sub ecx, ecx
8:D780  6626898f9200         mov dword ptr es:[bx + 0x92], ecx
8:D786  6626898f9600         mov dword ptr es:[bx + 0x96], ecx
8:D78C  26c707d4e0           mov word ptr es:[bx], 0xe0d4
8:D791  26c74702ecd6         mov word ptr es:[bx + 2], 0xd6ec  ; SEGMENT s8:0000
8:D797  6a2b                 push 0x2b
8:D799  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:D79E  9aba2046d4           lcall 0xd446, 0x20ba  ; sub_s3:20BA
8:D7A3  c45e06               les bx, ptr [bp + 6]
8:D7A6  2689879200           mov word ptr es:[bx + 0x92], ax
8:D7AB  2689979400           mov word ptr es:[bx + 0x94], dx
8:D7B0  06                   push es
8:D7B1  53                   push bx
8:D7B2  6a00                 push 0
8:D7B4  52                   push dx
8:D7B5  26ffb79200           push word ptr es:[bx + 0x92]
8:D7BA  26c49f9200           les bx, ptr es:[bx + 0x92]
8:D7BF  26c41f               les bx, ptr es:[bx]
8:D7C2  26ff5f04             lcall es:[bx + 4]
8:D7C6  8b4606               mov ax, word ptr [bp + 6]
8:D7C9  8b5608               mov dx, word ptr [bp + 8]
8:D7CC  c9                   leave
8:D7CD  ca0600               retf 6

; ---------------- sub_s8:D7D0 FAR size=112 callers=1
8:D7D0  c8080000             enter 8, 0
8:D7D4  c45e06               les bx, ptr [bp + 6]
8:D7D7  26c707d4e0           mov word ptr es:[bx], 0xe0d4
8:D7DC  26c7470295d7         mov word ptr es:[bx + 2], 0xd795  ; SEGMENT s8:0000
8:D7E2  2683bf900000         cmp word ptr es:[bx + 0x90], 0
8:D7E8  740c                 je 0xd7f6
8:D7EA  06                   push es
8:D7EB  53                   push bx
8:D7EC  66ff36a002           push dword ptr [0x2a0]
8:D7F1  9aa61e0dd8           lcall 0xd80d, 0x1ea6  ; sub_s3:1EA6
loc_D7F6:
8:D7F6  c45e06               les bx, ptr [bp + 6]
8:D7F9  662683bf920000       cmp dword ptr es:[bx + 0x92], 0
8:D800  740d                 je 0xd80f
8:D802  06                   push es
8:D803  53                   push bx
8:D804  6626ffb79200         push dword ptr es:[bx + 0x92]
8:D80A  9aa61ea1d7           lcall 0xd7a1, 0x1ea6  ; sub_s3:1EA6
loc_D80F:
8:D80F  c45e06               les bx, ptr [bp + 6]
8:D812  26ff7706             push word ptr es:[bx + 6]
8:D816  66ff367c5b           push dword ptr [0x5b7c]
8:D81B  90                   nop
8:D81C  0e                   push cs
8:D81D  e8c0de               call 0xb6e0  ; sub_s8:B6E0
8:D820  c45e06               les bx, ptr [bp + 6]
8:D823  66268b879600         mov eax, dword ptr es:[bx + 0x96]
8:D829  6650                 push eax
8:D82B  9ace17ddd6           lcall 0xd6dd, 0x17ce  ; operator_delete@s1:17CE
8:D830  83c404               add sp, 4
8:D833  66ff7606             push dword ptr [bp + 6]
8:D837  9a2c786cd7           lcall 0xd76c, 0x782c  ; sub_s9:782C
8:D83C  c9                   leave
8:D83D  ca0400               retf 4

; ---------------- sub_s8:D840 FAR size=110 callers=0
;   apis: USER.PostMessage
8:D840  55                   push bp
8:D841  8bec                 mov bp, sp
8:D843  8b460a               mov ax, word ptr [bp + 0xa]
8:D846  eb52                 jmp 0xd89a
loc_D848:
8:D848  c45e06               les bx, ptr [bp + 6]
8:D84B  662bc0               sub eax, eax
8:D84E  2689879000           mov word ptr es:[bx + 0x90], ax
8:D853  662689879200         mov dword ptr es:[bx + 0x92], eax
8:D859  c9                   leave
8:D85A  ca0600               retf 6
8:D85D  db 90
loc_D85E:
8:D85E  66ff7606             push dword ptr [bp + 6]
8:D862  90                   nop
8:D863  0e                   push cs
8:D864  e8d707               call 0xe03e  ; sub_s8:E03E
8:D867  c9                   leave
8:D868  ca0600               retf 6
8:D86B  db 90
loc_D86C:
8:D86C  c45e06               les bx, ptr [bp + 6]
8:D86F  2683bf8e0000         cmp word ptr es:[bx + 0x8e], 0
8:D875  7432                 je 0xd8a9
8:D877  26ff7706             push word ptr es:[bx + 6]
8:D87B  681101               push 0x111
8:D87E  26ffb78e00           push word ptr es:[bx + 0x8e]
8:D883  666a00               push 0
8:D886  9ab1d50000           lcall 0, 0xd5b1  ; USER.PostMessage
8:D88B  c45e06               les bx, ptr [bp + 6]
8:D88E  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
8:D895  c9                   leave
8:D896  ca0600               retf 6
8:D899  db 90
loc_D89A:
8:D89A  3d1000               cmp ax, 0x10
8:D89D  74cd                 je 0xd86c
8:D89F  7708                 ja 0xd8a9
8:D8A1  fec8                 dec al
8:D8A3  74a3                 je 0xd848
8:D8A5  2c02                 sub al, 2
8:D8A7  74b5                 je 0xd85e
loc_D8A9:
8:D8A9  c9                   leave
8:D8AA  ca0600               retf 6
8:D8AD  db 00

; ---------------- sub_s8:D8AE FAR size=442 callers=0
;   apis: USER.LoadCursor, USER.MapDialogRect, USER.SetCursor, USER.SetWindowText, USER.ShowWindow
8:D8AE  c8300000             enter 0x30, 0
8:D8B2  56                   push si
8:D8B3  666a00               push 0
8:D8B6  68027f               push 0x7f02
8:D8B9  9a3bbc0000           lcall 0, 0xbc3b  ; USER.LoadCursor
8:D8BE  8946fe               mov word ptr [bp - 2], ax
8:D8C1  50                   push ax
8:D8C2  9a5eda0000           lcall 0, 0xda5e  ; USER.SetCursor
8:D8C7  8946fc               mov word ptr [bp - 4], ax
8:D8CA  66ff7606             push dword ptr [bp + 6]
8:D8CE  9ae2787ed9           lcall 0xd97e, 0x78e2  ; sub_s9:78E2
8:D8D3  c45e06               les bx, ptr [bp + 6]
8:D8D6  6626ffb79200         push dword ptr es:[bx + 0x92]
8:D8DC  9a86089cd9           lcall 0xd99c, 0x886  ; sub_s3:0886
8:D8E1  8946fa               mov word ptr [bp - 6], ax
8:D8E4  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
8:D8EA  740a                 je 0xd8f6
8:D8EC  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
8:D8EF  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
8:D8F3  eb06                 jmp 0xd8fb
8:D8F5  db 90
loc_D8F6:
8:D8F6  9a0a1614d9           lcall 0xd914, 0x160a  ; SH_DefaultPool@s1:160A
loc_D8FB:
8:D8FB  8946e4               mov word ptr [bp - 0x1c], ax
8:D8FE  8956e6               mov word ptr [bp - 0x1a], dx
8:D901  52                   push dx
8:D902  50                   push ax
8:D903  6a01                 push 1
8:D905  8b46fa               mov ax, word ptr [bp - 6]
8:D908  050200               add ax, 2
8:D90B  c1e002               shl ax, 2
8:D90E  6a00                 push 0
8:D910  50                   push ax
8:D911  9a0817d4d9           lcall 0xd9d4, 0x1708  ; SH_MemAllocPtr@s1:1708
8:D916  83c40a               add sp, 0xa
8:D919  c45e06               les bx, ptr [bp + 6]
8:D91C  2689879600           mov word ptr es:[bx + 0x96], ax
8:D921  2689979800           mov word ptr es:[bx + 0x98], dx
8:D926  c746f80100           mov word ptr [bp - 8], 1
8:D92B  eb56                 jmp 0xd983
8:D92D  db 90
loc_D92E:
8:D92E  c45e06               les bx, ptr [bp + 6]
8:D931  26c49f9600           les bx, ptr es:[bx + 0x96]
8:D936  8b76f8               mov si, word ptr [bp - 8]
8:D939  c1e602               shl si, 2
8:D93C  6626c70000000000     mov dword ptr es:[bx + si], 0
loc_D944:
8:D944  c45e06               les bx, ptr [bp + 6]
8:D947  26c49f9600           les bx, ptr es:[bx + 0x96]
8:D94C  8b76f8               mov si, word ptr [bp - 8]
8:D94F  c1e602               shl si, 2
8:D952  6626833800           cmp dword ptr es:[bx + si], 0
8:D957  7427                 je 0xd980
8:D959  26c418               les bx, ptr es:[bx + si]
8:D95C  26c7473e0100         mov word ptr es:[bx + 0x3e], 1
8:D962  c45ee4               les bx, ptr [bp - 0x1c]
8:D965  26ff7706             push word ptr es:[bx + 6]
8:D969  c45e06               les bx, ptr [bp + 6]
8:D96C  26c49f9600           les bx, ptr es:[bx + 0x96]
8:D971  8b76f8               mov si, word ptr [bp - 8]
8:D974  c1e602               shl si, 2
8:D977  6626ff30             push dword ptr es:[bx + si]
8:D97B  9a34923ad8           lcall 0xd83a, 0x9234  ; sub_s9:9234
loc_D980:
8:D980  ff46f8               inc word ptr [bp - 8]
loc_D983:
8:D983  8b46fa               mov ax, word ptr [bp - 6]
8:D986  3946f8               cmp word ptr [bp - 8], ax
8:D989  0f8f9900             jg 0xda26
8:D98D  ff76f8               push word ptr [bp - 8]
8:D990  c45e06               les bx, ptr [bp + 6]
8:D993  6626ffb79200         push dword ptr es:[bx + 0x92]
8:D999  9ae20830da           lcall 0xda30, 0x8e2  ; sub_s3:08E2
8:D99E  8946e4               mov word ptr [bp - 0x1c], ax
8:D9A1  8956e6               mov word ptr [bp - 0x1a], dx
8:D9A4  8bd8                 mov bx, ax
8:D9A6  8ec2                 mov es, dx
8:D9A8  268b07               mov ax, word ptr es:[bx]
8:D9AB  8946dc               mov word ptr [bp - 0x24], ax
8:D9AE  268b4702             mov ax, word ptr es:[bx + 2]
8:D9B2  8946de               mov word ptr [bp - 0x22], ax
8:D9B5  b80100               mov ax, 1
8:D9B8  8946e0               mov word ptr [bp - 0x20], ax
8:D9BB  8946e2               mov word ptr [bp - 0x1e], ax
8:D9BE  c45e06               les bx, ptr [bp + 6]
8:D9C1  26ff7706             push word ptr es:[bx + 6]
8:D9C5  8d46dc               lea ax, [bp - 0x24]
8:D9C8  16                   push ss
8:D9C9  50                   push ax
8:D9CA  9a25d30000           lcall 0, 0xd325  ; USER.MapDialogRect
8:D9CF  6a42                 push 0x42
8:D9D1  9a9c172ed8           lcall 0xd82e, 0x179c  ; operator_new@s1:179C
8:D9D6  83c402               add sp, 2
8:D9D9  8946d8               mov word ptr [bp - 0x28], ax
8:D9DC  8956da               mov word ptr [bp - 0x26], dx
8:D9DF  0bd0                 or dx, ax
8:D9E1  0f8449ff             je 0xd92e
8:D9E5  c45e06               les bx, ptr [bp + 6]
8:D9E8  26ff7706             push word ptr es:[bx + 6]
8:D9EC  c45ee4               les bx, ptr [bp - 0x1c]
8:D9EF  26ff7704             push word ptr es:[bx + 4]
8:D9F3  66680001ff00         push 0xff0100
8:D9F9  680101               push 0x101
8:D9FC  ff76dc               push word ptr [bp - 0x24]
8:D9FF  ff76de               push word ptr [bp - 0x22]
8:DA02  6a00                 push 0
8:DA04  ff76da               push word ptr [bp - 0x26]
8:DA07  50                   push ax
8:DA08  9ad63bf0d6           lcall 0xd6f0, 0x3bd6  ; sub_s2:3BD6
8:DA0D  c45e06               les bx, ptr [bp + 6]
8:DA10  26c49f9600           les bx, ptr es:[bx + 0x96]
8:DA15  8b76f8               mov si, word ptr [bp - 8]
8:DA18  c1e602               shl si, 2
8:DA1B  268900               mov word ptr es:[bx + si], ax
8:DA1E  26895002             mov word ptr es:[bx + si + 2], dx
8:DA22  e91fff               jmp 0xd944
8:DA25  db 90
loc_DA26:
8:DA26  6a02                 push 2
8:DA28  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:DA2D  9aba20f4d7           lcall 0xd7f4, 0x20ba  ; sub_s3:20BA
8:DA32  8946f4               mov word ptr [bp - 0xc], ax
8:DA35  8956f6               mov word ptr [bp - 0xa], dx
8:DA38  c45e06               les bx, ptr [bp + 6]
8:DA3B  26ff7706             push word ptr es:[bx + 6]
8:DA3F  c45ef4               les bx, ptr [bp - 0xc]
8:DA42  6626ff7768           push dword ptr es:[bx + 0x68]
8:DA47  9aedc50000           lcall 0, 0xc5ed  ; USER.SetWindowText
8:DA4C  c45e06               les bx, ptr [bp + 6]
8:DA4F  26ff7706             push word ptr es:[bx + 6]
8:DA53  6a05                 push 5
8:DA55  9aded30000           lcall 0, 0xd3de  ; USER.ShowWindow
8:DA5A  ff76fc               push word ptr [bp - 4]
8:DA5D  9a44bc0000           lcall 0, 0xbc44  ; USER.SetCursor
8:DA62  5e                   pop si
8:DA63  c9                   leave
8:DA64  ca0400               retf 4
8:DA67  db 00

; ---------------- sub_s8:DA68 FAR size=584 callers=0
;   apis: USER.WinHelp
8:DA68  c8140000             enter 0x14, 0
8:DA6C  817e0a0402           cmp word ptr [bp + 0xa], 0x204
8:DA71  7515                 jne 0xda88
8:DA73  66ff760c             push dword ptr [bp + 0xc]
8:DA77  66ff7608             push dword ptr [bp + 8]
8:DA7B  ff7606               push word ptr [bp + 6]
8:DA7E  90                   nop
8:DA7F  0e                   push cs
8:DA80  e89d03               call 0xde20  ; sub_s8:DE20
8:DA83  c9                   leave
8:DA84  ca0a00               retf 0xa
8:DA87  db 90
loc_DA88:
8:DA88  6633c0               xor eax, eax
8:DA8B  668946fc             mov dword ptr [bp - 4], eax
8:DA8F  8946fa               mov word ptr [bp - 6], ax
8:DA92  8b460e               mov ax, word ptr [bp + 0xe]
8:DA95  3d2101               cmp ax, 0x121
8:DA98  0f849800             je 0xdb34
8:DA9C  0f876601             ja 0xdc06
8:DAA0  2d0001               sub ax, 0x100
8:DAA3  0f843101             je 0xdbd8
8:DAA7  2d1c00               sub ax, 0x1c
8:DAAA  740e                 je 0xdaba
8:DAAC  48                   dec ax
8:DAAD  745f                 je 0xdb0e
8:DAAF  48                   dec ax
8:DAB0  7468                 je 0xdb1a
8:DAB2  48                   dec ax
8:DAB3  48                   dec ax
8:DAB4  747a                 je 0xdb30
8:DAB6  e96701               jmp 0xdc20
8:DAB9  db 90
loc_DABA:
8:DABA  66ff7606             push dword ptr [bp + 6]
8:DABE  90                   nop
8:DABF  0e                   push cs
8:DAC0  e8c304               call 0xdf86  ; sub_s8:DF86
loc_DAC3:
8:DAC3  837efe00             cmp word ptr [bp - 2], 0
8:DAC7  0f84dd01             je 0xdca8
8:DACB  837efc00             cmp word ptr [bp - 4], 0
8:DACF  0f849301             je 0xdc66
8:DAD3  68b400               push 0xb4
8:DAD6  9a9c176cdc           lcall 0xdc6c, 0x179c  ; operator_new@s1:179C
8:DADB  83c402               add sp, 2
8:DADE  8946f0               mov word ptr [bp - 0x10], ax
8:DAE1  8956f2               mov word ptr [bp - 0xe], dx
8:DAE4  0bd0                 or dx, ax
8:DAE6  0f844a01             je 0xdc34
8:DAEA  ff76fc               push word ptr [bp - 4]
8:DAED  ff76fe               push word ptr [bp - 2]
8:DAF0  666803003406         push 0x6340003
8:DAF6  6a00                 push 0
8:DAF8  c45e06               les bx, ptr [bp + 6]
8:DAFB  26ff7706             push word ptr es:[bx + 6]
8:DAFF  ff76f2               push word ptr [bp - 0xe]
8:DB02  50                   push ax
8:DB03  9a20852edc           lcall 0xdc2e, 0x8520  ; sub_s9:8520
8:DB08  83c410               add sp, 0x10
8:DB0B  e92901               jmp 0xdc37
loc_DB0E:
8:DB0E  66ff7606             push dword ptr [bp + 6]
8:DB12  90                   nop
8:DB13  0e                   push cs
8:DB14  e84504               call 0xdf5c  ; sub_s8:DF5C
8:DB17  ebaa                 jmp 0xdac3
8:DB19  db 90
loc_DB1A:
8:DB1A  6a1d                 push 0x1d
loc_DB1C:
8:DB1C  c45e06               les bx, ptr [bp + 6]
8:DB1F  26ff7708             push word ptr es:[bx + 8]
8:DB23  66ff367c5b           push dword ptr [0x5b7c]
8:DB28  90                   nop
8:DB29  0e                   push cs
8:DB2A  e813d4               call 0xaf40  ; sub_s8:AF40
8:DB2D  eb94                 jmp 0xdac3
8:DB2F  db 90
loc_DB30:
8:DB30  6a1c                 push 0x1c
8:DB32  ebe8                 jmp 0xdb1c
loc_DB34:
8:DB34  c746f80100           mov word ptr [bp - 8], 1
8:DB39  c746feec06           mov word ptr [bp - 2], 0x6ec
8:DB3E  c746fa1500           mov word ptr [bp - 6], 0x15
8:DB43  e97dff               jmp 0xdac3
loc_DB46:
8:DB46  6a14                 push 0x14
8:DB48  ebd2                 jmp 0xdb1c
loc_DB4A:
8:DB4A  6a28                 push 0x28
8:DB4C  ebce                 jmp 0xdb1c
loc_DB4E:
8:DB4E  66ff7606             push dword ptr [bp + 6]
8:DB52  6a10                 push 0x10
8:DB54  c41ea002             les bx, ptr [0x2a0]
8:DB58  06                   push es
8:DB59  53                   push bx
8:DB5A  26c41f               les bx, ptr es:[bx]
8:DB5D  26ff5f04             lcall es:[bx + 4]
8:DB61  c45e06               les bx, ptr [bp + 6]
8:DB64  26c78790000100       mov word ptr es:[bx + 0x90], 1
8:DB6B  68db01               push 0x1db
8:DB6E  66ff36a002           push dword ptr [0x2a0]
8:DB73  9a5c5c9edb           lcall 0xdb9e, 0x5c5c  ; sub_s2:5C5C
8:DB78  c45e06               les bx, ptr [bp + 6]
8:DB7B  26c7878e000001       mov word ptr es:[bx + 0x8e], 0x100
8:DB82  e93eff               jmp 0xdac3
8:DB85  db 90
loc_DB86:
8:DB86  c45e06               les bx, ptr [bp + 6]
8:DB89  26c7878e000000       mov word ptr es:[bx + 0x8e], 0
8:DB90  66680100cb00         push 0xcb0001
8:DB96  66ff36a002           push dword ptr [0x2a0]
8:DB9B  9a7c5c50dc           lcall 0xdc50, 0x5c7c  ; sub_s2:5C7C
8:DBA0  68f801               push 0x1f8
8:DBA3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:DBA8  9a0a83eddb           lcall 0xdbed, 0x830a  ; sub_s3:830A
8:DBAD  8946f4               mov word ptr [bp - 0xc], ax
8:DBB0  8956f6               mov word ptr [bp - 0xa], dx
8:DBB3  c45e06               les bx, ptr [bp + 6]
8:DBB6  26ff7706             push word ptr es:[bx + 6]
8:DBBA  52                   push dx
8:DBBB  50                   push ax
8:DBBC  666800000300         push 0x30000
8:DBC2  6a00                 push 0
8:DBC4  9affff0000           lcall 0, 0xffff  ; USER.WinHelp
8:DBC9  e9f7fe               jmp 0xdac3
loc_DBCC:
8:DBCC  66ff7606             push dword ptr [bp + 6]
8:DBD0  90                   nop
8:DBD1  0e                   push cs
8:DBD2  e8db00               call 0xdcb0  ; sub_s8:DCB0
8:DBD5  e9ebfe               jmp 0xdac3
loc_DBD8:
8:DBD8  c45e06               les bx, ptr [bp + 6]
8:DBDB  2683bf8e0000         cmp word ptr es:[bx + 0x8e], 0
8:DBE1  7516                 jne 0xdbf9
8:DBE3  06                   push es
8:DBE4  53                   push bx
8:DBE5  66ff36a002           push dword ptr [0x2a0]
8:DBEA  9aa61edfd8           lcall 0xd8df, 0x1ea6  ; sub_s3:1EA6
8:DBEF  c45e06               les bx, ptr [bp + 6]
8:DBF2  26c78790000000       mov word ptr es:[bx + 0x90], 0
loc_DBF9:
8:DBF9  c746fe2c07           mov word ptr [bp - 2], 0x72c
8:DBFE  c746fa4800           mov word ptr [bp - 6], 0x48
8:DC03  e9bdfe               jmp 0xdac3
loc_DC06:
8:DC06  2d2201               sub ax, 0x122
8:DC09  0f8439ff             je 0xdb46
8:DC0D  48                   dec ax
8:DC0E  0f8438ff             je 0xdb4a
8:DC12  48                   dec ax
8:DC13  48                   dec ax
8:DC14  0f8436ff             je 0xdb4e
8:DC18  48                   dec ax
8:DC19  0f8469ff             je 0xdb86
8:DC1D  48                   dec ax
8:DC1E  74ac                 je 0xdbcc
loc_DC20:
8:DC20  66ff760c             push dword ptr [bp + 0xc]
8:DC24  66ff7608             push dword ptr [bp + 8]
8:DC28  ff7606               push word ptr [bp + 6]
8:DC2B  9a3c7b94dc           lcall 0xdc94, 0x7b3c  ; sub_s9:7B3C
8:DC30  c9                   leave
8:DC31  ca0a00               retf 0xa
loc_DC34:
8:DC34  33c0                 xor ax, ax
8:DC36  99                   cdq
loc_DC37:
8:DC37  8946f4               mov word ptr [bp - 0xc], ax
8:DC3A  8956f6               mov word ptr [bp - 0xa], dx
8:DC3D  837efa00             cmp word ptr [bp - 6], 0
8:DC41  7459                 je 0xdc9c
8:DC43  ff76fa               push word ptr [bp - 6]
8:DC46  6a01                 push 1
8:DC48  8d46ec               lea ax, [bp - 0x14]
8:DC4B  16                   push ss
8:DC4C  50                   push ax
8:DC4D  9a1a940bda           lcall 0xda0b, 0x941a  ; sub_s2:941A
8:DC52  8d46ec               lea ax, [bp - 0x14]
8:DC55  16                   push ss
8:DC56  50                   push ax
8:DC57  c45ef4               les bx, ptr [bp - 0xc]
8:DC5A  06                   push es
8:DC5B  53                   push bx
8:DC5C  26c41f               les bx, ptr es:[bx]
8:DC5F  26ff5f6c             lcall es:[bx + 0x6c]
8:DC63  eb43                 jmp 0xdca8
8:DC65  db 90
loc_DC66:
8:DC66  68b400               push 0xb4
8:DC69  9a9c17f9d8           lcall 0xd8f9, 0x179c  ; operator_new@s1:179C
8:DC6E  83c402               add sp, 2
8:DC71  8946f0               mov word ptr [bp - 0x10], ax
8:DC74  8956f2               mov word ptr [bp - 0xe], dx
8:DC77  0bd0                 or dx, ax
8:DC79  74b9                 je 0xdc34
8:DC7B  ff76fe               push word ptr [bp - 2]
8:DC7E  666802003406         push 0x6340002
8:DC84  6a00                 push 0
8:DC86  c45e06               les bx, ptr [bp + 6]
8:DC89  26ff7706             push word ptr es:[bx + 6]
8:DC8D  ff76f2               push word ptr [bp - 0xe]
8:DC90  50                   push ax
8:DC91  9a2085d1d8           lcall 0xd8d1, 0x8520  ; sub_s9:8520
8:DC96  83c40e               add sp, 0xe
8:DC99  eb9c                 jmp 0xdc37
8:DC9B  db 90
loc_DC9C:
8:DC9C  52                   push dx
8:DC9D  c45ef4               les bx, ptr [bp - 0xc]
8:DCA0  53                   push bx
8:DCA1  26c41f               les bx, ptr es:[bx]
8:DCA4  26ff5f74             lcall es:[bx + 0x74]
loc_DCA8:
8:DCA8  b80100               mov ax, 1
8:DCAB  99                   cdq
8:DCAC  c9                   leave
8:DCAD  ca0a00               retf 0xa

; ---------------- sub_s8:DCB0 FAR size=368 callers=1
;   apis: USER.PostMessage
8:DCB0  c8160000             enter 0x16, 0
8:DCB4  68b400               push 0xb4
8:DCB7  9a9c1726dd           lcall 0xdd26, 0x179c  ; operator_new@s1:179C
8:DCBC  83c402               add sp, 2
8:DCBF  8946f2               mov word ptr [bp - 0xe], ax
8:DCC2  8956f4               mov word ptr [bp - 0xc], dx
8:DCC5  0bd0                 or dx, ax
8:DCC7  7423                 je 0xdcec
8:DCC9  666826072707         push 0x7270726
8:DCCF  666803003406         push 0x6340003
8:DCD5  6a04                 push 4
8:DCD7  c45e06               les bx, ptr [bp + 6]
8:DCDA  26ff7706             push word ptr es:[bx + 6]
8:DCDE  ff76f4               push word ptr [bp - 0xc]
8:DCE1  50                   push ax
8:DCE2  9a20854fdd           lcall 0xdd4f, 0x8520  ; sub_s9:8520
8:DCE7  83c410               add sp, 0x10
8:DCEA  eb03                 jmp 0xdcef
loc_DCEC:
8:DCEC  33c0                 xor ax, ax
8:DCEE  99                   cdq
loc_DCEF:
8:DCEF  8946fc               mov word ptr [bp - 4], ax
8:DCF2  8956fe               mov word ptr [bp - 2], dx
8:DCF5  666801004900         push 0x490001
8:DCFB  8d46f8               lea ax, [bp - 8]
8:DCFE  16                   push ss
8:DCFF  50                   push ax
8:DD00  9a1a946ddd           lcall 0xdd6d, 0x941a  ; sub_s2:941A
8:DD05  8d46f8               lea ax, [bp - 8]
8:DD08  16                   push ss
8:DD09  50                   push ax
8:DD0A  c45efc               les bx, ptr [bp - 4]
8:DD0D  06                   push es
8:DD0E  53                   push bx
8:DD0F  26c41f               les bx, ptr es:[bx]
8:DD12  26ff5f6c             lcall es:[bx + 0x6c]
8:DD16  8946f6               mov word ptr [bp - 0xa], ax
8:DD19  3d0600               cmp ax, 6
8:DD1C  0f859c00             jne 0xddbc
8:DD20  68b400               push 0xb4
8:DD23  9a9c17c2dd           lcall 0xddc2, 0x179c  ; operator_new@s1:179C
8:DD28  83c402               add sp, 2
8:DD2B  8946f2               mov word ptr [bp - 0xe], ax
8:DD2E  8956f4               mov word ptr [bp - 0xc], dx
8:DD31  0bd0                 or dx, ax
8:DD33  7421                 je 0xdd56
8:DD35  666834062807         push 0x7280634
8:DD3B  666800000200         push 0x20000
8:DD41  c45e06               les bx, ptr [bp + 6]
8:DD44  26ff7706             push word ptr es:[bx + 6]
8:DD48  ff76f4               push word ptr [bp - 0xc]
8:DD4B  50                   push ax
8:DD4C  9a2085ebdd           lcall 0xddeb, 0x8520  ; sub_s9:8520
8:DD51  83c40e               add sp, 0xe
8:DD54  eb03                 jmp 0xdd59
loc_DD56:
8:DD56  33c0                 xor ax, ax
8:DD58  99                   cdq
loc_DD59:
8:DD59  8946fc               mov word ptr [bp - 4], ax
8:DD5C  8956fe               mov word ptr [bp - 2], dx
8:DD5F  666801004a00         push 0x4a0001
8:DD65  8d46ee               lea ax, [bp - 0x12]
8:DD68  16                   push ss
8:DD69  50                   push ax
8:DD6A  9a1a94a4dd           lcall 0xdda4, 0x941a  ; sub_s2:941A
8:DD6F  8d46ee               lea ax, [bp - 0x12]
8:DD72  16                   push ss
8:DD73  50                   push ax
8:DD74  c45efc               les bx, ptr [bp - 4]
8:DD77  06                   push es
8:DD78  53                   push bx
8:DD79  26c41f               les bx, ptr es:[bx]
8:DD7C  26ff5f6c             lcall es:[bx + 0x6c]
8:DD80  666800001500         push 0x150000
8:DD86  666a01               push 1
8:DD89  666a00               push 0
8:DD8C  666a37               push 0x37
8:DD8F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:DD94  9aba20abdb           lcall 0xdbab, 0x20ba  ; sub_s3:20BA
8:DD99  8946ea               mov word ptr [bp - 0x16], ax
8:DD9C  8956ec               mov word ptr [bp - 0x14], dx
8:DD9F  52                   push dx
8:DDA0  50                   push ax
8:DDA1  9ae4a009de           lcall 0xde09, 0xa0e4  ; sub_s2:A0E4
8:DDA6  ff369603             push word ptr [0x396]
8:DDAA  6668fc001101         push 0x11100fc
8:DDB0  666a00               push 0
8:DDB3  9a87d80000           lcall 0, 0xd887  ; USER.PostMessage
8:DDB8  c9                   leave
8:DDB9  ca0400               retf 4
loc_DDBC:
8:DDBC  68b400               push 0xb4
8:DDBF  9a9c17d9da           lcall 0xdad9, 0x179c  ; operator_new@s1:179C
8:DDC4  83c402               add sp, 2
8:DDC7  8946f2               mov word ptr [bp - 0xe], ax
8:DDCA  8956f4               mov word ptr [bp - 0xc], dx
8:DDCD  0bd0                 or dx, ax
8:DDCF  7421                 je 0xddf2
8:DDD1  666834062907         push 0x7290634
8:DDD7  666800000200         push 0x20000
8:DDDD  c45e06               les bx, ptr [bp + 6]
8:DDE0  26ff7706             push word ptr es:[bx + 6]
8:DDE4  ff76f4               push word ptr [bp - 0xc]
8:DDE7  50                   push ax
8:DDE8  9a208506db           lcall 0xdb06, 0x8520  ; sub_s9:8520
8:DDED  83c40e               add sp, 0xe
8:DDF0  eb03                 jmp 0xddf5
loc_DDF2:
8:DDF2  33c0                 xor ax, ax
8:DDF4  99                   cdq
loc_DDF5:
8:DDF5  8946fc               mov word ptr [bp - 4], ax
8:DDF8  8956fe               mov word ptr [bp - 2], dx
8:DDFB  666801004b00         push 0x4b0001
8:DE01  8d46ea               lea ax, [bp - 0x16]
8:DE04  16                   push ss
8:DE05  50                   push ax
8:DE06  9a1a9476db           lcall 0xdb76, 0x941a  ; sub_s2:941A
8:DE0B  8d46ea               lea ax, [bp - 0x16]
8:DE0E  16                   push ss
8:DE0F  50                   push ax
8:DE10  c45efc               les bx, ptr [bp - 4]
8:DE13  06                   push es
8:DE14  53                   push bx
8:DE15  26c41f               les bx, ptr es:[bx]
8:DE18  26ff5f6c             lcall es:[bx + 0x6c]
8:DE1C  c9                   leave
8:DE1D  ca0400               retf 4

; ---------------- sub_s8:DE20 FAR size=316 callers=1
8:DE20  c8100000             enter 0x10, 0
8:DE24  c746fe4406           mov word ptr [bp - 2], 0x644
8:DE29  c746fc0000           mov word ptr [bp - 4], 0
8:DE2E  8b460e               mov ax, word ptr [bp + 0xe]
8:DE31  eb7f                 jmp 0xdeb2
8:DE33  db 90
loc_DE34:
8:DE34  c746fe3506           mov word ptr [bp - 2], 0x635
8:DE39  c746fc3a00           mov word ptr [bp - 4], 0x3a
8:DE3E  e99900               jmp 0xdeda
8:DE41  db 90
loc_DE42:
8:DE42  c746fe3606           mov word ptr [bp - 2], 0x636
8:DE47  c746fc3b00           mov word ptr [bp - 4], 0x3b
8:DE4C  e98b00               jmp 0xdeda
8:DE4F  db 90
loc_DE50:
8:DE50  c746fe3706           mov word ptr [bp - 2], 0x637
8:DE55  c746fc3c00           mov word ptr [bp - 4], 0x3c
8:DE5A  eb7e                 jmp 0xdeda
8:DE5C  db 90 90
loc_DE5E:
8:DE5E  c746fe3906           mov word ptr [bp - 2], 0x639
8:DE63  c746fc3e00           mov word ptr [bp - 4], 0x3e
8:DE68  eb70                 jmp 0xdeda
loc_DE6A:
8:DE6A  c746fe3a06           mov word ptr [bp - 2], 0x63a
8:DE6F  c746fc3f00           mov word ptr [bp - 4], 0x3f
8:DE74  eb64                 jmp 0xdeda
loc_DE76:
8:DE76  c746fe3b06           mov word ptr [bp - 2], 0x63b
8:DE7B  c746fc4000           mov word ptr [bp - 4], 0x40
8:DE80  eb58                 jmp 0xdeda
loc_DE82:
8:DE82  c746fe4006           mov word ptr [bp - 2], 0x640
8:DE87  c746fc4500           mov word ptr [bp - 4], 0x45
8:DE8C  eb4c                 jmp 0xdeda
loc_DE8E:
8:DE8E  c746fe4206           mov word ptr [bp - 2], 0x642
8:DE93  c746fc4700           mov word ptr [bp - 4], 0x47
8:DE98  eb40                 jmp 0xdeda
loc_DE9A:
8:DE9A  c746fe4106           mov word ptr [bp - 2], 0x641
8:DE9F  c746fc4600           mov word ptr [bp - 4], 0x46
8:DEA4  eb34                 jmp 0xdeda
loc_DEA6:
8:DEA6  c746fe3f06           mov word ptr [bp - 2], 0x63f
8:DEAB  c746fc4400           mov word ptr [bp - 4], 0x44
8:DEB0  eb28                 jmp 0xdeda
loc_DEB2:
8:DEB2  2d1c01               sub ax, 0x11c
8:DEB5  3d0b00               cmp ax, 0xb
8:DEB8  7720                 ja 0xdeda
8:DEBA  03c0                 add ax, ax
8:DEBC  93                   xchg bx, ax
8:DEBD  2effa7c2de           jmp word ptr cs:[bx - 0x213e]
switch_table_DEC2:
    dw loc_DE34
    dw loc_DE42
    dw loc_DE50
    dw loc_DEDA
    dw loc_DE5E
    dw loc_DE6A
    dw loc_DE76
    dw loc_DE82
    dw loc_DEDA
    dw loc_DE8E
    dw loc_DE9A
    dw loc_DEA6
loc_DEDA:
8:DEDA  837efe00             cmp word ptr [bp - 2], 0
8:DEDE  7474                 je 0xdf54
8:DEE0  68b400               push 0xb4
8:DEE3  9a9c17badc           lcall 0xdcba, 0x179c  ; operator_new@s1:179C
8:DEE8  83c402               add sp, 2
8:DEEB  8946f4               mov word ptr [bp - 0xc], ax
8:DEEE  8956f6               mov word ptr [bp - 0xa], dx
8:DEF1  0bd0                 or dx, ax
8:DEF3  7421                 je 0xdf16
8:DEF5  ff76fe               push word ptr [bp - 2]
8:DEF8  666802003406         push 0x6340002
8:DEFE  6a00                 push 0
8:DF00  c45e06               les bx, ptr [bp + 6]
8:DF03  26ff7706             push word ptr es:[bx + 6]
8:DF07  ff76f6               push word ptr [bp - 0xa]
8:DF0A  50                   push ax
8:DF0B  9a2085e5dc           lcall 0xdce5, 0x8520  ; sub_s9:8520
8:DF10  83c40e               add sp, 0xe
8:DF13  eb04                 jmp 0xdf19
8:DF15  db 90
loc_DF16:
8:DF16  33c0                 xor ax, ax
8:DF18  99                   cdq
loc_DF19:
8:DF19  8946f8               mov word ptr [bp - 8], ax
8:DF1C  8956fa               mov word ptr [bp - 6], dx
8:DF1F  837efc00             cmp word ptr [bp - 4], 0
8:DF23  7423                 je 0xdf48
8:DF25  ff76fc               push word ptr [bp - 4]
8:DF28  6a01                 push 1
8:DF2A  8d46f0               lea ax, [bp - 0x10]
8:DF2D  16                   push ss
8:DF2E  50                   push ax
8:DF2F  9a1a9403dd           lcall 0xdd03, 0x941a  ; sub_s2:941A
8:DF34  8d46f0               lea ax, [bp - 0x10]
8:DF37  16                   push ss
8:DF38  50                   push ax
8:DF39  c45ef8               les bx, ptr [bp - 8]
8:DF3C  06                   push es
8:DF3D  53                   push bx
8:DF3E  26c41f               les bx, ptr es:[bx]
8:DF41  26ff5f6c             lcall es:[bx + 0x6c]
8:DF45  eb0d                 jmp 0xdf54
8:DF47  db 90
loc_DF48:
8:DF48  52                   push dx
8:DF49  c45ef8               les bx, ptr [bp - 8]
8:DF4C  53                   push bx
8:DF4D  26c41f               les bx, ptr es:[bx]
8:DF50  26ff5f74             lcall es:[bx + 0x74]
loc_DF54:
8:DF54  b80100               mov ax, 1
8:DF57  99                   cdq
8:DF58  c9                   leave
8:DF59  ca0a00               retf 0xa

; ---------------- sub_s8:DF5C FAR size=42 callers=1
8:DF5C  55                   push bp
8:DF5D  8bec                 mov bp, sp
8:DF5F  6a01                 push 1
8:DF61  c45e06               les bx, ptr [bp + 6]
8:DF64  6626ffb79200         push dword ptr es:[bx + 0x92]
8:DF6A  9a8e0397dd           lcall 0xdd97, 0x38e  ; sub_s3:038E
8:DF6F  6a20                 push 0x20  ; 'New failed in Op::Op'
8:DF71  c45e06               les bx, ptr [bp + 6]
8:DF74  26ff7708             push word ptr es:[bx + 8]
8:DF78  66ff367c5b           push dword ptr [0x5b7c]
8:DF7D  90                   nop
8:DF7E  0e                   push cs
8:DF7F  e8becf               call 0xaf40  ; sub_s8:AF40
8:DF82  c9                   leave
8:DF83  ca0400               retf 4

; ---------------- sub_s8:DF86 FAR size=184 callers=1
8:DF86  c8180000             enter 0x18, 0
8:DF8A  6a02                 push 2
8:DF8C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:DF91  9aba20b4df           lcall 0xdfb4, 0x20ba  ; sub_s3:20BA
8:DF96  8946fc               mov word ptr [bp - 4], ax
8:DF99  8956fe               mov word ptr [bp - 2], dx
8:DF9C  c45efc               les bx, ptr [bp - 4]
8:DF9F  66268b4768           mov eax, dword ptr es:[bx + 0x68]
8:DFA4  668946f8             mov dword ptr [bp - 8], eax
8:DFA8  c45e06               les bx, ptr [bp + 6]
8:DFAB  6626ffb79200         push dword ptr es:[bx + 0x92]
8:DFB1  9a1a04c8df           lcall 0xdfc8, 0x41a  ; sub_s3:041A
8:DFB6  0bc0                 or ax, ax
8:DFB8  7428                 je 0xdfe2
8:DFBA  6a01                 push 1
8:DFBC  c45e06               les bx, ptr [bp + 6]
8:DFBF  6626ffb79200         push dword ptr es:[bx + 0x92]
8:DFC5  9a8e03eddf           lcall 0xdfed, 0x38e  ; sub_s3:038E
8:DFCA  6a1e                 push 0x1e
8:DFCC  c45e06               les bx, ptr [bp + 6]
8:DFCF  26ff7708             push word ptr es:[bx + 8]
8:DFD3  66ff367c5b           push dword ptr [0x5b7c]
8:DFD8  90                   nop
8:DFD9  0e                   push cs
8:DFDA  e863cf               call 0xaf40  ; sub_s8:AF40
8:DFDD  c9                   leave
8:DFDE  ca0400               retf 4
8:DFE1  db 90
loc_DFE2:
8:DFE2  68d507               push 0x7d5
8:DFE5  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
8:DFEA  9a7e846ddf           lcall 0xdf6d, 0x847e  ; LoadStringRes@s3:847E
8:DFEF  8946f0               mov word ptr [bp - 0x10], ax
8:DFF2  8956f2               mov word ptr [bp - 0xe], dx
8:DFF5  68b400               push 0xb4
8:DFF8  9a9c17e6de           lcall 0xdee6, 0x179c  ; operator_new@s1:179C
8:DFFD  83c402               add sp, 2
8:E000  8956ea               mov word ptr [bp - 0x16], dx
8:E003  0bd0                 or dx, ax
8:E005  741d                 je 0xe024
8:E007  c45e06               les bx, ptr [bp + 6]
8:E00A  26ff7706             push word ptr es:[bx + 6]
8:E00E  66ff76f0             push dword ptr [bp - 0x10]
8:E012  66ff76f8             push dword ptr [bp - 8]
8:E016  6a20                 push 0x20  ; 'New failed in Op::Op'
8:E018  ff76ea               push word ptr [bp - 0x16]
8:E01B  50                   push ax
8:E01C  9a78840edf           lcall 0xdf0e, 0x8478  ; sub_s9:8478
8:E021  eb04                 jmp 0xe027
8:E023  db 90
loc_E024:
8:E024  33c0                 xor ax, ax
8:E026  99                   cdq
loc_E027:
8:E027  8946ec               mov word ptr [bp - 0x14], ax
8:E02A  8956ee               mov word ptr [bp - 0x12], dx
8:E02D  52                   push dx
8:E02E  c45eec               les bx, ptr [bp - 0x14]
8:E031  50                   push ax
8:E032  26c41f               les bx, ptr es:[bx]
8:E035  26ff5f74             lcall es:[bx + 0x74]
8:E039  c9                   leave
8:E03A  ca0400               retf 4
8:E03D  db 00

; ---------------- sub_s8:E03E FAR size=112 callers=1
8:E03E  c8080000             enter 8, 0
8:E042  57                   push di
8:E043  56                   push si
8:E044  c45e06               les bx, ptr [bp + 6]
8:E047  6626ffb79200         push dword ptr es:[bx + 0x92]
8:E04D  9a86086be0           lcall 0xe06b, 0x886  ; sub_s3:0886
8:E052  8946fe               mov word ptr [bp - 2], ax
8:E055  c746fc0100           mov word ptr [bp - 4], 1
8:E05A  eb43                 jmp 0xe09f
loc_E05C:
8:E05C  ff76fc               push word ptr [bp - 4]
8:E05F  c45e06               les bx, ptr [bp + 6]
8:E062  6626ffb79200         push dword ptr es:[bx + 0x92]
8:E068  9ae20894df           lcall 0xdf94, 0x8e2  ; sub_s3:08E2
8:E06D  8946f8               mov word ptr [bp - 8], ax
8:E070  8956fa               mov word ptr [bp - 6], dx
8:E073  c45e06               les bx, ptr [bp + 6]
8:E076  26c49f9600           les bx, ptr es:[bx + 0x96]
8:E07B  8b76fc               mov si, word ptr [bp - 4]
8:E07E  c1e602               shl si, 2
8:E081  6626833800           cmp dword ptr es:[bx + si], 0
8:E086  7414                 je 0xe09c
8:E088  8cc0                 mov ax, es
8:E08A  c47ef8               les di, ptr [bp - 8]
8:E08D  26ff7506             push word ptr es:[di + 6]
8:E091  8ec0                 mov es, ax
8:E093  6626ff30             push dword ptr es:[bx + si]
8:E097  9a34921fe0           lcall 0xe01f, 0x9234  ; sub_s9:9234
loc_E09C:
8:E09C  ff46fc               inc word ptr [bp - 4]
loc_E09F:
8:E09F  8b46fe               mov ax, word ptr [bp - 2]
8:E0A2  3946fc               cmp word ptr [bp - 4], ax
8:E0A5  7eb5                 jle 0xe05c
8:E0A7  5e                   pop si
8:E0A8  5f                   pop di
8:E0A9  c9                   leave
8:E0AA  ca0400               retf 4
8:E0AD  db 00

; ---------------- sub_s8:E0AE FAR size=146 callers=0
8:E0AE  55                   push bp
8:E0AF  8bec                 mov bp, sp
8:E0B1  66ff7606             push dword ptr [bp + 6]
8:E0B5  90                   nop
8:E0B6  0e                   push cs
8:E0B7  e816f7               call 0xd7d0  ; sub_s8:D7D0
8:E0BA  f6460a01             test byte ptr [bp + 0xa], 1
8:E0BE  7409                 je 0xe0c9
8:E0C0  66ff7606             push dword ptr [bp + 6]
8:E0C4  9ace17fbdf           lcall 0xdffb, 0x17ce  ; operator_delete@s1:17CE
loc_E0C9:
8:E0C9  8b4606               mov ax, word ptr [bp + 6]
8:E0CC  8b5608               mov dx, word ptr [bp + 8]
8:E0CF  c9                   leave
8:E0D0  ca0600               retf 6
8:E0D3  db 90 ae e0 da e0 40 d8 de e0 ae d8 e6 e0 c0 79 ea
8:E0E3  db e0 68 da 36 e1 98 7b ee e0 56 7f f2 e0 b2 7b f6
8:E0F3  db e0 1c 7f fa e0 12 82 fe e0 86 7f 02 e1 0c 80 06
8:E103  db e1 54 80 0a e1 5e 7e 0e e1 58 81 12 e1 b6 81 16
8:E113  db e1 fe 81 1e e1 ea 60 2a e1 4a 82 22 e1 66 82 26
8:E123  db e1 de 78 3e e1 ee 60 2e e1 f4 60 32 e1 fa 60 3a
8:E133  db e1 a4 a2 e0 d7 fe 60 30 d7 7e 80 9a e0

; ---------------- sub_s8:E140 FAR size=46 callers=1
8:E140  55                   push bp
8:E141  8bec                 mov bp, sp
8:E143  ff7612               push word ptr [bp + 0x12]
8:E146  68c20f               push 0xfc2
8:E149  66ff760a             push dword ptr [bp + 0xa]
8:E14D  6a01                 push 1
8:E14F  66ff7606             push dword ptr [bp + 6]
8:E153  9a2877e2e0           lcall 0xe0e2, 0x7728  ; sub_s9:7728
8:E158  c45e06               les bx, ptr [bp + 6]
8:E15B  26c70764e2           mov word ptr es:[bx], 0xe264
8:E160  26c74702d6e0         mov word ptr es:[bx + 2], 0xe0d6  ; SEGMENT s8:0000
8:E166  8bc3                 mov ax, bx
8:E168  8cc2                 mov dx, es
8:E16A  c9                   leave
8:E16B  ca0e00               retf 0xe

; ---------------- sub_s8:E16E FAR size=44 callers=1
8:E16E  55                   push bp
8:E16F  8bec                 mov bp, sp
8:E171  c45e06               les bx, ptr [bp + 6]
8:E174  26c70764e2           mov word ptr es:[bx], 0xe264
8:E179  26c7470264e1         mov word ptr es:[bx + 2], 0xe164  ; SEGMENT s8:0000
8:E17F  26ff7706             push word ptr es:[bx + 6]
8:E183  66ff367c5b           push dword ptr [0x5b7c]
8:E188  90                   nop
8:E189  0e                   push cs
8:E18A  e853d5               call 0xb6e0  ; sub_s8:B6E0
8:E18D  66ff7606             push dword ptr [bp + 6]
8:E191  9a2c7856e1           lcall 0xe156, 0x782c  ; sub_s9:782C
8:E196  c9                   leave
8:E197  ca0400               retf 4

; ---------------- sub_s8:E19A FAR size=66 callers=0
;   apis: USER.CheckRadioButton, USER.ShowWindow
8:E19A  55                   push bp
8:E19B  8bec                 mov bp, sp
8:E19D  66ff7606             push dword ptr [bp + 6]
8:E1A1  9ae278c8e1           lcall 0xe1c8, 0x78e2  ; sub_s9:78E2
8:E1A6  c45e06               les bx, ptr [bp + 6]
8:E1A9  26ff7706             push word ptr es:[bx + 6]
8:E1AD  666807180718         push 0x18071807
8:E1B3  680718               push 0x1807
8:E1B6  9abac80000           lcall 0, 0xc8ba  ; USER.CheckRadioButton
8:E1BB  6668c800c800         push 0xc800c8
8:E1C1  66ff7606             push dword ptr [bp + 6]
8:E1C5  9a6c8294e1           lcall 0xe194, 0x826c  ; sub_s9:826C
8:E1CA  c45e06               les bx, ptr [bp + 6]
8:E1CD  26ff7706             push word ptr es:[bx + 6]
8:E1D1  6a05                 push 5
8:E1D3  9a56da0000           lcall 0, 0xda56  ; USER.ShowWindow
8:E1D8  c9                   leave
8:E1D9  ca0400               retf 4

; ---------------- sub_s8:E1DC FAR size=94 callers=0
;   apis: USER.DestroyWindow, USER.IsDlgButtonChecked, USER.SendMessage
8:E1DC  55                   push bp
8:E1DD  8bec                 mov bp, sp
8:E1DF  837e0a00             cmp word ptr [bp + 0xa], 0
8:E1E3  7444                 je 0xe229
8:E1E5  c45e06               les bx, ptr [bp + 6]
8:E1E8  26ff7706             push word ptr es:[bx + 6]
8:E1EC  680718               push 0x1807
8:E1EF  9a0fe20000           lcall 0, 0xe20f  ; USER.IsDlgButtonChecked
8:E1F4  0bc0                 or ax, ax
8:E1F6  740c                 je 0xe204
8:E1F8  ff369603             push word ptr [0x396]
8:E1FC  66682f011101         push 0x111012f
8:E202  eb1d                 jmp 0xe221
loc_E204:
8:E204  c45e06               les bx, ptr [bp + 6]
8:E207  26ff7706             push word ptr es:[bx + 6]
8:E20B  680618               push 0x1806
8:E20E  9aedcd0000           lcall 0, 0xcded  ; USER.IsDlgButtonChecked
8:E213  0bc0                 or ax, ax
8:E215  7412                 je 0xe229
8:E217  ff369603             push word ptr [0x396]
8:E21B  666830011101         push 0x1110130  ; 'New failed in Op::Op->Simulator'
loc_E221:
8:E221  666a00               push 0
8:E224  9ae0d00000           lcall 0, 0xd0e0  ; USER.SendMessage
loc_E229:
8:E229  c45e06               les bx, ptr [bp + 6]
8:E22C  26ff7706             push word ptr es:[bx + 6]
8:E230  9a2cd60000           lcall 0, 0xd62c  ; USER.DestroyWindow
8:E235  c9                   leave
8:E236  ca0600               retf 6
8:E239  db 00

; ---------------- sub_s8:E23A FAR size=4 callers=0
8:E23A  ca0400               retf 4
8:E23D  db 00

; ---------------- sub_s8:E23E FAR size=146 callers=0
8:E23E  55                   push bp
8:E23F  8bec                 mov bp, sp
8:E241  66ff7606             push dword ptr [bp + 6]
8:E245  90                   nop
8:E246  0e                   push cs
8:E247  e824ff               call 0xe16e  ; sub_s8:E16E
8:E24A  f6460a01             test byte ptr [bp + 0xa], 1
8:E24E  7409                 je 0xe259
8:E250  66ff7606             push dword ptr [bp + 6]
8:E254  9ace17c7e0           lcall 0xe0c7, 0x17ce  ; operator_delete@s1:17CE
loc_E259:
8:E259  8b4606               mov ax, word ptr [bp + 6]
8:E25C  8b5608               mov dx, word ptr [bp + 8]
8:E25F  c9                   leave
8:E260  ca0600               retf 6
8:E263  db 90 3e e2 6e e2 10 3a 32 df 9a e1 7a e2 c0 79 76
8:E273  db e2 3c 7b 7e e2 dc e1 8a e2 56 7f 82 e2 b2 7b 86
8:E283  db e2 1c 7f 8e e2 3a e2 c6 e2 86 7f 92 e2 0c 80 96
8:E293  db e2 54 80 9a e2 5e 7e 9e e2 58 81 a2 e2 b6 81 a6
8:E2A3  db e2 fe 81 ae e2 ea 60 ba e2 4a 82 b2 e2 66 82 b6
8:E2B3  db e2 de 78 ce e2 ee 60 be e2 f4 60 c2 e2 fa 60 ca
8:E2C3  db e2 a4 a2 7d e1 fe 60 1a e1 7e 80 a4 e1

; ---------------- sub_s8:E2D0 FAR size=56 callers=1
8:E2D0  55                   push bp
8:E2D1  8bec                 mov bp, sp
8:E2D3  ff760a               push word ptr [bp + 0xa]
8:E2D6  66680000c301         push 0x1c30000
8:E2DC  666a01               push 1
8:E2DF  66ff7606             push dword ptr [bp + 6]
8:E2E3  9a287772e2           lcall 0xe272, 0x7728  ; sub_s9:7728
8:E2E8  c45e06               les bx, ptr [bp + 6]
8:E2EB  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
8:E2F5  26c7072ee6           mov word ptr es:[bx], 0xe62e
8:E2FA  26c7470266e2         mov word ptr es:[bx + 2], 0xe266  ; SEGMENT s8:0000
8:E300  8bc3                 mov ax, bx
8:E302  8cc2                 mov dx, es
8:E304  c9                   leave
8:E305  ca0600               retf 6

; ---------------- sub_s8:E308 FAR size=64 callers=1
8:E308  c8080000             enter 8, 0
8:E30C  c45e06               les bx, ptr [bp + 6]
8:E30F  26c7072ee6           mov word ptr es:[bx], 0xe62e
8:E314  26c74702fee2         mov word ptr es:[bx + 2], 0xe2fe  ; SEGMENT s8:0000
8:E31A  26ff7706             push word ptr es:[bx + 6]
8:E31E  66ff367c5b           push dword ptr [0x5b7c]
8:E323  90                   nop
8:E324  0e                   push cs
8:E325  e8b8d3               call 0xb6e0  ; sub_s8:B6E0
8:E328  c45e06               les bx, ptr [bp + 6]
8:E32B  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
8:E331  6650                 push eax
8:E333  9ace1757e2           lcall 0xe257, 0x17ce  ; operator_delete@s1:17CE
8:E338  83c404               add sp, 4
8:E33B  66ff7606             push dword ptr [bp + 6]
8:E33F  9a2c78e6e2           lcall 0xe2e6, 0x782c  ; sub_s9:782C
8:E344  c9                   leave
8:E345  ca0400               retf 4

; ---------------- sub_s8:E348 size=372 callers=0
;   apis: USER.MapDialogRect, USER.ShowWindow
8:E348  c8240000             enter 0x24, 0
8:E34C  57                   push di
8:E34D  56                   push si
8:E34E  66ff7606             push dword ptr [bp + 6]
8:E352  9ae278f9e3           lcall 0xe3f9, 0x78e2  ; sub_s9:78E2
8:E357  6a2b                 push 0x2b
8:E359  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:E35E  9aba206ee3           lcall 0xe36e, 0x20ba  ; sub_s3:20BA
8:E363  8946fc               mov word ptr [bp - 4], ax
8:E366  8956fe               mov word ptr [bp - 2], dx
8:E369  52                   push dx
8:E36A  50                   push ax
8:E36B  9a8c0812e4           lcall 0xe412, 0x88c  ; sub_s3:088C
8:E370  8946fa               mov word ptr [bp - 6], ax
8:E373  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
8:E379  7409                 je 0xe384
8:E37B  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
8:E37E  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
8:E382  eb05                 jmp 0xe389
loc_E384:
8:E384  9a0a16a2e3           lcall 0xe3a2, 0x160a  ; SH_DefaultPool@s1:160A
loc_E389:
8:E389  8946e8               mov word ptr [bp - 0x18], ax
8:E38C  8956ea               mov word ptr [bp - 0x16], dx
8:E38F  52                   push dx
8:E390  50                   push ax
8:E391  6a01                 push 1
8:E393  8b46fa               mov ax, word ptr [bp - 6]
8:E396  050200               add ax, 2
8:E399  c1e002               shl ax, 2
8:E39C  6a00                 push 0
8:E39E  50                   push ax
8:E39F  9a08174ae4           lcall 0xe44a, 0x1708  ; SH_MemAllocPtr@s1:1708
8:E3A4  83c40a               add sp, 0xa
8:E3A7  c45e06               les bx, ptr [bp + 6]
8:E3AA  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:E3AF  2689979000           mov word ptr es:[bx + 0x90], dx
8:E3B4  c746f80100           mov word ptr [bp - 8], 1
8:E3B9  eb43                 jmp 0xe3fe
8:E3BB  db 90
loc_E3BC:
8:E3BC  c45e06               les bx, ptr [bp + 6]
8:E3BF  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E3C4  8b76f8               mov si, word ptr [bp - 8]
8:E3C7  c1e602               shl si, 2
8:E3CA  6626c70000000000     mov dword ptr es:[bx + si], 0
loc_E3D2:
8:E3D2  c45e06               les bx, ptr [bp + 6]
8:E3D5  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E3DA  8b76f8               mov si, word ptr [bp - 8]
8:E3DD  c1e602               shl si, 2
8:E3E0  6626833800           cmp dword ptr es:[bx + si], 0
8:E3E5  7414                 je 0xe3fb
8:E3E7  8cc0                 mov ax, es
8:E3E9  c47ee8               les di, ptr [bp - 0x18]
8:E3EC  26ff7506             push word ptr es:[di + 6]
8:E3F0  8ec0                 mov es, ax
8:E3F2  6626ff30             push dword ptr es:[bx + si]
8:E3F6  9a3492a6e4           lcall 0xe4a6, 0x9234  ; sub_s9:9234
loc_E3FB:
8:E3FB  ff46f8               inc word ptr [bp - 8]
loc_E3FE:
8:E3FE  8b46fa               mov ax, word ptr [bp - 6]
8:E401  3946f8               cmp word ptr [bp - 8], ax
8:E404  0f8f9400             jg 0xe49c
8:E408  ff76f8               push word ptr [bp - 8]
8:E40B  66ff76fc             push dword ptr [bp - 4]
8:E40F  9a1e0950e0           lcall 0xe050, 0x91e  ; sub_s3:091E
8:E414  8ec2                 mov es, dx
8:E416  8bd8                 mov bx, ax
8:E418  8946e8               mov word ptr [bp - 0x18], ax
8:E41B  8c46ea               mov word ptr [bp - 0x16], es
8:E41E  268b07               mov ax, word ptr es:[bx]
8:E421  8946e0               mov word ptr [bp - 0x20], ax
8:E424  268b4702             mov ax, word ptr es:[bx + 2]
8:E428  8946e2               mov word ptr [bp - 0x1e], ax
8:E42B  b80100               mov ax, 1
8:E42E  8946e4               mov word ptr [bp - 0x1c], ax
8:E431  8946e6               mov word ptr [bp - 0x1a], ax
8:E434  c45e06               les bx, ptr [bp + 6]
8:E437  26ff7706             push word ptr es:[bx + 6]
8:E43B  8d46e0               lea ax, [bp - 0x20]
8:E43E  16                   push ss
8:E43F  50                   push ax
8:E440  9acbd90000           lcall 0, 0xd9cb  ; USER.MapDialogRect
8:E445  6a42                 push 0x42
8:E447  9a9c1736e3           lcall 0xe336, 0x179c  ; operator_new@s1:179C
8:E44C  83c402               add sp, 2
8:E44F  8946dc               mov word ptr [bp - 0x24], ax
8:E452  8956de               mov word ptr [bp - 0x22], dx
8:E455  0bd0                 or dx, ax
8:E457  0f8461ff             je 0xe3bc
8:E45B  c45e06               les bx, ptr [bp + 6]
8:E45E  26ff7706             push word ptr es:[bx + 6]
8:E462  c45ee8               les bx, ptr [bp - 0x18]
8:E465  26ff7704             push word ptr es:[bx + 4]
8:E469  66680001ff00         push 0xff0100
8:E46F  680101               push 0x101
8:E472  ff76e0               push word ptr [bp - 0x20]
8:E475  ff76e2               push word ptr [bp - 0x1e]
8:E478  6a00                 push 0
8:E47A  ff76de               push word ptr [bp - 0x22]
8:E47D  50                   push ax
8:E47E  9ad63b6ae2           lcall 0xe26a, 0x3bd6  ; sub_s2:3BD6
8:E483  c45e06               les bx, ptr [bp + 6]
8:E486  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E48B  8b76f8               mov si, word ptr [bp - 8]
8:E48E  c1e602               shl si, 2
8:E491  268900               mov word ptr es:[bx + si], ax
8:E494  26895002             mov word ptr es:[bx + si + 2], dx
8:E498  e937ff               jmp 0xe3d2
8:E49B  db 90
loc_E49C:
8:E49C  666aff               push -1
8:E49F  66ff7606             push dword ptr [bp + 6]
8:E4A3  9a6c8242e3           lcall 0xe342, 0x826c  ; sub_s9:826C
8:E4A8  c45e06               les bx, ptr [bp + 6]
8:E4AB  26ff7706             push word ptr es:[bx + 6]
8:E4AF  6a05                 push 5
8:E4B1  9ad4e10000           lcall 0, 0xe1d4  ; USER.ShowWindow
8:E4B6  5e                   pop si
8:E4B7  5f                   pop di
8:E4B8  c9                   leave
8:E4B9  ca0400               retf 4

; ---------------- sub_s8:E4BC size=332 callers=0
8:E4BC  c8300000             enter 0x30, 0
8:E4C0  57                   push di
8:E4C1  56                   push si
8:E4C2  8b460e               mov ax, word ptr [bp + 0xe]
8:E4C5  2dc401               sub ax, 0x1c4
8:E4C8  7420                 je 0xe4ea
8:E4CA  48                   dec ax
8:E4CB  0f840901             je 0xe5d8
8:E4CF  48                   dec ax
8:E4D0  0f842201             je 0xe5f6
8:E4D4  66ff760c             push dword ptr [bp + 0xc]
8:E4D8  66ff7608             push dword ptr [bp + 8]
8:E4DC  ff7606               push word ptr [bp + 6]
8:E4DF  9a3c7b55e3           lcall 0xe355, 0x7b3c  ; sub_s9:7B3C
8:E4E4  5e                   pop si
8:E4E5  5f                   pop di
8:E4E6  c9                   leave
8:E4E7  ca0a00               retf 0xa
loc_E4EA:
8:E4EA  6a2f                 push 0x2f
8:E4EC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:E4F1  9aba20a3e5           lcall 0xe5a3, 0x20ba  ; sub_s3:20BA
8:E4F6  8946fc               mov word ptr [bp - 4], ax
8:E4F9  8956fe               mov word ptr [bp - 2], dx
8:E4FC  c45efc               les bx, ptr [bp - 4]
8:E4FF  268b4724             mov ax, word ptr es:[bx + 0x24]
8:E503  268b5726             mov dx, word ptr es:[bx + 0x26]
8:E507  8946f8               mov word ptr [bp - 8], ax
8:E50A  8bc2                 mov ax, dx
8:E50C  0b46f8               or ax, word ptr [bp - 8]
8:E50F  0f84eb00             je 0xe5fe
8:E513  52                   push dx
8:E514  ff76f8               push word ptr [bp - 8]
8:E517  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:E51C  9aece191e5           lcall 0xe591, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:E521  8946f4               mov word ptr [bp - 0xc], ax
8:E524  8956f6               mov word ptr [bp - 0xa], dx
8:E527  0bd0                 or dx, ax
8:E529  0f84d100             je 0xe5fe
8:E52D  6a20                 push 0x20  ; 'New failed in Op::Op'
8:E52F  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
8:E534  9afac681e4           lcall 0xe481, 0xc6fa  ; sub_s2:C6FA
8:E539  52                   push dx
8:E53A  50                   push ax
8:E53B  66ff76f4             push dword ptr [bp - 0xc]
8:E53F  90                   nop
8:E540  0e                   push cs
8:E541  e83469               call 0x14e78  ; sub_s8:4E78
8:E544  8946ec               mov word ptr [bp - 0x14], ax
8:E547  8956ee               mov word ptr [bp - 0x12], dx
8:E54A  52                   push dx
8:E54B  c45eec               les bx, ptr [bp - 0x14]
8:E54E  50                   push ax
8:E54F  26c41f               les bx, ptr es:[bx]
8:E552  8bf3                 mov si, bx
8:E554  8cc7                 mov di, es
8:E556  26ff5f10             lcall es:[bx + 0x10]
8:E55A  0bd0                 or dx, ax
8:E55C  751a                 jne 0xe578
8:E55E  668b46ec             mov eax, dword ptr [bp - 0x14]
8:E562  660bc0               or eax, eax
8:E565  0f849500             je 0xe5fe
8:E569  6a01                 push 1
8:E56B  ff76ee               push word ptr [bp - 0x12]
8:E56E  50                   push ax
8:E56F  8ec7                 mov es, di
8:E571  26ff1c               lcall es:[si]
8:E574  e98700               jmp 0xe5fe
8:E577  db 90
loc_E578:
8:E578  666a00               push 0
8:E57B  c45eec               les bx, ptr [bp - 0x14]
8:E57E  06                   push es
8:E57F  53                   push bx
8:E580  26c41f               les bx, ptr es:[bx]
8:E583  26ff5f04             lcall es:[bx + 4]
8:E587  52                   push dx
8:E588  50                   push ax
8:E589  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:E58E  9aece18f73           lcall 0x738f, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:E593  8946e4               mov word ptr [bp - 0x1c], ax
8:E596  8956e6               mov word ptr [bp - 0x1a], dx
8:E599  6a32                 push 0x32
8:E59B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:E5A0  9aba20bde5           lcall 0xe5bd, 0x20ba  ; sub_s3:20BA
8:E5A5  8946e0               mov word ptr [bp - 0x20], ax
8:E5A8  8956e2               mov word ptr [bp - 0x1e], dx
8:E5AB  668b46e4             mov eax, dword ptr [bp - 0x1c]
8:E5AF  050c00               add ax, 0xc
8:E5B2  6650                 push eax
8:E5B4  6a01                 push 1
8:E5B6  66ff76e0             push dword ptr [bp - 0x20]
8:E5BA  9ad671eae5           lcall 0xe5ea, 0x71d6  ; sub_s3:71D6
8:E5BF  668b46ec             mov eax, dword ptr [bp - 0x14]
8:E5C3  660bc0               or eax, eax
8:E5C6  7436                 je 0xe5fe
8:E5C8  6a01                 push 1
8:E5CA  c45eec               les bx, ptr [bp - 0x14]
8:E5CD  06                   push es
8:E5CE  50                   push ax
8:E5CF  26c41f               les bx, ptr es:[bx]
8:E5D2  26ff1f               lcall es:[bx]
8:E5D5  eb27                 jmp 0xe5fe
8:E5D7  db 90
loc_E5D8:
8:E5D8  666a00               push 0
8:E5DB  6a0e                 push 0xe
loc_E5DD:
8:E5DD  666a00               push 0
8:E5E0  6a32                 push 0x32
8:E5E2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:E5E7  9aba20f1e5           lcall 0xe5f1, 0x20ba  ; sub_s3:20BA
8:E5EC  52                   push dx
8:E5ED  50                   push ax
8:E5EE  9a007361e3           lcall 0xe361, 0x7300  ; sub_s3:7300
8:E5F3  eb09                 jmp 0xe5fe
8:E5F5  db 90
loc_E5F6:
8:E5F6  666a00               push 0
8:E5F9  6a0d                 push 0xd
8:E5FB  ebe0                 jmp 0xe5dd
8:E5FD  db 90
loc_E5FE:
8:E5FE  33c0                 xor ax, ax
8:E600  99                   cdq
8:E601  5e                   pop si
8:E602  5f                   pop di
8:E603  c9                   leave
8:E604  ca0a00               retf 0xa
8:E607  db 00

; ---------------- sub_s8:E608 FAR size=146 callers=0
8:E608  55                   push bp
8:E609  8bec                 mov bp, sp
8:E60B  66ff7606             push dword ptr [bp + 6]
8:E60F  90                   nop
8:E610  0e                   push cs
8:E611  e8f4fc               call 0xe308  ; sub_s8:E308
8:E614  f6460a01             test byte ptr [bp + 0xa], 1
8:E618  7409                 je 0xe623
8:E61A  66ff7606             push dword ptr [bp + 6]
8:E61E  9ace1787e3           lcall 0xe387, 0x17ce  ; operator_delete@s1:17CE
loc_E623:
8:E623  8b4606               mov ax, word ptr [bp + 6]
8:E626  8b5608               mov dx, word ptr [bp + 8]
8:E629  c9                   leave
8:E62A  ca0600               retf 6
8:E62D  db 90 08 e6 38 e6 10 3a 37 e5 48 e3 40 e6 c0 79 44
8:E63D  db e6 bc e4 90 e6 98 7b 48 e6 56 7f 4c e6 b2 7b 50
8:E64D  db e6 1c 7f 54 e6 12 82 58 e6 86 7f 5c e6 0c 80 60
8:E65D  db e6 54 80 64 e6 5e 7e 68 e6 58 81 6c e6 b6 81 70
8:E66D  db e6 fe 81 78 e6 ea 60 84 e6 4a 82 7c e6 66 82 80
8:E67D  db e6 de 78 98 e6 ee 60 88 e6 f4 60 8c e6 fa 60 94
8:E68D  db e6 a4 a2 18 e3 fe 60 aa e2 7e 80 e2 e4

; ---------------- sub_s8:E69A FAR size=86 callers=1
8:E69A  55                   push bp
8:E69B  8bec                 mov bp, sp
8:E69D  ff7612               push word ptr [bp + 0x12]
8:E6A0  68cb0f               push 0xfcb
8:E6A3  66ff760a             push dword ptr [bp + 0xa]
8:E6A7  6a01                 push 1
8:E6A9  66ff7606             push dword ptr [bp + 6]
8:E6AD  9a28773ce6           lcall 0xe63c, 0x7728  ; sub_s9:7728
8:E6B2  c45e06               les bx, ptr [bp + 6]
8:E6B5  662bc0               sub eax, eax
8:E6B8  662689878e00         mov dword ptr es:[bx + 0x8e], eax
8:E6BE  2689879200           mov word ptr es:[bx + 0x92], ax
8:E6C3  26c7072ee9           mov word ptr es:[bx], 0xe92e
8:E6C8  26c7470230e6         mov word ptr es:[bx + 2], 0xe630  ; SEGMENT s8:0000
8:E6CE  6a43                 push 0x43
8:E6D0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:E6D5  9aba20f4e4           lcall 0xe4f4, 0x20ba  ; sub_s3:20BA
8:E6DA  c45e06               les bx, ptr [bp + 6]
8:E6DD  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:E6E2  2689979000           mov word ptr es:[bx + 0x90], dx
8:E6E7  8bc3                 mov ax, bx
8:E6E9  8cc2                 mov dx, es
8:E6EB  c9                   leave
8:E6EC  ca0e00               retf 0xe
8:E6EF  db 00

; ---------------- sub_s8:E6F0 FAR size=44 callers=1
8:E6F0  55                   push bp
8:E6F1  8bec                 mov bp, sp
8:E6F3  c45e06               les bx, ptr [bp + 6]
8:E6F6  26c7072ee9           mov word ptr es:[bx], 0xe92e
8:E6FB  26c74702cce6         mov word ptr es:[bx + 2], 0xe6cc  ; SEGMENT s8:0000
8:E701  26ff7706             push word ptr es:[bx + 6]
8:E705  66ff367c5b           push dword ptr [0x5b7c]
8:E70A  90                   nop
8:E70B  0e                   push cs
8:E70C  e8d1cf               call 0xb6e0  ; sub_s8:B6E0
8:E70F  66ff7606             push dword ptr [bp + 6]
8:E713  9a2c78b0e6           lcall 0xe6b0, 0x782c  ; sub_s9:782C
8:E718  c9                   leave
8:E719  ca0400               retf 4

; ---------------- sub_s8:E71C size=132 callers=0
;   apis: USER.DestroyWindow, USER.ShowWindow
8:E71C  c80c0000             enter 0xc, 0
8:E720  66ff7606             push dword ptr [bp + 6]
8:E724  9ae27868e7           lcall 0xe768, 0x78e2  ; sub_s9:78E2
8:E729  c45e06               les bx, ptr [bp + 6]
8:E72C  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:E732  9a342cd8e6           lcall 0xe6d8, 0x2c34  ; sub_s3:2C34
8:E737  8946fc               mov word ptr [bp - 4], ax
8:E73A  8956fe               mov word ptr [bp - 2], dx
8:E73D  52                   push dx
8:E73E  50                   push ax
8:E73F  668b4e06             mov ecx, dword ptr [bp + 6]
8:E743  83c110               add cx, 0x10
8:E746  6651                 push ecx
8:E748  9a3e3d59e7           lcall 0xe759, 0x3d3e  ; _fstrcpy@s1:3D3E
8:E74D  83c408               add sp, 8
8:E750  668b46fc             mov eax, dword ptr [bp - 4]
8:E754  6650                 push eax
8:E756  9ace1721e6           lcall 0xe621, 0x17ce  ; operator_delete@s1:17CE
8:E75B  83c404               add sp, 4
8:E75E  666aff               push -1
8:E761  66ff7606             push dword ptr [bp + 6]
8:E765  9a6c8216e7           lcall 0xe716, 0x826c  ; sub_s9:826C
8:E76A  c45e06               les bx, ptr [bp + 6]
8:E76D  26ff7706             push word ptr es:[bx + 6]
8:E771  6a05                 push 5
8:E773  9ab2e40000           lcall 0, 0xe4b2  ; USER.ShowWindow
8:E778  c45e06               les bx, ptr [bp + 6]
8:E77B  26c78792000100       mov word ptr es:[bx + 0x92], 1
8:E782  8d879200             lea ax, [bx + 0x92]
8:E786  06                   push es
8:E787  50                   push ax
8:E788  9a109534e6           lcall 0xe634, 0x9510  ; MessageLoop@s2:9510
8:E78D  83c404               add sp, 4
8:E790  c45e06               les bx, ptr [bp + 6]
8:E793  26ff7706             push word ptr es:[bx + 6]
8:E797  9a31e20000           lcall 0, 0xe231  ; USER.DestroyWindow
8:E79C  c9                   leave
8:E79D  ca0400               retf 4

; ---------------- sub_s8:E7A0 size=356 callers=0
;   apis: USER.IsDlgButtonChecked
8:E7A0  c8080000             enter 8, 0
8:E7A4  837e0a00             cmp word ptr [bp + 0xa], 0
8:E7A8  0f841201             je 0xe8be
8:E7AC  c45e06               les bx, ptr [bp + 6]
8:E7AF  26ff7706             push word ptr es:[bx + 6]
8:E7B3  682718               push 0x1827
8:E7B6  9adbe70000           lcall 0, 0xe7db  ; USER.IsDlgButtonChecked
8:E7BB  0bc0                 or ax, ax
8:E7BD  7411                 je 0xe7d0
8:E7BF  c45e06               les bx, ptr [bp + 6]
8:E7C2  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E7C7  26c7470a0100         mov word ptr es:[bx + 0xa], 1
8:E7CD  eb33                 jmp 0xe802
8:E7CF  db 90
loc_E7D0:
8:E7D0  c45e06               les bx, ptr [bp + 6]
8:E7D3  26ff7706             push word ptr es:[bx + 6]
8:E7D7  682818               push 0x1828
8:E7DA  9a0de80000           lcall 0, 0xe80d  ; USER.IsDlgButtonChecked
8:E7DF  0bc0                 or ax, ax
8:E7E1  7411                 je 0xe7f4
8:E7E3  c45e06               les bx, ptr [bp + 6]
8:E7E6  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E7EB  26c7470a0200         mov word ptr es:[bx + 0xa], 2
8:E7F1  eb0f                 jmp 0xe802
8:E7F3  db 90
loc_E7F4:
8:E7F4  c45e06               les bx, ptr [bp + 6]
8:E7F7  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E7FC  26c7470a0000         mov word ptr es:[bx + 0xa], 0
loc_E802:
8:E802  c45e06               les bx, ptr [bp + 6]
8:E805  26ff7706             push word ptr es:[bx + 6]
8:E809  683a18               push 0x183a  ; 'vrpal.bmp'
8:E80C  9a31e80000           lcall 0, 0xe831  ; USER.IsDlgButtonChecked
8:E811  0bc0                 or ax, ax
8:E813  7411                 je 0xe826
8:E815  c45e06               les bx, ptr [bp + 6]
8:E818  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E81D  26c7470c0100         mov word ptr es:[bx + 0xc], 1
8:E823  eb33                 jmp 0xe858
8:E825  db 90
loc_E826:
8:E826  c45e06               les bx, ptr [bp + 6]
8:E829  26ff7706             push word ptr es:[bx + 6]
8:E82D  683b18               push 0x183b
8:E830  9a63e80000           lcall 0, 0xe863  ; USER.IsDlgButtonChecked
8:E835  0bc0                 or ax, ax
8:E837  7411                 je 0xe84a
8:E839  c45e06               les bx, ptr [bp + 6]
8:E83C  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E841  26c7470c0200         mov word ptr es:[bx + 0xc], 2
8:E847  eb0f                 jmp 0xe858
8:E849  db 90
loc_E84A:
8:E84A  c45e06               les bx, ptr [bp + 6]
8:E84D  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E852  26c7470c0000         mov word ptr es:[bx + 0xc], 0
loc_E858:
8:E858  c45e06               les bx, ptr [bp + 6]
8:E85B  26ff7706             push word ptr es:[bx + 6]
8:E85F  683c18               push 0x183c
8:E862  9a87e80000           lcall 0, 0xe887  ; USER.IsDlgButtonChecked
8:E867  0bc0                 or ax, ax
8:E869  7411                 je 0xe87c
8:E86B  c45e06               les bx, ptr [bp + 6]
8:E86E  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E873  26c7470e0100         mov word ptr es:[bx + 0xe], 1
8:E879  eb33                 jmp 0xe8ae
8:E87B  db 90
loc_E87C:
8:E87C  c45e06               les bx, ptr [bp + 6]
8:E87F  26ff7706             push word ptr es:[bx + 6]
8:E883  683d18               push 0x183d
8:E886  9af0e10000           lcall 0, 0xe1f0  ; USER.IsDlgButtonChecked
8:E88B  0bc0                 or ax, ax
8:E88D  7411                 je 0xe8a0
8:E88F  c45e06               les bx, ptr [bp + 6]
8:E892  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E897  26c7470e0200         mov word ptr es:[bx + 0xe], 2
8:E89D  eb0f                 jmp 0xe8ae
8:E89F  db 90
loc_E8A0:
8:E8A0  c45e06               les bx, ptr [bp + 6]
8:E8A3  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E8A8  26c7470e0000         mov word ptr es:[bx + 0xe], 0
loc_E8AE:
8:E8AE  c45e06               les bx, ptr [bp + 6]
8:E8B1  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E8B6  26c747100000         mov word ptr es:[bx + 0x10], 0
8:E8BC  eb38                 jmp 0xe8f6
loc_E8BE:
8:E8BE  c45e06               les bx, ptr [bp + 6]
8:E8C1  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E8C6  26c747100100         mov word ptr es:[bx + 0x10], 1
8:E8CC  c45e06               les bx, ptr [bp + 6]
8:E8CF  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E8D4  26c7470a0000         mov word ptr es:[bx + 0xa], 0
8:E8DA  c45e06               les bx, ptr [bp + 6]
8:E8DD  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E8E2  26c7470c0000         mov word ptr es:[bx + 0xc], 0
8:E8E8  c45e06               les bx, ptr [bp + 6]
8:E8EB  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:E8F0  26c7470e0000         mov word ptr es:[bx + 0xe], 0
loc_E8F6:
8:E8F6  c45e06               les bx, ptr [bp + 6]
8:E8F9  26c78792000000       mov word ptr es:[bx + 0x92], 0
8:E900  c9                   leave
8:E901  ca0600               retf 6

; ---------------- sub_s8:E904 FAR size=4 callers=0
8:E904  ca0400               retf 4
8:E907  db 00

; ---------------- sub_s8:E908 FAR size=146 callers=0
8:E908  55                   push bp
8:E909  8bec                 mov bp, sp
8:E90B  66ff7606             push dword ptr [bp + 6]
8:E90F  90                   nop
8:E910  0e                   push cs
8:E911  e8dcfd               call 0xe6f0  ; sub_s8:E6F0
8:E914  f6460a01             test byte ptr [bp + 0xa], 1
8:E918  7409                 je 0xe923
8:E91A  66ff7606             push dword ptr [bp + 6]
8:E91E  9ace174be7           lcall 0xe74b, 0x17ce  ; operator_delete@s1:17CE
loc_E923:
8:E923  8b4606               mov ax, word ptr [bp + 6]
8:E926  8b5608               mov dx, word ptr [bp + 8]
8:E929  c9                   leave
8:E92A  ca0600               retf 6
8:E92D  db 90 08 e9 38 e9 10 3a 8b e7 1c e7 44 e9 c0 79 40
8:E93D  db e9 3c 7b 48 e9 a0 e7 54 e9 56 7f 4c e9 b2 7b 50
8:E94D  db e9 1c 7f 58 e9 04 e9 90 e9 86 7f 5c e9 0c 80 60
8:E95D  db e9 54 80 64 e9 5e 7e 68 e9 58 81 6c e9 b6 81 70
8:E96D  db e9 fe 81 78 e9 ea 60 84 e9 4a 82 7c e9 66 82 80
8:E97D  db e9 de 78 98 e9 ee 60 88 e9 f4 60 8c e9 fa 60 94
8:E98D  db e9 a4 a2 ff e6 fe 60 74 e6 7e 80 27 e7

; ---------------- sub_s8:E99A FAR size=82 callers=1
8:E99A  55                   push bp
8:E99B  8bec                 mov bp, sp
8:E99D  ff7612               push word ptr [bp + 0x12]
8:E9A0  68b90f               push 0xfb9
8:E9A3  66ff760a             push dword ptr [bp + 0xa]
8:E9A7  6a01                 push 1
8:E9A9  66ff7606             push dword ptr [bp + 6]
8:E9AD  9a28773ce9           lcall 0xe93c, 0x7728  ; sub_s9:7728
8:E9B2  c45e06               les bx, ptr [bp + 6]
8:E9B5  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
8:E9BF  26c70732eb           mov word ptr es:[bx], 0xeb32
8:E9C4  26c7470230e9         mov word ptr es:[bx + 2], 0xe930  ; SEGMENT s8:0000
8:E9CA  6a30                 push 0x30
8:E9CC  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:E9D1  9aba2035e7           lcall 0xe735, 0x20ba  ; sub_s3:20BA
8:E9D6  c45e06               les bx, ptr [bp + 6]
8:E9D9  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:E9DE  2689979000           mov word ptr es:[bx + 0x90], dx
8:E9E3  8bc3                 mov ax, bx
8:E9E5  8cc2                 mov dx, es
8:E9E7  c9                   leave
8:E9E8  ca0e00               retf 0xe
8:E9EB  db 00

; ---------------- sub_s8:E9EC FAR size=44 callers=1
8:E9EC  55                   push bp
8:E9ED  8bec                 mov bp, sp
8:E9EF  c45e06               les bx, ptr [bp + 6]
8:E9F2  26c70732eb           mov word ptr es:[bx], 0xeb32
8:E9F7  26c74702c8e9         mov word ptr es:[bx + 2], 0xe9c8  ; SEGMENT s8:0000
8:E9FD  26ff7706             push word ptr es:[bx + 6]
8:EA01  66ff367c5b           push dword ptr [0x5b7c]
8:EA06  90                   nop
8:EA07  0e                   push cs
8:EA08  e8d5cc               call 0xb6e0  ; sub_s8:B6E0
8:EA0B  66ff7606             push dword ptr [bp + 6]
8:EA0F  9a2c78b0e9           lcall 0xe9b0, 0x782c  ; sub_s9:782C
8:EA14  c9                   leave
8:EA15  ca0400               retf 4

; ---------------- sub_s8:EA18 size=138 callers=0
;   apis: USER.GetDlgItem, USER.GetSystemMetrics, USER.GetWindowRect, USER.SendMessage, USER.ShowWindow
8:EA18  c8120000             enter 0x12, 0
8:EA1C  66ff7606             push dword ptr [bp + 6]
8:EA20  9ae2788eea           lcall 0xea8e, 0x78e2  ; sub_s9:78E2
8:EA25  c45e06               les bx, ptr [bp + 6]
8:EA28  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:EA2E  9a5e37d4e9           lcall 0xe9d4, 0x375e  ; sub_s3:375E
8:EA33  8946fc               mov word ptr [bp - 4], ax
8:EA36  8956fe               mov word ptr [bp - 2], dx
8:EA39  c45e06               les bx, ptr [bp + 6]
8:EA3C  26ff7706             push word ptr es:[bx + 6]
8:EA40  68a50f               push 0xfa5
8:EA43  9a1fd40000           lcall 0, 0xd41f  ; USER.GetDlgItem
8:EA48  8946fa               mov word ptr [bp - 6], ax
8:EA4B  50                   push ax
8:EA4C  666800000c00         push 0xc0000
8:EA52  66ff76fc             push dword ptr [bp - 4]
8:EA56  9a25e20000           lcall 0, 0xe225  ; USER.SendMessage
8:EA5B  c45e06               les bx, ptr [bp + 6]
8:EA5E  26ff7708             push word ptr es:[bx + 8]
8:EA62  8d46f2               lea ax, [bp - 0xe]
8:EA65  16                   push ss
8:EA66  50                   push ax
8:EA67  9a41c30000           lcall 0, 0xc341  ; USER.GetWindowRect
8:EA6C  8b46f2               mov ax, word ptr [bp - 0xe]
8:EA6F  050500               add ax, 5
8:EA72  8946f0               mov word ptr [bp - 0x10], ax
8:EA75  50                   push ax
8:EA76  6a04                 push 4
8:EA78  9a63a20000           lcall 0, 0xa263  ; USER.GetSystemMetrics
8:EA7D  0346f4               add ax, word ptr [bp - 0xc]
8:EA80  050500               add ax, 5
8:EA83  8946ee               mov word ptr [bp - 0x12], ax
8:EA86  50                   push ax
8:EA87  66ff7606             push dword ptr [bp + 6]
8:EA8B  9a6c8212ea           lcall 0xea12, 0x826c  ; sub_s9:826C
8:EA90  c45e06               les bx, ptr [bp + 6]
8:EA93  26ff7706             push word ptr es:[bx + 6]
8:EA97  6a05                 push 5
8:EA99  9a74e70000           lcall 0, 0xe774  ; USER.ShowWindow
8:EA9E  c9                   leave
8:EA9F  ca0400               retf 4

; ---------------- sub_s8:EAA2 size=102 callers=0
;   apis: USER.DestroyWindow, USER.GetDlgItem, USER.PostMessage, USER.SendMessage
8:EAA2  c8540000             enter 0x54, 0
8:EAA6  837e0a00             cmp word ptr [bp + 0xa], 0
8:EAAA  744b                 je 0xeaf7
8:EAAC  c45e06               les bx, ptr [bp + 6]
8:EAAF  26ff7706             push word ptr es:[bx + 6]
8:EAB3  68a50f               push 0xfa5
8:EAB6  9a44ea0000           lcall 0, 0xea44  ; USER.GetDlgItem
8:EABB  8946ac               mov word ptr [bp - 0x54], ax
8:EABE  50                   push ax
8:EABF  666850000d00         push 0xd0050
8:EAC5  8d46ae               lea ax, [bp - 0x52]
8:EAC8  16                   push ss
8:EAC9  50                   push ax
8:EACA  9a57ea0000           lcall 0, 0xea57  ; USER.SendMessage
8:EACF  8d46ae               lea ax, [bp - 0x52]
8:EAD2  16                   push ss
8:EAD3  50                   push ax
8:EAD4  c45e06               les bx, ptr [bp + 6]
8:EAD7  6626ffb78e00         push dword ptr es:[bx + 0x8e]
8:EADD  9a703731ea           lcall 0xea31, 0x3770  ; sub_s3:3770
8:EAE2  c45e06               les bx, ptr [bp + 6]
8:EAE5  26ff7708             push word ptr es:[bx + 8]
8:EAE9  6668fb001101         push 0x11100fb
8:EAEF  666a00               push 0
8:EAF2  9ab4dd0000           lcall 0, 0xddb4  ; USER.PostMessage
loc_EAF7:
8:EAF7  c45e06               les bx, ptr [bp + 6]
8:EAFA  26ff7706             push word ptr es:[bx + 6]
8:EAFE  9a98e70000           lcall 0, 0xe798  ; USER.DestroyWindow
8:EB03  c9                   leave
8:EB04  ca0600               retf 6
8:EB07  db 00

; ---------------- sub_s8:EB08 FAR size=4 callers=0
8:EB08  ca0400               retf 4
8:EB0B  db 00

; ---------------- sub_s8:EB0C FAR size=146 callers=0
8:EB0C  55                   push bp
8:EB0D  8bec                 mov bp, sp
8:EB0F  66ff7606             push dword ptr [bp + 6]
8:EB13  90                   nop
8:EB14  0e                   push cs
8:EB15  e8d4fe               call 0xe9ec  ; sub_s8:E9EC
8:EB18  f6460a01             test byte ptr [bp + 0xa], 1
8:EB1C  7409                 je 0xeb27
8:EB1E  66ff7606             push dword ptr [bp + 6]
8:EB22  9ace1721e9           lcall 0xe921, 0x17ce  ; operator_delete@s1:17CE
loc_EB27:
8:EB27  8b4606               mov ax, word ptr [bp + 6]
8:EB2A  8b5608               mov dx, word ptr [bp + 8]
8:EB2D  c9                   leave
8:EB2E  ca0600               retf 6
8:EB31  db 90 0c eb 3c eb 10 3a 34 e9 18 ea 48 eb c0 79 44
8:EB41  db eb 3c 7b 4c eb a2 ea 58 eb 56 7f 50 eb b2 7b 54
8:EB51  db eb 1c 7f 5c eb 08 eb 94 eb 86 7f 60 eb 0c 80 64
8:EB61  db eb 54 80 68 eb 5e 7e 6c eb 58 81 70 eb b6 81 74
8:EB71  db eb fe 81 7c eb ea 60 88 eb 4a 82 80 eb 66 82 84
8:EB81  db eb de 78 9c eb ee 60 8c eb f4 60 90 eb fa 60 98
8:EB91  db eb a4 a2 fb e9 fe 60 74 e9 7e 80 23 ea

; ---------------- sub_s8:EB9E FAR size=56 callers=1
8:EB9E  55                   push bp
8:EB9F  8bec                 mov bp, sp
8:EBA1  ff760a               push word ptr [bp + 0xa]
8:EBA4  66680000c701         push 0x1c70000
8:EBAA  666a01               push 1
8:EBAD  66ff7606             push dword ptr [bp + 6]
8:EBB1  9a287740eb           lcall 0xeb40, 0x7728  ; sub_s9:7728
8:EBB6  c45e06               les bx, ptr [bp + 6]
8:EBB9  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
8:EBC3  26c7076eee           mov word ptr es:[bx], 0xee6e
8:EBC8  26c7470234eb         mov word ptr es:[bx + 2], 0xeb34  ; SEGMENT s8:0000
8:EBCE  8bc3                 mov ax, bx
8:EBD0  8cc2                 mov dx, es
8:EBD2  c9                   leave
8:EBD3  ca0600               retf 6

; ---------------- sub_s8:EBD6 FAR size=64 callers=1
8:EBD6  c8080000             enter 8, 0
8:EBDA  c45e06               les bx, ptr [bp + 6]
8:EBDD  26c7076eee           mov word ptr es:[bx], 0xee6e
8:EBE2  26c74702cceb         mov word ptr es:[bx + 2], 0xebcc  ; SEGMENT s8:0000
8:EBE8  26ff7706             push word ptr es:[bx + 6]
8:EBEC  66ff367c5b           push dword ptr [0x5b7c]
8:EBF1  90                   nop
8:EBF2  0e                   push cs
8:EBF3  e8eaca               call 0xb6e0  ; sub_s8:B6E0
8:EBF6  c45e06               les bx, ptr [bp + 6]
8:EBF9  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
8:EBFF  6650                 push eax
8:EC01  9ace1725eb           lcall 0xeb25, 0x17ce  ; operator_delete@s1:17CE
8:EC06  83c404               add sp, 4
8:EC09  66ff7606             push dword ptr [bp + 6]
8:EC0D  9a2c78b4eb           lcall 0xebb4, 0x782c  ; sub_s9:782C
8:EC12  c9                   leave
8:EC13  ca0400               retf 4

; ---------------- sub_s8:EC16 size=372 callers=0
;   apis: USER.MapDialogRect, USER.ShowWindow
8:EC16  c8240000             enter 0x24, 0
8:EC1A  57                   push di
8:EC1B  56                   push si
8:EC1C  66ff7606             push dword ptr [bp + 6]
8:EC20  9ae278c7ec           lcall 0xecc7, 0x78e2  ; sub_s9:78E2
8:EC25  6a2b                 push 0x2b
8:EC27  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:EC2C  9aba203cec           lcall 0xec3c, 0x20ba  ; sub_s3:20BA
8:EC31  8946fc               mov word ptr [bp - 4], ax
8:EC34  8956fe               mov word ptr [bp - 2], dx
8:EC37  52                   push dx
8:EC38  50                   push ax
8:EC39  9a9208e0ec           lcall 0xece0, 0x892  ; sub_s3:0892
8:EC3E  8946fa               mov word ptr [bp - 6], ax
8:EC41  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
8:EC47  7409                 je 0xec52
8:EC49  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
8:EC4C  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
8:EC50  eb05                 jmp 0xec57
loc_EC52:
8:EC52  9a0a1670ec           lcall 0xec70, 0x160a  ; SH_DefaultPool@s1:160A
loc_EC57:
8:EC57  8946e8               mov word ptr [bp - 0x18], ax
8:EC5A  8956ea               mov word ptr [bp - 0x16], dx
8:EC5D  52                   push dx
8:EC5E  50                   push ax
8:EC5F  6a01                 push 1
8:EC61  8b46fa               mov ax, word ptr [bp - 6]
8:EC64  050200               add ax, 2
8:EC67  c1e002               shl ax, 2
8:EC6A  6a00                 push 0
8:EC6C  50                   push ax
8:EC6D  9a081718ed           lcall 0xed18, 0x1708  ; SH_MemAllocPtr@s1:1708
8:EC72  83c40a               add sp, 0xa
8:EC75  c45e06               les bx, ptr [bp + 6]
8:EC78  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:EC7D  2689979000           mov word ptr es:[bx + 0x90], dx
8:EC82  c746f80100           mov word ptr [bp - 8], 1
8:EC87  eb43                 jmp 0xeccc
8:EC89  db 90
loc_EC8A:
8:EC8A  c45e06               les bx, ptr [bp + 6]
8:EC8D  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:EC92  8b76f8               mov si, word ptr [bp - 8]
8:EC95  c1e602               shl si, 2
8:EC98  6626c70000000000     mov dword ptr es:[bx + si], 0
loc_ECA0:
8:ECA0  c45e06               les bx, ptr [bp + 6]
8:ECA3  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:ECA8  8b76f8               mov si, word ptr [bp - 8]
8:ECAB  c1e602               shl si, 2
8:ECAE  6626833800           cmp dword ptr es:[bx + si], 0
8:ECB3  7414                 je 0xecc9
8:ECB5  8cc0                 mov ax, es
8:ECB7  c47ee8               les di, ptr [bp - 0x18]
8:ECBA  26ff7506             push word ptr es:[di + 6]
8:ECBE  8ec0                 mov es, ax
8:ECC0  6626ff30             push dword ptr es:[bx + si]
8:ECC4  9a349274ed           lcall 0xed74, 0x9234  ; sub_s9:9234
loc_ECC9:
8:ECC9  ff46f8               inc word ptr [bp - 8]
loc_ECCC:
8:ECCC  8b46fa               mov ax, word ptr [bp - 6]
8:ECCF  3946f8               cmp word ptr [bp - 8], ax
8:ECD2  0f8f9400             jg 0xed6a
8:ECD6  ff76f8               push word ptr [bp - 8]
8:ECD9  66ff76fc             push dword ptr [bp - 4]
8:ECDD  9a3209e0ea           lcall 0xeae0, 0x932  ; sub_s3:0932
8:ECE2  8ec2                 mov es, dx
8:ECE4  8bd8                 mov bx, ax
8:ECE6  8946e8               mov word ptr [bp - 0x18], ax
8:ECE9  8c46ea               mov word ptr [bp - 0x16], es
8:ECEC  268b07               mov ax, word ptr es:[bx]
8:ECEF  8946e0               mov word ptr [bp - 0x20], ax
8:ECF2  268b4702             mov ax, word ptr es:[bx + 2]
8:ECF6  8946e2               mov word ptr [bp - 0x1e], ax
8:ECF9  b80100               mov ax, 1
8:ECFC  8946e4               mov word ptr [bp - 0x1c], ax
8:ECFF  8946e6               mov word ptr [bp - 0x1a], ax
8:ED02  c45e06               les bx, ptr [bp + 6]
8:ED05  26ff7706             push word ptr es:[bx + 6]
8:ED09  8d46e0               lea ax, [bp - 0x20]
8:ED0C  16                   push ss
8:ED0D  50                   push ax
8:ED0E  9a41e40000           lcall 0, 0xe441  ; USER.MapDialogRect
8:ED13  6a42                 push 0x42
8:ED15  9a9c1704ec           lcall 0xec04, 0x179c  ; operator_new@s1:179C
8:ED1A  83c402               add sp, 2
8:ED1D  8946dc               mov word ptr [bp - 0x24], ax
8:ED20  8956de               mov word ptr [bp - 0x22], dx
8:ED23  0bd0                 or dx, ax
8:ED25  0f8461ff             je 0xec8a
8:ED29  c45e06               les bx, ptr [bp + 6]
8:ED2C  26ff7706             push word ptr es:[bx + 6]
8:ED30  c45ee8               les bx, ptr [bp - 0x18]
8:ED33  26ff7704             push word ptr es:[bx + 4]
8:ED37  66680001ff00         push 0xff0100
8:ED3D  680101               push 0x101
8:ED40  ff76e0               push word ptr [bp - 0x20]
8:ED43  ff76e2               push word ptr [bp - 0x1e]
8:ED46  6a00                 push 0
8:ED48  ff76de               push word ptr [bp - 0x22]
8:ED4B  50                   push ax
8:ED4C  9ad63b38eb           lcall 0xeb38, 0x3bd6  ; sub_s2:3BD6
8:ED51  c45e06               les bx, ptr [bp + 6]
8:ED54  26c49f8e00           les bx, ptr es:[bx + 0x8e]
8:ED59  8b76f8               mov si, word ptr [bp - 8]
8:ED5C  c1e602               shl si, 2
8:ED5F  268900               mov word ptr es:[bx + si], ax
8:ED62  26895002             mov word ptr es:[bx + si + 2], dx
8:ED66  e937ff               jmp 0xeca0
8:ED69  db 90
loc_ED6A:
8:ED6A  666aff               push -1
8:ED6D  66ff7606             push dword ptr [bp + 6]
8:ED71  9a6c8210ec           lcall 0xec10, 0x826c  ; sub_s9:826C
8:ED76  c45e06               les bx, ptr [bp + 6]
8:ED79  26ff7706             push word ptr es:[bx + 6]
8:ED7D  6a05                 push 5
8:ED7F  9a9aea0000           lcall 0, 0xea9a  ; USER.ShowWindow
8:ED84  5e                   pop si
8:ED85  5f                   pop di
8:ED86  c9                   leave
8:ED87  ca0400               retf 4

; ---------------- sub_s8:ED8A size=190 callers=0
;   apis: USER.SendMessage
8:ED8A  c81c0000             enter 0x1c, 0
8:ED8E  8b460e               mov ax, word ptr [bp + 0xe]
8:ED91  2dc801               sub ax, 0x1c8
8:ED94  0f849600             je 0xee2e
8:ED98  48                   dec ax
8:ED99  7419                 je 0xedb4
8:ED9B  48                   dec ax
8:ED9C  0f848e00             je 0xee2e
8:EDA0  66ff760c             push dword ptr [bp + 0xc]
8:EDA4  66ff7608             push dword ptr [bp + 8]
8:EDA8  ff7606               push word ptr [bp + 6]
8:EDAB  9a3c7b23ec           lcall 0xec23, 0x7b3c  ; sub_s9:7B3C
8:EDB0  c9                   leave
8:EDB1  ca0a00               retf 0xa
loc_EDB4:
8:EDB4  6a2f                 push 0x2f
8:EDB6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:EDBB  9aba2002ee           lcall 0xee02, 0x20ba  ; sub_s3:20BA
8:EDC0  8946fc               mov word ptr [bp - 4], ax
8:EDC3  8956fe               mov word ptr [bp - 2], dx
8:EDC6  c45efc               les bx, ptr [bp - 4]
8:EDC9  268b4720             mov ax, word ptr es:[bx + 0x20]
8:EDCD  268b5722             mov dx, word ptr es:[bx + 0x22]
8:EDD1  8946f8               mov word ptr [bp - 8], ax
8:EDD4  8bc2                 mov ax, dx
8:EDD6  0b46f8               or ax, word ptr [bp - 8]
8:EDD9  7465                 je 0xee40
8:EDDB  52                   push dx
8:EDDC  ff76f8               push word ptr [bp - 8]
8:EDDF  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
8:EDE4  9aece11fe5           lcall 0xe51f, 0xe1ec  ; Db::resolveHandle@s6:E1EC
8:EDE9  8956f6               mov word ptr [bp - 0xa], dx
8:EDEC  0bd0                 or dx, ax
8:EDEE  7450                 je 0xee40
8:EDF0  ff76f6               push word ptr [bp - 0xa]
8:EDF3  50                   push ax
8:EDF4  9a005b6abc           lcall 0xbc6a, 0x5b00  ; sub_s7:5B00
8:EDF9  50                   push ax
8:EDFA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:EDFF  9aba202fec           lcall 0xec2f, 0x20ba  ; sub_s3:20BA
8:EE04  8956f2               mov word ptr [bp - 0xe], dx
8:EE07  0bd0                 or dx, ax
8:EE09  7435                 je 0xee40
8:EE0B  ff76f2               push word ptr [bp - 0xe]
8:EE0E  50                   push ax
8:EE0F  9ad40a78eb           lcall 0xeb78, 0xad4  ; sub_s4:0AD4
8:EE14  8946ec               mov word ptr [bp - 0x14], ax
8:EE17  8956ee               mov word ptr [bp - 0x12], dx
8:EE1A  0bd0                 or dx, ax
8:EE1C  7422                 je 0xee40
8:EE1E  c45eec               les bx, ptr [bp - 0x14]
8:EE21  26ff7708             push word ptr es:[bx + 8]
8:EE25  666872001101         push 0x1110072
8:EE2B  eb0b                 jmp 0xee38
8:EE2D  db 90
loc_EE2E:
8:EE2E  ff369603             push word ptr [0x396]
8:EE32  681101               push 0x111
8:EE35  ff760e               push word ptr [bp + 0xe]
loc_EE38:
8:EE38  666a00               push 0
8:EE3B  9acbea0000           lcall 0, 0xeacb  ; USER.SendMessage
loc_EE40:
8:EE40  33c0                 xor ax, ax
8:EE42  99                   cdq
8:EE43  c9                   leave
8:EE44  ca0a00               retf 0xa
8:EE47  db 00

; ---------------- sub_s8:EE48 FAR size=146 callers=0
8:EE48  55                   push bp
8:EE49  8bec                 mov bp, sp
8:EE4B  66ff7606             push dword ptr [bp + 6]
8:EE4F  90                   nop
8:EE50  0e                   push cs
8:EE51  e882fd               call 0xebd6  ; sub_s8:EBD6
8:EE54  f6460a01             test byte ptr [bp + 0xa], 1
8:EE58  7409                 je 0xee63
8:EE5A  66ff7606             push dword ptr [bp + 6]
8:EE5E  9ace1755ec           lcall 0xec55, 0x17ce  ; operator_delete@s1:17CE
loc_EE63:
8:EE63  8b4606               mov ax, word ptr [bp + 6]
8:EE66  8b5608               mov dx, word ptr [bp + 8]
8:EE69  c9                   leave
8:EE6A  ca0600               retf 6
8:EE6D  db 90 48 ee 78 ee 10 3a 4f ed 16 ec 80 ee c0 79 84
8:EE7D  db ee 8a ed d0 ee 98 7b 88 ee 56 7f 8c ee b2 7b 90
8:EE8D  db ee 1c 7f 94 ee 12 82 98 ee 86 7f 9c ee 0c 80 a0
8:EE9D  db ee 54 80 a4 ee 5e 7e a8 ee 58 81 ac ee b6 81 b0
8:EEAD  db ee fe 81 b8 ee ea 60 c4 ee 4a 82 bc ee 66 82 c0
8:EEBD  db ee de 78 d8 ee ee 60 c8 ee f4 60 cc ee fa 60 d4
8:EECD  db ee a4 a2 e6 eb fe 60 12 ee 7e 80 ae ed

; ---------------- sub_s8:EEDA FAR size=96 callers=1
8:EEDA  55                   push bp
8:EEDB  8bec                 mov bp, sp
8:EEDD  ff760a               push word ptr [bp + 0xa]
8:EEE0  666800006601         push 0x1660000
8:EEE6  666a01               push 1
8:EEE9  66ff7606             push dword ptr [bp + 6]
8:EEED  9a287711ef           lcall 0xef11, 0x7728  ; sub_s9:7728
8:EEF2  c45e06               les bx, ptr [bp + 6]
8:EEF5  662bc0               sub eax, eax
8:EEF8  662689878e00         mov dword ptr es:[bx + 0x8e], eax
8:EEFE  2689879200           mov word ptr es:[bx + 0x92], ax
8:EF03  2689879400           mov word ptr es:[bx + 0x94], ax
8:EF08  26c7077c06           mov word ptr es:[bx], 0x67c
8:EF0D  26c747027cee         mov word ptr es:[bx + 2], 0xee7c  ; SEGMENT s9:0000
8:EF13  6a09                 push 9
8:EF15  66ff36d00e           push dword ptr [0xed0]  ; g_registry
8:EF1A  9aba20beed           lcall 0xedbe, 0x20ba  ; sub_s3:20BA
8:EF1F  c45e06               les bx, ptr [bp + 6]
8:EF22  2689878e00           mov word ptr es:[bx + 0x8e], ax
8:EF27  2689979000           mov word ptr es:[bx + 0x90], dx
8:EF2C  26c747740100         mov word ptr es:[bx + 0x74], 1
8:EF32  8bc3                 mov ax, bx
8:EF34  8cc2                 mov dx, es
8:EF36  c9                   leave
8:EF37  ca0600               retf 6

; ---------------- sub_s8:EF3A FAR size=87 callers=1
;   apis: USER.DestroyWindow
8:EF3A  c8060000             enter 6, 0
8:EF3E  c45e06               les bx, ptr [bp + 6]
8:EF41  26c7077c06           mov word ptr es:[bx], 0x67c
8:EF46  26c747028bef         mov word ptr es:[bx + 2], 0xef8b  ; SEGMENT s9:0000
8:EF4C  662683bf960000       cmp dword ptr es:[bx + 0x96], 0
8:EF53  741e                 je 0xef73
8:EF55  c45e06               les bx, ptr [bp + 6]
8:EF58  26c49f9600           les bx, ptr es:[bx + 0x96]
8:EF5D  26ff7706             push word ptr es:[bx + 6]
8:EF61  9affea0000           lcall 0, 0xeaff  ; USER.DestroyWindow
8:EF66  c45e06               les bx, ptr [bp + 6]
8:EF69  6626c787960000000000 mov dword ptr es:[bx + 0x96], 0
loc_EF73:
8:EF73  c45e06               les bx, ptr [bp + 6]
8:EF76  26ff7706             push word ptr es:[bx + 6]
8:EF7A  66ff367c5b           push dword ptr [0x5b7c]
8:EF7F  90                   nop
8:EF80  0e                   push cs
8:EF81  e85cc7               call 0xb6e0  ; sub_s8:B6E0
8:EF84  66ff7606             push dword ptr [bp + 6]
8:EF88  9a2c78f0ee           lcall 0xeef0, 0x782c  ; sub_s9:782C
8:EF8D  c9                   leave
8:EF8E  ca0400               retf 4
