; OUTPOST.EXE segment 4 (CODE), 61034 bytes

; ---------------- View::load@s4:0000 size=380 callers=0
;   chunk 0x02: current planet, star, site, colony, positions
4:0000  c8280000             enter 0x28, 0
4:0004  6a02                 push 2
4:0006  66ff760a             push dword ptr [bp + 0xa]
4:000A  9afe7c3300           lcall 0x33, 0x7cfe  ; Save_findChunkTag@s2:7CFE
4:000F  0bc0                 or ax, ax
4:0011  750d                 jne 0x20
4:0013  c7061003d406         mov word ptr [0x310], 0x6d4
loc_0019:
4:0019  33c0                 xor ax, ax
4:001B  c9                   leave
4:001C  ca0800               retf 8
4:001F  db 90
loc_0020:
4:0020  666a04               push 4
4:0023  668b4606             mov eax, dword ptr [bp + 6]
4:0027  051600               add ax, 0x16
4:002A  6650                 push eax
4:002C  66ff760a             push dword ptr [bp + 0xa]
4:0030  9aee7d5500           lcall 0x55, 0x7dee  ; File_read@s2:7DEE
4:0035  0bc0                 or ax, ax
4:0037  7509                 jne 0x42
loc_0039:
4:0039  c7061003d206         mov word ptr [0x310], 0x6d2
4:003F  ebd8                 jmp 0x19
4:0041  db 90
loc_0042:
4:0042  666a04               push 4
4:0045  668b4606             mov eax, dword ptr [bp + 6]
4:0049  051a00               add ax, 0x1a
4:004C  6650                 push eax
4:004E  66ff760a             push dword ptr [bp + 0xa]
4:0052  9aee7d6e00           lcall 0x6e, 0x7dee  ; File_read@s2:7DEE
4:0057  0bc0                 or ax, ax
4:0059  74de                 je 0x39
4:005B  666a04               push 4
4:005E  668b4606             mov eax, dword ptr [bp + 6]
4:0062  052000               add ax, 0x20
4:0065  6650                 push eax
4:0067  66ff760a             push dword ptr [bp + 0xa]
4:006B  9aee7d8700           lcall 0x87, 0x7dee  ; File_read@s2:7DEE
4:0070  0bc0                 or ax, ax
4:0072  74c5                 je 0x39
4:0074  666a04               push 4
4:0077  668b4606             mov eax, dword ptr [bp + 6]
4:007B  052400               add ax, 0x24
4:007E  6650                 push eax
4:0080  66ff760a             push dword ptr [bp + 0xa]
4:0084  9aee7da000           lcall 0xa0, 0x7dee  ; File_read@s2:7DEE
4:0089  0bc0                 or ax, ax
4:008B  74ac                 je 0x39
4:008D  666a02               push 2
4:0090  668b4606             mov eax, dword ptr [bp + 6]
4:0094  053000               add ax, 0x30
4:0097  6650                 push eax
4:0099  66ff760a             push dword ptr [bp + 0xa]
4:009D  9aee7db900           lcall 0xb9, 0x7dee  ; File_read@s2:7DEE
4:00A2  0bc0                 or ax, ax
4:00A4  7493                 je 0x39
4:00A6  666a02               push 2
4:00A9  668b4606             mov eax, dword ptr [bp + 6]
4:00AD  053200               add ax, 0x32
4:00B0  6650                 push eax
4:00B2  66ff760a             push dword ptr [bp + 0xa]
4:00B6  9aee7d1f01           lcall 0x11f, 0x7dee  ; File_read@s2:7DEE
4:00BB  0bc0                 or ax, ax
4:00BD  0f8478ff             je 0x39
4:00C1  c45e06               les bx, ptr [bp + 6]
4:00C4  26837f3000           cmp word ptr es:[bx + 0x30], 0
4:00C9  0f84a700             je 0x174
4:00CD  268b4732             mov ax, word ptr es:[bx + 0x32]
4:00D1  8bc8                 mov cx, ax
4:00D3  03c0                 add ax, ax
4:00D5  03c1                 add ax, cx
4:00D7  03c0                 add ax, ax
4:00D9  8946de               mov word ptr [bp - 0x22], ax
4:00DC  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
4:00E2  740a                 je 0xee
4:00E4  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
4:00E7  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
4:00EB  eb06                 jmp 0xf3
4:00ED  db 90
loc_00EE:
4:00EE  9a0a160701           lcall 0x107, 0x160a  ; SH_DefaultPool@s1:160A
loc_00F3:
4:00F3  8946d8               mov word ptr [bp - 0x28], ax
4:00F6  8956da               mov word ptr [bp - 0x26], dx
4:00F9  52                   push dx
4:00FA  50                   push ax
4:00FB  666800000100         push 0x10000
4:0101  ff76de               push word ptr [bp - 0x22]
4:0104  9a0817ffff           lcall 0xffff, 0x1708  ; SH_MemAllocPtr@s1:1708
4:0109  83c40a               add sp, 0xa
4:010C  c45e06               les bx, ptr [bp + 6]
4:010F  2689472c             mov word ptr es:[bx + 0x2c], ax
4:0113  2689572e             mov word ptr es:[bx + 0x2e], dx
4:0117  8d46e2               lea ax, [bp - 0x1e]
4:011A  16                   push ss
4:011B  50                   push ax
4:011C  9a383e4701           lcall 0x147, 0x3e38  ; Pos3::Pos3@s2:3E38
4:0121  c746f20000           mov word ptr [bp - 0xe], 0
4:0126  eb24                 jmp 0x14c
loc_0128:
4:0128  8d46e2               lea ax, [bp - 0x1e]
4:012B  16                   push ss
4:012C  50                   push ax
4:012D  c45e06               les bx, ptr [bp + 6]
4:0130  66268b472c           mov eax, dword ptr es:[bx + 0x2c]
4:0135  8b4ef2               mov cx, word ptr [bp - 0xe]
4:0138  8bd9                 mov bx, cx
4:013A  03c9                 add cx, cx
4:013C  03cb                 add cx, bx
4:013E  03c9                 add cx, cx
4:0140  03c1                 add ax, cx
4:0142  6650                 push eax
4:0144  9a623f6401           lcall 0x164, 0x3f62  ; Pos3::assign@s2:3F62
4:0149  ff46f2               inc word ptr [bp - 0xe]
loc_014C:
4:014C  8b46f2               mov ax, word ptr [bp - 0xe]
4:014F  c45e06               les bx, ptr [bp + 6]
4:0152  26394730             cmp word ptr es:[bx + 0x30], ax
4:0156  7e1c                 jle 0x174
4:0158  8d46e2               lea ax, [bp - 0x1e]
4:015B  16                   push ss
4:015C  50                   push ax
4:015D  66ff760a             push dword ptr [bp + 0xa]
4:0161  9ac87bffff           lcall 0xffff, 0x7bc8  ; Save_readPos3@s2:7BC8
4:0166  0bc0                 or ax, ax
4:0168  75be                 jne 0x128
4:016A  c7061003d006         mov word ptr [0x310], 0x6d0
4:0170  e9a6fe               jmp 0x19
4:0173  db 90
loc_0174:
4:0174  b80100               mov ax, 1
4:0177  c9                   leave
4:0178  ca0800               retf 8
4:017B  db 00

; ---------------- View::setField1E@s4:017C FAR size=26 callers=1
;   +0x1E, notice 4
4:017C  55                   push bp
4:017D  8bec                 mov bp, sp
4:017F  8b460a               mov ax, word ptr [bp + 0xa]
4:0182  c45e06               les bx, ptr [bp + 6]
4:0185  2689471e             mov word ptr es:[bx + 0x1e], ax
4:0189  6a04                 push 4
4:018B  06                   push es
4:018C  53                   push bx
4:018D  9a621fffff           lcall 0xffff, 0x1f62  ; RegObj::notify@s3:1F62
4:0192  c9                   leave
4:0193  ca0600               retf 6

; ---------------- MapViews::registerView@s4:0196 FAR size=246 callers=2
;   records a map view (positions list) for a colony
4:0196  c8300000             enter 0x30, 0
4:019A  66ff760e             push dword ptr [bp + 0xe]
4:019E  66ff364857           push dword ptr [0x5748]  ; g_sim
4:01A3  9a44833602           lcall 0x236, 0x8344  ; Sim::resolve@s7:8344
4:01A8  c45e06               les bx, ptr [bp + 6]
4:01AB  6626837f2c00         cmp dword ptr es:[bx + 0x2c], 0
4:01B1  753b                 jne 0x1ee
4:01B3  26c747320500         mov word ptr es:[bx + 0x32], 5
4:01B9  c746e41e00           mov word ptr [bp - 0x1c], 0x1e
4:01BE  66833e2c5f00         cmp dword ptr [0x5f2c], 0  ; g_defaultHeap
4:01C4  740a                 je 0x1d0
4:01C6  a12c5f               mov ax, word ptr [0x5f2c]  ; g_defaultHeap
4:01C9  8b162e5f             mov dx, word ptr [0x5f2e]  ; g_defaultHeap+2
4:01CD  eb06                 jmp 0x1d5
4:01CF  db 90
loc_01D0:
4:01D0  9a0a16e601           lcall 0x1e6, 0x160a  ; SH_DefaultPool@s1:160A
loc_01D5:
4:01D5  8956d6               mov word ptr [bp - 0x2a], dx
4:01D8  52                   push dx
4:01D9  50                   push ax
4:01DA  666800000100         push 0x10000
4:01E0  ff76e4               push word ptr [bp - 0x1c]
4:01E3  9a08171d02           lcall 0x21d, 0x1708  ; SH_MemAllocPtr@s1:1708
4:01E8  83c40a               add sp, 0xa
4:01EB  eb32                 jmp 0x21f
4:01ED  db 90
loc_01EE:
4:01EE  268b4730             mov ax, word ptr es:[bx + 0x30]
4:01F2  40                   inc ax
4:01F3  263b4732             cmp ax, word ptr es:[bx + 0x32]
4:01F7  7c31                 jl 0x22a
4:01F9  2683473205           add word ptr es:[bx + 0x32], 5
4:01FE  268b4732             mov ax, word ptr es:[bx + 0x32]
4:0202  8bc8                 mov cx, ax
4:0204  03c0                 add ax, ax
4:0206  03c1                 add ax, cx
4:0208  03c0                 add ax, ax
4:020A  c746d60000           mov word ptr [bp - 0x2a], 0
4:020F  6626ff772c           push dword ptr es:[bx + 0x2c]
4:0214  ff76d6               push word ptr [bp - 0x2a]
4:0217  50                   push ax
4:0218  6a01                 push 1
4:021A  9ad40ef100           lcall 0xf1, 0xed4  ; SH_MemReAllocPtr@s1:0ED4
loc_021F:
4:021F  c45e06               les bx, ptr [bp + 6]
4:0222  2689472c             mov word ptr es:[bx + 0x2c], ax
4:0226  2689572e             mov word ptr es:[bx + 0x2e], dx
loc_022A:
4:022A  66ff760a             push dword ptr [bp + 0xa]
4:022E  66ff364857           push dword ptr [0x5748]  ; g_sim
4:0233  9a44835002           lcall 0x250, 0x8344  ; Sim::resolve@s7:8344
4:0238  8946f4               mov word ptr [bp - 0xc], ax
4:023B  8956f6               mov word ptr [bp - 0xa], dx
4:023E  c45ef4               les bx, ptr [bp - 0xc]
4:0241  66268b4710           mov eax, dword ptr es:[bx + 0x10]
4:0246  6650                 push eax
4:0248  66ff364857           push dword ptr [0x5748]  ; g_sim
4:024D  9a4483ffff           lcall 0xffff, 0x8344  ; Sim::resolve@s7:8344
4:0252  8946ec               mov word ptr [bp - 0x14], ax
4:0255  8956ee               mov word ptr [bp - 0x12], dx
4:0258  c45e06               les bx, ptr [bp + 6]
4:025B  268b4730             mov ax, word ptr es:[bx + 0x30]
4:025F  26ff4730             inc word ptr es:[bx + 0x30]
4:0263  8946d8               mov word ptr [bp - 0x28], ax
4:0266  668b46ec             mov eax, dword ptr [bp - 0x14]
4:026A  050c00               add ax, 0xc
4:026D  6650                 push eax
4:026F  66268b472c           mov eax, dword ptr es:[bx + 0x2c]
4:0274  8b4ed8               mov cx, word ptr [bp - 0x28]
4:0277  8bd9                 mov bx, cx
4:0279  03c9                 add cx, cx
4:027B  03cb                 add cx, bx
4:027D  03c9                 add cx, cx
4:027F  03c1                 add ax, cx
4:0281  6650                 push eax
4:0283  9a623f0d00           lcall 0xd, 0x3f62  ; Pos3::assign@s2:3F62
4:0288  c9                   leave
4:0289  ca0c00               retf 0xc

; ---------------- MapViewModel::build@s4:028C FAR size=350 callers=2
;   builds the site's object list for drawing
4:028C  c8300000             enter 0x30, 0
4:0290  66ff760a             push dword ptr [bp + 0xa]
4:0294  66ff364857           push dword ptr [0x5748]  ; g_sim
4:0299  9a4483a902           lcall 0x2a9, 0x8344  ; Sim::resolve@s7:8344
4:029E  8946fc               mov word ptr [bp - 4], ax
4:02A1  8956fe               mov word ptr [bp - 2], dx
4:02A4  52                   push dx
4:02A5  50                   push ax
4:02A6  9a005bf902           lcall 0x2f9, 0x5b00  ; Site::listIndex@s7:5B00
4:02AB  8946fa               mov word ptr [bp - 6], ax
4:02AE  50                   push ax
4:02AF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:02B4  9aba209001           lcall 0x190, 0x20ba  ; Registry_get@s3:20BA
4:02B9  8946f6               mov word ptr [bp - 0xa], ax
4:02BC  8956f8               mov word ptr [bp - 8], dx
4:02BF  8d46ea               lea ax, [bp - 0x16]
4:02C2  16                   push ss
4:02C3  50                   push ax
4:02C4  9a906c5003           lcall 0x350, 0x6c90  ; Box::Box@s2:6C90
4:02C9  8d46ea               lea ax, [bp - 0x16]
4:02CC  16                   push ss
4:02CD  50                   push ax
4:02CE  66ff76f6             push dword ptr [bp - 0xa]
4:02D2  90                   nop
4:02D3  0e                   push cs
4:02D4  e84708               call 0xb1e  ; MapViewModel::scrollTo@s4:0B1E
4:02D7  8b46ee               mov ax, word ptr [bp - 0x12]
4:02DA  99                   cdq
4:02DB  8946e2               mov word ptr [bp - 0x1e], ax
4:02DE  8956e4               mov word ptr [bp - 0x1c], dx
4:02E1  8bc2                 mov ax, dx
4:02E3  0b46e2               or ax, word ptr [bp - 0x1e]
4:02E6  7416                 je 0x2fe
4:02E8  66ff760a             push dword ptr [bp + 0xa]
4:02EC  8d46ea               lea ax, [bp - 0x16]
4:02EF  16                   push ss
4:02F0  50                   push ax
4:02F1  66ff364057           push dword ptr [0x5740]
4:02F6  9ae4620f03           lcall 0x30f, 0x62e4  ; SiteGrids::tilesInBox@s7:62E4
4:02FB  eb14                 jmp 0x311
4:02FD  db 90
loc_02FE:
4:02FE  66ff760a             push dword ptr [bp + 0xa]
4:0302  8d46ea               lea ax, [bp - 0x16]
4:0305  16                   push ss
4:0306  50                   push ax
4:0307  66ff364057           push dword ptr [0x5740]
4:030C  9a2265a601           lcall 0x1a6, 0x6522  ; SiteGrids::tilesInBox2@s7:6522
loc_0311:
4:0311  8946e6               mov word ptr [bp - 0x1a], ax
4:0314  8956e8               mov word ptr [bp - 0x18], dx
4:0317  8bc2                 mov ax, dx
4:0319  0b46e6               or ax, word ptr [bp - 0x1a]
4:031C  7508                 jne 0x326
4:031E  33c0                 xor ax, ax
4:0320  99                   cdq
4:0321  c9                   leave
4:0322  ca0800               retf 8
4:0325  db 90
loc_0326:
4:0326  66ff7606             push dword ptr [bp + 6]
4:032A  90                   nop
4:032B  0e                   push cs
4:032C  e8c301               call 0x4f2  ; View::deleteCalendar@s4:04F2
4:032F  6a1c                 push 0x1c
4:0331  9a9c17d301           lcall 0x1d3, 0x179c  ; operator_new@s1:179C
4:0336  83c402               add sp, 2
4:0339  8946d0               mov word ptr [bp - 0x30], ax
4:033C  8956d2               mov word ptr [bp - 0x2e], dx
4:033F  0bd0                 or dx, ax
4:0341  741d                 je 0x360
4:0343  666a24               push 0x24
4:0346  666a06               push 6
4:0349  ff76d2               push word ptr [bp - 0x2e]
4:034C  50                   push ax
4:034D  9a9e8ece03           lcall 0x3ce, 0x8e9e  ; PtrArray::PtrArray@s2:8E9E
4:0352  c45e06               les bx, ptr [bp + 6]
4:0355  26894712             mov word ptr es:[bx + 0x12], ax
4:0359  26895714             mov word ptr es:[bx + 0x14], dx
4:035D  eb0d                 jmp 0x36c
4:035F  db 90
loc_0360:
4:0360  c45e06               les bx, ptr [bp + 6]
4:0363  6626c7471200000000   mov dword ptr es:[bx + 0x12], 0
loc_036C:
4:036C  c45ee6               les bx, ptr [bp - 0x1a]
4:036F  06                   push es
4:0370  53                   push bx
4:0371  26c41f               les bx, ptr es:[bx]
4:0374  26ff5f10             lcall es:[bx + 0x10]
4:0378  8946e0               mov word ptr [bp - 0x20], ax
4:037B  c746de0000           mov word ptr [bp - 0x22], 0
4:0380  eb51                 jmp 0x3d3
loc_0382:
4:0382  660fbf46de           movsx eax, word ptr [bp - 0x22]
4:0387  6650                 push eax
4:0389  c45ee6               les bx, ptr [bp - 0x1a]
4:038C  06                   push es
4:038D  53                   push bx
4:038E  26c41f               les bx, ptr es:[bx]
4:0391  26ff5f04             lcall es:[bx + 4]
4:0395  8946d4               mov word ptr [bp - 0x2c], ax
4:0398  8956d6               mov word ptr [bp - 0x2a], dx
4:039B  0bd0                 or dx, ax
4:039D  7431                 je 0x3d0
4:039F  ff76d6               push word ptr [bp - 0x2a]
4:03A2  50                   push ax
4:03A3  8b46de               mov ax, word ptr [bp - 0x22]
4:03A6  b90600               mov cx, 6
4:03A9  99                   cdq
4:03AA  f7f9                 idiv cx
4:03AC  52                   push dx
4:03AD  8b46de               mov ax, word ptr [bp - 0x22]
4:03B0  99                   cdq
4:03B1  f7f9                 idiv cx
4:03B3  50                   push ax
4:03B4  c45e06               les bx, ptr [bp + 6]
4:03B7  6626ff770e           push dword ptr es:[bx + 0xe]
4:03BC  90                   nop
4:03BD  0e                   push cs
4:03BE  e8bbd9               call 0xffffdd7c  ; BuildingSprite::forObject@s4:DD7C
4:03C1  52                   push dx
4:03C2  50                   push ax
4:03C3  c45e06               les bx, ptr [bp + 6]
4:03C6  6626ff7712           push dword ptr es:[bx + 0x12]
4:03CB  9aaa8f8602           lcall 0x286, 0x8faa  ; PtrArray::push@s2:8FAA
loc_03D0:
4:03D0  ff46de               inc word ptr [bp - 0x22]
loc_03D3:
4:03D3  8b46e0               mov ax, word ptr [bp - 0x20]
4:03D6  3946de               cmp word ptr [bp - 0x22], ax
4:03D9  7ca7                 jl 0x382
4:03DB  c45e06               les bx, ptr [bp + 6]
4:03DE  268b4712             mov ax, word ptr es:[bx + 0x12]
4:03E2  268b5714             mov dx, word ptr es:[bx + 0x14]
4:03E6  c9                   leave
4:03E7  ca0800               retf 8

; ---------------- MapViewModel::onNotify@s4:03EA FAR size=40 callers=0
;   (vslot 5) forwards notices
4:03EA  55                   push bp
4:03EB  8bec                 mov bp, sp
4:03ED  8b460a               mov ax, word ptr [bp + 0xa]
4:03F0  eb16                 jmp 0x408
loc_03F2:
4:03F2  ff760a               push word ptr [bp + 0xa]
4:03F5  668b4606             mov eax, dword ptr [bp + 6]
4:03F9  2d0a00               sub ax, 0xa
4:03FC  6650                 push eax
4:03FE  9a621fb702           lcall 0x2b7, 0x1f62  ; RegObj::notify@s3:1F62
4:0403  c9                   leave
4:0404  ca0600               retf 6
4:0407  db 90
loc_0408:
4:0408  2d0500               sub ax, 5
4:040B  74e5                 je 0x3f2
4:040D  c9                   leave
4:040E  ca0600               retf 6
4:0411  db 00

; ---------------- MapViewModel::putBuilding@s4:0412 FAR size=146 callers=1
;   queues SCPutBldg for a tile placement
4:0412  c8380100             enter 0x138, 0
4:0416  c746fe0000           mov word ptr [bp - 2], 0
4:041B  8b4610               mov ax, word ptr [bp + 0x10]
4:041E  2d7300               sub ax, 0x73
4:0421  7c12                 jl 0x435
4:0423  7010                 jo 0x435
4:0425  48                   dec ax
4:0426  48                   dec ax
4:0427  7e07                 jle 0x430
4:0429  48                   dec ax
4:042A  48                   dec ax
4:042B  7c08                 jl 0x435
4:042D  48                   dec ax
4:042E  7f05                 jg 0x435
loc_0430:
4:0430  c746fe0100           mov word ptr [bp - 2], 1
loc_0435:
4:0435  66ff7612             push dword ptr [bp + 0x12]
4:0439  c45e06               les bx, ptr [bp + 6]
4:043C  6626ff7724           push dword ptr es:[bx + 0x24]
4:0441  66ff760c             push dword ptr [bp + 0xc]
4:0445  ff7610               push word ptr [bp + 0x10]
4:0448  ff76fe               push word ptr [bp - 2]
4:044B  ff760a               push word ptr [bp + 0xa]
4:044E  8d86dafe             lea ax, [bp - 0x126]
4:0452  16                   push ss
4:0453  50                   push ax
4:0454  9a3c93ffff           lcall 0xffff, 0x933c  ; SCPutBldg@s6:933C
4:0459  c786d6fe0000         mov word ptr [bp - 0x12a], 0
4:045F  8d86dafe             lea ax, [bp - 0x126]
4:0463  16                   push ss
4:0464  50                   push ax
4:0465  66ff364857           push dword ptr [0x5748]  ; g_sim
4:046A  9a5a839c02           lcall 0x29c, 0x835a  ; Sim::enqueue@s7:835A
4:046F  8986d8fe             mov word ptr [bp - 0x128], ax
4:0473  0bc0                 or ax, ax
4:0475  740d                 je 0x484
4:0477  6a06                 push 6
4:0479  66ff7606             push dword ptr [bp + 6]
4:047D  9a621f0104           lcall 0x401, 0x1f62  ; RegObj::notify@s3:1F62
4:0482  eb07                 jmp 0x48b
loc_0484:
4:0484  a1ca50               mov ax, word ptr [0x50ca]
4:0487  8986d6fe             mov word ptr [bp - 0x12a], ax
loc_048B:
4:048B  8b86d6fe             mov ax, word ptr [bp - 0x12a]
4:048F  8986d4fe             mov word ptr [bp - 0x12c], ax
4:0493  c786dafe9a38         mov word ptr [bp - 0x126], 0x389a
4:0499  c786dcfec702         mov word ptr [bp - 0x124], 0x2c7  ; SEGMENT s2:0000
4:049F  c9                   leave
4:04A0  ca1000               retf 0x10
4:04A3  db 00

; ---------------- View::setPlanet@s4:04A4 FAR size=20 callers=2
;   current planet (+0x16)
4:04A4  55                   push bp
4:04A5  8bec                 mov bp, sp
4:04A7  668b460a             mov eax, dword ptr [bp + 0xa]
4:04AB  c45e06               les bx, ptr [bp + 6]
4:04AE  6626894716           mov dword ptr es:[bx + 0x16], eax
4:04B3  c9                   leave
4:04B4  ca0800               retf 8
4:04B7  db 00

; ---------------- View::planetHandle@s4:04B8 FAR size=18 callers=4
;   current planet (+0x16)
4:04B8  55                   push bp
4:04B9  8bec                 mov bp, sp
4:04BB  c45e06               les bx, ptr [bp + 6]
4:04BE  268b4716             mov ax, word ptr es:[bx + 0x16]
4:04C2  268b5718             mov dx, word ptr es:[bx + 0x18]
4:04C6  c9                   leave
4:04C7  ca0400               retf 4

; ---------------- View::setStar@s4:04CA FAR size=20 callers=2
;   current star (+0x1A)
4:04CA  55                   push bp
4:04CB  8bec                 mov bp, sp
4:04CD  668b460a             mov eax, dword ptr [bp + 0xa]
4:04D1  c45e06               les bx, ptr [bp + 6]
4:04D4  662689471a           mov dword ptr es:[bx + 0x1a], eax
4:04D9  c9                   leave
4:04DA  ca0800               retf 8
4:04DD  db 00

; ---------------- View::setSite@s4:04DE FAR size=20 callers=1
;   current site (+0x20)
4:04DE  55                   push bp
4:04DF  8bec                 mov bp, sp
4:04E1  668b460a             mov eax, dword ptr [bp + 0xa]
4:04E5  c45e06               les bx, ptr [bp + 6]
4:04E8  6626894720           mov dword ptr es:[bx + 0x20], eax
4:04ED  c9                   leave
4:04EE  ca0800               retf 8
4:04F1  db 00

; ---------------- View::deleteCalendar@s4:04F2 FAR size=52 callers=2
;   deletes the object at +0x12
4:04F2  c8080000             enter 8, 0
4:04F6  c45e06               les bx, ptr [bp + 6]
4:04F9  268b4712             mov ax, word ptr es:[bx + 0x12]
4:04FD  268b5714             mov dx, word ptr es:[bx + 0x14]
4:0501  8bda                 mov bx, dx
4:0503  0bd8                 or bx, ax
4:0505  740e                 je 0x515
4:0507  6a01                 push 1
4:0509  52                   push dx
4:050A  50                   push ax
4:050B  8ec2                 mov es, dx
4:050D  8bd8                 mov bx, ax
4:050F  26c41f               les bx, ptr es:[bx]
4:0512  26ff1f               lcall es:[bx]
loc_0515:
4:0515  c45e06               les bx, ptr [bp + 6]
4:0518  6626c7471200000000   mov dword ptr es:[bx + 0x12], 0
4:0521  c9                   leave
4:0522  ca0400               retf 4
4:0525  db 00

; ---------------- View::thunk_dtor@s4:0526 FAR size=12 callers=0
;   this-adjusting thunk
4:0526  8bdc                 mov bx, sp
4:0528  36836f040a           sub word ptr ss:[bx + 4], 0xa
4:052D  e90200               jmp 0x532
4:0530  db 90 90

; ---------------- View::scalar_dtor@s4:0532 FAR size=62 callers=0
;   deleting destructor
4:0532  55                   push bp
4:0533  8bec                 mov bp, sp
4:0535  66ff7606             push dword ptr [bp + 6]
4:0539  9a66eb8004           lcall 0x480, 0xeb66  ; View::~View@s3:EB66
4:053E  f6460a01             test byte ptr [bp + 0xa], 1
4:0542  7409                 je 0x54d
4:0544  66ff7606             push dword ptr [bp + 6]
4:0548  9ace173403           lcall 0x334, 0x17ce  ; operator_delete@s1:17CE
loc_054D:
4:054D  8b4606               mov ax, word ptr [bp + 6]
4:0550  8b5608               mov dx, word ptr [bp + 8]
4:0553  c9                   leave
4:0554  ca0600               retf 6
4:0557  db 90 32 05 66 05 f2 1d 62 05 58 ed 3c 05 00 00 ff
4:0567  db ff 26 05 6e 05 ea 03 5a 05

; ---------------- MapViewModel::MapViewModel@s4:0570 FAR size=542 callers=1
;   registry 0x0C..0x24: a colony map window's model (vtable 1874)
4:0570  c80e0000             enter 0xe, 0
4:0574  ff760a               push word ptr [bp + 0xa]
4:0577  6a00                 push 0
4:0579  66ff7606             push dword ptr [bp + 6]
4:057D  90                   nop
4:057E  0e                   push cs
4:057F  e89c45               call 0x4b1e  ; WindowModel::WindowModel@s4:4B1E
4:0582  c45e06               les bx, ptr [bp + 6]
4:0585  26c747209a38         mov word ptr es:[bx + 0x20], 0x389a
4:058B  26c747229e05         mov word ptr es:[bx + 0x22], 0x59e  ; SEGMENT s2:0000
4:0591  c45e06               les bx, ptr [bp + 6]
4:0594  26c74720a83a         mov word ptr es:[bx + 0x20], 0x3aa8
4:059A  26c74722b805         mov word ptr es:[bx + 0x22], 0x5b8  ; SEGMENT s2:0000
4:05A0  c45e06               les bx, ptr [bp + 6]
4:05A3  662bc0               sub eax, eax
4:05A6  6626894724           mov dword ptr es:[bx + 0x24], eax
4:05AB  662689472c           mov dword ptr es:[bx + 0x2c], eax
4:05B0  8d4730               lea ax, [bx + 0x30]
4:05B3  06                   push es
4:05B4  50                   push ax
4:05B5  9a383ec605           lcall 0x5c6, 0x3e38  ; Pos3::Pos3@s2:3E38
4:05BA  668b4606             mov eax, dword ptr [bp + 6]
4:05BE  053600               add ax, 0x36
4:05C1  6650                 push eax
4:05C3  9a383edc05           lcall 0x5dc, 0x3e38  ; Pos3::Pos3@s2:3E38
4:05C8  c45e06               les bx, ptr [bp + 6]
4:05CB  6626c7473c00000000   mov dword ptr es:[bx + 0x3c], 0
4:05D4  8d4740               lea ax, [bx + 0x40]
4:05D7  06                   push es
4:05D8  50                   push ax
4:05D9  9a906c9d04           lcall 0x49d, 0x6c90  ; Box::Box@s2:6C90
4:05DE  c45e06               les bx, ptr [bp + 6]
4:05E1  662bc0               sub eax, eax
4:05E4  662689474c           mov dword ptr es:[bx + 0x4c], eax
4:05E9  662689475a           mov dword ptr es:[bx + 0x5a], eax
4:05EE  2689475e             mov word ptr es:[bx + 0x5e], ax
4:05F2  6626894760           mov dword ptr es:[bx + 0x60], eax
4:05F7  26c7476400ff         mov word ptr es:[bx + 0x64], 0xff00
4:05FD  26894766             mov word ptr es:[bx + 0x66], ax
4:0601  6626c74768fb000001   mov dword ptr es:[bx + 0x68], 0x10000fb
4:060A  6626c7476cf9000001   mov dword ptr es:[bx + 0x6c], 0x10000f9
4:0613  6626c74770ff000001   mov dword ptr es:[bx + 0x70], 0x10000ff
4:061C  6626c74774fe000001   mov dword ptr es:[bx + 0x74], 0x10000fe
4:0625  6626c74778fc000001   mov dword ptr es:[bx + 0x78], 0x10000fc
4:062E  662689477c           mov dword ptr es:[bx + 0x7c], eax
4:0633  662689878000         mov dword ptr es:[bx + 0x80], eax
4:0639  26c78784000100       mov word ptr es:[bx + 0x84], 1
4:0640  2689878600           mov word ptr es:[bx + 0x86], ax
4:0645  662689878800         mov dword ptr es:[bx + 0x88], eax
4:064B  c45e06               les bx, ptr [bp + 6]
4:064E  2689878c00           mov word ptr es:[bx + 0x8c], ax
4:0653  662689878e00         mov dword ptr es:[bx + 0x8e], eax
4:0659  c45e06               les bx, ptr [bp + 6]
4:065C  2689879200           mov word ptr es:[bx + 0x92], ax
4:0661  662689879400         mov dword ptr es:[bx + 0x94], eax
4:0667  2689879800           mov word ptr es:[bx + 0x98], ax
4:066C  662689879a00         mov dword ptr es:[bx + 0x9a], eax
4:0672  66268987a200         mov dword ptr es:[bx + 0xa2], eax
4:0678  26c787a600ffff       mov word ptr es:[bx + 0xa6], 0xffff
4:067F  268987a800           mov word ptr es:[bx + 0xa8], ax
4:0684  26c7077418           mov word ptr es:[bx], 0x1874
4:0689  26c747029906         mov word ptr es:[bx + 2], 0x699  ; SEGMENT s4:0000
4:068F  26c74720b018         mov word ptr es:[bx + 0x20], 0x18b0
4:0695  26c747226a05         mov word ptr es:[bx + 0x22], 0x56a  ; SEGMENT s4:0000
4:069B  39066039             cmp word ptr [0x3960], ax
4:069F  7529                 jne 0x6ca
4:06A1  66833e623900         cmp dword ptr [0x3962], 0
4:06A7  7521                 jne 0x6ca
4:06A9  6a08                 push 8
4:06AB  9a9c17c506           lcall 0x6c5, 0x179c  ; operator_new@s1:179C
4:06B0  83c402               add sp, 2
4:06B3  a36239               mov word ptr [0x3962], ax
4:06B6  89166439             mov word ptr [0x3964], dx
4:06BA  666800000800         push 0x80000
4:06C0  52                   push dx
4:06C1  50                   push ax
4:06C2  9a06494b05           lcall 0x54b, 0x4906  ; _fmemset@s1:4906
4:06C7  83c408               add sp, 8
loc_06CA:
4:06CA  ff066039             inc word ptr [0x3960]
4:06CE  6a2f                 push 0x2f
4:06D0  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:06D5  9aba201a07           lcall 0x71a, 0x20ba  ; Registry_get@s3:20BA
4:06DA  c45e06               les bx, ptr [bp + 6]
4:06DD  2689472c             mov word ptr es:[bx + 0x2c], ax
4:06E1  2689572e             mov word ptr es:[bx + 0x2e], dx
4:06E5  8cc0                 mov ax, es
4:06E7  0bc3                 or ax, bx
4:06E9  740b                 je 0x6f6
4:06EB  8b4606               mov ax, word ptr [bp + 6]
4:06EE  8b5608               mov dx, word ptr [bp + 8]
4:06F1  052000               add ax, 0x20
4:06F4  eb03                 jmp 0x6f9
loc_06F6:
4:06F6  33c0                 xor ax, ax
4:06F8  99                   cdq
loc_06F9:
4:06F9  52                   push dx
4:06FA  50                   push ax
4:06FB  6a00                 push 0
4:06FD  c45e06               les bx, ptr [bp + 6]
4:0700  6626ff772c           push dword ptr es:[bx + 0x2c]
4:0705  26c45f2c             les bx, ptr es:[bx + 0x2c]
4:0709  26c41f               les bx, ptr es:[bx]
4:070C  26ff5f04             lcall es:[bx + 4]
4:0710  6a02                 push 2
4:0712  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:0717  9aba204107           lcall 0x741, 0x20ba  ; Registry_get@s3:20BA
4:071C  8946fc               mov word ptr [bp - 4], ax
4:071F  8956fe               mov word ptr [bp - 2], dx
4:0722  c45efc               les bx, ptr [bp - 4]
4:0725  2683bf800000         cmp word ptr es:[bx + 0x80], 0
4:072B  740a                 je 0x737
4:072D  c45e06               les bx, ptr [bp + 6]
4:0730  26c78784000200       mov word ptr es:[bx + 0x84], 2
loc_0737:
4:0737  6a09                 push 9
4:0739  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:073E  9aba205c07           lcall 0x75c, 0x20ba  ; Registry_get@s3:20BA
4:0743  c45e06               les bx, ptr [bp + 6]
4:0746  2689879e00           mov word ptr es:[bx + 0x9e], ax
4:074B  268997a000           mov word ptr es:[bx + 0xa0], dx
4:0750  688800               push 0x88
4:0753  52                   push dx
4:0754  26ffb79e00           push word ptr es:[bx + 0x9e]
4:0759  9ad0657607           lcall 0x776, 0x65d0  ; Orbitals::launched@s3:65D0
4:075E  0bc0                 or ax, ax
4:0760  740a                 je 0x76c
4:0762  c45e06               les bx, ptr [bp + 6]
4:0765  26c787a8000100       mov word ptr es:[bx + 0xa8], 1
loc_076C:
4:076C  6a3b                 push 0x3b
4:076E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:0773  9aba205e05           lcall 0x55e, 0x20ba  ; Registry_get@s3:20BA
4:0778  c45e06               les bx, ptr [bp + 6]
4:077B  268987a200           mov word ptr es:[bx + 0xa2], ax
4:0780  268997a400           mov word ptr es:[bx + 0xa4], dx
4:0785  8bc3                 mov ax, bx
4:0787  8cc2                 mov dx, es
4:0789  c9                   leave
4:078A  ca0600               retf 6
4:078D  db 00

; ---------------- MapViewModel::~MapViewModel@s4:078E FAR size=372 callers=1
;   dtor
4:078E  c81c0000             enter 0x1c, 0
4:0792  56                   push si
4:0793  c45e06               les bx, ptr [bp + 6]
4:0796  26c7077418           mov word ptr es:[bx], 0x1874
4:079B  26c74702ab07         mov word ptr es:[bx + 2], 0x7ab  ; SEGMENT s4:0000
4:07A1  26c74720b018         mov word ptr es:[bx + 0x20], 0x18b0
4:07A7  26c747228d06         mov word ptr es:[bx + 0x22], 0x68d  ; SEGMENT s4:0000
4:07AD  ff0e6039             dec word ptr [0x3960]
4:07B1  268b7712             mov si, word ptr es:[bx + 0x12]
4:07B5  03f6                 add si, si
4:07B7  c41e6239             les bx, ptr [0x3962]
4:07BB  26c740fc0000         mov word ptr es:[bx + si - 4], 0
4:07C1  833e603900           cmp word ptr [0x3960], 0
4:07C6  751b                 jne 0x7e3
4:07C8  66a16239             mov eax, dword ptr [0x3962]
4:07CC  668946fc             mov dword ptr [bp - 4], eax
4:07D0  6650                 push eax
4:07D2  9ace17f107           lcall 0x7f1, 0x17ce  ; operator_delete@s1:17CE
4:07D7  83c404               add sp, 4
4:07DA  66c706623900000000   mov dword ptr [0x3962], 0
loc_07E3:
4:07E3  c45e06               les bx, ptr [bp + 6]
4:07E6  66268b879400         mov eax, dword ptr es:[bx + 0x94]
4:07EC  6650                 push eax
4:07EE  9ace170408           lcall 0x804, 0x17ce  ; operator_delete@s1:17CE
4:07F3  83c404               add sp, 4
4:07F6  c45e06               les bx, ptr [bp + 6]
4:07F9  66268b879a00         mov eax, dword ptr es:[bx + 0x9a]
4:07FF  6650                 push eax
4:0801  9ace171708           lcall 0x817, 0x17ce  ; operator_delete@s1:17CE
4:0806  83c404               add sp, 4
4:0809  c45e06               les bx, ptr [bp + 6]
4:080C  66268b878800         mov eax, dword ptr es:[bx + 0x88]
4:0812  6650                 push eax
4:0814  9ace172e08           lcall 0x82e, 0x17ce  ; operator_delete@s1:17CE
4:0819  83c404               add sp, 4
4:081C  c45e06               les bx, ptr [bp + 6]
4:081F  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
4:0825  668946fc             mov dword ptr [bp - 4], eax
4:0829  6650                 push eax
4:082B  9ace17b908           lcall 0x8b9, 0x17ce  ; operator_delete@s1:17CE
4:0830  83c404               add sp, 4
4:0833  c45e06               les bx, ptr [bp + 6]
4:0836  6626837f2c00         cmp dword ptr es:[bx + 0x2c], 0
4:083C  7425                 je 0x863
4:083E  8cc0                 mov ax, es
4:0840  0bc3                 or ax, bx
4:0842  740a                 je 0x84e
4:0844  8bc3                 mov ax, bx
4:0846  8cc2                 mov dx, es
4:0848  052000               add ax, 0x20
4:084B  eb04                 jmp 0x851
4:084D  db 90
loc_084E:
4:084E  33c0                 xor ax, ax
4:0850  99                   cdq
loc_0851:
4:0851  8946e8               mov word ptr [bp - 0x18], ax
4:0854  8956ea               mov word ptr [bp - 0x16], dx
4:0857  52                   push dx
4:0858  50                   push ax
4:0859  6626ff772c           push dword ptr es:[bx + 0x2c]
4:085E  9aa61e9208           lcall 0x892, 0x1ea6  ; RegObj::removeListener@s3:1EA6
loc_0863:
4:0863  c45e06               les bx, ptr [bp + 6]
4:0866  662683bf9e0000       cmp dword ptr es:[bx + 0x9e], 0
4:086D  7425                 je 0x894
4:086F  8cc0                 mov ax, es
4:0871  0bc3                 or ax, bx
4:0873  7409                 je 0x87e
4:0875  8bc3                 mov ax, bx
4:0877  8cc2                 mov dx, es
4:0879  052000               add ax, 0x20
4:087C  eb03                 jmp 0x881
loc_087E:
4:087E  33c0                 xor ax, ax
4:0880  99                   cdq
loc_0881:
4:0881  8946e8               mov word ptr [bp - 0x18], ax
4:0884  8956ea               mov word ptr [bp - 0x16], dx
4:0887  52                   push dx
4:0888  50                   push ax
4:0889  6626ffb79e00         push dword ptr es:[bx + 0x9e]
4:088F  9aa61efa08           lcall 0x8fa, 0x1ea6  ; RegObj::removeListener@s3:1EA6
loc_0894:
4:0894  c45e06               les bx, ptr [bp + 6]
4:0897  268b4760             mov ax, word ptr es:[bx + 0x60]
4:089B  268b5762             mov dx, word ptr es:[bx + 0x62]
4:089F  8bda                 mov bx, dx
4:08A1  8946fc               mov word ptr [bp - 4], ax
4:08A4  8956fe               mov word ptr [bp - 2], dx
4:08A7  0bd8                 or bx, ax
4:08A9  7413                 je 0x8be
4:08AB  52                   push dx
4:08AC  50                   push ax
4:08AD  9a1851f108           lcall 0x8f1, 0x5118  ; DibRegion::free@s2:5118
4:08B2  66ff76fc             push dword ptr [bp - 4]
4:08B6  9ace17ae06           lcall 0x6ae, 0x17ce  ; operator_delete@s1:17CE
4:08BB  83c404               add sp, 4
loc_08BE:
4:08BE  c45e06               les bx, ptr [bp + 6]
4:08C1  6626c7474c00000000   mov dword ptr es:[bx + 0x4c], 0
4:08CA  66837e0600           cmp dword ptr [bp + 6], 0
4:08CF  740b                 je 0x8dc
4:08D1  8b4606               mov ax, word ptr [bp + 6]
4:08D4  8b5608               mov dx, word ptr [bp + 8]
4:08D7  052000               add ax, 0x20
4:08DA  eb03                 jmp 0x8df
loc_08DC:
4:08DC  33c0                 xor ax, ax
4:08DE  99                   cdq
loc_08DF:
4:08DF  8946e8               mov word ptr [bp - 0x18], ax
4:08E2  8956ea               mov word ptr [bp - 0x16], dx
4:08E5  c45ee8               les bx, ptr [bp - 0x18]
4:08E8  26c7079a38           mov word ptr es:[bx], 0x389a
4:08ED  26c747028f05         mov word ptr es:[bx + 2], 0x58f  ; SEGMENT s2:0000
4:08F3  66ff7606             push dword ptr [bp + 6]
4:08F7  9a801dd806           lcall 0x6d8, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:08FC  5e                   pop si
4:08FD  c9                   leave
4:08FE  ca0400               retf 4
4:0901  db 00

; ---------------- MapViewModel::levelCount@s4:0902 FAR size=166 callers=1
;   levels open on the site
4:0902  c8060000             enter 6, 0
4:0906  57                   push di
4:0907  56                   push si
4:0908  8b4606               mov ax, word ptr [bp + 6]
4:090B  8b5608               mov dx, word ptr [bp + 8]
4:090E  052800               add ax, 0x28
4:0911  52                   push dx
4:0912  50                   push ax
4:0913  8b4606               mov ax, word ptr [bp + 6]
4:0916  052400               add ax, 0x24
4:0919  52                   push dx
4:091A  50                   push ax
4:091B  66ff760a             push dword ptr [bp + 0xa]
4:091F  66ff364857           push dword ptr [0x5748]  ; g_sim
4:0924  8bf0                 mov si, ax
4:0926  8bfa                 mov di, dx
4:0928  9a44833209           lcall 0x932, 0x8344  ; Sim::resolve@s7:8344
4:092D  52                   push dx
4:092E  50                   push ax
4:092F  9a525a6d04           lcall 0x46d, 0x5a52  ; Site::recordWords@s7:5A52
4:0934  8ec7                 mov es, di
4:0936  6626ff34             push dword ptr es:[si]
4:093A  9a7247b008           lcall 0x8b0, 0x4772  ; DIB::rect@s2:4772
4:093F  c45e06               les bx, ptr [bp + 6]
4:0942  2689475a             mov word ptr es:[bx + 0x5a], ax
4:0946  2689575c             mov word ptr es:[bx + 0x5c], dx
4:094A  06                   push es
4:094B  53                   push bx
4:094C  90                   nop
4:094D  0e                   push cs
4:094E  e89f0e               call 0x17f0  ; firstFreeLevel@s4:17F0
4:0951  8946fa               mov word ptr [bp - 6], ax
4:0954  050200               add ax, 2
4:0957  c45e06               les bx, ptr [bp + 6]
4:095A  26894712             mov word ptr es:[bx + 0x12], ax
4:095E  8b5efa               mov bx, word ptr [bp - 6]
4:0961  03db                 add bx, bx
4:0963  c4366239             les si, ptr [0x3962]
4:0967  26c7000100           mov word ptr es:[bx + si], 1
4:096C  c45e06               les bx, ptr [bp + 6]
4:096F  06                   push es
4:0970  53                   push bx
4:0971  26c41f               les bx, ptr es:[bx]
4:0974  26ff5f18             lcall es:[bx + 0x18]
4:0978  668b460a             mov eax, dword ptr [bp + 0xa]
4:097C  8b560c               mov dx, word ptr [bp + 0xc]
4:097F  c45e06               les bx, ptr [bp + 6]
4:0982  662689473c           mov dword ptr es:[bx + 0x3c], eax
4:0987  52                   push dx
4:0988  26ff773c             push word ptr es:[bx + 0x3c]
4:098C  6626ff772c           push dword ptr es:[bx + 0x2c]
4:0991  9a18ec6108           lcall 0x861, 0xec18  ; View::planetField@s3:EC18
4:0996  c45e06               les bx, ptr [bp + 6]
4:0999  2689477c             mov word ptr es:[bx + 0x7c], ax
4:099D  2689577e             mov word ptr es:[bx + 0x7e], dx
4:09A1  5e                   pop si
4:09A2  5f                   pop di
4:09A3  c9                   leave
4:09A4  ca0800               retf 8
4:09A7  db 00

; ---------------- MapViewModel::rect@s4:09A8 FAR size=168 callers=0
;   apis: USER.GetSystemMetrics
;   (vslot 8) the window rectangle
4:09A8  c8200000             enter 0x20, 0
4:09AC  57                   push di
4:09AD  56                   push si
4:09AE  6a04                 push 4
4:09B0  9a0d0a0000           lcall 0, 0xa0d  ; USER.GetSystemMetrics
4:09B5  8946fe               mov word ptr [bp - 2], ax
4:09B8  c45e06               les bx, ptr [bp + 6]
4:09BB  268b4712             mov ax, word ptr es:[bx + 0x12]
4:09BF  2d0200               sub ax, 2
4:09C2  8946fc               mov word ptr [bp - 4], ax
4:09C5  8d46fa               lea ax, [bp - 6]
4:09C8  16                   push ss
4:09C9  50                   push ax
4:09CA  8d46f8               lea ax, [bp - 8]
4:09CD  16                   push ss
4:09CE  50                   push ax
4:09CF  6a48                 push 0x48
4:09D1  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:09D6  9aba209409           lcall 0x994, 0x20ba  ; Registry_get@s3:20BA
4:09DB  8946f4               mov word ptr [bp - 0xc], ax
4:09DE  8956f6               mov word ptr [bp - 0xa], dx
4:09E1  050e00               add ax, 0xe
4:09E4  52                   push dx
4:09E5  50                   push ax
4:09E6  9a943e3d09           lcall 0x93d, 0x3e94  ; Pos3::getXY@s2:3E94
4:09EB  8b46fc               mov ax, word ptr [bp - 4]
4:09EE  f76efe               imul word ptr [bp - 2]
4:09F1  8bc8                 mov cx, ax
4:09F3  0346fa               add ax, word ptr [bp - 6]
4:09F6  054601               add ax, 0x146
4:09F9  c45e06               les bx, ptr [bp + 6]
4:09FC  26894718             mov word ptr es:[bx + 0x18], ax
4:0A00  034ef8               add cx, word ptr [bp - 8]
4:0A03  83c109               add cx, 9
4:0A06  26894f1a             mov word ptr es:[bx + 0x1a], cx
4:0A0A  6a05                 push 5
4:0A0C  9a280a0000           lcall 0, 0xa28  ; USER.GetSystemMetrics
4:0A11  03c0                 add ax, ax
4:0A13  c45e06               les bx, ptr [bp + 6]
4:0A16  26c45f5a             les bx, ptr es:[bx + 0x5a]
4:0A1A  26034704             add ax, word ptr es:[bx + 4]
4:0A1E  c45e06               les bx, ptr [bp + 6]
4:0A21  2689471c             mov word ptr es:[bx + 0x1c], ax
4:0A25  6a04                 push 4
4:0A27  9a310a0000           lcall 0, 0xa31  ; USER.GetSystemMetrics
4:0A2C  6a06                 push 6
4:0A2E  8bf0                 mov si, ax
4:0A30  9affff0000           lcall 0, 0xffff  ; USER.GetSystemMetrics
4:0A35  c45e06               les bx, ptr [bp + 6]
4:0A38  8cc1                 mov cx, es
4:0A3A  26c47f5a             les di, ptr es:[bx + 0x5a]
4:0A3E  26037508             add si, word ptr es:[di + 8]
4:0A42  03c6                 add ax, si
4:0A44  8ec1                 mov es, cx
4:0A46  2689471e             mov word ptr es:[bx + 0x1e], ax
4:0A4A  5e                   pop si
4:0A4B  5f                   pop di
4:0A4C  c9                   leave
4:0A4D  ca0400               retf 4

; ---------------- MapViewModel::currentList@s4:0A50 FAR size=38 callers=3
;   the surface or underground list (+0x84 mode)
4:0A50  55                   push bp
4:0A51  8bec                 mov bp, sp
4:0A53  c45e06               les bx, ptr [bp + 6]
4:0A56  2683bf840002         cmp word ptr es:[bx + 0x84], 2
4:0A5C  750c                 jne 0xa6a
4:0A5E  268b4728             mov ax, word ptr es:[bx + 0x28]
4:0A62  268b572a             mov dx, word ptr es:[bx + 0x2a]
4:0A66  c9                   leave
4:0A67  ca0400               retf 4
loc_0A6A:
4:0A6A  268b4724             mov ax, word ptr es:[bx + 0x24]
4:0A6E  268b5726             mov dx, word ptr es:[bx + 0x26]
4:0A72  c9                   leave
4:0A73  ca0400               retf 4

; ---------------- MapViewModel::toggleMode@s4:0A76 FAR size=42 callers=1
;   switches mode 1 <-> 2, notice 4
4:0A76  55                   push bp
4:0A77  8bec                 mov bp, sp
4:0A79  c45e06               les bx, ptr [bp + 6]
4:0A7C  2683bf840001         cmp word ptr es:[bx + 0x84], 1
4:0A82  7506                 jne 0xa8a
4:0A84  b80200               mov ax, 2
4:0A87  eb04                 jmp 0xa8d
4:0A89  db 90
loc_0A8A:
4:0A8A  b80100               mov ax, 1
loc_0A8D:
4:0A8D  2689878400           mov word ptr es:[bx + 0x84], ax
4:0A92  6a04                 push 4
4:0A94  06                   push es
4:0A95  53                   push bx
4:0A96  9a621fd909           lcall 0x9d9, 0x1f62  ; RegObj::notify@s3:1F62
4:0A9B  c9                   leave
4:0A9C  ca0400               retf 4
4:0A9F  db 00

; ---------------- MapViewModel::setLevel@s4:0AA0 FAR size=32 callers=0
;   (vslot 10) the level, and the view's site
4:0AA0  55                   push bp
4:0AA1  8bec                 mov bp, sp
4:0AA3  8b460a               mov ax, word ptr [bp + 0xa]
4:0AA6  c45e06               les bx, ptr [bp + 6]
4:0AA9  26894714             mov word ptr es:[bx + 0x14], ax
4:0AAD  6626ff773c           push dword ptr es:[bx + 0x3c]
4:0AB2  6626ff772c           push dword ptr es:[bx + 0x2c]
4:0AB7  90                   nop
4:0AB8  0e                   push cs
4:0AB9  e822fa               call 0x4de  ; View::setSite@s4:04DE
4:0ABC  c9                   leave
4:0ABD  ca0600               retf 6

; ---------------- MapViewModel::setSelection@s4:0AC0 FAR size=20 callers=1
;   +0x80
4:0AC0  55                   push bp
4:0AC1  8bec                 mov bp, sp
4:0AC3  668b460a             mov eax, dword ptr [bp + 0xa]
4:0AC7  c45e06               les bx, ptr [bp + 6]
4:0ACA  662689878000         mov dword ptr es:[bx + 0x80], eax
4:0AD0  c9                   leave
4:0AD1  ca0800               retf 8

; ---------------- MapViewModel::selection@s4:0AD4 FAR size=20 callers=2
;   +0x80
4:0AD4  55                   push bp
4:0AD5  8bec                 mov bp, sp
4:0AD7  c45e06               les bx, ptr [bp + 6]
4:0ADA  268b878000           mov ax, word ptr es:[bx + 0x80]
4:0ADF  268b978200           mov dx, word ptr es:[bx + 0x82]
4:0AE4  c9                   leave
4:0AE5  ca0400               retf 4

; ---------------- MapViewModel::setTool@s4:0AE8 FAR size=18 callers=2
;   +0x5E
4:0AE8  55                   push bp
4:0AE9  8bec                 mov bp, sp
4:0AEB  8b460a               mov ax, word ptr [bp + 0xa]
4:0AEE  c45e06               les bx, ptr [bp + 6]
4:0AF1  2689475e             mov word ptr es:[bx + 0x5e], ax
4:0AF5  c9                   leave
4:0AF6  ca0600               retf 6
4:0AF9  db 00

; ---------------- MapViewModel::tool@s4:0AFA FAR size=14 callers=2
;   +0x5E
4:0AFA  55                   push bp
4:0AFB  8bec                 mov bp, sp
4:0AFD  c45e06               les bx, ptr [bp + 6]
4:0B00  268b475e             mov ax, word ptr es:[bx + 0x5e]
4:0B04  c9                   leave
4:0B05  ca0400               retf 4

; ---------------- MapViewModel::siteHandle@s4:0B08 FAR size=22 callers=1
;   the site of the model's colony
4:0B08  55                   push bp
4:0B09  8bec                 mov bp, sp
4:0B0B  c45e06               les bx, ptr [bp + 6]
4:0B0E  26c45f7c             les bx, ptr es:[bx + 0x7c]
4:0B12  268b4704             mov ax, word ptr es:[bx + 4]
4:0B16  268b5706             mov dx, word ptr es:[bx + 6]
4:0B1A  c9                   leave
4:0B1B  ca0400               retf 4

; ---------------- MapViewModel::scrollTo@s4:0B1E FAR size=214 callers=2
;   scroll box from a position
4:0B1E  c80e0000             enter 0xe, 0
4:0B22  57                   push di
4:0B23  56                   push si
4:0B24  8d46fe               lea ax, [bp - 2]
4:0B27  16                   push ss
4:0B28  50                   push ax
4:0B29  8d4efc               lea cx, [bp - 4]
4:0B2C  16                   push ss
4:0B2D  51                   push cx
4:0B2E  8d4efa               lea cx, [bp - 6]
4:0B31  16                   push ss
4:0B32  51                   push cx
4:0B33  668b4e06             mov ecx, dword ptr [bp + 6]
4:0B37  83c130               add cx, 0x30
4:0B3A  6651                 push ecx
4:0B3C  9ab43ec90b           lcall 0xbc9, 0x3eb4  ; Pos3::get@s2:3EB4
4:0B41  8b46fe               mov ax, word ptr [bp - 2]
4:0B44  2d0300               sub ax, 3
4:0B47  0bc0                 or ax, ax
4:0B49  7f05                 jg 0xb50
4:0B4B  c746fe0300           mov word ptr [bp - 2], 3
loc_0B50:
4:0B50  8b46fc               mov ax, word ptr [bp - 4]
4:0B53  2d0300               sub ax, 3
4:0B56  0bc0                 or ax, ax
4:0B58  7f05                 jg 0xb5f
4:0B5A  c746fc0300           mov word ptr [bp - 4], 3
loc_0B5F:
4:0B5F  c45e06               les bx, ptr [bp + 6]
4:0B62  26c45f5a             les bx, ptr es:[bx + 0x5a]
4:0B66  8b4efe               mov cx, word ptr [bp - 2]
4:0B69  268b4704             mov ax, word ptr es:[bx + 4]
4:0B6D  83c102               add cx, 2
4:0B70  3bc1                 cmp ax, cx
4:0B72  7f06                 jg 0xb7a
4:0B74  2d0300               sub ax, 3
4:0B77  8946fe               mov word ptr [bp - 2], ax
loc_0B7A:
4:0B7A  c45e06               les bx, ptr [bp + 6]
4:0B7D  26c45f5a             les bx, ptr es:[bx + 0x5a]
4:0B81  8b4efc               mov cx, word ptr [bp - 4]
4:0B84  268b4708             mov ax, word ptr es:[bx + 8]
4:0B88  83c102               add cx, 2
4:0B8B  3bc1                 cmp ax, cx
4:0B8D  7f06                 jg 0xb95
4:0B8F  2d0300               sub ax, 3
4:0B92  8946fc               mov word ptr [bp - 4], ax
loc_0B95:
4:0B95  8b46fe               mov ax, word ptr [bp - 2]
4:0B98  2d0300               sub ax, 3
4:0B9B  50                   push ax
4:0B9C  8b46fc               mov ax, word ptr [bp - 4]
4:0B9F  2d0300               sub ax, 3
4:0BA2  50                   push ax
4:0BA3  ff76fa               push word ptr [bp - 6]
4:0BA6  8b46fe               mov ax, word ptr [bp - 2]
4:0BA9  050200               add ax, 2
4:0BAC  50                   push ax
4:0BAD  8b46fc               mov ax, word ptr [bp - 4]
4:0BB0  050200               add ax, 2
4:0BB3  50                   push ax
4:0BB4  ff76fa               push word ptr [bp - 6]
4:0BB7  8b4606               mov ax, word ptr [bp + 6]
4:0BBA  8b5608               mov dx, word ptr [bp + 8]
4:0BBD  054000               add ax, 0x40
4:0BC0  52                   push dx
4:0BC1  50                   push ax
4:0BC2  8bf0                 mov si, ax
4:0BC4  8bfa                 mov di, dx
4:0BC6  9aec6cd40b           lcall 0xbd4, 0x6cec  ; Box::set@s2:6CEC
4:0BCB  57                   push di
4:0BCC  56                   push si
4:0BCD  66ff760a             push dword ptr [bp + 0xa]
4:0BD1  9a623feb0b           lcall 0xbeb, 0x3f62  ; Pos3::assign@s2:3F62
4:0BD6  668b4606             mov eax, dword ptr [bp + 6]
4:0BDA  054600               add ax, 0x46
4:0BDD  6650                 push eax
4:0BDF  668b460a             mov eax, dword ptr [bp + 0xa]
4:0BE3  050600               add ax, 6
4:0BE6  6650                 push eax
4:0BE8  9a623fe909           lcall 0x9e9, 0x3f62  ; Pos3::assign@s2:3F62
4:0BED  5e                   pop si
4:0BEE  5f                   pop di
4:0BEF  c9                   leave
4:0BF0  ca0800               retf 8
4:0BF3  db 00

; ---------------- MapViewModel::onChange@s4:0BF4 FAR size=386 callers=0
;   (vslot 16) rebuilds lists, scroll, buildings
4:0BF4  c81a0000             enter 0x1a, 0
4:0BF8  57                   push di
4:0BF9  56                   push si
4:0BFA  8b460a               mov ax, word ptr [bp + 0xa]
4:0BFD  e93801               jmp 0xd38
loc_0C00:
4:0C00  c45e06               les bx, ptr [bp + 6]
4:0C03  662bc0               sub eax, eax
4:0C06  662689470c           mov dword ptr es:[bx + 0xc], eax
4:0C0B  662689477e           mov dword ptr es:[bx + 0x7e], eax
4:0C10  5e                   pop si
4:0C11  5f                   pop di
4:0C12  c9                   leave
4:0C13  ca0600               retf 6
loc_0C16:
4:0C16  8d46fe               lea ax, [bp - 2]
4:0C19  16                   push ss
4:0C1A  50                   push ax
4:0C1B  8d46fc               lea ax, [bp - 4]
4:0C1E  16                   push ss
4:0C1F  50                   push ax
4:0C20  8d46fa               lea ax, [bp - 6]
4:0C23  16                   push ss
4:0C24  50                   push ax
4:0C25  668b4606             mov eax, dword ptr [bp + 6]
4:0C29  051000               add ax, 0x10
4:0C2C  6650                 push eax
4:0C2E  9ab43e520c           lcall 0xc52, 0x3eb4  ; Pos3::get@s2:3EB4
4:0C33  c45e06               les bx, ptr [bp + 6]
4:0C36  26c45f0c             les bx, ptr es:[bx + 0xc]
4:0C3A  268b471e             mov ax, word ptr es:[bx + 0x1e]
4:0C3E  8946fa               mov word ptr [bp - 6], ax
4:0C41  66ff76fc             push dword ptr [bp - 4]
4:0C45  50                   push ax
4:0C46  668b4606             mov eax, dword ptr [bp + 6]
4:0C4A  051000               add ax, 0x10
4:0C4D  6650                 push eax
4:0C4F  9a763e5c0c           lcall 0xc5c, 0x3e76  ; Pos3::set@s2:3E76
4:0C54  8d46ee               lea ax, [bp - 0x12]
4:0C57  16                   push ss
4:0C58  50                   push ax
4:0C59  9a906c3f0b           lcall 0xb3f, 0x6c90  ; Box::Box@s2:6C90
4:0C5E  8d46ee               lea ax, [bp - 0x12]
4:0C61  16                   push ss
4:0C62  50                   push ax
4:0C63  668b4606             mov eax, dword ptr [bp + 6]
4:0C67  2d2000               sub ax, 0x20
4:0C6A  6650                 push eax
4:0C6C  90                   nop
4:0C6D  0e                   push cs
4:0C6E  e8adfe               call 0xb1e  ; MapViewModel::scrollTo@s4:0B1E
loc_0C71:
4:0C71  c45e06               les bx, ptr [bp + 6]
4:0C74  6626c7472c00000000   mov dword ptr es:[bx + 0x2c], 0
4:0C7D  c45e06               les bx, ptr [bp + 6]
4:0C80  66268b471c           mov eax, dword ptr es:[bx + 0x1c]
4:0C85  268b571e             mov dx, word ptr es:[bx + 0x1e]
4:0C89  26c45f0c             les bx, ptr es:[bx + 0xc]
4:0C8D  6626394720           cmp dword ptr es:[bx + 0x20], eax
4:0C92  0f85da00             jne 0xd70
4:0C96  c45e06               les bx, ptr [bp + 6]
4:0C99  6626ff771c           push dword ptr es:[bx + 0x1c]
4:0C9E  6626ff770c           push dword ptr es:[bx + 0xc]
4:0CA3  90                   nop
4:0CA4  0e                   push cs
4:0CA5  e8e4f5               call 0x28c  ; MapViewModel::build@s4:028C
4:0CA8  c45e06               les bx, ptr [bp + 6]
4:0CAB  2689472c             mov word ptr es:[bx + 0x2c], ax
4:0CAF  2689572e             mov word ptr es:[bx + 0x2e], dx
4:0CB3  ff760a               push word ptr [bp + 0xa]
4:0CB6  8d47e0               lea ax, [bx - 0x20]
4:0CB9  06                   push es
4:0CBA  50                   push ax
4:0CBB  9a621f220d           lcall 0xd22, 0x1f62  ; RegObj::notify@s3:1F62
4:0CC0  5e                   pop si
4:0CC1  5f                   pop di
4:0CC2  c9                   leave
4:0CC3  ca0600               retf 6
loc_0CC6:
4:0CC6  8b4606               mov ax, word ptr [bp + 6]
4:0CC9  8b5608               mov dx, word ptr [bp + 8]
4:0CCC  2d2000               sub ax, 0x20
4:0CCF  52                   push dx
4:0CD0  50                   push ax
4:0CD1  8bf0                 mov si, ax
4:0CD3  8bfa                 mov di, dx
4:0CD5  90                   nop
4:0CD6  0e                   push cs
4:0CD7  e8ec00               call 0xdc6  ; MapViewModel::listColonyObjects@s4:0DC6
4:0CDA  57                   push di
4:0CDB  56                   push si
4:0CDC  90                   nop
4:0CDD  0e                   push cs
4:0CDE  e8e303               call 0x10c4  ; MapViewModel::listBuildings@s4:10C4
4:0CE1  57                   push di
4:0CE2  56                   push si
4:0CE3  90                   nop
4:0CE4  0e                   push cs
4:0CE5  e85e06               call 0x1346  ; MapViewModel::listButtons@s4:1346
4:0CE8  eb87                 jmp 0xc71
loc_0CEA:
4:0CEA  c45e06               les bx, ptr [bp + 6]
4:0CED  66268b471c           mov eax, dword ptr es:[bx + 0x1c]
4:0CF2  268b571e             mov dx, word ptr es:[bx + 0x1e]
4:0CF6  26c45f0c             les bx, ptr es:[bx + 0xc]
4:0CFA  6626394720           cmp dword ptr es:[bx + 0x20], eax
4:0CFF  746f                 je 0xd70
4:0D01  c45e06               les bx, ptr [bp + 6]
4:0D04  6626ff7760           push dword ptr es:[bx + 0x60]
4:0D09  9a1a29ffff           lcall 0xffff, 0x291a  ; SiteWnd::close@s5:291A
4:0D0E  5e                   pop si
4:0D0F  5f                   pop di
4:0D10  c9                   leave
4:0D11  ca0600               retf 6
loc_0D14:
4:0D14  688800               push 0x88
4:0D17  c45e06               les bx, ptr [bp + 6]
4:0D1A  6626ff777e           push dword ptr es:[bx + 0x7e]
4:0D1F  9ad065990a           lcall 0xa99, 0x65d0  ; Orbitals::launched@s3:65D0
4:0D24  0bc0                 or ax, ax
4:0D26  7448                 je 0xd70
4:0D28  c45e06               les bx, ptr [bp + 6]
4:0D2B  26c78788000100       mov word ptr es:[bx + 0x88], 1
4:0D32  5e                   pop si
4:0D33  5f                   pop di
4:0D34  c9                   leave
4:0D35  ca0600               retf 6
loc_0D38:
4:0D38  48                   dec ax
4:0D39  3d1400               cmp ax, 0x14
4:0D3C  7732                 ja 0xd70
4:0D3E  03c0                 add ax, ax
4:0D40  93                   xchg bx, ax
4:0D41  2effa7460d           jmp word ptr cs:[bx + 0xd46]
switch_table_0D46:
    dw loc_0C00
    dw loc_0D70
    dw loc_0D70
    dw loc_0C16
    dw loc_0CC6
    dw loc_0CC6
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0D70
    dw loc_0CEA
    dw loc_0D14
loc_0D70:
4:0D70  5e                   pop si
4:0D71  5f                   pop di
4:0D72  c9                   leave
4:0D73  ca0600               retf 6

; ---------------- MapViewModel::isCurrentColony@s4:0D76 size=36 callers=0
;   (vslot 9) is the model's colony the view's
4:0D76  c8080000             enter 8, 0
4:0D7A  c45e06               les bx, ptr [bp + 6]
4:0D7D  66268b473c           mov eax, dword ptr es:[bx + 0x3c]
4:0D82  26c45f2c             les bx, ptr es:[bx + 0x2c]
4:0D86  6626394720           cmp dword ptr es:[bx + 0x20], eax
4:0D8B  7507                 jne 0xd94
4:0D8D  b80100               mov ax, 1
4:0D90  c9                   leave
4:0D91  ca0400               retf 4
loc_0D94:
4:0D94  33c0                 xor ax, ax
4:0D96  c9                   leave
4:0D97  ca0400               retf 4

; ---------------- MapViewModel::siteInfo@s4:0D9A FAR size=44 callers=1
;   site record fields
4:0D9A  55                   push bp
4:0D9B  8bec                 mov bp, sp
4:0D9D  c45e06               les bx, ptr [bp + 6]
4:0DA0  26c45f7c             les bx, ptr es:[bx + 0x7c]
4:0DA4  66268b4716           mov eax, dword ptr es:[bx + 0x16]
4:0DA9  c45e0e               les bx, ptr [bp + 0xe]
4:0DAC  66268907             mov dword ptr es:[bx], eax
4:0DB0  c45e06               les bx, ptr [bp + 6]
4:0DB3  26c45f7c             les bx, ptr es:[bx + 0x7c]
4:0DB7  268b471a             mov ax, word ptr es:[bx + 0x1a]
4:0DBB  c45e0a               les bx, ptr [bp + 0xa]
4:0DBE  268907               mov word ptr es:[bx], ax
4:0DC1  c9                   leave
4:0DC2  ca0c00               retf 0xc
4:0DC5  db 00

; ---------------- MapViewModel::listColonyObjects@s4:0DC6 FAR size=654 callers=3
;   the colony's objects (trade markers...)
4:0DC6  c83c0000             enter 0x3c, 0
4:0DCA  57                   push di
4:0DCB  56                   push si
4:0DCC  666800000004         push 0x4000000
4:0DD2  6a01                 push 1
4:0DD4  8d46ee               lea ax, [bp - 0x12]
4:0DD7  16                   push ss
4:0DD8  50                   push ax
4:0DD9  9a52dc340e           lcall 0xe34, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
4:0DDE  c45e06               les bx, ptr [bp + 6]
4:0DE1  66268b879400         mov eax, dword ptr es:[bx + 0x94]
4:0DE7  668946de             mov dword ptr [bp - 0x22], eax
4:0DEB  6650                 push eax
4:0DED  9ace170b0e           lcall 0xe0b, 0x17ce  ; operator_delete@s1:17CE
4:0DF2  83c404               add sp, 4
4:0DF5  c45e06               les bx, ptr [bp + 6]
4:0DF8  66268b879a00         mov eax, dword ptr es:[bx + 0x9a]
4:0DFE  668946e2             mov dword ptr [bp - 0x1e], eax
4:0E02  668946da             mov dword ptr [bp - 0x26], eax
4:0E06  6650                 push eax
4:0E08  9ace17b50e           lcall 0xeb5, 0x17ce  ; operator_delete@s1:17CE
4:0E0D  83c404               add sp, 4
4:0E10  c45e06               les bx, ptr [bp + 6]
4:0E13  662bc0               sub eax, eax
4:0E16  662689879400         mov dword ptr es:[bx + 0x94], eax
4:0E1C  662689879a00         mov dword ptr es:[bx + 0x9a], eax
4:0E22  2689879200           mov word ptr es:[bx + 0x92], ax
4:0E27  2689879800           mov word ptr es:[bx + 0x98], ax
loc_0E2C:
4:0E2C  8d46ee               lea ax, [bp - 0x12]
4:0E2F  16                   push ss
4:0E30  50                   push ax
4:0E31  9aece47c0f           lcall 0xf7c, 0xe4ec  ; DbIter::next@s6:E4EC
4:0E36  8946ea               mov word ptr [bp - 0x16], ax
4:0E39  8956ec               mov word ptr [bp - 0x14], dx
4:0E3C  0bd0                 or dx, ax
4:0E3E  7456                 je 0xe96
4:0E40  c45eea               les bx, ptr [bp - 0x16]
4:0E43  66268b870002         mov eax, dword ptr es:[bx + 0x200]
4:0E49  668946da             mov dword ptr [bp - 0x26], eax
4:0E4D  663d01000008         cmp eax, 0x8000001
4:0E53  750b                 jne 0xe60
4:0E55  c45e06               les bx, ptr [bp + 6]
4:0E58  26ff879200           inc word ptr es:[bx + 0x92]
4:0E5D  ebcd                 jmp 0xe2c
4:0E5F  db 90
loc_0E60:
4:0E60  c45e06               les bx, ptr [bp + 6]
4:0E63  2683bfa80000         cmp word ptr es:[bx + 0xa8], 0
4:0E69  7520                 jne 0xe8b
4:0E6B  666801000004         push 0x4000001
4:0E71  c45eea               les bx, ptr [bp - 0x16]
4:0E74  6626ff7704           push dword ptr es:[bx + 4]
4:0E79  c45e06               les bx, ptr [bp + 6]
4:0E7C  6626ffb7a200         push dword ptr es:[bx + 0xa2]
4:0E82  9aa6dfce0e           lcall 0xece, 0xdfa6  ; TradeAgreements::countFor@s2:DFA6
4:0E87  0bc0                 or ax, ax
4:0E89  74a1                 je 0xe2c
loc_0E8B:
4:0E8B  c45e06               les bx, ptr [bp + 6]
4:0E8E  26ff879800           inc word ptr es:[bx + 0x98]
4:0E93  eb97                 jmp 0xe2c
4:0E95  db 90
loc_0E96:
4:0E96  c45e06               les bx, ptr [bp + 6]
4:0E99  2683bf920000         cmp word ptr es:[bx + 0x92], 0
4:0E9F  7454                 je 0xef5
4:0EA1  268b879200           mov ax, word ptr es:[bx + 0x92]
4:0EA6  8946d6               mov word ptr [bp - 0x2a], ax
4:0EA9  8bc8                 mov cx, ax
4:0EAB  03c0                 add ax, ax
4:0EAD  03c1                 add ax, cx
4:0EAF  03c0                 add ax, ax
4:0EB1  50                   push ax
4:0EB2  9a9c17d60e           lcall 0xed6, 0x179c  ; operator_new@s1:179C
4:0EB7  83c402               add sp, 2
4:0EBA  8946e2               mov word ptr [bp - 0x1e], ax
4:0EBD  8956e4               mov word ptr [bp - 0x1c], dx
4:0EC0  0bd0                 or dx, ax
4:0EC2  7424                 je 0xee8
4:0EC4  ff76e4               push word ptr [bp - 0x1c]
4:0EC7  50                   push ax
4:0EC8  6a06                 push 6
4:0ECA  ff76d6               push word ptr [bp - 0x2a]
4:0ECD  682d0f               push 0xf2d  ; SEGMENT s2:0000
4:0ED0  68383e               push 0x3e38
4:0ED3  9a8655140f           lcall 0xf14, 0x5586  ; __vec_ctor@s1:5586
4:0ED8  668b46e2             mov eax, dword ptr [bp - 0x1e]
4:0EDC  c45e06               les bx, ptr [bp + 6]
4:0EDF  662689879400         mov dword ptr es:[bx + 0x94], eax
4:0EE5  eb0e                 jmp 0xef5
4:0EE7  db 90
loc_0EE8:
4:0EE8  c45e06               les bx, ptr [bp + 6]
4:0EEB  6626c787940000000000 mov dword ptr es:[bx + 0x94], 0
loc_0EF5:
4:0EF5  c45e06               les bx, ptr [bp + 6]
4:0EF8  2683bf980000         cmp word ptr es:[bx + 0x98], 0
4:0EFE  7453                 je 0xf53
4:0F00  268b879800           mov ax, word ptr es:[bx + 0x98]
4:0F05  8946d6               mov word ptr [bp - 0x2a], ax
4:0F08  8bc8                 mov cx, ax
4:0F0A  03c0                 add ax, ax
4:0F0C  03c1                 add ax, cx
4:0F0E  03c0                 add ax, ax
4:0F10  50                   push ax
4:0F11  9a9c17350f           lcall 0xf35, 0x179c  ; operator_new@s1:179C
4:0F16  83c402               add sp, 2
4:0F19  8946e2               mov word ptr [bp - 0x1e], ax
4:0F1C  8956e4               mov word ptr [bp - 0x1c], dx
4:0F1F  0bd0                 or dx, ax
4:0F21  7423                 je 0xf46
4:0F23  ff76e4               push word ptr [bp - 0x1c]
4:0F26  50                   push ax
4:0F27  6a06                 push 6
4:0F29  ff76d6               push word ptr [bp - 0x2a]
4:0F2C  68f70f               push 0xff7  ; SEGMENT s2:0000
4:0F2F  68383e               push 0x3e38
4:0F32  9a8655d507           lcall 0x7d5, 0x5586  ; __vec_ctor@s1:5586
4:0F37  668b46e2             mov eax, dword ptr [bp - 0x1e]
4:0F3B  c45e06               les bx, ptr [bp + 6]
4:0F3E  662689879a00         mov dword ptr es:[bx + 0x9a], eax
4:0F44  eb0d                 jmp 0xf53
loc_0F46:
4:0F46  c45e06               les bx, ptr [bp + 6]
4:0F49  6626c7879a0000000000 mov dword ptr es:[bx + 0x9a], 0
loc_0F53:
4:0F53  837efe00             cmp word ptr [bp - 2], 0
4:0F57  7407                 je 0xf60
4:0F59  b80100               mov ax, 1
4:0F5C  99                   cdq
4:0F5D  eb07                 jmp 0xf66
4:0F5F  db 90
loc_0F60:
4:0F60  8b46fa               mov ax, word ptr [bp - 6]
4:0F63  8b56fc               mov dx, word ptr [bp - 4]
loc_0F66:
4:0F66  8946f6               mov word ptr [bp - 0xa], ax
4:0F69  8956f8               mov word ptr [bp - 8], dx
4:0F6C  66c746e600000000     mov dword ptr [bp - 0x1a], 0
loc_0F74:
4:0F74  8d46ee               lea ax, [bp - 0x12]
4:0F77  16                   push ss
4:0F78  50                   push ax
4:0F79  9aece4aa0f           lcall 0xfaa, 0xe4ec  ; DbIter::next@s6:E4EC
4:0F7E  8946ea               mov word ptr [bp - 0x16], ax
4:0F81  8956ec               mov word ptr [bp - 0x14], dx
4:0F84  0bd0                 or dx, ax
4:0F86  0f84ba00             je 0x1044
4:0F8A  c45eea               les bx, ptr [bp - 0x16]
4:0F8D  66268b870002         mov eax, dword ptr es:[bx + 0x200]
4:0F93  668946d6             mov dword ptr [bp - 0x2a], eax
4:0F97  66268b4710           mov eax, dword ptr es:[bx + 0x10]
4:0F9C  668946da             mov dword ptr [bp - 0x26], eax
4:0FA0  6650                 push eax
4:0FA2  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
4:0FA7  9aece15704           lcall 0x457, 0xe1ec  ; Db::resolveHandle@s6:E1EC
4:0FAC  8946de               mov word ptr [bp - 0x22], ax
4:0FAF  8956e0               mov word ptr [bp - 0x20], dx
4:0FB2  050c00               add ax, 0xc
4:0FB5  1e                   push ds
4:0FB6  8d7ed0               lea di, [bp - 0x30]
4:0FB9  8bf0                 mov si, ax
4:0FBB  16                   push ss
4:0FBC  07                   pop es
4:0FBD  8eda                 mov ds, dx
4:0FBF  66a5                 movsd dword ptr es:[di], dword ptr [si]
4:0FC1  a5                   movsw word ptr es:[di], word ptr [si]
4:0FC2  1f                   pop ds
4:0FC3  8d46d0               lea ax, [bp - 0x30]
4:0FC6  8946cc               mov word ptr [bp - 0x34], ax
4:0FC9  66817ed601000008     cmp dword ptr [bp - 0x2a], 0x8000001
4:0FD1  7529                 jne 0xffc
4:0FD3  16                   push ss
4:0FD4  50                   push ax
4:0FD5  c45e06               les bx, ptr [bp + 6]
4:0FD8  268b879400           mov ax, word ptr es:[bx + 0x94]
4:0FDD  268b979600           mov dx, word ptr es:[bx + 0x96]
4:0FE2  8b4ee8               mov cx, word ptr [bp - 0x18]
4:0FE5  ff46e8               inc word ptr [bp - 0x18]
loc_0FE8:
4:0FE8  8bd9                 mov bx, cx
4:0FEA  03c9                 add cx, cx
4:0FEC  03cb                 add cx, bx
4:0FEE  03c9                 add cx, cx
4:0FF0  03c1                 add ax, cx
4:0FF2  52                   push dx
4:0FF3  50                   push ax
4:0FF4  9a623f2110           lcall 0x1021, 0x3f62  ; Pos3::assign@s2:3F62
4:0FF9  e978ff               jmp 0xf74
loc_0FFC:
4:0FFC  c45e06               les bx, ptr [bp + 6]
4:0FFF  2683bfa80000         cmp word ptr es:[bx + 0xa8], 0
4:1005  7522                 jne 0x1029
4:1007  666801000004         push 0x4000001
4:100D  c45eea               les bx, ptr [bp - 0x16]
4:1010  6626ff7704           push dword ptr es:[bx + 4]
4:1015  c45e06               les bx, ptr [bp + 6]
4:1018  6626ffb7a200         push dword ptr es:[bx + 0xa2]
4:101E  9aa6df4c10           lcall 0x104c, 0xdfa6  ; TradeAgreements::countFor@s2:DFA6
4:1023  0bc0                 or ax, ax
4:1025  0f844bff             je 0xf74
loc_1029:
4:1029  8d46d0               lea ax, [bp - 0x30]
4:102C  16                   push ss
4:102D  50                   push ax
4:102E  c45e06               les bx, ptr [bp + 6]
4:1031  268b879a00           mov ax, word ptr es:[bx + 0x9a]
4:1036  268b979c00           mov dx, word ptr es:[bx + 0x9c]
4:103B  8b4ee6               mov cx, word ptr [bp - 0x1a]
4:103E  ff46e6               inc word ptr [bp - 0x1a]
4:1041  eba5                 jmp 0xfe8
4:1043  db 90
loc_1044:
4:1044  c746ee9a38           mov word ptr [bp - 0x12], 0x389a
4:1049  c746f0310c           mov word ptr [bp - 0x10], 0xc31  ; SEGMENT s2:0000
4:104E  5e                   pop si
4:104F  5f                   pop di
4:1050  c9                   leave
4:1051  ca0400               retf 4

; ---------------- MapViewModel::objectsSurface@s4:1054 FAR size=56 callers=1
;   list at +0x94 (made on first use)
4:1054  55                   push bp
4:1055  8bec                 mov bp, sp
4:1057  c45e06               les bx, ptr [bp + 6]
4:105A  662683bf940000       cmp dword ptr es:[bx + 0x94], 0
4:1061  7507                 jne 0x106a
4:1063  06                   push es
4:1064  53                   push bx
4:1065  90                   nop
4:1066  0e                   push cs
4:1067  e85cfd               call 0xdc6  ; MapViewModel::listColonyObjects@s4:0DC6
loc_106A:
4:106A  c45e06               les bx, ptr [bp + 6]
4:106D  66268b879400         mov eax, dword ptr es:[bx + 0x94]
4:1073  c45e0e               les bx, ptr [bp + 0xe]
4:1076  66268907             mov dword ptr es:[bx], eax
4:107A  c45e06               les bx, ptr [bp + 6]
4:107D  268b879200           mov ax, word ptr es:[bx + 0x92]
4:1082  c45e0a               les bx, ptr [bp + 0xa]
4:1085  268907               mov word ptr es:[bx], ax
4:1088  c9                   leave
4:1089  ca0c00               retf 0xc

; ---------------- MapViewModel::objectsUnderground@s4:108C FAR size=56 callers=1
;   list at +0x9A (made on first use)
4:108C  55                   push bp
4:108D  8bec                 mov bp, sp
4:108F  c45e06               les bx, ptr [bp + 6]
4:1092  662683bf9a0000       cmp dword ptr es:[bx + 0x9a], 0
4:1099  7507                 jne 0x10a2
4:109B  06                   push es
4:109C  53                   push bx
4:109D  90                   nop
4:109E  0e                   push cs
4:109F  e824fd               call 0xdc6  ; MapViewModel::listColonyObjects@s4:0DC6
loc_10A2:
4:10A2  c45e06               les bx, ptr [bp + 6]
4:10A5  66268b879a00         mov eax, dword ptr es:[bx + 0x9a]
4:10AB  c45e0e               les bx, ptr [bp + 0xe]
4:10AE  66268907             mov dword ptr es:[bx], eax
4:10B2  c45e06               les bx, ptr [bp + 6]
4:10B5  268b879800           mov ax, word ptr es:[bx + 0x98]
4:10BA  c45e0a               les bx, ptr [bp + 0xa]
4:10BD  268907               mov word ptr es:[bx], ax
4:10C0  c9                   leave
4:10C1  ca0c00               retf 0xc

; ---------------- MapViewModel::listBuildings@s4:10C4 FAR size=604 callers=1
;   the buildings by group
4:10C4  c8460000             enter 0x46, 0
4:10C8  57                   push di
4:10C9  56                   push si
4:10CA  c45e06               les bx, ptr [bp + 6]
4:10CD  268b878600           mov ax, word ptr es:[bx + 0x86]
4:10D2  8946fe               mov word ptr [bp - 2], ax
4:10D5  66268b878800         mov eax, dword ptr es:[bx + 0x88]
4:10DB  668946de             mov dword ptr [bp - 0x22], eax
4:10DF  668946da             mov dword ptr [bp - 0x26], eax
4:10E3  6650                 push eax
4:10E5  9ace17c011           lcall 0x11c0, 0x17ce  ; operator_delete@s1:17CE
4:10EA  83c404               add sp, 4
4:10ED  c45e06               les bx, ptr [bp + 6]
4:10F0  662bc0               sub eax, eax
4:10F3  2689878600           mov word ptr es:[bx + 0x86], ax
4:10F8  662689878800         mov dword ptr es:[bx + 0x88], eax
4:10FE  680004               push 0x400
4:1101  50                   push ax
4:1102  6a01                 push 1
4:1104  8d46ec               lea ax, [bp - 0x14]
4:1107  16                   push ss
4:1108  50                   push ax
4:1109  9a52dc2111           lcall 0x1121, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
4:110E  662bc0               sub eax, eax
4:1111  668946e8             mov dword ptr [bp - 0x18], eax
4:1115  668946e4             mov dword ptr [bp - 0x1c], eax
loc_1119:
4:1119  8d46ec               lea ax, [bp - 0x14]
4:111C  16                   push ss
4:111D  50                   push ax
4:111E  9aece42812           lcall 0x1228, 0xe4ec  ; DbIter::next@s6:E4EC
4:1123  8946e8               mov word ptr [bp - 0x18], ax
4:1126  8956ea               mov word ptr [bp - 0x16], dx
4:1129  0bd0                 or dx, ax
4:112B  746f                 je 0x119c
4:112D  c45ee8               les bx, ptr [bp - 0x18]
4:1130  66268b4708           mov eax, dword ptr es:[bx + 8]
4:1135  668946da             mov dword ptr [bp - 0x26], eax
4:1139  c45e06               les bx, ptr [bp + 6]
4:113C  662639473c           cmp dword ptr es:[bx + 0x3c], eax
4:1141  75d6                 jne 0x1119
4:1143  6a02                 push 2
4:1145  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
4:114A  9afac6d911           lcall 0x11d9, 0xc6fa  ; BldgGroups::get@s2:C6FA
4:114F  8946d6               mov word ptr [bp - 0x2a], ax
4:1152  8956d8               mov word ptr [bp - 0x28], dx
4:1155  52                   push dx
4:1156  50                   push ax
4:1157  66ff76e8             push dword ptr [bp - 0x18]
4:115B  9a784e6712           lcall 0x1267, 0x4e78  ; colonyTilesInGroupAll@s8:4E78
4:1160  8946d2               mov word ptr [bp - 0x2e], ax
4:1163  8956d4               mov word ptr [bp - 0x2c], dx
4:1166  52                   push dx
4:1167  c45ed2               les bx, ptr [bp - 0x2e]
4:116A  50                   push ax
4:116B  26c41f               les bx, ptr es:[bx]
4:116E  8bf3                 mov si, bx
4:1170  8cc7                 mov di, es
4:1172  26ff5f10             lcall es:[bx + 0x10]
4:1176  0146e4               add word ptr [bp - 0x1c], ax
4:1179  1156e6               adc word ptr [bp - 0x1a], dx
4:117C  668b46d2             mov eax, dword ptr [bp - 0x2e]
4:1180  668946ce             mov dword ptr [bp - 0x32], eax
4:1184  668946de             mov dword ptr [bp - 0x22], eax
4:1188  660bc0               or eax, eax
4:118B  748c                 je 0x1119
4:118D  6a01                 push 1
4:118F  ff76d4               push word ptr [bp - 0x2c]
4:1192  50                   push ax
4:1193  8ec7                 mov es, di
4:1195  26ff1c               lcall es:[si]
4:1198  e97eff               jmp 0x1119
4:119B  db 90
loc_119C:
4:119C  8b46e6               mov ax, word ptr [bp - 0x1a]
4:119F  0b46e4               or ax, word ptr [bp - 0x1c]
4:11A2  0f846a01             je 0x1310
4:11A6  8b46e4               mov ax, word ptr [bp - 0x1c]
4:11A9  c45e06               les bx, ptr [bp + 6]
4:11AC  2689878600           mov word ptr es:[bx + 0x86], ax
4:11B1  8946e2               mov word ptr [bp - 0x1e], ax
4:11B4  8bc8                 mov cx, ax
4:11B6  03c0                 add ax, ax
4:11B8  03c1                 add ax, cx
4:11BA  03c0                 add ax, ax
4:11BC  50                   push ax
4:11BD  9a9c17e111           lcall 0x11e1, 0x179c  ; operator_new@s1:179C
4:11C2  83c402               add sp, 2
4:11C5  8946ce               mov word ptr [bp - 0x32], ax
4:11C8  8956d0               mov word ptr [bp - 0x30], dx
4:11CB  0bd0                 or dx, ax
4:11CD  7423                 je 0x11f2
4:11CF  ff76d0               push word ptr [bp - 0x30]
4:11D2  50                   push ax
4:11D3  6a06                 push 6
4:11D5  ff76e2               push word ptr [bp - 0x1e]
4:11D8  685612               push 0x1256  ; SEGMENT s2:0000
4:11DB  68383e               push 0x3e38
4:11DE  9a8655f00d           lcall 0xdf0, 0x5586  ; __vec_ctor@s1:5586
4:11E3  668b46ce             mov eax, dword ptr [bp - 0x32]
4:11E7  c45e06               les bx, ptr [bp + 6]
4:11EA  662689878800         mov dword ptr es:[bx + 0x88], eax
4:11F0  eb0d                 jmp 0x11ff
loc_11F2:
4:11F2  c45e06               les bx, ptr [bp + 6]
4:11F5  6626c787880000000000 mov dword ptr es:[bx + 0x88], 0
loc_11FF:
4:11FF  837efc00             cmp word ptr [bp - 4], 0
4:1203  7407                 je 0x120c
4:1205  b80100               mov ax, 1
4:1208  99                   cdq
4:1209  eb07                 jmp 0x1212
4:120B  db 90
loc_120C:
4:120C  8b46f8               mov ax, word ptr [bp - 8]
4:120F  8b56fa               mov dx, word ptr [bp - 6]
loc_1212:
4:1212  8946f4               mov word ptr [bp - 0xc], ax
4:1215  8956f6               mov word ptr [bp - 0xa], dx
4:1218  66c746e400000000     mov dword ptr [bp - 0x1c], 0
loc_1220:
4:1220  8d46ec               lea ax, [bp - 0x14]
4:1223  16                   push ss
4:1224  50                   push ax
4:1225  9aece4dc0d           lcall 0xddc, 0xe4ec  ; DbIter::next@s6:E4EC
4:122A  8946e8               mov word ptr [bp - 0x18], ax
4:122D  8956ea               mov word ptr [bp - 0x16], dx
4:1230  0bd0                 or dx, ax
4:1232  0f84c400             je 0x12fa
4:1236  c45ee8               les bx, ptr [bp - 0x18]
4:1239  66268b4708           mov eax, dword ptr es:[bx + 8]
4:123E  668946d2             mov dword ptr [bp - 0x2e], eax
4:1242  c45e06               les bx, ptr [bp + 6]
4:1245  662639473c           cmp dword ptr es:[bx + 0x3c], eax
4:124A  75d4                 jne 0x1220
4:124C  6a02                 push 2
4:124E  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
4:1253  9afac6cd12           lcall 0x12cd, 0xc6fa  ; BldgGroups::get@s2:C6FA
4:1258  8946d6               mov word ptr [bp - 0x2a], ax
4:125B  8956d8               mov word ptr [bp - 0x28], dx
4:125E  52                   push dx
4:125F  50                   push ax
4:1260  66ff76e8             push dword ptr [bp - 0x18]
4:1264  9a784effff           lcall 0xffff, 0x4e78  ; colonyTilesInGroupAll@s8:4E78
4:1269  8946da               mov word ptr [bp - 0x26], ax
4:126C  8956dc               mov word ptr [bp - 0x24], dx
4:126F  52                   push dx
4:1270  c45eda               les bx, ptr [bp - 0x26]
4:1273  50                   push ax
4:1274  26c41f               les bx, ptr es:[bx]
4:1277  26ff5f10             lcall es:[bx + 0x10]
4:127B  8946ca               mov word ptr [bp - 0x36], ax
4:127E  8956cc               mov word ptr [bp - 0x34], dx
4:1281  66c746c600000000     mov dword ptr [bp - 0x3a], 0
4:1289  eb05                 jmp 0x1290
4:128B  db 90
loc_128C:
4:128C  66ff46c6             inc dword ptr [bp - 0x3a]
loc_1290:
4:1290  668b46ca             mov eax, dword ptr [bp - 0x36]
4:1294  663946c6             cmp dword ptr [bp - 0x3a], eax
4:1298  733c                 jae 0x12d6
4:129A  66ff76c6             push dword ptr [bp - 0x3a]
4:129E  66ff76da             push dword ptr [bp - 0x26]
4:12A2  9a581d2b09           lcall 0x92b, 0x1d58  ; HandleList::resolveAt@s7:1D58
4:12A7  8946c2               mov word ptr [bp - 0x3e], ax
4:12AA  8956c4               mov word ptr [bp - 0x3c], dx
4:12AD  050c00               add ax, 0xc
4:12B0  52                   push dx
4:12B1  50                   push ax
4:12B2  c45e06               les bx, ptr [bp + 6]
4:12B5  66268b878800         mov eax, dword ptr es:[bx + 0x88]
4:12BB  8b4ee4               mov cx, word ptr [bp - 0x1c]
4:12BE  8bd9                 mov bx, cx
4:12C0  03c9                 add cx, cx
4:12C2  03cb                 add cx, bx
4:12C4  03c9                 add cx, cx
4:12C6  03c1                 add ax, cx
4:12C8  6650                 push eax
4:12CA  9a623f1813           lcall 0x1318, 0x3f62  ; Pos3::assign@s2:3F62
4:12CF  66ff46e4             inc dword ptr [bp - 0x1c]
4:12D3  ebb7                 jmp 0x128c
4:12D5  db 90
loc_12D6:
4:12D6  668b46da             mov eax, dword ptr [bp - 0x26]
4:12DA  668946ce             mov dword ptr [bp - 0x32], eax
4:12DE  668946de             mov dword ptr [bp - 0x22], eax
4:12E2  660bc0               or eax, eax
4:12E5  0f8437ff             je 0x1220
4:12E9  6a01                 push 1
4:12EB  c45eda               les bx, ptr [bp - 0x26]
4:12EE  06                   push es
4:12EF  50                   push ax
4:12F0  26c41f               les bx, ptr es:[bx]
4:12F3  26ff1f               lcall es:[bx]
4:12F6  e927ff               jmp 0x1220
4:12F9  db 90
loc_12FA:
4:12FA  8b46fe               mov ax, word ptr [bp - 2]
4:12FD  c45e06               les bx, ptr [bp + 6]
4:1300  2639878600           cmp word ptr es:[bx + 0x86], ax
4:1305  7409                 je 0x1310
4:1307  6a06                 push 6
4:1309  06                   push es
4:130A  53                   push bx
4:130B  9a621fbe0c           lcall 0xcbe, 0x1f62  ; RegObj::notify@s3:1F62
loc_1310:
4:1310  c746ec9a38           mov word ptr [bp - 0x14], 0x389a
4:1315  c746ee850e           mov word ptr [bp - 0x12], 0xe85  ; SEGMENT s2:0000
4:131A  5e                   pop si
4:131B  5f                   pop di
4:131C  c9                   leave
4:131D  ca0400               retf 4

; ---------------- MapViewModel::buildingsList@s4:1320 FAR size=38 callers=1
;   list at +0x88/+0x86
4:1320  55                   push bp
4:1321  8bec                 mov bp, sp
4:1323  c45e06               les bx, ptr [bp + 6]
4:1326  66268b878800         mov eax, dword ptr es:[bx + 0x88]
4:132C  c45e0e               les bx, ptr [bp + 0xe]
4:132F  66268907             mov dword ptr es:[bx], eax
4:1333  c45e06               les bx, ptr [bp + 6]
4:1336  268b878600           mov ax, word ptr es:[bx + 0x86]
4:133B  c45e0a               les bx, ptr [bp + 0xa]
4:133E  268907               mov word ptr es:[bx], ax
4:1341  c9                   leave
4:1342  ca0c00               retf 0xc
4:1345  db 00

; ---------------- MapViewModel::listButtons@s4:1346 FAR size=688 callers=1
;   the list buttons (listbutn.bmp)
4:1346  c84c0000             enter 0x4c, 0
4:134A  c45e06               les bx, ptr [bp + 6]
4:134D  268b878c00           mov ax, word ptr es:[bx + 0x8c]
4:1352  8946fe               mov word ptr [bp - 2], ax
4:1355  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
4:135B  668946de             mov dword ptr [bp - 0x22], eax
4:135F  668946da             mov dword ptr [bp - 0x26], eax
4:1363  6650                 push eax
4:1365  9ace177e14           lcall 0x147e, 0x17ce  ; operator_delete@s1:17CE
4:136A  83c404               add sp, 4
4:136D  c45e06               les bx, ptr [bp + 6]
4:1370  662bc0               sub eax, eax
4:1373  2689878c00           mov word ptr es:[bx + 0x8c], ax
4:1378  662689878e00         mov dword ptr es:[bx + 0x8e], eax
4:137E  680004               push 0x400
4:1381  50                   push ax
4:1382  6a01                 push 1
4:1384  8d46ec               lea ax, [bp - 0x14]
4:1387  16                   push ss
4:1388  50                   push ax
4:1389  9a52dca113           lcall 0x13a1, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
4:138E  662bc0               sub eax, eax
4:1391  668946e8             mov dword ptr [bp - 0x18], eax
4:1395  668946e4             mov dword ptr [bp - 0x1c], eax
loc_1399:
4:1399  8d46ec               lea ax, [bp - 0x14]
4:139C  16                   push ss
4:139D  50                   push ax
4:139E  9aece4e614           lcall 0x14e6, 0xe4ec  ; DbIter::next@s6:E4EC
4:13A3  8946e8               mov word ptr [bp - 0x18], ax
4:13A6  8956ea               mov word ptr [bp - 0x16], dx
4:13A9  0bd0                 or dx, ax
4:13AB  0f84ab00             je 0x145a
4:13AF  c45ee8               les bx, ptr [bp - 0x18]
4:13B2  66268b4708           mov eax, dword ptr es:[bx + 8]
4:13B7  668946da             mov dword ptr [bp - 0x26], eax
4:13BB  c45e06               les bx, ptr [bp + 6]
4:13BE  662639473c           cmp dword ptr es:[bx + 0x3c], eax
4:13C3  75d4                 jne 0x1399
4:13C5  6a02                 push 2
4:13C7  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
4:13CC  9afac69714           lcall 0x1497, 0xc6fa  ; BldgGroups::get@s2:C6FA
4:13D1  8946d6               mov word ptr [bp - 0x2a], ax
4:13D4  8956d8               mov word ptr [bp - 0x28], dx
4:13D7  52                   push dx
4:13D8  50                   push ax
4:13D9  66ff76e8             push dword ptr [bp - 0x18]
4:13DD  9a784e2515           lcall 0x1525, 0x4e78  ; colonyTilesInGroupAll@s8:4E78
4:13E2  8946d2               mov word ptr [bp - 0x2e], ax
4:13E5  8956d4               mov word ptr [bp - 0x2c], dx
4:13E8  52                   push dx
4:13E9  c45ed2               les bx, ptr [bp - 0x2e]
4:13EC  50                   push ax
4:13ED  26c41f               les bx, ptr es:[bx]
4:13F0  26ff5f10             lcall es:[bx + 0x10]
4:13F4  8946ce               mov word ptr [bp - 0x32], ax
4:13F7  8956d0               mov word ptr [bp - 0x30], dx
4:13FA  66c746ca00000000     mov dword ptr [bp - 0x36], 0
4:1402  eb04                 jmp 0x1408
loc_1404:
4:1404  66ff46ca             inc dword ptr [bp - 0x36]
loc_1408:
4:1408  668b46ce             mov eax, dword ptr [bp - 0x32]
4:140C  663946ca             cmp dword ptr [bp - 0x36], eax
4:1410  7324                 jae 0x1436
4:1412  66ff76ca             push dword ptr [bp - 0x36]
4:1416  66ff76d2             push dword ptr [bp - 0x2e]
4:141A  9a7c1d6315           lcall 0x1563, 0x1d7c  ; HandleList::buildingAt@s7:1D7C
4:141F  8946c6               mov word ptr [bp - 0x3a], ax
4:1422  8956c8               mov word ptr [bp - 0x38], dx
4:1425  c45ec6               les bx, ptr [bp - 0x3a]
4:1428  26837f1209           cmp word ptr es:[bx + 0x12], 9
4:142D  75d5                 jne 0x1404
4:142F  66ff46e4             inc dword ptr [bp - 0x1c]
4:1433  ebcf                 jmp 0x1404
4:1435  db 90
loc_1436:
4:1436  668b46d2             mov eax, dword ptr [bp - 0x2e]
4:143A  668946bc             mov dword ptr [bp - 0x44], eax
4:143E  668946de             mov dword ptr [bp - 0x22], eax
4:1442  660bc0               or eax, eax
4:1445  0f8450ff             je 0x1399
4:1449  6a01                 push 1
4:144B  c45ed2               les bx, ptr [bp - 0x2e]
4:144E  06                   push es
4:144F  50                   push ax
4:1450  26c41f               les bx, ptr es:[bx]
4:1453  26ff1f               lcall es:[bx]
4:1456  e940ff               jmp 0x1399
4:1459  db 90
loc_145A:
4:145A  8b46e6               mov ax, word ptr [bp - 0x1a]
4:145D  0b46e4               or ax, word ptr [bp - 0x1c]
4:1460  0f848401             je 0x15e8
4:1464  8b46e4               mov ax, word ptr [bp - 0x1c]
4:1467  c45e06               les bx, ptr [bp + 6]
4:146A  2689878c00           mov word ptr es:[bx + 0x8c], ax
4:146F  8946e2               mov word ptr [bp - 0x1e], ax
4:1472  8bc8                 mov cx, ax
4:1474  03c0                 add ax, ax
4:1476  03c1                 add ax, cx
4:1478  03c0                 add ax, ax
4:147A  50                   push ax
4:147B  9a9c179f14           lcall 0x149f, 0x179c  ; operator_new@s1:179C
4:1480  83c402               add sp, 2
4:1483  8946bc               mov word ptr [bp - 0x44], ax
4:1486  8956be               mov word ptr [bp - 0x42], dx
4:1489  0bd0                 or dx, ax
4:148B  7423                 je 0x14b0
4:148D  ff76be               push word ptr [bp - 0x42]
4:1490  50                   push ax
4:1491  6a06                 push 6
4:1493  ff76e2               push word ptr [bp - 0x1e]
4:1496  681415               push 0x1514  ; SEGMENT s2:0000 | 'listbutn.bmp'
4:1499  68383e               push 0x3e38
4:149C  9a8655e810           lcall 0x10e8, 0x5586  ; __vec_ctor@s1:5586
4:14A1  668b46bc             mov eax, dword ptr [bp - 0x44]
4:14A5  c45e06               les bx, ptr [bp + 6]
4:14A8  662689878e00         mov dword ptr es:[bx + 0x8e], eax
4:14AE  eb0d                 jmp 0x14bd
loc_14B0:
4:14B0  c45e06               les bx, ptr [bp + 6]
4:14B3  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
loc_14BD:
4:14BD  837efc00             cmp word ptr [bp - 4], 0
4:14C1  7407                 je 0x14ca
4:14C3  b80100               mov ax, 1
4:14C6  99                   cdq
4:14C7  eb07                 jmp 0x14d0
4:14C9  db 90
loc_14CA:
4:14CA  8b46f8               mov ax, word ptr [bp - 8]
4:14CD  8b56fa               mov dx, word ptr [bp - 6]
loc_14D0:
4:14D0  8946f4               mov word ptr [bp - 0xc], ax
4:14D3  8956f6               mov word ptr [bp - 0xa], dx
4:14D6  66c746e400000000     mov dword ptr [bp - 0x1c], 0
loc_14DE:
4:14DE  8d46ec               lea ax, [bp - 0x14]
4:14E1  16                   push ss
4:14E2  50                   push ax
4:14E3  9aece40c11           lcall 0x110c, 0xe4ec  ; DbIter::next@s6:E4EC
4:14E8  8946e8               mov word ptr [bp - 0x18], ax
4:14EB  8956ea               mov word ptr [bp - 0x16], dx
4:14EE  0bd0                 or dx, ax
4:14F0  0f84de00             je 0x15d2
4:14F4  c45ee8               les bx, ptr [bp - 0x18]
4:14F7  66268b4708           mov eax, dword ptr es:[bx + 8]
4:14FC  668946c0             mov dword ptr [bp - 0x40], eax
4:1500  c45e06               les bx, ptr [bp + 6]
4:1503  662639473c           cmp dword ptr es:[bx + 0x3c], eax
4:1508  75d4                 jne 0x14de
4:150A  6a02                 push 2
4:150C  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
4:1511  9afac6a615           lcall 0x15a6, 0xc6fa  ; BldgGroups::get@s2:C6FA
4:1516  8946c6               mov word ptr [bp - 0x3a], ax
4:1519  8956c8               mov word ptr [bp - 0x38], dx
4:151C  52                   push dx
4:151D  50                   push ax
4:151E  66ff76e8             push dword ptr [bp - 0x18]
4:1522  9a784e5e11           lcall 0x115e, 0x4e78  ; colonyTilesInGroupAll@s8:4E78
4:1527  8946ca               mov word ptr [bp - 0x36], ax
4:152A  8956cc               mov word ptr [bp - 0x34], dx
4:152D  52                   push dx
4:152E  c45eca               les bx, ptr [bp - 0x36]
4:1531  50                   push ax
4:1532  26c41f               les bx, ptr es:[bx]
4:1535  26ff5f10             lcall es:[bx + 0x10]
4:1539  8946ce               mov word ptr [bp - 0x32], ax
4:153C  8956d0               mov word ptr [bp - 0x30], dx
4:153F  66c746d200000000     mov dword ptr [bp - 0x2e], 0
4:1547  eb05                 jmp 0x154e
4:1549  db 90
loc_154A:
4:154A  66ff46d2             inc dword ptr [bp - 0x2e]
loc_154E:
4:154E  668b46ce             mov eax, dword ptr [bp - 0x32]
4:1552  663946d2             cmp dword ptr [bp - 0x2e], eax
4:1556  7356                 jae 0x15ae
4:1558  66ff76d2             push dword ptr [bp - 0x2e]
4:155C  66ff76ca             push dword ptr [bp - 0x36]
4:1560  9a581d7015           lcall 0x1570, 0x1d58  ; HandleList::resolveAt@s7:1D58
4:1565  8946d6               mov word ptr [bp - 0x2a], ax
4:1568  8956d8               mov word ptr [bp - 0x28], dx
4:156B  52                   push dx
4:156C  50                   push ax
4:156D  9aa873a512           lcall 0x12a5, 0x73a8  ; DbObj::resolveLink16@s7:73A8
4:1572  8946da               mov word ptr [bp - 0x26], ax
4:1575  8956dc               mov word ptr [bp - 0x24], dx
4:1578  c45eda               les bx, ptr [bp - 0x26]
4:157B  26837f1209           cmp word ptr es:[bx + 0x12], 9
4:1580  75c8                 jne 0x154a
4:1582  668b46d6             mov eax, dword ptr [bp - 0x2a]
4:1586  050c00               add ax, 0xc
4:1589  6650                 push eax
4:158B  c45e06               les bx, ptr [bp + 6]
4:158E  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
4:1594  8b4ee4               mov cx, word ptr [bp - 0x1c]
4:1597  8bd9                 mov bx, cx
4:1599  03c9                 add cx, cx
4:159B  03cb                 add cx, bx
4:159D  03c9                 add cx, cx
4:159F  03c1                 add ax, cx
4:15A1  6650                 push eax
4:15A3  9a623ff015           lcall 0x15f0, 0x3f62  ; Pos3::assign@s2:3F62
4:15A8  66ff46e4             inc dword ptr [bp - 0x1c]
4:15AC  eb9c                 jmp 0x154a
loc_15AE:
4:15AE  668b46ca             mov eax, dword ptr [bp - 0x36]
4:15B2  668946bc             mov dword ptr [bp - 0x44], eax
4:15B6  668946de             mov dword ptr [bp - 0x22], eax
4:15BA  660bc0               or eax, eax
4:15BD  0f841dff             je 0x14de
4:15C1  6a01                 push 1
4:15C3  c45eca               les bx, ptr [bp - 0x36]
4:15C6  06                   push es
4:15C7  50                   push ax
4:15C8  26c41f               les bx, ptr es:[bx]
4:15CB  26ff1f               lcall es:[bx]
4:15CE  e90dff               jmp 0x14de
4:15D1  db 90
loc_15D2:
4:15D2  8b46fe               mov ax, word ptr [bp - 2]
4:15D5  c45e06               les bx, ptr [bp + 6]
4:15D8  2639878c00           cmp word ptr es:[bx + 0x8c], ax
4:15DD  7409                 je 0x15e8
4:15DF  6a06                 push 6
4:15E1  06                   push es
4:15E2  53                   push bx
4:15E3  9a621f0e13           lcall 0x130e, 0x1f62  ; RegObj::notify@s3:1F62
loc_15E8:
4:15E8  c746ec9a38           mov word ptr [bp - 0x14], 0x389a
4:15ED  c746ee4d11           mov word ptr [bp - 0x12], 0x114d  ; SEGMENT s2:0000
4:15F2  c9                   leave
4:15F3  ca0400               retf 4

; ---------------- MapViewModel::buttonsList@s4:15F6 FAR size=38 callers=1
;   list at +0x8E/+0x8C
4:15F6  55                   push bp
4:15F7  8bec                 mov bp, sp
4:15F9  c45e06               les bx, ptr [bp + 6]
4:15FC  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
4:1602  c45e0e               les bx, ptr [bp + 0xe]
4:1605  66268907             mov dword ptr es:[bx], eax
4:1609  c45e06               les bx, ptr [bp + 6]
4:160C  268b878c00           mov ax, word ptr es:[bx + 0x8c]
4:1611  c45e0a               les bx, ptr [bp + 0xa]
4:1614  268907               mov word ptr es:[bx], ax
4:1617  c9                   leave
4:1618  ca0c00               retf 0xc
4:161B  db 00

; ---------------- MapViewModel::cellOf@s4:161C FAR size=70 callers=3
;   map cell of a window point
4:161C  c80e0000             enter 0xe, 0
4:1620  8d46fe               lea ax, [bp - 2]
4:1623  16                   push ss
4:1624  50                   push ax
4:1625  8d4efc               lea cx, [bp - 4]
4:1628  16                   push ss
4:1629  51                   push cx
4:162A  668b5606             mov edx, dword ptr [bp + 6]
4:162E  83c236               add dx, 0x36
4:1631  6652                 push edx
4:1633  9a943e5c16           lcall 0x165c, 0x3e94  ; Pos3::getXY@s2:3E94
4:1638  8b4610               mov ax, word ptr [bp + 0x10]
4:163B  2d0300               sub ax, 3
4:163E  0146fe               add word ptr [bp - 2], ax
4:1641  8b460e               mov ax, word ptr [bp + 0xe]
4:1644  2d0300               sub ax, 3
4:1647  0146fc               add word ptr [bp - 4], ax
4:164A  66ff76fc             push dword ptr [bp - 4]
4:164E  c45e06               les bx, ptr [bp + 6]
4:1651  26ff7744             push word ptr es:[bx + 0x44]
4:1655  66ff760a             push dword ptr [bp + 0xa]
4:1659  9a763ecf13           lcall 0x13cf, 0x3e76  ; Pos3::set@s2:3E76
4:165E  c9                   leave
4:165F  ca0c00               retf 0xc

; ---------------- MapViewModel::scrollBy@s4:1662 FAR size=60 callers=2
;   scrolls by an offset
4:1662  c80e0000             enter 0xe, 0
4:1666  8d46fe               lea ax, [bp - 2]
4:1669  16                   push ss
4:166A  50                   push ax
4:166B  8d46fc               lea ax, [bp - 4]
4:166E  16                   push ss
4:166F  50                   push ax
4:1670  668b4606             mov eax, dword ptr [bp + 6]
4:1674  053600               add ax, 0x36
4:1677  6650                 push eax
4:1679  9a943e3616           lcall 0x1636, 0x3e94  ; Pos3::getXY@s2:3E94
4:167E  8b46fe               mov ax, word ptr [bp - 2]
4:1681  03460c               add ax, word ptr [bp + 0xc]
4:1684  50                   push ax
4:1685  8b46fc               mov ax, word ptr [bp - 4]
4:1688  03460a               add ax, word ptr [bp + 0xa]
4:168B  50                   push ax
4:168C  c45e06               les bx, ptr [bp + 6]
4:168F  26ff7744             push word ptr es:[bx + 0x44]
4:1693  06                   push es
4:1694  53                   push bx
4:1695  90                   nop
4:1696  0e                   push cs
4:1697  e81e00               call 0x16b8  ; MapViewModel::setOrigin@s4:16B8
4:169A  c9                   leave
4:169B  ca0800               retf 8

; ---------------- MapViewModel::scrollToLevel@s4:169E FAR size=26 callers=1
;   scrolls on the current level
4:169E  c80a0000             enter 0xa, 0
4:16A2  66ff760a             push dword ptr [bp + 0xa]
4:16A6  c45e06               les bx, ptr [bp + 6]
4:16A9  26ff7744             push word ptr es:[bx + 0x44]
4:16AD  06                   push es
4:16AE  53                   push bx
4:16AF  90                   nop
4:16B0  0e                   push cs
4:16B1  e80400               call 0x16b8  ; MapViewModel::setOrigin@s4:16B8
4:16B4  c9                   leave
4:16B5  ca0800               retf 8

; ---------------- MapViewModel::setOrigin@s4:16B8 FAR size=230 callers=3
;   the map origin, notice 4
4:16B8  c80c0000             enter 0xc, 0
4:16BC  57                   push di
4:16BD  56                   push si
4:16BE  8b460e               mov ax, word ptr [bp + 0xe]
4:16C1  2d0300               sub ax, 3
4:16C4  0bc0                 or ax, ax
4:16C6  7f05                 jg 0x16cd
4:16C8  c7460e0300           mov word ptr [bp + 0xe], 3
loc_16CD:
4:16CD  8b460c               mov ax, word ptr [bp + 0xc]
4:16D0  2d0300               sub ax, 3
4:16D3  0bc0                 or ax, ax
4:16D5  7f05                 jg 0x16dc
4:16D7  c7460c0300           mov word ptr [bp + 0xc], 3
loc_16DC:
4:16DC  c45e06               les bx, ptr [bp + 6]
4:16DF  26c45f5a             les bx, ptr es:[bx + 0x5a]
4:16E3  8b4e0e               mov cx, word ptr [bp + 0xe]
4:16E6  268b4704             mov ax, word ptr es:[bx + 4]
4:16EA  83c102               add cx, 2
4:16ED  3bc1                 cmp ax, cx
4:16EF  7f06                 jg 0x16f7
4:16F1  2d0300               sub ax, 3
4:16F4  89460e               mov word ptr [bp + 0xe], ax
loc_16F7:
4:16F7  c45e06               les bx, ptr [bp + 6]
4:16FA  26c45f5a             les bx, ptr es:[bx + 0x5a]
4:16FE  8b4e0c               mov cx, word ptr [bp + 0xc]
4:1701  268b4708             mov ax, word ptr es:[bx + 8]
4:1705  83c102               add cx, 2
4:1708  3bc1                 cmp ax, cx
4:170A  7f06                 jg 0x1712
4:170C  2d0300               sub ax, 3
4:170F  89460c               mov word ptr [bp + 0xc], ax
loc_1712:
4:1712  66ff760c             push dword ptr [bp + 0xc]
4:1716  ff760a               push word ptr [bp + 0xa]
4:1719  668b4606             mov eax, dword ptr [bp + 6]
4:171D  053000               add ax, 0x30
4:1720  6650                 push eax
4:1722  9a763e4317           lcall 0x1743, 0x3e76  ; Pos3::set@s2:3E76
4:1727  8d46fe               lea ax, [bp - 2]
4:172A  16                   push ss
4:172B  50                   push ax
4:172C  8d46fc               lea ax, [bp - 4]
4:172F  16                   push ss
4:1730  50                   push ax
4:1731  8b4606               mov ax, word ptr [bp + 6]
4:1734  8b5608               mov dx, word ptr [bp + 8]
4:1737  053600               add ax, 0x36
4:173A  52                   push dx
4:173B  50                   push ax
4:173C  8bf0                 mov si, ax
4:173E  8bfa                 mov di, dx
4:1740  9a943e5017           lcall 0x1750, 0x3e94  ; Pos3::getXY@s2:3E94
4:1745  66ff760c             push dword ptr [bp + 0xc]
4:1749  6a00                 push 0
4:174B  57                   push di
4:174C  56                   push si
4:174D  9a763e7c16           lcall 0x167c, 0x3e76  ; Pos3::set@s2:3E76
4:1752  c45e06               les bx, ptr [bp + 6]
4:1755  6626c7474c00000000   mov dword ptr es:[bx + 0x4c], 0
4:175E  c45e06               les bx, ptr [bp + 6]
4:1761  66268b473c           mov eax, dword ptr es:[bx + 0x3c]
4:1766  26c45f2c             les bx, ptr es:[bx + 0x2c]
4:176A  6626394720           cmp dword ptr es:[bx + 0x20], eax
4:176F  7526                 jne 0x1797
4:1771  c45e06               les bx, ptr [bp + 6]
4:1774  6626ff773c           push dword ptr es:[bx + 0x3c]
4:1779  6626ff772c           push dword ptr es:[bx + 0x2c]
4:177E  90                   nop
4:177F  0e                   push cs
4:1780  e809eb               call 0x28c  ; MapViewModel::build@s4:028C
4:1783  c45e06               les bx, ptr [bp + 6]
4:1786  2689474c             mov word ptr es:[bx + 0x4c], ax
4:178A  2689574e             mov word ptr es:[bx + 0x4e], dx
4:178E  6a04                 push 4
4:1790  06                   push es
4:1791  53                   push bx
4:1792  9a621fe615           lcall 0x15e6, 0x1f62  ; RegObj::notify@s3:1F62
loc_1797:
4:1797  5e                   pop si
4:1798  5f                   pop di
4:1799  c9                   leave
4:179A  ca0a00               retf 0xa
4:179D  db 00

; ---------------- MapViewModel::restoreOrigin@s4:179E FAR size=48 callers=1
;   origin from a saved position
4:179E  c8060000             enter 6, 0
4:17A2  8d46fe               lea ax, [bp - 2]
4:17A5  16                   push ss
4:17A6  50                   push ax
4:17A7  8d4efc               lea cx, [bp - 4]
4:17AA  16                   push ss
4:17AB  51                   push cx
4:17AC  8d56fa               lea dx, [bp - 6]
4:17AF  16                   push ss
4:17B0  52                   push dx
4:17B1  66ff760a             push dword ptr [bp + 0xa]
4:17B5  9ab43e2517           lcall 0x1725, 0x3eb4  ; Pos3::get@s2:3EB4
4:17BA  66ff76fc             push dword ptr [bp - 4]
4:17BE  ff76fa               push word ptr [bp - 6]
4:17C1  66ff7606             push dword ptr [bp + 6]
4:17C5  90                   nop
4:17C6  0e                   push cs
4:17C7  e8eefe               call 0x16b8  ; MapViewModel::setOrigin@s4:16B8
4:17CA  c9                   leave
4:17CB  ca0800               retf 8

; ---------------- MapViewModel::place@s4:17CE FAR size=34 callers=1
;   places a building at a cell
4:17CE  55                   push bp
4:17CF  8bec                 mov bp, sp
4:17D1  c45e06               les bx, ptr [bp + 6]
4:17D4  6626ff773c           push dword ptr es:[bx + 0x3c]
4:17D9  66ff760e             push dword ptr [bp + 0xe]
4:17DD  66ff760a             push dword ptr [bp + 0xa]
4:17E1  6626ff772c           push dword ptr es:[bx + 0x2c]
4:17E6  90                   nop
4:17E7  0e                   push cs
4:17E8  e827ec               call 0x412  ; MapViewModel::putBuilding@s4:0412
4:17EB  c9                   leave
4:17EC  ca0c00               retf 0xc
4:17EF  db 00

; ---------------- firstFreeLevel@s4:17F0 FAR size=44 callers=1
;   first level with no object (DGROUP 0x3962)
4:17F0  c8020000             enter 2, 0
4:17F4  56                   push si
4:17F5  c746fe0000           mov word ptr [bp - 2], 0
4:17FA  eb03                 jmp 0x17ff
loc_17FC:
4:17FC  ff46fe               inc word ptr [bp - 2]
loc_17FF:
4:17FF  837efe04             cmp word ptr [bp - 2], 4
4:1803  7d0f                 jge 0x1814
4:1805  8b5efe               mov bx, word ptr [bp - 2]
4:1808  03db                 add bx, bx
4:180A  c4366239             les si, ptr [0x3962]
4:180E  26833800             cmp word ptr es:[bx + si], 0
4:1812  75e8                 jne 0x17fc
loc_1814:
4:1814  8b46fe               mov ax, word ptr [bp - 2]
4:1817  5e                   pop si
4:1818  c9                   leave
4:1819  ca0400               retf 4

; ---------------- MapViewModel::pickSite@s4:181C FAR size=38 callers=1
;   the colony picks a site object
4:181C  c8040000             enter 4, 0
4:1820  66ff760a             push dword ptr [bp + 0xa]
4:1824  c45e06               les bx, ptr [bp + 6]
4:1827  6626ff773c           push dword ptr es:[bx + 0x3c]
4:182C  66ff364857           push dword ptr [0x5748]  ; g_sim
4:1831  9a44833b18           lcall 0x183b, 0x8344  ; Sim::resolve@s7:8344
4:1836  52                   push dx
4:1837  50                   push ax
4:1838  9a6c5b1d14           lcall 0x141d, 0x5b6c  ; Site::rename@s7:5B6C
4:183D  c9                   leave
4:183E  ca0800               retf 8
4:1841  db 00

; ---------------- MapViewModel::thunk_dtor@s4:1842 FAR size=12 callers=0
;   this-adjusting thunk
4:1842  8bdc                 mov bx, sp
4:1844  36836f0420           sub word ptr ss:[bx + 4], 0x20
4:1849  e90200               jmp 0x184e
4:184C  db 90 90

; ---------------- MapViewModel::scalar_dtor@s4:184E FAR size=106 callers=0
;   deleting destructor
4:184E  55                   push bp
4:184F  8bec                 mov bp, sp
4:1851  66ff7606             push dword ptr [bp + 6]
4:1855  90                   nop
4:1856  0e                   push cs
4:1857  e834ef               call 0x78e  ; MapViewModel::~MapViewModel@s4:078E
4:185A  f6460a01             test byte ptr [bp + 0xa], 1
4:185E  7409                 je 0x1869
4:1860  66ff7606             push dword ptr [bp + 6]
4:1864  9ace176813           lcall 0x1368, 0x17ce  ; operator_delete@s1:17CE
loc_1869:
4:1869  8b4606               mov ax, word ptr [bp + 6]
4:186C  8b5608               mov dx, word ptr [bp + 8]
4:186F  c9                   leave
4:1870  ca0600               retf 6
4:1873  db 90 4e 18 8a 18 f2 1d 7e 18 ce 1d 82 18 d4 1d 86
4:1883  db 18 a0 49 92 18 2c 4c 8e 18 78 4b 96 18 b0 49 a2
4:1893  db 18 a8 09 9a 18 76 0d 9e 18 a0 0a 9f 07 e0 49 a6
4:18A3  db 18 ee 49 aa 18 00 4a ae 18 12 4a 95 17 42 18 b6
4:18B3  db 18 f4 0b 76 18

; ---------------- StarMapModel::StarMapModel@s4:18B8 FAR size=332 callers=1
;   registry 0x06: the star map (vtable 1FB0)
4:18B8  c8200000             enter 0x20, 0
4:18BC  ff760a               push word ptr [bp + 0xa]
4:18BF  6a00                 push 0
4:18C1  66ff7606             push dword ptr [bp + 6]
4:18C5  90                   nop
4:18C6  0e                   push cs
4:18C7  e85432               call 0x4b1e  ; WindowModel::WindowModel@s4:4B1E
4:18CA  c45e06               les bx, ptr [bp + 6]
4:18CD  26c747209a38         mov word ptr es:[bx + 0x20], 0x389a
4:18D3  26c74722e618         mov word ptr es:[bx + 0x22], 0x18e6  ; SEGMENT s2:0000
4:18D9  c45e06               les bx, ptr [bp + 6]
4:18DC  26c74720a83a         mov word ptr es:[bx + 0x20], 0x3aa8
4:18E2  26c747220219         mov word ptr es:[bx + 0x22], 0x1902  ; SEGMENT s2:0000
4:18E8  c45e06               les bx, ptr [bp + 6]
4:18EB  6626c7472400000000   mov dword ptr es:[bx + 0x24], 0
4:18F4  26c747280400         mov word ptr es:[bx + 0x28], 4
4:18FA  8d473a               lea ax, [bx + 0x3a]
4:18FD  06                   push es
4:18FE  50                   push ax
4:18FF  9a383e6b19           lcall 0x196b, 0x3e38  ; Pos3::Pos3@s2:3E38
4:1904  c45e06               les bx, ptr [bp + 6]
4:1907  662bc0               sub eax, eax
4:190A  6626894740           mov dword ptr es:[bx + 0x40], eax
4:190F  26894744             mov word ptr es:[bx + 0x44], ax
4:1913  6626894746           mov dword ptr es:[bx + 0x46], eax
4:1918  2689474a             mov word ptr es:[bx + 0x4a], ax
4:191C  26894756             mov word ptr es:[bx + 0x56], ax
4:1920  26c707b01f           mov word ptr es:[bx], 0x1fb0
4:1925  26c747023519         mov word ptr es:[bx + 2], 0x1935  ; SEGMENT s4:0000
4:192B  26c74720ec1f         mov word ptr es:[bx + 0x20], 0x1fec
4:1931  26c74722b218         mov word ptr es:[bx + 0x22], 0x18b2  ; SEGMENT s4:0000
4:1937  6a08                 push 8
4:1939  50                   push ax
4:193A  8d474e               lea ax, [bx + 0x4e]
4:193D  06                   push es
4:193E  50                   push ax
4:193F  9a0649a719           lcall 0x19a7, 0x4906  ; _fmemset@s1:4906
4:1944  83c408               add sp, 8
4:1947  8d46fe               lea ax, [bp - 2]
4:194A  16                   push ss
4:194B  50                   push ax
4:194C  8d46fc               lea ax, [bp - 4]
4:194F  16                   push ss
4:1950  50                   push ax
4:1951  6a48                 push 0x48
4:1953  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:1958  9aba207819           lcall 0x1978, 0x20ba  ; Registry_get@s3:20BA
4:195D  8946f8               mov word ptr [bp - 8], ax
4:1960  8956fa               mov word ptr [bp - 6], dx
4:1963  050e00               add ax, 0xe
4:1966  52                   push dx
4:1967  50                   push ax
4:1968  9a943e8d19           lcall 0x198d, 0x3e94  ; Pos3::getXY@s2:3E94
4:196D  689a00               push 0x9a
4:1970  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:1975  9a0a837a18           lcall 0x187a, 0x830a  ; ResLibr::picture@s3:830A
4:197A  c45e06               les bx, ptr [bp + 6]
4:197D  26894724             mov word ptr es:[bx + 0x24], ax
4:1981  26895726             mov word ptr es:[bx + 0x26], dx
4:1985  52                   push dx
4:1986  26ff7724             push word ptr es:[bx + 0x24]
4:198A  9a7247f719           lcall 0x19f7, 0x4772  ; DIB::rect@s2:4772
4:198F  8946f4               mov word ptr [bp - 0xc], ax
4:1992  8956f6               mov word ptr [bp - 0xa], dx
4:1995  666800000800         push 0x80000
4:199B  668b4606             mov eax, dword ptr [bp + 6]
4:199F  053200               add ax, 0x32
4:19A2  6650                 push eax
4:19A4  9a06496718           lcall 0x1867, 0x4906  ; _fmemset@s1:4906
4:19A9  83c408               add sp, 8
4:19AC  c45ef4               les bx, ptr [bp - 0xc]
4:19AF  268b4704             mov ax, word ptr es:[bx + 4]
4:19B3  c45e06               les bx, ptr [bp + 6]
4:19B6  26894736             mov word ptr es:[bx + 0x36], ax
4:19BA  c45ef4               les bx, ptr [bp - 0xc]
4:19BD  268b4708             mov ax, word ptr es:[bx + 8]
4:19C1  c45e06               les bx, ptr [bp + 6]
4:19C4  26894738             mov word ptr es:[bx + 0x38], ax
4:19C8  8b46fe               mov ax, word ptr [bp - 2]
4:19CB  051400               add ax, 0x14
4:19CE  2689472a             mov word ptr es:[bx + 0x2a], ax
4:19D2  8b46fc               mov ax, word ptr [bp - 4]
4:19D5  051400               add ax, 0x14
4:19D8  2689472c             mov word ptr es:[bx + 0x2c], ax
4:19DC  06                   push es
4:19DD  53                   push bx
4:19DE  90                   nop
4:19DF  0e                   push cs
4:19E0  e8bd04               call 0x1ea0  ; StarMapModel::metrics@s4:1EA0
4:19E3  666888009900         push 0x990088
4:19E9  6a00                 push 0
4:19EB  668b4606             mov eax, dword ptr [bp + 6]
4:19EF  053a00               add ax, 0x3a
4:19F2  6650                 push eax
4:19F4  9a763eb817           lcall 0x17b8, 0x3e76  ; Pos3::set@s2:3E76
4:19F9  8b4606               mov ax, word ptr [bp + 6]
4:19FC  8b5608               mov dx, word ptr [bp + 8]
4:19FF  c9                   leave
4:1A00  ca0600               retf 6
4:1A03  db 00

; ---------------- StarMapModel::~StarMapModel@s4:1A04 FAR size=138 callers=1
;   dtor
4:1A04  c8140000             enter 0x14, 0
4:1A08  56                   push si
4:1A09  c45e06               les bx, ptr [bp + 6]
4:1A0C  26c707b01f           mov word ptr es:[bx], 0x1fb0
4:1A11  26c74702211a         mov word ptr es:[bx + 2], 0x1a21  ; SEGMENT s4:0000 | '640.bmp'
4:1A17  26c74720ec1f         mov word ptr es:[bx + 0x20], 0x1fec
4:1A1D  26c747222919         mov word ptr es:[bx + 0x22], 0x1929  ; SEGMENT s4:0000 | '609.bmp'
4:1A23  268b4724             mov ax, word ptr es:[bx + 0x24]
4:1A27  268b5726             mov dx, word ptr es:[bx + 0x26]
4:1A2B  8bda                 mov bx, dx
4:1A2D  0bd0                 or dx, ax
4:1A2F  740e                 je 0x1a3f
4:1A31  6a01                 push 1
4:1A33  53                   push bx
4:1A34  50                   push ax
4:1A35  8ec3                 mov es, bx
4:1A37  8bf0                 mov si, ax
4:1A39  26c41c               les bx, ptr es:[si]
4:1A3C  26ff1f               lcall es:[bx]
loc_1A3F:
4:1A3F  c45e06               les bx, ptr [bp + 6]
4:1A42  66268b4740           mov eax, dword ptr es:[bx + 0x40]
4:1A47  668946f4             mov dword ptr [bp - 0xc], eax
4:1A4B  6650                 push eax
4:1A4D  9ace174219           lcall 0x1942, 0x17ce  ; operator_delete@s1:17CE
4:1A52  83c404               add sp, 4
4:1A55  66837e0600           cmp dword ptr [bp + 6], 0
4:1A5A  740c                 je 0x1a68
4:1A5C  8b4606               mov ax, word ptr [bp + 6]
4:1A5F  8b5608               mov dx, word ptr [bp + 8]
4:1A62  052000               add ax, 0x20
4:1A65  eb04                 jmp 0x1a6b
4:1A67  db 90
loc_1A68:
4:1A68  33c0                 xor ax, ax
4:1A6A  99                   cdq
loc_1A6B:
4:1A6B  8946f4               mov word ptr [bp - 0xc], ax
4:1A6E  8956f6               mov word ptr [bp - 0xa], dx
4:1A71  c45ef4               les bx, ptr [bp - 0xc]
4:1A74  26c7079a38           mov word ptr es:[bx], 0x389a
4:1A79  26c74702d718         mov word ptr es:[bx + 2], 0x18d7  ; SEGMENT s2:0000
4:1A7F  66ff7606             push dword ptr [bp + 6]
4:1A83  9a801d5b19           lcall 0x195b, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:1A88  5e                   pop si
4:1A89  c9                   leave
4:1A8A  ca0400               retf 4
4:1A8D  db 00

; ---------------- StarMapModel::build@s4:1A8E FAR size=116 callers=1
;   lays out the stars
4:1A8E  c80a0000             enter 0xa, 0
4:1A92  c45e06               les bx, ptr [bp + 6]
4:1A95  26837f4400           cmp word ptr es:[bx + 0x44], 0
4:1A9A  742a                 je 0x1ac6
4:1A9C  6626837f4600         cmp dword ptr es:[bx + 0x46], 0
4:1AA2  7416                 je 0x1aba
4:1AA4  26c45f46             les bx, ptr es:[bx + 0x46]
4:1AA8  26c7470e0000         mov word ptr es:[bx + 0xe], 0
4:1AAE  c45e06               les bx, ptr [bp + 6]
4:1AB1  6626c7474600000000   mov dword ptr es:[bx + 0x46], 0
loc_1ABA:
4:1ABA  c45e06               les bx, ptr [bp + 6]
4:1ABD  26ff474a             inc word ptr es:[bx + 0x4a]
4:1AC1  c9                   leave
4:1AC2  ca0400               retf 4
4:1AC5  db 90
loc_1AC6:
4:1AC6  8d46fa               lea ax, [bp - 6]
4:1AC9  16                   push ss
4:1ACA  50                   push ax
4:1ACB  6a03                 push 3
4:1ACD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:1AD2  9aba20e21a           lcall 0x1ae2, 0x20ba  ; Registry_get@s3:20BA
4:1AD7  8946f6               mov word ptr [bp - 0xa], ax
4:1ADA  8956f8               mov word ptr [bp - 8], dx
4:1ADD  52                   push dx
4:1ADE  50                   push ax
4:1ADF  9a1ebf861a           lcall 0x1a86, 0xbf1e  ; SiteList::SiteList@s3:BF1E
4:1AE4  8b46fa               mov ax, word ptr [bp - 6]
4:1AE7  c45e06               les bx, ptr [bp + 6]
4:1AEA  26894744             mov word ptr es:[bx + 0x44], ax
4:1AEE  668b46fc             mov eax, dword ptr [bp - 4]
4:1AF2  6626894740           mov dword ptr es:[bx + 0x40], eax
4:1AF7  06                   push es
4:1AF8  53                   push bx
4:1AF9  90                   nop
4:1AFA  0e                   push cs
4:1AFB  e8ea01               call 0x1ce8  ; StarMapModel::project@s4:1CE8
4:1AFE  c9                   leave
4:1AFF  ca0400               retf 4

; ---------------- StarMapModel::scroll@s4:1B02 FAR size=216 callers=1
;   scrolls the map
4:1B02  c80a0000             enter 0xa, 0
4:1B06  56                   push si
4:1B07  662bc0               sub eax, eax
4:1B0A  668946f8             mov dword ptr [bp - 8], eax
4:1B0E  8946f6               mov word ptr [bp - 0xa], ax
4:1B11  e9a900               jmp 0x1bbd
loc_1B14:
4:1B14  6bc018               imul ax, ax, 0x18
4:1B17  66268b4f40           mov ecx, dword ptr es:[bx + 0x40]
4:1B1C  268b5742             mov dx, word ptr es:[bx + 0x42]
4:1B20  03c8                 add cx, ax
4:1B22  66894ef8             mov dword ptr [bp - 8], ecx
4:1B26  8b460a               mov ax, word ptr [bp + 0xa]
4:1B29  03c0                 add ax, ax
4:1B2B  48                   dec ax
4:1B2C  8bd9                 mov bx, cx
4:1B2E  8ec2                 mov es, dx
4:1B30  26014706             add word ptr es:[bx + 6], ax
4:1B34  c45ef8               les bx, ptr [bp - 8]
4:1B37  26837f0624           cmp word ptr es:[bx + 6], 0x24
4:1B3C  7c06                 jl 0x1b44
4:1B3E  26c747060000         mov word ptr es:[bx + 6], 0
loc_1B44:
4:1B44  c45ef8               les bx, ptr [bp - 8]
4:1B47  26837f0600           cmp word ptr es:[bx + 6], 0
4:1B4C  7d06                 jge 0x1b54
4:1B4E  26c747062300         mov word ptr es:[bx + 6], 0x23
loc_1B54:
4:1B54  ff76fa               push word ptr [bp - 6]
4:1B57  8b46f8               mov ax, word ptr [bp - 8]
4:1B5A  50                   push ax
4:1B5B  8b56fa               mov dx, word ptr [bp - 6]
4:1B5E  051000               add ax, 0x10
4:1B61  52                   push dx
4:1B62  50                   push ax
4:1B63  9a623f821b           lcall 0x1b82, 0x3f62  ; Pos3::assign@s2:3F62
4:1B68  c45ef8               les bx, ptr [bp - 8]
4:1B6B  268b470a             mov ax, word ptr es:[bx + 0xa]
4:1B6F  26894716             mov word ptr es:[bx + 0x16], ax
4:1B73  8d46fe               lea ax, [bp - 2]
4:1B76  16                   push ss
4:1B77  50                   push ax
4:1B78  8d46fc               lea ax, [bp - 4]
4:1B7B  16                   push ss
4:1B7C  50                   push ax
4:1B7D  06                   push es
4:1B7E  53                   push bx
4:1B7F  9a943ea71b           lcall 0x1ba7, 0x3e94  ; Pos3::getXY@s2:3E94
4:1B84  c45ef8               les bx, ptr [bp - 8]
4:1B87  266b770824           imul si, word ptr es:[bx + 8], 0x24
4:1B8C  26037706             add si, word ptr es:[bx + 6]
4:1B90  03f6                 add si, si
4:1B92  8e06f463             mov es, word ptr [0x63f4]
4:1B96  26ffb4203c           push word ptr es:[si + 0x3c20]
4:1B9B  ff76fc               push word ptr [bp - 4]
4:1B9E  6a00                 push 0
4:1BA0  ff76fa               push word ptr [bp - 6]
4:1BA3  53                   push bx
4:1BA4  9a763e7d1a           lcall 0x1a7d, 0x3e76  ; Pos3::set@s2:3E76
4:1BA9  c45ef8               les bx, ptr [bp - 8]
4:1BAC  268b7706             mov si, word ptr es:[bx + 6]
4:1BB0  03f6                 add si, si
4:1BB2  8b846639             mov ax, word ptr [si + 0x3966]
4:1BB6  2689470a             mov word ptr es:[bx + 0xa], ax
4:1BBA  ff46f6               inc word ptr [bp - 0xa]
loc_1BBD:
4:1BBD  8b46f6               mov ax, word ptr [bp - 0xa]
4:1BC0  c45e06               les bx, ptr [bp + 6]
4:1BC3  26394744             cmp word ptr es:[bx + 0x44], ax
4:1BC7  0f8f49ff             jg 0x1b14
4:1BCB  6a0d                 push 0xd
4:1BCD  06                   push es
4:1BCE  53                   push bx
4:1BCF  9a621fd51a           lcall 0x1ad5, 0x1f62  ; RegObj::notify@s3:1F62
4:1BD4  5e                   pop si
4:1BD5  c9                   leave
4:1BD6  ca0600               retf 6
4:1BD9  db 00

; ---------------- StarMapModel::hit@s4:1BDA FAR size=192 callers=1
;   apis: USER.PtInRect
;   the star under a point (PtInRect)
4:1BDA  c8180000             enter 0x18, 0
4:1BDE  57                   push di
4:1BDF  56                   push si
4:1BE0  66c746f400000000     mov dword ptr [bp - 0xc], 0
4:1BE8  8d46f0               lea ax, [bp - 0x10]
4:1BEB  16                   push ss
4:1BEC  50                   push ax
4:1BED  8d46ee               lea ax, [bp - 0x12]
4:1BF0  16                   push ss
4:1BF1  50                   push ax
4:1BF2  668b4606             mov eax, dword ptr [bp + 6]
4:1BF6  053a00               add ax, 0x3a
4:1BF9  6650                 push eax
4:1BFB  9a943e471c           lcall 0x1c47, 0x3e94  ; Pos3::getXY@s2:3E94
4:1C00  8b460c               mov ax, word ptr [bp + 0xc]
4:1C03  8946ea               mov word ptr [bp - 0x16], ax
4:1C06  8b460a               mov ax, word ptr [bp + 0xa]
4:1C09  8946ec               mov word ptr [bp - 0x14], ax
4:1C0C  33c0                 xor ax, ax
4:1C0E  8946f2               mov word ptr [bp - 0xe], ax
4:1C11  8946e8               mov word ptr [bp - 0x18], ax
4:1C14  eb03                 jmp 0x1c19
loc_1C16:
4:1C16  ff46e8               inc word ptr [bp - 0x18]
loc_1C19:
4:1C19  8b46e8               mov ax, word ptr [bp - 0x18]
4:1C1C  c45e06               les bx, ptr [bp + 6]
4:1C1F  26394744             cmp word ptr es:[bx + 0x44], ax
4:1C23  7e6c                 jle 0x1c91
4:1C25  8d56f8               lea dx, [bp - 8]
4:1C28  16                   push ss
4:1C29  52                   push dx
4:1C2A  8d76fa               lea si, [bp - 6]
4:1C2D  16                   push ss
4:1C2E  56                   push si
4:1C2F  6bc018               imul ax, ax, 0x18
4:1C32  268b7f40             mov di, word ptr es:[bx + 0x40]
4:1C36  268b4f42             mov cx, word ptr es:[bx + 0x42]
4:1C3A  03f8                 add di, ax
4:1C3C  897ef4               mov word ptr [bp - 0xc], di
4:1C3F  894ef6               mov word ptr [bp - 0xa], cx
4:1C42  51                   push cx
4:1C43  57                   push di
4:1C44  9a943e661b           lcall 0x1b66, 0x3e94  ; Pos3::getXY@s2:3E94
4:1C49  8b46f0               mov ax, word ptr [bp - 0x10]
4:1C4C  2d0600               sub ax, 6
4:1C4F  0146f8               add word ptr [bp - 8], ax
4:1C52  8b46f8               mov ax, word ptr [bp - 8]
4:1C55  050c00               add ax, 0xc
4:1C58  8946fc               mov word ptr [bp - 4], ax
4:1C5B  8b46ee               mov ax, word ptr [bp - 0x12]
4:1C5E  2d0600               sub ax, 6
4:1C61  0146fa               add word ptr [bp - 6], ax
4:1C64  8b46fa               mov ax, word ptr [bp - 6]
4:1C67  050c00               add ax, 0xc
4:1C6A  8946fe               mov word ptr [bp - 2], ax
4:1C6D  8d46f8               lea ax, [bp - 8]
4:1C70  16                   push ss
4:1C71  50                   push ax
4:1C72  66ff76ea             push dword ptr [bp - 0x16]
4:1C76  9affff0000           lcall 0, 0xffff  ; USER.PtInRect
4:1C7B  0bc0                 or ax, ax
4:1C7D  7497                 je 0x1c16
4:1C7F  66ff76f4             push dword ptr [bp - 0xc]
4:1C83  66ff7606             push dword ptr [bp + 6]
4:1C87  90                   nop
4:1C88  0e                   push cs
4:1C89  e84e02               call 0x1eda  ; StarMapModel::select@s4:1EDA
4:1C8C  c746f20100           mov word ptr [bp - 0xe], 1
loc_1C91:
4:1C91  8b46f2               mov ax, word ptr [bp - 0xe]
4:1C94  5e                   pop si
4:1C95  5f                   pop di
4:1C96  c9                   leave
4:1C97  ca0800               retf 8

; ---------------- StarMapModel::selectButton@s4:1C9A FAR size=78 callers=4
;   selects the star of a button
4:1C9A  c8080000             enter 8, 0
4:1C9E  56                   push si
4:1C9F  66c746f800000000     mov dword ptr [bp - 8], 0
4:1CA7  eb04                 jmp 0x1cad
4:1CA9  db 90
loc_1CAA:
4:1CAA  ff46f8               inc word ptr [bp - 8]
loc_1CAD:
4:1CAD  8b46f8               mov ax, word ptr [bp - 8]
4:1CB0  c45e06               les bx, ptr [bp + 6]
4:1CB3  26394744             cmp word ptr es:[bx + 0x44], ax
4:1CB7  7e27                 jle 0x1ce0
4:1CB9  6bc018               imul ax, ax, 0x18
4:1CBC  26c45f40             les bx, ptr es:[bx + 0x40]
4:1CC0  03d8                 add bx, ax
4:1CC2  266b770c1e           imul si, word ptr es:[bx + 0xc], 0x1e
4:1CC7  8b460a               mov ax, word ptr [bp + 0xa]
4:1CCA  3984323c             cmp word ptr [si + 0x3c32], ax
4:1CCE  75da                 jne 0x1caa
4:1CD0  06                   push es
4:1CD1  53                   push bx
4:1CD2  66ff7606             push dword ptr [bp + 6]
4:1CD6  90                   nop
4:1CD7  0e                   push cs
4:1CD8  e8ff01               call 0x1eda  ; StarMapModel::select@s4:1EDA
4:1CDB  c746fa0100           mov word ptr [bp - 6], 1
loc_1CE0:
4:1CE0  8b46fa               mov ax, word ptr [bp - 6]
4:1CE3  5e                   pop si
4:1CE4  c9                   leave
4:1CE5  ca0600               retf 6

; ---------------- StarMapModel::project@s4:1CE8 FAR size=400 callers=1
;   star positions on the map
4:1CE8  c8180000             enter 0x18, 0
4:1CEC  57                   push di
4:1CED  56                   push si
4:1CEE  c45e06               les bx, ptr [bp + 6]
4:1CF1  66268b4740           mov eax, dword ptr es:[bx + 0x40]
4:1CF6  668946fc             mov dword ptr [bp - 4], eax
4:1CFA  c746fa0000           mov word ptr [bp - 6], 0
4:1CFF  e91a01               jmp 0x1e1c
loc_1D02:
4:1D02  2956f6               sub word ptr [bp - 0xa], dx
loc_1D05:
4:1D05  ff76f4               push word ptr [bp - 0xc]
4:1D08  9ab249291d           lcall 0x1d29, 0x49b2  ; abs@s1:49B2
4:1D0D  83c402               add sp, 2
4:1D10  b90500               mov cx, 5
4:1D13  99                   cdq
4:1D14  f7f9                 idiv cx
4:1D16  8946f0               mov word ptr [bp - 0x10], ax
4:1D19  3d1500               cmp ax, 0x15
4:1D1C  7c1e                 jl 0x1d3c
4:1D1E  c746f01400           mov word ptr [bp - 0x10], 0x14
4:1D23  ff76f4               push word ptr [bp - 0xc]
4:1D26  9ab249421d           lcall 0x1d42, 0x49b2  ; abs@s1:49B2
4:1D2B  83c402               add sp, 2
4:1D2E  8bc8                 mov cx, ax
4:1D30  8b46f4               mov ax, word ptr [bp - 0xc]
4:1D33  99                   cdq
4:1D34  f7f9                 idiv cx
4:1D36  6bc064               imul ax, ax, 0x64
4:1D39  8946f4               mov word ptr [bp - 0xc], ax
loc_1D3C:
4:1D3C  ff76f4               push word ptr [bp - 0xc]
4:1D3F  9ab249501a           lcall 0x1a50, 0x49b2  ; abs@s1:49B2
4:1D44  83c402               add sp, 2
4:1D47  b90500               mov cx, 5
4:1D4A  99                   cdq
4:1D4B  f7f9                 idiv cx
4:1D4D  8956f2               mov word ptr [bp - 0xe], dx
4:1D50  0bd2                 or dx, dx
4:1D52  7429                 je 0x1d7d
4:1D54  837ef400             cmp word ptr [bp - 0xc], 0
4:1D58  7c12                 jl 0x1d6c
4:1D5A  83fa02               cmp dx, 2
4:1D5D  7e07                 jle 0x1d66
4:1D5F  2bca                 sub cx, dx
4:1D61  014ef4               add word ptr [bp - 0xc], cx
4:1D64  eb17                 jmp 0x1d7d
loc_1D66:
4:1D66  2956f4               sub word ptr [bp - 0xc], dx
4:1D69  eb12                 jmp 0x1d7d
4:1D6B  db 90
loc_1D6C:
4:1D6C  83fa02               cmp dx, 2
4:1D6F  7e07                 jle 0x1d78
4:1D71  8bc2                 mov ax, dx
4:1D73  2bc1                 sub ax, cx
4:1D75  eb03                 jmp 0x1d7a
4:1D77  db 90
loc_1D78:
4:1D78  8bc2                 mov ax, dx
loc_1D7A:
4:1D7A  0146f4               add word ptr [bp - 0xc], ax
loc_1D7D:
4:1D7D  8e06f463             mov es, word ptr [0x63f4]
4:1D81  6b5ef048             imul bx, word ptr [bp - 0x10], 0x48
4:1D85  268b87203c           mov ax, word ptr es:[bx + 0x3c20]
4:1D8A  8946ee               mov word ptr [bp - 0x12], ax
4:1D8D  3b46f6               cmp ax, word ptr [bp - 0xa]
4:1D90  7e25                 jle 0x1db7
4:1D92  8b46f0               mov ax, word ptr [bp - 0x10]
4:1D95  8946e8               mov word ptr [bp - 0x18], ax
4:1D98  eb03                 jmp 0x1d9d
loc_1D9A:
4:1D9A  ff46e8               inc word ptr [bp - 0x18]
loc_1D9D:
4:1D9D  837ee815             cmp word ptr [bp - 0x18], 0x15
4:1DA1  7d14                 jge 0x1db7
4:1DA3  8b46f6               mov ax, word ptr [bp - 0xa]
4:1DA6  6b5ee848             imul bx, word ptr [bp - 0x18], 0x48
4:1DAA  263987203c           cmp word ptr es:[bx + 0x3c20], ax
4:1DAF  7fe9                 jg 0x1d9a
4:1DB1  8b46e8               mov ax, word ptr [bp - 0x18]
4:1DB4  8946f0               mov word ptr [bp - 0x10], ax
loc_1DB7:
4:1DB7  8d46ec               lea ax, [bp - 0x14]
4:1DBA  16                   push ss
4:1DBB  50                   push ax
4:1DBC  8d46ea               lea ax, [bp - 0x16]
4:1DBF  16                   push ss
4:1DC0  50                   push ax
4:1DC1  668b4606             mov eax, dword ptr [bp + 6]
4:1DC5  053a00               add ax, 0x3a
4:1DC8  6650                 push eax
4:1DCA  9a943e081e           lcall 0x1e08, 0x3e94  ; Pos3::getXY@s2:3E94
4:1DCF  8b46f8               mov ax, word ptr [bp - 8]
4:1DD2  6b5efa18             imul bx, word ptr [bp - 6], 0x18
4:1DD6  035efc               add bx, word ptr [bp - 4]
4:1DD9  8e46fe               mov es, word ptr [bp - 2]
4:1DDC  26894706             mov word ptr es:[bx + 6], ax
4:1DE0  8b46f0               mov ax, word ptr [bp - 0x10]
4:1DE3  26894708             mov word ptr es:[bx + 8], ax
4:1DE7  8cc1                 mov cx, es
4:1DE9  8e06f463             mov es, word ptr [0x63f4]
4:1DED  6bf024               imul si, ax, 0x24
4:1DF0  0376f8               add si, word ptr [bp - 8]
4:1DF3  03f6                 add si, si
4:1DF5  26ffb4203c           push word ptr es:[si + 0x3c20]
4:1DFA  ff76f4               push word ptr [bp - 0xc]
4:1DFD  6a00                 push 0
4:1DFF  51                   push cx
4:1E00  53                   push bx
4:1E01  8bf1                 mov si, cx
4:1E03  8bfb                 mov di, bx
4:1E05  9a763e451e           lcall 0x1e45, 0x3e76  ; Pos3::set@s2:3E76
4:1E0A  8b5ef8               mov bx, word ptr [bp - 8]
4:1E0D  03db                 add bx, bx
4:1E0F  8ec6                 mov es, si
4:1E11  8b876639             mov ax, word ptr [bx + 0x3966]
4:1E15  2689450a             mov word ptr es:[di + 0xa], ax
4:1E19  ff46fa               inc word ptr [bp - 6]
loc_1E1C:
4:1E1C  8b46fa               mov ax, word ptr [bp - 6]
4:1E1F  c45e06               les bx, ptr [bp + 6]
4:1E22  26394744             cmp word ptr es:[bx + 0x44], ax
4:1E26  7e4a                 jle 0x1e72
4:1E28  8d4ef8               lea cx, [bp - 8]
4:1E2B  16                   push ss
4:1E2C  51                   push cx
4:1E2D  8d56f6               lea dx, [bp - 0xa]
4:1E30  16                   push ss
4:1E31  52                   push dx
4:1E32  8d5ef4               lea bx, [bp - 0xc]
4:1E35  16                   push ss
4:1E36  53                   push bx
4:1E37  6bc018               imul ax, ax, 0x18
4:1E3A  0346fc               add ax, word ptr [bp - 4]
4:1E3D  8b56fe               mov dx, word ptr [bp - 2]
4:1E40  52                   push dx
4:1E41  50                   push ax
4:1E42  9ab43efe1b           lcall 0x1bfe, 0x3eb4  ; Pos3::get@s2:3EB4
4:1E47  b90a00               mov cx, 0xa
4:1E4A  8b46f8               mov ax, word ptr [bp - 8]
4:1E4D  99                   cdq
4:1E4E  f7f9                 idiv cx
4:1E50  8946f8               mov word ptr [bp - 8], ax
4:1E53  8b46f6               mov ax, word ptr [bp - 0xa]
4:1E56  99                   cdq
4:1E57  f7f9                 idiv cx
4:1E59  8956f2               mov word ptr [bp - 0xe], dx
4:1E5C  0bd2                 or dx, dx
4:1E5E  0f84a3fe             je 0x1d05
4:1E62  83fa05               cmp dx, 5
4:1E65  0f8e99fe             jle 0x1d02
4:1E69  2bca                 sub cx, dx
4:1E6B  014ef6               add word ptr [bp - 0xa], cx
4:1E6E  e994fe               jmp 0x1d05
4:1E71  db 90
loc_1E72:
4:1E72  5e                   pop si
4:1E73  5f                   pop di
4:1E74  c9                   leave
4:1E75  ca0400               retf 4

; ---------------- starText@s4:1E78 FAR size=40 callers=3
;   star text row (30 bytes at DGROUP 0x3C18)
4:1E78  c8020000             enter 2, 0
4:1E7C  837e0aff             cmp word ptr [bp + 0xa], -1
4:1E80  7406                 je 0x1e88
4:1E82  8b460a               mov ax, word ptr [bp + 0xa]
4:1E85  eb0c                 jmp 0x1e93
4:1E87  db 90
loc_1E88:
4:1E88  c45e06               les bx, ptr [bp + 6]
4:1E8B  26c45f46             les bx, ptr es:[bx + 0x46]
4:1E8F  268b470c             mov ax, word ptr es:[bx + 0xc]
loc_1E93:
4:1E93  6bc01e               imul ax, ax, 0x1e
4:1E96  05183c               add ax, 0x3c18
4:1E99  8cda                 mov dx, ds
4:1E9B  c9                   leave
4:1E9C  ca0600               retf 6
4:1E9F  db 00

; ---------------- StarMapModel::metrics@s4:1EA0 FAR size=58 callers=1
;   apis: USER.GetSystemMetrics
;   window frame metrics
4:1EA0  55                   push bp
4:1EA1  8bec                 mov bp, sp
4:1EA3  56                   push si
4:1EA4  6a05                 push 5
4:1EA6  9abb1e0000           lcall 0, 0x1ebb  ; USER.GetSystemMetrics
4:1EAB  03c0                 add ax, ax
4:1EAD  c45e06               les bx, ptr [bp + 6]
4:1EB0  26034736             add ax, word ptr es:[bx + 0x36]
4:1EB4  2689472e             mov word ptr es:[bx + 0x2e], ax
4:1EB8  6a04                 push 4
4:1EBA  9ac41e0000           lcall 0, 0x1ec4  ; USER.GetSystemMetrics
4:1EBF  6a06                 push 6
4:1EC1  8bf0                 mov si, ax
4:1EC3  9ab1090000           lcall 0, 0x9b1  ; USER.GetSystemMetrics
4:1EC8  c45e06               les bx, ptr [bp + 6]
4:1ECB  26037738             add si, word ptr es:[bx + 0x38]
4:1ECF  03f0                 add si, ax
4:1ED1  26897730             mov word ptr es:[bx + 0x30], si
4:1ED5  5e                   pop si
4:1ED6  c9                   leave
4:1ED7  ca0400               retf 4

; ---------------- StarMapModel::select@s4:1EDA FAR size=64 callers=2
;   selects a star, notice
4:1EDA  55                   push bp
4:1EDB  8bec                 mov bp, sp
4:1EDD  c45e06               les bx, ptr [bp + 6]
4:1EE0  6626837f4600         cmp dword ptr es:[bx + 0x46], 0
4:1EE6  740a                 je 0x1ef2
4:1EE8  26c45f46             les bx, ptr es:[bx + 0x46]
4:1EEC  26c7470e0200         mov word ptr es:[bx + 0xe], 2
loc_1EF2:
4:1EF2  c45e06               les bx, ptr [bp + 6]
4:1EF5  668b460a             mov eax, dword ptr [bp + 0xa]
4:1EF9  8b560c               mov dx, word ptr [bp + 0xc]
4:1EFC  6626894746           mov dword ptr es:[bx + 0x46], eax
4:1F01  8bd8                 mov bx, ax
4:1F03  8ec2                 mov es, dx
4:1F05  26c7470e0100         mov word ptr es:[bx + 0xe], 1
4:1F0B  6a0d                 push 0xd
4:1F0D  66ff7606             push dword ptr [bp + 6]
4:1F11  9a621fd21b           lcall 0x1bd2, 0x1f62  ; RegObj::notify@s3:1F62
4:1F16  c9                   leave
4:1F17  ca0800               retf 8

; ---------------- StarMapModel::countSelected@s4:1F1A FAR size=80 callers=1
;   stars marked
4:1F1A  c8040000             enter 4, 0
4:1F1E  56                   push si
4:1F1F  c746fe0000           mov word ptr [bp - 2], 0
4:1F24  c45e06               les bx, ptr [bp + 6]
4:1F27  26837f5600           cmp word ptr es:[bx + 0x56], 0
4:1F2C  7508                 jne 0x1f36
4:1F2E  33c0                 xor ax, ax
4:1F30  5e                   pop si
4:1F31  c9                   leave
4:1F32  ca0600               retf 6
4:1F35  db 90
loc_1F36:
4:1F36  c746fc0000           mov word ptr [bp - 4], 0
4:1F3B  eb04                 jmp 0x1f41
4:1F3D  db 90
loc_1F3E:
4:1F3E  ff46fc               inc word ptr [bp - 4]
loc_1F41:
4:1F41  8b46fc               mov ax, word ptr [bp - 4]
4:1F44  8b5e06               mov bx, word ptr [bp + 6]
4:1F47  26394756             cmp word ptr es:[bx + 0x56], ax
4:1F4B  7e14                 jle 0x1f61
4:1F4D  8bf0                 mov si, ax
4:1F4F  03f0                 add si, ax
4:1F51  83c34e               add bx, 0x4e
4:1F54  8b460a               mov ax, word ptr [bp + 0xa]
4:1F57  263900               cmp word ptr es:[bx + si], ax
4:1F5A  75e2                 jne 0x1f3e
4:1F5C  c746fe0100           mov word ptr [bp - 2], 1
loc_1F61:
4:1F61  8b46fe               mov ax, word ptr [bp - 2]
4:1F64  5e                   pop si
4:1F65  c9                   leave
4:1F66  ca0600               retf 6
4:1F69  db 00

; ---------------- StarMapModel::thunk_dtor@s4:1F6A FAR size=12 callers=0
;   this-adjusting thunk
4:1F6A  8bdc                 mov bx, sp
4:1F6C  36836f0420           sub word ptr ss:[bx + 4], 0x20
4:1F71  e91600               jmp 0x1f8a
4:1F74  db 90 90

; ---------------- StarMapModel::nop@s4:1F76 FAR size=4 callers=0
;   empty virtual
4:1F76  ca0400               retf 4
4:1F79  db 00

; ---------------- StarMapModel::name@s4:1F7A FAR size=16 callers=0
;   (vslot 4) returns this+0x2A
4:1F7A  55                   push bp
4:1F7B  8bec                 mov bp, sp
4:1F7D  8b4606               mov ax, word ptr [bp + 6]
4:1F80  8b5608               mov dx, word ptr [bp + 8]
4:1F83  052a00               add ax, 0x2a
4:1F86  c9                   leave
4:1F87  ca0400               retf 4

; ---------------- StarMapModel::scalar_dtor@s4:1F8A FAR size=106 callers=0
;   deleting destructor
4:1F8A  55                   push bp
4:1F8B  8bec                 mov bp, sp
4:1F8D  66ff7606             push dword ptr [bp + 6]
4:1F91  90                   nop
4:1F92  0e                   push cs
4:1F93  e86efa               call 0x1a04  ; StarMapModel::~StarMapModel@s4:1A04
4:1F96  f6460a01             test byte ptr [bp + 0xa], 1
4:1F9A  7409                 je 0x1fa5
4:1F9C  66ff7606             push dword ptr [bp + 6]
4:1FA0  9ace170b1d           lcall 0x1d0b, 0x17ce  ; operator_delete@s1:17CE
loc_1FA5:
4:1FA5  8b4606               mov ax, word ptr [bp + 6]
4:1FA8  8b5608               mov dx, word ptr [bp + 8]
4:1FAB  c9                   leave
4:1FAC  ca0600               retf 6
4:1FAF  db 90 8a 1f c2 1f f2 1d ba 1f ce 1d be 1f d4 1d ce
4:1FBF  db 1f 7a 1f c6 1f 2c 4c ca 1f 78 4b d2 1f b0 49 d6
4:1FCF  db 1f 76 1f 15 1a c0 49 da 1f ce 49 de 1f e0 49 e2
4:1FDF  db 1f ee 49 e6 1f 00 4a ea 1f 12 4a 14 1f 6a 1f b2
4:1FEF  db 1f 10 3a cd 1d

; ---------------- ViewConstants::ViewConstants@s4:1FF4 FAR size=130 callers=1
;   registry 0x2E: view constants and animation caches (0x806 bytes)
4:1FF4  c81c0000             enter 0x1c, 0
4:1FF8  66ff7608             push dword ptr [bp + 8]
4:1FFC  ff7606               push word ptr [bp + 6]
4:1FFF  9a481d3820           lcall 0x2038, 0x1d48  ; RegObj::RegObj@s3:1D48
4:2004  c45e06               les bx, ptr [bp + 6]
4:2007  6626c7470a0b01b900   mov dword ptr es:[bx + 0xa], 0xb9010b
4:2010  6626c7470e35001700   mov dword ptr es:[bx + 0xe], 0x170035  ; 'New failed in Op::Op->ResLibr'
4:2019  26c707e821           mov word ptr es:[bx], 0x21e8
4:201E  26c74702ee1f         mov word ptr es:[bx + 2], 0x1fee  ; SEGMENT s4:0000
4:2024  8d46fa               lea ax, [bp - 6]
4:2027  16                   push ss
4:2028  50                   push ax
4:2029  8d46f8               lea ax, [bp - 8]
4:202C  16                   push ss
4:202D  50                   push ax
4:202E  6a48                 push 0x48
4:2030  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:2035  9aba20b61f           lcall 0x1fb6, 0x20ba  ; Registry_get@s3:20BA
4:203A  8946fc               mov word ptr [bp - 4], ax
4:203D  8956fe               mov word ptr [bp - 2], dx
4:2040  050e00               add ax, 0xe
4:2043  52                   push dx
4:2044  50                   push ax
4:2045  9a943ef21f           lcall 0x1ff2, 0x3e94  ; Pos3::getXY@s2:3E94
4:204A  8b46fa               mov ax, word ptr [bp - 6]
4:204D  c45e06               les bx, ptr [bp + 6]
4:2050  2601470a             add word ptr es:[bx + 0xa], ax
4:2054  8b46f8               mov ax, word ptr [bp - 8]
4:2057  2601470c             add word ptr es:[bx + 0xc], ax
4:205B  66680000f407         push 0x7f40000
4:2061  8d4712               lea ax, [bx + 0x12]
4:2064  06                   push es
4:2065  50                   push ax
4:2066  9a0649a31f           lcall 0x1fa3, 0x4906  ; _fmemset@s1:4906
4:206B  8b4606               mov ax, word ptr [bp + 6]
4:206E  8b5608               mov dx, word ptr [bp + 8]
4:2071  c9                   leave
4:2072  ca0600               retf 6
4:2075  db 00

; ---------------- ViewConstants::~ViewConstants@s4:2076 FAR size=38 callers=1
;   dtor
4:2076  55                   push bp
4:2077  8bec                 mov bp, sp
4:2079  c45e06               les bx, ptr [bp + 6]
4:207C  26c707e821           mov word ptr es:[bx], 0x21e8
4:2081  26c747022220         mov word ptr es:[bx + 2], 0x2022  ; SEGMENT s4:0000
4:2087  06                   push es
4:2088  53                   push bx
4:2089  90                   nop
4:208A  0e                   push cs
4:208B  e80e00               call 0x209c  ; ViewConstants::freeAnimations@s4:209C
4:208E  66ff7606             push dword ptr [bp + 6]
4:2092  9a801d0220           lcall 0x2002, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:2097  c9                   leave
4:2098  ca0400               retf 4
4:209B  db 00

; ---------------- ViewConstants::freeAnimations@s4:209C FAR size=82 callers=2
;   frees the cached animations
4:209C  c80a0000             enter 0xa, 0
4:20A0  56                   push si
4:20A1  c746fe0000           mov word ptr [bp - 2], 0
loc_20A6:
4:20A6  c45e06               les bx, ptr [bp + 6]
4:20A9  83c312               add bx, 0x12
4:20AC  8b76fe               mov si, word ptr [bp - 2]
4:20AF  c1e602               shl si, 2
4:20B2  268b00               mov ax, word ptr es:[bx + si]
4:20B5  268b5002             mov dx, word ptr es:[bx + si + 2]
4:20B9  8bda                 mov bx, dx
4:20BB  0bd0                 or dx, ax
4:20BD  740e                 je 0x20cd
4:20BF  6a01                 push 1
4:20C1  53                   push bx
4:20C2  50                   push ax
4:20C3  8ec3                 mov es, bx
4:20C5  8bf0                 mov si, ax
4:20C7  26c41c               les bx, ptr es:[si]
4:20CA  26ff1f               lcall es:[bx]
loc_20CD:
4:20CD  8b76fe               mov si, word ptr [bp - 2]
4:20D0  c1e602               shl si, 2
4:20D3  c45e06               les bx, ptr [bp + 6]
4:20D6  6626c7401200000000   mov dword ptr es:[bx + si + 0x12], 0
4:20DF  ff46fe               inc word ptr [bp - 2]
4:20E2  817efefd01           cmp word ptr [bp - 2], 0x1fd
4:20E7  7cbd                 jl 0x20a6
4:20E9  5e                   pop si
4:20EA  c9                   leave
4:20EB  ca0400               retf 4

; ---------------- AnimRef::frameDib@s4:20EE FAR size=96 callers=3
;   the DIB of the current frame
4:20EE  c80a0000             enter 0xa, 0
4:20F2  56                   push si
4:20F3  66ff760a             push dword ptr [bp + 0xa]
4:20F7  9ad8ae4021           lcall 0x2140, 0xaed8  ; AnimRef::hasAnimation@s2:AED8
4:20FC  0bc0                 or ax, ax
4:20FE  7506                 jne 0x2106
4:2100  99                   cdq
4:2101  5e                   pop si
4:2102  c9                   leave
4:2103  ca0800               retf 8
loc_2106:
4:2106  c45e0a               les bx, ptr [bp + 0xa]
4:2109  268b07               mov ax, word ptr es:[bx]
4:210C  8bf0                 mov si, ax
4:210E  c1e602               shl si, 2
4:2111  c45e06               les bx, ptr [bp + 6]
4:2114  66268b4012           mov eax, dword ptr es:[bx + si + 0x12]
4:2119  668946fa             mov dword ptr [bp - 6], eax
4:211D  660bc0               or eax, eax
4:2120  7517                 jne 0x2139
4:2122  66ff760a             push dword ptr [bp + 0xa]
4:2126  06                   push es
4:2127  53                   push bx
4:2128  90                   nop
4:2129  0e                   push cs
4:212A  e84100               call 0x216e  ; AnimRef::loadFrames@s4:216E
4:212D  c45e06               les bx, ptr [bp + 6]
4:2130  66268b4012           mov eax, dword ptr es:[bx + si + 0x12]
4:2135  668946fa             mov dword ptr [bp - 6], eax
loc_2139:
4:2139  66ff760a             push dword ptr [bp + 0xa]
4:213D  9a26ae4820           lcall 0x2048, 0xae26  ; AnimRef::advance@s2:AE26
4:2142  8b46fa               mov ax, word ptr [bp - 6]
4:2145  8b56fc               mov dx, word ptr [bp - 4]
4:2148  5e                   pop si
4:2149  c9                   leave
4:214A  ca0800               retf 8
4:214D  db 00

; ---------------- AnimRef::frameOffset@s4:214E FAR size=32 callers=1
;   where a type's frames sit on its picture (DGROUP 0x3E8E)
4:214E  55                   push bp
4:214F  8bec                 mov bp, sp
4:2151  8b5e0e               mov bx, word ptr [bp + 0xe]
4:2154  c1e302               shl bx, 2
4:2157  ffb78e3e             push word ptr [bx + 0x3e8e]
4:215B  ffb7903e             push word ptr [bx + 0x3e90]
4:215F  6a00                 push 0
4:2161  66ff760a             push dword ptr [bp + 0xa]
4:2165  9a763efa20           lcall 0x20fa, 0x3e76  ; Pos3::set@s2:3E76
4:216A  c9                   leave
4:216B  ca0a00               retf 0xa

; ---------------- AnimRef::loadFrames@s4:216E FAR size=84 callers=1
;   loads the frames of an animation
4:216E  c8060000             enter 6, 0
4:2172  56                   push si
4:2173  66ff760a             push dword ptr [bp + 0xa]
4:2177  9af2ad8621           lcall 0x2186, 0xadf2  ; AnimRef::firstFrame@s2:ADF2
4:217C  8946fe               mov word ptr [bp - 2], ax
4:217F  66ff760a             push dword ptr [bp + 0xa]
4:2183  9a0cae6821           lcall 0x2168, 0xae0c  ; AnimRef::mode@s2:AE0C
4:2188  8946fc               mov word ptr [bp - 4], ax
4:218B  8b46fe               mov ax, word ptr [bp - 2]
4:218E  8946fa               mov word ptr [bp - 6], ax
4:2191  eb22                 jmp 0x21b5
4:2193  db 90
loc_2194:
4:2194  ff76fa               push word ptr [bp - 6]
4:2197  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:219C  9a18809520           lcall 0x2095, 0x8018  ; ResLibr::frame@s3:8018
4:21A1  8b76fa               mov si, word ptr [bp - 6]
4:21A4  c1e602               shl si, 2
4:21A7  c45e06               les bx, ptr [bp + 6]
4:21AA  26894012             mov word ptr es:[bx + si + 0x12], ax
4:21AE  26895014             mov word ptr es:[bx + si + 0x14], dx
4:21B2  ff46fa               inc word ptr [bp - 6]
loc_21B5:
4:21B5  8b46fc               mov ax, word ptr [bp - 4]
4:21B8  3946fa               cmp word ptr [bp - 6], ax
4:21BB  7ed7                 jle 0x2194
4:21BD  5e                   pop si
4:21BE  c9                   leave
4:21BF  ca0800               retf 8

; ---------------- ViewConstants::scalar_dtor@s4:21C2 FAR size=218 callers=0
;   deleting destructor
4:21C2  55                   push bp
4:21C3  8bec                 mov bp, sp
4:21C5  66ff7606             push dword ptr [bp + 6]
4:21C9  90                   nop
4:21CA  0e                   push cs
4:21CB  e8a8fe               call 0x2076  ; ViewConstants::~ViewConstants@s4:2076
4:21CE  f6460a01             test byte ptr [bp + 0xa], 1
4:21D2  7409                 je 0x21dd
4:21D4  66ff7606             push dword ptr [bp + 6]
4:21D8  9ace176920           lcall 0x2069, 0x17ce  ; operator_delete@s1:17CE
loc_21DD:
4:21DD  8b4606               mov ax, word ptr [bp + 6]
4:21E0  8b5608               mov dx, word ptr [bp + 8]
4:21E3  c9                   leave
4:21E4  ca0600               retf 6
4:21E7  db 90 c2 21 85 20 f2 1d f2 21 ce 1d f6 21 d4 1d 9f
4:21F7  db 21 66 68 95 01 01 00 6a 00 68 58 22 68 10 42 9a
4:2207  db 54 3e 1a 22 66 68 e0 00 b1 01 6a 00 1e 68 ca 65
4:2217  db 9a 54 3e 2b 22 66 68 7a 01 72 00 6a 00 1e 68 d0
4:2227  db 65 9a 54 3e 3c 22 66 68 de 00 93 00 6a 00 1e 68
4:2237  db d6 65 9a 54 3e 4d 22 66 68 77 01 da 01 6a 00 1e
4:2247  db 68 dc 65 9a 54 3e 60 22 66 68 95 01 1c 02 6a 00
4:2257  db 68 6b 22 68 16 42 9a 54 3e 73 22 66 68 b6 01 2c
4:2267  db 02 6a 00 68 7e 22 68 1c 42 9a 54 3e 86 22 66 68
4:2277  db 09 01 05 00 6a 00 68 91 22 68 22 42 9a 54 3e 99
4:2287  db 22 66 68 fd 00 fd 01 6a 00 68 ff ff 68 28 42 9a
4:2297  db 54 3e 7a 21 cb

; ---------------- PlanetArea::PlanetArea@s4:229C FAR size=420 callers=1
;   registry 0x29: the planet area view (plntarea.bmp, timer)
4:229C  c80a0000             enter 0xa, 0
4:22A0  57                   push di
4:22A1  56                   push si
4:22A2  66ff7608             push dword ptr [bp + 8]
4:22A6  ff7606               push word ptr [bp + 6]
4:22A9  90                   nop
4:22AA  0e                   push cs
4:22AB  e82c2a               call 0x4cda  ; CmdTarget::CmdTarget@s4:4CDA
4:22AE  c45e06               les bx, ptr [bp + 6]
4:22B1  26c7471c9a38         mov word ptr es:[bx + 0x1c], 0x389a
4:22B7  26c7471eca22         mov word ptr es:[bx + 0x1e], 0x22ca  ; SEGMENT s2:0000 | 'plntarea.bmp'
4:22BD  c45e06               les bx, ptr [bp + 6]
4:22C0  26c7471ca83a         mov word ptr es:[bx + 0x1c], 0x3aa8
4:22C6  26c7471e3224         mov word ptr es:[bx + 0x1e], 0x2432  ; SEGMENT s2:0000
4:22CC  c45e06               les bx, ptr [bp + 6]
4:22CF  662bc0               sub eax, eax
4:22D2  6626894720           mov dword ptr es:[bx + 0x20], eax
4:22D7  26894724             mov word ptr es:[bx + 0x24], ax
4:22DB  6626894726           mov dword ptr es:[bx + 0x26], eax
4:22E0  662689472a           mov dword ptr es:[bx + 0x2a], eax
4:22E5  2689473e             mov word ptr es:[bx + 0x3e], ax
4:22E9  26894740             mov word ptr es:[bx + 0x40], ax
4:22ED  26894742             mov word ptr es:[bx + 0x42], ax
4:22F1  26894744             mov word ptr es:[bx + 0x44], ax
4:22F5  6626c7476e00000000   mov dword ptr es:[bx + 0x6e], 0
4:22FE  26c707da2a           mov word ptr es:[bx], 0x2ada
4:2303  26c747021323         mov word ptr es:[bx + 2], 0x2313  ; SEGMENT s4:0000
4:2309  26c7471cf22a         mov word ptr es:[bx + 0x1c], 0x2af2
4:230F  26c7471eea21         mov word ptr es:[bx + 0x1e], 0x21ea  ; SEGMENT s4:0000
4:2315  891e3042             mov word ptr [0x4230], bx
4:2319  8c063242             mov word ptr [0x4232], es
4:231D  680501               push 0x105
4:2320  06                   push es
4:2321  53                   push bx
4:2322  90                   nop
4:2323  0e                   push cs
4:2324  e8a72a               call 0x4dce  ; CmdTarget::setCommand@s4:4DCE
4:2327  68a801               push 0x1a8
4:232A  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:232F  9a0a837723           lcall 0x2377, 0x830a  ; ResLibr::picture@s3:830A
4:2334  c45e06               les bx, ptr [bp + 6]
4:2337  2689472a             mov word ptr es:[bx + 0x2a], ax
4:233B  2689572c             mov word ptr es:[bx + 0x2c], dx
4:233F  666800001000         push 0x100000
4:2345  8d472e               lea ax, [bx + 0x2e]
4:2348  06                   push es
4:2349  50                   push ax
4:234A  8bf0                 mov si, ax
4:234C  8cc7                 mov di, es
4:234E  9a06496823           lcall 0x2368, 0x4906  ; _fmemset@s1:4906
4:2353  83c408               add sp, 8
4:2356  666800002800         push 0x280000
4:235C  668b4606             mov eax, dword ptr [bp + 6]
4:2360  054600               add ax, 0x46
4:2363  6650                 push eax
4:2365  9a0649db21           lcall 0x21db, 0x4906  ; _fmemset@s1:4906
4:236A  83c408               add sp, 8
4:236D  6a6c                 push 0x6c
4:236F  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:2374  9a0a838c23           lcall 0x238c, 0x830a  ; ResLibr::picture@s3:830A
4:2379  8ec7                 mov es, di
4:237B  268904               mov word ptr es:[si], ax
4:237E  26895402             mov word ptr es:[si + 2], dx
4:2382  6a68                 push 0x68
4:2384  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:2389  9a0a83a323           lcall 0x23a3, 0x830a  ; ResLibr::picture@s3:830A
4:238E  c45e06               les bx, ptr [bp + 6]
4:2391  26894732             mov word ptr es:[bx + 0x32], ax
4:2395  26895734             mov word ptr es:[bx + 0x34], dx
4:2399  6a66                 push 0x66
4:239B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:23A0  9a0a83ba23           lcall 0x23ba, 0x830a  ; ResLibr::picture@s3:830A
4:23A5  c45e06               les bx, ptr [bp + 6]
4:23A8  26894736             mov word ptr es:[bx + 0x36], ax
4:23AC  26895738             mov word ptr es:[bx + 0x38], dx
4:23B0  6a6a                 push 0x6a
4:23B2  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:23B7  9a0a83d223           lcall 0x23d2, 0x830a  ; ResLibr::picture@s3:830A
4:23BC  c45e06               les bx, ptr [bp + 6]
4:23BF  2689473a             mov word ptr es:[bx + 0x3a], ax
4:23C3  2689573c             mov word ptr es:[bx + 0x3c], dx
4:23C7  68cd01               push 0x1cd
4:23CA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:23CF  9a0a83f323           lcall 0x23f3, 0x830a  ; ResLibr::picture@s3:830A
4:23D4  c45e06               les bx, ptr [bp + 6]
4:23D7  2689476e             mov word ptr es:[bx + 0x6e], ax
4:23DB  26895770             mov word ptr es:[bx + 0x70], dx
4:23DF  c746fe0000           mov word ptr [bp - 2], 0
loc_23E4:
4:23E4  8b46fe               mov ax, word ptr [bp - 2]
4:23E7  058f00               add ax, 0x8f
4:23EA  50                   push ax
4:23EB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:23F0  9a0a83ee21           lcall 0x21ee, 0x830a  ; ResLibr::picture@s3:830A
4:23F5  8b76fe               mov si, word ptr [bp - 2]
4:23F8  c1e602               shl si, 2
4:23FB  c45e06               les bx, ptr [bp + 6]
4:23FE  26894046             mov word ptr es:[bx + si + 0x46], ax
4:2402  26895048             mov word ptr es:[bx + si + 0x48], dx
4:2406  ff46fe               inc word ptr [bp - 2]
4:2409  837efe0a             cmp word ptr [bp - 2], 0xa
4:240D  7cd5                 jl 0x23e4
4:240F  66837e0600           cmp dword ptr [bp + 6], 0
4:2414  740c                 je 0x2422
4:2416  8b4606               mov ax, word ptr [bp + 6]
4:2419  8b5608               mov dx, word ptr [bp + 8]
4:241C  051c00               add ax, 0x1c
4:241F  eb04                 jmp 0x2425
4:2421  db 90
loc_2422:
4:2422  33c0                 xor ax, ax
4:2424  99                   cdq
loc_2425:
4:2425  52                   push dx
4:2426  50                   push ax
4:2427  666a73               push 0x73  ; 'New failed in Op::Op->DialogHandler'
4:242A  66ff368803           push dword ptr [0x388]
4:242F  9a62920922           lcall 0x2209, 0x9262  ; Timer::add@s2:9262
4:2434  8b4606               mov ax, word ptr [bp + 6]
4:2437  8b5608               mov dx, word ptr [bp + 8]
4:243A  5e                   pop si
4:243B  5f                   pop di
4:243C  c9                   leave
4:243D  ca0600               retf 6

; ---------------- PlanetArea::~PlanetArea@s4:2440 FAR size=196 callers=1
;   dtor
4:2440  c8140000             enter 0x14, 0
4:2444  c45e06               les bx, ptr [bp + 6]
4:2447  26c707da2a           mov word ptr es:[bx], 0x2ada
4:244C  26c747025c24         mov word ptr es:[bx + 2], 0x245c  ; SEGMENT s4:0000
4:2452  26c7471cf22a         mov word ptr es:[bx + 0x1c], 0x2af2
4:2458  26c7471e0723         mov word ptr es:[bx + 0x1e], 0x2307  ; SEGMENT s4:0000
4:245E  66833e880300         cmp dword ptr [0x388], 0
4:2464  742a                 je 0x2490
4:2466  8cc0                 mov ax, es
4:2468  0bc3                 or ax, bx
4:246A  740c                 je 0x2478
4:246C  8b4606               mov ax, word ptr [bp + 6]
4:246F  8b5608               mov dx, word ptr [bp + 8]
4:2472  051c00               add ax, 0x1c
4:2475  eb04                 jmp 0x247b
4:2477  db 90
loc_2478:
4:2478  33c0                 xor ax, ax
4:247A  99                   cdq
loc_247B:
4:247B  8946fc               mov word ptr [bp - 4], ax
4:247E  8956fe               mov word ptr [bp - 2], dx
4:2481  52                   push dx
4:2482  50                   push ax
4:2483  666a73               push 0x73  ; 'New failed in Op::Op->DialogHandler'
4:2486  66ff368803           push dword ptr [0x388]
4:248B  9ab292f524           lcall 0x24f5, 0x92b2  ; Timer::remove@s2:92B2
loc_2490:
4:2490  c45e06               les bx, ptr [bp + 6]
4:2493  268b472a             mov ax, word ptr es:[bx + 0x2a]
4:2497  268b572c             mov dx, word ptr es:[bx + 0x2c]
4:249B  8bda                 mov bx, dx
4:249D  0bd8                 or bx, ax
4:249F  740e                 je 0x24af
4:24A1  6a01                 push 1
4:24A3  52                   push dx
4:24A4  50                   push ax
4:24A5  8ec2                 mov es, dx
4:24A7  8bd8                 mov bx, ax
4:24A9  26c41f               les bx, ptr es:[bx]
4:24AC  26ff1f               lcall es:[bx]
loc_24AF:
4:24AF  c45e06               les bx, ptr [bp + 6]
4:24B2  268b476e             mov ax, word ptr es:[bx + 0x6e]
4:24B6  268b5770             mov dx, word ptr es:[bx + 0x70]
4:24BA  8bda                 mov bx, dx
4:24BC  0bd8                 or bx, ax
4:24BE  740e                 je 0x24ce
4:24C0  6a01                 push 1
4:24C2  52                   push dx
4:24C3  50                   push ax
4:24C4  8ec2                 mov es, dx
4:24C6  8bd8                 mov bx, ax
4:24C8  26c41f               les bx, ptr es:[bx]
4:24CB  26ff1f               lcall es:[bx]
loc_24CE:
4:24CE  66837e0600           cmp dword ptr [bp + 6], 0
4:24D3  740b                 je 0x24e0
4:24D5  8b4606               mov ax, word ptr [bp + 6]
4:24D8  8b5608               mov dx, word ptr [bp + 8]
4:24DB  051c00               add ax, 0x1c
4:24DE  eb03                 jmp 0x24e3
loc_24E0:
4:24E0  33c0                 xor ax, ax
4:24E2  99                   cdq
loc_24E3:
4:24E3  8946fc               mov word ptr [bp - 4], ax
4:24E6  8956fe               mov word ptr [bp - 2], dx
4:24E9  c45efc               les bx, ptr [bp - 4]
4:24EC  26c7079a38           mov word ptr es:[bx], 0x389a
4:24F1  26c74702bb22         mov word ptr es:[bx + 2], 0x22bb  ; SEGMENT s2:0000
4:24F7  66ff7606             push dword ptr [bp + 6]
4:24FB  90                   nop
4:24FC  0e                   push cs
4:24FD  e82228               call 0x4d22  ; CmdTarget::~CmdTarget@s4:4D22
4:2500  c9                   leave
4:2501  ca0400               retf 4

; ---------------- PlayerHasColony@s4:2504 FAR size=68 callers=1
;   does player 1 have a colony
4:2504  c8140000             enter 0x14, 0
4:2508  666801000004         push 0x4000001
4:250E  66ff364857           push dword ptr [0x5748]  ; g_sim
4:2513  9a44833418           lcall 0x1834, 0x8344  ; Sim::resolve@s7:8344
4:2518  0bd0                 or dx, ax
4:251A  7426                 je 0x2542
4:251C  c41e4857             les bx, ptr [0x5748]  ; g_sim
4:2520  66268b07             mov eax, dword ptr es:[bx]
4:2524  668946fc             mov dword ptr [bp - 4], eax
4:2528  c45efc               les bx, ptr [bp - 4]
4:252B  66268b07             mov eax, dword ptr es:[bx]
4:252F  6650                 push eax
4:2531  9a9ed68c13           lcall 0x138c, 0xd69e  ; Sim::hasPlayerColony@s6:D69E
4:2536  0bc0                 or ax, ax
4:2538  7508                 jne 0x2542
4:253A  b80100               mov ax, 1
4:253D  c9                   leave
4:253E  ca0400               retf 4
4:2541  db 90
loc_2542:
4:2542  33c0                 xor ax, ax
4:2544  c9                   leave
4:2545  ca0400               retf 4

; ---------------- defaultPosA@s4:2548 FAR size=22 callers=1
;   copies a fixed position (DGROUP 0x4228)
4:2548  55                   push bp
4:2549  8bec                 mov bp, sp
4:254B  680122               push 0x2201  ; SEGMENT s10:0000
4:254E  682842               push 0x4228
4:2551  66ff760a             push dword ptr [bp + 0xa]
4:2555  9a623f8e24           lcall 0x248e, 0x3f62  ; Pos3::assign@s2:3F62
4:255A  c9                   leave
4:255B  ca0800               retf 8

; ---------------- PlanetArea::hover@s4:255E FAR size=34 callers=1
;   the object under the cursor
4:255E  c8080000             enter 8, 0
4:2562  c45e06               les bx, ptr [bp + 6]
4:2565  6626837f2600         cmp dword ptr es:[bx + 0x26], 0
4:256B  740d                 je 0x257a
4:256D  26c45f26             les bx, ptr es:[bx + 0x26]
4:2571  268b470a             mov ax, word ptr es:[bx + 0xa]
4:2575  c9                   leave
4:2576  ca0400               retf 4
4:2579  db 90
loc_257A:
4:257A  33c0                 xor ax, ax
4:257C  c9                   leave
4:257D  ca0400               retf 4

; ---------------- PlanetArea::click@s4:2580 FAR size=82 callers=1
;   places at the clicked cell
4:2580  c8060000             enter 6, 0
4:2584  c45e06               les bx, ptr [bp + 6]
4:2587  6626837f2000         cmp dword ptr es:[bx + 0x20], 0
4:258D  7507                 jne 0x2596
4:258F  b8ad06               mov ax, 0x6ad
4:2592  c9                   leave
4:2593  ca0c00               retf 0xc
loc_2596:
4:2596  8d46fa               lea ax, [bp - 6]
4:2599  16                   push ss
4:259A  50                   push ax
4:259B  9a383e5825           lcall 0x2558, 0x3e38  ; Pos3::Pos3@s2:3E38
4:25A0  66ff760c             push dword ptr [bp + 0xc]
4:25A4  8d46fa               lea ax, [bp - 6]
4:25A7  16                   push ss
4:25A8  50                   push ax
4:25A9  c45e06               les bx, ptr [bp + 6]
4:25AC  6626ff7720           push dword ptr es:[bx + 0x20]
4:25B1  90                   nop
4:25B2  0e                   push cs
4:25B3  e866f0               call 0x161c  ; MapViewModel::cellOf@s4:161C
4:25B6  ff7610               push word ptr [bp + 0x10]
4:25B9  8d46fa               lea ax, [bp - 6]
4:25BC  16                   push ss
4:25BD  50                   push ax
4:25BE  ff760a               push word ptr [bp + 0xa]
4:25C1  c45e06               les bx, ptr [bp + 6]
4:25C4  6626ff7720           push dword ptr es:[bx + 0x20]
4:25C9  90                   nop
4:25CA  0e                   push cs
4:25CB  e800f2               call 0x17ce  ; MapViewModel::place@s4:17CE
4:25CE  c9                   leave
4:25CF  ca0c00               retf 0xc

; ---------------- PlanetArea::open@s4:25D2 FAR size=92 callers=1
;   opens the clicked building's window
4:25D2  c80a0000             enter 0xa, 0
4:25D6  c45e06               les bx, ptr [bp + 6]
4:25D9  6626837f2000         cmp dword ptr es:[bx + 0x20], 0
4:25DF  7507                 jne 0x25e8
4:25E1  33c0                 xor ax, ax
4:25E3  c9                   leave
4:25E4  ca0a00               retf 0xa
4:25E7  db 90
loc_25E8:
4:25E8  8d46fa               lea ax, [bp - 6]
4:25EB  16                   push ss
4:25EC  50                   push ax
4:25ED  9a383e9e25           lcall 0x259e, 0x3e38  ; Pos3::Pos3@s2:3E38
4:25F2  66ff760c             push dword ptr [bp + 0xc]
4:25F6  8d46fa               lea ax, [bp - 6]
4:25F9  16                   push ss
4:25FA  50                   push ax
4:25FB  c45e06               les bx, ptr [bp + 6]
4:25FE  6626ff7720           push dword ptr es:[bx + 0x20]
4:2603  90                   nop
4:2604  0e                   push cs
4:2605  e814f0               call 0x161c  ; MapViewModel::cellOf@s4:161C
4:2608  8d46fa               lea ax, [bp - 6]
4:260B  16                   push ss
4:260C  50                   push ax
4:260D  ff760a               push word ptr [bp + 0xa]
4:2610  6a32                 push 0x32
4:2612  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:2617  9aba202726           lcall 0x2627, 0x20ba  ; Registry_get@s3:20BA
4:261C  8946f6               mov word ptr [bp - 0xa], ax
4:261F  8956f8               mov word ptr [bp - 8], dx
4:2622  52                   push dx
4:2623  50                   push ax
4:2624  9ad6713223           lcall 0x2332, 0x71d6  ; BuildingWindows::openFor@s3:71D6
4:2629  c9                   leave
4:262A  ca0a00               retf 0xa
4:262D  db 00

; ---------------- PlanetArea::resetAnim@s4:262E FAR size=24 callers=2
;   restarts the animation
4:262E  55                   push bp
4:262F  8bec                 mov bp, sp
4:2631  c45e06               les bx, ptr [bp + 6]
4:2634  6633c0               xor eax, eax
4:2637  26c747440100         mov word ptr es:[bx + 0x44], 1
4:263D  662689473e           mov dword ptr es:[bx + 0x3e], eax
4:2642  c9                   leave
4:2643  ca0400               retf 4

; ---------------- defaultPosB@s4:2646 FAR size=22 callers=1
;   copies a fixed position (DGROUP 0x4222)
4:2646  55                   push bp
4:2647  8bec                 mov bp, sp
4:2649  684c25               push 0x254c  ; SEGMENT s10:0000
4:264C  682242               push 0x4222
4:264F  66ff760a             push dword ptr [bp + 0xa]
4:2653  9a623ff025           lcall 0x25f0, 0x3f62  ; Pos3::assign@s2:3F62
4:2658  c9                   leave
4:2659  ca0800               retf 8

; ---------------- currentTurnB@s4:265C FAR size=14 callers=1
;   the turn number
4:265C  66ff364857           push dword ptr [0x5748]  ; g_sim
4:2661  9a26831625           lcall 0x2516, 0x8326  ; Sim::getTurnNumber@s7:8326
4:2666  ca0400               retf 4
4:2669  db 00

; ---------------- PlanetArea::animStarted@s4:266A FAR size=14 callers=1
;   +0x44
4:266A  55                   push bp
4:266B  8bec                 mov bp, sp
4:266D  c45e06               les bx, ptr [bp + 6]
4:2670  268b4744             mov ax, word ptr es:[bx + 0x44]
4:2674  c9                   leave
4:2675  ca0400               retf 4

; ---------------- defaultPosC@s4:2678 FAR size=22 callers=2
;   copies a fixed position (DGROUP 0x4216)
4:2678  55                   push bp
4:2679  8bec                 mov bp, sp
4:267B  684a26               push 0x264a  ; SEGMENT s10:0000
4:267E  681642               push 0x4216
4:2681  66ff760a             push dword ptr [bp + 0xa]
4:2685  9a623f5626           lcall 0x2656, 0x3f62  ; Pos3::assign@s2:3F62
4:268A  c9                   leave
4:268B  ca0800               retf 8

; ---------------- PlanetArea::currentFrame@s4:268E FAR size=52 callers=2
;   the current frame's DIB
4:268E  55                   push bp
4:268F  8bec                 mov bp, sp
4:2691  56                   push si
4:2692  c45e06               les bx, ptr [bp + 6]
4:2695  26837f4200           cmp word ptr es:[bx + 0x42], 0
4:269A  740f                 je 0x26ab
4:269C  6626c7474000000000   mov dword ptr es:[bx + 0x40], 0
4:26A5  26c747440100         mov word ptr es:[bx + 0x44], 1
loc_26AB:
4:26AB  c45e06               les bx, ptr [bp + 6]
4:26AE  268b773e             mov si, word ptr es:[bx + 0x3e]
4:26B2  c1e602               shl si, 2
4:26B5  268b4046             mov ax, word ptr es:[bx + si + 0x46]
4:26B9  268b5048             mov dx, word ptr es:[bx + si + 0x48]
4:26BD  5e                   pop si
4:26BE  c9                   leave
4:26BF  ca0400               retf 4

; ---------------- defaultPosD@s4:26C2 FAR size=22 callers=1
;   copies a fixed position (DGROUP 0x421C)
4:26C2  55                   push bp
4:26C3  8bec                 mov bp, sp
4:26C5  687c26               push 0x267c  ; SEGMENT s10:0000
4:26C8  681c42               push 0x421c
4:26CB  66ff760a             push dword ptr [bp + 0xa]
4:26CF  9a623f8826           lcall 0x2688, 0x3f62  ; Pos3::assign@s2:3F62
4:26D4  c9                   leave
4:26D5  ca0800               retf 8

; ---------------- cursorOffset@s4:26D8 FAR size=32 callers=1
;   position of cursor n (DGROUP 0x65CA)
4:26D8  55                   push bp
4:26D9  8bec                 mov bp, sp
4:26DB  8b460a               mov ax, word ptr [bp + 0xa]
4:26DE  8bc8                 mov cx, ax
4:26E0  03c0                 add ax, ax
4:26E2  03c1                 add ax, cx
4:26E4  03c0                 add ax, ax
4:26E6  05ca65               add ax, 0x65ca
4:26E9  1e                   push ds
4:26EA  50                   push ax
4:26EB  66ff760c             push dword ptr [bp + 0xc]
4:26EF  9a623fd226           lcall 0x26d2, 0x3f62  ; Pos3::assign@s2:3F62
4:26F4  c9                   leave
4:26F5  ca0a00               retf 0xa

; ---------------- defaultPosE@s4:26F8 FAR size=22 callers=1
;   copies a fixed position (DGROUP 0x4210)
4:26F8  55                   push bp
4:26F9  8bec                 mov bp, sp
4:26FB  68c626               push 0x26c6  ; SEGMENT s10:0000 | 'fem29.wav'
4:26FE  681042               push 0x4210
4:2701  66ff760a             push dword ptr [bp + 0xa]
4:2705  9a623ff226           lcall 0x26f2, 0x3f62  ; Pos3::assign@s2:3F62
4:270A  c9                   leave
4:270B  ca0800               retf 8

; ---------------- PlanetArea::setTarget@s4:270E FAR size=254 callers=1
;   the object followed
4:270E  c80a0000             enter 0xa, 0
4:2712  837e0a00             cmp word ptr [bp + 0xa], 0
4:2716  7442                 je 0x275a
4:2718  c45e06               les bx, ptr [bp + 6]
4:271B  268b4722             mov ax, word ptr es:[bx + 0x22]
4:271F  260b4720             or ax, word ptr es:[bx + 0x20]
4:2723  0f84e000             je 0x2807
4:2727  8cc0                 mov ax, es
4:2729  0bc3                 or ax, bx
4:272B  7409                 je 0x2736
4:272D  8bc3                 mov ax, bx
4:272F  8cc2                 mov dx, es
4:2731  051c00               add ax, 0x1c
4:2734  eb03                 jmp 0x2739
loc_2736:
4:2736  33c0                 xor ax, ax
4:2738  99                   cdq
loc_2739:
4:2739  8946fc               mov word ptr [bp - 4], ax
4:273C  8956fe               mov word ptr [bp - 2], dx
4:273F  52                   push dx
4:2740  50                   push ax
4:2741  6626ff7720           push dword ptr es:[bx + 0x20]
4:2746  9aa61e7d27           lcall 0x277d, 0x1ea6  ; RegObj::removeListener@s3:1EA6
4:274B  c45e06               les bx, ptr [bp + 6]
4:274E  662bc0               sub eax, eax
4:2751  6626894720           mov dword ptr es:[bx + 0x20], eax
4:2756  c9                   leave
4:2757  ca0800               retf 8
loc_275A:
4:275A  c45e06               les bx, ptr [bp + 6]
4:275D  6626837f2000         cmp dword ptr es:[bx + 0x20], 0
4:2763  740d                 je 0x2772
4:2765  8b460c               mov ax, word ptr [bp + 0xc]
4:2768  26c45f20             les bx, ptr es:[bx + 0x20]
4:276C  26394708             cmp word ptr es:[bx + 8], ax
4:2770  7474                 je 0x27e6
loc_2772:
4:2772  ff760c               push word ptr [bp + 0xc]
4:2775  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:277A  9aba20ad27           lcall 0x27ad, 0x20ba  ; Registry_get@s3:20BA
4:277F  8946fc               mov word ptr [bp - 4], ax
4:2782  8956fe               mov word ptr [bp - 2], dx
4:2785  c45e06               les bx, ptr [bp + 6]
4:2788  6626837f2000         cmp dword ptr es:[bx + 0x20], 0
4:278E  741f                 je 0x27af
4:2790  8cc0                 mov ax, es
4:2792  0bc3                 or ax, bx
4:2794  740a                 je 0x27a0
4:2796  8bc3                 mov ax, bx
4:2798  8cc2                 mov dx, es
4:279A  051c00               add ax, 0x1c
4:279D  eb04                 jmp 0x27a3
4:279F  db 90
loc_27A0:
4:27A0  33c0                 xor ax, ax
4:27A2  99                   cdq
loc_27A3:
4:27A3  52                   push dx
4:27A4  50                   push ax
4:27A5  6626ff7720           push dword ptr es:[bx + 0x20]
4:27AA  9aa61e0528           lcall 0x2805, 0x1ea6  ; RegObj::removeListener@s3:1EA6
loc_27AF:
4:27AF  668b46fc             mov eax, dword ptr [bp - 4]
4:27B3  c45e06               les bx, ptr [bp + 6]
4:27B6  6626894720           mov dword ptr es:[bx + 0x20], eax
4:27BB  8cc0                 mov ax, es
4:27BD  0bc3                 or ax, bx
4:27BF  740b                 je 0x27cc
4:27C1  8b4606               mov ax, word ptr [bp + 6]
4:27C4  8b5608               mov dx, word ptr [bp + 8]
4:27C7  051c00               add ax, 0x1c
4:27CA  eb03                 jmp 0x27cf
loc_27CC:
4:27CC  33c0                 xor ax, ax
4:27CE  99                   cdq
loc_27CF:
4:27CF  52                   push dx
4:27D0  50                   push ax
4:27D1  6a00                 push 0
4:27D3  c45e06               les bx, ptr [bp + 6]
4:27D6  6626ff7720           push dword ptr es:[bx + 0x20]
4:27DB  26c45f20             les bx, ptr es:[bx + 0x20]
4:27DF  26c41f               les bx, ptr es:[bx]
4:27E2  26ff5f04             lcall es:[bx + 4]
loc_27E6:
4:27E6  66ff7606             push dword ptr [bp + 6]
4:27EA  90                   nop
4:27EB  0e                   push cs
4:27EC  e87300               call 0x2862  ; PlanetArea::targetField@s4:2862
4:27EF  0bd0                 or dx, ax
4:27F1  7409                 je 0x27fc
4:27F3  c45e06               les bx, ptr [bp + 6]
4:27F6  26c747240100         mov word ptr es:[bx + 0x24], 1
loc_27FC:
4:27FC  6a07                 push 7
4:27FE  66ff7606             push dword ptr [bp + 6]
4:2802  9a621f1a26           lcall 0x261a, 0x1f62  ; RegObj::notify@s3:1F62
loc_2807:
4:2807  c9                   leave
4:2808  ca0800               retf 8
4:280B  db 00

; ---------------- PlanetArea::takeEvent@s4:280C FAR size=86 callers=1
;   takes the pending event
4:280C  c8080000             enter 8, 0
4:2810  c45e06               les bx, ptr [bp + 6]
4:2813  26837f2400           cmp word ptr es:[bx + 0x24], 0
4:2818  7508                 jne 0x2822
4:281A  33c0                 xor ax, ax
4:281C  99                   cdq
4:281D  c9                   leave
4:281E  ca0400               retf 4
4:2821  db 90
loc_2822:
4:2822  26c747240000         mov word ptr es:[bx + 0x24], 0
4:2828  6626837f2000         cmp dword ptr es:[bx + 0x20], 0
4:282E  7416                 je 0x2846
4:2830  c45e06               les bx, ptr [bp + 6]
4:2833  26c45f20             les bx, ptr es:[bx + 0x20]
4:2837  66268b474c           mov eax, dword ptr es:[bx + 0x4c]
4:283C  c45e06               les bx, ptr [bp + 6]
4:283F  6626894726           mov dword ptr es:[bx + 0x26], eax
4:2844  eb0c                 jmp 0x2852
loc_2846:
4:2846  c45e06               les bx, ptr [bp + 6]
4:2849  6626c7472600000000   mov dword ptr es:[bx + 0x26], 0
loc_2852:
4:2852  c45e06               les bx, ptr [bp + 6]
4:2855  268b4726             mov ax, word ptr es:[bx + 0x26]
4:2859  268b5728             mov dx, word ptr es:[bx + 0x28]
4:285D  c9                   leave
4:285E  ca0400               retf 4
4:2861  db 00

; ---------------- PlanetArea::targetField@s4:2862 FAR size=58 callers=5
;   the target's +0x4C
4:2862  c8080000             enter 8, 0
4:2866  c45e06               les bx, ptr [bp + 6]
4:2869  6626837f2000         cmp dword ptr es:[bx + 0x20], 0
4:286F  7413                 je 0x2884
4:2871  26c45f20             les bx, ptr es:[bx + 0x20]
4:2875  66268b474c           mov eax, dword ptr es:[bx + 0x4c]
4:287A  c45e06               les bx, ptr [bp + 6]
4:287D  6626894726           mov dword ptr es:[bx + 0x26], eax
4:2882  eb09                 jmp 0x288d
loc_2884:
4:2884  6626c7472600000000   mov dword ptr es:[bx + 0x26], 0
loc_288D:
4:288D  c45e06               les bx, ptr [bp + 6]
4:2890  268b4726             mov ax, word ptr es:[bx + 0x26]
4:2894  268b5728             mov dx, word ptr es:[bx + 0x28]
4:2898  c9                   leave
4:2899  ca0400               retf 4

; ---------------- PlanetArea::onTimer@s4:289C FAR size=134 callers=0
;   (vslot 7) advances
4:289C  55                   push bp
4:289D  8bec                 mov bp, sp
4:289F  57                   push di
4:28A0  56                   push si
4:28A1  8b460a               mov ax, word ptr [bp + 0xa]
4:28A4  eb66                 jmp 0x290c
loc_28A6:
4:28A6  c45e06               les bx, ptr [bp + 6]
4:28A9  6626c7470400000000   mov dword ptr es:[bx + 4], 0
4:28B2  5e                   pop si
4:28B3  5f                   pop di
4:28B4  c9                   leave
4:28B5  ca0600               retf 6
loc_28B8:
4:28B8  8b4606               mov ax, word ptr [bp + 6]
4:28BB  8b5608               mov dx, word ptr [bp + 8]
4:28BE  2d1c00               sub ax, 0x1c
4:28C1  52                   push dx
4:28C2  50                   push ax
4:28C3  8bf0                 mov si, ax
4:28C5  8bfa                 mov di, dx
4:28C7  90                   nop
4:28C8  0e                   push cs
4:28C9  e85600               call 0x2922  ; PlanetArea::step@s4:2922
4:28CC  ff760a               push word ptr [bp + 0xa]
4:28CF  57                   push di
4:28D0  56                   push si
loc_28D1:
4:28D1  9a621f4927           lcall 0x2749, 0x1f62  ; RegObj::notify@s3:1F62
4:28D6  5e                   pop si
4:28D7  5f                   pop di
4:28D8  c9                   leave
4:28D9  ca0600               retf 6
loc_28DC:
4:28DC  c45e06               les bx, ptr [bp + 6]
4:28DF  6626837f0400         cmp dword ptr es:[bx + 4], 0
4:28E5  7435                 je 0x291c
4:28E7  8d47e4               lea ax, [bx - 0x1c]
4:28EA  06                   push es
4:28EB  50                   push ax
4:28EC  90                   nop
4:28ED  0e                   push cs
4:28EE  e871ff               call 0x2862  ; PlanetArea::targetField@s4:2862
4:28F1  0bd0                 or dx, ax
4:28F3  7409                 je 0x28fe
4:28F5  c45e06               les bx, ptr [bp + 6]
4:28F8  26c747080100         mov word ptr es:[bx + 8], 1
loc_28FE:
4:28FE  ff760a               push word ptr [bp + 0xa]
4:2901  668b4606             mov eax, dword ptr [bp + 6]
4:2905  2d1c00               sub ax, 0x1c
4:2908  6650                 push eax
4:290A  ebc5                 jmp 0x28d1
loc_290C:
4:290C  48                   dec ax
4:290D  7497                 je 0x28a6
4:290F  48                   dec ax
4:2910  74a6                 je 0x28b8
4:2912  48                   dec ax
4:2913  48                   dec ax
4:2914  7c06                 jl 0x291c
4:2916  7004                 jo 0x291c
4:2918  48                   dec ax
4:2919  48                   dec ax
4:291A  7ec0                 jle 0x28dc
loc_291C:
4:291C  5e                   pop si
4:291D  5f                   pop di
4:291E  c9                   leave
4:291F  ca0600               retf 6

; ---------------- PlanetArea::step@s4:2922 FAR size=40 callers=1
;   next of 10 frames
4:2922  55                   push bp
4:2923  8bec                 mov bp, sp
4:2925  c45e06               les bx, ptr [bp + 6]
4:2928  26837f4000           cmp word ptr es:[bx + 0x40], 0
4:292D  7417                 je 0x2946
4:292F  26ff473e             inc word ptr es:[bx + 0x3e]
4:2933  26837f3e0a           cmp word ptr es:[bx + 0x3e], 0xa
4:2938  7c0c                 jl 0x2946
4:293A  26c7473e0000         mov word ptr es:[bx + 0x3e], 0
4:2940  26c747420100         mov word ptr es:[bx + 0x42], 1
loc_2946:
4:2946  c9                   leave
4:2947  ca0400               retf 4

; ---------------- PlanetArea::paint@s4:294A FAR size=46 callers=0
;   (vslot 4) draws (resolution 640 check)
4:294A  55                   push bp
4:294B  8bec                 mov bp, sp
4:294D  c45e06               les bx, ptr [bp + 6]
4:2950  26837f1800           cmp word ptr es:[bx + 0x18], 0
4:2955  740d                 je 0x2964
4:2957  817e0e8002           cmp word ptr [bp + 0xe], 0x280
4:295C  7506                 jne 0x2964
4:295E  26c747180000         mov word ptr es:[bx + 0x18], 0
loc_2964:
4:2964  66ff760c             push dword ptr [bp + 0xc]
4:2968  66ff7608             push dword ptr [bp + 8]
4:296C  ff7606               push word ptr [bp + 6]
4:296F  90                   nop
4:2970  0e                   push cs
4:2971  e89024               call 0x4e04  ; CmdTarget::paint@s4:4E04
4:2974  c9                   leave
4:2975  ca0a00               retf 0xa

; ---------------- PlanetArea::loadPictures@s4:2978 size=304 callers=0
;   apis: USER.GetClientRect
;   (vslot 5) the planet's sheets
4:2978  c8400000             enter 0x40, 0
4:297C  6a01                 push 1
4:297E  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:2983  9a9680d428           lcall 0x28d4, 0x8096  ; ResLibr::planetSheets@s3:8096
4:2988  8946fc               mov word ptr [bp - 4], ax
4:298B  8956fe               mov word ptr [bp - 2], dx
4:298E  52                   push dx
4:298F  50                   push ax
4:2990  6a01                 push 1
4:2992  8d46d8               lea ax, [bp - 0x28]
4:2995  16                   push ss
4:2996  50                   push ax
4:2997  9afe48bc29           lcall 0x29bc, 0x48fe  ; BmpFile::BmpFile@s2:48FE
4:299C  6a1e                 push 0x1e
4:299E  9a9c17e029           lcall 0x29e0, 0x179c  ; operator_new@s1:179C
4:29A3  83c402               add sp, 2
4:29A6  8946c4               mov word ptr [bp - 0x3c], ax
4:29A9  8956c6               mov word ptr [bp - 0x3a], dx
4:29AC  0bd0                 or dx, ax
4:29AE  7410                 je 0x29c0
4:29B0  8d46d8               lea ax, [bp - 0x28]
4:29B3  16                   push ss
4:29B4  50                   push ax
4:29B5  66ff76c4             push dword ptr [bp - 0x3c]
4:29B9  9a923ff629           lcall 0x29f6, 0x3f92  ; DIB::DIB(copy)@s2:3F92
4:29BE  eb03                 jmp 0x29c3
loc_29C0:
4:29C0  33c0                 xor ax, ax
4:29C2  99                   cdq
loc_29C3:
4:29C3  8946d4               mov word ptr [bp - 0x2c], ax
4:29C6  8956d6               mov word ptr [bp - 0x2a], dx
4:29C9  52                   push dx
4:29CA  c45ed4               les bx, ptr [bp - 0x2c]
4:29CD  50                   push ax
4:29CE  26c41f               les bx, ptr es:[bx]
4:29D1  26ff5f14             lcall es:[bx + 0x14]
4:29D5  8946d0               mov word ptr [bp - 0x30], ax
4:29D8  8956d2               mov word ptr [bp - 0x2e], dx
4:29DB  6a14                 push 0x14
4:29DD  9a9c172c2a           lcall 0x2a2c, 0x179c  ; operator_new@s1:179C
4:29E2  83c402               add sp, 2
4:29E5  8946c4               mov word ptr [bp - 0x3c], ax
4:29E8  8956c6               mov word ptr [bp - 0x3a], dx
4:29EB  0bd0                 or dx, ax
4:29ED  740b                 je 0x29fa
4:29EF  ff76c6               push word ptr [bp - 0x3a]
4:29F2  50                   push ax
4:29F3  9a584c172a           lcall 0x2a17, 0x4c58  ; MemBlock::MemBlock@s2:4C58
4:29F8  eb03                 jmp 0x29fd
loc_29FA:
4:29FA  33c0                 xor ax, ax
4:29FC  99                   cdq
loc_29FD:
4:29FD  c45e06               les bx, ptr [bp + 6]
4:2A00  2689470e             mov word ptr es:[bx + 0xe], ax
4:2A04  26895710             mov word ptr es:[bx + 0x10], dx
4:2A08  66ff76d0             push dword ptr [bp - 0x30]
4:2A0C  c45e06               les bx, ptr [bp + 6]
4:2A0F  6626ff770e           push dword ptr es:[bx + 0xe]
4:2A14  9a844d5a2a           lcall 0x2a5a, 0x4d84  ; MemBlock::copyFrom@s2:4D84
4:2A19  ff369603             push word ptr [0x396]
4:2A1D  8d46c8               lea ax, [bp - 0x38]
4:2A20  16                   push ss
4:2A21  50                   push ax
4:2A22  9affff0000           lcall 0, 0xffff  ; USER.GetClientRect
4:2A27  6a1e                 push 0x1e
4:2A29  9a9c175123           lcall 0x2351, 0x179c  ; operator_new@s1:179C
4:2A2E  83c402               add sp, 2
4:2A31  8946c4               mov word ptr [bp - 0x3c], ax
4:2A34  8956c6               mov word ptr [bp - 0x3a], dx
4:2A37  0bd0                 or dx, ax
4:2A39  742f                 je 0x2a6a
4:2A3B  8b46cc               mov ax, word ptr [bp - 0x34]
4:2A3E  2b46c8               sub ax, word ptr [bp - 0x38]
4:2A41  40                   inc ax
4:2A42  50                   push ax
4:2A43  8b46ce               mov ax, word ptr [bp - 0x32]
4:2A46  2b46ca               sub ax, word ptr [bp - 0x36]
4:2A49  40                   inc ax
4:2A4A  50                   push ax
4:2A4B  c45e06               les bx, ptr [bp + 6]
4:2A4E  6626ff770e           push dword ptr es:[bx + 0xe]
4:2A53  66ff76c4             push dword ptr [bp - 0x3c]
4:2A57  9a5c409c2a           lcall 0x2a9c, 0x405c  ; DIB::DIB(w,h,bpp)@s2:405C
4:2A5C  c45e06               les bx, ptr [bp + 6]
4:2A5F  2689470a             mov word ptr es:[bx + 0xa], ax
4:2A63  2689570c             mov word ptr es:[bx + 0xc], dx
4:2A67  eb0d                 jmp 0x2a76
4:2A69  db 90
loc_2A6A:
4:2A6A  c45e06               les bx, ptr [bp + 6]
4:2A6D  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
loc_2A76:
4:2A76  668b46d4             mov eax, dword ptr [bp - 0x2c]
4:2A7A  668946c0             mov dword ptr [bp - 0x40], eax
4:2A7E  668946c4             mov dword ptr [bp - 0x3c], eax
4:2A82  660bc0               or eax, eax
4:2A85  740d                 je 0x2a94
4:2A87  6a01                 push 1
4:2A89  c45ed4               les bx, ptr [bp - 0x2c]
4:2A8C  06                   push es
4:2A8D  50                   push ax
4:2A8E  26c41f               les bx, ptr es:[bx]
4:2A91  26ff1f               lcall es:[bx]
loc_2A94:
4:2A94  8d46d8               lea ax, [bp - 0x28]
4:2A97  16                   push ss
4:2A98  50                   push ax
4:2A99  9a6c490827           lcall 0x2708, 0x496c  ; BmpFile::~BmpFile@s2:496C
4:2A9E  c9                   leave
4:2A9F  ca0600               retf 6
4:2AA2  db 90 0e e8 51 f7 cb

; ---------------- PlanetArea::thunk_dtor@s4:2AA8 FAR size=12 callers=0
;   this-adjusting thunk
4:2AA8  8bdc                 mov bx, sp
4:2AAA  36836f041c           sub word ptr ss:[bx + 4], 0x1c
4:2AAF  e90200               jmp 0x2ab4
4:2AB2  db 90 90

; ---------------- PlanetArea::scalar_dtor@s4:2AB4 FAR size=70 callers=0
;   deleting destructor
4:2AB4  55                   push bp
4:2AB5  8bec                 mov bp, sp
4:2AB7  66ff7606             push dword ptr [bp + 6]
4:2ABB  90                   nop
4:2ABC  0e                   push cs
4:2ABD  e880f9               call 0x2440  ; PlanetArea::~PlanetArea@s4:2440
4:2AC0  f6460a01             test byte ptr [bp + 0xa], 1
4:2AC4  7409                 je 0x2acf
4:2AC6  66ff7606             push dword ptr [bp + 6]
4:2ACA  9ace17a129           lcall 0x29a1, 0x17ce  ; operator_delete@s1:17CE
loc_2ACF:
4:2ACF  8b4606               mov ax, word ptr [bp + 6]
4:2AD2  8b5608               mov dx, word ptr [bp + 8]
4:2AD5  c9                   leave
4:2AD6  ca0600               retf 6
4:2AD9  db 90 b4 2a ec 2a f2 1d e4 2a ce 1d e8 2a d4 1d 86
4:2AE9  db 29 4a 29 f0 2a 78 29 50 24 a8 2a f8 2a 9c 28 dc
4:2AF9  db 2a

; ---------------- deletePtrField@s4:2AFA FAR size=22 callers=1
;   deletes the pointer at +0
4:2AFA  c8080000             enter 8, 0
4:2AFE  c45e06               les bx, ptr [bp + 6]
4:2B01  66268b0f             mov ecx, dword ptr es:[bx]
4:2B05  6651                 push ecx
4:2B07  9ace17cd2a           lcall 0x2acd, 0x17ce  ; operator_delete@s1:17CE
4:2B0C  c9                   leave
4:2B0D  ca0400               retf 4

; ---------------- ListModel04::ListModel04@s4:2B10 FAR size=336 callers=1
;   registry 0x04: a scrolling list of objects (PtrArray +0x17E, index +0x174)
4:2B10  c80c0000             enter 0xc, 0
4:2B14  ff760a               push word ptr [bp + 0xa]
4:2B17  6a01                 push 1
4:2B19  66ff7606             push dword ptr [bp + 6]
4:2B1D  90                   nop
4:2B1E  0e                   push cs
4:2B1F  e8fc1f               call 0x4b1e  ; WindowModel::WindowModel@s4:4B1E
4:2B22  c45e06               les bx, ptr [bp + 6]
4:2B25  26c747209a38         mov word ptr es:[bx + 0x20], 0x389a
4:2B2B  26c747223e2b         mov word ptr es:[bx + 0x22], 0x2b3e  ; SEGMENT s2:0000
4:2B31  c45e06               les bx, ptr [bp + 6]
4:2B34  26c74720a83a         mov word ptr es:[bx + 0x20], 0x3aa8
4:2B3A  26c74722102c         mov word ptr es:[bx + 0x22], 0x2c10  ; SEGMENT s2:0000
4:2B40  c45e06               les bx, ptr [bp + 6]
4:2B43  662bc0               sub eax, eax
4:2B46  6626894724           mov dword ptr es:[bx + 0x24], eax
4:2B4B  2689877401           mov word ptr es:[bx + 0x174], ax
4:2B50  2689877601           mov word ptr es:[bx + 0x176], ax
4:2B55  2689877801           mov word ptr es:[bx + 0x178], ax
4:2B5A  662bc9               sub ecx, ecx
4:2B5D  6626898f7a01         mov dword ptr es:[bx + 0x17a], ecx
4:2B63  6626898f7e01         mov dword ptr es:[bx + 0x17e], ecx
4:2B69  6626898f8201         mov dword ptr es:[bx + 0x182], ecx
4:2B6F  6626898f8601         mov dword ptr es:[bx + 0x186], ecx
4:2B75  26c707d832           mov word ptr es:[bx], 0x32d8
4:2B7A  26c747028a2b         mov word ptr es:[bx + 2], 0x2b8a  ; SEGMENT s4:0000
4:2B80  26c747201433         mov word ptr es:[bx + 0x20], 0x3314
4:2B86  26c74722f42a         mov word ptr es:[bx + 0x22], 0x2af4  ; SEGMENT s4:0000
4:2B8C  6a2f                 push 0x2f
4:2B8E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:2B93  9aba20f22b           lcall 0x2bf2, 0x20ba  ; Registry_get@s3:20BA
4:2B98  c45e06               les bx, ptr [bp + 6]
4:2B9B  2689878201           mov word ptr es:[bx + 0x182], ax
4:2BA0  2689978401           mov word ptr es:[bx + 0x184], dx
4:2BA5  8cc0                 mov ax, es
4:2BA7  0bc3                 or ax, bx
4:2BA9  740b                 je 0x2bb6
4:2BAB  8b4606               mov ax, word ptr [bp + 6]
4:2BAE  8b5608               mov dx, word ptr [bp + 8]
4:2BB1  052000               add ax, 0x20
4:2BB4  eb03                 jmp 0x2bb9
loc_2BB6:
4:2BB6  33c0                 xor ax, ax
4:2BB8  99                   cdq
loc_2BB9:
4:2BB9  52                   push dx
4:2BBA  50                   push ax
4:2BBB  6a00                 push 0
4:2BBD  c45e06               les bx, ptr [bp + 6]
4:2BC0  6626ffb78201         push dword ptr es:[bx + 0x182]
4:2BC6  26c49f8201           les bx, ptr es:[bx + 0x182]
4:2BCB  26c41f               les bx, ptr es:[bx]
4:2BCE  26ff5f04             lcall es:[bx + 4]
4:2BD2  c45e06               les bx, ptr [bp + 6]
4:2BD5  26c49f8201           les bx, ptr es:[bx + 0x182]
4:2BDA  66268b4724           mov eax, dword ptr es:[bx + 0x24]
4:2BDF  c45e06               les bx, ptr [bp + 6]
4:2BE2  662689877a01         mov dword ptr es:[bx + 0x17a], eax
4:2BE8  6a6e                 push 0x6e
4:2BEA  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:2BEF  9a0a83e02a           lcall 0x2ae0, 0x830a  ; ResLibr::picture@s3:830A
4:2BF4  c45e06               les bx, ptr [bp + 6]
4:2BF7  26894724             mov word ptr es:[bx + 0x24], ax
4:2BFB  26895726             mov word ptr es:[bx + 0x26], dx
4:2BFF  6626c7472800000000   mov dword ptr es:[bx + 0x28], 0
4:2C08  6626ff7724           push dword ptr es:[bx + 0x24]
4:2C0D  9a72479a29           lcall 0x299a, 0x4772  ; DIB::rect@s2:4772
4:2C12  8946fc               mov word ptr [bp - 4], ax
4:2C15  8956fe               mov word ptr [bp - 2], dx
4:2C18  66ff7606             push dword ptr [bp + 6]
4:2C1C  90                   nop
4:2C1D  0e                   push cs
4:2C1E  e8571f               call 0x4b78  ; WindowModel::restorePlace@s4:4B78
4:2C21  b80100               mov ax, 1
4:2C24  c45e06               les bx, ptr [bp + 6]
4:2C27  2689876c01           mov word ptr es:[bx + 0x16c], ax
4:2C2C  2689876e01           mov word ptr es:[bx + 0x16e], ax
4:2C31  c45efc               les bx, ptr [bp - 4]
4:2C34  268b4704             mov ax, word ptr es:[bx + 4]
4:2C38  c45e06               les bx, ptr [bp + 6]
4:2C3B  2603876c01           add ax, word ptr es:[bx + 0x16c]
4:2C40  2689877001           mov word ptr es:[bx + 0x170], ax
4:2C45  c45efc               les bx, ptr [bp - 4]
4:2C48  268b4708             mov ax, word ptr es:[bx + 8]
4:2C4C  2d1900               sub ax, 0x19
4:2C4F  c45e06               les bx, ptr [bp + 6]
4:2C52  2689877201           mov word ptr es:[bx + 0x172], ax
4:2C57  8bc3                 mov ax, bx
4:2C59  8cc2                 mov dx, es
4:2C5B  c9                   leave
4:2C5C  ca0600               retf 6
4:2C5F  db 00

; ---------------- ListModel04::~ListModel04@s4:2C60 FAR size=194 callers=1
;   dtor
4:2C60  c8140000             enter 0x14, 0
4:2C64  56                   push si
4:2C65  c45e06               les bx, ptr [bp + 6]
4:2C68  26c707d832           mov word ptr es:[bx], 0x32d8
4:2C6D  26c747027d2c         mov word ptr es:[bx + 2], 0x2c7d  ; SEGMENT s4:0000
4:2C73  26c747201433         mov word ptr es:[bx + 0x20], 0x3314
4:2C79  26c747227e2b         mov word ptr es:[bx + 0x22], 0x2b7e  ; SEGMENT s4:0000
4:2C7F  662683bf820100       cmp dword ptr es:[bx + 0x182], 0
4:2C86  742b                 je 0x2cb3
4:2C88  8cc0                 mov ax, es
4:2C8A  0bc3                 or ax, bx
4:2C8C  740c                 je 0x2c9a
4:2C8E  8b4606               mov ax, word ptr [bp + 6]
4:2C91  8b5608               mov dx, word ptr [bp + 8]
4:2C94  052000               add ax, 0x20
4:2C97  eb04                 jmp 0x2c9d
4:2C99  db 90
loc_2C9A:
4:2C9A  33c0                 xor ax, ax
4:2C9C  99                   cdq
loc_2C9D:
4:2C9D  8946fc               mov word ptr [bp - 4], ax
4:2CA0  8956fe               mov word ptr [bp - 2], dx
4:2CA3  52                   push dx
4:2CA4  50                   push ax
4:2CA5  c45e06               les bx, ptr [bp + 6]
4:2CA8  6626ffb78201         push dword ptr es:[bx + 0x182]
4:2CAE  9aa61e1a2d           lcall 0x2d1a, 0x1ea6  ; RegObj::removeListener@s3:1EA6
loc_2CB3:
4:2CB3  c45e06               les bx, ptr [bp + 6]
4:2CB6  66268b878601         mov eax, dword ptr es:[bx + 0x186]
4:2CBC  668946fc             mov dword ptr [bp - 4], eax
4:2CC0  6650                 push eax
4:2CC2  9ace170a2b           lcall 0x2b0a, 0x17ce  ; operator_delete@s1:17CE
4:2CC7  83c404               add sp, 4
4:2CCA  c45e06               les bx, ptr [bp + 6]
4:2CCD  268b4724             mov ax, word ptr es:[bx + 0x24]
4:2CD1  268b5726             mov dx, word ptr es:[bx + 0x26]
4:2CD5  8bda                 mov bx, dx
4:2CD7  0bd0                 or dx, ax
4:2CD9  740e                 je 0x2ce9
4:2CDB  6a01                 push 1
4:2CDD  53                   push bx
4:2CDE  50                   push ax
4:2CDF  8ec3                 mov es, bx
4:2CE1  8bf0                 mov si, ax
4:2CE3  26c41c               les bx, ptr es:[si]
4:2CE6  26ff1f               lcall es:[bx]
loc_2CE9:
4:2CE9  66837e0600           cmp dword ptr [bp + 6], 0
4:2CEE  740c                 je 0x2cfc
4:2CF0  8b4606               mov ax, word ptr [bp + 6]
4:2CF3  8b5608               mov dx, word ptr [bp + 8]
4:2CF6  052000               add ax, 0x20
4:2CF9  eb04                 jmp 0x2cff
4:2CFB  db 90
loc_2CFC:
4:2CFC  33c0                 xor ax, ax
4:2CFE  99                   cdq
loc_2CFF:
4:2CFF  8946fc               mov word ptr [bp - 4], ax
4:2D02  8956fe               mov word ptr [bp - 2], dx
4:2D05  c45efc               les bx, ptr [bp - 4]
4:2D08  26c7079a38           mov word ptr es:[bx], 0x389a
4:2D0D  26c747022f2b         mov word ptr es:[bx + 2], 0x2b2f  ; SEGMENT s2:0000
4:2D13  66ff7606             push dword ptr [bp + 6]
4:2D17  9a801d962b           lcall 0x2b96, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:2D1C  5e                   pop si
4:2D1D  c9                   leave
4:2D1E  ca0400               retf 4
4:2D21  db 00

; ---------------- ListModel04::rect@s4:2D22 FAR size=98 callers=1
;   window rectangle
4:2D22  c8040000             enter 4, 0
4:2D26  33c0                 xor ax, ax
4:2D28  c45e0e               les bx, ptr [bp + 0xe]
4:2D2B  268907               mov word ptr es:[bx], ax
4:2D2E  c45e0a               les bx, ptr [bp + 0xa]
4:2D31  268907               mov word ptr es:[bx], ax
4:2D34  c45e06               les bx, ptr [bp + 6]
4:2D37  6626ff7724           push dword ptr es:[bx + 0x24]
4:2D3C  9a7247112d           lcall 0x2d11, 0x4772  ; DIB::rect@s2:4772
4:2D41  8bd8                 mov bx, ax
4:2D43  8ec2                 mov es, dx
4:2D45  268b4708             mov ax, word ptr es:[bx + 8]
4:2D49  2d1400               sub ax, 0x14
4:2D4C  c45e0a               les bx, ptr [bp + 0xa]
4:2D4F  268907               mov word ptr es:[bx], ax
4:2D52  817e12b80b           cmp word ptr [bp + 0x12], 0xbb8
4:2D57  7508                 jne 0x2d61
4:2D59  c45e0e               les bx, ptr [bp + 0xe]
4:2D5C  26c7070500           mov word ptr es:[bx], 5
loc_2D61:
4:2D61  817e12ba0b           cmp word ptr [bp + 0x12], 0xbba
4:2D66  7508                 jne 0x2d70
4:2D68  c45e0e               les bx, ptr [bp + 0xe]
4:2D6B  26c7072300           mov word ptr es:[bx], 0x23
loc_2D70:
4:2D70  817e12b90b           cmp word ptr [bp + 0x12], 0xbb9
4:2D75  7508                 jne 0x2d7f
4:2D77  c45e0e               les bx, ptr [bp + 0xe]
4:2D7A  26c7077500           mov word ptr es:[bx], 0x75
loc_2D7F:
4:2D7F  c9                   leave
4:2D80  ca0e00               retf 0xe
4:2D83  db 00

; ---------------- ListModel04::currentName@s4:2D84 FAR size=22 callers=2
;   the current entry's name
4:2D84  55                   push bp
4:2D85  8bec                 mov bp, sp
4:2D87  66ff7606             push dword ptr [bp + 6]
4:2D8B  90                   nop
4:2D8C  0e                   push cs
4:2D8D  e89800               call 0x2e28  ; ListModel04::current@s4:2E28
4:2D90  50                   push ax
4:2D91  9a80bd0c0d           lcall 0xd0c, 0xbd80  ; buildingName@s5:BD80
4:2D96  c9                   leave
4:2D97  ca0400               retf 4

; ---------------- ListModel04::previous@s4:2D9A FAR size=68 callers=1
;   previous entry (wraps)
4:2D9A  c8080000             enter 8, 0
4:2D9E  c45e06               les bx, ptr [bp + 6]
4:2DA1  268b878001           mov ax, word ptr es:[bx + 0x180]
4:2DA6  260b877e01           or ax, word ptr es:[bx + 0x17e]
4:2DAB  742d                 je 0x2dda
4:2DAD  26ff8f7401           dec word ptr es:[bx + 0x174]
4:2DB2  7915                 jns 0x2dc9
4:2DB4  c45e06               les bx, ptr [bp + 6]
4:2DB7  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:2DBC  268b470a             mov ax, word ptr es:[bx + 0xa]
4:2DC0  48                   dec ax
4:2DC1  c45e06               les bx, ptr [bp + 6]
4:2DC4  2689877401           mov word ptr es:[bx + 0x174], ax
loc_2DC9:
4:2DC9  66ff7606             push dword ptr [bp + 6]
4:2DCD  90                   nop
4:2DCE  0e                   push cs
4:2DCF  e85600               call 0x2e28  ; ListModel04::current@s4:2E28
4:2DD2  c45e06               les bx, ptr [bp + 6]
4:2DD5  2689877601           mov word ptr es:[bx + 0x176], ax
loc_2DDA:
4:2DDA  c9                   leave
4:2DDB  ca0400               retf 4

; ---------------- ListModel04::next@s4:2DDE FAR size=74 callers=1
;   next entry (wraps)
4:2DDE  c8080000             enter 8, 0
4:2DE2  c45e06               les bx, ptr [bp + 6]
4:2DE5  268b878001           mov ax, word ptr es:[bx + 0x180]
4:2DEA  260b877e01           or ax, word ptr es:[bx + 0x17e]
4:2DEF  7433                 je 0x2e24
4:2DF1  26ff877401           inc word ptr es:[bx + 0x174]
4:2DF6  c45e06               les bx, ptr [bp + 6]
4:2DF9  268b877401           mov ax, word ptr es:[bx + 0x174]
4:2DFE  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:2E03  2639470a             cmp word ptr es:[bx + 0xa], ax
4:2E07  7f0a                 jg 0x2e13
4:2E09  c45e06               les bx, ptr [bp + 6]
4:2E0C  26c78774010000       mov word ptr es:[bx + 0x174], 0
loc_2E13:
4:2E13  66ff7606             push dword ptr [bp + 6]
4:2E17  90                   nop
4:2E18  0e                   push cs
4:2E19  e80c00               call 0x2e28  ; ListModel04::current@s4:2E28
4:2E1C  c45e06               les bx, ptr [bp + 6]
4:2E1F  2689877601           mov word ptr es:[bx + 0x176], ax
loc_2E24:
4:2E24  c9                   leave
4:2E25  ca0400               retf 4

; ---------------- ListModel04::current@s4:2E28 FAR size=54 callers=7
;   the current entry's object
4:2E28  c80a0000             enter 0xa, 0
4:2E2C  c45e06               les bx, ptr [bp + 6]
4:2E2F  66260fbf877401       movsx eax, word ptr es:[bx + 0x174]
4:2E36  6650                 push eax
4:2E38  6626ffb77e01         push dword ptr es:[bx + 0x17e]
4:2E3E  9ac48f3f2d           lcall 0x2d3f, 0x8fc4  ; PtrArray::get@s2:8FC4
4:2E43  8946fc               mov word ptr [bp - 4], ax
4:2E46  8956fe               mov word ptr [bp - 2], dx
4:2E49  0bd0                 or dx, ax
4:2E4B  740b                 je 0x2e58
4:2E4D  c45efc               les bx, ptr [bp - 4]
4:2E50  268b472e             mov ax, word ptr es:[bx + 0x2e]
4:2E54  c9                   leave
4:2E55  ca0400               retf 4
loc_2E58:
4:2E58  33c0                 xor ax, ax
4:2E5A  c9                   leave
4:2E5B  ca0400               retf 4

; ---------------- ListModel04::currentDetail@s4:2E5E FAR size=134 callers=2
;   the current entry's details
4:2E5E  c80e0000             enter 0xe, 0
4:2E62  c45e06               les bx, ptr [bp + 6]
4:2E65  662683bf7e0100       cmp dword ptr es:[bx + 0x17e], 0
4:2E6C  751d                 jne 0x2e8b
4:2E6E  6626ffb77a01         push dword ptr es:[bx + 0x17a]
4:2E74  66ff364857           push dword ptr [0x5748]  ; g_sim
4:2E79  9af0826426           lcall 0x2664, 0x82f0  ; Sim::stepAt@s7:82F0
4:2E7E  c45e06               les bx, ptr [bp + 6]
4:2E81  2689877e01           mov word ptr es:[bx + 0x17e], ax
4:2E86  2689978001           mov word ptr es:[bx + 0x180], dx
loc_2E8B:
4:2E8B  c45e06               les bx, ptr [bp + 6]
4:2E8E  662683bf7e0100       cmp dword ptr es:[bx + 0x17e], 0
4:2E95  7507                 jne 0x2e9e
loc_2E97:
4:2E97  33c0                 xor ax, ax
4:2E99  99                   cdq
4:2E9A  c9                   leave
4:2E9B  ca0400               retf 4
loc_2E9E:
4:2E9E  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:2EA3  268b470a             mov ax, word ptr es:[bx + 0xa]
4:2EA7  0bc0                 or ax, ax
4:2EA9  74ec                 je 0x2e97
4:2EAB  c45e06               les bx, ptr [bp + 6]
4:2EAE  66260fbf877401       movsx eax, word ptr es:[bx + 0x174]
4:2EB5  6650                 push eax
4:2EB7  6626ffb77e01         push dword ptr es:[bx + 0x17e]
4:2EBD  9ac48f412e           lcall 0x2e41, 0x8fc4  ; PtrArray::get@s2:8FC4
4:2EC2  8946fa               mov word ptr [bp - 6], ax
4:2EC5  8956fc               mov word ptr [bp - 4], dx
4:2EC8  66ff7606             push dword ptr [bp + 6]
4:2ECC  90                   nop
4:2ECD  0e                   push cs
4:2ECE  e857ff               call 0x2e28  ; ListModel04::current@s4:2E28
4:2ED1  c45e06               les bx, ptr [bp + 6]
4:2ED4  2689877601           mov word ptr es:[bx + 0x176], ax
4:2ED9  8b46fa               mov ax, word ptr [bp - 6]
4:2EDC  8b56fc               mov dx, word ptr [bp - 4]
4:2EDF  c9                   leave
4:2EE0  ca0400               retf 4
4:2EE3  db 00

; ---------------- ListModel04::onNotify@s4:2EE4 FAR size=114 callers=0
;   (vslot 16) refreshes
4:2EE4  c8040000             enter 4, 0
4:2EE8  57                   push di
4:2EE9  56                   push si
4:2EEA  8b460a               mov ax, word ptr [bp + 0xa]
4:2EED  eb4d                 jmp 0x2f3c
4:2EEF  db 90
loc_2EF0:
4:2EF0  c45e06               les bx, ptr [bp + 6]
4:2EF3  26c49f6201           les bx, ptr es:[bx + 0x162]
4:2EF8  66268b4724           mov eax, dword ptr es:[bx + 0x24]
4:2EFD  c45e06               les bx, ptr [bp + 6]
4:2F00  662689875a01         mov dword ptr es:[bx + 0x15a], eax
loc_2F06:
4:2F06  8b4606               mov ax, word ptr [bp + 6]
4:2F09  8b5608               mov dx, word ptr [bp + 8]
4:2F0C  2d2000               sub ax, 0x20
4:2F0F  52                   push dx
4:2F10  50                   push ax
4:2F11  8bf0                 mov si, ax
4:2F13  8bfa                 mov di, dx
4:2F15  90                   nop
4:2F16  0e                   push cs
4:2F17  e8e002               call 0x31fa  ; ListModel04::refresh@s4:31FA
4:2F1A  ff760a               push word ptr [bp + 0xa]
4:2F1D  57                   push di
4:2F1E  56                   push si
4:2F1F  9a621fb12c           lcall 0x2cb1, 0x1f62  ; RegObj::notify@s3:1F62
4:2F24  5e                   pop si
4:2F25  5f                   pop di
4:2F26  c9                   leave
4:2F27  ca0600               retf 6
loc_2F2A:
4:2F2A  c45e06               les bx, ptr [bp + 6]
4:2F2D  662bc0               sub eax, eax
4:2F30  662689876201         mov dword ptr es:[bx + 0x162], eax
4:2F36  5e                   pop si
4:2F37  5f                   pop di
4:2F38  c9                   leave
4:2F39  ca0600               retf 6
loc_2F3C:
4:2F3C  3d1200               cmp ax, 0x12
4:2F3F  74af                 je 0x2ef0
4:2F41  770c                 ja 0x2f4f
4:2F43  fec8                 dec al
4:2F45  74e3                 je 0x2f2a
4:2F47  2c03                 sub al, 3
4:2F49  7c04                 jl 0x2f4f
4:2F4B  2c02                 sub al, 2
4:2F4D  7eb7                 jle 0x2f06
loc_2F4F:
4:2F4F  5e                   pop si
4:2F50  5f                   pop di
4:2F51  c9                   leave
4:2F52  ca0600               retf 6
4:2F55  db 00

; ---------------- ListModel04::frameRect@s4:2F56 FAR size=146 callers=0
;   apis: USER.GetSystemMetrics
;   (vslot 8)
4:2F56  c8200000             enter 0x20, 0
4:2F5A  56                   push si
4:2F5B  8d46fe               lea ax, [bp - 2]
4:2F5E  16                   push ss
4:2F5F  50                   push ax
4:2F60  8d46fc               lea ax, [bp - 4]
4:2F63  16                   push ss
4:2F64  50                   push ax
4:2F65  6a48                 push 0x48
4:2F67  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:2F6C  9aba20222f           lcall 0x2f22, 0x20ba  ; Registry_get@s3:20BA
4:2F71  8946f8               mov word ptr [bp - 8], ax
4:2F74  8956fa               mov word ptr [bp - 6], dx
4:2F77  050e00               add ax, 0xe
4:2F7A  52                   push dx
4:2F7B  50                   push ax
4:2F7C  9a943e8c2f           lcall 0x2f8c, 0x3e94  ; Pos3::getXY@s2:3E94
4:2F81  c45e06               les bx, ptr [bp + 6]
4:2F84  6626ff7724           push dword ptr es:[bx + 0x24]
4:2F89  9a7247c02e           lcall 0x2ec0, 0x4772  ; DIB::rect@s2:4772
4:2F8E  8946f4               mov word ptr [bp - 0xc], ax
4:2F91  8956f6               mov word ptr [bp - 0xa], dx
4:2F94  8b46fe               mov ax, word ptr [bp - 2]
4:2F97  05b500               add ax, 0xb5
4:2F9A  c45e06               les bx, ptr [bp + 6]
4:2F9D  26894718             mov word ptr es:[bx + 0x18], ax
4:2FA1  8b46fc               mov ax, word ptr [bp - 4]
4:2FA4  050900               add ax, 9
4:2FA7  2689471a             mov word ptr es:[bx + 0x1a], ax
4:2FAB  6a05                 push 5
4:2FAD  9ac52f0000           lcall 0, 0x2fc5  ; USER.GetSystemMetrics
4:2FB2  03c0                 add ax, ax
4:2FB4  c45ef4               les bx, ptr [bp - 0xc]
4:2FB7  26034704             add ax, word ptr es:[bx + 4]
4:2FBB  c45e06               les bx, ptr [bp + 6]
4:2FBE  2689471c             mov word ptr es:[bx + 0x1c], ax
4:2FC2  6a04                 push 4
4:2FC4  9ace2f0000           lcall 0, 0x2fce  ; USER.GetSystemMetrics
4:2FC9  6a06                 push 6
4:2FCB  8bf0                 mov si, ax
4:2FCD  9aa71e0000           lcall 0, 0x1ea7  ; USER.GetSystemMetrics
4:2FD2  c45ef4               les bx, ptr [bp - 0xc]
4:2FD5  26037708             add si, word ptr es:[bx + 8]
4:2FD9  03c6                 add ax, si
4:2FDB  c45e06               les bx, ptr [bp + 6]
4:2FDE  2689471e             mov word ptr es:[bx + 0x1e], ax
4:2FE2  5e                   pop si
4:2FE3  c9                   leave
4:2FE4  ca0400               retf 4
4:2FE7  db 00

; ---------------- ListModel04::find@s4:2FE8 FAR size=226 callers=1
;   entry by name
4:2FE8  c8140000             enter 0x14, 0
4:2FEC  c45e06               les bx, ptr [bp + 6]
4:2FEF  268b877401           mov ax, word ptr es:[bx + 0x174]
4:2FF4  8946fe               mov word ptr [bp - 2], ax
4:2FF7  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:2FFC  268b470a             mov ax, word ptr es:[bx + 0xa]
4:3000  8946fc               mov word ptr [bp - 4], ax
4:3003  0bc0                 or ax, ax
4:3005  7507                 jne 0x300e
loc_3007:
4:3007  33c0                 xor ax, ax
4:3009  c9                   leave
4:300A  ca0400               retf 4
4:300D  db 90
loc_300E:
4:300E  c45e06               les bx, ptr [bp + 6]
4:3011  662683bf860100       cmp dword ptr es:[bx + 0x186], 0
4:3018  74ed                 je 0x3007
4:301A  6626ffb78601         push dword ptr es:[bx + 0x186]
4:3020  9aa43d8430           lcall 0x3084, 0x3da4  ; _fstrlen@s1:3DA4
4:3025  83c404               add sp, 4
4:3028  8946f6               mov word ptr [bp - 0xa], ax
4:302B  c45e06               les bx, ptr [bp + 6]
4:302E  26c78774010000       mov word ptr es:[bx + 0x174], 0
4:3035  eb09                 jmp 0x3040
4:3037  db 90
loc_3038:
4:3038  c45e06               les bx, ptr [bp + 6]
4:303B  26ff877401           inc word ptr es:[bx + 0x174]
loc_3040:
4:3040  8b46fc               mov ax, word ptr [bp - 4]
4:3043  c45e06               les bx, ptr [bp + 6]
4:3046  2639877401           cmp word ptr es:[bx + 0x174], ax
4:304B  7d40                 jge 0x308d
4:304D  66260fbf877401       movsx eax, word ptr es:[bx + 0x174]
4:3054  6650                 push eax
4:3056  6626ffb77e01         push dword ptr es:[bx + 0x17e]
4:305C  9ac48f7f2f           lcall 0x2f7f, 0x8fc4  ; PtrArray::get@s2:8FC4
4:3061  66ff7606             push dword ptr [bp + 6]
4:3065  90                   nop
4:3066  0e                   push cs
4:3067  e8befd               call 0x2e28  ; ListModel04::current@s4:2E28
4:306A  50                   push ax
4:306B  9a80bd942d           lcall 0x2d94, 0xbd80  ; buildingName@s5:BD80
4:3070  83c402               add sp, 2
4:3073  ff76f6               push word ptr [bp - 0xa]
4:3076  c45e06               les bx, ptr [bp + 6]
4:3079  6626ffb78601         push dword ptr es:[bx + 0x186]
4:307F  52                   push dx
4:3080  50                   push ax
4:3081  9ae83dc52c           lcall 0x2cc5, 0x3de8  ; _fstrncmp?@s1:3DE8
4:3086  83c40a               add sp, 0xa
4:3089  0bc0                 or ax, ax
4:308B  75ab                 jne 0x3038
loc_308D:
4:308D  8b46fc               mov ax, word ptr [bp - 4]
4:3090  c45e06               les bx, ptr [bp + 6]
4:3093  2639877401           cmp word ptr es:[bx + 0x174], ax
4:3098  7c1a                 jl 0x30b4
4:309A  8b46fe               mov ax, word ptr [bp - 2]
4:309D  2689877401           mov word ptr es:[bx + 0x174], ax
4:30A2  06                   push es
4:30A3  53                   push bx
4:30A4  90                   nop
4:30A5  0e                   push cs
4:30A6  e87ffd               call 0x2e28  ; ListModel04::current@s4:2E28
4:30A9  c45e06               les bx, ptr [bp + 6]
4:30AC  2689877601           mov word ptr es:[bx + 0x176], ax
4:30B1  e953ff               jmp 0x3007
loc_30B4:
4:30B4  06                   push es
4:30B5  53                   push bx
4:30B6  90                   nop
4:30B7  0e                   push cs
4:30B8  e86dfd               call 0x2e28  ; ListModel04::current@s4:2E28
4:30BB  c45e06               les bx, ptr [bp + 6]
4:30BE  2689877601           mov word ptr es:[bx + 0x176], ax
4:30C3  b80100               mov ax, 1
4:30C6  c9                   leave
4:30C7  ca0400               retf 4

; ---------------- ListModel04::setFilter@s4:30CA FAR size=50 callers=1
;   the filter string (+0x186)
4:30CA  c8080000             enter 8, 0
4:30CE  c45e06               les bx, ptr [bp + 6]
4:30D1  66268b878601         mov eax, dword ptr es:[bx + 0x186]
4:30D7  6650                 push eax
4:30D9  9ace172330           lcall 0x3023, 0x17ce  ; operator_delete@s1:17CE
4:30DE  83c404               add sp, 4
4:30E1  66ff760a             push dword ptr [bp + 0xa]
4:30E5  9ae8605f30           lcall 0x305f, 0x60e8  ; _strdup@s2:60E8
4:30EA  c45e06               les bx, ptr [bp + 6]
4:30ED  2689878601           mov word ptr es:[bx + 0x186], ax
4:30F2  2689978801           mov word ptr es:[bx + 0x188], dx
4:30F7  c9                   leave
4:30F8  ca0800               retf 8
4:30FB  db 00

; ---------------- ListModel04::rebuild@s4:30FC FAR size=212 callers=1
;   rebuilds the entries
4:30FC  c8160000             enter 0x16, 0
4:3100  56                   push si
4:3101  c45e0a               les bx, ptr [bp + 0xa]
4:3104  6626c70700000000     mov dword ptr es:[bx], 0
4:310C  c45e06               les bx, ptr [bp + 6]
4:310F  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:3114  268b470a             mov ax, word ptr es:[bx + 0xa]
4:3118  8946fe               mov word ptr [bp - 2], ax
4:311B  0bc0                 or ax, ax
4:311D  0f84a900             je 0x31ca
4:3121  6a06                 push 6
4:3123  9a9c176431           lcall 0x3164, 0x179c  ; operator_new@s1:179C
4:3128  83c402               add sp, 2
4:312B  8946f0               mov word ptr [bp - 0x10], ax
4:312E  8956f2               mov word ptr [bp - 0xe], dx
4:3131  0bd0                 or dx, ax
4:3133  741b                 je 0x3150
4:3135  c45ef0               les bx, ptr [bp - 0x10]
4:3138  662bc0               sub eax, eax
4:313B  66268907             mov dword ptr es:[bx], eax
4:313F  26894704             mov word ptr es:[bx + 4], ax
4:3143  668b46f0             mov eax, dword ptr [bp - 0x10]
4:3147  c45e0a               les bx, ptr [bp + 0xa]
4:314A  66268907             mov dword ptr es:[bx], eax
4:314E  eb0b                 jmp 0x315b
loc_3150:
4:3150  c45e0a               les bx, ptr [bp + 0xa]
4:3153  6626c70700000000     mov dword ptr es:[bx], 0
loc_315B:
4:315B  8b46fe               mov ax, word ptr [bp - 2]
4:315E  03c0                 add ax, ax
4:3160  50                   push ax
4:3161  9a9c17dc30           lcall 0x30dc, 0x179c  ; operator_new@s1:179C
4:3166  83c402               add sp, 2
4:3169  c45e0a               les bx, ptr [bp + 0xa]
4:316C  26c41f               les bx, ptr es:[bx]
4:316F  268907               mov word ptr es:[bx], ax
4:3172  26895702             mov word ptr es:[bx + 2], dx
4:3176  8b46fe               mov ax, word ptr [bp - 2]
4:3179  c45e0a               les bx, ptr [bp + 0xa]
4:317C  26c41f               les bx, ptr es:[bx]
4:317F  26894704             mov word ptr es:[bx + 4], ax
4:3183  c746fc0000           mov word ptr [bp - 4], 0
4:3188  eb03                 jmp 0x318d
loc_318A:
4:318A  ff46fc               inc word ptr [bp - 4]
loc_318D:
4:318D  8b46fe               mov ax, word ptr [bp - 2]
4:3190  3946fc               cmp word ptr [bp - 4], ax
4:3193  7d35                 jge 0x31ca
4:3195  660fbf46fc           movsx eax, word ptr [bp - 4]
4:319A  6650                 push eax
4:319C  c45e06               les bx, ptr [bp + 6]
4:319F  6626ffb77e01         push dword ptr es:[bx + 0x17e]
4:31A5  9ac48fe830           lcall 0x30e8, 0x8fc4  ; PtrArray::get@s2:8FC4
4:31AA  8946f4               mov word ptr [bp - 0xc], ax
4:31AD  8956f6               mov word ptr [bp - 0xa], dx
4:31B0  c45ef4               les bx, ptr [bp - 0xc]
4:31B3  268b472e             mov ax, word ptr es:[bx + 0x2e]
4:31B7  c45e0a               les bx, ptr [bp + 0xa]
4:31BA  26c41f               les bx, ptr es:[bx]
4:31BD  26c41f               les bx, ptr es:[bx]
4:31C0  8b76fc               mov si, word ptr [bp - 4]
4:31C3  03f6                 add si, si
4:31C5  268900               mov word ptr es:[bx + si], ax
4:31C8  ebc0                 jmp 0x318a
loc_31CA:
4:31CA  5e                   pop si
4:31CB  c9                   leave
4:31CC  ca0800               retf 8
4:31CF  db 00

; ---------------- ListModel04::hasEntries@s4:31D0 FAR size=42 callers=2
;   whether the list has entries
4:31D0  c8080000             enter 8, 0
4:31D4  c45e06               les bx, ptr [bp + 6]
4:31D7  662683bf7e0100       cmp dword ptr es:[bx + 0x17e], 0
4:31DE  7414                 je 0x31f4
4:31E0  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:31E5  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
4:31EB  7407                 je 0x31f4
4:31ED  b80100               mov ax, 1
4:31F0  c9                   leave
4:31F1  ca0400               retf 4
loc_31F4:
4:31F4  33c0                 xor ax, ax
4:31F6  c9                   leave
4:31F7  ca0400               retf 4

; ---------------- ListModel04::refresh@s4:31FA FAR size=172 callers=1
;   refreshes the current entry
4:31FA  c80c0000             enter 0xc, 0
4:31FE  c45e06               les bx, ptr [bp + 6]
4:3201  6626ffb77a01         push dword ptr es:[bx + 0x17a]
4:3207  66ff364857           push dword ptr [0x5748]  ; g_sim
4:320C  9af0827c2e           lcall 0x2e7c, 0x82f0  ; Sim::stepAt@s7:82F0
4:3211  c45e06               les bx, ptr [bp + 6]
4:3214  2689877e01           mov word ptr es:[bx + 0x17e], ax
4:3219  2689978001           mov word ptr es:[bx + 0x180], dx
4:321E  8bc2                 mov ax, dx
4:3220  260b877e01           or ax, word ptr es:[bx + 0x17e]
4:3225  747a                 je 0x32a1
4:3227  c45e06               les bx, ptr [bp + 6]
4:322A  26c49f7e01           les bx, ptr es:[bx + 0x17e]
4:322F  268b470a             mov ax, word ptr es:[bx + 0xa]
4:3233  8946fe               mov word ptr [bp - 2], ax
4:3236  0bc0                 or ax, ax
4:3238  7467                 je 0x32a1
4:323A  c45e06               les bx, ptr [bp + 6]
4:323D  26c78774010000       mov word ptr es:[bx + 0x174], 0
4:3244  eb05                 jmp 0x324b
loc_3246:
4:3246  26ff877401           inc word ptr es:[bx + 0x174]
loc_324B:
4:324B  8b46fe               mov ax, word ptr [bp - 2]
4:324E  c45e06               les bx, ptr [bp + 6]
4:3251  2639877401           cmp word ptr es:[bx + 0x174], ax
4:3256  7d27                 jge 0x327f
4:3258  66260fbf877401       movsx eax, word ptr es:[bx + 0x174]
4:325F  6650                 push eax
4:3261  6626ffb77e01         push dword ptr es:[bx + 0x17e]
4:3267  9ac48fa831           lcall 0x31a8, 0x8fc4  ; PtrArray::get@s2:8FC4
4:326C  66ff7606             push dword ptr [bp + 6]
4:3270  90                   nop
4:3271  0e                   push cs
4:3272  e8b3fb               call 0x2e28  ; ListModel04::current@s4:2E28
4:3275  c45e06               les bx, ptr [bp + 6]
4:3278  2639877601           cmp word ptr es:[bx + 0x176], ax
4:327D  75c7                 jne 0x3246
loc_327F:
4:327F  8b46fe               mov ax, word ptr [bp - 2]
4:3282  2639877401           cmp word ptr es:[bx + 0x174], ax
4:3287  7c07                 jl 0x3290
4:3289  26c78774010000       mov word ptr es:[bx + 0x174], 0
loc_3290:
4:3290  66ff7606             push dword ptr [bp + 6]
4:3294  90                   nop
4:3295  0e                   push cs
4:3296  e88ffb               call 0x2e28  ; ListModel04::current@s4:2E28
4:3299  c45e06               les bx, ptr [bp + 6]
4:329C  2689877601           mov word ptr es:[bx + 0x176], ax
loc_32A1:
4:32A1  c9                   leave
4:32A2  ca0400               retf 4
4:32A5  db 00

; ---------------- ListModel04::thunk_dtor@s4:32A6 FAR size=12 callers=0
;   this-adjusting thunk
4:32A6  8bdc                 mov bx, sp
4:32A8  36836f0420           sub word ptr ss:[bx + 4], 0x20
4:32AD  e90200               jmp 0x32b2
4:32B0  db 90 90

; ---------------- ListModel04::scalar_dtor@s4:32B2 FAR size=106 callers=0
;   deleting destructor
4:32B2  55                   push bp
4:32B3  8bec                 mov bp, sp
4:32B5  66ff7606             push dword ptr [bp + 6]
4:32B9  90                   nop
4:32BA  0e                   push cs
4:32BB  e8a2f9               call 0x2c60  ; ListModel04::~ListModel04@s4:2C60
4:32BE  f6460a01             test byte ptr [bp + 0xa], 1
4:32C2  7409                 je 0x32cd
4:32C4  66ff7606             push dword ptr [bp + 6]
4:32C8  9ace172631           lcall 0x3126, 0x17ce  ; operator_delete@s1:17CE
loc_32CD:
4:32CD  8b4606               mov ax, word ptr [bp + 6]
4:32D0  8b5608               mov dx, word ptr [bp + 8]
4:32D3  c9                   leave
4:32D4  ca0600               retf 6
4:32D7  db 90 b2 32 ee 32 f2 1d e2 32 ce 1d e6 32 d4 1d ea
4:32E7  db 32 a0 49 f6 32 2c 4c f2 32 78 4b fa 32 b0 49 fe
4:32F7  db 32 56 2f 71 2c c0 49 02 33 ce 49 06 33 e0 49 0a
4:3307  db 33 ee 49 0e 33 00 4a 12 33 12 4a 6f 2f a6 32 1a
4:3317  db 33 e4 2e da 32

; ---------------- TradeMarket::TradeMarket@s4:331C FAR size=152 callers=1
;   registry 0x3C: the trade market (draws registry 0x3B, random prices)
4:331C  55                   push bp
4:331D  8bec                 mov bp, sp
4:331F  66ff7608             push dword ptr [bp + 8]
4:3323  ff7606               push word ptr [bp + 6]
4:3326  9a5acaa133           lcall 0x33a1, 0xca5a  ; TradeLists::TradeLists@s2:CA5A
4:332B  c45e06               les bx, ptr [bp + 6]
4:332E  662bc0               sub eax, eax
4:3331  662689872201         mov dword ptr es:[bx + 0x122], eax
4:3337  662689872601         mov dword ptr es:[bx + 0x126], eax
4:333D  662689872a01         mov dword ptr es:[bx + 0x12a], eax
4:3343  2689872e01           mov word ptr es:[bx + 0x12e], ax
4:3348  2689873001           mov word ptr es:[bx + 0x130], ax
4:334D  662689873201         mov dword ptr es:[bx + 0x132], eax
4:3353  662689873601         mov dword ptr es:[bx + 0x136], eax
4:3359  2689873a01           mov word ptr es:[bx + 0x13a], ax
4:335E  2689873c01           mov word ptr es:[bx + 0x13c], ax
4:3363  662689873e01         mov dword ptr es:[bx + 0x13e], eax
4:3369  662689874201         mov dword ptr es:[bx + 0x142], eax
4:336F  26c7070c47           mov word ptr es:[bx], 0x470c
4:3374  26c747021633         mov word ptr es:[bx + 2], 0x3316  ; SEGMENT s4:0000
4:337A  6a3b                 push 0x3b
4:337C  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:3381  9aba20de32           lcall 0x32de, 0x20ba  ; Registry_get@s3:20BA
4:3386  c45e06               les bx, ptr [bp + 6]
4:3389  2689872201           mov word ptr es:[bx + 0x122], ax
4:338E  2689972401           mov word ptr es:[bx + 0x124], dx
4:3393  26c6472200           mov byte ptr es:[bx + 0x22], 0
4:3398  666808000c00         push 0xc0008
4:339E  9a2e616a32           lcall 0x326a, 0x612e  ; random@s2:612E
4:33A3  c45e06               les bx, ptr [bp + 6]
4:33A6  2689873c01           mov word ptr es:[bx + 0x13c], ax
4:33AB  8bc3                 mov ax, bx
4:33AD  8cc2                 mov dx, es
4:33AF  c9                   leave
4:33B0  ca0600               retf 6
4:33B3  db 00

; ---------------- TradeMarket::~TradeMarket@s4:33B4 FAR size=112 callers=1
;   dtor
4:33B4  c8100000             enter 0x10, 0
4:33B8  56                   push si
4:33B9  c45e06               les bx, ptr [bp + 6]
4:33BC  26c7070c47           mov word ptr es:[bx], 0x470c
4:33C1  26c747027833         mov word ptr es:[bx + 2], 0x3378  ; SEGMENT s4:0000
4:33C7  268b873601           mov ax, word ptr es:[bx + 0x136]
4:33CC  268b973801           mov dx, word ptr es:[bx + 0x138]
4:33D1  8bda                 mov bx, dx
4:33D3  0bd0                 or dx, ax
4:33D5  740e                 je 0x33e5
4:33D7  6a01                 push 1
4:33D9  53                   push bx
4:33DA  50                   push ax
4:33DB  8ec3                 mov es, bx
4:33DD  8bf0                 mov si, ax
4:33DF  26c41c               les bx, ptr es:[si]
4:33E2  26ff1f               lcall es:[bx]
loc_33E5:
4:33E5  c45e06               les bx, ptr [bp + 6]
4:33E8  6626c787360100000000 mov dword ptr es:[bx + 0x136], 0
4:33F2  66268b872601         mov eax, dword ptr es:[bx + 0x126]
4:33F8  6650                 push eax
4:33FA  9ace171034           lcall 0x3410, 0x17ce  ; operator_delete@s1:17CE
4:33FF  83c404               add sp, 4
4:3402  c45e06               les bx, ptr [bp + 6]
4:3405  66268b872a01         mov eax, dword ptr es:[bx + 0x12a]
4:340B  6650                 push eax
4:340D  9ace17cb32           lcall 0x32cb, 0x17ce  ; operator_delete@s1:17CE
4:3412  83c404               add sp, 4
4:3415  66ff7606             push dword ptr [bp + 6]
4:3419  9aa0ca2933           lcall 0x3329, 0xcaa0  ; TradeLists::~TradeLists@s2:CAA0
4:341E  5e                   pop si
4:341F  c9                   leave
4:3420  ca0400               retf 4
4:3423  db 00

; ---------------- TradeMarket::colonyPopulation@s4:3424 FAR size=130 callers=1
;   a colony by name, its population
4:3424  c8200000             enter 0x20, 0
4:3428  c45e06               les bx, ptr [bp + 6]
4:342B  6626ffb72601         push dword ptr es:[bx + 0x126]
4:3431  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3437  9a52e85434           lcall 0x3454, 0xe852  ; colonyByName@s2:E852
4:343C  8946fc               mov word ptr [bp - 4], ax
4:343F  8956fe               mov word ptr [bp - 2], dx
4:3442  c45e06               les bx, ptr [bp + 6]
4:3445  6626ffb72a01         push dword ptr es:[bx + 0x12a]
4:344B  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3451  9a52e81c34           lcall 0x341c, 0xe852  ; colonyByName@s2:E852
4:3456  8946f8               mov word ptr [bp - 8], ax
4:3459  8956fa               mov word ptr [bp - 6], dx
4:345C  66ff76fc             push dword ptr [bp - 4]
4:3460  66ff364857           push dword ptr [0x5748]  ; g_sim
4:3465  9a44837c34           lcall 0x347c, 0x8344  ; Sim::resolve@s7:8344
4:346A  8946f4               mov word ptr [bp - 0xc], ax
4:346D  8956f6               mov word ptr [bp - 0xa], dx
4:3470  66ff76f8             push dword ptr [bp - 8]
4:3474  66ff364857           push dword ptr [0x5748]  ; g_sim
4:3479  9a44830f32           lcall 0x320f, 0x8344  ; Sim::resolve@s7:8344
4:347E  8946f0               mov word ptr [bp - 0x10], ax
4:3481  8956f2               mov word ptr [bp - 0xe], dx
4:3484  c45ef4               les bx, ptr [bp - 0xc]
4:3487  66268b870002         mov eax, dword ptr es:[bx + 0x200]
4:348D  c45ef0               les bx, ptr [bp - 0x10]
4:3490  662639870002         cmp dword ptr es:[bx + 0x200], eax
4:3496  7508                 jne 0x34a0
4:3498  b80100               mov ax, 1
4:349B  c9                   leave
4:349C  ca0400               retf 4
4:349F  db 90
loc_34A0:
4:34A0  33c0                 xor ax, ax
4:34A2  c9                   leave
4:34A3  ca0400               retf 4

; ---------------- TradeMarket::endTurn@s4:34A6 FAR size=16 callers=1
;   SCEndSim: the price swing moves (s4:3D6C)
4:34A6  55                   push bp
4:34A7  8bec                 mov bp, sp
4:34A9  66ff7606             push dword ptr [bp + 6]
4:34AD  90                   nop
4:34AE  0e                   push cs
4:34AF  e8ba08               call 0x3d6c  ; TradeMarket::swingPrices@s4:3D6C
4:34B2  c9                   leave
4:34B3  ca0400               retf 4

; ---------------- TradeMarket::offerText@s4:34B6 FAR size=250 callers=1
;   apis: USER._wsprintf
;   "%ld %s" of an offer
4:34B6  c80c0000             enter 0xc, 0
4:34BA  c45e06               les bx, ptr [bp + 6]
4:34BD  26ffb72e01           push word ptr es:[bx + 0x12e]
4:34C2  06                   push es
4:34C3  53                   push bx
4:34C4  90                   nop
4:34C5  0e                   push cs
4:34C6  e8d506               call 0x3b9e  ; TradeMarket::pageList@s4:3B9E
4:34C9  8946fc               mov word ptr [bp - 4], ax
4:34CC  8956fe               mov word ptr [bp - 2], dx
4:34CF  668b4606             mov eax, dword ptr [bp + 6]
4:34D3  8b5608               mov dx, word ptr [bp + 8]
4:34D6  052200               add ax, 0x22
4:34D9  668946f8             mov dword ptr [bp - 8], eax
4:34DD  c45e06               les bx, ptr [bp + 6]
4:34E0  268b872e01           mov ax, word ptr es:[bx + 0x12e]
4:34E5  2d8801               sub ax, 0x188
4:34E8  740c                 je 0x34f6
4:34EA  2d0300               sub ax, 3
4:34ED  7475                 je 0x3564
4:34EF  48                   dec ax
4:34F0  7446                 je 0x3538
4:34F2  e99b00               jmp 0x3590
4:34F5  db 90
loc_34F6:
4:34F6  26ffb73001           push word ptr es:[bx + 0x130]
4:34FB  66ff76fc             push dword ptr [bp - 4]
4:34FF  9af0574435           lcall 0x3544, 0x57f0  ; List::countItems@s2:57F0
4:3504  8946f4               mov word ptr [bp - 0xc], ax
4:3507  8956f6               mov word ptr [bp - 0xa], dx
4:350A  c45ef4               les bx, ptr [bp - 0xc]
4:350D  26ff770e             push word ptr es:[bx + 0xe]
4:3511  9ad8c06e30           lcall 0x306e, 0xc0d8  ; ResourceName@s5:C0D8
4:3516  83c402               add sp, 2
4:3519  52                   push dx
4:351A  50                   push ax
4:351B  c45e06               les bx, ptr [bp + 6]
4:351E  6626ffb73201         push dword ptr es:[bx + 0x132]
4:3524  1e                   push ds
4:3525  685041               push 0x4150  ; '%ld %s'
loc_3528:
4:3528  8d4722               lea ax, [bx + 0x22]
4:352B  06                   push es
4:352C  50                   push ax
4:352D  9affff0000           lcall 0, 0xffff  ; USER._wsprintf
4:3532  83c410               add sp, 0x10
4:3535  eb6e                 jmp 0x35a5
4:3537  db 90
loc_3538:
4:3538  26ffb73001           push word ptr es:[bx + 0x130]
4:353D  66ff76fc             push dword ptr [bp - 4]
4:3541  9af0577035           lcall 0x3570, 0x57f0  ; List::countItems@s2:57F0
4:3546  8946f4               mov word ptr [bp - 0xc], ax
4:3549  8956f6               mov word ptr [bp - 0xa], dx
4:354C  c45ef4               les bx, ptr [bp - 0xc]
4:354F  6626ff7704           push dword ptr es:[bx + 4]
4:3554  c45e06               les bx, ptr [bp + 6]
4:3557  6626ffb73201         push dword ptr es:[bx + 0x132]
4:355D  1e                   push ds
4:355E  685741               push 0x4157  ; '%ld %s'
4:3561  ebc5                 jmp 0x3528
4:3563  db 90
loc_3564:
4:3564  26ffb73001           push word ptr es:[bx + 0x130]
4:3569  66ff76fc             push dword ptr [bp - 4]
4:356D  9af0573a34           lcall 0x343a, 0x57f0  ; List::countItems@s2:57F0
4:3572  8946f4               mov word ptr [bp - 0xc], ax
4:3575  8956f6               mov word ptr [bp - 0xa], dx
4:3578  c45ef4               les bx, ptr [bp - 0xc]
4:357B  6626ff7704           push dword ptr es:[bx + 4]
4:3580  c45e06               les bx, ptr [bp + 6]
4:3583  6626ffb73201         push dword ptr es:[bx + 0x132]
4:3589  1e                   push ds
4:358A  685e41               push 0x415e  ; '%ld %s'
4:358D  eb99                 jmp 0x3528
4:358F  db 90
loc_3590:
4:3590  682404               push 0x424
4:3593  8d4722               lea ax, [bx + 0x22]
4:3596  52                   push dx
4:3597  50                   push ax
4:3598  680001               push 0x100
4:359B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:35A0  9ae0848433           lcall 0x3384, 0x84e0  ; LoadStringTo@s3:84E0
loc_35A5:
4:35A5  8b46f8               mov ax, word ptr [bp - 8]
4:35A8  8b56fa               mov dx, word ptr [bp - 6]
4:35AB  c9                   leave
4:35AC  ca0400               retf 4
4:35AF  db 00

; ---------------- TradeMarket::priceText@s4:35B0 FAR size=310 callers=1
;   apis: USER._wsprintf
;   the price of an offer
4:35B0  c81a0000             enter 0x1a, 0
4:35B4  57                   push di
4:35B5  56                   push si
4:35B6  66ff364857           push dword ptr [0x5748]  ; g_sim
4:35BB  9a26836834           lcall 0x3468, 0x8326  ; Sim::getTurnNumber@s7:8326
4:35C0  8946fc               mov word ptr [bp - 4], ax
4:35C3  8956fe               mov word ptr [bp - 2], dx
4:35C6  c45e06               les bx, ptr [bp + 6]
4:35C9  2639974001           cmp word ptr es:[bx + 0x140], dx
4:35CE  7212                 jb 0x35e2
4:35D0  7707                 ja 0x35d9
4:35D2  2639873e01           cmp word ptr es:[bx + 0x13e], ax
4:35D7  7209                 jb 0x35e2
loc_35D9:
4:35D9  33c0                 xor ax, ax
4:35DB  99                   cdq
4:35DC  5e                   pop si
4:35DD  5f                   pop di
4:35DE  c9                   leave
4:35DF  ca0400               retf 4
loc_35E2:
4:35E2  268b873c01           mov ax, word ptr es:[bx + 0x13c]
4:35E7  2639873a01           cmp word ptr es:[bx + 0x13a], ax
4:35EC  7c2c                 jl 0x361a
4:35EE  8b46fc               mov ax, word ptr [bp - 4]
4:35F1  2689873e01           mov word ptr es:[bx + 0x13e], ax
4:35F6  2689974001           mov word ptr es:[bx + 0x140], dx
4:35FB  26c7873a010000       mov word ptr es:[bx + 0x13a], 0
4:3602  666808000c00         push 0xc0008
4:3608  9a2e610235           lcall 0x3502, 0x612e  ; random@s2:612E
4:360D  83c404               add sp, 4
4:3610  c45e06               les bx, ptr [bp + 6]
4:3613  2689873c01           mov word ptr es:[bx + 0x13c], ax
4:3618  ebbf                 jmp 0x35d9
loc_361A:
4:361A  26ffb72e01           push word ptr es:[bx + 0x12e]
4:361F  06                   push es
4:3620  53                   push bx
4:3621  90                   nop
4:3622  0e                   push cs
4:3623  e87805               call 0x3b9e  ; TradeMarket::pageList@s4:3B9E
4:3626  8946f8               mov word ptr [bp - 8], ax
4:3629  8956fa               mov word ptr [bp - 6], dx
4:362C  66ff7606             push dword ptr [bp + 6]
4:3630  90                   nop
4:3631  0e                   push cs
4:3632  e8470c               call 0x427c  ; TradeMarket::unitPrice@s4:427C
4:3635  8946f4               mov word ptr [bp - 0xc], ax
4:3638  8956f6               mov word ptr [bp - 0xa], dx
4:363B  8d46f2               lea ax, [bp - 0xe]
4:363E  16                   push ss
4:363F  50                   push ax
4:3640  8d46f0               lea ax, [bp - 0x10]
4:3643  16                   push ss
4:3644  50                   push ax
4:3645  66ff7606             push dword ptr [bp + 6]
4:3649  90                   nop
4:364A  0e                   push cs
4:364B  e83e08               call 0x3e8c  ; TradeMarket::defaultQuantity@s4:3E8C
4:364E  660fbf46f0           movsx eax, word ptr [bp - 0x10]
4:3653  663b46f4             cmp eax, dword ptr [bp - 0xc]
4:3657  7e03                 jle 0x365c
4:3659  8b46f4               mov ax, word ptr [bp - 0xc]
loc_365C:
4:365C  8946ee               mov word ptr [bp - 0x12], ax
4:365F  c45e06               les bx, ptr [bp + 6]
4:3662  66268b873601         mov eax, dword ptr es:[bx + 0x136]
4:3668  268b973801           mov dx, word ptr es:[bx + 0x138]
4:366D  668946e6             mov dword ptr [bp - 0x1a], eax
4:3671  668946ea             mov dword ptr [bp - 0x16], eax
4:3675  8bda                 mov bx, dx
4:3677  0bd0                 or dx, ax
4:3679  740e                 je 0x3689
4:367B  6a01                 push 1
4:367D  53                   push bx
4:367E  50                   push ax
4:367F  8ec3                 mov es, bx
4:3681  8bf0                 mov si, ax
4:3683  26c41c               les bx, ptr es:[si]
4:3686  26ff1f               lcall es:[bx]
loc_3689:
4:3689  ff76f2               push word ptr [bp - 0xe]
4:368C  ff76ee               push word ptr [bp - 0x12]
4:368F  66ff76f4             push dword ptr [bp - 0xc]
4:3693  66ff7606             push dword ptr [bp + 6]
4:3697  90                   nop
4:3698  0e                   push cs
4:3699  e8c20c               call 0x435e  ; TradeMarket::pickOffer@s4:435E
4:369C  c45e06               les bx, ptr [bp + 6]
4:369F  2689873601           mov word ptr es:[bx + 0x136], ax
4:36A4  2689973801           mov word ptr es:[bx + 0x138], dx
4:36A9  c45e06               les bx, ptr [bp + 6]
4:36AC  26ff873a01           inc word ptr es:[bx + 0x13a]
4:36B1  26c49f3601           les bx, ptr es:[bx + 0x136]
4:36B6  6626ff7704           push dword ptr es:[bx + 4]
4:36BB  6626ff7708           push dword ptr es:[bx + 8]
4:36C0  1e                   push ds
4:36C1  686541               push 0x4165  ; '%ld %s'
4:36C4  8b4606               mov ax, word ptr [bp + 6]
4:36C7  8b5608               mov dx, word ptr [bp + 8]
4:36CA  052200               add ax, 0x22
4:36CD  52                   push dx
4:36CE  50                   push ax
4:36CF  8bf0                 mov si, ax
4:36D1  8bfa                 mov di, dx
4:36D3  9a2e350000           lcall 0, 0x352e  ; USER._wsprintf
4:36D8  83c410               add sp, 0x10
4:36DB  8bc6                 mov ax, si
4:36DD  8bd7                 mov dx, di
4:36DF  5e                   pop si
4:36E0  5f                   pop di
4:36E1  c9                   leave
4:36E2  ca0400               retf 4
4:36E5  db 00

; ---------------- TradeMarket::setOffer@s4:36E6 FAR size=42 callers=1
;   the chosen offer (+0x12E..)
4:36E6  55                   push bp
4:36E7  8bec                 mov bp, sp
4:36E9  8b460e               mov ax, word ptr [bp + 0xe]
4:36EC  c45e06               les bx, ptr [bp + 6]
4:36EF  2689872e01           mov word ptr es:[bx + 0x12e], ax
4:36F4  8b460c               mov ax, word ptr [bp + 0xc]
4:36F7  2689873001           mov word ptr es:[bx + 0x130], ax
4:36FC  8b460a               mov ax, word ptr [bp + 0xa]
4:36FF  2689873201           mov word ptr es:[bx + 0x132], ax
4:3704  26c78734010000       mov word ptr es:[bx + 0x134], 0
4:370B  c9                   leave
4:370C  ca0a00               retf 0xa
4:370F  db 00

; ---------------- TradeMarket::trade@s4:3710 FAR size=712 callers=1
;   makes the trade (queues the step)
4:3710  c8300100             enter 0x130, 0
4:3714  66c746fc00000000     mov dword ptr [bp - 4], 0
4:371C  c45e06               les bx, ptr [bp + 6]
4:371F  26ffb72e01           push word ptr es:[bx + 0x12e]
4:3724  06                   push es
4:3725  53                   push bx
4:3726  90                   nop
4:3727  0e                   push cs
4:3728  e87304               call 0x3b9e  ; TradeMarket::pageList@s4:3B9E
4:372B  8946f8               mov word ptr [bp - 8], ax
4:372E  8956fa               mov word ptr [bp - 6], dx
4:3731  c45e06               les bx, ptr [bp + 6]
4:3734  268b872e01           mov ax, word ptr es:[bx + 0x12e]
4:3739  e9f801               jmp 0x3934
loc_373C:
4:373C  c45e06               les bx, ptr [bp + 6]
4:373F  26ffb73001           push word ptr es:[bx + 0x130]
4:3744  66ff76f8             push dword ptr [bp - 8]
4:3748  9af0579b37           lcall 0x379b, 0x57f0  ; List::countItems@s2:57F0
4:374D  8986d4fe             mov word ptr [bp - 0x12c], ax
4:3751  8996d6fe             mov word ptr [bp - 0x12a], dx
4:3755  6a10                 push 0x10
4:3757  9a9c17aa37           lcall 0x37aa, 0x179c  ; operator_new@s1:179C
4:375C  83c402               add sp, 2
4:375F  8986d0fe             mov word ptr [bp - 0x130], ax
4:3763  8996d2fe             mov word ptr [bp - 0x12e], dx
4:3767  0bd0                 or dx, ax
4:3769  7475                 je 0x37e0
4:376B  c49ed4fe             les bx, ptr [bp - 0x12c]
4:376F  26ff770e             push word ptr es:[bx + 0xe]
4:3773  666a00               push 0
4:3776  c45e06               les bx, ptr [bp + 6]
4:3779  6626ffb73201         push dword ptr es:[bx + 0x132]
4:377F  ffb6d2fe             push word ptr [bp - 0x12e]
4:3783  50                   push ax
4:3784  90                   nop
4:3785  0e                   push cs
4:3786  e80710               call 0x4790  ; MarketRobot::MarketRobot@s4:4790
4:3789  eb58                 jmp 0x37e3
4:378B  db 90
loc_378C:
4:378C  c45e06               les bx, ptr [bp + 6]
4:378F  26ffb73001           push word ptr es:[bx + 0x130]
4:3794  66ff76f8             push dword ptr [bp - 8]
4:3798  9af057fb37           lcall 0x37fb, 0x57f0  ; List::countItems@s2:57F0
4:379D  8986d4fe             mov word ptr [bp - 0x12c], ax
4:37A1  8996d6fe             mov word ptr [bp - 0x12a], dx
4:37A5  6a14                 push 0x14
4:37A7  9a9c170a38           lcall 0x380a, 0x179c  ; operator_new@s1:179C
4:37AC  83c402               add sp, 2
4:37AF  8986d0fe             mov word ptr [bp - 0x130], ax
4:37B3  8996d2fe             mov word ptr [bp - 0x12e], dx
4:37B7  0bd0                 or dx, ax
4:37B9  7425                 je 0x37e0
4:37BB  c49ed4fe             les bx, ptr [bp - 0x12c]
4:37BF  6626ff770e           push dword ptr es:[bx + 0xe]
4:37C4  26ff7712             push word ptr es:[bx + 0x12]
4:37C8  666a00               push 0
4:37CB  c45e06               les bx, ptr [bp + 6]
4:37CE  6626ffb73201         push dword ptr es:[bx + 0x132]
4:37D4  ffb6d2fe             push word ptr [bp - 0x12e]
4:37D8  50                   push ax
4:37D9  90                   nop
4:37DA  0e                   push cs
4:37DB  e8ea0f               call 0x47c8  ; MarketGroup::MarketGroup@s4:47C8
4:37DE  eb03                 jmp 0x37e3
loc_37E0:
4:37E0  33c0                 xor ax, ax
4:37E2  99                   cdq
loc_37E3:
4:37E3  8946fc               mov word ptr [bp - 4], ax
4:37E6  8956fe               mov word ptr [bp - 2], dx
4:37E9  e96401               jmp 0x3950
loc_37EC:
4:37EC  c45e06               les bx, ptr [bp + 6]
4:37EF  26ffb73001           push word ptr es:[bx + 0x130]
4:37F4  66ff76f8             push dword ptr [bp - 8]
4:37F8  9af0574b38           lcall 0x384b, 0x57f0  ; List::countItems@s2:57F0
4:37FD  8986d4fe             mov word ptr [bp - 0x12c], ax
4:3801  8996d6fe             mov word ptr [bp - 0x12a], dx
4:3805  6a12                 push 0x12  ; 'version %d %d'
4:3807  9a9c175a38           lcall 0x385a, 0x179c  ; operator_new@s1:179C
4:380C  83c402               add sp, 2
4:380F  8986d0fe             mov word ptr [bp - 0x130], ax
4:3813  8996d2fe             mov word ptr [bp - 0x12e], dx
4:3817  0bd0                 or dx, ax
4:3819  74c5                 je 0x37e0
4:381B  c49ed4fe             les bx, ptr [bp - 0x12c]
4:381F  6626ff770e           push dword ptr es:[bx + 0xe]
4:3824  666a00               push 0
4:3827  c45e06               les bx, ptr [bp + 6]
4:382A  6626ffb73201         push dword ptr es:[bx + 0x132]
4:3830  ffb6d2fe             push word ptr [bp - 0x12e]
4:3834  50                   push ax
4:3835  90                   nop
4:3836  0e                   push cs
4:3837  e8ce0f               call 0x4808  ; MarketBuilding::MarketBuilding@s4:4808
4:383A  eba7                 jmp 0x37e3
loc_383C:
4:383C  c45e06               les bx, ptr [bp + 6]
4:383F  26ffb73001           push word ptr es:[bx + 0x130]
4:3844  66ff76f8             push dword ptr [bp - 8]
4:3848  9af0579d38           lcall 0x389d, 0x57f0  ; List::countItems@s2:57F0
4:384D  8986d4fe             mov word ptr [bp - 0x12c], ax
4:3851  8996d6fe             mov word ptr [bp - 0x12a], dx
4:3855  6a10                 push 0x10
4:3857  9a9c17ac38           lcall 0x38ac, 0x179c  ; operator_new@s1:179C
4:385C  83c402               add sp, 2
4:385F  8986d0fe             mov word ptr [bp - 0x130], ax
4:3863  8996d2fe             mov word ptr [bp - 0x12e], dx
4:3867  0bd0                 or dx, ax
4:3869  0f8473ff             je 0x37e0
4:386D  c49ed4fe             les bx, ptr [bp - 0x12c]
4:3871  26ff770e             push word ptr es:[bx + 0xe]
4:3875  666a00               push 0
4:3878  c45e06               les bx, ptr [bp + 6]
4:387B  6626ffb73201         push dword ptr es:[bx + 0x132]
4:3881  ffb6d2fe             push word ptr [bp - 0x12e]
4:3885  50                   push ax
4:3886  90                   nop
4:3887  0e                   push cs
4:3888  e82510               call 0x48b0  ; MarketCargo::MarketCargo@s4:48B0
4:388B  e955ff               jmp 0x37e3
loc_388E:
4:388E  c45e06               les bx, ptr [bp + 6]
4:3891  26ffb73001           push word ptr es:[bx + 0x130]
4:3896  66ff76f8             push dword ptr [bp - 8]
4:389A  9af057f138           lcall 0x38f1, 0x57f0  ; List::countItems@s2:57F0
4:389F  8986d4fe             mov word ptr [bp - 0x12c], ax
4:38A3  8996d6fe             mov word ptr [bp - 0x12a], dx
4:38A7  6a12                 push 0x12  ; 'version %d %d'
4:38A9  9a9c170039           lcall 0x3900, 0x179c  ; operator_new@s1:179C
4:38AE  83c402               add sp, 2
4:38B1  8986d0fe             mov word ptr [bp - 0x130], ax
4:38B5  8996d2fe             mov word ptr [bp - 0x12e], dx
4:38B9  0bd0                 or dx, ax
4:38BB  0f8421ff             je 0x37e0
4:38BF  c49ed4fe             les bx, ptr [bp - 0x12c]
4:38C3  6626ff770e           push dword ptr es:[bx + 0xe]
4:38C8  666a00               push 0
4:38CB  c45e06               les bx, ptr [bp + 6]
4:38CE  6626ffb73201         push dword ptr es:[bx + 0x132]
4:38D4  ffb6d2fe             push word ptr [bp - 0x12e]
4:38D8  50                   push ax
4:38D9  90                   nop
4:38DA  0e                   push cs
4:38DB  e84210               call 0x4920  ; MarketColony::MarketColony@s4:4920
4:38DE  e902ff               jmp 0x37e3
4:38E1  db 90
loc_38E2:
4:38E2  c45e06               les bx, ptr [bp + 6]
4:38E5  26ffb73001           push word ptr es:[bx + 0x130]
4:38EA  66ff76f8             push dword ptr [bp - 8]
4:38EE  9af0576239           lcall 0x3962, 0x57f0  ; List::countItems@s2:57F0
4:38F3  8986d4fe             mov word ptr [bp - 0x12c], ax
4:38F7  8996d6fe             mov word ptr [bp - 0x12a], dx
4:38FB  6a14                 push 0x14
4:38FD  9a9c17fd33           lcall 0x33fd, 0x179c  ; operator_new@s1:179C
4:3902  83c402               add sp, 2
4:3905  8986d0fe             mov word ptr [bp - 0x130], ax
4:3909  8996d2fe             mov word ptr [bp - 0x12e], dx
4:390D  0bd0                 or dx, ax
4:390F  0f84cdfe             je 0x37e0
4:3913  c49ed4fe             les bx, ptr [bp - 0x12c]
4:3917  26ff770e             push word ptr es:[bx + 0xe]
4:391B  666a00               push 0
4:391E  c45e06               les bx, ptr [bp + 6]
4:3921  6626ffb73201         push dword ptr es:[bx + 0x132]
4:3927  ffb6d2fe             push word ptr [bp - 0x12e]
4:392B  50                   push ax
4:392C  90                   nop
4:392D  0e                   push cs
4:392E  e8110f               call 0x4842  ; MarketResource::MarketResource@s4:4842
4:3931  e9affe               jmp 0x37e3
loc_3934:
4:3934  2d8801               sub ax, 0x188
4:3937  3d0500               cmp ax, 5
4:393A  7714                 ja 0x3950
4:393C  03c0                 add ax, ax
4:393E  93                   xchg bx, ax
4:393F  2effa74439           jmp word ptr cs:[bx + 0x3944]
switch_table_3944:
    dw loc_373C
    dw loc_378C
    dw loc_37EC
    dw loc_38E2
    dw loc_383C
    dw loc_388E
loc_3950:
4:3950  c45e06               les bx, ptr [bp + 6]
4:3953  6626ffb72601         push dword ptr es:[bx + 0x126]
4:3959  6626ffb72201         push dword ptr es:[bx + 0x122]
4:395F  9a52e87c39           lcall 0x397c, 0xe852  ; colonyByName@s2:E852
4:3964  8946f4               mov word ptr [bp - 0xc], ax
4:3967  8956f6               mov word ptr [bp - 0xa], dx
4:396A  c45e06               les bx, ptr [bp + 6]
4:396D  6626ffb72a01         push dword ptr es:[bx + 0x12a]
4:3973  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3979  9a52e80b36           lcall 0x360b, 0xe852  ; colonyByName@s2:E852
4:397E  8946f0               mov word ptr [bp - 0x10], ax
4:3981  8956f2               mov word ptr [bp - 0xe], dx
4:3984  66ff76f4             push dword ptr [bp - 0xc]
4:3988  52                   push dx
4:3989  50                   push ax
4:398A  66ff76fc             push dword ptr [bp - 4]
4:398E  c45e06               les bx, ptr [bp + 6]
4:3991  6626ffb73601         push dword ptr es:[bx + 0x136]
4:3997  8d86d8fe             lea ax, [bp - 0x128]
4:399B  16                   push ss
4:399C  50                   push ax
4:399D  9a0e2ad139           lcall 0x39d1, 0x2a0e  ; SCTrade::SCTrade@s8:2A0E
4:39A2  8d86d8fe             lea ax, [bp - 0x128]
4:39A6  16                   push ss
4:39A7  50                   push ax
4:39A8  66ff364857           push dword ptr [0x5748]  ; g_sim
4:39AD  9a5a83be35           lcall 0x35be, 0x835a  ; Sim::enqueue@s7:835A
4:39B2  c45e06               les bx, ptr [bp + 6]
4:39B5  6626c787360100000000 mov dword ptr es:[bx + 0x136], 0
4:39BF  06                   push es
4:39C0  53                   push bx
4:39C1  26c41f               les bx, ptr es:[bx]
4:39C4  26ff5f10             lcall es:[bx + 0x10]
4:39C8  8d86d8fe             lea ax, [bp - 0x128]
4:39CC  16                   push ss
4:39CD  50                   push ax
4:39CE  9a5c2ae013           lcall 0x13e0, 0x2a5c  ; SCTrade::~SCTrade@s8:2A5C
4:39D3  c9                   leave
4:39D4  ca0400               retf 4
4:39D7  db 00

; ---------------- TradeMarket::partnerByName@s4:39D8 FAR size=106 callers=1
;   the partner colony by name
4:39D8  c8080000             enter 8, 0
4:39DC  66ff760a             push dword ptr [bp + 0xa]
4:39E0  683105               push 0x531
4:39E3  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:39E8  9a7e84a335           lcall 0x35a3, 0x847e  ; LoadStringRes@s3:847E
4:39ED  52                   push dx
4:39EE  50                   push ax
4:39EF  9a7a3d063a           lcall 0x3a06, 0x3d7a  ; _fstrcmp@s1:3D7A
4:39F4  83c408               add sp, 8
4:39F7  0bc0                 or ax, ax
4:39F9  7414                 je 0x3a0f
4:39FB  66ff760a             push dword ptr [bp + 0xa]
4:39FF  66ff760e             push dword ptr [bp + 0xe]
4:3A03  9a7a3d5a37           lcall 0x375a, 0x3d7a  ; _fstrcmp@s1:3D7A
4:3A08  83c408               add sp, 8
4:3A0B  0bc0                 or ax, ax
4:3A0D  7507                 jne 0x3a16
loc_3A0F:
4:3A0F  33c0                 xor ax, ax
4:3A11  c9                   leave
4:3A12  ca0c00               retf 0xc
4:3A15  db 90
loc_3A16:
4:3A16  66ff760e             push dword ptr [bp + 0xe]
4:3A1A  66ff760a             push dword ptr [bp + 0xa]
4:3A1E  66ff7606             push dword ptr [bp + 6]
4:3A22  90                   nop
4:3A23  0e                   push cs
4:3A24  e8e10b               call 0x4608  ; TradeMarket::findColony@s4:4608
4:3A27  8946f8               mov word ptr [bp - 8], ax
4:3A2A  8956fa               mov word ptr [bp - 6], dx
4:3A2D  0bd0                 or dx, ax
4:3A2F  74de                 je 0x3a0f
4:3A31  c45ef8               les bx, ptr [bp - 8]
4:3A34  26837f0c01           cmp word ptr es:[bx + 0xc], 1
4:3A39  75d4                 jne 0x3a0f
4:3A3B  b80100               mov ax, 1
4:3A3E  c9                   leave
4:3A3F  ca0c00               retf 0xc

; ---------------- TradeMarket::partner@s4:3A42 FAR size=26 callers=1
;   the partner colony
4:3A42  55                   push bp
4:3A43  8bec                 mov bp, sp
4:3A45  66ff760a             push dword ptr [bp + 0xa]
4:3A49  c45e06               les bx, ptr [bp + 6]
4:3A4C  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3A52  9a52e84b37           lcall 0x374b, 0xe852  ; colonyByName@s2:E852
4:3A57  c9                   leave
4:3A58  ca0800               retf 8
4:3A5B  db 00

; ---------------- TradeMarket::diplomacy@s4:3A5C FAR size=30 callers=1
;   diplomacy text
4:3A5C  55                   push bp
4:3A5D  8bec                 mov bp, sp
4:3A5F  66ff760e             push dword ptr [bp + 0xe]
4:3A63  66ff760a             push dword ptr [bp + 0xa]
4:3A67  c45e06               les bx, ptr [bp + 6]
4:3A6A  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3A70  9a20e3553a           lcall 0x3a55, 0xe320  ; TradeAgreements::diplomacyText@s2:E320
4:3A75  c9                   leave
4:3A76  ca0c00               retf 0xc
4:3A79  db 00

; ---------------- TradeMarket::partnerName@s4:3A7A FAR size=26 callers=2
;   the partner's name
4:3A7A  55                   push bp
4:3A7B  8bec                 mov bp, sp
4:3A7D  66ff760a             push dword ptr [bp + 0xa]
4:3A81  c45e06               les bx, ptr [bp + 6]
4:3A84  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3A8A  9a86e5733a           lcall 0x3a73, 0xe586  ; colonyNameCopy@s2:E586
4:3A8F  c9                   leave
4:3A90  ca0800               retf 8
4:3A93  db 00

; ---------------- TradeMarket::colonyLists@s4:3A94 FAR size=30 callers=1
;   the colony lists
4:3A94  55                   push bp
4:3A95  8bec                 mov bp, sp
4:3A97  66ff760e             push dword ptr [bp + 0xe]
4:3A9B  66ff760a             push dword ptr [bp + 0xa]
4:3A9F  c45e06               les bx, ptr [bp + 6]
4:3AA2  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3AA8  9aece38d3a           lcall 0x3a8d, 0xe3ec  ; TradeAgreements::colonyLists@s2:E3EC
4:3AAD  c9                   leave
4:3AAE  ca0c00               retf 0xc
4:3AB1  db 00

; ---------------- TradeMarket::listText@s4:3AB2 FAR size=236 callers=1
;   the text of a list
4:3AB2  c8140000             enter 0x14, 0
4:3AB6  66c746fc00000000     mov dword ptr [bp - 4], 0
4:3ABE  8b460c               mov ax, word ptr [bp + 0xc]
4:3AC1  eb61                 jmp 0x3b24
4:3AC3  db 90
loc_3AC4:
4:3AC4  c45e06               les bx, ptr [bp + 6]
4:3AC7  268b470a             mov ax, word ptr es:[bx + 0xa]
4:3ACB  268b570c             mov dx, word ptr es:[bx + 0xc]
loc_3ACF:
4:3ACF  8946fc               mov word ptr [bp - 4], ax
4:3AD2  8956fe               mov word ptr [bp - 2], dx
4:3AD5  eb69                 jmp 0x3b40
4:3AD7  db 90
loc_3AD8:
4:3AD8  c45e06               les bx, ptr [bp + 6]
4:3ADB  268b470e             mov ax, word ptr es:[bx + 0xe]
4:3ADF  268b5710             mov dx, word ptr es:[bx + 0x10]
4:3AE3  ebea                 jmp 0x3acf
4:3AE5  db 90
loc_3AE6:
4:3AE6  c45e06               les bx, ptr [bp + 6]
4:3AE9  268b4712             mov ax, word ptr es:[bx + 0x12]
4:3AED  268b5714             mov dx, word ptr es:[bx + 0x14]
4:3AF1  ebdc                 jmp 0x3acf
4:3AF3  db 90
loc_3AF4:
4:3AF4  c45e06               les bx, ptr [bp + 6]
4:3AF7  268b4716             mov ax, word ptr es:[bx + 0x16]
4:3AFB  268b5718             mov dx, word ptr es:[bx + 0x18]
4:3AFF  ebce                 jmp 0x3acf
4:3B01  db 90
loc_3B02:
4:3B02  c45e06               les bx, ptr [bp + 6]
4:3B05  268b471a             mov ax, word ptr es:[bx + 0x1a]
4:3B09  268b571c             mov dx, word ptr es:[bx + 0x1c]
4:3B0D  ebc0                 jmp 0x3acf
4:3B0F  db 90
loc_3B10:
4:3B10  c45e06               les bx, ptr [bp + 6]
4:3B13  268b471e             mov ax, word ptr es:[bx + 0x1e]
4:3B17  268b5720             mov dx, word ptr es:[bx + 0x20]
4:3B1B  ebb2                 jmp 0x3acf
4:3B1D  db 90
loc_3B1E:
4:3B1E  33c0                 xor ax, ax
4:3B20  c9                   leave
4:3B21  ca0800               retf 8
loc_3B24:
4:3B24  2d8801               sub ax, 0x188
4:3B27  3d0500               cmp ax, 5
4:3B2A  77f2                 ja 0x3b1e
4:3B2C  03c0                 add ax, ax
4:3B2E  93                   xchg bx, ax
4:3B2F  2effa7343b           jmp word ptr cs:[bx + 0x3b34]
switch_table_3B34:
    dw loc_3AC4
    dw loc_3AD8
    dw loc_3AE6
    dw loc_3AF4
    dw loc_3B02
    dw loc_3B10
loc_3B40:
4:3B40  c746fa0000           mov word ptr [bp - 6], 0
4:3B45  66ff76fc             push dword ptr [bp - 4]
4:3B49  8d46f2               lea ax, [bp - 0xe]
4:3B4C  16                   push ss
4:3B4D  50                   push ax
4:3B4E  9a84575b3b           lcall 0x3b5b, 0x5784  ; ListIter::ListIter@s2:5784
loc_3B53:
4:3B53  8d46f2               lea ax, [bp - 0xe]
4:3B56  16                   push ss
4:3B57  50                   push ax
4:3B58  9a125bab3a           lcall 0x3aab, 0x5b12  ; ListIter::next@s2:5B12
4:3B5D  8946ee               mov word ptr [bp - 0x12], ax
4:3B60  8956f0               mov word ptr [bp - 0x10], dx
4:3B63  0bd0                 or dx, ax
4:3B65  7408                 je 0x3b6f
4:3B67  8b460a               mov ax, word ptr [bp + 0xa]
4:3B6A  3946fa               cmp word ptr [bp - 6], ax
4:3B6D  751b                 jne 0x3b8a
loc_3B6F:
4:3B6F  c746ec0000           mov word ptr [bp - 0x14], 0
4:3B74  66837eee00           cmp dword ptr [bp - 0x12], 0
4:3B79  741c                 je 0x3b97
4:3B7B  c45eee               les bx, ptr [bp - 0x12]
4:3B7E  26837f0a00           cmp word ptr es:[bx + 0xa], 0
4:3B83  740b                 je 0x3b90
4:3B85  b8ffff               mov ax, 0xffff
4:3B88  eb0a                 jmp 0x3b94
loc_3B8A:
4:3B8A  ff46fa               inc word ptr [bp - 6]
4:3B8D  ebc4                 jmp 0x3b53
4:3B8F  db 90
loc_3B90:
4:3B90  268b4708             mov ax, word ptr es:[bx + 8]
loc_3B94:
4:3B94  8946ec               mov word ptr [bp - 0x14], ax
loc_3B97:
4:3B97  8b46ec               mov ax, word ptr [bp - 0x14]
4:3B9A  c9                   leave
4:3B9B  ca0800               retf 8

; ---------------- TradeMarket::pageList@s4:3B9E FAR size=316 callers=6
;   the entries of a page (colonies, cargo, resources, buildings...)
4:3B9E  c80c0000             enter 0xc, 0
4:3BA2  66c746fc00000000     mov dword ptr [bp - 4], 0
4:3BAA  c45e06               les bx, ptr [bp + 6]
4:3BAD  6626ffb72601         push dword ptr es:[bx + 0x126]
4:3BB3  6626ffb72201         push dword ptr es:[bx + 0x122]
4:3BB9  9a52e8ea3b           lcall 0x3bea, 0xe852  ; colonyByName@s2:E852
4:3BBE  52                   push dx
4:3BBF  50                   push ax
4:3BC0  66ff364857           push dword ptr [0x5748]  ; g_sim
4:3BC5  9a4483b039           lcall 0x39b0, 0x8344  ; Sim::resolve@s7:8344
4:3BCA  8946f4               mov word ptr [bp - 0xc], ax
4:3BCD  8956f6               mov word ptr [bp - 0xa], dx
4:3BD0  8b460a               mov ax, word ptr [bp + 0xa]
4:3BD3  e9de00               jmp 0x3cb4
loc_3BD6:
4:3BD6  c45e06               les bx, ptr [bp + 6]
4:3BD9  6626837f0a00         cmp dword ptr es:[bx + 0xa], 0
4:3BDF  750b                 jne 0x3bec
4:3BE1  66ff76f4             push dword ptr [bp - 0xc]
4:3BE5  06                   push es
4:3BE6  53                   push bx
4:3BE7  9aaed3143c           lcall 0x3c14, 0xd3ae  ; TradeLists::listRobots@s2:D3AE
loc_3BEC:
4:3BEC  c45e06               les bx, ptr [bp + 6]
4:3BEF  268b470a             mov ax, word ptr es:[bx + 0xa]
4:3BF3  268b570c             mov dx, word ptr es:[bx + 0xc]
loc_3BF7:
4:3BF7  8946fc               mov word ptr [bp - 4], ax
4:3BFA  8956fe               mov word ptr [bp - 2], dx
4:3BFD  e9d000               jmp 0x3cd0
loc_3C00:
4:3C00  c45e06               les bx, ptr [bp + 6]
4:3C03  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
4:3C09  750b                 jne 0x3c16
4:3C0B  66ff76f4             push dword ptr [bp - 0xc]
4:3C0F  06                   push es
4:3C10  53                   push bx
4:3C11  9af6d4383c           lcall 0x3c38, 0xd4f6  ; TradeLists::listGroupBuildings@s2:D4F6
loc_3C16:
4:3C16  c45e06               les bx, ptr [bp + 6]
4:3C19  268b470e             mov ax, word ptr es:[bx + 0xe]
4:3C1D  268b5710             mov dx, word ptr es:[bx + 0x10]
4:3C21  ebd4                 jmp 0x3bf7
4:3C23  db 90
loc_3C24:
4:3C24  c45e06               les bx, ptr [bp + 6]
4:3C27  6626837f1200         cmp dword ptr es:[bx + 0x12], 0
4:3C2D  750b                 jne 0x3c3a
4:3C2F  66ff76f4             push dword ptr [bp - 0xc]
4:3C33  06                   push es
4:3C34  53                   push bx
4:3C35  9ac6d15c3c           lcall 0x3c5c, 0xd1c6  ; TradeLists::listBuildings@s2:D1C6
loc_3C3A:
4:3C3A  c45e06               les bx, ptr [bp + 6]
4:3C3D  268b4712             mov ax, word ptr es:[bx + 0x12]
4:3C41  268b5714             mov dx, word ptr es:[bx + 0x14]
4:3C45  ebb0                 jmp 0x3bf7
4:3C47  db 90
loc_3C48:
4:3C48  c45e06               les bx, ptr [bp + 6]
4:3C4B  6626837f1600         cmp dword ptr es:[bx + 0x16], 0
4:3C51  750b                 jne 0x3c5e
4:3C53  66ff76f4             push dword ptr [bp - 0xc]
4:3C57  06                   push es
4:3C58  53                   push bx
4:3C59  9aa0cf803c           lcall 0x3c80, 0xcfa0  ; TradeLists::listResources@s2:CFA0
loc_3C5E:
4:3C5E  c45e06               les bx, ptr [bp + 6]
4:3C61  268b4716             mov ax, word ptr es:[bx + 0x16]
4:3C65  268b5718             mov dx, word ptr es:[bx + 0x18]
4:3C69  eb8c                 jmp 0x3bf7
4:3C6B  db 90
loc_3C6C:
4:3C6C  c45e06               les bx, ptr [bp + 6]
4:3C6F  6626837f1a00         cmp dword ptr es:[bx + 0x1a], 0
4:3C75  750b                 jne 0x3c82
4:3C77  66ff76f4             push dword ptr [bp - 0xc]
4:3C7B  06                   push es
4:3C7C  53                   push bx
4:3C7D  9aa2cda43c           lcall 0x3ca4, 0xcda2  ; TradeLists::listCargo@s2:CDA2
loc_3C82:
4:3C82  c45e06               les bx, ptr [bp + 6]
4:3C85  268b471a             mov ax, word ptr es:[bx + 0x1a]
4:3C89  268b571c             mov dx, word ptr es:[bx + 0x1c]
4:3C8D  e967ff               jmp 0x3bf7
loc_3C90:
4:3C90  c45e06               les bx, ptr [bp + 6]
4:3C93  6626837f1e00         cmp dword ptr es:[bx + 0x1e], 0
4:3C99  750b                 jne 0x3ca6
4:3C9B  66ff76f4             push dword ptr [bp - 0xc]
4:3C9F  06                   push es
4:3CA0  53                   push bx
4:3CA1  9ac4cb513b           lcall 0x3b51, 0xcbc4  ; TradeLists::listColonies@s2:CBC4
loc_3CA6:
4:3CA6  c45e06               les bx, ptr [bp + 6]
4:3CA9  268b471e             mov ax, word ptr es:[bx + 0x1e]
4:3CAD  268b5720             mov dx, word ptr es:[bx + 0x20]
4:3CB1  e943ff               jmp 0x3bf7
loc_3CB4:
4:3CB4  2d8801               sub ax, 0x188
4:3CB7  3d0500               cmp ax, 5
4:3CBA  7714                 ja 0x3cd0
4:3CBC  03c0                 add ax, ax
4:3CBE  93                   xchg bx, ax
4:3CBF  2effa7c43c           jmp word ptr cs:[bx + 0x3cc4]
switch_table_3CC4:
    dw loc_3BD6
    dw loc_3C00
    dw loc_3C24
    dw loc_3C48
    dw loc_3C6C
    dw loc_3C90
loc_3CD0:
4:3CD0  8b46fc               mov ax, word ptr [bp - 4]
4:3CD3  8b56fe               mov dx, word ptr [bp - 2]
4:3CD6  c9                   leave
4:3CD7  ca0600               retf 6

; ---------------- TradeMarket::setPartner@s4:3CDA FAR size=106 callers=1
;   the partner's name
4:3CDA  c80c0000             enter 0xc, 0
4:3CDE  c45e06               les bx, ptr [bp + 6]
4:3CE1  06                   push es
4:3CE2  53                   push bx
4:3CE3  26c41f               les bx, ptr es:[bx]
4:3CE6  26ff5f10             lcall es:[bx + 0x10]
4:3CEA  c45e06               les bx, ptr [bp + 6]
4:3CED  66268b872601         mov eax, dword ptr es:[bx + 0x126]
4:3CF3  6650                 push eax
4:3CF5  9ace170b3d           lcall 0x3d0b, 0x17ce  ; operator_delete@s1:17CE
4:3CFA  83c404               add sp, 4
4:3CFD  c45e06               les bx, ptr [bp + 6]
4:3D00  66268b872a01         mov eax, dword ptr es:[bx + 0x12a]
4:3D06  6650                 push eax
4:3D08  9ace17f239           lcall 0x39f2, 0x17ce  ; operator_delete@s1:17CE
4:3D0D  83c404               add sp, 4
4:3D10  66ff760e             push dword ptr [bp + 0xe]
4:3D14  9ae860303d           lcall 0x3d30, 0x60e8  ; _strdup@s2:60E8
4:3D19  83c404               add sp, 4
4:3D1C  c45e06               les bx, ptr [bp + 6]
4:3D1F  2689872601           mov word ptr es:[bx + 0x126], ax
4:3D24  2689972801           mov word ptr es:[bx + 0x128], dx
4:3D29  66ff760a             push dword ptr [bp + 0xa]
4:3D2D  9ae860bc3b           lcall 0x3bbc, 0x60e8  ; _strdup@s2:60E8
4:3D32  c45e06               les bx, ptr [bp + 6]
4:3D35  2689872a01           mov word ptr es:[bx + 0x12a], ax
4:3D3A  2689972c01           mov word ptr es:[bx + 0x12c], dx
4:3D3F  c9                   leave
4:3D40  ca0c00               retf 0xc
4:3D43  db 00

; ---------------- TradeMarket::prices@s4:3D44 FAR size=40 callers=2
;   two prices (+0x126, +0x12A)
4:3D44  55                   push bp
4:3D45  8bec                 mov bp, sp
4:3D47  c45e06               les bx, ptr [bp + 6]
4:3D4A  66268b872601         mov eax, dword ptr es:[bx + 0x126]
4:3D50  c45e0e               les bx, ptr [bp + 0xe]
4:3D53  66268907             mov dword ptr es:[bx], eax
4:3D57  c45e06               les bx, ptr [bp + 6]
4:3D5A  66268b872a01         mov eax, dword ptr es:[bx + 0x12a]
4:3D60  c45e0a               les bx, ptr [bp + 0xa]
4:3D63  66268907             mov dword ptr es:[bx], eax
4:3D67  c9                   leave
4:3D68  ca0c00               retf 0xc
4:3D6B  db 00

; ---------------- TradeMarket::swingPrices@s4:3D6C FAR size=288 callers=1
;   the price swing walks 0 -> +-10 -> +-20 -> +-30 -> 0
4:3D6C  55                   push bp
4:3D6D  8bec                 mov bp, sp
4:3D6F  c45e06               les bx, ptr [bp + 6]
4:3D72  268b874201           mov ax, word ptr es:[bx + 0x142]
4:3D77  268b974401           mov dx, word ptr es:[bx + 0x144]
4:3D7C  2de2ff               sub ax, 0xffe2
4:3D7F  83daff               sbb dx, -1
4:3D82  0f850201             jne 0x3e88
4:3D86  3d3c00               cmp ax, 0x3c
4:3D89  0f84bb00             je 0x3e48
4:3D8D  0f87f700             ja 0x3e88
4:3D91  3c14                 cmp al, 0x14
4:3D93  0f849500             je 0x3e2c
4:3D97  0f87df00             ja 0x3e7a
4:3D9B  0ac0                 or al, al
4:3D9D  0f84a700             je 0x3e48
4:3DA1  2c0a                 sub al, 0xa
4:3DA3  0f848f00             je 0x3e36
4:3DA7  c9                   leave
4:3DA8  ca0400               retf 4
4:3DAB  db 90
loc_3DAC:
4:3DAC  a1ae13               mov ax, word ptr [0x13ae]
4:3DAF  48                   dec ax
4:3DB0  0f8cd400             jl 0x3e88
4:3DB4  0f80d000             jo 0x3e88
4:3DB8  48                   dec ax
4:3DB9  7e0b                 jle 0x3dc6
4:3DBB  48                   dec ax
4:3DBC  741c                 je 0x3dda
4:3DBE  48                   dec ax
4:3DBF  7447                 je 0x3e08
4:3DC1  c9                   leave
4:3DC2  ca0400               retf 4
4:3DC5  db 90
loc_3DC6:
4:3DC6  c45e06               les bx, ptr [bp + 6]
4:3DC9  26c78742010a00       mov word ptr es:[bx + 0x142], 0xa
loc_3DD0:
4:3DD0  26c78744010000       mov word ptr es:[bx + 0x144], 0
4:3DD7  e9ae00               jmp 0x3e88
loc_3DDA:
4:3DDA  666801006400         push 0x640001
4:3DE0  9a2e61173d           lcall 0x3d17, 0x612e  ; random@s2:612E
4:3DE5  8be5                 mov sp, bp
4:3DE7  3d3200               cmp ax, 0x32
4:3DEA  7c06                 jl 0x3df2
4:3DEC  b8f6ff               mov ax, 0xfff6
4:3DEF  eb04                 jmp 0x3df5
4:3DF1  db 90
loc_3DF2:
4:3DF2  b80a00               mov ax, 0xa
loc_3DF5:
4:3DF5  99                   cdq
4:3DF6  c45e06               les bx, ptr [bp + 6]
4:3DF9  2689874201           mov word ptr es:[bx + 0x142], ax
4:3DFE  2689974401           mov word ptr es:[bx + 0x144], dx
4:3E03  c9                   leave
4:3E04  ca0400               retf 4
4:3E07  db 90
loc_3E08:
4:3E08  c45e06               les bx, ptr [bp + 6]
4:3E0B  26c7874201f6ff       mov word ptr es:[bx + 0x142], 0xfff6
4:3E12  eb29                 jmp 0x3e3d
loc_3E14:
4:3E14  c45e06               les bx, ptr [bp + 6]
4:3E17  26c78742011400       mov word ptr es:[bx + 0x142], 0x14
4:3E1E  ebb0                 jmp 0x3dd0
loc_3E20:
4:3E20  c45e06               les bx, ptr [bp + 6]
4:3E23  26c78742011e00       mov word ptr es:[bx + 0x142], 0x1e
4:3E2A  eba4                 jmp 0x3dd0
loc_3E2C:
4:3E2C  26c7874201ecff       mov word ptr es:[bx + 0x142], 0xffec
4:3E33  eb08                 jmp 0x3e3d
4:3E35  db 90
loc_3E36:
4:3E36  26c7874201e2ff       mov word ptr es:[bx + 0x142], 0xffe2
loc_3E3D:
4:3E3D  26c7874401ffff       mov word ptr es:[bx + 0x144], 0xffff
4:3E44  c9                   leave
4:3E45  ca0400               retf 4
loc_3E48:
4:3E48  666a05               push 5
4:3E4B  66ff364857           push dword ptr [0x5748]  ; g_sim
4:3E50  9a2683c83b           lcall 0x3bc8, 0x8326  ; Sim::getTurnNumber@s7:8326
4:3E55  52                   push dx
4:3E56  50                   push ax
4:3E57  6658                 pop eax
4:3E59  6659                 pop ecx
4:3E5B  6633d2               xor edx, edx
4:3E5E  66f7f1               div ecx
4:3E61  668bc2               mov eax, edx
4:3E64  660bc0               or eax, eax
4:3E67  751f                 jne 0x3e88
4:3E69  c45e06               les bx, ptr [bp + 6]
4:3E6C  6626c787420100000000 mov dword ptr es:[bx + 0x142], 0
4:3E76  c9                   leave
4:3E77  ca0400               retf 4
loc_3E7A:
4:3E7A  2c1e                 sub al, 0x1e
4:3E7C  0f842cff             je 0x3dac
4:3E80  2c0a                 sub al, 0xa
4:3E82  7490                 je 0x3e14
4:3E84  2c0a                 sub al, 0xa
4:3E86  7498                 je 0x3e20
loc_3E88:
4:3E88  c9                   leave
4:3E89  ca0400               retf 4

; ---------------- TradeMarket::defaultQuantity@s4:3E8C FAR size=24 callers=1
;   1 and 25
4:3E8C  55                   push bp
4:3E8D  8bec                 mov bp, sp
4:3E8F  c45e0e               les bx, ptr [bp + 0xe]
4:3E92  26c7070100           mov word ptr es:[bx], 1
4:3E97  c45e0a               les bx, ptr [bp + 0xa]
4:3E9A  26c7071900           mov word ptr es:[bx], 0x19
4:3E9F  c9                   leave
4:3EA0  ca0c00               retf 0xc
4:3EA3  db 00

; ---------------- TradeMarket::clear@s4:3EA4 FAR size=66 callers=0
;   (vslot 4)
4:3EA4  c8080000             enter 8, 0
4:3EA8  56                   push si
4:3EA9  66ff7606             push dword ptr [bp + 6]
4:3EAD  9ac6cae33d           lcall 0x3de3, 0xcac6  ; TradeLists::clear@s2:CAC6
4:3EB2  c45e06               les bx, ptr [bp + 6]
4:3EB5  268b873601           mov ax, word ptr es:[bx + 0x136]
4:3EBA  268b973801           mov dx, word ptr es:[bx + 0x138]
4:3EBF  8bda                 mov bx, dx
4:3EC1  0bd0                 or dx, ax
4:3EC3  740e                 je 0x3ed3
4:3EC5  6a01                 push 1
4:3EC7  53                   push bx
4:3EC8  50                   push ax
4:3EC9  8ec3                 mov es, bx
4:3ECB  8bf0                 mov si, ax
4:3ECD  26c41c               les bx, ptr es:[si]
4:3ED0  26ff1f               lcall es:[bx]
loc_3ED3:
4:3ED3  c45e06               les bx, ptr [bp + 6]
4:3ED6  6626c787360100000000 mov dword ptr es:[bx + 0x136], 0
4:3EE0  5e                   pop si
4:3EE1  c9                   leave
4:3EE2  ca0400               retf 4
4:3EE5  db 00

; ---------------- TradeMarket::rebelOffers@s4:3EE6 FAR size=918 callers=1
;   what the rebels offer (dialog 402)
4:3EE6  c8180000             enter 0x18, 0
4:3EEA  66c746fc00000000     mov dword ptr [bp - 4], 0
4:3EF2  8b4610               mov ax, word ptr [bp + 0x10]
4:3EF5  e98a00               jmp 0x3f82
loc_3EF8:
4:3EF8  8b460e               mov ax, word ptr [bp + 0xe]
4:3EFB  c1e002               shl ax, 2
4:3EFE  05b640               add ax, 0x40b6
loc_3F01:
4:3F01  8946fc               mov word ptr [bp - 4], ax
4:3F04  8c5efe               mov word ptr [bp - 2], ds
4:3F07  e9b800               jmp 0x3fc2
loc_3F0A:
4:3F0A  8b460e               mov ax, word ptr [bp + 0xe]
4:3F0D  c1e002               shl ax, 2
4:3F10  05e240               add ax, 0x40e2
4:3F13  ebec                 jmp 0x3f01
4:3F15  db 90
loc_3F16:
4:3F16  8b460e               mov ax, word ptr [bp + 0xe]
4:3F19  c1e002               shl ax, 2
4:3F1C  05ee40               add ax, 0x40ee
4:3F1F  ebe0                 jmp 0x3f01
4:3F21  db 90
loc_3F22:
4:3F22  8b460e               mov ax, word ptr [bp + 0xe]
4:3F25  c1e002               shl ax, 2
4:3F28  05f240               add ax, 0x40f2
4:3F2B  ebd4                 jmp 0x3f01
4:3F2D  db 90
loc_3F2E:
4:3F2E  8b460e               mov ax, word ptr [bp + 0xe]
4:3F31  c1e002               shl ax, 2
4:3F34  050641               add ax, 0x4106
4:3F37  ebc8                 jmp 0x3f01
4:3F39  db 90
loc_3F3A:
4:3F3A  8b460e               mov ax, word ptr [bp + 0xe]
4:3F3D  c1e002               shl ax, 2
4:3F40  050a41               add ax, 0x410a
4:3F43  ebbc                 jmp 0x3f01
4:3F45  db 90
loc_3F46:
4:3F46  8b460e               mov ax, word ptr [bp + 0xe]
4:3F49  c1e002               shl ax, 2
4:3F4C  050e41               add ax, 0x410e
4:3F4F  ebb0                 jmp 0x3f01
4:3F51  db 90
loc_3F52:
4:3F52  8b460e               mov ax, word ptr [bp + 0xe]
4:3F55  c1e002               shl ax, 2
4:3F58  051241               add ax, 0x4112
4:3F5B  eba4                 jmp 0x3f01
4:3F5D  db 90
loc_3F5E:
4:3F5E  8b460e               mov ax, word ptr [bp + 0xe]
4:3F61  c1e002               shl ax, 2
4:3F64  051641               add ax, 0x4116
4:3F67  eb98                 jmp 0x3f01
4:3F69  db 90
loc_3F6A:
4:3F6A  8b460e               mov ax, word ptr [bp + 0xe]
4:3F6D  c1e002               shl ax, 2
4:3F70  051a41               add ax, 0x411a
4:3F73  eb8c                 jmp 0x3f01
4:3F75  db 90
loc_3F76:
4:3F76  8b460e               mov ax, word ptr [bp + 0xe]
4:3F79  c1e002               shl ax, 2
4:3F7C  05ce40               add ax, 0x40ce
4:3F7F  e97fff               jmp 0x3f01
loc_3F82:
4:3F82  48                   dec ax
4:3F83  3d1800               cmp ax, 0x18
4:3F86  77ee                 ja 0x3f76
4:3F88  03c0                 add ax, ax
4:3F8A  93                   xchg bx, ax
4:3F8B  2effa7903f           jmp word ptr cs:[bx + 0x3f90]
switch_table_3F90:
    dw loc_3EF8
    dw loc_3F76
    dw loc_3F0A
    dw loc_3F16
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F22
    dw loc_3F2E
    dw loc_3F3A
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F76
    dw loc_3F46
    dw loc_3F76
    dw loc_3F52
    dw loc_3F5E
    dw loc_3F76
    dw loc_3F6A
loc_3FC2:
4:3FC2  66837efc00           cmp dword ptr [bp - 4], 0
4:3FC7  7507                 jne 0x3fd0
4:3FC9  33c0                 xor ax, ax
4:3FCB  99                   cdq
4:3FCC  c9                   leave
4:3FCD  ca1000               retf 0x10
loc_3FD0:
4:3FD0  66c746f800000000     mov dword ptr [bp - 8], 0
4:3FD8  c45efc               les bx, ptr [bp - 4]
4:3FDB  268b07               mov ax, word ptr es:[bx]
4:3FDE  e96902               jmp 0x424a
4:3FE1  db 90
loc_3FE2:
4:3FE2  c45efc               les bx, ptr [bp - 4]
4:3FE5  26ff7702             push word ptr es:[bx + 2]
4:3FE9  66ff7606             push dword ptr [bp + 6]
4:3FED  90                   nop
4:3FEE  0e                   push cs
4:3FEF  e87805               call 0x456a  ; TradeMarket::resourcePrice@s4:456A
4:3FF2  8946f4               mov word ptr [bp - 0xc], ax
4:3FF5  8956f6               mov word ptr [bp - 0xa], dx
4:3FF8  c45efc               les bx, ptr [bp - 4]
4:3FFB  26ff7702             push word ptr es:[bx + 2]
4:3FFF  9ad8c07040           lcall 0x4070, 0xc0d8  ; ResourceName@s5:C0D8
4:4004  83c402               add sp, 2
4:4007  52                   push dx
4:4008  50                   push ax
4:4009  9ae8607a40           lcall 0x407a, 0x60e8  ; _strdup@s2:60E8
4:400E  83c404               add sp, 4
4:4011  8946f0               mov word ptr [bp - 0x10], ax
4:4014  8956f2               mov word ptr [bp - 0xe], dx
4:4017  6a10                 push 0x10
4:4019  9a9c178a40           lcall 0x408a, 0x179c  ; operator_new@s1:179C
4:401E  83c402               add sp, 2
4:4021  8946ec               mov word ptr [bp - 0x14], ax
4:4024  8956ee               mov word ptr [bp - 0x12], dx
4:4027  0bd0                 or dx, ax
4:4029  0f848f00             je 0x40bc
4:402D  c45efc               les bx, ptr [bp - 4]
4:4030  26ff7702             push word ptr es:[bx + 2]
4:4034  66ff76f0             push dword ptr [bp - 0x10]
4:4038  668b460a             mov eax, dword ptr [bp + 0xa]
4:403C  6699                 cdq
4:403E  66f77ef4             idiv dword ptr [bp - 0xc]
4:4042  6650                 push eax
4:4044  66ff76ec             push dword ptr [bp - 0x14]
4:4048  90                   nop
4:4049  0e                   push cs
4:404A  e84307               call 0x4790  ; MarketRobot::MarketRobot@s4:4790
4:404D  eb70                 jmp 0x40bf
4:404F  db 90
loc_4050:
4:4050  c45efc               les bx, ptr [bp - 4]
4:4053  26ff7702             push word ptr es:[bx + 2]
4:4057  66ff7606             push dword ptr [bp + 6]
4:405B  90                   nop
4:405C  0e                   push cs
4:405D  e8be04               call 0x451e  ; TradeMarket::productPrice@s4:451E
4:4060  8946f0               mov word ptr [bp - 0x10], ax
4:4063  8956f2               mov word ptr [bp - 0xe], dx
4:4066  c45efc               les bx, ptr [bp - 4]
4:4069  26ff7702             push word ptr es:[bx + 2]
4:406D  9a22c2fd40           lcall 0x40fd, 0xc222  ; productAName@s5:C222
4:4072  83c402               add sp, 2
4:4075  52                   push dx
4:4076  50                   push ax
4:4077  9ae860d740           lcall 0x40d7, 0x60e8  ; _strdup@s2:60E8
4:407C  83c404               add sp, 4
4:407F  8946f4               mov word ptr [bp - 0xc], ax
4:4082  8956f6               mov word ptr [bp - 0xa], dx
4:4085  6a10                 push 0x10
4:4087  9a9c171741           lcall 0x4117, 0x179c  ; operator_new@s1:179C
4:408C  83c402               add sp, 2
4:408F  8946ec               mov word ptr [bp - 0x14], ax
4:4092  8956ee               mov word ptr [bp - 0x12], dx
4:4095  0bd0                 or dx, ax
4:4097  7423                 je 0x40bc
4:4099  c45efc               les bx, ptr [bp - 4]
4:409C  26ff7702             push word ptr es:[bx + 2]
4:40A0  66ff76f4             push dword ptr [bp - 0xc]
4:40A4  668b460a             mov eax, dword ptr [bp + 0xa]
4:40A8  6699                 cdq
4:40AA  66f77ef0             idiv dword ptr [bp - 0x10]
4:40AE  6650                 push eax
4:40B0  66ff76ec             push dword ptr [bp - 0x14]
4:40B4  90                   nop
4:40B5  0e                   push cs
4:40B6  e8f707               call 0x48b0  ; MarketCargo::MarketCargo@s4:48B0
4:40B9  eb04                 jmp 0x40bf
4:40BB  db 90
loc_40BC:
4:40BC  33c0                 xor ax, ax
4:40BE  99                   cdq
loc_40BF:
4:40BF  8946f8               mov word ptr [bp - 8], ax
4:40C2  8956fa               mov word ptr [bp - 6], dx
4:40C5  e99601               jmp 0x425e
loc_40C8:
4:40C8  c45efc               les bx, ptr [bp - 4]
4:40CB  26ff7702             push word ptr es:[bx + 2]
4:40CF  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
4:40D4  9a46c60741           lcall 0x4107, 0xc646  ; BldgGroups::firstOffered@s2:C646
4:40D9  8946f0               mov word ptr [bp - 0x10], ax
4:40DC  0bc0                 or ax, ax
4:40DE  7505                 jne 0x40e5
4:40E0  c746f04f00           mov word ptr [bp - 0x10], 0x4f
loc_40E5:
4:40E5  ff76f0               push word ptr [bp - 0x10]
4:40E8  66ff7606             push dword ptr [bp + 6]
4:40EC  90                   nop
4:40ED  0e                   push cs
4:40EE  e8fb02               call 0x43ec  ; TradeMarket::offerAmount@s4:43EC
4:40F1  8946f4               mov word ptr [bp - 0xc], ax
4:40F4  8956f6               mov word ptr [bp - 0xa], dx
4:40F7  ff76f0               push word ptr [bp - 0x10]
4:40FA  9a80bd1435           lcall 0x3514, 0xbd80  ; buildingName@s5:BD80
4:40FF  83c402               add sp, 2
4:4102  52                   push dx
4:4103  50                   push ax
4:4104  9ae860b03e           lcall 0x3eb0, 0x60e8  ; _strdup@s2:60E8
4:4109  83c404               add sp, 4
4:410C  8946e8               mov word ptr [bp - 0x18], ax
4:410F  8956ea               mov word ptr [bp - 0x16], dx
4:4112  6a14                 push 0x14
4:4114  9a9c177841           lcall 0x4178, 0x179c  ; operator_new@s1:179C
4:4119  83c402               add sp, 2
4:411C  8946ec               mov word ptr [bp - 0x14], ax
4:411F  8956ee               mov word ptr [bp - 0x12], dx
4:4122  0bd0                 or dx, ax
4:4124  7496                 je 0x40bc
4:4126  666a00               push 0
4:4129  ff76f0               push word ptr [bp - 0x10]
4:412C  66ff76e8             push dword ptr [bp - 0x18]
4:4130  668b460a             mov eax, dword ptr [bp + 0xa]
4:4134  6699                 cdq
4:4136  66f77ef4             idiv dword ptr [bp - 0xc]
4:413A  6650                 push eax
4:413C  66ff76ec             push dword ptr [bp - 0x14]
4:4140  90                   nop
4:4141  0e                   push cs
4:4142  e88306               call 0x47c8  ; MarketGroup::MarketGroup@s4:47C8
4:4145  e977ff               jmp 0x40bf
loc_4148:
4:4148  c45efc               les bx, ptr [bp - 4]
4:414B  268b4702             mov ax, word ptr es:[bx + 2]
4:414F  48                   dec ax
4:4150  740e                 je 0x4160
4:4152  48                   dec ax
4:4153  7441                 je 0x4196
4:4155  48                   dec ax
4:4156  7472                 je 0x41ca
4:4158  48                   dec ax
4:4159  0f84a100             je 0x41fe
4:415D  e9fe00               jmp 0x425e
loc_4160:
4:4160  683004               push 0x430
4:4163  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:4168  9aac84a141           lcall 0x41a1, 0x84ac  ; LoadStringDup@s3:84AC
4:416D  8946e8               mov word ptr [bp - 0x18], ax
4:4170  8956ea               mov word ptr [bp - 0x16], dx
4:4173  6a14                 push 0x14
4:4175  9a9c17ae41           lcall 0x41ae, 0x179c  ; operator_new@s1:179C
4:417A  83c402               add sp, 2
4:417D  8946ec               mov word ptr [bp - 0x14], ax
4:4180  8956ee               mov word ptr [bp - 0x12], dx
4:4183  0bd0                 or dx, ax
4:4185  0f8433ff             je 0x40bc
4:4189  6a02                 push 2
4:418B  66ff76e8             push dword ptr [bp - 0x18]
4:418F  666a14               push 0x14
4:4192  e99b00               jmp 0x4230
4:4195  db 90
loc_4196:
4:4196  683104               push 0x431
4:4199  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:419E  9aac84d541           lcall 0x41d5, 0x84ac  ; LoadStringDup@s3:84AC
4:41A3  8946e8               mov word ptr [bp - 0x18], ax
4:41A6  8956ea               mov word ptr [bp - 0x16], dx
4:41A9  6a14                 push 0x14
4:41AB  9a9c17e241           lcall 0x41e2, 0x179c  ; operator_new@s1:179C
4:41B0  83c402               add sp, 2
4:41B3  8946ec               mov word ptr [bp - 0x14], ax
4:41B6  8956ee               mov word ptr [bp - 0x12], dx
4:41B9  0bd0                 or dx, ax
4:41BB  0f84fdfe             je 0x40bc
4:41BF  6a03                 push 3
4:41C1  66ff76e8             push dword ptr [bp - 0x18]
4:41C5  666a16               push 0x16
4:41C8  eb66                 jmp 0x4230
loc_41CA:
4:41CA  683204               push 0x432
4:41CD  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:41D2  9aac840942           lcall 0x4209, 0x84ac  ; LoadStringDup@s3:84AC
4:41D7  8946e8               mov word ptr [bp - 0x18], ax
4:41DA  8956ea               mov word ptr [bp - 0x16], dx
4:41DD  6a14                 push 0x14
4:41DF  9a9c171642           lcall 0x4216, 0x179c  ; operator_new@s1:179C
4:41E4  83c402               add sp, 2
4:41E7  8946ec               mov word ptr [bp - 0x14], ax
4:41EA  8956ee               mov word ptr [bp - 0x12], dx
4:41ED  0bd0                 or dx, ax
4:41EF  0f84c9fe             je 0x40bc
4:41F3  6a04                 push 4
4:41F5  66ff76e8             push dword ptr [bp - 0x18]
4:41F9  666a17               push 0x17
4:41FC  eb32                 jmp 0x4230
loc_41FE:
4:41FE  683304               push 0x433
4:4201  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:4206  9aac84eb39           lcall 0x39eb, 0x84ac  ; LoadStringDup@s3:84AC
4:420B  8946e8               mov word ptr [bp - 0x18], ax
4:420E  8956ea               mov word ptr [bp - 0x16], dx
4:4211  6a14                 push 0x14
4:4213  9a9c17f83c           lcall 0x3cf8, 0x179c  ; operator_new@s1:179C
4:4218  83c402               add sp, 2
4:421B  8946ec               mov word ptr [bp - 0x14], ax
4:421E  8956ee               mov word ptr [bp - 0x12], dx
4:4221  0bd0                 or dx, ax
4:4223  0f8495fe             je 0x40bc
4:4227  6a04                 push 4
4:4229  66ff76e8             push dword ptr [bp - 0x18]
4:422D  666a0a               push 0xa
loc_4230:
4:4230  668b460a             mov eax, dword ptr [bp + 0xa]
4:4234  6659                 pop ecx
4:4236  6699                 cdq
4:4238  66f7f9               idiv ecx
4:423B  6650                 push eax
4:423D  66ff76ec             push dword ptr [bp - 0x14]
4:4241  90                   nop
4:4242  0e                   push cs
4:4243  e8fc05               call 0x4842  ; MarketResource::MarketResource@s4:4842
4:4246  e976fe               jmp 0x40bf
4:4249  db 90
loc_424A:
4:424A  48                   dec ax
4:424B  0f8493fd             je 0x3fe2
4:424F  48                   dec ax
4:4250  0f84fcfd             je 0x4050
4:4254  48                   dec ax
4:4255  0f846ffe             je 0x40c8
4:4259  48                   dec ax
4:425A  0f84eafe             je 0x4148
loc_425E:
4:425E  c45ef8               les bx, ptr [bp - 8]
4:4261  6626837f0801         cmp dword ptr es:[bx + 8], 1
4:4267  7309                 jae 0x4272
4:4269  6626c7470801000000   mov dword ptr es:[bx + 8], 1
loc_4272:
4:4272  8b46f8               mov ax, word ptr [bp - 8]
4:4275  8b56fa               mov dx, word ptr [bp - 6]
4:4278  c9                   leave
4:4279  ca1000               retf 0x10

; ---------------- TradeMarket::unitPrice@s4:427C FAR size=226 callers=1
;   base + base * swing / 100 (page 392)
4:427C  c8140000             enter 0x14, 0
4:4280  66c746fc00000000     mov dword ptr [bp - 4], 0
4:4288  c45e06               les bx, ptr [bp + 6]
4:428B  26ffb72e01           push word ptr es:[bx + 0x12e]
4:4290  06                   push es
4:4291  53                   push bx
4:4292  90                   nop
4:4293  0e                   push cs
4:4294  e807f9               call 0x3b9e  ; TradeMarket::pageList@s4:3B9E
4:4297  8946f8               mov word ptr [bp - 8], ax
4:429A  8956fa               mov word ptr [bp - 6], dx
4:429D  c45e06               les bx, ptr [bp + 6]
4:42A0  268b872e01           mov ax, word ptr es:[bx + 0x12e]
4:42A5  e98000               jmp 0x4328
loc_42A8:
4:42A8  c45e06               les bx, ptr [bp + 6]
4:42AB  26ffb73001           push word ptr es:[bx + 0x130]
4:42B0  66ff76f8             push dword ptr [bp - 8]
4:42B4  9af057ef42           lcall 0x42ef, 0x57f0  ; List::countItems@s2:57F0
4:42B9  8ec2                 mov es, dx
4:42BB  8bd8                 mov bx, ax
4:42BD  26ff770e             push word ptr es:[bx + 0xe]
4:42C1  66ff7606             push dword ptr [bp + 6]
4:42C5  90                   nop
4:42C6  0e                   push cs
4:42C7  e8a002               call 0x456a  ; TradeMarket::resourcePrice@s4:456A
loc_42CA:
4:42CA  52                   push dx
4:42CB  50                   push ax
4:42CC  c45e06               les bx, ptr [bp + 6]
4:42CF  66268b873201         mov eax, dword ptr es:[bx + 0x132]
4:42D5  6659                 pop ecx
4:42D7  66f7e9               imul ecx
4:42DA  668946fc             mov dword ptr [bp - 4], eax
4:42DE  eb57                 jmp 0x4337
loc_42E0:
4:42E0  c45e06               les bx, ptr [bp + 6]
4:42E3  26ffb73001           push word ptr es:[bx + 0x130]
4:42E8  66ff76f8             push dword ptr [bp - 8]
4:42EC  9af0571343           lcall 0x4313, 0x57f0  ; List::countItems@s2:57F0
4:42F1  8ec2                 mov es, dx
4:42F3  8bd8                 mov bx, ax
4:42F5  26ff770e             push word ptr es:[bx + 0xe]
4:42F9  66ff7606             push dword ptr [bp + 6]
4:42FD  90                   nop
4:42FE  0e                   push cs
4:42FF  e81c02               call 0x451e  ; TradeMarket::productPrice@s4:451E
4:4302  ebc6                 jmp 0x42ca
loc_4304:
4:4304  c45e06               les bx, ptr [bp + 6]
4:4307  26ffb73001           push word ptr es:[bx + 0x130]
4:430C  66ff76f8             push dword ptr [bp - 8]
4:4310  9af0570c40           lcall 0x400c, 0x57f0  ; List::countItems@s2:57F0
4:4315  8ec2                 mov es, dx
4:4317  8bd8                 mov bx, ax
4:4319  26ff770e             push word ptr es:[bx + 0xe]
4:431D  66ff7606             push dword ptr [bp + 6]
4:4321  90                   nop
4:4322  0e                   push cs
4:4323  e8ae02               call 0x45d4  ; TradeMarket::robotPrice@s4:45D4
4:4326  eba2                 jmp 0x42ca
loc_4328:
4:4328  2d8801               sub ax, 0x188
4:432B  0f8479ff             je 0x42a8
4:432F  2d0300               sub ax, 3
4:4332  74d0                 je 0x4304
4:4334  48                   dec ax
4:4335  74a9                 je 0x42e0
loc_4337:
4:4337  c45e06               les bx, ptr [bp + 6]
4:433A  66268b874201         mov eax, dword ptr es:[bx + 0x142]
4:4340  66f76efc             imul dword ptr [bp - 4]
4:4344  66b964000000         mov ecx, 0x64
4:434A  6699                 cdq
4:434C  66f7f9               idiv ecx
4:434F  660346fc             add eax, dword ptr [bp - 4]
4:4353  668bd0               mov edx, eax
4:4356  66c1ea10             shr edx, 0x10
4:435A  c9                   leave
4:435B  ca0400               retf 4

; ---------------- TradeMarket::pickOffer@s4:435E FAR size=142 callers=1
;   picks an offer at random
4:435E  c8120000             enter 0x12, 0
4:4362  8b4610               mov ax, word ptr [bp + 0x10]
4:4365  39460e               cmp word ptr [bp + 0xe], ax
4:4368  7d06                 jge 0x4370
4:436A  8b460e               mov ax, word ptr [bp + 0xe]
4:436D  894610               mov word ptr [bp + 0x10], ax
loc_4370:
4:4370  2bc0                 sub ax, ax
4:4372  8946fe               mov word ptr [bp - 2], ax
4:4375  c45e06               les bx, ptr [bp + 6]
4:4378  6626ffb72601         push dword ptr es:[bx + 0x126]
4:437E  6626ffb72201         push dword ptr es:[bx + 0x122]
4:4384  9a52e8a443           lcall 0x43a4, 0xe852  ; colonyByName@s2:E852
4:4389  52                   push dx
4:438A  50                   push ax
4:438B  66ff364857           push dword ptr [0x5748]  ; g_sim
4:4390  9a4483533e           lcall 0x3e53, 0x8344  ; Sim::resolve@s7:8344
4:4395  8946f4               mov word ptr [bp - 0xc], ax
4:4398  8956f6               mov word ptr [bp - 0xa], dx
loc_439B:
4:439B  ff760e               push word ptr [bp + 0xe]
4:439E  ff7610               push word ptr [bp + 0x10]
4:43A1  9a2e61ca43           lcall 0x43ca, 0x612e  ; random@s2:612E
4:43A6  83c404               add sp, 4
4:43A9  8bd8                 mov bx, ax
4:43AB  03d8                 add bx, ax
4:43AD  8946f2               mov word ptr [bp - 0xe], ax
4:43B0  8b871c41             mov ax, word ptr [bx + 0x411c]
4:43B4  0bc0                 or ax, ax
4:43B6  74e3                 je 0x439b
4:43B8  66ff76f4             push dword ptr [bp - 0xc]
4:43BC  ff76f2               push word ptr [bp - 0xe]
4:43BF  3d0100               cmp ax, 1
4:43C2  740b                 je 0x43cf
4:43C4  50                   push ax
4:43C5  6a01                 push 1
4:43C7  9a2e61b742           lcall 0x42b7, 0x612e  ; random@s2:612E
4:43CC  83c404               add sp, 4
loc_43CF:
4:43CF  48                   dec ax
4:43D0  50                   push ax
4:43D1  66ff760a             push dword ptr [bp + 0xa]
4:43D5  66ff7606             push dword ptr [bp + 6]
4:43D9  90                   nop
4:43DA  0e                   push cs
4:43DB  e808fb               call 0x3ee6  ; TradeMarket::rebelOffers@s4:3EE6
4:43DE  8956fe               mov word ptr [bp - 2], dx
4:43E1  0bd0                 or dx, ax
4:43E3  74b6                 je 0x439b
4:43E5  8b56fe               mov dx, word ptr [bp - 2]
4:43E8  c9                   leave
4:43E9  ca0c00               retf 0xc

; ---------------- TradeMarket::offerAmount@s4:43EC FAR size=306 callers=1
;   amount of an offer
4:43EC  c8040000             enter 4, 0
4:43F0  8b460a               mov ax, word ptr [bp + 0xa]
4:43F3  eb4f                 jmp 0x4444
4:43F5  db 90
loc_43F6:
4:43F6  c746fc0200           mov word ptr [bp - 4], 2
loc_43FB:
4:43FB  c746fe0000           mov word ptr [bp - 2], 0
4:4400  e91101               jmp 0x4514
4:4403  db 90
loc_4404:
4:4404  c746fc0300           mov word ptr [bp - 4], 3
4:4409  ebf0                 jmp 0x43fb
4:440B  db 90
loc_440C:
4:440C  c746fc0400           mov word ptr [bp - 4], 4
4:4411  ebe8                 jmp 0x43fb
4:4413  db 90
loc_4414:
4:4414  c746fc0500           mov word ptr [bp - 4], 5
4:4419  ebe0                 jmp 0x43fb
4:441B  db 90
loc_441C:
4:441C  c746fc0600           mov word ptr [bp - 4], 6
4:4421  ebd8                 jmp 0x43fb
4:4423  db 90
loc_4424:
4:4424  c746fc0700           mov word ptr [bp - 4], 7
4:4429  ebd0                 jmp 0x43fb
4:442B  db 90
loc_442C:
4:442C  c746fc0800           mov word ptr [bp - 4], 8
4:4431  ebc8                 jmp 0x43fb
4:4433  db 90
loc_4434:
4:4434  c746fc0900           mov word ptr [bp - 4], 9
4:4439  ebc0                 jmp 0x43fb
4:443B  db 90
loc_443C:
4:443C  c746fc0100           mov word ptr [bp - 4], 1
4:4441  ebb8                 jmp 0x43fb
4:4443  db 90
loc_4444:
4:4444  2d0f00               sub ax, 0xf
4:4447  3d5f00               cmp ax, 0x5f
4:444A  77f0                 ja 0x443c
4:444C  03c0                 add ax, ax
4:444E  93                   xchg bx, ax
4:444F  2effa75444           jmp word ptr cs:[bx + 0x4454]
switch_table_4454:
    dw loc_4424
    dw loc_443C
    dw loc_4434
    dw loc_440C
    dw loc_4434
    dw loc_4434
    dw loc_4434
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_4414
    dw loc_4414
    dw loc_4414
    dw loc_441C
    dw loc_441C
    dw loc_441C
    dw loc_443C
    dw loc_442C
    dw loc_442C
    dw loc_442C
    dw loc_43F6
    dw loc_43F6
    dw loc_43F6
    dw loc_4414
    dw loc_4414
    dw loc_443C
    dw loc_443C
    dw loc_4414
    dw loc_4434
    dw loc_4434
    dw loc_4414
    dw loc_4414
    dw loc_440C
    dw loc_440C
    dw loc_441C
    dw loc_441C
    dw loc_4424
    dw loc_4424
    dw loc_443C
    dw loc_4404
    dw loc_4404
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_4404
    dw loc_4404
    dw loc_4404
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_4404
    dw loc_4404
    dw loc_4404
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_440C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_443C
    dw loc_4404
    dw loc_4404
    dw loc_4414
    dw loc_4414
    dw loc_443C
    dw loc_443C
    dw loc_4404
    dw loc_4404
    dw loc_4434
loc_4514:
4:4514  8b46fc               mov ax, word ptr [bp - 4]
4:4517  8b56fe               mov dx, word ptr [bp - 2]
4:451A  c9                   leave
4:451B  ca0600               retf 6

; ---------------- TradeMarket::productPrice@s4:451E FAR size=76 callers=2
;   page 396 product prices
4:451E  c8040000             enter 4, 0
4:4522  8b460a               mov ax, word ptr [bp + 0xa]
4:4525  2d0700               sub ax, 7
4:4528  7426                 je 0x4550
4:452A  48                   dec ax
4:452B  741b                 je 0x4548
4:452D  2d0400               sub ax, 4
4:4530  740a                 je 0x453c
4:4532  48                   dec ax
4:4533  7423                 je 0x4558
4:4535  c746fc0800           mov word ptr [bp - 4], 8
4:453A  eb05                 jmp 0x4541
loc_453C:
4:453C  c746fc1900           mov word ptr [bp - 4], 0x19
loc_4541:
4:4541  c746fe0000           mov word ptr [bp - 2], 0
4:4546  eb18                 jmp 0x4560
loc_4548:
4:4548  c746fc0a00           mov word ptr [bp - 4], 0xa
4:454D  ebf2                 jmp 0x4541
4:454F  db 90
loc_4550:
4:4550  c746fc0900           mov word ptr [bp - 4], 9
4:4555  ebea                 jmp 0x4541
4:4557  db 90
loc_4558:
4:4558  c746fc0300           mov word ptr [bp - 4], 3
4:455D  ebe2                 jmp 0x4541
4:455F  db 90
loc_4560:
4:4560  8b46fc               mov ax, word ptr [bp - 4]
4:4563  8b56fe               mov dx, word ptr [bp - 2]
4:4566  c9                   leave
4:4567  ca0600               retf 6

; ---------------- TradeMarket::resourcePrice@s4:456A FAR size=106 callers=2
;   page 392 resource prices with the swing
4:456A  c8040000             enter 4, 0
4:456E  8b460a               mov ax, word ptr [bp + 0xa]
4:4571  eb25                 jmp 0x4598
4:4573  db 90
loc_4574:
4:4574  c746fc0400           mov word ptr [bp - 4], 4
loc_4579:
4:4579  c746fe0000           mov word ptr [bp - 2], 0
4:457E  eb4a                 jmp 0x45ca
loc_4580:
4:4580  c746fc0300           mov word ptr [bp - 4], 3
4:4585  ebf2                 jmp 0x4579
4:4587  db 90
loc_4588:
4:4588  c746fc0200           mov word ptr [bp - 4], 2
4:458D  ebea                 jmp 0x4579
4:458F  db 90
loc_4590:
4:4590  c746fc0100           mov word ptr [bp - 4], 1
4:4595  ebe2                 jmp 0x4579
4:4597  db 90
loc_4598:
4:4598  2d1100               sub ax, 0x11
4:459B  3d1000               cmp ax, 0x10
4:459E  77f0                 ja 0x4590
4:45A0  03c0                 add ax, ax
4:45A2  93                   xchg bx, ax
4:45A3  2effa7a845           jmp word ptr cs:[bx + 0x45a8]
switch_table_45A8:
    dw loc_4588
    dw loc_4588
    dw loc_4588
    dw loc_4588
    dw loc_4588
    dw loc_4580
    dw loc_4590
    dw loc_4590
    dw loc_4590
    dw loc_4590
    dw loc_4590
    dw loc_4590
    dw loc_4574
    dw loc_4580
    dw loc_4590
    dw loc_4590
    dw loc_4574
loc_45CA:
4:45CA  8b46fc               mov ax, word ptr [bp - 4]
4:45CD  8b56fe               mov dx, word ptr [bp - 2]
4:45D0  c9                   leave
4:45D1  ca0600               retf 6

; ---------------- TradeMarket::robotPrice@s4:45D4 FAR size=52 callers=1
;   3 -> 22, 4 -> 23, else 20
4:45D4  c8040000             enter 4, 0
4:45D8  8b460a               mov ax, word ptr [bp + 0xa]
4:45DB  2d0300               sub ax, 3
4:45DE  740a                 je 0x45ea
4:45E0  48                   dec ax
4:45E1  7413                 je 0x45f6
4:45E3  c746fc1400           mov word ptr [bp - 4], 0x14
4:45E8  eb05                 jmp 0x45ef
loc_45EA:
4:45EA  c746fc1600           mov word ptr [bp - 4], 0x16
loc_45EF:
4:45EF  c746fe0000           mov word ptr [bp - 2], 0
4:45F4  eb08                 jmp 0x45fe
loc_45F6:
4:45F6  c746fc1700           mov word ptr [bp - 4], 0x17
4:45FB  ebf2                 jmp 0x45ef
4:45FD  db 90
loc_45FE:
4:45FE  8b46fc               mov ax, word ptr [bp - 4]
4:4601  8b56fe               mov dx, word ptr [bp - 2]
4:4604  c9                   leave
4:4605  ca0600               retf 6

; ---------------- TradeMarket::findColony@s4:4608 FAR size=222 callers=1
;   colony by name in a list
4:4608  c8200000             enter 0x20, 0
4:460C  c45e06               les bx, ptr [bp + 6]
4:460F  26c49f2201           les bx, ptr es:[bx + 0x122]
4:4614  6626ff770a           push dword ptr es:[bx + 0xa]
4:4619  8d46f8               lea ax, [bp - 8]
4:461C  16                   push ss
4:461D  50                   push ax
4:461E  9a84572b46           lcall 0x462b, 0x5784  ; ListIter::ListIter@s2:5784
loc_4623:
4:4623  8d46f8               lea ax, [bp - 8]
4:4626  16                   push ss
4:4627  50                   push ax
4:4628  9a125b8743           lcall 0x4387, 0x5b12  ; ListIter::next@s2:5B12
4:462D  8946f4               mov word ptr [bp - 0xc], ax
4:4630  8956f6               mov word ptr [bp - 0xa], dx
4:4633  0bd0                 or dx, ax
4:4635  0f84a200             je 0x46db
4:4639  c45ef4               les bx, ptr [bp - 0xc]
4:463C  6626ff7704           push dword ptr es:[bx + 4]
4:4641  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
4:4646  9aece16146           lcall 0x4661, 0xe1ec  ; Db::resolveHandle@s6:E1EC
4:464B  8946ec               mov word ptr [bp - 0x14], ax
4:464E  8956ee               mov word ptr [bp - 0x12], dx
4:4651  c45ef4               les bx, ptr [bp - 0xc]
4:4654  6626ff7708           push dword ptr es:[bx + 8]
4:4659  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
4:465E  9aece13425           lcall 0x2534, 0xe1ec  ; Db::resolveHandle@s6:E1EC
4:4663  8946e8               mov word ptr [bp - 0x18], ax
4:4666  8956ea               mov word ptr [bp - 0x16], dx
4:4669  66ff76ec             push dword ptr [bp - 0x14]
4:466D  9a284d7f46           lcall 0x467f, 0x4d28  ; Colony::name@s8:4D28
4:4672  8946e4               mov word ptr [bp - 0x1c], ax
4:4675  8956e6               mov word ptr [bp - 0x1a], dx
4:4678  66ff76e8             push dword ptr [bp - 0x18]
4:467C  9a284da039           lcall 0x39a0, 0x4d28  ; Colony::name@s8:4D28
4:4681  8946e0               mov word ptr [bp - 0x20], ax
4:4684  8956e2               mov word ptr [bp - 0x1e], dx
4:4687  66ff76e4             push dword ptr [bp - 0x1c]
4:468B  66ff760e             push dword ptr [bp + 0xe]
4:468F  9a7a3da646           lcall 0x46a6, 0x3d7a  ; _fstrcmp@s1:3D7A
4:4694  83c408               add sp, 8
4:4697  0bc0                 or ax, ax
4:4699  7514                 jne 0x46af
4:469B  66ff76e0             push dword ptr [bp - 0x20]
4:469F  66ff760a             push dword ptr [bp + 0xa]
4:46A3  9a7a3dba46           lcall 0x46ba, 0x3d7a  ; _fstrcmp@s1:3D7A
4:46A8  83c408               add sp, 8
4:46AB  0bc0                 or ax, ax
4:46AD  742c                 je 0x46db
loc_46AF:
4:46AF  66ff76e4             push dword ptr [bp - 0x1c]
4:46B3  66ff760a             push dword ptr [bp + 0xa]
4:46B7  9a7a3dd046           lcall 0x46d0, 0x3d7a  ; _fstrcmp@s1:3D7A
4:46BC  83c408               add sp, 8
4:46BF  0bc0                 or ax, ax
4:46C1  0f855eff             jne 0x4623
4:46C5  66ff76e0             push dword ptr [bp - 0x20]
4:46C9  66ff760e             push dword ptr [bp + 0xe]
4:46CD  9a7a3d1c40           lcall 0x401c, 0x3d7a  ; _fstrcmp@s1:3D7A
4:46D2  83c408               add sp, 8
4:46D5  0bc0                 or ax, ax
4:46D7  0f8548ff             jne 0x4623
loc_46DB:
4:46DB  8b46f4               mov ax, word ptr [bp - 0xc]
4:46DE  8b56f6               mov dx, word ptr [bp - 0xa]
4:46E1  c9                   leave
4:46E2  ca0c00               retf 0xc
4:46E5  db 00

; ---------------- TradeMarket::scalar_dtor@s4:46E6 FAR size=58 callers=0
;   deleting destructor
4:46E6  55                   push bp
4:46E7  8bec                 mov bp, sp
4:46E9  66ff7606             push dword ptr [bp + 6]
4:46ED  90                   nop
4:46EE  0e                   push cs
4:46EF  e8c2ec               call 0x33b4  ; TradeMarket::~TradeMarket@s4:33B4
4:46F2  f6460a01             test byte ptr [bp + 0xa], 1
4:46F6  7409                 je 0x4701
4:46F8  66ff7606             push dword ptr [bp + 6]
4:46FC  9ace179246           lcall 0x4692, 0x17ce  ; operator_delete@s1:17CE
loc_4701:
4:4701  8b4606               mov ax, word ptr [bp + 6]
4:4704  8b5608               mov dx, word ptr [bp + 8]
4:4707  c9                   leave
4:4708  ca0600               retf 6
4:470B  db 90 e6 46 1e 47 f2 1d 16 47 ce 1d 1a 47 d4 1d 6b
4:471B  db 41 a4 3e c5 33

; ---------------- MarketEntry::MarketEntry@s4:4720 FAR size=64 callers=7
;   market list entry base (vtable 4AA6): name, object, kind
4:4720  c8040000             enter 4, 0
4:4724  c45e06               les bx, ptr [bp + 6]
4:4727  26c7079a38           mov word ptr es:[bx], 0x389a
4:472C  26c747022146         mov word ptr es:[bx + 2], 0x4621  ; SEGMENT s2:0000
4:4732  668b460e             mov eax, dword ptr [bp + 0xe]
4:4736  c45e06               les bx, ptr [bp + 6]
4:4739  6626894704           mov dword ptr es:[bx + 4], eax
4:473E  668b460a             mov eax, dword ptr [bp + 0xa]
4:4742  6626894708           mov dword ptr es:[bx + 8], eax
4:4747  26c7470c0000         mov word ptr es:[bx + 0xc], 0
4:474D  26c707a64a           mov word ptr es:[bx], 0x4aa6
4:4752  26c747020e47         mov word ptr es:[bx + 2], 0x470e  ; SEGMENT s4:0000
4:4758  8bc3                 mov ax, bx
4:475A  8cc2                 mov dx, es
4:475C  c9                   leave
4:475D  ca0c00               retf 0xc

; ---------------- MarketEntry::~MarketEntry@s4:4760 FAR size=48 callers=8
;   dtor
4:4760  c8080000             enter 8, 0
4:4764  c45e06               les bx, ptr [bp + 6]
4:4767  26c707a64a           mov word ptr es:[bx], 0x4aa6
4:476C  26c747025647         mov word ptr es:[bx + 2], 0x4756  ; SEGMENT s4:0000
4:4772  66268b4704           mov eax, dword ptr es:[bx + 4]
4:4777  6650                 push eax
4:4779  9ace17ff46           lcall 0x46ff, 0x17ce  ; operator_delete@s1:17CE
4:477E  c45e06               les bx, ptr [bp + 6]
4:4781  26c7079a38           mov word ptr es:[bx], 0x389a
4:4786  26c747023047         mov word ptr es:[bx + 2], 0x4730  ; SEGMENT s2:0000
4:478C  c9                   leave
4:478D  ca0400               retf 4

; ---------------- MarketRobot::MarketRobot@s4:4790 FAR size=56 callers=4
;   kind 1: a robot
4:4790  55                   push bp
4:4791  8bec                 mov bp, sp
4:4793  66ff760e             push dword ptr [bp + 0xe]
4:4797  66ff760a             push dword ptr [bp + 0xa]
4:479B  66ff7606             push dword ptr [bp + 6]
4:479F  90                   nop
4:47A0  0e                   push cs
4:47A1  e87cff               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:47A4  8b4612               mov ax, word ptr [bp + 0x12]
4:47A7  c45e06               les bx, ptr [bp + 6]
4:47AA  2689470e             mov word ptr es:[bx + 0xe], ax
4:47AE  26c707924a           mov word ptr es:[bx], 0x4a92
4:47B3  26c747027047         mov word ptr es:[bx + 2], 0x4770  ; SEGMENT s4:0000
4:47B9  26c7470c0100         mov word ptr es:[bx + 0xc], 1
4:47BF  8bc3                 mov ax, bx
4:47C1  8cc2                 mov dx, es
4:47C3  c9                   leave
4:47C4  ca0e00               retf 0xe
4:47C7  db 00

; ---------------- MarketGroup::MarketGroup@s4:47C8 FAR size=64 callers=4
;   kind 2: a building group
4:47C8  55                   push bp
4:47C9  8bec                 mov bp, sp
4:47CB  66ff760e             push dword ptr [bp + 0xe]
4:47CF  66ff760a             push dword ptr [bp + 0xa]
4:47D3  66ff7606             push dword ptr [bp + 6]
4:47D7  90                   nop
4:47D8  0e                   push cs
4:47D9  e844ff               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:47DC  668b4614             mov eax, dword ptr [bp + 0x14]
4:47E0  c45e06               les bx, ptr [bp + 6]
4:47E3  662689470e           mov dword ptr es:[bx + 0xe], eax
4:47E8  8b4612               mov ax, word ptr [bp + 0x12]
4:47EB  26894712             mov word ptr es:[bx + 0x12], ax
4:47EF  26c7079a4a           mov word ptr es:[bx], 0x4a9a
4:47F4  26c74702b747         mov word ptr es:[bx + 2], 0x47b7  ; SEGMENT s4:0000
4:47FA  26c7470c0200         mov word ptr es:[bx + 0xc], 2
4:4800  8bc3                 mov ax, bx
4:4802  8cc2                 mov dx, es
4:4804  c9                   leave
4:4805  ca1200               retf 0x12

; ---------------- MarketBuilding::MarketBuilding@s4:4808 FAR size=58 callers=2
;   kind 3: a building
4:4808  55                   push bp
4:4809  8bec                 mov bp, sp
4:480B  66ff760e             push dword ptr [bp + 0xe]
4:480F  66ff760a             push dword ptr [bp + 0xa]
4:4813  66ff7606             push dword ptr [bp + 6]
4:4817  90                   nop
4:4818  0e                   push cs
4:4819  e804ff               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:481C  668b4612             mov eax, dword ptr [bp + 0x12]
4:4820  c45e06               les bx, ptr [bp + 6]
4:4823  662689470e           mov dword ptr es:[bx + 0xe], eax
4:4828  26c707a24a           mov word ptr es:[bx], 0x4aa2
4:482D  26c74702f847         mov word ptr es:[bx + 2], 0x47f8  ; SEGMENT s4:0000
4:4833  26c7470c0300         mov word ptr es:[bx + 0xc], 3
4:4839  8bc3                 mov ax, bx
4:483B  8cc2                 mov dx, es
4:483D  c9                   leave
4:483E  ca1000               retf 0x10
4:4841  db 00

; ---------------- MarketResource::MarketResource@s4:4842 FAR size=64 callers=3
;   kind 4: a resource
4:4842  55                   push bp
4:4843  8bec                 mov bp, sp
4:4845  66ff760e             push dword ptr [bp + 0xe]
4:4849  66ff760a             push dword ptr [bp + 0xa]
4:484D  66ff7606             push dword ptr [bp + 6]
4:4851  90                   nop
4:4852  0e                   push cs
4:4853  e8cafe               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:4856  8b4612               mov ax, word ptr [bp + 0x12]
4:4859  c45e06               les bx, ptr [bp + 6]
4:485C  2689470e             mov word ptr es:[bx + 0xe], ax
4:4860  6626c7471000000000   mov dword ptr es:[bx + 0x10], 0
4:4869  26c7078e4a           mov word ptr es:[bx], 0x4a8e
4:486E  26c747023148         mov word ptr es:[bx + 2], 0x4831  ; SEGMENT s4:0000
4:4874  26c7470c0400         mov word ptr es:[bx + 0xc], 4
4:487A  8bc3                 mov ax, bx
4:487C  8cc2                 mov dx, es
4:487E  c9                   leave
4:487F  ca0e00               retf 0xe

; ---------------- MarketResource::~MarketResource@s4:4882 FAR size=46 callers=1
;   dtor
4:4882  c8080000             enter 8, 0
4:4886  c45e06               les bx, ptr [bp + 6]
4:4889  26c7078e4a           mov word ptr es:[bx], 0x4a8e
4:488E  26c747027248         mov word ptr es:[bx + 2], 0x4872  ; SEGMENT s4:0000
4:4894  66268b4710           mov eax, dword ptr es:[bx + 0x10]
4:4899  6650                 push eax
4:489B  9ace177c47           lcall 0x477c, 0x17ce  ; operator_delete@s1:17CE
4:48A0  83c404               add sp, 4
4:48A3  66ff7606             push dword ptr [bp + 6]
4:48A7  90                   nop
4:48A8  0e                   push cs
4:48A9  e8b4fe               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:48AC  c9                   leave
4:48AD  ca0400               retf 4

; ---------------- MarketCargo::MarketCargo@s4:48B0 FAR size=56 callers=4
;   kind 5: cargo
4:48B0  55                   push bp
4:48B1  8bec                 mov bp, sp
4:48B3  66ff760e             push dword ptr [bp + 0xe]
4:48B7  66ff760a             push dword ptr [bp + 0xa]
4:48BB  66ff7606             push dword ptr [bp + 6]
4:48BF  90                   nop
4:48C0  0e                   push cs
4:48C1  e85cfe               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:48C4  8b4612               mov ax, word ptr [bp + 0x12]
4:48C7  c45e06               les bx, ptr [bp + 6]
4:48CA  2689470e             mov word ptr es:[bx + 0xe], ax
4:48CE  26c707964a           mov word ptr es:[bx], 0x4a96
4:48D3  26c747029248         mov word ptr es:[bx + 2], 0x4892  ; SEGMENT s4:0000
4:48D9  26c7470c0500         mov word ptr es:[bx + 0xc], 5
4:48DF  8bc3                 mov ax, bx
4:48E1  8cc2                 mov dx, es
4:48E3  c9                   leave
4:48E4  ca0e00               retf 0xe
4:48E7  db 00

; ---------------- MarketProduct::MarketProduct@s4:48E8 FAR size=56 callers=1
;   kind 6: a product
4:48E8  55                   push bp
4:48E9  8bec                 mov bp, sp
4:48EB  66ff760e             push dword ptr [bp + 0xe]
4:48EF  66ff760a             push dword ptr [bp + 0xa]
4:48F3  66ff7606             push dword ptr [bp + 6]
4:48F7  90                   nop
4:48F8  0e                   push cs
4:48F9  e824fe               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:48FC  8b4612               mov ax, word ptr [bp + 0x12]
4:48FF  c45e06               les bx, ptr [bp + 6]
4:4902  2689470e             mov word ptr es:[bx + 0xe], ax
4:4906  26c7079e4a           mov word ptr es:[bx], 0x4a9e
4:490B  26c74702d748         mov word ptr es:[bx + 2], 0x48d7  ; SEGMENT s4:0000
4:4911  26c7470c0600         mov word ptr es:[bx + 0xc], 6
4:4917  8bc3                 mov ax, bx
4:4919  8cc2                 mov dx, es
4:491B  c9                   leave
4:491C  ca0e00               retf 0xe
4:491F  db 00

; ---------------- MarketColony::MarketColony@s4:4920 FAR size=58 callers=2
;   kind 7: a colony
4:4920  55                   push bp
4:4921  8bec                 mov bp, sp
4:4923  66ff760e             push dword ptr [bp + 0xe]
4:4927  66ff760a             push dword ptr [bp + 0xa]
4:492B  66ff7606             push dword ptr [bp + 6]
4:492F  90                   nop
4:4930  0e                   push cs
4:4931  e8ecfd               call 0x4720  ; MarketEntry::MarketEntry@s4:4720
4:4934  668b4612             mov eax, dword ptr [bp + 0x12]
4:4938  c45e06               les bx, ptr [bp + 6]
4:493B  662689470e           mov dword ptr es:[bx + 0xe], eax
4:4940  26c7078a4a           mov word ptr es:[bx], 0x4a8a
4:4945  26c747020f49         mov word ptr es:[bx + 2], 0x490f  ; SEGMENT s4:0000
4:494B  26c7470c0700         mov word ptr es:[bx + 0xc], 7
4:4951  8bc3                 mov ax, bx
4:4953  8cc2                 mov dx, es
4:4955  c9                   leave
4:4956  ca1000               retf 0x10
4:4959  db 00

; ---------------- MarketColony::scalar_dtor@s4:495A FAR size=38 callers=0
;   deleting destructor
4:495A  55                   push bp
4:495B  8bec                 mov bp, sp
4:495D  66ff7606             push dword ptr [bp + 6]
4:4961  90                   nop
4:4962  0e                   push cs
4:4963  e8fafd               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:4966  f6460a01             test byte ptr [bp + 0xa], 1
4:496A  7409                 je 0x4975
4:496C  66ff7606             push dword ptr [bp + 6]
4:4970  9ace179e48           lcall 0x489e, 0x17ce  ; operator_delete@s1:17CE
loc_4975:
4:4975  8b4606               mov ax, word ptr [bp + 6]
4:4978  8b5608               mov dx, word ptr [bp + 8]
4:497B  c9                   leave
4:497C  ca0600               retf 6
4:497F  db 00

; ---------------- MarketRobot::scalar_dtor@s4:4980 FAR size=38 callers=0
;   deleting destructor
4:4980  c8040000             enter 4, 0
4:4984  66ff7606             push dword ptr [bp + 6]
4:4988  90                   nop
4:4989  0e                   push cs
4:498A  e8d3fd               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:498D  f6460a01             test byte ptr [bp + 0xa], 1
4:4991  7409                 je 0x499c
4:4993  66ff7606             push dword ptr [bp + 6]
4:4997  9ace177349           lcall 0x4973, 0x17ce  ; operator_delete@s1:17CE
loc_499C:
4:499C  8b4606               mov ax, word ptr [bp + 6]
4:499F  8b5608               mov dx, word ptr [bp + 8]
4:49A2  c9                   leave
4:49A3  ca0600               retf 6

; ---------------- MarketBuilding::scalar_dtor@s4:49A6 size=38 callers=0
;   deleting destructor
4:49A6  c8040000             enter 4, 0
4:49AA  66ff7606             push dword ptr [bp + 6]
4:49AE  90                   nop
4:49AF  0e                   push cs
4:49B0  e8adfd               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:49B3  f6460a01             test byte ptr [bp + 0xa], 1
4:49B7  7409                 je 0x49c2
4:49B9  66ff7606             push dword ptr [bp + 6]
4:49BD  9ace179a49           lcall 0x499a, 0x17ce  ; operator_delete@s1:17CE
loc_49C2:
4:49C2  8b4606               mov ax, word ptr [bp + 6]
4:49C5  8b5608               mov dx, word ptr [bp + 8]
4:49C8  c9                   leave
4:49C9  ca0600               retf 6

; ---------------- MarketProduct::scalar_dtor@s4:49CC size=38 callers=0
;   deleting destructor
4:49CC  c8040000             enter 4, 0
4:49D0  66ff7606             push dword ptr [bp + 6]
4:49D4  90                   nop
4:49D5  0e                   push cs
4:49D6  e887fd               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:49D9  f6460a01             test byte ptr [bp + 0xa], 1
4:49DD  7409                 je 0x49e8
4:49DF  66ff7606             push dword ptr [bp + 6]
4:49E3  9ace17c049           lcall 0x49c0, 0x17ce  ; operator_delete@s1:17CE
loc_49E8:
4:49E8  8b4606               mov ax, word ptr [bp + 6]
4:49EB  8b5608               mov dx, word ptr [bp + 8]
4:49EE  c9                   leave
4:49EF  ca0600               retf 6

; ---------------- MarketResource::scalar_dtor@s4:49F2 FAR size=38 callers=0
;   deleting destructor
4:49F2  55                   push bp
4:49F3  8bec                 mov bp, sp
4:49F5  66ff7606             push dword ptr [bp + 6]
4:49F9  90                   nop
4:49FA  0e                   push cs
4:49FB  e884fe               call 0x4882  ; MarketResource::~MarketResource@s4:4882
4:49FE  f6460a01             test byte ptr [bp + 0xa], 1
4:4A02  7409                 je 0x4a0d
4:4A04  66ff7606             push dword ptr [bp + 6]
4:4A08  9ace17e649           lcall 0x49e6, 0x17ce  ; operator_delete@s1:17CE
loc_4A0D:
4:4A0D  8b4606               mov ax, word ptr [bp + 6]
4:4A10  8b5608               mov dx, word ptr [bp + 8]
4:4A13  c9                   leave
4:4A14  ca0600               retf 6
4:4A17  db 00

; ---------------- MarketCargo::scalar_dtor@s4:4A18 FAR size=38 callers=0
;   deleting destructor
4:4A18  c8040000             enter 4, 0
4:4A1C  66ff7606             push dword ptr [bp + 6]
4:4A20  90                   nop
4:4A21  0e                   push cs
4:4A22  e83bfd               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:4A25  f6460a01             test byte ptr [bp + 0xa], 1
4:4A29  7409                 je 0x4a34
4:4A2B  66ff7606             push dword ptr [bp + 6]
4:4A2F  9ace170b4a           lcall 0x4a0b, 0x17ce  ; operator_delete@s1:17CE
loc_4A34:
4:4A34  8b4606               mov ax, word ptr [bp + 6]
4:4A37  8b5608               mov dx, word ptr [bp + 8]
4:4A3A  c9                   leave
4:4A3B  ca0600               retf 6

; ---------------- MarketGroup::scalar_dtor@s4:4A3E size=38 callers=0
;   deleting destructor
4:4A3E  c8040000             enter 4, 0
4:4A42  66ff7606             push dword ptr [bp + 6]
4:4A46  90                   nop
4:4A47  0e                   push cs
4:4A48  e815fd               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:4A4B  f6460a01             test byte ptr [bp + 0xa], 1
4:4A4F  7409                 je 0x4a5a
4:4A51  66ff7606             push dword ptr [bp + 6]
4:4A55  9ace17324a           lcall 0x4a32, 0x17ce  ; operator_delete@s1:17CE
loc_4A5A:
4:4A5A  8b4606               mov ax, word ptr [bp + 6]
4:4A5D  8b5608               mov dx, word ptr [bp + 8]
4:4A60  c9                   leave
4:4A61  ca0600               retf 6

; ---------------- MarketEntry::scalar_dtor@s4:4A64 size=70 callers=0
;   deleting destructor
4:4A64  c8040000             enter 4, 0
4:4A68  66ff7606             push dword ptr [bp + 6]
4:4A6C  90                   nop
4:4A6D  0e                   push cs
4:4A6E  e8effc               call 0x4760  ; MarketEntry::~MarketEntry@s4:4760
4:4A71  f6460a01             test byte ptr [bp + 0xa], 1
4:4A75  7409                 je 0x4a80
4:4A77  66ff7606             push dword ptr [bp + 6]
4:4A7B  9ace17584a           lcall 0x4a58, 0x17ce  ; operator_delete@s1:17CE
loc_4A80:
4:4A80  8b4606               mov ax, word ptr [bp + 6]
4:4A83  8b5608               mov dx, word ptr [bp + 8]
4:4A86  c9                   leave
4:4A87  ca0600               retf 6
4:4A8A  db 64 4a 49 49 f2 49 8c 4a 80 49 90 4a 18 4a 94 4a
4:4A9A  db a6 49 98 4a 3e 4a 9c 4a cc 49 a0 4a 5a 49 a4 4a

; ---------------- RegObj25::RegObj25@s4:4AAA FAR size=54 callers=1
;   registry 0x25: command target 0x9A
4:4AAA  55                   push bp
4:4AAB  8bec                 mov bp, sp
4:4AAD  66ff7608             push dword ptr [bp + 8]
4:4AB1  ff7606               push word ptr [bp + 6]
4:4AB4  90                   nop
4:4AB5  0e                   push cs
4:4AB6  e82102               call 0x4cda  ; CmdTarget::CmdTarget@s4:4CDA
4:4AB9  c45e06               les bx, ptr [bp + 6]
4:4ABC  26c707064b           mov word ptr es:[bx], 0x4b06
4:4AC1  26c74702a84a         mov word ptr es:[bx + 2], 0x4aa8  ; SEGMENT s4:0000
4:4AC7  689a00               push 0x9a
4:4ACA  06                   push es
4:4ACB  53                   push bx
4:4ACC  90                   nop
4:4ACD  0e                   push cs
4:4ACE  e8fd02               call 0x4dce  ; CmdTarget::setCommand@s4:4DCE
4:4AD1  668b4606             mov eax, dword ptr [bp + 6]
4:4AD5  8b5608               mov dx, word ptr [bp + 8]
4:4AD8  66a33042             mov dword ptr [0x4230], eax
4:4ADC  c9                   leave
4:4ADD  ca0600               retf 6

; ---------------- RegObj25::scalar_dtor@s4:4AE0 size=62 callers=0
;   deleting destructor
4:4AE0  c8040000             enter 4, 0
4:4AE4  66ff7606             push dword ptr [bp + 6]
4:4AE8  90                   nop
4:4AE9  0e                   push cs
4:4AEA  e83502               call 0x4d22  ; CmdTarget::~CmdTarget@s4:4D22
4:4AED  f6460a01             test byte ptr [bp + 0xa], 1
4:4AF1  7409                 je 0x4afc
4:4AF3  66ff7606             push dword ptr [bp + 6]
4:4AF7  9ace177e4a           lcall 0x4a7e, 0x17ce  ; operator_delete@s1:17CE
loc_4AFC:
4:4AFC  8b4606               mov ax, word ptr [bp + 6]
4:4AFF  8b5608               mov dx, word ptr [bp + 8]
4:4B02  c9                   leave
4:4B03  ca0600               retf 6
4:4B06  db e0 4a 18 4b f2 1d 10 4b ce 1d 14 4b d4 1d 12 47
4:4B16  db 04 4e 1c 4b 18 4f c5 4a

; ---------------- WindowModel::WindowModel@s4:4B1E FAR size=90 callers=4
;   apis: USER.GetSystemMetrics
;   model of a window (vtable 4C9E): id +0x12, frame metrics
4:4B1E  55                   push bp
4:4B1F  8bec                 mov bp, sp
4:4B21  ff760c               push word ptr [bp + 0xc]
4:4B24  66ff7606             push dword ptr [bp + 6]
4:4B28  9a481d0c4b           lcall 0x4b0c, 0x1d48  ; RegObj::RegObj@s3:1D48
4:4B2D  8b460a               mov ax, word ptr [bp + 0xa]
4:4B30  c45e06               les bx, ptr [bp + 6]
4:4B33  26894712             mov word ptr es:[bx + 0x12], ax
4:4B37  26c747140000         mov word ptr es:[bx + 0x14], 0
4:4B3D  26c7079e4c           mov word ptr es:[bx], 0x4c9e
4:4B42  26c74702084b         mov word ptr es:[bx + 2], 0x4b08  ; SEGMENT s4:0000
4:4B48  833e6c4100           cmp word ptr [0x416c], 0
4:4B4D  751e                 jne 0x4b6d
4:4B4F  6a04                 push 4
4:4B51  9a5c4b0000           lcall 0, 0x4b5c  ; USER.GetSystemMetrics
4:4B56  a36c41               mov word ptr [0x416c], ax
4:4B59  6a05                 push 5
4:4B5B  9a664b0000           lcall 0, 0x4b66  ; USER.GetSystemMetrics
4:4B60  a36e41               mov word ptr [0x416e], ax
4:4B63  6a06                 push 6
4:4B65  9aae2f0000           lcall 0, 0x2fae  ; USER.GetSystemMetrics
4:4B6A  a37041               mov word ptr [0x4170], ax
loc_4B6D:
4:4B6D  8b4606               mov ax, word ptr [bp + 6]
4:4B70  8b5608               mov dx, word ptr [bp + 8]
4:4B73  c9                   leave
4:4B74  ca0800               retf 8
4:4B77  db 00

; ---------------- WindowModel::restorePlace@s4:4B78 FAR size=180 callers=2
;   (vslot 6) the saved window place
4:4B78  c8080000             enter 8, 0
4:4B7C  57                   push di
4:4B7D  56                   push si
4:4B7E  666800000800         push 0x80000
4:4B84  8b4606               mov ax, word ptr [bp + 6]
4:4B87  8b5608               mov dx, word ptr [bp + 8]
4:4B8A  050a00               add ax, 0xa
4:4B8D  52                   push dx
4:4B8E  50                   push ax
4:4B8F  8bf0                 mov si, ax
4:4B91  8bfa                 mov di, dx
4:4B93  9a0649ad4b           lcall 0x4bad, 0x4906  ; _fmemset@s1:4906
4:4B98  83c408               add sp, 8
4:4B9B  666800000800         push 0x80000
4:4BA1  668b4606             mov eax, dword ptr [bp + 6]
4:4BA5  051800               add ax, 0x18
4:4BA8  6650                 push eax
4:4BAA  9a0649fa4a           lcall 0x4afa, 0x4906  ; _fmemset@s1:4906
4:4BAF  83c408               add sp, 8
4:4BB2  6a02                 push 2
4:4BB4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:4BB9  9aba20cc4b           lcall 0x4bcc, 0x20ba  ; Registry_get@s3:20BA
4:4BBE  c45e06               les bx, ptr [bp + 6]
4:4BC1  26ff7712             push word ptr es:[bx + 0x12]
4:4BC5  6a00                 push 0
4:4BC7  52                   push dx
4:4BC8  50                   push ax
4:4BC9  9a7a5f2b4b           lcall 0x4b2b, 0x5f7a  ; Options::hasWindowPlace@s3:5F7A
4:4BCE  8956fa               mov word ptr [bp - 6], dx
4:4BD1  0bd0                 or dx, ax
4:4BD3  7411                 je 0x4be6
4:4BD5  8b56fa               mov dx, word ptr [bp - 6]
4:4BD8  1e                   push ds
4:4BD9  57                   push di
4:4BDA  8bfe                 mov di, si
4:4BDC  8bf0                 mov si, ax
4:4BDE  07                   pop es
4:4BDF  8eda                 mov ds, dx
4:4BE1  66a5                 movsd dword ptr es:[di], dword ptr [si]
4:4BE3  66a5                 movsd dword ptr es:[di], dword ptr [si]
4:4BE5  1f                   pop ds
loc_4BE6:
4:4BE6  c45e06               les bx, ptr [bp + 6]
4:4BE9  06                   push es
4:4BEA  53                   push bx
4:4BEB  26c41f               les bx, ptr es:[bx]
4:4BEE  26ff5f20             lcall es:[bx + 0x20]
4:4BF2  c45e06               les bx, ptr [bp + 6]
4:4BF5  26837f0e00           cmp word ptr es:[bx + 0xe], 0
4:4BFA  7517                 jne 0x4c13
4:4BFC  26837f1000           cmp word ptr es:[bx + 0x10], 0
4:4C01  7510                 jne 0x4c13
4:4C03  268b4718             mov ax, word ptr es:[bx + 0x18]
4:4C07  2689470a             mov word ptr es:[bx + 0xa], ax
4:4C0B  268b471a             mov ax, word ptr es:[bx + 0x1a]
4:4C0F  2689470c             mov word ptr es:[bx + 0xc], ax
loc_4C13:
4:4C13  c45e06               les bx, ptr [bp + 6]
4:4C16  268b471c             mov ax, word ptr es:[bx + 0x1c]
4:4C1A  2689470e             mov word ptr es:[bx + 0xe], ax
4:4C1E  268b471e             mov ax, word ptr es:[bx + 0x1e]
4:4C22  26894710             mov word ptr es:[bx + 0x10], ax
4:4C26  5e                   pop si
4:4C27  5f                   pop di
4:4C28  c9                   leave
4:4C29  ca0400               retf 4

; ---------------- WindowModel::savePlace@s4:4C2C size=76 callers=0
;   (vslot 5) stores the window place
4:4C2C  c8040000             enter 4, 0
4:4C30  57                   push di
4:4C31  56                   push si
4:4C32  8b4606               mov ax, word ptr [bp + 6]
4:4C35  8b5608               mov dx, word ptr [bp + 8]
4:4C38  050a00               add ax, 0xa
4:4C3B  8b5e0a               mov bx, word ptr [bp + 0xa]
4:4C3E  8b760c               mov si, word ptr [bp + 0xc]
4:4C41  1e                   push ds
4:4C42  56                   push si
4:4C43  8bf8                 mov di, ax
4:4C45  8bf3                 mov si, bx
4:4C47  8ec2                 mov es, dx
4:4C49  1f                   pop ds
4:4C4A  66a5                 movsd dword ptr es:[di], dword ptr [si]
4:4C4C  66a5                 movsd dword ptr es:[di], dword ptr [si]
4:4C4E  1f                   pop ds
4:4C4F  6a02                 push 2
4:4C51  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:4C56  8bf0                 mov si, ax
4:4C58  8bfa                 mov di, dx
4:4C5A  9aba206f4c           lcall 0x4c6f, 0x20ba  ; Registry_get@s3:20BA
4:4C5F  c45e06               les bx, ptr [bp + 6]
4:4C62  26ff7712             push word ptr es:[bx + 0x12]
4:4C66  57                   push di
4:4C67  56                   push si
4:4C68  6a00                 push 0
4:4C6A  52                   push dx
4:4C6B  50                   push ax
4:4C6C  9ab05fbc4b           lcall 0x4bbc, 0x5fb0  ; Options::setWindowPlace@s3:5FB0
4:4C71  5e                   pop si
4:4C72  5f                   pop di
4:4C73  c9                   leave
4:4C74  ca0800               retf 8
4:4C77  db 00

; ---------------- WindowModel::scalar_dtor@s4:4C78 FAR size=98 callers=0
;   deleting destructor
4:4C78  c8040000             enter 4, 0
4:4C7C  66ff7606             push dword ptr [bp + 6]
4:4C80  9a801d5d4c           lcall 0x4c5d, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:4C85  f6460a01             test byte ptr [bp + 0xa], 1
4:4C89  7409                 je 0x4c94
4:4C8B  66ff7606             push dword ptr [bp + 6]
4:4C8F  9ace17964b           lcall 0x4b96, 0x17ce  ; operator_delete@s1:17CE
loc_4C94:
4:4C94  8b4606               mov ax, word ptr [bp + 6]
4:4C97  8b5608               mov dx, word ptr [bp + 8]
4:4C9A  c9                   leave
4:4C9B  ca0600               retf 6
4:4C9E  db 78 4c b4 4c f2 1d a8 4c ce 1d ac 4c d4 1d b0 4c
4:4CAE  db a0 49 bc 4c 2c 4c b8 4c 78 4b c0 4c b0 49 c4 4c
4:4CBE  db 76 1f 46 4b c0 49 c8 4c ce 49 cc 4c e0 49 d0 4c
4:4CCE  db ee 49 d4 4c 00 4a d8 4c 12 4a 83 4c

; ---------------- CmdTarget::CmdTarget@s4:4CDA FAR size=72 callers=8
;   a registry object with a DIB DC (vtable 5058)
4:4CDA  55                   push bp
4:4CDB  8bec                 mov bp, sp
4:4CDD  66ff7608             push dword ptr [bp + 8]
4:4CE1  ff7606               push word ptr [bp + 6]
4:4CE4  9a481da44c           lcall 0x4ca4, 0x1d48  ; RegObj::RegObj@s3:1D48
4:4CE9  c45e06               les bx, ptr [bp + 6]
4:4CEC  662bc0               sub eax, eax
4:4CEF  662689470a           mov dword ptr es:[bx + 0xa], eax
4:4CF4  662689470e           mov dword ptr es:[bx + 0xe], eax
4:4CF9  26894712             mov word ptr es:[bx + 0x12], ax
4:4CFD  26894714             mov word ptr es:[bx + 0x14], ax
4:4D01  26894716             mov word ptr es:[bx + 0x16], ax
4:4D05  26c747180100         mov word ptr es:[bx + 0x18], 1
4:4D0B  2689471a             mov word ptr es:[bx + 0x1a], ax
4:4D0F  26c7075850           mov word ptr es:[bx], 0x5058
4:4D14  26c74702a04c         mov word ptr es:[bx + 2], 0x4ca0  ; SEGMENT s4:0000
4:4D1A  8bc3                 mov ax, bx
4:4D1C  8cc2                 mov dx, es
4:4D1E  c9                   leave
4:4D1F  ca0600               retf 6

; ---------------- CmdTarget::~CmdTarget@s4:4D22 FAR size=142 callers=9
;   apis: GDI.DeleteDC, GDI.DeleteObject, USER.SelectPalette
;   releases the DC, palette and bitmap
4:4D22  c8080000             enter 8, 0
4:4D26  c45e06               les bx, ptr [bp + 6]
4:4D29  26c7075850           mov word ptr es:[bx], 0x5058
4:4D2E  26c74702184d         mov word ptr es:[bx + 2], 0x4d18  ; SEGMENT s4:0000
4:4D34  26837f1200           cmp word ptr es:[bx + 0x12], 0
4:4D39  7421                 je 0x4d5c
4:4D3B  26ff7712             push word ptr es:[bx + 0x12]
4:4D3F  26ff771a             push word ptr es:[bx + 0x1a]
4:4D43  6a00                 push 0
4:4D45  9affff0000           lcall 0, 0xffff  ; USER.SelectPalette
4:4D4A  50                   push ax
4:4D4B  9affff0000           lcall 0, 0xffff  ; GDI.DeleteObject
4:4D50  c45e06               les bx, ptr [bp + 6]
4:4D53  26ff7712             push word ptr es:[bx + 0x12]
4:4D57  9affff0000           lcall 0, 0xffff  ; GDI.DeleteDC
loc_4D5C:
4:4D5C  c45e06               les bx, ptr [bp + 6]
4:4D5F  268b470a             mov ax, word ptr es:[bx + 0xa]
4:4D63  268b570c             mov dx, word ptr es:[bx + 0xc]
4:4D67  8bda                 mov bx, dx
4:4D69  0bd8                 or bx, ax
4:4D6B  740e                 je 0x4d7b
4:4D6D  6a01                 push 1
4:4D6F  52                   push dx
4:4D70  50                   push ax
4:4D71  8ec2                 mov es, dx
4:4D73  8bd8                 mov bx, ax
4:4D75  26c41f               les bx, ptr es:[bx]
4:4D78  26ff1f               lcall es:[bx]
loc_4D7B:
4:4D7B  c45e06               les bx, ptr [bp + 6]
4:4D7E  268b470e             mov ax, word ptr es:[bx + 0xe]
4:4D82  268b5710             mov dx, word ptr es:[bx + 0x10]
4:4D86  8bda                 mov bx, dx
4:4D88  0bd8                 or bx, ax
4:4D8A  740e                 je 0x4d9a
4:4D8C  6a01                 push 1
4:4D8E  52                   push dx
4:4D8F  50                   push ax
4:4D90  8ec2                 mov es, dx
4:4D92  8bd8                 mov bx, ax
4:4D94  26c41f               les bx, ptr es:[bx]
4:4D97  26ff1f               lcall es:[bx]
loc_4D9A:
4:4D9A  66c706304200000000   mov dword ptr [0x4230], 0
4:4DA3  66ff7606             push dword ptr [bp + 6]
4:4DA7  9a801de74c           lcall 0x4ce7, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:4DAC  c9                   leave
4:4DAD  ca0400               retf 4

; ---------------- CmdTarget::getDC@s4:4DB0 FAR size=30 callers=8
;   apis: USER.GetDC
;   GetDC of the window
4:4DB0  55                   push bp
4:4DB1  8bec                 mov bp, sp
4:4DB3  8b460a               mov ax, word ptr [bp + 0xa]
4:4DB6  c45e06               les bx, ptr [bp + 6]
4:4DB9  26894716             mov word ptr es:[bx + 0x16], ax
4:4DBD  50                   push ax
4:4DBE  9affff0000           lcall 0, 0xffff  ; USER.GetDC
4:4DC3  c45e06               les bx, ptr [bp + 6]
4:4DC6  26894714             mov word ptr es:[bx + 0x14], ax
4:4DCA  c9                   leave
4:4DCB  ca0600               retf 6

; ---------------- CmdTarget::setCommand@s4:4DCE FAR size=54 callers=8
;   command id, palette from registry 0x48
4:4DCE  c81c0000             enter 0x1c, 0
4:4DD2  6a48                 push 0x48
4:4DD4  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:4DD9  9aba20aa4d           lcall 0x4daa, 0x20ba  ; Registry_get@s3:20BA
4:4DDE  8bd8                 mov bx, ax
4:4DE0  8ec2                 mov es, dx
4:4DE2  268b470a             mov ax, word ptr es:[bx + 0xa]
4:4DE6  8946fa               mov word ptr [bp - 6], ax
4:4DE9  268b470c             mov ax, word ptr es:[bx + 0xc]
4:4DED  ff76fa               push word ptr [bp - 6]
4:4DF0  50                   push ax
4:4DF1  ff760a               push word ptr [bp + 0xa]
4:4DF4  c45e06               les bx, ptr [bp + 6]
4:4DF7  06                   push es
4:4DF8  53                   push bx
4:4DF9  26c41f               les bx, ptr es:[bx]
4:4DFC  26ff5f10             lcall es:[bx + 0x10]
4:4E00  c9                   leave
4:4E01  ca0600               retf 6

; ---------------- CmdTarget::paint@s4:4E04 FAR size=276 callers=1
;   apis: GDI.CreateDC
;   (vslot 4) draws its DIB (CreateDC "dib")
4:4E04  c8120000             enter 0x12, 0
4:4E08  56                   push si
4:4E09  ff760a               push word ptr [bp + 0xa]
4:4E0C  c45e06               les bx, ptr [bp + 6]
4:4E0F  06                   push es
4:4E10  53                   push bx
4:4E11  26c41f               les bx, ptr es:[bx]
4:4E14  26ff5f14             lcall es:[bx + 0x14]
4:4E18  c45e06               les bx, ptr [bp + 6]
4:4E1B  6626ff770a           push dword ptr es:[bx + 0xa]
4:4E20  9a7247364e           lcall 0x4e36, 0x4772  ; DIB::rect@s2:4772
4:4E25  8946f8               mov word ptr [bp - 8], ax
4:4E28  8956fa               mov word ptr [bp - 6], dx
4:4E2B  c45e06               les bx, ptr [bp + 6]
4:4E2E  6626ff770a           push dword ptr es:[bx + 0xa]
4:4E33  9acc438a47           lcall 0x478a, 0x43cc  ; DIB::width@s2:43CC
4:4E38  1e                   push ds
4:4E39  683442               push 0x4234  ; 'dib'
4:4E3C  666a00               push 0
4:4E3F  666a00               push 0
4:4E42  66ff76f8             push dword ptr [bp - 8]
4:4E46  9affff0000           lcall 0, 0xffff  ; GDI.CreateDC
4:4E4B  c45e06               les bx, ptr [bp + 6]
4:4E4E  26894712             mov word ptr es:[bx + 0x12], ax
4:4E52  8d4712               lea ax, [bx + 0x12]
4:4E55  06                   push es
4:4E56  50                   push ax
4:4E57  6626ff770a           push dword ptr es:[bx + 0xa]
4:4E5C  26c45f0a             les bx, ptr es:[bx + 0xa]
4:4E60  26c41f               les bx, ptr es:[bx]
4:4E63  26ff5f08             lcall es:[bx + 8]
4:4E67  c45e06               les bx, ptr [bp + 6]
4:4E6A  2689471a             mov word ptr es:[bx + 0x1a], ax
4:4E6E  833e2e4200           cmp word ptr [0x422e], 0
4:4E73  0f849600             je 0x4f0d
4:4E77  817e0e8002           cmp word ptr [bp + 0xe], 0x280
4:4E7C  0f8e8d00             jle 0x4f0d
4:4E80  c746f20000           mov word ptr [bp - 0xe], 0
4:4E85  eb37                 jmp 0x4ebe
4:4E87  db 90
loc_4E88:
4:4E88  666880020000         push 0x280
4:4E8E  660fbf460e           movsx eax, word ptr [bp + 0xe]
4:4E93  6640                 inc eax
4:4E95  6650                 push eax
4:4E97  8b5ef2               mov bx, word ptr [bp - 0xe]
4:4E9A  03db                 add bx, bx
4:4E9C  660fbf877241         movsx eax, word ptr [bx + 0x4172]
4:4EA2  8bf3                 mov si, bx
4:4EA4  6659                 pop ecx
4:4EA6  66f7e9               imul ecx
4:4EA9  6659                 pop ecx
4:4EAB  6699                 cdq
4:4EAD  66f7f9               idiv ecx
4:4EB0  668bd0               mov edx, eax
4:4EB3  66c1ea10             shr edx, 0x10
4:4EB7  89847241             mov word ptr [si + 0x4172], ax
4:4EBB  ff46f2               inc word ptr [bp - 0xe]
loc_4EBE:
4:4EBE  a11642               mov ax, word ptr [0x4216]
4:4EC1  40                   inc ax
4:4EC2  3b46f2               cmp ax, word ptr [bp - 0xe]
4:4EC5  7fc1                 jg 0x4e88
4:4EC7  c746f20000           mov word ptr [bp - 0xe], 0
4:4ECC  eb36                 jmp 0x4f04
loc_4ECE:
4:4ECE  6668e0010000         push 0x1e0
4:4ED4  660fbf460c           movsx eax, word ptr [bp + 0xc]
4:4ED9  6640                 inc eax
4:4EDB  6650                 push eax
4:4EDD  8b5ef2               mov bx, word ptr [bp - 0xe]
4:4EE0  03db                 add bx, bx
4:4EE2  660fbf879a41         movsx eax, word ptr [bx + 0x419a]
4:4EE8  8bf3                 mov si, bx
4:4EEA  6659                 pop ecx
4:4EEC  66f7e9               imul ecx
4:4EEF  6659                 pop ecx
4:4EF1  6699                 cdq
4:4EF3  66f7f9               idiv ecx
4:4EF6  668bd0               mov edx, eax
4:4EF9  66c1ea10             shr edx, 0x10
4:4EFD  89849a41             mov word ptr [si + 0x419a], ax
4:4F01  ff46f2               inc word ptr [bp - 0xe]
loc_4F04:
4:4F04  a12c42               mov ax, word ptr [0x422c]
4:4F07  40                   inc ax
4:4F08  3b46f2               cmp ax, word ptr [bp - 0xe]
4:4F0B  7fc1                 jg 0x4ece
loc_4F0D:
4:4F0D  c7062e420000         mov word ptr [0x422e], 0
4:4F13  5e                   pop si
4:4F14  c9                   leave
4:4F15  ca0a00               retf 0xa

; ---------------- CmdTarget::loadPicture@s4:4F18 size=282 callers=0
;   apis: USER.GetClientRect
;   (vslot 5) the catalog picture into a DIB
4:4F18  c8180000             enter 0x18, 0
4:4F1C  56                   push si
4:4F1D  ff760a               push word ptr [bp + 0xa]
4:4F20  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:4F25  9a0a83dc4d           lcall 0x4ddc, 0x830a  ; ResLibr::picture@s3:830A
4:4F2A  8946fc               mov word ptr [bp - 4], ax
4:4F2D  8956fe               mov word ptr [bp - 2], dx
4:4F30  52                   push dx
4:4F31  c45efc               les bx, ptr [bp - 4]
4:4F34  50                   push ax
4:4F35  26c41f               les bx, ptr es:[bx]
4:4F38  26ff5f14             lcall es:[bx + 0x14]
4:4F3C  8946f8               mov word ptr [bp - 8], ax
4:4F3F  8956fa               mov word ptr [bp - 6], dx
4:4F42  c45e06               les bx, ptr [bp + 6]
4:4F45  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
4:4F4B  7425                 je 0x4f72
4:4F4D  66268b470e           mov eax, dword ptr es:[bx + 0xe]
4:4F52  268b5710             mov dx, word ptr es:[bx + 0x10]
4:4F56  668946e8             mov dword ptr [bp - 0x18], eax
4:4F5A  668946ec             mov dword ptr [bp - 0x14], eax
4:4F5E  8bda                 mov bx, dx
4:4F60  0bd0                 or dx, ax
4:4F62  740e                 je 0x4f72
4:4F64  6a01                 push 1
4:4F66  53                   push bx
4:4F67  50                   push ax
4:4F68  8ec3                 mov es, bx
4:4F6A  8bf0                 mov si, ax
4:4F6C  26c41c               les bx, ptr es:[si]
4:4F6F  26ff1f               lcall es:[bx]
loc_4F72:
4:4F72  6a14                 push 0x14
4:4F74  9a9c17c44f           lcall 0x4fc4, 0x179c  ; operator_new@s1:179C
4:4F79  83c402               add sp, 2
4:4F7C  8946e8               mov word ptr [bp - 0x18], ax
4:4F7F  8956ea               mov word ptr [bp - 0x16], dx
4:4F82  0bd0                 or dx, ax
4:4F84  740c                 je 0x4f92
4:4F86  ff76ea               push word ptr [bp - 0x16]
4:4F89  50                   push ax
4:4F8A  9a584caf4f           lcall 0x4faf, 0x4c58  ; MemBlock::MemBlock@s2:4C58
4:4F8F  eb04                 jmp 0x4f95
4:4F91  db 90
loc_4F92:
4:4F92  33c0                 xor ax, ax
4:4F94  99                   cdq
loc_4F95:
4:4F95  c45e06               les bx, ptr [bp + 6]
4:4F98  2689470e             mov word ptr es:[bx + 0xe], ax
4:4F9C  26895710             mov word ptr es:[bx + 0x10], dx
4:4FA0  66ff76f8             push dword ptr [bp - 8]
4:4FA4  c45e06               les bx, ptr [bp + 6]
4:4FA7  6626ff770e           push dword ptr es:[bx + 0xe]
4:4FAC  9a844df24f           lcall 0x4ff2, 0x4d84  ; MemBlock::copyFrom@s2:4D84
4:4FB1  ff369603             push word ptr [0x396]
4:4FB5  8d46f0               lea ax, [bp - 0x10]
4:4FB8  16                   push ss
4:4FB9  50                   push ax
4:4FBA  9a232a0000           lcall 0, 0x2a23  ; USER.GetClientRect
4:4FBF  6a1e                 push 0x1e
4:4FC1  9a9c17924c           lcall 0x4c92, 0x179c  ; operator_new@s1:179C
4:4FC6  83c402               add sp, 2
4:4FC9  8946ec               mov word ptr [bp - 0x14], ax
4:4FCC  8956ee               mov word ptr [bp - 0x12], dx
4:4FCF  0bd0                 or dx, ax
4:4FD1  742f                 je 0x5002
4:4FD3  8b46f4               mov ax, word ptr [bp - 0xc]
4:4FD6  2b46f0               sub ax, word ptr [bp - 0x10]
4:4FD9  40                   inc ax
4:4FDA  50                   push ax
4:4FDB  8b46f6               mov ax, word ptr [bp - 0xa]
4:4FDE  2b46f2               sub ax, word ptr [bp - 0xe]
4:4FE1  40                   inc ax
4:4FE2  50                   push ax
4:4FE3  c45e06               les bx, ptr [bp + 6]
4:4FE6  6626ff770e           push dword ptr es:[bx + 0xe]
4:4FEB  66ff76ec             push dword ptr [bp - 0x14]
4:4FEF  9a5c40234e           lcall 0x4e23, 0x405c  ; DIB::DIB(w,h,bpp)@s2:405C
4:4FF4  c45e06               les bx, ptr [bp + 6]
4:4FF7  2689470a             mov word ptr es:[bx + 0xa], ax
4:4FFB  2689570c             mov word ptr es:[bx + 0xc], dx
4:4FFF  eb0d                 jmp 0x500e
4:5001  db 90
loc_5002:
4:5002  c45e06               les bx, ptr [bp + 6]
4:5005  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
loc_500E:
4:500E  668b46fc             mov eax, dword ptr [bp - 4]
4:5012  668946ec             mov dword ptr [bp - 0x14], eax
4:5016  668946e8             mov dword ptr [bp - 0x18], eax
4:501A  660bc0               or eax, eax
4:501D  740d                 je 0x502c
4:501F  6a01                 push 1
4:5021  c45efc               les bx, ptr [bp - 4]
4:5024  06                   push es
4:5025  50                   push ax
4:5026  26c41f               les bx, ptr es:[bx]
4:5029  26ff1f               lcall es:[bx]
loc_502C:
4:502C  5e                   pop si
4:502D  c9                   leave
4:502E  ca0600               retf 6
4:5031  db 00

; ---------------- CmdTarget::scalar_dtor@s4:5032 FAR size=62 callers=0
;   deleting destructor
4:5032  55                   push bp
4:5033  8bec                 mov bp, sp
4:5035  66ff7606             push dword ptr [bp + 6]
4:5039  90                   nop
4:503A  0e                   push cs
4:503B  e8e4fc               call 0x4d22  ; CmdTarget::~CmdTarget@s4:4D22
4:503E  f6460a01             test byte ptr [bp + 0xa], 1
4:5042  7409                 je 0x504d
4:5044  66ff7606             push dword ptr [bp + 6]
4:5048  9ace17774f           lcall 0x4f77, 0x17ce  ; operator_delete@s1:17CE
loc_504D:
4:504D  8b4606               mov ax, word ptr [bp + 6]
4:5050  8b5608               mov dx, word ptr [bp + 8]
4:5053  c9                   leave
4:5054  ca0600               retf 6
4:5057  db 90 32 50 6a 50 f2 1d 62 50 ce 1d 66 50 d4 1d 28
4:5067  db 4f 04 4e 6e 50 18 4f 32 4d

; ---------------- RegObj3E::RegObj3E@s4:5070 FAR size=60 callers=1
;   registry 0x3E: a list holder (vtable 56D2)
4:5070  55                   push bp
4:5071  8bec                 mov bp, sp
4:5073  66ff7608             push dword ptr [bp + 8]
4:5077  ff7606               push word ptr [bp + 6]
4:507A  9a481d5e50           lcall 0x505e, 0x1d48  ; RegObj::RegObj@s3:1D48
4:507F  c45e06               les bx, ptr [bp + 6]
4:5082  662bc0               sub eax, eax
4:5085  662689470a           mov dword ptr es:[bx + 0xa], eax
4:508A  662689470e           mov dword ptr es:[bx + 0xe], eax
4:508F  6626894712           mov dword ptr es:[bx + 0x12], eax
4:5094  26894716             mov word ptr es:[bx + 0x16], ax
4:5098  26c707d256           mov word ptr es:[bx], 0x56d2
4:509D  26c747025a50         mov word ptr es:[bx + 2], 0x505a  ; SEGMENT s4:0000
4:50A3  8bc3                 mov ax, bx
4:50A5  8cc2                 mov dx, es
4:50A7  c9                   leave
4:50A8  ca0600               retf 6
4:50AB  db 00

; ---------------- RegObj3E::~RegObj3E@s4:50AC FAR size=62 callers=1
;   dtor
4:50AC  c8080000             enter 8, 0
4:50B0  56                   push si
4:50B1  c45e06               les bx, ptr [bp + 6]
4:50B4  26c707d256           mov word ptr es:[bx], 0x56d2
4:50B9  26c74702a150         mov word ptr es:[bx + 2], 0x50a1  ; SEGMENT s4:0000
4:50BF  268b470e             mov ax, word ptr es:[bx + 0xe]
4:50C3  268b5710             mov dx, word ptr es:[bx + 0x10]
4:50C7  8bda                 mov bx, dx
4:50C9  0bd0                 or dx, ax
4:50CB  740e                 je 0x50db
4:50CD  6a01                 push 1
4:50CF  53                   push bx
4:50D0  50                   push ax
4:50D1  8ec3                 mov es, bx
4:50D3  8bf0                 mov si, ax
4:50D5  26c41c               les bx, ptr es:[si]
4:50D8  26ff1f               lcall es:[bx]
loc_50DB:
4:50DB  66ff7606             push dword ptr [bp + 6]
4:50DF  9a801d7d50           lcall 0x507d, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:50E4  5e                   pop si
4:50E5  c9                   leave
4:50E6  ca0400               retf 4
4:50E9  db 00

; ---------------- CargoList::CargoList@s4:50EA FAR size=232 callers=1
;   cargo list for the transfer window
4:50EA  c8200000             enter 0x20, 0
4:50EE  66a1a268             mov eax, dword ptr [0x68a2]
4:50F2  6650                 push eax
4:50F4  9afc074b50           lcall 0x504b, 0x7fc  ; SH_MemAllocFS@s1:07FC
4:50F9  8946f8               mov word ptr [bp - 8], ax
4:50FC  8956fa               mov word ptr [bp - 6], dx
4:50FF  0bd0                 or dx, ax
4:5101  743d                 je 0x5140
4:5103  c45ef8               les bx, ptr [bp - 8]
4:5106  26c7079a38           mov word ptr es:[bx], 0x389a
4:510B  26c747028d4f         mov word ptr es:[bx + 2], 0x4f8d  ; SEGMENT s2:0000
4:5111  33c0                 xor ax, ax
4:5113  c45ef8               les bx, ptr [bp - 8]
4:5116  26894704             mov word ptr es:[bx + 4], ax
4:511A  26894706             mov word ptr es:[bx + 6], ax
4:511E  26894708             mov word ptr es:[bx + 8], ax
4:5122  2689470a             mov word ptr es:[bx + 0xa], ax
4:5126  2689470c             mov word ptr es:[bx + 0xc], ax
4:512A  26c707ce56           mov word ptr es:[bx], 0x56ce
4:512F  26c74702bd50         mov word ptr es:[bx + 2], 0x50bd  ; SEGMENT s4:0000
4:5135  668b46f8             mov eax, dword ptr [bp - 8]
4:5139  668946fc             mov dword ptr [bp - 4], eax
4:513D  eb09                 jmp 0x5148
4:513F  db 90
loc_5140:
4:5140  66c746fc00000000     mov dword ptr [bp - 4], 0
loc_5148:
4:5148  8b460a               mov ax, word ptr [bp + 0xa]
4:514B  c45efc               les bx, ptr [bp - 4]
4:514E  2689470a             mov word ptr es:[bx + 0xa], ax
4:5152  c45e06               les bx, ptr [bp + 6]
4:5155  26c45f0a             les bx, ptr es:[bx + 0xa]
4:5159  268b470c             mov ax, word ptr es:[bx + 0xc]
4:515D  48                   dec ax
4:515E  7424                 je 0x5184
4:5160  2d0400               sub ax, 4
4:5163  7433                 je 0x5198
4:5165  48                   dec ax
4:5166  7444                 je 0x51ac
4:5168  8b46fc               mov ax, word ptr [bp - 4]
4:516B  8b56fe               mov dx, word ptr [bp - 2]
4:516E  0bd0                 or dx, ax
4:5170  745b                 je 0x51cd
4:5172  6a01                 push 1
4:5174  c45efc               les bx, ptr [bp - 4]
4:5177  06                   push es
4:5178  50                   push ax
4:5179  26c41f               les bx, ptr es:[bx]
4:517C  26ff1f               lcall es:[bx]
4:517F  c9                   leave
4:5180  ca0a00               retf 0xa
4:5183  db 90
loc_5184:
4:5184  c45e06               les bx, ptr [bp + 6]
4:5187  26c45f0a             les bx, ptr es:[bx + 0xa]
4:518B  268b470e             mov ax, word ptr es:[bx + 0xe]
4:518F  c45efc               les bx, ptr [bp - 4]
4:5192  26894704             mov word ptr es:[bx + 4], ax
4:5196  eb26                 jmp 0x51be
loc_5198:
4:5198  c45e06               les bx, ptr [bp + 6]
4:519B  26c45f0a             les bx, ptr es:[bx + 0xa]
4:519F  268b470e             mov ax, word ptr es:[bx + 0xe]
4:51A3  c45efc               les bx, ptr [bp - 4]
4:51A6  26894706             mov word ptr es:[bx + 6], ax
4:51AA  eb12                 jmp 0x51be
loc_51AC:
4:51AC  c45e06               les bx, ptr [bp + 6]
4:51AF  26c45f0a             les bx, ptr es:[bx + 0xa]
4:51B3  268b470e             mov ax, word ptr es:[bx + 0xe]
4:51B7  c45efc               les bx, ptr [bp - 4]
4:51BA  26894708             mov word ptr es:[bx + 8], ax
loc_51BE:
4:51BE  66ff76fc             push dword ptr [bp - 4]
4:51C2  6a01                 push 1
4:51C4  66ff760c             push dword ptr [bp + 0xc]
4:51C8  9a666c9343           lcall 0x4393, 0x6c66  ; Tile::addProduct@s7:6C66
loc_51CD:
4:51CD  c9                   leave
4:51CE  ca0a00               retf 0xa
4:51D1  db 00

; ---------------- RegObj3E::clear@s4:51D2 FAR size=52 callers=0
;   (vslot 5)
4:51D2  c8080000             enter 8, 0
4:51D6  c45e06               les bx, ptr [bp + 6]
4:51D9  268b470e             mov ax, word ptr es:[bx + 0xe]
4:51DD  268b5710             mov dx, word ptr es:[bx + 0x10]
4:51E1  8bda                 mov bx, dx
4:51E3  0bd8                 or bx, ax
4:51E5  740e                 je 0x51f5
4:51E7  6a01                 push 1
4:51E9  52                   push dx
4:51EA  50                   push ax
4:51EB  8ec2                 mov es, dx
4:51ED  8bd8                 mov bx, ax
4:51EF  26c41f               les bx, ptr es:[bx]
4:51F2  26ff1f               lcall es:[bx]
loc_51F5:
4:51F5  c45e06               les bx, ptr [bp + 6]
4:51F8  6626c7470e00000000   mov dword ptr es:[bx + 0xe], 0
4:5201  c9                   leave
4:5202  ca0400               retf 4
4:5205  db 00

; ---------------- CargoList::find@s4:5206 FAR size=100 callers=1
;   entry by name
4:5206  c8080000             enter 8, 0
4:520A  c45e06               les bx, ptr [bp + 6]
4:520D  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
4:5216  6626ff770e           push dword ptr es:[bx + 0xe]
4:521B  8d46f8               lea ax, [bp - 8]
4:521E  16                   push ss
4:521F  50                   push ax
4:5220  9a84572d52           lcall 0x522d, 0x5784  ; ListIter::ListIter@s2:5784
loc_5225:
4:5225  8d46f8               lea ax, [bp - 8]
4:5228  16                   push ss
4:5229  50                   push ax
4:522A  9a125b0f51           lcall 0x510f, 0x5b12  ; ListIter::next@s2:5B12
4:522F  c45e06               les bx, ptr [bp + 6]
4:5232  2689470a             mov word ptr es:[bx + 0xa], ax
4:5236  2689570c             mov word ptr es:[bx + 0xc], dx
4:523A  8bc2                 mov ax, dx
4:523C  260b470a             or ax, word ptr es:[bx + 0xa]
4:5240  7419                 je 0x525b
4:5242  66ff760a             push dword ptr [bp + 0xa]
4:5246  26c45f0a             les bx, ptr es:[bx + 0xa]
4:524A  6626ff7704           push dword ptr es:[bx + 4]
4:524F  9a7a3df750           lcall 0x50f7, 0x3d7a  ; _fstrcmp@s1:3D7A
4:5254  83c408               add sp, 8
4:5257  0bc0                 or ax, ax
4:5259  75ca                 jne 0x5225
loc_525B:
4:525B  c45e06               les bx, ptr [bp + 6]
4:525E  268b470a             mov ax, word ptr es:[bx + 0xa]
4:5262  268b570c             mov dx, word ptr es:[bx + 0xc]
4:5266  c9                   leave
4:5267  ca0800               retf 8

; ---------------- CargoList::entries@s4:526A FAR size=40 callers=1
;   the entries (made on first use)
4:526A  55                   push bp
4:526B  8bec                 mov bp, sp
4:526D  c45e06               les bx, ptr [bp + 6]
4:5270  6626837f0e00         cmp dword ptr es:[bx + 0xe], 0
4:5276  750b                 jne 0x5283
4:5278  66ff760a             push dword ptr [bp + 0xa]
4:527C  06                   push es
4:527D  53                   push bx
4:527E  90                   nop
4:527F  0e                   push cs
4:5280  e80f00               call 0x5292  ; CargoList::build@s4:5292
loc_5283:
4:5283  c45e06               les bx, ptr [bp + 6]
4:5286  268b470e             mov ax, word ptr es:[bx + 0xe]
4:528A  268b5710             mov dx, word ptr es:[bx + 0x10]
4:528E  c9                   leave
4:528F  ca0800               retf 8

; ---------------- CargoList::build@s4:5292 FAR size=1002 callers=1
;   the cargo a colony can move (robots, cargo, products)
4:5292  c8300000             enter 0x30, 0
4:5296  c45e06               les bx, ptr [bp + 6]
4:5299  268b470e             mov ax, word ptr es:[bx + 0xe]
4:529D  268b5710             mov dx, word ptr es:[bx + 0x10]
4:52A1  8bda                 mov bx, dx
4:52A3  8946f0               mov word ptr [bp - 0x10], ax
4:52A6  8956f2               mov word ptr [bp - 0xe], dx
4:52A9  8946f4               mov word ptr [bp - 0xc], ax
4:52AC  8956f6               mov word ptr [bp - 0xa], dx
4:52AF  0bd8                 or bx, ax
4:52B1  740e                 je 0x52c1
4:52B3  6a01                 push 1
4:52B5  52                   push dx
4:52B6  50                   push ax
4:52B7  8ec2                 mov es, dx
4:52B9  8bd8                 mov bx, ax
4:52BB  26c41f               les bx, ptr es:[bx]
4:52BE  26ff1f               lcall es:[bx]
loc_52C1:
4:52C1  6a0c                 push 0xc
4:52C3  9a9c175353           lcall 0x5353, 0x179c  ; operator_new@s1:179C
4:52C8  83c402               add sp, 2
4:52CB  8946f0               mov word ptr [bp - 0x10], ax
4:52CE  8956f2               mov word ptr [bp - 0xe], dx
4:52D1  0bd0                 or dx, ax
4:52D3  740b                 je 0x52e0
4:52D5  ff76f2               push word ptr [bp - 0xe]
4:52D8  50                   push ax
4:52D9  9a4a574353           lcall 0x5343, 0x574a  ; List::List@s2:574A
4:52DE  eb03                 jmp 0x52e3
loc_52E0:
4:52E0  33c0                 xor ax, ax
4:52E2  99                   cdq
loc_52E3:
4:52E3  c45e06               les bx, ptr [bp + 6]
4:52E6  2689470e             mov word ptr es:[bx + 0xe], ax
4:52EA  26895710             mov word ptr es:[bx + 0x10], dx
4:52EE  c746fe2100           mov word ptr [bp - 2], 0x21
4:52F3  eb22                 jmp 0x5317
4:52F5  db 90
loc_52F6:
4:52F6  33c0                 xor ax, ax
4:52F8  99                   cdq
loc_52F9:
4:52F9  8946e4               mov word ptr [bp - 0x1c], ax
4:52FC  8956e6               mov word ptr [bp - 0x1a], dx
4:52FF  52                   push dx
4:5300  50                   push ax
4:5301  c45e06               les bx, ptr [bp + 6]
4:5304  6626ff770e           push dword ptr es:[bx + 0xe]
4:5309  26c45f0e             les bx, ptr es:[bx + 0xe]
4:530D  26c41f               les bx, ptr es:[bx]
4:5310  26ff5f04             lcall es:[bx + 4]
loc_5314:
4:5314  ff4efe               dec word ptr [bp - 2]
loc_5317:
4:5317  837efe00             cmp word ptr [bp - 2], 0
4:531B  7c5b                 jl 0x5378
4:531D  ff76fe               push word ptr [bp - 2]
4:5320  66ff760a             push dword ptr [bp + 0xa]
4:5324  9a287c7f53           lcall 0x537f, 0x7c28  ; Tile::bas@s7:7C28
4:5329  8946ec               mov word ptr [bp - 0x14], ax
4:532C  8956ee               mov word ptr [bp - 0x12], dx
4:532F  0bd0                 or dx, ax
4:5331  74e1                 je 0x5314
4:5333  ff76fe               push word ptr [bp - 2]
4:5336  9acac0fa53           lcall 0x53fa, 0xc0ca  ; resourceName@s5:C0CA
4:533B  83c402               add sp, 2
4:533E  52                   push dx
4:533F  50                   push ax
4:5340  9ae8609c53           lcall 0x539c, 0x60e8  ; _strdup@s2:60E8
4:5345  83c404               add sp, 4
4:5348  8946e8               mov word ptr [bp - 0x18], ax
4:534B  8956ea               mov word ptr [bp - 0x16], dx
4:534E  6a10                 push 0x10
4:5350  9a9c171454           lcall 0x5414, 0x179c  ; operator_new@s1:179C
4:5355  83c402               add sp, 2
4:5358  8946f4               mov word ptr [bp - 0xc], ax
4:535B  8956f6               mov word ptr [bp - 0xa], dx
4:535E  0bd0                 or dx, ax
4:5360  7494                 je 0x52f6
4:5362  ff76fe               push word ptr [bp - 2]
4:5365  66ff76e8             push dword ptr [bp - 0x18]
4:5369  66ff76ec             push dword ptr [bp - 0x14]
4:536D  ff76f6               push word ptr [bp - 0xa]
4:5370  50                   push ax
4:5371  90                   nop
4:5372  0e                   push cs
4:5373  e81af4               call 0x4790  ; MarketRobot::MarketRobot@s4:4790
4:5376  eb81                 jmp 0x52f9
loc_5378:
4:5378  66ff760a             push dword ptr [bp + 0xa]
4:537C  9aa873cb51           lcall 0x51cb, 0x73a8  ; DbObj::resolveLink16@s7:73A8
4:5381  8946fa               mov word ptr [bp - 6], ax
4:5384  8956fc               mov word ptr [bp - 4], dx
4:5387  c45efa               les bx, ptr [bp - 6]
4:538A  268b470c             mov ax, word ptr es:[bx + 0xc]
4:538E  8946f8               mov word ptr [bp - 8], ax
4:5391  6a04                 push 4
4:5393  50                   push ax
4:5394  66ff36e006           push dword ptr [0x6e0]  ; g_bldgGroups
4:5399  9aaec6c253           lcall 0x53c2, 0xc6ae  ; BldgGroups::contains@s2:C6AE
4:539E  0bc0                 or ax, ax
4:53A0  0f843401             je 0x54d8
4:53A4  668b46fa             mov eax, dword ptr [bp - 6]
4:53A8  668946e4             mov dword ptr [bp - 0x1c], eax
4:53AC  c45ee4               les bx, ptr [bp - 0x1c]
4:53AF  66268b4720           mov eax, dword ptr es:[bx + 0x20]
4:53B4  668946e8             mov dword ptr [bp - 0x18], eax
4:53B8  6650                 push eax
4:53BA  8d46dc               lea ax, [bp - 0x24]
4:53BD  16                   push ss
4:53BE  50                   push ax
4:53BF  9a8457cc53           lcall 0x53cc, 0x5784  ; ListIter::ListIter@s2:5784
loc_53C4:
4:53C4  8d46dc               lea ax, [bp - 0x24]
4:53C7  16                   push ss
4:53C8  50                   push ax
4:53C9  9a125b0454           lcall 0x5404, 0x5b12  ; ListIter::next@s2:5B12
4:53CE  8946ec               mov word ptr [bp - 0x14], ax
4:53D1  8956ee               mov word ptr [bp - 0x12], dx
4:53D4  0bd0                 or dx, ax
4:53D6  0f84fe00             je 0x54d8
4:53DA  c45eec               les bx, ptr [bp - 0x14]
4:53DD  268b4706             mov ax, word ptr es:[bx + 6]
4:53E1  2d0700               sub ax, 7
4:53E4  740a                 je 0x53f0
4:53E6  2d0600               sub ax, 6
4:53E9  7c73                 jl 0x545e
4:53EB  7071                 jo 0x545e
4:53ED  48                   dec ax
4:53EE  7f6e                 jg 0x545e
loc_53F0:
4:53F0  c45eec               les bx, ptr [bp - 0x14]
4:53F3  26ff7706             push word ptr es:[bx + 6]
4:53F7  9a22c27154           lcall 0x5471, 0xc222  ; productAName@s5:C222
4:53FC  83c402               add sp, 2
4:53FF  52                   push dx
4:5400  50                   push ax
4:5401  9ae8607b54           lcall 0x547b, 0x60e8  ; _strdup@s2:60E8
4:5406  83c404               add sp, 4
4:5409  8946d4               mov word ptr [bp - 0x2c], ax
4:540C  8956d6               mov word ptr [bp - 0x2a], dx
4:540F  6a10                 push 0x10
4:5411  9a9c178b54           lcall 0x548b, 0x179c  ; operator_new@s1:179C
4:5416  83c402               add sp, 2
4:5419  8946f0               mov word ptr [bp - 0x10], ax
4:541C  8956f2               mov word ptr [bp - 0xe], dx
4:541F  0bd0                 or dx, ax
4:5421  741d                 je 0x5440
4:5423  c45eec               les bx, ptr [bp - 0x14]
4:5426  26ff7706             push word ptr es:[bx + 6]
4:542A  66ff76d4             push dword ptr [bp - 0x2c]
4:542E  6a00                 push 0
4:5430  26ff770a             push word ptr es:[bx + 0xa]
4:5434  ff76f2               push word ptr [bp - 0xe]
4:5437  50                   push ax
4:5438  90                   nop
4:5439  0e                   push cs
4:543A  e873f4               call 0x48b0  ; MarketCargo::MarketCargo@s4:48B0
4:543D  eb04                 jmp 0x5443
4:543F  db 90
loc_5440:
4:5440  33c0                 xor ax, ax
4:5442  99                   cdq
loc_5443:
4:5443  8946d0               mov word ptr [bp - 0x30], ax
4:5446  8956d2               mov word ptr [bp - 0x2e], dx
4:5449  52                   push dx
4:544A  50                   push ax
4:544B  c45e06               les bx, ptr [bp + 6]
4:544E  6626ff770e           push dword ptr es:[bx + 0xe]
4:5453  26c45f0e             les bx, ptr es:[bx + 0xe]
4:5457  26c41f               les bx, ptr es:[bx]
4:545A  26ff5f04             lcall es:[bx + 4]
loc_545E:
4:545E  c45eec               les bx, ptr [bp - 0x14]
4:5461  26837f0800           cmp word ptr es:[bx + 8], 0
4:5466  0f845aff             je 0x53c4
4:546A  26ff7708             push word ptr es:[bx + 8]
4:546E  9af8c22655           lcall 0x5526, 0xc2f8  ; productBName@s5:C2F8
4:5473  83c402               add sp, 2
4:5476  52                   push dx
4:5477  50                   push ax
4:5478  9ae860fd54           lcall 0x54fd, 0x60e8  ; _strdup@s2:60E8
4:547D  83c404               add sp, 4
4:5480  8946d0               mov word ptr [bp - 0x30], ax
4:5483  8956d2               mov word ptr [bp - 0x2e], dx
4:5486  6a10                 push 0x10
4:5488  9a9c174055           lcall 0x5540, 0x179c  ; operator_new@s1:179C
4:548D  83c402               add sp, 2
4:5490  8946f4               mov word ptr [bp - 0xc], ax
4:5493  8956f6               mov word ptr [bp - 0xa], dx
4:5496  0bd0                 or dx, ax
4:5498  741c                 je 0x54b6
4:549A  c45eec               les bx, ptr [bp - 0x14]
4:549D  26ff7708             push word ptr es:[bx + 8]
4:54A1  66ff76d0             push dword ptr [bp - 0x30]
4:54A5  6a00                 push 0
4:54A7  26ff770a             push word ptr es:[bx + 0xa]
4:54AB  ff76f6               push word ptr [bp - 0xa]
4:54AE  50                   push ax
4:54AF  90                   nop
4:54B0  0e                   push cs
4:54B1  e834f4               call 0x48e8  ; MarketProduct::MarketProduct@s4:48E8
4:54B4  eb03                 jmp 0x54b9
loc_54B6:
4:54B6  33c0                 xor ax, ax
4:54B8  99                   cdq
loc_54B9:
4:54B9  8946d4               mov word ptr [bp - 0x2c], ax
4:54BC  8956d6               mov word ptr [bp - 0x2a], dx
4:54BF  52                   push dx
4:54C0  50                   push ax
4:54C1  c45e06               les bx, ptr [bp + 6]
4:54C4  6626ff770e           push dword ptr es:[bx + 0xe]
4:54C9  26c45f0e             les bx, ptr es:[bx + 0xe]
4:54CD  26c41f               les bx, ptr es:[bx]
4:54D0  26ff5f04             lcall es:[bx + 4]
4:54D4  e9edfe               jmp 0x53c4
4:54D7  db 90
loc_54D8:
4:54D8  c45e0a               les bx, ptr [bp + 0xa]
4:54DB  66268b473e           mov eax, dword ptr es:[bx + 0x3e]
4:54E0  268b5740             mov dx, word ptr es:[bx + 0x40]
4:54E4  668946d0             mov dword ptr [bp - 0x30], eax
4:54E8  8bc2                 mov ax, dx
4:54EA  0b46d0               or ax, word ptr [bp - 0x30]
4:54ED  0f848701             je 0x5678
4:54F1  52                   push dx
4:54F2  ff76d0               push word ptr [bp - 0x30]
4:54F5  8d46dc               lea ax, [bp - 0x24]
4:54F8  16                   push ss
4:54F9  50                   push ax
4:54FA  9a84570755           lcall 0x5507, 0x5784  ; ListIter::ListIter@s2:5784
loc_54FF:
4:54FF  8d46dc               lea ax, [bp - 0x24]
4:5502  16                   push ss
4:5503  50                   push ax
4:5504  9a125b3055           lcall 0x5530, 0x5b12  ; ListIter::next@s2:5B12
4:5509  8946d4               mov word ptr [bp - 0x2c], ax
4:550C  8956d6               mov word ptr [bp - 0x2a], dx
4:550F  0bd0                 or dx, ax
4:5511  0f846301             je 0x5678
4:5515  c45ed4               les bx, ptr [bp - 0x2c]
4:5518  26837f0400           cmp word ptr es:[bx + 4], 0
4:551D  746b                 je 0x558a
4:551F  26ff7704             push word ptr es:[bx + 4]
4:5523  9ad8c09b55           lcall 0x559b, 0xc0d8  ; ResourceName@s5:C0D8
4:5528  83c402               add sp, 2
4:552B  52                   push dx
4:552C  50                   push ax
4:552D  9ae860a555           lcall 0x55a5, 0x60e8  ; _strdup@s2:60E8
4:5532  83c404               add sp, 4
4:5535  8946e4               mov word ptr [bp - 0x1c], ax
4:5538  8956e6               mov word ptr [bp - 0x1a], dx
4:553B  6a10                 push 0x10
4:553D  9a9c17b555           lcall 0x55b5, 0x179c  ; operator_new@s1:179C
4:5542  83c402               add sp, 2
4:5545  8946f0               mov word ptr [bp - 0x10], ax
4:5548  8956f2               mov word ptr [bp - 0xe], dx
4:554B  0bd0                 or dx, ax
4:554D  741d                 je 0x556c
4:554F  c45ed4               les bx, ptr [bp - 0x2c]
4:5552  26ff7704             push word ptr es:[bx + 4]
4:5556  66ff76e4             push dword ptr [bp - 0x1c]
4:555A  6a00                 push 0
4:555C  26ff770a             push word ptr es:[bx + 0xa]
4:5560  ff76f2               push word ptr [bp - 0xe]
4:5563  50                   push ax
4:5564  90                   nop
4:5565  0e                   push cs
4:5566  e827f2               call 0x4790  ; MarketRobot::MarketRobot@s4:4790
4:5569  eb04                 jmp 0x556f
4:556B  db 90
loc_556C:
4:556C  33c0                 xor ax, ax
4:556E  99                   cdq
loc_556F:
4:556F  8946e8               mov word ptr [bp - 0x18], ax
4:5572  8956ea               mov word ptr [bp - 0x16], dx
4:5575  52                   push dx
4:5576  50                   push ax
4:5577  c45e06               les bx, ptr [bp + 6]
4:557A  6626ff770e           push dword ptr es:[bx + 0xe]
4:557F  26c45f0e             les bx, ptr es:[bx + 0xe]
4:5583  26c41f               les bx, ptr es:[bx]
4:5586  26ff5f04             lcall es:[bx + 4]
loc_558A:
4:558A  c45ed4               les bx, ptr [bp - 0x2c]
4:558D  26837f0600           cmp word ptr es:[bx + 6], 0
4:5592  746a                 je 0x55fe
4:5594  26ff7706             push word ptr es:[bx + 6]
4:5598  9a22c21156           lcall 0x5611, 0xc222  ; productAName@s5:C222
4:559D  83c402               add sp, 2
4:55A0  52                   push dx
4:55A1  50                   push ax
4:55A2  9ae8601b56           lcall 0x561b, 0x60e8  ; _strdup@s2:60E8
4:55A7  83c404               add sp, 4
4:55AA  8946e4               mov word ptr [bp - 0x1c], ax
4:55AD  8956e6               mov word ptr [bp - 0x1a], dx
4:55B0  6a10                 push 0x10
4:55B2  9a9c172b56           lcall 0x562b, 0x179c  ; operator_new@s1:179C
4:55B7  83c402               add sp, 2
4:55BA  8946f4               mov word ptr [bp - 0xc], ax
4:55BD  8956f6               mov word ptr [bp - 0xa], dx
4:55C0  0bd0                 or dx, ax
4:55C2  741c                 je 0x55e0
4:55C4  c45ed4               les bx, ptr [bp - 0x2c]
4:55C7  26ff7706             push word ptr es:[bx + 6]
4:55CB  66ff76e4             push dword ptr [bp - 0x1c]
4:55CF  6a00                 push 0
4:55D1  26ff770a             push word ptr es:[bx + 0xa]
4:55D5  ff76f6               push word ptr [bp - 0xa]
4:55D8  50                   push ax
4:55D9  90                   nop
4:55DA  0e                   push cs
4:55DB  e8d2f2               call 0x48b0  ; MarketCargo::MarketCargo@s4:48B0
4:55DE  eb03                 jmp 0x55e3
loc_55E0:
4:55E0  33c0                 xor ax, ax
4:55E2  99                   cdq
loc_55E3:
4:55E3  8946e8               mov word ptr [bp - 0x18], ax
4:55E6  8956ea               mov word ptr [bp - 0x16], dx
4:55E9  52                   push dx
4:55EA  50                   push ax
4:55EB  c45e06               les bx, ptr [bp + 6]
4:55EE  6626ff770e           push dword ptr es:[bx + 0xe]
4:55F3  26c45f0e             les bx, ptr es:[bx + 0xe]
4:55F7  26c41f               les bx, ptr es:[bx]
4:55FA  26ff5f04             lcall es:[bx + 4]
loc_55FE:
4:55FE  c45ed4               les bx, ptr [bp - 0x2c]
4:5601  26837f0800           cmp word ptr es:[bx + 8], 0
4:5606  0f84f5fe             je 0x54ff
4:560A  26ff7708             push word ptr es:[bx + 8]
4:560E  9af8c20240           lcall 0x4002, 0xc2f8  ; productBName@s5:C2F8
4:5613  83c402               add sp, 2
4:5616  52                   push dx
4:5617  50                   push ax
4:5618  9ae8602352           lcall 0x5223, 0x60e8  ; _strdup@s2:60E8
4:561D  83c404               add sp, 4
4:5620  8946e4               mov word ptr [bp - 0x1c], ax
4:5623  8956e6               mov word ptr [bp - 0x1a], dx
4:5626  6a10                 push 0x10
4:5628  9a9c175252           lcall 0x5252, 0x179c  ; operator_new@s1:179C
4:562D  83c402               add sp, 2
4:5630  8946f0               mov word ptr [bp - 0x10], ax
4:5633  8956f2               mov word ptr [bp - 0xe], dx
4:5636  0bd0                 or dx, ax
4:5638  741c                 je 0x5656
4:563A  c45ed4               les bx, ptr [bp - 0x2c]
4:563D  26ff7708             push word ptr es:[bx + 8]
4:5641  66ff76e4             push dword ptr [bp - 0x1c]
4:5645  6a00                 push 0
4:5647  26ff770a             push word ptr es:[bx + 0xa]
4:564B  ff76f2               push word ptr [bp - 0xe]
4:564E  50                   push ax
4:564F  90                   nop
4:5650  0e                   push cs
4:5651  e894f2               call 0x48e8  ; MarketProduct::MarketProduct@s4:48E8
4:5654  eb03                 jmp 0x5659
loc_5656:
4:5656  33c0                 xor ax, ax
4:5658  99                   cdq
loc_5659:
4:5659  8946e8               mov word ptr [bp - 0x18], ax
4:565C  8956ea               mov word ptr [bp - 0x16], dx
4:565F  52                   push dx
4:5660  50                   push ax
4:5661  c45e06               les bx, ptr [bp + 6]
4:5664  6626ff770e           push dword ptr es:[bx + 0xe]
4:5669  26c45f0e             les bx, ptr es:[bx + 0xe]
4:566D  26c41f               les bx, ptr es:[bx]
4:5670  26ff5f04             lcall es:[bx + 4]
4:5674  e988fe               jmp 0x54ff
4:5677  db 90
loc_5678:
4:5678  c9                   leave
4:5679  ca0800               retf 8

; ---------------- CargoEntry::scalar_dtor@s4:567C size=44 callers=0
;   deleting destructor (MemFreeFS)
4:567C  c8080000             enter 8, 0
4:5680  c45e06               les bx, ptr [bp + 6]
4:5683  26c7079a38           mov word ptr es:[bx], 0x389a
4:5688  26c74702dc52         mov word ptr es:[bx + 2], 0x52dc  ; SEGMENT s2:0000
4:568E  f6460a01             test byte ptr [bp + 0xa], 1
4:5692  7409                 je 0x569d
4:5694  66ff7606             push dword ptr [bp + 6]
4:5698  9a3a09c652           lcall 0x52c6, 0x93a  ; SH_MemFreeFS@s1:093A
loc_569D:
4:569D  8b4606               mov ax, word ptr [bp + 6]
4:56A0  8b5608               mov dx, word ptr [bp + 8]
4:56A3  c9                   leave
4:56A4  ca0600               retf 6
4:56A7  db 00

; ---------------- RegObj3E::scalar_dtor@s4:56A8 FAR size=62 callers=0
;   deleting destructor
4:56A8  55                   push bp
4:56A9  8bec                 mov bp, sp
4:56AB  66ff7606             push dword ptr [bp + 6]
4:56AF  90                   nop
4:56B0  0e                   push cs
4:56B1  e8f8f9               call 0x50ac  ; RegObj3E::~RegObj3E@s4:50AC
4:56B4  f6460a01             test byte ptr [bp + 0xa], 1
4:56B8  7409                 je 0x56c3
4:56BA  66ff7606             push dword ptr [bp + 6]
4:56BE  9ace179b56           lcall 0x569b, 0x17ce  ; operator_delete@s1:17CE
loc_56C3:
4:56C3  8b4606               mov ax, word ptr [bp + 6]
4:56C6  8b5608               mov dx, word ptr [bp + 8]
4:56C9  c9                   leave
4:56CA  ca0600               retf 6
4:56CD  db 90 7c 56 33 51 a8 56 e4 56 f2 1d dc 56 ce 1d e0
4:56DD  db 56 d4 1d e2 50 d2 51 d0 56

; ---------------- RouteEdit::RouteEdit@s4:56E6 FAR size=46 callers=1
;   registry 0x47: the route being edited
4:56E6  55                   push bp
4:56E7  8bec                 mov bp, sp
4:56E9  66ff7608             push dword ptr [bp + 8]
4:56ED  ff7606               push word ptr [bp + 6]
4:56F0  9a481dd856           lcall 0x56d8, 0x1d48  ; RegObj::RegObj@s3:1D48
4:56F5  c45e06               les bx, ptr [bp + 6]
4:56F8  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
4:5701  26c7073058           mov word ptr es:[bx], 0x5830
4:5706  26c74702d456         mov word ptr es:[bx + 2], 0x56d4  ; SEGMENT s4:0000
4:570C  8bc3                 mov ax, bx
4:570E  8cc2                 mov dx, es
4:5710  c9                   leave
4:5711  ca0600               retf 6

; ---------------- RouteEdit::~RouteEdit@s4:5714 FAR size=30 callers=1
;   dtor
4:5714  55                   push bp
4:5715  8bec                 mov bp, sp
4:5717  c45e06               les bx, ptr [bp + 6]
4:571A  26c7073058           mov word ptr es:[bx], 0x5830
4:571F  26c747020a57         mov word ptr es:[bx + 2], 0x570a  ; SEGMENT s4:0000
4:5725  66ff7606             push dword ptr [bp + 6]
4:5729  9a801df356           lcall 0x56f3, 0x1d80  ; RegObj::~RegObj@s3:1D80
4:572E  c9                   leave
4:572F  ca0400               retf 4

; ---------------- RouteEdit::start@s4:5732 FAR size=16 callers=1
;   starts a route for a truck
4:5732  55                   push bp
4:5733  8bec                 mov bp, sp
4:5735  66ff760a             push dword ptr [bp + 0xa]
4:5739  9a4e6d2753           lcall 0x5327, 0x6d4e  ; Tile::copyRoute@s7:6D4E
4:573E  c9                   leave
4:573F  ca0800               retf 8

; ---------------- RouteEdit::addStop@s4:5742 FAR size=144 callers=1
;   adds a stop
4:5742  c81e0000             enter 0x1e, 0
4:5746  c746fe0000           mov word ptr [bp - 2], 0
4:574B  c45e0a               les bx, ptr [bp + 0xa]
4:574E  66268b4704           mov eax, dword ptr es:[bx + 4]
4:5753  268b5706             mov dx, word ptr es:[bx + 6]
4:5757  668946fa             mov dword ptr [bp - 6], eax
4:575B  52                   push dx
4:575C  c45efa               les bx, ptr [bp - 6]
4:575F  50                   push ax
4:5760  26c41f               les bx, ptr es:[bx]
4:5763  26ff5f10             lcall es:[bx + 0x10]
4:5767  8946f6               mov word ptr [bp - 0xa], ax
4:576A  8956f8               mov word ptr [bp - 8], dx
4:576D  66c746f200000000     mov dword ptr [bp - 0xe], 0
4:5775  eb05                 jmp 0x577c
4:5777  db 90
loc_5778:
4:5778  66ff46f2             inc dword ptr [bp - 0xe]
loc_577C:
4:577C  668b46f6             mov eax, dword ptr [bp - 0xa]
4:5780  663946f2             cmp dword ptr [bp - 0xe], eax
4:5784  7319                 jae 0x579f
4:5786  66ff76f2             push dword ptr [bp - 0xe]
4:578A  c45efa               les bx, ptr [bp - 6]
4:578D  06                   push es
4:578E  53                   push bx
4:578F  26c41f               les bx, ptr es:[bx]
4:5792  26ff5f04             lcall es:[bx + 4]
4:5796  0bd0                 or dx, ax
4:5798  74de                 je 0x5778
4:579A  c746fe0100           mov word ptr [bp - 2], 1
loc_579F:
4:579F  837efe00             cmp word ptr [bp - 2], 0
4:57A3  7407                 je 0x57ac
4:57A5  66ff760a             push dword ptr [bp + 0xa]
4:57A9  eb1a                 jmp 0x57c5
4:57AB  db 90
loc_57AC:
4:57AC  668b460a             mov eax, dword ptr [bp + 0xa]
4:57B0  660bc0               or eax, eax
4:57B3  740d                 je 0x57c2
4:57B5  6a01                 push 1
4:57B7  c45e0a               les bx, ptr [bp + 0xa]
4:57BA  06                   push es
4:57BB  50                   push ax
4:57BC  26c41f               les bx, ptr es:[bx]
4:57BF  26ff1f               lcall es:[bx]
loc_57C2:
4:57C2  666a00               push 0
loc_57C5:
4:57C5  66ff760e             push dword ptr [bp + 0xe]
4:57C9  9a806d3c57           lcall 0x573c, 0x6d80  ; Tile::clearRoute@s7:6D80
4:57CE  c9                   leave
4:57CF  ca0c00               retf 0xc

; ---------------- RouteEdit::setRoute@s4:57D2 FAR size=20 callers=1
;   +0x0A
4:57D2  55                   push bp
4:57D3  8bec                 mov bp, sp
4:57D5  668b460a             mov eax, dword ptr [bp + 0xa]
4:57D9  c45e06               les bx, ptr [bp + 6]
4:57DC  662689470a           mov dword ptr es:[bx + 0xa], eax
4:57E1  c9                   leave
4:57E2  ca0800               retf 8
4:57E5  db 00

; ---------------- RouteEdit::commit@s4:57E6 FAR size=36 callers=2
;   hands the route to the truck
4:57E6  55                   push bp
4:57E7  8bec                 mov bp, sp
4:57E9  66ff760a             push dword ptr [bp + 0xa]
4:57ED  c45e06               les bx, ptr [bp + 6]
4:57F0  6626ff770a           push dword ptr es:[bx + 0xa]
4:57F5  9a0cd2ffff           lcall 0xffff, 0xd20c  ; TransitInfoDlg::showRoute@s9:D20C
4:57FA  c45e06               les bx, ptr [bp + 6]
4:57FD  6626c7470a00000000   mov dword ptr es:[bx + 0xa], 0
4:5806  c9                   leave
4:5807  ca0800               retf 8

; ---------------- RouteEdit::scalar_dtor@s4:580A FAR size=54 callers=0
;   deleting destructor
4:580A  55                   push bp
4:580B  8bec                 mov bp, sp
4:580D  66ff7606             push dword ptr [bp + 6]
4:5811  90                   nop
4:5812  0e                   push cs
4:5813  e8fefe               call 0x5714  ; RouteEdit::~RouteEdit@s4:5714
4:5816  f6460a01             test byte ptr [bp + 0xa], 1
4:581A  7409                 je 0x5825
4:581C  66ff7606             push dword ptr [bp + 6]
4:5820  9ace17c156           lcall 0x56c1, 0x17ce  ; operator_delete@s1:17CE
loc_5825:
4:5825  8b4606               mov ax, word ptr [bp + 6]
4:5828  8b5608               mov dx, word ptr [bp + 8]
4:582B  c9                   leave
4:582C  ca0600               retf 6
4:582F  db 90 0a 58 23 57 f2 1d 3a 58 ce 1d 3e 58 d4 1d 2c
4:583F  db 57

; ---------------- Mode6View::Mode6View@s4:5840 FAR size=118 callers=1
;   mode 6 view (after New Game): the A.I. greeting sequence
4:5840  55                   push bp
4:5841  8bec                 mov bp, sp
4:5843  66ff760c             push dword ptr [bp + 0xc]
4:5847  ff760a               push word ptr [bp + 0xa]
4:584A  6a06                 push 6
4:584C  66ff7606             push dword ptr [bp + 6]
4:5850  9a7a7f3953           lcall 0x5339, 0x7f7a  ; ScreenView::ScreenView@s5:7F7A
4:5855  c45e06               les bx, ptr [bp + 6]
4:5858  662bc0               sub eax, eax
4:585B  66268987ee00         mov dword ptr es:[bx + 0xee], eax
4:5861  66268987f200         mov dword ptr es:[bx + 0xf2], eax
4:5867  268987f600           mov word ptr es:[bx + 0xf6], ax
4:586C  26c707625a           mov word ptr es:[bx], 0x5a62
4:5871  26c747028358         mov word ptr es:[bx + 2], 0x5883  ; SEGMENT s4:0000
4:5877  26c787e200fe5a       mov word ptr es:[bx + 0xe2], 0x5afe
4:587E  26c787e4003258       mov word ptr es:[bx + 0xe4], 0x5832  ; SEGMENT s4:0000
4:5885  6a27                 push 0x27
4:5887  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:588C  9aba203658           lcall 0x5836, 0x20ba  ; Registry_get@s3:20BA
4:5891  c45e06               les bx, ptr [bp + 6]
4:5894  268987f200           mov word ptr es:[bx + 0xf2], ax
4:5899  268997f400           mov word ptr es:[bx + 0xf4], dx
4:589E  268b87f200           mov ax, word ptr es:[bx + 0xf2]
4:58A3  268987e600           mov word ptr es:[bx + 0xe6], ax
4:58A8  268997e800           mov word ptr es:[bx + 0xe8], dx
4:58AD  8bc3                 mov ax, bx
4:58AF  8cc2                 mov dx, es
4:58B1  c9                   leave
4:58B2  ca0a00               retf 0xa
4:58B5  db 00

; ---------------- Mode6View::~Mode6View@s4:58B6 FAR size=44 callers=1
;   dtor
4:58B6  55                   push bp
4:58B7  8bec                 mov bp, sp
4:58B9  c45e06               les bx, ptr [bp + 6]
4:58BC  26c707625a           mov word ptr es:[bx], 0x5a62
4:58C1  26c74702d358         mov word ptr es:[bx + 2], 0x58d3  ; SEGMENT s4:0000
4:58C7  26c787e200fe5a       mov word ptr es:[bx + 0xe2], 0x5afe
4:58CE  26c787e4007558       mov word ptr es:[bx + 0xe4], 0x5875  ; SEGMENT s4:0000
4:58D5  66ff7606             push dword ptr [bp + 6]
4:58D9  9a8e805358           lcall 0x5853, 0x808e  ; ScreenView::~ScreenView@s5:808E
4:58DE  c9                   leave
4:58DF  ca0400               retf 4

; ---------------- Mode6View::onTimer@s4:58E2 size=80 callers=0
;   apis: USER.InvalidateRect, USER.PostMessage
;   (vslot 16) timer 0x105: counts, then posts command 0xCA
4:58E2  c8080000             enter 8, 0
4:58E6  817e0a0501           cmp word ptr [bp + 0xa], 0x105
4:58EB  7541                 jne 0x592e
4:58ED  c45e06               les bx, ptr [bp + 6]
4:58F0  26ff87f600           inc word ptr es:[bx + 0xf6]
4:58F5  a14042               mov ax, word ptr [0x4240]
4:58F8  263987f600           cmp word ptr es:[bx + 0xf6], ax
4:58FD  7c17                 jl 0x5916
4:58FF  ff369603             push word ptr [0x396]
4:5903  6668ca001101         push 0x11100ca
4:5909  666a00               push 0
4:590C  9affff0000           lcall 0, 0xffff  ; USER.PostMessage
4:5911  c9                   leave
4:5912  ca0600               retf 6
4:5915  db 90
loc_5916:
4:5916  c45e06               les bx, ptr [bp + 6]
4:5919  26c787ea000000       mov word ptr es:[bx + 0xea], 0
4:5920  26ff7708             push word ptr es:[bx + 8]
4:5924  666a00               push 0
4:5927  6a00                 push 0
4:5929  9affff0000           lcall 0, 0xffff  ; USER.InvalidateRect
loc_592E:
4:592E  c9                   leave
4:592F  ca0600               retf 6

; ---------------- Mode6View::onShow@s4:5932 size=90 callers=0
;   (vslot 13) opens the window list 10, 11, 12, 13, 4 (s8:AF40)
4:5932  c8060000             enter 6, 0
4:5936  56                   push si
4:5937  c45e06               les bx, ptr [bp + 6]
4:593A  268b87f000           mov ax, word ptr es:[bx + 0xf0]
4:593F  260b87ee00           or ax, word ptr es:[bx + 0xee]
4:5944  7412                 je 0x5958
4:5946  6626ffb7ee00         push dword ptr es:[bx + 0xee]
4:594C  26c49fee00           les bx, ptr es:[bx + 0xee]
4:5951  26c41f               les bx, ptr es:[bx]
4:5954  26ff5f08             lcall es:[bx + 8]
loc_5958:
4:5958  c45e06               les bx, ptr [bp + 6]
4:595B  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
4:5961  7523                 jne 0x5986
4:5963  26c787ea000100       mov word ptr es:[bx + 0xea], 1
4:596A  c45e06               les bx, ptr [bp + 6]
4:596D  268bb7f600           mov si, word ptr es:[bx + 0xf6]
4:5972  03f6                 add si, si
4:5974  ffb43842             push word ptr [si + 0x4238]
4:5978  26ff7708             push word ptr es:[bx + 8]
4:597C  66ff367c5b           push dword ptr [0x5b7c]
4:5981  9a40af7046           lcall 0x4670, 0xaf40  ; DialogCtr::open@s8:AF40
loc_5986:
4:5986  5e                   pop si
4:5987  c9                   leave
4:5988  ca0400               retf 4
4:598B  db 00

; ---------------- Mode6View::create@s4:598C FAR size=100 callers=0
;   (vslot 2) creates the window and its picture
4:598C  c8040000             enter 4, 0
4:5990  66ff7606             push dword ptr [bp + 6]
4:5994  9a60978c56           lcall 0x568c, 0x9760  ; SOLWnd::create@s2:9760
4:5999  c45e06               les bx, ptr [bp + 6]
4:599C  26ff7708             push word ptr es:[bx + 8]
4:59A0  6626ffb7f200         push dword ptr es:[bx + 0xf2]
4:59A6  90                   nop
4:59A7  0e                   push cs
4:59A8  e805f4               call 0x4db0  ; CmdTarget::getDC@s4:4DB0
4:59AB  6a2a                 push 0x2a
4:59AD  9a9c172358           lcall 0x5823, 0x179c  ; operator_new@s1:179C
4:59B2  83c402               add sp, 2
4:59B5  8956fe               mov word ptr [bp - 2], dx
4:59B8  0bd0                 or dx, ax
4:59BA  7422                 je 0x59de
4:59BC  c45e06               les bx, ptr [bp + 6]
4:59BF  26ff7708             push word ptr es:[bx + 8]
4:59C3  ff76fe               push word ptr [bp - 2]
4:59C6  50                   push ax
4:59C7  90                   nop
4:59C8  0e                   push cs
4:59C9  e83a01               call 0x5b06  ; PictureLayer::PictureLayer@s4:5B06
4:59CC  c45e06               les bx, ptr [bp + 6]
4:59CF  268987ee00           mov word ptr es:[bx + 0xee], ax
4:59D4  268997f000           mov word ptr es:[bx + 0xf0], dx
4:59D9  c9                   leave
4:59DA  ca0400               retf 4
4:59DD  db 90
loc_59DE:
4:59DE  c45e06               les bx, ptr [bp + 6]
4:59E1  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
4:59EB  c9                   leave
4:59EC  ca0400               retf 4
4:59EF  db 00

; ---------------- Mode6View::destroy@s4:59F0 FAR size=62 callers=0
;   (vslot 36)
4:59F0  c8080000             enter 8, 0
4:59F4  c45e06               les bx, ptr [bp + 6]
4:59F7  268b87ee00           mov ax, word ptr es:[bx + 0xee]
4:59FC  268b97f000           mov dx, word ptr es:[bx + 0xf0]
4:5A01  8bda                 mov bx, dx
4:5A03  0bd8                 or bx, ax
4:5A05  740e                 je 0x5a15
4:5A07  6a01                 push 1
4:5A09  52                   push dx
4:5A0A  50                   push ax
4:5A0B  8ec2                 mov es, dx
4:5A0D  8bd8                 mov bx, ax
4:5A0F  26c41f               les bx, ptr es:[bx]
4:5A12  26ff1f               lcall es:[bx]
loc_5A15:
4:5A15  c45e06               les bx, ptr [bp + 6]
4:5A18  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
4:5A22  06                   push es
4:5A23  53                   push bx
4:5A24  9a8e629759           lcall 0x5997, 0x628e  ; DanWnd::destroy@s2:628E
4:5A29  c9                   leave
4:5A2A  ca0400               retf 4
4:5A2D  db 00

; ---------------- Mode6View::thunk_dtor@s4:5A2E FAR size=14 callers=0
;   this-adjusting thunk
4:5A2E  8bdc                 mov bx, sp
4:5A30  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
4:5A36  e90300               jmp 0x5a3c
4:5A39  db 90 90 00

; ---------------- Mode6View::scalar_dtor@s4:5A3C FAR size=202 callers=0
;   deleting destructor
4:5A3C  55                   push bp
4:5A3D  8bec                 mov bp, sp
4:5A3F  66ff7606             push dword ptr [bp + 6]
4:5A43  90                   nop
4:5A44  0e                   push cs
4:5A45  e86efe               call 0x58b6  ; Mode6View::~Mode6View@s4:58B6
4:5A48  f6460a01             test byte ptr [bp + 0xa], 1
4:5A4C  7409                 je 0x5a57
4:5A4E  66ff7606             push dword ptr [bp + 6]
4:5A52  9ace17b059           lcall 0x59b0, 0x17ce  ; operator_delete@s1:17CE
loc_5A57:
4:5A57  8b4606               mov ax, word ptr [bp + 6]
4:5A5A  8b5608               mov dx, word ptr [bp + 8]
4:5A5D  c9                   leave
4:5A5E  ca0600               retf 6
4:5A61  db 90 3c 5a 6c 5a ea 68 70 5a 8c 59 98 5a c6 68 74
4:5A71  db 5a 40 96 78 5a 64 96 7c 5a 2c 37 80 5a f2 97 84
4:5A81  db 5a 3c 37 88 5a 40 37 8c 5a 44 37 90 5a 48 37 94
4:5A91  db 5a 4c 37 9c 5a 32 59 a4 5a 98 96 a8 5a 50 82 c4
4:5AA1  db 5a e2 58 f4 5a 60 9c ac 5a 58 37 b0 5a 24 63 b4
4:5AB1  db 5a 4e 9c b8 5a 62 37 bc 5a 4a 9c c0 5a 66 37 c8
4:5AC1  db 5a 06 81 f0 5a 4a 6a cc 5a 2e 6b d0 5a 02 6b d4
4:5AD1  db 5a 7a 37 d8 5a 52 9c dc 5a 56 9c e0 5a 16 9c e4
4:5AE1  db 5a 30 9c e8 5a 86 9c ec 5a c4 9c f8 5a c0 81 fc
4:5AF1  db 5a f0 59 c5 58 28 63 27 5a 28 81 dc 58 2e 5a 64
4:5B01  db 5a 10 3a 68 5a

; ---------------- PictureLayer::PictureLayer@s4:5B06 FAR size=450 callers=1
;   a picture drawn on a view (saves what is under it)
4:5B06  c82a0000             enter 0x2a, 0
4:5B0A  57                   push di
4:5B0B  56                   push si
4:5B0C  66ff7608             push dword ptr [bp + 8]
4:5B10  ff7606               push word ptr [bp + 6]
4:5B13  9a1c92d85b           lcall 0x5bd8, 0x921c  ; Layer::Layer@s5:921C
4:5B18  c45e06               les bx, ptr [bp + 6]
4:5B1B  662bc0               sub eax, eax
4:5B1E  6626894714           mov dword ptr es:[bx + 0x14], eax
4:5B23  6626894718           mov dword ptr es:[bx + 0x18], eax
4:5B28  8d471c               lea ax, [bx + 0x1c]
4:5B2B  06                   push es
4:5B2C  50                   push ax
4:5B2D  9a383e5a5b           lcall 0x5b5a, 0x3e38  ; Pos3::Pos3@s2:3E38
4:5B32  c45e06               les bx, ptr [bp + 6]
4:5B35  26c7071a5e           mov word ptr es:[bx], 0x5e1a
4:5B3A  26c74702005b         mov word ptr es:[bx + 2], 0x5b00  ; SEGMENT s4:0000
4:5B40  6a48                 push 0x48
4:5B42  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:5B47  9aba20795b           lcall 0x5b79, 0x20ba  ; Registry_get@s3:20BA
4:5B4C  8946fc               mov word ptr [bp - 4], ax
4:5B4F  8956fe               mov word ptr [bp - 2], dx
4:5B52  8d46f6               lea ax, [bp - 0xa]
4:5B55  16                   push ss
4:5B56  50                   push ax
4:5B57  9a383e6d5b           lcall 0x5b6d, 0x3e38  ; Pos3::Pos3@s2:3E38
4:5B5C  668b46fc             mov eax, dword ptr [bp - 4]
4:5B60  050e00               add ax, 0xe
4:5B63  6650                 push eax
4:5B65  8d46f6               lea ax, [bp - 0xa]
4:5B68  16                   push ss
4:5B69  50                   push ax
4:5B6A  9a623fef5b           lcall 0x5bef, 0x3f62  ; Pos3::assign@s2:3F62
4:5B6F  6a27                 push 0x27
4:5B71  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:5B76  9aba208f58           lcall 0x588f, 0x20ba  ; Registry_get@s3:20BA
4:5B7B  c45e06               les bx, ptr [bp + 6]
4:5B7E  26894714             mov word ptr es:[bx + 0x14], ax
4:5B82  26895716             mov word ptr es:[bx + 0x16], dx
4:5B86  06                   push es
4:5B87  53                   push bx
4:5B88  6a00                 push 0
4:5B8A  52                   push dx
4:5B8B  26ff7714             push word ptr es:[bx + 0x14]
4:5B8F  26c45f14             les bx, ptr es:[bx + 0x14]
4:5B93  26c41f               les bx, ptr es:[bx]
4:5B96  26ff5f04             lcall es:[bx + 4]
4:5B9A  c45e06               les bx, ptr [bp + 6]
4:5B9D  66268b4714           mov eax, dword ptr es:[bx + 0x14]
4:5BA2  6626894706           mov dword ptr es:[bx + 6], eax
4:5BA7  c45e06               les bx, ptr [bp + 6]
4:5BAA  26c45f14             les bx, ptr es:[bx + 0x14]
4:5BAE  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:5BB3  668946f2             mov dword ptr [bp - 0xe], eax
4:5BB7  668b4606             mov eax, dword ptr [bp + 6]
4:5BBB  050a00               add ax, 0xa
4:5BBE  6650                 push eax
4:5BC0  c45ef2               les bx, ptr [bp - 0xe]
4:5BC3  06                   push es
4:5BC4  53                   push bx
4:5BC5  26c41f               les bx, ptr es:[bx]
4:5BC8  26ff5f08             lcall es:[bx + 8]
4:5BCC  c45e06               les bx, ptr [bp + 6]
4:5BCF  26894712             mov word ptr es:[bx + 0x12], ax
4:5BD3  06                   push es
4:5BD4  53                   push bx
4:5BD5  9a6493a05a           lcall 0x5aa0, 0x9364  ; Layer::drawFrame@s5:9364
4:5BDA  c45e06               les bx, ptr [bp + 6]
4:5BDD  66268b4714           mov eax, dword ptr es:[bx + 0x14]
4:5BE2  055200               add ax, 0x52
4:5BE5  6650                 push eax
4:5BE7  8d471c               lea ax, [bx + 0x1c]
4:5BEA  06                   push es
4:5BEB  50                   push ax
4:5BEC  9a623f085c           lcall 0x5c08, 0x3f62  ; Pos3::assign@s2:3F62
4:5BF1  8d46f6               lea ax, [bp - 0xa]
4:5BF4  16                   push ss
4:5BF5  50                   push ax
4:5BF6  8b4606               mov ax, word ptr [bp + 6]
4:5BF9  8b5608               mov dx, word ptr [bp + 8]
4:5BFC  051c00               add ax, 0x1c
4:5BFF  52                   push dx
4:5C00  50                   push ax
4:5C01  8bf0                 mov si, ax
4:5C03  8bfa                 mov di, dx
4:5C05  9a323f155c           lcall 0x5c15, 0x3f32  ; Pos3::add@s2:3F32
4:5C0A  c45e06               les bx, ptr [bp + 6]
4:5C0D  6626ff7714           push dword ptr es:[bx + 0x14]
4:5C12  9a489f225c           lcall 0x5c22, 0x9f48  ; AnimTicker::current@s2:9F48
4:5C17  8946ee               mov word ptr [bp - 0x12], ax
4:5C1A  8956f0               mov word ptr [bp - 0x10], dx
4:5C1D  52                   push dx
4:5C1E  50                   push ax
4:5C1F  9a7247585c           lcall 0x5c58, 0x4772  ; DIB::rect@s2:4772
4:5C24  8946ea               mov word ptr [bp - 0x16], ax
4:5C27  8956ec               mov word ptr [bp - 0x14], dx
4:5C2A  6a14                 push 0x14
4:5C2C  9a9c17555a           lcall 0x5a55, 0x179c  ; operator_new@s1:179C
4:5C31  83c402               add sp, 2
4:5C34  8946d6               mov word ptr [bp - 0x2a], ax
4:5C37  8956d8               mov word ptr [bp - 0x28], dx
4:5C3A  0bd0                 or dx, ax
4:5C3C  742a                 je 0x5c68
4:5C3E  66ff76f2             push dword ptr [bp - 0xe]
4:5C42  57                   push di
4:5C43  56                   push si
4:5C44  c45eea               les bx, ptr [bp - 0x16]
4:5C47  6626ff7704           push dword ptr es:[bx + 4]
4:5C4C  6626ff7708           push dword ptr es:[bx + 8]
4:5C51  ff76d8               push word ptr [bp - 0x28]
4:5C54  50                   push ax
4:5C55  9ac2507f5c           lcall 0x5c7f, 0x50c2  ; DibRegion::DibRegion@s2:50C2
4:5C5A  c45e06               les bx, ptr [bp + 6]
4:5C5D  26894718             mov word ptr es:[bx + 0x18], ax
4:5C61  2689571a             mov word ptr es:[bx + 0x1a], dx
4:5C65  eb0d                 jmp 0x5c74
4:5C67  db 90
loc_5C68:
4:5C68  c45e06               les bx, ptr [bp + 6]
4:5C6B  6626c7471800000000   mov dword ptr es:[bx + 0x18], 0
loc_5C74:
4:5C74  c45e06               les bx, ptr [bp + 6]
4:5C77  6626ff7718           push dword ptr es:[bx + 0x18]
4:5C7C  9a3451045b           lcall 0x5b04, 0x5134  ; DibRegion::save@s2:5134
4:5C81  c45e06               les bx, ptr [bp + 6]
4:5C84  268b471c             mov ax, word ptr es:[bx + 0x1c]
4:5C88  26894722             mov word ptr es:[bx + 0x22], ax
4:5C8C  c45e06               les bx, ptr [bp + 6]
4:5C8F  268b471e             mov ax, word ptr es:[bx + 0x1e]
4:5C93  26894724             mov word ptr es:[bx + 0x24], ax
4:5C97  c45eea               les bx, ptr [bp - 0x16]
4:5C9A  268b4704             mov ax, word ptr es:[bx + 4]
4:5C9E  c45e06               les bx, ptr [bp + 6]
4:5CA1  26034722             add ax, word ptr es:[bx + 0x22]
4:5CA5  40                   inc ax
4:5CA6  26894726             mov word ptr es:[bx + 0x26], ax
4:5CAA  c45eea               les bx, ptr [bp - 0x16]
4:5CAD  268b4708             mov ax, word ptr es:[bx + 8]
4:5CB1  c45e06               les bx, ptr [bp + 6]
4:5CB4  26034724             add ax, word ptr es:[bx + 0x24]
4:5CB8  40                   inc ax
4:5CB9  26894728             mov word ptr es:[bx + 0x28], ax
4:5CBD  8bc3                 mov ax, bx
4:5CBF  8cc2                 mov dx, es
4:5CC1  5e                   pop si
4:5CC2  5f                   pop di
4:5CC3  c9                   leave
4:5CC4  ca0600               retf 6
4:5CC7  db 00

; ---------------- PictureLayer::~PictureLayer@s4:5CC8 FAR size=106 callers=1
;   dtor
4:5CC8  c8100000             enter 0x10, 0
4:5CCC  c45e06               les bx, ptr [bp + 6]
4:5CCF  26c7071a5e           mov word ptr es:[bx], 0x5e1a
4:5CD4  26c747023e5b         mov word ptr es:[bx + 2], 0x5b3e  ; SEGMENT s4:0000
4:5CDA  66268b4718           mov eax, dword ptr es:[bx + 0x18]
4:5CDF  268b571a             mov dx, word ptr es:[bx + 0x1a]
4:5CE3  668946fc             mov dword ptr [bp - 4], eax
4:5CE7  8bda                 mov bx, dx
4:5CE9  0bd0                 or dx, ax
4:5CEB  7413                 je 0x5d00
4:5CED  53                   push bx
4:5CEE  50                   push ax
4:5CEF  9a1851305b           lcall 0x5b30, 0x5118  ; DibRegion::free@s2:5118
4:5CF4  66ff76fc             push dword ptr [bp - 4]
4:5CF8  9ace172f5c           lcall 0x5c2f, 0x17ce  ; operator_delete@s1:17CE
4:5CFD  83c404               add sp, 4
loc_5D00:
4:5D00  c45e06               les bx, ptr [bp + 6]
4:5D03  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
4:5D09  7419                 je 0x5d24
4:5D0B  06                   push es
4:5D0C  53                   push bx
4:5D0D  6626ff7714           push dword ptr es:[bx + 0x14]
4:5D12  9aa61e225d           lcall 0x5d22, 0x1ea6  ; RegObj::removeListener@s3:1EA6
4:5D17  c45e06               les bx, ptr [bp + 6]
4:5D1A  6626ff7714           push dword ptr es:[bx + 0x14]
4:5D1F  9ada1d4a5b           lcall 0x5b4a, 0x1dda  ; RegObj::makeCurrent@s3:1DDA
loc_5D24:
4:5D24  66ff7606             push dword ptr [bp + 6]
4:5D28  9ac492165b           lcall 0x5b16, 0x92c4  ; Layer::~Layer@s5:92C4
4:5D2D  c9                   leave
4:5D2E  ca0400               retf 4
4:5D31  db 00

; ---------------- PictureLayer::onNotify@s4:5D32 FAR size=58 callers=0
;   apis: USER.InvalidateRect
;   (vslot 1) invalidates
4:5D32  55                   push bp
4:5D33  8bec                 mov bp, sp
4:5D35  8b460a               mov ax, word ptr [bp + 0xa]
4:5D38  eb28                 jmp 0x5d62
loc_5D3A:
4:5D3A  c45e06               les bx, ptr [bp + 6]
4:5D3D  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:5D46  c9                   leave
4:5D47  ca0600               retf 6
loc_5D4A:
4:5D4A  c45e06               les bx, ptr [bp + 6]
4:5D4D  26ff7704             push word ptr es:[bx + 4]
4:5D51  8d4722               lea ax, [bx + 0x22]
4:5D54  06                   push es
4:5D55  50                   push ax
4:5D56  6a00                 push 0
4:5D58  9a2a590000           lcall 0, 0x592a  ; USER.InvalidateRect
4:5D5D  c9                   leave
4:5D5E  ca0600               retf 6
4:5D61  db 90
loc_5D62:
4:5D62  48                   dec ax
4:5D63  74d5                 je 0x5d3a
4:5D65  48                   dec ax
4:5D66  74e2                 je 0x5d4a
4:5D68  c9                   leave
4:5D69  ca0600               retf 6

; ---------------- PictureLayer::paint@s4:5D6C size=136 callers=0
;   apis: USER.BeginPaint, USER.EndPaint
;   (vslot 2)
4:5D6C  c8300000             enter 0x30, 0
4:5D70  c45e06               les bx, ptr [bp + 6]
4:5D73  26ff7704             push word ptr es:[bx + 4]
4:5D77  8d46e0               lea ax, [bp - 0x20]
4:5D7A  16                   push ss
4:5D7B  50                   push ax
4:5D7C  9affff0000           lcall 0, 0xffff  ; USER.BeginPaint
4:5D81  c45e06               les bx, ptr [bp + 6]
4:5D84  26c45f14             les bx, ptr es:[bx + 0x14]
4:5D88  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:5D8D  668946dc             mov dword ptr [bp - 0x24], eax
4:5D91  c45e06               les bx, ptr [bp + 6]
4:5D94  6626ff7714           push dword ptr es:[bx + 0x14]
4:5D99  9a489faf5d           lcall 0x5daf, 0x9f48  ; AnimTicker::current@s2:9F48
4:5D9E  8946d8               mov word ptr [bp - 0x28], ax
4:5DA1  8956da               mov word ptr [bp - 0x26], dx
4:5DA4  c45e06               les bx, ptr [bp + 6]
4:5DA7  6626ff7718           push dword ptr es:[bx + 0x18]
4:5DAC  9a3652c55d           lcall 0x5dc5, 0x5236  ; DibRegion::restore@s2:5236
4:5DB1  66ff76d8             push dword ptr [bp - 0x28]
4:5DB5  668b4606             mov eax, dword ptr [bp + 6]
4:5DB9  051c00               add ax, 0x1c
4:5DBC  6650                 push eax
4:5DBE  66ff76dc             push dword ptr [bp - 0x24]
4:5DC2  9a8044f25c           lcall 0x5cf2, 0x4480  ; DIB::blitRect@s2:4480
4:5DC7  668b4606             mov eax, dword ptr [bp + 6]
4:5DCB  050a00               add ax, 0xa
4:5DCE  6650                 push eax
4:5DD0  666a00               push 0
4:5DD3  c45edc               les bx, ptr [bp - 0x24]
4:5DD6  06                   push es
4:5DD7  53                   push bx
4:5DD8  26c41f               les bx, ptr es:[bx]
4:5DDB  26ff5f04             lcall es:[bx + 4]
4:5DDF  c45e06               les bx, ptr [bp + 6]
4:5DE2  26ff7704             push word ptr es:[bx + 4]
4:5DE6  8d46e0               lea ax, [bp - 0x20]
4:5DE9  16                   push ss
4:5DEA  50                   push ax
4:5DEB  9affff0000           lcall 0, 0xffff  ; USER.EndPaint
4:5DF0  c9                   leave
4:5DF1  ca0400               retf 4

; ---------------- PictureLayer::scalar_dtor@s4:5DF4 FAR size=50 callers=0
;   deleting destructor
4:5DF4  55                   push bp
4:5DF5  8bec                 mov bp, sp
4:5DF7  66ff7606             push dword ptr [bp + 6]
4:5DFB  90                   nop
4:5DFC  0e                   push cs
4:5DFD  e8c8fe               call 0x5cc8  ; PictureLayer::~PictureLayer@s4:5CC8
4:5E00  f6460a01             test byte ptr [bp + 0xa], 1
4:5E04  7409                 je 0x5e0f
4:5E06  66ff7606             push dword ptr [bp + 6]
4:5E0A  9ace17fb5c           lcall 0x5cfb, 0x17ce  ; operator_delete@s1:17CE
loc_5E0F:
4:5E0F  8b4606               mov ax, word ptr [bp + 6]
4:5E12  8b5608               mov dx, word ptr [bp + 8]
4:5E15  c9                   leave
4:5E16  ca0600               retf 6
4:5E19  db 90 f4 5d 20 5e 32 5d 24 5e 6c 5d d8 5c

; ---------------- StarSystemInfoDialog::StarSystemInfoDialog@s4:5E26 FAR size=52 callers=1
;   dialog 4048 "Star System:" (information only)
4:5E26  55                   push bp
4:5E27  8bec                 mov bp, sp
4:5E29  ff760a               push word ptr [bp + 0xa]
4:5E2C  66680000d00f         push 0xfd00000
4:5E32  666a01               push 1
4:5E35  66ff7606             push dword ptr [bp + 6]
4:5E39  9a2877f857           lcall 0x57f8, 0x7728  ; OPDialog::OPDialog@s9:7728
4:5E3E  c45e06               les bx, ptr [bp + 6]
4:5E41  26c7072861           mov word ptr es:[bx], 0x6128
4:5E46  26c747021c5e         mov word ptr es:[bx + 2], 0x5e1c  ; SEGMENT s4:0000 | 'thisLo'
4:5E4C  26c747740100         mov word ptr es:[bx + 0x74], 1
4:5E52  8bc3                 mov ax, bx
4:5E54  8cc2                 mov dx, es
4:5E56  c9                   leave
4:5E57  ca0600               retf 6

; ---------------- StarSystemInfoDialog::~StarSystemInfoDialog@s4:5E5A FAR size=44 callers=1
;   dtor
4:5E5A  55                   push bp
4:5E5B  8bec                 mov bp, sp
4:5E5D  c45e06               les bx, ptr [bp + 6]
4:5E60  26c7072861           mov word ptr es:[bx], 0x6128
4:5E65  26c747024a5e         mov word ptr es:[bx + 2], 0x5e4a  ; SEGMENT s4:0000
4:5E6B  26ff7706             push word ptr es:[bx + 6]
4:5E6F  66ff367c5b           push dword ptr [0x5b7c]
4:5E74  9ae0b68459           lcall 0x5984, 0xb6e0  ; DialogCtr::forget@s8:B6E0
4:5E79  66ff7606             push dword ptr [bp + 6]
4:5E7D  9a2c783c5e           lcall 0x5e3c, 0x782c  ; OPDialog::~OPDialog@s9:782C
4:5E82  c9                   leave
4:5E83  ca0400               retf 4

; ---------------- StarSystemInfoDialog::refresh@s4:5E86 FAR size=20 callers=0
;   (vslot 9)
4:5E86  55                   push bp
4:5E87  8bec                 mov bp, sp
4:5E89  c45e06               les bx, ptr [bp + 6]
4:5E8C  06                   push es
4:5E8D  53                   push bx
4:5E8E  26c41f               les bx, ptr es:[bx]
4:5E91  26ff5f6c             lcall es:[bx + 0x6c]
4:5E95  c9                   leave
4:5E96  ca0400               retf 4
4:5E99  db 00

; ---------------- StarSystemInfoDialog::init@s4:5E9A FAR size=352 callers=0
;   apis: USER.GetClientRect, USER.GetSystemMetrics, USER.SetWindowPos
;   (vslot 2) lists the star's planets, sizes the window
4:5E9A  c84c0000             enter 0x4c, 0
4:5E9E  66ff7606             push dword ptr [bp + 6]
4:5EA2  9ae278805e           lcall 0x5e80, 0x78e2  ; OPDialog::create@s9:78E2
4:5EA7  6a39                 push 0x39
4:5EA9  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:5EAE  9aba203c5f           lcall 0x5f3c, 0x20ba  ; Registry_get@s3:20BA
4:5EB3  c45e06               les bx, ptr [bp + 6]
4:5EB6  2689878e00           mov word ptr es:[bx + 0x8e], ax
4:5EBB  2689979000           mov word ptr es:[bx + 0x90], dx
4:5EC0  6a12                 push 0x12  ; 'version %d %d'
4:5EC2  9a9c17c35f           lcall 0x5fc3, 0x179c  ; operator_new@s1:179C
4:5EC7  83c402               add sp, 2
4:5ECA  8946cc               mov word ptr [bp - 0x34], ax
4:5ECD  8956ce               mov word ptr [bp - 0x32], dx
4:5ED0  0bd0                 or dx, ax
4:5ED2  7422                 je 0x5ef6
4:5ED4  c45e06               les bx, ptr [bp + 6]
4:5ED7  26ff7706             push word ptr es:[bx + 6]
4:5EDB  06                   push es
4:5EDC  53                   push bx
4:5EDD  ff76ce               push word ptr [bp - 0x32]
4:5EE0  50                   push ax
4:5EE1  90                   nop
4:5EE2  0e                   push cs
4:5EE3  e8b202               call 0x6198  ; PlanetFactsPainter::PlanetFactsPainter@s4:6198
4:5EE6  c45e06               les bx, ptr [bp + 6]
4:5EE9  2689879200           mov word ptr es:[bx + 0x92], ax
4:5EEE  2689979400           mov word ptr es:[bx + 0x94], dx
4:5EF3  eb0e                 jmp 0x5f03
4:5EF5  db 90
loc_5EF6:
4:5EF6  c45e06               les bx, ptr [bp + 6]
4:5EF9  6626c787920000000000 mov dword ptr es:[bx + 0x92], 0
loc_5F03:
4:5F03  c45e06               les bx, ptr [bp + 6]
4:5F06  66268b878e00         mov eax, dword ptr es:[bx + 0x8e]
4:5F0C  050a00               add ax, 0xa
4:5F0F  668946fc             mov dword ptr [bp - 4], eax
4:5F13  26ff7706             push word ptr es:[bx + 6]
4:5F17  8d46f4               lea ax, [bp - 0xc]
4:5F1A  16                   push ss
4:5F1B  50                   push ax
4:5F1C  9abb4f0000           lcall 0, 0x4fbb  ; USER.GetClientRect
4:5F21  6a04                 push 4
4:5F23  9a524b0000           lcall 0, 0x4b52  ; USER.GetSystemMetrics
4:5F28  0346fa               add ax, word ptr [bp - 6]
4:5F2B  c45efc               les bx, ptr [bp - 4]
4:5F2E  26894706             mov word ptr es:[bx + 6], ax
4:5F32  6a48                 push 0x48
4:5F34  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:5F39  9aba20155d           lcall 0x5d15, 0x20ba  ; Registry_get@s3:20BA
4:5F3E  8ec2                 mov es, dx
4:5F40  8bd8                 mov bx, ax
4:5F42  8946ec               mov word ptr [bp - 0x14], ax
4:5F45  8c46ee               mov word ptr [bp - 0x12], es
4:5F48  268b470a             mov ax, word ptr es:[bx + 0xa]
4:5F4C  8946f2               mov word ptr [bp - 0xe], ax
4:5F4F  268b470c             mov ax, word ptr es:[bx + 0xc]
4:5F53  8946f0               mov word ptr [bp - 0x10], ax
4:5F56  c45efc               les bx, ptr [bp - 4]
4:5F59  262b4706             sub ax, word ptr es:[bx + 6]
4:5F5D  99                   cdq
4:5F5E  2bc2                 sub ax, dx
4:5F60  d1f8                 sar ax, 1
4:5F62  26894702             mov word ptr es:[bx + 2], ax
4:5F66  8b46f2               mov ax, word ptr [bp - 0xe]
4:5F69  99                   cdq
4:5F6A  2bc2                 sub ax, dx
4:5F6C  d1f8                 sar ax, 1
4:5F6E  050300               add ax, 3
4:5F71  268907               mov word ptr es:[bx], ax
4:5F74  666800000001         push 0x1000000
4:5F7A  6a01                 push 1
4:5F7C  8d46da               lea ax, [bp - 0x26]
4:5F7F  16                   push ss
4:5F80  50                   push ax
4:5F81  9a52dc935f           lcall 0x5f93, 0xdc52  ; DbIter::DbIter(typeMask)@s6:DC52
4:5F86  c746d00000           mov word ptr [bp - 0x30], 0
loc_5F8B:
4:5F8B  8d46da               lea ax, [bp - 0x26]
4:5F8E  16                   push ss
4:5F8F  50                   push ax
4:5F90  9aece44946           lcall 0x4649, 0xe4ec  ; DbIter::next@s6:E4EC
4:5F95  8946d6               mov word ptr [bp - 0x2a], ax
4:5F98  8956d8               mov word ptr [bp - 0x28], dx
4:5F9B  0bd0                 or dx, ax
4:5F9D  742b                 je 0x5fca
4:5F9F  c45ed6               les bx, ptr [bp - 0x2a]
4:5FA2  66268b4710           mov eax, dword ptr es:[bx + 0x10]
4:5FA7  668946d2             mov dword ptr [bp - 0x2e], eax
4:5FAB  660bc0               or eax, eax
4:5FAE  74db                 je 0x5f8b
4:5FB0  c45ed2               les bx, ptr [bp - 0x2e]
4:5FB3  6626ff37             push dword ptr es:[bx]
4:5FB7  668b4606             mov eax, dword ptr [bp + 6]
4:5FBB  051000               add ax, 0x10
4:5FBE  6650                 push eax
4:5FC0  9aea3c0d5e           lcall 0x5e0d, 0x3cea  ; _fstrcat@s1:3CEA
4:5FC5  83c408               add sp, 8
4:5FC8  ebc1                 jmp 0x5f8b
loc_5FCA:
4:5FCA  c45e06               les bx, ptr [bp + 6]
4:5FCD  26ff7706             push word ptr es:[bx + 6]
4:5FD1  6a00                 push 0
4:5FD3  c45efc               les bx, ptr [bp - 4]
4:5FD6  26ff37               push word ptr es:[bx]
4:5FD9  26ff7702             push word ptr es:[bx + 2]
4:5FDD  26ff7704             push word ptr es:[bx + 4]
4:5FE1  26ff7706             push word ptr es:[bx + 6]
4:5FE5  6a44                 push 0x44
4:5FE7  9affff0000           lcall 0, 0xffff  ; USER.SetWindowPos
4:5FEC  c746da9a38           mov word ptr [bp - 0x26], 0x389a
4:5FF1  c746dc9c5d           mov word ptr [bp - 0x24], 0x5d9c  ; SEGMENT s2:0000
4:5FF6  c9                   leave
4:5FF7  ca0400               retf 4

; ---------------- StarSystemInfoDialog::onClose@s4:5FFA size=78 callers=0
;   (vslot 27)
4:5FFA  c8080000             enter 8, 0
4:5FFE  c45e06               les bx, ptr [bp + 6]
4:6001  268b879200           mov ax, word ptr es:[bx + 0x92]
4:6006  268b979400           mov dx, word ptr es:[bx + 0x94]
4:600B  8bda                 mov bx, dx
4:600D  0bd8                 or bx, ax
4:600F  740e                 je 0x601f
4:6011  6a01                 push 1
4:6013  52                   push dx
4:6014  50                   push ax
4:6015  8ec2                 mov es, dx
4:6017  8bd8                 mov bx, ax
4:6019  26c41f               les bx, ptr es:[bx]
4:601C  26ff1f               lcall es:[bx]
loc_601F:
4:601F  c45e06               les bx, ptr [bp + 6]
4:6022  6626c787920000000000 mov dword ptr es:[bx + 0x92], 0
4:602C  6626ffb78e00         push dword ptr es:[bx + 0x8e]
4:6032  9ada1db15e           lcall 0x5eb1, 0x1dda  ; RegObj::makeCurrent@s3:1DDA
4:6037  c45e06               les bx, ptr [bp + 6]
4:603A  6626c7878e0000000000 mov dword ptr es:[bx + 0x8e], 0
4:6044  c9                   leave
4:6045  ca0400               retf 4

; ---------------- StarSystemInfoDialog::onCommand@s4:6048 FAR size=30 callers=0
;   (vslot 24)
4:6048  55                   push bp
4:6049  8bec                 mov bp, sp
4:604B  c45e06               les bx, ptr [bp + 6]
4:604E  6626ffb79200         push dword ptr es:[bx + 0x92]
4:6054  26c49f9200           les bx, ptr es:[bx + 0x92]
4:6059  26c41f               les bx, ptr es:[bx]
4:605C  26ff5f08             lcall es:[bx + 8]
4:6060  33c0                 xor ax, ax
4:6062  c9                   leave
4:6063  ca0400               retf 4

; ---------------- setDlgItemText@s4:6066 FAR size=32 callers=1
;   apis: USER.GetDlgItem, USER.SetWindowText
;   GetDlgItem + SetWindowText
4:6066  55                   push bp
4:6067  8bec                 mov bp, sp
4:6069  c45e06               les bx, ptr [bp + 6]
4:606C  26ff7706             push word ptr es:[bx + 6]
4:6070  ff760e               push word ptr [bp + 0xe]
4:6073  9affff0000           lcall 0, 0xffff  ; USER.GetDlgItem
4:6078  50                   push ax
4:6079  66ff760a             push dword ptr [bp + 0xa]
4:607D  9affff0000           lcall 0, 0xffff  ; USER.SetWindowText
4:6082  c9                   leave
4:6083  ca0a00               retf 0xa

; ---------------- showProbeDepth@s4:6086 FAR size=100 callers=1
;   apis: USER.GetDlgItem, USER.SetWindowText, USER._wsprintf
;   a planet's depth after a geological penetrator
4:6086  c80a0000             enter 0xa, 0
4:608A  ff760c               push word ptr [bp + 0xc]
4:608D  1e                   push ds
4:608E  684242               push 0x4242
4:6091  8d46f6               lea ax, [bp - 0xa]
4:6094  16                   push ss
4:6095  50                   push ax
4:6096  9ac5600000           lcall 0, 0x60c5  ; USER._wsprintf
4:609B  83c40a               add sp, 0xa
4:609E  c45e06               les bx, ptr [bp + 6]
4:60A1  26ff7706             push word ptr es:[bx + 6]
4:60A5  68be01               push 0x1be
4:60A8  9ad7600000           lcall 0, 0x60d7  ; USER.GetDlgItem
4:60AD  50                   push ax
4:60AE  8d46f6               lea ax, [bp - 0xa]
4:60B1  16                   push ss
4:60B2  50                   push ax
4:60B3  9ae2600000           lcall 0, 0x60e2  ; USER.SetWindowText
4:60B8  ff760a               push word ptr [bp + 0xa]
4:60BB  1e                   push ds
4:60BC  684542               push 0x4245
4:60BF  8d46f6               lea ax, [bp - 0xa]
4:60C2  16                   push ss
4:60C3  50                   push ax
4:60C4  9ad4360000           lcall 0, 0x36d4  ; USER._wsprintf
4:60C9  83c40a               add sp, 0xa
4:60CC  c45e06               les bx, ptr [bp + 6]
4:60CF  26ff7706             push word ptr es:[bx + 6]
4:60D3  68bf01               push 0x1bf
4:60D6  9a74600000           lcall 0, 0x6074  ; USER.GetDlgItem
4:60DB  50                   push ax
4:60DC  8d46f6               lea ax, [bp - 0xa]
4:60DF  16                   push ss
4:60E0  50                   push ax
4:60E1  9a7e600000           lcall 0, 0x607e  ; USER.SetWindowText
4:60E6  c9                   leave
4:60E7  ca0800               retf 8

; ---------------- Dialog::nop_A@s4:60EA FAR size=4 callers=0
;   empty virtual
4:60EA  ca0a00               retf 0xa
4:60ED  db 00

; ---------------- Dialog::zero_A@s4:60EE FAR size=6 callers=0
;   virtual returning 0
4:60EE  33c0                 xor ax, ax
4:60F0  ca0a00               retf 0xa
4:60F3  db 00

; ---------------- Dialog::zero_Ab@s4:60F4 FAR size=6 callers=0
;   virtual returning 0
4:60F4  33c0                 xor ax, ax
4:60F6  ca0a00               retf 0xa
4:60F9  db 00

; ---------------- Dialog::nop_4@s4:60FA FAR size=4 callers=0
;   empty virtual
4:60FA  ca0400               retf 4
4:60FD  db 00

; ---------------- Dialog::nop_Ab@s4:60FE FAR size=4 callers=0
;   empty virtual
4:60FE  ca0a00               retf 0xa
4:6101  db 00

; ---------------- StarSystemInfoDialog::scalar_dtor@s4:6102 FAR size=150 callers=0
;   deleting destructor
4:6102  55                   push bp
4:6103  8bec                 mov bp, sp
4:6105  66ff7606             push dword ptr [bp + 6]
4:6109  90                   nop
4:610A  0e                   push cs
4:610B  e84cfd               call 0x5e5a  ; StarSystemInfoDialog::~StarSystemInfoDialog@s4:5E5A
4:610E  f6460a01             test byte ptr [bp + 0xa], 1
4:6112  7409                 je 0x611d
4:6114  66ff7606             push dword ptr [bp + 6]
4:6118  9ace17c55e           lcall 0x5ec5, 0x17ce  ; operator_delete@s1:17CE
loc_611D:
4:611D  8b4606               mov ax, word ptr [bp + 6]
4:6120  8b5608               mov dx, word ptr [bp + 8]
4:6123  c9                   leave
4:6124  ca0600               retf 6
4:6127  db 90 02 61 32 61 10 3a f4 5f 9a 5e 4e 61 c0 79 3a
4:6137  db 61 3c 7b 3e 61 98 7b 42 61 56 7f 46 61 b2 7b 4a
4:6147  db 61 1c 7f 52 61 86 5e 6e 61 86 7f 56 61 0c 80 5a
4:6157  db 61 54 80 5e 61 5e 7e 62 61 58 81 66 61 b6 81 6a
4:6167  db 61 fe 81 72 61 ea 60 7e 61 4a 82 76 61 66 82 7a
4:6177  db 61 de 78 92 61 ee 60 82 61 f4 60 86 61 fa 60 8a
4:6187  db 61 48 60 8e 61 fe 60 96 61 7e 80 a5 5e fa 5f 69
4:6197  db 5e

; ---------------- PlanetFactsPainter::PlanetFactsPainter@s4:6198 FAR size=116 callers=1
;   painter of the Star System window
4:6198  c8100000             enter 0x10, 0
4:619C  c45e06               les bx, ptr [bp + 6]
4:619F  26c7079a38           mov word ptr es:[bx], 0x389a
4:61A4  26c74702b661         mov word ptr es:[bx + 2], 0x61b6  ; SEGMENT s2:0000
4:61AA  c45e06               les bx, ptr [bp + 6]
4:61AD  26c707a83a           mov word ptr es:[bx], 0x3aa8
4:61B2  26c74702cb61         mov word ptr es:[bx + 2], 0x61cb  ; SEGMENT s2:0000
4:61B8  8b460e               mov ax, word ptr [bp + 0xe]
4:61BB  c45e06               les bx, ptr [bp + 6]
4:61BE  26894704             mov word ptr es:[bx + 4], ax
4:61C2  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
4:61C7  26c747022e61         mov word ptr es:[bx + 2], 0x612e  ; SEGMENT s2:0000
4:61CD  c45e06               les bx, ptr [bp + 6]
4:61D0  6626c7470600000000   mov dword ptr es:[bx + 6], 0
4:61D9  668b460a             mov eax, dword ptr [bp + 0xa]
4:61DD  662689470a           mov dword ptr es:[bx + 0xa], eax
4:61E2  26c707c066           mov word ptr es:[bx], 0x66c0
4:61E7  26c747022a61         mov word ptr es:[bx + 2], 0x612a  ; SEGMENT s4:0000
4:61ED  6a39                 push 0x39
4:61EF  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:61F4  9aba203560           lcall 0x6035, 0x20ba  ; Registry_get@s3:20BA
4:61F9  c45e06               les bx, ptr [bp + 6]
4:61FC  26894706             mov word ptr es:[bx + 6], ax
4:6200  26895708             mov word ptr es:[bx + 8], dx
4:6204  8bc3                 mov ax, bx
4:6206  8cc2                 mov dx, es
4:6208  c9                   leave
4:6209  ca0a00               retf 0xa

; ---------------- PlanetFactsPainter::~PlanetFactsPainter@s4:620C FAR size=50 callers=1
;   dtor
4:620C  c80c0000             enter 0xc, 0
4:6210  c45e06               les bx, ptr [bp + 6]
4:6213  26c707c066           mov word ptr es:[bx], 0x66c0
4:6218  26c74702eb61         mov word ptr es:[bx + 2], 0x61eb  ; SEGMENT s4:0000
4:621E  c45e06               les bx, ptr [bp + 6]
4:6221  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
4:6226  26c747023862         mov word ptr es:[bx + 2], 0x6238  ; SEGMENT s2:0000
4:622C  c45e06               les bx, ptr [bp + 6]
4:622F  26c7079a38           mov word ptr es:[bx], 0x389a
4:6234  26c74702a861         mov word ptr es:[bx + 2], 0x61a8  ; SEGMENT s2:0000
4:623A  c9                   leave
4:623B  ca0400               retf 4

; ---------------- PlanetFactsPainter::paint@s4:623E size=496 callers=0
;   apis: GDI.CreatePen, GDI.CreateSolidBrush, GDI.DeleteObject, GDI.SelectObject, USER.BeginPaint, USER.EndPaint, USER.SelectPalette
;   (vslot 2) the planets in a row, the selected one's facts
4:623E  c8480000             enter 0x48, 0
4:6242  57                   push di
4:6243  56                   push si
4:6244  c45e06               les bx, ptr [bp + 6]
4:6247  26ff7704             push word ptr es:[bx + 4]
4:624B  8d46e0               lea ax, [bp - 0x20]
4:624E  16                   push ss
4:624F  50                   push ax
4:6250  9a7d5d0000           lcall 0, 0x5d7d  ; USER.BeginPaint
4:6255  8946de               mov word ptr [bp - 0x22], ax
4:6258  c45e06               les bx, ptr [bp + 6]
4:625B  6626ff7706           push dword ptr es:[bx + 6]
4:6260  9a2c4c3a63           lcall 0x633a, 0x4c2c  ; PlanetPicker::list@s3:4C2C
4:6265  8946da               mov word ptr [bp - 0x26], ax
4:6268  8956dc               mov word ptr [bp - 0x24], dx
4:626B  8d46de               lea ax, [bp - 0x22]
4:626E  16                   push ss
4:626F  50                   push ax
4:6270  c45eda               les bx, ptr [bp - 0x26]
4:6273  06                   push es
4:6274  53                   push bx
4:6275  26c41f               les bx, ptr es:[bx]
4:6278  26ff5f08             lcall es:[bx + 8]
4:627C  c45e06               les bx, ptr [bp + 6]
4:627F  26894710             mov word ptr es:[bx + 0x10], ax
4:6283  c45e06               les bx, ptr [bp + 6]
4:6286  26c45f06             les bx, ptr es:[bx + 6]
4:628A  268b4730             mov ax, word ptr es:[bx + 0x30]
4:628E  8946d8               mov word ptr [bp - 0x28], ax
4:6291  c45e06               les bx, ptr [bp + 6]
4:6294  26c45f06             les bx, ptr es:[bx + 6]
4:6298  26c45f12             les bx, ptr es:[bx + 0x12]
4:629C  66268b07             mov eax, dword ptr es:[bx]
4:62A0  668946d4             mov dword ptr [bp - 0x2c], eax
4:62A4  c746d21400           mov word ptr [bp - 0x2e], 0x14
4:62A9  c746d00000           mov word ptr [bp - 0x30], 0
4:62AE  8d46ca               lea ax, [bp - 0x36]
4:62B1  16                   push ss
4:62B2  50                   push ax
4:62B3  9a383ed262           lcall 0x62d2, 0x3e38  ; Pos3::Pos3@s2:3E38
4:62B8  c746c80000           mov word ptr [bp - 0x38], 0
4:62BD  e99500               jmp 0x6355
loc_62C0:
4:62C0  8b5ec8               mov bx, word ptr [bp - 0x38]
4:62C3  c1e302               shl bx, 2
4:62C6  c476d4               les si, ptr [bp - 0x2c]
4:62C9  6626ff30             push dword ptr es:[bx + si]
4:62CD  8bfb                 mov di, bx
4:62CF  9a7247fe62           lcall 0x62fe, 0x4772  ; DIB::rect@s2:4772
4:62D4  8946bc               mov word ptr [bp - 0x44], ax
4:62D7  8956be               mov word ptr [bp - 0x42], dx
4:62DA  8ec2                 mov es, dx
4:62DC  8bd8                 mov bx, ax
4:62DE  26ff7708             push word ptr es:[bx + 8]
4:62E2  8d46d0               lea ax, [bp - 0x30]
4:62E5  16                   push ss
4:62E6  50                   push ax
4:62E7  66ff7606             push dword ptr [bp + 6]
4:62EB  90                   nop
4:62EC  0e                   push cs
4:62ED  e83e01               call 0x642e  ; PlanetFactsPainter::barTop@s4:642E
4:62F0  66ff76d0             push dword ptr [bp - 0x30]
4:62F4  6a00                 push 0
4:62F6  8d46ca               lea ax, [bp - 0x36]
4:62F9  16                   push ss
4:62FA  50                   push ax
4:62FB  9a763e1363           lcall 0x6313, 0x3e76  ; Pos3::set@s2:3E76
4:6300  c45ed4               les bx, ptr [bp - 0x2c]
4:6303  6626ff31             push dword ptr es:[bx + di]
4:6307  8d46ca               lea ax, [bp - 0x36]
4:630A  16                   push ss
4:630B  50                   push ax
4:630C  66ff76da             push dword ptr [bp - 0x26]
4:6310  9a80442a62           lcall 0x622a, 0x4480  ; DIB::blitRect@s2:4480
4:6315  ff76c8               push word ptr [bp - 0x38]
4:6318  66ff76d0             push dword ptr [bp - 0x30]
4:631C  c45ebc               les bx, ptr [bp - 0x44]
4:631F  268b4704             mov ax, word ptr es:[bx + 4]
4:6323  0346d2               add ax, word ptr [bp - 0x2e]
4:6326  50                   push ax
4:6327  268b4708             mov ax, word ptr es:[bx + 8]
4:632B  0346d0               add ax, word ptr [bp - 0x30]
4:632E  50                   push ax
4:632F  c45e06               les bx, ptr [bp + 6]
4:6332  6626ff7706           push dword ptr es:[bx + 6]
4:6337  9a5c4dc463           lcall 0x63c4, 0x4d5c  ; PlanetPicker::entries@s3:4D5C
4:633C  c45ebc               les bx, ptr [bp - 0x44]
4:633F  837ec801             cmp word ptr [bp - 0x38], 1
4:6343  1bc0                 sbb ax, ax
4:6345  250500               and ax, 5
4:6348  051400               add ax, 0x14
4:634B  26034704             add ax, word ptr es:[bx + 4]
4:634F  0146d2               add word ptr [bp - 0x2e], ax
4:6352  ff46c8               inc word ptr [bp - 0x38]
loc_6355:
4:6355  8b46d8               mov ax, word ptr [bp - 0x28]
4:6358  3946c8               cmp word ptr [bp - 0x38], ax
4:635B  0f8c61ff             jl 0x62c0
4:635F  8d46de               lea ax, [bp - 0x22]
4:6362  16                   push ss
4:6363  50                   push ax
4:6364  666a00               push 0
4:6367  c45eda               les bx, ptr [bp - 0x26]
4:636A  06                   push es
4:636B  53                   push bx
4:636C  26c41f               les bx, ptr es:[bx]
4:636F  26ff5f04             lcall es:[bx + 4]
4:6373  666a01               push 1
4:6376  666825000001         push 0x1000025
4:637C  9affff0000           lcall 0, 0xffff  ; GDI.CreatePen
4:6381  8946c6               mov word ptr [bp - 0x3a], ax
4:6384  ff76de               push word ptr [bp - 0x22]
4:6387  50                   push ax
4:6388  9aa3630000           lcall 0, 0x63a3  ; GDI.SelectObject
4:638D  8946c4               mov word ptr [bp - 0x3c], ax
4:6390  666825000001         push 0x1000025
4:6396  9affff0000           lcall 0, 0xffff  ; GDI.CreateSolidBrush
4:639B  8946c2               mov word ptr [bp - 0x3e], ax
4:639E  ff76de               push word ptr [bp - 0x22]
4:63A1  50                   push ax
4:63A2  9afb630000           lcall 0, 0x63fb  ; GDI.SelectObject
4:63A7  8946c0               mov word ptr [bp - 0x40], ax
4:63AA  ff76de               push word ptr [bp - 0x22]
4:63AD  66ff7606             push dword ptr [bp + 6]
4:63B1  90                   nop
4:63B2  0e                   push cs
4:63B3  e88e00               call 0x6444  ; PlanetFactsPainter::drawOrbit@s4:6444
4:63B6  ff76de               push word ptr [bp - 0x22]
4:63B9  c45e06               les bx, ptr [bp + 6]
4:63BC  6626ff7706           push dword ptr es:[bx + 6]
4:63C1  9ac84df761           lcall 0x61f7, 0x4dc8  ; PlanetPicker::selected@s3:4DC8
4:63C6  52                   push dx
4:63C7  50                   push ax
4:63C8  66ff7606             push dword ptr [bp + 6]
4:63CC  90                   nop
4:63CD  0e                   push cs
4:63CE  e87301               call 0x6544  ; PlanetFactsPainter::drawMarker@s4:6544
4:63D1  ff76de               push word ptr [bp - 0x22]
4:63D4  66ff7606             push dword ptr [bp + 6]
4:63D8  90                   nop
4:63D9  0e                   push cs
4:63DA  e85302               call 0x6630  ; PlanetFactsPainter::showFacts@s4:6630
4:63DD  ff76de               push word ptr [bp - 0x22]
4:63E0  c45e06               les bx, ptr [bp + 6]
4:63E3  26ff7710             push word ptr es:[bx + 0x10]
4:63E7  6a00                 push 0
4:63E9  9a464d0000           lcall 0, 0x4d46  ; USER.SelectPalette
4:63EE  50                   push ax
4:63EF  9a01640000           lcall 0, 0x6401  ; GDI.DeleteObject
4:63F4  ff76de               push word ptr [bp - 0x22]
4:63F7  ff76c4               push word ptr [bp - 0x3c]
4:63FA  9a0c640000           lcall 0, 0x640c  ; GDI.SelectObject
4:63FF  50                   push ax
4:6400  9a12640000           lcall 0, 0x6412  ; GDI.DeleteObject
4:6405  ff76de               push word ptr [bp - 0x22]
4:6408  ff76c0               push word ptr [bp - 0x40]
4:640B  9affff0000           lcall 0, 0xffff  ; GDI.SelectObject
4:6410  50                   push ax
4:6411  9a4c4d0000           lcall 0, 0x4d4c  ; GDI.DeleteObject
4:6416  c45e06               les bx, ptr [bp + 6]
4:6419  26ff7704             push word ptr es:[bx + 4]
4:641D  8d46e0               lea ax, [bp - 0x20]
4:6420  16                   push ss
4:6421  50                   push ax
4:6422  9aec5d0000           lcall 0, 0x5dec  ; USER.EndPaint
4:6427  5e                   pop si
4:6428  5f                   pop di
4:6429  c9                   leave
4:642A  ca0400               retf 4
4:642D  db 00

; ---------------- PlanetFactsPainter::barTop@s4:642E FAR size=22 callers=1
;   (100 - n) / 2
4:642E  55                   push bp
4:642F  8bec                 mov bp, sp
4:6431  b86400               mov ax, 0x64
4:6434  2b460e               sub ax, word ptr [bp + 0xe]
4:6437  d1f8                 sar ax, 1
4:6439  c45e0a               les bx, ptr [bp + 0xa]
4:643C  268907               mov word ptr es:[bx], ax
4:643F  c9                   leave
4:6440  ca0a00               retf 0xa
4:6443  db 00

; ---------------- PlanetFactsPainter::drawOrbit@s4:6444 FAR size=256 callers=1
;   apis: GDI.LineTo, GDI.MoveTo
;   draws lines
4:6444  c8100000             enter 0x10, 0
4:6448  56                   push si
4:6449  c45e06               les bx, ptr [bp + 6]
4:644C  26c45f06             les bx, ptr es:[bx + 6]
4:6450  268b4730             mov ax, word ptr es:[bx + 0x30]
4:6454  8946fe               mov word ptr [bp - 2], ax
4:6457  c45e06               les bx, ptr [bp + 6]
4:645A  26c45f06             les bx, ptr es:[bx + 6]
4:645E  66268b471a           mov eax, dword ptr es:[bx + 0x1a]
4:6463  668946fa             mov dword ptr [bp - 6], eax
4:6467  ff760a               push word ptr [bp + 0xa]
4:646A  c45efa               les bx, ptr [bp - 6]
4:646D  26ff37               push word ptr es:[bx]
4:6470  6a05                 push 5
4:6472  9ab7640000           lcall 0, 0x64b7  ; GDI.MoveTo
4:6477  ff760a               push word ptr [bp + 0xa]
4:647A  8b76fe               mov si, word ptr [bp - 2]
4:647D  c1e603               shl si, 3
4:6480  c45efa               les bx, ptr [bp - 6]
4:6483  26ff70fc             push word ptr es:[bx + si - 4]
4:6487  6a05                 push 5
4:6489  9ac4640000           lcall 0, 0x64c4  ; GDI.LineTo
4:648E  c746f80000           mov word ptr [bp - 8], 0
4:6493  eb36                 jmp 0x64cb
4:6495  db 90
loc_6496:
4:6496  8b5ef8               mov bx, word ptr [bp - 8]
4:6499  c1e303               shl bx, 3
4:649C  c476fa               les si, ptr [bp - 6]
4:649F  03de                 add bx, si
4:64A1  268b4704             mov ax, word ptr es:[bx + 4]
4:64A5  262b07               sub ax, word ptr es:[bx]
4:64A8  d1f8                 sar ax, 1
4:64AA  260307               add ax, word ptr es:[bx]
4:64AD  8946f4               mov word ptr [bp - 0xc], ax
4:64B0  ff760a               push word ptr [bp + 0xa]
4:64B3  50                   push ax
4:64B4  6a05                 push 5
4:64B6  9adf640000           lcall 0, 0x64df  ; GDI.MoveTo
4:64BB  ff760a               push word ptr [bp + 0xa]
4:64BE  ff76f4               push word ptr [bp - 0xc]
4:64C1  6a0a                 push 0xa
4:64C3  9af6640000           lcall 0, 0x64f6  ; GDI.LineTo
4:64C8  ff46f8               inc word ptr [bp - 8]
loc_64CB:
4:64CB  8b46fe               mov ax, word ptr [bp - 2]
4:64CE  3946f8               cmp word ptr [bp - 8], ax
4:64D1  7cc3                 jl 0x6496
4:64D3  ff760a               push word ptr [bp + 0xa]
4:64D6  c45efa               les bx, ptr [bp - 6]
4:64D9  26ff37               push word ptr es:[bx]
4:64DC  6a5f                 push 0x5f
4:64DE  9a23650000           lcall 0, 0x6523  ; GDI.MoveTo
4:64E3  ff760a               push word ptr [bp + 0xa]
4:64E6  8b76fe               mov si, word ptr [bp - 2]
4:64E9  c1e603               shl si, 3
4:64EC  c45efa               les bx, ptr [bp - 6]
4:64EF  26ff70fc             push word ptr es:[bx + si - 4]
4:64F3  6a5f                 push 0x5f
4:64F5  9a30650000           lcall 0, 0x6530  ; GDI.LineTo
4:64FA  c746f80000           mov word ptr [bp - 8], 0
4:64FF  eb36                 jmp 0x6537
4:6501  db 90
loc_6502:
4:6502  8b5ef8               mov bx, word ptr [bp - 8]
4:6505  c1e303               shl bx, 3
4:6508  c476fa               les si, ptr [bp - 6]
4:650B  03de                 add bx, si
4:650D  268b4704             mov ax, word ptr es:[bx + 4]
4:6511  262b07               sub ax, word ptr es:[bx]
4:6514  d1f8                 sar ax, 1
4:6516  260307               add ax, word ptr es:[bx]
4:6519  8946f4               mov word ptr [bp - 0xc], ax
4:651C  ff760a               push word ptr [bp + 0xa]
4:651F  50                   push ax
4:6520  6a5f                 push 0x5f
4:6522  9affff0000           lcall 0, 0xffff  ; GDI.MoveTo
4:6527  ff760a               push word ptr [bp + 0xa]
4:652A  ff76f4               push word ptr [bp - 0xc]
4:652D  6a5a                 push 0x5a
4:652F  9affff0000           lcall 0, 0xffff  ; GDI.LineTo
4:6534  ff46f8               inc word ptr [bp - 8]
loc_6537:
4:6537  8b46fe               mov ax, word ptr [bp - 2]
4:653A  3946f8               cmp word ptr [bp - 8], ax
4:653D  7cc3                 jl 0x6502
4:653F  5e                   pop si
4:6540  c9                   leave
4:6541  ca0600               retf 6

; ---------------- PlanetFactsPainter::drawMarker@s4:6544 FAR size=86 callers=1
;   a triangle under the selected planet
4:6544  c80c0000             enter 0xc, 0
4:6548  66837e0a00           cmp dword ptr [bp + 0xa], 0
4:654D  7447                 je 0x6596
4:654F  c45e0a               les bx, ptr [bp + 0xa]
4:6552  268b4704             mov ax, word ptr es:[bx + 4]
4:6556  262b07               sub ax, word ptr es:[bx]
4:6559  d1f8                 sar ax, 1
4:655B  260307               add ax, word ptr es:[bx]
4:655E  8946fe               mov word ptr [bp - 2], ax
4:6561  50                   push ax
4:6562  666800005700         push 0x570000
4:6568  8d46f8               lea ax, [bp - 8]
4:656B  16                   push ss
4:656C  50                   push ax
4:656D  9a543eb662           lcall 0x62b6, 0x3e54  ; Pos3::Pos3(x,y,z)@s2:3E54
4:6572  ff760e               push word ptr [bp + 0xe]
4:6575  8d46f8               lea ax, [bp - 8]
4:6578  16                   push ss
4:6579  50                   push ax
4:657A  66ff7606             push dword ptr [bp + 6]
4:657E  90                   nop
4:657F  0e                   push cs
4:6580  e81700               call 0x659a  ; PlanetFactsPainter::markerPoints@s4:659A
4:6583  8946f4               mov word ptr [bp - 0xc], ax
4:6586  8956f6               mov word ptr [bp - 0xa], dx
4:6589  52                   push dx
4:658A  50                   push ax
4:658B  6a03                 push 3
4:658D  66ff7606             push dword ptr [bp + 6]
4:6591  90                   nop
4:6592  0e                   push cs
4:6593  e88600               call 0x661c  ; PlanetFactsPainter::polygon@s4:661C
loc_6596:
4:6596  c9                   leave
4:6597  ca0a00               retf 0xa

; ---------------- PlanetFactsPainter::markerPoints@s4:659A FAR size=130 callers=1
;   the triangle's points
4:659A  c8100000             enter 0x10, 0
4:659E  57                   push di
4:659F  56                   push si
4:65A0  8d46fe               lea ax, [bp - 2]
4:65A3  16                   push ss
4:65A4  50                   push ax
4:65A5  8d46fc               lea ax, [bp - 4]
4:65A8  16                   push ss
4:65A9  50                   push ax
4:65AA  66ff760a             push dword ptr [bp + 0xa]
4:65AE  9a943e7065           lcall 0x6570, 0x3e94  ; Pos3::getXY@s2:3E94
4:65B3  c746f84842           mov word ptr [bp - 8], 0x4248
4:65B8  8c5efa               mov word ptr [bp - 6], ds
4:65BB  c746f60300           mov word ptr [bp - 0xa], 3
4:65C0  6a0c                 push 0xc
4:65C2  9a9c171b61           lcall 0x611b, 0x179c  ; operator_new@s1:179C
4:65C7  83c402               add sp, 2
4:65CA  8946f2               mov word ptr [bp - 0xe], ax
4:65CD  8956f4               mov word ptr [bp - 0xc], dx
4:65D0  c746f00000           mov word ptr [bp - 0x10], 0
4:65D5  eb31                 jmp 0x6608
4:65D7  db 90
loc_65D8:
4:65D8  8b5ef0               mov bx, word ptr [bp - 0x10]
4:65DB  c1e302               shl bx, 2
4:65DE  c476f8               les si, ptr [bp - 8]
4:65E1  268b00               mov ax, word ptr es:[bx + si]
4:65E4  0346fe               add ax, word ptr [bp - 2]
4:65E7  c47ef2               les di, ptr [bp - 0xe]
4:65EA  268901               mov word ptr es:[bx + di], ax
4:65ED  8bc3                 mov ax, bx
4:65EF  035ef8               add bx, word ptr [bp - 8]
4:65F2  8e46fa               mov es, word ptr [bp - 6]
4:65F5  268b4f02             mov cx, word ptr es:[bx + 2]
4:65F9  034efc               add cx, word ptr [bp - 4]
4:65FC  c45ef2               les bx, ptr [bp - 0xe]
4:65FF  03d8                 add bx, ax
4:6601  26894f02             mov word ptr es:[bx + 2], cx
4:6605  ff46f0               inc word ptr [bp - 0x10]
loc_6608:
4:6608  8b46f6               mov ax, word ptr [bp - 0xa]
4:660B  3946f0               cmp word ptr [bp - 0x10], ax
4:660E  7cc8                 jl 0x65d8
4:6610  8b46f2               mov ax, word ptr [bp - 0xe]
4:6613  8b56f4               mov dx, word ptr [bp - 0xc]
4:6616  5e                   pop si
4:6617  5f                   pop di
4:6618  c9                   leave
4:6619  ca0800               retf 8

; ---------------- PlanetFactsPainter::polygon@s4:661C FAR size=20 callers=1
;   apis: GDI.Polygon
;   GDI Polygon
4:661C  55                   push bp
4:661D  8bec                 mov bp, sp
4:661F  66ff760e             push dword ptr [bp + 0xe]
4:6623  66ff760a             push dword ptr [bp + 0xa]
4:6627  9affff0000           lcall 0, 0xffff  ; GDI.Polygon
4:662C  c9                   leave
4:662D  ca0c00               retf 0xc

; ---------------- PlanetFactsPainter::showFacts@s4:6630 FAR size=106 callers=1
;   the RCDATA fact sheet into the dialog
4:6630  c80c0000             enter 0xc, 0
4:6634  c45e06               les bx, ptr [bp + 6]
4:6637  6626ff7706           push dword ptr es:[bx + 6]
4:663C  9a9e4e6f66           lcall 0x666f, 0x4e9e  ; planetFacts@s3:4E9E
4:6641  8956fe               mov word ptr [bp - 2], dx
4:6644  0bd0                 or dx, ax
4:6646  744e                 je 0x6696
4:6648  8b56fe               mov dx, word ptr [bp - 2]
4:664B  8946f8               mov word ptr [bp - 8], ax
4:664E  8956fa               mov word ptr [bp - 6], dx
4:6651  c746f60000           mov word ptr [bp - 0xa], 0
4:6656  eb03                 jmp 0x665b
loc_6658:
4:6658  ff46f6               inc word ptr [bp - 0xa]
loc_665B:
4:665B  837ef609             cmp word ptr [bp - 0xa], 9
4:665F  7d35                 jge 0x6696
4:6661  ff76f6               push word ptr [bp - 0xa]
4:6664  c45e06               les bx, ptr [bp + 6]
4:6667  6626ff7706           push dword ptr es:[bx + 6]
4:666C  9a204f6362           lcall 0x6263, 0x4f20  ; planetFactsId@s3:4F20
4:6671  50                   push ax
4:6672  66ff76f8             push dword ptr [bp - 8]
4:6676  c45e06               les bx, ptr [bp + 6]
4:6679  6626ff770a           push dword ptr es:[bx + 0xa]
4:667E  90                   nop
4:667F  0e                   push cs
4:6680  e8e3f9               call 0x6066  ; setDlgItemText@s4:6066
4:6683  66ff76f8             push dword ptr [bp - 8]
4:6687  9aa43dc565           lcall 0x65c5, 0x3da4  ; _fstrlen@s1:3DA4
4:668C  83c404               add sp, 4
4:668F  40                   inc ax
4:6690  0146f8               add word ptr [bp - 8], ax
4:6693  ebc3                 jmp 0x6658
4:6695  db 90
loc_6696:
4:6696  c9                   leave
4:6697  ca0600               retf 6

; ---------------- PlanetFactsPainter::scalar_dtor@s4:669A FAR size=50 callers=0
;   deleting destructor
4:669A  55                   push bp
4:669B  8bec                 mov bp, sp
4:669D  66ff7606             push dword ptr [bp + 6]
4:66A1  90                   nop
4:66A2  0e                   push cs
4:66A3  e866fb               call 0x620c  ; PlanetFactsPainter::~PlanetFactsPainter@s4:620C
4:66A6  f6460a01             test byte ptr [bp + 0xa], 1
4:66AA  7409                 je 0x66b5
4:66AC  66ff7606             push dword ptr [bp + 6]
4:66B0  9ace178a66           lcall 0x668a, 0x17ce  ; operator_delete@s1:17CE
loc_66B5:
4:66B5  8b4606               mov ax, word ptr [bp + 6]
4:66B8  8b5608               mov dx, word ptr [bp + 8]
4:66BB  c9                   leave
4:66BC  ca0600               retf 6
4:66BF  db 90 9a 66 ca 66 10 3a b1 65 3e 62 1c 62

; ---------------- Mode8View::Mode8View@s4:66CC FAR size=112 callers=1
;   mode view with a picture layer (getKid)
4:66CC  55                   push bp
4:66CD  8bec                 mov bp, sp
4:66CF  66ff760c             push dword ptr [bp + 0xc]
4:66D3  ff760a               push word ptr [bp + 0xa]
4:66D6  6a0a                 push 0xa
4:66D8  66ff7606             push dword ptr [bp + 6]
4:66DC  9a7a7f2b5d           lcall 0x5d2b, 0x7f7a  ; ScreenView::ScreenView@s5:7F7A
4:66E1  c45e06               les bx, ptr [bp + 6]
4:66E4  662bc0               sub eax, eax
4:66E7  66268987ee00         mov dword ptr es:[bx + 0xee], eax
4:66ED  66268987f200         mov dword ptr es:[bx + 0xf2], eax
4:66F3  26c7078068           mov word ptr es:[bx], 0x6880
4:66F8  26c747020a67         mov word ptr es:[bx + 2], 0x670a  ; SEGMENT s4:0000
4:66FE  26c787e2001c69       mov word ptr es:[bx + 0xe2], 0x691c
4:6705  26c787e400c266       mov word ptr es:[bx + 0xe4], 0x66c2  ; SEGMENT s4:0000
4:670C  6a0b                 push 0xb
4:670E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:6713  9aba203f66           lcall 0x663f, 0x20ba  ; Registry_get@s3:20BA
4:6718  c45e06               les bx, ptr [bp + 6]
4:671B  268987f200           mov word ptr es:[bx + 0xf2], ax
4:6720  268997f400           mov word ptr es:[bx + 0xf4], dx
4:6725  268b87f200           mov ax, word ptr es:[bx + 0xf2]
4:672A  268987e600           mov word ptr es:[bx + 0xe6], ax
4:672F  268997e800           mov word ptr es:[bx + 0xe8], dx
4:6734  8bc3                 mov ax, bx
4:6736  8cc2                 mov dx, es
4:6738  c9                   leave
4:6739  ca0a00               retf 0xa

; ---------------- Mode8View::~Mode8View@s4:673C FAR size=44 callers=1
;   dtor
4:673C  55                   push bp
4:673D  8bec                 mov bp, sp
4:673F  c45e06               les bx, ptr [bp + 6]
4:6742  26c7078068           mov word ptr es:[bx], 0x6880
4:6747  26c747025967         mov word ptr es:[bx + 2], 0x6759  ; SEGMENT s4:0000
4:674D  26c787e2001c69       mov word ptr es:[bx + 0xe2], 0x691c
4:6754  26c787e400fc66       mov word ptr es:[bx + 0xe4], 0x66fc  ; SEGMENT s4:0000
4:675B  66ff7606             push dword ptr [bp + 6]
4:675F  9a8e80df66           lcall 0x66df, 0x808e  ; ScreenView::~ScreenView@s5:808E
4:6764  c9                   leave
4:6765  ca0400               retf 4

; ---------------- Mode8View::onShow@s4:6768 size=78 callers=0
;   (vslot 13) opens its window (s8:AF40)
4:6768  c8060000             enter 6, 0
4:676C  c45e06               les bx, ptr [bp + 6]
4:676F  268b87f000           mov ax, word ptr es:[bx + 0xf0]
4:6774  260b87ee00           or ax, word ptr es:[bx + 0xee]
4:6779  7412                 je 0x678d
4:677B  6626ffb7ee00         push dword ptr es:[bx + 0xee]
4:6781  26c49fee00           les bx, ptr es:[bx + 0xee]
4:6786  26c41f               les bx, ptr es:[bx]
4:6789  26ff5f08             lcall es:[bx + 8]
loc_678D:
4:678D  c45e06               les bx, ptr [bp + 6]
4:6790  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
4:6796  751a                 jne 0x67b2
4:6798  26c787ea000100       mov word ptr es:[bx + 0xea], 1
4:679F  6a16                 push 0x16
4:67A1  c45e06               les bx, ptr [bp + 6]
4:67A4  26ff7708             push word ptr es:[bx + 8]
4:67A8  66ff367c5b           push dword ptr [0x5b7c]
4:67AD  9a40af775e           lcall 0x5e77, 0xaf40  ; DialogCtr::open@s8:AF40
loc_67B2:
4:67B2  c9                   leave
4:67B3  ca0400               retf 4

; ---------------- Mode8View::create@s4:67B6 size=100 callers=0
;   (vslot 2)
4:67B6  c8040000             enter 4, 0
4:67BA  66ff7606             push dword ptr [bp + 6]
4:67BE  9a6097c666           lcall 0x66c6, 0x9760  ; SOLWnd::create@s2:9760
4:67C3  c45e06               les bx, ptr [bp + 6]
4:67C6  26ff7708             push word ptr es:[bx + 8]
4:67CA  6626ffb7f200         push dword ptr es:[bx + 0xf2]
4:67D0  90                   nop
4:67D1  0e                   push cs
4:67D2  e8dbe5               call 0x4db0  ; CmdTarget::getDC@s4:4DB0
4:67D5  6a18                 push 0x18
4:67D7  9a9c17b366           lcall 0x66b3, 0x179c  ; operator_new@s1:179C
4:67DC  83c402               add sp, 2
4:67DF  8956fe               mov word ptr [bp - 2], dx
4:67E2  0bd0                 or dx, ax
4:67E4  7422                 je 0x6808
4:67E6  c45e06               les bx, ptr [bp + 6]
4:67E9  26ff7708             push word ptr es:[bx + 8]
4:67ED  ff76fe               push word ptr [bp - 2]
4:67F0  50                   push ax
4:67F1  90                   nop
4:67F2  0e                   push cs
4:67F3  e82e01               call 0x6924  ; Mode8Layer::Mode8Layer@s4:6924
4:67F6  c45e06               les bx, ptr [bp + 6]
4:67F9  268987ee00           mov word ptr es:[bx + 0xee], ax
4:67FE  268997f000           mov word ptr es:[bx + 0xf0], dx
4:6803  c9                   leave
4:6804  ca0400               retf 4
4:6807  db 90
loc_6808:
4:6808  c45e06               les bx, ptr [bp + 6]
4:680B  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
4:6815  c9                   leave
4:6816  ca0400               retf 4
4:6819  db 00

; ---------------- Mode8View::destroy@s4:681A FAR size=50 callers=0
;   (vslot 36)
4:681A  c8080000             enter 8, 0
4:681E  c45e06               les bx, ptr [bp + 6]
4:6821  268b87ee00           mov ax, word ptr es:[bx + 0xee]
4:6826  268b97f000           mov dx, word ptr es:[bx + 0xf0]
4:682B  8bda                 mov bx, dx
4:682D  0bd8                 or bx, ax
4:682F  740e                 je 0x683f
4:6831  6a01                 push 1
4:6833  52                   push dx
4:6834  50                   push ax
4:6835  8ec2                 mov es, dx
4:6837  8bd8                 mov bx, ax
4:6839  26c41f               les bx, ptr es:[bx]
4:683C  26ff1f               lcall es:[bx]
loc_683F:
4:683F  66ff7606             push dword ptr [bp + 6]
4:6843  9a8e62c167           lcall 0x67c1, 0x628e  ; DanWnd::destroy@s2:628E
4:6848  c9                   leave
4:6849  ca0400               retf 4

; ---------------- Mode8View::thunk_dtor@s4:684C FAR size=14 callers=0
;   this-adjusting thunk
4:684C  8bdc                 mov bx, sp
4:684E  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
4:6854  e90300               jmp 0x685a
4:6857  db 90 90 00

; ---------------- Mode8View::scalar_dtor@s4:685A FAR size=202 callers=0
;   deleting destructor
4:685A  55                   push bp
4:685B  8bec                 mov bp, sp
4:685D  66ff7606             push dword ptr [bp + 6]
4:6861  90                   nop
4:6862  0e                   push cs
4:6863  e8d6fe               call 0x673c  ; Mode8View::~Mode8View@s4:673C
4:6866  f6460a01             test byte ptr [bp + 0xa], 1
4:686A  7409                 je 0x6875
4:686C  66ff7606             push dword ptr [bp + 6]
4:6870  9ace17da67           lcall 0x67da, 0x17ce  ; operator_delete@s1:17CE
loc_6875:
4:6875  8b4606               mov ax, word ptr [bp + 6]
4:6878  8b5608               mov dx, word ptr [bp + 8]
4:687B  c9                   leave
4:687C  ca0600               retf 6
4:687F  db 90 5a 68 8a 68 ea 68 8e 68 b6 67 b6 68 c6 68 92
4:688F  db 68 40 96 96 68 64 96 9a 68 2c 37 9e 68 f2 97 a2
4:689F  db 68 3c 37 a6 68 40 37 aa 68 44 37 ae 68 48 37 b2
4:68AF  db 68 4c 37 ba 68 68 67 12 69 98 96 c2 68 50 82 e2
4:68BF  db 68 54 37 c6 68 60 9c ca 68 58 37 ce 68 24 63 d2
4:68CF  db 68 4e 9c d6 68 62 37 da 68 4a 9c de 68 66 37 e6
4:68DF  db 68 06 81 0e 69 4a 6a ea 68 2e 6b ee 68 02 6b f2
4:68EF  db 68 7a 37 f6 68 52 9c fa 68 56 9c fe 68 16 9c 02
4:68FF  db 69 30 9c 06 69 86 9c 0a 69 c4 9c 16 69 c0 81 1a
4:690F  db 69 1a 68 4b 67 28 63 46 68 28 81 62 67 4c 68 82
4:691F  db 68 10 3a 86 68

; ---------------- Mode8Layer::Mode8Layer@s4:6924 FAR size=136 callers=1
;   its picture layer
4:6924  c80c0000             enter 0xc, 0
4:6928  66ff7608             push dword ptr [bp + 8]
4:692C  ff7606               push word ptr [bp + 6]
4:692F  9a1c929f69           lcall 0x699f, 0x921c  ; Layer::Layer@s5:921C
4:6934  c45e06               les bx, ptr [bp + 6]
4:6937  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:6940  26c707026a           mov word ptr es:[bx], 0x6a02
4:6945  26c747021e69         mov word ptr es:[bx + 2], 0x691e  ; SEGMENT s4:0000
4:694B  6a0b                 push 0xb
4:694D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:6952  9aba201667           lcall 0x6716, 0x20ba  ; Registry_get@s3:20BA
4:6957  c45e06               les bx, ptr [bp + 6]
4:695A  26894714             mov word ptr es:[bx + 0x14], ax
4:695E  26895716             mov word ptr es:[bx + 0x16], dx
4:6962  268b4714             mov ax, word ptr es:[bx + 0x14]
4:6966  26894706             mov word ptr es:[bx + 6], ax
4:696A  26895708             mov word ptr es:[bx + 8], dx
4:696E  c45e06               les bx, ptr [bp + 6]
4:6971  26c45f14             les bx, ptr es:[bx + 0x14]
4:6975  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:697A  668946fc             mov dword ptr [bp - 4], eax
4:697E  668b4606             mov eax, dword ptr [bp + 6]
4:6982  050a00               add ax, 0xa
4:6985  6650                 push eax
4:6987  c45efc               les bx, ptr [bp - 4]
4:698A  06                   push es
4:698B  53                   push bx
4:698C  26c41f               les bx, ptr es:[bx]
4:698F  26ff5f08             lcall es:[bx + 8]
4:6993  c45e06               les bx, ptr [bp + 6]
4:6996  26894712             mov word ptr es:[bx + 0x12], ax
4:699A  06                   push es
4:699B  53                   push bx
4:699C  9a6493be68           lcall 0x68be, 0x9364  ; Layer::drawFrame@s5:9364
4:69A1  8b4606               mov ax, word ptr [bp + 6]
4:69A4  8b5608               mov dx, word ptr [bp + 8]
4:69A7  c9                   leave
4:69A8  ca0600               retf 6
4:69AB  db 00

; ---------------- Mode8Layer::~Mode8Layer@s4:69AC FAR size=48 callers=1
;   dtor
4:69AC  55                   push bp
4:69AD  8bec                 mov bp, sp
4:69AF  c45e06               les bx, ptr [bp + 6]
4:69B2  26c707026a           mov word ptr es:[bx], 0x6a02
4:69B7  26c747024969         mov word ptr es:[bx + 2], 0x6949  ; SEGMENT s4:0000
4:69BD  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
4:69C3  740a                 je 0x69cf
4:69C5  6626ff7714           push dword ptr es:[bx + 0x14]
4:69CA  9ada1d5569           lcall 0x6955, 0x1dda  ; RegObj::makeCurrent@s3:1DDA
loc_69CF:
4:69CF  66ff7606             push dword ptr [bp + 6]
4:69D3  9ac4923269           lcall 0x6932, 0x92c4  ; Layer::~Layer@s5:92C4
4:69D8  c9                   leave
4:69D9  ca0400               retf 4

; ---------------- Mode8Layer::scalar_dtor@s4:69DC FAR size=50 callers=0
;   deleting destructor
4:69DC  55                   push bp
4:69DD  8bec                 mov bp, sp
4:69DF  66ff7606             push dword ptr [bp + 6]
4:69E3  90                   nop
4:69E4  0e                   push cs
4:69E5  e8c4ff               call 0x69ac  ; Mode8Layer::~Mode8Layer@s4:69AC
4:69E8  f6460a01             test byte ptr [bp + 0xa], 1
4:69EC  7409                 je 0x69f7
4:69EE  66ff7606             push dword ptr [bp + 6]
4:69F2  9ace177368           lcall 0x6873, 0x17ce  ; operator_delete@s1:17CE
loc_69F7:
4:69F7  8b4606               mov ax, word ptr [bp + 6]
4:69FA  8b5608               mov dx, word ptr [bp + 8]
4:69FD  c9                   leave
4:69FE  ca0600               retf 6
4:6A01  db 90 dc 69 bb 69 10 3a 22 69 12 93 d6 69

; ---------------- MovieView::MovieView@s4:6A0E FAR size=104 callers=78
;   movie view base (sound, mode, movie, next command); 640x480
4:6A0E  55                   push bp
4:6A0F  8bec                 mov bp, sp
4:6A11  66ff7614             push dword ptr [bp + 0x14]
4:6A15  ff7612               push word ptr [bp + 0x12]
4:6A18  ff760c               push word ptr [bp + 0xc]
4:6A1B  66ff7606             push dword ptr [bp + 6]
4:6A1F  9ab261086a           lcall 0x6a08, 0x61b2  ; DanWnd::DanWnd@s2:61B2
4:6A24  8b4610               mov ax, word ptr [bp + 0x10]
4:6A27  c45e06               les bx, ptr [bp + 6]
4:6A2A  268987ea00           mov word ptr es:[bx + 0xea], ax
4:6A2F  8b460e               mov ax, word ptr [bp + 0xe]
4:6A32  268987ec00           mov word ptr es:[bx + 0xec], ax
4:6A37  8b460a               mov ax, word ptr [bp + 0xa]
4:6A3A  268987ee00           mov word ptr es:[bx + 0xee], ax
4:6A3F  26c787f0000000       mov word ptr es:[bx + 0xf0], 0
4:6A46  26c707666c           mov word ptr es:[bx], 0x6c66
4:6A4B  26c74702046a         mov word ptr es:[bx + 2], 0x6a04  ; SEGMENT s4:0000
4:6A51  26c787e0000100       mov word ptr es:[bx + 0xe0], 1
4:6A58  33c0                 xor ax, ax
4:6A5A  268987e200           mov word ptr es:[bx + 0xe2], ax
4:6A5F  268987e400           mov word ptr es:[bx + 0xe4], ax
4:6A64  6626c787e6007f02df01 mov dword ptr es:[bx + 0xe6], 0x1df027f
4:6A6E  8bc3                 mov ax, bx
4:6A70  8cc2                 mov dx, es
4:6A72  c9                   leave
4:6A73  ca1200               retf 0x12

; ---------------- MovieView::nop@s4:6A76 FAR size=4 callers=0
;   empty virtual
4:6A76  ca0600               retf 6
4:6A79  db 00

; ---------------- MovieView::paint@s4:6A7A FAR size=98 callers=1
;   apis: USER.BeginPaint, USER.EndPaint
;   (vslot 13) plays the movie on the first paint, or posts the next command
4:6A7A  c82a0000             enter 0x2a, 0
4:6A7E  c45e06               les bx, ptr [bp + 6]
4:6A81  26ff7708             push word ptr es:[bx + 8]
4:6A85  8d46e0               lea ax, [bp - 0x20]
4:6A88  16                   push ss
4:6A89  50                   push ax
4:6A8A  9a51620000           lcall 0, 0x6251  ; USER.BeginPaint
4:6A8F  c45e06               les bx, ptr [bp + 6]
4:6A92  26ff7708             push word ptr es:[bx + 8]
4:6A96  8d46e0               lea ax, [bp - 0x20]
4:6A99  16                   push ss
4:6A9A  50                   push ax
4:6A9B  9a23640000           lcall 0, 0x6423  ; USER.EndPaint
4:6AA0  6a02                 push 2
4:6AA2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:6AA7  9aba20cd69           lcall 0x69cd, 0x20ba  ; Registry_get@s3:20BA
4:6AAC  8946dc               mov word ptr [bp - 0x24], ax
4:6AAF  8956de               mov word ptr [bp - 0x22], dx
4:6AB2  c45edc               les bx, ptr [bp - 0x24]
4:6AB5  268b4720             mov ax, word ptr es:[bx + 0x20]
4:6AB9  8946da               mov word ptr [bp - 0x26], ax
4:6ABC  0bc0                 or ax, ax
4:6ABE  750e                 jne 0x6ace
4:6AC0  66ff7606             push dword ptr [bp + 6]
4:6AC4  90                   nop
4:6AC5  0e                   push cs
4:6AC6  e8ed00               call 0x6bb6  ; MovieView::done@s4:6BB6
4:6AC9  c9                   leave
4:6ACA  ca0400               retf 4
4:6ACD  db 90
loc_6ACE:
4:6ACE  66ff7606             push dword ptr [bp + 6]
4:6AD2  90                   nop
4:6AD3  0e                   push cs
4:6AD4  e80500               call 0x6adc  ; MovieView::play@s4:6ADC
4:6AD7  c9                   leave
4:6AD8  ca0400               retf 4
4:6ADB  db 00

; ---------------- MovieView::play@s4:6ADC FAR size=218 callers=1
;   apis: USER.ShowCursor
;   hides the cursor, plays the FLC centred (MCI), its sound
4:6ADC  c8200000             enter 0x20, 0
4:6AE0  6a48                 push 0x48
4:6AE2  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:6AE7  9aba208f6b           lcall 0x6b8f, 0x20ba  ; Registry_get@s3:20BA
4:6AEC  8bd8                 mov bx, ax
4:6AEE  8ec2                 mov es, dx
4:6AF0  268b470a             mov ax, word ptr es:[bx + 0xa]
4:6AF4  8946fe               mov word ptr [bp - 2], ax
4:6AF7  268b470c             mov ax, word ptr es:[bx + 0xc]
4:6AFB  8946fc               mov word ptr [bp - 4], ax
4:6AFE  8b46fe               mov ax, word ptr [bp - 2]
4:6B01  c45e06               les bx, ptr [bp + 6]
4:6B04  262b87e600           sub ax, word ptr es:[bx + 0xe6]
4:6B09  3d0100               cmp ax, 1
4:6B0C  7e1c                 jle 0x6b2a
4:6B0E  268b87e600           mov ax, word ptr es:[bx + 0xe6]
4:6B13  40                   inc ax
4:6B14  99                   cdq
4:6B15  2bc2                 sub ax, dx
4:6B17  d1f8                 sar ax, 1
4:6B19  8bc8                 mov cx, ax
4:6B1B  8b46fe               mov ax, word ptr [bp - 2]
4:6B1E  99                   cdq
4:6B1F  2bc2                 sub ax, dx
4:6B21  d1f8                 sar ax, 1
4:6B23  2bc1                 sub ax, cx
4:6B25  268987e200           mov word ptr es:[bx + 0xe2], ax
loc_6B2A:
4:6B2A  8b46fc               mov ax, word ptr [bp - 4]
4:6B2D  c45e06               les bx, ptr [bp + 6]
4:6B30  262b87e800           sub ax, word ptr es:[bx + 0xe8]
4:6B35  3d0100               cmp ax, 1
4:6B38  7e1c                 jle 0x6b56
4:6B3A  268b87e800           mov ax, word ptr es:[bx + 0xe8]
4:6B3F  40                   inc ax
4:6B40  99                   cdq
4:6B41  2bc2                 sub ax, dx
4:6B43  d1f8                 sar ax, 1
4:6B45  8bc8                 mov cx, ax
4:6B47  8b46fc               mov ax, word ptr [bp - 4]
4:6B4A  99                   cdq
4:6B4B  2bc2                 sub ax, dx
4:6B4D  d1f8                 sar ax, 1
4:6B4F  2bc1                 sub ax, cx
4:6B51  268987e400           mov word ptr es:[bx + 0xe4], ax
loc_6B56:
4:6B56  6a00                 push 0
4:6B58  9aa56b0000           lcall 0, 0x6ba5  ; USER.ShowCursor
4:6B5D  c45e06               les bx, ptr [bp + 6]
4:6B60  2683bfee0000         cmp word ptr es:[bx + 0xee], 0
4:6B66  7417                 je 0x6b7f
4:6B68  26ffb7ee00           push word ptr es:[bx + 0xee]
4:6B6D  66ff36a002           push dword ptr [0x2a0]
4:6B72  9a5c5c9d6b           lcall 0x6b9d, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
4:6B77  c45e06               les bx, ptr [bp + 6]
4:6B7A  268987f000           mov word ptr es:[bx + 0xf0], ax
loc_6B7F:
4:6B7F  c45e06               les bx, ptr [bp + 6]
4:6B82  26ffb7ec00           push word ptr es:[bx + 0xec]
4:6B87  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:6B8C  9a0a83aa6a           lcall 0x6aaa, 0x830a  ; ResLibr::picture@s3:830A
4:6B91  c45e06               les bx, ptr [bp + 6]
4:6B94  26ff7708             push word ptr es:[bx + 8]
4:6B98  52                   push dx
4:6B99  50                   push ax
4:6B9A  9aae53226a           lcall 0x6a22, 0x53ae  ; playMovieMci@s2:53AE
4:6B9F  83c406               add sp, 6
4:6BA2  6a01                 push 1
4:6BA4  9affff0000           lcall 0, 0xffff  ; USER.ShowCursor
4:6BA9  66ff7606             push dword ptr [bp + 6]
4:6BAD  90                   nop
4:6BAE  0e                   push cs
4:6BAF  e80400               call 0x6bb6  ; MovieView::done@s4:6BB6
4:6BB2  c9                   leave
4:6BB3  ca0400               retf 4

; ---------------- MovieView::done@s4:6BB6 FAR size=104 callers=2
;   apis: USER.DestroyWindow, USER.IsWindow, USER.PostMessage
;   posts the next command and closes
4:6BB6  55                   push bp
4:6BB7  8bec                 mov bp, sp
4:6BB9  c45e06               les bx, ptr [bp + 6]
4:6BBC  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
4:6BC2  7414                 je 0x6bd8
4:6BC4  ff369603             push word ptr [0x396]
4:6BC8  681101               push 0x111
4:6BCB  26ffb7ea00           push word ptr es:[bx + 0xea]
4:6BD0  666a00               push 0
4:6BD3  9ae66b0000           lcall 0, 0x6be6  ; USER.PostMessage
loc_6BD8:
4:6BD8  ff369603             push word ptr [0x396]
4:6BDC  666879001101         push 0x1110079
4:6BE2  666a00               push 0
4:6BE5  9a0d590000           lcall 0, 0x590d  ; USER.PostMessage
4:6BEA  c45e06               les bx, ptr [bp + 6]
4:6BED  2683bff00000         cmp word ptr es:[bx + 0xf0], 0
4:6BF3  7425                 je 0x6c1a
4:6BF5  26ffb7f000           push word ptr es:[bx + 0xf0]
4:6BFA  9affff0000           lcall 0, 0xffff  ; USER.IsWindow
4:6BFF  0bc0                 or ax, ax
4:6C01  7417                 je 0x6c1a
4:6C03  c45e06               les bx, ptr [bp + 6]
4:6C06  26ffb7f000           push word ptr es:[bx + 0xf0]
4:6C0B  9affff0000           lcall 0, 0xffff  ; USER.DestroyWindow
4:6C10  c45e06               les bx, ptr [bp + 6]
4:6C13  26c787f0000000       mov word ptr es:[bx + 0xf0], 0
loc_6C1A:
4:6C1A  c9                   leave
4:6C1B  ca0400               retf 4

; ---------------- MovieView::scalar_dtor@s4:6C1E size=228 callers=0
;   deleting destructor (vtable 6C66)
4:6C1E  c8180000             enter 0x18, 0
4:6C22  668b4606             mov eax, dword ptr [bp + 6]
4:6C26  05d200               add ax, 0xd2
4:6C29  6650                 push eax
4:6C2B  9ac4573c6c           lcall 0x6c3c, 0x57c4  ; List::~List@s2:57C4
4:6C30  c45e06               les bx, ptr [bp + 6]
4:6C33  26c7070a38           mov word ptr es:[bx], 0x380a
4:6C38  26c747024a6c         mov word ptr es:[bx + 2], 0x6c4a  ; SEGMENT s2:0000
4:6C3E  c45e06               les bx, ptr [bp + 6]
4:6C41  26c7079a38           mov word ptr es:[bx], 0x389a
4:6C46  26c74702756b         mov word ptr es:[bx + 2], 0x6b75  ; SEGMENT s2:0000
4:6C4C  f6460a01             test byte ptr [bp + 0xa], 1
4:6C50  7409                 je 0x6c5b
4:6C52  66ff7606             push dword ptr [bp + 6]
4:6C56  9ace17f569           lcall 0x69f5, 0x17ce  ; operator_delete@s1:17CE
loc_6C5B:
4:6C5B  8b4606               mov ax, word ptr [bp + 6]
4:6C5E  8b5608               mov dx, word ptr [bp + 8]
4:6C61  c9                   leave
4:6C62  ca0600               retf 6
4:6C65  db 00 1e 6c 9c 6c ea 68 70 6c 60 97 74 6c c6 68 78
4:6C75  db 6c 40 96 7c 6c 64 96 80 6c 2c 37 84 6c f2 97 88
4:6C85  db 6c 3c 37 8c 6c 40 37 90 6c 44 37 94 6c 48 37 98
4:6C95  db 6c 4c 37 a0 6c 7a 6a a8 6c 98 96 a4 6c 50 37 ac
4:6CA5  db 6c 76 6a 4f 6a 60 9c b0 6c 58 37 b4 6c 24 63 b8
4:6CB5  db 6c 4e 9c bc 6c 62 37 c0 6c 4a 9c c4 6c 66 37 c8
4:6CC5  db 6c 6a 37 cc 6c 4a 6a d0 6c 2e 6b d4 6c 02 6b d8
4:6CD5  db 6c 7a 37 dc 6c 52 9c e0 6c 56 9c e4 6c 16 9c e8
4:6CE5  db 6c 30 9c ec 6c 86 9c f0 6c c4 9c f4 6c e0 9c f8
4:6CF5  db 6c 8e 62 fc 6c 28 63 00 6d 2c 63 2e 6c

; ---------------- MovieView11::MovieView11@s4:6D02 FAR size=54 callers=1
;   movie view, mode 11: movie 156, then command 139
4:6D02  55                   push bp
4:6D03  8bec                 mov bp, sp
4:6D05  66ff760c             push dword ptr [bp + 0xc]
4:6D09  ff760a               push word ptr [bp + 0xa]
4:6D0C  66689c008b00         push 0x8b009c
4:6D12  666800000b00         push 0xb0000
4:6D18  66ff7606             push dword ptr [bp + 6]
4:6D1C  90                   nop
4:6D1D  0e                   push cs
4:6D1E  e8edfc               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6D21  c45e06               les bx, ptr [bp + 6]
4:6D24  26c7077ea2           mov word ptr es:[bx], 0xa27e
4:6D29  26c74702686c         mov word ptr es:[bx + 2], 0x6c68  ; SEGMENT s4:0000
4:6D2F  8bc3                 mov ax, bx
4:6D31  8cc2                 mov dx, es
4:6D33  c9                   leave
4:6D34  ca0a00               retf 0xa
4:6D37  db 00

; ---------------- MovieView12::MovieView12@s4:6D38 FAR size=54 callers=1
;   movie view, mode 12: movie 157, then command 208
4:6D38  55                   push bp
4:6D39  8bec                 mov bp, sp
4:6D3B  66ff760c             push dword ptr [bp + 0xc]
4:6D3F  ff760a               push word ptr [bp + 0xa]
4:6D42  66689d00d000         push 0xd0009d
4:6D48  666800000c00         push 0xc0000
4:6D4E  66ff7606             push dword ptr [bp + 6]
4:6D52  90                   nop
4:6D53  0e                   push cs
4:6D54  e8b7fc               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6D57  c45e06               les bx, ptr [bp + 6]
4:6D5A  26c70762b5           mov word ptr es:[bx], 0xb562
4:6D5F  26c747022d6d         mov word ptr es:[bx + 2], 0x6d2d  ; SEGMENT s4:0000
4:6D65  8bc3                 mov ax, bx
4:6D67  8cc2                 mov dx, es
4:6D69  c9                   leave
4:6D6A  ca0a00               retf 0xa
4:6D6D  db 00

; ---------------- MovieView13::MovieView13@s4:6D6E FAR size=54 callers=1
;   movie view, mode 13: movie 158, then command 209
4:6D6E  55                   push bp
4:6D6F  8bec                 mov bp, sp
4:6D71  66ff760c             push dword ptr [bp + 0xc]
4:6D75  ff760a               push word ptr [bp + 0xa]
4:6D78  66689e00d100         push 0xd1009e
4:6D7E  666800000d00         push 0xd0000
4:6D84  66ff7606             push dword ptr [bp + 6]
4:6D88  90                   nop
4:6D89  0e                   push cs
4:6D8A  e881fc               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6D8D  c45e06               les bx, ptr [bp + 6]
4:6D90  26c7072298           mov word ptr es:[bx], 0x9822
4:6D95  26c74702636d         mov word ptr es:[bx + 2], 0x6d63  ; SEGMENT s4:0000
4:6D9B  8bc3                 mov ax, bx
4:6D9D  8cc2                 mov dx, es
4:6D9F  c9                   leave
4:6DA0  ca0a00               retf 0xa
4:6DA3  db 00

; ---------------- MovieView14::MovieView14@s4:6DA4 FAR size=54 callers=1
;   movie view, mode 14: movie 159, then command 210
4:6DA4  55                   push bp
4:6DA5  8bec                 mov bp, sp
4:6DA7  66ff760c             push dword ptr [bp + 0xc]
4:6DAB  ff760a               push word ptr [bp + 0xa]
4:6DAE  66689f00d200         push 0xd2009f
4:6DB4  666800000e00         push 0xe0000
4:6DBA  66ff7606             push dword ptr [bp + 6]
4:6DBE  90                   nop
4:6DBF  0e                   push cs
4:6DC0  e84bfc               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6DC3  c45e06               les bx, ptr [bp + 6]
4:6DC6  26c70706ab           mov word ptr es:[bx], 0xab06
4:6DCB  26c74702996d         mov word ptr es:[bx + 2], 0x6d99  ; SEGMENT s4:0000
4:6DD1  8bc3                 mov ax, bx
4:6DD3  8cc2                 mov dx, es
4:6DD5  c9                   leave
4:6DD6  ca0a00               retf 0xa
4:6DD9  db 00

; ---------------- MovieView15::MovieView15@s4:6DDA FAR size=54 callers=1
;   movie view, mode 15: movie 160, then command 212
4:6DDA  55                   push bp
4:6DDB  8bec                 mov bp, sp
4:6DDD  66ff760c             push dword ptr [bp + 0xc]
4:6DE1  ff760a               push word ptr [bp + 0xa]
4:6DE4  6668a000d400         push 0xd400a0
4:6DEA  666800000f00         push 0xf0000
4:6DF0  66ff7606             push dword ptr [bp + 6]
4:6DF4  90                   nop
4:6DF5  0e                   push cs
4:6DF6  e815fc               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6DF9  c45e06               les bx, ptr [bp + 6]
4:6DFC  26c707eabd           mov word ptr es:[bx], 0xbdea
4:6E01  26c74702cf6d         mov word ptr es:[bx + 2], 0x6dcf  ; SEGMENT s4:0000
4:6E07  8bc3                 mov ax, bx
4:6E09  8cc2                 mov dx, es
4:6E0B  c9                   leave
4:6E0C  ca0a00               retf 0xa
4:6E0F  db 00

; ---------------- MovieView16::MovieView16@s4:6E10 FAR size=54 callers=1
;   movie view, mode 16: movie 161, then command 218
4:6E10  55                   push bp
4:6E11  8bec                 mov bp, sp
4:6E13  66ff760c             push dword ptr [bp + 0xc]
4:6E17  ff760a               push word ptr [bp + 0xa]
4:6E1A  6668a100da00         push 0xda00a1
4:6E20  666800001000         push 0x100000
4:6E26  66ff7606             push dword ptr [bp + 6]
4:6E2A  90                   nop
4:6E2B  0e                   push cs
4:6E2C  e8dffb               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6E2F  c45e06               les bx, ptr [bp + 6]
4:6E32  26c707aaa0           mov word ptr es:[bx], 0xa0aa
4:6E37  26c74702056e         mov word ptr es:[bx + 2], 0x6e05  ; SEGMENT s4:0000
4:6E3D  8bc3                 mov ax, bx
4:6E3F  8cc2                 mov dx, es
4:6E41  c9                   leave
4:6E42  ca0a00               retf 0xa
4:6E45  db 00

; ---------------- MovieView17::MovieView17@s4:6E46 FAR size=54 callers=1
;   movie view, mode 17: movie 162, then command 220
4:6E46  55                   push bp
4:6E47  8bec                 mov bp, sp
4:6E49  66ff760c             push dword ptr [bp + 0xc]
4:6E4D  ff760a               push word ptr [bp + 0xa]
4:6E50  6668a200dc00         push 0xdc00a2
4:6E56  666800001100         push 0x110000
4:6E5C  66ff7606             push dword ptr [bp + 6]
4:6E60  90                   nop
4:6E61  0e                   push cs
4:6E62  e8a9fb               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6E65  c45e06               les bx, ptr [bp + 6]
4:6E68  26c7078eb3           mov word ptr es:[bx], 0xb38e
4:6E6D  26c747023b6e         mov word ptr es:[bx + 2], 0x6e3b  ; SEGMENT s4:0000
4:6E73  8bc3                 mov ax, bx
4:6E75  8cc2                 mov dx, es
4:6E77  c9                   leave
4:6E78  ca0a00               retf 0xa
4:6E7B  db 00

; ---------------- MovieView18::MovieView18@s4:6E7C FAR size=54 callers=1
;   movie view, mode 18: movie 163, then command 211
4:6E7C  55                   push bp
4:6E7D  8bec                 mov bp, sp
4:6E7F  66ff760c             push dword ptr [bp + 0xc]
4:6E83  ff760a               push word ptr [bp + 0xa]
4:6E86  6668a300d300         push 0xd300a3
4:6E8C  666800001200         push 0x120000
4:6E92  66ff7606             push dword ptr [bp + 6]
4:6E96  90                   nop
4:6E97  0e                   push cs
4:6E98  e873fb               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6E9B  c45e06               les bx, ptr [bp + 6]
4:6E9E  26c7074e96           mov word ptr es:[bx], 0x964e
4:6EA3  26c74702716e         mov word ptr es:[bx + 2], 0x6e71  ; SEGMENT s4:0000
4:6EA9  8bc3                 mov ax, bx
4:6EAB  8cc2                 mov dx, es
4:6EAD  c9                   leave
4:6EAE  ca0a00               retf 0xa
4:6EB1  db 00

; ---------------- MovieView19::MovieView19@s4:6EB2 FAR size=54 callers=1
;   movie view, mode 19: movie 164, then command 219
4:6EB2  55                   push bp
4:6EB3  8bec                 mov bp, sp
4:6EB5  66ff760c             push dword ptr [bp + 0xc]
4:6EB9  ff760a               push word ptr [bp + 0xa]
4:6EBC  6668a400db00         push 0xdb00a4
4:6EC2  666800001300         push 0x130000
4:6EC8  66ff7606             push dword ptr [bp + 6]
4:6ECC  90                   nop
4:6ECD  0e                   push cs
4:6ECE  e83dfb               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6ED1  c45e06               les bx, ptr [bp + 6]
4:6ED4  26c70732a9           mov word ptr es:[bx], 0xa932
4:6ED9  26c74702a76e         mov word ptr es:[bx + 2], 0x6ea7  ; SEGMENT s4:0000
4:6EDF  8bc3                 mov ax, bx
4:6EE1  8cc2                 mov dx, es
4:6EE3  c9                   leave
4:6EE4  ca0a00               retf 0xa
4:6EE7  db 00

; ---------------- MovieView20::MovieView20@s4:6EE8 FAR size=54 callers=1
;   movie view, mode 20: movie 165, then command 165
4:6EE8  55                   push bp
4:6EE9  8bec                 mov bp, sp
4:6EEB  66ff760c             push dword ptr [bp + 0xc]
4:6EEF  ff760a               push word ptr [bp + 0xa]
4:6EF2  6668a500a500         push 0xa500a5
4:6EF8  666800001400         push 0x140000
4:6EFE  66ff7606             push dword ptr [bp + 6]
4:6F02  90                   nop
4:6F03  0e                   push cs
4:6F04  e807fb               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6F07  c45e06               les bx, ptr [bp + 6]
4:6F0A  26c70716bc           mov word ptr es:[bx], 0xbc16
4:6F0F  26c74702dd6e         mov word ptr es:[bx + 2], 0x6edd  ; SEGMENT s4:0000
4:6F15  8bc3                 mov ax, bx
4:6F17  8cc2                 mov dx, es
4:6F19  c9                   leave
4:6F1A  ca0a00               retf 0xa
4:6F1D  db 00

; ---------------- MovieView21::MovieView21@s4:6F1E FAR size=54 callers=1
;   movie view, mode 21: movie 167, then command 178
4:6F1E  55                   push bp
4:6F1F  8bec                 mov bp, sp
4:6F21  66ff760c             push dword ptr [bp + 0xc]
4:6F25  ff760a               push word ptr [bp + 0xa]
4:6F28  6668a700b200         push 0xb200a7
4:6F2E  666800001500         push 0x150000
4:6F34  66ff7606             push dword ptr [bp + 6]
4:6F38  90                   nop
4:6F39  0e                   push cs
4:6F3A  e8d1fa               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6F3D  c45e06               les bx, ptr [bp + 6]
4:6F40  26c7073a9e           mov word ptr es:[bx], 0x9e3a
4:6F45  26c74702136f         mov word ptr es:[bx + 2], 0x6f13  ; SEGMENT s4:0000
4:6F4B  8bc3                 mov ax, bx
4:6F4D  8cc2                 mov dx, es
4:6F4F  c9                   leave
4:6F50  ca0a00               retf 0xa
4:6F53  db 00

; ---------------- MovieView22::MovieView22@s4:6F54 FAR size=54 callers=1
;   movie view, mode 22: movie 168, then command 0
4:6F54  55                   push bp
4:6F55  8bec                 mov bp, sp
4:6F57  66ff760c             push dword ptr [bp + 0xc]
4:6F5B  ff760a               push word ptr [bp + 0xa]
4:6F5E  6668a8000000         push 0xa8
4:6F64  666800001600         push 0x160000
4:6F6A  66ff7606             push dword ptr [bp + 6]
4:6F6E  90                   nop
4:6F6F  0e                   push cs
4:6F70  e89bfa               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6F73  c45e06               les bx, ptr [bp + 6]
4:6F76  26c7071eb1           mov word ptr es:[bx], 0xb11e
4:6F7B  26c74702496f         mov word ptr es:[bx + 2], 0x6f49  ; SEGMENT s4:0000
4:6F81  8bc3                 mov ax, bx
4:6F83  8cc2                 mov dx, es
4:6F85  c9                   leave
4:6F86  ca0a00               retf 0xa
4:6F89  db 00

; ---------------- MovieView23::MovieView23@s4:6F8A FAR size=54 callers=1
;   movie view, mode 23: movie 175, then command 192
4:6F8A  55                   push bp
4:6F8B  8bec                 mov bp, sp
4:6F8D  66ff760c             push dword ptr [bp + 0xc]
4:6F91  ff760a               push word ptr [bp + 0xa]
4:6F94  6668af00c000         push 0xc000af
4:6F9A  666800001700         push 0x170000
4:6FA0  66ff7606             push dword ptr [bp + 6]
4:6FA4  90                   nop
4:6FA5  0e                   push cs
4:6FA6  e865fa               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6FA9  c45e06               les bx, ptr [bp + 6]
4:6FAC  26c707de93           mov word ptr es:[bx], 0x93de
4:6FB1  26c747027f6f         mov word ptr es:[bx + 2], 0x6f7f  ; SEGMENT s4:0000
4:6FB7  8bc3                 mov ax, bx
4:6FB9  8cc2                 mov dx, es
4:6FBB  c9                   leave
4:6FBC  ca0a00               retf 0xa
4:6FBF  db 00

; ---------------- MovieView24::MovieView24@s4:6FC0 FAR size=54 callers=1
;   movie view, mode 24: movie 176, then command 193
4:6FC0  55                   push bp
4:6FC1  8bec                 mov bp, sp
4:6FC3  66ff760c             push dword ptr [bp + 0xc]
4:6FC7  ff760a               push word ptr [bp + 0xa]
4:6FCA  6668b000c100         push 0xc100b0
4:6FD0  666800001800         push 0x180000
4:6FD6  66ff7606             push dword ptr [bp + 6]
4:6FDA  90                   nop
4:6FDB  0e                   push cs
4:6FDC  e82ffa               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:6FDF  c45e06               les bx, ptr [bp + 6]
4:6FE2  26c707c2a6           mov word ptr es:[bx], 0xa6c2
4:6FE7  26c74702b56f         mov word ptr es:[bx + 2], 0x6fb5  ; SEGMENT s4:0000
4:6FED  8bc3                 mov ax, bx
4:6FEF  8cc2                 mov dx, es
4:6FF1  c9                   leave
4:6FF2  ca0a00               retf 0xa
4:6FF5  db 00

; ---------------- MovieView25::MovieView25@s4:6FF6 FAR size=54 callers=1
;   movie view, mode 25: movie 177, then command 128
4:6FF6  55                   push bp
4:6FF7  8bec                 mov bp, sp
4:6FF9  66ff760c             push dword ptr [bp + 0xc]
4:6FFD  ff760a               push word ptr [bp + 0xa]
4:7000  6668b1008000         push 0x8000b1
4:7006  666800001900         push 0x190000
4:700C  66ff7606             push dword ptr [bp + 6]
4:7010  90                   nop
4:7011  0e                   push cs
4:7012  e8f9f9               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7015  c45e06               les bx, ptr [bp + 6]
4:7018  26c707a6b9           mov word ptr es:[bx], 0xb9a6
4:701D  26c74702eb6f         mov word ptr es:[bx + 2], 0x6feb  ; SEGMENT s4:0000
4:7023  8bc3                 mov ax, bx
4:7025  8cc2                 mov dx, es
4:7027  c9                   leave
4:7028  ca0a00               retf 0xa
4:702B  db 00

; ---------------- MovieView26::MovieView26@s4:702C FAR size=54 callers=1
;   movie view, mode 26: movie 178, then command 195, sound 492
4:702C  55                   push bp
4:702D  8bec                 mov bp, sp
4:702F  66ff760c             push dword ptr [bp + 0xc]
4:7033  ff760a               push word ptr [bp + 0xa]
4:7036  6668b200c300         push 0xc300b2
4:703C  6668ec011a00         push 0x1a01ec
4:7042  66ff7606             push dword ptr [bp + 6]
4:7046  90                   nop
4:7047  0e                   push cs
4:7048  e8c3f9               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:704B  c45e06               les bx, ptr [bp + 6]
4:704E  26c707669c           mov word ptr es:[bx], 0x9c66
4:7053  26c747022170         mov word ptr es:[bx + 2], 0x7021  ; SEGMENT s4:0000
4:7059  8bc3                 mov ax, bx
4:705B  8cc2                 mov dx, es
4:705D  c9                   leave
4:705E  ca0a00               retf 0xa
4:7061  db 00

; ---------------- MovieView27::MovieView27@s4:7062 FAR size=54 callers=1
;   movie view, mode 27: movie 179, then command 196
4:7062  55                   push bp
4:7063  8bec                 mov bp, sp
4:7065  66ff760c             push dword ptr [bp + 0xc]
4:7069  ff760a               push word ptr [bp + 0xa]
4:706C  6668b300c400         push 0xc400b3
4:7072  666800001b00         push 0x1b0000
4:7078  66ff7606             push dword ptr [bp + 6]
4:707C  90                   nop
4:707D  0e                   push cs
4:707E  e88df9               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7081  c45e06               les bx, ptr [bp + 6]
4:7084  26c7074aaf           mov word ptr es:[bx], 0xaf4a
4:7089  26c747025770         mov word ptr es:[bx + 2], 0x7057  ; SEGMENT s4:0000
4:708F  8bc3                 mov ax, bx
4:7091  8cc2                 mov dx, es
4:7093  c9                   leave
4:7094  ca0a00               retf 0xa
4:7097  db 00

; ---------------- MovieView28::MovieView28@s4:7098 FAR size=54 callers=1
;   movie view, mode 28: movie 180, then command 216
4:7098  55                   push bp
4:7099  8bec                 mov bp, sp
4:709B  66ff760c             push dword ptr [bp + 0xc]
4:709F  ff760a               push word ptr [bp + 0xa]
4:70A2  6668b400d800         push 0xd800b4
4:70A8  666800001c00         push 0x1c0000
4:70AE  66ff7606             push dword ptr [bp + 6]
4:70B2  90                   nop
4:70B3  0e                   push cs
4:70B4  e857f9               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:70B7  c45e06               les bx, ptr [bp + 6]
4:70BA  26c7072ec2           mov word ptr es:[bx], 0xc22e
4:70BF  26c747028d70         mov word ptr es:[bx + 2], 0x708d  ; SEGMENT s4:0000
4:70C5  8bc3                 mov ax, bx
4:70C7  8cc2                 mov dx, es
4:70C9  c9                   leave
4:70CA  ca0a00               retf 0xa
4:70CD  db 00

; ---------------- MovieView29::MovieView29@s4:70CE FAR size=54 callers=1
;   movie view, mode 29: movie 181, then command 123
4:70CE  55                   push bp
4:70CF  8bec                 mov bp, sp
4:70D1  66ff760c             push dword ptr [bp + 0xc]
4:70D5  ff760a               push word ptr [bp + 0xa]
4:70D8  6668b5007b00         push 0x7b00b5
4:70DE  666800001d00         push 0x1d0000
4:70E4  66ff7606             push dword ptr [bp + 6]
4:70E8  90                   nop
4:70E9  0e                   push cs
4:70EA  e821f9               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:70ED  c45e06               les bx, ptr [bp + 6]
4:70F0  26c707eea4           mov word ptr es:[bx], 0xa4ee
4:70F5  26c74702c370         mov word ptr es:[bx + 2], 0x70c3  ; SEGMENT s4:0000
4:70FB  8bc3                 mov ax, bx
4:70FD  8cc2                 mov dx, es
4:70FF  c9                   leave
4:7100  ca0a00               retf 0xa
4:7103  db 00

; ---------------- MovieView30::MovieView30@s4:7104 FAR size=54 callers=1
;   movie view, mode 30: movie 182, then command 217
4:7104  55                   push bp
4:7105  8bec                 mov bp, sp
4:7107  66ff760c             push dword ptr [bp + 0xc]
4:710B  ff760a               push word ptr [bp + 0xa]
4:710E  6668b600d900         push 0xd900b6
4:7114  666800001e00         push 0x1e0000
4:711A  66ff7606             push dword ptr [bp + 6]
4:711E  90                   nop
4:711F  0e                   push cs
4:7120  e8ebf8               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7123  c45e06               les bx, ptr [bp + 6]
4:7126  26c707d2b7           mov word ptr es:[bx], 0xb7d2
4:712B  26c74702f970         mov word ptr es:[bx + 2], 0x70f9  ; SEGMENT s4:0000
4:7131  8bc3                 mov ax, bx
4:7133  8cc2                 mov dx, es
4:7135  c9                   leave
4:7136  ca0a00               retf 0xa
4:7139  db 00

; ---------------- MovieView31::MovieView31@s4:713A FAR size=54 callers=1
;   movie view, mode 31: movie 183, then command 125
4:713A  55                   push bp
4:713B  8bec                 mov bp, sp
4:713D  66ff760c             push dword ptr [bp + 0xc]
4:7141  ff760a               push word ptr [bp + 0xa]
4:7144  6668b7007d00         push 0x7d00b7  ; 'New failed in Op::Op'
4:714A  666800001f00         push 0x1f0000
4:7150  66ff7606             push dword ptr [bp + 6]
4:7154  90                   nop
4:7155  0e                   push cs
4:7156  e8b5f8               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7159  c45e06               les bx, ptr [bp + 6]
4:715C  26c707929a           mov word ptr es:[bx], 0x9a92
4:7161  26c747022f71         mov word ptr es:[bx + 2], 0x712f  ; SEGMENT s4:0000
4:7167  8bc3                 mov ax, bx
4:7169  8cc2                 mov dx, es
4:716B  c9                   leave
4:716C  ca0a00               retf 0xa
4:716F  db 00

; ---------------- MovieView33::MovieView33@s4:7170 FAR size=54 callers=1
;   movie view, mode 33: movie 185, then command 221
4:7170  55                   push bp
4:7171  8bec                 mov bp, sp
4:7173  66ff760c             push dword ptr [bp + 0xc]
4:7177  ff760a               push word ptr [bp + 0xa]
4:717A  6668b900dd00         push 0xdd00b9
4:7180  666800002100         push 0x210000
4:7186  66ff7606             push dword ptr [bp + 6]
4:718A  90                   nop
4:718B  0e                   push cs
4:718C  e87ff8               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:718F  c45e06               les bx, ptr [bp + 6]
4:7192  26c70776ad           mov word ptr es:[bx], 0xad76
4:7197  26c747026571         mov word ptr es:[bx + 2], 0x7165  ; SEGMENT s4:0000
4:719D  8bc3                 mov ax, bx
4:719F  8cc2                 mov dx, es
4:71A1  c9                   leave
4:71A2  ca0a00               retf 0xa
4:71A5  db 00

; ---------------- MovieView35::MovieView35@s4:71A6 FAR size=54 callers=1
;   movie view, mode 35: movie 211, then command 214
4:71A6  55                   push bp
4:71A7  8bec                 mov bp, sp
4:71A9  66ff760c             push dword ptr [bp + 0xc]
4:71AD  ff760a               push word ptr [bp + 0xa]
4:71B0  6668d300d600         push 0xd600d3
4:71B6  666800002300         push 0x230000
4:71BC  66ff7606             push dword ptr [bp + 6]
4:71C0  90                   nop
4:71C1  0e                   push cs
4:71C2  e849f8               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:71C5  c45e06               les bx, ptr [bp + 6]
4:71C8  26c7079ab6           mov word ptr es:[bx], 0xb69a
4:71CD  26c747029b71         mov word ptr es:[bx + 2], 0x719b  ; SEGMENT s4:0000
4:71D3  8bc3                 mov ax, bx
4:71D5  8cc2                 mov dx, es
4:71D7  c9                   leave
4:71D8  ca0a00               retf 0xa
4:71DB  db 00

; ---------------- MovieView36::MovieView36@s4:71DC FAR size=54 callers=1
;   movie view, mode 36: movie 212, then command 215, sound 493
4:71DC  55                   push bp
4:71DD  8bec                 mov bp, sp
4:71DF  66ff760c             push dword ptr [bp + 0xc]
4:71E3  ff760a               push word ptr [bp + 0xa]
4:71E6  6668d400d700         push 0xd700d4
4:71EC  6668ed012400         push 0x2401ed
4:71F2  66ff7606             push dword ptr [bp + 6]
4:71F6  90                   nop
4:71F7  0e                   push cs
4:71F8  e813f8               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:71FB  c45e06               les bx, ptr [bp + 6]
4:71FE  26c7075a99           mov word ptr es:[bx], 0x995a
4:7203  26c74702d171         mov word ptr es:[bx + 2], 0x71d1  ; SEGMENT s4:0000
4:7209  8bc3                 mov ax, bx
4:720B  8cc2                 mov dx, es
4:720D  c9                   leave
4:720E  ca0a00               retf 0xa
4:7211  db 00

; ---------------- MovieView37::MovieView37@s4:7212 FAR size=54 callers=1
;   movie view, mode 37: movie 233, then command 238
4:7212  55                   push bp
4:7213  8bec                 mov bp, sp
4:7215  66ff760c             push dword ptr [bp + 0xc]
4:7219  ff760a               push word ptr [bp + 0xa]
4:721C  6668e900ee00         push 0xee00e9
4:7222  666800002500         push 0x250000
4:7228  66ff7606             push dword ptr [bp + 6]
4:722C  90                   nop
4:722D  0e                   push cs
4:722E  e8ddf7               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7231  c45e06               les bx, ptr [bp + 6]
4:7234  26c70752a4           mov word ptr es:[bx], 0xa452
4:7239  26c747020772         mov word ptr es:[bx + 2], 0x7207  ; SEGMENT s4:0000
4:723F  8bc3                 mov ax, bx
4:7241  8cc2                 mov dx, es
4:7243  c9                   leave
4:7244  ca0a00               retf 0xa
4:7247  db 00

; ---------------- MovieView99::MovieView99@s4:7248 FAR size=54 callers=1
;   movie view, mode 99: movie 166, then command 0
4:7248  55                   push bp
4:7249  8bec                 mov bp, sp
4:724B  66ff760c             push dword ptr [bp + 0xc]
4:724F  ff760a               push word ptr [bp + 0xa]
4:7252  6668a6000000         push 0xa6
4:7258  666800006300         push 0x630000
4:725E  66ff7606             push dword ptr [bp + 6]
4:7262  90                   nop
4:7263  0e                   push cs
4:7264  e8a7f7               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7267  c45e06               les bx, ptr [bp + 6]
4:726A  26c7075ac0           mov word ptr es:[bx], 0xc05a
4:726F  26c747023d72         mov word ptr es:[bx + 2], 0x723d  ; SEGMENT s4:0000
4:7275  8bc3                 mov ax, bx
4:7277  8cc2                 mov dx, es
4:7279  c9                   leave
4:727A  ca0a00               retf 0xa
4:727D  db 00

; ---------------- MovieView100::MovieView100@s4:727E FAR size=54 callers=1
;   movie view, mode 100: movie 169, then command 0
4:727E  55                   push bp
4:727F  8bec                 mov bp, sp
4:7281  66ff760c             push dword ptr [bp + 0xc]
4:7285  ff760a               push word ptr [bp + 0xa]
4:7288  6668a9000000         push 0xa9
4:728E  666800006400         push 0x640000
4:7294  66ff7606             push dword ptr [bp + 6]
4:7298  90                   nop
4:7299  0e                   push cs
4:729A  e871f7               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:729D  c45e06               les bx, ptr [bp + 6]
4:72A0  26c7071aa3           mov word ptr es:[bx], 0xa31a
4:72A5  26c747027372         mov word ptr es:[bx + 2], 0x7273  ; SEGMENT s4:0000
4:72AB  8bc3                 mov ax, bx
4:72AD  8cc2                 mov dx, es
4:72AF  c9                   leave
4:72B0  ca0a00               retf 0xa
4:72B3  db 00

; ---------------- MovieView101::MovieView101@s4:72B4 FAR size=54 callers=1
;   movie view, mode 101: movie 170, then command 187
4:72B4  55                   push bp
4:72B5  8bec                 mov bp, sp
4:72B7  66ff760c             push dword ptr [bp + 0xc]
4:72BB  ff760a               push word ptr [bp + 0xa]
4:72BE  6668aa00bb00         push 0xbb00aa
4:72C4  666800006500         push 0x650000
4:72CA  66ff7606             push dword ptr [bp + 6]
4:72CE  90                   nop
4:72CF  0e                   push cs
4:72D0  e83bf7               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:72D3  c45e06               les bx, ptr [bp + 6]
4:72D6  26c707feb5           mov word ptr es:[bx], 0xb5fe
4:72DB  26c74702a972         mov word ptr es:[bx + 2], 0x72a9  ; SEGMENT s4:0000
4:72E1  8bc3                 mov ax, bx
4:72E3  8cc2                 mov dx, es
4:72E5  c9                   leave
4:72E6  ca0a00               retf 0xa
4:72E9  db 00

; ---------------- MovieView102::MovieView102@s4:72EA FAR size=54 callers=1
;   movie view, mode 102: movie 171, then command 0
4:72EA  55                   push bp
4:72EB  8bec                 mov bp, sp
4:72ED  66ff760c             push dword ptr [bp + 0xc]
4:72F1  ff760a               push word ptr [bp + 0xa]
4:72F4  6668ab000000         push 0xab
4:72FA  666800006600         push 0x660000
4:7300  66ff7606             push dword ptr [bp + 6]
4:7304  90                   nop
4:7305  0e                   push cs
4:7306  e805f7               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7309  c45e06               les bx, ptr [bp + 6]
4:730C  26c707be98           mov word ptr es:[bx], 0x98be
4:7311  26c74702df72         mov word ptr es:[bx + 2], 0x72df  ; SEGMENT s4:0000
4:7317  8bc3                 mov ax, bx
4:7319  8cc2                 mov dx, es
4:731B  c9                   leave
4:731C  ca0a00               retf 0xa
4:731F  db 00

; ---------------- MovieView103::MovieView103@s4:7320 FAR size=54 callers=1
;   movie view, mode 103: movie 172, then command 189
4:7320  55                   push bp
4:7321  8bec                 mov bp, sp
4:7323  66ff760c             push dword ptr [bp + 0xc]
4:7327  ff760a               push word ptr [bp + 0xa]
4:732A  6668ac00bd00         push 0xbd00ac
4:7330  666800006700         push 0x670000
4:7336  66ff7606             push dword ptr [bp + 6]
4:733A  90                   nop
4:733B  0e                   push cs
4:733C  e8cff6               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:733F  c45e06               les bx, ptr [bp + 6]
4:7342  26c707a2ab           mov word ptr es:[bx], 0xaba2
4:7347  26c747021573         mov word ptr es:[bx + 2], 0x7315  ; SEGMENT s4:0000
4:734D  8bc3                 mov ax, bx
4:734F  8cc2                 mov dx, es
4:7351  c9                   leave
4:7352  ca0a00               retf 0xa
4:7355  db 00

; ---------------- MovieView104::MovieView104@s4:7356 FAR size=54 callers=1
;   movie view, mode 104: movie 173, then command 0
4:7356  55                   push bp
4:7357  8bec                 mov bp, sp
4:7359  66ff760c             push dword ptr [bp + 0xc]
4:735D  ff760a               push word ptr [bp + 0xa]
4:7360  6668ad000000         push 0xad
4:7366  666800006800         push 0x680000
4:736C  66ff7606             push dword ptr [bp + 6]
4:7370  90                   nop
4:7371  0e                   push cs
4:7372  e899f6               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7375  c45e06               les bx, ptr [bp + 6]
4:7378  26c70786be           mov word ptr es:[bx], 0xbe86
4:737D  26c747024b73         mov word ptr es:[bx + 2], 0x734b  ; SEGMENT s4:0000
4:7383  8bc3                 mov ax, bx
4:7385  8cc2                 mov dx, es
4:7387  c9                   leave
4:7388  ca0a00               retf 0xa
4:738B  db 00

; ---------------- MovieView105::MovieView105@s4:738C FAR size=54 callers=1
;   movie view, mode 105: movie 174, then command 0
4:738C  55                   push bp
4:738D  8bec                 mov bp, sp
4:738F  66ff760c             push dword ptr [bp + 0xc]
4:7393  ff760a               push word ptr [bp + 0xa]
4:7396  6668ae000000         push 0xae
4:739C  666800006900         push 0x690000
4:73A2  66ff7606             push dword ptr [bp + 6]
4:73A6  90                   nop
4:73A7  0e                   push cs
4:73A8  e863f6               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:73AB  c45e06               les bx, ptr [bp + 6]
4:73AE  26c7073eac           mov word ptr es:[bx], 0xac3e
4:73B3  26c747028173         mov word ptr es:[bx + 2], 0x7381  ; SEGMENT s4:0000
4:73B9  8bc3                 mov ax, bx
4:73BB  8cc2                 mov dx, es
4:73BD  c9                   leave
4:73BE  ca0a00               retf 0xa
4:73C1  db 00

; ---------------- MovieView53::MovieView53@s4:73C2 FAR size=54 callers=1
;   movie view, mode 53: movie 186, then command 129
4:73C2  55                   push bp
4:73C3  8bec                 mov bp, sp
4:73C5  66ff760c             push dword ptr [bp + 0xc]
4:73C9  ff760a               push word ptr [bp + 0xa]
4:73CC  6668ba008100         push 0x8100ba
4:73D2  666800003500         push 0x350000
4:73D8  66ff7606             push dword ptr [bp + 6]
4:73DC  90                   nop
4:73DD  0e                   push cs
4:73DE  e82df6               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:73E1  c45e06               les bx, ptr [bp + 6]
4:73E4  26c70722bf           mov word ptr es:[bx], 0xbf22
4:73E9  26c74702b773         mov word ptr es:[bx + 2], 0x73b7  ; SEGMENT s4:0000
4:73EF  8bc3                 mov ax, bx
4:73F1  8cc2                 mov dx, es
4:73F3  c9                   leave
4:73F4  ca0a00               retf 0xa
4:73F7  db 00

; ---------------- MovieView57::MovieView57@s4:73F8 FAR size=54 callers=1
;   movie view, mode 57: movie 187, then command 0
4:73F8  55                   push bp
4:73F9  8bec                 mov bp, sp
4:73FB  66ff760c             push dword ptr [bp + 0xc]
4:73FF  ff760a               push word ptr [bp + 0xa]
4:7402  6668bb000000         push 0xbb
4:7408  666800003900         push 0x390000
4:740E  66ff7606             push dword ptr [bp + 6]
4:7412  90                   nop
4:7413  0e                   push cs
4:7414  e8f7f5               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7417  c45e06               les bx, ptr [bp + 6]
4:741A  26c70746a1           mov word ptr es:[bx], 0xa146
4:741F  26c74702ed73         mov word ptr es:[bx + 2], 0x73ed  ; SEGMENT s4:0000
4:7425  8bc3                 mov ax, bx
4:7427  8cc2                 mov dx, es
4:7429  c9                   leave
4:742A  ca0a00               retf 0xa
4:742D  db 00

; ---------------- MovieView57::paint@s4:742E FAR size=48 callers=0
;   (vslot 13 of the mode 57 view, movie 187) paints the movie, then plays smlstp (489) once a run (DGROUP 0x4254, set when it starts)
4:742E  c8020000             enter 2, 0
4:7432  66ff7606             push dword ptr [bp + 6]
4:7436  90                   nop
4:7437  0e                   push cs
4:7438  e83ff6               call 0x6a7a  ; MovieView::paint@s4:6A7A
4:743B  833e544200           cmp word ptr [0x4254], 0
4:7440  7517                 jne 0x7459
4:7442  68e901               push 0x1e9
4:7445  66ff36a002           push dword ptr [0x2a0]
4:744A  9a5c5c6c6c           lcall 0x6c6c, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
4:744F  0bc0                 or ax, ax
4:7451  7406                 je 0x7459
4:7453  c70654420100         mov word ptr [0x4254], 1
loc_7459:
4:7459  c9                   leave
4:745A  ca0400               retf 4
4:745D  db 00

; ---------------- MovieView34::MovieView34@s4:745E FAR size=54 callers=1
;   movie view, mode 34: movie 188, then command 213
4:745E  55                   push bp
4:745F  8bec                 mov bp, sp
4:7461  66ff760c             push dword ptr [bp + 0xc]
4:7465  ff760a               push word ptr [bp + 0xa]
4:7468  6668bc00d500         push 0xd500bc
4:746E  666800002200         push 0x220000
4:7474  66ff7606             push dword ptr [bp + 6]
4:7478  90                   nop
4:7479  0e                   push cs
4:747A  e891f5               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:747D  c45e06               les bx, ptr [bp + 6]
4:7480  26c7072ab4           mov word ptr es:[bx], 0xb42a
4:7485  26c747022374         mov word ptr es:[bx + 2], 0x7423  ; SEGMENT s4:0000
4:748B  8bc3                 mov ax, bx
4:748D  8cc2                 mov dx, es
4:748F  c9                   leave
4:7490  ca0a00               retf 0xa
4:7493  db 00

; ---------------- MovieView54::MovieView54@s4:7494 FAR size=54 callers=1
;   movie view, mode 54: movie 189, then command 205
4:7494  55                   push bp
4:7495  8bec                 mov bp, sp
4:7497  66ff760c             push dword ptr [bp + 0xc]
4:749B  ff760a               push word ptr [bp + 0xa]
4:749E  6668bd00cd00         push 0xcd00bd
4:74A4  666800003600         push 0x360000
4:74AA  66ff7606             push dword ptr [bp + 6]
4:74AE  90                   nop
4:74AF  0e                   push cs
4:74B0  e85bf5               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:74B3  c45e06               les bx, ptr [bp + 6]
4:74B6  26c707ea96           mov word ptr es:[bx], 0x96ea
4:74BB  26c747028974         mov word ptr es:[bx + 2], 0x7489  ; SEGMENT s4:0000
4:74C1  8bc3                 mov ax, bx
4:74C3  8cc2                 mov dx, es
4:74C5  c9                   leave
4:74C6  ca0a00               retf 0xa
4:74C9  db 00

; ---------------- MovieView55::MovieView55@s4:74CA FAR size=54 callers=1
;   movie view, mode 55: movie 190, then command 131
4:74CA  55                   push bp
4:74CB  8bec                 mov bp, sp
4:74CD  66ff760c             push dword ptr [bp + 0xc]
4:74D1  ff760a               push word ptr [bp + 0xa]
4:74D4  6668be008300         push 0x8300be
4:74DA  666800003700         push 0x370000
4:74E0  66ff7606             push dword ptr [bp + 6]
4:74E4  90                   nop
4:74E5  0e                   push cs
4:74E6  e825f5               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:74E9  c45e06               les bx, ptr [bp + 6]
4:74EC  26c707cea9           mov word ptr es:[bx], 0xa9ce
4:74F1  26c74702bf74         mov word ptr es:[bx + 2], 0x74bf  ; SEGMENT s4:0000
4:74F7  8bc3                 mov ax, bx
4:74F9  8cc2                 mov dx, es
4:74FB  c9                   leave
4:74FC  ca0a00               retf 0xa
4:74FF  db 00

; ---------------- MovieView56::MovieView56@s4:7500 FAR size=54 callers=1
;   movie view, mode 56: movie 191, then command 0
4:7500  55                   push bp
4:7501  8bec                 mov bp, sp
4:7503  66ff760c             push dword ptr [bp + 0xc]
4:7507  ff760a               push word ptr [bp + 0xa]
4:750A  6668bf000000         push 0xbf
4:7510  666800003800         push 0x380000
4:7516  66ff7606             push dword ptr [bp + 6]
4:751A  90                   nop
4:751B  0e                   push cs
4:751C  e8eff4               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:751F  c45e06               les bx, ptr [bp + 6]
4:7522  26c707b2bc           mov word ptr es:[bx], 0xbcb2
4:7527  26c74702f574         mov word ptr es:[bx + 2], 0x74f5  ; SEGMENT s4:0000
4:752D  8bc3                 mov ax, bx
4:752F  8cc2                 mov dx, es
4:7531  c9                   leave
4:7532  ca0a00               retf 0xa
4:7535  db 00

; ---------------- MovieView58::MovieView58@s4:7536 FAR size=54 callers=1
;   movie view, mode 58: movie 192, then command 133
4:7536  55                   push bp
4:7537  8bec                 mov bp, sp
4:7539  66ff760c             push dword ptr [bp + 0xc]
4:753D  ff760a               push word ptr [bp + 0xa]
4:7540  6668c0008500         push 0x8500c0
4:7546  666800003a00         push 0x3a0000
4:754C  66ff7606             push dword ptr [bp + 6]
4:7550  90                   nop
4:7551  0e                   push cs
4:7552  e8b9f4               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7555  c45e06               les bx, ptr [bp + 6]
4:7558  26c707729f           mov word ptr es:[bx], 0x9f72
4:755D  26c747022b75         mov word ptr es:[bx + 2], 0x752b  ; SEGMENT s4:0000
4:7563  8bc3                 mov ax, bx
4:7565  8cc2                 mov dx, es
4:7567  c9                   leave
4:7568  ca0a00               retf 0xa
4:756B  db 00

; ---------------- MovieView59::MovieView59@s4:756C FAR size=54 callers=1
;   movie view, mode 59: movie 193, then command 134, sound 482
4:756C  55                   push bp
4:756D  8bec                 mov bp, sp
4:756F  66ff760c             push dword ptr [bp + 0xc]
4:7573  ff760a               push word ptr [bp + 0xa]
4:7576  6668c1008600         push 0x8600c1
4:757C  6668e2013b00         push 0x3b01e2
4:7582  66ff7606             push dword ptr [bp + 6]
4:7586  90                   nop
4:7587  0e                   push cs
4:7588  e883f4               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:758B  c45e06               les bx, ptr [bp + 6]
4:758E  26c70756b2           mov word ptr es:[bx], 0xb256
4:7593  26c747026175         mov word ptr es:[bx + 2], 0x7561  ; SEGMENT s4:0000
4:7599  8bc3                 mov ax, bx
4:759B  8cc2                 mov dx, es
4:759D  c9                   leave
4:759E  ca0a00               retf 0xa
4:75A1  db 00

; ---------------- MovieView60::MovieView60@s4:75A2 FAR size=54 callers=1
;   movie view, mode 60: movie 194, then command 135
4:75A2  55                   push bp
4:75A3  8bec                 mov bp, sp
4:75A5  66ff760c             push dword ptr [bp + 0xc]
4:75A9  ff760a               push word ptr [bp + 0xa]
4:75AC  6668c2008700         push 0x8700c2
4:75B2  666800003c00         push 0x3c0000
4:75B8  66ff7606             push dword ptr [bp + 6]
4:75BC  90                   nop
4:75BD  0e                   push cs
4:75BE  e84df4               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:75C1  c45e06               les bx, ptr [bp + 6]
4:75C4  26c7071695           mov word ptr es:[bx], 0x9516
4:75C9  26c747029775         mov word ptr es:[bx + 2], 0x7597  ; SEGMENT s4:0000
4:75CF  8bc3                 mov ax, bx
4:75D1  8cc2                 mov dx, es
4:75D3  c9                   leave
4:75D4  ca0a00               retf 0xa
4:75D7  db 00

; ---------------- MovieView61::MovieView61@s4:75D8 FAR size=54 callers=1
;   movie view, mode 61: movie 195, then command 136
4:75D8  55                   push bp
4:75D9  8bec                 mov bp, sp
4:75DB  66ff760c             push dword ptr [bp + 0xc]
4:75DF  ff760a               push word ptr [bp + 0xa]
4:75E2  6668c3008800         push 0x8800c3
4:75E8  666800003d00         push 0x3d0000
4:75EE  66ff7606             push dword ptr [bp + 6]
4:75F2  90                   nop
4:75F3  0e                   push cs
4:75F4  e817f4               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:75F7  c45e06               les bx, ptr [bp + 6]
4:75FA  26c707faa7           mov word ptr es:[bx], 0xa7fa
4:75FF  26c74702cd75         mov word ptr es:[bx + 2], 0x75cd  ; SEGMENT s4:0000
4:7605  8bc3                 mov ax, bx
4:7607  8cc2                 mov dx, es
4:7609  c9                   leave
4:760A  ca0a00               retf 0xa
4:760D  db 00

; ---------------- MovieView62::MovieView62@s4:760E FAR size=54 callers=1
;   movie view, mode 62: movie 196, then command 0
4:760E  55                   push bp
4:760F  8bec                 mov bp, sp
4:7611  66ff760c             push dword ptr [bp + 0xc]
4:7615  ff760a               push word ptr [bp + 0xa]
4:7618  6668c4000000         push 0xc4
4:761E  666800003e00         push 0x3e0000
4:7624  66ff7606             push dword ptr [bp + 6]
4:7628  90                   nop
4:7629  0e                   push cs
4:762A  e8e1f3               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:762D  c45e06               les bx, ptr [bp + 6]
4:7630  26c707deba           mov word ptr es:[bx], 0xbade
4:7635  26c747020376         mov word ptr es:[bx + 2], 0x7603  ; SEGMENT s4:0000
4:763B  8bc3                 mov ax, bx
4:763D  8cc2                 mov dx, es
4:763F  c9                   leave
4:7640  ca0a00               retf 0xa
4:7643  db 00

; ---------------- MovieView63::MovieView63@s4:7644 FAR size=54 callers=1
;   movie view, mode 63: movie 197, then command 0
4:7644  55                   push bp
4:7645  8bec                 mov bp, sp
4:7647  66ff760c             push dword ptr [bp + 0xc]
4:764B  ff760a               push word ptr [bp + 0xa]
4:764E  6668c5000000         push 0xc5
4:7654  666800003f00         push 0x3f0000
4:765A  66ff7606             push dword ptr [bp + 6]
4:765E  90                   nop
4:765F  0e                   push cs
4:7660  e8abf3               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7663  c45e06               les bx, ptr [bp + 6]
4:7666  26c707029d           mov word ptr es:[bx], 0x9d02
4:766B  26c747023976         mov word ptr es:[bx + 2], 0x7639  ; SEGMENT s4:0000
4:7671  8bc3                 mov ax, bx
4:7673  8cc2                 mov dx, es
4:7675  c9                   leave
4:7676  ca0a00               retf 0xa
4:7679  db 00

; ---------------- MovieView64::MovieView64@s4:767A FAR size=54 callers=1
;   movie view, mode 64: movie 198, then command 0
4:767A  55                   push bp
4:767B  8bec                 mov bp, sp
4:767D  66ff760c             push dword ptr [bp + 0xc]
4:7681  ff760a               push word ptr [bp + 0xa]
4:7684  6668c6000000         push 0xc6
4:768A  666800004000         push 0x400000
4:7690  66ff7606             push dword ptr [bp + 6]
4:7694  90                   nop
4:7695  0e                   push cs
4:7696  e875f3               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7699  c45e06               les bx, ptr [bp + 6]
4:769C  26c707e6af           mov word ptr es:[bx], 0xafe6
4:76A1  26c747026f76         mov word ptr es:[bx + 2], 0x766f  ; SEGMENT s4:0000
4:76A7  8bc3                 mov ax, bx
4:76A9  8cc2                 mov dx, es
4:76AB  c9                   leave
4:76AC  ca0a00               retf 0xa
4:76AF  db 00

; ---------------- MovieView65::MovieView65@s4:76B0 FAR size=54 callers=1
;   movie view, mode 65: movie 199, then command 141
4:76B0  55                   push bp
4:76B1  8bec                 mov bp, sp
4:76B3  66ff760c             push dword ptr [bp + 0xc]
4:76B7  ff760a               push word ptr [bp + 0xa]
4:76BA  6668c7008d00         push 0x8d00c7
4:76C0  666800004100         push 0x410000
4:76C6  66ff7606             push dword ptr [bp + 6]
4:76CA  90                   nop
4:76CB  0e                   push cs
4:76CC  e83ff3               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:76CF  c45e06               les bx, ptr [bp + 6]
4:76D2  26c707cac2           mov word ptr es:[bx], 0xc2ca
4:76D7  26c74702a576         mov word ptr es:[bx + 2], 0x76a5  ; SEGMENT s4:0000
4:76DD  8bc3                 mov ax, bx
4:76DF  8cc2                 mov dx, es
4:76E1  c9                   leave
4:76E2  ca0a00               retf 0xa
4:76E5  db 00

; ---------------- MovieView66::MovieView66@s4:76E6 FAR size=54 callers=1
;   movie view, mode 66: movie 200, then command 0
4:76E6  55                   push bp
4:76E7  8bec                 mov bp, sp
4:76E9  66ff760c             push dword ptr [bp + 0xc]
4:76ED  ff760a               push word ptr [bp + 0xa]
4:76F0  6668c8000000         push 0xc8
4:76F6  666800004200         push 0x420000
4:76FC  66ff7606             push dword ptr [bp + 6]
4:7700  90                   nop
4:7701  0e                   push cs
4:7702  e809f3               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7705  c45e06               les bx, ptr [bp + 6]
4:7708  26c7078aa5           mov word ptr es:[bx], 0xa58a
4:770D  26c74702db76         mov word ptr es:[bx + 2], 0x76db  ; SEGMENT s4:0000
4:7713  8bc3                 mov ax, bx
4:7715  8cc2                 mov dx, es
4:7717  c9                   leave
4:7718  ca0a00               retf 0xa
4:771B  db 00

; ---------------- MovieView67::MovieView67@s4:771C FAR size=54 callers=1
;   movie view, mode 67: movie 201, then command 0
4:771C  55                   push bp
4:771D  8bec                 mov bp, sp
4:771F  66ff760c             push dword ptr [bp + 0xc]
4:7723  ff760a               push word ptr [bp + 0xa]
4:7726  6668c9000000         push 0xc9
4:772C  666800004300         push 0x430000
4:7732  66ff7606             push dword ptr [bp + 6]
4:7736  90                   nop
4:7737  0e                   push cs
4:7738  e8d3f2               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:773B  c45e06               les bx, ptr [bp + 6]
4:773E  26c7076eb8           mov word ptr es:[bx], 0xb86e
4:7743  26c747021177         mov word ptr es:[bx + 2], 0x7711  ; SEGMENT s4:0000
4:7749  8bc3                 mov ax, bx
4:774B  8cc2                 mov dx, es
4:774D  c9                   leave
4:774E  ca0a00               retf 0xa
4:7751  db 00

; ---------------- MovieView68::MovieView68@s4:7752 FAR size=54 callers=1
;   movie view, mode 68: movie 204, then command 0
4:7752  55                   push bp
4:7753  8bec                 mov bp, sp
4:7755  66ff760c             push dword ptr [bp + 0xc]
4:7759  ff760a               push word ptr [bp + 0xa]
4:775C  6668cc000000         push 0xcc  ; 'nomono2'
4:7762  666800004400         push 0x440000
4:7768  66ff7606             push dword ptr [bp + 6]
4:776C  90                   nop
4:776D  0e                   push cs
4:776E  e89df2               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7771  c45e06               les bx, ptr [bp + 6]
4:7774  26c7072e9b           mov word ptr es:[bx], 0x9b2e
4:7779  26c747024777         mov word ptr es:[bx + 2], 0x7747  ; SEGMENT s4:0000
4:777F  8bc3                 mov ax, bx
4:7781  8cc2                 mov dx, es
4:7783  c9                   leave
4:7784  ca0a00               retf 0xa
4:7787  db 00

; ---------------- MovieView69::MovieView69@s4:7788 FAR size=54 callers=1
;   movie view, mode 69: movie 205, then command 0
4:7788  55                   push bp
4:7789  8bec                 mov bp, sp
4:778B  66ff760c             push dword ptr [bp + 0xc]
4:778F  ff760a               push word ptr [bp + 0xa]
4:7792  6668cd000000         push 0xcd
4:7798  666800004500         push 0x450000
4:779E  66ff7606             push dword ptr [bp + 6]
4:77A2  90                   nop
4:77A3  0e                   push cs
4:77A4  e867f2               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:77A7  c45e06               les bx, ptr [bp + 6]
4:77AA  26c70712ae           mov word ptr es:[bx], 0xae12
4:77AF  26c747027d77         mov word ptr es:[bx + 2], 0x777d  ; SEGMENT s4:0000
4:77B5  8bc3                 mov ax, bx
4:77B7  8cc2                 mov dx, es
4:77B9  c9                   leave
4:77BA  ca0a00               retf 0xa
4:77BD  db 00

; ---------------- MovieView70::MovieView70@s4:77BE FAR size=54 callers=1
;   movie view, mode 70: movie 209, then command 146
4:77BE  55                   push bp
4:77BF  8bec                 mov bp, sp
4:77C1  66ff760c             push dword ptr [bp + 0xc]
4:77C5  ff760a               push word ptr [bp + 0xa]
4:77C8  6668d1009200         push 0x9200d1
4:77CE  666800004600         push 0x460000
4:77D4  66ff7606             push dword ptr [bp + 6]
4:77D8  90                   nop
4:77D9  0e                   push cs
4:77DA  e831f2               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:77DD  c45e06               les bx, ptr [bp + 6]
4:77E0  26c707f6c0           mov word ptr es:[bx], 0xc0f6
4:77E5  26c74702b377         mov word ptr es:[bx + 2], 0x77b3  ; SEGMENT s4:0000
4:77EB  8bc3                 mov ax, bx
4:77ED  8cc2                 mov dx, es
4:77EF  c9                   leave
4:77F0  ca0a00               retf 0xa
4:77F3  db 00

; ---------------- MovieView71::MovieView71@s4:77F4 FAR size=54 callers=1
;   movie view, mode 71: movie 210, then command 0
4:77F4  55                   push bp
4:77F5  8bec                 mov bp, sp
4:77F7  66ff760c             push dword ptr [bp + 0xc]
4:77FB  ff760a               push word ptr [bp + 0xa]
4:77FE  6668d2000000         push 0xd2
4:7804  666800004700         push 0x470000
4:780A  66ff7606             push dword ptr [bp + 6]
4:780E  90                   nop
4:780F  0e                   push cs
4:7810  e8fbf1               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7813  c45e06               les bx, ptr [bp + 6]
4:7816  26c707b6a3           mov word ptr es:[bx], 0xa3b6
4:781B  26c74702e977         mov word ptr es:[bx + 2], 0x77e9  ; SEGMENT s4:0000
4:7821  8bc3                 mov ax, bx
4:7823  8cc2                 mov dx, es
4:7825  c9                   leave
4:7826  ca0a00               retf 0xa
4:7829  db 00

; ---------------- MovieView72::MovieView72@s4:782A FAR size=54 callers=1
;   movie view, mode 72: movie 213, then command 0
4:782A  55                   push bp
4:782B  8bec                 mov bp, sp
4:782D  66ff760c             push dword ptr [bp + 0xc]
4:7831  ff760a               push word ptr [bp + 0xa]
4:7834  6668d5000000         push 0xd5
4:783A  666800004800         push 0x480000
4:7840  66ff7606             push dword ptr [bp + 6]
4:7844  90                   nop
4:7845  0e                   push cs
4:7846  e8c5f1               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7849  c45e06               les bx, ptr [bp + 6]
4:784C  26c707daac           mov word ptr es:[bx], 0xacda
4:7851  26c747021f78         mov word ptr es:[bx + 2], 0x781f  ; SEGMENT s4:0000
4:7857  8bc3                 mov ax, bx
4:7859  8cc2                 mov dx, es
4:785B  c9                   leave
4:785C  ca0a00               retf 0xa
4:785F  db 00

; ---------------- MovieView73::MovieView73@s4:7860 FAR size=54 callers=1
;   movie view, mode 73: movie 214, then command 0
4:7860  55                   push bp
4:7861  8bec                 mov bp, sp
4:7863  66ff760c             push dword ptr [bp + 0xc]
4:7867  ff760a               push word ptr [bp + 0xa]
4:786A  6668d6000000         push 0xd6
4:7870  666800004900         push 0x490000
4:7876  66ff7606             push dword ptr [bp + 6]
4:787A  90                   nop
4:787B  0e                   push cs
4:787C  e88ff1               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:787F  c45e06               les bx, ptr [bp + 6]
4:7882  26c707bebf           mov word ptr es:[bx], 0xbfbe
4:7887  26c747025578         mov word ptr es:[bx + 2], 0x7855  ; SEGMENT s4:0000
4:788D  8bc3                 mov ax, bx
4:788F  8cc2                 mov dx, es
4:7891  c9                   leave
4:7892  ca0a00               retf 0xa
4:7895  db 00

; ---------------- MovieView74::MovieView74@s4:7896 FAR size=54 callers=1
;   movie view, mode 74: movie 215, then command 152, sound 500
4:7896  55                   push bp
4:7897  8bec                 mov bp, sp
4:7899  66ff760c             push dword ptr [bp + 0xc]
4:789D  ff760a               push word ptr [bp + 0xa]
4:78A0  6668d7009800         push 0x9800d7  ; 'Outpost'
4:78A6  6668f4014a00         push 0x4a01f4
4:78AC  66ff7606             push dword ptr [bp + 6]
4:78B0  90                   nop
4:78B1  0e                   push cs
4:78B2  e859f1               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:78B5  c45e06               les bx, ptr [bp + 6]
4:78B8  26c707e2a1           mov word ptr es:[bx], 0xa1e2
4:78BD  26c747028b78         mov word ptr es:[bx + 2], 0x788b  ; SEGMENT s4:0000
4:78C3  8bc3                 mov ax, bx
4:78C5  8cc2                 mov dx, es
4:78C7  c9                   leave
4:78C8  ca0a00               retf 0xa
4:78CB  db 00

; ---------------- MovieView75::MovieView75@s4:78CC FAR size=54 callers=1
;   movie view, mode 75: movie 216, then command 153
4:78CC  55                   push bp
4:78CD  8bec                 mov bp, sp
4:78CF  66ff760c             push dword ptr [bp + 0xc]
4:78D3  ff760a               push word ptr [bp + 0xa]
4:78D6  6668d8009900         push 0x9900d8
4:78DC  666800004b00         push 0x4b0000
4:78E2  66ff7606             push dword ptr [bp + 6]
4:78E6  90                   nop
4:78E7  0e                   push cs
4:78E8  e823f1               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:78EB  c45e06               les bx, ptr [bp + 6]
4:78EE  26c707c6b4           mov word ptr es:[bx], 0xb4c6
4:78F3  26c74702c178         mov word ptr es:[bx + 2], 0x78c1  ; SEGMENT s4:0000
4:78F9  8bc3                 mov ax, bx
4:78FB  8cc2                 mov dx, es
4:78FD  c9                   leave
4:78FE  ca0a00               retf 0xa
4:7901  db 00

; ---------------- MovieView76::MovieView76@s4:7902 FAR size=54 callers=1
;   movie view, mode 76: movie 217, then command 238
4:7902  55                   push bp
4:7903  8bec                 mov bp, sp
4:7905  66ff760c             push dword ptr [bp + 0xc]
4:7909  ff760a               push word ptr [bp + 0xa]
4:790C  6668d900ee00         push 0xee00d9
4:7912  666800004c00         push 0x4c0000
4:7918  66ff7606             push dword ptr [bp + 6]
4:791C  90                   nop
4:791D  0e                   push cs
4:791E  e8edf0               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7921  c45e06               les bx, ptr [bp + 6]
4:7924  26c7078697           mov word ptr es:[bx], 0x9786
4:7929  26c74702f778         mov word ptr es:[bx + 2], 0x78f7  ; SEGMENT s4:0000
4:792F  8bc3                 mov ax, bx
4:7931  8cc2                 mov dx, es
4:7933  c9                   leave
4:7934  ca0a00               retf 0xa
4:7937  db 00

; ---------------- MovieView77::MovieView77@s4:7938 FAR size=54 callers=1
;   movie view, mode 77: movie 218, then command 156
4:7938  55                   push bp
4:7939  8bec                 mov bp, sp
4:793B  66ff760c             push dword ptr [bp + 0xc]
4:793F  ff760a               push word ptr [bp + 0xa]
4:7942  6668da009c00         push 0x9c00da
4:7948  666800004d00         push 0x4d0000
4:794E  66ff7606             push dword ptr [bp + 6]
4:7952  90                   nop
4:7953  0e                   push cs
4:7954  e8b7f0               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7957  c45e06               les bx, ptr [bp + 6]
4:795A  26c7076aaa           mov word ptr es:[bx], 0xaa6a
4:795F  26c747022d79         mov word ptr es:[bx + 2], 0x792d  ; SEGMENT s4:0000
4:7965  8bc3                 mov ax, bx
4:7967  8cc2                 mov dx, es
4:7969  c9                   leave
4:796A  ca0a00               retf 0xa
4:796D  db 00

; ---------------- MovieView78::MovieView78@s4:796E FAR size=54 callers=1
;   movie view, mode 78: movie 219, then command 157
4:796E  55                   push bp
4:796F  8bec                 mov bp, sp
4:7971  66ff760c             push dword ptr [bp + 0xc]
4:7975  ff760a               push word ptr [bp + 0xa]
4:7978  6668db009d00         push 0x9d00db
4:797E  666800004e00         push 0x4e0000
4:7984  66ff7606             push dword ptr [bp + 6]
4:7988  90                   nop
4:7989  0e                   push cs
4:798A  e881f0               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:798D  c45e06               les bx, ptr [bp + 6]
4:7990  26c7074ebd           mov word ptr es:[bx], 0xbd4e
4:7995  26c747026379         mov word ptr es:[bx + 2], 0x7963  ; SEGMENT s4:0000
4:799B  8bc3                 mov ax, bx
4:799D  8cc2                 mov dx, es
4:799F  c9                   leave
4:79A0  ca0a00               retf 0xa
4:79A3  db 00

; ---------------- MovieView79::MovieView79@s4:79A4 FAR size=54 callers=1
;   movie view, mode 79: movie 220, then command 158
4:79A4  55                   push bp
4:79A5  8bec                 mov bp, sp
4:79A7  66ff760c             push dword ptr [bp + 0xc]
4:79AB  ff760a               push word ptr [bp + 0xa]
4:79AE  6668dc009e00         push 0x9e00dc
4:79B4  666800004f00         push 0x4f0000
4:79BA  66ff7606             push dword ptr [bp + 6]
4:79BE  90                   nop
4:79BF  0e                   push cs
4:79C0  e84bf0               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:79C3  c45e06               les bx, ptr [bp + 6]
4:79C6  26c7070ea0           mov word ptr es:[bx], 0xa00e
4:79CB  26c747029979         mov word ptr es:[bx + 2], 0x7999  ; SEGMENT s4:0000
4:79D1  8bc3                 mov ax, bx
4:79D3  8cc2                 mov dx, es
4:79D5  c9                   leave
4:79D6  ca0a00               retf 0xa
4:79D9  db 00

; ---------------- MovieView80::MovieView80@s4:79DA FAR size=54 callers=1
;   movie view, mode 80: movie 221, then command 0
4:79DA  55                   push bp
4:79DB  8bec                 mov bp, sp
4:79DD  66ff760c             push dword ptr [bp + 0xc]
4:79E1  ff760a               push word ptr [bp + 0xa]
4:79E4  6668dd000000         push 0xdd
4:79EA  666800005000         push 0x500000
4:79F0  66ff7606             push dword ptr [bp + 6]
4:79F4  90                   nop
4:79F5  0e                   push cs
4:79F6  e815f0               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:79F9  c45e06               les bx, ptr [bp + 6]
4:79FC  26c707f2b2           mov word ptr es:[bx], 0xb2f2
4:7A01  26c74702cf79         mov word ptr es:[bx + 2], 0x79cf  ; SEGMENT s4:0000
4:7A07  8bc3                 mov ax, bx
4:7A09  8cc2                 mov dx, es
4:7A0B  c9                   leave
4:7A0C  ca0a00               retf 0xa
4:7A0F  db 00

; ---------------- MovieView81::MovieView81@s4:7A10 FAR size=54 callers=1
;   movie view, mode 81: movie 222, then command 0, sound 473
4:7A10  55                   push bp
4:7A11  8bec                 mov bp, sp
4:7A13  66ff760c             push dword ptr [bp + 0xc]
4:7A17  ff760a               push word ptr [bp + 0xa]
4:7A1A  6668de000000         push 0xde
4:7A20  6668d9015100         push 0x5101d9
4:7A26  66ff7606             push dword ptr [bp + 6]
4:7A2A  90                   nop
4:7A2B  0e                   push cs
4:7A2C  e8dfef               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7A2F  c45e06               les bx, ptr [bp + 6]
4:7A32  26c707b295           mov word ptr es:[bx], 0x95b2
4:7A37  26c74702057a         mov word ptr es:[bx + 2], 0x7a05  ; SEGMENT s4:0000
4:7A3D  8bc3                 mov ax, bx
4:7A3F  8cc2                 mov dx, es
4:7A41  c9                   leave
4:7A42  ca0a00               retf 0xa
4:7A45  db 00

; ---------------- MovieView82::MovieView82@s4:7A46 FAR size=54 callers=1
;   movie view, mode 82: movie 223, then command 0
4:7A46  55                   push bp
4:7A47  8bec                 mov bp, sp
4:7A49  66ff760c             push dword ptr [bp + 0xc]
4:7A4D  ff760a               push word ptr [bp + 0xa]
4:7A50  6668df000000         push 0xdf  ; 'You may not run a turn. The game is over!'
4:7A56  666800005200         push 0x520000
4:7A5C  66ff7606             push dword ptr [bp + 6]
4:7A60  90                   nop
4:7A61  0e                   push cs
4:7A62  e8a9ef               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7A65  c45e06               les bx, ptr [bp + 6]
4:7A68  26c70796a8           mov word ptr es:[bx], 0xa896
4:7A6D  26c747023b7a         mov word ptr es:[bx + 2], 0x7a3b  ; SEGMENT s4:0000
4:7A73  8bc3                 mov ax, bx
4:7A75  8cc2                 mov dx, es
4:7A77  c9                   leave
4:7A78  ca0a00               retf 0xa
4:7A7B  db 00

; ---------------- MovieView83::MovieView83@s4:7A7C FAR size=54 callers=1
;   movie view, mode 83: movie 224, then command 0
4:7A7C  55                   push bp
4:7A7D  8bec                 mov bp, sp
4:7A7F  66ff760c             push dword ptr [bp + 0xc]
4:7A83  ff760a               push word ptr [bp + 0xa]
4:7A86  6668e0000000         push 0xe0
4:7A8C  666800005300         push 0x530000
4:7A92  66ff7606             push dword ptr [bp + 6]
4:7A96  90                   nop
4:7A97  0e                   push cs
4:7A98  e873ef               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7A9B  c45e06               les bx, ptr [bp + 6]
4:7A9E  26c7077abb           mov word ptr es:[bx], 0xbb7a
4:7AA3  26c74702717a         mov word ptr es:[bx + 2], 0x7a71  ; SEGMENT s4:0000
4:7AA9  8bc3                 mov ax, bx
4:7AAB  8cc2                 mov dx, es
4:7AAD  c9                   leave
4:7AAE  ca0a00               retf 0xa
4:7AB1  db 00

; ---------------- MovieView85::MovieView85@s4:7AB2 FAR size=54 callers=1
;   movie view, mode 85: movie 226, then command 0, sound 484
4:7AB2  55                   push bp
4:7AB3  8bec                 mov bp, sp
4:7AB5  66ff760c             push dword ptr [bp + 0xc]
4:7AB9  ff760a               push word ptr [bp + 0xa]
4:7ABC  6668e2000000         push 0xe2
4:7AC2  6668e4015500         push 0x5501e4
4:7AC8  66ff7606             push dword ptr [bp + 6]
4:7ACC  90                   nop
4:7ACD  0e                   push cs
4:7ACE  e83def               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7AD1  c45e06               les bx, ptr [bp + 6]
4:7AD4  26c70782b0           mov word ptr es:[bx], 0xb082
4:7AD9  26c74702a77a         mov word ptr es:[bx + 2], 0x7aa7  ; SEGMENT s4:0000
4:7ADF  8bc3                 mov ax, bx
4:7AE1  8cc2                 mov dx, es
4:7AE3  c9                   leave
4:7AE4  ca0a00               retf 0xa
4:7AE7  db 00

; ---------------- MovieView86::MovieView86@s4:7AE8 FAR size=54 callers=1
;   movie view, mode 86: movie 227, then command 0, sound 484
4:7AE8  55                   push bp
4:7AE9  8bec                 mov bp, sp
4:7AEB  66ff760c             push dword ptr [bp + 0xc]
4:7AEF  ff760a               push word ptr [bp + 0xa]
4:7AF2  6668e3000000         push 0xe3
4:7AF8  6668e4015600         push 0x5601e4
4:7AFE  66ff7606             push dword ptr [bp + 6]
4:7B02  90                   nop
4:7B03  0e                   push cs
4:7B04  e807ef               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7B07  c45e06               les bx, ptr [bp + 6]
4:7B0A  26c70766c3           mov word ptr es:[bx], 0xc366
4:7B0F  26c74702dd7a         mov word ptr es:[bx + 2], 0x7add  ; SEGMENT s4:0000
4:7B15  8bc3                 mov ax, bx
4:7B17  8cc2                 mov dx, es
4:7B19  c9                   leave
4:7B1A  ca0a00               retf 0xa
4:7B1D  db 00

; ---------------- MovieView87::MovieView87@s4:7B1E FAR size=54 callers=1
;   movie view, mode 87: movie 228, then command 0, sound 474
4:7B1E  55                   push bp
4:7B1F  8bec                 mov bp, sp
4:7B21  66ff760c             push dword ptr [bp + 0xc]
4:7B25  ff760a               push word ptr [bp + 0xa]
4:7B28  6668e4000000         push 0xe4
4:7B2E  6668da015700         push 0x5701da
4:7B34  66ff7606             push dword ptr [bp + 6]
4:7B38  90                   nop
4:7B39  0e                   push cs
4:7B3A  e8d1ee               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7B3D  c45e06               les bx, ptr [bp + 6]
4:7B40  26c70726a6           mov word ptr es:[bx], 0xa626
4:7B45  26c74702137b         mov word ptr es:[bx + 2], 0x7b13  ; SEGMENT s4:0000
4:7B4B  8bc3                 mov ax, bx
4:7B4D  8cc2                 mov dx, es
4:7B4F  c9                   leave
4:7B50  ca0a00               retf 0xa
4:7B53  db 00

; ---------------- MovieView88::MovieView88@s4:7B54 FAR size=54 callers=1
;   movie view, mode 88: movie 229, then command 0, sound 472
4:7B54  55                   push bp
4:7B55  8bec                 mov bp, sp
4:7B57  66ff760c             push dword ptr [bp + 0xc]
4:7B5B  ff760a               push word ptr [bp + 0xa]
4:7B5E  6668e5000000         push 0xe5
4:7B64  6668d8015800         push 0x5801d8
4:7B6A  66ff7606             push dword ptr [bp + 6]
4:7B6E  90                   nop
4:7B6F  0e                   push cs
4:7B70  e89bee               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7B73  c45e06               les bx, ptr [bp + 6]
4:7B76  26c7070ab9           mov word ptr es:[bx], 0xb90a
4:7B7B  26c74702497b         mov word ptr es:[bx + 2], 0x7b49  ; SEGMENT s4:0000
4:7B81  8bc3                 mov ax, bx
4:7B83  8cc2                 mov dx, es
4:7B85  c9                   leave
4:7B86  ca0a00               retf 0xa
4:7B89  db 00

; ---------------- MovieView89::MovieView89@s4:7B8A FAR size=54 callers=1
;   movie view, mode 89: movie 230, then command 0
4:7B8A  55                   push bp
4:7B8B  8bec                 mov bp, sp
4:7B8D  66ff760c             push dword ptr [bp + 0xc]
4:7B91  ff760a               push word ptr [bp + 0xa]
4:7B94  6668e6000000         push 0xe6
4:7B9A  666800005900         push 0x590000
4:7BA0  66ff7606             push dword ptr [bp + 6]
4:7BA4  90                   nop
4:7BA5  0e                   push cs
4:7BA6  e865ee               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7BA9  c45e06               les bx, ptr [bp + 6]
4:7BAC  26c707ca9b           mov word ptr es:[bx], 0x9bca
4:7BB1  26c747027f7b         mov word ptr es:[bx + 2], 0x7b7f  ; SEGMENT s4:0000
4:7BB7  8bc3                 mov ax, bx
4:7BB9  8cc2                 mov dx, es
4:7BBB  c9                   leave
4:7BBC  ca0a00               retf 0xa
4:7BBF  db 00

; ---------------- MovieView90::MovieView90@s4:7BC0 FAR size=54 callers=1
;   movie view, mode 90: movie 231, then command 0, sound 495
4:7BC0  55                   push bp
4:7BC1  8bec                 mov bp, sp
4:7BC3  66ff760c             push dword ptr [bp + 0xc]
4:7BC7  ff760a               push word ptr [bp + 0xa]
4:7BCA  6668e7000000         push 0xe7
4:7BD0  6668ef015a00         push 0x5a01ef
4:7BD6  66ff7606             push dword ptr [bp + 6]
4:7BDA  90                   nop
4:7BDB  0e                   push cs
4:7BDC  e82fee               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7BDF  c45e06               les bx, ptr [bp + 6]
4:7BE2  26c707aeae           mov word ptr es:[bx], 0xaeae
4:7BE7  26c74702b57b         mov word ptr es:[bx + 2], 0x7bb5  ; SEGMENT s4:0000
4:7BED  8bc3                 mov ax, bx
4:7BEF  8cc2                 mov dx, es
4:7BF1  c9                   leave
4:7BF2  ca0a00               retf 0xa
4:7BF5  db 00

; ---------------- MovieView91::MovieView91@s4:7BF6 FAR size=54 callers=1
;   movie view, mode 91: movie 232, then command 0
4:7BF6  55                   push bp
4:7BF7  8bec                 mov bp, sp
4:7BF9  66ff760c             push dword ptr [bp + 0xc]
4:7BFD  ff760a               push word ptr [bp + 0xa]
4:7C00  6668e8000000         push 0xe8
4:7C06  666800005b00         push 0x5b0000
4:7C0C  66ff7606             push dword ptr [bp + 6]
4:7C10  90                   nop
4:7C11  0e                   push cs
4:7C12  e8f9ed               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7C15  c45e06               les bx, ptr [bp + 6]
4:7C18  26c70792c1           mov word ptr es:[bx], 0xc192
4:7C1D  26c74702eb7b         mov word ptr es:[bx + 2], 0x7beb  ; SEGMENT s4:0000
4:7C23  8bc3                 mov ax, bx
4:7C25  8cc2                 mov dx, es
4:7C27  c9                   leave
4:7C28  ca0a00               retf 0xa
4:7C2B  db 00

; ---------------- MovieView92::MovieView92@s4:7C2C FAR size=54 callers=1
;   movie view, mode 92: movie 234, then command 0
4:7C2C  55                   push bp
4:7C2D  8bec                 mov bp, sp
4:7C2F  66ff760c             push dword ptr [bp + 0xc]
4:7C33  ff760a               push word ptr [bp + 0xa]
4:7C36  6668ea000000         push 0xea
4:7C3C  666800005c00         push 0x5c0000
4:7C42  66ff7606             push dword ptr [bp + 6]
4:7C46  90                   nop
4:7C47  0e                   push cs
4:7C48  e8c3ed               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7C4B  c45e06               les bx, ptr [bp + 6]
4:7C4E  26c70736b7           mov word ptr es:[bx], 0xb736
4:7C53  26c74702217c         mov word ptr es:[bx + 2], 0x7c21  ; SEGMENT s4:0000
4:7C59  8bc3                 mov ax, bx
4:7C5B  8cc2                 mov dx, es
4:7C5D  c9                   leave
4:7C5E  ca0a00               retf 0xa
4:7C61  db 00

; ---------------- MovieView93::MovieView93@s4:7C62 FAR size=54 callers=1
;   movie view, mode 93: movie 235, then command 0
4:7C62  55                   push bp
4:7C63  8bec                 mov bp, sp
4:7C65  66ff760c             push dword ptr [bp + 0xc]
4:7C69  ff760a               push word ptr [bp + 0xa]
4:7C6C  6668eb000000         push 0xeb
4:7C72  666800005d00         push 0x5d0000
4:7C78  66ff7606             push dword ptr [bp + 6]
4:7C7C  90                   nop
4:7C7D  0e                   push cs
4:7C7E  e88ded               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7C81  c45e06               les bx, ptr [bp + 6]
4:7C84  26c707f699           mov word ptr es:[bx], 0x99f6
4:7C89  26c74702577c         mov word ptr es:[bx + 2], 0x7c57  ; SEGMENT s4:0000
4:7C8F  8bc3                 mov ax, bx
4:7C91  8cc2                 mov dx, es
4:7C93  c9                   leave
4:7C94  ca0a00               retf 0xa
4:7C97  db 00

; ---------------- MovieView94::MovieView94@s4:7C98 FAR size=54 callers=1
;   movie view, mode 94: movie 236, then command 238, sound 486
4:7C98  55                   push bp
4:7C99  8bec                 mov bp, sp
4:7C9B  66ff760c             push dword ptr [bp + 0xc]
4:7C9F  ff760a               push word ptr [bp + 0xa]
4:7CA2  6668ec00ee00         push 0xee00ec
4:7CA8  6668e6015e00         push 0x5e01e6
4:7CAE  66ff7606             push dword ptr [bp + 6]
4:7CB2  90                   nop
4:7CB3  0e                   push cs
4:7CB4  e857ed               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7CB7  c45e06               les bx, ptr [bp + 6]
4:7CBA  26c70742ba           mov word ptr es:[bx], 0xba42
4:7CBF  26c747028d7c         mov word ptr es:[bx + 2], 0x7c8d  ; SEGMENT s4:0000
4:7CC5  8bc3                 mov ax, bx
4:7CC7  8cc2                 mov dx, es
4:7CC9  c9                   leave
4:7CCA  ca0a00               retf 0xa
4:7CCD  db 00

; ---------------- MovieView95::MovieView95@s4:7CCE FAR size=54 callers=1
;   movie view, mode 95: movie 237, then command 0, sound 474
4:7CCE  55                   push bp
4:7CCF  8bec                 mov bp, sp
4:7CD1  66ff760c             push dword ptr [bp + 0xc]
4:7CD5  ff760a               push word ptr [bp + 0xa]
4:7CD8  6668ed000000         push 0xed
4:7CDE  6668da015f00         push 0x5f01da
4:7CE4  66ff7606             push dword ptr [bp + 6]
4:7CE8  90                   nop
4:7CE9  0e                   push cs
4:7CEA  e821ed               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7CED  c45e06               les bx, ptr [bp + 6]
4:7CF0  26c707d69e           mov word ptr es:[bx], 0x9ed6
4:7CF5  26c74702c37c         mov word ptr es:[bx + 2], 0x7cc3  ; SEGMENT s4:0000
4:7CFB  8bc3                 mov ax, bx
4:7CFD  8cc2                 mov dx, es
4:7CFF  c9                   leave
4:7D00  ca0a00               retf 0xa
4:7D03  db 00

; ---------------- MovieView96::MovieView96@s4:7D04 FAR size=54 callers=1
;   movie view, mode 96: movie 238, then command 0
4:7D04  55                   push bp
4:7D05  8bec                 mov bp, sp
4:7D07  66ff760c             push dword ptr [bp + 0xc]
4:7D0B  ff760a               push word ptr [bp + 0xa]
4:7D0E  6668ee000000         push 0xee
4:7D14  666800006000         push 0x600000
4:7D1A  66ff7606             push dword ptr [bp + 6]
4:7D1E  90                   nop
4:7D1F  0e                   push cs
4:7D20  e8ebec               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7D23  c45e06               les bx, ptr [bp + 6]
4:7D26  26c707bab1           mov word ptr es:[bx], 0xb1ba
4:7D2B  26c74702f97c         mov word ptr es:[bx + 2], 0x7cf9  ; SEGMENT s4:0000
4:7D31  8bc3                 mov ax, bx
4:7D33  8cc2                 mov dx, es
4:7D35  c9                   leave
4:7D36  ca0a00               retf 0xa
4:7D39  db 00

; ---------------- MovieView97::MovieView97@s4:7D3A FAR size=54 callers=1
;   movie view, mode 97: movie 239, then command 0, sound 496
4:7D3A  55                   push bp
4:7D3B  8bec                 mov bp, sp
4:7D3D  66ff760c             push dword ptr [bp + 0xc]
4:7D41  ff760a               push word ptr [bp + 0xa]
4:7D44  6668ef000000         push 0xef
4:7D4A  6668f0016100         push 0x6101f0
4:7D50  66ff7606             push dword ptr [bp + 6]
4:7D54  90                   nop
4:7D55  0e                   push cs
4:7D56  e8b5ec               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7D59  c45e06               les bx, ptr [bp + 6]
4:7D5C  26c7077a94           mov word ptr es:[bx], 0x947a
4:7D61  26c747022f7d         mov word ptr es:[bx + 2], 0x7d2f  ; SEGMENT s4:0000
4:7D67  8bc3                 mov ax, bx
4:7D69  8cc2                 mov dx, es
4:7D6B  c9                   leave
4:7D6C  ca0a00               retf 0xa
4:7D6F  db 00

; ---------------- MovieView98::MovieView98@s4:7D70 FAR size=54 callers=1
;   movie view, mode 98: movie 240, then command 204, sound 503
4:7D70  55                   push bp
4:7D71  8bec                 mov bp, sp
4:7D73  66ff760c             push dword ptr [bp + 0xc]
4:7D77  ff760a               push word ptr [bp + 0xa]
4:7D7A  6668f000cc00         push 0xcc00f0
4:7D80  6668f7016200         push 0x6201f7
4:7D86  66ff7606             push dword ptr [bp + 6]
4:7D8A  90                   nop
4:7D8B  0e                   push cs
4:7D8C  e87fec               call 0x6a0e  ; MovieView::MovieView@s4:6A0E
4:7D8F  c45e06               les bx, ptr [bp + 6]
4:7D92  26c7075ea7           mov word ptr es:[bx], 0xa75e
4:7D97  26c74702657d         mov word ptr es:[bx + 2], 0x7d65  ; SEGMENT s4:0000
4:7D9D  8bc3                 mov ax, bx
4:7D9F  8cc2                 mov dx, es
4:7DA1  c9                   leave
4:7DA2  ca0a00               retf 0xa
4:7DA5  db 00

; ---------------- MovieView11::scalar_dtor@s4:7DA6 FAR size=72 callers=0
;   mode 11 movie view deleting destructor
4:7DA6  c81c0000             enter 0x1c, 0
4:7DAA  668b4606             mov eax, dword ptr [bp + 6]
4:7DAE  05d200               add ax, 0xd2
4:7DB1  6650                 push eax
4:7DB3  9ac457c47d           lcall 0x7dc4, 0x57c4  ; List::~List@s2:57C4
4:7DB8  c45e06               les bx, ptr [bp + 6]
4:7DBB  26c7070a38           mov word ptr es:[bx], 0x380a
4:7DC0  26c74702d27d         mov word ptr es:[bx + 2], 0x7dd2  ; SEGMENT s2:0000
4:7DC6  c45e06               les bx, ptr [bp + 6]
4:7DC9  26c7079a38           mov word ptr es:[bx], 0x389a
4:7DCE  26c747024d74         mov word ptr es:[bx + 2], 0x744d  ; SEGMENT s2:0000
4:7DD4  f6460a01             test byte ptr [bp + 0xa], 1
4:7DD8  7409                 je 0x7de3
4:7DDA  66ff7606             push dword ptr [bp + 6]
4:7DDE  9ace17596c           lcall 0x6c59, 0x17ce  ; operator_delete@s1:17CE
loc_7DE3:
4:7DE3  8b4606               mov ax, word ptr [bp + 6]
4:7DE6  8b5608               mov dx, word ptr [bp + 8]
4:7DE9  c9                   leave
4:7DEA  ca0600               retf 6
4:7DED  db 00

; ---------------- MovieView12::scalar_dtor@s4:7DEE FAR size=72 callers=0
;   mode 12 movie view deleting destructor
4:7DEE  c81c0000             enter 0x1c, 0
4:7DF2  668b4606             mov eax, dword ptr [bp + 6]
4:7DF6  05d200               add ax, 0xd2
4:7DF9  6650                 push eax
4:7DFB  9ac4570c7e           lcall 0x7e0c, 0x57c4  ; List::~List@s2:57C4
4:7E00  c45e06               les bx, ptr [bp + 6]
4:7E03  26c7070a38           mov word ptr es:[bx], 0x380a
4:7E08  26c747021a7e         mov word ptr es:[bx + 2], 0x7e1a  ; SEGMENT s2:0000
4:7E0E  c45e06               les bx, ptr [bp + 6]
4:7E11  26c7079a38           mov word ptr es:[bx], 0x389a
4:7E16  26c74702b67d         mov word ptr es:[bx + 2], 0x7db6  ; SEGMENT s2:0000
4:7E1C  f6460a01             test byte ptr [bp + 0xa], 1
4:7E20  7409                 je 0x7e2b
4:7E22  66ff7606             push dword ptr [bp + 6]
4:7E26  9ace17e17d           lcall 0x7de1, 0x17ce  ; operator_delete@s1:17CE
loc_7E2B:
4:7E2B  8b4606               mov ax, word ptr [bp + 6]
4:7E2E  8b5608               mov dx, word ptr [bp + 8]
4:7E31  c9                   leave
4:7E32  ca0600               retf 6
4:7E35  db 00

; ---------------- MovieView13::scalar_dtor@s4:7E36 FAR size=72 callers=0
;   mode 13 movie view deleting destructor
4:7E36  c81c0000             enter 0x1c, 0
4:7E3A  668b4606             mov eax, dword ptr [bp + 6]
4:7E3E  05d200               add ax, 0xd2
4:7E41  6650                 push eax
4:7E43  9ac457547e           lcall 0x7e54, 0x57c4  ; List::~List@s2:57C4
4:7E48  c45e06               les bx, ptr [bp + 6]
4:7E4B  26c7070a38           mov word ptr es:[bx], 0x380a
4:7E50  26c74702627e         mov word ptr es:[bx + 2], 0x7e62  ; SEGMENT s2:0000
4:7E56  c45e06               les bx, ptr [bp + 6]
4:7E59  26c7079a38           mov word ptr es:[bx], 0x389a
4:7E5E  26c74702fe7d         mov word ptr es:[bx + 2], 0x7dfe  ; SEGMENT s2:0000
4:7E64  f6460a01             test byte ptr [bp + 0xa], 1
4:7E68  7409                 je 0x7e73
4:7E6A  66ff7606             push dword ptr [bp + 6]
4:7E6E  9ace17297e           lcall 0x7e29, 0x17ce  ; operator_delete@s1:17CE
loc_7E73:
4:7E73  8b4606               mov ax, word ptr [bp + 6]
4:7E76  8b5608               mov dx, word ptr [bp + 8]
4:7E79  c9                   leave
4:7E7A  ca0600               retf 6
4:7E7D  db 00

; ---------------- MovieView14::scalar_dtor@s4:7E7E FAR size=72 callers=0
;   mode 14 movie view deleting destructor
4:7E7E  c81c0000             enter 0x1c, 0
4:7E82  668b4606             mov eax, dword ptr [bp + 6]
4:7E86  05d200               add ax, 0xd2
4:7E89  6650                 push eax
4:7E8B  9ac4579c7e           lcall 0x7e9c, 0x57c4  ; List::~List@s2:57C4
4:7E90  c45e06               les bx, ptr [bp + 6]
4:7E93  26c7070a38           mov word ptr es:[bx], 0x380a
4:7E98  26c74702aa7e         mov word ptr es:[bx + 2], 0x7eaa  ; SEGMENT s2:0000
4:7E9E  c45e06               les bx, ptr [bp + 6]
4:7EA1  26c7079a38           mov word ptr es:[bx], 0x389a
4:7EA6  26c74702467e         mov word ptr es:[bx + 2], 0x7e46  ; SEGMENT s2:0000
4:7EAC  f6460a01             test byte ptr [bp + 0xa], 1
4:7EB0  7409                 je 0x7ebb
4:7EB2  66ff7606             push dword ptr [bp + 6]
4:7EB6  9ace17717e           lcall 0x7e71, 0x17ce  ; operator_delete@s1:17CE
loc_7EBB:
4:7EBB  8b4606               mov ax, word ptr [bp + 6]
4:7EBE  8b5608               mov dx, word ptr [bp + 8]
4:7EC1  c9                   leave
4:7EC2  ca0600               retf 6
4:7EC5  db 00

; ---------------- MovieView15::scalar_dtor@s4:7EC6 FAR size=72 callers=0
;   mode 15 movie view deleting destructor
4:7EC6  c81c0000             enter 0x1c, 0
4:7ECA  668b4606             mov eax, dword ptr [bp + 6]
4:7ECE  05d200               add ax, 0xd2
4:7ED1  6650                 push eax
4:7ED3  9ac457e47e           lcall 0x7ee4, 0x57c4  ; List::~List@s2:57C4
4:7ED8  c45e06               les bx, ptr [bp + 6]
4:7EDB  26c7070a38           mov word ptr es:[bx], 0x380a
4:7EE0  26c74702f27e         mov word ptr es:[bx + 2], 0x7ef2  ; SEGMENT s2:0000
4:7EE6  c45e06               les bx, ptr [bp + 6]
4:7EE9  26c7079a38           mov word ptr es:[bx], 0x389a
4:7EEE  26c747028e7e         mov word ptr es:[bx + 2], 0x7e8e  ; SEGMENT s2:0000
4:7EF4  f6460a01             test byte ptr [bp + 0xa], 1
4:7EF8  7409                 je 0x7f03
4:7EFA  66ff7606             push dword ptr [bp + 6]
4:7EFE  9ace17b97e           lcall 0x7eb9, 0x17ce  ; operator_delete@s1:17CE
loc_7F03:
4:7F03  8b4606               mov ax, word ptr [bp + 6]
4:7F06  8b5608               mov dx, word ptr [bp + 8]
4:7F09  c9                   leave
4:7F0A  ca0600               retf 6
4:7F0D  db 00

; ---------------- MovieView16::scalar_dtor@s4:7F0E FAR size=72 callers=0
;   mode 16 movie view deleting destructor
4:7F0E  c81c0000             enter 0x1c, 0
4:7F12  668b4606             mov eax, dword ptr [bp + 6]
4:7F16  05d200               add ax, 0xd2
4:7F19  6650                 push eax
4:7F1B  9ac4572c7f           lcall 0x7f2c, 0x57c4  ; List::~List@s2:57C4
4:7F20  c45e06               les bx, ptr [bp + 6]
4:7F23  26c7070a38           mov word ptr es:[bx], 0x380a
4:7F28  26c747023a7f         mov word ptr es:[bx + 2], 0x7f3a  ; SEGMENT s2:0000
4:7F2E  c45e06               les bx, ptr [bp + 6]
4:7F31  26c7079a38           mov word ptr es:[bx], 0x389a
4:7F36  26c74702d67e         mov word ptr es:[bx + 2], 0x7ed6  ; SEGMENT s2:0000
4:7F3C  f6460a01             test byte ptr [bp + 0xa], 1
4:7F40  7409                 je 0x7f4b
4:7F42  66ff7606             push dword ptr [bp + 6]
4:7F46  9ace17017f           lcall 0x7f01, 0x17ce  ; operator_delete@s1:17CE
loc_7F4B:
4:7F4B  8b4606               mov ax, word ptr [bp + 6]
4:7F4E  8b5608               mov dx, word ptr [bp + 8]
4:7F51  c9                   leave
4:7F52  ca0600               retf 6
4:7F55  db 00

; ---------------- MovieView17::scalar_dtor@s4:7F56 FAR size=72 callers=0
;   mode 17 movie view deleting destructor
4:7F56  c81c0000             enter 0x1c, 0
4:7F5A  668b4606             mov eax, dword ptr [bp + 6]
4:7F5E  05d200               add ax, 0xd2
4:7F61  6650                 push eax
4:7F63  9ac457747f           lcall 0x7f74, 0x57c4  ; List::~List@s2:57C4
4:7F68  c45e06               les bx, ptr [bp + 6]
4:7F6B  26c7070a38           mov word ptr es:[bx], 0x380a
4:7F70  26c74702827f         mov word ptr es:[bx + 2], 0x7f82  ; SEGMENT s2:0000
4:7F76  c45e06               les bx, ptr [bp + 6]
4:7F79  26c7079a38           mov word ptr es:[bx], 0x389a
4:7F7E  26c747021e7f         mov word ptr es:[bx + 2], 0x7f1e  ; SEGMENT s2:0000
4:7F84  f6460a01             test byte ptr [bp + 0xa], 1
4:7F88  7409                 je 0x7f93
4:7F8A  66ff7606             push dword ptr [bp + 6]
4:7F8E  9ace17497f           lcall 0x7f49, 0x17ce  ; operator_delete@s1:17CE
loc_7F93:
4:7F93  8b4606               mov ax, word ptr [bp + 6]
4:7F96  8b5608               mov dx, word ptr [bp + 8]
4:7F99  c9                   leave
4:7F9A  ca0600               retf 6
4:7F9D  db 00

; ---------------- MovieView18::scalar_dtor@s4:7F9E FAR size=72 callers=0
;   mode 18 movie view deleting destructor
4:7F9E  c81c0000             enter 0x1c, 0
4:7FA2  668b4606             mov eax, dword ptr [bp + 6]
4:7FA6  05d200               add ax, 0xd2
4:7FA9  6650                 push eax
4:7FAB  9ac457bc7f           lcall 0x7fbc, 0x57c4  ; List::~List@s2:57C4
4:7FB0  c45e06               les bx, ptr [bp + 6]
4:7FB3  26c7070a38           mov word ptr es:[bx], 0x380a
4:7FB8  26c74702ca7f         mov word ptr es:[bx + 2], 0x7fca  ; SEGMENT s2:0000
4:7FBE  c45e06               les bx, ptr [bp + 6]
4:7FC1  26c7079a38           mov word ptr es:[bx], 0x389a
4:7FC6  26c74702667f         mov word ptr es:[bx + 2], 0x7f66  ; SEGMENT s2:0000
4:7FCC  f6460a01             test byte ptr [bp + 0xa], 1
4:7FD0  7409                 je 0x7fdb
4:7FD2  66ff7606             push dword ptr [bp + 6]
4:7FD6  9ace17917f           lcall 0x7f91, 0x17ce  ; operator_delete@s1:17CE
loc_7FDB:
4:7FDB  8b4606               mov ax, word ptr [bp + 6]
4:7FDE  8b5608               mov dx, word ptr [bp + 8]
4:7FE1  c9                   leave
4:7FE2  ca0600               retf 6
4:7FE5  db 00

; ---------------- MovieView19::scalar_dtor@s4:7FE6 FAR size=72 callers=0
;   mode 19 movie view deleting destructor
4:7FE6  c81c0000             enter 0x1c, 0
4:7FEA  668b4606             mov eax, dword ptr [bp + 6]
4:7FEE  05d200               add ax, 0xd2
4:7FF1  6650                 push eax
4:7FF3  9ac4570480           lcall 0x8004, 0x57c4  ; List::~List@s2:57C4
4:7FF8  c45e06               les bx, ptr [bp + 6]
4:7FFB  26c7070a38           mov word ptr es:[bx], 0x380a
4:8000  26c747021280         mov word ptr es:[bx + 2], 0x8012  ; SEGMENT s2:0000
4:8006  c45e06               les bx, ptr [bp + 6]
4:8009  26c7079a38           mov word ptr es:[bx], 0x389a
4:800E  26c74702ae7f         mov word ptr es:[bx + 2], 0x7fae  ; SEGMENT s2:0000
4:8014  f6460a01             test byte ptr [bp + 0xa], 1
4:8018  7409                 je 0x8023
4:801A  66ff7606             push dword ptr [bp + 6]
4:801E  9ace17d97f           lcall 0x7fd9, 0x17ce  ; operator_delete@s1:17CE
loc_8023:
4:8023  8b4606               mov ax, word ptr [bp + 6]
4:8026  8b5608               mov dx, word ptr [bp + 8]
4:8029  c9                   leave
4:802A  ca0600               retf 6
4:802D  db 00

; ---------------- MovieView20::scalar_dtor@s4:802E FAR size=72 callers=0
;   mode 20 movie view deleting destructor
4:802E  c81c0000             enter 0x1c, 0
4:8032  668b4606             mov eax, dword ptr [bp + 6]
4:8036  05d200               add ax, 0xd2
4:8039  6650                 push eax
4:803B  9ac4574c80           lcall 0x804c, 0x57c4  ; List::~List@s2:57C4
4:8040  c45e06               les bx, ptr [bp + 6]
4:8043  26c7070a38           mov word ptr es:[bx], 0x380a
4:8048  26c747025a80         mov word ptr es:[bx + 2], 0x805a  ; SEGMENT s2:0000
4:804E  c45e06               les bx, ptr [bp + 6]
4:8051  26c7079a38           mov word ptr es:[bx], 0x389a
4:8056  26c74702f67f         mov word ptr es:[bx + 2], 0x7ff6  ; SEGMENT s2:0000
4:805C  f6460a01             test byte ptr [bp + 0xa], 1
4:8060  7409                 je 0x806b
4:8062  66ff7606             push dword ptr [bp + 6]
4:8066  9ace172180           lcall 0x8021, 0x17ce  ; operator_delete@s1:17CE
loc_806B:
4:806B  8b4606               mov ax, word ptr [bp + 6]
4:806E  8b5608               mov dx, word ptr [bp + 8]
4:8071  c9                   leave
4:8072  ca0600               retf 6
4:8075  db 00

; ---------------- MovieView21::scalar_dtor@s4:8076 FAR size=72 callers=0
;   mode 21 movie view deleting destructor
4:8076  c81c0000             enter 0x1c, 0
4:807A  668b4606             mov eax, dword ptr [bp + 6]
4:807E  05d200               add ax, 0xd2
4:8081  6650                 push eax
4:8083  9ac4579480           lcall 0x8094, 0x57c4  ; List::~List@s2:57C4
4:8088  c45e06               les bx, ptr [bp + 6]
4:808B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8090  26c74702a280         mov word ptr es:[bx + 2], 0x80a2  ; SEGMENT s2:0000
4:8096  c45e06               les bx, ptr [bp + 6]
4:8099  26c7079a38           mov word ptr es:[bx], 0x389a
4:809E  26c747023e80         mov word ptr es:[bx + 2], 0x803e  ; SEGMENT s2:0000
4:80A4  f6460a01             test byte ptr [bp + 0xa], 1
4:80A8  7409                 je 0x80b3
4:80AA  66ff7606             push dword ptr [bp + 6]
4:80AE  9ace176980           lcall 0x8069, 0x17ce  ; operator_delete@s1:17CE
loc_80B3:
4:80B3  8b4606               mov ax, word ptr [bp + 6]
4:80B6  8b5608               mov dx, word ptr [bp + 8]
4:80B9  c9                   leave
4:80BA  ca0600               retf 6
4:80BD  db 00

; ---------------- MovieView22::scalar_dtor@s4:80BE FAR size=72 callers=0
;   mode 22 movie view deleting destructor
4:80BE  c81c0000             enter 0x1c, 0
4:80C2  668b4606             mov eax, dword ptr [bp + 6]
4:80C6  05d200               add ax, 0xd2
4:80C9  6650                 push eax
4:80CB  9ac457dc80           lcall 0x80dc, 0x57c4  ; List::~List@s2:57C4
4:80D0  c45e06               les bx, ptr [bp + 6]
4:80D3  26c7070a38           mov word ptr es:[bx], 0x380a
4:80D8  26c74702ea80         mov word ptr es:[bx + 2], 0x80ea  ; SEGMENT s2:0000
4:80DE  c45e06               les bx, ptr [bp + 6]
4:80E1  26c7079a38           mov word ptr es:[bx], 0x389a
4:80E6  26c747028680         mov word ptr es:[bx + 2], 0x8086  ; SEGMENT s2:0000
4:80EC  f6460a01             test byte ptr [bp + 0xa], 1
4:80F0  7409                 je 0x80fb
4:80F2  66ff7606             push dword ptr [bp + 6]
4:80F6  9ace17b180           lcall 0x80b1, 0x17ce  ; operator_delete@s1:17CE
loc_80FB:
4:80FB  8b4606               mov ax, word ptr [bp + 6]
4:80FE  8b5608               mov dx, word ptr [bp + 8]
4:8101  c9                   leave
4:8102  ca0600               retf 6
4:8105  db 00

; ---------------- MovieView23::scalar_dtor@s4:8106 FAR size=72 callers=0
;   mode 23 movie view deleting destructor
4:8106  c81c0000             enter 0x1c, 0
4:810A  668b4606             mov eax, dword ptr [bp + 6]
4:810E  05d200               add ax, 0xd2
4:8111  6650                 push eax
4:8113  9ac4572481           lcall 0x8124, 0x57c4  ; List::~List@s2:57C4
4:8118  c45e06               les bx, ptr [bp + 6]
4:811B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8120  26c747023281         mov word ptr es:[bx + 2], 0x8132  ; SEGMENT s2:0000
4:8126  c45e06               les bx, ptr [bp + 6]
4:8129  26c7079a38           mov word ptr es:[bx], 0x389a
4:812E  26c74702ce80         mov word ptr es:[bx + 2], 0x80ce  ; SEGMENT s2:0000
4:8134  f6460a01             test byte ptr [bp + 0xa], 1
4:8138  7409                 je 0x8143
4:813A  66ff7606             push dword ptr [bp + 6]
4:813E  9ace17f980           lcall 0x80f9, 0x17ce  ; operator_delete@s1:17CE
loc_8143:
4:8143  8b4606               mov ax, word ptr [bp + 6]
4:8146  8b5608               mov dx, word ptr [bp + 8]
4:8149  c9                   leave
4:814A  ca0600               retf 6
4:814D  db 00

; ---------------- MovieView24::scalar_dtor@s4:814E FAR size=72 callers=0
;   mode 24 movie view deleting destructor
4:814E  c81c0000             enter 0x1c, 0
4:8152  668b4606             mov eax, dword ptr [bp + 6]
4:8156  05d200               add ax, 0xd2
4:8159  6650                 push eax
4:815B  9ac4576c81           lcall 0x816c, 0x57c4  ; List::~List@s2:57C4
4:8160  c45e06               les bx, ptr [bp + 6]
4:8163  26c7070a38           mov word ptr es:[bx], 0x380a
4:8168  26c747027a81         mov word ptr es:[bx + 2], 0x817a  ; SEGMENT s2:0000
4:816E  c45e06               les bx, ptr [bp + 6]
4:8171  26c7079a38           mov word ptr es:[bx], 0x389a
4:8176  26c747021681         mov word ptr es:[bx + 2], 0x8116  ; SEGMENT s2:0000
4:817C  f6460a01             test byte ptr [bp + 0xa], 1
4:8180  7409                 je 0x818b
4:8182  66ff7606             push dword ptr [bp + 6]
4:8186  9ace174181           lcall 0x8141, 0x17ce  ; operator_delete@s1:17CE
loc_818B:
4:818B  8b4606               mov ax, word ptr [bp + 6]
4:818E  8b5608               mov dx, word ptr [bp + 8]
4:8191  c9                   leave
4:8192  ca0600               retf 6
4:8195  db 00

; ---------------- MovieView25::scalar_dtor@s4:8196 FAR size=72 callers=0
;   mode 25 movie view deleting destructor
4:8196  c81c0000             enter 0x1c, 0
4:819A  668b4606             mov eax, dword ptr [bp + 6]
4:819E  05d200               add ax, 0xd2
4:81A1  6650                 push eax
4:81A3  9ac457b481           lcall 0x81b4, 0x57c4  ; List::~List@s2:57C4
4:81A8  c45e06               les bx, ptr [bp + 6]
4:81AB  26c7070a38           mov word ptr es:[bx], 0x380a
4:81B0  26c74702c281         mov word ptr es:[bx + 2], 0x81c2  ; SEGMENT s2:0000
4:81B6  c45e06               les bx, ptr [bp + 6]
4:81B9  26c7079a38           mov word ptr es:[bx], 0x389a
4:81BE  26c747025e81         mov word ptr es:[bx + 2], 0x815e  ; SEGMENT s2:0000
4:81C4  f6460a01             test byte ptr [bp + 0xa], 1
4:81C8  7409                 je 0x81d3
4:81CA  66ff7606             push dword ptr [bp + 6]
4:81CE  9ace178981           lcall 0x8189, 0x17ce  ; operator_delete@s1:17CE
loc_81D3:
4:81D3  8b4606               mov ax, word ptr [bp + 6]
4:81D6  8b5608               mov dx, word ptr [bp + 8]
4:81D9  c9                   leave
4:81DA  ca0600               retf 6
4:81DD  db 00

; ---------------- MovieView26::scalar_dtor@s4:81DE FAR size=72 callers=0
;   mode 26 movie view deleting destructor
4:81DE  c81c0000             enter 0x1c, 0
4:81E2  668b4606             mov eax, dword ptr [bp + 6]
4:81E6  05d200               add ax, 0xd2
4:81E9  6650                 push eax
4:81EB  9ac457fc81           lcall 0x81fc, 0x57c4  ; List::~List@s2:57C4
4:81F0  c45e06               les bx, ptr [bp + 6]
4:81F3  26c7070a38           mov word ptr es:[bx], 0x380a
4:81F8  26c747020a82         mov word ptr es:[bx + 2], 0x820a  ; SEGMENT s2:0000
4:81FE  c45e06               les bx, ptr [bp + 6]
4:8201  26c7079a38           mov word ptr es:[bx], 0x389a
4:8206  26c74702a681         mov word ptr es:[bx + 2], 0x81a6  ; SEGMENT s2:0000
4:820C  f6460a01             test byte ptr [bp + 0xa], 1
4:8210  7409                 je 0x821b
4:8212  66ff7606             push dword ptr [bp + 6]
4:8216  9ace17d181           lcall 0x81d1, 0x17ce  ; operator_delete@s1:17CE
loc_821B:
4:821B  8b4606               mov ax, word ptr [bp + 6]
4:821E  8b5608               mov dx, word ptr [bp + 8]
4:8221  c9                   leave
4:8222  ca0600               retf 6
4:8225  db 00

; ---------------- MovieView27::scalar_dtor@s4:8226 FAR size=72 callers=0
;   mode 27 movie view deleting destructor
4:8226  c81c0000             enter 0x1c, 0
4:822A  668b4606             mov eax, dword ptr [bp + 6]
4:822E  05d200               add ax, 0xd2
4:8231  6650                 push eax
4:8233  9ac4574482           lcall 0x8244, 0x57c4  ; List::~List@s2:57C4
4:8238  c45e06               les bx, ptr [bp + 6]
4:823B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8240  26c747025282         mov word ptr es:[bx + 2], 0x8252  ; SEGMENT s2:0000
4:8246  c45e06               les bx, ptr [bp + 6]
4:8249  26c7079a38           mov word ptr es:[bx], 0x389a
4:824E  26c74702ee81         mov word ptr es:[bx + 2], 0x81ee  ; SEGMENT s2:0000
4:8254  f6460a01             test byte ptr [bp + 0xa], 1
4:8258  7409                 je 0x8263
4:825A  66ff7606             push dword ptr [bp + 6]
4:825E  9ace171982           lcall 0x8219, 0x17ce  ; operator_delete@s1:17CE
loc_8263:
4:8263  8b4606               mov ax, word ptr [bp + 6]
4:8266  8b5608               mov dx, word ptr [bp + 8]
4:8269  c9                   leave
4:826A  ca0600               retf 6
4:826D  db 00

; ---------------- MovieView28::scalar_dtor@s4:826E FAR size=72 callers=0
;   mode 28 movie view deleting destructor
4:826E  c81c0000             enter 0x1c, 0
4:8272  668b4606             mov eax, dword ptr [bp + 6]
4:8276  05d200               add ax, 0xd2
4:8279  6650                 push eax
4:827B  9ac4578c82           lcall 0x828c, 0x57c4  ; List::~List@s2:57C4
4:8280  c45e06               les bx, ptr [bp + 6]
4:8283  26c7070a38           mov word ptr es:[bx], 0x380a
4:8288  26c747029a82         mov word ptr es:[bx + 2], 0x829a  ; SEGMENT s2:0000
4:828E  c45e06               les bx, ptr [bp + 6]
4:8291  26c7079a38           mov word ptr es:[bx], 0x389a
4:8296  26c747023682         mov word ptr es:[bx + 2], 0x8236  ; SEGMENT s2:0000
4:829C  f6460a01             test byte ptr [bp + 0xa], 1
4:82A0  7409                 je 0x82ab
4:82A2  66ff7606             push dword ptr [bp + 6]
4:82A6  9ace176182           lcall 0x8261, 0x17ce  ; operator_delete@s1:17CE
loc_82AB:
4:82AB  8b4606               mov ax, word ptr [bp + 6]
4:82AE  8b5608               mov dx, word ptr [bp + 8]
4:82B1  c9                   leave
4:82B2  ca0600               retf 6
4:82B5  db 00

; ---------------- MovieView29::scalar_dtor@s4:82B6 FAR size=72 callers=0
;   mode 29 movie view deleting destructor
4:82B6  c81c0000             enter 0x1c, 0
4:82BA  668b4606             mov eax, dword ptr [bp + 6]
4:82BE  05d200               add ax, 0xd2
4:82C1  6650                 push eax
4:82C3  9ac457d482           lcall 0x82d4, 0x57c4  ; List::~List@s2:57C4
4:82C8  c45e06               les bx, ptr [bp + 6]
4:82CB  26c7070a38           mov word ptr es:[bx], 0x380a
4:82D0  26c74702e282         mov word ptr es:[bx + 2], 0x82e2  ; SEGMENT s2:0000
4:82D6  c45e06               les bx, ptr [bp + 6]
4:82D9  26c7079a38           mov word ptr es:[bx], 0x389a
4:82DE  26c747027e82         mov word ptr es:[bx + 2], 0x827e  ; SEGMENT s2:0000
4:82E4  f6460a01             test byte ptr [bp + 0xa], 1
4:82E8  7409                 je 0x82f3
4:82EA  66ff7606             push dword ptr [bp + 6]
4:82EE  9ace17a982           lcall 0x82a9, 0x17ce  ; operator_delete@s1:17CE
loc_82F3:
4:82F3  8b4606               mov ax, word ptr [bp + 6]
4:82F6  8b5608               mov dx, word ptr [bp + 8]
4:82F9  c9                   leave
4:82FA  ca0600               retf 6
4:82FD  db 00

; ---------------- MovieView30::scalar_dtor@s4:82FE FAR size=72 callers=0
;   mode 30 movie view deleting destructor
4:82FE  c81c0000             enter 0x1c, 0
4:8302  668b4606             mov eax, dword ptr [bp + 6]
4:8306  05d200               add ax, 0xd2
4:8309  6650                 push eax
4:830B  9ac4571c83           lcall 0x831c, 0x57c4  ; List::~List@s2:57C4
4:8310  c45e06               les bx, ptr [bp + 6]
4:8313  26c7070a38           mov word ptr es:[bx], 0x380a
4:8318  26c747022a83         mov word ptr es:[bx + 2], 0x832a  ; SEGMENT s2:0000
4:831E  c45e06               les bx, ptr [bp + 6]
4:8321  26c7079a38           mov word ptr es:[bx], 0x389a
4:8326  26c74702c682         mov word ptr es:[bx + 2], 0x82c6  ; SEGMENT s2:0000
4:832C  f6460a01             test byte ptr [bp + 0xa], 1
4:8330  7409                 je 0x833b
4:8332  66ff7606             push dword ptr [bp + 6]
4:8336  9ace17f182           lcall 0x82f1, 0x17ce  ; operator_delete@s1:17CE
loc_833B:
4:833B  8b4606               mov ax, word ptr [bp + 6]
4:833E  8b5608               mov dx, word ptr [bp + 8]
4:8341  c9                   leave
4:8342  ca0600               retf 6
4:8345  db 00

; ---------------- MovieView31::scalar_dtor@s4:8346 FAR size=72 callers=0
;   mode 31 movie view deleting destructor
4:8346  c81c0000             enter 0x1c, 0
4:834A  668b4606             mov eax, dword ptr [bp + 6]
4:834E  05d200               add ax, 0xd2
4:8351  6650                 push eax
4:8353  9ac4576483           lcall 0x8364, 0x57c4  ; List::~List@s2:57C4
4:8358  c45e06               les bx, ptr [bp + 6]
4:835B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8360  26c747027283         mov word ptr es:[bx + 2], 0x8372  ; SEGMENT s2:0000
4:8366  c45e06               les bx, ptr [bp + 6]
4:8369  26c7079a38           mov word ptr es:[bx], 0x389a
4:836E  26c747020e83         mov word ptr es:[bx + 2], 0x830e  ; SEGMENT s2:0000
4:8374  f6460a01             test byte ptr [bp + 0xa], 1
4:8378  7409                 je 0x8383
4:837A  66ff7606             push dword ptr [bp + 6]
4:837E  9ace173983           lcall 0x8339, 0x17ce  ; operator_delete@s1:17CE
loc_8383:
4:8383  8b4606               mov ax, word ptr [bp + 6]
4:8386  8b5608               mov dx, word ptr [bp + 8]
4:8389  c9                   leave
4:838A  ca0600               retf 6
4:838D  db 00

; ---------------- MovieView33::scalar_dtor@s4:838E FAR size=72 callers=0
;   mode 33 movie view deleting destructor
4:838E  c81c0000             enter 0x1c, 0
4:8392  668b4606             mov eax, dword ptr [bp + 6]
4:8396  05d200               add ax, 0xd2
4:8399  6650                 push eax
4:839B  9ac457ac83           lcall 0x83ac, 0x57c4  ; List::~List@s2:57C4
4:83A0  c45e06               les bx, ptr [bp + 6]
4:83A3  26c7070a38           mov word ptr es:[bx], 0x380a
4:83A8  26c74702ba83         mov word ptr es:[bx + 2], 0x83ba  ; SEGMENT s2:0000
4:83AE  c45e06               les bx, ptr [bp + 6]
4:83B1  26c7079a38           mov word ptr es:[bx], 0x389a
4:83B6  26c747025683         mov word ptr es:[bx + 2], 0x8356  ; SEGMENT s2:0000
4:83BC  f6460a01             test byte ptr [bp + 0xa], 1
4:83C0  7409                 je 0x83cb
4:83C2  66ff7606             push dword ptr [bp + 6]
4:83C6  9ace178183           lcall 0x8381, 0x17ce  ; operator_delete@s1:17CE
loc_83CB:
4:83CB  8b4606               mov ax, word ptr [bp + 6]
4:83CE  8b5608               mov dx, word ptr [bp + 8]
4:83D1  c9                   leave
4:83D2  ca0600               retf 6
4:83D5  db 00

; ---------------- MovieView35::scalar_dtor@s4:83D6 FAR size=72 callers=0
;   mode 35 movie view deleting destructor
4:83D6  c81c0000             enter 0x1c, 0
4:83DA  668b4606             mov eax, dword ptr [bp + 6]
4:83DE  05d200               add ax, 0xd2
4:83E1  6650                 push eax
4:83E3  9ac457f483           lcall 0x83f4, 0x57c4  ; List::~List@s2:57C4
4:83E8  c45e06               les bx, ptr [bp + 6]
4:83EB  26c7070a38           mov word ptr es:[bx], 0x380a
4:83F0  26c747020284         mov word ptr es:[bx + 2], 0x8402  ; SEGMENT s2:0000
4:83F6  c45e06               les bx, ptr [bp + 6]
4:83F9  26c7079a38           mov word ptr es:[bx], 0x389a
4:83FE  26c747029e83         mov word ptr es:[bx + 2], 0x839e  ; SEGMENT s2:0000
4:8404  f6460a01             test byte ptr [bp + 0xa], 1
4:8408  7409                 je 0x8413
4:840A  66ff7606             push dword ptr [bp + 6]
4:840E  9ace17c983           lcall 0x83c9, 0x17ce  ; operator_delete@s1:17CE
loc_8413:
4:8413  8b4606               mov ax, word ptr [bp + 6]
4:8416  8b5608               mov dx, word ptr [bp + 8]
4:8419  c9                   leave
4:841A  ca0600               retf 6
4:841D  db 00

; ---------------- MovieView36::scalar_dtor@s4:841E FAR size=72 callers=0
;   mode 36 movie view deleting destructor
4:841E  c81c0000             enter 0x1c, 0
4:8422  668b4606             mov eax, dword ptr [bp + 6]
4:8426  05d200               add ax, 0xd2
4:8429  6650                 push eax
4:842B  9ac4573c84           lcall 0x843c, 0x57c4  ; List::~List@s2:57C4
4:8430  c45e06               les bx, ptr [bp + 6]
4:8433  26c7070a38           mov word ptr es:[bx], 0x380a
4:8438  26c747024a84         mov word ptr es:[bx + 2], 0x844a  ; SEGMENT s2:0000
4:843E  c45e06               les bx, ptr [bp + 6]
4:8441  26c7079a38           mov word ptr es:[bx], 0x389a
4:8446  26c74702e683         mov word ptr es:[bx + 2], 0x83e6  ; SEGMENT s2:0000
4:844C  f6460a01             test byte ptr [bp + 0xa], 1
4:8450  7409                 je 0x845b
4:8452  66ff7606             push dword ptr [bp + 6]
4:8456  9ace171184           lcall 0x8411, 0x17ce  ; operator_delete@s1:17CE
loc_845B:
4:845B  8b4606               mov ax, word ptr [bp + 6]
4:845E  8b5608               mov dx, word ptr [bp + 8]
4:8461  c9                   leave
4:8462  ca0600               retf 6
4:8465  db 00

; ---------------- MovieView37::scalar_dtor@s4:8466 FAR size=72 callers=0
;   mode 37 movie view deleting destructor
4:8466  c81c0000             enter 0x1c, 0
4:846A  668b4606             mov eax, dword ptr [bp + 6]
4:846E  05d200               add ax, 0xd2
4:8471  6650                 push eax
4:8473  9ac4578484           lcall 0x8484, 0x57c4  ; List::~List@s2:57C4
4:8478  c45e06               les bx, ptr [bp + 6]
4:847B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8480  26c747029284         mov word ptr es:[bx + 2], 0x8492  ; SEGMENT s2:0000
4:8486  c45e06               les bx, ptr [bp + 6]
4:8489  26c7079a38           mov word ptr es:[bx], 0x389a
4:848E  26c747022e84         mov word ptr es:[bx + 2], 0x842e  ; SEGMENT s2:0000
4:8494  f6460a01             test byte ptr [bp + 0xa], 1
4:8498  7409                 je 0x84a3
4:849A  66ff7606             push dword ptr [bp + 6]
4:849E  9ace175984           lcall 0x8459, 0x17ce  ; operator_delete@s1:17CE
loc_84A3:
4:84A3  8b4606               mov ax, word ptr [bp + 6]
4:84A6  8b5608               mov dx, word ptr [bp + 8]
4:84A9  c9                   leave
4:84AA  ca0600               retf 6
4:84AD  db 00

; ---------------- MovieView99::scalar_dtor@s4:84AE FAR size=72 callers=0
;   mode 99 movie view deleting destructor
4:84AE  c81c0000             enter 0x1c, 0
4:84B2  668b4606             mov eax, dword ptr [bp + 6]
4:84B6  05d200               add ax, 0xd2
4:84B9  6650                 push eax
4:84BB  9ac457cc84           lcall 0x84cc, 0x57c4  ; List::~List@s2:57C4
4:84C0  c45e06               les bx, ptr [bp + 6]
4:84C3  26c7070a38           mov word ptr es:[bx], 0x380a
4:84C8  26c74702da84         mov word ptr es:[bx + 2], 0x84da  ; SEGMENT s2:0000
4:84CE  c45e06               les bx, ptr [bp + 6]
4:84D1  26c7079a38           mov word ptr es:[bx], 0x389a
4:84D6  26c747027684         mov word ptr es:[bx + 2], 0x8476  ; SEGMENT s2:0000
4:84DC  f6460a01             test byte ptr [bp + 0xa], 1
4:84E0  7409                 je 0x84eb
4:84E2  66ff7606             push dword ptr [bp + 6]
4:84E6  9ace17a184           lcall 0x84a1, 0x17ce  ; operator_delete@s1:17CE
loc_84EB:
4:84EB  8b4606               mov ax, word ptr [bp + 6]
4:84EE  8b5608               mov dx, word ptr [bp + 8]
4:84F1  c9                   leave
4:84F2  ca0600               retf 6
4:84F5  db 00

; ---------------- MovieView100::scalar_dtor@s4:84F6 FAR size=72 callers=0
;   mode 100 movie view deleting destructor
4:84F6  c81c0000             enter 0x1c, 0
4:84FA  668b4606             mov eax, dword ptr [bp + 6]
4:84FE  05d200               add ax, 0xd2
4:8501  6650                 push eax
4:8503  9ac4571485           lcall 0x8514, 0x57c4  ; List::~List@s2:57C4
4:8508  c45e06               les bx, ptr [bp + 6]
4:850B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8510  26c747022285         mov word ptr es:[bx + 2], 0x8522  ; SEGMENT s2:0000
4:8516  c45e06               les bx, ptr [bp + 6]
4:8519  26c7079a38           mov word ptr es:[bx], 0x389a
4:851E  26c74702be84         mov word ptr es:[bx + 2], 0x84be  ; SEGMENT s2:0000
4:8524  f6460a01             test byte ptr [bp + 0xa], 1
4:8528  7409                 je 0x8533
4:852A  66ff7606             push dword ptr [bp + 6]
4:852E  9ace17e984           lcall 0x84e9, 0x17ce  ; operator_delete@s1:17CE
loc_8533:
4:8533  8b4606               mov ax, word ptr [bp + 6]
4:8536  8b5608               mov dx, word ptr [bp + 8]
4:8539  c9                   leave
4:853A  ca0600               retf 6
4:853D  db 00

; ---------------- MovieView101::scalar_dtor@s4:853E FAR size=72 callers=0
;   mode 101 movie view deleting destructor
4:853E  c81c0000             enter 0x1c, 0
4:8542  668b4606             mov eax, dword ptr [bp + 6]
4:8546  05d200               add ax, 0xd2
4:8549  6650                 push eax
4:854B  9ac4575c85           lcall 0x855c, 0x57c4  ; List::~List@s2:57C4
4:8550  c45e06               les bx, ptr [bp + 6]
4:8553  26c7070a38           mov word ptr es:[bx], 0x380a
4:8558  26c747026a85         mov word ptr es:[bx + 2], 0x856a  ; SEGMENT s2:0000
4:855E  c45e06               les bx, ptr [bp + 6]
4:8561  26c7079a38           mov word ptr es:[bx], 0x389a
4:8566  26c747020685         mov word ptr es:[bx + 2], 0x8506  ; SEGMENT s2:0000
4:856C  f6460a01             test byte ptr [bp + 0xa], 1
4:8570  7409                 je 0x857b
4:8572  66ff7606             push dword ptr [bp + 6]
4:8576  9ace173185           lcall 0x8531, 0x17ce  ; operator_delete@s1:17CE
loc_857B:
4:857B  8b4606               mov ax, word ptr [bp + 6]
4:857E  8b5608               mov dx, word ptr [bp + 8]
4:8581  c9                   leave
4:8582  ca0600               retf 6
4:8585  db 00

; ---------------- MovieView102::scalar_dtor@s4:8586 FAR size=72 callers=0
;   mode 102 movie view deleting destructor
4:8586  c81c0000             enter 0x1c, 0
4:858A  668b4606             mov eax, dword ptr [bp + 6]
4:858E  05d200               add ax, 0xd2
4:8591  6650                 push eax
4:8593  9ac457a485           lcall 0x85a4, 0x57c4  ; List::~List@s2:57C4
4:8598  c45e06               les bx, ptr [bp + 6]
4:859B  26c7070a38           mov word ptr es:[bx], 0x380a
4:85A0  26c74702b285         mov word ptr es:[bx + 2], 0x85b2  ; SEGMENT s2:0000
4:85A6  c45e06               les bx, ptr [bp + 6]
4:85A9  26c7079a38           mov word ptr es:[bx], 0x389a
4:85AE  26c747024e85         mov word ptr es:[bx + 2], 0x854e  ; SEGMENT s2:0000
4:85B4  f6460a01             test byte ptr [bp + 0xa], 1
4:85B8  7409                 je 0x85c3
4:85BA  66ff7606             push dword ptr [bp + 6]
4:85BE  9ace177985           lcall 0x8579, 0x17ce  ; operator_delete@s1:17CE
loc_85C3:
4:85C3  8b4606               mov ax, word ptr [bp + 6]
4:85C6  8b5608               mov dx, word ptr [bp + 8]
4:85C9  c9                   leave
4:85CA  ca0600               retf 6
4:85CD  db 00

; ---------------- MovieView103::scalar_dtor@s4:85CE FAR size=72 callers=0
;   mode 103 movie view deleting destructor
4:85CE  c81c0000             enter 0x1c, 0
4:85D2  668b4606             mov eax, dword ptr [bp + 6]
4:85D6  05d200               add ax, 0xd2
4:85D9  6650                 push eax
4:85DB  9ac457ec85           lcall 0x85ec, 0x57c4  ; List::~List@s2:57C4
4:85E0  c45e06               les bx, ptr [bp + 6]
4:85E3  26c7070a38           mov word ptr es:[bx], 0x380a
4:85E8  26c74702fa85         mov word ptr es:[bx + 2], 0x85fa  ; SEGMENT s2:0000
4:85EE  c45e06               les bx, ptr [bp + 6]
4:85F1  26c7079a38           mov word ptr es:[bx], 0x389a
4:85F6  26c747029685         mov word ptr es:[bx + 2], 0x8596  ; SEGMENT s2:0000
4:85FC  f6460a01             test byte ptr [bp + 0xa], 1
4:8600  7409                 je 0x860b
4:8602  66ff7606             push dword ptr [bp + 6]
4:8606  9ace17c185           lcall 0x85c1, 0x17ce  ; operator_delete@s1:17CE
loc_860B:
4:860B  8b4606               mov ax, word ptr [bp + 6]
4:860E  8b5608               mov dx, word ptr [bp + 8]
4:8611  c9                   leave
4:8612  ca0600               retf 6
4:8615  db 00

; ---------------- MovieView104::scalar_dtor@s4:8616 FAR size=72 callers=0
;   mode 104 movie view deleting destructor
4:8616  c81c0000             enter 0x1c, 0
4:861A  668b4606             mov eax, dword ptr [bp + 6]
4:861E  05d200               add ax, 0xd2
4:8621  6650                 push eax
4:8623  9ac4573486           lcall 0x8634, 0x57c4  ; List::~List@s2:57C4
4:8628  c45e06               les bx, ptr [bp + 6]
4:862B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8630  26c747024286         mov word ptr es:[bx + 2], 0x8642  ; SEGMENT s2:0000
4:8636  c45e06               les bx, ptr [bp + 6]
4:8639  26c7079a38           mov word ptr es:[bx], 0x389a
4:863E  26c74702de85         mov word ptr es:[bx + 2], 0x85de  ; SEGMENT s2:0000
4:8644  f6460a01             test byte ptr [bp + 0xa], 1
4:8648  7409                 je 0x8653
4:864A  66ff7606             push dword ptr [bp + 6]
4:864E  9ace170986           lcall 0x8609, 0x17ce  ; operator_delete@s1:17CE
loc_8653:
4:8653  8b4606               mov ax, word ptr [bp + 6]
4:8656  8b5608               mov dx, word ptr [bp + 8]
4:8659  c9                   leave
4:865A  ca0600               retf 6
4:865D  db 00

; ---------------- MovieView105::scalar_dtor@s4:865E FAR size=72 callers=0
;   mode 105 movie view deleting destructor
4:865E  c81c0000             enter 0x1c, 0
4:8662  668b4606             mov eax, dword ptr [bp + 6]
4:8666  05d200               add ax, 0xd2
4:8669  6650                 push eax
4:866B  9ac4577c86           lcall 0x867c, 0x57c4  ; List::~List@s2:57C4
4:8670  c45e06               les bx, ptr [bp + 6]
4:8673  26c7070a38           mov word ptr es:[bx], 0x380a
4:8678  26c747028a86         mov word ptr es:[bx + 2], 0x868a  ; SEGMENT s2:0000
4:867E  c45e06               les bx, ptr [bp + 6]
4:8681  26c7079a38           mov word ptr es:[bx], 0x389a
4:8686  26c747022686         mov word ptr es:[bx + 2], 0x8626  ; SEGMENT s2:0000
4:868C  f6460a01             test byte ptr [bp + 0xa], 1
4:8690  7409                 je 0x869b
4:8692  66ff7606             push dword ptr [bp + 6]
4:8696  9ace175186           lcall 0x8651, 0x17ce  ; operator_delete@s1:17CE
loc_869B:
4:869B  8b4606               mov ax, word ptr [bp + 6]
4:869E  8b5608               mov dx, word ptr [bp + 8]
4:86A1  c9                   leave
4:86A2  ca0600               retf 6
4:86A5  db 00

; ---------------- MovieView53::scalar_dtor@s4:86A6 FAR size=72 callers=0
;   mode 53 movie view deleting destructor
4:86A6  c81c0000             enter 0x1c, 0
4:86AA  668b4606             mov eax, dword ptr [bp + 6]
4:86AE  05d200               add ax, 0xd2
4:86B1  6650                 push eax
4:86B3  9ac457c486           lcall 0x86c4, 0x57c4  ; List::~List@s2:57C4
4:86B8  c45e06               les bx, ptr [bp + 6]
4:86BB  26c7070a38           mov word ptr es:[bx], 0x380a
4:86C0  26c74702d286         mov word ptr es:[bx + 2], 0x86d2  ; SEGMENT s2:0000
4:86C6  c45e06               les bx, ptr [bp + 6]
4:86C9  26c7079a38           mov word ptr es:[bx], 0x389a
4:86CE  26c747026e86         mov word ptr es:[bx + 2], 0x866e  ; SEGMENT s2:0000
4:86D4  f6460a01             test byte ptr [bp + 0xa], 1
4:86D8  7409                 je 0x86e3
4:86DA  66ff7606             push dword ptr [bp + 6]
4:86DE  9ace179986           lcall 0x8699, 0x17ce  ; operator_delete@s1:17CE
loc_86E3:
4:86E3  8b4606               mov ax, word ptr [bp + 6]
4:86E6  8b5608               mov dx, word ptr [bp + 8]
4:86E9  c9                   leave
4:86EA  ca0600               retf 6
4:86ED  db 00

; ---------------- MovieView57::scalar_dtor@s4:86EE FAR size=72 callers=0
;   mode 57 movie view deleting destructor
4:86EE  c81c0000             enter 0x1c, 0
4:86F2  668b4606             mov eax, dword ptr [bp + 6]
4:86F6  05d200               add ax, 0xd2
4:86F9  6650                 push eax
4:86FB  9ac4570c87           lcall 0x870c, 0x57c4  ; List::~List@s2:57C4
4:8700  c45e06               les bx, ptr [bp + 6]
4:8703  26c7070a38           mov word ptr es:[bx], 0x380a
4:8708  26c747021a87         mov word ptr es:[bx + 2], 0x871a  ; SEGMENT s2:0000
4:870E  c45e06               les bx, ptr [bp + 6]
4:8711  26c7079a38           mov word ptr es:[bx], 0x389a
4:8716  26c74702b686         mov word ptr es:[bx + 2], 0x86b6  ; SEGMENT s2:0000
4:871C  f6460a01             test byte ptr [bp + 0xa], 1
4:8720  7409                 je 0x872b
4:8722  66ff7606             push dword ptr [bp + 6]
4:8726  9ace17e186           lcall 0x86e1, 0x17ce  ; operator_delete@s1:17CE
loc_872B:
4:872B  8b4606               mov ax, word ptr [bp + 6]
4:872E  8b5608               mov dx, word ptr [bp + 8]
4:8731  c9                   leave
4:8732  ca0600               retf 6
4:8735  db 00

; ---------------- MovieView34::scalar_dtor@s4:8736 FAR size=72 callers=0
;   mode 34 movie view deleting destructor
4:8736  c81c0000             enter 0x1c, 0
4:873A  668b4606             mov eax, dword ptr [bp + 6]
4:873E  05d200               add ax, 0xd2
4:8741  6650                 push eax
4:8743  9ac4575487           lcall 0x8754, 0x57c4  ; List::~List@s2:57C4
4:8748  c45e06               les bx, ptr [bp + 6]
4:874B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8750  26c747026287         mov word ptr es:[bx + 2], 0x8762  ; SEGMENT s2:0000
4:8756  c45e06               les bx, ptr [bp + 6]
4:8759  26c7079a38           mov word ptr es:[bx], 0x389a
4:875E  26c74702fe86         mov word ptr es:[bx + 2], 0x86fe  ; SEGMENT s2:0000
4:8764  f6460a01             test byte ptr [bp + 0xa], 1
4:8768  7409                 je 0x8773
4:876A  66ff7606             push dword ptr [bp + 6]
4:876E  9ace172987           lcall 0x8729, 0x17ce  ; operator_delete@s1:17CE
loc_8773:
4:8773  8b4606               mov ax, word ptr [bp + 6]
4:8776  8b5608               mov dx, word ptr [bp + 8]
4:8779  c9                   leave
4:877A  ca0600               retf 6
4:877D  db 00

; ---------------- MovieView54::scalar_dtor@s4:877E FAR size=72 callers=0
;   mode 54 movie view deleting destructor
4:877E  c81c0000             enter 0x1c, 0
4:8782  668b4606             mov eax, dword ptr [bp + 6]
4:8786  05d200               add ax, 0xd2
4:8789  6650                 push eax
4:878B  9ac4579c87           lcall 0x879c, 0x57c4  ; List::~List@s2:57C4
4:8790  c45e06               les bx, ptr [bp + 6]
4:8793  26c7070a38           mov word ptr es:[bx], 0x380a
4:8798  26c74702aa87         mov word ptr es:[bx + 2], 0x87aa  ; SEGMENT s2:0000
4:879E  c45e06               les bx, ptr [bp + 6]
4:87A1  26c7079a38           mov word ptr es:[bx], 0x389a
4:87A6  26c747024687         mov word ptr es:[bx + 2], 0x8746  ; SEGMENT s2:0000
4:87AC  f6460a01             test byte ptr [bp + 0xa], 1
4:87B0  7409                 je 0x87bb
4:87B2  66ff7606             push dword ptr [bp + 6]
4:87B6  9ace177187           lcall 0x8771, 0x17ce  ; operator_delete@s1:17CE
loc_87BB:
4:87BB  8b4606               mov ax, word ptr [bp + 6]
4:87BE  8b5608               mov dx, word ptr [bp + 8]
4:87C1  c9                   leave
4:87C2  ca0600               retf 6
4:87C5  db 00

; ---------------- MovieView55::scalar_dtor@s4:87C6 FAR size=72 callers=0
;   mode 55 movie view deleting destructor
4:87C6  c81c0000             enter 0x1c, 0
4:87CA  668b4606             mov eax, dword ptr [bp + 6]
4:87CE  05d200               add ax, 0xd2
4:87D1  6650                 push eax
4:87D3  9ac457e487           lcall 0x87e4, 0x57c4  ; List::~List@s2:57C4
4:87D8  c45e06               les bx, ptr [bp + 6]
4:87DB  26c7070a38           mov word ptr es:[bx], 0x380a
4:87E0  26c74702f287         mov word ptr es:[bx + 2], 0x87f2  ; SEGMENT s2:0000
4:87E6  c45e06               les bx, ptr [bp + 6]
4:87E9  26c7079a38           mov word ptr es:[bx], 0x389a
4:87EE  26c747028e87         mov word ptr es:[bx + 2], 0x878e  ; SEGMENT s2:0000
4:87F4  f6460a01             test byte ptr [bp + 0xa], 1
4:87F8  7409                 je 0x8803
4:87FA  66ff7606             push dword ptr [bp + 6]
4:87FE  9ace17b987           lcall 0x87b9, 0x17ce  ; operator_delete@s1:17CE
loc_8803:
4:8803  8b4606               mov ax, word ptr [bp + 6]
4:8806  8b5608               mov dx, word ptr [bp + 8]
4:8809  c9                   leave
4:880A  ca0600               retf 6
4:880D  db 00

; ---------------- MovieView56::scalar_dtor@s4:880E FAR size=72 callers=0
;   mode 56 movie view deleting destructor
4:880E  c81c0000             enter 0x1c, 0
4:8812  668b4606             mov eax, dword ptr [bp + 6]
4:8816  05d200               add ax, 0xd2
4:8819  6650                 push eax
4:881B  9ac4572c88           lcall 0x882c, 0x57c4  ; List::~List@s2:57C4
4:8820  c45e06               les bx, ptr [bp + 6]
4:8823  26c7070a38           mov word ptr es:[bx], 0x380a
4:8828  26c747023a88         mov word ptr es:[bx + 2], 0x883a  ; SEGMENT s2:0000
4:882E  c45e06               les bx, ptr [bp + 6]
4:8831  26c7079a38           mov word ptr es:[bx], 0x389a
4:8836  26c74702d687         mov word ptr es:[bx + 2], 0x87d6  ; SEGMENT s2:0000
4:883C  f6460a01             test byte ptr [bp + 0xa], 1
4:8840  7409                 je 0x884b
4:8842  66ff7606             push dword ptr [bp + 6]
4:8846  9ace170188           lcall 0x8801, 0x17ce  ; operator_delete@s1:17CE
loc_884B:
4:884B  8b4606               mov ax, word ptr [bp + 6]
4:884E  8b5608               mov dx, word ptr [bp + 8]
4:8851  c9                   leave
4:8852  ca0600               retf 6
4:8855  db 00

; ---------------- MovieView58::scalar_dtor@s4:8856 FAR size=72 callers=0
;   mode 58 movie view deleting destructor
4:8856  c81c0000             enter 0x1c, 0
4:885A  668b4606             mov eax, dword ptr [bp + 6]
4:885E  05d200               add ax, 0xd2
4:8861  6650                 push eax
4:8863  9ac4577488           lcall 0x8874, 0x57c4  ; List::~List@s2:57C4
4:8868  c45e06               les bx, ptr [bp + 6]
4:886B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8870  26c747028288         mov word ptr es:[bx + 2], 0x8882  ; SEGMENT s2:0000
4:8876  c45e06               les bx, ptr [bp + 6]
4:8879  26c7079a38           mov word ptr es:[bx], 0x389a
4:887E  26c747021e88         mov word ptr es:[bx + 2], 0x881e  ; SEGMENT s2:0000
4:8884  f6460a01             test byte ptr [bp + 0xa], 1
4:8888  7409                 je 0x8893
4:888A  66ff7606             push dword ptr [bp + 6]
4:888E  9ace174988           lcall 0x8849, 0x17ce  ; operator_delete@s1:17CE
loc_8893:
4:8893  8b4606               mov ax, word ptr [bp + 6]
4:8896  8b5608               mov dx, word ptr [bp + 8]
4:8899  c9                   leave
4:889A  ca0600               retf 6
4:889D  db 00

; ---------------- MovieView59::scalar_dtor@s4:889E FAR size=72 callers=0
;   mode 59 movie view deleting destructor
4:889E  c81c0000             enter 0x1c, 0
4:88A2  668b4606             mov eax, dword ptr [bp + 6]
4:88A6  05d200               add ax, 0xd2
4:88A9  6650                 push eax
4:88AB  9ac457bc88           lcall 0x88bc, 0x57c4  ; List::~List@s2:57C4
4:88B0  c45e06               les bx, ptr [bp + 6]
4:88B3  26c7070a38           mov word ptr es:[bx], 0x380a
4:88B8  26c74702ca88         mov word ptr es:[bx + 2], 0x88ca  ; SEGMENT s2:0000
4:88BE  c45e06               les bx, ptr [bp + 6]
4:88C1  26c7079a38           mov word ptr es:[bx], 0x389a
4:88C6  26c747026688         mov word ptr es:[bx + 2], 0x8866  ; SEGMENT s2:0000
4:88CC  f6460a01             test byte ptr [bp + 0xa], 1
4:88D0  7409                 je 0x88db
4:88D2  66ff7606             push dword ptr [bp + 6]
4:88D6  9ace179188           lcall 0x8891, 0x17ce  ; operator_delete@s1:17CE
loc_88DB:
4:88DB  8b4606               mov ax, word ptr [bp + 6]
4:88DE  8b5608               mov dx, word ptr [bp + 8]
4:88E1  c9                   leave
4:88E2  ca0600               retf 6
4:88E5  db 00

; ---------------- MovieView60::scalar_dtor@s4:88E6 FAR size=72 callers=0
;   mode 60 movie view deleting destructor
4:88E6  c81c0000             enter 0x1c, 0
4:88EA  668b4606             mov eax, dword ptr [bp + 6]
4:88EE  05d200               add ax, 0xd2
4:88F1  6650                 push eax
4:88F3  9ac4570489           lcall 0x8904, 0x57c4  ; List::~List@s2:57C4
4:88F8  c45e06               les bx, ptr [bp + 6]
4:88FB  26c7070a38           mov word ptr es:[bx], 0x380a
4:8900  26c747021289         mov word ptr es:[bx + 2], 0x8912  ; SEGMENT s2:0000
4:8906  c45e06               les bx, ptr [bp + 6]
4:8909  26c7079a38           mov word ptr es:[bx], 0x389a
4:890E  26c74702ae88         mov word ptr es:[bx + 2], 0x88ae  ; SEGMENT s2:0000
4:8914  f6460a01             test byte ptr [bp + 0xa], 1
4:8918  7409                 je 0x8923
4:891A  66ff7606             push dword ptr [bp + 6]
4:891E  9ace17d988           lcall 0x88d9, 0x17ce  ; operator_delete@s1:17CE
loc_8923:
4:8923  8b4606               mov ax, word ptr [bp + 6]
4:8926  8b5608               mov dx, word ptr [bp + 8]
4:8929  c9                   leave
4:892A  ca0600               retf 6
4:892D  db 00

; ---------------- MovieView61::scalar_dtor@s4:892E FAR size=72 callers=0
;   mode 61 movie view deleting destructor
4:892E  c81c0000             enter 0x1c, 0
4:8932  668b4606             mov eax, dword ptr [bp + 6]
4:8936  05d200               add ax, 0xd2
4:8939  6650                 push eax
4:893B  9ac4574c89           lcall 0x894c, 0x57c4  ; List::~List@s2:57C4
4:8940  c45e06               les bx, ptr [bp + 6]
4:8943  26c7070a38           mov word ptr es:[bx], 0x380a
4:8948  26c747025a89         mov word ptr es:[bx + 2], 0x895a  ; SEGMENT s2:0000
4:894E  c45e06               les bx, ptr [bp + 6]
4:8951  26c7079a38           mov word ptr es:[bx], 0x389a
4:8956  26c74702f688         mov word ptr es:[bx + 2], 0x88f6  ; SEGMENT s2:0000
4:895C  f6460a01             test byte ptr [bp + 0xa], 1
4:8960  7409                 je 0x896b
4:8962  66ff7606             push dword ptr [bp + 6]
4:8966  9ace172189           lcall 0x8921, 0x17ce  ; operator_delete@s1:17CE
loc_896B:
4:896B  8b4606               mov ax, word ptr [bp + 6]
4:896E  8b5608               mov dx, word ptr [bp + 8]
4:8971  c9                   leave
4:8972  ca0600               retf 6
4:8975  db 00

; ---------------- MovieView62::scalar_dtor@s4:8976 FAR size=72 callers=0
;   mode 62 movie view deleting destructor
4:8976  c81c0000             enter 0x1c, 0
4:897A  668b4606             mov eax, dword ptr [bp + 6]
4:897E  05d200               add ax, 0xd2
4:8981  6650                 push eax
4:8983  9ac4579489           lcall 0x8994, 0x57c4  ; List::~List@s2:57C4
4:8988  c45e06               les bx, ptr [bp + 6]
4:898B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8990  26c74702a289         mov word ptr es:[bx + 2], 0x89a2  ; SEGMENT s2:0000
4:8996  c45e06               les bx, ptr [bp + 6]
4:8999  26c7079a38           mov word ptr es:[bx], 0x389a
4:899E  26c747023e89         mov word ptr es:[bx + 2], 0x893e  ; SEGMENT s2:0000
4:89A4  f6460a01             test byte ptr [bp + 0xa], 1
4:89A8  7409                 je 0x89b3
4:89AA  66ff7606             push dword ptr [bp + 6]
4:89AE  9ace176989           lcall 0x8969, 0x17ce  ; operator_delete@s1:17CE
loc_89B3:
4:89B3  8b4606               mov ax, word ptr [bp + 6]
4:89B6  8b5608               mov dx, word ptr [bp + 8]
4:89B9  c9                   leave
4:89BA  ca0600               retf 6
4:89BD  db 00

; ---------------- MovieView63::scalar_dtor@s4:89BE FAR size=72 callers=0
;   mode 63 movie view deleting destructor
4:89BE  c81c0000             enter 0x1c, 0
4:89C2  668b4606             mov eax, dword ptr [bp + 6]
4:89C6  05d200               add ax, 0xd2
4:89C9  6650                 push eax
4:89CB  9ac457dc89           lcall 0x89dc, 0x57c4  ; List::~List@s2:57C4
4:89D0  c45e06               les bx, ptr [bp + 6]
4:89D3  26c7070a38           mov word ptr es:[bx], 0x380a
4:89D8  26c74702ea89         mov word ptr es:[bx + 2], 0x89ea  ; SEGMENT s2:0000
4:89DE  c45e06               les bx, ptr [bp + 6]
4:89E1  26c7079a38           mov word ptr es:[bx], 0x389a
4:89E6  26c747028689         mov word ptr es:[bx + 2], 0x8986  ; SEGMENT s2:0000
4:89EC  f6460a01             test byte ptr [bp + 0xa], 1
4:89F0  7409                 je 0x89fb
4:89F2  66ff7606             push dword ptr [bp + 6]
4:89F6  9ace17b189           lcall 0x89b1, 0x17ce  ; operator_delete@s1:17CE
loc_89FB:
4:89FB  8b4606               mov ax, word ptr [bp + 6]
4:89FE  8b5608               mov dx, word ptr [bp + 8]
4:8A01  c9                   leave
4:8A02  ca0600               retf 6
4:8A05  db 00

; ---------------- MovieView64::scalar_dtor@s4:8A06 FAR size=72 callers=0
;   mode 64 movie view deleting destructor
4:8A06  c81c0000             enter 0x1c, 0
4:8A0A  668b4606             mov eax, dword ptr [bp + 6]
4:8A0E  05d200               add ax, 0xd2
4:8A11  6650                 push eax
4:8A13  9ac457248a           lcall 0x8a24, 0x57c4  ; List::~List@s2:57C4
4:8A18  c45e06               les bx, ptr [bp + 6]
4:8A1B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8A20  26c74702328a         mov word ptr es:[bx + 2], 0x8a32  ; SEGMENT s2:0000
4:8A26  c45e06               les bx, ptr [bp + 6]
4:8A29  26c7079a38           mov word ptr es:[bx], 0x389a
4:8A2E  26c74702ce89         mov word ptr es:[bx + 2], 0x89ce  ; SEGMENT s2:0000
4:8A34  f6460a01             test byte ptr [bp + 0xa], 1
4:8A38  7409                 je 0x8a43
4:8A3A  66ff7606             push dword ptr [bp + 6]
4:8A3E  9ace17f989           lcall 0x89f9, 0x17ce  ; operator_delete@s1:17CE
loc_8A43:
4:8A43  8b4606               mov ax, word ptr [bp + 6]
4:8A46  8b5608               mov dx, word ptr [bp + 8]
4:8A49  c9                   leave
4:8A4A  ca0600               retf 6
4:8A4D  db 00

; ---------------- MovieView65::scalar_dtor@s4:8A4E FAR size=72 callers=0
;   mode 65 movie view deleting destructor
4:8A4E  c81c0000             enter 0x1c, 0
4:8A52  668b4606             mov eax, dword ptr [bp + 6]
4:8A56  05d200               add ax, 0xd2
4:8A59  6650                 push eax
4:8A5B  9ac4576c8a           lcall 0x8a6c, 0x57c4  ; List::~List@s2:57C4
4:8A60  c45e06               les bx, ptr [bp + 6]
4:8A63  26c7070a38           mov word ptr es:[bx], 0x380a
4:8A68  26c747027a8a         mov word ptr es:[bx + 2], 0x8a7a  ; SEGMENT s2:0000
4:8A6E  c45e06               les bx, ptr [bp + 6]
4:8A71  26c7079a38           mov word ptr es:[bx], 0x389a
4:8A76  26c74702168a         mov word ptr es:[bx + 2], 0x8a16  ; SEGMENT s2:0000
4:8A7C  f6460a01             test byte ptr [bp + 0xa], 1
4:8A80  7409                 je 0x8a8b
4:8A82  66ff7606             push dword ptr [bp + 6]
4:8A86  9ace17418a           lcall 0x8a41, 0x17ce  ; operator_delete@s1:17CE
loc_8A8B:
4:8A8B  8b4606               mov ax, word ptr [bp + 6]
4:8A8E  8b5608               mov dx, word ptr [bp + 8]
4:8A91  c9                   leave
4:8A92  ca0600               retf 6
4:8A95  db 00

; ---------------- MovieView66::scalar_dtor@s4:8A96 FAR size=72 callers=0
;   mode 66 movie view deleting destructor
4:8A96  c81c0000             enter 0x1c, 0
4:8A9A  668b4606             mov eax, dword ptr [bp + 6]
4:8A9E  05d200               add ax, 0xd2
4:8AA1  6650                 push eax
4:8AA3  9ac457b48a           lcall 0x8ab4, 0x57c4  ; List::~List@s2:57C4
4:8AA8  c45e06               les bx, ptr [bp + 6]
4:8AAB  26c7070a38           mov word ptr es:[bx], 0x380a
4:8AB0  26c74702c28a         mov word ptr es:[bx + 2], 0x8ac2  ; SEGMENT s2:0000
4:8AB6  c45e06               les bx, ptr [bp + 6]
4:8AB9  26c7079a38           mov word ptr es:[bx], 0x389a
4:8ABE  26c747025e8a         mov word ptr es:[bx + 2], 0x8a5e  ; SEGMENT s2:0000
4:8AC4  f6460a01             test byte ptr [bp + 0xa], 1
4:8AC8  7409                 je 0x8ad3
4:8ACA  66ff7606             push dword ptr [bp + 6]
4:8ACE  9ace17898a           lcall 0x8a89, 0x17ce  ; operator_delete@s1:17CE
loc_8AD3:
4:8AD3  8b4606               mov ax, word ptr [bp + 6]
4:8AD6  8b5608               mov dx, word ptr [bp + 8]
4:8AD9  c9                   leave
4:8ADA  ca0600               retf 6
4:8ADD  db 00

; ---------------- MovieView67::scalar_dtor@s4:8ADE FAR size=72 callers=0
;   mode 67 movie view deleting destructor
4:8ADE  c81c0000             enter 0x1c, 0
4:8AE2  668b4606             mov eax, dword ptr [bp + 6]
4:8AE6  05d200               add ax, 0xd2
4:8AE9  6650                 push eax
4:8AEB  9ac457fc8a           lcall 0x8afc, 0x57c4  ; List::~List@s2:57C4
4:8AF0  c45e06               les bx, ptr [bp + 6]
4:8AF3  26c7070a38           mov word ptr es:[bx], 0x380a
4:8AF8  26c747020a8b         mov word ptr es:[bx + 2], 0x8b0a  ; SEGMENT s2:0000
4:8AFE  c45e06               les bx, ptr [bp + 6]
4:8B01  26c7079a38           mov word ptr es:[bx], 0x389a
4:8B06  26c74702a68a         mov word ptr es:[bx + 2], 0x8aa6  ; SEGMENT s2:0000
4:8B0C  f6460a01             test byte ptr [bp + 0xa], 1
4:8B10  7409                 je 0x8b1b
4:8B12  66ff7606             push dword ptr [bp + 6]
4:8B16  9ace17d18a           lcall 0x8ad1, 0x17ce  ; operator_delete@s1:17CE
loc_8B1B:
4:8B1B  8b4606               mov ax, word ptr [bp + 6]
4:8B1E  8b5608               mov dx, word ptr [bp + 8]
4:8B21  c9                   leave
4:8B22  ca0600               retf 6
4:8B25  db 00

; ---------------- MovieView68::scalar_dtor@s4:8B26 FAR size=72 callers=0
;   mode 68 movie view deleting destructor
4:8B26  c81c0000             enter 0x1c, 0
4:8B2A  668b4606             mov eax, dword ptr [bp + 6]
4:8B2E  05d200               add ax, 0xd2
4:8B31  6650                 push eax
4:8B33  9ac457448b           lcall 0x8b44, 0x57c4  ; List::~List@s2:57C4
4:8B38  c45e06               les bx, ptr [bp + 6]
4:8B3B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8B40  26c74702528b         mov word ptr es:[bx + 2], 0x8b52  ; SEGMENT s2:0000
4:8B46  c45e06               les bx, ptr [bp + 6]
4:8B49  26c7079a38           mov word ptr es:[bx], 0x389a
4:8B4E  26c74702ee8a         mov word ptr es:[bx + 2], 0x8aee  ; SEGMENT s2:0000
4:8B54  f6460a01             test byte ptr [bp + 0xa], 1
4:8B58  7409                 je 0x8b63
4:8B5A  66ff7606             push dword ptr [bp + 6]
4:8B5E  9ace17198b           lcall 0x8b19, 0x17ce  ; operator_delete@s1:17CE
loc_8B63:
4:8B63  8b4606               mov ax, word ptr [bp + 6]
4:8B66  8b5608               mov dx, word ptr [bp + 8]
4:8B69  c9                   leave
4:8B6A  ca0600               retf 6
4:8B6D  db 00

; ---------------- MovieView69::scalar_dtor@s4:8B6E FAR size=72 callers=0
;   mode 69 movie view deleting destructor
4:8B6E  c81c0000             enter 0x1c, 0
4:8B72  668b4606             mov eax, dword ptr [bp + 6]
4:8B76  05d200               add ax, 0xd2
4:8B79  6650                 push eax
4:8B7B  9ac4578c8b           lcall 0x8b8c, 0x57c4  ; List::~List@s2:57C4
4:8B80  c45e06               les bx, ptr [bp + 6]
4:8B83  26c7070a38           mov word ptr es:[bx], 0x380a
4:8B88  26c747029a8b         mov word ptr es:[bx + 2], 0x8b9a  ; SEGMENT s2:0000
4:8B8E  c45e06               les bx, ptr [bp + 6]
4:8B91  26c7079a38           mov word ptr es:[bx], 0x389a
4:8B96  26c74702368b         mov word ptr es:[bx + 2], 0x8b36  ; SEGMENT s2:0000
4:8B9C  f6460a01             test byte ptr [bp + 0xa], 1
4:8BA0  7409                 je 0x8bab
4:8BA2  66ff7606             push dword ptr [bp + 6]
4:8BA6  9ace17618b           lcall 0x8b61, 0x17ce  ; operator_delete@s1:17CE
loc_8BAB:
4:8BAB  8b4606               mov ax, word ptr [bp + 6]
4:8BAE  8b5608               mov dx, word ptr [bp + 8]
4:8BB1  c9                   leave
4:8BB2  ca0600               retf 6
4:8BB5  db 00

; ---------------- MovieView70::scalar_dtor@s4:8BB6 FAR size=72 callers=0
;   mode 70 movie view deleting destructor
4:8BB6  c81c0000             enter 0x1c, 0
4:8BBA  668b4606             mov eax, dword ptr [bp + 6]
4:8BBE  05d200               add ax, 0xd2
4:8BC1  6650                 push eax
4:8BC3  9ac457d48b           lcall 0x8bd4, 0x57c4  ; List::~List@s2:57C4
4:8BC8  c45e06               les bx, ptr [bp + 6]
4:8BCB  26c7070a38           mov word ptr es:[bx], 0x380a
4:8BD0  26c74702e28b         mov word ptr es:[bx + 2], 0x8be2  ; SEGMENT s2:0000
4:8BD6  c45e06               les bx, ptr [bp + 6]
4:8BD9  26c7079a38           mov word ptr es:[bx], 0x389a
4:8BDE  26c747027e8b         mov word ptr es:[bx + 2], 0x8b7e  ; SEGMENT s2:0000
4:8BE4  f6460a01             test byte ptr [bp + 0xa], 1
4:8BE8  7409                 je 0x8bf3
4:8BEA  66ff7606             push dword ptr [bp + 6]
4:8BEE  9ace17a98b           lcall 0x8ba9, 0x17ce  ; operator_delete@s1:17CE
loc_8BF3:
4:8BF3  8b4606               mov ax, word ptr [bp + 6]
4:8BF6  8b5608               mov dx, word ptr [bp + 8]
4:8BF9  c9                   leave
4:8BFA  ca0600               retf 6
4:8BFD  db 00

; ---------------- MovieView71::scalar_dtor@s4:8BFE FAR size=72 callers=0
;   mode 71 movie view deleting destructor
4:8BFE  c81c0000             enter 0x1c, 0
4:8C02  668b4606             mov eax, dword ptr [bp + 6]
4:8C06  05d200               add ax, 0xd2
4:8C09  6650                 push eax
4:8C0B  9ac4571c8c           lcall 0x8c1c, 0x57c4  ; List::~List@s2:57C4
4:8C10  c45e06               les bx, ptr [bp + 6]
4:8C13  26c7070a38           mov word ptr es:[bx], 0x380a
4:8C18  26c747022a8c         mov word ptr es:[bx + 2], 0x8c2a  ; SEGMENT s2:0000
4:8C1E  c45e06               les bx, ptr [bp + 6]
4:8C21  26c7079a38           mov word ptr es:[bx], 0x389a
4:8C26  26c74702c68b         mov word ptr es:[bx + 2], 0x8bc6  ; SEGMENT s2:0000
4:8C2C  f6460a01             test byte ptr [bp + 0xa], 1
4:8C30  7409                 je 0x8c3b
4:8C32  66ff7606             push dword ptr [bp + 6]
4:8C36  9ace17f18b           lcall 0x8bf1, 0x17ce  ; operator_delete@s1:17CE
loc_8C3B:
4:8C3B  8b4606               mov ax, word ptr [bp + 6]
4:8C3E  8b5608               mov dx, word ptr [bp + 8]
4:8C41  c9                   leave
4:8C42  ca0600               retf 6
4:8C45  db 00

; ---------------- MovieView72::scalar_dtor@s4:8C46 FAR size=72 callers=0
;   mode 72 movie view deleting destructor
4:8C46  c81c0000             enter 0x1c, 0
4:8C4A  668b4606             mov eax, dword ptr [bp + 6]
4:8C4E  05d200               add ax, 0xd2
4:8C51  6650                 push eax
4:8C53  9ac457648c           lcall 0x8c64, 0x57c4  ; List::~List@s2:57C4
4:8C58  c45e06               les bx, ptr [bp + 6]
4:8C5B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8C60  26c74702728c         mov word ptr es:[bx + 2], 0x8c72  ; SEGMENT s2:0000
4:8C66  c45e06               les bx, ptr [bp + 6]
4:8C69  26c7079a38           mov word ptr es:[bx], 0x389a
4:8C6E  26c747020e8c         mov word ptr es:[bx + 2], 0x8c0e  ; SEGMENT s2:0000
4:8C74  f6460a01             test byte ptr [bp + 0xa], 1
4:8C78  7409                 je 0x8c83
4:8C7A  66ff7606             push dword ptr [bp + 6]
4:8C7E  9ace17398c           lcall 0x8c39, 0x17ce  ; operator_delete@s1:17CE
loc_8C83:
4:8C83  8b4606               mov ax, word ptr [bp + 6]
4:8C86  8b5608               mov dx, word ptr [bp + 8]
4:8C89  c9                   leave
4:8C8A  ca0600               retf 6
4:8C8D  db 00

; ---------------- MovieView73::scalar_dtor@s4:8C8E FAR size=72 callers=0
;   mode 73 movie view deleting destructor
4:8C8E  c81c0000             enter 0x1c, 0
4:8C92  668b4606             mov eax, dword ptr [bp + 6]
4:8C96  05d200               add ax, 0xd2
4:8C99  6650                 push eax
4:8C9B  9ac457ac8c           lcall 0x8cac, 0x57c4  ; List::~List@s2:57C4
4:8CA0  c45e06               les bx, ptr [bp + 6]
4:8CA3  26c7070a38           mov word ptr es:[bx], 0x380a
4:8CA8  26c74702ba8c         mov word ptr es:[bx + 2], 0x8cba  ; SEGMENT s2:0000
4:8CAE  c45e06               les bx, ptr [bp + 6]
4:8CB1  26c7079a38           mov word ptr es:[bx], 0x389a
4:8CB6  26c74702568c         mov word ptr es:[bx + 2], 0x8c56  ; SEGMENT s2:0000
4:8CBC  f6460a01             test byte ptr [bp + 0xa], 1
4:8CC0  7409                 je 0x8ccb
4:8CC2  66ff7606             push dword ptr [bp + 6]
4:8CC6  9ace17818c           lcall 0x8c81, 0x17ce  ; operator_delete@s1:17CE
loc_8CCB:
4:8CCB  8b4606               mov ax, word ptr [bp + 6]
4:8CCE  8b5608               mov dx, word ptr [bp + 8]
4:8CD1  c9                   leave
4:8CD2  ca0600               retf 6
4:8CD5  db 00

; ---------------- MovieView74::scalar_dtor@s4:8CD6 FAR size=72 callers=0
;   mode 74 movie view deleting destructor
4:8CD6  c81c0000             enter 0x1c, 0
4:8CDA  668b4606             mov eax, dword ptr [bp + 6]
4:8CDE  05d200               add ax, 0xd2
4:8CE1  6650                 push eax
4:8CE3  9ac457f48c           lcall 0x8cf4, 0x57c4  ; List::~List@s2:57C4
4:8CE8  c45e06               les bx, ptr [bp + 6]
4:8CEB  26c7070a38           mov word ptr es:[bx], 0x380a
4:8CF0  26c74702028d         mov word ptr es:[bx + 2], 0x8d02  ; SEGMENT s2:0000
4:8CF6  c45e06               les bx, ptr [bp + 6]
4:8CF9  26c7079a38           mov word ptr es:[bx], 0x389a
4:8CFE  26c747029e8c         mov word ptr es:[bx + 2], 0x8c9e  ; SEGMENT s2:0000
4:8D04  f6460a01             test byte ptr [bp + 0xa], 1
4:8D08  7409                 je 0x8d13
4:8D0A  66ff7606             push dword ptr [bp + 6]
4:8D0E  9ace17c98c           lcall 0x8cc9, 0x17ce  ; operator_delete@s1:17CE
loc_8D13:
4:8D13  8b4606               mov ax, word ptr [bp + 6]
4:8D16  8b5608               mov dx, word ptr [bp + 8]
4:8D19  c9                   leave
4:8D1A  ca0600               retf 6
4:8D1D  db 00

; ---------------- MovieView75::scalar_dtor@s4:8D1E FAR size=72 callers=0
;   mode 75 movie view deleting destructor
4:8D1E  c81c0000             enter 0x1c, 0
4:8D22  668b4606             mov eax, dword ptr [bp + 6]
4:8D26  05d200               add ax, 0xd2
4:8D29  6650                 push eax
4:8D2B  9ac4573c8d           lcall 0x8d3c, 0x57c4  ; List::~List@s2:57C4
4:8D30  c45e06               les bx, ptr [bp + 6]
4:8D33  26c7070a38           mov word ptr es:[bx], 0x380a
4:8D38  26c747024a8d         mov word ptr es:[bx + 2], 0x8d4a  ; SEGMENT s2:0000
4:8D3E  c45e06               les bx, ptr [bp + 6]
4:8D41  26c7079a38           mov word ptr es:[bx], 0x389a
4:8D46  26c74702e68c         mov word ptr es:[bx + 2], 0x8ce6  ; SEGMENT s2:0000
4:8D4C  f6460a01             test byte ptr [bp + 0xa], 1
4:8D50  7409                 je 0x8d5b
4:8D52  66ff7606             push dword ptr [bp + 6]
4:8D56  9ace17118d           lcall 0x8d11, 0x17ce  ; operator_delete@s1:17CE
loc_8D5B:
4:8D5B  8b4606               mov ax, word ptr [bp + 6]
4:8D5E  8b5608               mov dx, word ptr [bp + 8]
4:8D61  c9                   leave
4:8D62  ca0600               retf 6
4:8D65  db 00

; ---------------- MovieView76::scalar_dtor@s4:8D66 FAR size=72 callers=0
;   mode 76 movie view deleting destructor
4:8D66  c81c0000             enter 0x1c, 0
4:8D6A  668b4606             mov eax, dword ptr [bp + 6]
4:8D6E  05d200               add ax, 0xd2
4:8D71  6650                 push eax
4:8D73  9ac457848d           lcall 0x8d84, 0x57c4  ; List::~List@s2:57C4
4:8D78  c45e06               les bx, ptr [bp + 6]
4:8D7B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8D80  26c74702928d         mov word ptr es:[bx + 2], 0x8d92  ; SEGMENT s2:0000
4:8D86  c45e06               les bx, ptr [bp + 6]
4:8D89  26c7079a38           mov word ptr es:[bx], 0x389a
4:8D8E  26c747022e8d         mov word ptr es:[bx + 2], 0x8d2e  ; SEGMENT s2:0000
4:8D94  f6460a01             test byte ptr [bp + 0xa], 1
4:8D98  7409                 je 0x8da3
4:8D9A  66ff7606             push dword ptr [bp + 6]
4:8D9E  9ace17598d           lcall 0x8d59, 0x17ce  ; operator_delete@s1:17CE
loc_8DA3:
4:8DA3  8b4606               mov ax, word ptr [bp + 6]
4:8DA6  8b5608               mov dx, word ptr [bp + 8]
4:8DA9  c9                   leave
4:8DAA  ca0600               retf 6
4:8DAD  db 00

; ---------------- MovieView77::scalar_dtor@s4:8DAE FAR size=72 callers=0
;   mode 77 movie view deleting destructor
4:8DAE  c81c0000             enter 0x1c, 0
4:8DB2  668b4606             mov eax, dword ptr [bp + 6]
4:8DB6  05d200               add ax, 0xd2
4:8DB9  6650                 push eax
4:8DBB  9ac457cc8d           lcall 0x8dcc, 0x57c4  ; List::~List@s2:57C4
4:8DC0  c45e06               les bx, ptr [bp + 6]
4:8DC3  26c7070a38           mov word ptr es:[bx], 0x380a
4:8DC8  26c74702da8d         mov word ptr es:[bx + 2], 0x8dda  ; SEGMENT s2:0000
4:8DCE  c45e06               les bx, ptr [bp + 6]
4:8DD1  26c7079a38           mov word ptr es:[bx], 0x389a
4:8DD6  26c74702768d         mov word ptr es:[bx + 2], 0x8d76  ; SEGMENT s2:0000
4:8DDC  f6460a01             test byte ptr [bp + 0xa], 1
4:8DE0  7409                 je 0x8deb
4:8DE2  66ff7606             push dword ptr [bp + 6]
4:8DE6  9ace17a18d           lcall 0x8da1, 0x17ce  ; operator_delete@s1:17CE
loc_8DEB:
4:8DEB  8b4606               mov ax, word ptr [bp + 6]
4:8DEE  8b5608               mov dx, word ptr [bp + 8]
4:8DF1  c9                   leave
4:8DF2  ca0600               retf 6
4:8DF5  db 00

; ---------------- MovieView78::scalar_dtor@s4:8DF6 FAR size=72 callers=0
;   mode 78 movie view deleting destructor
4:8DF6  c81c0000             enter 0x1c, 0
4:8DFA  668b4606             mov eax, dword ptr [bp + 6]
4:8DFE  05d200               add ax, 0xd2
4:8E01  6650                 push eax
4:8E03  9ac457148e           lcall 0x8e14, 0x57c4  ; List::~List@s2:57C4
4:8E08  c45e06               les bx, ptr [bp + 6]
4:8E0B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8E10  26c74702228e         mov word ptr es:[bx + 2], 0x8e22  ; SEGMENT s2:0000
4:8E16  c45e06               les bx, ptr [bp + 6]
4:8E19  26c7079a38           mov word ptr es:[bx], 0x389a
4:8E1E  26c74702be8d         mov word ptr es:[bx + 2], 0x8dbe  ; SEGMENT s2:0000
4:8E24  f6460a01             test byte ptr [bp + 0xa], 1
4:8E28  7409                 je 0x8e33
4:8E2A  66ff7606             push dword ptr [bp + 6]
4:8E2E  9ace17e98d           lcall 0x8de9, 0x17ce  ; operator_delete@s1:17CE
loc_8E33:
4:8E33  8b4606               mov ax, word ptr [bp + 6]
4:8E36  8b5608               mov dx, word ptr [bp + 8]
4:8E39  c9                   leave
4:8E3A  ca0600               retf 6
4:8E3D  db 00

; ---------------- MovieView79::scalar_dtor@s4:8E3E FAR size=72 callers=0
;   mode 79 movie view deleting destructor
4:8E3E  c81c0000             enter 0x1c, 0
4:8E42  668b4606             mov eax, dword ptr [bp + 6]
4:8E46  05d200               add ax, 0xd2
4:8E49  6650                 push eax
4:8E4B  9ac4575c8e           lcall 0x8e5c, 0x57c4  ; List::~List@s2:57C4
4:8E50  c45e06               les bx, ptr [bp + 6]
4:8E53  26c7070a38           mov word ptr es:[bx], 0x380a
4:8E58  26c747026a8e         mov word ptr es:[bx + 2], 0x8e6a  ; SEGMENT s2:0000
4:8E5E  c45e06               les bx, ptr [bp + 6]
4:8E61  26c7079a38           mov word ptr es:[bx], 0x389a
4:8E66  26c74702068e         mov word ptr es:[bx + 2], 0x8e06  ; SEGMENT s2:0000
4:8E6C  f6460a01             test byte ptr [bp + 0xa], 1
4:8E70  7409                 je 0x8e7b
4:8E72  66ff7606             push dword ptr [bp + 6]
4:8E76  9ace17318e           lcall 0x8e31, 0x17ce  ; operator_delete@s1:17CE
loc_8E7B:
4:8E7B  8b4606               mov ax, word ptr [bp + 6]
4:8E7E  8b5608               mov dx, word ptr [bp + 8]
4:8E81  c9                   leave
4:8E82  ca0600               retf 6
4:8E85  db 00

; ---------------- MovieView80::scalar_dtor@s4:8E86 FAR size=72 callers=0
;   mode 80 movie view deleting destructor
4:8E86  c81c0000             enter 0x1c, 0
4:8E8A  668b4606             mov eax, dword ptr [bp + 6]
4:8E8E  05d200               add ax, 0xd2
4:8E91  6650                 push eax
4:8E93  9ac457a48e           lcall 0x8ea4, 0x57c4  ; List::~List@s2:57C4
4:8E98  c45e06               les bx, ptr [bp + 6]
4:8E9B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8EA0  26c74702b28e         mov word ptr es:[bx + 2], 0x8eb2  ; SEGMENT s2:0000
4:8EA6  c45e06               les bx, ptr [bp + 6]
4:8EA9  26c7079a38           mov word ptr es:[bx], 0x389a
4:8EAE  26c747024e8e         mov word ptr es:[bx + 2], 0x8e4e  ; SEGMENT s2:0000
4:8EB4  f6460a01             test byte ptr [bp + 0xa], 1
4:8EB8  7409                 je 0x8ec3
4:8EBA  66ff7606             push dword ptr [bp + 6]
4:8EBE  9ace17798e           lcall 0x8e79, 0x17ce  ; operator_delete@s1:17CE
loc_8EC3:
4:8EC3  8b4606               mov ax, word ptr [bp + 6]
4:8EC6  8b5608               mov dx, word ptr [bp + 8]
4:8EC9  c9                   leave
4:8ECA  ca0600               retf 6
4:8ECD  db 00

; ---------------- MovieView81::scalar_dtor@s4:8ECE FAR size=72 callers=0
;   mode 81 movie view deleting destructor
4:8ECE  c81c0000             enter 0x1c, 0
4:8ED2  668b4606             mov eax, dword ptr [bp + 6]
4:8ED6  05d200               add ax, 0xd2
4:8ED9  6650                 push eax
4:8EDB  9ac457ec8e           lcall 0x8eec, 0x57c4  ; List::~List@s2:57C4
4:8EE0  c45e06               les bx, ptr [bp + 6]
4:8EE3  26c7070a38           mov word ptr es:[bx], 0x380a
4:8EE8  26c74702fa8e         mov word ptr es:[bx + 2], 0x8efa  ; SEGMENT s2:0000
4:8EEE  c45e06               les bx, ptr [bp + 6]
4:8EF1  26c7079a38           mov word ptr es:[bx], 0x389a
4:8EF6  26c74702968e         mov word ptr es:[bx + 2], 0x8e96  ; SEGMENT s2:0000
4:8EFC  f6460a01             test byte ptr [bp + 0xa], 1
4:8F00  7409                 je 0x8f0b
4:8F02  66ff7606             push dword ptr [bp + 6]
4:8F06  9ace17c18e           lcall 0x8ec1, 0x17ce  ; operator_delete@s1:17CE
loc_8F0B:
4:8F0B  8b4606               mov ax, word ptr [bp + 6]
4:8F0E  8b5608               mov dx, word ptr [bp + 8]
4:8F11  c9                   leave
4:8F12  ca0600               retf 6
4:8F15  db 00

; ---------------- MovieView82::scalar_dtor@s4:8F16 FAR size=72 callers=0
;   mode 82 movie view deleting destructor
4:8F16  c81c0000             enter 0x1c, 0
4:8F1A  668b4606             mov eax, dword ptr [bp + 6]
4:8F1E  05d200               add ax, 0xd2
4:8F21  6650                 push eax
4:8F23  9ac457348f           lcall 0x8f34, 0x57c4  ; List::~List@s2:57C4
4:8F28  c45e06               les bx, ptr [bp + 6]
4:8F2B  26c7070a38           mov word ptr es:[bx], 0x380a
4:8F30  26c74702428f         mov word ptr es:[bx + 2], 0x8f42  ; SEGMENT s2:0000
4:8F36  c45e06               les bx, ptr [bp + 6]
4:8F39  26c7079a38           mov word ptr es:[bx], 0x389a
4:8F3E  26c74702de8e         mov word ptr es:[bx + 2], 0x8ede  ; SEGMENT s2:0000
4:8F44  f6460a01             test byte ptr [bp + 0xa], 1
4:8F48  7409                 je 0x8f53
4:8F4A  66ff7606             push dword ptr [bp + 6]
4:8F4E  9ace17098f           lcall 0x8f09, 0x17ce  ; operator_delete@s1:17CE
loc_8F53:
4:8F53  8b4606               mov ax, word ptr [bp + 6]
4:8F56  8b5608               mov dx, word ptr [bp + 8]
4:8F59  c9                   leave
4:8F5A  ca0600               retf 6
4:8F5D  db 00

; ---------------- MovieView83::scalar_dtor@s4:8F5E FAR size=72 callers=0
;   mode 83 movie view deleting destructor
4:8F5E  c81c0000             enter 0x1c, 0
4:8F62  668b4606             mov eax, dword ptr [bp + 6]
4:8F66  05d200               add ax, 0xd2
4:8F69  6650                 push eax
4:8F6B  9ac4577c8f           lcall 0x8f7c, 0x57c4  ; List::~List@s2:57C4
4:8F70  c45e06               les bx, ptr [bp + 6]
4:8F73  26c7070a38           mov word ptr es:[bx], 0x380a
4:8F78  26c747028a8f         mov word ptr es:[bx + 2], 0x8f8a  ; SEGMENT s2:0000
4:8F7E  c45e06               les bx, ptr [bp + 6]
4:8F81  26c7079a38           mov word ptr es:[bx], 0x389a
4:8F86  26c74702268f         mov word ptr es:[bx + 2], 0x8f26  ; SEGMENT s2:0000
4:8F8C  f6460a01             test byte ptr [bp + 0xa], 1
4:8F90  7409                 je 0x8f9b
4:8F92  66ff7606             push dword ptr [bp + 6]
4:8F96  9ace17518f           lcall 0x8f51, 0x17ce  ; operator_delete@s1:17CE
loc_8F9B:
4:8F9B  8b4606               mov ax, word ptr [bp + 6]
4:8F9E  8b5608               mov dx, word ptr [bp + 8]
4:8FA1  c9                   leave
4:8FA2  ca0600               retf 6
4:8FA5  db 00

; ---------------- MovieViewUnused::scalar_dtor@s4:8FA6 FAR size=72 callers=0
;   movie view deleting destructor whose class no ctor installs
4:8FA6  c81c0000             enter 0x1c, 0
4:8FAA  668b4606             mov eax, dword ptr [bp + 6]
4:8FAE  05d200               add ax, 0xd2
4:8FB1  6650                 push eax
4:8FB3  9ac457c48f           lcall 0x8fc4, 0x57c4  ; List::~List@s2:57C4
4:8FB8  c45e06               les bx, ptr [bp + 6]
4:8FBB  26c7070a38           mov word ptr es:[bx], 0x380a
4:8FC0  26c74702d28f         mov word ptr es:[bx + 2], 0x8fd2  ; SEGMENT s2:0000
4:8FC6  c45e06               les bx, ptr [bp + 6]
4:8FC9  26c7079a38           mov word ptr es:[bx], 0x389a
4:8FCE  26c747026e8f         mov word ptr es:[bx + 2], 0x8f6e  ; SEGMENT s2:0000
4:8FD4  f6460a01             test byte ptr [bp + 0xa], 1
4:8FD8  7409                 je 0x8fe3
4:8FDA  66ff7606             push dword ptr [bp + 6]
4:8FDE  9ace17998f           lcall 0x8f99, 0x17ce  ; operator_delete@s1:17CE
loc_8FE3:
4:8FE3  8b4606               mov ax, word ptr [bp + 6]
4:8FE6  8b5608               mov dx, word ptr [bp + 8]
4:8FE9  c9                   leave
4:8FEA  ca0600               retf 6
4:8FED  db 00

; ---------------- MovieView85::scalar_dtor@s4:8FEE FAR size=72 callers=0
;   mode 85 movie view deleting destructor
4:8FEE  c81c0000             enter 0x1c, 0
4:8FF2  668b4606             mov eax, dword ptr [bp + 6]
4:8FF6  05d200               add ax, 0xd2
4:8FF9  6650                 push eax
4:8FFB  9ac4570c90           lcall 0x900c, 0x57c4  ; List::~List@s2:57C4
4:9000  c45e06               les bx, ptr [bp + 6]
4:9003  26c7070a38           mov word ptr es:[bx], 0x380a
4:9008  26c747021a90         mov word ptr es:[bx + 2], 0x901a  ; SEGMENT s2:0000
4:900E  c45e06               les bx, ptr [bp + 6]
4:9011  26c7079a38           mov word ptr es:[bx], 0x389a
4:9016  26c74702b68f         mov word ptr es:[bx + 2], 0x8fb6  ; SEGMENT s2:0000
4:901C  f6460a01             test byte ptr [bp + 0xa], 1
4:9020  7409                 je 0x902b
4:9022  66ff7606             push dword ptr [bp + 6]
4:9026  9ace17e18f           lcall 0x8fe1, 0x17ce  ; operator_delete@s1:17CE
loc_902B:
4:902B  8b4606               mov ax, word ptr [bp + 6]
4:902E  8b5608               mov dx, word ptr [bp + 8]
4:9031  c9                   leave
4:9032  ca0600               retf 6
4:9035  db 00

; ---------------- MovieView86::scalar_dtor@s4:9036 FAR size=72 callers=0
;   mode 86 movie view deleting destructor
4:9036  c81c0000             enter 0x1c, 0
4:903A  668b4606             mov eax, dword ptr [bp + 6]
4:903E  05d200               add ax, 0xd2
4:9041  6650                 push eax
4:9043  9ac4575490           lcall 0x9054, 0x57c4  ; List::~List@s2:57C4
4:9048  c45e06               les bx, ptr [bp + 6]
4:904B  26c7070a38           mov word ptr es:[bx], 0x380a
4:9050  26c747026290         mov word ptr es:[bx + 2], 0x9062  ; SEGMENT s2:0000
4:9056  c45e06               les bx, ptr [bp + 6]
4:9059  26c7079a38           mov word ptr es:[bx], 0x389a
4:905E  26c74702fe8f         mov word ptr es:[bx + 2], 0x8ffe  ; SEGMENT s2:0000
4:9064  f6460a01             test byte ptr [bp + 0xa], 1
4:9068  7409                 je 0x9073
4:906A  66ff7606             push dword ptr [bp + 6]
4:906E  9ace172990           lcall 0x9029, 0x17ce  ; operator_delete@s1:17CE
loc_9073:
4:9073  8b4606               mov ax, word ptr [bp + 6]
4:9076  8b5608               mov dx, word ptr [bp + 8]
4:9079  c9                   leave
4:907A  ca0600               retf 6
4:907D  db 00

; ---------------- MovieView87::scalar_dtor@s4:907E FAR size=72 callers=0
;   mode 87 movie view deleting destructor
4:907E  c81c0000             enter 0x1c, 0
4:9082  668b4606             mov eax, dword ptr [bp + 6]
4:9086  05d200               add ax, 0xd2
4:9089  6650                 push eax
4:908B  9ac4579c90           lcall 0x909c, 0x57c4  ; List::~List@s2:57C4
4:9090  c45e06               les bx, ptr [bp + 6]
4:9093  26c7070a38           mov word ptr es:[bx], 0x380a
4:9098  26c74702aa90         mov word ptr es:[bx + 2], 0x90aa  ; SEGMENT s2:0000
4:909E  c45e06               les bx, ptr [bp + 6]
4:90A1  26c7079a38           mov word ptr es:[bx], 0x389a
4:90A6  26c747024690         mov word ptr es:[bx + 2], 0x9046  ; SEGMENT s2:0000
4:90AC  f6460a01             test byte ptr [bp + 0xa], 1
4:90B0  7409                 je 0x90bb
4:90B2  66ff7606             push dword ptr [bp + 6]
4:90B6  9ace177190           lcall 0x9071, 0x17ce  ; operator_delete@s1:17CE
loc_90BB:
4:90BB  8b4606               mov ax, word ptr [bp + 6]
4:90BE  8b5608               mov dx, word ptr [bp + 8]
4:90C1  c9                   leave
4:90C2  ca0600               retf 6
4:90C5  db 00

; ---------------- MovieView88::scalar_dtor@s4:90C6 FAR size=72 callers=0
;   mode 88 movie view deleting destructor
4:90C6  c81c0000             enter 0x1c, 0
4:90CA  668b4606             mov eax, dword ptr [bp + 6]
4:90CE  05d200               add ax, 0xd2
4:90D1  6650                 push eax
4:90D3  9ac457e490           lcall 0x90e4, 0x57c4  ; List::~List@s2:57C4
4:90D8  c45e06               les bx, ptr [bp + 6]
4:90DB  26c7070a38           mov word ptr es:[bx], 0x380a
4:90E0  26c74702f290         mov word ptr es:[bx + 2], 0x90f2  ; SEGMENT s2:0000
4:90E6  c45e06               les bx, ptr [bp + 6]
4:90E9  26c7079a38           mov word ptr es:[bx], 0x389a
4:90EE  26c747028e90         mov word ptr es:[bx + 2], 0x908e  ; SEGMENT s2:0000
4:90F4  f6460a01             test byte ptr [bp + 0xa], 1
4:90F8  7409                 je 0x9103
4:90FA  66ff7606             push dword ptr [bp + 6]
4:90FE  9ace17b990           lcall 0x90b9, 0x17ce  ; operator_delete@s1:17CE
loc_9103:
4:9103  8b4606               mov ax, word ptr [bp + 6]
4:9106  8b5608               mov dx, word ptr [bp + 8]
4:9109  c9                   leave
4:910A  ca0600               retf 6
4:910D  db 00

; ---------------- MovieView89::scalar_dtor@s4:910E FAR size=72 callers=0
;   mode 89 movie view deleting destructor
4:910E  c81c0000             enter 0x1c, 0
4:9112  668b4606             mov eax, dword ptr [bp + 6]
4:9116  05d200               add ax, 0xd2
4:9119  6650                 push eax
4:911B  9ac4572c91           lcall 0x912c, 0x57c4  ; List::~List@s2:57C4
4:9120  c45e06               les bx, ptr [bp + 6]
4:9123  26c7070a38           mov word ptr es:[bx], 0x380a
4:9128  26c747023a91         mov word ptr es:[bx + 2], 0x913a  ; SEGMENT s2:0000
4:912E  c45e06               les bx, ptr [bp + 6]
4:9131  26c7079a38           mov word ptr es:[bx], 0x389a
4:9136  26c74702d690         mov word ptr es:[bx + 2], 0x90d6  ; SEGMENT s2:0000
4:913C  f6460a01             test byte ptr [bp + 0xa], 1
4:9140  7409                 je 0x914b
4:9142  66ff7606             push dword ptr [bp + 6]
4:9146  9ace170191           lcall 0x9101, 0x17ce  ; operator_delete@s1:17CE
loc_914B:
4:914B  8b4606               mov ax, word ptr [bp + 6]
4:914E  8b5608               mov dx, word ptr [bp + 8]
4:9151  c9                   leave
4:9152  ca0600               retf 6
4:9155  db 00

; ---------------- MovieView90::scalar_dtor@s4:9156 FAR size=72 callers=0
;   mode 90 movie view deleting destructor
4:9156  c81c0000             enter 0x1c, 0
4:915A  668b4606             mov eax, dword ptr [bp + 6]
4:915E  05d200               add ax, 0xd2
4:9161  6650                 push eax
4:9163  9ac4577491           lcall 0x9174, 0x57c4  ; List::~List@s2:57C4
4:9168  c45e06               les bx, ptr [bp + 6]
4:916B  26c7070a38           mov word ptr es:[bx], 0x380a
4:9170  26c747028291         mov word ptr es:[bx + 2], 0x9182  ; SEGMENT s2:0000
4:9176  c45e06               les bx, ptr [bp + 6]
4:9179  26c7079a38           mov word ptr es:[bx], 0x389a
4:917E  26c747021e91         mov word ptr es:[bx + 2], 0x911e  ; SEGMENT s2:0000
4:9184  f6460a01             test byte ptr [bp + 0xa], 1
4:9188  7409                 je 0x9193
4:918A  66ff7606             push dword ptr [bp + 6]
4:918E  9ace174991           lcall 0x9149, 0x17ce  ; operator_delete@s1:17CE
loc_9193:
4:9193  8b4606               mov ax, word ptr [bp + 6]
4:9196  8b5608               mov dx, word ptr [bp + 8]
4:9199  c9                   leave
4:919A  ca0600               retf 6
4:919D  db 00

; ---------------- MovieView91::scalar_dtor@s4:919E FAR size=72 callers=0
;   mode 91 movie view deleting destructor
4:919E  c81c0000             enter 0x1c, 0
4:91A2  668b4606             mov eax, dword ptr [bp + 6]
4:91A6  05d200               add ax, 0xd2
4:91A9  6650                 push eax
4:91AB  9ac457bc91           lcall 0x91bc, 0x57c4  ; List::~List@s2:57C4
4:91B0  c45e06               les bx, ptr [bp + 6]
4:91B3  26c7070a38           mov word ptr es:[bx], 0x380a
4:91B8  26c74702ca91         mov word ptr es:[bx + 2], 0x91ca  ; SEGMENT s2:0000
4:91BE  c45e06               les bx, ptr [bp + 6]
4:91C1  26c7079a38           mov word ptr es:[bx], 0x389a
4:91C6  26c747026691         mov word ptr es:[bx + 2], 0x9166  ; SEGMENT s2:0000
4:91CC  f6460a01             test byte ptr [bp + 0xa], 1
4:91D0  7409                 je 0x91db
4:91D2  66ff7606             push dword ptr [bp + 6]
4:91D6  9ace179191           lcall 0x9191, 0x17ce  ; operator_delete@s1:17CE
loc_91DB:
4:91DB  8b4606               mov ax, word ptr [bp + 6]
4:91DE  8b5608               mov dx, word ptr [bp + 8]
4:91E1  c9                   leave
4:91E2  ca0600               retf 6
4:91E5  db 00

; ---------------- MovieView92::scalar_dtor@s4:91E6 FAR size=72 callers=0
;   mode 92 movie view deleting destructor
4:91E6  c81c0000             enter 0x1c, 0
4:91EA  668b4606             mov eax, dword ptr [bp + 6]
4:91EE  05d200               add ax, 0xd2
4:91F1  6650                 push eax
4:91F3  9ac4570492           lcall 0x9204, 0x57c4  ; List::~List@s2:57C4
4:91F8  c45e06               les bx, ptr [bp + 6]
4:91FB  26c7070a38           mov word ptr es:[bx], 0x380a
4:9200  26c747021292         mov word ptr es:[bx + 2], 0x9212  ; SEGMENT s2:0000
4:9206  c45e06               les bx, ptr [bp + 6]
4:9209  26c7079a38           mov word ptr es:[bx], 0x389a
4:920E  26c74702ae91         mov word ptr es:[bx + 2], 0x91ae  ; SEGMENT s2:0000
4:9214  f6460a01             test byte ptr [bp + 0xa], 1
4:9218  7409                 je 0x9223
4:921A  66ff7606             push dword ptr [bp + 6]
4:921E  9ace17d991           lcall 0x91d9, 0x17ce  ; operator_delete@s1:17CE
loc_9223:
4:9223  8b4606               mov ax, word ptr [bp + 6]
4:9226  8b5608               mov dx, word ptr [bp + 8]
4:9229  c9                   leave
4:922A  ca0600               retf 6
4:922D  db 00

; ---------------- MovieView93::scalar_dtor@s4:922E FAR size=72 callers=0
;   mode 93 movie view deleting destructor
4:922E  c81c0000             enter 0x1c, 0
4:9232  668b4606             mov eax, dword ptr [bp + 6]
4:9236  05d200               add ax, 0xd2
4:9239  6650                 push eax
4:923B  9ac4574c92           lcall 0x924c, 0x57c4  ; List::~List@s2:57C4
4:9240  c45e06               les bx, ptr [bp + 6]
4:9243  26c7070a38           mov word ptr es:[bx], 0x380a
4:9248  26c747025a92         mov word ptr es:[bx + 2], 0x925a  ; SEGMENT s2:0000
4:924E  c45e06               les bx, ptr [bp + 6]
4:9251  26c7079a38           mov word ptr es:[bx], 0x389a
4:9256  26c74702f691         mov word ptr es:[bx + 2], 0x91f6  ; SEGMENT s2:0000
4:925C  f6460a01             test byte ptr [bp + 0xa], 1
4:9260  7409                 je 0x926b
4:9262  66ff7606             push dword ptr [bp + 6]
4:9266  9ace172192           lcall 0x9221, 0x17ce  ; operator_delete@s1:17CE
loc_926B:
4:926B  8b4606               mov ax, word ptr [bp + 6]
4:926E  8b5608               mov dx, word ptr [bp + 8]
4:9271  c9                   leave
4:9272  ca0600               retf 6
4:9275  db 00

; ---------------- MovieView94::scalar_dtor@s4:9276 FAR size=72 callers=0
;   mode 94 movie view deleting destructor
4:9276  c81c0000             enter 0x1c, 0
4:927A  668b4606             mov eax, dword ptr [bp + 6]
4:927E  05d200               add ax, 0xd2
4:9281  6650                 push eax
4:9283  9ac4579492           lcall 0x9294, 0x57c4  ; List::~List@s2:57C4
4:9288  c45e06               les bx, ptr [bp + 6]
4:928B  26c7070a38           mov word ptr es:[bx], 0x380a
4:9290  26c74702a292         mov word ptr es:[bx + 2], 0x92a2  ; SEGMENT s2:0000
4:9296  c45e06               les bx, ptr [bp + 6]
4:9299  26c7079a38           mov word ptr es:[bx], 0x389a
4:929E  26c747023e92         mov word ptr es:[bx + 2], 0x923e  ; SEGMENT s2:0000
4:92A4  f6460a01             test byte ptr [bp + 0xa], 1
4:92A8  7409                 je 0x92b3
4:92AA  66ff7606             push dword ptr [bp + 6]
4:92AE  9ace176992           lcall 0x9269, 0x17ce  ; operator_delete@s1:17CE
loc_92B3:
4:92B3  8b4606               mov ax, word ptr [bp + 6]
4:92B6  8b5608               mov dx, word ptr [bp + 8]
4:92B9  c9                   leave
4:92BA  ca0600               retf 6
4:92BD  db 00

; ---------------- MovieView95::scalar_dtor@s4:92BE FAR size=72 callers=0
;   mode 95 movie view deleting destructor
4:92BE  c81c0000             enter 0x1c, 0
4:92C2  668b4606             mov eax, dword ptr [bp + 6]
4:92C6  05d200               add ax, 0xd2
4:92C9  6650                 push eax
4:92CB  9ac457dc92           lcall 0x92dc, 0x57c4  ; List::~List@s2:57C4
4:92D0  c45e06               les bx, ptr [bp + 6]
4:92D3  26c7070a38           mov word ptr es:[bx], 0x380a
4:92D8  26c74702ea92         mov word ptr es:[bx + 2], 0x92ea  ; SEGMENT s2:0000
4:92DE  c45e06               les bx, ptr [bp + 6]
4:92E1  26c7079a38           mov word ptr es:[bx], 0x389a
4:92E6  26c747028692         mov word ptr es:[bx + 2], 0x9286  ; SEGMENT s2:0000
4:92EC  f6460a01             test byte ptr [bp + 0xa], 1
4:92F0  7409                 je 0x92fb
4:92F2  66ff7606             push dword ptr [bp + 6]
4:92F6  9ace17b192           lcall 0x92b1, 0x17ce  ; operator_delete@s1:17CE
loc_92FB:
4:92FB  8b4606               mov ax, word ptr [bp + 6]
4:92FE  8b5608               mov dx, word ptr [bp + 8]
4:9301  c9                   leave
4:9302  ca0600               retf 6
4:9305  db 00

; ---------------- MovieView96::scalar_dtor@s4:9306 FAR size=72 callers=0
;   mode 96 movie view deleting destructor
4:9306  c81c0000             enter 0x1c, 0
4:930A  668b4606             mov eax, dword ptr [bp + 6]
4:930E  05d200               add ax, 0xd2
4:9311  6650                 push eax
4:9313  9ac4572493           lcall 0x9324, 0x57c4  ; List::~List@s2:57C4
4:9318  c45e06               les bx, ptr [bp + 6]
4:931B  26c7070a38           mov word ptr es:[bx], 0x380a
4:9320  26c747023293         mov word ptr es:[bx + 2], 0x9332  ; SEGMENT s2:0000
4:9326  c45e06               les bx, ptr [bp + 6]
4:9329  26c7079a38           mov word ptr es:[bx], 0x389a
4:932E  26c74702ce92         mov word ptr es:[bx + 2], 0x92ce  ; SEGMENT s2:0000
4:9334  f6460a01             test byte ptr [bp + 0xa], 1
4:9338  7409                 je 0x9343
4:933A  66ff7606             push dword ptr [bp + 6]
4:933E  9ace17f992           lcall 0x92f9, 0x17ce  ; operator_delete@s1:17CE
loc_9343:
4:9343  8b4606               mov ax, word ptr [bp + 6]
4:9346  8b5608               mov dx, word ptr [bp + 8]
4:9349  c9                   leave
4:934A  ca0600               retf 6
4:934D  db 00

; ---------------- MovieView97::scalar_dtor@s4:934E FAR size=72 callers=0
;   mode 97 movie view deleting destructor
4:934E  c81c0000             enter 0x1c, 0
4:9352  668b4606             mov eax, dword ptr [bp + 6]
4:9356  05d200               add ax, 0xd2
4:9359  6650                 push eax
4:935B  9ac4576c93           lcall 0x936c, 0x57c4  ; List::~List@s2:57C4
4:9360  c45e06               les bx, ptr [bp + 6]
4:9363  26c7070a38           mov word ptr es:[bx], 0x380a
4:9368  26c747027a93         mov word ptr es:[bx + 2], 0x937a  ; SEGMENT s2:0000
4:936E  c45e06               les bx, ptr [bp + 6]
4:9371  26c7079a38           mov word ptr es:[bx], 0x389a
4:9376  26c747021693         mov word ptr es:[bx + 2], 0x9316  ; SEGMENT s2:0000
4:937C  f6460a01             test byte ptr [bp + 0xa], 1
4:9380  7409                 je 0x938b
4:9382  66ff7606             push dword ptr [bp + 6]
4:9386  9ace174193           lcall 0x9341, 0x17ce  ; operator_delete@s1:17CE
loc_938B:
4:938B  8b4606               mov ax, word ptr [bp + 6]
4:938E  8b5608               mov dx, word ptr [bp + 8]
4:9391  c9                   leave
4:9392  ca0600               retf 6
4:9395  db 00

; ---------------- MovieView_vtables@s4:9396 FAR size=12396 callers=0
;   DATA, not code: the 78 movie views' vtables (39 slots each)
4:9396  c81c0000             enter 0x1c, 0
4:939A  668b4606             mov eax, dword ptr [bp + 6]
4:939E  05d200               add ax, 0xd2
4:93A1  6650                 push eax
4:93A3  9ac457b493           lcall 0x93b4, 0x57c4  ; List::~List@s2:57C4
4:93A8  c45e06               les bx, ptr [bp + 6]
4:93AB  26c7070a38           mov word ptr es:[bx], 0x380a
4:93B0  26c74702c293         mov word ptr es:[bx + 2], 0x93c2  ; SEGMENT s2:0000
4:93B6  c45e06               les bx, ptr [bp + 6]
4:93B9  26c7079a38           mov word ptr es:[bx], 0x389a
4:93BE  26c747025e93         mov word ptr es:[bx + 2], 0x935e  ; SEGMENT s2:0000
4:93C4  f6460a01             test byte ptr [bp + 0xa], 1
4:93C8  7409                 je 0x93d3
4:93CA  66ff7606             push dword ptr [bp + 6]
4:93CE  9ace178993           lcall 0x9389, 0x17ce  ; operator_delete@s1:17CE
loc_93D3:
4:93D3  8b4606               mov ax, word ptr [bp + 6]
4:93D6  8b5608               mov dx, word ptr [bp + 8]
4:93D9  c9                   leave
4:93DA  ca0600               retf 6
4:93DD  db 00 06 81 14 94 ea 68 e8 93 60 97 ec 93 c6 68 f0
4:93ED  db 93 40 96 f4 93 64 96 f8 93 2c 37 fc 93 f2 97 00
4:93FD  db 94 3c 37 04 94 40 37 08 94 44 37 0c 94 48 37 10
4:940D  db 94 4c 37 18 94 7a 6a 20 94 98 96 1c 94 50 37 24
4:941D  db 94 76 6a 9b 7d 60 9c 28 94 58 37 2c 94 24 63 30
4:942D  db 94 4e 9c 34 94 62 37 38 94 4a 9c 3c 94 66 37 40
4:943D  db 94 6a 37 44 94 4a 6a 48 94 2e 6b 4c 94 02 6b 50
4:944D  db 94 7a 37 54 94 52 9c 58 94 56 9c 5c 94 16 9c 60
4:945D  db 94 30 9c 64 94 86 9c 68 94 c4 9c 6c 94 e0 9c 70
4:946D  db 94 8e 62 74 94 28 63 78 94 2c 63 a6 93 4e 93 b0
4:947D  db 94 ea 68 84 94 60 97 88 94 c6 68 8c 94 40 96 90
4:948D  db 94 64 96 94 94 2c 37 98 94 f2 97 9c 94 3c 37 a0
4:949D  db 94 40 37 a4 94 44 37 a8 94 48 37 ac 94 4c 37 b4
4:94AD  db 94 7a 6a bc 94 98 96 b8 94 50 37 c0 94 76 6a e0
4:94BD  db 93 60 9c c4 94 58 37 c8 94 24 63 cc 94 4e 9c d0
4:94CD  db 94 62 37 d4 94 4a 9c d8 94 66 37 dc 94 6a 37 e0
4:94DD  db 94 4a 6a e4 94 2e 6b e8 94 02 6b ec 94 7a 37 f0
4:94ED  db 94 52 9c f4 94 56 9c f8 94 16 9c fc 94 30 9c 00
4:94FD  db 95 86 9c 04 95 c4 9c 08 95 e0 9c 0c 95 8e 62 10
4:950D  db 95 28 63 14 95 2c 63 e4 93 e6 88 4c 95 ea 68 20
4:951D  db 95 60 97 24 95 c6 68 28 95 40 96 2c 95 64 96 30
4:952D  db 95 2c 37 34 95 f2 97 38 95 3c 37 3c 95 40 37 40
4:953D  db 95 44 37 44 95 48 37 48 95 4c 37 50 95 7a 6a 58
4:954D  db 95 98 96 54 95 50 37 5c 95 76 6a 7c 94 60 9c 60
4:955D  db 95 58 37 64 95 24 63 68 95 4e 9c 6c 95 62 37 70
4:956D  db 95 4a 9c 74 95 66 37 78 95 6a 37 7c 95 4a 6a 80
4:957D  db 95 2e 6b 84 95 02 6b 88 95 7a 37 8c 95 52 9c 90
4:958D  db 95 56 9c 94 95 16 9c 98 95 30 9c 9c 95 86 9c a0
4:959D  db 95 c4 9c a4 95 e0 9c a8 95 8e 62 ac 95 28 63 b0
4:95AD  db 95 2c 63 80 94 ce 8e e8 95 ea 68 bc 95 60 97 c0
4:95BD  db 95 c6 68 c4 95 40 96 c8 95 64 96 cc 95 2c 37 d0
4:95CD  db 95 f2 97 d4 95 3c 37 d8 95 40 37 dc 95 44 37 e0
4:95DD  db 95 48 37 e4 95 4c 37 ec 95 7a 6a f4 95 98 96 f0
4:95ED  db 95 50 37 f8 95 76 6a 18 95 60 9c fc 95 58 37 00
4:95FD  db 96 24 63 04 96 4e 9c 08 96 62 37 0c 96 4a 9c 10
4:960D  db 96 66 37 14 96 6a 37 18 96 4a 6a 1c 96 2e 6b 20
4:961D  db 96 02 6b 24 96 7a 37 28 96 52 9c 2c 96 56 9c 30
4:962D  db 96 16 9c 34 96 30 9c 38 96 86 9c 3c 96 c4 9c 40
4:963D  db 96 e0 9c 44 96 8e 62 48 96 28 63 4c 96 2c 63 1c
4:964D  db 95 9e 7f 84 96 ea 68 58 96 60 97 5c 96 c6 68 60
4:965D  db 96 40 96 64 96 64 96 68 96 2c 37 6c 96 f2 97 70
4:966D  db 96 3c 37 74 96 40 37 78 96 44 37 7c 96 48 37 80
4:967D  db 96 4c 37 88 96 7a 6a 90 96 98 96 8c 96 50 37 94
4:968D  db 96 76 6a b4 95 60 9c 98 96 58 37 9c 96 24 63 a0
4:969D  db 96 4e 9c a4 96 62 37 a8 96 4a 9c ac 96 66 37 b0
4:96AD  db 96 6a 37 b4 96 4a 6a b8 96 2e 6b bc 96 02 6b c0
4:96BD  db 96 7a 37 c4 96 52 9c c8 96 56 9c cc 96 16 9c d0
4:96CD  db 96 30 9c d4 96 86 9c d8 96 c4 9c dc 96 e0 9c e0
4:96DD  db 96 8e 62 e4 96 28 63 e8 96 2c 63 b8 95 7e 87 20
4:96ED  db 97 ea 68 f4 96 60 97 f8 96 c6 68 fc 96 40 96 00
4:96FD  db 97 64 96 04 97 2c 37 08 97 f2 97 0c 97 3c 37 10
4:970D  db 97 40 37 14 97 44 37 18 97 48 37 1c 97 4c 37 24
4:971D  db 97 7a 6a 2c 97 98 96 28 97 50 37 30 97 76 6a 50
4:972D  db 96 60 9c 34 97 58 37 38 97 24 63 3c 97 4e 9c 40
4:973D  db 97 62 37 44 97 4a 9c 48 97 66 37 4c 97 6a 37 50
4:974D  db 97 4a 6a 54 97 2e 6b 58 97 02 6b 5c 97 7a 37 60
4:975D  db 97 52 9c 64 97 56 9c 68 97 16 9c 6c 97 30 9c 70
4:976D  db 97 86 9c 74 97 c4 9c 78 97 e0 9c 7c 97 8e 62 80
4:977D  db 97 28 63 84 97 2c 63 54 96 66 8d bc 97 ea 68 90
4:978D  db 97 60 97 94 97 c6 68 98 97 40 96 9c 97 64 96 a0
4:979D  db 97 2c 37 a4 97 f2 97 a8 97 3c 37 ac 97 40 37 b0
4:97AD  db 97 44 37 b4 97 48 37 b8 97 4c 37 c0 97 7a 6a c8
4:97BD  db 97 98 96 c4 97 50 37 cc 97 76 6a ec 96 60 9c d0
4:97CD  db 97 58 37 d4 97 24 63 d8 97 4e 9c dc 97 62 37 e0
4:97DD  db 97 4a 9c e4 97 66 37 e8 97 6a 37 ec 97 4a 6a f0
4:97ED  db 97 2e 6b f4 97 02 6b f8 97 7a 37 fc 97 52 9c 00
4:97FD  db 98 56 9c 04 98 16 9c 08 98 30 9c 0c 98 86 9c 10
4:980D  db 98 c4 9c 14 98 e0 9c 18 98 8e 62 1c 98 28 63 20
4:981D  db 98 2c 63 f0 96 36 7e 58 98 ea 68 2c 98 60 97 30
4:982D  db 98 c6 68 34 98 40 96 38 98 64 96 3c 98 2c 37 40
4:983D  db 98 f2 97 44 98 3c 37 48 98 40 37 4c 98 44 37 50
4:984D  db 98 48 37 54 98 4c 37 5c 98 7a 6a 64 98 98 96 60
4:985D  db 98 50 37 68 98 76 6a 88 97 60 9c 6c 98 58 37 70
4:986D  db 98 24 63 74 98 4e 9c 78 98 62 37 7c 98 4a 9c 80
4:987D  db 98 66 37 84 98 6a 37 88 98 4a 6a 8c 98 2e 6b 90
4:988D  db 98 02 6b 94 98 7a 37 98 98 52 9c 9c 98 56 9c a0
4:989D  db 98 16 9c a4 98 30 9c a8 98 86 9c ac 98 c4 9c b0
4:98AD  db 98 e0 9c b4 98 8e 62 b8 98 28 63 bc 98 2c 63 8c
4:98BD  db 97 86 85 f4 98 ea 68 c8 98 60 97 cc 98 c6 68 d0
4:98CD  db 98 40 96 d4 98 64 96 d8 98 2c 37 dc 98 f2 97 e0
4:98DD  db 98 3c 37 e4 98 40 37 e8 98 44 37 ec 98 48 37 f0
4:98ED  db 98 4c 37 f8 98 7a 6a 00 99 98 96 fc 98 50 37 04
4:98FD  db 99 76 6a 24 98 60 9c 08 99 58 37 0c 99 24 63 10
4:990D  db 99 4e 9c 14 99 62 37 18 99 4a 9c 1c 99 66 37 20
4:991D  db 99 6a 37 24 99 4a 6a 28 99 2e 6b 2c 99 02 6b 30
4:992D  db 99 7a 37 34 99 52 9c 38 99 56 9c 3c 99 16 9c 40
4:993D  db 99 30 9c 44 99 86 9c 48 99 c4 9c 4c 99 e0 9c 50
4:994D  db 99 8e 62 54 99 28 63 58 99 2c 63 28 98 1e 84 90
4:995D  db 99 ea 68 64 99 60 97 68 99 c6 68 6c 99 40 96 70
4:996D  db 99 64 96 74 99 2c 37 78 99 f2 97 7c 99 3c 37 80
4:997D  db 99 40 37 84 99 44 37 88 99 48 37 8c 99 4c 37 94
4:998D  db 99 7a 6a 9c 99 98 96 98 99 50 37 a0 99 76 6a c0
4:999D  db 98 60 9c a4 99 58 37 a8 99 24 63 ac 99 4e 9c b0
4:99AD  db 99 62 37 b4 99 4a 9c b8 99 66 37 bc 99 6a 37 c0
4:99BD  db 99 4a 6a c4 99 2e 6b c8 99 02 6b cc 99 7a 37 d0
4:99CD  db 99 52 9c d4 99 56 9c d8 99 16 9c dc 99 30 9c e0
4:99DD  db 99 86 9c e4 99 c4 9c e8 99 e0 9c ec 99 8e 62 f0
4:99ED  db 99 28 63 f4 99 2c 63 c4 98 2e 92 2c 9a ea 68 00
4:99FD  db 9a 60 97 04 9a c6 68 08 9a 40 96 0c 9a 64 96 10
4:9A0D  db 9a 2c 37 14 9a f2 97 18 9a 3c 37 1c 9a 40 37 20
4:9A1D  db 9a 44 37 24 9a 48 37 28 9a 4c 37 30 9a 7a 6a 38
4:9A2D  db 9a 98 96 34 9a 50 37 3c 9a 76 6a 5c 99 60 9c 40
4:9A3D  db 9a 58 37 44 9a 24 63 48 9a 4e 9c 4c 9a 62 37 50
4:9A4D  db 9a 4a 9c 54 9a 66 37 58 9a 6a 37 5c 9a 4a 6a 60
4:9A5D  db 9a 2e 6b 64 9a 02 6b 68 9a 7a 37 6c 9a 52 9c 70
4:9A6D  db 9a 56 9c 74 9a 16 9c 78 9a 30 9c 7c 9a 86 9c 80
4:9A7D  db 9a c4 9c 84 9a e0 9c 88 9a 8e 62 8c 9a 28 63 90
4:9A8D  db 9a 2c 63 60 99 46 83 c8 9a ea 68 9c 9a 60 97 a0
4:9A9D  db 9a c6 68 a4 9a 40 96 a8 9a 64 96 ac 9a 2c 37 b0
4:9AAD  db 9a f2 97 b4 9a 3c 37 b8 9a 40 37 bc 9a 44 37 c0
4:9ABD  db 9a 48 37 c4 9a 4c 37 cc 9a 7a 6a d4 9a 98 96 d0
4:9ACD  db 9a 50 37 d8 9a 76 6a f8 99 60 9c dc 9a 58 37 e0
4:9ADD  db 9a 24 63 e4 9a 4e 9c e8 9a 62 37 ec 9a 4a 9c f0
4:9AED  db 9a 66 37 f4 9a 6a 37 f8 9a 4a 6a fc 9a 2e 6b 00
4:9AFD  db 9b 02 6b 04 9b 7a 37 08 9b 52 9c 0c 9b 56 9c 10
4:9B0D  db 9b 16 9c 14 9b 30 9c 18 9b 86 9c 1c 9b c4 9c 20
4:9B1D  db 9b e0 9c 24 9b 8e 62 28 9b 28 63 2c 9b 2c 63 fc
4:9B2D  db 99 26 8b 64 9b ea 68 38 9b 60 97 3c 9b c6 68 40
4:9B3D  db 9b 40 96 44 9b 64 96 48 9b 2c 37 4c 9b f2 97 50
4:9B4D  db 9b 3c 37 54 9b 40 37 58 9b 44 37 5c 9b 48 37 60
4:9B5D  db 9b 4c 37 68 9b 7a 6a 70 9b 98 96 6c 9b 50 37 74
4:9B6D  db 9b 76 6a 94 9a 60 9c 78 9b 58 37 7c 9b 24 63 80
4:9B7D  db 9b 4e 9c 84 9b 62 37 88 9b 4a 9c 8c 9b 66 37 90
4:9B8D  db 9b 6a 37 94 9b 4a 6a 98 9b 2e 6b 9c 9b 02 6b a0
4:9B9D  db 9b 7a 37 a4 9b 52 9c a8 9b 56 9c ac 9b 16 9c b0
4:9BAD  db 9b 30 9c b4 9b 86 9c b8 9b c4 9c bc 9b e0 9c c0
4:9BBD  db 9b 8e 62 c4 9b 28 63 c8 9b 2c 63 98 9a 0e 91 00
4:9BCD  db 9c ea 68 d4 9b 60 97 d8 9b c6 68 dc 9b 40 96 e0
4:9BDD  db 9b 64 96 e4 9b 2c 37 e8 9b f2 97 ec 9b 3c 37 f0
4:9BED  db 9b 40 37 f4 9b 44 37 f8 9b 48 37 fc 9b 4c 37 04
4:9BFD  db 9c 7a 6a 0c 9c 98 96 08 9c 50 37 10 9c 76 6a 30
4:9C0D  db 9b 60 9c 14 9c 58 37 18 9c 24 63 1c 9c 4e 9c 20
4:9C1D  db 9c 62 37 24 9c 4a 9c 28 9c 66 37 2c 9c 6a 37 30
4:9C2D  db 9c 4a 6a 34 9c 2e 6b 38 9c 02 6b 3c 9c 7a 37 40
4:9C3D  db 9c 52 9c 44 9c 56 9c 48 9c 16 9c 4c 9c 30 9c 50
4:9C4D  db 9c 86 9c 54 9c c4 9c 58 9c e0 9c 5c 9c 8e 62 60
4:9C5D  db 9c 28 63 64 9c 2c 63 34 9b de 81 9c 9c ea 68 70
4:9C6D  db 9c 60 97 74 9c c6 68 78 9c 40 96 7c 9c 64 96 80
4:9C7D  db 9c 2c 37 84 9c f2 97 88 9c 3c 37 8c 9c 40 37 90
4:9C8D  db 9c 44 37 94 9c 48 37 98 9c 4c 37 a0 9c 7a 6a a8
4:9C9D  db 9c 98 96 a4 9c 50 37 ac 9c 76 6a cc 9b 60 9c b0
4:9CAD  db 9c 58 37 b4 9c 24 63 b8 9c 4e 9c bc 9c 62 37 c0
4:9CBD  db 9c 4a 9c c4 9c 66 37 c8 9c 6a 37 cc 9c 4a 6a d0
4:9CCD  db 9c 2e 6b d4 9c 02 6b d8 9c 7a 37 dc 9c 52 9c e0
4:9CDD  db 9c 56 9c e4 9c 16 9c e8 9c 30 9c ec 9c 86 9c f0
4:9CED  db 9c c4 9c f4 9c e0 9c f8 9c 8e 62 fc 9c 28 63 00
4:9CFD  db 9d 2c 63 d0 9b be 89 38 9d ea 68 0c 9d 60 97 10
4:9D0D  db 9d c6 68 14 9d 40 96 18 9d 64 96 1c 9d 2c 37 20
4:9D1D  db 9d f2 97 24 9d 3c 37 28 9d 40 37 2c 9d 44 37 30
4:9D2D  db 9d 48 37 34 9d 4c 37 3c 9d 7a 6a 44 9d 98 96 40
4:9D3D  db 9d 50 37 48 9d 76 6a 68 9c 60 9c 4c 9d 58 37 50
4:9D4D  db 9d 24 63 54 9d 4e 9c 58 9d 62 37 5c 9d 4a 9c 60
4:9D5D  db 9d 66 37 64 9d 6a 37 68 9d 4a 6a 6c 9d 2e 6b 70
4:9D6D  db 9d 02 6b 74 9d 7a 37 78 9d 52 9c 7c 9d 56 9c 80
4:9D7D  db 9d 16 9c 84 9d 30 9c 88 9d 86 9c 8c 9d c4 9c 90
4:9D8D  db 9d e0 9c 94 9d 8e 62 98 9d 28 63 9c 9d 2c 63 6c
4:9D9D  db 9c a6 8f d4 9d ea 68 a8 9d 60 97 ac 9d c6 68 b0
4:9DAD  db 9d 40 96 b4 9d 64 96 b8 9d 2c 37 bc 9d f2 97 c0
4:9DBD  db 9d 3c 37 c4 9d 40 37 c8 9d 44 37 cc 9d 48 37 d0
4:9DCD  db 9d 4c 37 d8 9d 7a 6a e0 9d 98 96 dc 9d 50 37 e4
4:9DDD  db 9d 76 6a 04 9d 60 9c e8 9d 58 37 ec 9d 24 63 f0
4:9DED  db 9d 4e 9c f4 9d 62 37 f8 9d 4a 9c fc 9d 66 37 00
4:9DFD  db 9e 6a 37 04 9e 4a 6a 08 9e 2e 6b 0c 9e 02 6b 10
4:9E0D  db 9e 7a 37 14 9e 52 9c 18 9e 56 9c 1c 9e 16 9c 20
4:9E1D  db 9e 30 9c 24 9e 86 9c 28 9e c4 9c 2c 9e e0 9c 30
4:9E2D  db 9e 8e 62 34 9e 28 63 38 9e 2c 63 08 9d 76 80 70
4:9E3D  db 9e ea 68 44 9e 60 97 48 9e c6 68 4c 9e 40 96 50
4:9E4D  db 9e 64 96 54 9e 2c 37 58 9e f2 97 5c 9e 3c 37 60
4:9E5D  db 9e 40 37 64 9e 44 37 68 9e 48 37 6c 9e 4c 37 74
4:9E6D  db 9e 7a 6a 7c 9e 98 96 78 9e 50 37 80 9e 76 6a a0
4:9E7D  db 9d 60 9c 84 9e 58 37 88 9e 24 63 8c 9e 4e 9c 90
4:9E8D  db 9e 62 37 94 9e 4a 9c 98 9e 66 37 9c 9e 6a 37 a0
4:9E9D  db 9e 4a 6a a4 9e 2e 6b a8 9e 02 6b ac 9e 7a 37 b0
4:9EAD  db 9e 52 9c b4 9e 56 9c b8 9e 16 9c bc 9e 30 9c c0
4:9EBD  db 9e 86 9c c4 9e c4 9c c8 9e e0 9c cc 9e 8e 62 d0
4:9ECD  db 9e 28 63 d4 9e 2c 63 a4 9d be 92 0c 9f ea 68 e0
4:9EDD  db 9e 60 97 e4 9e c6 68 e8 9e 40 96 ec 9e 64 96 f0
4:9EED  db 9e 2c 37 f4 9e f2 97 f8 9e 3c 37 fc 9e 40 37 00
4:9EFD  db 9f 44 37 04 9f 48 37 08 9f 4c 37 10 9f 7a 6a 18
4:9F0D  db 9f 98 96 14 9f 50 37 1c 9f 76 6a 3c 9e 60 9c 20
4:9F1D  db 9f 58 37 24 9f 24 63 28 9f 4e 9c 2c 9f 62 37 30
4:9F2D  db 9f 4a 9c 34 9f 66 37 38 9f 6a 37 3c 9f 4a 6a 40
4:9F3D  db 9f 2e 6b 44 9f 02 6b 48 9f 7a 37 4c 9f 52 9c 50
4:9F4D  db 9f 56 9c 54 9f 16 9c 58 9f 30 9c 5c 9f 86 9c 60
4:9F5D  db 9f c4 9c 64 9f e0 9c 68 9f 8e 62 6c 9f 28 63 70
4:9F6D  db 9f 2c 63 40 9e 56 88 a8 9f ea 68 7c 9f 60 97 80
4:9F7D  db 9f c6 68 84 9f 40 96 88 9f 64 96 8c 9f 2c 37 90
4:9F8D  db 9f f2 97 94 9f 3c 37 98 9f 40 37 9c 9f 44 37 a0
4:9F9D  db 9f 48 37 a4 9f 4c 37 ac 9f 7a 6a b4 9f 98 96 b0
4:9FAD  db 9f 50 37 b8 9f 76 6a d8 9e 60 9c bc 9f 58 37 c0
4:9FBD  db 9f 24 63 c4 9f 4e 9c c8 9f 62 37 cc 9f 4a 9c d0
4:9FCD  db 9f 66 37 d4 9f 6a 37 d8 9f 4a 6a dc 9f 2e 6b e0
4:9FDD  db 9f 02 6b e4 9f 7a 37 e8 9f 52 9c ec 9f 56 9c f0
4:9FED  db 9f 16 9c f4 9f 30 9c f8 9f 86 9c fc 9f c4 9c 00
4:9FFD  db a0 e0 9c 04 a0 8e 62 08 a0 28 63 0c a0 2c 63 dc
4:A00D  db 9e 3e 8e 44 a0 ea 68 18 a0 60 97 1c a0 c6 68 20
4:A01D  db a0 40 96 24 a0 64 96 28 a0 2c 37 2c a0 f2 97 30
4:A02D  db a0 3c 37 34 a0 40 37 38 a0 44 37 3c a0 48 37 40
4:A03D  db a0 4c 37 48 a0 7a 6a 50 a0 98 96 4c a0 50 37 54
4:A04D  db a0 76 6a 74 9f 60 9c 58 a0 58 37 5c a0 24 63 60
4:A05D  db a0 4e 9c 64 a0 62 37 68 a0 4a 9c 6c a0 66 37 70
4:A06D  db a0 6a 37 74 a0 4a 6a 78 a0 2e 6b 7c a0 02 6b 80
4:A07D  db a0 7a 37 84 a0 52 9c 88 a0 56 9c 8c a0 16 9c 90
4:A08D  db a0 30 9c 94 a0 86 9c 98 a0 c4 9c 9c a0 e0 9c a0
4:A09D  db a0 8e 62 a4 a0 28 63 a8 a0 2c 63 78 9f 0e 7f e0
4:A0AD  db a0 ea 68 b4 a0 60 97 b8 a0 c6 68 bc a0 40 96 c0
4:A0BD  db a0 64 96 c4 a0 2c 37 c8 a0 f2 97 cc a0 3c 37 d0
4:A0CD  db a0 40 37 d4 a0 44 37 d8 a0 48 37 dc a0 4c 37 e4
4:A0DD  db a0 7a 6a ec a0 98 96 e8 a0 50 37 f0 a0 76 6a 10
4:A0ED  db a0 60 9c f4 a0 58 37 f8 a0 24 63 fc a0 4e 9c 00
4:A0FD  db a1 62 37 04 a1 4a 9c 08 a1 66 37 0c a1 6a 37 10
4:A10D  db a1 4a 6a 14 a1 2e 6b 18 a1 02 6b 1c a1 7a 37 20
4:A11D  db a1 52 9c 24 a1 56 9c 28 a1 16 9c 2c a1 30 9c 30
4:A12D  db a1 86 9c 34 a1 c4 9c 38 a1 e0 9c 3c a1 8e 62 40
4:A13D  db a1 28 63 44 a1 2c 63 14 a0 ee 86 7c a1 ea 68 50
4:A14D  db a1 60 97 54 a1 c6 68 58 a1 40 96 5c a1 64 96 60
4:A15D  db a1 2c 37 64 a1 f2 97 68 a1 3c 37 6c a1 40 37 70
4:A16D  db a1 44 37 74 a1 48 37 78 a1 4c 37 80 a1 2e 74 88
4:A17D  db a1 98 96 84 a1 50 37 8c a1 76 6a ac a0 60 9c 90
4:A18D  db a1 58 37 94 a1 24 63 98 a1 4e 9c 9c a1 62 37 a0
4:A19D  db a1 4a 9c a4 a1 66 37 a8 a1 6a 37 ac a1 4a 6a b0
4:A1AD  db a1 2e 6b b4 a1 02 6b b8 a1 7a 37 bc a1 52 9c c0
4:A1BD  db a1 56 9c c4 a1 16 9c c8 a1 30 9c cc a1 86 9c d0
4:A1CD  db a1 c4 9c d4 a1 e0 9c d8 a1 8e 62 dc a1 28 63 e0
4:A1DD  db a1 2c 63 b0 a0 d6 8c 18 a2 ea 68 ec a1 60 97 f0
4:A1ED  db a1 c6 68 f4 a1 40 96 f8 a1 64 96 fc a1 2c 37 00
4:A1FD  db a2 f2 97 04 a2 3c 37 08 a2 40 37 0c a2 44 37 10
4:A20D  db a2 48 37 14 a2 4c 37 1c a2 7a 6a 24 a2 98 96 20
4:A21D  db a2 50 37 28 a2 76 6a 48 a1 60 9c 2c a2 58 37 30
4:A22D  db a2 24 63 34 a2 4e 9c 38 a2 62 37 3c a2 4a 9c 40
4:A23D  db a2 66 37 44 a2 6a 37 48 a2 4a 6a 4c a2 2e 6b 50
4:A24D  db a2 02 6b 54 a2 7a 37 58 a2 52 9c 5c a2 56 9c 60
4:A25D  db a2 16 9c 64 a2 30 9c 68 a2 86 9c 6c a2 c4 9c 70
4:A26D  db a2 e0 9c 74 a2 8e 62 78 a2 28 63 7c a2 2c 63 4c
4:A27D  db a1 a6 7d b4 a2 ea 68 88 a2 60 97 8c a2 c6 68 90
4:A28D  db a2 40 96 94 a2 64 96 98 a2 2c 37 9c a2 f2 97 a0
4:A29D  db a2 3c 37 a4 a2 40 37 a8 a2 44 37 ac a2 48 37 b0
4:A2AD  db a2 4c 37 b8 a2 7a 6a c0 a2 98 96 bc a2 50 37 c4
4:A2BD  db a2 76 6a e4 a1 60 9c c8 a2 58 37 cc a2 24 63 d0
4:A2CD  db a2 4e 9c d4 a2 62 37 d8 a2 4a 9c dc a2 66 37 e0
4:A2DD  db a2 6a 37 e4 a2 4a 6a e8 a2 2e 6b ec a2 02 6b f0
4:A2ED  db a2 7a 37 f4 a2 52 9c f8 a2 56 9c fc a2 16 9c 00
4:A2FD  db a3 30 9c 04 a3 86 9c 08 a3 c4 9c 0c a3 e0 9c 10
4:A30D  db a3 8e 62 14 a3 28 63 18 a3 2c 63 e8 a1 f6 84 50
4:A31D  db a3 ea 68 24 a3 60 97 28 a3 c6 68 2c a3 40 96 30
4:A32D  db a3 64 96 34 a3 2c 37 38 a3 f2 97 3c a3 3c 37 40
4:A33D  db a3 40 37 44 a3 44 37 48 a3 48 37 4c a3 4c 37 54
4:A34D  db a3 7a 6a 5c a3 98 96 58 a3 50 37 60 a3 76 6a 80
4:A35D  db a2 60 9c 64 a3 58 37 68 a3 24 63 6c a3 4e 9c 70
4:A36D  db a3 62 37 74 a3 4a 9c 78 a3 66 37 7c a3 6a 37 80
4:A37D  db a3 4a 6a 84 a3 2e 6b 88 a3 02 6b 8c a3 7a 37 90
4:A38D  db a3 52 9c 94 a3 56 9c 98 a3 16 9c 9c a3 30 9c a0
4:A39D  db a3 86 9c a4 a3 c4 9c a8 a3 e0 9c ac a3 8e 62 b0
4:A3AD  db a3 28 63 b4 a3 2c 63 84 a2 fe 8b ec a3 ea 68 c0
4:A3BD  db a3 60 97 c4 a3 c6 68 c8 a3 40 96 cc a3 64 96 d0
4:A3CD  db a3 2c 37 d4 a3 f2 97 d8 a3 3c 37 dc a3 40 37 e0
4:A3DD  db a3 44 37 e4 a3 48 37 e8 a3 4c 37 f0 a3 7a 6a f8
4:A3ED  db a3 98 96 f4 a3 50 37 fc a3 76 6a 1c a3 60 9c 00
4:A3FD  db a4 58 37 04 a4 24 63 08 a4 4e 9c 0c a4 62 37 10
4:A40D  db a4 4a 9c 14 a4 66 37 18 a4 6a 37 1c a4 4a 6a 20
4:A41D  db a4 2e 6b 24 a4 02 6b 28 a4 7a 37 2c a4 52 9c 30
4:A42D  db a4 56 9c 34 a4 16 9c 38 a4 30 9c 3c a4 86 9c 40
4:A43D  db a4 c4 9c 44 a4 e0 9c 48 a4 8e 62 4c a4 28 63 50
4:A44D  db a4 2c 63 20 a3 66 84 88 a4 ea 68 5c a4 60 97 60
4:A45D  db a4 c6 68 64 a4 40 96 68 a4 64 96 6c a4 2c 37 70
4:A46D  db a4 f2 97 74 a4 3c 37 78 a4 40 37 7c a4 44 37 80
4:A47D  db a4 48 37 84 a4 4c 37 8c a4 7a 6a 94 a4 98 96 90
4:A48D  db a4 50 37 98 a4 76 6a b8 a3 60 9c 9c a4 58 37 a0
4:A49D  db a4 24 63 a4 a4 4e 9c a8 a4 62 37 ac a4 4a 9c b0
4:A4AD  db a4 66 37 b4 a4 6a 37 b8 a4 4a 6a bc a4 2e 6b c0
4:A4BD  db a4 02 6b c4 a4 7a 37 c8 a4 52 9c cc a4 56 9c d0
4:A4CD  db a4 16 9c d4 a4 30 9c d8 a4 86 9c dc a4 c4 9c e0
4:A4DD  db a4 e0 9c e4 a4 8e 62 e8 a4 28 63 ec a4 2c 63 bc
4:A4ED  db a3 b6 82 24 a5 ea 68 f8 a4 60 97 fc a4 c6 68 00
4:A4FD  db a5 40 96 04 a5 64 96 08 a5 2c 37 0c a5 f2 97 10
4:A50D  db a5 3c 37 14 a5 40 37 18 a5 44 37 1c a5 48 37 20
4:A51D  db a5 4c 37 28 a5 7a 6a 30 a5 98 96 2c a5 50 37 34
4:A52D  db a5 76 6a 54 a4 60 9c 38 a5 58 37 3c a5 24 63 40
4:A53D  db a5 4e 9c 44 a5 62 37 48 a5 4a 9c 4c a5 66 37 50
4:A54D  db a5 6a 37 54 a5 4a 6a 58 a5 2e 6b 5c a5 02 6b 60
4:A55D  db a5 7a 37 64 a5 52 9c 68 a5 56 9c 6c a5 16 9c 70
4:A56D  db a5 30 9c 74 a5 86 9c 78 a5 c4 9c 7c a5 e0 9c 80
4:A57D  db a5 8e 62 84 a5 28 63 88 a5 2c 63 58 a4 96 8a c0
4:A58D  db a5 ea 68 94 a5 60 97 98 a5 c6 68 9c a5 40 96 a0
4:A59D  db a5 64 96 a4 a5 2c 37 a8 a5 f2 97 ac a5 3c 37 b0
4:A5AD  db a5 40 37 b4 a5 44 37 b8 a5 48 37 bc a5 4c 37 c4
4:A5BD  db a5 7a 6a cc a5 98 96 c8 a5 50 37 d0 a5 76 6a f0
4:A5CD  db a4 60 9c d4 a5 58 37 d8 a5 24 63 dc a5 4e 9c e0
4:A5DD  db a5 62 37 e4 a5 4a 9c e8 a5 66 37 ec a5 6a 37 f0
4:A5ED  db a5 4a 6a f4 a5 2e 6b f8 a5 02 6b fc a5 7a 37 00
4:A5FD  db a6 52 9c 04 a6 56 9c 08 a6 16 9c 0c a6 30 9c 10
4:A60D  db a6 86 9c 14 a6 c4 9c 18 a6 e0 9c 1c a6 8e 62 20
4:A61D  db a6 28 63 24 a6 2c 63 f4 a4 7e 90 5c a6 ea 68 30
4:A62D  db a6 60 97 34 a6 c6 68 38 a6 40 96 3c a6 64 96 40
4:A63D  db a6 2c 37 44 a6 f2 97 48 a6 3c 37 4c a6 40 37 50
4:A64D  db a6 44 37 54 a6 48 37 58 a6 4c 37 60 a6 7a 6a 68
4:A65D  db a6 98 96 64 a6 50 37 6c a6 76 6a 8c a5 60 9c 70
4:A66D  db a6 58 37 74 a6 24 63 78 a6 4e 9c 7c a6 62 37 80
4:A67D  db a6 4a 9c 84 a6 66 37 88 a6 6a 37 8c a6 4a 6a 90
4:A68D  db a6 2e 6b 94 a6 02 6b 98 a6 7a 37 9c a6 52 9c a0
4:A69D  db a6 56 9c a4 a6 16 9c a8 a6 30 9c ac a6 86 9c b0
4:A6AD  db a6 c4 9c b4 a6 e0 9c b8 a6 8e 62 bc a6 28 63 c0
4:A6BD  db a6 2c 63 90 a5 4e 81 f8 a6 ea 68 cc a6 60 97 d0
4:A6CD  db a6 c6 68 d4 a6 40 96 d8 a6 64 96 dc a6 2c 37 e0
4:A6DD  db a6 f2 97 e4 a6 3c 37 e8 a6 40 37 ec a6 44 37 f0
4:A6ED  db a6 48 37 f4 a6 4c 37 fc a6 7a 6a 04 a7 98 96 00
4:A6FD  db a7 50 37 08 a7 76 6a 28 a6 60 9c 0c a7 58 37 10
4:A70D  db a7 24 63 14 a7 4e 9c 18 a7 62 37 1c a7 4a 9c 20
4:A71D  db a7 66 37 24 a7 6a 37 28 a7 4a 6a 2c a7 2e 6b 30
4:A72D  db a7 02 6b 34 a7 7a 37 38 a7 52 9c 3c a7 56 9c 40
4:A73D  db a7 16 9c 44 a7 30 9c 48 a7 86 9c 4c a7 c4 9c 50
4:A74D  db a7 e0 9c 54 a7 8e 62 58 a7 28 63 5c a7 2c 63 2c
4:A75D  db a6 96 93 94 a7 ea 68 68 a7 60 97 6c a7 c6 68 70
4:A76D  db a7 40 96 74 a7 64 96 78 a7 2c 37 7c a7 f2 97 80
4:A77D  db a7 3c 37 84 a7 40 37 88 a7 44 37 8c a7 48 37 90
4:A78D  db a7 4c 37 98 a7 7a 6a a0 a7 98 96 9c a7 50 37 a4
4:A79D  db a7 76 6a c4 a6 60 9c a8 a7 58 37 ac a7 24 63 b0
4:A7AD  db a7 4e 9c b4 a7 62 37 b8 a7 4a 9c bc a7 66 37 c0
4:A7BD  db a7 6a 37 c4 a7 4a 6a c8 a7 2e 6b cc a7 02 6b d0
4:A7CD  db a7 7a 37 d4 a7 52 9c d8 a7 56 9c dc a7 16 9c e0
4:A7DD  db a7 30 9c e4 a7 86 9c e8 a7 c4 9c ec a7 e0 9c f0
4:A7ED  db a7 8e 62 f4 a7 28 63 f8 a7 2c 63 c8 a6 2e 89 30
4:A7FD  db a8 ea 68 04 a8 60 97 08 a8 c6 68 0c a8 40 96 10
4:A80D  db a8 64 96 14 a8 2c 37 18 a8 f2 97 1c a8 3c 37 20
4:A81D  db a8 40 37 24 a8 44 37 28 a8 48 37 2c a8 4c 37 34
4:A82D  db a8 7a 6a 3c a8 98 96 38 a8 50 37 40 a8 76 6a 60
4:A83D  db a7 60 9c 44 a8 58 37 48 a8 24 63 4c a8 4e 9c 50
4:A84D  db a8 62 37 54 a8 4a 9c 58 a8 66 37 5c a8 6a 37 60
4:A85D  db a8 4a 6a 64 a8 2e 6b 68 a8 02 6b 6c a8 7a 37 70
4:A86D  db a8 52 9c 74 a8 56 9c 78 a8 16 9c 7c a8 30 9c 80
4:A87D  db a8 86 9c 84 a8 c4 9c 88 a8 e0 9c 8c a8 8e 62 90
4:A88D  db a8 28 63 94 a8 2c 63 64 a7 16 8f cc a8 ea 68 a0
4:A89D  db a8 60 97 a4 a8 c6 68 a8 a8 40 96 ac a8 64 96 b0
4:A8AD  db a8 2c 37 b4 a8 f2 97 b8 a8 3c 37 bc a8 40 37 c0
4:A8BD  db a8 44 37 c4 a8 48 37 c8 a8 4c 37 d0 a8 7a 6a d8
4:A8CD  db a8 98 96 d4 a8 50 37 dc a8 76 6a fc a7 60 9c e0
4:A8DD  db a8 58 37 e4 a8 24 63 e8 a8 4e 9c ec a8 62 37 f0
4:A8ED  db a8 4a 9c f4 a8 66 37 f8 a8 6a 37 fc a8 4a 6a 00
4:A8FD  db a9 2e 6b 04 a9 02 6b 08 a9 7a 37 0c a9 52 9c 10
4:A90D  db a9 56 9c 14 a9 16 9c 18 a9 30 9c 1c a9 86 9c 20
4:A91D  db a9 c4 9c 24 a9 e0 9c 28 a9 8e 62 2c a9 28 63 30
4:A92D  db a9 2c 63 00 a8 e6 7f 68 a9 ea 68 3c a9 60 97 40
4:A93D  db a9 c6 68 44 a9 40 96 48 a9 64 96 4c a9 2c 37 50
4:A94D  db a9 f2 97 54 a9 3c 37 58 a9 40 37 5c a9 44 37 60
4:A95D  db a9 48 37 64 a9 4c 37 6c a9 7a 6a 74 a9 98 96 70
4:A96D  db a9 50 37 78 a9 76 6a 98 a8 60 9c 7c a9 58 37 80
4:A97D  db a9 24 63 84 a9 4e 9c 88 a9 62 37 8c a9 4a 9c 90
4:A98D  db a9 66 37 94 a9 6a 37 98 a9 4a 6a 9c a9 2e 6b a0
4:A99D  db a9 02 6b a4 a9 7a 37 a8 a9 52 9c ac a9 56 9c b0
4:A9AD  db a9 16 9c b4 a9 30 9c b8 a9 86 9c bc a9 c4 9c c0
4:A9BD  db a9 e0 9c c4 a9 8e 62 c8 a9 28 63 cc a9 2c 63 9c
4:A9CD  db a8 c6 87 04 aa ea 68 d8 a9 60 97 dc a9 c6 68 e0
4:A9DD  db a9 40 96 e4 a9 64 96 e8 a9 2c 37 ec a9 f2 97 f0
4:A9ED  db a9 3c 37 f4 a9 40 37 f8 a9 44 37 fc a9 48 37 00
4:A9FD  db aa 4c 37 08 aa 7a 6a 10 aa 98 96 0c aa 50 37 14
4:AA0D  db aa 76 6a 34 a9 60 9c 18 aa 58 37 1c aa 24 63 20
4:AA1D  db aa 4e 9c 24 aa 62 37 28 aa 4a 9c 2c aa 66 37 30
4:AA2D  db aa 6a 37 34 aa 4a 6a 38 aa 2e 6b 3c aa 02 6b 40
4:AA3D  db aa 7a 37 44 aa 52 9c 48 aa 56 9c 4c aa 16 9c 50
4:AA4D  db aa 30 9c 54 aa 86 9c 58 aa c4 9c 5c aa e0 9c 60
4:AA5D  db aa 8e 62 64 aa 28 63 68 aa 2c 63 38 a9 ae 8d a0
4:AA6D  db aa ea 68 74 aa 60 97 78 aa c6 68 7c aa 40 96 80
4:AA7D  db aa 64 96 84 aa 2c 37 88 aa f2 97 8c aa 3c 37 90
4:AA8D  db aa 40 37 94 aa 44 37 98 aa 48 37 9c aa 4c 37 a4
4:AA9D  db aa 7a 6a ac aa 98 96 a8 aa 50 37 b0 aa 76 6a d0
4:AAAD  db a9 60 9c b4 aa 58 37 b8 aa 24 63 bc aa 4e 9c c0
4:AABD  db aa 62 37 c4 aa 4a 9c c8 aa 66 37 cc aa 6a 37 d0
4:AACD  db aa 4a 6a d4 aa 2e 6b d8 aa 02 6b dc aa 7a 37 e0
4:AADD  db aa 52 9c e4 aa 56 9c e8 aa 16 9c ec aa 30 9c f0
4:AAED  db aa 86 9c f4 aa c4 9c f8 aa e0 9c fc aa 8e 62 00
4:AAFD  db ab 28 63 04 ab 2c 63 d4 a9 7e 7e 3c ab ea 68 10
4:AB0D  db ab 60 97 14 ab c6 68 18 ab 40 96 1c ab 64 96 20
4:AB1D  db ab 2c 37 24 ab f2 97 28 ab 3c 37 2c ab 40 37 30
4:AB2D  db ab 44 37 34 ab 48 37 38 ab 4c 37 40 ab 7a 6a 48
4:AB3D  db ab 98 96 44 ab 50 37 4c ab 76 6a 6c aa 60 9c 50
4:AB4D  db ab 58 37 54 ab 24 63 58 ab 4e 9c 5c ab 62 37 60
4:AB5D  db ab 4a 9c 64 ab 66 37 68 ab 6a 37 6c ab 4a 6a 70
4:AB6D  db ab 2e 6b 74 ab 02 6b 78 ab 7a 37 7c ab 52 9c 80
4:AB7D  db ab 56 9c 84 ab 16 9c 88 ab 30 9c 8c ab 86 9c 90
4:AB8D  db ab c4 9c 94 ab e0 9c 98 ab 8e 62 9c ab 28 63 a0
4:AB9D  db ab 2c 63 70 aa ce 85 d8 ab ea 68 ac ab 60 97 b0
4:ABAD  db ab c6 68 b4 ab 40 96 b8 ab 64 96 bc ab 2c 37 c0
4:ABBD  db ab f2 97 c4 ab 3c 37 c8 ab 40 37 cc ab 44 37 d0
4:ABCD  db ab 48 37 d4 ab 4c 37 dc ab 7a 6a e4 ab 98 96 e0
4:ABDD  db ab 50 37 e8 ab 76 6a 08 ab 60 9c ec ab 58 37 f0
4:ABED  db ab 24 63 f4 ab 4e 9c f8 ab 62 37 fc ab 4a 9c 00
4:ABFD  db ac 66 37 04 ac 6a 37 08 ac 4a 6a 0c ac 2e 6b 10
4:AC0D  db ac 02 6b 14 ac 7a 37 18 ac 52 9c 1c ac 56 9c 20
4:AC1D  db ac 16 9c 24 ac 30 9c 28 ac 86 9c 2c ac c4 9c 30
4:AC2D  db ac e0 9c 34 ac 8e 62 38 ac 28 63 3c ac 2c 63 0c
4:AC3D  db ab 5e 86 74 ac ea 68 48 ac 60 97 4c ac c6 68 50
4:AC4D  db ac 40 96 54 ac 64 96 58 ac 2c 37 5c ac f2 97 60
4:AC5D  db ac 3c 37 64 ac 40 37 68 ac 44 37 6c ac 48 37 70
4:AC6D  db ac 4c 37 78 ac 7a 6a 80 ac 98 96 7c ac 50 37 84
4:AC7D  db ac 76 6a a4 ab 60 9c 88 ac 58 37 8c ac 24 63 90
4:AC8D  db ac 4e 9c 94 ac 62 37 98 ac 4a 9c 9c ac 66 37 a0
4:AC9D  db ac 6a 37 a4 ac 4a 6a a8 ac 2e 6b ac ac 02 6b b0
4:ACAD  db ac 7a 37 b4 ac 52 9c b8 ac 56 9c bc ac 16 9c c0
4:ACBD  db ac 30 9c c4 ac 86 9c c8 ac c4 9c cc ac e0 9c d0
4:ACCD  db ac 8e 62 d4 ac 28 63 d8 ac 2c 63 a8 ab 46 8c 10
4:ACDD  db ad ea 68 e4 ac 60 97 e8 ac c6 68 ec ac 40 96 f0
4:ACED  db ac 64 96 f4 ac 2c 37 f8 ac f2 97 fc ac 3c 37 00
4:ACFD  db ad 40 37 04 ad 44 37 08 ad 48 37 0c ad 4c 37 14
4:AD0D  db ad 7a 6a 1c ad 98 96 18 ad 50 37 20 ad 76 6a 40
4:AD1D  db ac 60 9c 24 ad 58 37 28 ad 24 63 2c ad 4e 9c 30
4:AD2D  db ad 62 37 34 ad 4a 9c 38 ad 66 37 3c ad 6a 37 40
4:AD3D  db ad 4a 6a 44 ad 2e 6b 48 ad 02 6b 4c ad 7a 37 50
4:AD4D  db ad 52 9c 54 ad 56 9c 58 ad 16 9c 5c ad 30 9c 60
4:AD5D  db ad 86 9c 64 ad c4 9c 68 ad e0 9c 6c ad 8e 62 70
4:AD6D  db ad 28 63 74 ad 2c 63 44 ac 8e 83 ac ad ea 68 80
4:AD7D  db ad 60 97 84 ad c6 68 88 ad 40 96 8c ad 64 96 90
4:AD8D  db ad 2c 37 94 ad f2 97 98 ad 3c 37 9c ad 40 37 a0
4:AD9D  db ad 44 37 a4 ad 48 37 a8 ad 4c 37 b0 ad 7a 6a b8
4:ADAD  db ad 98 96 b4 ad 50 37 bc ad 76 6a dc ac 60 9c c0
4:ADBD  db ad 58 37 c4 ad 24 63 c8 ad 4e 9c cc ad 62 37 d0
4:ADCD  db ad 4a 9c d4 ad 66 37 d8 ad 6a 37 dc ad 4a 6a e0
4:ADDD  db ad 2e 6b e4 ad 02 6b e8 ad 7a 37 ec ad 52 9c f0
4:ADED  db ad 56 9c f4 ad 16 9c f8 ad 30 9c fc ad 86 9c 00
4:ADFD  db ae c4 9c 04 ae e0 9c 08 ae 8e 62 0c ae 28 63 10
4:AE0D  db ae 2c 63 e0 ac 6e 8b 48 ae ea 68 1c ae 60 97 20
4:AE1D  db ae c6 68 24 ae 40 96 28 ae 64 96 2c ae 2c 37 30
4:AE2D  db ae f2 97 34 ae 3c 37 38 ae 40 37 3c ae 44 37 40
4:AE3D  db ae 48 37 44 ae 4c 37 4c ae 7a 6a 54 ae 98 96 50
4:AE4D  db ae 50 37 58 ae 76 6a 78 ad 60 9c 5c ae 58 37 60
4:AE5D  db ae 24 63 64 ae 4e 9c 68 ae 62 37 6c ae 4a 9c 70
4:AE6D  db ae 66 37 74 ae 6a 37 78 ae 4a 6a 7c ae 2e 6b 80
4:AE7D  db ae 02 6b 84 ae 7a 37 88 ae 52 9c 8c ae 56 9c 90
4:AE8D  db ae 16 9c 94 ae 30 9c 98 ae 86 9c 9c ae c4 9c a0
4:AE9D  db ae e0 9c a4 ae 8e 62 a8 ae 28 63 ac ae 2c 63 7c
4:AEAD  db ad 56 91 e4 ae ea 68 b8 ae 60 97 bc ae c6 68 c0
4:AEBD  db ae 40 96 c4 ae 64 96 c8 ae 2c 37 cc ae f2 97 d0
4:AECD  db ae 3c 37 d4 ae 40 37 d8 ae 44 37 dc ae 48 37 e0
4:AEDD  db ae 4c 37 e8 ae 7a 6a f0 ae 98 96 ec ae 50 37 f4
4:AEED  db ae 76 6a 14 ae 60 9c f8 ae 58 37 fc ae 24 63 00
4:AEFD  db af 4e 9c 04 af 62 37 08 af 4a 9c 0c af 66 37 10
4:AF0D  db af 6a 37 14 af 4a 6a 18 af 2e 6b 1c af 02 6b 20
4:AF1D  db af 7a 37 24 af 52 9c 28 af 56 9c 2c af 16 9c 30
4:AF2D  db af 30 9c 34 af 86 9c 38 af c4 9c 3c af e0 9c 40
4:AF3D  db af 8e 62 44 af 28 63 48 af 2c 63 18 ae 26 82 80
4:AF4D  db af ea 68 54 af 60 97 58 af c6 68 5c af 40 96 60
4:AF5D  db af 64 96 64 af 2c 37 68 af f2 97 6c af 3c 37 70
4:AF6D  db af 40 37 74 af 44 37 78 af 48 37 7c af 4c 37 84
4:AF7D  db af 7a 6a 8c af 98 96 88 af 50 37 90 af 76 6a b0
4:AF8D  db ae 60 9c 94 af 58 37 98 af 24 63 9c af 4e 9c a0
4:AF9D  db af 62 37 a4 af 4a 9c a8 af 66 37 ac af 6a 37 b0
4:AFAD  db af 4a 6a b4 af 2e 6b b8 af 02 6b bc af 7a 37 c0
4:AFBD  db af 52 9c c4 af 56 9c c8 af 16 9c cc af 30 9c d0
4:AFCD  db af 86 9c d4 af c4 9c d8 af e0 9c dc af 8e 62 e0
4:AFDD  db af 28 63 e4 af 2c 63 b4 ae 06 8a 1c b0 ea 68 f0
4:AFED  db af 60 97 f4 af c6 68 f8 af 40 96 fc af 64 96 00
4:AFFD  db b0 2c 37 04 b0 f2 97 08 b0 3c 37 0c b0 40 37 10
4:B00D  db b0 44 37 14 b0 48 37 18 b0 4c 37 20 b0 7a 6a 28
4:B01D  db b0 98 96 24 b0 50 37 2c b0 76 6a 4c af 60 9c 30
4:B02D  db b0 58 37 34 b0 24 63 38 b0 4e 9c 3c b0 62 37 40
4:B03D  db b0 4a 9c 44 b0 66 37 48 b0 6a 37 4c b0 4a 6a 50
4:B04D  db b0 2e 6b 54 b0 02 6b 58 b0 7a 37 5c b0 52 9c 60
4:B05D  db b0 56 9c 64 b0 16 9c 68 b0 30 9c 6c b0 86 9c 70
4:B06D  db b0 c4 9c 74 b0 e0 9c 78 b0 8e 62 7c b0 28 63 80
4:B07D  db b0 2c 63 50 af ee 8f b8 b0 ea 68 8c b0 60 97 90
4:B08D  db b0 c6 68 94 b0 40 96 98 b0 64 96 9c b0 2c 37 a0
4:B09D  db b0 f2 97 a4 b0 3c 37 a8 b0 40 37 ac b0 44 37 b0
4:B0AD  db b0 48 37 b4 b0 4c 37 bc b0 7a 6a c4 b0 98 96 c0
4:B0BD  db b0 50 37 c8 b0 76 6a e8 af 60 9c cc b0 58 37 d0
4:B0CD  db b0 24 63 d4 b0 4e 9c d8 b0 62 37 dc b0 4a 9c e0
4:B0DD  db b0 66 37 e4 b0 6a 37 e8 b0 4a 6a ec b0 2e 6b f0
4:B0ED  db b0 02 6b f4 b0 7a 37 f8 b0 52 9c fc b0 56 9c 00
4:B0FD  db b1 16 9c 04 b1 30 9c 08 b1 86 9c 0c b1 c4 9c 10
4:B10D  db b1 e0 9c 14 b1 8e 62 18 b1 28 63 1c b1 2c 63 ec
4:B11D  db af be 80 54 b1 ea 68 28 b1 60 97 2c b1 c6 68 30
4:B12D  db b1 40 96 34 b1 64 96 38 b1 2c 37 3c b1 f2 97 40
4:B13D  db b1 3c 37 44 b1 40 37 48 b1 44 37 4c b1 48 37 50
4:B14D  db b1 4c 37 58 b1 7a 6a 60 b1 98 96 5c b1 50 37 64
4:B15D  db b1 76 6a 84 b0 60 9c 68 b1 58 37 6c b1 24 63 70
4:B16D  db b1 4e 9c 74 b1 62 37 78 b1 4a 9c 7c b1 66 37 80
4:B17D  db b1 6a 37 84 b1 4a 6a 88 b1 2e 6b 8c b1 02 6b 90
4:B18D  db b1 7a 37 94 b1 52 9c 98 b1 56 9c 9c b1 16 9c a0
4:B19D  db b1 30 9c a4 b1 86 9c a8 b1 c4 9c ac b1 e0 9c b0
4:B1AD  db b1 8e 62 b4 b1 28 63 b8 b1 2c 63 88 b0 06 93 f0
4:B1BD  db b1 ea 68 c4 b1 60 97 c8 b1 c6 68 cc b1 40 96 d0
4:B1CD  db b1 64 96 d4 b1 2c 37 d8 b1 f2 97 dc b1 3c 37 e0
4:B1DD  db b1 40 37 e4 b1 44 37 e8 b1 48 37 ec b1 4c 37 f4
4:B1ED  db b1 7a 6a fc b1 98 96 f8 b1 50 37 00 b2 76 6a 20
4:B1FD  db b1 60 9c 04 b2 58 37 08 b2 24 63 0c b2 4e 9c 10
4:B20D  db b2 62 37 14 b2 4a 9c 18 b2 66 37 1c b2 6a 37 20
4:B21D  db b2 4a 6a 24 b2 2e 6b 28 b2 02 6b 2c b2 7a 37 30
4:B22D  db b2 52 9c 34 b2 56 9c 38 b2 16 9c 3c b2 30 9c 40
4:B23D  db b2 86 9c 44 b2 c4 9c 48 b2 e0 9c 4c b2 8e 62 50
4:B24D  db b2 28 63 54 b2 2c 63 24 b1 9e 88 8c b2 ea 68 60
4:B25D  db b2 60 97 64 b2 c6 68 68 b2 40 96 6c b2 64 96 70
4:B26D  db b2 2c 37 74 b2 f2 97 78 b2 3c 37 7c b2 40 37 80
4:B27D  db b2 44 37 84 b2 48 37 88 b2 4c 37 90 b2 7a 6a 98
4:B28D  db b2 98 96 94 b2 50 37 9c b2 76 6a bc b1 60 9c a0
4:B29D  db b2 58 37 a4 b2 24 63 a8 b2 4e 9c ac b2 62 37 b0
4:B2AD  db b2 4a 9c b4 b2 66 37 b8 b2 6a 37 bc b2 4a 6a c0
4:B2BD  db b2 2e 6b c4 b2 02 6b c8 b2 7a 37 cc b2 52 9c d0
4:B2CD  db b2 56 9c d4 b2 16 9c d8 b2 30 9c dc b2 86 9c e0
4:B2DD  db b2 c4 9c e4 b2 e0 9c e8 b2 8e 62 ec b2 28 63 f0
4:B2ED  db b2 2c 63 c0 b1 86 8e 28 b3 ea 68 fc b2 60 97 00
4:B2FD  db b3 c6 68 04 b3 40 96 08 b3 64 96 0c b3 2c 37 10
4:B30D  db b3 f2 97 14 b3 3c 37 18 b3 40 37 1c b3 44 37 20
4:B31D  db b3 48 37 24 b3 4c 37 2c b3 7a 6a 34 b3 98 96 30
4:B32D  db b3 50 37 38 b3 76 6a 58 b2 60 9c 3c b3 58 37 40
4:B33D  db b3 24 63 44 b3 4e 9c 48 b3 62 37 4c b3 4a 9c 50
4:B34D  db b3 66 37 54 b3 6a 37 58 b3 4a 6a 5c b3 2e 6b 60
4:B35D  db b3 02 6b 64 b3 7a 37 68 b3 52 9c 6c b3 56 9c 70
4:B36D  db b3 16 9c 74 b3 30 9c 78 b3 86 9c 7c b3 c4 9c 80
4:B37D  db b3 e0 9c 84 b3 8e 62 88 b3 28 63 8c b3 2c 63 5c
4:B38D  db b2 56 7f c4 b3 ea 68 98 b3 60 97 9c b3 c6 68 a0
4:B39D  db b3 40 96 a4 b3 64 96 a8 b3 2c 37 ac b3 f2 97 b0
4:B3AD  db b3 3c 37 b4 b3 40 37 b8 b3 44 37 bc b3 48 37 c0
4:B3BD  db b3 4c 37 c8 b3 7a 6a d0 b3 98 96 cc b3 50 37 d4
4:B3CD  db b3 76 6a f4 b2 60 9c d8 b3 58 37 dc b3 24 63 e0
4:B3DD  db b3 4e 9c e4 b3 62 37 e8 b3 4a 9c ec b3 66 37 f0
4:B3ED  db b3 6a 37 f4 b3 4a 6a f8 b3 2e 6b fc b3 02 6b 00
4:B3FD  db b4 7a 37 04 b4 52 9c 08 b4 56 9c 0c b4 16 9c 10
4:B40D  db b4 30 9c 14 b4 86 9c 18 b4 c4 9c 1c b4 e0 9c 20
4:B41D  db b4 8e 62 24 b4 28 63 28 b4 2c 63 f8 b2 36 87 60
4:B42D  db b4 ea 68 34 b4 60 97 38 b4 c6 68 3c b4 40 96 40
4:B43D  db b4 64 96 44 b4 2c 37 48 b4 f2 97 4c b4 3c 37 50
4:B44D  db b4 40 37 54 b4 44 37 58 b4 48 37 5c b4 4c 37 64
4:B45D  db b4 7a 6a 6c b4 98 96 68 b4 50 37 70 b4 76 6a 90
4:B46D  db b3 60 9c 74 b4 58 37 78 b4 24 63 7c b4 4e 9c 80
4:B47D  db b4 62 37 84 b4 4a 9c 88 b4 66 37 8c b4 6a 37 90
4:B48D  db b4 4a 6a 94 b4 2e 6b 98 b4 02 6b 9c b4 7a 37 a0
4:B49D  db b4 52 9c a4 b4 56 9c a8 b4 16 9c ac b4 30 9c b0
4:B4AD  db b4 86 9c b4 b4 c4 9c b8 b4 e0 9c bc b4 8e 62 c0
4:B4BD  db b4 28 63 c4 b4 2c 63 94 b3 1e 8d fc b4 ea 68 d0
4:B4CD  db b4 60 97 d4 b4 c6 68 d8 b4 40 96 dc b4 64 96 e0
4:B4DD  db b4 2c 37 e4 b4 f2 97 e8 b4 3c 37 ec b4 40 37 f0
4:B4ED  db b4 44 37 f4 b4 48 37 f8 b4 4c 37 00 b5 7a 6a 08
4:B4FD  db b5 98 96 04 b5 50 37 0c b5 76 6a 2c b4 60 9c 10
4:B50D  db b5 58 37 14 b5 24 63 18 b5 4e 9c 1c b5 62 37 20
4:B51D  db b5 4a 9c 24 b5 66 37 28 b5 6a 37 2c b5 4a 6a 30
4:B52D  db b5 2e 6b 34 b5 02 6b 38 b5 7a 37 3c b5 52 9c 40
4:B53D  db b5 56 9c 44 b5 16 9c 48 b5 30 9c 4c b5 86 9c 50
4:B54D  db b5 c4 9c 54 b5 e0 9c 58 b5 8e 62 5c b5 28 63 60
4:B55D  db b5 2c 63 30 b4 ee 7d 98 b5 ea 68 6c b5 60 97 70
4:B56D  db b5 c6 68 74 b5 40 96 78 b5 64 96 7c b5 2c 37 80
4:B57D  db b5 f2 97 84 b5 3c 37 88 b5 40 37 8c b5 44 37 90
4:B58D  db b5 48 37 94 b5 4c 37 9c b5 7a 6a a4 b5 98 96 a0
4:B59D  db b5 50 37 a8 b5 76 6a c8 b4 60 9c ac b5 58 37 b0
4:B5AD  db b5 24 63 b4 b5 4e 9c b8 b5 62 37 bc b5 4a 9c c0
4:B5BD  db b5 66 37 c4 b5 6a 37 c8 b5 4a 6a cc b5 2e 6b d0
4:B5CD  db b5 02 6b d4 b5 7a 37 d8 b5 52 9c dc b5 56 9c e0
4:B5DD  db b5 16 9c e4 b5 30 9c e8 b5 86 9c ec b5 c4 9c f0
4:B5ED  db b5 e0 9c f4 b5 8e 62 f8 b5 28 63 fc b5 2c 63 cc
4:B5FD  db b4 3e 85 34 b6 ea 68 08 b6 60 97 0c b6 c6 68 10
4:B60D  db b6 40 96 14 b6 64 96 18 b6 2c 37 1c b6 f2 97 20
4:B61D  db b6 3c 37 24 b6 40 37 28 b6 44 37 2c b6 48 37 30
4:B62D  db b6 4c 37 38 b6 7a 6a 40 b6 98 96 3c b6 50 37 44
4:B63D  db b6 76 6a 64 b5 60 9c 48 b6 58 37 4c b6 24 63 50
4:B64D  db b6 4e 9c 54 b6 62 37 58 b6 4a 9c 5c b6 66 37 60
4:B65D  db b6 6a 37 64 b6 4a 6a 68 b6 2e 6b 6c b6 02 6b 70
4:B66D  db b6 7a 37 74 b6 52 9c 78 b6 56 9c 7c b6 16 9c 80
4:B67D  db b6 30 9c 84 b6 86 9c 88 b6 c4 9c 8c b6 e0 9c 90
4:B68D  db b6 8e 62 94 b6 28 63 98 b6 2c 63 68 b5 d6 83 d0
4:B69D  db b6 ea 68 a4 b6 60 97 a8 b6 c6 68 ac b6 40 96 b0
4:B6AD  db b6 64 96 b4 b6 2c 37 b8 b6 f2 97 bc b6 3c 37 c0
4:B6BD  db b6 40 37 c4 b6 44 37 c8 b6 48 37 cc b6 4c 37 d4
4:B6CD  db b6 7a 6a dc b6 98 96 d8 b6 50 37 e0 b6 76 6a 00
4:B6DD  db b6 60 9c e4 b6 58 37 e8 b6 24 63 ec b6 4e 9c f0
4:B6ED  db b6 62 37 f4 b6 4a 9c f8 b6 66 37 fc b6 6a 37 00
4:B6FD  db b7 4a 6a 04 b7 2e 6b 08 b7 02 6b 0c b7 7a 37 10
4:B70D  db b7 52 9c 14 b7 56 9c 18 b7 16 9c 1c b7 30 9c 20
4:B71D  db b7 86 9c 24 b7 c4 9c 28 b7 e0 9c 2c b7 8e 62 30
4:B72D  db b7 28 63 34 b7 2c 63 04 b6 e6 91 6c b7 ea 68 40
4:B73D  db b7 60 97 44 b7 c6 68 48 b7 40 96 4c b7 64 96 50
4:B74D  db b7 2c 37 54 b7 f2 97 58 b7 3c 37 5c b7 40 37 60
4:B75D  db b7 44 37 64 b7 48 37 68 b7 4c 37 70 b7 7a 6a 78
4:B76D  db b7 98 96 74 b7 50 37 7c b7 76 6a 9c b6 60 9c 80
4:B77D  db b7 58 37 84 b7 24 63 88 b7 4e 9c 8c b7 62 37 90
4:B78D  db b7 4a 9c 94 b7 66 37 98 b7 6a 37 9c b7 4a 6a a0
4:B79D  db b7 2e 6b a4 b7 02 6b a8 b7 7a 37 ac b7 52 9c b0
4:B7AD  db b7 56 9c b4 b7 16 9c b8 b7 30 9c bc b7 86 9c c0
4:B7BD  db b7 c4 9c c4 b7 e0 9c c8 b7 8e 62 cc b7 28 63 d0
4:B7CD  db b7 2c 63 a0 b6 fe 82 08 b8 ea 68 dc b7 60 97 e0
4:B7DD  db b7 c6 68 e4 b7 40 96 e8 b7 64 96 ec b7 2c 37 f0
4:B7ED  db b7 f2 97 f4 b7 3c 37 f8 b7 40 37 fc b7 44 37 00
4:B7FD  db b8 48 37 04 b8 4c 37 0c b8 7a 6a 14 b8 98 96 10
4:B80D  db b8 50 37 18 b8 76 6a 38 b7 60 9c 1c b8 58 37 20
4:B81D  db b8 24 63 24 b8 4e 9c 28 b8 62 37 2c b8 4a 9c 30
4:B82D  db b8 66 37 34 b8 6a 37 38 b8 4a 6a 3c b8 2e 6b 40
4:B83D  db b8 02 6b 44 b8 7a 37 48 b8 52 9c 4c b8 56 9c 50
4:B84D  db b8 16 9c 54 b8 30 9c 58 b8 86 9c 5c b8 c4 9c 60
4:B85D  db b8 e0 9c 64 b8 8e 62 68 b8 28 63 6c b8 2c 63 3c
4:B86D  db b7 de 8a a4 b8 ea 68 78 b8 60 97 7c b8 c6 68 80
4:B87D  db b8 40 96 84 b8 64 96 88 b8 2c 37 8c b8 f2 97 90
4:B88D  db b8 3c 37 94 b8 40 37 98 b8 44 37 9c b8 48 37 a0
4:B89D  db b8 4c 37 a8 b8 7a 6a b0 b8 98 96 ac b8 50 37 b4
4:B8AD  db b8 76 6a d4 b7 60 9c b8 b8 58 37 bc b8 24 63 c0
4:B8BD  db b8 4e 9c c4 b8 62 37 c8 b8 4a 9c cc b8 66 37 d0
4:B8CD  db b8 6a 37 d4 b8 4a 6a d8 b8 2e 6b dc b8 02 6b e0
4:B8DD  db b8 7a 37 e4 b8 52 9c e8 b8 56 9c ec b8 16 9c f0
4:B8ED  db b8 30 9c f4 b8 86 9c f8 b8 c4 9c fc b8 e0 9c 00
4:B8FD  db b9 8e 62 04 b9 28 63 08 b9 2c 63 d8 b7 c6 90 40
4:B90D  db b9 ea 68 14 b9 60 97 18 b9 c6 68 1c b9 40 96 20
4:B91D  db b9 64 96 24 b9 2c 37 28 b9 f2 97 2c b9 3c 37 30
4:B92D  db b9 40 37 34 b9 44 37 38 b9 48 37 3c b9 4c 37 44
4:B93D  db b9 7a 6a 4c b9 98 96 48 b9 50 37 50 b9 76 6a 70
4:B94D  db b8 60 9c 54 b9 58 37 58 b9 24 63 5c b9 4e 9c 60
4:B95D  db b9 62 37 64 b9 4a 9c 68 b9 66 37 6c b9 6a 37 70
4:B96D  db b9 4a 6a 74 b9 2e 6b 78 b9 02 6b 7c b9 7a 37 80
4:B97D  db b9 52 9c 84 b9 56 9c 88 b9 16 9c 8c b9 30 9c 90
4:B98D  db b9 86 9c 94 b9 c4 9c 98 b9 e0 9c 9c b9 8e 62 a0
4:B99D  db b9 28 63 a4 b9 2c 63 74 b8 96 81 dc b9 ea 68 b0
4:B9AD  db b9 60 97 b4 b9 c6 68 b8 b9 40 96 bc b9 64 96 c0
4:B9BD  db b9 2c 37 c4 b9 f2 97 c8 b9 3c 37 cc b9 40 37 d0
4:B9CD  db b9 44 37 d4 b9 48 37 d8 b9 4c 37 e0 b9 7a 6a e8
4:B9DD  db b9 98 96 e4 b9 50 37 ec b9 76 6a 0c b9 60 9c f0
4:B9ED  db b9 58 37 f4 b9 24 63 f8 b9 4e 9c fc b9 62 37 00
4:B9FD  db ba 4a 9c 04 ba 66 37 08 ba 6a 37 0c ba 4a 6a 10
4:BA0D  db ba 2e 6b 14 ba 02 6b 18 ba 7a 37 1c ba 52 9c 20
4:BA1D  db ba 56 9c 24 ba 16 9c 28 ba 30 9c 2c ba 86 9c 30
4:BA2D  db ba c4 9c 34 ba e0 9c 38 ba 8e 62 3c ba 28 63 40
4:BA3D  db ba 2c 63 10 b9 76 92 78 ba ea 68 4c ba 60 97 50
4:BA4D  db ba c6 68 54 ba 40 96 58 ba 64 96 5c ba 2c 37 60
4:BA5D  db ba f2 97 64 ba 3c 37 68 ba 40 37 6c ba 44 37 70
4:BA6D  db ba 48 37 74 ba 4c 37 7c ba 7a 6a 84 ba 98 96 80
4:BA7D  db ba 50 37 88 ba 76 6a a8 b9 60 9c 8c ba 58 37 90
4:BA8D  db ba 24 63 94 ba 4e 9c 98 ba 62 37 9c ba 4a 9c a0
4:BA9D  db ba 66 37 a4 ba 6a 37 a8 ba 4a 6a ac ba 2e 6b b0
4:BAAD  db ba 02 6b b4 ba 7a 37 b8 ba 52 9c bc ba 56 9c c0
4:BABD  db ba 16 9c c4 ba 30 9c c8 ba 86 9c cc ba c4 9c d0
4:BACD  db ba e0 9c d4 ba 8e 62 d8 ba 28 63 dc ba 2c 63 ac
4:BADD  db b9 76 89 14 bb ea 68 e8 ba 60 97 ec ba c6 68 f0
4:BAED  db ba 40 96 f4 ba 64 96 f8 ba 2c 37 fc ba f2 97 00
4:BAFD  db bb 3c 37 04 bb 40 37 08 bb 44 37 0c bb 48 37 10
4:BB0D  db bb 4c 37 18 bb 7a 6a 20 bb 98 96 1c bb 50 37 24
4:BB1D  db bb 76 6a 44 ba 60 9c 28 bb 58 37 2c bb 24 63 30
4:BB2D  db bb 4e 9c 34 bb 62 37 38 bb 4a 9c 3c bb 66 37 40
4:BB3D  db bb 6a 37 44 bb 4a 6a 48 bb 2e 6b 4c bb 02 6b 50
4:BB4D  db bb 7a 37 54 bb 52 9c 58 bb 56 9c 5c bb 16 9c 60
4:BB5D  db bb 30 9c 64 bb 86 9c 68 bb c4 9c 6c bb e0 9c 70
4:BB6D  db bb 8e 62 74 bb 28 63 78 bb 2c 63 48 ba 5e 8f b0
4:BB7D  db bb ea 68 84 bb 60 97 88 bb c6 68 8c bb 40 96 90
4:BB8D  db bb 64 96 94 bb 2c 37 98 bb f2 97 9c bb 3c 37 a0
4:BB9D  db bb 40 37 a4 bb 44 37 a8 bb 48 37 ac bb 4c 37 b4
4:BBAD  db bb 7a 6a bc bb 98 96 b8 bb 50 37 c0 bb 76 6a e0
4:BBBD  db ba 60 9c c4 bb 58 37 c8 bb 24 63 cc bb 4e 9c d0
4:BBCD  db bb 62 37 d4 bb 4a 9c d8 bb 66 37 dc bb 6a 37 e0
4:BBDD  db bb 4a 6a e4 bb 2e 6b e8 bb 02 6b ec bb 7a 37 f0
4:BBED  db bb 52 9c f4 bb 56 9c f8 bb 16 9c fc bb 30 9c 00
4:BBFD  db bc 86 9c 04 bc c4 9c 08 bc e0 9c 0c bc 8e 62 10
4:BC0D  db bc 28 63 14 bc 2c 63 e4 ba 2e 80 4c bc ea 68 20
4:BC1D  db bc 60 97 24 bc c6 68 28 bc 40 96 2c bc 64 96 30
4:BC2D  db bc 2c 37 34 bc f2 97 38 bc 3c 37 3c bc 40 37 40
4:BC3D  db bc 44 37 44 bc 48 37 48 bc 4c 37 50 bc 7a 6a 58
4:BC4D  db bc 98 96 54 bc 50 37 5c bc 76 6a 7c bb 60 9c 60
4:BC5D  db bc 58 37 64 bc 24 63 68 bc 4e 9c 6c bc 62 37 70
4:BC6D  db bc 4a 9c 74 bc 66 37 78 bc 6a 37 7c bc 4a 6a 80
4:BC7D  db bc 2e 6b 84 bc 02 6b 88 bc 7a 37 8c bc 52 9c 90
4:BC8D  db bc 56 9c 94 bc 16 9c 98 bc 30 9c 9c bc 86 9c a0
4:BC9D  db bc c4 9c a4 bc e0 9c a8 bc 8e 62 ac bc 28 63 b0
4:BCAD  db bc 2c 63 80 bb 0e 88 e8 bc ea 68 bc bc 60 97 c0
4:BCBD  db bc c6 68 c4 bc 40 96 c8 bc 64 96 cc bc 2c 37 d0
4:BCCD  db bc f2 97 d4 bc 3c 37 d8 bc 40 37 dc bc 44 37 e0
4:BCDD  db bc 48 37 e4 bc 4c 37 ec bc 7a 6a f4 bc 98 96 f0
4:BCED  db bc 50 37 f8 bc 76 6a 18 bc 60 9c fc bc 58 37 00
4:BCFD  db bd 24 63 04 bd 4e 9c 08 bd 62 37 0c bd 4a 9c 10
4:BD0D  db bd 66 37 14 bd 6a 37 18 bd 4a 6a 1c bd 2e 6b 20
4:BD1D  db bd 02 6b 24 bd 7a 37 28 bd 52 9c 2c bd 56 9c 30
4:BD2D  db bd 16 9c 34 bd 30 9c 38 bd 86 9c 3c bd c4 9c 40
4:BD3D  db bd e0 9c 44 bd 8e 62 48 bd 28 63 4c bd 2c 63 1c
4:BD4D  db bc f6 8d 84 bd ea 68 58 bd 60 97 5c bd c6 68 60
4:BD5D  db bd 40 96 64 bd 64 96 68 bd 2c 37 6c bd f2 97 70
4:BD6D  db bd 3c 37 74 bd 40 37 78 bd 44 37 7c bd 48 37 80
4:BD7D  db bd 4c 37 88 bd 7a 6a 90 bd 98 96 8c bd 50 37 94
4:BD8D  db bd 76 6a b4 bc 60 9c 98 bd 58 37 9c bd 24 63 a0
4:BD9D  db bd 4e 9c a4 bd 62 37 a8 bd 4a 9c ac bd 66 37 b0
4:BDAD  db bd 6a 37 b4 bd 4a 6a b8 bd 2e 6b bc bd 02 6b c0
4:BDBD  db bd 7a 37 c4 bd 52 9c c8 bd 56 9c cc bd 16 9c d0
4:BDCD  db bd 30 9c d4 bd 86 9c d8 bd c4 9c dc bd e0 9c e0
4:BDDD  db bd 8e 62 e4 bd 28 63 e8 bd 2c 63 b8 bc c6 7e 20
4:BDED  db be ea 68 f4 bd 60 97 f8 bd c6 68 fc bd 40 96 00
4:BDFD  db be 64 96 04 be 2c 37 08 be f2 97 0c be 3c 37 10
4:BE0D  db be 40 37 14 be 44 37 18 be 48 37 1c be 4c 37 24
4:BE1D  db be 7a 6a 2c be 98 96 28 be 50 37 30 be 76 6a 50
4:BE2D  db bd 60 9c 34 be 58 37 38 be 24 63 3c be 4e 9c 40
4:BE3D  db be 62 37 44 be 4a 9c 48 be 66 37 4c be 6a 37 50
4:BE4D  db be 4a 6a 54 be 2e 6b 58 be 02 6b 5c be 7a 37 60
4:BE5D  db be 52 9c 64 be 56 9c 68 be 16 9c 6c be 30 9c 70
4:BE6D  db be 86 9c 74 be c4 9c 78 be e0 9c 7c be 8e 62 80
4:BE7D  db be 28 63 84 be 2c 63 54 bd 16 86 bc be ea 68 90
4:BE8D  db be 60 97 94 be c6 68 98 be 40 96 9c be 64 96 a0
4:BE9D  db be 2c 37 a4 be f2 97 a8 be 3c 37 ac be 40 37 b0
4:BEAD  db be 44 37 b4 be 48 37 b8 be 4c 37 c0 be 7a 6a c8
4:BEBD  db be 98 96 c4 be 50 37 cc be 76 6a ec bd 60 9c d0
4:BECD  db be 58 37 d4 be 24 63 d8 be 4e 9c dc be 62 37 e0
4:BEDD  db be 4a 9c e4 be 66 37 e8 be 6a 37 ec be 4a 6a f0
4:BEED  db be 2e 6b f4 be 02 6b f8 be 7a 37 fc be 52 9c 00
4:BEFD  db bf 56 9c 04 bf 16 9c 08 bf 30 9c 0c bf 86 9c 10
4:BF0D  db bf c4 9c 14 bf e0 9c 18 bf 8e 62 1c bf 28 63 20
4:BF1D  db bf 2c 63 f0 bd a6 86 58 bf ea 68 2c bf 60 97 30
4:BF2D  db bf c6 68 34 bf 40 96 38 bf 64 96 3c bf 2c 37 40
4:BF3D  db bf f2 97 44 bf 3c 37 48 bf 40 37 4c bf 44 37 50
4:BF4D  db bf 48 37 54 bf 4c 37 5c bf 7a 6a 64 bf 98 96 60
4:BF5D  db bf 50 37 68 bf 76 6a 88 be 60 9c 6c bf 58 37 70
4:BF6D  db bf 24 63 74 bf 4e 9c 78 bf 62 37 7c bf 4a 9c 80
4:BF7D  db bf 66 37 84 bf 6a 37 88 bf 4a 6a 8c bf 2e 6b 90
4:BF8D  db bf 02 6b 94 bf 7a 37 98 bf 52 9c 9c bf 56 9c a0
4:BF9D  db bf 16 9c a4 bf 30 9c a8 bf 86 9c ac bf c4 9c b0
4:BFAD  db bf e0 9c b4 bf 8e 62 b8 bf 28 63 bc bf 2c 63 8c
4:BFBD  db be 8e 8c f4 bf ea 68 c8 bf 60 97 cc bf c6 68 d0
4:BFCD  db bf 40 96 d4 bf 64 96 d8 bf 2c 37 dc bf f2 97 e0
4:BFDD  db bf 3c 37 e4 bf 40 37 e8 bf 44 37 ec bf 48 37 f0
4:BFED  db bf 4c 37 f8 bf 7a 6a 00 c0 98 96 fc bf 50 37 04
4:BFFD  db c0 76 6a 24 bf 60 9c 08 c0 58 37 0c c0 24 63 10
4:C00D  db c0 4e 9c 14 c0 62 37 18 c0 4a 9c 1c c0 66 37 20
4:C01D  db c0 6a 37 24 c0 4a 6a 28 c0 2e 6b 2c c0 02 6b 30
4:C02D  db c0 7a 37 34 c0 52 9c 38 c0 56 9c 3c c0 16 9c 40
4:C03D  db c0 30 9c 44 c0 86 9c 48 c0 c4 9c 4c c0 e0 9c 50
4:C04D  db c0 8e 62 54 c0 28 63 58 c0 2c 63 28 bf ae 84 90
4:C05D  db c0 ea 68 64 c0 60 97 68 c0 c6 68 6c c0 40 96 70
4:C06D  db c0 64 96 74 c0 2c 37 78 c0 f2 97 7c c0 3c 37 80
4:C07D  db c0 40 37 84 c0 44 37 88 c0 48 37 8c c0 4c 37 94
4:C08D  db c0 7a 6a 9c c0 98 96 98 c0 50 37 a0 c0 76 6a c0
4:C09D  db bf 60 9c a4 c0 58 37 a8 c0 24 63 ac c0 4e 9c b0
4:C0AD  db c0 62 37 b4 c0 4a 9c b8 c0 66 37 bc c0 6a 37 c0
4:C0BD  db c0 4a 6a c4 c0 2e 6b c8 c0 02 6b cc c0 7a 37 d0
4:C0CD  db c0 52 9c d4 c0 56 9c d8 c0 16 9c dc c0 30 9c e0
4:C0DD  db c0 86 9c e4 c0 c4 9c e8 c0 e0 9c ec c0 8e 62 f0
4:C0ED  db c0 28 63 f4 c0 2c 63 c4 bf b6 8b 2c c1 ea 68 00
4:C0FD  db c1 60 97 04 c1 c6 68 08 c1 40 96 0c c1 64 96 10
4:C10D  db c1 2c 37 14 c1 f2 97 18 c1 3c 37 1c c1 40 37 20
4:C11D  db c1 44 37 24 c1 48 37 28 c1 4c 37 30 c1 7a 6a 38
4:C12D  db c1 98 96 34 c1 50 37 3c c1 76 6a 5c c0 60 9c 40
4:C13D  db c1 58 37 44 c1 24 63 48 c1 4e 9c 4c c1 62 37 50
4:C14D  db c1 4a 9c 54 c1 66 37 58 c1 6a 37 5c c1 4a 6a 60
4:C15D  db c1 2e 6b 64 c1 02 6b 68 c1 7a 37 6c c1 52 9c 70
4:C16D  db c1 56 9c 74 c1 16 9c 78 c1 30 9c 7c c1 86 9c 80
4:C17D  db c1 c4 9c 84 c1 e0 9c 88 c1 8e 62 8c c1 28 63 90
4:C18D  db c1 2c 63 60 c0 9e 91 c8 c1 ea 68 9c c1 60 97 a0
4:C19D  db c1 c6 68 a4 c1 40 96 a8 c1 64 96 ac c1 2c 37 b0
4:C1AD  db c1 f2 97 b4 c1 3c 37 b8 c1 40 37 bc c1 44 37 c0
4:C1BD  db c1 48 37 c4 c1 4c 37 cc c1 7a 6a d4 c1 98 96 d0
4:C1CD  db c1 50 37 d8 c1 76 6a f8 c0 60 9c dc c1 58 37 e0
4:C1DD  db c1 24 63 e4 c1 4e 9c e8 c1 62 37 ec c1 4a 9c f0
4:C1ED  db c1 66 37 f4 c1 6a 37 f8 c1 4a 6a fc c1 2e 6b 00
4:C1FD  db c2 02 6b 04 c2 7a 37 08 c2 52 9c 0c c2 56 9c 10
4:C20D  db c2 16 9c 14 c2 30 9c 18 c2 86 9c 1c c2 c4 9c 20
4:C21D  db c2 e0 9c 24 c2 8e 62 28 c2 28 63 2c c2 2c 63 fc
4:C22D  db c0 6e 82 64 c2 ea 68 38 c2 60 97 3c c2 c6 68 40
4:C23D  db c2 40 96 44 c2 64 96 48 c2 2c 37 4c c2 f2 97 50
4:C24D  db c2 3c 37 54 c2 40 37 58 c2 44 37 5c c2 48 37 60
4:C25D  db c2 4c 37 68 c2 7a 6a 70 c2 98 96 6c c2 50 37 74
4:C26D  db c2 76 6a 94 c1 60 9c 78 c2 58 37 7c c2 24 63 80
4:C27D  db c2 4e 9c 84 c2 62 37 88 c2 4a 9c 8c c2 66 37 90
4:C28D  db c2 6a 37 94 c2 4a 6a 98 c2 2e 6b 9c c2 02 6b a0
4:C29D  db c2 7a 37 a4 c2 52 9c a8 c2 56 9c ac c2 16 9c b0
4:C2AD  db c2 30 9c b4 c2 86 9c b8 c2 c4 9c bc c2 e0 9c c0
4:C2BD  db c2 8e 62 c4 c2 28 63 c8 c2 2c 63 98 c1 4e 8a 00
4:C2CD  db c3 ea 68 d4 c2 60 97 d8 c2 c6 68 dc c2 40 96 e0
4:C2DD  db c2 64 96 e4 c2 2c 37 e8 c2 f2 97 ec c2 3c 37 f0
4:C2ED  db c2 40 37 f4 c2 44 37 f8 c2 48 37 fc c2 4c 37 04
4:C2FD  db c3 7a 6a 0c c3 98 96 08 c3 50 37 10 c3 76 6a 30
4:C30D  db c2 60 9c 14 c3 58 37 18 c3 24 63 1c c3 4e 9c 20
4:C31D  db c3 62 37 24 c3 4a 9c 28 c3 66 37 2c c3 6a 37 30
4:C32D  db c3 4a 6a 34 c3 2e 6b 38 c3 02 6b 3c c3 7a 37 40
4:C33D  db c3 52 9c 44 c3 56 9c 48 c3 16 9c 4c c3 30 9c 50
4:C34D  db c3 86 9c 54 c3 c4 9c 58 c3 e0 9c 5c c3 8e 62 60
4:C35D  db c3 28 63 64 c3 2c 63 34 c2 36 90 9c c3 ea 68 70
4:C36D  db c3 60 97 74 c3 c6 68 78 c3 40 96 7c c3 64 96 80
4:C37D  db c3 2c 37 84 c3 f2 97 88 c3 3c 37 8c c3 40 37 90
4:C38D  db c3 44 37 94 c3 48 37 98 c3 4c 37 a0 c3 7a 6a a8
4:C39D  db c3 98 96 a4 c3 50 37 ac c3 76 6a cc c2 60 9c b0
4:C3AD  db c3 58 37 b4 c3 24 63 b8 c3 4e 9c bc c3 62 37 c0
4:C3BD  db c3 4a 9c c4 c3 66 37 c8 c3 6a 37 cc c3 4a 6a d0
4:C3CD  db c3 2e 6b d4 c3 02 6b d8 c3 7a 37 dc c3 52 9c e0
4:C3DD  db c3 56 9c e4 c3 16 9c e8 c3 30 9c ec c3 86 9c f0
4:C3ED  db c3 c4 9c f4 c3 e0 9c f8 c3 8e 62 fc c3 28 63 00
4:C3FD  db c4 2c 63 d0 c2

; ---------------- StoryPage::StoryPage@s4:C402 FAR size=278 callers=15
;   story page base (on s5:0762): strings, picture, voice, ms, next command
4:C402  c8180000             enter 0x18, 0
4:C406  66ff761c             push dword ptr [bp + 0x1c]
4:C40A  66ff7618             push dword ptr [bp + 0x18]
4:C40E  66ff7614             push dword ptr [bp + 0x14]
4:C412  66ff7610             push dword ptr [bp + 0x10]
4:C416  ff760e               push word ptr [bp + 0xe]
4:C419  66ff7606             push dword ptr [bp + 6]
4:C41D  9a62070c6a           lcall 0x6a0c, 0x762  ; StoryView::StoryView@s5:0762
4:C422  33c0                 xor ax, ax
4:C424  c45e06               les bx, ptr [bp + 6]
4:C427  268987f600           mov word ptr es:[bx + 0xf6], ax
4:C42C  268987f800           mov word ptr es:[bx + 0xf8], ax
4:C431  268987fa00           mov word ptr es:[bx + 0xfa], ax
4:C436  268987fc00           mov word ptr es:[bx + 0xfc], ax
4:C43B  26c787fe000200       mov word ptr es:[bx + 0xfe], 2
4:C442  6626c787080100000000 mov dword ptr es:[bx + 0x108], 0
4:C44C  2689870c01           mov word ptr es:[bx + 0x10c], ax
4:C451  6626c7870e0190011e00 mov dword ptr es:[bx + 0x10e], 0x1e0190
4:C45B  2689871201           mov word ptr es:[bx + 0x112], ax
4:C460  26c707bcc8           mov word ptr es:[bx], 0xc8bc
4:C465  26c7470268c3         mov word ptr es:[bx + 2], 0xc368  ; SEGMENT s4:0000
4:C46B  6a08                 push 8
4:C46D  50                   push ax
4:C46E  8d8f0001             lea cx, [bx + 0x100]
4:C472  06                   push es
4:C473  51                   push cx
4:C474  9a0649d193           lcall 0x93d1, 0x4906  ; _fmemset@s1:4906
4:C479  83c408               add sp, 8
4:C47C  837e0c00             cmp word ptr [bp + 0xc], 0
4:C480  7416                 je 0xc498
4:C482  837e0a00             cmp word ptr [bp + 0xa], 0
4:C486  7510                 jne 0xc498
4:C488  ff760c               push word ptr [bp + 0xc]
4:C48B  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:C490  9aac84c5c4           lcall 0xc4c5, 0x84ac  ; LoadStringDup@s3:84AC
4:C495  eb17                 jmp 0xc4ae
4:C497  db 90
loc_C498:
4:C498  8b460c               mov ax, word ptr [bp + 0xc]
4:C49B  85460a               test word ptr [bp + 0xa], ax
4:C49E  741b                 je 0xc4bb
4:C4A0  6a00                 push 0
4:C4A2  ff760a               push word ptr [bp + 0xa]
4:C4A5  50                   push ax
4:C4A6  9ad85f0bc5           lcall 0xc50b, 0x5fd8  ; joinResourceStrings@s2:5FD8
4:C4AB  83c406               add sp, 6
loc_C4AE:
4:C4AE  c45e06               les bx, ptr [bp + 6]
4:C4B1  2689870801           mov word ptr es:[bx + 0x108], ax
4:C4B6  2689970a01           mov word ptr es:[bx + 0x10a], dx
loc_C4BB:
4:C4BB  6a48                 push 0x48
4:C4BD  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:C4C2  9aba20ea6a           lcall 0x6aea, 0x20ba  ; Registry_get@s3:20BA
4:C4C7  8ec2                 mov es, dx
4:C4C9  8bd8                 mov bx, ax
4:C4CB  8946fc               mov word ptr [bp - 4], ax
4:C4CE  8c46fe               mov word ptr [bp - 2], es
4:C4D1  268b470a             mov ax, word ptr es:[bx + 0xa]
4:C4D5  c45e06               les bx, ptr [bp + 6]
4:C4D8  268987f600           mov word ptr es:[bx + 0xf6], ax
4:C4DD  c45efc               les bx, ptr [bp - 4]
4:C4E0  268b470c             mov ax, word ptr es:[bx + 0xc]
4:C4E4  c45e06               les bx, ptr [bp + 6]
4:C4E7  268987f800           mov word ptr es:[bx + 0xf8], ax
4:C4EC  8b4606               mov ax, word ptr [bp + 6]
4:C4EF  8b5608               mov dx, word ptr [bp + 8]
4:C4F2  05fa00               add ax, 0xfa
4:C4F5  52                   push dx
4:C4F6  50                   push ax
4:C4F7  8b4606               mov ax, word ptr [bp + 6]
4:C4FA  05fc00               add ax, 0xfc
4:C4FD  52                   push dx
4:C4FE  50                   push ax
4:C4FF  668b46fc             mov eax, dword ptr [bp - 4]
4:C503  050e00               add ax, 0xe
4:C506  6650                 push eax
4:C508  9a943e6cc3           lcall 0xc36c, 0x3e94  ; Pos3::getXY@s2:3E94
4:C50D  8b4606               mov ax, word ptr [bp + 6]
4:C510  8b5608               mov dx, word ptr [bp + 8]
4:C513  c9                   leave
4:C514  ca1a00               retf 0x1a
4:C517  db 00

; ---------------- StoryPage::~StoryPage@s4:C518 FAR size=96 callers=16
;   apis: USER.DestroyWindow, USER.IsWindow
;   dtor
4:C518  c8080000             enter 8, 0
4:C51C  c45e06               les bx, ptr [bp + 6]
4:C51F  26c707bcc8           mov word ptr es:[bx], 0xc8bc
4:C524  26c7470269c4         mov word ptr es:[bx + 2], 0xc469  ; SEGMENT s4:0000
4:C52A  66268b870801         mov eax, dword ptr es:[bx + 0x108]
4:C530  6650                 push eax
4:C532  9ace1777c4           lcall 0xc477, 0x17ce  ; operator_delete@s1:17CE
4:C537  83c404               add sp, 4
4:C53A  c45e06               les bx, ptr [bp + 6]
4:C53D  2683bf120100         cmp word ptr es:[bx + 0x112], 0
4:C543  7425                 je 0xc56a
4:C545  26ffb71201           push word ptr es:[bx + 0x112]
4:C54A  9afb6b0000           lcall 0, 0x6bfb  ; USER.IsWindow
4:C54F  0bc0                 or ax, ax
4:C551  7417                 je 0xc56a
4:C553  c45e06               les bx, ptr [bp + 6]
4:C556  26ffb71201           push word ptr es:[bx + 0x112]
4:C55B  9a0c6c0000           lcall 0, 0x6c0c  ; USER.DestroyWindow
4:C560  c45e06               les bx, ptr [bp + 6]
4:C563  26c78712010000       mov word ptr es:[bx + 0x112], 0
loc_C56A:
4:C56A  66ff7606             push dword ptr [bp + 6]
4:C56E  9a2c0220c4           lcall 0xc420, 0x22c  ; TimedView::~TimedView@s5:022C
4:C573  c9                   leave
4:C574  ca0400               retf 4
4:C577  db 00

; ---------------- StoryPage::paint@s4:C578 FAR size=458 callers=0
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.FillRect, USER.PostMessage, USER.SelectPalette
;   (vslot 13) background, text, voice on the first paint, mars.mid
4:C578  c84c0000             enter 0x4c, 0
4:C57C  57                   push di
4:C57D  56                   push si
4:C57E  6a02                 push 2
4:C580  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:C585  9aba2093c4           lcall 0xc493, 0x20ba  ; Registry_get@s3:20BA
4:C58A  8946dc               mov word ptr [bp - 0x24], ax
4:C58D  8956de               mov word ptr [bp - 0x22], dx
4:C590  c45edc               les bx, ptr [bp - 0x24]
4:C593  268b4720             mov ax, word ptr es:[bx + 0x20]
4:C597  8946da               mov word ptr [bp - 0x26], ax
4:C59A  0bc0                 or ax, ax
4:C59C  7540                 jne 0xc5de
4:C59E  c45e06               les bx, ptr [bp + 6]
4:C5A1  26ff7708             push word ptr es:[bx + 8]
4:C5A5  8d46e0               lea ax, [bp - 0x20]
4:C5A8  16                   push ss
4:C5A9  50                   push ax
4:C5AA  9a2ac60000           lcall 0, 0xc62a  ; USER.BeginPaint
4:C5AF  c45e06               les bx, ptr [bp + 6]
4:C5B2  26ff7708             push word ptr es:[bx + 8]
4:C5B6  8d46e0               lea ax, [bp - 0x20]
4:C5B9  16                   push ss
4:C5BA  50                   push ax
4:C5BB  9a38c70000           lcall 0, 0xc738  ; USER.EndPaint
4:C5C0  ff369603             push word ptr [0x396]
4:C5C4  681101               push 0x111
4:C5C7  c45e06               les bx, ptr [bp + 6]
4:C5CA  26ffb7ea00           push word ptr es:[bx + 0xea]
4:C5CF  666a00               push 0
4:C5D2  9ad46b0000           lcall 0, 0x6bd4  ; USER.PostMessage
4:C5D7  5e                   pop si
4:C5D8  5f                   pop di
4:C5D9  c9                   leave
4:C5DA  ca0400               retf 4
4:C5DD  db 90
loc_C5DE:
4:C5DE  c45e06               les bx, ptr [bp + 6]
4:C5E1  2683bff00000         cmp word ptr es:[bx + 0xf0], 0
4:C5E7  751f                 jne 0xc608
4:C5E9  2683bff40000         cmp word ptr es:[bx + 0xf4], 0
4:C5EF  7417                 je 0xc608
4:C5F1  26c787f0000100       mov word ptr es:[bx + 0xf0], 1
4:C5F8  8d87f200             lea ax, [bx + 0xf2]
4:C5FC  06                   push es
4:C5FD  50                   push ax
4:C5FE  66ff36a002           push dword ptr [0x2a0]
4:C603  9a9e5c1bc6           lcall 0xc61b, 0x5c9e  ; SoundMgr::playVoicePair@s2:5C9E
loc_C608:
4:C608  c41ea002             les bx, ptr [0x2a0]
4:C60C  26837f1200           cmp word ptr es:[bx + 0x12], 0
4:C611  750a                 jne 0xc61d
4:C613  68d301               push 0x1d3
4:C616  06                   push es
4:C617  53                   push bx
4:C618  9a5c5ca4c6           lcall 0xc6a4, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
loc_C61D:
4:C61D  c45e06               les bx, ptr [bp + 6]
4:C620  26ff7708             push word ptr es:[bx + 8]
4:C624  8d46e0               lea ax, [bp - 0x20]
4:C627  16                   push ss
4:C628  50                   push ax
4:C629  9a8b6a0000           lcall 0, 0x6a8b  ; USER.BeginPaint
4:C62E  8946d8               mov word ptr [bp - 0x28], ax
4:C631  666800000002         push 0x2000000
4:C637  9a97630000           lcall 0, 0x6397  ; GDI.CreateSolidBrush
4:C63C  8946d6               mov word ptr [bp - 0x2a], ax
4:C63F  66c746ce00000000     mov dword ptr [bp - 0x32], 0
4:C647  c45e06               les bx, ptr [bp + 6]
4:C64A  268b87f600           mov ax, word ptr es:[bx + 0xf6]
4:C64F  48                   dec ax
4:C650  8946d2               mov word ptr [bp - 0x2e], ax
4:C653  268b87f800           mov ax, word ptr es:[bx + 0xf8]
4:C658  48                   dec ax
4:C659  8946d4               mov word ptr [bp - 0x2c], ax
4:C65C  ff76d8               push word ptr [bp - 0x28]
4:C65F  8d46ce               lea ax, [bp - 0x32]
4:C662  16                   push ss
4:C663  50                   push ax
4:C664  ff76d6               push word ptr [bp - 0x2a]
4:C667  9affff0000           lcall 0, 0xffff  ; USER.FillRect
4:C66C  ff76d6               push word ptr [bp - 0x2a]
4:C66F  9a27c70000           lcall 0, 0xc727  ; GDI.DeleteObject
4:C674  c45e06               les bx, ptr [bp + 6]
4:C677  26c49fe200           les bx, ptr es:[bx + 0xe2]
4:C67C  66268b470e           mov eax, dword ptr es:[bx + 0xe]
4:C681  668946ca             mov dword ptr [bp - 0x36], eax
4:C685  8d46d8               lea ax, [bp - 0x28]
4:C688  16                   push ss
4:C689  50                   push ax
4:C68A  c45eca               les bx, ptr [bp - 0x36]
4:C68D  06                   push es
4:C68E  53                   push bx
4:C68F  26c41f               les bx, ptr es:[bx]
4:C692  8bf3                 mov si, bx
4:C694  8cc7                 mov di, es
4:C696  26ff5f08             lcall es:[bx + 8]
4:C69A  8946c8               mov word ptr [bp - 0x38], ax
4:C69D  66ff76ca             push dword ptr [bp - 0x36]
4:C6A1  9a7247a9c4           lcall 0xc4a9, 0x4772  ; DIB::rect@s2:4772
4:C6A6  8ec2                 mov es, dx
4:C6A8  8bd8                 mov bx, ax
4:C6AA  8946c4               mov word ptr [bp - 0x3c], ax
4:C6AD  8c46c6               mov word ptr [bp - 0x3a], es
4:C6B0  b88002               mov ax, 0x280
4:C6B3  262b4704             sub ax, word ptr es:[bx + 4]
4:C6B7  99                   cdq
4:C6B8  2bc2                 sub ax, dx
4:C6BA  d1f8                 sar ax, 1
4:C6BC  8946c2               mov word ptr [bp - 0x3e], ax
4:C6BF  268b4708             mov ax, word ptr es:[bx + 8]
4:C6C3  8bc8                 mov cx, ax
4:C6C5  b8e001               mov ax, 0x1e0
4:C6C8  2bc1                 sub ax, cx
4:C6CA  99                   cdq
4:C6CB  2bc2                 sub ax, dx
4:C6CD  d1f8                 sar ax, 1
4:C6CF  8946c0               mov word ptr [bp - 0x40], ax
4:C6D2  03c1                 add ax, cx
4:C6D4  c45e06               les bx, ptr [bp + 6]
4:C6D7  2603871001           add ax, word ptr es:[bx + 0x110]
4:C6DC  2689870c01           mov word ptr es:[bx + 0x10c], ax
4:C6E1  8d46d8               lea ax, [bp - 0x28]
4:C6E4  16                   push ss
4:C6E5  50                   push ax
4:C6E6  268b87fa00           mov ax, word ptr es:[bx + 0xfa]
4:C6EB  0346c2               add ax, word ptr [bp - 0x3e]
4:C6EE  50                   push ax
4:C6EF  268b87fc00           mov ax, word ptr es:[bx + 0xfc]
4:C6F4  260387fe00           add ax, word ptr es:[bx + 0xfe]
4:C6F9  0346c0               add ax, word ptr [bp - 0x40]
4:C6FC  50                   push ax
4:C6FD  66ff76ca             push dword ptr [bp - 0x36]
4:C701  8ec7                 mov es, di
4:C703  26ff5c04             lcall es:[si + 4]
4:C707  8d46d8               lea ax, [bp - 0x28]
4:C70A  16                   push ss
4:C70B  50                   push ax
4:C70C  66ff7606             push dword ptr [bp + 6]
4:C710  90                   nop
4:C711  0e                   push cs
4:C712  e82d00               call 0xc742  ; StoryPage::drawText@s4:C742
4:C715  ff76d8               push word ptr [bp - 0x28]
4:C718  ff76c8               push word ptr [bp - 0x38]
4:C71B  6a00                 push 0
4:C71D  9aea630000           lcall 0, 0x63ea  ; USER.SelectPalette
4:C722  8946c8               mov word ptr [bp - 0x38], ax
4:C725  50                   push ax
4:C726  9af0630000           lcall 0, 0x63f0  ; GDI.DeleteObject
4:C72B  c45e06               les bx, ptr [bp + 6]
4:C72E  26ff7708             push word ptr es:[bx + 8]
4:C732  8d46e0               lea ax, [bp - 0x20]
4:C735  16                   push ss
4:C736  50                   push ax
4:C737  9a9c6a0000           lcall 0, 0x6a9c  ; USER.EndPaint
4:C73C  5e                   pop si
4:C73D  5f                   pop di
4:C73E  c9                   leave
4:C73F  ca0400               retf 4

; ---------------- StoryPage::drawText@s4:C742 FAR size=340 callers=3
;   apis: GDI.SetBkColor, GDI.SetTextColor, USER.DrawText
;   DrawText in the 400x30 box
4:C742  c81a0000             enter 0x1a, 0
4:C746  c45e06               les bx, ptr [bp + 6]
4:C749  662683bf080100       cmp dword ptr es:[bx + 0x108], 0
4:C750  0f843e01             je 0xc892
4:C754  26c49f0801           les bx, ptr es:[bx + 0x108]
4:C759  26803f00             cmp byte ptr es:[bx], 0
4:C75D  0f843101             je 0xc892
4:C761  c45e0a               les bx, ptr [bp + 0xa]
4:C764  26ff37               push word ptr es:[bx]
4:C767  666800800000         push 0x8000
4:C76D  9a7fc80000           lcall 0, 0xc87f  ; GDI.SetTextColor
4:C772  8946fc               mov word ptr [bp - 4], ax
4:C775  8956fe               mov word ptr [bp - 2], dx
4:C778  c45e0a               les bx, ptr [bp + 0xa]
4:C77B  26ff37               push word ptr es:[bx]
4:C77E  666800000002         push 0x2000000
4:C784  9a8ec80000           lcall 0, 0xc88e  ; GDI.SetBkColor
4:C789  8946f8               mov word ptr [bp - 8], ax
4:C78C  8956fa               mov word ptr [bp - 6], dx
4:C78F  c45e06               les bx, ptr [bp + 6]
4:C792  2683bf060100         cmp word ptr es:[bx + 0x106], 0
4:C798  0f858400             jne 0xc820
4:C79C  33c0                 xor ax, ax
4:C79E  8946e8               mov word ptr [bp - 0x18], ax
4:C7A1  8946ea               mov word ptr [bp - 0x16], ax
4:C7A4  268b8f0e01           mov cx, word ptr es:[bx + 0x10e]
4:C7A9  894eec               mov word ptr [bp - 0x14], cx
4:C7AC  8946ee               mov word ptr [bp - 0x12], ax
4:C7AF  c45e0a               les bx, ptr [bp + 0xa]
4:C7B2  26ff37               push word ptr es:[bx]
4:C7B5  c45e06               les bx, ptr [bp + 6]
4:C7B8  6626ffb70801         push dword ptr es:[bx + 0x108]
4:C7BE  6aff                 push -1
4:C7C0  8d4ee8               lea cx, [bp - 0x18]
4:C7C3  16                   push ss
4:C7C4  51                   push cx
4:C7C5  681004               push 0x410
4:C7C8  9a70c80000           lcall 0, 0xc870  ; USER.DrawText
4:C7CD  b88002               mov ax, 0x280
4:C7D0  2b46ec               sub ax, word ptr [bp - 0x14]
4:C7D3  99                   cdq
4:C7D4  2bc2                 sub ax, dx
4:C7D6  d1f8                 sar ax, 1
4:C7D8  c45e06               les bx, ptr [bp + 6]
4:C7DB  2689870001           mov word ptr es:[bx + 0x100], ax
4:C7E0  268b870c01           mov ax, word ptr es:[bx + 0x10c]
4:C7E5  2689870201           mov word ptr es:[bx + 0x102], ax
4:C7EA  268b870001           mov ax, word ptr es:[bx + 0x100]
4:C7EF  0346ec               add ax, word ptr [bp - 0x14]
4:C7F2  2689870401           mov word ptr es:[bx + 0x104], ax
4:C7F7  268b870201           mov ax, word ptr es:[bx + 0x102]
4:C7FC  0346ee               add ax, word ptr [bp - 0x12]
4:C7FF  2689870601           mov word ptr es:[bx + 0x106], ax
4:C804  263987f800           cmp word ptr es:[bx + 0xf8], ax
4:C809  7f15                 jg 0xc820
4:C80B  262b87f800           sub ax, word ptr es:[bx + 0xf8]
4:C810  8946e6               mov word ptr [bp - 0x1a], ax
4:C813  2629870201           sub word ptr es:[bx + 0x102], ax
4:C818  8b46e6               mov ax, word ptr [bp - 0x1a]
4:C81B  2629870601           sub word ptr es:[bx + 0x106], ax
loc_C820:
4:C820  c45e06               les bx, ptr [bp + 6]
4:C823  268b87fa00           mov ax, word ptr es:[bx + 0xfa]
4:C828  2603870001           add ax, word ptr es:[bx + 0x100]
4:C82D  8946f0               mov word ptr [bp - 0x10], ax
4:C830  268b87fc00           mov ax, word ptr es:[bx + 0xfc]
4:C835  2603870201           add ax, word ptr es:[bx + 0x102]
4:C83A  8946f2               mov word ptr [bp - 0xe], ax
4:C83D  268b87fa00           mov ax, word ptr es:[bx + 0xfa]
4:C842  2603870401           add ax, word ptr es:[bx + 0x104]
4:C847  8946f4               mov word ptr [bp - 0xc], ax
4:C84A  268b87fc00           mov ax, word ptr es:[bx + 0xfc]
4:C84F  2603870601           add ax, word ptr es:[bx + 0x106]
4:C854  8946f6               mov word ptr [bp - 0xa], ax
4:C857  c45e0a               les bx, ptr [bp + 0xa]
4:C85A  26ff37               push word ptr es:[bx]
4:C85D  c45e06               les bx, ptr [bp + 6]
4:C860  6626ffb70801         push dword ptr es:[bx + 0x108]
4:C866  6aff                 push -1
4:C868  8d46f0               lea ax, [bp - 0x10]
4:C86B  16                   push ss
4:C86C  50                   push ax
4:C86D  6a10                 push 0x10
4:C86F  9affff0000           lcall 0, 0xffff  ; USER.DrawText
4:C874  c45e0a               les bx, ptr [bp + 0xa]
4:C877  26ff37               push word ptr es:[bx]
4:C87A  66ff76fc             push dword ptr [bp - 4]
4:C87E  9affff0000           lcall 0, 0xffff  ; GDI.SetTextColor
4:C883  c45e0a               les bx, ptr [bp + 0xa]
4:C886  26ff37               push word ptr es:[bx]
4:C889  66ff76f8             push dword ptr [bp - 8]
4:C88D  9affff0000           lcall 0, 0xffff  ; GDI.SetBkColor
loc_C892:
4:C892  c9                   leave
4:C893  ca0800               retf 8

; ---------------- StoryPage::scalar_dtor@s4:C896 FAR size=194 callers=0
;   deleting destructor
4:C896  55                   push bp
4:C897  8bec                 mov bp, sp
4:C899  66ff7606             push dword ptr [bp + 6]
4:C89D  90                   nop
4:C89E  0e                   push cs
4:C89F  e876fc               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:C8A2  f6460a01             test byte ptr [bp + 0xa], 1
4:C8A6  7409                 je 0xc8b1
4:C8A8  66ff7606             push dword ptr [bp + 6]
4:C8AC  9ace1735c5           lcall 0xc535, 0x17ce  ; operator_delete@s1:17CE
loc_C8B1:
4:C8B1  8b4606               mov ax, word ptr [bp + 6]
4:C8B4  8b5608               mov dx, word ptr [bp + 8]
4:C8B7  c9                   leave
4:C8B8  ca0600               retf 6
4:C8BB  db 90 96 c8 f2 c8 ea 68 ce c8 16 03 ca c8 8c 02 1a
4:C8CB  db c9 40 96 d2 c8 64 96 d6 c8 2c 37 da c8 f2 97 de
4:C8DB  db c8 3c 37 e2 c8 40 37 e6 c8 44 37 ea c8 48 37 ee
4:C8EB  db c8 4c 37 f6 c8 78 c5 28 c5 98 96 fa c8 50 37 fe
4:C8FB  db c8 54 37 02 c9 60 9c 06 c9 58 37 0a c9 24 63 0e
4:C90B  db c9 4e 9c 12 c9 62 37 16 c9 4a 9c 22 c9 b2 03 1e
4:C91B  db c9 d6 03 26 c9 4a 6a 2a c9 fa 03 4e c9 02 6b 2e
4:C92B  db c9 7a 37 32 c9 52 9c 36 c9 56 9c 3a c9 16 9c 3e
4:C93B  db c9 30 9c 42 c9 86 9c 46 c9 c4 9c 4a c9 e0 9c 52
4:C94B  db c9 ae 02 71 c5 28 63 56 c9 2c 63 06 c6

; ---------------- StoryPage38::StoryPage38@s4:C958 FAR size=78 callers=1
;   story page, mode 38: picture 241, voice 141, 8000 ms, then command 154
4:C958  c8040000             enter 4, 0
4:C95C  66ff760c             push dword ptr [bp + 0xc]
4:C960  ff760a               push word ptr [bp + 0xa]
4:C963  6668f1009a00         push 0x9a00f1
4:C969  666801008d00         push 0x8d0001
4:C96F  8d46fc               lea ax, [bp - 4]
4:C972  16                   push ss
4:C973  50                   push ax
4:C974  9a1a94c2c8           lcall 0xc8c2, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:C979  52                   push dx
4:C97A  50                   push ax
4:C97B  66682600401f         push 0x1f400026
4:C981  666800003207         push 0x7320000
4:C987  66ff7606             push dword ptr [bp + 6]
4:C98B  90                   nop
4:C98C  0e                   push cs
4:C98D  e872fa               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:C990  c45e06               les bx, ptr [bp + 6]
4:C993  26c7075adc           mov word ptr es:[bx], 0xdc5a
4:C998  26c74702bec8         mov word ptr es:[bx + 2], 0xc8be  ; SEGMENT s4:0000
4:C99E  8bc3                 mov ax, bx
4:C9A0  8cc2                 mov dx, es
4:C9A2  c9                   leave
4:C9A3  ca0a00               retf 0xa

; ---------------- StoryPage39::StoryPage39@s4:C9A6 FAR size=78 callers=1
;   story page, mode 39: picture 242, voice 142, 7000 ms, then command 160
4:C9A6  c8040000             enter 4, 0
4:C9AA  66ff760c             push dword ptr [bp + 0xc]
4:C9AE  ff760a               push word ptr [bp + 0xa]
4:C9B1  6668f200a000         push 0xa000f2
4:C9B7  666801008e00         push 0x8e0001
4:C9BD  8d46fc               lea ax, [bp - 4]
4:C9C0  16                   push ss
4:C9C1  50                   push ax
4:C9C2  9a1a9477c9           lcall 0xc977, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:C9C7  52                   push dx
4:C9C8  50                   push ax
4:C9C9  66682700581b         push 0x1b580027
4:C9CF  666800003307         push 0x7330000
4:C9D5  66ff7606             push dword ptr [bp + 6]
4:C9D9  90                   nop
4:C9DA  0e                   push cs
4:C9DB  e824fa               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:C9DE  c45e06               les bx, ptr [bp + 6]
4:C9E1  26c707ded6           mov word ptr es:[bx], 0xd6de
4:C9E6  26c747029cc9         mov word ptr es:[bx + 2], 0xc99c  ; SEGMENT s4:0000
4:C9EC  8bc3                 mov ax, bx
4:C9EE  8cc2                 mov dx, es
4:C9F0  c9                   leave
4:C9F1  ca0a00               retf 0xa

; ---------------- StoryPage40::StoryPage40@s4:C9F4 FAR size=84 callers=1
;   story page, mode 40: picture 243, voice 143, 13000 ms, then command 166
4:C9F4  c8040000             enter 4, 0
4:C9F8  66ff760c             push dword ptr [bp + 0xc]
4:C9FC  ff760a               push word ptr [bp + 0xa]
4:C9FF  6668f300a600         push 0xa600f3
4:CA05  666801008f00         push 0x8f0001
4:CA0B  8d46fc               lea ax, [bp - 4]
4:CA0E  16                   push ss
4:CA0F  50                   push ax
4:CA10  9a1a94c5c9           lcall 0xc9c5, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CA15  52                   push dx
4:CA16  50                   push ax
4:CA17  66682800c832         push 0x32c80028
4:CA1D  666800003407         push 0x7340000
4:CA23  66ff7606             push dword ptr [bp + 6]
4:CA27  90                   nop
4:CA28  0e                   push cs
4:CA29  e8d6f9               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CA2C  c45e06               les bx, ptr [bp + 6]
4:CA2F  26c70786da           mov word ptr es:[bx], 0xda86
4:CA34  26c74702eac9         mov word ptr es:[bx + 2], 0xc9ea  ; SEGMENT s4:0000
4:CA3A  2683af0e0119         sub word ptr es:[bx + 0x10e], 0x19
4:CA40  8bc3                 mov ax, bx
4:CA42  8cc2                 mov dx, es
4:CA44  c9                   leave
4:CA45  ca0a00               retf 0xa

; ---------------- StoryPage41::StoryPage41@s4:CA48 FAR size=78 callers=1
;   story page, mode 41: picture 244, voice 144, 14000 ms, then command 161
4:CA48  c8040000             enter 4, 0
4:CA4C  66ff760c             push dword ptr [bp + 0xc]
4:CA50  ff760a               push word ptr [bp + 0xa]
4:CA53  6668f400a100         push 0xa100f4
4:CA59  666801009000         push 0x900001
4:CA5F  8d46fc               lea ax, [bp - 4]
4:CA62  16                   push ss
4:CA63  50                   push ax
4:CA64  9a1a9413ca           lcall 0xca13, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CA69  52                   push dx
4:CA6A  50                   push ax
4:CA6B  66682900b036         push 0x36b00029
4:CA71  666800003507         push 0x7350000
4:CA77  66ff7606             push dword ptr [bp + 6]
4:CA7B  90                   nop
4:CA7C  0e                   push cs
4:CA7D  e882f9               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CA80  c45e06               les bx, ptr [bp + 6]
4:CA83  26c7070ad5           mov word ptr es:[bx], 0xd50a
4:CA88  26c7470238ca         mov word ptr es:[bx + 2], 0xca38  ; SEGMENT s4:0000
4:CA8E  8bc3                 mov ax, bx
4:CA90  8cc2                 mov dx, es
4:CA92  c9                   leave
4:CA93  ca0a00               retf 0xa

; ---------------- StoryPage42::StoryPage42@s4:CA96 FAR size=84 callers=1
;   story page, mode 42: picture 245, voice 146, 26000 ms, then command 191
4:CA96  c8040000             enter 4, 0
4:CA9A  66ff760c             push dword ptr [bp + 0xc]
4:CA9E  ff760a               push word ptr [bp + 0xa]
4:CAA1  6668f500bf00         push 0xbf00f5
4:CAA7  666801009200         push 0x920001
4:CAAD  8d46fc               lea ax, [bp - 4]
4:CAB0  16                   push ss
4:CAB1  50                   push ax
4:CAB2  9a1a9467ca           lcall 0xca67, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CAB7  52                   push dx
4:CAB8  50                   push ax
4:CAB9  66682a009065         push 0x6590002a
4:CABF  666837073607         push 0x7360737
4:CAC5  66ff7606             push dword ptr [bp + 6]
4:CAC9  90                   nop
4:CACA  0e                   push cs
4:CACB  e834f9               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CACE  c45e06               les bx, ptr [bp + 6]
4:CAD1  26c707b2d8           mov word ptr es:[bx], 0xd8b2
4:CAD6  26c747028cca         mov word ptr es:[bx + 2], 0xca8c  ; SEGMENT s4:0000
4:CADC  2683870e0164         add word ptr es:[bx + 0x10e], 0x64
4:CAE2  8bc3                 mov ax, bx
4:CAE4  8cc2                 mov dx, es
4:CAE6  c9                   leave
4:CAE7  ca0a00               retf 0xa

; ---------------- StoryPage43::StoryPage43@s4:CAEA FAR size=78 callers=1
;   story page, mode 43: picture 246, voice 147, 9000 ms, then command 147
4:CAEA  c8040000             enter 4, 0
4:CAEE  66ff760c             push dword ptr [bp + 0xc]
4:CAF2  ff760a               push word ptr [bp + 0xa]
4:CAF5  6668f6009300         push 0x9300f6
4:CAFB  666801009300         push 0x930001
4:CB01  8d46fc               lea ax, [bp - 4]
4:CB04  16                   push ss
4:CB05  50                   push ax
4:CB06  9a1a94b5ca           lcall 0xcab5, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CB0B  52                   push dx
4:CB0C  50                   push ax
4:CB0D  66682b002823         push 0x2328002b
4:CB13  666800003807         push 0x7380000
4:CB19  66ff7606             push dword ptr [bp + 6]
4:CB1D  90                   nop
4:CB1E  0e                   push cs
4:CB1F  e8e0f8               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CB22  c45e06               les bx, ptr [bp + 6]
4:CB25  26c707bedb           mov word ptr es:[bx], 0xdbbe
4:CB2A  26c74702daca         mov word ptr es:[bx + 2], 0xcada  ; SEGMENT s4:0000
4:CB30  8bc3                 mov ax, bx
4:CB32  8cc2                 mov dx, es
4:CB34  c9                   leave
4:CB35  ca0a00               retf 0xa

; ---------------- StoryPage44::StoryPage44@s4:CB38 FAR size=78 callers=1
;   story page, mode 44: picture 247, voice 148, 13000 ms, then command 148
4:CB38  c8040000             enter 4, 0
4:CB3C  66ff760c             push dword ptr [bp + 0xc]
4:CB40  ff760a               push word ptr [bp + 0xa]
4:CB43  6668f7009400         push 0x9400f7
4:CB49  666801009400         push 0x940001
4:CB4F  8d46fc               lea ax, [bp - 4]
4:CB52  16                   push ss
4:CB53  50                   push ax
4:CB54  9a1a9409cb           lcall 0xcb09, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CB59  52                   push dx
4:CB5A  50                   push ax
4:CB5B  66682c00c832         push 0x32c8002c
4:CB61  666800003907         push 0x7390000
4:CB67  66ff7606             push dword ptr [bp + 6]
4:CB6B  90                   nop
4:CB6C  0e                   push cs
4:CB6D  e892f8               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CB70  c45e06               les bx, ptr [bp + 6]
4:CB73  26c70742d6           mov word ptr es:[bx], 0xd642
4:CB78  26c747022ecb         mov word ptr es:[bx + 2], 0xcb2e  ; SEGMENT s4:0000
4:CB7E  8bc3                 mov ax, bx
4:CB80  8cc2                 mov dx, es
4:CB82  c9                   leave
4:CB83  ca0a00               retf 0xa

; ---------------- StoryPage45::StoryPage45@s4:CB86 FAR size=84 callers=1
;   story page, mode 45: picture 248, voice 150, 9000 ms, then command 194
4:CB86  c8040000             enter 4, 0
4:CB8A  66ff760c             push dword ptr [bp + 0xc]
4:CB8E  ff760a               push word ptr [bp + 0xa]
4:CB91  6668f800c200         push 0xc200f8
4:CB97  666801009600         push 0x960001
4:CB9D  8d46fc               lea ax, [bp - 4]
4:CBA0  16                   push ss
4:CBA1  50                   push ax
4:CBA2  9a1a9457cb           lcall 0xcb57, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CBA7  52                   push dx
4:CBA8  50                   push ax
4:CBA9  66682d002823         push 0x2328002d
4:CBAF  666800003a07         push 0x73a0000
4:CBB5  66ff7606             push dword ptr [bp + 6]
4:CBB9  90                   nop
4:CBBA  0e                   push cs
4:CBBB  e844f8               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CBBE  c45e06               les bx, ptr [bp + 6]
4:CBC1  26c707ead9           mov word ptr es:[bx], 0xd9ea
4:CBC6  26c747027ccb         mov word ptr es:[bx + 2], 0xcb7c  ; SEGMENT s4:0000
4:CBCC  2683870e0164         add word ptr es:[bx + 0x10e], 0x64
4:CBD2  8bc3                 mov ax, bx
4:CBD4  8cc2                 mov dx, es
4:CBD6  c9                   leave
4:CBD7  ca0a00               retf 0xa

; ---------------- StoryPage46::StoryPage46@s4:CBDA FAR size=78 callers=1
;   story page, mode 46: picture 249, voice 151, 11000 ms, then command 197
4:CBDA  c8040000             enter 4, 0
4:CBDE  66ff760c             push dword ptr [bp + 0xc]
4:CBE2  ff760a               push word ptr [bp + 0xa]
4:CBE5  6668f900c500         push 0xc500f9
4:CBEB  666801009700         push 0x970001
4:CBF1  8d46fc               lea ax, [bp - 4]
4:CBF4  16                   push ss
4:CBF5  50                   push ax
4:CBF6  9a1a94a5cb           lcall 0xcba5, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CBFB  52                   push dx
4:CBFC  50                   push ax
4:CBFD  66682e00f82a         push 0x2af8002e
4:CC03  666800003b07         push 0x73b0000
4:CC09  66ff7606             push dword ptr [bp + 6]
4:CC0D  90                   nop
4:CC0E  0e                   push cs
4:CC0F  e8f0f7               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CC12  c45e06               les bx, ptr [bp + 6]
4:CC15  26c7076ed4           mov word ptr es:[bx], 0xd46e
4:CC1A  26c74702cacb         mov word ptr es:[bx + 2], 0xcbca  ; SEGMENT s4:0000
4:CC20  8bc3                 mov ax, bx
4:CC22  8cc2                 mov dx, es
4:CC24  c9                   leave
4:CC25  ca0a00               retf 0xa

; ---------------- StoryPage47::StoryPage47@s4:CC28 FAR size=78 callers=1
;   story page, mode 47: picture 250, voice 152, 10000 ms, then command 163
4:CC28  c8040000             enter 4, 0
4:CC2C  66ff760c             push dword ptr [bp + 0xc]
4:CC30  ff760a               push word ptr [bp + 0xa]
4:CC33  6668fa00a300         push 0xa300fa
4:CC39  666801009800         push 0x980001
4:CC3F  8d46fc               lea ax, [bp - 4]
4:CC42  16                   push ss
4:CC43  50                   push ax
4:CC44  9a1a94f9cb           lcall 0xcbf9, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CC49  52                   push dx
4:CC4A  50                   push ax
4:CC4B  66682f001027         push 0x2710002f
4:CC51  666800003c07         push 0x73c0000
4:CC57  66ff7606             push dword ptr [bp + 6]
4:CC5B  90                   nop
4:CC5C  0e                   push cs
4:CC5D  e8a2f7               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CC60  c45e06               les bx, ptr [bp + 6]
4:CC63  26c70716d8           mov word ptr es:[bx], 0xd816
4:CC68  26c747021ecc         mov word ptr es:[bx + 2], 0xcc1e  ; SEGMENT s4:0000
4:CC6E  8bc3                 mov ax, bx
4:CC70  8cc2                 mov dx, es
4:CC72  c9                   leave
4:CC73  ca0a00               retf 0xa

; ---------------- StoryPage48::StoryPage48@s4:CC76 FAR size=78 callers=1
;   story page, mode 48: picture 251, voice 153, 25000 ms, then command 168
4:CC76  c8040000             enter 4, 0
4:CC7A  66ff760c             push dword ptr [bp + 0xc]
4:CC7E  ff760a               push word ptr [bp + 0xa]
4:CC81  6668fb00a800         push 0xa800fb
4:CC87  666801009900         push 0x990001
4:CC8D  8d46fc               lea ax, [bp - 4]
4:CC90  16                   push ss
4:CC91  50                   push ax
4:CC92  9a1a9447cc           lcall 0xcc47, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CC97  52                   push dx
4:CC98  50                   push ax
4:CC99  66683000a861         push 0x61a80030
4:CC9F  66683e073d07         push 0x73d073e
4:CCA5  66ff7606             push dword ptr [bp + 6]
4:CCA9  90                   nop
4:CCAA  0e                   push cs
4:CCAB  e854f7               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CCAE  c45e06               les bx, ptr [bp + 6]
4:CCB1  26c70722db           mov word ptr es:[bx], 0xdb22
4:CCB6  26c747026ccc         mov word ptr es:[bx + 2], 0xcc6c  ; SEGMENT s4:0000
4:CCBC  8bc3                 mov ax, bx
4:CCBE  8cc2                 mov dx, es
4:CCC0  c9                   leave
4:CCC1  ca0a00               retf 0xa

; ---------------- StoryPage49::StoryPage49@s4:CCC4 FAR size=78 callers=1
;   story page, mode 49: picture 252, voice 155, 23000 ms, then command 169
4:CCC4  c8040000             enter 4, 0
4:CCC8  66ff760c             push dword ptr [bp + 0xc]
4:CCCC  ff760a               push word ptr [bp + 0xa]
4:CCCF  6668fc00a900         push 0xa900fc
4:CCD5  666801009b00         push 0x9b0001
4:CCDB  8d46fc               lea ax, [bp - 4]
4:CCDE  16                   push ss
4:CCDF  50                   push ax
4:CCE0  9a1a9495cc           lcall 0xcc95, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CCE5  52                   push dx
4:CCE6  50                   push ax
4:CCE7  66683100d859         push 0x59d80031
4:CCED  666840073f07         push 0x73f0740
4:CCF3  66ff7606             push dword ptr [bp + 6]
4:CCF7  90                   nop
4:CCF8  0e                   push cs
4:CCF9  e806f7               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CCFC  c45e06               les bx, ptr [bp + 6]
4:CCFF  26c707a6d5           mov word ptr es:[bx], 0xd5a6
4:CD04  26c74702bacc         mov word ptr es:[bx + 2], 0xccba  ; SEGMENT s4:0000
4:CD0A  8bc3                 mov ax, bx
4:CD0C  8cc2                 mov dx, es
4:CD0E  c9                   leave
4:CD0F  ca0a00               retf 0xa

; ---------------- StoryPage50::StoryPage50@s4:CD12 FAR size=78 callers=1
;   story page, mode 50: picture 253, voice 156, 10000 ms, then command 124
4:CD12  c8040000             enter 4, 0
4:CD16  66ff760c             push dword ptr [bp + 0xc]
4:CD1A  ff760a               push word ptr [bp + 0xa]
4:CD1D  6668fd007c00         push 0x7c00fd
4:CD23  666801009c00         push 0x9c0001
4:CD29  8d46fc               lea ax, [bp - 4]
4:CD2C  16                   push ss
4:CD2D  50                   push ax
4:CD2E  9a1a94e3cc           lcall 0xcce3, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CD33  52                   push dx
4:CD34  50                   push ax
4:CD35  666832001027         push 0x27100032
4:CD3B  666800004107         push 0x7410000
4:CD41  66ff7606             push dword ptr [bp + 6]
4:CD45  90                   nop
4:CD46  0e                   push cs
4:CD47  e8b8f6               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CD4A  c45e06               les bx, ptr [bp + 6]
4:CD4D  26c7074ed9           mov word ptr es:[bx], 0xd94e
4:CD52  26c7470208cd         mov word ptr es:[bx + 2], 0xcd08  ; SEGMENT s4:0000
4:CD58  8bc3                 mov ax, bx
4:CD5A  8cc2                 mov dx, es
4:CD5C  c9                   leave
4:CD5D  ca0a00               retf 0xa

; ---------------- StoryPage51::StoryPage51@s4:CD60 FAR size=72 callers=1
;   story page, mode 51: picture 254, 10000 ms, then command 201
4:CD60  c8040000             enter 4, 0
4:CD64  66ff760c             push dword ptr [bp + 0xc]
4:CD68  ff760a               push word ptr [bp + 0xa]
4:CD6B  6668fe00c900         push 0xc900fe
4:CD71  666a01               push 1
4:CD74  8d46fc               lea ax, [bp - 4]
4:CD77  16                   push ss
4:CD78  50                   push ax
4:CD79  9a1a9431cd           lcall 0xcd31, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CD7E  52                   push dx
4:CD7F  50                   push ax
4:CD80  666833001027         push 0x27100033
4:CD86  666a00               push 0
4:CD89  66ff7606             push dword ptr [bp + 6]
4:CD8D  90                   nop
4:CD8E  0e                   push cs
4:CD8F  e870f6               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CD92  c45e06               les bx, ptr [bp + 6]
4:CD95  26c707d2d3           mov word ptr es:[bx], 0xd3d2
4:CD9A  26c7470256cd         mov word ptr es:[bx + 2], 0xcd56  ; SEGMENT s4:0000
4:CDA0  8bc3                 mov ax, bx
4:CDA2  8cc2                 mov dx, es
4:CDA4  c9                   leave
4:CDA5  ca0a00               retf 0xa

; ---------------- StoryPage51::paint@s4:CDA8 size=460 callers=0
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.FillRect, USER.PostMessage, USER.SelectPalette
;   (vslot 13) the last page's paint
4:CDA8  c84c0000             enter 0x4c, 0
4:CDAC  6a02                 push 2
4:CDAE  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:CDB3  9aba2088c5           lcall 0xc588, 0x20ba  ; Registry_get@s3:20BA
4:CDB8  8946dc               mov word ptr [bp - 0x24], ax
4:CDBB  8956de               mov word ptr [bp - 0x22], dx
4:CDBE  c45edc               les bx, ptr [bp - 0x24]
4:CDC1  268b4720             mov ax, word ptr es:[bx + 0x20]
4:CDC5  8946da               mov word ptr [bp - 0x26], ax
4:CDC8  0bc0                 or ax, ax
4:CDCA  753e                 jne 0xce0a
4:CDCC  c45e06               les bx, ptr [bp + 6]
4:CDCF  26ff7708             push word ptr es:[bx + 8]
4:CDD3  8d46e0               lea ax, [bp - 0x20]
4:CDD6  16                   push ss
4:CDD7  50                   push ax
4:CDD8  9a4bce0000           lcall 0, 0xce4b  ; USER.BeginPaint
4:CDDD  c45e06               les bx, ptr [bp + 6]
4:CDE0  26ff7708             push word ptr es:[bx + 8]
4:CDE4  8d46e0               lea ax, [bp - 0x20]
4:CDE7  16                   push ss
4:CDE8  50                   push ax
4:CDE9  9a6ccf0000           lcall 0, 0xcf6c  ; USER.EndPaint
4:CDEE  ff369603             push word ptr [0x396]
4:CDF2  681101               push 0x111
4:CDF5  c45e06               les bx, ptr [bp + 6]
4:CDF8  26ffb7ea00           push word ptr es:[bx + 0xea]
4:CDFD  666a00               push 0
4:CE00  9ad3c50000           lcall 0, 0xc5d3  ; USER.PostMessage
4:CE05  c9                   leave
4:CE06  ca0400               retf 4
4:CE09  db 90
loc_CE0A:
4:CE0A  c45e06               les bx, ptr [bp + 6]
4:CE0D  2683bff00000         cmp word ptr es:[bx + 0xf0], 0
4:CE13  7529                 jne 0xce3e
4:CE15  26c787f0000100       mov word ptr es:[bx + 0xf0], 1
4:CE1C  68f301               push 0x1f3
4:CE1F  66ff36a002           push dword ptr [0x2a0]
4:CE24  9a5c5c3cce           lcall 0xce3c, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
4:CE29  c41ea002             les bx, ptr [0x2a0]
4:CE2D  26837f1200           cmp word ptr es:[bx + 0x12], 0
4:CE32  750a                 jne 0xce3e
4:CE34  68d301               push 0x1d3
4:CE37  06                   push es
4:CE38  53                   push bx
4:CE39  9a5c5cc1ce           lcall 0xcec1, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
loc_CE3E:
4:CE3E  c45e06               les bx, ptr [bp + 6]
4:CE41  26ff7708             push word ptr es:[bx + 8]
4:CE45  8d46e0               lea ax, [bp - 0x20]
4:CE48  16                   push ss
4:CE49  50                   push ax
4:CE4A  9aabc50000           lcall 0, 0xc5ab  ; USER.BeginPaint
4:CE4F  8946d8               mov word ptr [bp - 0x28], ax
4:CE52  666800000002         push 0x2000000
4:CE58  9a38c60000           lcall 0, 0xc638  ; GDI.CreateSolidBrush
4:CE5D  8946d6               mov word ptr [bp - 0x2a], ax
4:CE60  66c746ce00000000     mov dword ptr [bp - 0x32], 0
4:CE68  c45e06               les bx, ptr [bp + 6]
4:CE6B  268b87f600           mov ax, word ptr es:[bx + 0xf6]
4:CE70  48                   dec ax
4:CE71  8946d2               mov word ptr [bp - 0x2e], ax
4:CE74  268b87f800           mov ax, word ptr es:[bx + 0xf8]
4:CE79  48                   dec ax
4:CE7A  8946d4               mov word ptr [bp - 0x2c], ax
4:CE7D  ff76d8               push word ptr [bp - 0x28]
4:CE80  8d46ce               lea ax, [bp - 0x32]
4:CE83  16                   push ss
4:CE84  50                   push ax
4:CE85  ff76d6               push word ptr [bp - 0x2a]
4:CE88  9a68c60000           lcall 0, 0xc668  ; USER.FillRect
4:CE8D  ff76d6               push word ptr [bp - 0x2a]
4:CE90  9a5bcf0000           lcall 0, 0xcf5b  ; GDI.DeleteObject
4:CE95  c45e06               les bx, ptr [bp + 6]
4:CE98  26c49fe200           les bx, ptr es:[bx + 0xe2]
4:CE9D  66268b470e           mov eax, dword ptr es:[bx + 0xe]
4:CEA2  668946ca             mov dword ptr [bp - 0x36], eax
4:CEA6  8d46d8               lea ax, [bp - 0x28]
4:CEA9  16                   push ss
4:CEAA  50                   push ax
4:CEAB  c45eca               les bx, ptr [bp - 0x36]
4:CEAE  06                   push es
4:CEAF  53                   push bx
4:CEB0  26c41f               les bx, ptr es:[bx]
4:CEB3  26ff5f08             lcall es:[bx + 8]
4:CEB7  8946c8               mov word ptr [bp - 0x38], ax
4:CEBA  66ff76ca             push dword ptr [bp - 0x36]
4:CEBE  9a72477ccd           lcall 0xcd7c, 0x4772  ; DIB::rect@s2:4772
4:CEC3  8ec2                 mov es, dx
4:CEC5  8bd8                 mov bx, ax
4:CEC7  8946c4               mov word ptr [bp - 0x3c], ax
4:CECA  8c46c6               mov word ptr [bp - 0x3a], es
4:CECD  b88002               mov ax, 0x280
4:CED0  262b4704             sub ax, word ptr es:[bx + 4]
4:CED4  99                   cdq
4:CED5  2bc2                 sub ax, dx
4:CED7  d1f8                 sar ax, 1
4:CED9  8946c2               mov word ptr [bp - 0x3e], ax
4:CEDC  b8e001               mov ax, 0x1e0
4:CEDF  268b4f08             mov cx, word ptr es:[bx + 8]
4:CEE3  2bc1                 sub ax, cx
4:CEE5  99                   cdq
4:CEE6  2bc2                 sub ax, dx
4:CEE8  d1f8                 sar ax, 1
4:CEEA  8946c0               mov word ptr [bp - 0x40], ax
4:CEED  03c1                 add ax, cx
4:CEEF  c45e06               les bx, ptr [bp + 6]
4:CEF2  2603871001           add ax, word ptr es:[bx + 0x110]
4:CEF7  2689870c01           mov word ptr es:[bx + 0x10c], ax
4:CEFC  2683bffa0000         cmp word ptr es:[bx + 0xfa], 0
4:CF02  750c                 jne 0xcf10
4:CF04  837ec200             cmp word ptr [bp - 0x3e], 0
4:CF08  7506                 jne 0xcf10
4:CF0A  268387fa0002         add word ptr es:[bx + 0xfa], 2
loc_CF10:
4:CF10  8d46d8               lea ax, [bp - 0x28]
4:CF13  16                   push ss
4:CF14  50                   push ax
4:CF15  c45e06               les bx, ptr [bp + 6]
4:CF18  268b8ffa00           mov cx, word ptr es:[bx + 0xfa]
4:CF1D  034ec2               add cx, word ptr [bp - 0x3e]
4:CF20  51                   push cx
4:CF21  268b8ffc00           mov cx, word ptr es:[bx + 0xfc]
4:CF26  26038ffe00           add cx, word ptr es:[bx + 0xfe]
4:CF2B  034ec0               add cx, word ptr [bp - 0x40]
4:CF2E  51                   push cx
4:CF2F  c45eca               les bx, ptr [bp - 0x36]
4:CF32  06                   push es
4:CF33  53                   push bx
4:CF34  26c41f               les bx, ptr es:[bx]
4:CF37  26ff5f04             lcall es:[bx + 4]
4:CF3B  8d46d8               lea ax, [bp - 0x28]
4:CF3E  16                   push ss
4:CF3F  50                   push ax
4:CF40  66ff7606             push dword ptr [bp + 6]
4:CF44  90                   nop
4:CF45  0e                   push cs
4:CF46  e8f9f7               call 0xc742  ; StoryPage::drawText@s4:C742
4:CF49  ff76d8               push word ptr [bp - 0x28]
4:CF4C  ff76c8               push word ptr [bp - 0x38]
4:CF4F  6a00                 push 0
4:CF51  9a1ec70000           lcall 0, 0xc71e  ; USER.SelectPalette
4:CF56  8946c8               mov word ptr [bp - 0x38], ax
4:CF59  50                   push ax
4:CF5A  9a70c60000           lcall 0, 0xc670  ; GDI.DeleteObject
4:CF5F  c45e06               les bx, ptr [bp + 6]
4:CF62  26ff7708             push word ptr es:[bx + 8]
4:CF66  8d46e0               lea ax, [bp - 0x20]
4:CF69  16                   push ss
4:CF6A  50                   push ax
4:CF6B  9abcc50000           lcall 0, 0xc5bc  ; USER.EndPaint
4:CF70  c9                   leave
4:CF71  ca0400               retf 4

; ---------------- StoryPage52::StoryPage52@s4:CF74 FAR size=76 callers=1
;   story page, mode 52: picture 254, voice 128, 10000 ms, then command 207 (after the landing site)
4:CF74  c8040000             enter 4, 0
4:CF78  66ff760c             push dword ptr [bp + 0xc]
4:CF7C  ff760a               push word ptr [bp + 0xa]
4:CF7F  6668fe00cf00         push 0xcf00fe
4:CF85  666801008000         push 0x800001
4:CF8B  8d46fc               lea ax, [bp - 4]
4:CF8E  16                   push ss
4:CF8F  50                   push ax
4:CF90  9a1a9427ce           lcall 0xce27, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:CF95  52                   push dx
4:CF96  50                   push ax
4:CF97  666834001027         push 0x27100034
4:CF9D  666a00               push 0
4:CFA0  66ff7606             push dword ptr [bp + 6]
4:CFA4  90                   nop
4:CFA5  0e                   push cs
4:CFA6  e859f4               call 0xc402  ; StoryPage::StoryPage@s4:C402
4:CFA9  c45e06               les bx, ptr [bp + 6]
4:CFAC  26c7077ad7           mov word ptr es:[bx], 0xd77a
4:CFB1  26c747029ecd         mov word ptr es:[bx + 2], 0xcd9e  ; SEGMENT s4:0000
4:CFB7  8bc3                 mov ax, bx
4:CFB9  8cc2                 mov dx, es
4:CFBB  c9                   leave
4:CFBC  ca0a00               retf 0xa
4:CFBF  db 00

; ---------------- StoryPage52::paint@s4:CFC0 FAR size=472 callers=0
;   apis: GDI.CreateSolidBrush, GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.FillRect, USER.PostMessage, USER.SelectPalette
;   the landing page's paint
4:CFC0  c84e0000             enter 0x4e, 0
4:CFC4  6a02                 push 2
4:CFC6  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:CFCB  9aba20b6cd           lcall 0xcdb6, 0x20ba  ; Registry_get@s3:20BA
4:CFD0  8946dc               mov word ptr [bp - 0x24], ax
4:CFD3  8956de               mov word ptr [bp - 0x22], dx
4:CFD6  c45edc               les bx, ptr [bp - 0x24]
4:CFD9  268b4720             mov ax, word ptr es:[bx + 0x20]
4:CFDD  8946da               mov word ptr [bp - 0x26], ax
4:CFE0  0bc0                 or ax, ax
4:CFE2  753e                 jne 0xd022
4:CFE4  c45e06               les bx, ptr [bp + 6]
4:CFE7  26ff7708             push word ptr es:[bx + 8]
4:CFEB  8d46e0               lea ax, [bp - 0x20]
4:CFEE  16                   push ss
4:CFEF  50                   push ax
4:CFF0  9a6ed00000           lcall 0, 0xd06e  ; USER.BeginPaint
4:CFF5  c45e06               les bx, ptr [bp + 6]
4:CFF8  26ff7708             push word ptr es:[bx + 8]
4:CFFC  8d46e0               lea ax, [bp - 0x20]
4:CFFF  16                   push ss
4:D000  50                   push ax
4:D001  9a8fd10000           lcall 0, 0xd18f  ; USER.EndPaint
4:D006  ff369603             push word ptr [0x396]
4:D00A  681101               push 0x111
4:D00D  c45e06               les bx, ptr [bp + 6]
4:D010  26ffb7ea00           push word ptr es:[bx + 0xea]
4:D015  666a00               push 0
4:D018  9a01ce0000           lcall 0, 0xce01  ; USER.PostMessage
4:D01D  c9                   leave
4:D01E  ca0400               retf 4
4:D021  db 90
loc_D022:
4:D022  c45e06               les bx, ptr [bp + 6]
4:D025  2683bff00000         cmp word ptr es:[bx + 0xf0], 0
4:D02B  7534                 jne 0xd061
4:D02D  2683bff40000         cmp word ptr es:[bx + 0xf4], 0
4:D033  742c                 je 0xd061
4:D035  26c787f0000100       mov word ptr es:[bx + 0xf0], 1
4:D03C  8d87f200             lea ax, [bx + 0xf2]
4:D040  06                   push es
4:D041  50                   push ax
4:D042  66ff36a002           push dword ptr [0x2a0]
4:D047  9a9e5c5fd0           lcall 0xd05f, 0x5c9e  ; SoundMgr::playVoicePair@s2:5C9E
4:D04C  c41ea002             les bx, ptr [0x2a0]
4:D050  26837f1200           cmp word ptr es:[bx + 0x12], 0
4:D055  750a                 jne 0xd061
4:D057  68d301               push 0x1d3
4:D05A  06                   push es
4:D05B  53                   push bx
4:D05C  9a5c5ce4d0           lcall 0xd0e4, 0x5c5c  ; SoundMgr::playCatalog@s2:5C5C
loc_D061:
4:D061  c45e06               les bx, ptr [bp + 6]
4:D064  26ff7708             push word ptr es:[bx + 8]
4:D068  8d46e0               lea ax, [bp - 0x20]
4:D06B  16                   push ss
4:D06C  50                   push ax
4:D06D  9ad9cd0000           lcall 0, 0xcdd9  ; USER.BeginPaint
4:D072  8946d8               mov word ptr [bp - 0x28], ax
4:D075  666800000002         push 0x2000000
4:D07B  9a59ce0000           lcall 0, 0xce59  ; GDI.CreateSolidBrush
4:D080  8946d6               mov word ptr [bp - 0x2a], ax
4:D083  66c746ce00000000     mov dword ptr [bp - 0x32], 0
4:D08B  c45e06               les bx, ptr [bp + 6]
4:D08E  268b87f600           mov ax, word ptr es:[bx + 0xf6]
4:D093  48                   dec ax
4:D094  8946d2               mov word ptr [bp - 0x2e], ax
4:D097  268b87f800           mov ax, word ptr es:[bx + 0xf8]
4:D09C  48                   dec ax
4:D09D  8946d4               mov word ptr [bp - 0x2c], ax
4:D0A0  ff76d8               push word ptr [bp - 0x28]
4:D0A3  8d46ce               lea ax, [bp - 0x32]
4:D0A6  16                   push ss
4:D0A7  50                   push ax
4:D0A8  ff76d6               push word ptr [bp - 0x2a]
4:D0AB  9a89ce0000           lcall 0, 0xce89  ; USER.FillRect
4:D0B0  ff76d6               push word ptr [bp - 0x2a]
4:D0B3  9a7ed10000           lcall 0, 0xd17e  ; GDI.DeleteObject
4:D0B8  c45e06               les bx, ptr [bp + 6]
4:D0BB  26c49fe200           les bx, ptr es:[bx + 0xe2]
4:D0C0  66268b470e           mov eax, dword ptr es:[bx + 0xe]
4:D0C5  668946ca             mov dword ptr [bp - 0x36], eax
4:D0C9  8d46d8               lea ax, [bp - 0x28]
4:D0CC  16                   push ss
4:D0CD  50                   push ax
4:D0CE  c45eca               les bx, ptr [bp - 0x36]
4:D0D1  06                   push es
4:D0D2  53                   push bx
4:D0D3  26c41f               les bx, ptr es:[bx]
4:D0D6  26ff5f08             lcall es:[bx + 8]
4:D0DA  8946c8               mov word ptr [bp - 0x38], ax
4:D0DD  66ff76ca             push dword ptr [bp - 0x36]
4:D0E1  9a724793cf           lcall 0xcf93, 0x4772  ; DIB::rect@s2:4772
4:D0E6  8ec2                 mov es, dx
4:D0E8  8bd8                 mov bx, ax
4:D0EA  8946c4               mov word ptr [bp - 0x3c], ax
4:D0ED  8c46c6               mov word ptr [bp - 0x3a], es
4:D0F0  b88002               mov ax, 0x280
4:D0F3  262b4704             sub ax, word ptr es:[bx + 4]
4:D0F7  99                   cdq
4:D0F8  2bc2                 sub ax, dx
4:D0FA  d1f8                 sar ax, 1
4:D0FC  8946c2               mov word ptr [bp - 0x3e], ax
4:D0FF  b8e001               mov ax, 0x1e0
4:D102  268b4f08             mov cx, word ptr es:[bx + 8]
4:D106  2bc1                 sub ax, cx
4:D108  99                   cdq
4:D109  2bc2                 sub ax, dx
4:D10B  d1f8                 sar ax, 1
4:D10D  8946c0               mov word ptr [bp - 0x40], ax
4:D110  03c1                 add ax, cx
4:D112  c45e06               les bx, ptr [bp + 6]
4:D115  2603871001           add ax, word ptr es:[bx + 0x110]
4:D11A  2689870c01           mov word ptr es:[bx + 0x10c], ax
4:D11F  2683bffa0000         cmp word ptr es:[bx + 0xfa], 0
4:D125  750c                 jne 0xd133
4:D127  837ec200             cmp word ptr [bp - 0x3e], 0
4:D12B  7506                 jne 0xd133
4:D12D  268387fa0002         add word ptr es:[bx + 0xfa], 2
loc_D133:
4:D133  8d46d8               lea ax, [bp - 0x28]
4:D136  16                   push ss
4:D137  50                   push ax
4:D138  c45e06               les bx, ptr [bp + 6]
4:D13B  268b8ffa00           mov cx, word ptr es:[bx + 0xfa]
4:D140  034ec2               add cx, word ptr [bp - 0x3e]
4:D143  51                   push cx
4:D144  268b8ffc00           mov cx, word ptr es:[bx + 0xfc]
4:D149  26038ffe00           add cx, word ptr es:[bx + 0xfe]
4:D14E  034ec0               add cx, word ptr [bp - 0x40]
4:D151  51                   push cx
4:D152  c45eca               les bx, ptr [bp - 0x36]
4:D155  06                   push es
4:D156  53                   push bx
4:D157  26c41f               les bx, ptr es:[bx]
4:D15A  26ff5f04             lcall es:[bx + 4]
4:D15E  8d46d8               lea ax, [bp - 0x28]
4:D161  16                   push ss
4:D162  50                   push ax
4:D163  66ff7606             push dword ptr [bp + 6]
4:D167  90                   nop
4:D168  0e                   push cs
4:D169  e8d6f5               call 0xc742  ; StoryPage::drawText@s4:C742
4:D16C  ff76d8               push word ptr [bp - 0x28]
4:D16F  ff76c8               push word ptr [bp - 0x38]
4:D172  6a00                 push 0
4:D174  9a52cf0000           lcall 0, 0xcf52  ; USER.SelectPalette
4:D179  8946c8               mov word ptr [bp - 0x38], ax
4:D17C  50                   push ax
4:D17D  9a91ce0000           lcall 0, 0xce91  ; GDI.DeleteObject
4:D182  c45e06               les bx, ptr [bp + 6]
4:D185  26ff7708             push word ptr es:[bx + 8]
4:D189  8d46e0               lea ax, [bp - 0x20]
4:D18C  16                   push ss
4:D18D  50                   push ax
4:D18E  9aeacd0000           lcall 0, 0xcdea  ; USER.EndPaint
4:D193  c9                   leave
4:D194  ca0400               retf 4
4:D197  db 00

; ---------------- StoryPage38::scalar_dtor@s4:D198 FAR size=38 callers=0
;   mode 38 story page deleting destructor
4:D198  c8040000             enter 4, 0
4:D19C  66ff7606             push dword ptr [bp + 6]
4:D1A0  90                   nop
4:D1A1  0e                   push cs
4:D1A2  e873f3               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D1A5  f6460a01             test byte ptr [bp + 0xa], 1
4:D1A9  7409                 je 0xd1b4
4:D1AB  66ff7606             push dword ptr [bp + 6]
4:D1AF  9ace17afc8           lcall 0xc8af, 0x17ce  ; operator_delete@s1:17CE
loc_D1B4:
4:D1B4  8b4606               mov ax, word ptr [bp + 6]
4:D1B7  8b5608               mov dx, word ptr [bp + 8]
4:D1BA  c9                   leave
4:D1BB  ca0600               retf 6

; ---------------- StoryPage39::scalar_dtor@s4:D1BE size=38 callers=0
;   mode 39 story page deleting destructor
4:D1BE  c8040000             enter 4, 0
4:D1C2  66ff7606             push dword ptr [bp + 6]
4:D1C6  90                   nop
4:D1C7  0e                   push cs
4:D1C8  e84df3               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D1CB  f6460a01             test byte ptr [bp + 0xa], 1
4:D1CF  7409                 je 0xd1da
4:D1D1  66ff7606             push dword ptr [bp + 6]
4:D1D5  9ace17b2d1           lcall 0xd1b2, 0x17ce  ; operator_delete@s1:17CE
loc_D1DA:
4:D1DA  8b4606               mov ax, word ptr [bp + 6]
4:D1DD  8b5608               mov dx, word ptr [bp + 8]
4:D1E0  c9                   leave
4:D1E1  ca0600               retf 6

; ---------------- StoryPage40::scalar_dtor@s4:D1E4 size=38 callers=0
;   mode 40 story page deleting destructor
4:D1E4  c8040000             enter 4, 0
4:D1E8  66ff7606             push dword ptr [bp + 6]
4:D1EC  90                   nop
4:D1ED  0e                   push cs
4:D1EE  e827f3               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D1F1  f6460a01             test byte ptr [bp + 0xa], 1
4:D1F5  7409                 je 0xd200
4:D1F7  66ff7606             push dword ptr [bp + 6]
4:D1FB  9ace17d8d1           lcall 0xd1d8, 0x17ce  ; operator_delete@s1:17CE
loc_D200:
4:D200  8b4606               mov ax, word ptr [bp + 6]
4:D203  8b5608               mov dx, word ptr [bp + 8]
4:D206  c9                   leave
4:D207  ca0600               retf 6

; ---------------- StoryPage41::scalar_dtor@s4:D20A size=38 callers=0
;   mode 41 story page deleting destructor
4:D20A  c8040000             enter 4, 0
4:D20E  66ff7606             push dword ptr [bp + 6]
4:D212  90                   nop
4:D213  0e                   push cs
4:D214  e801f3               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D217  f6460a01             test byte ptr [bp + 0xa], 1
4:D21B  7409                 je 0xd226
4:D21D  66ff7606             push dword ptr [bp + 6]
4:D221  9ace17fed1           lcall 0xd1fe, 0x17ce  ; operator_delete@s1:17CE
loc_D226:
4:D226  8b4606               mov ax, word ptr [bp + 6]
4:D229  8b5608               mov dx, word ptr [bp + 8]
4:D22C  c9                   leave
4:D22D  ca0600               retf 6

; ---------------- StoryPage42::scalar_dtor@s4:D230 size=38 callers=0
;   mode 42 story page deleting destructor
4:D230  c8040000             enter 4, 0
4:D234  66ff7606             push dword ptr [bp + 6]
4:D238  90                   nop
4:D239  0e                   push cs
4:D23A  e8dbf2               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D23D  f6460a01             test byte ptr [bp + 0xa], 1
4:D241  7409                 je 0xd24c
4:D243  66ff7606             push dword ptr [bp + 6]
4:D247  9ace1724d2           lcall 0xd224, 0x17ce  ; operator_delete@s1:17CE
loc_D24C:
4:D24C  8b4606               mov ax, word ptr [bp + 6]
4:D24F  8b5608               mov dx, word ptr [bp + 8]
4:D252  c9                   leave
4:D253  ca0600               retf 6

; ---------------- StoryPage43::scalar_dtor@s4:D256 size=38 callers=0
;   mode 43 story page deleting destructor
4:D256  c8040000             enter 4, 0
4:D25A  66ff7606             push dword ptr [bp + 6]
4:D25E  90                   nop
4:D25F  0e                   push cs
4:D260  e8b5f2               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D263  f6460a01             test byte ptr [bp + 0xa], 1
4:D267  7409                 je 0xd272
4:D269  66ff7606             push dword ptr [bp + 6]
4:D26D  9ace174ad2           lcall 0xd24a, 0x17ce  ; operator_delete@s1:17CE
loc_D272:
4:D272  8b4606               mov ax, word ptr [bp + 6]
4:D275  8b5608               mov dx, word ptr [bp + 8]
4:D278  c9                   leave
4:D279  ca0600               retf 6

; ---------------- StoryPage44::scalar_dtor@s4:D27C size=38 callers=0
;   mode 44 story page deleting destructor
4:D27C  c8040000             enter 4, 0
4:D280  66ff7606             push dword ptr [bp + 6]
4:D284  90                   nop
4:D285  0e                   push cs
4:D286  e88ff2               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D289  f6460a01             test byte ptr [bp + 0xa], 1
4:D28D  7409                 je 0xd298
4:D28F  66ff7606             push dword ptr [bp + 6]
4:D293  9ace1770d2           lcall 0xd270, 0x17ce  ; operator_delete@s1:17CE
loc_D298:
4:D298  8b4606               mov ax, word ptr [bp + 6]
4:D29B  8b5608               mov dx, word ptr [bp + 8]
4:D29E  c9                   leave
4:D29F  ca0600               retf 6

; ---------------- StoryPage45::scalar_dtor@s4:D2A2 size=38 callers=0
;   mode 45 story page deleting destructor
4:D2A2  c8040000             enter 4, 0
4:D2A6  66ff7606             push dword ptr [bp + 6]
4:D2AA  90                   nop
4:D2AB  0e                   push cs
4:D2AC  e869f2               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D2AF  f6460a01             test byte ptr [bp + 0xa], 1
4:D2B3  7409                 je 0xd2be
4:D2B5  66ff7606             push dword ptr [bp + 6]
4:D2B9  9ace1796d2           lcall 0xd296, 0x17ce  ; operator_delete@s1:17CE
loc_D2BE:
4:D2BE  8b4606               mov ax, word ptr [bp + 6]
4:D2C1  8b5608               mov dx, word ptr [bp + 8]
4:D2C4  c9                   leave
4:D2C5  ca0600               retf 6

; ---------------- StoryPage46::scalar_dtor@s4:D2C8 size=38 callers=0
;   mode 46 story page deleting destructor
4:D2C8  c8040000             enter 4, 0
4:D2CC  66ff7606             push dword ptr [bp + 6]
4:D2D0  90                   nop
4:D2D1  0e                   push cs
4:D2D2  e843f2               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D2D5  f6460a01             test byte ptr [bp + 0xa], 1
4:D2D9  7409                 je 0xd2e4
4:D2DB  66ff7606             push dword ptr [bp + 6]
4:D2DF  9ace17bcd2           lcall 0xd2bc, 0x17ce  ; operator_delete@s1:17CE
loc_D2E4:
4:D2E4  8b4606               mov ax, word ptr [bp + 6]
4:D2E7  8b5608               mov dx, word ptr [bp + 8]
4:D2EA  c9                   leave
4:D2EB  ca0600               retf 6

; ---------------- StoryPage47::scalar_dtor@s4:D2EE size=38 callers=0
;   mode 47 story page deleting destructor
4:D2EE  c8040000             enter 4, 0
4:D2F2  66ff7606             push dword ptr [bp + 6]
4:D2F6  90                   nop
4:D2F7  0e                   push cs
4:D2F8  e81df2               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D2FB  f6460a01             test byte ptr [bp + 0xa], 1
4:D2FF  7409                 je 0xd30a
4:D301  66ff7606             push dword ptr [bp + 6]
4:D305  9ace17e2d2           lcall 0xd2e2, 0x17ce  ; operator_delete@s1:17CE
loc_D30A:
4:D30A  8b4606               mov ax, word ptr [bp + 6]
4:D30D  8b5608               mov dx, word ptr [bp + 8]
4:D310  c9                   leave
4:D311  ca0600               retf 6

; ---------------- StoryPage48::scalar_dtor@s4:D314 size=38 callers=0
;   mode 48 story page deleting destructor
4:D314  c8040000             enter 4, 0
4:D318  66ff7606             push dword ptr [bp + 6]
4:D31C  90                   nop
4:D31D  0e                   push cs
4:D31E  e8f7f1               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D321  f6460a01             test byte ptr [bp + 0xa], 1
4:D325  7409                 je 0xd330
4:D327  66ff7606             push dword ptr [bp + 6]
4:D32B  9ace1708d3           lcall 0xd308, 0x17ce  ; operator_delete@s1:17CE
loc_D330:
4:D330  8b4606               mov ax, word ptr [bp + 6]
4:D333  8b5608               mov dx, word ptr [bp + 8]
4:D336  c9                   leave
4:D337  ca0600               retf 6

; ---------------- StoryPage49::scalar_dtor@s4:D33A size=38 callers=0
;   mode 49 story page deleting destructor
4:D33A  c8040000             enter 4, 0
4:D33E  66ff7606             push dword ptr [bp + 6]
4:D342  90                   nop
4:D343  0e                   push cs
4:D344  e8d1f1               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D347  f6460a01             test byte ptr [bp + 0xa], 1
4:D34B  7409                 je 0xd356
4:D34D  66ff7606             push dword ptr [bp + 6]
4:D351  9ace172ed3           lcall 0xd32e, 0x17ce  ; operator_delete@s1:17CE
loc_D356:
4:D356  8b4606               mov ax, word ptr [bp + 6]
4:D359  8b5608               mov dx, word ptr [bp + 8]
4:D35C  c9                   leave
4:D35D  ca0600               retf 6

; ---------------- StoryPage50::scalar_dtor@s4:D360 size=38 callers=0
;   mode 50 story page deleting destructor
4:D360  c8040000             enter 4, 0
4:D364  66ff7606             push dword ptr [bp + 6]
4:D368  90                   nop
4:D369  0e                   push cs
4:D36A  e8abf1               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D36D  f6460a01             test byte ptr [bp + 0xa], 1
4:D371  7409                 je 0xd37c
4:D373  66ff7606             push dword ptr [bp + 6]
4:D377  9ace1754d3           lcall 0xd354, 0x17ce  ; operator_delete@s1:17CE
loc_D37C:
4:D37C  8b4606               mov ax, word ptr [bp + 6]
4:D37F  8b5608               mov dx, word ptr [bp + 8]
4:D382  c9                   leave
4:D383  ca0600               retf 6

; ---------------- StoryPage51::scalar_dtor@s4:D386 size=38 callers=0
;   deleting destructor
4:D386  c8040000             enter 4, 0
4:D38A  66ff7606             push dword ptr [bp + 6]
4:D38E  90                   nop
4:D38F  0e                   push cs
4:D390  e885f1               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D393  f6460a01             test byte ptr [bp + 0xa], 1
4:D397  7409                 je 0xd3a2
4:D399  66ff7606             push dword ptr [bp + 6]
4:D39D  9ace177ad3           lcall 0xd37a, 0x17ce  ; operator_delete@s1:17CE
loc_D3A2:
4:D3A2  8b4606               mov ax, word ptr [bp + 6]
4:D3A5  8b5608               mov dx, word ptr [bp + 8]
4:D3A8  c9                   leave
4:D3A9  ca0600               retf 6

; ---------------- StoryPage_vtables@s4:D3AC size=2378 callers=0
;   DATA, not code: the story pages' vtables
4:D3AC  c8040000             enter 4, 0
4:D3B0  66ff7606             push dword ptr [bp + 6]
4:D3B4  90                   nop
4:D3B5  0e                   push cs
4:D3B6  e85ff1               call 0xc518  ; StoryPage::~StoryPage@s4:C518
4:D3B9  f6460a01             test byte ptr [bp + 0xa], 1
4:D3BD  7409                 je 0xd3c8
4:D3BF  66ff7606             push dword ptr [bp + 6]
4:D3C3  9ace17a0d3           lcall 0xd3a0, 0x17ce  ; operator_delete@s1:17CE
loc_D3C8:
4:D3C8  8b4606               mov ax, word ptr [bp + 6]
4:D3CB  8b5608               mov dx, word ptr [bp + 8]
4:D3CE  c9                   leave
4:D3CF  ca0600               retf 6
4:D3D2  db 86 d3 08 d4 ea 68 e4 d3 16 03 e0 d3 8c 02 30 d4
4:D3E2  db 40 96 e8 d3 64 96 ec d3 2c 37 f0 d3 f2 97 f4 d3
4:D3F2  db 3c 37 f8 d3 40 37 fc d3 44 37 00 d4 48 37 04 d4
4:D402  db 4c 37 0c d4 a8 cd b5 cf 98 96 10 d4 50 37 14 d4
4:D412  db 54 37 18 d4 60 9c 1c d4 58 37 20 d4 24 63 24 d4
4:D422  db 4e 9c 28 d4 62 37 2c d4 4a 9c 38 d4 b2 03 34 d4
4:D432  db d6 03 3c d4 4a 6a 40 d4 fa 03 64 d4 02 6b 44 d4
4:D442  db 7a 37 48 d4 52 9c 4c d4 56 9c 50 d4 16 9c 54 d4
4:D452  db 30 9c 58 d4 86 9c 5c d4 c4 9c 60 d4 e0 9c 68 d4
4:D462  db ae 02 c6 c8 28 63 6c d4 2c 63 4a d0 c8 d2 a4 d4
4:D472  db ea 68 80 d4 16 03 7c d4 8c 02 cc d4 40 96 84 d4
4:D482  db 64 96 88 d4 2c 37 8c d4 f2 97 90 d4 3c 37 94 d4
4:D492  db 40 37 98 d4 44 37 9c d4 48 37 a0 d4 4c 37 a8 d4
4:D4A2  db 78 c5 d4 d3 98 96 ac d4 50 37 b0 d4 54 37 b4 d4
4:D4B2  db 60 9c b8 d4 58 37 bc d4 24 63 c0 d4 4e 9c c4 d4
4:D4C2  db 62 37 c8 d4 4a 9c d4 d4 b2 03 d0 d4 d6 03 d8 d4
4:D4D2  db 4a 6a dc d4 fa 03 00 d5 02 6b e0 d4 7a 37 e4 d4
4:D4E2  db 52 9c e8 d4 56 9c ec d4 16 9c f0 d4 30 9c f4 d4
4:D4F2  db 86 9c f8 d4 c4 9c fc d4 e0 9c 04 d5 ae 02 dc d3
4:D502  db 28 63 08 d5 2c 63 d8 d3 0a d2 40 d5 ea 68 1c d5
4:D512  db 16 03 18 d5 8c 02 68 d5 40 96 20 d5 64 96 24 d5
4:D522  db 2c 37 28 d5 f2 97 2c d5 3c 37 30 d5 40 37 34 d5
4:D532  db 44 37 38 d5 48 37 3c d5 4c 37 44 d5 78 c5 70 d4
4:D542  db 98 96 48 d5 50 37 4c d5 54 37 50 d5 60 9c 54 d5
4:D552  db 58 37 58 d5 24 63 5c d5 4e 9c 60 d5 62 37 64 d5
4:D562  db 4a 9c 70 d5 b2 03 6c d5 d6 03 74 d5 4a 6a 78 d5
4:D572  db fa 03 9c d5 02 6b 7c d5 7a 37 80 d5 52 9c 84 d5
4:D582  db 56 9c 88 d5 16 9c 8c d5 30 9c 90 d5 86 9c 94 d5
4:D592  db c4 9c 98 d5 e0 9c a0 d5 ae 02 78 d4 28 63 a4 d5
4:D5A2  db 2c 63 74 d4 3a d3 dc d5 ea 68 b8 d5 16 03 b4 d5
4:D5B2  db 8c 02 04 d6 40 96 bc d5 64 96 c0 d5 2c 37 c4 d5
4:D5C2  db f2 97 c8 d5 3c 37 cc d5 40 37 d0 d5 44 37 d4 d5
4:D5D2  db 48 37 d8 d5 4c 37 e0 d5 78 c5 0c d5 98 96 e4 d5
4:D5E2  db 50 37 e8 d5 54 37 ec d5 60 9c f0 d5 58 37 f4 d5
4:D5F2  db 24 63 f8 d5 4e 9c fc d5 62 37 00 d6 4a 9c 0c d6
4:D602  db b2 03 08 d6 d6 03 10 d6 4a 6a 14 d6 fa 03 38 d6
4:D612  db 02 6b 18 d6 7a 37 1c d6 52 9c 20 d6 56 9c 24 d6
4:D622  db 16 9c 28 d6 30 9c 2c d6 86 9c 30 d6 c4 9c 34 d6
4:D632  db e0 9c 3c d6 ae 02 14 d5 28 63 40 d6 2c 63 10 d5
4:D642  db 7c d2 78 d6 ea 68 54 d6 16 03 50 d6 8c 02 a0 d6
4:D652  db 40 96 58 d6 64 96 5c d6 2c 37 60 d6 f2 97 64 d6
4:D662  db 3c 37 68 d6 40 37 6c d6 44 37 70 d6 48 37 74 d6
4:D672  db 4c 37 7c d6 78 c5 a8 d5 98 96 80 d6 50 37 84 d6
4:D682  db 54 37 88 d6 60 9c 8c d6 58 37 90 d6 24 63 94 d6
4:D692  db 4e 9c 98 d6 62 37 9c d6 4a 9c a8 d6 b2 03 a4 d6
4:D6A2  db d6 03 ac d6 4a 6a b0 d6 fa 03 d4 d6 02 6b b4 d6
4:D6B2  db 7a 37 b8 d6 52 9c bc d6 56 9c c0 d6 16 9c c4 d6
4:D6C2  db 30 9c c8 d6 86 9c cc d6 c4 9c d0 d6 e0 9c d8 d6
4:D6D2  db ae 02 b0 d5 28 63 dc d6 2c 63 ac d5 be d1 14 d7
4:D6E2  db ea 68 f0 d6 16 03 ec d6 8c 02 3c d7 40 96 f4 d6
4:D6F2  db 64 96 f8 d6 2c 37 fc d6 f2 97 00 d7 3c 37 04 d7
4:D702  db 40 37 08 d7 44 37 0c d7 48 37 10 d7 4c 37 18 d7
4:D712  db 78 c5 44 d6 98 96 1c d7 50 37 20 d7 54 37 24 d7
4:D722  db 60 9c 28 d7 58 37 2c d7 24 63 30 d7 4e 9c 34 d7
4:D732  db 62 37 38 d7 4a 9c 44 d7 b2 03 40 d7 d6 03 48 d7
4:D742  db 4a 6a 4c d7 fa 03 70 d7 02 6b 50 d7 7a 37 54 d7
4:D752  db 52 9c 58 d7 56 9c 5c d7 16 9c 60 d7 30 9c 64 d7
4:D762  db 86 9c 68 d7 c4 9c 6c d7 e0 9c 74 d7 ae 02 4c d6
4:D772  db 28 63 78 d7 2c 63 48 d6 ac d3 b0 d7 ea 68 8c d7
4:D782  db 16 03 88 d7 8c 02 d8 d7 40 96 90 d7 64 96 94 d7
4:D792  db 2c 37 98 d7 f2 97 9c d7 3c 37 a0 d7 40 37 a4 d7
4:D7A2  db 44 37 a8 d7 48 37 ac d7 4c 37 b4 d7 c0 cf e0 d6
4:D7B2  db 98 96 b8 d7 50 37 bc d7 54 37 c0 d7 60 9c c4 d7
4:D7C2  db 58 37 c8 d7 24 63 cc d7 4e 9c d0 d7 62 37 d4 d7
4:D7D2  db 4a 9c e0 d7 b2 03 dc d7 d6 03 e4 d7 4a 6a e8 d7
4:D7E2  db fa 03 0c d8 02 6b ec d7 7a 37 f0 d7 52 9c f4 d7
4:D7F2  db 56 9c f8 d7 16 9c fc d7 30 9c 00 d8 86 9c 04 d8
4:D802  db c4 9c 08 d8 e0 9c 10 d8 ae 02 e8 d6 28 63 14 d8
4:D812  db 2c 63 e4 d6 ee d2 4c d8 ea 68 28 d8 16 03 24 d8
4:D822  db 8c 02 74 d8 40 96 2c d8 64 96 30 d8 2c 37 34 d8
4:D832  db f2 97 38 d8 3c 37 3c d8 40 37 40 d8 44 37 44 d8
4:D842  db 48 37 48 d8 4c 37 50 d8 78 c5 7c d7 98 96 54 d8
4:D852  db 50 37 58 d8 54 37 5c d8 60 9c 60 d8 58 37 64 d8
4:D862  db 24 63 68 d8 4e 9c 6c d8 62 37 70 d8 4a 9c 7c d8
4:D872  db b2 03 78 d8 d6 03 80 d8 4a 6a 84 d8 fa 03 a8 d8
4:D882  db 02 6b 88 d8 7a 37 8c d8 52 9c 90 d8 56 9c 94 d8
4:D892  db 16 9c 98 d8 30 9c 9c d8 86 9c a0 d8 c4 9c a4 d8
4:D8A2  db e0 9c ac d8 ae 02 84 d7 28 63 b0 d8 2c 63 80 d7
4:D8B2  db 30 d2 e8 d8 ea 68 c4 d8 16 03 c0 d8 8c 02 10 d9
4:D8C2  db 40 96 c8 d8 64 96 cc d8 2c 37 d0 d8 f2 97 d4 d8
4:D8D2  db 3c 37 d8 d8 40 37 dc d8 44 37 e0 d8 48 37 e4 d8
4:D8E2  db 4c 37 ec d8 78 c5 18 d8 98 96 f0 d8 50 37 f4 d8
4:D8F2  db 54 37 f8 d8 60 9c fc d8 58 37 00 d9 24 63 04 d9
4:D902  db 4e 9c 08 d9 62 37 0c d9 4a 9c 18 d9 b2 03 14 d9
4:D912  db d6 03 1c d9 4a 6a 20 d9 fa 03 44 d9 02 6b 24 d9
4:D922  db 7a 37 28 d9 52 9c 2c d9 56 9c 30 d9 16 9c 34 d9
4:D932  db 30 9c 38 d9 86 9c 3c d9 c4 9c 40 d9 e0 9c 48 d9
4:D942  db ae 02 20 d8 28 63 4c d9 2c 63 1c d8 60 d3 84 d9
4:D952  db ea 68 60 d9 16 03 5c d9 8c 02 ac d9 40 96 64 d9
4:D962  db 64 96 68 d9 2c 37 6c d9 f2 97 70 d9 3c 37 74 d9
4:D972  db 40 37 78 d9 44 37 7c d9 48 37 80 d9 4c 37 88 d9
4:D982  db 78 c5 b4 d8 98 96 8c d9 50 37 90 d9 54 37 94 d9
4:D992  db 60 9c 98 d9 58 37 9c d9 24 63 a0 d9 4e 9c a4 d9
4:D9A2  db 62 37 a8 d9 4a 9c b4 d9 b2 03 b0 d9 d6 03 b8 d9
4:D9B2  db 4a 6a bc d9 fa 03 e0 d9 02 6b c0 d9 7a 37 c4 d9
4:D9C2  db 52 9c c8 d9 56 9c cc d9 16 9c d0 d9 30 9c d4 d9
4:D9D2  db 86 9c d8 d9 c4 9c dc d9 e0 9c e4 d9 ae 02 bc d8
4:D9E2  db 28 63 e8 d9 2c 63 b8 d8 a2 d2 20 da ea 68 fc d9
4:D9F2  db 16 03 f8 d9 8c 02 48 da 40 96 00 da 64 96 04 da
4:DA02  db 2c 37 08 da f2 97 0c da 3c 37 10 da 40 37 14 da
4:DA12  db 44 37 18 da 48 37 1c da 4c 37 24 da 78 c5 50 d9
4:DA22  db 98 96 28 da 50 37 2c da 54 37 30 da 60 9c 34 da
4:DA32  db 58 37 38 da 24 63 3c da 4e 9c 40 da 62 37 44 da
4:DA42  db 4a 9c 50 da b2 03 4c da d6 03 54 da 4a 6a 58 da
4:DA52  db fa 03 7c da 02 6b 5c da 7a 37 60 da 52 9c 64 da
4:DA62  db 56 9c 68 da 16 9c 6c da 30 9c 70 da 86 9c 74 da
4:DA72  db c4 9c 78 da e0 9c 80 da ae 02 58 d9 28 63 84 da
4:DA82  db 2c 63 54 d9 e4 d1 bc da ea 68 98 da 16 03 94 da
4:DA92  db 8c 02 e4 da 40 96 9c da 64 96 a0 da 2c 37 a4 da
4:DAA2  db f2 97 a8 da 3c 37 ac da 40 37 b0 da 44 37 b4 da
4:DAB2  db 48 37 b8 da 4c 37 c0 da 78 c5 ec d9 98 96 c4 da
4:DAC2  db 50 37 c8 da 54 37 cc da 60 9c d0 da 58 37 d4 da
4:DAD2  db 24 63 d8 da 4e 9c dc da 62 37 e0 da 4a 9c ec da
4:DAE2  db b2 03 e8 da d6 03 f0 da 4a 6a f4 da fa 03 18 db
4:DAF2  db 02 6b f8 da 7a 37 fc da 52 9c 00 db 56 9c 04 db
4:DB02  db 16 9c 08 db 30 9c 0c db 86 9c 10 db c4 9c 14 db
4:DB12  db e0 9c 1c db ae 02 f4 d9 28 63 20 db 2c 63 f0 d9
4:DB22  db 14 d3 58 db ea 68 34 db 16 03 30 db 8c 02 80 db
4:DB32  db 40 96 38 db 64 96 3c db 2c 37 40 db f2 97 44 db
4:DB42  db 3c 37 48 db 40 37 4c db 44 37 50 db 48 37 54 db
4:DB52  db 4c 37 5c db 78 c5 88 da 98 96 60 db 50 37 64 db
4:DB62  db 54 37 68 db 60 9c 6c db 58 37 70 db 24 63 74 db
4:DB72  db 4e 9c 78 db 62 37 7c db 4a 9c 88 db b2 03 84 db
4:DB82  db d6 03 8c db 4a 6a 90 db fa 03 b4 db 02 6b 94 db
4:DB92  db 7a 37 98 db 52 9c 9c db 56 9c a0 db 16 9c a4 db
4:DBA2  db 30 9c a8 db 86 9c ac db c4 9c b0 db e0 9c b8 db
4:DBB2  db ae 02 90 da 28 63 bc db 2c 63 8c da 56 d2 f4 db
4:DBC2  db ea 68 d0 db 16 03 cc db 8c 02 1c dc 40 96 d4 db
4:DBD2  db 64 96 d8 db 2c 37 dc db f2 97 e0 db 3c 37 e4 db
4:DBE2  db 40 37 e8 db 44 37 ec db 48 37 f0 db 4c 37 f8 db
4:DBF2  db 78 c5 24 db 98 96 fc db 50 37 00 dc 54 37 04 dc
4:DC02  db 60 9c 08 dc 58 37 0c dc 24 63 10 dc 4e 9c 14 dc
4:DC12  db 62 37 18 dc 4a 9c 24 dc b2 03 20 dc d6 03 28 dc
4:DC22  db 4a 6a 2c dc fa 03 50 dc 02 6b 30 dc 7a 37 34 dc
4:DC32  db 52 9c 38 dc 56 9c 3c dc 16 9c 40 dc 30 9c 44 dc
4:DC42  db 86 9c 48 dc c4 9c 4c dc e0 9c 54 dc ae 02 2c db
4:DC52  db 28 63 58 dc 2c 63 28 db 98 d1 90 dc ea 68 6c dc
4:DC62  db 16 03 68 dc 8c 02 b8 dc 40 96 70 dc 64 96 74 dc
4:DC72  db 2c 37 78 dc f2 97 7c dc 3c 37 80 dc 40 37 84 dc
4:DC82  db 44 37 88 dc 48 37 8c dc 4c 37 94 dc 78 c5 c0 db
4:DC92  db 98 96 98 dc 50 37 9c dc 54 37 a0 dc 60 9c a4 dc
4:DCA2  db 58 37 a8 dc 24 63 ac dc 4e 9c b0 dc 62 37 b4 dc
4:DCB2  db 4a 9c c0 dc b2 03 bc dc d6 03 c4 dc 4a 6a c8 dc
4:DCC2  db fa 03 ec dc 02 6b cc dc 7a 37 d0 dc 52 9c d4 dc
4:DCD2  db 56 9c d8 dc 16 9c dc dc 30 9c e0 dc 86 9c e4 dc
4:DCE2  db c4 9c e8 dc e0 9c f0 dc ae 02 c8 db 28 63 f4 dc
4:DCF2  db 2c 63 c4 db

; ---------------- BuildingSprite::BuildingSprite@s4:DCF6 FAR size=40 callers=3
;   a building's picture on the map (vtable DF3C)
4:DCF6  c8040000             enter 4, 0
4:DCFA  c45e06               les bx, ptr [bp + 6]
4:DCFD  26c7079a38           mov word ptr es:[bx], 0x389a
4:DD02  26c7470260dc         mov word ptr es:[bx + 2], 0xdc60  ; SEGMENT s2:0000
4:DD08  c45e06               les bx, ptr [bp + 6]
4:DD0B  26c7073cdf           mov word ptr es:[bx], 0xdf3c
4:DD10  26c747025cdc         mov word ptr es:[bx + 2], 0xdc5c  ; SEGMENT s4:0000
4:DD16  8bc3                 mov ax, bx
4:DD18  8cc2                 mov dx, es
4:DD1A  c9                   leave
4:DD1B  ca0400               retf 4

; ---------------- BuildingSprite::make@s4:DD1E FAR size=94 callers=2
;   picture and animation of a building type
4:DD1E  c80c0000             enter 0xc, 0
4:DD22  ff760e               push word ptr [bp + 0xe]
4:DD25  666a00               push 0
4:DD28  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:DD2D  9af681cecf           lcall 0xcfce, 0x81f6  ; ResLibr::buildingPicture@s3:81F6
4:DD32  8946fc               mov word ptr [bp - 4], ax
4:DD35  8956fe               mov word ptr [bp - 2], dx
4:DD38  6a46                 push 0x46
4:DD3A  9a9c17c6d3           lcall 0xd3c6, 0x179c  ; operator_new@s1:179C
4:DD3F  83c402               add sp, 2
4:DD42  8956f6               mov word ptr [bp - 0xa], dx
4:DD45  0bd0                 or dx, ax
4:DD47  7419                 je 0xdd62
4:DD49  666a00               push 0
4:DD4C  66ff76fc             push dword ptr [bp - 4]
4:DD50  66ff760c             push dword ptr [bp + 0xc]
4:DD54  ff760a               push word ptr [bp + 0xa]
4:DD57  ff76f6               push word ptr [bp - 0xa]
4:DD5A  50                   push ax
4:DD5B  9acc8770dd           lcall 0xdd70, 0x87cc  ; AnimOverlay::AnimOverlay@s2:87CC
4:DD60  eb03                 jmp 0xdd65
loc_DD62:
4:DD62  33c0                 xor ax, ax
4:DD64  99                   cdq
loc_DD65:
4:DD65  8946f8               mov word ptr [bp - 8], ax
4:DD68  8956fa               mov word ptr [bp - 6], dx
4:DD6B  52                   push dx
4:DD6C  50                   push ax
4:DD6D  9ac68b06dd           lcall 0xdd06, 0x8bc6  ; AnimOverlay::drawFrame@s2:8BC6
4:DD72  8b46f8               mov ax, word ptr [bp - 8]
4:DD75  8b56fa               mov dx, word ptr [bp - 6]
4:DD78  c9                   leave
4:DD79  ca0a00               retf 0xa

; ---------------- BuildingSprite::forObject@s4:DD7C FAR size=404 callers=1
;   picture of a map object (underground empty cells: terrain 7, 8, 9)
4:DD7C  c82e0000             enter 0x2e, 0
4:DD80  662bc0               sub eax, eax
4:DD83  668946fc             mov dword ptr [bp - 4], eax
4:DD87  8a4611               mov al, byte ptr [bp + 0x11]
4:DD8A  a8ff                 test al, 0xff
4:DD8C  0f85a600             jne 0xde36
4:DD90  66c746f200000000     mov dword ptr [bp - 0xe], 0
4:DD98  6a2f                 push 0x2f
4:DD9A  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:DD9F  9aba20e6dd           lcall 0xdde6, 0x20ba  ; Registry_get@s3:20BA
4:DDA4  8946f6               mov word ptr [bp - 0xa], ax
4:DDA7  8956f8               mov word ptr [bp - 8], dx
4:DDAA  c45ef6               les bx, ptr [bp - 0xa]
4:DDAD  268b471e             mov ax, word ptr es:[bx + 0x1e]
4:DDB1  0bc0                 or ax, ax
4:DDB3  7509                 jne 0xddbe
4:DDB5  8b460e               mov ax, word ptr [bp + 0xe]
4:DDB8  8946ee               mov word ptr [bp - 0x12], ax
4:DDBB  50                   push ax
4:DDBC  eb1d                 jmp 0xdddb
loc_DDBE:
4:DDBE  8b460e               mov ax, word ptr [bp + 0xe]
4:DDC1  8946ea               mov word ptr [bp - 0x16], ax
4:DDC4  2d0700               sub ax, 7
4:DDC7  740b                 je 0xddd4
4:DDC9  48                   dec ax
4:DDCA  7456                 je 0xde22
4:DDCC  48                   dec ax
4:DDCD  c746ee0800           mov word ptr [bp - 0x12], 8
4:DDD2  eb05                 jmp 0xddd9
loc_DDD4:
4:DDD4  c746ee0600           mov word ptr [bp - 0x12], 6
loc_DDD9:
4:DDD9  6a06                 push 6
loc_DDDB:
4:DDDB  666a00               push 0
4:DDDE  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:DDE3  9af681c3de           lcall 0xdec3, 0x81f6  ; ResLibr::buildingPicture@s3:81F6
4:DDE8  8946f2               mov word ptr [bp - 0xe], ax
4:DDEB  8956f4               mov word ptr [bp - 0xc], dx
4:DDEE  8bc2                 mov ax, dx
4:DDF0  0b46f2               or ax, word ptr [bp - 0xe]
4:DDF3  0f840f01             je 0xdf06
4:DDF7  6a46                 push 0x46
4:DDF9  9a9c17d0de           lcall 0xded0, 0x179c  ; operator_new@s1:179C
4:DDFE  83c402               add sp, 2
4:DE01  8956e8               mov word ptr [bp - 0x18], dx
4:DE04  0bd0                 or dx, ax
4:DE06  7422                 je 0xde2a
4:DE08  66ff760e             push dword ptr [bp + 0xe]
4:DE0C  66ff76f2             push dword ptr [bp - 0xe]
4:DE10  ff76ee               push word ptr [bp - 0x12]
4:DE13  66ff760a             push dword ptr [bp + 0xa]
4:DE17  ff76e8               push word ptr [bp - 0x18]
4:DE1A  50                   push ax
4:DE1B  9acc87f2de           lcall 0xdef2, 0x87cc  ; AnimOverlay::AnimOverlay@s2:87CC
4:DE20  eb0b                 jmp 0xde2d
loc_DE22:
4:DE22  c746ee0700           mov word ptr [bp - 0x12], 7
4:DE27  ebb0                 jmp 0xddd9
4:DE29  db 90
loc_DE2A:
4:DE2A  33c0                 xor ax, ax
4:DE2C  99                   cdq
loc_DE2D:
4:DE2D  8946fc               mov word ptr [bp - 4], ax
4:DE30  8956fe               mov word ptr [bp - 2], dx
4:DE33  e9d000               jmp 0xdf06
loc_DE36:
4:DE36  66ff760e             push dword ptr [bp + 0xe]
4:DE3A  66ff36e265           push dword ptr [0x65e2]  ; g_objectDb
4:DE3F  9aece1845f           lcall 0x5f84, 0xe1ec  ; Db::resolveHandle@s6:E1EC
4:DE44  8946ea               mov word ptr [bp - 0x16], ax
4:DE47  8956ec               mov word ptr [bp - 0x14], dx
4:DE4A  52                   push dx
4:DE4B  50                   push ax
4:DE4C  9aa873cc57           lcall 0x57cc, 0x73a8  ; DbObj::resolveLink16@s7:73A8
4:DE51  8946f2               mov word ptr [bp - 0xe], ax
4:DE54  8956f4               mov word ptr [bp - 0xc], dx
4:DE57  0bd0                 or dx, ax
4:DE59  0f84a900             je 0xdf06
4:DE5D  c45eea               les bx, ptr [bp - 0x16]
4:DE60  66268b472e           mov eax, dword ptr es:[bx + 0x2e]
4:DE65  268b5730             mov dx, word ptr es:[bx + 0x30]
4:DE69  668946f6             mov dword ptr [bp - 0xa], eax
4:DE6D  8bc2                 mov ax, dx
4:DE6F  0b46f6               or ax, word ptr [bp - 0xa]
4:DE72  7410                 je 0xde84
4:DE74  c45ef6               les bx, ptr [bp - 0xa]
4:DE77  66268b870002         mov eax, dword ptr es:[bx + 0x200]
4:DE7D  668946e2             mov dword ptr [bp - 0x1e], eax
4:DE81  eb09                 jmp 0xde8c
4:DE83  db 90
loc_DE84:
4:DE84  66c746e200000000     mov dword ptr [bp - 0x1e], 0
loc_DE8C:
4:DE8C  c45ef2               les bx, ptr [bp - 0xe]
4:DE8F  268b471c             mov ax, word ptr es:[bx + 0x1c]
4:DE93  268b571e             mov dx, word ptr es:[bx + 0x1e]
4:DE97  8946de               mov word ptr [bp - 0x22], ax
4:DE9A  8bc2                 mov ax, dx
4:DE9C  0b46de               or ax, word ptr [bp - 0x22]
4:DE9F  7409                 je 0xdeaa
4:DEA1  8b46de               mov ax, word ptr [bp - 0x22]
4:DEA4  8946e2               mov word ptr [bp - 0x1e], ax
4:DEA7  8956e4               mov word ptr [bp - 0x1c], dx
loc_DEAA:
4:DEAA  06                   push es
4:DEAB  53                   push bx
4:DEAC  26c41f               les bx, ptr es:[bx]
4:DEAF  26ff5f14             lcall es:[bx + 0x14]
4:DEB3  8946ee               mov word ptr [bp - 0x12], ax
4:DEB6  50                   push ax
4:DEB7  66ff76e2             push dword ptr [bp - 0x1e]
4:DEBB  66ff36cc14           push dword ptr [0x14cc]  ; g_hInstRes
4:DEC0  9af68130dd           lcall 0xdd30, 0x81f6  ; ResLibr::buildingPicture@s3:81F6
4:DEC5  8946da               mov word ptr [bp - 0x26], ax
4:DEC8  8956dc               mov word ptr [bp - 0x24], dx
4:DECB  6a46                 push 0x46
4:DECD  9a9c173ddd           lcall 0xdd3d, 0x179c  ; operator_new@s1:179C
4:DED2  83c402               add sp, 2
4:DED5  8956e8               mov word ptr [bp - 0x18], dx
4:DED8  0bd0                 or dx, ax
4:DEDA  741a                 je 0xdef6
4:DEDC  66ff760e             push dword ptr [bp + 0xe]
4:DEE0  66ff76da             push dword ptr [bp - 0x26]
4:DEE4  ff76ee               push word ptr [bp - 0x12]
4:DEE7  66ff760a             push dword ptr [bp + 0xa]
4:DEEB  ff76e8               push word ptr [bp - 0x18]
4:DEEE  50                   push ax
4:DEEF  9acc8704df           lcall 0xdf04, 0x87cc  ; AnimOverlay::AnimOverlay@s2:87CC
4:DEF4  eb03                 jmp 0xdef9
loc_DEF6:
4:DEF6  33c0                 xor ax, ax
4:DEF8  99                   cdq
loc_DEF9:
4:DEF9  8946fc               mov word ptr [bp - 4], ax
4:DEFC  8956fe               mov word ptr [bp - 2], dx
4:DEFF  52                   push dx
4:DF00  50                   push ax
4:DF01  9ac68b5edd           lcall 0xdd5e, 0x8bc6  ; AnimOverlay::drawFrame@s2:8BC6
loc_DF06:
4:DF06  8b46fc               mov ax, word ptr [bp - 4]
4:DF09  8b56fe               mov dx, word ptr [bp - 2]
4:DF0C  c9                   leave
4:DF0D  ca0c00               retf 0xc

; ---------------- BuildingSprite::scalar_dtor@s4:DF10 size=48 callers=0
;   deleting destructor
4:DF10  c8080000             enter 8, 0
4:DF14  c45e06               les bx, ptr [bp + 6]
4:DF17  26c7079a38           mov word ptr es:[bx], 0x389a
4:DF1C  26c747021ede         mov word ptr es:[bx + 2], 0xde1e  ; SEGMENT s2:0000
4:DF22  f6460a01             test byte ptr [bp + 0xa], 1
4:DF26  7409                 je 0xdf31
4:DF28  66ff7606             push dword ptr [bp + 6]
4:DF2C  9ace17fcdd           lcall 0xddfc, 0x17ce  ; operator_delete@s1:17CE
loc_DF31:
4:DF31  8b4606               mov ax, word ptr [bp + 6]
4:DF34  8b5608               mov dx, word ptr [bp + 8]
4:DF37  c9                   leave
4:DF38  ca0600               retf 6
4:DF3B  db 90 10 df 14 dd

; ---------------- Mode5View::create@s4:DF40 FAR size=82 callers=0
;   creates the window and its painter
4:DF40  c8040000             enter 4, 0
4:DF44  66ff7606             push dword ptr [bp + 6]
4:DF48  9a609720df           lcall 0xdf20, 0x9760  ; SOLWnd::create@s2:9760
4:DF4D  6a0a                 push 0xa
4:DF4F  9a9c172fdf           lcall 0xdf2f, 0x179c  ; operator_new@s1:179C
4:DF54  83c402               add sp, 2
4:DF57  8956fe               mov word ptr [bp - 2], dx
4:DF5A  0bd0                 or dx, ax
4:DF5C  7422                 je 0xdf80
4:DF5E  c45e06               les bx, ptr [bp + 6]
4:DF61  26ff7708             push word ptr es:[bx + 8]
4:DF65  ff76fe               push word ptr [bp - 2]
4:DF68  50                   push ax
4:DF69  90                   nop
4:DF6A  0e                   push cs
4:DF6B  e89201               call 0xe100  ; Mode5Painter::Mode5Painter@s4:E100
4:DF6E  c45e06               les bx, ptr [bp + 6]
4:DF71  268987e200           mov word ptr es:[bx + 0xe2], ax
4:DF76  268997e400           mov word ptr es:[bx + 0xe4], dx
4:DF7B  c9                   leave
4:DF7C  ca0400               retf 4
4:DF7F  db 90
loc_DF80:
4:DF80  c45e06               les bx, ptr [bp + 6]
4:DF83  6626c787e20000000000 mov dword ptr es:[bx + 0xe2], 0
4:DF8D  c9                   leave
4:DF8E  ca0400               retf 4
4:DF91  db 00

; ---------------- Mode5View::destroy@s4:DF92 FAR size=66 callers=0
;   destroys the painter
4:DF92  c8080000             enter 8, 0
4:DF96  56                   push si
4:DF97  66ff7606             push dword ptr [bp + 6]
4:DF9B  9a8e624bdf           lcall 0xdf4b, 0x628e  ; DanWnd::destroy@s2:628E
4:DFA0  c45e06               les bx, ptr [bp + 6]
4:DFA3  268b87e200           mov ax, word ptr es:[bx + 0xe2]
4:DFA8  268b97e400           mov dx, word ptr es:[bx + 0xe4]
4:DFAD  8bda                 mov bx, dx
4:DFAF  0bd0                 or dx, ax
4:DFB1  740e                 je 0xdfc1
4:DFB3  6a01                 push 1
4:DFB5  53                   push bx
4:DFB6  50                   push ax
4:DFB7  8ec3                 mov es, bx
4:DFB9  8bf0                 mov si, ax
4:DFBB  26c41c               les bx, ptr es:[si]
4:DFBE  26ff1f               lcall es:[bx]
loc_DFC1:
4:DFC1  c45e06               les bx, ptr [bp + 6]
4:DFC4  6626c787e20000000000 mov dword ptr es:[bx + 0xe2], 0
4:DFCE  5e                   pop si
4:DFCF  c9                   leave
4:DFD0  ca0400               retf 4
4:DFD3  db 00

; ---------------- Mode5View::onShow@s4:DFD4 FAR size=72 callers=0
;   opens the destination window (registry 0x36)
4:DFD4  c80a0000             enter 0xa, 0
4:DFD8  c45e06               les bx, ptr [bp + 6]
4:DFDB  6626ffb7e200         push dword ptr es:[bx + 0xe2]
4:DFE1  90                   nop
4:DFE2  0e                   push cs
4:DFE3  e88601               call 0xe16c  ; Mode5Painter::paint@s4:E16C
4:DFE6  c45e06               les bx, ptr [bp + 6]
4:DFE9  2683bfe60000         cmp word ptr es:[bx + 0xe6], 0
4:DFEF  7526                 jne 0xe017
4:DFF1  26c787e6000100       mov word ptr es:[bx + 0xe6], 1
4:DFF8  6a36                 push 0x36
4:DFFA  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:DFFF  9aba20a2dd           lcall 0xdda2, 0x20ba  ; Registry_get@s3:20BA
4:E004  6a08                 push 8
4:E006  c45e06               les bx, ptr [bp + 6]
4:E009  26ff7708             push word ptr es:[bx + 8]
4:E00D  66ff367c5b           push dword ptr [0x5b7c]
4:E012  9a40afb067           lcall 0x67b0, 0xaf40  ; DialogCtr::open@s8:AF40
loc_E017:
4:E017  c9                   leave
4:E018  ca0400               retf 4
4:E01B  db 00

; ---------------- Mode5View::scalar_dtor@s4:E01C FAR size=228 callers=0
;   deleting destructor
4:E01C  c8180000             enter 0x18, 0
4:E020  668b4606             mov eax, dword ptr [bp + 6]
4:E024  05d200               add ax, 0xd2
4:E027  6650                 push eax
4:E029  9ac4573ae0           lcall 0xe03a, 0x57c4  ; List::~List@s2:57C4
4:E02E  c45e06               les bx, ptr [bp + 6]
4:E031  26c7070a38           mov word ptr es:[bx], 0x380a
4:E036  26c7470248e0         mov word ptr es:[bx + 2], 0xe048  ; SEGMENT s2:0000
4:E03C  c45e06               les bx, ptr [bp + 6]
4:E03F  26c7079a38           mov word ptr es:[bx], 0x389a
4:E044  26c747029edf         mov word ptr es:[bx + 2], 0xdf9e  ; SEGMENT s2:0000
4:E04A  f6460a01             test byte ptr [bp + 0xa], 1
4:E04E  7409                 je 0xe059
4:E050  66ff7606             push dword ptr [bp + 6]
4:E054  9ace1752df           lcall 0xdf52, 0x17ce  ; operator_delete@s1:17CE
loc_E059:
4:E059  8b4606               mov ax, word ptr [bp + 6]
4:E05C  8b5608               mov dx, word ptr [bp + 8]
4:E05F  c9                   leave
4:E060  ca0600               retf 6
4:E063  db 00 1c e0 6e e0 ea 68 72 e0 40 df 9a e0 c6 68 76
4:E073  db e0 40 96 7a e0 64 96 7e e0 2c 37 82 e0 f2 97 86
4:E083  db e0 3c 37 8a e0 40 37 8e e0 44 37 92 e0 48 37 96
4:E093  db e0 4c 37 9e e0 d4 df f6 e0 98 96 a2 e0 50 37 a6
4:E0A3  db e0 54 37 aa e0 60 9c ae e0 58 37 b2 e0 24 63 b6
4:E0B3  db e0 4e 9c ba e0 62 37 be e0 4a 9c c2 e0 66 37 c6
4:E0C3  db e0 6a 37 ca e0 4a 6a ce e0 2e 6b d2 e0 02 6b d6
4:E0D3  db e0 7a 37 da e0 52 9c de e0 56 9c e2 e0 16 9c e6
4:E0E3  db e0 30 9c ea e0 86 9c ee e0 c4 9c f2 e0 e0 9c fa
4:E0F3  db e0 92 df 3e df 28 63 fe e0 2c 63 2c e0

; ---------------- Mode5Painter::Mode5Painter@s4:E100 FAR size=108 callers=1
;   painter of the mode 5 view
4:E100  c8100000             enter 0x10, 0
4:E104  c45e06               les bx, ptr [bp + 6]
4:E107  26c7079a38           mov word ptr es:[bx], 0x389a
4:E10C  26c747021ee1         mov word ptr es:[bx + 2], 0xe11e  ; SEGMENT s2:0000
4:E112  c45e06               les bx, ptr [bp + 6]
4:E115  26c707a83a           mov word ptr es:[bx], 0x3aa8
4:E11A  26c7470233e1         mov word ptr es:[bx + 2], 0xe133  ; SEGMENT s2:0000
4:E120  8b460a               mov ax, word ptr [bp + 0xa]
4:E123  c45e06               les bx, ptr [bp + 6]
4:E126  26894704             mov word ptr es:[bx + 4], ax
4:E12A  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
4:E12F  26c747026ae0         mov word ptr es:[bx + 2], 0xe06a  ; SEGMENT s2:0000
4:E135  c45e06               les bx, ptr [bp + 6]
4:E138  6626c7470600000000   mov dword ptr es:[bx + 6], 0
4:E141  26c70728e2           mov word ptr es:[bx], 0xe228
4:E146  26c7470266e0         mov word ptr es:[bx + 2], 0xe066  ; SEGMENT s4:0000
4:E14C  6a36                 push 0x36
4:E14E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E153  9aba2002e0           lcall 0xe002, 0x20ba  ; Registry_get@s3:20BA
4:E158  c45e06               les bx, ptr [bp + 6]
4:E15B  26894706             mov word ptr es:[bx + 6], ax
4:E15F  26895708             mov word ptr es:[bx + 8], dx
4:E163  8bc3                 mov ax, bx
4:E165  8cc2                 mov dx, es
4:E167  c9                   leave
4:E168  ca0600               retf 6
4:E16B  db 00

; ---------------- Mode5Painter::paint@s4:E16C FAR size=130 callers=1
;   apis: GDI.DeleteObject, USER.BeginPaint, USER.EndPaint, USER.SelectPalette
;   draws the picture
4:E16C  c8300000             enter 0x30, 0
4:E170  57                   push di
4:E171  56                   push si
4:E172  c45e06               les bx, ptr [bp + 6]
4:E175  26ff7704             push word ptr es:[bx + 4]
4:E179  8d46e0               lea ax, [bp - 0x20]
4:E17C  16                   push ss
4:E17D  50                   push ax
4:E17E  9af1cf0000           lcall 0, 0xcff1  ; USER.BeginPaint
4:E183  8946de               mov word ptr [bp - 0x22], ax
4:E186  c45e06               les bx, ptr [bp + 6]
4:E189  26c45f06             les bx, ptr es:[bx + 6]
4:E18D  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:E192  668946da             mov dword ptr [bp - 0x26], eax
4:E196  8d46de               lea ax, [bp - 0x22]
4:E199  16                   push ss
4:E19A  50                   push ax
4:E19B  c45eda               les bx, ptr [bp - 0x26]
4:E19E  06                   push es
4:E19F  53                   push bx
4:E1A0  26c41f               les bx, ptr es:[bx]
4:E1A3  8bf3                 mov si, bx
4:E1A5  8cc7                 mov di, es
4:E1A7  26ff5f08             lcall es:[bx + 8]
4:E1AB  8946d8               mov word ptr [bp - 0x28], ax
4:E1AE  8d46de               lea ax, [bp - 0x22]
4:E1B1  16                   push ss
4:E1B2  50                   push ax
4:E1B3  666a00               push 0
4:E1B6  66ff76da             push dword ptr [bp - 0x26]
4:E1BA  8ec7                 mov es, di
4:E1BC  26ff5c04             lcall es:[si + 4]
4:E1C0  ff76de               push word ptr [bp - 0x22]
4:E1C3  ff76d8               push word ptr [bp - 0x28]
4:E1C6  6a00                 push 0
4:E1C8  9a75d10000           lcall 0, 0xd175  ; USER.SelectPalette
4:E1CD  8946d8               mov word ptr [bp - 0x28], ax
4:E1D0  50                   push ax
4:E1D1  9ab4d00000           lcall 0, 0xd0b4  ; GDI.DeleteObject
4:E1D6  c45e06               les bx, ptr [bp + 6]
4:E1D9  26ff7704             push word ptr es:[bx + 4]
4:E1DD  8d46e0               lea ax, [bp - 0x20]
4:E1E0  16                   push ss
4:E1E1  50                   push ax
4:E1E2  9a02d00000           lcall 0, 0xd002  ; USER.EndPaint
4:E1E7  5e                   pop si
4:E1E8  5f                   pop di
4:E1E9  c9                   leave
4:E1EA  ca0400               retf 4
4:E1ED  db 00

; ---------------- Mode5Painter::scalar_dtor@s4:E1EE FAR size=66 callers=0
;   deleting destructor
4:E1EE  c8100000             enter 0x10, 0
4:E1F2  c45e06               les bx, ptr [bp + 6]
4:E1F5  26c707b03a           mov word ptr es:[bx], 0x3ab0  ; '0.020'
4:E1FA  26c747020ce2         mov word ptr es:[bx + 2], 0xe20c  ; SEGMENT s2:0000
4:E200  c45e06               les bx, ptr [bp + 6]
4:E203  26c7079a38           mov word ptr es:[bx], 0x389a
4:E208  26c7470210e1         mov word ptr es:[bx + 2], 0xe110  ; SEGMENT s2:0000
4:E20E  f6460a01             test byte ptr [bp + 0xa], 1
4:E212  7409                 je 0xe21d
4:E214  66ff7606             push dword ptr [bp + 6]
4:E218  9ace1757e0           lcall 0xe057, 0x17ce  ; operator_delete@s1:17CE
loc_E21D:
4:E21D  8b4606               mov ax, word ptr [bp + 6]
4:E220  8b5608               mov dx, word ptr [bp + 8]
4:E223  c9                   leave
4:E224  ca0600               retf 6
4:E227  db 90 ee e1 4a e1 10 3a fe e1

; ---------------- Mode4View::Mode4View@s4:E230 FAR size=112 callers=1
;   mode 4 view: the voyage (posted 198 by the ship screen)
4:E230  55                   push bp
4:E231  8bec                 mov bp, sp
4:E233  66ff760c             push dword ptr [bp + 0xc]
4:E237  ff760a               push word ptr [bp + 0xa]
4:E23A  6a04                 push 4
4:E23C  66ff7606             push dword ptr [bp + 6]
4:E240  9a7a7f64dc           lcall 0xdc64, 0x7f7a  ; ScreenView::ScreenView@s5:7F7A
4:E245  c45e06               les bx, ptr [bp + 6]
4:E248  662bc0               sub eax, eax
4:E24B  66268987ee00         mov dword ptr es:[bx + 0xee], eax
4:E251  66268987f200         mov dword ptr es:[bx + 0xf2], eax
4:E257  26c7074ee4           mov word ptr es:[bx], 0xe44e
4:E25C  26c747026ee2         mov word ptr es:[bx + 2], 0xe26e  ; SEGMENT s4:0000
4:E262  26c787e200eae4       mov word ptr es:[bx + 0xe2], 0xe4ea
4:E269  26c787e4002ae2       mov word ptr es:[bx + 0xe4], 0xe22a  ; SEGMENT s4:0000
4:E270  6a26                 push 0x26
4:E272  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E277  9aba2056e1           lcall 0xe156, 0x20ba  ; Registry_get@s3:20BA
4:E27C  c45e06               les bx, ptr [bp + 6]
4:E27F  268987f200           mov word ptr es:[bx + 0xf2], ax
4:E284  268997f400           mov word ptr es:[bx + 0xf4], dx
4:E289  268b87f200           mov ax, word ptr es:[bx + 0xf2]
4:E28E  268987e600           mov word ptr es:[bx + 0xe6], ax
4:E293  268997e800           mov word ptr es:[bx + 0xe8], dx
4:E298  8bc3                 mov ax, bx
4:E29A  8cc2                 mov dx, es
4:E29C  c9                   leave
4:E29D  ca0a00               retf 0xa

; ---------------- Mode4View::~Mode4View@s4:E2A0 FAR size=44 callers=1
;   dtor
4:E2A0  55                   push bp
4:E2A1  8bec                 mov bp, sp
4:E2A3  c45e06               les bx, ptr [bp + 6]
4:E2A6  26c7074ee4           mov word ptr es:[bx], 0xe44e
4:E2AB  26c74702bde2         mov word ptr es:[bx + 2], 0xe2bd  ; SEGMENT s4:0000
4:E2B1  26c787e200eae4       mov word ptr es:[bx + 0xe2], 0xe4ea
4:E2B8  26c787e40060e2       mov word ptr es:[bx + 0xe4], 0xe260  ; SEGMENT s4:0000
4:E2BF  66ff7606             push dword ptr [bp + 6]
4:E2C3  9a8e8043e2           lcall 0xe243, 0x808e  ; ScreenView::~ScreenView@s5:808E
4:E2C8  c9                   leave
4:E2C9  ca0400               retf 4

; ---------------- Mode4View::onShow@s4:E2CC size=184 callers=0
;   (vslot 13) says fem122, adds its controls
4:E2CC  c80c0000             enter 0xc, 0
4:E2D0  c45e06               les bx, ptr [bp + 6]
4:E2D3  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
4:E2DA  7412                 je 0xe2ee
4:E2DC  6626ffb7ee00         push dword ptr es:[bx + 0xee]
4:E2E2  26c49fee00           les bx, ptr es:[bx + 0xee]
4:E2E7  26c41f               les bx, ptr es:[bx]
4:E2EA  26ff5f08             lcall es:[bx + 8]
loc_E2EE:
4:E2EE  c45e06               les bx, ptr [bp + 6]
4:E2F1  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
4:E2F7  0f858500             jne 0xe380
4:E2FB  6a7a                 push 0x7a
4:E2FD  b80100               mov ax, 1
4:E300  268987ea00           mov word ptr es:[bx + 0xea], ax
4:E305  50                   push ax
4:E306  8d4efc               lea cx, [bp - 4]
4:E309  16                   push ss
4:E30A  51                   push cx
4:E30B  9a1a941de3           lcall 0xe31d, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:E310  8d46fc               lea ax, [bp - 4]
4:E313  16                   push ss
4:E314  50                   push ax
4:E315  66ff36a002           push dword ptr [0x2a0]
4:E31A  9a9e5c70e3           lcall 0xe370, 0x5c9e  ; SoundMgr::playVoicePair@s2:5C9E
4:E31F  c45e06               les bx, ptr [bp + 6]
4:E322  268987ec00           mov word ptr es:[bx + 0xec], ax
4:E327  681201               push 0x112
4:E32A  9a9c171be2           lcall 0xe21b, 0x179c  ; operator_new@s1:179C
4:E32F  83c402               add sp, 2
4:E332  8946f4               mov word ptr [bp - 0xc], ax
4:E335  8956f6               mov word ptr [bp - 0xa], dx
4:E338  0bd0                 or dx, ax
4:E33A  7420                 je 0xe35c
4:E33C  c45e06               les bx, ptr [bp + 6]
4:E33F  26ff87cc00           inc word ptr es:[bx + 0xcc]
4:E344  06                   push es
4:E345  53                   push bx
4:E346  26ffb7cc00           push word ptr es:[bx + 0xcc]
4:E34B  66ff76f4             push dword ptr [bp - 0xc]
4:E34F  9a4436c6e2           lcall 0xe2c6, 0x3644  ; StarMapWnd::StarMapWnd@s5:3644
4:E354  8946f8               mov word ptr [bp - 8], ax
4:E357  8956fa               mov word ptr [bp - 6], dx
4:E35A  eb07                 jmp 0xe363
loc_E35C:
4:E35C  662bc0               sub eax, eax
4:E35F  668946f8             mov dword ptr [bp - 8], eax
loc_E363:
4:E363  ff76fa               push word ptr [bp - 6]
4:E366  50                   push ax
4:E367  6a00                 push 0
4:E369  66ff7606             push dword ptr [bp + 6]
4:E36D  9a78692ee2           lcall 0xe22e, 0x6978  ; SOLChildWnd::addChild@s2:6978
4:E372  6a05                 push 5
4:E374  c45ef8               les bx, ptr [bp - 8]
4:E377  06                   push es
4:E378  53                   push bx
4:E379  26c41f               les bx, ptr es:[bx]
4:E37C  26ff5f0c             lcall es:[bx + 0xc]
loc_E380:
4:E380  c9                   leave
4:E381  ca0400               retf 4

; ---------------- Mode4View::create@s4:E384 size=100 callers=0
;   (vslot 2)
4:E384  c8040000             enter 4, 0
4:E388  66ff7606             push dword ptr [bp + 6]
4:E38C  9a60970ee3           lcall 0xe30e, 0x9760  ; SOLWnd::create@s2:9760
4:E391  c45e06               les bx, ptr [bp + 6]
4:E394  26ff7708             push word ptr es:[bx + 8]
4:E398  6626ffb7f200         push dword ptr es:[bx + 0xf2]
4:E39E  90                   nop
4:E39F  0e                   push cs
4:E3A0  e80d6a               call 0x14db0  ; CmdTarget::getDC@s4:4DB0
4:E3A3  6a18                 push 0x18
4:E3A5  9a9c172de3           lcall 0xe32d, 0x179c  ; operator_new@s1:179C
4:E3AA  83c402               add sp, 2
4:E3AD  8956fe               mov word ptr [bp - 2], dx
4:E3B0  0bd0                 or dx, ax
4:E3B2  7422                 je 0xe3d6
4:E3B4  c45e06               les bx, ptr [bp + 6]
4:E3B7  26ff7708             push word ptr es:[bx + 8]
4:E3BB  ff76fe               push word ptr [bp - 2]
4:E3BE  50                   push ax
4:E3BF  90                   nop
4:E3C0  0e                   push cs
4:E3C1  e82e01               call 0xe4f2  ; Mode4Layer::Mode4Layer@s4:E4F2
4:E3C4  c45e06               les bx, ptr [bp + 6]
4:E3C7  268987ee00           mov word ptr es:[bx + 0xee], ax
4:E3CC  268997f000           mov word ptr es:[bx + 0xf0], dx
4:E3D1  c9                   leave
4:E3D2  ca0400               retf 4
4:E3D5  db 90
loc_E3D6:
4:E3D6  c45e06               les bx, ptr [bp + 6]
4:E3D9  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
4:E3E3  c9                   leave
4:E3E4  ca0400               retf 4
4:E3E7  db 00

; ---------------- Mode4View::destroy@s4:E3E8 FAR size=50 callers=0
;   (vslot 36)
4:E3E8  c8080000             enter 8, 0
4:E3EC  c45e06               les bx, ptr [bp + 6]
4:E3EF  268b87ee00           mov ax, word ptr es:[bx + 0xee]
4:E3F4  268b97f000           mov dx, word ptr es:[bx + 0xf0]
4:E3F9  8bda                 mov bx, dx
4:E3FB  0bd8                 or bx, ax
4:E3FD  740e                 je 0xe40d
4:E3FF  6a01                 push 1
4:E401  52                   push dx
4:E402  50                   push ax
4:E403  8ec2                 mov es, dx
4:E405  8bd8                 mov bx, ax
4:E407  26c41f               les bx, ptr es:[bx]
4:E40A  26ff1f               lcall es:[bx]
loc_E40D:
4:E40D  66ff7606             push dword ptr [bp + 6]
4:E411  9a8e628fe3           lcall 0xe38f, 0x628e  ; DanWnd::destroy@s2:628E
4:E416  c9                   leave
4:E417  ca0400               retf 4

; ---------------- Mode4View::thunk_dtor@s4:E41A FAR size=14 callers=0
;   this-adjusting thunk
4:E41A  8bdc                 mov bx, sp
4:E41C  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
4:E422  e90300               jmp 0xe428
4:E425  db 90 90 00

; ---------------- Mode4View::scalar_dtor@s4:E428 FAR size=202 callers=0
;   deleting destructor
4:E428  55                   push bp
4:E429  8bec                 mov bp, sp
4:E42B  66ff7606             push dword ptr [bp + 6]
4:E42F  90                   nop
4:E430  0e                   push cs
4:E431  e86cfe               call 0xe2a0  ; Mode4View::~Mode4View@s4:E2A0
4:E434  f6460a01             test byte ptr [bp + 0xa], 1
4:E438  7409                 je 0xe443
4:E43A  66ff7606             push dword ptr [bp + 6]
4:E43E  9ace17a8e3           lcall 0xe3a8, 0x17ce  ; operator_delete@s1:17CE
loc_E443:
4:E443  8b4606               mov ax, word ptr [bp + 6]
4:E446  8b5608               mov dx, word ptr [bp + 8]
4:E449  c9                   leave
4:E44A  ca0600               retf 6
4:E44D  db 90 28 e4 58 e4 ea 68 5c e4 84 e3 84 e4 c6 68 60
4:E45D  db e4 40 96 64 e4 64 96 68 e4 2c 37 6c e4 f2 97 70
4:E46D  db e4 3c 37 74 e4 40 37 78 e4 44 37 7c e4 48 37 80
4:E47D  db e4 4c 37 88 e4 cc e2 e0 e4 98 96 90 e4 50 82 b0
4:E48D  db e4 54 37 94 e4 60 9c 98 e4 58 37 9c e4 24 63 a0
4:E49D  db e4 4e 9c a4 e4 62 37 a8 e4 4a 9c ac e4 66 37 b4
4:E4AD  db e4 06 81 dc e4 4a 6a b8 e4 2e 6b bc e4 02 6b c0
4:E4BD  db e4 7a 37 c4 e4 52 9c c8 e4 56 9c cc e4 16 9c d0
4:E4CD  db e4 30 9c d4 e4 86 9c d8 e4 c4 9c e4 e4 c0 81 e8
4:E4DD  db e4 e8 e3 af e2 28 63 14 e4 28 81 52 e3 1a e4 50
4:E4ED  db e4 10 3a 54 e4

; ---------------- Mode4Layer::Mode4Layer@s4:E4F2 FAR size=136 callers=1
;   its picture layer
4:E4F2  c80c0000             enter 0xc, 0
4:E4F6  66ff7608             push dword ptr [bp + 8]
4:E4FA  ff7606               push word ptr [bp + 6]
4:E4FD  9a1c926de5           lcall 0xe56d, 0x921c  ; Layer::Layer@s5:921C
4:E502  c45e06               les bx, ptr [bp + 6]
4:E505  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:E50E  26c707d0e5           mov word ptr es:[bx], 0xe5d0
4:E513  26c74702ece4         mov word ptr es:[bx + 2], 0xe4ec  ; SEGMENT s4:0000
4:E519  6a26                 push 0x26
4:E51B  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E520  9aba207ae2           lcall 0xe27a, 0x20ba  ; Registry_get@s3:20BA
4:E525  c45e06               les bx, ptr [bp + 6]
4:E528  26894714             mov word ptr es:[bx + 0x14], ax
4:E52C  26895716             mov word ptr es:[bx + 0x16], dx
4:E530  268b4714             mov ax, word ptr es:[bx + 0x14]
4:E534  26894706             mov word ptr es:[bx + 6], ax
4:E538  26895708             mov word ptr es:[bx + 8], dx
4:E53C  c45e06               les bx, ptr [bp + 6]
4:E53F  26c45f14             les bx, ptr es:[bx + 0x14]
4:E543  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:E548  668946fc             mov dword ptr [bp - 4], eax
4:E54C  668b4606             mov eax, dword ptr [bp + 6]
4:E550  050a00               add ax, 0xa
4:E553  6650                 push eax
4:E555  c45efc               les bx, ptr [bp - 4]
4:E558  06                   push es
4:E559  53                   push bx
4:E55A  26c41f               les bx, ptr es:[bx]
4:E55D  26ff5f08             lcall es:[bx + 8]
4:E561  c45e06               les bx, ptr [bp + 6]
4:E564  26894712             mov word ptr es:[bx + 0x12], ax
4:E568  06                   push es
4:E569  53                   push bx
4:E56A  9a64938ce4           lcall 0xe48c, 0x9364  ; Layer::drawFrame@s5:9364
4:E56F  8b4606               mov ax, word ptr [bp + 6]
4:E572  8b5608               mov dx, word ptr [bp + 8]
4:E575  c9                   leave
4:E576  ca0600               retf 6
4:E579  db 00

; ---------------- Mode4Layer::~Mode4Layer@s4:E57A FAR size=48 callers=1
;   dtor
4:E57A  55                   push bp
4:E57B  8bec                 mov bp, sp
4:E57D  c45e06               les bx, ptr [bp + 6]
4:E580  26c707d0e5           mov word ptr es:[bx], 0xe5d0
4:E585  26c7470217e5         mov word ptr es:[bx + 2], 0xe517  ; SEGMENT s4:0000
4:E58B  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
4:E591  740a                 je 0xe59d
4:E593  6626ff7714           push dword ptr es:[bx + 0x14]
4:E598  9ada1d23e5           lcall 0xe523, 0x1dda  ; RegObj::makeCurrent@s3:1DDA
loc_E59D:
4:E59D  66ff7606             push dword ptr [bp + 6]
4:E5A1  9ac49200e5           lcall 0xe500, 0x92c4  ; Layer::~Layer@s5:92C4
4:E5A6  c9                   leave
4:E5A7  ca0400               retf 4

; ---------------- Mode4Layer::scalar_dtor@s4:E5AA FAR size=50 callers=0
;   deleting destructor
4:E5AA  55                   push bp
4:E5AB  8bec                 mov bp, sp
4:E5AD  66ff7606             push dword ptr [bp + 6]
4:E5B1  90                   nop
4:E5B2  0e                   push cs
4:E5B3  e8c4ff               call 0xe57a  ; Mode4Layer::~Mode4Layer@s4:E57A
4:E5B6  f6460a01             test byte ptr [bp + 0xa], 1
4:E5BA  7409                 je 0xe5c5
4:E5BC  66ff7606             push dword ptr [bp + 6]
4:E5C0  9ace1741e4           lcall 0xe441, 0x17ce  ; operator_delete@s1:17CE
loc_E5C5:
4:E5C5  8b4606               mov ax, word ptr [bp + 6]
4:E5C8  8b5608               mov dx, word ptr [bp + 8]
4:E5CB  c9                   leave
4:E5CC  ca0600               retf 6
4:E5CF  db 90 aa e5 89 e5 10 3a f0 e4 12 93 a4 e5

; ---------------- Mode9View::Mode9View@s4:E5DC FAR size=112 callers=1
;   mode 9 view: after Destination Launch
4:E5DC  55                   push bp
4:E5DD  8bec                 mov bp, sp
4:E5DF  66ff760c             push dword ptr [bp + 0xc]
4:E5E3  ff760a               push word ptr [bp + 0xa]
4:E5E6  6a09                 push 9
4:E5E8  66ff7606             push dword ptr [bp + 6]
4:E5EC  9a7a7fdae5           lcall 0xe5da, 0x7f7a  ; ScreenView::ScreenView@s5:7F7A
4:E5F1  c45e06               les bx, ptr [bp + 6]
4:E5F4  662bc0               sub eax, eax
4:E5F7  66268987ee00         mov dword ptr es:[bx + 0xee], eax
4:E5FD  66268987f200         mov dword ptr es:[bx + 0xf2], eax
4:E603  26c70790e7           mov word ptr es:[bx], 0xe790
4:E608  26c747021ae6         mov word ptr es:[bx + 2], 0xe61a  ; SEGMENT s4:0000
4:E60E  26c787e2002ce8       mov word ptr es:[bx + 0xe2], 0xe82c
4:E615  26c787e400d2e5       mov word ptr es:[bx + 0xe4], 0xe5d2  ; SEGMENT s4:0000
4:E61C  6a0a                 push 0xa
4:E61E  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E623  9aba209be5           lcall 0xe59b, 0x20ba  ; Registry_get@s3:20BA
4:E628  c45e06               les bx, ptr [bp + 6]
4:E62B  268987f200           mov word ptr es:[bx + 0xf2], ax
4:E630  268997f400           mov word ptr es:[bx + 0xf4], dx
4:E635  268b87f200           mov ax, word ptr es:[bx + 0xf2]
4:E63A  268987e600           mov word ptr es:[bx + 0xe6], ax
4:E63F  268997e800           mov word ptr es:[bx + 0xe8], dx
4:E644  8bc3                 mov ax, bx
4:E646  8cc2                 mov dx, es
4:E648  c9                   leave
4:E649  ca0a00               retf 0xa

; ---------------- Mode9View::~Mode9View@s4:E64C FAR size=44 callers=1
;   dtor
4:E64C  55                   push bp
4:E64D  8bec                 mov bp, sp
4:E64F  c45e06               les bx, ptr [bp + 6]
4:E652  26c70790e7           mov word ptr es:[bx], 0xe790
4:E657  26c7470269e6         mov word ptr es:[bx + 2], 0xe669  ; SEGMENT s4:0000
4:E65D  26c787e2002ce8       mov word ptr es:[bx + 0xe2], 0xe82c
4:E664  26c787e4000ce6       mov word ptr es:[bx + 0xe4], 0xe60c  ; SEGMENT s4:0000
4:E66B  66ff7606             push dword ptr [bp + 6]
4:E66F  9a8e80efe5           lcall 0xe5ef, 0x808e  ; ScreenView::~ScreenView@s5:808E
4:E674  c9                   leave
4:E675  ca0400               retf 4

; ---------------- Mode9View::onShow@s4:E678 size=78 callers=0
;   (vslot 13) opens window mode 21 (Interstellar Launch System, dialog 318)
4:E678  c8060000             enter 6, 0
4:E67C  c45e06               les bx, ptr [bp + 6]
4:E67F  268b87f000           mov ax, word ptr es:[bx + 0xf0]
4:E684  260b87ee00           or ax, word ptr es:[bx + 0xee]
4:E689  7412                 je 0xe69d
4:E68B  6626ffb7ee00         push dword ptr es:[bx + 0xee]
4:E691  26c49fee00           les bx, ptr es:[bx + 0xee]
4:E696  26c41f               les bx, ptr es:[bx]
4:E699  26ff5f08             lcall es:[bx + 8]
loc_E69D:
4:E69D  c45e06               les bx, ptr [bp + 6]
4:E6A0  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
4:E6A6  751a                 jne 0xe6c2
4:E6A8  26c787ea000100       mov word ptr es:[bx + 0xea], 1
4:E6AF  6a15                 push 0x15
4:E6B1  c45e06               les bx, ptr [bp + 6]
4:E6B4  26ff7708             push word ptr es:[bx + 8]
4:E6B8  66ff367c5b           push dword ptr [0x5b7c]
4:E6BD  9a40af15e0           lcall 0xe015, 0xaf40  ; DialogCtr::open@s8:AF40
loc_E6C2:
4:E6C2  c9                   leave
4:E6C3  ca0400               retf 4

; ---------------- Mode9View::create@s4:E6C6 size=100 callers=0
;   (vslot 2)
4:E6C6  c8040000             enter 4, 0
4:E6CA  66ff7606             push dword ptr [bp + 6]
4:E6CE  9a6097d6e5           lcall 0xe5d6, 0x9760  ; SOLWnd::create@s2:9760
4:E6D3  c45e06               les bx, ptr [bp + 6]
4:E6D6  26ff7708             push word ptr es:[bx + 8]
4:E6DA  6626ffb7f200         push dword ptr es:[bx + 0xf2]
4:E6E0  90                   nop
4:E6E1  0e                   push cs
4:E6E2  e8cb66               call 0x14db0  ; CmdTarget::getDC@s4:4DB0
4:E6E5  6a18                 push 0x18
4:E6E7  9a9c17c3e5           lcall 0xe5c3, 0x179c  ; operator_new@s1:179C
4:E6EC  83c402               add sp, 2
4:E6EF  8956fe               mov word ptr [bp - 2], dx
4:E6F2  0bd0                 or dx, ax
4:E6F4  7422                 je 0xe718
4:E6F6  c45e06               les bx, ptr [bp + 6]
4:E6F9  26ff7708             push word ptr es:[bx + 8]
4:E6FD  ff76fe               push word ptr [bp - 2]
4:E700  50                   push ax
4:E701  90                   nop
4:E702  0e                   push cs
4:E703  e82e01               call 0xe834  ; Mode9Layer::Mode9Layer@s4:E834
4:E706  c45e06               les bx, ptr [bp + 6]
4:E709  268987ee00           mov word ptr es:[bx + 0xee], ax
4:E70E  268997f000           mov word ptr es:[bx + 0xf0], dx
4:E713  c9                   leave
4:E714  ca0400               retf 4
4:E717  db 90
loc_E718:
4:E718  c45e06               les bx, ptr [bp + 6]
4:E71B  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
4:E725  c9                   leave
4:E726  ca0400               retf 4
4:E729  db 00

; ---------------- Mode9View::destroy@s4:E72A FAR size=50 callers=0
;   (vslot 36)
4:E72A  c8080000             enter 8, 0
4:E72E  c45e06               les bx, ptr [bp + 6]
4:E731  268b87ee00           mov ax, word ptr es:[bx + 0xee]
4:E736  268b97f000           mov dx, word ptr es:[bx + 0xf0]
4:E73B  8bda                 mov bx, dx
4:E73D  0bd8                 or bx, ax
4:E73F  740e                 je 0xe74f
4:E741  6a01                 push 1
4:E743  52                   push dx
4:E744  50                   push ax
4:E745  8ec2                 mov es, dx
4:E747  8bd8                 mov bx, ax
4:E749  26c41f               les bx, ptr es:[bx]
4:E74C  26ff1f               lcall es:[bx]
loc_E74F:
4:E74F  66ff7606             push dword ptr [bp + 6]
4:E753  9a8e62d1e6           lcall 0xe6d1, 0x628e  ; DanWnd::destroy@s2:628E
4:E758  c9                   leave
4:E759  ca0400               retf 4

; ---------------- Mode9View::thunk_dtor@s4:E75C FAR size=14 callers=0
;   this-adjusting thunk
4:E75C  8bdc                 mov bx, sp
4:E75E  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
4:E764  e90300               jmp 0xe76a
4:E767  db 90 90 00

; ---------------- Mode9View::scalar_dtor@s4:E76A FAR size=202 callers=0
;   deleting destructor
4:E76A  55                   push bp
4:E76B  8bec                 mov bp, sp
4:E76D  66ff7606             push dword ptr [bp + 6]
4:E771  90                   nop
4:E772  0e                   push cs
4:E773  e8d6fe               call 0xe64c  ; Mode9View::~Mode9View@s4:E64C
4:E776  f6460a01             test byte ptr [bp + 0xa], 1
4:E77A  7409                 je 0xe785
4:E77C  66ff7606             push dword ptr [bp + 6]
4:E780  9ace17eae6           lcall 0xe6ea, 0x17ce  ; operator_delete@s1:17CE
loc_E785:
4:E785  8b4606               mov ax, word ptr [bp + 6]
4:E788  8b5608               mov dx, word ptr [bp + 8]
4:E78B  c9                   leave
4:E78C  ca0600               retf 6
4:E78F  db 90 6a e7 9a e7 ea 68 9e e7 c6 e6 c6 e7 c6 68 a2
4:E79F  db e7 40 96 a6 e7 64 96 aa e7 2c 37 ae e7 f2 97 b2
4:E7AF  db e7 3c 37 b6 e7 40 37 ba e7 44 37 be e7 48 37 c2
4:E7BF  db e7 4c 37 ca e7 78 e6 22 e8 98 96 d2 e7 50 82 f2
4:E7CF  db e7 54 37 d6 e7 60 9c da e7 58 37 de e7 24 63 e2
4:E7DF  db e7 4e 9c e6 e7 62 37 ea e7 4a 9c ee e7 66 37 f6
4:E7EF  db e7 06 81 1e e8 4a 6a fa e7 2e 6b fe e7 02 6b 02
4:E7FF  db e8 7a 37 06 e8 52 9c 0a e8 56 9c 0e e8 16 9c 12
4:E80F  db e8 30 9c 16 e8 86 9c 1a e8 c4 9c 26 e8 c0 81 2a
4:E81F  db e8 2a e7 5b e6 28 63 56 e7 28 81 72 e6 5c e7 92
4:E82F  db e7 10 3a 96 e7

; ---------------- Mode9Layer::Mode9Layer@s4:E834 FAR size=136 callers=1
;   its picture layer
4:E834  c80c0000             enter 0xc, 0
4:E838  66ff7608             push dword ptr [bp + 8]
4:E83C  ff7606               push word ptr [bp + 6]
4:E83F  9a1c92afe8           lcall 0xe8af, 0x921c  ; Layer::Layer@s5:921C
4:E844  c45e06               les bx, ptr [bp + 6]
4:E847  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:E850  26c70712e9           mov word ptr es:[bx], 0xe912
4:E855  26c747022ee8         mov word ptr es:[bx + 2], 0xe82e  ; SEGMENT s4:0000
4:E85B  6a0a                 push 0xa
4:E85D  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E862  9aba2026e6           lcall 0xe626, 0x20ba  ; Registry_get@s3:20BA
4:E867  c45e06               les bx, ptr [bp + 6]
4:E86A  26894714             mov word ptr es:[bx + 0x14], ax
4:E86E  26895716             mov word ptr es:[bx + 0x16], dx
4:E872  268b4714             mov ax, word ptr es:[bx + 0x14]
4:E876  26894706             mov word ptr es:[bx + 6], ax
4:E87A  26895708             mov word ptr es:[bx + 8], dx
4:E87E  c45e06               les bx, ptr [bp + 6]
4:E881  26c45f14             les bx, ptr es:[bx + 0x14]
4:E885  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:E88A  668946fc             mov dword ptr [bp - 4], eax
4:E88E  668b4606             mov eax, dword ptr [bp + 6]
4:E892  050a00               add ax, 0xa
4:E895  6650                 push eax
4:E897  c45efc               les bx, ptr [bp - 4]
4:E89A  06                   push es
4:E89B  53                   push bx
4:E89C  26c41f               les bx, ptr es:[bx]
4:E89F  26ff5f08             lcall es:[bx + 8]
4:E8A3  c45e06               les bx, ptr [bp + 6]
4:E8A6  26894712             mov word ptr es:[bx + 0x12], ax
4:E8AA  06                   push es
4:E8AB  53                   push bx
4:E8AC  9a6493cee7           lcall 0xe7ce, 0x9364  ; Layer::drawFrame@s5:9364
4:E8B1  8b4606               mov ax, word ptr [bp + 6]
4:E8B4  8b5608               mov dx, word ptr [bp + 8]
4:E8B7  c9                   leave
4:E8B8  ca0600               retf 6
4:E8BB  db 00

; ---------------- Mode9Layer::~Mode9Layer@s4:E8BC FAR size=48 callers=1
;   dtor
4:E8BC  55                   push bp
4:E8BD  8bec                 mov bp, sp
4:E8BF  c45e06               les bx, ptr [bp + 6]
4:E8C2  26c70712e9           mov word ptr es:[bx], 0xe912
4:E8C7  26c7470259e8         mov word ptr es:[bx + 2], 0xe859  ; SEGMENT s4:0000
4:E8CD  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
4:E8D3  740a                 je 0xe8df
4:E8D5  6626ff7714           push dword ptr es:[bx + 0x14]
4:E8DA  9ada1d65e8           lcall 0xe865, 0x1dda  ; RegObj::makeCurrent@s3:1DDA
loc_E8DF:
4:E8DF  66ff7606             push dword ptr [bp + 6]
4:E8E3  9ac49242e8           lcall 0xe842, 0x92c4  ; Layer::~Layer@s5:92C4
4:E8E8  c9                   leave
4:E8E9  ca0400               retf 4

; ---------------- Mode9Layer::scalar_dtor@s4:E8EC FAR size=50 callers=0
;   deleting destructor
4:E8EC  55                   push bp
4:E8ED  8bec                 mov bp, sp
4:E8EF  66ff7606             push dword ptr [bp + 6]
4:E8F3  90                   nop
4:E8F4  0e                   push cs
4:E8F5  e8c4ff               call 0xe8bc  ; Mode9Layer::~Mode9Layer@s4:E8BC
4:E8F8  f6460a01             test byte ptr [bp + 0xa], 1
4:E8FC  7409                 je 0xe907
4:E8FE  66ff7606             push dword ptr [bp + 6]
4:E902  9ace1783e7           lcall 0xe783, 0x17ce  ; operator_delete@s1:17CE
loc_E907:
4:E907  8b4606               mov ax, word ptr [bp + 6]
4:E90A  8b5608               mov dx, word ptr [bp + 8]
4:E90D  c9                   leave
4:E90E  ca0600               retf 6
4:E911  db 90 ec e8 cb e8 10 3a 32 e8 12 93 e6 e8

; ---------------- Mode3View::Mode3View@s4:E91E FAR size=192 callers=1
;   mode 3 view: the ship screen
4:E91E  c8040000             enter 4, 0
4:E922  66ff760c             push dword ptr [bp + 0xc]
4:E926  ff760a               push word ptr [bp + 0xa]
4:E929  6a03                 push 3
4:E92B  66ff7606             push dword ptr [bp + 6]
4:E92F  9a7a7f1ce9           lcall 0xe91c, 0x7f7a  ; ScreenView::ScreenView@s5:7F7A
4:E934  c45e06               les bx, ptr [bp + 6]
4:E937  662bc0               sub eax, eax
4:E93A  66268987ee00         mov dword ptr es:[bx + 0xee], eax
4:E940  66268987f200         mov dword ptr es:[bx + 0xf2], eax
4:E946  66268987f600         mov dword ptr es:[bx + 0xf6], eax
4:E94C  26c707d0eb           mov word ptr es:[bx], 0xebd0
4:E951  26c7470263e9         mov word ptr es:[bx + 2], 0xe963  ; SEGMENT s4:0000
4:E957  26c787e2006cec       mov word ptr es:[bx + 0xe2], 0xec6c
4:E95E  26c787e40014e9       mov word ptr es:[bx + 0xe4], 0xe914  ; SEGMENT s4:0000
4:E965  6a28                 push 0x28
4:E967  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E96C  9aba2097e9           lcall 0xe997, 0x20ba  ; Registry_get@s3:20BA
4:E971  c45e06               les bx, ptr [bp + 6]
4:E974  268987f200           mov word ptr es:[bx + 0xf2], ax
4:E979  268997f400           mov word ptr es:[bx + 0xf4], dx
4:E97E  268b87f200           mov ax, word ptr es:[bx + 0xf2]
4:E983  268987e600           mov word ptr es:[bx + 0xe6], ax
4:E988  268997e800           mov word ptr es:[bx + 0xe8], dx
4:E98D  6a32                 push 0x32
4:E98F  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:E994  9aba20dde8           lcall 0xe8dd, 0x20ba  ; Registry_get@s3:20BA
4:E999  c45e06               les bx, ptr [bp + 6]
4:E99C  268987f600           mov word ptr es:[bx + 0xf6], ax
4:E9A1  268997f800           mov word ptr es:[bx + 0xf8], dx
4:E9A6  8cc0                 mov ax, es
4:E9A8  0bc3                 or ax, bx
4:E9AA  740c                 je 0xe9b8
4:E9AC  8b4606               mov ax, word ptr [bp + 6]
4:E9AF  8b5608               mov dx, word ptr [bp + 8]
4:E9B2  05e200               add ax, 0xe2
4:E9B5  eb04                 jmp 0xe9bb
4:E9B7  db 90
loc_E9B8:
4:E9B8  33c0                 xor ax, ax
4:E9BA  99                   cdq
loc_E9BB:
4:E9BB  52                   push dx
4:E9BC  50                   push ax
4:E9BD  6a0b                 push 0xb
4:E9BF  c45e06               les bx, ptr [bp + 6]
4:E9C2  6626ffb7f600         push dword ptr es:[bx + 0xf6]
4:E9C8  26c49ff600           les bx, ptr es:[bx + 0xf6]
4:E9CD  26c41f               les bx, ptr es:[bx]
4:E9D0  26ff5f04             lcall es:[bx + 4]
4:E9D4  8b4606               mov ax, word ptr [bp + 6]
4:E9D7  8b5608               mov dx, word ptr [bp + 8]
4:E9DA  c9                   leave
4:E9DB  ca0a00               retf 0xa

; ---------------- Mode3View::~Mode3View@s4:E9DE FAR size=44 callers=1
;   dtor
4:E9DE  55                   push bp
4:E9DF  8bec                 mov bp, sp
4:E9E1  c45e06               les bx, ptr [bp + 6]
4:E9E4  26c707d0eb           mov word ptr es:[bx], 0xebd0
4:E9E9  26c74702fbe9         mov word ptr es:[bx + 2], 0xe9fb  ; SEGMENT s4:0000
4:E9EF  26c787e2006cec       mov word ptr es:[bx + 0xe2], 0xec6c
4:E9F6  26c787e40055e9       mov word ptr es:[bx + 0xe4], 0xe955  ; SEGMENT s4:0000
4:E9FD  66ff7606             push dword ptr [bp + 6]
4:EA01  9a8e8032e9           lcall 0xe932, 0x808e  ; ScreenView::~ScreenView@s5:808E
4:EA06  c9                   leave
4:EA07  ca0400               retf 4

; ---------------- Mode3View::onCommand@s4:EA0A size=34 callers=0
;   apis: USER.PostMessage
;   (vslot 16) command 0xED (Launch): posts 198 (mode 4)
4:EA0A  c8080000             enter 8, 0
4:EA0E  817e0aed00           cmp word ptr [bp + 0xa], 0xed
4:EA13  7512                 jne 0xea27
4:EA15  ff369603             push word ptr [0x396]
4:EA19  6668c6001101         push 0x11100c6
4:EA1F  666a00               push 0
4:EA22  9a19d00000           lcall 0, 0xd019  ; USER.PostMessage
loc_EA27:
4:EA27  c9                   leave
4:EA28  ca0600               retf 6
4:EA2B  db 00

; ---------------- Mode3View::onNotify@s4:EA2C FAR size=58 callers=0
;   (vslot 40) mirrors a value into its layer
4:EA2C  c8080000             enter 8, 0
4:EA30  8b460a               mov ax, word ptr [bp + 0xa]
4:EA33  eb25                 jmp 0xea5a
4:EA35  db 90
loc_EA36:
4:EA36  c45e06               les bx, ptr [bp + 6]
4:EA39  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:EA42  c9                   leave
4:EA43  ca0600               retf 6
loc_EA46:
4:EA46  c45e06               les bx, ptr [bp + 6]
4:EA49  268b8726ff           mov ax, word ptr es:[bx - 0xda]
4:EA4E  26c45f14             les bx, ptr es:[bx + 0x14]
4:EA52  2689470e             mov word ptr es:[bx + 0xe], ax
4:EA56  c9                   leave
4:EA57  ca0600               retf 6
loc_EA5A:
4:EA5A  48                   dec ax
4:EA5B  74d9                 je 0xea36
4:EA5D  2d0a00               sub ax, 0xa
4:EA60  74e4                 je 0xea46
4:EA62  c9                   leave
4:EA63  ca0600               retf 6

; ---------------- Mode3View::onShow@s4:EA66 size=116 callers=0
;   (vslot 13) add9 and window id 8 (Ship Configuration) once
4:EA66  c8040000             enter 4, 0
4:EA6A  c45e06               les bx, ptr [bp + 6]
4:EA6D  662683bfee0000       cmp dword ptr es:[bx + 0xee], 0
4:EA74  7412                 je 0xea88
4:EA76  6626ffb7ee00         push dword ptr es:[bx + 0xee]
4:EA7C  26c49fee00           les bx, ptr es:[bx + 0xee]
4:EA81  26c41f               les bx, ptr es:[bx]
4:EA84  26ff5f08             lcall es:[bx + 8]
loc_EA88:
4:EA88  c45e06               les bx, ptr [bp + 6]
4:EA8B  2683bfea0000         cmp word ptr es:[bx + 0xea], 0
4:EA91  7543                 jne 0xead6
4:EA93  689500               push 0x95
4:EA96  b80100               mov ax, 1
4:EA99  268987ea00           mov word ptr es:[bx + 0xea], ax
4:EA9E  50                   push ax
4:EA9F  8d46fc               lea ax, [bp - 4]
4:EAA2  16                   push ss
4:EAA3  50                   push ax
4:EAA4  9a1a94b6ea           lcall 0xeab6, 0x941a  ; Pair::Pair(a,b)@s2:941A
4:EAA9  8d46fc               lea ax, [bp - 4]
4:EAAC  16                   push ss
4:EAAD  50                   push ax
4:EAAE  66ff36a002           push dword ptr [0x2a0]
4:EAB3  9a9e5c18e9           lcall 0xe918, 0x5c9e  ; SoundMgr::playVoicePair@s2:5C9E
4:EAB8  c45e06               les bx, ptr [bp + 6]
4:EABB  268987ec00           mov word ptr es:[bx + 0xec], ax
4:EAC0  666a00               push 0
4:EAC3  666800000800         push 0x80000
4:EAC9  6a00                 push 0
4:EACB  6626ffb7f600         push dword ptr es:[bx + 0xf6]
4:EAD1  9a00736fe9           lcall 0xe96f, 0x7300  ; BuildingWindows::open@s3:7300
loc_EAD6:
4:EAD6  c9                   leave
4:EAD7  ca0400               retf 4

; ---------------- Mode3View::create@s4:EADA size=100 callers=0
;   (vslot 2)
4:EADA  c8040000             enter 4, 0
4:EADE  66ff7606             push dword ptr [bp + 6]
4:EAE2  9a6097a7ea           lcall 0xeaa7, 0x9760  ; SOLWnd::create@s2:9760
4:EAE7  c45e06               les bx, ptr [bp + 6]
4:EAEA  26ff7708             push word ptr es:[bx + 8]
4:EAEE  6626ffb7f200         push dword ptr es:[bx + 0xf2]
4:EAF4  90                   nop
4:EAF5  0e                   push cs
4:EAF6  e8b762               call 0x14db0  ; CmdTarget::getDC@s4:4DB0
4:EAF9  6a28                 push 0x28
4:EAFB  9a9c1705e9           lcall 0xe905, 0x179c  ; operator_new@s1:179C
4:EB00  83c402               add sp, 2
4:EB03  8956fe               mov word ptr [bp - 2], dx
4:EB06  0bd0                 or dx, ax
4:EB08  7422                 je 0xeb2c
4:EB0A  c45e06               les bx, ptr [bp + 6]
4:EB0D  26ff7708             push word ptr es:[bx + 8]
4:EB11  ff76fe               push word ptr [bp - 2]
4:EB14  50                   push ax
4:EB15  90                   nop
4:EB16  0e                   push cs
4:EB17  e85a01               call 0xec74  ; ShipLayer::ShipLayer@s4:EC74
4:EB1A  c45e06               les bx, ptr [bp + 6]
4:EB1D  268987ee00           mov word ptr es:[bx + 0xee], ax
4:EB22  268997f000           mov word ptr es:[bx + 0xf0], dx
4:EB27  c9                   leave
4:EB28  ca0400               retf 4
4:EB2B  db 90
loc_EB2C:
4:EB2C  c45e06               les bx, ptr [bp + 6]
4:EB2F  6626c787ee0000000000 mov dword ptr es:[bx + 0xee], 0
4:EB39  c9                   leave
4:EB3A  ca0400               retf 4
4:EB3D  db 00

; ---------------- Mode3View::destroy@s4:EB3E FAR size=94 callers=0
;   (vslot 36)
4:EB3E  c80c0000             enter 0xc, 0
4:EB42  c45e06               les bx, ptr [bp + 6]
4:EB45  268b87ee00           mov ax, word ptr es:[bx + 0xee]
4:EB4A  268b97f000           mov dx, word ptr es:[bx + 0xf0]
4:EB4F  8bda                 mov bx, dx
4:EB51  0bd8                 or bx, ax
4:EB53  740e                 je 0xeb63
4:EB55  6a01                 push 1
4:EB57  52                   push dx
4:EB58  50                   push ax
4:EB59  8ec2                 mov es, dx
4:EB5B  8bd8                 mov bx, ax
4:EB5D  26c41f               les bx, ptr es:[bx]
4:EB60  26ff1f               lcall es:[bx]
loc_EB63:
4:EB63  c45e06               les bx, ptr [bp + 6]
4:EB66  662683bff60000       cmp dword ptr es:[bx + 0xf6], 0
4:EB6D  741f                 je 0xeb8e
4:EB6F  8cc0                 mov ax, es
4:EB71  0bc3                 or ax, bx
4:EB73  7409                 je 0xeb7e
4:EB75  8bc3                 mov ax, bx
4:EB77  8cc2                 mov dx, es
4:EB79  05e200               add ax, 0xe2
4:EB7C  eb03                 jmp 0xeb81
loc_EB7E:
4:EB7E  33c0                 xor ax, ax
4:EB80  99                   cdq
loc_EB81:
4:EB81  52                   push dx
4:EB82  50                   push ax
4:EB83  6626ffb7f600         push dword ptr es:[bx + 0xf6]
4:EB89  9aa61ed4ea           lcall 0xead4, 0x1ea6  ; RegObj::removeListener@s3:1EA6
loc_EB8E:
4:EB8E  66ff7606             push dword ptr [bp + 6]
4:EB92  9a8e62e5ea           lcall 0xeae5, 0x628e  ; DanWnd::destroy@s2:628E
4:EB97  c9                   leave
4:EB98  ca0400               retf 4
4:EB9B  db 00

; ---------------- Mode3View::thunk_dtor@s4:EB9C FAR size=14 callers=0
;   this-adjusting thunk
4:EB9C  8bdc                 mov bx, sp
4:EB9E  36816f04e200         sub word ptr ss:[bx + 4], 0xe2
4:EBA4  e90300               jmp 0xebaa
4:EBA7  db 90 90 00

; ---------------- Mode3View::scalar_dtor@s4:EBAA FAR size=202 callers=0
;   deleting destructor
4:EBAA  55                   push bp
4:EBAB  8bec                 mov bp, sp
4:EBAD  66ff7606             push dword ptr [bp + 6]
4:EBB1  90                   nop
4:EBB2  0e                   push cs
4:EBB3  e828fe               call 0xe9de  ; Mode3View::~Mode3View@s4:E9DE
4:EBB6  f6460a01             test byte ptr [bp + 0xa], 1
4:EBBA  7409                 je 0xebc5
4:EBBC  66ff7606             push dword ptr [bp + 6]
4:EBC0  9ace17feea           lcall 0xeafe, 0x17ce  ; operator_delete@s1:17CE
loc_EBC5:
4:EBC5  8b4606               mov ax, word ptr [bp + 6]
4:EBC8  8b5608               mov dx, word ptr [bp + 8]
4:EBCB  c9                   leave
4:EBCC  ca0600               retf 6
4:EBCF  db 90 aa eb da eb ea 68 de eb da ea 06 ec c6 68 e2
4:EBDF  db eb 40 96 e6 eb 64 96 ea eb 2c 37 ee eb f2 97 f2
4:EBEF  db eb 3c 37 f6 eb 40 37 fa eb 44 37 fe eb 48 37 02
4:EBFF  db ec 4c 37 0a ec 66 ea 12 ec 98 96 16 ec 50 82 32
4:EC0F  db ec 0a ea 62 ec 60 9c 1a ec 58 37 1e ec 24 63 22
4:EC1F  db ec 4e 9c 26 ec 62 37 2a ec 4a 9c 2e ec 66 37 36
4:EC2F  db ec 06 81 5e ec 4a 6a 3a ec 2e 6b 3e ec 02 6b 42
4:EC3F  db ec 7a 37 46 ec 52 9c 4a ec 56 9c 4e ec 16 9c 52
4:EC4F  db ec 30 9c 56 ec 86 9c 5a ec c4 9c 66 ec c0 81 6a
4:EC5F  db ec 3e eb ed e9 28 63 95 eb 28 81 04 ea 9c eb 72
4:EC6F  db ec 2c ea d2 eb

; ---------------- ShipLayer::ShipLayer@s4:EC74 FAR size=292 callers=1
;   the ship picture layer (registry 0x28 picture)
4:EC74  c8180000             enter 0x18, 0
4:EC78  57                   push di
4:EC79  56                   push si
4:EC7A  66ff7608             push dword ptr [bp + 8]
4:EC7E  ff7606               push word ptr [bp + 6]
4:EC81  9a1c92c3ec           lcall 0xecc3, 0x921c  ; Layer::Layer@s5:921C
4:EC86  c45e06               les bx, ptr [bp + 6]
4:EC89  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:EC92  8d4718               lea ax, [bx + 0x18]
4:EC95  06                   push es
4:EC96  50                   push ax
4:EC97  8bf0                 mov si, ax
4:EC99  8cc7                 mov di, es
4:EC9B  9a383eacec           lcall 0xecac, 0x3e38  ; Pos3::Pos3@s2:3E38
4:ECA0  668b4606             mov eax, dword ptr [bp + 6]
4:ECA4  051e00               add ax, 0x1e
4:ECA7  6650                 push eax
4:ECA9  9a383e71ed           lcall 0xed71, 0x3e38  ; Pos3::Pos3@s2:3E38
4:ECAE  c45e06               les bx, ptr [bp + 6]
4:ECB1  6626c7472400000000   mov dword ptr es:[bx + 0x24], 0
4:ECBA  26c707cc01           mov word ptr es:[bx], 0x1cc
4:ECBF  26c7470252ed         mov word ptr es:[bx + 2], 0xed52  ; SEGMENT s5:0000
4:ECC5  6a28                 push 0x28
4:ECC7  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:ECCC  9aba2007ed           lcall 0xed07, 0x20ba  ; Registry_get@s3:20BA
4:ECD1  c45e06               les bx, ptr [bp + 6]
4:ECD4  26894714             mov word ptr es:[bx + 0x14], ax
4:ECD8  26895716             mov word ptr es:[bx + 0x16], dx
4:ECDC  06                   push es
4:ECDD  53                   push bx
4:ECDE  6a00                 push 0
4:ECE0  52                   push dx
4:ECE1  26ff7714             push word ptr es:[bx + 0x14]
4:ECE5  26c45f14             les bx, ptr es:[bx + 0x14]
4:ECE9  26c41f               les bx, ptr es:[bx]
4:ECEC  26ff5f04             lcall es:[bx + 4]
4:ECF0  c45e06               les bx, ptr [bp + 6]
4:ECF3  66268b4714           mov eax, dword ptr es:[bx + 0x14]
4:ECF8  6626894706           mov dword ptr es:[bx + 6], eax
4:ECFD  57                   push di
4:ECFE  56                   push si
4:ECFF  6626ff7714           push dword ptr es:[bx + 0x14]
4:ED04  9a502b14ed           lcall 0xed14, 0x2b50  ; PictureCache::origin@s3:2B50
4:ED09  c45e06               les bx, ptr [bp + 6]
4:ED0C  6626ff7714           push dword ptr es:[bx + 0x14]
4:ED11  9a662b5eed           lcall 0xed5e, 0x2b66  ; PictureCache::current@s3:2B66
4:ED16  c45e06               les bx, ptr [bp + 6]
4:ED19  26894724             mov word ptr es:[bx + 0x24], ax
4:ED1D  26895726             mov word ptr es:[bx + 0x26], dx
4:ED21  c45e06               les bx, ptr [bp + 6]
4:ED24  26c45f14             les bx, ptr es:[bx + 0x14]
4:ED28  66268b470a           mov eax, dword ptr es:[bx + 0xa]
4:ED2D  668946fc             mov dword ptr [bp - 4], eax
4:ED31  668b4606             mov eax, dword ptr [bp + 6]
4:ED35  050a00               add ax, 0xa
4:ED38  6650                 push eax
4:ED3A  c45efc               les bx, ptr [bp - 4]
4:ED3D  06                   push es
4:ED3E  53                   push bx
4:ED3F  26c41f               les bx, ptr es:[bx]
4:ED42  26ff5f08             lcall es:[bx + 8]
4:ED46  c45e06               les bx, ptr [bp + 6]
4:ED49  26894712             mov word ptr es:[bx + 0x12], ax
4:ED4D  06                   push es
4:ED4E  53                   push bx
4:ED4F  9a64930eec           lcall 0xec0e, 0x9364  ; Layer::drawFrame@s5:9364
4:ED54  6a48                 push 0x48
4:ED56  66ff36d00e           push dword ptr [0xed0]  ; g_registry
4:ED5B  9aba208ceb           lcall 0xeb8c, 0x20ba  ; Registry_get@s3:20BA
4:ED60  050e00               add ax, 0xe
4:ED63  52                   push dx
4:ED64  50                   push ax
4:ED65  668b4606             mov eax, dword ptr [bp + 6]
4:ED69  051e00               add ax, 0x1e
4:ED6C  6650                 push eax
4:ED6E  9a623f89ed           lcall 0xed89, 0x3f62  ; Pos3::assign@s2:3F62
4:ED73  8b4606               mov ax, word ptr [bp + 6]
4:ED76  8b5608               mov dx, word ptr [bp + 8]
4:ED79  051e00               add ax, 0x1e
4:ED7C  52                   push dx
4:ED7D  50                   push ax
4:ED7E  8b4606               mov ax, word ptr [bp + 6]
4:ED81  051800               add ax, 0x18
4:ED84  52                   push dx
4:ED85  50                   push ax
4:ED86  9a323fd6eb           lcall 0xebd6, 0x3f32  ; Pos3::add@s2:3F32
4:ED8B  8b4606               mov ax, word ptr [bp + 6]
4:ED8E  8b5608               mov dx, word ptr [bp + 8]
4:ED91  5e                   pop si
4:ED92  5f                   pop di
4:ED93  c9                   leave
4:ED94  ca0600               retf 6
4:ED97  db 00

; ---------------- ShipLayer::~ShipLayer@s4:ED98 FAR size=64 callers=1
;   dtor
4:ED98  55                   push bp
4:ED99  8bec                 mov bp, sp
4:ED9B  c45e06               les bx, ptr [bp + 6]
4:ED9E  26c707cc01           mov word ptr es:[bx], 0x1cc
4:EDA3  26c74702d1ed         mov word ptr es:[bx + 2], 0xedd1  ; SEGMENT s5:0000
4:EDA9  6626837f1400         cmp dword ptr es:[bx + 0x14], 0
4:EDAF  7419                 je 0xedca
4:EDB1  06                   push es
4:EDB2  53                   push bx
4:EDB3  6626ff7714           push dword ptr es:[bx + 0x14]
4:EDB8  9aa61ec8ed           lcall 0xedc8, 0x1ea6  ; RegObj::removeListener@s3:1EA6
4:EDBD  c45e06               les bx, ptr [bp + 6]
4:EDC0  6626ff7714           push dword ptr es:[bx + 0x14]
4:EDC5  9ada1dcfec           lcall 0xeccf, 0x1dda  ; RegObj::makeCurrent@s3:1DDA
loc_EDCA:
4:EDCA  66ff7606             push dword ptr [bp + 6]
4:EDCE  9ac49284ec           lcall 0xec84, 0x92c4  ; Layer::~Layer@s5:92C4
4:EDD3  c9                   leave
4:EDD4  ca0400               retf 4
4:EDD7  db 00

; ---------------- ShipLayer::onNotify@s4:EDD8 FAR size=146 callers=0
;   apis: USER.InvalidateRect
;   (vslot 1) redraws the current picture
4:EDD8  c8140000             enter 0x14, 0
4:EDDC  8b460a               mov ax, word ptr [bp + 0xa]
4:EDDF  eb7d                 jmp 0xee5e
4:EDE1  db 90
loc_EDE2:
4:EDE2  c45e06               les bx, ptr [bp + 6]
4:EDE5  6626c7471400000000   mov dword ptr es:[bx + 0x14], 0
4:EDEE  c9                   leave
4:EDEF  ca0600               retf 6
loc_EDF2:
4:EDF2  8d46fe               lea ax, [bp - 2]
4:EDF5  16                   push ss
4:EDF6  50                   push ax
4:EDF7  8d4efc               lea cx, [bp - 4]
4:EDFA  16                   push ss
4:EDFB  51                   push cx
4:EDFC  668b5606             mov edx, dword ptr [bp + 6]
4:EE00  83c218               add dx, 0x18
4:EE03  6652                 push edx
4:EE05  9a943e22ee           lcall 0xee22, 0x3e94  ; Pos3::getXY@s2:3E94
4:EE0A  c45e06               les bx, ptr [bp + 6]
4:EE0D  6626ff7714           push dword ptr es:[bx + 0x14]
4:EE12  9a662bbbed           lcall 0xedbb, 0x2b66  ; PictureCache::current@s3:2B66
4:EE17  8946f8               mov word ptr [bp - 8], ax
4:EE1A  8956fa               mov word ptr [bp - 6], dx
4:EE1D  52                   push dx
4:EE1E  50                   push ax
4:EE1F  9a72479eec           lcall 0xec9e, 0x4772  ; DIB::rect@s2:4772
4:EE24  8946f4               mov word ptr [bp - 0xc], ax
4:EE27  8956f6               mov word ptr [bp - 0xa], dx
4:EE2A  8b46fe               mov ax, word ptr [bp - 2]
4:EE2D  8946ec               mov word ptr [bp - 0x14], ax
4:EE30  8b4efc               mov cx, word ptr [bp - 4]
4:EE33  894eee               mov word ptr [bp - 0x12], cx
4:EE36  c45ef4               les bx, ptr [bp - 0xc]
4:EE39  26034704             add ax, word ptr es:[bx + 4]
4:EE3D  8946f0               mov word ptr [bp - 0x10], ax
4:EE40  26034f08             add cx, word ptr es:[bx + 8]
4:EE44  894ef2               mov word ptr [bp - 0xe], cx
4:EE47  c45e06               les bx, ptr [bp + 6]
4:EE4A  26ff7704             push word ptr es:[bx + 4]
4:EE4E  8d46ec               lea ax, [bp - 0x14]
4:EE51  16                   push ss
4:EE52  50                   push ax
4:EE53  6a00                 push 0
4:EE55  9a595d0000           lcall 0, 0x5d59  ; USER.InvalidateRect
4:EE5A  c9                   leave
4:EE5B  ca0600               retf 6
loc_EE5E:
4:EE5E  48                   dec ax
4:EE5F  7481                 je 0xede2
4:EE61  2d0b00               sub ax, 0xb
4:EE64  748c                 je 0xedf2
4:EE66  c9                   leave
4:EE67  ca0600               retf 6
